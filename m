Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B3D2C05027
	for <buildroot@archiver.kernel.org>; Fri, 17 Feb 2023 06:41:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5E32C60AC3;
	Fri, 17 Feb 2023 06:41:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5E32C60AC3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nMkR3FA82UI4; Fri, 17 Feb 2023 06:41:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A879760BBB;
	Fri, 17 Feb 2023 06:41:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A879760BBB
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 598261BF363
 for <buildroot@lists.busybox.net>; Fri, 17 Feb 2023 06:41:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 37BCA403BE
 for <buildroot@lists.busybox.net>; Fri, 17 Feb 2023 06:41:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 37BCA403BE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TLJafdi7sMyi for <buildroot@lists.busybox.net>;
 Fri, 17 Feb 2023 06:41:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 36292400A4
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 36292400A4
 for <buildroot@buildroot.org>; Fri, 17 Feb 2023 06:41:18 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 51EFD24000C
 for <buildroot@buildroot.org>; Fri, 17 Feb 2023 06:41:16 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Fri, 17 Feb 2023 06:41:16 -0000
Message-Id: <20230217064122.37BCA403BE@smtp2.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1676616076; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=JIVllTzE3CVVDDXshz3T8p/vNjJEqX7vmwsyOJe2NMg=;
 b=X50QHh9UR1MYSu+/IGRXNZ0P3WH0CaoYloSh/yfwsbtGBGFCUWjC9E7Ngl5gqo3kfu1Hxl
 KgpN7W6GbAJshVkPe9odAFimQRZmlanLxevRr+sYwSSL57BL00g/P9BxMbfIaw7+f997PV
 EhO+31P+FxdnfYkPrBGehh3pGsc7ULo8diYCcje8ssiD9wb57gc7aIlB1fM7e0SgSdBv8b
 +KA6l4pTsY17MNhlOpsJpSKRLmPXGaqepZsBCqfhRzS3lfeCo59wYelRQKRSwYaAWMmCr9
 /KdOAhjl0hNBevJmajhOkjh/aXF8w+luBfb1yigKIx2ZHfxV0NN+iT/n8n2XtQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=X50QHh9U
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-02-16
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

Autobuild statistics for 2023-02-16
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  |  4  |  1  |  0  |  5  |
  2022.11.x  | 13  | 18  |  0  | 31  |
    master   | 152 | 186 |  0  | 338 |

Classification of failures by reason for master
-----------------------------------------------

                       unknown | 11
                  gnupg2-2.4.0 | 10
                host-go-1.19.6 | 8 
              host-pahole-1.24 | 7 
                gerbera-1.10.0 | 6 
           python-numpy-1.23.5 | 6 
                  zabbix-6.2.7 | 6 
  gobject-introspection-1.72.0 | 5 
            host-binutils-2.38 | 5 
                  linux-6.1.11 | 5 
                   perl-5.36.0 | 5 
              libgcrypt-1.10.1 | 4 
                elfutils-0.186 | 3 
glibc-2.36-81-g4f4d7a13edfd... | 3 
         host-libarchive-3.6.2 | 3 
               libglib2-2.72.3 | 3 
          linux-5.10.162-cip24 | 3 
            quickjs-2021-03-27 | 3 
                xenomai-3.0.10 | 3 
                   bird-2.0.11 | 2 
                 dc3dd-7.2.641 | 2 
            host-binutils-2.37 | 2 
        ltp-testsuite-20220930 | 2 
                mongodb-4.2.18 | 2 
                  netsurf-3.10 | 2 
            ocf-linux-20171122 | 2 
              php-xdebug-3.0.4 | 2 
                 systemd-252.4 | 2 
               tcf-agent-1.7.0 | 2 
             uccp420wlan-6.9.1 | 2 
ulog-0389d243352255f6182326... | 2 
           xtables-addons-3.22 | 2 
android-tools-4.2.2+git2013... | 1 
                    bat-0.19.0 | 1 
                  check-0.15.2 | 1 
                 ddrescue-1.26 | 1 
             docker-cli-23.0.0 | 1 
                    dust-0.8.1 | 1 
                     efivar-38 | 1 
             f2fs-tools-1.15.0 | 1 
                  ffmpeg-4.4.3 | 1 
               fftw-quad-3.3.8 | 1 
             fontconfig-2.13.1 | 1 
fs/cramfs/cramfs.mk:46: /ho... | 1 
fs/ubi/ubi.mk:51: /home/aut... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
                     gmp-6.2.1 | 1 
                gnu-efi-3.0.15 | 1 
             host-delve-1.20.0 | 1 
       host-gcc-initial-12.2.0 | 1 
