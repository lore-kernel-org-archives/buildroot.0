Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0217EEB64DC
	for <buildroot@archiver.kernel.org>; Sat,  1 Jul 2023 04:44:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 52A7240119;
	Sat,  1 Jul 2023 04:44:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 52A7240119
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GWZvbXFo2eua; Sat,  1 Jul 2023 04:44:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B8EB340160;
	Sat,  1 Jul 2023 04:44:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B8EB340160
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id ED7141BF228
 for <buildroot@lists.busybox.net>; Sat,  1 Jul 2023 04:44:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A44AA6126C
 for <buildroot@lists.busybox.net>; Sat,  1 Jul 2023 04:44:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A44AA6126C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9q_rJmzCoo8Q for <buildroot@lists.busybox.net>;
 Sat,  1 Jul 2023 04:44:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 38A536119A
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 38A536119A
 for <buildroot@buildroot.org>; Sat,  1 Jul 2023 04:44:17 +0000 (UTC)
X-GND-Sasl: thomas.petazzoni@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 41F141C0004
 for <buildroot@buildroot.org>; Sat,  1 Jul 2023 04:44:14 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sat, 01 Jul 2023 04:44:14 -0000
Message-Id: <20230701044419.A44AA6126C@smtp3.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1688186654; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=E8Om7YekkZal92vZT3QNQqmUc+lJzdRL8ULP43AVnWE=;
 b=KidE7iXg/Xkj+leVLO/LaerxfWJ9q191I1yLl039J8aOUcKm2XySVibDRpPBGMqw41ZMgW
 MLU7cA3qOB2xhHotChR2Teb6zz+caRHtr9tpbro2DkqOYk8YsyqgMPPw3Z9IlesqGHWwy4
 SlPvXpV4ZYAwePG5F8v4UsECw88J7IexhlV2zUD+j7HtUD4qzCteAtoKue9aimCQ1fpsi1
 id2PpDbbGHKbdePg3+Esa8GS5vKhn6F3GVkgyLq5BjwhNe6Y2o+M51A4X/mwE3CFmhwCo1
 fEnsrUsRLEbiH/xasUy4ForKjTX8ocMHcZECr2m9WEDi02+jM6+vMjwvKPxERA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=KidE7iXg
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-06-30
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

Autobuild statistics for 2023-06-30
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  |  5  |  8  |  0  | 13  |
    master   | 96  | 131 |  2  | 229 |

Classification of failures by reason for master
-----------------------------------------------

                   gupnp-1.4.3 | 15
                alsa-lib-1.2.9 | 9 
                   linux-6.3.9 | 8 
                    strace-6.3 | 8 
            host-binutils-2.38 | 6 
                  check-0.15.2 | 5 
             host-ccache-4.8.2 | 5 
               host-go-1.19.10 | 4 
  gobject-introspection-1.74.0 | 3 
              host-rust-1.70.0 | 3 
               libglib2-2.76.1 | 3 
              open62541-v1.3.4 | 3 
            quickjs-2021-03-27 | 3 
                 agentpp-4.6.0 | 2 
          dfu-programmer-1.0.0 | 2 
fs/ubifs/ubifs.mk:49: /home... | 2 
glibc-2.37-2-g9f8513dc64119... | 2 
          libedit-20221030-3.1 | 2 
                     lxc-5.0.2 | 2 
                 opensc-0.23.0 | 2 
                     pv-1.6.20 | 2 
      python-setuptools-68.0.0 | 2 
                python3-3.11.4 | 2 
                xenomai-3.0.10 | 2 
             batman-adv-2022.3 | 1 
                  boost-1.82.0 | 1 
              dropbear-2022.83 | 1 
                elfutils-0.186 | 1 
                  ffmpeg-4.4.4 | 1 
                     file-5.43 | 1 
                   flann-1.9.2 | 1 
             fontconfig-2.14.2 | 1 
fs/ubi/ubi.mk:51: /home/aut... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
         gobject-introspection | 1 
                heirloom-mailx | 1 
         host-gcc-final-11.4.0 | 1 
host-gdb-arc-2020.09-releas... | 1 
                  kexec-2.0.26 | 1 
