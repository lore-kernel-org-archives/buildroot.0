Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE497C77B75
	for <buildroot@archiver.kernel.org>; Tue, 18 Apr 2023 05:38:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5653E6059E;
	Tue, 18 Apr 2023 05:38:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5653E6059E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WZZNTUlrIh70; Tue, 18 Apr 2023 05:38:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A1A7960F7E;
	Tue, 18 Apr 2023 05:38:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A1A7960F7E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 35F321BF368
 for <buildroot@lists.busybox.net>; Tue, 18 Apr 2023 05:38:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0706181EAD
 for <buildroot@lists.busybox.net>; Tue, 18 Apr 2023 05:38:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0706181EAD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ce4PBLv7a-IV for <buildroot@lists.busybox.net>;
 Tue, 18 Apr 2023 05:38:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6AD2C81E0C
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6AD2C81E0C
 for <buildroot@buildroot.org>; Tue, 18 Apr 2023 05:38:46 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 783FF1BF208
 for <buildroot@buildroot.org>; Tue, 18 Apr 2023 05:38:43 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Tue, 18 Apr 2023 05:38:43 -0000
Message-Id: <20230418053849.0706181EAD@smtp1.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1681796323; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=GbPHYMIkKh7udN0JoMwAMCCG6ium+eE9f4OBC+tOzhw=;
 b=EOvlA3xzzM2gsJunE3Vz3A+rYmo1N/RHLPQtAiKD7HpfxTXVGjvb/r/1CBMKu2ZAqAz08r
 oe9V0QsH0RLhDRVdh86k5sAhlzO4SiOwSs8VzQprk2CaTOfupN+9tAj7en34zmvs+L6Yxx
 QWyznXYOKhqjgIKfRP7Jr9xltCMBh7mbm7v2U0u+qyHsbGaOAYBpoD4lfQHMRJ2Zw/mrHu
 C5+YJhQ8UbD1AL5gK8UzuwRX3SYXPZf6704BVI2oWTIHsLSdztxloWEdifTk/dfDyTR1e/
 qTdl43hRfPefh4Oji5r4qJ7/FjzRKzNscQ87SnHIphqazv6pMk1Nq7lR2Ez+Qw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=EOvlA3xz
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-04-17
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

Autobuild statistics for 2023-04-17
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  | 20  | 17  |  0  | 37  |
    master   | 159 | 126 |  0  | 285 |

Classification of failures by reason for master
-----------------------------------------------

                  linux-6.1.14 | 11
            host-binutils-2.38 | 10
  gobject-introspection-1.72.0 | 8 
         host-gcc-final-10.4.0 | 7 
ulog-0389d243352255f6182326... | 4 
glibc-2.37-2-g9f8513dc64119... | 3 
         host-gcc-final-11.3.0 | 3 
                host-go-1.19.8 | 3 
               host-qemu-7.2.0 | 3 
               libglib2-2.72.3 | 3 
                     php-8.2.3 | 3 
                 agentpp-4.6.0 | 2 
                busybox-1.36.0 | 2 
fs/ubifs/ubifs.mk:49: /home... | 2 
              libgcrypt-1.10.1 | 2 
                    olsr-0.9.8 | 2 
                   perl-5.36.0 | 2 
                    sdl-1.2.15 | 2 
                xenomai-3.0.10 | 2 
                alsa-lib-1.2.8 | 1 
            altera-stapl-0.3.3 | 1 
                  assimp-5.2.5 | 1 
                    attr-2.5.1 | 1 
                    bat-0.19.0 | 1 
                  boost-1.80.0 | 1 
                 coreutils-9.2 | 1 
                 dc3dd-7.2.641 | 1 
                elfutils-0.186 | 1 
                 fdk-aac-2.0.2 | 1 
             flatbuffers-2.0.8 | 1 
             fontconfig-2.13.1 | 1 
       freeradius-client-1.1.7 | 1 
