Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C578BC433EF
	for <buildroot@archiver.kernel.org>; Sun, 17 Jul 2022 05:31:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0F53E60B26;
	Sun, 17 Jul 2022 05:31:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0F53E60B26
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nNttqAg5n8jt; Sun, 17 Jul 2022 05:31:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9DA9260B61;
	Sun, 17 Jul 2022 05:31:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9DA9260B61
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E9B461BF5DA
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 05:31:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 98CAF41859
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 05:31:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 98CAF41859
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oh2BuMKE1s7s for <buildroot@lists.busybox.net>;
 Sun, 17 Jul 2022 05:31:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AE89A41857
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AE89A41857
 for <buildroot@buildroot.org>; Sun, 17 Jul 2022 05:31:36 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id B5E4B1C0006
 for <buildroot@buildroot.org>; Sun, 17 Jul 2022 05:31:34 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sun, 17 Jul 2022 05:31:34 -0000
Message-Id: <20220717053140.98CAF41859@smtp4.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1658035894; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=UuAGK9mIro7hgtwgP3/4CszAGtC98f3P3dNs2lJ+8DQ=;
 b=UuxQd49UIBEvg5pWhOgOL96BFulGa9RYDag8MAP69LbtlZlHy0BpkdOWuEk1XYaIyPeq3a
 5587pd0Z3m0HwpNnbMKCR5L7vL6l5Dy8bak/8ScTCREh/mEry+65MWBKGtCA+CXtBdPu0L
 iZ0JB/4nxDuRMSyxqY+36aZgK1tLZ+MzYYt78QZSgWa0Y+4ko2iAnWtQQN0eMyfhzmYpoy
 CmUbauIwkbiOjchY9Pe4Mxarqh2mekXTW2Ht19LKXDlPX5r0f16r57D0dKKwlpHddrVGOI
 IYSYTZu1uVmoqr2ILULX7DaNTt3IZR37XGlTSCXa/3wKT7CyGb7oEcpAeo0aEA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=UuxQd49U
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-07-16
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

Autobuild statistics for 2022-07-16
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  | 19  |  3  |  2  | 24  |
  2022.05.x  | 42  | 32  |  0  | 74  |
    master   | 208 | 349 |  1  | 558 |

Classification of failures by reason for master
-----------------------------------------------

              alsa-utils-1.2.7 | 34
                       unknown | 25
                 uclibc-1.0.41 | 24
                 zlib-ng-2.0.6 | 15
                libcurl-7.84.0 | 13
             libopenssl-1.1.1q | 13
  gobject-introspection-1.70.0 | 8 
                 libvpx-1.12.0 | 8 
                 linux-5.17.15 | 8 
glibc-2.35-96-g2c4fc8e5ca74... | 7 
                 dash-0.5.11.5 | 6 
              jpeg-turbo-2.1.3 | 6 
           libfreeimage-3.18.0 | 6 
                     refpolicy | 6 
                   speex-1.2.1 | 6 
                speexdsp-1.2.1 | 6 
                busybox-1.35.0 | 5 
host-pahole-73383b3a39afe86... | 5 
                libressl-3.5.3 | 5 
               protobuf-3.20.1 | 5 
dahdi-linux-5c840cf43838e06... | 4 
host-spirv-llvm-translator-... | 4 
                   perl-5.34.1 | 4 
                 fdk-aac-2.0.2 | 3 
         host-gcc-final-10.3.0 | 3 
              host-rust-1.60.0 | 3 
                 wavemon-0.9.4 | 3 
                     ace-7.0.6 | 2 
                  acpid-2.0.33 | 2 
                     aufs-util | 2 
             berkeleydb-5.3.28 | 2 
                    brltty-6.4 | 2 
              containerd-1.6.2 | 2 
        edk2-edk2-stable202102 | 2 
                     frr-8.2.2 | 2 
fs/ubifs/ubifs.mk:49: /nvme... | 2 
                   gstd-0.14.0 | 2 
                host-go-1.18.3 | 2 
                iptables-1.8.8 | 2 
                  kexec-2.0.24 | 2 
           libwebsockets-4.3.1 | 2 
       linux-5.10.109-cip5-rt4 | 2 
           linux-5.10.115-cip7 | 2 
                  ntp-4.2.8p15 | 2 
               openpgm-5-3-128 | 2 
                 pixman-0.40.0 | 2 
       shadowsocks-libev-3.3.5 | 2 
              syslog-ng-3.37.1 | 2 
                   tor-0.4.7.8 | 2 
                   uacme-1.7.1 | 2 
                  zabbix-5.4.9 | 2 
/home/buildroot/autobuild/i... | 1 
/home/buildroot/autobuild/i... | 1 
             18xx-ti-utils-8.8 | 1 
                    4th-3.64.1 | 1 
              alsa-lib-1.2.7.2 | 1 
               apcupsd-3.14.14 | 1 
                apparmor-3.0.4 | 1 
        at91dataflashboot-1.05 | 1 
                    bat-0.19.0 | 1 
                  bcg729-1.0.4 | 1 
                bitcoin-0.21.2 | 1 
                  cjson-1.7.15 | 1 
              dieharder-3.31.1 | 1 
                elfutils-0.186 | 1 
                    emlog-0.70 | 1 
                  exempi-2.6.1 | 1 
                     exim-4.95 | 1 
                  ffmpeg-4.4.2 | 1 
                   flann-1.9.1 | 1 
             fontconfig-2.13.1 | 1 
                 freerdp-2.7.0 | 1 
fs/cramfs/cramfs.mk:46: /ho... | 1 
fs/cramfs/cramfs.mk:46: /ho... | 1 
fs/erofs/erofs.mk:40: /nvme... | 1 
fs/ubi/ubi.mk:51: /home/aut... | 1 
fs/ubi/ubi.mk:51: /nvmedata... | 1 
fs/ubifs/ubifs.mk:49: /nvme... | 1 
fs/ubifs/ubifs.mk:49: /nvme... | 1 
fs/ubifs/ubifs.mk:49: /nvme... | 1 
                  gauche-0.9.9 | 1 
               gocryptfs-2.2.1 | 1 
         host-gcc-final-11.3.0 | 1 
          host-gcc-final-9.4.0 | 1 
host-gdb-arc-2020.09-releas... | 1 
                     host-mono | 1 
                 host-wine-6.0 | 1 
                  jack2-1.9.20 | 1 
               libdcadec-0.2.0 | 1 
              libgcrypt-1.10.1 | 1 
               libglib2-2.70.4 | 1 
             libgpg-error-1.42 | 1 
                   libnl-3.6.0 | 1 
                 libp11-0.4.11 | 1 
                libxml2-2.9.14 | 1 
            linux-fusion-9.0.3 | 1 
          lttng-modules-2.13.1 | 1 
make: *** wait: No child pr... | 1 
                mongodb-4.2.18 | 1 
                    musl-1.2.3 | 1 
          perl-net-ssleay-1.85 | 1 
                     php-8.1.8 | 1 
           powerpc-utils-1.3.8 | 1 
              pure-ftpd-1.0.51 | 1 
           python-orjson-3.6.7 | 1 
rtl8189es-39c17661136da48f8... | 1 
rtl8821au-4235b0ec7d7220a63... | 1 
              strongswan-5.9.5 | 1 
                 sudo-1.9.11p2 | 1 
              swupdate-2022.05 | 1 
