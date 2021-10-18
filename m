Return-Path: <SRS0=Qe4W=PG=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BAADC433EF
	for <buildroot@archiver.kernel.org>; Mon, 18 Oct 2021 21:40:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B1EF86112D
	for <buildroot@archiver.kernel.org>; Mon, 18 Oct 2021 21:40:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B1EF86112D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=buildroot.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4D58182726;
	Mon, 18 Oct 2021 21:40:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eMuH3DoI-maN; Mon, 18 Oct 2021 21:40:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CB6FA82503;
	Mon, 18 Oct 2021 21:40:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 318CE1BF36A
 for <buildroot@lists.busybox.net>; Mon, 18 Oct 2021 21:40:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2158760787
 for <buildroot@lists.busybox.net>; Mon, 18 Oct 2021 21:40:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id C5aK4St7YXCW for <buildroot@lists.busybox.net>;
 Mon, 18 Oct 2021 21:40:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from ch3vs05.rockwellcollins.com (ch3vs05.rockwellcollins.com
 [205.175.226.130])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AF65060779
 for <buildroot@buildroot.org>; Mon, 18 Oct 2021 21:40:16 +0000 (UTC)
IronPort-SDR: 5Axr/sRvstR5ZlPs6nfGAYRZ/uZfccitFCk55sk5o2esXBC5MopaA/dfSVbPwPPvI+egsg2aIS
 xA5ag4nokzEoYq3L4IhG/2Sk0Woe38nbwThIZHTPJrBrjn3VdLhtbE3DaSlYKS37I/tPtNCpWm
 imgJtIy09D73JQ/28OVc1zYlpspIKEU7mtoJNbfgijxrbNv/ihGGPfURMvrezrhZMusdqm8VJ4
 hA4VvvnHb41RT+01xuc+WkgqKAQzeU5p6UELu5gp6pCBsFNcHDpnku5qPzQyhiPK4kEw2wjoAy
 gpY=
Received: from ofwch3n02.rockwellcollins.com (HELO
 dtulimr01.rockwellcollins.com) ([205.175.226.14])
 by ch3vs05.rockwellcollins.com with ESMTP; 18 Oct 2021 16:40:16 -0500
X-Received: from biscuits.rockwellcollins.com (biscuits.rockwellcollins.lab
 [10.148.119.137])
 by dtulimr01.rockwellcollins.com (Postfix) with ESMTP id 6824560348;
 Mon, 18 Oct 2021 16:40:15 -0500 (CDT)
To: buildroot@buildroot.org
Date: Mon, 18 Oct 2021 16:40:13 -0500
Message-Id: <20211018214014.1202-1-matthew.weber@collins.com>
X-Mailer: git-send-email 2.17.1
Subject: [Buildroot] [PATCH 1/2] package/lightning: add
 LIGHTNING_CPE_ID_VENDOR
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
From: Matthew Weber via buildroot <buildroot@buildroot.org>
Reply-To: Matthew Weber <matthew.weber@collins.com>
Cc: Matthew Weber <matthew.weber@collins.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

cpe:2.3:a:gnu:lightning:*:*:*:*:*:*:*:* is a valid CPE for this pkg

https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Agnu%3Alightning

Signed-off-by: Matthew Weber <matthew.weber@collins.com>
---
 package/lightning/lightning.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/lightning/lightning.mk b/package/lightning/lightning.mk
index 38b132e082..c0036e5cd1 100644
--- a/package/lightning/lightning.mk
+++ b/package/lightning/lightning.mk
@@ -9,6 +9,7 @@ LIGHTNING_SITE = $(BR2_GNU_MIRROR)/lightning
 LIGHTNING_LICENSE = LGPL-3.0+
 LIGHTNING_LICENSE_FILES = COPYING.LESSER
 LIGHTNING_INSTALL_STAGING = YES
+LIGHTNING_CPE_ID_VENDOR = gnu
 # We're patching include/Makefile.am
 LIGHTNING_AUTORECONF = YES
 
-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
