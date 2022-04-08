Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1939AC433F5
	for <buildroot@archiver.kernel.org>; Fri,  8 Apr 2022 05:29:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7BCA584016;
	Fri,  8 Apr 2022 05:29:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JXNrom4FS8tP; Fri,  8 Apr 2022 05:29:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DDE9E84005;
	Fri,  8 Apr 2022 05:29:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E44611BF275
 for <buildroot@lists.busybox.net>; Fri,  8 Apr 2022 05:29:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C95FF84005
 for <buildroot@lists.busybox.net>; Fri,  8 Apr 2022 05:29:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XCddF0KwQBTN for <buildroot@lists.busybox.net>;
 Fri,  8 Apr 2022 05:29:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7D3F083FEF
 for <buildroot@buildroot.org>; Fri,  8 Apr 2022 05:29:13 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 7AA88240004
 for <buildroot@buildroot.org>; Fri,  8 Apr 2022 05:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1649395750; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=MIjd9erCUbmaY6T1xkI6A/m3hhroPqQoM0rN2JPWYyw=;
 b=SmKe6ikVZDuqZJa4E1tN/YZROjDFHslC8pz0NZfXutJUjRhwK554r1gleYEkAugqlc3GH2
 oF4bU4U2AEhj8/yDj+oMWVcLohMkTcYurJwmYYJrZ/zjCN3DoD5HMPu6qdaZ2M4IvHwLFz
 mR1IumxkzZhS8/H5rZIk/tAq8/L9C8v0pWibILLXgoqM8MK4e0UQyX/F2rPbr8xnurjugk
 TyXs+2UrnqmIO2vcbn6AyXesgClmqreMRaHd9a9FZ0pCxQuYs7iUrKHDCtxSfWecPs15Eq
 8MaBsgFVWXRlnL2VoxmIlbh5TlC9qtr8N58JS/cIPMP2bqgSwZOoTcbHRHwxAw==
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Fri, 08 Apr 2022 05:29:10 -0000
Message-Id: <20220408052916.C95FF84005@smtp1.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-04-07
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

Autobuild statistics for 2022-04-07
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 52  |  9  |  0  | 61  |
  2022.02.x  | 14  |  2  |  0  | 16  |
    master   | 177 | 406 |  0  | 583 |

Classification of failures by reason for master
-----------------------------------------------

            host-binutils-2.32 | 62
         host-gcc-final-10.3.0 | 31
          host-util-linux-2.38 | 30
                 dhcp-4.4.2-P1 | 21
              fetchmail-6.4.29 | 13
                 uclibc-1.0.40 | 12
           argp-standalone-1.3 | 11
             libopenssl-1.1.1n | 11
host-elf2flt-7e33f28df198c4... | 10
glibc-2.34-109-gd64b08d5ba7... | 8 
toolchain-external-bootlin-... | 8 
                libressl-3.4.3 | 7 
polkit-a2bf5c9c83b6ae46cbd5... | 7 
                python3-3.10.2 | 7 
                    git-2.31.1 | 6 
          host-gcc-final-9.4.0 | 6 
                 linux-5.15.30 | 6 
               util-linux-2.38 | 6 
            qpid-proton-0.35.0 | 5 
                       unknown | 5 
         host-gcc-final-11.2.0 | 4 
              libgcrypt-1.10.0 | 4 
         linux-headers-5.15.30 | 4 
                   perl-5.34.1 | 4 
                 zlib-ng-2.0.6 | 4 
                   expat-2.4.7 | 3 
       host-gcc-initial-10.3.0 | 3 
                 pixman-0.40.0 | 3 
                     refpolicy | 3 
                 dash-0.5.11.5 | 2 
               erofs-utils-1.4 | 2 
                     frr-8.2.2 | 2 
fs/ext2/ext2.mk:65: /home/a... | 2 
               gocryptfs-2.2.1 | 2 
              host-rust-1.58.1 | 2 
               libcap-ng-0.8.3 | 2 
             libgpg-error-1.42 | 2 
                libkrb5-1.18.4 | 2 
                   libnss-3.76 | 2 
                netdata-1.21.1 | 2 
             netsniff-ng-0.6.8 | 2 
                  stunnel-5.60 | 2 
                   uacme-1.7.1 | 2 
                 wavemon-0.9.4 | 2 
                 a10disp-0.6.1 | 1 
                     ace-7.0.6 | 1 
                  acpid-2.0.33 | 1 
               aircrack-ng-1.6 | 1 
                alsa-lib-1.2.6 | 1 
                apparmor-3.0.4 | 1 
               arptables-0.0.5 | 1 
                    belr-4.4.8 | 1 
                    bird-2.0.8 | 1 
                  botan-2.19.1 | 1 
                    brltty-6.4 | 1 
                  cairo-1.16.0 | 1 
                clamav-0.103.5 | 1 
              dieharder-3.31.1 | 1 
                 diffutils-3.8 | 1 
                 dmalloc-5.6.5 | 1 
           docker-cli-20.10.14 | 1 
                    emlog-0.70 | 1 
                     file-5.41 | 1 
fs/cramfs/cramfs.mk:46: /nv... | 1 
fs/ext2/ext2.mk:65: /home/a... | 1 
fs/ext2/ext2.mk:65: /home/a... | 1 
fs/ext2/ext2.mk:65: /home/a... | 1 
fs/ext2/ext2.mk:65: /home/a... | 1 
fs/ext2/ext2.mk:65: /nvmeda... | 1 
fs/ext2/ext2.mk:65: /nvmeda... | 1 
fs/f2fs/f2fs.mk:64: /home/a... | 1 
fs/f2fs/f2fs.mk:64: /nvmeda... | 1 
fs/f2fs/f2fs.mk:64: /nvmeda... | 1 
fs/f2fs/f2fs.mk:64: /nvmeda... | 1 
fs/f2fs/f2fs.mk:64: /nvmeda... | 1 
fs/f2fs/f2fs.mk:64: /nvmeda... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
  gobject-introspection-1.70.0 | 1 
       gst1-plugins-bad-1.20.1 | 1 
            gst1-python-1.20.1 | 1 
       host-gcc-initial-11.2.0 | 1 
host-gdb-arc-2020.09-releas... | 1 
                host-go-1.17.8 | 1 
                host-m4-1.4.19 | 1 
            igh-ethercat-1.5.2 | 1 
           intel-gmmlib-22.1.2 | 1 
                  kexec-2.0.23 | 1 
ktap-23bc7a4a94bd9e4e1b8b7c... | 1 
                    lftp-4.9.2 | 1 
                    libndp-1.8 | 1 
                  libnspr-4.33 | 1 
   linux-headers-5.10.104-cip3 | 1 
linux-headers-5.10.104-cip3... | 1 
                   linux-tools | 1 
        lttng-babeltrace-1.5.7 | 1 
          lua-cqueues-20200726 | 1 
                 minizip-3.0.5 | 1 
                  monit-5.26.0 | 1 
                  netsurf-3.10 | 1 
                nodejs-14.18.3 | 1 
                  ntp-4.2.8p15 | 1 
               openblas-0.3.20 | 1 
                    owfs-3.2p4 | 1 
            python-ujson-4.2.0 | 1 
qt-webkit-kiosk-a7720e50f2b... | 1 
qt5webchannel-fa8b07105b5e2... | 1 
      qt5webkit-5.212.0-alpha4 | 1 
       shadowsocks-libev-3.3.5 | 1 
                     shim-15.4 | 1 
                   strace-5.16 | 1 
               tcf-agent-1.7.0 | 1 
    toolchain-external-bootlin | 1 
toolchain-external-codescap... | 1 
               trousers-0.3.15 | 1 
xdriver_xf86-video-nouveau-... | 1 
                xenomai-custom | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |         a10disp-0.6.1          | NOK | http://autobuild.buildroot.net/results/94bef48fe209ce1b46d26f1f7b7cb7bffa91d940 |     
