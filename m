Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75AD0CE8D52
	for <buildroot@archiver.kernel.org>; Thu, 19 Sep 2024 07:19:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CEC65615C9;
	Thu, 19 Sep 2024 07:19:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uVG8TFhKzXIb; Thu, 19 Sep 2024 07:19:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5487F615BB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5487F615BB;
	Thu, 19 Sep 2024 07:19:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0253F1BF4D5
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 07:19:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E4A07840FC
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 07:19:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vVJGqVGLcyRw for <buildroot@lists.busybox.net>;
 Thu, 19 Sep 2024 07:19:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2178384123
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2178384123
 for <buildroot@buildroot.org>; Thu, 19 Sep 2024 07:19:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1040C83C61; Thu, 19 Sep 2024 07:19:01 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 19 Sep 2024 09:11:18 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: cbe2b1913b7e9f7a5aebfaa95f3609116fd965c5
X-Git-Newrev: 02bc5cffcf3842e984008e02dc262d9828b476ba
X-Patchwork-Hint: ignore
Message-Id: <20240919071901.1040C83C61@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package: fix a few
 Config.in indentation
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

commit: https://git.buildroot.net/buildroot/commit/?id=02bc5cffcf3842e984008e02dc262d9828b476ba
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit a7552293bb01e6189d3bad14bbf071431510a1ad)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/kodi/Config.in      | 2 +-
 package/mmc-utils/Config.in | 6 +++---
 package/rauc/Config.in      | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 8ad9fdae78..b71f7f1405 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -140,7 +140,7 @@ config BR2_PACKAGE_KODI_BLUEZ
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
index 7451b29a55..6036ae1872 100644
--- a/package/rauc/Config.in
+++ b/package/rauc/Config.in
@@ -31,7 +31,7 @@ config BR2_PACKAGE_RAUC_GPT
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
