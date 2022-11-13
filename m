Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87061C4332F
	for <buildroot@archiver.kernel.org>; Sun, 13 Nov 2022 07:38:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CFAE5408E9;
	Sun, 13 Nov 2022 07:38:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CFAE5408E9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id prkKGwDYaQaH; Sun, 13 Nov 2022 07:38:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3F1F1408F2;
	Sun, 13 Nov 2022 07:38:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3F1F1408F2
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7CE501BF4E5
 for <buildroot@lists.busybox.net>; Sun, 13 Nov 2022 07:38:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6340940562
 for <buildroot@lists.busybox.net>; Sun, 13 Nov 2022 07:38:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6340940562
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id h70qIXgQMTW0 for <buildroot@lists.busybox.net>;
 Sun, 13 Nov 2022 07:38:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0B8EB400CF
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0B8EB400CF
 for <buildroot@buildroot.org>; Sun, 13 Nov 2022 07:37:59 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 210F8C0007
 for <buildroot@buildroot.org>; Sun, 13 Nov 2022 07:37:57 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sun, 13 Nov 2022 07:37:57 -0000
Message-Id: <20221113073803.6340940562@smtp2.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1668325077; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=GmINBkMrY9fgFD3eNdVdjoAqsMcWLfCh/T1mtOtM3js=;
 b=K+qJIbWwPJe7qkS2SUNvmG0f8vKwReVfwlDDhnhZ5Q9LXcI4+UxhJ/Hml1DWI5pAnOQNQ1
 QhqmQT2auVHc+fHzBPo1QViAASQX/ZVaxlj5nPL3BEdzerI60JG2GYesvWUPEcZDSD7nEl
 +k7rHDAdgu6blPdt5rt2sIsODTECO/fN1fzNUaH2+aD3ApGdVgzN3ir77dk4+DKUN1SwWu
 Nt0z/yiriUACtFMzu4LRKvvuG+rCMgkx0hE/PLbLFyTqCBzMFkwpd9naL3w8qVS/uhvwLy
 2KkEXziESMLcawuIXScRwnEt8EuGAmh27lzz0YonyjVrvKn7nSv5l7g1N7f5RA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=K+qJIbWw
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-11-12
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

Autobuild statistics for 2022-11-12
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  |  4  |  2  |  0  |  6  |
  2022.08.x  | 18  | 12  |  0  | 30  |
    master   | 166 | 186 |  0  | 352 |
     next    | 53  | 98  |  0  | 151 |

Classification of failures by reason for master
-----------------------------------------------

glibc-2.36-66-ga1dc0be03c9d... | 16
                   libnss-3.84 | 16
          imagemagick-7.1.0-51 | 12
            host-binutils-2.38 | 8 
                      xz-5.2.7 | 8 
                   linux-6.0.1 | 6 
                 dash-0.5.11.5 | 5 
              host-pahole-1.24 | 5 
             lirc-tools-0.10.2 | 4 
                       unknown | 4 
                gerbera-1.10.0 | 3 
  gobject-introspection-1.72.0 | 3 
                host-go-1.19.3 | 3 
              libgcrypt-1.10.1 | 3 
             libgpg-error-1.45 | 3 
afboot-stm32-3566acd582e553... | 2 
                     efivar-38 | 2 
              host-rust-1.64.0 | 2 
               libmdbx-0.11.12 | 2 
                linuxptp-3.1.1 | 2 
                   perl-5.34.1 | 2 
            quickjs-2021-03-27 | 2 
                      rauc-1.8 | 2 
/home/buildroot/autobuild/i... | 1 
/home/buildroot/autobuild/i... | 1 
/home/buildroot/autobuild/i... | 1 
                     ace-7.0.6 | 1 
                    bat-0.19.0 | 1 
             berkeleydb-5.3.28 | 1 
  binutils-arc-2020.09-release | 1 
                    brltty-6.5 | 1 
                 coreutils-9.1 | 1 
           crucible-2022.05.25 | 1 
                      crun-1.5 | 1 
             dahdi-linux-3.2.0 | 1 
                 dhcp-4.4.3-P1 | 1 
              dieharder-3.31.1 | 1 
           docker-cli-20.10.19 | 1 
              erlang-22.3.4.22 | 1 
                  exempi-2.6.1 | 1 
             f2fs-tools-1.15.0 | 1 
                 fdk-aac-2.0.2 | 1 
                   flann-1.9.2 | 1 
             fontconfig-2.13.1 | 1 
       freeradius-client-1.1.7 | 1 
               freetype-2.12.1 | 1 
                     frr-8.3.1 | 1 
fs/cramfs/cramfs.mk:46: /ho... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
                    gdal-3.5.1 | 1 
          gitlab-runner-14.5.1 | 1 
google-breakpad-c85eb4a59b6... | 1 
host-abootimg-1ebeb393252ab... | 1 
            host-binutils-2.37 | 1 
            host-binutils-2.39 | 1 
              host-delve-1.8.0 | 1 
         host-gcc-final-10.4.0 | 1 
            igh-ethercat-1.5.2 | 1 
                       kmod-30 | 1 
         libcpprestsdk-2.10.18 | 1 
                libkcapi-1.4.0 | 1 
                    libndp-1.8 | 1 
               libsigrok-0.5.2 | 1 
                libxml2-2.10.3 | 1 
      linux-5.10.145-cip17-rt7 | 1 
                     lxc-5.0.1 | 1 
                  matio-1.5.23 | 1 
              mdio-tools-1.2.0 | 1 
                mongodb-4.2.18 | 1 
             netsniff-ng-0.6.8 | 1 
            ocf-linux-20171122 | 1 
               openpgm-5-3-128 | 1 
             openresolv-3.12.0 | 1 
               poppler-22.10.0 | 1 
           proxychains-ng-4.16 | 1 
                     pv-1.6.20 | 1 
            python-scipy-1.8.1 | 1 
                python3-3.10.8 | 1 
                    qemu-7.1.0 | 1 
