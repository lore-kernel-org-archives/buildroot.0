Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC366CD4F3C
	for <buildroot@archiver.kernel.org>; Wed, 20 May 2026 12:04:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8355340433;
	Wed, 20 May 2026 12:04:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5a3gwbkeT3uy; Wed, 20 May 2026 12:04:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 812FA40441
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779278644;
	bh=pyQt0xX5yhu8mZU6IkES9wEcwyvfI0BpUBF+sw5vnTg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=juh+SOSLuOwOJVLK4k/o8s4rVCv8foNjV8Kqex/u3ZDxVc/9h7I7Mb9cedaiO6X1X
	 LH5Ucpj93keMxMr0K7MaMtIjqRZWLtb6H6zpM6Xt/aIDBV6FoALUSPNyqZZTo8bFG2
	 MYUhTTqmYjUeOsTmUGxdKT9Vi2atMttiIfc6eS2VXqsGKtXsMBjXvR0daIBtp4IK4a
	 5qX8qmMZF3jRc1nulwIK6SXRVWDHXISyjpUJ043/eaCQn+MDmqgltB/I2rDUJyoJ8c
	 2CSZyw3QHPwtwVQR00fXpl9lUgzDyWv8DNg0OHToUnPhfgthM+PoPfFgBiRyrrHftp
	 bM+qZXKor+eXA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 812FA40441;
	Wed, 20 May 2026 12:04:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C8FFF357
 for <buildroot@buildroot.org>; Wed, 20 May 2026 12:04:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BACFE4050E
 for <buildroot@buildroot.org>; Wed, 20 May 2026 12:04:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oXkoz11wZ6eY for <buildroot@buildroot.org>;
 Wed, 20 May 2026 12:04:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D2D3440433
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D2D3440433
 for <buildroot@buildroot.org>; Wed, 20 May 2026 12:04:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BE134868AE; Wed, 20 May 2026 12:03:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 20 May 2026 12:01:57 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: d1d3cf26d24590e73c214d319e95e4cceac0dad5
X-Git-Newrev: 9bf4d998d896aeef2cbf984779141e31d4a49a8f
X-Patchwork-Hint: ignore
Message-Id: <20260520120352.BE134868AE@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] CHANGES: Update for
 2026.02.2
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/9bf4d998d896aeef2cbf984779141e31d4a49a8f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 CHANGES | 151 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 151 insertions(+)

