Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5E41C433EF
	for <buildroot@archiver.kernel.org>; Wed, 13 Apr 2022 04:38:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4ACE5812F0;
	Wed, 13 Apr 2022 04:38:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2pFs8zBDLCMD; Wed, 13 Apr 2022 04:38:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BEE4A8316F;
	Wed, 13 Apr 2022 04:38:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8F01F1BF3EE
 for <buildroot@lists.busybox.net>; Wed, 13 Apr 2022 04:38:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 677214067C
 for <buildroot@lists.busybox.net>; Wed, 13 Apr 2022 04:38:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1_KlSPAt1pp3 for <buildroot@lists.busybox.net>;
 Wed, 13 Apr 2022 04:38:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B3AEF40438
 for <buildroot@buildroot.org>; Wed, 13 Apr 2022 04:38:22 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 949E7240007
 for <buildroot@buildroot.org>; Wed, 13 Apr 2022 04:38:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1649824696; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Z7vzd4+/mEhfHc3gRu/r20zz+vzDQllddqBe038cK3A=;
 b=WUkDkavqXWUQUMF2Tl0CfIpTazWpt5EXRJiAtyA5Tcryq7hM2P0TyATLrBIpOiNGkHUKy5
 h1fSG3jI2N9FpEx7HWoUcd5MH1T3Cy62S81n4pkDNjo2DXqxLTY7Vb/47SXzdgVrk6+Zie
 pppAT1Z3U+07E3FWubJZ5gHXTB39pG4Wd6CkLazdmUK4rHPvpsf3HOL1T3XnTcHEpFyWRo
 oci1l/sodIQ7gbQ3BOq5lveYYFrAJwMCubrOSZDCDi7y5PLKx6idbaCgJU/0aosVZEwjLn
 lNMGxHFJAQ8/vH6QdTa6SfSs+ahv6wE4zktoQFDtabU3cW4329JEMezKfVeyAw==
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Wed, 13 Apr 2022 04:38:16 -0000
Message-Id: <20220413043826.677214067C@smtp4.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-04-12
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

Autobuild statistics for 2022-04-12
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  | 29  |  8  |  0  | 37  |
    master   | 186 | 425 |  0  | 611 |

Classification of failures by reason for master
-----------------------------------------------

          host-util-linux-2.38 | 43
            host-binutils-2.32 | 42
                 dhcp-4.4.2-P1 | 20
         host-gcc-final-10.3.0 | 18
toolchain-external-bootlin-... | 15
                 uclibc-1.0.40 | 15
                    git-2.31.1 | 13
host-elf2flt-7e33f28df198c4... | 12
           argp-standalone-1.3 | 11
             libopenssl-1.1.1n | 10
tvheadend-1295dd2be863f5beb... | 10
                python3-3.10.2 | 9 
                 linux-5.15.33 | 7 
              fetchmail-6.4.29 | 6 
glibc-2.34-109-gd64b08d5ba7... | 6 
                 minizip-3.0.5 | 6 
    toolchain-external-bootlin | 6 
               aircrack-ng-1.6 | 5 
                host-go-1.17.8 | 5 
   linux-headers-5.10.104-cip3 | 5 
polkit-a2bf5c9c83b6ae46cbd5... | 5 
               util-linux-2.38 | 5 
                     frr-8.2.2 | 4 
fs/f2fs/f2fs.mk:64: /home/a... | 4 
            qpid-proton-0.35.0 | 4 
                 zlib-ng-2.0.6 | 4 
               arptables-0.0.5 | 3 
                    azmq-1.0.3 | 3 
              bubblewrap-0.6.1 | 3 
                 dash-0.5.11.5 | 3 
         host-gcc-final-11.2.0 | 3 
          host-gcc-final-9.4.0 | 3 
              libgcrypt-1.10.0 | 3 
                libkrb5-1.18.4 | 3 
               libsigsegv-2.13 | 3 
                  netsurf-3.10 | 3 
                   perl-5.34.1 | 3 
       shadowsocks-libev-3.3.5 | 3 
                    bat-0.19.0 | 2 
                  botan-2.19.1 | 2 
                    brltty-6.4 | 2 
                  cc-tool-0.27 | 2 
fs/ext2/ext2.mk:65: /nvmeda... | 2 
  gobject-introspection-1.70.0 | 2 
       host-gcc-initial-10.3.0 | 2 
              host-rust-1.58.1 | 2 
                   i2pd-2.40.0 | 2 
              keepalived-2.2.7 | 2 
              libeXosip2-5.3.0 | 2 
               libglib2-2.70.4 | 2 
                  libnspr-4.33 | 2 
linux-headers-5.10.104-cip3... | 2 
         linux-headers-5.15.33 | 2 
                  ntp-4.2.8p15 | 2 
                 pixman-0.40.0 | 2 
                       unknown | 2 
                 wavemon-0.9.4 | 2 
                xenomai-custom | 2 
                acpitool-0.5.1 | 1 
                alsa-lib-1.2.6 | 1 
                     aufs-util | 1 
azure-iot-sdk-c-LTS_01_2022... | 1 
             batman-adv-2021.4 | 1 
             berkeleydb-5.3.28 | 1 
                bpftool-v6.7.0 | 1 
                clamav-0.103.5 | 1 
                   expat-2.4.7 | 1 
                      fastd-22 | 1 
                  ffmpeg-4.4.1 | 1 
fs/ext2/ext2.mk:65: /home/a... | 1 
fs/ext2/ext2.mk:65: /home/a... | 1 
fs/ext2/ext2.mk:65: /nvmeda... | 1 
fs/ext2/ext2.mk:65: /nvmeda... | 1 
fs/ext2/ext2.mk:65: /nvmeda... | 1 
fs/ext2/ext2.mk:65: /nvmeda... | 1 
fs/f2fs/f2fs.mk:64: /home/a... | 1 
fs/f2fs/f2fs.mk:64: /nvmeda... | 1 
fs/f2fs/f2fs.mk:64: /nvmeda... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /nvme... | 1 
fs/ubifs/ubifs.mk:49: /nvme... | 1 
                ipmiutil-3.1.8 | 1 
                  jack2-1.9.20 | 1 
                  janet-1.19.2 | 1 
              jpeg-turbo-2.1.3 | 1 
               libcap-ng-0.8.3 | 1 
                   libnss-3.77 | 1 
               liboping-1.10.0 | 1 
                libressl-3.4.3 | 1 
              libsodium-1.0.18 | 1 
              libudfread-1.1.2 | 1 
           libwebsockets-4.3.1 | 1 
                   linux-tools | 1 
            lttng-tools-2.13.2 | 1 
               mariadb-10.3.34 | 1 
                    musl-1.2.2 | 1 
                  mxs-bootlets | 1 
                netdata-1.33.1 | 1 
            ocf-linux-20120127 | 1 
               openblas-0.3.20 | 1 
                openobex-1.7.2 | 1 
                paxtest-0.9.15 | 1 
                   poco-1.11.1 | 1 
                    pppd-2.4.9 | 1 
           python-pybind-2.9.0 | 1 
      qt5webkit-5.212.0-alpha4 | 1 
                     refpolicy | 1 
ripgrep-af6b6c543b224d348a8... | 1 
rtl8723bu-19b4bdc05483a1e79... | 1 
                    ruby-3.1.0 | 1 
      startup-notification-0.9 | 1 
              strongswan-5.9.5 | 1 
                   uacme-1.7.1 | 1 
                    vde2-2.3.2 | 1 
                    vlc-3.0.16 | 1 
                       xenomai | 1 
                  zabbix-5.4.9 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |         acpitool-0.5.1         | NOK | http://autobuild.buildroot.net/results/dff8195616d2614a333a486a2270e8feb409361c |     
   x86_64    |        aircrack-ng-1.6         | NOK | http://autobuild.buildroot.net/results/f69cd40ad74e6ba4e82ff99354ad93d060c56f11 |     
    i586     |        aircrack-ng-1.6         | NOK | http://autobuild.buildroot.net/results/c6566aa019ce0d5a39a36f58665a164fded761a1 |     
    m68k     |        aircrack-ng-1.6         | NOK | http://autobuild.buildroot.net/results/0792132a7ecea0a57891fe9462b4e0e7cddc99a0 |     
microblazeel |        aircrack-ng-1.6         | NOK | http://autobuild.buildroot.net/results/9de9a02261f86197d8e1a81101573552e65603da |     
powerpc64le  |        aircrack-ng-1.6         | NOK | http://autobuild.buildroot.net/results/dc02a5aabc159e964d122cc47dceabbc522afea6 |     
    or1k     |         alsa-lib-1.2.6         | NOK | http://autobuild.buildroot.net/results/7e189a6918b28d36c143716eee7f4c9986a5cb14 |     
   x86_64    |      argp-standalone-1.3       | NOK | http://autobuild.buildroot.net/results/ee216df64436edbc51e26e78393071a58f7ba0fe |     
   xtensa    |      argp-standalone-1.3       | NOK | http://autobuild.buildroot.net/results/82574010039dc2c78c20d68e99e08e890d897e13 |     
   mipsel    |      argp-standalone-1.3       | NOK | http://autobuild.buildroot.net/results/10d78751dcc72c0af1abf5198f239fbd334d54d2 |     
    mips     |      argp-standalone-1.3       | NOK | http://autobuild.buildroot.net/results/ad0071f849c546d54462046c118f359cb42fb39f |     
    m68k     |      argp-standalone-1.3       | NOK | http://autobuild.buildroot.net/results/b7326d166e3cc137fbd64611f5f937cdcebf69f3 |     