microblazeel |           ace-7.0.6            | NOK | http://autobuild.buildroot.net/results/303158983f9c6ce9e697a11ea7807623e6f9c8a0 |     
  mips64el   |          acpid-2.0.33          | NOK | http://autobuild.buildroot.net/results/fd17acb56a7b00e0888f8f2ce9dbb4b7e9f9d882 | ORPH
 microblaze  |        aircrack-ng-1.6         | NOK | http://autobuild.buildroot.net/results/a998ca19dcdf5b73777a29a6bc71e0b94cc366b9 |     
   mips64    |         alsa-lib-1.2.6         | NOK | http://autobuild.buildroot.net/results/ab7fc3ba760f3921484c40a5a044bb81077702ab |     
   x86_64    |         apparmor-3.0.4         | NOK | http://autobuild.buildroot.net/results/2ff3ebee647d7bbd5934e2b37b6e3c6f42e9ded9 |     
    or1k     |      argp-standalone-1.3       | NOK | http://autobuild.buildroot.net/results/c2e0f121149c6185cecbf9f6ea987a357894b705 |     
    or1k     |      argp-standalone-1.3       | NOK | http://autobuild.buildroot.net/results/295469b4f2748ab708ae9033a776d89838bea49e |     
    arc      |      argp-standalone-1.3       | NOK | http://autobuild.buildroot.net/results/588c99fdc2f4fe47af1acf5250880979aa3ab8f8 |     
   arceb     |      argp-standalone-1.3       | NOK | http://autobuild.buildroot.net/results/666d56d687f175d298fae78f0fb12de9af7e05c3 |     
    i686     |      argp-standalone-1.3       | NOK | http://autobuild.buildroot.net/results/90ad2f78a927ee3475f3c8fc3e0e349c6941a780 |     
  mips64el   |      argp-standalone-1.3       | NOK | http://autobuild.buildroot.net/results/d20761ca01cef378ab2ed7877831f605dc6d27d6 |     
    mips     |      argp-standalone-1.3       | NOK | http://autobuild.buildroot.net/results/2993f677e41bf5494f5c9a7a71652860f3150234 |     
    m68k     |      argp-standalone-1.3       | NOK | http://autobuild.buildroot.net/results/05331c5c130ae267ad7d59cd75664baa7bf04c99 |     
    arc      |      argp-standalone-1.3       | NOK | http://autobuild.buildroot.net/results/2def514de20dad9748458be6a0efb9d149f8698d |     
    arc      |      argp-standalone-1.3       | NOK | http://autobuild.buildroot.net/results/11feaefe0d9b259362734be9d87817ecd4ea6b53 |     
    arc      |      argp-standalone-1.3       | NOK | http://autobuild.buildroot.net/results/beb39b4977eeff40c649330b6e20943f700e1664 |     
    i686     |        arptables-0.0.5         | NOK | http://autobuild.buildroot.net/results/94b280d20a27c52cfbfc6836ddd0fc41b3175750 | ORPH
  sparc64    |           belr-4.4.8           | NOK | http://autobuild.buildroot.net/results/e7c87803637902ceba65e64041aedab4d0ac1b47 |     
  powerpc    |           bird-2.0.8           | NOK | http://autobuild.buildroot.net/results/4e2482c25029ec5b7c35968bd05a4c48b97d1216 |     
   mipsel    |          botan-2.19.1          | NOK | http://autobuild.buildroot.net/results/019fd7977869c3ca6778769dc19addd4df3d5a82 | ORPH
microblazeel |           brltty-6.4           | NOK | http://autobuild.buildroot.net/results/a24ee32170c55c2d36cee226a997ced2a44b7382 |     
    arm      |          cairo-1.16.0          | NOK | http://autobuild.buildroot.net/results/b1ff1542dd04da21670b1111b1029d162ee93045 |     
   mips64    |         clamav-0.103.5         | NOK | http://autobuild.buildroot.net/results/d2c3d4348a81bc96e706c70990d546ce9724afcf |     
    mips     |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/82fcf2a0e0686bfbb1b7ab4651ffc3f6a017c19d | ORPH
  mips64el   |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/9f8dd347bd64b55c872ea8442fe5d94421676007 | ORPH
    arc      |         dhcp-4.4.2-P1          | NOK | http://autobuild.buildroot.net/results/b6153a8a1b2e142fec8d2d8013d3576276c3d3d6 | ORPH
   x86_64    |         dhcp-4.4.2-P1          | NOK | http://autobuild.buildroot.net/results/85049d1b4d9c76fa77d4f6cc8f3ec6a3f543b467 | ORPH
    arm      |         dhcp-4.4.2-P1          | NOK | http://autobuild.buildroot.net/results/4dadcf9497a21856326c990d10784d593e8ace78 | ORPH
    or1k     |         dhcp-4.4.2-P1          | NOK | http://autobuild.buildroot.net/results/00dc2cd689020a021d4fc21708eea803cd23ae09 | ORPH
    or1k     |         dhcp-4.4.2-P1          | NOK | http://autobuild.buildroot.net/results/2f0975b3d18a9654634233fcfab5ec6a5885cfb2 | ORPH
   sparc     |         dhcp-4.4.2-P1          | NOK | http://autobuild.buildroot.net/results/bc02f2233af52fbdf99d81402f5af9e9dfc095b0 | ORPH
   x86_64    |         dhcp-4.4.2-P1          | NOK | http://autobuild.buildroot.net/results/1203f960b7b0bc470f14acb713a611f17ad614f5 | ORPH
  powerpc    |         dhcp-4.4.2-P1          | NOK | http://autobuild.buildroot.net/results/d2ccdef4ff5adeee5379d6a0f999be11e9e27bac | ORPH
   mipsel    |         dhcp-4.4.2-P1          | NOK | http://autobuild.buildroot.net/results/39722e9d8d9a14d47a96709e82540c18b9ec778d | ORPH
   sparc     |         dhcp-4.4.2-P1          | NOK | http://autobuild.buildroot.net/results/2c21c2e66ad7bfdc96170fb1b70a23a53b399de3 | ORPH
microblazeel |         dhcp-4.4.2-P1          | NOK | http://autobuild.buildroot.net/results/8865067a6367b2e38d186c544e73855d06a54317 | ORPH
   mipsel    |         dhcp-4.4.2-P1          | NOK | http://autobuild.buildroot.net/results/ee3a43a38093ece7820bbc90ea9f0e949b28479b | ORPH
   mipsel    |         dhcp-4.4.2-P1          | NOK | http://autobuild.buildroot.net/results/160b05545e30eae1eba32b87aed53d305cae369d | ORPH
    m68k     |         dhcp-4.4.2-P1          | NOK | http://autobuild.buildroot.net/results/55a9306a6d8adcec088979b6ef23b9cede79bcfe | ORPH
   sparc     |         dhcp-4.4.2-P1          | NOK | http://autobuild.buildroot.net/results/5152ed2bd3ddd0af998fee1af6764eab250e5fee | ORPH
   armeb     |         dhcp-4.4.2-P1          | NOK | http://autobuild.buildroot.net/results/c4a55d8e052788599a681fc72f84ec4aa5a1be19 | ORPH
   mips64    |         dhcp-4.4.2-P1          | NOK | http://autobuild.buildroot.net/results/a691fa8cff9d5dc796da5d7ea255f344846d49f3 | ORPH
   xtensa    |         dhcp-4.4.2-P1          | NOK | http://autobuild.buildroot.net/results/67a692c48a4b2c301ea0d339c10be76009dacb1e | ORPH
   nios2     |         dhcp-4.4.2-P1          | NOK | http://autobuild.buildroot.net/results/6e35f116d24e9ddd9df6717a5aa2c1a56bfc984e | ORPH
    m68k     |         dhcp-4.4.2-P1          | NOK | http://autobuild.buildroot.net/results/d37add9bb8e37f294963d350586863b07044eec3 | ORPH
