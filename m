Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4D32C433F5
	for <buildroot@archiver.kernel.org>; Fri, 15 Apr 2022 04:42:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3483561014;
	Fri, 15 Apr 2022 04:42:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xhf8I4JKG4Hl; Fri, 15 Apr 2022 04:42:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9A22E61000;
	Fri, 15 Apr 2022 04:42:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1BBB31BF280
 for <buildroot@lists.busybox.net>; Fri, 15 Apr 2022 04:42:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F247641970
 for <buildroot@lists.busybox.net>; Fri, 15 Apr 2022 04:42:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NeNlYvm9mrBt for <buildroot@lists.busybox.net>;
 Fri, 15 Apr 2022 04:42:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6361C4196E
 for <buildroot@buildroot.org>; Fri, 15 Apr 2022 04:42:24 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 703DDE0004
 for <buildroot@buildroot.org>; Fri, 15 Apr 2022 04:42:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1649997741; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=un6izovUDHURf5rgYu8Pj9xeBuC2gWNmghD82mDEskM=;
 b=c+Ui34EhC2lfuWhO3QclStdW4VIkRN+C2gXQirrFniSSB9yIDgrZ1qxu+sHmEuGUDaNcRd
 ON8BIG6Zxsc+o4ajCfy3bv/g15kmJlzANc2cDX6ruAPWVqJljvyjDmS/c1da9m/tGno4YO
 g2RAsklVBzXQqhmj76RFsQWeB1KvXWHHMhsjdTOVYj+RH5URpEPiibKBCacpLY8k1xCQ9s
 BcY4fkIajk0n2yM6DpHOogKCVFv05nXSzRxMjwnnvxEjgAWzfdfoJ9uAysZy3/Cl2Qp23T
 B2uDwJ5irCJ/DB1vbKvhrtNx0WchFoSgXWH60Cw5J46w0at13YUELQDTPo9lFg==
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Fri, 15 Apr 2022 04:42:21 -0000
Message-Id: <20220415044227.F247641970@smtp4.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-04-14
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

Autobuild statistics for 2022-04-14
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  | 30  |  7  |  0  | 37  |
    master   | 155 | 409 |  0  | 564 |

Classification of failures by reason for master
-----------------------------------------------

            host-binutils-2.32 | 39
          host-util-linux-2.38 | 39
         host-gcc-final-10.3.0 | 24
               util-linux-2.38 | 17
             libopenssl-1.1.1n | 13
           libwebsockets-4.3.1 | 13
                 uclibc-1.0.40 | 13
           argp-standalone-1.3 | 12
              fetchmail-6.4.29 | 11
host-elf2flt-7e33f28df198c4... | 11
                 linux-5.15.33 | 11
tvheadend-1295dd2be863f5beb... | 9 
                host-go-1.17.8 | 8 
                libressl-3.4.3 | 7 
            qpid-proton-0.35.0 | 7 
toolchain-external-bootlin-... | 7 
                    ttyd-1.6.3 | 7 
          host-gcc-final-9.4.0 | 6 
polkit-a2bf5c9c83b6ae46cbd5... | 6 
                 zlib-ng-2.0.6 | 6 
    toolchain-external-bootlin | 5 
                 dash-0.5.11.5 | 4 
                    git-2.31.1 | 4 
glibc-2.34-109-gd64b08d5ba7... | 4 
                   perl-5.34.1 | 4 
               aircrack-ng-1.6 | 3 
azure-iot-sdk-c-LTS_01_2022... | 3 
                    dhcp-4.4.3 | 3 
                elfutils-0.186 | 3 
         host-gcc-final-11.2.0 | 3 
             host-pahole-v1.23 | 3 
   libtorrent-rasterbar-1.2.15 | 3 
linux-headers-5.10.104-cip3... | 3 
         linux-headers-5.15.33 | 3 
                     refpolicy | 3 
                  cc-tool-0.27 | 2 
                 dmalloc-5.6.5 | 2 
                  exempi-2.6.1 | 2 
fs/f2fs/f2fs.mk:64: /nvmeda... | 2 
              gnuradio-3.8.2.0 | 2 
                jailhouse-0.12 | 2 
               libcap-ng-0.8.3 | 2 
                libkrb5-1.18.4 | 2 
                 minizip-3.0.5 | 2 
                       unknown | 2 
                 wavemon-0.9.4 | 2 
                    4th-3.64.0 | 1 
                arp-scan-1.9.7 | 1 
               arptables-0.0.5 | 1 
                     aufs-util | 1 
                    bat-0.19.0 | 1 
                    bird-2.0.8 | 1 
                    brltty-6.4 | 1 
            btrfs-progs-5.16.2 | 1 
dahdi-linux-5c840cf43838e06... | 1 
                 dc3dd-7.2.641 | 1 
                  dhcpdump-1.8 | 1 
               ding-libs-0.6.1 | 1 
               erofs-utils-1.4 | 1 
                 fdk-aac-2.0.2 | 1 
fs/cramfs/cramfs.mk:46: /ho... | 1 
fs/cramfs/cramfs.mk:46: /nv... | 1 
fs/ext2/ext2.mk:65: /nvmeda... | 1 
fs/ext2/ext2.mk:65: /nvmeda... | 1 
fs/ext2/ext2.mk:65: /nvmeda... | 1 
fs/ext2/ext2.mk:65: /nvmeda... | 1 
fs/f2fs/f2fs.mk:64: /nvmeda... | 1 
fs/ubi/ubi.mk:51: /nvmedata... | 1 
fs/ubifs/ubifs.mk:49: /nvme... | 1 
            ghostscript-9.55.0 | 1 
                gnu-efi-3.0.10 | 1 
               gocryptfs-2.2.1 | 1 
          host-binutils-2.36.1 | 1 
              host-delve-1.8.0 | 1 
          host-erofs-utils-1.4 | 1 
       host-gcc-initial-10.3.0 | 1 
        host-gcc-initial-9.4.0 | 1 
                   json-c-0.15 | 1 
                    lftp-4.9.2 | 1 
libcamera-apps-2d1009e3badc... | 1 
              libeXosip2-5.3.0 | 1 
                 libhid-0.2.16 | 1 
                  libnspr-4.33 | 1 
                librsvg-2.50.7 | 1 
               libtalloc-2.3.3 | 1 
              libuhttpd-3.14.1 | 1 
       linux-5.10.104-cip3-rt3 | 1 
           lttng-libust-2.13.1 | 1 
          lua-cqueues-20200726 | 1 
                mongodb-4.2.18 | 1 
                netdata-1.33.1 | 1 
                  ntp-4.2.8p15 | 1 
            ocf-linux-20120127 | 1 
              open62541-v1.2.2 | 1 
               php-apcu-5.1.20 | 1 
                 pixman-0.40.0 | 1 
                    pppd-2.4.9 | 1 
              pure-ftpd-1.0.50 | 1 
                python3-3.10.2 | 1 
qt5base-f31e001a9399e4e6208... | 1 
            quickjs-2021-03-27 | 1 
rtl8188eu-60cb0b5a3cfc95e3f... | 1 
       shadowsocks-libev-3.3.5 | 1 
                     shim-15.4 | 1 
                  snmppp-3.4.9 | 1 
                  snort-2.9.19 | 1 
                tinifier-3.4.0 | 1 
toolchain-external-codescap... | 1 
                   trinity-1.9 | 1 
           uboot-tools-2021.07 | 1 
uclibc-ng-test-0844445e7358... | 1 
                  uhd-3.15.0.0 | 1 
                    vlc-3.0.16 | 1 
           wpa_supplicant-2.10 | 1 
xr819-xradio-16180b6308e3c5... | 1 
                  xvisor-0.3.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mips64    |           4th-3.64.0           | NOK | http://autobuild.buildroot.net/results/65707aa68625d17761a70436ce0c77166b257cb5 |     
    mips     |        aircrack-ng-1.6         | NOK | http://autobuild.buildroot.net/results/d5c3c76297e325802beaadbc096a786a8251c21c |     
   mips64    |        aircrack-ng-1.6         | NOK | http://autobuild.buildroot.net/results/bc576709963e32bed17b33c2df886c75427b8530 |     
  sparc64    |        aircrack-ng-1.6         | NOK | http://autobuild.buildroot.net/results/f4dec1957a030505506bed22281f4e51ce8791a4 |     
