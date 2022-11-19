Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 696D2C4332F
	for <buildroot@archiver.kernel.org>; Sat, 19 Nov 2022 07:38:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AD0994085B;
	Sat, 19 Nov 2022 07:38:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AD0994085B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id alXdn1aowAJf; Sat, 19 Nov 2022 07:38:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 40CF240894;
	Sat, 19 Nov 2022 07:38:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 40CF240894
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2BA241BF3F7
 for <buildroot@lists.busybox.net>; Sat, 19 Nov 2022 07:38:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E33A660E83
 for <buildroot@lists.busybox.net>; Sat, 19 Nov 2022 07:38:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E33A660E83
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id s2Df1gioJqZw for <buildroot@lists.busybox.net>;
 Sat, 19 Nov 2022 07:38:21 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9E67760E7E
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::231])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9E67760E7E
 for <buildroot@buildroot.org>; Sat, 19 Nov 2022 07:38:20 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id DC435100005
 for <buildroot@buildroot.org>; Sat, 19 Nov 2022 07:38:17 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sat, 19 Nov 2022 07:38:17 -0000
Message-Id: <20221119073823.E33A660E83@smtp3.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1668843498; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=QCfbMbe0jnJe4qoe66VukJGNR/6wb52Hn4q5NvJtVQw=;
 b=h9H0En237x2KlnvkKsYrpu4NfOq7C5CbJw9t0/2nIEb2ThooLORMK2jMKcT45n6VsIbTT1
 wwOsLqr3LZUsKKB7mijbTbip/bum1autCKTMBUT6FnodbjloOeJxtawxucVdcJxtLZxVgc
 gbz6d+ZFasRTvO8AzbKkMs0Tcz+TEpU9OhJB9oumzEyfi4kQaGdkSIWjp/gO4+ZObmAbAl
 UKt7L5b9Ou9qSkCsGZvMQ7fZQXHgZXGLEM6iQNVvWPhxf3Y+Qf0L21jr5609pyAqQktTbp
 0zgj6oAPpZqUSmJPfxLmimrgw7qHzirzzuz0MF8XvNoM1yBIzVa2Ubs5jzznsQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=h9H0En23
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-11-18
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

Autobuild statistics for 2022-11-18
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  |  1  |  1  |  0  |  2  |
  2022.08.x  | 17  | 18  |  0  | 35  |
    master   | 167 | 244 |  1  | 412 |
     next    | 11  | 15  |  0  | 26  |

Classification of failures by reason for master
-----------------------------------------------

                   libnss-3.84 | 31
glibc-2.36-66-ga1dc0be03c9d... | 13
            host-binutils-2.38 | 10
                   linux-6.0.1 | 10
                host-go-1.19.3 | 9 
                 dash-0.5.11.5 | 7 
                      xz-5.2.7 | 7 
              host-pahole-1.24 | 6 
               libglib2-2.72.3 | 6 
                linuxptp-3.1.1 | 6 
             libgpg-error-1.45 | 4 
                      crun-1.5 | 3 
                elfutils-0.186 | 3 
                gerbera-1.10.0 | 3 
  gobject-introspection-1.72.0 | 3 
              host-rust-1.64.0 | 3 
             lirc-tools-0.10.2 | 3 
                   perl-5.34.1 | 3 
           python-numpy-1.23.4 | 3 
                tealdeer-1.6.1 | 3 
              traceroute-2.1.0 | 3 
ulog-0389d243352255f6182326... | 3 
                 wolfssl-5.5.3 | 3 
/home/buildroot/autobuild/i... | 2 
/home/buildroot/autobuild/i... | 2 
                 coreutils-9.1 | 2 
                 dmalloc-5.6.5 | 2 
       freeradius-server-3.2.0 | 2 
fs/ubifs/ubifs.mk:49: /home... | 2 
gummiboot-2bcd919c681c952eb... | 2 
                   json-c-0.16 | 2 
              libgcrypt-1.10.1 | 2 
            ocf-linux-20171122 | 2 
                 openssh-9.1p1 | 2 
rtl8189es-39c17661136da48f8... | 2 
                    sdl-1.2.15 | 2 
                       unknown | 2 
uqmi-0a19b5b77140465c29e2af... | 2 
                xenomai-3.0.10 | 2 
               xfsprogs-5.14.2 | 2 
/home/buildroot/autobuild/i... | 1 
afboot-stm32-3566acd582e553... | 1 
android-tools-4.2.2+git2013... | 1 
               apcupsd-3.14.14 | 1 
                    attr-2.5.1 | 1 
                    brltty-6.5 | 1 
                 dc3dd-7.2.641 | 1 
        edk2-edk2-stable202102 | 1 
                  exempi-2.6.1 | 1 
                  ffmpeg-4.4.3 | 1 
               fftw-quad-3.3.8 | 1 
                     file-5.43 | 1 
             fontconfig-2.13.1 | 1 
fs/ubi/ubi.mk:51: /home/aut... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /tmp/... | 1 
fs/ubifs/ubifs.mk:49: /tmp/... | 1 
fs/ubifs/ubifs.mk:49: /tmp/... | 1 
              fstrcmp-0.7.D001 | 1 
          gitlab-runner-14.5.1 | 1 
         gobject-introspection | 1 
                 haproxy-2.6.5 | 1 
            host-binutils-2.37 | 1 
            host-binutils-2.39 | 1 
         host-gcc-final-10.4.0 | 1 
         host-gcc-final-11.3.0 | 1 
