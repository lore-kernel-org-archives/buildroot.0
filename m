Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7FF1C636CC
	for <buildroot@archiver.kernel.org>; Sat, 11 Feb 2023 06:39:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2A53241924;
	Sat, 11 Feb 2023 06:39:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2A53241924
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xLsFVYFGp9ji; Sat, 11 Feb 2023 06:39:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 80BD541955;
	Sat, 11 Feb 2023 06:39:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 80BD541955
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DD4131BF3F0
 for <buildroot@lists.busybox.net>; Sat, 11 Feb 2023 06:39:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ACD0041730
 for <buildroot@lists.busybox.net>; Sat, 11 Feb 2023 06:39:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ACD0041730
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id f9OQrKR6pIKz for <buildroot@lists.busybox.net>;
 Sat, 11 Feb 2023 06:39:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0D2D34172F
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0D2D34172F
 for <buildroot@buildroot.org>; Sat, 11 Feb 2023 06:39:13 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 0A7E6FF80E
 for <buildroot@buildroot.org>; Sat, 11 Feb 2023 06:39:10 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sat, 11 Feb 2023 06:39:10 -0000
Message-Id: <20230211063917.ACD0041730@smtp2.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1676097551; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=XqrQqw39aP6U+S8rDk+DHbkE2lLZJIvHDoUzD8nbfxA=;
 b=iPSBRj5q6Xdg4WeVAwhYGonOJUK4i3V1FBGhTUm6haZeUx4DAgCBQ8PSkRdEqOybVNY0TA
 TCVxDUFDuAHDFp4iMnZx/zHWb+X0rT4rIQWY1NH7/d2ZN/DPaxOo4a7dEDrKmczuFhTsnh
 f8nOAjt+Th0vF4V/WYhC7lnX00Qf7dN/U9BxVeTnc/GUgO05llKDZzyS68iA2dH6W88Crz
 MtLY5meH/tWFfyIKpFZp0ipL4x9HzcwxaQCPmS49woSshYUumWs+CnG3Y4UEjeSVV5U4W0
 DWl2bLQDm80yHxn+aD0BYyyySAnuwcELOCndCTi9eHBaDSiLKU5t1fMC5RPr7Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=iPSBRj5q
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-02-10
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

Autobuild statistics for 2023-02-10
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  |  1  |  2  |  0  |  3  |
  2022.11.x  | 21  | 18  |  0  | 39  |
    master   | 169 | 190 |  2  | 361 |

Classification of failures by reason for master
-----------------------------------------------

  gobject-introspection-1.72.0 | 12
                elfutils-0.186 | 8 
                host-go-1.19.5 | 8 
                       unknown | 8 
                libsolv-0.7.22 | 7 
                   linux-6.1.9 | 7 
                   aubio-0.4.9 | 5 
                busybox-1.36.0 | 5 
              host-pahole-1.24 | 5 
            host-binutils-2.38 | 4 
               libglib2-2.72.3 | 4 
           python-bcrypt-4.0.1 | 4 
    python-cryptography-39.0.0 | 4 
              fluent-bit-2.0.8 | 3 
                gerbera-1.10.0 | 3 
glibc-2.36-81-g4f4d7a13edfd... | 3 
            host-binutils-2.39 | 3 
        ltp-testsuite-20220930 | 3 
                  zabbix-5.4.9 | 3 
              dropbear-2022.83 | 2 
fs/ubifs/ubifs.mk:49: /home... | 2 
         gobject-introspection | 2 
              host-rust-1.67.0 | 2 
              libgcrypt-1.10.1 | 2 
                libglvnd-1.4.0 | 2 
             libgpg-error-1.46 | 2 
                    norm-1.5.8 | 2 
                   perl-5.36.0 | 2 
                     php-8.2.1 | 2 
            ssdp-responder-1.9 | 2 
                 systemd-252.4 | 2 
                     ace-7.0.6 | 1 
                alsa-lib-1.2.8 | 1 
                  assimp-5.2.5 | 1 
  binutils-arc-2020.09-release | 1 
                  boost-1.80.0 | 1 
boot-wrapper-aarch64-8d5a76... | 1 
                    brltty-6.5 | 1 
             ctorrent-dnh3.3.2 | 1 
                 dmalloc-5.6.5 | 1 
                    dust-0.8.1 | 1 
        edk2-edk2-stable202208 | 1 
               fftw-quad-3.3.8 | 1 
             fontconfig-2.13.1 | 1 
fs/cramfs/cramfs.mk:46: /ho... | 1 
fs/cramfs/cramfs.mk:46: /ho... | 1 
fs/cramfs/cramfs.mk:46: /ho... | 1 
fs/cramfs/cramfs.mk:46: /ho... | 1 
fs/cramfs/cramfs.mk:46: /tm... | 1 
fs/jffs2/jffs2.mk:71: /home... | 1 
fs/romfs/romfs.mk:32: /home... | 1 
fs/ubi/ubi.mk:51: /home/aut... | 1 
fs/ubi/ubi.mk:51: /home/tho... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /tmp/... | 1 
fs/ubifs/ubifs.mk:49: /tmp/... | 1 
                 glibmm-2.68.2 | 1 
                   gqrx-2.14.4 | 1 
            host-binutils-2.37 | 1 
host-gdb-arc-2020.09-releas... | 1 
         host-sentry-cli-2.8.0 | 1 
                  jack2-1.9.21 | 1 
                  janet-1.26.0 | 1 
                   json-c-0.16 | 1 
                  kexec-2.0.25 | 1 
               libcap-ng-0.8.3 | 1 
        libnetfilter_log-1.0.2 | 1 
                   libnss-3.87 | 1 
          linux-5.10.162-cip24 | 1 
            linux-fusion-9.0.3 | 1 
          modem-manager-1.20.4 | 1 
            modsecurity2-2.9.7 | 1 
                    musl-1.2.3 | 1 
                  netsurf-3.10 | 1 
                    olsr-0.9.8 | 1 
              open-iscsi-2.1.8 | 1 
               openblas-0.3.21 | 1 
                opencv3-3.4.17 | 1 
