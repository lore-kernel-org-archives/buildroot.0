Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAFACC001DE
	for <buildroot@archiver.kernel.org>; Sun, 30 Jul 2023 10:25:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7021160A8C;
	Sun, 30 Jul 2023 10:25:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7021160A8C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g3AKuq2KnNAO; Sun, 30 Jul 2023 10:25:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9D22460774;
	Sun, 30 Jul 2023 10:25:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9D22460774
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D20471BF41B
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 10:25:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B602081831
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 10:25:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B602081831
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KJd9YXVb-nxo for <buildroot@lists.busybox.net>;
 Sun, 30 Jul 2023 10:25:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D9D6781819
 for <buildroot@buildroot.org>; Sun, 30 Jul 2023 10:25:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D9D6781819
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C4BB283A53; Sun, 30 Jul 2023 10:25:01 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 30 Jul 2023 12:13:43 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a9523e3f72bc05fc2ecfa9ebf597fde0e512ff95
X-Git-Newrev: ba451d691b1444bfe7cb897fbe68b691a7597736
X-Patchwork-Hint: ignore
Message-Id: <20230730102501.C4BB283A53@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libde265: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=ba451d691b1444bfe7cb897fbe68b691a7597736
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Optional dependency of the upcoming libheif package.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                     |  1 +
 package/Config.in              |  1 +
 package/libde265/Config.in     | 12 ++++++++++++
 package/libde265/libde265.hash |  3 +++
 package/libde265/libde265.mk   | 13 +++++++++++++
 5 files changed, 30 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 8dbe16b467..25d49b0fc3 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -365,6 +365,7 @@ F:	package/libcec/
 F:	package/libdisplay-info/
 F:	package/libcodec2/
 F:	package/libcrossguid/
+F:	package/libde265/
 F:	package/libdeflate/
 F:	package/libdrm/
 F:	package/libdvbcsa/
diff --git a/package/Config.in b/package/Config.in
index 29a7daf6cc..d47c8e8f6b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1836,6 +1836,7 @@ menu "Multimedia"
 	source "package/libbluray/Config.in"
 	source "package/libcamera/Config.in"
 	source "package/libcamera-apps/Config.in"
+	source "package/libde265/Config.in"
 	source "package/libdvbcsa/Config.in"
 	source "package/libdvbpsi/Config.in"
 	source "package/libdvbsi/Config.in"
diff --git a/package/libde265/Config.in b/package/libde265/Config.in
new file mode 100644
index 0000000000..2436beff41
--- /dev/null
+++ b/package/libde265/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_LIBDE265
+	bool "libde265"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	help
+	  libde265 is an open source implementation of the h.265 video
+	  codec.
+
+	  https://github.com/strukturag/libde265
+
+comment "libde265 needs a toolchain w/ threads, C++"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP
diff --git a/package/libde265/libde265.hash b/package/libde265/libde265.hash
new file mode 100644
index 0000000000..168b5db395
--- /dev/null
+++ b/package/libde265/libde265.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  62185ea2182e68cf68bba20cc6eb4c287407b509cf0a827d7ddb75614db77b5c  libde265-1.0.12.tar.gz
+sha256  02cc1585a20677992e0ba578fa692635dc193735f2691dc81de924b51c4e8020  COPYING
diff --git a/package/libde265/libde265.mk b/package/libde265/libde265.mk
new file mode 100644
index 0000000000..60424c0de6
--- /dev/null
+++ b/package/libde265/libde265.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# libde265
+#
+################################################################################
+
+LIBDE265_VERSION = 1.0.12
+LIBDE265_SITE = https://github.com/strukturag/libde265/releases/download/v$(LIBDE265_VERSION)
+LIBDE265_LICENSE = LGPL-3.0+
+LIBDE265_LICENSE_FILES = COPYING
+LIBDE265_INSTALL_STAGING = YES
+
+$(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
