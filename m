Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4877CECAAD4
	for <buildroot@archiver.kernel.org>; Wed, 31 Aug 2022 19:10:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7E2A34013E;
	Wed, 31 Aug 2022 19:10:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7E2A34013E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PU8lFhgRqCxV; Wed, 31 Aug 2022 19:10:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9FAAC400FB;
	Wed, 31 Aug 2022 19:10:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9FAAC400FB
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 71EFD1BF2BC
 for <buildroot@lists.busybox.net>; Wed, 31 Aug 2022 19:10:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4D8CF400FB
 for <buildroot@lists.busybox.net>; Wed, 31 Aug 2022 19:10:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4D8CF400FB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qURQSuiAls1w for <buildroot@lists.busybox.net>;
 Wed, 31 Aug 2022 19:10:48 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 593A8400E5
 for <buildroot@buildroot.org>; Wed, 31 Aug 2022 19:10:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 593A8400E5
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 0656288091; Wed, 31 Aug 2022 18:55:42 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 31 Aug 2022 21:06:05 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 50d5e224a6fb0d8d78727f169d20625285da8f7b
X-Git-Newrev: 41b1b65c5a392284ef8d4834e651aa5686c29434
X-Patchwork-Hint: ignore
Message-Id: <20220831185542.0656288091@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Update for 2022.05.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=41b1b65c5a392284ef8d4834e651aa5686c29434
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit bf0d8c96599f3dc09d8fa7b706c3cf19294fd70e)
[Peter: drop Makefile changes]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                  | 37 +++++++++++++++++++++++++++++++++++++
 support/misc/Vagrantfile |  2 +-
 2 files changed, 38 insertions(+), 1 deletion(-)

diff --git a/CHANGES b/CHANGES
index 678991cbc2..49910cfb25 100644
--- a/CHANGES
+++ b/CHANGES
@@ -87,6 +87,43 @@
 	#14881: Watchdogd Package missing INSTALL_STAGING
 	#14876: arm-trusted-firmware can no longer be  compiled with fPIE
 
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
