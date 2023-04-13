Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 351DFC77B61
	for <buildroot@archiver.kernel.org>; Thu, 13 Apr 2023 05:35:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6924941752;
	Thu, 13 Apr 2023 05:35:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6924941752
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bnJaDq2LHHUN; Thu, 13 Apr 2023 05:35:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3B93641894;
	Thu, 13 Apr 2023 05:35:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3B93641894
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 076A31BF288
 for <buildroot@lists.busybox.net>; Thu, 13 Apr 2023 05:35:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D383F40423
 for <buildroot@lists.busybox.net>; Thu, 13 Apr 2023 05:35:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D383F40423
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6chYQPo1pVvX for <buildroot@lists.busybox.net>;
 Thu, 13 Apr 2023 05:35:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C80D840146
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C80D840146
 for <buildroot@buildroot.org>; Thu, 13 Apr 2023 05:35:32 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 1F93AFF806
 for <buildroot@buildroot.org>; Thu, 13 Apr 2023 05:35:29 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Thu, 13 Apr 2023 05:35:29 -0000
Message-Id: <20230413053536.D383F40423@smtp2.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1681364130; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Un7v0/6phWv+IoddZ8pSgRyQ+P8gdbx9PXDdi6+UqiU=;
 b=khlHXc1/JQJ5zP0IEzvYpluo4rxYiDGiowey6WHbuIQDgz4C+EpAbV138Gm4uGITA706Rm
 IqVdl5nzMO4iGYw7d1tyG7TbvytVMkhJnLhzIVQnq1+hONITOBwVD8RS1uxhYIBP9q6th9
 o2OgaBMeKX+HJzboEqsm2kiR05/Bgi7hi8fFneOJV0PvoIpy0RvUVF09F3+Gsi9b4aTNgR
 7qDRYaXfw4AFhz4wzKPyjvGf78k7dkjO0ji/lBQhgRHpOnm/G09iohw2xMS5K9lGrnxYKw
 g2A8SLIVpCSzJ+70XScLEIW3gx6/d242vD8auDqWXt5dGF8gqGyK1T5VPM2sKw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=khlHXc1/
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-04-12
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

Autobuild statistics for 2023-04-12
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  | 17  |  7  |  0  | 24  |
    master   | 59  | 68  |  0  | 127 |

Classification of failures by reason for master
-----------------------------------------------

              host-pahole-1.24 | 9 
                host-go-1.19.8 | 4 
               host-qemu-7.2.0 | 4 
                       unknown | 4 
         host-gcc-final-11.3.0 | 3 
            host-binutils-2.37 | 2 
         host-gcc-final-10.4.0 | 2 
                    mpv-0.35.1 | 2 
                    olsr-0.9.8 | 2 
               xfsprogs-5.14.2 | 2 
                 agentpp-4.6.0 | 1 
                    apg-2.3.0b | 1 
                  bind-9.16.38 | 1 
              bubblewrap-0.7.0 | 1 
                busybox-1.36.0 | 1 
                   dante-1.4.3 | 1 
                    dust-0.8.1 | 1 
                elfutils-0.186 | 1 
             fontconfig-2.13.1 | 1 
fs/cloop/cloop.mk:33: /home... | 1 
fs/cramfs/cramfs.mk:46: /ho... | 1 
fs/jffs2/jffs2.mk:71: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
glibc-2.37-2-g9f8513dc64119... | 1 
                     gmp-6.2.1 | 1 
  gobject-introspection-1.72.0 | 1 
            host-binutils-2.39 | 1 
              host-rust-1.68.2 | 1 
