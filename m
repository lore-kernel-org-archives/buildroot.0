Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2923EC433FE
	for <buildroot@archiver.kernel.org>; Wed, 30 Nov 2022 08:08:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A9FE660A46;
	Wed, 30 Nov 2022 08:08:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A9FE660A46
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qFB10A_T3fa2; Wed, 30 Nov 2022 08:08:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5E6C160ADB;
	Wed, 30 Nov 2022 08:08:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5E6C160ADB
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 795C01BF4DA
 for <buildroot@lists.busybox.net>; Wed, 30 Nov 2022 08:08:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3A98F813E6
 for <buildroot@lists.busybox.net>; Wed, 30 Nov 2022 08:08:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3A98F813E6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YU8TqQtuAlka for <buildroot@lists.busybox.net>;
 Wed, 30 Nov 2022 08:08:01 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 05C31813E0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 05C31813E0
 for <buildroot@buildroot.org>; Wed, 30 Nov 2022 08:08:00 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 1D7CCFF812
 for <buildroot@buildroot.org>; Wed, 30 Nov 2022 08:07:58 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Wed, 30 Nov 2022 08:07:58 -0000
Message-Id: <20221130080804.3A98F813E6@smtp1.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1669795678; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=QEcfxefCE/uHAeb/ykbRGeX4iCZX6TUjgKjUYEw/4OQ=;
 b=A0htQxqAutL6y9ymlnST3jWG9gNaTvA2sredK5wJDgABc3KQ6p0LPncA6R5l7FCTNHz85n
 dBk51uROOC6+L2e/Sc1HeBCYAySmZNeZmzWIURgZoR3PRIZVFPwxenbVRtemlLJgP9r1pi
 T1O2/SU/i60pmJpc6XT5hm0IvuowbREMQ3/dxd2L/80BH8yn5U0NXHxUW+6irrK+cHoRXJ
 a5bvnTz+E/wt+2fWBplo6uhCvPtgKthFAAdl3J2SH1SrAdVX6OG65vxLW4Tt6K8N7NHHFA
 3IDs0k8DUWhOwkhofpAFbrDldf4r2A8oV7fGQKcL4bVp0kyQXq8nwtG+MBnkyw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=A0htQxqA
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-11-29
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

Autobuild statistics for 2022-11-29
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  |  6  |  1  |  0  |  7  |
  2022.08.x  | 24  | 21  |  0  | 45  |
    master   | 283 | 248 |  0  | 531 |
     next    | 20  | 30  |  0  | 50  |

Classification of failures by reason for master
-----------------------------------------------

                host-go-1.19.3 | 13
              host-pahole-1.24 | 12
                      xz-5.2.7 | 12
                   linux-6.0.9 | 9 
                gerbera-1.10.0 | 8 
  gobject-introspection-1.72.0 | 7 
             lirc-tools-0.10.2 | 7 
           python-numpy-1.23.4 | 7 
                       unknown | 7 
            host-binutils-2.38 | 6 
                elfutils-0.186 | 5 
              host-rust-1.64.0 | 5 
               libglib2-2.72.3 | 5 
              memcached-1.6.16 | 5 
                     efivar-38 | 3 
             fontconfig-2.13.1 | 3 
glibc-2.36-66-ga1dc0be03c9d... | 3 
              libgcrypt-1.10.1 | 3 
                     lxc-5.0.1 | 3 
                tealdeer-1.6.1 | 3 
              traceroute-2.1.0 | 3 
ulog-0389d243352255f6182326... | 3 
                wtfutil-0.41.0 | 3 
                alsa-lib-1.2.8 | 2 
               apcupsd-3.14.14 | 2 
                      crun-1.5 | 2 
             f2fs-tools-1.15.0 | 2 
               fftw-quad-3.3.8 | 2 
                     frr-8.3.1 | 2 
         host-gcc-final-11.3.0 | 2 
               libdeflate-1.12 | 2 
             libgpg-error-1.45 | 2 
                libkcapi-1.4.0 | 2 
                   libnss-3.84 | 2 
          linux-5.10.145-cip17 | 2 
                linuxptp-3.1.1 | 2 
          lttng-modules-2.13.1 | 2 
              mosquitto-2.0.15 | 2 
                   perl-5.34.1 | 2 
    python-cryptography-38.0.1 | 2 
            quickjs-2021-03-27 | 2 
/home/buildroot/autobuild/i... | 1 
/home/buildroot/autobuild/i... | 1 
                  acpid-2.0.34 | 1 
afboot-stm32-3566acd582e553... | 1 
android-tools-4.2.2+git2013... | 1 
             batman-adv-2022.2 | 1 
                  bind-9.16.33 | 1 
             bluez5_utils-5.65 | 1 
                    brltty-6.5 | 1 
              containerd-1.6.8 | 1 
           crucible-2022.05.25 | 1 
                 dash-0.5.11.5 | 1 
                 dc3dd-7.2.641 | 1 
              dieharder-3.31.1 | 1 
               ding-libs-0.6.2 | 1 
                 dmalloc-5.6.5 | 1 
           docker-cli-20.10.19 | 1 
         docker-compose-2.11.2 | 1 
               dvdauthor-0.7.2 | 1 
        edk2-edk2-stable202102 | 1 
                  exempi-2.6.1 | 1 
                  ffmpeg-4.4.3 | 1 
                    flac-1.4.2 | 1 
fs/axfs/axfs.mk:32: /tmp/in... | 1 
fs/ubi/ubi.mk:51: /home/aut... | 1 
fs/ubi/ubi.mk:51: /tmp/inst... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /tmp/... | 1 
fs/ubifs/ubifs.mk:49: /tmp/... | 1 
fs/ubifs/ubifs.mk:49: /tmp/... | 1 
              fstrcmp-0.7.D001 | 1 
                 fwts-22.09.00 | 1 
                    gdal-3.5.1 | 1 
                      gdb-11.2 | 1 
          gitlab-runner-14.5.1 | 1 
                 glibmm-2.68.2 | 1 
                     gmp-6.2.1 | 1 
