Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A347DC4332F
	for <buildroot@archiver.kernel.org>; Sun, 25 Dec 2022 06:39:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F0E47600CA;
	Sun, 25 Dec 2022 06:39:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F0E47600CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bl6ZCwvqT7iO; Sun, 25 Dec 2022 06:39:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C4ECF60737;
	Sun, 25 Dec 2022 06:39:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C4ECF60737
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A3A781BF2FA
 for <buildroot@lists.busybox.net>; Sun, 25 Dec 2022 06:39:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7452A400EC
 for <buildroot@lists.busybox.net>; Sun, 25 Dec 2022 06:39:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7452A400EC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ahtMTcN1Nd62 for <buildroot@lists.busybox.net>;
 Sun, 25 Dec 2022 06:39:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0E7DA400E7
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0E7DA400E7
 for <buildroot@buildroot.org>; Sun, 25 Dec 2022 06:39:13 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id D2B7D60006
 for <buildroot@buildroot.org>; Sun, 25 Dec 2022 06:39:10 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sun, 25 Dec 2022 06:39:10 -0000
Message-Id: <20221225063917.7452A400EC@smtp2.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1671950351; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Dx71cqTg5Ytl1YNZPAquCmsP0Ehx8ButnXtaY380L8I=;
 b=M7OSt3nq8rULuS9vRbqaQFJMDwAKfkh/9X808/Z8Pdf1JfLlGS6nRGMuarpLF8Ysj4zOfX
 emsFLrw8l6sjw2VNcKkmcHdXEGs1DTtlO3fMd9otfUzz71pGn6MoxNdbHLCZ7/VmaZwgLA
 /xsQL339EmQezx13hUip8O487hfYNZ1lUnvPgG65mzzwSGf7YjVgqvWxA5GmgwAYHkYFKJ
 NcZY4RZR+uoYiWvcJs1PSKl2WRXzQbipNMFp/6KOFTd/rQ9MRtfUnpqMNQHqeFru+1cQQ/
 zSfPsd/pJyw9a3w1ovnWIkycc+IfVGQiGdN5EBa3D8zO2u2BR8F27kZzdYnCzQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=M7OSt3nq
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-12-24
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

Autobuild statistics for 2022-12-24
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  |  6  |  2  |  0  |  8  |
  2022.11.x  | 18  | 22  |  0  | 40  |
    master   | 194 | 346 |  0  | 540 |

Classification of failures by reason for master
-----------------------------------------------

               host-fwup-1.9.1 | 33
                   aubio-0.4.9 | 27
host-go-bootstrap-1.4-boots... | 26
                    fwup-1.9.1 | 22
            host-binutils-2.38 | 13
                    opkg-0.4.5 | 11
       host-gdk-pixbuf-2.42.10 | 9 
                     xz-5.2.10 | 9 
                   linux-6.1.1 | 8 
           host-libzlib-1.2.13 | 7 
                    crun-1.7.2 | 6 
host-gobject-introspection-... | 6 
                       unknown | 6 
                elfutils-0.186 | 5 
    host-python-greenlet-2.0.1 | 5 
              host-rust-1.65.0 | 5 
                   gvfs-1.48.1 | 4 
              host-pahole-1.24 | 4 
                  jack2-1.9.21 | 4 
               libglib2-2.72.3 | 4 
              libostree-2022.7 | 4 
    python-cryptography-38.0.4 | 4 
                  zabbix-5.4.9 | 4 
                    bat-0.19.0 | 3 
                    dust-0.8.1 | 3 
                gerbera-1.10.0 | 3 
  gobject-introspection-1.72.0 | 3 
            host-binutils-2.39 | 3 
         host-sentry-cli-2.8.0 | 3 
           janus-gateway-1.0.3 | 3 
              libgcrypt-1.10.1 | 3 
             libgpg-error-1.45 | 3 
                    pixz-1.0.7 | 3 
toolchain-external-codescap... | 3 
                 uclibc-1.0.42 | 3 
             fontconfig-2.13.1 | 2 
               host-attr-2.5.1 | 2 
            host-binutils-2.37 | 2 
                host-go-1.19.4 | 2 
                host-m4-1.4.19 | 2 
                   libnss-3.86 | 2 
                lmbench-3.0-a9 | 2 
                    norm-1.5.8 | 2 
            ocf-linux-20171122 | 2 
                 openssh-9.1p1 | 2 
           optee-client-3.19.0 | 2 
                    proj-8.1.1 | 2 
                  sscep-0.10.0 | 2 
/home/buildroot/autobuild/i... | 1 
                     ace-7.0.6 | 1 
                  acpid-2.0.34 | 1 
android-tools-4.2.2+git2013... | 1 
  binutils-arc-2020.09-release | 1 
            bridge-utils-1.7.1 | 1 
                    brltty-6.5 | 1 
                  cairo-1.16.0 | 1 
        edk2-edk2-stable202208 | 1 
                     efivar-38 | 1 
             f2fs-tools-1.15.0 | 1 
fs/cramfs/cramfs.mk:46: /ho... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
                      gdb-11.2 | 1 
                     gmp-6.2.1 | 1 
             host-delve-1.20.0 | 1 
                  host-kmod-30 | 1 
                host-lz4-1.9.4 | 1 
host-spirv-llvm-translator-... | 1 
              hyperfine-1.14.0 | 1 
              jpeg-turbo-2.1.4 | 1 
                   json-c-0.16 | 1 
                  lcms2-2.13.1 | 1 
      libabseil-cpp-20220623.1 | 1 
               libdeflate-1.15 | 1 
                libdrm-2.4.114 | 1 
                libglvnd-1.4.0 | 1 
                libkcapi-1.4.0 | 1 
                libmad-0.15.1b | 1 
             libopenh264-2.2.0 | 1 
      linux-5.10.145-cip17-rt7 | 1 
                   linux-tools | 1 
             lirc-tools-0.10.2 | 1 
        ltp-testsuite-20220930 | 1 
          lttng-modules-2.13.7 | 1 
                   luvi-2.13.0 | 1 
               mariadb-10.3.36 | 1 
                    mpv-0.33.1 | 1 
                    musl-1.2.3 | 1 
                 nerdctl-1.0.0 | 1 
                  netsurf-3.10 | 1 
                  ntp-4.2.8p15 | 1 
               openblas-0.3.21 | 1 
   openvmtools-11.3.5-18557794 | 1 
                   perl-5.34.1 | 1 
                     ply-2.3.0 | 1 
           python-bcrypt-4.0.1 | 1 
           python-numpy-1.23.5 | 1 
            quickjs-2021-03-27 | 1 
                  reaver-1.6.6 | 1 
                    sdl-1.2.15 | 1 
       ti-k3-r5-loader-2022.10 | 1 
           uboot-tools-2021.07 | 1 
ulog-0389d243352255f6182326... | 1 
                   ulogd-2.0.8 | 1 
                 wavemon-0.9.4 | 1 