package/multipath-tools/mul... | 1 
                   pcre2-10.42 | 1 
              php-xdebug-3.0.4 | 1 
           proxychains-ng-4.16 | 1 
                     pv-1.6.20 | 1 
           python-numpy-1.23.5 | 1 
           python-pyicu-2.10.2 | 1 
            quickjs-2021-03-27 | 1 
                ramspeed-2.6.0 | 1 
                 rtl_433-22.11 | 1 
       ti-k3-r5-loader-2022.10 | 1 
toolchain-external-codescap... | 1 
             uccp420wlan-6.9.1 | 1 
uclibc-ng-test-6790eafe897b... | 1 
ulog-0389d243352255f6182326... | 1 
uqmi-0a19b5b77140465c29e2af... | 1 
                 wolfssl-5.5.3 | 1 
                wtfutil-0.41.0 | 1 
                  xerces-3.2.4 | 1 
                     zfs-2.1.7 | 1 
               zxing-cpp-1.4.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 microblaze  |           ace-7.0.6            | NOK | http://autobuild.buildroot.net/results/69c56f97b60875af15a0f1f3d427fea516d0f0c9 |     
    or1k     |         alsa-lib-1.2.8         | NOK | http://autobuild.buildroot.net/results/d78262854daf4f9c0ec2a95aa8b51ae3914fa579 |     
    mips     |          assimp-5.2.5          | NOK | http://autobuild.buildroot.net/results/2036eb2e2de57685db039f7f15acdf92eaaa0f83 | ORPH
   x86_64    |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/b63aff4f78071417a8e3d0f9521ba0958aceee11 |     
   xtensa    |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/d7ce4b18815c29a81d40e9a8db7693b8f2724ece |     
   s390x     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/fcd36dfff65fb4785c371768daa0d1aa7423cb34 |     
  mips64el   |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/2960045d52a094678bdde1a5a389d51609d10679 |     
   armeb     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/12155d15370c23478f3e5e92c0858509ab2352d0 |     
   arceb     |  binutils-arc-2020.09-release  | NOK | http://autobuild.buildroot.net/results/20b8153f5bfb82e39452b17ea5ac595bdcfbf295 |     
   arceb     |          boost-1.80.0          | NOK | http://autobuild.buildroot.net/results/23ed4993a7b8e572bf3336baed775812d205b27b |     
  aarch64    | boot-wrapper-aarch64-8d5a76... | NOK | http://autobuild.buildroot.net/results/44287ccc8cc9767704642919e6d928d1f57b436d |     
microblazeel |           brltty-6.5           | NOK | http://autobuild.buildroot.net/results/8eeee331a5359e36e0c14708e1471e18a413dfb6 |     
  mips64el   |         busybox-1.36.0         | NOK | http://autobuild.buildroot.net/results/599e1e07364ff3512f1b0746fc439cf250163933 | ORPH
   mipsel    |         busybox-1.36.0         | NOK | http://autobuild.buildroot.net/results/4653420db351d716b4410fdba3c99ac89bbd395f | ORPH
    arm      |         busybox-1.36.0         | NOK | http://autobuild.buildroot.net/results/4840a3570301d11b9d6f80c18ef94781bca10732 | ORPH
  mips64el   |         busybox-1.36.0         | NOK | http://autobuild.buildroot.net/results/1fcaae98548d1d135bfdc240842f9bbe9bb7d9c0 | ORPH
    mips     |         busybox-1.36.0         | NOK | http://autobuild.buildroot.net/results/32f933867f71aa5ffdb1309ab720f267715e42dd | ORPH
  riscv64    |       ctorrent-dnh3.3.2        | NOK | http://autobuild.buildroot.net/results/d9c568415db17114bcded0c1e866ad2a84a7e619 |     
    i686     |         dmalloc-5.6.5          | NOK | http://autobuild.buildroot.net/results/b43b535f04ca5c8893e1da6c72acd90dc49d9aa7 | ORPH
  riscv64    |        dropbear-2022.83        | NOK | http://autobuild.buildroot.net/results/9fec37c57abf7e0a1fc55c7bf58f5dc955352b00 |     
  riscv64    |        dropbear-2022.83        | NOK | http://autobuild.buildroot.net/results/09cf3927d18ae4fa541977d7754f9685f508dcb4 |     
  sparc64    |           dust-0.8.1           | NOK | http://autobuild.buildroot.net/results/d0c40c0e65a70b8826e53f39f8881c5bc5521085 | ORPH
   x86_64    |     edk2-edk2-stable202208     | NOK | http://autobuild.buildroot.net/results/e1e255c9f9d030925a3c1f83dcd3f88b83883e31 |     
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/8831d1e320d42541ae64beb7643b6f4a440333df | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/d89d9141670f07eb2363a5d998ce946b8eda3094 | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/3e92a1334d195c588c55b0459b5caa65e4087755 | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/904e02fb832a10acd14fb502fd087540fd33f39d | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/86fe0f257e4d736f9f8e756ed747c1bce6b56aea | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/3f519075d1b56fac11e4f34f298a1bdb045c896f | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/058669a230c550dc3d0332a2535b2163006b22f4 | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/7217faa42917b71420a995869dc700498da590c7 | ORPH
powerpc64le  |        fftw-quad-3.3.8         | NOK | http://autobuild.buildroot.net/results/a7b33d49b83c1fddc7a17d323f4d06a965de1b0d | ORPH
   s390x     |        fluent-bit-2.0.8        | NOK | http://autobuild.buildroot.net/results/ce7302f077d51da25e3df1f02be76ab779c952d8 |     
   s390x     |        fluent-bit-2.0.8        | NOK | http://autobuild.buildroot.net/results/836e46e782eececed72a21235ce1dd7b5183a6f2 |     
   s390x     |        fluent-bit-2.0.8        | NOK | http://autobuild.buildroot.net/results/a15b2515fc8653aca1d8df7a62097fd23128adba |     
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/17095094df24655f2d427fdfedf2be4aeb449d0b | ORPH
    mips     | fs/cramfs/cramfs.mk:46: /ho... | NOK | http://autobuild.buildroot.net/results/ca69ce0923a5554fbe694817635f102b819ef57c |     
    arm      | fs/cramfs/cramfs.mk:46: /ho... | NOK | http://autobuild.buildroot.net/results/30c66e57f4fbd1fe426896f4e795402281923106 |     
  powerpc    | fs/cramfs/cramfs.mk:46: /ho... | NOK | http://autobuild.buildroot.net/results/0dc8fd412a2c2e063ff8ecdc310a177eced912a1 |     
   mipsel    | fs/cramfs/cramfs.mk:46: /ho... | NOK | http://autobuild.buildroot.net/results/966b5bf54a62c007d0b58048dcb9580c5e49108a |     
   armeb     | fs/cramfs/cramfs.mk:46: /tm... | NOK | http://autobuild.buildroot.net/results/e09045a05312d6eadfd6f3e589a4096ebb3ece70 |     
   x86_64    | fs/jffs2/jffs2.mk:71: /home... | NOK | http://autobuild.buildroot.net/results/0445b0b159919ddf25ccda2cf04c0aab6033721c |     
