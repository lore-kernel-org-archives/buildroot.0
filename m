Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D234C61DA4
	for <buildroot@archiver.kernel.org>; Thu,  9 Feb 2023 06:49:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B511240166;
	Thu,  9 Feb 2023 06:49:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B511240166
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0o0zJjJYHrzp; Thu,  9 Feb 2023 06:49:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9A99040393;
	Thu,  9 Feb 2023 06:49:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9A99040393
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 267291BF852
 for <buildroot@lists.busybox.net>; Thu,  9 Feb 2023 06:49:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EAB9F405E7
 for <buildroot@lists.busybox.net>; Thu,  9 Feb 2023 06:49:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EAB9F405E7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qGdh_PYBQ7Py for <buildroot@lists.busybox.net>;
 Thu,  9 Feb 2023 06:49:20 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9546F4033C
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9546F4033C
 for <buildroot@buildroot.org>; Thu,  9 Feb 2023 06:49:19 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id C818924000C
 for <buildroot@buildroot.org>; Thu,  9 Feb 2023 06:49:16 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Thu, 09 Feb 2023 06:49:16 -0000
Message-Id: <20230209064923.EAB9F405E7@smtp4.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1675925356; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=0vcW1fIL6MJOKnLZtCw+Y03dOuWDgGBAxDJdXr0yEq4=;
 b=Ub74J/pyF3fIM9xFgEljXaRT9pNJuzdCteSOcZ03nVbrYCf04ylC0NVqYwgrOVAZkLD1Z8
 3m2GXvajQGNgB7F5XyGKuYEbJiRAZdNbzn3xjhRZkcw0nU/hCWU+JiNSiNFY2DCxfR4z28
 slZfIK7XllgId/jjS/gO7mGFjlfQ9sMaN+dD4f+9fn5IXrUyY4Wi0kqpd7P40Cbgky4dAW
 LJKfLoyq8cghSP/PMcm+9VTZVLqjbfJZzGS0jtBgmmXim5F6PK/PVfbuOg8B7MNCpt5D4c
 ITompOKdxpLUS1DzhXS0MHDO+D3ZfM0yX7mO4GQoUGu2aV58UykF9Mh6qvOtJA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Ub74J/py
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-02-08
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

Autobuild statistics for 2023-02-08
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  |  0  |  4  |  0  |  4  |
  2022.11.x  | 22  | 17  |  0  | 39  |
    master   | 171 | 226 |  2  | 399 |

Classification of failures by reason for master
-----------------------------------------------

              host-rust-1.67.0 | 13
                host-go-1.19.5 | 10
              host-pahole-1.24 | 10
            host-binutils-2.38 | 9 
                       unknown | 8 
  gobject-introspection-1.72.0 | 7 
                host-xz-5.2.10 | 7 
                libsolv-0.7.22 | 7 
                elfutils-0.186 | 6 
                   perl-5.36.0 | 6 
                  jack2-1.9.21 | 5 
                    norm-1.5.8 | 5 
                busybox-1.36.0 | 4 
            host-binutils-2.37 | 4 
            ocf-linux-20171122 | 4 
                  zabbix-5.4.9 | 4 
         host-libarchive-3.6.2 | 3 
         host-sentry-cli-2.8.0 | 3 
                   linux-6.1.9 | 3 
                  netsurf-3.10 | 3 
    python-cryptography-39.0.0 | 3 
                     efivar-38 | 2 
                    fwup-1.9.1 | 2 
                gerbera-1.10.0 | 2 
glibc-2.36-81-g4f4d7a13edfd... | 2 
         gobject-introspection | 2 
                  kexec-2.0.25 | 2 
          libcamera-apps-1.1.1 | 2 
             libgpg-error-1.46 | 2 
     linux-5.10.162-cip24-rt10 | 2 
             lirc-tools-0.10.2 | 2 
          lttng-modules-2.13.7 | 2 
                    mutt-2.2.9 | 2 
                opencv3-3.4.17 | 2 
              php-xdebug-3.0.4 | 2 
           proxychains-ng-4.16 | 2 
           python-bcrypt-4.0.1 | 2 
           python-numpy-1.23.5 | 2 
            quickjs-2021-03-27 | 2 
                 systemd-252.4 | 2 
                 uclibc-1.0.42 | 2 
                 wolfssl-5.5.3 | 2 
                     xz-5.2.10 | 2 
                     ace-7.0.6 | 1 
android-tools-4.2.2+git2013... | 1 
                    apg-2.3.0b | 1 
                  assimp-5.2.5 | 1 
                 avro-c-1.11.1 | 1 
             batman-adv-2022.3 | 1 
                   bullet-3.21 | 1 
             containerd-1.6.16 | 1 
                 dmalloc-5.6.5 | 1 
        edk2-edk2-stable202208 | 1 
                   eigen-3.4.0 | 1 
                  ffmpeg-4.4.3 | 1 
               fftw-quad-3.3.8 | 1 
                    flac-1.4.2 | 1 
             fontconfig-2.13.1 | 1 
fs/cramfs/cramfs.mk:46: /tm... | 1 
fs/ubi/ubi.mk:51: /tmp/inst... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /tmp/... | 1 
                    gdal-3.5.2 | 1 
                     gmp-6.2.1 | 1 
            host-binutils-2.39 | 1 
         host-gcc-final-12.2.0 | 1 
    host-python-maturin-0.14.9 | 1 
              hyperfine-1.14.0 | 1 
