Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88FF4EB64DA
	for <buildroot@archiver.kernel.org>; Sat,  8 Jul 2023 04:45:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C5247418A2;
	Sat,  8 Jul 2023 04:45:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C5247418A2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rmUn6Je0p0K1; Sat,  8 Jul 2023 04:45:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A89DC418A4;
	Sat,  8 Jul 2023 04:45:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A89DC418A4
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5218F1BF20B
 for <buildroot@lists.busybox.net>; Sat,  8 Jul 2023 04:45:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 14D5560ADA
 for <buildroot@lists.busybox.net>; Sat,  8 Jul 2023 04:45:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 14D5560ADA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xdaiikgBCr_j for <buildroot@lists.busybox.net>;
 Sat,  8 Jul 2023 04:45:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E0E7F60A71
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E0E7F60A71
 for <buildroot@buildroot.org>; Sat,  8 Jul 2023 04:45:26 +0000 (UTC)
X-GND-Sasl: thomas.petazzoni@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 31368240009
 for <buildroot@buildroot.org>; Sat,  8 Jul 2023 04:45:24 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sat, 08 Jul 2023 04:45:24 -0000
Message-Id: <20230708044529.14D5560ADA@smtp3.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1688791524; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=gr7I08Djz8IEOEjRdWtjf4R0wVU4kp2JJNV4DwOKOFA=;
 b=ODXzE1SaU+ibHVKgq37Einh//UvwJRD1j6HHCNErFSLvFFSG53gedVHhcVDQW9lghe+7Tt
 Ct/z5D1n0noTVPUFqyO26B/9koBro3GLLGrH6vL67PWMbVan58Px6ijZgH5xNWJJ6bwctp
 4OYVics53GRFvh9hq/HjQXKPnKcIDAJpO8Cz7OpfTQjiEtNNHVoACwu9UTd4zLG/H0r1jd
 qLYKPjMhC5PGd/4joAVjsqy/DAhTM/jx6DwxbIn2Pz7FfaSkl7foeKQD5IzUBHZQx5nSkd
 Qi5IF8Ee+sSD8gq32YishnSaRMM0Du8fPikrdrdHFU1jySVKlTIKk+76+Z3nUQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ODXzE1Sa
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-07-07
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

Autobuild statistics for 2023-07-07
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  |  3  |  4  |  0  |  7  |
    master   | 121 | 124 |  0  | 245 |

Classification of failures by reason for master
-----------------------------------------------

             bluez5_utils-5.68 | 32
                alsa-lib-1.2.9 | 7 
            host-binutils-2.39 | 7 
                  check-0.15.2 | 5 
                     linux-6.4 | 4 
                       unknown | 4 
  gobject-introspection-1.74.0 | 3 
               libglib2-2.76.1 | 3 
             dahdi-linux-3.2.0 | 2 
                elfutils-0.186 | 2 
          host-elf2flt-2021.08 | 2 
               host-go-1.19.10 | 2 
              host-rust-1.70.0 | 2 
                     lxc-5.0.2 | 2 
            quickjs-2021-03-27 | 2 
               apcupsd-3.14.14 | 1 
                    bat-0.23.0 | 1 
                  boost-1.82.0 | 1 
                bpftool-v7.1.0 | 1 
                 coreutils-9.3 | 1 
                 dash-0.5.11.5 | 1 
        edk2-edk2-stable202208 | 1 
              fftw-quad-3.3.10 | 1 
fs/cramfs/cramfs.mk:46: /ho... | 1 
fs/cramfs/cramfs.mk:46: /ho... | 1 
fs/jffs2/jffs2.mk:71: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
glibc-2.37-2-g9f8513dc64119... | 1 
                gnu-efi-3.0.15 | 1 
                   guile-3.0.9 | 1 
            host-binutils-2.38 | 1 
            host-binutils-2.40 | 1 
         host-gcc-final-12.3.0 | 1 
              host-guile-3.0.9 | 1 
          libatomic_ops-7.6.14 | 1 
               libcap-ng-0.8.3 | 1 
          libedit-20221030-3.1 | 1 
                libglvnd-1.4.0 | 1 
             libopenssl-1.1.1u | 1 
     linux-5.10.162-cip24-rt10 | 1 
                 mpg123-1.31.3 | 1 
               nfs-utils-2.6.3 | 1 
                  ntp-4.2.8p15 | 1 
            ocf-linux-20171122 | 1 
                    ola-0.10.9 | 1 
              open62541-v1.3.4 | 1 
                   perl-5.36.1 | 1 
                     pv-1.6.20 | 1 
       python-stack-data-0.6.2 | 1 
                    sdl-1.2.15 | 1 
              skalibs-2.12.0.1 | 1 
