Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82317EEB57F
	for <buildroot@archiver.kernel.org>; Sat,  9 Sep 2023 06:30:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CE0AD81E9E;
	Sat,  9 Sep 2023 06:30:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CE0AD81E9E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SHqGUv128-ns; Sat,  9 Sep 2023 06:30:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A19D581E37;
	Sat,  9 Sep 2023 06:30:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A19D581E37
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1BA831BF846
 for <buildroot@lists.busybox.net>; Sat,  9 Sep 2023 06:29:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AE75B40A50
 for <buildroot@lists.busybox.net>; Sat,  9 Sep 2023 06:29:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AE75B40A50
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n45_VNQJkIbf for <buildroot@lists.busybox.net>;
 Sat,  9 Sep 2023 06:29:57 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BC64540018
 for <buildroot@buildroot.org>; Sat,  9 Sep 2023 06:29:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BC64540018
Received: by mail.gandi.net (Postfix) with ESMTPSA id D005DE0008
 for <buildroot@buildroot.org>; Sat,  9 Sep 2023 06:29:53 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sat, 09 Sep 2023 06:29:53 -0000
X-GND-Sasl: bot@bootlin.com
Message-Id: <20230909062958.AE75B40A50@smtp2.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1694240993; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=i3Lf1rvFJieiw7F2toxOjr0JK/QtnolE50HbR9LDTNU=;
 b=ZrL5kX5IzVCxKcgsQekXPxQwg1C3EBoy48b8AtN3F2uJZOub6/tV3hwtLUdb3Y8nPfOr2N
 7GipAwfSvBjn2NrqbBetJxY3X14xjQuu449mTASZr/1eOqN1ToJjFlHs7KlvDtqojXf9sh
 pL7VDRjNHyVY3IDw3otfB3IPYdDQ24PvuQXNMc1DZWrgvvOtcrdHqdPNaeZzMAiUCARdOK
 zXUM7Q2WjWYLzYRgXkWWJ04MjnLVW4v4Z/qXhW5HxqfodiuxVQCIfmNFlo7PejYBUO5p6C
 Sq50CF0KzG0McgnS0bfNG+h5+kgC6N1DGKJwhdoBlRQeiOnwyllHP68qCxL/Hw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ZrL5kX5I
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-09-08
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

Autobuild statistics for 2023-09-08
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  |  9  |  4  |  0  | 13  |
  2023.05.x  |  9  |  5  |  0  | 14  |
  2023.08.x  |  4  |  4  |  0  |  8  |
    master   | 54  | 57  |  1  | 112 |

Classification of failures by reason for master
-----------------------------------------------

              libxcrypt-4.4.36 | 9 
                  linux-6.4.14 | 5 
  gobject-introspection-1.76.1 | 3 
                       unknown | 3 
             util-linux-2.39.2 | 3 
                  boost-1.82.0 | 2 
