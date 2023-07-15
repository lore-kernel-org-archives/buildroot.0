Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 317D4EB64DC
	for <buildroot@archiver.kernel.org>; Sat, 15 Jul 2023 04:46:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 75EDF60838;
	Sat, 15 Jul 2023 04:46:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 75EDF60838
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R0ZAY6P7Hp_8; Sat, 15 Jul 2023 04:46:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F05BC60881;
	Sat, 15 Jul 2023 04:46:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F05BC60881
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E1A021BF290
 for <buildroot@lists.busybox.net>; Sat, 15 Jul 2023 04:46:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A499082312
 for <buildroot@lists.busybox.net>; Sat, 15 Jul 2023 04:46:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A499082312
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IwWIGznD52gR for <buildroot@lists.busybox.net>;
 Sat, 15 Jul 2023 04:46:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5CCA582119
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5CCA582119
 for <buildroot@buildroot.org>; Sat, 15 Jul 2023 04:46:49 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 67C831BF20D
 for <buildroot@buildroot.org>; Sat, 15 Jul 2023 04:46:46 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sat, 15 Jul 2023 04:46:46 -0000
X-GND-Sasl: bot@bootlin.com
Message-Id: <20230715044651.A499082312@smtp1.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1689396406; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=UWGQIh3aMgzxUkxe1SwaxzH4+dMl7KWDzUIzZQNXW1g=;
 b=mpXfxQuOPV1J+QNBnjVxWTWZBu3BhExaBHziKriniGT5E/5XLXQmV7rlBS/VrH7dqgj7pu
 AsoDH/Lod2Z2w4n9AnE7nVdj4/dOfwZJzft/J5C647ajd1D5xyFKJb7g57GMaSisDJMhxJ
 BEE15e1SgAj6Qc4dSZ3rsLJSrxbitkSPIlFtgXBoYmB7X8NUMn5Av7mb/WG45F0ms75AxZ
 eHPunj2SvYLW6hYcLzFBzrNKqi+v5dlnrlXZw9eE5YtwaKx8rhgRX2uw/XIrYvFX3YW1Fm
 SnqOBQHEYKQzJC4YzE0sv1dKUznOBWk+1GGxGRH1F2jShMHnBKpmtb6Y81PPgQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=mpXfxQuO
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-07-14
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

Autobuild statistics for 2023-07-14
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  |  4  |  4  |  0  |  8  |
    master   | 144 | 111 |  1  | 256 |

Classification of failures by reason for master
-----------------------------------------------

                elfutils-0.189 | 7 
  gobject-introspection-1.74.0 | 6 
                  check-0.15.2 | 5 
               host-go-1.19.11 | 5 
       linux-firmware-20230515 | 5 
             host-ccache-4.8.2 | 4 
          libedit-20221030-3.1 | 4 
            host-binutils-2.39 | 3 
               libglib2-2.76.1 | 3 
               lightning-2.2.2 | 3 
                   linux-6.4.2 | 3 
               nfs-utils-2.6.3 | 3 
                   trinity-1.9 | 3 
ulog-0389d243352255f6182326... | 3 
               util-linux-2.39 | 3 
             batman-adv-2022.3 | 2 
                  eudev-3.2.12 | 2 
              host-rust-1.70.0 | 2 
     linux-5.10.162-cip24-rt10 | 2 
                 opensc-0.23.0 | 2 
                    sdl-1.2.15 | 2 
                alsa-lib-1.2.9 | 1 
                beecrypt-4.2.1 | 1 
                  boost-1.82.0 | 1 
            btrfs-progs-5.16.2 | 1 
                 dash-0.5.11.5 | 1 
                 dhcp-4.4.3-P1 | 1 
           dmraid-1.0.0.rc16-3 | 1 
         docker-compose-2.20.0 | 1 
                elfutils-0.186 | 1 
                     file-5.43 | 1 
fs/romfs/romfs.mk:32: /home... | 1 
fs/ubi/ubi.mk:51: /home/aut... | 1 
fs/ubi/ubi.mk:51: /home/aut... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
glibc-2.37-2-g9f8513dc64119... | 1 
                gnu-efi-3.0.15 | 1 
         gobject-introspection | 1 
            host-binutils-2.38 | 1 
            host-binutils-2.40 | 1 
              host-rust-1.71.0 | 1 
                 libssh-0.10.5 | 1 
          linux-5.10.162-cip24 | 1 
                   linux-tools | 1 
              liquid-dsp-1.4.0 | 1 
              mosquitto-2.0.15 | 1 
                 mpg123-1.31.3 | 1 
                    mutt-2.2.9 | 1 
                  ntp-4.2.8p17 | 1 
                    olsr-0.9.8 | 1 
               openblas-0.3.23 | 1 
                   perl-5.36.1 | 1 
