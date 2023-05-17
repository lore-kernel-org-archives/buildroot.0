Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C3AFC77B75
	for <buildroot@archiver.kernel.org>; Wed, 17 May 2023 05:32:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 97CE3841A0;
	Wed, 17 May 2023 05:32:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 97CE3841A0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jb4jLv5296K2; Wed, 17 May 2023 05:32:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 668F88425F;
	Wed, 17 May 2023 05:32:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 668F88425F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 43DA11BF83A
 for <buildroot@lists.busybox.net>; Wed, 17 May 2023 05:32:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C76FD6FE6F
 for <buildroot@lists.busybox.net>; Wed, 17 May 2023 05:32:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C76FD6FE6F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2mIYav6QB4is for <buildroot@lists.busybox.net>;
 Wed, 17 May 2023 05:32:12 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7688661373
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7688661373
 for <buildroot@buildroot.org>; Wed, 17 May 2023 05:32:11 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 3B0111BF204
 for <buildroot@buildroot.org>; Wed, 17 May 2023 05:32:08 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Wed, 17 May 2023 05:32:08 -0000
Message-Id: <20230517053213.C76FD6FE6F@smtp3.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1684301528; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=7DeJYGLwi8Tdby06xbruG2BBkE2VGigUTOkZDkf7Q2M=;
 b=L4VGeGu9DZUTTQ5Vymoi/66VOxWbII2Ab9yetyxi4jbmIds74K8UbG7ton892WSi5SgAHj
 /TtxXfBqHQuY6IuXOLHRLPoVqx8Q+CUwRPjQG6wYwjHgbjDKw59ZCz22FiCnzdMOOCtK8M
 2QqtfS6Ak7HDspOB+a6P10blvMb6TJp2vuVvrY2xsgzxSgcOS9oqDTlCi6CF4tN+uHF7af
 jPF7G1ijElc3kxLZkp8chkgu7Dy1wAkrSTF3yyMd6GOcU3wz0AcDpUUW1JSL7axhI0OPO1
 TZ3LHzsJWiORByOHaIGZnSeX+GO5r+rWQz1cu+GZMN0dvK35H2MJ1zXfWIXMhg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=L4VGeGu9
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-05-16
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

Autobuild statistics for 2023-05-16
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  |  2  |  3  |  0  |  5  |
  2023.02.x  |  6  |  3  |  0  |  9  |
    master   | 66  | 62  |  1  | 129 |

Classification of failures by reason for master
-----------------------------------------------

  gobject-introspection-1.74.0 | 4 
                 agentpp-4.6.0 | 3 
                       unknown | 3 
           at-spi2-core-2.48.2 | 2 
                   bird-2.0.11 | 2 
                 coreutils-9.3 | 2 
                elfutils-0.186 | 2 
host-heimdal-f4faaeaba371ff... | 2 
               libcap-ng-0.8.3 | 2 
                  libmnl-1.0.5 | 2 
        ltp-testsuite-20230127 | 2 
package/sdl2_net/sdl2_net.m... | 2 
           sdl2_net-legal-info | 2 
                 uclibc-1.0.43 | 2 
                    zeek-4.1.1 | 2 
                     audit-3.1 | 1 
              dropbear-2022.83 | 1 
                     efivar-38 | 1 
fs/ubi/ubi.mk:51: /home/bui... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
glibc-2.37-2-g9f8513dc64119... | 1 
                gnu-efi-3.0.15 | 1 
         gobject-introspection | 1 
                haveged-1.9.18 | 1 
            host-binutils-2.37 | 1 
            host-binutils-2.38 | 1 
            host-binutils-2.39 | 1 
         host-gcc-final-11.3.0 | 1 
              host-rust-1.68.2 | 1 
              libgcrypt-1.10.1 | 1 
     linux-5.10.162-cip24-rt10 | 1 
                   linux-6.3.2 | 1 
                 openal-1.22.0 | 1 
                 opensc-0.22.0 | 1 
   openvmtools-11.3.5-18557794 | 1 
                     php-8.2.6 | 1 
               poppler-22.10.0 | 1 
sconeserver-8d1935919a20133... | 1 
             stress-ng-0.15.07 | 1 
               syslog-ng-4.1.1 | 1 
             tpm-tools-1.3.9.1 | 1 
uclibc-ng-test-6790eafe897b... | 1 
                 wolfssl-5.5.3 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   s390x     |         agentpp-4.6.0          | NOK | http://autobuild.buildroot.net/results/6cf302b2f30c220277d456ba443cffe6ea3c7423 |     