kvmtool-f77d646ba01d04be5aa... | 1 
                 lapack-3.10.1 | 1 
      libabseil-cpp-20220623.1 | 1 
               libconfig-1.7.3 | 1 
           libfreeimage-3.18.0 | 1 
               libglib2-2.72.3 | 1 
               libsigsegv-2.14 | 1 
               libvorbis-1.3.7 | 1 
          linux-5.10.162-cip24 | 1 
        ltp-testsuite-20220930 | 1 
        lttng-babeltrace-1.5.7 | 1 
                    mpv-0.33.1 | 1 
                  ntpsec-1_2_2 | 1 
                     nut-2.8.0 | 1 
              open-iscsi-2.1.8 | 1 
           optee-client-3.19.0 | 1 
package/multipath-tools/mul... | 1 
              pcm-tools-202110 | 1 
                   pcre2-10.42 | 1 
                    pixz-1.0.7 | 1 
                     pv-1.6.20 | 1 
                rdma-core-44.0 | 1 
        s6-linux-utils-2.6.0.0 | 1 
                    sdl-1.2.15 | 1 
toolchain-external-codescap... | 1 
             uccp420wlan-6.9.1 | 1 
           v4l2loopback-0.12.7 | 1 
wireguard-linux-compat-1.0.... | 1 
                wtfutil-0.41.0 | 1 
                xenomai-3.0.10 | 1 
                    zeek-4.1.1 | 1 
                     znc-1.8.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   s390x     |           ace-7.0.6            | NOK | http://autobuild.buildroot.net/results/115534e17b6ababe63a68cd65762f992c0677113 |     
powerpc64le  | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/ebc5cb47021a01fa4a51ebc650fc78d6901fcd4f |     
powerpc64le  |           apg-2.3.0b           | NOK | http://autobuild.buildroot.net/results/8dd83a9bc0f73c998f8741730b3e6633cb44bcad |     
    mips     |          assimp-5.2.5          | NOK | http://autobuild.buildroot.net/results/48c1a821b00df3e048085aa01917cf0fda0ae261 | ORPH
    arm      |         avro-c-1.11.1          | NOK | http://autobuild.buildroot.net/results/d07d867d88096c25bb8eae0dfbc1c1544613252f |     
    mips     |       batman-adv-2022.3        | NOK | http://autobuild.buildroot.net/results/b3ac57369e265d62b17ef68db9623b4a6f8ea157 |     
    or1k     |          bullet-3.21           | NOK | http://autobuild.buildroot.net/results/d670ad272a702ff2f6aef0c19498f88ad41851f0 |     
    mips     |         busybox-1.36.0         | NOK | http://autobuild.buildroot.net/results/9a4b4df9b486e296366e56c81dc24c4101fea66b | ORPH
   mipsel    |         busybox-1.36.0         | NOK | http://autobuild.buildroot.net/results/16bd8e98ed270c3389f3ebded4d0c9c80b11dfb6 | ORPH
  mips64el   |         busybox-1.36.0         | NOK | http://autobuild.buildroot.net/results/754fe2560baf18ef5aaf4a184c7ea9b8d09403bb | ORPH
  mips64el   |         busybox-1.36.0         | NOK | http://autobuild.buildroot.net/results/e12609ddf5a179c0f0d95797fbb7ba9dff260b4d | ORPH
  aarch64    |       containerd-1.6.16        | NOK | http://autobuild.buildroot.net/results/172606f296f79c26737b686339ab459d4fc4b362 |     
  powerpc    |         dmalloc-5.6.5          | NOK | http://autobuild.buildroot.net/results/b3795ccfb9d39bb64d09d27d7bcd6ba897cb7d3c | ORPH
   x86_64    |     edk2-edk2-stable202208     | NOK | http://autobuild.buildroot.net/results/edf0e7b166060449d8abe945ba0cd5b6d2a0aa7d |     
  aarch64    |           efivar-38            | NOK | http://autobuild.buildroot.net/results/da1b5fb23977ca409ffbea2608fd07ddab6e0353 |     
  mips64el   |           efivar-38            | NOK | http://autobuild.buildroot.net/results/b763ee1ce4377daa024c23aaca1952e319ef3d96 |     
  riscv64    |          eigen-3.4.0           | NOK | http://autobuild.buildroot.net/results/c9ca19c3b8aee9b039e033295f4c0f0ef717b85c |     
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/942cee41a1b13734e4ca02332e3a1e0922142619 | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/3a93149edbfa250fcf161cb322c50b1fc3d8adf4 | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/d087b29237c66142285af7b6bcbcb9b27d6751db | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/538888f10abc0e24103016abda1c4556af2c28f6 | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/ec38bf0683539ef156a5e6bb7b456696e47de86f | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/6e4ca63d463524e4bee3b465dcd00131fbfdf42d | ORPH
  aarch64    |          ffmpeg-4.4.3          | NOK | http://autobuild.buildroot.net/results/59d05def41be11712a9a27ebac6dda90d5b62399 |     
