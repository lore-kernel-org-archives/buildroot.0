Return-Path: <SRS0=01xH=PX=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F5B0C433EF
	for <buildroot@archiver.kernel.org>; Thu,  4 Nov 2021 14:19:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4FA2F611C1
	for <buildroot@archiver.kernel.org>; Thu,  4 Nov 2021 14:19:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4FA2F611C1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=xes-inc.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EE2DD81776;
	Thu,  4 Nov 2021 14:19:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KeQ97erBHjxa; Thu,  4 Nov 2021 14:19:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 43B0A8176E;
	Thu,  4 Nov 2021 14:19:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C52041BF5F6
 for <buildroot@lists.busybox.net>; Thu,  4 Nov 2021 14:19:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C0B26403D3
 for <buildroot@lists.busybox.net>; Thu,  4 Nov 2021 14:19:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=xes-inc.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LP3e6-Sqx6Fi for <buildroot@lists.busybox.net>;
 Thu,  4 Nov 2021 14:19:26 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.xes-mad.com (mail.xes-mad.com [162.248.234.2])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F141F403B3
 for <buildroot@buildroot.org>; Thu,  4 Nov 2021 14:19:25 +0000 (UTC)
Received: from vfazio2.xes-mad.com (vfazio2.xes-mad.com [10.52.16.113])
 by mail.xes-mad.com (Postfix) with ESMTP id A336920201;
 Thu,  4 Nov 2021 09:19:24 -0500 (CDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xes-inc.com; s=mail;
 t=1636035564; bh=lOmGR1JIf60qYnyG+KzmHesLM6BB4azuga4CVJAoYPM=;
 h=From:To:Cc:Subject:Date:From;
 b=R+Yx+rmu7p+YWL7QBqcAiCvJXEx/tV8n2e74ihTqR95r6W62JF7D0FmqBDBYZBJAf
 N4Oz1kSOryOx/Y6qeqK9amIu5basFr7Z+w/CKx+UmMcPzW7ZxnVlll6zedna56mRHx
 TvcNThySvXb+M8/6JsYeWTxwPfybSd+Mn8n4dfHQ=
From: Vincent Fazio <vfazio@xes-inc.com>
To: buildroot@buildroot.org
Date: Thu,  4 Nov 2021 09:19:10 -0500
Message-Id: <20211104141910.1840914-1-vfazio@xes-inc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
xes-mail-processed: 1
Subject: [Buildroot] [PATCH 1/1] package/nvidia-driver: bump version to
 390.144
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Vincent Fazio <vfazio@xes-inc.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Adds support for Linux kernel 5.11.

Define IGNORE_CC_MISMATCH for kernel module builds to avoid an issue
where NVIDIA's `cc_version_check` in kernel/conftest.sh may falsely
detect a mismatch and fail due to matching on the pkgversion substring
of the GCC version string in the kernel's include/generated/compile.h.

Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>
---
 package/nvidia-driver/nvidia-driver.hash | 4 ++--
 package/nvidia-driver/nvidia-driver.mk   | 3 ++-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/nvidia-driver/nvidia-driver.hash b/package/nvidia-driver/nvidia-driver.hash
index 7f2248d0f9..9e6deb0061 100644
--- a/package/nvidia-driver/nvidia-driver.hash
+++ b/package/nvidia-driver/nvidia-driver.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256 51adb28f0ed4548f35a88a93ad6767ebd807fa14f418bf5e51a6d63a3ff7f275  NVIDIA-Linux-x86-390.132.run
-sha256 b6b4b8af37e78e026c9ebdf4a5c64ea412dfcb710931dd028c22dac228de659d  NVIDIA-Linux-x86_64-390.132-no-compat32.run
+sha256 8bb6e8de89e8f8325466af29cf0fa235c988d19137f7fe3eb6bfae1d5e305e74  NVIDIA-Linux-x86-390.144.run
+sha256 d9b36e51253592d7aeecb9758ebccf30348ab364c88f95aa5ba33c767470949c  NVIDIA-Linux-x86_64-390.144-no-compat32.run
 sha256 bd28b0c5aeeb00eb11d3ec6f6f3449d4b3a40100914258332734a53527997526  LICENSE
diff --git a/package/nvidia-driver/nvidia-driver.mk b/package/nvidia-driver/nvidia-driver.mk
index 54c2aa46d8..5b229725d0 100644
--- a/package/nvidia-driver/nvidia-driver.mk
+++ b/package/nvidia-driver/nvidia-driver.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NVIDIA_DRIVER_VERSION = 390.132
+NVIDIA_DRIVER_VERSION = 390.144
 NVIDIA_DRIVER_SUFFIX = $(if $(BR2_x86_64),_64)
 NVIDIA_DRIVER_SITE = http://download.nvidia.com/XFree86/Linux-x86$(NVIDIA_DRIVER_SUFFIX)/$(NVIDIA_DRIVER_VERSION)
 NVIDIA_DRIVER_SOURCE = NVIDIA-Linux-x86$(NVIDIA_DRIVER_SUFFIX)-$(NVIDIA_DRIVER_VERSION)$(if $(BR2_x86_64),-no-compat32).run
@@ -137,6 +137,7 @@ endif
 # because they don't recognise the usual variables set by the kernel
 # build system. We also need to tell them what modules to build.
 NVIDIA_DRIVER_MODULE_MAKE_OPTS = \
+	IGNORE_CC_MISMATCH=1 \
 	NV_KERNEL_SOURCES="$(LINUX_DIR)" \
 	NV_KERNEL_OUTPUT="$(LINUX_DIR)" \
 	NV_KERNEL_MODULES="$(NVIDIA_DRIVER_MODULES)"
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
