Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B851C25B75
	for <buildroot@archiver.kernel.org>; Sun, 26 May 2024 20:47:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5DF0E608DB;
	Sun, 26 May 2024 20:47:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SeKsb6Qato0E; Sun, 26 May 2024 20:47:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D011C608D6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D011C608D6;
	Sun, 26 May 2024 20:47:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 87CC91D1447
 for <buildroot@lists.busybox.net>; Sun, 26 May 2024 20:47:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 171BB4024A
 for <buildroot@lists.busybox.net>; Sun, 26 May 2024 20:47:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kbAvIiP6z3nh for <buildroot@lists.busybox.net>;
 Sun, 26 May 2024 20:46:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 10B1E40267
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 10B1E40267
 for <buildroot@buildroot.org>; Sun, 26 May 2024 20:46:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0524B815FE; Sun, 26 May 2024 20:46:59 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 26 May 2024 21:57:39 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 19b09e735b58f97f3032928d3fb64b60d0e1d5d7
X-Git-Newrev: a012c44201a1dbc04016bad04fbe33c666d78ca2
X-Patchwork-Hint: ignore
Message-Id: <20240526204659.0524B815FE@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] boot/barebox/Config.in:
 source argument needs quotation marks
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

commit: https://git.buildroot.net/buildroot/commit/?id=a012c44201a1dbc04016bad04fbe33c666d78ca2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Fixes the following error/warnings with kconfig from linux-6.9-rc5:

  boot/barebox/Config.in:79: syntax error
  boot/barebox/Config.in:79:warning: ignoring unsupported character '/'
  boot/barebox/Config.in:79:warning: ignoring unsupported character '/'
  boot/barebox/Config.in:79:warning: ignoring unsupported character '/'
  boot/barebox/Config.in:79:warning: ignoring unsupported character '.'
  boot/barebox/Config.in:79: invalid statement
  boot/barebox/Config.in:93: syntax error
  boot/barebox/Config.in:93:warning: ignoring unsupported character '/'
  boot/barebox/Config.in:93:warning: ignoring unsupported character '/'
  boot/barebox/Config.in:93:warning: ignoring unsupported character '/'
  boot/barebox/Config.in:93:warning: ignoring unsupported character '.'
  boot/barebox/Config.in:93: invalid statement

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit e86aec1663357a9f1f7de56129dfd1ab1c5d2cda)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 boot/barebox/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/boot/barebox/Config.in b/boot/barebox/Config.in
index dba4a1a8d6..0bd3386795 100644
--- a/boot/barebox/Config.in
+++ b/boot/barebox/Config.in
@@ -76,7 +76,7 @@ config BR2_TARGET_BAREBOX_CUSTOM_GIT_VERSION
 
 endif
 
-source boot/barebox/barebox/Config.in
+source "boot/barebox/barebox/Config.in"
 
 menuconfig BR2_TARGET_BAREBOX_AUX
 	bool "Build barebox with an auxiliary config"
@@ -90,7 +90,7 @@ menuconfig BR2_TARGET_BAREBOX_AUX
 
 if BR2_TARGET_BAREBOX_AUX
 
-source boot/barebox/barebox-aux/Config.in
+source "boot/barebox/barebox-aux/Config.in"
 
 endif
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