microblazeel |         dhcp-4.4.2-P1          | NOK | http://autobuild.buildroot.net/results/71e393f3069f43eb745fc74257fb6424ceec0d6e | ORPH
 microblaze  |        dieharder-3.31.1        | NOK | http://autobuild.buildroot.net/results/1682927952083bbb4060ed9b07773e388fc662cd |     
  powerpc    |         diffutils-3.8          | NOK | http://autobuild.buildroot.net/results/c4783a45b73adb91ef3df9ed6959ce0becf52b51 | ORPH
    mips     |         dmalloc-5.6.5          | NOK | http://autobuild.buildroot.net/results/3d93a80a5d43bf7a03bb072ec5efb4bcd5a6247e | ORPH
   x86_64    |      docker-cli-20.10.14       | NOK | http://autobuild.buildroot.net/results/2d4e811b119503f27b9fc9fe2f9ceb66247f44bc |     
   mips64    |           emlog-0.70           | NOK | http://autobuild.buildroot.net/results/cd4baf0d42846a81b7f1027236a564f711f5c6fb |     
    or1k     |        erofs-utils-1.4         | NOK | http://autobuild.buildroot.net/results/f29f70bcdd4894e041211b8eedcdaf16e324ee73 |     
    or1k     |        erofs-utils-1.4         | NOK | http://autobuild.buildroot.net/results/eda924476a48a85527e1ca5acabc3dc21d4d4ae3 |     
  riscv64    |          expat-2.4.7           | NOK | http://autobuild.buildroot.net/results/ac6227f9cd0f4a07c334f27d161e414b64505462 |     
  riscv64    |          expat-2.4.7           | NOK | http://autobuild.buildroot.net/results/767435e7b0dc1b4fde0e22c52fa2d88c6aa788a5 |     
  riscv64    |          expat-2.4.7           | NOK | http://autobuild.buildroot.net/results/c7b00a5489d4137e32be54686e891be630962a22 |     
   mipsel    |        fetchmail-6.4.29        | NOK | http://autobuild.buildroot.net/results/f97722fc4afa7dd05c77858959f4205c1c6ce8b5 |     
  sparc64    |        fetchmail-6.4.29        | NOK | http://autobuild.buildroot.net/results/3fb4771260274074c66640f8630fadc1e065239c |     
    m68k     |        fetchmail-6.4.29        | NOK | http://autobuild.buildroot.net/results/337f0ed42004555d88dca8f59f30771193554558 |     
  aarch64    |        fetchmail-6.4.29        | NOK | http://autobuild.buildroot.net/results/4d1461f74e50c10926629782ae4fb3833923b5ac |     
powerpc64le  |        fetchmail-6.4.29        | NOK | http://autobuild.buildroot.net/results/44958e10a7f94c81662ac204184c70f5debcc217 |     
   s390x     |        fetchmail-6.4.29        | NOK | http://autobuild.buildroot.net/results/d571aa23ffd90ecda5a71a0114609fd91de58dde |     
   arceb     |        fetchmail-6.4.29        | NOK | http://autobuild.buildroot.net/results/551ba44afec615e88f661c1f6f8a5ef9fa9ac0f0 |     
    i686     |        fetchmail-6.4.29        | NOK | http://autobuild.buildroot.net/results/c65608e1cd284512ee6ac7527c04454ea01545fc |     
   s390x     |        fetchmail-6.4.29        | NOK | http://autobuild.buildroot.net/results/7776f7828b3d5d91e60f90577593a08823a374e6 |     
    arc      |        fetchmail-6.4.29        | NOK | http://autobuild.buildroot.net/results/6331e893125c7e92da14187e24980f1bd5983244 |     
   sparc     |        fetchmail-6.4.29        | NOK | http://autobuild.buildroot.net/results/cd0d3425ede45b8dc2334e0a35f01eb40b091b81 |     
  riscv32    |        fetchmail-6.4.29        | NOK | http://autobuild.buildroot.net/results/fd88bded737d6374851f054129abc7bddcaaf65b |     
  sparc64    |        fetchmail-6.4.29        | NOK | http://autobuild.buildroot.net/results/417dd8079206f885595883cb765500129fe3b5ea |     
    mips     |           file-5.41            | NOK | http://autobuild.buildroot.net/results/b966bf8bec50c58874d9d8e331529f87b2b67ebd | ORPH
  mips64el   |           frr-8.2.2            | NOK | http://autobuild.buildroot.net/results/b2a3cfd8dcaa390388ad3921344640b24281d045 |     
  mips64el   |           frr-8.2.2            | NOK | http://autobuild.buildroot.net/results/7e9a5f2d7addb77f65783b65e5dba8a3791253a1 |     
microblazeel | fs/cramfs/cramfs.mk:46: /nv... | NOK | http://autobuild.buildroot.net/results/4c5cd43781ccc77857f8b8c649bc4b930ef17987 |     
microblazeel | fs/ext2/ext2.mk:65: /home/a... | NOK | http://autobuild.buildroot.net/results/ffc2a3bd53a696a053b9cf3763e2d753c95d7e86 |     
  sparc64    | fs/ext2/ext2.mk:65: /home/a... | NOK | http://autobuild.buildroot.net/results/766e113023b265f01ad0dd38713a706a78df362a |     
   sparc     | fs/ext2/ext2.mk:65: /home/a... | NOK | http://autobuild.buildroot.net/results/cce6f7f878052c7381ac8f34b230006baca866dd |     
    m68k     | fs/ext2/ext2.mk:65: /home/a... | NOK | http://autobuild.buildroot.net/results/e64c6b343280114abd455d04465658fe80b9cdfc |     
   mips64    | fs/ext2/ext2.mk:65: /home/a... | NOK | http://autobuild.buildroot.net/results/1f19fac30ac59198a62a6f4bc79f4abb5708926a |     
   x86_64    | fs/ext2/ext2.mk:65: /home/a... | NOK | http://autobuild.buildroot.net/results/c99705dbd7b3a10a657c8ddfab6464cff650a359 |     
   mips64    | fs/ext2/ext2.mk:65: /nvmeda... | NOK | http://autobuild.buildroot.net/results/96c026dd2f8cbb8cc41ca28fd242343a996392d3 |     
 powerpc64   | fs/ext2/ext2.mk:65: /nvmeda... | NOK | http://autobuild.buildroot.net/results/bf031ec55b9e116a191a6bc8f995233944f2be0f |     
    i686     | fs/f2fs/f2fs.mk:64: /home/a... | NOK | http://autobuild.buildroot.net/results/b3d095b882daf2c87fee3ed6a1703ea71481be71 |     
   sparc     | fs/f2fs/f2fs.mk:64: /nvmeda... | NOK | http://autobuild.buildroot.net/results/e0480df14f84e8831834898d3a1fe7a566cdd0ba |     
 powerpc64   | fs/f2fs/f2fs.mk:64: /nvmeda... | NOK | http://autobuild.buildroot.net/results/be1ec7e1a5de521130f7e53538fc79d227ad321b |     
    m68k     | fs/f2fs/f2fs.mk:64: /nvmeda... | NOK | http://autobuild.buildroot.net/results/0db593309ccdf2eb96a08184e26d6f16136045bd |     
   xtensa    | fs/f2fs/f2fs.mk:64: /nvmeda... | NOK | http://autobuild.buildroot.net/results/884ef1471e8bb1a1d47ad0bdef4872980cf4c9bf |     
   sparc     | fs/f2fs/f2fs.mk:64: /nvmeda... | NOK | http://autobuild.buildroot.net/results/ca8ce016d192c15b92ebe67d30e9bbc3dd8c35b5 |     
   x86_64    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/81ee7769f967fab873f98b71a2d0ace9042933a7 |     
   xtensa    |           git-2.31.1           | NOK | http://autobuild.buildroot.net/results/776be4217cc2c3baeeabc033122f21cd4dcf2143 |     
   x86_64    |           git-2.31.1           | NOK | http://autobuild.buildroot.net/results/73aa8608cf7c7c7a0b462d373916f19e68553284 |     
    m68k     |           git-2.31.1           | NOK | http://autobuild.buildroot.net/results/882e75f1f19d7387533fc985c23d6f32d98816e2 |     
    arm      |           git-2.31.1           | NOK | http://autobuild.buildroot.net/results/0246ca602633eacb9defef257f68e03aebcf70a0 |     
    mips     |           git-2.31.1           | NOK | http://autobuild.buildroot.net/results/b3f37b4d75e7a6f9f74de4cc617cb114f1b0d83b |     
   xtensa    |           git-2.31.1           | NOK | http://autobuild.buildroot.net/results/60bbfe3155f4fa30b68c5ab3c44c9cd0682a1d26 |     
   nios2     | glibc-2.34-109-gd64b08d5ba7... | NOK | http://autobuild.buildroot.net/results/c90d34d2455093ddbab5cb34c400e465b2764a60 |     
   nios2     | glibc-2.34-109-gd64b08d5ba7... | NOK | http://autobuild.buildroot.net/results/489921445e5434abc63e204ff3a035055ab36d2f |     
powerpc64le  | glibc-2.34-109-gd64b08d5ba7... | NOK | http://autobuild.buildroot.net/results/655851e5e6660780d089b93c1758792c327fe3a5 |     
powerpc64le  | glibc-2.34-109-gd64b08d5ba7... | NOK | http://autobuild.buildroot.net/results/bed0fa2850bc4af8b360d2479ea9ce6c57c71ac0 |     
  riscv32    | glibc-2.34-109-gd64b08d5ba7... | NOK | http://autobuild.buildroot.net/results/73d3b165c48c12a4e79d9239f029f9817e6b81e5 |     
