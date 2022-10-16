Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8890DC4332F
	for <buildroot@archiver.kernel.org>; Sun, 16 Oct 2022 05:38:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F3AC48138F;
	Sun, 16 Oct 2022 05:38:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F3AC48138F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YVIOPu7MyjhF; Sun, 16 Oct 2022 05:38:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 82FF780FFE;
	Sun, 16 Oct 2022 05:38:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 82FF780FFE
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3B3A81BF2B5
 for <buildroot@lists.busybox.net>; Sun, 16 Oct 2022 05:38:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 119BB41601
 for <buildroot@lists.busybox.net>; Sun, 16 Oct 2022 05:38:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 119BB41601
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sp8A6AmUAFNB for <buildroot@lists.busybox.net>;
 Sun, 16 Oct 2022 05:38:24 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8BB2F415EC
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::231])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8BB2F415EC
 for <buildroot@buildroot.org>; Sun, 16 Oct 2022 05:38:23 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 1AC6B100006
 for <buildroot@buildroot.org>; Sun, 16 Oct 2022 05:38:20 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sun, 16 Oct 2022 05:38:20 -0000
Message-Id: <20221016053828.119BB41601@smtp4.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1665898700; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=og+tSuNtM+jR3mjbiutB352+znmU7xVVDFxk5oKTSHY=;
 b=n/4wd0W63CKUAFMhCmeUZLwylXtdSoc97EIc/mH24zSwEO2cDJXXtAHqw6iOjkvEBo2uP2
 yhjZVx9cvUQMhilUifLyYn15xntYErC/cg0RBV5h1mSIziHzi4PhCz1fQuVMEBFxL4Vpgu
 IXkBvleHUpU5JwvUpun7p1qaNY61G1CIITkb8nRTWMVoF1dBb9Tz+AFPg7xN/L+sTCVSmM
 7ZOvFfPA0wIgRmsbsaJce4ijb7+oYE2oseGx9/o5UcmReF17cM84/UgsP1vJfO94hFoMqW
 xJSMLQl8iZeZob0mOsfdb121Rv8p6/moe0sotElOxFvMp0IjzlU4Ndbf0AQThA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=n/4wd0W6
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-10-15
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

Autobuild statistics for 2022-10-15
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  |  7  |  4  |  0  | 11  |
  2022.08.x  | 14  |  9  |  0  | 23  |
    master   | 126 | 588 |  4  | 718 |

Classification of failures by reason for master
-----------------------------------------------

      ca-certificates-20211016 | 32
                   bearssl-0.6 | 30
             berkeleydb-5.3.28 | 30
       host-gcc-initial-11.3.0 | 29
                 systemd-250.4 | 25
                      xz-5.2.7 | 24
         coremark-pro-1.1.2743 | 21
         host-gcc-final-11.3.0 | 19
glibc-2.36-44-g2628500f5dff... | 18
                    gpm-1.20.7 | 16
                   libnss-3.84 | 15
                 sysvinit-2.99 | 15
                      crun-1.5 | 13
        host-f2fs-tools-1.15.0 | 12
                   slang-2.3.2 | 12
                host-go-1.19.1 | 11
                     linux-6.0 | 11
                  autofs-5.1.8 | 10
            host-binutils-2.38 | 10
        host-sentry-cli-1.59.0 | 10
              dieharder-3.31.1 | 9 
            igd2-for-linux-2.1 | 8 
package/openssh/openssh.mk:... | 8 
               libglib2-2.72.3 | 7 
            ocf-linux-20171122 | 7 
                     efivar-38 | 6 
       host-gcc-initial-10.4.0 | 6 
                 musepack-r475 | 5 
                        brltty | 4 
            btrfs-progs-5.16.2 | 4 
                 dash-0.5.11.5 | 4 
           dmraid-1.0.0.rc16-3 | 4 
                     fbset-2.1 | 4 
                    frotz-2.54 | 4 
                gerbera-1.10.0 | 4 
        host-berkeleydb-5.3.28 | 4 
host-pahole-73383b3a39afe86... | 4 
                   libee-0.4.1 | 4 
                       unknown | 4 
                   duma-2.5.15 | 3 
  gobject-introspection-1.72.0 | 3 
                   hdparm-9.63 | 3 
            host-binutils-2.37 | 3 
            host-binutils-2.39 | 3 
         host-protobuf-c-1.4.1 | 3 
              libgcrypt-1.10.1 | 3 
                   nanocom-1.0 | 3 
              procps-ng-3.3.17 | 3 
tstools-08f6be304040e7b8476... | 3 
                elfutils-0.186 | 2 
       freeradius-server-3.2.0 | 2 
                  gensio-2.5.5 | 2 
      host-riscv-isa-sim-1.1.0 | 2 
              libarchive-3.6.1 | 2 
libsvgtiny-ea9d99fc8b231c22... | 2 
          linux-5.10.145-cip17 | 2 
      linux-5.10.145-cip17-rt7 | 2 
               linux-pam-1.5.2 | 2 
                   mimic-1.1.0 | 2 
                mongodb-4.2.18 | 2 
                  netsurf-3.10 | 2 
                  ntp-4.2.8p15 | 2 
              open62541-v1.3.3 | 2 
            openssh-legal-info | 2 
                openswan-3.0.0 | 2 
                   perl-5.34.1 | 2 
     portaudio-190700_20210406 | 2 
                    sdl-1.2.15 | 2 
toolchain-external-codescap... | 2 
                    vde2-2.3.2 | 2 
                 wavemon-0.9.4 | 2 
                 zlib-ng-2.0.6 | 2 
/home/buildroot/autobuild/i... | 1 
/home/buildroot/autobuild/i... | 1 
/home/buildroot/autobuild/i... | 1 
                  acpid-2.0.33 | 1 
am33x-cm3-11107db2f1e9e58ee... | 1 
android-tools-4.2.2+git2013... | 1 
                  assimp-5.2.5 | 1 
                    bat-0.19.0 | 1 
             batman-adv-2021.4 | 1 
                  boost-1.80.0 | 1 
                  botan-2.19.2 | 1 
                  check-0.15.2 | 1 
dahdi-linux-5c840cf43838e06... | 1 
             f2fs-tools-1.15.0 | 1 
               fftw-quad-3.3.8 | 1 
                     file-5.41 | 1 
             fontconfig-2.13.1 | 1 
               freeipmi-1.6.10 | 1 
       freeradius-client-1.1.7 | 1 
                     frr-8.3.1 | 1 
fs/ubi/ubi.mk:51: /tmp/inst... | 1 
                 gauche-0.9.12 | 1 
        gmrender-resurrect-0.1 | 1 
           heirloom-mailx-12.5 | 1 
         host-gcc-final-10.4.0 | 1 
       host-gcc-initial-12.2.0 | 1 
                 host-gdb-11.2 | 1 
host-gdb-arc-2020.09-releas... | 1 
     host-moby-buildkit-0.10.0 | 1 
              host-rust-1.64.0 | 1 
               host-vde2-2.3.2 | 1 
                jhead-3.06.0.1 | 1 
                 lcdproc-0.5.9 | 1 
               libcap-ng-0.8.3 | 1 
                libcurl-7.84.0 | 1 
                libdnet-1.16.1 | 1 
             libopenssl-1.1.1q | 1 
                libxml2-2.10.2 | 1 
                    lxc-4.0.12 | 1 
                 openal-1.22.0 | 1 
               openpgm-5-3-128 | 1 
   openvmtools-11.3.5-18557794 | 1 
            quickjs-2021-03-27 | 1 
                  reaver-1.6.6 | 1 
          refpolicy-2.20220106 | 1 
               tcf-agent-1.7.0 | 1 
                    tiff-4.4.0 | 1 
                 uclibc-1.0.42 | 1 
ulog-0389d243352255f6182326... | 1 
                  umtprd-1.6.2 | 1 
                 wolfssl-5.5.1 | 1 
                  xvisor-0.3.1 | 1 
                    zstd-1.5.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 aarch64_be  | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/78e5c6b9d42790e6184bb471fa1e4a892631574b |     
   nios2     | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/1dd3cf6031ca6737ccfc2bdbe8fb66a79d858764 |     
    mips     | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/afc7e0e5c47a9c5578903812f9a81a02db5cfdf0 |     
  mips64el   |          acpid-2.0.33          | NOK | http://autobuild.buildroot.net/results/8ab7968bf61156fdfca4838df9a832b6df30b3bc | ORPH
    arm      | am33x-cm3-11107db2f1e9e58ee... | NOK | http://autobuild.buildroot.net/results/09efd495b2577dd423b0090c04c6ce53aa198550 | ORPH
powerpc64le  | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/b55bf719c2a55e92a4ae7d6f559858579e1d34da |     
    arm      |          assimp-5.2.5          | NOK | http://autobuild.buildroot.net/results/23b32d7669b0dd83ad632034bc27003246d23163 | ORPH
    arm      |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/6b58cb73a392e8b9bfb89e416776ab8a09c0c07d |     
  sparc64    |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/3c762ca824d41f6ddbd91332e9cc6bb967e72bba |     
   sh4eb     |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/eef5e85ef0981ddc1f71a8901b37195011c87dcc |     
    arm      |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/e0c7d6d50f1627666fce8958b411db7ba0637a2b |     
   mipsel    |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/e5f79f5939c7f0f05ee6d03e9fd2b6fe45e38609 |     
   nios2     |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/bd23a70abccd6bd71f047a963ba4475a784afc28 |     
 microblaze  |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/926660edf31425cd7e8155a0321a083fc50f2280 |     
    sh4a     |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/ffe774ed0133dc3bb1df9fa79ec28593f5326ed6 |     
   armeb     |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/0e8445ed3d46beddde5b25b7c2aa9217a8fd683e |     
    sh4      |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/2f71f2e79a72a2d630b123d5cfafa6d3a03d1a03 |     
   mipsel    |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/30c2294b496bb91a1f2bebd9720fd0df7780b0be |     
  riscv32    |       batman-adv-2021.4        | NOK | http://autobuild.buildroot.net/results/63e1b29c5b17b82c1deef95eb8a747eb77ce70df |     
 microblaze  |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/068409ef889eae1e52b0566f6fa2d7a0a0f01d9a |     
   s390x     |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/5e1b72db206b2d17fa5ce378a70fdc2f3f5bf773 |     
 aarch64_be  |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/0ef5aeaf18dced230c6a3895aa3d074daabcc1a5 |     
 aarch64_be  |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/93e4d14330745ceb1f54f9ede5d3d6a2678b0db5 |     
  aarch64    |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/2f221edec5b16e0615e9cd48962d1d395ff8ba1d |     
 powerpc64   |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/0603a942ad1187582464d68b0fafb56eca749aa8 |     
  sparc64    |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/7ff9898a7d5082bac85631e39acc9c87bc800f05 |     
   nios2     |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/178fea79449624c283727d3976d2b15e14189f87 |     
 aarch64_be  |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/8f54df01ac78ab9e33470252f2c39ff0d5e4c6d1 |     
    or1k     |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/e33875d7c519b9dc2d2121cf0c7612e4eb4b158d |     
  mips64el   |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/74a9e6c2fd5a0898b57afbf9334392e098dc079a |     