powerpc64le  | fs/romfs/romfs.mk:32: /home... | NOK | http://autobuild.buildroot.net/results/ba1c74a76fd0bcca47f46f81951765ea3ddcd92b |     
 aarch64_be  | fs/ubi/ubi.mk:51: /home/aut... | NOK | http://autobuild.buildroot.net/results/0bd3530c1f1eb315493ea56a868e40b7c6506047 |     
  riscv32    | fs/ubi/ubi.mk:51: /home/tho... | NOK | http://autobuild.buildroot.net/results/ca6b49c6360c8c566b381ac45db72b404cc3faf7 |     
powerpc64le  | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/eef3275b37f02b136d9335dba25d4fd0b9707617 |     
 powerpc64   | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/12408df70811689194d2c7783ed1ede0c8bfd4fd |     
   mips64    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/233022227907bfd988312ab968bbfb63d0782b7a |     
 microblaze  | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/8763f44444ab4f803bfe7829adf013b62e952c6d |     
 aarch64_be  | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/9d22bfc2a116c00a61c9208a9a6fdd2921d841ee |     
    i686     | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/3c816d2b7d6d209222ee33fcd546c08a57c6707f |     
  aarch64    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/f0afd0264318b9b2c97de4b002c2ba6fc10468fe |     
 powerpc64   |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/67c878dfda4a109acb96daac22086fe451a2a540 |     
  sparc64    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/f541f5b859b4744c07373e50f0eb3d60046bdde8 |     
  powerpc    | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/432f7113f5695f9cef10301cb8336f761006af70 |     
   arceb     | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/b980b2bfdbb2c07baf9c1a528d6d78193757fb15 |     
    arc      | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/cfb2ad76dc1c977ad2ce10d310577e149905e5ff |     
    or1k     |         glibmm-2.68.2          | NOK | http://autobuild.buildroot.net/results/06353e89aff157b86978ff92dee5546b94cca364 |     
   armeb     |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/a4bf6907ce8368fc50d06d6b1bcf1ae372a1ee8e |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/95ac2510e098fcd1b678dc56f955b8cf656ea048 |     
   s390x     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/40b6a3283361171b494a4e61e3575a4981328854 | ORPH
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/dcd2ce692b66ff1b744fdd271e336ddad35f8fe1 | ORPH
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/56de6b95ac1d085c743cac14a714dd308370c897 | ORPH
    or1k     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/5d70bfe310b9980b64687739eae12563d633a690 | ORPH
    or1k     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/a4b276935182ec3ad5790b8b7bfa1d71d72146b2 | ORPH
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/cd57cadbaffc34552cbe77e3b41b81a577ed5551 | ORPH
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/d00fe47cba797af5c772c60cc5a16b9e343f92de | ORPH
powerpc64le  |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/3a5b8afca39df46f72565fb84614926a091b6050 | ORPH
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/5d8eae466f39f77d33f0a893e7b568f434b15148 | ORPH
    mips     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/82c865bbca8ea6da68bd466d863bff7d46f4b54f | ORPH
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/e8d93c273779d05954de6a5f4e5a5ac99cae1d9a | ORPH
    or1k     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/a264ad20b70c13a3edcfb20da7fe85b1c755640c | ORPH
    or1k     |          gqrx-2.14.4           | NOK | http://autobuild.buildroot.net/results/862d1f33c183464ec226994b3754e223f4d89486 |     
 microblaze  |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/d5df12a9deb65395b34c242168723e40908984bd |     
    mips     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/21bb5ea5f1b2c83837ecc319bb00dae72a02564b |     
   armeb     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/5258f31067dc891a8d9d9a34893bcb90283b448a |     
 powerpc64   |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/eaf23ea0c8d7803e3768da40b7070d04801cd36f |     
   xtensa    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/3994150b82678476b7d7315cc3e069da1c9b1756 |     