wilc-driver-linux4microchip... | 1 
             xlib_libX11-1.8.3 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/7f732df3e0622ea43209b2878ab06f741cb80545 |     
    sh4a     |           ace-7.0.6            | NOK | http://autobuild.buildroot.net/results/d967a05bbace457ddd59a81df618b6d84548191f |     
  mips64el   |          acpid-2.0.34          | NOK | http://autobuild.buildroot.net/results/292766e1e0e00602ea28a1c5afa40c1401d444dd | ORPH
powerpc64le  | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/5656b641a24fefbbe07eac62d10bd426e6ddf4b1 |     
    mips     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/a6bd2b9eaacfef6b94a2556729cb35617cb6c94b |     
    or1k     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/15db49922a4edafc3886777cd6524ad8e7406d37 |     
  mips64el   |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/0351618b8738ac2a08a00e8085739454b51cb5c9 |     
 powerpc64   |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/88fdf9a123b12a7adf674999d854c7af49b60fbb |     
   arceb     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/c45796057156c7350c2dd80e2ffd5fd4a9bb9fde |     
   mips64    |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/71268936ca293c6f0027c5e8dab0e95981171438 |     
   mips64    |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/0e998fe0f38ac0049646e2f26c44b9e23b84d40a |     
powerpc64le  |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/d70490a72226b0b0c7ba9c11337552d2f0e977b4 |     
  sparc64    |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/52b5f1a9760933b0a5961603797d967f6e2d3f32 |     
   mips64    |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/c2119cb872a535f452b75f24fdace4104a9a0566 |     
powerpc64le  |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/3f30a93f3d41d0113b064ddd0efd1b36b503e7d6 |     
    i686     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/7245dc4268f7d66bcda08bc3d93128e379ef147c |     
    sh4      |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/4a83542d054b1f70594ca976dfa9b1a1d10d2cc6 |     
  sparc64    |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/e4fef93a22bc2a823cba74baeeb5c6e14885e48d |     
  mips64el   |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/08827a2d1bef5bc20d2ddce9eec038b7947685b6 |     
    mips     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/5e6357701473fd37c10b6771970c99da55134664 |     
microblazeel |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/b17ed87e66378e0d44a6b2b28164d7a4c459dfa5 |     
powerpc64le  |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/f50a1a48ccdee439107c062640f10f61e523eb3e |     
 microblaze  |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/1508d6e3865534306da2f24ddbe2aa2d8cb77ffd |     
    mips     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/9ce1685147adb21b51e3a73c6c7740f974435d96 |     
powerpc64le  |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/25804b10acdc4a0f284922db3aa5d8ed3d7a915a |     
microblazeel |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/d05c990c7dd299b464a340a2ba828a646d5ef49b |     
powerpc64le  |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/c0b5b385a04f6421cdbb746b9424348f49794f95 |     
    arc      |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/64c0acd66f3e769fbd8f1a26c79465b65bc1c442 |     
   xtensa    |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/a8f2bf3e9c0c69eea30b43cb1229b6930c8fd13b |     
 microblaze  |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/8ab585edf442e5eb0dbcb4a3aaa7b75e709a3718 |     
   mips64    |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/e3c9dfa8eee47091dddba5e42fb8782e4a37f161 |     
powerpc64le  |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/94c058d1c8265f2cf9d94beb93738f724eb3341a |     
   s390x     |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/f70eec20e2f9778925e345346cd8750231ed83fd |     
    mips     |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/4ba6c38a6ebd6132688a3ee495124af144129f9f |     
   arceb     |  binutils-arc-2020.09-release  | NOK | http://autobuild.buildroot.net/results/d822e2ef5e20f07d1ae2140f2c0663fc46fafa0b |     
    arm      |       bridge-utils-1.7.1       | NOK | http://autobuild.buildroot.net/results/e41189cb0ae14d8a29b99fe2d8d6c1ddf41f729a |     
  powerpc    |           brltty-6.5           | NOK | http://autobuild.buildroot.net/results/069e9e221475cc5993bc4094c1d6af6c28cf4864 |     
    or1k     |          cairo-1.16.0          | NOK | http://autobuild.buildroot.net/results/06fce770c2faa33d253575e0c184a0ac0f2e4290 |     
  riscv64    |           crun-1.7.2           | NOK | http://autobuild.buildroot.net/results/c7aabd27541e61b26eadfed2dae27e3fc7a878d9 |     
  riscv64    |           crun-1.7.2           | NOK | http://autobuild.buildroot.net/results/23fd58220b84edfbe405f9c3bbc3aa97217c26b3 |     
  riscv64    |           crun-1.7.2           | NOK | http://autobuild.buildroot.net/results/3431b5812a726f358e34eaf9613ff869b13938a8 |     
  aarch64    |           crun-1.7.2           | NOK | http://autobuild.buildroot.net/results/8953319f03ee17d258ac08a638393d511dd139be |     
   xtensa    |           crun-1.7.2           | NOK | http://autobuild.buildroot.net/results/a7407dec6e7d6cc4ef62f830496436b860335f44 |     
  riscv64    |           crun-1.7.2           | NOK | http://autobuild.buildroot.net/results/65d9be861317a7d0d2fd89b493fbef1472a3fd76 |     
   mipsel    |           dust-0.8.1           | NOK | http://autobuild.buildroot.net/results/b73d5cbfceb72ab68d37078df4371b56dd6493eb | ORPH
    mips     |           dust-0.8.1           | NOK | http://autobuild.buildroot.net/results/f3be61da337fd7a8accf8eca71e8f374b2fef666 | ORPH
   s390x     |           dust-0.8.1           | NOK | http://autobuild.buildroot.net/results/643e5c7b6de48505a83b965cb6f990c140468eed | ORPH
    i686     |     edk2-edk2-stable202208     | NOK | http://autobuild.buildroot.net/results/eb903ab31614e15ddc7a033d2ad206690b4ed7cc |     
    arm      |           efivar-38            | NOK | http://autobuild.buildroot.net/results/a27697d9ef2ab11672af1e73a56108452ac1f81e |     
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/680e36d652108427fd0027e3308fbe462611d979 | ORPH
    arc      |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/5242e29b9d2efc7efbba61af6fd301940f1c67b0 | ORPH
    or1k     |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/c2295e85568e04fd27e0e14c0bf34ac3c6bf4f58 | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/c01c98498ec3b462eeb5ac0dfdb52adb94dbca41 | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/7f9a8dc00387d347740018943dab1ca9540a9f87 | ORPH
    or1k     |       f2fs-tools-1.15.0        | NOK | http://autobuild.buildroot.net/results/d4f8ab15e551e61d60dcb1ff131ed84c22faa712 |     
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/94bc64149af2c67a8aeccb4d7e291ef0bffed89a | ORPH
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/fa98e25aea7e2c15b1ce48f88ded5fe41d279021 | ORPH
    sh4      | fs/cramfs/cramfs.mk:46: /ho... | NOK | http://autobuild.buildroot.net/results/00f70c99d8bfc9400516bdaeef4ddfbf0e12824b |     
   armeb     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/faf715c9a7d9b90c4c07c62f7e8039607aab56d6 |     
 powerpc64   |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/ab3552fea689c5634342719a4456f6c0dc8b5586 |     
   xtensa    |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/d9d03352fa8dcd5e1fd4063bd85dad04ca0ca674 |     
    sh4a     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/ec7aa6c84e4fd0bb385ead73ad5917ccedb8b12a |     
   armeb     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/e1208b76c0d0e77a4749278e1802c90d99053e36 |     
 aarch64_be  |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/1dba8b44131e664f0f9abe1a46c42b76e6f5b320 |     
  mips64el   |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/e2d8c5daa1ccca39386e5543be40ed76348d51f6 |     
   armeb     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/7e8858e2d1293d24ebaf436cd7c9b5a237b2dee5 |     
    arc      |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/882f3a6868bbde0cd57cd08777330275088bcb42 |     
 powerpc64   |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/ba4db6e1c99db47a60dff6ce12526317eddee159 |     
   armeb     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/9ed9cbb1c1a2c09c5d423e3746c9dd0be891a57b |     
   x86_64    |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/33b3ac5636aeb2a4af8a2d71f43cadb7ede464f2 |     
