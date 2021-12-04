Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D4C2C433F5
	for <buildroot@archiver.kernel.org>; Sat,  4 Dec 2021 20:52:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B870D60A87;
	Sat,  4 Dec 2021 20:52:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iIaaX64zV5sV; Sat,  4 Dec 2021 20:52:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1604C60A83;
	Sat,  4 Dec 2021 20:52:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6928E1BF2C6
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 20:52:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 55897405EE
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 20:52:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JTs8bLmIeVjB for <buildroot@lists.busybox.net>;
 Sat,  4 Dec 2021 20:52:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 989F7405D0
 for <buildroot@buildroot.org>; Sat,  4 Dec 2021 20:52:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 80EB9928E5; Sat,  4 Dec 2021 20:47:15 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 4 Dec 2021 21:48:14 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 8736da7cbae5852946f4e14d3952f527d1e835c4
X-Git-Newrev: b017b8d3499fa1c86f5d23b084731a7ac104444d
X-Patchwork-Hint: ignore
Message-Id: <20211204204715.80EB9928E5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/kodi-pvr-waipu: new
 package
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

commit: https://git.buildroot.net/buildroot/commit/?id=b017b8d3499fa1c86f5d23b084731a7ac104444d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/kodi-pvr-waipu/Config.in           |  7 +++++++
 package/kodi-pvr-waipu/kodi-pvr-waipu.hash |  3 +++
 package/kodi-pvr-waipu/kodi-pvr-waipu.mk   | 13 +++++++++++++
 package/kodi/Config.in                     |  1 +
 4 files changed, 24 insertions(+)

diff --git a/package/kodi-pvr-waipu/Config.in b/package/kodi-pvr-waipu/Config.in
new file mode 100644
index 0000000000..ee0cc2bdad
--- /dev/null
+++ b/package/kodi-pvr-waipu/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_KODI_PVR_WAIPU
+	bool "kodi-pvr-waipu"
+	select BR2_PACKAGE_RAPIDJSON
+	help
+	  Waipu.tv PVR Plugin for Kodi
+
+	  https://github.com/flubshi/pvr.waipu
diff --git a/package/kodi-pvr-waipu/kodi-pvr-waipu.hash b/package/kodi-pvr-waipu/kodi-pvr-waipu.hash
new file mode 100644
index 0000000000..7ec107c1e0
--- /dev/null
+++ b/package/kodi-pvr-waipu/kodi-pvr-waipu.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  19e7a9b1d332d18e7e539062d0de1ef35d78c9beadb67f1ac9b95ab204aa5bce  kodi-pvr-waipu-19.0.1-Matrix.tar.gz
+sha256  4202d4fb329f58c83ba921b56d7071e37f7df3f15b3820a3a04ef8eee49f54d2  pvr.waipu/LICENSE.txt
diff --git a/package/kodi-pvr-waipu/kodi-pvr-waipu.mk b/package/kodi-pvr-waipu/kodi-pvr-waipu.mk
new file mode 100644
index 0000000000..8ab7ca6985
--- /dev/null
+++ b/package/kodi-pvr-waipu/kodi-pvr-waipu.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# kodi-pvr-waipu
+#
+################################################################################
+
+KODI_PVR_WAIPU_VERSION = 19.0.1-Matrix
+KODI_PVR_WAIPU_SITE = $(call github,flubshi,pvr.waipu,$(KODI_PVR_WAIPU_VERSION))
+KODI_PVR_WAIPU_LICENSE = GPL-2.0+
+KODI_PVR_WAIPU_LICENSE_FILES = pvr.waipu/LICENSE.txt
+KODI_PVR_WAIPU_DEPENDENCIES = kodi rapidjson
+
+$(eval $(cmake-package))
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index e594219418..38c14555ab 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -309,6 +309,7 @@ menu "PVR addons"
 	source "package/kodi-pvr-vbox/Config.in"
 	source "package/kodi-pvr-vdr-vnsi/Config.in"
 	source "package/kodi-pvr-vuplus/Config.in"
+	source "package/kodi-pvr-waipu/Config.in"
 	source "package/kodi-pvr-wmc/Config.in"
 	source "package/kodi-pvr-zattoo/Config.in"
 endmenu
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