rtl8189fs-75a566a830037c7d1... | 1 
                   shadow-4.13 | 1 
tovid-87c676f4aadb7303d2cd9... | 1 
                 uclibc-1.0.43 | 1 
                       unknown | 1 
                xenomai-3.0.10 | 1 
                  xvisor-0.3.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |         alsa-lib-1.2.9         | NOK | http://autobuild.buildroot.net/results/e8c706ecbdfa8aa976b93138386040a6b33345da |     
   s390x     |       batman-adv-2022.3        | NOK | http://autobuild.buildroot.net/results/46f748b829f8e90d8a0b4caee07685126e259358 |     
powerpc64le  |       batman-adv-2022.3        | NOK | http://autobuild.buildroot.net/results/a912f1a506859f17b394e322187e895cf3c428e9 |     
 powerpc64   |         beecrypt-4.2.1         | NOK | http://autobuild.buildroot.net/results/a268e2a353b51894fc7aa23491405edd90d77af6 | ORPH
    arc      |          boost-1.82.0          | NOK | http://autobuild.buildroot.net/results/1226e9ee72513e9116ef44d6fa12be7ba8267772 |     
    or1k     |       btrfs-progs-5.16.2       | NOK | http://autobuild.buildroot.net/results/a9f2e5822e6d2dd240378db6abff349282243a84 | ORPH
   mips64    |          check-0.15.2          | NOK | http://autobuild.buildroot.net/results/32d2c4b82bb216232bff0c62ab24c3c91d5d0fd4 | ORPH
 microblaze  |          check-0.15.2          | NOK | http://autobuild.buildroot.net/results/5fe71f81a81343b22f282b2903314fe8f3d1c560 | ORPH
   xtensa    |          check-0.15.2          | NOK | http://autobuild.buildroot.net/results/307f9f74371512631dfc2bd31b103ee64371340e | ORPH
   arceb     |          check-0.15.2          | NOK | http://autobuild.buildroot.net/results/7713a13fa7fcadf679dd46dd43d3ab037af2175e | ORPH
    mips     |          check-0.15.2          | NOK | http://autobuild.buildroot.net/results/e395a0b6311bf517cbfb90866601cc84c8dab97a | ORPH
    or1k     |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/0fd28e79a1459d34f5e2a11d39ce106b2893467b | ORPH
    sh4      |         dhcp-4.4.3-P1          | NOK | http://autobuild.buildroot.net/results/468f6e8a9e887f4c2d37d28db67efe98b93a642c | ORPH
   mips64    |      dmraid-1.0.0.rc16-3       | NOK | http://autobuild.buildroot.net/results/1ea6b142d5b12937c6791cf07e1e1085dca73450 | ORPH
powerpc64le  |     docker-compose-2.20.0      | NOK | http://autobuild.buildroot.net/results/ae4988d2ed916b519c38108a722368999837e07f |     
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/364c4dd1d618ecf7542739bd35603ca3a39426a1 | ORPH
    m68k     |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/161bf562c6ce2b84eb12894009ade3db89549b87 | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/bceb9a965a9f28e9a5e1862a4154ec68eda54525 | ORPH
   arceb     |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/877eb20fd1249db09bfceb5a18d4768e85aaa20c | ORPH
  sparc64    |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/cd4ca1a2b2eabe6937cb920cda5d8e566216546e | ORPH