fs/axfs/axfs.mk:32: /home/t... | 1 
fs/cramfs/cramfs.mk:46: /ho... | 1 
fs/cramfs/cramfs.mk:46: /tm... | 1 
fs/romfs/romfs.mk:32: /home... | 1 
fs/ubi/ubi.mk:51: /tmp/inst... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
                    gdal-3.5.2 | 1 
                glorytun-0.3.4 | 1 
                     gmp-6.2.1 | 1 
                gnu-efi-3.0.15 | 1 
                haveged-1.9.18 | 1 
            host-binutils-2.37 | 1 
            host-binutils-2.39 | 1 
       host-gcc-initial-12.2.0 | 1 
host-gdb-arc-2020.09-releas... | 1 
              host-rust-1.68.2 | 1 
                jemalloc-5.3.0 | 1 
kvmtool-f77d646ba01d04be5aa... | 1 
               libdeflate-1.15 | 1 
                libxml2-2.10.3 | 1 
          linux-5.10.162-cip24 | 1 
     linux-5.10.162-cip24-rt10 | 1 
        ltp-testsuite-20230127 | 1 
          lttng-modules-2.13.7 | 1 
            luaossl-20220711-0 | 1 
               mariadb-10.3.36 | 1 
                  ntpsec-1.2.2 | 1 
                 openssh-9.3p1 | 1 
                    putty-0.76 | 1 
    python-cryptography-39.0.1 | 1 
            quickjs-2021-03-27 | 1 
              traceroute-2.1.0 | 1 
                 uclibc-1.0.43 | 1 
uclibc-ng-test-6790eafe897b... | 1 
                     zfs-2.1.7 | 1 
               zxing-cpp-1.4.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |         agentpp-4.6.0          | NOK | http://autobuild.buildroot.net/results/0c3a4b48ed81a858aeef0f50dbe05694d91df0e1 |     
    mips     |         agentpp-4.6.0          | NOK | http://autobuild.buildroot.net/results/5452ee1e08ec25d9c473d5a35515aa515d79faf1 |     
    or1k     |         alsa-lib-1.2.8         | NOK | http://autobuild.buildroot.net/results/7ac78a0ae4e0f00376ce7c0d2bef9c519c48657f |     
    arm      |       altera-stapl-0.3.3       | NOK | http://autobuild.buildroot.net/results/feda71f984bbac1de38b449301e9b2f7b7bf0b23 |     
  mips64el   |          assimp-5.2.5          | NOK | http://autobuild.buildroot.net/results/88055bf625970b03a995dff18f2725e99f572efc | ORPH
  mips64el   |           attr-2.5.1           | NOK | http://autobuild.buildroot.net/results/be5b56e2cd38023e6f1947aaccba127dd8b56353 |     
   mipsel    |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/93b6a562776f86f601f8912e3027f791a340d025 |     
   arceb     |          boost-1.80.0          | NOK | http://autobuild.buildroot.net/results/537b278c8929acff8a2e13b1f7efa1c4277705f1 |     
   mipsel    |         busybox-1.36.0         | NOK | http://autobuild.buildroot.net/results/44a0476b86c579e6aa658f156f0292958d40513c | ORPH
   mips64    |         busybox-1.36.0         | NOK | http://autobuild.buildroot.net/results/ed028160db397581558fd8c96755621dd8298bb1 | ORPH
    sh4      |         coreutils-9.2          | NOK | http://autobuild.buildroot.net/results/4dbb8f09411e08dfc543b70e95b0f09821822337 | ORPH
    or1k     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/071ab0307de5e435c7239ec4a7b18f3cc9e19da9 | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/f14067c97e5729dd6d19118b569045f7524f6ac2 | ORPH
   x86_64    |         fdk-aac-2.0.2          | NOK | http://autobuild.buildroot.net/results/398453b6cedf94e90873478ef89e7e133d6751be |     
