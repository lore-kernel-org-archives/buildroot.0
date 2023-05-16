Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20B79C77B7A
	for <buildroot@archiver.kernel.org>; Tue, 16 May 2023 05:36:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9370240588;
	Tue, 16 May 2023 05:36:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9370240588
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oBjtqvX1ve_v; Tue, 16 May 2023 05:36:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 365AE40166;
	Tue, 16 May 2023 05:36:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 365AE40166
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3385A1BF34D
 for <buildroot@lists.busybox.net>; Tue, 16 May 2023 05:36:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DDBD584008
 for <buildroot@lists.busybox.net>; Tue, 16 May 2023 05:36:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DDBD584008
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vgGUZca7Q2j7 for <buildroot@lists.busybox.net>;
 Tue, 16 May 2023 05:36:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BFB7483FDD
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BFB7483FDD
 for <buildroot@buildroot.org>; Tue, 16 May 2023 05:36:12 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id E13C86000E
 for <buildroot@buildroot.org>; Tue, 16 May 2023 05:36:09 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Tue, 16 May 2023 05:36:09 -0000
Message-Id: <20230516053614.DDBD584008@smtp1.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1684215370; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=62J/m3GmGynrkzYbdgwPolhHokprNFE6RDEKrdfS0Ms=;
 b=WGDrIV2BT3+p6NBhaZOb8FusX37ZR9tE950KKJR7+WVn8By7ReJBd4KSJlOTn80U06Jb4w
 uRWHOEnMjJuMfHFn7icwyj4dep1PD6rFetG8uZDbcGHKJGf6WOshjBFzXuK9mJHy8FISG/
 sSACof2m85qPa0bZUesStd9O/4QpQyTesaHkXtdf+R+JyHtqziCNSFJlv1CdAgi77o75BZ
 825oDi8uRGDELqAc7TEd55/Q0fAEyVqTQyvwiHNlOC5xi6MlgjREf3XzUMZRgU4aWbunQu
 r7DI7HHkuh6K1I3ng5hyHARjejv9E7kRbxXqU2Qv5hfBhobsbOQaaGv3fytZBw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=WGDrIV2B
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-05-15
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

Autobuild statistics for 2023-05-15
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  |  5  |  2  |  0  |  7  |
  2023.02.x  |  7  |  4  |  0  | 11  |
    master   | 72  | 77  |  3  | 152 |

Classification of failures by reason for master
-----------------------------------------------

                   linux-6.3.2 | 5 
host-heimdal-f4faaeaba371ff... | 4 
           at-spi2-core-2.48.2 | 3 
                host-go-1.19.9 | 3 
         sdl2_mixer-legal-info | 3 
                       unknown | 3 
                 agentpp-4.6.0 | 2 
                elfutils-0.186 | 2 
fs/ubifs/ubifs.mk:49: /home... | 2 
         gobject-introspection | 2 
              host-rust-1.68.2 | 2 
               libcap-ng-0.8.3 | 2 
               libglib2-2.76.1 | 2 
          linux-5.10.162-cip24 | 2 
            micropython-1.19.1 | 2 
              open62541-v1.3.4 | 2 
package/sdl2_mixer/sdl2_mix... | 2 
                     php-8.2.6 | 2 
            quickjs-2021-03-27 | 2 
                   shadow-4.13 | 2 
                   trinity-1.9 | 2 
                     vdr-2.6.3 | 2 
                    brltty-6.5 | 1 
                 coreutils-9.3 | 1 
                 dc3dd-7.2.641 | 1 
                        ffmpeg | 1 
                     frr-8.4.2 | 1 
fs/jffs2/jffs2.mk:71: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
glibc-2.37-2-g9f8513dc64119... | 1 
google-breakpad-c85eb4a59b6... | 1 
                haveged-1.9.18 | 1 
            host-binutils-2.37 | 1 
            host-binutils-2.38 | 1 
            host-binutils-2.39 | 1 
       host-python-sip-4.19.25 | 1 
              libsodium-1.0.18 | 1 
            live555-2021.05.03 | 1 
        ltp-testsuite-20230127 | 1 
          lttng-modules-2.13.7 | 1 
                 openssh-9.3p1 | 1 
                   perl-5.36.1 | 1 
           python-pyicu-2.10.2 | 1 