powerpc64le  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/39aed5b3f3a0f0e96e3a5bdfc916bc0323a4afa2 | ORPH
  sparc64    |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/95ceaa6d8591dff8e2324ebac8cd9c841fef7861 | ORPH
  aarch64    |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/2953f697ec73be0e1debba9b5a1ee94f0454e292 | ORPH
    arc      |          eudev-3.2.12          | NOK | http://autobuild.buildroot.net/results/e5b63e5098143369084d3611f5e6fb3b0893021f |     
    arc      |          eudev-3.2.12          | NOK | http://autobuild.buildroot.net/results/dfea7cb28db7cb5e0d765f68d384e0a24197d3fc |     
  riscv64    |           file-5.43            | NOK | http://autobuild.buildroot.net/results/6bd86dbb0df7dadf5c0e4f0d1fa56afac2244dfb | ORPH
    mips     | fs/romfs/romfs.mk:32: /home... | NOK | http://autobuild.buildroot.net/results/35bb86a809332faa4d7e1e3579b40a9472f7adc6 |     
 microblaze  | fs/ubi/ubi.mk:51: /home/aut... | NOK | http://autobuild.buildroot.net/results/fc324ab886c957ba405b0b154bcffec6b64639a4 |     
   sparc     | fs/ubi/ubi.mk:51: /home/aut... | NOK | http://autobuild.buildroot.net/results/2727aa37c5c815bd5c42143aecb1af1055454a43 |     
  powerpc    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/ebadf75a39cc75e10caad6e529c14dc718e6f130 |     
 microblaze  | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/517ab7ad0e76d2596974a0ba9e81f2efbd37c2ab |     
 powerpc64   | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/2c0ecc514ef88b38e309ad11d2fb1f22856c168e |     
  powerpc    | glibc-2.37-2-g9f8513dc64119... | NOK | http://autobuild.buildroot.net/results/bcf7935faf4d16a436c97f9739d49237a8528c77 |     
  mips64el   |         gnu-efi-3.0.15         | NOK | http://autobuild.buildroot.net/results/4eb50b2cb8058b6caa2c93d6afebf4da0e42b13a |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/a31188d0cc51548f14c645812ae6cd6c21c850e1 |     
   s390x     |  gobject-introspection-1.74.0  | NOK | http://autobuild.buildroot.net/results/a7b14e63a8ec7c9f48bf358db6fa0bad53c026ca | ORPH
    or1k     |  gobject-introspection-1.74.0  | NOK | http://autobuild.buildroot.net/results/6cdd35c8f852bbe43c98512ab021656efe6714d0 | ORPH
    i686     |  gobject-introspection-1.74.0  | NOK | http://autobuild.buildroot.net/results/056647880e6e10e1b98d135f5392ddb12592b2d3 | ORPH
 powerpc64   |  gobject-introspection-1.74.0  | NOK | http://autobuild.buildroot.net/results/bd949702756034bd5f6cfeff598469f29748580f | ORPH
    or1k     |  gobject-introspection-1.74.0  | NOK | http://autobuild.buildroot.net/results/6f5414307e3b4b43eeb4f17ed63b4ab0f7e93414 | ORPH
 powerpc64   |  gobject-introspection-1.74.0  | NOK | http://autobuild.buildroot.net/results/99052ccaf19e735d7e7b0d3df69cae7e4d5a3ec1 | ORPH
   nios2     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/f139b4bd9d01ff2cb1d3bac0eec08ecaf01115d4 |     
  powerpc    |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/171982258492b02cd197aeb7008da938055499ce |     
  sparc64    |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/ff016352953f5b554455b4e160f8f2643f352a86 |     
  powerpc    |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/311d3cd938c2f8fa64ed110f6d57fd72911b35e1 |     
   mipsel    |       host-binutils-2.40       | NOK | http://autobuild.buildroot.net/results/76c035b77e0a6838a6eb5697bbc930294b0a3874 |     
microblazeel |       host-ccache-4.8.2        | NOK | http://autobuild.buildroot.net/results/52fb2094a316a0806897f774f11be9b715da1ea2 | ORPH
    arm      |       host-ccache-4.8.2        | NOK | http://autobuild.buildroot.net/results/2bbc75a9a3dc4296189577eab1530b940514a1f3 | ORPH
    arm      |       host-ccache-4.8.2        | NOK | http://autobuild.buildroot.net/results/926b95ed3f4c6d74f203c6aea69da585dab1bbe8 | ORPH
    i686     |       host-ccache-4.8.2        | NOK | http://autobuild.buildroot.net/results/ac2fc6bfef5dd40640a722ee0b20b024c2f937b7 | ORPH
  mips64el   |        host-go-1.19.11         | NOK | http://autobuild.buildroot.net/results/5ad5f59a97144fa807fc09f6c6f6717f906158a8 |     
   mips64    |        host-go-1.19.11         | NOK | http://autobuild.buildroot.net/results/f48c63db1a28ff64c1f56bd69c0d9a9d017e044c |     
  mips64el   |        host-go-1.19.11         | NOK | http://autobuild.buildroot.net/results/b3620bb65620a34fbf1f322a6327de53d75a4001 |     
  mips64el   |        host-go-1.19.11         | NOK | http://autobuild.buildroot.net/results/31a1fa061ee259c6e00bc2aa640fb9674ac8c60e |     
    i686     |        host-go-1.19.11         | NOK | http://autobuild.buildroot.net/results/4ed661fb65c78b2779f03b7a5f9f2bc56e14e4b3 |     
    mips     |        host-rust-1.70.0        | NOK | http://autobuild.buildroot.net/results/6356c9fa914d1d9327a1702dc2338a502e6b62f0 |     