check-11970a7e112dfe243a2e6... | 2 
              host-rust-1.71.1 | 2 
                xenomai-3.0.10 | 2 
               belle-sip-4.4.8 | 1 
                  bind-9.16.42 | 1 
                bpftool-v7.1.0 | 1 
                  cairo-1.16.0 | 1 
                  clamav-1.0.3 | 1 
           dmraid-1.0.0.rc16-3 | 1 
        edk2-edk2-stable202308 | 1 
                     efivar-38 | 1 
              fstrcmp-0.7.D001 | 1 
         gobject-introspection | 1 
         host-gcc-final-12.3.0 | 1 
                host-go-1.21.1 | 1 
             libopenh264-2.3.1 | 1 
     linux-5.10.162-cip24-rt10 | 1 
               linux-pam-1.5.3 | 1 
                   linux-tools | 1 
        ltp-testsuite-20230127 | 1 
                 mesa3d-23.1.6 | 1 
                    ncmpc-0.47 | 1 
                 ogre-v1.12.12 | 1 
                    olsr-0.9.8 | 1 
                   perl-5.36.1 | 1 
                    qemu-8.1.0 | 1 
                     squid-6.2 | 1 
                 uclibc-1.0.44 | 1 
                 wolfssl-5.6.3 | 1 
             zynaddsubfx-3.0.6 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   xtensa    |        belle-sip-4.4.8         | NOK | http://autobuild.buildroot.net/results/0557967783753888e946e9e0de1e9d72a083a27f |     
   xtensa    |          bind-9.16.42          | NOK | http://autobuild.buildroot.net/results/8c535b0d03273760da6f3a9204ec680528eb98c4 | ORPH
    arm      |          boost-1.82.0          | NOK | http://autobuild.buildroot.net/results/df7671e405af34d27fccac64077698c331b611fc |     
    arm      |          boost-1.82.0          | NOK | http://autobuild.buildroot.net/results/566f1296edad05ea661192a661c21512891a1d2a |     
  sparc64    |         bpftool-v7.1.0         | NOK | http://autobuild.buildroot.net/results/7dd352244f3081acd33218a7fc722ece59d715da |     
   xtensa    |          cairo-1.16.0          | NOK | http://autobuild.buildroot.net/results/fbe4e55d3e5487f06ac8d315ff336d9032b331ed |     
  riscv64    | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/bf4ccb9c1b94a0713c7a76ff54762357dc172ac5 | ORPH
    arm      | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/74259903502e0943069bf980aa3116131e6f1128 | ORPH
    arm      |          clamav-1.0.3          | NOK | http://autobuild.buildroot.net/results/2f653f0a6f957b4b0ebeadcc40a88fd9bca6c51d |     
    arm      |      dmraid-1.0.0.rc16-3       | NOK | http://autobuild.buildroot.net/results/89b99f26ecf75593b1b394fcc52c1ec6c67bd75a | ORPH
   x86_64    |     edk2-edk2-stable202308     | NOK | http://autobuild.buildroot.net/results/f519688e20d18cbc57430a57addb790b3aacb848 |     
  aarch64    |           efivar-38            | NOK | http://autobuild.buildroot.net/results/5d34c89c1c8ad2c718d7454aa214e812e68c7722 |     
  powerpc    |        fstrcmp-0.7.D001        | NOK | http://autobuild.buildroot.net/results/67b15c04cc52a4d3bbba759a51e66425dafd75b0 |     
   armeb     |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/1485b730cfea3b0e1a0614f326807f197f9391a7 |     
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/cc61208e3cbe374fce8f154f24e73d82b0b7a21d | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/2b8014166962bc2be15af3617420c8a7ec1155d7 | ORPH
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/4e7af961e17975d1c9f6e3a6d347db3d009077d4 | ORPH
microblazeel |     host-gcc-final-12.3.0      | NOK | http://autobuild.buildroot.net/results/91a204c31363352bb6c937d392724fdac207d950 |     
   mipsel    |         host-go-1.21.1         | NOK | http://autobuild.buildroot.net/results/810e095a65d54cdb8521d8e1c4347958265849a0 |     
   s390x     |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/c272c5f199f18e78231822b6bf40e19aed5e4d98 |     