rtl8723bu-d79a676a8d3f0bb6a... | 1 
rtl8821au-4235b0ec7d7220a63... | 1 
                    sdl-1.2.15 | 1 
              traceroute-2.1.0 | 1 
                 uclibc-1.0.42 | 1 
               valgrind-3.19.0 | 1 
                  vlc-3.0.17.4 | 1 
                 wavemon-0.9.4 | 1 
                 wolfssl-5.5.3 | 1 
                xenomai-3.0.10 | 1 
                  xxhash-0.8.1 | 1 
                    zeek-4.1.1 | 1 
                       zip-3.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  sparc64    | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/725ba4b7582efa17ae42276a008f00d57723d600 |     
   s390x     | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/9bd0103433551466ca5ffa36c71c39a3235850ba |     
    arm      | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/2c1dc9e9168aef8904c78b8ac23b657dacc8a48a |     
powerpc64le  |           ace-7.0.6            | NOK | http://autobuild.buildroot.net/results/48f24d1f85a5451a9d305dd132b2b4b273b8b75c |     
    arm      | afboot-stm32-3566acd582e553... | NOK | http://autobuild.buildroot.net/results/d637293bdc74c55e2cc9d528ec8e5b03e722d6a0 |     
    arm      | afboot-stm32-3566acd582e553... | NOK | http://autobuild.buildroot.net/results/fb9ab94d0bed270e242dd2b065084fce3870ecf6 |     
   mipsel    |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/878fcb5eccf891a4477edd7bb9a68515de9b25dc |     
   sh4eb     |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/b74964d4a3c36ca9811b2958e9a1521a9481cc9f | ORPH
    arc      |  binutils-arc-2020.09-release  | NOK | http://autobuild.buildroot.net/results/bc8f754dd9fe61a80605c82bf6c35f39d2293717 |     
   mipsel    |           brltty-6.5           | NOK | http://autobuild.buildroot.net/results/85622197d55c3794eeef5273915457e1e4cfaee0 |     
   sh4aeb    |         coreutils-9.1          | NOK | http://autobuild.buildroot.net/results/fbfbd1a4280abc990d931a3d9df502b7d5de1df0 | ORPH
    i686     |      crucible-2022.05.25       | NOK | http://autobuild.buildroot.net/results/50589b9a96facb37eb7fb30721ba7478dec1da5e |     
    or1k     |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/63800c44434bcd46a505aa4918ad9cc492f386ea |     
   mips64    |       dahdi-linux-3.2.0        | NOK | http://autobuild.buildroot.net/results/552625e5bd263c56bcd025544f68223b5c990f63 |     
   sh4eb     |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/e5dbe2a3e09f1b92aed9c76620602cfa07214149 | ORPH
   xtensa    |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/666dceddd6a01c73276ac10bc3c79982c3a3b32d | ORPH
  sparc64    |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/eba7ba1c71755f8e5970b0dd26a0630c1ddd2449 | ORPH
 aarch64_be  |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/35fd2a999e654c281577961f6596d46341b7f613 | ORPH
   sparc     |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/56d60598e5885ed17fb059275f69af0ae4338e16 | ORPH
   xtensa    |         dhcp-4.4.3-P1          | NOK | http://autobuild.buildroot.net/results/51c5e42c782515dc3ae0f96cdd4d2da37199912c | ORPH
 microblaze  |        dieharder-3.31.1        | NOK | http://autobuild.buildroot.net/results/f5c9948fb800dec7a8b015fe703ac279b2b705e4 |     
   s390x     |      docker-cli-20.10.19       | NOK | http://autobuild.buildroot.net/results/02e28bf9231612fdbb4d271283f5611a2fa13ae9 |     
    arm      |           efivar-38            | NOK | http://autobuild.buildroot.net/results/00fac12608d4c836351a5308b9c52e765ad2ca70 |     
  mips64el   |           efivar-38            | NOK | http://autobuild.buildroot.net/results/546ce634b4a69ec40bd84df4db469005cc22f95c |     
  aarch64    |        erlang-22.3.4.22        | NOK | http://autobuild.buildroot.net/results/efce88c4c0873015c2dac2808780c34915b77692 |     
    arm      |          exempi-2.6.1          | NOK | http://autobuild.buildroot.net/results/302b93fdcc6a62f8ccc42b1e78d781ab94997e32 |     
    or1k     |       f2fs-tools-1.15.0        | NOK | http://autobuild.buildroot.net/results/ea769154707875216ef071978904cc2a2b14ba47 |     
   x86_64    |         fdk-aac-2.0.2          | NOK | http://autobuild.buildroot.net/results/7557ab0a81832829a2e5d689172b545b3270b833 |     
    mips     |          flann-1.9.2           | NOK | http://autobuild.buildroot.net/results/33a6b1691ec11127c06adc8fe654214451b189ab |     
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/2c233767bfb3efe0c125fa0b6a2c4e4efc4b0da7 | ORPH
  riscv64    |    freeradius-client-1.1.7     | NOK | http://autobuild.buildroot.net/results/3b387b9ade5ae30d33fb3f238cb4c1069f822a25 |     
   s390x     |        freetype-2.12.1         | NOK | http://autobuild.buildroot.net/results/169b876de9ed07a81c6e4b8d09627ba3d7b27c88 |     
  mips64el   |           frr-8.3.1            | NOK | http://autobuild.buildroot.net/results/a6affd0ada2b3ebeae84a3af81ac04c43ae89cc8 |     
    arc      | fs/cramfs/cramfs.mk:46: /ho... | NOK | http://autobuild.buildroot.net/results/55774df26177d09f67dc9669ad9677caa505d1a6 |     
   xtensa    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/b8b73327fb9ef0f439fac716f8c33e4c7ace8607 |     
    arm      | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/5a8c67b0f8423faa30f0a57b700fc616fb13165f |     
   nios2     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/d6a163d98464261ea7827b5e2f5baa58526f9b7c |     
    or1k     |           gdal-3.5.1           | NOK | http://autobuild.buildroot.net/results/179f161e424530cf9178b1ceaef6f8a4aadf619e |     
  aarch64    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/315b4d0ce3e2e78fbac6077c54fb8cfd968ab634 |     
    or1k     |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/5b1b006d46f017c00441244cade6f76ecf928eb1 |     
   nios2     |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/5b1d1ff1fc11dd550ac4015a5439ed1accc9a7ee |     
  riscv64    |      gitlab-runner-14.5.1      | NOK | http://autobuild.buildroot.net/results/fba21633696467c70f9234441fe3b1a5369e9c8d |     
   arceb     | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/a0c34c8a30a9ab42aedccf34bb6ef0bce25023ad |     
