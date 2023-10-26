Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA476C25B67
	for <buildroot@archiver.kernel.org>; Thu, 26 Oct 2023 05:42:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 43C0D827C9;
	Thu, 26 Oct 2023 05:42:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 43C0D827C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id P5d2SVke3rgX; Thu, 26 Oct 2023 05:42:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 07610827D8;
	Thu, 26 Oct 2023 05:42:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 07610827D8
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E8DBC1BF25B
 for <buildroot@lists.busybox.net>; Thu, 26 Oct 2023 05:42:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C7287414B9
 for <buildroot@lists.busybox.net>; Thu, 26 Oct 2023 05:42:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C7287414B9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9fF7rovaaLub for <buildroot@lists.busybox.net>;
 Thu, 26 Oct 2023 05:42:11 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AE99A400C6
 for <buildroot@buildroot.org>; Thu, 26 Oct 2023 05:42:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AE99A400C6
Received: by mail.gandi.net (Postfix) with ESMTPSA id C823BE0012
 for <buildroot@buildroot.org>; Thu, 26 Oct 2023 05:42:07 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Thu, 26 Oct 2023 05:42:07 -0000
X-GND-Sasl: bot@bootlin.com
Message-Id: <20231026054213.C7287414B9@smtp2.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1698298927; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=jZvueGSG0Wcb4zWiRr6nSg7YSD4ke3p1Iu6p1c799w8=;
 b=KC7pYgxWDXNDCHHMgsFZg9KgvS8Rk54igm0pMZh0NYHKCTKNNCEh6usFTWhqHYjzyC7ymF
 R2JQscHdpwenTpsWOSP5OegRgHsEZWkGPHyLmuWg8b7u9d1YSc/7W158Uzson66XjXtVJ4
 sv9Fpr8jaBlg7qWTZRZtb/zr1T1htCuTbkNKjr4tYFjYRYjnc5YJh3JvLvEW+yNm0ca8Pj
 M+T6zFcBDjb4kZCnlTxJNT6aNiCPNKkncEGeKggHRKe0SqammV+eioW+CklcrVb6Urlwsw
 JPb9uvWKf56uqRXkOJrROC5FgF7Qg/rt/kO+29pmqPkCFcB5ZF6O1kfJXwwHoA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=KC7pYgxW
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-10-25
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

Autobuild statistics for 2023-10-25
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  | 13  |  5  |  0  | 18  |
  2023.08.x  | 14  |  8  |  1  | 23  |
    master   | 36  | 86  |  0  | 122 |

Classification of failures by reason for master
-----------------------------------------------

                       unknown | 13
         spirv-tools-1.3.261.1 | 10
                   bird-2.0.12 | 7 
                  monit-5.33.0 | 6 
  gobject-introspection-1.76.1 | 5 
                 openrc-0.43.3 | 5 
                host-go-1.21.3 | 4 
          xdg-dbus-proxy-0.1.5 | 3 
                 coreutils-9.3 | 2 
                elfutils-0.189 | 2 
              host-rust-1.71.1 | 2 
              libarchive-3.7.2 | 2 
                   linux-6.5.8 | 2 
               apcupsd-3.14.14 | 1 
                  boost-1.83.0 | 1 
check-11970a7e112dfe243a2e6... | 1 
              e2fsprogs-1.47.0 | 1 
                      ell-0.57 | 1 
fs/axfs/axfs.mk:32: /home/t... | 1 
              gcc-final-12.3.0 | 1 
host-go-bootstrap-stage2-1.... | 1 
               libglib2-2.76.1 | 1 
                   libnss-3.94 | 1 
                   libnvme-1.6 | 1 
                libselinux-3.5 | 1 
               libunwind-1.6.2 | 1 
                mongodb-4.2.18 | 1 
                  motion-4.5.1 | 1 
                    ncmpc-0.47 | 1 
                nushell-0.85.0 | 1 
              open-iscsi-2.1.9 | 1 
               openblas-0.3.24 | 1 
                 pango-1.50.14 | 1 
                 samba4-4.19.1 | 1 
                     squid-6.3 | 1 
             stress-ng-0.15.07 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  sparc64    |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/633a253d2d851d88b74b8c9a330e1af5240183d3 |     
microblazeel |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/7abdad3993619ef61e5420d379840df8af6d2918 |     
 powerpc64   |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/dce28c0da0dbb4f72f268874b8da2daa04d0905b |     
   armeb     |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/694a4a1439c0f3eb9490615371bd4e8d4fd349b8 |     
    m68k     |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/ee7e344dcaed24d1781f05b19db28d8aed694ce0 |     
    i686     |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/4ea644de0c3f3a336152d333f0d2aae7e6fbcb54 |     
