Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56FC0C77B7C
	for <buildroot@archiver.kernel.org>; Thu, 11 May 2023 05:34:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B64AB83EFA;
	Thu, 11 May 2023 05:34:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B64AB83EFA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ocx2R8f4uOjI; Thu, 11 May 2023 05:34:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 54A8B83F05;
	Thu, 11 May 2023 05:34:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 54A8B83F05
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 408DE1BF2AB
 for <buildroot@lists.busybox.net>; Thu, 11 May 2023 05:34:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DEC4160D65
 for <buildroot@lists.busybox.net>; Thu, 11 May 2023 05:34:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DEC4160D65
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sNTdqIY2QGL2 for <buildroot@lists.busybox.net>;
 Thu, 11 May 2023 05:34:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 835B360BCE
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 835B360BCE
 for <buildroot@buildroot.org>; Thu, 11 May 2023 05:34:04 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 8841BFF80B
 for <buildroot@buildroot.org>; Thu, 11 May 2023 05:34:01 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Thu, 11 May 2023 05:34:01 -0000
Message-Id: <20230511053406.DEC4160D65@smtp3.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1683783241; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=9wJcXUoZ6bDB+ufYUYKnEBXI0jp5e4AxGiBk84YkApg=;
 b=fNYUHnhZyewOCyB1GiuXAPGg8hepUCiz3Sy7bfUPq81X0NXo6ksoi7tThSwK9T6bBAzwuV
 SyZckv+hhqRMg/yY9qMvK8rWpV8Su4t/ADIoZPWxQLqruxxGi1BoETSFIRiN+eoGlipHSk
 fvc3ZU/bdlHpYFTNAYhaoDyHStvQZ8q5P7N5buieOporemmESD5uCGwfbFu67pxTzpndHO
 8FAXBuD+8vEDWGSLoo0UhFH1HTCQvyxxxfqW2oqzjzFudigGmLS36cgt1fF5Qy4rNkygGN
 PmJ1OidhWbLwHlx1z4qVqGw5kMEs7uPZZc8GG/OijCgkjrnHMyH4rynU4SlfJw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=fNYUHnhZ
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-05-10
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

Autobuild statistics for 2023-05-10
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  |  2  |  1  |  0  |  3  |
  2023.02.x  |  7  |  5  |  0  | 12  |
    master   | 65  | 72  |  0  | 137 |

Classification of failures by reason for master
-----------------------------------------------

                 agentpp-4.6.0 | 5 
         host-gcc-final-11.3.0 | 5 
               host-qemu-7.2.0 | 5 
               libglib2-2.76.1 | 5 
            host-binutils-2.38 | 4 
                   linux-6.3.1 | 4 
                 uclibc-1.0.43 | 3 
                       unknown | 3 
          cryptodev-linux-1.12 | 2 
  gobject-introspection-1.72.0 | 2 
host-gdb-arc-2020.09-releas... | 2 
              host-rust-1.68.2 | 2 
          linux-5.10.162-cip24 | 2 
                   trinity-1.9 | 2 
               acpica-20220331 | 1 
             berkeleydb-5.3.28 | 1 
                    brltty-6.5 | 1 
                 coreutils-9.3 | 1 
                    crun-1.8.4 | 1 
               dbus-glib-0.112 | 1 
                     efivar-38 | 1 
                elfutils-0.186 | 1 
fs/cramfs/cramfs.mk:46: /ho... | 1 
            host-binutils-2.37 | 1 
         host-gcc-final-10.4.0 | 1 
                       iw-5.19 | 1 
            micropython-1.19.1 | 1 
                  ntp-4.2.8p15 | 1 
                  ntpsec-1.2.2 | 1 
                    olsr-0.9.8 | 1 
   openvmtools-11.3.5-18557794 | 1 
                    parted-3.5 | 1 
                   perl-5.36.1 | 1 
rtl8192eu-865656c3a1d1aee8c... | 1 
                   shadow-4.13 | 1 
               syslog-ng-4.1.1 | 1 