host-gdb-arc-2020.09-releas... | 1 
                 ibrdtnd-1.0.1 | 1 
          imagemagick-7.1.0-51 | 1 
                  jack2-1.9.21 | 1 
                  janet-1.26.0 | 1 
                  kexec-2.0.25 | 1 
                       kmod-30 | 1 
          libcamera-apps-1.1.1 | 1 
               libcap-ng-0.8.3 | 1 
                  libjxl-0.7.0 | 1 
               libsigsegv-2.14 | 1 
     linux-5.10.162-cip24-rt10 | 1 
              liquid-dsp-1.4.0 | 1 
             lirc-tools-0.10.2 | 1 
                   luvi-2.13.0 | 1 
          modem-manager-1.20.4 | 1 
                    musl-1.2.3 | 1 
             netsniff-ng-0.6.8 | 1 
                    olsr-0.9.8 | 1 
               owl-linux-1.0.7 | 1 
                   pcre2-10.42 | 1 
                     php-8.2.2 | 1 
           python-pyicu-2.10.2 | 1 
                  reaver-1.6.6 | 1 
        s6-linux-utils-2.6.0.0 | 1 
                    sdl-1.2.15 | 1 
              skalibs-2.12.0.1 | 1 
                 snmppp-3.4.10 | 1 
              traceroute-2.1.0 | 1 
                 uclibc-1.0.42 | 1 
uqmi-0a19b5b77140465c29e2af... | 1 
                     vdr-2.6.3 | 1 
                 wavemon-0.9.4 | 1 
           wpa_supplicant-2.10 | 1 
               xfsprogs-5.14.2 | 1 
                  xvisor-0.3.1 | 1 
                    zeek-4.1.1 | 1 
               zxing-cpp-1.4.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 powerpc64   | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/6de44e79728ef4ebe4aad1087aafb71bc0a28d3f |     
    mips     |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/c2dd77d1d8a893e60930a40bc352cb66f01111cf |     
 powerpc64   |          bird-2.0.11           | NOK | http://autobuild.buildroot.net/results/9736d87ddabcc78525fe981d830f6e6c0b5fe2f6 |     
   arceb     |          bird-2.0.11           | NOK | http://autobuild.buildroot.net/results/06d027240756ba3ee058e6d4f68553f4e9843fc4 |     
   mips64    |          check-0.15.2          | NOK | http://autobuild.buildroot.net/results/f837cdd02bfd6c4dccb563e00072fe46fa58b8a9 | ORPH
    or1k     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/3ca9fc835b196273afef52f13d6fdf51bc2dda2b | ORPH
    or1k     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/26af26ee1c5f58ccab024370ed7eb8620570ce95 | ORPH
  riscv64    |         ddrescue-1.26          | NOK | http://autobuild.buildroot.net/results/0e65f79b7547c1cb3d4a56b2ef2e5be90ed23b06 | ORPH
    i686     |       docker-cli-23.0.0        | NOK | http://autobuild.buildroot.net/results/9d2fe18217f9f476c70dca77047c69ffac424f91 |     
   mipsel    |           dust-0.8.1           | NOK | http://autobuild.buildroot.net/results/d0e79f4f848a339eee9ca685a1a0cebe80d0b12a | ORPH
    arm      |           efivar-38            | NOK | http://autobuild.buildroot.net/results/f939a267ce864d65459bd5adf8122b4a0a474a20 |     
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/0bde0cf03f46a224a0acab36328f466c899bc1b1 | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/11b5aa42a8d6922a6b30c24f71ba2b0109484555 | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/3993fa82a7d2d6aa24853f38445c30a22224b44c | ORPH
    or1k     |       f2fs-tools-1.15.0        | NOK | http://autobuild.buildroot.net/results/0d40f26865d5576efdcee4fee5bd57fa775d352b |     
   mips64    |          ffmpeg-4.4.3          | NOK | http://autobuild.buildroot.net/results/f023d0bbed5455eb6ae26128ef86d136fdf2af88 |     
