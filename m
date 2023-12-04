Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 795C1C4167B
	for <buildroot@archiver.kernel.org>; Mon,  4 Dec 2023 13:06:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F2EC081EB4;
	Mon,  4 Dec 2023 13:06:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F2EC081EB4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2aVJxwXVrHXS; Mon,  4 Dec 2023 13:06:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4E7DA81E8F;
	Mon,  4 Dec 2023 13:06:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4E7DA81E8F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8BD041BF33E
 for <buildroot@lists.busybox.net>; Mon,  4 Dec 2023 13:06:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6A28940979
 for <buildroot@lists.busybox.net>; Mon,  4 Dec 2023 13:06:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6A28940979
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c7isyNI7UUON for <buildroot@lists.busybox.net>;
 Mon,  4 Dec 2023 13:06:46 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 131AB40960
 for <buildroot@buildroot.org>; Mon,  4 Dec 2023 13:06:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 131AB40960
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F1AFA87973; Mon,  4 Dec 2023 13:06:45 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 4 Dec 2023 14:06:08 +0100
X-Git-Refname: refs/heads/2023.08.x
X-Git-Oldrev: 6b68acec970b841acebfde492b59b1026d248d74
X-Git-Newrev: 5abe7bd726493acd0b9ea4600b7a33ccfaefce2f
X-Patchwork-Hint: ignore
Message-Id: <20231204130645.F1AFA87973@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.08.x] Update for 2023.08.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=5abe7bd726493acd0b9ea4600b7a33ccfaefce2f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.08.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                  | 18 ++++++++++++++++++
 Makefile                 |  4 ++--
 support/misc/Vagrantfile |  2 +-
 3 files changed, 21 insertions(+), 3 deletions(-)

diff --git a/CHANGES b/CHANGES
index e9df7879b7..256ff78a95 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,21 @@
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
diff --git a/Makefile b/Makefile
index ff33a3adfc..6ca6a15324 100644
--- a/Makefile
+++ b/Makefile
@@ -90,9 +90,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2023.08.3
+export BR2_VERSION := 2023.08.4
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1699976000
+BR2_VERSION_EPOCH = 1701695000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/support/misc/Vagrantfile b/support/misc/Vagrantfile
index 250a8810e5..8757304f89 100644
--- a/support/misc/Vagrantfile
+++ b/support/misc/Vagrantfile
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Buildroot version to use
-RELEASE='2023.08.3'
+RELEASE='2023.08.4'
 
 ### Change here for more memory/cores ###
 VM_MEMORY=2048
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
