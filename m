Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91EA6CD98E1
	for <buildroot@archiver.kernel.org>; Tue, 16 Jun 2026 21:14:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 57E7B607CC;
	Tue, 16 Jun 2026 21:14:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mg29WdJmiQMk; Tue, 16 Jun 2026 21:14:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4CD6560832
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781644440;
	bh=Z2I3JFyaC7vZiLLAL0Z7/jVJK+MZiVPbK68rj7r8sWM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=tINpHEoTfRqKj9vjb1mzzKxZrVsaOWnLYlSaVV4HlU5kXwlVZMieSJ2Ob2wjKF0td
	 D3Py70spt6zUNZeGl/W36OqtWJr0SeOgmHlHgx6goRpZ0Zv4H7B7V5u3VW9k6ud79t
	 fh5g7og4qQO8WQqw7yT+hHfH7UqK327gK07pp9Tudbqqz7UI2Gn7FmHSbXQCr/I/od
	 7We8E31c1lYV/3kIqzjJ4PE6uaLRkGvs/ZOrdbCajcaMjDxsEol0MeeubMnTcU8QqW
	 sapX8SfPEsgzjV96p0nyxVsjcIaM2WGniVzhf9edIiDeAy6etOXgQdol+eP1XKWqUB
	 o/Bf+lEo6RQ2g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4CD6560832;
	Tue, 16 Jun 2026 21:14:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9546F347;
 Tue, 16 Jun 2026 21:13:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7B4AD80FA7;
 Tue, 16 Jun 2026 21:13:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wXvjSQMy1EAZ; Tue, 16 Jun 2026 21:13:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 24BB580FA2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 24BB580FA2
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 24BB580FA2;
 Tue, 16 Jun 2026 21:13:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 904A7B97CBAE; Tue, 16 Jun 2026 23:13:54 +0200 (CEST)
To: buildroot-lts-sponsors@buildroot.org, buildroot-users@buildroot.org,
 buildroot@buildroot.org
Date: Tue, 16 Jun 2026 23:13:53 +0200
Message-ID: <buildroot-2025.02.15-announce-1781644433@buildroot.org>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1781644434; h=from:subject:date:message-id:to:mime-version:
 content-transfer-encoding; bh=3+mpw6lin+WDSgjqgwTrlit9R6c9NGUzU0rXesAYi2k=;
 b=VrsaG3xEF3XspVhu8kH6w8ZisIh21yC2Zv5NPHxjagvSyVzyy3nvV6FJclvnVOJAR5tsrX
 vbvmvUjDDzQxMDWxWMRafcN/HjMlUFrcNRTT/3In9dvKyNmihMwPaf2OrmYJR04zqGoDOe
 WZp5YXfROHmJgtu7Ed+Rr6C+qeAOrjF0dfwmpuDa5lGSiG6MHJ3CTt97Yt42wlX3Rtz1uB
 sBplGObADJwrQN6sXBhOmMEyYmvbpdKJWtPW/drCNCjxzoSuIoYdbtTB2mEO+IMo7b4zQY
 al/fAJnqY4TaYakbBvfnUrILPGkbWQq+31hB2pOt41CWZkNats1BX645ZbuCxA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=VrsaG3xE
Subject: [Buildroot] Buildroot 2025.02.15 released
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,