microblazeel |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/83489d54300ed6be277298f1b2c900ea4e518d0b |     
    m68k     |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/c9c7dc9c4973065307a318df9751f4681682c1d8 |     
   sparc     |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/ec976cf62d9c49385b8e9eba9c61a1b25f691c17 |     
   xtensa    |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/84abc46cd1abfedfc4016dd5d11beb36a00fa864 |     
    arm      |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/5449099214ac680e61e6a9ec5107b20b511fa60a |     
 aarch64_be  |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/d9da269bcd1a5553235bec81a7239f26de1853ce |     
 powerpc64   |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/f6ac71759aa3eff78846f62fe02128ecad46a6f0 |     
   nios2     |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/7d9b195b36cf8697ae73011c201dc956fca38e6c |     
   mipsel    |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/d212dd048bf266dbba9f92bde7b5db46e04a1747 |     
powerpc64le  |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/645fdfa563379c64a88b2de9ba28983dd9deb7c2 |     
   armeb     |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/bb6751f24236c47a019854a9c0178693600f20c2 |     
   sparc     |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/ca420d17f61e80b2be38b40232ffa15ed1a9b912 |     
  aarch64    |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/8e2d08162bac46eb6ed577233717d0bb12c42b0e |     
    arc      |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/8b3381c4128efc13a7adf16ad906bed561e0dc6e |     
   sparc     |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/0f6c02050b1f7627ec8f17a693442872146091f4 |     
   sparc     |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/2c51052fbaa2d5135a1e05177b9691f909585d01 |     
  riscv64    |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/80cad60b5a6440fbe8b67a07268e2731e3dffb1b |     
powerpc64le  |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/c913e2f8fea075a13342d3db22ab82f5d488ed4b |     
   armeb     |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/a3ea6d0800d2f298ce00a4b3889315e9819ea49d |     
   sh4aeb    |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/46e28a38c0d409c04b2fa97f03c87741821358dd | ORPH
 powerpc64   |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/90911dfdada2f9cdcedfe590647c2729dfb9e1cc | ORPH
microblazeel |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/3fbf52f1dd3972b1c5590f6f55738bc4823fc080 | ORPH
 powerpc64   |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/590d2f1ab4e42be14a45ee6d8b28571ab13b3779 | ORPH
    arm      |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/5a71b119c375a181ff540b6c3b8ba78a8c642354 | ORPH
    mips     |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/db2eeaf26265721ab743ae3df172215fd31c70d6 | ORPH
 powerpc64   |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/bf181685c40005a63d1784ed6b4a24cee01dac90 | ORPH
  sparc64    |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/757d609444d8e513320aa0258ac689bcf8722f4d | ORPH
  mips64el   |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/ddbc84120414c01796f774d8b8b8094e1e3c7b35 | ORPH
   armeb     |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/16c0070af89964cfa0157523e4f3a1244bd942e8 | ORPH
  riscv64    |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/cf444d8d732593f4d3e968c610b900422bf96e76 | ORPH
   armeb     |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/3ca4efe71d8a1446d2907dee7c52b81ff34a743a | ORPH
    i686     |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/778adc699f78cc97721909e08874ce7ac89dc661 | ORPH
powerpc64le  |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/82d7ae5b32b96caf7f0473e694107117bb7c5d0e | ORPH
   mips64    |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/24296610d584088e656f5c802e82726d73114335 | ORPH
   sparc     |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/3ceab8bfc2a11462175137af9b2418b32abf9b7f | ORPH
   xtensa    |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/0167835d718a8e976f182abd345f9b9134117fae | ORPH
    arc      |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/d698c62776f9d3f89a9779aeb0e534d359e80150 | ORPH
   mips64    |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/ba45e27c8b1828d504563e307f7bffabe58bbc4c | ORPH
 microblaze  |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/0aa5f338b963f5608b3d5f7efaf893a0e1bf960f | ORPH
  sparc64    |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/00052a9592b3ba89b27328d84fb54bcdf7e62164 | ORPH
   xtensa    |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/a9c4781f974205a17a2e49340014cd03fffff1ae | ORPH
 aarch64_be  |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/3f2892fddfe72db77dbf7c678f33ac4e89227588 | ORPH
  sparc64    |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/603e90f860bf732764fa69b28fdb8c0fc2418b79 | ORPH
   sh4eb     |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/86143582c1f11ae5e5f9c3a338bef5fd8412c377 | ORPH
   armeb     |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/072244a06f468bda666551755026ade06e8f3622 | ORPH
   s390x     |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/a79b9abe877137eba32c3cdd030a982017cb4d25 | ORPH
  mips64el   |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/d459e85cda0ba4139839a56139578a84d52cc73e | ORPH
   mips64    |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/ce15c48adf23abeed846351941ac457e4e4f2197 | ORPH
 aarch64_be  |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/442d558f09c49309be37e18fe627e64994bb710b | ORPH
   arceb     |          boost-1.80.0          | NOK | http://autobuild.buildroot.net/results/cbae8dd7cd12cda767ced93fb158c16745484ae1 |     
   sparc     |          botan-2.19.2          | NOK | http://autobuild.buildroot.net/results/38bf76e4618047f310e208f4372b92a05eb3d6f7 | ORPH
    arc      |             brltty             | TIM | http://autobuild.buildroot.net/results/59e36093f7e437a5a37037f7fa50ce2443c47fd3 |     
 powerpc64   |             brltty             | TIM | http://autobuild.buildroot.net/results/06c9414a1ecbc1a147bc8dfddced03fc659af694 |     
 aarch64_be  |             brltty             | TIM | http://autobuild.buildroot.net/results/82af705f7ca282495461cb3994f5a7e6f64273e1 |     
    sh4      |             brltty             | TIM | http://autobuild.buildroot.net/results/59ab880f8c3474a3cfe765205787e0e83cb0f03f |     
   s390x     |       btrfs-progs-5.16.2       | NOK | http://autobuild.buildroot.net/results/bed253d3b198fa6a9aa86467662d4b1093f69db5 | ORPH
  aarch64    |       btrfs-progs-5.16.2       | NOK | http://autobuild.buildroot.net/results/5d9f5469ec1db831c6797f8289178750f1eb4d10 | ORPH
   mipsel    |       btrfs-progs-5.16.2       | NOK | http://autobuild.buildroot.net/results/54ab55ec099d80f9a646dd13b61b9982ca03b73f | ORPH
   s390x     |       btrfs-progs-5.16.2       | NOK | http://autobuild.buildroot.net/results/7286047c3aeedd7e7f44f30fded6f46b59c28c10 | ORPH
 microblaze  |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/19208bf56df573a1506a634aef1215ded926c06d |     
   s390x     |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/563464518c5a6df7d912078b3c7118898570d4c8 |     
  aarch64    |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/bebae5bf40cf95710ed1d91b9104f67aa121d3ab |     
 microblaze  |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/97bb3ff45d54770a885a2eb2a3997b1eea857de7 |     
   arceb     |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/fa21f3f19623e15e784f6c01447e66ab2a488353 |     
  aarch64    |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/77f5b78eb111d935ae35bafa4e36b5424cb2992d |     
  powerpc    |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/b378af0b6fda6e2937e742169394fd1fb4884f75 |     
powerpc64le  |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/ac594c757bb6233775c19addeb00a3bd959ea89d |     
    mips     |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/d16b333563474828d253830e2a873103a19ccab0 |     
  sparc64    |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/f7c0b1b98c33e91cc5ff43e42b33cf63a777bcab |     
powerpc64le  |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/d8b1e6156c43813fed9f6fb833d174aee77fd199 |     
   xtensa    |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/c3998478fee13a1a41cd15ebcd7e6e534de63572 |     
   arceb     |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/9417220aaa2123c7f81a57109af2317ecfa9a59e |     
  riscv64    |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/e4955db53ca59e5ae84fbf38c3d30e6ad568bb55 |     
   armeb     |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/f5f9d622641c65d381ac5dc4cb2fa8c2129ab4bb |     
    mips     |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/3a21b1f2b7a82b7badef1cbee8314354ded75d5d |     
   armeb     |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/c835ae6a6b050da353d40f528c880e9c544f5e7e |     
   sh4aeb    |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/572c91e52639d20395ead73abadd80c196bb82e4 |     
   mips64    |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/132665ee26a9e94f9b9c95a130d9a9183231a75e |     
   mipsel    |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/286f5948c19def197919026ae9a5e7b1c50b85e3 |     
   mipsel    |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/17178648f1571ecd779f67a4a2e25bef103b729d |     
    arc      |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/128c5e769dd76371d00cd3baad3278b2929a4587 |     
   mipsel    |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/1bc83af821b80cb6074aea74047f098ed0a88e4f |     
    m68k     |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/50ca2c7fa6e8b20bde584750311b928b5ad59233 |     
    m68k     |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/f3da84d29bebe843c89834ba4f992e693e9dc15b |     
  riscv64    |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/70a984f08145e90ad5aec9c8d01e81fc5a1a641e |     
   mipsel    |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/185247fbe882649dbfd2d4e2f080ad395e087718 |     
