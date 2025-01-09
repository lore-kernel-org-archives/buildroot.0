Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36457E77197
	for <buildroot@archiver.kernel.org>; Thu,  9 Jan 2025 13:43:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B68654049E;
	Thu,  9 Jan 2025 13:43:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Pw05w_--ud6e; Thu,  9 Jan 2025 13:43:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7953A4050D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7953A4050D;
	Thu,  9 Jan 2025 13:43:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9F9BF76C
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 13:43:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8DFD980F03
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 13:43:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xwz-pQNXPBxo for <buildroot@buildroot.org>;
 Thu,  9 Jan 2025 13:43:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6E66C80ED6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6E66C80ED6
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 13:43:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 578A7842BE; Thu,  9 Jan 2025 13:43:52 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 9 Jan 2025 14:43:13 +0100
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 7fd80897a121329e2c8238ad629ae90e470218e2
X-Git-Newrev: c9620ac37e658d177821be85b4c9484e71e19710
X-Patchwork-Hint: ignore
Message-Id: <20250109134352.578A7842BE@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] Update for 2024.02.10
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

commit: https://git.buildroot.net/buildroot/commit/?id=c9620ac37e658d177821be85b4c9484e71e19710
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                  | 29 +++++++++++++++++++++++++++++
 Makefile                 |  4 ++--
 support/misc/Vagrantfile |  2 +-
 3 files changed, 32 insertions(+), 3 deletions(-)

diff --git a/CHANGES b/CHANGES
index 23b490d60b..445375b834 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,32 @@
+2024.02.10, released January 9th, 2025
+
+	Important / security related fixes.
+
+        Infrastructure:
+
+        - Ensure CONFIG_TRIM_UNUSED_KSYMS is disabled when building
+          external Linux kernel modules
+
+	Updated/fixed packages: apr, bc, cdrkit, cryptodev-linux,
+	freeipmi, gdb, gnupg2, gnutls, go, gobject-introspection,
+	grub2, gst-omx, gst1-devtools, gst1-libav, gst1-plugins-bad,
+	gst1-plugins-base, gst1-plugins-good, gst1-plugins-ugly,
+	gst1-python, gst1-rtsp-server, gst1-vaapi, gstreamer1,
+	gstreamer1-editing-services, iperf3, libcurl, libsha1,
+	libsndfile, libsoup3, libvirt, libxcrypt, linux, linux-pam,
+	mosquitto, netatalk, nettle, octave, opensc, perl, pixman,
+	procps-ng, python-django, python3, qt6base, samba4, skeleton,
+	subversion, tzdata, v4l2loopback, webkitgtk, wget, wireshark,
+	wpewebkit, zic
+
+	Issues resolved:
+        - gdb package doesn't have a licence hash in the gdb.hash file
+          https://gitlab.com/buildroot.org/buildroot/-/issues/66
+	- package/libsha1: Build failure with GCC 14 [-Wimplicit-int]
+	  https://gitlab.com/buildroot.org/buildroot/-/issues/69
+	- [2024.02.9] Mosquitto doesn't build
+	  https://gitlab.com/buildroot.org/buildroot/-/issues/78
+
 2024.02.9, released December 8th, 2024
 
 	Important / security related fixes.
diff --git a/Makefile b/Makefile
index 0546a9b1a9..2fe31201f8 100644
--- a/Makefile
+++ b/Makefile
@@ -90,9 +90,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2024.02.9
+export BR2_VERSION := 2024.02.10
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1733691000
+BR2_VERSION_EPOCH = 1736430000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/support/misc/Vagrantfile b/support/misc/Vagrantfile
index 07959ea064..b857241c47 100644
--- a/support/misc/Vagrantfile
+++ b/support/misc/Vagrantfile
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Buildroot version to use
-RELEASE='2024.02.9'
+RELEASE='2024.02.10'
 
 ### Change here for more memory/cores ###
 VM_MEMORY=2048
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
