Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CFF5C636D6
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 20:52:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0AF24822E9;
	Mon, 20 Feb 2023 20:52:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0AF24822E9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FDGFmlnXFjvC; Mon, 20 Feb 2023 20:52:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 39A07822FE;
	Mon, 20 Feb 2023 20:52:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 39A07822FE
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 36D471BF8C7
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:51:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B9A89400AF
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:51:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B9A89400AF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D0-ISMOp8EIa for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:51:46 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E97C04015F
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:51:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E97C04015F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D8D6686494; Mon, 20 Feb 2023 20:51:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 3 Nov 2022 23:03:12 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: c07caa732b5c4ca5836ee81ce90f57f967dcc721
X-Git-Newrev: 1a95fcbebf5955de48dd7f57dfc27708739968da
X-Patchwork-Hint: ignore
Message-Id: <20230220205145.D8D6686494@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/ipmitool: drop ncurses
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

commit: https://git.buildroot.net/buildroot/commit/?id=1a95fcbebf5955de48dd7f57dfc27708739968da
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

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