google-breakpad-c85eb4a59b6... | 1 
gummiboot-2bcd919c681c952eb... | 1 
kvmtool-f77d646ba01d04be5aa... | 1 
               libcap-ng-0.8.3 | 1 
                libgeos-3.11.0 | 1 
             libopenssl-1.1.1q | 1 
               libvorbis-1.3.7 | 1 
                libxml2-2.10.3 | 1 
      linux-5.10.145-cip17-rt7 | 1 
        ltp-testsuite-20220930 | 1 
                  matio-1.5.23 | 1 
                    mpv-0.33.1 | 1 
                     mtd-2.1.5 | 1 
                    musl-1.2.3 | 1 
         mxs-bootlets-10.12.01 | 1 
                netdata-1.33.1 | 1 
                  netsurf-3.10 | 1 
            ocf-linux-20171122 | 1 
                 openssh-9.1p1 | 1 
   openvmtools-11.3.5-18557794 | 1 
                    opus-1.3.1 | 1 
                    php-8.1.12 | 1 
           proxychains-ng-4.16 | 1 
   python-greenlet-1.1.3.post0 | 1 
rtl8192eu-1e15b6d451731bc4d... | 1 
                    sdl-1.2.15 | 1 
                 systemd-250.8 | 1 
toolchain-external-codescap... | 1 
             uccp420wlan-6.9.1 | 1 
           v4l2loopback-0.12.7 | 1 
                 wolfssl-5.5.3 | 1 
                xenomai-3.0.10 | 1 
               xfsprogs-5.14.2 | 1 
                  zabbix-5.4.9 | 1 
                    zeek-4.1.1 | 1 
             zynaddsubfx-3.0.6 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   s390x     | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/8f402027aa4f40d430ef4c167b28c5c5b0dbaf76 |     
    or1k     | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/9f89c4716eaefa513ac42b913634740664860d46 |     
   mips64    |          acpid-2.0.34          | NOK | http://autobuild.buildroot.net/results/3053b1ae7c9df582490cd65a9498ce71260177f5 | ORPH
    arm      | afboot-stm32-3566acd582e553... | NOK | http://autobuild.buildroot.net/results/dbc84e65e2ccc1f4b03f905b6add7e2957609b3e |     
    or1k     |         alsa-lib-1.2.8         | NOK | http://autobuild.buildroot.net/results/7a610559d200afeecfbb239c6156305d9a945ed9 |     
powerpc64le  |         alsa-lib-1.2.8         | NOK | http://autobuild.buildroot.net/results/4285d3dde618778e24cbd6e489c93279361cb5ff |     
 powerpc64   | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/1ddf5a0ae4ae983a4adf88bea792a1c7769ad634 |     
    arc      |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/08e4cf37178c1ea41502e98aeec3e664f707f128 |     
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/a125e64829068d906778c220a94ad0ea3672979b |     
  mips64el   |       batman-adv-2022.2        | NOK | http://autobuild.buildroot.net/results/a686f1f221a7f6aee5eb04b0c439a14b187faf67 |     
   sh4eb     |          bind-9.16.33          | NOK | http://autobuild.buildroot.net/results/2f59e62673b5edda0253ed0beeac01fdaebc3121 | ORPH
    sh4      |       bluez5_utils-5.65        | NOK | http://autobuild.buildroot.net/results/5c9cb2ddf5155d3c7b5bd9610be28e3f8c0906ba |     
 microblaze  |           brltty-6.5           | NOK | http://autobuild.buildroot.net/results/05aed642f1c725ea54718641947ff23ed468d636 |     
powerpc64le  |        containerd-1.6.8        | NOK | http://autobuild.buildroot.net/results/8b324edbc8c5fc07e37bc088b694a328ee2b7b60 |     
   s390x     |      crucible-2022.05.25       | NOK | http://autobuild.buildroot.net/results/d4c5c4ba85576a7ba2378ba88bbb46512be353fd |     
  riscv64    |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/ebf6e42a7bc9987603dfc1f7e93c214bef1ee384 |     
  riscv64    |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/38d5f2b6cc2f1c7763f972670776c6a0d179d193 |     
   xtensa    |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/66d504ce176e3c2ff836beaa1afd598934b55c2d | ORPH
    or1k     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/acd40aa2f1560b2f18530053d459c3829dca8526 | ORPH
microblazeel |        dieharder-3.31.1        | NOK | http://autobuild.buildroot.net/results/78f0415304e4099f4edafa6f4a618fb082ee78ae |     
    arc      |        ding-libs-0.6.2         | NOK | http://autobuild.buildroot.net/results/da8707b9b8d0d6b18dadcb6d9e5896af74f7e1c2 |     
    i686     |         dmalloc-5.6.5          | NOK | http://autobuild.buildroot.net/results/112a7ff60f9e13ecf094c42c4e0a2834b383e91f | ORPH
    i686     |      docker-cli-20.10.19       | NOK | http://autobuild.buildroot.net/results/d5e706a85184ba2379103f7d07fef741fefb24b3 |     
   x86_64    |     docker-compose-2.11.2      | NOK | http://autobuild.buildroot.net/results/284542e2ef2c747331c1ea154ff4259013224d60 |     
    or1k     |        dvdauthor-0.7.2         | NOK | http://autobuild.buildroot.net/results/50ba37649ee4b272f47f8406fa98557ad9d75c2d |     
  aarch64    |     edk2-edk2-stable202102     | NOK | http://autobuild.buildroot.net/results/2f9616782f3b095bf31855e2095ee84c2172a352 |     
    arm      |           efivar-38            | NOK | http://autobuild.buildroot.net/results/89b4742ac7e21af2ae8ff08cd8ee063f0e838a29 |     
    i686     |           efivar-38            | NOK | http://autobuild.buildroot.net/results/713b21ddcfbe45c3476ae2a561051a02426e7ea3 |     
  mips64el   |           efivar-38            | NOK | http://autobuild.buildroot.net/results/8f158269ca192339ab671eb06f374a88920687ed |     
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/98aebc329bb5b11cc3cbb6c870252b183deec140 | ORPH
   arceb     |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/3ae009d154543a6c7b50f8d074f5645a0b948089 | ORPH
    arc      |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/a8cd34a552ce74bf5f4e291045f8dafd61c316cc | ORPH
   arceb     |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/574fe04d8634c47e05526c7f95085daf0e89aaa3 | ORPH
    arc      |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/d78837247dd5b42330cb39bc5c47038527fa39e6 | ORPH
   sh4aeb    |          exempi-2.6.1          | NOK | http://autobuild.buildroot.net/results/2505263d3645eb57a0ab2cb2d28c5710c484bbbd |     
    or1k     |       f2fs-tools-1.15.0        | NOK | http://autobuild.buildroot.net/results/0b1c3f2244d7119d274f91cb37fe2508e5a4b0b5 |     
    or1k     |       f2fs-tools-1.15.0        | NOK | http://autobuild.buildroot.net/results/5edb3294938a2f22abccb15a7a062112939481f0 |     
    arm      |          ffmpeg-4.4.3          | NOK | http://autobuild.buildroot.net/results/57e39becb613f879238d818a82afd52ba16c0504 |     
