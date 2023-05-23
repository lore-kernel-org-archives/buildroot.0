Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE8BFC77B7A
	for <buildroot@archiver.kernel.org>; Tue, 23 May 2023 05:35:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3636760F97;
	Tue, 23 May 2023 05:35:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3636760F97
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 06lqxVvLbDtT; Tue, 23 May 2023 05:35:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5554460F1D;
	Tue, 23 May 2023 05:35:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5554460F1D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 886BD1BF37F
 for <buildroot@lists.busybox.net>; Tue, 23 May 2023 05:35:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4342183487
 for <buildroot@lists.busybox.net>; Tue, 23 May 2023 05:35:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4342183487
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WxXXz9HuqQYK for <buildroot@lists.busybox.net>;
 Tue, 23 May 2023 05:35:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 593AA83216
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 593AA83216
 for <buildroot@buildroot.org>; Tue, 23 May 2023 05:35:35 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 4805660004
 for <buildroot@buildroot.org>; Tue, 23 May 2023 05:35:32 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Tue, 23 May 2023 05:35:32 -0000
Message-Id: <20230523053537.4342183487@smtp1.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1684820132; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=np7nwcppw95BUZG/LfmGdZ1Tpr9APuSeGdJNxg+qF5o=;
 b=mnOnyA9+KLTVR6ZDANDiKNwoi6dUfbomCfAgneuR2xr0C8lLSiEGvqm4Sy8ZGb4ZGkio83
 MUxX/wsAmbZOmx5/PnLE6hjzu7k9QXdJbyNpTBiQ1vv24zq/Jyxf/eNF5zCA79dB9ux41n
 egeLeyJjUZaOW5NvTj8idSm3dbayTo5e6gs8Z/Q3Pij/5/1RX8Lc9RAIByOLtEnR8gEl9F
 DGhWhTZjMCVkA6E35YAInaYGfz2SmdBGh8Ywb+rObafDmxyUOQXm1muFAOUQr3w+unFuhM
 yokV3RgecZl5zmwKqKSfBM9QlIQomArT2AUvjvzhEG1J4bcLkNYvNbXo2yXMLw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=mnOnyA9+
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-05-22
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

Autobuild statistics for 2023-05-22
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  |  3  |  2  |  0  |  5  |
  2023.02.x  |  9  |  5  |  0  | 14  |
    master   | 67  | 68  |  2  | 137 |

Classification of failures by reason for master
-----------------------------------------------

package/sdl2_net/sdl2_net.m... | 12
                elfutils-0.186 | 3 
glibc-2.37-2-g9f8513dc64119... | 3 
           at-spi2-core-2.48.2 | 2 
             fontconfig-2.14.2 | 2 
         gobject-introspection | 2 
            host-binutils-2.38 | 2 
                host-go-1.19.9 | 2 
host-heimdal-f4faaeaba371ff... | 2 
               host-runc-1.1.7 | 2 
               syslog-ng-4.1.1 | 2 
                   trinity-1.9 | 2 
                 agentpp-4.6.0 | 1 
                alsa-lib-1.2.8 | 1 
                     audit-3.1 | 1 
             berkeleydb-5.3.28 | 1 
  binutils-arc-2020.09-release | 1 
                     efivar-38 | 1 
                  ffmpeg-4.4.4 | 1 
            flatbuffers-23.3.3 | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
  gobject-introspection-1.74.0 | 1 
              host-rust-1.68.2 | 1 
                  kexec-2.0.26 | 1 
               libdeflate-1.15 | 1 
           libfreeimage-3.18.0 | 1 
               libglib2-2.76.1 | 1 
                  libmnl-1.0.5 | 1 
                   linux-6.3.2 | 1 
                   linux-tools | 1 
          lttng-modules-2.13.7 | 1 
             netsniff-ng-0.6.8 | 1 
               nfs-utils-2.6.3 | 1 
                    olsr-0.9.8 | 1 
                 openssh-9.3p1 | 1 
         python-greenlet-2.0.2 | 1 
           python-pyicu-2.10.2 | 1 
sconeserver-8d1935919a20133... | 1 
           sdl2_net-legal-info | 1 
                       unknown | 1 
               valgrind-3.20.0 | 1 
               xfsprogs-5.14.2 | 1 
                     znc-1.8.2 | 1 
               zxing-cpp-1.4.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |         agentpp-4.6.0          | NOK | http://autobuild.buildroot.net/results/ee2c5da7eb70037f05cc265eb1ac2ddd3e44d281 |     
    or1k     |         alsa-lib-1.2.8         | NOK | http://autobuild.buildroot.net/results/69a284d524dbce2c8fc15085c83fac75774c273b |     
