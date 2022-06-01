Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA5A8C433F5
	for <buildroot@archiver.kernel.org>; Wed,  1 Jun 2022 04:39:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 55FF1831CA;
	Wed,  1 Jun 2022 04:39:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cw92CtJIvyXY; Wed,  1 Jun 2022 04:39:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C86D981426;
	Wed,  1 Jun 2022 04:39:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 70AE51BF5F5
 for <buildroot@lists.busybox.net>; Wed,  1 Jun 2022 04:39:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5F17740529
 for <buildroot@lists.busybox.net>; Wed,  1 Jun 2022 04:39:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H5UCfC3hEr9O for <buildroot@lists.busybox.net>;
 Wed,  1 Jun 2022 04:39:31 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::232])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 808A740119
 for <buildroot@buildroot.org>; Wed,  1 Jun 2022 04:39:30 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 7768D200009
 for <buildroot@buildroot.org>; Wed,  1 Jun 2022 04:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1654058368; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=dtiAS+Mqi5PKjbKvblcTR6MLyC35w7snOsSqjEwFrl0=;
 b=FBKLcNBM5GZ8kB36UpRMzjJgfIga+IylS7FT38SkFSxg2TV1VttOO3WstmXerIHRxniJ5w
 ayeYGZ8oMxLSi7cr/utWlhKXnu3yTszLArDIcaVlVN3C/AepyOZC7mR4aKIyOFWoXDICxu
 wx38vQjcj+DSnEKfsaepEmGSjDU1IKgtRxJ+rJQ+4cohOBHtoqzyOmfhppHHY3wS6gZWUt
 Cq72jc7CHOrCyQ9PIVcgkViypfVOJ8otnxXflcN6RLwGRCvbrRQKMFlLhvXoiw+Y7Hwi+D
 C+cFe4hbQ6IZjYaKce5R18xB2u1tpwyyeS77Zi0fdP/ECb1tOKipkLYvFkFkDA==
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Wed, 01 Jun 2022 04:39:28 -0000
Message-Id: <20220601043932.5F17740529@smtp2.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-05-31
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

Autobuild statistics for 2022-05-31
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  | 18  |  3  |  0  | 21  |
    master   | 91  | 101 |  0  | 192 |

Classification of failures by reason for master
-----------------------------------------------

         host-gcc-final-10.3.0 | 17
           libfreeimage-3.18.0 | 10
                 uclibc-1.0.40 | 6 
                 zlib-ng-2.0.6 | 4 
dahdi-linux-5c840cf43838e06... | 3 
                 dash-0.5.11.5 | 3 
glibc-2.35-96-g2c4fc8e5ca74... | 3 
         host-gcc-final-11.3.0 | 3 
                  acpid-2.0.33 | 2 
        edk2-edk2-stable202102 | 2 
                elfutils-0.186 | 2 
  gobject-introspection-1.70.0 | 2 
          host-gcc-final-9.4.0 | 2 
host-pahole-73383b3a39afe86... | 2 
              libgcrypt-1.10.1 | 2 
             libopenssl-1.1.1o | 2 
                    ola-0.10.8 | 2 
                   perl-5.34.1 | 2 
               protobuf-3.20.1 | 2 
                     refpolicy | 2 
    toolchain-external-bootlin | 2 
                       unknown | 2 
                  exempi-2.6.1 | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
                host-go-1.18.2 | 1 
           host-nodejs-16.15.0 | 1 
             libgpg-error-1.42 | 1 
                libzlib-1.2.12 | 1 
       linux-5.10.104-cip3-rt3 | 1 
              liquid-dsp-1.4.0 | 1 
         multipath-tools-0.8.9 | 1 
                    musl-1.2.3 | 1 
   openvmtools-10.3.5-10430147 | 1 
                 pixman-0.40.0 | 1 
            python-ujson-5.2.0 | 1 
                      rauc-1.6 | 1 
rtl8723bu-19b4bdc05483a1e79... | 1 
                    sdl-1.2.15 | 1 
                sg3_utils-1.47 | 1 
       shadowsocks-libev-3.3.5 | 1 
              swupdate-2022.05 | 1 
                   tor-0.4.7.7 | 1 
                   uacme-1.7.1 | 1 
                 wavemon-0.9.4 | 1 
                  zabbix-5.4.9 | 1 
                  zchunk-1.2.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |          acpid-2.0.33          | NOK | http://autobuild.buildroot.net/results/85823c0106dbba0d1a7993cb456f528712dfc877 | ORPH
   mips64    |          acpid-2.0.33          | NOK | http://autobuild.buildroot.net/results/84bf08b5a7869076e3b1becd6c400a5c68e4ed90 | ORPH
    i686     | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/5a68eb59febb70025eb589b6f54ec8245e2c9ec0 |     
