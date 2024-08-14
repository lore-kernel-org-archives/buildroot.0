Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BB4DC3DA4A
	for <buildroot@archiver.kernel.org>; Wed, 14 Aug 2024 11:32:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 34254811D3;
	Wed, 14 Aug 2024 11:32:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9Ed_5xsIFsQh; Wed, 14 Aug 2024 11:32:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1E4FC811D6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1E4FC811D6;
	Wed, 14 Aug 2024 11:32:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E84C31BF616
 for <buildroot@lists.busybox.net>; Wed, 14 Aug 2024 11:32:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E251560622
 for <buildroot@lists.busybox.net>; Wed, 14 Aug 2024 11:32:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5zLMm0wrCqWn for <buildroot@lists.busybox.net>;
 Wed, 14 Aug 2024 11:32:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C767B605FC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C767B605FC
 for <buildroot@buildroot.org>; Wed, 14 Aug 2024 11:32:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B15B485BA2; Wed, 14 Aug 2024 11:32:53 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 14 Aug 2024 13:32:31 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 82d261cfe3dd670b7c6b2c7bca70ee962bead956
X-Git-Newrev: 6c084947ab46aa8064947b85ea6168b12d550265
X-Patchwork-Hint: ignore
Message-Id: <20240814113253.B15B485BA2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] Update for 2024.02.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=6c084947ab46aa8064947b85ea6168b12d550265
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                  | 22 ++++++++++++++++++++++
 Makefile                 |  4 ++--
 support/misc/Vagrantfile |  2 +-
 3 files changed, 25 insertions(+), 3 deletions(-)

diff --git a/CHANGES b/CHANGES
index 8788916288..64d89277f2 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,25 @@
+2024.02.5, released August 14th, 2024
+
+	Important / security related fixes.
+
+	Various minor improvements to utils/check-package
+
+	Defconfigs: Add download hashes for chromebook-elm,
+	chromebook-snow and stm32mp157a_dk1
+
+	Updated/fixed packages: bitcoin, boost, btrfs-progs, c-ares,
+	cdrkit, check, containerd, directfb, ed, exim, fwts, gcc, gdb,
+	go, kexec, libarchive, libgeos, libressl, mupdf, nodejs,
+	ntpsec, octave, openssh, pppd, python-mupdf,
+	python-ruamel-yaml, qt5webkit, rauc-hawkbit-updater, snappy,
+	squid, sunxi-tools, syslinux, systemd, tcf-agent, ubus,
+	util-linux, uvw, webkitgtk, wolfssl, wpewebkit, x265,
+	xlib_libxshmfence, xvisor
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#15231: gcc --help -v doesn't work correctly with gcc>=10 and..
+
 2024.02.4, released July 13th, 2024
 
 	Important / security related fixes.
diff --git a/Makefile b/Makefile
index 5e054ca2dc..4d005cd06f 100644
--- a/Makefile
+++ b/Makefile
@@ -90,9 +90,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2024.02.4
+export BR2_VERSION := 2024.02.5
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1720873000
+BR2_VERSION_EPOCH = 1723635000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/support/misc/Vagrantfile b/support/misc/Vagrantfile
index 90d097bc4f..ca7e161e1b 100644
--- a/support/misc/Vagrantfile
+++ b/support/misc/Vagrantfile
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Buildroot version to use
-RELEASE='2024.02.4'
+RELEASE='2024.02.5'
 
 ### Change here for more memory/cores ###
 VM_MEMORY=2048
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
