Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E80C6C77B7C
	for <buildroot@archiver.kernel.org>; Fri, 12 May 2023 05:29:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9040142D3F;
	Fri, 12 May 2023 05:29:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9040142D3F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0xlld_tZideT; Fri, 12 May 2023 05:29:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5877142D39;
	Fri, 12 May 2023 05:29:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5877142D39
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EC5201BF593
 for <buildroot@lists.busybox.net>; Fri, 12 May 2023 05:29:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BD47784074
 for <buildroot@lists.busybox.net>; Fri, 12 May 2023 05:29:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BD47784074
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4PxAbyytrCmj for <buildroot@lists.busybox.net>;
 Fri, 12 May 2023 05:29:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BCEEF84069
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BCEEF84069
 for <buildroot@buildroot.org>; Fri, 12 May 2023 05:29:27 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id E766260008
 for <buildroot@buildroot.org>; Fri, 12 May 2023 05:29:24 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Fri, 12 May 2023 05:29:24 -0000
Message-Id: <20230512052929.BD47784074@smtp1.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1683869365; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=nSzLlmjTXB9qdTOrlPtdF7EV84ooczzAc19u5wzu3s0=;
 b=GECyBmMCnvvOm2O2VL6bwPUaIRJs3JaIbDVJ63U19WzHXpDFlcrBAG1e51/VpDn9HLb9zq
 Ba+LrMhdmtnLPkGoTo4+mpasUzCb3lXbi0Y7voF9frag7BlpgNhx0sblBjtoFMTHKHL6aA
 gnTHjVYWoYZpute/cYVraIM+NEanG8R/kOviJXfRv2TpgQF3+lTF7DQ7/7RSr6LwPMM1cP
 kjyBZAc9LOUWf4g0wfUHoW5rm9+BWQgPLABZPmEPaODiq9/z7am6rO9SIxbBwx3fQxkWdo
 6Z6JYwJYJmgrF+gdwkVsOwPo+q0dL6NO9ZW4ZLtRXNCLyeWX3Gts7Ceu6J3O7Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=GECyBmMC
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-05-11
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

Autobuild statistics for 2023-05-11
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  |  5  |  1  |  0  |  6  |
  2023.02.x  |  8  |  7  |  0  | 15  |
    master   | 79  | 73  |  2  | 154 |

Classification of failures by reason for master
-----------------------------------------------

               host-qemu-7.2.0 | 7 
               syslog-ng-4.1.1 | 5 
            host-binutils-2.38 | 4 
         host-gcc-final-10.4.0 | 3 
                   linux-6.3.1 | 3 
                       unknown | 3 
                 coreutils-9.3 | 2 
                elfutils-0.186 | 2 
glibc-2.37-2-g9f8513dc64119... | 2 
         gobject-introspection | 2 
         host-gcc-final-11.3.0 | 2 
              host-rust-1.68.2 | 2 
                    olsr-0.9.8 | 2 
                   perl-5.36.1 | 2 
                 agentpp-4.6.0 | 1 
                     audit-3.1 | 1 
                   bird-2.0.11 | 1 
                  boost-1.82.0 | 1 
                    brltty-6.5 | 1 
              erlang-22.3.4.22 | 1 
            flatbuffers-23.3.3 | 1 
                     frr-8.4.2 | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
                 haproxy-2.6.9 | 1 
            host-binutils-2.39 | 1 
             host-delve-1.20.2 | 1 
         host-gcc-final-12.2.0 | 1 
host-gdb-arc-2020.09-releas... | 1 
                host-go-1.19.9 | 1 
host-heimdal-f4faaeaba371ff... | 1 
     host-moby-buildkit-0.11.6 | 1 
                  jack2-1.9.21 | 1 
                  kexec-2.0.26 | 1 
               libglib2-2.76.1 | 1 
                 libnss-3.89.1 | 1 
          linux-5.10.162-cip24 | 1 
                 mesa3d-23.0.3 | 1 
            ocf-linux-20171122 | 1 
                 opensc-0.22.0 | 1 
                     php-8.2.5 | 1 
                     pv-1.6.20 | 1 
                    sdl-1.2.15 | 1 
                   trinity-1.9 | 1 
