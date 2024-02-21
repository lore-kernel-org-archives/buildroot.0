Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C6BFC48BEB
	for <buildroot@archiver.kernel.org>; Wed, 21 Feb 2024 21:40:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EFD1760FB2;
	Wed, 21 Feb 2024 21:40:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AsjiCfYvw4IE; Wed, 21 Feb 2024 21:40:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5432460F8F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5432460F8F;
	Wed, 21 Feb 2024 21:40:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 738D41BF36F
 for <buildroot@lists.busybox.net>; Wed, 21 Feb 2024 21:40:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6D037417C2
 for <buildroot@lists.busybox.net>; Wed, 21 Feb 2024 21:40:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eyiOg2jeRV_C for <buildroot@lists.busybox.net>;
 Wed, 21 Feb 2024 21:40:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.158.101;
 helo=smtpcmd02101.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E3CA6417C0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E3CA6417C0
Received: from smtpcmd02101.aruba.it (smtpcmd02101.aruba.it [62.149.158.101])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E3CA6417C0
 for <buildroot@buildroot.org>; Wed, 21 Feb 2024 21:40:11 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id cuJyrqwWLMMFBcuK0rhA4j; Wed, 21 Feb 2024 22:40:08 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Wed, 21 Feb 2024 22:39:59 +0100
Message-Id: <20240221214005.176433-4-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240221214005.176433-1-giulio.benetti@benettiengineering.com>
References: <20240218230524.639348e6@windsurf>
 <20240221214005.176433-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfA9nR1WS2EwIZmnbW1Nz4nHERlHukgHpHYgn4wyUcbSAi0tKr+mKCzLfB1Y8e9ZwA9e+7HgWdCO0QSizNnj/EZI+SaGw+BXpW9CQtkl404Pg4Jj417l9
 hXIKDmZqFOZw6s45bCV1hU7rDigZ2K4Pgcdy0uooMnJmnScyuFrrAjX7B+yxwYX5ynXvmYAh+rYUDcB1G3u1NJKPO+oKKxkt94s6cTlpvSG/O3cfYolhPJT3
 UNxu65U3HDT6tDPP1ni9Fn/LnVWbhC0FHOm1w954yCCjZMSiJlD5TeUAm7kiSu4BAUFcet5H0S4EeMqCgPkcergZueVFiEmK+lUP+1HHUL8tUN6+I0Evp3MY
 SBj/O31WkQZkNW948ZIhNXvmWpJg2qy7C0wM5T9Idd0lCaxV4rljVUGBA9KxH8SZk3EZMzvdr7Fw/fZIT7sYtx4WACj18t4TprxJE3AODMUmKtsUB45e0am6
 B2ENPUfv298CzOSevMo4k04UlFLLetsQyJJA6dSPfSttBetOPqP1CQiZo/X72KAOC/2E/X7oXCC86AV4HUd6W+79uuLMABsERAXpJhn5bmXdZXJ0ubneyKes
 y8gBZOre8iehIkNg8yRW/naJTWbTawnXtF9mYlgQvBt7M//CqNPv1vxAx/5yL7kL1bM=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1708551608; bh=vuH5P5kObOUZenHpMpMEc7A8cCqj7u5Xp4UsUUEwlNM=;
 h=From:To:Subject:Date:MIME-Version;
 b=Qfj9GZjc7mmZlRYbKcKwG4ErQg+uRfrCxA7ZB925NgNDZYv3NCBTsEukeo3I/JbLo
 g4qGN11KXyA/31FgsSqX2HNYSD0jIt+oSGjkoMRO4Fr7UPS+5CXJJY2lCd6OhIDc4K
 owLGCiEgzVcKHx4GwvFS2duvgPR3wf7roHyGBPxIE0Me6JonJqDEIly8d2Rcm35cSv
 HFx8ZJvQwY5maPYZ+Y/SBQW5ygqqj3luED3E+fLcBdv1B02X3xmhL5qhGI+NilrgAX
 2hT56/Ka2kvQXtVKyJI8F4tJ5U+s8dPFDkbYYdcYDzriovEO9naaI63dyvIWyjBsP5
 NIN1e2JqTZG+w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=Qfj9GZjc
Subject: [Buildroot] [PATCH v2 3/9] package/gdal: drop nios2 binutils bug
 27597 dependency
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
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>,
 Pierre Ducroquet <pinaraf@pinaraf.info>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Dominik Michael Rauh <dmrauh@posteo.de>, Maxim Kochetkov <fido_max@inbox.ru>,
 Vincent Fazio <vfazio@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Now that binutils patch has been backported to every Buildroot binutils
version we can drop nios2 binutils bug 27597 dependency.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Reviewed-by: Maxim Kochetkov <fido_max@inbox.ru>
---
 package/gdal/Config.in | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/package/gdal/Config.in b/package/gdal/Config.in
index 24a1f06af2..839a1bd7ea 100644
--- a/package/gdal/Config.in
+++ b/package/gdal/Config.in
@@ -5,7 +5,6 @@ config BR2_PACKAGE_GDAL
 	# configure can't find proj, when linking statically
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # C++11, proj
-	depends on !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_27597
 	depends on BR2_TOOLCHAIN_HAS_THREADS # proj
 	depends on BR2_USE_WCHAR # proj
 	select BR2_PACKAGE_GIFLIB
@@ -26,9 +25,8 @@ config BR2_PACKAGE_GDAL
 
 	  https://gdal.org/
 
-comment "gdal needs a toolchain w/ C++, dynamic library, gcc >= 4.7, not binutils bug 27597, threads, wchar"
+comment "gdal needs a toolchain w/ C++, dynamic library, gcc >= 4.7, threads, wchar"
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 || \
-		BR2_TOOLCHAIN_HAS_BINUTILS_BUG_27597 || \
 		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