toolchain-external-codescap... | 1 
                   trinity-1.9 | 1 
             uccp420wlan-6.9.1 | 1 
           v4l2loopback-0.12.5 | 1 
           wpa_supplicant-2.10 | 1 
                xenomai-custom | 1 
                    zstd-1.5.2 | 1 
               zziplib-0.13.72 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/4ff555f61965f4cd078146548bb06043987e1e1e |     
   mips64    | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/683297b2926f1346af34662d84e0683bb56dd1a6 |     
    m68k     |       18xx-ti-utils-8.8        | NOK | http://autobuild.buildroot.net/results/83ea9ce416219145d145d6b8f05e5daf2fdd43bc |     
  riscv64    |           4th-3.64.1           | NOK | http://autobuild.buildroot.net/results/0a243376cba033f167d6ec591b2b88fd9e4f9ffe |     
   x86_64    |           ace-7.0.6            | NOK | http://autobuild.buildroot.net/results/6d8ee67bb06b8373b3850fcb47499d96887b3b58 |     
 microblaze  |           ace-7.0.6            | NOK | http://autobuild.buildroot.net/results/d5dc51723802f325f44d97e9168419dffc620b0d |     
   mips64    |          acpid-2.0.33          | NOK | http://autobuild.buildroot.net/results/c8ded6414e94c8a60cfa0587f4bacff7622fce7c | ORPH
  mips64el   |          acpid-2.0.33          | NOK | http://autobuild.buildroot.net/results/4ad535b8fdb85a078c3781391437bb658727d6a7 | ORPH
    m68k     |        alsa-lib-1.2.7.2        | NOK | http://autobuild.buildroot.net/results/c0b0d5f7ce684e9fe8f364d6b8d54f54b792dd4f |     
    arc      |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/db41a90115294bafb0b11d60e4941dd5cc5eb9a6 |     
   sparc     |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/a0bda577740748c407f5f6294ed6c201f98f9be2 |     
  sparc64    |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/0e4b87d6a5ec702ff36817d09f1f8b85e2da1cfa |     
    or1k     |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/e3b8ee4e8c4ed630875cfd1a702abd5cf12dbcc6 |     
 microblaze  |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/cd0b2ccb2e12d48d1370e6bf3324ae130baf4f51 |     
 microblaze  |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/d63415eb95861b4fd0b1871f6103b81c98b03910 |     
 aarch64_be  |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/d46867c0a8e915eda17fc234dbdce710f951c335 |     
powerpc64le  |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/bba8135c9499fb87807d64f58600a9bfee67ac09 |     
    arc      |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/9abbbc94542d9b91213082a7c4adfcaef92057b1 |     
    mips     |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/6fb6f610c67b64b7693f5bac6806b73d495ed41d |     
   mipsel    |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/30831f9d595bf6b74308572b504f078d6a93cace |     
    i686     |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/e36419538d40f3989c14f1d65d40ecb997eb126f |     
  aarch64    |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/014dad378ee029af5b1ab4aa82433e961c4bad99 |     
 aarch64_be  |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/a3e17001323c7a95d034790de42bd8b748e6ad75 |     
   s390x     |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/1316d44cb8a06c5fa95c39067a0d57a9d23703ed |     
  mips64el   |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/4b1b28ec3cc3a4025b4fafc229ec351b3c73e23e |     
  powerpc    |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/58e0cb8f9fdbb27db6ad4b7ac2caab66d89b3713 |     
   armeb     |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/2d0e771854572cc5812e913bedf69c22027f6714 |     
    mips     |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/3e7c4d4914a6b87316134037ad79fd8c8b96f2f7 |     
  mips64el   |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/8bac1f1cf474b3b29c7938dbdaf85b72e9e8cb58 |     
 powerpc64   |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/651e372f58ee459b2a7c6987d7a98bfa7bf4fd0e |     
microblazeel |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/f23553382645b273ccf99ea7d886c89e4b558052 |     
  sparc64    |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/f88a5e07e9c8b36611437adcc87085984809bd5e |     
    i686     |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/89e1eaebe97744fcdbf498d2d00f6528dc06653e |     
 powerpc64   |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/a9c7c5b5824380b1e53c60d21b94791b6aa9bd37 |     
   sparc     |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/073fec0ff4dde8396908bba6b93996d094f45862 |     
   xtensa    |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/a76e4b7c93cef406ab9d5a1d859f406611ee3385 |     
  powerpc    |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/c03ed1b80c10dabf57605327ce44c7f30523ec1d |     
microblazeel |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/a1fb5aa6ff056bf9b5856f44d1372ddae530fde0 |     
   mipsel    |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/3e4a675974d8894e0ac6838959a2b3ac25c31725 |     
 microblaze  |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/c41c7ad91dad647641e180431ae1f3cd0bed882d |     
   mips64    |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/2c925b93c3c195ba6bbcad958b639c8679b599b6 |     
 aarch64_be  |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/41584a1b1a509a38edea1c3f021cbd4ea2d4b34c |     
    mips     |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/b6b9c8c6b1516fbcd15dcf1e1d26db952a10b70c |     
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/b4bb27bbee81bce3bfce1ae71b3ff84980dc7f23 |     
   x86_64    |         apparmor-3.0.4         | NOK | http://autobuild.buildroot.net/results/c021d28f038cc87581a0e617ebd5b4f376adddeb |     
    arm      |     at91dataflashboot-1.05     | NOK | http://autobuild.buildroot.net/results/70ec1235792dc79324ccab2f2a8ac389e1c9b78e | ORPH
microblazeel |           aufs-util            | NOK | http://autobuild.buildroot.net/results/74aeb790e9017840e890007fba8a265ef5c83ddb |     
powerpc64le  |           aufs-util            | NOK | http://autobuild.buildroot.net/results/ad2af360a7a7614139115dc69599cfa6dceec01c |     
    arm      |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/37d23506a649f2195582b8964cba4a59fb1e7368 |     
  riscv64    |          bcg729-1.0.4          | NOK | http://autobuild.buildroot.net/results/35d53546626a6cab6911a444e854d82f9d868b7e |     
    m68k     |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/94aa45e29a75160999abaab37124bb4dd405303e | ORPH
   sh4eb     |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/8c17deb77a91a404407703d0ec51208f1f92c534 | ORPH
 microblaze  |         bitcoin-0.21.2         | NOK | http://autobuild.buildroot.net/results/a831898bedcb1de5be78c66da1882dd28a0cf7fd |     