microblazeel |      argp-standalone-1.3       | NOK | http://autobuild.buildroot.net/results/0caefa14cca2e01dafdae957432cd5a2d0323517 |     
    or1k     |      argp-standalone-1.3       | NOK | http://autobuild.buildroot.net/results/241bdddb99991d89d4a469ebaddb843a589aa13f |     
    or1k     |      argp-standalone-1.3       | NOK | http://autobuild.buildroot.net/results/5904f3842669909dff7ffed31574808f7fa10548 |     
   mips64    |      argp-standalone-1.3       | NOK | http://autobuild.buildroot.net/results/67c83604335a2d629335693923f583de29c26588 |     
   mips64    |      argp-standalone-1.3       | NOK | http://autobuild.buildroot.net/results/45d4921d27d618a150722ba730e170d1b26b9ac4 |     
   mips64    |      argp-standalone-1.3       | NOK | http://autobuild.buildroot.net/results/2b40f81da82a182edb44c5d0998120f16e63be81 |     
  sparc64    |        arptables-0.0.5         | NOK | http://autobuild.buildroot.net/results/2b0d2af97bf8254604bbb16f03c390acbd9f5f27 | ORPH
 powerpc64   |        arptables-0.0.5         | NOK | http://autobuild.buildroot.net/results/e1a1d2c6ee72e7089c89d16dc2f8ef3dfb045cf0 | ORPH
 microblaze  |        arptables-0.0.5         | NOK | http://autobuild.buildroot.net/results/c979488541939653fa90ea7aa79a8a95d48922a3 | ORPH
 powerpc64   |           aufs-util            | NOK | http://autobuild.buildroot.net/results/e3412735ce71278374740c2a4b2940b19d544ee8 |     
  sparc64    |           azmq-1.0.3           | NOK | http://autobuild.buildroot.net/results/91786cb5076d758921da44ae7c3b557e0e705401 |     
   s390x     |           azmq-1.0.3           | NOK | http://autobuild.buildroot.net/results/e120441051b43c803239affbf3e42247acc25fc0 |     
    i686     |           azmq-1.0.3           | NOK | http://autobuild.buildroot.net/results/f3015a9df6a29fb76d0ea09f38bbffdf7d25894d |     
   mipsel    | azure-iot-sdk-c-LTS_01_2022... | NOK | http://autobuild.buildroot.net/results/e137aec65c352c7c0066ea6e2a5a3bf0e07b62b7 |     
    i686     |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/1609d27964b8b29d10722e4da46c4b8686ffc654 |     
    arm      |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/b447c122ce1c9660da4c75acc8fcd4c213996d18 |     
   xtensa    |       batman-adv-2021.4        | NOK | http://autobuild.buildroot.net/results/92a772502eb5a43510df27d0907a9d55f97c51ab |     
   sh4eb     |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/315978ff1ce460ac368d61d0ca1074d1aa3a484d | ORPH
  mips64el   |          botan-2.19.1          | NOK | http://autobuild.buildroot.net/results/c657ba2a6c1f0259d0e398f1587bbc00ccd9c805 | ORPH
   armeb     |          botan-2.19.1          | NOK | http://autobuild.buildroot.net/results/fa2256d69672f7a85fb308a4787195a79c238a64 | ORPH
   sparc     |         bpftool-v6.7.0         | NOK | http://autobuild.buildroot.net/results/919b8351d3783ca30a860df87ae814d5c4b9fd41 |     
   mipsel    |           brltty-6.4           | NOK | http://autobuild.buildroot.net/results/6936064186d5f361aa417e51c304d23d83ce3540 |     
   mipsel    |           brltty-6.4           | NOK | http://autobuild.buildroot.net/results/3dc2737a06daaadbc71b37dccfb3353e0f1f184c |     
   mipsel    |        bubblewrap-0.6.1        | NOK | http://autobuild.buildroot.net/results/3173bec71488d24b91e1ba5686f0581e5b3f5505 |     
   mipsel    |        bubblewrap-0.6.1        | NOK | http://autobuild.buildroot.net/results/4f35d0e1264aa2d926acbae368f591e6b27547e8 |     
  mips64el   |        bubblewrap-0.6.1        | NOK | http://autobuild.buildroot.net/results/da6a3a22a3f8b99d54647e02a8f486837ff64cce |     
  aarch64    |          cc-tool-0.27          | NOK | http://autobuild.buildroot.net/results/7f9b479d295ba22874f2251932c44aaeb116f045 |     
   mipsel    |          cc-tool-0.27          | NOK | http://autobuild.buildroot.net/results/a62f5cae376fa3e8fab2ce9c40aa52466db6af09 |     
   nios2     |         clamav-0.103.5         | NOK | http://autobuild.buildroot.net/results/36a751d33493d88afdb8ffe9eeff01a791e2413e |     
  mips64el   |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/ef73c879b2d4ddd2c9d61631c1c1587459fb7bf7 | ORPH
  riscv32    |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/502f468b0419d81f819bdaefbdebeaa9c2ebef7a | ORPH
   mipsel    |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/b1887c7bae6cf2dc16b65c4cf0ef94c14ff747ef | ORPH
    arc      |         dhcp-4.4.2-P1          | NOK | http://autobuild.buildroot.net/results/9a813e20c83a757ecf3e78b49c108a43eb2485e6 | ORPH
   x86_64    |         dhcp-4.4.2-P1          | NOK | http://autobuild.buildroot.net/results/22af43dacd931dec848430b77add1370e0112831 | ORPH
 powerpc64   |         dhcp-4.4.2-P1          | NOK | http://autobuild.buildroot.net/results/84d41ddd0e7cb5e780bf8e1922fda2e64a0fc871 | ORPH
    i586     |         dhcp-4.4.2-P1          | NOK | http://autobuild.buildroot.net/results/922d3c6842e09866654ea71dd5a1945faaa3167a | ORPH
   sparc     |         dhcp-4.4.2-P1          | NOK | http://autobuild.buildroot.net/results/fdf601a18f22ea9b3dc49522c3bfd8b42beea1c1 | ORPH
   mips64    |         dhcp-4.4.2-P1          | NOK | http://autobuild.buildroot.net/results/9c7555e1ece55cbcc03ad3ef3edae4964f1eeda8 | ORPH
   sparc     |         dhcp-4.4.2-P1          | NOK | http://autobuild.buildroot.net/results/132559e8e47360b92dbfc549de97d49a1d1aff6e | ORPH