microblazeel |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/def9284e3812a83ff6cc0f8724a6452b77fa1706 |     
   arceb     |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/5553103f634e585d8f12d4286731f366fc78db33 |     
    mips     |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/4e19b53e181563e8f39ffef24c5dadbbe90b9143 |     
    arc      | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/37593a4d773a2db59b4ad14ff3e5106b01b39bb9 | ORPH
  aarch64    |         host-go-1.19.5         | NOK | http://autobuild.buildroot.net/results/c578920d6c707aef6a6ecfc0c0969ab3c0129e45 |     
   mips64    |         host-go-1.19.5         | NOK | http://autobuild.buildroot.net/results/260f4e2579976a05ed6520eb11b9b768dd111995 |     
   mips64    |         host-go-1.19.5         | NOK | http://autobuild.buildroot.net/results/057724d45c5c203b1e1942c0f1bf6f089800dea4 |     
  mips64el   |         host-go-1.19.5         | NOK | http://autobuild.buildroot.net/results/60bcb2ef69b3d05a8fdde3d704438a88afad60c3 |     
    i686     |         host-go-1.19.5         | NOK | http://autobuild.buildroot.net/results/cafbbd095bc4fee66f604de40dfa946a93d05542 |     
    i686     |         host-go-1.19.5         | NOK | http://autobuild.buildroot.net/results/14d1faa36cb77d16cb62e8f4e11d3d38b7faa828 |     
   mips64    |         host-go-1.19.5         | NOK | http://autobuild.buildroot.net/results/2a433d5c042490c94827e66e7c68e71069248243 |     
    i686     |         host-go-1.19.5         | NOK | http://autobuild.buildroot.net/results/a2e1b730e9657c9bb00c25b56b0f87d2b37dcb6b |     
   x86_64    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/ca4be5ae25917030e8f9eb2e2d955b822b8eff3e |     
   mipsel    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/dfad059935c4fbf9e481213293edb4f4a077c356 |     
  sparc64    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/b5bf0595e4ffe3375c1dfd837febbd4d99052042 |     
  powerpc    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/8dca3dc4a4e7a1242b29f1d9d6761654171c04c7 |     
  mips64el   |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/abc6e62836061784014233711ef5770008b03720 |     
    mips     |        host-rust-1.67.0        | NOK | http://autobuild.buildroot.net/results/219c0f547939f67d8554c3a99b21220572a4f48d |     
  aarch64    |        host-rust-1.67.0        | NOK | http://autobuild.buildroot.net/results/6d6bbb624c4f8cb9ef0929254bc4ee81d3d66f99 |     
    arc      |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/97568843e87989cca4efbdab157fbc8f6cf95f56 |     
  sparc64    |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/e8af6668a74297049718afc3e9b575828cd22654 |     
  riscv64    |          janet-1.26.0          | NOK | http://autobuild.buildroot.net/results/e16a059a14756b75dcac154976325da8b610e870 |     
  riscv64    |          json-c-0.16           | NOK | http://autobuild.buildroot.net/results/f2f45280eb42aad317c5e63c586a0bbbead11509 |     
    arm      |          kexec-2.0.25          | NOK | http://autobuild.buildroot.net/results/60c8e0ff1ca3477a404e1bdc56cfdcb40f1f8d94 | ORPH
  riscv64    |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/50909cf4ab913d3d388ede498dcedd0f0ba50e17 |     
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/54385117cac35ee4aae677fc4532b6f3512f2239 | ORPH
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/46a879227ecb6ecbe379ede5dce4183522eb004e | ORPH
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/b06f0c9b042cb3d7c1c06bdf136d600725c6f3e8 |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/a96047f0fa2d58d344b27547c769d68b90abed1e |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/8d61a9df582fbf5b81754565788bfc38bdcdecc2 |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/fa10a96680ab62ea075e2b92fcc0cb8b7b3c26fd |     
    m68k     |         libglvnd-1.4.0         | NOK | http://autobuild.buildroot.net/results/eb53a7d1664e14ce34ea955c401ff89aabe3a888 | ORPH
   xtensa    |         libglvnd-1.4.0         | NOK | http://autobuild.buildroot.net/results/beeca8f8ef7c8ffc1f6c52ed61806314450fbc46 | ORPH
 aarch64_be  |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/9c05dc2d09e73f88a05f6e3281bbfd725f4401f7 | ORPH
 aarch64_be  |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/a24feaabeeb1249a48f22212f10b871985c27752 | ORPH
 powerpc64   |     libnetfilter_log-1.0.2     | NOK | http://autobuild.buildroot.net/results/51d4130b121218481a6aa48b121b5ac9d1610514 | ORPH
    sh4      |          libnss-3.87           | NOK | http://autobuild.buildroot.net/results/632833c0adcbd8b478e0488b025a7cb22eb3297e |     
  sparc64    |         libsolv-0.7.22         | NOK | http://autobuild.buildroot.net/results/66ae215a5c956b75bb8a1a6ecf72a3dde34477bd |     
 aarch64_be  |         libsolv-0.7.22         | NOK | http://autobuild.buildroot.net/results/0c469d08b4ccfcfff734bc45dfb6bdfcde29f2dd |     
   sparc     |         libsolv-0.7.22         | NOK | http://autobuild.buildroot.net/results/55f5ba0599d7697655097ddb05d0f1ebdcab1554 |     
    mips     |         libsolv-0.7.22         | NOK | http://autobuild.buildroot.net/results/e7d017d70b54923cecb991f97d238345e548e4e0 |     
    i686     |         libsolv-0.7.22         | NOK | http://autobuild.buildroot.net/results/217447a5bd99f6361878830e7a3aae8d6544fd1c |     
    arm      |         libsolv-0.7.22         | NOK | http://autobuild.buildroot.net/results/b4901401f0c214cae6868536c15933282368b6d8 |     
  mips64el   |         libsolv-0.7.22         | NOK | http://autobuild.buildroot.net/results/5d853985c2288dee4ae41645302082f12024eb63 |     
    mips     |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/a495c8324daeab27811c19ab11cf431e8bf2ae86 | ORPH
    m68k     |          linux-6.1.9           | NOK | http://autobuild.buildroot.net/results/070a33fe9c1a851e6634bafca3799632b5716af5 | ORPH
   mips64    |          linux-6.1.9           | NOK | http://autobuild.buildroot.net/results/360230507a62193c4baf7aafea97e07fd07ee86a | ORPH
  mips64el   |          linux-6.1.9           | NOK | http://autobuild.buildroot.net/results/c2cf7b1093cde39c2f2239ef73a2ae22da746a83 | ORPH
    mips     |          linux-6.1.9           | NOK | http://autobuild.buildroot.net/results/150436670a1c88c5d00a5e7c119721682d558e99 | ORPH
   armeb     |          linux-6.1.9           | NOK | http://autobuild.buildroot.net/results/35066f883cad10b3eb44c9139ceb067a50366540 | ORPH
    m68k     |          linux-6.1.9           | NOK | http://autobuild.buildroot.net/results/466586b45f6841b2066a1030f1eaf816f4354f9c | ORPH
   nios2     |          linux-6.1.9           | NOK | http://autobuild.buildroot.net/results/dd1d827b8e45b7c7be3334b5bd9faa3deb50d212 | ORPH
 powerpc64   |       linux-fusion-9.0.3       | NOK | http://autobuild.buildroot.net/results/00e107f80e4a2f5468e822382ff18635e6f9b795 | ORPH
   x86_64    |     ltp-testsuite-20220930     | NOK | http://autobuild.buildroot.net/results/eec2b7f982a1fb3cd286cdad3983b4054b82872d |     
   x86_64    |     ltp-testsuite-20220930     | NOK | http://autobuild.buildroot.net/results/600a9b5572bd1d76ff5c5870c0217ff80f05fdba |     
    arm      |     ltp-testsuite-20220930     | NOK | http://autobuild.buildroot.net/results/5adfde2ca7241595448093a39fd7f20fa7018570 |     
    arc      |      modem-manager-1.20.4      | NOK | http://autobuild.buildroot.net/results/4cc9b176a69730c4c965cfdcdb8c6ef03b6ecbaa |     
  powerpc    |       modsecurity2-2.9.7       | NOK | http://autobuild.buildroot.net/results/7db14c4c2b0c1a9fcdf3171c4f4fc7a336517322 |     
  powerpc    |           musl-1.2.3           | NOK | http://autobuild.buildroot.net/results/711fedf87e68e8c30c3de08b1e97c9dd8bc9678d |     
   armeb     |          netsurf-3.10          | NOK | http://autobuild.buildroot.net/results/a0a27d6a16cc8dbf56137696224ea039c94d28e1 |     
   xtensa    |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/9505050131fa3606cbe46db4b59e74a9fea99d36 | ORPH
