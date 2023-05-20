Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B9A1C77B7A
	for <buildroot@archiver.kernel.org>; Sat, 20 May 2023 05:32:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6C355612A9;
	Sat, 20 May 2023 05:32:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6C355612A9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5jTCqgkINFD1; Sat, 20 May 2023 05:32:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E1AE461080;
	Sat, 20 May 2023 05:32:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E1AE461080
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8DB7B1BF40F
 for <buildroot@lists.busybox.net>; Sat, 20 May 2023 05:32:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5D65382DD9
 for <buildroot@lists.busybox.net>; Sat, 20 May 2023 05:32:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5D65382DD9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rSa-UXjG3JRo for <buildroot@lists.busybox.net>;
 Sat, 20 May 2023 05:32:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 05C9682D57
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 05C9682D57
 for <buildroot@buildroot.org>; Sat, 20 May 2023 05:32:48 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 2402F240006
 for <buildroot@buildroot.org>; Sat, 20 May 2023 05:32:45 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sat, 20 May 2023 05:32:45 -0000
Message-Id: <20230520053251.5D65382DD9@smtp1.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1684560766; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=8dlqpzuCLmC1cyc53c4ut5jEYe4cZW13CmL18rAA1Sw=;
 b=BW3pdddnCiMukIpy70q+yN0nSUvoSxs9BAFW7rDFqJ9xuEDdmGqnoZ5Lz4VYfqQkUpXFip
 j1bAu5tobkoi1gRCHQiCtxutS/pf6om3N1Z/osTDrVGwp8wQm5zlU3fDo3Zg1t2Gj+XX/I
 ALAb+SjHRY9l0bqMIHEtiXhV4Rj+fEtwzn53PIl1JXqMsA+ySpTIxbP/qY+ohehojWCcpU
 NK9Q5vuDiFf/UZBWSAWkB/yGho+4qT5P1W7mhBWx3lahQ+BDkCx1c+fkO8soH7g8fWVXB3
 ADx8VaF0SR0WSIEJ4CWpa+YKPWC3v2OyTyI+gCF+V0xGfHeMhxLNljnyynBgaQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=BW3pdddn
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-05-19
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

Autobuild statistics for 2023-05-19
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  |  2  |  2  |  0  |  4  |
  2023.02.x  |  4  |  5  |  0  |  9  |
    master   | 66  | 68  |  1  | 135 |

Classification of failures by reason for master
-----------------------------------------------

                       unknown | 6 
                 agentpp-4.6.0 | 4 
           at-spi2-core-2.48.2 | 3 
              host-rust-1.68.2 | 3 
                  libmnl-1.0.5 | 3 
package/sdl2_net/sdl2_net.m... | 3 
                 coreutils-9.3 | 2 
fs/ubi/ubi.mk:51: /home/aut... | 2 
google-breakpad-c85eb4a59b6... | 2 
                  kexec-2.0.26 | 2 
               libglib2-2.76.1 | 2 
                    sdl-1.2.15 | 2 
               zxing-cpp-1.4.0 | 2 
                alsa-lib-1.2.8 | 1 
azure-iot-sdk-c-LTS_07_2022... | 1 
                  bind-9.16.38 | 1 
                   duma-2.5.15 | 1 
                     efivar-38 | 1 
                elfutils-0.186 | 1 
                 fdk-aac-2.0.2 | 1 
                     file-5.43 | 1 
            flatbuffers-23.3.3 | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
glibc-2.37-2-g9f8513dc64119... | 1 
         gobject-introspection | 1 
            host-binutils-2.39 | 1 
                host-go-1.19.9 | 1 
host-heimdal-f4faaeaba371ff... | 1 
               host-runc-1.1.7 | 1 
              libgcrypt-1.10.1 | 1 
                 libpqxx-7.7.5 | 1 
          linux-5.10.162-cip24 | 1 
                   linux-6.3.2 | 1 
                   linux-tools | 1 
          lttng-modules-2.13.7 | 1 
                    mpv-0.35.1 | 1 
               nfs-utils-2.6.3 | 1 
            ocf-linux-20171122 | 1 
                    olsr-0.9.8 | 1 
   openvmtools-11.3.5-18557794 | 1 
