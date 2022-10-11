Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 811D0C433F5
	for <buildroot@archiver.kernel.org>; Tue, 11 Oct 2022 05:45:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CBE6E40B4A;
	Tue, 11 Oct 2022 05:45:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CBE6E40B4A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vG_JhamxYI_4; Tue, 11 Oct 2022 05:45:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2C9FE409E7;
	Tue, 11 Oct 2022 05:45:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2C9FE409E7
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 43C711BF2C5
 for <buildroot@lists.busybox.net>; Tue, 11 Oct 2022 05:45:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0723E409E7
 for <buildroot@lists.busybox.net>; Tue, 11 Oct 2022 05:45:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0723E409E7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kMAkOE4cHvSR for <buildroot@lists.busybox.net>;
 Tue, 11 Oct 2022 05:45:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4C48B401F1
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4C48B401F1
 for <buildroot@buildroot.org>; Tue, 11 Oct 2022 05:45:46 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 3E21C40006
 for <buildroot@buildroot.org>; Tue, 11 Oct 2022 05:45:43 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Tue, 11 Oct 2022 05:45:43 -0000
Message-Id: <20221011054550.0723E409E7@smtp2.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1665467143; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=mIC5Tm1iA6LRfPJFVph5PzTmcXmAO/E8XGTn6ytgpz8=;
 b=WSD7MXmhBJu5B6Tp+H0wTD10oYkbpT/8OX0/Hfp1cN8yxwecGOeYvcPOyuC2HRaV4wpGso
 CwmAZcuiECdui3ZxsLh8OQmJriSQO9YcYuCZQI9SIctOqiqAVWWPq5EkLkEL8dKuINBJcb
 sIHDl6OINd5PS411PVx1gX715VAvFziQpOaOn4CkdTeC5yky7erJzPFOW1SBneamtvqrjM
 f7gvFLXhEg9SGyk+07fjqeFoUmkz3xtArqUv/h5l4SzoaKXYfIMEkJoJRm90w6PJ0F8OPS
 Q/9iN9UahbzfjgO/XMVXjhkQOpJkDHeNCVW3vIfgeur3IMWYKuIuvzzaQwBKyg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=WSD7MXmh
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-10-10
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

Autobuild statistics for 2022-10-10
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  |  6  |  1  |  0  |  7  |
  2022.08.x  | 14  | 13  |  0  | 27  |
    master   | 109 | 819 |  8  | 936 |

Classification of failures by reason for master
-----------------------------------------------

glibc-2.36-44-g2628500f5dff... | 371
       host-gcc-initial-11.3.0 | 47
             berkeleydb-5.3.28 | 24
      ca-certificates-20211016 | 23
        host-f2fs-tools-1.15.0 | 21
                   slang-2.3.2 | 20
                   bearssl-0.6 | 18
            host-binutils-2.38 | 11
        host-sentry-cli-1.59.0 | 11
            igd2-for-linux-2.1 | 11
         coremark-pro-1.1.2743 | 10
         host-gcc-final-11.3.0 | 10
                   libnss-3.83 | 9 
                      crun-1.5 | 8 
                     fbset-2.1 | 8 
                        brltty | 7 
                    gpm-1.20.7 | 7 
       host-gcc-initial-10.4.0 | 7 
            btrfs-progs-5.16.2 | 6 
              dieharder-3.31.1 | 6 
            host-binutils-2.37 | 6 
                 systemd-250.4 | 6 
                  autofs-5.1.8 | 5 
                    frotz-2.54 | 5 
       host-gcc-initial-12.2.0 | 5 
      host-riscv-isa-sim-1.1.0 | 5 
              libarchive-3.6.1 | 5 
               libglib2-2.72.3 | 5 
                     efivar-38 | 4 
                gerbera-1.10.0 | 4 
            host-binutils-2.39 | 4 
                host-go-1.19.1 | 4 
                     linux-6.0 | 4 
            ocf-linux-20171122 | 4 
                       unknown | 4 
               apcupsd-3.14.14 | 3 
dahdi-linux-5c840cf43838e06... | 3 
           dmraid-1.0.0.rc16-3 | 3 
                elfutils-0.186 | 3 
host-pahole-73383b3a39afe86... | 3 
              host-rust-1.64.0 | 3 
libsvgtiny-ea9d99fc8b231c22... | 3 
                    musl-1.2.3 | 3 
                    sdl-1.2.15 | 3 
  gobject-introspection-1.72.0 | 2 
                      hans-1.0 | 2 
        host-berkeleydb-5.3.28 | 2 
              host-delve-1.8.0 | 2 
               host-vde2-2.3.2 | 2 
                jhead-3.06.0.1 | 2 
               libcap-ng-0.8.3 | 2 
                   libee-0.4.1 | 2 
                    lxc-4.0.12 | 2 
              memcached-1.6.16 | 2 
                 musepack-r475 | 2 
                  netsurf-3.10 | 2 
              open62541-v1.3.3 | 2 
               openpgm-5-3-128 | 2 
                   perl-5.34.1 | 2 
toolchain-external-codescap... | 2 
tstools-08f6be304040e7b8476... | 2 
/home/buildroot/autobuild/i... | 1 
/home/buildroot/autobuild/i... | 1 
                  acpid-2.0.33 | 1 
am33x-cm3-11107db2f1e9e58ee... | 1 
android-tools-4.2.2+git2013... | 1 
                  assimp-5.2.5 | 1 
              asterisk-16.25.2 | 1 
             bluez5_utils-5.65 | 1 
                   bullet-3.21 | 1 
                 coremark-1.01 | 1 
          cryptodev-linux-1.12 | 1 
                 dash-0.5.11.5 | 1 
                 dtbocfg-0.0.9 | 1 
             f2fs-tools-1.15.0 | 1 
                     flite-2.2 | 1 
             fontconfig-2.13.1 | 1 
       freeradius-client-1.1.7 | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
                      gdb-11.2 | 1 
                  gensio-2.5.5 | 1 
      gmrender-resurrect-0.0.9 | 1 
         gobject-introspection | 1 
         host-gcc-final-10.4.0 | 1 
         host-gcc-final-12.2.0 | 1 
                  kexec-2.0.25 | 1 
                 lcdproc-0.5.9 | 1 
                libcurl-7.84.0 | 1 
              libgcrypt-1.10.1 | 1 
             libgpg-error-1.45 | 1 
               libmdbx-0.11.11 | 1 
              libostree-2022.6 | 1 
libuci-4b3db1179747b6a67790... | 1 
      linux-5.10.145-cip17-rt7 | 1 
                 mesa3d-22.1.6 | 1 
                   nanocom-1.0 | 1 
             netsniff-ng-0.6.8 | 1 
                  ntp-4.2.8p15 | 1 
                    olsr-0.9.8 | 1 
                 openssh-9.0p1 | 1 
   openvmtools-11.3.5-18557794 | 1 
          perl-net-ssleay-1.85 | 1 
                python3-3.10.7 | 1 
qt5base-2ffb7ad8a1079a0444b... | 1 
                      rauc-1.8 | 1 
     s6-portable-utils-2.2.3.2 | 1 
sconeserver-8d1935919a20133... | 1 
                  scrypt-1.3.1 | 1 
sdl_mixer-d1725fcb7c4e987ae... | 1 
              skalibs-2.10.0.3 | 1 
                    sslh-1.22c | 1 
             stress-ng-0.13.05 | 1 
                 sysvinit-2.99 | 1 
                tealdeer-1.5.0 | 1 
              traceroute-2.1.0 | 1 
                 uclibc-1.0.42 | 1 
ulog-0389d243352255f6182326... | 1 
               valgrind-3.19.0 | 1 
                    vde2-2.3.2 | 1 
                    zeek-4.1.1 | 1 
                 zlib-ng-2.0.6 | 1 
                    zstd-1.5.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/570c68fc8406c34277b9f5d387d98fc7fd35e5c4 |     
powerpc64le  | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/381b632efdeb7158edddbf0e1ff436ddae452dff |     
   mips64    |          acpid-2.0.33          | NOK | http://autobuild.buildroot.net/results/e7353a7688bce016b5c1faec2e28ceea9f4fe77e | ORPH
    arm      | am33x-cm3-11107db2f1e9e58ee... | NOK | http://autobuild.buildroot.net/results/f214a4b71c44bec8e772bc8863fde2d7d51658eb | ORPH
powerpc64le  | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/3ff3ed4dcbcf2d5be8e984730610c03056d70208 |     
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/8087848f97cbfff8f29dfbf7b8f32a73e32b1cec |     
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/263ebbbb9d165fc64527989c2f8876150087e218 |     
    arc      |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/00d353cb8a1af5d78e3e11d6fd051c95a1688d1d |     
    mips     |          assimp-5.2.5          | NOK | http://autobuild.buildroot.net/results/51944714e39f42b053a014d230744ab75594ed88 | ORPH
   x86_64    |        asterisk-16.25.2        | NOK | http://autobuild.buildroot.net/results/4c2dbfef776d17a13216e6a7bfdea64fa65afc09 |     
 microblaze  |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/e1f4a35c3c020dc0c7546fda599ba1677805d589 |     
  sparc64    |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/cc8c02d55a34b652a8a705500ec8c8098ccbb2c2 |     
   s390x     |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/3f8f802803452c7003af5aa07697f973107ead50 |     
   mips64    |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/632801349c8105fe5cf915d7a40b0c98eeed1b04 |     
   mipsel    |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/77210a433cca40fdcc52133602d6147263e47dc3 |     
  mips64el   |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/3ceb7feda0013376d255e104656a80ec3372bbc0 |     
powerpc64le  |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/064a814466a3ae23b07f99972110425dbbc20b3f |     
   arceb     |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/10343f0b0ad22478d0f8bd5215409607eb3d8f25 |     
 powerpc64   |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/c3ecde2e89269a621bf5be1579d5a460c0f5174e |     
  mips64el   |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/a462cddf584968e9f85f9f28dbef206a2cb425a5 |     
   sparc     |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/1789e2eaa07b89eb9a182c7ddbe0cf9ec009dd7f |     
    m68k     |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/5d78e32a52d5faf32933d47f3d905730d7a43d88 |     
  sparc64    |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/4f7652244ea5dfd523e481c699f6d9ce14d95985 |     
    arc      |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/caf348adcbb545ac1d479311f205340017ae83b5 |     
   sparc     |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/f715d1a284ccc641c7a4d7f61a619a700f10c6fc |     
   mips64    |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/8d874c911f485d882c40930e4beb427f5e538cd0 |     
   arceb     |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/739d1566e1e5033b852c6c776772c782e4d841b0 |     
   sparc     |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/397756e22de2a53a878ca785893e44f9e3492c03 |     
    sh4      |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/5ba32a356977c776bc0dc0cc029ed5e56aac912f |     
 microblaze  |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/9c5e775bccdf7ec38badc34b09660d47d0ef7ca6 |     
 aarch64_be  |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/27fdfa322dd639216421c807ac0ef8fe06ec65e8 |     
   xtensa    |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/2c1e7f458d71557912719e5a78d667d42120ac27 |     
  aarch64    |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/6142d05563eea08dee880e6ee1385324955d4e4e |     
   sparc     |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/e3c4b17a0d9d8a0fc356515cf2d62f43e4555476 | ORPH
 powerpc64   |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/d8490d35cf6f8d26d891e289c470a5c4620754f3 | ORPH
    sh4      |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/f206a49e88e63ca9c997cfd5dd468dfd820ad44b | ORPH
   sparc     |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/51e1d32fc8a34605e8aab24bc92e21b95b609a4d | ORPH
   sparc     |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/41c8c162439c7ea5aeaa897780045089e4e37a7b | ORPH
   sparc     |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/af674f42e51a050ae8b4c6bd4a85b7632eba5012 | ORPH
   armeb     |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/f2fa34ebb1c31c3dd87dd6aed121ab6091d46f56 | ORPH
   sparc     |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/e1a2a1b913d7669d15d01adaa762c6027220ee6c | ORPH
   mipsel    |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/3668a78565cf3c4b29589b7148b1c833e8d52744 | ORPH
    mips     |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/9a3008a5eaf92f9f764ba5e35cc0278ff87f58ec | ORPH
   arceb     |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/f4fe7651f9d17ddf36ef262f5d4a5b62fe3e0efe | ORPH
    m68k     |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/b8511d78da06c6529ba8037730e7296da54770b1 | ORPH