microblazeel | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/23c57b87cf8de3d3129e2389354b4d179bfdfee8 |     
   sh4eb     | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/04c1115330bbaab1594db0831de8ae2efb52d85d |     
  sparc64    |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/2242267b60f139b54c7399fe095b181c2c2543cc | ORPH
  sparc64    |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/2b500fbad4a08a63eebe2596581a4f83580d9a09 | ORPH
  aarch64    |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/9048824690b5fb3421351a7f6db3db2d605a59e8 | ORPH
  aarch64    |     edk2-edk2-stable202102     | NOK | http://autobuild.buildroot.net/results/bb2c2191df482cb7445f2e602c3ae2b7117b3c29 |     
   x86_64    |     edk2-edk2-stable202102     | NOK | http://autobuild.buildroot.net/results/f1de3405829935e5ecc4625345a06db2bff34dca |     
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/f289b3d453d84b4ec8394bb67cc0daa92e16b69e | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/7e6089981d2b349d56ae676542ed5eb1fe81413e | ORPH
    arm      |          exempi-2.6.1          | NOK | http://autobuild.buildroot.net/results/d5482aa9696f4951af89023c94fb96d8a6858683 |     
    sh4a     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/fe980e6924c3ddef0a9cefec23d1204fc4afadc4 |     
  riscv32    | glibc-2.35-96-g2c4fc8e5ca74... | NOK | http://autobuild.buildroot.net/results/587c58c4a42ca63239df1ca88cb750ec2c857923 |     
  riscv32    | glibc-2.35-96-g2c4fc8e5ca74... | NOK | http://autobuild.buildroot.net/results/61a43b83fd0b59ffb317cba946f91db09d0ec101 |     
  riscv32    | glibc-2.35-96-g2c4fc8e5ca74... | NOK | http://autobuild.buildroot.net/results/d8683e93f275b9d681d3f950988ed9c4d1293d9a |     
    or1k     |  gobject-introspection-1.70.0  | NOK | http://autobuild.buildroot.net/results/db528e9b5eaa545c2ce085ea5960330a682501cf | ORPH
microblazeel |  gobject-introspection-1.70.0  | NOK | http://autobuild.buildroot.net/results/dc62f98b11bf3a15fa398c969f39ad970b7d1d5b | ORPH
 powerpc64   |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/ebc3c12bd1770c2d6271d5a2592ebaf72d9717d0 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/222e097403486185d2b687b660d7d5f44737d5d5 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/06f0da9c7d1dd654365a28b95daccc805922fcc5 |     
   nios2     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/6f179b5bef5e975ba3a8eb5e1889d6382ed1db8e |     
powerpc64le  |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/3e6f1fa6914a6b08aba2646d7625e7925c937626 |     
  sparc64    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/6f911bc32c18bbc61b0ca4043ca90b88f5e089c6 |     
   nios2     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/5b565175501f765abf2832f41f7707e2b5241317 |     
 powerpc64   |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/1b93f4c08c9029e99c762c324dc2560e48446882 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/45135fbd4244f7590d8d437f2474a2a9f14d70a8 |     
  riscv32    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/5c76a28f07eaf9b8f653e3cbc1138dc7b36434fa |     
  sparc64    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/0478405458756c793a01838812e0da220189ad1b |     
 powerpc64   |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/e8c6336611446f775f9b6a0465e593459fa7a459 |     
  sparc64    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/955d383992eba65aa73ed021bd2db3863b9a8271 |     
  riscv32    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/b080dc535aeb109455e14e724001a7e9e8d2b7bb |     
powerpc64le  |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/c8b2a8d79ff2a0bdc189feddb702ad18175a8519 |     
   nios2     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/fb162a6c88932ee2f35b376ba5104fe205b2c34c |     
 powerpc64   |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/a448ccdb4eec3835cebe304e1314174c8e9ee626 |     
  sparc64    |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/f6a68478a061ee3c44041e24e9e8f5587e9fd2ab |     
   nios2     |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/16097d5a2bb329a777a092eef1edc37e149a2654 |     