toolchain-external-codescap... | 1 
               valgrind-3.20.0 | 1 
                 wavemon-0.9.4 | 1 
               zxing-cpp-1.4.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |        acpica-20220331         | NOK | http://autobuild.buildroot.net/results/5b5a6c66557f0b914b9d446ad92a85fceedceae6 |     
    arm      |         agentpp-4.6.0          | NOK | http://autobuild.buildroot.net/results/3580847a7cf8674a7fb59a98eedfca94cba6cdda |     
   arceb     |         agentpp-4.6.0          | NOK | http://autobuild.buildroot.net/results/3aeeabc53374aadc07da6f4020e98db9bd43d136 |     
    i686     |         agentpp-4.6.0          | NOK | http://autobuild.buildroot.net/results/c901dcaeab88c5ed521c5a8ce6e5e8c913f33c88 |     
  aarch64    |         agentpp-4.6.0          | NOK | http://autobuild.buildroot.net/results/1e948fdb4165a1ec02216fb56074852abf6e3489 |     
powerpc64le  |         agentpp-4.6.0          | NOK | http://autobuild.buildroot.net/results/e8a5a306eb68ee69c0419ae7161bc633c368d792 |     
    sh4a     |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/4ead370497dd878a8e2af99db511d07adcb1326b | ORPH
    mips     |           brltty-6.5           | NOK | http://autobuild.buildroot.net/results/7a51c57cee2ae59ff739af54732c447d5d544daf |     
   sparc     |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/4023f22a52f2ac87122e87993f21ef300772b6e4 | ORPH
   mips64    |           crun-1.8.4           | NOK | http://autobuild.buildroot.net/results/64e719f5d43a2cfa92b329fc28b5b924a348fd2e |     
   x86_64    |      cryptodev-linux-1.12      | NOK | http://autobuild.buildroot.net/results/883e0b8f1256171e079552ae8ea442dc1ad03670 | ORPH
    arc      |      cryptodev-linux-1.12      | NOK | http://autobuild.buildroot.net/results/b441a2751b8cd954b941b50ccff92c3c8843ea59 | ORPH
   sparc     |        dbus-glib-0.112         | NOK | http://autobuild.buildroot.net/results/cb967fc722fb86d613b012f996e196f0b51fb0a6 | ORPH
    i586     |           efivar-38            | NOK | http://autobuild.buildroot.net/results/16a512d6f042dd7dbee611871592b1e4dc93b8ae |     
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/b6ac2734de753355b162ada9e57cabaf0d84958f | ORPH
   mips64    | fs/cramfs/cramfs.mk:46: /ho... | NOK | http://autobuild.buildroot.net/results/1fef762a5832b6aeb9b6ceb41a2bef1fe2a9b314 |     
   s390x     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/26b6f8eb322f84c47a8f18439ed10f4717d6531c | ORPH
 powerpc64   |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/8f662c499245ab244fe7dcd78ab29c53739315c4 | ORPH
   mips64    |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/57a2736fbb9088247485b847285e42b6079897a8 |     
  riscv64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/6812f5c8572ba94733d29dff80d53698380f60bc |     
   nios2     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/a2e54a7a1eade9ff3494dc654cbb9ec7fe0c2441 |     
microblazeel |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/b16af96586f73f036bc8a845222ef1ec438dcc60 |     
  mips64el   |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/48cf456005ed29f94edfb952f33a73c69e95b029 |     
  mips64el   |     host-gcc-final-10.4.0      | NOK | http://autobuild.buildroot.net/results/1c4fd16943d18110abcd52d37c20a8dbd2ce1c0b |     
 aarch64_be  |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/f4e46f2ef581e86720c3e1ff96293638fcaedbc7 |     
    sh4      |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/3ed9321dd294afc0ef2cb8b60b931a25db91e925 |     
  powerpc    |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/adc78917d591249545539d2207172f5a2a1be645 |     
   armeb     |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/a40b6a02093fbe78d7ebccbd608eb544ada3b9ac |     