powerpc64le  | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/a5eeaba024e7442cb2fa008f1822ab94af21cd7b |     
  powerpc    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/4ab9b78937516e80b20df92842930531d866a97e |     
   mipsel    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/bd8ed031c8a5e81f5700360a6401b721a32670fa |     
microblazeel | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/1b966c5e88880378ca433da61f0dfb9a7f362e3f |     
 microblaze  | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/b24ee4b7b6049ef8233bce4676ed7581de3d4777 |     
   nios2     | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/a89c11b57d86dfa5334780442068579b25e474bd |     
 powerpc64   | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/ff9b49a1446696bae497cf63b3916fa6922b8997 |     
 microblaze  | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/e4b71135b3e660a44501faaf626862b2e32997c7 |     
  powerpc    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/a034db1ca1450eeaedb97e84f3c6ef22d842cfbc |     
microblazeel | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/f30e21462767ec95a98b39bbc61437a89b0f6db2 |     
 microblaze  | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/096209fe3a5e636ff40cd7bac466443f8e79c877 |     
   nios2     | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/d313d474bab84f4345768c8d2fc633f0f13f47cd |     
    mips     | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/0752bc01f48d9487d22094fa404d7806894d515e |     
powerpc64le  | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/ab1b4674e4fd62833a25f337884dfaa1d29fb31f |     
microblazeel | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/d73373560951ec48367988b30e0a0eba51462d19 |     
powerpc64le  |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/f5c36bff4f370d7f91b1d754982ec40480104f88 | ORPH
    i686     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/dabeb761aac5b12c44dab16c6770cfac830efb19 | ORPH
powerpc64le  |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/061a3defb74b4d0358e84f26167548e9a8e01fe0 | ORPH
    arm      | google-breakpad-c85eb4a59b6... | NOK | http://autobuild.buildroot.net/results/083be88805fa92cf233175cbcee5a4c1ab94fee0 |     
   nios2     | host-abootimg-1ebeb393252ab... | NOK | http://autobuild.buildroot.net/results/00479404395ac3c4670a578e01da6a6365f46629 |     
powerpc64le  |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/f08dc0f57ee0678422c9810da9236a6185a9e826 |     
   mipsel    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/cb2861f77c2fd47efdc3af24390f4f55ba5b008e |     
   nios2     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/4942c625807970a55a49fe725bc06581b53245f5 |     
   armeb     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/091cc669a7420145b5d718eee895794b5dd5854f |     
powerpc64le  |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/6b7bf1ba58238ace269a760f1cea4c5df288a943 |     
    m68k     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/ffc7868eb899fb6bb2d13da75853cd82cf1de9a1 |     
   s390x     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/23a69f13b1ec3e18492a4e480b992aff276fdd19 |     
   xtensa    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/bc3ed9a3234f686d1b59efa2181f2b41099f349e |     
    i686     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/6b020a0d6a20186e42476ec3c08a60f0fbc6ced6 |     
   arceb     |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/7046a3c64603203a92baf2cd5c00c2a91bcca281 |     
  riscv64    |        host-delve-1.8.0        | NOK | http://autobuild.buildroot.net/results/ef33d624146f9c2920a1c3b9ed2e773e943d57a9 |     
 microblaze  |     host-gcc-final-10.4.0      | NOK | http://autobuild.buildroot.net/results/6e5a348144ff886ac0c27f05ea62d429eff1a2ef |     
  mips64el   |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/9c7777096632ba73ac6485373bde7c11c1510935 |     
    i686     |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/c9a5e087ee5a787896e352ef99c85341d4764f8b |     
powerpc64le  |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/7968854e1b9c90e1000e8b7fc1be8361a12f77e5 |     
powerpc64le  |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/42d52cb75a7f7262713fc79b7010650201e73b3c |     
    arm      |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/4aad37c585926b8df5900d0bc3b8e5355c57bc8b |     
 microblaze  |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/deadafa7b38ca11b82b2e86985068942f2711056 |     
   x86_64    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/0f44ebf14ed7a0db4d6e8a5dcdad9bac53d23f19 |     
    i686     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/a9caa95275f41145a9feb8229598baceb19a5c71 |     
 powerpc64   |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/bdeac80fa36c8d196303949e0f6def00f2386201 |     
   x86_64    |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/8bb0c71a1ac953fa06be06bd0f17e32c54f0544e |     