powerpc64le  |        fftw-quad-3.3.8         | NOK | http://autobuild.buildroot.net/results/4fbf24f4cae0307b33b9e155cd483c90e8f7ea12 | ORPH
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/36d3497c5f93e88b47608967b4c5ecfeb0bb720d | ORPH
  mips64el   | fs/cramfs/cramfs.mk:46: /ho... | NOK | http://autobuild.buildroot.net/results/c4340fc5754e83aa839f45b380ebf36386b7a360 |     
   x86_64    | fs/ubi/ubi.mk:51: /home/aut... | NOK | http://autobuild.buildroot.net/results/f253c1e0c8c17f3f42e7bef66d2a1769bad5ca35 |     
   arceb     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/120b45ceeff0bfd1f2bf8547992e31a747215701 |     
  powerpc    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/236f7d56c114cfb3cac9456669e68a07654fce2e |     
   sh4aeb    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/f9cfd6d0975855ddcddea01fcf0549904edd06df |     
   nios2     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/d73ba965be31f24bb28ddab6f82846375543270e |     
 aarch64_be  | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/b67c78838fa0bb7a136296e09d8fee44e724382a |     
   nios2     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/4cccb4a26df101518191afa7fb5fa719f1ebee2e |     
powerpc64le  |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/41721ceb12445888ce9b2084e6ce6922c37a0b4c |     
   x86_64    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/d43181481da37335fc35b5c29235fcea2a05cff2 |     
    or1k     |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/bbc26bdcc7d4a7faaee55dcd728ff0a587576931 |     
   x86_64    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/bbf59f4325a5fef59c34c95fcade1a7176279275 |     
   mipsel    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/cd72c33c324de08559873995b200d8ef83681a10 |     
  sparc64    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/44f1d18337a3987485b9420594f75aff04a9494b |     
  powerpc    | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/8b3262657cd25cdae119e8e00bdf395c1fd3f988 |     
  powerpc    | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/e46a0a6a00aa4738c69ef2acc5d1cc849e28277a |     
powerpc64le  | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/fbe9012c528dc7cc965de8f3dda69e7b4109bc56 |     
  riscv64    |           gmp-6.2.1            | NOK | http://autobuild.buildroot.net/results/8156c5fc7410340650a00a521d27a365177f8477 | ORPH
  mips64el   |         gnu-efi-3.0.15         | NOK | http://autobuild.buildroot.net/results/17971e777b2f26a610da8125079cf963c0f49640 |     
  sparc64    |          gnupg2-2.4.0          | NOK | http://autobuild.buildroot.net/results/e54f80b5fa40085173343c70c9ac396684f1def8 |     
   mips64    |          gnupg2-2.4.0          | NOK | http://autobuild.buildroot.net/results/2fc8acfb2df01e7dfb99f5de25f7621bf6147679 |     
    or1k     |          gnupg2-2.4.0          | NOK | http://autobuild.buildroot.net/results/077166eb71e1f124101895b2b3abf9f94d7543d5 |     
  sparc64    |          gnupg2-2.4.0          | NOK | http://autobuild.buildroot.net/results/ead3a99a7912a6cfacb70a286811a42da0e2ab7a |     
   mips64    |          gnupg2-2.4.0          | NOK | http://autobuild.buildroot.net/results/9ddb2288d638d047b248b30c46039da0387dd5e7 |     
    arm      |          gnupg2-2.4.0          | NOK | http://autobuild.buildroot.net/results/84ac9019e2a2b28236c9b38b985296da507a0e87 |     
   mips64    |          gnupg2-2.4.0          | NOK | http://autobuild.buildroot.net/results/ecf420363e14d5d7f3ffca2181053c657701a043 |     
 powerpc64   |          gnupg2-2.4.0          | NOK | http://autobuild.buildroot.net/results/a7fb00ace9954804bacb690f7e91cd0dc3546e2f |     
 aarch64_be  |          gnupg2-2.4.0          | NOK | http://autobuild.buildroot.net/results/0d79bf49f61e5b106375f53600c455561440a64a |     
  sparc64    |          gnupg2-2.4.0          | NOK | http://autobuild.buildroot.net/results/deaee8a591c84d6d88d85da53bf5992fbe2e42f5 |     
   nios2     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/77ab421e5c3142090274e79092a28e951615b3cf | ORPH
   x86_64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/5fb2b7c481746137accc8b05f78c9fdfa7decf4d | ORPH
