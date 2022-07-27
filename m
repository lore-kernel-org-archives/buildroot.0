Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CAAFC04A68
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 14:47:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D2CD760D89;
	Wed, 27 Jul 2022 14:47:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D2CD760D89
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fOw5QXK7Weqh; Wed, 27 Jul 2022 14:47:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F212360AEB;
	Wed, 27 Jul 2022 14:47:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F212360AEB
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D7C181BF9D1
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 14:46:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B17884013D
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 14:46:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B17884013D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XYZryZm7eB98 for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 14:46:12 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E64234013E
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 14:46:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E64234013E
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id BAB5286694; Wed, 27 Jul 2022 14:32:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 27 Jul 2022 16:44:11 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d4ab37a333f9b84db5c975342234e953d986a6b4
X-Git-Newrev: 0ddd20eef875ac05c11b1132625b8ef0c991fc75
X-Patchwork-Hint: ignore
Message-Id: <20220727143225.BAB5286694@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gdal: add GDAL_CPE_ID_VENDOR
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=0ddd20eef875ac05c11b1132625b8ef0c991fc75
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:osgeo:gdal is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aosgeo%3Agdal

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gdal/gdal.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/gdal/gdal.mk b/package/gdal/gdal.mk
index 0d42037ad6..c75b7743ce 100644
--- a/package/gdal/gdal.mk
+++ b/package/gdal/gdal.mk
@@ -9,6 +9,7 @@ GDAL_SITE = https://download.osgeo.org/gdal/$(GDAL_VERSION)
 GDAL_SOURCE = gdal-$(GDAL_VERSION).tar.xz
 GDAL_LICENSE = MIT, many others
 GDAL_LICENSE_FILES = LICENSE.TXT
+GDAL_CPE_ID_VENDOR = osgeo
 GDAL_INSTALL_STAGING = YES
 GDAL_CONFIG_SCRIPTS = gdal-config
 # gdal at its core only needs host-pkgconf, libgeotiff, proj and tiff
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