host-sunxi-tools-1.4.2-168-... | 1 
               host-zstd-1.5.4 | 1 
                  kexec-2.0.26 | 1 
               libglib2-2.72.3 | 1 
              libsodium-1.0.18 | 1 
                  linux-6.1.14 | 1 
          lttng-modules-2.13.7 | 1 
 Makefile:724: target-finalize | 1 
                    musl-1.2.3 | 1 
            quickjs-2021-03-27 | 1 
          refpolicy-2.20220106 | 1 
              skalibs-2.12.0.1 | 1 
                xenomai-3.0.10 | 1 
                     zfs-2.1.7 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  sparc64    |         agentpp-4.6.0          | NOK | http://autobuild.buildroot.net/results/fe9188c4594c5094f3f7f5a5faffeca334529867 |     
    i586     |           apg-2.3.0b           | NOK | http://autobuild.buildroot.net/results/a3bd51711ede4a4bb0034157ed9d55379ab33943 |     
   sh4eb     |          bind-9.16.38          | NOK | http://autobuild.buildroot.net/results/129c3aa5b7b9df7dcc0087b359f6f6977f72be3c | ORPH
   x86_64    |        bubblewrap-0.7.0        | NOK | http://autobuild.buildroot.net/results/3016b2b8c7d35545aa9b351a3f12d2bb4adbe85b |     
   mips64    |         busybox-1.36.0         | NOK | http://autobuild.buildroot.net/results/d67c0861c04c2196cddf932576d8ce25aa96d104 | ORPH
 aarch64_be  |          dante-1.4.3           | NOK | http://autobuild.buildroot.net/results/2d3bb81c83c68f4c036740a4801fe3d48db84fa7 | ORPH
    mips     |           dust-0.8.1           | NOK | http://autobuild.buildroot.net/results/69028261b903640d2642e2b1fa5c898a0f0044eb | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/a2d5bf6a340d16481a5ac1424b84a4fd6d058bd7 | ORPH
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/251f45ddea1cbdf90672012c84208b8fe2983436 | ORPH
   s390x     | fs/cloop/cloop.mk:33: /home... | NOK | http://autobuild.buildroot.net/results/9946f6e335b62397bc8dc762a227b172405c1d99 |     
  mips64el   | fs/cramfs/cramfs.mk:46: /ho... | NOK | http://autobuild.buildroot.net/results/05a37f758b1a04192102da32fbba4bd88a722730 |     
powerpc64le  | fs/jffs2/jffs2.mk:71: /home... | NOK | http://autobuild.buildroot.net/results/00f05be53f7a107413fb60a906e971f9ec8b7ea1 |     
   nios2     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/9652e3b2659e538075c01d2a09f01bf40d58a0b6 |     
   armeb     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/ca3992a7ef27caaedf6aac5d59d944ecb5992111 |     
  sparc64    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/40e11403c912b01303ab81737efe1965721c5bf6 |     
  powerpc    | glibc-2.37-2-g9f8513dc64119... | NOK | http://autobuild.buildroot.net/results/d64149f0f449c208e61e656c0182a336cd94cb88 |     
  riscv64    |           gmp-6.2.1            | NOK | http://autobuild.buildroot.net/results/1e951d6ecf6210fb7031344abccdd00f177a38f1 | ORPH
    or1k     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/8eca7f5da93cc456db428886eb3f6c1a91f6a1ba | ORPH
 microblaze  |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/3e27c10c5598460fb5c81624873511640b245d38 |     
   mips64    |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/96fa7b084c9328d780d63a6d88931ff452c2f78c |     
    arm      |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/d0e27efe8d86781385fb6d715d54221761591c3a |     
   sparc     |     host-gcc-final-10.4.0      | NOK | http://autobuild.buildroot.net/results/c959ea5d51efb5983aa5c342767d0f7324b3941a |     
   armeb     |     host-gcc-final-10.4.0      | NOK | http://autobuild.buildroot.net/results/efbec7d3e7848d94787be947066156e7b23d80fe |     
   armeb     |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/4ada5553b88dd4e3c0827a5144002e1ce35ef75c |     
    mips     |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/e8fdd4cf17f5e17efbd66087c381952919e31add |     
   xtensa    |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/810c03274a7f2ce5b3f806a890b14f26d2e47c4a |     
   mips64    |         host-go-1.19.8         | NOK | http://autobuild.buildroot.net/results/f4f572f4b308709c96581c40e0ea90e4ac3ef4d9 |     
   mips64    |         host-go-1.19.8         | NOK | http://autobuild.buildroot.net/results/cc1e22d77891313cc2adf96962c88fb88792c0ff |     
  mips64el   |         host-go-1.19.8         | NOK | http://autobuild.buildroot.net/results/c7dce6be4d3c36b08e772ab252b3210b8a4e5443 |     
   mips64    |         host-go-1.19.8         | NOK | http://autobuild.buildroot.net/results/a49289055aa0e55fb7c05517bf17b54d323acec2 |     
   mips64    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/fd777d50a1d5fa70d5ad4e6b91fbe5162c326465 |     
