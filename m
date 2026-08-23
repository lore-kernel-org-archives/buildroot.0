Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EEE3C5DF81
	for <buildroot@archiver.kernel.org>; Sun, 23 Aug 2026 21:06:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5877380D13;
	Sun, 23 Aug 2026 21:06:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FILRJq-p0GzG; Sun, 23 Aug 2026 21:06:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787519196;
	bh=rHZONA0vfVsToDRc4L+Fw1MIOdJLgZZleRtw3/eCA5I=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=FcEyPnwahakTmJCzoeyxI1ldloUrQMhgvF33JU+lVPhf+uIgwBlbFaka1cCNhNSpF
	 TOfsmPCi8D0lEw1gZWXiVpjkYRCKewyYEKnHrNAa7Q1h24k6F43okwYTZjm0oiH62/
	 JXm1xVUmUE0zLuhaMnouF9Ia3QyUZ5K5i/rhj5Dgk3BbGxvaib0DuURGSZP1J2hFZ7
	 p4Xc6P82eRXhjUmcRc/EwRgHO0h92AISyzzOo5IgoOAopTk4c7Y++ktNNcSyOmnVr+
	 zReHVoroekIplH+OwQGZ9kjM8wuOaSmCxWWgpa8Dhi5+U2AjzoXd9KUVuHWJXPbD/T
	 rrs0LEpAXsHNg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 629ED80B67;
	Sun, 23 Aug 2026 21:06:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6A2362FD
 for <buildroot@buildroot.org>; Sun, 23 Aug 2026 21:06:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4F9F540057
 for <buildroot@buildroot.org>; Sun, 23 Aug 2026 21:06:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wElPk-rICIQB for <buildroot@buildroot.org>;
 Sun, 23 Aug 2026 21:06:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 797A840056
 for <buildroot@buildroot.org>; Sun, 23 Aug 2026 21:06:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CB1BA8E19F; Sun, 23 Aug 2026 21:05:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 23 Aug 2026 23:06:03 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 312dd92bcdd35ad2d98c3679762a8e500566bb49
X-Git-Newrev: 66c46083e2386d45e1dbf7168c25a0320c822133
X-Patchwork-Hint: ignore
Message-Id: <20260823210538.CB1BA8E19F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] CHANGES: Update for 2026.05.2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/66c46083e2386d45e1dbf7168c25a0320c822133
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>

(cherry picked from commit a87cdf66c47f10d6f93997946a31276fe4a83cae)
---
 CHANGES | 131 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 131 insertions(+)

diff --git a/CHANGES b/CHANGES
index 4fa4de4abe..9a6ba4cae5 100644
--- a/CHANGES
+++ b/CHANGES
@@ -34,6 +34,137 @@
 
 	Removed packages: argparse, ts4900-fpga
 