powerpc64le  |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/aaeb5ff4ae5491242ca041ec03f0e4f3b885c69c |     
   mipsel    |       libopenh264-2.3.1        | NOK | http://autobuild.buildroot.net/results/8ca58005adb24dda14bc0f224766a13c63802dfa |     
    m68k     |        libxcrypt-4.4.36        | NOK | http://autobuild.buildroot.net/results/7f7ec74e80cd1ab782d87f5db3e4631c12611101 |     
    m68k     |        libxcrypt-4.4.36        | NOK | http://autobuild.buildroot.net/results/860a8bdd965f021dde20374cf3a5815748c985de |     
  sparc64    |        libxcrypt-4.4.36        | NOK | http://autobuild.buildroot.net/results/22cdd4de0183e6f1e56909831fc3050e69977744 |     
   armeb     |        libxcrypt-4.4.36        | NOK | http://autobuild.buildroot.net/results/fe7622484e7d3e22ed17071ef36fe9a0f69db74a |     
  aarch64    |        libxcrypt-4.4.36        | NOK | http://autobuild.buildroot.net/results/a8a367960b109b286264ef8f983c209d3d9c732d |     
 microblaze  |        libxcrypt-4.4.36        | NOK | http://autobuild.buildroot.net/results/7e5b288783fec7ee715ce7deb1ce82e89f83c750 |     
    arc      |        libxcrypt-4.4.36        | NOK | http://autobuild.buildroot.net/results/50861b83fbc78db252e888124521f361038acfec |     
    arm      |        libxcrypt-4.4.36        | NOK | http://autobuild.buildroot.net/results/14b34c6bf7dc25948a0dc888f46846ca16e9f8dc |     
    arm      |        libxcrypt-4.4.36        | NOK | http://autobuild.buildroot.net/results/6bc0e6004e8d51b1b847e6461f5f994ed04cce22 |     
    mips     |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/e4ce7c84cd8446204dc78835b334a4d95a227caf | ORPH
   nios2     |          linux-6.4.14          | NOK | http://autobuild.buildroot.net/results/d1817c72bfd02b1ab2867a8b76b001e9f4d9ae7b | ORPH
 aarch64_be  |          linux-6.4.14          | NOK | http://autobuild.buildroot.net/results/543c1173d408aaa6f292ed8ccecf71f58135abe7 | ORPH
 powerpc64   |          linux-6.4.14          | NOK | http://autobuild.buildroot.net/results/d6d0752a4285a1ca00e61c0823943371b187ec0a | ORPH
    or1k     |          linux-6.4.14          | NOK | http://autobuild.buildroot.net/results/b780bf13a7e2484febaf1b1b1a905ebce32965f7 | ORPH
   mips64    |          linux-6.4.14          | NOK | http://autobuild.buildroot.net/results/95ea81c37cf5ae3d8a6a4a6674680500f37f32df | ORPH
   arceb     |        linux-pam-1.5.3         | NOK | http://autobuild.buildroot.net/results/9c1761f1e3b0ad7b5c4081e949a04352e70c867a | ORPH
   x86_64    |          linux-tools           | NOK | http://autobuild.buildroot.net/results/9084775b72ec93062848789533ad080a5071c6cc | ORPH
  riscv32    |     ltp-testsuite-20230127     | NOK | http://autobuild.buildroot.net/results/08ed5bb235f2e21dfd20d912e28503d0231f9d20 |     
    mips     |         mesa3d-23.1.6          | NOK | http://autobuild.buildroot.net/results/b5319c0a714b235ffeee8a19007b84fca75467b7 |     
    arm      |           ncmpc-0.47           | NOK | http://autobuild.buildroot.net/results/36eab556fac80124755bff4110af3e43fe6edd78 |     
  powerpc    |         ogre-v1.12.12          | NOK | http://autobuild.buildroot.net/results/d2f9fe9c6ccbb952fcf00865a040f896a3930695 |     
microblazeel |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/8e565fee80f6a57df68a2af67de1a1a9c19c0965 | ORPH
    arc      |          perl-5.36.1           | NOK | http://autobuild.buildroot.net/results/19a1981d18995932b1de604400a396e7217ccc72 |     
    mips     |           qemu-8.1.0           | NOK | http://autobuild.buildroot.net/results/9b9419b9a940d6888dde47542916f6cc4bb2cbf7 |     
  mips64el   |           squid-6.2            | NOK | http://autobuild.buildroot.net/results/d19cfda759cf38da5c025232369d4b6b707b94db | ORPH
  riscv64    |         uclibc-1.0.44          | NOK | http://autobuild.buildroot.net/results/10e0ebec7b9a9530f3d6d89e65b20b81af8c77c4 |     
   s390x     |            unknown             | NOK | http://autobuild.buildroot.net/results/6381ae6c58b4ac52c0693c159292243d65549db5 |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/4eed769ec1f317356a9a973e122ce87ad1ba7e5c |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/76710ee52aa3b0a8281484d5475e5e36a082d548 |     
    arm      |       util-linux-2.39.2        | NOK | http://autobuild.buildroot.net/results/8862d4535c0373bf51f5acd3d795ae8444844a82 | ORPH
  powerpc    |       util-linux-2.39.2        | NOK | http://autobuild.buildroot.net/results/3727139cdc15d9f3880b0401ddd1b5bcac11704c | ORPH
    i686     |       util-linux-2.39.2        | NOK | http://autobuild.buildroot.net/results/ea54aeecf6dad6392b9dc43d6ef0e742547912fd | ORPH
    arm      |         wolfssl-5.6.3          | NOK | http://autobuild.buildroot.net/results/d24e3d42263559fa1dc96a7d8043282587fcf423 |     
   armeb     |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/1a052be89039e80f48648e4c5e96eb0a20a34234 |     
   x86_64    |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/89f80e6133222f2ff07a389b3c48a868344cacc7 |     
    or1k     |       zynaddsubfx-3.0.6        | NOK | http://autobuild.buildroot.net/results/97b5a30c7be820ac91e745cf60f9b759e962aa5c |     


