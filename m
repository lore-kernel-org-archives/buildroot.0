Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E4B9C64EC7
	for <buildroot@archiver.kernel.org>; Sat, 25 Feb 2023 07:39:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8C3FE82027;
	Sat, 25 Feb 2023 07:39:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8C3FE82027
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hbIb5TAcCWgZ; Sat, 25 Feb 2023 07:39:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 448388202F;
	Sat, 25 Feb 2023 07:39:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 448388202F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E44D51BF33E
 for <buildroot@lists.busybox.net>; Sat, 25 Feb 2023 07:39:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A5D7E60E4E
 for <buildroot@lists.busybox.net>; Sat, 25 Feb 2023 07:39:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A5D7E60E4E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ge2s05y9UrlG for <buildroot@lists.busybox.net>;
 Sat, 25 Feb 2023 07:39:40 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2471F60BFF
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2471F60BFF
 for <buildroot@buildroot.org>; Sat, 25 Feb 2023 07:39:39 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id AF5041BF20F
 for <buildroot@buildroot.org>; Sat, 25 Feb 2023 07:39:36 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sat, 25 Feb 2023 07:39:36 -0000
Message-Id: <20230225073943.A5D7E60E4E@smtp3.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1677310776; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=9d511mpttbextPEKom47qvhrnCJfnpDrXBq5i6l3xXw=;
 b=oY7/HeuMfboRq6TjySy4o7DR8/I5Ae6k/a5SPlUjVxveqGU++HBipES2Wz7FqYGVkAw2ae
 djvsLRVIkJBdv4pQaREkzO1PPUHQOu23j+n77zPQjyM/bbfKbjg1C7RcVw6UD9JXPJJnRB
 Sse5eOGjBlItNq579V6exagUGLOxPTCY1qqfcwVbsR4GdquCTuVO792jpvkQPKiUvuoQZO
 GeDl+wXT6Te5b6aRck/OtWeFrefy3ymZaOTCowHwqmtcZYOJgSrvAcoOzKlHA1itjtV9D2
 s+/JnWfc8jcWlS/23kxkt7o1KW+L30M6uIIOHJBPiZlEywPBavUAulkuYhmu+A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=oY7/HeuM
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-02-24
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

Autobuild statistics for 2023-02-24
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.11.x  | 10  | 17  |  0  | 27  |
    master   | 146 | 124 |  0  | 270 |
     next    | 13  | 21  |  0  | 34  |

Classification of failures by reason for master
-----------------------------------------------

  gobject-introspection-1.72.0 | 9 
                host-go-1.19.6 | 7 
                elfutils-0.186 | 6 
glibc-2.36-81-g4f4d7a13edfd... | 6 
              host-pahole-1.24 | 6 
           python-numpy-1.23.5 | 5 
                 systemd-252.4 | 4 
            host-binutils-2.38 | 3 
             lirc-tools-0.10.2 | 3 
                  netsurf-3.10 | 3 
ulog-0389d243352255f6182326... | 3 
               libcap-ng-0.8.3 | 2 
              libgcrypt-1.10.1 | 2 
               libglib2-2.72.3 | 2 
     linux-5.10.162-cip24-rt10 | 2 
       network-manager-1.40.10 | 2 
                  ntpsec-1_2_2 | 2 
                    olsr-0.9.8 | 2 
                    sdl-1.2.15 | 2 
                       unknown | 2 
android-tools-4.2.2+git2013... | 1 
              asterisk-16.29.1 | 1 
             dahdi-linux-3.2.0 | 1 
                   duma-2.5.15 | 1 
                 fdk-aac-2.0.2 | 1 
               fftw-quad-3.3.8 | 1 
                flannel-0.14.0 | 1 
             fontconfig-2.13.1 | 1 
fs/axfs/axfs.mk:32: /tmp/in... | 1 
fs/cramfs/cramfs.mk:46: /tm... | 1 
fs/ubi/ubi.mk:51: /home/tho... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
hawktracer-2ec19d7192334414... | 1 
            host-binutils-2.37 | 1 
            host-binutils-2.39 | 1 
                 host-wine-7.0 | 1 
           intel-gmmlib-22.3.3 | 1 
                  janet-1.26.0 | 1 
                  kexec-2.0.25 | 1 
kvmtool-f77d646ba01d04be5aa... | 1 
              libblockdev-2.26 | 1 
              libcamera-v0.0.4 | 1 
                    libev-4.33 | 1 
           libfreeimage-3.18.0 | 1 
             libgpg-error-1.46 | 1 
                   libnl-3.7.0 | 1 
                  linux-6.1.11 | 1 
          lttng-modules-2.13.7 | 1 
                  nginx-1.22.1 | 1 
                  ntp-4.2.8p15 | 1 
   openvmtools-11.3.5-18557794 | 1 
package/multipath-tools/mul... | 1 
                   pcre2-10.42 | 1 
                   perl-5.36.0 | 1 
                     php-8.2.3 | 1 
           proxychains-ng-4.16 | 1 
           python-bcrypt-4.0.1 | 1 
           python-orjson-3.8.4 | 1 
            quickjs-2021-03-27 | 1 
              rsyslog-8.2204.1 | 1 
              skalibs-2.12.0.1 | 1 