+2026.05.2, released August 23, 2026
+
+	Important / security related fixes:
+
+	apr-util: CVE-2025-49506, CVE-2026-32327, CVE-2026-34191,
+	  CVE-2026-34501, CVE-2026-34502
+	bind: CVE-2026-10723, CVE-2026-10822, CVE-2026-11331, CVE-2026-11605,
+	  CVE-2026-11622, CVE-2026-11721, CVE-2026-12617, CVE-2026-13204,
+	  CVE-2026-13321
+	botan: CVE-2026-32877, CVE-2026-32883, CVE-2026-32884, CVE-2026-34580,
+	  CVE-2026-34582
+	busybox: CVE-2024-58251
+	clamav: CVE-2025-8088, CVE-2026-20337, CVE-2026-20338, CVE-2026-20339,
+	  CVE-2026-20345, CVE-2026-20346, CVE-2026-20347, CVE-2026-20348
+	containerd: CVE-2026-35469, CVE-2026-46680, CVE-2026-47262,
+	  CVE-2026-53488
+	dracut: CVE-2026-6893
+	dropbear: (no CVE assigned)
+	exim: GCVE-25-2026-07-45-1, CVE-2026-66140, CVE-2026-66141
+	expat: CVE-2026-72522
+	glibc: CVE-2026-6368
+	go: CVE-2026-39822
+	intel-microcode: CVE-2025-31936, CVE-2025-31938, CVE-2025-35973,
+	  CVE-2026-20707, CVE-2026-20713, CVE-2026-20716, CVE-2026-20760,
+	  CVE-2026-20917
+	libarchive: (no CVE assigned)
+	libass: CVE-2026-61626, CVE-2026-61627
+	libgit2: CVE-2026-53583, CVE-2026-53584, CVE-2026-53585,
+	  CVE-2026-53586, CVE-2026-53587
+	libglib2: CVE-2025-13601, CVE-2025-14087, CVE-2025-14512,
+	  CVE-2026-1484, CVE-2026-1485, CVE-2026-1489, CVE-2026-15588,
+	  CVE-2026-58010, CVE-2026-58011, CVE-2026-58012, CVE-2026-58013,
+	  CVE-2026-58014, CVE-2026-58015
+	libheif: CVE-2026-62289, CVE-2026-62291, CVE-2026-62292,
+	  CVE-2026-62377, GHSA-46rp-pcq2-rpmr, GHSA-73p7-m7gg-w2jv,
+	  GHSA-9ww4-9v47-m7pj, GHSA-jc8f-p23p-5hjg, GHSA-xpw3-9rhw-482x
+	libmodsecurity: CVE-2026-52747, CVE-2026-52761
+	libssh: CVE-2026-15370, CVE-2026-59843, CVE-2026-59844, CVE-2026-59845,
+	  CVE-2026-59846, CVE-2026-59847, CVE-2026-59848, CVE-2026-59849,
+	  CVE-2026-59850
+	localedef: CVE-2026-6368
+	memcached: (no CVE assigned)
+	ntfs-3g: CVE-2026-42616, CVE-2026-42617, CVE-2026-42618,
+	  CVE-2026-46569, CVE-2026-46570, CVE-2026-46571, CVE-2026-46572,
+	  CVE-2026-56135, CVE-2026-56136
+	openssh: (no CVE assigned)
+	openvpn: CVE-2026-63649, CVE-2026-63650
+	perl: CVE-2026-13221, CVE-2026-57432, CVE-2026-8376
+	php: CVE-2026-17543, CVE-2026-17544, CVE-2026-7260, CVE-2026-9672
+	postgresql: CVE-2026-14662, CVE-2026-14663, CVE-2026-14664,
+	  CVE-2026-14666, CVE-2026-14668, CVE-2026-14669, CVE-2026-14670,
+	  CVE-2026-14671, CVE-2026-14672, CVE-2026-14673, CVE-2026-14676,
+	  CVE-2026-14677, CVE-2026-14678, CVE-2026-14679, CVE-2026-14680,
+	  CVE-2026-14681, CVE-2026-15741, CVE-2026-15742, CVE-2026-16238,
+	  CVE-2026-16239, CVE-2026-16241, CVE-2026-18024, CVE-2026-18408,
+	  CVE-2026-19385, CVE-2026-6464, CVE-2026-6469, CVE-2026-6470,
+	  CVE-2026-6471
+	python3: CVE-2026-0864, CVE-2026-11972, CVE-2026-12003, CVE-2026-15308,
+	  CVE-2026-4360
+	rsync: CVE-2026-53783, CVE-2026-53784, CVE-2026-53785, CVE-2026-53786,
+	  CVE-2026-53788, CVE-2026-53789, CVE-2026-53790, CVE-2026-53791,
+	  CVE-2026-53792, CVE-2026-53793, CVE-2026-53794, CVE-2026-53795,
+	  CVE-2026-53796, CVE-2026-53797, CVE-2026-53798, CVE-2026-53799,
+	  CVE-2026-53800, CVE-2026-53801, CVE-2026-53802, CVE-2026-53803,
+	  CVE-2026-70452, CVE-2026-70453, CVE-2026-70454, CVE-2026-70455,
+	  CVE-2026-70456, CVE-2026-70457, CVE-2026-70458, CVE-2026-70459,
+	  CVE-2026-70460, CVE-2026-70461, CVE-2026-70462, CVE-2026-70463,
+	  CVE-2026-70464
+	samba4: CVE-2026-58216, CVE-2026-58218, CVE-2026-58221, CVE-2026-58222,
+	  CVE-2026-58224, CVE-2026-6949
+	screen: (no CVE assigned)
+	ser2net: GHSA-cgh5-39mg-vhfr
+	socat: CVE-2026-56123
+	stunnel: CVE-2026-70367, CVE-2026-70368
+	syslog-ng: CVE-2026-39879
+	vim: CVE-2026-28417, CVE-2026-28418, CVE-2026-28419, CVE-2026-28420,
+	  CVE-2026-28421, CVE-2026-28422, CVE-2026-32249, CVE-2026-33412,
+	  CVE-2026-34714, CVE-2026-34982, CVE-2026-35177, CVE-2026-39881,
+	  CVE-2026-41411, CVE-2026-42307, CVE-2026-44656, CVE-2026-45130,
+	  CVE-2026-46483, CVE-2026-47162, CVE-2026-47167, CVE-2026-52858,
+	  CVE-2026-52859, CVE-2026-52860, CVE-2026-55693, CVE-2026-55892,
+	  CVE-2026-55895, CVE-2026-57451, CVE-2026-57452, CVE-2026-57453,
+	  CVE-2026-57455, CVE-2026-57456, CVE-2026-59856, CVE-2026-59857,
+	  CVE-2026-59858
+	wpa_supplicant: (no CVE assigned)
+	xlib_libXfont2: CVE-2026-56001, CVE-2026-56002, CVE-2026-56003
+	xserver_xorg-server: CVE-2026-55999, CVE-2026-56000
+	xwayland: CVE-2026-55999, CVE-2026-56000
+
+	Toolchain:
+
+	- gcc: fix mips/glibc build issue
+	- glibc: bump to 2.43-49-g8017bcfc4d
+	- linux-headers: bump to 5.10.265, 5.15.216, 6.1.183, 6.6.152,
+	  6.12.104, 6.18.45, 7.0.14
+	- toolchain-buildroot: drop Synopsys ARC specific versions
+	- toolchain-external: drop Synopsys ARC toolchain
+
+	Infrastructure updates/fixes:
+
+	- Add license information for skeleton packages
+	- Make docker image reproducible again
+	- New runtime tests for guile, libgpiod2, mdnsd, php, python-pydal
+
+	Updated defconfigs: freescale_imx91frdm, freescale_imx93frdm
+
+	Removed defconfigs: acmesystems_aria_g25_{128mb, 256mb},
+	  acmesystems_arietta_g25_{128mb, 256mb}, s6lx9_microboard, ts4900,
+	  ts5500
+
+	Removed packages: argparse, ts4900-fpga
+
+	Updated / fixed packages: amazon-ecr-credential-helper, apache,
+	  apr-util, arm-trusted-firmware, armadillo, at-spi2-core, atop, bind,
+	  binutils, bitcoin, botan, busybox, cantarell, cifs-utils, clamav,
+	  containerd, cramfs, dbus-broker, docker-credential-acr-env,
+	  docker-credential-gcr, dracut, dropbear, environment-setup, exim,
+	  expat, gcc, glibc, go, guile, gvfs, ifupdown-scripts, igt-gpu-tools,
+	  initscripts, intel-microcode, libarchive, libass, libcamera, libgee,
+	  libgit2, libglib2, libgpg-error, libgtk4, libgudev, libheif,
+	  libmicrohttpd, libmodsecurity, libnpupnp, libpeas, librsvg,
+	  libsecret, libsoup, libsoup3, libssh, libvpl, linux, linux-headers,
+	  localedef, mbedtls, memcached, mini-snmpd, mosquitto, nettle,
+	  network-manager, ntfs-3g, ogre, open62541, openblas, openssh,
+	  openvpn, optee-os, p11-kit, pahole, perl, php, postgresql,
+	  python-paho-mqtt, python-pydal, python-web2py, python3, quickjs,
+	  redis, rsync, rygel, samba4, screen, ser2net, socat, stunnel,
+	  syslog-ng, toolchain-external, uboot-tools, uclibc, ugetty,
+	  urandom-scripts, usbutils, vim, wpa_supplicant, xlib_libXfont2,
+	  xserver_xorg-server, xwayland, xz
+
 2026.05.1, released July 15, 2026
 
 	Important / security related fixes:
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
