Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F98FD74958
	for <buildroot@archiver.kernel.org>; Thu, 31 Oct 2024 12:51:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EFA3A60603;
	Thu, 31 Oct 2024 12:51:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l5UCapft_ARK; Thu, 31 Oct 2024 12:51:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CD9CE60625
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CD9CE60625;
	Thu, 31 Oct 2024 12:51:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id F103C5E54
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 12:51:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CD24D401F1
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 12:51:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YkHITg8J3uIX for <buildroot@buildroot.org>;
 Thu, 31 Oct 2024 12:51:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 67A1F40DE3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 67A1F40DE3
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 12:51:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 62C4C84F30; Thu, 31 Oct 2024 12:51:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 31 Oct 2024 13:49:51 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 967ba5386d4e15102db88a9faae1845b3e69dc6f
X-Git-Newrev: c5636c494dc1c2d7172aedb135e190131edc1d50
X-Patchwork-Hint: ignore
Message-Id: <20241031125106.62C4C84F30@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/bsdiff: drop package
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5874410949089656971=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5874410949089656971==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=c5636c494dc1c2d7172aedb135e190131edc1d50
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As advocated by Thomas Petazzoni [1], drop bsdiff as it is not maintained
anymore.

Meanwhile, autobuild also detected that the package was no longer
downloadable from the URL, and indeed, Colin Percival, the maintainer,
confirmed that he intentionally disabled the package download due to the
presence of some security bugs that he doesn't have time to fix.

[1] https://patchwork.ozlabs.org/project/buildroot/patch/20241004215451.1198861-2-dario.binacchi@amarulasolutions.com/

Fixes:
- http://autobuild.buildroot.org/results/21bb827d3dbf553c79f49d7c184099c75df3d45d

Suggested-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore                                |  1 -
 Config.in.legacy                                   |  7 ++++++
 package/Config.in                                  |  1 -
 .../0001-Add-missing-header-for-u_char.patch       | 17 --------------
 package/bsdiff/Config.in                           |  8 -------
 package/bsdiff/bsdiff.hash                         |  4 ----
 package/bsdiff/bsdiff.mk                           | 26 ----------------------
 7 files changed, 7 insertions(+), 57 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 91e31eebc5..eceea28f0c 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -335,7 +335,6 @@ package/brickd/S70brickd Shellcheck lib_sysv.Indent lib_sysv.Variables
 package/bridge-utils/0001-fix-build-on-musl.patch lib_patch.Upstream
 package/brltty/0001-Fix-linking-error-on-mips64el.patch lib_patch.Upstream
 package/brltty/S10brltty Shellcheck lib_sysv.Indent lib_sysv.Variables
-package/bsdiff/0001-Add-missing-header-for-u_char.patch lib_patch.Upstream
 package/bustle/0001-Makefile-fix-pcap-config-call.patch lib_patch.Upstream
 package/busybox/0001-networking-libiproute-use-linux-if_packet.h-instead-.patch lib_patch.Upstream
 package/busybox/0002-Makefile.flags-strip-non-l-arguments-returned-by-pkg.patch lib_patch.Upstream
diff --git a/Config.in.legacy b/Config.in.legacy
index 30179add23..63360b42b8 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2024.11"
 
+config BR2_PACKAGE_BSDIFF
+	bool "bsdiff has been removed"
+	select BR2_LEGACY
+	help
+	  The bsdiff package was removed as it is not maintained
+	  anymore (no commit since 2014).
+
 config BR2_PACKAGE_PROCPS_NS_ORIGINAL_TOP
 	bool "BR2_PACKAGE_PROCPS_NS_ORIGINAL_TOP has been renamed"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index b1e999a63b..876b340a8a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -172,7 +172,6 @@ menu "Development tools"
 	source "package/bats-core/Config.in"
 	source "package/binutils/Config.in"
 	source "package/bitwise/Config.in"
-	source "package/bsdiff/Config.in"
 	source "package/bustle/Config.in"
 	source "package/check/Config.in"
 	source "package/cmake/Config.in"