powerpc64le  |      at-spi2-core-2.48.2       | NOK | http://autobuild.buildroot.net/results/3ae23626b4a60e2c24bb0d219a3829a9b2273d57 |     
    mips     |      at-spi2-core-2.48.2       | NOK | http://autobuild.buildroot.net/results/7aedf2407817bbed7e12bc69bb5e4a676f42dd62 |     
    i686     |           audit-3.1            | NOK | http://autobuild.buildroot.net/results/940d34db7458e5760a61da3bf45000fd1674b3dd |     
   sh4aeb    |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/cc83bd087a1e581de27c907141c88d04e1488e85 | ORPH
   arceb     |  binutils-arc-2020.09-release  | NOK | http://autobuild.buildroot.net/results/a022a9213056dcaf636853e3f52f0c6eaa02ad79 |     
    arm      |           efivar-38            | NOK | http://autobuild.buildroot.net/results/cd40fb18741738304b9f01eb2373952d28e79ad9 |     
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/dc2f7103f31c2701bdb897d454f84951e96a095d | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/23badc2c8a5c2d3e32da226d891d8e21f81442fb | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/809ef82474027cc9d348efd946ebb895252a3e26 | ORPH
  aarch64    |          ffmpeg-4.4.4          | NOK | http://autobuild.buildroot.net/results/ddbeefc6d6bbba2875bb2143b627bacea3cb8551 |     
    m68k     |       flatbuffers-23.3.3       | NOK | http://autobuild.buildroot.net/results/8fd4d90ba145078c9055663867b1dfcfe670100b |     
  riscv64    |       fontconfig-2.14.2        | NOK | http://autobuild.buildroot.net/results/27ef46f9d9fc87c3b71ec0ef009cba77952a16ea | ORPH
  riscv64    |       fontconfig-2.14.2        | NOK | http://autobuild.buildroot.net/results/948222f304bcf2a3a0e8d83ce91c11ff74ea8470 | ORPH
   s390x     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/9339e7896111b5b5054c3ef5df770a24fe55447f |     
powerpc64le  | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/7ca733143a592eea92ff3b61cc183566f50f21f2 |     
    or1k     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/44a2f80fe60515250c7cd2e8dcf57c3aaf20b704 |     
  powerpc    | glibc-2.37-2-g9f8513dc64119... | NOK | http://autobuild.buildroot.net/results/11033f177bce4bc9aebe427088f415451521acdf |     
 powerpc64   | glibc-2.37-2-g9f8513dc64119... | NOK | http://autobuild.buildroot.net/results/8a9d30ac97fb2ff103b3561f529c8193bf22a557 |     
  powerpc    | glibc-2.37-2-g9f8513dc64119... | NOK | http://autobuild.buildroot.net/results/7c8ace4dbe4fef7aaa2c0687db918968df895f20 |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/0b89ea76659bb8d88e488385a47800396624ae1e |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/707c57b730924fbd29bfcc58521123ce79a54336 |     
   nios2     |  gobject-introspection-1.74.0  | NOK | http://autobuild.buildroot.net/results/296f313d8c16ecfa739fc20d3a05f3e1b9fbdb65 | ORPH
  riscv32    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/c779d21735ce3318591a3d2024b15d56c97e9ac6 |     
  sparc64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/0b8fe3ffb78cf90faf36fcd8538433d57b6b8324 |     
  mips64el   |         host-go-1.19.9         | NOK | http://autobuild.buildroot.net/results/4875e8d1efb3474cc49518a70fee94b21cb1f959 |     
   mips64    |         host-go-1.19.9         | NOK | http://autobuild.buildroot.net/results/ed703c0d45f9c4f593b618dea89fa06ecc0112ce |     
   mipsel    | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/ae72a3d26cb0bb8b36b7c606668199c852b5d4b7 | ORPH
  sparc64    | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/15ff0cf01cf55877610466df8d58360121e8cbb3 | ORPH
   arceb     |        host-runc-1.1.7         | NOK | http://autobuild.buildroot.net/results/e7c8d8b10f7cb4b94eee8ebc1a8a369b35c009aa |     
    m68k     |        host-runc-1.1.7         | NOK | http://autobuild.buildroot.net/results/3da3357dbdac00d3c55da071983f5b31fadf2cb9 |     
   mipsel    |        host-rust-1.68.2        | NOK | http://autobuild.buildroot.net/results/2572d19576a5ce7a59c0788ad86b83c6f2c3f767 |     
    m68k     |          kexec-2.0.26          | NOK | http://autobuild.buildroot.net/results/dba2327d23d01e13990ffca5d06c6f5c83eed39a |     
   armeb     |        libdeflate-1.15         | NOK | http://autobuild.buildroot.net/results/3dd303a61b77d5651df6c57de8f4bf14ac228e43 |     
    mips     |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/b0dff458fa19cd6e58118513463cf2db5521281e |     
   x86_64    |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/618c969b78c3fd478d8d5a33d51a81050e6c58d6 |     
  powerpc    |          libmnl-1.0.5          | NOK | http://autobuild.buildroot.net/results/364a982e65c9819e599b66a39e0effd23c091640 |     
