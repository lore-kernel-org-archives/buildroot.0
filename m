Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C746C25B74
	for <buildroot@archiver.kernel.org>; Mon,  6 May 2024 19:02:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CB64D4149A;
	Mon,  6 May 2024 19:02:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id awnFm9UmTFuQ; Mon,  6 May 2024 19:02:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9AEC841493
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9AEC841493;
	Mon,  6 May 2024 19:02:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 556E61BF95F
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 19:02:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3E2ED81ED9
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 19:02:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s7tZrwOBD4fs for <buildroot@lists.busybox.net>;
 Mon,  6 May 2024 19:02:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6F23581E84
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6F23581E84
 for <buildroot@buildroot.org>; Mon,  6 May 2024 19:02:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 64E468679D; Mon,  6 May 2024 19:02:23 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 6 May 2024 20:59:26 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 74787fdd10543d482786fef582702bc24c1da626
X-Git-Newrev: e86aec1663357a9f1f7de56129dfd1ab1c5d2cda
X-Patchwork-Hint: ignore
Message-Id: <20240506190223.64E468679D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/barebox/Config.in: source argument
 needs quotation marks
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

commit: https://git.buildroot.net/buildroot/commit/?id=e86aec1663357a9f1f7de56129dfd1ab1c5d2cda
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
