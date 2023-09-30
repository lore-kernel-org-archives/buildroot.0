Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1592FE77377
	for <buildroot@archiver.kernel.org>; Sat, 30 Sep 2023 15:56:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9A66341841;
	Sat, 30 Sep 2023 15:56:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9A66341841
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rJSsK-pPiVNd; Sat, 30 Sep 2023 15:56:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4677D4180D;
	Sat, 30 Sep 2023 15:55:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4677D4180D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 78BD91BF5A3
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 15:55:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5049D4180D
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 15:55:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5049D4180D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mkxWLdCT4-3a for <buildroot@lists.busybox.net>;
 Sat, 30 Sep 2023 15:55:56 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2F40E417E8
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 15:55:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2F40E417E8
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 177C683B74; Sat, 30 Sep 2023 15:55:56 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 30 Sep 2023 17:55:36 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b9300f70b26f15d4cc58c0d5cff17f86b6e43bf6
X-Git-Newrev: 09efcd5d2607fee268524c45e3621062b9407342
X-Patchwork-Hint: ignore
Message-Id: <20230930155556.177C683B74@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qoriq-fm-ucode: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=09efcd5d2607fee268524c45e3621062b9407342
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This package provides firmware needed for the LS1046A-FRWY Ethernet.

Signed-off-by: Brandon Maier <brandon.maier@collins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                 |  1 +
 package/Config.in                          |  1 +
 package/qoriq-fm-ucode/Config.in           | 22 ++++++++++++++++++++++
 package/qoriq-fm-ucode/qoriq-fm-ucode.hash |  3 +++
 package/qoriq-fm-ucode/qoriq-fm-ucode.mk   | 21 +++++++++++++++++++++
 5 files changed, 48 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 989f355031..4c7cca53c3 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -521,6 +521,7 @@ F:	package/iftop/
 F:	package/ncdu/
 
 N:	Brandon Maier <brandon.maier@collins.com>
+F:	package/qoriq-fm-ucode/
 F:	package/unifdef/
 F:	package/vmtouch/
 
diff --git a/package/Config.in b/package/Config.in
index e94ff0dfb8..58a7cfb914 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -446,6 +446,7 @@ menu "Firmware"
 	source "package/murata-cyw-fw/Config.in"
 	source "package/odroidc2-firmware/Config.in"
 	source "package/qcom-db410c-firmware/Config.in"
+	source "package/qoriq-fm-ucode/Config.in"
 	source "package/rcw-smarc-sal28/Config.in"
 	source "package/rpi-firmware/Config.in"
 	source "package/sunxi-boards/Config.in"
diff --git a/package/qoriq-fm-ucode/Config.in b/package/qoriq-fm-ucode/Config.in
new file mode 100644
index 0000000000..b9855f4526
--- /dev/null
+++ b/package/qoriq-fm-ucode/Config.in
@@ -0,0 +1,22 @@
+config BR2_PACKAGE_QORIQ_FM_UCODE
+	bool "qoriq-fm-ucode"
+	help
+	  These are the microcode families of the Frame Manager
+	  hardware block in QorIQ products. Specific platforms require
+	  specific binaries, and those also have to further match
+	  specific software versions (Frame Manager Driver -- FMD).
+
+	  https://github.com/nxp-qoriq/qoriq-fm-ucode
+
+if BR2_PACKAGE_QORIQ_FM_UCODE
+
+config BR2_PACKAGE_QORIQ_FM_UCODE_PLATFORM
+	string "platform"
+	default "ls1046"
+	help
+	  This option specifies which platform's microcode to use.
+
+	  This string should match a file in qoriq-fm-ucode of the form
+	  "fsl_fman_ucode_${PLATFORM}*.bin".
+
+endif
diff --git a/package/qoriq-fm-ucode/qoriq-fm-ucode.hash b/package/qoriq-fm-ucode/qoriq-fm-ucode.hash
new file mode 100644
index 0000000000..5c664356c0
--- /dev/null
+++ b/package/qoriq-fm-ucode/qoriq-fm-ucode.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  2e431dd726c4aa1db558931d80b318149abdf71fec6e39de9d5aa33399df1fb1  qoriq-fm-ucode-LSDK-21.08.tar.gz
+sha256  7a223031d76339df0e4e5a94d193a270fb9963d42b577aa42fe130a4657f3e17  NXP-Binary-EULA.txt
diff --git a/package/qoriq-fm-ucode/qoriq-fm-ucode.mk b/package/qoriq-fm-ucode/qoriq-fm-ucode.mk
new file mode 100644
index 0000000000..5dfdf1e8f8
--- /dev/null
+++ b/package/qoriq-fm-ucode/qoriq-fm-ucode.mk
@@ -0,0 +1,21 @@
+################################################################################
+#
+# qoriq-fm-ucode
+#
+################################################################################
+
+QORIQ_FM_UCODE_VERSION = LSDK-21.08
+QORIQ_FM_UCODE_SITE = $(call github,nxp-qoriq,qoriq-fm-ucode,$(QORIQ_FM_UCODE_VERSION))
+QORIQ_FM_UCODE_LICENSE = NXP Binary EULA
+QORIQ_FM_UCODE_LICENSE_FILES = NXP-Binary-EULA.txt
+QORIQ_FM_UCODE_INSTALL_IMAGES = YES
+QORIQ_FM_UCODE_INSTALL_TARGET = NO
+
+QORIQ_FM_UCODE_PLATFORM = $(call qstrip,$(BR2_PACKAGE_QORIQ_FM_UCODE_PLATFORM))
+
+define QORIQ_FM_UCODE_INSTALL_IMAGES_CMDS
+	cp $(@D)/fsl_fman_ucode_$(QORIQ_FM_UCODE_PLATFORM)*.bin \
+		$(BINARIES_DIR)
+endef
+
+$(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