powerpc64le  |        fftw-quad-3.3.8         | NOK | http://autobuild.buildroot.net/results/abaa5b71072aa5054c0aa78058e0ed25cb388ffe | ORPH
powerpc64le  |        fftw-quad-3.3.8         | NOK | http://autobuild.buildroot.net/results/abb1e2bf28d3e562e26875029e1169ce2e6e73d9 | ORPH
    sh4a     |           flac-1.4.2           | NOK | http://autobuild.buildroot.net/results/d9cc0a85f98629f2f30587079f0d7f1dd84bf01c |     
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/cc43e30ab74daae618f2d9ffc9b76bef3907ce4b | ORPH
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/e9e1dddafed5ed339748818966970860f6c3e3b8 | ORPH
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/2acbfeca2531df570b0f97a29b305c12072640f8 | ORPH
  mips64el   |           frr-8.3.1            | NOK | http://autobuild.buildroot.net/results/6f67f3d9ff471c671ccabcb1a52d8959470a873d |     
    arc      |           frr-8.3.1            | NOK | http://autobuild.buildroot.net/results/ee70b9e852c37d62f3d0cd0737259f7ca9fda8a8 |     
  sparc64    | fs/axfs/axfs.mk:32: /tmp/in... | NOK | http://autobuild.buildroot.net/results/5c259770bb0fd8ca3826dd8f49627c2f97b02777 |     
    m68k     | fs/ubi/ubi.mk:51: /home/aut... | NOK | http://autobuild.buildroot.net/results/cf00749b04dfddcd67a03576b4156e5c52ad6218 |     
 aarch64_be  | fs/ubi/ubi.mk:51: /tmp/inst... | NOK | http://autobuild.buildroot.net/results/892e3a8341bec3c8ccab3b93ac4d71ba2963aaf1 |     
powerpc64le  | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/31f242a2095e14f488818186d6cae540c4e3b210 |     
   x86_64    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/1dcb1182585ed0dd2fc4fc4d98583d67867aae09 |     
    or1k     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/7f68bf74f1699871f592c14d5539744160d71d3c |     
   nios2     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/1718a19d05582b5a1e7344c4d406b863a192d655 |     
  sparc64    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/65d558a1f8b8d6b2319cc0b7a8bd1025fe28be84 |     
powerpc64le  | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/d1dfe9b659fef32675be2e112c11e03fb1da5054 |     
   nios2     | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/87a715971ed50f7e736a532d70cac77441c42e40 |     
  sparc64    | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/d0130041708ae20ff29785b38df8d91e5db2b012 |     
   armeb     |        fstrcmp-0.7.D001        | NOK | http://autobuild.buildroot.net/results/2179a47b98b6e5abc013f6b0507a10526f5f52f7 |     
    i586     |         fwts-22.09.00          | NOK | http://autobuild.buildroot.net/results/87229f1fd62bc948fb65b9b7269324d50237beb5 |     
   sh4aeb    |           gdal-3.5.1           | NOK | http://autobuild.buildroot.net/results/2c0c3cea86d1c13b6668b84372f9a7eb90dc19b1 |     
  mips64el   |            gdb-11.2            | NOK | http://autobuild.buildroot.net/results/e20bc1c7fabeb94b7a5e0523d7a43cc697844167 | ORPH
powerpc64le  |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/5e890d9e0cfd2265c526b35349a5a83d0fea1227 |     
 aarch64_be  |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/6745c41491f1e7ceff2c34b2190c8919b4f7945b |     
  riscv32    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/b046953db5d628566a3a40725b187ada5bbb26be |     
   nios2     |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/4c5301272dedb23399106d915d7fba8e26975e90 |     
    or1k     |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/6b289aaa690a4e95fbdcc183d903ae1b26f2b066 |     
  mips64el   |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/364e90fce98f7be0c170db4a2c4e75b33cf2155e |     
   x86_64    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/a96710a87aa7ddd9599c96db0a84f7ac5de84ae8 |     
   mipsel    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/54307a94d8c876f9b974288ffb6c3a13f17a53a3 |     
  riscv64    |      gitlab-runner-14.5.1      | NOK | http://autobuild.buildroot.net/results/621fbf65bb11e7c96beb48fe205d7c42a344d21d |     
  powerpc    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/2f642a6526626cde9ed035621ea372812c8ca3e6 |     
 powerpc64   | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/42a09b23b397812db02c0c4b55e875435c3810cd |     
  riscv64    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/02a517975c9511f93a5b6b83c7515b15e0326512 |     
    or1k     |         glibmm-2.68.2          | NOK | http://autobuild.buildroot.net/results/bb2653936c8caf1f5563f894dbd0cd846e409a64 |     
  riscv64    |           gmp-6.2.1            | NOK | http://autobuild.buildroot.net/results/bc1ce163cadaf37a1b27c10af3a2bf5b7270ed24 | ORPH
    or1k     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/d6da7be9a334e87f042f6b2bfd0305f9061943b5 | ORPH
microblazeel |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/5078d6a71fe3ece592e10bd1c71c450d965a5056 | ORPH
   s390x     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/cdfdd251e7a65d7bb4c018cd919d35142e45fc21 | ORPH
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/9f97769cb64b110bfae55f8559dec2297e942c08 | ORPH
   s390x     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/5fe563899feda7d2b94aa0f1b66fbc0236d1cda0 | ORPH