powerpc64le  |        fftw-quad-3.3.8         | NOK | http://autobuild.buildroot.net/results/c4e89efd985e286e028da0d93aed42e363394663 | ORPH
    sh4a     |           flac-1.4.2           | NOK | http://autobuild.buildroot.net/results/11731c86f662ce90672952d72ba7a4c1b23bf3b0 |     
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/ff2afe511e3634af640f60943ec2c6c12f2e98e9 | ORPH
   mips64    | fs/cramfs/cramfs.mk:46: /tm... | NOK | http://autobuild.buildroot.net/results/124381bbfd9d56a8282b8f603ec501112d5440d9 |     
    mips     | fs/ubi/ubi.mk:51: /tmp/inst... | NOK | http://autobuild.buildroot.net/results/5c59e1bff6bbcb27a1a50ec1cc0b05112de70825 |     
  mips64el   | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/c39563c8a949a1ec925736ecaa34ab9cb340b1ec |     
    or1k     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/e4e7c0464ac4ef6e37ce880b01d8912200ead2b5 |     
  aarch64    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/60ae0f1f9e33705ab641ed8debfd848889dba86f |     
  aarch64    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/e3385a4342a1ef829ef103b223495b7b2eca5e3d |     
 aarch64_be  | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/5298740069e92fd98b8508d5eeab9dcbf7c2764c |     
  powerpc    |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/5f6f3eb7c087075fd09580831f1a116664f01d00 |     
 aarch64_be  |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/8e80a732002901a868ec1915a3ba801b9ba232f4 |     
   x86_64    |           gdal-3.5.2           | NOK | http://autobuild.buildroot.net/results/14eef25f68603969dff16244fc3a20750a52ef30 |     
   nios2     |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/23cd783d7e1cf5e05b6b896408f770d43df58532 |     
    i686     |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/ffbcb61326e615bd5cbaebfe8d3de71d1492980d |     
  powerpc    | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/b03d48761de9da8f8a4c1f5c41e1fd489fc15a44 |     
  powerpc    | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/d8868160b9322c7321f65ead3cca63ab31dacb9c |     
  riscv64    |           gmp-6.2.1            | NOK | http://autobuild.buildroot.net/results/baffc108c1f0a0167ad2cfa4f553e94035daf0ec | ORPH
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/1f0d05d7ab57824400d0bf1bb29c63219826bc38 |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/a1553e62e49a80390a062e3cdce5a6c6615a8e1e |     
   mipsel    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/d0e46772ec92359fd932cde5bfda6c7bb9982b42 | ORPH
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/f9b5c4c981bc8b3863e41b2377fd8794687abd3a | ORPH
   nios2     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/7502209c0ea41714bb6933d5f04f99ab49ec4562 | ORPH
 microblaze  |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/0d6eb7f9131dde44a1babbdcae31b23416aaabe9 | ORPH
    or1k     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/fe4683b0572bc001b2ea1e7a0d05e855f15501fc | ORPH
   mipsel    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/3f30617092fe60927413b93c6fe988d76df6fe39 | ORPH
powerpc64le  |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/1c9acaadfe8d885d787726fe49ba95b4dfb1dd9f | ORPH
 microblaze  |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/f3054d433f2bf9376b618997599b94722dfeb94f |     