microblazeel |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/ec19cec6d404628c99ba25f70d709324e1cbb0ed |     
microblazeel |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/004e912d57a16df3ed3a46e01731cbf6f13b0093 |     
  mips64el   |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/4cb46ebb8cf3818fc05926b75d7569a772f6bb1a |     
 microblaze  |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/49c2421c7cdd43ca62b38fa58bf12af2d0d832b6 |     
  riscv64    |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/6baf9ef738633cc20af4e850781875df003c8ee8 |     
  riscv32    |          check-0.15.2          | NOK | http://autobuild.buildroot.net/results/a0aca02432b01acb88ab924724a60fba3bba4a07 | ORPH
   sparc     |     coremark-pro-1.1.2743      | NOK | http://autobuild.buildroot.net/results/bf5d9d56ffa7ecf6f3af7b8a5441d4138059efc7 |     
  aarch64    |     coremark-pro-1.1.2743      | NOK | http://autobuild.buildroot.net/results/e520c59f39c9bb847bb179ac8bc16f699cdc8036 |     
    arc      |     coremark-pro-1.1.2743      | NOK | http://autobuild.buildroot.net/results/0a10a078af47b8e48458e9cf2627c37bb1501baf |     
 powerpc64   |     coremark-pro-1.1.2743      | NOK | http://autobuild.buildroot.net/results/53a4c6c8202fb43f0f1908370a05895ef26c5424 |     
 powerpc64   |     coremark-pro-1.1.2743      | NOK | http://autobuild.buildroot.net/results/1a3e2cbcfedf1a74e087cac36ca438cba045da5e |     
   mipsel    |     coremark-pro-1.1.2743      | NOK | http://autobuild.buildroot.net/results/bd32f578319d7a1319545a27e3eaaab3f302b39b |     
 powerpc64   |     coremark-pro-1.1.2743      | NOK | http://autobuild.buildroot.net/results/ed2887c90ec0b20aae6f4633cd5eac1e5b99cfe0 |     
    arc      |     coremark-pro-1.1.2743      | NOK | http://autobuild.buildroot.net/results/0da2526c9e476fd0e91435345e1f51320d509f42 |     
powerpc64le  |     coremark-pro-1.1.2743      | NOK | http://autobuild.buildroot.net/results/697f3ed518e985f0ea02e80a4aa0461f642055c8 |     
    mips     |     coremark-pro-1.1.2743      | NOK | http://autobuild.buildroot.net/results/8d3dc215c8c501614109e13bd6c9f2bc022810f4 |     
  mips64el   |     coremark-pro-1.1.2743      | NOK | http://autobuild.buildroot.net/results/1ead1f59417b599f76d4ccbee2134a57ea22c272 |     
   sparc     |     coremark-pro-1.1.2743      | NOK | http://autobuild.buildroot.net/results/940cbfd7af03b66e927b5cccce2fccedf5810a54 |     
   arceb     |     coremark-pro-1.1.2743      | NOK | http://autobuild.buildroot.net/results/95085a7d8d794fdfceafb77ae9ad55f374584d2b |     
microblazeel |     coremark-pro-1.1.2743      | NOK | http://autobuild.buildroot.net/results/29834403e4132d9d219438772aa886b5867b292e |     
powerpc64le  |     coremark-pro-1.1.2743      | NOK | http://autobuild.buildroot.net/results/fe887b4b9bda0afd49953409a42cf1be7d79865f |     
   xtensa    |     coremark-pro-1.1.2743      | NOK | http://autobuild.buildroot.net/results/c971d4f9de029ecfd5659c71d840185dc86d3f47 |     
powerpc64le  |     coremark-pro-1.1.2743      | NOK | http://autobuild.buildroot.net/results/7fbbb42063bcfa1610276820f274a27a74e77d4b |     
    mips     |     coremark-pro-1.1.2743      | NOK | http://autobuild.buildroot.net/results/7fc70bdbaea6bf7872c0572c905372f71fff73ce |     
    mips     |     coremark-pro-1.1.2743      | NOK | http://autobuild.buildroot.net/results/35bcae6f1dbafd48b80123536ff175e74147daf5 |     
   arceb     |     coremark-pro-1.1.2743      | NOK | http://autobuild.buildroot.net/results/589b74f70162f4d8ce1c1eb8428403863d5fc60d |     
   s390x     |     coremark-pro-1.1.2743      | NOK | http://autobuild.buildroot.net/results/9f2299a313378593888cb790ec4c46a9e5f5b2c3 |     
   nios2     |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/f2dff27f5a7b6f30986395d9e44f3701d311f214 |     
    arm      |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/9bfc19943fc46ba6e0e00181c198cb0055596c21 |     
 aarch64_be  |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/5274b83dd13870190926cd3c967bada1ae69f09c |     
   sparc     |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/ebff03eaef78613d377e49f0c5399efd62d7ad22 |     
 aarch64_be  |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/abcd4302483709b7f40214c516807dd153952d0c |     
    arm      |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/aca662d7eebc4ea4861f64b54202285e2a62c30a |     
 aarch64_be  |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/d996fdb506f815c0fb5cfc010589e56eb68df215 |     
   sh4aeb    |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/2b2014fdbdca9f6792db144bf819d38b0052adc0 |     
   xtensa    |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/2ef99748525be63a572f1ad468cdb409e195b880 |     
 aarch64_be  |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/25f230eb2ba0ec383d0b2101f99611dcb1808925 |     
 aarch64_be  |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/74c2f4dec127d245263ce748feced5db79c9fa4d |     
   arceb     |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/8c5cbbb5c609687cb1ad7c67ec1fc1fca0fcf65d |     
    arc      |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/ae3d36b65eb79be5187910ec81c5ed007f18a6c0 |     
   sparc     | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/e82ffc0f35ed3e3e5ded16fbb9d9c1066b7b7932 |     
   nios2     |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/8296612503f0f929e39c567d70a078bc058aef98 | ORPH
microblazeel |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/352e5f98eeae63f936a87a8a0da67309920edb39 | ORPH
 aarch64_be  |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/e03490d7bf8a346d4f9093875c94a5b8729863be | ORPH
 microblaze  |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/3370bf13eb13fc696fa1d99b684384dfa0f31459 | ORPH
   mipsel    |        dieharder-3.31.1        | NOK | http://autobuild.buildroot.net/results/0f9309f5f703306e5573891028501ffe1d334953 |     
   mipsel    |        dieharder-3.31.1        | NOK | http://autobuild.buildroot.net/results/5fecde1d02216a2302d9e0f632bdd80caeb50fb1 |     
    m68k     |        dieharder-3.31.1        | NOK | http://autobuild.buildroot.net/results/1617f29dbcdbc454002c90500d3bc888ecea26c7 |     
    or1k     |        dieharder-3.31.1        | NOK | http://autobuild.buildroot.net/results/7b154103320a6679c85e74c7c0233719d1107e24 |     
  mips64el   |        dieharder-3.31.1        | NOK | http://autobuild.buildroot.net/results/d2fd4772fc996b0fb761090eca1a20afb9abc762 |     
    mips     |        dieharder-3.31.1        | NOK | http://autobuild.buildroot.net/results/a3c80d00cfb24017fe6649f874ce2c0f01067627 |     
   mips64    |        dieharder-3.31.1        | NOK | http://autobuild.buildroot.net/results/3706e11f1e7183ef428c0b3472cad1aa8d2270d9 |     
    arc      |        dieharder-3.31.1        | NOK | http://autobuild.buildroot.net/results/5f1be17ae48d3dab39bc2ed2b6b7eb34a1fb7ebb |     
   mipsel    |        dieharder-3.31.1        | NOK | http://autobuild.buildroot.net/results/a0b69b5a7b76f61a02463309bf264b104cc78227 |     
   nios2     |      dmraid-1.0.0.rc16-3       | NOK | http://autobuild.buildroot.net/results/4ab2bf58fba6f9ba32be81b1ac8d26ad9eb33092 | ORPH
   mips64    |      dmraid-1.0.0.rc16-3       | NOK | http://autobuild.buildroot.net/results/2b6a29f15be8566efeeb3b53e4b0710aad17b535 | ORPH
  sparc64    |      dmraid-1.0.0.rc16-3       | NOK | http://autobuild.buildroot.net/results/202a9fec3bb4d69e149a064e86b26730063b3656 | ORPH
powerpc64le  |      dmraid-1.0.0.rc16-3       | NOK | http://autobuild.buildroot.net/results/80f594831240f6a22d2ca13f0b8a7819fc2116fd | ORPH
   sh4aeb    |          duma-2.5.15           | NOK | http://autobuild.buildroot.net/results/759f5e0bed3f4724422398b70335955251be43e5 | ORPH
    mips     |          duma-2.5.15           | NOK | http://autobuild.buildroot.net/results/87faa5a09d6312ee64bbd94cc1f6f0713a8a453d | ORPH
 microblaze  |          duma-2.5.15           | NOK | http://autobuild.buildroot.net/results/a16e78f93bf2bfa11a41f397942de613769eabff | ORPH
    arm      |           efivar-38            | NOK | http://autobuild.buildroot.net/results/797b12ec99147efc89f5f9d3fb59d936a5716370 |     
   x86_64    |           efivar-38            | NOK | http://autobuild.buildroot.net/results/2730af17b6e49ed8e3834697115792f7483f19a9 |     
   x86_64    |           efivar-38            | NOK | http://autobuild.buildroot.net/results/8a02c5ce5186b6ede7cda3ed61930b096046dde0 |     
   x86_64    |           efivar-38            | NOK | http://autobuild.buildroot.net/results/020077023334692a3589930f27d080f7becf386d |     
    arm      |           efivar-38            | NOK | http://autobuild.buildroot.net/results/48ca9534fcf07ae2e05689a4888f8b5b8780ced9 |     
    arm      |           efivar-38            | NOK | http://autobuild.buildroot.net/results/c7cbbf39eb4de5ac67aa6d847e9317c10c8d07a2 |     
   arceb     |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/613abc1571c89c86ed18fb1c54134447c2284d60 | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/eb8974c208bf7402cd008e5f180dd250877cd379 | ORPH
    or1k     |       f2fs-tools-1.15.0        | NOK | http://autobuild.buildroot.net/results/421dcc9da8c0fe5d9a88d27ec81c6e1b39fd1daf |     
