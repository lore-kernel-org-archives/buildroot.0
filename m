Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42FB0C04A95
	for <buildroot@archiver.kernel.org>; Thu, 29 Sep 2022 05:34:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 97CBC4045C;
	Thu, 29 Sep 2022 05:34:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 97CBC4045C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G6kn0Epo1ArU; Thu, 29 Sep 2022 05:34:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0BEFF40482;
	Thu, 29 Sep 2022 05:34:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0BEFF40482
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 81A691BF873
 for <buildroot@lists.busybox.net>; Thu, 29 Sep 2022 05:34:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 502C660FA7
 for <buildroot@lists.busybox.net>; Thu, 29 Sep 2022 05:34:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 502C660FA7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KrBfq0QtnW4i for <buildroot@lists.busybox.net>;
 Thu, 29 Sep 2022 05:34:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DD63F60AFC
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DD63F60AFC
 for <buildroot@buildroot.org>; Thu, 29 Sep 2022 05:34:33 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id ED58640002
 for <buildroot@buildroot.org>; Thu, 29 Sep 2022 05:34:30 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Thu, 29 Sep 2022 05:34:30 -0000
Message-Id: <20220929053437.502C660FA7@smtp3.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1664429671; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=cyPvLbZCDP/bgLZq3hmBQyHIv3z3Jj5oBiKsToLrfxA=;
 b=H8mvQtAFGTMuYjNFNh1QQWtSBYXtKPW4+gs6FD/y+RgiTGm3LakWlYhj1Ag3ndHmxFUr7d
 O44MwqIQn0DxiySDzF4uaeSciw1aLUP6/Y9MJAbiIu9TrwE04/ZICXexigdehgyO4W0z90
 B4RsIDoy6X4Vpq6nxPLWGKmPTdIMPlnG+hgy1BNmHNTa6AJQOqKnrTTiXe0LOjHsxOZQbr
 rMSuWlY700pHStTpMmA1OFOzcM9DHKdXbNt0uqaFrQ1/xGk52CNxIhadRKEYNVtCdG9QMN
 3o1bl9r/CgUXfaQa/tVpe5PeHQNHAVloWzIVUnliw4qr9A3iVffd05n/QfwFyg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=H8mvQtAF
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-09-28
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

Autobuild statistics for 2022-09-28
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  |  9  |  1  |  0  | 10  |
  2022.05.x  |  9  | 23  |  0  | 32  |
    master   | 209 | 307 |  1  | 517 |

Classification of failures by reason for master
-----------------------------------------------

                      crun-1.5 | 18
glibc-2.36-44-g2628500f5dff... | 15
        host-sentry-cli-1.59.0 | 15
                       unknown | 15
                 sysvinit-2.99 | 11
            host-binutils-2.38 | 10
            igd2-for-linux-2.1 | 9 
                 systemd-250.4 | 8 
casync-4ad9bcb94bc83ff36cfc... | 7 
                host-go-1.19.1 | 7 
                  autofs-5.1.8 | 6 
            btrfs-progs-5.16.2 | 6 
                gerbera-1.10.0 | 6 
  gobject-introspection-1.72.0 | 6 
             libgpg-error-1.45 | 6 
                   hdparm-9.63 | 5 
              libarchive-3.6.1 | 5 
                  gensio-2.5.2 | 4 
host-pahole-73383b3a39afe86... | 4 
                 linux-5.17.15 | 4 
luajit-5677985dc1f19cf0a671... | 4 
                 zlib-ng-2.0.6 | 4 
                    brltty-6.4 | 3 
                elfutils-0.186 | 3 
              host-rust-1.64.0 | 3 
               libglib2-2.72.3 | 3 
                   libnss-3.83 | 3 
       linux-5.10.109-cip5-rt4 | 3 
                   opensbi-0.9 | 3 
                   perl-5.34.1 | 3 
                  zabbix-5.4.9 | 3 
                    bat-0.19.0 | 2 
dahdi-linux-5c840cf43838e06... | 2 
               fftw-quad-3.3.8 | 2 
             fontconfig-2.13.1 | 2 
            host-binutils-2.37 | 2 
         host-gcc-final-10.4.0 | 2 
              libgcrypt-1.10.1 | 2 
        ltp-testsuite-20220527 | 2 
                    lxc-4.0.12 | 2 
            ocf-linux-20120127 | 2 
            quickjs-2021-03-27 | 2 
                 wolfssl-5.5.0 | 2 
                    zeek-4.1.1 | 2 
/home/buildroot/autobuild/i... | 1 
              alsa-lib-1.2.7.2 | 1 
                bpftool-v6.8.0 | 1 
                   bullet-3.21 | 1 
                  cairo-1.16.0 | 1 
              containerd-1.6.8 | 1 
              dieharder-3.31.1 | 1 
           docker-cli-20.10.18 | 1 
        edk2-edk2-stable202102 | 1 
                     efivar-37 | 1 
                   expat-2.4.9 | 1 
       freeradius-server-3.2.0 | 1 
                     frr-8.3.1 | 1 
fs/cpio/cpio.mk:117: /home/... | 1 
fs/cpio/cpio.mk:117: /home/... | 1 
fs/cpio/cpio.mk:117: /nvmed... | 1 
fs/cpio/cpio.mk:117: /nvmed... | 1 
fs/cramfs/cramfs.mk:46: /nv... | 1 
fs/cramfs/cramfs.mk:46: /nv... | 1 
fs/romfs/romfs.mk:32: /nvme... | 1 
fs/romfs/romfs.mk:32: /nvme... | 1 
fs/ubi/ubi.mk:51: /nvmedata... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /nvme... | 1 
fs/ubifs/ubifs.mk:49: /nvme... | 1 
fs/ubifs/ubifs.mk:49: /nvme... | 1 
                      gdb-11.2 | 1 
                     gmp-6.2.1 | 1 
         gobject-introspection | 1 
               gocryptfs-2.2.1 | 1 
            host-binutils-2.39 | 1 
         host-gcc-final-11.3.0 | 1 
         host-gcc-final-12.2.0 | 1 
host-gdb-arc-2020.09-releas... | 1 
           host-libxml2-2.10.2 | 1 
      host-riscv-isa-sim-1.1.0 | 1 
              hyperfine-1.14.0 | 1 
            igh-ethercat-1.5.2 | 1 
               ipmitool-1_8_19 | 1 
                  jack2-1.9.20 | 1 