microblazeel |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/54f520c4a2b653c6b3e57ab19244be8f2dbc8224 |     
    arc      | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/69e8ab4bc97a5ff58291a058dff10684742beda7 | ORPH
    arc      | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/004d9037fa050d07ef3fd7b424851380f0327dbb | ORPH
  riscv32    |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/0b307a5aa95f76697cb7e543e5327fa7ed654e25 |     
 microblaze  |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/2dc42cd67900c0b6e1c0a8bf33b30783ab57e907 |     
   x86_64    |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/9c19d6d79cbad66bc1d512004760658cc82a970a |     
  powerpc    |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/c7de597befbfad0dfc3e35c1585e62ed7dfdf4b1 |     
   mipsel    |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/cb93f11a6a32665cb26ff6b888d73c92f8d69fee |     
  aarch64    |        host-rust-1.68.2        | NOK | http://autobuild.buildroot.net/results/1c0a0ac3cf82a4b05340021b9a79e5ecdd57f684 |     
  aarch64    |        host-rust-1.68.2        | NOK | http://autobuild.buildroot.net/results/566f2327098ea3d17e7e2a48b6f0ce6578ece597 |     
    arm      |            iw-5.19             | NOK | http://autobuild.buildroot.net/results/d009d860cb537a8d1ae344286fb2ff724b83ca2c | ORPH
    arc      |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/6465034e1ce9cf711e9157254498cd461127d169 |     
    arc      |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/5bd265b79bcca12a173af1dc19d1ce3c9d942d6b |     
    arc      |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/f1df5e34cca39157ff84981236a202e0386e7061 |     
    arc      |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/2882879bb35c5bf933c32f6938130a8b50c51d66 |     
    arc      |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/8e348d3bd97c2135bf497bd6cb005cb0a93d81a3 |     
   x86_64    |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/a4fbe1bf9d5599de25ac6a101ccadba2a7bca2c5 | ORPH
   x86_64    |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/9a88e54d19d20e47b97d78904241cea4facbfef9 | ORPH
  mips64el   |          linux-6.3.1           | NOK | http://autobuild.buildroot.net/results/02358fb6c18e377a277459176492ef4607709076 | ORPH
   mips64    |          linux-6.3.1           | NOK | http://autobuild.buildroot.net/results/3507dc042898494a4eb3a68b0247cf5116776552 | ORPH
   arceb     |          linux-6.3.1           | NOK | http://autobuild.buildroot.net/results/d82f39f1610b1a833149288a9fad96a3ad8ffd10 | ORPH
  powerpc    |          linux-6.3.1           | NOK | http://autobuild.buildroot.net/results/5cb29b24fdf8f8f1882a92a156f228a665a643b5 | ORPH
 aarch64_be  |       micropython-1.19.1       | NOK | http://autobuild.buildroot.net/results/e972624339d047c3d28adef24d47dfa1ba28681e |     
    m68k     |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/94cec40f62f919169455ce641f5295f88fab80e3 | ORPH
microblazeel |          ntpsec-1.2.2          | NOK | http://autobuild.buildroot.net/results/244c6d92108fcb73165362aa7be7ab193cf728b2 | ORPH
    arm      |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/5dc2d3985026b6acf511797f865f786c6ac66c7a | ORPH
   x86_64    |  openvmtools-11.3.5-18557794   | NOK | http://autobuild.buildroot.net/results/fe3dc85197f41be4df5094f6c6750c2c76ac34de |     
   arceb     |           parted-3.5           | NOK | http://autobuild.buildroot.net/results/87adfe8826e31ba439ef8020e0a3641c4fe57cdf |     
   arceb     |          perl-5.36.1           | NOK | http://autobuild.buildroot.net/results/07ce2938fdbede3a92b36d13c94cc692e48cff3d |     
    or1k     | rtl8192eu-865656c3a1d1aee8c... | NOK | http://autobuild.buildroot.net/results/ca1946135f66d0c1849af5146dc972c49de867a8 |     
  riscv64    |          shadow-4.13           | NOK | http://autobuild.buildroot.net/results/51d6ee0f57c1781ba73cbfe9145df0ca19437aa4 |     
    mips     |        syslog-ng-4.1.1         | NOK | http://autobuild.buildroot.net/results/2aba24da9d8539247636ebdd7d6b377e85e8415f |     
   mips64    | toolchain-external-codescap... | NOK | http://autobuild.buildroot.net/results/bc8be883cd677aaf5a11526c0eade4493f25121d | ORPH
