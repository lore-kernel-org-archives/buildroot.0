Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAC49C369CF
	for <buildroot@archiver.kernel.org>; Sat, 19 Apr 2025 20:25:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9D7DE406C3;
	Sat, 19 Apr 2025 20:25:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8MYFFIpcYr5u; Sat, 19 Apr 2025 20:25:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D0F02406C4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D0F02406C4;
	Sat, 19 Apr 2025 20:25:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1220168
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 20:25:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AD9EA4024E
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 20:25:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m-3pMsmpLZov for <buildroot@buildroot.org>;
 Sat, 19 Apr 2025 20:25:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E8D774025C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E8D774025C
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 20:25:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DFE9A85CB4; Sat, 19 Apr 2025 20:25:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 19 Apr 2025 22:21:47 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3913cebc51f547fed924f51d1df2999696d71122
X-Git-Newrev: 45087a0188d8b50ac888d5f2b728090ccb8c8806
X-Patchwork-Hint: ignore
Message-Id: <20250419202542.DFE9A85CB4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libcamera: bump to 0.5.0
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=45087a0188d8b50ac888d5f2b728090ccb8c8806
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libcamera/libcamera.hash | 2 +-
 package/libcamera/libcamera.mk   | 6 ++----
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/package/libcamera/libcamera.hash b/package/libcamera/libcamera.hash
index 8c845d0e21..9f897e023f 100644
--- a/package/libcamera/libcamera.hash
+++ b/package/libcamera/libcamera.hash
@@ -1,4 +1,4 @@
-sha256  0b45861dc0430074bf10aaa78a69439b319e9df4ed041496fd5f95e546c8f575  libcamera-v0.4.0-git4.tar.gz
+sha256  cea3b5eebc01aa97930ae64989447ca00bad42ff1e0ce71d90d337650dd9e374  libcamera-v0.5.0-git4.tar.gz
 
 # license files
 sha256  fd38b2c053c0cce46d9c5ef3545a6e34d157a240ba99c9b8dca5d37a8147da6c  LICENSES/BSD-2-Clause.txt
diff --git a/package/libcamera/libcamera.mk b/package/libcamera/libcamera.mk
index 449f66ee36..d732424015 100644
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