microblazeel |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/4e38a59c1af2579ed57cbbbc072b3ffdf961bf56 | ORPH
   xtensa    |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/397c4c672adc70401158c408b8902ee4cd5eae0e | ORPH
   mipsel    |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/9986fc168345ee6bf8e2f605c4a7fd4cb033d28d | ORPH
    m68k     |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/a3a2ab8e21bcecc922f03aeeb4dd9c1b32ce3d9f | ORPH
   xtensa    |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/4dc72999c0371b4dc96ebaaed50f6459cad12d2f | ORPH
  aarch64    |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/61b0eb59c731ff0ba3bb2e48a38b3956a97d72dd | ORPH
   arceb     |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/f97f47d5633758e5be97982e53c288386f63a4cc | ORPH
  sparc64    |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/32cf75e615a03677de0dc533735edbaab4662ac6 | ORPH
    sh4      |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/6a74f6765801a9a75ccc312d634f6dec96f13ff1 | ORPH
   sparc     |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/8c56e6e11d6eaefb4df33f84ff6b4a537d4c729b | ORPH
   sparc     |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/a0d93ffec9500066fe373d5acab401a7fb26fddb | ORPH
 aarch64_be  |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/fdf02ec42c3030054d5e1d4318673dd902d64824 | ORPH
    sh4      |       bluez5_utils-5.65        | NOK | http://autobuild.buildroot.net/results/2bdcee47f9bf66fa27a54e7d1db025ba62a94655 |     
   mipsel    |             brltty             | TIM | http://autobuild.buildroot.net/results/fc0008b4ca36be6fde4e87e0499d465598f53f3f |     
  riscv64    |             brltty             | TIM | http://autobuild.buildroot.net/results/5faa6b857dea70f7d1b69bab6d96860631c86cc7 |     
 aarch64_be  |             brltty             | TIM | http://autobuild.buildroot.net/results/96964810631bc24bf80ab4480c77a07a30f32704 |     
 aarch64_be  |             brltty             | TIM | http://autobuild.buildroot.net/results/7a85208a485971659939f919c676483db291c03a |     
 microblaze  |             brltty             | TIM | http://autobuild.buildroot.net/results/ac6b6102e62935ca11437fd633c8a0039f0d2eb3 |     
  riscv64    |             brltty             | TIM | http://autobuild.buildroot.net/results/f5b46344217a389b8a13d31ff403460fe46b6a2b |     
 aarch64_be  |             brltty             | TIM | http://autobuild.buildroot.net/results/8f25d204f3234c632d74183837ec5443419f6b80 |     
    or1k     |       btrfs-progs-5.16.2       | NOK | http://autobuild.buildroot.net/results/36a94c0f4572e2fb353ba3527c653509e63e1b10 | ORPH
    arc      |       btrfs-progs-5.16.2       | NOK | http://autobuild.buildroot.net/results/0a554292a3fa5b7d86c1eb5945422621bc231933 | ORPH
   s390x     |       btrfs-progs-5.16.2       | NOK | http://autobuild.buildroot.net/results/f041a29fbd9d792b47eea5ab20056281f9f31c3d | ORPH
   mips64    |       btrfs-progs-5.16.2       | NOK | http://autobuild.buildroot.net/results/38667bf6441df96259ac1bc660393f538e5b7c7a | ORPH
   armeb     |       btrfs-progs-5.16.2       | NOK | http://autobuild.buildroot.net/results/32b103990ed5ab7725f73c810cabf380698a6e33 | ORPH
  aarch64    |       btrfs-progs-5.16.2       | NOK | http://autobuild.buildroot.net/results/218f2a14ede960b0308446d97b08df7a57bdad8f | ORPH
   mips64    |          bullet-3.21           | NOK | http://autobuild.buildroot.net/results/3ed3aa67ca2fd2a9d6e452d9ac84f5ba2f17b626 |     
   arceb     |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/3c5c275cc392d0974d06e38cbade2fcd6108251a |     
    arc      |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/0b0f92acaf0cde1356020700e477510a53fa5601 |     
   armeb     |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/cc3db5505ba27cef6f3acf36a6d9de67cfc55625 |     
   x86_64    |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/1cd870b651e00802cb52671e54a0b4e995bd86de |     
    mips     |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/d79d745b1dcac868559fc5fac4bb9cd24d14b08c |     
   armeb     |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/9ebc803bab004184c4477540546448e212766443 |     
    arc      |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/2562859e08fbc39dad83a87ef609b976be93fda0 |     
   sh4aeb    |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/20fed817b805b31d4ed0f7063dbc1051d0ffa2b5 |     
    arc      |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/1db2b7b1d81802d343c35de6ef103a9dca113e33 |     
  aarch64    |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/49b4a55e41a11cb281da07622566a45082725158 |     
    m68k     |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/3a6be339282ff47d4b8b716b44d8042d5147cf3e |     
    mips     |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/5f8d43e364f706165da146b25191d26117679f97 |     
   sparc     |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/f8f48479532492508d535469f939248cbb9b5f6d |     
   s390x     |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/177269a8f55259e4e2c9dc69711505f863effd8a |     
  mips64el   |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/a3ea3db2ba4a0ecae1666513ad9de94474f8eeba |     
powerpc64le  |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/f2ce1e6552383b5d1d59ed8415adf8d5f02affa5 |     
  aarch64    |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/22f69a960a2af1139bf6a90ba6d14a1fae6987a5 |     
   mipsel    |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/ba7db5c11a13198f9705f74c614354bee14d56ce |     
    i686     |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/16f101b411e52e61e7484162e2367750d002db3e |     
  powerpc    |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/f405352f7dcfa56480300567ec69d4382b013632 |     
   arceb     |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/672dfcbed7d7cf68cc33ba2beacd2ef68fc6f3b4 |     
   arceb     |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/5783f372b67f4fbaf436c64fb342931105928471 |     
   arceb     |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/7f828486a52a4ca6fda5320f92f752478c6de177 |     
    arm      |         coremark-1.01          | NOK | http://autobuild.buildroot.net/results/bafb30199ea58a22b9b7ce8d01e51eb43c54d0ab |     
   sparc     |     coremark-pro-1.1.2743      | NOK | http://autobuild.buildroot.net/results/cc2d0aff82b35ce906bf718ea0d9734d3a5c2083 |     
   arceb     |     coremark-pro-1.1.2743      | NOK | http://autobuild.buildroot.net/results/d2e572c12458730a2a053269d1d076790be6ca94 |     
powerpc64le  |     coremark-pro-1.1.2743      | NOK | http://autobuild.buildroot.net/results/b3174e3c6e1a8ad4f70ce1ca7f82fcea23ab5d47 |     
   xtensa    |     coremark-pro-1.1.2743      | NOK | http://autobuild.buildroot.net/results/5ba0821bd8742b805f134d8df6b16f9f2107785f |     
   mips64    |     coremark-pro-1.1.2743      | NOK | http://autobuild.buildroot.net/results/d5ceb88c4d48f4474f4458ad5f69d2329fa76301 |     
    or1k     |     coremark-pro-1.1.2743      | NOK | http://autobuild.buildroot.net/results/c170ca0cd47fe91150a74891283999599791e1d6 |     
microblazeel |     coremark-pro-1.1.2743      | NOK | http://autobuild.buildroot.net/results/a073c30f418f5a1f5f4ddebac4c222f4299297fe |     
   sparc     |     coremark-pro-1.1.2743      | NOK | http://autobuild.buildroot.net/results/57c771499768be9715734c66ac400517830b782f |     
    m68k     |     coremark-pro-1.1.2743      | NOK | http://autobuild.buildroot.net/results/8f516da3185c51377e7226bce0bb996592172368 |     
   sparc     |     coremark-pro-1.1.2743      | NOK | http://autobuild.buildroot.net/results/e66b18864be835e656594857a70e2970fe9c053d |     
    arm      |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/fa12d773a05c0172ca5cbba51f7cd61d2bb7f6fe |     
   sparc     |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/deb33579d1012f0112fecba03bb799ec87eb7609 |     
    arm      |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/e3c1721a45135ebcde712649d757c07106c9e1a0 |     
   mips64    |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/60c95d20d0c9d87449bc9ee7557f770d1d3f49d1 |     
    arm      |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/37af3b4a41f37075ef3c6d12bea9afd29f7f90f0 |     
  powerpc    |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/07c22135e724a950c4bafd72d8be2ec0d8175501 |     
    arc      |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/9d4ff6bc6c2529c474dcd1277a9e4a7d489fc7a8 |     
   xtensa    |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/adbb5e20305e08e948482ab5e66226b2c6208df8 |     
   mips64    |      cryptodev-linux-1.12      | NOK | http://autobuild.buildroot.net/results/8ba19b1032baf8340633ced9ec9f10f9559bc1e6 | ORPH
  riscv32    | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/f77bd5978467d85f3bd8740e61fe3d8963c3881b |     
   armeb     | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/1e8a70371ed54abb88de588673c1ce418f171804 |     
   armeb     | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/5fec1e3b172c380fb5c5950aa0c8857f3647796e |     
   mipsel    |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/196ebfffff849d478033b704b73a2edb8a17ec4d | ORPH
    or1k     |        dieharder-3.31.1        | NOK | http://autobuild.buildroot.net/results/5092ae82574fbd6e15db7989a1b7c290006bf532 |     
  riscv64    |        dieharder-3.31.1        | NOK | http://autobuild.buildroot.net/results/c0d6122a77e38d6ed1524ed28db2f948afdd7ac3 |     
    arc      |        dieharder-3.31.1        | NOK | http://autobuild.buildroot.net/results/b4b89920bc99bbf6cfaaf2df2e4b9659ca796cdc |     
  riscv64    |        dieharder-3.31.1        | NOK | http://autobuild.buildroot.net/results/31d90386f0d9b43381db3ac286bd12caf7273fef |     
  aarch64    |        dieharder-3.31.1        | NOK | http://autobuild.buildroot.net/results/435d082c53b4be0cc02ad0fbd835b66c03680588 |     
microblazeel |        dieharder-3.31.1        | NOK | http://autobuild.buildroot.net/results/5000ad32e22e3f8842c462380bfb3506453a98c7 |     
    sh4      |      dmraid-1.0.0.rc16-3       | NOK | http://autobuild.buildroot.net/results/d50ddb9d3275d7c0d5cdd384432fc2391d721f48 | ORPH
    arc      |      dmraid-1.0.0.rc16-3       | NOK | http://autobuild.buildroot.net/results/99ff56377b4f129427e7b4057479a1711ecce475 | ORPH
 microblaze  |      dmraid-1.0.0.rc16-3       | NOK | http://autobuild.buildroot.net/results/b7f79b79add34250f778f0a64d05928a12eb926c | ORPH
    mips     |         dtbocfg-0.0.9          | NOK | http://autobuild.buildroot.net/results/9fd2144909dc5afadf86021b23e9ee5131e0c30a |     
   mipsel    |           efivar-38            | NOK | http://autobuild.buildroot.net/results/ffeb07b7f2d82bf3337ef097180c63c4ebefddac |     
    arm      |           efivar-38            | NOK | http://autobuild.buildroot.net/results/4e3d9e9b94bc6423259763be6015e9dd4df32dc5 |     
  mips64el   |           efivar-38            | NOK | http://autobuild.buildroot.net/results/f1fd0c2b21b325260f7a6685bc8aa84b96d8294a |     
  mips64el   |           efivar-38            | NOK | http://autobuild.buildroot.net/results/48457b9eb48b6b25d95eee664b7f808ba5565d36 |     
   arceb     |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/e77150428a8b05283094c1bb14b1f0f6eda4aa3d | ORPH
    arc      |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/641c18be10bded2407e7e9a01266eca7815d3a72 | ORPH
    arc      |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/fb7a361ec586b9433bbed45f49a620d476b28284 | ORPH
    or1k     |       f2fs-tools-1.15.0        | NOK | http://autobuild.buildroot.net/results/b9e522280bc5afc9eff351d8d35d90f19f87dceb |     
  powerpc    |           fbset-2.1            | NOK | http://autobuild.buildroot.net/results/551107a72c23e36d8cfb51c485f9c68794eabc1a | ORPH
  mips64el   |           fbset-2.1            | NOK | http://autobuild.buildroot.net/results/fefdda58e7b30b18a311e314755bcf6fe9313138 | ORPH
   armeb     |           fbset-2.1            | NOK | http://autobuild.buildroot.net/results/adb15e2c489e44320f9f042df342bd9258f156ac | ORPH
   mips64    |           fbset-2.1            | NOK | http://autobuild.buildroot.net/results/db62e9c35ec508fe80708721741498243f13db9e | ORPH
 aarch64_be  |           fbset-2.1            | NOK | http://autobuild.buildroot.net/results/5e451e771cc6eac0158d9748d3615641f85e67a4 | ORPH
   mips64    |           fbset-2.1            | NOK | http://autobuild.buildroot.net/results/b325604a888ccee75188d9ef35efbaba762479c6 | ORPH
   sparc     |           fbset-2.1            | NOK | http://autobuild.buildroot.net/results/a4f8f8a1d5130baf6d5d901bcb8a0bdab6bffbd9 | ORPH
 aarch64_be  |           fbset-2.1            | NOK | http://autobuild.buildroot.net/results/747dd692497aee009bcfd338924ef3065a125e4b | ORPH
 aarch64_be  |           flite-2.2            | NOK | http://autobuild.buildroot.net/results/d8d74e51ad5355a3f57e4d2dea0df5d7fed2006b |     
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/089c5d4d209436a79f508b2cf836ef9eed8190d1 | ORPH
  riscv64    |    freeradius-client-1.1.7     | NOK | http://autobuild.buildroot.net/results/5cdb8ebd95ecfb7fbb8596b5e68f25a3027c1588 |     
  mips64el   |           frotz-2.54           | NOK | http://autobuild.buildroot.net/results/29d4b50ef039c3b2ec8305b7e32ec73e81ee2c66 |     
   sh4eb     |           frotz-2.54           | NOK | http://autobuild.buildroot.net/results/2e105f9e4ffef4690fe6999f32e773d7e57d3900 |     
    m68k     |           frotz-2.54           | NOK | http://autobuild.buildroot.net/results/785f487a83739d65da294f68de066056c84a83ec |     
 aarch64_be  |           frotz-2.54           | NOK | http://autobuild.buildroot.net/results/1c7beebaafe008dd6fd70de8a13e26061b996c23 |     
    arc      |           frotz-2.54           | NOK | http://autobuild.buildroot.net/results/645f4e5e9aa3d175890d5d7154d6788ca4ff4dc4 |     
  powerpc    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/45b07964429b6d78204b1c49ffc050ce41a78f36 |     
    arm      |            gdb-11.2            | NOK | http://autobuild.buildroot.net/results/f6488b6af975248f36876bbdec87b3e3d5f3026f | ORPH
   sparc     |          gensio-2.5.5          | NOK | http://autobuild.buildroot.net/results/4de9cafd1a3d090ff2c670a25de06cc05829ac83 |     
  aarch64    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/f5d6d25032e92014102349601b6c125f328190a5 |     
    or1k     |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/0d1d0d0678d80362dda01887f479d51c3c44f23b |     
   mips64    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/579fcfa8a0ee7c13cd3479c5054ac7e192d318d9 |     
   nios2     |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/13d44c59fa3d2c9aa70fc1e1144cdcc40dc06f18 |     
 powerpc64   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/c1447c70ad234cab2545e62be9af9cceb59230ca |     
   s390x     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/3747125f27b5a56598d2465d82034b45c517be85 |     
  powerpc    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/68393a26d7ed67f6a2c04ed9b885c395a54a37cd |     
   s390x     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/034fd9713203b6ec6dd62e740f86d8be8d271775 |     
   s390x     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/7b7cacc28721a46bcfc4f1231396bf4679753446 |     
  aarch64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/b24b75a97b071674646add7f901792fc4d2c80b3 |     
  sparc64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/3ce3fbc77347dc9c7b64e9830e7bcbd543efdfd7 |     
  riscv32    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/aaaeba9611d962ae36d1b2d32186a6ff999bda50 |     
  mips64el   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/5cdc7946b36094527a2cc953d7ee4810546b086c |     
    mips     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/da5672a229a65b6d44d255c7d883a88e704106ed |     
    sh4      | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/3596f36ce06f88bd2a4beb9d875a724e72e0cc50 |     