powerpc64le  |           brltty-6.4           | NOK | http://autobuild.buildroot.net/results/c16c149524ef3fc39dba5d3df83137eb613f645f |     
powerpc64le  |           brltty-6.4           | NOK | http://autobuild.buildroot.net/results/5449384750739db291468539d935f72c099ec4ea |     
  riscv64    |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/20f92924d4d2d7727a79a013e3584329de6546b0 | ORPH
  riscv64    |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/11e820ca7821d72e35d962a91c69c6598dbe9b4f | ORPH
  riscv64    |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/0765cff3aaf20a8ac10776e679eb6a4ee4731cff | ORPH
  riscv64    |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/be2b3a2e19219f3f848017690c0efa1b30c5256a | ORPH
  riscv64    |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/5aafc5d9d40494251689804a67eda338dc6751d7 | ORPH
  riscv64    |          cjson-1.7.15          | NOK | http://autobuild.buildroot.net/results/bd48010fd2246d9e1c8617782e707a92805df81a |     
   x86_64    |        containerd-1.6.2        | NOK | http://autobuild.buildroot.net/results/f1f8532142d2f53e88d433bfcf9f6b5d157e77fb |     
   x86_64    |        containerd-1.6.2        | NOK | http://autobuild.buildroot.net/results/4a5a856d44ef97ce107c9600401dba01f655adeb |     
    arc      | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/7e08a5a96f49253498f6bcce134b763323748f40 |     
  sparc64    | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/2e4333bf885e4b04ecbc4b8b56a05b7c35480fa6 |     
 powerpc64   | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/d785d52af677d852831703843e1eeb65ef32bef6 |     
    or1k     | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/5388b8a810e7e9ba04865712721e7c01e21a27db |     
    i686     |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/cb151a5f85fe622774505a2151a39e3faf9b5ed8 | ORPH
    mips     |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/8db399fff09dcf78af64e765267b7b9c66af6140 | ORPH
   x86_64    |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/f53bc200899ed63346e7433f2a8ef404b3614200 | ORPH
  sparc64    |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/5067c9f19e4b9191335fd675983f5d2e6e4822dc | ORPH
   sh4aeb    |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/21fef81d22255992f472ca60fdac09048c8c7238 | ORPH
   sh4aeb    |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/d769b2d6e9dc0e461a6d2b9230515096f7c6d265 | ORPH
 microblaze  |        dieharder-3.31.1        | NOK | http://autobuild.buildroot.net/results/3ce0a6d73d79e87ceb8c2de02992a4eb6ab61744 |     
   x86_64    |     edk2-edk2-stable202102     | NOK | http://autobuild.buildroot.net/results/7d4035d2724423d7757b77a7db297c7a54f0ec74 |     
  aarch64    |     edk2-edk2-stable202102     | NOK | http://autobuild.buildroot.net/results/692b28700cf2c980214e4c28d963ffe46679d044 |     
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/a26b3f1cafb7e4a1c9f3e740a47418944845aaa5 | ORPH
   mipsel    |           emlog-0.70           | NOK | http://autobuild.buildroot.net/results/33358df40b041194d0a022e36e6b24b49746b501 |     
    arm      |          exempi-2.6.1          | NOK | http://autobuild.buildroot.net/results/c063cdb7947fa385891d5a05b4197307c2ee0a26 |     
    arm      |           exim-4.95            | NOK | http://autobuild.buildroot.net/results/9202a3fc3a6b9510f2a6ec9e532c07670627acf9 |     
   mips64    |         fdk-aac-2.0.2          | NOK | http://autobuild.buildroot.net/results/bfdfaa29e7d82f821328ec885c59f5e5b2938dae |     
   mips64    |         fdk-aac-2.0.2          | NOK | http://autobuild.buildroot.net/results/3a3eb2e207e6c567b1b7cc11b44dbc75a3c335a5 |     
  aarch64    |         fdk-aac-2.0.2          | NOK | http://autobuild.buildroot.net/results/a18c2662bcad33dac4abf242d47f506b3b1103e6 |     
powerpc64le  |          ffmpeg-4.4.2          | NOK | http://autobuild.buildroot.net/results/cf5f366c0a8ffbf470b131596417bf15c9754ce0 |     
   mips64    |          flann-1.9.1           | NOK | http://autobuild.buildroot.net/results/d65261ede05e0b73be97995f864540037b018c73 |     
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/0657c492116b883af55d5bda7ff32baa4feeaa36 | ORPH
    or1k     |         freerdp-2.7.0          | NOK | http://autobuild.buildroot.net/results/82a418727d0cf92c2c4bdf39f0a1e3f5c582975c |     
    arc      |           frr-8.2.2            | NOK | http://autobuild.buildroot.net/results/15d3beb950f971ff854fb46450ba7006807e99b1 |     
   xtensa    |           frr-8.2.2            | NOK | http://autobuild.buildroot.net/results/d613c097494e4ac410b9a3cf5f317430034280c2 |     
 powerpc64   | fs/cramfs/cramfs.mk:46: /ho... | NOK | http://autobuild.buildroot.net/results/ec2d2343006cc3e01dad55e2697167c4144f0908 |     
   armeb     | fs/cramfs/cramfs.mk:46: /ho... | NOK | http://autobuild.buildroot.net/results/d8963848d00f8537c37329fb917ca075281675f2 |     
   s390x     | fs/erofs/erofs.mk:40: /nvme... | NOK | http://autobuild.buildroot.net/results/8f10630a36dd852a1e1dd67c23be9a7e227cff59 |     
  mips64el   | fs/ubi/ubi.mk:51: /home/aut... | NOK | http://autobuild.buildroot.net/results/497990b233453574ffda5ca39d10e20759e67f50 |     
microblazeel | fs/ubi/ubi.mk:51: /nvmedata... | NOK | http://autobuild.buildroot.net/results/6e1ecff2d597d4bf163671aaaba43f8d3b827bc9 |     
  mips64el   | fs/ubifs/ubifs.mk:49: /nvme... | NOK | http://autobuild.buildroot.net/results/142cbe33df1780ba1de94b134a256bd127f2e5c1 |     
   s390x     | fs/ubifs/ubifs.mk:49: /nvme... | NOK | http://autobuild.buildroot.net/results/ff54ed11ef1c92dad91f592999407a21b295f403 |     
  powerpc    | fs/ubifs/ubifs.mk:49: /nvme... | NOK | http://autobuild.buildroot.net/results/896734113ec105463fada45025aebf229540bfe8 |     
  sparc64    | fs/ubifs/ubifs.mk:49: /nvme... | NOK | http://autobuild.buildroot.net/results/e6fbcbb21614bc02759ffdf9ff6ea827e18c749c |     
    i686     | fs/ubifs/ubifs.mk:49: /nvme... | NOK | http://autobuild.buildroot.net/results/d7a4bce96d4d6153127e01e7314e0dd3941e9df9 |     
   armeb     |          gauche-0.9.9          | NOK | http://autobuild.buildroot.net/results/3d64d113014b34b3991da812c0c231941d61fa6b |     
    or1k     | glibc-2.35-96-g2c4fc8e5ca74... | NOK | http://autobuild.buildroot.net/results/64af8c1c1e72461b9eb4bf872c403a82b933b8ff |     
   nios2     | glibc-2.35-96-g2c4fc8e5ca74... | NOK | http://autobuild.buildroot.net/results/9c8c41a2982a9cdcb8b8b8cee3c68b39f0790e66 |     
microblazeel | glibc-2.35-96-g2c4fc8e5ca74... | NOK | http://autobuild.buildroot.net/results/762baf9241a9433a921e269b840280b97f72bae7 |     
   nios2     | glibc-2.35-96-g2c4fc8e5ca74... | NOK | http://autobuild.buildroot.net/results/6be4d6e5ef2f04a2fff71bb61f82094b9a59455a |     
   nios2     | glibc-2.35-96-g2c4fc8e5ca74... | NOK | http://autobuild.buildroot.net/results/66c1a8c7394530bc34ccf3d5a604343a39524916 |     
  powerpc    | glibc-2.35-96-g2c4fc8e5ca74... | NOK | http://autobuild.buildroot.net/results/cd2282f207da98bdf7ae9f399ed1a7bb62fd339f |     
    arc      | glibc-2.35-96-g2c4fc8e5ca74... | NOK | http://autobuild.buildroot.net/results/3a22f7aac38145b26c549254b819f87329e7a77e |     
 microblaze  |  gobject-introspection-1.70.0  | NOK | http://autobuild.buildroot.net/results/1f1579425b4b6d62f7091d219c0b7916de4eb0ba | ORPH
  powerpc    |  gobject-introspection-1.70.0  | NOK | http://autobuild.buildroot.net/results/a5fbdceda3448b648665574e0e6a6b9160414f87 | ORPH
  sparc64    |  gobject-introspection-1.70.0  | NOK | http://autobuild.buildroot.net/results/ed1e26b3bccedca498a614b1b234c4644233a0d9 | ORPH
   mipsel    |  gobject-introspection-1.70.0  | NOK | http://autobuild.buildroot.net/results/fbcaf63e83b74583dd96dd7a225309e0792d1b45 | ORPH
    mips     |  gobject-introspection-1.70.0  | NOK | http://autobuild.buildroot.net/results/9820d75f1ea625bfeb22aa141eb42071f0d6fe3e | ORPH
   s390x     |  gobject-introspection-1.70.0  | NOK | http://autobuild.buildroot.net/results/bbf87823484e93a8da51f2c36d501f719e08dd38 | ORPH
  sparc64    |  gobject-introspection-1.70.0  | NOK | http://autobuild.buildroot.net/results/6832c5111cefc8b7845ec85e4efb315e5513994c | ORPH
  sparc64    |  gobject-introspection-1.70.0  | NOK | http://autobuild.buildroot.net/results/1798683cde22888831aa3efcb91974daa247b36d | ORPH
  riscv64    |        gocryptfs-2.2.1         | NOK | http://autobuild.buildroot.net/results/28ca627b8953d0f37d6765a7efdc31f4c62c4cfe |     
   sparc     |          gstd-0.14.0           | NOK | http://autobuild.buildroot.net/results/f72564626ce3d63d894e57554104342064099a9f | ORPH
    sh4      |          gstd-0.14.0           | NOK | http://autobuild.buildroot.net/results/ed3de3919ba59324542550d3e379f49a0b302b41 | ORPH
   armeb     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/2790f3901164e1cf66f1c9c8125b3589b3a5766c |     
