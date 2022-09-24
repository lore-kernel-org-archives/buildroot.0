Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4184C32771
	for <buildroot@archiver.kernel.org>; Sat, 24 Sep 2022 21:47:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 654D483FC8;
	Sat, 24 Sep 2022 21:47:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 654D483FC8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YxB0y26dWGYm; Sat, 24 Sep 2022 21:47:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8F42983F98;
	Sat, 24 Sep 2022 21:47:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8F42983F98
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id ED81D1BF95D
 for <buildroot@lists.busybox.net>; Sat, 24 Sep 2022 21:47:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C555B41A0E
 for <buildroot@lists.busybox.net>; Sat, 24 Sep 2022 21:47:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C555B41A0E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XQVHHxGnlX0i for <buildroot@lists.busybox.net>;
 Sat, 24 Sep 2022 21:47:38 +0000 (UTC)
X-Greylist: delayed 00:06:19 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 180A8419E4
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 180A8419E4
 for <buildroot@buildroot.org>; Sat, 24 Sep 2022 21:47:37 +0000 (UTC)
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4MZjBj4vWBz4xG7;
 Sun, 25 Sep 2022 07:41:17 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4MZjBh0gMCz4x3w;
 Sun, 25 Sep 2022 07:41:15 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: buildroot@buildroot.org
