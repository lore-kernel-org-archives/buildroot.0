Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DB66C6FD1D
	for <buildroot@archiver.kernel.org>; Wed, 15 Mar 2023 06:49:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F0AFB81449;
	Wed, 15 Mar 2023 06:49:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F0AFB81449
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bEpYbUfFwtxJ; Wed, 15 Mar 2023 06:49:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8DAF88144E;
	Wed, 15 Mar 2023 06:49:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8DAF88144E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 937681BF5E6
 for <buildroot@lists.busybox.net>; Wed, 15 Mar 2023 06:49:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5288441061
 for <buildroot@lists.busybox.net>; Wed, 15 Mar 2023 06:49:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5288441061
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id L-MGFrXhmaEm for <buildroot@lists.busybox.net>;
 Wed, 15 Mar 2023 06:49:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 68B08409EF
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 68B08409EF
 for <buildroot@buildroot.org>; Wed, 15 Mar 2023 06:49:31 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id B8D21E0004
 for <buildroot@buildroot.org>; Wed, 15 Mar 2023 06:49:29 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Wed, 15 Mar 2023 06:49:29 -0000
Message-Id: <20230315064935.5288441061@smtp4.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1678862969; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=VwWhyJVvuMMb7B8k5X8FcIBdKsNQv/SZWcc1nWu/gkw=;
 b=WIEvPWFB3pyQnKUcLfyp3nFCbJVFeoxFaAY/sS6QpRxe5zmLYN/SNnHL3rRyHdCQGNhoLt
 cLz2diExQvJPibpJt/liFstPOusYNEA0WBdUUc6Qc48BYGQtkh8GNVBANpLrizuebe2Jxd
 TNucj8kaN0J1/IP+co/blu7QHRb4e+1f+cITyHP5YbFadlTTpcRqwDd1CWDYMBygYRxCJn
 5Q0iSufdCsvWfMx7e74FMM9tWUofIo27mF2mrwkQFhIsJqPJZEnWZjgOX36IbKzcowre18
 FHYZ4ERGlRtKUFqk2V0xtp5ztdPadGmjrBBLDnDJLkd4dP/i7vlC3Ls/IkXHCQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=WIEvPWFB
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-03-14
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

Autobuild statistics for 2023-03-14
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.11.x  | 15  | 12  |  0  | 27  |
    master   | 199 | 189 |  2  | 390 |

Classification of failures by reason for master
-----------------------------------------------

             bluez5_utils-5.66 | 22
                       unknown | 21
package/lzop/lzop.mk:29: lz... | 14
            host-binutils-2.38 | 8 
               libglib2-2.72.3 | 8 
package/harfbuzz/harfbuzz.m... | 8 
                host-go-1.19.7 | 6 
package/lzop/lzop.mk:30: ho... | 6 
                elfutils-0.186 | 5 
  gobject-introspection-1.72.0 | 5 
              host-rust-1.67.1 | 5 
glibc-2.36-81-g4f4d7a13edfd... | 4 
              libgcrypt-1.10.1 | 4 
package/harfbuzz/harfbuzz.m... | 3 
                   perl-5.36.0 | 3 
                busybox-1.36.0 | 2 
                 dc3dd-7.2.641 | 2 
               fftw-quad-3.3.8 | 2 
             fontconfig-2.13.1 | 2 
fs/ubi/ubi.mk:51: /home/aut... | 2 
fs/ubifs/ubifs.mk:49: /home... | 2 
                  linux-6.1.14 | 2 
                    mutt-2.2.9 | 2 
                 qt6base-6.4.2 | 2 
            quickjs-2021-03-27 | 2 
                 uclibc-1.0.42 | 2 
                  acpid-2.0.34 | 1 
                apparmor-3.1.2 | 1 
                    attr-2.5.1 | 1 
             berkeleydb-5.3.28 | 1 
                   duma-2.5.15 | 1 
                  ffmpeg-4.4.3 | 1 
       freeradius-client-1.1.7 | 1 
                     frr-8.4.2 | 1 
fs/cramfs/cramfs.mk:46: /ho... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /tmp/... | 1 
                 glibmm-2.68.2 | 1 
                     gmp-6.2.1 | 1 
         gobject-introspection | 1 
             host-delve-1.20.0 | 1 
         host-gcc-final-10.4.0 | 1 
         host-gcc-final-11.3.0 | 1 
host-gdb-arc-2020.09-releas... | 1 
               host-runc-1.1.4 | 1 
                 host-wine-8.0 | 1 
                   json-c-0.16 | 1 
               libcap-ng-0.8.3 | 1 
               libdeflate-1.15 | 1 
     linux-5.10.162-cip24-rt10 | 1 
            linux-fusion-9.0.3 | 1 
        ltp-testsuite-20220930 | 1 
                          mawk | 1 
                     mtd-2.1.5 | 1 
                  ntp-4.2.8p15 | 1 
            ocf-linux-20171122 | 1 
                    olsr-0.9.8 | 1 
package/network-manager/net... | 1 
    python-cryptography-39.0.1 | 1 
                    qemu-7.2.0 | 1 
                ramspeed-2.6.0 | 1 
                    sdl-1.2.15 | 1 
              tinymembench-0.4 | 1 
ulog-0389d243352255f6182326... | 1 
               valgrind-3.19.0 | 1 
wireguard-linux-compat-1.0.... | 1 
                xenomai-3.0.10 | 1 
               xfsprogs-5.14.2 | 1 
                 zlib-ng-2.0.6 | 1 
               zxing-cpp-1.4.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mips64    |          acpid-2.0.34          | NOK | http://autobuild.buildroot.net/results/02265c0c38f6273b34bea6789b3e83f9b1daaecf | ORPH
    arc      |         apparmor-3.1.2         | NOK | http://autobuild.buildroot.net/results/77af1b396a8e23bdddf3b124c43033bce8f2e187 |     
   mips64    |           attr-2.5.1           | NOK | http://autobuild.buildroot.net/results/05b0c82c92df585a2c9a5487c476a897fc903590 |     
   sh4eb     |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/4dd94c55539c81a86f71f4c75be113aae2b91f55 | ORPH
