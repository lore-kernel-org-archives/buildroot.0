Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C192C64ED8
	for <buildroot@archiver.kernel.org>; Fri, 24 Feb 2023 07:36:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C458B607FF;
	Fri, 24 Feb 2023 07:36:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C458B607FF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iINgRjfnEle4; Fri, 24 Feb 2023 07:36:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2A47160E48;
	Fri, 24 Feb 2023 07:36:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2A47160E48
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 488581BF2A4
 for <buildroot@lists.busybox.net>; Fri, 24 Feb 2023 07:36:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0E9FC40327
 for <buildroot@lists.busybox.net>; Fri, 24 Feb 2023 07:36:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0E9FC40327
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0_8ooR05E27T for <buildroot@lists.busybox.net>;
 Fri, 24 Feb 2023 07:35:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D221D40324
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D221D40324
 for <buildroot@buildroot.org>; Fri, 24 Feb 2023 07:35:56 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id C584A6000C
 for <buildroot@buildroot.org>; Fri, 24 Feb 2023 07:35:53 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Fri, 24 Feb 2023 07:35:53 -0000
Message-Id: <20230224073602.0E9FC40327@smtp4.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1677224154; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ql7nWNXSYT2AElzjhSQopcJjr+FVk/1irZNQbjE1fH8=;
 b=S12cJWG//8TTNDMMS0b9LCToJM59s2T/Odaz8Z1IatOc2FqQujS39su87cPKspne5dDwPs
 p3+Q8O/IP3ROQSKx9PgXOLTPJ8pJJ1OuG4C1rBxUrGlxo0N94OynyqP7pqgo/AiuxyKAJd
 x8eK3CaBUTKqMK1pETy4PYy7kDe3wldIQSdsSEKUSQwZX06CrFHRb9li1mxsDI0qLvsbWg
 I+WN/55iaS468bqrDFimWx7g6lQmuFTDzI5ufA3HSQCqORRvbYru5xGqoceeWW6U8k8Y4m
 J/7ZTHfly7cTdhhiip0m6+V2hZUvfCt8OPkH+eAKO3yyrJEkSuqk9VD2Pup8zg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=S12cJWG/
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-02-23
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

Autobuild statistics for 2023-02-23
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.11.x  | 12  | 10  |  0  | 22  |
    master   | 138 | 139 |  1  | 278 |
     next    | 16  | 27  |  0  | 43  |

Classification of failures by reason for master
-----------------------------------------------

                       unknown | 8 
glibc-2.36-81-g4f4d7a13edfd... | 6 
  gobject-introspection-1.72.0 | 6 
            host-binutils-2.38 | 6 
              host-pahole-1.24 | 6 
           python-numpy-1.23.5 | 6 
                elfutils-0.186 | 5 
                host-go-1.19.6 | 5 
              host-rust-1.67.0 | 3 
               libglib2-2.72.3 | 3 
                  linux-6.1.11 | 3 
                 systemd-252.4 | 3 
                  boost-1.80.0 | 2 
                  cairo-1.16.0 | 2 
fs/cramfs/cramfs.mk:46: /ho... | 2 
fs/ubifs/ubifs.mk:49: /home... | 2 
                gerbera-1.10.0 | 2 
                  kexec-2.0.25 | 2 
               libcap-ng-0.8.3 | 2 
             libgpg-error-1.46 | 2 
             lirc-tools-0.10.2 | 2 
                  mender-3.4.0 | 2 
            ocf-linux-20171122 | 2 
                    olsr-0.9.8 | 2 
package/multipath-tools/mul... | 2 
                    putty-0.76 | 2 
                rdma-core-44.0 | 2 
                speechd-0.11.4 | 2 
uqmi-0a19b5b77140465c29e2af... | 2 
                busybox-1.36.0 | 1 
                  check-0.15.2 | 1 
              erlang-22.3.4.22 | 1 
                     exim-4.96 | 1 
                     frr-8.4.2 | 1 
fs/cramfs/cramfs.mk:46: /ho... | 1 
fs/ubi/ubi.mk:51: /home/aut... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /tmp/... | 1 
fs/ubifs/ubifs.mk:49: /tmp/... | 1 
fs/ubifs/ubifs.mk:49: /tmp/... | 1 
              fstrcmp-0.7.D001 | 1 
                    gdal-3.5.2 | 1 
                 gocryptfs-2.3 | 1 
                 gtkmm3-3.22.0 | 1 
            host-binutils-2.37 | 1 
            host-binutils-2.39 | 1 
         host-gcc-final-10.4.0 | 1 
                   json-c-0.16 | 1 
                       kmod-30 | 1 
kvmtool-f77d646ba01d04be5aa... | 1 
              libgcrypt-1.10.1 | 1 
                libmad-0.15.1b | 1 
                  libnfc-1.8.0 | 1 
              libudfread-1.1.2 | 1 
          linux-5.10.162-cip24 | 1 
               mariadb-10.3.36 | 1 
                          mawk | 1 
             netsniff-ng-0.6.8 | 1 
                  netsurf-3.10 | 1 
                 openssh-9.1p1 | 1 
                   perl-5.36.0 | 1 
                     php-8.2.3 | 1 
            quickjs-2021-03-27 | 1 
                  reaver-1.6.6 | 1 
        s6-linux-utils-2.6.0.0 | 1 
              shellinabox-2.20 | 1 
              skalibs-2.12.0.1 | 1 
               tcf-agent-1.7.0 | 1 
ti-sgx-km-cf7f48cb30abfd5df... | 1 
             uccp420wlan-6.9.1 | 1 
               valgrind-3.19.0 | 1 
                xenomai-3.0.10 | 1 
           xtables-addons-3.22 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   arceb     |          boost-1.80.0          | NOK | http://autobuild.buildroot.net/results/ad60da197a64f186595e2ec626f044e922da00f4 |     
    arc      |          boost-1.80.0          | NOK | http://autobuild.buildroot.net/results/16ffef680a4ff393c992c3863d265e3251183ec0 |     
    mips     |         busybox-1.36.0         | NOK | http://autobuild.buildroot.net/results/ae787a8e73c7d6a5ade7551689c5acbf7b6113b7 | ORPH
   xtensa    |          cairo-1.16.0          | NOK | http://autobuild.buildroot.net/results/5420beaf94855e47eeb08627e8e3c169dc00419a |     
   xtensa    |          cairo-1.16.0          | NOK | http://autobuild.buildroot.net/results/8598e1f68673c1754d02a770806099e1f6bb7b2e |     
