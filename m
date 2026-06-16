Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E53DCD98EC
	for <buildroot@archiver.kernel.org>; Tue, 16 Jun 2026 21:15:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1937960B69;
	Tue, 16 Jun 2026 21:15:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Vq6dbGeF5FNc; Tue, 16 Jun 2026 21:15:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 738526F584
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781644532;
	bh=IxNlqSVJ5IDxOwZcj2whR4huR5owLSk22aOYPfF1Vz4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=oF4NV9DquQpeoQTr54et18MxmIDf01Ic8T+r2bzMkE9q891a6IKl8G2hmyLo5Pk9q
	 cDvYgKgCyYZOgem4xgieVi1ApBivEU4yacHZfVlYcQ+c2PoFPaDZZOb6rArIU7R1MB
	 QiTOe0ajOglZsBGmmV+nyB87a1WQKzjX7UHxxa/wLmuRWEy6llVVaAgeumCMwJrmes
	 dOQKHqlE7iWsRTMTp6Pi+t4EOViQzDEKvIe9uyuzlXGVsa5NjEBGdUexg7nlUiYTt0
	 rQausVuxJT1mtr9gj0EgFbbCWptkS4iQmDDQ3Y99Aw8TiFy9LdtcVFS2huJeJguM5y
	 aSpk8VdTL9XFQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 738526F584;
	Tue, 16 Jun 2026 21:15:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 26FD6793
 for <buildroot@buildroot.org>; Tue, 16 Jun 2026 21:15:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0CFF784E2D
 for <buildroot@buildroot.org>; Tue, 16 Jun 2026 21:15:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sKpn98AeMA6w for <buildroot@buildroot.org>;
 Tue, 16 Jun 2026 21:15:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2FABE84DF4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2FABE84DF4
 for <buildroot@buildroot.org>; Tue, 16 Jun 2026 21:15:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DFDA280F5E; Tue, 16 Jun 2026 21:15:07 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 16 Jun 2026 23:14:05 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c1f82f7ae226e33e891a0d0091a96b865feb82ef
X-Git-Newrev: 20811dd818558bd2a1ec2bd47487c8febeb0bab3
X-Patchwork-Hint: ignore
Message-Id: <20260616211507.DFDA280F5E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] CHANGES: Update for 2025.02.15
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/20811dd818558bd2a1ec2bd47487c8febeb0bab3
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>

(cherry picked from commit 62ef29936b13122a322d38de7c29069ca755582b)
---
 CHANGES | 131 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 131 insertions(+)

diff --git a/CHANGES b/CHANGES
index 48ce9795bc..66b2fcd1d4 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1466,6 +1466,137 @@
 	- netsnmp: unexpected header length in /proc/net/snmp...
 	  https://gitlab.com/buildroot.org/buildroot/-/issues/110
 