microblazeel |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/7ff1458f942b2c178192c4f0293fe225dd69a84f |     
   arceb     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/a5eace65164b9ebfbdeb70fdff54b6f5627fafc6 |     
   nios2     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/f325827309e9bfcb72c3afeb8a8eee2f17baa93a |     
  sparc64    |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/88336ca48364c8b1d639dd2158f33276d205590f |     
   mips64    |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/7bf1f0224712fac62f3994e54da550167d028a1b |     
    arm      |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/fce2e94cffa6325874603bc4edd4e042e4a342b2 |     
   mipsel    |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/1e2c95f573fe02860c6a6dcc344bd12877c4dcd3 |     
 aarch64_be  |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/895e45de9c52e2d1f5685047c28761bb4e9422c8 |     
   s390x     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/99aaf6b17309e0c29d3f4907ed79ca49829288f9 |     
    or1k     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/d08aec8e2c65147e9355863172c536c275cea45d |     
    mips     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/3f56d6a3665f177e096a6b9c33a9360a007b6600 |     
    mips     |            gdb-11.2            | NOK | http://autobuild.buildroot.net/results/0b6d0625973bc3506aef2f4f7b011efb3261b60c | ORPH
powerpc64le  |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/ef8a66bdc23452b53dfad48cee4ca4167ea3da51 |     
   mipsel    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/fff446b5822d031191528f2502c3a60fda250bd6 |     
    arm      |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/cae776157213decdbc47586c833539a846dffbaf |     
  riscv64    |           gmp-6.2.1            | NOK | http://autobuild.buildroot.net/results/7cc97fa04a82a633c5c49938cf0e71ae9dbbb602 | ORPH
    or1k     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/2f2fef3c8f37ade58a4af3f08a745f26c3be32d7 | ORPH
    i686     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/26dbeb5a7a2be1a6f05074abb7ed47ce8749b42b | ORPH
   s390x     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/69fe058d415f64a8af62ebf965fd166d93e04492 | ORPH
  aarch64    |          gvfs-1.48.1           | NOK | http://autobuild.buildroot.net/results/82e6b380bdd95974cfbb60b828a721c2349f9a0a | ORPH
   nios2     |          gvfs-1.48.1           | NOK | http://autobuild.buildroot.net/results/ebe0b612c77e724b1bcdeecad402ee7eebe072e5 | ORPH
 aarch64_be  |          gvfs-1.48.1           | NOK | http://autobuild.buildroot.net/results/3388daa238dfcf812d85331a24bb3476f9b94142 | ORPH
powerpc64le  |          gvfs-1.48.1           | NOK | http://autobuild.buildroot.net/results/8242616917491fd2c4d00b32d34b75528a8dc29f | ORPH
  aarch64    |        host-attr-2.5.1         | NOK | http://autobuild.buildroot.net/results/37596e70b8170c64a13edc0e9ced0e703c3f9a06 |     
   sparc     |        host-attr-2.5.1         | NOK | http://autobuild.buildroot.net/results/0af12d4eaa5ab54b5ae051e8d56fddf3ca023410 |     
    or1k     |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/a135079572f2e1fb3ede8b4fcca2dce340486585 |     
    i686     |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/ab17a06338605d694490732e0f6ed83cf21d7190 |     
  riscv32    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/8cd8d70d3775f068cedce6460c95fe0b19d36f79 |     
  aarch64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/0ff2c2f6a0080481a3614745f6f6bdc4b213a73f |     
   armeb     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/f896c8630c5a5ceaf5f0507719c52ffd52125235 |     
microblazeel |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/218bcf07d805b5cb3d46df78a00fd50fd5d8d828 |     
  sparc64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/ed427cc23347c779f9aab7d72e882f8b106d57fb |     
microblazeel |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/8b55d24a18ab11224339323d50b92d54170aa846 |     
 aarch64_be  |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/2ea2af6dae55c4f9a602e2dbfade65367f24594c |     
   sparc     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/b3093a2b61befafe366a66bd58286ebdd5642b08 |     
    or1k     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/ed65489c83845cda6e0a1c856c68ed2e4ccee6be |     
   armeb     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/5e3f8cbf5d06c075039a319da20a5113275c6ced |     
   sh4eb     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/fbef605014f3946a464b9554fef661ca35742398 |     
  riscv32    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/75d456e98179c725ff4df1336da0b032176b0c01 |     
   mips64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/ab786967291af33546d5bc942526852770dbe4ae |     
 powerpc64   |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/c46712de136fb7707064bfeb5111ea48ef7d246e |     
   mips64    |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/27109fb7deb6770beee0e08b490f6c1ece089e18 |     
    mips     |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/136218c23b7a6abdd1d06a48700dae988a1701ab |     
   mips64    |       host-delve-1.20.0        | NOK | http://autobuild.buildroot.net/results/06653827e306f22be2b9b9a3cfb319a3702cae50 |     
 aarch64_be  |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/194fe03ad78365ef1fdb81134c45e36ef8585256 |     
   sparc     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/46e9df347528bae21cf7474f335be37f11fb3770 |     
    mips     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/60179659b9e534ed2a78ebaf255ae287a1d15513 |     
   arceb     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/1537d8f5c511d65f5b7eb500bffc221fb5fb44c6 |     
 aarch64_be  |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/0928c3cb1c0f2831d61debb233ea4a2257715e1d |     
  aarch64    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/0f882bdc640be924e3dc7af4dcf7afa49f0180d8 |     
    i686     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/736b5a22ef4031023e67ab8dfdf9421d07590a74 |     
    arc      |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/840fdac5665ec3630263d3a0bbbdc791cfe1ff94 |     
   xtensa    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/11157ce00205ba9584e388f1a1ee3beb20ff9138 |     
   mipsel    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/5d9d51f081d4f2807c71a65a29a17e823845ec95 |     
  powerpc    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/f9ed74d560c98a45381b0e0d026ff7da400ee5e1 |     
   sparc     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/9d6c038eea65342e04e9f62e42c04b57a7d00d79 |     
 powerpc64   |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/0d1b23bf9db18effa9bcfadf51dd94a03cc914d5 |     
  riscv32    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/abc268af366320bb0109638053b7a196757ece1d |     
   xtensa    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/7dfec0f8a51824500d75ab164cfcaf6918096fdd |     
  powerpc    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/1bba6bd5b106c3bc5900d6bec895ea4100da6e23 |     
 aarch64_be  |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/be73ab17fed8e0699944fe91f9ec38a2e5f302df |     
   armeb     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/1895a259429153c8f70ec1296358c2ff3a5b1672 |     
    mips     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/e4a23ba17a4dbf44ef8ded3864f9ab02a1bae2ee |     
 aarch64_be  |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/2de15b66725823c553fdbdd75b041414e6cf6a64 |     
   x86_64    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/173ea44d5cf09ee5caeaec990946b164e854d78c |     
   s390x     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/746971768096e8181d3534867810fd370a3f017c |     
   sh4eb     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/27d00e3d4489a83497f6231e409e65f93dbe64ba |     
   s390x     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/c61ff2ea71a5b2ff13f101eac0020259897c1ac8 |     
    arc      |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/a89d989fe9e8cf5c7e70d21e401bde4e0f49b6fc |     
 aarch64_be  |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/b318164e1c15c96599596a6c8f0d0e21856e3b24 |     
   xtensa    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/9359329e83fd4cf96b5855d4052128417ebbae30 |     
    arm      |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/f309fd9ee61a18c3c3f3748022f86d362184600f |     
   sparc     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/f47b2fac586a6181634eca3c38433e03e609c08d |     
   sparc     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/34f8f5a8d93a6f087f811bb38dea3d595fef317b |     
