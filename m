Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5B6DF94CB1
	for <buildroot@archiver.kernel.org>; Tue, 21 Apr 2026 21:06:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 870F760A90;
	Tue, 21 Apr 2026 21:06:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0SmgbYeroa1Q; Tue, 21 Apr 2026 21:06:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AC70A60A9A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776805561;
	bh=Ftiq3Vgd3i8tsEv0UqpsoKFk66SuoJMjPixco7j5mlk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=frMPUrJiT+/rlPHGgOwyvFgmkA0SpO/2uYwOm4hlSuvij6f7X2r5PGiw9CBQNuKtc
	 ZzjyyawmTcQXAOr8jpHK/y4escibU2cxrKJbnJNxHR7R/LJgDu6WQ1HqdWqhLR1v92
	 qtKXSd8Zo8oTrqy6wq2qcGsIEQySwyNoHY+fo5Sbj2HJ7X0WD8l6kuSZii8OaNtHjx
	 W44I4A+RjEslcdOiDnGLy+23lyL93V19y61OUjeeJ1XzmnpiIYxKPxFBg2b5AmFIRx
	 Fwbs10jdCqD4zPQoJkXY7ymmeL61B9ShwJW9zV6vQnD5u64Ke5XurG4b7xhp+VIhZL
	 9+CBukFX6wB5w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AC70A60A9A;
	Tue, 21 Apr 2026 21:06:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C76F6259
 for <buildroot@buildroot.org>; Tue, 21 Apr 2026 21:05:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B873060A9B
 for <buildroot@buildroot.org>; Tue, 21 Apr 2026 21:05:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Nx64Uzw1ARfO for <buildroot@buildroot.org>;
 Tue, 21 Apr 2026 21:05:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D5F8D60A8E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D5F8D60A8E
 for <buildroot@buildroot.org>; Tue, 21 Apr 2026 21:05:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 781C1821F9; Tue, 21 Apr 2026 21:05:58 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 21 Apr 2026 20:26:13 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: d04c454ac392e3c85b6873717af09cbc68944d95
X-Git-Newrev: b1cb4bc5091c0c35b758abd57499404f2b47957a
X-Patchwork-Hint: ignore
Message-Id: <20260421210558.781C1821F9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] CHANGES: Update for
 2026.02.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b1cb4bc5091c0c35b758abd57499404f2b47957a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 CHANGES | 92 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 92 insertions(+)