microblazeel |       bluez5_utils-5.66        | NOK | http://autobuild.buildroot.net/results/b66f7a068d4f49f2d9e04e95a55e8fb8db8bd371 |     
  sparc64    |       bluez5_utils-5.66        | NOK | http://autobuild.buildroot.net/results/ef480bca499bb30bf11c8649ab7698dec165ff89 |     
 aarch64_be  |       bluez5_utils-5.66        | NOK | http://autobuild.buildroot.net/results/2cef1e16f063225adfe262b062b1c7324ba453da |     
   s390x     |       bluez5_utils-5.66        | NOK | http://autobuild.buildroot.net/results/9425dcace951f26deb3a2b55b8d3ef569459a3ba |     
    i586     |       bluez5_utils-5.66        | NOK | http://autobuild.buildroot.net/results/d48975a77ce9e3ef1a70f2d64c924feeed5a55f3 |     
   mips64    |       bluez5_utils-5.66        | NOK | http://autobuild.buildroot.net/results/b74a454a9871e7de58b57780cf1523dc19c04057 |     
 aarch64_be  |       bluez5_utils-5.66        | NOK | http://autobuild.buildroot.net/results/99b15c5dc6ab8bc4e408ef2ef6a47c9ac81f4fa4 |     
    mips     |       bluez5_utils-5.66        | NOK | http://autobuild.buildroot.net/results/ae70fd2c263ddd1b77ff040d8dc217ec8def8714 |     
  powerpc    |       bluez5_utils-5.66        | NOK | http://autobuild.buildroot.net/results/16d6cf6cd32e94d1ea28c55858a3caa40cf15296 |     
 aarch64_be  |       bluez5_utils-5.66        | NOK | http://autobuild.buildroot.net/results/e6d3900b8cfd83946093d8340bbb139a531bbcf6 |     
    i686     |       bluez5_utils-5.66        | NOK | http://autobuild.buildroot.net/results/5cba4a1ba19900fb82e23ff06b7041a5def394f7 |     
    mips     |       bluez5_utils-5.66        | NOK | http://autobuild.buildroot.net/results/0846d7fe1801168109702e60a03ec3c888486d22 |     
  aarch64    |       bluez5_utils-5.66        | NOK | http://autobuild.buildroot.net/results/13ed1ad23a27bf54b7aadcec42d05f58e75e4845 |     
   x86_64    |       bluez5_utils-5.66        | NOK | http://autobuild.buildroot.net/results/7fe88faa53aabcefc0d7031c4cb642d15a68805b |     
   nios2     |       bluez5_utils-5.66        | NOK | http://autobuild.buildroot.net/results/f09c1344d055b254391d01b7687ccfa68e448124 |     
  sparc64    |       bluez5_utils-5.66        | NOK | http://autobuild.buildroot.net/results/94a20589d06a9151bb8c206c853833a325e01c49 |     
microblazeel |       bluez5_utils-5.66        | NOK | http://autobuild.buildroot.net/results/5a79c15abad9ae85d14886e3e4f2df719405bcfb |     
  aarch64    |       bluez5_utils-5.66        | NOK | http://autobuild.buildroot.net/results/fac1c63488989265f91c8f5f44019e38b931a868 |     
    sh4      |       bluez5_utils-5.66        | NOK | http://autobuild.buildroot.net/results/fcfeee0cf4fb466eb8cf43c64e0e81ada3fad8e0 |     
    i686     |       bluez5_utils-5.66        | NOK | http://autobuild.buildroot.net/results/0df22d1c1dc8370d6781855b8a48d841a4a5a06d |     
  powerpc    |       bluez5_utils-5.66        | NOK | http://autobuild.buildroot.net/results/f75ea4819b485c9545bced9b8cdd3ecade9bd267 |     
   mipsel    |       bluez5_utils-5.66        | NOK | http://autobuild.buildroot.net/results/22a7948d4d2c15e33c7c150f91dd435269d0efd7 |     
    arm      |         busybox-1.36.0         | NOK | http://autobuild.buildroot.net/results/d8b7da93db2dbb5db64d0dedf23d5c274bef9eef | ORPH
    mips     |         busybox-1.36.0         | NOK | http://autobuild.buildroot.net/results/628cdec831a2cd508c889fc7c989e0aba4e85863 | ORPH
    or1k     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/d0e62f2106e949b325c1415d181a8f7c49139fae | ORPH
    or1k     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/4250acb02b7192096d5c7702904b2e2b848e5df8 | ORPH
powerpc64le  |          duma-2.5.15           | NOK | http://autobuild.buildroot.net/results/15cfd3b34d078ff7f72d652fee3caa4ba769dfae | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/4b7975701fbd609c134ff148155d31662a0fdc14 | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/c5a5620a6bdd622fcce8503e7081bb9ebfbf9a8c | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/9cc1fe3d997dec5cac3a6c52c03d4b45f17719ee | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/72f2fc03abec94a357792a0cd003cd8f488d66a4 | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/9ab8404f1d9877b3f6d564dbfa86da1c31af02e9 | ORPH
    arm      |          ffmpeg-4.4.3          | NOK | http://autobuild.buildroot.net/results/dbca6c7ff186982b70ae13e45dfb150a6b151a80 |     
powerpc64le  |        fftw-quad-3.3.8         | NOK | http://autobuild.buildroot.net/results/078302be766ff4b574b314080c7db3866165984d | ORPH
powerpc64le  |        fftw-quad-3.3.8         | NOK | http://autobuild.buildroot.net/results/df54ae8a5cb6a95e2bd0559299f5f88ff2306659 | ORPH
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/cd9332d22dc48d3679c473eadb04fc4f0486adcc | ORPH
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/ac4fae1eb6026561e8a36b27b1e5e3975ab4adfd | ORPH
  riscv64    |    freeradius-client-1.1.7     | NOK | http://autobuild.buildroot.net/results/4480fbb25b2343c717d2723fee7d33b28893e801 |     
   xtensa    |           frr-8.4.2            | NOK | http://autobuild.buildroot.net/results/f4ed17a1ca0aaa8adaf3a62fe27468868ea39c16 |     
    mips     | fs/cramfs/cramfs.mk:46: /ho... | NOK | http://autobuild.buildroot.net/results/d61eca679941af0f9fbae6546a3adbdcaa60aa50 |     
   xtensa    | fs/ubi/ubi.mk:51: /home/aut... | NOK | http://autobuild.buildroot.net/results/a2ad5fa365026d1281d99185c9dec73318567773 |     
   x86_64    | fs/ubi/ubi.mk:51: /home/aut... | NOK | http://autobuild.buildroot.net/results/2f3378c8e08e103647ddb05b22b93cd7e388080c |     
   xtensa    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/0d3448b25f65871ff1d0e0eba44a0d30dcfffa7a |     
 aarch64_be  | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/bde9a74261138d880063a5908218b916d735278d |     
 microblaze  | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/95e9a11790266d7179e0a3850111773867135994 |     
powerpc64le  | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/a7a1ea4351367de22a8f8cbce437bb44cf43540c |     
  sparc64    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/2237822ffb1ccd767e5ee7630cef6fe83ffd246e |     
   mips64    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/41becda5c7884c2bd1daaea1bdccc1268e050622 |     
   nios2     | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/d48e131678e1aa47407fd15579c1b708a825c131 |     
  powerpc    | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/f79b96d4a7619e7ec16f0fb5f209bff61789dc94 |     
  powerpc    | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/761d9314d3c4128d4c4c7bc26f0f9ea74bd9e0a6 |     
  powerpc    | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/1a66b76cca6134c14929d0bc2818f0f44381f963 |     
  powerpc    | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/c30424cf61b1f800d5050076ce7fd37370149014 |     
    or1k     |         glibmm-2.68.2          | NOK | http://autobuild.buildroot.net/results/b32023f2ff85095962c23ab71e84f0cfd3a76d0b |     
  riscv64    |           gmp-6.2.1            | NOK | http://autobuild.buildroot.net/results/aefe7ebceb0c26e5e26066963a1512c402d1be53 | ORPH
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/ef82c33f8694974d4567fdfe3d5541bef5f3e9d1 |     
   nios2     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/335620a3bcf6ef32e684a664e37b516149eae36a | ORPH
    i686     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/7c59b4e246502ce5da76dd6cf7ea3866b2baccf2 | ORPH
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/8657c8aa0cc7294af6022481d7c859b9789d7cb6 | ORPH
    or1k     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/9c6555b1803f86d161a0f4d330fbe87e9bdb7cf1 | ORPH
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/a7b0a7aad52e73a4d03fb425c93449dce4be5a86 | ORPH
    mips     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/0acecf2947ecb5d4dd5c114ce52e1bd2c81b0671 |     
  mips64el   |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/9e3f95939b239fe282cd1584c40eec2671b35981 |     
   mips64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/eedb5a894efaf925675b206b6411714c15f7aa3a |     