powerpc64le  |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/030c479833c078a925bb52cca59b18475679861f | ORPH
 aarch64_be  |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/b9fdbb5b956085151c9138f559640198226368ed | ORPH
   mips64    |        open-iscsi-2.1.8        | NOK | http://autobuild.buildroot.net/results/6383536f7c320f305f8ebc32298e2f4f8651762c |     
  mips64el   |        openblas-0.3.21         | NOK | http://autobuild.buildroot.net/results/620df7cbc46fed31dea544be38ec67053803705c | ORPH
   x86_64    |         opencv3-3.4.17         | NOK | http://autobuild.buildroot.net/results/7136c0dbedf4b4d4a1af8ce1b75743f8d5af8120 |     
 aarch64_be  | package/multipath-tools/mul... | NOK | http://autobuild.buildroot.net/results/34f93139fc5924c42a64c1e65260223ebd0933c4 |     
   sparc     |          pcre2-10.42           | NOK | http://autobuild.buildroot.net/results/3522b9094096b8f32b81c4129988497183005b6c | ORPH
   nios2     |          perl-5.36.0           | NOK | http://autobuild.buildroot.net/results/e1099a9662610d935ef75378dfeffdaea4bad666 |     
   arceb     |          perl-5.36.0           | NOK | http://autobuild.buildroot.net/results/00ec006d8c1d7985fad0b3bfb9755c32094fc744 |     
    sh4      |           php-8.2.1            | NOK | http://autobuild.buildroot.net/results/aa10c677d366046d2ce2f22cb45288b3cbf73d22 |     
 microblaze  |           php-8.2.1            | NOK | http://autobuild.buildroot.net/results/50e451ca066583686c39f678d1ceee31b33bb634 |     
powerpc64le  |        php-xdebug-3.0.4        | NOK | http://autobuild.buildroot.net/results/092a6d388fc6801c109eb46635e8df80d06a803e |     
 aarch64_be  |      proxychains-ng-4.16       | NOK | http://autobuild.buildroot.net/results/a5c2955a51b67467e8a2771aa5d1ba64233d9882 | ORPH
   armeb     |           pv-1.6.20            | NOK | http://autobuild.buildroot.net/results/0301c4e3164961d15d1bd609fff8b81997288d94 | ORPH
    mips     |      python-bcrypt-4.0.1       | NOK | http://autobuild.buildroot.net/results/f2a9b1e87fd9368a674ddaeb44549f7629b5911b |     
    arm      |      python-bcrypt-4.0.1       | NOK | http://autobuild.buildroot.net/results/6d0f8a747b7a4018651862614e761dbc766a0db3 |     
   armeb     |      python-bcrypt-4.0.1       | NOK | http://autobuild.buildroot.net/results/e0355e37c0e34ba0f7b63d47114b6fdd42f11ad5 |     
    mips     |      python-bcrypt-4.0.1       | NOK | http://autobuild.buildroot.net/results/349fdbf4517ac64631e01c711d85a794059c2157 |     
 powerpc64   |   python-cryptography-39.0.0   | NOK | http://autobuild.buildroot.net/results/36eef44ae548e537204e180c26b0c83a426809c0 |     
   s390x     |   python-cryptography-39.0.0   | NOK | http://autobuild.buildroot.net/results/4ca3a4cd4fcfb5f0bae1260c947c30b41eca92fd |     
powerpc64le  |   python-cryptography-39.0.0   | NOK | http://autobuild.buildroot.net/results/b1cd417f47fe1f194d34536ed502c8973ef5635b |     
    i686     |   python-cryptography-39.0.0   | NOK | http://autobuild.buildroot.net/results/1c572bf05388f234bae277d30bb488869b2b2796 |     
 powerpc64   |      python-numpy-1.23.5       | NOK | http://autobuild.buildroot.net/results/1a878752baa7af34c5f8bf782c75989958a3613e |     
 microblaze  |      python-pyicu-2.10.2       | NOK | http://autobuild.buildroot.net/results/bf00db2a1c4ce526ec86c18533f5888774ede112 |     
    sh4a     |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/80a874b2a663751a8d632e5ef3bb76792d354133 |     
   sh4aeb    |         ramspeed-2.6.0         | NOK | http://autobuild.buildroot.net/results/861f3e01d053b5eddedfdd31813f99f2a2a0e7d4 | ORPH
   sparc     |         rtl_433-22.11          | NOK | http://autobuild.buildroot.net/results/fbd3e4d4ed6336c381b1491f61ecb7242adabbcf |     
 aarch64_be  |       ssdp-responder-1.9       | NOK | http://autobuild.buildroot.net/results/ea5246533bf010688e22d4fd84ed34d6f5fda499 |     
 aarch64_be  |       ssdp-responder-1.9       | NOK | http://autobuild.buildroot.net/results/00cb736e091c3678d7ea3b94ae6ed65cac216e09 |     
