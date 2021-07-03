Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E640EC4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:03:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B1ED36103C
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:03:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B1ED36103C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 885D9423DB;
	Wed,  4 Aug 2021 00:03:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DCGyZ7YNGlle; Wed,  4 Aug 2021 00:03:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B34C6423D7;
	Wed,  4 Aug 2021 00:03:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0B17F1BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:14:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9660240E56
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j6ZtGMaugFoC for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9169A4069F
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id E43B1860D3; Tue,  3 Aug 2021 21:09:58 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 3 Jul 2021 22:57:03 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: e6be873e1dfeb638aa16c75aafeba0a725280f9d
X-Git-Newrev: 547069999170dec4ad9a50d50e73444a7e9e90d2
X-Patchwork-Hint: ignore
Message-Id: <20210803210958.E43B1860D3@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/postgis: bump version
 to 3.1.2
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=547069999170dec4ad9a50d50e73444a7e9e90d2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

PostGIS 3.1.2
2021/05/21

 * Bug Fixes

  - #4871, TopoGeometry::geometry cast returns NULL for empty
           TopoGeometry objects (Sandro Santilli)
  - #4826, postgis_tiger_geocoder Better answers when no zip is provided
           (Regina Obe)
  - #4817, handle more complex compound coordinate dystems (Paul Ramsey)
  - #4842, Only do axis flips on CRS that have a "Lat" as the first column (Paul Ramsey)
  - Support recent Proj versions that have removed pj_get_release (Paul Ramsey)
  - #4835, Adjust tolerance for geodetic calculations (Paul Ramsey)
  - #4840, Improper conversion of negative geographic azimuth to positive (Paul Ramsey)
  - #4853, DBSCAN cluster not formed when recordset length equal to minPoints (Dan Baston)
  - #4863, Update bboxes after scale/affine coordinate changes (Paul Ramsey)
  - #4876, Fix raster issues related to PostgreSQL 14 tablefunc changes
           (Paul Ramsey, Regina Obe)
  - #4877, mingw64 PostGIS / PostgreSQL 14 compile (Regina Obe, Tom Lane)
  - #4838, Update to support Tiger 2020 (Regina Obe)
  - #4890, Change Proj cache lifetime to last as long as connection (Paul Ramsey)
  - #4845, Add Pg14 build support (Paul Ramsey)

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/postgis/postgis.hash | 2 +-
 package/postgis/postgis.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/postgis/postgis.hash b/package/postgis/postgis.hash
index 2f0d62728f..8a8e47ffcc 100644
--- a/package/postgis/postgis.hash
+++ b/package/postgis/postgis.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  0e96afef586db6939d48fb22fbfbc9d0de5e6bc1722d6d553d63bb41441a2a7d  postgis-3.1.1.tar.gz
+sha256  2cdd3760176926704b4eb25ff3357543c9637dee74425a49082906857c7e0732  postgis-3.1.2.tar.gz
 sha256  55b69f22e1752830dd565852dc7ff242daf289dbd3a6bfede5db43f90d2e28c9  LICENSE.TXT
diff --git a/package/postgis/postgis.mk b/package/postgis/postgis.mk
index 442872aea3..a0acf62e05 100644
--- a/package/postgis/postgis.mk
+++ b/package/postgis/postgis.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POSTGIS_VERSION = 3.1.1
+POSTGIS_VERSION = 3.1.2
 POSTGIS_SITE = https://download.osgeo.org/postgis/source
 # parallel build issues
 POSTGIS_MAKE = $(MAKE1)
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
