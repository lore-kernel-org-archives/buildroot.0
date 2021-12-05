Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F803C433EF
	for <buildroot@archiver.kernel.org>; Sun,  5 Dec 2021 16:03:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C159A400D3;
	Sun,  5 Dec 2021 16:03:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VPbx-TdywR3n; Sun,  5 Dec 2021 16:03:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CE0E2401C4;
	Sun,  5 Dec 2021 16:03:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C6CD01BF57C
 for <buildroot@lists.busybox.net>; Sun,  5 Dec 2021 16:03:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C2EA640274
 for <buildroot@lists.busybox.net>; Sun,  5 Dec 2021 16:03:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Vy0FR-Yagulr for <buildroot@lists.busybox.net>;
 Sun,  5 Dec 2021 16:03:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C3E0540271
 for <buildroot@buildroot.org>; Sun,  5 Dec 2021 16:03:14 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id v1so33029075edx.2
 for <buildroot@buildroot.org>; Sun, 05 Dec 2021 08:03:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=pzlTHeH04ioJ5LdrzTgRS77w7/dRUJiDng+H7735UNQ=;
 b=Wi7Czm747hUB1ec9S3vE79ceoDnf1KTrui0S2GBdqhkRumyPyTSg0uDwK/C3CKOUp2
 A49gukGxk4y8C2obONp5V7CgmUWvdwFOpJ2YXTBs7Gig2DcbfTYAPTqnqro7laHkp0HJ
 mAdc6KxVau6aPihJLnF9GqtWmCnO4hAUpUIr4kn0wTP+AzCwY+S5AZ1sR3cKDLOFiCvY
 8lba9IWGKYIjvAsirQ318lhvcrv6m4IDenIXCWXd9OuvertfSSwEIf74/O+8zaWlO1of
 tFdWGW04tp02mNBLeigMXXrMZ/d4POPfUVG6buEIEQKQHd9g4P40UhSQqwLpMCq7mwHR
 1M4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=pzlTHeH04ioJ5LdrzTgRS77w7/dRUJiDng+H7735UNQ=;
 b=At8G4kSb6zOrsWQ+OdU9v71SspcWTg2gwThpoDbTo9PLOQAL7nau8bJISwfxiozCGN
 vDuf5ECg7vNLkRC22aIVob9LJFSGnbtbwJj31jauXgmEt9gvkyQYwyIlHq7xjWg52Szu
 ZjTlKNLsQATneVcKwGc4CB5qTR8EiwNI2hbj6hXIMOdQR4dw+56nm0ZAKGJqlJCmIs5d
 6LQ1w/5WOhnQmf6uAuaDNvIQtR1uPpdr2MNmH2yIfuMR6OWNu/6Agi6GvIYhKkMeB4ls
 29AgpKJkWN6LNOsn8QIfdeu+PUXi+wAX/z9VEQORarupzF3FodBOXB7Y4c5ptiL2ANXu
 2R2w==
X-Gm-Message-State: AOAM533pv/asDGU1lkFBN1S5W7cH7O9Kf1ObUXjEU7Bpr0ufb4zLBb9s
 X2LC7e2qxcYtqrzbCotlqUlLkw==
X-Google-Smtp-Source: ABdhPJzZlw35ibW+n64tD0/joUW0OJuX48Ropv3QjS+beBRLU9GQPqxKnzSXZ/E1HfSXrR2rI0u0ZA==
X-Received: by 2002:a05:6402:1450:: with SMTP id
 d16mr46419845edx.144.1638720192881; 
 Sun, 05 Dec 2021 08:03:12 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id r24sm6046623edv.18.2021.12.05.08.03.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 05 Dec 2021 08:03:12 -0800 (PST)
Message-ID: <7b25b9cb-237b-6559-b780-5e5d846fd5fe@mind.be>
Date: Sun, 5 Dec 2021 17:03:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: Ricardo Martincoski <ricardo.martincoski@gmail.com>,
 buildroot@buildroot.org