sconeserver-8d1935919a20133... | 1 
               syslog-ng-4.1.1 | 1 
           uboot-tools-2021.07 | 1 
               zxing-cpp-1.4.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |         agentpp-4.6.0          | NOK | http://autobuild.buildroot.net/results/f94d989a8668f53d0f20a713fe5e28bd75bb9453 |     
    arm      |         agentpp-4.6.0          | NOK | http://autobuild.buildroot.net/results/f54eb81bd7f828a91697f010ee34ed87dbbd4e34 |     
    or1k     |      at-spi2-core-2.48.2       | NOK | http://autobuild.buildroot.net/results/dec18d3a9fb45e205cb6b7707715317c8f3a5132 |     
 aarch64_be  |      at-spi2-core-2.48.2       | NOK | http://autobuild.buildroot.net/results/12210154c269ee05bfa6df107c3b59cc559f1fdc |     
    arm      |      at-spi2-core-2.48.2       | NOK | http://autobuild.buildroot.net/results/a4908a2c8cb75b602794e890fccb8dd42ef6ff41 |     
microblazeel |           brltty-6.5           | NOK | http://autobuild.buildroot.net/results/021c726fb259558f89c6a88c27d7d1e071aa5f15 |     
    arm      |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/9d3e826d88fab202f91eec8526b332ec2c5b768d | ORPH
    or1k     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/8e26d9fe945bb2014be561a44d44eed23c57a679 | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/e74e7435fc4888bdf0d0bd39401cc73a88100688 | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/7ccf0736f51de99c54b9087c1ecee4d4ee5670f7 | ORPH
    i686     |             ffmpeg             | TIM | http://autobuild.buildroot.net/results/bbc790d2dd4d511ba354e7b209db4efddd1f3702 |     
    arc      |           frr-8.4.2            | NOK | http://autobuild.buildroot.net/results/1c9753421ec16afb913d15510960c8c5f6779c96 |     
   mips64    | fs/jffs2/jffs2.mk:71: /home... | NOK | http://autobuild.buildroot.net/results/835d35ce8bc8093245dee4b8baa409505cf7575b |     
    i586     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/ef0b37441581abb8d5e8db64faaf67244bde7d34 |     
   xtensa    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/8bb8c96565d73712d2f1880654babdfb2c85cbf4 |     
 aarch64_be  | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/509bbf71a1acb475319cad3e85af66120238cfc6 |     
   mipsel    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/ef68421bf01b6e9868905230fe6eb68cba07bdc7 |     
   s390x     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/fff925f0bbe144af36b5133b8ebc65d491b87ad6 |     
  powerpc    | glibc-2.37-2-g9f8513dc64119... | NOK | http://autobuild.buildroot.net/results/7a82fa81c9064b25957dc338c55b0c2bdb8ee5f5 |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/6152674af6a911dcf33784351fa4b9cb79afb5cc |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/94581b557b368691ad79c346e1f8e780d1f3dbe9 |     
    arm      | google-breakpad-c85eb4a59b6... | NOK | http://autobuild.buildroot.net/results/68465929304b49121f0b60a07e58b6c6d4b98825 |     
   arceb     |         haveged-1.9.18         | NOK | http://autobuild.buildroot.net/results/3fd8d8f8adc24078adbd3ac386f244c73d075d0f |     
    mips     |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/6eb69dd8b2590359fa5b26c26b3934278b760214 |     
 powerpc64   |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/e5fb99c7876e2e6ac3f30469e877c34b4911ef52 |     
   s390x     |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/46913014e7ede84f842bf7dd2958e7e0344ad3fd |     
  mips64el   |         host-go-1.19.9         | NOK | http://autobuild.buildroot.net/results/b2bef55faf4c2b824a9cf8eb15b6d937f2c6f1b3 |     
    i586     |         host-go-1.19.9         | NOK | http://autobuild.buildroot.net/results/964ec0f37c41fc973832be8f31544c190bd56fbc |     
    i686     |         host-go-1.19.9         | NOK | http://autobuild.buildroot.net/results/27941d030cf7e6681684e37e6cbfe72db12c1b97 |     
   mipsel    | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/773a3cc4e43ea51223467dd2105e8593a9ed42c8 | ORPH
   xtensa    | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/59023933b44bfafe0a81efbf640130810ac2416d | ORPH
  powerpc    | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/c2ea80b5fe636b7b6374ed4d5a49149c200d4128 | ORPH
