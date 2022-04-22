Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47466C433EF
	for <buildroot@archiver.kernel.org>; Fri, 22 Apr 2022 04:43:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A21FD405F7;
	Fri, 22 Apr 2022 04:43:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id epkwM5ko9lMm; Fri, 22 Apr 2022 04:43:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7BCC3405E2;
	Fri, 22 Apr 2022 04:43:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 759781BF847
 for <buildroot@lists.busybox.net>; Fri, 22 Apr 2022 04:43:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5BD8D41B78
 for <buildroot@lists.busybox.net>; Fri, 22 Apr 2022 04:43:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RARVcvDeHwJR for <buildroot@lists.busybox.net>;
 Fri, 22 Apr 2022 04:43:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5BE5841B74
 for <buildroot@buildroot.org>; Fri, 22 Apr 2022 04:43:26 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 0F98940006
 for <buildroot@buildroot.org>; Fri, 22 Apr 2022 04:43:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1650602604; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=vve1xw0s1P4QpZzi8XUCYUJihbpLRHamLa3TwM9/GE4=;
 b=IcfNFzfIH9zrGWlxV+SZkNq9mkG+13HXR18s1FcSeIuI9zL75QLgnqgdX9Xc6Ey4x7lYd3
 qb8i9dW9odRX14S5RF3q6zcG+ovGZ981XTxgIa+uyIMMTA2JB7VXK6AMBdFHI2KEx/tDzA
 FgKcLxH61Q0oz4bUYhlCOm17oH+sns4P41510Ogm8h23xKdNNPsr0Ha6H3+pY3KOgwPg8I
 Hj+JbIQNTIwAPviilkS/92rO93xDdGtYPJOQ7Pt4mkpsYsYmOTyJdqMkNhHQI+ryd9GZdp
 tNIp94+zU39Z9Wtjo84/nuuq8BAWrkjTGxFhj/yl7tA+oUiSpK40sSLjM2aY+g==
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Fri, 22 Apr 2022 04:43:23 -0000
Message-Id: <20220422044330.5BD8D41B78@smtp4.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-04-21
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

Autobuild statistics for 2022-04-21
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  | 25  |  7  |  0  | 32  |
    master   | 126 | 241 |  0  | 367 |

Classification of failures by reason for master
-----------------------------------------------

            host-binutils-2.32 | 27
         host-gcc-final-10.3.0 | 13
host-elf2flt-7e33f28df198c4... | 12
           argp-standalone-1.3 | 10
                  zchunk-1.2.2 | 10
           libwebsockets-4.3.1 | 8 
toolchain-external-bootlin-... | 8 
tvheadend-1295dd2be863f5beb... | 8 
              fetchmail-6.4.29 | 7 
                    git-2.31.2 | 6 
            qpid-proton-0.35.0 | 6 
                 uclibc-1.0.40 | 6 
         linux-headers-5.15.33 | 5 
             libopenssl-1.1.1n | 4 
                 linux-5.15.33 | 4 
                    ttyd-1.6.3 | 4 
               arptables-0.0.5 | 3 
                    bat-0.19.0 | 3 
                host-go-1.17.9 | 3 
                   perl-5.34.1 | 3 
                   uacme-1.7.1 | 3 
                elfutils-0.186 | 2 
       freeradius-client-1.1.7 | 2 
                     frr-8.2.2 | 2 
          host-erofs-utils-1.4 | 2 
         host-gcc-final-11.2.0 | 2 
              host-libcap-2.63 | 2 
   linux-headers-5.10.104-cip3 | 2 
linux-headers-5.10.104-cip3... | 2 
                netdata-1.33.1 | 2 
                 opencv4-4.5.5 | 2 
               poppler-21.12.0 | 2 
                    pppd-2.4.9 | 2 
           python-pybind-2.9.0 | 2 
                       unknown | 2 
                 zlib-ng-2.0.6 | 2 
                  acpid-2.0.33 | 1 
               aircrack-ng-1.6 | 1 
               apcupsd-3.14.14 | 1 
                    bird-2.0.8 | 1 
                bitcoin-0.21.2 | 1 
                  botan-2.19.1 | 1 
            btrfs-progs-5.16.2 | 1 
              bubblewrap-0.6.1 | 1 
                 dash-0.5.11.5 | 1 
                 dmalloc-5.6.5 | 1 
                  exempi-2.6.1 | 1 
                   expat-2.4.7 | 1 
fs/cramfs/cramfs.mk:46: /nv... | 1 
fs/ext2/ext2.mk:65: /home/a... | 1 
fs/ext2/ext2.mk:65: /nvmeda... | 1 
fs/f2fs/f2fs.mk:64: /home/a... | 1 
fs/f2fs/f2fs.mk:64: /home/a... | 1 
fs/f2fs/f2fs.mk:64: /home/a... | 1 
fs/f2fs/f2fs.mk:64: /nvmeda... | 1 
fs/f2fs/f2fs.mk:64: /nvmeda... | 1 
fs/f2fs/f2fs.mk:64: /nvmeda... | 1 
fs/f2fs/f2fs.mk:64: /nvmeda... | 1 
fs/ubifs/ubifs.mk:49: /nvme... | 1 
glibc-2.34-109-gd64b08d5ba7... | 1 
              gnuradio-3.8.2.0 | 1 
               gocryptfs-2.2.1 | 1 
              host-delve-1.8.0 | 1 
          host-gcc-final-9.4.0 | 1 
