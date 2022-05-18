Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2156C433F5
	for <buildroot@archiver.kernel.org>; Wed, 18 May 2022 04:40:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1276C419B1;
	Wed, 18 May 2022 04:40:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wrAvfE8QwyoE; Wed, 18 May 2022 04:40:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E15524199F;
	Wed, 18 May 2022 04:40:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 891381BF414
 for <buildroot@lists.busybox.net>; Wed, 18 May 2022 04:40:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 76E6F83EEA
 for <buildroot@lists.busybox.net>; Wed, 18 May 2022 04:40:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id m_ej1nKKTXLT for <buildroot@lists.busybox.net>;
 Wed, 18 May 2022 04:40:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 40E1582AC3
 for <buildroot@buildroot.org>; Wed, 18 May 2022 04:40:32 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 800BB4000C
 for <buildroot@buildroot.org>; Wed, 18 May 2022 04:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1652848829; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=4TLXz3oVRDvb3+yKE5/zjv3YrCIsA3X/7BMYMrUMULQ=;
 b=M1/F9mZRkaZQ36MdslptHlV2ltOTn2GOfgyBZnpFp4CUNkpVTuhRL1FlkhmtjiJqGFuSDm
 SqwrSLJ+k3FOs3bIMI5YApVQlPZcpvYfewx/5jBtV/yrKv1mgip4m5BEdSwNRuwDaAk7ZQ
 fcZkd0LN9kSQUidqhXtP4WIDdo9yIHpvEh3kEQSiqhH958Jnzr6k0i6BydNsO8AHqQ0SZH
 YSFLChlBJb/MNcFJsGN5cv0q+MGO6yx7rpha7hCuN/nCbCRtT7P2PhXeeQAkyvl3zu8dMF
 vB/pKaWwApqJHy86F22QFpFhOVxETefg6H1qDEub/6K6NXrm6AgBkCMPhBZzzA==
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Wed, 18 May 2022 04:40:29 -0000
Message-Id: <20220518044034.76E6F83EEA@smtp1.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-05-17
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

Autobuild statistics for 2022-05-17
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  | 22  |  9  |  1  | 32  |
    master   | 156 | 142 |  1  | 299 |

Classification of failures by reason for master
-----------------------------------------------

           optee-client-3.17.0 | 15
         host-gcc-final-10.3.0 | 9 
               protobuf-3.20.1 | 9 
                host-go-1.18.2 | 6 
             libopenssl-1.1.1o | 5 
              swupdate-2022.05 | 5 
                   uacme-1.7.1 | 4 
                    4th-3.64.0 | 3 
                 dash-0.5.11.5 | 3 
         host-gcc-final-11.3.0 | 3 
host-pahole-73383b3a39afe86... | 3 
               libglib2-2.70.4 | 3 
                libressl-3.5.2 | 3 
                    bat-0.19.0 | 2 
                  boost-1.79.0 | 2 
                  exempi-2.6.1 | 2 
  gobject-introspection-1.70.0 | 2 
           libwebsockets-4.3.1 | 2 
           linux-5.10.104-cip3 | 2 
         multipath-tools-0.8.9 | 2 
            qpid-proton-0.35.0 | 2 
    toolchain-external-bootlin | 2 
                       unknown | 2 
                 wavemon-0.9.4 | 2 
             18xx-ti-utils-8.8 | 1 
               acpica-20200717 | 1 
                   audit-3.0.7 | 1 
                     aufs-util | 1 
                     bc-1.07.1 | 1 
                bitcoin-0.21.2 | 1 
                busybox-1.35.0 | 1 
              containerd-1.6.2 | 1 
dahdi-linux-5c840cf43838e06... | 1 
               ding-libs-0.6.2 | 1 
                 dmalloc-5.6.5 | 1 
           docker-cli-20.10.14 | 1 
                   eigen-3.4.0 | 1 
               erofs-utils-1.4 | 1 
                     frr-8.2.2 | 1 