powerpc64le  |       flatbuffers-2.0.8        | NOK | http://autobuild.buildroot.net/results/3f99d206c37262e795fb74634caff1049d720f94 |     
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/f8e02cad399d0e9157739307a2a2a5b62c91795a | ORPH
  riscv64    |    freeradius-client-1.1.7     | NOK | http://autobuild.buildroot.net/results/715aa263600b19b5c128a2f5c0e701205a3d84d2 |     
   x86_64    | fs/axfs/axfs.mk:32: /home/t... | NOK | http://autobuild.buildroot.net/results/09c7d7d22d36b2d49f3ec8300ac8961a61c6e7ed |     
  aarch64    | fs/cramfs/cramfs.mk:46: /ho... | NOK | http://autobuild.buildroot.net/results/4aa22b00fa9c3858ad9ddd5d9e6a9892d0d14ae0 |     
powerpc64le  | fs/cramfs/cramfs.mk:46: /tm... | NOK | http://autobuild.buildroot.net/results/31614d6ba4a547fe7905e8ffc887bd042e1f6925 |     
 aarch64_be  | fs/romfs/romfs.mk:32: /home... | NOK | http://autobuild.buildroot.net/results/13e37bcf928851cfd037c3a5a2a2f69420222387 |     
    mips     | fs/ubi/ubi.mk:51: /tmp/inst... | NOK | http://autobuild.buildroot.net/results/e90854e9936d6aeb4450df26b175c101444af610 |     
 microblaze  | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/33e8d7414f0fc7f77581842b91d1d9ae3af0b3ab |     
  aarch64    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/32e2e7fc95d3d8c73620c0db98143d40d91835c5 |     
    i686     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/35477def81799ac94d37af1b69f92dd028eb0839 |     
   nios2     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/c07c117e729a160ec1b5c992b8ac8a5f6ce2a451 |     
   x86_64    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/ccfb12d3a6f570ec3c8025b6a239c73e5f162681 |     
   sparc     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/88ef3e4697fb1762917ed52721f9d5d16562bfb8 |     
  mips64el   |           gdal-3.5.2           | NOK | http://autobuild.buildroot.net/results/90f7d5a7854553b32a8a39288fd316d61376be7f |     
   arceb     | glibc-2.37-2-g9f8513dc64119... | NOK | http://autobuild.buildroot.net/results/3807d6947f5f488df15fe206513c3f6f2b8e1515 |     
 powerpc64   | glibc-2.37-2-g9f8513dc64119... | NOK | http://autobuild.buildroot.net/results/ba8c3ca8816c9b27b53a3e64ac4951dbafbc4f1b |     
  powerpc    | glibc-2.37-2-g9f8513dc64119... | NOK | http://autobuild.buildroot.net/results/4f5530a395b306b1adeb67dbc722a54b5fbf6c54 |     
 aarch64_be  |         glorytun-0.3.4         | NOK | http://autobuild.buildroot.net/results/6ed1c4ea63f1141cb84d2f93a0fe398cb2fb5282 |     
  riscv64    |           gmp-6.2.1            | NOK | http://autobuild.buildroot.net/results/d03784c1a15571378cb0894ab34d18ba71989d6b | ORPH
  mips64el   |         gnu-efi-3.0.15         | NOK | http://autobuild.buildroot.net/results/b2e00818c04494ad03bb647562c375ca28754492 |     
   s390x     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/f03a4616f545fa696a017e34d653ae86561ae700 | ORPH
   s390x     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/965bef7ecbaf82457e358a80aa11bf7944a3f930 | ORPH
    mips     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/98ffe653836a7a400a6136f553469626064756a4 | ORPH
   nios2     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/03cf7d23a6a3d55fe3fd3cc7b1f3f96d4ea9dd54 | ORPH
 microblaze  |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/681a7c07b4c4eb4f0b8370c0d3f0e7af0519fe68 | ORPH
  powerpc    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/4d9bdb11a478878f9e82bc932a2bc9e44ab4bdfe | ORPH