host-gdb-arc-2020.09-releas... | 1 
             host-pahole-v1.23 | 1 
           host-wayland-1.20.0 | 1 
            igh-ethercat-1.5.2 | 1 
               libcap-ng-0.8.3 | 1 
              libgcrypt-1.10.0 | 1 
               libglib2-2.70.4 | 1 
               libgpgme-1.16.0 | 1 
                  libnspr-4.33 | 1 
                libressl-3.4.3 | 1 
libuci-4b3db1179747b6a67790... | 1 
                 minizip-3.0.5 | 1 
                    musl-1.2.2 | 1 
                  netsurf-3.10 | 1 
            ocf-linux-20120127 | 1 
               pipewire-0.3.50 | 1 
                 pixman-0.40.0 | 1 
               postgresql-14.2 | 1 
                python3-3.10.2 | 1 
                      rauc-1.6 | 1 
                  reaver-1.6.6 | 1 
                     refpolicy | 1 
   sofia-sip-1.13.6-4152840260 | 1 
                 systemd-250.4 | 1 
                  tbb-2021.5.0 | 1 
    toolchain-external-bootlin | 1 
                  uhd-3.15.0.0 | 1 
                    vde2-2.3.2 | 1 
                    vlc-3.0.16 | 1 
                    zstd-1.5.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mips64    |          acpid-2.0.33          | NOK | http://autobuild.buildroot.net/results/f6391c23c49f3074eeaae3c6936bbc8775c6e728 | ORPH
 microblaze  |        aircrack-ng-1.6         | NOK | http://autobuild.buildroot.net/results/4b3dc55c793c3cc5c9d445df7bb4ba05560eb48b |     
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/325ca513aae23d2a0d4157831032a636973b21e4 |     
    arc      |      argp-standalone-1.3       | NOK | http://autobuild.buildroot.net/results/30428e7be173d6b5148c75585b75ecd2551cb7eb |     
   arceb     |      argp-standalone-1.3       | NOK | http://autobuild.buildroot.net/results/50cfeb45c080daa80c657e2bbd63bcaad06f526b |     
    or1k     |      argp-standalone-1.3       | NOK | http://autobuild.buildroot.net/results/d6c2619f2de1d49430dd41a8dbaa3d0721a08227 |     
 microblaze  |      argp-standalone-1.3       | NOK | http://autobuild.buildroot.net/results/8e2cd69356f40bae534847ad58f4aa0dabb4c791 |     
  aarch64    |      argp-standalone-1.3       | NOK | http://autobuild.buildroot.net/results/2126b09ef8f5ef55f3b1e799eff6355aa955eaf5 |     
   mipsel    |      argp-standalone-1.3       | NOK | http://autobuild.buildroot.net/results/8d6d22d8807f765e00cc743c4358098a32d5299d |     
   sparc     |      argp-standalone-1.3       | NOK | http://autobuild.buildroot.net/results/81b090d7790ac599cc93d8cf50d7599e7fa53cb5 |     
   arceb     |      argp-standalone-1.3       | NOK | http://autobuild.buildroot.net/results/b745b984f931340cd45f1154304fd40431e9869e |     
    i686     |      argp-standalone-1.3       | NOK | http://autobuild.buildroot.net/results/4a6bece7f8ed72938dc0a25023491197470df563 |     
    i686     |      argp-standalone-1.3       | NOK | http://autobuild.buildroot.net/results/620809efcb5588435697b43b29cd590a29193d87 |     
    or1k     |        arptables-0.0.5         | NOK | http://autobuild.buildroot.net/results/b242d4b15a4a78906306d99594b57515d35d7686 | ORPH
    or1k     |        arptables-0.0.5         | NOK | http://autobuild.buildroot.net/results/730dce4101e7afcee233067e2870603cd64b8a48 | ORPH
  mips64el   |        arptables-0.0.5         | NOK | http://autobuild.buildroot.net/results/24f4ba84a80cd656590a4b995276ecadd057367a | ORPH
    i586     |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/1c802a78273e14437864d01dd413f51ffad859cd |     
    i586     |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/7aaab0fb797725b91fdfd679831b14955b98bd1f |     
    arm      |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/35e1cfd08d33be69d248b4e22dc18adcee61552e |     
  mips64el   |           bird-2.0.8           | NOK | http://autobuild.buildroot.net/results/3825f6298c0f2e0884666b8aabcf45a689c71499 |     
    or1k     |         bitcoin-0.21.2         | NOK | http://autobuild.buildroot.net/results/1234d2173ff28202541c96fe4b133f923b115836 |     
   mipsel    |          botan-2.19.1          | NOK | http://autobuild.buildroot.net/results/b72ee940337f54cbd96030f8b43d1c8893d57533 | ORPH
    or1k     |       btrfs-progs-5.16.2       | NOK | http://autobuild.buildroot.net/results/e6aac002b498ebc44120c5f011b61ecd8d9588d9 | ORPH
   mips64    |        bubblewrap-0.6.1        | NOK | http://autobuild.buildroot.net/results/eb2d9804bac8440949f5667f71c335a3495844d3 |     
   mipsel    |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/ab6b79926d95153ba4ff72d23c8415ec0f3615c8 | ORPH
  powerpc    |         dmalloc-5.6.5          | NOK | http://autobuild.buildroot.net/results/ced05b3a0f6095cfe68b4cbc9e4a224afb886947 | ORPH
   arceb     |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/0405d172bfdcb7a4a8611a98da9474c95260feef | ORPH
    arc      |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/80b646481127dbd7874dae547f42127cb4ab850b | ORPH
    arm      |          exempi-2.6.1          | NOK | http://autobuild.buildroot.net/results/624be820d155823c8881f2fc5e977ae1c7c0426a |     
  riscv64    |          expat-2.4.7           | NOK | http://autobuild.buildroot.net/results/4e961291fdaa9c8980bb80896e371375b5fba105 |     
    m68k     |        fetchmail-6.4.29        | NOK | http://autobuild.buildroot.net/results/749427cecc7d7018bea026b30dbb2af944d6fbc8 |     
  riscv32    |        fetchmail-6.4.29        | NOK | http://autobuild.buildroot.net/results/17ca31d83cb4fcb444506f498869a2c65b9cf4ef |     
   arceb     |        fetchmail-6.4.29        | NOK | http://autobuild.buildroot.net/results/78164c27b626be1e7efb550d3d9cbe865c6f2cdd |     
   sparc     |        fetchmail-6.4.29        | NOK | http://autobuild.buildroot.net/results/c0a1796ae6ccb42b1c809df4dc60dca83a31877c |     
 powerpc64   |        fetchmail-6.4.29        | NOK | http://autobuild.buildroot.net/results/ed37b9505a43193d76826ab2f7b8eba4194e40fd |     
    mips     |        fetchmail-6.4.29        | NOK | http://autobuild.buildroot.net/results/61effb47768764703037fa351646e789e80e3924 |     
