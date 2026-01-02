Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C5AAFA3755
	for <buildroot@archiver.kernel.org>; Fri,  2 Jan 2026 22:23:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0028280AA6;
	Fri,  2 Jan 2026 22:23:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KrvznkESFw3o; Fri,  2 Jan 2026 22:23:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2815481F43
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767392585;
	bh=bv7XX9diX69L+OiGChnUQrRVDawAOm6sNRx5+eqrrbk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=IHZ6TX4U3shLtZYg+8Y/VnJnDxkhWAp6x+JZUrcRGt3u99/SpR1VVcNTstv8ZBY9U
	 PuWe6BZ49QxL4N44tDpOu8dPzS+79MCrmFtrvRFNv5+LmxaGWUlQaxnjDyU7W5X63o
	 RO5TlVfaZuoQDsXOSWtt6vAw7MGxMxBxQ+zTJWBHhTG31+JFYZCqZd8ZtqlWD+iAC9
	 2ZEq6nE7AOJR7UyWspOKSqd4r7qLQPe7BJLmTVLDAo8zpjaqS5NtMq2+kVly/F4BCJ
	 PtVx5O6ww/+wky2Demn+R2gw10FE/nYXhhd7/44rUN2iWw+uFshutzyq3Qk69Qdc78
	 v5LM6/ib+mIKA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2815481F43;
	Fri,  2 Jan 2026 22:23:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0F39B19D
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 22:23:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C9EBF81F43
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 22:23:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XbxGss9j_HRF for <buildroot@buildroot.org>;
 Fri,  2 Jan 2026 22:23:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A1E3481F1A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A1E3481F1A
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 22:23:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8E74087FB5; Fri,  2 Jan 2026 22:23:02 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 2 Jan 2026 23:11:23 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ec9a136c22ffcf173cd0fca2af2ff1afbc072266
X-Git-Newrev: 2a972212b43100dadbe9c2337264849f3b51552d
X-Patchwork-Hint: ignore
Message-Id: <20260102222302.8E74087FB5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qoriq-restool: new package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=2a972212b43100dadbe9c2337264849f3b51552d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Introduce a package for the restool program, which permits the user to
modify the network configuration of the DPAA2 subsystem and create one
that is adequate to their use case.

We integrate the master branch, which is effectively the
lf-6.12.20-2.0.0 release tag, plus some extra fixups specifically made
for the Buildroot integration:
- commit b44748ed0bb3 ("Avoid use of non-portable __WORDSIZE when
  defining BITS_PER_LONG")
- commit b4a734f3512b ("restool: fix format string for 64 bit time_t in
  parse_obj_command()")

Signed-off-by: Vladimir Oltean <olteanv@gmail.com>
Reviewed-by: Vincent Jardin <vjardin@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                               |  1 +
 package/Config.in                        |  1 +
 package/qoriq-restool/Config.in          | 21 +++++++++++++++++++++
 package/qoriq-restool/qoriq-restool.hash |  3 +++
 package/qoriq-restool/qoriq-restool.mk   | 24 ++++++++++++++++++++++++
 5 files changed, 50 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index f448c3b582..62867225eb 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3405,6 +3405,7 @@ F:	package/qoriq-ddr-phy-binary/
 F:	package/qoriq-firmware-inphi/
 F:	package/qoriq-mc-binary/
 F:	package/qoriq-mc-utils/
+F:	package/qoriq-restool/
 
 N:	Volkov Viacheslav <sv99@inbox.ru>
 F:	package/v4l2grab/
diff --git a/package/Config.in b/package/Config.in
index 2b9e31ebb3..f5f1f6a741 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -445,6 +445,7 @@ menu "Firmware"
 	source "package/qoriq-fm-ucode/Config.in"
 	source "package/qoriq-mc-binary/Config.in"
 	source "package/qoriq-mc-utils/Config.in"
+	source "package/qoriq-restool/Config.in"
 	source "package/rcw-smarc-sal28/Config.in"
 	source "package/rpi-firmware/Config.in"
 	source "package/sunxi-boards/Config.in"
diff --git a/package/qoriq-restool/Config.in b/package/qoriq-restool/Config.in
new file mode 100644
index 0000000000..600c2c958d
--- /dev/null
+++ b/package/qoriq-restool/Config.in
@@ -0,0 +1,21 @@
+config BR2_PACKAGE_QORIQ_RESTOOL
+	bool "qoriq-restool"
+	depends on BR2_aarch64 || BR2_aarch64_be
+	help
+	  The DPAA2 architecture in Layerscape SoCs consists of
+	  networking resources that can be assembled into various
+	  nuggets of functionality, called "objects" (DPMAC, DPNI,
+	  DPDMUX, DPSW etc), by the Management Complex (MC) firmware.
+
+	  The MC firmware reads a file called Data Path Layout (DPL)
+	  which describes the set of networking objects it should
+	  create statically, at boot time.
+
+	  The restool program is able to talk to the Management
+	  Complex at runtime and permits the dynamic reconfiguration
+	  of networking objects, as well as saving the current
+	  configuration into a new DPL file. Without the restool
+	  program, the only possible networking configuration is
+	  that specified in the boot-time DPL file.
+
+	  https://github.com/nxp-qoriq/restool
diff --git a/package/qoriq-restool/qoriq-restool.hash b/package/qoriq-restool/qoriq-restool.hash
new file mode 100644
index 0000000000..72a34473f2
--- /dev/null
+++ b/package/qoriq-restool/qoriq-restool.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  2879f14c9dd810e92d4c51c7f1a3e6705a5a585c2445e507f63e39872ac6237d  qoriq-restool-lf-6.12.20-2.0.0-3-gb44748e.tar.gz
+sha256  ddc794a75f11c3bd01015f16b9776064a894015e7a1603541283ccbc2e1c3a40  LICENSE
diff --git a/package/qoriq-restool/qoriq-restool.mk b/package/qoriq-restool/qoriq-restool.mk
new file mode 100644
index 0000000000..4dd62a83dd
--- /dev/null
+++ b/package/qoriq-restool/qoriq-restool.mk
@@ -0,0 +1,24 @@
+################################################################################
+#
+# qoriq-restool
+#
+################################################################################
+
+QORIQ_RESTOOL_VERSION = lf-6.12.20-2.0.0-3-gb44748e
+QORIQ_RESTOOL_SITE = $(call github,nxp-qoriq,restool,$(QORIQ_RESTOOL_VERSION))
+QORIQ_RESTOOL_LICENSE = BSD-3-Clause or GPL-2.0-or-later
+QORIQ_RESTOOL_LICENSE_FILES = LICENSE
+
+define QORIQ_RESTOOL_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
+		CC="$(TARGET_CC)" \
+		CROSS_COMPILE="$(TARGET_CROSS)"
+endef
+
+define QORIQ_RESTOOL_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
+		MANPAGE="" DESTDIR=$(TARGET_DIR) \
+		prefix=/usr install
+endef
+
+$(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