microblazeel |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/a71093886e7d9f7b6eb7691b91f7082083598cbf | ORPH
    or1k     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/97159375d60650e5960ef2a0d3358373e8aa9edb | ORPH
   s390x     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/d885c583d6052cc9c2d386f79812230fe4202f6e | ORPH
    i686     |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/a32180792367070f7fd87969fa97bb579a0fb06e |     
   sh4eb     |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/85e139fd4b77437fa64c4af81e5a077686c38adb |     
    arc      |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/c0392b321ffcecb82ecf39b90b4b837b1b644630 |     
   xtensa    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/2226d524a6c91e943432438f4b26d76597b44abe |     
   xtensa    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/9ec53c0b08ebe81d24062baf794fba1e5f5f9ad7 |     
   xtensa    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/0894997034da9626d6018316e9270818ca81ed7c |     
   mipsel    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/665526e1f891f774403fbff223994ceb5a583074 |     
   x86_64    |       host-delve-1.20.0        | NOK | http://autobuild.buildroot.net/results/a5298e3133ab1e2555a2dded4f10f54560494d62 |     
    or1k     |    host-gcc-initial-12.2.0     | NOK | http://autobuild.buildroot.net/results/858e673a04ff766ec312ca09a182f29ad037cfe0 |     
    arc      | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/8c68734dcbcc2512c473cc64785df8634cfc952c | ORPH
   mips64    |         host-go-1.19.6         | NOK | http://autobuild.buildroot.net/results/10fd58a454a3246fd9717999c7a0c29a155dcec6 |     
    i686     |         host-go-1.19.6         | NOK | http://autobuild.buildroot.net/results/e478e04405e2e530b7d986e044b6997d127b2a52 |     
  mips64el   |         host-go-1.19.6         | NOK | http://autobuild.buildroot.net/results/d142a6bc8f789c097744e38e52b855af97167f5f |     
  mips64el   |         host-go-1.19.6         | NOK | http://autobuild.buildroot.net/results/d06ac5eb845ccf973d64106cc70931c1ff9689be |     
    i686     |         host-go-1.19.6         | NOK | http://autobuild.buildroot.net/results/0c47d0ebd12d8037fb99da5f20cbe46a1a4c37d8 |     
    i686     |         host-go-1.19.6         | NOK | http://autobuild.buildroot.net/results/e0d8c98007152b2a8b22a58a79e1c6754ffa38f3 |     
   mips64    |         host-go-1.19.6         | NOK | http://autobuild.buildroot.net/results/e868fe389c8011c61bce7d6f2bb9c2e38a434fc5 |     
    i686     |         host-go-1.19.6         | NOK | http://autobuild.buildroot.net/results/3b0de7e607b6ab8c7af33bda05122475e7922771 |     
   sparc     |     host-libarchive-3.6.2      | NOK | http://autobuild.buildroot.net/results/d7721e21bf4b89674ceec6b5b1485dc8b4fc60cf |     
  sparc64    |     host-libarchive-3.6.2      | NOK | http://autobuild.buildroot.net/results/a97764c692e2b0159fa5749b610b6889b398eb3b |     
    i686     |     host-libarchive-3.6.2      | NOK | http://autobuild.buildroot.net/results/9b2aaa67d01a9dce853409562d385fad397a1a9f |     
   armeb     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/6d825e029856a35c2de5e666410d0cf0440d2b5c |     
   x86_64    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/1cba10a7820ba01dbaaa424ce546466cf3bcd55f |     
  sparc64    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/ee268b09b5c3f8e0b25c0f457cf2eb0194900c0d |     
   armeb     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/c89fb45b52fe872cd4902cfc66f697a11ef1d376 |     
    or1k     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/071e7d2b6fb138e9e02d521c14b0077e64909df3 |     
   s390x     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/35b844082a3f0f076156b130cbe7fe32ee2ecf3b |     
    sh4a     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/0b7ab885c27be643ce17c597084b74b600d45ec0 |     
   nios2     |         ibrdtnd-1.0.1          | NOK | http://autobuild.buildroot.net/results/e32dd44fd9cf77cd439d2edf1027c90e96d79885 | ORPH
    sh4a     |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/aa46da31950506a6a4d13831b1df34a394b0851b | ORPH
    m68k     |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/8fd9f57b33568524d1af4dd0193969fac7a26988 |     
   arceb     |          janet-1.26.0          | NOK | http://autobuild.buildroot.net/results/16ea3613e5ff4a029ea6db14dd689b237b6bdd51 |     
    sh4a     |          kexec-2.0.25          | NOK | http://autobuild.buildroot.net/results/27247e94111a8f9170020de273c809cdd9eddd90 | ORPH
   mips64    |            kmod-30             | NOK | http://autobuild.buildroot.net/results/206c1cbd6fea08ed6a114c0d375d816bdc4bdf6f |     
 microblaze  |      libcamera-apps-1.1.1      | NOK | http://autobuild.buildroot.net/results/7b8e23230602768a5478208d781255a73f8553d5 |     
  riscv64    |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/e09a618c7ef907d45cf92b0bc346c68246157b01 |     
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/b1928a808c68fe43b6ebed146e67aebddd1ce8c8 | ORPH
   armeb     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/01187bcf80903a29ad758e6d0321e09ad7019980 | ORPH
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/cf1db81cb83927305d5a2f59bba7ce36e4a74e52 | ORPH
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/8b6877a37ee854fed2f153b1a1fa6217c78a275b | ORPH
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/b83e50b96e321a810b9e4a9d075f842c359921ff |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/18a429c1ab8bf1c2c0cad7eefffb462542e4094b |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/baecdb18976e108ca87cb763427e1a25430cd847 |     
microblazeel |          libjxl-0.7.0          | NOK | http://autobuild.buildroot.net/results/505a9767abe7116d70853ca7f5d3564fbf34be78 |     
  powerpc    |        libsigsegv-2.14         | NOK | http://autobuild.buildroot.net/results/414de566389ecdc67f0d1eaa711eaffc90a2d940 |     
   sh4aeb    |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/df4578f77eea4d5589634958626c5dfa05a709d2 | ORPH
   mips64    |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/5d38cbd2e6e3622f8469c3ef6c124764f07acddb | ORPH
    m68k     |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/cbe88903b2c980845c3a11c25ba8fd77cba929b6 | ORPH