powerpc64le  |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/88f3a9bbae14c43116fb088731c8812c07be7d7a |     
    mips     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/dd6da811885e17fd21effde1c9df2528ef5752db |     
   mips64    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/89a7897994d43e8143ec6854c899b03e378343da |     
  mips64el   |    host-gdk-pixbuf-2.42.10     | NOK | http://autobuild.buildroot.net/results/98f19b0aa208ef613f2f63159dfda31f3874e731 | ORPH
   armeb     |    host-gdk-pixbuf-2.42.10     | NOK | http://autobuild.buildroot.net/results/758046866f9dd1b5d32f0646229f20945b189f82 | ORPH
    mips     |    host-gdk-pixbuf-2.42.10     | NOK | http://autobuild.buildroot.net/results/417097121a4f7313091ba4c13bf14c4825c6cd33 | ORPH
   mips64    |    host-gdk-pixbuf-2.42.10     | NOK | http://autobuild.buildroot.net/results/977e34880d2aaf91562b190dfdfa968dc5e60690 | ORPH
  mips64el   |    host-gdk-pixbuf-2.42.10     | NOK | http://autobuild.buildroot.net/results/05405b154e2c2d4ea1d1213d2bfa2c82a04c26e9 | ORPH
   nios2     |    host-gdk-pixbuf-2.42.10     | NOK | http://autobuild.buildroot.net/results/e8984e3f4dda5312585adb5bc7a17f3251af8a45 | ORPH
   nios2     |    host-gdk-pixbuf-2.42.10     | NOK | http://autobuild.buildroot.net/results/efb9a1b1b33fa1884ca761418b608efbb199ecca | ORPH
  sparc64    |    host-gdk-pixbuf-2.42.10     | NOK | http://autobuild.buildroot.net/results/94d0e42dd0bcb4c0a0c20bc9d5a70762ab87b927 | ORPH
  aarch64    |    host-gdk-pixbuf-2.42.10     | NOK | http://autobuild.buildroot.net/results/bbf4e04cbfd71be2a67363c1ed31c52245d0bf57 | ORPH
   mips64    |         host-go-1.19.4         | NOK | http://autobuild.buildroot.net/results/697bc0826dfa9e4f3a774a5f9bf056620baed245 |     
  mips64el   |         host-go-1.19.4         | NOK | http://autobuild.buildroot.net/results/6c2bb6771947d0c432667a894752b46b4c51a63d |     
   x86_64    | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/128e5c7d546a28b6e428feee7a5a65c6c41813f0 | ORPH
  mips64el   | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/ee71ce8514b7af42b7958d4f3dcf35186cd4f43c | ORPH
 powerpc64   | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/8be330c4a20ab2a227c28f362b4a217feb4d72e9 | ORPH
   s390x     | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/a8f125286a51d6f1ff2450062f9284d2bc4363ff | ORPH
   mips64    | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/3d9557bde6521e62ba8c231ca3f7047031bc4381 | ORPH
powerpc64le  | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/d0c9c17dc99e0cbac8d5c52390fce20978338636 | ORPH
   mipsel    | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/dfc4f813140e08803be0c6bdf75860d7f1d41eea | ORPH
   s390x     | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/1c76fe0d33609ad633a672828d018b1c7cd671d1 | ORPH
  aarch64    | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/96684c33349494b3ec1388121690125056920c35 | ORPH
   sparc     | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/85182f4a0729abf1dafd6ad0862f97ee8bb9e214 | ORPH
   x86_64    | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/1623d20f053e827f43d21b4f458b6c284c98da0b | ORPH
 aarch64_be  | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/e3d951416d57f8f751d1f52e3a4322118ea1d90d | ORPH
    arc      | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/06b6032791296e7eee97ae14049e0928780a8129 | ORPH
    mips     | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/3403d73cc5b5683183196f3166c009278f22453a | ORPH
 microblaze  | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/131eb532cf00b20a85a9eb8665f410e583f0dbf1 | ORPH
    arm      | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/2abedf78548add8dfffb3c02e3e9b123c43f48e2 | ORPH
    m68k     | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/01e7a16626b923079e7bcc35b70f071b27be7c6a | ORPH
powerpc64le  | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/bcc53c2f06377252a1e662e4bc07b4bfd2ed26b4 | ORPH
  mips64el   | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/5605f6436999ef0cdb4516ecd50de558e4f4c78a | ORPH
  riscv32    | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/df8235abb31d9a9cff7a1e3078f6e5612ab0c0b0 | ORPH
 powerpc64   | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/194156b5170fa5231b6784273c06a1c810f66c45 | ORPH
   s390x     | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/ef1521f55340d5c42dc8d04511bf1dc75eb1a214 | ORPH
microblazeel | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/be6be4a584e2a89ec9263f642f6a6b7b54754542 | ORPH
  riscv32    | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/8c4988667f703d62a75cc0ba5e6c96ff73017904 | ORPH
  aarch64    | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/69ca3a0db1224de117fe10603c5a52d4f74c1023 | ORPH