host-spirv-llvm-translator-... | 1 
          imagemagick-7.1.0-51 | 1 
                  jack2-1.9.21 | 1 
                  kexec-2.0.25 | 1 
                       kmod-30 | 1 
kvmtool-f77d646ba01d04be5aa... | 1 
libcamera-ba6435930f08e802c... | 1 
               libcap-ng-0.8.3 | 1 
                libkcapi-1.4.0 | 1 
               libmdbx-0.11.12 | 1 
      linux-5.10.145-cip17-rt7 | 1 
            linux-fusion-9.0.3 | 1 
              liquid-dsp-1.4.0 | 1 
                     lxc-5.0.1 | 1 
              memcached-1.6.16 | 1 
                  mender-3.4.0 | 1 
                 mesa3d-22.2.2 | 1 
                  ntp-4.2.8p15 | 1 
                  ntpsec-1_2_1 | 1 
              open62541-v1.3.3 | 1 
               openblas-0.3.21 | 1 
               openpgm-5-3-128 | 1 
   openvmtools-11.3.5-18557794 | 1 
        python-alsaaudio-0.9.2 | 1 
qt5base-2ffb7ad8a1079a0444b... | 1 
                 qt6base-6.4.0 | 1 
            quickjs-2021-03-27 | 1 
                      rauc-1.8 | 1 
rtl8723bu-d79a676a8d3f0bb6a... | 1 
rtl8723ds-76146e85847beb242... | 1 
              shellinabox-2.20 | 1 
                   trinity-1.9 | 1 
                 uclibc-1.0.42 | 1 
               valgrind-3.19.0 | 1 
xr819-xradio-4f0cfd5e869ca1... | 1 
                  xvisor-0.3.1 | 1 
                  zabbix-5.4.9 | 1 
                    zeek-4.1.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/a667b79ea8b97d13ad19672d8f0a8d3ba2d13852 |     
   mipsel    | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/765a323dc3d90ee59a52c729879ff1ecb43cb17b |     
 aarch64_be  | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/545fe0ca13b14fdffe54ea1f4f33a42baaccad70 |     
   arceb     | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/30ddc9b1a28cfd29f9731e739ee754240f4fae8d |     
  mips64el   | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/f52cf4efe7a1385d4e68d516fb4f88aa8ff6fd52 |     
    arm      | afboot-stm32-3566acd582e553... | NOK | http://autobuild.buildroot.net/results/171b7533974d3559ba3d42cd55a70771805b7d8d |     
 powerpc64   | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/c355cbf337d9f64ce5dc03dfd71bd0c0790be67c |     
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/16471307395c82a8d343bc0158b5aa44d460a951 |     
   mips64    |           attr-2.5.1           | NOK | http://autobuild.buildroot.net/results/41508074ac826512f2415a56246f0ac779c1e21a |     
   mipsel    |           brltty-6.5           | NOK | http://autobuild.buildroot.net/results/ddfa138e98e492066cf29df69fc5ee29d9652073 |     
   sh4aeb    |         coreutils-9.1          | NOK | http://autobuild.buildroot.net/results/728fac43bcc5993d6e5daec6a85d0140dac476bd | ORPH
   sh4eb     |         coreutils-9.1          | NOK | http://autobuild.buildroot.net/results/bbf79cbb7c1023665f58d32ae83fd363d61b08c7 | ORPH
    i686     |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/fce5b239c244df05a1cf6b50b30b313b935a87ec |     
    m68k     |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/a1975fd76c211ce40aedefb44a1dfbe5235d67f7 |     
    arm      |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/260c5e3fe011283cc85dee04a43579c0e4ef8b45 |     
   nios2     |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/09d7d39500f35d748c3dcc1734936da9cf1109e5 | ORPH
 aarch64_be  |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/a4625205425bdb0fc8b5028f1000ad9b6bdc84ab | ORPH
    arm      |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/4446536673a5cbdffb5b9020cfec8688dcb4684a | ORPH
   armeb     |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/42ce0299eb9b9bf85da7f118d187c4e4fddf2674 | ORPH
    sh4      |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/b147fc49970ddfaa1dcbb496adfcac94532b039f | ORPH
    arm      |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/cf04a599f7ec9ce4735133fdd9c2e0cca8b1065e | ORPH
   sh4aeb    |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/e089fa70a4d3c7a218416b74858552b0c0d5f4c8 | ORPH
    or1k     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/a284b049df1a04ba288558c639acf1fb2ef59e61 | ORPH
    i686     |         dmalloc-5.6.5          | NOK | http://autobuild.buildroot.net/results/3152fb8245836b540b9fe2581e4d18a4c9068cf4 | ORPH
  powerpc    |         dmalloc-5.6.5          | NOK | http://autobuild.buildroot.net/results/d7df98eebc6b69fe09b7877d3b4e2eff5a83f504 | ORPH
  aarch64    |     edk2-edk2-stable202102     | NOK | http://autobuild.buildroot.net/results/3688b015ddb2aa6cefcbe7833914e17c4d73b8a0 |     
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/503cc8aa446d70fe7d77f325131fd5ed8ee3efd3 | ORPH
   arceb     |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/6626e8714b34670bbf2780dec38017962ccaecfe | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/60be302a53b2456cbc0e171ddc026db3eb49010f | ORPH
    arm      |          exempi-2.6.1          | NOK | http://autobuild.buildroot.net/results/005f7d9f6a6382738d0a28703e7f191554afd49e |     
    arm      |          ffmpeg-4.4.3          | NOK | http://autobuild.buildroot.net/results/794d5a3fe1c83009f896d9625787824bb3716a39 |     
