Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40D09C282D1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:33:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 75EE042D65;
	Fri, 28 Feb 2025 16:33:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j8LpuBdRAhkM; Fri, 28 Feb 2025 16:33:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 096844EF65
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 096844EF65;
	Fri, 28 Feb 2025 16:33:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id CA8A468
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B847880F55
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1k7B0ikP6sU6 for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:29:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A23E280F19
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A23E280F19
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9147485B5E; Fri, 28 Feb 2025 16:29:51 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 29 Dec 2024 19:24:19 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: c1bff80867fcf0c6ffbca555392b68594b150328
X-Git-Newrev: 4af6fb64f3e8cdfd3a535c62a8402b2bcb1f375b
X-Patchwork-Hint: ignore
Message-Id: <20250228162951.9147485B5E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/directfb-examples:
 remove package
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=4af6fb64f3e8cdfd3a535c62a8402b2bcb1f375b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

directfb.org is dead so since commit
89ab2a5a3f4588891ab1e9e76feb8c3f69402d5c (from 2022), we are
downloading from sources.buildroot.net.

Clearly DirectFB 1.x is no longer maintained. A DirectFB 2.x project
is now at https://github.com/directfb2/, but despite an attempt in
August 2024 [1], it still isn't packaged in Buildroot. Therefore it's
time to drop directfb 1.x, which doesn't prevent in the future from
adding directfb 2.x.

[1] https://lore.kernel.org/buildroot/20240705132544.351613-1-shengwen1997.tw@gmail.com/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .checkpackageignore                               |  1 -
 Config.in.legacy                                  |  7 +++++++
 package/Config.in                                 |  1 -
 package/directfb-examples/0001-remove-bzero.patch | 17 -----------------
 package/directfb-examples/Config.in               | 11 -----------
 package/directfb-examples/directfb-examples.hash  |  3 ---
 package/directfb-examples/directfb-examples.mk    | 18 ------------------
 7 files changed, 7 insertions(+), 51 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 37cd4c9460..37b3a1dd76 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -399,7 +399,6 @@ package/dht/0001-cmake.patch lib_patch.Upstream
 package/dillo/0001-usr-local-include.patch lib_patch.Upstream
 package/dillo/0002-Fix-openssl-detection.patch lib_patch.Upstream
 package/dillo/0004-fix-build-with-gcc-10.patch lib_patch.Upstream
-package/directfb-examples/0001-remove-bzero.patch lib_patch.Sob lib_patch.Upstream
 package/directfb/0001-fix-missing-davinci-voodoo-header.patch lib_patch.Upstream
 package/directfb/0002-imlib2-config.patch lib_patch.Upstream
 package/directfb/0003-setregion-lock.patch lib_patch.Upstream
diff --git a/Config.in.legacy b/Config.in.legacy
index ed74bf15c2..34e2319949 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2025.02"
 
+config BR2_PACKAGE_DIRECTFB_EXAMPLES
+	bool "directfb-examples has been removed"
+	select BR2_LEGACY
+	help
+	  This package was no longer maintained upstream, so it was
+	  dropped from Buildroot.
+
 config BR2_PACKAGE_HIAWATHA
 	bool "hiwatha has been removed"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index 814101458d..bbd46bd491 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -345,7 +345,6 @@ comment "Graphic applications"
 comment "Graphic libraries"
 	source "package/cegui/Config.in"
 	source "package/directfb/Config.in"
-	source "package/directfb-examples/Config.in"
 	source "package/efl/Config.in"
 	source "package/fb-test-app/Config.in"
 	source "package/fbdump/Config.in"
diff --git a/package/directfb-examples/0001-remove-bzero.patch b/package/directfb-examples/0001-remove-bzero.patch
deleted file mode 100644
index 41616b5c31..0000000000
--- a/package/directfb-examples/0001-remove-bzero.patch
+++ /dev/null
@@ -1,17 +0,0 @@
----
- src/df_knuckles/matrix.c |    2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-Index: directfb-examples-1.2.0/src/df_knuckles/matrix.c
-===================================================================
---- directfb-examples-1.2.0.orig/src/df_knuckles/matrix.c
-+++ directfb-examples-1.2.0/src/df_knuckles/matrix.c
-@@ -19,7 +19,7 @@
- static float Cosine[3600];
- static float Sine[3600];
- 
--#define M_CLEAR(m) bzero(m, MATRIX_SIZE)
-+#define M_CLEAR(m) memset(m, 0, MATRIX_SIZE)
- #define M_IDENTITY(m) memcpy(m, IdentityMatrix, MATRIX_SIZE)
- 
- static void MultiplyMatrix(float *A, float *B)
diff --git a/package/directfb-examples/Config.in b/package/directfb-examples/Config.in
deleted file mode 100644
index 4d5de03068..0000000000
--- a/package/directfb-examples/Config.in
+++ /dev/null
@@ -1,11 +0,0 @@
-config BR2_PACKAGE_DIRECTFB_EXAMPLES
-	bool "directfb examples"
-	depends on BR2_PACKAGE_DIRECTFB
-	help
-	  The DirectFB-examples package contains a set of simple
-	  DirectFB applications that can be used to test and demonstrate
-	  various DirectFB features. As of 4 October 2015, DirectFB's
-	  website http://www.directfb.org/ is down. See alternative site
-	  listed below.
-
-	  http://elinux.org/DirectFB
diff --git a/package/directfb-examples/directfb-examples.hash b/package/directfb-examples/directfb-examples.hash
deleted file mode 100644
index 9c7f7c25a7..0000000000
--- a/package/directfb-examples/directfb-examples.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally computed
-sha256  9a2104cc4da8123c8371813551b66b943198979f745cbebc034bb5e10844122a  DirectFB-examples-1.7.0.tar.gz
-sha256  f91483684678e8aa8ccc4ee0ede3140b0494f8305e162695c7e6e3f83e54f236  COPYING
diff --git a/package/directfb-examples/directfb-examples.mk b/package/directfb-examples/directfb-examples.mk
deleted file mode 100644
index c8d09b3e33..0000000000
--- a/package/directfb-examples/directfb-examples.mk
+++ /dev/null
@@ -1,18 +0,0 @@
-################################################################################
-#
-# directfb-examples
-#
-################################################################################
-
-DIRECTFB_EXAMPLES_VERSION = 1.7.0
-DIRECTFB_EXAMPLES_SITE = http://sources.buildroot.net/directfb-examples
-DIRECTFB_EXAMPLES_SOURCE = DirectFB-examples-$(DIRECTFB_EXAMPLES_VERSION).tar.gz
-DIRECTFB_EXAMPLES_LICENSE = MIT
-DIRECTFB_EXAMPLES_LICENSE_FILES = COPYING
-DIRECTFB_EXAMPLES_DEPENDENCIES = directfb
-
-ifeq ($(BR2_STATIC_LIBS),y)
-DIRECTFB_EXAMPLES_CONF_OPTS += LIBS=-lstdc++
-endif
-
-$(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