powerpc64le  |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/2d0dcb5f58bb85169db2e0677285c89bf8de3a2f | ORPH
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/92358be003accf39fce296374b775420ba80632e | ORPH
    mips     | google-breakpad-c85eb4a59b6... | NOK | http://autobuild.buildroot.net/results/62e301138f64064b3a899a9fc9ae6550802824c7 |     
    i686     | gummiboot-2bcd919c681c952eb... | NOK | http://autobuild.buildroot.net/results/04005fb1d7cfd7c1260ec87ee4c4f4a4c5a18abf |     
  riscv32    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/a961c9d45a579579158ea7d0305e27ce1f3b885f |     
 microblaze  |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/a7d5c374a123677e20187bb743f74b07204510a0 |     
   armeb     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/e585edc6928686b2f2937f81b30bc40fc32dfd5b |     
   xtensa    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/eb059191f9773c01308c36b498a547d2c1c1663f |     
 microblaze  |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/d475947b488dd1e30ad9561231978d112be17a76 |     
   armeb     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/a11bc83d74df3473d1c6ccd24429d0a2eb4238b2 |     
 microblaze  |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/35d7afb8955b19612ab2a8736ff58e50dac1a9b6 |     
microblazeel |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/5d1fcb9c9e93579fb08764b322b8c4152c3b5300 |     
    i686     |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/cfc06aafc028eac3cb637a72fd664d205842d07f |     
   mips64    |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/619c8d59ea11f0ceb846d8b932af6a395160a9b3 |     
  aarch64    |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/0f565b1833cefad941d1d7ffa7c8000470676efd |     
   mips64    |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/aaa7130d54a0178f4f186c8f3a50fcd0a911642e |     
  mips64el   |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/952ac0c0a80e736bcf8b79149004b8f7c9cf0d76 |     
  mips64el   |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/e3e213380992446dcfef41e6a8097194ac0ff633 |     
  mips64el   |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/2e02a6919f5a15c258fb4a64839108664a4a556f |     
  mips64el   |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/407265afa44f6548041582388d17e884e5aae34d |     
  mips64el   |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/26ba86e51788bbbedcc24aa9b7a47d84e7ec948d |     
    i686     |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/569c42fbe8744ad35a25768895363270adf917aa |     
   mips64    |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/048e94b40260c980faf1ce464a3a8a6169ccdee3 |     
  mips64el   |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/76bdc551030b9803726e8b45a3690d8ad1467c4b |     
    i686     |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/97936321f53591de6273cf0304b260c7d6e5c761 |     
   xtensa    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/c2a20b197b6485b982ebe9be06ce4172438283da |     
   armeb     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/468e45d27b8adf733617dc29965cb2e008a2f67f |     
   nios2     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/fc4d50007fd547fefe723c82175ec15f1152c345 |     
    sh4      |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/b4741458c18f51ffef3fff3ca11e37a55c5ab89e |     
powerpc64le  |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/41045041004ddd2586f375572359a6bdcfe0c74d |     
    mips     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/65228218d2ae284cfd7892615885966e415f1a20 |     
   s390x     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/0cf4d35c6f05ea7a8ca8e6f34986d2f0099514d5 |     
  aarch64    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/f73933812cf9dbab116b26b4716f9dd85b637ec3 |     
    arc      |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/2cd0e0ca04af1d855c2750eccf3000f5d06ef00f |     
  aarch64    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/092675dbe9adb2a0cbeea0d7d385203056f71a13 |     
  riscv32    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/5617cbd6451ab00ad39fefc7cadfd9df66e34d44 |     
   s390x     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/9674b4e565e5876f6db4ee981225c729e640ca79 |     
  sparc64    |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/2a22bb3ef927b233bae1a6a5eab30c94de52526c |     
   x86_64    |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/c1baa6de060a0f10f837395961d2c1e251dc357e |     
    mips     |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/8c54ece4a455ed34e523d6adb0b708294c37729f |     
  powerpc    |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/e9dd5b6f333a9ed5f27986f2e22d99fb165716d7 |     
    mips     |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/bf5aadd555d0a9478b3fe530137da0f5db5b3b89 |     
    i486     | kvmtool-f77d646ba01d04be5aa... | NOK | http://autobuild.buildroot.net/results/fe48a8792172a3cf00c67fddf90e674ce151435b |     
  riscv64    |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/67d26f19cd326d890ce0479b7a93d22c781beeb3 |     
 microblaze  |        libdeflate-1.12         | NOK | http://autobuild.buildroot.net/results/85118d558bd3a7f2016f01a905527fdf9ff0c59e |     
  aarch64    |        libdeflate-1.12         | NOK | http://autobuild.buildroot.net/results/86a41579a30ffc1786e84244d870170ece5d83c3 |     
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/be0cf6df978a526e8f3a573ce69e93a59e8cf117 | ORPH
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/718117fe4f8da1580be4e1f166b40bdda7f51c26 | ORPH
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/8065e3060acfbe13b99848eb4fce873b296d0c12 | ORPH
    or1k     |         libgeos-3.11.0         | NOK | http://autobuild.buildroot.net/results/01ccdea10a151189179818ac6b29a1ab2bdc4b9f |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/6a7dca98a28f455ab16ccbb19d861d3de756f306 |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/6279b01cf0da3692b8eaf19bb643e576c604e81e |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/c6dfa6030e68f742b8734b247fae4e5dcd64d2f0 |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/a681ebc0041687eb1697a9e2dae7695ae17583e3 |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/713f025197fdfdd9457bb2848a4fa4d123745a9c |     
  aarch64    |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/74fd958c4b9b16ee69a828569ab7914755057788 | ORPH
 aarch64_be  |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/9930d295f771daaee68d636ef40d29cb000a5044 | ORPH
 microblaze  |         libkcapi-1.4.0         | NOK | http://autobuild.buildroot.net/results/f4f02c420cd61281b911a92d62adbf5488fa3b5c |     
 microblaze  |         libkcapi-1.4.0         | NOK | http://autobuild.buildroot.net/results/7bbd3f62ecfbace0fcb29adf6826197a45e66ca7 |     
    or1k     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/b3770d4845f418c4b560d338c78d28947c6cbc87 |     
    arm      |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/0a55a40e29646b01c7d4379d509321a1184191eb |     