powerpc64le  |         dhcp-4.4.2-P1          | NOK | http://autobuild.buildroot.net/results/22a589ba4be615e0530809200ce73b9ca1ef6bd3 | ORPH
    mips     |         dhcp-4.4.2-P1          | NOK | http://autobuild.buildroot.net/results/c5ac82fce5ac4c8b0957b009ec41a7791076c6a1 | ORPH
 microblaze  |         dhcp-4.4.2-P1          | NOK | http://autobuild.buildroot.net/results/ded47439e48d410d811f4f1bc2e89fda90770888 | ORPH
   sparc     |         dhcp-4.4.2-P1          | NOK | http://autobuild.buildroot.net/results/cd3f19f05167ff8aa8e269cb12e20f0d746cea15 | ORPH
    arc      |         dhcp-4.4.2-P1          | NOK | http://autobuild.buildroot.net/results/4a4b2a45094f8137edf798021aa2374928baf17a | ORPH
   s390x     |         dhcp-4.4.2-P1          | NOK | http://autobuild.buildroot.net/results/dd4b9838f82d60147272205a30ade1e4ef707779 | ORPH
  mips64el   |         dhcp-4.4.2-P1          | NOK | http://autobuild.buildroot.net/results/357911c1dc3dc832c99a19ff7c102105056d8986 | ORPH
  powerpc    |         dhcp-4.4.2-P1          | NOK | http://autobuild.buildroot.net/results/a7dc22257b83c0e2ddf0b2910a66916218011391 | ORPH
    arc      |         dhcp-4.4.2-P1          | NOK | http://autobuild.buildroot.net/results/97ea21ac7acaf24901fda64a147695630c3ceef0 | ORPH
   x86_64    |         dhcp-4.4.2-P1          | NOK | http://autobuild.buildroot.net/results/c64de9c519cea0e66776db484d0ec328b3c07106 | ORPH
    arc      |         dhcp-4.4.2-P1          | NOK | http://autobuild.buildroot.net/results/9df1e83be7609851dc8f1be7850da9b01f76f0fc | ORPH
   arceb     |         dhcp-4.4.2-P1          | NOK | http://autobuild.buildroot.net/results/ce74a297fcbe8f6bff112c4c90c921381a6a812c | ORPH
   sparc     |         dhcp-4.4.2-P1          | NOK | http://autobuild.buildroot.net/results/e4d027b5bcda852d0b5a54035de5ed37499a4ef0 | ORPH
  riscv64    |          expat-2.4.7           | NOK | http://autobuild.buildroot.net/results/54651886f966cdf100e35871171957c240e1ce39 |     
    or1k     |            fastd-22            | NOK | http://autobuild.buildroot.net/results/5db55c090c44bbf5ab614aa69064f753196e40ae |     
   mips64    |        fetchmail-6.4.29        | NOK | http://autobuild.buildroot.net/results/88bf797004bd45705c576129cec1752505119004 |     
  mips64el   |        fetchmail-6.4.29        | NOK | http://autobuild.buildroot.net/results/00344e4b2a193fc306c09ac9d701175f384080b9 |     
 aarch64_be  |        fetchmail-6.4.29        | NOK | http://autobuild.buildroot.net/results/d1d8a1539a272b4a30e83a6d77ef8ed89b517225 |     
    i686     |        fetchmail-6.4.29        | NOK | http://autobuild.buildroot.net/results/8952ef5fc51370bce5643e693c8db50309110856 |     
    i686     |        fetchmail-6.4.29        | NOK | http://autobuild.buildroot.net/results/7bc3c90607bd461603965b8f90bfc70cd414ae19 |     
    mips     |        fetchmail-6.4.29        | NOK | http://autobuild.buildroot.net/results/436d6a03f61da29e173b1cb156d7f34a3b66ed77 |     
    arm      |          ffmpeg-4.4.1          | NOK | http://autobuild.buildroot.net/results/6b804a676d01116b173b64081d587040bf28b31d |     
  mips64el   |           frr-8.2.2            | NOK | http://autobuild.buildroot.net/results/d28963a115c5e3517ccb2eda10b34ef65efc16d0 |     
  mips64el   |           frr-8.2.2            | NOK | http://autobuild.buildroot.net/results/d587087bedb3473264bb635530db829721f9ad82 |     
    arc      |           frr-8.2.2            | NOK | http://autobuild.buildroot.net/results/992ac2c7555b9b6c6c452150b8ca3dcbb9494693 |     
   xtensa    |           frr-8.2.2            | NOK | http://autobuild.buildroot.net/results/36595c25335403b19cdd3b8d3b7bcc56dc2924a6 |     
   s390x     | fs/ext2/ext2.mk:65: /home/a... | NOK | http://autobuild.buildroot.net/results/513ebbe66d498731355040f50e01e1cad8ddb9a5 |     
microblazeel | fs/ext2/ext2.mk:65: /home/a... | NOK | http://autobuild.buildroot.net/results/2d679eec0ea8e2237640591ec150df0a5d644a23 |     
    arc      | fs/ext2/ext2.mk:65: /nvmeda... | NOK | http://autobuild.buildroot.net/results/5c8acbdefa9013375e555466f8b903cfbafad552 |     
    mips     | fs/ext2/ext2.mk:65: /nvmeda... | NOK | http://autobuild.buildroot.net/results/9ff9392fb8adf6745807dd13dba051dfebe0582e |     
  sparc64    | fs/ext2/ext2.mk:65: /nvmeda... | NOK | http://autobuild.buildroot.net/results/2de316a53d42123fa7c6ac6b87d753b352913fbd |     
   mipsel    | fs/ext2/ext2.mk:65: /nvmeda... | NOK | http://autobuild.buildroot.net/results/fb67ef4a2787d62f67a9016501398547de314a44 |     
   s390x     | fs/ext2/ext2.mk:65: /nvmeda... | NOK | http://autobuild.buildroot.net/results/8e61d9696bb84a86feae3202a6e2e3a2451ed33e |     
   s390x     | fs/ext2/ext2.mk:65: /nvmeda... | NOK | http://autobuild.buildroot.net/results/50fa9129486c90807fb69df635e512ac77b556b4 |     
   mips64    | fs/f2fs/f2fs.mk:64: /home/a... | NOK | http://autobuild.buildroot.net/results/0d8b7f1cecbf2289b0a6a6256f06d044d296bc47 |     
 powerpc64   | fs/f2fs/f2fs.mk:64: /home/a... | NOK | http://autobuild.buildroot.net/results/ebcc45985686998330e9060f183e17f47bed8be2 |     
 microblaze  | fs/f2fs/f2fs.mk:64: /home/a... | NOK | http://autobuild.buildroot.net/results/a2673e2abdd2c07fc0e3ec03e0b14e4c5fe1150e |     
   arceb     | fs/f2fs/f2fs.mk:64: /home/a... | NOK | http://autobuild.buildroot.net/results/d0bfa26355324003c24310cd77c9b2fbff0ffc3a |     
   xtensa    | fs/f2fs/f2fs.mk:64: /home/a... | NOK | http://autobuild.buildroot.net/results/e45c30fa2032b09cb1c7c3fd1450db9aa9689612 |     
    arc      | fs/f2fs/f2fs.mk:64: /nvmeda... | NOK | http://autobuild.buildroot.net/results/b94f573fc392824e23ef6e263d9aef6deabd5075 |     
  mips64el   | fs/f2fs/f2fs.mk:64: /nvmeda... | NOK | http://autobuild.buildroot.net/results/4d47104f3ce31263c91d5e811034860776300d6f |     
    mips     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/434fe7e12b85ef389f29234cf1f47b63b98749d7 |     
  sparc64    | fs/ubifs/ubifs.mk:49: /nvme... | NOK | http://autobuild.buildroot.net/results/f9554311438f5eda71007b96fc5d0a90d5f21d23 |     
   s390x     | fs/ubifs/ubifs.mk:49: /nvme... | NOK | http://autobuild.buildroot.net/results/414094c0161c7082c286dd502083534eb834a5ff |     
    mips     |           git-2.31.1           | NOK | http://autobuild.buildroot.net/results/09815885d89e15a98d14a7f20bee77315ca07f6f |     
   xtensa    |           git-2.31.1           | NOK | http://autobuild.buildroot.net/results/1926887e506768db16ef3c40d120fe7bae3d8a91 |     
   mipsel    |           git-2.31.1           | NOK | http://autobuild.buildroot.net/results/21917f91f31a8c0835938caa8f1401722224bb48 |     
    or1k     |           git-2.31.1           | NOK | http://autobuild.buildroot.net/results/6204fdba2f9b46f1d414a6f5b3d7af2b8fcfadba |     
   mips64    |           git-2.31.1           | NOK | http://autobuild.buildroot.net/results/2a7be3eb7f01b01f9c26ab978f1eaab9792334e5 |     
   sparc     |           git-2.31.1           | NOK | http://autobuild.buildroot.net/results/d3590ce58c2309a7bdb832792894c992d4c7ad59 |     
microblazeel |           git-2.31.1           | NOK | http://autobuild.buildroot.net/results/3e23a3a049995e753f25f88b792db23fe42d23e4 |     
   sparc     |           git-2.31.1           | NOK | http://autobuild.buildroot.net/results/ac3c68c066c8f97b4ac7e34ef847d334a5d14631 |     
 aarch64_be  |           git-2.31.1           | NOK | http://autobuild.buildroot.net/results/be852f63cfbc7e1a2286312be00bf48d78837e8d |     
 microblaze  |           git-2.31.1           | NOK | http://autobuild.buildroot.net/results/e978d96dad52cfb5afd359125c7b04631cce446c |     
   mipsel    |           git-2.31.1           | NOK | http://autobuild.buildroot.net/results/3ae1fc3d89c0d8fbb7bb42afa4e5088eb8bda0fb |     
   xtensa    |           git-2.31.1           | NOK | http://autobuild.buildroot.net/results/1ee548c98c86ca0674b2f4ccfa82250e9a5a5db0 |     
 microblaze  |           git-2.31.1           | NOK | http://autobuild.buildroot.net/results/685b980875ba4cb87babee7bff1a78e214b7ec46 |     
   nios2     | glibc-2.34-109-gd64b08d5ba7... | NOK | http://autobuild.buildroot.net/results/e7e8c90f18cdf52b74bee6989d6f3ac3980c99cc |     
