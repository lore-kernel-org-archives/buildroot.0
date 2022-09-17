Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFC4CECAAD3
	for <buildroot@archiver.kernel.org>; Sat, 17 Sep 2022 15:39:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7D7B840919;
	Sat, 17 Sep 2022 15:39:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7D7B840919
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SKbuyo06sKhv; Sat, 17 Sep 2022 15:39:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 948EC40153;
	Sat, 17 Sep 2022 15:39:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 948EC40153
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 65A591BF388
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 15:39:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4F36E61113
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 15:39:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4F36E61113
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bQ77tdfW6Qgz for <buildroot@lists.busybox.net>;
 Sat, 17 Sep 2022 15:39:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8E5A960A9E
 for <buildroot@buildroot.org>; Sat, 17 Sep 2022 15:39:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8E5A960A9E
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 787168448B; Sat, 17 Sep 2022 15:39:06 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 17 Sep 2022 17:32:26 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d4b915dc4f42514c2de635b2a3ff0b1d9fb96894
X-Git-Newrev: 8be98902e8db9d8bff8841629acbb9dde8409228
X-Patchwork-Hint: ignore
Message-Id: <20220917153906.787168448B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cog: add weston direct display
 support
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

commit: https://git.buildroot.net/buildroot/commit/?id=8be98902e8db9d8bff8841629acbb9dde8409228
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Enable optional weston direct display support when weston is
available.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Reviewed-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/cog/cog.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/cog/cog.mk b/package/cog/cog.mk
index 5f7abcab1f..1f24bebee4 100644
--- a/package/cog/cog.mk
+++ b/package/cog/cog.mk
@@ -14,11 +14,17 @@ COG_LICENSE_FILES = COPYING
 COG_CONF_OPTS = \
 	-DCOG_BUILD_PROGRAMS=ON \
 	-DCOG_PLATFORM_HEADLESS=ON \
-	-DCOG_WESTON_DIRECT_DISPLAY=OFF \
 	-DINSTALL_MAN_PAGES=OFF \
 	-DCOG_HOME_URI='$(call qstrip,$(BR2_PACKAGE_COG_PROGRAMS_HOME_URI))' \
 	-DUSE_SOUP2=ON
 
+ifeq ($(BR2_PACKAGE_WESTON),y)
+COG_CONF_OPTS += -DCOG_WESTON_DIRECT_DISPLAY=ON
+COG_DEPENDENCIES += weston
+else
+COG_CONF_OPTS += -DCOG_WESTON_DIRECT_DISPLAY=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_COG_PLATFORM_FDO),y)
 COG_CONF_OPTS += -DCOG_PLATFORM_WL=ON
 COG_DEPENDENCIES += libxkbcommon wayland-protocols
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