powerpc64le  |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/134110f3dd1d241ad84eea77a499dd13cb65f748 |     
   armeb     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/822367433681990f1e23db27f1371054b4b2a963 |     
   mipsel    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/b34523de4f211199bc1e8dce2cfb824f6a8566fc |     
    or1k     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/0ba1f1928325a6d5bd68aab7f86498415ee89a5b |     
    arm      |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/a652815c187add184a5400a6118be7b0585733aa |     
  aarch64    |       host-delve-1.20.0        | NOK | http://autobuild.buildroot.net/results/f2b19d0f7ad91b18615cd2bebe378a43cc6831c4 |     
microblazeel |     host-gcc-final-10.4.0      | NOK | http://autobuild.buildroot.net/results/d2ddb494cb230e20b12d588b432c8622decce6c1 |     
   arceb     |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/c9c4202f63d1cbcc484f184169ed8f3a1d7210a4 |     
    arc      | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/33bad1d9b79e2731ac378799525f3b54c43166fd | ORPH
  mips64el   |         host-go-1.19.7         | NOK | http://autobuild.buildroot.net/results/4e4bcbecffb2932fca2aca5590b775043851357e |     
  mips64el   |         host-go-1.19.7         | NOK | http://autobuild.buildroot.net/results/281c4177aae1294b92e6fe9b5042fb55c0a6e70e |     
    arc      |         host-go-1.19.7         | NOK | http://autobuild.buildroot.net/results/963c56a34cf557ec48e8b5dc2a7e902e91214c60 |     
   mips64    |         host-go-1.19.7         | NOK | http://autobuild.buildroot.net/results/8e12945176a59a61f9650e3d0163ccb2f9fd4fac |     
  mips64el   |         host-go-1.19.7         | NOK | http://autobuild.buildroot.net/results/64abd6515d287292d1dc67dc978c80441fa06055 |     
  mips64el   |         host-go-1.19.7         | NOK | http://autobuild.buildroot.net/results/555378b83aed8b18755939d1e53dd5e5e98d1d0f |     
  riscv64    |        host-runc-1.1.4         | NOK | http://autobuild.buildroot.net/results/2696b7131a1ca349884c5b1e69933618af7b1ef4 |     
   x86_64    |        host-rust-1.67.1        | NOK | http://autobuild.buildroot.net/results/0cfdb936d00ceca62ea6280ae98f50f503204dff |     
   x86_64    |        host-rust-1.67.1        | NOK | http://autobuild.buildroot.net/results/4191fb1ea6a09073106e16bef359d17cb4da2c86 |     
   mipsel    |        host-rust-1.67.1        | NOK | http://autobuild.buildroot.net/results/0ea61ee48e4e850075d29d0298953242b4d3dea4 |     
   x86_64    |        host-rust-1.67.1        | NOK | http://autobuild.buildroot.net/results/48933a624ec53f14bf1c788323e9a7baf71026d9 |     
   x86_64    |        host-rust-1.67.1        | NOK | http://autobuild.buildroot.net/results/f72b216b16f18ff471196b044227fd673d03851c |     
    i586     |         host-wine-8.0          | NOK | http://autobuild.buildroot.net/results/b2f624cd592d9f7732888250623cd256a9cbff7f |     
  riscv64    |          json-c-0.16           | NOK | http://autobuild.buildroot.net/results/cda68c8cd830308ab4835e17684cba6d14822e47 |     
  riscv64    |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/c6830b9246d5ea9f1619eb3c96c0b3eccecf95ed |     
   armeb     |        libdeflate-1.15         | NOK | http://autobuild.buildroot.net/results/091cff149405a73779e89abeba82ee26528f6d24 |     
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/299864451dfd9673cd75bcf27707d1f66b8f32a5 | ORPH
    i586     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/7975b088376613fe192e675e1cdd3e7473197259 | ORPH
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/b1e0b4f97db909745b2c5678bd3def4f0c6d2ade | ORPH
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/823b1543f50073c82d864a53e3f0062ae76774da | ORPH
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/d58168b823abc946d05709c29a44f8848f38e63a |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/e83a427c396089903e562c0b30c2154266d26ec2 |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/dc5dd0bd3e47e49cd1cbea3d124866fac7fb0783 |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/ecd79d3cc6a7c1b78245be04e3cd64155b9c53e2 |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/9e932d3c1ab8951f55a9e8ad26bd1a869e483fd1 |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/a4c4891c997d7dd282f73c9c14bdc0be3c636e25 |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/7b5163d404b1c3c91aaea72f86270348604ff340 |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/c46090e98f9dcc4f8e83f2bff9b7390c760819db |     
powerpc64le  |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/84aef3bf33a8b1f41a92733a03f66d3c36cc11ef | ORPH
powerpc64le  |          linux-6.1.14          | NOK | http://autobuild.buildroot.net/results/ff967aa9201a04becc4c98ab0cb4c0168daeaaf9 | ORPH
   nios2     |          linux-6.1.14          | NOK | http://autobuild.buildroot.net/results/1ec082526cb9232ef451b60fc33f5a2a7f6aefc3 | ORPH
  sparc64    |       linux-fusion-9.0.3       | NOK | http://autobuild.buildroot.net/results/c15b3f2799488f1ada36f27bf63bca82bd616fc7 | ORPH
 aarch64_be  |     ltp-testsuite-20220930     | NOK | http://autobuild.buildroot.net/results/037f1c29cd120f48664bdbafdbd48496331bf7b2 |     
    m68k     |              mawk              | TIM | http://autobuild.buildroot.net/results/b19fafcb2945d0a46cb35ca38de9e894e3dd78a8 |     
    or1k     |           mtd-2.1.5            | NOK | http://autobuild.buildroot.net/results/537d76830ce45600c77152b5446a822710726c3d | ORPH
   sparc     |           mutt-2.2.9           | NOK | http://autobuild.buildroot.net/results/0dae0326ec60e7f68322b193393429f5760985d1 |     
    sh4      |           mutt-2.2.9           | NOK | http://autobuild.buildroot.net/results/4a179ecd5fea1cbddca178fd6b50c6827ba59263 |     
  riscv64    |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/a9f6f20c9b49dcd3dc8100d94e59e917c73c1934 | ORPH
    or1k     |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/b0e02b7a1548306984306131390ecc22434f0af1 | ORPH
  aarch64    |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/fa3544d59d909405ac5e62388e3c3f108b7b2623 | ORPH
   mipsel    | package/harfbuzz/harfbuzz.m... | NOK | http://autobuild.buildroot.net/results/c6b0ac59336fed1838ac8fc782d0be31765f253e |     