powerpc64le  |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/78701ec33455c47f65464b465207f86d69fc35ed | ORPH
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/294f1c1459a94338137b22a6335d5410a528ed48 | ORPH
    arc      |         haveged-1.9.18         | NOK | http://autobuild.buildroot.net/results/e22015952cecca7dab36cec777f91fe7c6770705 |     
microblazeel |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/06189af88ffafa35e728dc00c710a8b17782b440 |     
    or1k     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/215170d9bacc2dea8a2935a15498d5bb93215b8d |     
microblazeel |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/be4f9910ee251f523cdb5596ab62dbf97a578eab |     
  sparc64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/fc412eea813dec0ac4109b22392bd89824d5ea28 |     
 powerpc64   |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/ca77ed9ee7bfadfc56f4aa14a0372fe453e98bc0 |     
  sparc64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/a1fd2815e9aed36138d9ee9db40295b5bf39ea0f |     
   nios2     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/68d55677dded3d7cf2d29d1b2ab590a229fccffb |     
   sparc     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/c1c3c9c719bc2f6b575a039856dfa8d279c0afbf |     
   nios2     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/0c78ff88dd791f2eef8187f23e979cb291105136 |     
   x86_64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/b77171e9f5142b149c19ff79d0f39363a1eb73d8 |     
    arm      |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/0c943c10554d6195005875a35a8e4667aa9e3a19 |     
    or1k     |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/1fc96b0bb07cadc96712fdba588f4cfc4d010323 |     
   sparc     |     host-gcc-final-10.4.0      | NOK | http://autobuild.buildroot.net/results/ed744be0cc2567229bf3dfbcca869aaf27ff028f |     
   sparc     |     host-gcc-final-10.4.0      | NOK | http://autobuild.buildroot.net/results/a4677862b1dd95635901aed45b17b0b6a23432c3 |     
   sparc     |     host-gcc-final-10.4.0      | NOK | http://autobuild.buildroot.net/results/5ae74a6cf2a6674769693de1a1bb56023f88c82a |     
   sparc     |     host-gcc-final-10.4.0      | NOK | http://autobuild.buildroot.net/results/1e4a5dc30e54b426ea3c564be4ee113cab7c5d3f |     
   sparc     |     host-gcc-final-10.4.0      | NOK | http://autobuild.buildroot.net/results/bc93ee25f91dd3f9237441ae1e9d29785f191eb7 |     
   sparc     |     host-gcc-final-10.4.0      | NOK | http://autobuild.buildroot.net/results/6ed1946644da6542caf08b7c6c6e2afbfec4c71f |     
   sparc     |     host-gcc-final-10.4.0      | NOK | http://autobuild.buildroot.net/results/292d9e87dc3d21084f6a5384378ce14c5fc6a01f |     
   sh4eb     |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/e3a81aa86bfdb07c01b64da9ad2a03db150b12a9 |     
   x86_64    |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/6e3a512023c8f0a4cb7cfc34c1c58e2a4cc3c585 |     