ulog-0389d243352255f6182326... | 1 
                 wolfssl-5.5.3 | 1 
                xenomai-3.0.10 | 1 
                    zeek-4.1.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 microblaze  |         alsa-lib-1.2.9         | NOK | http://autobuild.buildroot.net/results/e1f54a915b5ac5264bfd3f0b5b354c9d37390484 |     
 microblaze  |         alsa-lib-1.2.9         | NOK | http://autobuild.buildroot.net/results/487816ec99cb80e61fedb7a94be8b03dd6b8cbf9 |     
 microblaze  |         alsa-lib-1.2.9         | NOK | http://autobuild.buildroot.net/results/06b42e350f469e98da2e9d991d2bd9a92087f60f |     
 microblaze  |         alsa-lib-1.2.9         | NOK | http://autobuild.buildroot.net/results/13d22a0c5efcbf69e924d0d2f69b7df189c62d9f |     
microblazeel |         alsa-lib-1.2.9         | NOK | http://autobuild.buildroot.net/results/938420089d1305412ae40a0409b5661233211c7a |     
 microblaze  |         alsa-lib-1.2.9         | NOK | http://autobuild.buildroot.net/results/88dae96d64c4b09df20261cb80d94d84294c7722 |     
 microblaze  |         alsa-lib-1.2.9         | NOK | http://autobuild.buildroot.net/results/aef315daff2869396e9868d1213725b64a3ef430 |     
   arceb     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/d8a3ab31c5b86871c7e1117f4ffa7b6cedfcb7e0 |     
   mipsel    |           bat-0.23.0           | NOK | http://autobuild.buildroot.net/results/dd056f495b27f15278f78207561a6784caad4d04 |     
 microblaze  |       bluez5_utils-5.68        | NOK | http://autobuild.buildroot.net/results/b61e0fa2de57622b611be23f0f4c087598e14d7e |     
    mips     |       bluez5_utils-5.68        | NOK | http://autobuild.buildroot.net/results/7b4386a00cc1949d8f3b0f1b5113f469172f4489 |     
 microblaze  |       bluez5_utils-5.68        | NOK | http://autobuild.buildroot.net/results/317b3f7171f01cecbeb89eef5a318b12e7d82507 |     
  sparc64    |       bluez5_utils-5.68        | NOK | http://autobuild.buildroot.net/results/21a040eb45da48221a005fae53c5c22f10f2da10 |     
    mips     |       bluez5_utils-5.68        | NOK | http://autobuild.buildroot.net/results/dc3b767661e908b2f126e3a221c7f7043d52db19 |     
 powerpc64   |       bluez5_utils-5.68        | NOK | http://autobuild.buildroot.net/results/bb846ea5eeb30aa6da6c59e1e23e6b438e2fcf21 |     
   mips64    |       bluez5_utils-5.68        | NOK | http://autobuild.buildroot.net/results/376a7310b10efb20e77900d3aaece321954b99a5 |     