powerpc64le  |         systemd-252.4          | NOK | http://autobuild.buildroot.net/results/cc1c91f7e83e9232b54a17bfe667f0a518b1cbec |     
   s390x     |         systemd-252.4          | NOK | http://autobuild.buildroot.net/results/489e65e133e6bcb037b5ddb5c3863bae1811f84a |     
  aarch64    |    ti-k3-r5-loader-2022.10     | NOK | http://autobuild.buildroot.net/results/a0ef96a016f0d7c241c27dea4ebfe82fa6537793 |     
   mipsel    | toolchain-external-codescap... | NOK | http://autobuild.buildroot.net/results/4136ffe3872a6c5321ae47569d99b6f664636d4c | ORPH
 aarch64_be  |       uccp420wlan-6.9.1        | NOK | http://autobuild.buildroot.net/results/470437580a67dca024745569f7dee76e56293b2f | ORPH
  mips64el   | uclibc-ng-test-6790eafe897b... | NOK | http://autobuild.buildroot.net/results/70ec03368b30762e2ee99adf96403db8e8646f66 |     
    or1k     | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/2d4533b2a72fc8f42768189d1f8a2e35355218ee |     
  sparc64    |            unknown             | NOK | http://autobuild.buildroot.net/results/b770f8d578420684a15bde55a46fb8d12d996917 |     
    m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/313a804fada71f1a3fff8ef1600791c3a8fec637 |     
    i586     |            unknown             | NOK | http://autobuild.buildroot.net/results/e6895d64aa8a00b6c1893c3c438a9934be8997a4 |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/e1b4efbd1278e4ca2871f4669cea90dbcb29b8eb |     
    sh4a     |            unknown             | NOK | http://autobuild.buildroot.net/results/b8d04d62c97c1bbaadf0d244d0c1627efc3d0db9 |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/101b6ed3c8d724066cab1cc961d930aac4c9d787 |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/dfd34ac012415dba0d0c3dd1c2d40535324efa65 |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/dd6d71cb91df5495b873ceccec43a89977e66291 |     
   nios2     | uqmi-0a19b5b77140465c29e2af... | NOK | http://autobuild.buildroot.net/results/65e4b5c6dc028a4ab92d6966bbda3b6d2a164d4c | ORPH
   mipsel    |         wolfssl-5.5.3          | NOK | http://autobuild.buildroot.net/results/fb69a79d6431282978c1e56da501dce9ffb2b11d |     
   s390x     |         wtfutil-0.41.0         | NOK | http://autobuild.buildroot.net/results/29bb789c109b4debdf2d585a69ec489132f34d86 |     
    or1k     |          xerces-3.2.4          | NOK | http://autobuild.buildroot.net/results/c62856a5eeb34714f26235b2d6f8adc4ea612686 | ORPH
   nios2     |          zabbix-5.4.9          | NOK | http://autobuild.buildroot.net/results/4da3c4297cacd1d44c20995bcb35d51bb903683c |     
   mipsel    |          zabbix-5.4.9          | NOK | http://autobuild.buildroot.net/results/8f55506028ca3794a1a8ee1a4b8d2b766b4e5c09 |     
   mipsel    |          zabbix-5.4.9          | NOK | http://autobuild.buildroot.net/results/1e26212c1b4b4882c30f90c76172688d6c1156f8 |     
powerpc64le  |           zfs-2.1.7            | NOK | http://autobuild.buildroot.net/results/979bd7e58f897632707c7b538aa593532b36836e |     
  powerpc    |        zxing-cpp-1.4.0         | NOK | http://autobuild.buildroot.net/results/f01f4242773258137c129700336fbabef85768d7 |     


Classification of failures by reason for 2022.02.x
--------------------------------------------------

          janus-gateway-0.11.6 | 2 


Detail of failures for 2022.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |      janus-gateway-0.11.6      | NOK | http://autobuild.buildroot.net/results/abfedd152b767ff0067325f9158a618fb464c2a3 |     
  powerpc    |      janus-gateway-0.11.6      | NOK | http://autobuild.buildroot.net/results/13da462684437dba39e23cf1452034e4fe9ba1a7 |     


Classification of failures by reason for 2022.11.x
--------------------------------------------------

           janus-gateway-1.0.3 | 4 
                      xz-5.2.7 | 2 
                elfutils-0.186 | 1 
       freeradius-client-1.1.7 | 1 
fs/cramfs/cramfs.mk:46: /ho... | 1 
                 fwts-22.09.00 | 1 
                gerbera-1.10.0 | 1 
            host-binutils-2.38 | 1 
              host-pahole-1.24 | 1 
igh-ethercat-2e2cef61318953... | 1 
                    mutt-2.2.9 | 1 
           python-numpy-1.23.4 | 1 
                  zabbix-5.4.9 | 1 
                    zeek-4.1.1 | 1 


Detail of failures for 2022.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   arceb     |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/60ca7b46b24113adf6a75b0d40a8477a576d9b39 | ORPH
    or1k     |    freeradius-client-1.1.7     | NOK | http://autobuild.buildroot.net/results/8c231a13508cddb6de41c94c00f452b60103a03f |     
powerpc64le  | fs/cramfs/cramfs.mk:46: /ho... | NOK | http://autobuild.buildroot.net/results/67b1e5c3cf357f12a93d0b89bfce7c0c0481dd2e |     
    arm      |         fwts-22.09.00          | NOK | http://autobuild.buildroot.net/results/037053b71d9eff48a74974c02a1b3a6b63555c66 |     
  aarch64    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/a98fe77399518b49f3e5f7fa51a1331b58707347 |     
   mips64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/59739a27a0043911bfd8a801831f9e8397e76052 |     
   xtensa    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/2e36dd9d017b3cefca2544a13570ed725327c65f |     
    i686     | igh-ethercat-2e2cef61318953... | NOK | http://autobuild.buildroot.net/results/818cd81d81574c3c7169abc44c803cc69d10b8a7 |     
 microblaze  |      janus-gateway-1.0.3       | NOK | http://autobuild.buildroot.net/results/b7488860e6de3e5145665422afac4db1ea27838f |     
