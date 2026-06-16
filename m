Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF19ECD98E1
	for <buildroot@archiver.kernel.org>; Tue, 16 Jun 2026 21:01:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8E2BA60BEB;
	Tue, 16 Jun 2026 21:01:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cfZPp0GNiRL5; Tue, 16 Jun 2026 21:01:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 548EC6164B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781643712;
	bh=sJYzNcYZZ4Z6PgXDytXqgnR2GiZjEk5Xk0pAMRRjrE0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=jOTZhYb5k8Ot7KlPOXNlyK4Fp490DvDNppd8bdhzEgt+9bNnMrPT+rTTFAmeY5jII
	 7/M4vR2+qAlg3VIqKoquwx8kaII9qFMUOTHveTdj2OcYZvSx/oJNUvEbOn/kwFg4le
	 auwhrAWCUQBL6Pvx2Ah7ADd8/Ulxd7utiJB2GIKqmdDMb93zL7ljjc7bGwWPqntrsm
	 lSlIYCjVvJmTv0NFL+v+aaaE0v1ke7//cFb3ttdTDPQXaKjt3rML+xU45+wkc8q7Xf
	 Gy2biptybZIjIrZN+KCZn2l3dvQ8CK/EyJ8T+YbMv9xfzoOZClXq1srC5Haz4WOpMc
	 nxX1eNk/6C6EA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 548EC6164B;
	Tue, 16 Jun 2026 21:01:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3E5C4347
 for <buildroot@buildroot.org>; Tue, 16 Jun 2026 21:01:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3082E84CFD
 for <buildroot@buildroot.org>; Tue, 16 Jun 2026 21:01:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m3sxoa3CQPAF for <buildroot@buildroot.org>;
 Tue, 16 Jun 2026 21:01:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 320A684CEE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 320A684CEE
 for <buildroot@buildroot.org>; Tue, 16 Jun 2026 21:01:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E02FA80F4B; Tue, 16 Jun 2026 21:01:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 16 Jun 2026 22:50:17 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: 702b01dc967a7d243283fc06f3a8e370e5865fb4
X-Git-Newrev: dad077f48d19c7dbcee062dcfc273fc875da1bff
X-Patchwork-Hint: ignore
Message-Id: <20260616210127.E02FA80F4B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] CHANGES: Update for
 2026.02.3
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/dad077f48d19c7dbcee062dcfc273fc875da1bff
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 CHANGES | 124 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 124 insertions(+)

diff --git a/CHANGES b/CHANGES
index e6d7219f4d..d68dc40d76 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,127 @@
+2026.02.3, released June 16, 2026
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
+	docker-engine: CVE-2025-54388
+	dropbear: CVE-2019-6111, CVE-2026-35385
+	exim: (no CVE assigned), CVE-2026-48840
+	expat: CVE-2026-45186
+	freeipmi: CVE-2026-50031
+	glibc: CVE-2026-4046, CVE-2026-4437, CVE-2026-4438, CVE-2026-5450,
+	  CVE-2026-5928
+	gnupg2: (no CVE assigned)
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
+	mariadb: CVE-2026-34303, CVE-2026-3494, CVE-2026-44168, CVE-2026-44169,
+	  CVE-2026-44170, CVE-2026-44171, CVE-2026-44172, CVE-2026-44173
+	memcached: (no CVE assigned)
+	nginx: CVE-2026-40460, CVE-2026-40701, CVE-2026-42926, CVE-2026-42934,
+	  CVE-2026-42945, CVE-2026-42946, CVE-2026-9256
+	php: CVE-2026-44927, CVE-2026-44928
+	postgresql: CVE-2026-6472, CVE-2026-6473, CVE-2026-6474, CVE-2026-6475,
+	  CVE-2026-6476, CVE-2026-6477, CVE-2026-6478, CVE-2026-6479,
+	  CVE-2026-6575, CVE-2026-6637, CVE-2026-6638
+	privoxy: OVE-20260515-0001, OVE-20260515-0002
+	putty: (no CVE assigned)
+	python-urllib3: CVE-2026-44431, CVE-2026-44432
+	python3: CVE-2026-3276, CVE-2026-7774, CVE-2026-8328, gh-146211,
+	  gh-146333, gh-148169, gh-148178, gh-148395, gh-149017, gh-149254,
+	  gh-90309
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
+	- linux-headers: bump to 5.10.257, 5.15.208, 6.1.174, 6.6.141, 6.12.91,
+	  6.18.33
+
+	Infrastructure updates/fixes:
+
+	- cve-check: fix vulnerabilities with different analysis
+	- generate-cyclonedx: add hashes from .hash files to externalReferences
+	- generate-cyclonedx: hint at missing Buildroot host package on a
+	  specific error
+	- bump-stable-kernel-versions: update for split hash file
+	- kconfig: fix compiler warnings
+	- cve-check: add indication how to run
+	- Remove /usr/share/info/dir from target
+	- generate-cyclonedx: remove indirect dependencies from root component
+	- replicate IGNORE_CVES to host packages
+	- cve-check: remove 'bom-ref' for vulnerabilities
+	- generate-cyclonedx: generate externalReferences with
+	  source-distribution
+	- cve-check: fix vulnerability timestamp to RFC 3339
+	- generate-cyclonedx: generate vcs externalReferences for source repos
+	- gitlab-ci: use larger shared runners where necessary
+	- add 'make show-info-all'
+	- dependencies.sh: reject buggy uutils "install" on Ubuntu 26.04
+
+	Updated defconfigs: arcturus_ucp1020, at91sam9x5ek*
+
+	Updated / fixed packages: kexec, zsh, cups-filters, python-cbor2,
+	  haveged, lrzsz, ustream-ssl, expat, xwayland, libvncserver, liburing,
+	  sysrepo, qt53d, collectd, mariadb, gstreamer1, jemalloc, libks,
+	  lua-sdl2, util-linux, vlc, xfsprogs, kodi, bind, libde265,
+	  docker-cli, libabseil-cpp, wpewebkit, libpthsem, heirloom-mailx, icu,
+	  libheif, podman, unbound, dropbear, vorbis-tools, crucible, unzip,
+	  libssh2, python3, imagemagick, libbpf, gdb, capnproto, esp-hosted,
+	  freeipmi, asterisk, wireless-regdb, intel-microcode, weston,
+	  util-linux-libs, linux-headers, qt6base, zlib-ng, libgphoto2, hplip,
+	  bpftrace, postgresql, babeld, sed, libdrm, lrzip, odhcp6c, linux,
+	  efl, libusb, jq, sane-airscan, libmad, faad2, dnsmasq, privoxy,
+	  libgit2, mrp, putty, sshfs, gcc-bare-metal, graphene, mongoose,
+	  rsync, redis, hiredis, cairo, zic, dos2unix, libargon2,
+	  docker-engine, sane-backends, arm-trusted-firmware, libnss, openscap,
+	  opencv4, liburiparser, libdill, radvd, poppler, tzdata,
+	  gst1-plugins-bad, python-ecdsa, php, stellarium, python-aiodns,
+	  nginx, gnupg2, tor, xerces, gst1-plugins-good, libmodsecurity,
+	  sdl2_image, readline, libgpg-error, samba4, runc,
+	  xserver_xorg-server, glibc, memcached, libmicrohttpd, supertux, exim,
+	  python-urllib3, qt5webengine-chromium
+
+
 2026.02.2, released May 20, 2026
 
 	Changes with potentially large impact:
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
