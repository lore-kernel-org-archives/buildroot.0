Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FD37CA0EFA
	for <buildroot@archiver.kernel.org>; Sat, 23 Aug 2025 20:45:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3AE2941506;
	Sat, 23 Aug 2025 20:45:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Cm3l74tyDtqR; Sat, 23 Aug 2025 20:45:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4FD4B41706
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4FD4B41706;
	Sat, 23 Aug 2025 20:45:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4060019C
 for <buildroot@buildroot.org>; Sat, 23 Aug 2025 20:45:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 261F9834F2
 for <buildroot@buildroot.org>; Sat, 23 Aug 2025 20:45:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b2cgLF-AEMnN for <buildroot@buildroot.org>;
 Sat, 23 Aug 2025 20:45:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 30DD582718
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 30DD582718
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 30DD582718
 for <buildroot@buildroot.org>; Sat, 23 Aug 2025 20:45:02 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 346A4C8EC78;
 Sat, 23 Aug 2025 20:44:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 1407B606A7;
 Sat, 23 Aug 2025 20:45:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 4FAC11C228A3B; 
 Sat, 23 Aug 2025 22:44:57 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>
Date: Sat, 23 Aug 2025 22:44:55 +0200
Message-ID: <20250823204455.258595-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1755981898; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=v+l+rXsp1qhYXcoDU7nfPuBRP9/v35zhA1KepSaXA7k=;
 b=QNTQC79wqV4zKjrVv3szOsZlwh8roUDUdiKPi7sIr1S4ciRqp78oBE5ziKFExsTBEg6BeX
 7ngvkYtvbfzTji5jUzW6CblSGkVULIHo1FaKFiAUGzunccpkL68Jg2+9L7cU8GRy1CDyYX
 L+ASpw2LeXJN555inq/7TqaWGZQh2+2XebAX3PT875tO5NEXfCfewqbWwOt1d+xqU67dzz
 WOGeU0yQN7EqaVcH8pFm0JnhOyzky5dt/cLsHEvi/Hfq5MKYqVUURrqWS15raWlrvfPkbK
 toBQMlVdKroXHuw6hdRnJ/3W6EKMPj5Fnu/qhEEUew10YS9xqIMnauXPMlGCyQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=QNTQC79w
Subject: [Buildroot] [PATCH] package/rpi-userland: fix build with GCC 15.x
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The following defconfig:

 BR2_arm=y
 BR2_cortex_a9=y
 BR2_ARM_ENABLE_VFP=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
 BR2_INIT_NONE=y
 BR2_SYSTEM_BIN_SH_NONE=y
 # BR2_PACKAGE_BUSYBOX is not set
 BR2_PACKAGE_RPI_USERLAND=y
 # BR2_TARGET_ROOTFS_TAR is not set

will fail to build due to two issues in various part of rpi-userland
making GCC 15.x unhappy.

Patch 0008-Fix-conflicting-types-build-error.patch is taken from a
pull request already submitted by a contributor to the upstream
project.

Patch 0009-Fix-raspicommonsettings_parse_cmdline.patch is backported
from upstream, and can be dropped next time we bump rpi-userland.

Note that there are no autobuilder failures for this issue.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...08-Fix-conflicting-types-build-error.patch | 41 +++++++++++++++++++
 ...ix-raspicommonsettings_parse_cmdline.patch | 28 +++++++++++++
 2 files changed, 69 insertions(+)
 create mode 100644 package/rpi-userland/0008-Fix-conflicting-types-build-error.patch
 create mode 100644 package/rpi-userland/0009-Fix-raspicommonsettings_parse_cmdline.patch