sconeserver-8d1935919a20133... | 1 
               syslog-ng-4.1.1 | 1 
                 uclibc-1.0.43 | 1 
ulog-0389d243352255f6182326... | 1 
               valgrind-3.20.0 | 1 
                    zeek-4.1.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 microblaze  |         agentpp-4.6.0          | NOK | http://autobuild.buildroot.net/results/ad2d543e829d8878e9105d11125b272e20f13019 |     
    arm      |         agentpp-4.6.0          | NOK | http://autobuild.buildroot.net/results/8a66060b7704cdf496483b8888f0bcb5d9138669 |     
  aarch64    |         agentpp-4.6.0          | NOK | http://autobuild.buildroot.net/results/04d67e445fceb21c07635092338187ec635d40ac |     
   x86_64    |         agentpp-4.6.0          | NOK | http://autobuild.buildroot.net/results/da51a7a66b3f5b59c0488b483fa8eab0d26af5f8 |     
    or1k     |         alsa-lib-1.2.8         | NOK | http://autobuild.buildroot.net/results/1383921b8780ac456262787e353c657261c6b8a2 |     
  aarch64    |      at-spi2-core-2.48.2       | NOK | http://autobuild.buildroot.net/results/6b03ebef636a4a3e067e6adbf1e236568018602f |     
    or1k     |      at-spi2-core-2.48.2       | NOK | http://autobuild.buildroot.net/results/8bd873f0a93d450700a19066a28fef607820288e |     
   nios2     |      at-spi2-core-2.48.2       | NOK | http://autobuild.buildroot.net/results/51117050c5ec689e86838f6cc322258431c15800 |     
    arm      | azure-iot-sdk-c-LTS_07_2022... | NOK | http://autobuild.buildroot.net/results/40a527cd7e8fcb1372c7802c00121da08dc9b03d |     
   sh4eb     |          bind-9.16.38          | NOK | http://autobuild.buildroot.net/results/2fb73f57822529c05218792e3a8755c7923c1fa6 | ORPH
   sparc     |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/5fb8986ef752bc5ac51017a24a965f5826074e42 | ORPH
    mips     |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/1d517fc45d5b94698d0ecbf3889ed6a91ac5bfb7 | ORPH
    or1k     |          duma-2.5.15           | NOK | http://autobuild.buildroot.net/results/46d532b4ba33ce3d92185def369e0763ef483f48 | ORPH
    arm      |           efivar-38            | NOK | http://autobuild.buildroot.net/results/7c54197e0129088c6491f8041e858c3e4b0732e1 |     
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/8c40831eec6a0b07991b2649e92f7c4b7a4a6bd0 | ORPH
   mipsel    |         fdk-aac-2.0.2          | NOK | http://autobuild.buildroot.net/results/470e2e445a36fe83bfb8da01c338195ec14d4477 |     
  powerpc    |           file-5.43            | NOK | http://autobuild.buildroot.net/results/02ae22efcbff36374b68a19595798fddf8d26ce3 | ORPH
    m68k     |       flatbuffers-23.3.3       | NOK | http://autobuild.buildroot.net/results/fd0bb26904eaa2e1ba171f7cf305ff7ac3f7bc87 |     
powerpc64le  | fs/ubi/ubi.mk:51: /home/aut... | NOK | http://autobuild.buildroot.net/results/3995f1f15defa47825380fabd42a36306f9a903e |     
    i686     | fs/ubi/ubi.mk:51: /home/aut... | NOK | http://autobuild.buildroot.net/results/dbc89c55012a35d363a1603637e30851b23db2e1 |     
  sparc64    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/6919ee8d189587c16fe5a59d1ea87f199bf8d74c |     