powerpc64le  |           fbset-2.1            | NOK | http://autobuild.buildroot.net/results/5bbec969edacfcdb9cf2dbfaf063bf89797f8360 | ORPH
    or1k     |           fbset-2.1            | NOK | http://autobuild.buildroot.net/results/bc9139c497d2dec281a3d6abb1dc3681469a6bbb | ORPH
   x86_64    |           fbset-2.1            | NOK | http://autobuild.buildroot.net/results/531e3e00192b782c8f8957bf863bf012598f9571 | ORPH
    mips     |           fbset-2.1            | NOK | http://autobuild.buildroot.net/results/75114d76d260114b88b1d12ea32883b2bd133896 | ORPH
powerpc64le  |        fftw-quad-3.3.8         | NOK | http://autobuild.buildroot.net/results/537cef486e9f8e6880c5f61e645d4ee6f64cd10c | ORPH
   armeb     |           file-5.41            | NOK | http://autobuild.buildroot.net/results/76c788e6177b4a70bfd54a094903806c44948f99 | ORPH
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/399c8f192e2fab672625c9e26e4818f780b6331f | ORPH
powerpc64le  |        freeipmi-1.6.10         | NOK | http://autobuild.buildroot.net/results/91350d1be1db52b832544413da240c7ee74bafb1 |     
  riscv64    |    freeradius-client-1.1.7     | NOK | http://autobuild.buildroot.net/results/7ee7e33c8580c9c45cc90e657ac00e85d98c50cb |     
  sparc64    |    freeradius-server-3.2.0     | NOK | http://autobuild.buildroot.net/results/0b45c42dc998492bb8d2efedd747c88624642eee |     
    sh4a     |    freeradius-server-3.2.0     | NOK | http://autobuild.buildroot.net/results/b65e89597303185021673d174b00ac28e3c99ab7 |     
    mips     |           frotz-2.54           | NOK | http://autobuild.buildroot.net/results/d05f9d9af6570d9c4aeda993d9a067eeab83e567 |     
microblazeel |           frotz-2.54           | NOK | http://autobuild.buildroot.net/results/7b27c31ff298055c85a717b2c9daabfcb17b7868 |     
    m68k     |           frotz-2.54           | NOK | http://autobuild.buildroot.net/results/06653ef4cf8f83fdd7cdfbaa2ff05b09975b87ed |     
   sparc     |           frotz-2.54           | NOK | http://autobuild.buildroot.net/results/6335f232656af01582ce60537e54c220a973a77c |     
  mips64el   |           frr-8.3.1            | NOK | http://autobuild.buildroot.net/results/f8809667bb1762685a7d244fc170b2d317d1280d |     
    arc      | fs/ubi/ubi.mk:51: /tmp/inst... | NOK | http://autobuild.buildroot.net/results/82415f025bfe3af6de0d7765275611f4192d841b |     
   mips64    |         gauche-0.9.12          | NOK | http://autobuild.buildroot.net/results/91a05522442792f0ffbc676084c59710cb344590 |     
  mips64el   |          gensio-2.5.5          | NOK | http://autobuild.buildroot.net/results/54fe829c281a6c93ab7ce069458019eba96a97bc |     
    arc      |          gensio-2.5.5          | NOK | http://autobuild.buildroot.net/results/d370110cfa5a77b9671ed21a39d345258aea0e1e |     
powerpc64le  |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/2c1fd7de926b9fec0d783c959bfe7e23b1205eda |     
  riscv64    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/d1398abc85174f0cb609d7e651b9d5a41617193f |     
  aarch64    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/688a13a7bf628168f5437bd582b74caacff8842e |     
  aarch64    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/ce3df1c4a8b28d9c7f1a51980a8666f73042ed29 |     
powerpc64le  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/0c007889f11c4fde45c624ee8afcfcda23e8f58f |     
    sh4      | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/2c90b79ed301b8977124462e942d6f93200c4273 |     
 microblaze  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/b22c3846d6d5929e34bf8a336739dddf6d2cff68 |     
   sh4aeb    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/6abd82fd747efe7b107bee30d86bd1e53c4d53ac |     
microblazeel | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/c3b1a190376fe9bf5733d60c4052931891695e0c |     
  powerpc    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/55d83f253b54248cd86bce101fa6bdb8e633ff56 |     
   nios2     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/d4d94f8c71e89e068563d7efdcad4eb0f50eeca1 |     
   nios2     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/3d8d843d3fc8b75bbb6eaad1fce935997ac22991 |     
    mips     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/015cf6357d621af1d266d58870bed58a6527f8c4 |     
  powerpc    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/3cf7b738e537c92c3d6d74c73672d9a9cde170ed |     
   nios2     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/fc8f67b9f5533633f841473db471fce033bf27c8 |     
    mips     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/c2ef0acb598537285a2d4e8b018eb92c60109d90 |     
   arceb     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/76bcc3d7644185c4ab2f2480d78c9954e1389ce8 |     
   mipsel    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/e21787e85f430a4f27e973aa8168db78219c4cc8 |     
   mipsel    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/610d1e0f9a63ca93fdad4b7698bb3d2d20729ca9 |     
   x86_64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/da087bb72c749950b4450e7cebb5b270167ca7fe |     
  powerpc    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/dbfd89462cbf3c3e98c9cf8caac42396cc4aa2b5 |     
microblazeel | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/0c69b46ce7dbdf7c1339c58f39e46b047cda0054 |     
   nios2     |     gmrender-resurrect-0.1     | NOK | http://autobuild.buildroot.net/results/8abf87e06166767db9650ce101d4ae01804faef1 |     
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/37b48eed11191805fb0860b0534a55cca73c621d | ORPH
   s390x     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/b2889696cea9962a933a1122d23a4ab2b4beb415 | ORPH
 powerpc64   |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/1e4a55cedbe399d388ac82793a2d97be04fed540 | ORPH
   s390x     |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/9b0181b70d98bee7befc310b6b6b50d41e27a383 |     
   s390x     |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/9a8fe328e4d4ffae00ba43b796956b243c273942 |     
powerpc64le  |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/de486e6d20c48d0bbfcc4bbf68a0e6a4860cdfd8 |     
    sh4      |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/0568f6d22a10cc95e5aef21cbba46b7f73b52c2c |     
   mips64    |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/ade6a67df692aa4b2583f410d70d4e6c6f3ed113 |     
   mips64    |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/08a52595fbc668acd2596b668d27e1eeb019c1a9 |     
  mips64el   |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/db7dc919c3c2caf65c1f1b29f6f311413b513df0 |     
  mips64el   |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/64f4ce11c905bebd815e1a98eb792d576b440a34 |     
   sparc     |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/314a46834235a7a7e77847510b0a4f73c41f3c60 |     
   armeb     |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/ee64267b4e179dcc042f91a36410e47810cd05d4 |     
  mips64el   |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/11381004064d809a303a2c869b371d330dbdc14e |     
 powerpc64   |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/cb710ef7dad654ff18854e4b960d83785377a22c |     
    arm      |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/ab19ec2e051ab4cc1de8bb10bde545cd56dd4d8e |     
   sh4aeb    |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/c5b99ad98f9797ecbf9bb3fa26227c7b0352f0db |     
    or1k     |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/2abe63ef2f9bab5fffe77b5d6579540f64818930 |     
 powerpc64   |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/3f53d4b3f04eec5f844b52c0d4395d506608c848 |     
   armeb     |          hdparm-9.63           | NOK | http://autobuild.buildroot.net/results/b04848888ad264241f6fe4d440820783a5eaae45 |     
 aarch64_be  |          hdparm-9.63           | NOK | http://autobuild.buildroot.net/results/b147c786ec35947b4f5ffdf5d7f4a0614bc2589c |     
  mips64el   |          hdparm-9.63           | NOK | http://autobuild.buildroot.net/results/68c1a17ed436a9e0fdffa130677a622e9259b979 |     
   sh4aeb    |      heirloom-mailx-12.5       | NOK | http://autobuild.buildroot.net/results/4f2afbb9fb7a532aab327d9109e7c9d0c1f73ab0 |     
   armeb     |     host-berkeleydb-5.3.28     | NOK | http://autobuild.buildroot.net/results/7d264d104dfe085ee928726dcd98c502cc825089 | ORPH
powerpc64le  |     host-berkeleydb-5.3.28     | NOK | http://autobuild.buildroot.net/results/e55119bfe427e35ee093f7836a4f1b40e3c2136e | ORPH
   nios2     |     host-berkeleydb-5.3.28     | NOK | http://autobuild.buildroot.net/results/b94e28c50edf9b46c47387a56f361cd1984701d4 | ORPH
 microblaze  |     host-berkeleydb-5.3.28     | NOK | http://autobuild.buildroot.net/results/c1c819f7c00b759e0394b0430c0fb5a9a50968aa | ORPH
    arm      |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/0edab6a5d32ec9ae427f48cd0fc83a9fbc9a6bc7 |     
   x86_64    |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/8b28120e3c53b2170125434bb4acfd47f5b8074f |     
   sh4aeb    |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/7211aa4bf56ffd7a4ef8ec4f726b1d021e00fe31 |     
    mips     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/ecba04a1bb7d0fce799d868fcbfb46ad0b95b6c7 |     
  powerpc    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/6f71690e97e3006c743f0519c2d353a89d68bfb8 |     
  powerpc    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/e0254558e91cf9d693fb1b107de88eb5f8d0d458 |     
 aarch64_be  |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/8cea6f16017dde0ee7501c32a6f3072c13646398 |     
 powerpc64   |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/39c1caec4df1aa3c005b05d5d035a34be2990c78 |     
 aarch64_be  |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/e97e61cb73b03da14ff08166e27437669a75a62e |     
    mips     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/b24bd663cab7c2c14b95edef20f92dd4bdccaabb |     
   mipsel    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/2e584e8e5a4c640f32a8549906dea84a8ae24de7 |     
  sparc64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/f1ef96ae66ac583083cde885901a75dd66255b28 |     
 microblaze  |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/979eb3bd538076c717630c877f90ccdceeaa9530 |     
  powerpc    |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/4811cabbe31c11ce87f676bd0a9dddd674c203f8 |     
    i686     |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/0d9446e12ee4d9b24fcd8a408cd313bc076d9deb |     
   nios2     |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/68d901755c92d1936d04183875569c8c64bc9d95 |     
    arc      |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/7fd7c5a42f9a31430af9d91ad121cb3abc1d8734 |     
   s390x     |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/68ca56c72d18e9dbc0d61a90af1a525a353a920d |     
 powerpc64   |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/a3d0cab0d2b785cf3a3e455f400bf8f3860eb40a |     
    or1k     |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/f22ed6476d8c380a38d03e833f965b51c0b8107c |     
   sh4eb     |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/e27e4caf78111ffb6c80af9b02fea2c3bd36d0a3 |     