powerpc64le  |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/ebf8e774af6d7d9e18eaa4da2ab98aaa7df25cdb | ORPH
   mipsel    |          linux-6.1.11          | NOK | http://autobuild.buildroot.net/results/40cd3c774eecd3744c65af87211e48ed116a41b7 | ORPH
   mips64    |          linux-6.1.11          | NOK | http://autobuild.buildroot.net/results/bbc9762ee0358e08608132fec7886f47dd4e746b | ORPH
   mipsel    |          linux-6.1.11          | NOK | http://autobuild.buildroot.net/results/f80cbbb984b3d8c4de325653f131425920fb2ca7 | ORPH
   mipsel    |          linux-6.1.11          | NOK | http://autobuild.buildroot.net/results/3e2b5c8ea81c56f58374b384de9d6b8cd3708da9 | ORPH
   sh4aeb    |          linux-6.1.11          | NOK | http://autobuild.buildroot.net/results/60bf39ac97119b60fb675bceede9432fb432106f | ORPH
    arm      |        liquid-dsp-1.4.0        | NOK | http://autobuild.buildroot.net/results/0b384930bf48e5578842abffee065825dfc98aa6 |     
  aarch64    |       lirc-tools-0.10.2        | NOK | http://autobuild.buildroot.net/results/93830d30ec9301fd99f417ee4cca0a93b8020efb | ORPH
powerpc64le  |     ltp-testsuite-20220930     | NOK | http://autobuild.buildroot.net/results/0790bbc8d99659a801f2eb108ec0dec62199fd3d |     
   s390x     |     ltp-testsuite-20220930     | NOK | http://autobuild.buildroot.net/results/ceade8103e84303e205fdad31f9ba46f2617cd34 |     
  aarch64    |          luvi-2.13.0           | NOK | http://autobuild.buildroot.net/results/f63633b494b3451732ec765d7b64795a4e410f32 | ORPH
  aarch64    |      modem-manager-1.20.4      | NOK | http://autobuild.buildroot.net/results/270c745b859ec7f7b2ae95a8f22470a966e3dde4 |     
    arm      |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/912790f0032a222351b01367fee32e750b172b46 |     
  aarch64    |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/f3c43532b6bd417abcbac646ced70c297b020a48 |     
  powerpc    |           musl-1.2.3           | NOK | http://autobuild.buildroot.net/results/f352489b5b0545c7a644eaa7d052b4c4d3f360dd |     
