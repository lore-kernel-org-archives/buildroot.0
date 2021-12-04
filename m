Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43229C433EF
	for <buildroot@archiver.kernel.org>; Mon,  6 Dec 2021 18:43:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F36E760D6E;
	Mon,  6 Dec 2021 18:43:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nqUu6o9xW9yD; Mon,  6 Dec 2021 18:43:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 58E7360D68;
	Mon,  6 Dec 2021 18:43:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 25AB11BF983
 for <buildroot@lists.busybox.net>; Mon,  6 Dec 2021 18:14:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E4D1441C72
 for <buildroot@lists.busybox.net>; Mon,  6 Dec 2021 18:12:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RpEwSmuR7Mln for <buildroot@lists.busybox.net>;
 Mon,  6 Dec 2021 18:12:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 15D6C41C70
 for <buildroot@buildroot.org>; Mon,  6 Dec 2021 18:12:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id B321081503; Mon,  6 Dec 2021 18:07:42 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 4 Dec 2021 22:58:29 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 13d4856b916d797c3c771669edd3eb883336766f
X-Git-Newrev: fe0e1020a3ec1c00fd1c8615bace962c720e0e46
X-Patchwork-Hint: ignore
Message-Id: <20211206180742.B321081503@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/kodi-pvr-plutotv: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=fe0e1020a3ec1c00fd1c8615bace962c720e0e46
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/kodi-pvr-plutotv/Config.in             |  7 +++++++
 package/kodi-pvr-plutotv/kodi-pvr-plutotv.hash |  3 +++
 package/kodi-pvr-plutotv/kodi-pvr-plutotv.mk   | 13 +++++++++++++
 package/kodi/Config.in                         |  1 +
 4 files changed, 24 insertions(+)

diff --git a/package/kodi-pvr-plutotv/Config.in b/package/kodi-pvr-plutotv/Config.in
new file mode 100644
index 0000000000..37441283ce
--- /dev/null
+++ b/package/kodi-pvr-plutotv/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_KODI_PVR_PLUTOTV
+	bool "kodi-pvr-plutotv"
+	select BR2_PACKAGE_RAPIDJSON
+	help
+	  Pluto.tv PVR Client for Kodi
+
+	  https://github.com/kodi-pvr/pvr.plutotv
diff --git a/package/kodi-pvr-plutotv/kodi-pvr-plutotv.hash b/package/kodi-pvr-plutotv/kodi-pvr-plutotv.hash
new file mode 100644
index 0000000000..3ad0d4e875
--- /dev/null
+++ b/package/kodi-pvr-plutotv/kodi-pvr-plutotv.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  0b85c5c9583239bcecccccc2c43fc6d604bf5a4e4304238c8635410823ab8ae3  kodi-pvr-plutotv-19.0.0-Matrix.tar.gz
+sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-plutotv/kodi-pvr-plutotv.mk b/package/kodi-pvr-plutotv/kodi-pvr-plutotv.mk
new file mode 100644
index 0000000000..15c7135880
--- /dev/null
+++ b/package/kodi-pvr-plutotv/kodi-pvr-plutotv.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# kodi-pvr-plutotv
+#
+################################################################################
+
+KODI_PVR_PLUTOTV_VERSION = 19.0.0-Matrix
+KODI_PVR_PLUTOTV_SITE = $(call github,kodi-pvr,pvr.plutotv,$(KODI_PVR_PLUTOTV_VERSION))
+KODI_PVR_PLUTOTV_LICENSE = GPL-2.0+
+KODI_PVR_PLUTOTV_LICENSE_FILES = LICENSE.md
+KODI_PVR_PLUTOTV_DEPENDENCIES = kodi rapidjson
+
+$(eval $(cmake-package))
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 38c14555ab..f436a444d3 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -305,6 +305,7 @@ menu "PVR addons"
 	source "package/kodi-pvr-njoy/Config.in"
 	source "package/kodi-pvr-octonet/Config.in"
 	source "package/kodi-pvr-pctv/Config.in"
+	source "package/kodi-pvr-plutotv/Config.in"
 	source "package/kodi-pvr-stalker/Config.in"
 	source "package/kodi-pvr-vbox/Config.in"
 	source "package/kodi-pvr-vdr-vnsi/Config.in"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
