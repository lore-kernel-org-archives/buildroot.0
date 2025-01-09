Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE47EC282D0
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:52:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A53D070356;
	Fri, 28 Feb 2025 16:52:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iCFzCnBbPYc3; Fri, 28 Feb 2025 16:52:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B333470384
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B333470384;
	Fri, 28 Feb 2025 16:52:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0B1BE711
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:36:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 06A9E42528
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SRPrQam_X_rH for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:30:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3BFD242525
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3BFD242525
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2F40984C4E; Fri, 28 Feb 2025 16:30:00 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 9 Jan 2025 15:03:36 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 5c0a91f7293523254e9c48667df4468370fda58d
X-Git-Newrev: ccd83cef2fa9a4be534fc2ac737812a1b2fd8dce
X-Patchwork-Hint: ignore
Message-Id: <20250228163000.2F40984C4E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] Update for 2024.02.10
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

commit: https://git.buildroot.net/buildroot/commit/?id=ccd83cef2fa9a4be534fc2ac737812a1b2fd8dce
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit c9620ac37e658d177821be85b4c9484e71e19710)
[Peter: drop Makefile/Vagrantfile changes]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/CHANGES b/CHANGES
index 3c20d6bc9e..5e67496b9d 100644
--- a/CHANGES
+++ b/CHANGES
@@ -488,6 +488,35 @@
         #16036: android-tools version is too old
         #16075: Cannot use linux kernel extensions from external tree..
 
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