fs/axfs/axfs.mk:32: /nvmeda... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
glibc-2.35-96-g2c4fc8e5ca74... | 1 
 glslsandbox-player-2021.08.24 | 1 
google-breakpad-c85eb4a59b6... | 1 
          host-gcc-final-9.4.0 | 1 
        host-gcc-initial-9.4.0 | 1 
              host-rust-1.60.0 | 1 
                      less-590 | 1 
               libcap-ng-0.8.3 | 1 
                     libgcrypt | 1 
              libgcrypt-1.10.1 | 1 
                libgpiod-1.6.3 | 1 
                   libnl-3.5.0 | 1 
              libostree-2022.3 | 1 
                linphone-4.4.8 | 1 
                 mesa3d-21.3.8 | 1 
             netsniff-ng-0.6.8 | 1 
            ocf-linux-20120127 | 1 
                    ola-0.10.8 | 1 
               openldap-2.4.59 | 1 
                       opensbi | 1 
                    opus-1.3.1 | 1 
               pcsc-lite-1.9.6 | 1 
                   perl-5.34.1 | 1 
                    php-8.0.19 | 1 
               pipewire-0.3.50 | 1 
               poppler-21.12.0 | 1 
                     refpolicy | 1 
                rng-tools-6.15 | 1 
                   speex-1.2.0 | 1 
                tinifier-3.4.0 | 1 
                   tor-0.4.7.7 | 1 
uclibc-ng-test-0844445e7358... | 1 
                 zlib-ng-2.0.6 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mipsel    |       18xx-ti-utils-8.8        | NOK | http://autobuild.buildroot.net/results/8501bbeb1912e3923cba46b576b49f755c7c0072 |     
  riscv64    |           4th-3.64.0           | NOK | http://autobuild.buildroot.net/results/97e04e5ef3337ef2043407a4f36e7f9f3ca5ac43 |     
  riscv64    |           4th-3.64.0           | NOK | http://autobuild.buildroot.net/results/cbbd28c44e4d3e5a4e7acb345f43b29a7e945e00 |     
  riscv64    |           4th-3.64.0           | NOK | http://autobuild.buildroot.net/results/b8abc8bb272764c4ba99049bef1f421a54ee2a4b |     
    m68k     |        acpica-20200717         | NOK | http://autobuild.buildroot.net/results/cf0dbacb2375ecd6ccab719d304f7ad0a2da21fa |     
    arm      |          audit-3.0.7           | NOK | http://autobuild.buildroot.net/results/a7158506b549d7e7d4d3afa5f909066fb30318b1 |     
   armeb     |           aufs-util            | NOK | http://autobuild.buildroot.net/results/9e561f707ac4f4b0402038f3d788541d14d8c27f |     
    i586     |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/2232787f9ab317cf61337bb387ee7d10cee49393 |     
    arm      |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/68b02671a9f49df04075eb39e4b679540af38a6a |     
  riscv64    |           bc-1.07.1            | NOK | http://autobuild.buildroot.net/results/aff3373d3cab695577c1f0c62b0d836de68f5007 |     
    or1k     |         bitcoin-0.21.2         | NOK | http://autobuild.buildroot.net/results/14447e6d34109eede86b5185099c567aa033bb32 |     
    sh4      |          boost-1.79.0          | NOK | http://autobuild.buildroot.net/results/c192bb97fc230e54c8c4be2cfb399199f50ffc54 |     
    or1k     |          boost-1.79.0          | NOK | http://autobuild.buildroot.net/results/31604b509295df0c69791dd53861a85f46fa38ef |     
  riscv64    |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/0c849a3196f98b9f0e160a39046626149cfb9def | ORPH