libcamera-ba6435930f08e802c... | 1 
               libcap-ng-0.8.3 | 1 
                libdrm-2.4.112 | 1 
                    libev-4.33 | 1 
               libmdbx-0.11.11 | 1 
                   libqb-2.0.6 | 1 
   libtorrent-rasterbar-1.2.15 | 1 
              libuhttpd-3.14.1 | 1 
           linux-5.10.115-cip7 | 1 
            linux-fusion-9.0.3 | 1 
                   linux-tools | 1 
          lttng-modules-2.13.1 | 1 
                      lzo-2.10 | 1 
                  mender-3.3.0 | 1 
         mxs-bootlets-10.12.01 | 1 
                 openal-1.22.0 | 1 
                 opencv4-4.6.0 | 1 
               openpgm-5-3-128 | 1 
                 openssh-9.0p1 | 1 
   openvmtools-11.3.5-18557794 | 1 
                    opus-1.3.1 | 1 
          perl-net-ssleay-1.85 | 1 
     portaudio-190700_20210406 | 1 
                 protobuf-21.6 | 1 
    python-cryptography-38.0.1 | 1 
         rabbitmq-server-3.8.2 | 1 
                ramspeed-2.6.0 | 1 
rtl8189es-39c17661136da48f8... | 1 
rtl8723bu-d79a676a8d3f0bb6a... | 1 
                    rtty-7.4.0 | 1 
              skalibs-2.10.0.3 | 1 
                 sudo-1.9.11p2 | 1 
toolchain-external-codescap... | 1 
                   trinity-1.9 | 1 
ulog-0389d243352255f6182326... | 1 
uqmi-0a19b5b77140465c29e2af... | 1 
               valgrind-3.19.0 | 1 
                xenomai-3.0.10 | 1 
               xfsprogs-5.14.2 | 1 
                    zstd-1.5.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/3a26e77e0bbadbc932e5c35f8c826e09fdcea636 |     
    or1k     |        alsa-lib-1.2.7.2        | NOK | http://autobuild.buildroot.net/results/5928ecbaa6af78b43da78b15956c8d138b0c3fd7 |     
  sparc64    |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/473a1afa0ab47933aabd8e25da25149754d58294 |     
  aarch64    |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/1fe67d79c7f11c5843f30adc6a07990d55abbfca |     
    or1k     |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/50eb9411ab631779d0a95df258de5d7f2d687268 |     
  mips64el   |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/56544f7ba9894fa345ef1bf0d707ddb4d853f3ba |     
  mips64el   |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/bac38601eb663512f33617f931efb6f7f6fb9e70 |     
  sparc64    |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/d14292331868062a5607d0776abff528e3a7800d |     
    mips     |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/ae46112cd501c6425b99ff0af0cafe499642aa73 |     
    arm      |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/ba9614cb319e870d1e989834a54c74c8866c9c02 |     
 aarch64_be  |         bpftool-v6.8.0         | NOK | http://autobuild.buildroot.net/results/336510a43de23e082cab3e8dcb20b15d552b05d6 |     
   mipsel    |           brltty-6.4           | NOK | http://autobuild.buildroot.net/results/a098777f51dbad48302d2b4e33f26276cda94ca4 |     
    mips     |           brltty-6.4           | NOK | http://autobuild.buildroot.net/results/0f96bdcd25b182755cdd5fd4135389220cac4a90 |     
powerpc64le  |           brltty-6.4           | NOK | http://autobuild.buildroot.net/results/325a812d825a89d025f146ed4d126568ef7b230a |     
   s390x     |       btrfs-progs-5.16.2       | NOK | http://autobuild.buildroot.net/results/6cd42485279e337f15be9cd135d0caf4611090b2 | ORPH
microblazeel |       btrfs-progs-5.16.2       | NOK | http://autobuild.buildroot.net/results/1c916a27ac4d72c078a8f9213ad0c5e052c3729c | ORPH
   s390x     |       btrfs-progs-5.16.2       | NOK | http://autobuild.buildroot.net/results/ccb71459c1749a0d13366f76ec0b62cd294a4e94 | ORPH
 aarch64_be  |       btrfs-progs-5.16.2       | NOK | http://autobuild.buildroot.net/results/3f7cb0621c7baf93d3f1e0a65a74ee234b4483df | ORPH
microblazeel |       btrfs-progs-5.16.2       | NOK | http://autobuild.buildroot.net/results/1a6f7f1f643dc7f8506d0eed2421dd0af251a61c | ORPH
   s390x     |       btrfs-progs-5.16.2       | NOK | http://autobuild.buildroot.net/results/e52bf309a66e422f0805179ca3418c40ca65dfe0 | ORPH
    or1k     |          bullet-3.21           | NOK | http://autobuild.buildroot.net/results/5cbfb37c7a7a99bb5729dee4dd1ae830353bea54 |     
   xtensa    |          cairo-1.16.0          | NOK | http://autobuild.buildroot.net/results/fd7e5c2d3b9c2b852449347c6beed7358b47f235 |     
   x86_64    | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/30724723872be0660e2eccedcf08b30c0e9faef1 |     
   armeb     | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/2d20930ef3d08e5cf660b82111a6f300fa9cd47c |     
 aarch64_be  | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/b8ff10bf7ca61f226c398d838fb112b86cb22e50 |     
  sparc64    | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/1c585a3960676ab0a1a90c9ad61736ad4dd65729 |     
 microblaze  | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/cf2d9eefa3180c1f35702d8ec39ccb74b9093de6 |     
   sh4aeb    | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/a3b3d82fa09a77c6bac622ffd768931aa0bd6350 |     
   nios2     | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/6b541379f1b317a6414c6dad8ad90fc51b732189 |     
   x86_64    |        containerd-1.6.8        | NOK | http://autobuild.buildroot.net/results/2477f71448234b5eb61af5fd8e2f56d8534963f6 |     
   xtensa    |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/2b6545f974b770cb695cc60366d00c2b0428537e |     
  riscv64    |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/f4336f8af74833dd708ef759b63c8e85ab320669 |     
    or1k     |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/587bbff04b707990667ceccb987b1d753b80e1a8 |     
   arceb     |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/af933b2bc1a1cee3294d6c76fa48fb9d47c1120c |     
  mips64el   |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/175da5ae32612aae04b864f659bcf10124a33f7a |     
   s390x     |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/9b34edfbe59725fd6e63ed8b8b342535a3f66e89 |     
    i686     |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/6a585211ed8814082aa79c44311cccd62a05f819 |     
