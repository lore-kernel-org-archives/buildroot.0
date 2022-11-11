Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 176A4C43219
	for <buildroot@archiver.kernel.org>; Fri, 11 Nov 2022 07:35:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6975F81368;
	Fri, 11 Nov 2022 07:35:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6975F81368
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eCYuFsGlZIbn; Fri, 11 Nov 2022 07:35:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3998681360;
	Fri, 11 Nov 2022 07:35:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3998681360
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 161FD1BF85D
 for <buildroot@lists.busybox.net>; Fri, 11 Nov 2022 07:34:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E522760A84
 for <buildroot@lists.busybox.net>; Fri, 11 Nov 2022 07:34:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E522760A84
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Sm7T4zPj0xZA for <buildroot@lists.busybox.net>;
 Fri, 11 Nov 2022 07:34:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D593F60899
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D593F60899
 for <buildroot@buildroot.org>; Fri, 11 Nov 2022 07:34:54 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id C88F224000A
 for <buildroot@buildroot.org>; Fri, 11 Nov 2022 07:34:51 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Fri, 11 Nov 2022 07:34:51 -0000
Message-Id: <20221111073457.E522760A84@smtp3.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1668152092; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=IvP70/zUiNAP9lgJWj7Ddu+3HqOnZxPUOAFgW2GXE8A=;
 b=QC0zVVJfnTT34e1GJrBHU0/LVItS4IzA+cC3XQe8ahH3TldydBGKTfDsOlKrSSSm8/6DUk
 vQfCDkY3VExjD4qPBx7ZeUGsk4NfqyZMCPGDBVbt5imTTZHcwuV69pYKywYz+zuUQq3AJS
 GTQzzYz9mIl4RB9AkxDlIuzQA2iNaXY5ZU5880tn2QD9aSXmET559n1/8zd0j4zVe48O3F
 HYbrqJf9BA7poj32TSP/HTmQBJ/mf31hDTIgw3KoInAqqGuvJKptlVZrPuYYorxC2zbVRc
 EQA6EDLlbyDrhTycGb8IQGk5LivKimW+V3td+XKj31RgdKsqsIuvOMaxCL01xg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=QC0zVVJf
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-11-10
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

Autobuild statistics for 2022-11-10
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  |  6  |  1  |  0  |  7  |
  2022.08.x  | 16  | 11  |  0  | 27  |
    master   | 134 | 160 |  0  | 294 |
     next    | 53  | 107 |  0  | 160 |

Classification of failures by reason for master
-----------------------------------------------

          imagemagick-7.1.0-51 | 18
                   libnss-3.84 | 10
glibc-2.36-66-ga1dc0be03c9d... | 9 
                gerbera-1.10.0 | 8 
              host-rust-1.64.0 | 7 
                   linux-6.0.1 | 7 
  gobject-introspection-1.72.0 | 4 
            host-binutils-2.38 | 4 
                host-go-1.19.3 | 4 
                      xz-5.2.7 | 4 
              host-pahole-1.24 | 3 
               libglib2-2.72.3 | 3 
             lirc-tools-0.10.2 | 3 
                tealdeer-1.6.1 | 3 
                       unknown | 3 
              alsa-utils-1.2.8 | 2 
                  assimp-5.2.5 | 2 
                 dash-0.5.11.5 | 2 
        edk2-edk2-stable202102 | 2 
                     frr-8.3.1 | 2 
            host-binutils-2.37 | 2 
            host-binutils-2.39 | 2 
             libgpg-error-1.45 | 2 
              open62541-v1.3.3 | 2 
           python-numpy-1.23.4 | 2 
                 uclibc-1.0.42 | 2 
                 wavemon-0.9.4 | 2 
                    zeek-4.1.1 | 2 
/home/buildroot/autobuild/i... | 1 
/home/buildroot/autobuild/i... | 1 
/home/buildroot/autobuild/i... | 1 
/home/buildroot/autobuild/i... | 1 
                  aespipe-2.4f | 1 
              asterisk-16.25.2 | 1 
                bitcoin-0.21.2 | 1 
                    brltty-6.5 | 1 
          cryptodev-linux-1.12 | 1 
                   delve-1.8.0 | 1 
                     efivar-38 | 1 
                elfutils-0.186 | 1 
                  ffmpeg-4.4.3 | 1 
             fontconfig-2.13.1 | 1 
fs/romfs/romfs.mk:32: /home... | 1 
fs/ubi/ubi.mk:51: /home/aut... | 1 
fs/ubi/ubi.mk:51: /home/aut... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
                    gdal-3.5.1 | 1 
                gnu-efi-3.0.15 | 1 
                   grpc-1.50.0 | 1 
         host-gcc-final-11.3.0 | 1 
     host-moby-buildkit-0.10.0 | 1 
            host-omniorb-4.3.0 | 1 
                 host-wine-7.0 | 1 
            igh-ethercat-1.5.2 | 1 