powerpc64le  |          check-0.15.2          | NOK | http://autobuild.buildroot.net/results/81fb9ac90dbf6ff1c76afd5f380fdcdeb7884cf5 | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/81e8c2505fa175d6f4a4fe224577b21d708742b3 | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/a75c7b19bf1d8c1f01dd0ba928335c38950f1578 | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/0672c1b5af6b1af3c52e028bc61c8da938a04359 | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/e8e7bf3aa8737dc9c5a6c04ccb75de6c2e0fef43 | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/388a684b264c95d211a151c91198abea7980b277 | ORPH
   x86_64    |        erlang-22.3.4.22        | NOK | http://autobuild.buildroot.net/results/36c74201f05f52b8e2fc7cbd6e42dbc6dfcfa045 |     
    arm      |           exim-4.96            | NOK | http://autobuild.buildroot.net/results/fa5bc99a93473e9ab640a558b388833dbcafc94b |     
   xtensa    |           frr-8.4.2            | NOK | http://autobuild.buildroot.net/results/a6542e2d41ff104cd5eaa35c2892b648bb88b85c |     
  mips64el   | fs/cramfs/cramfs.mk:46: /ho... | NOK | http://autobuild.buildroot.net/results/537bcf98b0137a40c0b558289a811df5d3cd2065 |     
    arm      | fs/cramfs/cramfs.mk:46: /ho... | NOK | http://autobuild.buildroot.net/results/c3da7d6f00be505e6f713e4b4770fd5ed9c4b058 |     
 microblaze  | fs/cramfs/cramfs.mk:46: /ho... | NOK | http://autobuild.buildroot.net/results/e0f1a55e324688bc2aa56e0a73ea75c3e08e1bb1 |     
   mipsel    | fs/ubi/ubi.mk:51: /home/aut... | NOK | http://autobuild.buildroot.net/results/647801e2b6500cdc6869ee090f39edbeaa0a2912 |     
   sh4eb     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/7a74b54a7568d17db3cd70430cb5469e461c51d5 |     
powerpc64le  | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/24e4e12456d31ed4cf0af28012c9b2cda262d2b3 |     
   mips64    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/d7ee50fae8fa01e1ace6d8ef6c79b1d21778a9c6 |     
 aarch64_be  | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/5d4c375a1f64b33f80bb9d4149376eb5ddeca245 |     
   sparc     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/fe9fd607c4a6384084790a11731835063d6a41fb |     
  aarch64    | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/2be92d0ea9b7d949bcd0baddb4935a373152b7a2 |     
   s390x     | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/0992ccbc272b86a16ab8f650406bb89eb615711c |     
  riscv32    | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/b11ed715f4aa7027775bc5a1846d3d1ec3d7908a |     
   mipsel    |        fstrcmp-0.7.D001        | NOK | http://autobuild.buildroot.net/results/2b77e06af7547f34ab2405194cb83f8fee82ba08 |     
    sh4      |           gdal-3.5.2           | NOK | http://autobuild.buildroot.net/results/4e34ad89caeabd4443011f96cf4f635af5912fd7 |     
   x86_64    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/56c46fa7e922360d2c4b4093f8a030cc83726799 |     
  sparc64    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/f14c54a190b1453e0413f7f75c74d2fa6e335041 |     
  powerpc    | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/5549551b3d3eabc1e30e504b7d074537a9a96782 |     
  powerpc    | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/0afe67afafa3986d1e5255ea15e8da7efac2d743 |     
 powerpc64   | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/d6ddc9ac4fcb1ab2522f4e5801891b8efbf9b635 |     
  powerpc    | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/bdea93970781a7219b3d36581d3ce23140f56757 |     
  powerpc    | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/6a363a0373e627acdb06e81de9693c6e1125a345 |     
   arceb     | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/13f6957545ca286cc8cfed2afe3e6e323351670c |     
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/b52569bb531e8aa33203033278e31ad272f7ba2f | ORPH
   s390x     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/59045ff4df658c242042433ecb4ae51de23aab82 | ORPH
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/6a2eeef3b5bb29974edd7f641e18aad674aaae13 | ORPH
   nios2     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/217569dcd6e0857ce6e3331c461515fff8f91645 | ORPH
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/bbb63a44bfc55e4ef49e18c1aa52bdd4c43a4fec | ORPH
microblazeel |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/e24eef231eae4bdf9fbcf1e4d1a71679aa26b555 | ORPH
   x86_64    |         gocryptfs-2.3          | NOK | http://autobuild.buildroot.net/results/18f0dfaa5dec76deac30e4947231194af47c13ca |     
 aarch64_be  |         gtkmm3-3.22.0          | NOK | http://autobuild.buildroot.net/results/912b870d6483aa5e3533fb4b8515c5b872cfabd1 |     
   mipsel    |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/de5016ed30fe888f039e856cb0e08de31036ee6a |     
   sparc     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/e1eb5ac94e1a2be459d0b999d2a5ec4484ad6c1b |     
 microblaze  |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/f2bb8b9a1b539365257a706fefcf3a9f988a7b70 |     
   mipsel    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/b087bf6a64184cdbe35901c1bbe49235790fb343 |     
  aarch64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/a0c8f2f07150d9be0af0cd361d549daeac84fe63 |     
 microblaze  |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/9d17c96b4b1ab52adbd629f7cbda17e452fa6854 |     
    i686     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/c500b73d8c0339cca4d2d7d42b435fd7be0ff60f |     
   x86_64    |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/036ad6f59279405b01fa3529caeb2b78cd895550 |     
   arceb     |     host-gcc-final-10.4.0      | NOK | http://autobuild.buildroot.net/results/ee593cf22bfc11d4ccb52d7407cd55840a47684f |     
    i686     |         host-go-1.19.6         | NOK | http://autobuild.buildroot.net/results/f0dd3dab511ee13e56f409a6eac62e771d2e4f15 |     
  mips64el   |         host-go-1.19.6         | NOK | http://autobuild.buildroot.net/results/23a54f54efbec94d74a49639bb71edc139162a55 |     
  aarch64    |         host-go-1.19.6         | NOK | http://autobuild.buildroot.net/results/3b850ca2b6c51cf28eb230e78ed9eb97599a4fad |     
   mips64    |         host-go-1.19.6         | NOK | http://autobuild.buildroot.net/results/9dc2d77eaeb49b84adcdba0d2de56e56d6e73b99 |     
   mips64    |         host-go-1.19.6         | NOK | http://autobuild.buildroot.net/results/bcae3c97f94db3cf21509c11b30d3e269902b5e6 |     
    arm      |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/2363ba61b4df285bbd60237eb32f49b10f5a3dd7 |     
   sparc     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/9d9fc6e24735de49583df40cd050c5a67f0553d1 |     
 aarch64_be  |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/ea21636a588aad04ad7793912b46844726cb4c85 |     
   s390x     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/ed4db2e03a5d4036cc757c067cff1311b11047d9 |     
    arm      |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/3119be2906530a556205320771ee8a8fce7025fb |     
 microblaze  |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/2a608d7490d2f14dbcb6dea0c24498ad3e175309 |     
  aarch64    |        host-rust-1.67.0        | NOK | http://autobuild.buildroot.net/results/9bdf41aa2f04394693d1fa2822edf648de1ce75c |     
  aarch64    |        host-rust-1.67.0        | NOK | http://autobuild.buildroot.net/results/ec9bf8fa13a995ef068508ab8755b48c8a2a6465 |     
   x86_64    |        host-rust-1.67.0        | NOK | http://autobuild.buildroot.net/results/f3316d5c9fa4728e5ccc55cb4bfc82c250e2cfe6 |     
  riscv64    |          json-c-0.16           | NOK | http://autobuild.buildroot.net/results/d37420015b230798611253aa121bf2122514d808 |     
   armeb     |          kexec-2.0.25          | NOK | http://autobuild.buildroot.net/results/90418c5239d596a4ee4ef70bbd5875cd3305de26 | ORPH
    sh4      |          kexec-2.0.25          | NOK | http://autobuild.buildroot.net/results/49771da00c31741063a12ee78eaa44539b230ec4 | ORPH
    arm      |            kmod-30             | NOK | http://autobuild.buildroot.net/results/c3ab3dcc55ec43b275e8f2e673fa7da817d07a37 |     
    i686     | kvmtool-f77d646ba01d04be5aa... | NOK | http://autobuild.buildroot.net/results/3aaf26b96d25e9bf6e2c76035eb550dfecaf0228 | ORPH
  riscv64    |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/0fba229d25f05e450365b6c903bd92a219550b7b |     
  riscv64    |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/76d8ff47149c02dbe2ec68f66ac8152bed85f6d8 |     
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/746df16ce64a879c8defc128cea6d026cbc33387 | ORPH
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/95f7ba434cfb6d5f0c0937619275482c4df1b346 |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/d5deb31857091e0d44f01d94818d877b5deeb470 |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/915f6b953ae88fed06c19e140c24f10089ea6d36 |     
 aarch64_be  |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/133152f7810c2e4354b102144b79d36d37630aec | ORPH
 aarch64_be  |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/61f92f8dd99fa7a8364438c531fafd4a4b1dc8f1 | ORPH
   armeb     |         libmad-0.15.1b         | NOK | http://autobuild.buildroot.net/results/92a3f19b4fa12a7724f9e3d99284da4ad2beecb2 | ORPH
    or1k     |          libnfc-1.8.0          | NOK | http://autobuild.buildroot.net/results/64024ca6a7b070bb633ca3a80efd618357705625 |     
    arm      |        libudfread-1.1.2        | NOK | http://autobuild.buildroot.net/results/30a2ba15186688d0211da8c9bdb7ca53e171a03a |     
    mips     |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/413b95a1962447bf7d52b6d10c5e8b1383617c85 | ORPH
   arceb     |          linux-6.1.11          | NOK | http://autobuild.buildroot.net/results/feef141784f2c8ddb7469baabf79bd1815cfd055 | ORPH
  riscv32    |          linux-6.1.11          | NOK | http://autobuild.buildroot.net/results/30d5816e7d8c105f3925a297e29d1f967778c387 | ORPH
    arm      |          linux-6.1.11          | NOK | http://autobuild.buildroot.net/results/4135396a30d8411d4b72f34a2784dce6ba21663a | ORPH
 aarch64_be  |       lirc-tools-0.10.2        | NOK | http://autobuild.buildroot.net/results/e0e98ce16ecf70c9de48b25bd925b867090c64cd | ORPH
    i686     |       lirc-tools-0.10.2        | NOK | http://autobuild.buildroot.net/results/b08d307a235975fbbaa12f484136b7e9e438c70f | ORPH
   sparc     |        mariadb-10.3.36         | NOK | http://autobuild.buildroot.net/results/e6bf8871d438d272a08d977a87fe23ffc261c77c | ORPH
    m68k     |              mawk              | TIM | http://autobuild.buildroot.net/results/c30e6acfc89d9b23400f76a6efd471aab512f132 |     
    i686     |          mender-3.4.0          | NOK | http://autobuild.buildroot.net/results/2b032d2a4e7cfbb20444c13821003120a4d00abd |     
    i686     |          mender-3.4.0          | NOK | http://autobuild.buildroot.net/results/f22e6d74d2511a71a6835bcf58290b892ab9a9c0 |     
   x86_64    |       netsniff-ng-0.6.8        | NOK | http://autobuild.buildroot.net/results/ff6cc5a2aff1f79fa361e6265514af16c58a20c6 |     