powerpc64le  |       libopenssl-1.1.1q        | NOK | http://autobuild.buildroot.net/results/e56b690b7fa4e177211a396ad662d907979d8060 |     
  powerpc    |        libvorbis-1.3.7         | NOK | http://autobuild.buildroot.net/results/d9da04a5a3b0f11c0bffd3a2f0b520b668aa749b |     
   xtensa    |         libxml2-2.10.3         | NOK | http://autobuild.buildroot.net/results/33d8ed07f75f3671040b5a8611b30ef4d437cca3 |     
    m68k     |      linux-5.10.145-cip17      | NOK | http://autobuild.buildroot.net/results/2dfb34f7c7c237b6fd7cfad8bf0239d1d9ca9b4c | ORPH
   mipsel    |      linux-5.10.145-cip17      | NOK | http://autobuild.buildroot.net/results/836d256533097d297dc14b6574aafad4f7136086 | ORPH
   mips64    |    linux-5.10.145-cip17-rt7    | NOK | http://autobuild.buildroot.net/results/4e29332d16c64e68629fc6c44d0b1dde7323d951 | ORPH
   x86_64    |          linux-6.0.9           | NOK | http://autobuild.buildroot.net/results/ebd24c2b518201d48e7ac6760ca65ef2237b03d3 | ORPH
   arceb     |          linux-6.0.9           | NOK | http://autobuild.buildroot.net/results/c9a5f1e967a4506b6cd2a863c43557d369a98500 | ORPH
    m68k     |          linux-6.0.9           | NOK | http://autobuild.buildroot.net/results/c7a0c03043fc6e4d6ddf3703ae7aa2004522709e | ORPH
  mips64el   |          linux-6.0.9           | NOK | http://autobuild.buildroot.net/results/e3b3ec2f4b333e692ef74bc326bee9aef4645bd0 | ORPH
   mips64    |          linux-6.0.9           | NOK | http://autobuild.buildroot.net/results/57cb8259ff63ee48c20ff5c06db408500c1b7f64 | ORPH
   s390x     |          linux-6.0.9           | NOK | http://autobuild.buildroot.net/results/b97abd9036138b63bde089fc686200aa892b5c06 | ORPH
   armeb     |          linux-6.0.9           | NOK | http://autobuild.buildroot.net/results/c30861c38c91c4c12a3cefa93f86679d33b3de08 | ORPH
    i486     |          linux-6.0.9           | NOK | http://autobuild.buildroot.net/results/b4c12298311b1b78d0979a49a6bc545055dbbb39 | ORPH
   nios2     |          linux-6.0.9           | NOK | http://autobuild.buildroot.net/results/c790afeafc8f4bf5108b7ec120cddcc52c6833cb | ORPH
  sparc64    |         linuxptp-3.1.1         | NOK | http://autobuild.buildroot.net/results/d83b5b322fa4053e0419cf8413eb354d7b3de0e5 |     
powerpc64le  |         linuxptp-3.1.1         | NOK | http://autobuild.buildroot.net/results/6cf5f76013414d6214d3ee864b55dc25b7c5962a |     
powerpc64le  |       lirc-tools-0.10.2        | NOK | http://autobuild.buildroot.net/results/2ec3f8d434fe54759eef813b17fddb8d9010937f | ORPH
    arm      |       lirc-tools-0.10.2        | NOK | http://autobuild.buildroot.net/results/3bac2a016504a35a39a2c8b2e5af93454d6ce748 | ORPH
  aarch64    |       lirc-tools-0.10.2        | NOK | http://autobuild.buildroot.net/results/4f5a5a302d50455d59b2058c5fd7ff4e5ab693e8 | ORPH
 aarch64_be  |       lirc-tools-0.10.2        | NOK | http://autobuild.buildroot.net/results/17289ff20e93ee743e49303f17c11075f1ce9406 | ORPH
   nios2     |       lirc-tools-0.10.2        | NOK | http://autobuild.buildroot.net/results/72e3f3d696462874ee4901adeac726a2f33f32b1 | ORPH
 aarch64_be  |       lirc-tools-0.10.2        | NOK | http://autobuild.buildroot.net/results/b03cd62f7272cd150be7997baf59133e1c9560ed | ORPH
  sparc64    |       lirc-tools-0.10.2        | NOK | http://autobuild.buildroot.net/results/5e09e52eec29159bae81ddb1a4d03f9ecb7839d8 | ORPH
 aarch64_be  |     ltp-testsuite-20220930     | NOK | http://autobuild.buildroot.net/results/885e355defa3dcaaca7f092e4db7fbf7136c6a24 |     
 powerpc64   |      lttng-modules-2.13.1      | NOK | http://autobuild.buildroot.net/results/a1fc510237e286aef8e5bcf64c57612232cd0efd |     