powerpc64le  | package/harfbuzz/harfbuzz.m... | NOK | http://autobuild.buildroot.net/results/f3fb18eca708e16e9dba2b441b60a96c0670217b |     
   s390x     | package/harfbuzz/harfbuzz.m... | NOK | http://autobuild.buildroot.net/results/bf165aff64509fea009190a1f7a4bcaa6ebba40e |     
 aarch64_be  | package/harfbuzz/harfbuzz.m... | NOK | http://autobuild.buildroot.net/results/db6edead6f48fea018af15ddeaa6b13c41bc5eb8 |     
  sparc64    | package/harfbuzz/harfbuzz.m... | NOK | http://autobuild.buildroot.net/results/e41e22be7aa00c69954bc1447452a9d52f749075 |     
   x86_64    | package/harfbuzz/harfbuzz.m... | NOK | http://autobuild.buildroot.net/results/1351edb3fdd6503f2040b7c85241e3c248f0c611 |     
  aarch64    | package/harfbuzz/harfbuzz.m... | NOK | http://autobuild.buildroot.net/results/a494f283c1be5e60f6ce0a75ee440e0d2bae2c52 |     
    or1k     | package/harfbuzz/harfbuzz.m... | NOK | http://autobuild.buildroot.net/results/2a431e732a4801d404414639004c6ab440326a97 |     
    sh4a     | package/harfbuzz/harfbuzz.m... | NOK | http://autobuild.buildroot.net/results/30665ae396601447906bb3675b2f69bada264a30 |     
   xtensa    | package/harfbuzz/harfbuzz.m... | NOK | http://autobuild.buildroot.net/results/0c1e67ac8949fae0fced73855b9e319bcdb6e1ff |     
powerpc64le  | package/harfbuzz/harfbuzz.m... | NOK | http://autobuild.buildroot.net/results/390ee6072078f4f62b93339c1133b768d587dd72 |     
 powerpc64   | package/lzop/lzop.mk:29: lz... | NOK | http://autobuild.buildroot.net/results/5b46cc957faf5f6382ceeddcab284b2b310d4e78 |     
    mips     | package/lzop/lzop.mk:29: lz... | NOK | http://autobuild.buildroot.net/results/7d90d4886e1dc37f8f1e4172bf3616f819a3afb8 |     
    or1k     | package/lzop/lzop.mk:29: lz... | NOK | http://autobuild.buildroot.net/results/af637ecedb6625f03a00e0463583e0b8d76115e0 |     
   nios2     | package/lzop/lzop.mk:29: lz... | NOK | http://autobuild.buildroot.net/results/5b1cd98df436710b02620d2f816447ffc7d3fa36 |     
    sh4      | package/lzop/lzop.mk:29: lz... | NOK | http://autobuild.buildroot.net/results/8dfbdaad7642edcd19483e5014a833122450e36d |     
  aarch64    | package/lzop/lzop.mk:29: lz... | NOK | http://autobuild.buildroot.net/results/c0bcb6d2b3f17d7c9dc397b1d8cb2434377caf09 |     
  sparc64    | package/lzop/lzop.mk:29: lz... | NOK | http://autobuild.buildroot.net/results/bcb3f10f9d495273f9e9ba2a7440151bd0aa7b94 |     
    i686     | package/lzop/lzop.mk:29: lz... | NOK | http://autobuild.buildroot.net/results/f30db07cce44a04e22d9a8702d67878ca048b1fb |     
    m68k     | package/lzop/lzop.mk:29: lz... | NOK | http://autobuild.buildroot.net/results/c9b6a04515fe2fbf33d83e36ef34f3a18ddd8085 |     
   arceb     | package/lzop/lzop.mk:29: lz... | NOK | http://autobuild.buildroot.net/results/44732f92c3dab3a1d09607c4dbe814a912d7b4ed |     
   x86_64    | package/lzop/lzop.mk:29: lz... | NOK | http://autobuild.buildroot.net/results/7a780058fc79930a3106dc266394ad4320321b03 |     
powerpc64le  | package/lzop/lzop.mk:29: lz... | NOK | http://autobuild.buildroot.net/results/b2d7081f2cc53a8857da867c63f7b8645c490f94 |     
    or1k     | package/lzop/lzop.mk:29: lz... | NOK | http://autobuild.buildroot.net/results/b366d3b380b15e7909e616c65c6def1af54bbad7 |     
 powerpc64   | package/lzop/lzop.mk:29: lz... | NOK | http://autobuild.buildroot.net/results/80a09c0b042b3ec635a965ec47c17913c7da2191 |     
 powerpc64   | package/lzop/lzop.mk:30: ho... | NOK | http://autobuild.buildroot.net/results/42db52f494c89dfc44dc6d814b1f833ce5d1bb29 |     
  powerpc    | package/lzop/lzop.mk:30: ho... | NOK | http://autobuild.buildroot.net/results/e6c645c68c77a4527f6dfeda8123bd0fb5e376f1 |     
  riscv32    | package/lzop/lzop.mk:30: ho... | NOK | http://autobuild.buildroot.net/results/c7d2ee3a600d4d993c4e576b14ae233a94e53221 |     
   s390x     | package/lzop/lzop.mk:30: ho... | NOK | http://autobuild.buildroot.net/results/612fe0aceb1ea143e8456c80419b7915dd7291ae |     
   sparc     | package/lzop/lzop.mk:30: ho... | NOK | http://autobuild.buildroot.net/results/54576281cc61b22872c61e65435a731681b31a95 |     
    mips     | package/lzop/lzop.mk:30: ho... | NOK | http://autobuild.buildroot.net/results/e85d308d4dce20582cc34fced13cba2116172f20 |     
    or1k     | package/network-manager/net... | NOK | http://autobuild.buildroot.net/results/a8444684525db8e1c0c8668f75bf5760a6272381 |     
    arc      |          perl-5.36.0           | NOK | http://autobuild.buildroot.net/results/f2f40af52eff04d0599b1cd5c95124945adb9118 |     
    arc      |          perl-5.36.0           | NOK | http://autobuild.buildroot.net/results/761ebf8698f653a9fc2f80c1c41e3f93ed59a25f |     
   mipsel    |          perl-5.36.0           | NOK | http://autobuild.buildroot.net/results/d67b3aaadfcf20eea3f4787e7615cecbc325554d |     
   armeb     |   python-cryptography-39.0.1   | NOK | http://autobuild.buildroot.net/results/e0e814092e86183ebf15ba32e933ce411b03a3e5 |     
    i686     |           qemu-7.2.0           | NOK | http://autobuild.buildroot.net/results/21529f45dd6da45e5162a3b2a58da09cd6742c29 |     
    i686     |         qt6base-6.4.2          | NOK | http://autobuild.buildroot.net/results/4d0eb38675d7679fa3ba956c5fb528adfa452f76 |     
 aarch64_be  |         qt6base-6.4.2          | NOK | http://autobuild.buildroot.net/results/c54d43b663de70fe152794bca5d4ab2eb101177c |     