kvmtool-f77d646ba01d04be5aa... | 1 
               libcap-ng-0.8.3 | 1 
               libsigsegv-2.14 | 1 
      linux-5.10.145-cip17-rt7 | 1 
                linuxptp-3.1.1 | 1 
                  netsurf-3.10 | 1 
                  ntp-4.2.8p15 | 1 
               openblas-0.3.21 | 1 
                    php-8.1.12 | 1 
   python-greenlet-1.1.3.post0 | 1 
                    sdl-1.2.15 | 1 
                 systemd-250.4 | 1 
                wtfutil-0.41.0 | 1 
                xenomai-3.0.10 | 1 
                    zstd-1.5.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/f38b5d820f4c6a6c1e88aa7588a83a4d2ab8b91c |     
    arc      | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/a7f0ca2671e223fee618d41911207af7a2ba7d2f |     
    mips     | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/17765bc794f173938aa658f9a7b13c6247ca4a12 |     
   armeb     | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/75330ab76758b78f44dca4bc4fdc81a023596a67 |     
  mips64el   |          aespipe-2.4f          | NOK | http://autobuild.buildroot.net/results/500c54af597372d9ecb2ca9f78ce00dc3b3c0545 | ORPH
microblazeel |        alsa-utils-1.2.8        | NOK | http://autobuild.buildroot.net/results/bc4de4dd638da7150ad09bf809e805cbbaf1489d |     
    or1k     |        alsa-utils-1.2.8        | NOK | http://autobuild.buildroot.net/results/de3b7761be281951973732286d7481f70c1627f1 |     
    mips     |          assimp-5.2.5          | NOK | http://autobuild.buildroot.net/results/624247661da13aa5bfb486ef27f766e852d37ff2 | ORPH
    or1k     |          assimp-5.2.5          | NOK | http://autobuild.buildroot.net/results/7410c62412e3bbe2a8801ad86fa50505742767c3 | ORPH
   x86_64    |        asterisk-16.25.2        | NOK | http://autobuild.buildroot.net/results/eff4caad885d11550c130bb26b9c799fe48b1bb7 |     
   s390x     |         bitcoin-0.21.2         | NOK | http://autobuild.buildroot.net/results/abf523d11239814bae0e5eba2354f804e4b20a3a |     
   mips64    |           brltty-6.5           | NOK | http://autobuild.buildroot.net/results/05d0775aedd271251598a6ae40cfb437290367fc |     
    mips     |      cryptodev-linux-1.12      | NOK | http://autobuild.buildroot.net/results/4f7e2ecec35378a87ca4551400b7af67d27567df | ORPH
powerpc64le  |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/f02d13cdf355e52bb068224c22dfd87cc6e812cb | ORPH
    sh4      |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/59411b0a0b742a77c6b942b07acff12b0020b469 | ORPH
  aarch64    |          delve-1.8.0           | NOK | http://autobuild.buildroot.net/results/ee1bef0239dc8449158a583134512bb0a2737d04 |     
  aarch64    |     edk2-edk2-stable202102     | NOK | http://autobuild.buildroot.net/results/6ebee00bc48ed25e9b8c111cd041c347c403b2c2 |     
   x86_64    |     edk2-edk2-stable202102     | NOK | http://autobuild.buildroot.net/results/8d0cb527bed968b8a8d0974f2240ef42ae133a65 |     
    arm      |           efivar-38            | NOK | http://autobuild.buildroot.net/results/37aff2ac4235f1eec1097270878480fbc88195e1 |     
   arceb     |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/f3238ed21c6fdcbb835966de8062dbd25209c859 | ORPH
    arm      |          ffmpeg-4.4.3          | NOK | http://autobuild.buildroot.net/results/93a5f6fe72092b288592050c0292cf98a74507ae |     
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/5ffc4fab3c0ee6a7d64a237817b3634b24e3d069 | ORPH
   xtensa    |           frr-8.3.1            | NOK | http://autobuild.buildroot.net/results/7fae26e6096e32d1a56c2cd8055887a97fe1c122 |     
  mips64el   |           frr-8.3.1            | NOK | http://autobuild.buildroot.net/results/5d2a8015f043bba043e78e17c20afb616f9f2d34 |     
  powerpc    | fs/romfs/romfs.mk:32: /home... | NOK | http://autobuild.buildroot.net/results/b7cd79a517145522a52912f469b470fba0308346 |     
   sparc     | fs/ubi/ubi.mk:51: /home/aut... | NOK | http://autobuild.buildroot.net/results/0423f6fbadc6c732e5ac4b75c57bd955fe7f1a97 |     
   arceb     | fs/ubi/ubi.mk:51: /home/aut... | NOK | http://autobuild.buildroot.net/results/9e23c14f8fec3981a5cae4e00458cda2b65de05a |     
    or1k     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/eb3acdfb15a1bf0a6a760cd981082a7a8831b06d |     
   s390x     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/d11d8e297058994197f15363fdc5083dde429003 |     
 powerpc64   | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/a36da93ec43560a403bc28338ccd193f0e65fe21 |     
powerpc64le  | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/e865223486964d5ab2d66147af00fe3a68a9ae8a |     
    sh4      |           gdal-3.5.1           | NOK | http://autobuild.buildroot.net/results/3ea970400744028444d78db5c4c9792b956ed3f5 |     
  aarch64    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/a659d5d878e6aa1d02dc59c467b738717803837b |     
    or1k     |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/42cc42025409ca3493d0a78e92c372a3e0af8c31 |     
    arm      |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/783ea58957b74dba10380357cd60ff2ab0652d5f |     
  sparc64    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/98755434186a8ac147526f2a92afb872b6d62c7f |     
 powerpc64   |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/4aab539b8b1c599920fb99bcddc1f32832b8fd5b |     
  aarch64    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/d34cad37ba96d86b2c2d8240cb6509b6a9bf1b65 |     
   x86_64    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/7c54323a5c13d8b80c297c5b7d15cd4531715fdc |     
   mipsel    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/94581cbd2af359f3a0bd9e2b5d8ce44faa157421 |     
