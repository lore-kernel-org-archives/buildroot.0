Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB8B9C46467
	for <buildroot@archiver.kernel.org>; Sat, 14 Jan 2023 22:51:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 40CA881F1A;
	Sat, 14 Jan 2023 22:51:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 40CA881F1A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yeug7yBD3TCD; Sat, 14 Jan 2023 22:51:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 67C8C81F24;
	Sat, 14 Jan 2023 22:51:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 67C8C81F24
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D9FD01BF3AA
 for <buildroot@lists.busybox.net>; Sat, 14 Jan 2023 22:51:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C1E9B81F24
 for <buildroot@lists.busybox.net>; Sat, 14 Jan 2023 22:51:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C1E9B81F24
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bt8RK8YPY6xm for <buildroot@lists.busybox.net>;
 Sat, 14 Jan 2023 22:51:02 +0000 (UTC)
X-Greylist: delayed 00:23:13 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4AA8281F1A
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4AA8281F1A
 for <buildroot@buildroot.org>; Sat, 14 Jan 2023 22:51:01 +0000 (UTC)
Received: from 91-152-140-132.elisa-laajakaista.fi ([91.152.140.132]
 helo=momiji.lan) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA512__AES_256_GCM:256) (Exim)
 id 1pGp03-008Hwn-Kp; Sat, 14 Jan 2023 23:27:43 +0100
Received: from localhost (momiji.lan [local])
 by momiji.lan (OpenSMTPD) with ESMTPA id 0f0280f2;
 Sat, 14 Jan 2023 22:27:40 +0000 (UTC)
Date: Sun, 15 Jan 2023 00:27:36 +0200
Message-ID: <20230115002736.GB4180176@igalia.com>
From: Adrian Perez de Castro <aperez@igalia.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
In-Reply-To: <20230114175446.1352883-1-fontaine.fabrice@gmail.com>
References: <20230114175446.1352883-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Type:MIME-Version:References:In-Reply-To:Subject:Cc:To:
 From:Message-ID:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=dUDNmDlclaQ31rBURysrWZG7GD8JiUqHrAybj9fU0L0=; b=bUKiTHXSKLn8pzoqGbVMwVDzeC
 ebDnbLaErviI/PLL+Y9nP48iN/BC1zWDSLRcJs7lWnJUF+H0wxnISZe6BSACUp+z9UvFmyxNoFWGn
 CxmKNzvB7WljHENTTSoRB1oeb1BBIjWnDXyPhSeBJ9KR/SF71iyzXctY2Ag0XN9VmsMmCLd7yFdOD
 GwSPp1BQ9qMG4jAxu4gxJ1bQHIlTIyCe1WIP1tgmpxZXDo0VFlYOUPKLRKTaBCsSI+vA6b75BYu2t
 OBsJCgj3F6C6UfCVlt2yqNsy0jjYE2F3CdlIc1vYdXxjmZv6PKDlGhtCM+IN9ZCtle7cA7lbHIEZS
 2ZLQOTxg==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com
 header.a=rsa-sha256 header.s=20170329 header.b=bUKiTHXS
Subject: Re: [Buildroot] [PATCH 1/1] package/libpsl: bump to version 0.21.2
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============0632720056725122520=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============0632720056725122520==
Content-Type: multipart/signed; boundary="fMsjqEC0FMuyrac2"; micalg="pgp-ripemd160"; protocol="application/pgp-signature"


--fMsjqEC0FMuyrac2
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: base64

