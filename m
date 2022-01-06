Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A66C6C433EF
	for <buildroot@archiver.kernel.org>; Thu,  6 Jan 2022 16:30:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 302EC82846;
	Thu,  6 Jan 2022 16:30:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bal0i45GIbIY; Thu,  6 Jan 2022 16:30:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 782858239A;
	Thu,  6 Jan 2022 16:30:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C01AB1C113E
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 16:30:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AEC158239A
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 16:30:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aCG9JEYkVrZ6 for <buildroot@lists.busybox.net>;
 Thu,  6 Jan 2022 16:30:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C991381D5F
 for <buildroot@buildroot.org>; Thu,  6 Jan 2022 16:30:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id C1A9583470; Thu,  6 Jan 2022 16:24:35 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 6 Jan 2022 16:17:27 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d167f7006e724360994a88cb97ad65bec137db68
X-Git-Newrev: d164df0aefc121d4954d74d68491968a43ff73d6
X-Patchwork-Hint: ignore
Message-Id: <20220106162435.C1A9583470@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qoriq-cadence-dp-firmware: new
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

commit: https://git.buildroot.net/buildroot/commit/?id=d164df0aefc121d4954d74d68491968a43ff73d6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This package provides the firmware for LS1028ARDB DP (display port).

Signed-off-by: Jerry Huang <jerry.huang@nxp.com>
[Arnout:
 - move out of nxp directory;
 - add extraction helper;
 - set REDISTRIBUTE to NO.
]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 DEVELOPERS                                         |  3 ++
 package/Config.in                                  |  1 +
 package/qoriq-cadence-dp-firmware/Config.in        |  4 ++
 .../qoriq-cadence-dp-firmware.hash                 |  3 ++
 .../qoriq-cadence-dp-firmware.mk                   | 49 ++++++++++++++++++++++
 5 files changed, 60 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index a52a8cfa38..03918e4205 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -500,6 +500,9 @@ F:	package/znc/
 N:	Charles Hardin <ckhardin@gmail.com>
 F:	package/alsa-plugins/
 
+N:	Changming Huang <jerry.huang@nxp.com>
+F:	package/qoriq-cadence-dp-firmware/
+
 N:	Chris Packham <judge.packham@gmail.com>
 F:	package/coremark/
 F:	package/coremark-pro/
diff --git a/package/Config.in b/package/Config.in
index cb15574746..3c7340e27c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -544,6 +544,7 @@ endmenu
 	source "package/pps-tools/Config.in"
 	source "package/pru-software-support/Config.in"
 	source "package/pulseview/Config.in"
+	source "package/qoriq-cadence-dp-firmware/Config.in"
 	source "package/raspi-gpio/Config.in"
 	source "package/read-edid/Config.in"
 	source "package/rng-tools/Config.in"
diff --git a/package/qoriq-cadence-dp-firmware/Config.in b/package/qoriq-cadence-dp-firmware/Config.in
new file mode 100644
index 0000000000..3f494bd3a3
--- /dev/null
+++ b/package/qoriq-cadence-dp-firmware/Config.in
@@ -0,0 +1,4 @@
+config BR2_PACKAGE_QORIQ_CADENCE_DP_FIRMWARE
+	bool "qoriq-cadence-dp-firmware"
+	help
+	  NXP QorIQ cadence DP firmware, a resident EL3 firmware.
diff --git a/package/qoriq-cadence-dp-firmware/qoriq-cadence-dp-firmware.hash b/package/qoriq-cadence-dp-firmware/qoriq-cadence-dp-firmware.hash
new file mode 100644
index 0000000000..89aaf1d71b
--- /dev/null
+++ b/package/qoriq-cadence-dp-firmware/qoriq-cadence-dp-firmware.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256 5871c5717be32f14a59624d5699d405e8ce9ae2e9c9ef86fd16e13d264a40e58  firmware-cadence-lsdk1909.bin
+sha256 d55f024af2bfff714b90de596f6d0399124b999e8c18a86b13a3b507bae6f561  COPYING
diff --git a/package/qoriq-cadence-dp-firmware/qoriq-cadence-dp-firmware.mk b/package/qoriq-cadence-dp-firmware/qoriq-cadence-dp-firmware.mk
new file mode 100644
index 0000000000..23643d24e0
--- /dev/null
+++ b/package/qoriq-cadence-dp-firmware/qoriq-cadence-dp-firmware.mk
@@ -0,0 +1,49 @@
+################################################################################
+#
+# qoriq-cadence-dp-firmware
+#
+################################################################################
+
+QORIQ_CADENCE_DP_FIRMWARE_VERSION = lsdk1909
+QORIQ_CADENCE_DP_FIRMWARE_SITE = http://www.nxp.com/lgfiles/sdk/$(QORIQ_CADENCE_DP_FIRMWARE_VERSION)
+QORIQ_CADENCE_DP_FIRMWARE_SOURCE = firmware-cadence-$(QORIQ_CADENCE_DP_FIRMWARE_VERSION).bin
+QORIQ_CADENCE_DP_FIRMWARE_LICENSE = NXP-Binary-EULA
+QORIQ_CADENCE_DP_FIRMWARE_LICENSE_FILES = COPYING
+QORIQ_CADENCE_DP_FIRMWARE_REDISTRIBUTE = NO
+QORIQ_CADENCE_DP_FIRMWARE_INSTALL_IMAGES = YES
+QORIQ_CADENCE_DP_FIRMWARE_INSTALL_TARGET = NO
+
+# Helper for self-extracting binaries distributed by NXP.
+#
+# The --force option makes sure it doesn't fail if the source
+# directory already exists. The --auto-accept skips the license check,
+# as it is not needed in Buildroot because we have legal-info. Since
+# there's a EULA in the binary file, we extract it in this macro, and
+# it should therefore be added to the LICENSE_FILES variable of
+# packages using this macro. Also, remember to set REDISTRIBUTE to
+# "NO". Indeed, this is a legal minefield: the EULA specifies that the
+# Board Support Package includes software and hardware (sic!) for
+# which a separate license is needed...
+#
+# $(1): full path to the archive file
+#
+define QORIQ_CADENCE_DP_FIRMWARE_EXTRACT_HELPER
+	awk 'BEGIN      { start = 0; } \
+	     /^EOEULA/  { start = 0; } \
+	                { if (start) print; } \
+	     /<<EOEULA/ { start = 1; }' \
+	    $(1) > $(@D)/EULA
+	cd $(@D) && sh $(1) --force --auto-accept
+	find $(@D)/$(basename $(notdir $(1))) -mindepth 1 -maxdepth 1 -exec mv {} $(@D) \;
+	rmdir $(@D)/$(basename $(notdir $(1)))
+endef
+
+define QORIQ_CADENCE_DP_FIRMWARE_EXTRACT_CMDS
+	$(call QORIQ_CADENCE_DP_FIRMWARE_EXTRACT_HELPER,$(QORIQ_CADENCE_DP_FIRMWARE_DL_DIR)/$(QORIQ_CADENCE_DP_FIRMWARE_SOURCE))
+endef
+
+define QORIQ_CADENCE_DP_FIRMWARE_INSTALL_IMAGES_CMDS
+	$(INSTALL) -D -m 0644 $(@D)/dp/ls1028a-dp-fw.bin $(BINARIES_DIR)/ls1028a-dp-fw.bin
+endef
+
+$(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