powerpc64le  |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/35d4cdf4e422ec0539ba98d2a709ecbbdea748de |     
 aarch64_be  |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/e0868f7c4923a931703e3e6577bc73b965e925b8 |     
   arceb     |          boost-1.83.0          | NOK | http://autobuild.buildroot.net/results/8be4740f0b0e52865885ba84d11ec8699cfbfd33 |     
    arc      | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/b8f763b2a8694b3d31f26713f74da26afb7357a8 | ORPH
   arceb     |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/68023f7c93db4dae8d3d920533c9251951315c03 | ORPH
    sh4      |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/08fd83c604044684516325abf4f4b3728711b854 | ORPH
   sh4aeb    |        e2fsprogs-1.47.0        | NOK | http://autobuild.buildroot.net/results/b85422aa350eec37fb754ba64c9bc31f9985103f | ORPH
    or1k     |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/ca67b2d4c015b0454d591eb8f83139ec5c966ef6 | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/93028325418066d8c42017758bbe50ac7fe97603 | ORPH
   sh4aeb    |            ell-0.57            | NOK | http://autobuild.buildroot.net/results/7491b682ba0bc37b46e72d62cc354f4e41503909 | ORPH
  mips64el   | fs/axfs/axfs.mk:32: /home/t... | NOK | http://autobuild.buildroot.net/results/51f1c98526473efcd0a89e427c389f8ea23f4498 |     
  riscv64    |        gcc-final-12.3.0        | NOK | http://autobuild.buildroot.net/results/750f4cc45a79ac9f395980e023ab4ae1efab0b22 |     
  powerpc    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/46bbdfb29f6f811ba615681ffc719bc894b62acf | ORPH
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/1288b984494334725df438970fc4a3bf5fdab26c | ORPH
   sh4aeb    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/016c6fd67d88062b36ac81d3e4f90fd516df35f4 | ORPH
    m68k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/0a8f03e91193eac753f8c098d370b9681e47e6df | ORPH
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/2e1aa5244a8354a603df7e71f3285a216a557aec | ORPH
  mips64el   |         host-go-1.21.3         | NOK | http://autobuild.buildroot.net/results/cc69dd05c03e2672a47cdcea9609ef5da72b1d30 |     
  mips64el   |         host-go-1.21.3         | NOK | http://autobuild.buildroot.net/results/2d7b29a3de6f425993a149ece75856bcb249f157 |     
  mips64el   |         host-go-1.21.3         | NOK | http://autobuild.buildroot.net/results/ca268dc9e407e8f5e93ff032de08118ad61e9005 |     
    m68k     |         host-go-1.21.3         | NOK | http://autobuild.buildroot.net/results/ef31e0d089f9e27e1d28279e112f7dcdb758f5e7 |     
    i686     | host-go-bootstrap-stage2-1.... | NOK | http://autobuild.buildroot.net/results/8c513147e88bc3dee0ba21335c31989d1418a506 |     
   x86_64    |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/d61c9047dab2a5575e1c3002757714a82db1d2ca |     
   s390x     |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/3a52b057dcb3a72e70c78e2ab8028e1029a2dc7e |     
powerpc64le  |        libarchive-3.7.2        | NOK | http://autobuild.buildroot.net/results/f7a1f2fd6c57a5b0a3fb696edb9280e98eae1648 |     
    mips     |        libarchive-3.7.2        | NOK | http://autobuild.buildroot.net/results/fffea9e54400cd99dd8f6cb9aed4e05572956f2c |     
   arceb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/664c2ae693d3858423d88785840d01a3814c6dd9 |     
  powerpc    |          libnss-3.94           | NOK | http://autobuild.buildroot.net/results/462bed95b15292d856b473118b7e8da664de3e75 |     
  aarch64    |          libnvme-1.6           | NOK | http://autobuild.buildroot.net/results/a63d18fd318783d7e3d1cede062c9c7cacb10282 |     
    mips     |         libselinux-3.5         | NOK | http://autobuild.buildroot.net/results/d428e36708f38415337c2c851fbc24c8c6a177e4 |     
   mipsel    |        libunwind-1.6.2         | NOK | http://autobuild.buildroot.net/results/56950931fe1b30281ea93e7fb55112d3866d0f34 | ORPH
   mips64    |          linux-6.5.8           | NOK | http://autobuild.buildroot.net/results/35b158f06b459c72861fbcd1424f8e6620969db6 | ORPH
    arm      |          linux-6.5.8           | NOK | http://autobuild.buildroot.net/results/e27965069e4f69416c4d63d7f4f8c1f41647087d | ORPH
   x86_64    |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/2677f54daf0d9464b1380517e70c15e41b7a5070 |     
   arceb     |          monit-5.33.0          | NOK | http://autobuild.buildroot.net/results/5b6e572d431c65d93c2e30cf5fb21d7fad94a18d |     
    arc      |          monit-5.33.0          | NOK | http://autobuild.buildroot.net/results/58f496a06a5a0f036cdc191a6c4ceda970c2714e |     
    arm      |          monit-5.33.0          | NOK | http://autobuild.buildroot.net/results/97a49d44563d25d5a5780b12fcb493aa021c542a |     
 microblaze  |          monit-5.33.0          | NOK | http://autobuild.buildroot.net/results/dabe8ff40df4ff3088a5891ee7348e65a720c0bb |     
    or1k     |          monit-5.33.0          | NOK | http://autobuild.buildroot.net/results/78688ae6e0f82d8f022c157117e72bd7731dc9ea |     
  aarch64    |          monit-5.33.0          | NOK | http://autobuild.buildroot.net/results/66c28cb68d56ff8ef7d1a7c49d852b246c0a76df |     
  sparc64    |          motion-4.5.1          | NOK | http://autobuild.buildroot.net/results/8508103a71b9d344d403258283c04f3bbffa84ba |     
   mipsel    |           ncmpc-0.47           | NOK | http://autobuild.buildroot.net/results/5a5e4a14f5cd9238597e226f9e6ba616cfd09076 |     
   mipsel    |         nushell-0.85.0         | NOK | http://autobuild.buildroot.net/results/46a75307264ee968a150524c59fde7b9e14198bf |     
