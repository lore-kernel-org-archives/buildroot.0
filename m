Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AFFAC433F5
	for <buildroot@archiver.kernel.org>; Sun, 27 Feb 2022 20:27:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AD3EC4086B;
	Sun, 27 Feb 2022 20:27:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Fpo0TCQ4ev3W; Sun, 27 Feb 2022 20:27:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E7E0940867;
	Sun, 27 Feb 2022 20:27:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 32D6B1BF97C
 for <buildroot@lists.busybox.net>; Sun, 27 Feb 2022 20:26:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 206E9402C3
 for <buildroot@lists.busybox.net>; Sun, 27 Feb 2022 20:26:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7BdLLTFi54Ge for <buildroot@lists.busybox.net>;
 Sun, 27 Feb 2022 20:26:55 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 424F440143
 for <buildroot@buildroot.org>; Sun, 27 Feb 2022 20:26:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id BC4AE826D4; Sun, 27 Feb 2022 20:18:49 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 27 Feb 2022 21:20:49 +0100
X-Git-Refname: refs/heads/2021.11.x
X-Git-Oldrev: e3fdd722744ba0403e2faafbd34038ba0a6eb7b9
X-Git-Newrev: eb84d088075262610b321cbcbee9498f6d46cf98
X-Patchwork-Hint: ignore
Message-Id: <20220227201849.BC4AE826D4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.11.x] package/kodi: add
 bluetooth dependency comment
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

commit: https://git.buildroot.net/buildroot/commit/?id=eb84d088075262610b321cbcbee9498f6d46cf98
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.11.x

Commit 43122d64e05a2831a96dabcbf149ba199726767f forgot to add bluetooth
dependency comment

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 38b5f2069bbe029c62594095a02f915552dc28c2)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/kodi/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index af7604428e..c81868cd85 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -134,6 +134,10 @@ config BR2_PACKAGE_KODI_BLUEZ
 	help
 	    Enable bluetooth support
 
+comment "bluetooth support needs a toolchain w/ headers >= 3.4"
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4
+
 config BR2_PACKAGE_KODI_DBUS
 	bool "dbus"
 	select BR2_PACKAGE_DBUS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
