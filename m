Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D6BEC5B543
	for <buildroot@archiver.kernel.org>; Thu,  5 Jun 2025 07:46:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0F857608F0;
	Thu,  5 Jun 2025 07:46:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HNkgdLxt7fN3; Thu,  5 Jun 2025 07:46:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0467A60842
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0467A60842;
	Thu,  5 Jun 2025 07:46:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id BA27D1A4
 for <buildroot@buildroot.org>; Thu,  5 Jun 2025 07:46:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AB1A8812FE
 for <buildroot@buildroot.org>; Thu,  5 Jun 2025 07:46:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JEy0ApQp7_5e for <buildroot@buildroot.org>;
 Thu,  5 Jun 2025 07:46:10 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom;
 client-ip=2a01:4f8:151:30a2::163; helo=serv15.avernis.de;
 envelope-from=br015@umbiko.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0D66381365
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0D66381365
Received: from serv15.avernis.de (serv15.avernis.de
 [IPv6:2a01:4f8:151:30a2::163])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0D66381365
 for <buildroot@buildroot.org>; Thu,  5 Jun 2025 07:46:09 +0000 (UTC)
Received: by serv15.avernis.de (Postfix) with ESMTPSA id 6377CBDE32E2;
 Thu,  5 Jun 2025 09:46:05 +0200 (CEST)
From: Andreas Ziegler <br015@umbiko.net>
To: buildroot@buildroot.org
Cc: Andreas Ziegler <br015@umbiko.net>
Date: Thu,  5 Jun 2025 09:45:45 +0200
Message-ID: <20250605074545.669101-1-br015@umbiko.net>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 1.0.7 at serv15.avernis.de
X-Virus-Status: Clean
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=umbiko.net; s=mail; 
 t=1749109565; bh=MjRlzRQ35BQqujpsyIwEzABVR8V5RW//KOGKEELEr7Y=;
 h=From:To:Cc:Subject:Date;
 b=tyu1Ao4dEgTBfuRKa9m/qoukM+weSAhP1nX1Ndx732m3Jj06NBYGBmlFvhemfR+K1
 45DOcbBzJdp7x5vYfmazk2HjymBR9GHwexCqJFDLGYFZYquxgw7FFJ3gj04nvoHD4q
 fNxl89MZq8KH6EnbP8dSpKbUvZTiCUCnW8TNKcws=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=umbiko.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=umbiko.net header.i=@umbiko.net header.a=rsa-sha256
 header.s=mail header.b=tyu1Ao4d
Subject: [Buildroot] [PATCH 1/1] package/mpd: update to version 0.24.4
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Version 0.24.4 change log: 

* protocol
  - fix stuck "getfingerprint" with io_uring
* decoder
  - mpg123: support Icy stream tags
  - mpg123: use libid3tag to parse stream tags
* tags
  - id3: fix assertion failure with broken AIFF/RIFF ID3 chunks
* output
  - fix resuming playback after it was paused by "single" mode
  - alsa: fix compiler warning with alsa-lib 1.2.14

$ utils/check-package package/mpd/*
908 lines processed
0 warnings generated
$ utils/check-symbols
(no output)
$ rm -fr ~/output/
$ mkdir ~/output/
$ echo "BR2_PACKAGE_MPD=y" > ~/output/mpd.config
$ utils/test-pkg -a -c ~/output/mpd.config -d ~/output -p mpd
                             arm-aarch64 [ 1/40]: SKIPPED
                   bootlin-aarch64-glibc [ 2/40]: SKIPPED
               bootlin-arcle-hs38-uclibc [ 3/40]: SKIPPED
                    bootlin-armv5-uclibc [ 4/40]: SKIPPED
                     bootlin-armv7-glibc [ 5/40]: OK
                   bootlin-armv7m-uclibc [ 6/40]: SKIPPED
                      bootlin-armv7-musl [ 7/40]: SKIPPED
                bootlin-m68k-5208-uclibc [ 8/40]: SKIPPED
               bootlin-m68k-68040-uclibc [ 9/40]: SKIPPED
             bootlin-microblazeel-uclibc [10/40]: SKIPPED
                bootlin-mipsel32r6-glibc [11/40]: SKIPPED
                   bootlin-mipsel-uclibc [12/40]: SKIPPED
                 bootlin-openrisc-uclibc [13/40]: SKIPPED
        bootlin-powerpc64le-power8-glibc [14/40]: SKIPPED
           bootlin-powerpc-e500mc-uclibc [15/40]: SKIPPED
                   bootlin-riscv32-glibc [16/40]: OK
                   bootlin-riscv64-glibc [17/40]: OK
                    bootlin-riscv64-musl [18/40]: SKIPPED
                 bootlin-s390x-z13-glibc [19/40]: OK
                      bootlin-sh4-uclibc [20/40]: SKIPPED
                   bootlin-sparc64-glibc [21/40]: SKIPPED
                    bootlin-sparc-uclibc [22/40]: SKIPPED
                    bootlin-x86-64-glibc [23/40]: OK
                     bootlin-x86-64-musl [24/40]: SKIPPED
                   bootlin-x86-64-uclibc [25/40]: SKIPPED
                   bootlin-x86-i686-musl [26/40]: SKIPPED
                   bootlin-xtensa-uclibc [27/40]: SKIPPED
                            br-arm-basic [28/40]: SKIPPED
                    br-arm-full-nothread [29/40]: SKIPPED
                      br-arm-full-static [30/40]: SKIPPED
                   br-i386-pentium4-full [31/40]: SKIPPED
                      br-mips64-n64-full [32/40]: SKIPPED
                 br-mips64r6-el-hf-glibc [33/40]: SKIPPED
               br-powerpc-603e-basic-cpp [34/40]: SKIPPED
               br-powerpc64-power7-glibc [35/40]: SKIPPED
                       linaro-aarch64-be [36/40]: SKIPPED
                          linaro-aarch64 [37/40]: SKIPPED
                              linaro-arm [38/40]: SKIPPED
                         sourcery-mips64 [39/40]: SKIPPED
                           sourcery-mips [40/40]: SKIPPED
40 builds, 35 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed

Signed-off-by: Andreas Ziegler <br015@umbiko.net>
---
 package/mpd/mpd.hash | 2 +-
 package/mpd/mpd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mpd/mpd.hash b/package/mpd/mpd.hash
index ef13e27033..dd3ac9782f 100644
--- a/package/mpd/mpd.hash
+++ b/package/mpd/mpd.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking pgp signature
-sha256  4225680e068b2ad87e3c2de414ec3209758de93d671f89fa3bae90b70af478a2  mpd-0.24.3.tar.xz
+sha256  86035d6c63af32afa77fd5eb5ecd1c6afaef7cc352b28064edf51eea60f40d66  mpd-0.24.4.tar.xz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
index 35632f97b4..e41c03ef08 100644
--- a/package/mpd/mpd.mk
+++ b/package/mpd/mpd.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 MPD_VERSION_MAJOR = 0.24
-MPD_VERSION = $(MPD_VERSION_MAJOR).3
+MPD_VERSION = $(MPD_VERSION_MAJOR).4
 MPD_SOURCE = mpd-$(MPD_VERSION).tar.xz
 MPD_SITE = https://www.musicpd.org/download/mpd/$(MPD_VERSION_MAJOR)
 MPD_DEPENDENCIES = host-pkgconf fmt
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