Buildroot is a simple tool for creating complete embedded Linux systems
(https://buildroot.org).

Buildroot 2025.02.15 is released - Go download it at:

https://buildroot.org/downloads/buildroot-2025.02.15.tar.gz

or

https://buildroot.org/downloads/buildroot-2025.02.15.tar.xz

Or get it from Git:

https://gitlab.com/buildroot.org/buildroot.git (2025.02.15 tag)

Buildroot 2025.02.15 is a bugfix release, fixing a number of important /
security related issues discovered since the 2025.02.14 release.

Important / security related fixes:

asterisk: GHSA-8fj4-fv9f-hjpc, GHSA-g88q-c2hm-q7p7,
  GHSA-j29p-pvh2-pvqp, GHSA-x5pq-qrp4-fmrj
bind: CVE-2026-3039, CVE-2026-3592, CVE-2026-5946, CVE-2026-5950
capnproto: CVE-2026-322, CVE-2026-32239, CVE-2026-32240
cups-filters: CVE-2025-64524
dnsmasq: CVE-2026-2291, CVE-2026-4890, CVE-2026-4891, CVE-2026-4892,
  CVE-2026-4893, CVE-2026-5172
dropbear: CVE-2019-6111, CVE-2026-35385
exim: (no CVE assigned), CVE-2026-48840
expat: CVE-2026-45186
freeipmi: CVE-2026-50031
glibc: CVE-2026-4046, CVE-2026-4437, CVE-2026-4438, CVE-2026-5450,
  CVE-2026-5928
go: (no CVE assigned), CVE-2025-61726, CVE-2025-61728, CVE-2025-61730,
  CVE-2025-61731, CVE-2025-61732, CVE-2025-68121, CVE-2025-68121,
  CVE-2026-25679, CVE-2026-27137, CVE-2026-27138, CVE-2026-27139,
  CVE-2026-27140, CVE-2026-27142, CVE-2026-27143, CVE-2026-27144,
  CVE-2026-32280, CVE-2026-32281, CVE-2026-32283, CVE-2026-32288,
  CVE-2026-32289, CVE-2026-33810, CVE-2026-33811, CVE-2026-33814,
  CVE-2026-39817, CVE-2026-39819, CVE-2026-39820, CVE-2026-39823,
  CVE-2026-39825, CVE-2026-39826, CVE-2026-39836, CVE-2026-42499,
  CVE-2026-42501
go-bootstrap-stage5: CVE-2026-33811, CVE-2026-33814, CVE-2026-39817,
  CVE-2026-39819, CVE-2026-39820, CVE-2026-39823, CVE-2026-39825,
  CVE-2026-39826, CVE-2026-39836, CVE-2026-42499, CVE-2026-42501
haveged: CVE-2026-41054
imagemagick: CVE-2026-42326, CVE-2026-45031, CVE-2026-45358,
  CVE-2026-45359, CVE-2026-45624, CVE-2026-45664, CVE-2026-46520,
  CVE-2026-46521, CVE-2026-46522, CVE-2026-46523, CVE-2026-46557,
  CVE-2026-46559
intel-microcode: CVE-2025-35979
libde265: CVE-2026-45382, CVE-2026-45383, GHSA-ccfw-29x7-rrx3,
  GHSA-j2qq-x2xq-g9wr
libgpg-error: T8239
libheif: CVE-2026-32738, CVE-2026-32739, CVE-2026-32740,
  CVE-2026-32741, CVE-2026-32814, CVE-2026-32882, CVE-2026-3949,
  CVE-2026-41069, CVE-2026-41071, CVE-2026-47178, CVE-2026-47247,
  CVE-2026-47251, CVE-2026-47254, CVE-2026-47709, CVE-2026-47714,
  GHSA-5hqq-636x-r3cr, GHSA-6x5f-qchq-cxqv, GHSA-jvmp-j3cw-84mh,
  GHSA-r7qj-cg5r-r6vf
libmad: CVE-2017-837, CVE-2017-8372, CVE-2017-8373, CVE-2017-8374
libmodsecurity: CVE-2026-30923, CVE-2026-42268
libssh2: CVE-2026-7598
liburiparser: CVE-2026-44927, CVE-2026-44928
libusb: CVE-2026-23679, CVE-2026-47104
libvncserver: CVE-2026-3285, CVE-2026-32853, CVE-2026-32854
linux-pam: CVE-2025-6020
mariadb: CVE-2026-34303, CVE-2026-3494, CVE-2026-44168, CVE-2026-44169,
  CVE-2026-44170, CVE-2026-44171, CVE-2026-44172, CVE-2026-44173
memcached: (no CVE assigned)
nginx: CVE-2026-40460, CVE-2026-40701, CVE-2026-42926, CVE-2026-42934,
  CVE-2026-42945, CVE-2026-42946, CVE-2026-9256
openssh: CVE-2025-61984, CVE-2025-61985, CVE-2026-35385,
  CVE-2026-35386, CVE-2026-35387, CVE-2026-35388, CVE-2026-35414
php: CVE-2025-14179, CVE-2026-6722, CVE-2026-6735, CVE-2026-7258,
  CVE-2026-7259, CVE-2026-7261, CVE-2026-7262, CVE-2026-7568
postgresql: CVE-2026-6472, CVE-2026-6473, CVE-2026-6474, CVE-2026-6475,
  CVE-2026-6476, CVE-2026-6477, CVE-2026-6478, CVE-2026-6479,
  CVE-2026-6575, CVE-2026-6637, CVE-2026-6638
putty: CVE-2026-48850, CVE-2026-48851, CVE-2026-48852
python-urllib3: CVE-2026-44431, CVE-2026-44432
python3: CVE-2026-3276, CVE-2026-7774, CVE-2026-8328
radvd: CVE-2026-48715
rsync: CVE-2026-29518, CVE-2026-43617, CVE-2026-43618, CVE-2026-43619,
  CVE-2026-43620, CVE-2026-45232
runc: CVE-2025-31133, CVE-2025-52565, CVE-2025-52881
samba4: CVE-2026-1933, CVE-2026-2340, CVE-2026-3012, CVE-2026-3238,
  CVE-2026-4408, CVE-2026-4480
sdl2_image: CVE-2026-35444
sed: CVE-2026-5958
sshfs: CVE-2026-47187, CVE-2026-48711
tor: TROVE-2026-013, TROVE-2026-014, TROVE-2026-015, TROVE-2026-016,
  TROVE-2026-017, TROVE-2026-018, TROVE-2026-019, TROVE-2026-020,
  TROVE-2026-021, TROVE-2026-022
unbound: CVE-2026-32792, CVE-2026-33278, CVE-2026-40622,
  CVE-2026-41292, CVE-2026-42534, CVE-2026-42923, CVE-2026-42944,
  CVE-2026-42959, CVE-2026-42960, CVE-2026-44390, CVE-2026-44608
unzip: CVE-2021-4217
xserver_xorg-server: (no CVE assigned)
xwayland: (no CVE assigned)

Toolchain:

- linux-headers:: bump to 5.10.257, 5.15.208, 6.1.174, 6.6.141, 6.12.91

Infrastructure updates/fixes:

- generate-cyclonedx: generate externalReferences with
  source-distribution
- Remove /usr/share/info/dir from target
- bump-stable-kernel-versions: update for split hash file
- cve-check: fix vulnerability timestamp to RFC 3339
- cve-check: remove 'bom-ref' for vulnerabilities
- generate-cyclonedx: add hashes from .hash files to externalReferences
- dependencies.sh: reject buggy uutils "install" on Ubuntu 26.04
- add 'make show-info-all'
- cve-check: fix vulnerabilities with different analysis
- kconfig: fix compiler warnings
- generate-cyclonedx: remove indirect dependencies from root component
- cve-check: add indication how to run
- generate-cyclonedx: generate vcs externalReferences for source repos
- gitlab-ci: use larger shared runners where necessary
- replicate IGNORE_CVES to host packages
- generate-cyclonedx: hint at missing Buildroot host package on a
  specific error

Updated defconfigs: at91sam9x5ek*

Updated / fixed packages: libmicrohttpd, qt53d, crucible, libgit2, php,
  esp-hosted, tzdata, libabseil-cpp, collectd, redis, swupdate,
  libdill, zsh, samba4, haveged, arm-trusted-firmware, weston,
  wireless-regdb, libssh2, go-bootstrap-stage5, jq, kodi, unbound,
  lrzip, libgpg-error, hplip, expat, heimdal, glibc, go, imagemagick,
  kexec, libnss, putty, libmad, vorbis-tools, libvncserver, rsync,
  mongoose, intel-microcode, freeipmi, openssh, dos2unix, liburiparser,
  zic, cups-filters, libks, odhcp6c, libmodsecurity, memcached,
  graphene, vlc, capnproto, faad2, gcc-bare-metal, mariadb, qt6base,
  python-ecdsa, runc, heirloom-mailx, icu, systemd, unzip, dnsmasq,
  gst1-plugins-bad, cairo, dropbear, libusb, asterisk, hiredis,
  linux-pam, sed, gstreamer1, xfsprogs, python-urllib3, radvd,
  qt5webengine-chromium, sshfs, gdb, python3, sane-backends,
  linux-headers:, zlib-ng, libheif, supertux, postgresql,
  gst1-plugins-good, libde265, libdrm, exim, linux, lrzsz, babeld,
  bind, nginx, stellarium, sdl2_image, tor, libpthsem, wpewebkit,
  libargon2, xwayland, python-cbor2, xserver_xorg-server, poppler,
  jemalloc

For more details, see the CHANGES file:

https://gitlab.com/buildroot.org/buildroot/-/blob/2025.02.15/CHANGES

Users of the affected packages are strongly encouraged to upgrade.

Many thanks to all the people contributing to this release:

git shortlog -s -n 2025.02.14..

    65	Bernd Kuhls
    40	Thomas Perale
    12	Peter Korsgaard
     9	Titouan Christophe
     8	Quentin Schulz
     7	Romain Naour
     6	Martin Willi
     5	Arnout Vandecappelle
     5	Giulio Benetti
     4	Shubham Chakraborty
     4	Thomas Petazzoni
     3	Julien Olivain
     2	Christian Stewart
     2	Dario Binacchi
     2	Francois Perrad
     2	Joseph Kogut
     2	Kadambini Nema
     2	Marcus Hoffmann
     1	Andreas Mohr
     1	Devreese Jorik
     1	Franciszek Stachura
     1	Guillaume Chaye
     1	Heiko Stuebner
     1	James Hilliard
     1	John Ernberg
     1	Michael Nosthoff
     1	Raphael Pavlidis
     1	Viacheslav Bocharov
     1	Waldemar Brodkorb

Regards,
Arnout
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
