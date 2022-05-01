Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D559C433EF
	for <buildroot@archiver.kernel.org>; Sun,  1 May 2022 14:18:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AD28B60C27;
	Sun,  1 May 2022 14:18:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LeDf77ANp8xr; Sun,  1 May 2022 14:18:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A8CF860D5B;
	Sun,  1 May 2022 14:18:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6CAB51BF41B
 for <buildroot@lists.busybox.net>; Sun,  1 May 2022 14:18:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 623F160B08
 for <buildroot@lists.busybox.net>; Sun,  1 May 2022 14:18:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fVKzT3hlq_am for <buildroot@lists.busybox.net>;
 Sun,  1 May 2022 14:18:29 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from libero.it (smtp-36.italiaonline.it [213.209.10.36])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AF8DB607F1
 for <buildroot@buildroot.org>; Sun,  1 May 2022 14:18:28 +0000 (UTC)
Received: from passgat-Modern-14-A10M.homenet.telecomitalia.it ([87.0.15.73])
 by smtp-36.iol.local with ESMTPA
 id lAP2nYveNc2f5lAP2nAEUy; Sun, 01 May 2022 16:18:25 +0200
x-libjamoibt: 1601
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=libero.it; s=s2021;
 t=1651414705; bh=6xUq4EBXBHoTJGfzlNFM8kJtVqMaOdVhlZS41F4qMn8=;
 h=From;
 b=MLI4WoB0TgV31DBftIesuoTqkVDsVHwlF9NXxixAmBkIHZZYd4xoo0vqSM/sEkU+I
 8L1F9Ep4SsJ9EaBudoqYOgjzrmyVPpM/iOLpX73+NrQLHOUq6XbCFJNBy9/oePFwyr
 S4Htdk4Bj6D3jG591EvqKuy7lQnf2za/RzVmx/8S/nAWrWBIUMSvdo0o7EuqLIbfNx
 Yv77EvH9gcEgcNS3WeT4aBWATQFXvMfdK+shY2nRSLJOT3q6y+jWTiIwU+QEApDTgE
 7pezdGRtF3/kWrq46GfQzlJQLwauaXu4LrWt+GIRRfBbGZMBcUnIhBIMLxhgaVi8S2
 PNMLnaBaj2jAA==
X-CNFS-Analysis: v=2.4 cv=Z6kpoFdA c=1 sm=1 tr=0 ts=626e96b1 cx=a_exe
 a=h5x6SpL9bzIPZN26QICeQA==:117 a=h5x6SpL9bzIPZN26QICeQA==:17 a=3HDBlxybAAAA:8
 a=UhE9Mq0jjzo1vbFAF1sA:9 a=laEoCiVfU_Unz3mSdgXN:22
To: buildroot@buildroot.org
Date: Sun,  1 May 2022 16:18:15 +0200
Message-Id: <20220501141815.3886-1-dariobin@libero.it>
X-Mailer: git-send-email 2.17.1
X-CMAE-Envelope: MS4xfJSL3BZXgRTm/N+ua+x8Ts6qGRoIvJHQbMh5DgEQlqtFdDEi059TJ/bBd5xYNytDZv3yJfg0WCUhdc4Q4y3hRck3UQFPWa+umTYVGi8i8DzEL5FlbLbm
 DovAj/sryMrIAbWP6cF6hLd9CuWrW2fdXxZ19hULG/CwJy08vfe3qpU9CrVMvmcOaazQwXoIQsr0Geq3Hu7Tkw9pv5Ewe5UwLiUOnst2rCmVlqOXO61UfkV3
 Zrgjc97WQ8EQSsNUpzoYtxEG+GIkCqWggJHEOMYqGTKAGAmLCuFPSVjq9+4zVsWb
Subject: [Buildroot] [PATCH 1/1] package/libmnl: add options to build
 examples
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
From: Dario Binacchi via buildroot <buildroot@buildroot.org>
Reply-To: Dario Binacchi <dariobin@libero.it>
Cc: Dario Binacchi <dariobin@libero.it>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The example applications, which are minimal, can be of great help in
understanding how the library works.

As there is no configure option to enable examples compilation, building
and installation instructions had to be added to libmnl.mk. By default,
which is always the case for buildroot, they are disabled.

