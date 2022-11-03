Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 164C1C433FE
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 22:03:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ABAB661056;
	Thu,  3 Nov 2022 22:03:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ABAB661056
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vDOYyGBOG463; Thu,  3 Nov 2022 22:03:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DDD3D61038;
	Thu,  3 Nov 2022 22:03:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DDD3D61038
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CAC241BF2F2
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 22:03:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B2AFA4184D
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 22:03:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B2AFA4184D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 03wV6bKEcLmG for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 22:03:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 82DB34183C
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 22:03:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 82DB34183C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6D1D987C80; Thu,  3 Nov 2022 22:03:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 3 Nov 2022 23:03:12 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c07caa732b5c4ca5836ee81ce90f57f967dcc721
X-Git-Newrev: 1a95fcbebf5955de48dd7f57dfc27708739968da
X-Patchwork-Hint: ignore
Message-Id: <20221103220343.6D1D987C80@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ipmitool: drop ncurses dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=1a95fcbebf5955de48dd7f57dfc27708739968da
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

ncurses is not a dependency since bump to version 1.8.19 in commit
8317065ecb4979fe43c466f7e5a7f6dc281bd10d and
https://github.com/ipmitool/ipmitool/commit/63dd71c39c9bf522ad3a785dd001737a285458eb

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/ipmitool/Config.in   | 1 -
 package/ipmitool/ipmitool.mk | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/ipmitool/Config.in b/package/ipmitool/Config.in
index f5c79c8403..dbd6483110 100644
--- a/package/ipmitool/Config.in
+++ b/package/ipmitool/Config.in
@@ -32,7 +32,6 @@ config BR2_PACKAGE_IPMITOOL_IPMIEVD
 
 config BR2_PACKAGE_IPMITOOL_IPMISHELL
 	bool "ipmishell"
-	select BR2_PACKAGE_NCURSES
 	select BR2_PACKAGE_READLINE
 	help
 	  IPMI shell interface
diff --git a/package/ipmitool/ipmitool.mk b/package/ipmitool/ipmitool.mk
index 06d50bb6b9..0b8befffcd 100644
--- a/package/ipmitool/ipmitool.mk
+++ b/package/ipmitool/ipmitool.mk
@@ -34,7 +34,7 @@ IPMITOOL_CONF_OPTS += --disable-intf-usb
 endif
 
 ifeq ($(BR2_PACKAGE_IPMITOOL_IPMISHELL),y)
-IPMITOOL_DEPENDENCIES += ncurses readline
+IPMITOOL_DEPENDENCIES += readline
 IPMITOOL_CONF_OPTS += --enable-ipmishell
 else
 IPMITOOL_CONF_OPTS += --disable-ipmishell
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