microblazeel |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/7fd7c7cd53e298cf2dcce0a13a68caae7de43c25 |     
    i686     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/33d0ea481eb93e6fc5b890922bf5316e757b8fc7 |     
   x86_64    |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/d03a669962135d4d42b7ae72fee217f49c1a8af4 |     
  riscv32    |      host-gcc-final-9.4.0      | NOK | http://autobuild.buildroot.net/results/e8ab398750ac5f731e52a8ee5974a01f17019680 |     
   arceb     | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/13d266c70d321b9e0a8c9d4526eabeddb82d0a48 | ORPH
  mips64el   |         host-go-1.18.3         | NOK | http://autobuild.buildroot.net/results/0fb03d702c21e9991ffb976a5b3b2c04559b312c |     
  aarch64    |         host-go-1.18.3         | NOK | http://autobuild.buildroot.net/results/7ca11d1b807ec72ef04dcac75f43b84734091a70 |     
   x86_64    |           host-mono            | TIM | http://autobuild.buildroot.net/results/61ace07cd78009184dd801b7fa4f3647e358b005 |     
    or1k     | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/d1d9dbd9dda7ce217a2a1c4742bff5a73676ef30 |     
    mips     | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/a0212b69b0976440009b55687811ca6b056bb3b0 |     
 aarch64_be  | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/ed1b193112692ebe64d39b2d9cea000f4fe55634 |     
 microblaze  | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/5130b2697955bb9ecadcf9bfe30ffc7158d99fac |     
  aarch64    | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/baad4c7e037fcdb46d77e26fa08e5f66938935a9 |     
  aarch64    |        host-rust-1.60.0        | NOK | http://autobuild.buildroot.net/results/30b64b580bef491127320c649c365185dd164ae2 |     
  powerpc    |        host-rust-1.60.0        | NOK | http://autobuild.buildroot.net/results/1497af311077d504eb369e3160e6dd8e2477f7e2 |     
   s390x     |        host-rust-1.60.0        | NOK | http://autobuild.buildroot.net/results/db50d5555be0e700938c41f925ef5fa15862e7d7 |     
    arm      | host-spirv-llvm-translator-... | NOK | http://autobuild.buildroot.net/results/14be912fd0f0c62e25549aed066a830c5828952a | ORPH
    arm      | host-spirv-llvm-translator-... | NOK | http://autobuild.buildroot.net/results/8eba44bd55176a91f9ec0d524ef618b0d12ee5b2 | ORPH
   armeb     | host-spirv-llvm-translator-... | NOK | http://autobuild.buildroot.net/results/6881ed4b81d31ac8e4ecd8fc6d8705009cecdf24 | ORPH
  aarch64    | host-spirv-llvm-translator-... | NOK | http://autobuild.buildroot.net/results/a3b4c94b8e6db0158915a181d5cea0f0ce6ab91f | ORPH
    i686     |         host-wine-6.0          | NOK | http://autobuild.buildroot.net/results/a4df336ac5d4932dfe853db0f7c880bc85339c00 |     
    arm      |         iptables-1.8.8         | NOK | http://autobuild.buildroot.net/results/7561e9f0a5b8973ce64967ebeda593b50fcf9b0c | ORPH
    i686     |         iptables-1.8.8         | NOK | http://autobuild.buildroot.net/results/26f23c086c8ad3eda9ca1322be9b671897b49164 | ORPH
    m68k     |          jack2-1.9.20          | NOK | http://autobuild.buildroot.net/results/49b19f29175bcade1b4f12564c5ef5f03741bc64 |     
powerpc64le  |        jpeg-turbo-2.1.3        | NOK | http://autobuild.buildroot.net/results/f187f2ff21963dcebecf080605550fe0c7c44773 |     
powerpc64le  |        jpeg-turbo-2.1.3        | NOK | http://autobuild.buildroot.net/results/96249329ee48a1d15012d3d0fff58f30ab7c4c54 |     
powerpc64le  |        jpeg-turbo-2.1.3        | NOK | http://autobuild.buildroot.net/results/de28df26cd165753376e28cd28caa84caa1786d2 |     
powerpc64le  |        jpeg-turbo-2.1.3        | NOK | http://autobuild.buildroot.net/results/8f7a4058f0b09c482ab4cfcf3df344b8b130737b |     
powerpc64le  |        jpeg-turbo-2.1.3        | NOK | http://autobuild.buildroot.net/results/6c85d29c1e88df9ef5fad1cdffffad60e65f362e |     
powerpc64le  |        jpeg-turbo-2.1.3        | NOK | http://autobuild.buildroot.net/results/52f78d9ccc8d55665fa644c5a7bf41387a6cb202 |     
    arm      |          kexec-2.0.24          | NOK | http://autobuild.buildroot.net/results/e7d04e119eb1a673e6b22165139ca4537b4b01e2 | ORPH
   armeb     |          kexec-2.0.24          | NOK | http://autobuild.buildroot.net/results/23f998918959b664fa0497f525ffa2a8b1cb52d8 | ORPH
    arc      |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/08260dfa5887d89586b17b843f0018b3bf6875d3 |     
microblazeel |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/6c13d37ceeafed48e7692c123c08ed80a05ebef1 |     
  riscv32    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/9b2bce6f07f9bef2cf0953f0ecb9299b2c5a15da |     
  riscv64    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/d9f771acfa4b93480e450fec6b979f225dc9a294 |     
 microblaze  |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/23bd811adf5489939d09c1768e8a798195e536d1 |     
microblazeel |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/e90e73f235c70ea1a64fea39d1d8bf0676a769fd |     
microblazeel |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/124f714dbe387724cc003af7bec91fe48acd3418 |     
   sparc     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/fb4f97203935f5b9e069cf60b2e3e78c12b9ae93 |     
   sparc     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/9fd36a52b468fe5ca71a45de09d3e7dc360ff807 |     
  riscv32    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/89ddbc060a4fb573f399b590066c61dbc98c41e9 |     
  riscv64    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/57b9242959a10200d15eb1604e0a12a3f1d9b9c6 |     
