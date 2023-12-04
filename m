Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3E11C4167B
	for <buildroot@archiver.kernel.org>; Mon,  4 Dec 2023 14:06:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 93C53416C3;
	Mon,  4 Dec 2023 14:06:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 93C53416C3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aY3vjsCtAOpH; Mon,  4 Dec 2023 14:06:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EC17840493;
	Mon,  4 Dec 2023 14:06:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EC17840493
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 55F751BF33A
 for <buildroot@lists.busybox.net>; Mon,  4 Dec 2023 14:06:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 37EAA40286
 for <buildroot@lists.busybox.net>; Mon,  4 Dec 2023 14:06:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 37EAA40286
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LEo7jfDB8juj for <buildroot@lists.busybox.net>;
 Mon,  4 Dec 2023 14:06:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3F92E4015F
 for <buildroot@buildroot.org>; Mon,  4 Dec 2023 14:06:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3F92E4015F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 26D83879A3; Mon,  4 Dec 2023 14:06:28 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 4 Dec 2023 15:03:23 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 46e2e2549bb27f83fc3eefa949969f137e4b3230
X-Git-Newrev: 49d2965482f5048c503b6733540109c61ebc20e4
X-Patchwork-Hint: ignore
Message-Id: <20231204140628.26D83879A3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Update for 2023.02.8
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

commit: https://git.buildroot.net/buildroot/commit/?id=49d2965482f5048c503b6733540109c61ebc20e4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit e6252e5b6d7b3ed645c3001dec3b5845852727d7)
[Peter: drop Makefile/Vagrantfile changes]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/CHANGES b/CHANGES
index bcd4102297..7b67711ca9 100644
--- a/CHANGES
+++ b/CHANGES
@@ -509,6 +509,23 @@
 	#15376: Libiconv config
 	#15461: QtVirtualKeyboard segfaults
 
+2023.02.8, released December 4th, 2023
+
+	Important / security related fixes.
+
+	Defconfigs: Raspberrypi: Fix DT overlay for autoproving of
+	bluetooth driver, Toradex apalis i.mx6: Add download hashes
+	for Linux and U-Boot.
+
+	Updated/fixed packages: exfatprogs, gcc, imagemagick,
+	intel-microcode, libpjsip, libxml2, mariadb, memcached,
+	motion, netsnmp, perl, postgresql, rtty, samba4, speech,
+	squid, vim, vlc, xenomai, xtables-addons, zfs
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#15856: Using BR2_CONFIG= on a different file-system...
+
 2023.02.7, released November 14th, 2023
 
 	Important / security related fixes.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