powerpc64le  |        host-rust-1.70.0        | NOK | http://autobuild.buildroot.net/results/ece3539d4f40e416ff288ff4e0ad839d1d15ceef |     
   x86_64    |        host-rust-1.71.0        | NOK | http://autobuild.buildroot.net/results/58443706193a891391b2ebc3c19b7e0b5b918153 |     
   sparc     |      libedit-20221030-3.1      | NOK | http://autobuild.buildroot.net/results/7350a8a39c4cb0f476a86a1f687672a459f1fe18 |     
   arceb     |      libedit-20221030-3.1      | NOK | http://autobuild.buildroot.net/results/49291abb7f3afaf45e69a7a582091f77cc5553a8 |     
   sparc     |      libedit-20221030-3.1      | NOK | http://autobuild.buildroot.net/results/2e69361c9b9bab355bea0087faf891e7f7918d08 |     
   sparc     |      libedit-20221030-3.1      | NOK | http://autobuild.buildroot.net/results/d5f955274fa6e939e67d53dc5cfea7d35a99653c |     
   arceb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/72406285c947c3380d53803aa23627ff5c1c1fee |     
    arm      |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/dfc8493bae28d262535d028c592c646991fed9a8 |     
    arc      |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/fcf1b219ab483628c786b1a6ce958f9c3cd5749e |     
   armeb     |         libssh-0.10.5          | NOK | http://autobuild.buildroot.net/results/534788ab0f0835018f8821e996a23e71dd94ed80 | ORPH
   mips64    |        lightning-2.2.2         | NOK | http://autobuild.buildroot.net/results/0ea233a54969f9c3215c0ae28e8046441bc76aba |     
   mips64    |        lightning-2.2.2         | NOK | http://autobuild.buildroot.net/results/0c2899cbfc5d575a8b46592946cb0d5f0644baea |     
   mips64    |        lightning-2.2.2         | NOK | http://autobuild.buildroot.net/results/c9d7802aaba974fa29f69702fdefc4d10735fb99 |     
   x86_64    |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/7aa4c67d0cc5faea00333c145c09988fa6b231fe | ORPH
   nios2     |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/5fe85d3738bf7bf879d5ead0f07142e52e00d0a3 | ORPH
   x86_64    |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/d197e1dbd6f15d977a22bc6f0d6939efef02fe39 | ORPH