Date: Sat, 24 Sep 2022 23:41:10 +0200
Message-Id: <20220924214110.3490682-1-clg@kaod.org>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] Revert "configs/qemu_ppc64*: downgrade binutils
 to 2.36.1"
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
Cc: Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhpcyByZXZlcnRzIGNvbW1pdCAxZTJmZTg2MGYzYTI2MWZjODc3NTkxYzA1NjgwOGQ2ZmIzMGUy
NWQ0LgoKVGhlIGRlZmF1bHQgMi4zOC54IGhhcyB0aGUgcmVxdWlyZWQgZml4ZXMuCgpTaWduZWQt
b2ZmLWJ5OiBDw6lkcmljIExlIEdvYXRlciA8Y2xnQGthb2Qub3JnPgotLS0KCiBodHRwczovL2dp
dGxhYi5jb20vbGVnb2F0ZXIvYnVpbGRyb290Ly0vcGlwZWxpbmVzLzY0OTcyMzU5OAogCiBjb25m
aWdzL3FlbXVfcHBjNjRfZTU1MDBfZGVmY29uZmlnICAgICAgfCAxIC0KIGNvbmZpZ3MvcWVtdV9w
cGM2NF9wc2VyaWVzX2RlZmNvbmZpZyAgICB8IDEgLQogY29uZmlncy9xZW11X3BwYzY0bGVfcG93
ZXJudjhfZGVmY29uZmlnIHwgMSAtCiBjb25maWdzL3FlbXVfcHBjNjRsZV9wc2VyaWVzX2RlZmNv
bmZpZyAgfCAxIC0KIDQgZmlsZXMgY2hhbmdlZCwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS9jb25maWdzL3FlbXVfcHBjNjRfZTU1MDBfZGVmY29uZmlnIGIvY29uZmlncy9xZW11X3BwYzY0
X2U1NTAwX2RlZmNvbmZpZwppbmRleCA4NDU4ZjI3MzlhNjYuLjA4MjVkMGFiOWIzMCAxMDA2NDQK
LS0tIGEvY29uZmlncy9xZW11X3BwYzY0X2U1NTAwX2RlZmNvbmZpZworKysgYi9jb25maWdzL3Fl
bXVfcHBjNjRfZTU1MDBfZGVmY29uZmlnCkBAIC0zLDcgKzMsNiBAQCBCUjJfcG93ZXJwYzY0PXkK
IEJSMl9wb3dlcnBjX2U1NTAwPXkKIAogIyBTeXN0ZW0KLUJSMl9CSU5VVElMU19WRVJTSU9OXzJf
MzZfWD15CiBCUjJfU1lTVEVNX0RIQ1A9ImV0aDAiCiBCUjJfVEFSR0VUX0dFTkVSSUNfR0VUVFlf
UE9SVD0idHR5UzAiCiAKZGlmZiAtLWdpdCBhL2NvbmZpZ3MvcWVtdV9wcGM2NF9wc2VyaWVzX2Rl
ZmNvbmZpZyBiL2NvbmZpZ3MvcWVtdV9wcGM2NF9wc2VyaWVzX2RlZmNvbmZpZwppbmRleCA0ODBl
YmVhMjlkNzAuLmM0NTAxNGYyYWMzZiAxMDA2NDQKLS0tIGEvY29uZmlncy9xZW11X3BwYzY0X3Bz
ZXJpZXNfZGVmY29uZmlnCisrKyBiL2NvbmZpZ3MvcWVtdV9wcGM2NF9wc2VyaWVzX2RlZmNvbmZp
ZwpAQCAtMyw3ICszLDYgQEAgQlIyX3Bvd2VycGM2ND15CiBCUjJfcG93ZXJwY19wb3dlcjc9eQog
CiAjIFN5c3RlbQotQlIyX0JJTlVUSUxTX1ZFUlNJT05fMl8zNl9YPXkKIEJSMl9TWVNURU1fREhD
UD0iZXRoMCIKIEJSMl9UQVJHRVRfR0VORVJJQ19HRVRUWV9QT1JUPSJodmMwIgogCmRpZmYgLS1n
aXQgYS9jb25maWdzL3FlbXVfcHBjNjRsZV9wb3dlcm52OF9kZWZjb25maWcgYi9jb25maWdzL3Fl
bXVfcHBjNjRsZV9wb3dlcm52OF9kZWZjb25maWcKaW5kZXggOGRlNGNmNTE4OWI1Li44MjIxNDVl
OTI3YTEgMTAwNjQ0Ci0tLSBhL2NvbmZpZ3MvcWVtdV9wcGM2NGxlX3Bvd2VybnY4X2RlZmNvbmZp
ZworKysgYi9jb25maWdzL3FlbXVfcHBjNjRsZV9wb3dlcm52OF9kZWZjb25maWcKQEAgLTMsNyAr
Myw2IEBAIEJSMl9wb3dlcnBjNjRsZT15CiBCUjJfcG93ZXJwY19wb3dlcjg9eQogCiAjIFN5c3Rl
bQotQlIyX0JJTlVUSUxTX1ZFUlNJT05fMl8zNl9YPXkKIEJSMl9UQVJHRVRfR0VORVJJQ19HRVRU
WV9QT1JUPSJodmMwIgogQlIyX1NZU1RFTV9ESENQPSJldGgwIgogCmRpZmYgLS1naXQgYS9jb25m
aWdzL3FlbXVfcHBjNjRsZV9wc2VyaWVzX2RlZmNvbmZpZyBiL2NvbmZpZ3MvcWVtdV9wcGM2NGxl
X3BzZXJpZXNfZGVmY29uZmlnCmluZGV4IDk4YzZhZmRmOTM5OS4uNWVhYTNlOTUzZjc4IDEwMDY0
NAotLS0gYS9jb25maWdzL3FlbXVfcHBjNjRsZV9wc2VyaWVzX2RlZmNvbmZpZworKysgYi9jb25m
aWdzL3FlbXVfcHBjNjRsZV9wc2VyaWVzX2RlZmNvbmZpZwpAQCAtMyw3ICszLDYgQEAgQlIyX3Bv
d2VycGM2NGxlPXkKIEJSMl9wb3dlcnBjX3Bvd2VyOD15CiAKICMgU3lzdGVtCi1CUjJfQklOVVRJ
TFNfVkVSU0lPTl8yXzM2X1g9eQogQlIyX1RBUkdFVF9HRU5FUklDX0dFVFRZX1BPUlQ9Imh2YzAi
CiBCUjJfU1lTVEVNX0RIQ1A9ImV0aDAiCiAKLS0gCjIuMzcuMwoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWls
ZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9idWlsZHJvb3QK