microblazeel |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/9cb8055595456eff799c94a122716433fd8f2b21 |     
microblazeel |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/95e17792a653a4950058cefa893eeff08b784dfc |     
   armeb     |        libdcadec-0.2.0         | NOK | http://autobuild.buildroot.net/results/8513161cbc38f61462114da527862f505d41d7db |     
  sparc64    |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/934b6eeb17282c0aea21e5ca712c39173cc4681d |     
  sparc64    |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/5c68915fd91cb0a69ccbb3a90a239afd65a28460 |     
  sparc64    |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/4681744908d0196c04cf3b20850b4636568e317d |     
    arm      |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/0aff050958c343f85af55d7dd43b139a91f517e6 |     
   armeb     |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/18dd0b209b52c7b80ad6d54c0fe48ab802e4826d |     
   sparc     |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/c9055c77b028287c118a3bcfcbef73bffe33c5b9 |     
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/5923f68515b8bc689720b64a935c87b05c9dcd23 | ORPH
   arceb     |        libglib2-2.70.4         | NOK | http://autobuild.buildroot.net/results/351f0d05fa8bb5b01a44a03b57e2d1bd8112b6b4 |     
  aarch64    |       libgpg-error-1.42        | NOK | http://autobuild.buildroot.net/results/a7037e0fb7b957ecf260ac6291f7e6ab647f0778 | ORPH
    arc      |          libnl-3.6.0           | NOK | http://autobuild.buildroot.net/results/08a82bf8d02ed5bf56ec09323f08dcf006d6f0e3 | ORPH
   arceb     |       libopenssl-1.1.1q        | NOK | http://autobuild.buildroot.net/results/6c9949bf23724c8f87af973fe1ddbaf2bdbb35f2 |     
 aarch64_be  |       libopenssl-1.1.1q        | NOK | http://autobuild.buildroot.net/results/d4e5ae7513d6a72f5ac2655cf06935d43823398f |     
  powerpc    |       libopenssl-1.1.1q        | NOK | http://autobuild.buildroot.net/results/aea789f50bbc087a10c709e2c3036ce1d9e0861f |     
   sparc     |       libopenssl-1.1.1q        | NOK | http://autobuild.buildroot.net/results/98f7027bcc433af8a78be6bbacb3282a172f3650 |     
  powerpc    |       libopenssl-1.1.1q        | NOK | http://autobuild.buildroot.net/results/f9b8d0a848901636bc9cd3ad99d329c46c8114a6 |     
    arc      |       libopenssl-1.1.1q        | NOK | http://autobuild.buildroot.net/results/5411a9cfb02b4e6093043840055c45efa575b420 |     
microblazeel |       libopenssl-1.1.1q        | NOK | http://autobuild.buildroot.net/results/294b1bec189ac5f1c18d42ad19697f40188376b6 |     
 aarch64_be  |       libopenssl-1.1.1q        | NOK | http://autobuild.buildroot.net/results/444a855cfcee513b28d0c251c1312d7a7e6974be |     
    m68k     |       libopenssl-1.1.1q        | NOK | http://autobuild.buildroot.net/results/f095c823b0e972b34189ceb000ce023753482649 |     
   sparc     |       libopenssl-1.1.1q        | NOK | http://autobuild.buildroot.net/results/6b7ec9b26f51f81769cbd9794a2bc3b9fb0542db |     
   sparc     |       libopenssl-1.1.1q        | NOK | http://autobuild.buildroot.net/results/4313757dc0ae1739156bbb089dedc7eb2a817ef9 |     
    m68k     |       libopenssl-1.1.1q        | NOK | http://autobuild.buildroot.net/results/8249475108281fe00779664dac51bf5852e3c255 |     
    m68k     |       libopenssl-1.1.1q        | NOK | http://autobuild.buildroot.net/results/df5c26cdb7da5c97bde5f768e0ead682724de639 |     
  sparc64    |         libp11-0.4.11          | NOK | http://autobuild.buildroot.net/results/dfc83136de40e83d3ac7a6584bfa9ddf474a1536 | ORPH
    or1k     |         libressl-3.5.3         | NOK | http://autobuild.buildroot.net/results/64db187507329bea2ed370c74792e3aad3ef24bc | ORPH
   arceb     |         libressl-3.5.3         | NOK | http://autobuild.buildroot.net/results/2cc79c88c39fe93f14f0629438d481dbf80062ea | ORPH
   arceb     |         libressl-3.5.3         | NOK | http://autobuild.buildroot.net/results/2fa4fa10cf19f1f942b6b49b5f6f05339c008cd4 | ORPH
microblazeel |         libressl-3.5.3         | NOK | http://autobuild.buildroot.net/results/d91bc4e97474a629dea354336eafa88d29e252ad | ORPH
    arc      |         libressl-3.5.3         | NOK | http://autobuild.buildroot.net/results/cd0cfc6686663b31b580287b18babb9ba0a5afca | ORPH
  aarch64    |         libvpx-1.12.0          | NOK | http://autobuild.buildroot.net/results/9201d877c8e1a6d72ad94367a39d221a2d831da9 |     
    sh4      |         libvpx-1.12.0          | NOK | http://autobuild.buildroot.net/results/ef4ba35cdc4fb22be37fcfbba5448f8799f5ec8f |     
 powerpc64   |         libvpx-1.12.0          | NOK | http://autobuild.buildroot.net/results/99c38b9c828c113ecf95f04ff266252d40d1aae7 |     
  mips64el   |         libvpx-1.12.0          | NOK | http://autobuild.buildroot.net/results/7e6d22f669fc5c65d5bdf55e541dd041c2ee471b |     
  sparc64    |         libvpx-1.12.0          | NOK | http://autobuild.buildroot.net/results/bd12dd5a95e6aea19e0c91b2aa015a60b45491e0 |     
 aarch64_be  |         libvpx-1.12.0          | NOK | http://autobuild.buildroot.net/results/4b0f82526c2faf44b24abb22624b5da4395aa910 |     
   sh4eb     |         libvpx-1.12.0          | NOK | http://autobuild.buildroot.net/results/145af518826335f6e2e6b2c9ec5e304824909fd5 |     
  riscv32    |         libvpx-1.12.0          | NOK | http://autobuild.buildroot.net/results/7bad8d2d0eebbcc18f809f175b2ba3fd08856397 |     
  mips64el   |      libwebsockets-4.3.1       | NOK | http://autobuild.buildroot.net/results/46becc7d3141aa3f1d115cb191ab675ded1c45be |     
   xtensa    |      libwebsockets-4.3.1       | NOK | http://autobuild.buildroot.net/results/edae131f96aaf05cbc1e9b329965ec7cc87052ee |     
    m68k     |         libxml2-2.9.14         | NOK | http://autobuild.buildroot.net/results/c31e5f63ef6aedaaca2b21239253ed69f706d833 |     
    arm      |    linux-5.10.109-cip5-rt4     | NOK | http://autobuild.buildroot.net/results/377bc051553eaddf4dd869c5f0d7078c57b89de4 | ORPH
   nios2     |    linux-5.10.109-cip5-rt4     | NOK | http://autobuild.buildroot.net/results/942ad6fbe6f34766732295abc507e4e4d03c31d7 | ORPH
   arceb     |      linux-5.10.115-cip7       | NOK | http://autobuild.buildroot.net/results/5d070e6af71378726215749cd46b921b7ceb3fee | ORPH