powerpc64le  |       bluez5_utils-5.68        | NOK | http://autobuild.buildroot.net/results/bc18bf60530b25c9980d2c9ae655dfb5785fa615 |     
    or1k     |       bluez5_utils-5.68        | NOK | http://autobuild.buildroot.net/results/197aaca6673b1f13457affe576dd2082c0130437 |     
  powerpc    |       bluez5_utils-5.68        | NOK | http://autobuild.buildroot.net/results/7d092e08607ebd416682f62ac753805d642eee9a |     
   armeb     |       bluez5_utils-5.68        | NOK | http://autobuild.buildroot.net/results/e9fe463ba2caebc36210c5d1ea4911b2cbc92629 |     
   x86_64    |       bluez5_utils-5.68        | NOK | http://autobuild.buildroot.net/results/0afbc03127675d9bbdd30bc720aba37d371c6804 |     
  aarch64    |       bluez5_utils-5.68        | NOK | http://autobuild.buildroot.net/results/7071180017a74d803c1592731bb4146dbd20a40a |     
  aarch64    |       bluez5_utils-5.68        | NOK | http://autobuild.buildroot.net/results/4b5f56cb3652ad37825018968f98343778026632 |     
    mips     |       bluez5_utils-5.68        | NOK | http://autobuild.buildroot.net/results/926306b8e8393d40fab2e5ed013cfcaa7135c283 |     
   nios2     |       bluez5_utils-5.68        | NOK | http://autobuild.buildroot.net/results/dffd67c62799d78504066641cdaea0fd9d9ff1d7 |     
   mips64    |       bluez5_utils-5.68        | NOK | http://autobuild.buildroot.net/results/20d4f6ff74042e77a15c67ba825317f8d032eac2 |     
    arm      |       bluez5_utils-5.68        | NOK | http://autobuild.buildroot.net/results/41c034457845d314069cdae9edfb55877f1c1d08 |     
  sparc64    |       bluez5_utils-5.68        | NOK | http://autobuild.buildroot.net/results/c1050852f3ab06ea288cf29c1deb1837c6987422 |     
   s390x     |       bluez5_utils-5.68        | NOK | http://autobuild.buildroot.net/results/dc1e8d405a2815588e397ce1be118d3aa475d74a |     
  aarch64    |       bluez5_utils-5.68        | NOK | http://autobuild.buildroot.net/results/f979949ea1a389650dc7f7147b6de2091cf077d7 |     
   s390x     |       bluez5_utils-5.68        | NOK | http://autobuild.buildroot.net/results/d1a26d4a5c02d92a49326679b63dccd416c756a5 |     
   x86_64    |       bluez5_utils-5.68        | NOK | http://autobuild.buildroot.net/results/6cfed9ff07a3d4a413b5d92af0da24ad4da438fd |     
  powerpc    |       bluez5_utils-5.68        | NOK | http://autobuild.buildroot.net/results/fcf592811f5ab42ea4bb215c0f8ccde9c242af63 |     
   mipsel    |       bluez5_utils-5.68        | NOK | http://autobuild.buildroot.net/results/aa2a70cd5529c9e01c8d11d6ba88b81cd0ee47b3 |     
 aarch64_be  |       bluez5_utils-5.68        | NOK | http://autobuild.buildroot.net/results/58423068e402940f1746949e98cf8dd59b06e398 |     
    or1k     |       bluez5_utils-5.68        | NOK | http://autobuild.buildroot.net/results/fa032c9fa563977f526c3ba6366e9fae242a0772 |     
 aarch64_be  |       bluez5_utils-5.68        | NOK | http://autobuild.buildroot.net/results/d7fe78dd7f7dcab7d1931edb39f169313ff72006 |     
  powerpc    |       bluez5_utils-5.68        | NOK | http://autobuild.buildroot.net/results/d5868efb375463a90e595203a04c5d25f4db0dab |     
 aarch64_be  |       bluez5_utils-5.68        | NOK | http://autobuild.buildroot.net/results/e803df83fc967fd11c7e01b86e0e9f7e16d187ec |     
   s390x     |       bluez5_utils-5.68        | NOK | http://autobuild.buildroot.net/results/72db50e13b325af81bbe4082e299521f557f597e |     
   x86_64    |       bluez5_utils-5.68        | NOK | http://autobuild.buildroot.net/results/00d258bb06a2c021cff7920ce87b8373ab2efc08 |     
    arc      |          boost-1.82.0          | NOK | http://autobuild.buildroot.net/results/fcf2aae5d24e0cf02fa39c75bc8dcca43ab15cf2 |     
   x86_64    |         bpftool-v7.1.0         | NOK | http://autobuild.buildroot.net/results/b7a03508c5d29960e7c1e725844e669df1a5d20b |     
 aarch64_be  |          check-0.15.2          | NOK | http://autobuild.buildroot.net/results/7d3f88ecf1c952f4b3b714cdd9890276025094ee | ORPH
   mips64    |          check-0.15.2          | NOK | http://autobuild.buildroot.net/results/c20f30e229549594938ca4c1fb2bc3d43ae8117c | ORPH
  riscv64    |          check-0.15.2          | NOK | http://autobuild.buildroot.net/results/60464483b262b59e9aafb95831e60758b827c3ca | ORPH
   arceb     |          check-0.15.2          | NOK | http://autobuild.buildroot.net/results/b1a345a2c87e1703136513d3453e9ff0d70d1cd4 | ORPH
    or1k     |          check-0.15.2          | NOK | http://autobuild.buildroot.net/results/16e63a01e2d63a08e1ccddfddd2d1e60def72e19 | ORPH
   sparc     |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/69638991036d2cc35d4e919c882322fc433ec6a7 | ORPH
   sparc     |       dahdi-linux-3.2.0        | NOK | http://autobuild.buildroot.net/results/86bab266d6189032d68a520228577954508197fc |     
   s390x     |       dahdi-linux-3.2.0        | NOK | http://autobuild.buildroot.net/results/8b140b7f4d2f2b3080cab90906c3cebea0e510c5 |     
   xtensa    |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/84a9d4584071e15615c0cbbeb60dc9f6e0332c59 | ORPH
   x86_64    |     edk2-edk2-stable202208     | NOK | http://autobuild.buildroot.net/results/503f00ae335e5a9eba799650831b413fd079a6e1 |     
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/c4dcf60dc58520be8582e1e567f6eef33d12f7ab | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/60bbf2d8a479cf87304e64eda8ac1669472af7b6 | ORPH
powerpc64le  |        fftw-quad-3.3.10        | NOK | http://autobuild.buildroot.net/results/9b7f148fd4a3a0d67c01facf295c322d3beb4ea5 | ORPH
    sh4a     | fs/cramfs/cramfs.mk:46: /ho... | NOK | http://autobuild.buildroot.net/results/b2a1036a00f87b3c4151751f9148589cea112aad |     
 aarch64_be  | fs/cramfs/cramfs.mk:46: /ho... | NOK | http://autobuild.buildroot.net/results/323782d1664a502cb90a2a3cbc718dfdc4814628 |     
   arceb     | fs/jffs2/jffs2.mk:71: /home... | NOK | http://autobuild.buildroot.net/results/9d4193069319ea6d57cefdca2d9a06bfeb0253b0 |     
 microblaze  | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/4ddbf9fe9023816767ddb20870d032ce86854d61 |     