uclibc-ng-test-6790eafe897b... | 1 
uqmi-0a19b5b77140465c29e2af... | 1 
                 wolfssl-5.5.3 | 1 
               xfsprogs-5.14.2 | 1 
                  zabbix-6.2.7 | 1 
                    zeek-4.1.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 powerpc64   | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/f7b3e83b2aa61d6d0176b2c788acdc08c6d254b4 |     
   x86_64    |        asterisk-16.29.1        | NOK | http://autobuild.buildroot.net/results/e3d9da661b02236c7306d30bcff5386759da17b2 |     
   x86_64    |       dahdi-linux-3.2.0        | NOK | http://autobuild.buildroot.net/results/a4eacc63a9d3948db260a56aae77beaac04a04ca |     
  sparc64    |          duma-2.5.15           | NOK | http://autobuild.buildroot.net/results/553e673cb404f62f03d20a6e58b528d13f5a072f | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/3544ba3422612db91a11377d362ec2b2a4fd6e29 | ORPH
   arceb     |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/939128e3080768d5ad2caef2dde8f0277e9c468e | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/0ca940b239a41333481ce07e9a6f3f15c64f177b | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/a5f372c6c858fb78b3e9078d961b6482f73fb6d4 | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/02b5daebba4b6c87168039bd9e4dcd51719e6557 | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/63e0c08e4651f11ced53bd7818d2d1134404dd61 | ORPH
   mipsel    |         fdk-aac-2.0.2          | NOK | http://autobuild.buildroot.net/results/2dcfb380b4187ad02b88bde9e6702f3e726b6cf8 |     
powerpc64le  |        fftw-quad-3.3.8         | NOK | http://autobuild.buildroot.net/results/066433efe70c5662c932fdf80bd307205a0969bb | ORPH
   s390x     |         flannel-0.14.0         | NOK | http://autobuild.buildroot.net/results/6a517df1a1575a2796c7a59d12869b2d24e2a715 |     
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/b3a9d140c76ac7a5edadab7b71929cf5f056d6ac | ORPH
   s390x     | fs/axfs/axfs.mk:32: /tmp/in... | NOK | http://autobuild.buildroot.net/results/0cc980f29478575d6db5ed9ffbc98c10729f8d4d |     
 aarch64_be  | fs/cramfs/cramfs.mk:46: /tm... | NOK | http://autobuild.buildroot.net/results/4b3ebdc8af9576e7e8fd7b487a35aa164be7c55f |     
  mips64el   | fs/ubi/ubi.mk:51: /home/tho... | NOK | http://autobuild.buildroot.net/results/4ff0ff4ecc2ac7b8e4f00c08af3a5014bd92cbcc |     
powerpc64le  | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/f35c21732c3f9fde6a80963b98c1f8e9974986a7 |     
 powerpc64   | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/5a370c0ff0011ebf559a0faa46ad487b67abba0d |     
   mips64    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/60ae6c0a8926ebd284f61cb6a0a6cee423d84c6a |     
microblazeel | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/181664494ee18a77d327e24bc5b184e7ac84ae75 |     
    i686     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/0a32ab120903f77a03c8dae0bf5438862b53b55e |     
  powerpc    | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/e46add0564797e425a292ac9ce80aa58e6b498a0 |     
  powerpc    | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/19b1dc6fea570914c8034d9f0471959dc03dfdf8 |     
  riscv64    | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/b4f78c046112edb9fab1e576bd547352430e6054 |     
  powerpc    | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/d74f0401d25942770bb5aa66dd62f17a63eeee03 |     
   arceb     | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/5a5e2093b317b4d44cbec4cf2b9ab38340676d8e |     
  powerpc    | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/f6eb1199e3639fca53ba22eda2a79bd62d23abd7 |     
   mipsel    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/1569485719ad0e6c61164012988b9aeabd98a306 | ORPH
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/caefad691bf88a6a18ad947129ef015a0239f659 | ORPH
    or1k     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/cb9a5b322c8e2edb3e80a80a918d23541ddd0b45 | ORPH
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/baa186a92d06a24cefb54602201354c1dad5988b | ORPH
 powerpc64   |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/f2770f474bcc553deea2c3088ef03174e3714a5a | ORPH
 microblaze  |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/52460aa74e2ac681b6f88f7dd28d16612f9a9df1 | ORPH
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/acd635636d6d5ed99843598518e5578747eeda35 | ORPH
    or1k     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/788acda9badd553f6a2e2b569b59eb87c0e1a61d | ORPH
    or1k     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/bfc1b7b6a412ad72490b2b33511c4d07aaae06f3 | ORPH