powerpc64le  |      linux-5.10.115-cip7       | NOK | http://autobuild.buildroot.net/results/6b15d4505c87c14a58bf045c3905c1a216f8eaf3 | ORPH
   mipsel    |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/0ceeb41fc038c6d8884ca3408a3cb2dfe08a3bba | ORPH
   s390x     |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/2c00795bb1df6be0b9f6c13edb4605257f761f55 | ORPH
   nios2     |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/4982b60a7fd4dedb981ac3c2a600aacf37e0e71a | ORPH
  mips64el   |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/0cae00d15cc836f884cba860ecad4bb182cc9c69 | ORPH
   sparc     |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/6983d767f9a40f043c139975b92c3b9343bb7104 | ORPH
    mips     |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/1561618ae6d11b840459527c35202dea6f79dc79 | ORPH
   sparc     |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/02ac7b222772591ad78b80cef43783e35d420369 | ORPH
   s390x     |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/f5f4d3241637ccd483e9b5ddc5bea10b713f0b19 | ORPH
  riscv32    |       linux-fusion-9.0.3       | NOK | http://autobuild.buildroot.net/results/216b056e2ae3ebfcf5f0c063a33d4d9ea7bca421 | ORPH
    sh4      |      lttng-modules-2.13.1      | NOK | http://autobuild.buildroot.net/results/33db3bca56700e17096a8d992ef59576ff8deb7d |     
    i686     | make: *** wait: No child pr... | NOK | http://autobuild.buildroot.net/results/731c6b89109c463d747fe9a3019447d961164c9b |     
    arm      |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/469a8899e31855eaae63048c56d28e360167d678 |     
  powerpc    |           musl-1.2.3           | NOK | http://autobuild.buildroot.net/results/5c7f71852b8ad201c0615838b7fa6f8bb15cc55b |     
   sh4aeb    |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/674b782e835d4930e4ac43993e4933b14e116185 | ORPH
  riscv64    |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/a44e81a7e8a97b8b558874e646ee065e2cadfede | ORPH
   s390x     |        openpgm-5-3-128         | NOK | http://autobuild.buildroot.net/results/428abab8ef7fcb26bcb0a14e03fffcc866904d29 |     
   mipsel    |        openpgm-5-3-128         | NOK | http://autobuild.buildroot.net/results/904c66bf194bedb0efbbf00ae00e683ff8124eec |     
 microblaze  |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/e1fd8f832af75a74d7bc19c193b2a9cac130220d |     
    mips     |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/e7eb2a198f9a01b04b4be4564e7892b0ad21c91d |     
microblazeel |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/a18d271dbd9fdd8905d174e913cd87081ed8fba6 |     
   mipsel    |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/e01a042185b2221bee815bb9096c4419eeb6e558 |     
   arceb     |      perl-net-ssleay-1.85      | NOK | http://autobuild.buildroot.net/results/ac931de7ab151eceaf649399ba43bdcd1864a140 |     
 aarch64_be  |           php-8.1.8            | NOK | http://autobuild.buildroot.net/results/664116d45cfe91a2f6c790fda2c60a38c280aa88 |     
powerpc64le  |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/66e934623b80c95ef5e09fe3cd6f17ac00d7003b |     
powerpc64le  |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/dab6ad7fa78038983da2433bdacf6104133d0cf0 |     
powerpc64le  |      powerpc-utils-1.3.8       | NOK | http://autobuild.buildroot.net/results/631e74e6f7b7bc216800203acc99b6a53af266b6 | ORPH
    arc      |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/05b62bc4b5fdb9fdd7bf4358433860b039d4fdae |     
    arc      |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/60421a1312d2e0cc4fb9334431612a3650075f1a |     
    or1k     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/06ab40b298dd91ee8ae40bb8df70797872cd0086 |     
   nios2     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/537d80d9bba4fa56bb1ce54adf26f15a1e3e476c |     
   nios2     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/5222cf99bd0059bd25c717d4b4c0583d27abf9bc |     
   mips64    |        pure-ftpd-1.0.51        | NOK | http://autobuild.buildroot.net/results/30d925c561ccaaf948940f5f014a9d8d12769791 |     
    arm      |      python-orjson-3.6.7       | NOK | http://autobuild.buildroot.net/results/6fe968a13564e8c4d55cc20ad1f063e5d73e530b |     
   sparc     |           refpolicy            | NOK | http://autobuild.buildroot.net/results/3b18f60296c396a1f8d30a083390fae7be97dd18 |     