powerpc64le  |          trinity-1.9           | NOK | http://autobuild.buildroot.net/results/b15388f6acabb124a2ddc40f07fca748039ef6cc | ORPH
powerpc64le  |          trinity-1.9           | NOK | http://autobuild.buildroot.net/results/703643bc06b9e29c5e26e73e9d2ffd98940d035e | ORPH
   xtensa    |         uclibc-1.0.43          | NOK | http://autobuild.buildroot.net/results/9960f8c380c01b75291b0f258c41da9606222cd6 |     
  powerpc    |         uclibc-1.0.43          | NOK | http://autobuild.buildroot.net/results/aad4e0f269e359a1dee4a0b85a53825678e7a3a0 |     
   xtensa    |         uclibc-1.0.43          | NOK | http://autobuild.buildroot.net/results/af7dbd3e09dfe089a2b737ccf6e4e95c0397fc51 |     
   arceb     |            unknown             | NOK | http://autobuild.buildroot.net/results/0ed0427c65e5c8edf98ea0069121705a78c1959c |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.net/results/38a6d4de842eb006da7520fccd4492c1b16097db |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/2db082406f57d23c52bb29d525017d32a663ba90 |     
  mips64el   |        valgrind-3.20.0         | NOK | http://autobuild.buildroot.net/results/cb61591b0e97a5b7832958a682aff49b64feea76 | ORPH
microblazeel |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/e65cf7763f12eda1c1f4823d20c6b9300634966c | ORPH
powerpc64le  |        zxing-cpp-1.4.0         | NOK | http://autobuild.buildroot.net/results/6ec6682c8fd776864326631c9a3a5081009c7ff7 |     


Classification of failures by reason for 2022.02.x
--------------------------------------------------

            igd2-for-linux-2.1 | 1 


Detail of failures for 2022.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/f659ad094e534745edc8a1b1978aada7e72246ed |     


Classification of failures by reason for 2023.02.x
--------------------------------------------------

               host-qemu-7.2.0 | 2 
                 agentpp-4.6.0 | 1 
                busybox-1.36.0 | 1 
                    parted-3.5 | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |         agentpp-4.6.0          | NOK | http://autobuild.buildroot.net/results/bbeba08f8a7fd681f21d824627c2de5454c23fd4 |     
    arm      |         busybox-1.36.0         | NOK | http://autobuild.buildroot.net/results/d7457d3f73882b6afb623d7497d18c035a2ef3d2 | ORPH
   s390x     |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/84af93d2843909e522e8b5690dfaef3ed3c6866e |     
  powerpc    |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/6b8ba148c4b3c6eb93872403f6b8800ad797f4f3 |     
    arm      |           parted-3.5           | NOK | http://autobuild.buildroot.net/results/cdb66a731993909ecf5daca7c0b7269d61ef75be |     


Gitlab CI results for 2023-05-10
================================

Detail of defconfig failures for 2023.02.1
------------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
                       qemu_s390x | https://gitlab.com/buildroot.org/buildroot/-/jobs/4254727540  |      


Detail of runtime-test failures for 2023.02.1
---------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
      TestClangCompilerRT | https://gitlab.com/buildroot.org/buildroot/-/jobs/4254727757  | ORPH 
           TestCrudiniPy3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4254727760  | ORPH 
