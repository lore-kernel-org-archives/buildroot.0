Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15B26EB64CD
	for <buildroot@archiver.kernel.org>; Sat,  7 Sep 2024 17:20:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3561A403AD;
	Sat,  7 Sep 2024 17:20:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hK3aBmQz554W; Sat,  7 Sep 2024 17:20:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 94B7A40426
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 94B7A40426;
	Sat,  7 Sep 2024 17:19:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D1BDC1BF863
 for <buildroot@lists.busybox.net>; Sat,  7 Sep 2024 17:19:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BF349605FC
 for <buildroot@lists.busybox.net>; Sat,  7 Sep 2024 17:19:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id feCRADyN4R5v for <buildroot@lists.busybox.net>;
 Sat,  7 Sep 2024 17:19:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E7E9E605FA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E7E9E605FA
 for <buildroot@buildroot.org>; Sat,  7 Sep 2024 17:19:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DA58986DE7; Sat,  7 Sep 2024 17:19:54 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 7 Sep 2024 19:18:34 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2ba879cc38733f5160b0729bac1b9e2f001f35e1
X-Git-Newrev: a7552293bb01e6189d3bad14bbf071431510a1ad
X-Patchwork-Hint: ignore
Message-Id: <20240907171954.DA58986DE7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package: fix a few Config.in indentation
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

commit: https://git.buildroot.net/buildroot/commit/?id=a7552293bb01e6189d3bad14bbf071431510a1ad
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/kodi/Config.in      | 2 +-
 package/mmc-utils/Config.in | 6 +++---
 package/rauc/Config.in      | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 25c5758b85..1977263db8 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -143,7 +143,7 @@ config BR2_PACKAGE_KODI_BLUEZ
 	select BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_AUDIO
 	select BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_HID
 	help
-	    Enable bluetooth support
+	  Enable bluetooth support
 
 comment "bluetooth support needs a toolchain w/ headers >= 3.18"
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
diff --git a/package/mmc-utils/Config.in b/package/mmc-utils/Config.in
index d938b5dea3..3275ba0d44 100644
--- a/package/mmc-utils/Config.in
+++ b/package/mmc-utils/Config.in
@@ -11,9 +11,9 @@ if BR2_PACKAGE_MMC_UTILS
 config BR2_PACKAGE_MMC_UTILS_ENABLE_DANGEROUS_COMMANDS
 	bool "Enable dangerous commands"
 	help
-	   Enable support for dangerous commands in mmc-utils. mmc-utils
-	   considers turning on permanent write protection on a device a
-	   "dangerous command" and doesn't offer it by default.
+	  Enable support for dangerous commands in mmc-utils. mmc-utils
+	  considers turning on permanent write protection on a device a
+	  "dangerous command" and doesn't offer it by default.
 
 endif
 
diff --git a/package/rauc/Config.in b/package/rauc/Config.in
index 01a321e3dd..af0b99c36b 100644
--- a/package/rauc/Config.in
+++ b/package/rauc/Config.in
@@ -33,7 +33,7 @@ config BR2_PACKAGE_RAUC_GPT
 	select BR2_PACKAGE_UTIL_LINUX_LIBS
 	select BR2_PACKAGE_UTIL_LINUX_LIBFDISK
 	help
-	    This option enables support for GPT partition tables.
+	  This option enables support for GPT partition tables.
 
 config BR2_PACKAGE_RAUC_NETWORK
 	bool "network support"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