powerpc64le  |      lttng-modules-2.13.1      | NOK | http://autobuild.buildroot.net/results/ed73ec765e2f6dddb60333ffd5494e24b433491b |     
   mipsel    |           lxc-5.0.1            | NOK | http://autobuild.buildroot.net/results/0bdf542e7c5b0e449b300b81d44017ea84ff0b23 |     
   mipsel    |           lxc-5.0.1            | NOK | http://autobuild.buildroot.net/results/b3be6a91453918dcb907dc2e51f5c4ec0926fd5b |     
 powerpc64   |           lxc-5.0.1            | NOK | http://autobuild.buildroot.net/results/a4055218574e67eaaf351ae4fb94e4bbde130aa7 |     
   nios2     |          matio-1.5.23          | NOK | http://autobuild.buildroot.net/results/8984819ee06ba43fffd0542ad0d05e1ebaeaa4cf |     
 aarch64_be  |        memcached-1.6.16        | NOK | http://autobuild.buildroot.net/results/5601961ee91a557ed745f98fcc8a8cae287923fe | ORPH
    mips     |        memcached-1.6.16        | NOK | http://autobuild.buildroot.net/results/9a80f57e83730c5a064b65002b5b91874893eefc | ORPH
    mips     |        memcached-1.6.16        | NOK | http://autobuild.buildroot.net/results/fccfa8a82399bede8a2ebea38029f5bf43180f82 | ORPH
  mips64el   |        memcached-1.6.16        | NOK | http://autobuild.buildroot.net/results/04cd9838bf53412c9caf14ea88a175c35fddc665 | ORPH
   sparc     |        memcached-1.6.16        | NOK | http://autobuild.buildroot.net/results/2a8a933e33ee2d6b40af6686cea40dccac528713 | ORPH
    or1k     |        mosquitto-2.0.15        | NOK | http://autobuild.buildroot.net/results/a5b60c8dd9affab5ebf5faded01b4258b819ed9b |     
    or1k     |        mosquitto-2.0.15        | NOK | http://autobuild.buildroot.net/results/1562c09a49907155bb0cb4bf6f152c0572416a04 |     
 microblaze  |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/b70d6697b489066defb8cb3ec2b169d6bd64c08e |     
    or1k     |           mtd-2.1.5            | NOK | http://autobuild.buildroot.net/results/44a1fa3b37436553ea5c39285a390bf1cc34ed16 |     
  powerpc    |           musl-1.2.3           | NOK | http://autobuild.buildroot.net/results/1ae5b04fe9724c1ea414b6fed18adba73842bd19 |     
    arm      |     mxs-bootlets-10.12.01      | NOK | http://autobuild.buildroot.net/results/75bb03fa9d4a66337372c5cfce367803f5a0c9b6 | ORPH
    or1k     |         netdata-1.33.1         | NOK | http://autobuild.buildroot.net/results/51f27a41b834875c0b466312f538b751abfce46d |     
   x86_64    |          netsurf-3.10          | NOK | http://autobuild.buildroot.net/results/edb42443074c865f005240ae0fa57e5575f72141 |     
    or1k     |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/c4dea1bfbfb74324d89b1fa3d6c7ddefe35d1252 | ORPH
    m68k     |         openssh-9.1p1          | NOK | http://autobuild.buildroot.net/results/9ef53d649d48d8ac92bb82f167a9b5955b50f17f | ORPH
  aarch64    |  openvmtools-11.3.5-18557794   | NOK | http://autobuild.buildroot.net/results/82057847d999103cdcd830cffaf12c84be33cf32 |     
   armeb     |           opus-1.3.1           | NOK | http://autobuild.buildroot.net/results/e237fa8583c1d10445c00024f2d4f148dd973c4a | ORPH
   sparc     |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/f66925bc0774d525b7270e780c461f02e713347b |     
   mips64    |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/c6019df24fe85c834522ad4b329577e6768096a4 |     
    or1k     |           php-8.1.12           | NOK | http://autobuild.buildroot.net/results/2f3a37e378829e4856f78a57af9f63f3388d8777 |     
    or1k     |      proxychains-ng-4.16       | NOK | http://autobuild.buildroot.net/results/5fbfe68639b451ae2250cc64ffb4be7c48fa91c3 | ORPH
   mipsel    |   python-cryptography-38.0.1   | NOK | http://autobuild.buildroot.net/results/a4d260ed9a06cf321bb219d817f1dd291d95bacd |     
   armeb     |   python-cryptography-38.0.1   | NOK | http://autobuild.buildroot.net/results/e691f0470db7275824b17772714449431eeb6202 |     
powerpc64le  |  python-greenlet-1.1.3.post0   | NOK | http://autobuild.buildroot.net/results/caaa9845fd3c75ad67decb1441dbf480a7dfd1f4 |     
  aarch64    |      python-numpy-1.23.4       | NOK | http://autobuild.buildroot.net/results/329ddd661343bed11edb3794452b1101c8a3117f |     
   mipsel    |      python-numpy-1.23.4       | NOK | http://autobuild.buildroot.net/results/eb49dfb42660e239b7773f32c4eec3c7d3278fae |     
 powerpc64   |      python-numpy-1.23.4       | NOK | http://autobuild.buildroot.net/results/1e607ed0922bff0b29ec8216178d020454d90397 |     
 powerpc64   |      python-numpy-1.23.4       | NOK | http://autobuild.buildroot.net/results/6c5af2cf10399fb7e296d5320a17b65abb87de9d |     
   mipsel    |      python-numpy-1.23.4       | NOK | http://autobuild.buildroot.net/results/1159d8cdc0ddcc17aa9d4fa08f708119d426ba8a |     
   mipsel    |      python-numpy-1.23.4       | NOK | http://autobuild.buildroot.net/results/5e3a854aa80f0813e79a1600d42c02ee34683ba8 |     
    i686     |      python-numpy-1.23.4       | NOK | http://autobuild.buildroot.net/results/85a9a91eef7cef6e13033a56caba2a8aa80de9dd |     
microblazeel |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/61c7de81c551d1fbfe4ea0c79f766c56eecfd15d |     
    arm      |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/785dd4bab99e9ca5bc48661ae2efe14a9b893da7 |     
   sparc     | rtl8192eu-1e15b6d451731bc4d... | NOK | http://autobuild.buildroot.net/results/13a809570423ead33628663033db4c3c4001a79b |     
   sh4eb     |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/b2ee246767308d1d77a4e82b0190a391625895ef | ORPH
   s390x     |         systemd-250.8          | NOK | http://autobuild.buildroot.net/results/6d9e850cdeb0e0e508488a1fbfe0c281982d2084 |     
    mips     |         tealdeer-1.6.1         | NOK | http://autobuild.buildroot.net/results/ff5f5e5da5518994c3e7f930c989386dfa1f61bd |     
   mipsel    |         tealdeer-1.6.1         | NOK | http://autobuild.buildroot.net/results/f1e4bda764ec33fcc4084f4e89b589acfaff1215 |     
powerpc64le  |         tealdeer-1.6.1         | NOK | http://autobuild.buildroot.net/results/46e4be3d2155dedba4b012c952ae226fac6f84be |     
    mips     | toolchain-external-codescap... | NOK | http://autobuild.buildroot.net/results/9cd494fee805e1d4079019408a54e17a59d77940 | ORPH
   armeb     |        traceroute-2.1.0        | NOK | http://autobuild.buildroot.net/results/dfb3caf115e97c7306215254180a1e132bba99dd |     