powerpc64le  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/57163bf8a67d09921510c3a31d0206584adda6b1 |     
  sparc64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/5c1846ed762d8055e69027ad7f230ef9252877e8 |     
  aarch64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/3d12f7ca83a6ad051fc2143781a080ee3c1ffcb9 |     
    or1k     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/0cfd892f798d2ab1e9244cf53e8512b8ef655713 |     
    arm      | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/60b4cd6c7479e76d0b5b5c2c8966d3b9cc445d31 |     
  sparc64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/13dff001c70ebb08b7bdb2b90e2d9ae4fb9af568 |     
  sparc64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/c55c907b73aea1ba7421e016804c20f10c5e065c |     
    arm      | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/25482d4d1a1e3591b8fdb22d17db2102fef0d38c |     
powerpc64le  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/5991088b4955ee2923e1306ffa8c06f55d90357c |     
   mipsel    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/5524def580205a0b5a962cfbf614d35a6421e133 |     
  mips64el   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/d31d4916f623f42809342e2d04bedfa46cec0bc8 |     
 aarch64_be  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/91c9699cd214c18fd1b69747d2b8c1f9ed7e0cdf |     
   armeb     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/f6a5426b4250e2f75025876bda0e16ebc7831ef4 |     
 powerpc64   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/3934666b916452e60e88ebdd320fed8a637e20cc |     
   armeb     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/0c2756bf91e77caded5cdf8e51fed996ebaf703c |     
 powerpc64   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/bcd546c1ed2e0c90716bdcdcb7b2755cbe6c3de6 |     
   armeb     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/65295bd31bc19f12571b66c2b462856b71e5bb3d |     
 microblaze  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/6eab2c65dd4a99cb6cae69127b15bfd8d3e794cf |     
   mips64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/b68916d5df4b09219b7ece2af3ec9bec0e6a03f5 |     
   sh4eb     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/96a9d0f14bced89cca5346b0969fc6603514c821 |     
    arm      | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/8e1c0fcfbfaf3d48fec3dcef55e1dfe611bcfbc1 |     
  mips64el   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/c0b62ce0b5e164de1d201f75fbfec5bd997efab7 |     
  riscv32    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/3528c3d232dba4133ed0ba344db3a1d44e7c7e66 |     
    mips     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/7a8c2aa1673a13b5b958bd99ea6afd016f479fbc |     
  riscv32    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/9f17466336966f9be3804d17cd5a1a6d2a09bc65 |     
   sh4aeb    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/91a1d26e21fa4b2c4c69e1bd9ff04ede4080f489 |     
powerpc64le  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/0b18f7a3dde5c30365ef998e6fc2ed6a5ae5360e |     
  mips64el   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/d18f23f2c2cb76c32399e5cff4d3cfd3f57a92a9 |     
  riscv32    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/f1376ac8133a35d7901beae38c6f79440c319d42 |     
powerpc64le  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/9db290e383c0b7982f4d0c7e662474b7e1eada74 |     
   s390x     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/727c82281c10be94c0e3883c64220590ce39b2cb |     
  sparc64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/ed955a54a499148e64d5969bb6cfaa20b6da56fd |     
microblazeel | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/5eba8e466ae228a984c3727d0e6a0300d1b2799d |     
   sh4aeb    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/10de4bd35566e2ab63366daeb0764f481fd13969 |     
  sparc64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/9aa9628642744d6c1ed157944331fe14dc22fbe6 |     
microblazeel | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/b45c41a27a41ff1790fc004d707823f327249131 |     
    arm      | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/4bd16cab099a2c0d2faee4166f4e224bff39b8d0 |     
   mipsel    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/beb7f3fa6b5c2df124be39eb737d90c7f8ce426e |     
  mips64el   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/af50d69c6d2ac8e5e4514022a1c65ecf226e4a2e |     
 powerpc64   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/f82f876cfcd98e648e9650a88d248361f55d1bb0 |     
   mipsel    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/76abb1fc99d3a744320be891801d62792888e8e5 |     
 powerpc64   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/108191d15186266fe0b8d019b92735748e50d363 |     
 aarch64_be  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/9e78bb2ec7411dac5ebba01b8cd0d591a5c93c18 |     
 aarch64_be  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/ebffb3d78373ae4d9d9ec4a7cbbdb91b81311eb1 |     
    arm      | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/9b4ea44fd6ff8803d3d7b4b8372a43c24d63e9e0 |     
    arm      | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/92d84f9ec79085cbf25ee02b1662aa7d304f5b92 |     
    or1k     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/099fcfb556ec8a0c692d21258d0f641c6ba459a5 |     
 powerpc64   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/2cb9b01eaf83015a9b8f4d962f4585c1530310e6 |     
   nios2     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/0461a6a5bcf34bc3cc1e1495b5e0d94d49b9d969 |     
microblazeel | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/d46a7d4f6d246d638b2ffa1fe829ffad2bcf7439 |     
 aarch64_be  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/bf2311293d835f9c20820f853397038615065018 |     
 microblaze  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/476ee5d30aa1c199052d00f05410a9a98363b2b4 |     
   mips64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/9e9a83adf2ec3c4e8ccefd8fd0e82c78cef73547 |     
  riscv32    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/dbd33274df368ceeafadd9845c2899c5947835a8 |     
powerpc64le  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/75002eaac22413096b3d40be279ecad780eb4cf5 |     
 aarch64_be  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/a39c8c291f677f565ab31e8ac39d0bed8d9bc7dd |     
 aarch64_be  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/d555b16e96b0419b02d66f43362c30733da6519d |     
  powerpc    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/3f2a5a9021ba0f3343e60f57cdc502e68ab28883 |     
 microblaze  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/56c81aff546b90362af6c92a9a23a095b790aad8 |     
    arm      | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/44a530add1a0f0c05b8cb9c4824e6f0335181a1d |     
  riscv32    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/f9941ea8ce6ad5a3340376a540cf799a0b483d28 |     
   mips64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/2f20db02e565ea7beba401419424cafb5e98b54b |     
  sparc64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/8e18761fca14fe7f368b2fa3761f8164774f4c09 |     
   armeb     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/20b346be193838dee700a671b8a96872bc010914 |     
  sparc64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/40660c2914ca93a600b5e670c5079792a566a0c9 |     
    arm      | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/6947832016168924487b1c9beea340f649da7247 |     
   s390x     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/8bffb3dd2d77076bc71fcd2522183f8ff486f2d6 |     
   nios2     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/f70b7f3f6118224af4c0e6fe0e5627df1bd2922d |     
  aarch64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/654a3e8ef138f40754fea12c7554f3099017fb79 |     
  aarch64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/04c8d05ea6522cfc6b97d24f63a1a5ed3d0a1bd8 |     
   mips64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/112f92c8f54d0c10d1418a33c4eda5d79919618a |     
 aarch64_be  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/024b334623a536b3024e4cf436071cfe648d10fc |     
  sparc64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/293a1f20a9124395b4998d23a1daa2cb77e83663 |     
 aarch64_be  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/f9d15884e889ec327b9f7d31f53c53f2697109ee |     
 aarch64_be  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/0c99dc6fe2150352671e4078c4a951b14e6b9efb |     
  mips64el   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/0fda11b2948e08d7f742bf80675c383d4b7d6100 |     
  powerpc    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/b2885654648d7fa7fe083a1380cfd632be5fdb83 |     
  sparc64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/ef15ab63bd976cdb1487e62a551e00b4adb91a6e |     
    i686     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/3d355821a0036f793ae03e1f23af86584b76b85c |     
 aarch64_be  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/2add144ffc83e064a1417e4e07444c77381988dd |     
  sparc64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/ac52ad7233a7dcca5b209d709c68338f80fd184a |     
  mips64el   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/13586983515416813ffd0c9777e9881c82415461 |     
    or1k     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/57b326e8713b0a87310b6d3acd6c6baaec0eb51d |     
   sh4eb     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/049942c346e2095dc7855da9ec860f26a3ff49b2 |     
    or1k     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/487f4699456fc52b229468f9687a8357b277ff20 |     
    mips     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/15e91b0ab4b8c715446988d17355f39d7bd1f777 |     
  powerpc    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/468fa00010b147ee0bf88c3bac789e0d8c995598 |     
  mips64el   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/224e8604e9a576cece0c064c42cefa24e1eeb343 |     
  sparc64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/3e738fcc1cdd718d51422f6c793d082d0b552e0e |     
   s390x     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/0f8e6e625f73a90ba8056caf10819f3574302c2d |     
  sparc64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/bfaee1c02c84e3a8770350e32ad0c639eeb2329e |     
 powerpc64   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/f361b013b397d5b5560d55a4e543258807ae0f34 |     
    mips     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/a6b3766a1723fbb22ce88ed92678ad53841fe084 |     
powerpc64le  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/bf2163da2eb2eaa86aa0b6a693488bcc9790f476 |     
   s390x     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/1966045f16a2c02c0154e532d6a9ab87c7fb3321 |     
    mips     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/e905b4c8b828ea2b9baea7dceb7300a262276342 |     
   s390x     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/531818a31b550be667096e4aa374d3d0ffef2c95 |     
  aarch64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/c101f370ab49a776553de3da1651c29890974dd5 |     
   nios2     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/cf622cd470ab525d4e834531628509e095048814 |     
    or1k     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/67dc1d251e50844715910c5080375ddfabc60969 |     
  sparc64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/21f3fd9fb89ae1f90ee14bb302b420f2d7fac9d6 |     
   mips64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/fdf7d711c88cfd891b697b6c1e616ed3f8e0a0b9 |     
 aarch64_be  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/3e130f535c216979fd01803ac88d29b5ef1a16ad |     
   sh4aeb    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/f7dca2ce13e2bdc2d9da7708d8e9c5f49124aecb |     
  aarch64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/2085fd59bb11e2481672d72836cde0414224cd5c |     
 aarch64_be  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/ae04803d5e9f9c1b3b3eaa84aa7f227dabf764f8 |     
  mips64el   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/f9c3fa57ebff1c93bf412cae0e38abebe0a18a94 |     
   mips64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/033cffbb9432d6232e96137f2dc2d7c0bf13d0e9 |     
 powerpc64   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/18400cb867bfe208f7888e950c5112265efc3262 |     
  aarch64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/8e945fd58a1ef316050c0d812c028e312736f280 |     