microblazeel | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/e8f7235f16c2c9e5d32d2ac23b2ebd7b03dcc2c9 |     
    mips     | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/8b8eb472a3cd805b3e2766dbbbd429472eaa3f46 |     
    mips     | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/4bde3af5c9ed47ced1293fa23c1a49781698647f |     
  powerpc    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/11cce76d0bce3539c21d7dc52a611026af5ee9d0 |     
  riscv64    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/074ec2f0b3b7ad7198903402ce46068b72f6b714 |     
   mipsel    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/081bedf25e06ab97db9d6987b6a8ef9fa82282b7 |     
 microblaze  | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/7ca9d0bc04c1b1ab18b6c52bb19a723d9acf0896 |     
  powerpc    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/55617af71372c95e540d934225b35b5a9d2530e5 |     
    or1k     | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/250c974547bf33153b4015b996d682dc0a915cd5 |     
  mips64el   |         gnu-efi-3.0.15         | NOK | http://autobuild.buildroot.net/results/c802596c18ce7747552cd66d27c59e02bd95c13a |     
   mipsel    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/3d54dc1805638256743881a9889cd3deaf6afff1 | ORPH
 powerpc64   |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/2e3fd722f4f725ff084fce579a99e269fa04a1b2 | ORPH
   x86_64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/52224d290a504d0354ae6b18567879d5bab1a081 | ORPH
    or1k     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/f790462485e72c6a7cb8b4556bb817b4afb27407 | ORPH
    mips     |          grpc-1.50.0           | NOK | http://autobuild.buildroot.net/results/1ba4f2da40dea2205493c5c6fe5d2c959986232b |     
   mipsel    |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/1f1600ea7f9d68f398442dac8af9477c6665851b |     
 aarch64_be  |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/8b978b90b205871d53cd41518e509b712e12c7dd |     
    mips     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/4e7cf464d1dfa3805dadd7a39d825863522bfb8f |     
   mips64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/026d6f3d1dc93e932dbcdfc0241149ee1fd1bf7d |     
   sparc     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/ca836e2748a6b21036a6acd48f65ec3aed9346c3 |     
  powerpc    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/6d0fc9c3d02a69ac8b283412af44003845286e2f |     
  riscv64    |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/fda5623341bae40840b6824ab7cf2b70313264d1 |     
    i686     |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/ebf254f3290f703e3dcd76a9c9f72a7e24851613 |     
 microblaze  |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/3d635822e6273c69268c3858253aedecbf280f3e |     
   mips64    |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/7f55482faa479ab1f34beed3b8539920efc43ed0 |     
   mips64    |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/43a47f849eecf7dd46dd099729f0bee7faf64c6a |     
    i686     |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/c84cf4f45dc82fc5a00427b92926ae89e36dff15 |     
   mips64    |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/ae11c8dcc479f6c47f4c90430a3b9b1f5bbc809c |     
    arm      |   host-moby-buildkit-0.10.0    | NOK | http://autobuild.buildroot.net/results/70cb588925901fad5aecfba358ea2a2c59b443ed |     
powerpc64le  |       host-omniorb-4.3.0       | NOK | http://autobuild.buildroot.net/results/ff81aed6238b57a03205578c595ff118b95dfe79 |     
powerpc64le  |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/44560662fac95fc4f8bea50f7e2bf34648621232 |     
powerpc64le  |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/e0865eb29a2e2c4c30739c74bae018a58c20a1b4 |     
    arc      |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/ba6f7157811c5beadd8579ceb8be90b4fa55d47b |     
   mipsel    |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/f90747b7c013d4df3d47528cb30c062c84daab0c |     
    arm      |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/9e46a5bdab89ba07135a9ea71f8819378eeb236d |     
   mipsel    |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/eef4975dab5574d2edd1924ab052aeca863717a2 |     
   mipsel    |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/6ca8614739f373b9a794ef96af0925786e3890f5 |     
  sparc64    |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/b204d2725801373543c3d33a5f9045079a977299 |     
  aarch64    |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/61c256fd2439c09944eb667d226597bd25faa694 |     
   s390x     |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/b351df549741314354122d2967d9f75d6c59e4f1 |     
    i586     |         host-wine-7.0          | NOK | http://autobuild.buildroot.net/results/edc5fd32622b4c7d4da3c55fdb65467423c033c2 |     
   sparc     |       igh-ethercat-1.5.2       | NOK | http://autobuild.buildroot.net/results/19549ea9be6f2b60ea3d7e9f40f7b7820e600584 |     
  aarch64    |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/0f4427923cdfab542e02cf7e862f5cd3111cfa97 | ORPH