microblazeel |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/e1404a36ae427768a4a8b747aac927af4004002a |     
    arm      |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/7f89240a4c42137a180a7fea05e726790fea4a33 |     
  riscv64    |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/5647f45fc743ad63c9dd2ebea0b8132f34a2239f |     
microblazeel |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/c1651286b3eb7547e9dd04b8c5114fcec97f85ed |     
    arm      |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/4ec203adb7cbbebf9e8d4bc6ff7d8d4ee355dc23 |     
   sh4eb     |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/f545835a7082e96ce7874077d55f8ff5d0952f77 |     
   x86_64    |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/7a5d56546db0a73b5a65b57a18872a60e86a6131 |     
    arc      |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/44fc673a85eead1991d0bb6082c2eccc7a75fc3b |     
 microblaze  |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/65af0a27b60adca2caaf4412f21f4c1da8ce1eff |     
 aarch64_be  |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/ac91b0059495c8929a3865c8156cd5ec9c513bf4 |     
microblazeel |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/57d1f1fa497403b8b2153c576d4d69345a070e85 |     
   s390x     | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/49869ee7af7317552efdd57ac156e5c1b3ed8abd |     
   sparc     | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/11432323e51536003de1038e43e854d09b6e975b |     
 microblaze  |        dieharder-3.31.1        | NOK | http://autobuild.buildroot.net/results/7f6614a64394257f217e2b524981353cf2df249f |     
   x86_64    |      docker-cli-20.10.18       | NOK | http://autobuild.buildroot.net/results/99c4552a1b96249ea9edaa10f8f84f960c6be5e8 |     
  aarch64    |     edk2-edk2-stable202102     | NOK | http://autobuild.buildroot.net/results/2d41a325b74d032952cb90df87cb3014b3bee060 |     
   x86_64    |           efivar-37            | NOK | http://autobuild.buildroot.net/results/a153aa556d3b5421c51cc0604a7b8300a08561df |     
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/301d56b52e5e9b31ba8c4ab1b62f333df4aafbb1 | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/48c293ad1a8647c1a9b2605d0f910deb5ea0afea | ORPH
    arc      |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/a3b7812a208e9bccdebce8d80a76a49f7dd77642 | ORPH
   mips64    |          expat-2.4.9           | NOK | http://autobuild.buildroot.net/results/8c268868e3211774306371b448c30f041f7046bc |     
powerpc64le  |        fftw-quad-3.3.8         | NOK | http://autobuild.buildroot.net/results/ad9e1ed705cd0123fc739121658dc6e2f3a21bde | ORPH
powerpc64le  |        fftw-quad-3.3.8         | NOK | http://autobuild.buildroot.net/results/e5096fe66cc79b83a2dd131bc21a80763b1ab85f | ORPH
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/c123cbbdd181c1fc56a67a36c995117b95591cb4 | ORPH
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/8814e47f48398f00a53accb2072c2d86b8bda625 | ORPH
  aarch64    |    freeradius-server-3.2.0     | NOK | http://autobuild.buildroot.net/results/f020dd32633975b7b43fed0894f9fce7d626f8ce |     
   xtensa    |           frr-8.3.1            | NOK | http://autobuild.buildroot.net/results/a719aebcbb705522e4751e7728edf8e25d4d6dfa |     
  sparc64    | fs/cpio/cpio.mk:117: /home/... | NOK | http://autobuild.buildroot.net/results/8589415c7463d209ec581f949630965cbeaba65b |     
   mipsel    | fs/cpio/cpio.mk:117: /home/... | NOK | http://autobuild.buildroot.net/results/fc45c998812160174d48c36ffc23bd90cc73dceb |     
  sparc64    | fs/cpio/cpio.mk:117: /nvmed... | NOK | http://autobuild.buildroot.net/results/c6080107b247e549e66a611b22aec71d9a8f132c |     
 aarch64_be  | fs/cpio/cpio.mk:117: /nvmed... | NOK | http://autobuild.buildroot.net/results/055ccccc760502ce5509e34b13584551fd21b6d1 |     
   arceb     | fs/cramfs/cramfs.mk:46: /nv... | NOK | http://autobuild.buildroot.net/results/022ddf407486f1b24b5c031520f56d3625ab7a9a |     
  sparc64    | fs/cramfs/cramfs.mk:46: /nv... | NOK | http://autobuild.buildroot.net/results/9376bc5ee0f45c15599fcb586ce0640247a669b5 |     
  sparc64    | fs/romfs/romfs.mk:32: /nvme... | NOK | http://autobuild.buildroot.net/results/c9e424a05cf1d5597f5a40903cb710bea0322da0 |     
  powerpc    | fs/romfs/romfs.mk:32: /nvme... | NOK | http://autobuild.buildroot.net/results/b38e16fc723fcac3f29d02afa03aa4c12ce4e1f8 |     
    m68k     | fs/ubi/ubi.mk:51: /nvmedata... | NOK | http://autobuild.buildroot.net/results/1dad66372fedf1257638db9ae5ea053c84137ffe |     
    or1k     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/7fd74697a658addc1f2694c444baab84e46a4de8 |     
powerpc64le  | fs/ubifs/ubifs.mk:49: /nvme... | NOK | http://autobuild.buildroot.net/results/16be8f0a9b88098d00d4e1782a989c0cb6684a9b |     
 microblaze  | fs/ubifs/ubifs.mk:49: /nvme... | NOK | http://autobuild.buildroot.net/results/8aec4116d36424b18b9505541573a39048728720 |     
  sparc64    | fs/ubifs/ubifs.mk:49: /nvme... | NOK | http://autobuild.buildroot.net/results/27703c707b5b4c210ef6053d1ee2913af033afe5 |     
    i586     |            gdb-11.2            | NOK | http://autobuild.buildroot.net/results/f5d89e2954e704638675302171864602c902a802 | ORPH
    mips     |          gensio-2.5.2          | NOK | http://autobuild.buildroot.net/results/d91b60ea6725472581dcd83eeb59d46810175597 |     
    arm      |          gensio-2.5.2          | NOK | http://autobuild.buildroot.net/results/7e33f313646d767b86821e16f3e1c3d66c8ec98c |     
  powerpc    |          gensio-2.5.2          | NOK | http://autobuild.buildroot.net/results/635808626b3201e8423b85d43094284d21e8ac41 |     
 microblaze  |          gensio-2.5.2          | NOK | http://autobuild.buildroot.net/results/23356188e0e0a236758b49e8398bbf9719892f2f |     
   mipsel    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/de9d4bfbcebf41b86ddd37a5230e39a2d651f22b |     
   sparc     |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/b54b74e71c2b6a22997f07548d161b77b9fa319d |     
   mipsel    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/ee5a7d800b6d332e7ff567f052903b8e5f032457 |     
    or1k     |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/9bcc3370aeb43b5879da6230ee97dfb076fccacf |     