microblazeel |      argp-standalone-1.3       | NOK | http://autobuild.buildroot.net/results/07a73259c2ed0213bc2ae07ef31c680a6f88bfc2 |     
microblazeel |      argp-standalone-1.3       | NOK | http://autobuild.buildroot.net/results/27bd3495fec7450a7aaee7f8c4a7cf2ea68525cd |     
 microblaze  |      argp-standalone-1.3       | NOK | http://autobuild.buildroot.net/results/2719c1d35ecde71b633a2b5cf88d348ade0eadbc |     
   sparc     |      argp-standalone-1.3       | NOK | http://autobuild.buildroot.net/results/b4a7e63b1806e6a82909c2d2f5d539cf4d4aec4d |     
   armeb     |      argp-standalone-1.3       | NOK | http://autobuild.buildroot.net/results/1481603e7a411732a8db43641172a4611303b2a9 |     
   arceb     |      argp-standalone-1.3       | NOK | http://autobuild.buildroot.net/results/f3fbddc7754c9f132c64180efce2e760a7d52c26 |     
    arc      |      argp-standalone-1.3       | NOK | http://autobuild.buildroot.net/results/009cfb058fe9f1b5ce8c832dfdaf9a8cbb292e70 |     
microblazeel |      argp-standalone-1.3       | NOK | http://autobuild.buildroot.net/results/67a6aa8d71f4200b78fbcd5c3ad48692f43ddc10 |     
  powerpc    |      argp-standalone-1.3       | NOK | http://autobuild.buildroot.net/results/c3ab57e25f080066b90be3d1908cbc98f75d75eb |     
   mipsel    |      argp-standalone-1.3       | NOK | http://autobuild.buildroot.net/results/aef42c83ef60afb1add0df0ffccf56c47193e418 |     
    arc      |      argp-standalone-1.3       | NOK | http://autobuild.buildroot.net/results/571a9cb7de1ea0a343492d221ae20045801f901b |     
    mips     |      argp-standalone-1.3       | NOK | http://autobuild.buildroot.net/results/734d10fc357a278e3ae52f1bcd2856a92ceac7e5 |     
    arm      |         arp-scan-1.9.7         | NOK | http://autobuild.buildroot.net/results/3b89776a86cea5c03808bf000654a7396f5eab9d |     
   xtensa    |        arptables-0.0.5         | NOK | http://autobuild.buildroot.net/results/760c219f2fe93b70ecdd3c6b163aa0ff8f7ca3b1 | ORPH
    or1k     |           aufs-util            | NOK | http://autobuild.buildroot.net/results/ccfdce55338c3c2ed032fc2c2c6d84b8102f0227 |     
    arc      | azure-iot-sdk-c-LTS_01_2022... | NOK | http://autobuild.buildroot.net/results/741623a2f5de46c1eb583fe10888bbc9c22525a9 |     
    mips     | azure-iot-sdk-c-LTS_01_2022... | NOK | http://autobuild.buildroot.net/results/3cc237b1c6e32f596c01a5291dbdbaededbb03c5 |     
   sparc     | azure-iot-sdk-c-LTS_01_2022... | NOK | http://autobuild.buildroot.net/results/015bbb533bf0b56d382471f704b942419eb80f0c |     
   mipsel    |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/097a9ce5a7ca4ed932fbf0652955914f7e62abe6 |     
  mips64el   |           bird-2.0.8           | NOK | http://autobuild.buildroot.net/results/3c6492a50bbf6bb9de9e750b0d2fea716ad04755 |     
 microblaze  |           brltty-6.4           | NOK | http://autobuild.buildroot.net/results/a7501a44e5f27776607f79035167e80c8aadaf2d |     
    arm      |       btrfs-progs-5.16.2       | NOK | http://autobuild.buildroot.net/results/2bd4f3c7aacad3537dc2408532467e03e1b520ba | ORPH
   s390x     |          cc-tool-0.27          | NOK | http://autobuild.buildroot.net/results/14a8d42186d7db053ad9c43d564af51bb46de96b |     
  powerpc    |          cc-tool-0.27          | NOK | http://autobuild.buildroot.net/results/58933d0a0022509cee5521f94f816b77278836e3 |     
    mips     | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/a849cba7d69aba929c739fba9074de3e07d18460 |     
  sparc64    |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/18a2f9a76bb56aba2859dfa74f54b078c7499b1f | ORPH
  sparc64    |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/ddeede4ff0eecb739880b49702e3e2f74e11932e | ORPH
   mipsel    |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/dc174fd5620bdbf777d656113dd6ad491b6dca89 | ORPH
   mips64    |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/d8cfd29c9087f128c58770738808fb3db052ec26 | ORPH
    sh4      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/0b1511f59f7ade72e1ae04852c2761bb8c633c72 | ORPH
  riscv64    |           dhcp-4.4.3           | NOK | http://autobuild.buildroot.net/results/7a57216d008fbaa4bdbccb702ccac9b303e36929 | ORPH
    arm      |           dhcp-4.4.3           | NOK | http://autobuild.buildroot.net/results/b3f11d3a85c3c21801066f6f0a4b4dbdd270bcce | ORPH
  riscv64    |           dhcp-4.4.3           | NOK | http://autobuild.buildroot.net/results/350cb4cfb91660a34e8c575f94a7129c0fc8f0cb | ORPH
    arm      |          dhcpdump-1.8          | NOK | http://autobuild.buildroot.net/results/39a6cf24a5b218a61abac335822bc002162102e2 | ORPH
   arceb     |        ding-libs-0.6.1         | NOK | http://autobuild.buildroot.net/results/d0fec6e84afcb1aa06fec131215d57552cfa15a2 |     
    i686     |         dmalloc-5.6.5          | NOK | http://autobuild.buildroot.net/results/24b3547cbc6f4bec9eb1dce370b4d48319da18d2 | ORPH
 powerpc64   |         dmalloc-5.6.5          | NOK | http://autobuild.buildroot.net/results/eae3882abdc9fad14599af9e1b3f4c32abe4e2a8 | ORPH
   arceb     |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/c97a022f77c94b3c524d372f824e6d52468cb0d3 | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/55be8bf033ff904dd7d8d390f17297ec60d5e739 | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/6a373696221569b5ceb24c70775e451bc479d994 | ORPH
    or1k     |        erofs-utils-1.4         | NOK | http://autobuild.buildroot.net/results/fefd46b1247ff8d9a6cceae2214b817ed45923cd |     
    arm      |          exempi-2.6.1          | NOK | http://autobuild.buildroot.net/results/6e7c2ed5a4d2001302c5d34b6abe70215eae4011 |     
    arm      |          exempi-2.6.1          | NOK | http://autobuild.buildroot.net/results/069b081133a4ad2ae49e9484e870fa9e3b7846ab |     
   mips64    |         fdk-aac-2.0.2          | NOK | http://autobuild.buildroot.net/results/4be3ca713e382622d4cc53abee919f8fc22099b1 |     
    m68k     |        fetchmail-6.4.29        | NOK | http://autobuild.buildroot.net/results/4fd28262c323cc510415558b6ed549d2c44ecdc9 |     
 powerpc64   |        fetchmail-6.4.29        | NOK | http://autobuild.buildroot.net/results/65d29a9e48d0bfd0ea3e4f049e53ef507ec416c5 |     
  powerpc    |        fetchmail-6.4.29        | NOK | http://autobuild.buildroot.net/results/c6527a4345534ef82e0ad271491e7480df876285 |     
   sparc     |        fetchmail-6.4.29        | NOK | http://autobuild.buildroot.net/results/5af467de078ead555ba6e6e0f68874cf46a27dbd |     
 powerpc64   |        fetchmail-6.4.29        | NOK | http://autobuild.buildroot.net/results/2d7c7ec36460feb456aabd9aa34a7c1f8ff12cf7 |     
  mips64el   |        fetchmail-6.4.29        | NOK | http://autobuild.buildroot.net/results/cc8308917f97330792d09c723b0a896cfbb0f5a1 |     
 powerpc64   |        fetchmail-6.4.29        | NOK | http://autobuild.buildroot.net/results/70b87887fee887978b8d13377bf574f687aa3c68 |     
   nios2     |        fetchmail-6.4.29        | NOK | http://autobuild.buildroot.net/results/6fe2b55811acfa68a7f87b21f825d28163bb9906 |     
   mips64    |        fetchmail-6.4.29        | NOK | http://autobuild.buildroot.net/results/8212935d343725ee6757efc0ea00925b13cb94dd |     