microblazeel |          netsurf-3.10          | NOK | http://autobuild.buildroot.net/results/3dddcbbe7f6ecae5a2db6fac11fb659719452f73 |     
    i586     |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/5bcf0767ceea96c837aabc49558ea1bbd9bfd2c4 | ORPH
 powerpc64   |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/dc669ea62e9a75a454d4281bae18ed93cd642497 | ORPH
 aarch64_be  |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/5c36fc50a28dc2342c1ad0359ac2f3549c6e9750 | ORPH
   mipsel    |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/40ddc2fc4a1552810aadc0f55ff2b0f3e57a37e6 | ORPH
    m68k     |         openssh-9.1p1          | NOK | http://autobuild.buildroot.net/results/55cfe103675557590faab5073aaee776377b5d33 | ORPH
   s390x     | package/multipath-tools/mul... | NOK | http://autobuild.buildroot.net/results/21bc3aa3e1b89ace5aebe771b8c34d5bd0cb9c3d |     
 aarch64_be  | package/multipath-tools/mul... | NOK | http://autobuild.buildroot.net/results/5aa82ae809473f959ce49516c18a3ed11c4b1734 |     
   s390x     |          perl-5.36.0           | NOK | http://autobuild.buildroot.net/results/1be343f89db372e78de5c6e7b916db08d7aec3da |     
microblazeel |           php-8.2.3            | NOK | http://autobuild.buildroot.net/results/d4a6eb20005badca84214a55680cc2336b557528 |     
  aarch64    |           putty-0.76           | NOK | http://autobuild.buildroot.net/results/91dd5c89cbdf4068d06b42df25b66435b3cb6005 |     
  aarch64    |           putty-0.76           | NOK | http://autobuild.buildroot.net/results/6a4065b432887107b8e054b43a79708ce5e42307 |     
    arm      |      python-numpy-1.23.5       | NOK | http://autobuild.buildroot.net/results/e62abbcf18f15d4791fdbafa515662bb5c4a975b |     
 powerpc64   |      python-numpy-1.23.5       | NOK | http://autobuild.buildroot.net/results/36bb9349ee7e7e760eff679c83e21e84cb51a1aa |     
 powerpc64   |      python-numpy-1.23.5       | NOK | http://autobuild.buildroot.net/results/7b6809f5f5bbcc6027ebef1cb76a721f69724c54 |     
   sh4aeb    |      python-numpy-1.23.5       | NOK | http://autobuild.buildroot.net/results/6bbfa1e76a79340727a9405fd3020c46780b729e |     
    sh4      |      python-numpy-1.23.5       | NOK | http://autobuild.buildroot.net/results/218a64ea89209e3370a703a713a65adfae45fd2b |     
   mipsel    |      python-numpy-1.23.5       | NOK | http://autobuild.buildroot.net/results/2e3a624c24991413d52559d55b34262204fb64f2 |     