powerpc64le  |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/a4bf0b49bf29fb60dc9a2f0742a284e05ce4f752 | ORPH
   s390x     |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/0cfc93e60ca6e5929ad4dbfc7b48d137dfaf41d0 | ORPH
   arceb     |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/d804cc73579f6daf5418d12f86d9ae3ea7b1e61d | ORPH
    arc      |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/ad9540b25b43bdc5c575014967439ede1da00376 | ORPH
    sh4a     |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/ce4030555a5964d3faafe1199d75f8eac96d8f1b | ORPH
    arm      |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/4283235d697408cf2e70be5e3769dbe6ebb9ddae | ORPH
   sh4eb     |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/c01b64ed2eeca0bc725f325fbeda0139e459c718 | ORPH
  sparc64    |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/fe97590841451fc5bf0c247b607822703526b49d | ORPH
 powerpc64   |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/3614a6e29f878dceb657b7470fa86d52c69bc75b | ORPH
   mips64    |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/32b70ce44d7eebdbf8ddec70c0f7ec102406cbce | ORPH
    i686     |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/03301b2fbb610ecd8949b32e414292454f0a5ed7 | ORPH
   sh4eb     |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/76845484f72e027f0ec09c9e6414788fb532fd15 | ORPH
powerpc64le  |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/6c28f415277f31af30017cd95590056a48c78c80 | ORPH
   sparc     |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/3b10d4dec3b21b23833cb60eb9bbf945a79710a4 | ORPH
   nios2     |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/e6ae63bb0ff0b6ce647d636f57399e63a7167eb1 | ORPH
   mips64    |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/c8f0925add507801b59b8b35eababde44c327df6 | ORPH
   x86_64    |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/2749bae52ba3c63163e10441858c081e48629a48 | ORPH
   x86_64    | kvmtool-f77d646ba01d04be5aa... | NOK | http://autobuild.buildroot.net/results/fcc3e74a95edad9f8341330ebe1fdc5d615bac09 |     
  riscv64    |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/a5a453217ffb959928bc50e880f931166c889fed |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/409401c75b27cc79ed7d1e6ed1d1c02a2421d5c5 |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/51b630d3f9985f81215f35b940d9525b588dee84 |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/6f1f7d6eaf8399442be6f01312fff9a73f15da1b |     
  aarch64    |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/6cb725551a5cfc73bab7d624fe95e78df8f33b9c | ORPH
  aarch64    |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/76cdd2408efbb0196a779348964bc8e77fc1cce9 | ORPH
powerpc64le  |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/8f1c7ddeea1032006992c5ca924ea25a37279f52 |     
    m68k     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/5f16769b2924ce08de54da4b3f7afb52fe03dc52 |     
   mipsel    |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/c61288d7f84e1b6194847679909f72f2ce89dfce |     
powerpc64le  |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/cf62ed9096e86012ce999e222e93b4bc0739935e |     
   x86_64    |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/54fc66d53f5ee8f2154bc8b89d801c01891155f4 |     
    mips     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/b71b9fae020f619561e38d69ebdd62dc443a3cdd |     
   nios2     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/e324f9c20bca5ecc627dece19e45556099212be5 |     
 aarch64_be  |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/63d1ca14a339cd58cc5ca025f6346ad1a47f355a |     
    i686     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/76449567ea55306236a7022d922be6a67bf22475 |     
   mipsel    |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/e2bbec87c74635b299025fde5b650f9d21707d2e |     
  powerpc    |        libsigsegv-2.14         | NOK | http://autobuild.buildroot.net/results/f09f866b325f0ddf72b9c9e44e6e90ce7e4dba99 |     
    i686     |    linux-5.10.145-cip17-rt7    | NOK | http://autobuild.buildroot.net/results/4b62b89f5fc13ed82ee90c2a9936eafe6baa38c0 | ORPH
    mips     |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/d3dffd5e9bb3b5bcab5278354cfed026f7ecf1df | ORPH
  sparc64    |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/70aefa9ca9c163ec74976157145a7fd8dc573ccd | ORPH
   x86_64    |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/0f1ddf593ebc5ced75d43e1cb0ceb6c5457f7204 | ORPH
powerpc64le  |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/389675080bd989fd75d651d8e9833667c1196c42 | ORPH
   s390x     |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/c249716a794f4862d6fa566147796c938b313736 | ORPH
    arm      |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/2a850f824a3f70d1a5d05ce5fb6a117d2fc93c4e | ORPH
  mips64el   |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/d24e6421ed896ec5d36a3162950a18c7e877bd03 | ORPH
   x86_64    |         linuxptp-3.1.1         | NOK | http://autobuild.buildroot.net/results/b8c165cb4c0d3ac6ea8cd0d0d0f8cee88a819e03 |     
  aarch64    |       lirc-tools-0.10.2        | NOK | http://autobuild.buildroot.net/results/50b3db4c46c41271f8c3b2501594740a6f469ea3 | ORPH
    arc      |       lirc-tools-0.10.2        | NOK | http://autobuild.buildroot.net/results/2bcbec2094ed7dc5044589a323f169a1aafb1bf8 | ORPH
   s390x     |       lirc-tools-0.10.2        | NOK | http://autobuild.buildroot.net/results/449cad0952c5370a698ba2987e589c573342d6bb | ORPH
  mips64el   |          netsurf-3.10          | NOK | http://autobuild.buildroot.net/results/c225aaac31398ba495921bd4b85e588199822561 |     
  riscv64    |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/2c694b7540fd0ad1938239ebc2cd934220838188 | ORPH
    arc      |        open62541-v1.3.3        | NOK | http://autobuild.buildroot.net/results/c0ab8961dc4927021148dda41a7cee5b90a618ab | ORPH
   arceb     |        open62541-v1.3.3        | NOK | http://autobuild.buildroot.net/results/a0c0ea163b5426be636373fa2caba6da4f79ff85 | ORPH
   mips64    |        openblas-0.3.21         | NOK | http://autobuild.buildroot.net/results/dad7722b11c43e87a4c9c2abed6b6084d0a2a428 | ORPH
    or1k     |           php-8.1.12           | NOK | http://autobuild.buildroot.net/results/bc911dec89187319a38b576f59a425bff4782d2e |     