microblazeel |        fetchmail-6.4.29        | NOK | http://autobuild.buildroot.net/results/cc606d1865e680f6ef1d187bb6cde5352f54fa19 |     
   s390x     |        fetchmail-6.4.29        | NOK | http://autobuild.buildroot.net/results/54fe7a025e4d6654f30b8b9e65e82a1eb9fd684b |     
 microblaze  | fs/cramfs/cramfs.mk:46: /ho... | NOK | http://autobuild.buildroot.net/results/8cc45784291833e335446360a8dffadc4c2c1338 |     
microblazeel | fs/cramfs/cramfs.mk:46: /nv... | NOK | http://autobuild.buildroot.net/results/fe37daf6856e16d44795a7d6bbf3304c0ce9338a |     
  powerpc    | fs/ext2/ext2.mk:65: /nvmeda... | NOK | http://autobuild.buildroot.net/results/92ba1fb2c02ae2f4651c83f6da2749237ff2d45a |     
 microblaze  | fs/ext2/ext2.mk:65: /nvmeda... | NOK | http://autobuild.buildroot.net/results/b22496e4e5d152e7aa4701b7514837fc50a1425d |     
    i586     | fs/ext2/ext2.mk:65: /nvmeda... | NOK | http://autobuild.buildroot.net/results/35a577b723a227e1109d64a2a7fcb02e0c5dc92c |     
 powerpc64   | fs/ext2/ext2.mk:65: /nvmeda... | NOK | http://autobuild.buildroot.net/results/15e232d4676e26ee8c2bcf2f45bd1919cbe0f65e |     
   arceb     | fs/f2fs/f2fs.mk:64: /nvmeda... | NOK | http://autobuild.buildroot.net/results/15a486f94a77d525fb3a5306e573461e85b89fd8 |     
 microblaze  | fs/f2fs/f2fs.mk:64: /nvmeda... | NOK | http://autobuild.buildroot.net/results/a39f2c9f7428882d10ee53aa3aaf27d55404ee46 |     
    or1k     | fs/f2fs/f2fs.mk:64: /nvmeda... | NOK | http://autobuild.buildroot.net/results/90f96021ad569f85933f1322cf40f5ca4a88afa8 |     
    mips     | fs/ubi/ubi.mk:51: /nvmedata... | NOK | http://autobuild.buildroot.net/results/c750f4c25c699239f2045026c7e928d426c6cd8d |     
powerpc64le  | fs/ubifs/ubifs.mk:49: /nvme... | NOK | http://autobuild.buildroot.net/results/1974ab2ef739ba2d1f8f4e90194947b505c294d5 |     
  mips64el   |       ghostscript-9.55.0       | NOK | http://autobuild.buildroot.net/results/3610378a294310ca2e319d72abd510ce49f245fd |     
  powerpc    |           git-2.31.1           | NOK | http://autobuild.buildroot.net/results/7490c23e3769fefbc6793862c8523e613aa4cf72 |     
  mips64el   |           git-2.31.1           | NOK | http://autobuild.buildroot.net/results/1a5f4f086ccb083f3028ce4313294340c9111cec |     
microblazeel |           git-2.31.1           | NOK | http://autobuild.buildroot.net/results/4623626f191ccca77ea13ccf57496442b0b411fb |     
    arc      |           git-2.31.1           | NOK | http://autobuild.buildroot.net/results/1542947442b9f337e3564d0d5bc5ced5db369ea6 |     
    i686     | glibc-2.34-109-gd64b08d5ba7... | NOK | http://autobuild.buildroot.net/results/739ec19ef3d96527e1fae70ccd06893f1dfa5d18 |     
powerpc64le  | glibc-2.34-109-gd64b08d5ba7... | NOK | http://autobuild.buildroot.net/results/4e26050efc9233338ec0453565b91516f8c0c368 |     
powerpc64le  | glibc-2.34-109-gd64b08d5ba7... | NOK | http://autobuild.buildroot.net/results/62944d936f0d12d7fb95988788e9f45c6c7b09d8 |     
   nios2     | glibc-2.34-109-gd64b08d5ba7... | NOK | http://autobuild.buildroot.net/results/071a3f9e71bb0375e4796051ecb4bc049e94a642 |     
  mips64el   |         gnu-efi-3.0.10         | NOK | http://autobuild.buildroot.net/results/34d4447bb5c7f5ffaaa10466e65cd35bcdb7d064 |     
  mips64el   |        gnuradio-3.8.2.0        | NOK | http://autobuild.buildroot.net/results/44b78e825e40c84943729861ba73e0e2af08a67d |     
  mips64el   |        gnuradio-3.8.2.0        | NOK | http://autobuild.buildroot.net/results/e846b99532fa02048579360feb34f320634c3530 |     
  aarch64    |        gocryptfs-2.2.1         | NOK | http://autobuild.buildroot.net/results/3765f581527c16f6106194277522de0b57e8c109 |     
   sh4aeb    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/a68b7b4da811860c1cc02b2432ee93787deb94a4 |     
    sh4      |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/1416616febcaae73d8c46a2a48575fabc1acdbe8 |     
   sh4aeb    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/353f59d7e5b10426f3ba12326303c1651866acc4 |     
    sh4a     |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/35f2ff1e95b170f23bef59f548cf03cb12d828d9 |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/89b68e955db8b6a0a8e5aa1fb301f884dda3e330 |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/97e711a3b3a577524e9700ea4f649438c41a9b6a |     
 aarch64_be  |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/09a8a324f7a354a7dbcdb19c715c118f1982aa4e |     
 aarch64_be  |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/335d9f6fa11c30cad95316acbf85622f0bde2b5f |     
 aarch64_be  |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/5af919c61d9955e1de2dd3515cea594a29557d38 |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/e3cc9de948dda56a1a41664b0ff7be2a48ff7412 |     
    sh2a     |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/f3a4b4e5c4c3d043729dec0947366a248e3cd47c |     
   sh4aeb    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/0cdbab5bbc67e4ac5dc68cbbbb0725d214d93a34 |     
 aarch64_be  |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/abc4978369f2a5e423c558af65fd40eee6f039b1 |     
    sh2a     |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/6078281e187a97054152a2ed5c11d68435c5879f |     
    sh4a     |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/409a0efe827ef3990269c9e286f8161f099e8112 |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/ea171731a74d456ab62a672eaa6852dd6790fe11 |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/c98c6355c6cac60f86a80f5d67bc574b3ad2dcbe |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/b4c7bfaf233e3de4f39fdd5f82cf7aa26dfa361d |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/8b3d59cad31fcc09885fad3f673134027721ecc6 |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/c8b8f85a036a33f8fcceedeb4d487204e8736884 |     
 aarch64_be  |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/8e736cd21eeb6a566a079ec2d462a8776f07c077 |     
 aarch64_be  |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/008dbe15a909c89181d1db37263da708fb83a4e7 |     
   sh4aeb    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/e8317cbd52ff1e1db861c3dbf0b5ad39935a65f4 |     
 aarch64_be  |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/669f4c8018cd685d7f1e70fac24c851fbaee039f |     
 aarch64_be  |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/09973587fb91c1d86813b5e8812d1591a20d4563 |     
   sh4eb     |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/c03d12ae15a774c59d2d5d7439c0c7784f06fc72 |     
   sh4eb     |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/f3c7179947b69c9cfabce16f349d78f4f64890ad |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/22bae561c418ae07a541533d37f4fb14fe26ea42 |     
    sh2a     |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/85214e93f100b926e24b224320982d3ccaea9ca4 |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/f5e5102673dacecab050cc2a4401104048ed4494 |     
 aarch64_be  |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/16472ae629bf3bb3b769bd20791f0c5ed0640cd2 |     
 aarch64_be  |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/b8c752e2a57f6faa4df44e25cc7cc0751f8b2dba |     
 aarch64_be  |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/f751cb6770f241a7b39ba84d49516abd78326066 |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/de922c1d2c685066e5a12b386de961818339eca4 |     
   sh4aeb    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/bc6dde095929622e0d4f5e0e70fccfbf3aa6a769 |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/6fb52635111ac552bfa86464414e575c1457a283 |     
   sh4eb     |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/0928d92445d77c5b8c110e77311f5ac114a64810 |     
 aarch64_be  |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/0eec8546de50bab7134b6670e2b81139987ff5d1 |     
   sh4aeb    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/04393e2d4d204a0aef7516ba31b85b6ff290cec2 |     
  riscv64    |      host-binutils-2.36.1      | NOK | http://autobuild.buildroot.net/results/25e29e47efd1debaedb4eefbbe9bdd4bd755a84a |     
    arm      |        host-delve-1.8.0        | NOK | http://autobuild.buildroot.net/results/bec83ad7ccb7701708063efe7aa09923b39f1b9f |     
   armeb     | host-elf2flt-7e33f28df198c4... | NOK | http://autobuild.buildroot.net/results/10b204ec278db5ef50969a07b639a7ca62212e14 | ORPH
   armeb     | host-elf2flt-7e33f28df198c4... | NOK | http://autobuild.buildroot.net/results/5cbbf5f92a3cccba44f777c810a6f600dcfdcc81 | ORPH
   armeb     | host-elf2flt-7e33f28df198c4... | NOK | http://autobuild.buildroot.net/results/334472b9f800825f188e513c94b63df43b553f96 | ORPH
   armeb     | host-elf2flt-7e33f28df198c4... | NOK | http://autobuild.buildroot.net/results/0c41004f906131fcc1dbd3c863397ee0e108d6d0 | ORPH
   armeb     | host-elf2flt-7e33f28df198c4... | NOK | http://autobuild.buildroot.net/results/3ecd59b4c23e94c5fe2060e27e79f24059abf37b | ORPH
   armeb     | host-elf2flt-7e33f28df198c4... | NOK | http://autobuild.buildroot.net/results/f2399ea5508391c7a1e47917bb757cd45175aa66 | ORPH
   armeb     | host-elf2flt-7e33f28df198c4... | NOK | http://autobuild.buildroot.net/results/317b24edb406c77b0fffa748cf608a08b2327a12 | ORPH
   armeb     | host-elf2flt-7e33f28df198c4... | NOK | http://autobuild.buildroot.net/results/d5f360dfbaeabbc7501aae0abc8963130125d7be | ORPH
   armeb     | host-elf2flt-7e33f28df198c4... | NOK | http://autobuild.buildroot.net/results/7f48aab80876da99906359dadc295ba4f8f8c57a | ORPH
   armeb     | host-elf2flt-7e33f28df198c4... | NOK | http://autobuild.buildroot.net/results/a985cfb79a20108d77f45059fa199c03f7f99d5c | ORPH
   armeb     | host-elf2flt-7e33f28df198c4... | NOK | http://autobuild.buildroot.net/results/c5bedc97fdfa93ad87e9aa93f34a497489831c13 | ORPH
    arc      |      host-erofs-utils-1.4      | NOK | http://autobuild.buildroot.net/results/a4e52533bdabeec88756e0417e5c770be92ecf46 |     