microblazeel |        fetchmail-6.4.29        | NOK | http://autobuild.buildroot.net/results/67c92ce9d94c65ea225d44a7949f513036f537e8 |     
  riscv64    |    freeradius-client-1.1.7     | NOK | http://autobuild.buildroot.net/results/17b2037df260b628c3bdb7e8c54f1ec361f0089a |     
    or1k     |    freeradius-client-1.1.7     | NOK | http://autobuild.buildroot.net/results/39f28277ae19c5814493ea23d2d0a7be5964754e |     
  mips64el   |           frr-8.2.2            | NOK | http://autobuild.buildroot.net/results/51320b21adb05a5f93c9058b27212f57d66aaff5 |     
   arceb     |           frr-8.2.2            | NOK | http://autobuild.buildroot.net/results/1d93f4d6155891532f811bfcffa60259b8dd7aef |     
 aarch64_be  | fs/cramfs/cramfs.mk:46: /nv... | NOK | http://autobuild.buildroot.net/results/70fc0a96faf7160d73c29c300c20ea54cbf738d2 |     
   xtensa    | fs/ext2/ext2.mk:65: /home/a... | NOK | http://autobuild.buildroot.net/results/b97557325e17cf3f6a1efa5fbdb481c4cae4bf47 |     
 powerpc64   | fs/ext2/ext2.mk:65: /nvmeda... | NOK | http://autobuild.buildroot.net/results/d47da4777358b01e6df184134cadc192c9f79a8f |     
    m68k     | fs/f2fs/f2fs.mk:64: /home/a... | NOK | http://autobuild.buildroot.net/results/26f76bfe966b7f9d477dadd5bccde398bdebc05f |     
   arceb     | fs/f2fs/f2fs.mk:64: /home/a... | NOK | http://autobuild.buildroot.net/results/bf2f04b6df67722adeebd6ccc3d9ec724989747d |     
    m68k     | fs/f2fs/f2fs.mk:64: /home/a... | NOK | http://autobuild.buildroot.net/results/8276315091c226c0e417ceb588c935390e190c5e |     
 microblaze  | fs/f2fs/f2fs.mk:64: /nvmeda... | NOK | http://autobuild.buildroot.net/results/5a54e53cee357644648de7a240950bcb9e773251 |     
    or1k     | fs/f2fs/f2fs.mk:64: /nvmeda... | NOK | http://autobuild.buildroot.net/results/47bacfe0c19fe0a2264b8d40592d1745e41a07b4 |     
   xtensa    | fs/f2fs/f2fs.mk:64: /nvmeda... | NOK | http://autobuild.buildroot.net/results/2d2b5467e6d913fa85e842e69ef00aabb261ece5 |     
    or1k     | fs/f2fs/f2fs.mk:64: /nvmeda... | NOK | http://autobuild.buildroot.net/results/cd6904ed58f24765a704cca7ddb1a58dd2c577f5 |     
 powerpc64   | fs/ubifs/ubifs.mk:49: /nvme... | NOK | http://autobuild.buildroot.net/results/7e3e6686cd99fc6f1f1c59216bb905ac2c4c52a2 |     
  powerpc    |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/d57ef36b135a77069db6368c0b4f88796eb9048a |     
   sparc     |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/99427db87e04e91eb762f0f337f533ff81365441 |     
   mipsel    |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/e75aa74260eb1873151a2fc0eef3607ab9833442 |     
   sparc     |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/dd7b2bce6d760b729bac43572347ad7bc7e0f982 |     
   mipsel    |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/b27054b2299fb9fd92a1ef36fa3f27b9e5676de8 |     
   arceb     |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/fc6d09f5f8f821b84412eaba17b9d9fc86a7b5ed |     
   nios2     | glibc-2.34-109-gd64b08d5ba7... | NOK | http://autobuild.buildroot.net/results/d27e8978f09d19a5c6e4616526020484463a2044 |     
    i686     |        gnuradio-3.8.2.0        | NOK | http://autobuild.buildroot.net/results/75985fd17843f562f5f9731432d3a914b210fa04 |     
  aarch64    |        gocryptfs-2.2.1         | NOK | http://autobuild.buildroot.net/results/df849386446300305f37820415c135bac1be04d0 |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/b7a5b9922272b3fbacaf7c835906b4b169828dfe |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/3dd901a310b1ea0cd39bc5037ae382c755917faa |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/0105dc0b8f4be961b89a45281a7a633b21f8bdb1 |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/5a2299ce744ae2c0ce075ec5295d87ab7dcc7135 |     
 aarch64_be  |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/60c04100df1f8f5673f6afa8cc8aab6b000169a9 |     
    sh4a     |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/f8557cd5e903ce67dafb38cfd7970383b7e6e2af |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/afc785a52cc7e434567b1cda35abf23fcfed59cb |     
 aarch64_be  |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/cc046c6862afc4ae1626f846359db47594a66ee6 |     
 aarch64_be  |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/5973912f0ef08a0da9b9d70523f38570a356d548 |     
 aarch64_be  |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/6c2115003d1be6b546fbd26fed9ef4b9bdf10424 |     
    sh4      |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/c917dc28c156c8977d993a77bbd7d37fcd7ce0fc |     
 aarch64_be  |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/811d4712033d92081fdb0552961eb222b81c8e44 |     
   sh4aeb    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/cd65dbec9dae1050f5d6fada86ed4291d92eee18 |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/7839c6b0064289225df3279081626f37718bb39f |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/3de7edd37a71c5c0566a8ecb4083a577c929e9b5 |     
 aarch64_be  |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/48bcbb4fa7765fedf184049b5a39d44a16b062fe |     
 aarch64_be  |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/9d5bb487193e303c3dd98054b96b87afa30c6cee |     
   sh4aeb    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/bf7c4d5cc2c951b3936d70bf3d78a9163889215f |     
    sh2a     |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/33cd0b8313f2b046528e81c471dd41b20d6cfc23 |     
 aarch64_be  |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/6ed22afeffa022b32d330de9d1a0559f3f1cc6fe |     
   sh4aeb    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/5a7212aef761add694bea6d756a8a7bcfe0acc4b |     
 aarch64_be  |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/e143597fded1d09b0fa368ae7c4b42a8e19c4943 |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/d9a04e7d42d446a7fe74962b7c4a6e1aff553aa3 |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/0de2f02214fea96cc768bdbe97f536cb4a532da4 |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/c72066d34836545831a02b7e6d9f28b711902a03 |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/07beb248e0ee34bfb1922bd04d7ef9c3d5865538 |     
   sh4aeb    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/415194128a980fc8a849719a87c52172ddf82881 |     
    arm      |        host-delve-1.8.0        | NOK | http://autobuild.buildroot.net/results/9de3b989f6318aea28df67caae790578678b803a |     
   armeb     | host-elf2flt-7e33f28df198c4... | NOK | http://autobuild.buildroot.net/results/f84c538c3f931570a703be5bdc5ff58134384857 | ORPH
   armeb     | host-elf2flt-7e33f28df198c4... | NOK | http://autobuild.buildroot.net/results/8e6f50226bc0562dafde0b3f3248ba2d009600cc | ORPH
   armeb     | host-elf2flt-7e33f28df198c4... | NOK | http://autobuild.buildroot.net/results/a2d8a69da0869bc406f1fd594abea3f9d6424ea1 | ORPH
   armeb     | host-elf2flt-7e33f28df198c4... | NOK | http://autobuild.buildroot.net/results/749e88000b8e3238aa91f8bd70fb215e1cfb1fb4 | ORPH
   armeb     | host-elf2flt-7e33f28df198c4... | NOK | http://autobuild.buildroot.net/results/bbaf2f737f563473877d87ed96172d77808b59f1 | ORPH
   armeb     | host-elf2flt-7e33f28df198c4... | NOK | http://autobuild.buildroot.net/results/6cabe4c606abc81e5a071cf588c9ebf97bae80a2 | ORPH
   armeb     | host-elf2flt-7e33f28df198c4... | NOK | http://autobuild.buildroot.net/results/b348b97ad787895e05620aaf2b8256d09657aabf | ORPH
   armeb     | host-elf2flt-7e33f28df198c4... | NOK | http://autobuild.buildroot.net/results/19ac9fba743dfe12f2b76acd87a51d5c442e4fa0 | ORPH
   armeb     | host-elf2flt-7e33f28df198c4... | NOK | http://autobuild.buildroot.net/results/5911664e3ab29fd58b40a370b97b0fef990835ae | ORPH
   armeb     | host-elf2flt-7e33f28df198c4... | NOK | http://autobuild.buildroot.net/results/e040e6cfb5685bb14126b1f87690f9147191e596 | ORPH
   armeb     | host-elf2flt-7e33f28df198c4... | NOK | http://autobuild.buildroot.net/results/5d16c8fd2f98a830dc9a75b14e5aa7f23d784258 | ORPH
   armeb     | host-elf2flt-7e33f28df198c4... | NOK | http://autobuild.buildroot.net/results/de6cb19d059f76c0f2f2a92301b422641e6a6d3d | ORPH
   nios2     |      host-erofs-utils-1.4      | NOK | http://autobuild.buildroot.net/results/a5a2604fa77e084ac01eff83fd8718992b9eb2f7 |     
  aarch64    |      host-erofs-utils-1.4      | NOK | http://autobuild.buildroot.net/results/bfe3d091c79e4ac755c6abe04a5b5d9fbc553f6b |     
 powerpc64   |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/dd72c7fe59ae0e88ffd5f62124288da3d1dc4bf1 |     
 powerpc64   |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/63c98f6b311c4a3fa66f58a33fb4a05066f04364 |     
    arm      |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/8a230a02d18ed9de639cffb1fff9cadf5c3aeaf9 |     
  sparc64    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/2fc3df243e1217da0ca645e49d5ef35e0a3ab837 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/46769cf520015c804f6a6e94367848baec6465ec |     
  sparc64    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/5ca427a036dbc7db71d2406d0e4d73ae0c5ca125 |     
   nios2     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/a1ad8b483db3f991a3b7e10bdab7277c17ab67f7 |     
 powerpc64   |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/0c75b3401173c1d9faeae669b4fda5ade87f9ab3 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/cfdfff59afd49c174215bd77125f1c93fa928b22 |     
 powerpc64   |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/f0a6a206554b5985abfe7d4fefc0bb0a9d8c436c |     
 powerpc64   |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/af88a802e8e83c88e32484872a752473bbc2e792 |     
