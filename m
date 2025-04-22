Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1017C369C2
	for <buildroot@archiver.kernel.org>; Tue, 22 Apr 2025 19:03:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9969060EF5;
	Tue, 22 Apr 2025 19:03:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LDT2It89oifg; Tue, 22 Apr 2025 19:03:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B77FD60F41
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B77FD60F41;
	Tue, 22 Apr 2025 19:03:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B04B71BC
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 19:03:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A249040F50
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 19:03:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xLd1cvASwN3M for <buildroot@buildroot.org>;
 Tue, 22 Apr 2025 19:03:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D36FA40259
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D36FA40259
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 19:03:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CDEBC860ED; Tue, 22 Apr 2025 19:03:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 22 Apr 2025 20:59:11 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: ca6a6837e16063fe4e3e69f70c7a8d4bc2d3504a
X-Git-Newrev: 3815d578c5759fa824322ea3d95ad51b55ab888e
X-Patchwork-Hint: ignore
Message-Id: <20250422190310.CDEBC860ED@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] Update for 2025.02.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=3815d578c5759fa824322ea3d95ad51b55ab888e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Signed-off-by: Colin Evrard <colin.evrard@mind.be>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 CHANGES  | 71 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 Makefile |  4 ++--
 2 files changed, 73 insertions(+), 2 deletions(-)

diff --git a/CHANGES b/CHANGES
index e7bfe4134e..206d630511 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,74 @@
+2025.02.1, released April 22nd, 2025
+
+	Changes with potentially large impact:
+
+	- gstreamer1 and related packages: updated from 1.22.x to 1.24.x.
+	  1.22.x was already EOL when Buildroot 2025.02 was released, so
+	  GStreamer should really already have been udpated to 1.24.x.
+	  This update was needed to fix a lot of vulnerabilities.
+	- frr: updated from 9.1.3 to 10.3. Version 9 is no longer
+	  maintained upstream, and not in any distro either. This update
+	  was needed to fix a vulernability.
+
+	Important / security related fixes:
+
+	- libmodsecurity: CVE-2025-27110.
+	- tinyxml2: CVE-2024-50615.
+	- xserver_xorg-server & xwayland: CVE-2024-9632, CVE-2025-26594,
+	    CVE-2025-26595, CVE-2025-26596, CVE-2025-26597,  CVE-2025-26598,
+	    CVE-2025-26599, CVE-2025-26600, CVE-2025-26601.
+	- exim: CVE-2025-30232.
+	- mbedtls: CVE-2025-27809, CVE-2025-27810.
+	- libfreeglut: CVE-2024-24258, CVE-2024-24259.
+	- libopenh264: CVE-2025-27091.
+	- gstreamer1: CVE-2024-47834, CVE-2024-47835, CVE-2024-47778,
+	    CVE-2024-47777 CVE-2024-47776, CVE-2024-47775, CVE-2024-47774,
+	    CVE-2024-47615, CVE-2024-47613, CVE-2024-47607, CVE-2024-47606,
+	    CVE-2024-47603, CVE-2024-47602, CVE-2024-47601, CVE-2024-47600,
+	    CVE-2024-47599, CVE-2024-47598, CVE-2024-47597, CVE-2024-47596,
+	    CVE-2024-47546, CVE-2024-47545, CVE-2024-47544, CVE-2024-47543,
+	    CVE-2024-47542, CVE-2024-47541, CVE-2024-47540, CVE-2024-47539,
+	    CVE-2024-47538, CVE-2024-47537.
+	- augeas: CVE-2025-2588.
+	- libndp: CVE-2024-5564.
+	- python-jinja2: CVE-2025-27516.
+	- python-django: CVE-2025-26699.
+	- libarchive: CVE-2024-57970, CVE-2025-1632.
+	- frr: CVE-2024-55553.
+
+	Updated / fixed packages: libmodsecurity, intel-mediadriver,
+	intel-vpl-gpu-rt, python-aerich, python-aiohttp, python-maturin,
+	python-tortoise-orm, python-sqlalchemy, kodi-pvr-waipu, tor, mc,
+	tinyxml2, libgeos, intel-vpl-gpu-rt, intel-mediadriver, ruby,
+	ncftp, xserver_xorg-server, exim, mbedtls, gdb, freerdp, uclibc,
+	libsoup3, cairo, zabbix, armadillo, spdlog, go, linux, linux-tools,
+	gstreamer, linux-header, ethtool, apr, mali-driver, libcoap, libcap
+	python-fastapi, python-twisted.
+
+	Test Improvements:
+
+	- linux-tools: selftests: Add path containing BPF binary.
+	- testing: make time setting portable.
+	- testing: set date in emulated machine.
+	- testing: add git runtime test.
+	- test_gstreamer1: fix test by using bootlin toolchain.
+
+	Infrastructure updates/fixes:
+
+	- kconfig: Handle backspace (^H) key.
+	- xilinx-embeddedsw: fix menuconfig visualization.
+	- DEVELOPERS: change arnout's address.
+	- support/download/svn: use 'svn info' whith LC_ALL=C
+	- glibc: disable on RISC-V ilp32f and lp64f, not supported.
+	- dillo: Fix an issue related to _SITE url for make show-info.
+	- pkg-stats: add -v/--verbose option
+
+	Build issues/problems solved for packages:
+
+	dillo, freerdp, freeswitch, gdb, glibc, linux-tools,
+	mesa3d-demos, ncftp, tesseract-ocr,
+	v4l2loopback, zabbix
+
 2025.02, released March 17th, 2025
 
 	Various fixes.
diff --git a/Makefile b/Makefile
index 4006bfbda7..5ca31caa27 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2025.02
+export BR2_VERSION := 2025.02.1
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1742234000
+BR2_VERSION_EPOCH = 1745347000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