microblazeel |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/a114e47d65d837443b5a9c6ee734cb5ba482ed6e |     
    arc      |    host-gcc-initial-12.2.0     | NOK | http://autobuild.buildroot.net/results/0c18e1ad9eaf8e5942e651d1d05c3d1b71fa87f9 |     
   arceb     | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/92decedbb7ff75147f75229a9e8d94e009c4d247 | ORPH
  aarch64    |         host-go-1.19.8         | NOK | http://autobuild.buildroot.net/results/845eec3cda3607208b70e557ad789ef29006fac5 |     
   mips64    |         host-go-1.19.8         | NOK | http://autobuild.buildroot.net/results/22cb62a676a3f94f3e2502c6f61119a60f7b1a81 |     
   mips64    |         host-go-1.19.8         | NOK | http://autobuild.buildroot.net/results/4effc070c892ffeba62cf1e198c3ffc150ac0526 |     
   nios2     |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/89ae79cd3d3774b1d2cef5b91c5f0b841f376d51 |     
   s390x     |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/37737621cc3f0020ded9ff3c7815290d3a0c2597 |     
  riscv32    |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/46218aea0ce9cddc9432fdc43ca06ca9e8ee1149 |     
    arm      |        host-rust-1.68.2        | NOK | http://autobuild.buildroot.net/results/a5b17d848bdda9e7c471aa8e65140c28ecf3e547 |     
   sh4aeb    |         jemalloc-5.3.0         | NOK | http://autobuild.buildroot.net/results/30e61b2650020027e5aba28debb9dfaa0aad2fc7 |     
    i686     | kvmtool-f77d646ba01d04be5aa... | NOK | http://autobuild.buildroot.net/results/8578e10a70b185506ac86d232603febd305eea1c | ORPH
   armeb     |        libdeflate-1.15         | NOK | http://autobuild.buildroot.net/results/b1a2b50f0337ebc35c5059d704aca81e640123a1 |     
    i586     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/671d18bb8d163c1a5ed19f8d935e3c4ad29593ae | ORPH
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/35f56fc5c219126b515d431c2bccd2bb27dfaefa | ORPH
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/9d24f6428cf8ea6e2e9dc30504add3bb74312c1f |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/a2c364db223150c4c7793d22eeb8c44143ec1d0c |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/d1e78dd61fdc51be2b22b6cdc56ae69b6a2eb123 |     
  mips64el   |         libxml2-2.10.3         | NOK | http://autobuild.buildroot.net/results/7bad1c65695b7700e4cd5662d6867f6ec1704553 |     
    m68k     |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/bcfa68dfff9ef620e47831d2facf7064c8ac0b6c | ORPH
    m68k     |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/2f0ceab18a6823368206ea299b8fe708252c3a37 | ORPH
   mipsel    |          linux-6.1.14          | NOK | http://autobuild.buildroot.net/results/bca8b6d008964522893a7d7ecfaa2259ca486930 | ORPH
  powerpc    |          linux-6.1.14          | NOK | http://autobuild.buildroot.net/results/130e472d8ae95e72297eeaf22bed2df6664c37f6 | ORPH
   nios2     |          linux-6.1.14          | NOK | http://autobuild.buildroot.net/results/141561ae5b5badc08d53981543aadbdfa6f8ba70 | ORPH
    mips     |          linux-6.1.14          | NOK | http://autobuild.buildroot.net/results/da31c20c3dc46cf09fddebde948dcfd194c096c2 | ORPH
    mips     |          linux-6.1.14          | NOK | http://autobuild.buildroot.net/results/ea1e6702674293f9f84f183c270af7fc598d06ca | ORPH
   armeb     |          linux-6.1.14          | NOK | http://autobuild.buildroot.net/results/46e7cccef175274199b6e2c15ef3493a21ca2d69 | ORPH
   arceb     |          linux-6.1.14          | NOK | http://autobuild.buildroot.net/results/6b4b0482b87b73a008e8950598cc18cf421d44aa | ORPH
    m68k     |          linux-6.1.14          | NOK | http://autobuild.buildroot.net/results/a94ac27197e06a99690ac4d04825711dc824af07 | ORPH
    sh4a     |          linux-6.1.14          | NOK | http://autobuild.buildroot.net/results/e10933dab701fca64e6175605ffaf902a9eee62b | ORPH
    sh4a     |          linux-6.1.14          | NOK | http://autobuild.buildroot.net/results/b5f6d6af5e57c993723e6aac223db08795824127 | ORPH
   nios2     |          linux-6.1.14          | NOK | http://autobuild.buildroot.net/results/837e32e97ea7b70f3c599b7ea20f6bc60386949e | ORPH
  powerpc    |     ltp-testsuite-20230127     | NOK | http://autobuild.buildroot.net/results/f67e0ef66dac92b16b20ab3f8c4fd2e38cc189e0 |     
    or1k     |      lttng-modules-2.13.7      | NOK | http://autobuild.buildroot.net/results/75bd4df154130a79677bbed9a749dc015d6550fa |     
  aarch64    |       luaossl-20220711-0       | NOK | http://autobuild.buildroot.net/results/dd1b019e61e576ee61ee591919a48067b43ca1a0 |     
   sparc     |        mariadb-10.3.36         | NOK | http://autobuild.buildroot.net/results/0fadc656999147652543624bcfb552d2b63e0b35 | ORPH
    m68k     |          ntpsec-1.2.2          | NOK | http://autobuild.buildroot.net/results/ee8e899210a9a07eaf0222d76378fb2c8640c678 | ORPH
    sh4      |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/09b49098389b9a9f23de3c056baf49af7bc810f0 | ORPH
 aarch64_be  |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/8eeaac237abb817d5850507696eb889538e67cf9 | ORPH
    m68k     |         openssh-9.3p1          | NOK | http://autobuild.buildroot.net/results/6ca1b19611d8106a247ea11a1d7c534c687945dd | ORPH
   xtensa    |          perl-5.36.0           | NOK | http://autobuild.buildroot.net/results/e66e3e82de288af16ae670c8e031efae6bb97e3d |     
    m68k     |          perl-5.36.0           | NOK | http://autobuild.buildroot.net/results/caa4fed1d581254c0de21cf0f5cc2577bf816ae7 |     
   armeb     |           php-8.2.3            | NOK | http://autobuild.buildroot.net/results/2c9393bc19f02cf3c1af79de2eb93fa7b0a5715c |     
   armeb     |           php-8.2.3            | NOK | http://autobuild.buildroot.net/results/ea67ca7751d9d7439e52c83c1acb91ca02a6bc4c |     
    arm      |           php-8.2.3            | NOK | http://autobuild.buildroot.net/results/49e77d6141068a56e1407d1b61480320e132a9ab |     
  aarch64    |           putty-0.76           | NOK | http://autobuild.buildroot.net/results/15f515cef261b699b675ae4df1218effe9d2c5e4 |     
   armeb     |   python-cryptography-39.0.1   | NOK | http://autobuild.buildroot.net/results/d626a119d57c9c3189d458845a0bb1aa7810e014 |     
   sh4eb     |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/945b508385ba5aa25f982f8a8493628fa828e472 |     
    sh4      |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/47b4bd6c3d3999c30bc097b517c95de32b806711 | ORPH
   sh4eb     |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/12ef918a6950e324b521339d31995d9d1c698df5 | ORPH