powerpc64le  |        containerd-1.6.2        | NOK | http://autobuild.buildroot.net/results/4470625752bb36268fdc700750ad4a26ad0c2568 |     
   xtensa    | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/bc7f2606a3700a5884b03975d75f9432bd52cdb5 |     
    sh4a     |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/983cb768a64f7191a373e36e46fd735899678057 | ORPH
    sh4      |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/2a8d25a3cbfcd879d5d100188db4f5a4fdbe5e8d | ORPH
 aarch64_be  |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/1f4f0f2702853caba3879cdd1e83472ee434fef9 | ORPH
    arc      |        ding-libs-0.6.2         | NOK | http://autobuild.buildroot.net/results/702fab5622a0be6b46dbe79e941b4bdbf22c40e4 |     
    i686     |         dmalloc-5.6.5          | NOK | http://autobuild.buildroot.net/results/857e90bfbab20ccbbe9ad079cf24682c3b26423c | ORPH
   x86_64    |      docker-cli-20.10.14       | NOK | http://autobuild.buildroot.net/results/c2bf13d58e765613bf75e9c5684cfe8983099e25 |     
    arm      |          eigen-3.4.0           | NOK | http://autobuild.buildroot.net/results/cf7fa7e3cb81e122db3f555b2e3a76e1900a4e13 |     
    or1k     |        erofs-utils-1.4         | NOK | http://autobuild.buildroot.net/results/391750d3aa76f9eb63e1406ae2ec3d70741bc70e |     
    arm      |          exempi-2.6.1          | NOK | http://autobuild.buildroot.net/results/66a7df3f3fd20aa8110067a63011975e324ecf4c |     
    arm      |          exempi-2.6.1          | NOK | http://autobuild.buildroot.net/results/20e9389811e7ca0a053def83a6080b7a29283773 |     
   xtensa    |           frr-8.2.2            | NOK | http://autobuild.buildroot.net/results/bf74179dcf3619b6ddd6327faffc3887c4632821 |     
powerpc64le  | fs/axfs/axfs.mk:32: /nvmeda... | NOK | http://autobuild.buildroot.net/results/2f679d1f0d9081d5faa354470cfaedc4c579e3ce |     
   arceb     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/0eb630803e391ed4c4b77a25ce25e774386305f9 |     
   nios2     | glibc-2.35-96-g2c4fc8e5ca74... | NOK | http://autobuild.buildroot.net/results/a49e84f74472f92540500d6602a316c029708ca4 |     
  aarch64    | glslsandbox-player-2021.08.24  | NOK | http://autobuild.buildroot.net/results/cce4e8a4db058823c7e7700583561db6c5ab85d2 |     
  sparc64    |  gobject-introspection-1.70.0  | NOK | http://autobuild.buildroot.net/results/5aec5345b7ebc332e988122ecbdd97ebc6892fee | ORPH
    i686     |  gobject-introspection-1.70.0  | NOK | http://autobuild.buildroot.net/results/6da91523ce1c1f3b79e10bbac614999e36849737 | ORPH
   mipsel    | google-breakpad-c85eb4a59b6... | NOK | http://autobuild.buildroot.net/results/32d8bac76683160ffce465e56971cc1564b206b3 |     
 powerpc64   |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/d7552fa82486b0edbccc517deabdd92420e2dcea |     
  riscv32    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/2977af38f75ac1ff5c996b7bca24c8f2ae7669f6 |     
  powerpc    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/fccc602e4c299243ea4a8941505d5a3341d20826 |     
powerpc64le  |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/fc01e7c17c3fe29f9f56ecd7269871f59d4a50f1 |     
 powerpc64   |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/9f084276f5e6fc846f59249606186a18054d043a |     
 powerpc64   |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/e6e103109604c0d500f83d1d5063bc807ae6d1cc |     
  sparc64    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/0fba459c804da1c3deb68635922ccae8978416fa |     
 powerpc64   |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/fe3c8e43e333f004ff1d299b2696eccf29436460 |     
 powerpc64   |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/05e4c6ed1c147aa3d036b4fa79a23774bfe5149d |     
 powerpc64   |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/b1bd16c4480b5dfc3a30473f1938c7f11a78f29b |     