microblazeel |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/dde86f0b503558054a50f900d54dffc2ed9ac628 |     
    m68k     |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/bb6765deb7c128abd07d5f25471132f6b95ef10c |     
  aarch64    |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/1d081977dc48b85147fae629cf8fc1b14c5ea16a |     
   s390x     |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/d9c4ef67bae024ec33798fc288cbfb2e4bae215f |     
    or1k     |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/8558ead1f8d6cb8658f10695bf50c6edab8776ef |     
  mips64el   |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/b89554090a78ba207d14580f52addf36130e3df9 |     
microblazeel |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/ba2c1a6a4db7417caab14a599d9a8adcd811f7e3 |     
   s390x     |     host-gcc-final-10.4.0      | NOK | http://autobuild.buildroot.net/results/d1578c5ff400e597faed6d092357fc25ce503e29 |     
    i686     |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/93946c4ec0de12574f69afa143bba32b5cec2335 |     
   x86_64    |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/d7e1436dbcc54c18a802697b5722939f66d4c2f1 |     
 microblaze  |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/eb1c49f96000838802ba02096240acdd63615cb4 |     
   s390x     |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/0c3d47a936b49153c0afd91abfbc69c5d963dbd9 |     
    i686     |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/cc2de22d7a36b510cba0c30439306727fa50d086 |     
   s390x     |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/f2e31585c9c1a75b60f3f62ffd98f89c6ee7372c |     
   s390x     |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/a618505e2967afab0fec7c3d8ce3d600ad87a636 |     
   s390x     |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/96f62ed375163e65e3ce396dee0e62436fe59339 |     
    i686     |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/d9df79239f4affbc1ac99e426bc2f404deb1a235 |     
   s390x     |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/aaaf1d508ffaca02820596cd15d8ef86bd1318cd |     
    i686     |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/314e8d81e4eb6b5f99975e9dc5266afe0fda9ba4 |     
   armeb     |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/0a80325d27492d4cf0c6fcded80dac7ec7f84c1c |     
    mips     |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/f079c83087481787acce80b953179fc9ae60e064 |     
   x86_64    |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/90928cc9fe43e665cfa4d8acd5ff68549d85dd59 |     
    i686     |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/78c103b8ba1085e90fc48526cea4383151f75024 |     
    i586     |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/ae8b8a9422deb6b1cd167267c2854d01124c8f6b |     
    i686     |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/cf929ba91fc9330111201d0150d1140e7c14bab8 |     
   s390x     |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/0b962555bc949275718222db4f4c4aa5e0bc26ec |     
   x86_64    |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/8ae4b1e53207dd9287a91423a64be40431616946 |     
   armeb     |    host-gcc-initial-10.4.0     | NOK | http://autobuild.buildroot.net/results/b6ed4c5e765cff88dbf2cc174c455e0aed285fca |     
    i486     |    host-gcc-initial-10.4.0     | NOK | http://autobuild.buildroot.net/results/d6868e37bde13e4571acee1a6856fb059583276a |     
    i586     |    host-gcc-initial-10.4.0     | NOK | http://autobuild.buildroot.net/results/775049bece0056908161192773f6d5277f3afae3 |     
   x86_64    |    host-gcc-initial-10.4.0     | NOK | http://autobuild.buildroot.net/results/526c5dc463cbf84c9f6d9868c195e11ebd90d13e |     
   x86_64    |    host-gcc-initial-10.4.0     | NOK | http://autobuild.buildroot.net/results/915ae90691b9df8caf25fc02862f754498d760ac |     
    i686     |    host-gcc-initial-10.4.0     | NOK | http://autobuild.buildroot.net/results/8e70e0a35ae5c8bc78ec1d0905ffe30093cde907 |     
   mipsel    |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/84d6e965d749a2a472e600a6e6041f250df24aaf |     
    i586     |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/23e0cd08237883181e4b71cfd0ff4c50462b6117 |     
   mipsel    |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/365c466ac58c6701cad3b2cc7dea2df521e8c9db |     
   x86_64    |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/77ccbcf82eff8cfc23fead1b03fef12ca231451c |     
    i686     |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/e2fa9a8c3e9dfc760dc8421b820a5dc02796454d |     
   x86_64    |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/4c98e2d31379a3735085988426ac655816d89abd |     
   x86_64    |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/182f00bf74b381dffe44b3273ac82ddce2a44e63 |     
    i686     |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/bbc807e7f87e36ca1acce5f9f6073aa4d72a90b7 |     
   x86_64    |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/02f3c125095941672acdfa8e04cf8e49efaf2cef |     
    i586     |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/70db99f0d2f2cff4539aa1c71302c4027ff62231 |     
   xtensa    |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/2b3dab8fd429a7435f9fadd2822a6a1d078aa889 |     
   x86_64    |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/d1c930bf4a81f3328a7f69635b2959867ae3208c |     
    i586     |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/29906b1f11be0ad1586604b7f012442c9aac24c9 |     
    i586     |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/5f0152315c529d83b4db3607349e01702c793c42 |     
    i686     |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/7ece8fb406b5a5c96e61a7a400f517c4f76739eb |     
    i686     |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/c73d43a11f3a9cee6848c2241bc9b870c28ed2e1 |     
    i686     |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/092d9f7096a2dfbbdb027f04bbe9441ca72d8edd |     
    i586     |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/ab58ed5de10314590fe77029bffe1ee069fcde61 |     
   x86_64    |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/cd52a80ab6dba05bde55799f4ba4abf123166f99 |     
    i586     |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/cafa50416b5d4f7c4c867703ced0abb0750b40d1 |     
    i586     |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/ff39e16376b753401f5b52ff00044501abe931a3 |     
   x86_64    |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/fcc573e6d6d2374151f21b261b10b018d107eb18 |     
    i686     |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/fc93b398ceb0019eaa55315d919b3de1bf599bde |     
   x86_64    |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/7ed9c7377f831989aa2e3e5fec4e1eb5d1076b8f |     
    i686     |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/027739a3658cc2c3068fbb2b9e42dd650241129b |     
   x86_64    |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/77e91d226015c0138d50aa5d039a6774e110f90b |     
    i686     |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/704e80dd2f92bc4df95c3b7818a96286c77709cf |     
   x86_64    |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/5a264fc24774cf5138251ea3188506696d21d9d9 |     
    i686     |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/d63f9fc6e1f025c481acbc39c0beb80ff5ad54c4 |     
    i686     |    host-gcc-initial-12.2.0     | NOK | http://autobuild.buildroot.net/results/98bee4f45c09341ee88f36aed452520121261f6d |     
 powerpc64   |         host-gdb-11.2          | NOK | http://autobuild.buildroot.net/results/0bb5868be418ca5097f6e115348cecb5d7179fa8 | ORPH
   arceb     | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/c70fda6bcaa0c5693cbdcb1b46efbaf783b7d24e | ORPH
   mips64    |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/6141f75964ae1934aee5062d688fd0a398797e45 |     
    i586     |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/32e1d9b41e3aab396924b4b909e13ff647eb8c01 |     
  mips64el   |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/1e14007675306590f82f265eee2e02fb485b4d44 |     
    i686     |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/de00115d79d4f56f7f34320ee09bec6d189788e7 |     
   mips64    |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/026afda547d8ad9921a7fe3a1e0a59c3dbe069d1 |     
  aarch64    |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/527e888f443397d13979586d8457f1054903c803 |     
    i686     |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/2756798fa6ddf3df90a36c823053197a6635bef1 |     
   mips64    |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/a86c33fc570edb8ee5b95dd6ac552d55e7ba5234 |     
    i686     |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/e440caba82e6480cb3c4198c553901e59f74598e |     
  mips64el   |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/2793f6812928a120cca0f51ee685b43798071154 |     
    i686     |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/51119682fd942643277bd26bf1753f22443133f8 |     
  riscv64    |   host-moby-buildkit-0.10.0    | NOK | http://autobuild.buildroot.net/results/1963e2a20e5f4a070141da7ccab30d9ddaf4bb9c |     
    or1k     | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/ac2976e47e8e75351ab396d303216d694863828c |     
microblazeel | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/aaffec93e42ae90b726b197d9fd9bea36d38cb47 |     
   arceb     | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/039a7163f1986c6936a48e24d2577b3677205ac1 |     
    arm      | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/c4e46675060666e94663fed3db112b8e12581c4e |     
 microblaze  |     host-protobuf-c-1.4.1      | NOK | http://autobuild.buildroot.net/results/7422f83b06bd5af56ac74e2406d6c1bb050616c0 |     
powerpc64le  |     host-protobuf-c-1.4.1      | NOK | http://autobuild.buildroot.net/results/1b43c88f7530ca3e0bddc03ce3fd25a8ea703a6a |     
 aarch64_be  |     host-protobuf-c-1.4.1      | NOK | http://autobuild.buildroot.net/results/3db83fde52b27472c4114dbbc947090ff286437e |     
 microblaze  |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/69d43511d4c991fa14f17bd60b69c4ebda141d21 |     
 powerpc64   |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/9b32a1a00efc989ff06821a8c09f85361a7b6f74 |     
  sparc64    |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/edeaf7c54c7f77fc64c9513f85e9f11769e1b929 |     
  powerpc    |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/c675ced0f5a5511c530f4e83fc73458a24b5bf47 |     
  sparc64    |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/5e91f0d853b098d00491078fbb40721d3ade4acf |     
   mips64    |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/6d7e9ec764081d4986dc096f281bec1950fe9e9f |     
  aarch64    |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/c5c1ca0df53381ee1a4dca1a6f17cf4ed65d152b |     
    arm      |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/cc2e65c4d514152b68588de11b88fe415a5964ec |     
   sparc     |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/fd7699c3db7018a9f0500c785a115419783295b6 |     
  riscv32    |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/f42a5800c535f2c1d656fc0c6ff01d613d411b9b |     
   sparc     |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/08c0f743f20104f6071b360c4445418bc23ce0b0 |     
  riscv32    |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/dc9b292d8c3a0ad2f7257592d50baa7792da17f5 |     
 aarch64_be  |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/733112350785f6ff7124f22869efa85c8c86c137 |     
    arm      |        host-vde2-2.3.2         | NOK | http://autobuild.buildroot.net/results/e4fe1aac841d449425c84612fc3c39f072d7c6ae |     
  sparc64    |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/99bf338bfbe4646c0e50bcf6724a9bece1a0efcd |     
   s390x     |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/372574ed58139636184209f3102565baf475fd1d |     
