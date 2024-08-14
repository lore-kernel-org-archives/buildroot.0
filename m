Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C798DC52D7F
	for <buildroot@archiver.kernel.org>; Wed, 14 Aug 2024 08:55:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 69BBF403A6;
	Wed, 14 Aug 2024 08:55:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XvPcB2BTnqt3; Wed, 14 Aug 2024 08:55:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 217FC403A7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 217FC403A7;
	Wed, 14 Aug 2024 08:55:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5835B1BF310
 for <buildroot@lists.busybox.net>; Wed, 14 Aug 2024 08:55:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 25008409B5
 for <buildroot@lists.busybox.net>; Wed, 14 Aug 2024 08:55:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q5byG3JY5vC3 for <buildroot@lists.busybox.net>;
 Wed, 14 Aug 2024 08:55:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9FF9F409B3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9FF9F409B3
 for <buildroot@buildroot.org>; Wed, 14 Aug 2024 08:55:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 96FE185AB6; Wed, 14 Aug 2024 08:55:17 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 14 Aug 2024 10:54:30 +0200
X-Git-Refname: refs/heads/2024.05.x
X-Git-Oldrev: ea282e0e5f11dcd0f9925766decb88a4306a8ef8
X-Git-Newrev: 078f99a31528e27b97cc49d51bca9da95a6a036c
X-Patchwork-Hint: ignore
Message-Id: <20240814085517.96FE185AB6@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.05.x] Update for 2024.05.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=078f99a31528e27b97cc49d51bca9da95a6a036c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.05.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                  | 23 +++++++++++++++++++++++
 Makefile                 |  4 ++--
 support/misc/Vagrantfile |  2 +-
 3 files changed, 26 insertions(+), 3 deletions(-)

diff --git a/CHANGES b/CHANGES
index 2d97ce2a3f..156d0550b8 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,26 @@
+2024.05.2, released August 14th, 2024
+
+	Important / security related fixes.
+
+	Various minor improvements to utils/check-package
+
+	Defconfigs: Add download hashes for chromebook-elm,
+	chromebook-snow and stm32mp157a_dk1
+
+	Updated/fixed packages: android-tools, bcc, bitcoin, boost,
+	btrfs-progs, c-ares, cdrkit, check, containerd, directfb,
+	dump1090, ed, exim, fail2ban, frotz, fwts, gcc, gdb, go, gpm,
+	kexec, libarchive, libgeos, libressl, llvm, mupdf, ncftp,
+	nodejs, ntpsec, octave, openssh, pppd, python-mupdf,
+	python-ruamel-yaml, qt5webkit, rawk-hawkbit-updater,
+	rtl8188eu, snappy, squid, sunxi-tools, syslinux, systemd,
+	tcf-agent, tftpd, ubus, util-linux, uvw, webkitgtk, wolfssl,
+	wpewebkit, x265, xlib_libxshmfence, xvisor
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#15231: gcc --help -v doesn't work correctly with gcc>=10 and..
+
 2024.05.1, released July 13th, 2024
 
 	Important / security related fixes.
diff --git a/Makefile b/Makefile
index d616c08c0a..ebf8bb8af1 100644
--- a/Makefile
+++ b/Makefile
@@ -90,9 +90,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2024.05.1
+export BR2_VERSION := 2024.05.2
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1720871000
+BR2_VERSION_EPOCH = 1723625000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/support/misc/Vagrantfile b/support/misc/Vagrantfile
index b49ea47425..1f4c1b85e2 100644
--- a/support/misc/Vagrantfile
+++ b/support/misc/Vagrantfile
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Buildroot version to use
-RELEASE='2024.05.1'
+RELEASE='2024.05.2'
 
 ### Change here for more memory/cores ###
 VM_MEMORY=2048
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