powerpc64le  |      janus-gateway-1.0.3       | NOK | http://autobuild.buildroot.net/results/ecd11e31667861211c3bf76f1155ab1653eb9f5c |     
  mips64el   |      janus-gateway-1.0.3       | NOK | http://autobuild.buildroot.net/results/9f2d6297851bc892addd4f2114e7a6066b06b20c |     
powerpc64le  |      janus-gateway-1.0.3       | NOK | http://autobuild.buildroot.net/results/bc96238427cba2669ba188014c71470545329824 |     
   mips64    |           mutt-2.2.9           | NOK | http://autobuild.buildroot.net/results/f64b8783acdc67e0334a0d26d2720c41326997dd |     
   x86_64    |      python-numpy-1.23.4       | NOK | http://autobuild.buildroot.net/results/ae4830b16e033583f2db20a7607bc58ce08bc17a |     
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/078362f36e5f3caa76d9a2b2b790cb726afeca4f | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/34689370c80d195efc66a5dce501616a10b4ea04 | ORPH
    or1k     |          zabbix-5.4.9          | NOK | http://autobuild.buildroot.net/results/1986532600b8e6b65abef3ca17d2efe88d2bc425 |     
    sh4      |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/911955c2e59f81bcf7f923aa91e5c5ac45d929f8 |     


Gitlab CI results for 2023-02-10
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
       atmel_sama5d3_xplained_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637586  |      
   atmel_sama5d3_xplained_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637587  |      
                 atmel_sama5d3xek | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637588  |      
           atmel_sama5d4_xplained | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637589  |      
       atmel_sama5d4_xplained_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637590  |      
       atmel_sama5d4_xplained_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637591  |      
   atmel_sama5d4_xplained_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637592  |      
                        avenger96 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637593  |      
                bananapi_m2_ultra | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637594  |      
                 bananapi_m2_zero | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637595  |      
                        bananapro | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637597  | ORPH 
                   beagleboardx15 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637598  |      
                       beaglebone | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637599  |      
                   beaglebone_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637600  |      
                     beagleboneai | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637601  |      
                          beaglev | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637602  |      
                      beelink_gs1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637603  |      
               broadcom_northstar | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637604  |      
                     canaan_kd233 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637606  |      
                   chromebook_elm | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637608  |      
                  chromebook_snow | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637609  |      
                             ci20 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637611  |      
                      cubieboard2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637613  |      
            engicam_imx6qdl_icore | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637615  |      
        engicam_imx6qdl_icore_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637619  |      
        engicam_imx6qdl_icore_rqs | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637621  |      
              engicam_imx6ul_geam | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637623  |      
             engicam_imx6ul_isiot | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637625  |      
               freescale_imx28evk | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637627  |      
        freescale_imx6dlsabreauto | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637629  |      
          freescale_imx6dlsabresd | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637632  |      
         freescale_imx6qsabreauto | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637634  |      
           freescale_imx6qsabresd | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637636  |      
          freescale_imx6sxsabresd | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637637  |      
             freescale_imx6ullevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637638  |      
           freescale_imx7dsabresd | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637639  |      
              freescale_imx8mmevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637640  |      
              freescale_imx8mnevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637641  |      
              freescale_imx8mpevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637642  |      
              freescale_imx8mqevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637643  |      
              freescale_imx8qmmek | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637644  |      
             freescale_imx8qxpmek | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637645  |      
               freescale_p1025twr | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637646  |      
             freescale_t1040d4rdb | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637647  |      
          freescale_t2080_qds_rdb | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637648  |      
           friendlyarm_nanopi_r2s | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637649  |      
                          galileo | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637650  |      
          globalscale_espressobin | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637651  |      
                 grinn_chiliboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637652  |      
                  grinn_liteboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637653  |      
                 hifive_unleashed | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637654  |      
                         imx23evk | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637655  |      
                   imx6-sabreauto | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637656  |      
                     imx6-sabresd | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637657  |      
                 imx6-sabresd_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637658  |      
                        imx6slevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637660  |      
                       imx6sx-sdb | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637661  |      
                        imx6ulevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637665  |      
                       imx6ullevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637666  |      
                       imx6ulpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637667  |      
                        imx7d-sdb | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637670  |      
                        imx7dpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637672  |      
                       imx8mmpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637674  |      
                imx8mn_bsh_smm_s2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637676  |      
            imx8mn_bsh_smm_s2_pro | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637677  |      
                        imx8mpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637679  |      
                        imx8mqevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637680  |      
                kontron_bl_imx8mm | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637683  |      
               kontron_pitx_imx8m | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637685  |      
              kontron_smarc_sal28 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637687  |      
                          lafrite | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637688  |      
                         lego_ev3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637689  |      
                    licheepi_zero | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637691  |      
               linksprite_pcduino | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637692  |      
                       ls1028ardb | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637695  |      
                mender_x86_64_efi | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637696  | ORPH 
          microchip_sam9x60ek_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637698  |      
      microchip_sam9x60ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637701  |      
 microchip_sama5d27_wlsom1_ek_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637702  |      
