Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED693C43334
	for <buildroot@archiver.kernel.org>; Wed, 29 Jun 2022 18:29:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7092641B4E;
	Wed, 29 Jun 2022 18:29:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7092641B4E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xj5kAHIUgNov; Wed, 29 Jun 2022 18:29:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0F1D0418A5;
	Wed, 29 Jun 2022 18:29:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0F1D0418A5
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F09CF1BF3D0
 for <buildroot@lists.busybox.net>; Wed, 29 Jun 2022 18:29:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D90E983EDA
 for <buildroot@lists.busybox.net>; Wed, 29 Jun 2022 18:29:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D90E983EDA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id quW9P8GeKLxg for <buildroot@lists.busybox.net>;
 Wed, 29 Jun 2022 18:29:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0240283EA6
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0240283EA6
 for <buildroot@buildroot.org>; Wed, 29 Jun 2022 18:29:34 +0000 (UTC)
Received: from submission (posteo.de [185.67.36.169]) 
 by mout02.posteo.de (Postfix) with ESMTPS id 3E00E240109
 for <buildroot@buildroot.org>; Wed, 29 Jun 2022 20:29:32 +0200 (CEST)
Received: from customer (localhost [127.0.0.1])
 by submission (posteo.de) with ESMTPSA id 4LY93b3qRDz6tmW;
 Wed, 29 Jun 2022 20:29:31 +0200 (CEST)
From: Dominik Michael Rauh <dmrauh@posteo.de>
To: buildroot@buildroot.org
Date: Wed, 29 Jun 2022 18:29:23 +0000
Message-Id: <20220629182923.26615-1-dmrauh@posteo.de>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=posteo.de; s=2017; 
 t=1656527372; bh=XFuApMQEGWdV/sGcAIT5MmUYFHvgCMPrJTz+J3akHm0=;
 h=From:To:Cc:Subject:Date:From;
 b=q/y8e3B3okE5eY5DtgJm2AxNMoMA4G2dGfKWtlWVu5D1SCJ8yxy1tvWwf1+f1rZNC
 2AIOa0sEvXoAhwEzUetbtE1/PWSkzIHxIkMKFuhFXSKlg/Jdr99lQQYQgu5uYfO8/w
 L4VANrm3xvxnsugJ24+D9xoWvt1U5sgRRdmjOpV7lfkY9SqsSgcN4UEvLTk44d1x8x
 LSikwgv3CSHS9ZKVDJkheNBGF1qrwyg5mSXbEmtRvGhYov35vKQqGBYGDsp3vKo8Eg
 BZpZ7xbaHn2osMF5aIjEf9E1gX/QYnHI+kb0t7SkrmaduUPNyp+mb6FySrB3ajstts
 DFipjHy7gJ+FA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de
 header.a=rsa-sha256 header.s=2017 header.b=q/y8e3B3
Subject: [Buildroot] [PATCH 1/1] package/uboot-tools: fix info in
 Config.in.host help section
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
Cc: Dominik Michael Rauh <dmrauh@posteo.de>,
 Matt Weber <matthew.weber@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The help section of "BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE_REDUNDANT"
refers to U-Boot configuration option "CONFIG_ENV_SIZE_REDUND" which is
removed since U-Boot v2020.01, so remove this reference.

We may replace this with a reference to "CONFIG_ENV_OFFSET_REDUND" as
another indicator that a redundant environment image should be created.

This also fixes a minor typo in the same file.

Signed-off-by: Dominik Michael Rauh <dmrauh@posteo.de>
---
 package/uboot-tools/Config.in.host | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/uboot-tools/Config.in.host b/package/uboot-tools/Config.in.host
index 431cc8631d..622070405d 100644
--- a/package/uboot-tools/Config.in.host
+++ b/package/uboot-tools/Config.in.host
@@ -45,7 +45,7 @@ config BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE
 	  Generate a valid binary environment image from a text file
 	  describing the key=value pairs of the environment.
 
-	  This option can be useful to build enviornment configurations
+	  This option can be useful to build environment configurations
 	  as part of a Linux / rootfs only defconfig instead of using
 	  post scripts. This supports a hardware use case of a single
 	  bootloader only defconfig but multiple Linux / rootfs
@@ -81,8 +81,8 @@ config BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE_REDUNDANT
 	  Some platforms define in their U-Boot configuration that the
 	  U-Boot environment should be duplicated in two locations (for
 	  extra safety). Check your U-Boot configuration for the
-	  CONFIG_ENV_ADDR_REDUND and CONFIG_ENV_SIZE_REDUND settings to
-	  see if this is the case for your platform.
+	  CONFIG_ENV_ADDR_REDUND and CONFIG_ENV_OFFSET_REDUND settings
+	  to see if this is the case for your platform.
 
 	  If it is the case, then you should enable this option to
 	  ensure that the U-Boot environment image generated by
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