ulog-0389d243352255f6182326... | 1 
               xfsprogs-5.14.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |         agentpp-4.6.0          | NOK | http://autobuild.buildroot.net/results/1b9d32379383dcf3d42abcf3bba1f2d3d83ef48a |     
    arm      |           audit-3.1            | NOK | http://autobuild.buildroot.net/results/8aa804626ae5aff1db89f9481c5623730f4347c2 |     
    arm      |          bird-2.0.11           | NOK | http://autobuild.buildroot.net/results/dd2c8cdb03d6619c5b15ed04ca6e991fa672c732 |     
   arceb     |          boost-1.82.0          | NOK | http://autobuild.buildroot.net/results/e1703efdc24d9b6c067603a9efab672cf13cc946 |     
powerpc64le  |           brltty-6.5           | NOK | http://autobuild.buildroot.net/results/9d73dd483deea8e275487459061f6c45fff7edf9 |     
    i686     |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/1b8e68977a654a599fbf3ae9b186b2101d5b3eed | ORPH
    sh4a     |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/f3ff6f07228e3694eee6f3953ac9a4cbdfb61ced | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/cec57f1f431fa2edb932292079c5d839f40548d6 | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/b75597edbb96dd1dce3e878a28472a29e2431c48 | ORPH
   mipsel    |        erlang-22.3.4.22        | NOK | http://autobuild.buildroot.net/results/8321595ff088707b9e6b9543a85387047a1f188e |     
    arm      |       flatbuffers-23.3.3       | NOK | http://autobuild.buildroot.net/results/9ef5f45732b76b1ac344b430f996278aa318a1c1 |     
   xtensa    |           frr-8.4.2            | NOK | http://autobuild.buildroot.net/results/7425dc6559c30dd1b04b16a4b9be265dae3eb834 |     
    i686     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/813e7c08e64d616f0b4929ee67df3c23aa0d42dd |     
   nios2     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/fdf298a21a2ff8846eaf671588e4dbb664c21d90 |     
  powerpc    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/c821dae3f7c5c118a655b83f6f5bedfbe5f8b583 |     
    arm      | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/adba8f87a3fd2020294bb727d1d280c5e981cadf |     
  powerpc    | glibc-2.37-2-g9f8513dc64119... | NOK | http://autobuild.buildroot.net/results/6e2b690218e42ba976778e1d5f840a37529a0994 |     
 powerpc64   | glibc-2.37-2-g9f8513dc64119... | NOK | http://autobuild.buildroot.net/results/4fb215a5c13ca5b0dd7b135e1988b533c5c3edc3 |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/6244e23534867c3f919e54f293e1c9dd1ed59e0f |     
   armeb     |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/4c9334a6d3eae29d192ab74e8bbf426895a56c86 |     
 aarch64_be  |         haproxy-2.6.9          | NOK | http://autobuild.buildroot.net/results/640aeae06a011e60a0c6cada70a9a184192f9927 |     
  mips64el   |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/c2cd7353b5c2e232193183f2e2ca69f2c1ef4fb7 |     
   s390x     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/c900ef42bea553be98ca7768aeadba776d62717a |     
  aarch64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/a08c92f170a6f88f5fed844c2f51e0cf2b1d68d3 |     
 microblaze  |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/04e915c56e75775c9aa3e4b24407b7799f6e94b2 |     
  sparc64    |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/d19ad6dc7ba2021e15d1c025694347892c45b85e |     
  riscv64    |       host-delve-1.20.2        | NOK | http://autobuild.buildroot.net/results/56c73fbd76a5c95d734400985db6766f63b9a980 |     
   sparc     |     host-gcc-final-10.4.0      | NOK | http://autobuild.buildroot.net/results/395f85f49d39b6b14c50322a35d9d9d284aaba67 |     
   sparc     |     host-gcc-final-10.4.0      | NOK | http://autobuild.buildroot.net/results/f2f97604fbdc64541f9b086ebf4e6a3146e0e0b1 |     
    or1k     |     host-gcc-final-10.4.0      | NOK | http://autobuild.buildroot.net/results/e0adcb20e1b026667bbaf3abb29715aad4e4d2ed |     
 microblaze  |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/00abdeec05dffa53990dd0cd5b34831212b929cd |     
  powerpc    |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/a2b047cd61c75a46815979545dd72f85448dbf25 |     