powerpc64le  |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/39a869ec937107ec6a32926a718c5d35cd5e126b |     
   x86_64    |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/acb1c370cb661926923d5b424ca5d04327ed851a |     
   mips64    |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/7a76d7604d48851a69d7f48d02e5a1ba88bec245 |     
 microblaze  |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/7f27a9b822d04a43aff7c9f11b7cd9f7c3d5ab18 |     
   nios2     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/1f675b401d5d1b76c74a29c24a380e837dca609c |     
  aarch64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/e9c23cff9bf40dba76df6d31ae67ed4ae65b1cb4 |     
    arm      |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/8be8c5ab0c68adf91b4f9220849c99c0a4180d7b |     
   x86_64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/156fb37611979aa184a6a3d5fbfd0c792687f142 |     
    m68k     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/a1c380d45509336ced3c15c0377456b252ec4244 |     
  riscv64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/844fb8fe2538a80417085a8850fccf8b0fb34044 |     
   mips64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/c4d3527b280fab85cd92a63cf70dddcbb6d97eaa |     
  powerpc    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/87652f980f69e231da76788dd5cb2a9974f1b2d5 |     
    i686     |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/bd20420c7e7b5f4dc767b0bb5ccc08d3840f7e8c |     
   arceb     |     host-gcc-final-12.2.0      | NOK | http://autobuild.buildroot.net/results/2b51ccf15b1d51f88e12efecfaa482fcb09d1cbe |     
   mips64    |         host-go-1.19.5         | NOK | http://autobuild.buildroot.net/results/1a62d20f0c67a02a050351f44425d457c46731a0 |     
   mips64    |         host-go-1.19.5         | NOK | http://autobuild.buildroot.net/results/34f5f7775bf2d9cd7354d7366b8da27e9dcec5a1 |     
  mips64el   |         host-go-1.19.5         | NOK | http://autobuild.buildroot.net/results/ecb886c2829701b8b2d378ba3f6c6b6e0a344c30 |     
  mips64el   |         host-go-1.19.5         | NOK | http://autobuild.buildroot.net/results/5ab746c4a008d66bc51065eddb8d30d54b13784c |     
    i686     |         host-go-1.19.5         | NOK | http://autobuild.buildroot.net/results/b01e3dfd9a4c02f4973e12a27c1e0204977a1971 |     
  mips64el   |         host-go-1.19.5         | NOK | http://autobuild.buildroot.net/results/3ff250a13176c7c71b3bbc5b04f3c2b83c94b994 |     
   mips64    |         host-go-1.19.5         | NOK | http://autobuild.buildroot.net/results/021867e859c96ec18c5b36d196220eb9425e1035 |     
  mips64el   |         host-go-1.19.5         | NOK | http://autobuild.buildroot.net/results/baf5d3f2f0e99208711a87afb97107014558367a |     
  mips64el   |         host-go-1.19.5         | NOK | http://autobuild.buildroot.net/results/df31e672725c84b0ff10e299b5e4ab86f049d742 |     
   mips64    |         host-go-1.19.5         | NOK | http://autobuild.buildroot.net/results/4bf00e5c3062d93ed6e5004b097c026989e5bf3c |     
    m68k     |     host-libarchive-3.6.2      | NOK | http://autobuild.buildroot.net/results/0d6c1af08d4de23190fccd10af5a613ca4206266 |     
  powerpc    |     host-libarchive-3.6.2      | NOK | http://autobuild.buildroot.net/results/2a7650b7101f3877fe22e1e8cc5fa2b842496d83 |     
 microblaze  |     host-libarchive-3.6.2      | NOK | http://autobuild.buildroot.net/results/a63669ded597a295bdf280f5f1b3b59be52c0ba9 |     
 microblaze  |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/09f3d36a6cd5fe3bb586d1c3a76edc83b809f106 |     
   mips64    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/ad2aeffbe05cb16249b01497fb727bbf46cb8158 |     
    arm      |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/b6d96201b373b857c7569aaf6e9c75dd828bc608 |     
  aarch64    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/d09e26a615cf4a0f9bb18070142bac21aa740445 |     
  powerpc    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/acb30087c50fb57a8d00f2ced3dba3cfc660758f |     
   mipsel    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/918940d33ee7ef3a53f722244618b0332958c330 |     
 powerpc64   |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/54994490bfc14e75db5de7edeb2239e4976d9698 |     
 powerpc64   |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/c19eaed88525e9122abb4ba76c7fb14f825b7a69 |     
  riscv64    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/3941c1dcd72abacd79728595c6acdf88f74989b5 |     
 aarch64_be  |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/a43255e51d924b448fb9ac1d86fa7cf51960533c |     
    arm      |   host-python-maturin-0.14.9   | NOK | http://autobuild.buildroot.net/results/f2c92faf8b12b430494859cb4d8519336041de7b |     
   x86_64    |        host-rust-1.67.0        | NOK | http://autobuild.buildroot.net/results/843d256564385f4f520e467c33629dd64834fa00 |     
  sparc64    |        host-rust-1.67.0        | NOK | http://autobuild.buildroot.net/results/6d92a7c79ade920ed1867c6d7eefb7be407d5921 |     
   mipsel    |        host-rust-1.67.0        | NOK | http://autobuild.buildroot.net/results/607bc384a53035eb0331e56a84be1173e886be96 |     
   x86_64    |        host-rust-1.67.0        | NOK | http://autobuild.buildroot.net/results/47f3655e937652698fe46c2cdb48c2ba2b085c90 |     
    mips     |        host-rust-1.67.0        | NOK | http://autobuild.buildroot.net/results/cafa320ec4d2f80d18fadfdba5905d4d71353317 |     
  powerpc    |        host-rust-1.67.0        | NOK | http://autobuild.buildroot.net/results/4a1d2c6f272405bcc1fe9cd00241dee212c61bc4 |     
   armeb     |        host-rust-1.67.0        | NOK | http://autobuild.buildroot.net/results/f2d7f4f077933f9c0d0bfe5a3e37ed2447633fd4 |     
    mips     |        host-rust-1.67.0        | NOK | http://autobuild.buildroot.net/results/d96702761c41d07fd472cd5c547fd08fc922a297 |     
   mipsel    |        host-rust-1.67.0        | NOK | http://autobuild.buildroot.net/results/c53a81757ac737aa1032824ce9c9cbe78ae02968 |     
   s390x     |        host-rust-1.67.0        | NOK | http://autobuild.buildroot.net/results/18a924bf03c77af740b16bd760a6785a18a71a27 |     
    i586     |        host-rust-1.67.0        | NOK | http://autobuild.buildroot.net/results/47441bb8b682d0ae165d505c996c9b049ebdcde2 |     
  sparc64    |        host-rust-1.67.0        | NOK | http://autobuild.buildroot.net/results/4983653dbe15daa1a744a9abd688d23916ed2726 |     
   x86_64    |        host-rust-1.67.0        | NOK | http://autobuild.buildroot.net/results/3e04f588da055230cbb0552a31029d7ac3f81a80 |     
    i686     |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/675ae2d9e96aac3e455628ca9e96e0507020eab0 |     
microblazeel |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/00c45d36ed3b957e16ac86cb0fdfb5213dabbf50 |     
 powerpc64   |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/12a63ae177fe3ed0c9a1ef2fa01870f334f36b0f |     
  riscv32    |         host-xz-5.2.10         | NOK | http://autobuild.buildroot.net/results/2669c0eec24e00dc1b5916d403f33dfc6933464e | ORPH
    or1k     |         host-xz-5.2.10         | NOK | http://autobuild.buildroot.net/results/76bcbd5a779cb80da6b259b3c61e10d68d761f1d | ORPH
   x86_64    |         host-xz-5.2.10         | NOK | http://autobuild.buildroot.net/results/be1770c8e5d731b39ebedecaf3eb00922a2de9b1 | ORPH
  riscv64    |         host-xz-5.2.10         | NOK | http://autobuild.buildroot.net/results/ea61713f5eb6abe08bb209b144fb8317dabda81c | ORPH
