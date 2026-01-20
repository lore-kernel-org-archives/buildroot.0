Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC7D2D26296
	for <buildroot@archiver.kernel.org>; Tue, 20 Jan 2026 20:05:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0830F60A59;
	Tue, 20 Jan 2026 20:05:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LmBbpbufFuId; Tue, 20 Jan 2026 20:05:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8026B60A53
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768939508;
	bh=raAkcM/vsmD+zJua9CuHlH8O9AUnT01wFbhB/0ppf34=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=BHFNRfPerzLQnEUivJ454XnvhaZdkWNd725skMWh2jiThnGCnHRsBx+9FYHsZuBsL
	 itpvmV9APzZyyx+8qrEiuoR9GuQDuijlZvOQe0FkeARGxDjkkmfLndZ0mGl729vs0n
	 2w/8LIVIGdolKY4ZRwcsoiqSCxqaJS2xZVk6JVxn/fvfnNypIECB1krl1q0i0TTWji
	 2jHOpSkSqfAsCyM+OImgViAVbE1L5yQTCRseSgwtfGzLdBff4UvMS9PEuTee4pQ/+F
	 LlmOqTRkgoiaPecQyj+ZnPw4k7a93ErJZMIfC28oS2KB7RH+g1lm6HH+/JZZHiseDo
	 YRQvXpZfLiidA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8026B60A53;
	Tue, 20 Jan 2026 20:05:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 262F5169
 for <buildroot@buildroot.org>; Tue, 20 Jan 2026 20:05:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 16B1460A51
 for <buildroot@buildroot.org>; Tue, 20 Jan 2026 20:05:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SlyI3ztBJyet for <buildroot@buildroot.org>;
 Tue, 20 Jan 2026 20:05:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 28AB260A4E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 28AB260A4E
 for <buildroot@buildroot.org>; Tue, 20 Jan 2026 20:05:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 16DF28870E; Tue, 20 Jan 2026 20:05:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 20 Jan 2026 20:56:38 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 45eaf7db42d6834d9d9f21dea3f7fe4a9db30ff1
X-Git-Newrev: a7b1377d45b7c57c5d6a41dcca048f6f7c533a0a
X-Patchwork-Hint: ignore
Message-Id: <20260120200504.16DF28870E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] CHANGES: update for 2025.02.10
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

commit: https://git.buildroot.net/buildroot/commit/?id=a7b1377d45b7c57c5d6a41dcca048f6f7c533a0a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Co-authored-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
(cherry picked from commit 900c8524d5a7dabbb7d762edc369713207bfa92f)
---
 CHANGES | 74 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 74 insertions(+)

diff --git a/CHANGES b/CHANGES
index 56267752c8..16223328f9 100644
--- a/CHANGES
+++ b/CHANGES
@@ -679,6 +679,80 @@
 	- netsnmp: unexpected header length in /proc/net/snmp...
 	  https://gitlab.com/buildroot.org/buildroot/-/issues/110
 
+2025.02.10, released January 20, 2026
+
+	Important / security related fixes:
+
+	apache: CVE-2025-55753, CVE-2025-58098, CVE-2025-59775, CVE-2025-65082,
+	  CVE-2025-66200
+	cryptsetup
+	dropbear: CVE-2025-14282, CVE-2019-6111
+	exim: CVE-2025-67896
+	gnupg2
+	imagemagick: CVE-2025-66628
+	libarchive
+	libcoap: CVE-2025-59391, CVE-2025-65493, CVE-2025-65494
+	  CVE-2025-65495, CVE-2025-65496, CVE-2025-65497, CVE-2025-65498,
+	  CVE-2025-65499, CVE-2025-65500, CVE-2025-65501
+	libcurl: CVE-2025-13034, CVE-2025-14017, CVE-2025-14524,
+	  CVE-2025-14819, CVE-2025-15079, CVE-2025-15224
+	libfcgi: CVE-2025-23016.
+	libfreeimage: CVE-2019-12211, CVE-2019-12213, CVE-2020-24292,
+	  CVE-2020-24293, CVE-2020-24295, CVE-2021-33367, CVE-2021-40263,
+	  CVE-2021-40266, CVE-2023-47995, CVE-2023-47997
+	libpng: CVE-2025-66293
+	liburiparser: CVE-2025-67899
+	libxslt: CVE-2025-7424, CVE-2025-9714, CVE-2025-11731
+	linenoise: CVE-2025-9810
+	perl: CVE-2025-40909
+	php: CVE-2025-14177, CVE-2025-14178, CVE-2025-14180
+	python-django: CVE-2025-13372, CVE-2025-64460
+	python-filelock: CVE-2025-68146
+	python-fonttools: CVE-2025-66034
+	python-urllib3: CVE-2025-66471, CVE-2025-66418
+	unbound: CVE-2025-11411
+	vlc
+	xserver_xorg-server: CVE-2025-62229, CVE-2025-62230,
+	  CVE-2025-62231
+	xwayland: CVE-2025-62229, CVE-2025-62230, CVE-2025-62231
+
+	Infrastructure updates/fixes:
+
+	- pkg-stats use HEAD request & unique HTTP user-agent
+	- cve-check: don't fail with unknown CVE
+	- generate-cyclonedx: support 'resolved_with_pedigree'
+	- testing: add host bin dir to PATH
+	- testing: add libiio python bindings runtime test
+	- testing: ddrescue: use dmsetup from lvm2
+	- testing: ddrescue: use f-string for test config
+	- testing: add tio runtime test
+	- add 'CVE:' trailer in various patches
+	- add md5 hash and update tarball url to various python packages
+	- testing: ltp-testsuite: replace runltp by kirk
+	- testing: new kvmtool runtime test
+	- gitignore: ignore utils/brmake log output named `br.log`
+	- testing: add opus-tools runtime test
+	- testing: add flac runtime test
+
+	Updated / fixed packages: apache, arm-trusted-firmware, atf, audit,
+	bitcoin, boost, busybox, cage, cmake, collectl, cppcms, cpulimit,
+	cryptsetup, dbus, dmraid, dropbear, embiggen-disk, evilwm, exim, ficl,
+	fontconfig, glibc, gnupg2, grpc, gvfs, imagemagick, kvmtool, ledmon,
+	libarchive, libcoap, libcpprestsdk, libcurl, libdill, libfcgi,
+	libfreeimage, libgit2, libgtk3, libgtk4, libiio, libmbus, libpng,
+	libselinux, libtirpc, libupnp, liburiparser, libxml2, libxslt, linenoise,
+	linux-tools, lttng-modules, lugaru, matchbox-fakekey, matchbox-keyboard,
+	matchbox-lib, matchbox-panel, mosh, nfs-utils, open-lldp, opencv4,
+	opencv4-contrib, openjdk, perl, perl-dbd-mysql, perl-mozilla-ca, php, pigz,
+	pixman, python-brotli, python-certifi, python-django, python-filelock,
+	python-fonttools, python-pyqt5, python-urllib3, qt5enginio, qt5webkit,
+	qt6base, racehound, rdesktop, rpcbind, rpi-firmware, softether, softhsm2,
+	spice, ssdp-responder, sway, sysprof, tio, trinity, tzdata, uboot, uclibc,
+	unbound, vim, vlc, xdriver_xf86-video-intel, xen, xinetd,
+	xlib_libxshmfence, xserver_xorg-server, xvkbd, xwayland, zic, zxing-cpp
+
+	Removed packages: opencv3 'protobuf', opencv3 'ffmpeg'
+
 2025.02.9, released December 11, 2025
 
 	Important / security related fixes:
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