powerpc64le  |       netsniff-ng-0.6.8        | NOK | http://autobuild.buildroot.net/results/4b433a2ab36576714559fd8dd97483922f8d2e8b |     
   sparc     |          netsurf-3.10          | NOK | http://autobuild.buildroot.net/results/48e16f69249ca38fe2c35fa3c20f500e41058e69 |     
 aarch64_be  |          netsurf-3.10          | NOK | http://autobuild.buildroot.net/results/6b4c873a9c5e32426fc2446b9dce30c5f5280cae |     
   s390x     |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/29be45c68be71d78537bd4aa0ffad2e69b0826bf | ORPH
   sparc     |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/625944ad06a22b5de98e927acdf59859638d022d | ORPH
    or1k     |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/7c2fcf32bcf9bf54563338eff54017fcd4ed4b79 | ORPH
   armeb     |        owl-linux-1.0.7         | NOK | http://autobuild.buildroot.net/results/45911e8e146a11aa53173a3b954de5c673ef15ac |     
   sparc     |          pcre2-10.42           | NOK | http://autobuild.buildroot.net/results/6363c9474fb3485329a6b6630a5c8a1750211acd | ORPH
   mips64    |          perl-5.36.0           | NOK | http://autobuild.buildroot.net/results/042b913f6252b8535fa74751b75ce58a408e2c59 |     
   arceb     |          perl-5.36.0           | NOK | http://autobuild.buildroot.net/results/61fe4b21fb819156ff7bc509b7e2a8f98ab22140 |     
    sh4      |          perl-5.36.0           | NOK | http://autobuild.buildroot.net/results/bf8a14ea16a155a876ab7e302dff1f1a0c66bdc7 |     
  sparc64    |          perl-5.36.0           | NOK | http://autobuild.buildroot.net/results/6feda086cc912a10aaf049aa10d7c887b1b74862 |     
    i486     |          perl-5.36.0           | NOK | http://autobuild.buildroot.net/results/e20361eccdd96cfe3d807f85bc680f6be8e8c9c0 |     
 microblaze  |           php-8.2.2            | NOK | http://autobuild.buildroot.net/results/e816c98d0e705dddb062b19ec39257cf18e515c7 |     
    mips     |        php-xdebug-3.0.4        | NOK | http://autobuild.buildroot.net/results/601f28f6324ba7f292d9465296bcf6697ee69795 |     
   s390x     |        php-xdebug-3.0.4        | NOK | http://autobuild.buildroot.net/results/1f8ba349162acd80684d05a4eae4b8ef4eec7635 |     
 powerpc64   |      python-numpy-1.23.5       | NOK | http://autobuild.buildroot.net/results/40c09549f7843df8319e4f8f37f914939945741f |     
  aarch64    |      python-numpy-1.23.5       | NOK | http://autobuild.buildroot.net/results/44cbf26b08fc3eb5097e27077c58d0508bc8ed69 |     
   x86_64    |      python-numpy-1.23.5       | NOK | http://autobuild.buildroot.net/results/b1b881c7cc99f7355cc49daa00f75b61eaa789eb |     
    sh4      |      python-numpy-1.23.5       | NOK | http://autobuild.buildroot.net/results/db051d1ea131094ebb2c36587c4d98a6c7c76fff |     
    sh4      |      python-numpy-1.23.5       | NOK | http://autobuild.buildroot.net/results/178bb7babdde395df1ed9e4a8dc6de2e13293af2 |     
   x86_64    |      python-numpy-1.23.5       | NOK | http://autobuild.buildroot.net/results/bea485c7ef84ca01a08526807dd421bb357cb924 |     
    or1k     |      python-pyicu-2.10.2       | NOK | http://autobuild.buildroot.net/results/960cb33e35c1e506c1b3bb663122cbf3993234de |     
    mips     |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/57e8a455791d47a7ab2d2389bf2ec32ba7e1fb4e |     
 microblaze  |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/3d53c943454adf0ac22335bdd017636c9f461ee9 |     
microblazeel |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/1ed4d2a9a19f77857e05e567b050f763faa37034 |     
    arc      |          reaver-1.6.6          | NOK | http://autobuild.buildroot.net/results/5f33e33be1bc4b96a0440969140d0af42912a739 |     
    mips     |     s6-linux-utils-2.6.0.0     | NOK | http://autobuild.buildroot.net/results/e41e3385b5559b59de65437ef3f26c69a5eb9214 |     
   sh4aeb    |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/c2d2c1b5862a21e9f9b3c982c84551ed38a4fd1c | ORPH
    or1k     |        skalibs-2.12.0.1        | NOK | http://autobuild.buildroot.net/results/2d193c40c667ec7ed912b6c3fcbef434c878b2b7 |     
powerpc64le  |         snmppp-3.4.10          | NOK | http://autobuild.buildroot.net/results/50b8f92fdbab3e8f0b386ef4cea8884a6b3f19c3 |     
 powerpc64   |         systemd-252.4          | NOK | http://autobuild.buildroot.net/results/529052ca41ff9fc4022b50f1beb0967e21058429 |     
 aarch64_be  |         systemd-252.4          | NOK | http://autobuild.buildroot.net/results/0b1ce5e29326f168b1915f893018ba4d055fd914 |     