powerpc64le  | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/566a411cd3de7c6decc4aec6193ddd3d134272de |     
    i586     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/c8d40e096ae55d100c76055c93525a6e7d7f27f0 |     
   nios2     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/ec6d43809fc4ac959b8c9895501452a6947257f1 |     
 powerpc64   | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/802db8643e69856e0eec7bb08c1a16e6d448a56a |     
   sparc     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/ccb8f1dd2885884f3d0224d1c5ebd5a9231edc23 |     
  riscv32    | glibc-2.37-2-g9f8513dc64119... | NOK | http://autobuild.buildroot.net/results/c48328a2c846ec963aa828bc7641800c8ac41502 |     
  mips64el   |         gnu-efi-3.0.15         | NOK | http://autobuild.buildroot.net/results/9e1435556fd1e4a9f0f7765ee2bab21a097a2df6 |     
  sparc64    |  gobject-introspection-1.74.0  | NOK | http://autobuild.buildroot.net/results/f7415254fc74cc12ca6e46727987227de6868ca1 | ORPH
  sparc64    |  gobject-introspection-1.74.0  | NOK | http://autobuild.buildroot.net/results/0a364a05f41120dbae71108229f76326212defa5 | ORPH
  sparc64    |  gobject-introspection-1.74.0  | NOK | http://autobuild.buildroot.net/results/238f8c4c1f75a6789b619cae210ee8c58fe26f46 | ORPH
   armeb     |          guile-3.0.9           | NOK | http://autobuild.buildroot.net/results/9bc5e47944e8b528a295b42fb0f0d94d746db8fd |     
   mips64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/40429b02413a9c197e191ffc766b062e32d9202e |     
  powerpc    |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/d716111e7a02bc96bb14edf298fcdf0ad129d0f7 |     
    m68k     |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/dc5031a58eb5ebbb6f065dd8010aa2c13a02060f |     
 powerpc64   |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/509fc080148c0abe595969e7bfa1d05d83043a5b |     
powerpc64le  |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/8ae369172a1426f2691495ad0b41b33009cce1e4 |     
 microblaze  |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/73d40e0032ea4b54a6e007da5848a3cbc9d8aa4f |     
   sparc     |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/c4c9b9d32a7d08cf42c3b53659e0f7de6af4b054 |     
   mips64    |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/c55e1e5c4316c0f18c7e42bb28e1bbed58a3a761 |     
   nios2     |       host-binutils-2.40       | NOK | http://autobuild.buildroot.net/results/fa33f378ffb1e038c5e367bd61aa684c4bfa70d7 |     
  riscv64    |      host-elf2flt-2021.08      | NOK | http://autobuild.buildroot.net/results/0e48edaba7dd79287a83805b7936d7d7c5101bbf | ORPH
  riscv64    |      host-elf2flt-2021.08      | NOK | http://autobuild.buildroot.net/results/c77a53ce3171301450e13c2c2eba9701ef9ba299 | ORPH
 microblaze  |     host-gcc-final-12.3.0      | NOK | http://autobuild.buildroot.net/results/a5ac57f543d48e341c57e33f7f9c441ce4ff460d |     
