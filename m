Return-Path: <SRS0=Mf7g=P3=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F55DC433F5
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 16:09:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F01F161038
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 16:09:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F01F161038
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CC79F60830;
	Mon,  8 Nov 2021 16:09:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BZ4RQIywDWJ1; Mon,  8 Nov 2021 16:09:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 06A77606CB;
	Mon,  8 Nov 2021 16:09:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2DAEF1BF868
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 16:07:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1DC99402F0
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 16:07:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BpdRUBIoaaCW for <buildroot@lists.busybox.net>;
 Mon,  8 Nov 2021 16:07:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 40219402F3
 for <buildroot@buildroot.org>; Mon,  8 Nov 2021 16:07:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 95ABE8B6D5; Mon,  8 Nov 2021 16:03:23 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 8 Nov 2021 16:04:48 +0100
X-Git-Refname: refs/heads/2021.08.x
X-Git-Oldrev: 92173f8704a672c9458ed96304155c03654c14f9
X-Git-Newrev: cfb284653fe5e24b67796cb849c4ef480eb7da58
X-Patchwork-Hint: ignore
Message-Id: <20211108160323.95ABE8B6D5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.08.x] package/dahdi-linux: fix
 hotplug build
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

commit: https://git.buildroot.net/buildroot/commit/?id=cfb284653fe5e24b67796cb849c4ef480eb7da58
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.08.x

Fix hotplug build which fails since the addition of the package in
commit d959966b41bd88a36664c733a8a8d2b6809e4fc2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit ae4198abf48934d28e3813d2066fd7dc591f17af)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...di-Kbuild-fix-HOTPLUG_FIRMWARE-definition.patch | 64 ++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/package/dahdi-linux/0001-drivers-dahdi-Kbuild-fix-HOTPLUG_FIRMWARE-definition.patch b/package/dahdi-linux/0001-drivers-dahdi-Kbuild-fix-HOTPLUG_FIRMWARE-definition.patch
new file mode 100644
index 0000000000..82fd9bdc59
--- /dev/null
+++ b/package/dahdi-linux/0001-drivers-dahdi-Kbuild-fix-HOTPLUG_FIRMWARE-definition.patch
@@ -0,0 +1,64 @@
+From dc0a646a460e6da10ddbe7bf02794051d76f8751 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Thu, 4 Nov 2021 17:30:06 +0100
+Subject: [PATCH] drivers/dahdi/Kbuild: fix HOTPLUG_FIRMWARE definition
+
+HOTPLUG_FIRMWARE is used before being defined resulting in the following
+build failure since version 2.7.0 and
+https://git.asterisk.org/gitweb/?p=dahdi/linux.git;a=commit;h=e2f492595c9191ba6d556ccac1bde4c1bb892938:
+
+  MODPOST /home/fabrice/buildroot/output/build/dahdi-linux-5c840cf43838e0690873e73409491c392333b3b8/drivers/dahdi/Module.symvers
+ERROR: modpost: "_binary_dahdi_fw_oct6114_032_bin_start" [/home/fabrice/buildroot/output/build/dahdi-linux-5c840cf43838e0690873e73409491c392333b3b8/drivers/dahdi/wcaxx.ko] undefined!
+ERROR: modpost: "_binary_dahdi_fw_oct6114_032_bin_size" [/home/fabrice/buildroot/output/build/dahdi-linux-5c840cf43838e0690873e73409491c392333b3b8/drivers/dahdi/wcaxx.ko] undefined!
+ERROR: modpost: "_binary_dahdi_fw_oct6114_128_bin_start" [/home/fabrice/buildroot/output/build/dahdi-linux-5c840cf43838e0690873e73409491c392333b3b8/drivers/dahdi/wcte43x.ko] undefined!
+ERROR: modpost: "_binary_dahdi_fw_oct6114_064_bin_start" [/home/fabrice/buildroot/output/build/dahdi-linux-5c840cf43838e0690873e73409491c392333b3b8/drivers/dahdi/wcte43x.ko] undefined!
+ERROR: modpost: "_binary_dahdi_fw_oct6114_128_bin_size" [/home/fabrice/buildroot/output/build/dahdi-linux-5c840cf43838e0690873e73409491c392333b3b8/drivers/dahdi/wcte43x.ko] undefined!
+ERROR: modpost: "_binary_dahdi_fw_oct6114_064_bin_size" [/home/fabrice/buildroot/output/build/dahdi-linux-5c840cf43838e0690873e73409491c392333b3b8/drivers/dahdi/wcte43x.ko] undefined!
+ERROR: modpost: "_binary_dahdi_fw_oct6114_032_bin_start" [/home/fabrice/buildroot/output/build/dahdi-linux-5c840cf43838e0690873e73409491c392333b3b8/drivers/dahdi/wcte13xp.ko] undefined!
+ERROR: modpost: "_binary_dahdi_fw_oct6114_032_bin_size" [/home/fabrice/buildroot/output/build/dahdi-linux-5c840cf43838e0690873e73409491c392333b3b8/drivers/dahdi/wcte13xp.ko] undefined!
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: sent to "Shaun Ruffell <sruffell@sruffell.net>"]
+---
+ drivers/dahdi/Kbuild | 18 +++++++++---------
+ 1 file changed, 9 insertions(+), 9 deletions(-)
+
+diff --git a/drivers/dahdi/Kbuild b/drivers/dahdi/Kbuild
+index 855e5bf..b1a8481 100644
+--- a/drivers/dahdi/Kbuild
++++ b/drivers/dahdi/Kbuild
+@@ -13,6 +13,15 @@ obj-$(DAHDI_BUILD_ALL)$(CONFIG_DAHDI_WCTC4XXP)		+= wctc4xxp/
+ obj-$(DAHDI_BUILD_ALL)$(CONFIG_DAHDI_WCTDM24XXP)	+= wctdm24xxp/
+ obj-$(DAHDI_BUILD_ALL)$(CONFIG_DAHDI_WCTE13XP)		+= wcte13xp.o
+ 
++ifndef HOTPLUG_FIRMWARE
++ifneq (,$(filter y m,$(CONFIG_FW_LOADER)))
++HOTPLUG_FIRMWARE := yes
++else
++HOTPLUG_FIRMWARE := no
++endif
++export HOTPLUG_FIRMWARE
++endif
++
+ wcte13xp-objs := wcte13xp-base.o wcxb_spi.o wcxb.o wcxb_flash.o
+ CFLAGS_wcte13xp-base.o += -I$(src)/oct612x -I$(src)/oct612x/include -I$(src)/oct612x/octdeviceapi -I$(src)/oct612x/octdeviceapi/oct6100api
+ ifeq ($(HOTPLUG_FIRMWARE),yes)
+@@ -61,15 +70,6 @@ endif
+ 
+ CFLAGS_MODULE += -I$(DAHDI_INCLUDE) -I$(src) -Wno-format-truncation
+ 
+-ifndef HOTPLUG_FIRMWARE
+-ifneq (,$(filter y m,$(CONFIG_FW_LOADER)))
+-HOTPLUG_FIRMWARE := yes
+-else
+-HOTPLUG_FIRMWARE := no
+-endif
+-export HOTPLUG_FIRMWARE
+-endif
+-
+ # fix typo present in CentOS and RHEL 2.6.9 kernels
+ BAD_KERNELS_VERS := 22 34 34.0.1 34.0.2
+ BAD_KERNELS := $(foreach ver,$(BAD_KERNELS_VERS),2.6.9-$(ver).EL 2.6.9-$(ver).ELsmp)
+-- 
+2.33.0
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