powerpc64le  | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/84767fa34bb1cd24833bcbaed25c2c01abc5cd42 | ORPH
    sh4      |    host-python-sip-4.19.25     | NOK | http://autobuild.buildroot.net/results/632c0529142412fc9324324551bc0fc77d134eba |     
 powerpc64   |        host-rust-1.68.2        | NOK | http://autobuild.buildroot.net/results/f2af06fee26d47540ee8b803ad62af63bdf9c7a0 |     
  aarch64    |        host-rust-1.68.2        | NOK | http://autobuild.buildroot.net/results/cf393eaf359e07b125a296cb6f1ebf82ae799b39 |     
  riscv64    |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/e54f5bd3fab770a47a6b7ddaad6a752a68775c75 |     
    or1k     |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/477fe98c94be3d81d265d6acda344e7892c26c11 |     
    mips     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/a6a92227ef518a47816f6329acd3735da707ecad |     
   mipsel    |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/44378c7e07823837f3cab171bf2625f78623722c |     
   arceb     |        libsodium-1.0.18        | NOK | http://autobuild.buildroot.net/results/399e8300a46139a7c2b833e85491af0d6330c16b |     
  mips64el   |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/2296aceaa0f5c729487b37dd51510c40a0a7cfef | ORPH
  powerpc    |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/41f3794b56c1e186dc58ce1d6596586c65e9dd03 | ORPH
   mips64    |          linux-6.3.2           | NOK | http://autobuild.buildroot.net/results/39a0369438a48a74bc7424c322a0ccc420652b4d | ORPH
    m68k     |          linux-6.3.2           | NOK | http://autobuild.buildroot.net/results/5bc4c8ba4a2dfde9bf0c3714eedcf4aa62449b18 | ORPH
  mips64el   |          linux-6.3.2           | NOK | http://autobuild.buildroot.net/results/a9aa0705ede99df4fec655b8b583f7e277eeeb3e | ORPH
    m68k     |          linux-6.3.2           | NOK | http://autobuild.buildroot.net/results/fc44c37d31d839640fbed7872919795ca83f1de1 | ORPH
    mips     |          linux-6.3.2           | NOK | http://autobuild.buildroot.net/results/4647f53e8ee3782adf49d8c4741ea319372bd991 | ORPH
   arceb     |       live555-2021.05.03       | NOK | http://autobuild.buildroot.net/results/d99fb5beaede60da8b9f4b8e1b6dd3de5861a9c4 | ORPH
    sh4      |     ltp-testsuite-20230127     | NOK | http://autobuild.buildroot.net/results/0061ba57f44c8211f923e2cea8f8b20e2147ee02 |     
   arceb     |      lttng-modules-2.13.7      | NOK | http://autobuild.buildroot.net/results/a611d0bebfa59cac102b13d7896f029c2bf97080 |     
 aarch64_be  |       micropython-1.19.1       | NOK | http://autobuild.buildroot.net/results/00d0ec7dcbadd67f8e547e36b85d32285ace1d13 |     
  aarch64    |       micropython-1.19.1       | NOK | http://autobuild.buildroot.net/results/7d89e6903031722e5d70d4d78a1d44c89cff208f |     
   nios2     |        open62541-v1.3.4        | NOK | http://autobuild.buildroot.net/results/f1a59666d4e8b9d11b4a0ecc46ed445e6aa89fe6 | ORPH
   nios2     |        open62541-v1.3.4        | NOK | http://autobuild.buildroot.net/results/6e3612848fdb9700f1d38b0d9e4e3a277167e4f8 | ORPH
    m68k     |         openssh-9.3p1          | NOK | http://autobuild.buildroot.net/results/c9f7163735e2cf5c123846601207ded23aaca901 | ORPH
  mips64el   | package/sdl2_mixer/sdl2_mix... | NOK | http://autobuild.buildroot.net/results/63c62dc14460faf8911573c43d16842a1e0c4a4c |     
    arc      | package/sdl2_mixer/sdl2_mix... | NOK | http://autobuild.buildroot.net/results/bfb62bcfce2530a8d2ab2fd1627719e27f5ad212 |     
   armeb     |          perl-5.36.1           | NOK | http://autobuild.buildroot.net/results/2d6376ac199dca1377ff4cf01ea19af218200467 |     
 microblaze  |           php-8.2.6            | NOK | http://autobuild.buildroot.net/results/54150004ec686428e8ed82930858827fe932ba81 |     
    or1k     |           php-8.2.6            | NOK | http://autobuild.buildroot.net/results/77857026b7cb3b9eb5ef57c779f4737b094b6974 |     
    sh4      |      python-pyicu-2.10.2       | NOK | http://autobuild.buildroot.net/results/6a2a4ed90c1a829e7b9442aaaaa1cd6e5efd9aab |     
    or1k     |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/903c4b21658f8431861f95a280b10d1153bf546a |     
  mips64el   |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/9152e9ca5da64182f27d88ea68b800fcffa1f18a |     
    arc      | sconeserver-8d1935919a20133... | NOK | http://autobuild.buildroot.net/results/fbab524eaf3d8c0dbc32efc81243e78ad8bfe663 |     
 powerpc64   |     sdl2_mixer-legal-info      | NOK | http://autobuild.buildroot.net/results/2af66d82973dd0d62aa156db81c45ea991c2b80d | ORPH
  powerpc    |     sdl2_mixer-legal-info      | NOK | http://autobuild.buildroot.net/results/9f13ec7fc3041b27a7d1a78ffa1ed97ca056e98d | ORPH
    arm      |     sdl2_mixer-legal-info      | NOK | http://autobuild.buildroot.net/results/ce7c443b77323bca7f2c55a759c4e85cc66c6cae | ORPH
  sparc64    |          shadow-4.13           | NOK | http://autobuild.buildroot.net/results/26efead8d0114a1ba49f312e83ec306a2ce08f5d |     
  powerpc    |          shadow-4.13           | NOK | http://autobuild.buildroot.net/results/38fd0ed3c0aa6e1ae49e290008571cb60ce6ad52 |     
  powerpc    |        syslog-ng-4.1.1         | NOK | http://autobuild.buildroot.net/results/ebb549ca564439a10f62113ec4e0ce9ce3db2207 |     
  powerpc    |          trinity-1.9           | NOK | http://autobuild.buildroot.net/results/c7267c4534532dda850fc385a3dc87c8d3563ab7 | ORPH
  powerpc    |          trinity-1.9           | NOK | http://autobuild.buildroot.net/results/454d176dc105758412bc9e7559201158f04bdedb | ORPH
   nios2     |      uboot-tools-2021.07       | NOK | http://autobuild.buildroot.net/results/f69fec4ac5530ccfd5e674003c0bada1b0788d0b | ORPH
    i686     |            unknown             | NOK | http://autobuild.buildroot.net/results/91e717e0130512b26e09ce5a65dec938394cc3ae |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/e6e6093639cb9d8ee6b431fb513848deed0bfa20 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/19aa5e86fe3ca0cbdfb1bc91b19d52b13d18bb97 |     