powerpc64le  | glibc-2.34-109-gd64b08d5ba7... | NOK | http://autobuild.buildroot.net/results/6da116d23d6ae5f218659f270ca61f0fe96aa80b |     
  riscv32    | glibc-2.34-109-gd64b08d5ba7... | NOK | http://autobuild.buildroot.net/results/94a7c51887749e48cb7e1b48c7b06c079dc83778 |     
  riscv32    | glibc-2.34-109-gd64b08d5ba7... | NOK | http://autobuild.buildroot.net/results/b3b5f1256963473b640b65471e166ebd6a683d60 |     
 microblaze  | glibc-2.34-109-gd64b08d5ba7... | NOK | http://autobuild.buildroot.net/results/dbcbe07b452e67db6d0a41c816d9cba990949f19 |     
    i686     | glibc-2.34-109-gd64b08d5ba7... | NOK | http://autobuild.buildroot.net/results/5b11d72e463d795ee262d365ef9c4ce41c529631 |     
    i686     |  gobject-introspection-1.70.0  | NOK | http://autobuild.buildroot.net/results/00f390976990e40f6285221434693af5f5bd05b6 | ORPH
   s390x     |  gobject-introspection-1.70.0  | NOK | http://autobuild.buildroot.net/results/53f8b3f0bd138a6b1cf9d166f92fdb23ccb8ba9f | ORPH
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/1fff3101034ee0d7247dffff38ef20907b2966fc |     
    sh4      |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/1952ef64d4f780dfaf2b259405c93e80af0d27ee |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/56e0b27891c6a1227706d1e04eccba0cdffde453 |     
    sh4      |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/f93c78bac4edb1417facf3f6fb7aa0e9161e1437 |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/43f3987a4c2b75bd453e7039d0ff77137dc088d8 |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/a3da58d9874fbdc38396b4d07a6aa50405eab71a |     
 aarch64_be  |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/fefc900988f23724fad9e6b06aa726e211f6ccfb |     
   sh4eb     |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/00e430fac4f41937ce277534177b8c828be95a36 |     
 aarch64_be  |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/09a6dcdf989f3497f10245de5433cfe69a264df0 |     
    sh4      |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/1108e98cfcaf2e8bb80b604c821a26fe42d6a8d3 |     
 aarch64_be  |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/f3fda972990469d01ffc22a11510c7ce511d5219 |     
   sh4aeb    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/2f695d7438160e575d5cb672cfe8be2b687524b7 |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/e814514d813874789a4416079f9a692b1c24ff61 |     
    sh4      |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/bd2c5845aa8a673fe4fbd712e1c1851bb84dd104 |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/7544cec55964af8095a8e2297045ab6ddd82906a |     
    sh4      |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/1d88770515eca75ef7c3ec1c9beabc0b5f847a42 |     
 aarch64_be  |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/887618a7e086de45293b26dde4db34d8734e20c6 |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/fb53ad3b969a8929f101cab1fc97a90a7fb94024 |     
 aarch64_be  |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/a9b20631c1a8beecf18b592f476993600ca75f39 |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/268f0a5ec506d83f45a2026bfbbb58b476712d1c |     
    sh4a     |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/975e9fa5b17a06f9bd0206b43fa3ca5d0249843b |     
 aarch64_be  |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/d39c66a3ce27002db6cb2507007a12b766aac9eb |     
   sh4aeb    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/1ac9a6c7eeedcbd3ff363518a237a40a0ea82c20 |     
   sh4eb     |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/ddcf93ebf1f6bffe0a523782a097b6a78f7c7f36 |     
   sh4aeb    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/3ce4bd0138726feddb053f8f2aa7723c974c3ced |     
 aarch64_be  |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/0b7f259e393410e0573f96d8149f3f9a4220bd0f |     
 aarch64_be  |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/34d16496fe0952e982eae866552481231b145fd7 |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/12061cae72e3c01f5b006dddaaa597b53fad6c63 |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/4153b3d8fc1f5f954bac8ccb1bc3a37fd56f8dad |     
 aarch64_be  |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/af14fa958a0886c604559b8ce1e83b05d21ebc24 |     
 aarch64_be  |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/696a3c135f20bda052a8d7a2b55e9bcb248c8bfb |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/c4f0f8633cd2f58644f27236ff6be99228b798f4 |     
    sh4a     |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/04ead7ab7875948ad51b076c21b7b5f480fcd44c |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/e1660ef723809df79566b42e38b8900f2649c10a |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/bf38a12aa7c1942b5eab19a966987f836c04d5d5 |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/34ad670b0d7869f874b5d51b03e924bb7cf0d552 |     
   sh4eb     |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/e7941f1630aba9954aefcd154827c0a29e253f2c |     
   sh4eb     |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/4458a08c9e3d98124a1dbeb272a979cbfe80c521 |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/c1942b653fddc1501c84cf7c9672e23aef32d951 |     
   sh4aeb    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/77e6dbfc260e32cc3e2a5d653bde3cfff51c8219 |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/b7e93b73e425a1cbb83e0689720bac3091476fda |     
    sh2a     |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/936b2be2dae892122f8932471f0c44a74f2270fb |     
   armeb     | host-elf2flt-7e33f28df198c4... | NOK | http://autobuild.buildroot.net/results/f31a688625d284abc3d163c80c2d05b41101822d | ORPH
   armeb     | host-elf2flt-7e33f28df198c4... | NOK | http://autobuild.buildroot.net/results/f36b3f028291888f789dfaf7a78924a5b146a336 | ORPH
   armeb     | host-elf2flt-7e33f28df198c4... | NOK | http://autobuild.buildroot.net/results/9fee541009d341d62c811cb86d003888a790b098 | ORPH
   armeb     | host-elf2flt-7e33f28df198c4... | NOK | http://autobuild.buildroot.net/results/a394538b41168b6b68e1c9c352e0ee32373f0801 | ORPH
   armeb     | host-elf2flt-7e33f28df198c4... | NOK | http://autobuild.buildroot.net/results/3a10baa0e4c2c88c9a8c32ee88272b3aa1463d9c | ORPH
   armeb     | host-elf2flt-7e33f28df198c4... | NOK | http://autobuild.buildroot.net/results/cce550957ca0df2bc43260fbcf5422e2176197cf | ORPH
   armeb     | host-elf2flt-7e33f28df198c4... | NOK | http://autobuild.buildroot.net/results/e3be338114a4f7a61791c70ba7edbf71fbc353e4 | ORPH
   armeb     | host-elf2flt-7e33f28df198c4... | NOK | http://autobuild.buildroot.net/results/105b22d30baabf7db1170891a4301b63e1255a76 | ORPH
   armeb     | host-elf2flt-7e33f28df198c4... | NOK | http://autobuild.buildroot.net/results/a89661c480db0d8c40956bff2c130e9a5b0faec0 | ORPH
   armeb     | host-elf2flt-7e33f28df198c4... | NOK | http://autobuild.buildroot.net/results/c9358adbe4420daa33bf0016e6dd790b9dc4b4f9 | ORPH
   armeb     | host-elf2flt-7e33f28df198c4... | NOK | http://autobuild.buildroot.net/results/e33a2f55f045dbfdb30106fb76e5e1ffc104b126 | ORPH
   armeb     | host-elf2flt-7e33f28df198c4... | NOK | http://autobuild.buildroot.net/results/be270547a8c17726e2527c3220e12bd7fb9e97bf | ORPH
  sparc64    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/7be0c0dd6ca4d4fe3503d6e6362aea18642b80fd |     
   x86_64    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/0c0be25dfef8c1d559f088b49473602f5f92434b |     
powerpc64le  |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/118cd3c1186134c3920dff201bf081a3583eb3ba |     
  sparc64    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/d27c1c1aedc9e0acf16e5561ac5af91e2306625f |     
 powerpc64   |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/d9a752d14e2dd69949329e6f70b710eba5c0ee93 |     
  riscv32    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/ba00ead641914f3bb6f5158f210c085476ded5d4 |     
 powerpc64   |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/b607e0b7d9580dac021b339933808fef16e6c778 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/1e28744b23b3378235e7117adf6eac41ab332502 |     
   nios2     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/372fa4d151fffba7c7d7cc7e34c2d31cb503e3fb |     
  sparc64    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/e823d28c8dd726941a82327eb3775b17845334ea |     
  powerpc    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/275090697fad6f774a742bbd1b9511c79e3bf594 |     
   nios2     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/8c4fa0ec5c02940e958331f32ecfb4f815028474 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/efc3245a63163220662b882255c7fdba13758791 |     
  sparc64    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/d06ecacdeca4fa39f39a0516c01e1e4c99048c4a |     
  sparc64    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/685688a3eb776f979d517d3c9bbfb30bd4190685 |     
  sparc64    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/89d2fb7126d0049baf0b9010f96793ba3485ade1 |     
 powerpc64   |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/7f3f6caaab590a03ebcd3055fa7cb48cfbb032df |     
   nios2     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/00ac03ef5fd165b34f68f01835a4baaec5a10d97 |     
  sparc64    |     host-gcc-final-11.2.0      | NOK | http://autobuild.buildroot.net/results/67c54efccafd3ffc57ed665002f4bf4451377e1c |     
