Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC881C4332F
	for <buildroot@archiver.kernel.org>; Fri, 25 Nov 2022 10:35:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 356AA41D09;
	Fri, 25 Nov 2022 10:35:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 356AA41D09
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c1ydItK5Sqwz; Fri, 25 Nov 2022 10:35:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 215D04174E;
	Fri, 25 Nov 2022 10:34:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 215D04174E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 27C9E1BF386
 for <buildroot@lists.busybox.net>; Fri, 25 Nov 2022 10:34:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0CDD78214B
 for <buildroot@lists.busybox.net>; Fri, 25 Nov 2022 10:34:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0CDD78214B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mM-BX67YiuXl for <buildroot@lists.busybox.net>;
 Fri, 25 Nov 2022 10:34:55 +0000 (UTC)
X-Greylist: delayed 00:07:52 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4D5B2820AC
Received: from mx.msync.work (mx.msync.work [185.250.0.168])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4D5B2820AC
 for <buildroot@buildroot.org>; Fri, 25 Nov 2022 10:34:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 5DC8A31A2D; Fri, 25 Nov 2022 10:27:00 +0000 (UTC)
To: buildroot@buildroot.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 25 Nov 2022 13:26:50 +0300
Message-Id: <20221125102650.2804226-1-adeep@lexina.in>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lexina.in; s=dkim; 
 t=1669372020; h=from:subject:date:message-id:to:mime-version:
 content-transfer-encoding; bh=Du5e2mfhJ0drDUZj1Dgll9VsosmOJaEBphQSTre1Tno=;
 b=Wf3J/5fmCgMKoYURpxTOHaq0Phneqr+4H8v+6I9pTFmHpYMz1JzarerQlKJuvS53E2/Puo
 OH7M6ot65MOUMRkGwvof2stUb+I2PNPh+/VcBHffSSeQP93tSv7t0gDX9Uc8k1LHZGiOLD
 rJPTus43gzgdap30xujPF0g6aTLyzQxNGlvTSw9rPXFE9Dl/92wLwLkas6kBzk3C4Dqwi5
 JjWb/eLY4cdeeHzEgn/CUb2y78kcXs6lFrze3H8cgL6T7KAlRayKcKTEJsOHLK4RC5jhV2
 KAsWhyqGzkkXkUNaBM6uOClLOMKV9pxt18qr1FUtszZFN5C023ype4TcVPH32Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=lexina.in header.i=@lexina.in
 header.a=rsa-sha256 header.s=dkim header.b=Wf3J/5fm
Subject: [Buildroot] [PATCH] rtl8822cs: new package
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
From: Viacheslav Bocharov via buildroot <buildroot@buildroot.org>
Reply-To: Viacheslav Bocharov <adeep@lexina.in>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This package adds the rtl88822cs WiFi driver.
   repo: https://github.com/jethome-ru/rtl88x2cs.git
   branch: tune_for_jethub

Driver is known to support Realtek RTL8822CS SDIO WiFi/BT chip.

Signed-off-by: Viacheslav Bocharov <adeep@lexina.in>
---
 DEVELOPERS                       |  3 +++
 package/Config.in                |  1 +
 package/rtl8822cs/Config.in      | 12 ++++++++++++
 package/rtl8822cs/rtl8822cs.hash |  1 +
 package/rtl8822cs/rtl8822cs.mk   | 26 ++++++++++++++++++++++++++
 5 files changed, 43 insertions(+)
 create mode 100644 package/rtl8822cs/Config.in
 create mode 100644 package/rtl8822cs/rtl8822cs.hash
 create mode 100644 package/rtl8822cs/rtl8822cs.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 569d58407a..dda837bc5d 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2937,6 +2937,9 @@ F:	package/llvm/
 N:	Vanya Sergeev <vsergeev@gmail.com>
 F:	package/lua-periphery/
 
+N:	Viacheslav Bocharov <adeep@lexina.in>
+F:	package/rtl8822cs/
+
 N:	Victor Huesca <victor.huesca@bootlin.com>
 F:	support/testing/tests/core/test_root_password.py
 
diff --git a/package/Config.in b/package/Config.in
index aef80f9ab0..fc92dc8825 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -584,6 +584,7 @@ endmenu
 	source "package/rtl8723ds/Config.in"
 	source "package/rtl8812au-aircrack-ng/Config.in"
 	source "package/rtl8821au/Config.in"
+	source "package/rtl8822cs/Config.in"
 	source "package/sane-backends/Config.in"
 	source "package/sdparm/Config.in"
 	source "package/sedutil/Config.in"
diff --git a/package/rtl8822cs/Config.in b/package/rtl8822cs/Config.in
new file mode 100644
index 0000000000..c887ae7e02
--- /dev/null
+++ b/package/rtl8822cs/Config.in
@@ -0,0 +1,12 @@
+comment "RTL8822CS needs a Linux kernel to be built"
+	depends on !BR2_s390x
+	depends on !BR2_LINUX_KERNEL
+
+config BR2_PACKAGE_RTL8822CS
+	bool "Realtek RTL8822CS SDIO Wi-Fi driver"
+	depends on !BR2_s390x
+	depends on BR2_LINUX_KERNEL
+	help
+          Realtek RTL8822CS Wi-Fi driver as a kernel module (JetHome repository)
+
+          https://github.com/jethome-ru/rtl88x2cs/
diff --git a/package/rtl8822cs/rtl8822cs.hash b/package/rtl8822cs/rtl8822cs.hash
new file mode 100644
index 0000000000..11633e1633
--- /dev/null
+++ b/package/rtl8822cs/rtl8822cs.hash
@@ -0,0 +1 @@
+sha256 4cd97adcf44dc4196fce6f87e68370ad588b19bbc38b246615f9c05739f7bd00  rtl8822cs-db8dc6c7ae1a75af3f6d7fa4f05456c76f5cab3e.tar.gz
diff --git a/package/rtl8822cs/rtl8822cs.mk b/package/rtl8822cs/rtl8822cs.mk
new file mode 100644
index 0000000000..799a07823d
--- /dev/null
+++ b/package/rtl8822cs/rtl8822cs.mk
@@ -0,0 +1,26 @@
+################################################################################
+#
+# Realtek RTL8822CS driver
+#
+################################################################################
+
+RTL8822CS_VERSION = db8dc6c7ae1a75af3f6d7fa4f05456c76f5cab3e
+RTL8822CS_SITE = $(call github,jethome-ru,rtl88x2cs,$(RTL8822CS_VERSION))
+RTL8822CS_LICENSE = GPL-2.0
+
+RTL8822CS_MODULE_MAKE_OPTS = \
+	CONFIG_RTL8822CS=m \
+	KVER=$(LINUX_VERSION_PROBED) \
+	KSRC=$(LINUX_DIR)
+
+define RTL8822CS_LINUX_CONFIG_FIXUPS
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NET)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_WIRELESS)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_CFG80211)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_MAC80211)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_MMC)
+endef
+
+
+$(eval $(kernel-module))
+$(eval $(generic-package))
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
