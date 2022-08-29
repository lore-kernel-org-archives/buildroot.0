Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CD50ECAAD2
	for <buildroot@archiver.kernel.org>; Mon, 29 Aug 2022 09:33:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9572481397;
	Mon, 29 Aug 2022 09:33:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9572481397
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oJQMZN0sy6Ty; Mon, 29 Aug 2022 09:33:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A2D1C81387;
	Mon, 29 Aug 2022 09:33:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A2D1C81387
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4823A1BF9A4
 for <buildroot@lists.busybox.net>; Mon, 29 Aug 2022 09:33:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E60D760EFE
 for <buildroot@lists.busybox.net>; Mon, 29 Aug 2022 09:33:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E60D760EFE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tt8H2GhzE0VN for <buildroot@lists.busybox.net>;
 Mon, 29 Aug 2022 09:33:39 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 26D1660F29
 for <buildroot@buildroot.org>; Mon, 29 Aug 2022 09:33:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 26D1660F29
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 4B5D887F2B; Mon, 29 Aug 2022 09:18:38 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 29 Aug 2022 11:32:02 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 5fa2a710601d9bb0952f7ec3648dc1aa290dc57b
X-Git-Newrev: 977ffdb2005c1978930433be4b479667c1efdd40
X-Patchwork-Hint: ignore
Message-Id: <20220829091838.4B5D887F2B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/v4l2loopback: add
 V4L2LOOPBACK_LINUX_CONFIG_FIXUPS
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

commit: https://git.buildroot.net/buildroot/commit/?id=977ffdb2005c1978930433be4b479667c1efdd40
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Fix the following build failure:

ERROR: modpost: "video_ioctl2" [/nvmedata/autobuild/instance-10/output-1/build/v4l2loopback-0.12.5/./v4l2loopback.ko] undefined!
ERROR: modpost: "__video_register_device" [/nvmedata/autobuild/instance-10/output-1/build/v4l2loopback-0.12.5/./v4l2loopback.ko] undefined!
ERROR: modpost: "v4l2_ctrl_new_custom" [/nvmedata/autobuild/instance-10/output-1/build/v4l2loopback-0.12.5/./v4l2loopback.ko] undefined!
ERROR: modpost: "v4l2_ctrl_handler_init_class" [/nvmedata/autobuild/instance-10/output-1/build/v4l2loopback-0.12.5/./v4l2loopback.ko] undefined!
ERROR: modpost: "video_device_alloc" [/nvmedata/autobuild/instance-10/output-1/build/v4l2loopback-0.12.5/./v4l2loopback.ko] undefined!
ERROR: modpost: "v4l2_device_register" [/nvmedata/autobuild/instance-10/output-1/build/v4l2loopback-0.12.5/./v4l2loopback.ko] undefined!
ERROR: modpost: "video_device_release" [/nvmedata/autobuild/instance-10/output-1/build/v4l2loopback-0.12.5/./v4l2loopback.ko] undefined!
ERROR: modpost: "v4l2_ctrl_handler_free" [/nvmedata/autobuild/instance-10/output-1/build/v4l2loopback-0.12.5/./v4l2loopback.ko] undefined!
ERROR: modpost: "v4l2_device_unregister" [/nvmedata/autobuild/instance-10/output-1/build/v4l2loopback-0.12.5/./v4l2loopback.ko] undefined!
ERROR: modpost: "video_unregister_device" [/nvmedata/autobuild/instance-10/output-1/build/v4l2loopback-0.12.5/./v4l2loopback.ko] undefined!

Fixes:
 - http://autobuild.buildroot.org/results/640f8f61c7f433ffe5e9a6759eecc9a03f735569

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit aa61d29b84be8e32022a68c3c4055300a97d581b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/v4l2loopback/v4l2loopback.mk | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/package/v4l2loopback/v4l2loopback.mk b/package/v4l2loopback/v4l2loopback.mk
index 7701bc3a30..d9f065a49d 100644
--- a/package/v4l2loopback/v4l2loopback.mk
+++ b/package/v4l2loopback/v4l2loopback.mk
@@ -15,5 +15,15 @@ define V4L2LOOPBACK_INSTALL_TARGET_CMDS
 endef
 endif
 
+# CONFIG_MEDIA_SUPPORT depends on CONFIG_HAS_IOMEM, which is only
+# available when CONFIG_PCI=y on S390. CONFIG_VIDEO_DEV needs
+# CONFIG_I2C since Linux 5.18.
+define V4L2LOOPBACK_LINUX_CONFIG_FIXUPS
+	$(if $(BR2_s390x),$(call KCONFIG_ENABLE_OPT,CONFIG_PCI))
+	$(call KCONFIG_ENABLE_OPT,CONFIG_MEDIA_SUPPORT)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_I2C)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_VIDEO_DEV)
+endef
+
 $(eval $(kernel-module))
 $(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
