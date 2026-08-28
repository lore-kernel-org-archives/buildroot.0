Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1720AC61DB9
	for <buildroot@archiver.kernel.org>; Fri, 28 Aug 2026 20:02:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ADFEA60720;
	Fri, 28 Aug 2026 20:02:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jwu5mSKDa_YX; Fri, 28 Aug 2026 20:02:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787947355;
	bh=1xzKJHL3SnfS3CQPaRK8r/Yn6hipLJoj4dUBu6tAah8=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EnNMk5Jf5Y7DnILOTkgIqEIblxJwXc/9C7c+z2XAL8ZY26mHMMHrW0uUBMwHnVvWZ
	 /h+rDss4FZtAIHcPeS7csN2pa9aOjW0Lou2sfL/njmGtXkupcyShd/wBAZH0mZ06t3
	 4IY/+NSF3Csb8374ibaLhPrTwcHT+1zq2gRtytCKoSa8/ZpEEZFQo6K2OIDBYmk2YN
	 iDCAu5NSwF6bSSDvHANSB5t0ucL90eoMdY/NZXoPj4ZQWdmFeuDsTlgeMBwhWzhLRm
	 fuMyR5zeSHvyEN1OssO/B2fT6oQj6Wvtnvc1nfhFV3kpN91pR4CJ6SZzHRGc8OL/S8
	 lVFl84vEKDZVQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id ADFE9606B6;
	Fri, 28 Aug 2026 20:02:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3B93F23E
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 20:02:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3940C606B6
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 20:02:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F9GVuHCAys3l for <buildroot@buildroot.org>;
 Fri, 28 Aug 2026 20:02:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=93.91.132.248;
 helo=mail.gnudd.com; envelope-from=rubini@arcana.gnudd.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none) header.from=gnudd.com
Received: from mail.gnudd.com (mail.gnudd.com [93.91.132.248])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DAA5160679
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 20:02:31 +0000 (UTC)
Received: from rubini by mail.gnudd.com with local (Exim 4.94.2)
 (envelope-from <rubini@arcana.gnudd.com>)
 id 1x02mS-0002xR-P3; Fri, 28 Aug 2026 22:02:28 +0200
Date: Fri, 28 Aug 2026 22:02:28 +0200
From: Alessandro Rubini <rubini@gnudd.com>
To: thomas.petazzoni@bootlin.com
Cc: buildroot@buildroot.org
Message-ID: <apHpVO5XvrAs52H1@arcana.i.gnudd.com>
MIME-Version: 1.0
Content-Disposition: inline
Organization: GnuDD, Device Drivers, Embedded Systems, Courses
In-Reply-To: <aohHBg5JtecHVORq@windsurf>
References: <aohHBg5JtecHVORq@windsurf>
 <amaDQ/RxzLn24+me@arcana.i.gnudd.com> <aoglkraRzHufPBHQ@windsurf>
 <aognldAvgHC81hyu@windsurf>
Subject: [Buildroot] [PATCH v2] package/opencv: fix a webp dependency
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

When BR2_PACKAGE_OPENCV4_WITH_WEBP=y we need to enable mux and demux
too, otherwise build fails as follows:

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

The issue already exists in 2025.02.x (thanks Thomas for checking),
but not in 2023.08.x whence my defconfig originated.

Signed-off-by: Alessandro Rubini <rubini@gnudd.com>
---

This is v2 of what was called "package/opencv: depend on webp mux/demux",
but as suggested by Thomas the dependency is not uplevel, so this is
fixed according to his suggestions. Tested on current master.

 package/opencv4/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/opencv4/Config.in b/package/opencv4/Config.in
index 47c1cf3f4a..e4a15f742b 100644
--- a/package/opencv4/Config.in
+++ b/package/opencv4/Config.in
@@ -369,6 +369,8 @@ config BR2_PACKAGE_OPENCV4_WITH_V4L
 config BR2_PACKAGE_OPENCV4_WITH_WEBP
 	bool "webp support"
 	select BR2_PACKAGE_WEBP
+	select BR2_PACKAGE_WEBP_DEMUX
+	select BR2_PACKAGE_WEBP_MUX
 	help
 	  Enable WebP support.
 
-- 
2.47.3
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