powerpc64le  | glibc-2.34-109-gd64b08d5ba7... | NOK | http://autobuild.buildroot.net/results/0f7222479a31e309ca647df408d65b1fd3543eef |     
  riscv32    | glibc-2.34-109-gd64b08d5ba7... | NOK | http://autobuild.buildroot.net/results/33baab987acea3f8b6e51a28b9652a04d2031bb5 |     
 microblaze  | glibc-2.34-109-gd64b08d5ba7... | NOK | http://autobuild.buildroot.net/results/2240d5f614e4c0f01ab13b27fdcb18d26b129898 |     
 powerpc64   |  gobject-introspection-1.70.0  | NOK | http://autobuild.buildroot.net/results/975dc7fa31b1b8364079f6007f8b5287b71e0f3f | ORPH
   x86_64    |        gocryptfs-2.2.1         | NOK | http://autobuild.buildroot.net/results/cfff450447fab3ea0a95af3259a8833a20035714 |     
   x86_64    |        gocryptfs-2.2.1         | NOK | http://autobuild.buildroot.net/results/3700d15d218d82754ea41ae97e5d8f4a42ed9d49 |     
  sparc64    |    gst1-plugins-bad-1.20.1     | NOK | http://autobuild.buildroot.net/results/b08ef6d3d6ad123f28e1bc5a6910062864d706e7 | ORPH
 powerpc64   |       gst1-python-1.20.1       | NOK | http://autobuild.buildroot.net/results/33848075028560e52444e485107b2aeac3b7c472 | ORPH
    sh2a     |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/63d01d33ae30f86b63b9f42a9fea116f2f3e9005 |     
 aarch64_be  |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/5e34d11393e14fc36fd6e72b69679bc4fd1e3798 |     
    sh4      |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/f1eeee4b0fc17f7da799651d187b2e5d6d471cac |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/6a084dde18adc35468e43ece29f631fd0a6661cd |     
    sh2a     |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/db002cc90d4832507cc059d9cb9d2ab21b206bb7 |     
 aarch64_be  |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/88b27f01b086d185cc143198d5e29353bbd7d7a8 |     
    sh2a     |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/760dc66df3d38d3b4e8e8d713bd75a816c8b53c9 |     
 aarch64_be  |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/7219284bdcd09c1a180976bfe868a7ecf205ecd2 |     
   sh4aeb    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/73185d6e0cc48ddfd4e2ce321d413e1ce06ed3d9 |     
    sh4      |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/38f678f9bcbd62bac38a137f60eaacb176d89112 |     
   sh4eb     |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/f5be4c6967f3ca8d96ce0157e12fa035c8213e67 |     
 aarch64_be  |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/22f43ecbebc38753530102901b1e1ccef628f0ea |     
 aarch64_be  |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/622915cca68f8006c93f28c43fb8e2ae3d372d97 |     
 aarch64_be  |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/c11471a424e99e8baf161ebcdd53f5d6093b8c88 |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/8f4b0ac41d33d92fc9cb06b297835a169fe744c0 |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/389d7d4f676819916963d9cc08d6bc245c30d3e2 |     
 aarch64_be  |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/37782a151a26dda8ba53f99c59d435e0c2803378 |     
   sh4aeb    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/6f36a142f36d621830733573d77ca2546bad5300 |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/63d3af7c99ec207b7d08a87cfb18af7c26891729 |     
    sh2a     |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/0f102b6b0449dcd8601b1d72682e822b1dc595ea |     
   sh4eb     |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/ff6d13f2ab87f157d3ee0f3be6debc2eb3943951 |     
    sh2a     |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/225ff60845594dc6561408829ebd06b61cc01872 |     
 aarch64_be  |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/8960fa352f5320e87654127ca96165220868ac1c |     
    sh4      |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/b0c68e7fdd84c94e2a5166b3ad33c880ebe4eb96 |     
 aarch64_be  |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/adbbab40df30e62d28138eb055375016580f1292 |     
 aarch64_be  |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/bb68f13d1794dbb20ab2f40ebaaf9d0408af6eb2 |     
    sh4      |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/5f36319e99ccb94967587b43922f790b9db89467 |     
 aarch64_be  |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/c05bd35e5335aa763967c320b170b377137acd86 |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/67264f525acbe55b9eea74a225ae58ea04633209 |     
   sh4aeb    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/2954415fd192822856388fc8b3626860f5efc231 |     
 aarch64_be  |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/0f6e2b4621b284bf9d62314549bf253429931e89 |     
   sh4eb     |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/74acad079e18041ae4cac1aa94ce74f604dd879f |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/1af434e6e7d2ee014fd5544a5bccd964e840cddd |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/3698d83294f9d04824fe4468f0f3b260c6410599 |     
 aarch64_be  |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/0d6f0d4d6713d7b15c27a59c568e713f721bedb8 |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/4077d0e60ef3a1b29638a5a7810ae29622eb6cf2 |     
 aarch64_be  |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/4c2b08a8835c6c5911d414e435f376afeee80606 |     
    sh4a     |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/2eeb9fba5f71e0383148cb919a8e18baf485713a |     
    sh4      |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/3cb2de05ba6c6cb670837f1b90b80093a2fb71cb |     
 aarch64_be  |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/7f6743c89298ee7cb26159b196d863fb644a2316 |     
    sh2a     |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/59a0d24eaff42cb13db68aa5c4da7d2282403dac |     
 aarch64_be  |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/f073dd684186306d920ccdd7424c5b6a00721b27 |     
    sh4      |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/a57107a9c757b108712e5268359749a83987e586 |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/9df22e9333336eaadbd9ad206a988472bea50787 |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/bfc1ac350b959afc828d4b3eedc4444b8e25634e |     
    sh4a     |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/7b5dbe6c8c5d894e33ea4b3a30252d56794d6dbc |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/2bef37301ad3eb6dc85e2c755086f9e6c702936e |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/665b49f94e500551f20e3a87ea24ad7fd235046f |     
 aarch64_be  |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/9506a8e3b11543601d65a71a5a96ae8cd88d5290 |     
    sh4a     |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/2e258b21e8b0d3cbebf2583d71824af1a20730c1 |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/81b5a92c810fd420a39951c0ae330e9d04098135 |     
 aarch64_be  |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/fa43042957dc46409b9b7407485af0db59373695 |     
 aarch64_be  |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/addd4aca4c4f6ab8d678fbb17b4aa7b39cc40534 |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/89148b5bff91b39286903201a2d2c2d1edb3864b |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/883fe1d90d47548ee3b67be0b7fac45539533336 |     
 aarch64_be  |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/ab56927bedd2e1f14c716ed70792c66e0d63dd06 |     
 aarch64_be  |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/ecf7e8b0faa1e100e969826e297c46a2827f9e80 |     
 aarch64_be  |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/5f4fdf01628d60107a65d72ea481ef66b663802c |     
 aarch64_be  |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/98039f803fe86bda0c2323c1aa79a2fa181df0ee |     
    sh2a     |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/0facee0a56884277f995ccf4ca3b7262a78eca9c |     
 aarch64_be  |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/ec9d0c3189853e27b36e4884d4cea15cf4a77379 |     
 aarch64_be  |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/e4ed2685799cb8a2524f7b620b5b96ae0ed9b004 |     
   armeb     | host-elf2flt-7e33f28df198c4... | NOK | http://autobuild.buildroot.net/results/20441a1f4559ce53a457b3995cfec5c91dec72a8 | ORPH
   armeb     | host-elf2flt-7e33f28df198c4... | NOK | http://autobuild.buildroot.net/results/f27cca3241a237d7be96e104a9eeb90340b2ea6f | ORPH
   armeb     | host-elf2flt-7e33f28df198c4... | NOK | http://autobuild.buildroot.net/results/e3066b4be70b0595cbf8ac6eca419d2e333e9dee | ORPH
   armeb     | host-elf2flt-7e33f28df198c4... | NOK | http://autobuild.buildroot.net/results/5e9500ddb431766a158abf14deb448a33b20b6e8 | ORPH
   armeb     | host-elf2flt-7e33f28df198c4... | NOK | http://autobuild.buildroot.net/results/117cd569a19143f92a1410aba71c086bcebff683 | ORPH
   armeb     | host-elf2flt-7e33f28df198c4... | NOK | http://autobuild.buildroot.net/results/ecc0c0a495585dda9dd89ff4da5a3433b0e4969e | ORPH
   armeb     | host-elf2flt-7e33f28df198c4... | NOK | http://autobuild.buildroot.net/results/42d8cd62f538036494669a40a177c0f134e378fa | ORPH
   armeb     | host-elf2flt-7e33f28df198c4... | NOK | http://autobuild.buildroot.net/results/6b6fa3b4b222263a926d01bb18228485626f6041 | ORPH
   armeb     | host-elf2flt-7e33f28df198c4... | NOK | http://autobuild.buildroot.net/results/b2fd4bbec546894dff9d51f34fa0fbd57206ae37 | ORPH
   armeb     | host-elf2flt-7e33f28df198c4... | NOK | http://autobuild.buildroot.net/results/21ba978b9b908ff442dadbccc2f619327bfbdf58 | ORPH
    i686     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/60d55a0c8e7e1c60419b9a3d87a05989cca83a3d |     