SGksCgpDaGFuZ2VzIExHVE0uCgpPbiBTYXQsIDE0IEphbiAyMDIzIDE4OjU0OjQ2ICswMTAwIEZh
YnJpY2UgRm9udGFpbmUgPGZvbnRhaW5lLmZhYnJpY2VAZ21haWwuY29tPiB3cm90ZToKPiAtIERy
b3AgcGF0Y2ggKGFscmVhZHkgaW4gdmVyc2lvbikKPiAtIFVwZGF0ZSBoYXNoIG9mIENPUFlJTkcg
KHVwZGF0ZSBpbiB5ZWFyOgo+ICAgaHR0cHM6Ly9naXRodWIuY29tL3JvY2tkYWJvb3QvbGlicHNs
L2NvbW1pdC85MjdiMjAyYzY5YmNkOWJlNGMzMGJhNTFjNzQ5MjVmMjU3NWUxYTY5KQo+IC0gYnVp
bHRpbiBpcyBhIGJvb2xlYW4gc2luY2UKPiAgIGh0dHBzOi8vZ2l0aHViLmNvbS9yb2NrZGFib290
L2xpYnBzbC9jb21taXQvYWE0OTA5NzY2YzI0YzE3YmQxZDkwMDBjYTQxOWY2ZGM2YjMyYzIzOAo+
IAo+IGh0dHBzOi8vZ2l0aHViLmNvbS9yb2NrZGFib290L2xpYnBzbC9yZWxlYXNlcy90YWcvMC4y
MS4yCj4gCj4gU2lnbmVkLW9mZi1ieTogRmFicmljZSBGb250YWluZSA8Zm9udGFpbmUuZmFicmlj
ZUBnbWFpbC5jb20+CgpSZXZpZXdlZC1ieTogQWRyaWFuIFBlcmV6IGRlIENhc3RybyA8YXBlcmV6
QGlnYWxpYS5jb20+Cgo+IC0tLQo+ICAuLi5kZC1saWJpY29udi1kZXAtdG8tbWVzb24tYnVpbGQt
YWdhaW4ucGF0Y2ggfCA2MCAtLS0tLS0tLS0tLS0tLS0tLS0tCj4gIHBhY2thZ2UvbGlicHNsL2xp
YnBzbC5oYXNoICAgICAgICAgICAgICAgICAgICB8ICA0ICstCj4gIHBhY2thZ2UvbGlicHNsL2xp
YnBzbC5tayAgICAgICAgICAgICAgICAgICAgICB8ICA5ICstLQo+ICAzIGZpbGVzIGNoYW5nZWQs
IDcgaW5zZXJ0aW9ucygrKSwgNjYgZGVsZXRpb25zKC0pCj4gIGRlbGV0ZSBtb2RlIDEwMDY0NCBw
YWNrYWdlL2xpYnBzbC8wMDAxLUFkZC1saWJpY29udi1kZXAtdG8tbWVzb24tYnVpbGQtYWdhaW4u
cGF0Y2gKPiAKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9saWJwc2wvMDAwMS1BZGQtbGliaWNvbnYt
ZGVwLXRvLW1lc29uLWJ1aWxkLWFnYWluLnBhdGNoIGIvcGFja2FnZS9saWJwc2wvMDAwMS1BZGQt
bGliaWNvbnYtZGVwLXRvLW1lc29uLWJ1aWxkLWFnYWluLnBhdGNoCj4gZGVsZXRlZCBmaWxlIG1v
ZGUgMTAwNjQ0Cj4gaW5kZXggNzJmNTBhYTU5My4uMDAwMDAwMDAwMAo+IC0tLSBhL3BhY2thZ2Uv
bGlicHNsLzAwMDEtQWRkLWxpYmljb252LWRlcC10by1tZXNvbi1idWlsZC1hZ2Fpbi5wYXRjaAo+
ICsrKyAvZGV2L251bGwKPiBAQCAtMSw2MCArMCwwIEBACj4gLUZyb20gNWI2MzgxNmU4MjI4Nzgw
OGU4MWI4NjAzYTUyOGFmM2NjNmZhYjM1NCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKPiAtRnJv
bTogWmhhbyBaaGlsaSA8emhpbGl6aGFvQHRlbmNlbnQuY29tPgo+IC1EYXRlOiBUaHUsIDcgSmFu
IDIwMjEgMjA6NTk6MTcgKzA4MDAKPiAtU3ViamVjdDogW1BBVENIXSBBZGQgbGliaWNvbnYgZGVw
IHRvIG1lc29uIGJ1aWxkIGFnYWluCj4gLQo+IC1CdWlsZCBzdWNjZXNzIG9uIG1hY09TIGFuZCB1
YnVudHUuCj4gLQo+IC1bUmV0cmlldmVkIGZyb206Cj4gLWh0dHBzOi8vZ2l0aHViLmNvbS9yb2Nr
ZGFib290L2xpYnBzbC9jb21taXQvNWI2MzgxNmU4MjI4NzgwOGU4MWI4NjAzYTUyOGFmM2NjNmZh
YjM1NF0KPiAtU2lnbmVkLW9mZi1ieTogRmFicmljZSBGb250YWluZSA8Zm9udGFpbmUuZmFicmlj
ZUBnbWFpbC5jb20+Cj4gLS0tLQo+IC0gbWVzb24uYnVpbGQgICAgIHwgMTQgKysrKysrKysrKysr
KysKPiAtIHNyYy9tZXNvbi5idWlsZCB8ICAyICstCj4gLSAyIGZpbGVzIGNoYW5nZWQsIDE1IGlu
c2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiAtCj4gLWRpZmYgLS1naXQgYS9tZXNvbi5idWls
ZCBiL21lc29uLmJ1aWxkCj4gLWluZGV4IGYyNDgxNzEuLmZiMmRlMzEgMTAwNjQ0Cj4gLS0tLSBh
L21lc29uLmJ1aWxkCj4gLSsrKyBiL21lc29uLmJ1aWxkCj4gLUBAIC0yMCw2ICsyMCw3IEBAIGxp
YmljdV9kZXAgPSBub3Rmb3VuZAo+IC0gbGliaWRuX2RlcCA9IG5vdGZvdW5kCj4gLSBsaWJ1bmlz
dHJpbmcgPSBub3Rmb3VuZAo+IC0gbmV0d29ya2luZ19kZXBzID0gbm90Zm91bmQKPiAtK2xpYmlj
b252X2RlcCA9IG5vdGZvdW5kCj4gLSAKPiAtICMgRklYTUU6IENsZWFudXAgdGhpcyB3aGVuIE1l
c29uIGdldHMgJ2ZlYXR1cmUtY29tYm8nOgo+IC0gIyBodHRwczovL2dpdGh1Yi5jb20vbWVzb25i
dWlsZC9tZXNvbi9pc3N1ZXMvNDU2Ngo+IC1AQCAtODYsNiArODcsMTkgQEAgZW5kaWYKPiAtIGlm
IGxpYmlkbjJfZGVwLmZvdW5kKCkgb3IgbGliaWRuX2RlcC5mb3VuZCgpCj4gLSAgICMgQ2hlY2sg
Zm9yIGxpYnVuaXN0cmluZywgd2UgbmVlZCBpdCBmb3IgcHNsX3N0cl90b191dGY4bG93ZXIoKQo+
IC0gICBsaWJ1bmlzdHJpbmcgPSBjYy5maW5kX2xpYnJhcnkoJ3VuaXN0cmluZycpCj4gLSsgIGZv
dW5kX2ljb252ID0gZmFsc2UKPiAtKyAgaWYgY2MuaGFzX2Z1bmN0aW9uKCdpY29udl9vcGVuJykK
PiAtKyAgICBsaWJpY29udl9kZXAgPSBbXQo+IC0rICAgIGZvdW5kX2ljb252ID0gdHJ1ZQo+IC0r
ICBlbmRpZgo+IC0rICBpZiBub3QgZm91bmRfaWNvbnYgYW5kIGNjLmhhc19oZWFkZXJfc3ltYm9s
KCdpY29udi5oJywgJ2ljb252X29wZW4nKQo+IC0rICAgIGxpYmljb252X2RlcCA9IFtjYy5maW5k
X2xpYnJhcnkoJ2ljb252JyldCj4gLSsgICAgZm91bmRfaWNvbnYgPSB0cnVlCj4gLSsgIGVuZGlm
Cj4gLSsKPiAtKyAgaWYgbm90IGZvdW5kX2ljb252Cj4gLSsgICAgZXJyb3IoJ2ljb252IGltcGxl
bWVudGF0aW9uIG5vdCBmb3VuZCcpCj4gLSsgIGVuZGlmCj4gLSBlbmRpZgo+IC0gCj4gLSBpZiBo
b3N0X21hY2hpbmUuc3lzdGVtKCkgPT0gJ3dpbmRvd3MnCj4gLWRpZmYgLS1naXQgYS9zcmMvbWVz
b24uYnVpbGQgYi9zcmMvbWVzb24uYnVpbGQKPiAtaW5kZXggMGQxZGNkZi4uNzQ2YmY0NCAxMDA2
NDQKPiAtLS0tIGEvc3JjL21lc29uLmJ1aWxkCj4gLSsrKyBiL3NyYy9tZXNvbi5idWlsZAo+IC1A
QCAtMTksNyArMTksNyBAQCBjYXJncyA9IFsKPiAtIGxpYnBzbCA9IGxpYnJhcnkoJ3BzbCcsIHNv
dXJjZXMsIHN1ZmZpeGVzX2RhZnNhX2gsCj4gLSAgIGluY2x1ZGVfZGlyZWN0b3JpZXMgOiBbY29u
ZmlnaW5jLCBpbmNsdWRlZGlyXSwKPiAtICAgY19hcmdzIDogY2FyZ3MsCj4gLS0gIGRlcGVuZGVu
Y2llcyA6IFtsaWJpZG4yX2RlcCwgbGliaWRuX2RlcCwgbGliaWN1X2RlcCwgbGlidW5pc3RyaW5n
LCBuZXR3b3JraW5nX2RlcHNdLAo+IC0rICBkZXBlbmRlbmNpZXMgOiBbbGliaWRuMl9kZXAsIGxp
Ymlkbl9kZXAsIGxpYmljdV9kZXAsIGxpYnVuaXN0cmluZywgbmV0d29ya2luZ19kZXBzLCBsaWJp
Y29udl9kZXBdLAo+IC0gICB2ZXJzaW9uOiBsdF92ZXJzaW9uLAo+IC0gICBpbnN0YWxsOiB0cnVl
LAo+IC0gKQo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2xpYnBzbC9saWJwc2wuaGFzaCBiL3BhY2th
Z2UvbGlicHNsL2xpYnBzbC5oYXNoCj4gaW5kZXggNTUyOTM1ZTllYy4uYTM1YTYwOWZmMiAxMDA2
NDQKPiAtLS0gYS9wYWNrYWdlL2xpYnBzbC9saWJwc2wuaGFzaAo+ICsrKyBiL3BhY2thZ2UvbGli
cHNsL2xpYnBzbC5oYXNoCj4gQEAgLTEsNiArMSw2IEBACj4gICMgTG9jYWxseSBnZW5lcmF0ZWQK
PiAtc2hhMjU2ICBhYzZjZTFlMWZiZDRkMDI1NGM0ZGRiOWQzN2YxZmE5OWRlYzgzNjE5YzEyNTMz
MjgxNTUyMDZiODk2MjEwZDRjICBsaWJwc2wtMC4yMS4xLnRhci5nego+ICtzaGEyNTYgIGUzNTk5
MWI2ZTE3MDAxYWZhMmMwY2EzYjEwYzM1NzY1MDYwMmI5MjU5NjIwOWI3NDkyODAyZjM3NjhhNjI4
NWYgIGxpYnBzbC0wLjIxLjIudGFyLmd6Cj4gIAo+ICAjIEhhc2hlcyBmb3IgbGljZW5zZSBmaWxl
czoKPiAtc2hhMjU2ICA3OTAzNDEzZTdhYTBiYmNiNzdhYTE5MTUwYTNmMTAzNGVkYzBhNzYwY2Zm
MTc0ZjlhNTNlZmU0ZGU2ZjA1NmE0ICBDT1BZSU5HCj4gK3NoYTI1NiAgNzc2Y2QxMWQ1NGYwZWEz
ZTVlZmRkMjVmZjFhMGQ5NTJhMTc0NDIxNWJiNTg1OGVhN2FlYjkxODA4ZTcwYzlmNyAgQ09QWUlO
Rwo+ICBzaGEyNTYgIDFkN2Y1Mjc0N2E5MTY5NzUxY2RmMjY0MWE4Mjk5YzAwOThlOWVjZGY5NDI5
Mjk2ZmZkNTViZGIxNGM5ZWQ1YjMgIHNyYy9MSUNFTlNFLmNocm9taXVtCj4gZGlmZiAtLWdpdCBh
L3BhY2thZ2UvbGlicHNsL2xpYnBzbC5tayBiL3BhY2thZ2UvbGlicHNsL2xpYnBzbC5tawo+IGlu
ZGV4IDc0MjExN2U4ZWEuLmVmM2M1MjRiNGYgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9saWJwc2wv
bGlicHNsLm1rCj4gKysrIGIvcGFja2FnZS9saWJwc2wvbGlicHNsLm1rCj4gQEAgLTQsMTAgKzQs
MTEgQEAKPiAgIwo+ICAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwo+ICAKPiAtTElCUFNMX1ZFUlNJ
T04gPSAwLjIxLjEKPiArTElCUFNMX1ZFUlNJT04gPSAwLjIxLjIKPiAgTElCUFNMX1NJVEUgPSBo
dHRwczovL2dpdGh1Yi5jb20vcm9ja2RhYm9vdC9saWJwc2wvcmVsZWFzZXMvZG93bmxvYWQvJChM
SUJQU0xfVkVSU0lPTikKPiAgTElCUFNMX0xJQ0VOU0UgPSBNSVQsIEJTRC0zLUNsYXVzZQo+ICBM
SUJQU0xfTElDRU5TRV9GSUxFUyA9IENPUFlJTkcgc3JjL0xJQ0VOU0UuY2hyb21pdW0KPiArTElC
UFNMX0NPTkZfT1BUUyA9IC1EYnVpbHRpbj10cnVlCj4gIExJQlBTTF9ERVBFTkRFTkNJRVMgPSBo
b3N0LXBrZ2NvbmYKPiAgTElCUFNMX0lOU1RBTExfU1RBR0lORyA9IFlFUwo+ICAKPiBAQCAtMTcs
MTMgKzE4LDEzIEBAIGVuZGlmCj4gIAo+ICAjIFRoZSBvcmRlciBvZiBjaGVja3MgaXMgdGhlIHNh
bWUgYXMgZG9uZSBieSBsaWJwc2wgd2hlbiBjb25maWd1cmVkLgo+ICBpZmVxICgkKEJSMl9QQUNL
QUdFX0xJQklETjIpJChCUjJfUEFDS0FHRV9MSUJVTklTVFJJTkcpLHl5KQo+IC1MSUJQU0xfQ09O
Rl9PUFRTICs9IC1EcnVudGltZT1saWJpZG4yIC1EYnVpbHRpbj1saWJpZG4yCj4gK0xJQlBTTF9D
T05GX09QVFMgKz0gLURydW50aW1lPWxpYmlkbjIKPiAgTElCUFNMX0RFUEVOREVOQ0lFUyArPSBs
aWJpZG4yIGxpYnVuaXN0cmluZwo+ICBlbHNlIGlmZXEgKCQoQlIyX1BBQ0tBR0VfSUNVKSx5KQo+
IC1MSUJQU0xfQ09ORl9PUFRTICs9IC1EcnVudGltZT1saWJpY3UgLURidWlsdGluPWxpYmljdQo+
ICtMSUJQU0xfQ09ORl9PUFRTICs9IC1EcnVudGltZT1saWJpY3UKPiAgTElCUFNMX0RFUEVOREVO
Q0lFUyArPSBpY3UKPiAgZWxzZQo+IC1MSUJQU0xfQ09ORl9PUFRTICs9IC1EcnVudGltZT1saWJp
ZG4gLURidWlsdGluPWxpYmlkbgo+ICtMSUJQU0xfQ09ORl9PUFRTICs9IC1EcnVudGltZT1saWJp
ZG4KPiAgTElCUFNMX0RFUEVOREVOQ0lFUyArPSBsaWJpZG4gbGlidW5pc3RyaW5nCj4gIGVuZGlm
Cj4gIAo+IC0tIAo+IDIuMzkuMAo+IAo+IAoKQ2hlZXJzLArigJRBZHJpw6FuCg==

--fMsjqEC0FMuyrac2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABEDAB0WIQRao7wzT9fjNp58d7KRxVnb5MkSOwUCY8MsWAAKCRCRxVnb5MkS
O/hTAJ9h4B3xb6+wbtrUL1sJa1qXANG6xQCeLiOCtyDNmPuxjhR3WfC+CWotS4A=
=h6Lp
-----END PGP SIGNATURE-----

--fMsjqEC0FMuyrac2--

--===============0632720056725122520==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0632720056725122520==--