microblazeel |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/068f3cbb308a23cd8167da6220e1bca5e6acec8a |     
    arm      |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/7ab1cb09e7620b69172d23411fb7af33cbea8c72 |     
   armeb     |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/2f2cdb840672e44f60dd7a695c8de7973871f727 |     
  aarch64    |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/aeff18b9c1c44beffe8fee5c90fcede67ad9cdbc |     
    mips     |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/1a008e5db397161936784c94f75099093a3ddeb4 |     
   mipsel    |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/2eebf8264327bd492ee8cadc0c539d42c4f2e252 |     
powerpc64le  |         jhead-3.06.0.1         | NOK | http://autobuild.buildroot.net/results/b9980d150e61052802fcf5a26d36ccdf00410fb2 | ORPH
  powerpc    |         lcdproc-0.5.9          | NOK | http://autobuild.buildroot.net/results/4e06cf71faff1e3e89f7e04169ce6882cceb169c |     
  sparc64    |        libarchive-3.6.1        | NOK | http://autobuild.buildroot.net/results/11ec3edb8790f602a93a9d2d353442dad94b2da6 |     
   mipsel    |        libarchive-3.6.1        | NOK | http://autobuild.buildroot.net/results/8fcbf3eedf789b725c7d6dca8af5aefce4c212b9 |     
  riscv64    |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/11a9c6e4ab1a0ed56b3d8b221be6d517f9126a38 |     
  riscv64    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/76122eec98ef56001435cea154fb1acad015caab |     
   nios2     |         libdnet-1.16.1         | NOK | http://autobuild.buildroot.net/results/e1ff5ca46e83db2c722f782387dbb7402b8d459e | ORPH
   nios2     |          libee-0.4.1           | NOK | http://autobuild.buildroot.net/results/e49b9b5a0e05b7ec69965c4a3c4cc924372cf94e |     
  sparc64    |          libee-0.4.1           | NOK | http://autobuild.buildroot.net/results/f6b6eea17d48570f8046d0a9baa6758f4e32c46c |     
    arm      |          libee-0.4.1           | NOK | http://autobuild.buildroot.net/results/f19e054ed34a87ee0603c6907a907e7ad5aa8a5f |     
powerpc64le  |          libee-0.4.1           | NOK | http://autobuild.buildroot.net/results/44a40ca5ee4b8c2bff09d896cffe14d42529894a |     
   armeb     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/c11545e65bfddfbc8fe016125d1cf740fda8f847 | ORPH
   armeb     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/720b3c849383b027cd011c15b00bf2dd918f4dc0 | ORPH
    arm      |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/61e5f0079f77aae29c6fa2101b2c40e841cf3b6f | ORPH
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/7a13eff0b168a6a0e768fde2f8fbc2785ef340d0 |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/01f6b24a5925e4716287f0215677fe13d807439c |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/ad69d1bc76780d5596a554e8ca17369b914298eb |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/ad0be4f4e7ec3e34542d2510129143ca7143b40c |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/d4ca489209d0e4710cebfa03926cfcb27981b0f2 |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/57145e43fd6566710cdca38f830a95ec72d31d95 |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/528c458037ccd82fa15aadb54dcb49198e7e6d6d |     
   mipsel    |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/507fb53e8b52f80fe1b46d22dbb7046c2124cf6c |     
    or1k     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/119156f54a8f8d87aba13bad65441cbae2d7443c |     
   mips64    |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/1e02b0ab2de70263c4fcfa8a15a8b3a787583453 |     
   mips64    |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/433658eb347cde1d69802befcd34bf348b0ee17d |     
 powerpc64   |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/351b6c2ab7cdf11fd7859bda6b95445ff858db77 |     
  sparc64    |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/2e11e06ca2bf7953aae1af01bb1b3063e8f1327f |     
   mips64    |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/acdd05b84fdfa2f552e8420a00992e93da4e0deb |     
   s390x     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/94a313647b23c1476af956563e5efd2c2dc5d2de |     
 powerpc64   |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/87a958d3ba36fb693335cd5971f152cf1f3910cf |     
   sparc     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/56e99855a2bde09b0ef0c3573c986aa5255e0098 |     
   sparc     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/26290b38331045d91ae5613ce1bbcd7724cee321 |     
    arc      |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/7d948669c7764c280117779ae22586f458ccaf1d |     
    or1k     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/1abc0412bf530c0d61ffe79a30bd6d6bd8250f49 |     
   mipsel    |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/e7fd5ac451fd717138b0b3fc3181ab814e49b0fb |     
    arc      |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/9c240092023059db9ce3315daefec8548b1cad0d |     
powerpc64le  |       libopenssl-1.1.1q        | NOK | http://autobuild.buildroot.net/results/d1ab3d5f93476afcbde79d8802fc0fef27b94664 |     
 microblaze  | libsvgtiny-ea9d99fc8b231c22... | NOK | http://autobuild.buildroot.net/results/498b411f61c39dc322468028fe2ecaec8ae74105 | ORPH
   mips64    | libsvgtiny-ea9d99fc8b231c22... | NOK | http://autobuild.buildroot.net/results/abed41281bd2f0d21ea5a985dc329f9f253860f7 | ORPH
   xtensa    |         libxml2-2.10.2         | NOK | http://autobuild.buildroot.net/results/18f5d9360bb6464713ea6be0b15b8ebeb24caea2 |     
   x86_64    |      linux-5.10.145-cip17      | NOK | http://autobuild.buildroot.net/results/3f3a539658c9c49ef0409a0aa6fb3f5fe95b6f7b | ORPH
   sh4eb     |      linux-5.10.145-cip17      | NOK | http://autobuild.buildroot.net/results/297a98fd1d280444218203d582eeeca9c4d73452 | ORPH
    m68k     |    linux-5.10.145-cip17-rt7    | NOK | http://autobuild.buildroot.net/results/eb36f9ec365e66bee649b88cf273a66a72b4d592 | ORPH
    arc      |    linux-5.10.145-cip17-rt7    | NOK | http://autobuild.buildroot.net/results/f8ee607bf748f93558ee9fad45363e49c8102505 | ORPH
   sh4aeb    |           linux-6.0            | NOK | http://autobuild.buildroot.net/results/7716fbd44a8820139c8dece0f01acc015ec89b78 | ORPH
    sh4a     |           linux-6.0            | NOK | http://autobuild.buildroot.net/results/c4d4d559af8accc217b4cd5333e355cffbb9376f | ORPH
   x86_64    |           linux-6.0            | NOK | http://autobuild.buildroot.net/results/bddffff9d19ec1afb0f872bbc3982eaa63f712a0 | ORPH
  powerpc    |           linux-6.0            | NOK | http://autobuild.buildroot.net/results/031c90b637145931482457001dad14d75978f88f | ORPH
   armeb     |           linux-6.0            | NOK | http://autobuild.buildroot.net/results/7f5d6ea3b0a5a8e9c770e1f9ed1e979c6b26535c | ORPH
   mipsel    |           linux-6.0            | NOK | http://autobuild.buildroot.net/results/648af2f0604b2613bfec91123181290c0c7b86d4 | ORPH
    sh4a     |           linux-6.0            | NOK | http://autobuild.buildroot.net/results/a985cd7c65744002e38ebd063471d1d2dd3b2cfc | ORPH
    mips     |           linux-6.0            | NOK | http://autobuild.buildroot.net/results/605ada98751cafe95d20eeb2ba7d0486241e9a72 | ORPH
   mips64    |           linux-6.0            | NOK | http://autobuild.buildroot.net/results/e3c117ed82bf7384d4df6d1f2926186500df11c2 | ORPH
  mips64el   |           linux-6.0            | NOK | http://autobuild.buildroot.net/results/35fc352b4ff8497ed8d9adc0cc1b612928d77c46 | ORPH
  riscv64    |           linux-6.0            | NOK | http://autobuild.buildroot.net/results/da7334f8233c1043577adbb65cb4a5ff0940c7c4 | ORPH
   xtensa    |        linux-pam-1.5.2         | NOK | http://autobuild.buildroot.net/results/f9e1df50ac4473c6da4e359c0e76747ce632bf0c | ORPH
  mips64el   |        linux-pam-1.5.2         | NOK | http://autobuild.buildroot.net/results/e062e16a296f8dac44e7c9d5e39f7d7421dc6084 | ORPH
  sparc64    |           lxc-4.0.12           | NOK | http://autobuild.buildroot.net/results/d50e74b8233904126badfd3196d80a90c3808a50 |     
  sparc64    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/3600a4abc96e25315f2a6c810e2dcc06878709f8 |     
   s390x     |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/e320013c7b46fa918368cbaabe0630bd1745aaff |     
   x86_64    |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/73f96d31b3026027bbf9ce4b594cff4e0b258101 |     
  aarch64    |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/12fca8fb2e7dee5168b6048537109630114a3778 |     
 powerpc64   |         musepack-r475          | NOK | http://autobuild.buildroot.net/results/3328a4fb317ddfcbcf8b101d9a8525a8ec09cf72 | ORPH
 microblaze  |         musepack-r475          | NOK | http://autobuild.buildroot.net/results/f9b249a380da4b1e0dea90e0e5e91aba3acfe192 | ORPH
   s390x     |         musepack-r475          | NOK | http://autobuild.buildroot.net/results/c7a1d0a9b386e1889e1f4060905be2aef3f30552 | ORPH
    sh4a     |         musepack-r475          | NOK | http://autobuild.buildroot.net/results/d622b49271a1d9e4b3c25d52823c7b43bb20f5a1 | ORPH
 aarch64_be  |         musepack-r475          | NOK | http://autobuild.buildroot.net/results/305b82f567e4b555a87ec38d21ff987fb19bec42 | ORPH
  mips64el   |          nanocom-1.0           | NOK | http://autobuild.buildroot.net/results/867c7aded9c1c22ed2b2d4fcfdb4edddf6f7ddd3 |     
   s390x     |          nanocom-1.0           | NOK | http://autobuild.buildroot.net/results/15a11beaf098574ddcbe96e61f3d429b7d21b50d |     
   nios2     |          nanocom-1.0           | NOK | http://autobuild.buildroot.net/results/9da2cc167febc8b71faf1ab1a3e762a84ed0eb1b |     
    arc      |          netsurf-3.10          | NOK | http://autobuild.buildroot.net/results/dd59745d3ca5392ca52dd95a921e083e8a29aa14 |     
    m68k     |          netsurf-3.10          | NOK | http://autobuild.buildroot.net/results/b86d2ff346d837f71a7081520c036f22eec38332 |     
  riscv64    |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/147344ff0506f171c3bf9619d171e3e91d95f56a | ORPH
  riscv64    |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/c58ed84b136231dbe1615f55341c8cbafc8d79a2 | ORPH
