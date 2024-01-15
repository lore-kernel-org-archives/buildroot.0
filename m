Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD8A9C3DA79
	for <buildroot@archiver.kernel.org>; Mon, 15 Jan 2024 16:37:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 43E8C40003;
	Mon, 15 Jan 2024 16:37:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 43E8C40003
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OBrNPii6FLSE; Mon, 15 Jan 2024 16:37:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3200541829;
	Mon, 15 Jan 2024 16:37:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3200541829
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3C6761BF370
 for <buildroot@lists.busybox.net>; Mon, 15 Jan 2024 16:37:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1F7D741829
 for <buildroot@lists.busybox.net>; Mon, 15 Jan 2024 16:37:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1F7D741829
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X4TMai56o8uc for <buildroot@lists.busybox.net>;
 Mon, 15 Jan 2024 16:37:39 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 672EF40003
 for <buildroot@buildroot.org>; Mon, 15 Jan 2024 16:37:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 672EF40003
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 42C1385FF1; Mon, 15 Jan 2024 16:37:39 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 15 Jan 2024 17:36:58 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: f353b6fd5ddbd3a8ce1aa886d6d4edb1295a4e9b
X-Git-Newrev: df57de12f9f749c6575db8e05592a334646c2aa6
X-Patchwork-Hint: ignore
Message-Id: <20240115163739.42C1385FF1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] Update for 2023.02.9
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

commit: https://git.buildroot.net/buildroot/commit/?id=df57de12f9f749c6575db8e05592a334646c2aa6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                  | 32 ++++++++++++++++++++++++++++++++
 Makefile                 |  4 ++--
 support/misc/Vagrantfile |  2 +-
 3 files changed, 35 insertions(+), 3 deletions(-)

diff --git a/CHANGES b/CHANGES
index 0950ca0013..38b1af8d0c 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,35 @@
+2023.02.9, released January 15th, 2024
+
+	Important / security related fixes.
+
+	Infrastructure:
+
+	- Download: Revert a permission fixup step in the tarball
+	  creation logic, which lead to a hash mismatch issue in two
+	  cargo-vendored packages, ripgrep and sentry-cli.
+
+	- Build: Pass GIT_DIR=. in the environment (through
+	  HOST_MAKE_ENV/TARGET_MAKE_ENV) to the build steps to
+	  workaround packages trying to detect if they are building in
+	  a git checkout and getting confused when building in a sub
+	  directory of a Buildroot git checkout.
+
+	Updated/fixed packages: apcupsd, arm-trusted-firmware, botan,
+	cjson, cups, dropbear, duktape, edk2, exim, faad2, freeswitch,
+	gcc, gdal, gdb, giflib, glibc, go, google-breakpad, gst-omx,
+	gstd, gst1-devtools, gst1-libav, gst1-plugins-bad,
+	gst1-plugins-base, gst1-plugins-good, gst1-plugins-ugly,
+	gst1-python, gst1-rtsp-server, gst1-vaapi, gstreamer1,
+	gstreamer1-editing-services, ipcalc, jq, json-for-modern-cpp,
+	ksmbd-tools, libaio, libcamera, libcap-ng, libcurl, libebml,
+	libgtk3, libiec61850, libraw, libsigsegv, libssh, libssh2,
+	libuev, libwebsockets, liquid-dsp, lvm2, madplay, mesa3d,
+	micropython, mp4v2, opensc, openssh, orc, php, pipewire,
+	postgis, postgresql, proftpd, putty, python-sip,
+	python-werkzeug, rng-tools, shim, squid, strongswan, sway,
+	tinyssh, tor, tree, uftp, valijson, wireshark, wolfssl,
+	xserver_xorg-server, xwayland
+
 2023.02.8, released December 4th, 2023
 
 	Important / security related fixes.
diff --git a/Makefile b/Makefile
index fcd48bdcad..b2183de489 100644
--- a/Makefile
+++ b/Makefile
@@ -90,9 +90,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2023.02.8
+export BR2_VERSION := 2023.02.9
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1701698000
+BR2_VERSION_EPOCH = 1705336000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/support/misc/Vagrantfile b/support/misc/Vagrantfile
index b86ca0f1d1..eb57b77e92 100644
--- a/support/misc/Vagrantfile
+++ b/support/misc/Vagrantfile
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Buildroot version to use
-RELEASE='2023.02.8'
+RELEASE='2023.02.9'
 
 ### Change here for more memory/cores ###
 VM_MEMORY=2048
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