powerpc64le  |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/508ecf07e223917038f633fb35ae7915d028a210 |     
powerpc64le  |      host-gcc-final-9.4.0      | NOK | http://autobuild.buildroot.net/results/b87fee789272364ad69828416e0603c39664d2f3 |     
powerpc64le  |      host-gcc-final-9.4.0      | NOK | http://autobuild.buildroot.net/results/833fa10c6986045653fe302844ead808f48c7a27 |     
  mips64el   |         host-go-1.18.2         | NOK | http://autobuild.buildroot.net/results/48ad5154986f2677d3136dc5d97937179216b154 |     
   mipsel    |      host-nodejs-16.15.0       | NOK | http://autobuild.buildroot.net/results/4abdca259b5de730adb8a4c2ba6ad4b96f9f08a3 |     
    arm      | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/ad895f2a3ae36ab8a39bda9dd3ee462298f9fa36 |     
    arm      | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/ace79ff9e4f1ec34bf8639c90beb8e0b65769d24 |     
    arm      |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/650205fae30ab71e3758da17fe717aa94b50c616 |     
    arm      |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/d0d9e8357b7df2600a9155b00f6439c095c8716a |     
    m68k     |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/62da55481f3ed49afbea8d0e774f739e2957a11d |     
    arm      |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/504dfb09b6c8fd21ebf42bcb33a3ac91e7d4555a |     
    arm      |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/88965cd8c8aceb8a99a227d468750df9fe73115b |     
  sparc64    |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/798b8084048182b0ce042e05a16d20d83179a516 |     
   x86_64    |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/ba3e9f796745cf29be6bf99757129f29dabb4962 |     
  riscv32    |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/2273196d39908f0c6d56c4ec951ac05d58e0a241 |     
   sparc     |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/2662b85f909b8dad34d1054770c8888c3cf26292 |     
 powerpc64   |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/50bc75a5ad6bb9ab7d63bacf4f354a2be2bd391c |     
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/54797366387c83646dfa415e49b7e3f9ac428b5f | ORPH
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/f0704303021f5abd2592a7310d88eb3a6eb511af | ORPH
  aarch64    |       libgpg-error-1.42        | NOK | http://autobuild.buildroot.net/results/c3cd7ccfc593940da634f6376e2d1a2550584862 | ORPH
    arc      |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/fe49e6fecceca9a7eeb93621d3b7d20ff9cd35ff |     
 microblaze  |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/197906413e06e767f00c4dd3f92eda91064a6ccf |     
    m68k     |         libzlib-1.2.12         | NOK | http://autobuild.buildroot.net/results/e83dda6540123915d04905a62e55a88368b2f923 | ORPH
  mips64el   |    linux-5.10.104-cip3-rt3     | NOK | http://autobuild.buildroot.net/results/d4beae0ce55e72582e7ff4d20aa837e02a7ecd9f | ORPH
    arm      |        liquid-dsp-1.4.0        | NOK | http://autobuild.buildroot.net/results/864993e7f52a2204e26fcd852b7ff44ac9ff17e7 |     
    i686     |     multipath-tools-0.8.9      | NOK | http://autobuild.buildroot.net/results/79d561f58773a02dda4a4b443d358deb8eaf96b0 |     
  powerpc    |           musl-1.2.3           | NOK | http://autobuild.buildroot.net/results/079e3a8c1142791c5f5455eab6b1de2e3fadd9ae |     
    arm      |           ola-0.10.8           | NOK | http://autobuild.buildroot.net/results/71095f2ebffbda8713521561084b8b1d1f4d3d50 |     
    arm      |           ola-0.10.8           | NOK | http://autobuild.buildroot.net/results/301894d41bdcccc6203028889ab08ffac40845a0 |     
   x86_64    |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/9ca054d12d2ce6c48d89f77116d97630a55cee55 |     
    arm      |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/703a71b5e0331e634952e503c16a0c38366f6fdf |     
    m68k     |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/eddffa046a0399c163602d123f65a6a359b4b346 |     
   sh4eb     |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/c9d35d5975311a191dfbe12291398503987e804e |     
    or1k     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/e7bf8456e903318a78b547b2db725b57405e3cbf |     
   nios2     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/ed27f19f39bf9acdf4e4f6b263fd4d70d9d9171b |     
    arc      |       python-ujson-5.2.0       | NOK | http://autobuild.buildroot.net/results/4a9d2b838c385e0cdc50201f4f5293430812a45c |     
   sparc     |            rauc-1.6            | NOK | http://autobuild.buildroot.net/results/1a093c0e194a061836884419d2f50506105db01e |     
   x86_64    |           refpolicy            | NOK | http://autobuild.buildroot.net/results/643289cca68ffa17193d2612f3a66acdd0f2b95f |     
   arceb     |           refpolicy            | NOK | http://autobuild.buildroot.net/results/36573dd6f80821d25ad8730a4e8a306e459357b3 |     
   xtensa    | rtl8723bu-19b4bdc05483a1e79... | NOK | http://autobuild.buildroot.net/results/c57889c58121c6397d8e1dee546e51008b2485b8 | ORPH
   sh4aeb    |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/baa7dd97d04a8016ca7e404200b2001255a06504 | ORPH
    m68k     |         sg3_utils-1.47         | NOK | http://autobuild.buildroot.net/results/5bb237c72a1789d24ed8c7fba9538ebee184c10b |     
   mips64    |    shadowsocks-libev-3.3.5     | NOK | http://autobuild.buildroot.net/results/c94258c7a7c6df4e303e84a6fdc7271d1f59807d |     
  powerpc    |        swupdate-2022.05        | NOK | http://autobuild.buildroot.net/results/4831cf915e49b91cd8e45ea274de250843378405 |     
  sparc64    |   toolchain-external-bootlin   | NOK | http://autobuild.buildroot.net/results/58e2e88e4683d136f187fe256c563049789d51ef |     
   mips64    |   toolchain-external-bootlin   | NOK | http://autobuild.buildroot.net/results/120082d03ed388241d81195b7abb19bc9b35d60b |     
 microblaze  |          tor-0.4.7.7           | NOK | http://autobuild.buildroot.net/results/d166f46f8dca3173431b29703aefe956653b9c4f |     
 aarch64_be  |          uacme-1.7.1           | NOK | http://autobuild.buildroot.net/results/0a92b805874cb238ebe196f510df5dd36af51bdc |     
  powerpc    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/31a781d7e7eb480c288226b5e786edfb5f9d50d3 |     
  powerpc    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/e51f77c32e0f422731106ec9f0256b4094126e8e |     
   xtensa    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/4bae379b0affd9247d48155b48d6e0a26daf0f11 |     
  riscv64    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/803b4a683c65f14287cbd7b82588a1783423fd38 |     
   xtensa    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/37f3b469057280bd63fff70d1ce51298492b4505 |     
  powerpc    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/b6df09e2bce5e35a9f11fb96bca658717a00bc1d |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/0b01e78c13238f559e8af2b07fb99b7d971bf654 |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.net/results/948f58ad5ede27bb46c32083d10e3833115893af |     
  riscv32    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/983ac35792c5eeb97840a0e234dc5c0695c0be3f |     
   s390x     |          zabbix-5.4.9          | NOK | http://autobuild.buildroot.net/results/cc947038510e16417298b381521f226f7c45f986 |     
