Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EA2EC87FD2
	for <buildroot@archiver.kernel.org>; Mon, 11 Aug 2025 15:09:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1669961442;
	Mon, 11 Aug 2025 15:09:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W4u6hRxICGp8; Mon, 11 Aug 2025 15:09:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C4AC161426
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C4AC161426;
	Mon, 11 Aug 2025 15:09:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2A260154
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 15:09:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1C7FF6140B
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 15:09:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ey91I_9U-LeR for <buildroot@buildroot.org>;
 Mon, 11 Aug 2025 15:09:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 76FC861410
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 76FC861410
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 15:09:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7059B87434; Mon, 11 Aug 2025 15:09:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 11 Aug 2025 17:08:06 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ad52cbd93ddbe2bd252a9642440c8c5fa24e8354
X-Git-Newrev: 54fe9d3f4d487faee6afce0837cfc88b307b000f
X-Patchwork-Hint: ignore
Message-Id: <20250811150941.7059B87434@busybox.osuosl.org>
Subject: [Buildroot] [git commit] CHANGES: update for 2025.05.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=54fe9d3f4d487faee6afce0837cfc88b307b000f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
(cherry picked from commit 6ae1f61894a8649a08597917692c829bfa059fb3)
---
 CHANGES | 111 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 111 insertions(+)

diff --git a/CHANGES b/CHANGES
index 4eeade3f67..70fecf46e8 100644
--- a/CHANGES
+++ b/CHANGES
@@ -28,6 +28,117 @@
 	Removed packages: libebur128, libolm, libwebsock,
 	python-dunamai, python-poetry-dynamic-versioning
 