powerpc64le  |     host-gcc-final-11.2.0      | NOK | http://autobuild.buildroot.net/results/27f3d86b32071799b9c2e7d997bb4c17115b385f |     
 powerpc64   |     host-gcc-final-11.2.0      | NOK | http://autobuild.buildroot.net/results/659f83cac1719f6220ff92b1c894acbb2287a219 |     
   s390x     |      host-gcc-final-9.4.0      | NOK | http://autobuild.buildroot.net/results/9953b94f5f47efff4669a661868cb876d7cb0334 |     
   nios2     |      host-gcc-final-9.4.0      | NOK | http://autobuild.buildroot.net/results/934e088381b6b8f6baf44c9631d56650e67fb168 |     
  sparc64    |      host-gcc-final-9.4.0      | NOK | http://autobuild.buildroot.net/results/db7cd1fda1b51b0e1c0805b02f9f0b7629a7f894 |     
    arm      |    host-gcc-initial-10.3.0     | NOK | http://autobuild.buildroot.net/results/099f1b4df4b7b9a93c10a84d85c170a4d2598717 |     
    i686     |    host-gcc-initial-10.3.0     | NOK | http://autobuild.buildroot.net/results/b9936b5c375f8fb61ad0f415bd2088142f3f5b22 |     
   mips64    |         host-go-1.17.8         | NOK | http://autobuild.buildroot.net/results/f4090f9a6b2736f8a2ae819de714daee5907acc8 |     
  mips64el   |         host-go-1.17.8         | NOK | http://autobuild.buildroot.net/results/62cad535eea618fa503f7406d3fd284ef8f67619 |     
    i686     |         host-go-1.17.8         | NOK | http://autobuild.buildroot.net/results/5ef1c1eb7a5c5c196bfe120259707b40be4c30ba |     
    i686     |         host-go-1.17.8         | NOK | http://autobuild.buildroot.net/results/5fe70baca4784a523310623fda54e02fc10cd298 |     
    i686     |         host-go-1.17.8         | NOK | http://autobuild.buildroot.net/results/5076060f64f204560d9461ff2957c0e1c79aba90 |     
   mipsel    |        host-rust-1.58.1        | NOK | http://autobuild.buildroot.net/results/5242ad0004a8ab14d2cdffec1d36243644f2c6e9 |     
    mips     |        host-rust-1.58.1        | NOK | http://autobuild.buildroot.net/results/98ca677f37bb6888e9784a99db2a0668f29ac06d |     
microblazeel |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/67d28928752ac807c58ae991e6f0d3581bb0ccdf | ORPH
  riscv64    |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/51a2faa0c708c0f70e048f89dd0ad06c56c682a8 | ORPH
    arm      |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/27a05526e86b60703b5553d0ce6aeec2674250e6 | ORPH
   nios2     |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/c883ce44ed7a453ec1dd5e62572eb07e5740ebba | ORPH
    arc      |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/e1ed5a5cb9bd9176d585d73d0d56de56e2117dd4 | ORPH
  aarch64    |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/bb5d2b179200e2d34944382938036326938501e3 | ORPH
  powerpc    |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/3bf6e6d58642bcf623d4e344a0e9bea9a5d7cb8f | ORPH
   xtensa    |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/b7ac79618cef463b8784a967d723f7e608d34573 | ORPH
    arm      |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/351c6c95b8d7bd952ac4cb085da77ea3e407b836 | ORPH
   mipsel    |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/7a7792502f446dc98040d8a148e2861c6e25909a | ORPH
  mips64el   |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/2f2a68591f1da70c3f30ffeb91cf2f571a1c3ce4 | ORPH
   mipsel    |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/eceb0d5e5060869357419a853824952aa2efab30 | ORPH
  aarch64    |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/9bd6f0c29f439f181524cb82344baf104b8770b0 | ORPH
   nios2     |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/6191172007a03848d5ab78b98865f4d90cfa9b7b | ORPH
  mips64el   |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/cb058466afcdda6845f8b311d8df3ea9c16ae9de | ORPH
    arm      |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/5aa72334ccc5e4e9c4ab5e2dfc5848ec43a0ef89 | ORPH
    i586     |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/2f7bce38e842cdabf18ef374edc0818bd1c105b6 | ORPH
  riscv64    |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/62210bc878a66e1377e21ad6f73daf382b2c3fed | ORPH
  powerpc    |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/26f687f7f512cff1fde01b7a8b47c8451e0c4cc8 | ORPH
  aarch64    |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/aced476c0286bfaa705645a13f1325835d906d23 | ORPH
    arm      |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/56e425668976ec71f3990a02f1ef138bbc00c49f | ORPH
microblazeel |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/2e72513d516f04f46bd19ce07e503147eacc5748 | ORPH
  mips64el   |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/e5a8bf19c586cb225f5c844eff3047f0ef4804c9 | ORPH
    arm      |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/52115d759b9255982f1c5b9b7822ce8dc36fb6a7 | ORPH
    arc      |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/87b545a33ca94834e8e74d1cfe9e1b4cf5803bc2 | ORPH
  mips64el   |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/525031049889f460ac2145f37a07bdacfa20086c | ORPH
    i686     |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/09dbecf1b82d78d5c7461521f13133871a23ec72 | ORPH
microblazeel |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/b40e2a0dad7a20843eabdd5d59547c7a932039b3 | ORPH
  aarch64    |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/88a200d66a8c6e666c10bbeda46f08ea2389f625 | ORPH
   mipsel    |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/bfcd0143ae2f13e2d7fb25375e27abbda7e9cad7 | ORPH
    mips     |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/7905532fb607a4b3bb0d846e5c12ee7d1406c5a8 | ORPH
    arm      |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/d489ab2f3a7f80fbbcd4c902f18eb2177dc375ef | ORPH
    arm      |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/10d8813a1223e6cad050fbaf93322c03dc1afa05 | ORPH
    i686     |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/f7671e522f1fac855d062a84ab0867f4f8762348 | ORPH
    arm      |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/9385d20f540b9550667e1fa0e3524b8bb28c87c6 | ORPH
   mipsel    |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/0893b0564a862a68a3af8734dd6c45c5d59e71aa | ORPH
  riscv64    |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/e717e5e851b1eeb9e3f6b78d5d3e6e0052afb698 | ORPH
    arm      |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/8dc5a74a718c87e8335a95053705f3ce141bc7e7 | ORPH
    arm      |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/7087bffab858ffe4674e22129788bd73947b3987 | ORPH
  mips64el   |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/3a74e41bdebc08eb0f423ad57fa2c9e881773799 | ORPH
    arm      |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/1df739f7366105c2e6d05455da76135e08eee22b | ORPH
   mipsel    |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/0da37a8fd1c94c69bd747d1250aad277b867b78b | ORPH
  riscv64    |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/4fc6e003b73f99bc5f6a1f1534e9b6bef0df9ff5 | ORPH
   mips64    |          i2pd-2.40.0           | NOK | http://autobuild.buildroot.net/results/38820266cb8e02446ecc917b954fa353b947b188 |     
   mipsel    |          i2pd-2.40.0           | NOK | http://autobuild.buildroot.net/results/17e6c5bf8513e0c791e0716aba1baf8e8f0e5530 |     
   x86_64    |         ipmiutil-3.1.8         | NOK | http://autobuild.buildroot.net/results/e657ea2df00371c1ea4f1624dfcc7706ae2ecc74 |     
    m68k     |          jack2-1.9.20          | NOK | http://autobuild.buildroot.net/results/fe0f6645467f45003efca5b4a010750eb270dce4 |     
 microblaze  |          janet-1.19.2          | NOK | http://autobuild.buildroot.net/results/7377ed33a761957fd71c479000e678a7339498d2 |     
    or1k     |        jpeg-turbo-2.1.3        | NOK | http://autobuild.buildroot.net/results/3cae458a95c7c962001689605fc2f8017677dda2 |     
   mips64    |        keepalived-2.2.7        | NOK | http://autobuild.buildroot.net/results/4bd64076d9ca14c35b2589af1d6ce75e20b1e9d7 |     
   s390x     |        keepalived-2.2.7        | NOK | http://autobuild.buildroot.net/results/76f72a3c7350ea265e2277c89d68e5256410e94c |     
    or1k     |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/09b4ca93aa265cc1919a6d69df37cbd12463471c |     
