Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E5E3C636D6
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 23:52:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B746D843CC;
	Mon, 20 Feb 2023 23:52:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B746D843CC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t6RFXHNKHbay; Mon, 20 Feb 2023 23:52:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D51EC843D0;
	Mon, 20 Feb 2023 23:52:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D51EC843D0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4A81B1BF8C7
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:58:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 410694159C
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 410694159C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aZP4harJGsYD for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:44 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 367E341783
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 367E341783
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1DFAF8648F; Mon, 20 Feb 2023 20:52:44 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 29 Jan 2023 23:24:32 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 1e645ff7475710f4af9341602471dbeac387c776
X-Git-Newrev: ed6062efbcda90eee7f523b3d63deb1fc36e4a17
X-Patchwork-Hint: ignore
Message-Id: <20230220205244.1DFAF8648F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/fxdiv: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=ed6062efbcda90eee7f523b3d63deb1fc36e4a17
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This package is required by tensorflow-lite.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 DEVELOPERS               |  1 +
 package/Config.in        |  1 +
 package/fxdiv/Config.in  |  7 +++++++
 package/fxdiv/fxdiv.hash |  4 ++++
 package/fxdiv/fxdiv.mk   | 19 +++++++++++++++++++
 5 files changed, 32 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 8a652c7c12..706ee80ece 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1339,6 +1339,7 @@ N:	James Hilliard <james.hilliard1@gmail.com>
 F:	package/apcupsd/
 F:	package/bpftool/
 F:	package/exfatprogs/
+F:	package/fxdiv/
 F:	package/gensio/
 F:	package/lua-std-debug/
 F:	package/lua-std-normalize/
diff --git a/package/Config.in b/package/Config.in
index 96a44a3623..83fddf316f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2014,6 +2014,7 @@ menu "Other"
 	source "package/flann/Config.in"
 	source "package/flatbuffers/Config.in"
 	source "package/flatcc/Config.in"
+	source "package/fxdiv/Config.in"
 	source "package/gconf/Config.in"
 	source "package/gdal/Config.in"
 	source "package/gflags/Config.in"
diff --git a/package/fxdiv/Config.in b/package/fxdiv/Config.in
new file mode 100644
index 0000000000..5aa714e44a
--- /dev/null
+++ b/package/fxdiv/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_FXDIV
+	bool "fxdiv"
+	help
+	  Header-only library for division via fixed-point
+	  multiplication by inverse.
+
+	  https://github.com/Maratyszcza/FXdiv
diff --git a/package/fxdiv/fxdiv.hash b/package/fxdiv/fxdiv.hash
new file mode 100644
index 0000000000..2142d84e09
--- /dev/null
+++ b/package/fxdiv/fxdiv.hash
@@ -0,0 +1,4 @@
+# Locally calculated
+sha256  ec74d882a0a47cfd9c0f95bc4fae9901a4ade802a96a3b76e02671bb7340a4c5  fxdiv-63058eff77e11aa15bf531df5dd34395ec3017c8.tar.gz
+# License files, locally calculated
+sha256  7cac00006125b1486a27e4801ed66357236e984c540bd323945ab7b66b078ec3  LICENSE
diff --git a/package/fxdiv/fxdiv.mk b/package/fxdiv/fxdiv.mk
new file mode 100644
index 0000000000..06dbf0648d
--- /dev/null
+++ b/package/fxdiv/fxdiv.mk
@@ -0,0 +1,19 @@
+################################################################################
+#
+# fxdiv
+#
+################################################################################
+
+FXDIV_VERSION = 63058eff77e11aa15bf531df5dd34395ec3017c8
+FXDIV_SITE = $(call github,Maratyszcza,FXdiv,$(FXDIV_VERSION))
+FXDIV_LICENSE = MIT
+FXDIV_LICENSE_FILES = LICENSE
+FXDIV_INSTALL_STAGING = YES
+# Only installs a header
+FXDIV_INSTALL_TARGET = NO
+
+FXDIV_CONF_OPTS = \
+	-DFXDIV_BUILD_TESTS=OFF \
+	-DFXDIV_BUILD_BENCHMARKS=OFF
+
+$(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
