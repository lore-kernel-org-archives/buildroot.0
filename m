Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98F21C61DA4
	for <buildroot@archiver.kernel.org>; Mon,  6 Feb 2023 10:55:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 283FC60ADD;
	Mon,  6 Feb 2023 10:55:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 283FC60ADD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ekjmr6K1UMsz; Mon,  6 Feb 2023 10:55:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4BE7760AC3;
	Mon,  6 Feb 2023 10:55:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4BE7760AC3
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4EA1D1BF2CF
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 10:54:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 28F26605A0
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 10:54:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 28F26605A0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 95c0iUa_Yy5i for <buildroot@lists.busybox.net>;
 Mon,  6 Feb 2023 10:54:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5115A60A8C
 for <buildroot@buildroot.org>; Mon,  6 Feb 2023 10:54:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5115A60A8C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3F1918347B; Mon,  6 Feb 2023 10:54:50 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 6 Feb 2023 11:23:43 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4092d2a3546c1edfcb27f9d00fd4e7cac9878d2f
X-Git-Newrev: 6a9feaabbce4f21dd2a688d35a5027cb0e2a7a22
X-Patchwork-Hint: ignore
Message-Id: <20230206105450.3F1918347B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package,
 legacy: fix typo for "daemon" on help text
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

commit: https://git.buildroot.net/buildroot/commit/?id=6a9feaabbce4f21dd2a688d35a5027cb0e2a7a22
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

deamon -> daemon

At same time, in Config.in.legacy fix other typos in the same help text:
spae -> space
monolitic -> monolithic

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in.legacy           | 4 ++--
 package/ngircd/Config.in   | 2 +-
 package/rp-pppoe/Config.in | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index e95460f82b..4d82a54208 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -4430,8 +4430,8 @@ config BR2_PACKAGE_OPENPOWERLINK_LIBPCAP
 	select BR2_PACKAGE_OPENPOWERLINK_STACK_USERSPACE_DAEMON_LIB
 	help
 	  The user space support has been split in two part:
-	  - a monolitic user space library
-	  - a user spae deamon driver
+	  - a monolithic user space library
+	  - a user space daemon driver
 
 config BR2_LINUX_KERNEL_SAME_AS_HEADERS
 	bool "using the linux headers version for the kernel has been removed"
diff --git a/package/ngircd/Config.in b/package/ngircd/Config.in
index 9b3d430922..1e93a5702c 100644
--- a/package/ngircd/Config.in
+++ b/package/ngircd/Config.in
@@ -2,6 +2,6 @@ config BR2_PACKAGE_NGIRCD
 	bool "ngircd"
 	depends on BR2_USE_MMU # fork()
 	help
-	  Next Generation IRC server deamon.
+	  Next Generation IRC server daemon.
 
 	  http://ngircd.barton.de
diff --git a/package/rp-pppoe/Config.in b/package/rp-pppoe/Config.in
index 2ac81cbb2d..6ff005a1e1 100644
--- a/package/rp-pppoe/Config.in
+++ b/package/rp-pppoe/Config.in
@@ -9,7 +9,7 @@ config BR2_PACKAGE_RP_PPPOE
 	select BR2_PACKAGE_PPPD
 	help
 	  An implementation of the Point-to-point protocol over
-	  Ethernet.  Has userspace client and server deamons. You
+	  Ethernet.  Has userspace client and server daemons. You
 	  likely only need this package if you are implementing the
 	  pppoe server that will service other pppoe client
 	  devices. Otherwise the normal client functionality already
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