microblazeel |        libeXosip2-5.3.0        | NOK | http://autobuild.buildroot.net/results/36f8ca13ceb565736c1183e865219e002e56302d |     
    m68k     |        libeXosip2-5.3.0        | NOK | http://autobuild.buildroot.net/results/842054a4e259f99171143e6263ef97e99916aa2c |     
 powerpc64   |        libgcrypt-1.10.0        | NOK | http://autobuild.buildroot.net/results/1d837a195e9681efb97501ca2c356602b652f80a | ORPH
    i686     |        libgcrypt-1.10.0        | NOK | http://autobuild.buildroot.net/results/b9abe02f3e52202b316ace4f6a0e5c6efde32392 | ORPH
    i586     |        libgcrypt-1.10.0        | NOK | http://autobuild.buildroot.net/results/c5e3e073c0c4f0b9763f151e9e1625ce2d42dc0d | ORPH
   arceb     |        libglib2-2.70.4         | NOK | http://autobuild.buildroot.net/results/a0680def518a17d77c30a7a030e4fc875ca17b36 |     
    arc      |        libglib2-2.70.4         | NOK | http://autobuild.buildroot.net/results/bbc938b253fc86cd2c0fec0f08bbf7258c15a4b9 |     
  sparc64    |         libkrb5-1.18.4         | NOK | http://autobuild.buildroot.net/results/7e69c950abc9f55292ba96fcb3fcfefed14992d6 |     
 powerpc64   |         libkrb5-1.18.4         | NOK | http://autobuild.buildroot.net/results/a95bf80abe798d6de70f337d022fffd28cc6a2b5 |     
   xtensa    |         libkrb5-1.18.4         | NOK | http://autobuild.buildroot.net/results/f07f47ed39c8dae1f36832dd13f9a1019c78b66f |     
   mipsel    |          libnspr-4.33          | NOK | http://autobuild.buildroot.net/results/377c258824786df429e04422593682e0af1adbf7 |     
   mipsel    |          libnspr-4.33          | NOK | http://autobuild.buildroot.net/results/06a2f200acb290ebddd0768fc82b1a7d48e90dc2 |     
 powerpc64   |          libnss-3.77           | NOK | http://autobuild.buildroot.net/results/fdaf25392997384a913c76e30e9fc8fd8c3a9370 |     
    arc      |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/fb2bf74b18de8660beeb3053267e41cf0bf2bf43 |     
    arm      |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/281f5726d4813d7d9b2423d3b01ee84cab1972ba |     
microblazeel |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/ca661151321447462d312865ba2fdb48ee3ebdd9 |     
    m68k     |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/78de37adf2fa7fcd0f1d47e4d797b84f17ec5690 |     
    arc      |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/c87d875f1fce1e5b16075db0a363bf3b0323da9c |     
    m68k     |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/aa70274e2c51405fc698426268c50ee7a832a44a |     
   xtensa    |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/227b2a89ddda03fbf99f4de19bf12a2a5ea9f855 |     
 microblaze  |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/933dae89e06b3fa86f44b90a097afcd4027045a7 |     
   sparc     |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/9665e2ef559405f4c1fed929bf3cad25c0303fa6 |     
    m68k     |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/8cbe07891050adcebecc0a8391be08bd65c051e9 |     
    mips     |        liboping-1.10.0         | NOK | http://autobuild.buildroot.net/results/31083354e9064b2deef86917d67e92a88af0fa46 |     
   sparc     |         libressl-3.4.3         | NOK | http://autobuild.buildroot.net/results/b7ada328d8287287b197d5239a28fdcd924da1b3 | ORPH
    or1k     |        libsigsegv-2.13         | NOK | http://autobuild.buildroot.net/results/bbafec2c8691c2390de5ecaf3c2b1441b641a884 |     
    or1k     |        libsigsegv-2.13         | NOK | http://autobuild.buildroot.net/results/fa9782b6ac4436f176fa75bc5c77ec4b7670fc8e |     
    or1k     |        libsigsegv-2.13         | NOK | http://autobuild.buildroot.net/results/bb00fa19b9c8348571362cd0873333c739b772b5 |     
   arceb     |        libsodium-1.0.18        | NOK | http://autobuild.buildroot.net/results/96c0c1f2af1b04f9e4d6c9b40c847a5e4f14351e |     
    m68k     |        libudfread-1.1.2        | NOK | http://autobuild.buildroot.net/results/f76d475f49d525095ac0054224b50b9e612691d6 |     
    arm      |      libwebsockets-4.3.1       | NOK | http://autobuild.buildroot.net/results/f9631db632211e610b8a146e22bffda0ffb8fa28 |     
powerpc64le  |         linux-5.15.33          | NOK | http://autobuild.buildroot.net/results/3aa329c3b066b7bc463abdda27fa7f0c5d24a2ad | ORPH
  mips64el   |         linux-5.15.33          | NOK | http://autobuild.buildroot.net/results/d9d225e129741f86ae53913e1657dcf3ec562484 | ORPH
  powerpc    |         linux-5.15.33          | NOK | http://autobuild.buildroot.net/results/14a9c9cdfad68ae172c3826a431d32ec4bdde83c | ORPH
    arm      |         linux-5.15.33          | NOK | http://autobuild.buildroot.net/results/6d8610c30d4bfdc7abb627d848c0a1da89de2321 | ORPH
    mips     |         linux-5.15.33          | NOK | http://autobuild.buildroot.net/results/449e9f244d909bbffec8546591e330754959d2b0 | ORPH
  powerpc    |         linux-5.15.33          | NOK | http://autobuild.buildroot.net/results/badc182621a0e560361e21be567095475d020af6 | ORPH
   mips64    |         linux-5.15.33          | NOK | http://autobuild.buildroot.net/results/2c3f2cde631d31dc359e3e47d937ad9a922cf7a6 | ORPH
    or1k     |  linux-headers-5.10.104-cip3   | NOK | http://autobuild.buildroot.net/results/946db5476ccd5f68905523959c190d3cd63c94af | ORPH
microblazeel |  linux-headers-5.10.104-cip3   | NOK | http://autobuild.buildroot.net/results/01ebc0a1c8e82bd8845ec0f9cf9faf092fd54fc4 | ORPH
   xtensa    |  linux-headers-5.10.104-cip3   | NOK | http://autobuild.buildroot.net/results/bdf7e8ac1237893f8a921cf369309f6382d2a71c | ORPH
    i686     |  linux-headers-5.10.104-cip3   | NOK | http://autobuild.buildroot.net/results/7f64043704017f866ef697c9454db33c78576ddf | ORPH
  riscv64    |  linux-headers-5.10.104-cip3   | NOK | http://autobuild.buildroot.net/results/87ef32624f723af35f435feb7565755e1866ae1c | ORPH
   sparc     | linux-headers-5.10.104-cip3... | NOK | http://autobuild.buildroot.net/results/8902f160c2ce92f7e67f8c7138754ae00ad0c409 | ORPH
 microblaze  | linux-headers-5.10.104-cip3... | NOK | http://autobuild.buildroot.net/results/7597142f578c753a7b0e3c45f16e6a7ce7a7d9d4 | ORPH
   x86_64    |     linux-headers-5.15.33      | NOK | http://autobuild.buildroot.net/results/442d1bfcb3cc2e14b0da218fd3c33532d60601a1 | ORPH
  riscv64    |     linux-headers-5.15.33      | NOK | http://autobuild.buildroot.net/results/34a30fbb68882a9f4d77d84fcfcb421a7e76ba80 | ORPH
    arm      |          linux-tools           | NOK | http://autobuild.buildroot.net/results/16f41b9169bd76352c2f2ed8c6239ad371b3a30e | ORPH
   mipsel    |       lttng-tools-2.13.2       | NOK | http://autobuild.buildroot.net/results/65417866eb7ac6872d0b19eeeb35c5378337b72d |     
   sparc     |        mariadb-10.3.34         | NOK | http://autobuild.buildroot.net/results/2e429ff591971ce03c02a3f81d7bf240f443dbda | ORPH
  sparc64    |         minizip-3.0.5          | NOK | http://autobuild.buildroot.net/results/40a5fff3194989cebd4042815d80bca1772fcf1b |     
  powerpc    |         minizip-3.0.5          | NOK | http://autobuild.buildroot.net/results/e1d9e2f903d60d5536bba1405c0ec6354f26b950 |     
   mipsel    |         minizip-3.0.5          | NOK | http://autobuild.buildroot.net/results/13213519bdd65c83bc5fea7756db0f319ea8476f |     
   s390x     |         minizip-3.0.5          | NOK | http://autobuild.buildroot.net/results/9a4cbd8169aea86ee20575a49a4cd6b46865fa57 |     
   nios2     |         minizip-3.0.5          | NOK | http://autobuild.buildroot.net/results/62c10ff121bbbcc44a91c497e2bd9539b50c46d4 |     