microblazeel |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/1529211d0fb4fc802420518485c581f32b737799 |     
    m68k     |         rdma-core-44.0         | NOK | http://autobuild.buildroot.net/results/abc85841893e97f058f22e012e99c7d1200ee7d7 |     
    i586     |         rdma-core-44.0         | NOK | http://autobuild.buildroot.net/results/aa8e9a8fed8764d7e63580882f3f05909fcf3843 |     
    arc      |          reaver-1.6.6          | NOK | http://autobuild.buildroot.net/results/926c9c7839023ec240f8fd4ba065ef15bd35a397 |     
  mips64el   |     s6-linux-utils-2.6.0.0     | NOK | http://autobuild.buildroot.net/results/214bcecfc389cb412b68627c831300478d614a3a |     
   xtensa    |        shellinabox-2.20        | NOK | http://autobuild.buildroot.net/results/2872b26253ecb5a1550268fcbcefe8fd974ff70d |     
    or1k     |        skalibs-2.12.0.1        | NOK | http://autobuild.buildroot.net/results/c4d8dea9ba085a65e45b43e0b26d4cbb4325d65f |     
 aarch64_be  |         speechd-0.11.4         | NOK | http://autobuild.buildroot.net/results/4473bdfaa74b932f02957b7642ce8aaec41dae2f |     
   x86_64    |         speechd-0.11.4         | NOK | http://autobuild.buildroot.net/results/500352a7678c21f4c66e5a3f2beea1cc791db872 |     
 aarch64_be  |         systemd-252.4          | NOK | http://autobuild.buildroot.net/results/6227df3a53f8a322fae400291207c2093e861dcf |     
  mips64el   |         systemd-252.4          | NOK | http://autobuild.buildroot.net/results/9826151cdc64c2e633da5f2b984b1205c5899df9 |     
   s390x     |         systemd-252.4          | NOK | http://autobuild.buildroot.net/results/b1796e6bf853560de9c7685b670edef7d2abe6b1 |     
microblazeel |        tcf-agent-1.7.0         | NOK | http://autobuild.buildroot.net/results/7aab9a839d4ae8f5081e487f71796f73a46a1279 |     
    arm      | ti-sgx-km-cf7f48cb30abfd5df... | NOK | http://autobuild.buildroot.net/results/89149fe01a3d2a8d046bec7899486292567bb37d |     
   s390x     |       uccp420wlan-6.9.1        | NOK | http://autobuild.buildroot.net/results/c3a4e424916f1474b444e831d72fb4e2c5e65004 | ORPH
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/4f4820647f5839cc1c6b725dd3dd7665c5275aa1 |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.net/results/82f02cee961f7df18e1f79bfc5ae86bf66b85169 |     
   arceb     |            unknown             | NOK | http://autobuild.buildroot.net/results/3ca012ce9b6a7e7d9ecd8949e8ee8b7750cc3e61 |     
    sh4      |            unknown             | NOK | http://autobuild.buildroot.net/results/2eb02664c4524f65507b38b66de57f1ec1fcf535 |     
    m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/fd766e4ad4815b92e44a8488bfba51fa2f8f6110 |     
    mips     |            unknown             | NOK | http://autobuild.buildroot.net/results/6cd359b3429f33b74f156b99550839e75348c694 |     
   s390x     |            unknown             | NOK | http://autobuild.buildroot.net/results/aaf03f8cdad4c02bf1881e74ac1263193d9587fa |     
    mips     |            unknown             | NOK | http://autobuild.buildroot.net/results/addb9c2ed80e61bae4ce18421a163d2bb2cb1160 |     
   s390x     | uqmi-0a19b5b77140465c29e2af... | NOK | http://autobuild.buildroot.net/results/d6bc02326877435a9479d9231cba43ea66556f15 | ORPH
   nios2     | uqmi-0a19b5b77140465c29e2af... | NOK | http://autobuild.buildroot.net/results/f6261181b0726c62703818ddc6772b87cd40a9a9 | ORPH
    mips     |        valgrind-3.19.0         | NOK | http://autobuild.buildroot.net/results/19b58969ca4a768804022eadb32922130ab600c3 | ORPH
  powerpc    |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/b44bafe2e9229d0031df35a3a700635d009a1140 |     
    arc      |      xtables-addons-3.22       | NOK | http://autobuild.buildroot.net/results/f2d596b510f027b94a6b1fad10c363922c50cbec | ORPH


Classification of failures by reason for next
---------------------------------------------

                  linux-6.1.11 | 4 
            host-binutils-2.38 | 2 
              host-rust-1.67.1 | 2 
              libgcrypt-1.10.1 | 2 
                  acpid-2.0.34 | 1 
                elfutils-0.186 | 1 
                    fwup-1.9.1 | 1 
                     gmp-6.2.1 | 1 
                   gqrx-2.14.4 | 1 
              host-pahole-1.24 | 1 
                   hwloc-2.8.0 | 1 
          libcamera-apps-1.1.1 | 1 
               libglib2-2.72.3 | 1 
        ltp-testsuite-20220930 | 1 
        lttng-babeltrace-1.5.7 | 1 
                    mutt-2.2.9 | 1 
                     pv-1.6.20 | 1 
             uccp420wlan-6.9.1 | 1 
ulog-0389d243352255f6182326... | 1 
                       unknown | 1 
               xfsprogs-5.14.2 | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |          acpid-2.0.34          | NOK | http://autobuild.buildroot.net/results/35368c241971ca36db7e4e62929131898d707f4c | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/c171c695cb4ceb5745cce22aac2b880e74f790fc | ORPH
   mipsel    |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/a522676bf5ce7b8bce4a9c2fac90599afc10e529 |     
  riscv64    |           gmp-6.2.1            | NOK | http://autobuild.buildroot.net/results/8c259722ad084da709644b02f272a79d210659ad | ORPH
   mipsel    |          gqrx-2.14.4           | NOK | http://autobuild.buildroot.net/results/5f224d0f40fe38e58cd48354b4053f6ae243f2c8 |     
  mips64el   |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/f10e828deb87773bc8d5f030342acfba6e507cf7 |     
 powerpc64   |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/b7ae1443ea956f3ba7291ad7c9fb73095e97c513 |     
  sparc64    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/256b80c8192581091d37e0a2eed4c5492b666962 |     
   mipsel    |        host-rust-1.67.1        | NOK | http://autobuild.buildroot.net/results/a664aed4764312378e9aa9da937923c44dca0b47 |     
   x86_64    |        host-rust-1.67.1        | NOK | http://autobuild.buildroot.net/results/98a203801ed1c06e80b0702f7b2be75ba185ae19 |     
   x86_64    |          hwloc-2.8.0           | NOK | http://autobuild.buildroot.net/results/aaf4faa3964df8bff747fb2069f632fb9fcd6f7a |     
   mips64    |      libcamera-apps-1.1.1      | NOK | http://autobuild.buildroot.net/results/a14e2548af4d39a47f3916384e48135413c621e2 |     
    i586     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/9929386044ff8f37f998203a0c6cbbd78a510ec9 | ORPH
    arm      |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/c2cfe1769a231db897e945ca17159fa06b0e5f92 | ORPH
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/bc4cf3975c784a6b3b9eee72d9bfda3becf7a7be |     
   mipsel    |          linux-6.1.11          | NOK | http://autobuild.buildroot.net/results/184eebcbb0769400388bc176ad04fd8ca1bea2c0 | ORPH
 powerpc64   |          linux-6.1.11          | NOK | http://autobuild.buildroot.net/results/e67a61eff21e51ad1a918729146f9720ea324e09 | ORPH
    mips     |          linux-6.1.11          | NOK | http://autobuild.buildroot.net/results/8be1e703bd3738aedd80bac93565d56ce23aa1a9 | ORPH
    sh4a     |          linux-6.1.11          | NOK | http://autobuild.buildroot.net/results/db2d0efa501959943febce11f5dbfdefa2cf2cf8 | ORPH
    arm      |     ltp-testsuite-20220930     | NOK | http://autobuild.buildroot.net/results/b713e4294a891ae08ad4afd8031e46bd1d09bd57 |     
    m68k     |     lttng-babeltrace-1.5.7     | NOK | http://autobuild.buildroot.net/results/4f465fe15664b1f9df3f26c331dc550852972f2f |     
 aarch64_be  |           mutt-2.2.9           | NOK | http://autobuild.buildroot.net/results/2399a6d8eba249e2e880a0a060bb38a92f5e047e |     
   armeb     |           pv-1.6.20            | NOK | http://autobuild.buildroot.net/results/499042067b2cdb54127275cc90f580f5f9b306f6 | ORPH
    i586     |       uccp420wlan-6.9.1        | NOK | http://autobuild.buildroot.net/results/f85427ba27fdc3fa2bf1b936baab017259fbac71 | ORPH
  sparc64    | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/d2bd9e5271e16794e6aa47d001a88f15eb1bfb7e |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/fb707d74d9cc0e6069ba9297c544ea3ad8d7ef3d |     
   mipsel    |        xfsprogs-5.14.2         | NOK | http://autobuild.buildroot.net/results/1187a079fb2d0aafcce899575e6e43f396df41f8 | ORPH