microblazeel |         host-xz-5.2.10         | NOK | http://autobuild.buildroot.net/results/9586f21e447ef9923606b1385ff333138406b685 | ORPH
    sh4a     |         host-xz-5.2.10         | NOK | http://autobuild.buildroot.net/results/0b01487d1fa8ccc51d01b3e016cf61e3fd5758f2 | ORPH
 powerpc64   |         host-xz-5.2.10         | NOK | http://autobuild.buildroot.net/results/1cefaabd9dcbeab708fb8393a729d742aadd97aa | ORPH
    i686     |        hyperfine-1.14.0        | NOK | http://autobuild.buildroot.net/results/1de699415cc297c05677bc348208ec0f883e78fd | ORPH
 powerpc64   |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/38e0a4cadca15ed52868f00af61f91e925c6b7c7 |     
microblazeel |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/e59369649bde549f408f41529cf565e25d6200bd |     
 powerpc64   |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/a94c1acc82f8bcf3756d8aeb9c59826a5756ee99 |     
    arm      |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/5ce5ebd20e0e509b31b51d2ec1aed56fdb8f45aa |     
  riscv32    |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/63d6be1feecf2c847e7008c32e8d2a765f63e9f9 |     
    sh4a     |          kexec-2.0.25          | NOK | http://autobuild.buildroot.net/results/bb07359b3516235db6d5ce67e8379da84e9f726c | ORPH
    sh4      |          kexec-2.0.25          | NOK | http://autobuild.buildroot.net/results/eba37e83f302d30ababf0949b8da51ac60058d13 | ORPH
   x86_64    | kvmtool-f77d646ba01d04be5aa... | NOK | http://autobuild.buildroot.net/results/f65044e76e812654bf067bf2c8b28f8240263b9b |     
   sh4aeb    |         lapack-3.10.1          | NOK | http://autobuild.buildroot.net/results/e0cbb723eb99a5999d6260497ea5ea029d61af33 |     
  mips64el   |    libabseil-cpp-20220623.1    | NOK | http://autobuild.buildroot.net/results/3ac532aecb1106ede29d5f99c9afd6107504cdb6 |     
    sh4a     |      libcamera-apps-1.1.1      | NOK | http://autobuild.buildroot.net/results/62aeed8c8c7c9611bf5b409d20455c2ba596aeb3 |     
    sh4      |      libcamera-apps-1.1.1      | NOK | http://autobuild.buildroot.net/results/cf225eb28aa9580e35bc86f0b87a4caab435fcef |     
  aarch64    |        libconfig-1.7.3         | NOK | http://autobuild.buildroot.net/results/aabf785da6db207343766a777c488c758df41356 |     
    or1k     |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/a75cb339d92a7482165dd97827f02e1662f083da |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/ffabea099d81543c8a04d0201341b243389d5de5 |     
  aarch64    |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/7d0574d43a513b01ac256eee150f793ed6bff25c | ORPH
 aarch64_be  |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/eccb35faa8f9f84d87219ee8add23d16bd3a5692 | ORPH
  powerpc    |        libsigsegv-2.14         | NOK | http://autobuild.buildroot.net/results/2e2e8b523d17ec7e89f4bb9115f1c7260d8b7809 |     
   mipsel    |         libsolv-0.7.22         | NOK | http://autobuild.buildroot.net/results/94009bd18c71b86468e031063c2b195ec2f37031 |     
 microblaze  |         libsolv-0.7.22         | NOK | http://autobuild.buildroot.net/results/60b92b55a5ac5e2d726f66d97792c5f62527ec47 |     
   xtensa    |         libsolv-0.7.22         | NOK | http://autobuild.buildroot.net/results/ce9015a905f2860e088c989be76fd878238b5082 |     
    or1k     |         libsolv-0.7.22         | NOK | http://autobuild.buildroot.net/results/589e3f217ede6cb5c224c1467fbb0c8f3a009df7 |     
 powerpc64   |         libsolv-0.7.22         | NOK | http://autobuild.buildroot.net/results/1888befd0c4867ccd4249b901c027c925fc5bb49 |     
powerpc64le  |         libsolv-0.7.22         | NOK | http://autobuild.buildroot.net/results/2627551872a0afb33ee6d97903e07684cf9d7149 |     
 powerpc64   |         libsolv-0.7.22         | NOK | http://autobuild.buildroot.net/results/403cf28ce2039ba51c604bad23e18ad1e6ad21e5 |     
  powerpc    |        libvorbis-1.3.7         | NOK | http://autobuild.buildroot.net/results/0528038e9c4fca29cfa0731996d25aa135966d71 |     
 powerpc64   |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/98fba34626ad02ed98f71cd73a7da941e34052bc | ORPH
    m68k     |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/5511e3e0c0029b988f903ef9e0aa03e91f88f79c | ORPH
    m68k     |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/c592c8ddc5ad24c9d9c09dcdf8c7268ce9ccb089 | ORPH