powerpc64le  |        traceroute-2.1.0        | NOK | http://autobuild.buildroot.net/results/56dc2dd7639e7c4baa776b59883956cbd7253c50 |     
   mipsel    |         uclibc-1.0.43          | NOK | http://autobuild.buildroot.net/results/59ebe5b1b2a27a4a8c529deeb19961d46bf448bb |     
   mips64    | uclibc-ng-test-6790eafe897b... | NOK | http://autobuild.buildroot.net/results/92163d6d1afcd896786f1d5668fe63b165e0e821 |     
   mipsel    | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/de18c5e46a32171a869ebdb5aa88c486fabc635c |     
    mips     | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/0bfad30be4fd3f2e651ba945856d6401d8f926a4 |     
microblazeel | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/f5057769593bba0f3342bb5e600e1c14f7d452d5 |     
   nios2     | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/0d0f4439bda8de58cc5527a64f3bdfc3a07d35d5 |     
    arm      |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/398bb509f501970f47d4fb1ec3f19f3b58d076c6 |     
   x86_64    |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/649b88a73e72e6de3c01ff86d01e0c3900f8c324 |     
  sparc64    |           zfs-2.1.7            | NOK | http://autobuild.buildroot.net/results/64cebd6438230a03b1d209a21422530f41c83798 |     
   nios2     |        zxing-cpp-1.4.0         | NOK | http://autobuild.buildroot.net/results/a2fd67575938c7ce9e54d7177e26931a37a6aaa9 |     


