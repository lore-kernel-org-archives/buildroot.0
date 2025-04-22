Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C39BC369D1
	for <buildroot@archiver.kernel.org>; Tue, 22 Apr 2025 21:47:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 952B640CDD;
	Tue, 22 Apr 2025 21:47:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vunFpqs1evmo; Tue, 22 Apr 2025 21:47:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F211040CC9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F211040CC9;
	Tue, 22 Apr 2025 21:47:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1199A1CB
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 21:47:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E889540BF6
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 21:47:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5e_1kJUAmuko for <buildroot@buildroot.org>;
 Tue, 22 Apr 2025 21:47:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2BBF340B6B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2BBF340B6B
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 21:47:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 25E42861A2; Tue, 22 Apr 2025 21:47:20 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 22 Apr 2025 23:42:37 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 87d5d63983cb8fb967cebcf0c82b107efbb9506c
X-Git-Newrev: 17cdfb94a1f6944bfbab96b9c483e537d7b160a2
X-Patchwork-Hint: ignore
Message-Id: <20250422214720.25E42861A2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Update for 2025.02.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=17cdfb94a1f6944bfbab96b9c483e537d7b160a2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Colin Evrard <colin.evrard@mind.be>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
(cherry picked from commit 3815d578c5759fa824322ea3d95ad51b55ab888e)
[Arnout: drop changes to Makefile]
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 CHANGES | 71 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 71 insertions(+)

diff --git a/CHANGES b/CHANGES
index 3694c1d93f..aa9404c7db 100644
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