powerpc64le  |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/0c1ed40d9b0756933b9837dd638d35533928004a |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/8c867da942155b832ccb17cd4a2f9fe7f36e0e9b |     
   x86_64    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/86f7e890107cc686e5a19349252a37ec5a698984 |     
   nios2     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/1e66c0eeed4d5c1714b6051e5aecf4f041f1ad9a |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/09677c0ddecd7a698a9ffd500d0b6d4bd94858e9 |     
  sparc64    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/30c2ed49fb94b99551d212b2d4309ab046da920c |     
 powerpc64   |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/c6ee7699e03abb9dc3fc95eb49e4240224897031 |     
powerpc64le  |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/ba05a6cab63a1a321533968b8009a7eb3e12c5b7 |     
  sparc64    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/afe71dac2a6021e3646363bb8e357cc17ab86b45 |     
 powerpc64   |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/e5064e3d1547fe65905e0ca8666d533815fd11ee |     
powerpc64le  |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/bbbb111f78943b6bcf3a4baf320bce738c218840 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/8471826c26755ccfc43106ebd5684a53292f4857 |     
  sparc64    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/329d7448574f772d442d0b33967cf5108c67dd56 |     
   nios2     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/b32f336672641c0e13ea99c0dce4968c26082cf9 |     
powerpc64le  |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/b4bf58186620f44b8b01eb4aab1c4d5d1b2d2754 |     
 powerpc64   |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/443c97eb2d057413ddeb2df3e833c325cdf3a59b |     
  powerpc    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/66d2c520aa8902d55cd4bc3e468af86fab551370 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/078e94c84666f2a721d51c04e8b0447db740b3ec |     
powerpc64le  |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/a9261f6b55f4818504744774a49eecb99215e983 |     
powerpc64le  |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/dd3e568d7bb5ba716a27a49960a5487fe614deac |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/902e32482bf9354aa685b795554711b0ccd7ffae |     
 powerpc64   |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/378cec90fc22ab8744a0f34fc84469718a945b1e |     
  riscv32    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/124750a289989297b12a7bff21a9b1dd3903f037 |     
   nios2     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/6ffb59ab22a581c9b5d01b31ae44303cc86d3a99 |     
powerpc64le  |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/dabf8013bb067083c5e2c7ba8fe743d122b1c3c1 |     
   nios2     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/65cb69e1c80f0eab26534bb3a1381a1d67ef6ef7 |     
   nios2     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/fd33b8ac7a569dc100eacf7444bb2fcbd4aad00f |     
  riscv32    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/b02f34c9a9a95f16995f81f1cce7e11499b0af65 |     
 powerpc64   |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/0f40acb6874707d94f1d9d9241b5b47ba4cf2e97 |     
 microblaze  |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/f5f25fcc1f0fd7815e16d682fa2c61b093e1626c |     
  sparc64    |     host-gcc-final-11.2.0      | NOK | http://autobuild.buildroot.net/results/1a17ac25ad155400af67f048bff2741f4df27f13 |     
 powerpc64   |     host-gcc-final-11.2.0      | NOK | http://autobuild.buildroot.net/results/a2dd03897da4bc819cae436afa6a06b45efa8a34 |     
  riscv32    |     host-gcc-final-11.2.0      | NOK | http://autobuild.buildroot.net/results/4f25ba563e33c4f14fe43352ca54a188ac8d2321 |     
   s390x     |     host-gcc-final-11.2.0      | NOK | http://autobuild.buildroot.net/results/5be69add741e8247779ecbd74c1f2d95d8de9671 |     
  powerpc    |      host-gcc-final-9.4.0      | NOK | http://autobuild.buildroot.net/results/11a175b3ade4327853fc75dc317d79fb13f3de3b |     
   nios2     |      host-gcc-final-9.4.0      | NOK | http://autobuild.buildroot.net/results/d6bd6220a177c3e3e04219d24b29a1a3151fcf2b |     
   nios2     |      host-gcc-final-9.4.0      | NOK | http://autobuild.buildroot.net/results/729cd7874a2c73b14143a47a95626a8520124c79 |     
    i586     |      host-gcc-final-9.4.0      | NOK | http://autobuild.buildroot.net/results/ae091c7c285d0e46bcd550a5877805d11894ffea |     
powerpc64le  |      host-gcc-final-9.4.0      | NOK | http://autobuild.buildroot.net/results/7b2e44c3ecd3f1f815f1ac893c0c7b3dd95d7321 |     
  sparc64    |      host-gcc-final-9.4.0      | NOK | http://autobuild.buildroot.net/results/85008cfeca460e9090bea8c729a690360d27d297 |     
    arm      |    host-gcc-initial-10.3.0     | NOK | http://autobuild.buildroot.net/results/7973126760ebe8f5fd95ef588718c22cff0d4f83 |     
    arm      |    host-gcc-initial-10.3.0     | NOK | http://autobuild.buildroot.net/results/fdc8c28a5543c00f1b44c4cb8f799d33bcc2f017 |     
    arm      |    host-gcc-initial-10.3.0     | NOK | http://autobuild.buildroot.net/results/758c134c6bc5f0c45aa240ec2545e0eaeb707e82 |     
   arceb     |    host-gcc-initial-11.2.0     | NOK | http://autobuild.buildroot.net/results/931255b9c1f56e84eb2898ac13d83049f4de145c |     
   arceb     | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/ca35e49506b7b7dc391185a8be96dea4c2a6b9a7 | ORPH
  mips64el   |         host-go-1.17.8         | NOK | http://autobuild.buildroot.net/results/381950e4f692eb3e99091b37540dbe020a26613e |     
  riscv64    |         host-m4-1.4.19         | NOK | http://autobuild.buildroot.net/results/4a574697bb112229db7ebe1051499ee720233a9f | ORPH
   x86_64    |        host-rust-1.58.1        | NOK | http://autobuild.buildroot.net/results/d4ed3d3d8cee7c113cfd9ab6fad532d238f6a4f0 |     
   x86_64    |        host-rust-1.58.1        | NOK | http://autobuild.buildroot.net/results/92a17f1671ce51e5fc8cd23c5993e356891d3076 |     
  powerpc    |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/f2f31c7ce227e53fee05f5a01c271a63e742bc94 | ORPH
   s390x     |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/be6acede6bcbfb03f1e5fe4020c333f8db668b8f | ORPH
   x86_64    |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/145bed85d1a68e1f69525f401d04956ce001e80e | ORPH
    arm      |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/b46385593f7f6454d70bc809aca29518d7c6f8a0 | ORPH
microblazeel |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/d9804b30f039560755fd64821dd6478818ed9450 | ORPH
    arm      |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/95bb78ff8b4ab771076f68249f7a84ce7e873f86 | ORPH
    arm      |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/1e3a3b5fd851acee5dbd9d7ae588b57b304c9a25 | ORPH
microblazeel |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/8e2a5981f405b761ad86d777aa9dcf7d7baa7cfc | ORPH
    arm      |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/de77d9ddceff4e31bbc59717908e3dec9eb0eb07 | ORPH
powerpc64le  |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/ec0098888f29c69931ef92d818374f7d94d149ff | ORPH
   s390x     |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/3f2521046b2cfaff48ca62e9967bcb60652701fc | ORPH
  powerpc    |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/2ffefb910774010a468aca87d2faef527d08cbcd | ORPH
    arm      |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/fb52d22d4c2295080097ca726ef0655e75237a29 | ORPH
    mips     |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/d54301bb924cc8ce137c1528f8ce6e87f0378877 | ORPH
    arc      |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/7a524f05cf6545ff24c3564ef18431bc6cb2e373 | ORPH
    arm      |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/4c585425fb2f2db4be171ccda4db340fd11a401a | ORPH
    arm      |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/8b1eb3ae7055cd8efb4bd9d5b3cb77168c652fca | ORPH
    arm      |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/4f434f94f7a598c348f3410a604e92a5338f6bd4 | ORPH
    arm      |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/b91d95fad9720cfeecbb3761e7918460affac4f3 | ORPH
    m68k     |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/089d73af84f2b21f30f085356e0c24026fab39b9 | ORPH
  mips64el   |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/334564e858fa8befccb6068da106837f8c69d635 | ORPH
    arm      |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/c3f5611722f805eaeef8ccd655cbd569262b4faa | ORPH
   mipsel    |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/49222159bddd025d4749fb004630d703d9c02684 | ORPH
  powerpc    |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/a448d5fff04bb6535d39341af4927cbff8d843a5 | ORPH
