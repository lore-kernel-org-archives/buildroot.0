Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FAECC54FD4
	for <buildroot@archiver.kernel.org>; Fri, 20 Feb 2026 08:22:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DF35841840;
	Fri, 20 Feb 2026 08:22:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QCHwvrS-mgMH; Fri, 20 Feb 2026 08:22:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CF96D40B93
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771575745;
	bh=yiIPWI77OEUCCaRGkc5eLgtnFu85oa3M9jTgDZMmMKA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=IIwaF/IHs88aboXPOlk17KbT3h+Qvha94vJY8yPC4aTVEwr7nU9hu3TLgH8K6Zven
	 A9p87znrdJuVkaQvtdq5ygeCJC5gA9UuH2HcaF0gpKHviTaVtf/Nwebmmr025F1c/O
	 bK0bQ/2LYIbplZ/iLv1cGdvLTvG+ATbpvRXW+uo/FlL48szISEwGiCa02+3C1jPBvS
	 Ztj8IRgX7IJ8IYVZB6eJvdXQggA7pD5DZQ3Hbx/RrhiLBO01bNetc9KnbtWLwaWgMs
	 jHur0ygE6jUK+Yio4SPhQAaVfpoU0vCukmnPp9LPD+FTHUEZBvGLjArUUk9m5906WR
	 68G6DTwdcNdeQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CF96D40B93;
	Fri, 20 Feb 2026 08:22:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id A32B6355
 for <buildroot@buildroot.org>; Fri, 20 Feb 2026 08:22:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 88DF841380
 for <buildroot@buildroot.org>; Fri, 20 Feb 2026 08:22:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T7ty19AyJjOQ for <buildroot@buildroot.org>;
 Fri, 20 Feb 2026 08:22:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B47854136F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B47854136F
 for <buildroot@buildroot.org>; Fri, 20 Feb 2026 08:22:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A284F87162; Fri, 20 Feb 2026 08:22:22 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 20 Feb 2026 09:21:04 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c5b3baacafd3424e3512fd7ffc442eb41ca80d95
X-Git-Newrev: 4a7d1c029c7142a9c38b0cc179109974eb8952c8
X-Patchwork-Hint: ignore
Message-Id: <20260220082222.A284F87162@busybox.osuosl.org>
Subject: [Buildroot] [git commit] CHANGES: update for 2025.02.11
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/4a7d1c029c7142a9c38b0cc179109974eb8952c8
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
(cherry picked from commit 25dfd17a11c07ec1abfe17112b5b68ae60846ad2)
---
 CHANGES | 63 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/CHANGES b/CHANGES
index bb25c9ab2f..5abfb4aae4 100644
--- a/CHANGES
+++ b/CHANGES
@@ -832,6 +832,69 @@
 	- netsnmp: unexpected header length in /proc/net/snmp...
 	  https://gitlab.com/buildroot.org/buildroot/-/issues/110
 
+2025.02.11, released February 20, 2026
+
+	avahi: CVE-2021-3468, CVE-2023-38469, CVE-2023-38470, CVE-2023-38471,
+	  CVE-2023-38472, CVE-2023-38473, CVE-2024-52615, CVE-2024-52616,
+	  CVE-2025-68276, CVE-2025-68468, CVE-2025-68471, CVE-2026-24401
+	bind: CVE-2025-13878
+	busybox: CVE-2025-46394, CVE-2025-60876
+	expat: CVE-2026-24515, CVE-2026-25210
+	glibc: CVE-2025-15281, CVE-2026-0861, CVE-2026-0915
+	gnutls: CVE-2025-14831, CVE-2026-1584
+	haproxy: CVE-2025-11230
+	intel-microcode: CVE-2024-24853, CVE-2025-31648
+	libopenssl: CVE-2025-11187, CVE-2025-15467, CVE-2025-15468,
+	  CVE-2025-66199, CVE-2025-68160, CVE-2025-69418, CVE-2025-69419,
+	  CVE-2025-69420, CVE-2025-69421, CVE-2026-22795, CVE-2026-22796
+	libpng: CVE-2026-22695, CVE-2026-22801, CVE-2026-25646
+	libtasn1: CVE-2025-13151
+	libvpx
+	linux-pam: CVE-2024-10963
+	nginx: CVE-2025-53859
+	nodejs: CVE-2025-27210, CVE-2025-55130, CVE-2025-55131, CVE-2025-55132,
+	  CVE-2025-59465, CVE-2025-59466, CVE-2026-21637
+	python-django: CVE-2025-13473, CVE-2025-14550, CVE-2026-1207, CVE-2026-1285,
+	 CVE-2026-1287, CVE-2026-1312
+	python-urllib3: CVE-2026-21441
+	strongswan: CVE-2025-62291
+	tor: TROVE-2025-016
+	vim: CVE-2025-66476
+	webkitgtk
+
+	Infrastructure updates/fixes:
+
+	arm-trusted-firmware, at91bootstrap3, barebox, linux, opensbi, optee-os,
+	  uboot: Add support for custom license files
+	config-fragments/autobuild: drop a number of duplicated toolchains
+	generate-cyclonedx: fix dependencies
+	Makefile: add check-package-external target
+	pkg-stats: add -N/--needs-update option
+	pkg-stats: fix RuntimeError with python 3.14 asyncio
+	relocate-sdk.sh: pre-calculate files in need of relocation
+	system/Config.in: do not reference md5 for sha256 option
+	testing/run-tests: specify multiprocessing method
+	testing: python-requests: new runtime test
+	testing: test_python.py: disable interpreter colors
+	testing/tests/package/test_firewalld: use ext2 instead of cpio
+
+	Updated / fixed packages: asterisk, at91bootstrap3, avahi, berkeleydb,
+	bind, bitcoin, brltty, busybox, cryptsetup, dash, dc3dd, docker-engine,
+	easy-rsa, ell, expat, frr, glibc, gnutls, haproxy,
+	igmpproxy, intel-microcode, libcec, libcurl, libgphoto2, libgpiod2,
+	libite, libopenssl, libpng, libselinux,
+	libtasn1, libucl, libvpx, libwebsockets, linux, linux-headers,
+	linux-pam, localedef, lockdev, m4, manual, mcelog, mesa3d, mp4v2,
+	mpg123, mpir, mupdf, netdata, nginx, nodejs, php, php-lua, pkg-utils,
+	python3, python-django, python-jinja2, python-urllib3, rp-pppoe,
+	rust-bindgen, safeclib, screen, shadow, spandsp, strongswan, swig,
+	syslog-ng, tor, uclibc, uftp, util-linux, vim, webkitgtk,
+	wireless-regdb, xmlstarlet, zeek
+
+	New package: libpam-pkcs11
+
+	Removed packages: criu, cvs, dbus-triggerd, dvdrw-tools, libsvg, libsvg-cairo, lockdev, gconf,
+
 2025.02.10, released January 20, 2026
 
 	Important / security related fixes:
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