microblazeel | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/3f0b7f4a34a309eb96721f6a080ec35807064c77 | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | http://autobuild.buildroot.net/results/7a09b6954c908a27f26b4573066daddf1eb59358 | ORPH
   s390x     | host-gobject-introspection-... | NOK | http://autobuild.buildroot.net/results/5e35d8c7a6fa7cd5913636e0a885b23a13e44f90 | ORPH
 powerpc64   | host-gobject-introspection-... | NOK | http://autobuild.buildroot.net/results/a260492bbf52c3e3b39ab4dcd87f4d7e1e21b67e | ORPH
 powerpc64   | host-gobject-introspection-... | NOK | http://autobuild.buildroot.net/results/b72d32805fc552c14da96ef37ef99e905606660b | ORPH
   nios2     | host-gobject-introspection-... | NOK | http://autobuild.buildroot.net/results/6ed36add524b4dfc85c6f1f3b13259abacb78159 | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | http://autobuild.buildroot.net/results/c23753f97bb2aa8ca5e05617ffa5f564d4a2f65c | ORPH
  mips64el   |          host-kmod-30          | NOK | http://autobuild.buildroot.net/results/7355d65080e0d118b9123ddef550fb960f3ab08a |     
   armeb     |      host-libzlib-1.2.13       | NOK | http://autobuild.buildroot.net/results/4237a067e8a115d7e488adf1b3e2e22619c7e806 | ORPH
 aarch64_be  |      host-libzlib-1.2.13       | NOK | http://autobuild.buildroot.net/results/7fa90f532af33f27d2206d5f391801832d3161c0 | ORPH
powerpc64le  |      host-libzlib-1.2.13       | NOK | http://autobuild.buildroot.net/results/263371af203fec2be79a0e89384f2a94c15d081f | ORPH
 microblaze  |      host-libzlib-1.2.13       | NOK | http://autobuild.buildroot.net/results/968651c5983af236ddfea4660d2e763505fe4a08 | ORPH
   mipsel    |      host-libzlib-1.2.13       | NOK | http://autobuild.buildroot.net/results/17f0d0e6d0fc3be7c27e0e2b1f97bef644a15a29 | ORPH
    arm      |      host-libzlib-1.2.13       | NOK | http://autobuild.buildroot.net/results/3538aab05f5c89db874b9cb542139c3530e89c6d | ORPH
    i686     |      host-libzlib-1.2.13       | NOK | http://autobuild.buildroot.net/results/8c5e04d619618bd721ba1bad1ed513012d1b50d4 | ORPH
   mips64    |         host-lz4-1.9.4         | NOK | http://autobuild.buildroot.net/results/e6ff12054fd004880bc6342e58ba4f3ece2d73e1 | ORPH
  powerpc    |         host-m4-1.4.19         | NOK | http://autobuild.buildroot.net/results/3c423875cae4c11af8dff52bffc541159de67992 | ORPH
 microblaze  |         host-m4-1.4.19         | NOK | http://autobuild.buildroot.net/results/7e23fd34554306e9faf631223234d108f82a38af | ORPH
 aarch64_be  |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/d76ec67bbdbdde863dfc8084432fb5ec68720358 |     
   sparc     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/506c44dd10bad27e4db0af4803b2f8a289ee91e8 |     
 powerpc64   |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/68344561994c3efd736784f99c353d4a6e3b5ed1 |     
 powerpc64   |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/4faf9c83e86b93c261cd6618f5646e2d64427b28 |     
    i686     |   host-python-greenlet-2.0.1   | NOK | http://autobuild.buildroot.net/results/7ec61e5bb6853d9670800acd21d30dc53b0d7ec3 |     
    i586     |   host-python-greenlet-2.0.1   | NOK | http://autobuild.buildroot.net/results/84b815744ad668af7b1e3531c04a032224d2efab |     
   nios2     |   host-python-greenlet-2.0.1   | NOK | http://autobuild.buildroot.net/results/32ea95a5191d240f8d3b617642c36ff8544b5b80 |     
    sh4      |   host-python-greenlet-2.0.1   | NOK | http://autobuild.buildroot.net/results/cae778978e0283dbade10d85091a3a03d4d6a885 |     
    sh4      |   host-python-greenlet-2.0.1   | NOK | http://autobuild.buildroot.net/results/fb5573ccc8b46bf9e7a00c8946a5dcb7a07ac7c8 |     
  aarch64    |        host-rust-1.65.0        | NOK | http://autobuild.buildroot.net/results/22581e121da971bf5983d19474c346c5c0fac94d |     
powerpc64le  |        host-rust-1.65.0        | NOK | http://autobuild.buildroot.net/results/ff6968d837a5b706ab536f3f1aedd6256b866d20 |     
powerpc64le  |        host-rust-1.65.0        | NOK | http://autobuild.buildroot.net/results/12fa83c637cb39f6847eb7166e6c7949ce329ed7 |     
powerpc64le  |        host-rust-1.65.0        | NOK | http://autobuild.buildroot.net/results/fc663b4af5d17bc55d82b129e002593ddd7a234f |     
 powerpc64   |        host-rust-1.65.0        | NOK | http://autobuild.buildroot.net/results/08d4f94f79e4e8b4004fe729fe677e54551107e6 |     
 aarch64_be  |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/37ad0203176ff3deb2294c3e3212ae79f7d5521b |     
    arc      |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/737c5fb2a6f502a17ae8e8257a45cb4ba2acc90a |     
powerpc64le  |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/dba68da2725db8c31c8ca7757df0f2a59e25a7b6 |     
    i686     | host-spirv-llvm-translator-... | NOK | http://autobuild.buildroot.net/results/3bb3f33fc05d20890451fdf72166dcd96ab0b89d | ORPH
   s390x     |        hyperfine-1.14.0        | NOK | http://autobuild.buildroot.net/results/9e92074bee0b67c5e374beb3d7ab2d93652696c3 | ORPH
  mips64el   |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/7372d025386e238a38b01b081442fc4bb686df44 |     
 aarch64_be  |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/ec7e93cf24571623c08d62bf145f3e1c5c8707f7 |     