Signed-off-by: Dario Binacchi <dariobin@libero.it>
---
 package/libmnl/Config.in | 37 +++++++++++++++++++++++++++++++++++++
 package/libmnl/libmnl.mk | 39 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 76 insertions(+)

diff --git a/package/libmnl/Config.in b/package/libmnl/Config.in
index 5acfb2447e..81b3811270 100644
--- a/package/libmnl/Config.in
+++ b/package/libmnl/Config.in
@@ -5,3 +5,40 @@ config BR2_PACKAGE_LIBMNL
 	  to Netlink developers.
 
 	  http://netfilter.org/projects/libmnl/
+
+if BR2_PACKAGE_LIBMNL
+
+config BR2_PACKAGE_LIBMNL_EXAMPLES
+	bool "install examples"
+	help
+	  Install binary examples.
+
+if BR2_PACKAGE_LIBMNL_EXAMPLES
+
+config BR2_PACKAGE_LIBMNL_EXAMPLES_GENL
+	bool "genl"
+	help
+	  This option will build and install the genl examples for
+	  the target.
+
+config BR2_PACKAGE_LIBMNL_EXAMPLES_KOBJECT
+	bool "kobject"
+	help
+	  This option will build and install the kobject examples
+	  for the target.
+
+config BR2_PACKAGE_LIBMNL_EXAMPLES_NETFILTER
+	bool "netfilter"
+	help
+	  This option will build and install the netfilter examples
+	  for the target.
+
+config BR2_PACKAGE_LIBMNL_EXAMPLES_RTNL
+	bool "rtnl"
+	help
+	  This option will build and install the rtnl examples for
+	  the target.
+
+endif
+
+endif
diff --git a/package/libmnl/libmnl.mk b/package/libmnl/libmnl.mk
index 3361d05248..cb31b0f75f 100644
--- a/package/libmnl/libmnl.mk
+++ b/package/libmnl/libmnl.mk
@@ -12,4 +12,43 @@ LIBMNL_LICENSE = LGPL-2.1+
 LIBMNL_LICENSE_FILES = COPYING
 LIBMNL_CPE_ID_VENDOR = netfilter
 
+ifeq ($(BR2_PACKAGE_LIBMNL_EXAMPLES),y)
+define LIBMNL_EXAMPLES_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) check -C $(@D)
+endef
+LIBMNL_POST_BUILD_HOOKS += LIBMNL_EXAMPLES_BUILD_CMDS
+
+ifeq ($(BR2_PACKAGE_LIBMNL_EXAMPLES_GENL),y)
+LIBMNL_EXAMPLES_INSTALL_TARGETS += \
+	$(addprefix examples/genl/, genl-family-get genl-group-events)
+endif
+
+ifeq ($(BR2_PACKAGE_LIBMNL_EXAMPLES_KOBJECT),y)
+LIBMNL_EXAMPLES_INSTALL_TARGETS += \
+	$(addprefix examples/kobject/, kobject-event)
+endif
+
+ifeq ($(BR2_PACKAGE_LIBMNL_EXAMPLES_NETFILTER),y)
+LIBMNL_EXAMPLES_INSTALL_TARGETS += \
+	$(addprefix examples/netfilter/, nfct-create-batch \
+		nfct-daemon nfct-dump nfct-event nf-log \
+		nf-queue)
+endif
+
+ifeq ($(BR2_PACKAGE_LIBMNL_EXAMPLES_RTNL),y)
+LIBMNL_EXAMPLES_INSTALL_TARGETS += \
+	$(addprefix examples/rtnl/, rtnl-addr-add rtnl-addr-dump \
+		rtnl-link-dump rtnl-link-dump2 rtnl-link-dump3 \
+		rtnl-link-event rtnl-link-set rtnl-neigh-dump \
+		rtnl-route-add rtnl-route-dump rtnl-route-event)
+endif
+
+define LIBMNL_EXAMPLES_INSTALL_TARGET_CMDS
+	$(foreach t,$(LIBMNL_EXAMPLES_INSTALL_TARGETS), \
+		$(INSTALL) -D -m 0755 $(@D)/$(t) \
+			$(TARGET_DIR)/usr/bin/$(notdir $(t))$(sep))
+endef
+LIBMNL_POST_INSTALL_TARGET_HOOKS += LIBMNL_EXAMPLES_INSTALL_TARGET_CMDS
+endif
+
 $(eval $(autotools-package))
-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
