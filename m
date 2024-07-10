Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4D30C3DA41
	for <buildroot@archiver.kernel.org>; Wed, 10 Jul 2024 21:48:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 94B7861052;
	Wed, 10 Jul 2024 21:48:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y5-AA_EaDspa; Wed, 10 Jul 2024 21:47:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B93FA610D5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B93FA610D5;
	Wed, 10 Jul 2024 21:47:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1AD861BF292
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 21:47:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 14C2740249
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 21:47:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q3l4hCB7SSJe for <buildroot@lists.busybox.net>;
 Wed, 10 Jul 2024 21:47:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0138E40126
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0138E40126
 for <buildroot@buildroot.org>; Wed, 10 Jul 2024 21:47:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DCFBC847C4; Wed, 10 Jul 2024 21:47:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 10 Jul 2024 23:47:16 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 04ed3f0aa06b0eb4424f4fbd37c4c5f962eee58c
X-Git-Newrev: dd72e2102d401c4fe7b9d9cf39524a0ab814a816
X-Patchwork-Hint: ignore
Message-Id: <20240710214754.DCFBC847C4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tcl: bump to version 8.6.14
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=dd72e2102d401c4fe7b9d9cf39524a0ab814a816
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For release note, see:
https://sourceforge.net/projects/tcl/files/Tcl/8.6.14/tcltk-release-notes-8.6.14.txt

This commit also drops the package patch, which is no longer needed. The
upstream commit [1] completely removed the compatibility layer. The
entry in ".checkpackageignore" is also removed.

[1] https://github.com/tcltk/tcl/commit/04d66a25716cb7738dad3170cca4d0a4683db08a

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore                                |  1 -
 .../0001-Disable-tcl-compatibility-layers.patch    | 35 ----------------------
 package/tcl/tcl.hash                               |  2 +-
 package/tcl/tcl.mk                                 |  2 +-
 4 files changed, 2 insertions(+), 38 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 9eaf5b996d..e539c0a15f 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1370,7 +1370,6 @@ package/taskd/0001-Fix-missing-cmakedefine-HAVE_GET_CURRENT_DIR_NAME.patch lib_p
 package/taskd/0002-Use-correct-variables-for-GnuTLS-detection.patch lib_patch.Upstream
 package/taskd/0003-CMakeLists-use-pkg-config-uuid-detection.patch lib_patch.Upstream
 package/tcf-agent/S55tcf-agent Shellcheck lib_sysv.Variables
-package/tcl/0001-Disable-tcl-compatibility-layers.patch lib_patch.Upstream
 package/tftpd/0001-Use-extern-qualifier-to-fix-gcc-10.x-build.patch lib_patch.Upstream
 package/tftpd/S80tftpd-hpa Shellcheck lib_sysv.Indent lib_sysv.Variables
 package/ti-gfx/0001-newclkapi.patch lib_patch.Upstream
diff --git a/package/tcl/0001-Disable-tcl-compatibility-layers.patch b/package/tcl/0001-Disable-tcl-compatibility-layers.patch
deleted file mode 100644
index b7b776ad5d..0000000000
--- a/package/tcl/0001-Disable-tcl-compatibility-layers.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From c829552921f0c7c8e522f911135ee100742b441b Mon Sep 17 00:00:00 2001
-From: Andrew Ruder <andrew.ruder@elecsyscorp.com>
-Date: Tue, 8 Apr 2014 15:54:04 -0500
-Subject: [PATCH] Disable tcl compatibility layers
-
-Turn off building compatibility layers for old/broken versions of
-standard functions (strstr, strtoul, strtod) with the assumption that
-anything buildroot is using as a standard C library will be good enough
-to not have broken behavior.
-
-Signed-off-by: Andrew Ruder <andrew.ruder@elecsyscorp.com>
-[Fabrice: Update for 8.6.12]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Julien: Update for 8.6.13]
-Signed-off-by: Julien Olivain <ju.o@free.fr>
----
- unix/tcl.m4 | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/unix/tcl.m4 b/unix/tcl.m4
-index ca94abd4ad..42eb58d384 100644
---- a/unix/tcl.m4
-+++ b/unix/tcl.m4
-@@ -2646,7 +2646,7 @@ AC_DEFUN([SC_TCL_CHECK_BROKEN_FUNC],[
- #include <stdlib.h>
- #include <string.h>
- int main() {]$2[}]]])],[tcl_cv_$1_unbroken=ok],
--		[tcl_cv_$1_unbroken=broken],[tcl_cv_$1_unbroken=unknown]))
-+		[tcl_cv_$1_unbroken=broken],[tcl_cv_$1_unbroken=ok]))
- 	if test ["$tcl_cv_]$1[_unbroken"] = "ok"; then
- 	    tcl_ok=1
- 	else
--- 
-2.41.0
-
diff --git a/package/tcl/tcl.hash b/package/tcl/tcl.hash
index 109ea3d79c..9e1f8fcaf5 100644
--- a/package/tcl/tcl.hash
+++ b/package/tcl/tcl.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  43a1fae7412f61ff11de2cfd05d28cfc3a73762f354a417c62370a54e2caf066  tcl8.6.13-src.tar.gz
+sha256  5880225babf7954c58d4fb0f5cf6279104ce1cd6aa9b71e9a6322540e1c4de66  tcl8.6.14-src.tar.gz
 sha256  c0a69a2bfd757361ec7e6143973b103c90409316b49e9c88db26ad6388e79f16  license.terms
diff --git a/package/tcl/tcl.mk b/package/tcl/tcl.mk
index 18171aebd7..8968f0f262 100644
--- a/package/tcl/tcl.mk
+++ b/package/tcl/tcl.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 TCL_VERSION_MAJOR = 8.6
-TCL_VERSION = $(TCL_VERSION_MAJOR).13
+TCL_VERSION = $(TCL_VERSION_MAJOR).14
 TCL_SOURCE = tcl$(TCL_VERSION)-src.tar.gz
 TCL_SITE = http://downloads.sourceforge.net/project/tcl/Tcl/$(TCL_VERSION)
 TCL_LICENSE = TCL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
