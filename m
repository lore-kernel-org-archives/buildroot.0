Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15BDAC43334
	for <buildroot@archiver.kernel.org>; Sat, 25 Jun 2022 14:12:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3589D84010;
	Sat, 25 Jun 2022 14:12:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3589D84010
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 05bAU-ltv1d5; Sat, 25 Jun 2022 14:12:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 23FF183FAD;
	Sat, 25 Jun 2022 14:12:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 23FF183FAD
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 57BCD1BF574
 for <buildroot@lists.busybox.net>; Sat, 25 Jun 2022 14:12:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3226160D80
 for <buildroot@lists.busybox.net>; Sat, 25 Jun 2022 14:12:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3226160D80
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cl7jr8TVr4mn for <buildroot@lists.busybox.net>;
 Sat, 25 Jun 2022 14:12:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 20B4460BC5
Received: from smtp-outgoing-1801.laposte.net (smtp-outgoing-1801.laposte.net
 [160.92.124.102])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 20B4460BC5
 for <buildroot@buildroot.org>; Sat, 25 Jun 2022 14:12:42 +0000 (UTC)
X-mail-filterd: {"version":"1.4.3", "queueID":"4LVbY35XHrz7t7W",
 "contextId":"f24b636b-c291-4e0b-826d-abcf39d69966"}
Received: from outgoing-mail.laposte.net (localhost.localdomain [127.0.0.1])
 by mlpnf0102.laposte.net (SMTP Server) with ESMTP id 4LVbY35XHrz7t7W;
 Sat, 25 Jun 2022 16:12:39 +0200 (CEST)
X-mail-filterd: {"version":"1.4.3", "queueID":"4LVbY34hfbz7t7L",
 "contextId":"a8e9dd6d-0488-4826-909d-c36aab3de5e8"}