powerpc64le  | glibc-2.37-2-g9f8513dc64119... | NOK | http://autobuild.buildroot.net/results/1d875906a2d17e479d67141f305a0c5bdeb64db6 |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/3bd2f61d298087836377fbc09ed5e3a09ded1465 |     
    arm      | google-breakpad-c85eb4a59b6... | NOK | http://autobuild.buildroot.net/results/e7184c6d262439e5279f87d1d741998736097daa |     
    mips     | google-breakpad-c85eb4a59b6... | NOK | http://autobuild.buildroot.net/results/656b9a33dd0184fee89b6fea484059f5cc335154 |     
    sh4a     |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/82a89515d80ed2f6a96f636daa8bc3ee66dd854f |     
  mips64el   |         host-go-1.19.9         | NOK | http://autobuild.buildroot.net/results/904249555450da956dd72749275f918dd8d923ac |     
   mips64    | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/08f3455496e856d8c114b0bee7b34d6e29201d46 | ORPH
 microblaze  |        host-runc-1.1.7         | NOK | http://autobuild.buildroot.net/results/0582678ec78953d83e755a29be446f9be6289969 |     
   armeb     |        host-rust-1.68.2        | NOK | http://autobuild.buildroot.net/results/24a030cf0447533c3088fe4573f0c59e0763f4cc |     
   x86_64    |        host-rust-1.68.2        | NOK | http://autobuild.buildroot.net/results/2ef23479dc1cc6f4c381fa86dee5d48f3d2130ab |     
  aarch64    |        host-rust-1.68.2        | NOK | http://autobuild.buildroot.net/results/bdde1d5586b8767a88bb8d98360d7ece49ac0a9e |     
    sh4      |          kexec-2.0.26          | NOK | http://autobuild.buildroot.net/results/cfbfc4ab3cd7f2b4acc22a52d051ff31f46d4d34 |     
    m68k     |          kexec-2.0.26          | NOK | http://autobuild.buildroot.net/results/dd08c817374bdd8625fe9fd99ae9ad7aa3840657 |     
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/336fa965285768f62610930d3343593f76269831 | ORPH
    mips     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/2667bcd1fc0918502e4cfa43c0afdc367533f02d |     
   armeb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/21731dbb58973561b2ad7ccc1dc53a4bdc6d6ae9 |     
 aarch64_be  |          libmnl-1.0.5          | NOK | http://autobuild.buildroot.net/results/36c1619c8b02efeaf9caebae8bb5c3eb8a26238b |     
    arm      |          libmnl-1.0.5          | NOK | http://autobuild.buildroot.net/results/337a1f8570116fde6275bb844b190b0666d24fd6 |     
    arm      |          libmnl-1.0.5          | NOK | http://autobuild.buildroot.net/results/22b70ad7828f541368055d0c2c0f4409294a36d2 |     
 powerpc64   |         libpqxx-7.7.5          | NOK | http://autobuild.buildroot.net/results/a79cb93aec74acc8e32809530c09e26bebaf16e4 |     
  mips64el   |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/11decb79cff8fd3db1a15ec95f92144ff2441786 | ORPH
    arc      |          linux-6.3.2           | NOK | http://autobuild.buildroot.net/results/30088bec87d9f4384ddbd1c8ef276e10c5ee8866 | ORPH
   s390x     |          linux-tools           | NOK | http://autobuild.buildroot.net/results/0c3bde362f74f5b0fa379883a6d132bd359992c5 | ORPH
   xtensa    |      lttng-modules-2.13.7      | NOK | http://autobuild.buildroot.net/results/b69406eface7a5655b3b0e477d56cb694b14e55d |     
    sh4a     |           mpv-0.35.1           | NOK | http://autobuild.buildroot.net/results/4f127a63db5cdbdf29ebd9e9c2c242d8f9523c69 |     
    arm      |        nfs-utils-2.6.3         | NOK | http://autobuild.buildroot.net/results/230d47c089c44209f62399ca2dce844a7b2e1283 |     
   armeb     |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/e329f968a1a62f64a91ab720104e0473711b64e0 | ORPH
    or1k     |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/eed7ec3062304f0f90d79a1717305ce262867afb | ORPH
   x86_64    |  openvmtools-11.3.5-18557794   | NOK | http://autobuild.buildroot.net/results/7690e8b2296d1378a5fe89916d94817e1dd5ef98 |     
  mips64el   | package/sdl2_net/sdl2_net.m... | NOK | http://autobuild.buildroot.net/results/3ce046e535a2db6a03882ee572425791b551b7dc |     