diff --git a/package/rpi-userland/0008-Fix-conflicting-types-build-error.patch b/package/rpi-userland/0008-Fix-conflicting-types-build-error.patch
new file mode 100644
index 0000000000..349ef2027e
--- /dev/null
+++ b/package/rpi-userland/0008-Fix-conflicting-types-build-error.patch
@@ -0,0 +1,41 @@
+From c2337c83c627dd94f9b673361dca6ffafca7f59b Mon Sep 17 00:00:00 2001
+From: Jonas Kvinge <jonas@jkvinge.net>
+Date: Sun, 6 Jul 2025 20:21:00 +0200
+Subject: [PATCH] Fix conflicting types build error
+
+Upstream: https://github.com/raspberrypi/userland/pull/744
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ interface/vchiq_arm/vchiq_lib.c       | 2 +-
+ interface/vmcs_host/vc_vchi_gpuserv.h | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/interface/vchiq_arm/vchiq_lib.c b/interface/vchiq_arm/vchiq_lib.c
+index 133d5ca..7a2dae5 100755
+--- a/interface/vchiq_arm/vchiq_lib.c
++++ b/interface/vchiq_arm/vchiq_lib.c
+@@ -537,7 +537,7 @@ vchiq_bulk_receive_handle(VCHIQ_SERVICE_HANDLE_T handle,
+    int size,
+    void *userdata,
+    VCHIQ_BULK_MODE_T mode,
+-   int (*copy_pagelist)())
++   int (*copy_pagelist)(char *vcptr, const struct pagelist_struct *pagelist))
+ {
+    VCHIQ_SERVICE_T *service = find_service_by_handle(handle);
+    VCHIQ_QUEUE_BULK_TRANSFER_T args;
+diff --git a/interface/vmcs_host/vc_vchi_gpuserv.h b/interface/vmcs_host/vc_vchi_gpuserv.h
+index fc0bfee..ce6cb58 100755
+--- a/interface/vmcs_host/vc_vchi_gpuserv.h
++++ b/interface/vmcs_host/vc_vchi_gpuserv.h
+@@ -58,7 +58,7 @@ struct sync_job_s {
+ 
+ struct gpu_callback_s {
+   // callback to call when complete (can be NULL)
+-  void (*func)();
++  void (*func)(void*);
+   void *cookie;
+ };
+ 
+-- 
+2.50.1
+
diff --git a/package/rpi-userland/0009-Fix-raspicommonsettings_parse_cmdline.patch b/package/rpi-userland/0009-Fix-raspicommonsettings_parse_cmdline.patch
new file mode 100644
index 0000000000..df11d591fc
--- /dev/null
+++ b/package/rpi-userland/0009-Fix-raspicommonsettings_parse_cmdline.patch
@@ -0,0 +1,28 @@
+From cf6d0ac0d31fcc2e64c83b8105b078e792f2d441 Mon Sep 17 00:00:00 2001
+From: Krawlow <mglarecerca@gmail.com>
+Date: Wed, 23 Mar 2022 16:46:18 +0100
+Subject: [PATCH] Fix raspicommonsettings_parse_cmdline
+
+Fix raspicommonsettings_parse_cmdline's definition to match declaration
+
+Upstream: c4fd1b8986c6d6d4ae5cd51e65a8bbeb495dfa4e
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ host_applications/linux/apps/raspicam/RaspiCommonSettings.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/host_applications/linux/apps/raspicam/RaspiCommonSettings.h b/host_applications/linux/apps/raspicam/RaspiCommonSettings.h
+index 75b2937..2e9de7d 100644
+--- a/host_applications/linux/apps/raspicam/RaspiCommonSettings.h
++++ b/host_applications/linux/apps/raspicam/RaspiCommonSettings.h
+@@ -54,6 +54,6 @@ typedef struct
+ void raspicommonsettings_set_defaults(RASPICOMMONSETTINGS_PARAMETERS *);
+ void raspicommonsettings_dump_parameters(RASPICOMMONSETTINGS_PARAMETERS *);
+ void raspicommonsettings_display_help();
+-int raspicommonsettings_parse_cmdline(RASPICOMMONSETTINGS_PARAMETERS *state, const char *arg1, const char *arg2, void (*app_help)());
++int raspicommonsettings_parse_cmdline(RASPICOMMONSETTINGS_PARAMETERS *state, const char *arg1, const char *arg2, void (*app_help)(char*));
+ 
+ #endif
+-- 
+2.50.1
+
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