powerpc64le  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/6df1b20c5a69c4bbdb7d226c6fbe98d8005ea114 |     
    sh4a     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/723b5b17cfdf936e4a41cb9f43720f289f2c11d6 |     
  powerpc    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/3e1dbc860efce5541621e4a7f69bef41a6b7e452 |     
    mips     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/26662c0b6f562a4a1174a716a5cd76b2636ca1a8 |     
    arm      | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/5fa2fedc1d96ede15c3bcb29ea242f7b706a3977 |     
   mipsel    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/19305f6a94657c77559d4ec4e93ca6fd6ab405b1 |     
   mipsel    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/25b8a5f8f99b09903da26b4007eb649fe5cd50c7 |     
microblazeel | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/5bbc700c0d55b954da75f89783e27f08119a863a |     
   s390x     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/e4b5669e1e32c74fa14cf26d5f7d138092c3880a |     
   armeb     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/7a075791316260896bb8fe522da77034eba8a442 |     
  sparc64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/f2e95531a4e938f149964298def7ab1ae92a7e85 |     
  riscv32    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/2e4e1120961bc34c239b07650d595b026761a1fc |     
 aarch64_be  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/1d871e5142c79c2d97d46cef150d78e2e3c30bf1 |     
 powerpc64   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/aee20d44072f2bfafa1893061c7c0c8f536cda7a |     
    i686     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/dfe83f4172ec4f5053d3dbf27c8f3e86ed9f93c2 |     
 aarch64_be  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/58214f26f7b98d5d6d3c5066ab175136dbe469e4 |     
 powerpc64   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/c8efd12d9b9dc09a916f2b89f3b8e55197e22dd7 |     
powerpc64le  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/3631142ed1c9d3f3df1f9cd8c837daf750117a15 |     
  riscv64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/ff09c0375d4b5210b25e7c3983494e1370c1e16d |     
 microblaze  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/9382270bbcecf98647857cdfa255c7329f4dffdc |     
   s390x     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/525c0d1056663849659a1e29661a026a0e8b13b3 |     
   mips64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/3513705bd4ee19bb3e4ebf088f2da2bb2877f596 |     
microblazeel | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/a7c332732860395f668f10229ff9cad2be8bfd56 |     
 aarch64_be  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/b33b300e7d45d94eaa3b5b9167792b6dd9fc97cb |     
 powerpc64   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/b16c6201a8afcef54fcb38d2689a806b0676ad51 |     
   s390x     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/aca6414e68e91806a8a42fe7f04336ece6a49ea9 |     
  aarch64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/a0c575a077e1ca7d1c20e6ded7dea224a3ab9a9f |     
powerpc64le  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/859afcdd722ba4294770615c892fc7e42a338570 |     
  powerpc    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/b7b3822e293a29978c44055983168f06561592a2 |     
  sparc64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/8138ddc9db453f687e3434e74d7142f3fdd09e15 |     
microblazeel | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/ab74ed0ce42bf20429294d5df162e77c7332a627 |     
   sh4eb     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/fafeddcd92be8f226ade2ad7677699c64216ee43 |     
  sparc64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/7cd3409694f4eaba68aa01da48d2147dc0f23197 |     
   s390x     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/f926c960a2788b8911a7f58ae50b2d320a2cfeba |     
 microblaze  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/9c6b921949847bbf920759d7658f9961c784cbba |     
powerpc64le  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/662d78b8e2c4e43b8e050c721e4500698ca520ed |     
 microblaze  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/793557413cab80142ad5908d7b8cf568c65159e0 |     
   nios2     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/70c5ff8e380bcffd310ea67946bf8c5ca06cf5b0 |     
    mips     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/e1403ec0bd8a27142bc79afbd1f732459410095b |     
   sh4eb     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/398a6b6621807e4255251004b0521e818183182c |     
 powerpc64   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/d0246bc157158f24ece04ea38adcb1d73f063c08 |     
  powerpc    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/92139b2d1262e3171b42a7a0a87a65d5cacea4c1 |     
  aarch64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/4e9440d8c1c0971f228f39e07a6947d7b1fb00ee |     
   armeb     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/99faa45b892a622374980585a759c700b1284054 |     
  riscv32    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/3052f95f242775edfd6e81a89dd310a0961398ae |     
  mips64el   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/cf152e7a95bec3b6ebd0209dd716cbec56f9d477 |     
powerpc64le  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/648108276b12836e1007fdb389daccb38dbda154 |     
  mips64el   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/50cc1a401e0460c18f9a741354789d3bf83f7bb9 |     
    or1k     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/481c4617813da031beddaf00b97440071f646809 |     
   s390x     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/5a3f6414d75fbc8a272258bf3bdb6f4fe7e6da34 |     
microblazeel | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/d018007362db76f75201e91a9ff987797c76ff6e |     
   mipsel    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/9fa31a0fcc007c1f929400f6567e24688b6c1a07 |     
   s390x     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/4d2f9738deb31c84de9e2505cce98eab4f8800c7 |     
   nios2     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/125aaeedef13bf47571d7a3def224aa4f20f49dd |     
microblazeel | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/753977a39fb730804f72588576f0ac531f50f17d |     
  mips64el   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/f441cd27a15925adc46040f3ac42dc1cd1272a23 |     
   x86_64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/c878436f6c13a1a79b0dffcf812cd587b5cf2c3d |     
   x86_64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/3abec1a8ccadaafc9bf1b4c137daa59324163f55 |     
powerpc64le  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/0df148f6880b56032eee2e2077ce2790b08cad7f |     
    or1k     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/e6240fa8bedabb45dcaa3b6602bec9dcc3b4ba1d |     
   arceb     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/856e4591a3efaa6fdc6ec6d58f153f8a2622ae11 |     
   nios2     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/ea5ddc415b7e899a9ab6dc863a630a42338c9c64 |     
 powerpc64   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/7395971eaefb834a970bf856e35734a12d144ab2 |     
  powerpc    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/3501d11ae1563425c8394835b91b02e10bb1b67e |     
powerpc64le  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/0c39df85743e90453152038e644d99443d9839c0 |     
  mips64el   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/6d0d38691e249bb643204c84962479ae1a7b8e03 |     
  powerpc    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/57a3c6bc4b7a1280b7bcd63b5023108a4b55e19c |     
  riscv32    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/eff367aa8553e76c7a3ae073c0e00a32cf575a10 |     
   s390x     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/6445b80d4a036a6881e3898ca0ad2847dd800fce |     
  powerpc    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/51a1083b3b698b3e7fafe973b87800ece6f65016 |     
   armeb     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/29c8217bde09b4f69faac8ac1581e5076298f334 |     
 microblaze  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/b53c5330e77313f26275ab7ee1bb58a9005048a4 |     
  aarch64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/da0e0133c8820db9ba8839f995ec29bdbfe79a9a |     
powerpc64le  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/280384acae952f6b95d9b3eda6b0e05e75815aac |     
 aarch64_be  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/389d8cced7ebaaced7a737696ac9682f2bd81e47 |     
  riscv32    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/7f20364f6762afbbe2fbe9dad16e7eb3f5297be7 |     
  sparc64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/3131142080dfd9eab1d97e9b38b5e500ca13c863 |     
   s390x     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/1990d3f25d266dc2ca547600982d6b5ae35fce4f |     
microblazeel | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/e056378d9e4dd72bba41778617fb9aa8036ed416 |     
  powerpc    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/ae61f18652d936759ac061367871f11e102b6715 |     
   armeb     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/ce7b455b58bcf792463301522b43958dcb50f1cf |     
  aarch64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/a2f05c368e6fc165ef3224465b2aa2d6805074e4 |     
   mips64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/fa2d4115e3c9c3cca1cc6c9142764f3d7fd056d4 |     
 microblaze  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/4285f61869ec9a77cf28e7a0259572826fb46f70 |     
  mips64el   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/c4af6c38457f130e59f7eb3072fab0867e18ffb1 |     
  mips64el   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/0341630913b3d8742693163f64959a0ab6fae953 |     
  aarch64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/b23d2582c938e70603b97b363b017a3c8310af46 |     
  sparc64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/04cca64d2d3f29a70ca029746947ab5433ed6536 |     
  mips64el   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/b8eb4968c98b15535a0180c2bf34c1bd8b367c34 |     
    mips     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/3b8903ffa28314646c176fbfd5bdbf5bb5212f2f |     
   nios2     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/3f72e9457cc7367d4cbbe81db39123587842d631 |     
    arm      | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/b487194ab30dd2f7fafd5249edfc0ed5419779fc |     
  sparc64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/b20b882c350cf51d90dbee9e3b4f16a60a25cedd |     
   mipsel    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/2a57cdea432f78003d9fe2beaf9b67ef9455f206 |     
   nios2     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/f8847f49cce9b5cc973876ca6c3be9c8c54433ff |     
 aarch64_be  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/eadf67c705782e3ad95e14786c788d01beb22338 |     
   x86_64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/3b7fc60412fd6079f0398d667f076e23a5b84709 |     
   mips64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/c6b4123d5fa2ec8df981e2dceb396242698e8b25 |     
   mipsel    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/18a8da0e1363bcde90bb7e7b7c6de909f9788ea1 |     
    sh4a     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/ecd1082635f21c693b4f5896bcc675ace02cea21 |     
   x86_64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/5ef5844277efe3cd525637c1d606be8dd55cc44b |     
  sparc64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/de6060b0525beb3b96da0f587d3bcd441201e30d |     
   armeb     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/2bdc01ad5b444e104dad3d6d549874878f5b59f7 |     
  riscv32    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/66da542cade33a7952f6bedb3cea015381357df0 |     
   nios2     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/8deab2bca3c73c2caef7ac7258426335ae7f3a0d |     
 aarch64_be  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/ecedc13d35677e39d78e8c8dba3e2634c5fb79c6 |     
    sh4a     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/a5b5895afdda250d3adcd3c627b6527c916ba26a |     
    mips     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/47360710bb59e9a185bcf2cbc667f47c06a68f2c |     
  riscv32    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/88e4fdd914fac80716f3592e4e6f144ef006ffef |     
   nios2     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/1189c06ef6d5338405c16940a56d381582febe02 |     
powerpc64le  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/362211e4cde23569b093f5764713e84f2cc5ea7b |     
 microblaze  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/095f1d64ec43514fa33f2bd6cfdb5a00e6f9fa78 |     
 microblaze  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/912a3b98a2ff3a1e489368e1eef0eb0166ee69e0 |     
   mips64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/13f45c7bc963c136ef792a7a0dee23771e96ef0f |     
  mips64el   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/17bda642770aa49a9a69458d64f7b1bb2a749279 |     
  mips64el   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/bcd4b86aa18033d0f187db96e2e37de57a2fc080 |     
  sparc64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/102cf43148529ded3e7eb81c412641c0f1591e68 |     
    arm      | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/d998ad78a13faf2e365d612d3bb69c1097981f36 |     
    mips     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/ab0b1cadbeec1e9fd72299259535f8adebba669f |     
   mipsel    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/20393c48c11298e7533c71b8de75d729549cee23 |     
  aarch64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/7d7dc5407a0f75245f0ca415a4b38e2b6fe7ce80 |     
    or1k     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/fe9f395d70474baf768f60e0fa182a59653d5455 |     
  mips64el   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/770e7189f750f875cce41a667e97958d6be55bb0 |     
  sparc64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/c160f9198fa34826751e00acc7300e11d85f20d1 |     
powerpc64le  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/ef2139c83b05c3b27deaf5d4444cc5d856b741b3 |     
   s390x     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/9eed1273d9b16cdc5bd02930461a87f2e16db1bf |     
   nios2     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/8d77ead032cbd2afad2299b57731e65719ecf7f2 |     
   mipsel    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/4550df77c21643b384ef7cf547489331326db229 |     
   mips64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/d2ad7c04585d0465292e7c0feaa511db05223d5f |     
    arm      | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/5c12df81968415f3a262edbaead313007c482481 |     
 powerpc64   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/99384c3c4af05fcf6a95e9a55282060213300e91 |     
  sparc64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/4c772ece1133b21ac7446594c9c7631ac702981b |     
  powerpc    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/0589d71465be945f59e94aa6def120bff951931b |     
 powerpc64   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/7d8f080d9473cdcc7456ffd263bb66ebacf57b2b |     
  aarch64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/052870eb8f49346999499de3a867e6d1c3a51184 |     
  aarch64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/69fd8313995b288285a678f40e08469a610f47be |     
    mips     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/14becc73bd24cb99dec61bed140608e1536fd4f6 |     
  aarch64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/336a54d90ba96d7625945b6017fb99b50d738f63 |     
   arceb     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/05478b283ea00591fad1eec35b2547b819c70bc6 |     
   s390x     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/ba0128fcad9638b1540823349156ae0d3e16e8b5 |     
 microblaze  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/a37f99a0efb0c81e53f8665d28048e6539aefbe8 |     
  powerpc    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/48fa6245728913ff6f17808cb1aecd7f2ec3f285 |     