Classification of failures by reason for 2022.11.x
--------------------------------------------------

                     ace-7.0.6 | 1 
                  boost-1.80.0 | 1 
              dropbear-2022.82 | 1 
                     efivar-38 | 1 
                elfutils-0.186 | 1 
                gerbera-1.10.0 | 1 
glibc-2.36-66-ga1dc0be03c9d... | 1 
luajit-6c4826f12c4d33b8b978... | 1 
              open62541-v1.3.3 | 1 
                  zabbix-5.4.9 | 1 


Detail of failures for 2022.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |           ace-7.0.6            | NOK | http://autobuild.buildroot.net/results/549727e0f7066e9d4467899089f698b5cdb186be | ORPH
    arc      |          boost-1.80.0          | NOK | http://autobuild.buildroot.net/results/1575b04c32dff0cc702bf722fcaad2fee06d5ccb |     
  riscv64    |        dropbear-2022.82        | NOK | http://autobuild.buildroot.net/results/330a84cb6471e86d4bdf191e61f5e35a710a77f4 |     
    arm      |           efivar-38            | NOK | http://autobuild.buildroot.net/results/277f783c33102a0cea7c82ca902119ab90f37ad4 |     
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/9166cdf54f9523d24a79dc2aeaae5139c91be178 | ORPH
  aarch64    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/739b57ae928aed1d734e32fcd732c4b63a1e8e32 |     
    arc      | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/1539bf86643d38f9a16081978c46b7ef14aca7ce |     
  powerpc    | luajit-6c4826f12c4d33b8b978... | NOK | http://autobuild.buildroot.net/results/37cba5632c67b3c5eabbd47f208297849dc51eef |     
  riscv32    |        open62541-v1.3.3        | NOK | http://autobuild.buildroot.net/results/79de0744f5c4cbd4d7e4b8348008eb9c04c0acc0 | ORPH
   s390x     |          zabbix-5.4.9          | NOK | http://autobuild.buildroot.net/results/5cd9212264e61ca43cbdbb0995939c247a549f4c |     


Gitlab CI results for 2023-02-23
================================

Detail of defconfig failures for 2023.02-rc1
--------------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
                       qemu_s390x | https://gitlab.com/buildroot.org/buildroot/-/jobs/3819524265  |      


Detail of runtime-test failures for 2023.02-rc1
-----------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
        DetectBadArchTest | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787630  | ORPH 
 TestAarch64Pages64kGlibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788057  | ORPH 
  TestAarch64Pages64kMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788058  | ORPH 
TestAarch64Pages64kuClibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788059  | ORPH 
                 TestAtop | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787779  | ORPH 
              TestAvocado | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787781  | ORPH 
      TestClangCompilerRT | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787789  | ORPH 
      TestCpioDracutGlibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787667  | ORPH 
...ioDracutGlibcMergedUsr | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787668  | ORPH 
       TestCpioDracutMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787669  | ORPH 
...pioDracutMuslMergedUsr | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787670  | ORPH 
     TestCpioDracutUclibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787671  | ORPH 
...oDracutUclibcMergedUsr | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787672  | ORPH 
             TestCpioFull | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787673  | ORPH 
           TestCrudiniPy3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787792  | ORPH 
        TestDockerCompose | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787795  | ORPH 
             TestDropbear | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787797  | ORPH 
              TestDtbocfg | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787799  | ORPH 
             TestExecline | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787800  | ORPH 
                 TestExt2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787674  | ORPH 
               TestExt2r1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787677  | ORPH 
                 TestExt3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787678  | ORPH 
                 TestExt4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787680  | ORPH 