powerpc64le  |  python-greenlet-1.1.3.post0   | NOK | http://autobuild.buildroot.net/results/f3197dc93c463255c64bb6c2f35db384c94151bd |     
   armeb     |      python-numpy-1.23.4       | NOK | http://autobuild.buildroot.net/results/9db5ba1d9539b094b2f6ddfe04e9ade7e3b87f33 |     
   x86_64    |      python-numpy-1.23.4       | NOK | http://autobuild.buildroot.net/results/29825e855506f36c67d74123d75a9cfd709b42c5 |     
   sh4aeb    |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/e1f13ff8dd07937275041bb003abe7f7a48f0b74 | ORPH
    arm      |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/3f6ae2e503dd1539e4240f344865da4881879204 |     
  sparc64    |         tealdeer-1.6.1         | NOK | http://autobuild.buildroot.net/results/9c015aaa41b07114a92d56b9c28497b1ceaf50e0 |     
   mips64    |         tealdeer-1.6.1         | NOK | http://autobuild.buildroot.net/results/cccad06b2da3b0fd828ab3bf949c727c0f8e0394 |     
  sparc64    |         tealdeer-1.6.1         | NOK | http://autobuild.buildroot.net/results/8a9d9ffcd825074c618691e341dd0f21c01b72b6 |     
  powerpc    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/8e9adfd2c7c648938ca0ff8895ee7dbe7c091168 |     
  riscv64    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/dba330a080381c0a898084aa7494a5932b3b7338 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/c579fdbe88806fee76ee50a8603f45c44d9abc76 |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/128f498819a0a37df9f8f07129a05c64da1a1163 |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/7475f25862e46800f5b6a005d7329b96a72bd11e |     
    arm      |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/39fa76468089a9826484654a71f9ad00d908ebb3 | ORPH
   nios2     |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/932c72d958edf9a4a2962f004644469245a0ba5b | ORPH
   x86_64    |         wtfutil-0.41.0         | NOK | http://autobuild.buildroot.net/results/b097ca2d68b1f4196b748130ea2bf46a85e9cace |     
  sparc64    |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/7c210c9ee12bb17f82d4c4671026dec89b84abc6 |     
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/b8d6d5a360bca542f0b98523b1a6c8faca2a804c | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/4e5973e8d7bd7e4cbbd4b3430a198d0262469aae | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/3a8787ac2928bb8df76c9cbab4955e32f9d1abcd | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/c590ff6606af22ce35fe7fa7db101dcd30748d32 | ORPH
   xtensa    |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/858d6dcb663b91bb91f9242eeb92a8871724a05f |     
    arc      |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/0366617f6404906ef276b46476338d1e27918d74 |     
microblazeel |           zstd-1.5.2           | NOK | http://autobuild.buildroot.net/results/bbad47cca2cbc047318dec6642d0235c2ef4cd2f |     


Classification of failures by reason for next
---------------------------------------------

                   aubio-0.4.9 | 14
          imagemagick-7.1.0-51 | 10
                   libnss-3.84 | 7 
                 dash-0.5.11.5 | 5 
                      xz-5.2.7 | 5 
              host-rust-1.65.0 | 4 
                    norm-1.5.8 | 4 
                elfutils-0.186 | 3 
               libglib2-2.72.3 | 3 
           crucible-2022.05.25 | 2 
                      crun-1.5 | 2 
                     efivar-38 | 2 
            host-binutils-2.38 | 2 
         host-gcc-final-11.3.0 | 2 
     host-moby-buildkit-0.10.0 | 2 
                  jack2-1.9.21 | 2 
                libdnet-1.16.1 | 2 
                libkcapi-1.4.0 | 2 
                       unknown | 2 
              alsa-utils-1.2.8 | 1 
               ding-libs-0.6.2 | 1 
                     file-5.43 | 1 
               freeipmi-1.6.10 | 1 
fs/cramfs/cramfs.mk:46: /tm... | 1 
fs/ubifs/ubifs.mk:49: /tmp/... | 1 
fs/ubifs/ubifs.mk:49: /tmp/... | 1 
                  gensio-2.5.5 | 1 
                gerbera-1.10.0 | 1 
glibc-2.36-66-ga1dc0be03c9d... | 1 
                     gmp-6.2.1 | 1 
                gnu-efi-3.0.15 | 1 
            host-binutils-2.39 | 1 
       host-gdk-pixbuf-2.42.10 | 1 
                host-go-1.19.3 | 1 
              hyperfine-1.14.0 | 1 
            igh-ethercat-1.5.2 | 1 
          linux-5.10.145-cip17 | 1 
                linuxptp-3.1.1 | 1 
                    lxc-4.0.12 | 1 
                  ntp-4.2.8p15 | 1 
                  ntpsec-1_2_1 | 1 
                numactl-2.0.16 | 1 
                 openssh-9.1p1 | 1 
                   perl-5.34.1 | 1 
                      poke-2.4 | 1 
                     pv-1.6.20 | 1 
            python-bunch-1.0.1 | 1 
           python-numpy-1.23.4 | 1 
                tealdeer-1.6.1 | 1 