Classification of failures by reason for 2023.02.x
--------------------------------------------------

                  check-0.15.2 | 1 
              host-rust-1.67.1 | 1 
                  linux-6.1.42 | 1 
                       unknown | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |          check-0.15.2          | NOK | http://autobuild.buildroot.net/results/01addd92b9fe166743c355707c870c22a1ca684b | ORPH
   s390x     |        host-rust-1.67.1        | NOK | http://autobuild.buildroot.net/results/5dcb4a6d28af263a828adb6d308884b839812618 |     
 powerpc64   |          linux-6.1.42          | NOK | http://autobuild.buildroot.net/results/3f219ba421e9340498dd23abe1bf0c574a9382c0 | ORPH
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/9c44217cdcd14350c9c5bc4eeb862c67a0b38baf |     


Classification of failures by reason for 2023.05.x
--------------------------------------------------

                    attr-2.5.1 | 1 
                elfutils-0.186 | 1 
              liquid-dsp-1.4.0 | 1 
                lua-cffi-0.2.3 | 1 
                ramspeed-2.6.0 | 1 


Detail of failures for 2023.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mips64    |           attr-2.5.1           | NOK | http://autobuild.buildroot.net/results/c1152183b3cb49b632fb96c763a966cd98958ad3 |     
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/d272597a52cfe91714f5c0d46b1963a862ea70ce | ORPH
    arm      |        liquid-dsp-1.4.0        | NOK | http://autobuild.buildroot.net/results/b1099cb6b1b959fbc85da26a3f0ab44765e196ce |     
    or1k     |         lua-cffi-0.2.3         | NOK | http://autobuild.buildroot.net/results/f47e9bbaccef321b09fe3003aec7e764318ff17a |     
   sh4eb     |         ramspeed-2.6.0         | NOK | http://autobuild.buildroot.net/results/6befff07cd7d915855c8abfc5af573382e1b6d08 | ORPH


Classification of failures by reason for 2023.08.x
--------------------------------------------------

                  ffmpeg-4.4.4 | 1 
             glibmm2_66-2.66.6 | 1 
                libressl-3.7.3 | 1 
                       unknown | 1 


Detail of failures for 2023.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |          ffmpeg-4.4.4          | NOK | http://autobuild.buildroot.net/results/dfce10c0ab44deeebf9fe081958db79a1b75d6ef |     
   sparc     |       glibmm2_66-2.66.6        | NOK | http://autobuild.buildroot.net/results/ff5973540f21fa5d3607249fdd41b12a3ad2bfd6 |     
    arm      |         libressl-3.7.3         | NOK | http://autobuild.buildroot.net/results/49409d3a0304adc7420ca7c4ffa82b68e33980ec | ORPH
    mips     |            unknown             | NOK | http://autobuild.buildroot.net/results/e0f290dd3b95ae2b10723600836ced0515e57fda |     


Gitlab CI results for 2023-09-08
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
                          beaglev | https://gitlab.com/buildroot.org/buildroot/-/jobs/5037054947  |      
              freescale_imx8mmevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/5037054970  |      
              freescale_imx8mnevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/5037054971  |      
              freescale_imx8mpevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/5037054972  |      
              freescale_imx8mqevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/5037054973  |      
              freescale_imx8qmmek | https://gitlab.com/buildroot.org/buildroot/-/jobs/5037054974  |      
             freescale_imx8qxpmek | https://gitlab.com/buildroot.org/buildroot/-/jobs/5037054975  |      
                       imx8mmpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/5037055003  |      
                        imx8mpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/5037055007  |      
                        imx8mqevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/5037055010  |      
               kontron_pitx_imx8m | https://gitlab.com/buildroot.org/buildroot/-/jobs/5037055012  |      
                       ls1028ardb | https://gitlab.com/buildroot.org/buildroot/-/jobs/5037055023  |      
              octavo_osd32mp1_brk | https://gitlab.com/buildroot.org/buildroot/-/jobs/5037055052  |      
              octavo_osd32mp1_red | https://gitlab.com/buildroot.org/buildroot/-/jobs/5037055054  |      
       olimex_a20_olinuxino_lime2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5037055063  |      
                   orangepi_lite2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5037055077  |      
                orangepi_one_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/5037055083  |      
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/5037055199  | ORPH 
               snps_arc700_axs101 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5046557265  |      
                socrates_cyclone5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5046557391  |      
                  stm32mp157a_dk1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5046557575  |      
                  stm32mp157c_dk2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5046557626  |      
              toradex_apalis_imx6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5046557718  |      
                      visionfive2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5046557891  |      



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