...rch64GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788069  | ORPH 
...tlinAarch64GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788070  | ORPH 
...arch64MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788071  | ORPH 
...otlinAarch64MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788072  | ORPH 
...ch64UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788073  | ORPH 
...linAarch64UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788074  | ORPH 
...h64beGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788075  | ORPH 
...inAarch64beGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788076  | ORPH 
...64beUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788077  | ORPH 
...nAarch64beUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788078  | ORPH 
...750dUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788079  | ORPH 
...nArcle750dUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788080  | ORPH 
...ehs38GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788081  | ORPH 
...inArclehs38GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788082  | ORPH 
...hs38UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788084  | ORPH 
...nArclehs38UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788085  | ORPH 
...abihfGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788086  | ORPH 
...mebv7eabihfGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788087  | ORPH 
...eabihfMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788088  | ORPH 
...rmebv7eabihfMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788089  | ORPH 
...bihfUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788090  | ORPH 
...ebv7eabihfUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788091  | ORPH 
...5eabiGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788092  | ORPH 
...inArmv5eabiGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788093  | ORPH 
...v5eabiMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788094  | ORPH 
...linArmv5eabiMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788095  | ORPH 
...eabiUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788096  | ORPH 
...nArmv5eabiUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788097  | ORPH 
...abihfGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788098  | ORPH 
...Armv6eabihfGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788099  | ORPH 
...eabihfMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788100  | ORPH 
...nArmv6eabihfMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788101  | ORPH 
...bihfUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788102  | ORPH 
...rmv6eabihfUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788104  | ORPH 
...abihfGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788106  | ORPH 
...Armv7eabihfGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788108  | ORPH 
...eabihfMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788111  | ORPH 
...nArmv7eabihfMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788112  | ORPH 
...bihfUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788113  | ORPH 
...rmv7eabihfUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788114  | ORPH 
...mv7mUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788115  | ORPH 
...tlinArmv7mUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788116  | ORPH 
...8xxxUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788117  | ORPH 
...nM68k68xxxUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788118  | ORPH 
...fireUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788119  | ORPH 
...8kcoldfireUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788120  | ORPH 
...azebeGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788121  | ORPH 
...icroblazebeGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788122  | ORPH 
...lazebeMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788123  | ORPH 
...MicroblazebeMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788125  | ORPH 
...zebeUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788127  | ORPH 
...croblazebeUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788128  | ORPH 
...azeelGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788130  | ORPH 
...icroblazeelGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788131  | ORPH 
...lazeelMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788133  | ORPH 
...MicroblazeelMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788135  | ORPH 
...zeelUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788137  | ORPH 
...croblazeelUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788138  | ORPH 
...ips32GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788140  | ORPH 
...otlinMips32GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788142  | ORPH 
...Mips32MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788144  | ORPH 
...ootlinMips32MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788146  | ORPH 
...ps32UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788148  | ORPH 
...tlinMips32UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788150  | ORPH 
...s32elGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788151  | ORPH 
...linMips32elGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788153  | ORPH 
...ps32elMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788154  | ORPH 
...tlinMips32elMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788156  | ORPH 
...32elUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788157  | ORPH 
...inMips32elUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788159  | ORPH 
...2r5elGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788160  | ORPH 
...nMips32r5elGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788162  | ORPH 
...32r5elMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788163  | ORPH 
...inMips32r5elMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788164  | ORPH 
...r5elUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788165  | ORPH 
...Mips32r5elUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788166  | ORPH 
...2r6elGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788167  | ORPH 
...nMips32r6elGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788168  | ORPH 
...32r6elMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788169  | ORPH 
...inMips32r6elMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788170  | ORPH 
...r6elUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788171  | ORPH 
...Mips32r6elUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788172  | ORPH 
...eln32GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788173  | ORPH 
...Mips64eln32GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788174  | ORPH 
...4eln32MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788175  | ORPH 
...nMips64eln32MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788176  | ORPH 
...ln32UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788177  | ORPH 
...ips64eln32UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788179  | ORPH 
...64n32GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788180  | ORPH 
...inMips64n32GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788182  | ORPH 
...s64n32MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788183  | ORPH 
...linMips64n32MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788184  | ORPH 
...4n32UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788185  | ORPH 
...nMips64n32UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788186  | ORPH 
...eln32GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788187  | ORPH 
...ps64r6eln32GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788188  | ORPH 
...6eln32MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788189  | ORPH 
...ips64r6eln32MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788190  | ORPH 
...ln32UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788191  | ORPH 
...s64r6eln32UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788192  | ORPH 
...Nios2GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788193  | ORPH 
...ootlinNios2GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788194  | ORPH 
...nriscGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788195  | ORPH 
...linOpenriscGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788196  | ORPH 
...enriscMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788197  | ORPH 
...tlinOpenriscMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788198  | ORPH 
...riscUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788199  | ORPH 
...inOpenriscUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788201  | ORPH 
...440fpGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788202  | ORPH 
...owerpc440fpGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788204  | ORPH 
...c440fpMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788206  | ORPH 
...Powerpc440fpMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788208  | ORPH 
...40fpUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788212  | ORPH 
...werpc440fpUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788214  | ORPH 
...e5500GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788216  | ORPH 
...erpc64e5500GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788220  | ORPH 
...e6500GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788224  | ORPH 
...erpc64e6500GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788228  | ORPH 
...4e6500MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788230  | ORPH 
...werpc64e6500MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788231  | ORPH 
...ower8GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788233  | ORPH 
...c64lepower8GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788235  | ORPH 
...power8MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788236  | ORPH 
...pc64lepower8MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788238  | ORPH 
...ower8GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788241  | ORPH 
...rpc64power8GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788242  | ORPH 
...power8MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788244  | ORPH 
...erpc64power8MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788246  | ORPH 
...300c3GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788247  | ORPH 
...werpce300c3GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788250  | ORPH 
...e300c3MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788252  | ORPH 
...owerpce300c3MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788253  | ORPH 
...00c3UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788256  | ORPH 
...erpce300c3UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788260  | ORPH 
...500mcGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788261  | ORPH 
...werpce500mcGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788263  | ORPH 
...e500mcMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788265  | ORPH 
...owerpce500mcMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788267  | ORPH 
...00mcUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788268  | ORPH 
...erpce500mcUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788270  | ORPH 
...lp32dGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788271  | ORPH 
...lp64dGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788272  | ORPH 
...iscv64lp64dGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788273  | ORPH 
...4lp64dMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788274  | ORPH 
...Riscv64lp64dMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788276  | ORPH 
...p64dUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788278  | ORPH 
...scv64lp64dUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788279  | ORPH 
...0xz13GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788280  | ORPH 
...linS390xz13GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788282  | ORPH 
...Shsh4GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788283  | ORPH 
...ootlinShsh4GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788284  | ORPH 
...nShsh4MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788285  | ORPH 
...BootlinShsh4MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788286  | ORPH 
...hsh4UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788287  | ORPH 
...otlinShsh4UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788288  | ORPH 
...h4aebGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788289  | ORPH 
...linShsh4aebGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788290  | ORPH 
...sh4aebMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788291  | ORPH 
...tlinShsh4aebMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788292  | ORPH 
...arc64GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788293  | ORPH 
...tlinSparc64GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788294  | ORPH 
...rcv8UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788295  | ORPH 
...linSparcv8UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788297  | ORPH 
...X8664GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788300  | ORPH 
...ootlinX8664GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788302  | ORPH 
...nX8664MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788304  | ORPH 
...BootlinX8664MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788307  | ORPH 
...8664UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788309  | ORPH 
...otlinX8664UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788311  | ORPH 
...orei7GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788312  | ORPH 
...X8664corei7GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788314  | ORPH 
...corei7MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788315  | ORPH 
...nX8664corei7MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788317  | ORPH 
...rei7UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788318  | ORPH 
...8664corei7UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788319  | ORPH 
...664v2GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788320  | ORPH 
...tlinX8664v2GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788322  | ORPH 
...8664v2MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788323  | ORPH 
...otlinX8664v2MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788324  | ORPH 
...64v2UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788325  | ORPH 
...linX8664v2UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788326  | ORPH 
...664v3GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788327  | ORPH 
...tlinX8664v3GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788328  | ORPH 
...8664v3MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788329  | ORPH 
...otlinX8664v3MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788330  | ORPH 
...64v3UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788331  | ORPH 
...linX8664v3UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788332  | ORPH 
...664v4GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788333  | ORPH 
...tlinX8664v4GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788334  | ORPH 
...8664v4MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788335  | ORPH 
...otlinX8664v4MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788336  | ORPH 
...64v4UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788337  | ORPH 
...linX8664v4UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788338  | ORPH 
...core2GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788339  | ORPH 
...linX86core2GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788340  | ORPH 
...6core2MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788341  | ORPH 
...tlinX86core2MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788342  | ORPH 
...ore2UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788343  | ORPH 
...inX86core2UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788344  | ORPH 
...6i686GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788345  | ORPH 
...tlinX86i686GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788346  | ORPH 
...86i686MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788347  | ORPH 
...otlinX86i686MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788348  | ORPH 
...i686UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788349  | ORPH 
...ToolchainBuildrootMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788060  | ORPH 
...olchainBuildrootuClibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788061  | ORPH 
...xternalToolchainCCache | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788062  | ORPH 
...ernalToolchainCtngMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788063  | ORPH 
...rnalToolchainLinaroArm | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788064  | ORPH 
...ToolchainSourceryArmv4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788065  | ORPH 
...ToolchainSourceryArmv5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788066  | ORPH 
...ToolchainSourceryArmv7 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788067  | ORPH 
                 TestF2FS | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787684  | ORPH 
     TestFileCapabilities | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787631  | ORPH 
       TestFortifyConserv | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787633  | ORPH 
          TestFortifyNone | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787634  | ORPH 
               TestGdbArc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787803  | ORPH 
        TestGdbFullTarget | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787805  | ORPH 