microblazeel |           refpolicy            | NOK | http://autobuild.buildroot.net/results/1a211d9a607229eac4adaf6f8ce8ef19fc85c322 |     
    mips     |           refpolicy            | NOK | http://autobuild.buildroot.net/results/d2af893aef92a041cb97acaac3b44f4c1ed78d8d |     
   mipsel    |           refpolicy            | NOK | http://autobuild.buildroot.net/results/f4869629212cb923fff1307c006578e8c6e24e1d |     
  mips64el   |           refpolicy            | NOK | http://autobuild.buildroot.net/results/ad795059e4586c96eb20192d9856541662f75a50 |     
   sparc     |           refpolicy            | NOK | http://autobuild.buildroot.net/results/e679eb873d9498adac12e5f2371e77409c1fb501 |     
 powerpc64   | rtl8189es-39c17661136da48f8... | NOK | http://autobuild.buildroot.net/results/5ae32f5e9a220edc364cd1d8b7718d7af7a026f1 |     
   s390x     | rtl8821au-4235b0ec7d7220a63... | NOK | http://autobuild.buildroot.net/results/f674d0e7c6dad90278dfdb065988d157494cf396 |     
   mips64    |    shadowsocks-libev-3.3.5     | NOK | http://autobuild.buildroot.net/results/d73a9bedac1cb58da86d0542e26b910c82d9824d |     
    m68k     |    shadowsocks-libev-3.3.5     | NOK | http://autobuild.buildroot.net/results/d7c68f0f2eee5d57d50a618edad832387c154379 |     
   s390x     |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/658a30674d12cd2f828e240d8a4562f168b146dc | ORPH
    arm      |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/e8630ebf2c72b76c26b532e38daf0687ed95b999 | ORPH
  sparc64    |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/983e81387881f5c5c10e41ee832b67eb6ef2c417 | ORPH
 aarch64_be  |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/fa775dd04a6c4ab1d4fd739bdfb83f5b15bec2df | ORPH
  sparc64    |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/92107d2d52cd1908e893314f56a09876a235e66b | ORPH
  powerpc    |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/89c269f61ea0f8aa2e98e150d150f6b7aef00e2c | ORPH
    i486     |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/9c8de8965299c4e20ea09c2bd0cac8625feab77d | ORPH
  mips64el   |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/22c8201b7e0b15dec8af9a0a9b1633b1e2d4327e | ORPH
   s390x     |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/2ed67ada55d85862f041be3b2ee5a25bc7b8e6a5 | ORPH
   mipsel    |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/efbe2df1f99735a2a2c9a88c32e879a528310510 | ORPH
   x86_64    |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/4df5458c1ab10c5693569efaf0fa57a81f67d930 | ORPH
   mips64    |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/a37287ff737f0094d704ce7c6357ef74f331ca6f | ORPH
  aarch64    |        strongswan-5.9.5        | NOK | http://autobuild.buildroot.net/results/e2f358cdc7a4bc7c6afb7a64d4b0c013e494a737 |     
   sparc     |         sudo-1.9.11p2          | NOK | http://autobuild.buildroot.net/results/095fbb81e862472d5d9a00fdc85dc9683f49bc70 | ORPH
    i686     |        swupdate-2022.05        | NOK | http://autobuild.buildroot.net/results/4ccaf328ea8ed3c353212d1e952b5982e7901275 |     
   x86_64    |        syslog-ng-3.37.1        | NOK | http://autobuild.buildroot.net/results/31e9b00310ff89623f0309808169d5faf935f9fa |     
  sparc64    |        syslog-ng-3.37.1        | NOK | http://autobuild.buildroot.net/results/4aedec05016c939a9c1bf1ebecc907859474d54d |     
   mips64    | toolchain-external-codescap... | NOK | http://autobuild.buildroot.net/results/d24bd5616c86365938fc40ded1328a8e65f0ae81 | ORPH
  riscv64    |          tor-0.4.7.8           | NOK | http://autobuild.buildroot.net/results/1da478215488e5b38680a1acc4221f99dbda9424 |     
    arc      |          tor-0.4.7.8           | NOK | http://autobuild.buildroot.net/results/f3acdf67fb7e608b034b97045118f98b3c2acd3b |     
   x86_64    |          trinity-1.9           | NOK | http://autobuild.buildroot.net/results/0b804f91fce3289dc9994fecebd46f4a47f2a52e | ORPH
   s390x     |          uacme-1.7.1           | NOK | http://autobuild.buildroot.net/results/6fe8bfbda73ff8a79bbbe0d68b573ba20dec5b13 |     
   s390x     |          uacme-1.7.1           | NOK | http://autobuild.buildroot.net/results/16ac460b4578daf73d728b0756d1bbdb2c9759ae |     
  sparc64    |       uccp420wlan-6.9.1        | NOK | http://autobuild.buildroot.net/results/00ede351f69f5bdff6b5e7daccb29bc7dbe3f8e1 | ORPH
   arceb     |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/c8b2f331c98453670cd982558144c4fd84674a3d |     
    arm      |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/fc3454531fb10c92ea1a12a962e90eb44b04de99 |     
  powerpc    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/80feddaf5cc7d91be47e3564bcb72a8ea596aa36 |     
  powerpc    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/79e661a262222c1b2d627b1d7e6d1b27bcba7f4a |     
  riscv64    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/ac6e2c4369df46bad9a2ad46ce073e3f15f22ee6 |     
  riscv64    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/44e9201b2bcfe313d6423764ef2280a705b63659 |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/97190635af56c02ad3a0328e2a04968f33562eec |     
  powerpc    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/ca52f6c4b074fd5fb71c3704e9994d834a02a6c9 |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/9ed56941ae1dccd19eef00bd6d45fdc47d202c6a |     
  riscv64    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/b50b4a584cd1df69e986c0ffeb349ddc35a0cc55 |     
   arceb     |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/b41bcdc23982a42436f64eef15af5e58e1f49d86 |     
  riscv64    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/296d48d88b2ee9b46cb48ec707eedc6d9f314541 |     
  powerpc    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/49dac5f34ed4dade2eee7e17052cc8f5b47101e3 |     
  riscv64    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/d11844a948afec4be36da90b1c447f952b09486f |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/1d68a9dc45a47f489c67e1c315ecb4ebd404c7d0 |     
  riscv64    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/a88799a306c83bf60c84a89fdd94d8e16d217784 |     
   armeb     |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/1e2e5e6c752901a818630d0c0816f43874bf936b |     
  riscv64    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/3025de85f8b65f552f8a74d742d82b251adffedf |     
  riscv64    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/51b4c4967e9beb492e8b0300d130035867639064 |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/ea45866ef0694ed3f020b51b2722031d24badc25 |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/37fd05bd47e022f0ec93c0d8fababe1bbdbcc3f3 |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/8964d9d2710cb79aa6bd7bac5535bf2496934add |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/7e97ad39a540e069227ed0e6ade0811da687db97 |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/8a7b39f83128e87f6f248122098facf40a30d726 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/accd2609f5a2598efaeaa1675642c59a158476e8 |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/ae933ca690e6b1a09002ccb9d56f87347d2494ef |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/36f8af29e136406ed8dfeab570b0105c1da2cd8d |     
    mips     |            unknown             | NOK | http://autobuild.buildroot.net/results/0accb4c599fbdaceb1434909f26e41799963a6f9 |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/15020cc8d91f4f4dffc06f30514c3ce91980e895 |     
    mips     |            unknown             | NOK | http://autobuild.buildroot.net/results/9489aca1df552dc4946e5ae9a0cae1614f26cb5e |     
    m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/1c8767a982b7a5325b186802a78276167061200d |     
   armeb     |            unknown             | NOK | http://autobuild.buildroot.net/results/679376e95df3c5918b8292fc00001e0a1e148fff |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.net/results/8a84282057706d457bab394f7d958fc3e04aeb0d |     
   armeb     |            unknown             | NOK | http://autobuild.buildroot.net/results/67c6f2d2e3d12ab5621b7f65451dce75bf1772a8 |     
   mips64    |            unknown             | NOK | http://autobuild.buildroot.net/results/2040c783f65427e00d01cfed5ba5663a673a11dd |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.net/results/ba7629b2121bb8d81b8468706924f67c4199922c |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/61440254299257360853893ea3e7a1be0344f432 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/282c20971eae6bd5b2e075061257c43edbcf9b8b |     
    m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/c6f7b2e1b657ca018751c4bb272002fd53be5bc2 |     
   mips64    |            unknown             | NOK | http://autobuild.buildroot.net/results/32e03152b71fe933fd8a31112cba3ec0c94005f3 |     
   mips64    |            unknown             | NOK | http://autobuild.buildroot.net/results/eeec345f8ce7dab0126fc9b218a01ba99b253c3b |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/b197a7b815270fc70618747c397a51b11a9b2bf1 |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/6cddb886f53e2055f0ac288d44a7a619e7760d5d |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/db8d2a97de0274ed2f707ee09923d8d52d56cee4 |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/a51f013603400226aa5b8adbdb86a46a2f5ec6e1 |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/2909ed754c689aaebb9b4c4b5ebb0e653bd56cdd |     
 microblaze  |            unknown             | NOK | http://autobuild.buildroot.net/results/03fd9572aabeb3cbd5b2250907f143e0334790e6 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/96ee30d05983415f7801a42dccb07edc244f1e1a |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/fef35673c0292d650b297fd98d27556df6b51739 |     
   xtensa    |      v4l2loopback-0.12.5       | NOK | http://autobuild.buildroot.net/results/37f0957a83f9c3059e376f8f500d084a381af16c |     
   xtensa    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/8c6912d80cf426ce78a167298e06d4fbd7512c10 |     
  riscv32    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/79107fcecf24e439d77e1e3897ef34af6e7f09ff |     
  aarch64    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/5824ad5613fbb2736c25b48bcae6650889e042d6 |     
    mips     |      wpa_supplicant-2.10       | NOK | http://autobuild.buildroot.net/results/fb35c29a966e21a29df5923e6d27ca372a4b4909 |     
   mipsel    |         xenomai-custom         | NOK | http://autobuild.buildroot.net/results/64cffcdd748abd49a9061194182ed3b3c771073b |     
 powerpc64   |          zabbix-5.4.9          | NOK | http://autobuild.buildroot.net/results/1bd4196b526d6c4657851818bdc53b5160039f6e |     
  mips64el   |          zabbix-5.4.9          | NOK | http://autobuild.buildroot.net/results/d511b2dcf55232bc95823f3824027e41320b15f6 |     
  aarch64    |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/743443a62350afceae202e2f9dec5f1bfe152e4d | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/2e274fb87a5b33c3f1828e7a4f14b3def26a57d6 | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/41ed974a17b9c10ad6b0fa5a40ce4ab8cc9fcc34 | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/23887d2b8097146e2fd0fc4866d984579a17e209 | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/e12b20cbc582c613cb75b8623f3024e7a885203a | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/27b3c66334b47246d2a936b84029d04d3544d376 | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/81e01265f38b07565868585ee48c7cc93e18e583 | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/d8c4b1b0c8cef680b5b1490b03e7eeed9004ad33 | ORPH
  aarch64    |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/fc741379af4226df44dd21dfbb7e5e429cc7deed | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/c993c27f6677febc3d7d2138062086ce4c514366 | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/819f1c79b5dd5bcbcc2e420bab493b55711ae14f | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/604b6cc33d9f7cd9b0b33f74855727dad8321a71 | ORPH
  aarch64    |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/5d5d9c2388ef3cf95d70008bee58da10a826ce1c | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/23ff1ce543ab47c0707319f87d997b09476c5833 | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/588a7918f59382df37a9e744617e198427e528bd | ORPH
