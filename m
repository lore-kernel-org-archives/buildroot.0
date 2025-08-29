Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51444CA0FFD
	for <buildroot@archiver.kernel.org>; Fri, 29 Aug 2025 06:52:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DD56D614B1;
	Fri, 29 Aug 2025 06:52:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iYq1LttxDiKh; Fri, 29 Aug 2025 06:52:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 248C8614AF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 248C8614AF;
	Fri, 29 Aug 2025 06:52:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 399ED69
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 06:52:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2B045614A3
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 06:52:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qLiD-ZdJj915 for <buildroot@buildroot.org>;
 Fri, 29 Aug 2025 06:52:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5F62A614A6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5F62A614A6
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5F62A614A6
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 06:52:31 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 5847E1A0A08
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 06:52:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 2AA38606B9
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 06:52:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 01AA21C22D894; 
 Fri, 29 Aug 2025 08:52:20 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 29 Aug 2025 08:52:09 +0200
Message-ID: <20250829065210.570613-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1756450348; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=Fj0rC1fpgmAv4BqOsW2rO2kPvLTSPXBh4i6wqGD2BpE=;
 b=r2dtQDB4y+GyvtMAjKw1m/F+gRgIMEPpY/PMCKim9TaGawubxWltl6ThgMx8dmOFup85al
 j8wt2ZNsjOUL09ZPMI0YXlyK/AfrxvXe8QsqnQGb41oGK7+gEHKTgCaXbEWLbEHpOwz1gQ
 Wryrpkf62N7FnFn+abc0BNq3bGWd+tSRED18MmHtFcJJxyd9FApfzgCGVv9/k+b4WbR6lp
 WlRbZzHEXHMqQriFq6fU61JvI1fH110Lqk0re/pj0DbOBy9PUjr/RdGjUpTIr74h6Uvpzr
 XLOM/WQAzaVyVJKuSNCC+VBS3s0R2nFWtevA72DZDNzZUOFUl1UoQVgCbLLCEg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=r2dtQDB4
Subject: [Buildroot] [PATCH] package/webrtc-audio-processing: fix build with
 GCC 15.x
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

A missing include causes a build failure with GCC 15.x. There are no
known autobuilder failures for this issue, but the following defconfig
allows to reproduce the issue:

 BR2_arm=y
 BR2_cortex_a9=y
 BR2_ARM_ENABLE_VFP=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
 BR2_INIT_NONE=y
 BR2_SYSTEM_BIN_SH_NONE=y
 # BR2_PACKAGE_BUSYBOX is not set
 BR2_PACKAGE_WEBRTC_AUDIO_PROCESSING=y
 # BR2_TARGET_ROOTFS_TAR is not set

The affected code has completely changed in newer versions of
webrtc-audio-processing, so we add a non-upstream patch, which can be
dropped once we upgrade to a newer release.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...queue-task_queue_base.h-include-cstd.patch | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 package/webrtc-audio-processing/0001-webrtc-api-task_queue-task_queue_base.h-include-cstd.patch

diff --git a/package/webrtc-audio-processing/0001-webrtc-api-task_queue-task_queue_base.h-include-cstd.patch b/package/webrtc-audio-processing/0001-webrtc-api-task_queue-task_queue_base.h-include-cstd.patch
new file mode 100644
index 0000000000..db253d1dd8
--- /dev/null
+++ b/package/webrtc-audio-processing/0001-webrtc-api-task_queue-task_queue_base.h-include-cstd.patch
@@ -0,0 +1,29 @@
+From 9b59846b4f9a723743532f26c344d84084b7af96 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Fri, 29 Aug 2025 07:31:50 +0200
+Subject: [PATCH] webrtc/api/task_queue/task_queue_base.h: include <cstdint>
+ for uint32_t
+
+This is needed since GCC 15.x.
+
+Upstream: not applicable, code has completely changed in latest versions
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ webrtc/api/task_queue/task_queue_base.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/webrtc/api/task_queue/task_queue_base.h b/webrtc/api/task_queue/task_queue_base.h
+index 90b1efd..7403ee9 100644
+--- a/webrtc/api/task_queue/task_queue_base.h
++++ b/webrtc/api/task_queue/task_queue_base.h
+@@ -11,6 +11,7 @@
+ #define API_TASK_QUEUE_TASK_QUEUE_BASE_H_
+ 
+ #include <memory>
++#include <cstdint>
+ 
+ #include "api/task_queue/queued_task.h"
+ #include "rtc_base/system/rtc_export.h"
+-- 
+2.50.1
+
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