powerpc64le  |        fftw-quad-3.3.8         | NOK | http://autobuild.buildroot.net/results/b1b275956463de33e7bab33290f9a30c7b20b60b | ORPH
    i686     |           file-5.43            | NOK | http://autobuild.buildroot.net/results/9bf23c91694d096f436626650ec1968364d04bcc | ORPH
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/7c2d57213d2dd8442da420fe9ddb3f47efb2d89b | ORPH
  mips64el   |    freeradius-server-3.2.0     | NOK | http://autobuild.buildroot.net/results/4933392f786a171e358838ff5788aa0113112c7e |     
   mips64    |    freeradius-server-3.2.0     | NOK | http://autobuild.buildroot.net/results/d0416adc84cbcb78dd0173222a5ad5ba9c3f88bc |     
    mips     | fs/ubi/ubi.mk:51: /home/aut... | NOK | http://autobuild.buildroot.net/results/a53bd36e9a157a804d91247b953b5bfd743eea40 |     
 aarch64_be  | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/f3b2ccbb244ccec2035e8981c9aafd73725e9817 |     
  mips64el   | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/baf405257476755e9f39aa925e7753ef2d158d60 |     
    or1k     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/dd475a7a9aa67d700d3ae50a6156c831fdef8777 |     
 aarch64_be  | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/1402084c2b34a68709ac22665cad49856773eb1c |     
   s390x     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/56c83cfacebc56bc492fc3512133dfe1121d3780 |     
   s390x     | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/bd0e378c3706bc3c0d1233899556ea21dadbf94b |     
  aarch64    | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/dbf4990a87df4f7c81d2c5d9e18b87158421b146 |     
  sparc64    | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/ee757f1a4576a38c0bde362053412eac0e4443c3 |     
   armeb     |        fstrcmp-0.7.D001        | NOK | http://autobuild.buildroot.net/results/bf21b427dec2801cc6750f42d356cb02f90c7770 |     
 aarch64_be  |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/faa60bef0df17d03e1f95044ed66160b14becd89 |     
    arc      |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/9902e1fce16500a1f5874919bcfe95ccaab77c67 |     
 aarch64_be  |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/c4e2c6291c042bfbe57f573a9a6de09c7e5183b9 |     
  riscv64    |      gitlab-runner-14.5.1      | NOK | http://autobuild.buildroot.net/results/d720d9b30d423357ee570cc40ab46e53e86513dd |     
    mips     | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/1e22e9dcd53338a12abf40a10c372a8b835647ee |     
   nios2     | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/9dede2b1c5103356152225307f327cb0ea03b283 |     
microblazeel | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/7809e38f89ca1e35887f3bcab634b183f72965bb |     
   nios2     | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/4732f038fbb5283a0e7ec3f8b817e359839440e7 |     
 microblaze  | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/79a138b60e2e60918e3da14f158a1422b3893362 |     
    sh4a     | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/8ea00ea394e1eb3662e773916220d8a80de665ea |     
    sh4a     | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/fceb4a3d9878ee4b776c5b0c390ddc8c044ec5fc |     
    or1k     | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/a3a97219d5a0d57b76b55a9741074c3422f19b1f |     
 microblaze  | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/8ebda30bb1bec3d907d793e20b0c4670b112981a |     
   mipsel    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/16443e7b26733a4516c9e617ba37e1cabfd4f9fa |     
  powerpc    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/5768ea574fcfba655b5127a30fb3c2e2a3398957 |     
 microblaze  | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/88db0243d7610e666480a4b2c8ab06761e5d4ef6 |     
   sh4eb     | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/328c0fbc0d697ce038e3444364ff213360a10cfa |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/0c1a63ecd6b99b9810d300b04d1f21551b5380e9 |     
 powerpc64   |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/494e67b6699a679f9c207b9246c2a740c635382d | ORPH
microblazeel |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/02fa193719b06c2bf2b129ce66516589bbdd09b2 | ORPH
   nios2     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/e6f0bb6205039e4f59adcc32319f5a97fd86f62b | ORPH
   x86_64    | gummiboot-2bcd919c681c952eb... | NOK | http://autobuild.buildroot.net/results/dce1933993677d8b948f0012df97a7b59550fc70 |     
    i686     | gummiboot-2bcd919c681c952eb... | NOK | http://autobuild.buildroot.net/results/85d2fc26e9ce5f16b90d894a95d9a1173cfcb5a5 |     
    i686     |         haproxy-2.6.5          | NOK | http://autobuild.buildroot.net/results/f5c9a7d310025593c263348c9ff6eed179e68dfd |     
powerpc64le  |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/705970aca40479004f0488e8750bc19c27a0efa4 |     
  riscv64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/59a64a58066db61f09cf13e79acf989e1878e880 |     
   s390x     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/42f934602a24ce8396b9ba5fb28ac6bff27cf917 |     
powerpc64le  |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/575c22e62c8dd71216808529ef064a80ae10e12a |     
    arm      |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/41df5f194d280f56083845043ec2b666211dd346 |     
  sparc64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/c4b1ae69e54fbe756a6d6ec5690d52ac494369c7 |     
 aarch64_be  |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/cb56b26659127eff9c17fb281746c0fca8d4e373 |     
   xtensa    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/3a386516718e34d777e16da27d3f9ef7ee646e5a |     
  aarch64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/bec67d713420984f049b839bfb6b06c599a6d38c |     
   x86_64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/31443ac90eb7442de40d74c3e169a7dc0ae3f992 |     
  riscv64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/aabe32a493d84bd9adbd60aba3ace5019cb71e9f |     