powerpc64le  |        host-go-1.19.10         | NOK | http://autobuild.buildroot.net/results/b07519ea63c64335f56b5c2daff7ba3e502e384e |     
powerpc64le  |        host-go-1.19.10         | NOK | http://autobuild.buildroot.net/results/34cae15b93ea5bed2420dbb93005b4f0fce55c1a |     
   mips64    |        host-guile-3.0.9        | NOK | http://autobuild.buildroot.net/results/e15bf76c225e6b9723f32f3f8acbe947b83372bf |     
   x86_64    |        host-rust-1.70.0        | NOK | http://autobuild.buildroot.net/results/7d729fb16ed17d218c9e36efb03bc57c3d8c29ad |     
  aarch64    |        host-rust-1.70.0        | NOK | http://autobuild.buildroot.net/results/8b9158677dde5a508db175013375c17d966dab18 |     
  riscv64    |      libatomic_ops-7.6.14      | NOK | http://autobuild.buildroot.net/results/d22f86d782dd11e5457890338ba972cccd001bec | ORPH
    or1k     |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/34a56791c6f097ef9962f7d6edc702be2de38bf3 |     
  aarch64    |      libedit-20221030-3.1      | NOK | http://autobuild.buildroot.net/results/ce1a6e0bd57e7db39c3534dbfec6eccbc8f2dd97 |     
    arc      |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/53604991742f077538b84c0d50de9bcea3cc921e |     
   arceb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/ec167845adb6321384d9d45bb828faccc48a5773 |     
   arceb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/4008daeb98229e148262d850f5b1ff2ff40234cb |     
    sh4      |         libglvnd-1.4.0         | NOK | http://autobuild.buildroot.net/results/1b07b5fb734ec7e7b736d19fb7bd6bd285584f58 | ORPH
  riscv64    |       libopenssl-1.1.1u        | NOK | http://autobuild.buildroot.net/results/88db53f25e68d31ce47ffde30e9e3c05fa0c730e | ORPH
   mipsel    |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/37e1d3b5e0b6f4f44f0f1b016d6fc22e64325440 | ORPH
  mips64el   |           linux-6.4            | NOK | http://autobuild.buildroot.net/results/60c2e6d9a9d512ccd52e1eaae955f1d30eefceac | ORPH
    arm      |           linux-6.4            | NOK | http://autobuild.buildroot.net/results/f80769710e98a162735701a976a4461e8eb1fb68 | ORPH
 powerpc64   |           linux-6.4            | NOK | http://autobuild.buildroot.net/results/d233aee86e6eb7b01658dbaec706f6dcf5552444 | ORPH
   mips64    |           linux-6.4            | NOK | http://autobuild.buildroot.net/results/fcfd60fbc8a53241ef714f18f5683dd510493f26 | ORPH
 aarch64_be  |           lxc-5.0.2            | NOK | http://autobuild.buildroot.net/results/af46ca2bbdbe4dcf7d1a69cf18082bcd268b2501 |     
   mips64    |           lxc-5.0.2            | NOK | http://autobuild.buildroot.net/results/30120e5adc75106e8a77ed3903e665611a8b216e |     
   sparc     |         mpg123-1.31.3          | NOK | http://autobuild.buildroot.net/results/bf529346697da657f336159cf6b41a869159aca5 | ORPH
   sparc     |        nfs-utils-2.6.3         | NOK | http://autobuild.buildroot.net/results/9ea19b292a7b7a55a593aaf761802a2a85ea02e5 |     
   sh4aeb    |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/d71f2b5f26eacf1e711992d59b18a3e234c39000 | ORPH
    or1k     |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/6dfe318655bbc979800186fc9e5789594de405e9 | ORPH
  sparc64    |           ola-0.10.9           | NOK | http://autobuild.buildroot.net/results/96620e4956d3f05d0d9dc77e916da2c8fd98df84 |     
   x86_64    |        open62541-v1.3.4        | NOK | http://autobuild.buildroot.net/results/e45dd83e87a444d2e2cf33fd4bb055d5b02c3001 | ORPH
  aarch64    |          perl-5.36.1           | NOK | http://autobuild.buildroot.net/results/db6fc3dda43c9cc2667e7a057525e46093641243 |     
   armeb     |           pv-1.6.20            | NOK | http://autobuild.buildroot.net/results/25b36e2f27be4da8e1d3a42da219529a983af24e | ORPH
 microblaze  |    python-stack-data-0.6.2     | NOK | http://autobuild.buildroot.net/results/69631a3cb913810a8ad72d50d09c30586c78b501 |     
   s390x     |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/0c66a1dc7d1a79cc698592c06559b952739b2233 |     
 aarch64_be  |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/9e05b93442d96639738a48cf989cbd84bc87430f |     
   sh4aeb    |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/b677f9211a81735969490ef015c1d8dde892f0cb | ORPH
    or1k     |        skalibs-2.12.0.1        | NOK | http://autobuild.buildroot.net/results/79f3867cd7bd07898420e13ff524f22a71e48455 |     
