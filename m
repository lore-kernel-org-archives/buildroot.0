Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1710ECAAD4
	for <buildroot@archiver.kernel.org>; Wed, 31 Aug 2022 20:10:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5D7E98330B;
	Wed, 31 Aug 2022 20:10:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5D7E98330B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SD8LWdWvPfn0; Wed, 31 Aug 2022 20:10:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B37D082B97;
	Wed, 31 Aug 2022 20:10:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B37D082B97
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 080EA1BF422
 for <buildroot@lists.busybox.net>; Wed, 31 Aug 2022 20:10:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E44FF83300
 for <buildroot@lists.busybox.net>; Wed, 31 Aug 2022 20:10:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E44FF83300
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ezME0XOvBf7O for <buildroot@lists.busybox.net>;
 Wed, 31 Aug 2022 20:10:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2C49082B97
 for <buildroot@buildroot.org>; Wed, 31 Aug 2022 20:10:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2C49082B97
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id B93408819D; Wed, 31 Aug 2022 19:54:55 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 31 Aug 2022 22:08:58 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: f05c1f5da4c599dd01a24e1d534a540d56c159d3
X-Git-Newrev: 6c872197f412b011ceefc6fb5ebbb34f2fb00c15
X-Patchwork-Hint: ignore
Message-Id: <20220831195455.B93408819D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] Update for 2022.02.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=6c872197f412b011ceefc6fb5ebbb34f2fb00c15
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                  | 34 ++++++++++++++++++++++++++++++++++
 Makefile                 |  4 ++--
 support/misc/Vagrantfile |  2 +-
 3 files changed, 37 insertions(+), 3 deletions(-)

diff --git a/CHANGES b/CHANGES
index dc5edc1cdf..4d7076e908 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,37 @@
+2022.02.5, released August 31st, 2022
+
+	Important / security related fixes.
+
+	dependencies: Ensure 'cmp' is available on the build host.
+
+	pkg-utils: The KCONFIG_ENABLE_OPT macro used to enforce a specific
+	Kconfig option to be enabled (E.G. for kernel options needed by
+	packages) no longer changes a =m (modular) with =y (built in).
+
+	check-host-rpath: Silence readelf warnings when clang is used
+
+	GCC 10.x updated to 10.4.0
+
+	Updated/fixed packages: apg, arm-trusted-firmware, assimp,
+	bayer2rgb-neon, bind, bird, cog, cwiid, diffutils, fluidsynth,
+	freerdp, gcc, glibc, glslsandbox-player, gdk-pixbuf, gnupg2,
+	gtest, i2pd, jack2, jquery-validation, jszip, libbsd, libcamera,
+	libcurl, libest, libiio, libkrb5, libopenssl, libpsl,
+	luasyslog, lxc, mbedtls, mstpd, mutt, netdata, netsniff-ng,
+	nodejs, nvidia-driver, openssl, opkg-utils, paho-mqtt-c,
+	pango, pcsc-lite, perl, pimd, poppler, postgis, powerpc-utils,
+	pppd, protobuf-c, pulseaudio, python-bottle, python-django,
+	python-lxml, python3, qt5webkit, rpi-userland, rsyslog, runc,
+	rustc, sconeserver, sg3_utils, shadowsocks-libev, suricata,
+	tcpreplay, uacme, uclibc, v4l2loopback,, webkitgtk, wine,
+	wpewebkit, xdg-dbus-proxy, xserver_xorg-server, zeromq, zfs,
+	zlib-ng
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#13796: Problems compiling package gst-plugins-good
+	#14926: package/nodejs: build for host fails with GTEST errors
+
 2022.02.4, released July 28th, 2022
 
 	Important / security related fixes.
diff --git a/Makefile b/Makefile
index e14bb8f1ec..17f2f912a4 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2022.02.4
+export BR2_VERSION := 2022.02.5
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1659087600
+BR2_VERSION_EPOCH = 1661977000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/support/misc/Vagrantfile b/support/misc/Vagrantfile
index 4415f94418..cf6192a9d6 100644
--- a/support/misc/Vagrantfile
+++ b/support/misc/Vagrantfile
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Buildroot version to use
-RELEASE='2022.02.4'
+RELEASE='2022.02.5'
 
 ### Change here for more memory/cores ###
 VM_MEMORY=2048
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