microblazeel |          linux-6.1.9           | NOK | http://autobuild.buildroot.net/results/cf0b78363cf6d3fdf49cf8a30ec3ab649f0b48d6 | ORPH
    m68k     |          linux-6.1.9           | NOK | http://autobuild.buildroot.net/results/dba18a1b2f3f560a47f89f988d1e5b7c9de2b546 | ORPH
   arceb     |          linux-6.1.9           | NOK | http://autobuild.buildroot.net/results/668e9b3020a1a253226cbee0ea1f9cd4bc1ee681 | ORPH
   mipsel    |       lirc-tools-0.10.2        | NOK | http://autobuild.buildroot.net/results/2a492d98ed7ebec57f12ab5588478b25dec163ba | ORPH
   s390x     |       lirc-tools-0.10.2        | NOK | http://autobuild.buildroot.net/results/273607113f8a8afd1b1fb695c3552a54c4771691 | ORPH
    i686     |     ltp-testsuite-20220930     | NOK | http://autobuild.buildroot.net/results/56e3aa46772567a035ca09d859d3c2938a1f4189 |     
    arc      |     lttng-babeltrace-1.5.7     | NOK | http://autobuild.buildroot.net/results/536d10efb3b8913298786b2ddfde26f11a59d51f |     
 aarch64_be  |      lttng-modules-2.13.7      | NOK | http://autobuild.buildroot.net/results/29be208f6cacc7920867d0d76574b8d45c0f083e |     
    i686     |      lttng-modules-2.13.7      | NOK | http://autobuild.buildroot.net/results/5dbfa36db747ba0ea876926cdc7de8e0fc5f31c2 |     
    arm      |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/98cde5cbb0844c6ef483a75cf9a6f3fd3a46c693 |     
  mips64el   |           mutt-2.2.9           | NOK | http://autobuild.buildroot.net/results/fa9e1f49bf69f03ce20f6fa336feb324256f6315 |     
    mips     |           mutt-2.2.9           | NOK | http://autobuild.buildroot.net/results/21600e7c4cb5af878fc043b10e0dcd6d7ff5f22a |     
microblazeel |          netsurf-3.10          | NOK | http://autobuild.buildroot.net/results/e623d598bdf893993ea3a680a95a3877e7add9aa |     
    arc      |          netsurf-3.10          | NOK | http://autobuild.buildroot.net/results/370d32f544f3719e41e19d79899fc96f225d6cac |     
  mips64el   |          netsurf-3.10          | NOK | http://autobuild.buildroot.net/results/9531ce11da24aeaf5c3a8298ef6d2c80ea813802 |     
    or1k     |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/530adc2f3189befb6e1b5ba9db85a44f8a1a9021 | ORPH
   s390x     |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/77a8e92cd95f8929504ae7897f625adbf9742024 | ORPH
   nios2     |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/ee15cadf8af10dee6c83b9726a034367e8ae81a7 | ORPH
   xtensa    |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/535a9be77ccc7f768f1616188305604d9b25f24a | ORPH
    or1k     |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/b15b57cd23888479cd7c2f479dc427b69901a3ee | ORPH
    i686     |          ntpsec-1_2_2          | NOK | http://autobuild.buildroot.net/results/ded9ad5badbcfa6552443d3ce0866722becfefbd | ORPH
 aarch64_be  |           nut-2.8.0            | NOK | http://autobuild.buildroot.net/results/0767d9ddaac0f9adeeaf51ab224581db4af82205 |     
 aarch64_be  |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/9af794e5edb25c412d42a8391c8dd848cc9904ca | ORPH
 microblaze  |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/e172b3a52a07e952b36a65badfc644e21beb3edd | ORPH
   armeb     |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/25991d47ce351dca226ad7790ce0bb9a2caf374c | ORPH
 powerpc64   |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/d01a159fdac9b440fb8246db3b393a537bf38d52 | ORPH
 powerpc64   |        open-iscsi-2.1.8        | NOK | http://autobuild.buildroot.net/results/708a4865127056edbbd0d9aa36b82a7a5536a295 |     
    mips     |         opencv3-3.4.17         | NOK | http://autobuild.buildroot.net/results/6093ba0d71d0968364f7889643f601862a19b393 |     
   nios2     |         opencv3-3.4.17         | NOK | http://autobuild.buildroot.net/results/427df6254c2cabb6d6f6dd31260ef24ac86d92dc |     
    m68k     |      optee-client-3.19.0       | NOK | http://autobuild.buildroot.net/results/bfb49061e2fdf7fcb105c1b8a1421d9bb819702a |     
   mips64    | package/multipath-tools/mul... | NOK | http://autobuild.buildroot.net/results/a0189b45f2213784649a231eb7998fd4db71bf9a |     
   x86_64    |        pcm-tools-202110        | NOK | http://autobuild.buildroot.net/results/4c7fc3436a61d1f0c831d613c92168b801190cdd | ORPH
   sparc     |          pcre2-10.42           | NOK | http://autobuild.buildroot.net/results/761f4ef258a3c14cc48a2ed2aaadda15df30ee71 | ORPH
