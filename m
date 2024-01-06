Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29598C47074
	for <buildroot@archiver.kernel.org>; Sat,  6 Jan 2024 09:57:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D9AD383A42;
	Sat,  6 Jan 2024 09:57:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D9AD383A42
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eZyWxmHqX9WJ; Sat,  6 Jan 2024 09:57:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 47B3E8404D;
	Sat,  6 Jan 2024 09:57:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 47B3E8404D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2C2581BF861
 for <buildroot@lists.busybox.net>; Sat,  6 Jan 2024 09:55:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A6A644217C
 for <buildroot@lists.busybox.net>; Sat,  6 Jan 2024 09:55:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A6A644217C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Rv46v3wSjaL4 for <buildroot@lists.busybox.net>;
 Sat,  6 Jan 2024 09:55:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id EFFDE42176
 for <buildroot@buildroot.org>; Sat,  6 Jan 2024 09:55:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EFFDE42176
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DB92284688; Sat,  6 Jan 2024 09:55:23 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 6 Jan 2024 10:51:55 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8f1c70441338ba6a8c5214edc9c1072a0356e002
X-Git-Newrev: 634484cdfbf4b2e5bcac141dd289bf62c1f4d90b
X-Patchwork-Hint: ignore
Message-Id: <20240106095523.DB92284688@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gdal: add libcurl optional
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

commit: https://git.buildroot.net/buildroot/commit/?id=634484cdfbf4b2e5bcac141dd289bf62c1f4d90b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gdal/gdal.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/gdal/gdal.mk b/package/gdal/gdal.mk
index e9dcc826b5..937e28ba20 100644
--- a/package/gdal/gdal.mk
+++ b/package/gdal/gdal.mk
@@ -49,7 +49,6 @@ GDAL_CONF_OPTS = \
 	-DGDAL_USE_OPENSSL=OFF \
 	-DGDAL_USE_CRYPTOPP=OFF \
 	-DGDAL_USE_CRNLIB=OFF \
-	-DGDAL_USE_CURL=OFF \
 	-DGDAL_USE_ECW=OFF \
 	-DGDAL_USE_FILEGDB=OFF \
 	-DGDAL_USE_FREEXL=OFF \
@@ -112,6 +111,13 @@ else
 GDAL_CONF_OPTS += -DGDAL_USE_EXPAT=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_LIBCURL),y)
+GDAL_DEPENDENCIES += libcurl
+GDAL_CONF_OPTS += -DGDAL_USE_CURL=ON
+else
+GDAL_CONF_OPTS += -DGDAL_USE_CURL=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_LIBXML2),y)
 GDAL_DEPENDENCIES += libxml2
 GDAL_CONF_OPTS += -DGDAL_USE_LIBXML2=ON
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