microblazeel |        tcf-agent-1.7.0         | NOK | http://autobuild.buildroot.net/results/a81e5b7c920471d988d04b1431e314345e627f75 |     
microblazeel |        tcf-agent-1.7.0         | NOK | http://autobuild.buildroot.net/results/576ff8326f907610c42f768acb69815a79740d43 |     
  mips64el   |        traceroute-2.1.0        | NOK | http://autobuild.buildroot.net/results/fe35d00284ea5d06c51245dd9513cf23c251f724 |     
    arc      |       uccp420wlan-6.9.1        | NOK | http://autobuild.buildroot.net/results/1a6f78fa36e0fbc4de7942720e010ce04a551b15 | ORPH
   s390x     |       uccp420wlan-6.9.1        | NOK | http://autobuild.buildroot.net/results/716386e31412a1c2e3f3acad88e24d3ecef90f3c | ORPH
  powerpc    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/6964e958c5d5b3c24cd547069b129c7e87108b34 |     
   nios2     | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/82d19a0f209253ea0dc27c845932f54166c05afa |     
powerpc64le  | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/b8db315e56ba313d6489036c20aa43609289474e |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/846a9f7bc0f41da2bfd4f18377470f2c329a8ce2 |     
    m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/fe5fbb92594a62fb30aa6803fbb990aae23c0507 |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/3bb5a72c3b3d58a37ec7a1f406ff2f9c896e25a6 |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/79b1637148d7d4fa8215b56eae0969a66d189cb0 |     
    mips     |            unknown             | NOK | http://autobuild.buildroot.net/results/9ad0e1ca793568420420bf7d1e72ae7873b04238 |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/ede47e2c46dc7b7d7109b22783938c38d726ef87 |     
 powerpc64   |            unknown             | NOK | http://autobuild.buildroot.net/results/5a3b7ac0d425fe82d2fc07aaab36c35c8ccb1c8e |     
    mips     |            unknown             | NOK | http://autobuild.buildroot.net/results/17e51f61405112a7ce7d70e121ce3cda5dea3ff4 |     
   mips64    |            unknown             | NOK | http://autobuild.buildroot.net/results/65e2288f41ff3dd0c1cecdf0a1b5d2a68eecbedf |     
 powerpc64   |            unknown             | NOK | http://autobuild.buildroot.net/results/4f1d0ab3efbd93737be5f8b03ca2e0e548dc3b15 |     
    sh4      |            unknown             | NOK | http://autobuild.buildroot.net/results/e8ba058488bdd7bb3c188c026629e9e08fa42d5d |     
    i686     | uqmi-0a19b5b77140465c29e2af... | NOK | http://autobuild.buildroot.net/results/88802c80854626cd34f88d98ead9aec29ab12ceb | ORPH
    or1k     |           vdr-2.6.3            | NOK | http://autobuild.buildroot.net/results/7cfd815037e345b2ef9d309bf9d59bc6310e1ebe |     
    arm      |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/8acd7f1fe23fcc84b915f53b145905b747f8d185 | ORPH
   arceb     |      wpa_supplicant-2.10       | NOK | http://autobuild.buildroot.net/results/f349130985870f4a781cca56c3f551108f81aa3e |     
 microblaze  |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/07b4740f56668c3d9ec5a71f945533e1ceacdae9 |     
  riscv32    |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/a5f4acb08892f2dfa3658106a6174eae5638fb5e |     
   nios2     |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/dbf2ebd472615b2b652bff7822d1214cf71bb43f |     
   mips64    |        xfsprogs-5.14.2         | NOK | http://autobuild.buildroot.net/results/3b46e7a419df07412601b65a7444d6a4e4405941 | ORPH
    arc      |      xtables-addons-3.22       | NOK | http://autobuild.buildroot.net/results/501d47ccc3f1096d159d92f9cf2d98dced0566da | ORPH
    arc      |      xtables-addons-3.22       | NOK | http://autobuild.buildroot.net/results/2f204a9c05b5801f251c0c799ee6a8d607ea6efa | ORPH
  aarch64    |          xvisor-0.3.1          | NOK | http://autobuild.buildroot.net/results/c72e49479e541bde248490173a6a4b76366eb7fd |     