powerpc64le  | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/ae77c0f5d67675d5223bff68031e79e7266daf0b |     
 microblaze  |            unknown             | NOK | http://autobuild.buildroot.net/results/168550e0e1602984167645b86720f51deacced67 |     
   sparc     |            unknown             | NOK | http://autobuild.buildroot.net/results/5bd0b436441c99f3621e7d5091a42d43851be32b |     
   armeb     |            unknown             | NOK | http://autobuild.buildroot.net/results/bbbde13295906ba75f2e81cc8ab06dbddf844c13 |     
   sh4eb     |            unknown             | NOK | http://autobuild.buildroot.net/results/d7d7e849e2cd03440f5b819665f07d4360bcd712 |     
   mipsel    |         wolfssl-5.5.3          | NOK | http://autobuild.buildroot.net/results/eb22917a0d34639d8b6733a278ab697e160ed706 |     
   mipsel    |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/456b79d6b2bae70954439baf5b8dcdb73d634b51 |     
    sh4a     |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/440ff814c9ae2f228781eebd7d67d7280e300ba3 |     


Classification of failures by reason for 2023.02.x
--------------------------------------------------

                 dc3dd-7.2.641 | 1 
            host-binutils-2.38 | 1 
host-gdb-arc-2020.09-releas... | 1 
rtl8189fs-c223a25b1000d6443... | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/1c500043f15460b76dca7e13f8b7ed9c43cfac40 | ORPH
  powerpc    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/04d20f35b3e6f598fd0fb48a5233d42fc0d5503b |     
   arceb     | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/40a55aa0ec4ad7e85346a442b4e463267ffed185 | ORPH
 aarch64_be  | rtl8189fs-c223a25b1000d6443... | NOK | http://autobuild.buildroot.net/results/555615ec6069a6b3857d1dc31ca20323b6a7caa4 |     


Gitlab CI results for 2023-07-07
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
       acmesystems_acqua_a5_256mb | https://gitlab.com/buildroot.org/buildroot/-/jobs/4603995672  |      
                 at91sam9x5ek_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/4603995809  |      
             at91sam9x5ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/4603995823  |      
   atmel_sama5d27_som1_ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/4603995827  |      
   atmel_sama5d2_xplained_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/4603995838  |      
       atmel_sama5d3_xplained_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/4603995847  |      
   atmel_sama5d3_xplained_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/4603995859  |      
       atmel_sama5d4_xplained_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/4603995872  |      
   atmel_sama5d4_xplained_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/4603995878  |      
                        avenger96 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4603995882  |      
                       beaglebone | https://gitlab.com/buildroot.org/buildroot/-/jobs/4603995919  |      
                   beaglebone_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4603995920  |      
                      beelink_gs1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4603995934  |      
            engicam_imx6qdl_icore | https://gitlab.com/buildroot.org/buildroot/-/jobs/4603995977  |      
           freescale_imx6qsabresd | https://gitlab.com/buildroot.org/buildroot/-/jobs/4603996051  |      
              freescale_imx8mmevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/4603996070  |      
              freescale_imx8mnevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/4603996074  |      
              freescale_imx8mpevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/4603996080  |      
              freescale_imx8mqevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/4603996087  |      
              freescale_imx8qmmek | https://gitlab.com/buildroot.org/buildroot/-/jobs/4603996091  |      
             freescale_imx8qxpmek | https://gitlab.com/buildroot.org/buildroot/-/jobs/4603996105  |      
           friendlyarm_nanopi_r2s | https://gitlab.com/buildroot.org/buildroot/-/jobs/4603996118  |      
                 hifive_unleashed | https://gitlab.com/buildroot.org/buildroot/-/jobs/4603996132  |      
                       imx8mmpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/4603996178  |      
                imx8mn_bsh_smm_s2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4603996179  |      
            imx8mn_bsh_smm_s2_pro | https://gitlab.com/buildroot.org/buildroot/-/jobs/4603996181  |      
                        imx8mpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/4603996183  |      
                        imx8mqevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/4603996184  |      
                kontron_bl_imx8mm | https://gitlab.com/buildroot.org/buildroot/-/jobs/4603996186  |      
               kontron_pitx_imx8m | https://gitlab.com/buildroot.org/buildroot/-/jobs/4603996189  |      
                         lego_ev3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4603996195  |      
                       ls1028ardb | https://gitlab.com/buildroot.org/buildroot/-/jobs/4603996200  |      
      microchip_sam9x60ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/4603996207  |      