powerpc64le  |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/d7f6979c50e1d309d17f6e9f22ff6521b3cdeb59 |     
   nios2     |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/f9f5817e99091f296d29b8d471349991117c16c7 |     
    i686     |      host-gcc-final-9.4.0      | NOK | http://autobuild.buildroot.net/results/b26007104c9eff9eeec24e8d0e948c334003434b |     
   arceb     |     host-gcc-initial-9.4.0     | NOK | http://autobuild.buildroot.net/results/13609ca460fccf93617acb0b61bd7b5ab22dc537 |     
  riscv64    |         host-go-1.18.2         | NOK | http://autobuild.buildroot.net/results/fde617ed6dd49eece4244e5bea1ae45fb9fa992b |     
    i686     |         host-go-1.18.2         | NOK | http://autobuild.buildroot.net/results/11161f4c297d73ef3ad689db42ea72524c78c3e7 |     
  mips64el   |         host-go-1.18.2         | NOK | http://autobuild.buildroot.net/results/ff681f242d01623b757e68f044f63ad463bd6f64 |     
    i586     |         host-go-1.18.2         | NOK | http://autobuild.buildroot.net/results/b04e84742bd05f47fdb7cf9e9803f4b3b7da41ef |     
   mips64    |         host-go-1.18.2         | NOK | http://autobuild.buildroot.net/results/ea6066695556c3d90b5fe23929532a6bb7807ab6 |     
   mips64    |         host-go-1.18.2         | NOK | http://autobuild.buildroot.net/results/0493351e6f02278ed54d936a1eed8973ff9f5772 |     
  aarch64    | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/2790dbd6b0a57a73db8f27d06b8b348eeeb1ea76 |     
   xtensa    | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/7daaebb21ac70af03dae80989ffd8dab717caccb |     
microblazeel | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/f2f380a34c035336884dc2ef634cf825542e82a6 |     
  aarch64    |        host-rust-1.60.0        | NOK | http://autobuild.buildroot.net/results/0a7c3a87dca07dd7e175f842957ceefbea2b5b11 |     
    m68k     |            less-590            | NOK | http://autobuild.buildroot.net/results/957ad1ee9272b01225c01ba5a5762bec33b2a4a4 | ORPH
    m68k     |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/0efb1de4ae0d0e5d13a78d08d4eba7434d13aa1a |     
   armeb     |           libgcrypt            | TIM | http://autobuild.buildroot.net/results/a4d06407111e306a9c7b6e2b2e23aede68c0b317 |     
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/fe53a75131d051ca04424498fb9797a1ea91412c | ORPH
   arceb     |        libglib2-2.70.4         | NOK | http://autobuild.buildroot.net/results/97720ac338d0c75b610db30a7ac7280dfc0596f2 |     
    arc      |        libglib2-2.70.4         | NOK | http://autobuild.buildroot.net/results/7103d15dfb31d0a39e69b8c686fddafbb1cb1d3f |     
    arc      |        libglib2-2.70.4         | NOK | http://autobuild.buildroot.net/results/124e86961efd5e35a79817903768d6b7442dce5b |     
    m68k     |         libgpiod-1.6.3         | NOK | http://autobuild.buildroot.net/results/eec6ec9a3023b5355d9aea49a6c57eb12a15a30d |     
  mips64el   |          libnl-3.5.0           | NOK | http://autobuild.buildroot.net/results/d5d517718bdda657014a9bcbd6f3d67bdb6cf42d | ORPH
microblazeel |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/1a2c260300fd9ec9549980412190a29993f52110 |     
   sparc     |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/0e00a7792a5e328ebfeb50afb09176feeed700a5 |     
 aarch64_be  |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/de67f8220622b544d5f119bc2e64a94435e7b2be |     
   sparc     |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/01a02d93f1b129d0cb557e4cf7b0a4986614e8ec |     
    m68k     |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/f50db6c4fe4ea89962d7dd96fb92de3581e169ca |     
  mips64el   |        libostree-2022.3        | NOK | http://autobuild.buildroot.net/results/bf69993f2ac62fc50c498a2ebf841deb9b69642f |     
