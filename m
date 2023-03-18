Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9065DC61DA4
	for <buildroot@archiver.kernel.org>; Sat, 18 Mar 2023 13:29:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E937D82093;
	Sat, 18 Mar 2023 13:29:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E937D82093
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YLLzko1vP1jC; Sat, 18 Mar 2023 13:29:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 206BB82089;
	Sat, 18 Mar 2023 13:29:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 206BB82089
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EEC021BF341
 for <buildroot@lists.busybox.net>; Sat, 18 Mar 2023 13:29:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C96BB40399
 for <buildroot@lists.busybox.net>; Sat, 18 Mar 2023 13:29:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C96BB40399
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 35tFxh129mkY for <buildroot@lists.busybox.net>;
 Sat, 18 Mar 2023 13:29:41 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C9FF7400B9
 for <buildroot@buildroot.org>; Sat, 18 Mar 2023 13:29:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C9FF7400B9
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B5D7887072; Sat, 18 Mar 2023 13:29:41 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 18 Mar 2023 14:29:11 +0100
X-Git-Refname: refs/heads/2022.11.x
X-Git-Oldrev: 141d359a105f3cacd0d1ec4878d7de3940d578c0
X-Git-Newrev: 904c8b538e71fcc565f39b72d93b9dd6c67211c0
X-Patchwork-Hint: ignore
Message-Id: <20230318132941.B5D7887072@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.11.x] Update for 2022.11.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=904c8b538e71fcc565f39b72d93b9dd6c67211c0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.11.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                  | 25 +++++++++++++++++++++++++
 Makefile                 |  4 ++--
 support/misc/Vagrantfile |  2 +-
 3 files changed, 28 insertions(+), 3 deletions(-)

diff --git a/CHANGES b/CHANGES
index 247c8c7233..874324f7d8 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,28 @@
+2022.11.3, released March 18th, 2023
+
+	Important / security related fixes.
+
+	Updated/fixed packages: ace, apache, apr, apr-util, asterisk,
+	at91dataflashboot, audit, bash, bind, bridge-utils, clamav,
+	dmalloc, efivar, erlang, exfat, exfat-utils, f2fs-tools, gcc,
+	gdal, gensio, gerbera, git, glslsandbox-player, go, haproxy,
+	hawktracer, intel-gmmlib, ipmiutil, less, libblockdev,
+	libcurl, libev, libgcrypt, libglfw, libmad, libmdbx,
+	libmodsecurity, libolm, libpjsip, lirc-tools,
+	lttng-babeltrace, mender, mpv, mutt, mxs-bootlets, netsurf,
+	ntpsec, nut, opensbi, opus, paho-mqtt-c, pcm-tools, php,
+	pistache, proftpd, proxychains-ng, pulseaudio,
+	python-cryptography, python-django, python-m2crypto,
+	python-numpy, python-werkzeug, qemu, quazip, quickjs,
+	rockchip-mali, rsync, s6-linux-utils, sudo, tiff, uacme, uqmi,
+	webkitgtk, wilc-driver, wpa_supplicant, wpewebkit,
+	xdriver_xf86-video-qxl, znc
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#15306: glibc build fails in Docker container
+	#15361: Buildroot linking error on Apple Silicon
+
 2022.11.2, released March 1st, 2023
 
 	Important / security related fixes.
diff --git a/Makefile b/Makefile
index 76faedb95e..4d74a9cab4 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2022.11.2
+export BR2_VERSION := 2022.11.3
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1677686000
+BR2_VERSION_EPOCH = 1679146000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/support/misc/Vagrantfile b/support/misc/Vagrantfile
index 63806155a8..cf2202abd0 100644
--- a/support/misc/Vagrantfile
+++ b/support/misc/Vagrantfile
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Buildroot version to use
-RELEASE='2022.11.2'
+RELEASE='2022.11.3'
 
 ### Change here for more memory/cores ###
 VM_MEMORY=2048
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