microblazeel |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/403c857a33362b3a7131262550b4b65e03bb8569 |     
   sh4eb     |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/1fe14c76abced9cc0c1f0702753d5f8771652f80 |     
    sh4      |         ramspeed-2.6.0         | NOK | http://autobuild.buildroot.net/results/e5d00f0cbd2273dce640427bedf3bb83f88314ac | ORPH
   sh4eb     |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/b7ef1de10d9f89fdc87a21b21782e31f4f8398e0 | ORPH
   armeb     |        tinymembench-0.4        | NOK | http://autobuild.buildroot.net/results/605a4a39a4ab931f15f18c3c43a226e662785afb |     
  powerpc    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/b54039b9bce20213d280135897d825e1aae2ee0a |     
  powerpc    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/cc5577dec7ef69c6531aac9cbb851333202fd8ca |     
  sparc64    | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/683b345583f61b650688ce350141f7c2490e3c31 |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/8f0030136fe54a2f3e7ba576f64e379ddfced76a |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/a7d95d7397d116a8f2f19a6afac6770616586750 |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/7f93376f06e30e4d0af53b2da147b552171c0064 |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.net/results/a25714c8da93e16ca77f1d9e04b724a3d3aa0c85 |     
 powerpc64   |            unknown             | NOK | http://autobuild.buildroot.net/results/b936bb6401c36dc7c948e880a1b0a7d58d02b010 |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/4611d140ba4f8488930bed1e196b6cc959ec7a6d |     
   mips64    |            unknown             | NOK | http://autobuild.buildroot.net/results/527b8d34fe30be456caf1abc74961aaeab6aaa53 |     
  sparc64    |            unknown             | NOK | http://autobuild.buildroot.net/results/6a8e201cbfe04a75cedd510ad8bbf5478399d4c5 |     
    m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/366f40c9078b2a07aae09e35b43fc30bd7b2162f |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/f0b1024d8b0b21c2492b9276de2f1f9c6a7c5884 |     
  sparc64    |            unknown             | NOK | http://autobuild.buildroot.net/results/08d7756a2fc902dc925513886634ac55300e0c1f |     
 microblaze  |            unknown             | NOK | http://autobuild.buildroot.net/results/620c7d1d00cae0cb38a0dac7408154502cf080f4 |     
   sparc     |            unknown             | NOK | http://autobuild.buildroot.net/results/d6cde2d91bc592ecb9905de85d2ff4e51b976879 |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/7f031e927560d71fa0940b3f681f872013d73eed |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/2fd07abefe3e77deb70d89adb11bb51375260a88 |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/4c1f1b2786a00dae386f770945b397e720276d5a |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/4a6ee716aed4f099c74c5e88d1914b4d7431a9f5 |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/477bb4c5caad4b9f31c82f0fdf507c8ef0637996 |     
 aarch64_be  |            unknown             | NOK | http://autobuild.buildroot.net/results/977eb0a2b3120d75868dec6f9b22b9434b412e31 |     
   arceb     |            unknown             | NOK | http://autobuild.buildroot.net/results/9bc1f82889095f6b6592f745689d42621c14572c |     
   mips64    |            unknown             | NOK | http://autobuild.buildroot.net/results/d4b363f4d74bd1332f6199d1c714c5daaef3ad8b |     
   mips64    |        valgrind-3.19.0         | NOK | http://autobuild.buildroot.net/results/ca895acb0858e585cc7681c9f8b24a70e46194bc | ORPH
powerpc64le  | wireguard-linux-compat-1.0.... | NOK | http://autobuild.buildroot.net/results/7537ab1fd0a7943921e39f072bcfbf9238d58bc6 |     
    m68k     |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/1d3f66aed95218a916c05d967ca74a21f67f391b |     
  riscv32    |        xfsprogs-5.14.2         | NOK | http://autobuild.buildroot.net/results/0ad2326c1ce02ef1cb46e5b8e72b1ff26d7d323f | ORPH
  aarch64    |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/0f1132332ed8a926ba055acd09a443229ebe1681 | ORPH
   sparc     |        zxing-cpp-1.4.0         | NOK | http://autobuild.buildroot.net/results/fbf1060a27a3a3313aafda4062d27ca370ac8060 |     


Classification of failures by reason for 2022.11.x
--------------------------------------------------

                  linux-6.0.19 | 2 
                    php-8.1.16 | 2 
                 binutils-2.38 | 1 
                     file-5.43 | 1 
fs/cramfs/cramfs.mk:46: /ho... | 1 
              host-pahole-1.24 | 1 
              host-rust-1.64.0 | 1 
               libbytesize-2.7 | 1 
                       unknown | 1 
                    zstd-1.5.2 | 1 


Detail of failures for 2022.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |         binutils-2.38          | NOK | http://autobuild.buildroot.net/results/fcb09cb7dc835304285db44b19e204afcf1271d0 |     
    i686     |           file-5.43            | NOK | http://autobuild.buildroot.net/results/ce3d1023a5d80f55a6ff2c8b0a9c7c531e87ad92 | ORPH
  aarch64    | fs/cramfs/cramfs.mk:46: /ho... | NOK | http://autobuild.buildroot.net/results/c8121e01f4d8684ce568916b996b68e868da560a |     
 microblaze  |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/e5e695f4dbc76220efd6fe060c9ece0480e64c74 |     
   x86_64    |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/d4cd7b461d9dc662cbabd81109adaf3f3ff3d823 |     
   arceb     |        libbytesize-2.7         | NOK | http://autobuild.buildroot.net/results/b84a53bddec75b077f8e8e76529d268bff4887b3 | ORPH
  sparc64    |          linux-6.0.19          | NOK | http://autobuild.buildroot.net/results/36a0618681d3276a86e5add4f5c10250cdd0170a | ORPH
   s390x     |          linux-6.0.19          | NOK | http://autobuild.buildroot.net/results/81908b0bf022905faac6302d135f02df041e627a | ORPH
microblazeel |           php-8.1.16           | NOK | http://autobuild.buildroot.net/results/12220f9cae161954ce0d543ec936deaf00905816 |     
    or1k     |           php-8.1.16           | NOK | http://autobuild.buildroot.net/results/d8a57c94ccd23f2c24cf21c49244e4f96b0b4051 |     
   sh4eb     |            unknown             | NOK | http://autobuild.buildroot.net/results/70a9b744f7c5ca990c4ed2390f3479f6056fc799 |     
 microblaze  |           zstd-1.5.2           | NOK | http://autobuild.buildroot.net/results/eab3efa4c4465f99900072c33d4911515c168d5f |     


Gitlab CI results for 2023-03-14
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
 TestAarch64Pages64kGlibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866891  | ORPH 
  TestAarch64Pages64kMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866895  | ORPH 
TestAarch64Pages64kuClibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866899  | ORPH 
         TestCheckPackage | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867460  |      
      TestClangCompilerRT | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919865996  | ORPH 
...pioDracutMuslMergedUsr | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919865862  | ORPH 
     TestCpioDracutUclibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919865868  | ORPH 
           TestCrudiniPy3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919865997  | ORPH 
                 TestExt2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919865881  | ORPH 
