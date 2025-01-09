Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D913E77197
	for <buildroot@archiver.kernel.org>; Thu,  9 Jan 2025 14:44:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2225380BDD;
	Thu,  9 Jan 2025 14:44:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6B2wDIUC6ASx; Thu,  9 Jan 2025 14:44:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 39FCB81376
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 39FCB81376;
	Thu,  9 Jan 2025 14:44:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 989EC942
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 14:44:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 793564065C
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 14:44:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TfXABWawd9Wv for <buildroot@buildroot.org>;
 Thu,  9 Jan 2025 14:44:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2C604406BC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2C604406BC
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 14:44:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 159B28426F; Thu,  9 Jan 2025 14:44:11 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 9 Jan 2025 15:43:35 +0100
X-Git-Refname: refs/heads/2024.11.x
X-Git-Oldrev: b47a466bbd0a66f3f1737b6ec38b5a5962980346
X-Git-Newrev: 31462e41696fb7a5e65679fd7c944cde95142da6
X-Patchwork-Hint: ignore
Message-Id: <20250109144411.159B28426F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.11.x] Update for 2024.11.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=31462e41696fb7a5e65679fd7c944cde95142da6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.11.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                  | 32 ++++++++++++++++++++++++++++++++
 Makefile                 |  4 ++--
 support/misc/Vagrantfile |  2 +-
 3 files changed, 35 insertions(+), 3 deletions(-)

diff --git a/CHANGES b/CHANGES
index cf49ce56b3..72da8d9084 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,35 @@
+2024.11.1, released January 9th, 2025
+
+	Important / security related fixes.
+
+        Infrastructure:
+
+        - Ensure CONFIG_TRIM_UNUSED_KSYMS is disabled when building
+          external Linux kernel modules
+
+	Updated/fixed packages: apr, bc, bluez5_utils, c-icap,
+	cryptodev-linux, dahdi-linux, dpdk, freeipmi, gdb, gnupg2,
+	gnuplot, gnutls, go, gobject-introspection, grub2, gst-omx,
+	gst1-devtools, gst1-libav, gst1-plugins-bad,
+	gst1-plugins-base, gst1-plugins-good, gst1-plugins-ugly,
+	gst1-python, gst1-rtsp-server, gst1-vaapi, gstreamer1,
+	gstreamer1-editing-services, igt-gpu-tools, iperf3, libcurl,
+	libsha1, libsndfile, libsoup3, libvirt, libxcrypt, libxml2,
+	libzenoh-pico, linux, linux-pam, netatalk, nettle, octave,
+	opensc, perl, php, pixman, polkit, procps-ng,
+	python-autocommand, python-django, python3, quickjs, samba4,
+	skeleton, subversion, ti-k3-r5-loader, tzdata, v4l2loopback,
+	wayland, webkitgtk, weston, wget, wireshark, wpewebkit,
+	xr819-xradio, xxhash, zfs, zic
+
+	Issues resolved:
+	- bluetooth.service cannot connect to D-BUS
+	  https://gitlab.com/buildroot.org/buildroot/-/issues/65
+        - gdb package doesn't have a licence hash in the gdb.hash file
+          https://gitlab.com/buildroot.org/buildroot/-/issues/66
+	- package/libsha1: Build failure with GCC 14 [-Wimplicit-int]
+	  https://gitlab.com/buildroot.org/buildroot/-/issues/69
+
 2024.11, released December 8th, 2024
 
 	Various fixes.
diff --git a/Makefile b/Makefile
index 764148f715..7f61909aff 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2024.11
+export BR2_VERSION := 2024.11.1
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1733653000
+BR2_VERSION_EPOCH = 1736433000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/support/misc/Vagrantfile b/support/misc/Vagrantfile
index 00592a7839..add08ccae7 100644
--- a/support/misc/Vagrantfile
+++ b/support/misc/Vagrantfile
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Buildroot version to use
-RELEASE='2024.11'
+RELEASE='2024.11.1'
 
 ### Change here for more memory/cores ###
 VM_MEMORY=2048
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