powerpc64le  |         agentpp-4.6.0          | NOK | http://autobuild.buildroot.net/results/d9235ac6c9f9cdbe7347c7268056f4a85a2844f1 |     
  riscv32    |         agentpp-4.6.0          | NOK | http://autobuild.buildroot.net/results/7ff672f87ccd2540862535c0cdee12d87c41c11e |     
  mips64el   |      at-spi2-core-2.48.2       | NOK | http://autobuild.buildroot.net/results/f27a63fd64f551743858e6b8d339d1f1e695a95f |     
 aarch64_be  |      at-spi2-core-2.48.2       | NOK | http://autobuild.buildroot.net/results/1de40bb578d20f2b1e5de663d3cc3815e75fb4cd |     
    i586     |           audit-3.1            | NOK | http://autobuild.buildroot.net/results/fc5aa2807b62ef0ddbdac301926789600045c216 |     
 powerpc64   |          bird-2.0.11           | NOK | http://autobuild.buildroot.net/results/a0d88cf0e6df8b7e6e6ae991bd9f115e1b448853 |     
    or1k     |          bird-2.0.11           | NOK | http://autobuild.buildroot.net/results/01dae2f1dbbc2dbd90751d8b1be13a8800668a79 |     
   armeb     |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/eafc9629c3b81f2bb030ad2051e774fdc2f56339 | ORPH
microblazeel |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/00a22ab6780d7654aa226c24510816a32a9a8752 | ORPH
  riscv64    |        dropbear-2022.83        | NOK | http://autobuild.buildroot.net/results/464e1dd512118199f3a51a83eb0382b1c51aec96 |     
    arm      |           efivar-38            | NOK | http://autobuild.buildroot.net/results/9862a34dbb5e10407966f78c3b33bb9b4b5a1b55 |     
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/ef0065cec781b2e8a168d3287ed1bedbdcc38942 | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/3ee6d80fddad3d6f4ba8ada7e34224811a1a1c82 | ORPH
  powerpc    | fs/ubi/ubi.mk:51: /home/bui... | NOK | http://autobuild.buildroot.net/results/313148b54575b6ce698db71244a36c593cf6df89 |     
   mipsel    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/3f40723aa85f435ce4c90beac763593ba191d10f |     
   nios2     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/cfc57526db235818d1e7410c80d8818154e38e7b |     
  powerpc    | glibc-2.37-2-g9f8513dc64119... | NOK | http://autobuild.buildroot.net/results/f913ab140372a1b0c727b0ae6400001fc46bccce |     
  mips64el   |         gnu-efi-3.0.15         | NOK | http://autobuild.buildroot.net/results/46479b7c1d5413494335a3db6fb3fb2fbc60d275 |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/8953d28df0c2177e09061530a1fd03e26f9744c3 |     
  sparc64    |  gobject-introspection-1.74.0  | NOK | http://autobuild.buildroot.net/results/b46d9ed5fe924472c403ec56db133b723bba988a | ORPH
    sh4      |  gobject-introspection-1.74.0  | NOK | http://autobuild.buildroot.net/results/86ed651cd1273eb90d03edbce38ecbb287777208 | ORPH
   s390x     |  gobject-introspection-1.74.0  | NOK | http://autobuild.buildroot.net/results/80838e5c660740f656a44ceef52430be35bead92 | ORPH
   nios2     |  gobject-introspection-1.74.0  | NOK | http://autobuild.buildroot.net/results/8d8b5a0e321a3c14b86ff2c290146602dd7df914 | ORPH
    i686     |         haveged-1.9.18         | NOK | http://autobuild.buildroot.net/results/35a9865a8c1cb037f0e1274012632cb1f2a25e95 |     
   s390x     |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/bff7260381a2cef757d596c68cc51375b8d457b2 |     
  riscv64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/931cca933333ef9a694f84617e3a9bd47e28d8b8 |     
  riscv64    |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/30ea373945d7cef21b3e6cea3e79bd86d5a5ade3 |     
 microblaze  |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/8f1d2e5fc5407cca81e7606874e03b2dc152c68c |     
   s390x     | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/1630dd7182d1f56a3dc1e9f649f489a7bddba207 | ORPH
 aarch64_be  | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/8ea2eeb8456c45190523512b1819dfd6ba4f2ad2 | ORPH
    i586     |        host-rust-1.68.2        | NOK | http://autobuild.buildroot.net/results/577294e416a858e44e27cbd2af53587e02015c47 |     
  riscv64    |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/746577426e73db64952dc98adc808d0e6f2625aa |     
  riscv64    |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/fe3497fd5082fcf845dce4c8f21f2300567ce3f6 |     
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/6e085dce0156ba492e0dc0471253a0d4d81a35e8 | ORPH
    arm      |          libmnl-1.0.5          | NOK | http://autobuild.buildroot.net/results/15f6dc103eec7bdeb5020acbc0ae99dc97c00e4e |     
    arc      |          libmnl-1.0.5          | NOK | http://autobuild.buildroot.net/results/e0a4929b738bd6da0d3434e8c349ae9d0d929c06 |     
    arc      |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/6475d2f8415ca24cfb65e9c3a8a1527a938fab16 | ORPH
   nios2     |          linux-6.3.2           | NOK | http://autobuild.buildroot.net/results/eb331ae26cff5404fe2cd31388fe1badb1ce9ae6 | ORPH
   x86_64    |     ltp-testsuite-20230127     | NOK | http://autobuild.buildroot.net/results/9ac1e359a829d06231f0d8a4f8d540a47bd94a11 |     