microblazeel |     host-gcc-final-12.2.0      | NOK | http://autobuild.buildroot.net/results/24c90f3e30f0f85d6a6a6dcdfba6cb3600f32f18 |     
   arceb     | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/b1abe43a8a68babbdd6f1fe4d6e1da54c8a06c61 | ORPH
  mips64el   |         host-go-1.19.9         | NOK | http://autobuild.buildroot.net/results/502ab553484d3d40e1b3f883a6852792d27e2170 |     
    or1k     | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/89831f4cea83993d6100d04a1d64f368d6081c66 | ORPH
    arm      |   host-moby-buildkit-0.11.6    | NOK | http://autobuild.buildroot.net/results/8d016966fa5dea46a73cc556b7d80145fa34f337 |     
   s390x     |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/f8affabe29f5f5eda1ab5b6ae01555d8eecb015d |     
   nios2     |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/d82e4c34721185c0415bfc494bc55559a06f4b29 |     
    i686     |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/387b407cdbafd45451e896a5e5a563b11c95df87 |     
  powerpc    |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/e997dd6c7da891135e7017feb00c287ece8b5c2c |     
 powerpc64   |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/ddf9ece80dd42793ea063b26b2317dd78f999798 |     
  sparc64    |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/0971a1f9386dc1cf2b7c3fa050ada55e6bf2e1bd |     
  aarch64    |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/79fbf87ce6eb108dc8a283a2dcb1ef0199e612c0 |     
    mips     |        host-rust-1.68.2        | NOK | http://autobuild.buildroot.net/results/c443b636ed8a25877db5b44bba1c6f7c948fe2e5 |     
   armeb     |        host-rust-1.68.2        | NOK | http://autobuild.buildroot.net/results/21c992ff02311a1a2e272006516a89c3a75753ae |     
    m68k     |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/f6a6314b292addd7f0b4118420386becb16d88ab |     
    m68k     |          kexec-2.0.26          | NOK | http://autobuild.buildroot.net/results/436d0b3ee7747dcf65c9a70dc88422136cf6fd46 |     
   sparc     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/23676958011330d20889799f3287456d8a659a0d |     
    arm      |         libnss-3.89.1          | NOK | http://autobuild.buildroot.net/results/688661a71dd514e338f93f6c7fe27b216c3beb16 |     
   mipsel    |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/99377c95f8228f0058fc9c77620b474b69fec32d | ORPH
  mips64el   |          linux-6.3.1           | NOK | http://autobuild.buildroot.net/results/e9e1dbd1edf7db2e5848d4c5e60293b58cae75b1 | ORPH
   mips64    |          linux-6.3.1           | NOK | http://autobuild.buildroot.net/results/df47d61537a16a7393439ed4f19d0c97472dc946 | ORPH
  mips64el   |          linux-6.3.1           | NOK | http://autobuild.buildroot.net/results/f2a3de28c5ed71685a1bb9c29c0df138e149385b | ORPH
   s390x     |         mesa3d-23.0.3          | NOK | http://autobuild.buildroot.net/results/7e3cd8ac9e4d275c633c4477fe9f8958a73e774a |     