powerpc64le  |          linux-6.4.2           | NOK | http://autobuild.buildroot.net/results/0ef4f2bc824b19463e45fc5a1d4383328d279d4a | ORPH
  mips64el   |          linux-6.4.2           | NOK | http://autobuild.buildroot.net/results/3aa931ad3d5f2baf7a7eb4b55ecd734ed69637ef | ORPH
    sh4a     |          linux-6.4.2           | NOK | http://autobuild.buildroot.net/results/1a8f48f031cf84235fb45d91e335563a45f42124 | ORPH
   s390x     |    linux-firmware-20230515     | NOK | http://autobuild.buildroot.net/results/3313c2fa1f9f7aa56ad0f2ee5d141342d7572eaa |     
    arm      |    linux-firmware-20230515     | NOK | http://autobuild.buildroot.net/results/a7817af5fd82d5e04fc24f05b7871b6ecab9b0cf |     
    or1k     |    linux-firmware-20230515     | NOK | http://autobuild.buildroot.net/results/5fd9cc96bde76c26431d120951f0f4ffdb8ee11b |     
    arc      |    linux-firmware-20230515     | NOK | http://autobuild.buildroot.net/results/0ca69aaf209979336376d79c0211f4d43646f4fe |     
   sh4eb     |    linux-firmware-20230515     | NOK | http://autobuild.buildroot.net/results/fd237455c59686d04a795af8b7e54e9f4678d073 |     
   s390x     |          linux-tools           | NOK | http://autobuild.buildroot.net/results/0788f478d6f58f448953a2822bb7b370d1210efb | ORPH
   sh4aeb    |        liquid-dsp-1.4.0        | NOK | http://autobuild.buildroot.net/results/e213164ca43de3a62173b52a774a63b6ce350493 |     
    or1k     |        mosquitto-2.0.15        | NOK | http://autobuild.buildroot.net/results/6f0d6eed7dc30331a56f77ce2706ac140bf7596b |     
   sh4aeb    |         mpg123-1.31.3          | NOK | http://autobuild.buildroot.net/results/370ffdf8610a118dd319810fe085392ee69b43eb |     
   mips64    |           mutt-2.2.9           | NOK | http://autobuild.buildroot.net/results/787f2e26efdad3d1957cd56580f3d0e65cab8a6c |     
    m68k     |        nfs-utils-2.6.3         | NOK | http://autobuild.buildroot.net/results/64bc2f40f25c3a2267d03a70e7e490db4ffcf1c7 |     
    mips     |        nfs-utils-2.6.3         | NOK | http://autobuild.buildroot.net/results/3efefa587a1e7d057329b1eb430c97d0fa434868 |     
    m68k     |        nfs-utils-2.6.3         | NOK | http://autobuild.buildroot.net/results/7bd9505e2b1236b999d9d06b2a73601cb4f53b4d |     
  riscv64    |          ntp-4.2.8p17          | NOK | http://autobuild.buildroot.net/results/2bb8b38d2e9a88bd23e35ec4a78a21cdb524e85f |     
 powerpc64   |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/302639f6fd1b8e24a2ef551c1c286aeafafc4ecb | ORPH
    i686     |        openblas-0.3.23         | NOK | http://autobuild.buildroot.net/results/c7d0ef7d8e39633e69cd64187ab19d0cb6bc1ce5 |     
   mipsel    |         opensc-0.23.0          | NOK | http://autobuild.buildroot.net/results/b5819fe8f405bb9a31372b357b046f96a551ee9d | ORPH
   nios2     |         opensc-0.23.0          | NOK | http://autobuild.buildroot.net/results/e88726ccb772e06641ea78ea1757456ee3048409 | ORPH
    i686     |          perl-5.36.1           | NOK | http://autobuild.buildroot.net/results/18d601804282fd514f8223ab5d67e218d222363d |     
  sparc64    | rtl8189fs-75a566a830037c7d1... | NOK | http://autobuild.buildroot.net/results/fe67db3884573ef750eda9d0dccd5f97b3ae698e |     
   sh4eb     |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/d75e65d9edec0846b91b87d6dfffae5b735ba654 | ORPH
    sh4      |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/f473ecd4b2e5623419d777a8eb46fbf76a2381d4 | ORPH
 aarch64_be  |          shadow-4.13           | NOK | http://autobuild.buildroot.net/results/6bb9b23b12306195827eac97d289c399dd3879c6 |     
  mips64el   | tovid-87c676f4aadb7303d2cd9... | NOK | http://autobuild.buildroot.net/results/b571d7838950e0b5ca67106cbcd9ba61b4f04a48 |     
powerpc64le  |          trinity-1.9           | NOK | http://autobuild.buildroot.net/results/8d624ba49348814999617673b6b4d8158d50f013 | ORPH
   x86_64    |          trinity-1.9           | NOK | http://autobuild.buildroot.net/results/f7f6be8603bf652440e11aafe1f3254d4137d5a6 | ORPH
  aarch64    |          trinity-1.9           | NOK | http://autobuild.buildroot.net/results/aa3436b91a24223232cd2fcf0a06a6389ac90631 | ORPH
  powerpc    |         uclibc-1.0.43          | NOK | http://autobuild.buildroot.net/results/038fc6e6773f959c73f6a376a250df8139a7a8ee |     
   nios2     | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/072070d88b4db916bb5e81755d74bc6b28109c84 |     