diff --git a/CHANGES b/CHANGES
index 257c3ee8bc..c551daf010 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,95 @@
+2026.02.1, released April 21, 2026
+
+	Changes with potentially large impact:
+
+	- openssl was updated to 3.5.0 which has a few incompatible changes.
+	  See https://github.com/openssl/openssl/releases/tag/openssl-3.5.0
+
+	Important / security related fixes:
+
+	asterisk: CVE-2026-23739, CVE-2026-23741, CVE-2026-23738,
+	  CVE-2026-23740
+	bind: CVE-2026-1519
+	clamav: CVE-2026-20031
+	cpp-httplib: CVE-2026-21428, CVE-2026-22776, CVE-2026-28434,
+	  CVE-2026-28435, CVE-2026-29076, CVE-2026-31870, CVE-2026-32627,
+	  CVE-2026-33745, CVE-2026-34441
+	exiv2: CVE-2026-25884, CVE-2026-27596, CVE-2026-27631
+	expat: CVE-2026-32776, CVE-2026-32777, CVE-2026-32778
+	freetype: [No CVE tracking], CVE-2026-23865
+	giflib: CVE-2021-40633, CVE-2025-31344
+	go: CVE-2026-32289, CVE-2026-33810, CVE-2026-27144, CVE-2026-27143,
+	  CVE-2026-32288, CVE-2026-32283, CVE-2026-27140, CVE-2026-32280,
+	  CVE-2026-32281
+	libarchive: [No CVE tracking]
+	libcap: CVE-2026-4878
+	libcurl: CVE-2026-3805, CVE-2026-3784, CVE-2026-3783, CVE-2026-1965
+	libde265: CVE-2026-33164, CVE-2026-33165
+	libglib2: CVE-2025-13601, CVE-2026-1484, CVE-2026-1485, CVE-2026-1489
+	libgpiod2: [No CVE tracking]
+	libinput: CVE-2026-35093, CVE-2026-35094
+	libmicrohttpd: CVE-2025-59777, CVE-2025-62689
+	libopenssl: CVE-2026-31790, CVE-2026-28386, CVE-2026-28387,
+	  CVE-2026-28388, CVE-2026-28389, CVE-2026-28390, CVE-2026-31789
+	libpng: CVE-2026-33416, CVE-2026-33636, CVE-2026-34757
+	libsoup3: CVE-2025-14523
+	libtpms: CVE-2026-21444
+	libxml2: CVE-2026-1757, CVE-2026-0990, CVE-2026-0992, CVE-2025-10911,
+	  CVE-2026-0989
+	musl: CVE-2025-26519
+	nfs-utils: CVE-2025-12801
+	nghttp2: CVE-2026-27135
+	perl: CVE-2026-4176
+	python-django: CVE-2026-25673, CVE-2026-25674
+	python-flask: CVE-2026-27205
+	python-gpiod: [No CVE tracking]
+	python-pyasn1: CVE-2026-23490
+	python-pyjwt: CVE-2026-32597
+	python-wheel: CVE-2026-24049
+	python3: CVE-2026-4224, CVE-2026-3644, CVE-2026-2297
+	quickjs: CVE-2025-62490, CVE-2025-62491, CVE-2025-62492,
+	  CVE-2025-62493, CVE-2025-62494, CVE-2025-62495, CVE-2025-62496
+	rauc: CVE-2026-34155
+	redis: [No CVE tracking]
+	tor: TROVE-2026-003, TROVE-2026-004
+	wireshark: CVE-2026-3201, CVE-2026-3203
+	xz: CVE-2026-34743
+
+	Toolchain:
+
+	- linux-headers: bump to 6.19.12, 6.18.22, 6.12.81, 6.6.134, 6.1.168,
+	  5.15.202, 5.10.252
+	- uclibc: bump to 1.0.57
+
+	Infrastructure updates/fixes:
+
+	- cve-check: fix CVE URL format
+	- generate-cyclonedx: add source attribute with NVD reference for CVEs
+	- Add SECURITY.md
+	- Fix error handling in br2-external
+	- New runtime test for memcached
+	- Remove 32-bit EFI from runtime tests
+	- New runtime test for connman
+	- Added support for "secondary" target that are less often tested in
+	  autobuilders
+	- Update kernel and toolchain for some tests
+
+	Updated defconfigs: aarch64_efi, nitrogen*, stm32mp135f_dk,
+	versal2_vek385
+
+	Updated / fixed packages: asterisk, bind, bind, bootgen, clamav, cpp-
+	httplib, cpp-httplib, docker, edk2, exiv2, expat, faketime, freeradius-
+	server, freetype, freetype, giflib, giflib, go, igh-ethercat, jasper,
+	kodi, leafnode2, libarchive, libcap, libcurl, libde265, libftdi1,
+	libglib2, libgpiod2, libgpiod2, libheif, libinput, libmicrohttpd,
+	libopenssl, libpng, libpng, libsoup3, libtpms, libtpms, libvips,
+	libxml2, linux, linux-headers, ltp-testsuite, luvi, mesa3d, mpd, musl,
+	nfs-utils, nfs-utils, nghttp2, perl, php, postgresql, python-django,
+	python-flask, python-gpiod, python-pyasn1, python-pyjwt, python-tornado,
+	python-wheel, python3, python3, quickjs, rauc, redis, sqlite, sway, tor,
+	uboot, uclibc, wireshark, wpebackend-fdo, xen, xz, xz, zfs
+
+
 2026.02, released March 4th, 2026
 
 	Various fixes.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