microblazeel |          zabbix-6.2.7          | NOK | http://autobuild.buildroot.net/results/a8aed62e550cf20dc20737e7516a6fa0875a0be0 |     
   nios2     |          zabbix-6.2.7          | NOK | http://autobuild.buildroot.net/results/4f7406ec4bf7c72dca8b4ba2109977ce1771b90a |     
 aarch64_be  |          zabbix-6.2.7          | NOK | http://autobuild.buildroot.net/results/712c35d84c03041c81991f07549d09869be1ff15 |     
   nios2     |          zabbix-6.2.7          | NOK | http://autobuild.buildroot.net/results/9303fc036e98267ea4fda8fde6d89c83f6a15c40 |     
  aarch64    |          zabbix-6.2.7          | NOK | http://autobuild.buildroot.net/results/9b6da726841e8a4281be61442f47165bc77d8884 |     
   mips64    |          zabbix-6.2.7          | NOK | http://autobuild.buildroot.net/results/7a3a0f152bdbc4b7a6a6fc91794bdec17a0c85e5 |     
 powerpc64   |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/c7c58429e597c0d496244924aaf5a8aa65d5650f |     
   sparc     |        zxing-cpp-1.4.0         | NOK | http://autobuild.buildroot.net/results/77002bd19a9b8a089d340f20880144bc8b58745c |     


Classification of failures by reason for 2022.02.x
--------------------------------------------------

                  zabbix-5.4.9 | 1 


Detail of failures for 2022.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   s390x     |          zabbix-5.4.9          | NOK | http://autobuild.buildroot.net/results/2aabb416e97609e1868056ca7a0bb294fe8f6b20 |     


Classification of failures by reason for 2022.11.x
--------------------------------------------------

                  xxhash-0.8.1 | 2 
                  zabbix-5.4.9 | 2 
                   audit-3.0.7 | 1 
                     efivar-38 | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
                gerbera-1.10.0 | 1 
  gobject-introspection-1.72.0 | 1 
              host-pahole-1.24 | 1 
               libglib2-2.72.3 | 1 
             lirc-tools-0.10.2 | 1 
          lttng-modules-2.13.1 | 1 
                  netsurf-3.10 | 1 
               pcsc-lite-1.9.9 | 1 
                       unknown | 1 
                xenomai-3.0.10 | 1 
                      xz-5.2.7 | 1 


Detail of failures for 2022.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |          audit-3.0.7           | NOK | http://autobuild.buildroot.net/results/0bd7bcc8e1eb49d6800fe728fb52d84a3575ce81 |     
   mipsel    |           efivar-38            | NOK | http://autobuild.buildroot.net/results/932e5c9fd97b8a9666e8eb11d5ec5431edc5be39 |     
   mips64    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/6dd752c77ed42e9ecce56da8b0907682f82b0b5c |     
 aarch64_be  |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/1fbda6fb4f804f66094b99b8f99dd94ba80895a8 |     
   x86_64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/2d6e5ccd1c48c3269e83fc339abe59fe3efbda5d | ORPH
   xtensa    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/8e60bb21a91c48ca5cd304593f802b55af1810eb |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/26ce3470b5ebf9c951abbc49dd0aaffcf18496a8 |     
    arm      |       lirc-tools-0.10.2        | NOK | http://autobuild.buildroot.net/results/dcba3c40836b61f452e190307ea7e10d367d4da7 | ORPH
 aarch64_be  |      lttng-modules-2.13.1      | NOK | http://autobuild.buildroot.net/results/12ca286547d078f79316526ebcc095f5ab89076a |     
  sparc64    |          netsurf-3.10          | NOK | http://autobuild.buildroot.net/results/9ecd505890cb5927bc45fddde8f2ec9d6c5336cd |     
    or1k     |        pcsc-lite-1.9.9         | NOK | http://autobuild.buildroot.net/results/32327068d68750e0745c39e2579969d5185db47b | ORPH
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/f244f9aab5c14fcb71ec3cac0adfa516b293a1a8 |     
    m68k     |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/bc2a11d3b5128b321e5aec77afc2c4a69498ecfa |     
    or1k     |          xxhash-0.8.1          | NOK | http://autobuild.buildroot.net/results/991ef12aa98d259aa363f7f56e4d393daf60c2e8 | ORPH
    or1k     |          xxhash-0.8.1          | NOK | http://autobuild.buildroot.net/results/94833d60d5e186466eb11771662f4068378a744b | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/d20cb1891f8ec9d319253d0311cff0d018fb4a09 | ORPH
    mips     |          zabbix-5.4.9          | NOK | http://autobuild.buildroot.net/results/d634c8a94e81f911e679cd21bed55c947301f618 |     
   mips64    |          zabbix-5.4.9          | NOK | http://autobuild.buildroot.net/results/781606f1fdf7bad8457fbf24d5f85ede9f29cc83 |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