...hip_sama5d27_wlsom1_ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637704  |      
        microchip_sama5d2_icp_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637705  |      
    microchip_sama5d2_icp_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637707  |      
          microchip_sama7g5ek_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637710  |      
      microchip_sama7g5ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637711  |      
                  minnowboard_max | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637713  |      
                          mx25pdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637714  |      
                          mx51evk | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637716  |      
                         mx53loco | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637717  |      
                         mx6cubox | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637718  |      
                   mx6sx_udoo_neo | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637719  |      
                          mx6udoo | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637720  |      
                      nexbox_a95x | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637723  |      
                            nezha | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637725  |      
                      nitrogen6sx | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637726  |      
                       nitrogen6x | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637727  |      
                        nitrogen7 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637728  |      
                       nitrogen8m | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637729  |      
                      nitrogen8mm | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637730  |      
                      nitrogen8mn | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637731  |      
                      nitrogen8mp | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637732  |      
              octavo_osd32mp1_brk | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637733  |      
              octavo_osd32mp1_red | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637734  |      
                         odroidc2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637735  |      
                        odroidxu4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637736  |      
        olimex_a10_olinuxino_lime | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637737  |      
             olimex_a13_olinuxino | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637738  |      
        olimex_a20_olinuxino_lime | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637742  |      
       olimex_a20_olinuxino_lime2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637741  |      
       olimex_a20_olinuxino_micro | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637745  |      
             olimex_a33_olinuxino | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637747  |      
             olimex_a64_olinuxino | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637748  |      
          olimex_imx233_olinuxino | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637749  |      
    olimex_stmp157_olinuxino_lime | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637750  |      
                         olpc_xo1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637752  |      
                       olpc_xo175 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637751  |      
                    openblocks_a6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637753  |      
                    orangepi_lite | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637755  |      
                   orangepi_lite2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637754  |      
                     orangepi_one | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637756  |      
                orangepi_one_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637757  |      
                      orangepi_pc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637758  |      
                 orangepi_pc_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637759  |      
                      orangepi_r1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637760  |      
                    orangepi_zero | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637761  |      
               orangepi_zero_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637763  |      
              orangepi_zero_plus2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637762  |      
                       pandaboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637764  |      
                   pc_x86_64_bios | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637765  |      
                    pc_x86_64_efi | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637766  |      
                   pcengines_apu2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637767  |      
                           pine64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637768  |      
                    pine64_sopine | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637769  |      
                qemu_aarch64_ebbr | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637770  |      
                qemu_aarch64_sbsa | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637771  |      
                qemu_aarch64_virt | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637772  |      
                    qemu_arm_ebbr | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637773  |      
               qemu_arm_versatile | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637774  |      
                qemu_arm_vexpress | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637775  |      
             qemu_arm_vexpress_tz | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637776  |      
                qemu_m68k_mcf5208 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637777  |      
                   qemu_m68k_q800 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637778  |      
            qemu_microblazebe_mmu | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637779  |      
            qemu_microblazeel_mmu | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637780  |      
              qemu_mips32r2_malta | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637781  |      
            qemu_mips32r2el_malta | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637782  |      
              qemu_mips32r6_malta | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637785  |      
            qemu_mips32r6el_malta | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637786  |      
                qemu_mips64_malta | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637787  |      
              qemu_mips64el_malta | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637788  |      
              qemu_mips64r6_malta | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637789  |      
            qemu_mips64r6el_malta | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637790  |      
                 qemu_nios2_10m50 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637792  |      
                        qemu_or1k | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637793  |      
                 qemu_ppc64_e5500 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637794  |      
               qemu_ppc64_pseries | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637795  |      
            qemu_ppc64le_powernv8 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637796  |      
             qemu_ppc64le_pseries | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637797  |      
                  qemu_ppc_bamboo | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637798  |      
                  qemu_ppc_e500mc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637799  |      
                 qemu_ppc_g3beige | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637800  |      
                   qemu_ppc_mac99 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637801  |      
               qemu_ppc_mpc8544ds | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637802  |      
                qemu_riscv32_virt | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637803  |      
          qemu_riscv64_nommu_virt | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637804  |      
                qemu_riscv64_virt | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637805  |      
                       qemu_s390x | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637806  |      
                     qemu_sh4_r2d | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637807  |      
                   qemu_sh4eb_r2d | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637808  |      
               qemu_sparc64_sun4u | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637809  |      
                  qemu_sparc_ss10 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637810  |      
                         qemu_x86 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637812  |      
                      qemu_x86_64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637811  |      
                 qemu_xtensa_lx60 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637813  |      
           qemu_xtensa_lx60_nommu | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637814  |      
                      raspberrypi | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637824  | ORPH 
                     raspberrypi0 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637815  | ORPH 
                    raspberrypi0w | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637816  | ORPH 
                     raspberrypi2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637817  | ORPH 
                     raspberrypi3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637819  |      
                  raspberrypi3_64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637818  | ORPH 
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637820  | ORPH 
                     raspberrypi4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637823  | ORPH 
                  raspberrypi4_64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637821  | ORPH 
                 raspberrypicm4io | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637826  | ORPH 
              raspberrypicm4io_64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637825  | ORPH 
                raspberrypizero2w | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637827  |      
                        riotboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637828  |      
                           rock64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637829  |      
                       rock_pi_n8 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637830  |      
                        rockpro64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637831  |      
                      roseapplepi | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637832  |      
                 s6lx9_microboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637833  |      
                       sheevaplug | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637834  |      
                 sipeed_lichee_rv | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637835  |      
            sipeed_lichee_rv_dock | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637836  |      
                  sipeed_maix_bit | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637837  |      
           sipeed_maix_bit_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637838  |      
                 sipeed_maix_dock | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637840  |      
          sipeed_maix_dock_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637841  |      
                   sipeed_maix_go | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637842  |      
            sipeed_maix_go_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637843  |      
                 sipeed_maixduino | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637844  |      
          sipeed_maixduino_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637845  |      
               snps_arc700_axs101 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637846  |      
              snps_archs38_axs103 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637847  |      
                snps_archs38_haps | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637848  |      
                snps_archs38_hsdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637849  |      
                socrates_cyclone5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637850  |      
                solidrun_clearfog | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637851  |      
          solidrun_clearfog_gt_8k | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637852  |      
            solidrun_macchiatobin | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637853  | ORPH 
                    spike_riscv64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637855  |      
              stm32f429_disco_xip | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637856  |      
               stm32f469_disco_sd | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637858  |      
              stm32f469_disco_xip | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637861  |      
                  stm32mp157a_dk1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637862  |      
                  stm32mp157c_dk2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637863  |      
              stm32mp157c_odyssey | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637864  |      
        terasic_de10nano_cyclone5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637865  |      
              toradex_apalis_imx6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637866  |      
                           ts4900 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637867  |      
                           ts5500 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637868  |      
                           ts7680 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637869  |      
                         uevm5432 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637870  |      
                    versal_vck190 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637871  |      
                       visionfive | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637873  |      
                      visionfive2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637872  |      
                        wandboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637874  |      
                            warp7 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637875  |      
                        warpboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637876  |      
                    zynq_microzed | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637877  |      
                      zynq_qmtech | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637878  |      
                       zynq_zc706 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637879  |      
                         zynq_zed | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637880  |      
                zynqmp_kria_kv260 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637881  |      
                    zynqmp_zcu102 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637882  |      
                    zynqmp_zcu106 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3740637883  |      



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
