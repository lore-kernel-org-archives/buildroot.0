Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28A60C4332F
	for <buildroot@archiver.kernel.org>; Sat, 28 Oct 2023 21:06:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D8A5942F7F;
	Sat, 28 Oct 2023 21:06:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D8A5942F7F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9f-60KF95W4c; Sat, 28 Oct 2023 21:06:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CDF9542F69;
	Sat, 28 Oct 2023 21:06:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CDF9542F69
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 48C481BF32C
 for <buildroot@lists.busybox.net>; Sat, 28 Oct 2023 21:03:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CBD40613B8
 for <buildroot@lists.busybox.net>; Sat, 28 Oct 2023 21:03:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CBD40613B8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nypB3q-6KCaR for <buildroot@lists.busybox.net>;
 Sat, 28 Oct 2023 21:03:22 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id EDABF613B6
 for <buildroot@buildroot.org>; Sat, 28 Oct 2023 21:03:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EDABF613B6
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DE1068607A; Sat, 28 Oct 2023 21:03:21 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 28 Oct 2023 22:49:46 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c3fcaeaaa7fc0a6023d44ac16c9197b847504706
X-Git-Newrev: 7217661e3a4a324852982ab3e61ea319c068be4e
X-Patchwork-Hint: ignore
Message-Id: <20231028210321.DE1068607A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cryptopp: bump to version 8.9.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=7217661e3a4a324852982ab3e61ea319c068be4e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Drop patch (already in version)
- Update hash of License.txt (minor updates with:
  https://github.com/weidai11/cryptopp/commit/bc2c8423a1d8a193dcf1e5706c124587f9491b7f
  https://github.com/weidai11/cryptopp/commit/b418f93483562f1b59d0ba963dcdcc16b6a6a793
  https://github.com/weidai11/cryptopp/commit/2bce06d5dbd3f53ebfcff44eef467667e44d8839)

https://www.cryptopp.com/release890.html
https://www.cryptopp.com/release880.html
https://www.cryptopp.com/release870.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...kefile-add-missing-shared-library-symlink.patch | 62 ----------------------
 package/cryptopp/cryptopp.hash                     |  6 +--
 package/cryptopp/cryptopp.mk                       |  2 +-
 3 files changed, 4 insertions(+), 66 deletions(-)

diff --git a/package/cryptopp/0001-GNUmakefile-add-missing-shared-library-symlink.patch b/package/cryptopp/0001-GNUmakefile-add-missing-shared-library-symlink.patch
deleted file mode 100644
index 5f87414d53..0000000000
--- a/package/cryptopp/0001-GNUmakefile-add-missing-shared-library-symlink.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-From e4c2e3bc8174f24cf63923619f5d06d85b84ae1d Mon Sep 17 00:00:00 2001
-From: Kamel Bouhara <kamel.bouhara@bootlin.com>
-Date: Fri, 7 Jan 2022 22:59:23 +0100
-Subject: [PATCH] GNUmakefile: add missing shared library symlink
-
-The GNUmakefile install-lib target currently installs the following
-symlink:
-
-	libcryptopp.so -> libcryptopp.so.8.6.0
-
-However, it does not create the following symlink:
-
-	libcryptopp.so.8 -> libcryptopp.so.8.6.0
-
-This symlink is necessary at runtime because libcryptopp.so.8 is the
-SONAME of the cryptopp library, and therefore this is what the dynamic
-loader will search when starting a program that is linked against
-cryptopp.
-
-For native compilation, the 'ldconfig' invocation that immediately
-follows will create that symlink, so everything works.
-
-For cross-compilation however, ldconfig can't be used, and therefore
-LDCONFIG is passed as /bin/true, and therefore it doesn't create the
-symlink. So instead, create it directly inside the GNUmakefile,
-without relying on ldconfig.
-
-Upstream: https://github.com/weidai11/cryptopp/pull/1101
-Signed-off-by: Kamel Bouhara <kamel.bouhara@bootlin.com>
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- GNUmakefile       | 1 +
- GNUmakefile-cross | 1 +
- 2 files changed, 2 insertions(+)
-
-diff --git a/GNUmakefile b/GNUmakefile
-index 23273edb..3b55e420 100644
---- a/GNUmakefile
-+++ b/GNUmakefile
-@@ -1412,6 +1412,7 @@ ifneq ($(wildcard libcryptopp.so$(SOLIB_VERSION_SUFFIX)),)
- 	$(CHMOD) u=rwx,go=rx $(DESTDIR)$(LIBDIR)/libcryptopp.so$(SOLIB_VERSION_SUFFIX)
- ifeq ($(HAS_SOLIB_VERSION),1)
- 	-$(LN) libcryptopp.so$(SOLIB_VERSION_SUFFIX) $(DESTDIR)$(LIBDIR)/libcryptopp.so
-+	-$(LN) libcryptopp.so$(SOLIB_VERSION_SUFFIX) $(DESTDIR)$(LIBDIR)/libcryptopp.so$(SOLIB_COMPAT_SUFFIX)
- 	$(LDCONF) $(DESTDIR)$(LIBDIR)
- endif
- endif
-diff --git a/GNUmakefile-cross b/GNUmakefile-cross
-index 9847f04b..a2b87e4a 100644
---- a/GNUmakefile-cross
-+++ b/GNUmakefile-cross
-@@ -856,6 +856,7 @@ ifneq ($(wildcard libcryptopp.so$(SOLIB_VERSION_SUFFIX)),)
- 	$(CHMOD) u=rwx,go=rx $(DESTDIR)$(LIBDIR)/libcryptopp.so$(SOLIB_VERSION_SUFFIX)
- ifeq ($(HAS_SOLIB_VERSION),1)
- 	-$(LN) libcryptopp.so$(SOLIB_VERSION_SUFFIX) $(DESTDIR)$(LIBDIR)/libcryptopp.so
-+	-$(LN) libcryptopp.so$(SOLIB_VERSION_SUFFIX) $(DESTDIR)$(LIBDIR)/libcryptopp.so$(SOLIB_COMPAT_SUFFIX)
- 	$(LDCONF) $(DESTDIR)$(LIBDIR)
- endif
- endif
--- 
-2.33.1
-
diff --git a/package/cryptopp/cryptopp.hash b/package/cryptopp/cryptopp.hash
index 9a113b8f04..a7bc578da4 100644
--- a/package/cryptopp/cryptopp.hash
+++ b/package/cryptopp/cryptopp.hash
@@ -1,5 +1,5 @@
-# Hash from: https://www.cryptopp.com/release860.html:
-sha512  e7773f5e4a7dc7e8e735b1702524bee56ba38e5211544c9c9778bc51ed8dc7b376c17f2e406410043b636312336f26f76dc963f298872f8c13933e88c232fc03  cryptopp860.zip
+# Hash from: https://www.cryptopp.com/release890.html:
+sha512  903970c4c0312272e93bae0cc3477be66b273dd38c9329fda9f7157ec44e247a3bc16b9d2b4ad625f258af0eaf2dc2c4210d4d14829b455f180983859a5c4b41  cryptopp890.zip
 
 # Hash for license file:
-sha256  e668af8c73a38a66a1e8951d14ec24e7582fee5254dd6c3dae488a416d105d5f  License.txt
+sha256  78e4010b682cb94187fe0b57e50116d0ba271ef81104d1ddb35c80c3d81e3169  License.txt
diff --git a/package/cryptopp/cryptopp.mk b/package/cryptopp/cryptopp.mk
index 87d6fba237..a538f8c17d 100644
--- a/package/cryptopp/cryptopp.mk
+++ b/package/cryptopp/cryptopp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CRYPTOPP_VERSION = 8.6.0
+CRYPTOPP_VERSION = 8.9.0
 CRYPTOPP_SOURCE = cryptopp$(subst .,,$(CRYPTOPP_VERSION)).zip
 CRYPTOPP_SITE = https://cryptopp.com
 CRYPTOPP_LICENSE = BSL-1.0, BSD-3-Clause (CRYPTOGAMS), Public domain (ChaCha SSE2 and AVX)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