powerpc64le  | hawktracer-2ec19d7192334414... | NOK | http://autobuild.buildroot.net/results/3002d6cde21a49fa82c48e72c6bb9a112724032a |     
    mips     |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/f6354e3351fd9408d9449db973d1ee40d1460d71 |     
  mips64el   |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/5a67c70100e6eb4f839fa41f942d7be117a3fcf0 |     
  sparc64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/2cbad4f71884a20c57724c15a00d3fd8702c1225 |     
 powerpc64   |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/eb6fc3e1ba14911bf22f6af788f6d64c5bd057c5 |     
  sparc64    |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/102d4e7ed503b12760d63461ba9fde6aa514b01f |     
  mips64el   |         host-go-1.19.6         | NOK | http://autobuild.buildroot.net/results/8c217b8b081267665b95cc09ca5f9257cb67d3e7 |     
   mips64    |         host-go-1.19.6         | NOK | http://autobuild.buildroot.net/results/8701f281e6c19c58e0fff3730c296ebe06bc6cd3 |     
powerpc64le  |         host-go-1.19.6         | NOK | http://autobuild.buildroot.net/results/e595f8156eb5ae79448622f516da1ca85bd1c6c4 |     
  riscv64    |         host-go-1.19.6         | NOK | http://autobuild.buildroot.net/results/7f29b6db185d1d8aef51893ba638bee6702adbe4 |     
    i686     |         host-go-1.19.6         | NOK | http://autobuild.buildroot.net/results/bb0ee79e4c101c3bf52ade4c6ef2475b8325209e |     
   mips64    |         host-go-1.19.6         | NOK | http://autobuild.buildroot.net/results/c6f58ae9c1ec2d13073d8085aeb126b47d63c37f |     
powerpc64le  |         host-go-1.19.6         | NOK | http://autobuild.buildroot.net/results/02ef299a16a8f42e298ffab70856ec994a9ca2ab |     
    arc      |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/75441f53bd62d3de3a588887a806ae7eba2bdbd0 |     
  mips64el   |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/77df82bf0ec4947809c5ecf6d7d448c009dd3e3e |     
    arc      |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/57a7b16a9b1878f88bb051b5b8a28fba1cf9c081 |     
    m68k     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/e142bc1e79edb8c9da462057d7ff248d7ce7df43 |     
   x86_64    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/bd8722008628f1138a324578af54060220d9cf99 |     
  aarch64    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/d594fbd8a98528349f3e37e07ae0987f7abc23a7 |     
    i686     |         host-wine-7.0          | NOK | http://autobuild.buildroot.net/results/e60d8a433cd8352ef3df875210583aba24bb4444 |     
   x86_64    |      intel-gmmlib-22.3.3       | NOK | http://autobuild.buildroot.net/results/813da152d8e22778132e208902421e61f760d01e |     
  mips64el   |          janet-1.26.0          | NOK | http://autobuild.buildroot.net/results/265720597fa22d1447f0ff6a0a02a057980682b3 |     
    arm      |          kexec-2.0.25          | NOK | http://autobuild.buildroot.net/results/59a3259aa9574cd48f1814325597059707e3d089 | ORPH
    i686     | kvmtool-f77d646ba01d04be5aa... | NOK | http://autobuild.buildroot.net/results/a51055f15636cfeeb01d1fcdb48b6cc2a61bfe6a | ORPH
   sparc     |        libblockdev-2.26        | NOK | http://autobuild.buildroot.net/results/ede9eb1f13d56c77005cc448416fb2efa9d16ff0 | ORPH
    or1k     |        libcamera-v0.0.4        | NOK | http://autobuild.buildroot.net/results/f3586ebc835dd189bc0335dd89858133c5423808 |     
  riscv64    |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/12d7aa8e2b8b7e0ce10360186d4be955881ceb34 |     
  riscv64    |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/2f2785f4c05e6b91b6259d010782cd560ec0b478 |     
   armeb     |           libev-4.33           | NOK | http://autobuild.buildroot.net/results/b348d0669e34218b5ada73a344382cb2b26cd718 | ORPH
    mips     |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/180cea9806fff2d8e022dd9fac313a5877376022 |     
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/6b13dfb9122403696430ce3c10a15c4588e0d47b | ORPH
    arm      |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/8cb64e800a7ecd7dcdeb80142ab56a8a6f251028 | ORPH
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/06fdc4bb89f895933364f614f92609d88978575d |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/78abc1140800e1eda13e66e9a92b5a35563c5b2c |     
 aarch64_be  |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/2592972d3b9b16d3de7172b62edb21606aabd183 | ORPH
   mips64    |          libnl-3.7.0           | NOK | http://autobuild.buildroot.net/results/a357e480781bd58364b5fdc958f5a975fbb3f427 | ORPH
   nios2     |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/9b184ba9bc88727747d36873e20d243443fb0f08 | ORPH
 microblaze  |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/8212366e7f8a53a48f86614453bafb5f0e1f5085 | ORPH
  riscv32    |          linux-6.1.11          | NOK | http://autobuild.buildroot.net/results/9e070a2822f3ee339704482a2f028ad4b9cfd70b | ORPH
  sparc64    |       lirc-tools-0.10.2        | NOK | http://autobuild.buildroot.net/results/a59f6d3e509bf5bd09974a8417fe19e4b1ea3c32 | ORPH
   mipsel    |       lirc-tools-0.10.2        | NOK | http://autobuild.buildroot.net/results/cf377a92f4df3f82960507784b33491d0261282b | ORPH
   sparc     |       lirc-tools-0.10.2        | NOK | http://autobuild.buildroot.net/results/85359d3f678b49e46821a1c10da5f14edfb5e6d0 | ORPH
 aarch64_be  |      lttng-modules-2.13.7      | NOK | http://autobuild.buildroot.net/results/c73232a7fea00db72606be54dd5d98d47bf44a55 |     
 aarch64_be  |          netsurf-3.10          | NOK | http://autobuild.buildroot.net/results/bcb48536431046eb7531debbfa55ab861b5e6bfe |     
   nios2     |          netsurf-3.10          | NOK | http://autobuild.buildroot.net/results/5c4f6d3926913daab6aa8c787e8cc737635e6338 |     
  sparc64    |          netsurf-3.10          | NOK | http://autobuild.buildroot.net/results/81844aeadcedf73179f9f9fd3ecb5d76ec31c332 |     
   sh4aeb    |    network-manager-1.40.10     | NOK | http://autobuild.buildroot.net/results/8739deb2a7b9de4257e3f10cebad258d67275ced | ORPH
 powerpc64   |    network-manager-1.40.10     | NOK | http://autobuild.buildroot.net/results/f8483b98d1038029b0de34b3fed9365184cd6818 | ORPH
 powerpc64   |          nginx-1.22.1          | NOK | http://autobuild.buildroot.net/results/9033346dd04c9c9cf307400eca7a235298115135 |     
  riscv64    |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/7f96b486b541819bb7d9a59494f427e0198315f2 | ORPH
    i686     |          ntpsec-1_2_2          | NOK | http://autobuild.buildroot.net/results/f38abc6b7f8464836231192cfe078a5b27319a8a | ORPH
    m68k     |          ntpsec-1_2_2          | NOK | http://autobuild.buildroot.net/results/5470b3f8b163f5ae2d10abca181f4d0feba6598e | ORPH
   nios2     |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/7663b4fe18289c4da8b7073c6f3d3e11cdf1f700 | ORPH
    arc      |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/47a22c0deacfb57b3cfb2d7fa19dd3f940bdc927 | ORPH
   x86_64    |  openvmtools-11.3.5-18557794   | NOK | http://autobuild.buildroot.net/results/2328c77a20eb00dbaed6546a8df44fef183acfe2 |     
  sparc64    | package/multipath-tools/mul... | NOK | http://autobuild.buildroot.net/results/a1807f038f7fa400963fd7115653568ca804d0c5 |     
   sparc     |          pcre2-10.42           | NOK | http://autobuild.buildroot.net/results/5b7d05fa4ab80b51929fa42850b01f70c37e2ae1 | ORPH
    arm      |          perl-5.36.0           | NOK | http://autobuild.buildroot.net/results/df4c18a050464482d14719627ffcf87e4bcd5b48 |     