+2025.05.1, released August 11th, 2025
+
+	Important / security related fixes:
+	- samba4: support Windows security hardening
+	- apache: CVE-2025-53020, CVE-2025-49812, CVE-2025-49630, CVE-2025-23048,
+	    CVE-2024-47252, CVE-2024-43394, CVE-2024-43204, CVE-2024-42516,
+	    CVE-2025-54090
+	- assimp: CVE-2025-2750, CVE-2025-2751, CVE-2025-2757, CVE-2025-3158
+	- clamav: CVE-2025-20260
+	- edk2: CVE-2024-38805
+	- git: CVE-2025-27613, CVE-2025-27614, CVE-2025-46835, CVE-2025-48384,
+	    CVE-2025-48385, CVE-2025-48386
+	- jose: CVE-2023-50967
+	- libarchive: CVE-2025-5914, CVE-2025-5915, CVE-2025-5916, CVE-2025-5917,
+	    CVE-2025-5918
+	- libavif: CVE-2025-48174, CVE-2025-48175
+	- libblockdev: CVE-2025-6019
+	- libbpf: CVE-2025-29481
+	- libglib2: CVE-2025-6052
+	- libheif: CVE-2025-43966, CVE-2025-43967
+	- libhtp: CVE-2024-45797
+	- libopenssl: CVE-2025-4575
+	- libsoup: CVE-2024-52530, CVE-2024-52531, CVE-2024-52532, CVE-2025-2784,
+	    CVE-2025-4476, CVE-2025-4948, CVE-2025-4969, CVE-2025-32050,
+	    CVE-2025-32052, CVE-2025-32053, CVE-2025-32906, CVE-2025-32910,
+	    CVE-2025-32911, CVE-2025-32912, CVE-2025-32913, CVE-2025-32914,
+	    CVE-2025-46420, CVE-2025-46421
+	- libxml2: CVE-2025-6021, CVE-2025-49794, CVE-2025-49796, CVE-2025-49795,
+	    CVE-2025-6170
+	- mbedtls: CVE-2025-47917, CVE-2025-48965, CVE-2025-49087, CVE-2025-49600,
+	    CVE-2025-49601, CVE-2025-52496, CVE-2025-52497
+	- micropython: CVE-2024-8947
+	- modsecurity2: 2025-47947, CVE-2025-48866
+	- orc: CVE-2024-40897
+	- php: CVE-2025-1735, CVE-2025-6491, CVE-2025-1220
+	- podman: CVE-2025-6032
+	- python-aiohttp: CVE-2025-53643
+	- python-django: CVE-2025-48432
+	- python-requests: CVE-2024-47081
+	- python-starlette: CVE-2025-54121
+	- python-urllib3: CVE-2025-50181, CVE-2025-50182
+	- python3: 2024-12718, CVE 2025-4138, CVE 2025-4330, CVE 2025-4435,
+	    2025-4517
+	- redis: CVE-2025-32023, CVE-2025-48367
+	- rust-bindgen: CVE-2024-43806, RUSTSEC-2024-0006
+	- samba4: CVE-2025-0620
+	- shim: CVE-2024-2312
+	- sngrep: CVE-2024-3119, CVE-2024-3120
+	- sudo: CVE-2025-32462, CVE-2025-32463
+	- tcpreplay: CVE-2023-4256, CVE-2023-43279, CVE-2024-22654
+	- tinyxml: CVE-2023-34194
+	- wpewebkit: CVE-2024-27856, CVE-2024-40866, CVE-2024-44185,
+	    CVE-2024-44187, CVE-2024-44192, CVE-2024-44244, CVE-2024-44296,
+	    CVE-2024-44308, CVE-2024-44309, CVE-2024-54467, CVE-2024-54479,
+	    CVE-2024-54502, CVE-2024-54505, CVE-2024-54508, CVE-2024-54534,
+	    CVE-2024-54543, CVE-2024-54551, CVE-2024-54658, CVE-2025-24143,
+	    CVE-2025-24150, CVE-2025-24158, CVE-2025-24162, CVE-2025-24201,
+	    CVE-2025-24208, CVE-2025-24209, CVE-2025-24213, CVE-2025-24216,
+	    CVE-2025-24223, CVE-2025-24264, CVE-2025-30427, CVE-2025-31204,
+	    CVE-2025-31205, CVE-2025-31206, CVE-2025-31215, CVE-2025-31257
+	- xorg-server / xwayland: CVE-2025-49175, CVE-2025-49176, CVE-2025-49177,
+	    CVE-2025-49178, CVE-2025-49179, CVE-2025-49180
+
+	Updated / fixed packages: amazon-ecr-credential-helper, at91bootstrap3,
+	avrdude, bcg729, berkeleydb, binutils, bmx7, boot/syslinux, ca-certificates,
+	chartjs, cifs-utils, cpp-httplib, cpulimit, daq, dht,
+	docker-credential-acr-env, docker-credential-gcr, elfutils, eudev, fwupd,
+	gcc, gnuplot, gstreamer1-editing-services, gumbo-parser, gvfs, hddtemp,
+	kvmtool, libargtable2, libcddb, libconfuse, libcrossguid, libcurl, libdex,
+	libesmtp, libgcrypt, libiec61850, libmanette, libmicrohttpd, libmpeg2,
+	libndp, libp11, libplatform, libspdm, libssh2, libuhttpd, libva, linux,
+	linux-tools (rtla), lpac, lrzsz, ltp-testsuite, lua, mjpg-streamer,
+	modem-manager, modsecurity2, mosquitto, mpv, mupdf, ncmpc, ncurses,
+	net-tools, network-manager, nginx-modsecurity, ntp, oniguruma, openblas,
+	parted, passt, php, python-asgiref, python-cython, python-dbus-fast,
+	python-dotenv, python-fastapi, python-future, python-glslang,
+	python-msgpack, python-multipart, python-remi, python-setuptools,
+	python-typing-extensions, qpid-proton, rapidjson, rauc-hawkbit-updater,
+	rtl8188eu, rtl8723bu, rtl8723ds, rtl8821au, rust, sdl2, shadowsocks-libev,
+	shairport-sync, sox, sqlite, squashfs, sudo, systemd, systemd, tailscale,
+	tor, uclibc, ustream-ssl, watchdog, webkitgtk, wpebackend-fdo, xen
+
+	Removed package: libebur128, libolm, libwebsock
+
+	Infrastructure updates / fixes:
+	- python-glslang is now a host package only
+	- Makefile unexports are now fixed and sorted
+	- hide gcc version for unsupported CPUs
+	- check-package: handle missing files
+	- test-pkg: stop on sigint
+	- toolchain/toolchain-wrapper.c:
+	    - correct CCACHE_BASEDIR comment
+	    - slightly simplify cmdline copying
+	    - get rid of EXCLUSIVE_ARGS
+	- erofs: reword "all-fragments" Kconfig text
+	- utils/update-rust: fix MIT hash
+
+	Test improvements:
+	- add new test for nginx-modsecurity
+	- new runtime test for gumbo-parser
+	- add a crun-based runtime test for docker-compose
+	- test_xen: add a base class
+	- test_xen: test on 32-bit Arm v7
+	- test_xen: rename TestXen to TestXenAarch64
+
+	Boards updated / fixed:
+	- globalscale_espressobin: update linux
+	- freescale/mxs: fix Linux booting
+	- ti_am62x_sk: bump Linux version
+	- beaglebone: bump Linux to 6.12.23-ti-arm32-r11
+
 2025.05, released June 9th, 2025
 
 	Various fixes.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