microblazeel |     ltp-testsuite-20230127     | NOK | http://autobuild.buildroot.net/results/ca48bf4bb7d45b3c2d3f6ef7efdb7685387dd7f2 |     
    mips     |         openal-1.22.0          | NOK | http://autobuild.buildroot.net/results/4c82ef5495e72879b28c158f108b18a746486ea8 | ORPH
    sh4      |         opensc-0.22.0          | NOK | http://autobuild.buildroot.net/results/f5eb59c47b3d7e2361418762a8a8ad786d7af7b3 |     
    i686     |  openvmtools-11.3.5-18557794   | NOK | http://autobuild.buildroot.net/results/6e9c41b29295dcf807a2f7e54736fd6d1826815f |     
   s390x     | package/sdl2_net/sdl2_net.m... | NOK | http://autobuild.buildroot.net/results/54f875c8d71f9b3cdd4cbeadc11f8179ae518862 |     
   nios2     | package/sdl2_net/sdl2_net.m... | NOK | http://autobuild.buildroot.net/results/61c232f835a5b5aa7408d323c8e8c0ab01e488cf |     
    arm      |           php-8.2.6            | NOK | http://autobuild.buildroot.net/results/ae5032cf53aa103326d7b0474d0a11196431cde0 |     
   xtensa    |        poppler-22.10.0         | NOK | http://autobuild.buildroot.net/results/aa38f307769ab07f03db12de4a0a189fcaa969b5 |     
    arm      | sconeserver-8d1935919a20133... | NOK | http://autobuild.buildroot.net/results/c601db6661c94ad19fe0b76899db40938428e5ed |     
    arm      |      sdl2_net-legal-info       | NOK | http://autobuild.buildroot.net/results/6ac8e27ba2bab4c03e2a01fe881409f63b16b431 | ORPH
 aarch64_be  |      sdl2_net-legal-info       | NOK | http://autobuild.buildroot.net/results/84c6e11bba7341b5aa4bd1b21d8bc013809c579f | ORPH
 microblaze  |       stress-ng-0.15.07        | NOK | http://autobuild.buildroot.net/results/fa18cc77fc685cbb33453e9af0c1be9ae9901266 |     
   arceb     |        syslog-ng-4.1.1         | NOK | http://autobuild.buildroot.net/results/1037840aa6905d49138e7f157c8350401446dc40 |     
   sh4aeb    |       tpm-tools-1.3.9.1        | NOK | http://autobuild.buildroot.net/results/4bb0b357679c6ee3208ca9733ccac3e422039a29 |     
  riscv64    |         uclibc-1.0.43          | NOK | http://autobuild.buildroot.net/results/c5369a86af38b8df2528e1d605a129e748f996c2 |     
  powerpc    |         uclibc-1.0.43          | NOK | http://autobuild.buildroot.net/results/66e73523b692d6e58d026575030e3fcf53ecc497 |     
   mips64    | uclibc-ng-test-6790eafe897b... | NOK | http://autobuild.buildroot.net/results/bc3991f2d803df1ed31cfc68fe7971a657850f3d |     
    mips     |            unknown             | NOK | http://autobuild.buildroot.net/results/8c04228d94ff71cd2b211d8868f20cd9a9972b39 |     
   mips64    |            unknown             | NOK | http://autobuild.buildroot.net/results/3baa4e851686d80b5afc20680bbd181cacf788c3 |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/523409e5836e2c1c9d413c0edf3a9a85c48cb457 |     
  mips64el   |         wolfssl-5.5.3          | NOK | http://autobuild.buildroot.net/results/67d4e9caa038e6cce176999f0b098de7bb29f01b |     
  aarch64    |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/a714c7482e2c9cabdd858649ad751d0d6392feaa |     
  aarch64    |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/73345b53888a1c4581387c84f9a87668f1dada48 |     


