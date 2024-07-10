Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8E2FC3DA41
	for <buildroot@archiver.kernel.org>; Wed, 10 Jul 2024 21:32:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 622FF61063;
	Wed, 10 Jul 2024 21:32:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6S2xYeI1Tc8G; Wed, 10 Jul 2024 21:32:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4EEBF61026
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4EEBF61026;
	Wed, 10 Jul 2024 21:32:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E2A2F1BF292
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 21:32:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CF3A9413AB
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 21:32:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1Pv5z0e3zA3A for <buildroot@lists.busybox.net>;
 Wed, 10 Jul 2024 21:32:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 395E041365
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 395E041365
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 395E041365
 for <buildroot@buildroot.org>; Wed, 10 Jul 2024 21:32:38 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id B205CB004FF;
 Wed, 10 Jul 2024 23:32:34 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Wed, 10 Jul 2024 23:32:28 +0200
Message-ID: <20240710213228.540715-1-ju.o@free.fr>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1720647156;
 bh=fnwTg8YkgRuBUYg7wSgMTn0qTMDv5VKaoxnYL+5FYSM=;
 h=From:To:Cc:Subject:Date:From;
 b=a6bP+YNssuaaS9c8hqN8tZBB/5xHD84PbUfpioT1Aszrz5bJnJ0YK4tfNsJt2rjI+
 M/OMZ9mgzb1Td7e7EJ6ZpAZZqOhR1EUbLU4IiZOi9Lbp4QIbHJtlAlsM/+QtrhJ8Qh
 LlUFXHKoHXQaa75mDpaFGc7dCJe2pjlLxHEz4KEPJ9QcplnVvJs30LSWWt8s2IKGpw
 B6kSvSeTXGB5SOSpfm/NImeT47gzVAh451EkCNF4wTDaXrwDWWAT4Pa1K1bEaaAAHD
 xkYJSayTv1qPItn01+oRGm4XpxckHfj/tmxwBtoRWMRc9DQykNFEel7/X9OO9xE3uC
 ziuA+V57okPxA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=a6bP+YNs
Subject: [Buildroot] [PATCH 1/1] package/tcl: bump to version 8.6.14
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
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For release note, see:
https://sourceforge.net/projects/tcl/files/Tcl/8.6.14/tcltk-release-notes-8.6.14.txt

This commit also drops the package patch, which is no longer needed. The
upstream commit [1] completely removed the compatibility layer. The
entry in ".checkpackageignore" is also removed.

[1] https://github.com/tcltk/tcl/commit/04d66a25716cb7738dad3170cca4d0a4683db08a

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .checkpackageignore                           |  1 -
 ...001-Disable-tcl-compatibility-layers.patch | 35 -------------------
 package/tcl/tcl.hash                          |  2 +-
 package/tcl/tcl.mk                            |  2 +-
 4 files changed, 2 insertions(+), 38 deletions(-)
 delete mode 100644 package/tcl/0001-Disable-tcl-compatibility-layers.patch

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
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