powerpc64le  |        open-iscsi-2.1.9        | NOK | http://autobuild.buildroot.net/results/ed9c32a459dc34ef643892fe3ed7eda295650cf3 |     
   mips64    |        openblas-0.3.24         | NOK | http://autobuild.buildroot.net/results/ae16dfd30058971a8bdccc706dc2362b034c406d |     
    sh4      |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/5ce5a2d9f47c2100f1bf11efb483f51197867072 |     
  powerpc    |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/47f8e7d1a3514159eda39ae5bf1e7c60b063035c |     
 powerpc64   |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/59d018605c0d2b162e0c66dd455132ff30fa6cea |     
 powerpc64   |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/af3bc0f2e8da2f1f08e16eaa512205ed74d0423e |     
  sparc64    |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/8363f2f979c9d619e1f44e55412be5d149b2f077 |     
  sparc64    |         pango-1.50.14          | NOK | http://autobuild.buildroot.net/results/91b636ffc66e8bab2816ce1313825afddc552c91 | ORPH
    sh4a     |         samba4-4.19.1          | NOK | http://autobuild.buildroot.net/results/980c1f5030383dad8b4deebc87cf730260d07694 |     
   x86_64    |     spirv-tools-1.3.261.1      | NOK | http://autobuild.buildroot.net/results/53b3cf124d6c299398e620120465eca396ddcdff | ORPH
   armeb     |     spirv-tools-1.3.261.1      | NOK | http://autobuild.buildroot.net/results/a1f615d2410bffb6fdacc8586761c9def05aafa9 | ORPH
    mips     |     spirv-tools-1.3.261.1      | NOK | http://autobuild.buildroot.net/results/294ade8c9aa3d650fa5ab6cc34701c4176bc197f | ORPH
  mips64el   |     spirv-tools-1.3.261.1      | NOK | http://autobuild.buildroot.net/results/40e8f50eb7e82ca42f84fa5f4336cefb51204a28 | ORPH
    sh4a     |     spirv-tools-1.3.261.1      | NOK | http://autobuild.buildroot.net/results/3c3be2c454863709d0db896bafbe11cd9df092a3 | ORPH
    arm      |     spirv-tools-1.3.261.1      | NOK | http://autobuild.buildroot.net/results/8df8de1aeaf1317f6ba43f6752502da2eedcdea1 | ORPH
 microblaze  |     spirv-tools-1.3.261.1      | NOK | http://autobuild.buildroot.net/results/ea2c1f97e82efcd867c79f05ab02f5f099140379 | ORPH
    i686     |     spirv-tools-1.3.261.1      | NOK | http://autobuild.buildroot.net/results/fa4e39d1e78e885d20851201ed8a6fcf9d48d7d6 | ORPH
  mips64el   |     spirv-tools-1.3.261.1      | NOK | http://autobuild.buildroot.net/results/4ed3f13b3ce178f8fe87de7aee86acb9642e3434 | ORPH
powerpc64le  |     spirv-tools-1.3.261.1      | NOK | http://autobuild.buildroot.net/results/e1b4853a7e8714fd2af8f8677681c9895034b3e8 | ORPH
   xtensa    |           squid-6.3            | NOK | http://autobuild.buildroot.net/results/5c6b301b6a59ae712955729d7788ffb9c57d6687 | ORPH
    m68k     |       stress-ng-0.15.07        | NOK | http://autobuild.buildroot.net/results/0d951d69d469a6f3d4dbee677f9e8941874d5917 |     
    i686     |            unknown             | NOK | http://autobuild.buildroot.net/results/917dd83c81b04a4be63ff79cc44b0b4370f4ba14 |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/992f871dd70c1d787d8a167c4a4c768bc36e7e2c |     
 aarch64_be  |            unknown             | NOK | http://autobuild.buildroot.net/results/a8f80937712dc0d5aa4375070905d4a42085e198 |     
