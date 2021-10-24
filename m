Return-Path: <SRS0=WrHH=PM=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C686C433EF
	for <buildroot@archiver.kernel.org>; Sun, 24 Oct 2021 13:59:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6468F60F12
	for <buildroot@archiver.kernel.org>; Sun, 24 Oct 2021 13:59:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6468F60F12
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 11571400B5;
	Sun, 24 Oct 2021 13:59:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Nr5rOGbpw38u; Sun, 24 Oct 2021 13:59:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 251D940124;
	Sun, 24 Oct 2021 13:59:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 950491BF2A2
 for <buildroot@lists.busybox.net>; Sun, 24 Oct 2021 13:59:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 84AD5401B1
 for <buildroot@lists.busybox.net>; Sun, 24 Oct 2021 13:59:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H53EVFRBAprE for <buildroot@lists.busybox.net>;
 Sun, 24 Oct 2021 13:59:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A8BA54019C
 for <buildroot@buildroot.org>; Sun, 24 Oct 2021 13:59:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id F3A40885D1; Sun, 24 Oct 2021 13:56:14 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 24 Oct 2021 15:58:59 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1afea0b11b140a6d50aff726f2570702cc984a6e
X-Git-Newrev: a5c8b0bac8849f0e226345b4c5d3a623b1aad5c4
X-Patchwork-Hint: ignore
Message-Id: <20211024135614.F3A40885D1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libcamera: add lc-compliance test
 application option
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

commit: https://git.buildroot.net/buildroot/commit/?id=a5c8b0bac8849f0e226345b4c5d3a623b1aad5c4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- add lc-compliance test application option (and add proper dependencies
  on gtest and libevent)

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Acked-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libcamera/Config.in    | 18 ++++++++++++++++++
 package/libcamera/libcamera.mk |  7 +++++++
 2 files changed, 25 insertions(+)

diff --git a/package/libcamera/Config.in b/package/libcamera/Config.in
index b7f0e5b05d..23a0040abf 100644
--- a/package/libcamera/Config.in
+++ b/package/libcamera/Config.in
@@ -72,6 +72,24 @@ config BR2_PACKAGE_LIBCAMERA_PIPELINE_VIMC
 	help
 	  Pipeline for the vimc device.
 
+config BR2_PACKAGE_LIBCAMERA_COMPLIANCE
+	bool "lc-compliance test application"
+	depends on BR2_USE_WCHAR # gtest
+	depends on BR2_TOOLCHAIN_HAS_THREADS # gtest
+	depends on BR2_INSTALL_LIBSTDCPP # gtest
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # gtest
+	depends on BR2_USE_MMU # gtest
+	select BR2_PACKAGE_GTEST
+	select BR2_PACKAGE_LIBEVENT
+	help
+	  lc-compliance test application
+
+comment "lc-compliance test application needs a toolchain w/ C++, wchar, threads, gcc >= 4.9"
+	depends on BR2_USE_MMU
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_INSTALL_LIBSTDCPP || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+
 endif # BR2_PACKAGE_LIBCAMERA
 
 comment "libcamera needs a toolchain w/ C++, threads, wchar, dynamic library, gcc >= 7"
diff --git a/package/libcamera/libcamera.mk b/package/libcamera/libcamera.mk
index 8ab95fb42a..5a5f2800b9 100644
--- a/package/libcamera/libcamera.mk
+++ b/package/libcamera/libcamera.mk
@@ -61,6 +61,13 @@ LIBCAMERA_PIPELINES-$(BR2_PACKAGE_LIBCAMERA_PIPELINE_VIMC) += vimc
 
 LIBCAMERA_CONF_OPTS += -Dpipelines=$(subst $(space),$(comma),$(LIBCAMERA_PIPELINES-y))
 
+ifeq ($(BR2_PACKAGE_LIBCAMERA_COMPLIANCE),y)
+LIBCAMERA_DEPENDENCIES += gtest libevent
+LIBCAMERA_CONF_OPTS += -Dlc-compliance=enabled
+else
+LIBCAMERA_CONF_OPTS += -Dlc-compliance=disabled
+endif
+
 # gstreamer-video-1.0, gstreamer-allocators-1.0
 ifeq ($(BR2_PACKAGE_GSTREAMER1)$(BR2_PACKAGE_GST1_PLUGINS_BASE),yy)
 LIBCAMERA_CONF_OPTS += -Dgstreamer=enabled
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
