Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1F46C4332F
	for <buildroot@archiver.kernel.org>; Sun,  4 Dec 2022 13:03:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 54989812B8;
	Sun,  4 Dec 2022 13:03:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 54989812B8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZMTODhjMyq9R; Sun,  4 Dec 2022 13:03:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8160280C30;
	Sun,  4 Dec 2022 13:03:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8160280C30
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 822311BF865
 for <buildroot@lists.busybox.net>; Sun,  4 Dec 2022 13:03:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5AEA78174C
 for <buildroot@lists.busybox.net>; Sun,  4 Dec 2022 13:03:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5AEA78174C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id np4fk5AxRjJF for <buildroot@lists.busybox.net>;
 Sun,  4 Dec 2022 13:03:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3B17C81699
 for <buildroot@buildroot.org>; Sun,  4 Dec 2022 13:03:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3B17C81699
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 28C2A85463; Sun,  4 Dec 2022 13:03:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 4 Dec 2022 13:51:54 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 17a1cd835e788cd86109e8a4223ea75dc9342553
X-Git-Newrev: 95f72fb61aae6a64ea822b535cf9d2c2e01e6fc9
X-Patchwork-Hint: ignore
Message-Id: <20221204130303.28C2A85463@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/edk2-non-osi: new
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2064196657376107982=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2064196657376107982==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=95f72fb61aae6a64ea822b535cf9d2c2e01e6fc9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Add a package to install the additional edk2 platforms files, not
compatible with the normal licensing requirements and held in the
edk2-non-osi repository.

Only the Marvell Armada files are copied at this point, to support building
edk2 for the MACCHIATObin platform.

The referenced commit corresponds to version edk2-stable202208 of edk2,
based on the timestamps.

This package is heavily inspired from package/edk2-platforms.

Signed-off-by: Vincent Stehlé <vincent.stehle@arm.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                             |  1 +
 package/Config.in                      |  1 +
 package/edk2-non-osi/Config.in         | 11 +++++++++++
 package/edk2-non-osi/edk2-non-osi.hash |  3 +++
 package/edk2-non-osi/edk2-non-osi.mk   | 27 +++++++++++++++++++++++++++
 5 files changed, 43 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index ab9cfe5ee9..233fda4c71 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3002,6 +3002,7 @@ F:	package/utp_com/
 N:	Vincent Stehlé <vincent.stehle@arm.com>
 F:	board/qemu/aarch64-ebbr/
 F:	configs/qemu_aarch64_ebbr_defconfig
+F:	package/edk2-non-osi/
 
 N:	Vincent Stehlé <vincent.stehle@laposte.net>
 F:	board/bananapi/bananapi-m2-zero/
diff --git a/package/Config.in b/package/Config.in
index 1a2bda4639..ce0d55bbf2 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -489,6 +489,7 @@ endmenu
 	source "package/dvb-apps/Config.in"
 	source "package/dvbsnoop/Config.in"
 	source "package/edid-decode/Config.in"
+	source "package/edk2-non-osi/Config.in"
 	source "package/edk2-platforms/Config.in"
 	source "package/eudev/Config.in"
 	source "package/ev3dev-linux-drivers/Config.in"
diff --git a/package/edk2-non-osi/Config.in b/package/edk2-non-osi/Config.in
new file mode 100644
index 0000000000..6c540c8a40
--- /dev/null
+++ b/package/edk2-non-osi/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_EDK2_NON_OSI
+	bool
+	help
+	  EDK2 description files for additional platforms, not
+	  compatible with the normal licensing requirements.
+	  The main EDK2 bootloader package will depend on these
+	  description files while building firmware for some platforms.
+
+	  Only the Marvell Armada files are copied at this point.
+
+	  https://github.com/tianocore/edk2-non-osi
diff --git a/package/edk2-non-osi/edk2-non-osi.hash b/package/edk2-non-osi/edk2-non-osi.hash
new file mode 100644
index 0000000000..7941df1f2f
--- /dev/null
+++ b/package/edk2-non-osi/edk2-non-osi.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  7d27b1e6d90a26f3585ab58a2e051da69eae1b97754d3e2d80a5372879ae2501  edk2-non-osi-61662e8596dd9a64e3372f9a3ba6622d2628607c.tar.gz
+sha256  38d73db2f9dfb32e1666d898cb9d7c1ccd78302dd9922d5fac4a9cf61fa872d9  Silicon/Marvell/Armada7k8k/DeviceTree/Armada80x0McBin.inf
diff --git a/package/edk2-non-osi/edk2-non-osi.mk b/package/edk2-non-osi/edk2-non-osi.mk
new file mode 100644
index 0000000000..0abb3770c7
--- /dev/null
+++ b/package/edk2-non-osi/edk2-non-osi.mk
@@ -0,0 +1,27 @@
+################################################################################
+#
+# edk2-non-osi
+#
+################################################################################
+
+# Keep in sync with latest commit as of the release date for boot/edk2
+EDK2_NON_OSI_VERSION = 61662e8596dd9a64e3372f9a3ba6622d2628607c
+EDK2_NON_OSI_SITE = $(call github,tianocore,edk2-non-osi,$(EDK2_NON_OSI_VERSION))
+EDK2_NON_OSI_INSTALL_TARGET = NO
+EDK2_NON_OSI_INSTALL_STAGING = YES
+
+# Copy Marvell Armada files
+EDK2_NON_OSI_LICENSE += BSD-2-Clause-Patent (Marvell Armada)
+EDK2_NON_OSI_LICENSE_FILES += Silicon/Marvell/Armada7k8k/DeviceTree/Armada80x0McBin.inf
+EDK2_NON_OSI_DIRS += Silicon/Marvell/Armada7k8k/DeviceTree
+
+# There is nothing to build for edk2-non-osi. All we need to do is to copy
+# the selected description files to staging, for other packages to build with.
+define EDK2_NON_OSI_INSTALL_STAGING_CMDS
+	$(foreach d,$(EDK2_NON_OSI_DIRS),\
+		mkdir -p $(STAGING_DIR)/usr/share/edk2-non-osi/$(d) && \
+		cp -rf $(@D)/$(d)/* $(STAGING_DIR)/usr/share/edk2-non-osi/$(d)/
+	)
+endef
+
+$(eval $(generic-package))

--===============2064196657376107982==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2064196657376107982==--