powerpc64le  |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/eed81ef3ec169ee6eb5ae46417ccabf669cdfae7 | ORPH
    arc      |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/9a1ea47a95e09a2b0ec4fb6005f6c6628500c13a | ORPH
  aarch64    |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/b973e77c92f44bb301e9d8f2358ff4c56625de40 | ORPH
   s390x     |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/6514d147ce56b8ef773a32a1dae2b23900b642ae | ORPH
    m68k     |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/fea184f042c67e5b883d88af0a93b2d0131abe06 | ORPH
    arc      |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/6b5ad743f202d5c9e23b9a97e28c19424eda59b1 | ORPH
    i686     |       igh-ethercat-1.5.2       | NOK | http://autobuild.buildroot.net/results/1807004c4a3a5ba2bf8c12569b25c86d490e97ab |     
   x86_64    |      intel-gmmlib-22.1.2       | NOK | http://autobuild.buildroot.net/results/4e7f6cc999281f9620eb0b31a0a0840c49979ba0 |     
 powerpc64   |          kexec-2.0.23          | NOK | http://autobuild.buildroot.net/results/9a7a9a96f28239f62839a4c0194411b9254cb058 | ORPH
  sparc64    | ktap-23bc7a4a94bd9e4e1b8b7c... | NOK | http://autobuild.buildroot.net/results/501cfcb1439741632c34681a3c351192abf3cb77 |     
microblazeel |           lftp-4.9.2           | NOK | http://autobuild.buildroot.net/results/c7dcb37548dd95ed4ef686b07f4ba356c1e366c0 |     
    or1k     |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/83c1595f76b0990b2acd592db9f6f3809875f8e6 |     
  riscv64    |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/1593a44b07893373ebefe4ff5722e0789882f525 |     
    i686     |        libgcrypt-1.10.0        | NOK | http://autobuild.buildroot.net/results/e59b4204b1f0d69311d00bfdc14ab3999110e5fd | ORPH
    i686     |        libgcrypt-1.10.0        | NOK | http://autobuild.buildroot.net/results/4ae0b32647adb7d5364da486c7ab3aeb4882688e | ORPH
    i686     |        libgcrypt-1.10.0        | NOK | http://autobuild.buildroot.net/results/03ef48dfb3724154f991f12066991824f62d5583 | ORPH
powerpc64le  |        libgcrypt-1.10.0        | NOK | http://autobuild.buildroot.net/results/e7da0826a4b1013bfa2bac15d103e3269a94e41e | ORPH
  aarch64    |       libgpg-error-1.42        | NOK | http://autobuild.buildroot.net/results/61288dfff48a1f8af2cd52eb1df50ce6e17d286b | ORPH
  aarch64    |       libgpg-error-1.42        | NOK | http://autobuild.buildroot.net/results/02fbd3ce7c45e5926bb080c8cbf102269c156126 | ORPH
   sparc     |         libkrb5-1.18.4         | NOK | http://autobuild.buildroot.net/results/2cd1fb97efffd0458b669a533bb03a8e389b9c2d |     
    or1k     |         libkrb5-1.18.4         | NOK | http://autobuild.buildroot.net/results/bf7fc1e62f157c094db048c9aa73dd78e27840fd |     
  riscv64    |           libndp-1.8           | NOK | http://autobuild.buildroot.net/results/27891ae7a772d5d2639529dfb108e496815c9812 |     
   mips64    |          libnspr-4.33          | NOK | http://autobuild.buildroot.net/results/e27008fd25d81230f696487f7a4c6c9bd255ea7b |     
powerpc64le  |          libnss-3.76           | NOK | http://autobuild.buildroot.net/results/828ff032a70adc0917bb808268bc5e246b2a1d7e |     
   x86_64    |          libnss-3.76           | NOK | http://autobuild.buildroot.net/results/32ffa119c4c9e2ad3d5c302bfc41eb1d655f7b0a |     
   arceb     |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/c98bf8ed1316d0ecf8f87330d594d4b96d0bebe5 |     
    arc      |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/4ff5c701b186ce4a7486757b09bd808e74b1f973 |     
    arc      |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/f17f15e4292d3e41c48dd77f263e28d08b6a2ca1 |     
    arc      |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/a3d08830e3e1b58613e58de451a494174dfbe43d |     
   arceb     |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/9d53c2e93e61dced74f8d4564bba6759ca502b38 |     
    m68k     |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/9f42c0a3fd27234c4b095b9d20eef259d080de9c |     
  riscv64    |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/2577ebec2040733c29256caf9a1ed4a540f362a3 |     
   xtensa    |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/675f472a2b9f2abcd4f7b0c2a493e8932f9dc17b |     
  powerpc    |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/3a9e287f70a0db26760a6af36aabc6ed671d0ada |     
   arceb     |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/3dacf750379a4b1e931373eb74d2f548acee6e63 |     
microblazeel |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/1e816f326311385dd462036680e4248f17315902 |     
  mips64el   |         libressl-3.4.3         | NOK | http://autobuild.buildroot.net/results/c9aa2900bc62b0381be6a7175056e76f16d92592 | ORPH
   arceb     |         libressl-3.4.3         | NOK | http://autobuild.buildroot.net/results/1a2d20b06f28cd86008b1762dff7fbd3a44f87ac | ORPH
    arc      |         libressl-3.4.3         | NOK | http://autobuild.buildroot.net/results/aa06aba8b1044ef783abafed599f4ed2c6f1f9f0 | ORPH
    arc      |         libressl-3.4.3         | NOK | http://autobuild.buildroot.net/results/1875c1efb5aca1d746a0a1008b4e0b2306777ac4 | ORPH
   xtensa    |         libressl-3.4.3         | NOK | http://autobuild.buildroot.net/results/37d6a6845d23c47f828f8c296b258a44b79e4ee6 | ORPH
    arc      |         libressl-3.4.3         | NOK | http://autobuild.buildroot.net/results/27d57b1dca85835830a0ccb16fa1c77cbfb8e5ab | ORPH
   sparc     |         libressl-3.4.3         | NOK | http://autobuild.buildroot.net/results/5ea94ecaccfc19c7cc6847dddcfe701ffde3715e | ORPH
powerpc64le  |         linux-5.15.30          | NOK | http://autobuild.buildroot.net/results/16092f4dbd43e8bd7ae27abd627ae8684c81312e | ORPH
    m68k     |         linux-5.15.30          | NOK | http://autobuild.buildroot.net/results/6f08c26d64fe0b470187a959d1dd9e8de5fcf4ff | ORPH
   nios2     |         linux-5.15.30          | NOK | http://autobuild.buildroot.net/results/a7dd32eb3f79387b348bcb0c2e5916e9fcea0176 | ORPH
  sparc64    |         linux-5.15.30          | NOK | http://autobuild.buildroot.net/results/32648be0642c784ba6af68d57dbab718baa284dc | ORPH
   xtensa    |         linux-5.15.30          | NOK | http://autobuild.buildroot.net/results/c686c6a59bbeb599043f297bea684d074dfb13cd | ORPH
    mips     |         linux-5.15.30          | NOK | http://autobuild.buildroot.net/results/c66a4ea79545827c864128420b6bf50d60c52216 | ORPH
    or1k     |  linux-headers-5.10.104-cip3   | NOK | http://autobuild.buildroot.net/results/e588473ed237074c497d7435a3aa5b743d36a868 | ORPH
    i686     | linux-headers-5.10.104-cip3... | NOK | http://autobuild.buildroot.net/results/72c37f9d918daaa59746452d632af3b03d1dd400 | ORPH
   xtensa    |     linux-headers-5.15.30      | NOK | http://autobuild.buildroot.net/results/95b58bc80e8bddedf3a0e5d2e86eb5987fa9d71f | ORPH
   x86_64    |     linux-headers-5.15.30      | NOK | http://autobuild.buildroot.net/results/438113bbef78e072e5d5e2ba9c62c4e5b66289b9 | ORPH
    or1k     |     linux-headers-5.15.30      | NOK | http://autobuild.buildroot.net/results/6f8801e40829ea97641ebe7251ff96f043a42072 | ORPH
    m68k     |     linux-headers-5.15.30      | NOK | http://autobuild.buildroot.net/results/8de7b0e611e92958b5db2c9d8570a8895b28b988 | ORPH
    mips     |          linux-tools           | NOK | http://autobuild.buildroot.net/results/1ffc04692e6876ba03b366b1d8aa880324202236 | ORPH
