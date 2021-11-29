Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1004C433F5
	for <buildroot@archiver.kernel.org>; Mon, 29 Nov 2021 18:24:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 25DD780E79;
	Mon, 29 Nov 2021 18:24:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n1ywSv2v8T4Q; Mon, 29 Nov 2021 18:24:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6795080E49;
	Mon, 29 Nov 2021 18:24:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 818481BF29D
 for <buildroot@lists.busybox.net>; Mon, 29 Nov 2021 18:24:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6F49740400
 for <buildroot@lists.busybox.net>; Mon, 29 Nov 2021 18:24:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Z5FsrFzVL8R2 for <buildroot@lists.busybox.net>;
 Mon, 29 Nov 2021 18:23:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C9A66402EE
 for <buildroot@buildroot.org>; Mon, 29 Nov 2021 18:23:58 +0000 (UTC)
Received: from fwd76.dcpf.telekom.de (fwd76.aul.t-online.de [10.223.144.102])
 by mailout05.t-online.de (Postfix) with SMTP id 0D1418FAC;
 Mon, 29 Nov 2021 19:23:54 +0100 (CET)
Received: from fli4l.lan.fli4l ([79.214.200.98]) by fwd76.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1mrlJh-48JEMD0; Mon, 29 Nov 2021 19:23:53 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:49254)
 by fli4l.lan.fli4l with esmtp (Exim 4.95)
 (envelope-from <bernd.kuhls@t-online.de>) id 1mrlJg-0002hY-Vc;
 Mon, 29 Nov 2021 19:23:53 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Mon, 29 Nov 2021 19:23:52 +0100
Message-Id: <20211129182352.2121314-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1638210233-0000144F-72D99DD2/0/0 CLEAN NORMAL
X-TOI-MSGID: 5114f2c1-1d84-4d54-a0ae-341e047927be
Subject: [Buildroot] [PATCH/next 1/1] package/kodi-pvr-waipu: new package
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
Cc: Samuel Martin <s.martin49@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-pvr-waipu/Config.in           |  7 +++++++
 package/kodi-pvr-waipu/kodi-pvr-waipu.hash |  3 +++
 package/kodi-pvr-waipu/kodi-pvr-waipu.mk   | 13 +++++++++++++
 package/kodi/Config.in                     |  1 +
 4 files changed, 24 insertions(+)
 create mode 100644 package/kodi-pvr-waipu/Config.in
 create mode 100644 package/kodi-pvr-waipu/kodi-pvr-waipu.hash
 create mode 100644 package/kodi-pvr-waipu/kodi-pvr-waipu.mk

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
index 5147bbfc64..3ff2a33f17 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -311,6 +311,7 @@ menu "PVR addons"
 	source "package/kodi-pvr-vbox/Config.in"
 	source "package/kodi-pvr-vdr-vnsi/Config.in"
 	source "package/kodi-pvr-vuplus/Config.in"
+	source "package/kodi-pvr-waipu/Config.in"
 	source "package/kodi-pvr-wmc/Config.in"
 	source "package/kodi-pvr-zattoo/Config.in"
 endmenu
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