powerpc64le  |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/5758fbd0127e185929702aba35180247ab033e96 |     
 microblaze  |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/80e49638646ca6fa100b98d201ea4a66b0d350da |     
  powerpc    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/37470437f915b4f8147ec43ac2ca8d6ef09fb57a |     
microblazeel | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/852b5c02299be4d0ab70497392be5221166d29c4 |     
    sh4a     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/954aef778899d26cc337e87959ed30d0d5927117 |     
  powerpc    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/733a3c05b31bdfb434e61695172553823e8f152f |     
  powerpc    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/b6e02f3f8ed92846c8e420c8a7cc4ae9e09727f3 |     
 microblaze  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/b4214195f4378014c6e1d3711741dc7a6781ec3c |     
   x86_64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/bb9c1ea13ab9188cbf2738d39770546269f60136 |     
    mips     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/e938f3665f3083258c575208f934ec7568d2538a |     
   x86_64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/5ab97e1e1fb73f423056808ee4ead7d5a62fd9be |     
microblazeel | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/14972e9b9e8d891048495312605a9749c20734db |     
  powerpc    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/28e9ab3e6f5a5ec5a941566086a2f7e73b49c728 |     
 powerpc64   | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/14109beae03a9caf1022749719261251582e710f |     
    arc      | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/591630b04a0117c580cc9e772fc7cdbed98ad36c |     
microblazeel | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/b9567357fbfc22e39458be74f419c6c48ecf214f |     
   mipsel    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/883b171a856a63540908976592683527fdb21cd2 |     
  riscv64    |           gmp-6.2.1            | NOK | http://autobuild.buildroot.net/results/a6da473dfe5d46a00ae0d95dd5a7c985be166c7b | ORPH
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/96a0d1a0cbf0bb43d0530e6d6fab0536d61a232e |     
 powerpc64   |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/c6e80b231b7f538893d66cf4d5fa5ce6354e65f8 | ORPH
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/a29c2aaf6583d8eaad5a264daa345fc9f73b6fae | ORPH
 powerpc64   |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/2be35f8a1152869df948a5715447886bd0243134 | ORPH
   nios2     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/4f62268f73b8fa32f591df84e660722c5c4809c6 | ORPH
powerpc64le  |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/7c867dd55eef5ddf1e2897d341e367fa98708694 | ORPH
   s390x     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/80fd304743f130edb02459b60487990c60efbe42 | ORPH
powerpc64le  |        gocryptfs-2.2.1         | NOK | http://autobuild.buildroot.net/results/d19de10000661f1a1969f230c12ce9146d282005 |     
   mips64    |          hdparm-9.63           | NOK | http://autobuild.buildroot.net/results/b1c14180a41f264c954190fa96129648443ea6d7 |     
    sh4      |          hdparm-9.63           | NOK | http://autobuild.buildroot.net/results/9213a2f82023c8789b80be15a8c1dabef478e795 |     
   s390x     |          hdparm-9.63           | NOK | http://autobuild.buildroot.net/results/60de254bca7e444e6ed7f3527cf9a95c2048797b |     
   mips64    |          hdparm-9.63           | NOK | http://autobuild.buildroot.net/results/8990fc77c823913296dcc65eded208126eb50299 |     
   sh4eb     |          hdparm-9.63           | NOK | http://autobuild.buildroot.net/results/742754a0f8dc1f805e4efe4fbfea1660c82c97f8 |     
    or1k     |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/42bb221cc8ce47f26dfe5c3061dc04001b9ef4dd |     
   mipsel    |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/f443863e795ae1206470e1e24ae548f87ffd3967 |     
  mips64el   |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/ce243ce17ee1e1d036cff7e1ccf3ba89d48ac8c9 |     
    m68k     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/de78f6376ed4ab0b6299e46727da4f4618b5b69a |     
   x86_64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/dc14a91c38e7761205ad2abdaa94bca416b7a331 |     
    arm      |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/75912ef27a7f9e3a72b8cfb1a05c1f3cd1e5b15b |     
  mips64el   |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/c99fd894f5fca5a84e7ef5fd01dba316a8972da8 |     
   x86_64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/7afa857e5e29dc0741c0a2edd920ab7484583b33 |     
    or1k     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/6dc80563d3404da051e57a7b4c80da955bcd0afa |     
    i686     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/2423a23d2e30ba1f8ec61364d1197115fd82c3a5 |     
    arm      |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/63ed3eb767dce3bd2026be69b0b52cbd404dda54 |     
microblazeel |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/f5b11975058c594a130a96f2b439ecc79593949a |     
  mips64el   |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/1b61e66ef84fe9ca689ad19c068cd3a84403806c |     
    arm      |     host-gcc-final-10.4.0      | NOK | http://autobuild.buildroot.net/results/3ec3cfda093c47beb93a3a5b4ff17512616954be |     
   s390x     |     host-gcc-final-10.4.0      | NOK | http://autobuild.buildroot.net/results/d7271902625a4ea522578ea1137a26d1fb7cf3d0 |     
   s390x     |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/3205bb1842c28e88ccc2d04866128c71e3772e0f |     
microblazeel |     host-gcc-final-12.2.0      | NOK | http://autobuild.buildroot.net/results/e59fda6a12d8f85969796868d6af58995fca2f1a |     
    arc      | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/16ef47d930d9ba665484248ff74a6295aaf65c95 | ORPH
    i586     |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/423c66a307669771dd462d1e98070ecdff14aebb |     
  mips64el   |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/b83e09dfe1ddeee684a1313c3154dd4770feb776 |     
  aarch64    |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/729b9ff046d886c3e96db8524105792eb2fcdcd4 |     
  mips64el   |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/da9ebac477ecc6bd82d730811f80067f55ecd1ac |     
    i686     |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/66371b3c7001b33e026d889bca1c1a88ffe7fb80 |     
    i686     |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/59d41c3fc92d12745d9f3bf60a84c4e1a8ff8028 |     
    i686     |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/d5240e809642c8272a0b0cad6c17306a06baa178 |     
   sh4eb     |      host-libxml2-2.10.2       | NOK | http://autobuild.buildroot.net/results/db046c9e8e7434d4f733b6d25c4c7c12c01bee49 |     
    mips     | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/44461f43411743ca3fa7d162a1383b9876a97a74 |     
    arm      | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/a15d50cb220399786cea00571ba2cffca1db31b1 |     
    arm      | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/fa7a5432037622dfe231e86e7f751465359a1d9d |     
  powerpc    | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/0526ac3516e50abd6d2531d80f95c768eed2265d |     
   arceb     |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/29d06fad09d8293e486d1ed99d71aec5171a939b |     
