Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4D53C636D6
	for <buildroot@archiver.kernel.org>; Wed, 22 Feb 2023 16:11:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 643B6416C7;
	Wed, 22 Feb 2023 16:11:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 643B6416C7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rpgkOJfuqN1R; Wed, 22 Feb 2023 16:11:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A4921416E8;
	Wed, 22 Feb 2023 16:11:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A4921416E8
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C7F0F1BF847
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 16:10:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A219D611B4
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 16:10:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A219D611B4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v32pS8zzIF_Z for <buildroot@lists.busybox.net>;
 Wed, 22 Feb 2023 16:10:22 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id BC8DE6117E
 for <buildroot@buildroot.org>; Wed, 22 Feb 2023 16:10:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BC8DE6117E
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A77798675D; Wed, 22 Feb 2023 16:10:22 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 22 Feb 2023 16:57:34 +0100
X-Git-Refname: refs/heads/2022.11.x
X-Git-Oldrev: bcd81208ad9bbbd6368262a89b9a9122d5a4be1f
X-Git-Newrev: 42743a9503e83365ffa7b57f4423527cf2b672eb
X-Patchwork-Hint: ignore
Message-Id: <20230222161022.A77798675D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.11.x] package,
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

commit: https://git.buildroot.net/buildroot/commit/?id=42743a9503e83365ffa7b57f4423527cf2b672eb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.11.x

deamon -> daemon

At same time, in Config.in.legacy fix other typos in the same help text:
spae -> space
monolitic -> monolithic

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 6a9feaabbce4f21dd2a688d35a5027cb0e2a7a22)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in.legacy           | 4 ++--
 package/ngircd/Config.in   | 2 +-
 package/rp-pppoe/Config.in | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 40bbcd41ba..896e75a9d6 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -4338,8 +4338,8 @@ config BR2_PACKAGE_OPENPOWERLINK_LIBPCAP
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