microblazeel |         libressl-3.5.2         | NOK | http://autobuild.buildroot.net/results/808ff7e44a43c399152028df205a33e70fea0ec3 | ORPH
   arceb     |         libressl-3.5.2         | NOK | http://autobuild.buildroot.net/results/3c15dde7fb37e5c5e08b75e7c84e75f021b0a2ed | ORPH
  mips64el   |         libressl-3.5.2         | NOK | http://autobuild.buildroot.net/results/8eeba24eacc453345327ae930566154325a96728 | ORPH
    arm      |      libwebsockets-4.3.1       | NOK | http://autobuild.buildroot.net/results/4e566da37fc48edd9b59cf48ad8102cfa1abd643 |     
    arm      |      libwebsockets-4.3.1       | NOK | http://autobuild.buildroot.net/results/2f6097c3f57d3376ae71d3a528fbb50aed929ea9 |     
  powerpc    |         linphone-4.4.8         | NOK | http://autobuild.buildroot.net/results/ca3632cb89c112641421352541ce2e7aa61139e0 | ORPH
   mipsel    |      linux-5.10.104-cip3       | NOK | http://autobuild.buildroot.net/results/2def3f088f16d545b73f0ee923f7aa9420b69c85 | ORPH
  powerpc    |      linux-5.10.104-cip3       | NOK | http://autobuild.buildroot.net/results/33bd40ae0246454968cd19bdf29fcddc84c43dc1 | ORPH
   x86_64    |         mesa3d-21.3.8          | NOK | http://autobuild.buildroot.net/results/d9e0b57b66c631112aaaba36b4c99929c3b009b8 |     
powerpc64le  |     multipath-tools-0.8.9      | NOK | http://autobuild.buildroot.net/results/1457fd081e95bf500dc818cf42f6ba3aa5c16a7c |     
   x86_64    |     multipath-tools-0.8.9      | NOK | http://autobuild.buildroot.net/results/e980d136e7de3c56b76943704023cb09a17e429b |     
   mipsel    |       netsniff-ng-0.6.8        | NOK | http://autobuild.buildroot.net/results/f6a776ec2a4641787d80db4f88b5b5becad7d777 |     
   armeb     |       ocf-linux-20120127       | NOK | http://autobuild.buildroot.net/results/946fd24b0f8f0141754e4f9bf2d67221e684f6ae | ORPH
    arm      |           ola-0.10.8           | NOK | http://autobuild.buildroot.net/results/f591eac8e92ae354c80ce198b741b704add60c03 |     
   sparc     |        openldap-2.4.59         | NOK | http://autobuild.buildroot.net/results/d55699ae5f77727e6794750621148990fd60cb10 |     
  riscv32    |            opensbi             | NOK | http://autobuild.buildroot.net/results/fd1178d48e03eb2ec8554efdf6f5b87fb6fee50f |     
  mips64el   |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/4ce54a17f09af4fd5014c9612e4100966ea8c720 |     
    i686     |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/fd95bdb59dc068099e86be1e7d5a9722dc2ad3d9 |     
    arm      |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/ab57ca29c3fb476d83493987f5ebf164adcfeaee |     
    m68k     |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/d9ede5e703e920f01b0558863ccf98d42ffc3ac3 |     
    sh4a     |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/125a6b79247bbb72f327419301ee72ecdd01578f |     
  riscv64    |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/23158c6874c50db1c0d572d4ae26f73d6f0f8f90 |     
  sparc64    |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/ddef9dadbe1a45222bf2cfefc006eb8663c95de2 |     
   mipsel    |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/cf7be67c678c46f60b18f7b5cb4277901f904c98 |     
   sparc     |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/bd946ae44d3e2915c956a7bd141aef1c4822bb3e |     
  powerpc    |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/0fc8239c198389673771a5593ff46261a8a7ae49 |     
   arceb     |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/fbd6965f885548da1dabb3af4431595dad92b1ed |     
    arc      |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/4e0a93a42eae1d6b4aa212a799abdad036ef0f20 |     
 powerpc64   |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/6313a45d466bd33fda75df5e82b5ef8016d4ae52 |     
    arm      |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/f5363200c2f2c90f4e3f583ff04568f8212d893d |     
 powerpc64   |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/dcb587aabf0cbe87851d19763696b37385ea600d |     
   armeb     |           opus-1.3.1           | NOK | http://autobuild.buildroot.net/results/6ae7f75f2f0175649b896b61dd8ea77d82c6b646 | ORPH
    arm      |        pcsc-lite-1.9.6         | NOK | http://autobuild.buildroot.net/results/de7a1ce3f92873de09e145c149590b2c62f59150 | ORPH
    mips     |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/f450bd803e8af2830730b2820f97631ddc675a8d |     
   armeb     |           php-8.0.19           | NOK | http://autobuild.buildroot.net/results/9c49231e338cfa7e92b3e74fc48696f2f7470f74 |     
    mips     |        pipewire-0.3.50         | NOK | http://autobuild.buildroot.net/results/6ecfe8629f186ccaa1949c6af939b3f47280d6c2 |     
   xtensa    |        poppler-21.12.0         | NOK | http://autobuild.buildroot.net/results/ed4e5c902bc97bbcf31fa2f16d0d00045829f8ec |     
   nios2     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/18c5ad02f5aa94b89db7f2b560eb83d40a0a3702 |     
    m68k     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/b19314675aa3361a820beb9ecfca206e1a5b7d1c |     
   nios2     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/4187688abbaa867e320768aff70dc27023e07730 |     
    sh4      |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/5a4a8d3e7485bb143a0c443a8d4c99c9fdee3d15 |     
   nios2     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/b7cd1edbdf78b723ed856e6661c273fde2d17c8b |     