+2025.02.15, released June 16, 2026
+
+	Important / security related fixes:
+
+	asterisk: GHSA-8fj4-fv9f-hjpc, GHSA-g88q-c2hm-q7p7,
+	  GHSA-j29p-pvh2-pvqp, GHSA-x5pq-qrp4-fmrj
+	bind: CVE-2026-3039, CVE-2026-3592, CVE-2026-5946, CVE-2026-5950
+	capnproto: CVE-2026-322, CVE-2026-32239, CVE-2026-32240
+	cups-filters: CVE-2025-64524
+	dnsmasq: CVE-2026-2291, CVE-2026-4890, CVE-2026-4891, CVE-2026-4892,
+	  CVE-2026-4893, CVE-2026-5172
+	dropbear: CVE-2019-6111, CVE-2026-35385
+	exim: (no CVE assigned), CVE-2026-48840
+	expat: CVE-2026-45186
+	freeipmi: CVE-2026-50031
+	glibc: CVE-2026-4046, CVE-2026-4437, CVE-2026-4438, CVE-2026-5450,
+	  CVE-2026-5928
+	go: (no CVE assigned), CVE-2025-61726, CVE-2025-61728, CVE-2025-61730,
+	  CVE-2025-61731, CVE-2025-61732, CVE-2025-68121, CVE-2025-68121,
+	  CVE-2026-25679, CVE-2026-27137, CVE-2026-27138, CVE-2026-27139,
+	  CVE-2026-27140, CVE-2026-27142, CVE-2026-27143, CVE-2026-27144,
+	  CVE-2026-32280, CVE-2026-32281, CVE-2026-32283, CVE-2026-32288,
+	  CVE-2026-32289, CVE-2026-33810, CVE-2026-33811, CVE-2026-33814,
+	  CVE-2026-39817, CVE-2026-39819, CVE-2026-39820, CVE-2026-39823,
+	  CVE-2026-39825, CVE-2026-39826, CVE-2026-39836, CVE-2026-42499,
+	  CVE-2026-42501
+	go-bootstrap-stage5: CVE-2026-33811, CVE-2026-33814, CVE-2026-39817,
+	  CVE-2026-39819, CVE-2026-39820, CVE-2026-39823, CVE-2026-39825,
+	  CVE-2026-39826, CVE-2026-39836, CVE-2026-42499, CVE-2026-42501
+	haveged: CVE-2026-41054
+	imagemagick: CVE-2026-42326, CVE-2026-45031, CVE-2026-45358,
+	  CVE-2026-45359, CVE-2026-45624, CVE-2026-45664, CVE-2026-46520,
+	  CVE-2026-46521, CVE-2026-46522, CVE-2026-46523, CVE-2026-46557,
+	  CVE-2026-46559
+	intel-microcode: CVE-2025-35979
+	libde265: CVE-2026-45382, CVE-2026-45383, GHSA-ccfw-29x7-rrx3,
+	  GHSA-j2qq-x2xq-g9wr
+	libgpg-error: T8239
+	libheif: CVE-2026-32738, CVE-2026-32739, CVE-2026-32740,
+	  CVE-2026-32741, CVE-2026-32814, CVE-2026-32882, CVE-2026-3949,
+	  CVE-2026-41069, CVE-2026-41071, CVE-2026-47178, CVE-2026-47247,
+	  CVE-2026-47251, CVE-2026-47254, CVE-2026-47709, CVE-2026-47714,
+	  GHSA-5hqq-636x-r3cr, GHSA-6x5f-qchq-cxqv, GHSA-jvmp-j3cw-84mh,
+	  GHSA-r7qj-cg5r-r6vf
+	libmad: CVE-2017-837, CVE-2017-8372, CVE-2017-8373, CVE-2017-8374
+	libmodsecurity: CVE-2026-30923, CVE-2026-42268
+	libssh2: CVE-2026-7598
+	liburiparser: CVE-2026-44927, CVE-2026-44928
+	libusb: CVE-2026-23679, CVE-2026-47104
+	libvncserver: CVE-2026-3285, CVE-2026-32853, CVE-2026-32854
+	linux-pam: CVE-2025-6020
+	mariadb: CVE-2026-34303, CVE-2026-3494, CVE-2026-44168, CVE-2026-44169,
+	  CVE-2026-44170, CVE-2026-44171, CVE-2026-44172, CVE-2026-44173
+	memcached: (no CVE assigned)
+	nginx: CVE-2026-40460, CVE-2026-40701, CVE-2026-42926, CVE-2026-42934,
+	  CVE-2026-42945, CVE-2026-42946, CVE-2026-9256
+	openssh: CVE-2025-61984, CVE-2025-61985, CVE-2026-35385,
+	  CVE-2026-35386, CVE-2026-35387, CVE-2026-35388, CVE-2026-35414
+	php: CVE-2025-14179, CVE-2026-6722, CVE-2026-6735, CVE-2026-7258,
+	  CVE-2026-7259, CVE-2026-7261, CVE-2026-7262, CVE-2026-7568
+	postgresql: CVE-2026-6472, CVE-2026-6473, CVE-2026-6474, CVE-2026-6475,
+	  CVE-2026-6476, CVE-2026-6477, CVE-2026-6478, CVE-2026-6479,
+	  CVE-2026-6575, CVE-2026-6637, CVE-2026-6638
+	putty: CVE-2026-48850, CVE-2026-48851, CVE-2026-48852
+	python-urllib3: CVE-2026-44431, CVE-2026-44432
+	python3: CVE-2026-3276, CVE-2026-7774, CVE-2026-8328
+	radvd: CVE-2026-48715
+	rsync: CVE-2026-29518, CVE-2026-43617, CVE-2026-43618, CVE-2026-43619,
+	  CVE-2026-43620, CVE-2026-45232
+	runc: CVE-2025-31133, CVE-2025-52565, CVE-2025-52881
+	samba4: CVE-2026-1933, CVE-2026-2340, CVE-2026-3012, CVE-2026-3238,
+	  CVE-2026-4408, CVE-2026-4480
+	sdl2_image: CVE-2026-35444
+	sed: CVE-2026-5958
+	sshfs: CVE-2026-47187, CVE-2026-48711
+	tor: TROVE-2026-013, TROVE-2026-014, TROVE-2026-015, TROVE-2026-016,
+	  TROVE-2026-017, TROVE-2026-018, TROVE-2026-019, TROVE-2026-020,
+	  TROVE-2026-021, TROVE-2026-022
+	unbound: CVE-2026-32792, CVE-2026-33278, CVE-2026-40622,
+	  CVE-2026-41292, CVE-2026-42534, CVE-2026-42923, CVE-2026-42944,
+	  CVE-2026-42959, CVE-2026-42960, CVE-2026-44390, CVE-2026-44608
+	unzip: CVE-2021-4217
+	xserver_xorg-server: (no CVE assigned)
+	xwayland: (no CVE assigned)
+
+	Toolchain:
+
+	- linux-headers:: bump to 5.10.257, 5.15.208, 6.1.174, 6.6.141, 6.12.91
+
+	Infrastructure updates/fixes:
+
+	- generate-cyclonedx: generate externalReferences with
+	  source-distribution
+	- Remove /usr/share/info/dir from target
+	- bump-stable-kernel-versions: update for split hash file
+	- cve-check: fix vulnerability timestamp to RFC 3339
+	- cve-check: remove 'bom-ref' for vulnerabilities
+	- generate-cyclonedx: add hashes from .hash files to externalReferences
+	- dependencies.sh: reject buggy uutils "install" on Ubuntu 26.04
+	- add 'make show-info-all'
+	- cve-check: fix vulnerabilities with different analysis
+	- kconfig: fix compiler warnings
+	- generate-cyclonedx: remove indirect dependencies from root component
+	- cve-check: add indication how to run
+	- generate-cyclonedx: generate vcs externalReferences for source repos
+	- gitlab-ci: use larger shared runners where necessary
+	- replicate IGNORE_CVES to host packages
+	- generate-cyclonedx: hint at missing Buildroot host package on a
+	  specific error
+
+	Updated defconfigs: at91sam9x5ek*
+
+	Updated / fixed packages: libmicrohttpd, qt53d, crucible, libgit2, php,
+	  esp-hosted, tzdata, libabseil-cpp, collectd, redis, swupdate,
+	  libdill, zsh, samba4, haveged, arm-trusted-firmware, weston,
+	  wireless-regdb, libssh2, go-bootstrap-stage5, jq, kodi, unbound,
+	  lrzip, libgpg-error, hplip, expat, heimdal, glibc, go, imagemagick,
+	  kexec, libnss, putty, libmad, vorbis-tools, libvncserver, rsync,
+	  mongoose, intel-microcode, freeipmi, openssh, dos2unix, liburiparser,
+	  zic, cups-filters, libks, odhcp6c, libmodsecurity, memcached,
+	  graphene, vlc, capnproto, faad2, gcc-bare-metal, mariadb, qt6base,
+	  python-ecdsa, runc, heirloom-mailx, icu, systemd, unzip, dnsmasq,
+	  gst1-plugins-bad, cairo, dropbear, libusb, asterisk, hiredis,
+	  linux-pam, sed, gstreamer1, xfsprogs, python-urllib3, radvd,
+	  qt5webengine-chromium, sshfs, gdb, python3, sane-backends,
+	  linux-headers:, zlib-ng, libheif, supertux, postgresql,
+	  gst1-plugins-good, libde265, libdrm, exim, linux, lrzsz, babeld,
+	  bind, nginx, stellarium, sdl2_image, tor, libpthsem, wpewebkit,
+	  libargon2, xwayland, python-cbor2, xserver_xorg-server, poppler,
+	  jemalloc
+
 2025.02.14, released May 20, 2026
 
 	Changes with potentially large impact:
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