X-lpn-mailing: LEGIT
X-lpn-spamrating: 46
X-lpn-spamlevel: not-spam
Received: from romuald.bergerie (unknown [88.169.129.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mlpnf0102.laposte.net (SMTP Server) with ESMTPSA id 4LVbY34hfbz7t7L;
 Sat, 25 Jun 2022 16:12:39 +0200 (CEST)
Received: from radicelle.bergerie (radicelle.bergerie [192.168.124.12])
 by romuald.bergerie (Postfix) with ESMTP id 1D5DF4B0F949;
 Sat, 25 Jun 2022 16:12:39 +0200 (CEST)
Received: from vincent by radicelle.bergerie with local (Exim 4.95)
 (envelope-from <vincent@radicelle.bergerie>) id 1o56WR-0006sv-Hc;
 Sat, 25 Jun 2022 16:12:27 +0200
To: buildroot@buildroot.org
Date: Sat, 25 Jun 2022 16:12:23 +0200
Message-Id: <20220625141223.26460-1-vincent.stehle@laposte.net>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=laposte.net; s=lpn-wlmd; t=1656166360;
 bh=MSCksUAERnA+Y9c0GEulzeK5ge0KqU8E+rDbAby4OCM=;
 h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding;
 b=dPM8KK0X3z+EnSMOqOSC6gylDk/D3ETxo2eTk3pEctON884Ncl4RPwn3tBiNoiVoXkRMbT62ZQHufKtQW30nelNVca2n3kNLVVq3xjoJB1qVxIp+/Esmvr6aIqLR87zwXlgsTljotHufJQUEURDonDnJgYKiArPTdluMOTxjCyIvO2VtNHi2YpFQIRfSypcreXwQY9ZJee+M2RsG0X5jjRBOpJEYBZJwT19NSEDpMKKogd75IAQfKgujHfrF8V6xu0/suFHtdqyLW5STBwl/87AxIj+15ib/dM+XsNf7LKBZAdgLB/D4a5kM5i+LlVNZVUWAJke7zwE6MmDrAuswUg==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=laposte.net header.i=@laposte.net
 header.a=rsa-sha256 header.s=lpn-wlmd header.b=dPM8KK0X
Subject: [Buildroot] [PATCH v2] package/zerofree: new package
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
From: =?utf-8?q?Vincent_Stehl=C3=A9_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@laposte.net>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@laposte.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

emVyb2ZyZWUgaXMgYSB1dGlsaXR5IHdoaWNoIHNjYW5zIHRoZSBmcmVlIGJsb2NrcyBpbiBhbiBl
eHQyIGZpbGVzeXN0ZW0gYW5kCmZpbGxzIGFueSBub24temVybyBibG9ja3Mgd2l0aCB6ZXJvZXMu
CgpodHRwczovL2ZyaXBwZXJ5Lm9yZy91bWwvCgpTaWduZWQtb2ZmLWJ5OiBWaW5jZW50IFN0ZWhs
w6kgPHZpbmNlbnQuc3RlaGxlQGxhcG9zdGUubmV0PgpDYzogVGhvbWFzIFBldGF6em9uaSA8dGhv
bWFzLnBldGF6em9uaUBib290bGluLmNvbT4KLS0tCgoKSGksCgpUaGlzIGlzIGEgZm9sbG93LXVw
IHRvIG15IGZpcnN0IGF0dGVtcHRbMV0gYXQgcGFja2FnaW5nIHplcm9mcmVlLgpUaGUgZ29vZCBu
ZXdzIGlzIHRoYXQgaXQgbm93IGJ1aWxkcyB3aXRoIGFsbCBsaWJjIGZsYXZvdXJzLCBpbmNsdWRp
bmcgbXVzbC4KRG8gbm90IGhlc2l0YXRlIHRvIHNlbmQgYW55IGZlZWRiYWNrLgoKQmVzdCByZWdh
cmRzLApWaW5jZW50LgoKQ2hhbmdlcyBpbiB2MjoKLSBVc2UgYSB3b3JrYXJvdW5kIHRvIGFsbG93
IGJ1aWxkaW5nIHdpdGggbXVzbC4KClsxXTogaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL3Bp
cGVybWFpbC9idWlsZHJvb3QvMjAyMi1NYXJjaC82Mzk3OTQuaHRtbAoKCiBERVZFTE9QRVJTICAg
ICAgICAgICAgICAgICAgICAgfCAgMSArCiBwYWNrYWdlL0NvbmZpZy5pbiAgICAgICAgICAgICAg
fCAgMSArCiBwYWNrYWdlL3plcm9mcmVlL0NvbmZpZy5pbiAgICAgfCAxMyArKysrKysrKysrKysr
CiBwYWNrYWdlL3plcm9mcmVlL3plcm9mcmVlLmhhc2ggfCAgMyArKysKIHBhY2thZ2UvemVyb2Zy
ZWUvemVyb2ZyZWUubWsgICB8IDI3ICsrKysrKysrKysrKysrKysrKysrKysrKysrKwogNSBmaWxl
cyBjaGFuZ2VkLCA0NSBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS96
ZXJvZnJlZS9Db25maWcuaW4KIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL3plcm9mcmVlL3pl
cm9mcmVlLmhhc2gKIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL3plcm9mcmVlL3plcm9mcmVl
Lm1rCgpkaWZmIC0tZ2l0IGEvREVWRUxPUEVSUyBiL0RFVkVMT1BFUlMKaW5kZXggZmMzMjlmZWMy
Ny4uZTc0ZTAyYjgyMSAxMDA2NDQKLS0tIGEvREVWRUxPUEVSUworKysgYi9ERVZFTE9QRVJTCkBA
IC0yOTE4LDYgKzI5MTgsNyBAQCBGOgljb25maWdzL3Vldm01NDMyX2RlZmNvbmZpZwogRjoJcGFj
a2FnZS9pN3ovCiBGOglwYWNrYWdlL21zci10b29scy8KIEY6CXBhY2thZ2UvcGl4ei8KK0Y6CXBh
Y2thZ2UvemVyb2ZyZWUvCiAKIE46CVZpbmljaXVzIFRpbnRpIDx2aW5pY2l1c3RpbnRpQGdtYWls
LmNvbT4KIEY6CXBhY2thZ2UvcHl0aG9uLXRocmlmdC8KZGlmZiAtLWdpdCBhL3BhY2thZ2UvQ29u
ZmlnLmluIGIvcGFja2FnZS9Db25maWcuaW4KaW5kZXggZjA5ZGEwNWJlMC4uNWFiMDMwMTZlOCAx
MDA2NDQKLS0tIGEvcGFja2FnZS9Db25maWcuaW4KKysrIGIvcGFja2FnZS9Db25maWcuaW4KQEAg
LTIzNyw2ICsyMzcsNyBAQCBtZW51ICJGaWxlc3lzdGVtIGFuZCBmbGFzaCB1dGlsaXRpZXMiCiAJ
c291cmNlICJwYWNrYWdlL3VkZnRvb2xzL0NvbmZpZy5pbiIKIAlzb3VyY2UgInBhY2thZ2UvdW5p
b25mcy9Db25maWcuaW4iCiAJc291cmNlICJwYWNrYWdlL3hmc3Byb2dzL0NvbmZpZy5pbiIKKwlz
b3VyY2UgInBhY2thZ2UvemVyb2ZyZWUvQ29uZmlnLmluIgogCXNvdXJjZSAicGFja2FnZS96ZnMv
Q29uZmlnLmluIgogZW5kbWVudQogCmRpZmYgLS1naXQgYS9wYWNrYWdlL3plcm9mcmVlL0NvbmZp
Zy5pbiBiL3BhY2thZ2UvemVyb2ZyZWUvQ29uZmlnLmluCm5ldyBmaWxlIG1vZGUgMTAwNjQ0Cmlu
ZGV4IDAwMDAwMDAwMDAuLjJjZTI5MDFhMjcKLS0tIC9kZXYvbnVsbAorKysgYi9wYWNrYWdlL3pl
cm9mcmVlL0NvbmZpZy5pbgpAQCAtMCwwICsxLDEzIEBACitjb25maWcgQlIyX1BBQ0tBR0VfWkVS
T0ZSRUUKKwlib29sICJ6ZXJvZnJlZSIKKwlkZXBlbmRzIG9uIEJSMl9VU0VfTU1VICMgZTJmc3By
b2dzCisJZGVwZW5kcyBvbiAhQlIyX1NUQVRJQ19MSUJTCisJc2VsZWN0IEJSMl9QQUNLQUdFX0Uy
RlNQUk9HUworCWhlbHAKKwkgIHplcm9mcmVlIGlzIGEgdXRpbGl0eSB3aGljaCBzY2FucyB0aGUg
ZnJlZSBibG9ja3MgaW4gYW4gZXh0MgorCSAgZmlsZXN5c3RlbSBhbmQgZmlsbHMgYW55IG5vbi16
ZXJvIGJsb2NrcyB3aXRoIHplcm9lcy4KKworCSAgaHR0cHM6Ly9mcmlwcGVyeS5vcmcvdW1sLwor
Citjb21tZW50ICJ6ZXJvZnJlZSBuZWVkcyBNTVUgYW5kIGR5bmFtaWMgbGlicmFyeSIKKwlkZXBl
bmRzIG9uICFCUjJfVVNFX01NVSB8fCBCUjJfU1RBVElDX0xJQlMKZGlmZiAtLWdpdCBhL3BhY2th
Z2UvemVyb2ZyZWUvemVyb2ZyZWUuaGFzaCBiL3BhY2thZ2UvemVyb2ZyZWUvemVyb2ZyZWUuaGFz
aApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwLi4zMzk5NjExNzg3Ci0tLSAv
ZGV2L251bGwKKysrIGIvcGFja2FnZS96ZXJvZnJlZS96ZXJvZnJlZS5oYXNoCkBAIC0wLDAgKzEs
MyBAQAorIyBMb2NhbGx5IGNhbGN1bGF0ZWQKK3NoYTI1NiAgOTU2YmM4NjFiNTViYTBhMmI3NTkz
YzU4ZDMyMzM5ZGFiMWEwZTdkYTZlYTJiODEzZDI3YzgwZjA4YjcyMzg2NyAgemVyb2ZyZWUtMS4x
LjEudGd6CitzaGEyNTYgIDkwZGFhZTAwNDc1YTk5MmEzNjdkYTViMDY1ODQ2OWE1ZDFjNDQ0OWRi
YmU5NjRjNWI3MjQ2ZTFhZWM5MmY0OTEgIENPUFlJTkcKZGlmZiAtLWdpdCBhL3BhY2thZ2UvemVy
b2ZyZWUvemVyb2ZyZWUubWsgYi9wYWNrYWdlL3plcm9mcmVlL3plcm9mcmVlLm1rCm5ldyBmaWxl
IG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAuLmNhNWEwMTlkZTcKLS0tIC9kZXYvbnVsbAor
KysgYi9wYWNrYWdlL3plcm9mcmVlL3plcm9mcmVlLm1rCkBAIC0wLDAgKzEsMjcgQEAKKyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjCisjCisjIHplcm9mcmVlCisjCisjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIworCitaRVJPRlJFRV9WRVJTSU9OID0gMS4xLjEKK1pFUk9GUkVFX1NPVVJDRSA9IHplcm9m
cmVlLSQoWkVST0ZSRUVfVkVSU0lPTikudGd6CitaRVJPRlJFRV9TSVRFID0gaHR0cHM6Ly9mcmlw
cGVyeS5vcmcvdW1sCitaRVJPRlJFRV9MSUNFTlNFID0gR1BMLTIuMAorWkVST0ZSRUVfTElDRU5T
RV9GSUxFID0gQ09QWUlORworWkVST0ZSRUVfREVQRU5ERU5DSUVTID0gZTJmc3Byb2dzCisKKyMg
V2UgdXNlIHRoZSBzYW1lIHdvcmthcm91bmQgYXMgaW4gaHR0cHM6Ly9idWdzLmdlbnRvby5vcmcv
NzE2MTM2CisjIHRvIGJ1aWxkIHdpdGggbXVzbC4KK1pFUk9GUkVFX0NGTEFHUyA9ICQoVEFSR0VU
X0NGTEFHUykgXAorCSQoaWYgJChCUjJfVE9PTENIQUlOX1VTRVNfTVVTTCksLURIQVZFX1NZU19U
WVBFU19IKSAjIGRldl90CisKK2RlZmluZSBaRVJPRlJFRV9CVUlMRF9DTURTCisJJChNQUtFKSBD
Qz0iJChUQVJHRVRfQ0MpIiBDRkxBR1M9IiQoWkVST0ZSRUVfQ0ZMQUdTKSIgLUMgJChARCkgYWxs
CitlbmRlZgorCitkZWZpbmUgWkVST0ZSRUVfSU5TVEFMTF9UQVJHRVRfQ01EUworCSQoSU5TVEFM
TCkgLUQgLW0gMDc1NSAkKEBEKS96ZXJvZnJlZSAkKFRBUkdFVF9ESVIpL3Vzci9iaW4KK2VuZGVm
CisKKyQoZXZhbCAkKGdlbmVyaWMtcGFja2FnZSkpCi0tIAoyLjM1LjEKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QK
YnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxt
YW4vbGlzdGluZm8vYnVpbGRyb290Cg==
