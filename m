Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 935B8C46CD3
	for <buildroot@archiver.kernel.org>; Sun, 24 Dec 2023 22:24:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4E2B38131E;
	Sun, 24 Dec 2023 22:24:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4E2B38131E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uIt4LcTJdvc9; Sun, 24 Dec 2023 22:24:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 993B081D21;
	Sun, 24 Dec 2023 22:24:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 993B081D21
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 912CA1BF86C
 for <buildroot@lists.busybox.net>; Sun, 24 Dec 2023 22:24:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 613FF60BD3
 for <buildroot@lists.busybox.net>; Sun, 24 Dec 2023 22:24:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 613FF60BD3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AAJiTo5sUP4w for <buildroot@lists.busybox.net>;
 Sun, 24 Dec 2023 22:24:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8EF1360BAB
 for <buildroot@buildroot.org>; Sun, 24 Dec 2023 22:24:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8EF1360BAB
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 79D1B829FC; Sun, 24 Dec 2023 22:24:03 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 24 Dec 2023 23:08:58 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b08df59fc61ebbcabf58ee706d74384cbb7dcb7e
X-Git-Newrev: 31058f5fdfddcbb4eb50a2eeeaa57ed4f9608524
X-Patchwork-Hint: ignore
Message-Id: <20231224222403.79D1B829FC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sway: enable swaybar tray support
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

commit: https://git.buildroot.net/buildroot/commit/?id=31058f5fdfddcbb4eb50a2eeeaa57ed4f9608524
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a config option to build swaybar with tray support.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/sway/Config.in | 9 +++++++++
 package/sway/sway.mk   | 7 ++++++-
 2 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/package/sway/Config.in b/package/sway/Config.in
index 6fd13636a3..c2301000e6 100644
--- a/package/sway/Config.in
+++ b/package/sway/Config.in
@@ -34,6 +34,15 @@ config BR2_PACKAGE_SWAY_SWAYBAR
 	help
 	  Enable support for swaybar
 
+if BR2_PACKAGE_SWAY_SWAYBAR
+
+config BR2_PACKAGE_SWAY_SWAYBAR_TRAY
+	bool "swaybar tray"
+	help
+	  Enable support for swaybar tray
+
+endif # BR2_PACKAGE_SWAY_SWAYBAR
+
 endif # BR2_PACKAGE_SWAY
 
 comment "sway needs systemd, udev, EGL w/ Wayland backend and OpenGL ES support"
diff --git a/package/sway/sway.mk b/package/sway/sway.mk
index 6d924ca92e..5de4c32a04 100644
--- a/package/sway/sway.mk
+++ b/package/sway/sway.mk
@@ -14,7 +14,6 @@ SWAY_CONF_OPTS = \
 	-Dzsh-completions=false \
 	-Dfish-completions=false \
 	-Dswaynag=false \
-	-Dtray=disabled \
 	-Dman-pages=disabled \
 	-Dsd-bus-provider=libsystemd
 
@@ -49,4 +48,10 @@ else
 SWAY_CONF_OPTS += -Dswaybar=false
 endif
 
+ifeq ($(BR2_PACKAGE_SWAY_SWAYBAR_TRAY),y)
+SWAY_CONF_OPTS += -Dtray=enabled
+else
+SWAY_CONF_OPTS += -Dtray=disabled
+endif
+
 $(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
