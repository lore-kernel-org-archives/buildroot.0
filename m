Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEE4CC433EF
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 09:52:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6746461143;
	Sun, 24 Jul 2022 09:52:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6746461143
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MStL2t4XhyQk; Sun, 24 Jul 2022 09:52:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 69D6F61004;
	Sun, 24 Jul 2022 09:52:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 69D6F61004
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AC8981BF2B9
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 09:52:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 867D961004
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 09:52:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 867D961004
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PGe9Qe3YAFBJ for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 09:52:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A09576076A
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 09:52:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A09576076A
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id C10AE856C9; Sun, 24 Jul 2022 09:38:49 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 24 Jul 2022 11:44:28 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: bd938352ddc0a9e1fbf0be995fb79eabd0cb0594
X-Git-Newrev: 2e399893b4f60f1e103228df6e4439d4e4ac3dd5
X-Patchwork-Hint: ignore
Message-Id: <20220724093849.C10AE856C9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] Update for 2022.05.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=2e399893b4f60f1e103228df6e4439d4e4ac3dd5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                  | 32 ++++++++++++++++++++++++++++++++
 Makefile                 |  4 ++--
 support/misc/Vagrantfile |  2 +-
 3 files changed, 35 insertions(+), 3 deletions(-)

diff --git a/CHANGES b/CHANGES
index 801af5b950..13f3a78ab3 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,35 @@
+2022.05.1, released July 24th, 2022
+
+	Important / security related fixes.
+
+	Disable big endian no-mmu on ARM as it is not supported by
+	elf2flt.
+
+	Tighten dependencies for external Bootlin toolchains to ensure
+	they can only be selected in compatible configurations.
+
+	Support external toolchains without gdbserver.
+
+	Updated/fixed packages: apache, avahi, bdwgc, bind, bpftool,
+	cups, darkhttpd, dmalloc, ecryptfs-utils, fxload, ghostscript,
+	gnutls, gst-omx, gst1-devtools, gst1-libav, gst1-plugins-base,
+	gst1-plugins-bad, gst1-plugins-good, gst1-plugins-ugly,
+	gst1-python, gst1-rtsp-server, gst1-vaapi, gstreamer1,
+	gstreamer1-editing-services, gtest, iptables, keyutils, lcms2,
+	libabseil-cpp, libcamera, libcurl, libeastl, libgpgme,
+	libgtk3, libmdbx, libmediaart, libmodsecurity, libnetconf2,
+	libopenssl, libpjsip, libsamplerate, libsndfile, libtalloc,
+	logrotate, luajit, nginx, noip, paxtest, php, postgresql,
+	procrank_linux, pure-ftpd, python-pillow, qdecoder,
+	rabbitmq-server, rpi-userland, ruby, rustc, sofia-sip,
+	systemd, tcpreplay, tinyproxy, tor, uacme, uboot-tools, vim,
+	watchdogd, webkitgtk, weston, wireguard-linux-compat,
+	wpa_supplicant, wpewebkit, zstd
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#14881: Watchdogd Package missing INSTALL_STAGING
+
 2022.05, released June 6th, 2022
 
 	Fixes all over the tree.
diff --git a/Makefile b/Makefile
index 27b8051710..ef4ccbab14 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2022.05
+export BR2_VERSION := 2022.05.1
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1654546000
+BR2_VERSION_EPOCH = 1658655000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/support/misc/Vagrantfile b/support/misc/Vagrantfile
index 21e3455ae1..69dfb0ca28 100644
--- a/support/misc/Vagrantfile
+++ b/support/misc/Vagrantfile
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Buildroot version to use
-RELEASE='2022.05'
+RELEASE='2022.05.1'
 
 ### Change here for more memory/cores ###
 VM_MEMORY=2048
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