powerpc64le  |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/f3ef3a8f1cea3b0ad24928fd113e776f7b73a834 |     
powerpc64le  |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/59f2893866609d18eb83285afae15f9367d407d2 |     
powerpc64le  |     host-gcc-final-11.2.0      | NOK | http://autobuild.buildroot.net/results/ff630a49fd61053e3efec7cccbd4824166142bd4 |     
   nios2     |     host-gcc-final-11.2.0      | NOK | http://autobuild.buildroot.net/results/f84c4582668582688c59bb3dc60444d226173ca1 |     
  sparc64    |      host-gcc-final-9.4.0      | NOK | http://autobuild.buildroot.net/results/6c173ab8fb74a8ae06e7f521bef95c3a3d8aa764 |     
    arc      | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/50e71c71ec7556946132d80d4324aa6583751d61 | ORPH
  mips64el   |         host-go-1.17.9         | NOK | http://autobuild.buildroot.net/results/ce18fe377eb32b936164cb6a5899461bec26e438 |     
    i686     |         host-go-1.17.9         | NOK | http://autobuild.buildroot.net/results/5a3650349808e9a63321fc4dd96a3a18bda91cad |     
   mips64    |         host-go-1.17.9         | NOK | http://autobuild.buildroot.net/results/cd3a59e9a4ff13d729feeb85721a81a8c88c5723 |     
   nios2     |        host-libcap-2.63        | NOK | http://autobuild.buildroot.net/results/4445860b22c0adbdcd7815c5aa7c4b75f196b4da |     
    arc      |        host-libcap-2.63        | NOK | http://autobuild.buildroot.net/results/91128268ab339509198c32943f78de4ec5991e68 |     
    mips     |       host-pahole-v1.23        | NOK | http://autobuild.buildroot.net/results/0fce55ee9117f688fd796d111ea76c644e7c70cf |     
    sh4      |      host-wayland-1.20.0       | NOK | http://autobuild.buildroot.net/results/d487d4ec69a6eb1316ffb9311d388ec03d64cd9d |     
  sparc64    |       igh-ethercat-1.5.2       | NOK | http://autobuild.buildroot.net/results/8fabbdd79ecf2b06b2bf08cca77810a7b51365e8 |     
    arm      |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/7e24191158617ed29f3a06f58ecedc99d2771aa3 |     
 powerpc64   |        libgcrypt-1.10.0        | NOK | http://autobuild.buildroot.net/results/acc61894f58b86e79388298afafd892ebcef93b7 | ORPH
    arc      |        libglib2-2.70.4         | NOK | http://autobuild.buildroot.net/results/d9daf55051778a32967ea0caa3bb22ea5fb8c562 |     
    or1k     |        libgpgme-1.16.0         | NOK | http://autobuild.buildroot.net/results/6ca6d4e6272c8ccda0e45ecfe59f2c2a826fb78e | ORPH
  mips64el   |          libnspr-4.33          | NOK | http://autobuild.buildroot.net/results/c777f0c4ea54b559f010a0f4505f97b62a3b3dcd |     
 microblaze  |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/efcaa565b3009f0803f66cb652fccebbf870bdf1 |     
   arceb     |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/fcf8f4323d0afe6245689c0859a3b56f99cc67d3 |     
   arceb     |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/6e94890f2f9fcc079e973cfa9000e38e1dbb2a4e |     
    arc      |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/2c1324f02f155b3cf920692f2f1c9e5914b732cc |     
    m68k     |         libressl-3.4.3         | NOK | http://autobuild.buildroot.net/results/ff7609ce17a03b1872bc8001e515c785ba79530f | ORPH
   mips64    | libuci-4b3db1179747b6a67790... | NOK | http://autobuild.buildroot.net/results/df6a448830d589708927c25af475b5cb684882ee |     
    arm      |      libwebsockets-4.3.1       | NOK | http://autobuild.buildroot.net/results/b0cb70cb0245f10233f744370fd1762daed3bc06 |     
  mips64el   |      libwebsockets-4.3.1       | NOK | http://autobuild.buildroot.net/results/23af32a4e4c63612912b60f365ada30553d12c40 |     
   x86_64    |      libwebsockets-4.3.1       | NOK | http://autobuild.buildroot.net/results/154095562470bf5022e66cf38078366293719e10 |     
   nios2     |      libwebsockets-4.3.1       | NOK | http://autobuild.buildroot.net/results/a2d23f6697e1d42f67e6d0ca60ba658f52724394 |     
  sparc64    |      libwebsockets-4.3.1       | NOK | http://autobuild.buildroot.net/results/0a743faa3911fe9cc6887ae060e13b904a81cee2 |     
    or1k     |      libwebsockets-4.3.1       | NOK | http://autobuild.buildroot.net/results/35912d48d37b77df47aaa9876a523660b73ffa23 |     
    mips     |      libwebsockets-4.3.1       | NOK | http://autobuild.buildroot.net/results/78becd69cfea323b9b8bbc77ce97a781f30f215a |     
    m68k     |      libwebsockets-4.3.1       | NOK | http://autobuild.buildroot.net/results/3bfdb6d46173de4ea96b6fc1db00b1e7dd560125 |     
   nios2     |         linux-5.15.33          | NOK | http://autobuild.buildroot.net/results/478e78db84dced03a546e5c99ab8db0eee44e7ec | ORPH
    or1k     |         linux-5.15.33          | NOK | http://autobuild.buildroot.net/results/77bf3d849c267ed3c31d083756aac028f323a912 | ORPH
  powerpc    |         linux-5.15.33          | NOK | http://autobuild.buildroot.net/results/021e8b112b93fe91a22fbd33fadba7770ebe26f9 | ORPH
  mips64el   |         linux-5.15.33          | NOK | http://autobuild.buildroot.net/results/9d11c31bee7804c642f4e27dbe764cd649cc2182 | ORPH
    or1k     |  linux-headers-5.10.104-cip3   | NOK | http://autobuild.buildroot.net/results/86649c6c576aa188f0b340cbf9634e074b8b580c | ORPH
    or1k     |  linux-headers-5.10.104-cip3   | NOK | http://autobuild.buildroot.net/results/0c76893b595ac8f63ec695d1019e19ef9bb17cf2 | ORPH
  powerpc    | linux-headers-5.10.104-cip3... | NOK | http://autobuild.buildroot.net/results/0ace08dadc0e391b10b8fd2a7d6e97c4cbf9c7a8 | ORPH