microblazeel |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/9dc991f88ed76f128f7329e8fac496c73cf724f2 | ORPH
 powerpc64   |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/35b27b8633b1b5f1e2a1cc26ac93fe1482d8a4da | ORPH
  mips64el   |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/5bdfd605ca8f2045450f1bef3e82e4375f27fc49 | ORPH
microblazeel |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/fd84803a0354cb27ea7b8f7c53b1759d98f5be61 | ORPH
  riscv32    |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/91db0745d7c260260def085819a3ae12ad683a06 | ORPH
   arceb     |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/e35514d57c843f2cdbd3669926c795a4de18f09a | ORPH
   s390x     |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/5c83cca0b67606e7f156a81ed0d997844e6e77be | ORPH
   sparc     |        open62541-v1.3.3        | NOK | http://autobuild.buildroot.net/results/ca9b1beb4a23cc2a97f9817e198d23ad550687e4 | ORPH
   sparc     |        open62541-v1.3.3        | NOK | http://autobuild.buildroot.net/results/c9bb2f747ad186f10005bf8a3f16798c16f98921 | ORPH
    arm      |         openal-1.22.0          | NOK | http://autobuild.buildroot.net/results/8ef6b5c476c747020f3f51027e6614eeef1683d8 |     
  sparc64    |        openpgm-5-3-128         | NOK | http://autobuild.buildroot.net/results/c3885e38714b562057a0317195592750e699466e |     
 aarch64_be  |       openssh-legal-info       | NOK | http://autobuild.buildroot.net/results/f6242bd5dfc3b4c841affc1cc31ac7c72bdd381a | ORPH
    arm      |       openssh-legal-info       | NOK | http://autobuild.buildroot.net/results/1333413453092506b684d52603019c31f74f9508 | ORPH
    m68k     |         openswan-3.0.0         | NOK | http://autobuild.buildroot.net/results/149174e4c3fd9a2416039f81531be62c64f71415 | ORPH
    arc      |         openswan-3.0.0         | NOK | http://autobuild.buildroot.net/results/21ca84da0d3de0f3c95fd9ac81e9d1ffbcecadb7 | ORPH
   x86_64    |  openvmtools-11.3.5-18557794   | NOK | http://autobuild.buildroot.net/results/4013efa753638c5871b123f04c333e2a3976f6cc |     
  powerpc    | package/openssh/openssh.mk:... | NOK | http://autobuild.buildroot.net/results/1b2d287b563afa4fcb06fe6ecf37df59977038bb |     
microblazeel | package/openssh/openssh.mk:... | NOK | http://autobuild.buildroot.net/results/14caf1a54f3712567aa267960f8c91892dbddaaa |     
   armeb     | package/openssh/openssh.mk:... | NOK | http://autobuild.buildroot.net/results/8d2f41575c184e87645ebe1add0aa49e26b66668 |     
    sh4a     | package/openssh/openssh.mk:... | NOK | http://autobuild.buildroot.net/results/133f95b7ef6bd4cd02c06233c4d1e0cd35bdfb9c |     
  mips64el   | package/openssh/openssh.mk:... | NOK | http://autobuild.buildroot.net/results/d0992216d4088b3d075571ee30d50e7beb1b0875 |     
 powerpc64   | package/openssh/openssh.mk:... | NOK | http://autobuild.buildroot.net/results/84834395918de48f5b528d4959005ce39d6ddcbf |     
    arc      | package/openssh/openssh.mk:... | NOK | http://autobuild.buildroot.net/results/436483e8b2bcee488d90ca03bab34409c849a4a5 |     
  riscv64    | package/openssh/openssh.mk:... | NOK | http://autobuild.buildroot.net/results/f0cec18fd74fff5b2b91ec85b8e9b8e5f23c693b |     
   sparc     |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/06844aad9dc4174790da5678854166e0a1c3a001 |     
powerpc64le  |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/5206fe7c08bfc1ef40696b3c9891596035bc88b6 |     
powerpc64le  |   portaudio-190700_20210406    | NOK | http://autobuild.buildroot.net/results/e61c20a73cfedbec25be0aa72ca12e1c81b447e3 | ORPH
   mipsel    |   portaudio-190700_20210406    | NOK | http://autobuild.buildroot.net/results/ba5768afd72420f756a9c8601755aceb3df79124 | ORPH
  sparc64    |        procps-ng-3.3.17        | NOK | http://autobuild.buildroot.net/results/3c7557f030308c599c6c8b0f991319e96713e1ab | ORPH
  powerpc    |        procps-ng-3.3.17        | NOK | http://autobuild.buildroot.net/results/78681675f647e5fc022f9d1969a864f1a07a6598 | ORPH
 powerpc64   |        procps-ng-3.3.17        | NOK | http://autobuild.buildroot.net/results/fb12ad987b8e1c0f8c86b5b723ef1801b06f567b | ORPH
microblazeel |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/921826f6cf0dcb3d00cf0b9e65bae72cad6f07e4 |     
   arceb     |          reaver-1.6.6          | NOK | http://autobuild.buildroot.net/results/31e6a6be3404add38fe890549c09bfccf4af33c8 |     
powerpc64le  |      refpolicy-2.20220106      | NOK | http://autobuild.buildroot.net/results/0aacdf29e1c0cb4cf9c14a674da5dc7da7db149d |     
  aarch64    |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/9d524de9a2228c625f37e75d447ee45fe7e74e72 | ORPH
    arc      |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/6570c0e2f3bc59658c36c1fce3e50d6c8334fb4c | ORPH
    arc      |          slang-2.3.2           | NOK | http://autobuild.buildroot.net/results/0d6499f7e318ebc73466847e65680381b2857751 | ORPH
    arc      |          slang-2.3.2           | NOK | http://autobuild.buildroot.net/results/2b1e6cf1fd1f200305bd7420b065d87b8583975b | ORPH
  sparc64    |          slang-2.3.2           | NOK | http://autobuild.buildroot.net/results/1c82c276f6f7d9e05d2bbcb05d47244b31dd829e | ORPH
   xtensa    |          slang-2.3.2           | NOK | http://autobuild.buildroot.net/results/1937e17df21c1d81b1bcc1756a98632d443f93fe | ORPH
  powerpc    |          slang-2.3.2           | NOK | http://autobuild.buildroot.net/results/c1ab1167208a8883097c23b046d900754daefa4e | ORPH
  powerpc    |          slang-2.3.2           | NOK | http://autobuild.buildroot.net/results/829fd0a4e957750baca58a57bbc09d5e05753b70 | ORPH
   xtensa    |          slang-2.3.2           | NOK | http://autobuild.buildroot.net/results/b060b49ab597b4ab80c16f683fbbb88a586c51b7 | ORPH
   armeb     |          slang-2.3.2           | NOK | http://autobuild.buildroot.net/results/7753e0ca864b0f625ab70532354afad05ba84cd4 | ORPH
 aarch64_be  |          slang-2.3.2           | NOK | http://autobuild.buildroot.net/results/4bd9f930d56a884e9dac9402c687484684656a9d | ORPH
   xtensa    |          slang-2.3.2           | NOK | http://autobuild.buildroot.net/results/b83754005952287b6988fd6292afdb5e50650f6b | ORPH
   sparc     |          slang-2.3.2           | NOK | http://autobuild.buildroot.net/results/0799c44cd783bb30d99497a8e0916a9c34fc4d3d | ORPH
   sparc     |          slang-2.3.2           | NOK | http://autobuild.buildroot.net/results/b774271fe8c3f2f59a2cc18d06d45ac806ce935a | ORPH
   s390x     |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/300d7fe6820f90d30a8819eb656d827e3848fee1 |     
  sparc64    |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/4a798d8a3dcc7adaf390536c597fea3fc6c126f6 |     
  aarch64    |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/631127bf2d0d0e1b1075d591d80e20233616c0c0 |     
   s390x     |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/f33da6c9fa8c4c8dbf8fb7a4ceba1fff25b987ae |     
  aarch64    |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/1ce8dd5008995631d7d86d638db86472d884cd88 |     
 aarch64_be  |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/0c62b45ec8a545ebd0caef55774d49ece01b0815 |     
   sh4aeb    |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/6b0b84c0fca3c2cc7c8b7f838dec5c592cd523ba |     
   nios2     |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/c7175756cefc951e036f52ec235ba42d516547e6 |     
   s390x     |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/1c3c48b8df8292090be61bcae8eba068489b747a |     
  mips64el   |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/ceb58d7fe50f56a8b8b38b9652cef0bf8ae48fa4 |     
    sh4a     |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/f5a09339a05446f28d40e0e1f4f64d4454063279 |     
    arm      |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/f8d8c4ef4e4733bc4f336809a3314202be7e045a |     
   s390x     |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/f7ef7cafbbdffc9a71550426b0232e562ddf5ec6 |     
  aarch64    |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/7a6be774b6afe318543481623f6b299d66ad33fe |     
 aarch64_be  |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/b0bfae798f9872ecc2fb9a1be8a3b266f5c4e5bd |     
 aarch64_be  |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/14713962ba365916fce0e8a4ebec469be0559876 |     
  sparc64    |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/08f506147e69e3f86e15262a724116b4c7fbcfc2 |     
  mips64el   |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/56b10b629b2efabf112ab2593e22b050c6dba6b0 |     
 aarch64_be  |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/9b471a5b640ad90832788d55be532a545c56e92b |     
  aarch64    |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/72172f241868c3a3ef716396783c0f7a6dfaad96 |     
   armeb     |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/de0b90fbe73c2b911bcce49369524846d25a59c1 |     
  mips64el   |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/733a8f18dd53452b2c65bc4c7e8c28b564c2a61f |     
 aarch64_be  |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/89e968c76baae1c4cf908217b60c907725161aa7 |     
   arceb     |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/ca02f50ca5a6b5f8438ee051a8b7a7a5a6f71958 |     
   nios2     |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/77fe0b68e4d7176bc275bb62f18794c4255c9681 |     