powerpc64le  | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/725de3df03dbb4112889c3e4269d1e2a8a838f24 |     
powerpc64le  | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/b376af07e895fe70de1be63251051d24e458c5b0 |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.net/results/67c036d7fbb99b6d796c135f8ab503c57d566e3e |     
powerpc64le  |        util-linux-2.39         | NOK | http://autobuild.buildroot.net/results/986ac11afa9ae1dc9736c9358c4c2be64f443c55 | ORPH
    arc      |        util-linux-2.39         | NOK | http://autobuild.buildroot.net/results/980191d683fe57a92108afae05b71041310125d1 | ORPH
    arc      |        util-linux-2.39         | NOK | http://autobuild.buildroot.net/results/dd1b4c1d27773aa5288249eb9a3f0ca3db8a92bb | ORPH
    i686     |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/79ac52a1df6f74e937e591b53e84997165300787 |     
   x86_64    |          xvisor-0.3.2          | NOK | http://autobuild.buildroot.net/results/43ca64e827bea468345f0b5aa76c65f077081a69 |     


Classification of failures by reason for 2023.02.x
--------------------------------------------------

               libglib2-2.72.3 | 1 
                  linux-6.1.35 | 1 
                    olsr-0.9.8 | 1 
                    sdl-1.2.15 | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/330acec3b664434f90a3fa5a5f61b52bf682c67a |     
   x86_64    |          linux-6.1.35          | NOK | http://autobuild.buildroot.net/results/c402f2a43372cebcf36413b25d39b8308c8427f4 | ORPH
    m68k     |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/722a647bb7dd2749e6d93ddd1b75eb523adbdd3a | ORPH
   sh4eb     |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/71ca7359f3ca908ce03061868855a10d950ff772 | ORPH


Gitlab CI results for 2023-07-14
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
                 atmel_sama5d3xek | https://gitlab.com/buildroot.org/buildroot/-/jobs/4644995812  |      
                             ci20 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4644995836  |      
        engicam_imx6qdl_icore_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4644995839  |      
           freescale_imx6qsabresd | https://gitlab.com/buildroot.org/buildroot/-/jobs/4644995850  |      
              freescale_imx8mmevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/4644995855  |      
              freescale_imx8mnevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/4644995856  |      
              freescale_imx8mpevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/4644995858  |      
              freescale_imx8mqevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/4644995859  |      
              freescale_imx8qmmek | https://gitlab.com/buildroot.org/buildroot/-/jobs/4644995860  |      
             freescale_imx8qxpmek | https://gitlab.com/buildroot.org/buildroot/-/jobs/4644995862  |      
                 hifive_unleashed | https://gitlab.com/buildroot.org/buildroot/-/jobs/4644995877  |      
                 imx6-sabresd_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4644995885  |      
                       imx8mmpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/4644995895  |      
                        imx8mpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/4644995898  |      
                        imx8mqevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/4644995899  |      
                       ls1028ardb | https://gitlab.com/buildroot.org/buildroot/-/jobs/4644995912  |      
                       nitrogen8m | https://gitlab.com/buildroot.org/buildroot/-/jobs/4644995956  |      
                      nitrogen8mm | https://gitlab.com/buildroot.org/buildroot/-/jobs/4644995958  |      
                      nitrogen8mn | https://gitlab.com/buildroot.org/buildroot/-/jobs/4644995962  |      
                      nitrogen8mp | https://gitlab.com/buildroot.org/buildroot/-/jobs/4644995966  |      
              octavo_osd32mp1_brk | https://gitlab.com/buildroot.org/buildroot/-/jobs/4644995969  |      
              octavo_osd32mp1_red | https://gitlab.com/buildroot.org/buildroot/-/jobs/4644995972  |      
                   orangepi_lite2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4644996017  |      
                orangepi_one_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/4644996029  |      
                   pc_x86_64_bios | https://gitlab.com/buildroot.org/buildroot/-/jobs/4644996055  |      
                    pc_x86_64_efi | https://gitlab.com/buildroot.org/buildroot/-/jobs/4644996059  |      
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/4644996158  | ORPH 
               snps_arc700_axs101 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4644996208  |      
                socrates_cyclone5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4644996212  |      
                    versal_vck190 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4644996239  |      
                zynqmp_kria_kv260 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4644996250  |      
                    zynqmp_zcu102 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4644996251  |      
                    zynqmp_zcu106 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4644996252  |      



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