powerpc64le  | linux-headers-5.10.104-cip3... | NOK | http://autobuild.buildroot.net/results/2a935fc9f7907cd35d704d10d24610bada0fd293 | ORPH
microblazeel |     linux-headers-5.15.33      | NOK | http://autobuild.buildroot.net/results/6ab693868b049b7800a6915840d15431690a5067 | ORPH
    m68k     |     linux-headers-5.15.33      | NOK | http://autobuild.buildroot.net/results/db7ef5cefdf551b62692205196815ac94c27edd9 | ORPH
   s390x     |     linux-headers-5.15.33      | NOK | http://autobuild.buildroot.net/results/57bf1b6bb665d2b1f786f0ac2bfc6bfe330b2c14 | ORPH
   x86_64    |     linux-headers-5.15.33      | NOK | http://autobuild.buildroot.net/results/ae666d4c28d29d589250d620fbc645d38201c469 | ORPH
   sparc     |     linux-headers-5.15.33      | NOK | http://autobuild.buildroot.net/results/660343ef3044d2b29ce969f4007587787225bba6 | ORPH
powerpc64le  |         minizip-3.0.5          | NOK | http://autobuild.buildroot.net/results/bf78b16c2604b630bcc15034c7fa7d2aed2d6f84 |     
  powerpc    |           musl-1.2.2           | NOK | http://autobuild.buildroot.net/results/ebcf4543f8bf8fc8eff58f1d9fc9f65bc461e21f |     
