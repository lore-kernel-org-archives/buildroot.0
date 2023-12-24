Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4057C46CD3
	for <buildroot@archiver.kernel.org>; Sun, 24 Dec 2023 22:24:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6DAF681CA5;
	Sun, 24 Dec 2023 22:24:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6DAF681CA5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NiGOven02Mtj; Sun, 24 Dec 2023 22:24:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B6E2081CA0;
	Sun, 24 Dec 2023 22:24:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B6E2081CA0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8D36C1BF870
 for <buildroot@lists.busybox.net>; Sun, 24 Dec 2023 22:24:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 653E14052E
 for <buildroot@lists.busybox.net>; Sun, 24 Dec 2023 22:24:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 653E14052E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id m-xJTgDCM4uR for <buildroot@lists.busybox.net>;
 Sun, 24 Dec 2023 22:24:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7649C40018
 for <buildroot@buildroot.org>; Sun, 24 Dec 2023 22:24:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7649C40018
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 639C482981; Sun, 24 Dec 2023 22:24:03 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 24 Dec 2023 22:59:36 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cb39803ee3a18d51f569745bc08a0a8d2270decd
X-Git-Newrev: b5b18f9ebaf1c095df08dcf69418bccb4bc46b6c
X-Patchwork-Hint: ignore
Message-Id: <20231224222403.639C482981@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sway: enable default-wallpaper
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

commit: https://git.buildroot.net/buildroot/commit/?id=b5b18f9ebaf1c095df08dcf69418bccb4bc46b6c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

If swaybg is selected, set default-wallpaper to true.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/sway/sway.mk | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/sway/sway.mk b/package/sway/sway.mk
index 677b101f1d..1e3dd279ef 100644
--- a/package/sway/sway.mk
+++ b/package/sway/sway.mk
@@ -11,7 +11,6 @@ SWAY_LICENSE_FILES = LICENSE
 SWAY_DEPENDENCIES = systemd host-pkgconf wlroots json-c pcre cairo pango
 SWAY_CONF_OPTS = \
 	-Dwerror=false \
-	-Ddefault-wallpaper=false \
 	-Dzsh-completions=false \
 	-Dfish-completions=false \
 	-Dswaybar=false \
@@ -39,4 +38,10 @@ else
 SWAY_CONF_OPTS += -Dbash-completions=false
 endif
 
+ifeq ($(BR2_PACKAGE_SWAYBG),y)
+SWAY_CONF_OPTS += -Ddefault-wallpaper=true
+else
+SWAY_CONF_OPTS += -Ddefault-wallpaper=false
+endif
+
 $(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