kvmtool-f77d646ba01d04be5aa... | 1 
      libabseil-cpp-20220623.1 | 1 
     linux-5.10.162-cip24-rt10 | 1 
            linux-fusion-9.0.3 | 1 
        ltp-testsuite-20230127 | 1 
          lttng-modules-2.13.7 | 1 
               mariadb-10.3.36 | 1 
                nodejs-16.20.0 | 1 
                    olsr-0.9.8 | 1 
                opencv3-3.4.19 | 1 
                     php-8.2.7 | 1 
sconeserver-8d1935919a20133... | 1 
                    sdl-1.2.15 | 1 
              sdl2_mixer-2.6.3 | 1 
               syslog-ng-4.1.1 | 1 
                   trinity-1.9 | 1 
                       unknown | 1 
               valgrind-3.20.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |         agentpp-4.6.0          | NOK | http://autobuild.buildroot.net/results/7e471b167b0e7dbb2533498979205555bc1ddde2 |     
   mips64    |         agentpp-4.6.0          | NOK | http://autobuild.buildroot.net/results/ae212fcfc114e3880b2d1ccf42955a18ec14faeb |     
 microblaze  |         alsa-lib-1.2.9         | NOK | http://autobuild.buildroot.net/results/824d1a7d2db6384375e16ad36ba9072c5f4def2a |     
microblazeel |         alsa-lib-1.2.9         | NOK | http://autobuild.buildroot.net/results/ae2d4f9d5f1b30ee20fd9495478f9190bb8faeff |     
 microblaze  |         alsa-lib-1.2.9         | NOK | http://autobuild.buildroot.net/results/d7c05c59141073c90cdba98e43b43a80dfa92ade |     
microblazeel |         alsa-lib-1.2.9         | NOK | http://autobuild.buildroot.net/results/3da95b8a862b6c597c5cb8d347edb73e4f3db3f0 |     
microblazeel |         alsa-lib-1.2.9         | NOK | http://autobuild.buildroot.net/results/0524b90a5d03956830428b9b44e914da498c5ade |     
 microblaze  |         alsa-lib-1.2.9         | NOK | http://autobuild.buildroot.net/results/7c7c7cebe5bae09fddd4181578f06eebdb3e37ed |     
 microblaze  |         alsa-lib-1.2.9         | NOK | http://autobuild.buildroot.net/results/d4d48c6c00cadd0896eefb03c74fc6a5e370dbce |     
microblazeel |         alsa-lib-1.2.9         | NOK | http://autobuild.buildroot.net/results/8328309e909f72e323f013a6392dd82b40002c39 |     
 microblaze  |         alsa-lib-1.2.9         | NOK | http://autobuild.buildroot.net/results/25ea1be9872a79c444a5b327c2fecf36d0fa30ef |     
microblazeel |       batman-adv-2022.3        | NOK | http://autobuild.buildroot.net/results/37ba2745bf1c72c388b3f3eca27e3004195457a6 |     
   arceb     |          boost-1.82.0          | NOK | http://autobuild.buildroot.net/results/84661d7cceeeb89490ba9c764c53e4d5f4a84d98 |     
    m68k     |          check-0.15.2          | NOK | http://autobuild.buildroot.net/results/16a601aaa4c414146c0b3c0f9d5675c2382da7c3 | ORPH
  riscv64    |          check-0.15.2          | NOK | http://autobuild.buildroot.net/results/a89b77c79095d78024b932903a5364e658cdfdeb | ORPH
   xtensa    |          check-0.15.2          | NOK | http://autobuild.buildroot.net/results/0b3eedbccf7e9854e480fffa811513de43492fa8 | ORPH
    m68k     |          check-0.15.2          | NOK | http://autobuild.buildroot.net/results/441feaf1ede3765650bf33666d6031ca89b10931 | ORPH
    arm      |          check-0.15.2          | NOK | http://autobuild.buildroot.net/results/08930bc2ea4d7945f596b912d46420df7bb5c841 | ORPH
    arc      |      dfu-programmer-1.0.0      | NOK | http://autobuild.buildroot.net/results/54581d55af7918c2d19ab09ad70d6eeb8dbb1650 |     
   sparc     |      dfu-programmer-1.0.0      | NOK | http://autobuild.buildroot.net/results/d7af13f1ddacf42fce3ba55947d025d4207398b1 |     
  riscv64    |        dropbear-2022.83        | NOK | http://autobuild.buildroot.net/results/437eb7f15edcafa61540a6962ea5dfe1a14c3d80 |     
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/a913de86cb950cf1bb86ad4fb3d807ac2e186a97 | ORPH
   armeb     |          ffmpeg-4.4.4          | NOK | http://autobuild.buildroot.net/results/26ded743cbdfce5bdbc0bb75166f344554d5220c |     
   x86_64    |           file-5.43            | NOK | http://autobuild.buildroot.net/results/f9e62f866cfd1d9e4f8e3476ff1cbb10e3d1c842 | ORPH
    or1k     |          flann-1.9.2           | NOK | http://autobuild.buildroot.net/results/4c9e5ffe2c061d813448ebec74d30df9213483ec |     
  riscv64    |       fontconfig-2.14.2        | NOK | http://autobuild.buildroot.net/results/19df201dbb78719cdd041a2d5617c3250c05fbd2 | ORPH
 powerpc64   | fs/ubi/ubi.mk:51: /home/aut... | NOK | http://autobuild.buildroot.net/results/fbf0324cac6f09fbe106295c3b5667317e0f12b2 |     
   s390x     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/00558e0ddbd6eb3cbafd70ca189e859402f1e478 |     
