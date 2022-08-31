Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF5A4ECAAD4
	for <buildroot@archiver.kernel.org>; Wed, 31 Aug 2022 22:06:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0D1C483163;
	Wed, 31 Aug 2022 22:06:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0D1C483163
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2pMWhbjLN7D1; Wed, 31 Aug 2022 22:06:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2089E83134;
	Wed, 31 Aug 2022 22:06:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2089E83134
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C75971C1148
 for <buildroot@lists.busybox.net>; Wed, 31 Aug 2022 22:06:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AB5E441960
 for <buildroot@lists.busybox.net>; Wed, 31 Aug 2022 22:06:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AB5E441960
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rNk1BiYsRbFO for <buildroot@lists.busybox.net>;
 Wed, 31 Aug 2022 22:05:59 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B3D6D40298
 for <buildroot@buildroot.org>; Wed, 31 Aug 2022 22:05:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B3D6D40298
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 1F47288204; Wed, 31 Aug 2022 21:50:53 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 1 Sep 2022 00:02:38 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 54e5a6420072415f80bad272183b45b61f159675
X-Git-Newrev: 092b705e241cf485d75d0b66121d0ec204162f77
X-Patchwork-Hint: ignore
Message-Id: <20220831215053.1F47288204@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Update for 2022.02.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=092b705e241cf485d75d0b66121d0ec204162f77
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 6c872197f412b011ceefc6fb5ebbb34f2fb00c15)
[Peter: drop Makefile/Vagrantfile changes]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/CHANGES b/CHANGES
index 49910cfb25..e22005540e 100644
--- a/CHANGES
+++ b/CHANGES
@@ -247,6 +247,40 @@
 	#14731: BR2_PACKAGE_IOSTAT
 	#14751: LVM2 Outdated Link
 
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