ulog-0389d243352255f6182326... | 1 
                  zabbix-5.4.9 | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mips64    |        alsa-utils-1.2.8        | NOK | http://autobuild.buildroot.net/results/2deeaaadb0cafcae6953bf1f11a212f6aa701684 |     
 microblaze  |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/99bdfb430126be5158ece62e734bf4ec68d9c353 |     
 aarch64_be  |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/789796ebf91a39e358c8968ce5e86d94138f64e2 |     
   arceb     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/8e9c22c82d1a63f3b6d9b6372b4a8dbfc667bf67 |     
   armeb     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/7cf133fcb4c10c388db4c03cec021080ac350f9c |     
   xtensa    |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/d0c5746690b78c677811688287f005a73b97aad7 |     
   mipsel    |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/5c0bd5324c90db9db11cbde9a4cd303dea310e68 |     
microblazeel |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/2c3194740e1a537c85cfd02d00bc610d7638f9c7 |     
    i686     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/83afc1eb8dda5b01aed0a69db89e5133aa12321e |     
  sparc64    |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/ed51d13d8d9af5b978af231e65aa1eff54b53676 |     
  mips64el   |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/5cc43bd54fb7c5c35571ba8ba1013568589ce2ea |     
powerpc64le  |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/14d76e91fcd7a2c2c872ff183f80ca5b65b87247 |     
 microblaze  |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/c778c9973f3d0b64416520097bae165b439637c1 |     
   x86_64    |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/c6e2e11b5863371738f14c8ea92842b5001438b0 |     
  mips64el   |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/e2015f88457859e5d05e83b53ca4daa02ab1e15b |     
   x86_64    |      crucible-2022.05.25       | NOK | http://autobuild.buildroot.net/results/b0aa752463eef130ef871ce30cc76ddacb0deb4e |     
    i686     |      crucible-2022.05.25       | NOK | http://autobuild.buildroot.net/results/d99937b2bee6578604b5d425028a3c77ef75d8be |     
   xtensa    |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/ac8e9647361ca3a7731ef78da65954af4c259615 |     
    arm      |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/d3b678c2e9e7c2b372beb9e391fa73368b67b90c |     
    sh4a     |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/f2eb02363f7ca03c2bb1d53251b4929f88eb6849 | ORPH
    sh4a     |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/db9c773b2936995d720bedb64802a4b16edecfb7 | ORPH
   armeb     |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/54266afa61f83cf01e59efc4b23aa4949c932d59 | ORPH
  aarch64    |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/85723dea3e620c479e742e2ddc9ee4c314ed45a5 | ORPH
  sparc64    |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/479b1602cfac7c5d61b1e7070d1e3b1c1fd155cb | ORPH
   arceb     |        ding-libs-0.6.2         | NOK | http://autobuild.buildroot.net/results/93999e67462d43a75f86376ff78c0c48875d7abf |     
   mipsel    |           efivar-38            | NOK | http://autobuild.buildroot.net/results/d6d2196e68ded3a8728ce2bee42b40dbbe334810 |     
   mipsel    |           efivar-38            | NOK | http://autobuild.buildroot.net/results/9c6d535714e29c93de3a8e24bc87bf2ba9e013be |     
   arceb     |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/470d87fa24d8c849fcb2f5b6d45ee554f2042c77 | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/156643a3bb73e34720e25a9b458e5e09c29a3622 | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/debb815aee27139b9fa8380a9e5a50ec57887ab5 | ORPH
  powerpc    |           file-5.43            | NOK | http://autobuild.buildroot.net/results/11388c3f264139dc86235b5c9e1f6bd94ea08c44 | ORPH
powerpc64le  |        freeipmi-1.6.10         | NOK | http://autobuild.buildroot.net/results/21d4fc71aa81424b8d07ed662e8e34e7b123bf19 |     
   x86_64    | fs/cramfs/cramfs.mk:46: /tm... | NOK | http://autobuild.buildroot.net/results/1ee9c669666706d3c2000c26c44f09f47b25c5da |     
   s390x     | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/f5bc218016dec0da6ff35dd59dc3fb12fb57d9b0 |     
 microblaze  | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/e0d85477826b42ff8fbe6c7ee090b7d40503b59a |     
 powerpc64   |          gensio-2.5.5          | NOK | http://autobuild.buildroot.net/results/cd59cb8cc27930b49839ec480b743b0a63fc2c6d |     
    i686     |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/ca6d300ad98df517828d68e97a78de9879272688 |     
   nios2     | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/1e662287cfb79850d90db2074cce5728d667a437 |     
  riscv64    |           gmp-6.2.1            | NOK | http://autobuild.buildroot.net/results/ac491c87806bd734a582f136d7577d5941a9991c | ORPH
  mips64el   |         gnu-efi-3.0.15         | NOK | http://autobuild.buildroot.net/results/36d52bde01898decb6ad329f217defcd9a1a444d |     
  mips64el   |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/f94d73ff4e7e563314064df7d5a12ce30284fd43 |     
