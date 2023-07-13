Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B647EC001B0
	for <buildroot@archiver.kernel.org>; Thu, 13 Jul 2023 21:22:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4F122405B3;
	Thu, 13 Jul 2023 21:22:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4F122405B3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id le_l4OQM_QNu; Thu, 13 Jul 2023 21:22:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8D7D64179A;
	Thu, 13 Jul 2023 21:22:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8D7D64179A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9FCE41BF383
 for <buildroot@lists.busybox.net>; Thu, 13 Jul 2023 21:22:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 70EC4405AA
 for <buildroot@lists.busybox.net>; Thu, 13 Jul 2023 21:22:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 70EC4405AA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id I9XeCst3tNhm for <buildroot@lists.busybox.net>;
 Thu, 13 Jul 2023 21:22:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 74D2E4044A
 for <buildroot@buildroot.org>; Thu, 13 Jul 2023 21:22:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 74D2E4044A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 618BC87008; Thu, 13 Jul 2023 21:22:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 13 Jul 2023 23:21:11 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 83f11700fe7743aee243ced057873e105889b36a
X-Git-Newrev: d5ff6b96735217228e9962a02b0aaca94cb0f589
X-Patchwork-Hint: ignore
Message-Id: <20230713212233.618BC87008@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rtl8822cs: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=d5ff6b96735217228e9962a02b0aaca94cb0f589
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This package adds the rtl88822cs WiFi driver.

   repo: https://github.com/jethome-ru/rtl88x2cs.git
   branch: tune_for_jethub

Driver is known to support Realtek RTL8822CS SDIO WiFi/BT chip.

Signed-off-by: Viacheslav Bocharov <adeep@lexina.in>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                       |  3 +++
 package/Config.in                |  1 +
 package/rtl8822cs/Config.in      | 13 +++++++++++++
 package/rtl8822cs/rtl8822cs.hash |  2 ++
 package/rtl8822cs/rtl8822cs.mk   | 25 +++++++++++++++++++++++++
 5 files changed, 44 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 476f092a16..3638e4f99c 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2950,6 +2950,9 @@ F:	package/llvm/
 N:	Vanya Sergeev <vsergeev@gmail.com>
 F:	package/lua-periphery/
 
+N:	Viacheslav Bocharov <adeep@lexina.in>
+F:	package/rtl8822cs/
+
 N:	Victor Huesca <victor.huesca@bootlin.com>
 F:	support/testing/tests/core/test_root_password.py
 
diff --git a/package/Config.in b/package/Config.in
index c8ed49d773..3125fdf632 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -594,6 +594,7 @@ endmenu
 	source "package/rtl8812au-aircrack-ng/Config.in"
 	source "package/rtl8821au/Config.in"
 	source "package/rtl8821cu/Config.in"
+	source "package/rtl8822cs/Config.in"
 	source "package/sane-backends/Config.in"
 	source "package/sdparm/Config.in"
 	source "package/sedutil/Config.in"
diff --git a/package/rtl8822cs/Config.in b/package/rtl8822cs/Config.in
new file mode 100644
index 0000000000..ee5f09928d
--- /dev/null
+++ b/package/rtl8822cs/Config.in
@@ -0,0 +1,13 @@
+comment "rl8822cs needs a Linux kernel to be built"
+	depends on !BR2_s390x
+	depends on !BR2_LINUX_KERNEL
+
+config BR2_PACKAGE_RTL8822CS
+	bool "rtl8822cs"
+	depends on !BR2_s390x
+	depends on BR2_LINUX_KERNEL
+	help
+          Realtek RTL8822CS Wi-Fi driver as a kernel module (JetHome
+          repository)
+
+          https://github.com/jethome-ru/rtl88x2cs/
diff --git a/package/rtl8822cs/rtl8822cs.hash b/package/rtl8822cs/rtl8822cs.hash
new file mode 100644
index 0000000000..c1ff470b27
--- /dev/null
+++ b/package/rtl8822cs/rtl8822cs.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  8ac5bc4d3fcec98eb06276552ffab020dd799a58bce6629cf55127c2ee1a89e6  rtl8822cs-b51ab22fffdbe4a8cbb88fcc04b00aa2ca87d0f3.tar.gz
diff --git a/package/rtl8822cs/rtl8822cs.mk b/package/rtl8822cs/rtl8822cs.mk
new file mode 100644
index 0000000000..8c6c34ccbc
--- /dev/null
+++ b/package/rtl8822cs/rtl8822cs.mk
@@ -0,0 +1,25 @@
+################################################################################
+#
+# rtl8822cs
+#
+################################################################################
+
+RTL8822CS_VERSION = b51ab22fffdbe4a8cbb88fcc04b00aa2ca87d0f3
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
+$(eval $(kernel-module))
+$(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