powerpc64le  |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/6a9e2b3944cac5d5053cace35f59f8c41888ff81 |     
 microblaze  |     host-gcc-final-10.4.0      | NOK | http://autobuild.buildroot.net/results/18c08d49a4adb44e3dff0ebde8ecae9c4c8a8200 |     
microblazeel |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/2f45395dc39223d61460969959e6c917358da5a3 |     
  aarch64    |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/22c6447a78ce8ec4b3d84b2c40744426bdac396b |     
powerpc64le  |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/647356a8fc12ca5b6615c1ebef16d884da04c763 |     
    i686     |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/367b99b9d41e4da60fd0d67a1b746c42c4e67e87 |     
   mips64    |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/87904933a1d7ce57db13a1c41d0bff3ba9f2cb3d |     
   mips64    |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/62c7a15b1cbf49b8c6fbd80d10b85e9b0eb79e6a |     
  mips64el   |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/eff232179d301a8da06cdf86edb615758b662e97 |     
  mips64el   |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/ccd25c6921783cd62ccfde22ca3f684316873f0b |     
powerpc64le  |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/2f56411727488946825c5c1745cc7af83903db66 |     
  mips64el   |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/708abf298612860bf7f5e9ba70879904065d3e4f |     
 microblaze  |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/dd866dd6593998edfc626e68b70cb13b7e988719 |     
    arm      |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/105ee58c2984a6a06f2455bb47500b86c15256d8 |     
  riscv64    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/a4eaac5ac7cb26df0102eeb3cc466d0da589e03e |     
    mips     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/90b471132217091375112a2d21252ee6c10da50e |     
   x86_64    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/180baea71cee585e9f258b73c3a488bf51f4e313 |     
   sparc     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/cadb9db4af13299b48bc5d040945d8f2d498c0f2 |     
   armeb     |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/97aa23fda5c5d734bde26e956520e803a6f52677 |     
  powerpc    |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/42ce21487ccc9c5b09426770cd2ac8424da7ff49 |     
  sparc64    |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/d8d0700991e48a03aab1182d920f28a0ae4321f3 |     
  aarch64    | host-spirv-llvm-translator-... | NOK | http://autobuild.buildroot.net/results/f6dcc23062e5fab85c8e7a6888df265fc4f3defc | ORPH
    sh4a     |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/e849630ce921dc33137f04403b5543578d9ffe74 | ORPH
    m68k     |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/ad36ab1736851f24768dca58bf1e626789924b84 |     
  riscv64    |          json-c-0.16           | NOK | http://autobuild.buildroot.net/results/d6a327d7240de3092a4f6e33cdcc921c43f4eaa8 |     
  riscv64    |          json-c-0.16           | NOK | http://autobuild.buildroot.net/results/d66b54488ac75c16a64cfeacfa7a9d1361f4a1a9 |     
   armeb     |          kexec-2.0.25          | NOK | http://autobuild.buildroot.net/results/b536ffde1d9c18fc8a2f602758cf88f74659c8ca | ORPH
   xtensa    |            kmod-30             | NOK | http://autobuild.buildroot.net/results/ddfffa21200b7e1982ae5b3cf98646425756025c |     
   x86_64    | kvmtool-f77d646ba01d04be5aa... | NOK | http://autobuild.buildroot.net/results/3c1f01f6d120e977f9b8385f8de5db63f6318ab4 |     
 powerpc64   | libcamera-ba6435930f08e802c... | NOK | http://autobuild.buildroot.net/results/091279c8e994ff6aba889563a6018e88b171f602 |     
  riscv64    |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/938eba2ed6e9d1f48cf14bfae4a3154d27248ab5 |     
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/9592ef3b45e7677a510e4f219f5160e8740c0beb | ORPH
   armeb     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/341d69a087269de1f9e7ebf466f946fbdbaf5865 | ORPH
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/4cd759f0022fa77eaa9b49ca197811b24d637ef5 |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/d54f87cc319891924b5409b1527a73725fefb61e |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/e79678ee73a2647ccef01b48b9178e3e41b647b9 |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/96008f2728560ebf932c6eac47a92bca7260eb96 |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/cbd05488140e7cb69f1816ee131b042108d719ca |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/6141ab1bb6caa0e008fe6fdba9838fc323e9df5f |     
  aarch64    |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/968ca52b7e744bde7b9dcf11b013d55f9411745a | ORPH
  aarch64    |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/0fd3c24a05e75ac90e42fc6b7337fe2c579db522 | ORPH
 aarch64_be  |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/3376d6d3fa590794dfe14453ab3e8ce0cd434a22 | ORPH
  aarch64    |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/145617c4635a16b7444febb3714541ed96fb2a1a | ORPH
