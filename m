Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54347CD5BA4
	for <buildroot@archiver.kernel.org>; Wed, 20 May 2026 12:05:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 25F7E41167;
	Wed, 20 May 2026 12:05:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YEw3mILNzKim; Wed, 20 May 2026 12:05:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AB62341055
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779278754;
	bh=Z+3sQ4fqKqjkmP6+eDlUsrRC6thFlyLZ7e4oY7oLlnE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=o9Q21YyAKQ8D8h0YcMo2Cg0TP7ZEG7KIDXok8CpF9mF5vMLnvEd0k/JCD3SKtxXCI
	 PXabbSri5bh5IArziiPYIvBN8emiZcV4RuizNix2dmu5Pu7B3jtn/7LU/YhdmtktON
	 G3zRvJFZhCWXT1YJ5o0C0DfmUjsQoomZj61OdNuRAjk1S9jsAvogGdDY0ecbyDEE4c
	 xQzShiJMDqouKuHfccZGjfpp3TFyAh8VvR81a9qm2eiTnNwP1xuOp+iifW6bCrSVBp
	 aXQGTmfwUmHks3JhHgVLvLDJSLZm6dPosYQkYTiW4To+j4Ukii+YDwAUoZV/y8C2vC
	 ZZUCYCc7bkTYg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AB62341055;
	Wed, 20 May 2026 12:05:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 010401B2
 for <buildroot@buildroot.org>; Wed, 20 May 2026 12:05:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B2E0640FF3
 for <buildroot@buildroot.org>; Wed, 20 May 2026 12:05:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7IzBGaUPnfi2 for <buildroot@buildroot.org>;
 Wed, 20 May 2026 12:05:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D2F7D40F9B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D2F7D40F9B
 for <buildroot@buildroot.org>; Wed, 20 May 2026 12:05:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B4E2B868B0; Wed, 20 May 2026 12:05:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 20 May 2026 14:02:20 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 01f9b3d7f2068911af7d3f8e9cfde0037bf8279c
X-Git-Newrev: 91d019e5e254467d20f29abe95112031a10345c3
X-Patchwork-Hint: ignore
Message-Id: <20260520120542.B4E2B868B0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] CHANGES: Update for 2025.02.14
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/91d019e5e254467d20f29abe95112031a10345c3
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>

(cherry picked from commit 92f968895230a54f4408fe852a9f8efa207ef109)
---
 CHANGES | 133 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 133 insertions(+)

diff --git a/CHANGES b/CHANGES
index 611bdd5bff..e19ed03436 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1111,6 +1111,139 @@
 	- netsnmp: unexpected header length in /proc/net/snmp...
 	  https://gitlab.com/buildroot.org/buildroot/-/issues/110
 