microblazeel |           vdr-2.6.3            | NOK | http://autobuild.buildroot.net/results/d3a65044fabdafa1b6d75a508eae006a2cfebdc0 |     
   x86_64    |           vdr-2.6.3            | NOK | http://autobuild.buildroot.net/results/bdacedd845a2bf4db9826f0d3868f6b48d456d2a |     
 powerpc64   |        zxing-cpp-1.4.0         | NOK | http://autobuild.buildroot.net/results/3a39db8c426d1cd3c3b6ef309186d425cd7148cc |     


Classification of failures by reason for 2022.02.x
--------------------------------------------------

                       unknown | 1 
  xdriver_xf86-video-tga-1.2.2 | 1 


Detail of failures for 2022.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv32    |            unknown             | NOK | http://autobuild.buildroot.net/results/23d1b5c300ad90fa1dee3f50b0806acad9ba5478 |     
  riscv32    |  xdriver_xf86-video-tga-1.2.2  | NOK | http://autobuild.buildroot.net/results/70d311876819fb7cf86aed4aa8f4d147fbdd5609 |     


Classification of failures by reason for 2023.02.x
--------------------------------------------------

                 agentpp-4.6.0 | 1 
                busybox-1.36.0 | 1 
                    crun-1.7.2 | 1 
         host-gcc-final-11.3.0 | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |         agentpp-4.6.0          | NOK | http://autobuild.buildroot.net/results/2e1ead3dd8468009aad8ae366c0cbda7a8e6c981 |     
  mips64el   |         busybox-1.36.0         | NOK | http://autobuild.buildroot.net/results/082275b2b8aad9f343ebe6900478dade024a907c | ORPH
   x86_64    |           crun-1.7.2           | NOK | http://autobuild.buildroot.net/results/e8637d2b933c8233bdbfbfe3e76d417c54c5778f |     
 aarch64_be  |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/aef4bf871eda2ec581fa18cc7cfce23803486b98 |     


