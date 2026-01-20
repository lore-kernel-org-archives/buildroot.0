Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 317B5D26293
	for <buildroot@archiver.kernel.org>; Tue, 20 Jan 2026 19:41:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6CAE340569;
	Tue, 20 Jan 2026 19:41:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gfiscz9-2Mds; Tue, 20 Jan 2026 19:41:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9791B40475
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768938083;
	bh=IBbmDD6pep84/WK79jQ3OwX1JRiz4Z45Mrj6vflIGkg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=mYXwHM3rv8Yge3qwnstHTCleOK6SsDSRyJydDb+HyYDX//+Khpsymu4VT0XctwFeH
	 zYzFo1lKpkuKHapnDTio4BZvcMH7IWEIubeoi8w8Gndt1wxFB8J/hPp4z5uWONWImg
	 Jkx/O7srgkXwtDndfKgaH/NTnjrGhSyA1gndWiGy87/mwaks0o3JSpBJvGeQNjDmMc
	 F/w3IZtk5hDKdaOKTQ2leEaVQV6SZgBIa3CZQJx6Icnu7Z2YFgnch533TEHr1e1FVZ
	 drzUjIO4cK7j+NmYyYXxGjh2XkarP+2c7IFCwcpz3Kvw/+MDKAGf3Af/gEHllqgtZq
	 XamqLB7Gkfgvw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9791B40475;
	Tue, 20 Jan 2026 19:41:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id BEFE6122
 for <buildroot@buildroot.org>; Tue, 20 Jan 2026 19:41:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EE05581401
 for <buildroot@buildroot.org>; Tue, 20 Jan 2026 19:41:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aTdXenzOcXID for <buildroot@buildroot.org>;
 Tue, 20 Jan 2026 19:41:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EBDE481871
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id EBDE481871
 for <buildroot@buildroot.org>; Tue, 20 Jan 2026 19:41:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BFA0688072; Tue, 20 Jan 2026 19:41:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 20 Jan 2026 20:33:09 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: dd2122c6f095100110d7bf68daf81bf099dc4a60
X-Git-Newrev: 900c8524d5a7dabbb7d762edc369713207bfa92f
X-Patchwork-Hint: ignore
Message-Id: <20260120194118.BFA0688072@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] CHANGES: update for
 2025.02.10
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

commit: https://git.buildroot.net/buildroot/commit/?id=900c8524d5a7dabbb7d762edc369713207bfa92f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Co-authored-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 CHANGES | 74 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 74 insertions(+)

diff --git a/CHANGES b/CHANGES
index 238e852e88..ba8a572954 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,77 @@
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