microblazeel | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/503f43ce9eb6a54c8814e160b601d0bb0306b4dd |     
   armeb     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/d093b3b41d25f455208c413765dbd3896410d2d4 |     
 powerpc64   | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/115ae7a18b5c86dfa3058726baa18f6f78a8189f |     
   mips64    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/5990ad1eb4153f8b5ba0078df41964ca3401c2f1 |     
   arceb     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/89c625cb22935a5124cf5945f6f82f001ef36e71 |     
  powerpc    | glibc-2.37-2-g9f8513dc64119... | NOK | http://autobuild.buildroot.net/results/c47a117405f4d1bc180d438f43f05a894bec01a9 |     
  powerpc    | glibc-2.37-2-g9f8513dc64119... | NOK | http://autobuild.buildroot.net/results/a12bc266f2f52d92927ddecfed26f8c2aec38b4a |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/ae42aded280c84050fb5b433fae069ded2d76602 |     
   s390x     |  gobject-introspection-1.74.0  | NOK | http://autobuild.buildroot.net/results/eec3baff7c35b210d3dc08fa8866ece02e11c04d | ORPH
 powerpc64   |  gobject-introspection-1.74.0  | NOK | http://autobuild.buildroot.net/results/70fce8c191affed47f9f735c166cddf6692837d9 | ORPH
 powerpc64   |  gobject-introspection-1.74.0  | NOK | http://autobuild.buildroot.net/results/757b2435bb110ca0d6cab055a398c5767d969295 | ORPH
  sparc64    |          gupnp-1.4.3           | NOK | http://autobuild.buildroot.net/results/41dbcaa816614478358f0f099ad24b18ddd75edb |     
   mipsel    |          gupnp-1.4.3           | NOK | http://autobuild.buildroot.net/results/b198dac290a188461025bcc14a5a5acb562f1405 |     
   mips64    |          gupnp-1.4.3           | NOK | http://autobuild.buildroot.net/results/68e392807fa4dd08f7a0b9ec40e7ed1aadcc6c03 |     
powerpc64le  |          gupnp-1.4.3           | NOK | http://autobuild.buildroot.net/results/a85b24a9f322b597e20aec4ad8a0d207a03ea6cf |     
  powerpc    |          gupnp-1.4.3           | NOK | http://autobuild.buildroot.net/results/68374c8ade70855bb6ec79211fb450da3a2340b2 |     