microblazeel |           php-8.2.3            | NOK | http://autobuild.buildroot.net/results/3c44e4fda8faa23c5fd033f6082b1c2a0e71c238 |     
  mips64el   |      proxychains-ng-4.16       | NOK | http://autobuild.buildroot.net/results/69677ea90d1229ec900010a3e8bb4a6d887ae176 | ORPH
  mips64el   |      python-bcrypt-4.0.1       | NOK | http://autobuild.buildroot.net/results/c52abc122b805f1c16a42d8979a90e7ab05a34ee |     
  aarch64    |      python-numpy-1.23.5       | NOK | http://autobuild.buildroot.net/results/46e68772eb2d73630ea3eca2d16371e1889ef2bd |     
   mipsel    |      python-numpy-1.23.5       | NOK | http://autobuild.buildroot.net/results/cbd23821abb15237e1bee3a1d237348ffe92d893 |     
  powerpc    |      python-numpy-1.23.5       | NOK | http://autobuild.buildroot.net/results/812191aaf0c241a776bee984096142fd7bccf9e6 |     
    mips     |      python-numpy-1.23.5       | NOK | http://autobuild.buildroot.net/results/2f64df95a38c7a217674ac1a14498871778a0896 |     
    sh4      |      python-numpy-1.23.5       | NOK | http://autobuild.buildroot.net/results/172a312de5cf03aea85d1bc29dbee499411384c0 |     
    mips     |      python-orjson-3.8.4       | NOK | http://autobuild.buildroot.net/results/0a91bd206cd114c075cc0ef3f328c2372f33cec5 |     
   sh4aeb    |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/56e98b1b1ab804c58b677d9557b145f026d723f0 |     
   arceb     |        rsyslog-8.2204.1        | NOK | http://autobuild.buildroot.net/results/1d07cd52ef2da7fb00a79e722a8d9edbf04569ae | ORPH
   sh4eb     |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/20271dbd5f31dd87766179f9e25d8a2eadfec8f9 | ORPH
    sh4a     |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/0ede8b97d66a729f9c2a3fe447c8c56fdd05251e | ORPH
    or1k     |        skalibs-2.12.0.1        | NOK | http://autobuild.buildroot.net/results/3911f194418ffbafee61db9d9b3179f249a233a7 |     
  sparc64    |         systemd-252.4          | NOK | http://autobuild.buildroot.net/results/4192f18c053b268238a66e7231434637ef35fbc6 |     
   s390x     |         systemd-252.4          | NOK | http://autobuild.buildroot.net/results/a6d563cd65f40816a73b7f237e011492841f40f1 |     
  mips64el   |         systemd-252.4          | NOK | http://autobuild.buildroot.net/results/33da864a48a289234b9eeb9d4e6821dc6643573e |     