microblazeel |          perl-5.36.0           | NOK | http://autobuild.buildroot.net/results/8f856a13d9d78d3e2a8d339cb52f51bb0124615c |     
   arceb     |          perl-5.36.0           | NOK | http://autobuild.buildroot.net/results/7a89f9a069b2a256f73e9ee53a1cd4f0797d0d9a |     
   sparc     |          perl-5.36.0           | NOK | http://autobuild.buildroot.net/results/5826e6679c33c0a84edbd9e4e7dc55a384ec749c |     
    m68k     |          perl-5.36.0           | NOK | http://autobuild.buildroot.net/results/d6feb5bd3acadeb0164141b05ef6c97f9642f680 |     
    arc      |          perl-5.36.0           | NOK | http://autobuild.buildroot.net/results/2b3d90f3e950fc637310e5c21785d91413eeeba0 |     
    arm      |          perl-5.36.0           | NOK | http://autobuild.buildroot.net/results/577c67286726586352746175e86104ff540bd479 |     
 powerpc64   |        php-xdebug-3.0.4        | NOK | http://autobuild.buildroot.net/results/c69630c492d8a6aeafd959dace8fc7041100aece |     
   mips64    |        php-xdebug-3.0.4        | NOK | http://autobuild.buildroot.net/results/cf389d379aef4d28d04178f82f0503b72cc24f79 |     
    mips     |           pixz-1.0.7           | NOK | http://autobuild.buildroot.net/results/c7c5a40afeba25f05007759d84ea7850b36af1aa |     
 aarch64_be  |      proxychains-ng-4.16       | NOK | http://autobuild.buildroot.net/results/87b8ec115e8afdf76e45c950d0355b596b60d89a | ORPH
  aarch64    |      proxychains-ng-4.16       | NOK | http://autobuild.buildroot.net/results/7e944e85dbeac9c52d70908ce2e45f7fbb73f71b | ORPH
   armeb     |           pv-1.6.20            | NOK | http://autobuild.buildroot.net/results/203ad24296055a8afd21898a8e48f6f7fac15d40 | ORPH
 powerpc64   |      python-bcrypt-4.0.1       | NOK | http://autobuild.buildroot.net/results/4a54d6e9626822594c29977d7cf6d2a8acc1f3f5 |     
    mips     |      python-bcrypt-4.0.1       | NOK | http://autobuild.buildroot.net/results/804670356082aee41b38c1872af5b0323495257d |     
 powerpc64   |   python-cryptography-39.0.0   | NOK | http://autobuild.buildroot.net/results/d2d59f11ac6dc62b2163f291f0c8353b04b341e9 |     
    mips     |   python-cryptography-39.0.0   | NOK | http://autobuild.buildroot.net/results/c926e1c1358cf9650230839e115b8ec363ff4b0a |     
  sparc64    |   python-cryptography-39.0.0   | NOK | http://autobuild.buildroot.net/results/b40e3253606dda61de72fab1a0321f5889924cb0 |     
    mips     |      python-numpy-1.23.5       | NOK | http://autobuild.buildroot.net/results/99d250ef86ed66df7f64050dd20165021c08b74c |     
    mips     |      python-numpy-1.23.5       | NOK | http://autobuild.buildroot.net/results/59aa7537ac4e60d98415ccbdc0eec7445d94767b |     
  mips64el   |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/cf249a82c83d3c8503205f4c3c5859dd9d52afdf |     
microblazeel |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/0b67381e3643c134c92cbcd1c5dc258fd760cd7e |     
    m68k     |         rdma-core-44.0         | NOK | http://autobuild.buildroot.net/results/d901e81395103b1d784dd3398d64f71809db7586 |     
    mips     |     s6-linux-utils-2.6.0.0     | NOK | http://autobuild.buildroot.net/results/31b42e8d1765e7512ba190c1d043c459fc11f99d |     
   sh4aeb    |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/38c0a387b500b395042e6ed3a93f5357b12bc040 | ORPH
  aarch64    |         systemd-252.4          | NOK | http://autobuild.buildroot.net/results/81b931be9cba5e69cf28e13cb8a0fee7f099a641 |     
   mipsel    |         systemd-252.4          | NOK | http://autobuild.buildroot.net/results/fcbcffa45ef26e17f11072a48b53f5369ffec420 |     
  mips64el   | toolchain-external-codescap... | NOK | http://autobuild.buildroot.net/results/2062df87a28a3214c13179672e7abfeac4191bc1 | ORPH
   xtensa    |       uccp420wlan-6.9.1        | NOK | http://autobuild.buildroot.net/results/7ae064051f12059deed6dcb64f5a096608242c32 | ORPH
  powerpc    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/b76278723569a04a0189d03cc7169ed646216b13 |     
  powerpc    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/7de65b7c3731a5f8ea51023506b7227d8080f4f1 |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/8914fd4bf23dae086c42dda9aa2140c9958c60eb |     
   mips64    |            unknown             | NOK | http://autobuild.buildroot.net/results/0a7868c0ebcecb2ea81e7c7355822b42bfdc66ad |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/700c4cd88ab2a3ad5ef75adde1433511d20e3164 |     
powerpc64le  |            unknown             | NOK | http://autobuild.buildroot.net/results/0aa80f89474705de174b15c7bd5ca6006c39870d |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/a35bac666a24946f823791121765f8fb4940a665 |     
   mips64    |            unknown             | NOK | http://autobuild.buildroot.net/results/d3e5ca15a2d61df801e8e2695631f1ad0560167b |     
 microblaze  |            unknown             | NOK | http://autobuild.buildroot.net/results/f4e9722b48fad831d44f30838b65421ea1807dde |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/4443c29facfa10970d333e2b9332efec46c6c6e9 |     
    i586     |      v4l2loopback-0.12.7       | NOK | http://autobuild.buildroot.net/results/f12168f8734c95322bdbedaa4dc54b80435cb97e |     
   sparc     | wireguard-linux-compat-1.0.... | NOK | http://autobuild.buildroot.net/results/759a968f720280939121141a00ecaf2d349ca658 |     
    arm      |         wolfssl-5.5.3          | NOK | http://autobuild.buildroot.net/results/8d714da87c984c426c5125d6def7db8b08adbfb5 |     
  mips64el   |         wolfssl-5.5.3          | NOK | http://autobuild.buildroot.net/results/6a782b69f7ed8d37a728c850d52454fb565ff48e |     
   x86_64    |         wtfutil-0.41.0         | NOK | http://autobuild.buildroot.net/results/bc40c07bfa6776a64a084ab629dd0464b65ca226 |     
    m68k     |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/4dc049b1efe2bb7b43927c3240a64bd68f2e7d64 |     
  mips64el   |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/ceba9f5f343e43cb96c06b1020f3688df464174a | ORPH
   sparc     |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/2edc321b6997f8201508700268d502ed309d165f | ORPH