Gitlab CI results for 2023-05-15
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
      TestClangCompilerRT | https://gitlab.com/buildroot.org/buildroot/-/jobs/4283172245  | ORPH 
           TestCrudiniPy3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4283172246  | ORPH 
        TestGdbFullTarget | https://gitlab.com/buildroot.org/buildroot/-/jobs/4283172255  | ORPH 
              TestGlxinfo | https://gitlab.com/buildroot.org/buildroot/-/jobs/4283172267  | ORPH 
           TestIPythonPy3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4283172278  | ORPH 
                TestKexec | https://gitlab.com/buildroot.org/buildroot/-/jobs/4283172281  | ORPH 
               TestLibJXL | https://gitlab.com/buildroot.org/buildroot/-/jobs/4283172285  | ORPH 
      TestLuajitLuaArgon2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4283172310  | ORPH 
             TestOpenBLAS | https://gitlab.com/buildroot.org/buildroot/-/jobs/4283172453  | ORPH 
             TestPerftest | https://gitlab.com/buildroot.org/buildroot/-/jobs/4283172472  | ORPH 
 TestPerlLWPProtocolhttps | https://gitlab.com/buildroot.org/buildroot/-/jobs/4283172501  | ORPH 
       TestPerllibwwwperl | https://gitlab.com/buildroot.org/buildroot/-/jobs/4283172500  | ORPH 
          TestPolkitInitd | https://gitlab.com/buildroot.org/buildroot/-/jobs/4283172523  | ORPH 
         TestPythonPy3Can | https://gitlab.com/buildroot.org/buildroot/-/jobs/4283172572  | ORPH 
      TestPythonPy3Django | https://gitlab.com/buildroot.org/buildroot/-/jobs/4283172620  | ORPH 
    TestPythonPy3Dtschema | https://gitlab.com/buildroot.org/buildroot/-/jobs/4283172625  | ORPH 
     TestPythonPy3Gobject | https://gitlab.com/buildroot.org/buildroot/-/jobs/4283172644  | ORPH 
...PythonPy3MagicWormhole | https://gitlab.com/buildroot.org/buildroot/-/jobs/4283172660  | ORPH 
      TestPythonPy3Smmap2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4283172714  | ORPH 
                   TestS6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4283172747  | ORPH 
             TestZfsGlibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/4283172771  | ORPH 
              TestZfsMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/4283172772  | ORPH 
            TestZfsUclibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/4283172773  | ORPH 



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
