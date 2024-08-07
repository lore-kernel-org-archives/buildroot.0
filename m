Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74096C52D6F
	for <buildroot@archiver.kernel.org>; Wed,  7 Aug 2024 12:18:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CF2B5404D6;
	Wed,  7 Aug 2024 12:18:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xKMIFa1FwnIl; Wed,  7 Aug 2024 12:18:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C5A9D402AE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C5A9D402AE;
	Wed,  7 Aug 2024 12:18:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 342511BF342
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 12:18:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2ED756070A
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 12:18:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7D_b9zq97mIJ for <buildroot@lists.busybox.net>;
 Wed,  7 Aug 2024 12:18:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B3B83606F7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B3B83606F7
 for <buildroot@buildroot.org>; Wed,  7 Aug 2024 12:18:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9E9EB84555; Wed,  7 Aug 2024 12:18:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 7 Aug 2024 14:16:48 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bd15cdda9be3a7dea6cc80ef4707af244864d992
X-Git-Newrev: 202e644b2698ac9b2e7a85dd23acfa3df5f6bd74
X-Patchwork-Hint: ignore
Message-Id: <20240807121849.9E9EB84555@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/nethogs: needs toolchain with C++
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

commit: https://git.buildroot.net/buildroot/commit/?id=202e644b2698ac9b2e7a85dd23acfa3df5f6bd74
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

http://autobuild.buildroot.net/results/a250f6f3e93ceddad2d4c7cd1f29233fce2b327e
http://autobuild.buildroot.net/results/b68e8c601b31c70bc30cdfe913f7988f54255dbf
http://autobuild.buildroot.net/results/298090dfb9db42ba9f219d2c268bc798373142c7
http://autobuild.buildroot.net/results/b59851d542418ad0f40d86b32dc7573248233de4
http://autobuild.buildroot.net/results/18cc7058d567916c7d2bfb16b7808b71ed731948
http://autobuild.buildroot.net/results/786e68c8c397038511db4e8bea589839a7d9b056
http://autobuild.buildroot.net/results/8eddfca525f6951e6d11184e312cffccfc443ba8
http://autobuild.buildroot.net/results/bdfc7b723abdf4aea48e40e789883405061e4e1c

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/nethogs/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/nethogs/Config.in b/package/nethogs/Config.in
index 2d6b44739c..fe5a4cdba4 100644
--- a/package/nethogs/Config.in
+++ b/package/nethogs/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_NETHOGS
 	bool "nethogs"
+	depends on BR2_INSTALL_LIBSTDCPP
 	select BR2_PACKAGE_LIBPCAP
 	select BR2_PACKAGE_NCURSES
 	help
@@ -8,3 +9,6 @@ config BR2_PACKAGE_NETHOGS
 	  do, it groups bandwidth by process.
 
           https://github.com/raboof/nethogs
+
+comment "nethogs needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