diff --git a/CHANGES b/CHANGES
index c551daf010..e6d7219f4d 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,154 @@
+2026.02.2, released May 20, 2026
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
+	ghostscript: (no CVE assigned)
+	gnutls: CVE-2026-33845, CVE-2026-33846, CVE-2026-3832, CVE-2026-3833,
+	  CVE-2026-42009, CVE-2026-42010, CVE-2026-42011, CVE-2026-42012,
+	  CVE-2026-42013, CVE-2026-42014, CVE-2026-42015, CVE-2026-5260,
+	  CVE-2026-5419
+	go: CVE-2026-33811, CVE-2026-33814, CVE-2026-39817, CVE-2026-39819,
+	  CVE-2026-39820, CVE-2026-39823, CVE-2026-39825, CVE-2026-39826,
+	  CVE-2026-39836, CVE-2026-42499, CVE-2026-42501
+	go-bootstrap-stage5: CVE-2026-33811, CVE-2026-33814, CVE-2026-39817,
+	  CVE-2026-39819, CVE-2026-39820, CVE-2026-39823, CVE-2026-39825,
+	  CVE-2026-39826, CVE-2026-39836, CVE-2026-42499, CVE-2026-42501
+	imagemagick: CVE-2026-28493, CVE-2026-28494, CVE-2026-28686,
+	  CVE-2026-28687, CVE-2026-28688, CVE-2026-28689, CVE-2026-28690,
+	  CVE-2026-28691, CVE-2026-28692, CVE-2026-28693, CVE-2026-30883,
+	  CVE-2026-30929, CVE-2026-30931, CVE-2026-30935, CVE-2026-30936,
+	  CVE-2026-30937, CVE-2026-31853, CVE-2026-32259, CVE-2026-32636,
+	  CVE-2026-33535, CVE-2026-33536, CVE-2026-33899, CVE-2026-33900,
+	  CVE-2026-33901, CVE-2026-33902, CVE-2026-33905, CVE-2026-33908,
+	  CVE-2026-34238, CVE-2026-40169, CVE-2026-40183, CVE-2026-40310,
+	  CVE-2026-40311, CVE-2026-40312
+	lcms2: CVE-2026-41254
+	libarchive: (no CVE assigned)
+	libcurl: CVE-2026-7168, CVE-2026-7009, CVE-2026-6429, CVE-2026-6276,
+	  CVE-2026-6253, CVE-2026-5773, CVE-2026-5545, CVE-2026-4873
+	libexif: CVE-2026-40386, CVE-2026-40385, CVE-2026-32775
+	libjxl: CVE-2025-12474, CVE-2026-1837
+	libmicrohttpd: (no CVE assigned)
+	libpcap: CVE-2025-11961
+	libpjsip: CVE-2025-65102, CVE-2026-25994, CVE-2026-26203,
+	  CVE-2026-26967, CVE-2026-29068, CVE-2026-28799, CVE-2026-32942,
+	  CVE-2026-32945, CVE-2026-33069, CVE-2026-34235, CVE-2026-40614,
+	  CVE-2026-40892, CVE-2026-41416, CVE-2026-41415, CVE-2026-42225
+	libsodium: (no CVE assigned)
+	libspdm: GHSA-m4wc-xmvg-369f, GHSA-j54w-759w-xj3m
+	liburiparser: CVE-2026-42371
+	libxml2: CVE-2026-6732
+	linux-pam: CVE-2025-6020
+	log4cxx: CVE-2025-54812, CVE-2025-54813, CVE-2026-40023
+	mbedtls: CVE-2025-66442, CVE-2026-25833, CVE-2026-25834,
+	  CVE-2026-25835, CVE-2026-34871, CVE-2026-34872, CVE-2026-34873,
+	  CVE-2026-34874, CVE-2026-34875, CVE-2026-34876, CVE-2026-34877
+	musl: CVE-2026-6042, CVE-2026-40200
+	nginx: CVE-2026-27654, CVE-2026-27784, CVE-2026-32647, CVE-2026-27651,
+	  CVE-2026-28753, CVE-2026-28755
+	opensc: CVE-2025-13763, CVE-2025-49010, CVE-2025-66215, CVE-2025-66038,
+	  CVE-2025-66037
+	openvpn: CVE-2026-40215, CVE-2026-35058
+	p11-kit: CVE-2026-2100
+	p7zip: CVE-2021-3520
+	php: CVE-2026-7263, CVE-2026-6735, CVE-2026-29078, CVE-2026-29079,
+	  CVE-2026-7259, CVE-2026-6104, CVE-2025-14179, CVE-2026-6722,
+	  CVE-2026-7261, CVE-2026-7262, CVE-2026-7568, CVE-2026-7258,
+	  CVE-2026-42371
+	proftpd: CVE-2026-42167
+	python-cbor2: CVE-2026-26209
+	python-django: CVE-2026-5766, CVE-2026-35192, CVE-2026-6907,
+	  CVE-2026-3902, CVE-2026-4277, CVE-2026-4292, CVE-2026-33033,
+	  CVE-2026-33034
+	python-lmdb: CVE-2019-16224, CVE-2019-16225, CVE-2019-16226,
+	  CVE-2019-16227, CVE-2019-16228
+	python-magic-wormhole: CVE-2026-32116
+	python-pyasn1: CVE-2026-30922
+	python-pyopenssl: CVE-2026-40475, CVE-2026-27459, CVE-2026-27448
+	python-requests: CVE-2026-25645
+	rsync: (no CVE assigned)
+	ruby: CVE-2026-41316
+	squid: CVE-2026-32748, CVE-2026-33515, CVE-2026-33526
+	strongswan: CVE-2026-25075
+	systemd: CVE-2026-29111, CVE-2026-40226
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
+	wireshark: CVE-2026-5409, CVE-2026-5408, CVE-2026-5406, CVE-2026-5407,
+	  CVE-2026-5299, CVE-2026-5401, CVE-2026-5404, CVE-2026-5403,
+	  CVE-2026-5405, CVE-2026-5654, CVE-2026-5657, CVE-2026-5656,
+	  CVE-2026-5653, CVE-2026-6538, CVE-2026-6537, CVE-2026-6535,
+	  CVE-2026-6534, CVE-2026-6533, CVE-2026-6532, CVE-2026-6531,
+	  CVE-2026-6530, CVE-2026-6529, CVE-2026-6527, CVE-2026-6524,
+	  CVE-2026-6523, CVE-2026-6521, CVE-2026-6520, CVE-2026-6519,
+	  CVE-2026-6522, CVE-2026-6870, CVE-2026-6869, CVE-2026-6868
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
+	xdg-dbus-proxy: (no CVE assigned)
+	xlib_libXpm: CVE-2026-4367
+	xserver_xorg-server: CVE-2026-33999, CVE-2026-34000, CVE-2026-34001,
+	  CVE-2026-34002, CVE-2026-34003
+	xwayland: CVE-2026-33999, CVE-2026-34000, CVE-2026-34001,
+	  CVE-2026-34002, CVE-2026-34003
+
+	Toolchain:
+
+	- gcc: fix GCC 13, 14 and 15 build with host GCC 16
+	- linux-headers: bump to 5.10.256, 5.15.207, 6.1.173, 6.6.140, 6.12.90,
+	  6.18.32, 6.19.14
+
+	Infrastructure updates/fixes:
+
+	- Various improvements to pkg-stats.
+
+	Updated / fixed packages: apache, bat, btrfs-progs, bubblewrap,
+	  c-icap, ca-certificates, cups, dash, dropbear, eudev, exim, expat,
+	  ffmpeg, ficl, frr, gcc, ghostscript, gnutls, go, go-bootstrap-stage5,
+	  haproxy, imagemagick, kmod, lcms2, libarchive, libcurl, libexif,
+	  libjxl, libmicrohttpd, libpcap, libpjsip, libpng, libsodium, libspdm,
+	  liburiparser, libxml2, linux, linux-headers, linux-pam, log4cxx,
+	  make, mbedtls, mkpasswd, musl, mutt, neon, netsnmp, network-manager,
+	  nginx, opensc, openssh, openvpn, p11-kit, p7zip, php, proftpd,
+	  python-cbor2, python-certifi, python-django, python-lmdb,
+	  python-magic-wormhole, python-pyasn1, python-pyopenssl,
+	  python-requests, python3, rsync, ruby, squid, strongswan, sudo,
+	  systemd, thrift, tor, util-linux, watchdogd, webkitgtk,
+	  wireless-regdb, wireshark, wolfssl, wolftpm, xdg-dbus-proxy,
+	  xlib_libXpm, xserver_xorg-server, xwayland
+
+
 2026.02.1, released April 21, 2026
 
 	Changes with potentially large impact:
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
