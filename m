Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E68E7EE57C2
	for <buildroot@archiver.kernel.org>; Tue, 30 Dec 2025 22:26:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A920B80E1B;
	Tue, 30 Dec 2025 22:26:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id isY8ikA0NXz2; Tue, 30 Dec 2025 22:26:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B8E6280E25
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767133591;
	bh=WEIC9Rp8hSV5IEzZzXMZs0Z1Z1Hjb/D6qQ3RFrN9vqg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=bjJlkPmmf7B3x4Rpigt8a8HBMPFla5KSxpI1S3MLU1j9CnCpwhBsIuuWS5iABqY1c
	 1wxjp1dPCyKbflEQGpVJ+ZeHRecQM7Gpx1V0YgJTRDrAccKgr0TEf9Go+kh1fl9TUk
	 G85/WXiGHlbcCXsS7BTvOTk4lP+3iHLEhCjRk4v7pnLjxOTkNZqtLoe1Tr0089x2VA
	 dJfEMYFhNiAV1xQxX9F4VADSJIAMyn+AM2mjRYoKg3gRf4cYFgBYYKTu2Acnj2o5MK
	 SoDx5Tt7vhKtYcHzGHiFSbkazr0rnU1yRn+xIkT3vB96/juQjAg8ZujN1pn2XSneWX
	 Yt7eWoj3BnCWw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B8E6280E25;
	Tue, 30 Dec 2025 22:26:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id C6D8F277
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 22:26:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B94AC40588
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 22:26:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pJX2hLaxgIAc for <buildroot@buildroot.org>;
 Tue, 30 Dec 2025 22:26:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 153BB4028B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 153BB4028B
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 22:26:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0728D87D4A; Tue, 30 Dec 2025 22:26:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 30 Dec 2025 23:22:28 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1721206b35d6b2b39ce337759674b5ab7123005e
X-Git-Newrev: f591fd3fea63652f7134372656a06ec30ae7ff69
X-Patchwork-Hint: ignore
Message-Id: <20251230222628.0728D87D4A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ffmpeg: drop rpi-userland support
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=f591fd3fea63652f7134372656a06ec30ae7ff69
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As we're about to remove the rpi-userland package, drop support for it
from package/ffmpeg.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/ffmpeg/ffmpeg.mk | 18 ++++--------------
 1 file changed, 4 insertions(+), 14 deletions(-)

diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index 6e4ccd5b8b..7bdf948c80 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -52,7 +52,10 @@ FFMPEG_CONF_OPTS = \
 	--disable-libilbc \
 	--disable-libvo-amrwbenc \
 	--disable-symver \
-	--disable-doc
+	--disable-doc \
+	--disable-mmal \
+	--disable-omx \
+	--disable-omx-rpi
 
 FFMPEG_DEPENDENCIES += host-pkgconf
 
@@ -284,19 +287,6 @@ else
 FFMPEG_CONF_OPTS += --disable-vdpau
 endif
 
-ifeq ($(BR2_PACKAGE_RPI_USERLAND),y)
-FFMPEG_CONF_OPTS += --enable-omx --enable-omx-rpi \
-	--extra-cflags=-I$(STAGING_DIR)/usr/include/IL
-FFMPEG_DEPENDENCIES += rpi-userland
-ifeq ($(BR2_arm),y)
-FFMPEG_CONF_OPTS += --enable-mmal
-else
-FFMPEG_CONF_OPTS += --disable-mmal
-endif
-else
-FFMPEG_CONF_OPTS += --disable-mmal --disable-omx --disable-omx-rpi
-endif
-
 # To avoid a circular dependency only use opencv if opencv itself does
 # not depend on ffmpeg.
 ifeq ($(BR2_PACKAGE_OPENCV4_LIB_IMGPROC)x$(BR2_PACKAGE_OPENCV4_WITH_FFMPEG),yx)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