microblazeel |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/648bc48bbe9fba12d59231a0b3f40ba09917527b |     
powerpc64le  |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/551bcdd0749b3bb58fbcee33e2f882b8073f8139 |     
   armeb     |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/a28e30a8218e0497ebb0abf45aba341a453a4b17 |     
 microblaze  |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/ec8d08323e11f26855081c94ecb68b731c826590 |     
   x86_64    |    host-gdk-pixbuf-2.42.10     | NOK | http://autobuild.buildroot.net/results/6b8a2933abea40fbd6704f12affd739264d688e2 | ORPH
  mips64el   |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/1c7fa44be1fcdd9e7a303eb76d741e857ab2ecde |     
   x86_64    |   host-moby-buildkit-0.10.0    | NOK | http://autobuild.buildroot.net/results/7517b42a23589abf3922e44dd4d59a64dd646aaf |     
    arm      |   host-moby-buildkit-0.10.0    | NOK | http://autobuild.buildroot.net/results/510b82320f72c12c39652b0a82df3bb41014ce2f |     
powerpc64le  |        host-rust-1.65.0        | NOK | http://autobuild.buildroot.net/results/bdfb7349e3a4e1149f74c3c7c29ed96533009318 |     
   x86_64    |        host-rust-1.65.0        | NOK | http://autobuild.buildroot.net/results/3f1666b9813f41e585b50bb7ea689b966ab40ae0 |     
   x86_64    |        host-rust-1.65.0        | NOK | http://autobuild.buildroot.net/results/24b3f7612e5b884791d893407319d249353c709d |     
   mipsel    |        host-rust-1.65.0        | NOK | http://autobuild.buildroot.net/results/08a8a9359d7d7d392004211508c4b3f0c8fd8c4a |     
    mips     |        hyperfine-1.14.0        | NOK | http://autobuild.buildroot.net/results/b581eb85bd46b664b22a0627433387dc8965073e | ORPH
   arceb     |       igh-ethercat-1.5.2       | NOK | http://autobuild.buildroot.net/results/594cae4e76231366aa3f06b5fd899ab6368c234d |     
    i686     |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/8516e3e0a9ead3978c7c1ec24f1ff38024ac5b0c | ORPH
   mips64    |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/ba8c3e594c467ac63b09ada6720deed488ed7978 | ORPH
    or1k     |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/d98e1800c1e596d0cb41b825d23d8e42c26f94ba | ORPH
    m68k     |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/bfb76dd9a8219c5abffedc66e339b2649f3e883c | ORPH
 aarch64_be  |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/938815fe664f26e05ef16b728126297c0a02ec83 | ORPH
   x86_64    |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/2aafae3f93ae2eade89ab2249cd283d253ffcad0 | ORPH
  aarch64    |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/2dbf88aec3a6c98f58878c9574dce543bb274855 | ORPH
  mips64el   |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/f635ab4c589ddc661adde1b3f9806e7d98375e97 | ORPH
    arm      |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/511c99adb2bc0b05d1a101e4d12ec218ee3cf154 | ORPH
    i686     |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/29bc9c15f59ef39f9c452bdb82354ea2e63f3f7f | ORPH
  aarch64    |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/d3aa23683a15d3ff1b26d895de366d0567090ad3 |     
   x86_64    |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/0198c7429476178d601a30dad187ead098850f1d |     
 aarch64_be  |         libdnet-1.16.1         | NOK | http://autobuild.buildroot.net/results/c9e1c5cce9d7c54dcd363e0c9a67abeb0e98c218 | ORPH
   s390x     |         libdnet-1.16.1         | NOK | http://autobuild.buildroot.net/results/738c1fcd78621ade089a95a3f8b4029b81f548e5 | ORPH
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/c2bd0df77384bfaba8b7c7dddede475adc30ccb2 |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/862f754e05e332ee74470ddaa30fa27a0adf4de2 |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/f6f82808dc3169ad7456b8e83137b63d58c6add4 |     
microblazeel |         libkcapi-1.4.0         | NOK | http://autobuild.buildroot.net/results/2f95015ce92c428d95df67bf28678b8cbb128e08 |     
   xtensa    |         libkcapi-1.4.0         | NOK | http://autobuild.buildroot.net/results/0558a7f25fd63f3092df03356023f64005f2b10a |     
  sparc64    |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/f6f60adb13f8410e025198a1bd287e9c9928e041 |     
  sparc64    |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/9ab21c9365391ef342badfd29afc8b0f3edb45e2 |     
 aarch64_be  |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/7cd47ef4617d6e97cf3f311407ac0d848f6db739 |     
   x86_64    |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/8911c1c631a9eb038c9f48c683f52d9c95108c6b |     
    i686     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/05afc25254dbc798050d639e1f857af381ef5550 |     
   sparc     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/5791b7a06b818a494e59352aa64e8c9caad3781b |     
    mips     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/f19f293ba53401e388459e903d738b9e9fca8e98 |     
   mips64    |      linux-5.10.145-cip17      | NOK | http://autobuild.buildroot.net/results/528e1cb4a8c28fb05e2fe0b093141153629cc2e1 | ORPH
   sparc     |         linuxptp-3.1.1         | NOK | http://autobuild.buildroot.net/results/329bc2092f43e336f44437941f1acbd32cf7ee7f |     
    or1k     |           lxc-4.0.12           | NOK | http://autobuild.buildroot.net/results/fdffdff3442e55802ccb60c3b74ce67e2e4f3e10 |     
    or1k     |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/f9551d274dcfa8a567d5c91ae1b197ca89aae20e | ORPH
    sh4      |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/f50459d161b96cdf6a77dcef5ecd46dd7b744353 | ORPH
  sparc64    |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/8bdd02fd6787f0807f8843d44d0eeb4dc03d95de | ORPH
 microblaze  |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/1d5db692c425ca2620dc1eeee6e2c6b650067091 | ORPH
    sh4a     |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/ac8598e109fe77e8b6cac273b34604efb09f9d33 | ORPH
   xtensa    |          ntpsec-1_2_1          | NOK | http://autobuild.buildroot.net/results/fffc37bbb312c5a54895bff9056ca29a6e4ac5e2 | ORPH
  riscv32    |         numactl-2.0.16         | NOK | http://autobuild.buildroot.net/results/320bf69da67c4a9acc515b149ad4fa36c326387d |     
  sparc64    |         openssh-9.1p1          | NOK | http://autobuild.buildroot.net/results/afe13bfa7ba18d69a57c6a2b9596c8be7cc7c064 | ORPH
    i686     |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/1c6fda09ca1f2eb2994fe8c7bbe629bf67369bdc |     
  riscv64    |            poke-2.4            | NOK | http://autobuild.buildroot.net/results/c0d1fc4ed1a7f7f239eb2ae3da79a0262b136f9f | ORPH
   armeb     |           pv-1.6.20            | NOK | http://autobuild.buildroot.net/results/7679838761769ba4796b4a3b0165273556c83f28 | ORPH
   s390x     |       python-bunch-1.0.1       | NOK | http://autobuild.buildroot.net/results/53de214c7dadc388031403421bba008eef72bc52 |     
   mipsel    |      python-numpy-1.23.4       | NOK | http://autobuild.buildroot.net/results/9db2bd5d8cb78eea2fbb7342d839e3b5ca773913 |     
  sparc64    |         tealdeer-1.6.1         | NOK | http://autobuild.buildroot.net/results/b803b82e6ff75e7ba5c167841fd454cbc0740be8 |     
  mips64el   | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/9c63f3bb55c0e08502d98a971a9857ccd787256c |     
 powerpc64   |            unknown             | NOK | http://autobuild.buildroot.net/results/17759dd4f451677edc1d2e6fd5624e432840a450 |     
 microblaze  |            unknown             | NOK | http://autobuild.buildroot.net/results/2853ce2302a649ccff8420f27411a9647e2a51a1 |     
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/2337dc5ee54dffe6bbfabeb041466981faff0518 | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/a28c55c3c69e2be256e29ff5e64939be5a92e629 | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/e876e3db21b849d342b90cf29a92f4f3dfcec31c | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/285e07bfc0fe3dfcc7421876a6d2975d380a2796 | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/3346aa5ab62724a4d640bafbed1348ecb8348416 | ORPH
  sparc64    |          zabbix-5.4.9          | NOK | http://autobuild.buildroot.net/results/959f0002bee90ea94acd6619584d7fbd06df651b |     


