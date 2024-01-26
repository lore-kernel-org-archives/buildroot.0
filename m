Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42A1BC47DDB
	for <buildroot@archiver.kernel.org>; Fri, 26 Jan 2024 08:49:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F410384EA8;
	Fri, 26 Jan 2024 08:49:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F410384EA8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id a_9_Sc4jHd7u; Fri, 26 Jan 2024 08:49:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 45CEF84F09;
	Fri, 26 Jan 2024 08:49:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 45CEF84F09
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3950F1BF98E
 for <buildroot@lists.busybox.net>; Fri, 26 Jan 2024 08:48:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1319945FD7
 for <buildroot@lists.busybox.net>; Fri, 26 Jan 2024 08:48:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1319945FD7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HPQN0UsIvIPA for <buildroot@lists.busybox.net>;
 Fri, 26 Jan 2024 08:48:46 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4813845A57
 for <buildroot@buildroot.org>; Fri, 26 Jan 2024 08:48:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4813845A57
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 350F986532; Fri, 26 Jan 2024 08:48:46 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 26 Jan 2024 09:46:12 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bbea0e71398e19f0a8d360b7e16a5baa8d2f5c50
X-Git-Newrev: 1c41b8bcf6ebf9e86c1ed63f137bcc87013f954b
X-Patchwork-Hint: ignore
Message-Id: <20240126084846.350F986532@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gdal: add xz optional dependency
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=1c41b8bcf6ebf9e86c1ed63f137bcc87013f954b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gdal/gdal.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/gdal/gdal.mk b/package/gdal/gdal.mk
index 937e28ba20..3104332db9 100644
--- a/package/gdal/gdal.mk
+++ b/package/gdal/gdal.mk
@@ -67,7 +67,6 @@ GDAL_CONF_OPTS = \
 	-DGDAL_USE_KDU=OFF \
 	-DGDAL_USE_KEA=OFF \
 	-DGDAL_USE_LERC=OFF \
-	-DGDAL_USE_LIBLZMA=OFF \
 	-DGDAL_USE_DEFLATE=OFF \
 	-DGDAL_USE_MONGOCXX=OFF \
 	-DGDAL_USE_MRSID=OFF \
@@ -139,4 +138,11 @@ else
 GDAL_CONF_OPTS += -DGDAL_USE_SQLITE3=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_XZ),y)
+GDAL_DEPENDENCIES += xz
+GDAL_CONF_OPTS += -DGDAL_USE_LIBLZMA=ON
+else
+GDAL_CONF_OPTS += -DGDAL_USE_LIBLZMA=OFF
+endif
+
 $(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