...rch64GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866940  | ORPH 
...tlinAarch64GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866943  | ORPH 
...arch64MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866948  | ORPH 
...otlinAarch64MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866951  | ORPH 
...ch64UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866954  | ORPH 
...linAarch64UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866956  | ORPH 
...h64beGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866958  | ORPH 
...inAarch64beGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866959  | ORPH 
...64beUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866964  | ORPH 
...nAarch64beUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866971  | ORPH 
...750dUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866976  | ORPH 
...nArcle750dUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866977  | ORPH 
...ehs38GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866982  | ORPH 
...inArclehs38GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866988  | ORPH 
...hs38UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866992  | ORPH 
...nArclehs38UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866996  | ORPH 
...abihfGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867002  | ORPH 
...mebv7eabihfGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867009  | ORPH 
...eabihfMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867010  | ORPH 
...rmebv7eabihfMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867013  | ORPH 
...bihfUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867018  | ORPH 
...ebv7eabihfUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867021  | ORPH 
...5eabiGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867028  | ORPH 
...inArmv5eabiGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867033  | ORPH 
...v5eabiMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867040  | ORPH 
...linArmv5eabiMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867043  | ORPH 
...eabiUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867049  | ORPH 
...nArmv5eabiUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867058  | ORPH 
...abihfGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867062  | ORPH 
...Armv6eabihfGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867067  | ORPH 
...eabihfMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867069  | ORPH 
...nArmv6eabihfMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867072  | ORPH 
...bihfUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867074  | ORPH 
...rmv6eabihfUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867076  | ORPH 
...abihfGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867079  | ORPH 
...Armv7eabihfGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867082  | ORPH 
...eabihfMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867084  | ORPH 
...nArmv7eabihfMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867085  | ORPH 
...bihfUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867087  | ORPH 
...rmv7eabihfUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867088  | ORPH 
...mv7mUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867090  | ORPH 
...tlinArmv7mUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867093  | ORPH 
...8xxxUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867094  | ORPH 
...nM68k68xxxUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867096  | ORPH 
...fireUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867097  | ORPH 
...8kcoldfireUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867099  | ORPH 
...azebeGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867101  | ORPH 
...icroblazebeGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867102  | ORPH 
...lazebeMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867103  | ORPH 
...MicroblazebeMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867104  | ORPH 
...zebeUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867105  | ORPH 
...croblazebeUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867106  | ORPH 
...azeelGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867107  | ORPH 
...icroblazeelGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867108  | ORPH 
...lazeelMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867109  | ORPH 
...MicroblazeelMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867111  | ORPH 
...zeelUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867112  | ORPH 
...croblazeelUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867114  | ORPH 
...ips32GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867115  | ORPH 
...otlinMips32GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867116  | ORPH 
...Mips32MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867117  | ORPH 
...ootlinMips32MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867118  | ORPH 
...ps32UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867119  | ORPH 
...tlinMips32UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867120  | ORPH 
...s32elGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867122  | ORPH 
...linMips32elGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867124  | ORPH 
...ps32elMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867128  | ORPH 
...tlinMips32elMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867137  | ORPH 
...32elUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867139  | ORPH 
...inMips32elUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867141  | ORPH 
...2r5elGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867144  | ORPH 
...nMips32r5elGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867146  | ORPH 
...32r5elMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867148  | ORPH 
...inMips32r5elMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867150  | ORPH 
...r5elUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867152  | ORPH 
...Mips32r5elUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867153  | ORPH 
...2r6elGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867155  | ORPH 
...nMips32r6elGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867158  | ORPH 
...32r6elMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867161  | ORPH 
...inMips32r6elMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867167  | ORPH 
...r6elUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867170  | ORPH 
...Mips32r6elUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867174  | ORPH 
...eln32GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867176  | ORPH 
...Mips64eln32GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867179  | ORPH 
...4eln32MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867184  | ORPH 
...nMips64eln32MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867186  | ORPH 
...ln32UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867191  | ORPH 
...ips64eln32UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867193  | ORPH 
...64n32GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867194  | ORPH 
...inMips64n32GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867195  | ORPH 
...s64n32MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867197  | ORPH 
...linMips64n32MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867198  | ORPH 
...4n32UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867200  | ORPH 
...nMips64n32UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867201  | ORPH 
...eln32GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867202  | ORPH 
...ps64r6eln32GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867203  | ORPH 
...6eln32MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867206  | ORPH 
...ips64r6eln32MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867207  | ORPH 
...ln32UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867209  | ORPH 
...s64r6eln32UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867211  | ORPH 
...Nios2GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867213  | ORPH 
...ootlinNios2GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867217  | ORPH 
...nriscGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867220  | ORPH 
...linOpenriscGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867221  | ORPH 
...enriscMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867224  | ORPH 
...tlinOpenriscMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867226  | ORPH 
...riscUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867228  | ORPH 
...inOpenriscUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867230  | ORPH 
...440fpGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867232  | ORPH 
...owerpc440fpGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867234  | ORPH 
...c440fpMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867237  | ORPH 
...Powerpc440fpMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867239  | ORPH 
...40fpUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867242  | ORPH 
...werpc440fpUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867245  | ORPH 
...e5500GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867248  | ORPH 
...erpc64e5500GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867250  | ORPH 
...e6500GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867252  | ORPH 
...erpc64e6500GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867253  | ORPH 
...4e6500MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867256  | ORPH 
...werpc64e6500MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867257  | ORPH 
...ower8GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867260  | ORPH 
...c64lepower8GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867261  | ORPH 
...power8MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867263  | ORPH 
...pc64lepower8MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867265  | ORPH 
...ower8GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867267  | ORPH 
...rpc64power8GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867270  | ORPH 
...power8MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867273  | ORPH 
...erpc64power8MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867276  | ORPH 
...300c3GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867280  | ORPH 
...werpce300c3GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867283  | ORPH 
...e300c3MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867286  | ORPH 
...owerpce300c3MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867288  | ORPH 
...00c3UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867292  | ORPH 
...erpce300c3UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867295  | ORPH 
...500mcGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867297  | ORPH 
...werpce500mcGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867298  | ORPH 
...e500mcMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867301  | ORPH 
...owerpce500mcMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867305  | ORPH 
...00mcUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867306  | ORPH 
...erpce500mcUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867309  | ORPH 
...lp32dGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867313  | ORPH 
...lp64dGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867314  | ORPH 
...iscv64lp64dGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867317  | ORPH 
...4lp64dMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867319  | ORPH 
...Riscv64lp64dMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867321  | ORPH 
...p64dUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867322  | ORPH 
...scv64lp64dUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867326  | ORPH 
...0xz13GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867327  | ORPH 
...linS390xz13GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867329  | ORPH 
...Shsh4GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867331  | ORPH 
...ootlinShsh4GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867334  | ORPH 
...nShsh4MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867336  | ORPH 
...BootlinShsh4MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867339  | ORPH 
...hsh4UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867341  | ORPH 
...otlinShsh4UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867344  | ORPH 
...h4aebGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867347  | ORPH 
...linShsh4aebGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867350  | ORPH 
...sh4aebMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867353  | ORPH 
...tlinShsh4aebMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867356  | ORPH 
...arc64GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867359  | ORPH 
...tlinSparc64GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867361  | ORPH 
...rcv8UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867364  | ORPH 
...linSparcv8UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867368  | ORPH 
...X8664GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867371  | ORPH 
...ootlinX8664GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867375  | ORPH 
...nX8664MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867378  | ORPH 
...BootlinX8664MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867381  | ORPH 
...8664UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867383  | ORPH 
...otlinX8664UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867386  | ORPH 
...orei7GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867390  | ORPH 
...X8664corei7GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867396  | ORPH 
...corei7MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867398  | ORPH 
...nX8664corei7MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867400  | ORPH 
...rei7UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867401  | ORPH 
...8664corei7UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867403  | ORPH 
...664v2GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867406  | ORPH 
...tlinX8664v2GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867408  | ORPH 
...8664v2MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867410  | ORPH 
...otlinX8664v2MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867411  | ORPH 
...64v2UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867413  | ORPH 
...linX8664v2UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867415  | ORPH 
...664v3GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867417  | ORPH 
...tlinX8664v3GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867418  | ORPH 
...8664v3MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867420  | ORPH 
...otlinX8664v3MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867421  | ORPH 
...64v3UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867423  | ORPH 
...linX8664v3UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867426  | ORPH 
...664v4GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867427  | ORPH 
...tlinX8664v4GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867428  | ORPH 
...8664v4MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867430  | ORPH 
...otlinX8664v4MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867431  | ORPH 
...64v4UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867432  | ORPH 
...linX8664v4UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867434  | ORPH 
...core2GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867436  | ORPH 
...linX86core2GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867437  | ORPH 
...6core2MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867438  | ORPH 
...tlinX86core2MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867440  | ORPH 
...ore2UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867442  | ORPH 
...inX86core2UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867445  | ORPH 
...6i686GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867448  | ORPH 
...tlinX86i686GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867450  | ORPH 
...86i686MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867452  | ORPH 
...otlinX86i686MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867454  | ORPH 
...i686UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867456  | ORPH 
...linX86i686UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867457  | ORPH 
...lx60UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867458  | ORPH 
...Xtensalx60UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867459  | ORPH 
...ToolchainBuildrootMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866903  | ORPH 
...olchainBuildrootuClibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866908  | ORPH 
...xternalToolchainCCache | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866913  | ORPH 
...ernalToolchainCtngMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866917  | ORPH 
...rnalToolchainLinaroArm | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866924  | ORPH 
...ToolchainSourceryArmv4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866929  | ORPH 
...ToolchainSourceryArmv5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866934  | ORPH 
...ToolchainSourceryArmv7 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866938  | ORPH 
     TestFileCapabilities | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919865698  | ORPH 
        TestGetDevelopers | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919867461  | ORPH 
     TestGlibcAllTimezone | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919865804  | ORPH 