powerpc64le  |         minizip-3.0.5          | NOK | http://autobuild.buildroot.net/results/49a6239092ffed06d48c9d8b939ccf202ffe765a |     
  powerpc    |           musl-1.2.2           | NOK | http://autobuild.buildroot.net/results/3420f8dce309db97669de5bdededebc17cc0f15e |     
    arm      |          mxs-bootlets          | NOK | http://autobuild.buildroot.net/results/0d2a5442c4135bc07db6442a7d213916ed062e2f |     
   mips64    |         netdata-1.33.1         | NOK | http://autobuild.buildroot.net/results/9d511664f960a5e1348de55beed839975d9d40bc |     
   mipsel    |          netsurf-3.10          | NOK | http://autobuild.buildroot.net/results/3adf24c2d559a66b257e74dec8d1d4cd96d4be90 |     
   sparc     |          netsurf-3.10          | NOK | http://autobuild.buildroot.net/results/ecff11966dfc8abb405c6fab4bf32c93a6f470de |     
    mips     |          netsurf-3.10          | NOK | http://autobuild.buildroot.net/results/fcefa9a8a4339bbc85ab13fb5a99b4f7a8bb4dcc |     
    m68k     |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/efb84cee7c166865d67ff3cacbd1dd5776210a6b | ORPH
  riscv64    |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/42cf8275336cccf0ca2973746c4affdc5402de90 | ORPH
 powerpc64   |       ocf-linux-20120127       | NOK | http://autobuild.buildroot.net/results/4735b9040346c4206dafd43703c862fa70d9100d | ORPH
  mips64el   |        openblas-0.3.20         | NOK | http://autobuild.buildroot.net/results/8ed921af696352c8247e4ee317bca0121916fb64 | ORPH
   sparc     |         openobex-1.7.2         | NOK | http://autobuild.buildroot.net/results/52b0edc4278f65fb4a9671b65c655cc4544a3103 |     
 microblaze  |         paxtest-0.9.15         | NOK | http://autobuild.buildroot.net/results/63b3aa2d37e02f1d162e49cd4e6f17ee479a6ec9 |     
   x86_64    |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/ce1eaa7099b9cc5d3463a7afe7a260a7070ec580 |     
  mips64el   |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/dec1a64d0079f141be0e9fa2c60c8b0388a8b147 |     
  mips64el   |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/f4570ef95f4f4ff59a0bd75146c29e59a5c97df9 |     
   mipsel    |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/90b8d94cd614656755f500e4646e889aa0fec768 |     
   mipsel    |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/5852e253afbfe74fa99096360c69fb49e532620d |     
   sparc     |          poco-1.11.1           | NOK | http://autobuild.buildroot.net/results/06c44508d1448c9c19674aeae52e80f85b9988e2 |     
   xtensa    | polkit-a2bf5c9c83b6ae46cbd5... | NOK | http://autobuild.buildroot.net/results/94a4ba02485d04072c5a5a63790be0f8bb790827 |     
   nios2     | polkit-a2bf5c9c83b6ae46cbd5... | NOK | http://autobuild.buildroot.net/results/41582e6cd65729de02b2ad15727c81d02b53dd23 |     
   s390x     | polkit-a2bf5c9c83b6ae46cbd5... | NOK | http://autobuild.buildroot.net/results/4406af669973c8d70d0cd1f68c5d9b5fb312ee90 |     
powerpc64le  | polkit-a2bf5c9c83b6ae46cbd5... | NOK | http://autobuild.buildroot.net/results/138b17e8f81bf18d31f37643e2d3d987783af489 |     
  sparc64    | polkit-a2bf5c9c83b6ae46cbd5... | NOK | http://autobuild.buildroot.net/results/9470ab167e458498bdabf0b756f8b184b3b250d9 |     
   nios2     |           pppd-2.4.9           | NOK | http://autobuild.buildroot.net/results/d849561e33fc0770bbe97d88e8877e60a972f47e | ORPH
 microblaze  |      python-pybind-2.9.0       | NOK | http://autobuild.buildroot.net/results/13c99d908dc317ee8a98e39923717edab3831344 |     
microblazeel |         python3-3.10.2         | NOK | http://autobuild.buildroot.net/results/3e61e0e66c771fedad2530218ef10baff4b10012 |     
  powerpc    |         python3-3.10.2         | NOK | http://autobuild.buildroot.net/results/e436608b19333e25a170811f431931cd0e7b2860 |     
   x86_64    |         python3-3.10.2         | NOK | http://autobuild.buildroot.net/results/9d97a683855dda8ad31ceba1738079d93ef869ff |     
    i686     |         python3-3.10.2         | NOK | http://autobuild.buildroot.net/results/d22327f2f3b9f85610e3b92761312d86998332c8 |     
   nios2     |         python3-3.10.2         | NOK | http://autobuild.buildroot.net/results/e83a30bc48d81eebec5cb9149913b50be9a1d9db |     
    mips     |         python3-3.10.2         | NOK | http://autobuild.buildroot.net/results/526f0ceedd2a3a1545508deab94ba929fd0e945a |     
    mips     |         python3-3.10.2         | NOK | http://autobuild.buildroot.net/results/e18aa3ca2aff1d0e06079f85a416157a65713aa4 |     
powerpc64le  |         python3-3.10.2         | NOK | http://autobuild.buildroot.net/results/3b80719c73ebde17b42208c3f921a7b507550ce8 |     
  sparc64    |         python3-3.10.2         | NOK | http://autobuild.buildroot.net/results/b44220e05b7f82013c5448cd98663d1129023a16 |     
    m68k     |       qpid-proton-0.35.0       | NOK | http://autobuild.buildroot.net/results/47727661caaff658d5b7adac814be87145e7ce33 |     
  riscv32    |       qpid-proton-0.35.0       | NOK | http://autobuild.buildroot.net/results/c72035ef014b996d4b9a929de919252ac883a807 |     