powerpc64le  |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/719b2002cc00778162ee426367c4ed7118c249ba |     
  aarch64    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/4095ae36f5e02fe7fd58066a543d38b449fb2af0 |     
    mips     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/34a345a7979d8e152382e53fce5f40c2c4975671 |     
   mips64    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/86bf5c773b4fc13baca53c0871fee10c43e8c10a |     
    sh4a     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/4373b1376d69a9208cfc5f8b41c40b53355e4076 |     
   sh4aeb    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/168356538c329a1884d7cce1ed739cadfc527b01 |     
    arm      |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/a8884b892484efdbda50ae99abf5595a88701a0f |     
   nios2     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/ecd22d81d3d4f83637530377ef7391d32149b1f8 |     
 powerpc64   |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/f83a31f0bc67f35919b03433d65d080a47f38626 |     
    or1k     |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/3c43a3880486feba7b853f82cf4609ec9928de44 |     
    or1k     |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/02627383be05ebe5ecf3a25b115e73cc77a52966 |     
    or1k     |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/fb407d9cb5a8911a1052e370a441766efb108818 |     
    i686     |        host-rust-1.68.2        | NOK | http://autobuild.buildroot.net/results/6f3151bfcb494a8a5554fc8dd68f57b8cd3e8636 |     
    arm      | host-sunxi-tools-1.4.2-168-... | NOK | http://autobuild.buildroot.net/results/8b4fdac4ea61cc8299f2cf28da674bdc8a777de1 |     
microblazeel |        host-zstd-1.5.4         | NOK | http://autobuild.buildroot.net/results/201a5c822d61fd02f60663dc9322ff20b748aff3 |     
    sh4      |          kexec-2.0.26          | NOK | http://autobuild.buildroot.net/results/b8a619369ef25807cde0d151ce7a7522eff373f4 |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/68a69e1501b0ccc54dcef9b92562a6d99414bb73 |     
   arceb     |        libsodium-1.0.18        | NOK | http://autobuild.buildroot.net/results/beb23030b5f73cef322a6d883927a64c45c1474f |     
   mipsel    |          linux-6.1.14          | NOK | http://autobuild.buildroot.net/results/7b9c87ea207279f1ed75fa490ba6f189e56848ca | ORPH
    or1k     |      lttng-modules-2.13.7      | NOK | http://autobuild.buildroot.net/results/e0e58a212067a26d39fd1fd24f0218d48e35f647 |     
 aarch64_be  | Makefile:724: target-finalize  | NOK | http://autobuild.buildroot.net/results/20b1c384422fdb041c2e55e9b11834eaf315ba0b |     
   s390x     |           mpv-0.35.1           | NOK | http://autobuild.buildroot.net/results/87cbad75235c807de53397772e979b04f3dfa3f5 |     
 microblaze  |           mpv-0.35.1           | NOK | http://autobuild.buildroot.net/results/de782bcf1b2075afb63375b15a4ccd93f2c02598 |     
  powerpc    |           musl-1.2.3           | NOK | http://autobuild.buildroot.net/results/ba5d386f42f969df189fabcfe4304d6906707281 |     
   mipsel    |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/5d6efcd25368f2df52e97d5ad78f488e25b1c504 | ORPH
   x86_64    |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/f5a7765f7e20ee97cd9e73703976214b5c4e27e1 | ORPH
   armeb     |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/bcf6c9612264a53091728ef71bd1adb2f38a830a |     
   nios2     |      refpolicy-2.20220106      | NOK | http://autobuild.buildroot.net/results/ed27f3077c607e7239c8406877b7440c85cd4303 |     
    or1k     |        skalibs-2.12.0.1        | NOK | http://autobuild.buildroot.net/results/69bd567fabc398c91722de82f9aaad1fff7dba56 |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/047beeb75187b4111cc986eb11d76a16d59ccf32 |     
   sh4aeb    |            unknown             | NOK | http://autobuild.buildroot.net/results/af0106f06390d8e1954dcff2cd15380f3628949b |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/aa8de6ace9703bb7d99fca3b5ad67a83952e6bb5 |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/757aef8f60595b3fcb33b1bcc80ba7c9cacf42ce |     
   nios2     |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/264ba61eaf46f2135ec426deef3191be0595f196 |     
    i686     |        xfsprogs-5.14.2         | NOK | http://autobuild.buildroot.net/results/e8013d1f81c8c2eea04942815c2a6ce27a7f74d7 | ORPH
   nios2     |        xfsprogs-5.14.2         | NOK | http://autobuild.buildroot.net/results/cd6f66856dce4728f8a54da1a67cccd51f1206fc | ORPH
   x86_64    |           zfs-2.1.7            | NOK | http://autobuild.buildroot.net/results/a3c41d865354c9066965e22b8f721d5fc45b610a |     


Classification of failures by reason for 2023.02.x
--------------------------------------------------

                 agentpp-4.6.0 | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
               host-qemu-7.2.0 | 1 
        ltp-testsuite-20220930 | 1 
               madplay-0.15.2b | 1 
