Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3EB1C6FA82
	for <buildroot@archiver.kernel.org>; Sat, 17 Sep 2022 19:50:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5FF7E84407;
	Sat, 17 Sep 2022 19:50:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5FF7E84407
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zGTQPF88xgAb; Sat, 17 Sep 2022 19:50:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7522684400;
	Sat, 17 Sep 2022 19:50:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7522684400
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B80341BF267
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 19:50:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 919DD60A7B
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 19:50:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 919DD60A7B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id i-ISp_LSpMDM for <buildroot@lists.busybox.net>;
 Sat, 17 Sep 2022 19:50:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 59FB960ABD
 for <buildroot@buildroot.org>; Sat, 17 Sep 2022 19:50:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 59FB960ABD
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 40C6F84657; Sat, 17 Sep 2022 19:50:26 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 17 Sep 2022 21:46:03 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fbb3dcfc9dadecfba023ef3004a77470bfff61a3
X-Git-Newrev: 7966ddf6d29e45180d9b833dac2f444d6f9bbbb0
X-Patchwork-Hint: ignore
Message-Id: <20220917195026.40C6F84657@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pkcs11-helper: bump to version
 1.29.0
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=7966ddf6d29e45180d9b833dac2f444d6f9bbbb0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop first pacth (already in version)

https://github.com/OpenSC/pkcs11-helper/releases/tag/pkcs11-helper-1.29.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...kcs11h-core.c-fix-build-without-slotevent.patch | 37 ----------------------
 ...l-3-5-0-does-not-have-DSA_meth_set1_name.patch} |  0
 package/pkcs11-helper/pkcs11-helper.hash           |  2 +-
 package/pkcs11-helper/pkcs11-helper.mk             |  4 +--
 4 files changed, 3 insertions(+), 40 deletions(-)

diff --git a/package/pkcs11-helper/0001-lib-pkcs11h-core.c-fix-build-without-slotevent.patch b/package/pkcs11-helper/0001-lib-pkcs11h-core.c-fix-build-without-slotevent.patch
deleted file mode 100644
index 5b2829c5ca..0000000000
--- a/package/pkcs11-helper/0001-lib-pkcs11h-core.c-fix-build-without-slotevent.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 754911f553414a77d5b52001f5ef6e3a1314c4d5 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sun, 20 Mar 2022 08:50:15 +0100
-Subject: [PATCH] lib/pkcs11h-core.c: fix build without slotevent
-
-Fix the following build failure with --disable-slotevent:
-
-/home/giuliobenetti/autobuild/run/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabihf/9.3.0/../../../../arm-buildroot-linux-uclibcgnueabihf/bin/ld: /home/giuliobenetti/autobuild/run/instance-0/output-1/host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/libpkcs11-helper.so: undefined reference to `_pkcs11h_slotevent_init'
-
-Fixes:
- - http://autobuild.buildroot.org/results/fcaa70cc035d6f9d35dfa8d564e9948c7e1cfd9e
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/OpenSC/pkcs11-helper/pull/50]
----
- lib/pkcs11h-core.c | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/lib/pkcs11h-core.c b/lib/pkcs11h-core.c
-index d7bb4cd..0bf11e8 100644
---- a/lib/pkcs11h-core.c
-+++ b/lib/pkcs11h-core.c
-@@ -726,9 +726,11 @@ pkcs11h_setProperty (
- 
- 	switch (property) {
- 		case PKCS11H_PROPERTY_SLOT_EVENT_HOOK:
-+#if defined(ENABLE_PKCS11H_SLOTEVENT)
- 			if ((rv = _pkcs11h_slotevent_init ()) != CKR_OK) {
- 				goto cleanup;
- 			}
-+#endif
- 		break;
- 	}
- cleanup:
--- 
-2.35.1
-
diff --git a/package/pkcs11-helper/0002-openssl-libressl-3-5-0-does-not-have-DSA_meth_set1_name.patch b/package/pkcs11-helper/0001-openssl-libressl-3-5-0-does-not-have-DSA_meth_set1_name.patch
similarity index 100%
rename from package/pkcs11-helper/0002-openssl-libressl-3-5-0-does-not-have-DSA_meth_set1_name.patch
rename to package/pkcs11-helper/0001-openssl-libressl-3-5-0-does-not-have-DSA_meth_set1_name.patch
diff --git a/package/pkcs11-helper/pkcs11-helper.hash b/package/pkcs11-helper/pkcs11-helper.hash
index 4114378ab8..0614e8aed4 100644
--- a/package/pkcs11-helper/pkcs11-helper.hash
+++ b/package/pkcs11-helper/pkcs11-helper.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  5bd55adafdbb708e096070dd0a910f23e1d5fd6291922398c1a15f00fff2b5ec  pkcs11-helper-1.28.0.tar.bz2
+sha256  996846a3c8395e03d8c0515111dc84d82e6e3648d44ba28cb2dbbbca2d4db7d6  pkcs11-helper-1.29.0.tar.bz2
 sha256  808705ac1daafe07a76431929575c5712a8693977a39ec9102aed25f030754d9  COPYING
 sha256  865496cf23a6c792739ff2f9ea11e95ac99db89cfe3780a295b4e1495a9c19fe  COPYING.BSD
 sha256  cd2e7d63a11058f19c58b06fb8c759140ce70788369dce6e6e9db40d3475021e  COPYING.GPL
diff --git a/package/pkcs11-helper/pkcs11-helper.mk b/package/pkcs11-helper/pkcs11-helper.mk
index f8fe54ecf5..d1a1e38d4e 100644
--- a/package/pkcs11-helper/pkcs11-helper.mk
+++ b/package/pkcs11-helper/pkcs11-helper.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PKCS11_HELPER_VERSION = 1.28
-PKCS11_HELPER_SOURCE = pkcs11-helper-$(PKCS11_HELPER_VERSION).0.tar.bz2
+PKCS11_HELPER_VERSION = 1.29.0
+PKCS11_HELPER_SOURCE = pkcs11-helper-$(PKCS11_HELPER_VERSION).tar.bz2
 PKCS11_HELPER_SITE = https://github.com/OpenSC/pkcs11-helper/releases/download/pkcs11-helper-$(PKCS11_HELPER_VERSION)
 PKCS11_HELPER_LICENSE = GPL-2.0 or BSD-3-Clause
 PKCS11_HELPER_LICENSE_FILES = COPYING COPYING.BSD COPYING.GPL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
