Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CF65C531C9
	for <buildroot@archiver.kernel.org>; Sun, 26 Jul 2026 22:38:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9528B406EA;
	Sun, 26 Jul 2026 22:38:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aQWcHtTMOy0B; Sun, 26 Jul 2026 22:38:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 168384060A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785105488;
	bh=h+Cc+YwZzHXe5vr0kDs9Cu3WYBkHmEuXcrORYyz92os=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=JquDGOWWGkTGvL7jeQkx4W2lUirK/atSoktwszW6FGWO0aLDHLw6lyhwQbT6u9M8l
	 l3Kqj5lcvS7vG5foOtnM1batwd6tAFimdHMxPY9BI5MgVjfJHHipJRGnVCcaGrVSmx
	 Hr7nJStuMQ5Lo4EvbGVClGd+t/nIzZZ5AB+/IWmEitwDQ87kt1udTrocdCBZyQWWcX
	 inra0/BqMxgw/epb2t3ZFApfIs2F6wxDbj8r0dUVl8D1u1kwaMhu6uqtzZIyV72LKA
	 Umktj/1UaWqeHcy1HMPI9YLauYYEVT1w9pSBW5GJy8ywGy/Xb8HRa988eaVTtYD1PL
	 RRqtWFPfycJzA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 168384060A;
	Sun, 26 Jul 2026 22:38:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 42145357
 for <buildroot@buildroot.org>; Sun, 26 Jul 2026 22:38:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 27ED66060C
 for <buildroot@buildroot.org>; Sun, 26 Jul 2026 22:38:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BrtXiOQGlWne for <buildroot@buildroot.org>;
 Sun, 26 Jul 2026 22:38:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=93.91.132.248;
 helo=mail.gnudd.com; envelope-from=rubini@arcana.gnudd.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 098CA605ED
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 098CA605ED
Received: from mail.gnudd.com (mail.gnudd.com [93.91.132.248])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 098CA605ED
 for <buildroot@buildroot.org>; Sun, 26 Jul 2026 22:38:05 +0000 (UTC)
Received: from rubini by mail.gnudd.com with local (Exim 4.94.2)
 (envelope-from <rubini@arcana.gnudd.com>) id 1wo6sd-0004hj-Ka
 for buildroot@buildroot.org; Sun, 26 Jul 2026 23:59:31 +0200
Date: Sun, 26 Jul 2026 23:59:31 +0200
From: Alessandro Rubini <rubini@gnudd.com>
To: buildroot@buildroot.org
Message-ID: <amaDQ/RxzLn24+me@arcana.i.gnudd.com>
MIME-Version: 1.0
Content-Disposition: inline
Organization: GnuDD, Device Drivers, Embedded Systems, Courses
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=gnudd.com
Subject: [Buildroot] [PATCH] package/opencv: depend on webp mux/demux
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

Without this dependency, autoconfiguration fails:

    CMake Error: The following variables are used in this project,
         but they are set to NOTFOUND.
    Please set them or make sure they are set and tested correctly
         in the CMake files:
    WEBP_DEMUX_LIBRARY
    linked by target "opencv_imgcodecs"
         in directory [...]/build/opencv4-4.13.0/modules/imgcodecs
    WEBP_MUX_LIBRARY
    linked by target "opencv_imgcodecs"
         in directory [...]/build/opencv4-4.13.0/modules/imgcodecs

Signed-off-by: Alessandro Rubini <rubini@gnudd.com>
---
 package/opencv4/Config.in  | 2 ++
 package/opencv4/opencv4.mk | 1 +
 2 files changed, 3 insertions(+)

diff --git a/package/opencv4/Config.in b/package/opencv4/Config.in
index 47c1cf3f4a..856f3e8abd 100644
--- a/package/opencv4/Config.in
+++ b/package/opencv4/Config.in
@@ -7,6 +7,8 @@ menuconfig BR2_PACKAGE_OPENCV4
 	depends on !BR2_STATIC_LIBS # include dlfcn.h
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
 	select BR2_PACKAGE_ZLIB
+	select BR2_PACKAGE_WEBP_DEMUX
+	select BR2_PACKAGE_WEBP_MUX
 	help
 	  OpenCV (Open Source Computer Vision) is a library of
 	  programming functions for real time computer vision.
diff --git a/package/opencv4/opencv4.mk b/package/opencv4/opencv4.mk
index 0e2567eb6f..b08e8a33d4 100644
--- a/package/opencv4/opencv4.mk
+++ b/package/opencv4/opencv4.mk
@@ -261,6 +261,7 @@ OPENCV4_CONF_OPTS += \
 	-DWITH_XINE=OFF
 
 OPENCV4_DEPENDENCIES += host-pkgconf zlib
+OPENCV4_DEPENDENCIES += webp
 
 ifeq ($(BR2_PACKAGE_OPENCV4_CONTRIB),y)
 # OPENCV4 depends on OPENCV4_CONTRIB, and not the other way around.
-- 
2.47.3
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
