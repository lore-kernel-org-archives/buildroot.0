Return-Path: <SRS0=aU6e=NK=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20928C4338F
	for <buildroot@archiver.kernel.org>; Thu, 19 Aug 2021 14:33:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AE310610FA
	for <buildroot@archiver.kernel.org>; Thu, 19 Aug 2021 14:33:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AE310610FA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=busybox.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6110B6139A;
	Thu, 19 Aug 2021 14:33:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BrYqNayOyghg; Thu, 19 Aug 2021 14:33:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C5420613A0;
	Thu, 19 Aug 2021 14:33:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2AFF01BF42D
 for <buildroot@lists.busybox.net>; Thu, 19 Aug 2021 14:33:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1298480F5E
 for <buildroot@lists.busybox.net>; Thu, 19 Aug 2021 14:33:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jZqrJlq8Q0pL for <buildroot@lists.busybox.net>;
 Thu, 19 Aug 2021 14:33:08 +0000 (UTC)
X-Greylist: delayed 00:07:08 by SQLgrey-1.8.0
Received: from ch3vs04.rockwellcollins.com (ch3vs04.rockwellcollins.com
 [205.175.226.52])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 78FD181069
 for <buildroot@buildroot.org>; Thu, 19 Aug 2021 14:33:08 +0000 (UTC)
IronPort-SDR: FYs87xgDpIu5tst4ZFlzUYdfqndB5YnI7BLRy2K+BsNw7BGGRCB5uV9JW/cNWFO8exS8ayUWG4
 zCEPFFXKRJJqB/CUYtPtleyXG7JLNJg4Uo8k9CeGIdyfgDfvK8UAh031pws5eM7O2kjGBYysti
 cobO0bcC9E2rXPk4NOHdWMKGEfxUsebRHlewEU1UKmvPdft2YHfw+ezcppHg6vV7AK8pSERVjd
 JJumeDoCz9Lfawl6FTcD/LBvzpKiaqo7npZGEwA8m57MTuI194Fvfahj8YxJMuCqhIB3dS8/Lc
 GDU=
Received: from ofwch3n02.rockwellcollins.com (HELO
 crulimr02.rockwellcollins.com) ([205.175.226.14])
 by ch3vs04.rockwellcollins.com with ESMTP; 19 Aug 2021 09:26:00 -0500
X-Received: from biscuits.rockwellcollins.com (biscuits.rockwellcollins.lab
 [10.148.119.137])
 by crulimr02.rockwellcollins.com (Postfix) with ESMTP id 9BC086029B;
 Thu, 19 Aug 2021 09:25:59 -0500 (CDT)
To: buildroot@buildroot.org
Date: Thu, 19 Aug 2021 09:25:58 -0500
Message-Id: <20210819142558.10417-1-matthew.weber@collins.com>
X-Mailer: git-send-email 2.17.1
Subject: [Buildroot] [PATCH] package/eigen: override Fortran path
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
From: Matthew Weber via buildroot <buildroot@busybox.net>
Reply-To: Matthew Weber <matthew.weber@collins.com>
Cc: Matthew Weber <matthew.weber@collins.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

The language detection is falling back to the host system
Fortran compiler. An example of this is in RHEL7.9
(gcc4.8.5 20150623 (Red Hat 4.8.5-44)).

This patch bypasses detection and points to the location
where the compiler would be installed (if present). In the
cases where it doesn't exist, the detection falls through
and leaves Fortran disabled.

Fixes:
http://autobuild.buildroot.net/results/8354da225d1e5e337aa7ea62a7e6524fb5f1135f/

Signed-off-by: Matthew Weber <matthew.weber@collins.com>
---
 package/eigen/eigen.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/eigen/eigen.mk b/package/eigen/eigen.mk
index c9998da357..5c726c9d71 100644
--- a/package/eigen/eigen.mk
+++ b/package/eigen/eigen.mk
@@ -15,6 +15,7 @@ EIGEN_SUPPORTS_IN_SOURCE_BUILD = NO
 
 # Default Eigen CMake installs .pc file in /usr/share/pkgconfig
 # change it to /usr/lib/pkgconfig, to be consistent with other packages.
-EIGEN_CONF_OPTS = -DPKGCONFIG_INSTALL_DIR=/usr/lib/pkgconfig
+EIGEN_CONF_OPTS = -DPKGCONFIG_INSTALL_DIR=/usr/lib/pkgconfig \
+	-DCMAKE_Fortran_COMPILER=${TARGET_FC}
 
 $(eval $(cmake-package))
-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