microblazeel | package/sdl2_net/sdl2_net.m... | NOK | http://autobuild.buildroot.net/results/8f304ed6813856b25843b01be04164c5d19d15f2 |     
    m68k     | package/sdl2_net/sdl2_net.m... | NOK | http://autobuild.buildroot.net/results/db459a39fcc7169fcf1092c93e07548813d674f7 |     
microblazeel | sconeserver-8d1935919a20133... | NOK | http://autobuild.buildroot.net/results/740264b57b6c55b7d4bcf21bfa20ae43fbe606b6 |     
    sh4a     |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/0eb136bad980d6dd466af2a3f8fc34ced31e0a1f | ORPH
    sh4      |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/c0c292d6466b5564d216174d78d7e766b7724038 | ORPH
  sparc64    |        syslog-ng-4.1.1         | NOK | http://autobuild.buildroot.net/results/24a49cc27713aca38a323812c022acc58a2bd14a |     
  riscv64    |         uclibc-1.0.43          | NOK | http://autobuild.buildroot.net/results/708291722c3cdad65a638c91c0a8ab285dc2f74e |     
   nios2     | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/2314f528d76a6c683b2237140142e431fa79bb77 |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/86d6d848ac3bc7a85b672973d0a4e920a44cebc6 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/dd4527aa70e71aeb5cf80bdfea23a82c9c8e0a14 |     
   mips64    |            unknown             | NOK | http://autobuild.buildroot.net/results/76d6beba61330d5c017b823d0e34418c3daf0289 |     
powerpc64le  |            unknown             | NOK | http://autobuild.buildroot.net/results/6753803a82fc09a50c19d9ce9235f347a5c10d79 |     
powerpc64le  |            unknown             | NOK | http://autobuild.buildroot.net/results/3d2a93d82d9b7ebb1e2edf52e040389ef350f33c |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/dc8c07fbb2a42427028f78204690f73b245ca3a3 |     
   mips64    |        valgrind-3.20.0         | NOK | http://autobuild.buildroot.net/results/916f69ef0ba008ff58b162488383c66b8c9d70b7 | ORPH
  mips64el   |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/180461979e07f71d65bda49a2ef4a8518a53d674 |     
   s390x     |        zxing-cpp-1.4.0         | NOK | http://autobuild.buildroot.net/results/94939562d8448c606ec6420aac356162649c9a61 |     
   s390x     |        zxing-cpp-1.4.0         | NOK | http://autobuild.buildroot.net/results/65c4d9329c44171afa7566c1a8ce0e471869a287 |     


Classification of failures by reason for 2022.02.x
--------------------------------------------------

             containerd-1.5.18 | 1 
                 snmppp-3.4.10 | 1 


Detail of failures for 2022.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |       containerd-1.5.18        | NOK | http://autobuild.buildroot.net/results/858f80cea82d9ca3ecb3a25cb01c10639a994f9d |     
   x86_64    |         snmppp-3.4.10          | NOK | http://autobuild.buildroot.net/results/d0947c8e60f577108da40633a4ccfaad55f94be2 |     


Classification of failures by reason for 2023.02.x
--------------------------------------------------

                 agentpp-4.6.0 | 1 
glibc-2.36-81-g4f4d7a13edfd... | 1 
            host-binutils-2.38 | 1 
uclibc-ng-test-6790eafe897b... | 1 
                       unknown | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   s390x     |         agentpp-4.6.0          | NOK | http://autobuild.buildroot.net/results/59647127e985a6c92abcd0fcb551b2c452a30159 |     
  powerpc    | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/34f3d68a4af6703be115be99455ec8cdd6ce1c4d |     
   s390x     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/054a1ddb7699bb8b1f3545f762fa7197404e32b3 |     
   mips64    | uclibc-ng-test-6790eafe897b... | NOK | http://autobuild.buildroot.net/results/80a51a929014f825272e32758eb4322195aaf4f7 |     
   s390x     |            unknown             | NOK | http://autobuild.buildroot.net/results/e77eceb7c4f6d46f3bca447057526c62d38c9f8d |     