powerpc64le  |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/e5afbd2f02e3ce777329ee50ac9f12d686a17c1a |     
    mips     |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/6235b90e74331800fc3fbefeed9b8d1af156b450 |     
powerpc64le  |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/b09120e19b36cf1ef5ca108655cd9cf5ed245221 |     
   x86_64    |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/d758bae8dd45dd7d345a0e4b0b80b15df9a68385 |     
  powerpc    |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/ae2c96b982cbf04ea2ce462ebd159474e74000c9 |     
    arm      |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/914201afcf164a5e789fa9436c05f9b41433ebf5 |     
    arm      |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/764c3fdc1b4b8147a74e9d2fcd39a85368d8da91 |     
    sh4      |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/829ae1430d13d3001737c5bf4a49fd63019809d7 |     
   s390x     |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/fa0bfb667341188fadba680d5568d4aa6bdda3e8 |     
   mipsel    |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/9f329442f4bafe5af38c8063ecb2f6d2bfb3d5fc |     
  powerpc    |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/fbb3118c215cf6f52ee67f2ccc738dbe8e062aa9 |     
   arceb     |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/5dc21c896e1b4a3822d9e0a281d7b2029e4c5d34 |     
 microblaze  |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/721eedb54948cdcc7d50a8cd2f7644f5cc49e83b |     
 powerpc64   |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/dc70e8c6a237ae2b592966a766562f62895489ac |     
   sh4eb     |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/09cf737f131a53ddb60f5127943da25d17d4fff9 |     
  riscv32    |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/1f2443b3ace5d4bca46024df43e0d870d0bce503 |     
 powerpc64   |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/3690891e1ab593638f97495225aed56880c36cee |     
   xtensa    |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/57450cf0a7ea687977bb8ba647eee05a2da104e6 |     
   armeb     |        hyperfine-1.14.0        | NOK | http://autobuild.buildroot.net/results/7449db63ce8ec3756fa7f551e07a7958c903ccc0 | ORPH
  powerpc    |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/636f0aea83dd05565a62b13315d6eceaaad85dea |     
    i686     |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/f0025efdb064df0070c7b1e7cf579caa8d068af6 |     
 microblaze  |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/05bf26f37dffef1589141ea7fe8e1d0bdd4ec9e3 |     
  mips64el   |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/82409cd96a907c8b95a3de04a456fb5a188f3449 |     
  mips64el   |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/f08f302178f358740864268f5c4f6ef1e0d37959 |     
  mips64el   |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/f22b17cd6dfd1d117be366a8e5a15aff97ddd98b |     
  aarch64    |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/5f833edeb73f0cb22d1043cf6d84cc312026ed96 |     
  mips64el   |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/3fe338f305cb62ae2de7058ba8db131f502e8f4f |     
microblazeel |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/2e13db348a553640a6b87763c53b7f5d70db5450 |     
   x86_64    |       igh-ethercat-1.5.2       | NOK | http://autobuild.buildroot.net/results/892aea2733b7c041dd4936870ab8e03970af550b |     
  aarch64    |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.net/results/eda2b390593ecc7c778f520174fd7137b659891d |     
    m68k     |          jack2-1.9.20          | NOK | http://autobuild.buildroot.net/results/49e7a5cbf633017edf7cdc2f731648e18f1ebabe |     
  mips64el   |        libarchive-3.6.1        | NOK | http://autobuild.buildroot.net/results/91b9ee7fb6d61fab6160e71c5b914b2bab9158d3 |     
  mips64el   |        libarchive-3.6.1        | NOK | http://autobuild.buildroot.net/results/56e1e3ee5455d278b76633ea081a0f1bab7b5a7c |     
   s390x     |        libarchive-3.6.1        | NOK | http://autobuild.buildroot.net/results/979b1092e3032d88fb2ae95c76146ef9f48d4efb |     
    or1k     |        libarchive-3.6.1        | NOK | http://autobuild.buildroot.net/results/6ce48269e8cd4dca543bac1d5c396f937a918663 |     
    arm      |        libarchive-3.6.1        | NOK | http://autobuild.buildroot.net/results/d5c90fb02a8a9db1067a2d67d25f63708baa39a1 |     
    or1k     | libcamera-ba6435930f08e802c... | NOK | http://autobuild.buildroot.net/results/591d9b4dc540798e8beaf2d541dfa30e8b007b7e |     
  riscv64    |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/5ad14e93629a014d93fe9138aaec5b250872ef9a |     
    arm      |         libdrm-2.4.112         | NOK | http://autobuild.buildroot.net/results/ae0a1816407020a392df36f91e6f00697555fcab |     
    arm      |           libev-4.33           | NOK | http://autobuild.buildroot.net/results/8f6fafdaa9d89efaae905f73b1896c2db0936d14 | ORPH
   armeb     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/c0bb8c07820be580b1724a7cf845e9579ae5f353 | ORPH
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/d7ec7e98b4e121d57431f659a28e7136a32feeba | ORPH
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/58b57e1688c92334c89847eca1794621ed55eaa0 |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/4cc9a01c484ee682bbbd73cee89d1575b35c306b |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/f4f005e7123ed1ad4d6a1b382e2108919ad5b3dc |     
  aarch64    |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/ab4f6fe281deaa90ada5202b4891566e29224378 | ORPH
 aarch64_be  |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/3d8ae23c319e4ee4fcfa87f90fc2ab18b7f70ed9 | ORPH
 aarch64_be  |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/7301d3128adeebce6526dc65b431071ea6ae4fd2 | ORPH
 aarch64_be  |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/697adbf07563f4137615c0d67a3c535cb7059a27 | ORPH
 aarch64_be  |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/1180b12ac897c6afd89e1d9e30f4aa9733f4c5dc | ORPH
  aarch64    |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/5bdb2448000b04795dec1a2eb625579a890208c2 | ORPH
 microblaze  |        libmdbx-0.11.11         | NOK | http://autobuild.buildroot.net/results/9fcd2a2b5ca24362c039318def2044bd661a4a3a |     
 microblaze  |          libnss-3.83           | NOK | http://autobuild.buildroot.net/results/afb6e214c3d7729a75281f130b7e129071b6c3a2 |     
  powerpc    |          libnss-3.83           | NOK | http://autobuild.buildroot.net/results/a59f861339acfa88a540204eac175e0a4755317a |     
    sh4      |          libnss-3.83           | NOK | http://autobuild.buildroot.net/results/c1b79e83f3586c27364caeea20e0607c24a1aa24 |     
   sparc     |          libqb-2.0.6           | NOK | http://autobuild.buildroot.net/results/172a45bd26e394dd5bb98e16fcedf8a2147f25d2 |     