References: <20211123103801.114861-1-ricardo.martincoski@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211123103801.114861-1-ricardo.martincoski@gmail.com>
Subject: Re: [Buildroot] [PATCH-master] package/stress-ng: fix broken URL
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Romain Naour <romain.naour@gmail.com>,
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAyMy8xMS8yMDIxIDExOjM4LCBSaWNhcmRvIE1hcnRpbmNvc2tpIHdyb3RlOgo+IEZyb206
IFPDqWJhc3RpZW4gU3p5bWFuc2tpIDxzZWJhc3RpZW4uc3p5bWFuc2tpQGFybWFkZXVzLmNvbT4K
PiAKPiBEbyB0aGUgc2FtZSBhcyBjb21taXQgIjEyYzAxMDc5YmQgcGFja2FnZS9zdHJlc3Mtbmc6
IGJ1bXAgdG8gdmVyc2lvbgo+IDAuMTMuMDUiIGRpZCBmb3IgMjAyMi4wMiBidXQgd2l0aG91dCB0
aGUgdmVyc2lvbiBidW1wLgo+IAo+IFRoZSBwcm9qZWN0IFVSTCByZXR1cm5zIDQwNCBlcnJvciBi
ZWNhdXNlOgo+IAo+IFF1b3RpbmcgQ29saW5nIEtpbmc6Cj4gIlVuZm9ydHVuYXRlbHkgd2hlbiBJ
IGxlZnQgQ2Fub25pY2FsIGxhc3Qgd2VlayB0aGV5IHJlbW92ZWQgbXkgdGFyYmFsbHMiCj4gCj4g
U28gdXNlIGdpdGh1YiBhbmQgdXBkYXRlIGhhc2guCj4gCj4gU2lnbmVkLW9mZi1ieTogU8OpYmFz
dGllbiBTenltYW5za2kgPHNlYmFzdGllbi5zenltYW5za2lAYXJtYWRldXMuY29tPgo+IENjOiBB
cm5vdXQgVmFuZGVjYXBwZWxsZSAoRXNzZW5zaXVtL01pbmQpIDxhcm5vdXRAbWluZC5iZT4KPiBb
UmljYXJkbzogZG8gbm90IGJ1bXAgdGhlIHZlcnNpb24uCj4gICBUaGVyZSB3aWxsIGJlIG5vIHZl
cnNpb24gY2xhc2ggYXQgc291cmNlcy5idWlsZHJvb3QubmV0IHNpbmNlIHRoZSBmaWxlCj4gICBm
b3JtYXQgY2hhbmdlZF0KPiBTaWduZWQtb2ZmLWJ5OiBSaWNhcmRvIE1hcnRpbmNvc2tpIDxyaWNh
cmRvLm1hcnRpbmNvc2tpQGRhdGFjb20uY29tLmJyPgo+IENjOiBSb21haW4gTmFvdXIgPHJvbWFp
bi5uYW91ckBnbWFpbC5jb20+CgogIEFwcGxpZWQgdG8gbWFzdGVyLCB0aGFua3MuCgogIFJlZ2Fy
ZHMsCiAgQXJub3V0Cgo+IC0tLQo+IGh0dHBzOi8vZ2l0bGFiLmNvbS9SaWNhcmRvTWFydGluY29z
a2kvYnVpbGRyb290Ly0vcGlwZWxpbmVzLzQxNDUyOTQxMi9idWlsZHMKPiA0MCBwYXNzZWQsIDAg
ZmFpbGVkCj4gdGVzdC1wa2cgY29uZmlnOgo+IEJSMl9QQUNLQUdFX1NUUkVTU19ORz15Cj4gLS0t
Cj4gICBwYWNrYWdlL3N0cmVzcy1uZy9Db25maWcuaW4gICAgICB8IDIgKy0KPiAgIHBhY2thZ2Uv
c3RyZXNzLW5nL3N0cmVzcy1uZy5oYXNoIHwgMiArLQo+ICAgcGFja2FnZS9zdHJlc3Mtbmcvc3Ry
ZXNzLW5nLm1rICAgfCAzICstLQo+ICAgMyBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyks
IDQgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2Uvc3RyZXNzLW5nL0NvbmZp
Zy5pbiBiL3BhY2thZ2Uvc3RyZXNzLW5nL0NvbmZpZy5pbgo+IGluZGV4IDY0YjQ3M2I3NWMuLjgz
OWNiYjFjYzAgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9zdHJlc3MtbmcvQ29uZmlnLmluCj4gKysr
IGIvcGFja2FnZS9zdHJlc3MtbmcvQ29uZmlnLmluCj4gQEAgLTEyLDcgKzEyLDcgQEAgY29uZmln
IEJSMl9QQUNLQUdFX1NUUkVTU19ORwo+ICAgCSAgc3Vic3lzdGVtcyBvZiBhIGNvbXB1dGVyIGFz
IHdlbGwgYXMgdGhlIHZhcmlvdXMgb3BlcmF0aW5nCj4gICAJICBzeXN0ZW0ga2VybmVsIGludGVy
ZmFjZXMuCj4gICAKPiAtCSAgaHR0cDovL2tlcm5lbC51YnVudHUuY29tL35ja2luZy9zdHJlc3Mt
bmcvCj4gKwkgIGh0dHBzOi8vZ2l0aHViLmNvbS9Db2xpbklhbktpbmcvc3RyZXNzLW5nCj4gICAK
PiAgIGNvbW1lbnQgInN0cmVzcy1uZyBuZWVkcyBhIHRvb2xjaGFpbiB3LyBoZWFkZXJzID49IDMu
MyIKPiAgIAlkZXBlbmRzIG9uICFCUjJfbmlvczIgJiYgIUJSMl9hcmMKPiBkaWZmIC0tZ2l0IGEv
cGFja2FnZS9zdHJlc3Mtbmcvc3RyZXNzLW5nLmhhc2ggYi9wYWNrYWdlL3N0cmVzcy1uZy9zdHJl
c3MtbmcuaGFzaAo+IGluZGV4IGYzZWI3NmZhODIuLmJiZGNkMTU1YzggMTAwNjQ0Cj4gLS0tIGEv
cGFja2FnZS9zdHJlc3Mtbmcvc3RyZXNzLW5nLmhhc2gKPiArKysgYi9wYWNrYWdlL3N0cmVzcy1u
Zy9zdHJlc3MtbmcuaGFzaAo+IEBAIC0xLDMgKzEsMyBAQAo+ICAgIyBMb2NhbGx5IGNhbGN1bGF0
ZWQKPiAtc2hhMjU2ICBmMzdmNzM5ZTRkMTUzNDMzNjBhNDc5ODBiNjdkYzhiMmE2YmYzZDRkM2Vm
NzI3ZDU1ZTJkZDk5YTBiNjRmOWVhICBzdHJlc3MtbmctMC4xMy4wMS50YXIueHoKPiArc2hhMjU2
ICAxOTczYjE0MmI5YjczMTk1MmRkNGNlNzdjMzYxOGE3ZTNjNjI0OTQ1ODdlMjNiZjM3Yzg2ODM1
MDNkMDQ4ZjY4ICBzdHJlc3MtbmctMC4xMy4wMS50YXIuZ3oKPiAgIHNoYTI1NiAgODE3N2Y5NzUx
MzIxMzUyNmRmMmNmNjE4NGQ4ZmY5ODZjNjc1YWZiNTE0ZDRlNjhhNDA0MDEwNTIxYjg4MDY0MyAg
Q09QWUlORwo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3N0cmVzcy1uZy9zdHJlc3MtbmcubWsgYi9w
YWNrYWdlL3N0cmVzcy1uZy9zdHJlc3MtbmcubWsKPiBpbmRleCBlMGIzODVlNzU2Li41NDU3MjM4
M2M0IDEwMDY0NAo+IC0tLSBhL3BhY2thZ2Uvc3RyZXNzLW5nL3N0cmVzcy1uZy5tawo+ICsrKyBi
L3BhY2thZ2Uvc3RyZXNzLW5nL3N0cmVzcy1uZy5tawo+IEBAIC01LDggKzUsNyBAQAo+ICAgIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMKPiAgIAo+ICAgU1RSRVNTX05HX1ZFUlNJT04gPSAwLjEzLjAx
Cj4gLVNUUkVTU19OR19TT1VSQ0UgPSBzdHJlc3MtbmctJChTVFJFU1NfTkdfVkVSU0lPTikudGFy
Lnh6Cj4gLVNUUkVTU19OR19TSVRFID0gaHR0cHM6Ly9rZXJuZWwudWJ1bnR1LmNvbS9+Y2tpbmcv
dGFyYmFsbHMvc3RyZXNzLW5nCj4gK1NUUkVTU19OR19TSVRFID0gJChjYWxsIGdpdGh1YixDb2xp
bklhbktpbmcsc3RyZXNzLW5nLFYkKFNUUkVTU19OR19WRVJTSU9OKSkKPiAgIFNUUkVTU19OR19M
SUNFTlNFID0gR1BMLTIuMCsKPiAgIFNUUkVTU19OR19MSUNFTlNFX0ZJTEVTID0gQ09QWUlORwo+
ICAgCj4gCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1
aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0
cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