microblazeel |     lttng-babeltrace-1.5.7     | NOK | http://autobuild.buildroot.net/results/88d4fa34323ead702518540dfad6cbcf8c7080bf |     
   sparc     |      lua-cqueues-20200726      | NOK | http://autobuild.buildroot.net/results/725dc3908f3f974864943a6ef3ae2d9c5a24ccf9 |     
    or1k     |         minizip-3.0.5          | NOK | http://autobuild.buildroot.net/results/3904bd6bad405370f27576103f7b59c5d7387656 |     
  aarch64    |          monit-5.26.0          | NOK | http://autobuild.buildroot.net/results/c2e706c00eb1ccc86fcf306e723eca03706e17ab |     
  sparc64    |         netdata-1.21.1         | NOK | http://autobuild.buildroot.net/results/1d597bd9b6a6a7ee82fb9d75fd4fbed5d947cdbc |     
  riscv32    |         netdata-1.21.1         | NOK | http://autobuild.buildroot.net/results/897d6f1425a645667b884739b2ee6f588fd06972 |     
    mips     |       netsniff-ng-0.6.8        | NOK | http://autobuild.buildroot.net/results/b27a2a884c36666f29c0b863db10059b6359e786 |     
    mips     |       netsniff-ng-0.6.8        | NOK | http://autobuild.buildroot.net/results/06db28ac6f8eb2011899fc473866f312b1149651 |     
   nios2     |          netsurf-3.10          | NOK | http://autobuild.buildroot.net/results/964d1f9f05093843403c8383fd1902d84299e5bc |     
   x86_64    |         nodejs-14.18.3         | NOK | http://autobuild.buildroot.net/results/1fdf6d0e64e3354419b58d64387d84c1fd922725 |     
  riscv64    |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/471907944d0b0966bf91067748a634cde05e7297 | ORPH
   mips64    |        openblas-0.3.20         | NOK | http://autobuild.buildroot.net/results/f90cd8b506dad53e32db711bc9ae84db8e4577ab | ORPH
    arm      |           owfs-3.2p4           | NOK | http://autobuild.buildroot.net/results/9adceef5daab3607f9103af996d7ab22956c8bc1 |     
   x86_64    |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/b775662679b94bc3b66dcd1b5093065d5c014257 |     
   xtensa    |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/f61cfeeb6d20a980411ed701300d8674b9b0afbd |     
microblazeel |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/731358b2f9969368f3b94804a22efd0919b77d7d |     
   mips64    |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/43696eda9e22886c87c1dd47a5d46bcadc1846b4 |     
    mips     |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/641eeaf88cd9ae1e463be0283845147f697a9a2a |     
   mipsel    |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/fb70a9166440e227e5d3bcf4313fa7f72e600cb2 |     
  mips64el   |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/595adcd925837d461e91ffcc6a84dc67c5621465 |     
   nios2     | polkit-a2bf5c9c83b6ae46cbd5... | NOK | http://autobuild.buildroot.net/results/e1d4f2721aba4cb9148a9706db75798299ee0014 |     
   mipsel    | polkit-a2bf5c9c83b6ae46cbd5... | NOK | http://autobuild.buildroot.net/results/d40e3b82bf4871ea75eeebb5db6ef025bd699da4 |     
   x86_64    | polkit-a2bf5c9c83b6ae46cbd5... | NOK | http://autobuild.buildroot.net/results/e80793c125acfa03cb8ac53654a993ef339cf8d8 |     
   nios2     | polkit-a2bf5c9c83b6ae46cbd5... | NOK | http://autobuild.buildroot.net/results/29dea406b0d58225d9b9fce9ade6377aeb411be8 |     
powerpc64le  | polkit-a2bf5c9c83b6ae46cbd5... | NOK | http://autobuild.buildroot.net/results/aae56c25d2947070b0008d7bc6786ed1620bb425 |     
   nios2     | polkit-a2bf5c9c83b6ae46cbd5... | NOK | http://autobuild.buildroot.net/results/c17b6cf0105b38f3cc307bd4ba82e34615486a1b |     
   s390x     | polkit-a2bf5c9c83b6ae46cbd5... | NOK | http://autobuild.buildroot.net/results/64419b464bff29d5bd8af4bca44f3f4b5b516ce0 |     
   nios2     |       python-ujson-4.2.0       | NOK | http://autobuild.buildroot.net/results/e8b23fcf06c7d7b8220026fb77f331c39ae3a50f |     
   arceb     |         python3-3.10.2         | NOK | http://autobuild.buildroot.net/results/ab3f6971fa09d5e3ac8467406a93bd71e2e5acbb |     
    mips     |         python3-3.10.2         | NOK | http://autobuild.buildroot.net/results/f7dfb1e5af8fd7805f6721fc5917f1efd5b00568 |     
   x86_64    |         python3-3.10.2         | NOK | http://autobuild.buildroot.net/results/19e8c5955cc137930e3b01b91fc055b688436856 |     
  sparc64    |         python3-3.10.2         | NOK | http://autobuild.buildroot.net/results/7379ac855f82aad82a9993fd00698e62b5d861aa |     
   mips64    |         python3-3.10.2         | NOK | http://autobuild.buildroot.net/results/ef2d20804b1aea5e77096bdaecc497022bc29a0e |     
  powerpc    |         python3-3.10.2         | NOK | http://autobuild.buildroot.net/results/30abc4983c060623f2e4b9631205be99e521e7eb |     
  sparc64    |         python3-3.10.2         | NOK | http://autobuild.buildroot.net/results/7ae24367012d9ce702b8a99fe20636d7d834bf9a |     
  mips64el   |       qpid-proton-0.35.0       | NOK | http://autobuild.buildroot.net/results/135b364873042a953a667210c68318bd26212c6e |     
   xtensa    |       qpid-proton-0.35.0       | NOK | http://autobuild.buildroot.net/results/76ab44a373072f9feec8c6a01ade2ab877093cbd |     
   s390x     |       qpid-proton-0.35.0       | NOK | http://autobuild.buildroot.net/results/3cda255885ab5f9073bd0873e2ff443e1d070e49 |     
  mips64el   |       qpid-proton-0.35.0       | NOK | http://autobuild.buildroot.net/results/1a56d6224d0c224e561bf598efe00ea03ad06206 |     
    arc      |       qpid-proton-0.35.0       | NOK | http://autobuild.buildroot.net/results/7bf05fb0208fa09543f841ec6e7adc6e4d984b0c |     
  aarch64    | qt-webkit-kiosk-a7720e50f2b... | NOK | http://autobuild.buildroot.net/results/b096ada6f27a8bd4962cf0ddb2d19973a9ce6861 |     
    mips     | qt5webchannel-fa8b07105b5e2... | NOK | http://autobuild.buildroot.net/results/4a9a9b9702380e4fde76897cbbaebfb722b93506 |     
    arc      |    qt5webkit-5.212.0-alpha4    | NOK | http://autobuild.buildroot.net/results/b1d11e8dc1f646c0d766cbc20e18f7de9d794411 |     
    arm      |           refpolicy            | NOK | http://autobuild.buildroot.net/results/18ba6882362f39f8b0e9b73965eaecd7c038a321 |     
    i686     |           refpolicy            | NOK | http://autobuild.buildroot.net/results/e2dd0f4df65a40fea59f870fa5926eb97c30b6a6 |     
    m68k     |           refpolicy            | NOK | http://autobuild.buildroot.net/results/48ba7c9b9183ae6ae4add1f54494f939faf2305a |     
   nios2     |    shadowsocks-libev-3.3.5     | NOK | http://autobuild.buildroot.net/results/27471a878ff52a972ac087d534e44fb0c50808f6 |     
  mips64el   |           shim-15.4            | NOK | http://autobuild.buildroot.net/results/2ce02ccd130816a27cc00bf9406e0596ad52af47 |     
    mips     |          strace-5.16           | NOK | http://autobuild.buildroot.net/results/0760546595f7334235ab029384658447fa8ca427 |     
   s390x     |          stunnel-5.60          | NOK | http://autobuild.buildroot.net/results/1216dd279742bd568d1e90ab23617a421ffe12c6 |     
 microblaze  |          stunnel-5.60          | NOK | http://autobuild.buildroot.net/results/94d3e999dad5bbea2fcbeb80c980126a2fcc4592 |     