Classification of failures by reason for 2023.02.x
--------------------------------------------------

                elfutils-0.186 | 3 
                 agentpp-4.6.0 | 2 
             batman-adv-2022.3 | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
         host-gcc-final-11.3.0 | 1 
                host-go-1.19.8 | 1 
               host-qemu-7.2.0 | 1 
              libgcrypt-1.10.1 | 1 
          linux-5.10.162-cip24 | 1 
                  linux-6.1.14 | 1 
                mongodb-4.2.18 | 1 
rtl8189fs-ed6741b52bc998875... | 1 
                 uclibc-1.0.43 | 1 
                       unknown | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |         agentpp-4.6.0          | NOK | http://autobuild.buildroot.net/results/08afd4039146f0ba35c2ae14f7cb895449478ce4 |     
  sparc64    |         agentpp-4.6.0          | NOK | http://autobuild.buildroot.net/results/5efd37fa8d3b3a89c5dec4a216ab9feae83b282a |     
   mipsel    |       batman-adv-2022.3        | NOK | http://autobuild.buildroot.net/results/5218c7176b7d8692919444b5f5cce84269e156d7 |     
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/d59375bc844c674598a4caca35948fe92e2e1bda | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/6692e632713f60a1f157eca73507b8f245020b6d | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/82b1fd929adbfd44366abfd5d496c8040cff3980 | ORPH
   mipsel    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/4195e3a9ab497d3457886d15465c5ddeed142f3d |     
   mips64    |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/a51751c7033c4db5a14f1c50f33b77202e95bf60 |     
   mips64    |         host-go-1.19.8         | NOK | http://autobuild.buildroot.net/results/4d47dcb1b0ff91a8ad10ecd752ab949b2c17c76d |     
  aarch64    |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/aeb1c61e2a0e94dc9eed6ed25d91b8b76bf5615a |     
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/e4f01db2a4a42fc2bb70e313f2d8d861d51b3745 | ORPH
   nios2     |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/ea992534f398bba159846b5cb84fa996dff66a1f | ORPH
   mipsel    |          linux-6.1.14          | NOK | http://autobuild.buildroot.net/results/1587c865f3833b249388905081bd1a9c65eb2b8f | ORPH
   x86_64    |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/9e859bc82b3400b84e24a0f64b6d86f6b17da46a |     
 powerpc64   | rtl8189fs-ed6741b52bc998875... | NOK | http://autobuild.buildroot.net/results/97a13c7093d08049095264e0c764bdaa5474db18 |     
    m68k     |         uclibc-1.0.43          | NOK | http://autobuild.buildroot.net/results/1eae803dc9fbc1f39812f8593473895305ac9757 |     
 aarch64_be  |            unknown             | NOK | http://autobuild.buildroot.net/results/6644cce419456f163e3db9325bcd99c2e4390c2e |     


Gitlab CI results for 2023-04-17
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
      TestClangCompilerRT | https://gitlab.com/buildroot.org/buildroot/-/jobs/4122623205  | ORPH 
           TestCrudiniPy3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4122623207  | ORPH 
...abihfGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4122624142  | ORPH 
...zebeUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4122624208  | ORPH 
...ToolchainBuildrootMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/4122624008  | ORPH 
...olchainBuildrootuClibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/4122624028  | ORPH 
...xternalToolchainCCache | https://gitlab.com/buildroot.org/buildroot/-/jobs/4122624031  | ORPH 
...ernalToolchainCtngMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/4122624034  | ORPH 
...ToolchainSourceryArmv4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4122624044  | ORPH 
...ToolchainSourceryArmv5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4122624048  | ORPH 
...ToolchainSourceryArmv7 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4122624051  | ORPH 
     TestFileCapabilities | https://gitlab.com/buildroot.org/buildroot/-/jobs/4122622685  | ORPH 
     TestGlibcAllTimezone | https://gitlab.com/buildroot.org/buildroot/-/jobs/4122622774  | ORPH 
...DefaultLimitedTimezone | https://gitlab.com/buildroot.org/buildroot/-/jobs/4122622776  | ORPH 
           TestIPythonPy3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4122623287  | ORPH 