powerpc64le  |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/3b29e948b4d981b8483d6c2e504394227359d328 |     
   nios2     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/a62263c0ad88b3ffba6eb24286d4947a80e6ddaa |     
  sparc64    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/2494490d4c426b9935d2a70e05e12abd36fcd231 |     
  sparc64    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/e31717ab90333773c1cff0817652afc71ccf73bb |     
 powerpc64   |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/f770493b079775700387b3c274bed0b50c23aabb |     
powerpc64le  |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/29668fd2cb20e11a628cf486f66184c4d0b2c35e |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/bac0ac1a6b382db6091f31070cab558986c4ffa8 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/3e153c40c1cd2135d0d979a49cab41b4d1b95dc8 |     
   nios2     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/3a93beab3d9e2b3d5b272be6b0110e5a7d883943 |     
   x86_64    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/1c68ee060b4ecf0a0fd3fe9c7a8c284a22da1de8 |     
  riscv32    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/1604d7bf024d5d717d0f33b6143d1d2a7a7e90d3 |     
  sparc64    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/445db4fbe53cdf7de1c37c0ecf7561c6f08a6207 |     
   nios2     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/2d58456fffa97cf513e1ddd0eb58c45fa284105d |     
   nios2     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/6a98599b2c9241a61aad752c6d1c5c59568da9c4 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/b2bd227f2d7f857da34b06bb1f02185c7254c430 |     
 powerpc64   |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/da1c7093489318b621475b62e136dd320483ec48 |     
powerpc64le  |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/dcda2e9c0c2edf41e1337cc9e355c2f7a623dc26 |     
 powerpc64   |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/c80ab83c88796c8193baf284fed030956803a4bb |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/35d6b704b4de1706f8686b552aa01fd2cee686b0 |     
   nios2     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/58fba6ef7ab6ca0d00d4e06f3f84028641280630 |     
 powerpc64   |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/ae0cf55f5b31fb261013f3c5739f85ba575587cb |     
  riscv32    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/a7ef2f3d2c9424afd4040eaacfe6714e3fb9b421 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/d4f05e89fde21c0b327337a7c25f0235c5cd1f37 |     
  sparc64    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/f3c7493d7acf08e852727d0d431d3e30d38c4287 |     
microblazeel |     host-gcc-final-11.2.0      | NOK | http://autobuild.buildroot.net/results/3d25fb0085bdba9dead5683ee1509d974c56ed05 |     
   nios2     |     host-gcc-final-11.2.0      | NOK | http://autobuild.buildroot.net/results/f249ae9bc2983e341d52877b8170f4e7259cd104 |     
powerpc64le  |     host-gcc-final-11.2.0      | NOK | http://autobuild.buildroot.net/results/0d0e791decda32bc8b9828e5401f7182bf8747ef |     
powerpc64le  |      host-gcc-final-9.4.0      | NOK | http://autobuild.buildroot.net/results/8e32544265c6afb9e0aeac5bb97e3eff185063d5 |     
   nios2     |      host-gcc-final-9.4.0      | NOK | http://autobuild.buildroot.net/results/69a55f79f5b92f54ca00b14e9a82f1c251a7ed85 |     
powerpc64le  |      host-gcc-final-9.4.0      | NOK | http://autobuild.buildroot.net/results/31d24b5fbc3463bdb7f4be2a80e201f0109445d9 |     
 microblaze  |      host-gcc-final-9.4.0      | NOK | http://autobuild.buildroot.net/results/5b0314f5f554df12d1468ff620d1d43f1f33e999 |     
  riscv32    |      host-gcc-final-9.4.0      | NOK | http://autobuild.buildroot.net/results/ff565240cc600b89e54247c2beed4bcea0ffb78b |     
   s390x     |      host-gcc-final-9.4.0      | NOK | http://autobuild.buildroot.net/results/e612a8fdcf904f9074cdd21fedbd161ff39b244d |     
    arm      |    host-gcc-initial-10.3.0     | NOK | http://autobuild.buildroot.net/results/666146c2cfea80a8a71b51f4f794709626178e73 |     
    arm      |     host-gcc-initial-9.4.0     | NOK | http://autobuild.buildroot.net/results/5c59412d55654103f93d74c50e8fbe4cb8415a67 |     
    i686     |         host-go-1.17.8         | NOK | http://autobuild.buildroot.net/results/661cacbbdef3af65a5f1d9ec3c36bd2404c50a04 |     
  mips64el   |         host-go-1.17.8         | NOK | http://autobuild.buildroot.net/results/f42b8a606c394cce19bcc6bb2f05a90de055abeb |     
    i686     |         host-go-1.17.8         | NOK | http://autobuild.buildroot.net/results/a937d59904298fd384b7fc12f0ba18c89335aff2 |     
    i686     |         host-go-1.17.8         | NOK | http://autobuild.buildroot.net/results/6c6633a79a8ff09b4b109f0b745f68e118612ec7 |     
  mips64el   |         host-go-1.17.8         | NOK | http://autobuild.buildroot.net/results/69402ea6cf52300f6ab7331b8927ed8e2e4e8b99 |     
   mips64    |         host-go-1.17.8         | NOK | http://autobuild.buildroot.net/results/08391782e54d5df4db15736e7834b85f36ff9166 |     
   mips64    |         host-go-1.17.8         | NOK | http://autobuild.buildroot.net/results/2599c115a1064b9d0e43c692627dde1a06528db2 |     
  aarch64    |         host-go-1.17.8         | NOK | http://autobuild.buildroot.net/results/3a6c88384558c9c67cb59fde1018b3265aa178a3 |     
   xtensa    |       host-pahole-v1.23        | NOK | http://autobuild.buildroot.net/results/fa4fb6ca383e058e89ff8796ac9ae68a0b1681b5 |     
    m68k     |       host-pahole-v1.23        | NOK | http://autobuild.buildroot.net/results/b584c57a72e4604112f4b12c0c7b21e1a4b41dd5 |     
    arm      |       host-pahole-v1.23        | NOK | http://autobuild.buildroot.net/results/b43be30cb177066d1b49bf4822790ec0ca019d03 |     
   xtensa    |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/17dad6837d4be5cb1e0618518523a2496eeffb7f | ORPH
  sparc64    |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/c5664fd4c2ecba6d47aa8296b9b78179983ab5a6 | ORPH
  powerpc    |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/d48a9c4d7ee0d1a723ce5bf67b1f26a24781ff91 | ORPH
  riscv64    |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/697867eefb31857f1cff608cab47fd1561592457 | ORPH
  aarch64    |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/5be015edf419092973051a17c1bd14e1f7d587f0 | ORPH