powerpc64le  |          zabbix-5.4.9          | NOK | http://autobuild.buildroot.net/results/303072f15f6fcd64f38833cb3ebda93b0286af69 |     
    mips     |          zabbix-5.4.9          | NOK | http://autobuild.buildroot.net/results/01e2f4e5a3cc428ae55d8cc3752576639b59dc2c |     
    or1k     |          zabbix-5.4.9          | NOK | http://autobuild.buildroot.net/results/865837a9dbb6ad33499fb77e9af4a8a2ed6da02a |     
 aarch64_be  |          zabbix-5.4.9          | NOK | http://autobuild.buildroot.net/results/4e1a75ba8aee66bd6b004056c875f17379d39add |     
   x86_64    |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/0375da69ecc7922d7c73b4ade9d1b64a7e305ea2 |     
    m68k     |           znc-1.8.2            | NOK | http://autobuild.buildroot.net/results/26de9b6fd9d56f754595c0c743aaa471694cd62d |     


Classification of failures by reason for 2022.02.x
--------------------------------------------------

          janus-gateway-0.11.6 | 2 
                       frr-8.1 | 1 
                mongodb-4.2.18 | 1 


Detail of failures for 2022.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/5d79860cb6217f401463dc5fbb2634b91a8bf382 |     
    arm      |      janus-gateway-0.11.6      | NOK | http://autobuild.buildroot.net/results/e113d9faf7dc13b0571faca4da90a35fda38afa6 |     
   mipsel    |      janus-gateway-0.11.6      | NOK | http://autobuild.buildroot.net/results/e75d8ef60bc7a55b7601b928c2eda720e918758c |     
    arm      |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/2066a3ac5da2f84576984cf773437f08c80fe575 |     


Classification of failures by reason for 2022.11.x
--------------------------------------------------

  gobject-introspection-1.72.0 | 2 
           janus-gateway-1.0.3 | 2 
                       unknown | 2 
                 dhcp-4.4.3-P1 | 1 
                host-go-1.19.5 | 1 
              host-pahole-1.24 | 1 
             lirc-tools-0.10.2 | 1 
            live555-2021.05.03 | 1 
                    mutt-2.2.9 | 1 
                   perl-5.34.1 | 1 
                  xxhash-0.8.1 | 1 
                      xz-5.2.7 | 1 
                  zabbix-5.4.9 | 1 
                    zeek-4.1.1 | 1 


Detail of failures for 2022.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    sh4a     |         dhcp-4.4.3-P1          | NOK | http://autobuild.buildroot.net/results/94dbe4b9285cfe63d60e524f5de53754d5a8fdc2 | ORPH
   s390x     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/8067785e2f84506206bef68e977bc84d8a8ff718 | ORPH
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/7d6e0d65c9435492fb8b204d784afe9cf2124ff2 | ORPH
   mips64    |         host-go-1.19.5         | NOK | http://autobuild.buildroot.net/results/b23516c8f334f6492655a21a34ba33606db57b3c |     
   arceb     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/4bdf87664897da259f8196696e74be7967d12e51 |     
   mipsel    |      janus-gateway-1.0.3       | NOK | http://autobuild.buildroot.net/results/e195dedcba11c3c577714ff5f1caaa0675a619aa |     
 powerpc64   |      janus-gateway-1.0.3       | NOK | http://autobuild.buildroot.net/results/57e7ba20af262705e1a974422361d97b6fa7750f |     
  mips64el   |       lirc-tools-0.10.2        | NOK | http://autobuild.buildroot.net/results/063eba26bd4bfd3ed18974085cc7571cb388b8f2 | ORPH
  riscv64    |       live555-2021.05.03       | NOK | http://autobuild.buildroot.net/results/5c5a1434f1b38dca9d87186faaf10dbce569bfd1 | ORPH
  sparc64    |           mutt-2.2.9           | NOK | http://autobuild.buildroot.net/results/11aaec164eeac132c0da152fed335d1fd86360fb |     
    arc      |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/969ab380b5522025b8f36c6bc60afd9c11c566ce |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/d5fbcc0b014c534c9ce2a3b34fa6830ab1604579 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/57e88b808b62b66a2205aa3186c3df2327435dcf |     
    mips     |          xxhash-0.8.1          | NOK | http://autobuild.buildroot.net/results/36d675dfd4416a47483308ca15f9242cd6a4ab2f | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/03c5f0c63a9bf36dcd8d40d4edc8a54b00d07d93 | ORPH
   nios2     |          zabbix-5.4.9          | NOK | http://autobuild.buildroot.net/results/ff5916b936f5418c568c2fb6476673db8c9ccffc |     
    m68k     |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/6b39e96ae2daf0b0c7f8b62b6be6aeed4402c757 |     


Gitlab CI results for 2023-02-08
================================


-- 
http://autobuild.buildroot.net

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

