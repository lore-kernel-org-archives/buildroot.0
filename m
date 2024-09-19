Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97A56CE8D58
	for <buildroot@archiver.kernel.org>; Thu, 19 Sep 2024 07:17:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 55EA460730;
	Thu, 19 Sep 2024 07:17:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xAuVwvr30BgG; Thu, 19 Sep 2024 07:17:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 58F2C60742
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 58F2C60742;
	Thu, 19 Sep 2024 07:17:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3B8031BF4D5
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 07:17:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3718F60742
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 07:17:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LwczhC5XSRWd for <buildroot@lists.busybox.net>;
 Thu, 19 Sep 2024 07:17:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 74084606A7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 74084606A7
 for <buildroot@buildroot.org>; Thu, 19 Sep 2024 07:17:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6D61883C3D; Thu, 19 Sep 2024 07:17:52 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 19 Sep 2024 09:11:13 +0200
X-Git-Refname: refs/heads/2024.08.x
X-Git-Oldrev: f066ea7f9c5539e326c1072d15745915fa9b71f6
X-Git-Newrev: a0890d709b56871c1d939ab696468bfe043ba381
X-Patchwork-Hint: ignore
Message-Id: <20240919071752.6D61883C3D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.08.x] package: fix a few
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

commit: https://git.buildroot.net/buildroot/commit/?id=a0890d709b56871c1d939ab696468bfe043ba381
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.08.x

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit a7552293bb01e6189d3bad14bbf071431510a1ad)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
