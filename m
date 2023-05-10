Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63AC1C77B7D
	for <buildroot@archiver.kernel.org>; Wed, 10 May 2023 20:35:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 035A661148;
	Wed, 10 May 2023 20:35:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 035A661148
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AHRJi-yq2RhV; Wed, 10 May 2023 20:35:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2CDD460FCF;
	Wed, 10 May 2023 20:35:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2CDD460FCF
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3D5931BF349
 for <buildroot@lists.busybox.net>; Wed, 10 May 2023 20:35:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1E6EC841DF
 for <buildroot@lists.busybox.net>; Wed, 10 May 2023 20:35:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1E6EC841DF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xRJ2LohldYiQ for <buildroot@lists.busybox.net>;
 Wed, 10 May 2023 20:35:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id DEBB2841D8
 for <buildroot@buildroot.org>; Wed, 10 May 2023 20:35:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DEBB2841D8
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C8EDA862ED; Wed, 10 May 2023 20:35:19 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 10 May 2023 22:27:32 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6d1af313c3415e8bfb1bff6642d005ca51575dbb
X-Git-Newrev: 70b37018400fe5d2c0efc19c34958220e965f689
X-Patchwork-Hint: ignore
Message-Id: <20230510203519.C8EDA862ED@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Update for 2023.02.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=70b37018400fe5d2c0efc19c34958220e965f689
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 8025cfad1055ad23a5935b7a69580ebc2b003e1e)
[Peter: drop Makefile hunk]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                  | 36 ++++++++++++++++++++++++++++++++++++
 support/misc/Vagrantfile |  2 +-
 2 files changed, 37 insertions(+), 1 deletion(-)

diff --git a/CHANGES b/CHANGES
index c4bf9d0ad9..81533552a7 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,39 @@
+2023.02.1, released May 9th, 2023
+
+	Important / security related fixes.
+
+	Infrastucture:
+	- go: Ensure go versions of os/user and net are used for
+          static builds so CGO is not used
+
+	- rust / cargo: Correctly split up rust flags for host and
+          target builds
+
+	Defconfigs: Olimex a20 olinuxino lime*: Bring up network at
+	boot, stmf469 disco sd: Lock U-Boot version
+
+	Updated/fixed packages: agentpp, apache, bluez5_utils,
+	ca-certificates, containerd, coremark, dcron, dnsmasq,
+	docker-cli, docker-engine, efivar, eudev, ffmpeg, flann,
+	fluidsynth, git, go, gst-omx, gst1-devtools, gst1-libav,
+	gst1-plugins-bad, gst1-plugins-base, gst1-plugins-good,
+	gst1-plugins-ugly, gst1-python, gst1-rtsp-server, gst1-vaapi,
+	gstreamer1, gstreamer1-editing-services, intel-microcode,
+	kexec, libcurl, libite, libgtk3, libmicrohttpd, libxml2,
+	linux-tools, lua, mali-driver, matio, mdadm, nginx, openocd,
+	openssh, php, poppler, postgresql, python-web2py, qt6base,
+	readline, rtl8189fs, rtl8723ds, rtl8812au-aircrack-ng, runc,
+	rust, rust-bin, s390-tools, samba4, sdl2, snmppp, sudo,
+	systemd, tcpdump, uclibc, vim, webkitgtk, wireshark,
+	wpewebkit, xr819-radio, xserver_xorg-server, zeek
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#14356: cronstamp jobs are not performed with bumped version of...
+	#15306: glibc build fails in Docker container
+	#15376: Libiconv config
+	#15461: QtVirtualKeyboard segfaults
+
 2023.02, released March 12th, 2023
 
 	Fixes all over the tree.
diff --git a/support/misc/Vagrantfile b/support/misc/Vagrantfile
index a1de170749..d1b75ed405 100644
--- a/support/misc/Vagrantfile
+++ b/support/misc/Vagrantfile
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Buildroot version to use
-RELEASE='2023.02'
+RELEASE='2023.02.1'
 
 ### Change here for more memory/cores ###
 VM_MEMORY=2048
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