powerpc64le  |            unknown             | NOK | http://autobuild.buildroot.net/results/fc67d9223dcb642c401ccc03e56217c53528ae6e |     
 microblaze  |            unknown             | NOK | http://autobuild.buildroot.net/results/cea080f4a8117841a4b9be517e6f96bf21606d1e |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/2204cea59048cd21ed5e63b1c5a16c7e6bb77852 |     
 powerpc64   |            unknown             | NOK | http://autobuild.buildroot.net/results/708f72834bbe3d46202300f4a146fb6274e8a7d1 |     
powerpc64le  |            unknown             | NOK | http://autobuild.buildroot.net/results/282a3bcd0e1edcf1174eefc941c0d75470160870 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/08e41b8c8af996d316cea4b06d4877375b53a800 |     
 microblaze  |            unknown             | NOK | http://autobuild.buildroot.net/results/5adb0ff58df242e4b971d1fb53f42f591e860e4d |     
  sparc64    |            unknown             | NOK | http://autobuild.buildroot.net/results/1da62b047edf344f659d3467b22fba4359d0b75e |     
   arceb     |            unknown             | NOK | http://autobuild.buildroot.net/results/8a02701e2116fbcc466adf8a52575a057677a475 |     
   armeb     |            unknown             | NOK | http://autobuild.buildroot.net/results/e5a0bf13a3d587409bf632221c41b0297dba9d5f |     
  mips64el   |      xdg-dbus-proxy-0.1.5      | NOK | http://autobuild.buildroot.net/results/f6361b764856cac604e1c136acd1fade00024b70 |     
    mips     |      xdg-dbus-proxy-0.1.5      | NOK | http://autobuild.buildroot.net/results/f50189a884807fc337dc356b5d1e79e3a825a654 |     
  aarch64    |      xdg-dbus-proxy-0.1.5      | NOK | http://autobuild.buildroot.net/results/b35c66cc17922c1b74cac9dd60c903069e42d2ef |     


Classification of failures by reason for 2023.02.x
--------------------------------------------------

                   flann-1.9.2 | 1 
  gobject-introspection-1.72.0 | 1 
                  libgudev-237 | 1 
        ltp-testsuite-20220930 | 1 
       python-stack-data-0.6.2 | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mipsel    |          flann-1.9.2           | NOK | http://autobuild.buildroot.net/results/c4ae0d6c1d583fdf4543cb771de7b402a43045b7 |     
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/3d6e7f9f27d5b5f42e86f655c7e0b8b026f8b3ea | ORPH
   mipsel    |          libgudev-237          | NOK | http://autobuild.buildroot.net/results/be0f399ed862d0749af9e85d829f9a1ce111fce6 |     
 powerpc64   |     ltp-testsuite-20220930     | NOK | http://autobuild.buildroot.net/results/2dccc1bdc147f967db518208a4afc32cc403ffcf |     
   arceb     |    python-stack-data-0.6.2     | NOK | http://autobuild.buildroot.net/results/badcb9dda6f3614f3cfb4689118740f30a51891d |     


Classification of failures by reason for 2023.08.x
--------------------------------------------------

                   bird-2.0.12 | 3 
                elfutils-0.189 | 1 
         gobject-introspection | 1 
     host-moby-buildkit-0.11.6 | 1 
              host-rust-1.71.1 | 1 
                    php-8.2.11 | 1 
             util-linux-2.39.1 | 1 


Detail of failures for 2023.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/9acd4b4085da272d7d1ae11ec06e7cea1d15664b |     
  mips64el   |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/1a8addd03dccc77467aa25e5ea759bddeb2f4bfc |     
  sparc64    |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/29c0936c8580e10a73b52716703ddd199dc58c1e |     
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/38b3ac689564879e64d9692f245c19cb5e695e84 | ORPH
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/32c226ab85dd49845170bef48858580e660b9651 |     
   x86_64    |   host-moby-buildkit-0.11.6    | NOK | http://autobuild.buildroot.net/results/177dad4462d6c402079901b9cae78319026efec4 |     
    mips     |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/c20a4b109cf71965f28384e939b61c3e73b68390 |     
microblazeel |           php-8.2.11           | NOK | http://autobuild.buildroot.net/results/982f4f9cbf5f3c3b3007c6cb9bd0867c2b57a2e2 |     
    arm      |       util-linux-2.39.1        | NOK | http://autobuild.buildroot.net/results/b6c03f277146512e363ecb8501e57b37cc1585c2 | ORPH



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
