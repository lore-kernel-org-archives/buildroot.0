Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04AF5C3DA79
	for <buildroot@archiver.kernel.org>; Mon, 15 Jan 2024 20:03:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 99BCF83C1C;
	Mon, 15 Jan 2024 20:03:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 99BCF83C1C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C7nAfGQPpVbT; Mon, 15 Jan 2024 20:03:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DAE6F83BE9;
	Mon, 15 Jan 2024 20:03:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DAE6F83BE9
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 30E641BF424
 for <buildroot@lists.busybox.net>; Mon, 15 Jan 2024 20:03:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 09E9383BCD
 for <buildroot@lists.busybox.net>; Mon, 15 Jan 2024 20:03:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 09E9383BCD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vjd-boaqY7hq for <buildroot@lists.busybox.net>;
 Mon, 15 Jan 2024 20:03:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 362C283BAC
 for <buildroot@buildroot.org>; Mon, 15 Jan 2024 20:03:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 362C283BAC
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 21088861DF; Mon, 15 Jan 2024 20:03:36 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 15 Jan 2024 21:01:07 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: dd22e808c07e16a1f4b224925491cd7e8a038a1a
X-Git-Newrev: 1cf91a570e9213e6d2676a7403bae5dae8925a00
X-Patchwork-Hint: ignore
Message-Id: <20240115200336.21088861DF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Update for 2023.02.9
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

commit: https://git.buildroot.net/buildroot/commit/?id=1cf91a570e9213e6d2676a7403bae5dae8925a00
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit df57de12f9f749c6575db8e05592a334646c2aa6)
[Peter: drop Makefile/Vagrantfile changes]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/CHANGES b/CHANGES
index 3ab69362c3..f3c38e7d03 100644
--- a/CHANGES
+++ b/CHANGES
@@ -548,6 +548,38 @@
 	#15376: Libiconv config
 	#15461: QtVirtualKeyboard segfaults
 
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