powerpc64le  |       qpid-proton-0.35.0       | NOK | http://autobuild.buildroot.net/results/efbc1ba5c9fb5887ee2a5e4c18b85b14954031b9 |     
   sparc     |       qpid-proton-0.35.0       | NOK | http://autobuild.buildroot.net/results/409e51b36817a7a2ef18c362fcba317c8aaf34ca |     
   mipsel    |    qt5webkit-5.212.0-alpha4    | NOK | http://autobuild.buildroot.net/results/17ba6dc7b57bb0de4c9ee687ae48ee4ae67b82f2 |     
    arm      |           refpolicy            | NOK | http://autobuild.buildroot.net/results/c0aa583f074dc9039421392ec1cc49115bdcf735 |     
    mips     | ripgrep-af6b6c543b224d348a8... | NOK | http://autobuild.buildroot.net/results/01ec9f9d90527820798313ed8f378d4137b1e4f3 |     
   sparc     | rtl8723bu-19b4bdc05483a1e79... | NOK | http://autobuild.buildroot.net/results/1a3921b15b2c7f2194f45728228d36ccef054e73 |     
    m68k     |           ruby-3.1.0           | NOK | http://autobuild.buildroot.net/results/5a95b83bc9e644a8c5990f4965b8ae4e1e529d03 |     
  aarch64    |    shadowsocks-libev-3.3.5     | NOK | http://autobuild.buildroot.net/results/af8ad4649558268e8953b05468f984e7cae937cf |     
   mipsel    |    shadowsocks-libev-3.3.5     | NOK | http://autobuild.buildroot.net/results/77164f44d2ff20be8e17ddef1d9aa4373cf65db4 |     
   nios2     |    shadowsocks-libev-3.3.5     | NOK | http://autobuild.buildroot.net/results/7f0447fbb77f349e5554734ca82e7d6b2f5faba9 |     
  riscv32    |    startup-notification-0.9    | NOK | http://autobuild.buildroot.net/results/2e6ecf95f5d8c9bd2fea380b2aae4e58e339e8dc | ORPH
  mips64el   |        strongswan-5.9.5        | NOK | http://autobuild.buildroot.net/results/c9efeeb992c7d36d6d3658f36a07feaf6cc173cf |     
   mips64    |   toolchain-external-bootlin   | NOK | http://autobuild.buildroot.net/results/c24849ded8a3ce7b7ba040daca075e8c7bda99c9 |     
   nios2     |   toolchain-external-bootlin   | NOK | http://autobuild.buildroot.net/results/735377bf78cfac3df6f0e95ecb769a288f09411a |     
   nios2     |   toolchain-external-bootlin   | NOK | http://autobuild.buildroot.net/results/f4315275767c18f8bb0cff53ed5b61ca714d2456 |     
  sparc64    |   toolchain-external-bootlin   | NOK | http://autobuild.buildroot.net/results/059a6b43e853e08ea50bd8d62567debb52514390 |     
   mips64    |   toolchain-external-bootlin   | NOK | http://autobuild.buildroot.net/results/5343600a92bc4a038716c5bcb06c1b4af5cca105 |     
   s390x     |   toolchain-external-bootlin   | NOK | http://autobuild.buildroot.net/results/5b1aafb49ab683f81063203f8ce4f5f5ca349c3b |     
  aarch64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/2e46f04c454fdf95953983f0f132fdf1c363fc0a | ORPH
 aarch64_be  | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/67437057263a021d38e02fc4b92f7bb0f89f2a46 | ORPH
  aarch64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/8dc783ce4a56f59ca8e15ffc969fe51ec32bcade | ORPH
 microblaze  | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/06a6375d9c3a03a1f37bbc5b9b754f657e9376c5 | ORPH
 aarch64_be  | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/2efb24371dd17a690c234d8db0fffdc4bc8429bf | ORPH
    i586     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/1962b324edda219ae510049547ef425c9c92c05d | ORPH
 aarch64_be  | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/5d05569aa3028f4b12011713a28cb928998f9bf0 | ORPH
 aarch64_be  | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/d4af06174bda0232a7875396508aef8f9b0ba6f1 | ORPH
    arm      | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/2f863b017af83143e2957206cb6b9431e35712ef | ORPH
 aarch64_be  | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/8b667ce3194af70c4c2691039214bbc35eb4d4f8 | ORPH
 aarch64_be  | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/66887d52e01834b9cddefb385a27742ea8ab21ba | ORPH
  aarch64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/e0765bfb4cb8d9a7927ad72c2043c7efb3fe9cb7 | ORPH
    arm      | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/5f2fbe5de3288250f5413b85f65ca669437f0907 | ORPH
 aarch64_be  | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/ffb0690bea9ce13a204a1cc12f40696ab5d361d8 | ORPH
 aarch64_be  | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/15a149f9e30cb0921416ea83b621cbbb10b41eda | ORPH
  powerpc    | tvheadend-1295dd2be863f5beb... | NOK | http://autobuild.buildroot.net/results/4ddd0b9a2840c58e21688090f6fa66cca2e2e003 |     
   s390x     | tvheadend-1295dd2be863f5beb... | NOK | http://autobuild.buildroot.net/results/f431f2a084eb33d137af4f15718c261e4f346a1e |     
    arm      | tvheadend-1295dd2be863f5beb... | NOK | http://autobuild.buildroot.net/results/1824fdc835efb0d602bd5b095ff0ce5b47d85bbd |     
   mipsel    | tvheadend-1295dd2be863f5beb... | NOK | http://autobuild.buildroot.net/results/f47c38a8475525860c9513bf2326ec9ba9d2c6b0 |     
   xtensa    | tvheadend-1295dd2be863f5beb... | NOK | http://autobuild.buildroot.net/results/162685bce2574cba4d6882d09f5ae0c96f92825f |     
    arc      | tvheadend-1295dd2be863f5beb... | NOK | http://autobuild.buildroot.net/results/baebd2955cccb14cf24c1a9b20f3da353dcb56bc |     
  riscv64    | tvheadend-1295dd2be863f5beb... | NOK | http://autobuild.buildroot.net/results/4e6564801a59ce467430a620d529309ac2920709 |     
   mips64    | tvheadend-1295dd2be863f5beb... | NOK | http://autobuild.buildroot.net/results/669bfb737256cfd9d663b9ddf64542b2a2d012ec |     
   mipsel    | tvheadend-1295dd2be863f5beb... | NOK | http://autobuild.buildroot.net/results/3e8e43b0ae4c535d48b4dae1ed715ce18d6f65a9 |     
 microblaze  | tvheadend-1295dd2be863f5beb... | NOK | http://autobuild.buildroot.net/results/3648afef1a0fce81c3c8a765c047b21e924efd27 |     
  sparc64    |          uacme-1.7.1           | NOK | http://autobuild.buildroot.net/results/38f2d80d0e5b4c8d989ebe50ad9235b57402d429 |     
  powerpc    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/e8558ee6827209660ecae581bc61f48d513667bb |     
   xtensa    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/d116700d87c91660f909a6ea1b8543c914a2aada |     
   xtensa    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/3c24f0a2ebb32f80942abfca07e0c0c1d96e2cd9 |     
   xtensa    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/d7db06f00f559e949808816f936c4f6a680b56e1 |     
   xtensa    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/bb37fbe6baee067896c78a208b3e8e222697240b |     
    arm      |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/b4bb7278adf7b290338f244edf2a5c7a614a2f53 |     
   xtensa    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/7ec6e736c5280ca8dc727eb468e92e0b0668873b |     
  powerpc    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/6ece059a6dc51fef05a9409a0370a2c715de9ceb |     
   xtensa    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/ab1084f6f95b0ac5c9f629d8f74b9d26396d2b82 |     
   xtensa    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/4c6af8f8c4fd1b450b38972ae523cee5088d3795 |     
  powerpc    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/d435fb0f29a209e71c7219539e32565dcfbfcd24 |     
   xtensa    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/77b8bdb3a21ca7192f6c2c2e4da7771ec3b22acc |     
    arc      |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/e89df88abc24e6541d118f6bcbc153b4cc83b027 |     
  riscv64    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/8c37b50d7705e408591057ff583a41d95e15d569 |     
    arm      |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/5e85e6e3dcd871133d15003755bc837b08ee0644 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/94ed83f7718d7b273594c9f0a60727c360f15827 |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/f1b3a95a27cf4ef641de737a6c87d0d5add0fd52 |     
    i686     |        util-linux-2.38         | NOK | http://autobuild.buildroot.net/results/85c0091c9f5a4c57473f9e90bba21623619536a0 | ORPH
powerpc64le  |        util-linux-2.38         | NOK | http://autobuild.buildroot.net/results/a26f579e076e0be8b8a2dc767ce03489a9d0208e | ORPH
   x86_64    |        util-linux-2.38         | NOK | http://autobuild.buildroot.net/results/3e1249e3d0427a4688b4e35e684b8ee19f4f8ef3 | ORPH
  sparc64    |        util-linux-2.38         | NOK | http://autobuild.buildroot.net/results/f13a8eafbe05a1473eabca7b1efb11fcbe98b224 | ORPH
    or1k     |        util-linux-2.38         | NOK | http://autobuild.buildroot.net/results/92b9585724118336061979af69acffa42d48bbe8 | ORPH
   s390x     |           vde2-2.3.2           | NOK | http://autobuild.buildroot.net/results/1897f593f0a3713a6ba7422036b895e27ec81499 |     
  aarch64    |           vlc-3.0.16           | NOK | http://autobuild.buildroot.net/results/17173769171e7d9d222f850c17306e11fff81f78 |     
powerpc64le  |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/c04291f5f00043ceb7c5c8397efbd6c9a767f186 |     
  mips64el   |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/5e6c1b240d97e9d4c814d9af798b196adbe6d8b8 |     
   xtensa    |            xenomai             | NOK | http://autobuild.buildroot.net/results/45937458fabf5f32ab339753f1552378269a0005 |     
   mipsel    |         xenomai-custom         | NOK | http://autobuild.buildroot.net/results/87f66f37dfbf2b6e5f3fde59a00c3871697c9376 |     
powerpc64le  |         xenomai-custom         | NOK | http://autobuild.buildroot.net/results/0579270b3bc1f935705f0a789fb00d5c09b88e74 |     
   nios2     |          zabbix-5.4.9          | NOK | http://autobuild.buildroot.net/results/c0a2b58fe5189b1956d7bfca6d86bae2480dc4f5 |     
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/163d7c893da025f19348e7862424860b560abf06 | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/4b3c7cd53135e2f77e020a998492ba4b38646ef9 | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/9850c79ecbadda1f4af1983ee0aaa32374219458 | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/6e04affd52528d7c8398f303f4af720f3ad67bfd | ORPH


Classification of failures by reason for 2022.02.x
--------------------------------------------------

google-breakpad-7515ab13768... | 2 
                    bat-0.19.0 | 1 
                 dhcp-4.4.2-P1 | 1 
                  exempi-2.6.1 | 1 
                   gstd-0.13.0 | 1 
               linux-pam-1.5.2 | 1 
                 wavemon-0.9.4 | 1 


Detail of failures for 2022.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/3eadae7151d53de887a46987b783f5825242d635 |     
microblazeel |         dhcp-4.4.2-P1          | NOK | http://autobuild.buildroot.net/results/b77b9cebec52107dc1e6d0792182d2a9d48f279c | ORPH
    arm      |          exempi-2.6.1          | NOK | http://autobuild.buildroot.net/results/238cf5354b03933a76b60903482a5a336153ad46 |     
   mipsel    | google-breakpad-7515ab13768... | NOK | http://autobuild.buildroot.net/results/e9c7c25725db27b0e6851282931ade1e7af233bb |     
   mipsel    | google-breakpad-7515ab13768... | NOK | http://autobuild.buildroot.net/results/00c61325263d377d5acf4ac8187bf802570e465d |     
   xtensa    |          gstd-0.13.0           | NOK | http://autobuild.buildroot.net/results/db2e04fec5d9611ee8485271f46deae8e1d98c7b | ORPH
   xtensa    |        linux-pam-1.5.2         | NOK | http://autobuild.buildroot.net/results/f023cb704195087ec32ce0894c911f4e25cd1c4a | ORPH
  riscv64    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/afeeff42a1a7e1b91acb2011623ee5e476123e7a |     


Gitlab CI results for 2022-04-12
================================

Detail of runtime-test failures for 2022.02.1
---------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
                  TestLxc | https://gitlab.com/buildroot.org/buildroot/-/jobs/2320812432  | ORPH 
      TestPythonPy3Django | https://gitlab.com/buildroot.org/buildroot/-/jobs/2320812546  | ORPH 



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