powerpc64le  |       igh-ethercat-1.5.2       | NOK | http://autobuild.buildroot.net/results/4dc9b71c805a8156bcf8f398edd3a30f2b6ac6da |     
  sparc64    |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/c4668c3495e297991d6f52cd508441618cf6c189 | ORPH
  sparc64    |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/52d4017a681621494d9d73728515c297087544e1 | ORPH
 aarch64_be  |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/dd0856f24eb027e681bbc63f3793995cee997c0b | ORPH
    m68k     |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/8d0c82c303e343282f4a79bd688d60f375fd32bc | ORPH
 microblaze  |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/81ad1c4a8b92ca4bc9e4f0ad34bbcd1ad85f7c9b | ORPH
  mips64el   |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/886f418a8120233894ed9f03ed948528780ac201 | ORPH
   nios2     |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/5d8df12bae9222c6f500e146935ed86057f8b89e | ORPH
   arceb     |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/f8f97c53ba5896d9a3791ca07cb835edea6250e7 | ORPH
   sh4eb     |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/df76278a9ce3bdfe6632612a47954ef5e1ef4d98 | ORPH
   mipsel    |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/c16a8010519e5d353a7e168c3539c3a86da67ec6 | ORPH
   mips64    |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/e11e47ba110918502daaebb493d10fecf772a652 | ORPH
    arm      |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/5fe0f491e6e5bb882466ae21cd67a296603a9258 | ORPH
   x86_64    |            kmod-30             | NOK | http://autobuild.buildroot.net/results/45043f7bacd2510bc1b2361201df5d3a4a355df0 |     
   arceb     |     libcpprestsdk-2.10.18      | NOK | http://autobuild.buildroot.net/results/cba66d17d3a53f64c37e987cd010c197727f7fce | ORPH
    i486     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/036b203db7c0a510e0a670860e9d823ce64b33c1 | ORPH
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/5b9221e057195602bc37297af704b7854a02e072 | ORPH
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/ee54bd78cb9ac49a308163fef05c7a31f11fab42 | ORPH
 aarch64_be  |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/552ab753e9056a06b539aa5c85173eea8d31ab29 | ORPH
 aarch64_be  |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/e6d515ada012391ae68f827931a03ecbf04c160e | ORPH
  aarch64    |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/17aefe59f4e30679bb1654b39df9398acb5b7c0b | ORPH
microblazeel |         libkcapi-1.4.0         | NOK | http://autobuild.buildroot.net/results/9a94636f5924a934054a5fa72f071c912dcb1103 |     
   sh4aeb    |        libmdbx-0.11.12         | NOK | http://autobuild.buildroot.net/results/586ff17755d7095f1fcc5c40db09385b6713d3a5 |     
    mips     |        libmdbx-0.11.12         | NOK | http://autobuild.buildroot.net/results/c6017cd593b93b0191f07b8a5dd8185a5b6401d7 |     
  riscv64    |           libndp-1.8           | NOK | http://autobuild.buildroot.net/results/72b7ed4c3b8849b777fa1d830dbd54533f43ef03 |     
    mips     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/6b7e3c49f215ed726f442714e30c23d7d7ed7923 |     
   sh4eb     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/b896147b459f28613c5962abd775e0c11648eda5 |     
    mips     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/65f5fcb54321632cb0ea874c2f13c6ddcfd0f48a |     
 aarch64_be  |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/fff546650716f73e00c89adf38640a619c759aaa |     
    sh4      |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/253c2e9e3d14b43bf9577b00a2eff2a3ce54e549 |     
   x86_64    |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/74527e9128ca676a96b9790156e379d55908c975 |     
   nios2     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/286c0a971d60e78f18b1536616ebc095b445b182 |     
  mips64el   |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/af5b90c9a7af771f431bccf36ce3b167e3d13197 |     
    i586     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/0f3b6d0301066b162a6b791c3246114db1c28bf7 |     
  aarch64    |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/93bce6a0e4ed7c3d4d294eac2db8d4123f20766f |     
  aarch64    |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/8e89fb216f27d3b43c7037867a01c87e0375528a |     
   x86_64    |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/6ee88dd9a7873ec144129ac3884b191401f8e964 |     
   xtensa    |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/1767f08ac342ea79525049d49c913fe4fe6bb3b4 |     
  sparc64    |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/c7ea37ec636fbe955bacb9c5c891a8a4f32fc3ca |     
   x86_64    |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/752349c40f97658235606d2ea4b3c92a8c0ee5da |     
   mips64    |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/078da2d52265dbda2fd45128fa4d04a1f38680c4 |     
   mipsel    |        libsigrok-0.5.2         | NOK | http://autobuild.buildroot.net/results/e42f59e0a12ed551d63a1e28075c36de8166de04 |     
   mips64    |         libxml2-2.10.3         | NOK | http://autobuild.buildroot.net/results/612c8398c6304293ffd28f22584806d2fc5c1773 |     
  mips64el   |    linux-5.10.145-cip17-rt7    | NOK | http://autobuild.buildroot.net/results/6468552b23f8cabeb2dbcb8600c1e852b4b14218 | ORPH
   mips64    |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/e4259e275050132656ac9be44f9dfac10f3eee3b | ORPH
   s390x     |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/00376c9520c72da9b0c6c09040dd2141f2bb023a | ORPH
   s390x     |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/0794b547f853212ed140d9f1a088cdeb1985886a | ORPH
    arc      |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/4985f1e1069fc579332e0205269dcb70a7c7f680 | ORPH
   mipsel    |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/f8c010b0fc8b2ab58730c84b75581ef1ce94f939 | ORPH
   sh4aeb    |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/3afdc4b1c28037b1d0bddb53db01df9cff1133f8 | ORPH
   x86_64    |         linuxptp-3.1.1         | NOK | http://autobuild.buildroot.net/results/32e4e889d3c76ec2efa0382bff9ec714a446a08d |     
    or1k     |         linuxptp-3.1.1         | NOK | http://autobuild.buildroot.net/results/97872947125a797867bf19ab77010acbd83b0dea |     
 aarch64_be  |       lirc-tools-0.10.2        | NOK | http://autobuild.buildroot.net/results/380537d1ab9271e58b0766d9ada03477c1d933f6 | ORPH
   nios2     |       lirc-tools-0.10.2        | NOK | http://autobuild.buildroot.net/results/2b1feeec7c29236983d560b91e5d54e23b5ace41 | ORPH
   mipsel    |       lirc-tools-0.10.2        | NOK | http://autobuild.buildroot.net/results/f5395b178d1de29146bf33e5531dca1a7255da6b | ORPH
   s390x     |       lirc-tools-0.10.2        | NOK | http://autobuild.buildroot.net/results/808b415fd18540ae0652b1d722cbadcaef53b117 | ORPH
 aarch64_be  |           lxc-5.0.1            | NOK | http://autobuild.buildroot.net/results/d81c9694c4ac36b2d303383b8562c2820f870766 |     
   nios2     |          matio-1.5.23          | NOK | http://autobuild.buildroot.net/results/e02c71544a68f65190b37a4ad436c9584e8bdc5d |     
  riscv64    |        mdio-tools-1.2.0        | NOK | http://autobuild.buildroot.net/results/c53aaeaa34dd4d6d9a57da196687beecaeed9fe2 |     
  aarch64    |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/9b3b66c09b66b1dc1ed87de25ec3bd4f8ea63d49 |     
   nios2     |       netsniff-ng-0.6.8        | NOK | http://autobuild.buildroot.net/results/05510a8619c7fe875a4624bb1fbc2d6f8fc1f762 |     
  aarch64    |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/3a4deb1b1c78c0224de8ec7b68627fae538b3770 | ORPH
   s390x     |        openpgm-5-3-128         | NOK | http://autobuild.buildroot.net/results/4c04d7d8894c9cc7f27d8021f59aa869513089d5 |     
   arceb     |       openresolv-3.12.0        | NOK | http://autobuild.buildroot.net/results/caa60907b5ed0daeac0292c8abe5db88b3e3bd80 |     
   nios2     |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/0baa0162c94b4079b5bbfa673b7556c284ff34d9 |     
    m68k     |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/d7c585b28dbf690cbc10c196ed296793649c613e |     
   xtensa    |        poppler-22.10.0         | NOK | http://autobuild.buildroot.net/results/cd8b7b9a9bbb68b65c70a7e111bce1a3a243d3d7 |     
  aarch64    |      proxychains-ng-4.16       | NOK | http://autobuild.buildroot.net/results/f88749ac4b819dbb50d9164f1a4292ebfed238ab | ORPH
   armeb     |           pv-1.6.20            | NOK | http://autobuild.buildroot.net/results/e5f3bf181d6bca6d65b7696bc75fe15ff514f70c | ORPH
    sh4      |       python-scipy-1.8.1       | NOK | http://autobuild.buildroot.net/results/a1a445894926296f777f22cd7abae2b725c92644 |     
  powerpc    |         python3-3.10.8         | NOK | http://autobuild.buildroot.net/results/184ced80868926d14c29ed0a7917f453eeb731a4 |     
    mips     |           qemu-7.1.0           | NOK | http://autobuild.buildroot.net/results/8c7f6dd1e597fddebcfde10a2aa75e987dcc02f8 |     
    or1k     |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/981ddb459686b3cc6a1659ddfdf399622cf9bb89 |     
