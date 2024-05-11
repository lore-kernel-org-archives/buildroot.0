Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33347C04FFE
	for <buildroot@archiver.kernel.org>; Sat, 11 May 2024 20:43:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AF128400E5;
	Sat, 11 May 2024 20:43:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xavrX92KHEa4; Sat, 11 May 2024 20:43:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B3F10403F9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B3F10403F9;
	Sat, 11 May 2024 20:43:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 706FE1BF57C
 for <buildroot@lists.busybox.net>; Sat, 11 May 2024 20:43:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5D73D605F7
 for <buildroot@lists.busybox.net>; Sat, 11 May 2024 20:43:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mby_eU_piUGK for <buildroot@lists.busybox.net>;
 Sat, 11 May 2024 20:43:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 88873605F6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 88873605F6
 for <buildroot@buildroot.org>; Sat, 11 May 2024 20:43:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 62BD486FD9; Sat, 11 May 2024 20:43:45 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 11 May 2024 22:40:05 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5cfda60060dfd56d13ced4803625427abe79b056
X-Git-Newrev: 76e473154ddf838f93829bd22485cca412c03d87
X-Patchwork-Hint: ignore
Message-Id: <20240511204345.62BD486FD9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/kodi: fix libudfread dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=76e473154ddf838f93829bd22485cca412c03d87
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Buildroot c61934611111cb3ea04604707052b1387bde5134 commit added a broken
dependency to libudfread. In fact libudfread is still an optional
dependency, just the configure options changes due to upstream
commit https://github.com/xbmc/xbmc/commit/5f9b9cfa26f274e381e92d73cfa33fb55582436e

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/kodi/Config.in | 1 -
 package/kodi/kodi.mk   | 8 +++++++-
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 0ec41785b1..1ba6932de9 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -166,7 +166,6 @@ config BR2_PACKAGE_KODI_EVENTCLIENTS
 config BR2_PACKAGE_KODI_LIBBLURAY
 	bool "blu-ray"
 	select BR2_PACKAGE_LIBBLURAY
-	select BR2_PACKAGE_LIBUDFREAD
 	help
 	  Enable Blu-ray input support.
 	  Select this if you want to play back Blu-ray content.
diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
index 09342ea1f0..62463b731e 100644
--- a/package/kodi/kodi.mk
+++ b/package/kodi/kodi.mk
@@ -45,7 +45,6 @@ KODI_DEPENDENCIES = \
 	libfribidi \
 	libplist \
 	libpng \
-	libudfread \
 	lzo \
 	openssl \
 	pcre \
@@ -388,6 +387,13 @@ else
 KODI_CONF_OPTS += -DENABLE_PULSEAUDIO=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_LIBUDFREAD),y)
+KODI_CONF_OPTS += -DENABLE_UDFREAD=ON
+KODI_DEPENDENCIES += libudfread
+else
+KODI_CONF_OPTS += -DENABLE_UDFREAD=OFF
+endif
+
 # Remove versioncheck addon, updating Kodi is done by building a new
 # buildroot image.
 KODI_ADDON_MANIFEST = $(TARGET_DIR)/usr/share/kodi/system/addon-manifest.xml
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
