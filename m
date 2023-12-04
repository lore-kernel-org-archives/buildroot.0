Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7517CC4167B
	for <buildroot@archiver.kernel.org>; Mon,  4 Dec 2023 13:42:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2D67F81F2B;
	Mon,  4 Dec 2023 13:42:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2D67F81F2B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R-wBFfuJAYxm; Mon,  4 Dec 2023 13:42:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5294C81F30;
	Mon,  4 Dec 2023 13:42:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5294C81F30
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D56721BF977
 for <buildroot@lists.busybox.net>; Mon,  4 Dec 2023 13:42:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AE4514015F
 for <buildroot@lists.busybox.net>; Mon,  4 Dec 2023 13:42:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AE4514015F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Sa41tLtULUKJ for <buildroot@lists.busybox.net>;
 Mon,  4 Dec 2023 13:42:14 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id AF30F40142
 for <buildroot@buildroot.org>; Mon,  4 Dec 2023 13:42:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AF30F40142
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 977B28798C; Mon,  4 Dec 2023 13:42:14 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 4 Dec 2023 14:38:40 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1ed291ae978006600b4e41130207d09b0271ed14
X-Git-Newrev: 955fd5a15529fda2af6f8844d9fc541c4b8a79be
X-Patchwork-Hint: ignore
Message-Id: <20231204134214.977B28798C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Update for 2023.08.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=955fd5a15529fda2af6f8844d9fc541c4b8a79be
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 5abe7bd726493acd0b9ea4600b7a33ccfaefce2f)
[Peter: drop Makefile/Vagrantfile changes]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/CHANGES b/CHANGES
index f927b7df65..bcd4102297 100644
--- a/CHANGES
+++ b/CHANGES
@@ -118,6 +118,24 @@
 	#15826: nodejs modules with native extensions fail to install
 	#15835: Incompatibility between network-manager and libcurl 8.4
 
+2023.08.4, released December 4th, 2023
+
+	Important / security related fixes.
+
+	Defconfigs: Raspberrypi: Fix DT overlay for autoproving of
+	bluetooth driver, Toradex apalis i.mx6: Add download hashes
+	for Linux and U-Boot.
+
+	Updated/fixed packages: gcc, erlang, exfatprogs, gsl,
+	imagemagick, intel-microcode, libde265, libmemcached,
+	libpjsip, libxml2, mariadb, memcached, motion, netsnmp, perl,
+	postgresql, putty, rtty, samba4, speechd, squid, vim, vlc,
+	xenomai, xtables-addons, zfs
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#15856: Using BR2_CONFIG= on a different file-system...
+
 2023.08.3, released November 14th, 2023
 
 	Important / security related fixes.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
