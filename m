Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12D01C46CD2
	for <buildroot@archiver.kernel.org>; Sun, 24 Dec 2023 22:24:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BBA8781DAB;
	Sun, 24 Dec 2023 22:24:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BBA8781DAB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LSg8UIrgLrOR; Sun, 24 Dec 2023 22:24:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 23ECC81468;
	Sun, 24 Dec 2023 22:24:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 23ECC81468
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7846B1BF380
 for <buildroot@lists.busybox.net>; Sun, 24 Dec 2023 22:24:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5CCB54148F
 for <buildroot@lists.busybox.net>; Sun, 24 Dec 2023 22:24:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5CCB54148F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id it-ZnJ_hv96W for <buildroot@lists.busybox.net>;
 Sun, 24 Dec 2023 22:24:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 967C841497
 for <buildroot@buildroot.org>; Sun, 24 Dec 2023 22:24:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 967C841497
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 84918829FD; Sun, 24 Dec 2023 22:24:03 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 24 Dec 2023 23:09:03 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 31058f5fdfddcbb4eb50a2eeeaa57ed4f9608524
X-Git-Newrev: 4163b67c376bbfc81d41e4162ea05b65a9110661
X-Patchwork-Hint: ignore
Message-Id: <20231224222403.84918829FD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sway: enable swaynag support
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

commit: https://git.buildroot.net/buildroot/commit/?id=4163b67c376bbfc81d41e4162ea05b65a9110661
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a config option to build sway with swaynag support.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/sway/Config.in | 5 +++++
 package/sway/sway.mk   | 7 ++++++-
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/package/sway/Config.in b/package/sway/Config.in
index c2301000e6..e97777ac87 100644
--- a/package/sway/Config.in
+++ b/package/sway/Config.in
@@ -43,6 +43,11 @@ config BR2_PACKAGE_SWAY_SWAYBAR_TRAY
 
 endif # BR2_PACKAGE_SWAY_SWAYBAR
 
+config BR2_PACKAGE_SWAY_SWAYNAG
+	bool "swaynag"
+	help
+	  Enable support for swaynag
+
 endif # BR2_PACKAGE_SWAY
 
 comment "sway needs systemd, udev, EGL w/ Wayland backend and OpenGL ES support"
diff --git a/package/sway/sway.mk b/package/sway/sway.mk
index 5de4c32a04..0aad9de712 100644
--- a/package/sway/sway.mk
+++ b/package/sway/sway.mk
@@ -13,7 +13,6 @@ SWAY_CONF_OPTS = \
 	-Dwerror=false \
 	-Dzsh-completions=false \
 	-Dfish-completions=false \
-	-Dswaynag=false \
 	-Dman-pages=disabled \
 	-Dsd-bus-provider=libsystemd
 
@@ -48,6 +47,12 @@ else
 SWAY_CONF_OPTS += -Dswaybar=false
 endif
 
+ifeq ($(BR2_PACKAGE_SWAY_SWAYNAG),y)
+SWAY_CONF_OPTS += -Dswaynag=true
+else
+SWAY_CONF_OPTS += -Dswaynag=false
+endif
+
 ifeq ($(BR2_PACKAGE_SWAY_SWAYBAR_TRAY),y)
 SWAY_CONF_OPTS += -Dtray=enabled
 else
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