microblazeel |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/bd14487cf672cbb640f351520aecf04c3b0927d9 |     
    or1k     |            rauc-1.8            | NOK | http://autobuild.buildroot.net/results/a52d117553d47202cbf6ddf6e33747982ef249ef |     
    i586     |            rauc-1.8            | NOK | http://autobuild.buildroot.net/results/c153d98419eafcd6eea1ac448f9993c71c4c92e9 |     
    or1k     | rtl8723bu-d79a676a8d3f0bb6a... | NOK | http://autobuild.buildroot.net/results/28fe756260b88c910b1d15500f395feac81ec939 |     
microblazeel | rtl8821au-4235b0ec7d7220a63... | NOK | http://autobuild.buildroot.net/results/fb013225a8d59a9eb9a97356a72ee53c09fb29c0 |     
   sh4eb     |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/d5a2ce1688d9d7976e4da52b60a536fee300f3fd | ORPH
    arm      |        traceroute-2.1.0        | NOK | http://autobuild.buildroot.net/results/5afc814a1a54c686876ba8f46429f6c5f17f000e |     
  riscv64    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/cbee2a1b6217310a51c8bf89257b15c00a3e1a54 |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/08268292f7efcc9a84ebde6e35fd6ff9c62fe4e8 |     
   armeb     |            unknown             | NOK | http://autobuild.buildroot.net/results/f1d9e0c02fba310b78b449ea6c9822c842e32953 |     
   arceb     |            unknown             | NOK | http://autobuild.buildroot.net/results/912e910c185fde362830deceb1b59db53fd393e0 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/f3fd61411f94817ce3f8151b184109e9cb3b76b1 |     
  powerpc    |        valgrind-3.19.0         | NOK | http://autobuild.buildroot.net/results/d78cf9c569c8ecbf176e3b3440d6c936e065bff9 | ORPH
   x86_64    |          vlc-3.0.17.4          | NOK | http://autobuild.buildroot.net/results/9710753984a38b8c6f83a136b39c3bc320ba558b |     
  aarch64    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/4ff51fd4f39397f53c328ecab6be3ae8d31f88a8 | ORPH
  riscv32    |         wolfssl-5.5.3          | NOK | http://autobuild.buildroot.net/results/9fcdd2d748edfdb51da998adc0ec29df49df9138 |     
   sh4eb     |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/dea6329698e8b53943c90c74e027ef5ae42a8495 |     
    arm      |          xxhash-0.8.1          | NOK | http://autobuild.buildroot.net/results/995440f3572e32365cd58ef3e02a8cf6f3312931 | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/d66604168942758b51f7e0fa081df6eecb4d892a | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/6b573e5e1fda94c63b1aac97c0e121df9476ad54 | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/edd1f6e5d781abb635af381c14ba6f4e753d8bf6 | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/973e36b70d965d9f20978955217969b351604627 | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/123bc4760d167e52b3968e8337d16ccd456b4690 | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/eb134d949f291faa7bed55f55783fe522de4e582 | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/d65c4687fed690a95ef57b8df81b9047b0cc87a5 | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/fceac529bd1d7e3eb400616e12de9426aec1464c | ORPH
 powerpc64   |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/dc2779d5d1c5271c04cca294a3667caecfa45e07 |     
    arm      |            zip-3.0             | NOK | http://autobuild.buildroot.net/results/679a80998c025d2d4d08be957165a3d701d84edc |     


Classification of failures by reason for next
---------------------------------------------