microblazeel |  libtorrent-rasterbar-1.2.15   | NOK | http://autobuild.buildroot.net/results/f636d79e3b586078bdcd877c2a972f931f97677f |     
   mips64    |        libuhttpd-3.14.1        | NOK | http://autobuild.buildroot.net/results/590d3e7a8496a4d47fea49b02912f93ce0cc9b52 |     
 microblaze  |    linux-5.10.109-cip5-rt4     | NOK | http://autobuild.buildroot.net/results/d7e8d0615eb04b1b1bc3e13e0f9a62913b068c73 | ORPH
  mips64el   |    linux-5.10.109-cip5-rt4     | NOK | http://autobuild.buildroot.net/results/f0bf8883e20e4f993b3eb62eec9aaad5b3198d5f | ORPH
   mipsel    |    linux-5.10.109-cip5-rt4     | NOK | http://autobuild.buildroot.net/results/39890c3d8fa383ad13e68d6f5aba34ae5265acf9 | ORPH
  sparc64    |      linux-5.10.115-cip7       | NOK | http://autobuild.buildroot.net/results/ec8c3d73e58c1f085d000f957f96c2606bc15723 | ORPH
    arm      |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/823241e4495fe7cb2912a90ccf639015e05b03d6 | ORPH
    mips     |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/77852c403dae58ac10d55b4439f8a48e6124123b | ORPH
  powerpc    |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/547134bb1d252c9a5eb2b97297c483661b105183 | ORPH
   arceb     |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/9b15ebd1499eacd7f3d31a1b1cb798df2a2204ae | ORPH
    arm      |       linux-fusion-9.0.3       | NOK | http://autobuild.buildroot.net/results/45f469350eb0098362bbabd2739038c99b5cf981 | ORPH
  powerpc    |          linux-tools           | NOK | http://autobuild.buildroot.net/results/cac08c3bc95a0094b2d564684e91cb51b12a8337 | ORPH
   s390x     |     ltp-testsuite-20220527     | NOK | http://autobuild.buildroot.net/results/f5675254c5961250b969062254e379f5c0df11d1 |     
    i686     |     ltp-testsuite-20220527     | NOK | http://autobuild.buildroot.net/results/1d38a00d6ecd407400c352534bea722db86e4d59 |     
   arceb     |      lttng-modules-2.13.1      | NOK | http://autobuild.buildroot.net/results/38e29bf742d646dd3a2327fe20b5e3d530c2b96c |     
  powerpc    | luajit-5677985dc1f19cf0a671... | NOK | http://autobuild.buildroot.net/results/87ff6bea2c80356dc63b8d63b05b47e57d1ad110 |     
    i586     | luajit-5677985dc1f19cf0a671... | NOK | http://autobuild.buildroot.net/results/ddfe1cae18e52d84e5f3d8ffd0dd31225e7f0b7a |     
    mips     | luajit-5677985dc1f19cf0a671... | NOK | http://autobuild.buildroot.net/results/997eb04c7c7dbdcbf6a62b4c0a27bac81a593781 |     
   mipsel    | luajit-5677985dc1f19cf0a671... | NOK | http://autobuild.buildroot.net/results/aa5555f250306e3785a557d074d9b46067bdb45d |     
    i686     |           lxc-4.0.12           | NOK | http://autobuild.buildroot.net/results/e1b2b4135001f13bc0635518876d0853478fbc0d |     
 microblaze  |           lxc-4.0.12           | NOK | http://autobuild.buildroot.net/results/b09c70e17d22f2ecf56ab7f9a77c079ddd837191 |     
  riscv64    |            lzo-2.10            | NOK | http://autobuild.buildroot.net/results/7f6860ad68cbda127cbb22e8b38f50c224002ebe | ORPH
   x86_64    |          mender-3.3.0          | NOK | http://autobuild.buildroot.net/results/d9dca2f10941e9eac7768a546f333f674f6eed7d |     
    arm      |     mxs-bootlets-10.12.01      | NOK | http://autobuild.buildroot.net/results/4e2b7b2f10905a5e584946f99b8268051bd9770a | ORPH
  sparc64    |       ocf-linux-20120127       | NOK | http://autobuild.buildroot.net/results/c90e3133b9e6fd0ba8d744f4a1da3d8b9d2ccab6 | ORPH
  riscv32    |       ocf-linux-20120127       | NOK | http://autobuild.buildroot.net/results/e73948a1412f31ed4ebba9d7986e133f99f2e311 | ORPH
  mips64el   |         openal-1.22.0          | NOK | http://autobuild.buildroot.net/results/41a6ff2707f06669a9924d145b2ee288d956436a |     
    arm      |         opencv4-4.6.0          | NOK | http://autobuild.buildroot.net/results/0491002077ca300d2aeb5e4aa5b801d71816d399 |     
  powerpc    |        openpgm-5-3-128         | NOK | http://autobuild.buildroot.net/results/0653c27ad5daf45a922665b0471c574046a23687 |     
  riscv32    |          opensbi-0.9           | NOK | http://autobuild.buildroot.net/results/204a4a73c8dc9f80ac457ce83fb42270291df9e8 |     
  riscv32    |          opensbi-0.9           | NOK | http://autobuild.buildroot.net/results/6041276dd9be283d4e61962bf4e84b396a9a89dc |     
  riscv32    |          opensbi-0.9           | NOK | http://autobuild.buildroot.net/results/e1dba9a737a77f288dee860110d28dd0d498d773 |     
    m68k     |         openssh-9.0p1          | NOK | http://autobuild.buildroot.net/results/f7d48e081cf7166b354f7b8f0fde882c0b002fab | ORPH
   x86_64    |  openvmtools-11.3.5-18557794   | NOK | http://autobuild.buildroot.net/results/b1a0f9710ed6a110ae21c09c8bed0f8fcff2dfa0 |     
   armeb     |           opus-1.3.1           | NOK | http://autobuild.buildroot.net/results/47e603a8210e17067745eeef665e3609c3ddddf6 | ORPH
   arceb     |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/09354a7535f61596829043b4d2efaeea1d05fc44 |     
   sparc     |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/019279be11ab63d654d40c67bf678d6b215cf07a |     
   mips64    |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/475d997b2b58931ba831c18b626fdeee0a2c1804 |     
  aarch64    |      perl-net-ssleay-1.85      | NOK | http://autobuild.buildroot.net/results/9e0dad6a4d4db47bf96ab4d6e8e22d9750811e8b |     
    mips     |   portaudio-190700_20210406    | NOK | http://autobuild.buildroot.net/results/31a333b2fd944426da0f4ee8bf650852ed49fed8 | ORPH
    m68k     |         protobuf-21.6          | NOK | http://autobuild.buildroot.net/results/494a23f346b7b44ad56f0e90c38795d4c98d6d52 |     
   armeb     |   python-cryptography-38.0.1   | NOK | http://autobuild.buildroot.net/results/25fede4ce89acaef8ce2ea83d78bbe3c034f7a2e |     
    sh4      |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/5c02ada78fccb051b4f16b52950f1e9305c5f069 |     
   sh4eb     |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/5d1463a7627b4f266487c2a750a8faa0d653bcef |     
   mipsel    |     rabbitmq-server-3.8.2      | NOK | http://autobuild.buildroot.net/results/cb4f0168c91c8645a36b017fdae4b9a247b0ce04 |     
   sh4aeb    |         ramspeed-2.6.0         | NOK | http://autobuild.buildroot.net/results/595020714b203bccb5bf1a7a3d4d1b143f3b3003 | ORPH
   s390x     | rtl8189es-39c17661136da48f8... | NOK | http://autobuild.buildroot.net/results/0c7e5912328a8486d55b564fa31d68161f5194fb |     
