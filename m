Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 328B5C369A2
	for <buildroot@archiver.kernel.org>; Mon, 14 Apr 2025 15:08:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D270A60833;
	Mon, 14 Apr 2025 15:08:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aBTc4FPBSHoN; Mon, 14 Apr 2025 15:08:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 098E060613
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 098E060613;
	Mon, 14 Apr 2025 15:08:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C2AD0DE
 for <buildroot@buildroot.org>; Mon, 14 Apr 2025 15:08:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B40A56082E
 for <buildroot@buildroot.org>; Mon, 14 Apr 2025 15:08:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Mfjx7C2SR_4A for <buildroot@buildroot.org>;
 Mon, 14 Apr 2025 15:08:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.15;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4268E605EC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4268E605EC
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4268E605EC
 for <buildroot@buildroot.org>; Mon, 14 Apr 2025 15:08:39 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.7.2] ([85.22.122.10]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M7sHo-1u0Vw82vTu-00HBhp; Mon, 14
 Apr 2025 17:08:18 +0200
Message-ID: <c45fa3cd-ebc5-4991-8af3-a57b1ae587cd@gmx.de>
Date: Mon, 14 Apr 2025 17:08:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: El Mehdi YOUNES <elmehdi.younes@smile.fr>, buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Joseph Kogut <joseph.kogut@gmail.com>, David Pierret
 <david.pierret@smile.fr>, Danilo Bargen <mail@dbrgn.ch>,
 Graeme Smecher <gsmecher@threespeedlogic.com>,
 James Hilliard <james.hilliard1@gmail.com>, Sam Voss <sam.voss@gmail.com>,
 Torben Voltmer <mail@t-voltmer.net>, Saeed Kazemi <kazemi.ms@gmail.com>,
 Alex Michel <alex.michel@wiedemann-group.com>,
 Leo Yu-Chi Liang <ycliang@andestech.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>
References: <20250403141538.3769560-1-elmehdi.younes@smile.fr>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20250403141538.3769560-1-elmehdi.younes@smile.fr>
X-Provags-ID: V03:K1:6iJgToMr0sfKkaDYyGZ2fo+nwPjfERgdYSmgXWfesvgbHdXs77g
 gS/4pvgNMj3pBeIvWGUq5E2104D8wHSdo+wOD2RE4lmMcJ8hU9z+HEK+IAGYWosY3wBwZ9j
 cdeKMZYGO7d2XADJ0L20SSgzcYtu60f4lDdQqlJTRE6S+wcZqYaazSJvYV7SsdwLIJzFXIq
 9wuMNhCuooAq6xPzgkghQ==
UI-OutboundReport: notjunk:1;M01:P0:q45ADziNUok=;AqcFG9Wg2JQFpqvQPxKh7yMTuAP
 P8M0pkXJ+5kQB5z0kmVf1ZGmTdFwmWdGynmmDKSRPWnS6FkchfFyVSKFM2b8VmUFbBgcU4LVF
 pZ1pe1hgVLmCiMZe3y0dSJ7Ru+E3E0WcHMiWFyzo9q7TURJ1xmWOnT5A/dvkovAhZ8iU7eguW
 ILKzdQKQ7LxG34jAT/cj7rcYq4MXNOzrpbmVg/fMi4f9Iq/nf5aSqyQqNeRM2B3i4ACccOYqU
 OTUspgQwVwvfwXMpC6linrppPovIBnf5O+BhKdPDEmWMy96WlSHZZ+bKZ7cwLXVHvhWld/YwA
 sPtS50bYMh69QCrZmTE8iiiSCEQakEUv1rCUrjg9Ehjtsz716dB3XwXxnPuPXX3WwGkQSjp5x
 CzLRd2K2IGxxndBaSjE1QzUialnASac/vtpOI2iFedaKj2xGqCoY7x3ykg6n7noSQO2IxMkBg
 sfakN6RVZMG80/IlTFv1gLprnm7A62DU5p+3/NYA8k9UVBAWzBIaxdg1rdwl9mWSwACzBzSxx
 qWiXnR57BgCSNvF3AGeuD0kaE5Kt49ODGOQjpMOBpsKxScqkGO8ZjjbRcd69flcywS3cQrjVQ
 UTHv30VkhSbGacA/BzemBvw4k2T08PGoCM12D/wmN7iz6PpsxYvHYJj6IW4BZBjdeZLsjHivD
 /AUvi+R5JJCLabkVOdlUluhGB5feZT6dsBRDesVbtj9rsS8bA+y3WMVzLqwzesmkGxmeY/+op
 ZpzZqcbIIVe3UOsVKv3kJRF8So1VY/IiE3qO14FMStLqBOQ70x0gNrRpOGTtQp12oOkpl/Ks1
 QJRNoA0T0XU8eS9iDxIeamcE+81RDRE4OYSBc1DvbAP6HAJgQ+fPVXj+W+BnTlA+gwWNcpw6D
 4U1Iwvfiefi4l/uthHRjiDV4x4OI21HzULW2wvEMTf0IyNq84If9NP+iRPXmGPVlOVqcHOHRv
 R7ELykbqih1c2gVXZR2AB/aXX+c2Pj5tYs3sTweMK+q5eivNQ6xUKLjmY2OS+ZVp9G4te/2GE
 52jLRsFSzgBmu4M+89MkdlM43egdcqJsLNLnGRiqh5ZL2wiLwmk8Hn3j2r+JLjIEHoRtxwMGK
 WZ4Pb94yGSLqIH5djKx+qP/BPlya/+7ruzVlZyujHst1OO489SjmJx2iZ7tIlNZK/I1DhgTVa
 /kJnEuDjDxzXBs/FoDhq2e2rSNX6vNlDcB9ntdDWQXf33AllHVYyapgjRCcLc53XnbWRp+8IV
 +VSrAMI5h2xCEqsARy25q54aJsjGfBu3eJj3irdaqqNaXKy/s5kOGIOLfBU6uGV+zBH6wuFuH
 tYEpQixKZBka0wxa111Ww4VAkg+RkflK9s4NK5WPDwJBvlXF5N1TmeL8c4vziQZ+oDTa47QT8
 WtiO2nYiHu797AnUzsRSDzfUf3GAGA/B05O9AcBH64n59e6xchcGKKqLI/hBOtpoF6pgjMGEx
 l0YZznxu81IwBFoyrGIGrH9VaU5cFCiY5+LORkXdJr86GcsvTjHnJuQOyECDXl2L4K4ysWmxb
 NxVaYxDCRNgdLf8sY9I=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1744643298; x=1745248098; i=fiona.klute@gmx.de;
 bh=lEy6tdOCKzoWyR071Qk1ksS20o1VgE4o4eZkbDwutQc=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=SDbZvqK9ABxrvVY0ESO5ZeRuDMhV8FhcWWNAwKZW2U2b1wm/e3zFxBhGb4rQJ5nG
 wXs/bnusOfhjZRe07mWkobI0/q7V+4VhgUoou2JorRoIX2g/xb79BZ9R4RHn3II/d
 UiBQFYpsVIfRQywjT0QFC+4qat2Rw5ShKdY8ZBndxm3w8bVJRhOfrdbJidurnSRAc
 5sztBh2oAZIC/0YwXOVpvOeyEffy0+MtVRLdWkEkd5/j9d6VuzFCfZKs4nYuVlTsP
 chtaSKg85614KG5roWKbtk4u+bF3MRKBt8Fivz4uCmlG/VEm3zsZfiZkJiqBqywaE
 6VM4vIDaWIzwh0ms1A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=SDbZvqK9
Subject: Re: [Buildroot] 
 =?utf-8?q?=5BPATCH_1/4=5D_package/rust=3A_fix_bootst?=
 =?utf-8?q?rap_with_Rust=E2=89=A51=2E83?=
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QW0gMDMuMDQuMjUgdW0gMTY6MTUgc2NocmllYiBFbCBNZWhkaSBZT1VORVMgdmlhIGJ1aWxkcm9v
dDoKPiBSdXN0IGluY2x1ZGVzIGFuIG9wdGlvbiBgZG93bmxvYWQtY2ktbGx2bWAgaW4gY29uZmln
LnRvbWwgdGhhdCBlbmFibGVzCj4gZG93bmxvYWRpbmcgcHJlYnVpbHQgTExWTSBiaW5hcmllcyBm
cm9tIFJ1c3QncyBDSSBpbmZyYXN0cnVjdHVyZSBpbnN0ZWFkCj4gb2YgYnVpbGRpbmcgTExWTSBm
cm9tIHNvdXJjZS4gVGhpcyBvcHRpb24gaGVscHMgc3BlZWQgdXAgdGhlIGJvb3RzdHJhcAo+IHBy
b2Nlc3MgYW5kIGlzIGVuYWJsZWQgYnkgZGVmYXVsdCBzdGFydGluZyBmcm9tIFJ1c3QgMS44My4K
Pgo+IEhvd2V2ZXIsIHN0YXJ0aW5nIGZyb20gY29tbWl0IFsxXSB0aGUgYm9vdHN0cmFwIHByb2Nl
c3MgcGVyZm9ybXMKPiBhIHN0cmljdCBjaGVjayB2aWEgdGhlIGZ1bmN0aW9uCj4gY2hlY2tfaW5j
b21wYXRpYmxlX29wdGlvbnNfZm9yX2NpX2xsdm0oKS4KPgo+IFRoaXMgdmFsaWRhdGlvbiwgaW1w
bGVtZW50ZWQgaW4gdGhlIGZ1bmN0aW9uCj4gY2hlY2tfaW5jb21wYXRpYmxlX29wdGlvbnNfZm9y
X2NpX2xsdm0oKSwgY2hlY2tzIGZvciBhbnkgaW5jb21wYXRpYmxlCj4gY3VzdG9tIG9wdGlvbnMg
c3VjaCBhcyBgbGx2bS5sZGZsYWdzYCwgYGxsdm0uY2ZsYWdzYCwgYHRhcmdldHNgLCBldGMuCj4K
PiBJZiBhbnkgb2YgdGhlc2UgYXJlIHNldCBsb2NhbGx5IGFuZCBkaWZmZXIgZnJvbSB0aGUgdmFs
dWVzIHVzZWQgdG8gYnVpbGQKPiB0aGUgQ0ktcHJvdmlkZWQgTExWTSwgdGhlIGJ1aWxkIGZhaWxz
IGltbWVkaWF0ZWx5IHdpdGggdGhlIGVycm9yOgo+Cj4gICAgRVJST1I6IFNldHRpbmcgYGxsdm0u
bGRmbGFnc2AgaXMgaW5jb21wYXRpYmxlIHdpdGgKPiAgICAgICAgICAgYGxsdm0uZG93bmxvYWQt
Y2ktbGx2bWAuCj4KPiBCdWlsZHJvb3QgZXhwbGljaXRseSBzZXRzIGBsbHZtLmxkZmxhZ3NgIGlu
IHJ1c3QubWsgdG8gZW5zdXJlIHByb3Blcgo+IGhvc3QgbGlua2luZyBkdXJpbmcgdGhlIGJ1aWxk
IG9mIGhvc3QtcnVzdC4gUmVtb3ZpbmcgdGhpcyBzZXR0aW5nIG1heQo+IGludHJvZHVjZSBwb3J0
YWJpbGl0eSBvciByZWxpYWJpbGl0eSBpc3N1ZXMgYWNyb3NzIHRvb2xjaGFpbnMuCj4KPiBUbyBh
ZGRyZXNzIHRoZSBpc3N1ZSB3aXRob3V0IGNvbXByb21pc2luZyB0aGUgYnVpbGQgZW52aXJvbm1l
bnQsIHRoaXMKPiBwYXRjaCBkaXNhYmxlcyB0aGUgdXNlIG9mIENJLXByb3ZpZGVkIExMVk0gYnkg
c2V0dGluZzoKPgo+ICAgIFtsbHZtXQo+ICAgIGRvd25sb2FkLWNpLWxsdm0gPSBmYWxzZQo+Cj4g
VGhpcyBmb2xsb3dzIHRoZSByZWNvbW1lbmRhdGlvbiBmcm9tIHRoZSBSdXN0IGJvb3RzdHJhcCBz
Y3JpcHQgaXRzZWxmLgo+Cj4gTm90ZTogdGhpcyBpcyBhIHRlbXBvcmFyeSB3b3JrYXJvdW5kIHRv
IHJlc3RvcmUgY29tcGF0aWJpbGl0eSB3aXRoIFJ1c3QKPiDiiaUxLjgzLiBPdGhlciBzb2x1dGlv
bnMgd2lsbCBiZSBpbnZlc3RpZ2F0ZWQgdG8gYXZvaWQgZGlzYWJsaW5nIHRoZSB1c2UKPiBvZiBw
cmVidWlsdCBMTFZNIGluIHRoZSBmdXR1cmUsIHdoaWxlIHByZXNlcnZpbmcgQnVpbGRyb2904oCZ
cyByZXByb2R1Y2libGUKPiBidWlsZCBzZXR1cC4KPgo+IFsxXSBodHRwczovL2dpdGh1Yi5jb20v
cnVzdC1sYW5nL3J1c3QvY29tbWl0LzlkZjc2ODBlY2Y2OThiZjcwODc2MTZiNTk1Nzc0ZWUxMDIz
ZDNjN2IKPgo+IFNpZ25lZC1vZmYtYnk6IEVsIE1laGRpIFlPVU5FUyA8ZWxtZWhkaS55b3VuZXNA
c21pbGUuZnI+CgpUZXN0ZWQgd2l0aCBhYXJjaDY0L211c2wgYnVpbGQuIFBhdGNoIDMgKCJwYWNr
YWdlOiB1cGRhdGUgYWxsIGhhc2hlcwphZnRlciBjYXJnbzMgc3dpdGNoIikgZG9lc24ndCBhcHBs
eSBjbGVhbmx5IG9uIGN1cnJlbnQgbWFzdGVyIGJlY2F1c2UKcGFja2FnZS9weXRob24tbWF0dXJp
biBhbmQgcGFja2FnZS9rbW9uIGhhdmUgYmVlbiB1cGRhdGVkIHNpbmNlIHRoaXMKc2VyaWVzIHdh
cyBzZW50LCBJIGZpeGVkIHRoYXQgbG9jYWxseS4gV2l0aCB0aGF0IGNhdmVhdAoKVGVzdGVkLWJ5
OiBGaW9uYSBLbHV0ZSA8ZmlvbmEua2x1dGVAZ214LmRlPgoKZm9yIHRoZSBzZXJpZXMuCgpUaGFu
a3MsCkZpb25hCgo+IC0tLQo+ICAgcGFja2FnZS9ydXN0L3J1c3QubWsgfCAxICsKPiAgIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+Cj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvcnVzdC9y
dXN0Lm1rIGIvcGFja2FnZS9ydXN0L3J1c3QubWsKPiBpbmRleCAyOWMwMzU5NGQyLi42NDgxZTQw
NTYxIDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvcnVzdC9ydXN0Lm1rCj4gKysrIGIvcGFja2FnZS9y
dXN0L3J1c3QubWsKPiBAQCAtNDgsNiArNDgsNyBAQCBkZWZpbmUgSE9TVF9SVVNUX0NPTkZJR1VS
RV9DTURTCj4gICAJCWVjaG8gJ1t0YXJnZXQuJChSVVNUQ19UQVJHRVRfTkFNRSldJzsgXAo+ICAg
CQllY2hvICdjYyA9ICIkKFRBUkdFVF9DUk9TUylnY2MiJzsgXAo+ICAgCQllY2hvICdbbGx2bV0n
OyBcCj4gKwkJZWNobyAnZG93bmxvYWQtY2ktbGx2bSA9IGZhbHNlJzsgXAo+ICAgCQllY2hvICdu
aW5qYSA9IGZhbHNlJzsgXAo+ICAgCQllY2hvICdsZGZsYWdzID0gIiQoSE9TVF9MREZMQUdTKSIn
OyBcCj4gICAJKSA+ICQoQEQpL2NvbmZpZy50b21sCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBi
dWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2J1aWxkcm9vdAo=