microblazeel |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/641e5b77787ef840f61baab833cb96fc2e575259 | ORPH
   mipsel    |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/a7504e6582761789fed6fcb3a1c5f5dde3fdf0c8 | ORPH
microblazeel |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/7121fdb20a4438338bb5a1cb9aabb6089f0c578d | ORPH
  powerpc    |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/1393cb583ca338037cdb75d582eb9db925cf85b8 | ORPH
   s390x     |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/75b66d64c04589bba4ebca4f94903fdf1dd128d6 | ORPH
    arm      |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/ff7c93a88e75111c1e8f818ab3a4c6089791845d | ORPH
    arm      |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/d42efb7ef666febec6167f918432100ee1794e63 | ORPH
    arm      |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/bc28a5f69d315803d81bdcc397447ef076627b2c | ORPH
powerpc64le  |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/0fc08b14b6ab200a02f7ca3451fbb86965670edc | ORPH
    or1k     |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/1605ca5786e78e3d976d31e8e5169ec4291b1a91 | ORPH
    arm      |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/82dc982f7929c37fdd54d9fdc5e3ba0d169206fc | ORPH
    arm      |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/5146f819af1dc7202f9711a07400448154352628 | ORPH
    mips     |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/9c143c613a26b3a7de8b0ac8cef6e7efdd288abb | ORPH
 powerpc64   |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/02023a7af074648e479d68171db99a73bd11a99f | ORPH
   xtensa    |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/45fe7f8b25a7cd13006e8595744e08ba422d8062 | ORPH
    arm      |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/c97528f10aebab72133df5d9d2e1314a7da032af | ORPH
    arm      |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/420b412007f38e6ead93bdb0652322cd432e11fc | ORPH
  powerpc    |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/53226dca29570f51784bf48ce2c4ffa79ca36db2 | ORPH
   s390x     |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/535faf5e0542465084619a8e59c90c2c15415c22 | ORPH
    m68k     |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/3efaa66622bc02e2d942bdc430c1f03daa1852b5 | ORPH
    mips     |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/7150486d190dfbe6bb82e4d7792d0cc95f83c324 | ORPH
 powerpc64   |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/4bcf5035e913e50877f675f7b59e981373d24863 | ORPH
    arm      |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/f9c871e6ba8d6756e19e464d5ef60db62847831b | ORPH
    arc      |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/7857764f748d583522d43b3c3e80e9c4ca784964 | ORPH
  riscv64    |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/d4e72f4c44850721ccf9283ba484d6b30882c7af | ORPH
    arm      |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/e1e00a21826fe86e20bdf5b79d82279f8a077c85 | ORPH
    m68k     |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/917dee40a2e28dbcc544e674d4e914d7b95b3251 | ORPH
    arm      |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/b684f02fbbe3a7d255518836844f704a16ab31d0 | ORPH
  sparc64    |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/11fb098fb526b1e2346aa2e6f3dc9d739a22a378 | ORPH
 powerpc64   |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/791fb7b4203703cfc0847b1f764fcff84efbf57c | ORPH
   x86_64    |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/d20dc4f18488a215c31d3e709b731d2cf4d5bc0a | ORPH
    arm      |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/98b1112532c337e5e080dbbc0e206afd226fda31 | ORPH
    arm      |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/711bd5abf52b8c953b05101a27e4c0e3f3ffd581 | ORPH
microblazeel |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/9f1baecb44d7de78fe5b1495f3ace182be64d4eb | ORPH
  aarch64    |         jailhouse-0.12         | NOK | http://autobuild.buildroot.net/results/ee0ff22e64890a9708e9b63393c83c30b515a59b |     
   x86_64    |         jailhouse-0.12         | NOK | http://autobuild.buildroot.net/results/54a0d8308277ae1b55c17986faff0eb280aa8703 |     
    or1k     |          json-c-0.15           | NOK | http://autobuild.buildroot.net/results/975ad27f49d0a2ca8b7133225f5c77a4390b9f90 |     
microblazeel |           lftp-4.9.2           | NOK | http://autobuild.buildroot.net/results/c9741b92f85623e03386b92967f0198ac8f7f87e |     
microblazeel | libcamera-apps-2d1009e3badc... | NOK | http://autobuild.buildroot.net/results/a40348aa746a98c21a140e599008ef348155a493 |     
  riscv64    |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/de34bac833436e74fc3c196e1b58e549a88b179b |     
  riscv64    |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/d3850976708e60e0e3ae1bf653583149fe036a0e |     
   xtensa    |        libeXosip2-5.3.0        | NOK | http://autobuild.buildroot.net/results/c386d9f1bbe7e10c8a9a94d1b8398ba9a49692a4 |     
    arm      |         libhid-0.2.16          | NOK | http://autobuild.buildroot.net/results/a10e06410bdc3ea4929658b9d04a844265059dd7 | ORPH
   sparc     |         libkrb5-1.18.4         | NOK | http://autobuild.buildroot.net/results/3667408c40025bbde67f51edea2f250ec1f1fd53 |     
 aarch64_be  |         libkrb5-1.18.4         | NOK | http://autobuild.buildroot.net/results/bc9374450f87b4e91d9d5291cb576ab6cd7886d0 |     
   mipsel    |          libnspr-4.33          | NOK | http://autobuild.buildroot.net/results/970b6657c1cfaaa1388098e81f176fbab37aea1d |     
    m68k     |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/b78cea646e4e233a03305bd8571a77a6f1fcfe7f |     
   arceb     |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/354c0b2f75a57d06a3b06879bf1f60bee6a5b72a |     
    arc      |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/0f385cf5aed29035790967077e914e02d41630c2 |     
    arc      |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/99f70ac12dd5d285b88fd290a18ec15244cd8356 |     
   sparc     |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/5a52385809ca57c94e80a4a3098269db85433e53 |     
 microblaze  |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/0e97e7a9c54d9273e50261f670374fff1720a411 |     
   xtensa    |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/36b819c1c885c6c53c7aff24c64d35d43505c657 |     
    m68k     |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/aec96f2dbecfdcf6bbb0b7fc41a4b7f9750b42a5 |     
microblazeel |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/fd18ed5b3f98c149a232265bcfb0f96c3e5de4b4 |     
   arceb     |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/2890ad2b8e1a4fdfb1256c568beb308e3358b4a8 |     