powerpc64le  |         systemd-252.4          | NOK | http://autobuild.buildroot.net/results/f05d1d44a0f667eeb63cb9c906416019988e1f21 |     
  mips64el   | uclibc-ng-test-6790eafe897b... | NOK | http://autobuild.buildroot.net/results/47b5a5b3a938ade6773062bdfb47906e2da9b91f |     
  sparc64    | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/03bf110beb45ab746093520cd9b8ba6a51661a1f |     
 aarch64_be  | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/8cffe81496d1c77dab4ad30fb13bbc2776ebf50a |     
   sh4aeb    | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/8acdfcc0a50caf73966af0138565cc2f85206539 |     
  sparc64    |            unknown             | NOK | http://autobuild.buildroot.net/results/229e85b778e84e4cb5672a113939cf983edbe542 |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/3aedf3b5c0cb7e924fa01518302ca677d891638f |     
  mips64el   | uqmi-0a19b5b77140465c29e2af... | NOK | http://autobuild.buildroot.net/results/1858135e0042ca51251ce8a94a2e34a5ca66e41b | ORPH
   mipsel    |         wolfssl-5.5.3          | NOK | http://autobuild.buildroot.net/results/3bfa444ea08baa704f2ea54b9d7102fd42ed3523 |     
  mips64el   |        xfsprogs-5.14.2         | NOK | http://autobuild.buildroot.net/results/bf0909ffafbc4802bfca1c661c7ff50470b1a53f | ORPH
    mips     |          zabbix-6.2.7          | NOK | http://autobuild.buildroot.net/results/acdfcb17b39d438ccf5e4621707a10f60577d233 |     
   sparc     |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/45387d5aa0f08c1db137b0e639e9e67cbf06d956 |     


Classification of failures by reason for next
---------------------------------------------

           python-numpy-1.23.5 | 3 
glibc-2.36-81-g4f4d7a13edfd... | 2 
                host-go-1.19.6 | 2 
                elfutils-0.186 | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
                gnu-efi-3.0.15 | 1 
            host-binutils-2.38 | 1 
            host-binutils-2.39 | 1 
              host-pahole-1.24 | 1 
               libcap-ng-0.8.3 | 1 
               libglib2-2.72.3 | 1 
           optee-client-3.19.0 | 1 
            quickjs-2021-03-27 | 1 
             stress-ng-0.13.05 | 1 
                 systemd-252.4 | 1 
toolchain-external-codescap... | 1 
                       unknown | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/073d029087bc2506070862cb7f0c6d9bfc387f6c | ORPH
  powerpc    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/deea68496b6c9da3f8da9b5dd5ec3b7e171e1338 |     
  powerpc    | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/e8671855fba77240348f8d789a5668ad40b881b7 |     
powerpc64le  | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/dc86ab1036fabf1e760af4e27cf47f7c34b5d472 |     
  mips64el   |         gnu-efi-3.0.15         | NOK | http://autobuild.buildroot.net/results/148215fa2fac98eb0d71ac0f34a0230c16bfb8e8 |     
 microblaze  |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/6df3b13ddf1ccb33c3c8660e103f7d3676da21e0 |     
   mips64    |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/23d52d9c5c6d5c10e868c24e65debfcd6b3fc122 |     
  mips64el   |         host-go-1.19.6         | NOK | http://autobuild.buildroot.net/results/77823d7ff448adbb154fe9e57f3dde60e742af47 |     
  mips64el   |         host-go-1.19.6         | NOK | http://autobuild.buildroot.net/results/95555037cf97ed6c3bf8c320ee73072207e9b283 |     
    arc      |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/d7953cedc8f3356036d18586e0f8d51aaddf3424 |     
  riscv64    |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/c0ec92ef2ba15104e7b8bc84acaff567ab73ba5d |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/86fbfc77f10d94c97b145d8b0a4b282e507a55c5 |     
   arceb     |      optee-client-3.19.0       | NOK | http://autobuild.buildroot.net/results/649cfd5c375e83af0ac3913ae883ca86dd4026e8 |     
    arm      |      python-numpy-1.23.5       | NOK | http://autobuild.buildroot.net/results/994d9de3f78bd576295395e96d6d6e9fca8c1779 |     
  powerpc    |      python-numpy-1.23.5       | NOK | http://autobuild.buildroot.net/results/a21660b39ea2d6d41652247e5b71a584d8fd895b |     
    mips     |      python-numpy-1.23.5       | NOK | http://autobuild.buildroot.net/results/7cde446f1ba174490ad65b1aa88beeaa41502b2f |     
 microblaze  |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/e40640b1d51a80130873da3a5b40a20b0534beda |     
   sparc     |       stress-ng-0.13.05        | NOK | http://autobuild.buildroot.net/results/d217493756824318ffdc48767cf8a3577cfcdd80 |     
  sparc64    |         systemd-252.4          | NOK | http://autobuild.buildroot.net/results/8db81160b19e4f7e58d213883b0ce5683ea7e497 |     
   mips64    | toolchain-external-codescap... | NOK | http://autobuild.buildroot.net/results/437786d42025034193c30dc4bf6d8721c6b9e8ab | ORPH