powerpc64le  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/a536bda1bb52b164e7676abd6717ae63b5b19f79 |     
 aarch64_be  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/2ab083287e77aac1fe7fb355aa05ab4a9d14e06e |     
   armeb     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/f9b500c16af76b6d527776439e4bf591834ba782 |     
   s390x     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/d103f8bfce10689d4d5cf814fa76f55d07cb4c6b |     
   sh4eb     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/f4eb559ac4269422971992755aa3c14692dafb79 |     
 aarch64_be  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/e6d39fb4a892716e1961bdd9bcc8ea2654244b78 |     
   armeb     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/cd370c518ace5614b69226ba12559f601951c9c9 |     
    arm      | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/b43660463c9c0fbfefdf488410d1a8a5bbdf00de |     
   s390x     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/cdd41b5b6ce10b8c7c5c4d2f17bbd3196796c2cc |     
  powerpc    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/8800b3c6d67b1b97987d1e8de92c635c390a09a2 |     
powerpc64le  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/bb25f327f4ebc55df024b625b5f4fbb02c9b7a95 |     
    or1k     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/a3046362cfdbf8c4f5cf65e8da7b2500a9aa41ea |     
  riscv32    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/9a4c665283f114b1e84a1ae3b5d293ce5805d01d |     
   nios2     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/8feefbd5da4664755dafb0e79bf6de97673c4148 |     
   armeb     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/502eab9aecc2d29af271f3b2b75c5a7323b4b9ff |     
powerpc64le  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/8c49a03aaa69c9db808655bc3d47c5834c7579bf |     
  riscv32    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/e07656fe853536e07d9746e6bc27667812c5e095 |     
  aarch64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/95bf0c07fce9fff942d587197fa50bc70ae5ac20 |     
    arm      | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/8a5010e099c23db1689abaa8609d62208c5201ea |     
powerpc64le  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/f906cae1ffae6bc1bcfe93a6fb9163a0a052e187 |     
   armeb     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/67406289b02f7d79e45f535b80d41585f8147e2d |     
  powerpc    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/b86202c610673e3b74e91b40878735691147c89d |     
   s390x     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/3688c83a489c3ea9073b1ce6b10ab0b60829cbde |     
  mips64el   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/f9237f3d954a74af2319f3b4d8e51419d1e1a112 |     
  mips64el   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/86018b0667de52c37737c7281acd3b55467407bc |     
   nios2     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/e35b2ea834a7b11a9e67c09cea08f51193b2c973 |     
    or1k     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/035c6d866f3e28efd8c85c26e25eaf18de234c43 |     
   mipsel    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/a0437b3f8c63e19cb739aabb44c2ab58c6b78bc4 |     
microblazeel | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/c461e23956fc987a84a3ffa1d14b48e7a54a9ce4 |     
   armeb     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/1f6128822abdc9def14ab3804450201e4520290c |     
   mips64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/7536f313c89df0196050fa12f2852f141eab6387 |     
microblazeel | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/c7dc6ad1c4004fd2dbef4a253c3a3bb18ef76fbc |     
   nios2     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/be47783ff628e88d0f74068bdbb78e15f471b011 |     
microblazeel | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/217846fa3d889f88f8c62eb2867be4e69f65e138 |     
   s390x     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/0160b6ab56b2498bcfde5131f719f6270a1dfe80 |     
  riscv32    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/91aa0225f8e7724d40fbd8fc818c0472f604d92d |     
 microblaze  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/d6430eb9158325675212c4694fa897e20dea0772 |     
   armeb     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/5e6ab62ccc196fdd43b24143e91e9f8ecbdf88f1 |     
microblazeel | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/467b402183e56fed65fcb28fd5020aad3378029d |     
   nios2     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/0e623f6f19a8c36a984b063993451dc766ed0071 |     
   nios2     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/b79c2ed3744e816c1e538d67e03760af822e8e71 |     
   nios2     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/e5d91e78f9c9815ad9b2e75e586379afc4463b83 |     
  powerpc    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/722d29b185d8359a8ed398fa3af97cc0257fd06e |     
    mips     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/c5f10456bc2647827b2ceef40467b08798e29c17 |     
   s390x     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/4986ccb894f1b647105de401fe38c567cfd3be39 |     
  aarch64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/ff83b2a4a0bff61f4eadab67def47c6857c7e7e7 |     
    or1k     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/0285f9b5cf4b6b955692885038c51db6ef247616 |     
    mips     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/1bea860e80c9cf225b0cc2e582adaf7cb4dd7eb3 |     
  riscv32    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/d0ab6aadf77cc5497bb0b38c26824c2797e70e10 |     
  mips64el   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/c61087df941d619dd0c28b0e1e6344db704d3e5b |     
  aarch64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/593b3f0420c966d4c06057c04305a456c9f4dc23 |     
   s390x     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/39ad3a5eca12772934a581f525fbe9ffadab0029 |     
    or1k     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/75eaeb46f58c61aa19801abdf166789ccc0e7541 |     
   sh4eb     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/d7ce04f414545fcf055dead857db45030b984770 |     
 aarch64_be  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/577ffabe13af99bfa782b43dfc51681d2edd6e5f |     
   s390x     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/3ac6aea3fca0d0690c9e576bc9f346280a39dceb |     
 microblaze  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/df6b31a8ab96144e8f44f70b11305bc7c353e1ff |     
   sh4eb     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/9008fbbb4dfbed85bfb47a8fb19769f928b808a7 |     
 powerpc64   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/95754801600419bf104cb8f052c2d4151cf15f80 |     
powerpc64le  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/60990a5a205a13b57e382104a9beae81f9e7da5b |     
   mips64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/d07b5ed1693f19606e1ec396ba4ef1247881115a |     
  aarch64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/b20c2fd6a0b42bc9d10e44c50dc754cb07e557c0 |     
   x86_64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/639a80ee19f9af150768fcdd29ed9030c9bd42e9 |     
  powerpc    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/05fb0639c15da71a58ed35ead144c8614505b432 |     
   sh4aeb    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/605e8178b936a933a880c7e70c8f997ec83b4153 |     
 powerpc64   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/2ba2ed0c5a330f7e2273ec10a71c68478dfac22f |     
   mips64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/a8d0487e7c29ce6a0de60029a58bc4fa34d1ce2b |     
  powerpc    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/30673975c609ff9945a637ff4e5b103e73df8cb2 |     
powerpc64le  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/313a1ff0ef1ab3ac16fe7970a11301e8411242a3 |     
   mips64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/da8ae8305313c5250e164f2950b4363206fadc79 |     
   s390x     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/daccdb96bfe96ba8ae0398b7a9de29587da9284b |     
    mips     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/b7ff3947043080e9b3b110512d26919adb74e021 |     
 aarch64_be  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/866884501f385bf63255204ff2077ab9368ac441 |     
  aarch64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/8abc3ecfe1d248e7a86036171676807abd0e8e4d |     
   nios2     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/469767145c26531b04ae4ed28f82eb78c4f431a0 |     
  aarch64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/ae6083d0681fb44f79d44dea8c2162df155d2c40 |     
   nios2     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/9b9bf32bd0c3e351cd95408229bc4aa3c1659e8e |     
   mipsel    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/70b1b41c82d93aaeb5dc4a82968cedab1cac3f17 |     
powerpc64le  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/3e721fb2e3d7344480a0de6b406d450f36623b27 |     
 aarch64_be  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/c1515d5b20f37fe3c33809b306869410c1edd5cd |     
    i686     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/6008380eff951a31c79431f63c653d14b2486f6f |     
  sparc64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/a191f65a2b5ad06bb04940eddfb546d3161e471c |     
    sh4a     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/76a92e03c1b083ac8c42581172b086202d541329 |     
  sparc64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/f546b2b6b734d0c0a655a430921f6c8a51396e34 |     
    mips     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/f229e74679dfb28069866f6a5144e96cd9cabeab |     
 powerpc64   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/c227bd1dedda679f0ce310b19f48bb999ce2c423 |     
  riscv32    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/aaeb186ba72c1bb3d3453200b2243aeed4993364 |     
   s390x     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/c56988ccd43603d7b3290ab5cfa6ca44e1686d6c |     
powerpc64le  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/c551a712d01f6bf790bb9616fd438cbfd90b81ae |     
 aarch64_be  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/02c8311151b020a25b5d4d4a38bf8c4e9c6e4f03 |     
   arceb     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/5f9e85c1cef7faaa93e220e849f1074dfa1f8e4a |     
   mips64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/768a920b9aeea134e4cb6b9fc1134acba3b5cecb |     
 microblaze  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/be97387dfb41358136a58e60435673d784b17ad0 |     
microblazeel | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/18e4c00980a82c14f67b29ffdef507d652fbe3ae |     
 microblaze  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/9b4c8ad037eb9373d149c3f5fe626a4927436934 |     
   s390x     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/20bf360b52c315f8724d95c0c28e04785b9149e5 |     
 powerpc64   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/f034acc6e6c9be65fa64d9f0794709b363f42473 |     
   armeb     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/59d2488d6846be206ce1545156bca059e3e4225a |     
   armeb     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/93f3face642ebfeec8b238294c69351b5cd15eb5 |     
  sparc64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/15def9beaaa35f0b9bf096f761437b659565e672 |     
 microblaze  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/eac3bcef4330f951cd3baeade8821500edae5254 |     
  powerpc    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/c53910cd2f938f602c028e4f594d9d32fa22c444 |     
   s390x     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/01200ed27548614d0e3a9aa50fdf4b7b1bd4ecf5 |     
 microblaze  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/49188c549eb37dae26719d7e8f952a0eb921295a |     
  mips64el   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/6e98fdb82fb2f5e6ce082ae037faed771b8b32aa |     
  aarch64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/689b3f2708c7841b412a3684553a95b7dde75ebc |     
   s390x     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/12afdc74d00103eb872c70fd2c93f3e2bde3fc70 |     
  sparc64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/38cbf2ec29b03c4a8c2c3389fdf8328af1048159 |     
    sh4      |    gmrender-resurrect-0.0.9    | NOK | http://autobuild.buildroot.net/results/dddfebc5dd8f0ae0d12f0fcdc64556f25c7d5480 |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/2573ceec25ea5930a4cbd8421dfaed8440f89a6f |     
   x86_64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/f582c8ce5229ba1dcdeca631e95e9aed05fd356f | ORPH
 microblaze  |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/398c06fa7b2df182ae1f091c755410e2f8029715 | ORPH
   mipsel    |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/c1fb95e5bc69f7222de06ad78e372568415cd9d5 |     
    or1k     |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/3139288d750a68c523d00fa51ac0e3f3b8998b14 |     
    mips     |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/1c0efcd2c921979aad7a4b44c5f0f7be41bf4168 |     
  mips64el   |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/9d1e511f3ce60fabe5aec21b5717020710eb49ba |     
  mips64el   |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/e656e719ae6ed88bf3961fde95e005bc22879a1d |     
    arm      |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/c16ce296b4feed455828930ffd3ef3a327d1452d |     
    sh4      |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/25b0060529341dada621de678e8e41e080dc01f9 |     
    or1k     |            hans-1.0            | NOK | http://autobuild.buildroot.net/results/56e6d8cdb73e5dfd2749f3f577cee565328ce799 | ORPH
   mipsel    |            hans-1.0            | NOK | http://autobuild.buildroot.net/results/27a111cb9c436f84dc92971d9e2498139f6a2e4b | ORPH
microblazeel |     host-berkeleydb-5.3.28     | NOK | http://autobuild.buildroot.net/results/edd82e0ffe72072ec71359229d374f5b96b6616d | ORPH
  mips64el   |     host-berkeleydb-5.3.28     | NOK | http://autobuild.buildroot.net/results/8eb17e93f4d86c6ade6986ca1bb8b19bbeb789a8 | ORPH
 powerpc64   |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/cf7bbcaa00946f1ee9742705b3ed1a0a13c05124 |     
 aarch64_be  |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/a7e25f75c803ef912063306ea2d15a187804f8aa |     
    arm      |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/d506046a0b76b926750e6527c137a913ddba0fb0 |     
 microblaze  |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/eeb7586fd778dd66efa45bdf75af8e37ad236853 |     
 aarch64_be  |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/be57eb9050f80fd34af8977052beaf4927e19bba |     
   xtensa    |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/4c3066ddcf2e799cf6ddd6db5de39d8267aea55c |     
   mips64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/67a7166ae71522dce1edf2dbfa207d7289ddad99 |     
  sparc64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/8c58041312b4a7030d3fc16fbe36b6148f04acc2 |     
  riscv32    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/2601cc177743799d16f6b02bc7d32468ee0b4888 |     
  riscv32    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/424dca5af2726cc23770ff4884c07423e746daed |     
   nios2     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/3067d8332677e33b3dffaa01222c88431ee5d55c |     
   sparc     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/bc802009223d43ba9e18ba3e5da4f605933c54d5 |     
   mipsel    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/54f26df18b8daea718fc4d0b2ab6c126bccf31c7 |     