...GdbHostOnlyAllFeatures | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787807  | ORPH 
   TestGdbHostOnlyDefault | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787810  | ORPH 
        TestGdbserverOnly | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787814  | ORPH 
              TestGitHash | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787659  | ORPH 
               TestGitHub | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787662  | ORPH 
               TestGitLab | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787664  | ORPH 
              TestGitRefs | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787661  | ORPH 
     TestGlibcAllTimezone | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787654  | ORPH 
...DefaultLimitedTimezone | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787655  | ORPH 
              TestGlxinfo | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787815  | ORPH 
               TestGnupg2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787818  | ORPH 
       TestGrubAArch64EFI | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787621  | ORPH 
         TestGrubX8664EFI | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787622  | ORPH 
         TestGrubi386BIOS | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787623  | ORPH 
          TestGrubi386EFI | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787625  | ORPH 
           TestGst1Python | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787821  | ORPH 
                TestHWLoc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787826  | ORPH 
              TestHighway | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787823  | ORPH 
        TestHostBmapTools | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787782  | ORPH 
           TestIPythonPy3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787829  | ORPH 
  TestInitSystemBusyboxRo | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787726  | ORPH 
...InitSystemBusyboxRoNet | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787728  | ORPH 
  TestInitSystemBusyboxRw | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787730  | ORPH 
...InitSystemBusyboxRwNet | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787733  | ORPH 
       TestInitSystemNone | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787734  | ORPH 
...InitSystemOpenrcRoFull | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787738  | ORPH 
...InitSystemOpenrcRwFull | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787740  | ORPH 
...nitSystemSystemdRoFull | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787744  | ORPH 
...ystemSystemdRoIfupdown | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787747  | ORPH 
...mdRoIfupdownDbusbroker | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787750  | ORPH 
...IfupdownDbusbrokerDbus | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787753  | ORPH 
...ystemSystemdRoNetworkd | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787756  | ORPH 
...nitSystemSystemdRwFull | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787758  | ORPH 
...ystemSystemdRwIfupdown | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787761  | ORPH 
...mdRwIfupdownDbusbroker | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787765  | ORPH 
...IfupdownDbusbrokerDbus | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787767  | ORPH 
...ystemSystemdRwNetworkd | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787770  | ORPH 
      TestIso9660Grub2EFI | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787685  | ORPH 
 TestIso9660Grub2External | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787689  | ORPH 
...0Grub2ExternalCompress | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787692  | ORPH 
   TestIso9660Grub2Hybrid | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787695  | ORPH 
 TestIso9660Grub2Internal | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787699  | ORPH 
...so9660SyslinuxExternal | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787702  | ORPH 
...slinuxExternalCompress | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787704  | ORPH 
...so9660SyslinuxInternal | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787707  | ORPH 
                TestJffs2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787710  | ORPH 
               TestLibJXL | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787835  | ORPH 
            TestLibshdata | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787837  | ORPH 
                  TestLua | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787848  | ORPH 
              TestLuaHttp | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787875  | ORPH 
           TestLuaInotify | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787878  | ORPH 
              TestLuaLPeg | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787841  | ORPH 
          TestLuaLsqlite3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787844  | ORPH 
         TestLuaLuaArgon2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787854  | ORPH 
         TestLuaLuaAugeas | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787857  | ORPH 
           TestLuaLuaCffi | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787862  | ORPH 
        TestLuaLuaCqueues | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787863  | ORPH 
          TestLuaLuaExpat | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787893  | ORPH 
     TestLuaLuaFileSystem | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787895  | ORPH 
             TestLuaLuaGD | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787872  | ORPH 
           TestLuaLuaLdap | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787897  | ORPH 
          TestLuaLuaLyaml | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787884  | ORPH 
          TestLuaLuaPosix | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787901  | ORPH 
           TestLuaLuaSDL2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787886  | ORPH 
            TestLuaLuaSec | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787903  | ORPH 
         TestLuaLuaSocket | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787905  | ORPH 
           TestLuaLuacURL | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787869  | ORPH 
           TestLuaLuaossl | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787899  | ORPH 
         TestLuaLuasyslog | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787907  | ORPH 
           TestLuaLuazlib | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787891  | ORPH 
             TestLuaLunix | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787881  | ORPH 
             TestLuaLzlib | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787911  | ORPH 
             TestLuaRings | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788038  | ORPH 
              TestLuaUtf8 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787889  | ORPH 
               TestLuajit | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787851  | ORPH 
           TestLuajitHttp | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787877  | ORPH 
        TestLuajitInotify | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787880  | ORPH 
           TestLuajitLPeg | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787843  | ORPH 
       TestLuajitLsqlite3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787846  | ORPH 
      TestLuajitLuaArgon2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787855  | ORPH 
      TestLuajitLuaAugeas | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787859  | ORPH 
     TestLuajitLuaCqueues | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787866  | ORPH 
       TestLuajitLuaExpat | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787894  | ORPH 
  TestLuajitLuaFileSystem | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787896  | ORPH 
          TestLuajitLuaGD | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787873  | ORPH 
        TestLuajitLuaLdap | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787898  | ORPH 
       TestLuajitLuaLyaml | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787885  | ORPH 
       TestLuajitLuaPosix | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787902  | ORPH 
        TestLuajitLuaSDL2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787888  | ORPH 
         TestLuajitLuaSec | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787904  | ORPH 
      TestLuajitLuaSocket | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787906  | ORPH 
        TestLuajitLuacURL | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787870  | ORPH 
        TestLuajitLuaossl | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787900  | ORPH 
      TestLuajitLuasyslog | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787908  | ORPH 
        TestLuajitLuazlib | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787892  | ORPH 
          TestLuajitLunix | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787882  | ORPH 
          TestLuajitRings | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788039  | ORPH 
       TestLuajitTurbolua | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788050  | ORPH 
           TestLuajitUtf8 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787890  | ORPH 
                 TestLuvi | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787909  | ORPH 
                  TestLxc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787910  | ORPH 
               TestMender | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787912  | ORPH 
             TestMsrTools | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787913  | ORPH 
                 TestNcdu | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787914  | ORPH 
              TestNetdata | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787915  | ORPH 
           TestNoTimezone | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787657  | ORPH 
          TestNodeJSBasic | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787916  | ORPH 
         TestNodeJSModule | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787917  | ORPH 
                  TestOci | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787712  | ORPH 
               TestOctave | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787918  | ORPH 
                  TestOla | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787920  | ORPH 
              TestOpenJdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787921  | ORPH 
         TestOpenSshGlibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787922  | ORPH 
        TestOpenSshuClibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787923  | ORPH 
                 TestOpkg | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787924  | ORPH 
             TestPerftest | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787925  | ORPH 
                 TestPerl | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787926  | ORPH 
        TestPerlClassLoad | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787927  | ORPH 
         TestPerlDBDmysql | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787928  | ORPH 
     TestPerlEncodeDetect | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787929  | ORPH 
          TestPerlGDGraph | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787930  | ORPH 
       TestPerlHTMLParser | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787931  | ORPH 