diff --git a/package/bsdiff/0001-Add-missing-header-for-u_char.patch b/package/bsdiff/0001-Add-missing-header-for-u_char.patch
deleted file mode 100644
index 56affb4102..0000000000
--- a/package/bsdiff/0001-Add-missing-header-for-u_char.patch
+++ /dev/null
@@ -1,17 +0,0 @@
-bspatch: Fix missing header <sys/types.h> for u_char
-
-Fixes http://autobuild.buildroot.net/results/31a/31a837cf6e34b02dce498f2b12e40d6d16a5a8e6/
-
-Signed-off-by: Jörg Krause <joerg.krause@embedded.rocks>
-
-diff -purN bsdiff-4.3.orig/bspatch.c bsdiff-4.3/bspatch.c
---- bsdiff-4.3.orig/bspatch.c	2015-04-30 13:47:26.485903359 +0200
-+++ bsdiff-4.3/bspatch.c	2015-04-30 13:48:14.808908672 +0200
-@@ -35,6 +35,7 @@ __FBSDID("$FreeBSD: src/usr.bin/bsdiff/b
- #include <err.h>
- #include <unistd.h>
- #include <fcntl.h>
-+#include <sys/types.h>
-
- static off_t offtin(u_char *buf)
- {
diff --git a/package/bsdiff/Config.in b/package/bsdiff/Config.in
deleted file mode 100644
index 11fd8b9d35..0000000000
--- a/package/bsdiff/Config.in
+++ /dev/null
@@ -1,8 +0,0 @@
-config BR2_PACKAGE_BSDIFF
-	bool "bsdiff"
-	select BR2_PACKAGE_BZIP2
-	help
-	  Binary patch/diff like xdelta but creates smaller diffs.
-	  Needs bzip2 support.
-
-	  http://www.daemonology.net/bsdiff/
diff --git a/package/bsdiff/bsdiff.hash b/package/bsdiff/bsdiff.hash
deleted file mode 100644
index 102086b9fc..0000000000
--- a/package/bsdiff/bsdiff.hash
+++ /dev/null
@@ -1,4 +0,0 @@
-# From http://www.daemonology.net/bsdiff/:
-md5  e6d812394f0e0ecc8d5df255aa1db22a  bsdiff-4.3.tar.gz
-# locally computed
-sha256  fc0a6e634ef77dcf14bf36c7b6d1e57ba1ac5c4809073dfaacb3b5f7ab277eb7  bsdiff.c
diff --git a/package/bsdiff/bsdiff.mk b/package/bsdiff/bsdiff.mk
deleted file mode 100644
index 97a1b3921d..0000000000
--- a/package/bsdiff/bsdiff.mk
+++ /dev/null
@@ -1,26 +0,0 @@
-################################################################################
-#
-# bsdiff
-#
-################################################################################
-
-BSDIFF_VERSION = 4.3
-BSDIFF_SITE = http://www.daemonology.net/bsdiff
-BSDIFF_DEPENDENCIES = bzip2
-BSDIFF_LICENSE = BSD-2-Clause
-BSDIFF_LICENSE_FILES = bsdiff.c
-BSDIFF_CPE_ID_VENDOR = daemonology
-
-define BSDIFF_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_LDFLAGS) \
-		$(@D)/bsdiff.c -lbz2 -o $(@D)/bsdiff
-	$(TARGET_MAKE_ENV) $(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_LDFLAGS) \
-		$(@D)/bspatch.c -lbz2 -o $(@D)/bspatch
-endef
-
-define BSDIFF_INSTALL_TARGET_CMDS
-	$(INSTALL) -D -m 755 $(@D)/bsdiff $(TARGET_DIR)/usr/bin/bsdiff
-	$(INSTALL) -D -m 755 $(@D)/bspatch $(TARGET_DIR)/usr/bin/bspatch
-endef
-
-$(eval $(generic-package))

--===============5874410949089656971==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5874410949089656971==--