glibc-2.36-66-ga1dc0be03c9d... | 7 
          imagemagick-7.1.0-51 | 7 
                   libnss-3.84 | 7 
                   aubio-0.4.9 | 4 
                  jack2-1.9.21 | 4 
                      crun-1.5 | 3 
            host-binutils-2.38 | 3 
                host-go-1.19.3 | 3 
                libkcapi-1.4.0 | 3 
         s6-linux-init-1.0.6.3 | 3 
                 dash-0.5.11.5 | 2 
                elfutils-0.186 | 2 
  gobject-introspection-1.72.0 | 2 
              host-pahole-1.24 | 2 
                       kmod-30 | 2 
                libmad-0.15.1b | 2 
                    lxc-4.0.12 | 2 
            python-bunch-1.0.1 | 2 
                  acpid-2.0.34 | 1 
              alsa-utils-1.2.8 | 1 
               apcupsd-3.14.14 | 1 
  binutils-arc-2020.09-release | 1 
                  boost-1.80.0 | 1 
                 dhcp-4.4.3-P1 | 1 
                    dust-0.8.1 | 1 
                   flann-1.9.2 | 1 
             fontconfig-2.13.1 | 1 
fs/ubifs/ubifs.mk:49: /tmp/... | 1 
fs/ubifs/ubifs.mk:49: /tmp/... | 1 
fs/ubifs/ubifs.mk:49: /tmp/... | 1 
                  gensio-2.5.5 | 1 
                     gmp-6.2.1 | 1 
host-abootimg-1ebeb393252ab... | 1 
            host-libtool-2.4.6 | 1 
    host-python-greenlet-2.0.0 | 1 
            igh-ethercat-1.5.2 | 1 
               libcodec2-1.0.5 | 1 
               libglib2-2.72.3 | 1 
                   linux-6.0.1 | 1 
                linuxptp-3.1.1 | 1 
                numactl-2.0.16 | 1 
            ocf-linux-20171122 | 1 
               openblas-0.3.21 | 1 
               openpgm-5-3-128 | 1 
                p11-kit-0.24.1 | 1 
               pcsc-lite-1.9.9 | 1 
                   perl-5.34.1 | 1 
                    php-8.1.12 | 1 
                     pv-1.6.20 | 1 
           python-bcrypt-4.0.1 | 1 
                 snmppp-3.4.10 | 1 
                 socat-1.7.4.4 | 1 
                tealdeer-1.6.1 | 1 
uqmi-0a19b5b77140465c29e2af... | 1 
                  xvisor-0.3.1 | 1 
                      xz-5.2.7 | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   arceb     |          acpid-2.0.34          | NOK | http://autobuild.buildroot.net/results/738dc1fe311ad183281b0db83dcd5aaf0f84d07c | ORPH
  mips64el   |        alsa-utils-1.2.8        | NOK | http://autobuild.buildroot.net/results/d802c3fc4947644f24af6cd7612bea06fdfec69f |     
    arc      |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/b62fe00ab5b9497bf71e92939d386b8844d4dc36 |     
    sh4a     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/179d4efbdfb2fbc7fae2abfa2671623341c81b74 |     
    sh4      |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/2316984ab14bc1fca70c256efee02007e66e36cf |     
  aarch64    |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/a968e3bcab7e9fb3ab2ab896a0decc7d163687eb |     
    sh4a     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/a238871ecbea184f6a3c9ff46756a31b0724dcff |     
    arc      |  binutils-arc-2020.09-release  | NOK | http://autobuild.buildroot.net/results/ed209b0ae4c6c33ce31ffca0e92764b3e00f0025 |     
    arc      |          boost-1.80.0          | NOK | http://autobuild.buildroot.net/results/84ffe3c2b1e701cb431a4869d7cee0fe3bd462f9 |     
  mips64el   |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/fd17b3533f06e55993f31cb55866a4799827f7ad |     
  aarch64    |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/3b8ea95f900082fca829c37407861559038ecd45 |     
   mips64    |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/0b5e57abdc6b78e14511b01478d9ba762ded3071 |     
  sparc64    |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/a8bfb23ff13ae9a1a62e6c584ce817467a506769 | ORPH
   nios2     |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/dea88693b1cc94121748926d7889fd954e9cc201 | ORPH
   sh4eb     |         dhcp-4.4.3-P1          | NOK | http://autobuild.buildroot.net/results/017e0b1e2485a173e401ca45e9fd5071c65ebfc7 | ORPH
    mips     |           dust-0.8.1           | NOK | http://autobuild.buildroot.net/results/2cdc6a7aec58b988327b9bca0669b8f4256280bd | ORPH
    arc      |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/9c20459f3eaf870d4c4a40f4ada3d5a43938cfad | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/df5dc5d1301723e1cca619f0108895c24655641b | ORPH
    arm      |          flann-1.9.2           | NOK | http://autobuild.buildroot.net/results/5659cf933b6ab0c63aeffc579a8d092396071688 |     
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/7d5ef0a19c4f9dc99c684eae262e7d75bf46091f | ORPH
   sparc     | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/90f57b434a6019c4579a69915d3bac580e2da3f4 |     
    or1k     | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/392edbc1ee9af815512294a0148b9d85998ae104 |     
powerpc64le  | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/01cbb9bd725ef40213d8b499c921d9fc269c33a0 |     
 aarch64_be  |          gensio-2.5.5          | NOK | http://autobuild.buildroot.net/results/48f212cbbaa0bc9011e6a088e8d6bcf28e85d8bf |     
  powerpc    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/d645774cfde9d14432e39f0aec1c62458ea59a6a |     
    or1k     | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/05d8731e9df79a6d0b141441f80270bf397b196d |     
    or1k     | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/d59ca8179b119ae7aa1f447895cf3a7122687584 |     
microblazeel | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/544e9ddf8fb8a9f14ffb388d3478c1814cfde6ab |     
  powerpc    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/209bb2bfd429d8a77b521ce8358b7892da9f31f7 |     
  powerpc    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/4cec8e31af63043350527ff3ec484947eca3d9d4 |     
    mips     | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/1d479e5118cdf3c8c0cb21e060a6eeaf949dafc5 |     
  riscv64    |           gmp-6.2.1            | NOK | http://autobuild.buildroot.net/results/e17c482e60fe247daf976739806148be20368711 | ORPH
