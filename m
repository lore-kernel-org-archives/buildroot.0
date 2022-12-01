Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA65AC43217
	for <buildroot@archiver.kernel.org>; Thu,  1 Dec 2022 18:34:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4818E610EF;
	Thu,  1 Dec 2022 18:34:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4818E610EF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Hq3zgyfOOSKU; Thu,  1 Dec 2022 18:34:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 46D5F610FE;
	Thu,  1 Dec 2022 18:34:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 46D5F610FE
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DAA951BF286
 for <buildroot@lists.busybox.net>; Thu,  1 Dec 2022 18:33:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C36DC607C1
 for <buildroot@lists.busybox.net>; Thu,  1 Dec 2022 18:33:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C36DC607C1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YqwzM5VZvive for <buildroot@lists.busybox.net>;
 Thu,  1 Dec 2022 18:33:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A0CF660777
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp3.osuosl.org (Postfix) with ESMTP id A0CF660777
 for <buildroot@buildroot.org>; Thu,  1 Dec 2022 18:33:52 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A146713D5;
 Thu,  1 Dec 2022 10:33:58 -0800 (PST)
Received: from localhost.localdomain (unknown [10.57.6.188])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 482833F73B;
 Thu,  1 Dec 2022 10:33:51 -0800 (PST)
From: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@arm.com>
To: buildroot@buildroot.org
Date: Thu,  1 Dec 2022 19:33:36 +0100
Message-Id: <20221201183337.1588407-3-vincent.stehle@arm.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221201183337.1588407-1-vincent.stehle@arm.com>
References: <20221201183337.1588407-1-vincent.stehle@arm.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/3 next] package/edk2-non-osi: new package
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
Cc: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@arm.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QWRkIGEgcGFja2FnZSB0byBpbnN0YWxsIHRoZSBhZGRpdGlvbmFsIGVkazIgcGxhdGZvcm1zIGZp
bGVzLCBub3QKY29tcGF0aWJsZSB3aXRoIHRoZSBub3JtYWwgbGljZW5zaW5nIHJlcXVpcmVtZW50
cyBhbmQgaGVsZCBpbiB0aGUKZWRrMi1ub24tb3NpIHJlcG9zaXRvcnkuCgpPbmx5IHRoZSBNYXJ2
ZWxsIEFybWFkYSBmaWxlcyBhcmUgY29waWVkIGF0IHRoaXMgcG9pbnQsIHRvIHN1cHBvcnQgYnVp
bGRpbmcKZWRrMiBmb3IgdGhlIE1BQ0NISUFUT2JpbiBwbGF0Zm9ybS4KClRoZSByZWZlcmVuY2Vk
IGNvbW1pdCBjb3JyZXNwb25kcyB0byB2ZXJzaW9uIGVkazItc3RhYmxlMjAyMjA4IG9mIGVkazIs
CmJhc2VkIG9uIHRoZSB0aW1lc3RhbXBzLgoKVGhpcyBwYWNrYWdlIGlzIGhlYXZpbHkgaW5zcGly
ZWQgZnJvbSBwYWNrYWdlL2VkazItcGxhdGZvcm1zLgoKU2lnbmVkLW9mZi1ieTogVmluY2VudCBT
dGVobMOpIDx2aW5jZW50LnN0ZWhsZUBhcm0uY29tPgpDYzogVGhvbWFzIFBldGF6em9uaSA8dGhv
bWFzLnBldGF6em9uaUBib290bGluLmNvbT4KLS0tCgpUaGlzIGlzIGZvciB0aGUgYG5leHQnIGJy
YW5jaCwgcGxlYXNlLgoKIERFVkVMT1BFUlMgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwg
IDEgKwogcGFja2FnZS9Db25maWcuaW4gICAgICAgICAgICAgICAgICAgICAgfCAgMSArCiBwYWNr
YWdlL2VkazItbm9uLW9zaS9Db25maWcuaW4gICAgICAgICB8IDExICsrKysrKysrKysKIHBhY2th
Z2UvZWRrMi1ub24tb3NpL2VkazItbm9uLW9zaS5oYXNoIHwgIDMgKysrCiBwYWNrYWdlL2VkazIt
bm9uLW9zaS9lZGsyLW5vbi1vc2kubWsgICB8IDI5ICsrKysrKysrKysrKysrKysrKysrKysrKysr
CiA1IGZpbGVzIGNoYW5nZWQsIDQ1IGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBw
YWNrYWdlL2VkazItbm9uLW9zaS9Db25maWcuaW4KIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdl
L2VkazItbm9uLW9zaS9lZGsyLW5vbi1vc2kuaGFzaAogY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2th
Z2UvZWRrMi1ub24tb3NpL2VkazItbm9uLW9zaS5tawoKZGlmZiAtLWdpdCBhL0RFVkVMT1BFUlMg
Yi9ERVZFTE9QRVJTCmluZGV4IGFiOWNmZTVlZTk4Li4yMzNmZGE0YzcxZCAxMDA2NDQKLS0tIGEv
REVWRUxPUEVSUworKysgYi9ERVZFTE9QRVJTCkBAIC0zMDAyLDYgKzMwMDIsNyBAQCBGOglwYWNr
YWdlL3V0cF9jb20vCiBOOglWaW5jZW50IFN0ZWhsw6kgPHZpbmNlbnQuc3RlaGxlQGFybS5jb20+
CiBGOglib2FyZC9xZW11L2FhcmNoNjQtZWJici8KIEY6CWNvbmZpZ3MvcWVtdV9hYXJjaDY0X2Vi
YnJfZGVmY29uZmlnCitGOglwYWNrYWdlL2VkazItbm9uLW9zaS8KIAogTjoJVmluY2VudCBTdGVo
bMOpIDx2aW5jZW50LnN0ZWhsZUBsYXBvc3RlLm5ldD4KIEY6CWJvYXJkL2JhbmFuYXBpL2JhbmFu
YXBpLW0yLXplcm8vCmRpZmYgLS1naXQgYS9wYWNrYWdlL0NvbmZpZy5pbiBiL3BhY2thZ2UvQ29u
ZmlnLmluCmluZGV4IDFhMmJkYTQ2MzllLi5jZTBkNTViYmYyZiAxMDA2NDQKLS0tIGEvcGFja2Fn
ZS9Db25maWcuaW4KKysrIGIvcGFja2FnZS9Db25maWcuaW4KQEAgLTQ4OSw2ICs0ODksNyBAQCBl
bmRtZW51CiAJc291cmNlICJwYWNrYWdlL2R2Yi1hcHBzL0NvbmZpZy5pbiIKIAlzb3VyY2UgInBh
Y2thZ2UvZHZic25vb3AvQ29uZmlnLmluIgogCXNvdXJjZSAicGFja2FnZS9lZGlkLWRlY29kZS9D
b25maWcuaW4iCisJc291cmNlICJwYWNrYWdlL2VkazItbm9uLW9zaS9Db25maWcuaW4iCiAJc291
cmNlICJwYWNrYWdlL2VkazItcGxhdGZvcm1zL0NvbmZpZy5pbiIKIAlzb3VyY2UgInBhY2thZ2Uv
ZXVkZXYvQ29uZmlnLmluIgogCXNvdXJjZSAicGFja2FnZS9ldjNkZXYtbGludXgtZHJpdmVycy9D
b25maWcuaW4iCmRpZmYgLS1naXQgYS9wYWNrYWdlL2VkazItbm9uLW9zaS9Db25maWcuaW4gYi9w
YWNrYWdlL2VkazItbm9uLW9zaS9Db25maWcuaW4KbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXgg
MDAwMDAwMDAwMDAuLjZjNTQwYzhhNDA4Ci0tLSAvZGV2L251bGwKKysrIGIvcGFja2FnZS9lZGsy
LW5vbi1vc2kvQ29uZmlnLmluCkBAIC0wLDAgKzEsMTEgQEAKK2NvbmZpZyBCUjJfUEFDS0FHRV9F
REsyX05PTl9PU0kKKwlib29sCisJaGVscAorCSAgRURLMiBkZXNjcmlwdGlvbiBmaWxlcyBmb3Ig
YWRkaXRpb25hbCBwbGF0Zm9ybXMsIG5vdAorCSAgY29tcGF0aWJsZSB3aXRoIHRoZSBub3JtYWwg
bGljZW5zaW5nIHJlcXVpcmVtZW50cy4KKwkgIFRoZSBtYWluIEVESzIgYm9vdGxvYWRlciBwYWNr
YWdlIHdpbGwgZGVwZW5kIG9uIHRoZXNlCisJICBkZXNjcmlwdGlvbiBmaWxlcyB3aGlsZSBidWls
ZGluZyBmaXJtd2FyZSBmb3Igc29tZSBwbGF0Zm9ybXMuCisKKwkgIE9ubHkgdGhlIE1hcnZlbGwg
QXJtYWRhIGZpbGVzIGFyZSBjb3BpZWQgYXQgdGhpcyBwb2ludC4KKworCSAgaHR0cHM6Ly9naXRo
dWIuY29tL3RpYW5vY29yZS9lZGsyLW5vbi1vc2kKZGlmZiAtLWdpdCBhL3BhY2thZ2UvZWRrMi1u
b24tb3NpL2VkazItbm9uLW9zaS5oYXNoIGIvcGFja2FnZS9lZGsyLW5vbi1vc2kvZWRrMi1ub24t
b3NpLmhhc2gKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMDAuLjc5NDFkZjFm
MmZjCi0tLSAvZGV2L251bGwKKysrIGIvcGFja2FnZS9lZGsyLW5vbi1vc2kvZWRrMi1ub24tb3Np
Lmhhc2gKQEAgLTAsMCArMSwzIEBACisjIExvY2FsbHkgY2FsY3VsYXRlZAorc2hhMjU2ICA3ZDI3
YjFlNmQ5MGEyNmYzNTg1YWI1OGEyZTA1MWRhNjllYWUxYjk3NzU0ZDNlMmQ4MGE1MzcyODc5YWUy
NTAxICBlZGsyLW5vbi1vc2ktNjE2NjJlODU5NmRkOWE2NGUzMzcyZjlhM2JhNjYyMmQyNjI4NjA3
Yy50YXIuZ3oKK3NoYTI1NiAgMzhkNzNkYjJmOWRmYjMyZTE2NjZkODk4Y2I5ZDdjMWNjZDc4MzAy
ZGQ5OTIyZDVmYWM0YTljZjYxZmE4NzJkOSAgU2lsaWNvbi9NYXJ2ZWxsL0FybWFkYTdrOGsvRGV2
aWNlVHJlZS9Bcm1hZGE4MHgwTWNCaW4uaW5mCmRpZmYgLS1naXQgYS9wYWNrYWdlL2VkazItbm9u
LW9zaS9lZGsyLW5vbi1vc2kubWsgYi9wYWNrYWdlL2VkazItbm9uLW9zaS9lZGsyLW5vbi1vc2ku
bWsKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMDAuLjVjZDA4YzAzZGU1Ci0t
LSAvZGV2L251bGwKKysrIGIvcGFja2FnZS9lZGsyLW5vbi1vc2kvZWRrMi1ub24tb3NpLm1rCkBA
IC0wLDAgKzEsMjkgQEAKKyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCisjCisjIGVkazItbm9uLW9z
aQorIworIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKKworIyBLZWVwIGluIHN5bmMgd2l0aCBsYXRl
c3QgY29tbWl0IGFzIG9mIHRoZSByZWxlYXNlIGRhdGUgZm9yIGJvb3QvZWRrMgorRURLMl9OT05f
T1NJX1ZFUlNJT04gPSA2MTY2MmU4NTk2ZGQ5YTY0ZTMzNzJmOWEzYmE2NjIyZDI2Mjg2MDdjCitF
REsyX05PTl9PU0lfU0lURSA9ICQoY2FsbCBnaXRodWIsdGlhbm9jb3JlLGVkazItbm9uLW9zaSwk
KEVESzJfTk9OX09TSV9WRVJTSU9OKSkKK0VESzJfTk9OX09TSV9JTlNUQUxMX1RBUkdFVCA9IE5P
CitFREsyX05PTl9PU0lfSU5TVEFMTF9TVEFHSU5HID0gWUVTCisKKyMgQ29weSBNYXJ2ZWxsIEFy
bWFkYSBmaWxlcworRURLMl9OT05fT1NJX0xJQ0VOU0UgKz0gLCBCU0QtMi1DbGF1c2UtUGF0ZW50
IChNYXJ2ZWxsIEFybWFkYSkKK0VESzJfTk9OX09TSV9MSUNFTlNFX0ZJTEVTICs9IFNpbGljb24v
TWFydmVsbC9Bcm1hZGE3azhrL0RldmljZVRyZWUvQXJtYWRhODB4ME1jQmluLmluZgorRURLMl9O
T05fT1NJX0RJUlMgKz0gU2lsaWNvbi9NYXJ2ZWxsL0FybWFkYTdrOGsvRGV2aWNlVHJlZQorCisj
IFRoZXJlIGlzIG5vdGhpbmcgdG8gYnVpbGQgZm9yIGVkazItbm9uLW9zaS4gQWxsIHdlIG5lZWQg
dG8gZG8gaXMgdG8gY29weQorIyB0aGUgc2VsZWN0ZWQgZGVzY3JpcHRpb24gZmlsZXMgdG8gc3Rh
Z2luZywgZm9yIG90aGVyIHBhY2thZ2VzIHRvIGJ1aWxkIHdpdGguCitkZWZpbmUgRURLMl9OT05f
T1NJX0lOU1RBTExfU1RBR0lOR19DTURTCisJbWtkaXIgLXAgJChTVEFHSU5HX0RJUikvdXNyL3No
YXJlL2VkazItbm9uLW9zaQorCisJZm9yIGQgaW4gJChFREsyX05PTl9PU0lfRElSUyk7IGRvIFwK
KwkJbWtkaXIgLXAgJChTVEFHSU5HX0RJUikvdXNyL3NoYXJlL2VkazItbm9uLW9zaS8kJGQ7IFwK
KwkJY3AgLXJmICQoQEQpLyQkZC8qICQoU1RBR0lOR19ESVIpL3Vzci9zaGFyZS9lZGsyLW5vbi1v
c2kvJCRkLzsgXAorCWRvbmUKK2VuZGVmCisKKyQoZXZhbCAkKGdlbmVyaWMtcGFja2FnZSkpCi0t
IAoyLjM1LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9s
aXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