...hip_sama5d27_wlsom1_ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/4603996212  |      
    microchip_sama5d2_icp_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/4603996218  |      
      microchip_sama7g5ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/4603996225  |      
                       nitrogen8m | https://gitlab.com/buildroot.org/buildroot/-/jobs/4603996267  |      
                      nitrogen8mm | https://gitlab.com/buildroot.org/buildroot/-/jobs/4603996300  |      
                      nitrogen8mn | https://gitlab.com/buildroot.org/buildroot/-/jobs/4603996304  |      
                      nitrogen8mp | https://gitlab.com/buildroot.org/buildroot/-/jobs/4603996310  |      
              octavo_osd32mp1_brk | https://gitlab.com/buildroot.org/buildroot/-/jobs/4603996315  |      
              octavo_osd32mp1_red | https://gitlab.com/buildroot.org/buildroot/-/jobs/4603996319  |      
             olimex_a64_olinuxino | https://gitlab.com/buildroot.org/buildroot/-/jobs/4603996366  |      
                   orangepi_lite2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4603996396  |      
                orangepi_one_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/4603996413  |      
               orangepi_zero_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/4603996432  |      
              orangepi_zero_plus2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4603996428  |      
                   pc_x86_64_bios | https://gitlab.com/buildroot.org/buildroot/-/jobs/4603996439  |      
                    pc_x86_64_efi | https://gitlab.com/buildroot.org/buildroot/-/jobs/4603996443  |      
                           pine64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4603996454  |      
                    pine64_sopine | https://gitlab.com/buildroot.org/buildroot/-/jobs/4603996458  |      
                qemu_aarch64_ebbr | https://gitlab.com/buildroot.org/buildroot/-/jobs/4603996463  |      
                qemu_aarch64_sbsa | https://gitlab.com/buildroot.org/buildroot/-/jobs/4603996467  |      
                    qemu_arm_ebbr | https://gitlab.com/buildroot.org/buildroot/-/jobs/4603996476  |      
             qemu_arm_vexpress_tz | https://gitlab.com/buildroot.org/buildroot/-/jobs/4603996482  |      
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/4603996592  | ORPH 
                           rock64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4603996622  |      
                        rockpro64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4603996625  |      
            sipeed_lichee_rv_dock | https://gitlab.com/buildroot.org/buildroot/-/jobs/4603996638  |      
               snps_arc700_axs101 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4603996661  |      
                socrates_cyclone5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4603996673  |      
          solidrun_clearfog_gt_8k | https://gitlab.com/buildroot.org/buildroot/-/jobs/4603996676  |      
            solidrun_macchiatobin | https://gitlab.com/buildroot.org/buildroot/-/jobs/4603996678  | ORPH 
                  stm32mp157a_dk1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4603996782  |      
                  stm32mp157c_dk2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4603996787  |      
              stm32mp157c_odyssey | https://gitlab.com/buildroot.org/buildroot/-/jobs/4603996797  |      
                    versal_vck190 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4603996848  |      
                zynqmp_kria_kv260 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4603996905  |      
                    zynqmp_zcu102 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4603996910  |      
                    zynqmp_zcu106 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4603996913  |      



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