ripgrep-af6b6c543b224d348a8... | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 aarch64_be  |         agentpp-4.6.0          | NOK | http://autobuild.buildroot.net/results/8d8ee12835bf51084dd818443f91a7be399b4492 |     
   x86_64    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/0f2004da80ba44b37914d7496f69296af7a8d0cc |     
  mips64el   | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/afcf150f65f4aed887f98f313ee2ae3f5a82995b |     
  aarch64    |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/46898e53cdff067ad51f1b4374763e273309ef8c |     
 aarch64_be  |     ltp-testsuite-20220930     | NOK | http://autobuild.buildroot.net/results/c18320c4d2c5dabf4cca7ef4fcc36eee067c991c |     
    arm      |        madplay-0.15.2b         | NOK | http://autobuild.buildroot.net/results/be22f200d0640694bb15ceabf7214fddcb3b41b8 | ORPH
   armeb     | ripgrep-af6b6c543b224d348a8... | NOK | http://autobuild.buildroot.net/results/6a36652088b1bdc65c31c47edb8221a4d4b40bcb |     


Gitlab CI results for 2023-04-12
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
 TestAarch64Pages64kGlibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274904  | ORPH 
  TestAarch64Pages64kMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274905  | ORPH 
TestAarch64Pages64kuClibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274908  | ORPH 
      TestClangCompilerRT | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274593  | ORPH 
     TestCpioDracutUclibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274511  | ORPH 
           TestCrudiniPy3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274595  | ORPH 
                 TestExt2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274515  | ORPH 
