Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3278ED3C53F
	for <buildroot@archiver.kernel.org>; Mon, 21 Oct 2024 06:41:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AF2DC40076;
	Mon, 21 Oct 2024 06:41:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AI4MxaYy7nVe; Mon, 21 Oct 2024 06:41:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5D3D44009A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5D3D44009A;
	Mon, 21 Oct 2024 06:41:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3034171F
 for <buildroot@buildroot.org>; Mon, 21 Oct 2024 06:41:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1DAD7600B8
 for <buildroot@buildroot.org>; Mon, 21 Oct 2024 06:41:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sHgdJ4p8TUNS for <buildroot@buildroot.org>;
 Mon, 21 Oct 2024 06:41:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1C95660630
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1C95660630
 for <buildroot@buildroot.org>; Mon, 21 Oct 2024 06:41:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1240F860F6; Mon, 21 Oct 2024 06:41:13 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 21 Oct 2024 08:34:41 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 71d2c23b11d4b21644a6597338aa39368b01fdf7
X-Git-Newrev: 639423f4db5953c7bffb73773f2b5332b6852b5e
X-Patchwork-Hint: ignore
Message-Id: <20241021064113.1240F860F6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Update for 2024.08.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=639423f4db5953c7bffb73773f2b5332b6852b5e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit c7618236c133fd7ad4cca084968707629c8e2fd2)
[Peter: drop Makefile change]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                  | 38 ++++++++++++++++++++++++++++++++++++++
 support/misc/Vagrantfile |  2 +-
 2 files changed, 39 insertions(+), 1 deletion(-)

diff --git a/CHANGES b/CHANGES
index 4f668a2365..9903666a51 100644
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
