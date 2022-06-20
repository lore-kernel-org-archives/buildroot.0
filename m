Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EB12C433EF
	for <buildroot@archiver.kernel.org>; Mon, 20 Jun 2022 19:44:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2BE49405B3;
	Mon, 20 Jun 2022 19:44:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2BE49405B3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PW71o_i5aEwT; Mon, 20 Jun 2022 19:44:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 447DF40B76;
	Mon, 20 Jun 2022 19:44:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 447DF40B76
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 40E981BF3FD
 for <buildroot@lists.busybox.net>; Mon, 20 Jun 2022 19:44:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 290DE60FD4
 for <buildroot@lists.busybox.net>; Mon, 20 Jun 2022 19:44:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 290DE60FD4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cipVaEpP2sMi for <buildroot@lists.busybox.net>;
 Mon, 20 Jun 2022 19:44:05 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 15D4A60F71
 for <buildroot@buildroot.org>; Mon, 20 Jun 2022 19:44:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 15D4A60F71
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 2D9D0874EE; Mon, 20 Jun 2022 19:31:43 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 20 Jun 2022 21:36:54 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 570aa425596cc1266cd9fba9af66b3e97f48fb62
X-Git-Newrev: 7763ba7007172ceb5e928ae5902735d727aaa90d
X-Patchwork-Hint: ignore
Message-Id: <20220620193143.2D9D0874EE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rtl8723bs: drop package
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
Content-Type: multipart/mixed; boundary="===============3275080404045573613=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3275080404045573613==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=7763ba7007172ceb5e928ae5902735d727aaa90d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop package as it doesn't build with latest kernel and project is not
maintained anymore: code has been removed in 2017 as driver is available
in the linux-next tree (cf.
https://github.com/hadess/rtl8723bs/commit/3bb1d33ad98c1d77b5e17a1b707e137b35e6d0a5):

In file included from /home/autobuild/autobuild/instance-3/output-1/build/rtl8723bs-11ab92d8ccd71c80f0102828366b14ef6b676fb2/./include/drv_types.h:25,
                 from /home/autobuild/autobuild/instance-3/output-1/build/rtl8723bs-11ab92d8ccd71c80f0102828366b14ef6b676fb2/./core/rtw_cmd.c:17:
/home/autobuild/autobuild/instance-3/output-1/build/rtl8723bs-11ab92d8ccd71c80f0102828366b14ef6b676fb2/./include/autoconf.h:27:2: error: #error CONFIG_WIRELESS_EXT needs to be enabled for this driver to work
   27 | #error CONFIG_WIRELESS_EXT needs to be enabled for this driver to work
      |  ^~~~~
In file included from /home/autobuild/autobuild/instance-3/output-1/build/rtl8723bs-11ab92d8ccd71c80f0102828366b14ef6b676fb2/./include/osdep_service.h:23,
                 from /home/autobuild/autobuild/instance-3/output-1/build/rtl8723bs-11ab92d8ccd71c80f0102828366b14ef6b676fb2/./include/drv_types.h:27,
                 from /home/autobuild/autobuild/instance-3/output-1/build/rtl8723bs-11ab92d8ccd71c80f0102828366b14ef6b676fb2/./core/rtw_cmd.c:17:
/home/autobuild/autobuild/instance-3/output-1/build/rtl8723bs-11ab92d8ccd71c80f0102828366b14ef6b676fb2/./include/osdep_service_linux.h: In function ‘_init_timer’:
/home/autobuild/autobuild/instance-3/output-1/build/rtl8723bs-11ab92d8ccd71c80f0102828366b14ef6b676fb2/./include/osdep_service_linux.h:97:8: error: ‘_timer’ {aka ‘struct timer_list’} has no member named ‘data’
   97 |  ptimer->data = (unsigned long)cntx;
      |        ^~
/home/autobuild/autobuild/instance-3/output-1/build/rtl8723bs-11ab92d8ccd71c80f0102828366b14ef6b676fb2/./include/osdep_service_linux.h:98:2: error: implicit declaration of function ‘init_timer’; did you mean ‘_init_timer’? [-Werror=implicit-function-declaration]
   98 |  init_timer(ptimer);
      |  ^~~~~~~~~~
      |  _init_timer

Fixes:
 - http://autobuild.buildroot.org/results/7a473e83d4a3d1e2228f4ee1282e85697de4ae5d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 Config.in.legacy                                   |  8 +++++
 DEVELOPERS                                         |  1 -
 package/Config.in                                  |  1 -
 .../0001-rtl8723bs-add-debug-level-modparam.patch  | 41 ----------------------
 package/rtl8723bs/Config.in                        | 10 ------
 package/rtl8723bs/rtl8723bs.mk                     | 27 --------------
 6 files changed, 8 insertions(+), 80 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index aea2b59abb..956da10a9f 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -164,6 +164,14 @@ config BR2_nds32
 
 comment "Legacy options removed in 2022.05"
 
+config BR2_PACKAGE_RTL8723BS
+	bool "rtl8723bs removed"
+	select BR2_LEGACY
+	help
+	  Package was removed because it is not compatible with latest
+	  kernels and is not maintained anymore: code has been removed
+	  in 2017 as driver is available in the linux-next tree.
+
 config BR2_PACKAGE_KTAP
 	bool "ktap removed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index 63d1c3fcb6..fc329fec27 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -834,7 +834,6 @@ F:	package/jimtcl/
 F:	package/mimic/
 F:	package/nodm/
 F:	package/openbox/
-F:	package/rtl8723bs/
 F:	package/supertuxkart/
 
 N:	Fabio Estevam <festevam@gmail.com>
diff --git a/package/Config.in b/package/Config.in
index 0e3eb11b24..f09da05be0 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -563,7 +563,6 @@ endmenu
 	source "package/rtl8188eu/Config.in"
 	source "package/rtl8189es/Config.in"
 	source "package/rtl8189fs/Config.in"
-	source "package/rtl8723bs/Config.in"
 	source "package/rtl8723bu/Config.in"
 	source "package/rtl8723ds/Config.in"
 	source "package/rtl8812au-aircrack-ng/Config.in"
diff --git a/package/rtl8723bs/0001-rtl8723bs-add-debug-level-modparam.patch b/package/rtl8723bs/0001-rtl8723bs-add-debug-level-modparam.patch
deleted file mode 100644
index 0443c1f995..0000000000
--- a/package/rtl8723bs/0001-rtl8723bs-add-debug-level-modparam.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 9f70428f506ac9d5af325004c01c59c62669d7eb Mon Sep 17 00:00:00 2001
-From: Jason Abele <jason@jasonabeleconsulting.com>
-Date: Sat, 15 Aug 2015 18:20:54 -0700
-Subject: [PATCH] rtl8723bs: add debug level modparam
-
-For ease of controlling debug printk verbosity, add a module parameter
-which sets debug level at module load.
-
-Signed-off-by: Jason Abele <jason@jasonabeleconsulting.com>
-[Fixed to apply on current version]
-Signed-off-by: Ariel D'Alessandro <ariel@vanguardiasur.com.ar>
----
- os_dep/os_intfs.c | 5 +++++
- 1 file changed, 5 insertions(+)
-
-diff --git a/os_dep/os_intfs.c b/os_dep/os_intfs.c
-index b30c2a0..eeb8946 100644
---- a/os_dep/os_intfs.c
-+++ b/os_dep/os_intfs.c
-@@ -231,6 +231,10 @@ module_param(rtw_decrypt_phy_file, int, 0644);
- MODULE_PARM_DESC(rtw_decrypt_phy_file,"Enable Decrypt PHY File");
- #endif
-
-+int rtw_debug_level = _drv_err_;
-+module_param(rtw_debug_level, int, 0644);
-+MODULE_PARM_DESC(rtw_debug_level,"Set Driver Debug Verbosity");
-+
- int _netdev_open(struct net_device *pnetdev);
- int netdev_open (struct net_device *pnetdev);
- static int netdev_close (struct net_device *pnetdev);
-@@ -347,6 +351,7 @@ static uint loadparam(struct adapter *padapter, _nic_hdl pnetdev)
- 	registry_par->qos_opt_enable = (u8)rtw_qos_opt_enable;
-
- 	registry_par->hiq_filter = (u8)rtw_hiq_filter;
-+	GlobalDebugLevel = rtw_debug_level;
- 	return status;
- }
-
---
-2.8.3
-
diff --git a/package/rtl8723bs/Config.in b/package/rtl8723bs/Config.in
deleted file mode 100644
index 3d5dea40b5..0000000000
--- a/package/rtl8723bs/Config.in
+++ /dev/null
@@ -1,10 +0,0 @@
-config BR2_PACKAGE_RTL8723BS
-	bool "rtl8723bs"
-	depends on BR2_LINUX_KERNEL
-	help
-	  rtl8723bs wifi driver
-
-	  https://github.com/hadess/rtl8723bs
-
-comment "rtl8723bs needs a Linux kernel to be built"
-	depends on !BR2_LINUX_KERNEL
diff --git a/package/rtl8723bs/rtl8723bs.mk b/package/rtl8723bs/rtl8723bs.mk
deleted file mode 100644
index 4c6303c2ef..0000000000
--- a/package/rtl8723bs/rtl8723bs.mk
+++ /dev/null
@@ -1,27 +0,0 @@
-################################################################################
-#
-# rtl8723bs
-#
-################################################################################
-
-RTL8723BS_VERSION = 11ab92d8ccd71c80f0102828366b14ef6b676fb2
-RTL8723BS_SITE = $(call github,hadess,rtl8723bs,$(RTL8723BS_VERSION))
-RTL8723BS_LICENSE = GPL-2.0, proprietary (*.bin firmware blobs)
-
-RTL8723BS_MODULE_MAKE_OPTS = \
-	CONFIG_RTL8723BS=m \
-	KVER=$(LINUX_VERSION_PROBED) \
-	KSRC=$(LINUX_DIR)
-
-RTL8723BS_BINS = rtl8723bs_ap_wowlan.bin rtl8723bs_wowlan.bin \
-	rtl8723bs_bt.bin rtl8723bs_nic.bin
-
-define RTL8723BS_INSTALL_FIRMWARE
-	$(foreach bin, $(RTL8723BS_BINS), \
-		$(INSTALL) -D -m 644 $(@D)/$(bin) $(TARGET_DIR)/lib/firmware/rtlwifi/$(bin)
-	)
-endef
-RTL8723BS_POST_INSTALL_TARGET_HOOKS += RTL8723BS_INSTALL_FIRMWARE
-
-$(eval $(kernel-module))
-$(eval $(generic-package))

--===============3275080404045573613==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3275080404045573613==--