microblazeel |         libkcapi-1.4.0         | NOK | http://autobuild.buildroot.net/results/df88ff51d3330c07f82eb1c2f29b06b94fbcf82f |     
   sh4aeb    |        libmdbx-0.11.12         | NOK | http://autobuild.buildroot.net/results/1afa70214f3d00edbefcc3ff5db9727e5d667f6c |     
    or1k     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/ffa908f32ae897cb235fec7a5cc4e11981967b2f |     
 powerpc64   |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/604cdc7d4b3fff15d78c09cee9a3da4f3bcb22d7 |     
   s390x     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/4965cd9fe6710ee0407669910f07f858760c6464 |     
 aarch64_be  |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/2750ffd1aaf9d05a7af694c73e86b63d715da311 |     
   mips64    |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/223e906c2eb9d348b19d3a9fc26f4c258fb6bc45 |     
  sparc64    |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/6c90ba5f015528308c966a10d0ac0fc1b30b7742 |     
   nios2     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/9518a7ed3ab3a97c1972130bc04faa1ed981b2f0 |     
  powerpc    |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/61260271cb2701da8c4c8ef52d34d6d3471daac4 |     
  mips64el   |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/2af45678d64e83bb7d9373e13c53dbdde455f5c7 |     
  sparc64    |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/2e40a7f90fc652e98b4901767a3339e14a16c64f |     
  sparc64    |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/f56c827f06080e94d262fe88f7c5845744be8827 |     
  aarch64    |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/e76b99b6da529dfc8bf700e8515db76a8ed12424 |     
    or1k     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/29db49a0a162094bf48cc17cb55dd58a4bdd286f |     
 microblaze  |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/8d60a42ab22c90e416820a5064e943b0203de1f8 |     
  mips64el   |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/0a1cdf0b80b44b2c1e1e1fb75f4613661619c0b3 |     
powerpc64le  |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/7701b7c70838fe4c041f3c728c70284ca33a481b |     
   arceb     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/c66533966f8d0274f5b92822f2b26db25ee16781 |     
   mips64    |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/443377033f0649abf6f506c18fd6eabd71a6ef71 |     
   sparc     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/4cb1ffd8bb99be3dece38891b4838af8aabe2868 |     
   nios2     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/2d4047e90f1581f3822f0fbb1fdcb4c1101c9675 |     
 powerpc64   |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/4b1af8dad5b96b6ba4632381dbc6b6a31ab09d7e |     
 aarch64_be  |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/10187b5c025feff1cc56d162640dadf1c0cbb52d |     
   armeb     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/730f76559d07a1b62ffaf4ff389e79bd2aee5304 |     
    mips     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/07fc0c9a5d950a334769a77682dab133de7120e0 |     
   armeb     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/8b78a2d6ef38ae1f1f5a6ea9f72fa9e9cf37d1a7 |     
 aarch64_be  |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/e7f0a1b67a3dbffecfb2227445ce63ae5fe3c9cb |     
    m68k     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/3c86ce579ec901d0a0a23dc6a342d7a2d98cb9c6 |     
    i686     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/ad5f453a35e2ba1e08afd317c1e2a53711a3417e |     
  aarch64    |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/53750bac3cc447b67fe83c5d326f124c51ec074b |     
 aarch64_be  |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/0f8b077aeb355dc016bb82f7b26d673e780b1be5 |     
powerpc64le  |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/40caf6bca79e8e12e30c66b118f8cd47b58384fa |     
  riscv32    |    linux-5.10.145-cip17-rt7    | NOK | http://autobuild.buildroot.net/results/d7ee6fadcaf2566430e0bddcf789bdf528cd3496 | ORPH
  mips64el   |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/0d8ae48d324cb0721789075fa21c693944a62567 | ORPH
    i686     |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/3dfe32dbffa4587b8d036ddd143402075da4d6f2 | ORPH
  powerpc    |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/64481bbf754a2933eaa0a145e87e2a93ce25adca | ORPH
   arceb     |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/8eca11988a92db2bc0bf6663f3b1ffc34d85bf79 | ORPH
 microblaze  |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/7316c900a0952c93fcfde4a49542a7714e19296a | ORPH
  powerpc    |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/93cc741ac07be6076645b2b4631d5bcaa611802c | ORPH
  mips64el   |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/a4e2c940b2ffaf6d124756289a9a85ceb6c36b06 | ORPH
   x86_64    |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/e59557af84e7e3078e240363bb3844057050cdcf | ORPH
  mips64el   |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/1d6ce260dfb3b77b19301b56676839c5176b00a5 | ORPH
   x86_64    |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/76b251e6b82926ea8e0377e64aca0f3fc1195991 | ORPH
powerpc64le  |       linux-fusion-9.0.3       | NOK | http://autobuild.buildroot.net/results/532ab088a8576bc1b569fa1cdce78482b144a1c3 | ORPH
   s390x     |         linuxptp-3.1.1         | NOK | http://autobuild.buildroot.net/results/9bcb435efbca99102d02bf2e5f3de15d7a9534ce |     
   armeb     |         linuxptp-3.1.1         | NOK | http://autobuild.buildroot.net/results/dafd7dca0132be304023f3094ae4099fbe47d03e |     
   arceb     |         linuxptp-3.1.1         | NOK | http://autobuild.buildroot.net/results/581f398bce398cb77f8a732db00a5ae081a2ce4b |     
  sparc64    |         linuxptp-3.1.1         | NOK | http://autobuild.buildroot.net/results/08e6ef695579c7e7f9d85bdac3716ff32dba49be |     