powerpc64le  |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/755a36d4584fec287e50d3e8c0b641703b06e82b |     
  powerpc    |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/e4ec99529ed894ad6f81fd02c5c4e05e12797b4e |     
  aarch64    |      janus-gateway-1.0.3       | NOK | http://autobuild.buildroot.net/results/724cdc59fc4c168dccc350c3285eb20409a76fa3 |     
   armeb     |      janus-gateway-1.0.3       | NOK | http://autobuild.buildroot.net/results/b72963e66eaf3ff8a86ebb6c499c3209ab017621 |     
  mips64el   |      janus-gateway-1.0.3       | NOK | http://autobuild.buildroot.net/results/4cff58f5aea18b9bd9ba872ef4ff7df498405503 |     
    or1k     |        jpeg-turbo-2.1.4        | NOK | http://autobuild.buildroot.net/results/d8afd9ea520057a90a99c042fb898b712bc61cba |     
  riscv64    |          json-c-0.16           | NOK | http://autobuild.buildroot.net/results/76d185d4636b02c26825a33d803777559481740d |     
   xtensa    |          lcms2-2.13.1          | NOK | http://autobuild.buildroot.net/results/d4c27fd3f54682f27b70f4cec8dc1cdc791e0d0a |     
  mips64el   |    libabseil-cpp-20220623.1    | NOK | http://autobuild.buildroot.net/results/4b52e272273373380284582229326b7914070b7a |     
  aarch64    |        libdeflate-1.15         | NOK | http://autobuild.buildroot.net/results/9aee8dafea614db77209818b913a571534466506 |     
 aarch64_be  |         libdrm-2.4.114         | NOK | http://autobuild.buildroot.net/results/999bddc4c64c1fcf14c4de815481092c296302d3 |     
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/fb161c4e95430bead95aa3cf62098516d3ba2f38 | ORPH
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/7fc6557f98d99b165e99e3d1d38eeb46bb748775 | ORPH
    i586     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/e103f9ecceceb0ff44f75d9919602d1e2385e10b | ORPH
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/6a993ebd82d39dd69adac408aaf692b2eb6e3743 |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/af868a5429d73300b7b1db9db18b453b8c276000 |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/cea160f77768f62e8afcc3eb9be75cffb4347908 |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/b0864456580d7e99687fdcdb96b85a07da2f503d |     
   x86_64    |         libglvnd-1.4.0         | NOK | http://autobuild.buildroot.net/results/4a3cdfd763183274ccf4d01dd142c21c36afb896 | ORPH
 aarch64_be  |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/9bc870e22542f5995110687ca7677bbb0b3b1bc6 | ORPH
  aarch64    |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/b1424b880a6c81000cd9fbfd5292b539efc48640 | ORPH
 aarch64_be  |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/46056dbdb2f8a11999200bf0a2aff2c5b2fa1a53 | ORPH
 microblaze  |         libkcapi-1.4.0         | NOK | http://autobuild.buildroot.net/results/f8a67be6f2de87ff8f2ad09ceb9786c46c8ed125 |     
   armeb     |         libmad-0.15.1b         | NOK | http://autobuild.buildroot.net/results/602cae1a070dc0b0c2dcb175ad574029e4febfe4 | ORPH
powerpc64le  |          libnss-3.86           | NOK | http://autobuild.buildroot.net/results/6d442ce3c79a0180d1638bb9a45c39e3f4307536 |     
   x86_64    |          libnss-3.86           | NOK | http://autobuild.buildroot.net/results/44aad32f31c6803e66db415fd5efa74a5c1d237a |     
   mips64    |       libopenh264-2.2.0        | NOK | http://autobuild.buildroot.net/results/394e88c3d42b48d2193978a52487d478097438d5 |     
    i686     |        libostree-2022.7        | NOK | http://autobuild.buildroot.net/results/a96fff9bd7a53efabc82899ae1adb46138fc4549 |     
    m68k     |        libostree-2022.7        | NOK | http://autobuild.buildroot.net/results/857f73dcdbb6faf0a337c28e42dc0ed2759f8864 |     
   s390x     |        libostree-2022.7        | NOK | http://autobuild.buildroot.net/results/63d684c4495e7cd5a21923a6a9b530c5a4692542 |     
   s390x     |        libostree-2022.7        | NOK | http://autobuild.buildroot.net/results/a3892e5cfaaf0ea9d0db9737a7fa6cd6be6b3ab7 |     
   s390x     |    linux-5.10.145-cip17-rt7    | NOK | http://autobuild.buildroot.net/results/f38d536324b11b284aa9064cffca7d66a36089d6 | ORPH
    arc      |          linux-6.1.1           | NOK | http://autobuild.buildroot.net/results/42d6cf1803d89ada32a40361527eb73cf1502ad1 | ORPH
  riscv32    |          linux-6.1.1           | NOK | http://autobuild.buildroot.net/results/bd038c36ca86cc0d22f57828d7770e95ca287724 | ORPH
   armeb     |          linux-6.1.1           | NOK | http://autobuild.buildroot.net/results/6ec94d3aba39bf62472e049573a10b4172f1b516 | ORPH
   nios2     |          linux-6.1.1           | NOK | http://autobuild.buildroot.net/results/8e81c8f68b1b8b5fabb97a6e1dee9bcdb125affa | ORPH
   mipsel    |          linux-6.1.1           | NOK | http://autobuild.buildroot.net/results/df5853beb8c55cc4ce65fbab6bad7a00f3ac318e | ORPH
  mips64el   |          linux-6.1.1           | NOK | http://autobuild.buildroot.net/results/2eba66f9832102ad45b2398723f14a81edee7203 | ORPH
  mips64el   |          linux-6.1.1           | NOK | http://autobuild.buildroot.net/results/2ee9fc0cedc1e1605d62039ba0fd47818cf6431b | ORPH
    m68k     |          linux-6.1.1           | NOK | http://autobuild.buildroot.net/results/eac9cdfa6c8830810679c15efa285171a148993a | ORPH
   x86_64    |          linux-tools           | NOK | http://autobuild.buildroot.net/results/c4ec79d259d9342ca5a79bb8644abae7415e2560 | ORPH
 aarch64_be  |       lirc-tools-0.10.2        | NOK | http://autobuild.buildroot.net/results/246a09c9f80b639b298025e6562fbe1d3ed78b8f | ORPH
   mipsel    |         lmbench-3.0-a9         | NOK | http://autobuild.buildroot.net/results/521614f1c2cdb5ce614d2b250a43bcc86b41bddd | ORPH
    mips     |         lmbench-3.0-a9         | NOK | http://autobuild.buildroot.net/results/535a12e58ebb4154a04898b214589dd6d28c3dc5 | ORPH
    or1k     |     ltp-testsuite-20220930     | NOK | http://autobuild.buildroot.net/results/50afda525f0b95b2ccf4d28ba9146031af1146ca |     
  sparc64    |      lttng-modules-2.13.7      | NOK | http://autobuild.buildroot.net/results/f5a91c0711bafbddf74057457fd9e4f1dcf7e767 |     
 aarch64_be  |          luvi-2.13.0           | NOK | http://autobuild.buildroot.net/results/ddd497610bf4220b3d35fc9f8ca1fa8205f2dbad | ORPH
   sparc     |        mariadb-10.3.36         | NOK | http://autobuild.buildroot.net/results/2c29b3f0916caefe60e684c2fea811c2272e1611 | ORPH
    arm      |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/bae0d2fe30886c2c7309e3a0f8457e2d359e218c |     
  powerpc    |           musl-1.2.3           | NOK | http://autobuild.buildroot.net/results/bcb7c33ecdd13eac6576e37ac3a5dcaee9f345b7 |     
  riscv64    |         nerdctl-1.0.0          | NOK | http://autobuild.buildroot.net/results/449fe983a2532ca72d0644ccad68a80a98118e7d |     
  sparc64    |          netsurf-3.10          | NOK | http://autobuild.buildroot.net/results/bd5397de85a9aa30b708fcd2853d526773128e32 |     
