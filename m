Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C623AC433EF
	for <buildroot@archiver.kernel.org>; Wed,  6 Apr 2022 15:53:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8612183409;
	Wed,  6 Apr 2022 15:53:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 61sluP180xXn; Wed,  6 Apr 2022 15:53:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9958783396;
	Wed,  6 Apr 2022 15:53:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5054B1BF59E
 for <buildroot@lists.busybox.net>; Wed,  6 Apr 2022 15:53:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 42E9D403AC
 for <buildroot@lists.busybox.net>; Wed,  6 Apr 2022 15:53:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id esgeNzJ3jTbo for <buildroot@lists.busybox.net>;
 Wed,  6 Apr 2022 15:53:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id ABD0040321
 for <buildroot@buildroot.org>; Wed,  6 Apr 2022 15:53:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id D929C83658; Wed,  6 Apr 2022 15:43:47 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 6 Apr 2022 17:51:40 +0200
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: b927353cb6606c415566c3a83b12b4d14ae0bbed
X-Git-Newrev: ef68ba43d965528bd5c622407dfb9a5e3b343493
X-Patchwork-Hint: ignore
Message-Id: <20220406154347.D929C83658@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] Update for 2021.02.12
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

commit: https://git.buildroot.net/buildroot/commit/?id=ef68ba43d965528bd5c622407dfb9a5e3b343493
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                  | 11 +++++++++++
 Makefile                 |  4 ++--
 support/misc/Vagrantfile |  2 +-
 3 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/CHANGES b/CHANGES
index c9822cdf80..a9973a9076 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,14 @@
+2021.02.12, released April 6th, 2022
+
+	Important / security related fixes.
+
+	pkg-stats: Limit memory use for CPE matching
+
+	Updated/fixed packages: gdk-pixbuf, jack2, libzlib, matio,
+	nbd, netatalk, opus, python-paramiko, python-treq,
+	python-twisted, spidev_test, unbound, urandom-scripts, vim,
+	wireshark, zlib-ng, zziplib
+
 2021.02.11, released March 25th, 2022
 
 	Important / security related fixes.
diff --git a/Makefile b/Makefile
index a3c5802d55..731d784ffb 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2021.02.11
+export BR2_VERSION := 2021.02.12
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1648206000
+BR2_VERSION_EPOCH = 1649260000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/support/misc/Vagrantfile b/support/misc/Vagrantfile
index 7e97a277ea..cfbe7a1cf8 100644
--- a/support/misc/Vagrantfile
+++ b/support/misc/Vagrantfile
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Buildroot version to use
-RELEASE='2021.02.11'
+RELEASE='2021.02.12'
 
 ### Change here for more memory/cores ###
 VM_MEMORY=2048
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