...rch64GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275031  | ORPH 
...tlinAarch64GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275034  | ORPH 
...arch64MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275036  | ORPH 
...otlinAarch64MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275037  | ORPH 
...ch64UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275039  | ORPH 
...linAarch64UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275052  | ORPH 
...h64beGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275061  | ORPH 
...inAarch64beGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275062  | ORPH 
...64beUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275064  | ORPH 
...nAarch64beUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275065  | ORPH 
...750dUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275068  | ORPH 
...nArcle750dUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275070  | ORPH 
...ehs38GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275073  | ORPH 
...inArclehs38GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275076  | ORPH 
...hs38UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275078  | ORPH 
...nArclehs38UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275082  | ORPH 
...abihfGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275083  | ORPH 
...mebv7eabihfGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275086  | ORPH 
...eabihfMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275087  | ORPH 
...rmebv7eabihfMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275089  | ORPH 
...bihfUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275091  | ORPH 
...ebv7eabihfUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275093  | ORPH 
...5eabiGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275095  | ORPH 
...inArmv5eabiGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275096  | ORPH 
...v5eabiMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275097  | ORPH 
...linArmv5eabiMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275098  | ORPH 
...eabiUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275099  | ORPH 
...nArmv5eabiUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275102  | ORPH 
...abihfGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275112  | ORPH 
...Armv6eabihfGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275119  | ORPH 
...eabihfMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275123  | ORPH 
...nArmv6eabihfMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275127  | ORPH 
...bihfUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275132  | ORPH 
...rmv6eabihfUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275136  | ORPH 
...abihfGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275138  | ORPH 
...Armv7eabihfGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275141  | ORPH 
...eabihfMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275144  | ORPH 
...nArmv7eabihfMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275147  | ORPH 
...bihfUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275148  | ORPH 
...rmv7eabihfUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275152  | ORPH 
...mv7mUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275156  | ORPH 
...tlinArmv7mUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275158  | ORPH 
...8xxxUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275159  | ORPH 
...nM68k68xxxUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275162  | ORPH 
...fireUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275165  | ORPH 
...8kcoldfireUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275169  | ORPH 
...azebeGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275170  | ORPH 
...icroblazebeGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275173  | ORPH 
...lazebeMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275175  | ORPH 
...MicroblazebeMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275177  | ORPH 
...zebeUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275180  | ORPH 
...croblazebeUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275182  | ORPH 
...azeelGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275184  | ORPH 
...icroblazeelGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275186  | ORPH 
...lazeelMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275190  | ORPH 
...MicroblazeelMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275192  | ORPH 
...zeelUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275194  | ORPH 
...croblazeelUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275197  | ORPH 
...ips32GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275199  | ORPH 
...otlinMips32GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275201  | ORPH 
...Mips32MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275204  | ORPH 
...ootlinMips32MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275207  | ORPH 
...ps32UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275210  | ORPH 
...tlinMips32UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275212  | ORPH 
...s32elGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275214  | ORPH 
...linMips32elGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275218  | ORPH 
...ps32elMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275222  | ORPH 
...tlinMips32elMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275226  | ORPH 
...32elUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275230  | ORPH 
...inMips32elUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275232  | ORPH 
...2r5elGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275235  | ORPH 
...nMips32r5elGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275237  | ORPH 
...32r5elMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275240  | ORPH 
...inMips32r5elMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275243  | ORPH 
...r5elUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275248  | ORPH 
...Mips32r5elUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275250  | ORPH 
...2r6elGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275253  | ORPH 
...nMips32r6elGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275256  | ORPH 
...32r6elMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275258  | ORPH 
...inMips32r6elMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275260  | ORPH 
...r6elUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275263  | ORPH 
...Mips32r6elUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275265  | ORPH 
...eln32GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275269  | ORPH 
...Mips64eln32GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275273  | ORPH 
...4eln32MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275277  | ORPH 
...nMips64eln32MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275279  | ORPH 
...ln32UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275281  | ORPH 
...ips64eln32UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275283  | ORPH 
...64n32GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275284  | ORPH 
...inMips64n32GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275286  | ORPH 
...s64n32MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275288  | ORPH 
...linMips64n32MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275290  | ORPH 
...4n32UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275292  | ORPH 
...nMips64n32UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275295  | ORPH 
...eln32GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275297  | ORPH 
...ps64r6eln32GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275299  | ORPH 
...6eln32MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275301  | ORPH 
...ips64r6eln32MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275303  | ORPH 
...ln32UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275305  | ORPH 
...s64r6eln32UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275307  | ORPH 
...Nios2GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275310  | ORPH 
...ootlinNios2GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275316  | ORPH 
...nriscGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275319  | ORPH 
...linOpenriscGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275322  | ORPH 
...enriscMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275327  | ORPH 
...tlinOpenriscMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275333  | ORPH 
...riscUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275338  | ORPH 
...inOpenriscUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275341  | ORPH 
...440fpGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275346  | ORPH 
...owerpc440fpGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275350  | ORPH 
...c440fpMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275355  | ORPH 
...Powerpc440fpMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275357  | ORPH 
...40fpUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275360  | ORPH 
...werpc440fpUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275362  | ORPH 
...e5500GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275365  | ORPH 
...erpc64e5500GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275367  | ORPH 
...e6500GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275369  | ORPH 
...erpc64e6500GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275371  | ORPH 
...4e6500MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275373  | ORPH 
...werpc64e6500MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275376  | ORPH 
...ower8GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275379  | ORPH 
...c64lepower8GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275381  | ORPH 
...power8MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275383  | ORPH 
...pc64lepower8MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275385  | ORPH 
...ower8GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275389  | ORPH 
...rpc64power8GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275391  | ORPH 
...power8MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275393  | ORPH 
...erpc64power8MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275394  | ORPH 
...300c3GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275396  | ORPH 
...werpce300c3GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275398  | ORPH 
...e300c3MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275400  | ORPH 
...owerpce300c3MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275402  | ORPH 
...00c3UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275404  | ORPH 
...erpce300c3UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275406  | ORPH 
...500mcGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275409  | ORPH 
...werpce500mcGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275411  | ORPH 
...e500mcMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275413  | ORPH 
...owerpce500mcMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275416  | ORPH 
...00mcUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275419  | ORPH 
...erpce500mcUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275420  | ORPH 
...lp32dGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275425  | ORPH 
...lp64dGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275429  | ORPH 
...iscv64lp64dGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275433  | ORPH 
...4lp64dMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275435  | ORPH 
...Riscv64lp64dMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275440  | ORPH 
...p64dUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275442  | ORPH 
...scv64lp64dUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275445  | ORPH 
...0xz13GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275447  | ORPH 
...linS390xz13GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275451  | ORPH 
...Shsh4GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275455  | ORPH 
...ootlinShsh4GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275458  | ORPH 
...nShsh4MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275463  | ORPH 
...BootlinShsh4MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275465  | ORPH 
...hsh4UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275470  | ORPH 
...otlinShsh4UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275472  | ORPH 
...h4aebGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275473  | ORPH 
...linShsh4aebGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275477  | ORPH 
...sh4aebMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275480  | ORPH 
...tlinShsh4aebMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275483  | ORPH 
...arc64GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275484  | ORPH 
...tlinSparc64GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275486  | ORPH 
...rcv8UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275488  | ORPH 
...linSparcv8UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275492  | ORPH 
...X8664GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275494  | ORPH 
...ootlinX8664GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275495  | ORPH 
...nX8664MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275497  | ORPH 
...BootlinX8664MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275499  | ORPH 
...8664UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275501  | ORPH 
...otlinX8664UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275505  | ORPH 
...orei7GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275507  | ORPH 
...X8664corei7GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275509  | ORPH 
...corei7MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275512  | ORPH 
...nX8664corei7MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275514  | ORPH 
...rei7UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275520  | ORPH 
...8664corei7UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275522  | ORPH 
...664v2GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275524  | ORPH 
...tlinX8664v2GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275525  | ORPH 
...8664v2MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275527  | ORPH 
...otlinX8664v2MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275529  | ORPH 
...64v2UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275531  | ORPH 
...linX8664v2UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275533  | ORPH 
...664v3GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275535  | ORPH 
...tlinX8664v3GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275538  | ORPH 
...8664v3MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275541  | ORPH 
...otlinX8664v3MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275544  | ORPH 
...64v3UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275547  | ORPH 
...linX8664v3UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275551  | ORPH 
...664v4GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275555  | ORPH 
...tlinX8664v4GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275557  | ORPH 
...8664v4MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275559  | ORPH 
...otlinX8664v4MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275560  | ORPH 
...64v4UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275562  | ORPH 
...linX8664v4UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275564  | ORPH 
...core2GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275568  | ORPH 
...linX86core2GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275571  | ORPH 
...6core2MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275574  | ORPH 
...tlinX86core2MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275577  | ORPH 
...ore2UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275581  | ORPH 
...inX86core2UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275583  | ORPH 
...6i686GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275585  | ORPH 
...tlinX86i686GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275587  | ORPH 
...86i686MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275591  | ORPH 
...otlinX86i686MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275595  | ORPH 
...i686UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275597  | ORPH 
...linX86i686UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275599  | ORPH 
...lx60UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275601  | ORPH 
...ToolchainBuildrootMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274909  | ORPH 
...olchainBuildrootuClibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274910  | ORPH 
...xternalToolchainCCache | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274911  | ORPH 
...ernalToolchainCtngMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274914  | ORPH 
...rnalToolchainLinaroArm | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274927  | ORPH 
...ToolchainSourceryArmv4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274943  | ORPH 
...ToolchainSourceryArmv5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274980  | ORPH 
...ToolchainSourceryArmv7 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085275017  | ORPH 
     TestFileCapabilities | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274471  | ORPH 
               TestGitLab | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274504  | ORPH 
     TestGlibcAllTimezone | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274498  | ORPH 