powerpc64le  |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/90d972fad6b28d3b947730a5383fd72310f4991b | ORPH
  aarch64    |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/2312ea3f4e94d8cf060f76600e6e4da584389273 | ORPH
    m68k     |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/6f7eb7230f2ebc2aa57a80f0f35bc1e2962b6313 | ORPH
 aarch64_be  |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/f666a09b947bfd365ab3f016e48214c6949bf4a1 | ORPH
 microblaze  |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/7b45a8f4d6b5e11b029192d328249205ce99b1a7 | ORPH
  mips64el   |        openblas-0.3.21         | NOK | http://autobuild.buildroot.net/results/5146b6dc30826860ee2e591ab349a5b03d2a3828 | ORPH
    m68k     |         openssh-9.1p1          | NOK | http://autobuild.buildroot.net/results/31cc0e5d1942f5f43f1825158f647173a8757759 | ORPH
    m68k     |         openssh-9.1p1          | NOK | http://autobuild.buildroot.net/results/bbed67865935c777fc84b4a8fe072c0e04a85770 | ORPH
  aarch64    |  openvmtools-11.3.5-18557794   | NOK | http://autobuild.buildroot.net/results/a42a0086826060a021bb4c7b865befd07df2f4ef |     
microblazeel |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/e4d3b754a58cd65efdc0651c2b482a8c9973ff4a | ORPH
   s390x     |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/cdfd13105b1f35e32c467bde00fa18fd50060849 | ORPH
   mips64    |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/5b6b7778e4fb5053139884bb5b523074206e7497 | ORPH
  riscv64    |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/30ae9092d886812e81186af74816f073af69eba1 | ORPH
   nios2     |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/db6e0e84f2bae8f1e2f9b1326b27b166bf15ffcb | ORPH
  sparc64    |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/5da470fb4afae336dba9705f7a8fa58a2addfbbe | ORPH
   mipsel    |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/888c453d6d362dad089a007ca62ccece74ac4875 | ORPH
  mips64el   |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/71ffb7bcd462a89dfedafdb0532090763a398a24 | ORPH
    or1k     |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/2f93def508ac2513470d5f635d4a815087fe3a42 | ORPH
   x86_64    |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/28d9c8178dc90a60acbc460912cb0bd944764a86 | ORPH
  sparc64    |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/7715582642f5f79da1d57f2ed6e9ac74cd904408 | ORPH
   xtensa    |      optee-client-3.19.0       | NOK | http://autobuild.buildroot.net/results/ebcefeee8a4e96747a39121273ef6f090ba86460 |     
    arm      |      optee-client-3.19.0       | NOK | http://autobuild.buildroot.net/results/1e6c6b8cb60578c3050f4222d884239cead4afb0 |     
  aarch64    |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/bc98cee98cecaa8b2e76250bfdbe773752e4fda0 |     
  sparc64    |           pixz-1.0.7           | NOK | http://autobuild.buildroot.net/results/b45eabaeb35c72cfcb3cd67e747ae2136c3f3c04 |     
   x86_64    |           pixz-1.0.7           | NOK | http://autobuild.buildroot.net/results/ce429df11068c7390598fd42833bee4ca4f706aa |     
    i686     |           pixz-1.0.7           | NOK | http://autobuild.buildroot.net/results/e0494938a5f0ead3df9f6fcc36b929e2bec62e25 |     
   x86_64    |           ply-2.3.0            | NOK | http://autobuild.buildroot.net/results/ce37039991cb0fb02b97d341d78327e54d0e1d26 |     
 aarch64_be  |           proj-8.1.1           | NOK | http://autobuild.buildroot.net/results/f1253ab8c9fb04c2d675a58cfc959c3be3ad2d5f |     
    or1k     |           proj-8.1.1           | NOK | http://autobuild.buildroot.net/results/f20ab17dc5803f14a95807ddabd747fe5f3f23c9 |     
  sparc64    |      python-bcrypt-4.0.1       | NOK | http://autobuild.buildroot.net/results/35cf1970150b1f1b4977b9c5b59bdfa012578085 |     
powerpc64le  |   python-cryptography-38.0.4   | NOK | http://autobuild.buildroot.net/results/eaa25bd78d40890b5e13ff97a39676a7375ac724 |     
  aarch64    |   python-cryptography-38.0.4   | NOK | http://autobuild.buildroot.net/results/403394bf6efdf678ff76aa65ae0a6bd5cb9c32cd |     
   x86_64    |   python-cryptography-38.0.4   | NOK | http://autobuild.buildroot.net/results/6cb80d7bb042cac1886ad7c75415fe3cd6def035 |     
   s390x     |   python-cryptography-38.0.4   | NOK | http://autobuild.buildroot.net/results/e3a194ee17a96cc6e097b41ceefe921bb53f523f |     
   mipsel    |      python-numpy-1.23.5       | NOK | http://autobuild.buildroot.net/results/2549d6e306159bbaafceba5eabc264f1d01bc843 |     
    or1k     |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/3fbbd21a8e5aabce6b0c85dfaf1cf1bd4d7f724c |     
   arceb     |          reaver-1.6.6          | NOK | http://autobuild.buildroot.net/results/3e2643db99ed219f994e9d643b70316d80449f59 |     
    sh4a     |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/5c1e2dd3692f33a180dd8957e9d7a06d8e5660de | ORPH
    arc      |          sscep-0.10.0          | NOK | http://autobuild.buildroot.net/results/f9a543869547dea4d1ece4b4e1a3fb17b37cc8c8 |     
   sparc     |          sscep-0.10.0          | NOK | http://autobuild.buildroot.net/results/f479a7a4991aa42f2295d9bd9f475045879f53ce |     
  aarch64    |    ti-k3-r5-loader-2022.10     | NOK | http://autobuild.buildroot.net/results/fdc2fe1f7b387535c2d136e6a2b4c456bce400af |     
   mips64    | toolchain-external-codescap... | NOK | http://autobuild.buildroot.net/results/151f31dc896d52e6337ed5f873f99126758c9988 | ORPH
  mips64el   | toolchain-external-codescap... | NOK | http://autobuild.buildroot.net/results/eed7184e886841afc7df0b59ace129b3745d4d76 | ORPH
  mips64el   | toolchain-external-codescap... | NOK | http://autobuild.buildroot.net/results/26151b5df486d45fdc281dae7cca454d8fb77b1c | ORPH
    i686     |      uboot-tools-2021.07       | NOK | http://autobuild.buildroot.net/results/45a57389576a107b40ec1c443d89ae9a82db870e |     
  powerpc    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/03228794261e6e8be373bf2997c2c9efe55cdab3 |     
  powerpc    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/cb240ee9ada8447b0590b68f7d5627c18f95a2c3 |     
  powerpc    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/76935eb30afd3b9c4a25dc92b818a5773cb87bfe |     
    sh4a     | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/98081429517b9b2d8ef899899ad8de1c82a2cac0 |     
  aarch64    |          ulogd-2.0.8           | NOK | http://autobuild.buildroot.net/results/a8a0c1883cd0b1020853665ec57f6f1121321ebe | ORPH
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/3fefebce91f14b994f1924d681014f4343e64cef |     
   mips64    |            unknown             | NOK | http://autobuild.buildroot.net/results/c06478870a14c6ad70b2ddd82f5a7ff14a1f3d4a |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/de0cb02651f3aaf592e591e299b51c451b7ecabb |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/4feb8989d717be609b4600627065d45c89accbe3 |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/cb6877c11207d76f731df0da0ce40669229e4d25 |     
    sh4      |            unknown             | NOK | http://autobuild.buildroot.net/results/0dfa3d1ebe4237b7c835fdf37724c22a3586bd4e |     
   x86_64    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/c24eb6305d7142c67c6987481c3adcc44447368f | ORPH
   sparc     | wilc-driver-linux4microchip... | NOK | http://autobuild.buildroot.net/results/6aa7475a21a6060e9fce3552f73e6e7100a8b2aa |     
    arm      |       xlib_libX11-1.8.3        | NOK | http://autobuild.buildroot.net/results/db130156e87e8b88c6d9af27568a4cf3e1ce81bf |     
 microblaze  |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/641b811b3fb4d65ff022f464bd1485d78a8bb0c8 | ORPH
