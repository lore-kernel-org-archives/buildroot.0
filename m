Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 794CFC7EE22
	for <buildroot@archiver.kernel.org>; Tue,  9 May 2023 20:39:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 12E5A40A93;
	Tue,  9 May 2023 20:39:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 12E5A40A93
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 85FFZK4hnVix; Tue,  9 May 2023 20:39:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 31A4840242;
	Tue,  9 May 2023 20:39:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 31A4840242
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D40081BF2FF
 for <buildroot@lists.busybox.net>; Tue,  9 May 2023 20:39:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ACB21600C9
 for <buildroot@lists.busybox.net>; Tue,  9 May 2023 20:39:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ACB21600C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 92cfNm2TL4NB for <buildroot@lists.busybox.net>;
 Tue,  9 May 2023 20:39:35 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A455D600C6
 for <buildroot@buildroot.org>; Tue,  9 May 2023 20:39:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A455D600C6
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 84C47860F7; Tue,  9 May 2023 20:39:35 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 9 May 2023 22:38:47 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 9446c4a7b6836fa275917de6d72678bb12079cfb
X-Git-Newrev: 8025cfad1055ad23a5935b7a69580ebc2b003e1e
X-Patchwork-Hint: ignore
Message-Id: <20230509203935.84C47860F7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] Update for 2023.02.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=8025cfad1055ad23a5935b7a69580ebc2b003e1e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                  | 36 ++++++++++++++++++++++++++++++++++++
 Makefile                 |  4 ++--
 support/misc/Vagrantfile |  2 +-
 3 files changed, 39 insertions(+), 3 deletions(-)

diff --git a/CHANGES b/CHANGES
index a03a4876b8..55dcc830de 100644
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
diff --git a/Makefile b/Makefile
index 634780b421..000f1dcec0 100644
--- a/Makefile
+++ b/Makefile
@@ -90,9 +90,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2023.02
+export BR2_VERSION := 2023.02.1
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1678652000
+BR2_VERSION_EPOCH = 1683664000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
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