+2025.02.14, released May 20, 2026
+
+	Changes with potentially large impact:
+
+	- ficl was downgraded to version 3.065 because ficl4 is no longer
+	  maintained.
+
+	Important / security related fixes:
+
+	apache: CVE-2026-23918, CVE-2026-24072, CVE-2026-28780, CVE-2026-29168,
+	  CVE-2026-29169, CVE-2026-33006, CVE-2026-33007, CVE-2026-33523,
+	  CVE-2026-33857, CVE-2026-34032, CVE-2026-34059
+	bubblewrap: CVE-2026-41163
+	cups: CVE-2026-27447, CVE-2026-34978, CVE-2026-34979, CVE-2026-34980,
+	  CVE-2026-34990, CVE-2026-39314, CVE-2026-39316, CVE-2026-41079
+	dash: CVE-2026-31323
+	dropbear: CVE-2019-6111, CVE-2026-35385
+	exim: CVE-2026-40684, CVE-2026-40685, CVE-2026-40686, CVE-2026-40687
+	expat: CVE-2026-7210, CVE-2026-41080
+	ffmpeg: CVE-2026-30997
+	freetype: CVE-2026-23865
+	ghostscript: (no CVE assigned)
+	giflib: CVE-2021-40633, CVE-2025-31344, CVE-2026-23868
+	gnutls: CVE-2026-33845, CVE-2026-33846, CVE-2026-3832, CVE-2026-3833,
+	  CVE-2026-42009, CVE-2026-42010, CVE-2026-42011, CVE-2026-42012,
+	  CVE-2026-42013, CVE-2026-42014, CVE-2026-42015, CVE-2026-5260,
+	  CVE-2026-5419
+	imagemagick: CVE-2026-28493, CVE-2026-28494, CVE-2026-28686,
+	  CVE-2026-28687, CVE-2026-28688, CVE-2026-28689, CVE-2026-28690,
+	  CVE-2026-28691, CVE-2026-28692, CVE-2026-28693, CVE-2026-30883,
+	  CVE-2026-30929, CVE-2026-30931, CVE-2026-30935, CVE-2026-30936,
+	  CVE-2026-30937, CVE-2026-31853, CVE-2026-32259, CVE-2026-32636,
+	  CVE-2026-33535, CVE-2026-33536, CVE-2026-33899, CVE-2026-33900,
+	  CVE-2026-33901, CVE-2026-33902, CVE-2026-33905, CVE-2026-33908,
+	  CVE-2026-34238, CVE-2026-40169, CVE-2026-40183, CVE-2026-40310,
+	  CVE-2026-40311, CVE-2026-40312
+	lcms2: CVE-2026-41254, CVE-2026-42798
+	libcap: CVE-2026-4878
+	libcurl: CVE-2026-7168, CVE-2026-7009, CVE-2026-6429, CVE-2026-6276,
+	  CVE-2026-6253, CVE-2026-5773, CVE-2026-5545, CVE-2026-4873
+	libexif: CVE-2026-40386, CVE-2026-40385, CVE-2026-32775
+	libjxl: CVE-2025-12474, CVE-2026-1837
+	libmicrohttpd: (no CVE assigned)
+	libpcap: CVE-2025-11961
+	libpjsip: CVE-2026-25994, CVE-2026-26203, CVE-2026-26967,
+	  CVE-2026-29068, CVE-2026-28799, CVE-2026-32942, CVE-2026-32945,
+	  CVE-2026-33069, CVE-2026-34235, CVE-2026-40614, CVE-2026-40892,
+	  CVE-2026-41416, CVE-2026-41415, CVE-2026-42225, CVE-2025-65102
+	libspdm: GHSA-m4wc-xmvg-369f, GHSA-j54w-759w-xj3m
+	liburiparser: CVE-2026-42371
+	libxml2: CVE-2026-6732
+	log4cxx: CVE-2025-54812, CVE-2025-54813, CVE-2026-40023
+	mbedtls: CVE-2025-66442, CVE-2026-25833, CVE-2026-25834,
+	  CVE-2026-25835, CVE-2026-34871, CVE-2026-34872, CVE-2026-34873,
+	  CVE-2026-34874, CVE-2026-34875, CVE-2026-34876, CVE-2026-34877
+	musl: CVE-2026-6042, CVE-2026-40200
+	nginx: CVE-2026-27654, CVE-2026-27784, CVE-2026-32647, CVE-2026-27651,
+	  CVE-2026-28753, CVE-2026-28755, CVE-2025-53859, CVE-2025-23419,
+	  CVE-2024-7347, CVE-2024-32760, CVE-2024-31079, CVE-2024-35200,
+	  CVE-2024-34161
+	opensc: CVE-2025-13763, CVE-2025-49010, CVE-2025-66215, CVE-2025-66038,
+	  CVE-2025-66037
+	openvpn: CVE-2026-40215, CVE-2026-35058
+	p11-kit: CVE-2026-2100
+	p7zip: CVE-2021-3520
+	proftpd: CVE-2026-42167
+	python-cbor2: CVE-2026-26209, CVE-2025-64076, CVE-2025-68131
+	python-django: CVE-2026-3902, CVE-2026-4277, CVE-2026-4292,
+	  CVE-2026-33033, CVE-2026-33034
+	python-pyasn1: CVE-2026-30922
+	python-pyopenssl: CVE-2026-27448, CVE-2026-27459
+	python-requests: CVE-2026-25645
+	python3: CVE-2024-6923, CVE-2025-13836, CVE-2025-59375
+	rsync: (no CVE assigned)
+	ruby: CVE-2026-41316
+	sqlite: CVE-2025-70873
+	strongswan: CVE-2026-25075
+	systemd: CVE-2026-40226
+	thrift: CVE-2025-48431, CVE-2026-41602, CVE-2026-41603, CVE-2026-41604,
+	  CVE-2026-41605, CVE-2026-41606, CVE-2026-41607, CVE-2026-41636,
+	  CVE-2026-43868, CVE-2026-43869, CVE-2026-43870
+	tor: CVE-2026-44597, CVE-2026-44599, CVE-2026-44600, CVE-2026-44601,
+	  CVE-2026-44602, CVE-2026-44603
+	util-linux: CVE-2026-27456
+	webkitgtk: CVE-2026-20643, CVE-2026-20664, CVE-2026-20665,
+	  CVE-2026-20691, CVE-2026-28857, CVE-2026-28859, CVE-2026-28861,
+	  CVE-2026-28871, CVE-2025-43457, CVE-2025-46299, CVE-2026-20608,
+	  CVE-2026-20635, CVE-2026-20636, CVE-2026-20644, CVE-2026-20652,
+	  CVE-2026-20676
+	wolfssl: CVE-2026-5264, CVE-2026-5263, CVE-2026-5295, CVE-2026-5466,
+	  CVE-2026-5477, CVE-2026-5447, CVE-2026-5500, CVE-2026-5501,
+	  CVE-2026-5503, CVE-2026-5187, CVE-2026-5188, CVE-2026-5448,
+	  CVE-2026-5772, CVE-2026-5778, CVE-2026-3548, CVE-2026-3549,
+	  CVE-2026-3547, CVE-2026-0819, CVE-2026-1005, CVE-2026-2645,
+	  CVE-2026-3230, CVE-2025-12888, CVE-2025-11936, CVE-2025-11935,
+	  CVE-2025-11934, CVE-2025-11933, CVE-2025-11931, CVE-2025-11932,
+	  CVE-2025-12889, CVE-2025-13912, CVE-2025-7395, CVE-2025-7394,
+	  CVE-2025-7396
+	wolftpm: CVE-2025-7844
+	xlib_libXpm: CVE-2026-4367
+	xserver_xorg-server: CVE-2026-33999, CVE-2026-34000, CVE-2026-34001,
+	  CVE-2026-34002, CVE-2026-34003
+	xwayland: CVE-2026-33999, CVE-2026-34000, CVE-2026-34001,
+	  CVE-2026-34002, CVE-2026-34003
+	xz: CVE-2025-31115, CVE-2026-34743
+
+	Toolchain:
+
+	- gcc: fix GCC 12, 13 and 14 build with host gcc 16, bump 12.x series
+	  to 12.5.0
+	- linux-headers: bump to 6.12.90, 6.6.140, 6.1.173, 5.15.207, 5.10.256
+
+	Infrastructure updates/fixes:
+
+	- Various improvements to pkg-stats.
+
+	New packages: libxmlsec1
+
+	Updated / fixed packages: apache, btrfs-progs, bubblewrap, c-icap,
+	  ca-certificates, cmake, cups, dash, dropbear, exim, expat, ffmpeg,
+	  ficl, freetype, frr, gcc, ghostscript, giflib, gnutls, haproxy,
+	  imagemagick, initscripts, kmod, lcms2, libarchive, libcap, libcurl,
+	  libexif, libinput, libjxl, libmicrohttpd, libpcap, libpjsip, libpng,
+	  libsodium, libspdm, liburiparser, libxml2, linux, linux-headers,
+	  log4cxx, mbedtls, mkpasswd, musl, mutt, neon, netsnmp,
+	  network-manager, nginx, opensc, openssh, openvpn, p11-kit, p7zip,
+	  proftpd, python-cbor2, python-certifi, python-django,
+	  python-magic-wormhole, python-pyasn1, python-pyopenssl,
+	  python-requests, python3, rsync, ruby, sqlite, strongswan, sudo,
+	  systemd, thrift, tor, util-linux, watchdogd, webkitgtk,
+	  wireless-regdb, wolfssl, wolftpm, xdg-dbus-proxy, xlib_libXpm,
+	  xserver_xorg-server, xwayland, xz
+
 2025.02.13, released April 21, 2026
 
 	Changes with potentially large impact:
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