...DefaultLimitedTimezone | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274499  | ORPH 
               TestGnupg2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274619  | ORPH 
           TestGst1Python | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274622  | ORPH 
                TestHWLoc | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274625  | ORPH 
              TestHighway | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274623  | ORPH 
           TestIPythonPy3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274628  | ORPH 
...InitSystemOpenrcRoFull | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274562  | ORPH 
...InitSystemOpenrcRwFull | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274564  | ORPH 
...ystemSystemdRoIfupdown | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274568  | ORPH 
...ystemSystemdRoNetworkd | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274574  | ORPH 
               TestIperf3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274627  | ORPH 
      TestIso9660Grub2EFI | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274525  | ORPH 
 TestIso9660Grub2External | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274527  | ORPH 
...0Grub2ExternalCompress | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274529  | ORPH 
   TestIso9660Grub2Hybrid | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274531  | ORPH 
 TestIso9660Grub2Internal | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274533  | ORPH 
...so9660SyslinuxExternal | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274535  | ORPH 
...slinuxExternalCompress | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274536  | ORPH 
...so9660SyslinuxInternal | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274539  | ORPH 
                TestKexec | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274630  | ORPH 
               TestLibJXL | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274633  | ORPH 
            TestLibshdata | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274634  | ORPH 
                 TestLsof | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274639  | ORPH 
                  TestLua | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274642  | ORPH 
              TestLuaHttp | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274659  | ORPH 
           TestLuaInotify | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274662  | ORPH 
              TestLuaLPeg | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274636  | ORPH 
          TestLuaLsqlite3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274640  | ORPH 
         TestLuaLuaArgon2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274644  | ORPH 
         TestLuaLuaAugeas | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274646  | ORPH 
           TestLuaLuaCffi | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274650  | ORPH 
        TestLuaLuaCqueues | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274651  | ORPH 
          TestLuaLuaExpat | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274674  | ORPH 
     TestLuaLuaFileSystem | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274676  | ORPH 
             TestLuaLuaGD | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274655  | ORPH 
           TestLuaLuaLdap | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274678  | ORPH 
          TestLuaLuaLyaml | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274666  | ORPH 
          TestLuaLuaPosix | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274683  | ORPH 
           TestLuaLuaSDL2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274668  | ORPH 
            TestLuaLuaSec | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274685  | ORPH 
         TestLuaLuaSocket | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274688  | ORPH 
           TestLuaLuacURL | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274653  | ORPH 
           TestLuaLuaossl | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274680  | ORPH 
         TestLuaLuasyslog | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274690  | ORPH 
           TestLuaLuazlib | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274672  | ORPH 
             TestLuaLunix | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274664  | ORPH 
             TestLuaLzlib | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274694  | ORPH 
             TestLuaRings | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274878  | ORPH 
              TestLuaUtf8 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274670  | ORPH 
               TestLuajit | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274643  | ORPH 
           TestLuajitHttp | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274661  | ORPH 
        TestLuajitInotify | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274663  | ORPH 
           TestLuajitLPeg | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274638  | ORPH 
       TestLuajitLsqlite3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274641  | ORPH 
      TestLuajitLuaArgon2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274645  | ORPH 
      TestLuajitLuaAugeas | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274648  | ORPH 
     TestLuajitLuaCqueues | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274652  | ORPH 
       TestLuajitLuaExpat | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274675  | ORPH 
  TestLuajitLuaFileSystem | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274677  | ORPH 
          TestLuajitLuaGD | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274658  | ORPH 
        TestLuajitLuaLdap | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274679  | ORPH 
       TestLuajitLuaLyaml | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274667  | ORPH 
       TestLuajitLuaPosix | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274684  | ORPH 
        TestLuajitLuaSDL2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274669  | ORPH 
         TestLuajitLuaSec | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274686  | ORPH 
      TestLuajitLuaSocket | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274689  | ORPH 
        TestLuajitLuacURL | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274654  | ORPH 
        TestLuajitLuaossl | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274681  | ORPH 
      TestLuajitLuasyslog | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274691  | ORPH 
        TestLuajitLuazlib | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274673  | ORPH 
          TestLuajitLunix | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274665  | ORPH 
          TestLuajitRings | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274879  | ORPH 
       TestLuajitTurbolua | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274895  | ORPH 
           TestLuajitUtf8 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274671  | ORPH 
                 TestLuvi | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274692  | ORPH 
                  TestLxc | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274693  | ORPH 
               TestMender | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274696  | ORPH 
             TestMsrTools | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274697  | ORPH 
               TestMtools | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274698  | ORPH 
                 TestNcdu | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274699  | ORPH 
              TestNetdata | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274700  | ORPH 
          TestNodeJSBasic | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274701  | ORPH 
         TestNodeJSModule | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274702  | ORPH 
               TestOctave | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274703  | ORPH 
                  TestOla | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274704  | ORPH 
              TestOpenJdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274705  | ORPH 
         TestOpenSshGlibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274706  | ORPH 
        TestOpenSshuClibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274708  | ORPH 
                 TestOpkg | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274709  | ORPH 
             TestPerftest | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274710  | ORPH 
                 TestPerl | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274711  | ORPH 
        TestPerlClassLoad | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274712  | ORPH 
         TestPerlDBDmysql | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274713  | ORPH 
     TestPerlEncodeDetect | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274714  | ORPH 
          TestPerlGDGraph | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274715  | ORPH 
       TestPerlHTMLParser | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274716  | ORPH 