powerpc64le  |            unknown             | NOK | http://autobuild.buildroot.net/results/e1cd48b17ec8beb72a5675e817bd0394a4132f4a |     


Classification of failures by reason for 2022.11.x
--------------------------------------------------

              host-rust-1.64.0 | 3 
            host-binutils-2.38 | 2 
              host-pahole-1.24 | 2 
                elfutils-0.186 | 1 
                     frr-8.3.1 | 1 
  gobject-introspection-1.72.0 | 1 
gummiboot-2bcd919c681c952eb... | 1 
               libglib2-2.72.3 | 1 
        s6-linux-utils-2.6.0.0 | 1 
ulog-0389d243352255f6182326... | 1 
                       unknown | 1 
                 wolfssl-5.5.3 | 1 
                      xz-5.2.7 | 1 


Detail of failures for 2022.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/8331c8b9780552fa3f0088488d2b3643d80b54ec | ORPH
   arceb     |           frr-8.3.1            | NOK | http://autobuild.buildroot.net/results/fe1e945b5627f8d601c55af5d3e4a55e40d908af |     
    i686     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/d7380c8442d4c1c3428f61c87c2a1d6728e70ca6 | ORPH
   x86_64    | gummiboot-2bcd919c681c952eb... | NOK | http://autobuild.buildroot.net/results/a270cd4cd5a75a344e8af735e2746a5d149ea181 |     
   mipsel    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/390e91c1b6b780cefa8f2287ef9e08aab73c5249 |     
 aarch64_be  |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/f28017f2486b959f1e330683f88e310ec6215b3c |     
    mips     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/0f90bd3691c16bb66c25d85f330430a82de15cae |     
   nios2     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/387d27fc29e8ea039436496abbc825b40cd12583 |     
  sparc64    |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/1e100d56271d0b84844cc16130fb60edf3d03056 |     
   armeb     |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/5572adce8e555d9cb9b213729cb08ef490e13c79 |     
    mips     |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/381e5c4660303c82ee0d3eb54dcb30f6a3f9a778 |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/08d6090acf12d0e08762a02cf16e8adf52e6bcad |     
  mips64el   |     s6-linux-utils-2.6.0.0     | NOK | http://autobuild.buildroot.net/results/731427c2db251121866a8279e1a079630d274b10 |     
    i686     | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/1b3bebba4bb2abbf217ecf5ec9a759bb64e7787c |     
powerpc64le  |            unknown             | NOK | http://autobuild.buildroot.net/results/b4ac81ba02647bb42b4c69c2d81fecc0d7cfef92 |     
    arm      |         wolfssl-5.5.3          | NOK | http://autobuild.buildroot.net/results/27dcca13f5089b7343474655984340bc462ebccb |     
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/d07fed316ccc7b0c305b36f25f4b316601df8960 | ORPH


