Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43469C3ABD8
	for <buildroot@archiver.kernel.org>; Sun, 18 May 2025 14:47:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D950F60E70;
	Sun, 18 May 2025 14:47:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8WJaaKPJYc7k; Sun, 18 May 2025 14:47:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CB72860E64
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CB72860E64;
	Sun, 18 May 2025 14:47:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2CB08DF
 for <buildroot@buildroot.org>; Sun, 18 May 2025 14:47:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 275CB4049F
 for <buildroot@buildroot.org>; Sun, 18 May 2025 14:47:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tOtm6O6pBOLO for <buildroot@buildroot.org>;
 Sun, 18 May 2025 14:47:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4C5D1403E1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4C5D1403E1
 for <buildroot@buildroot.org>; Sun, 18 May 2025 14:47:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3CB93813BA; Sun, 18 May 2025 14:47:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 18 May 2025 15:57:13 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 96ece0f85b1ea291fd814704534929a71707a7ba
X-Git-Newrev: 183f44a3bdfdd730c50bd939cfdbedc5ba93025e
X-Patchwork-Hint: ignore
Message-Id: <20250518144711.3CB93813BA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] CHANGES: Update for
 2025.02.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=183f44a3bdfdd730c50bd939cfdbedc5ba93025e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 CHANGES | 99 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 99 insertions(+)

diff --git a/CHANGES b/CHANGES
index 206d630511..32acdc13e7 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,102 @@
+2025.02.2, released May 18th, 2025
+
+	Important / security related fixes:
+
+	- openvpn: CVE-2025-2704
+	- ghostscript: CVE-2025-27830, CVE-2025-27831, CVE-2025-27832,
+		CVE-2025-27833, CVE-2025-27834, CVE-2025-27835,
+		CVE-2025-27836, CVE-2025-27837,
+	- libfcgi: CVE-2025-23016
+	- perl: CVE-2024-56406
+	- mosquitto: CVE-2023-28366
+	- c-ares: CVE-2025-31498
+	- graphicsmagick: CVE-2025-32460, CVE-2025-27795
+	- libxml2: CVE-2025-32414, CVE-2025-32415
+	- wireshark: CVE-2025-1492
+	- yam: CVE-2021-33454
+	- sqlite: CVE-2025-29087
+	- xz: CVE-2025-31115
+	- python-django: CVE-2025-32873
+	- libraw: CVE-2025-43961, CVE-2025-43962, CVE-2025-43963,
+	    CVE-2025-43964
+	- dropbear: CVE-2025-47203
+	- intel-microcode: CVE-2025-24495, CVE-2024-28956, CVE-2024-43420,
+	    CVE-2025-20103
+	- openssh: CVE-2025-32728
+	- screen: CVE-2025-23395, CVE-2025-46802, CVE-2025-46803,
+	    CVE-2025-46804, CVE-2025-46805
+	- python-flask: CVE-2025-47278
+	- python-h11: CVE-2025-43859
+	- postgresql: CVE-2025-4207
+
+	Updated / fixed packages: sysklogd, libfcgi, double-conversion,
+	igh-ethercat, c-periphery, socat, lua-periphery, fluent-bit,
+	samba4, ca-certificates, dbus-cxx, atkmm2_28, pangomm2_46,
+	cairomm1_14, glibmm2_66, gtkmm3, file, opencsd, libopenmpt,
+	fwts, libtracefs, iproute2, ripgrep, bat, dust, trace-cmd,
+	libubootenv, micropython, python-cryptography, dnsmasq,
+	wireless-regdb, python-setuptools, libuci, libubox, ubus, waf,
+	armadillo, ncftp, expat, libxml2, wireshark, hiredis, zfs,
+	sunxi-mali-utgard-driver, ruby, mtools, hwdata, traceroute,
+	zic, tzdata, jo, gdb, tpm2-pkcs11, nss-pam-ldapd, ghostscript,
+	dropbear, intel-microcode, screen, python-flask, python-h11,
+	mariadb, ffmpeg, postgresql
+
+	Test Improvements:
+
+	- test_edk2: add a few build tests
+	- weston: fix the weston shutdown test
+	- lighttpd: runtime test
+	- openocd: runtime test
+	- hyperfine: runtime test
+	- python-urllib3: runtime test
+	- test_edk2: add macchiatobin build test
+	- bat: runtime test
+	- dust: runtime test
+
+	Infrastructure updates / fixes:
+
+	- libopenh264: ignore CVE-2025-27091
+	- edk2: drop dependency on tf-a for macchiatobin
+	- vim: extend comment about vi symlink
+	- board/raspberrypi/readme.txt: various improvements
+	- raspberrypi5: install Raspberry Pi 500 device-tree blob
+	- gen-bootlin-toolchains: allows armv8-a CPU to use armv7-a toolchains
+	- libsigrokdecode: needs python3 w/ zlib support
+	- dejavu: update homepage
+	- pulseview: fix, update, and reorganise dependencies
+	- boost: move host variables closer together
+	- boost: move target library selection variables closer together
+	- support/download/git: use FOO_DL_OPTS
+	- stm32mp135f_dk: fix optee hash
+	- libcamera: various fixes
+	- apparmor don't reference libapparmor variables
+	- rpi-firmware: add note to keep in sync with kernel
+	- python-sdbus: fix upstream url
+	- qt5webengine: drop unused file
+	- warp7: Improve Wifi instructions
+	- cryptopp: add upstream URL in help text
+	- dpdk: fixup Config.in comment about dependencies
+	- ffmpeg: add support for libopenmpt
+	- pkg-stats: fix typo in --disable help text
+	- imx28evk: enable BR2_DOWNLOAD_FORCE_CHECK_HASHES
+	- friendlyarm_nanopi_r3s: fix host linux headers custom version
+	- support/dependencies/dependencies.sh: awk is needed by Buildroot
+	- Config.in: introduce BR2_HOST_GCC_AT_LEAST_{12..15}
+	- dbus: set session-socket-dir to /tmp
+	- fs/erofs: unbreak custom compression handling
+	- nodejs: make target nodejs package virtual
+	- mpd: update CPE/CVE information
+	- Various fix for GCC15 host
+
+	Build issues and other problems solved for packages:
+
+	sqlite, pahole, libv4l, arm-trusted-firmware, libopenmpt, iptables,
+	tailscale, wilc-driver, rtl8188eu, rtl8723ds, lmbench, fluent-bit,
+	mosquitto, iproutes2, pixman, linux-tools, libcoap, libcamera,
+	strongswan, mpv, hiredis, zfs, bird, netsnmp, libcap, musepack,
+	ffmpeg, libqrencode
+
 2025.02.1, released April 22nd, 2025
 
 	Changes with potentially large impact:
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