microblazeel |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/416c451e0bbc19f9fbca73e9b4c43bfb905f7c65 |     
  mips64el   |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/3a254fa1df35a17777c7e2f4fe6a571800696fb3 |     
    arc      |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/0421aba3adcbac9868284b20479ab2edb5aaaff4 |     
   sparc     |         libressl-3.4.3         | NOK | http://autobuild.buildroot.net/results/bd056d0cd03bba67b7e908192bda3440c4ad45ef | ORPH
    arc      |         libressl-3.4.3         | NOK | http://autobuild.buildroot.net/results/f5475df20665012e7315a14fe71bf4ad674705c8 | ORPH
    m68k     |         libressl-3.4.3         | NOK | http://autobuild.buildroot.net/results/e9ff73e602cdc13fd58fdb27674c0dd3d4dbe7cd | ORPH
    m68k     |         libressl-3.4.3         | NOK | http://autobuild.buildroot.net/results/6bb12f3f59115613fb20ea8b3e977aa83433b15c | ORPH
   arceb     |         libressl-3.4.3         | NOK | http://autobuild.buildroot.net/results/4bd668f4aa9ea3ee7c245ad5e16ac998ce45eae9 | ORPH
   mipsel    |         libressl-3.4.3         | NOK | http://autobuild.buildroot.net/results/bf34e2c15b34831234ab86cf5b87395ab14a40fe | ORPH
   x86_64    |         libressl-3.4.3         | NOK | http://autobuild.buildroot.net/results/04c75285aea473132794bc741b57df098408368f | ORPH
   x86_64    |         librsvg-2.50.7         | NOK | http://autobuild.buildroot.net/results/1527ae72563916b01d34909e0c20b60b2a38ff3d |     
    i686     |        libtalloc-2.3.3         | NOK | http://autobuild.buildroot.net/results/550d1d96e5a30e083a933e5b47c7e2429ae3ca29 |     
   mips64    |  libtorrent-rasterbar-1.2.15   | NOK | http://autobuild.buildroot.net/results/791d41c8fffc232f081cb6a5a353183b3a1e8a45 |     
    m68k     |  libtorrent-rasterbar-1.2.15   | NOK | http://autobuild.buildroot.net/results/19c15838d038b60fb77d84317d706acead7077b1 |     
   sparc     |  libtorrent-rasterbar-1.2.15   | NOK | http://autobuild.buildroot.net/results/d002803d5bd8d5cabab456f3ff52abf97d781c67 |     
   mips64    |        libuhttpd-3.14.1        | NOK | http://autobuild.buildroot.net/results/97b52e187d3c57e839a1d72a80d86f399873ecdb |     
  mips64el   |      libwebsockets-4.3.1       | NOK | http://autobuild.buildroot.net/results/c373febf5634c814cd0e901da43301e71057625f |     
  sparc64    |      libwebsockets-4.3.1       | NOK | http://autobuild.buildroot.net/results/e4516473fe4972a4d03409464bcefc61cb860713 |     
   nios2     |      libwebsockets-4.3.1       | NOK | http://autobuild.buildroot.net/results/1bf602e23380c9f83ab45ea813f1b4b453875587 |     
  sparc64    |      libwebsockets-4.3.1       | NOK | http://autobuild.buildroot.net/results/0eeb4fda50a6864cfbeb5c51d8182e52f13dae31 |     
 microblaze  |      libwebsockets-4.3.1       | NOK | http://autobuild.buildroot.net/results/89c4201e09b96e7460aeb6bf5f1fcf247c249b31 |     
    i686     |      libwebsockets-4.3.1       | NOK | http://autobuild.buildroot.net/results/b318b717b2cfcedeb59b3adea6875a905e1ed899 |     
microblazeel |      libwebsockets-4.3.1       | NOK | http://autobuild.buildroot.net/results/67767ef82b1bcee3ea235db96122e1989d5c9243 |     
microblazeel |      libwebsockets-4.3.1       | NOK | http://autobuild.buildroot.net/results/81fb1a8745fd0035f90b8f82a9d069a3485ba6ea |     
    arm      |      libwebsockets-4.3.1       | NOK | http://autobuild.buildroot.net/results/06cc3715868177bcbbba58aa4aa691d91359e545 |     
   arceb     |      libwebsockets-4.3.1       | NOK | http://autobuild.buildroot.net/results/3e24e2886ca73eab0de41cb8aff6da1b6a5efa4c |     
    mips     |      libwebsockets-4.3.1       | NOK | http://autobuild.buildroot.net/results/6d6f12aa3caf3c665e123a2cac512fbb1e174c95 |     
    m68k     |      libwebsockets-4.3.1       | NOK | http://autobuild.buildroot.net/results/db35c03facde6542009bf67cbe4aee6e0536afbb |     
  sparc64    |      libwebsockets-4.3.1       | NOK | http://autobuild.buildroot.net/results/273eadffdeaacd4ce71c2f7ff7e59c2f587059bf |     
   nios2     |    linux-5.10.104-cip3-rt3     | NOK | http://autobuild.buildroot.net/results/dd36f7a3cc3f9486a0458b760cd774296fbacd76 | ORPH
   mipsel    |         linux-5.15.33          | NOK | http://autobuild.buildroot.net/results/7621021f57b1ccc410567839d88ef4492a814767 | ORPH
 powerpc64   |         linux-5.15.33          | NOK | http://autobuild.buildroot.net/results/c8f65d8991883a2b363b4374bcb9c053570d4db2 | ORPH
   xtensa    |         linux-5.15.33          | NOK | http://autobuild.buildroot.net/results/5c8fc7f66ec45c260a8c6c6d4275c6bc09d5d649 | ORPH
    i686     |         linux-5.15.33          | NOK | http://autobuild.buildroot.net/results/78d41edf12ddf7a55f879cbcbcddfcbf474b3638 | ORPH
   xtensa    |         linux-5.15.33          | NOK | http://autobuild.buildroot.net/results/e079891cc5aee356dcf30b07248b074f903eea53 | ORPH
   mips64    |         linux-5.15.33          | NOK | http://autobuild.buildroot.net/results/c237799dfc2f38bd19cbdb8a1b40255027d4074d | ORPH
   sparc     |         linux-5.15.33          | NOK | http://autobuild.buildroot.net/results/f23ab5e5f79955fba368cf54f264f7fde639a9d7 | ORPH
    m68k     |         linux-5.15.33          | NOK | http://autobuild.buildroot.net/results/1f68f146d8de12f46cf02baa7efcce2c18ab1612 | ORPH
    mips     |         linux-5.15.33          | NOK | http://autobuild.buildroot.net/results/c8bb4f5ee54e7b9c3ef61d7827c3a5a5bb7df996 | ORPH
    m68k     |         linux-5.15.33          | NOK | http://autobuild.buildroot.net/results/4ce5b75536e2dec29d339790246e5feb80eea0c8 | ORPH
  mips64el   |         linux-5.15.33          | NOK | http://autobuild.buildroot.net/results/e7860a741781ef688d75e189e095d53557abbbb8 | ORPH
    arc      | linux-headers-5.10.104-cip3... | NOK | http://autobuild.buildroot.net/results/52631b5ae7faf06ca6a220c98fcedf51d3cd5e36 | ORPH
    or1k     | linux-headers-5.10.104-cip3... | NOK | http://autobuild.buildroot.net/results/7548ef10d222bbcb33af48eaa55873288ae31d68 | ORPH
powerpc64le  | linux-headers-5.10.104-cip3... | NOK | http://autobuild.buildroot.net/results/c066064239f7f11c7235a7136cef6e5ca1e82e7b | ORPH
microblazeel |     linux-headers-5.15.33      | NOK | http://autobuild.buildroot.net/results/fc9bf2a577b78ee121e8ce76a8c4c64182c408b8 | ORPH
 microblaze  |     linux-headers-5.15.33      | NOK | http://autobuild.buildroot.net/results/76e2b73760f1290a6a95ddcecaadecf87a3f711c | ORPH
 microblaze  |     linux-headers-5.15.33      | NOK | http://autobuild.buildroot.net/results/160a5dd990030e78922c88f80996ab6556a456fb | ORPH
   x86_64    |      lttng-libust-2.13.1       | NOK | http://autobuild.buildroot.net/results/3d5c10658a314ca594275db83a605020148e5c05 |     
   mips64    |      lua-cqueues-20200726      | NOK | http://autobuild.buildroot.net/results/d4c559c30554d20142fc586b7cb35d3183a3b9d4 |     
    arc      |         minizip-3.0.5          | NOK | http://autobuild.buildroot.net/results/aea11a65df5c85be2c96dd3e39b993772e6094c8 |     
 powerpc64   |         minizip-3.0.5          | NOK | http://autobuild.buildroot.net/results/619b1d77cfac43b38191c72a04226c7a76d72ba6 |     
   x86_64    |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/6bc93302acf3acbf20a49fecb0bed0fa5d2b9db8 |     
  mips64el   |         netdata-1.33.1         | NOK | http://autobuild.buildroot.net/results/ed763ef50060a8e7c25543a5584fd0af821c2921 |     
    m68k     |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/c7d52b39d147c1c57616cfcc137bd74b8ec22677 | ORPH
 powerpc64   |       ocf-linux-20120127       | NOK | http://autobuild.buildroot.net/results/4f04f04c42ddf20588087f6d8d37288a9324f67e | ORPH
  riscv32    |        open62541-v1.2.2        | NOK | http://autobuild.buildroot.net/results/9965f067fbf9db3015853ef6a20006451de0149e | ORPH
   arceb     |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/7e398bc3f8f8d0d72f0bcf0aea52692b24aaaac7 |     