powerpc64le  | rtl8723bu-d79a676a8d3f0bb6a... | NOK | http://autobuild.buildroot.net/results/c54d57e70f9caf7cc78e341c68ca1398b3417669 |     
   s390x     |           rtty-7.4.0           | NOK | http://autobuild.buildroot.net/results/67c29e8996ac33c47517e6eaa7a8ef3d1dead300 |     
    or1k     |        skalibs-2.10.0.3        | NOK | http://autobuild.buildroot.net/results/9296e0e7fcd88919d1e3188ad779d6eb5f339b75 |     
microblazeel |         sudo-1.9.11p2          | NOK | http://autobuild.buildroot.net/results/ce7a399b3ea3ea43da5f8989e8cfebb6e25d3f93 | ORPH
   x86_64    |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/9c6fba16e445f419430444b16fd510d18773f13d |     
   mipsel    |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/8354f6cd9c9b628806a82d91410dedcf32724818 |     
   mipsel    |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/894396f17447103c4a02456e8a6e8eca26ef34d1 |     
   mips64    |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/b126836fd4d30210b1681f492579447ed298887e |     
    i686     |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/fd27381a1158822531f5d9d8fc2f2bf8b64ba4bd |     
  aarch64    |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/410ed602e165ceb19dae8b6645d67405419f8f55 |     
    i686     |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/e740888916a87dc4247a0f014e2124b30e61cafa |     
  sparc64    |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/4aad8ece2283bdc58df9e573f2c540595dd9449d |     
  mips64el   |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/8558dc327d3346af44f9111320a7a0a05dd0f3bd | ORPH
    or1k     |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/85ee03e0f17b73dccadbc1dfb34186d561d0c28e | ORPH
    or1k     |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/0d304155af3288c37b5ee91557ebc26d320445a0 | ORPH
   x86_64    |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/2ccf1895e88fdfd3f9bbd2de4dda3e7ee126fd73 | ORPH
   mipsel    |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/87f1638b792ab2e7ce5696eb5b3b88676055be99 | ORPH
   mips64    |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/91045e4f9f8b438dcb786699737fdbb9b8df84ed | ORPH
   s390x     |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/cc9c97d34869779ee32840b2b0611f0d45f5421b | ORPH
    or1k     |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/4bbeda52a00267403809e44bddec4c28a1e2bbdf | ORPH
   x86_64    |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/fd0e44f999f8647e28bd202c93d9edd367f5c7fb | ORPH
    sh4      |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/f0a9f4a59af2a0723e4b545b48aeb925a36e30e9 | ORPH
   armeb     |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/7f331796c3d7e6f313946a599beda497b2e6ad5f | ORPH
  mips64el   | toolchain-external-codescap... | NOK | http://autobuild.buildroot.net/results/7c3a2b13df5a46b258e3186cbdb78870795d2f2a | ORPH
   x86_64    |          trinity-1.9           | NOK | http://autobuild.buildroot.net/results/d36d129012e86bb8607355c3b4af1879abb10637 | ORPH
powerpc64le  | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/4432cb75b307af6931f96917fc551e919203ee20 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/e89f8298666809b194133035f0e860694553473e |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/48affab3f8aa4b441c03344e76e57e0e38a75a16 |     
   sparc     |            unknown             | NOK | http://autobuild.buildroot.net/results/4dcb0da659b6323d841e2f7d8b5778dbfd83f34e |     
   mips64    |            unknown             | NOK | http://autobuild.buildroot.net/results/44f3d5f96082186e85cc9e74e6d2fca8cffc6d38 |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/3211705e5f01995f106f4f463eabadc971a7d031 |     
    i686     |            unknown             | NOK | http://autobuild.buildroot.net/results/2486bf40444bc88ab7db8e0e3bd3d6b1f625f420 |     
    m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/87dc896f93562b350723b334953099300bce93fc |     
  riscv32    |            unknown             | NOK | http://autobuild.buildroot.net/results/79bddbf72c3eb279fd38962cf43d162b30694cc3 |     
