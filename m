Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB006C47074
	for <buildroot@archiver.kernel.org>; Thu,  4 Jan 2024 21:28:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8506F61B26;
	Thu,  4 Jan 2024 21:28:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8506F61B26
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c3jxS70-kAgk; Thu,  4 Jan 2024 21:28:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EA8AC615F8;
	Thu,  4 Jan 2024 21:28:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EA8AC615F8
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 064931BF414
 for <buildroot@lists.busybox.net>; Thu,  4 Jan 2024 21:27:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1283B40089
 for <buildroot@lists.busybox.net>; Thu,  4 Jan 2024 21:27:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1283B40089
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RQdJ3l6WThOt for <buildroot@lists.busybox.net>;
 Thu,  4 Jan 2024 21:27:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 35A1D4263E
 for <buildroot@buildroot.org>; Thu,  4 Jan 2024 21:27:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 35A1D4263E
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1E2D984091; Thu,  4 Jan 2024 21:27:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Jan 2024 22:12:37 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ce151f52d1543d7e56ea374d44cc2ead3bf9a883
X-Git-Newrev: 7b7bac9bb2c1c977e4791c4430e2fff54522f257
X-Patchwork-Hint: ignore
Message-Id: <20240104212747.1E2D984091@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gdal: add sqlite optional
 dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=7b7bac9bb2c1c977e4791c4430e2fff54522f257
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gdal/gdal.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/gdal/gdal.mk b/package/gdal/gdal.mk
index 5690f55c00..e9dcc826b5 100644
--- a/package/gdal/gdal.mk
+++ b/package/gdal/gdal.mk
@@ -91,7 +91,6 @@ GDAL_CONF_OPTS = \
 	-DGDAL_USE_SFCGAL=OFF \
 	-DGDAL_USE_FYBA=OFF \
 	-DGDAL_USE_SPATIALITE=OFF \
-	-DGDAL_USE_SQLITE3=OFF \
 	-DGDAL_USE_TEIGHA=OFF \
 	-DGDAL_USE_TILEDB=OFF \
 	-DGDAL_USE_WEBP=OFF \
@@ -127,4 +126,11 @@ else
 GDAL_CONF_OPTS += -DGDAL_USE_POSTGRESQL=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_SQLITE),y)
+GDAL_DEPENDENCIES += sqlite
+GDAL_CONF_OPTS += -DGDAL_USE_SQLITE3=ON
+else
+GDAL_CONF_OPTS += -DGDAL_USE_SQLITE3=OFF
+endif
+
 $(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