microblazeel |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/4999d000a32a73312027e2fad0458d47dcc75e57 |     
  mips64el   |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/07f70a1d30fb805133aa2d94425d251345b79a35 |     
   arceb     |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/a0aa33c29f3c6814ff00a30926a5852c8b0d9f95 |     
    arm      |        php-apcu-5.1.20         | NOK | http://autobuild.buildroot.net/results/314405423aeece5ee55d76ec5c4fa1919e7ee853 |     
    sh4a     |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/053a32ffa4d1afe425df54e02e645960e24af0d8 |     
  riscv32    | polkit-a2bf5c9c83b6ae46cbd5... | NOK | http://autobuild.buildroot.net/results/9700cbc1b5b5ef83812f1a118ee0a9e094c07e40 |     
  sparc64    | polkit-a2bf5c9c83b6ae46cbd5... | NOK | http://autobuild.buildroot.net/results/e26b2d71e977bb81fff1dbc9b1866de92eb83eb9 |     
   x86_64    | polkit-a2bf5c9c83b6ae46cbd5... | NOK | http://autobuild.buildroot.net/results/bcec68de150231932a4f746bb56676e6d2e58023 |     
  mips64el   | polkit-a2bf5c9c83b6ae46cbd5... | NOK | http://autobuild.buildroot.net/results/9ffb1fbd1b47f7b04947f32e2e9e2b49925bc517 |     
  sparc64    | polkit-a2bf5c9c83b6ae46cbd5... | NOK | http://autobuild.buildroot.net/results/d03cc419e3cee31daf2777caaa9360158ed2aa95 |     
    i686     | polkit-a2bf5c9c83b6ae46cbd5... | NOK | http://autobuild.buildroot.net/results/3c35f226807938c3c16c9f143c11a2907b0453df |     
  mips64el   |           pppd-2.4.9           | NOK | http://autobuild.buildroot.net/results/662b2e881e86749d53dc438862b9b21a7c6b9dec | ORPH
  powerpc    |        pure-ftpd-1.0.50        | NOK | http://autobuild.buildroot.net/results/de9b3f12b72d1c9d0a4d4eed19d62a92fa33b590 |     
 microblaze  |         python3-3.10.2         | NOK | http://autobuild.buildroot.net/results/62045cd671ee531708504fb164e1a515cc32b4e3 |     
   sparc     |       qpid-proton-0.35.0       | NOK | http://autobuild.buildroot.net/results/4db3225b8e54e88dd9894ee509056892e1db2590 |     
 powerpc64   |       qpid-proton-0.35.0       | NOK | http://autobuild.buildroot.net/results/dbeec86b11a04a3d1c010daaafe3da7f226a905a |     
    mips     |       qpid-proton-0.35.0       | NOK | http://autobuild.buildroot.net/results/364b121e4747b2b87ba051a0abec9bbf179a7aa8 |     
 aarch64_be  |       qpid-proton-0.35.0       | NOK | http://autobuild.buildroot.net/results/1aac3330793c6e9f666301ce5c1efde6ad046e36 |     
   mipsel    |       qpid-proton-0.35.0       | NOK | http://autobuild.buildroot.net/results/fa0989d136a7fc7a3c159eba0025cdcea29f32cc |     
    arc      |       qpid-proton-0.35.0       | NOK | http://autobuild.buildroot.net/results/cebc2aa1d07770a2f21277d825369fd4cf68224e |     
   mipsel    |       qpid-proton-0.35.0       | NOK | http://autobuild.buildroot.net/results/f747136099e7e8cac03a4ad9896eca6e88f9f943 |     
   sparc     | qt5base-f31e001a9399e4e6208... | NOK | http://autobuild.buildroot.net/results/1009a6ea6ce2d9d9e449bbf661bb6bbf9f29ff2a |     
 microblaze  |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/593d0ce6c59af6ee3ab1dcc2b2ff8ec12651dbbf |     
   mipsel    |           refpolicy            | NOK | http://autobuild.buildroot.net/results/020f4aa5ba2145d0a565076866537d8800ec1dc9 |     
   sparc     |           refpolicy            | NOK | http://autobuild.buildroot.net/results/40e6cd85c28083df249ce2e7c44a681ff8066c86 |     
    mips     |           refpolicy            | NOK | http://autobuild.buildroot.net/results/1def9f82004bf80a67d37c8d60b3c8a0e5741431 |     
 powerpc64   | rtl8188eu-60cb0b5a3cfc95e3f... | NOK | http://autobuild.buildroot.net/results/f240d60abaced6079f9fef61d43b8d7805e7696d |     
    mips     |    shadowsocks-libev-3.3.5     | NOK | http://autobuild.buildroot.net/results/2c53d57cec08b8ff7d153b6b57938666f0b8340a |     
  mips64el   |           shim-15.4            | NOK | http://autobuild.buildroot.net/results/6e098d7997c8a448338ed1f2f8ef38737ffc26c0 |     
    arm      |          snmppp-3.4.9          | NOK | http://autobuild.buildroot.net/results/e9fe0e379074640733d9be25804e870eca3ec38e |     
   sparc     |          snort-2.9.19          | NOK | http://autobuild.buildroot.net/results/eb3e8f25c07edb61f4ebf5cdb61b9f1687abc988 |     
    arm      |         tinifier-3.4.0         | NOK | http://autobuild.buildroot.net/results/3e902f4e812d8daf8264910ace46c323d8c86440 |     
   sh4aeb    |   toolchain-external-bootlin   | NOK | http://autobuild.buildroot.net/results/669fed347afcefd7a4d47d279aa1f2b04858307a |     
  sparc64    |   toolchain-external-bootlin   | NOK | http://autobuild.buildroot.net/results/5daabafd8f39e893b2f6e85464bff1950a98816a |     
   mips64    |   toolchain-external-bootlin   | NOK | http://autobuild.buildroot.net/results/0204453c44621049bb353974f915e9fb69de7e71 |     
  riscv32    |   toolchain-external-bootlin   | NOK | http://autobuild.buildroot.net/results/c9ecc29adbd4fa3e961f37ca7378a9e4af443f9d |     
   sh4aeb    |   toolchain-external-bootlin   | NOK | http://autobuild.buildroot.net/results/3e5d8a2a391acb1992e3ccabad62f2749c6939a2 |     
  aarch64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/5ecd8ce9ae9bc5fed276b474591d3ed3bb15b2a4 | ORPH
  aarch64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/e0e669e836100aab8ac08cb1cdf358d5cd2c87c3 | ORPH
   armeb     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/2091d1f6237965d30dd338de9362c005d31b9633 | ORPH
  aarch64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/8725a618939044f6511f66b436837e4bf771355b | ORPH
  riscv64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/ac882fb2a2e233a9bc7eb50a45bf3a279c597923 | ORPH
  riscv64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/ae0373a6b893b6f3b1284253e9409129a7841ca2 | ORPH
 aarch64_be  | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/ba8d0e359ed8b1d2de702e87646f093538b5d9b2 | ORPH
   mipsel    | toolchain-external-codescap... | NOK | http://autobuild.buildroot.net/results/ca22a2bb0e9a055cd30949d53c70f2d8a59014c5 | ORPH
   x86_64    |          trinity-1.9           | NOK | http://autobuild.buildroot.net/results/7b01c85342262cc074ab81d568e5835c8203d254 | ORPH
  nds32le    |           ttyd-1.6.3           | NOK | http://autobuild.buildroot.net/results/1363fe54a318923b5923bed805bc3fe3d9846e1e |     
  sparc64    |           ttyd-1.6.3           | NOK | http://autobuild.buildroot.net/results/0681f5bd8cbba7f4c19f8f434fa24a49dc865ef6 |     
    arc      |           ttyd-1.6.3           | NOK | http://autobuild.buildroot.net/results/bd17bff0ea2201aee24f183a9ddf1e3d9dea4cfe |     
microblazeel |           ttyd-1.6.3           | NOK | http://autobuild.buildroot.net/results/8ab1eb19034b7e2dfe183a5d8541acbd442284f4 |     
    arc      |           ttyd-1.6.3           | NOK | http://autobuild.buildroot.net/results/ebb344addd807e986395b305265479200570536d |     
    arm      |           ttyd-1.6.3           | NOK | http://autobuild.buildroot.net/results/5c5a7ce70971672edc76781c15b1383b87118616 |     
  mips64el   |           ttyd-1.6.3           | NOK | http://autobuild.buildroot.net/results/eef53c48136007d083f90a9c97ac608204cdbe92 |     
  aarch64    | tvheadend-1295dd2be863f5beb... | NOK | http://autobuild.buildroot.net/results/2f0cc1b7bb0ac601c4db46d16a98d17cbf21f73e |     
    arm      | tvheadend-1295dd2be863f5beb... | NOK | http://autobuild.buildroot.net/results/3fc4fd6d05c77a3fb5afa43952ff6d1c6be99bd3 |     
  mips64el   | tvheadend-1295dd2be863f5beb... | NOK | http://autobuild.buildroot.net/results/065b60fa241b9a13bad8dffc03293da0368d472d |     