TestPerlIOSocketMulticast | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787932  | ORPH 
      TestPerlIOSocketSSL | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787933  | ORPH 
 TestPerlLWPProtocolhttps | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787935  | ORPH 
         TestPerlMailDKIM | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787936  | ORPH 
              TestPerlX10 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787937  | ORPH 
        TestPerlXMLLibXML | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787938  | ORPH 
       TestPerllibwwwperl | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787934  | ORPH 
              TestPhpApcu | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787939  | ORPH 
            TestPhpLuaLua | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787940  | ORPH 
         TestPhpLuaLuajit | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787941  | ORPH 
               TestPhpPam | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787942  | ORPH 
          TestPhpPeclDbus | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787943  | ORPH 
                 TestPixz | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787944  | ORPH 
          TestPolkitInitd | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787945  | ORPH 
        TestPolkitSystemd | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787946  | ORPH 
          TestPostScripts | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787639  | ORPH 
         TestProsodyLua51 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787947  | ORPH 
        TestProsodyLuajit | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787948  | ORPH 
         TestPy3BmapTools | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787786  | ORPH 
              TestPyNdiff | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788009  | ORPH 
            TestPython3Py | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787949  | ORPH 
         TestPython3PyPyc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787950  | ORPH 
           TestPython3Pyc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787951  | ORPH 
         TestPythonAugeas | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787955  | ORPH 
           TestPythonAvro | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787958  | ORPH 
       TestPythonPahoMQTT | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788003  | ORPH 
     TestPythonPy3Aexpect | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787952  | ORPH 
        TestPythonPy3Argh | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787953  | ORPH 
       TestPythonPy3Attrs | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787954  | ORPH 
    TestPythonPy3Autobahn | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787956  | ORPH 
     TestPythonPy3Automat | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787957  | ORPH 
   TestPythonPy3Bitstring | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787959  | ORPH 
       TestPythonPy3Boto3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787960  | ORPH 
    TestPythonPy3Botocore | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787961  | ORPH 
         TestPythonPy3Can | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787963  | ORPH 
        TestPythonPy3Cbor | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787964  | ORPH 
       TestPythonPy3Click | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787965  | ORPH 
   TestPythonPy3Colorzero | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787966  | ORPH 
  TestPythonPy3Constantly | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787968  | ORPH 
   TestPythonPy3Construct | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787970  | ORPH 
    TestPythonPy3Crossbar | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787972  | ORPH 
TestPythonPy3Cryptography | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787973  | ORPH 
    TestPythonPy3DBusFast | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787975  | ORPH 
    TestPythonPy3DBusNext | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787977  | ORPH 
  TestPythonPy3Dicttoxml2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787979  | ORPH 
      TestPythonPy3Distro | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787980  | ORPH 
      TestPythonPy3Django | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787982  | ORPH 
    TestPythonPy3Dtschema | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787984  | ORPH 
       TestPythonPy3Flask | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787986  | ORPH 
...honPy3FlaskExpectsJson | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787987  | ORPH 
         TestPythonPy3Git | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787989  | ORPH 
      TestPythonPy3Gitdb2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787991  | ORPH 
       TestPythonPy3GnuPG | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787993  | ORPH 
     TestPythonPy3Gobject | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787994  | ORPH 
    TestPythonPy3Gpiozero | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787995  | ORPH 
        TestPythonPy3Hkdf | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787996  | ORPH 
 TestPythonPy3Incremental | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787997  | ORPH 
    TestPythonPy3Iptables | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787999  | ORPH 
    TestPythonPy3Jmespath | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788000  | ORPH 
    TestPythonPy3Libftdi1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787832  | ORPH 
...PythonPy3MagicWormhole | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788001  | ORPH 
       TestPythonPy3Munch | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788002  | ORPH 
     TestPythonPy3Passlib | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788004  | ORPH 
     TestPythonPy3Pexpect | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788005  | ORPH 
      TestPythonPy3PyAlsa | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788006  | ORPH 
      TestPythonPy3Pynacl | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788008  | ORPH 
      TestPythonPy3Pytest | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788010  | ORPH 
...PythonPy3PytestAsyncio | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788011  | ORPH 
      TestPythonPy3Pyyaml | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788012  | ORPH 
      TestPythonPy3Qrcode | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788013  | ORPH 
         TestPythonPy3RSA | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788015  | ORPH 
     TestPythonPy3RpiGpio | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788014  | ORPH 
  TestPythonPy3S3transfer | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788017  | ORPH 
       TestPythonPy3SciPy | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788018  | ORPH 
...thonPy3ServiceIdentity | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788019  | ORPH 
      TestPythonPy3Smmap2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788020  | ORPH 
      TestPythonPy3Spake2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788021  | ORPH 
        TestPythonPy3Treq | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788023  | ORPH 
     TestPythonPy3Twisted | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788025  | ORPH 
       TestPythonPy3Txaio | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788027  | ORPH 
    TestPythonPy3Txtorcon | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788029  | ORPH 
      TestPythonPy3Ubjson | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788030  | ORPH 
...y3UnitTestXmlReporting | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788032  | ORPH 
       TestPythonPy3rtoml | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788016  | ORPH 
         TestPythonPybind | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788007  | ORPH 
             TestRdmaCore | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788034  | ORPH 
                TestRedis | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788037  | ORPH 
                TestRelro | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787635  | ORPH 
         TestRelroPartial | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787636  | ORPH 
         TestRootPassword | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787640  | ORPH 
        TestRootfsOverlay | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787642  | ORPH 
                 TestRust | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788040  | ORPH 
              TestRustBin | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788041  | ORPH 
                   TestS6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788042  | ORPH 
         TestS6Networking | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788043  | ORPH 
      TestS6PortableUtils | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788045  | ORPH 
                 TestS6Rc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788046  | ORPH 
                  TestSCP | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787665  | ORPH 
     TestSELinuxCustomGit | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787645  | ORPH 
  TestSELinuxExtraModules | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787648  | ORPH 
...ELinuxExtraModulesDirs | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787649  | ORPH 
       TestSELinuxPackage | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787652  | ORPH 
   TestSELinuxSystemdExt4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787773  | ORPH 
...SELinuxSystemdSquashfs | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787776  | ORPH 
                 TestSFTP | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787666  | ORPH 
             TestSquashfs | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787714  | ORPH 
 TestSquashfsMaxBlocksize | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787717  | ORPH 
 TestSquashfsMinBlocksize | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787718  | ORPH 
              TestSspNone | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787637  | ORPH 
            TestSspStrong | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787638  | ORPH 
                 TestSudo | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788047  | ORPH 
       TestSysLinuxX86EFI | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787626  | ORPH 
TestSysLinuxX86LegacyBios | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787627  | ORPH 
    TestSysLinuxX86_64EFI | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787628  | ORPH 
...sLinuxX86_64LegacyBios | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787629  | ORPH 
             TestSyslogNg | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788048  | ORPH 
                 TestTmux | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788049  | ORPH 
                  TestUbi | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787720  | ORPH 
TestUbootOpensslPkgConfig | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788051  | ORPH 
               TestYaffs2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804787723  | ORPH 
                   TestZ3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788052  | ORPH 
             TestZerofree | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788053  | ORPH 
             TestZfsGlibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788054  | ORPH 
              TestZfsMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788055  | ORPH 
            TestZfsUclibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3804788056  | ORPH 



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