Gitlab CI results for 2023-02-24
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
                     at91sam9x5ek | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820927991  |      
   atmel_sama5d27_som1_ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820927995  |      
                 atmel_sama5d3xek | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928002  |      
           atmel_sama5d4_xplained | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928003  |      
       atmel_sama5d4_xplained_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928004  |      
       atmel_sama5d4_xplained_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928005  |      
   atmel_sama5d4_xplained_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928006  |      
                        avenger96 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928007  |      
                bananapi_m2_ultra | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928008  |      
                 bananapi_m2_zero | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928009  |      
                        bananapro | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928010  | ORPH 
                   beagleboardx15 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928011  |      
                       beaglebone | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928012  |      
                   beaglebone_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928013  |      
                     beagleboneai | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928014  |      
                          beaglev | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928015  |      
                      beelink_gs1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928016  |      
               broadcom_northstar | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928017  |      
                     canaan_kd233 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928018  |      
                   chromebook_elm | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928019  |      
                  chromebook_snow | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928020  |      
                             ci20 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928022  |      
                      cubieboard2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928023  |      
            engicam_imx6qdl_icore | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928024  |      
        engicam_imx6qdl_icore_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928026  |      
        engicam_imx6qdl_icore_rqs | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928027  |      
              engicam_imx6ul_geam | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928029  |      
             engicam_imx6ul_isiot | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928030  |      
               freescale_imx28evk | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928032  |      
        freescale_imx6dlsabreauto | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928033  |      
          freescale_imx6dlsabresd | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928034  |      
         freescale_imx6qsabreauto | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928036  |      
           freescale_imx6qsabresd | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928037  |      
          freescale_imx6sxsabresd | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928039  |      
             freescale_imx6ullevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928040  |      
           freescale_imx7dsabresd | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928041  |      
              freescale_imx8mmevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928043  |      
              freescale_imx8mnevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928044  |      
              freescale_imx8mpevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928045  |      
              freescale_imx8mqevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928046  |      
              freescale_imx8qmmek | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928047  |      
             freescale_imx8qxpmek | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928048  |      
               freescale_p1025twr | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928049  | ORPH 
             freescale_t1040d4rdb | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928050  | ORPH 
          freescale_t2080_qds_rdb | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928051  | ORPH 
           friendlyarm_nanopi_r2s | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928052  |      
                          galileo | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928053  |      
          globalscale_espressobin | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928054  |      
                 grinn_chiliboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928055  |      
                  grinn_liteboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928056  |      
                 hifive_unleashed | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928057  |      
                         imx23evk | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928058  |      
                   imx6-sabreauto | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928059  |      
                     imx6-sabresd | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928060  |      
                 imx6-sabresd_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928061  |      
                        imx6slevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928062  |      
                       imx6sx-sdb | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928063  |      
                        imx6ulevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928064  |      
                       imx6ullevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928065  |      
                       imx6ulpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928066  |      
                        imx7d-sdb | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928068  |      
                        imx7dpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928069  |      
                       imx8mmpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928070  |      
                imx8mn_bsh_smm_s2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928072  |      
            imx8mn_bsh_smm_s2_pro | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928073  |      
                        imx8mpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928074  |      
                        imx8mqevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928076  |      
                kontron_bl_imx8mm | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928077  |      
               kontron_pitx_imx8m | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928079  |      
              kontron_smarc_sal28 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928080  |      
                          lafrite | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928081  |      
                         lego_ev3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928082  |      
                    licheepi_zero | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928084  |      
               linksprite_pcduino | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928085  |      
                       ls1028ardb | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928087  |      
                mender_x86_64_efi | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928089  | ORPH 
          microchip_sam9x60ek_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928090  |      
      microchip_sam9x60ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928092  |      
 microchip_sama5d27_wlsom1_ek_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928094  |      