microblazeel |         netdata-1.33.1         | NOK | http://autobuild.buildroot.net/results/cc35038535437676b077ea720b2e883c591b9222 |     
   mipsel    |         netdata-1.33.1         | NOK | http://autobuild.buildroot.net/results/c1da901b71af4f700c27dff5af7b74a9539d29dc |     
   mips64    |          netsurf-3.10          | NOK | http://autobuild.buildroot.net/results/370daa3420cb9188a3b20d9eb59865556fb69706 |     
    or1k     |       ocf-linux-20120127       | NOK | http://autobuild.buildroot.net/results/5c9f773780083970c67e4312f5bcd602eee87834 | ORPH
  powerpc    |         opencv4-4.5.5          | NOK | http://autobuild.buildroot.net/results/b312d2f45eb717d334560c4cb76da8fd24ba1223 |     
   xtensa    |         opencv4-4.5.5          | NOK | http://autobuild.buildroot.net/results/e2e140927c01fa071743988b305fff69f837d031 |     
    i686     |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/dfa82a0a0b9d2d52f69a4a042ee810281cda93a9 |     
   mipsel    |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/7fb6377070fd3a68195b0d8003dddbdac2617846 |     
    or1k     |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/30814e55489207711f682921d277087f7dbd024b |     
   x86_64    |        pipewire-0.3.50         | NOK | http://autobuild.buildroot.net/results/389133072005829738d156530503a699a4ef1912 |     
  mips64el   |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/2d4852d56c3ac80b58cc5750139200d809b3817c |     
   xtensa    |        poppler-21.12.0         | NOK | http://autobuild.buildroot.net/results/5213502a4d3fdf487978b4ededd19f1d805f8251 |     
   xtensa    |        poppler-21.12.0         | NOK | http://autobuild.buildroot.net/results/28ccd2c58ea6f33bfe8b68f04f4e9a84ae968bea |     
   arceb     |        postgresql-14.2         | NOK | http://autobuild.buildroot.net/results/0f47a0201fa2f084308d7e2be797f6f054fd7efd |     
   mips64    |           pppd-2.4.9           | NOK | http://autobuild.buildroot.net/results/6f18168a3ebc8aacab72852f1a17186b93ba7f1d | ORPH