TestPerlIOSocketMulticast | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274717  | ORPH 
      TestPerlIOSocketSSL | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274718  | ORPH 
 TestPerlLWPProtocolhttps | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274720  | ORPH 
         TestPerlMailDKIM | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274721  | ORPH 
              TestPerlX10 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274722  | ORPH 
        TestPerlXMLLibXML | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274723  | ORPH 
       TestPerllibwwwperl | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274719  | ORPH 
              TestPhpApcu | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274724  | ORPH 
            TestPhpLuaLua | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274726  | ORPH 
         TestPhpLuaLuajit | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274728  | ORPH 
               TestPhpPam | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274730  | ORPH 
          TestPhpPeclDbus | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274731  | ORPH 
                 TestPixz | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274734  | ORPH 
          TestPolkitInitd | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274736  | ORPH 
        TestPolkitSystemd | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274738  | ORPH 
         TestProsodyLua51 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274742  | ORPH 
        TestProsodyLuajit | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274743  | ORPH 
         TestPy3BmapTools | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274591  | ORPH 
              TestPyNdiff | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274837  | ORPH 
            TestPython3Py | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274745  | ORPH 
         TestPython3PyPyc | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274747  | ORPH 
           TestPython3Pyc | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274749  | ORPH 
         TestPythonAugeas | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274758  | ORPH 
           TestPythonAvro | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274767  | ORPH 
         TestPythonHwdata | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274811  | ORPH 
       TestPythonPahoMQTT | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274817  | ORPH 
     TestPythonPy3Aexpect | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274754  | ORPH 
        TestPythonPy3Argh | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274756  | ORPH 
       TestPythonPy3Attrs | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274757  | ORPH 
    TestPythonPy3Autobahn | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274763  | ORPH 
     TestPythonPy3Automat | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274765  | ORPH 
   TestPythonPy3Bitstring | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274769  | ORPH 
       TestPythonPy3Boto3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274772  | ORPH 
    TestPythonPy3Botocore | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274775  | ORPH 
         TestPythonPy3Can | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274777  | ORPH 
        TestPythonPy3Cbor | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274778  | ORPH 
       TestPythonPy3Click | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274779  | ORPH 
   TestPythonPy3Colorzero | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274782  | ORPH 
  TestPythonPy3Constantly | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274784  | ORPH 
   TestPythonPy3Construct | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274786  | ORPH 
    TestPythonPy3Crossbar | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274787  | ORPH 