...hip_sama5d27_wlsom1_ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928095  |      
        microchip_sama5d2_icp_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928098  |      
    microchip_sama5d2_icp_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928100  |      
          microchip_sama7g5ek_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928101  |      
      microchip_sama7g5ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928103  |      
                  minnowboard_max | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928104  |      
                          mx25pdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928106  |      
                          mx51evk | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928107  |      
                         mx53loco | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928109  |      
                         mx6cubox | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928110  |      
                   mx6sx_udoo_neo | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928111  |      
                          mx6udoo | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928112  |      
                      nexbox_a95x | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928113  |      
                            nezha | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928114  |      
                      nitrogen6sx | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928115  |      
                       nitrogen6x | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928116  |      
                        nitrogen7 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928117  |      
                       nitrogen8m | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928118  |      
                      nitrogen8mm | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928119  |      
                      nitrogen8mn | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928120  |      
                      nitrogen8mp | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928121  |      
              octavo_osd32mp1_brk | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928122  |      
              octavo_osd32mp1_red | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928123  |      
                         odroidc2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928124  |      
                        odroidxu4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928125  |      
        olimex_a10_olinuxino_lime | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928126  |      
             olimex_a13_olinuxino | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928127  |      
        olimex_a20_olinuxino_lime | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928129  |      
       olimex_a20_olinuxino_lime2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928128  |      
       olimex_a20_olinuxino_micro | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928130  |      
             olimex_a33_olinuxino | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928131  |      
             olimex_a64_olinuxino | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928132  |      
          olimex_imx233_olinuxino | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928133  |      
    olimex_stmp157_olinuxino_lime | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928134  |      
                         olpc_xo1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928136  |      
                       olpc_xo175 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928135  |      
                    openblocks_a6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928137  |      
                    orangepi_lite | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928139  |      
                   orangepi_lite2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928138  |      
                     orangepi_one | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928140  |      
                orangepi_one_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928141  |      
                      orangepi_pc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928142  |      
                 orangepi_pc_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928143  |      
                      orangepi_r1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928144  |      
                    orangepi_zero | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928145  |      
               orangepi_zero_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928147  |      
              orangepi_zero_plus2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928146  |      
                       pandaboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928148  |      
                   pc_x86_64_bios | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928149  |      
                    pc_x86_64_efi | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928150  |      
                   pcengines_apu2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928151  |      
                           pine64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928152  |      
                    pine64_sopine | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928153  |      
                qemu_aarch64_ebbr | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928154  |      
                qemu_aarch64_sbsa | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928155  |      
                qemu_aarch64_virt | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928156  |      
                    qemu_arm_ebbr | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928157  |      
               qemu_arm_versatile | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928158  |      
                qemu_arm_vexpress | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928159  |      
             qemu_arm_vexpress_tz | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928160  |      
                qemu_m68k_mcf5208 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928161  |      
                   qemu_m68k_q800 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928162  |      
            qemu_microblazebe_mmu | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928163  |      
            qemu_microblazeel_mmu | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928164  |      
              qemu_mips32r2_malta | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928165  |      
            qemu_mips32r2el_malta | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928166  |      
              qemu_mips32r6_malta | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928167  |      
            qemu_mips32r6el_malta | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928168  |      
                qemu_mips64_malta | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928169  |      
              qemu_mips64el_malta | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928170  |      
              qemu_mips64r6_malta | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928171  |      
            qemu_mips64r6el_malta | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928172  |      
                 qemu_nios2_10m50 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928173  |      
                        qemu_or1k | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928174  |      
                 qemu_ppc64_e5500 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928175  |      
               qemu_ppc64_pseries | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928176  |      
            qemu_ppc64le_powernv8 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928177  |      
             qemu_ppc64le_pseries | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928179  |      
                  qemu_ppc_bamboo | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928180  |      
                  qemu_ppc_e500mc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928181  |      
                 qemu_ppc_g3beige | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928182  |      
                   qemu_ppc_mac99 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928183  |      
               qemu_ppc_mpc8544ds | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928184  |      
                qemu_riscv32_virt | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928185  |      
          qemu_riscv64_nommu_virt | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928186  |      
                qemu_riscv64_virt | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928187  |      
                       qemu_s390x | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928188  |      
                     qemu_sh4_r2d | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928189  |      
                   qemu_sh4eb_r2d | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928191  |      
               qemu_sparc64_sun4u | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928193  |      
                  qemu_sparc_ss10 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928194  |      
                         qemu_x86 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928198  |      
                      qemu_x86_64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928195  |      
                 qemu_xtensa_lx60 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928199  |      
           qemu_xtensa_lx60_nommu | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928201  |      
                      raspberrypi | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928216  | ORPH 
                     raspberrypi0 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928203  | ORPH 
                    raspberrypi0w | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928206  | ORPH 
                     raspberrypi2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928208  | ORPH 
                     raspberrypi3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928211  |      
                  raspberrypi3_64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928209  | ORPH 
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928212  | ORPH 
                     raspberrypi4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928215  | ORPH 
                  raspberrypi4_64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928213  | ORPH 
                 raspberrypicm4io | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928219  | ORPH 
              raspberrypicm4io_64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928218  | ORPH 
                raspberrypizero2w | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928221  |      
                        riotboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928222  |      
                           rock64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928224  |      
                       rock_pi_n8 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928225  |      
                        rockpro64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928226  |      
                      roseapplepi | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928229  |      
                 s6lx9_microboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928230  |      
                       sheevaplug | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928232  |      
                 sipeed_lichee_rv | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928233  |      
            sipeed_lichee_rv_dock | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928234  |      
                  sipeed_maix_bit | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928235  |      
           sipeed_maix_bit_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928237  |      
                 sipeed_maix_dock | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928238  |      
          sipeed_maix_dock_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928239  |      
                   sipeed_maix_go | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928241  |      
            sipeed_maix_go_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928242  |      
                 sipeed_maixduino | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928243  |      
          sipeed_maixduino_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928246  |      
               snps_arc700_axs101 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928247  |      
              snps_archs38_axs103 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928248  |      
                snps_archs38_haps | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928249  |      
                snps_archs38_hsdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928252  |      
                socrates_cyclone5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928253  |      
                solidrun_clearfog | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928254  |      
          solidrun_clearfog_gt_8k | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928255  |      
            solidrun_macchiatobin | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928257  | ORPH 
                    spike_riscv64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928258  |      
              stm32f429_disco_xip | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928259  |      
               stm32f469_disco_sd | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928262  |      
              stm32f469_disco_xip | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928263  |      
                  stm32mp157a_dk1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928265  |      
                  stm32mp157c_dk2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928266  |      
              stm32mp157c_odyssey | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928267  |      
        terasic_de10nano_cyclone5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928268  |      
              toradex_apalis_imx6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928269  |      
                           ts4900 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928270  |      
                           ts5500 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928271  |      
                           ts7680 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928273  |      
                         uevm5432 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928274  |      
                    versal_vck190 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928275  |      
                       visionfive | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928277  |      
                      visionfive2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928276  |      
                        wandboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928278  |      
                            warp7 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928279  |      
                        warpboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928281  |      
                    zynq_microzed | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928282  |      
                      zynq_qmtech | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928283  |      
                       zynq_zc706 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928284  |      
                         zynq_zed | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928285  |      
                zynqmp_kria_kv260 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928286  |      
                    zynqmp_zcu102 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928287  |      
                    zynqmp_zcu106 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3820928288  |      



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