microblazeel |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/98d5aea4595c7f1fd11da8fb2a871b421dbac7cb |     
   arceb     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/fec296de25fddb227874860a81341f890ed0eedd |     
   sh4eb     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/40251ff2986a2a0397436aba201ea5aaeffd0dfe |     
    i486     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/58407bb58b4b7ebcda5e2bb4c531ab2fbc608e51 |     
microblazeel |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/922e6aeb9cc59850b66365b8ff44bd5e5050ec69 |     
   sparc     |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/43fadbcd518e524b38f039cafd2226eedc51cdc5 |     
    sh4a     |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/17da3b1da2d4a469af034864102a1b2039c44f56 |     
   arceb     |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/fdb9590c12ebf1b983e4a3c5c9ee353a0daeaa80 |     
    i686     |        host-delve-1.8.0        | NOK | http://autobuild.buildroot.net/results/781b68aa11caae24551412da7835a28b7357dfa8 |     
   x86_64    |        host-delve-1.8.0        | NOK | http://autobuild.buildroot.net/results/8c7317d7e5d2759c66ab896bd56f0be28bf495ce |     
    arm      |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/59686f03a288c98e86157ac7e31ce563284f79c9 |     
   mipsel    |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/dd0385b69810d7e4620a45a02cd61a7902391308 |     
   mipsel    |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/f731a96a903e23f54c17bd276a09df7d81c810e5 |     
   s390x     |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/2cd30bf2e5b145203967b896863c3304fe496d44 |     
    or1k     |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/8d8779ac11b993afb33316312459d85358c740b8 |     
   armeb     |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/876f7d71ab184ba105d6ecf601ebcc1f7421c6ee |     
   armeb     |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/925fa3fce9fecb03568ff27d6ebf561f424b65fc |     
   arceb     |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/d0a10c63d0a45834e783213a88eda6019a60f369 |     
  riscv32    |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/e0880b325730750148aee00b4bcab085e60ac7d9 |     
  powerpc    |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/b690daa7c7ab647f10db0ed5d5bd201261b989c2 |     
   arceb     |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/a5c3eb1884e7b1c8c9459c62e69ef9b3046d597c |     
  mips64el   |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/8fb2cae15f096ed0ac2ef1350f59d81339b32d26 |     
    or1k     |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/0f13901a1afbb2997ab955056b25596e3b41b846 |     
 powerpc64   |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/3c3551281ddda4c0815c8713ed879f725ad9528d |     
   sh4eb     |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/c548b5768621a3590d6d4b4159c0cf8794d63d31 |     
 powerpc64   |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/afcaf0e5a8ee19990af9744fed9ba005d0e72328 |     
 aarch64_be  |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/8e72361a8a5406d8a3b336632bda0d387cce9480 |     
 powerpc64   |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/bbd9559983f02aa436286cb5bd9f0783c01372fc |     
   sparc     |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/a413d2387f8f1e995ac5be4f73bac51bf501e717 |     
   sparc     |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/1a90d3793f0a38acd70a5fd5bc1af30bd90963f3 |     
  riscv64    |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/5bebd8cee85a1ccda37eaa13b6dc67b7f1316f13 |     
   x86_64    |     host-gcc-final-10.4.0      | NOK | http://autobuild.buildroot.net/results/c72958ad9ef91bb61e2aea82c448fb421b713d00 |     
  riscv64    |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/01b5b3699b44f06105d832b4f9072787807fee96 |     
   s390x     |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/16f5ec074a929a7182e47e4e5731aadddf866ffa |     
    i686     |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/19f5fa807190191b65724df6654aa13df7c1da39 |     
   x86_64    |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/34c6ee81ffcdf5f03f0941999d8e80f9b58131af |     
   x86_64    |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/ea2a851207433848f763dac15bca49106cd8a21c |     
   x86_64    |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/a418f561f2297a813e4a21294e1501e2fc77ee7e |     
   x86_64    |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/58f8911e56ab3c4062ba179345105ece04f3f3e1 |     
    i586     |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/d5a49cbed0061e070eaf3d3ac9319b0c40dfa033 |     
    i686     |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/e33526e8689c012832c900afb098d2c3488c4f48 |     
   x86_64    |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/12a7ed73ca5f6bc9319f38b2f2adc5a393fb5c58 |     
   x86_64    |     host-gcc-final-12.2.0      | NOK | http://autobuild.buildroot.net/results/0da57fa67f8ec594359c9a5f3883a7b2262d2fcd |     
    i686     |    host-gcc-initial-10.4.0     | NOK | http://autobuild.buildroot.net/results/7d0fd06332d3e5fd3cb731318f99b26fe3adcd66 |     
    i586     |    host-gcc-initial-10.4.0     | NOK | http://autobuild.buildroot.net/results/f5584c2ea8609a433189c85d77c20a15615d9a1c |     
microblazeel |    host-gcc-initial-10.4.0     | NOK | http://autobuild.buildroot.net/results/b40bde07b27bf198a8cc4477522ef40b39d37d1e |     
   x86_64    |    host-gcc-initial-10.4.0     | NOK | http://autobuild.buildroot.net/results/04fc338a4fa050192b44ea0f963865febc6bfc33 |     
    i586     |    host-gcc-initial-10.4.0     | NOK | http://autobuild.buildroot.net/results/c2ae9f3c6c4fcadd3d0805c3aab96729007a931c |     
    i686     |    host-gcc-initial-10.4.0     | NOK | http://autobuild.buildroot.net/results/9ab008e97a0573871e669e925646c4cb4da79a98 |     
   x86_64    |    host-gcc-initial-10.4.0     | NOK | http://autobuild.buildroot.net/results/db9fc53ec1f4d3dd844d008c3e8dbfae6240e64c |     
   x86_64    |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/61096b1d810305113d99c1e4d55726c8f3ac0476 |     
   x86_64    |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/6bcd26ddf560b8ba9ae9488446f1bbbdfe17264e |     
   x86_64    |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/ab5c1db79c8c86be7b710edfcec59605a8c209d8 |     
   x86_64    |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/b6dc33b629136ba6ef068b6bb16918ab86838594 |     
    i686     |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/128275f68d91d31b3a3756e0b25d097685c26f46 |     
   x86_64    |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/222a77110502d0106ef2bd1454e8bdd2e843f4f1 |     
   x86_64    |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/fb815a48d985cc5d5781a591f49534373f0acc8f |     
   x86_64    |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/d4cb867b5abe193af2bd0ff1040e941d6a4ecd44 |     
   x86_64    |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/eb144a0c1637026f338607a105efa048fd9a829d |     
   x86_64    |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/78c09583f5b72157a7155aabe1375616c51b8496 |     
   x86_64    |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/dbad924ab1dbb98fa639ecbf3a1d2b1ad1d6de85 |     
   x86_64    |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/dd60a7a6b44daad9ca7be78e7f52e083318ef8ab |     
   x86_64    |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/03e02f22b5a938cd04f41e3b4a875dfc87df41f3 |     
    i486     |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/5982f9ac2677cd56fd19fd263eb942c3709cf3ba |     
    i686     |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/ddd76c17074d95382a1bc5e43452b4de972c2436 |     
    i686     |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/4faf6e38f0fdc7f81d96c7f25aba7c70a2b87498 |     
    i586     |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/3c1900c0a3be12fa179e02b221410f4d0dfeda38 |     
   x86_64    |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/1a2caba49c8b4e97ec703131acab904932b54023 |     
   x86_64    |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/238764ab72c771b1df4ecbce4bf377b2c46c4b6b |     
   x86_64    |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/b99cf0eeb66dfd3f378fd95cd9c4c9411c172891 |     
    i686     |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/6ace6eede4947025982438a9d51c9ca7d3560b71 |     
    or1k     |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/5bbd73a60d8565a1ac6807c76a2f26b5bc52e345 |     
    i586     |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/ec9b7cfca974a220c5856a8f11719e6a2e3b5344 |     
   x86_64    |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/ef405cf95723c9b8ff8399586587d61c528220b4 |     
   x86_64    |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/04f31b57045317947be6098e245a4866e1267fdb |     
    i686     |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/c47f6c86bf8d9aa930af21fce8e5507f7cfd9aea |     
   x86_64    |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/48fb3104f14d2dcfdd257ea0797a8cf543f8e63d |     
   x86_64    |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/2371b6c6f3d6d4c24544ce4c9e052937515803d0 |     
    i586     |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/a4e9f49d4b1d23ccc802599cc2ff2533086bbc4e |     
    i586     |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/ce83e4021105c7e9f720d214a90bee4023acbab9 |     
   x86_64    |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/ec546514fc97a87efcadc1dfbb534bcc7146438f |     
   x86_64    |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/1c1d992f6f7610c6cb6ccc2f201484c674fd5497 |     
 powerpc64   |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/07d030414b3d8a7c5cfd978bf6d1e5cfb1b10bff |     
    i686     |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/71160e561ed1ef847c2d7147d1325702ae5eae57 |     
    i486     |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/fd2a1f035ba4d5738890061006925de4289d4a4f |     
   x86_64    |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/4d47b321c4eb70fbb757a6d42c1d11e044e2700b |     
   x86_64    |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/afac1e13c892a26fe3411ef196d87326b44b3b41 |     
   x86_64    |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/7f944e2907bb7368b7aae50918bb48251c60761b |     
    i686     |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/6f36f11ba116ca39fa3d87b511360673ac49bf4d |     
   x86_64    |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/8ff8ecd57d157abb6ac272a7ec2f4fc69bc13ca0 |     
    i686     |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/1a4a00389bcbde6d6e6f3dc663c2e4a6a4921ce8 |     
    i486     |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/418d43b831fe6745f0f4aa4621d34370f296e7a4 |     
   x86_64    |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/65e73146c9a7317759324b8d609240a472900a1d |     
   x86_64    |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/6f9f44543b8edc59e5df9676aabcd075273e7c35 |     
    i586     |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/e291c2f3ea33aeca8300f1eb932c38bd73029f8c |     
   x86_64    |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/ec9beda9bc89455eb98f22b91a69147aded49024 |     
    i686     |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/811b802ece04e1a853ad52249d079b72e8ec0904 |     
   x86_64    |    host-gcc-initial-12.2.0     | NOK | http://autobuild.buildroot.net/results/6f42661607ccb1c2ef0b720e57b84e6270662aac |     
    i686     |    host-gcc-initial-12.2.0     | NOK | http://autobuild.buildroot.net/results/79694c853e91811a3280cdda63cbb2f58c96c838 |     
    mips     |    host-gcc-initial-12.2.0     | NOK | http://autobuild.buildroot.net/results/22f3ed9662571bd63218e782eb444a0498367e20 |     
   x86_64    |    host-gcc-initial-12.2.0     | NOK | http://autobuild.buildroot.net/results/3d912222e2448518e893e46ebe5ab7a442654c0f |     
    i686     |    host-gcc-initial-12.2.0     | NOK | http://autobuild.buildroot.net/results/57a73a63d425710d3a9fd5cbda135b22c7969ed5 |     
   mips64    |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/465b07e7688fc645b24e74558c3e04333bbe6cce |     
   mips64    |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/661266820547ef1864873481fd6738a2dba5a8f1 |     
   mips64    |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/d9846b17d766c8075494916c95eb4ada4788af3f |     
   mips64    |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/5864ed773c7095dd591fe5e112fadb15547cf726 |     
    arm      | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/3e1cf94671b96f798fa28507de9e2322fa68398e |     
   sh4eb     | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/c25e1c3270e9cd45a019a17780dc3d301b31bf1f |     
    arm      | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/000d04262e52c42017c1cb388199a8542372eb1c |     
 powerpc64   |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/bb76812a0b6b4bd69eee0ba93f39ca7bd95a9ccc |     
   armeb     |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/9c248c4fed03b8bbcbf1e93a6f3f89dc4d404dbc |     
    arc      |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/b92ea9e4d2783711fa584e4bfb8b1d8a54e61947 |     
microblazeel |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/92587aa55cbad1a4e45fa8ba0c02d5094ab687e0 |     
 microblaze  |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/69a17ab1ba240c46d75d18b402d5f43f9168fd83 |     
  sparc64    |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/f592ad603ec47a6b3c9471ee571a298a9d1f00e3 |     
   x86_64    |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/a14d3bbd172e7a4238ba6ea594d6ed9d3019593c |     
   s390x     |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/425593307f6682cd71a638e03189996c92dfeb4d |     
   xtensa    |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/5be0d99f6e444ce1569f920f381f9fa9b83058b2 |     
 powerpc64   |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/0153714771e9f74240e00a47842d93d167ec659f |     
  riscv64    |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/04797bbf00e47cb88b1ad03c87c6f3a74c35a79e |     
    i586     |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/b5ea89f6d6abbcb15913cc8081b789ed35a03149 |     
