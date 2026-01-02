Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 334E9EED628
	for <buildroot@archiver.kernel.org>; Fri,  2 Jan 2026 17:53:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5C57F60641;
	Fri,  2 Jan 2026 17:53:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c3yM2sDyCagG; Fri,  2 Jan 2026 17:53:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F09ED60872
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767376426;
	bh=apwinN9y4Lb+K36YJyA/b12UUUgifW43d77MBy2Hd88=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=VsUSlbf8bs2nvrlrkIq6JHeSrmtubqjmsTaWkuOmcUtHnkcp0+T5GLKO7aPz6IWQE
	 f+F9Cef/dhZIC5wQjD80zwv+3sWpNSqSqca9+IpieaFmeQmOAygc2LDIuZtDYwcNRm
	 PKTP9H6j1DObLFudzwjcBd6n9QQBydXGRkU+orBe/Kxe4qwe34qfvOY8EzyN6+Z0hr
	 t6CZTH3L5Cwv0nrS00GI6RbeAC73c5ZZ33oo3fZhUnYs/ykVAPfxbR6vN5XG/56ZBw
	 WEwbgWyoK6tziPNBZOsF5ycr8i9twcdJWdw4ly2+lP9apRphznfm3OyrXAGjvSpYdR
	 kkjOFSQtmcZxA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F09ED60872;
	Fri,  2 Jan 2026 17:53:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 99D1A351
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 17:53:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7FD5E405B2
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 17:53:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iaADaR-N2Zqt for <buildroot@buildroot.org>;
 Fri,  2 Jan 2026 17:53:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BF4144034D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id BF4144034D
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 17:53:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A93947FE79; Fri,  2 Jan 2026 17:53:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 2 Jan 2026 18:28:11 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6019df8f99cb30efd6263b93753bd8bc46874b48
X-Git-Newrev: 3140b9a171ddea5f2a290e37959cf4704ffed41e
X-Patchwork-Hint: ignore
Message-Id: <20260102175343.A93947FE79@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/adsp-ldr: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=3140b9a171ddea5f2a290e37959cf4704ffed41e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Philip Molloy <philip.molloy@analog.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                      |  3 +++
 package/Config.in.host          |  1 +
 package/adsp-ldr/Config.in.host |  8 ++++++++
 package/adsp-ldr/adsp-ldr.hash  |  3 +++
 package/adsp-ldr/adsp-ldr.mk    | 21 +++++++++++++++++++++
 5 files changed, 36 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 75502ec687..f448c3b582 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2741,6 +2741,9 @@ F:	package/psplash/
 F:	package/sispmctl/
 F:	package/zsh/
 
+N:	Philip Molloy <philip@philipmolloy.com>
+F:	package/adsp-ldr/
+
 N:	Philipp Richter <richterphilipp.pops@gmail.com>
 F:	package/libtorrent-rasterbar/
 
diff --git a/package/Config.in.host b/package/Config.in.host
index 1c5ab506f5..2160a0f558 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -1,6 +1,7 @@
 menu "Host utilities"
 
 	source "package/abootimg/Config.in.host"
+	source "package/adsp-ldr/Config.in.host"
 	source "package/aespipe/Config.in.host"
 	source "package/agent-proxy/Config.in.host"
 	source "package/amlogic-boot-fip/Config.in.host"
diff --git a/package/adsp-ldr/Config.in.host b/package/adsp-ldr/Config.in.host
new file mode 100644
index 0000000000..4776440eea
--- /dev/null
+++ b/package/adsp-ldr/Config.in.host
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_HOST_ADSP_LDR
+	bool "host adsp-ldr"
+	help
+	  adsp-ldr is a tool that generates boot streams to be
+	  loaded and executed by the boot ROM of Analog Devices
+	  ADSP-SCXXX SoCs
+
+	  https://github.com/analogdevicesinc/adsp-ldr
diff --git a/package/adsp-ldr/adsp-ldr.hash b/package/adsp-ldr/adsp-ldr.hash
new file mode 100644
index 0000000000..459b48cf09
--- /dev/null
+++ b/package/adsp-ldr/adsp-ldr.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  a1b1b5700b75e47bae7f656cd61f8c635f5d3c82a90e20dfe594e0a3315e4eef  LICENSE
+sha256  0f240aa5aad9300d8f4bc7ffd9cc1c53e01dfd6120de4f20f60d4d4176d99c10  adsp-ldr-v1.0.1.tar.xz
diff --git a/package/adsp-ldr/adsp-ldr.mk b/package/adsp-ldr/adsp-ldr.mk
new file mode 100644
index 0000000000..d269ddb093
--- /dev/null
+++ b/package/adsp-ldr/adsp-ldr.mk
@@ -0,0 +1,21 @@
+################################################################################
+#
+# adsp-ldr
+#
+################################################################################
+
+ADSP_LDR_VERSION = 1.0.1
+ADSP_LDR_SOURCE = adsp-ldr-v$(ADSP_LDR_VERSION).tar.xz
+ADSP_LDR_SITE = https://github.com/analogdevicesinc/adsp-ldr/releases/download/v$(ADSP_LDR_VERSION)
+ADSP_LDR_LICENSE = BSD-3-Clause
+ADSP_LDR_LICENSE_FILES = LICENSE
+HOST_ADSP_LDR_DEPENDENCIES = host-libusb
+
+define HOST_ADSP_LDR_INSTALL_CMDS
+	# The U-Boot Makefile expects ldr to be prefixed by $(CROSS_COMPILE),
+	# hence the rename to $(TARGET_CROSS)ldr
+	$(INSTALL) -m 755 -D $(@D)/buildroot-build/ldr \
+		$(TARGET_CROSS)ldr
+endef
+
+$(eval $(host-meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
