Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E40B5CD11C2
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 14:57:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 47DD760A45;
	Sun,  7 Apr 2024 14:57:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ReCi3VVmneUh; Sun,  7 Apr 2024 14:57:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E9F6D60A55
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E9F6D60A55;
	Sun,  7 Apr 2024 14:57:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 36B421BF94D
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 14:57:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 23D4460A49
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 14:57:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PLBcA-7wUpmt for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 14:57:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6506060788
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6506060788
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 14:57:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 598E6851EE; Sun,  7 Apr 2024 14:57:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 7 Apr 2024 16:48:50 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8dd4917d867a24a47810d5e2d104daf8fc043ccc
X-Git-Newrev: d2f59ef0c4ae67827f62933a8db51eb0e2043b24
X-Patchwork-Hint: ignore
Message-Id: <20240407145719.598E6851EE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gdal: add openssl optional
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=d2f59ef0c4ae67827f62933a8db51eb0e2043b24
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/gdal/gdal.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/gdal/gdal.mk b/package/gdal/gdal.mk
index 247e13663c..77ffb514c2 100644
--- a/package/gdal/gdal.mk
+++ b/package/gdal/gdal.mk
@@ -46,7 +46,6 @@ GDAL_CONF_OPTS = \
 	-DGDAL_USE_BLOSC=OFF \
 	-DGDAL_USE_BRUNSLI=OFF \
 	-DGDAL_USE_CFITSIO=OFF \
-	-DGDAL_USE_OPENSSL=OFF \
 	-DGDAL_USE_CRYPTOPP=OFF \
 	-DGDAL_USE_CRNLIB=OFF \
 	-DGDAL_USE_ECW=OFF \
@@ -130,6 +129,13 @@ else
 GDAL_CONF_OPTS += -DENABLE_DEFLATE64=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+GDAL_DEPENDENCIES += openssl
+GDAL_CONF_OPTS += -DGDAL_USE_OPENSSL=ON
+else
+GDAL_CONF_OPTS += -DGDAL_USE_OPENSSL=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_POSTGRESQL),y)
 GDAL_DEPENDENCIES += postgresql
 GDAL_CONF_OPTS += -DGDAL_USE_POSTGRESQL=ON
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