...DefaultLimitedTimezone | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919865813  | ORPH 
               TestGnupg2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866049  | ORPH 
          TestGrubi386EFI | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919865669  | ORPH 
           TestGst1Python | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866053  | ORPH 
                TestHWLoc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866060  | ORPH 
              TestHighway | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866056  | ORPH 
        TestHostBmapTools | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919865993  | ORPH 
           TestIPythonPy3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866073  | ORPH 
       TestInitSystemNone | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919865950  | ORPH 
...ystemSystemdRoIfupdown | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919865960  | ORPH 
...ystemSystemdRoNetworkd | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919865970  | ORPH 
               TestIperf3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866067  | ORPH 
      TestIso9660Grub2EFI | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919865898  | ORPH 
 TestIso9660Grub2External | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919865902  | ORPH 
...0Grub2ExternalCompress | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919865904  | ORPH 
   TestIso9660Grub2Hybrid | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919865907  | ORPH 
 TestIso9660Grub2Internal | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919865909  | ORPH 
...so9660SyslinuxExternal | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919865911  | ORPH 
...slinuxExternalCompress | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919865916  | ORPH 
...so9660SyslinuxInternal | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919865924  | ORPH 
                TestKexec | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866078  | ORPH 
               TestLibJXL | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866087  | ORPH 
            TestLibshdata | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866090  | ORPH 
                 TestLsof | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866105  | ORPH 
                  TestLua | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866133  | ORPH 
              TestLuaHttp | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866170  | ORPH 
           TestLuaInotify | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866194  | ORPH 
              TestLuaLPeg | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866095  | ORPH 
          TestLuaLsqlite3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866113  | ORPH 
         TestLuaLuaArgon2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866138  | ORPH 
         TestLuaLuaAugeas | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866143  | ORPH 
           TestLuaLuaCffi | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866147  | ORPH 
        TestLuaLuaCqueues | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866150  | ORPH 
          TestLuaLuaExpat | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866235  | ORPH 
     TestLuaLuaFileSystem | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866241  | ORPH 
             TestLuaLuaGD | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866164  | ORPH 
           TestLuaLuaLdap | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866248  | ORPH 
          TestLuaLuaLyaml | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866208  | ORPH 
          TestLuaLuaPosix | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866269  | ORPH 
           TestLuaLuaSDL2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866219  | ORPH 
            TestLuaLuaSec | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866278  | ORPH 
         TestLuaLuaSocket | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866285  | ORPH 
           TestLuaLuacURL | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866157  | ORPH 
           TestLuaLuaossl | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866258  | ORPH 
         TestLuaLuasyslog | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866293  | ORPH 
           TestLuaLuazlib | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866230  | ORPH 
             TestLuaLunix | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866198  | ORPH 
             TestLuaLzlib | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866308  | ORPH 
             TestLuaRings | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866794  | ORPH 
              TestLuaUtf8 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866225  | ORPH 
               TestLuajit | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866135  | ORPH 
           TestLuajitHttp | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866187  | ORPH 
        TestLuajitInotify | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866196  | ORPH 
           TestLuajitLPeg | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866099  | ORPH 
       TestLuajitLsqlite3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866118  | ORPH 
      TestLuajitLuaArgon2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866140  | ORPH 
      TestLuajitLuaAugeas | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866144  | ORPH 
     TestLuajitLuaCqueues | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866154  | ORPH 
       TestLuajitLuaExpat | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866239  | ORPH 
  TestLuajitLuaFileSystem | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866245  | ORPH 
          TestLuajitLuaGD | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866167  | ORPH 
        TestLuajitLuaLdap | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866251  | ORPH 
       TestLuajitLuaLyaml | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866212  | ORPH 
       TestLuajitLuaPosix | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866275  | ORPH 
        TestLuajitLuaSDL2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866220  | ORPH 
         TestLuajitLuaSec | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866281  | ORPH 
      TestLuajitLuaSocket | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866288  | ORPH 
        TestLuajitLuacURL | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866163  | ORPH 
        TestLuajitLuaossl | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866264  | ORPH 
      TestLuajitLuasyslog | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866297  | ORPH 
        TestLuajitLuazlib | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866232  | ORPH 
          TestLuajitLunix | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866201  | ORPH 
          TestLuajitRings | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866797  | ORPH 
       TestLuajitTurbolua | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866850  | ORPH 
           TestLuajitUtf8 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866227  | ORPH 
                 TestLuvi | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866299  | ORPH 
                  TestLxc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866304  | ORPH 
               TestMender | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866312  | ORPH 
             TestMsrTools | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866316  | ORPH 
               TestMtools | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866318  | ORPH 
                 TestNcdu | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866322  | ORPH 
              TestNetdata | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866337  | ORPH 
          TestNodeJSBasic | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866342  | ORPH 
         TestNodeJSModule | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866346  | ORPH 
               TestOctave | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866352  | ORPH 
                  TestOla | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866372  | ORPH 
              TestOpenJdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866418  | ORPH 
         TestOpenSshGlibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866424  | ORPH 
        TestOpenSshuClibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866426  | ORPH 
                 TestOpkg | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866429  | ORPH 
             TestPerftest | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866431  | ORPH 
                 TestPerl | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866434  | ORPH 
        TestPerlClassLoad | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866436  | ORPH 
         TestPerlDBDmysql | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866439  | ORPH 
     TestPerlEncodeDetect | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866444  | ORPH 
          TestPerlGDGraph | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866449  | ORPH 
       TestPerlHTMLParser | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866452  | ORPH 