microblazeel |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/a5637ec30e169179a68a0a989dd8c5e9255e01a1 |     
microblazeel |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/b393bdab3f154f6ae0109edf93bb263ce4067e13 |     
    arm      |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/64cac24d780e7c776ca6720e608a5af9711f4bec |     
    sh4      |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/b0fdb34ef20aa3f99231fe0c38b185c11592debc |     
   sparc     |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/6a2f738bbea7e7a4b775310a0cbe0887966882e5 |     
    arm      |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/3a3913c365dccc1d0e618e9bbf442bde84005f04 |     
    i686     |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/254c76223ef0db1cc11e621e2414b41d4c13a295 |     
   mipsel    |        host-vde2-2.3.2         | NOK | http://autobuild.buildroot.net/results/5dd44072f04898f328e6241e6bc21102f891c819 |     
    arm      |        host-vde2-2.3.2         | NOK | http://autobuild.buildroot.net/results/bc5580b84260903615b8650ca53511a51d8b4941 |     
   arceb     |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/40e25e396e2fd1d05851e700583c1df7c0fc398c |     
powerpc64le  |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/cdb789199bee01e318cce23c4f5289dd7ee88e94 |     
 microblaze  |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/26ad11b20114a38a73b0633409ae5da3baf2c011 |     
    arm      |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/b0456d5f2aa674ab70cd107d5e9e94484f01976f |     
   nios2     |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/fdc538d7c5265ace18f427a582a3ac2dc9919cfa |     
   nios2     |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/bf42e2b5788e33024483ec87ccdbf333a40c4ef7 |     
   x86_64    |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/72d43fc2cd756eff7ff9355d64d7a45d31110a4f |     
powerpc64le  |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/260661e31b2df08ed3bfab561a3fad394f899a21 |     
    mips     |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/9f6f6f4cf56e230530256c7d752c084b0a1178d3 |     
    arc      |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/72c0e6d538166d6234e055c97ded326205f027d3 |     
   mips64    |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/8e3d3ae7416e20a2e03eb1e08df77a6f303d024e |     
 powerpc64   |         jhead-3.06.0.1         | NOK | http://autobuild.buildroot.net/results/7003399a38ffaed5a17efd783276b650d153cfd1 | ORPH
    mips     |         jhead-3.06.0.1         | NOK | http://autobuild.buildroot.net/results/b7162337d7ccd032cc59784b55d10921410eb7ee | ORPH
   armeb     |          kexec-2.0.25          | NOK | http://autobuild.buildroot.net/results/8441a392c52b812b0b8f2b3a44a6d6ed1e4da6b3 | ORPH
   arceb     |         lcdproc-0.5.9          | NOK | http://autobuild.buildroot.net/results/dc56a69627bb2007f30f5d740e490a0e5b99345c |     
    mips     |        libarchive-3.6.1        | NOK | http://autobuild.buildroot.net/results/f9baee7da8cab72583bfbcfa189465bbf41b77d8 |     
 aarch64_be  |        libarchive-3.6.1        | NOK | http://autobuild.buildroot.net/results/01d9881bebf7ad56bcd0e2a0128ef0d63005108a |     
  aarch64    |        libarchive-3.6.1        | NOK | http://autobuild.buildroot.net/results/ad86634115155bb515acb90f6b53ebcb41bb60d9 |     
  aarch64    |        libarchive-3.6.1        | NOK | http://autobuild.buildroot.net/results/a4f0e1e02540ac591b7f04542017e27c8575f3be |     
 aarch64_be  |        libarchive-3.6.1        | NOK | http://autobuild.buildroot.net/results/1eef05c7b38520ddc5966a2fecf188eab902f09d |     
  riscv64    |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/896919e82e698531af68a946d67dda6701201628 |     
    or1k     |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/a038209c3580f8eab743db8ddb4a777f0a82e4e5 |     
  riscv64    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/85519741c23bdadf39a78f4b120c8d086cdc595c |     
 microblaze  |          libee-0.4.1           | NOK | http://autobuild.buildroot.net/results/f87eb71ba9cec7c4bf37c20f40a57ff622fc5a6c |     
 microblaze  |          libee-0.4.1           | NOK | http://autobuild.buildroot.net/results/df7c4f2a69e185ff9f91f0e0f759febca9583efb |     
   armeb     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/3960c55e90f5cd2b09fe7dcc58d0f627bd148940 | ORPH
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/e0b1b33ba72787490bd2f071bb7bfc904b629fd6 |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/f4c6df198c2a3db1381a79f4f3b9e148db6ca6c9 |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/0253b05955d729738072d7d70d1295d6a182e2a7 |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/e0d8af6933dc932c648fe6866a9e7744a1968f07 |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/2c3eadfa5aba8965afca5174044615e28d828b64 |     
  aarch64    |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/2e3f739729ffa4c71e8669cbb22cba26e4eb9a0f | ORPH
 microblaze  |        libmdbx-0.11.11         | NOK | http://autobuild.buildroot.net/results/7259eb7ef9eae5702eb17ec228f4312c534981a7 |     
  sparc64    |          libnss-3.83           | NOK | http://autobuild.buildroot.net/results/e9ca7bab606b5abd576a2d4ac183cef158f226a7 |     
  powerpc    |          libnss-3.83           | NOK | http://autobuild.buildroot.net/results/842760619da7357ab9cc9eb632222f83edcf5bd1 |     
    arc      |          libnss-3.83           | NOK | http://autobuild.buildroot.net/results/c5783644d812b7e5612d82edd8887ad4341f03af |     
    sh4      |          libnss-3.83           | NOK | http://autobuild.buildroot.net/results/5b10a0af5b1eb0501b0ac31b2db9a1af72a899cd |     
powerpc64le  |          libnss-3.83           | NOK | http://autobuild.buildroot.net/results/2fe8e6f16dd04813f564b1c0fae3e5bd8bca99a2 |     
   arceb     |          libnss-3.83           | NOK | http://autobuild.buildroot.net/results/395f6ee40ede21fd3ab3ccc9a94f676154449be7 |     
  powerpc    |          libnss-3.83           | NOK | http://autobuild.buildroot.net/results/fb5d19d44206fb3913833699d8c41dabc5773ad3 |     
   sparc     |          libnss-3.83           | NOK | http://autobuild.buildroot.net/results/a614fdcd33e70592ab1591a19eccbc1e21115aa7 |     
   sparc     |          libnss-3.83           | NOK | http://autobuild.buildroot.net/results/83e3590752788c8d285e2cece38dff30c9ff61e1 |     
   s390x     |        libostree-2022.6        | NOK | http://autobuild.buildroot.net/results/14cc164ab3005be9b3efde57b4bd914414e3acf0 |     
   armeb     | libsvgtiny-ea9d99fc8b231c22... | NOK | http://autobuild.buildroot.net/results/447b25720db1661e3a84202f333d139020b4964b | ORPH
    m68k     | libsvgtiny-ea9d99fc8b231c22... | NOK | http://autobuild.buildroot.net/results/0dce5065479003ef68f74df8f8465640b1ba08b5 | ORPH
  riscv64    | libsvgtiny-ea9d99fc8b231c22... | NOK | http://autobuild.buildroot.net/results/be5c44b05b4cc597722a924b40effc30d7b293f7 | ORPH
    mips     | libuci-4b3db1179747b6a67790... | NOK | http://autobuild.buildroot.net/results/9158ca7e6f8b053a04d6faa2d0cd4ed15cdef4ac |     
    i686     |    linux-5.10.145-cip17-rt7    | NOK | http://autobuild.buildroot.net/results/d73b5aa2bc413ee7bddd4da8b71ccf6a8c272356 | ORPH
   mips64    |           linux-6.0            | NOK | http://autobuild.buildroot.net/results/dcc526114a2f2ce1aa7ed33cdc2384e7be8dd6ac | ORPH
   sparc     |           linux-6.0            | NOK | http://autobuild.buildroot.net/results/ed5603feb43c3f85ece05fb8de7a759c85b1172f | ORPH
   arceb     |           linux-6.0            | NOK | http://autobuild.buildroot.net/results/69bbb9058914463f48e2ad4b23b12f1ae2e3e95a | ORPH
    sh4      |           linux-6.0            | NOK | http://autobuild.buildroot.net/results/0a98b2704d5e77070d0cb999e748cabc0dd796ba | ORPH
   nios2     |           lxc-4.0.12           | NOK | http://autobuild.buildroot.net/results/9b17cb0955d58b621697fa7a56776fa09c14da05 |     
   x86_64    |           lxc-4.0.12           | NOK | http://autobuild.buildroot.net/results/71f57dae23cb1dcc84bc403726cabc98c3a872b0 |     
   armeb     |        memcached-1.6.16        | NOK | http://autobuild.buildroot.net/results/d31b48a102fbdf2e24ed908139d584794e0f7ca3 | ORPH
   sparc     |        memcached-1.6.16        | NOK | http://autobuild.buildroot.net/results/2efce22efdbda7f0e796dc9c3d270deaf80908b2 | ORPH
   mips64    |         mesa3d-22.1.6          | NOK | http://autobuild.buildroot.net/results/bec76520bf9020b494db93a90d5d74489df1e928 |     
 powerpc64   |         musepack-r475          | NOK | http://autobuild.buildroot.net/results/498572f7abc1dbae252ff7c459f80ea8986edc8d | ORPH
microblazeel |         musepack-r475          | NOK | http://autobuild.buildroot.net/results/632a86e4e471a58e518ce55669e7b4d0b35703d9 | ORPH
  powerpc    |           musl-1.2.3           | NOK | http://autobuild.buildroot.net/results/ea296af38e0473d17da3f0d8080e074aebe90ef6 |     
  powerpc    |           musl-1.2.3           | NOK | http://autobuild.buildroot.net/results/7619319958cce7c7197cb6bdf0cc4a2e4f0a5221 |     
  powerpc    |           musl-1.2.3           | NOK | http://autobuild.buildroot.net/results/7db2305156bae5d8e012d7d3fee0efbc6982cf75 |     
   sparc     |          nanocom-1.0           | NOK | http://autobuild.buildroot.net/results/43f1295a1634804a4fa577fb9f8a8a28723f83de |     
   mipsel    |       netsniff-ng-0.6.8        | NOK | http://autobuild.buildroot.net/results/4e4fbf8423faa29ee62c5189c5b0a562998cf687 |     
    m68k     |          netsurf-3.10          | NOK | http://autobuild.buildroot.net/results/a3de8db161d71261dbeef02d0a959fe2d51eedf3 |     
    arc      |          netsurf-3.10          | NOK | http://autobuild.buildroot.net/results/eef13dd87ccf488948f448cf53b9951c3ba3fc90 |     
  riscv64    |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/a8c07e4458f6426dfb6626679e9b27d141adaad8 | ORPH
   xtensa    |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/34cfa0d6df7a0e182a62b8039ee45c99b4e3ada7 | ORPH
   armeb     |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/83691c2c05436d5b15955297ca7a341a58c7a88d | ORPH
    arc      |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/8aa144acf1566a932ab1dbf13f689474c40a5d3c | ORPH
   s390x     |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/1bc4d3cccedaffd410c040a6abb15afa722d52ed | ORPH