microblazeel |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/6208ba10f03e6af38d95585fff3f97b75c8e7bc9 |     
microblazeel |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/3c3d31bdeeac187c7b2395634cab082c8c822e28 |     
   nios2     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/991ad7c40291c48ece7fd03194086e962760e8b5 |     
    arc      |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/2da8fe4d800dc16dfde08dab263bfe6b41044e86 |     
    arc      |       qpid-proton-0.35.0       | NOK | http://autobuild.buildroot.net/results/37799577167f25d688bac77d48b6e26c1aab43b8 |     
  sparc64    |       qpid-proton-0.35.0       | NOK | http://autobuild.buildroot.net/results/596bb4183ee4703232dddd1ce6efd5bd82cef6e2 |     
  mips64el   |           refpolicy            | NOK | http://autobuild.buildroot.net/results/fae5aeb4106fca22368f5ec97c6a487e9e5316d4 |     
  riscv64    |         rng-tools-6.15         | NOK | http://autobuild.buildroot.net/results/7829c1bfd5db143e658a9f72e47074f0853f73c6 |     
    arm      |          speex-1.2.0           | NOK | http://autobuild.buildroot.net/results/e02c470af3a2f9a0b38621dcb663278e3ad1afe0 | ORPH
   xtensa    |        swupdate-2022.05        | NOK | http://autobuild.buildroot.net/results/1c933b4c46aaf2cc5a9d3006f442dac3e53d4faa |     
  powerpc    |        swupdate-2022.05        | NOK | http://autobuild.buildroot.net/results/4bc2b333c5a1cc6e90fa8af57d76c9ffc9b71208 |     
    i686     |        swupdate-2022.05        | NOK | http://autobuild.buildroot.net/results/98d9f790ccfeeea88dc39890108d1ca4a812d619 |     
  powerpc    |        swupdate-2022.05        | NOK | http://autobuild.buildroot.net/results/7e2aa3efadbae4388c2f99adc252ba1cb4fc6efa |     
   mipsel    |        swupdate-2022.05        | NOK | http://autobuild.buildroot.net/results/5c14ecb44bdff9b7fde64975300d6281ef843a72 |     
    arm      |         tinifier-3.4.0         | NOK | http://autobuild.buildroot.net/results/18a5f709e9b36023b0828c5e0596d7f118138502 |     
   nios2     |   toolchain-external-bootlin   | NOK | http://autobuild.buildroot.net/results/f30621888e1de437112f2f185538eb5f29e1bc40 |     
   mips64    |   toolchain-external-bootlin   | NOK | http://autobuild.buildroot.net/results/41bce32cf7edca96f357d784d5197d6a9a20765b |     