microblazeel | tvheadend-1295dd2be863f5beb... | NOK | http://autobuild.buildroot.net/results/69116f28d637c6618460f7b35ddf5b20b3fee2d7 |     
    or1k     | tvheadend-1295dd2be863f5beb... | NOK | http://autobuild.buildroot.net/results/0dcff9f788b40e5aff84d0bf6218237d60b12783 |     
    arc      | tvheadend-1295dd2be863f5beb... | NOK | http://autobuild.buildroot.net/results/2d8550bc534bfdd6c93844953f3a5428efc2d148 |     
  aarch64    | tvheadend-1295dd2be863f5beb... | NOK | http://autobuild.buildroot.net/results/2caf9eb09f9eecf9351434a218293746424087d7 |     
   nios2     | tvheadend-1295dd2be863f5beb... | NOK | http://autobuild.buildroot.net/results/17c8f7f9bdfca85d64a6326dd9d782d5bb98dc94 |     
  riscv64    | tvheadend-1295dd2be863f5beb... | NOK | http://autobuild.buildroot.net/results/f4b7f3fae2344c2a76867a018716ff70c94a478e |     
    arc      |      uboot-tools-2021.07       | NOK | http://autobuild.buildroot.net/results/b992b4eee1928c7e0dacc4b26232541f6fca2cfb |     
  powerpc    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/fcada650a67b48cc076ff3ef75e0c00a005c356a |     
    arm      |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/0e74dd819a12311416207e654d1b002e1c2939e2 |     
    arc      |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/22cbe91b76777911dcce906c21dcba65274aec0c |     
  powerpc    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/4442ced0bc1d5158347637fd0f7cd83dd21dcc27 |     
  riscv64    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/edaa9fd41006a56bd247c0a224576d5919a58dd3 |     
   xtensa    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/a42a6b31bc5c3587697dbd34ba0a7523e72004e0 |     
   xtensa    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/259e5b22b57672637c8f21cd6845c2075119809d |     
   xtensa    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/00b1a58e86508266b723950979053d688dacefcc |     
  powerpc    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/d5970b559b913fe4a6635cce9d040df419bae586 |     
    arm      |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/0f88932232fcdb3e60d635b0599a062fb28ceddc |     
  powerpc    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/d7d2f1fa0b7129e4d5ae0c414d02aa9dacda2d45 |     
  powerpc    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/68640da363ef0a8d50861afb66090b0838760d39 |     
  riscv64    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/ba03b7ec7fc43837be7eb9ee25f9a2f009227568 |     
  mips64el   | uclibc-ng-test-0844445e7358... | NOK | http://autobuild.buildroot.net/results/5fa18e45169e31358644a53049ca47134b512948 |     
   mipsel    |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/0fe69aae7bbc10aa41c0011b66c2ae15287cdc9e |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/9bd8583388afc12f7a4842e8dbe287de15834fe9 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/b02073efe248005ac4b301075331d4df01413499 |     
powerpc64le  |        util-linux-2.38         | NOK | http://autobuild.buildroot.net/results/be6ab985d9049c06936677611d17a80ba5fdc66a | ORPH
    arm      |        util-linux-2.38         | NOK | http://autobuild.buildroot.net/results/d4ade609701de1d9bdcc537465c99c1d5310fe3b | ORPH
  aarch64    |        util-linux-2.38         | NOK | http://autobuild.buildroot.net/results/7376172bb4778b9e68443aaf02c3a7736266098c | ORPH
    arm      |        util-linux-2.38         | NOK | http://autobuild.buildroot.net/results/9a7cfe8ad4a707ce71752321664ca9e26114aa88 | ORPH
    i586     |        util-linux-2.38         | NOK | http://autobuild.buildroot.net/results/1ebb3c6db96cafdc25e6cb882bef2efc7401d6eb | ORPH
  aarch64    |        util-linux-2.38         | NOK | http://autobuild.buildroot.net/results/1ffa12ca5e19a00adebff13d00055a689737f945 | ORPH
   mipsel    |        util-linux-2.38         | NOK | http://autobuild.buildroot.net/results/598dca369ecad471b85d0e516a956145e58b2367 | ORPH
    i586     |        util-linux-2.38         | NOK | http://autobuild.buildroot.net/results/e69419924e2a8c64ecdfa18929893c2b6d74d8ff | ORPH
   mipsel    |        util-linux-2.38         | NOK | http://autobuild.buildroot.net/results/705934df2fa283bdb0f60fe0225470844a23883e | ORPH
   sparc     |        util-linux-2.38         | NOK | http://autobuild.buildroot.net/results/c58915bed4247aa1e5fdcdace4b6b5f3b1d6f578 | ORPH
    arm      |        util-linux-2.38         | NOK | http://autobuild.buildroot.net/results/8a7a706d3cc3f11c7e1814fe5c13d8154efd5c36 | ORPH
  powerpc    |        util-linux-2.38         | NOK | http://autobuild.buildroot.net/results/0813a7d795a6888023fd10ea44481fc13515a466 | ORPH
    or1k     |        util-linux-2.38         | NOK | http://autobuild.buildroot.net/results/fbd3de6035bcdd671f277f2478ef28f2feeecb14 | ORPH
    arm      |        util-linux-2.38         | NOK | http://autobuild.buildroot.net/results/4a09673600ed7039c39dd5ccbe12838626dc96d5 | ORPH
    sh4      |        util-linux-2.38         | NOK | http://autobuild.buildroot.net/results/23a53081077a58c17a46ab992a360a23304154e7 | ORPH
    sh4      |        util-linux-2.38         | NOK | http://autobuild.buildroot.net/results/e5d6e671ad2459ac06209eaa84e3f82fa3fed4a0 | ORPH
    i586     |        util-linux-2.38         | NOK | http://autobuild.buildroot.net/results/4b23c9b094cea03672378ed24a4debf2f3ea18d0 | ORPH
powerpc64le  |           vlc-3.0.16           | NOK | http://autobuild.buildroot.net/results/2329d38542570aaeff987f382aa6a599f2419d19 |     
  riscv32    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/0832b1eeb7129c9a391a79806eda9642dbfdfa03 |     
  mips64el   |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/cda93bd090b6cbe9e2e45a95fa90c9801063e191 |     
  powerpc    |      wpa_supplicant-2.10       | NOK | http://autobuild.buildroot.net/results/2c4143e1d32e2c5efa59238f376c53e0074dab7a |     
  sparc64    | xr819-xradio-16180b6308e3c5... | NOK | http://autobuild.buildroot.net/results/7ad4a4b6b1612460427e667d98efc6df7b4a2153 |     
   x86_64    |          xvisor-0.3.1          | NOK | http://autobuild.buildroot.net/results/0ec0c3cf0f991a76bda8392c9620de7b404d9ced |     
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/bae6fce05676cc71753de0aee7ade00eea5ab8f0 | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/ef71f071d200e9391fe6236107109f7a800979bb | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/b937f5fe6d932d103a852146b5aed144b647f4f5 | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/cb7eb258a77e2e1a475510a1db1b2617c24af465 | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/88430a11c19f397b235de9b7e9092b04322d8cd4 | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/e7540124a920cc095e8c33339da66448f56cc8ce | ORPH


Classification of failures by reason for 2022.02.x
--------------------------------------------------

                  exempi-2.6.1 | 1 
                       frr-8.1 | 1 
              host-bison-3.8.2 | 1 
             host-pahole-v1.23 | 1 
                mongodb-4.2.18 | 1 
                 opencv4-4.5.5 | 1 
                       unknown | 1 


Detail of failures for 2022.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |          exempi-2.6.1          | NOK | http://autobuild.buildroot.net/results/99ccafbab6b71836880f55cdd4a39990aedd6091 |     
  mips64el   |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/078b2b29ea9d4c1fba6d6c25a93598b72285a1b2 |     
  riscv64    |        host-bison-3.8.2        | NOK | http://autobuild.buildroot.net/results/574630199671a01ac5a0bc7dabdc00eac4665e48 | ORPH
microblazeel |       host-pahole-v1.23        | NOK | http://autobuild.buildroot.net/results/07a5a07b5d96dd3fb11b771231959d9b02ec212e |     
    arm      |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/83f27580f2e25c1516eae48ccc0acc82d06d4844 |     
   mipsel    |         opencv4-4.5.5          | NOK | http://autobuild.buildroot.net/results/d94cd7f7d241d6a1d79e9e49e39e3bee70bc1b93 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/89aeb2c0e844abff558af84cfdfbdce2ffc95f92 |     


Gitlab CI results for 2022-04-14
================================


-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