powerpc64le  |            unknown             | NOK | http://autobuild.buildroot.net/results/83e4db135c06775119f581e74d8985c7ccdca6a2 |     
   armeb     |            unknown             | NOK | http://autobuild.buildroot.net/results/12d14395c5a71aac0f88250d0c803a42d648531b |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/797c09446e64f161b126a34eeb0340d34c05195f |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/3d38c6fe8c89844f860f92e0dab47ec16080cd19 |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/b38028e2a6c432a1e819ebd58f9c08125fc6fd51 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/02653f359590aed297af4b4de3752ae7c64abd17 |     
   sh4aeb    |            unknown             | NOK | http://autobuild.buildroot.net/results/8438b9c353cdc04ff6deb9ac4eda765bc1e353f8 |     
   s390x     | uqmi-0a19b5b77140465c29e2af... | NOK | http://autobuild.buildroot.net/results/8bbcc6f5ba041518e07cfa30fd8b691cc4f44b1a | ORPH
  mips64el   |        valgrind-3.19.0         | NOK | http://autobuild.buildroot.net/results/cd729d370b038c893a7f974493d693e88db0c42c | ORPH
   mips64    |         wolfssl-5.5.0          | NOK | http://autobuild.buildroot.net/results/0239f20a890bc43fdc5921084252d200b671c63b |     
  riscv32    |         wolfssl-5.5.0          | NOK | http://autobuild.buildroot.net/results/0984d8caf7cf25d27649520301426751ee8710b7 |     
   mips64    |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/88aa7a017029c4bdd3b8e5079dfc043855dff778 |     
   armeb     |        xfsprogs-5.14.2         | NOK | http://autobuild.buildroot.net/results/2508550cab371ff1d7c3291ba9261d7c84ee93a1 | ORPH
   nios2     |          zabbix-5.4.9          | NOK | http://autobuild.buildroot.net/results/504913608cf69b2cc2b0c9c15b6cd43770c0d745 |     
    arm      |          zabbix-5.4.9          | NOK | http://autobuild.buildroot.net/results/0a3d8c88a0df74ab59f76c7b2a1dcb27862b90ab |     
  aarch64    |          zabbix-5.4.9          | NOK | http://autobuild.buildroot.net/results/05c26a4164e77c0c6483a7f383da22d16e2bfd16 |     
microblazeel |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/e2af061527a4faa62fa40cede99005aacaccffba |     
    i686     |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/7543caf484019ee011568a85a0ce87950d50c223 |     
  riscv64    |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/42d7de6d0a037a31df25b340a47c4945bb4bb611 | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/0725df12831cd8730363f8c21635e6169fe083d7 | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/1af75e049a6fe0b2edb1bbb1ffa09e9cbddab6dc | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/2361f6e25c35ed3296aeded899b9af76c63eb89c | ORPH
 microblaze  |           zstd-1.5.2           | NOK | http://autobuild.buildroot.net/results/336fa62c92031c90d185a898e6d8c9c5659a4480 |     


Classification of failures by reason for 2022.02.x
--------------------------------------------------

         graphicsmagick-1.3.37 | 1 


Detail of failures for 2022.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |     graphicsmagick-1.3.37      | NOK | http://autobuild.buildroot.net/results/9382f0c46ced5381c744e4af9a8e9c43c0b9f90a |     


Classification of failures by reason for 2022.05.x
--------------------------------------------------

host-pahole-73383b3a39afe86... | 5 
                       unknown | 3 
/home/buildroot/autobuild/i... | 1 
/home/buildroot/autobuild/i... | 1 
dahdi-linux-5c840cf43838e06... | 1 
                elfutils-0.186 | 1 
                  exempi-2.6.1 | 1 
         host-gcc-final-10.4.0 | 1 
             libopenssl-1.1.1q | 1 
                 linux-5.17.15 | 1 
                    lv2-1.18.2 | 1 
                  octave-7.1.0 | 1 
                   poco-1.11.1 | 1 
                 uclibc-1.0.41 | 1 
                       xenomai | 1 
                xenomai-custom | 1 
                 zlib-ng-2.0.6 | 1 


Detail of failures for 2022.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mips64    | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/a2086a352f2b76d63886c0dc586e8d1b23cc7385 |     
 aarch64_be  | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/2c9c981d1c1292460e8a5f2ad4eb06a3f7092c69 |     
    or1k     | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/f6d65b47c9da9b6fa1733d8022bbca811121f011 |     
   arceb     |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/0a7988c06e8cefc9e4e0148458a9457328a754f0 | ORPH
    arm      |          exempi-2.6.1          | NOK | http://autobuild.buildroot.net/results/f16485fde80a410403768a5aecf958a9953f4869 |     
 microblaze  |     host-gcc-final-10.4.0      | NOK | http://autobuild.buildroot.net/results/ce1327cf787b0aca7fc30dc3f659ccbdf05f2191 |     
   sparc     | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/8cface228e3f4c199b7e4ce89033a20b19f1a9fa |     
    arc      | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/56683631713ad34b44712703e5618186e862c1fc |     
  mips64el   | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/241014b24d05833fded5cdb6f3ba5f0419ec2f9a |     
   arceb     | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/382d68606e06961983b66692f5722fd684d2feb8 |     
 aarch64_be  | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/353cb2f2e06bcb2a43a4015a41136fe9d10c0987 |     
   sparc     |       libopenssl-1.1.1q        | NOK | http://autobuild.buildroot.net/results/368afa1f7967007b8bc46b9789ed9e95bc77cfde |     
   s390x     |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/24c2af5e911fae1d07e8b7c10edd380b2d656ee1 | ORPH
    i686     |           lv2-1.18.2           | NOK | http://autobuild.buildroot.net/results/e37e919e8f8209cb451b49ed0772c8318ffbc61a |     
 aarch64_be  |          octave-7.1.0          | NOK | http://autobuild.buildroot.net/results/98c3479a9c57dc91ba39d9cbaa6803cb81cf1da6 |     
    mips     |          poco-1.11.1           | NOK | http://autobuild.buildroot.net/results/afc434a13d5e7a8affa4abb4058d7bebc81aca29 |     
   arceb     |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/43f4b30f5367372f6dc92cfe707bf2cf783c4565 |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/831a339cec4270665f0d1ace37a58c4682c392f2 |     
    sh4a     |            unknown             | NOK | http://autobuild.buildroot.net/results/7f8f9327c3b06ed6411f90c79ae354cadf2112d4 |     
   arceb     |            unknown             | NOK | http://autobuild.buildroot.net/results/4a00c75926e27411efbdae13392a607a1e73b53a |     
microblazeel |            xenomai             | NOK | http://autobuild.buildroot.net/results/7e622cc9bbe46523ec1ed578024aeaffd19a8868 |     
 aarch64_be  |         xenomai-custom         | NOK | http://autobuild.buildroot.net/results/818a83feffeb666b66df6ebc672768aef7d7735b |     
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/fdb77c4ccae11bce6f8abb6f3ac23994983c8f3a | ORPH



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