microblazeel |        traceroute-2.1.0        | NOK | http://autobuild.buildroot.net/results/bb5ec44bb6edd8f4ac25729bb1d9cc951b8670d0 |     
    or1k     |        traceroute-2.1.0        | NOK | http://autobuild.buildroot.net/results/20fb13817953497dfdc36d49d849aff01b8c23ae |     
   x86_64    |       uccp420wlan-6.9.1        | NOK | http://autobuild.buildroot.net/results/33ab5dfb4ad9adcf23019298569145f066de09dc | ORPH
   s390x     | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/693d87ca5e4a9e40715cc5223f2bb31f7eb8e89a |     
    i686     | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/7e836031bb59c6be81b97e378a2591dfbcfa678f |     
   mipsel    | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/287a4d6675bd4feff3bfbd3e2133d49549a4b907 |     
   sh4eb     |            unknown             | NOK | http://autobuild.buildroot.net/results/5fa651b87d238e96a58be30db6afe0faa4426d2f |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/6ef3b55c8155308cc73f2a3d3ec660bf8c6d83ed |     
 microblaze  |            unknown             | NOK | http://autobuild.buildroot.net/results/fda16ca34cea146168c1e91409bfef566b0cdda3 |     
    sh4      |            unknown             | NOK | http://autobuild.buildroot.net/results/ba2f82234570cb5196e545b56f8d310173dbdcfc |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/96b6307d4218488ac531c784d5325164e47c8e4e |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/831c4b40a1e465384815d27f841caf21c38551e8 |     
 powerpc64   |            unknown             | NOK | http://autobuild.buildroot.net/results/37aeb56b90074dcaf6a887a78b13ff76b503d475 |     
 powerpc64   |      v4l2loopback-0.12.7       | NOK | http://autobuild.buildroot.net/results/db0bc8db6f0c9c07ded02c1963b07d5727756132 |     
  mips64el   |         wolfssl-5.5.3          | NOK | http://autobuild.buildroot.net/results/34f5d634a3b0191264d61ff8f6039006621b8d51 |     
   s390x     |         wtfutil-0.41.0         | NOK | http://autobuild.buildroot.net/results/e9f218fcbfa89e7786e156ada5ab74c49330fa08 |     
  mips64el   |         wtfutil-0.41.0         | NOK | http://autobuild.buildroot.net/results/c5ce5f16f0f5a600359520f07a89a3de8dcd5fd4 |     
    arm      |         wtfutil-0.41.0         | NOK | http://autobuild.buildroot.net/results/fca8a752dbe4f26596fb7f9290e800292527bbfa |     
  mips64el   |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/1f87aa41c2a32911494184760f09a62d04c28173 |     
   mips64    |        xfsprogs-5.14.2         | NOK | http://autobuild.buildroot.net/results/3a0af4f1df994360399c9f22650551f00e5d0d35 | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/5639c886681505ad632ca960aecd0dad527567b0 | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/6e841c5240fe8b8f04662e9e7675993e178a405f | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/ddd73b0a0d2a0c0915b417499f641946a1879588 | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/2ef54b3ee46a2f052f31c73f0cf2c5e6355e9f64 | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/1c3bf0728ba9073d9f7c4314fbfab4e4876112a4 | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/edd0cf736dc0121e639374c101314478e1b178fc | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/9cbac311b61258033b42126cf6ffb0fe3d0d9c5e | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/0b67e455e906e1dc7ebbdf143df06dc792e75086 | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/f53b2d71ab78763d64be906507c2e3c19d942776 | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/eca14f0bde84197a5b2f4bb976e0bc2fccd5e58b | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/dfa96fcfd9a54a25dc7a4ea25b61bd0ced5c2e54 | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/11c54a0aece99d781660e0cc890d71c757bd3c37 | ORPH
   s390x     |          zabbix-5.4.9          | NOK | http://autobuild.buildroot.net/results/c4bb969f8edfcfa857caa3d631312fa2f3603696 |     
microblazeel |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/edff2f7b284bae5078583b60362e5ba3d559324f |     
powerpc64le  |       zynaddsubfx-3.0.6        | NOK | http://autobuild.buildroot.net/results/a942af3028234513dd8125d62ec286d7fb571e6f |     


Classification of failures by reason for next
---------------------------------------------

                   aubio-0.4.9 | 5 
glibc-2.36-66-ga1dc0be03c9d... | 3 
          imagemagick-7.1.0-51 | 3 
              host-rust-1.65.0 | 2 
                libkcapi-1.4.0 | 2 
                      crun-1.5 | 1 
              docopt-cpp-0.6.3 | 1 
                gerbera-1.10.0 | 1 
            host-binutils-2.38 | 1 
                host-go-1.19.3 | 1 
              host-pahole-1.24 | 1 
    host-python-greenlet-2.0.0 | 1 
host-spirv-llvm-translator-... | 1 
                libdnet-1.16.1 | 1 
      linux-5.10.145-cip17-rt7 | 1 
                   linux-6.0.1 | 1 
                numactl-2.0.16 | 1 
            python-bunch-1.0.1 | 1 
         s6-linux-init-1.0.6.3 | 1 
                       unknown | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 powerpc64   |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/afff395f679deae83dfcc3d6fdbdb4ac3f92effd |     
   nios2     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/26dbba7224b74f1e7601f1623bf6df8714f14fd8 |     
    sh4      |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/4b6a7e3ffd11506ede911910bf2627e27b447c0d |     
   x86_64    |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/dad13621bb7f84fbc6da0618ed9b0673c04c9c4b |     
  aarch64    |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/fe45ab5d56f6d146211c134163635c432971db9e |     
  riscv64    |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/5154e48bef1ee8809918f4870c9477ce8713c1f3 |     
 microblaze  |        docopt-cpp-0.6.3        | NOK | http://autobuild.buildroot.net/results/fe29e02d582d1958855d7873b7d9c179678abc85 |     
  sparc64    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/1df37951332e507e9be35f26e297b7ebf767c17d |     
   mipsel    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/aae6f3daca96f633853d8c52a3f1a5edf8d4b175 |     
powerpc64le  | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/4036792256b264d7d2cf0eac2b07e6cc0454baf4 |     
    mips     | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/948d30e9071d3691d7a24fde6e76d2bb5be709f2 |     
   x86_64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/10e28b7f27b7037e707cea785b567f679d5eb00d |     
   mips64    |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/b6d5305da84ea712f51e32490eab3225efd17df7 |     
    or1k     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/b9c7b957e768d3e8499564bc9812a053d6540fae |     
   mips64    |   host-python-greenlet-2.0.0   | NOK | http://autobuild.buildroot.net/results/e237cd6395591ec3c6925918e0c902a8dfd29a3a |     
   armeb     |        host-rust-1.65.0        | NOK | http://autobuild.buildroot.net/results/87053b3a6dce935bd95305e20438d9375412b985 |     
