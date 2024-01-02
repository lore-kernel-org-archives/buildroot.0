Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91CB4C46CD2
	for <buildroot@archiver.kernel.org>; Tue,  2 Jan 2024 22:20:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2B1DD40A92;
	Tue,  2 Jan 2024 22:20:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2B1DD40A92
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BXIBqUmgHBh3; Tue,  2 Jan 2024 22:20:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2017E40A7E;
	Tue,  2 Jan 2024 22:20:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2017E40A7E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 345381BF966
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 22:20:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0DBEB81A47
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 22:20:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0DBEB81A47
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dqMcLHymvYQ0 for <buildroot@lists.busybox.net>;
 Tue,  2 Jan 2024 22:20:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2FD2B81A46
 for <buildroot@buildroot.org>; Tue,  2 Jan 2024 22:20:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2FD2B81A46
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1DBFC83D7F; Tue,  2 Jan 2024 22:20:00 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 2 Jan 2024 23:18:41 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d0a27c030af11b6dcaea06f20a1a2d6e8f72ce55
X-Git-Newrev: f4abda15d3ca3ebd40d9de9cc808e605a71a0733
X-Patchwork-Hint: ignore
Message-Id: <20240102222000.1DBFC83D7F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gdal: add expat optional dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=f4abda15d3ca3ebd40d9de9cc808e605a71a0733
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gdal/gdal.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/gdal/gdal.mk b/package/gdal/gdal.mk
index 13f38173fa..5690f55c00 100644
--- a/package/gdal/gdal.mk
+++ b/package/gdal/gdal.mk
@@ -51,7 +51,6 @@ GDAL_CONF_OPTS = \
 	-DGDAL_USE_CRNLIB=OFF \
 	-DGDAL_USE_CURL=OFF \
 	-DGDAL_USE_ECW=OFF \
-	-DGDAL_USE_EXPAT=OFF \
 	-DGDAL_USE_FILEGDB=OFF \
 	-DGDAL_USE_FREEXL=OFF \
 	-DGDAL_USE_GEOS=OFF \
@@ -107,6 +106,13 @@ GDAL_CONF_OPTS = \
 	-DBUILD_JAVA_BINDINGS=OFF \
 	-DBUILD_PYTHON_BINDINGS=OFF
 
+ifeq ($(BR2_PACKAGE_EXPAT),y)
+GDAL_DEPENDENCIES += expat
+GDAL_CONF_OPTS += -DGDAL_USE_EXPAT=ON
+else
+GDAL_CONF_OPTS += -DGDAL_USE_EXPAT=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_LIBXML2),y)
 GDAL_DEPENDENCIES += libxml2
 GDAL_CONF_OPTS += -DGDAL_USE_LIBXML2=ON
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