microblazeel |           zstd-1.5.2           | NOK | http://autobuild.buildroot.net/results/5cb46a71a3f5ab355fe571d9799fddda8222959c |     
    arm      |        zziplib-0.13.72         | NOK | http://autobuild.buildroot.net/results/bbf799837c9279f8dbe4fcf7bed43a25c4306d12 |     


Classification of failures by reason for 2022.02.x
--------------------------------------------------

           libfreeimage-3.18.0 | 2 
                       frr-8.1 | 1 
                     host-mono | 1 
                       libuwsc | 1 


Detail of failures for 2022.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/35352518ce2db5bc5002021cd9aa1b98e331bc97 |     
   x86_64    |           host-mono            | TIM | http://autobuild.buildroot.net/results/ee4bef2cbcb10598770a7b882294f34f5b9ebd08 |     
  powerpc    |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/7b6c15bf10b14d3871b5ae61334c04a191d88b04 |     
  riscv32    |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/0c78587a05d770a403dab1390a0c030b20e0844d |     
powerpc64le  |            libuwsc             | TIM | http://autobuild.buildroot.net/results/984e1c4e63eb3e7594519f399a379da15c9a1416 |     


Classification of failures by reason for 2022.05.x
--------------------------------------------------

                       unknown | 4 
host-pahole-73383b3a39afe86... | 3 
                  boost-1.79.0 | 2 
              host-rust-1.60.0 | 2 
                 linux-5.17.13 | 2 
                 zlib-ng-2.0.6 | 2 
/home/buildroot/autobuild/i... | 1 
                arp-scan-1.9.7 | 1 
                    brltty-6.4 | 1 
              containerd-1.6.2 | 1 
                 dash-0.5.11.5 | 1 
         host-gcc-final-10.3.0 | 1 
           libfreeimage-3.18.0 | 1 
                libressl-3.5.2 | 1 
           linux-5.10.115-cip7 | 1 
                   perl-5.34.1 | 1 
               protobuf-3.20.1 | 1 
            quickjs-2021-03-27 | 1 
       shadowsocks-libev-3.3.5 | 1 
              swupdate-2022.05 | 1 
                 uclibc-1.0.41 | 1 
                 wavemon-0.9.4 | 1 
                       xenomai | 1 


Detail of failures for 2022.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/f9af9e26ab4504b14358f628aff1f60b766bd9af |     
  riscv64    |         arp-scan-1.9.7         | NOK | http://autobuild.buildroot.net/results/574005d73d9a524e96acd7aa49bda7554b165a75 |     
    arc      |          boost-1.79.0          | NOK | http://autobuild.buildroot.net/results/2bfa73046d000b7343635ccbef14731cb1f0190b |     
   arceb     |          boost-1.79.0          | NOK | http://autobuild.buildroot.net/results/2e1ac2f9df5cf5f4874daeb81e363a285d315426 |     
 microblaze  |           brltty-6.4           | NOK | http://autobuild.buildroot.net/results/ef931b4ec9bc09eea4be3b6bf33be68c14847ee8 |     
powerpc64le  |        containerd-1.6.2        | NOK | http://autobuild.buildroot.net/results/00f38bf5f1bf4a432df3c812c2049cc53ff3c558 |     
  sparc64    |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/7ecd24acdcdf586906f20e24a7a75b565bc632cd | ORPH
    i686     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/8f1405cc3ff5732a3032a2957419a8569a4682bf |     
   arceb     | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/4ce43e8cd9ffd8d679ec5995c23b9641f80a8f01 |     
   mips64    | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/62a12484ed7ebcfc90872c5ca1520123ba551066 |     
   xtensa    | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/9caf40d699f9958cd1154b2c318bfa5f82002204 |     
  powerpc    |        host-rust-1.60.0        | NOK | http://autobuild.buildroot.net/results/98b93dab0315b703391bfe15360d769dd7fa5daf |     
   mipsel    |        host-rust-1.60.0        | NOK | http://autobuild.buildroot.net/results/304c01495721274b662b47fc0af266d81081ea33 |     
    mips     |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/565ad76e2f261c488c01ada7f6d38da1eb252911 |     
    arm      |         libressl-3.5.2         | NOK | http://autobuild.buildroot.net/results/a7e73bd34be7d0acf14a3cb390df67fe1e366105 | ORPH
   xtensa    |      linux-5.10.115-cip7       | NOK | http://autobuild.buildroot.net/results/d1ee3ede9567fe6abdbe4f3c99cf173b87c19d9b | ORPH
 aarch64_be  |         linux-5.17.13          | NOK | http://autobuild.buildroot.net/results/64d8ecb96dd2083c3c7b508017ca8b8ea5167b8a | ORPH
powerpc64le  |         linux-5.17.13          | NOK | http://autobuild.buildroot.net/results/6a1903d59994253490eb96b6f9f8d044f7c20b98 | ORPH
microblazeel |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/5694857c4a29aa4f101c82a6ce57e9aef9d75305 |     
    arc      |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/8faa7d8500a09e5d8b24ee228459e6dea9d369e9 |     
 microblaze  |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/2c8dafa9d4000144d103ab7d42652fad08d85c75 |     
  aarch64    |    shadowsocks-libev-3.3.5     | NOK | http://autobuild.buildroot.net/results/05812f9d9cdf41ab914726720b770fd9739e2a46 |     
  powerpc    |        swupdate-2022.05        | NOK | http://autobuild.buildroot.net/results/0b7de8a835095a09c7a54938e0cabef335719a54 |     
    arm      |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/ab0d93c4e347a0f59f2bccb9da45d52e62dcb8c5 |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/0b2916ee26d900d2384f117e73cdb4824824ed5f |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/a63429ffefa1494f9233258274c965ed48338bf6 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/679cb412e1072360f4cc5caefc6d9af7a64dcd61 |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/8a2297e4cefedf19424758146f6177b323466fff |     
   mipsel    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/6b728f831531c094a2c9274868f9d6685f6a684b |     
 powerpc64   |            xenomai             | NOK | http://autobuild.buildroot.net/results/a455ba2fe6b1a92b474445134a1e25c52cc654b4 |     
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/b8e01b8f9147f7fa860c03f574e14e2a71ae5c59 | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/b7cf3f6eb0743426c1cf0c377f55ae243fe019e6 | ORPH


Gitlab CI results for 2022-07-16
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
...ystemSystemdRoIfupdown | https://gitlab.com/buildroot.org/buildroot/-/jobs/2702466451  | ORPH 
...ystemSystemdRwIfupdown | https://gitlab.com/buildroot.org/buildroot/-/jobs/2702466467  | ORPH 
   TestIso9660Grub2Hybrid | https://gitlab.com/buildroot.org/buildroot/-/jobs/2702466365  | ORPH 
               TestMender | https://gitlab.com/buildroot.org/buildroot/-/jobs/2702466698  | ORPH 
       TestPythonPy3Flask | https://gitlab.com/buildroot.org/buildroot/-/jobs/2702466842  | ORPH 
...honPy3FlaskExpectsJson | https://gitlab.com/buildroot.org/buildroot/-/jobs/2702466844  | ORPH 



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
