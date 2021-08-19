Return-Path: <SRS0=aU6e=NK=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3B25C43214
	for <buildroot@archiver.kernel.org>; Thu, 19 Aug 2021 20:00:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5ABC860462
	for <buildroot@archiver.kernel.org>; Thu, 19 Aug 2021 20:00:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5ABC860462
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2347780E51;
	Thu, 19 Aug 2021 20:00:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NQSDmXTgyOmd; Thu, 19 Aug 2021 19:59:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B9F3F80DAD;
	Thu, 19 Aug 2021 19:59:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 249191BF215
 for <buildroot@lists.busybox.net>; Thu, 19 Aug 2021 19:59:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1350D40208
 for <buildroot@lists.busybox.net>; Thu, 19 Aug 2021 19:59:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id glpFFiaxet9u for <buildroot@lists.busybox.net>;
 Thu, 19 Aug 2021 19:59:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 38A04401E9
 for <buildroot@buildroot.org>; Thu, 19 Aug 2021 19:59:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 07FF28D4DE; Thu, 19 Aug 2021 19:59:07 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Thu, 19 Aug 2021 21:59:43 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6da42d767a42e8e95b1ba042fbe99c3c8de13f28
X-Git-Newrev: 04cf354470220658db4e08b8eeb84293898f4900
X-Patchwork-Hint: ignore
Message-Id: <20210819195907.07FF28D4DE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/nvidia-driver: fix build without
 X.org drivers
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=04cf354470220658db4e08b8eeb84293898f4900
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure without BR2_PACKAGE_NVIDIA_DRIVER_XORG
raised since commit 9cda982855315d683d4880e6bb2a129133ea7213:

ln: failed to create symbolic link '/tmp/instance-0/output-1/target/usr/lib/xorg/modules/extensions/libglx.so': No such file or directory

Fixes:
 - http://autobuild.buildroot.org/results/c2e7a826c105363309f70a3fcfe28bd53efcb94a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: Vincent Fazio <vfazio@xes-inc.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/nvidia-driver/nvidia-driver.mk | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/nvidia-driver/nvidia-driver.mk b/package/nvidia-driver/nvidia-driver.mk
index 7e89c1ab01..54c2aa46d8 100644
--- a/package/nvidia-driver/nvidia-driver.mk
+++ b/package/nvidia-driver/nvidia-driver.mk
@@ -96,6 +96,12 @@ NVIDIA_DRIVER_LIBS += \
 	nvidia_drv.so:xorg/modules/drivers/ \
 	libglx.so.$(NVIDIA_DRIVER_VERSION):xorg/modules/extensions/
 
+# libglx needs a symlink according to the driver README. It has no SONAME
+define NVIDIA_DRIVER_SYMLINK_LIBGLX
+	ln -sf libglx.so.$(NVIDIA_DRIVER_VERSION) \
+		$(TARGET_DIR)/usr/lib/xorg/modules/extensions/libglx.so
+endef
+
 endif # X drivers
 
 ifeq ($(BR2_PACKAGE_NVIDIA_DRIVER_CUDA),y)
@@ -187,12 +193,6 @@ define NVIDIA_DRIVER_INSTALL_STAGING_CMDS
 	$(NVIDIA_DRIVER_INSTALL_GL_DEV)
 endef
 
-# libglx needs a symlink according to the driver README. It has no SONAME
-define NVIDIA_DRIVER_SYMLINK_LIBGLX
-	ln -sf libglx.so.$(NVIDIA_DRIVER_VERSION) \
-		$(TARGET_DIR)/usr/lib/xorg/modules/extensions/libglx.so
-endef
-
 # For target, install libraries and X.org modules
 define NVIDIA_DRIVER_INSTALL_TARGET_CMDS
 	$(call NVIDIA_DRIVER_INSTALL_LIBS,$(TARGET_DIR))
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