...InitSystemBusyboxRoNet | https://gitlab.com/buildroot.org/buildroot/-/jobs/4122623044  | ORPH 
      TestIso9660Grub2EFI | https://gitlab.com/buildroot.org/buildroot/-/jobs/4122622881  | ORPH 
 TestIso9660Grub2External | https://gitlab.com/buildroot.org/buildroot/-/jobs/4122622899  | ORPH 
...0Grub2ExternalCompress | https://gitlab.com/buildroot.org/buildroot/-/jobs/4122622904  | ORPH 
   TestIso9660Grub2Hybrid | https://gitlab.com/buildroot.org/buildroot/-/jobs/4122622933  | ORPH 
 TestIso9660Grub2Internal | https://gitlab.com/buildroot.org/buildroot/-/jobs/4122622938  | ORPH 
...so9660SyslinuxExternal | https://gitlab.com/buildroot.org/buildroot/-/jobs/4122622944  | ORPH 
...slinuxExternalCompress | https://gitlab.com/buildroot.org/buildroot/-/jobs/4122622949  | ORPH 
...so9660SyslinuxInternal | https://gitlab.com/buildroot.org/buildroot/-/jobs/4122622953  | ORPH 
                TestKexec | https://gitlab.com/buildroot.org/buildroot/-/jobs/4122623288  | ORPH 
               TestLibJXL | https://gitlab.com/buildroot.org/buildroot/-/jobs/4122623292  | ORPH 
              TestLuaHttp | https://gitlab.com/buildroot.org/buildroot/-/jobs/4122623356  | ORPH 
         TestLuaLuaAugeas | https://gitlab.com/buildroot.org/buildroot/-/jobs/4122623323  | ORPH 
           TestLuaLuaLdap | https://gitlab.com/buildroot.org/buildroot/-/jobs/4122623395  | ORPH 
          TestLuaLuaLyaml | https://gitlab.com/buildroot.org/buildroot/-/jobs/4122623369  | ORPH 
             TestLuaLzlib | https://gitlab.com/buildroot.org/buildroot/-/jobs/4122623438  | ORPH 
             TestPerftest | https://gitlab.com/buildroot.org/buildroot/-/jobs/4122623474  | ORPH 
 TestPerlLWPProtocolhttps | https://gitlab.com/buildroot.org/buildroot/-/jobs/4122623517  | ORPH 
       TestPerllibwwwperl | https://gitlab.com/buildroot.org/buildroot/-/jobs/4122623513  | ORPH 
              TestPhpApcu | https://gitlab.com/buildroot.org/buildroot/-/jobs/4122623528  | ORPH 
            TestPhpLuaLua | https://gitlab.com/buildroot.org/buildroot/-/jobs/4122623530  | ORPH 
         TestPhpLuaLuajit | https://gitlab.com/buildroot.org/buildroot/-/jobs/4122623531  | ORPH 
               TestPhpPam | https://gitlab.com/buildroot.org/buildroot/-/jobs/4122623532  | ORPH 
          TestPhpPeclDbus | https://gitlab.com/buildroot.org/buildroot/-/jobs/4122623535  | ORPH 
         TestPythonPy3Can | https://gitlab.com/buildroot.org/buildroot/-/jobs/4122623603  | ORPH 
      TestPythonPy3Django | https://gitlab.com/buildroot.org/buildroot/-/jobs/4122623686  | ORPH 
         TestPythonPy3Git | https://gitlab.com/buildroot.org/buildroot/-/jobs/4122623703  | ORPH 
...PythonPy3MagicWormhole | https://gitlab.com/buildroot.org/buildroot/-/jobs/4122623766  | ORPH 
       TestPythonPy3Munch | https://gitlab.com/buildroot.org/buildroot/-/jobs/4122623768  | ORPH 
                   TestS6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4122623922  | ORPH 
             TestZfsGlibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/4122623965  | ORPH 
              TestZfsMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/4122623969  | ORPH 
            TestZfsUclibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/4122623972  | ORPH 



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