microblazeel |          zchunk-1.2.2          | NOK | http://autobuild.buildroot.net/results/97808b36b6c76f9c97d27180ebfdea9c6d3e2296 |     
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/1dbda459e3c7d882df768e6dc6e06f002c7baf18 | ORPH
  aarch64    |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/ea80a0f96d03f5f145b54460af45e894b1f4e6d2 | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/bd440c8ee6520f14ac9861970ba5531ed1140c6a | ORPH
  aarch64    |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/e5a682c8bc4ed7aaab0b37cebfb4c88b1447e6c1 | ORPH


Classification of failures by reason for 2022.02.x
--------------------------------------------------

                  exempi-2.6.1 | 1 
                   grpc-1.43.0 | 1 
           host-nodejs-14.18.3 | 1 


Detail of failures for 2022.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |          exempi-2.6.1          | NOK | http://autobuild.buildroot.net/results/ebd0f248dbb3644676de6693b00e3e573247378d |     
  mips64el   |          grpc-1.43.0           | NOK | http://autobuild.buildroot.net/results/e70448c71412519e39e8656734b2cfcaaac7d2cd |     
   s390x     |      host-nodejs-14.18.3       | NOK | http://autobuild.buildroot.net/results/162a8b6dcdb8f6a1a5de906fdf5b66a229c482e8 |     


Gitlab CI results for 2022-05-31
================================

Detail of defconfig failures for 2022.05-rc2
--------------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
                qemu_aarch64_sbsa | https://gitlab.com/buildroot.org/buildroot/-/jobs/2523793609  |      
                qemu_m68k_mcf5208 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2523793623  |      
           qemu_xtensa_lx60_nommu | https://gitlab.com/buildroot.org/buildroot/-/jobs/2523793693  |      


Detail of runtime-test failures for 2022.05-rc2
-----------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
                 TestEdk2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2523793700  | ORPH 
      TestIso9660Grub2EFI | https://gitlab.com/buildroot.org/buildroot/-/jobs/2523793763  | ORPH 
   TestIso9660Grub2Hybrid | https://gitlab.com/buildroot.org/buildroot/-/jobs/2523793769  | ORPH 
    TestPythonPy3Crossbar | https://gitlab.com/buildroot.org/buildroot/-/jobs/2523794109  | ORPH 



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