powerpc64le  |          gupnp-1.4.3           | NOK | http://autobuild.buildroot.net/results/dd3f6005db98004dcc2f4da7aa5c2ef93a30bf5e |     
    or1k     |          gupnp-1.4.3           | NOK | http://autobuild.buildroot.net/results/86d7668aae498ffe8a9a3cdc1e0b6c805af4b82b |     
   sh4eb     |          gupnp-1.4.3           | NOK | http://autobuild.buildroot.net/results/2c8dc3660dff9ec785409e81f4a2d635728bca94 |     
    i686     |          gupnp-1.4.3           | NOK | http://autobuild.buildroot.net/results/245ec0e45e86b3e71c2d17dbf0dc922d5bf29658 |     
    i686     |          gupnp-1.4.3           | NOK | http://autobuild.buildroot.net/results/abac2a4999ed7c440662061a275375126baa8fb4 |     
   nios2     |          gupnp-1.4.3           | NOK | http://autobuild.buildroot.net/results/949ddbc0a360d027bb27d839feb30fc25c1d1a50 |     
   x86_64    |          gupnp-1.4.3           | NOK | http://autobuild.buildroot.net/results/3a82435c0d73be44044150112eccd1a89d3cf6bd |     
    mips     |          gupnp-1.4.3           | NOK | http://autobuild.buildroot.net/results/e71e44c671e41446656238e24ef44628e9aae306 |     
   x86_64    |          gupnp-1.4.3           | NOK | http://autobuild.buildroot.net/results/0cb47f420b78711f53439e8aed190e1288a7d70e |     
    mips     |          gupnp-1.4.3           | NOK | http://autobuild.buildroot.net/results/b9a426f13181c6a404ba845f0e03086ca2a890bc |     
    arm      |         heirloom-mailx         | TIM | http://autobuild.buildroot.net/results/f9d49c16c4a3a916bc1d682e71d31535df60f546 |     
   nios2     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/cedc52dff49924f10a5c403aaaa458cecd3449d3 |     
  mips64el   |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/90d30c735681a1d115e020cff1da78c9bea51307 |     
   mips64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/756a0ae62b1bdfd4e4c93a927a86b2e56d2e001d |     
   s390x     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/343337e3e6249c4ed9c792091987ebeac727976d |     
    arm      |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/1cf4dde06aef388267400357a53536e10b59b790 |     
    arc      |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/64abfb53947149b76759b649660976dbfef256c0 |     
   armeb     |       host-ccache-4.8.2        | NOK | http://autobuild.buildroot.net/results/25da46d594a9c2aabd17cb3473f742d063157026 | ORPH
    mips     |       host-ccache-4.8.2        | NOK | http://autobuild.buildroot.net/results/364be2c12f89176e4b4ebd888a221422fea42c53 | ORPH
   x86_64    |       host-ccache-4.8.2        | NOK | http://autobuild.buildroot.net/results/d857e167121fa87d02e29ae258f68ad619f2a6eb | ORPH
   mipsel    |       host-ccache-4.8.2        | NOK | http://autobuild.buildroot.net/results/fd46fc4bbba01f7c04160574229e333ad3d4d9c4 | ORPH
    arm      |       host-ccache-4.8.2        | NOK | http://autobuild.buildroot.net/results/0a30479e84c9a88363cbeb2d40f23587f818d457 | ORPH
    arm      |     host-gcc-final-11.4.0      | NOK | http://autobuild.buildroot.net/results/5e15820c5db8c4c48c1de62a0c77171aeee381ba |     
   arceb     | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/3fe2ac4a50e7a0044e01d1f686ef2f92a88ebf8f | ORPH
   mips64    |        host-go-1.19.10         | NOK | http://autobuild.buildroot.net/results/e1d4809a5493993fa0e60480d567f89fbc5fee6b |     
    i686     |        host-go-1.19.10         | NOK | http://autobuild.buildroot.net/results/9ac5dcde859e154cb68112cf86ee3dd088ad7ad8 |     
 microblaze  |        host-go-1.19.10         | NOK | http://autobuild.buildroot.net/results/582a71c3fd94ee4bec610519631d799c7b07662d |     
  mips64el   |        host-go-1.19.10         | NOK | http://autobuild.buildroot.net/results/151b9a64f3b505b16b8f16ef7e04842728e2fce8 |     
   x86_64    |        host-rust-1.70.0        | NOK | http://autobuild.buildroot.net/results/79631c7dc27883fa5107b67507dda449ede9af50 |     
  sparc64    |        host-rust-1.70.0        | NOK | http://autobuild.buildroot.net/results/77816566969d3c1fabc033d588985d44dbceae35 |     
  sparc64    |        host-rust-1.70.0        | NOK | http://autobuild.buildroot.net/results/acc76553c190e270355246756bffcf1c961e0614 |     
    sh4a     |          kexec-2.0.26          | NOK | http://autobuild.buildroot.net/results/4499942950cb095cda4df19c90bad42a946e6791 |     
    i686     | kvmtool-f77d646ba01d04be5aa... | NOK | http://autobuild.buildroot.net/results/5e697fbc8881a40a27a3f959a1dfd1d021306cbf | ORPH
   mips64    |    libabseil-cpp-20220623.1    | NOK | http://autobuild.buildroot.net/results/cc6226e53eab603bab6209a4746ae9df2ba35997 |     
   arceb     |      libedit-20221030-3.1      | NOK | http://autobuild.buildroot.net/results/b5f20d0f18925c996bb9475f8e0e692b925aee41 |     
   arceb     |      libedit-20221030-3.1      | NOK | http://autobuild.buildroot.net/results/f6dd3f09ad1b40653a9f514aeb835f66814d2491 |     
   arceb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/7a5ec766349474144f73877877b173617fb40853 |     
   arceb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/5f63038113774c392e42987d602d803cdd6e3485 |     
   arceb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/6fcbce67f1827bb15db30550c04e9762120bf4d4 |     
   mipsel    |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/cc64d241cb6a83901eadf11f27faef70a157f237 | ORPH
    mips     |          linux-6.3.9           | NOK | http://autobuild.buildroot.net/results/86cfd3609aec4c3cc973d9debce4f7d1c3196970 | ORPH