powerpc64le  |          linux-6.3.2           | NOK | http://autobuild.buildroot.net/results/84594823e43bd85b56b9c41db5542e8f577bdb09 | ORPH
    or1k     |          linux-tools           | NOK | http://autobuild.buildroot.net/results/f0616ea8035157b427dfe0f22e210c35c3fffebb | ORPH
    arc      |      lttng-modules-2.13.7      | NOK | http://autobuild.buildroot.net/results/881183171ca6accbd711939d71b54d0375456e86 |     
   mips64    |       netsniff-ng-0.6.8        | NOK | http://autobuild.buildroot.net/results/f3a026e05d14ebc78878c83beadd5df8fd07794d |     
   x86_64    |        nfs-utils-2.6.3         | NOK | http://autobuild.buildroot.net/results/6f7d72d2de609383776e53e02cb0982114098fb6 |     
   sh4aeb    |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/73647f8dae233a30b956ccef2b47132c8151aa72 | ORPH
    m68k     |         openssh-9.3p1          | NOK | http://autobuild.buildroot.net/results/acd7cd9ebecda6e934b5e7fdc74910aa61684262 | ORPH
powerpc64le  | package/sdl2_net/sdl2_net.m... | NOK | http://autobuild.buildroot.net/results/0ffb4b8ca04382e70ea96fea3264ede21e09c42a |     
  powerpc    | package/sdl2_net/sdl2_net.m... | NOK | http://autobuild.buildroot.net/results/3425712b44de657ecbdd08a2b558a87e818aa0de |     
   sh4aeb    | package/sdl2_net/sdl2_net.m... | NOK | http://autobuild.buildroot.net/results/ccde097d7453c38945e6dfba40463a1faa130f8a |     
    m68k     | package/sdl2_net/sdl2_net.m... | NOK | http://autobuild.buildroot.net/results/616e6ac353b69d8c8f5ff2789c0835e8196b1343 |     
    arm      | package/sdl2_net/sdl2_net.m... | NOK | http://autobuild.buildroot.net/results/8f34064467dfdb81794c4e3342c0fd2b6be6ff07 |     
 powerpc64   | package/sdl2_net/sdl2_net.m... | NOK | http://autobuild.buildroot.net/results/7f04e622711260c19a1d018977f4afee784af6bb |     
   sparc     | package/sdl2_net/sdl2_net.m... | NOK | http://autobuild.buildroot.net/results/65b4fa6e1ade6f220a85ed72befc7f1001ed5065 |     
powerpc64le  | package/sdl2_net/sdl2_net.m... | NOK | http://autobuild.buildroot.net/results/06bc7c31b3a1bbbab0a57c1b086bc0914663992c |     
  powerpc    | package/sdl2_net/sdl2_net.m... | NOK | http://autobuild.buildroot.net/results/125768a73a19018e13dc80191c1b202c4244e63f |     
   sparc     | package/sdl2_net/sdl2_net.m... | NOK | http://autobuild.buildroot.net/results/efb6940724b875724ac3e1e90c1f0dc84087371e |     
   sh4aeb    | package/sdl2_net/sdl2_net.m... | NOK | http://autobuild.buildroot.net/results/cbb710d906995e3a63fd0dfe75bf608186832b07 |     
  mips64el   | package/sdl2_net/sdl2_net.m... | NOK | http://autobuild.buildroot.net/results/fda729cee6ea9329f03f409a1b16d2b584733b5a |     
 powerpc64   |     python-greenlet-2.0.2      | NOK | http://autobuild.buildroot.net/results/f6a1adbe16114a6c968c011b26457328a298718c |     
    arm      |      python-pyicu-2.10.2       | NOK | http://autobuild.buildroot.net/results/f105c168ef99b1bf9945e5b5c952a2da9bf3c6ca |     