microblazeel |           pppd-2.4.9           | NOK | http://autobuild.buildroot.net/results/609684a715f37bdc6be55f08b658ef59bab0f6f5 | ORPH
   nios2     |      python-pybind-2.9.0       | NOK | http://autobuild.buildroot.net/results/1869c2d7fecf58bab99af24305a9adc19f9049c3 |     
   mipsel    |      python-pybind-2.9.0       | NOK | http://autobuild.buildroot.net/results/d0c34b49242f4ca3cafaa4c0137ec8a73c6b1a79 |     
   x86_64    |         python3-3.10.2         | NOK | http://autobuild.buildroot.net/results/8bf990ead76358ca97816835816e03cd8e7dcaf7 |     
   xtensa    |       qpid-proton-0.35.0       | NOK | http://autobuild.buildroot.net/results/0ae5372b87fdb2d83fd953d2ad49d0442b14c8ee |     
 powerpc64   |       qpid-proton-0.35.0       | NOK | http://autobuild.buildroot.net/results/38273cbc4126fa277b82e617b9d901abb0bbad15 |     
  mips64el   |       qpid-proton-0.35.0       | NOK | http://autobuild.buildroot.net/results/abb78942d0222db8b2bf4c1219adf1da71d5f1cb |     
powerpc64le  |       qpid-proton-0.35.0       | NOK | http://autobuild.buildroot.net/results/ef53b037bae080315b93ac850c2858048e607cc3 |     
powerpc64le  |       qpid-proton-0.35.0       | NOK | http://autobuild.buildroot.net/results/b5214696d45d332ac663440cf5ecc23651bd7a06 |     
  mips64el   |       qpid-proton-0.35.0       | NOK | http://autobuild.buildroot.net/results/144d18ee1bbf707f13a982ff78df0f1b2a42db7a |     
 powerpc64   |            rauc-1.6            | NOK | http://autobuild.buildroot.net/results/9f018520a1c9372aa5b4a59bb1dac2eea48418d3 |     
   arceb     |          reaver-1.6.6          | NOK | http://autobuild.buildroot.net/results/70a4323c7d91abcd5e2a3bdf4dc35db465d652ac |     
    or1k     |           refpolicy            | NOK | http://autobuild.buildroot.net/results/984dc1f02191324622fcd8c6e1500a5fcd4864eb |     
   nios2     |  sofia-sip-1.13.6-4152840260   | NOK | http://autobuild.buildroot.net/results/2bdc3d6828a7e3bbe8bd38b40c72143ca38007ed |     
   s390x     |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/7a343cc8db256775bae8a201aaf382f020bcb359 |     
   nios2     |          tbb-2021.5.0          | NOK | http://autobuild.buildroot.net/results/4e1b14ec6bf48e631530d8e1faca899f00e31925 |     
  sparc64    |   toolchain-external-bootlin   | NOK | http://autobuild.buildroot.net/results/84fe861b8bcb401d4d1c9ffda2699d73d28255a2 |     
    arm      | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/469ce7e0af0a76e7addd45652a85da2fe2944e86 | ORPH
  aarch64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/295b573c8f331222f748c72b78d4721b97c271ce | ORPH
  aarch64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/f4096660bd80ccd827d8ed84b8cee8160a80b890 | ORPH
  riscv64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/20f60d45a650c6f0e18bd8f07fd4041a1c2030cb | ORPH
  aarch64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/45972bcf0ae68979ddd71c2598cf8c6d581b6b2a | ORPH
 aarch64_be  | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/a3150dc86d5ccf97e1bbc57105d7f8bb9fe9a718 | ORPH
 aarch64_be  | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/99ca5ef16e61df61a35b8e3a10324eaf57f14289 | ORPH
    sh4      | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/6c955a0c47c42bd6da5190a10b1a67cc12b5de53 | ORPH
   nios2     |           ttyd-1.6.3           | NOK | http://autobuild.buildroot.net/results/5fe6ad01963ea224ac9eb79b1e6672e685389399 |     
microblazeel |           ttyd-1.6.3           | NOK | http://autobuild.buildroot.net/results/ebf5acce4aa1c2ddd44b877b890a9929de14a78d |     
  mips64el   |           ttyd-1.6.3           | NOK | http://autobuild.buildroot.net/results/6fe585b2c5b48655dc37778c4353675419a66c9b |     
    arm      |           ttyd-1.6.3           | NOK | http://autobuild.buildroot.net/results/d6650693eb35e895585a44db9ec1066113b7d392 |     
    arc      | tvheadend-1295dd2be863f5beb... | NOK | http://autobuild.buildroot.net/results/757db07fa7bae1cfbf91764a95dc811cf16b2f43 |     
   mipsel    | tvheadend-1295dd2be863f5beb... | NOK | http://autobuild.buildroot.net/results/e77252c54e017b6bd80c135948656019d3c139cd |     
 microblaze  | tvheadend-1295dd2be863f5beb... | NOK | http://autobuild.buildroot.net/results/b9eb73d09c9441d64448a7f0c59e9546b08ce268 |     
  powerpc    | tvheadend-1295dd2be863f5beb... | NOK | http://autobuild.buildroot.net/results/3ac973e786705bbb72107d7cb66636c1b58aa501 |     
    i686     | tvheadend-1295dd2be863f5beb... | NOK | http://autobuild.buildroot.net/results/f75d766ecf76560300e32ccece9cac86c4880a0b |     
  sparc64    | tvheadend-1295dd2be863f5beb... | NOK | http://autobuild.buildroot.net/results/675e99b94232c0d173e65ea559d822f1879cc530 |     
   xtensa    | tvheadend-1295dd2be863f5beb... | NOK | http://autobuild.buildroot.net/results/2613456458eb32ada0f7e0cd4d5a42ffa9ec9685 |     
   xtensa    | tvheadend-1295dd2be863f5beb... | NOK | http://autobuild.buildroot.net/results/9ebede76629cc921e4f7c7b2fb60f020e4096fdd |     
   mipsel    |          uacme-1.7.1           | NOK | http://autobuild.buildroot.net/results/504986a543136b4a555fa672b41c663549b27683 |     
    or1k     |          uacme-1.7.1           | NOK | http://autobuild.buildroot.net/results/a465acb15eca31533c50f2410603dc512886d13a |     
  sparc64    |          uacme-1.7.1           | NOK | http://autobuild.buildroot.net/results/614499c6fe282765a976b91954f2df72c9c88aec |     
  powerpc    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/348b1926a5f9d337889629b85a4e50b279ddf35f |     
   xtensa    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/9b5ac67c1c689f5fd6981146163f7b5dc8f927c2 |     
   xtensa    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/396e6399300be7caaf48a8ec70d5928cecd85dc4 |     
    arc      |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/634dddc3c9872d0814b412936c540e6e23aa90ca |     
  powerpc    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/6d8e40cbb9e15776d87d5dd6bdf777633a928dab |     
  powerpc    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/bfc34144529ccdad549fa60cf2466cc89e3d3f05 |     