microblazeel |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/e1381c9fc1a90955ec305635b060b22807daf4b4 | ORPH
    sh4      |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/0fd978c088a6e795dfb1c6465218767b728f0174 | ORPH
 aarch64_be  |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/c31d593f180dac5eb2ca0763204f26d84d4522c7 | ORPH
   armeb     |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/bc4504723e84c3dd96fd3b25039645512b8a2dd0 | ORPH
    arm      |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/88f37f362cbd67fc0a65f014a8343356e8653acd | ORPH
   sh4eb     |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/0d88953ac5097b1e15f064a93dd9ab135ce37990 | ORPH
    arm      |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/6e67bca6800f8732fde34992da8fbf6b274acceb | ORPH
   s390x     |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/ab836555bf1322c04c8843aa3d9c5a90c385bc63 | ORPH
   nios2     |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/59d75a2fd966bc5120e171d8033af15f8a414eae | ORPH
    sh4a     |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/8e2583f9206ab877085570e320041205ae7b2419 | ORPH
   mips64    |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/af49de68427fe32d7e9f0bae0d77c114301e7f66 | ORPH
microblazeel |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/4de89daa362136d5fdfbeb580be354bbb8715c84 | ORPH
   nios2     |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/838020eab3f34c5aaa50ddde805564d2364386a3 | ORPH
  mips64el   |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/bb41841826596d0b49f0d84f465fc556c9969d4e | ORPH
  mips64el   |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/0d972307ad2d5459be9866eaedf465646f03e449 | ORPH
microblazeel |        tcf-agent-1.7.0         | NOK | http://autobuild.buildroot.net/results/0ed18b82fd23cf6ad4452f99b3e7757f854732df |     
   armeb     |           tiff-4.4.0           | NOK | http://autobuild.buildroot.net/results/c2ab5318eb0fc97b1f949e82549d46e91959503d | ORPH
    mips     | toolchain-external-codescap... | NOK | http://autobuild.buildroot.net/results/c880702bbcca8d95a2ed814f53be4e06e6c55041 | ORPH
    mips     | toolchain-external-codescap... | NOK | http://autobuild.buildroot.net/results/9670f8e5b1f65299f1146dceca217b84be7c53e9 | ORPH
   armeb     | tstools-08f6be304040e7b8476... | NOK | http://autobuild.buildroot.net/results/a028fac2d625b0d61be3f7dc307765f1de91b5c9 |     
  powerpc    | tstools-08f6be304040e7b8476... | NOK | http://autobuild.buildroot.net/results/074837f0a6b3f6ac4615db868b01f8a480c6969c |     
 powerpc64   | tstools-08f6be304040e7b8476... | NOK | http://autobuild.buildroot.net/results/f13273cb65f80c681cec136986f12c659cfa5368 |     
  powerpc    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/24cae7e26564467f215cb26bb0f4aa7443c9699c |     
   mips64    | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/80c258c8e157d516c8314de3a6922ed7e06d2b7f |     
    arm      |          umtprd-1.6.2          | NOK | http://autobuild.buildroot.net/results/c7ce975d398190fc191ccc03813f8ec0b3464c7d |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/ae7ece09646536cdc248f640f190cd85c9df27db |     
   sh4aeb    |            unknown             | NOK | http://autobuild.buildroot.net/results/d170ac638637edfcfab9d45c7793edfb519217e2 |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/e85af8698b0f08b40e1b23e0a81542b068f928a4 |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/faaaf52b3813bff8f7e5a4a73b207dab8d072ab1 |     
 aarch64_be  |           vde2-2.3.2           | NOK | http://autobuild.buildroot.net/results/c9403e8fd3bdd9d3ff41b974fd8afd4430f00c15 |     
    arc      |           vde2-2.3.2           | NOK | http://autobuild.buildroot.net/results/468aa35c79cc8cbb34d86325c0b544a4841d14d3 |     
  mips64el   |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/6591d57726620d18987167f08317dc1679cacf26 | ORPH
   nios2     |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/343fea7d2c348de1d46260462f425e657d74a2c6 | ORPH
   mipsel    |         wolfssl-5.5.1          | NOK | http://autobuild.buildroot.net/results/7ce3854e28065a8d9ba4f65c7c9c601df3418d91 |     
  riscv32    |          xvisor-0.3.1          | NOK | http://autobuild.buildroot.net/results/eb27618ea7ab6ebea09610d28056e07fed623c08 |     
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/150cbaa9850b79757f8ae9fe967a07b996fee5a5 | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/be82e2e8419ff49980bef552a59365c5b8db5b50 | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/07e5b452acf8d767735edbdcb39cefa9fedeb126 | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/d7c790bee5a478790d18c4b8b6383a9e7d7ebd59 | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/f70438a8d4edd462bbe77de5ce5a116c72864b9f | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/b8933c0cbd1efe942887321a3585a80ff99d5923 | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/c8773bf236dc9ff347365c284f40a09f44839183 | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/8ea278c370dabc9c96614e1c066d9e83e7c3ed27 | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/080da78bd9c29b032909b146044001e02197b837 | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/77d6716def26ba2717c0733ae6b0a8b5669af273 | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/4853ce0a3b2a02a41ff128ddad7afd571b6be6ae | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/43bc52343a1c314eb7ecadd7726cd03bea7aaa9f | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/cbcdab2493d225e247a08c03b74ec237cf526f79 | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/4beb3584984b9d93b47ec376458fb18d8e4c6eab | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/ef2a94d3065f064df6232e3f5ca48d66378f1957 | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/9574e517d040dd1d574413a0aa940a7fc6b7146f | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/0d8ac9f2f37d668ed67f76c84ecf80a596e8c432 | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/9d3d864895a8a6f4f623ff5a7d10a48ffb6ae9f4 | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/04d4c7ff7c32ea7b2b556a41ed658b123b545eac | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/c03a658666752d3cb96f2c7aa7cf1c91c587035b | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/f724601c55d0be83669828099502c9f63944156b | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/f079952d89ac5ad7e5a4cd4283f4217f5c13fcfd | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/263a3fa63a6b86abceb1d4d0e74af51813e1f3e4 | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/dfb05df16f580e67cc94baff7a055228f8f4bc0a | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/774ab1c33474820284b61280a6776648cc97372d | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/f084a5df6f3a04fdbb67615dbe2fe9a2d7f948e4 | ORPH
microblazeel |           zstd-1.5.2           | NOK | http://autobuild.buildroot.net/results/4f03b881ef0589672b482442f37d6255a40069d2 |     


Classification of failures by reason for 2022.02.x
--------------------------------------------------

                    bat-0.19.0 | 1 
                  exempi-2.6.1 | 1 
            igd2-for-linux-2.1 | 1 
                mongodb-4.2.18 | 1 


Detail of failures for 2022.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/bf5af5b3756f78258183aea401eff9f8bb5dec27 |     
    arm      |          exempi-2.6.1          | NOK | http://autobuild.buildroot.net/results/99206d8634a049a44fecc48fc3fb84c8ea284204 |     
    arm      |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/abd602630a6c0c82da64f0d92a1476af7f414629 |     
    arm      |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/4a26c9c37818d24c30f67cf8af42b6ea04e43cb8 |     


Classification of failures by reason for 2022.08.x
--------------------------------------------------

             fontconfig-2.13.1 | 1 
       host-gcc-initial-12.1.0 | 1 
host-pahole-73383b3a39afe86... | 1 
              host-rust-1.62.0 | 1 
               libcap-ng-0.8.3 | 1 
               libglib2-2.72.3 | 1 
                   libnss-3.81 | 1 
       linux-5.10.109-cip5-rt4 | 1 
                  vlc-3.0.17.4 | 1 


Detail of failures for 2022.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/f363e709c411c068702113318ed9873e480972ed | ORPH
   armeb     |    host-gcc-initial-12.1.0     | NOK | http://autobuild.buildroot.net/results/27bf6c66fb28ed4f1d04008d3ac4a7a784894fda |     
powerpc64le  | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/64c4731a2f99b53c0327e847e383170f15c2adf4 |     
   s390x     |        host-rust-1.62.0        | NOK | http://autobuild.buildroot.net/results/bf53633a5d11f4ec2d33886deac639edf9e1bd6b |     
  riscv64    |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/6a55c18203e90c016eba1be8a6581fbe8ccdabc6 |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/23aad28d266ee4c8d86e6773aa41dc960ebf66c2 |     
    sh4a     |          libnss-3.81           | NOK | http://autobuild.buildroot.net/results/ec5c9e489f7919c0d5d27ca130a6e78257097b90 |     
    mips     |    linux-5.10.109-cip5-rt4     | NOK | http://autobuild.buildroot.net/results/82661b426b63c64b27cab5cf2260b2b40356c59a | ORPH
   s390x     |          vlc-3.0.17.4          | NOK | http://autobuild.buildroot.net/results/646d73d0806bd17ccf5a9fbec69558d746405f44 |     



-- 
http://autobuild.buildroot.net

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