...inArclehs38GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4254728175  | ORPH 
...riscUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4254728285  | ORPH 
...ToolchainBuildrootMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/4254728142  | ORPH 
...olchainBuildrootuClibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/4254728143  | ORPH 
...xternalToolchainCCache | https://gitlab.com/buildroot.org/buildroot/-/jobs/4254728144  | ORPH 
...ernalToolchainCtngMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/4254728145  | ORPH 
...ToolchainSourceryArmv4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4254728147  | ORPH 
...ToolchainSourceryArmv5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4254728148  | ORPH 
...ToolchainSourceryArmv7 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4254728149  | ORPH 
     TestFileCapabilities | https://gitlab.com/buildroot.org/buildroot/-/jobs/4254727607  | ORPH 
     TestGlibcAllTimezone | https://gitlab.com/buildroot.org/buildroot/-/jobs/4254727634  | ORPH 
...DefaultLimitedTimezone | https://gitlab.com/buildroot.org/buildroot/-/jobs/4254727636  | ORPH 
           TestIPythonPy3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4254727787  | ORPH 
       TestInitSystemNone | https://gitlab.com/buildroot.org/buildroot/-/jobs/4254727707  | ORPH 
      TestIso9660Grub2EFI | https://gitlab.com/buildroot.org/buildroot/-/jobs/4254727665  | ORPH 
 TestIso9660Grub2External | https://gitlab.com/buildroot.org/buildroot/-/jobs/4254727667  | ORPH 
...0Grub2ExternalCompress | https://gitlab.com/buildroot.org/buildroot/-/jobs/4254727669  | ORPH 
   TestIso9660Grub2Hybrid | https://gitlab.com/buildroot.org/buildroot/-/jobs/4254727673  | ORPH 
 TestIso9660Grub2Internal | https://gitlab.com/buildroot.org/buildroot/-/jobs/4254727676  | ORPH 
...so9660SyslinuxExternal | https://gitlab.com/buildroot.org/buildroot/-/jobs/4254727679  | ORPH 
...slinuxExternalCompress | https://gitlab.com/buildroot.org/buildroot/-/jobs/4254727682  | ORPH 
...so9660SyslinuxInternal | https://gitlab.com/buildroot.org/buildroot/-/jobs/4254727686  | ORPH 
               TestLibJXL | https://gitlab.com/buildroot.org/buildroot/-/jobs/4254727791  | ORPH 
         TestLuajitLuaSec | https://gitlab.com/buildroot.org/buildroot/-/jobs/4254727883  | ORPH 
             TestPerftest | https://gitlab.com/buildroot.org/buildroot/-/jobs/4254727939  | ORPH 
 TestPerlLWPProtocolhttps | https://gitlab.com/buildroot.org/buildroot/-/jobs/4254727969  | ORPH 
       TestPerllibwwwperl | https://gitlab.com/buildroot.org/buildroot/-/jobs/4254727967  | ORPH 
         TestPythonPy3Can | https://gitlab.com/buildroot.org/buildroot/-/jobs/4254728032  | ORPH 
    TestPythonPy3DBusFast | https://gitlab.com/buildroot.org/buildroot/-/jobs/4254728043  | ORPH 
      TestPythonPy3Django | https://gitlab.com/buildroot.org/buildroot/-/jobs/4254728047  | ORPH 
         TestPythonPy3Git | https://gitlab.com/buildroot.org/buildroot/-/jobs/4254728051  | ORPH 
...PythonPy3MagicWormhole | https://gitlab.com/buildroot.org/buildroot/-/jobs/4254728060  | ORPH 
       TestPythonPy3Munch | https://gitlab.com/buildroot.org/buildroot/-/jobs/4254728062  | ORPH 
                   TestS6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4254728103  | ORPH 
             TestZfsGlibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/4254728132  | ORPH 
              TestZfsMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/4254728134  | ORPH 
            TestZfsUclibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/4254728136  | ORPH 



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
