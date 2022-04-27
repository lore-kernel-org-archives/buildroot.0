Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCB94C4332F
	for <buildroot@archiver.kernel.org>; Wed, 27 Apr 2022 18:59:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8699A61001;
	Wed, 27 Apr 2022 18:59:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tTjlzG3ZnqlT; Wed, 27 Apr 2022 18:59:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7AEB360EE2;
	Wed, 27 Apr 2022 18:59:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3E9131BF322
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 18:57:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 33FEA41A2E
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 18:57:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GD0BLNnIqa1I for <buildroot@lists.busybox.net>;
 Wed, 27 Apr 2022 18:57:45 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 26A8E418D4
 for <buildroot@buildroot.org>; Wed, 27 Apr 2022 18:57:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 812EA845FF; Wed, 27 Apr 2022 18:47:26 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 27 Apr 2022 20:50:16 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0f42b67077a8f620f66c654c92518cf53efb9a92
X-Git-Newrev: 1e7f5587236831893f25d2147cdc939136c23c7e
X-Patchwork-Hint: ignore
Message-Id: <20220427184726.812EA845FF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libgcrypt: bump to version 1.10.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=1e7f5587236831893f25d2147cdc939136c23c7e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

remove upstream patch

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...nfigure.ac-add-an-option-to-disable-tests.patch |  2 +-
 ...itterentropy-Include-fcntl-h-and-limits-h.patch | 38 ----------------------
 package/libgcrypt/libgcrypt.hash                   |  4 +--
 package/libgcrypt/libgcrypt.mk                     |  2 +-
 4 files changed, 4 insertions(+), 42 deletions(-)

diff --git a/package/libgcrypt/0001-configure.ac-add-an-option-to-disable-tests.patch b/package/libgcrypt/0001-configure.ac-add-an-option-to-disable-tests.patch
index e32f938634..5ddde9df1b 100644
--- a/package/libgcrypt/0001-configure.ac-add-an-option-to-disable-tests.patch
+++ b/package/libgcrypt/0001-configure.ac-add-an-option-to-disable-tests.patch
@@ -44,7 +44,7 @@ diff --git a/configure.ac b/configure.ac
 index e8c8cd39..1a6b61e5 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3230,6 +3230,16 @@ AC_ARG_ENABLE([doc], AC_HELP_STRING([--disable-doc],
+@@ -3231,6 +3231,16 @@ AC_ARG_ENABLE([doc], AC_HELP_STRING([--disable-doc],
  AM_CONDITIONAL([BUILD_DOC], [test "x$build_doc" != xno])
  
  
diff --git a/package/libgcrypt/0002-jitterentropy-Include-fcntl-h-and-limits-h.patch b/package/libgcrypt/0002-jitterentropy-Include-fcntl-h-and-limits-h.patch
deleted file mode 100644
index 8f76f24c64..0000000000
--- a/package/libgcrypt/0002-jitterentropy-Include-fcntl-h-and-limits-h.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From ffaef0be613121d3ee37867d82932a7a30c2bc6d Mon Sep 17 00:00:00 2001
-From: Heiko Becker <heirecka@exherbo.org>
-Date: Thu, 3 Feb 2022 22:46:41 +0000
-Subject: [PATCH] jitterentropy: Include <fcntl.h> and <limits.h>
-
-* random/jitterentropy-base-user.h: Include <fcntl.h> for O_RDONLY
-* random/jitterentropy-base-user.h: Include <limits.h> for LONG_MAX
-
---
-
-Fixes the build with musl libc.
-
-Signed-off-by: Heiko Becker <heirecka@exherbo.org>
-
-[Retrieved from:
-https://git.gnupg.org/cgi-bin/gitweb.cgi?p=libgcrypt.git;a=commit;h=ffaef0be613121d3ee37867d82932a7a30c2bc6d]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- random/jitterentropy-base-user.h | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/random/jitterentropy-base-user.h b/random/jitterentropy-base-user.h
-index 326dfbed..389106ff 100644
---- a/random/jitterentropy-base-user.h
-+++ b/random/jitterentropy-base-user.h
-@@ -39,6 +39,9 @@
-  * DAMAGE.
-  */
- 
-+#include <fcntl.h>
-+#include <limits.h>
-+
- #ifndef GCRYPT_JITTERENTROPY_BASE_USER_H
- #define GCRYPT_JITTERENTROPY_BASE_USER_H
- 
--- 
-2.11.0
-
diff --git a/package/libgcrypt/libgcrypt.hash b/package/libgcrypt/libgcrypt.hash
index 2ea4d74c2e..96f5e6b76c 100644
--- a/package/libgcrypt/libgcrypt.hash
+++ b/package/libgcrypt/libgcrypt.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking signature
-# https://gnupg.org/ftp/gcrypt/libgcrypt/libgcrypt-1.10.0.tar.bz2.sig
+# https://gnupg.org/ftp/gcrypt/libgcrypt/libgcrypt-1.10.1.tar.bz2.sig
 # using key 6DAA6E64A76D2840571B4902528897B826403ADA
-sha256  6a00f5c05caa4c4acc120c46b63857da0d4ff61dc4b4b03933fa8d46013fae81  libgcrypt-1.10.0.tar.bz2
+sha256  ef14ae546b0084cd84259f61a55e07a38c3b53afc0f546bffcef2f01baffe9de  libgcrypt-1.10.1.tar.bz2
 sha256  ca0061fc1381a3ab242310e4b3f56389f28e3d460eb2fd822ed7a21c6f030532  COPYING.LIB
diff --git a/package/libgcrypt/libgcrypt.mk b/package/libgcrypt/libgcrypt.mk
index c6c88f6076..f28552c6e7 100644
--- a/package/libgcrypt/libgcrypt.mk
+++ b/package/libgcrypt/libgcrypt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGCRYPT_VERSION = 1.10.0
+LIBGCRYPT_VERSION = 1.10.1
 LIBGCRYPT_SOURCE = libgcrypt-$(LIBGCRYPT_VERSION).tar.bz2
 LIBGCRYPT_LICENSE = LGPL-2.1+
 LIBGCRYPT_LICENSE_FILES = COPYING.LIB
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