microblazeel |         linuxptp-3.1.1         | NOK | http://autobuild.buildroot.net/results/c139c01c022877e76ce609f7b48c214a7ac62597 |     
   nios2     |         linuxptp-3.1.1         | NOK | http://autobuild.buildroot.net/results/714b3ba330b1974d5f935394a6f8f94ab967363f |     
    arm      |        liquid-dsp-1.4.0        | NOK | http://autobuild.buildroot.net/results/d0e4f82172a9a255984c00a0027acf91074dad80 |     
    arc      |       lirc-tools-0.10.2        | NOK | http://autobuild.buildroot.net/results/8b56fec36aa35573f166f77dda2a9229bdab433a | ORPH
    arm      |       lirc-tools-0.10.2        | NOK | http://autobuild.buildroot.net/results/a66cbbb99effb77b6ee4a57bc113317ad101bfd0 | ORPH
 aarch64_be  |       lirc-tools-0.10.2        | NOK | http://autobuild.buildroot.net/results/20d637e0996ca25879f8164442b544a1fc073b7c | ORPH
   s390x     |           lxc-5.0.1            | NOK | http://autobuild.buildroot.net/results/1186b93a0ad7363a91067469e9b350671c0cc469 |     
 powerpc64   |        memcached-1.6.16        | NOK | http://autobuild.buildroot.net/results/75f8582760d3229aa9811c9a62f470063f57bde4 | ORPH
   x86_64    |          mender-3.4.0          | NOK | http://autobuild.buildroot.net/results/ec95a90bf5afeaf572c2dccc1002e93013fc1522 |     
  powerpc    |         mesa3d-22.2.2          | NOK | http://autobuild.buildroot.net/results/7be8ed1dbb6e3a40b4cf04f27ef42d24811502e8 |     
    sh4      |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/30409fe5a7d20f164b47919e02603721fd947761 | ORPH
   xtensa    |          ntpsec-1_2_1          | NOK | http://autobuild.buildroot.net/results/95ae3683c7b9a74db13130c018cadd044dfc7b20 | ORPH
   armeb     |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/c0a5678361b94b354620fe91aa13f6a17797f717 | ORPH