Classification of failures by reason for 2022.02.x
--------------------------------------------------

                 wavemon-0.9.4 | 1 


Detail of failures for 2022.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/1570aa45af349ee232f33cad26368690f699ab3c | ORPH


Classification of failures by reason for 2022.08.x
--------------------------------------------------

                     frr-8.2.2 | 1 
                    gdal-3.5.1 | 1 
          host-elf2flt-2021.08 | 1 
host-pahole-73383b3a39afe86... | 1 
            igd2-for-linux-2.1 | 1 
          imagemagick-7.1.0-51 | 1 
                    php-8.1.12 | 1 
                 pixman-0.40.0 | 1 
          python-orjson-3.7.11 | 1 
            python-ujson-5.2.0 | 1 
                    volk-2.5.1 | 1 


Detail of failures for 2022.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |           frr-8.2.2            | NOK | http://autobuild.buildroot.net/results/a4075f620cdff07640901d9475f620cfff9fd709 |     
    or1k     |           gdal-3.5.1           | NOK | http://autobuild.buildroot.net/results/84f772526efba654dc407158174bd72eab4600b7 |     
  riscv64    |      host-elf2flt-2021.08      | NOK | http://autobuild.buildroot.net/results/73adea1d42eda5f08b9bb6336764e41f74a70685 | ORPH
   s390x     | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/7e5f06b64b26bde1a76544a22ec22e3228059307 |     
microblazeel |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/af145aea9f684b9393f882f149b36034555b0810 |     
   mips64    |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/ffbd9ab280107b0f8e11ebee03a87a0966a62eb8 | ORPH
 microblaze  |           php-8.1.12           | NOK | http://autobuild.buildroot.net/results/082e9b0c0d94e79da6331a478cb3564aa3160759 |     
powerpc64le  |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/861823c00f82cba28f9547b3d058c94f4d727db7 |     
  powerpc    |      python-orjson-3.7.11      | NOK | http://autobuild.buildroot.net/results/a4ed5d75be22f3954d0d1d6b8a673ffba58554ba |     
   nios2     |       python-ujson-5.2.0       | NOK | http://autobuild.buildroot.net/results/0e200e53b7d12b4fd23d87084c3eb3eb494cceb9 |     
  powerpc    |           volk-2.5.1           | NOK | http://autobuild.buildroot.net/results/641cfc71ef87155d2c4174fc92a095a7285e1b86 |     



-- 
http://autobuild.buildroot.net

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