microblazeel |          linux-6.3.9           | NOK | http://autobuild.buildroot.net/results/f066288e6ee2deb0032ca44b8093321f3c5f9ed2 | ORPH
   sh4aeb    |          linux-6.3.9           | NOK | http://autobuild.buildroot.net/results/127510f91b1922b7705cae3ead475159785f5203 | ORPH
powerpc64le  |          linux-6.3.9           | NOK | http://autobuild.buildroot.net/results/b433f715d168f50dba93ffb02de48421febae2e0 | ORPH
   mips64    |          linux-6.3.9           | NOK | http://autobuild.buildroot.net/results/c8e2d16fc6de1316872065261a3a3524dd35bdaf | ORPH
  mips64el   |          linux-6.3.9           | NOK | http://autobuild.buildroot.net/results/a60e83a1b0814861f6419798a4aed7a467bd875a | ORPH
   armeb     |          linux-6.3.9           | NOK | http://autobuild.buildroot.net/results/f5d482f386f3e16daa4785a31ed6ce90ab8ac403 | ORPH
    mips     |          linux-6.3.9           | NOK | http://autobuild.buildroot.net/results/d20301dfc3fd18b1b91c47866ad6766b09c59ae2 | ORPH
powerpc64le  |       linux-fusion-9.0.3       | NOK | http://autobuild.buildroot.net/results/39eb3aa17fe4c42f685a9da792a71cefd56e7f37 | ORPH
   armeb     |     ltp-testsuite-20230127     | NOK | http://autobuild.buildroot.net/results/be2a9dd9823d9b37cd4a1d6c91137f27a939fc5e |     
   s390x     |      lttng-modules-2.13.7      | NOK | http://autobuild.buildroot.net/results/10ace471afeb51e92be3d31d94e98f4e652e8ee1 |     
  mips64el   |           lxc-5.0.2            | NOK | http://autobuild.buildroot.net/results/b9a0766267711ae69c3d3aaa0860e55e3e97c950 |     
 powerpc64   |           lxc-5.0.2            | NOK | http://autobuild.buildroot.net/results/205664d5f519af6b10a74d88e63c6bda3b7b14cb |     
   sparc     |        mariadb-10.3.36         | NOK | http://autobuild.buildroot.net/results/724338e40b815aa535fc286928c0724bcca0cf7d | ORPH
    i686     |         nodejs-16.20.0         | NOK | http://autobuild.buildroot.net/results/77e5f53b682297be36dabbc8a15e09d06b0c3aae |     
 aarch64_be  |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/ed34a5bbea7180ba56005186aa40b1b12ad117e3 | ORPH
   nios2     |        open62541-v1.3.4        | NOK | http://autobuild.buildroot.net/results/1e8b28c8a957b7cfce49a88109a92f3852234cc9 | ORPH
   mipsel    |        open62541-v1.3.4        | NOK | http://autobuild.buildroot.net/results/3e6d0fb60f9d47f0c541e4a171a0cc6ee1fa642a | ORPH
 powerpc64   |        open62541-v1.3.4        | NOK | http://autobuild.buildroot.net/results/7a8ebefd0051c840306d2b2bca962c83f0c0b1ef | ORPH
    arm      |         opencv3-3.4.19         | NOK | http://autobuild.buildroot.net/results/077debdc9b93c8d4777d39dd69c33000f10672b9 |     
  powerpc    |         opensc-0.23.0          | NOK | http://autobuild.buildroot.net/results/22bf0955a9a9387edb3c84ecf48d5eefbc943ec0 | ORPH
   sparc     |         opensc-0.23.0          | NOK | http://autobuild.buildroot.net/results/41cff0f1c1fa119fa7e242df603740c3000fb6f0 | ORPH
    sh4a     |           php-8.2.7            | NOK | http://autobuild.buildroot.net/results/bb37a725ce0e2fe1a9dc9257174e34cb1aaba49e |     
   armeb     |           pv-1.6.20            | NOK | http://autobuild.buildroot.net/results/e0fd6b2404bae5bb500eea62c296cd260709c488 | ORPH
   armeb     |           pv-1.6.20            | NOK | http://autobuild.buildroot.net/results/1d6e0854eff39ef542d39b00b5703432d93e532c | ORPH
   x86_64    |    python-setuptools-68.0.0    | NOK | http://autobuild.buildroot.net/results/6ac112e8bb8bed31e55366e65fc4d5e26e26f1bb |     
    mips     |    python-setuptools-68.0.0    | NOK | http://autobuild.buildroot.net/results/6140811373ba0c35d21adab99049afb3dfe92780 |     
   x86_64    |         python3-3.11.4         | NOK | http://autobuild.buildroot.net/results/fb48ae8a6152004e0158330d7303d1209907ca25 |     
   x86_64    |         python3-3.11.4         | NOK | http://autobuild.buildroot.net/results/632786745ff66ba401fcc0cdc95867fee9f1c36f |     
  sparc64    |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/a1d7ff5f939f81f7ddd515b20913cb09abe5757f |     
   s390x     |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/00eb2c51cfd1bf21240e63e09ae2ff3b6762c849 |     
 powerpc64   |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/5e0be8a25e21f0defe7324cc2b23d9d63c9622a6 |     
    m68k     | sconeserver-8d1935919a20133... | NOK | http://autobuild.buildroot.net/results/88fa71c9f845300d3109f03ee3d04e661ad5e413 |     
   sh4eb     |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/029052bdcc65b405054755931f959cf9e492f003 | ORPH
   armeb     |        sdl2_mixer-2.6.3        | NOK | http://autobuild.buildroot.net/results/fbeb006b8ef2ec3d874573621477310a4dba3f45 | ORPH
   s390x     |           strace-6.3           | NOK | http://autobuild.buildroot.net/results/fb277e24dbdcf221377747ad631f201970b90d77 |     
 microblaze  |           strace-6.3           | NOK | http://autobuild.buildroot.net/results/0508de2d14a92caa0302881f45288aee98eb26c1 |     
 powerpc64   |           strace-6.3           | NOK | http://autobuild.buildroot.net/results/c2c719faaec9bb826eb58b0fc3c8dd6a4df1ddd3 |     
   x86_64    |           strace-6.3           | NOK | http://autobuild.buildroot.net/results/dbe03734b45871280072ec23da042847e24a60e2 |     
    mips     |           strace-6.3           | NOK | http://autobuild.buildroot.net/results/f616f81c6dc95fd4889ff5dea3084f5a22351ccb |     
 aarch64_be  |           strace-6.3           | NOK | http://autobuild.buildroot.net/results/e85051f1c96b0708ae1c4b686beafa7ea3990b2f |     
    m68k     |           strace-6.3           | NOK | http://autobuild.buildroot.net/results/b9a630b4dc21ef7ddd403e8814af30ce82f0dab3 |     