microblazeel |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/b115a5236e572fc37a85f0a4411c4821fe47a5e7 | ORPH
 powerpc64   |        open62541-v1.3.3        | NOK | http://autobuild.buildroot.net/results/280fa550e87877275a51ce63d422615a4af6899a | ORPH
   mips64    |        openblas-0.3.21         | NOK | http://autobuild.buildroot.net/results/a6a1e6c651986fb7d84d5b4b516b7579f11b07b9 | ORPH
   nios2     |        openpgm-5-3-128         | NOK | http://autobuild.buildroot.net/results/68e840b1fec8f14775cef0b6a14d9b847337324b |     
    m68k     |         openssh-9.1p1          | NOK | http://autobuild.buildroot.net/results/398442a297e51f2a92a68455fc6e0057fef2da80 | ORPH
    m68k     |         openssh-9.1p1          | NOK | http://autobuild.buildroot.net/results/d75a44fd0372aa72c9dbce90ba514c71b7a39ef9 | ORPH
   x86_64    |  openvmtools-11.3.5-18557794   | NOK | http://autobuild.buildroot.net/results/9b21eb955d97f95781ed797b2e0160d58cdbc399 |     
   x86_64    |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/4ef0a13e40d63c5c6933ef3bc24bbdc3c106c954 |     
   mips64    |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/fa241d5b191bccc214d2d44dfb7924036feb3069 |     
    arc      |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/5510eb2cd9d9b6e870fc778d5b52d8368110ba23 |     
    arm      |     python-alsaaudio-0.9.2     | NOK | http://autobuild.buildroot.net/results/e8dee5f048190f6aa2a7e7aa5a9b62eb1db66818 |     
 powerpc64   |      python-numpy-1.23.4       | NOK | http://autobuild.buildroot.net/results/d673a5db06d68d03005c28d8deeeb629d7c40483 |     
 powerpc64   |      python-numpy-1.23.4       | NOK | http://autobuild.buildroot.net/results/dae50e0bebda6e55e3e5a359cb396b9986568f63 |     
   sh4eb     |      python-numpy-1.23.4       | NOK | http://autobuild.buildroot.net/results/e47ca0252ff656e0c8e5f305c7b95261f766fe5e |     
   x86_64    | qt5base-2ffb7ad8a1079a0444b... | NOK | http://autobuild.buildroot.net/results/c95f67dd3111c016484f489bb9c40ce000ec2eac |     
  powerpc    |         qt6base-6.4.0          | NOK | http://autobuild.buildroot.net/results/78169d3f03d8ca6586eb511be19247661e51e4e2 |     
   armeb     |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/573ae888db536fc8a0d7ea8cfe54500504d3a1d9 |     
  riscv64    |            rauc-1.8            | NOK | http://autobuild.buildroot.net/results/67d8b34d15ab86b5c54139942d8b519022a19e04 |     
  aarch64    | rtl8189es-39c17661136da48f8... | NOK | http://autobuild.buildroot.net/results/1c3ff0d4acb7239fbc7a6b0e7ecab81356a4a076 |     
   arceb     | rtl8189es-39c17661136da48f8... | NOK | http://autobuild.buildroot.net/results/568708d87298d41c3fcf42ba43352f84731ba86b |     
 powerpc64   | rtl8723bu-d79a676a8d3f0bb6a... | NOK | http://autobuild.buildroot.net/results/24c9607d65da47009000345754fde437e9517c57 |     
   xtensa    | rtl8723ds-76146e85847beb242... | NOK | http://autobuild.buildroot.net/results/4ce807fbd7c529bc6e6ebede7c60f9045f111809 |     
   sh4aeb    |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/93f739eb722e2bc1f16bd70bda5404210bc05f00 | ORPH
    sh4      |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/56352cb48be5631579ad71515f2a8537596ee90a | ORPH
    or1k     |        shellinabox-2.20        | NOK | http://autobuild.buildroot.net/results/edeabf5154500ea6b8d1e0f62bd5352b82d11c16 |     
  sparc64    |         tealdeer-1.6.1         | NOK | http://autobuild.buildroot.net/results/1a28a05f09037432959531ad0b53fbbd9185cd30 |     
   mipsel    |         tealdeer-1.6.1         | NOK | http://autobuild.buildroot.net/results/37faea3552d31e6c3a07c00af93c2a6c46f8ea2f |     
  sparc64    |         tealdeer-1.6.1         | NOK | http://autobuild.buildroot.net/results/a920eedb13148229129ca35adb4de0244b679000 |     
   x86_64    |        traceroute-2.1.0        | NOK | http://autobuild.buildroot.net/results/024fc6a54ccfdd07a15a7649e7e0e4580a34ad87 |     
  powerpc    |        traceroute-2.1.0        | NOK | http://autobuild.buildroot.net/results/a1e1b35a6c4a4f09b7bcfd553462e9f795f9b98e |     
 microblaze  |        traceroute-2.1.0        | NOK | http://autobuild.buildroot.net/results/3c5594fb2e807188a6978032326c4ee75079f777 |     
   x86_64    |          trinity-1.9           | NOK | http://autobuild.buildroot.net/results/b9b6cd09f3e8278d563ea3b261ca848474deb318 | ORPH
  powerpc    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/cb847b7f50fb0dc6f52c3d3e0ae59bc68010e174 |     
   s390x     | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/26fcd0c6ee33c74fb77812af779747c7999f65d5 |     
    mips     | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/a0b43562f473ad20c8da137edbda4b28b588565b |     
 powerpc64   | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/e90fabd5024df91bf28e267d9aafae2caad6acd4 |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/644ba6463b1a16d596abe74ba4a4ed7ccfc65c92 |     
  sparc64    |            unknown             | NOK | http://autobuild.buildroot.net/results/25e98763b3924f9635ba0f6c7ec0fcbff616d43a |     
    i686     | uqmi-0a19b5b77140465c29e2af... | NOK | http://autobuild.buildroot.net/results/321b7a36734a42b3b3a37ef320f45730b569260f | ORPH
   mips64    | uqmi-0a19b5b77140465c29e2af... | NOK | http://autobuild.buildroot.net/results/1b30df6f6eb10927a82347c2c689551fd5b70993 | ORPH
  powerpc    |        valgrind-3.19.0         | NOK | http://autobuild.buildroot.net/results/df5072247c59e3a6a4792f25d3b5b0583f792b53 | ORPH
    arm      |         wolfssl-5.5.3          | NOK | http://autobuild.buildroot.net/results/18fabccc7315a526b6660f325757aef1bb0e4296 |     
   mipsel    |         wolfssl-5.5.3          | NOK | http://autobuild.buildroot.net/results/66dd96b46d10de08bc5eb978197529bc88b76cd8 |     
   mipsel    |         wolfssl-5.5.3          | NOK | http://autobuild.buildroot.net/results/f7cb9584b90145e0233cd658ee33970ba8be91ae |     
   x86_64    |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/e586b0989c5c9dcd92f7f48e9d347ca23e20aa1f |     
 microblaze  |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/27b1c519bda9b610593985b79a5bb0bbc621ef22 |     
   nios2     |        xfsprogs-5.14.2         | NOK | http://autobuild.buildroot.net/results/dd8bdd3db1d50db252527148a448901ab3c69ab9 | ORPH
  riscv32    |        xfsprogs-5.14.2         | NOK | http://autobuild.buildroot.net/results/404f4d26bdbe82eb1faa73ce96fd6e9db59c763e | ORPH
  aarch64    | xr819-xradio-4f0cfd5e869ca1... | NOK | http://autobuild.buildroot.net/results/738eebd1e2480592100d92a80e801e01bfd32d9c |     
   x86_64    |          xvisor-0.3.1          | NOK | http://autobuild.buildroot.net/results/db38c9e041b815ddea387d78cd3f005e6882fcc8 |     
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/9679578c435c5cbf35d21f39b65228a5c146073e | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/19807400a2068fde1f657f549af8bd7691b18add | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/c103f0c7984ddf5261c60514ec3233fb9429eb3f | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/61654c8bb1269c2f78c882de22a19ab46183a09c | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/d575e250897e36a533c639e59c1f237716c54dc7 | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/f48e45953ff1612eae42362b30afa9a1ecac0977 | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/f62c40a7d668eaae3ef7be3c3b525ef6bb244aa5 | ORPH
    mips     |          zabbix-5.4.9          | NOK | http://autobuild.buildroot.net/results/4ea7096a0ac9445a070aa4e335622fc05d84ddf0 |     
 aarch64_be  |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/278e9d3940acdbf15b2ded1da47bae896890cb14 |     


Classification of failures by reason for next
---------------------------------------------

                      xz-5.2.7 | 2 
/home/buildroot/autobuild/i... | 1 
               apcupsd-3.14.14 | 1 
                   aubio-0.4.9 | 1 
                      crun-1.5 | 1 