microblazeel |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/5d94af5de68fd4066534a4a92e71841f3be78e19 | ORPH
    i686     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/4474a8c3afc0916b86c33de2c122c2b349544b06 | ORPH
  sparc64    | host-abootimg-1ebeb393252ab... | NOK | http://autobuild.buildroot.net/results/27c1ca4aaf894e814e2016d81eb5410fd833d2e3 |     
   sh4eb     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/188f273728d98b9cafde467f38108bacd5f76b89 |     
  powerpc    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/3386e89bf0278e7cd231f2095c6db88419602bf8 |     
microblazeel |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/36bf53b33012053fb4612412057ea5d355152262 |     
  mips64el   |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/7ac8b77d56136ed491d6b57c32cadcb01c05e30e |     
  mips64el   |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/81c38d81143f304408e6aa21e9ed786d7536e120 |     
  mips64el   |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/3cbda4aed281c7b7995c118702bf9c74b4a35c06 |     
    i686     |       host-libtool-2.4.6       | NOK | http://autobuild.buildroot.net/results/6d018e726a6463626370bdbaf404de6616ea93cc | ORPH
 microblaze  |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/6cdd7fd582d323d93e7884338b2e4082f53e73b1 |     
   mips64    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/125269159fa8ec3ea620d7aabb93468e11dca0fd |     
  riscv32    |   host-python-greenlet-2.0.0   | NOK | http://autobuild.buildroot.net/results/9daf6d31a6cb34e9a8cc51486d4d969e33fe96e3 |     
 aarch64_be  |       igh-ethercat-1.5.2       | NOK | http://autobuild.buildroot.net/results/6df77c9c35d4fe702e8d2a847d9e18d49a721e89 |     
   mipsel    |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/f7151c99a46bb408e1752681f5695152d8f84178 | ORPH
  mips64el   |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/8bf4e775308743d83c4856ebf1b6da78f0296946 | ORPH
powerpc64le  |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/f509f83b92a7329f7674660eae699f30461ae8ed | ORPH
   sh4eb     |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/010ff247753ab07e9dad53e94c2507dc27766dfc | ORPH
   mips64    |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/e840ddedddb49f9e4c9e3038aa02dde7cc480d91 | ORPH
    arm      |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/2d4828a07e4ca639453d443f1d4f29bff6d5687b | ORPH
   x86_64    |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/185af74c934f015b8b6c604bbf0d2bfd04bc8386 | ORPH
 microblaze  |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/c6cd3e401eb9a6d765130800927d6616dfe08fd5 |     
    m68k     |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/db1da7e7467d95f463abe51fed6e4803d08ffa1e |     
 aarch64_be  |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/5d438cac460743490c25332576ef796f665a9b4c |     
  aarch64    |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/921cbc79a8c6cec29212aaca52f4f83a115572c9 |     
   x86_64    |            kmod-30             | NOK | http://autobuild.buildroot.net/results/01f10b16cec889e9f2757bda1cae81ed13e50eac |     
   armeb     |            kmod-30             | NOK | http://autobuild.buildroot.net/results/2f3cffd9a5cb12f2afc31cedb7bab65a03c8f6c7 |     
  powerpc    |        libcodec2-1.0.5         | NOK | http://autobuild.buildroot.net/results/3a758f6d529a45ef64acf6e06c89d8c7d683a476 |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/6e5b6dd6100c7b336998a9795a46ae3020ccd58a |     
   armeb     |         libkcapi-1.4.0         | NOK | http://autobuild.buildroot.net/results/3497408827bd774fdcfc17366a2b78bb0ffef4dc |     
   xtensa    |         libkcapi-1.4.0         | NOK | http://autobuild.buildroot.net/results/672b5a2083520b3a9d3b8fd4e78249baa175979b |     
microblazeel |         libkcapi-1.4.0         | NOK | http://autobuild.buildroot.net/results/7c95a01adccabd2b55d69b78955333fae641a2f8 |     
   armeb     |         libmad-0.15.1b         | NOK | http://autobuild.buildroot.net/results/274fe552a62c52015c9a7a19258e37513963b4c7 | ORPH
   armeb     |         libmad-0.15.1b         | NOK | http://autobuild.buildroot.net/results/cc36989c4ab0ac88197ee2d8767df343b781cc21 | ORPH
 aarch64_be  |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/abc61d09ff373ffe6b15a62342345900c704a70b |     
   nios2     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/4ad8ccf48dc12a56fb4d82589b2fcee8411a6f63 |     
 aarch64_be  |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/b726b211eef47d2206781797b8ff99c59371d933 |     
  aarch64    |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/4e719788ab81b190d5528fd668bda1b51dbe6ffb |     
    sh4      |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/6b4798d5da20812ef91e303639107957258950b6 |     
 powerpc64   |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/b2ca9b0aef2a85fb9c4afea87a77453db06179be |     