TestPerlIOSocketMulticast | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866456  | ORPH 
      TestPerlIOSocketSSL | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866461  | ORPH 
 TestPerlLWPProtocolhttps | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866470  | ORPH 
         TestPerlMailDKIM | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866475  | ORPH 
              TestPerlX10 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866483  | ORPH 
        TestPerlXMLLibXML | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866490  | ORPH 
       TestPerllibwwwperl | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866463  | ORPH 
              TestPhpApcu | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866493  | ORPH 
            TestPhpLuaLua | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866500  | ORPH 
         TestPhpLuaLuajit | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866504  | ORPH 
               TestPhpPam | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866507  | ORPH 
          TestPhpPeclDbus | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866513  | ORPH 
                 TestPixz | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866535  | ORPH 
          TestPolkitInitd | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866589  | ORPH 
        TestPolkitSystemd | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866597  | ORPH 
         TestProsodyLua51 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866600  | ORPH 
        TestProsodyLuajit | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866604  | ORPH 
              TestPyNdiff | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866745  | ORPH 
            TestPython3Py | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866607  | ORPH 
         TestPython3PyPyc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866611  | ORPH 
           TestPython3Pyc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866613  | ORPH 
         TestPythonAugeas | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866622  | ORPH 
           TestPythonAvro | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866631  | ORPH 
       TestPythonPahoMQTT | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866716  | ORPH 
     TestPythonPy3Aexpect | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866615  | ORPH 
        TestPythonPy3Argh | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866617  | ORPH 
       TestPythonPy3Attrs | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866619  | ORPH 
    TestPythonPy3Autobahn | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866625  | ORPH 
     TestPythonPy3Automat | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866627  | ORPH 
   TestPythonPy3Bitstring | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866633  | ORPH 
       TestPythonPy3Boto3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866635  | ORPH 
    TestPythonPy3Botocore | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866637  | ORPH 
         TestPythonPy3Can | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866642  | ORPH 
        TestPythonPy3Cbor | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866648  | ORPH 
       TestPythonPy3Click | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866654  | ORPH 
   TestPythonPy3Colorzero | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866657  | ORPH 
  TestPythonPy3Constantly | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866664  | ORPH 
   TestPythonPy3Construct | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866666  | ORPH 
    TestPythonPy3Crossbar | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866668  | ORPH 
TestPythonPy3Cryptography | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866669  | ORPH 
    TestPythonPy3DBusFast | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866671  | ORPH 
    TestPythonPy3DBusNext | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866672  | ORPH 
  TestPythonPy3Dicttoxml2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866673  | ORPH 
      TestPythonPy3Distro | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866674  | ORPH 
      TestPythonPy3Django | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866675  | ORPH 
    TestPythonPy3Dtschema | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866678  | ORPH 
       TestPythonPy3Flask | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866680  | ORPH 
...honPy3FlaskExpectsJson | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866682  | ORPH 
         TestPythonPy3Git | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866683  | ORPH 
      TestPythonPy3Gitdb2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866686  | ORPH 
       TestPythonPy3GnuPG | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866687  | ORPH 
     TestPythonPy3Gobject | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866688  | ORPH 
    TestPythonPy3Gpiozero | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866693  | ORPH 
        TestPythonPy3Hkdf | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866698  | ORPH 
 TestPythonPy3Incremental | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866699  | ORPH 
    TestPythonPy3Iptables | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866700  | ORPH 
    TestPythonPy3Jmespath | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866703  | ORPH 
    TestPythonPy3Libftdi1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866081  | ORPH 
...PythonPy3MagicWormhole | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866705  | ORPH 
       TestPythonPy3Munch | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866710  | ORPH 
     TestPythonPy3Passlib | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866719  | ORPH 
     TestPythonPy3Pexpect | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866724  | ORPH 
      TestPythonPy3PyAlsa | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866729  | ORPH 
      TestPythonPy3Pynacl | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866739  | ORPH 
      TestPythonPy3Pytest | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866746  | ORPH 
...PythonPy3PytestAsyncio | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866749  | ORPH 
      TestPythonPy3Pyyaml | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866751  | ORPH 
      TestPythonPy3Qrcode | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866755  | ORPH 
         TestPythonPy3RSA | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866761  | ORPH 
     TestPythonPy3RpiGpio | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866757  | ORPH 
  TestPythonPy3S3transfer | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866765  | ORPH 
       TestPythonPy3SciPy | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866767  | ORPH 
...thonPy3ServiceIdentity | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866768  | ORPH 
      TestPythonPy3Smmap2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866769  | ORPH 
      TestPythonPy3Spake2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866770  | ORPH 
        TestPythonPy3Treq | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866771  | ORPH 
     TestPythonPy3Twisted | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866773  | ORPH 
       TestPythonPy3Txaio | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866775  | ORPH 
    TestPythonPy3Txtorcon | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866776  | ORPH 
      TestPythonPy3Ubjson | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866779  | ORPH 
...y3UnitTestXmlReporting | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866783  | ORPH 
       TestPythonPy3rtoml | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866764  | ORPH 
         TestPythonPybind | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866733  | ORPH 
             TestRdmaCore | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866784  | ORPH 
                TestRedis | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866792  | ORPH 
                TestRelro | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919865717  | ORPH 
                 TestRust | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866800  | ORPH 
              TestRustBin | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866802  | ORPH 
                   TestS6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866807  | ORPH 
         TestS6Networking | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866812  | ORPH 
      TestS6PortableUtils | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866818  | ORPH 
                 TestS6Rc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866821  | ORPH 
             TestStressNG | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866826  | ORPH 
                 TestSudo | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866827  | ORPH 
             TestSyslogNg | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866836  | ORPH 
                 TestTmux | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866844  | ORPH 
TestUbootOpensslPkgConfig | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866859  | ORPH 
                   TestZ3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866862  | ORPH 
             TestZerofree | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866868  | ORPH 
             TestZfsGlibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866872  | ORPH 
              TestZfsMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866879  | ORPH 
            TestZfsUclibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3919866885  | ORPH 



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