microblazeel |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/6c29ca77ee776897d8c41e6d529fa6ba9e102cc7 | ORPH
    arc      |        open62541-v1.3.3        | NOK | http://autobuild.buildroot.net/results/03c5a53f90c6e220bbfaa6e0fd6003722b2dc0a4 | ORPH
   xtensa    |        open62541-v1.3.3        | NOK | http://autobuild.buildroot.net/results/02966b70723d46cf3ee62c5b4d97359aa5b3db02 | ORPH
    or1k     |        openpgm-5-3-128         | NOK | http://autobuild.buildroot.net/results/f9e7900d501ebff948ec7308ac7799e07d586936 |     
  sparc64    |        openpgm-5-3-128         | NOK | http://autobuild.buildroot.net/results/45a57f169631b1317e6e9eb0938719078786a67f |     
    m68k     |         openssh-9.0p1          | NOK | http://autobuild.buildroot.net/results/810e955c26ea8f6c0627d50cc23e9e8378d51b80 | ORPH
    i686     |  openvmtools-11.3.5-18557794   | NOK | http://autobuild.buildroot.net/results/7bcf5a314c636d380222bd954b3decf0f9f8fb82 |     
    m68k     |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/ee0fad6e5711f201b3601b08b3ef4902cd430453 |     
    sh4      |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/7c3d7954aa9628e7ae25943c8f4265b8a7ff7c9b |     
 microblaze  |      perl-net-ssleay-1.85      | NOK | http://autobuild.buildroot.net/results/a52b279b2431807fb4e2a6f996ab54a85911ce92 |     
   arceb     |         python3-3.10.7         | NOK | http://autobuild.buildroot.net/results/c8850a579a83be6d693a15e2ab914549dbe901bd |     
  aarch64    | qt5base-2ffb7ad8a1079a0444b... | NOK | http://autobuild.buildroot.net/results/48a99ad1c80f914020640e4465bc4722ae988931 |     
  riscv64    |            rauc-1.8            | NOK | http://autobuild.buildroot.net/results/cd9812aaaad1bef79f6916051145e9814c1c93ee |     
 microblaze  |   s6-portable-utils-2.2.3.2    | NOK | http://autobuild.buildroot.net/results/2600d8e8d301df6c49bced9aefb33a90cbfbf101 |     
   mipsel    | sconeserver-8d1935919a20133... | NOK | http://autobuild.buildroot.net/results/c48ccb2547d0370439571cb7c5794a6385489e83 |     
   arceb     |          scrypt-1.3.1          | NOK | http://autobuild.buildroot.net/results/64df0c9f5dca57714e506455c96b6263bea57471 |     
    sh4a     |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/749a8e4989ca7c9df1c78a95cfd55faf8715763a | ORPH
    mips     |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/0536730c18546b817a882dc3b655bd5efac9385c | ORPH
   mipsel    |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/02bfebecd1cc56fa65029b1624b5eff64cc81d2f | ORPH
    arm      | sdl_mixer-d1725fcb7c4e987ae... | NOK | http://autobuild.buildroot.net/results/a5238d4ebf8bf381ff5266ec94e107d29e988146 | ORPH
    or1k     |        skalibs-2.10.0.3        | NOK | http://autobuild.buildroot.net/results/16abd495f900f0ccc959f75897d212bf3bd61557 |     
   sparc     |          slang-2.3.2           | NOK | http://autobuild.buildroot.net/results/83791d2e4bef81bc74bc5259a46c5b4964b9772a | ORPH
    arc      |          slang-2.3.2           | NOK | http://autobuild.buildroot.net/results/a90ce64e8be9fcf1ba720f0a7d49c7354a5b8a95 | ORPH
   xtensa    |          slang-2.3.2           | NOK | http://autobuild.buildroot.net/results/e737c0cf7b25e429c74f22bc35169d770fd914e3 | ORPH
   s390x     |          slang-2.3.2           | NOK | http://autobuild.buildroot.net/results/a61e0e7b0eca6702905f2bf092f2fda0dc7d5308 | ORPH
  powerpc    |          slang-2.3.2           | NOK | http://autobuild.buildroot.net/results/937969677a707d04b7cb84378194b3c80613c465 | ORPH
    arc      |          slang-2.3.2           | NOK | http://autobuild.buildroot.net/results/6a93fde13ab42715752ddeec12d31cd1257dced4 | ORPH
    arm      |          slang-2.3.2           | NOK | http://autobuild.buildroot.net/results/9109d8a6dfb0f79188c63d05e684b7d6ba14af54 | ORPH
 microblaze  |          slang-2.3.2           | NOK | http://autobuild.buildroot.net/results/1051e9683ed327db1ffc4054ab4593c4f1998be1 | ORPH
   xtensa    |          slang-2.3.2           | NOK | http://autobuild.buildroot.net/results/677d7e1bf02006d4559e3f6320615828ad8344ce | ORPH
   mips64    |          slang-2.3.2           | NOK | http://autobuild.buildroot.net/results/af8e0c0e878dce0e37b19821871200f8bea7f390 | ORPH
    mips     |          slang-2.3.2           | NOK | http://autobuild.buildroot.net/results/31b56ab5789551e29f217b09a969b597650f0af2 | ORPH
    arc      |          slang-2.3.2           | NOK | http://autobuild.buildroot.net/results/41d560caf65b049a076c59ac3fa81dfb40acba04 | ORPH
    arc      |          slang-2.3.2           | NOK | http://autobuild.buildroot.net/results/dafefedb7bd73025fd0e7e3bfa3bcaee4fef4c03 | ORPH
microblazeel |          slang-2.3.2           | NOK | http://autobuild.buildroot.net/results/e8ac6c0210cf7e367f67d89992c8003a1cebb0bd | ORPH
    or1k     |          slang-2.3.2           | NOK | http://autobuild.buildroot.net/results/a44ba737dba79064098326e7a18790d99b69dfe3 | ORPH
    arc      |          slang-2.3.2           | NOK | http://autobuild.buildroot.net/results/95f7c354f530e8e7629e012330be57553b10f725 | ORPH
   sparc     |          slang-2.3.2           | NOK | http://autobuild.buildroot.net/results/970dd5b1509f89914597b4b516df46ead9e18eea | ORPH
    mips     |          slang-2.3.2           | NOK | http://autobuild.buildroot.net/results/32143d94241025d5def9f2120609f941ddac11c9 | ORPH
    or1k     |          slang-2.3.2           | NOK | http://autobuild.buildroot.net/results/0955943d4c4e0c298484da13f22e6e7511302768 | ORPH
   sparc     |          slang-2.3.2           | NOK | http://autobuild.buildroot.net/results/fac211c158f3460427c6366ab788474d53ebac94 | ORPH
  aarch64    |           sslh-1.22c           | NOK | http://autobuild.buildroot.net/results/6a8e5b4eb2f0fe6f6ed5f08774006a1c25a823e5 |     
   s390x     |       stress-ng-0.13.05        | NOK | http://autobuild.buildroot.net/results/f788035e0748c06cf46671d200b19dc0e3d9e0af |     
  sparc64    |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/0c0c165fb073235ba0d711cbc7115d3d034d8d34 |     
 aarch64_be  |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/385923d51ba704f44afb3b74a9df7ea79b0ea36a |     
  sparc64    |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/9b134dab0c09ebba516f2a27da42a887aa87016a |     
  sparc64    |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/8543720b3da981ddd57f855251fbff2534f6bdd5 |     
   nios2     |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/5058089923f4bbed11f1d6a8a21f72981b0baaf7 |     
   s390x     |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/cc06ddf8c4387fdbd5390d09263c88655a496c61 |     
   s390x     |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/9b245bc9e999f16ec50af7dddd399493a7e29d62 | ORPH
  sparc64    |         tealdeer-1.5.0         | NOK | http://autobuild.buildroot.net/results/d07cebae2d5b0354e691c686dfcdfa7222ce1f97 |     
   mips64    | toolchain-external-codescap... | NOK | http://autobuild.buildroot.net/results/ebf1e6d4a6e335b347100d59dae717b7c48e3835 | ORPH
   mips64    | toolchain-external-codescap... | NOK | http://autobuild.buildroot.net/results/eec65adda926aa9dca86319fc348a5d73db5483d | ORPH
powerpc64le  |        traceroute-2.1.0        | NOK | http://autobuild.buildroot.net/results/226d3826c4d845dccb1092da88d2882db98b009b |     
 aarch64_be  | tstools-08f6be304040e7b8476... | NOK | http://autobuild.buildroot.net/results/2d81499251623a55878167d64383c6f610514d53 |     
   xtensa    | tstools-08f6be304040e7b8476... | NOK | http://autobuild.buildroot.net/results/bfe3b131934fd2a3ca88ef75ed1fadfbd426713a |     
  powerpc    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/0348066e22012a229c94ae703cab8a8c631b1225 |     
 aarch64_be  | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/a3c57997f4bc2675a40980ee7207949e7d59a57a |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/874cf2f0927325df1d08e96bc4ee1e837ff579ae |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/09cc99aca93dc4e83db1db5aefdc0ddadd4d79a9 |     
powerpc64le  |            unknown             | NOK | http://autobuild.buildroot.net/results/288634c00e8338224206e37bbc59a9b009c4482e |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/c8cdc22a6f05b8e2bd26a0352c6b7553e0dd05a0 |     
   mips64    |        valgrind-3.19.0         | NOK | http://autobuild.buildroot.net/results/f0fbd99bbc12f1d229dccf43bec4cdb581c1e1c1 | ORPH
    or1k     |           vde2-2.3.2           | NOK | http://autobuild.buildroot.net/results/b1fe1e4a8e6c98d76f5d8ec4de7e50dee34b5511 |     
microblazeel |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/f9ac0a5cb43fef9578154aca5ea91eb8a3964d28 |     
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/607596d4ec68af11786b43ea1074dbc62e347bd8 | ORPH
 microblaze  |           zstd-1.5.2           | NOK | http://autobuild.buildroot.net/results/31880dd0cfa331c5652b64c86c7ba5823b2afe47 |     


Classification of failures by reason for 2022.02.x
--------------------------------------------------

               host-go-1.17.13 | 1 


Detail of failures for 2022.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |        host-go-1.17.13         | NOK | http://autobuild.buildroot.net/results/69455bf4f986a45ae55175adfb20d29e13a8555e |     


Classification of failures by reason for 2022.08.x
--------------------------------------------------

            igd2-for-linux-2.1 | 2 
              dropbear-2022.82 | 1 
                     frr-8.2.2 | 1 
glibc-2.35-134-gb6aade18a7e... | 1 
         host-gcc-final-11.3.0 | 1 
host-gdb-arc-2020.09-releas... | 1 
                host-go-1.18.6 | 1 
                 linux-5.17.15 | 1 
                   perl-5.34.1 | 1 
                tealdeer-1.5.0 | 1 
                       unknown | 1 
                  xvisor-0.3.1 | 1 


Detail of failures for 2022.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |        dropbear-2022.82        | NOK | http://autobuild.buildroot.net/results/8d7bebb9c1c483d137c9c9c82d1ecccbf0257773 |     
    arc      |           frr-8.2.2            | NOK | http://autobuild.buildroot.net/results/792fa0e37d020806baaadf76bac8c138b115938b |     
   nios2     | glibc-2.35-134-gb6aade18a7e... | NOK | http://autobuild.buildroot.net/results/e147a37feec830966bcdad0cdade270a3a5ff0b6 |     
microblazeel |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/a1211339484e092d9e3c83f45128c7411ad7add3 |     
    arc      | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/f9f73d9da7709f16c674460fe6880b5f392725cc | ORPH
powerpc64le  |         host-go-1.18.6         | NOK | http://autobuild.buildroot.net/results/826d262ac23863c8452b0ba6713a2c57fb9fade5 |     
   armeb     |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/87b6081af9cb348385e74bef9fa04a9ee2c209e4 |     
   nios2     |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/75ba643f56afabf1c9b419438855d231f1e5dcab |     
  mips64el   |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/898ea46c022be026b43214e77e91f560a4317918 | ORPH
 aarch64_be  |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/ba9ec4a3ad2847c97098c7c4f1ea188774520934 |     
    mips     |         tealdeer-1.5.0         | NOK | http://autobuild.buildroot.net/results/591136f6547f29e842a23d95f257deae6d3a5742 |     
   armeb     |            unknown             | NOK | http://autobuild.buildroot.net/results/7e11b8615cbf01c79ec31bb0662f4b7d1e02d650 |     
  riscv32    |          xvisor-0.3.1          | NOK | http://autobuild.buildroot.net/results/22aedcd4bddd0ef9f9275107e7af2c37ce2fe212 |     


Gitlab CI results for 2022-10-10
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
      TestCpioDracutGlibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3148422047  | ORPH 
...ioDracutGlibcMergedUsr | https://gitlab.com/buildroot.org/buildroot/-/jobs/3148422048  | ORPH 
       TestCpioDracutMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/3148422049  | ORPH 
...pioDracutMuslMergedUsr | https://gitlab.com/buildroot.org/buildroot/-/jobs/3148422051  | ORPH 
     TestCpioDracutUclibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3148422055  | ORPH 
...oDracutUclibcMergedUsr | https://gitlab.com/buildroot.org/buildroot/-/jobs/3148422056  | ORPH 
        TestDockerCompose | https://gitlab.com/buildroot.org/buildroot/-/jobs/3148422104  | ORPH 
...c440fpMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3148422662  | ORPH 
...86i686MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3148422826  | ORPH 
...lx60UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3148422836  | ORPH 
...Xtensalx60UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3148422841  | ORPH 
   TestGdbHostGdbTarget9x | https://gitlab.com/buildroot.org/buildroot/-/jobs/3148422111  | ORPH 
   TestGdbHostGdbserver9x | https://gitlab.com/buildroot.org/buildroot/-/jobs/3148422113  | ORPH 
        TestGdbHostOnly9x | https://gitlab.com/buildroot.org/buildroot/-/jobs/3148422115  | ORPH 
...InitSystemBusyboxRoNet | https://gitlab.com/buildroot.org/buildroot/-/jobs/3148422080  | ORPH 
             TestLuaLuaGD | https://gitlab.com/buildroot.org/buildroot/-/jobs/3148422144  | ORPH 
                  TestOci | https://gitlab.com/buildroot.org/buildroot/-/jobs/3148422073  | ORPH 
TestUbootOpensslPkgConfig | https://gitlab.com/buildroot.org/buildroot/-/jobs/3148422444  | ORPH 



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