microblazeel |          tor-0.4.7.7           | NOK | http://autobuild.buildroot.net/results/90268bc101cfe6bd2cb26ebbe9af6b55b40b5730 |     
   mipsel    |          uacme-1.7.1           | NOK | http://autobuild.buildroot.net/results/03ab53206e05b630a41e1b2fbf58e2085074d3fe |     
    i686     |          uacme-1.7.1           | NOK | http://autobuild.buildroot.net/results/e3f3b1ddb46b10df03eea14da293e44776e21c98 |     
   mipsel    |          uacme-1.7.1           | NOK | http://autobuild.buildroot.net/results/d2f2d952f90547da0e33e6ba58e9ebf883ea204d |     
  mips64el   |          uacme-1.7.1           | NOK | http://autobuild.buildroot.net/results/7e9c831b9359b92d3dccb17786e5ecb7320a1d77 |     
    sh4a     | uclibc-ng-test-0844445e7358... | NOK | http://autobuild.buildroot.net/results/652c2b125cf1f7183219e2a885e34b1f936f2619 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/67e459b11f4245424301ddedda2247a89d899d03 |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/5cce02e9deb06438cdb8399a5c30d1f99ed56f2e |     
    arm      |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/49ed9a953023ad612a7186000c568255325b8cbd |     
    mips     |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/c7f43db85a5267cee37a8be2d65a86258c602e1d |     
  aarch64    |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/357f1353b99e2317ecdc9bf8e3dee5983902493f | ORPH


Classification of failures by reason for 2022.02.x
--------------------------------------------------

                       frr-8.1 | 2 
tvheadend-1295dd2be863f5beb... | 2 
                    bird-2.0.8 | 1 
                    dhcp-4.4.3 | 1 
                       libuwsc | 1 
                  ndisc6-1.0.5 | 1 
                nodejs-14.18.3 | 1 
                 wavemon-0.9.4 | 1 


Detail of failures for 2022.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |           bird-2.0.8           | NOK | http://autobuild.buildroot.net/results/350cb718bbcdaee227698550b11b4e63e2bf3eb0 |     
    arm      |           dhcp-4.4.3           | NOK | http://autobuild.buildroot.net/results/4b0a068b4b5a94484e593749d419766bec0db4a4 | ORPH
    arc      |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/7f0726058fc2b76dec05c060c11d15805e6ec1eb |     
    arc      |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/89381e0e44e280fb303b5e75c349cc142fe32333 |     
   nios2     |            libuwsc             | TIM | http://autobuild.buildroot.net/results/eef5f7b5faaaa35f96ee293d707b13644d244351 |     
    arm      |          ndisc6-1.0.5          | NOK | http://autobuild.buildroot.net/results/159da2a9d19b5328d270145f053c9f232043de27 | ORPH
   mipsel    |         nodejs-14.18.3         | NOK | http://autobuild.buildroot.net/results/88b7a77206bd259332331f199bebc06f2c967f51 |     
  mips64el   | tvheadend-1295dd2be863f5beb... | NOK | http://autobuild.buildroot.net/results/41e84a7276491cb02124b26b364d4903df670183 |     
    arm      | tvheadend-1295dd2be863f5beb... | NOK | http://autobuild.buildroot.net/results/f7ed139e0eed10015055af9f52d5884124890c10 |     
  riscv64    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/50e06d3b0a2611bdab3c4771201f0baa3e1d712d |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