microblazeel |        tcf-agent-1.7.0         | NOK | http://autobuild.buildroot.net/results/5a83f80b5f3a65d462dd0ada0563bd03fe5a59a6 |     
   sh4aeb    |   toolchain-external-bootlin   | NOK | http://autobuild.buildroot.net/results/cb0647b495f3ab226fd89eb1f275337f53ac37eb |     
 aarch64_be  | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/2a236985834ed604016e3af26d90cef909a490bb | ORPH
  riscv64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/934c057abf8c160f5bf1a9e620c5fda3b2a10039 | ORPH
  aarch64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/24f1c113c08eb6a850d298dc284f8360c2a5ee32 | ORPH
microblazeel | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/0a445f0e41deae5124c4aa6b199906f018876ab4 | ORPH
  riscv64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/fe080a6ac4e4b11e9d3f8ad596896c2d1214be16 | ORPH
    i586     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/6d8b777ccd64b77fc27168afa9fbf3ee34a9531f | ORPH
microblazeel | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/406f927e0ec5c883fadbaf5d99a5999a0d15cf42 | ORPH
  aarch64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/ff2771f4a6e2ad9fdb123010663a71fd2e8cddc2 | ORPH
  mips64el   | toolchain-external-codescap... | NOK | http://autobuild.buildroot.net/results/d0f4614450e3332bf5e9362b93cb224591baf664 | ORPH
   arceb     |        trousers-0.3.15         | NOK | http://autobuild.buildroot.net/results/607131255453da2dc0dab20a24264b3e74001525 |     
    mips     |          uacme-1.7.1           | NOK | http://autobuild.buildroot.net/results/f922a4ae0052788e5714eb7701d24d7d09c7ebcc |     
    i686     |          uacme-1.7.1           | NOK | http://autobuild.buildroot.net/results/a1c494a619dc1e6252aa3d6a664362a079cb23fa |     
   xtensa    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/f6cb187c6943f20c4d5e59378c8bcfe0f4471daf |     
  powerpc    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/cb2a9b9f62077caa9c0b3173a841109cf0f41924 |     
   xtensa    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/5e4a8d4d93365fa9a6a4feb86e0b632b7d912c96 |     
   xtensa    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/a43dea877b37b1dd9a22ee9c23bc0b41a58ca826 |     
  powerpc    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/a81568949187976dcddb53fe2c97d3a2d71f6f1c |     
   xtensa    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/f4cd866db6cdb5564cbe59a4f5d16b3d9069d491 |     
  powerpc    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/554788c1c6fc1c77fc91b325c191a1fccb2cb2a7 |     
    arm      |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/432ef119d9f1167ef9cc8e2d27ae104b0e71b2f8 |     
   xtensa    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/141b10811d7f2ca7869858872bb7532fa667f0b8 |     
  powerpc    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/28cbda3ecede075edc691696bf6f841cc72ee0a8 |     
    arc      |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/f3d7c4baa75b684b35998271372b877a65794b76 |     
   xtensa    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/86122f17c5dc307736d3d9a18e6972901d4eefb6 |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/3964e1d8e5a7ff32cd01928be2e7c1f47afa20a5 |     
   mips64    |            unknown             | NOK | http://autobuild.buildroot.net/results/ce68892e950bc8a02dcbee0b4379962a9f479efb |     
  sparc64    |            unknown             | NOK | http://autobuild.buildroot.net/results/98e0fd0d2a2f1a1526ca90257d1aa4a3ac43aa65 |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/323a4cfd00afcfb9c253d45ff54d8dfc5c03d98f |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/a5e1ce60c0e96e149c388ee9530a8a2f90b0adb4 |     
    m68k     |        util-linux-2.38         | NOK | http://autobuild.buildroot.net/results/9307aa8e5c7cd878e20958f6ff6a24855d2f3aba | ORPH
    arm      |        util-linux-2.38         | NOK | http://autobuild.buildroot.net/results/ef57c61270bc887bf3cf8338a89b9342dbfc9c09 | ORPH
    i586     |        util-linux-2.38         | NOK | http://autobuild.buildroot.net/results/1cf9de7521ceaa1fb67e70867c10c5acc449028b | ORPH
   mipsel    |        util-linux-2.38         | NOK | http://autobuild.buildroot.net/results/769a4b13c24414502f5efcea4aa6fb4f7f2f613e | ORPH
   mipsel    |        util-linux-2.38         | NOK | http://autobuild.buildroot.net/results/3af1dcb75d028fa72d9f35b361300274450998ef | ORPH
    i586     |        util-linux-2.38         | NOK | http://autobuild.buildroot.net/results/f6cf93562b58f789bc77271f15b8270abdd2bbe5 | ORPH
   sparc     |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/af341f3b8f8183a396afc2210c7ebcf84cde99a8 |     
   x86_64    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/63ea8f53a1e3a342a8dc37314db8b1c93c79dfbc |     
   x86_64    | xdriver_xf86-video-nouveau-... | NOK | http://autobuild.buildroot.net/results/325d4c0fa7e2cb41e4a8865b0b973373613da8fd |     
  sparc64    |         xenomai-custom         | NOK | http://autobuild.buildroot.net/results/7b5097debe6a774a5a1fdb4b8c2a9595883ed09c |     
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/050b157188bb821ab8c8998d5b636066d4c2873a | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/98fa23efb1f9c8ecb41cf1bd233a62ff71d2ec15 | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/4b134036c5a244f465e697f7d1c23f90e20f92e9 | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/f4f31ac6624315ab4a8584aa064445b5de55473e | ORPH


Classification of failures by reason for 2021.02.x
--------------------------------------------------

                  zeromq-4.3.4 | 2 
                  boost-1.75.0 | 1 
                  exempi-2.6.1 | 1 
        host-sentry-cli-1.57.0 | 1 
                libcurl-7.79.1 | 1 
                 openal-1.20.1 | 1 
          perl-net-ssleay-1.85 | 1 
                       unknown | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |          boost-1.75.0          | NOK | http://autobuild.buildroot.net/results/d8569d41cbfa52a99902b6f9392f9481d31fd940 |     
    arm      |          exempi-2.6.1          | NOK | http://autobuild.buildroot.net/results/5b5b1a2d70547c4159124c058704952c1428b247 |     
microblazeel |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/819844ea312f13981ac78a469bf527c0c5080a94 |     
    i586     |         libcurl-7.79.1         | NOK | http://autobuild.buildroot.net/results/3c0ef203d0720e35802ff6cefaa17c17a6f2bcac |     
    or1k     |         openal-1.20.1          | NOK | http://autobuild.buildroot.net/results/d230fca18b26d4db5830fbf21de25211326e6c14 |     
  riscv32    |      perl-net-ssleay-1.85      | NOK | http://autobuild.buildroot.net/results/83d60f0c38c4797c409a7ea0187b8cdb66855807 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/1c480cab3775d86bf7dba2f2155ebb719244c898 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/a29e793401263bd0f785ed28f60ac1e21230c821 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/3e0827be57af38889631639b7a7f10b31bc2065c |     


Classification of failures by reason for 2022.02.x
--------------------------------------------------

                 dhcp-4.4.2-P1 | 2 


Detail of failures for 2022.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |         dhcp-4.4.2-P1          | NOK | http://autobuild.buildroot.net/results/959275e5328ee7a586d2daa868df260fffb817e8 | ORPH
   x86_64    |         dhcp-4.4.2-P1          | NOK | http://autobuild.buildroot.net/results/038c5a7b9776d9c2b532d9600cfdc4f5b1a070b6 | ORPH


Gitlab CI results for 2022-04-07
================================

Detail of runtime-test failures for 2021.02.12
----------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
  TestInitSystemBusyboxRw | https://gitlab.com/buildroot.org/buildroot/-/jobs/2300514578  | ORPH 
       TestLuajitLuaPosix | https://gitlab.com/buildroot.org/buildroot/-/jobs/2300514672  | ORPH 
                  TestLxc | https://gitlab.com/buildroot.org/buildroot/-/jobs/2300514685  | ORPH 
      TestPythonPy3Django | https://gitlab.com/buildroot.org/buildroot/-/jobs/2300514776  | ORPH 
                 TestRust | https://gitlab.com/buildroot.org/buildroot/-/jobs/2300514906  | ORPH 



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