Gitlab CI results for 2023-05-19
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
                 at91sam9g45m10ek | https://gitlab.com/buildroot.org/buildroot/-/jobs/4306894961  |      
                       beaglebone | https://gitlab.com/buildroot.org/buildroot/-/jobs/4306895000  |      
                   beaglebone_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4306895003  |      
           freescale_imx6qsabresd | https://gitlab.com/buildroot.org/buildroot/-/jobs/4306895035  |      
                 grinn_chiliboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/4306895060  |      
                 hifive_unleashed | https://gitlab.com/buildroot.org/buildroot/-/jobs/4306895062  |      
                         mx53loco | https://gitlab.com/buildroot.org/buildroot/-/jobs/4306895130  |      
                      nitrogen6sx | https://gitlab.com/buildroot.org/buildroot/-/jobs/4306895142  |      
                       nitrogen6x | https://gitlab.com/buildroot.org/buildroot/-/jobs/4306895144  |      
                        nitrogen7 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4306895147  |      
                       nitrogen8m | https://gitlab.com/buildroot.org/buildroot/-/jobs/4306895151  |      
                      nitrogen8mm | https://gitlab.com/buildroot.org/buildroot/-/jobs/4306895154  |      
                      nitrogen8mn | https://gitlab.com/buildroot.org/buildroot/-/jobs/4306895155  |      
                      nitrogen8mp | https://gitlab.com/buildroot.org/buildroot/-/jobs/4306895156  |      
       olimex_a20_olinuxino_lime2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4306895168  |      
                orangepi_one_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/4306895184  |      
                   pc_x86_64_bios | https://gitlab.com/buildroot.org/buildroot/-/jobs/4306895198  |      
                    pc_x86_64_efi | https://gitlab.com/buildroot.org/buildroot/-/jobs/4306895200  |      
            qemu_mips32r6el_malta | https://gitlab.com/buildroot.org/buildroot/-/jobs/4306895236  |      
               qemu_ppc_mpc8544ds | https://gitlab.com/buildroot.org/buildroot/-/jobs/4306895282  |      
                       qemu_s390x | https://gitlab.com/buildroot.org/buildroot/-/jobs/4306895292  |      
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/4306895316  | ORPH 
               snps_arc700_axs101 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4306895356  |      
                socrates_cyclone5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4306895361  |      
            solidrun_macchiatobin | https://gitlab.com/buildroot.org/buildroot/-/jobs/4306895364  | ORPH 
                    spike_riscv64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4306895365  |      
              stm32f429_disco_xip | https://gitlab.com/buildroot.org/buildroot/-/jobs/4306895366  |      
               stm32f469_disco_sd | https://gitlab.com/buildroot.org/buildroot/-/jobs/4306895367  |      
              stm32f469_disco_xip | https://gitlab.com/buildroot.org/buildroot/-/jobs/4306895368  |      
               stm32f769_disco_sd | https://gitlab.com/buildroot.org/buildroot/-/jobs/4306895369  |      
                  stm32mp157a_dk1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4306895370  |      
                  stm32mp157c_dk2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4306895371  |      
              stm32mp157c_odyssey | https://gitlab.com/buildroot.org/buildroot/-/jobs/4306895372  |      
        terasic_de10nano_cyclone5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4306895373  |      
              toradex_apalis_imx6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4306895375  |      
                           ts4900 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4306895376  |      
                           ts5500 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4306895377  |      
                           ts7680 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4306895379  |      
                         uevm5432 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4306895380  |      
                    versal_vck190 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4306895383  |      
                       visionfive | https://gitlab.com/buildroot.org/buildroot/-/jobs/4306895386  |      
                      visionfive2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4306895384  |      
                        wandboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/4306895388  |      
                            warp7 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4306895389  |      
                        warpboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/4306895394  |      
                    zynq_microzed | https://gitlab.com/buildroot.org/buildroot/-/jobs/4306895398  |      
                      zynq_qmtech | https://gitlab.com/buildroot.org/buildroot/-/jobs/4306895404  |      
                       zynq_zc706 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4306895411  |      
                         zynq_zed | https://gitlab.com/buildroot.org/buildroot/-/jobs/4306895434  |      
                zynqmp_kria_kv260 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4306895464  |      
                    zynqmp_zcu102 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4306895466  |      
                    zynqmp_zcu106 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4306895468  |      



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