microblazeel | sconeserver-8d1935919a20133... | NOK | http://autobuild.buildroot.net/results/5dee950b1dac12d1472f8e1b91e9aca92bb69994 |     
    arm      |      sdl2_net-legal-info       | NOK | http://autobuild.buildroot.net/results/09745721440aaa71bd31d37e7b4e4c0e2679bebe | ORPH
  powerpc    |        syslog-ng-4.1.1         | NOK | http://autobuild.buildroot.net/results/199f26b340af26cd60cd8bfcab74d22873949a9a |     
    sh4      |        syslog-ng-4.1.1         | NOK | http://autobuild.buildroot.net/results/0309de13c29f2905dc1418e2d62cf33a895a0c59 |     
    arm      |          trinity-1.9           | NOK | http://autobuild.buildroot.net/results/096d3d8b81b3de5752045e5d8830ffc942b21e96 | ORPH
   x86_64    |          trinity-1.9           | NOK | http://autobuild.buildroot.net/results/7b2766606ec1c9bfcc742133d61a75435565ecee | ORPH
    m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/44c5eadc7061ca49311c3ad90e0e7fe3a74753ed |     
  mips64el   |        valgrind-3.20.0         | NOK | http://autobuild.buildroot.net/results/9a7241939c708b09ea82663504dff44c8a45b5a2 | ORPH
  mips64el   |        xfsprogs-5.14.2         | NOK | http://autobuild.buildroot.net/results/abad4cbfa02c33ff87ca3c51ebda8d6b9de2de05 | ORPH
   x86_64    |           znc-1.8.2            | NOK | http://autobuild.buildroot.net/results/196b0c3639b136167cb8e810e7caad596d617658 |     
    mips     |        zxing-cpp-1.4.0         | NOK | http://autobuild.buildroot.net/results/54eba9723cc09ad629172ed01792a5d58864ecf9 |     


Classification of failures by reason for 2022.02.x
--------------------------------------------------

            igd2-for-linux-2.1 | 1 
                       unknown | 1 


Detail of failures for 2022.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/8d321e718ed25949306ea83b2722b6fd419ad192 |     
    sh4      |            unknown             | NOK | http://autobuild.buildroot.net/results/3f92420885ec44572089dfeba95645f1e8a8053f |     


Classification of failures by reason for 2023.02.x
--------------------------------------------------

               host-qemu-7.2.0 | 2 
                busybox-1.36.0 | 1 
          linux-5.10.162-cip24 | 1 
                    olsr-0.9.8 | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    mips     |         busybox-1.36.0         | NOK | http://autobuild.buildroot.net/results/5e75605aeafe04e0f735a7eb3b07718eabfdff42 | ORPH
 microblaze  |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/0ef39299a25969c9d36fe4e846d022a9282704de |     
 microblaze  |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/2dd773e7c5f8827bb26c8dca2899606f9fc599c1 |     
 aarch64_be  |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/3c2321d84671a07ca8a1f2482bee8c201a274746 | ORPH
   x86_64    |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/dae12e7f92106e0e62e5fc56c592c3da8548684f | ORPH


Gitlab CI results for 2023-05-22
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
      TestClangCompilerRT | https://gitlab.com/buildroot.org/buildroot/-/jobs/4322819048  | ORPH 
           TestCrudiniPy3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4322819049  | ORPH 
...bihfUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4322819472  | ORPH 
           TestIPythonPy3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4322819089  | ORPH 
                TestKexec | https://gitlab.com/buildroot.org/buildroot/-/jobs/4322819092  | ORPH 
               TestLibJXL | https://gitlab.com/buildroot.org/buildroot/-/jobs/4322819095  | ORPH 
              TestLuaUtf8 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4322819157  | ORPH 
             TestPerftest | https://gitlab.com/buildroot.org/buildroot/-/jobs/4322819231  | ORPH 
 TestPerlLWPProtocolhttps | https://gitlab.com/buildroot.org/buildroot/-/jobs/4322819256  | ORPH 
       TestPerllibwwwperl | https://gitlab.com/buildroot.org/buildroot/-/jobs/4322819252  | ORPH 
         TestPythonPy3Can | https://gitlab.com/buildroot.org/buildroot/-/jobs/4322819285  | ORPH 
      TestPythonPy3Django | https://gitlab.com/buildroot.org/buildroot/-/jobs/4322819300  | ORPH 
              TestRustBin | https://gitlab.com/buildroot.org/buildroot/-/jobs/4322819387  | ORPH 
                   TestS6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4322819388  | ORPH 
...SELinuxSystemdSquashfs | https://gitlab.com/buildroot.org/buildroot/-/jobs/4322819025  | ORPH 
             TestZfsGlibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/4322819409  | ORPH 
              TestZfsMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/4322819410  | ORPH 
            TestZfsUclibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/4322819411  | ORPH 



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