Classification of failures by reason for 2022.02.x
--------------------------------------------------

            igd2-for-linux-2.1 | 2 
                 snmppp-3.4.10 | 1 


Detail of failures for 2022.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/459eaede0397ab7b5697f8feaab30cf87c10224b |     
   xtensa    |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/3479021990608b9297832337cad1aac5a220fe7d |     
  aarch64    |         snmppp-3.4.10          | NOK | http://autobuild.buildroot.net/results/723cfcf3698d79c05ebfce97bae11eb3b9d9df22 |     


Classification of failures by reason for 2023.02.x
--------------------------------------------------

            host-binutils-2.39 | 1 
                host-go-1.19.9 | 1 
              host-rust-1.67.1 | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/a9059e0ba72eb9ce0a513818e0cfc400ea7fc241 |     
   s390x     |         host-go-1.19.9         | NOK | http://autobuild.buildroot.net/results/d6586d491d6cf6b54c441b7dcd678a3004d44115 |     
  sparc64    |        host-rust-1.67.1        | NOK | http://autobuild.buildroot.net/results/69df72aec11666ce303d28f791869ca4447782f1 |     


Gitlab CI results for 2023-05-16
================================

Detail of defconfig failures for 2023.05-rc1
--------------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
               qemu_ppc_mpc8544ds | https://gitlab.com/buildroot.org/buildroot/-/jobs/4287983266  |      
                       qemu_s390x | https://gitlab.com/buildroot.org/buildroot/-/jobs/4287983277  |      


Detail of runtime-test failures for 2023.05-rc1
-----------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
      TestClangCompilerRT | https://gitlab.com/buildroot.org/buildroot/-/jobs/4287983473  | ORPH 
           TestCrudiniPy3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4287983475  | ORPH 
              TestGlxinfo | https://gitlab.com/buildroot.org/buildroot/-/jobs/4287983490  | ORPH 
           TestIPythonPy3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4287983496  | ORPH 
                TestKexec | https://gitlab.com/buildroot.org/buildroot/-/jobs/4287983497  | ORPH 
               TestLibJXL | https://gitlab.com/buildroot.org/buildroot/-/jobs/4287983499  | ORPH 
           TestLuaLuaLdap | https://gitlab.com/buildroot.org/buildroot/-/jobs/4287983540  | ORPH 
              TestLuaUtf8 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4287983532  | ORPH 
      TestLuajitLuaAugeas | https://gitlab.com/buildroot.org/buildroot/-/jobs/4287983511  | ORPH 
       TestLuajitLuaLyaml | https://gitlab.com/buildroot.org/buildroot/-/jobs/4287983529  | ORPH 
        TestLuajitLuaSDL2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4287983531  | ORPH 
           TestLuajitUtf8 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4287983533  | ORPH 
             TestPerftest | https://gitlab.com/buildroot.org/buildroot/-/jobs/4287983580  | ORPH 
 TestPerlLWPProtocolhttps | https://gitlab.com/buildroot.org/buildroot/-/jobs/4287983590  | ORPH 
       TestPerllibwwwperl | https://gitlab.com/buildroot.org/buildroot/-/jobs/4287983589  | ORPH 
        TestPolkitSystemd | https://gitlab.com/buildroot.org/buildroot/-/jobs/4287983602  | ORPH 
         TestPythonPy3Can | https://gitlab.com/buildroot.org/buildroot/-/jobs/4287983620  | ORPH 
      TestPythonPy3Django | https://gitlab.com/buildroot.org/buildroot/-/jobs/4287983632  | ORPH 
    TestPythonPy3Dtschema | https://gitlab.com/buildroot.org/buildroot/-/jobs/4287983633  | ORPH 
      TestPythonPy3Ubjson | https://gitlab.com/buildroot.org/buildroot/-/jobs/4287983675  | ORPH 
                   TestS6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4287983683  | ORPH 
             TestZfsGlibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/4287983704  | ORPH 
              TestZfsMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/4287983706  | ORPH 
            TestZfsUclibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/4287983708  | ORPH 



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