microblazeel |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/40f49e78a2d52893ccbe3deb28f84acee0396c17 | ORPH
microblazeel |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/c7db1e6575762a5216be39160534fb4981c38ab2 | ORPH
 microblaze  |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/ab004cb56360b536121f7e80f6575643c5676d75 | ORPH
 microblaze  |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/6598972b785a09b81c3673a21baf98c25f683df2 | ORPH
microblazeel |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/c6b031fb70aedcc20b602d46918d2e4120657825 | ORPH
microblazeel |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/543f428b54a327098ac2bb9e45203e1d61236ff2 | ORPH
 microblaze  |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/53b4667550f2ef90fa4adad3a9a390543668298c | ORPH
microblazeel |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/b29c507e0376b53a9f3638169aa98d356b53335c | ORPH
  sparc64    |          zabbix-5.4.9          | NOK | http://autobuild.buildroot.net/results/05a73eb5a066d761c1889f8c389e1acdfa7bcd11 |     
  powerpc    |          zabbix-5.4.9          | NOK | http://autobuild.buildroot.net/results/9fe0852210772fd5dc42bb3aa747375edb593663 |     
   mipsel    |          zabbix-5.4.9          | NOK | http://autobuild.buildroot.net/results/3357e8228261455ae4c0396ec1cc1292420a9cee |     
 aarch64_be  |          zabbix-5.4.9          | NOK | http://autobuild.buildroot.net/results/c7572d1868d37b8bc03de629d340c7e45142546f |     


Classification of failures by reason for 2022.02.x
--------------------------------------------------

            igd2-for-linux-2.1 | 1 
ulog-0389d243352255f6182326... | 1 


Detail of failures for 2022.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    sh4      |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/f7f1cec06908d33f3ee765b7d254557fc745f6ef |     
  aarch64    | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/a95865220b4017f216caeccc648aa21d862dd6e5 |     


Classification of failures by reason for 2022.11.x
--------------------------------------------------

              host-pahole-1.24 | 3 
                     efivar-38 | 2 
/home/buildroot/autobuild/i... | 1 
/home/buildroot/autobuild/i... | 1 
/home/buildroot/autobuild/i... | 1 
             berkeleydb-5.3.28 | 1 
                    dust-0.8.1 | 1 
          gitlab-runner-14.5.1 | 1 
                host-go-1.19.4 | 1 
              host-rust-1.64.0 | 1 
                libdrm-2.4.113 | 1 
              libgcrypt-1.10.1 | 1 
          linux-5.10.145-cip17 | 1 
        ltp-testsuite-20220930 | 1 
                  ntp-4.2.8p15 | 1 
                    opus-1.3.1 | 1 
                   perl-5.34.1 | 1 
qt5base-2ffb7ad8a1079a0444b... | 1 
               valgrind-3.19.0 | 1 


Detail of failures for 2022.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   s390x     | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/222d98c26ec39a691f2e7172876b0da2c09488e2 |     
    or1k     | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/b232bc96f7375178d763c888cacc1c8ba262d887 |     
  mips64el   | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/418f681568cb5795b225dd70899447dc7e25d777 |     
    sh4      |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/1d940ed5072e33f1ec1fad5d71c0260ddec20766 | ORPH
   mipsel    |           dust-0.8.1           | NOK | http://autobuild.buildroot.net/results/cf1ac4c071596abafbf8baa7cd92c90537cec4c0 | ORPH
    arm      |           efivar-38            | NOK | http://autobuild.buildroot.net/results/7d88ab1f157a8bfe27ce027d7da76cf3e845bc49 |     
  mips64el   |           efivar-38            | NOK | http://autobuild.buildroot.net/results/a9f4a4ce80f85e65bef4df1dfdb96190c0d9127b |     
  riscv64    |      gitlab-runner-14.5.1      | NOK | http://autobuild.buildroot.net/results/978d35998748edec9411000a17836cfff1165f11 |     
    i586     |         host-go-1.19.4         | NOK | http://autobuild.buildroot.net/results/6e84eb97c241294aa8b56cc5d33f66c332b6b013 |     
 aarch64_be  |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/5495393963e181a6f5c993517b08e1dc7e475fcb |     
    m68k     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/01a9241b092ca6018ade3d487a9643cbe6e70f94 |     
 aarch64_be  |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/176261729abae8d3b61bd66c9b838e5d30672b2f |     
   x86_64    |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/6e7e4cec79ab4d100560892c517ce1f48a6a7cb4 |     
    arm      |         libdrm-2.4.113         | NOK | http://autobuild.buildroot.net/results/b9cee4131684d9a485d11b699d5b6482903ce6b9 |     
    arm      |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/949ca7625b5c4570417f3188735c3a65c41c9991 | ORPH
    mips     |      linux-5.10.145-cip17      | NOK | http://autobuild.buildroot.net/results/8f936d3f14acb644050781fdbe417a30d3a1ebb2 | ORPH
  powerpc    |     ltp-testsuite-20220930     | NOK | http://autobuild.buildroot.net/results/6a54d1bcb5f0d7a25b749128a0dad07db1e000f0 |     
  riscv64    |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/2eabb60e85b6576d28d3d4a560e9c61079f7144e | ORPH
   armeb     |           opus-1.3.1           | NOK | http://autobuild.buildroot.net/results/9648835d2e8f527b5b8d67ad99192b1a9342349e | ORPH
   sparc     |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/bb66da4cc8d894198718a77a07c4d23ad7c436cf |     
   mips64    | qt5base-2ffb7ad8a1079a0444b... | NOK | http://autobuild.buildroot.net/results/89bbf8154c669c30492cdf7fbcd79df3116abc21 |     
  mips64el   |        valgrind-3.19.0         | NOK | http://autobuild.buildroot.net/results/210d0756671b300e289a5761649e4236b9292ef2 | ORPH



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