TestPythonPy3Cryptography | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274788  | ORPH 
    TestPythonPy3DBusFast | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274789  | ORPH 
    TestPythonPy3DBusNext | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274790  | ORPH 
  TestPythonPy3Dicttoxml2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274791  | ORPH 
      TestPythonPy3Distro | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274793  | ORPH 
      TestPythonPy3Django | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274794  | ORPH 
    TestPythonPy3Dtschema | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274795  | ORPH 
       TestPythonPy3Flask | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274796  | ORPH 
...honPy3FlaskExpectsJson | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274797  | ORPH 
         TestPythonPy3Git | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274800  | ORPH 
      TestPythonPy3Gitdb2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274803  | ORPH 
       TestPythonPy3GnuPG | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274804  | ORPH 
     TestPythonPy3Gobject | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274806  | ORPH 
    TestPythonPy3Gpiozero | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274809  | ORPH 
        TestPythonPy3Hkdf | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274810  | ORPH 
 TestPythonPy3Incremental | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274812  | ORPH 
    TestPythonPy3Iptables | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274813  | ORPH 
    TestPythonPy3Jmespath | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274814  | ORPH 
    TestPythonPy3Libftdi1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274631  | ORPH 
...PythonPy3MagicWormhole | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274815  | ORPH 
       TestPythonPy3Munch | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274816  | ORPH 
     TestPythonPy3Passlib | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274818  | ORPH 
     TestPythonPy3Pexpect | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274819  | ORPH 
      TestPythonPy3PyAlsa | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274824  | ORPH 
      TestPythonPy3Pynacl | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274836  | ORPH 
      TestPythonPy3Pytest | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274838  | ORPH 
...PythonPy3PytestAsyncio | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274839  | ORPH 
      TestPythonPy3Pyyaml | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274840  | ORPH 
      TestPythonPy3Qrcode | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274842  | ORPH 
         TestPythonPy3RSA | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274849  | ORPH 
     TestPythonPy3RpiGpio | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274846  | ORPH 
  TestPythonPy3S3transfer | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274854  | ORPH 
       TestPythonPy3SciPy | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274856  | ORPH 
...thonPy3ServiceIdentity | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274858  | ORPH 
      TestPythonPy3Smmap2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274859  | ORPH 
      TestPythonPy3Spake2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274862  | ORPH 
        TestPythonPy3Treq | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274865  | ORPH 
     TestPythonPy3Twisted | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274868  | ORPH 
       TestPythonPy3Txaio | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274871  | ORPH 
    TestPythonPy3Txtorcon | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274873  | ORPH 
      TestPythonPy3Ubjson | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274874  | ORPH 
...y3UnitTestXmlReporting | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274875  | ORPH 
       TestPythonPy3rtoml | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274852  | ORPH 
         TestPythonPybind | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274834  | ORPH 
             TestRdmaCore | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274876  | ORPH 
                TestRedis | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274877  | ORPH 
                 TestRust | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274880  | ORPH 
              TestRustBin | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274881  | ORPH 
                   TestS6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274882  | ORPH 
         TestS6Networking | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274883  | ORPH 
      TestS6PortableUtils | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274885  | ORPH 
                 TestS6Rc | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274888  | ORPH 
...ELinuxExtraModulesDirs | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274495  | ORPH 
             TestStressNG | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274890  | ORPH 
                 TestSudo | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274892  | ORPH 
             TestSyslogNg | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274893  | ORPH 
                 TestTmux | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274894  | ORPH 
TestUbootOpensslPkgConfig | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274898  | ORPH 
                   TestZ3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274899  | ORPH 
             TestZerofree | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274900  | ORPH 
             TestZfsGlibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274901  | ORPH 
              TestZfsMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274902  | ORPH 
            TestZfsUclibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/4085274903  | ORPH 



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