glibc-2.36-66-ga1dc0be03c9d... | 1 
                host-go-1.19.3 | 1 
              host-pahole-1.24 | 1 
          imagemagick-7.1.0-51 | 1 
                libkcapi-1.4.0 | 1 
          lua-cqueues-20200726 | 1 
              open62541-v1.3.3 | 1 
            python-bunch-1.0.1 | 1 
                       unknown | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   nios2     | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/43d3884fe7cc420990b27bfe94ccd74c7cfe1de3 |     
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/65d2c2a458b824baa9f4131a70f1d2a9d99c9557 |     
   s390x     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/8bd093d206e674c056d69449f2731f83fb9c4415 |     
   arceb     |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/4741df53d4c66b3d52cbdadc37b74d92c819321f |     
    mips     | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/e87b0f86f588b43cd2ce2723720dc3ff145de758 |     
    i686     |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/5e4619bbcbb48db52c491df2853cef6bd18876fd |     
    arm      |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/ee676bc6d2dcaeb7040c665eacd144bb3a7615e3 |     
   mips64    |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/76ff6817661bfa2766cd48054653dc2b2e08d3ec | ORPH
    sh4      |         libkcapi-1.4.0         | NOK | http://autobuild.buildroot.net/results/43e5cd555a8b9bf10e79bf750a3a338981afa345 |     
   sh4aeb    |      lua-cqueues-20200726      | NOK | http://autobuild.buildroot.net/results/7bcc69fbc791a2b2af6b29161a0977e33b311f8c |     
microblazeel |        open62541-v1.3.3        | NOK | http://autobuild.buildroot.net/results/3286145ce802e0d87d8fc08c69b2aa7cfe3ade67 | ORPH
powerpc64le  |       python-bunch-1.0.1       | NOK | http://autobuild.buildroot.net/results/34c5299c88ff5e4713ce0c300b7b944755460bf2 |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/eff6af278c5198e0ad7a21107c63b93ff743f5fe |     
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/310bd7e7167abf51d64c122e570d92233af15305 | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/984652ac559c39257ab5058015b9ac527a0c0225 | ORPH


Classification of failures by reason for 2022.02.x
--------------------------------------------------

                    ruby-3.1.2 | 1 


Detail of failures for 2022.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |           ruby-3.1.2           | NOK | http://autobuild.buildroot.net/results/10b32bdc294b776ba03efde299722904fc4cada2 |     


Classification of failures by reason for 2022.08.x
--------------------------------------------------

                gerbera-1.10.0 | 2 
                 linux-5.17.15 | 2 
glibc-2.35-134-gb6aade18a7e... | 1 
                host-go-1.18.8 | 1 
host-pahole-73383b3a39afe86... | 1 
            igd2-for-linux-2.1 | 1 
                  kexec-2.0.24 | 1 
                libglvnd-1.4.0 | 1 
                     lz4-1.9.4 | 1 
               mariadb-10.3.36 | 1 
            ocf-linux-20120127 | 1 
              open62541-v1.3.2 | 1 
                 pixman-0.42.2 | 1 
            python-sip-4.19.25 | 1 
                tealdeer-1.5.0 | 1 
                 wolfssl-5.5.3 | 1 


Detail of failures for 2022.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  sparc64    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/283b8e5f9e24a16dd89edce53754a81d6617d2ed |     
    i686     |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/ad28edc5e3ec1f8f3ee7463b776262bcc08d0287 |     
  powerpc    | glibc-2.35-134-gb6aade18a7e... | NOK | http://autobuild.buildroot.net/results/2e892291c94c4b98a42ba7fc8d4fc28a8ea582ee |     
    i586     |         host-go-1.18.8         | NOK | http://autobuild.buildroot.net/results/e3a34dae9a8e09e8b952b96aa41599b523bc62e2 |     
   sparc     | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/25f1b1d5a82256d41dbd75068021f7dcdb8f6e4f |     
    mips     |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/dbc3821cd60b05982904dca5e57531220b1657a1 |     
   armeb     |          kexec-2.0.24          | NOK | http://autobuild.buildroot.net/results/3c7091d3eb446d751d27bbdc3b6ac729420699ac | ORPH
    m68k     |         libglvnd-1.4.0         | NOK | http://autobuild.buildroot.net/results/1cbd2f5d35709bf1db8ceeff26adc992416e41ed | ORPH
  powerpc    |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/9533b9497ddb6ea595f8845c6f38013edf199749 | ORPH
   arceb     |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/46d6c5e09d92aa8c20c525bda8f2ea0df0b57f24 | ORPH
microblazeel |           lz4-1.9.4            | NOK | http://autobuild.buildroot.net/results/119c33b0d6d52b66305b65a8e85ca6b4dfb55663 | ORPH
   sparc     |        mariadb-10.3.36         | NOK | http://autobuild.buildroot.net/results/1c55bb3220cd7bb15ccc4716db18ec4849f3c320 | ORPH
  mips64el   |       ocf-linux-20120127       | NOK | http://autobuild.buildroot.net/results/4bb084de6dd439eeca35921085c56313c393f351 | ORPH
   x86_64    |        open62541-v1.3.2        | NOK | http://autobuild.buildroot.net/results/34d58fdda976b7a5fc976ccd56a6b01d0c91e94c | ORPH
powerpc64le  |         pixman-0.42.2          | NOK | http://autobuild.buildroot.net/results/dbfa026ad677b2433b5ad3510d63282a4d45dc06 |     
   xtensa    |       python-sip-4.19.25       | NOK | http://autobuild.buildroot.net/results/34ba16a32dafb2026ae2b5b2e7c0346279dbcbf4 |     
  sparc64    |         tealdeer-1.5.0         | NOK | http://autobuild.buildroot.net/results/fec96bc509b3afdd424ed7a4b5224140aee18ba8 |     
    arm      |         wolfssl-5.5.3          | NOK | http://autobuild.buildroot.net/results/b1c04d12c0b5574b7610275a828cccca7cabe1ed |     



-- 
http://autobuild.buildroot.net

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

