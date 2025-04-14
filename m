Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13B14C369A2
	for <buildroot@archiver.kernel.org>; Mon, 14 Apr 2025 17:12:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9A0A960B1A;
	Mon, 14 Apr 2025 17:12:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q_esNrFdTAx3; Mon, 14 Apr 2025 17:12:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B06D360AAA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B06D360AAA;
	Mon, 14 Apr 2025 17:12:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7E18F1F7
 for <buildroot@buildroot.org>; Mon, 14 Apr 2025 17:12:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6EF7A4088F
 for <buildroot@buildroot.org>; Mon, 14 Apr 2025 17:12:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PbCCmYvcBZAK for <buildroot@buildroot.org>;
 Mon, 14 Apr 2025 17:12:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.15;
 helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2E42440248
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2E42440248
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2E42440248
 for <buildroot@buildroot.org>; Mon, 14 Apr 2025 17:12:37 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([89.1.210.117]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M2O2W-1u1dXQ2dtm-00EzmZ; Mon, 14
 Apr 2025 19:12:34 +0200
Date: Mon, 14 Apr 2025 19:12:34 +0200
To: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Cc: buildroot@buildroot.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?utf-8?Q?Miqu=C3=A8l?= Raynal <miquel.raynal@bootlin.com>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Eric Le Bihan <eric.le.bihan.dev@free.fr>
Message-ID: <Z_1CAle9fM33Yd4c@probook>
References: <20250106-fix_mpv-v2-1-85117ce7b16b@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250106-fix_mpv-v2-1-85117ce7b16b@bootlin.com>
X-Provags-ID: V03:K1:x5bQlHtX4fy9/wkdd4h9OHDqpwsCoP9IWZoNtIMW8zRud95If9C
 AG0blfc6o6OQGUFI5BgvPk07LJQHBIgqq2EEBToEpBJY0yQ5yNviHMlxUpQPDP9sFV4kc6i
 XsV/1l5PnV6agcU/0UTgCZYw5vwetc0l5dAWprOjve3XCwX1mODjVkQTEhU2B38tZxkdmol
 7wYYNztpQxBaW+CmMjjVA==
UI-OutboundReport: notjunk:1;M01:P0:83j29v99zyo=;n46dPGIYM15Du/6LdXb/vOpdqeU
 o1Jkyoma3wL8zb6jIrB61kqqE8nNnOeSUJarOISkpjY5WSAQ3vX8rL8jw6RQpfmrnyKinuNFb
 BWo/ZdALOiZFWEJl4B4iX+KEAnbInyKy59VFCa6Dd8KJQRFmBYen+7K+ONpzaMcqwN50jis8d
 5S6geooXQuPp53JeaJPrW9y19UPuR7T6DmPvBcrpRQ14pI0xcMVlfB6NH4egGRqSQVwrBV3lF
 kSBCa6MK18ZyfxvzJHiCa65qmDrJMPYDRtSHQJvnO5Xb0GpsTXienpzP4lsx1KhdZKyTo9ahz
 CKE4FYvbsRvdDO1cq9Wp6SK93mw0/6wjAbdFeL6lrlxmCruA0LQjTGsS53mCOewBi8CeQxaSc
 4TbNZgzMSqdDGqjpt2iOmtCgqn0WtgZ1GtQCi5+0iLyVF6CvZSJgRShc02XrogdYaRu4Qk7Rl
 TLqTTtb+q70Uz9NbCIFlshlrvyzccpFmytXbnWea+BKx3oUwXpLEb6g1uRFZ16PMq6XYNLN7w
 1qHI5KC46CgAJlXBPviZSYLQeh92Hq8vc+KY1ddlc7Mijkng8jQuaVpacGt2moX/vK/+FKhA1
 orVAP9VBieRJYHw/TsLrx7/+EaCG2aksrgIDOp5OLsxFpdk4uj0u88DgO58L76G0IBYL23FzA
 akUQOEx07bgF3uE6KEKi81awaptRu6pf5G4WBiN2Km+jXyhBHsSNhzH9kDu+s9VnrluniJfU/
 0IAG1zSx82LcU29UukNPCvQNKe/PvTji0FtGU9Xn92N4AHnncb7CqHAXy7Io/cvXLkopzJGio
 brKYPLcwgeuTikzUXXTPnwlLobHLHwyNl9SYpYmNrEbHoINWC87lS7BJ81L7FxcnHgLFctqLP
 ShcNsH0TAHa1pteJLnf+k4qrnljNDDa3X4rMHsJCgWTdWH0D9hhGbq4Q3TTHWRPPx6XDHv09r
 2YfSn2usT7i5O3jpnxo3icslvqR/2f3G4iKmvrrINMhHpLuaFuyEmlCC2/1RJPT4SSPZVv0ay
 6FTksQqK9qnfTIleckZAGa222Z14Kd2vlD5Y7d92pvBc356Hum2tgTR3SWzj/yqWUD+0JO53E
 vkR2Stx52eUjwirLKf+5gXthiXPKmQL2IfE4RGKgalc0jL/RrwC5wH0Fx1QlAtsprCbesC/LW
 ty6GqBFwa2qpCpdZWk8URhotajvFGtc23A9ntsbo0TxVhQ5Y+yXw5uH9uX24ppBW4DorT5s5u
 ACLaZDETi7FtPTt/FCe6B0r4rYng/hRKChehl7jtQ3hFZ+wz9Z1uCRQxiUQqcRlmlnIczcV6h
 uHLXUZt2em/gfeiWsYRhdJtsYu2/916BruBtx54esbQ1j1TNs7cMDT5BERoK9KfMkyK7/dRmD
 05UzT/Kqb32duPnM7GbtuxhxJufelEAf6bNft3TbM4VADdB0WTmip5M5eZt2pL/EikK3UzAKU
 /oxYAfsrDGsPM396qydb7OpTCo0eBOzH4PGNWm9ymPo1DSkgv8KpOvaxF5aibD1ke16LloEeE
 LbzdIPQC2BbcoEnZ1JA=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1744650754; x=1745255554; i=j.neuschaefer@gmx.net;
 bh=RllUD4rdLS0EyFeMSMyRnGWM+C/7G5/WepdCfK/AaWM=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:Message-ID:References:
 MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=uP4QApZNbt0jZ/BqBTaMJPZvLVZvfZW/AaXalalK0eiaZMUWmi7gFcrdalMBsdyq
 nYRRGq8uNaIFAdzU6diXTTgA78LxGqq5W3pVY+yL8PWDGyUq9ip0NQ0t7MtDYmO4b
 whFftMsxl2IGdaygTaW4Rm5wK9pj0jQRkKHdnpvWtms1v/nzu70CLxRKIS1nT4szd
 NvS5Vhs42cSC2VsqpEWo7R4GLZ8dHNSgU8gM0KzQaFiKSsXtYsjuHJb8s74Q/cqlP
 L5tHcccLIfnlL084Jw/soaOI1Yt38AnRYVbUeAZFB1houKMlEurBqAtxKbYV0sfpu
 07eHsYVRUzaaKbMsyw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=j.neuschaefer@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=uP4QApZN
Subject: Re: [Buildroot] [PATCH v2] package/mpv: switch to meson from waf
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gVGhvbWFzLAoKT24gTW9uLCBKYW4gMDYsIDIwMjUgYXQgMTI6MjM6NDlBTSArMDEwMCwg
VGhvbWFzIEJvbm5lZmlsbGUgdmlhIGJ1aWxkcm9vdCB3cm90ZToKPiBTaW5jZSBjb21taXQgZmQ1
NjIzMTUsIHdoaWNoIHVwZGF0ZWQgd2FmIHRvIHYyLjEuMSwgQnVpbGRyb290IGhhcwo+IGVuY291
bnRlcmVkIGlzc3VlcyBidWlsZGluZyBtcHYsIGxpa2VseSBkdWUgdG8gYW4gb3V0ZGF0ZWQgdmVy
c2lvbiBvZgo+IHRoZSB3YWYgYnVpbGQgc3lzdGVtLgo+Cj4gU3RhcnRpbmcgd2l0aCBtcHYgdjAu
MzUsIG1lc29uIHdhcyBpbnRyb2R1Y2VkIGFzIGFuIGFsdGVybmF0aXZlIHRvIHdhZiwKPiBhbmQg
aW4gbXB2IHYwLjM3LCB3YWYgd2FzIGNvbXBsZXRlbHkgcmVtb3ZlZC4KPgo+IFRoaXMgY29tbWl0
IHVwZGF0ZXMgdGhlIG1wdiBtYWtlZmlsZSB0byB1c2UgbWVzb24sIHJlc29sdmluZyB0aGUgYnVp
bGQKPiBpc3N1ZXMgYW5kIHNpbXBsaWZ5aW5nIGZ1dHVyZSB1cGRhdGVzIHRvIG5ld2VyIHZlcnNp
b25zIG9mIG1wdi4KPgo+IEFsbCBvcHRpb25zIHByZXZpb3VzbHkgdXNlZCBmb3IgV2FmIGhhdmUg
YmVlbiB0cmFuc2xhdGVkIHRvIHRoZSBuZXcKPiBidWlsZCBzeXN0ZW0gYnkgcmVwbGFjaW5nIGAt
LWRpc2FibGUtZmVhdHVyZWAgd2l0aCBgLURmZWF0dXJlPWRpc2FibGVkYAo+IChhbmQgc2ltaWxh
cmx5IGZvciBlbmFibGluZyBmZWF0dXJlcykuIFNvbWUgZmVhdHVyZXMgaGF2ZSBzcGVjaWFsCj4g
aGFuZGxpbmc6Cj4KPiAtIFRoZSBgL3VzcmAgcHJlZml4IGlzIGF1dG9tYXRpY2FsbHkgcGFzc2Vk
IHRvIG1lc29uIHBhY2thZ2VzIGJ5Cj4gICBkZWZhdWx0Lgo+IC0gVGhlIEFuZHJvaWQgZmVhdHVy
ZSAiaGFzIGJlZW4gcmVtb3ZlZCBzaW5jZSBtZXNvbiBjYW4gZGV0ZWN0IGlmIGEKPiAgIG1hY2hp
bmUgaXMgQW5kcm9pZCJbMV0uCj4gLSBUaGUgYGxpYm1wdmAgcGFyYW1ldGVyIGhhcyBiZWVuIGVu
YWJsZWQgaW4gdGhlIG1ha2VmaWxlIGFzIGBsaWJtcHZgCj4gICBtdXN0IGJlIGJ1aWx0IGJ5IGRl
ZmF1bHQgd2l0aCBtcHYuCj4gLSBNZXNvbiBwYWNrYWdlcyBhdXRvbWF0aWNhbGx5IHNldCB3aGV0
aGVyIHRoZSBsaWJyYXJ5IHNob3VsZCBiZSBidWlsdAo+ICAgc3RhdGljYWxseSB1c2luZyB0aGUg
YGRlZmF1bHRfbGlicmFyeWAgbWVzb24gcGFyYW1ldGVyLgo+IC0gTWVzb24gYXV0b21hdGljYWxs
eSBkZXRlY3RzIHRoZSBwcmVzZW5jZSBvZiBgbGliYXRvbWljYCBhbmQgcGFzc2VzIHRoZQo+ICAg
Y29ycmVjdCBhcmd1bWVudCB0byB0aGUgbGlua2VyLiBIb3dldmVyLCBpdCBpcyBwb3NzaWJsZSB0
byBzZXQgdGhlCj4gICBgc3RkYXRvbWljYCBtZXNvbiBwYXJhbWV0ZXIgdG8gc3BlY2lmeSB3aGV0
aGVyIGBsaWJhdG9taWNgIG11c3Qgb3IKPiAgIG11c3Qgbm90IGJlIHVzZWQuCj4KPiBGaXhlczoK
PiAgICAgaHR0cHM6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm9yZy9yZXN1bHRzLzY4ZDQyNDQxZmMw
ZGEzNGUxYmYyYTQyNDc3MjZmNWY0ZWMzYjhlNzcvCj4KPiBbMV06IGh0dHBzOi8vZ2l0aHViLmNv
bS9tcHYtcGxheWVyL21wdi9ibG9iLzE0MGVjMjFjODlkNjcxZDM5Mjg3N2E3ZjNiOTFkNjdlN2Q3
YjkyMzkvRE9DUy9idWlsZC1zeXN0ZW0tZGlmZmVyZW5jZXMubWQ/cGxhaW49MSNMNDgKPgo+IFNp
Z25lZC1vZmYtYnk6IFRob21hcyBCb25uZWZpbGxlIDx0aG9tYXMuYm9ubmVmaWxsZUBib290bGlu
LmNvbT4KCkknbSB0cnlpbmcgdG8gdXNlIHRoaXMgcGF0Y2ggb24gdG9wIG9mIGN1cnJlbnQgbWFz
dGVyICgyMDI1LjAyLTI2OC1nNjM3ZWVhZDc1NSkKYW5kIHRoZXJlIHNlZW1zIHRvIGJlIGEgbWlu
b3IgaW5jb21wYXRpYmlsaXR5OgoKb3V0cHV0L2J1aWxkL21wdi0wLjM1LjEvbWVzb24uYnVpbGQ6
MTowOiBFUlJPUjogT3B0aW9uICJidWlsZC1kYXRlIiB2YWx1ZSBkaXNhYmxlZCBpcyBub3QgYm9v
bGVhbiAodHJ1ZSBvciBmYWxzZSkuCgo+ICtNUFZfQ09ORl9PUFRTICs9IC1EYnVpbGQtZGF0ZT1k
aXNhYmxlZAoKV2l0aCB0aGF0IGNoYW5nZWQgdG8gLURidWlsZC1kYXRlPWZhbHNlOgoKVGVzdGVk
LWJ5OiBKLiBOZXVzY2jDpGZlciA8ai5uZUBwb3N0ZW8ubmV0PgoKVGhhbmtzIQpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBs
aXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
