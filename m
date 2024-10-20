Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E667BD3C92A
	for <buildroot@archiver.kernel.org>; Sun, 20 Oct 2024 13:42:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 681014038B;
	Sun, 20 Oct 2024 13:42:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ErjaYNHUVbbI; Sun, 20 Oct 2024 13:42:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 01FA44035E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 01FA44035E;
	Sun, 20 Oct 2024 13:42:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 24940AF2
 for <buildroot@buildroot.org>; Sun, 20 Oct 2024 13:42:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 136B580C91
 for <buildroot@buildroot.org>; Sun, 20 Oct 2024 13:42:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wpUs9HOYr2Dp for <buildroot@buildroot.org>;
 Sun, 20 Oct 2024 13:42:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ED2C780C29
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id ED2C780C29
 for <buildroot@buildroot.org>; Sun, 20 Oct 2024 13:42:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D7EFA860B6; Sun, 20 Oct 2024 13:42:52 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 20 Oct 2024 15:41:51 +0200
X-Git-Refname: refs/heads/2024.08.x
X-Git-Oldrev: 9c2d88fd4e831c73e025ffa33a4a6b071d976dc9
X-Git-Newrev: c7618236c133fd7ad4cca084968707629c8e2fd2
X-Patchwork-Hint: ignore
Message-Id: <20241020134252.D7EFA860B6@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.08.x] Update for 2024.08.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=c7618236c133fd7ad4cca084968707629c8e2fd2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.08.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                  | 38 ++++++++++++++++++++++++++++++++++++++
 Makefile                 |  4 ++--
 support/misc/Vagrantfile |  2 +-
 3 files changed, 41 insertions(+), 3 deletions(-)

diff --git a/CHANGES b/CHANGES
index 544931921b..5e6140efa0 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,41 @@
+2024.08.1, released October 20th, 2024
+
+	Important / security related fixes.
+
+	Per-package-directories fixes for the .gdbinit file and RPATH
+	fixups for SDK.
+
+	Legal-info: Ensure host-tar and redist directory exists when
+	using override-srcdir, as otherwise the tarball generation
+	(silently) fails.
+
+	utils/check-package: Also check for correct indentation of
+	help lines.
+
+	A large number of typo fixes.
+
+	Defconfigs: imx6slevk: Bump Linux kernel to 6.6.51 to fix
+	build issue with GCC 13
+
+	Updated/fixed packages: asterisk, aubio, bind, busybox, cairo,
+	cryptsetup, cups, expat, ffmpeg, genpart, glibc, gnutls, go,
+	grub2, libarchive, libcurl, libilbc, libpcap, lighttpd, linux,
+	linux-pam, mosquitto, mtd, nginx, php, procps-ng, pure-ftpd,
+	python-django, python3, qt6core5compat, qt6svg, qt6tools,
+	rp-pppoe, samba4, sysklogd, wireplumber, wpewebkit, xenomai
+
+	Issues resolved:
+	- procps-ng: build failure when linking to systemd
+	  https://gitlab.com/buildroot.org/buildroot/-/issues/28
+	- orange pi 2w does not boot
+	  https://gitlab.com/buildroot.org/buildroot/-/issues/36
+	- glibc configure fails on aarch64 with mathvec SVE ACLE error
+	  https://gitlab.com/buildroot.org/buildroot/-/issues/40
+	- Kernel Build from Custom Git Repo fails with hash-error
+	  https://gitlab.com/buildroot.org/buildroot/-/issues/46
+	- package/linux-pam: Remove unneeded flex dependency
+	  https://gitlab.com/buildroot.org/buildroot/-/issues/47
+
 2024.08, released September 6th, 2024
 
 	Various fixes.
diff --git a/Makefile b/Makefile
index a84b83c1a9..4afd15f2c9 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2024.08
+export BR2_VERSION := 2024.08.1
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1725627000
+BR2_VERSION_EPOCH = 1729431000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/support/misc/Vagrantfile b/support/misc/Vagrantfile
index 1155026ee3..25a360d976 100644
--- a/support/misc/Vagrantfile
+++ b/support/misc/Vagrantfile
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Buildroot version to use
-RELEASE='2024.08'
+RELEASE='2024.08.1'
 
 ### Change here for more memory/cores ###
 VM_MEMORY=2048
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
