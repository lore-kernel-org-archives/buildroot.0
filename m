Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7DC7C32771
	for <buildroot@archiver.kernel.org>; Mon, 26 Sep 2022 18:46:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 699FC82E95;
	Mon, 26 Sep 2022 18:46:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 699FC82E95
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Um2C76K2hGnV; Mon, 26 Sep 2022 18:46:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6044682B93;
	Mon, 26 Sep 2022 18:46:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6044682B93
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BBD8E1BF2F5
 for <buildroot@lists.busybox.net>; Mon, 26 Sep 2022 18:46:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 95F0D82B93
 for <buildroot@lists.busybox.net>; Mon, 26 Sep 2022 18:46:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 95F0D82B93
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gxTpqPs8tNdK for <buildroot@lists.busybox.net>;
 Mon, 26 Sep 2022 18:46:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 300F78291A
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 300F78291A
 for <buildroot@buildroot.org>; Mon, 26 Sep 2022 18:46:36 +0000 (UTC)
Received: from submission (posteo.de [185.67.36.169]) 
 by mout01.posteo.de (Postfix) with ESMTPS id 06FA5240026
 for <buildroot@buildroot.org>; Mon, 26 Sep 2022 20:46:34 +0200 (CEST)
Received: from customer (localhost [127.0.0.1])
 by submission (posteo.de) with ESMTPSA id 4MbsD84Ngqz6tmK;
 Mon, 26 Sep 2022 20:46:32 +0200 (CEST)
From: Dominik Michael Rauh <dmrauh@posteo.de>
To: buildroot@buildroot.org
Date: Mon, 26 Sep 2022 18:46:21 +0000
Message-Id: <20220926184621.300230-1-dmrauh@posteo.de>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=posteo.de; s=2017; 
 t=1664217994; bh=vfvCLVan5HPYSD2BynBG6J2yILA5RGpcfX/rTgF90I8=;
 h=From:To:Cc:Subject:Date:From;
 b=PVqqXZt8jA8TZNBC4vIVY+E6QQfXFb8rYTaqnQq+YetApzinM77F+WauGkbZVmPV0
 ygZ6s6La7qLhl8/KASR2qBcg0MQQwjOyXl4dKO+0bwJhcZGcupwS1j1pWjEJScS0SM
 C9hDc/EoKJ5rfQFH0ppuvSHCZDENbH4rnVbLh3ezQ04N151V5/CZzcLQsdPBIVh2Kg
 I5Z6whUtEq26s2L44NItakMWD+QrnzFTOL5f+IRrmx4eyzfFwXzkXVI5Nr60lHaYzo
 kvAmkDx6IUT0dIlDeM9oaTbwxFd9OiJGT1Eud1A1o6aWhIXfw4Pk9/9HNadfo6QRcQ
 pw3V2QIgAJ0ZQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de
 header.a=rsa-sha256 header.s=2017 header.b=PVqqXZt8
Subject: [Buildroot] [PATCH v1] package/gdal: bump version to 5.1.2
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
Cc: Dominik Michael Rauh <dmrauh@posteo.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Dominik Michael Rauh <dmrauh@posteo.de>
---
 package/gdal/gdal.hash | 6 +++---
 package/gdal/gdal.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/gdal/gdal.hash b/package/gdal/gdal.hash
index 826a7f0b45..ab77d7840d 100644
--- a/package/gdal/gdal.hash
+++ b/package/gdal/gdal.hash
@@ -1,6 +1,6 @@
-# md5 from: https://download.osgeo.org/gdal/3.5.1/gdal-3.5.1.tar.xz.md5, sha256 locally computed:
-md5  4b7981efbeed69c06c79fb65d0a60d83  gdal-3.5.1.tar.xz
-sha256  d12c30a9eacdeaab493c0d1c9f88eb337c9cbb5bb40744c751bdd5a5af166ab6  gdal-3.5.1.tar.xz
+# md5 from: https://download.osgeo.org/gdal/3.5.2/gdal-3.5.2.tar.xz.md5, sha256 locally computed:
+md5  821b3b0637ebada5d20dbefb2e3ec964  gdal-3.5.2.tar.xz
+sha256  0874dfdeb9ac42e53c37be4184b19350be76f0530e1f4fa8004361635b9030c2  gdal-3.5.2.tar.xz
 
 # Hashes of license files:
 sha256  fac0116e799ca4de79b076ee04863b5e2b69541ea3664b9bb108c81a5355f16a  LICENSE.TXT
diff --git a/package/gdal/gdal.mk b/package/gdal/gdal.mk
index 33e7ba724a..04632e51e1 100644
--- a/package/gdal/gdal.mk
+++ b/package/gdal/gdal.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GDAL_VERSION = 3.5.1
+GDAL_VERSION = 3.5.2
 GDAL_SITE = https://download.osgeo.org/gdal/$(GDAL_VERSION)
 GDAL_SOURCE = gdal-$(GDAL_VERSION).tar.xz
 GDAL_LICENSE = MIT, many others
-- 
2.37.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