powerpc64le  |           strace-6.3           | NOK | http://autobuild.buildroot.net/results/ab86cbf6aae8b45a5ee0078679a01fc792e2cc21 |     
 powerpc64   |        syslog-ng-4.1.1         | NOK | http://autobuild.buildroot.net/results/d5faa4c2bf08ef054facb37f79f9e1d3db18ace1 |     
powerpc64le  |          trinity-1.9           | NOK | http://autobuild.buildroot.net/results/cdb86ea44dc672802f9d4d6a0f4bd5e063f467c3 | ORPH
  sparc64    |            unknown             | NOK | http://autobuild.buildroot.net/results/534f6b3f443e91f2c8498daa7a3a1d7cc565e9d7 |     
  powerpc    |        valgrind-3.20.0         | NOK | http://autobuild.buildroot.net/results/0f601d3e7d88320435d0f91199518ca98f22cffe | ORPH
powerpc64le  |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/b338e57b40fc1b623f42365837a74a02a9cc8d58 |     
  sparc64    |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/1c38e74bee3f9cf4646aad3d2e302cbf136a503d |     


Classification of failures by reason for 2023.02.x
--------------------------------------------------

fs/ubifs/ubifs.mk:49: /home... | 2 
               host-runc-1.1.7 | 1 
        liblog4c-localtime-1.0 | 1 
          linux-5.10.162-cip24 | 1 
     linux-5.10.162-cip24-rt10 | 1 
                   perl-5.36.0 | 1 
               valgrind-3.19.0 | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/60ae2b589e96b5bae0138614f5e6bbb2a3a090ad |     
   nios2     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/52260d098d81466d6457e9158420bace3747b15d |     
   arceb     |        host-runc-1.1.7         | NOK | http://autobuild.buildroot.net/results/285a09ac6ef22430377a22ccb628a75495126c48 |     
  riscv64    |     liblog4c-localtime-1.0     | NOK | http://autobuild.buildroot.net/results/0a590956f7b5ecbd7f9b22355de79ad2db528c7b |     
   mipsel    |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/2df098b37a93081015c2b989eaff6abf6a9facda | ORPH
    or1k     |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/7e90da12c5f494e8182fcf4288166f7697c35442 | ORPH
    arc      |          perl-5.36.0           | NOK | http://autobuild.buildroot.net/results/882e84e0ec62682a69f34e81aa29f2c21b200be9 |     
  powerpc    |        valgrind-3.19.0         | NOK | http://autobuild.buildroot.net/results/7ef4808b9571608bd232d12383af1b52cc65c6a1 | ORPH


