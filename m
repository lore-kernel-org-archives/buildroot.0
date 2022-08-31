Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9853ECAAD1
	for <buildroot@archiver.kernel.org>; Wed, 31 Aug 2022 15:21:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 27E2F40C90;
	Wed, 31 Aug 2022 15:21:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 27E2F40C90
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2Cp3hCtCDUB3; Wed, 31 Aug 2022 15:21:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 43DFA40C99;
	Wed, 31 Aug 2022 15:21:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 43DFA40C99
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 90B0B1BF41A
 for <buildroot@lists.busybox.net>; Wed, 31 Aug 2022 15:21:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6B70E610F4
 for <buildroot@lists.busybox.net>; Wed, 31 Aug 2022 15:21:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6B70E610F4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vU-XTgz9cxh1 for <buildroot@lists.busybox.net>;
 Wed, 31 Aug 2022 15:21:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A1EC6610DF
 for <buildroot@buildroot.org>; Wed, 31 Aug 2022 15:21:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A1EC6610DF
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id ACA1A87F4D; Wed, 31 Aug 2022 15:05:57 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 31 Aug 2022 17:19:59 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: d236f924eab0464670f17b8177b86533a83406a1
X-Git-Newrev: bf0d8c96599f3dc09d8fa7b706c3cf19294fd70e
X-Patchwork-Hint: ignore
Message-Id: <20220831150557.ACA1A87F4D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] Update for 2022.05.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=bf0d8c96599f3dc09d8fa7b706c3cf19294fd70e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                  | 37 +++++++++++++++++++++++++++++++++++++
 Makefile                 |  4 ++--
 support/misc/Vagrantfile |  2 +-
 3 files changed, 40 insertions(+), 3 deletions(-)

diff --git a/CHANGES b/CHANGES
index 13f3a78ab3..7b2cb2a2c6 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,40 @@
+2022.05.2, released August 31st, 2022
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
+	Defconfigs: Kria kv260: Fix u-boot configuration
+
+	Updated/fixed packages: apg, arm-trusted-firmware, assimp,
+	bayer2rgb-neon, bind, bird, cog, cwiid, diffutils, freerdp,
+	fluidsynth, gcc, gdk-pixbuf, glibc, glslsandbox-player,
+	gnupg2, gtest, i2pd, jack2, jquery-validation, jszip,
+	kvm-unit-tests, libbsd, libcamera, libcurl, libest, libiio,
+	libkrb5, libopenssl, libp11, libpsl, libwebsockets, localedef,
+	luasyslog, lxc, mbedtls, mstpd, mutt, netdata, netsniff-ng,
+	nodejs, nvidia-driver, ola, openssl, opkg-utils, paho-mqtt-c,
+	pango, pcsc-lite, perl, perl-crypt-openssl-rsa, pimd, poppler,
+	postgis, powerpc-utils, pppd, protobuf-c, pulseaudio,
+	python-bottle, python-django, python-lxml, python3, qt5webkit,
+	redis, rpi-userland, rsyslog, runc, rustc, sconeserver,
+	sg3_utils, shadowsocks-libev, stellarium, suricata, swupdate,
+	tcpreplay, uacme, uclibc, v4l2loopback, webkitgtk,
+	wilc-driver, wine, wpewebkit, xdg-dbus-proxy,
+	xserver_xorg-server, zeromq, zfs, zlib-ng
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#13796: Problems compiling package gst-plugins-good
+
 2022.05.1, released July 24th, 2022
 
 	Important / security related fixes.
diff --git a/Makefile b/Makefile
index ef4ccbab14..412e1decd3 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2022.05.1
+export BR2_VERSION := 2022.05.2
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1658655000
+BR2_VERSION_EPOCH = 1661958000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/support/misc/Vagrantfile b/support/misc/Vagrantfile
index 69dfb0ca28..7d68392a8d 100644
--- a/support/misc/Vagrantfile
+++ b/support/misc/Vagrantfile
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Buildroot version to use
-RELEASE='2022.05.1'
+RELEASE='2022.05.2'
 
 ### Change here for more memory/cores ###
 VM_MEMORY=2048
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