microblazeel |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/0c17f5f50391b7096c2498687b0b039bf10f790d | ORPH
microblazeel |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/3141e68e9a348e4d9dff394ee02ed228c3b56f29 | ORPH
  riscv32    |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/214daa1a2553a61c1a6ef1873e445438d6582253 | ORPH
   mips64    |         opensc-0.22.0          | NOK | http://autobuild.buildroot.net/results/15b641eeab6470e90f5ebc78444d56e107efc14b |     
   xtensa    |          perl-5.36.1           | NOK | http://autobuild.buildroot.net/results/d8351b61065b7d09325ad264fd423dc373bc7e6b |     
   arceb     |          perl-5.36.1           | NOK | http://autobuild.buildroot.net/results/e2e1cee42787b35cd0038a1ef14cf5a8cb1f44ea |     
    or1k     |           php-8.2.5            | NOK | http://autobuild.buildroot.net/results/4a111b387bc66893edb3e5fe235107f56ee6714f |     
   armeb     |           pv-1.6.20            | NOK | http://autobuild.buildroot.net/results/8897a0d18055d0cd1bc0c443b386142a973f4008 | ORPH
    sh4      |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/29c44926adf56454582ce5263e47987aadea3520 | ORPH
 microblaze  |        syslog-ng-4.1.1         | NOK | http://autobuild.buildroot.net/results/ecba4aefdd2b1cb0ce980c0e8b638e58b7e23d3a |     
    mips     |        syslog-ng-4.1.1         | NOK | http://autobuild.buildroot.net/results/d272139f59bd92afa49da3a8a49143cad03a127c |     
   mipsel    |        syslog-ng-4.1.1         | NOK | http://autobuild.buildroot.net/results/cd7ea801aa3bcc7ce5921777783cb973356fd015 |     
 powerpc64   |        syslog-ng-4.1.1         | NOK | http://autobuild.buildroot.net/results/cbf133272d503249d967419512d644de095da2e6 |     
    i686     |        syslog-ng-4.1.1         | NOK | http://autobuild.buildroot.net/results/88d3cc30da6c2db50e295a7d39b22c095c2dc13d |     
  aarch64    |          trinity-1.9           | NOK | http://autobuild.buildroot.net/results/c14e7119d084a275c86dcd52242081b96b7dbd6d | ORPH
  sparc64    | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/6d7d0d2aa9696af20c46e585d9316a0cf7da7fa0 |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/8da55061d8e6044c8d138eafea59c4bc7b48df6e |     
   sh4aeb    |            unknown             | NOK | http://autobuild.buildroot.net/results/f3cc06c9ae999ac63c68a15c91a6348b27eb7781 |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/4c41d2847f803765dcabc0e42b2bc60a124bde09 |     
    mips     |        xfsprogs-5.14.2         | NOK | http://autobuild.buildroot.net/results/e5a67ea3edadfa42a609ba511ecd03befec55c13 | ORPH


Classification of failures by reason for 2022.02.x
--------------------------------------------------

            igd2-for-linux-2.1 | 1 


Detail of failures for 2022.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/ce3f0ce1452a16fe2786e01fe662551990cfe1b4 |     


Classification of failures by reason for 2023.02.x
--------------------------------------------------

                 agentpp-4.6.0 | 1 
                     efivar-38 | 1 
                host-go-1.19.9 | 1 
               libdeflate-1.15 | 1 
               libmdbx-0.11.14 | 1 
                     vdr-2.6.3 | 1 
                     znc-1.8.2 | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |         agentpp-4.6.0          | NOK | http://autobuild.buildroot.net/results/16e17425f95fea608571aebdd3c3ed26efb70a13 |     
  mips64el   |           efivar-38            | NOK | http://autobuild.buildroot.net/results/d3e4bf9b791f0ca5c70782a6644d86ec3131cdec |     
  mips64el   |         host-go-1.19.9         | NOK | http://autobuild.buildroot.net/results/dbd04a589a50bf24f20e26b8768caa3e02c28448 |     
    arm      |        libdeflate-1.15         | NOK | http://autobuild.buildroot.net/results/37fde6570a00fc6e417f8a78ac26a4cf29f7b89c |     
  mips64el   |        libmdbx-0.11.14         | NOK | http://autobuild.buildroot.net/results/5f06a6eab21c29a50299c5ce4e9d3190bc53e62e |     
   xtensa    |           vdr-2.6.3            | NOK | http://autobuild.buildroot.net/results/116967637f5b1cd6c4ec8d140932cce20c1bd33c |     
  riscv64    |           znc-1.8.2            | NOK | http://autobuild.buildroot.net/results/de2d54b27620a3a8bf237ae08a99264e8bda750f |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
