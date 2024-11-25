Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40B77D58D69
	for <buildroot@archiver.kernel.org>; Mon, 25 Nov 2024 16:42:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0A40184F93;
	Mon, 25 Nov 2024 16:42:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4dcY9o3THxo9; Mon, 25 Nov 2024 16:42:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 21FCA84FAE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 21FCA84FAE;
	Mon, 25 Nov 2024 16:42:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id AB686E11
 for <buildroot@buildroot.org>; Mon, 25 Nov 2024 16:42:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 88A80433B6
 for <buildroot@buildroot.org>; Mon, 25 Nov 2024 16:42:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9SVEEeQy6ory for <buildroot@buildroot.org>;
 Mon, 25 Nov 2024 16:42:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 96CA64033F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 96CA64033F
 for <buildroot@buildroot.org>; Mon, 25 Nov 2024 16:42:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 83D91865D4; Mon, 25 Nov 2024 16:42:34 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 25 Nov 2024 17:37:02 +0100
X-Git-Refname: refs/heads/2024.08.x
X-Git-Oldrev: 1e0b9fb7cbfd17ac559217b15ab0cf059359d381
X-Git-Newrev: 59256d02f802f93390d6851f5d870363f4d86b58
X-Patchwork-Hint: ignore
Message-Id: <20241125164234.83D91865D4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.08.x] package/picotool: fix
 Config.in comment dependencies
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=59256d02f802f93390d6851f5d870363f4d86b58
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.08.x

Due to a bug in the Config.in comment dependencies, the comment "***
picotool needs a toolchain w/ C++, threads, gcc >= 4.9 ***" is always
shown even if all features are enabled.

Fixes: d30c1e3c582545a770d40a63be5b7b477d6b1cba ("package/picotool: fix libusb dependencies")
Signed-off-by: Cherniaev Andrei <dungeonlords789@naver.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit d2f5678f4217ab5cadbc4f32f7ca7a8efa8d2bc8)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/picotool/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/picotool/Config.in b/package/picotool/Config.in
index bbbcef405d..51c7c71188 100644
--- a/package/picotool/Config.in
+++ b/package/picotool/Config.in
@@ -1,6 +1,6 @@
 comment "picotool needs a toolchain w/ C++, threads, gcc >= 4.9"
 	depends on !BR2_INSTALL_LIBSTDCPP || \
-		BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_TOOLCHAIN_HAS_THREADS || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 
 config BR2_PACKAGE_PICOTOOL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