powerpc64le  |        host-rust-1.65.0        | NOK | http://autobuild.buildroot.net/results/9493554792077735d075d7f7f0ca4a07bcffbd07 |     
    arm      | host-spirv-llvm-translator-... | NOK | http://autobuild.buildroot.net/results/ce9ccef1806867aa54c51f466f0985f4071592d9 | ORPH
  mips64el   |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/58960a656c464c982088fb8cca60c169e014d010 | ORPH
   arceb     |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/1dcd6c2df0151ae6728255527b2bcab34f07971f | ORPH
 aarch64_be  |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/e4be7da7620ad617497b9f3332389b9938f2e999 | ORPH
   sh4aeb    |         libdnet-1.16.1         | NOK | http://autobuild.buildroot.net/results/3b5f1d27fea03433f79e996a66140d4c439dad68 | ORPH
   xtensa    |         libkcapi-1.4.0         | NOK | http://autobuild.buildroot.net/results/2a961834ad898ab91d2e72e537f552825c355a3e |     
   xtensa    |         libkcapi-1.4.0         | NOK | http://autobuild.buildroot.net/results/f53307d7430abd930f50ed747b33d05bded4b0cf |     
 microblaze  |    linux-5.10.145-cip17-rt7    | NOK | http://autobuild.buildroot.net/results/d9e5560f2b9b83655868116a6c6aaca77d6b497a | ORPH
   mips64    |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/0ef9733e948bd6e6e94f8f20e807efc9acdcedda | ORPH
  riscv32    |         numactl-2.0.16         | NOK | http://autobuild.buildroot.net/results/12554af043435630bb185c7d2a423c2debb32b73 |     
    arm      |       python-bunch-1.0.1       | NOK | http://autobuild.buildroot.net/results/d6eb8d76c2cdc44cccb73dc35c1bf266c590054d |     
    arc      |     s6-linux-init-1.0.6.3      | NOK | http://autobuild.buildroot.net/results/05eab5955b479f8d6ab8bffb7a141b5ffac2e90d |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/7307b5afe5b6b6fc9d077e462e8e211b64e7277c |     


Classification of failures by reason for 2022.02.x
--------------------------------------------------

            igd2-for-linux-2.1 | 1 


Detail of failures for 2022.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mipsel    |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/9ea96af2a37b10046b908088ba0ccff69991ea0f |     


Classification of failures by reason for 2022.08.x
--------------------------------------------------

              host-rust-1.62.0 | 2 
            igd2-for-linux-2.1 | 2 
                 pixman-0.42.2 | 2 
                 uclibc-1.0.42 | 2 
                xenomai-3.0.10 | 2 
                 dash-0.5.11.5 | 1 
              dieharder-3.31.1 | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
glibc-2.35-134-gb6aade18a7e... | 1 
                host-go-1.18.8 | 1 
host-pahole-73383b3a39afe86... | 1 
            igh-ethercat-1.5.2 | 1 
                    sdl-1.2.15 | 1 
                tinifier-3.4.0 | 1 
                wtfutil-0.41.0 | 1 


Detail of failures for 2022.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/e62cb0d448e358f5a8549dc2984f2faa9bff990c | ORPH
 microblaze  |        dieharder-3.31.1        | NOK | http://autobuild.buildroot.net/results/0c805610198d1b449949c26baee64cf6b2f07434 |     
   nios2     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/7acfbff3be044fcf5dc1dd1ef632e054e98a9d39 |     
    mips     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/31734642cc295975333f72281e6cf12f7b9bde2b |     
   sh4aeb    | glibc-2.35-134-gb6aade18a7e... | NOK | http://autobuild.buildroot.net/results/fd81b09e424ea3f819556a22bd24f84b8003ae30 |     
  aarch64    |         host-go-1.18.8         | NOK | http://autobuild.buildroot.net/results/7a75226e330a7d75fa7dd8e8a95a9faf2207de4e |     
   arceb     | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/dcfc748b2170fa337b46050fc046ef9b9985e87f |     
  powerpc    |        host-rust-1.62.0        | NOK | http://autobuild.buildroot.net/results/f011dcd7b779339e00b44dc96319e2d95a4d16b4 |     
  aarch64    |        host-rust-1.62.0        | NOK | http://autobuild.buildroot.net/results/8766e31b7cf05fc686b5ce5abe5d29efba54ebfc |     
    sh4      |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/881ba3ad5e6d71f4e54064591125c3b15ec5efbf |     
   nios2     |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/98717f9c2540e78d77b7c9697ec2965e262a9a2b |     
  sparc64    |       igh-ethercat-1.5.2       | NOK | http://autobuild.buildroot.net/results/5a2842cfcacfc5e4699da0a1d50d4a3757a60d0d |     
powerpc64le  |         pixman-0.42.2          | NOK | http://autobuild.buildroot.net/results/f78b818f8c413b8440fd09abd74c58d9872595f4 |     
powerpc64le  |         pixman-0.42.2          | NOK | http://autobuild.buildroot.net/results/702f60a2b1a32d4873f7a241a38f18571f18b253 |     
    sh4a     |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/2bf6be15d2f1770c2348ccae25cb6753faa4d1bd | ORPH
   s390x     |         tinifier-3.4.0         | NOK | http://autobuild.buildroot.net/results/f9cc7ae6e96d01923d9fff8214805cfee6560a55 |     
  powerpc    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/d33a384ea375937cc3f3645a02a7cffb7400c85d |     
  powerpc    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/d73b60eb1c3675bdaa56f00d9fa83a586e18baa8 |     
   x86_64    |         wtfutil-0.41.0         | NOK | http://autobuild.buildroot.net/results/705170d33c69faa1e050c7db82fde0abf2e854e5 |     
   nios2     |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/b24cdf64fd57b10e2fe99bd424c1a1bbf5ece65a |     
microblazeel |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/9928f2e709d3e029fdfa96f19976844f9312cda9 |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
