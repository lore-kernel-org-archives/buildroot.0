Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF9AAC282D0
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:52:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 61E8842F0E;
	Fri, 28 Feb 2025 16:52:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 29oSpDdh_sLw; Fri, 28 Feb 2025 16:52:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 16EEF4EF4F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 16EEF4EF4F;
	Fri, 28 Feb 2025 16:52:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1258F711
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:36:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0EACA4199F
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zxGgyh2yLErU for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:30:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 641A541800
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 641A541800
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5D03D84C4E; Fri, 28 Feb 2025 16:30:00 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 9 Jan 2025 16:05:08 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 9d3d12b6b5996e2a6f6bb90908613036cf70d6c1
X-Git-Newrev: c04ba4b58090ccf5d1e0b62f992c75e9af1fe98f
X-Patchwork-Hint: ignore
Message-Id: <20250228163000.5D03D84C4E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] Update for 2024.11.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=c04ba4b58090ccf5d1e0b62f992c75e9af1fe98f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 31462e41696fb7a5e65679fd7c944cde95142da6)
[Peter: drop Makefile change]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                  | 32 ++++++++++++++++++++++++++++++++
 support/misc/Vagrantfile |  2 +-
 2 files changed, 33 insertions(+), 1 deletion(-)

diff --git a/CHANGES b/CHANGES
index 5e67496b9d..272db0af69 100644
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
