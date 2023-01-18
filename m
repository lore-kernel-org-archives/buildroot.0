Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10F1EC32793
	for <buildroot@archiver.kernel.org>; Wed, 18 Jan 2023 12:29:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 825BE4049F;
	Wed, 18 Jan 2023 12:29:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 825BE4049F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z9b5N5uIUeSY; Wed, 18 Jan 2023 12:29:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2A13E410E3;
	Wed, 18 Jan 2023 12:29:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2A13E410E3
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8B50A1BF350
 for <buildroot@lists.busybox.net>; Wed, 18 Jan 2023 12:29:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 62AB74051D
 for <buildroot@lists.busybox.net>; Wed, 18 Jan 2023 12:29:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 62AB74051D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uh0E2O1kHpE0 for <buildroot@lists.busybox.net>;
 Wed, 18 Jan 2023 12:29:21 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AA0B740472
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AA0B740472
 for <buildroot@buildroot.org>; Wed, 18 Jan 2023 12:29:20 +0000 (UTC)
Feedback-ID: 3578:1022:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1360140910; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 18 Jan 2023 12:29:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 18 Jan 2023 07:28:40 -0500
Message-Id: <20230118122840.19885-1-wdouglass@carnegierobotics.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20221127202319.11124-1-wdouglass@carnegierobotics.com>
References: <20221127202319.11124-1-wdouglass@carnegierobotics.com>
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=oPEE+lzRbpCyEecfQ1rxbGpg/sG0NrTgh46NaovRFk9r+p6/UphwEmcBvmRyuVT3gW6oIEpTuy/PG02pDsedif8jaWtSSUTTHyowxp95gNqsdy4DFYIuqr3bPH3sSXWTtE9L/WsSJbOnOUTWF72fBiiK0c0lcBeCsdvKD2Up98vFcPoNnMN4fTQ+hDv5S8hENtg67FvEElwTXAY/3Qqd7kSCwC8+LSa6wMcHCljScXlN9DsSiU4ZcSIJ9GB6tALUXRo2REUWUHvx+RLymUKwTf7r0/f6NjW5hGeCyRqe+wDF6CNEPz25YK83eEYsLHpBwInTcdDaVVnjtDxCcacg9A==;
 s=purelymail3; d=douglass.dev; v=1;
 bh=UE0sZ6gTQFyZKZU4M1PT3QBNu/n9DK41BJVEsV2JAng=; h=Received:From:To:Subject; 
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=AJv+5jCpHrry38jpTZPAlCiXk/JVZyd6mhrInOVKIsK0hFwHWm86Av+NwNxW/+fcr/hHxXRmoB8RK/YQkm/ekgbBhWDzqNFhsG4+zeMIOffOGeBilsvb2NOFHkcAB4QyU2g5KbKsU6Os/LA9Lsvn3Bssr8/i3g8YtSzIMhoSv0R7bq16ta4D9riVET3PsAGpv5im1QFaRT4HUkIgZQAxVGery8QjcWZpIRr03zl4BxmvcgOf18ylJvX1XE0Cum5F95cPAElBVcigpB3ptLHQxE8WjsIeMS5UVCNvZSi5sxf0vsOTHQ7fVHBuspvHIGy1r4IOkqAsHMN67PvntxMmmQ==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=UE0sZ6gTQFyZKZU4M1PT3QBNu/n9DK41BJVEsV2JAng=;
 h=Feedback-ID:Received:From:To:Subject; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=douglass.dev
 header.i=@douglass.dev header.a=rsa-sha256 header.s=purelymail3
 header.b=oPEE+lzR; 
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=AJv+5jCp
Subject: [Buildroot] [PATCH] package/libchicken: the chicken scheme
 programming environment
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
From: Woodrow Douglass via buildroot <buildroot@buildroot.org>
Reply-To: Woodrow Douglass <wdouglass@carnegierobotics.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhpcyBwYWNrYWdlIGluY2x1ZGVzIHRoZSBydW50aW1lIGxpYnJhcnkgYW5kIGludGVycHJldGVy
LiBJbiB0aGUKZnV0dXJlIEkgcGxhbiBvbiBwYWNrYWdpbmcgYSBjcm9zcy1jb21waWxlciBmb3Ig
dGhlIGhvc3QgYXMgd2VsbAoKU2lnbmVkLW9mZi1ieTogV29vZHJvdyBEb3VnbGFzcyA8d2RvdWds
YXNzQGNhcm5lZ2llcm9ib3RpY3MuY29tPgotLS0KIERFVkVMT1BFUlMgICAgICAgICAgICAgICAg
ICAgICAgIHwgIDMgKysKIHBhY2thZ2UvQ29uZmlnLmluICAgICAgICAgICAgICAgIHwgIDEgKwog
cGFja2FnZS9saWJjaGlja2VuL0NvbmZpZy5pbiAgICAgfCAxMiArKysrKysKIHBhY2thZ2UvbGli
Y2hpY2tlbi9saWJjaGlja2VuLm1rIHwgNzEgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysKIDQgZmlsZXMgY2hhbmdlZCwgODcgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0
IHBhY2thZ2UvbGliY2hpY2tlbi9Db25maWcuaW4KIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdl
L2xpYmNoaWNrZW4vbGliY2hpY2tlbi5tawoKZGlmZiAtLWdpdCBhL0RFVkVMT1BFUlMgYi9ERVZF
TE9QRVJTCmluZGV4IGU4ZTBkZmZjZDMuLjY0ZDIxY2UyYzUgMTAwNjQ0Ci0tLSBhL0RFVkVMT1BF
UlMKKysrIGIvREVWRUxPUEVSUwpAQCAtMzAxNSw2ICszMDE1LDkgQEAgRjoJcGFja2FnZS9weXRo
b24tcHl1c2IvCiBOOglXb2pjaWVjaCBOaXppxYRza2kgPG5pemlha0BzcG94Lm9yZz4KIEY6CXBh
Y2thZ2UvZnd1cC8KIAorTjoJV29vZHJvdyBEb3VnbGFzcyA8d2RvdWdsYXNzQGNhcm5lZ2llcm9i
b3RpY3MuY29tPgorRjoJcGFja2FnZS9saWJjaGlja2VuCisKIE46CVh1YW5oYW8gU2hpIDxYMTUw
MDAxNzdAZ21haWwuY29tPgogRjoJYm9vdC90aS1rMy1yNS1sb2FkZXIvCiAKZGlmZiAtLWdpdCBh
L3BhY2thZ2UvQ29uZmlnLmluIGIvcGFja2FnZS9Db25maWcuaW4KaW5kZXggOTk1ZGFlMmM1Ny4u
YzYwNWFiYjZiZSAxMDA2NDQKLS0tIGEvcGFja2FnZS9Db25maWcuaW4KKysrIGIvcGFja2FnZS9D
b25maWcuaW4KQEAgLTY0MSw2ICs2NDEsNyBAQCBtZW51ICJJbnRlcnByZXRlciBsYW5ndWFnZXMg
YW5kIHNjcmlwdGluZyIKIAlzb3VyY2UgInBhY2thZ2UvNHRoL0NvbmZpZy5pbiIKIAlzb3VyY2Ug
InBhY2thZ2UvZW5zY3JpcHQvQ29uZmlnLmluIgogCXNvdXJjZSAicGFja2FnZS9lcmxhbmcvQ29u
ZmlnLmluIgorCXNvdXJjZSAicGFja2FnZS9saWJjaGlja2VuL0NvbmZpZy5pbiIKIGlmIEJSMl9Q
QUNLQUdFX0VSTEFORwogbWVudSAiRXJsYW5nIGxpYnJhcmllcy9tb2R1bGVzIgogCXNvdXJjZSAi
cGFja2FnZS9lcmxhbmctYmFzZTY0dXJsL0NvbmZpZy5pbiIKZGlmZiAtLWdpdCBhL3BhY2thZ2Uv
bGliY2hpY2tlbi9Db25maWcuaW4gYi9wYWNrYWdlL2xpYmNoaWNrZW4vQ29uZmlnLmluCm5ldyBm
aWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAuLjE3MzIxNWNiZWYKLS0tIC9kZXYvbnVs
bAorKysgYi9wYWNrYWdlL2xpYmNoaWNrZW4vQ29uZmlnLmluCkBAIC0wLDAgKzEsMTIgQEAKK2Nv
bmZpZyBCUjJfUEFDS0FHRV9MSUJDSElDS0VOCisJYm9vbCAiY2hpY2tlbi1zY2hlbWUtcnVudGlt
ZSIKKwlkZXBlbmRzIG9uIEJSMl9VU0VfTU1VCisJaGVscAorCSAgbGliY2hpY2tlbiBpcyB0aGUg
cnVudGltZSBsaWJyYXJ5IGZvciBjaGlja2VuCisJICBzY2hlbWUuIGh0dHBzOi8vY2FsbC1jYy5v
cmcKKworY29uZmlnIEJSMl9MSUJDSElDS0VOX0lOU1RBTExfSU5URVJQUkVURVIKKyAgICAgICBi
b29sICJjaGlja2VuLXNjaGVtZS1pbnRlcnByZXRlciIKKyAgICAgICBkZXBlbmRzIG9uIEJSMl9Q
QUNLQUdFX0xJQkNISUNLRU4KKyAgICAgICBoZWxwCisgICAgICAgICBjc2kgaXMgYW4gaW50ZXJw
cmV0ZXIgZm9yIHRoZSBDaGlja2VuIFNjaGVtZSBkaWFsZWN0CmRpZmYgLS1naXQgYS9wYWNrYWdl
L2xpYmNoaWNrZW4vbGliY2hpY2tlbi5tayBiL3BhY2thZ2UvbGliY2hpY2tlbi9saWJjaGlja2Vu
Lm1rCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAuLmE0MDI3MDZjNzMKLS0t
IC9kZXYvbnVsbAorKysgYi9wYWNrYWdlL2xpYmNoaWNrZW4vbGliY2hpY2tlbi5tawpAQCAtMCww
ICsxLDcxIEBACisjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIworIworIyBsaWJjaGlja2VuCisjCisj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIworCitMSUJDSElDS0VOX1ZFUlNJT04gPSA1LjMuMAorTElC
Q0hJQ0tFTl9TSVRFID0gaHR0cHM6Ly9jb2RlLmNhbGwtY2Mub3JnL3JlbGVhc2VzLyQoTElCQ0hJ
Q0tFTl9WRVJTSU9OKQorTElCQ0hJQ0tFTl9TT1VSQ0UgPSBjaGlja2VuLSQoTElCQ0hJQ0tFTl9W
RVJTSU9OKS50YXIuZ3oKK0xJQkNISUNLRU5fTElDRU5TRSA9IEJTRAorTElCQ0hJQ0tFTl9MSUNF
TlNFX0ZJTEVTID0gTElDRU5TRQorTElCQ0hJQ0tFTl9JTlNUQUxMX1NUQUdJTkcgPSBZRVMKK0xJ
QkNISUNLRU5fSU5TVEFMTF9UQVJHRVQgPSBZRVMKKworTElCQ0hJQ0tFTl9NQUtFX0FSR1VNRU5U
Uz1BUkNIPSBcCisJUFJFRklYPS91c3IgXAorCVBMQVRGT1JNPWxpbnV4IFwKKwlDX0NPTVBJTEVS
PSR7VEFSR0VUX0NDfSBcCisJQ1hYX0NPTVBJTEVSPSR7VEFSR0VUX0NYWH0gXAorCUxJQlJBUklB
Tj0ke1RBUkdFVF9BUn0gXAorCURFU1RESVI9JChTVEFHSU5HX0RJUikKKworIyBNQUtFMSBpcyB1
c2VkIGhlcmUgYmVjYXVzZSB0aGUgaW5zdGFsbCBzdGVwIHdpbGwgZmFpbCB3aXRob3V0IGl0LiBQ
ZXJoYXBzIHRoaXMnbGwgYmUgZml4ZWQgdXBzdHJlYW0gc29tZWRheS4uLgorTElCQ0hJQ0tFTl9N
QUtFID0gJChNQUtFMSkKKworaWZuZXEgKCQoQlIyX0FSQ0gpLHg4NikKKwlMSUJDSElDS0VOX01B
S0VfQVJHVU1FTlRTICs9IFRBUkdFVF9GRUFUVVJFUz0iLW5vLWZlYXR1cmUgeDg2IC1mZWF0dXJl
ICR7QlIyX0FSQ0h9IgorZW5kaWYKKworaWZlcSAoJChCUjJfU1RBVElDX0xJQlMpLHkpCisJTElC
Q0hJQ0tFTl9NQUtFX0FSR1VNRU5UUyArPSBTVEFUSUNCVUlMRD0xCitlbmRpZgorCisKK2RlZmlu
ZSBMSUJDSElDS0VOX0JVSUxEX0NNRFMKKwkkKFRBUkdFVF9NQUtFX0VOVikgJChMSUJDSElDS0VO
X01BS0UpIC1DICQoQEQpICR7TElCQ0hJQ0tFTl9NQUtFX0FSR1VNRU5UU30gYWxsCitlbmRlZgor
CitkZWZpbmUgTElCQ0hJQ0tFTl9JTlNUQUxMX1NUQUdJTkdfQ01EUworCSQoVEFSR0VUX01BS0Vf
RU5WKSAkKExJQkNISUNLRU5fTUFLRSkgLUMgJChARCkgJHtMSUJDSElDS0VOX01BS0VfQVJHVU1F
TlRTfSBpbnN0YWxsCitlbmRlZgorCitkZWZpbmUgTElCQ0hJQ0tFTl9JTlNUQUxMX1RBUkdFVF9M
SUJTX0NNRFMKKwkkKElOU1RBTEwpIC1EIC1tIDA3NTUgJChARCkvbGliY2hpY2tlbi5zby4xMSAk
KFRBUkdFVF9ESVIpL3Vzci9saWIKKwlsbiAtc3JUICQoVEFSR0VUX0RJUikvdXNyL2xpYi9saWJj
aGlja2VuLnNvLjExICQoVEFSR0VUX0RJUikvdXNyL2xpYi9saWJjaGlja2VuLnNvCitlbmRlZgor
CitkZWZpbmUgTElCQ0hJQ0tFTl9JTlNUQUxMX1RBUkdFVF9JTlRFUlBSRVRFUl9DTURTCisJJChJ
TlNUQUxMKSAtRCAtbSAwNzU1ICQoQEQpL2NzaSAkKFRBUkdFVF9ESVIpL3Vzci9iaW4KK2VuZGVm
CisKK2lmZXEgKCQoQlIyX0xJQkNISUNLRU5fSU5TVEFMTF9JTlRFUlBSRVRFUikseSkKK2lmbmVx
ICgkKEJSMl9TVEFUSUNfTElCUykseSkKK2RlZmluZSBMSUJDSElDS0VOX0lOU1RBTExfVEFSR0VU
X0NNRFMKKwkkKExJQkNISUNLRU5fSU5TVEFMTF9UQVJHRVRfTElCU19DTURTKQorCSQoTElCQ0hJ
Q0tFTl9JTlNUQUxMX1RBUkdFVF9JTlRFUlBSRVRFUl9DTURTKQorZW5kZWYKK2Vsc2UKK2RlZmlu
ZSBMSUJDSElDS0VOX0lOU1RBTExfVEFSR0VUX0NNRFMKKwkkKExJQkNISUNLRU5fSU5TVEFMTF9U
QVJHRVRfSU5URVJQUkVURVJfQ01EUykKK2VuZGVmCitlbmRpZgorZWxzZQoraWZuZXEgKCQoQlIy
X1NUQVRJQ19MSUJTKSx5KQorZGVmaW5lIExJQkNISUNLRU5fSU5TVEFMTF9UQVJHRVRfQ01EUwor
CSQoTElCQ0hJQ0tFTl9JTlNUQUxMX1RBUkdFVF9MSUJTX0NNRFMpCitlbmRlZgorZW5kaWYKK2Vu
ZGlmCisKKyQoZXZhbCAkKGdlbmVyaWMtcGFja2FnZSkpCi0tIAoyLjIwLjEKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxp
c3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21h
aWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