microblazeel |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/5a7e87a816589e2675d38986f34ad6ccd4939dfa |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/277f1969c31c6b66537e0d0ec7edf1818900734b |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/4d78130c69c530ce858bbab004673aef1444e255 |     
   mips64    |           vde2-2.3.2           | NOK | http://autobuild.buildroot.net/results/5eeefcdac0b8974a424a885fdc2e82f7cb4b617d |     
    i586     |           vlc-3.0.16           | NOK | http://autobuild.buildroot.net/results/9a3b7231f02fe1d20b3f2751db66676afdcf83f7 |     
    arc      |          zchunk-1.2.2          | NOK | http://autobuild.buildroot.net/results/d80a856d8fe103ca2abbe0b13dca636d2af2a0cb |     
  powerpc    |          zchunk-1.2.2          | NOK | http://autobuild.buildroot.net/results/45577db086d67dfb89970a7ad0783e9f1f832f06 |     
    i686     |          zchunk-1.2.2          | NOK | http://autobuild.buildroot.net/results/1911a19e37c4d0be6f8c9738b0d242604ef99846 |     
    m68k     |          zchunk-1.2.2          | NOK | http://autobuild.buildroot.net/results/2c2a31288171981426cd9b674571184ccc873d74 |     
  riscv64    |          zchunk-1.2.2          | NOK | http://autobuild.buildroot.net/results/fa7f7b18db7a00d0dffb639ce3f4e70c1a732fe3 |     
   x86_64    |          zchunk-1.2.2          | NOK | http://autobuild.buildroot.net/results/ce3536df2f39bfad1df6780d52cf564ca709fa1e |     
    arm      |          zchunk-1.2.2          | NOK | http://autobuild.buildroot.net/results/9fcadf647d6b208f359d1aaec9d5236f3b0d00d8 |     
    arc      |          zchunk-1.2.2          | NOK | http://autobuild.buildroot.net/results/426ce9fc61bdba844e80cf3b74d46ffe3af6f738 |     
   xtensa    |          zchunk-1.2.2          | NOK | http://autobuild.buildroot.net/results/edfc23dc6d81457d035531cc03db03ba59f81c01 |     
  powerpc    |          zchunk-1.2.2          | NOK | http://autobuild.buildroot.net/results/ca6464dcfb2d6b8bb8c33173584f966a14994b04 |     
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/b12533e6ebcf56a5662c59b6f8051447eb3fb8aa | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/c0a9c1fa3012b4b09d7f9a03555a66daab95e767 | ORPH
microblazeel |           zstd-1.5.2           | NOK | http://autobuild.buildroot.net/results/d5e5717f0be49bd3e598235e0b0215f1fd844363 |     


Classification of failures by reason for 2022.02.x
--------------------------------------------------

tvheadend-1295dd2be863f5beb... | 3 
                    dhcp-4.4.3 | 1 
kvm-unit-tests-kvm-unit-tes... | 1 
                sg3_utils-1.47 | 1 
                    vlc-3.0.16 | 1 


Detail of failures for 2022.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |           dhcp-4.4.3           | NOK | http://autobuild.buildroot.net/results/8cb50af70355787920316c9671c84cca7da085e2 | ORPH
powerpc64le  | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/2cb402b8494908a8dc69fc4f6a6ed9767a58d79c |     
    m68k     |         sg3_utils-1.47         | NOK | http://autobuild.buildroot.net/results/d3b1aa5d811042ce1555cdeed02dd5c1f3797eb6 |     
   nios2     | tvheadend-1295dd2be863f5beb... | NOK | http://autobuild.buildroot.net/results/810d36821f4b6554f2f4b1f9923af2b79234fdd1 |     
    arm      | tvheadend-1295dd2be863f5beb... | NOK | http://autobuild.buildroot.net/results/6365649b6ab2bcd2fec5b49801f093c6b087eea3 |     
    sh4      | tvheadend-1295dd2be863f5beb... | NOK | http://autobuild.buildroot.net/results/9ee21189efc00f18cc57e4bd6634b2d6ed73fece |     
   nios2     |           vlc-3.0.16           | NOK | http://autobuild.buildroot.net/results/53b64edf2e81f8790a22df762e946910c2e98501 |     



-- 
http://autobuild.buildroot.net

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

