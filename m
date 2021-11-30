Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4FBAC433EF
	for <buildroot@archiver.kernel.org>; Tue, 30 Nov 2021 18:16:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 54490400C5;
	Tue, 30 Nov 2021 18:16:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dHPPN14dlPjS; Tue, 30 Nov 2021 18:16:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 535AB4012E;
	Tue, 30 Nov 2021 18:16:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8C7231BF909
 for <buildroot@lists.busybox.net>; Tue, 30 Nov 2021 18:16:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7C2F7829F2
 for <buildroot@lists.busybox.net>; Tue, 30 Nov 2021 18:16:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qSD2MHh63DRm for <buildroot@lists.busybox.net>;
 Tue, 30 Nov 2021 18:16:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4908E8244D
 for <buildroot@buildroot.org>; Tue, 30 Nov 2021 18:16:30 +0000 (UTC)
Received: from fwd73.dcpf.telekom.de (fwd73.aul.t-online.de [10.223.144.99])
 by mailout12.t-online.de (Postfix) with SMTP id 6C779119;
 Tue, 30 Nov 2021 19:16:27 +0100 (CET)
Received: from fli4l.lan.fli4l ([79.214.200.98]) by fwd73.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1ms7g2-1mBf3R0; Tue, 30 Nov 2021 19:16:26 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:53062)
 by fli4l.lan.fli4l with esmtp (Exim 4.95)
 (envelope-from <bernd.kuhls@t-online.de>) id 1ms7g1-0004G2-Em;
 Tue, 30 Nov 2021 19:16:25 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Tue, 30 Nov 2021 19:16:25 +0100
Message-Id: <20211130181625.291264-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1638296186-0000147C-DC8A3B1E/0/0 CLEAN NORMAL
X-TOI-MSGID: f0611585-fad0-4dd6-b7e0-606feb3fce6e
Subject: [Buildroot] [PATCH/next 1/1] package/kodi-pvr-plutotv: new package
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
 package/kodi-pvr-plutotv/Config.in             |  7 +++++++
 package/kodi-pvr-plutotv/kodi-pvr-plutotv.hash |  3 +++
 package/kodi-pvr-plutotv/kodi-pvr-plutotv.mk   | 13 +++++++++++++
 package/kodi/Config.in                         |  1 +
 4 files changed, 24 insertions(+)
 create mode 100644 package/kodi-pvr-plutotv/Config.in
 create mode 100644 package/kodi-pvr-plutotv/kodi-pvr-plutotv.hash
 create mode 100644 package/kodi-pvr-plutotv/kodi-pvr-plutotv.mk

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
index c4b1d4ca23..bee1cad614 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -304,6 +304,7 @@ menu "PVR addons"
 	source "package/kodi-pvr-njoy/Config.in"
 	source "package/kodi-pvr-octonet/Config.in"
 	source "package/kodi-pvr-pctv/Config.in"
+	source "package/kodi-pvr-plutotv/Config.in"
 	source "package/kodi-pvr-stalker/Config.in"
 	source "package/kodi-pvr-vbox/Config.in"
 	source "package/kodi-pvr-vdr-vnsi/Config.in"
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