powerpc64le  |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/277a96298c144a7e61a506d87952ad478c925598 |     
   mips64    |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/fda7dd84a0bc64ca81cead5436e29e733b7195c2 | ORPH
    mips     |         linuxptp-3.1.1         | NOK | http://autobuild.buildroot.net/results/b2e81c5fff030a484a62caaabf0d3abc92451b62 |     
 aarch64_be  |           lxc-4.0.12           | NOK | http://autobuild.buildroot.net/results/06197ff50aa4d99ad34f6a5bde73f7feb87dd3e6 |     
  aarch64    |           lxc-4.0.12           | NOK | http://autobuild.buildroot.net/results/0f3d1dfca54f6a28829892f368a91d792d8b56f0 |     
    or1k     |         numactl-2.0.16         | NOK | http://autobuild.buildroot.net/results/9fb1377b38b69d2d74f14b8519016eba664bad33 |     
  riscv64    |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/e076c7a226b2e682937f0b2a50ffd1ec4aa3d5e0 | ORPH
  mips64el   |        openblas-0.3.21         | NOK | http://autobuild.buildroot.net/results/46a71afd5ca7b49b661a0536a71f96148e995bcc | ORPH
   s390x     |        openpgm-5-3-128         | NOK | http://autobuild.buildroot.net/results/dd7127662943fb630dd37ac158d84822ee704554 |     
   mips64    |         p11-kit-0.24.1         | NOK | http://autobuild.buildroot.net/results/f2713831700d8f73a1c2044f789cc81393a1a6b9 | ORPH
    or1k     |        pcsc-lite-1.9.9         | NOK | http://autobuild.buildroot.net/results/79e304ac14d9471e54d98322a7fdc6cb5fe840e0 | ORPH
   sparc     |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/b2be2c4fd3c73c5638763cc0be6a8c43423a2aaa |     
    or1k     |           php-8.1.12           | NOK | http://autobuild.buildroot.net/results/3cefceb8fe8558c9eb548b3e396c30b23b6465e2 |     
   armeb     |           pv-1.6.20            | NOK | http://autobuild.buildroot.net/results/fd6caed1ae635d891de1bba1e88f4a2f7996e967 | ORPH
   x86_64    |      python-bcrypt-4.0.1       | NOK | http://autobuild.buildroot.net/results/34e0fe631819e92e9d669308e4c2dfbf21e4d920 |     
    sh4a     |       python-bunch-1.0.1       | NOK | http://autobuild.buildroot.net/results/2879a43fc0ffc04db47e45b254aaa984b8443f84 |     
    arm      |       python-bunch-1.0.1       | NOK | http://autobuild.buildroot.net/results/576a04804095c3e82308579e0700c260cb099511 |     
  mips64el   |     s6-linux-init-1.0.6.3      | NOK | http://autobuild.buildroot.net/results/83928b4544fba87982ca82857f62d8a02947f62b |     
   mipsel    |     s6-linux-init-1.0.6.3      | NOK | http://autobuild.buildroot.net/results/47b39b689e646e3c19c5984f462a83b963f90dfa |     
  powerpc    |     s6-linux-init-1.0.6.3      | NOK | http://autobuild.buildroot.net/results/df2501eccc582ae7b47b9c38643ae0489d9a63f0 |     
   mips64    |         snmppp-3.4.10          | NOK | http://autobuild.buildroot.net/results/8b08e54bbcfc8ac2aa74001614bf87fb4aedbb08 |     
  aarch64    |         socat-1.7.4.4          | NOK | http://autobuild.buildroot.net/results/d06ce7fd2a7de52cca9dada2c12368195f9bec09 |     
powerpc64le  |         tealdeer-1.6.1         | NOK | http://autobuild.buildroot.net/results/42398bc96d90e711218d480f7ae676ff13acccdd |     
  sparc64    | uqmi-0a19b5b77140465c29e2af... | NOK | http://autobuild.buildroot.net/results/4bbe1da47d39569bfd6f444e221616de8cdd5159 | ORPH
  aarch64    |          xvisor-0.3.1          | NOK | http://autobuild.buildroot.net/results/96615f21febc4c59cba7cb11a8d006e2e7e21f8e |     
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/70c406854c33d4639ad279af635df034b4e85d91 | ORPH


Classification of failures by reason for 2022.02.x
--------------------------------------------------

                host-go-1.18.8 | 1 
            igd2-for-linux-2.1 | 1 


Detail of failures for 2022.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |         host-go-1.18.8         | NOK | http://autobuild.buildroot.net/results/622c55915237091985c1fb7daf5d9ee4942bf82e |     
    mips     |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/97fcd666058d6e6f08ca48f8126b8dcb47e8e0a0 |     


Classification of failures by reason for 2022.08.x
--------------------------------------------------

docker-proxy-f6ccccb1c082a4... | 1 
                elfutils-0.186 | 1 
       freeradius-client-1.1.7 | 1 
                gerbera-1.10.0 | 1 
                     gmp-6.2.1 | 1 
                host-go-1.18.8 | 1 
host-spirv-llvm-translator-... | 1 
                    opus-1.3.1 | 1 
               pipewire-0.3.56 | 1 
                 pixman-0.40.0 | 1 
                xenomai-3.0.10 | 1 
                    zeek-4.1.1 | 1 


Detail of failures for 2022.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    | docker-proxy-f6ccccb1c082a4... | NOK | http://autobuild.buildroot.net/results/b595259b356b1555008c5976d9c872c6a03e796a |     
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/d15cab9131df9d3ece60b652d329bf2d47c881f4 | ORPH
  riscv64    |    freeradius-client-1.1.7     | NOK | http://autobuild.buildroot.net/results/60a9790802e43134b50a6d5a059ed2416d3d4897 |     
    arc      |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/3bc3adb414f10e70491e3edef82d038bf59b4ac0 |     
  riscv64    |           gmp-6.2.1            | NOK | http://autobuild.buildroot.net/results/02aeb247f20150fe060087cae62cffbd3943cee1 | ORPH
  aarch64    |         host-go-1.18.8         | NOK | http://autobuild.buildroot.net/results/4be746f62915cd2334ada73853ca4d9be3039503 |     
  aarch64    | host-spirv-llvm-translator-... | NOK | http://autobuild.buildroot.net/results/48113f4531f21db78b7799f4e9a4008365408e69 | ORPH
   armeb     |           opus-1.3.1           | NOK | http://autobuild.buildroot.net/results/b22c0f35247def0d458890e232aac516a091cbfe | ORPH
   x86_64    |        pipewire-0.3.56         | NOK | http://autobuild.buildroot.net/results/8b4d12de72a1407e74bd9b9b79f4e01ae86510ba |     
powerpc64le  |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/ac48f9a85778a16208e677834fb971283a6e7118 |     
    i686     |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/b4bcd69a47f67fb40aff2769f6b27b674c6d5c8e |     
microblazeel |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/da2959aac34f837c0e709627f9dcf6bb0913d680 |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
