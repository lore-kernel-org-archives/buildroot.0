Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1B1DC3601A
	for <buildroot@archiver.kernel.org>; Fri,  4 Apr 2025 16:55:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4ED7541393;
	Fri,  4 Apr 2025 16:55:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VmikPFYRCJlE; Fri,  4 Apr 2025 16:55:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 62F22412C2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 62F22412C2;
	Fri,  4 Apr 2025 16:55:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 29A21117
 for <buildroot@buildroot.org>; Fri,  4 Apr 2025 16:55:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7CE3680B71
 for <buildroot@buildroot.org>; Fri,  4 Apr 2025 16:55:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k_XR87ceItyk for <buildroot@buildroot.org>;
 Fri,  4 Apr 2025 16:55:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=45.157.188.9;
 helo=smtp-bc09.mail.infomaniak.ch; envelope-from=foss+buildroot@0leil.net;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 84F378130E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 84F378130E
Received: from smtp-bc09.mail.infomaniak.ch (smtp-bc09.mail.infomaniak.ch
 [45.157.188.9])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 84F378130E
 for <buildroot@buildroot.org>; Fri,  4 Apr 2025 16:55:12 +0000 (UTC)
Received: from smtp-4-0001.mail.infomaniak.ch (smtp-4-0001.mail.infomaniak.ch
 [10.7.10.108])
 by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4ZTl0X107bzy84;
 Fri,  4 Apr 2025 18:48:12 +0200 (CEST)
Received: from unknown by smtp-4-0001.mail.infomaniak.ch (Postfix) with ESMTPA
 id 4ZTl0W4xkVzjnW; Fri,  4 Apr 2025 18:48:11 +0200 (CEST)
From: Quentin Schulz <foss+buildroot@0leil.net>
Date: Fri, 04 Apr 2025 18:47:38 +0200
MIME-Version: 1.0
Message-Id: <20250404-libcamera-0-5-0-v1-7-e2ca9d029aeb@cherry.de>
References: <20250404-libcamera-0-5-0-v1-0-e2ca9d029aeb@cherry.de>
In-Reply-To: <20250404-libcamera-0-5-0-v1-0-e2ca9d029aeb@cherry.de>
To: buildroot@buildroot.org
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Marcus Folkesson <marcus.folkesson@gmail.com>, 
 Eric Le Bihan <eric.le.bihan.dev@free.fr>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.14.2
X-Infomaniak-Routing: alpha
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=0leil.net
Subject: [Buildroot] [PATCH 7/9] package/libcamera: bump to 0.5.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Quentin Schulz <quentin.schulz@cherry.de>

Release notes:
https://lists.libcamera.org/pipermail/libcamera-devel/2025-April/049672.html

There's now a pipeline for the Raspberry Pi 5 ISP (PiSP), that can be
added later on in a separate patch.

v4l2 compatibility layer is now a feature and not a boolean anymore. The
former takes "enabled", "disabled" or "auto"[1] while the latter takes
"true" or "false"[2] so we need to update how we configure the project to
match those expectations.

[1] https://mesonbuild.com/Build-options.html#features
[2] https://mesonbuild.com/Build-options.html#booleans

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 package/libcamera/libcamera.hash | 2 +-
 package/libcamera/libcamera.mk   | 6 ++----
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/package/libcamera/libcamera.hash b/package/libcamera/libcamera.hash
index 8c845d0e21dce66f8ab3d218cc5a657a3ee7d817..9f897e023f6ca4b292f01ca83df16a53f50c0849 100644
--- a/package/libcamera/libcamera.hash
+++ b/package/libcamera/libcamera.hash
@@ -1,4 +1,4 @@
-sha256  0b45861dc0430074bf10aaa78a69439b319e9df4ed041496fd5f95e546c8f575  libcamera-v0.4.0-git4.tar.gz
+sha256  cea3b5eebc01aa97930ae64989447ca00bad42ff1e0ce71d90d337650dd9e374  libcamera-v0.5.0-git4.tar.gz
 
 # license files
 sha256  fd38b2c053c0cce46d9c5ef3545a6e34d157a240ba99c9b8dca5d37a8147da6c  LICENSES/BSD-2-Clause.txt
diff --git a/package/libcamera/libcamera.mk b/package/libcamera/libcamera.mk
index 449f66ee36b3d5f97780c1bb374a7c2ad9160c0b..d7324240154944e60ec546bf1968e9723b79c041 100644
--- a/package/libcamera/libcamera.mk
+++ b/package/libcamera/libcamera.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBCAMERA_SITE = https://git.linuxtv.org/libcamera.git
-LIBCAMERA_VERSION = v0.4.0
+LIBCAMERA_VERSION = v0.5.0
 LIBCAMERA_SITE_METHOD = git
 LIBCAMERA_DEPENDENCIES = \
 	host-openssl \
@@ -51,9 +51,7 @@ LIBCAMERA_CONF_OPTS += -Dpycamera=enabled
 endif
 
 ifeq ($(BR2_PACKAGE_LIBCAMERA_V4L2),y)
-LIBCAMERA_CONF_OPTS += -Dv4l2=true
-else
-LIBCAMERA_CONF_OPTS += -Dv4l2=false
+LIBCAMERA_CONF_OPTS += -Dv4l2=enabled
 endif
 
 LIBCAMERA_PIPELINES-$(BR2_PACKAGE_LIBCAMERA_PIPELINE_IMX8_ISI) += imx8-isi

-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