Gitlab CI results for 2023-06-30
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
                   at91sam9g20dfc | https://gitlab.com/buildroot.org/buildroot/-/jobs/4563508437  |      
       atmel_sama5d3_xplained_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/4563508502  |      
                       beaglebone | https://gitlab.com/buildroot.org/buildroot/-/jobs/4563508545  |      
                   beaglebone_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4563508548  |      
           freescale_imx6qsabresd | https://gitlab.com/buildroot.org/buildroot/-/jobs/4563508598  |      
                 grinn_chiliboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/4563508635  |      
                 hifive_unleashed | https://gitlab.com/buildroot.org/buildroot/-/jobs/4563508637  |      
                      nitrogen6sx | https://gitlab.com/buildroot.org/buildroot/-/jobs/4563508702  |      
                       nitrogen6x | https://gitlab.com/buildroot.org/buildroot/-/jobs/4563508703  |      
                        nitrogen7 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4563508704  |      
                       nitrogen8m | https://gitlab.com/buildroot.org/buildroot/-/jobs/4563508705  |      
                      nitrogen8mm | https://gitlab.com/buildroot.org/buildroot/-/jobs/4563508706  |      
                      nitrogen8mn | https://gitlab.com/buildroot.org/buildroot/-/jobs/4563508707  |      
                      nitrogen8mp | https://gitlab.com/buildroot.org/buildroot/-/jobs/4563508708  |      
             olimex_a64_olinuxino | https://gitlab.com/buildroot.org/buildroot/-/jobs/4563508719  |      
                orangepi_one_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/4563508730  |      
                      orangepi_r1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4563508733  |      
                   pc_x86_64_bios | https://gitlab.com/buildroot.org/buildroot/-/jobs/4563508738  |      
                    pc_x86_64_efi | https://gitlab.com/buildroot.org/buildroot/-/jobs/4563508739  |      
                  qemu_ppc_e500mc | https://gitlab.com/buildroot.org/buildroot/-/jobs/4563508771  |      
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/4563508799  | ORPH 
               snps_arc700_axs101 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4563508831  |      
                socrates_cyclone5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4563508835  |      



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
