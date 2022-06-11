Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94E38C433EF
	for <buildroot@archiver.kernel.org>; Sat, 11 Jun 2022 05:33:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DD86B84444;
	Sat, 11 Jun 2022 05:33:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sUyjRR4xz3ss; Sat, 11 Jun 2022 05:33:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C8F1F84375;
	Sat, 11 Jun 2022 05:33:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4B1E11BF84C
 for <buildroot@lists.busybox.net>; Sat, 11 Jun 2022 05:33:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 22967402DC
 for <buildroot@lists.busybox.net>; Sat, 11 Jun 2022 05:33:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QV656ZCNl3gG for <buildroot@lists.busybox.net>;
 Sat, 11 Jun 2022 05:32:57 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3814E40104
 for <buildroot@buildroot.org>; Sat, 11 Jun 2022 05:32:56 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 0F82B20010
 for <buildroot@buildroot.org>; Sat, 11 Jun 2022 05:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1654925574; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=PGNRs0z01r5N07OoAEfrWcxHPPLhbhC5Ly+LH3FxljU=;
 b=b2cSNYL/IFHvJ/IAvqSqBXSTrBG7C0RAauPiAXOLzE62BqysnwXu2jpLhWBYry5/Dk4soE
 SYeeHt7LgFYVqf99LEDvKUr7IfKJkv1lJkYBhsTd93frNZ2/b2nwQYTMCTfO94UNI8Yqmi
 BTIN02rgMFGoAkw3SMpIu7Gz0tTY4uDSAxCO8RpgW9eW2kG4OO7nqZHT9xO9jMNZHypWqG
 4cUzs+Ta+G7a4ute8WHcFAgd5D7zwAzmH0GrX85ylpd25qaKuRkHuo28PtRFESE8U1oxHa
 Vx1Pfp1kw5PVKoPbwsz5/N5ad8FEOgzCKA+RT6khQKrCsEZJsK8frNf6olhK2A==
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sat, 11 Jun 2022 05:32:53 -0000
Message-Id: <20220611053300.22967402DC@smtp2.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-06-10
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

Autobuild statistics for 2022-06-10
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  | 15  |  3  |  0  | 18  |
  2022.05.x  | 20  | 19  |  0  | 39  |
    master   | 155 | 177 |  0  | 332 |

Classification of failures by reason for master
-----------------------------------------------

                 linux-5.17.13 | 10
                host-go-1.18.3 | 8 
                   perl-5.34.1 | 7 
                       unknown | 7 
           libfreeimage-3.18.0 | 6 
                 uclibc-1.0.41 | 6 
               libglib2-2.70.4 | 5 
             libopenssl-1.1.1o | 4 
               openpgm-5-3-128 | 4 
                 zlib-ng-2.0.6 | 4 
                busybox-1.35.0 | 3 
                 dash-0.5.11.5 | 3 
glibc-2.35-96-g2c4fc8e5ca74... | 3 
  gobject-introspection-1.70.0 | 3 
host-pahole-73383b3a39afe86... | 3 
              host-rust-1.60.0 | 3 
                libressl-3.5.3 | 3 
           libwebsockets-4.3.1 | 3 
                  ntp-4.2.8p15 | 3 
               protobuf-3.20.1 | 3 
            quickjs-2021-03-27 | 3 
                     refpolicy | 3 
                   uacme-1.7.1 | 3 
                gnu-efi-3.0.10 | 2 
         host-gcc-final-10.3.0 | 2 
       linux-5.10.109-cip5-rt4 | 2 
                 pixman-0.40.0 | 2 
            python-ujson-5.2.0 | 2 
              swupdate-2022.05 | 2 
ulog-0389d243352255f6182326... | 2 
                 wolfssl-5.2.0 | 2 
                    zstd-1.5.2 | 2 
/home/buildroot/autobuild/i... | 1 
                  acpid-2.0.33 | 1 
              alsa-lib-1.2.6.1 | 1 
                 apache-2.4.53 | 1 
                     aufs-util | 1 
                    bat-0.19.0 | 1 
                      bmon-4.0 | 1 
                    brltty-6.4 | 1 
              containerd-1.6.2 | 1 
dahdi-linux-5c840cf43838e06... | 1 
                 dmalloc-5.6.5 | 1 
            ecryptfs-utils-111 | 1 
                elfutils-0.186 | 1 
                  exempi-2.6.1 | 1 
                  ffmpeg-4.4.2 | 1 
                   flann-1.9.1 | 1 
fs/ubi/ubi.mk:51: /home/aut... | 1 
fs/ubi/ubi.mk:51: /home/aut... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /nvme... | 1 
fs/ubifs/ubifs.mk:49: /nvme... | 1 
                  gtest-1.11.0 | 1 
             host-cmake-3.22.3 | 1 
              host-delve-1.8.0 | 1 
         host-gcc-final-11.3.0 | 1 
         host-protobuf-c-1.4.0 | 1 
            igh-ethercat-1.5.2 | 1 
              jpeg-turbo-2.1.3 | 1 
                lesstif-0.95.2 | 1 
              libgcrypt-1.10.1 | 1 
                    liblo-0.31 | 1 
                libmdbx-0.11.7 | 1 
          libmicrohttpd-0.9.75 | 1 
   libtorrent-rasterbar-1.2.15 | 1 
           linux-5.10.115-cip7 | 1 
            linux-fusion-9.0.3 | 1 
        ltp-testsuite-20220121 | 1 
                    lv2-1.18.2 | 1 
            makedumpfile-1.7.0 | 1 
            mesa3d-demos-8.4.0 | 1 
         multipath-tools-0.8.9 | 1 
                   ncurses-6.1 | 1 
                  ndisc6-1.0.5 | 1 
                  nginx-1.20.1 | 1 
                nodejs-16.15.0 | 1 
            ocf-linux-20120127 | 1 
                paxtest-0.9.15 | 1 
                     pv-1.6.20 | 1 
qt-webkit-kiosk-a7720e50f2b... | 1 
       shadowsocks-libev-3.3.5 | 1 
              skalibs-2.10.0.3 | 1 
                tinifier-3.4.0 | 1 
    toolchain-external-bootlin | 1 
                 wavemon-0.9.4 | 1 
                       xenomai | 1 
                xenomai-custom | 1 
               xfsprogs-5.14.2 | 1 
                  zchunk-1.2.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    mips     | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/717048b6b35225d83659d82ab4d8c37cf585f845 |     
  mips64el   |          acpid-2.0.33          | NOK | http://autobuild.buildroot.net/results/90a79794dba1c96a317a43555934b9818ee6138b | ORPH
    m68k     |        alsa-lib-1.2.6.1        | NOK | http://autobuild.buildroot.net/results/7656228831244f5c25f81065d430ea5bfb0b9d6e |     
    sh4      |         apache-2.4.53          | NOK | http://autobuild.buildroot.net/results/dd69e665e51ce6b30e303a4d4670e9edbb159aea |     
   sparc     |           aufs-util            | NOK | http://autobuild.buildroot.net/results/8f5eadc8ff4bfc31a7e1443c96aa9e8a15c33ba2 |     
    arm      |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/7165f32b1dbe411bb7d9697777b4837b71b0507b |     
    m68k     |            bmon-4.0            | NOK | http://autobuild.buildroot.net/results/7b06b3ddd9b8e56b5ba71945d52bfe52a8c80320 | ORPH
    mips     |           brltty-6.4           | NOK | http://autobuild.buildroot.net/results/2a67e32075371540c1a25b547fffe377ccc00084 |     
  riscv64    |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/a9fe137776f97df8612ed53b76b89e5c8e4d085d | ORPH
  riscv64    |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/b2cadaa46a839cf376539d7fd498d102be69f25c | ORPH
    m68k     |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/26d3bfb3c543b6076d38227f37f1e517814d906f | ORPH
powerpc64le  |        containerd-1.6.2        | NOK | http://autobuild.buildroot.net/results/e9092cf8b08b7c06a15423ca069ac1ca645e2099 |     
    or1k     | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/b598d1484559eec063efb4a6cc9ab628ca6a25bd |     
   sh4eb     |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/13654ab6370a9cbb3dd044a37fb6c7c8132d9936 | ORPH
  aarch64    |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/a8507abd7d3a28177dc74b692395e8c06bc03112 | ORPH
    sh4a     |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/19fbd7ceca83950531409129807a5f6d1586423a | ORPH
   mipsel    |         dmalloc-5.6.5          | NOK | http://autobuild.buildroot.net/results/2164dac43e2607a3570e8f98957a70f579d06cd3 | ORPH
  powerpc    |       ecryptfs-utils-111       | NOK | http://autobuild.buildroot.net/results/a07b2c633a4b3ca9c25290d2b8f8e7f79df5214b |     
    arc      |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/1e1130ed306c120f3cf5f28e6119b83b6e874151 | ORPH
    arm      |          exempi-2.6.1          | NOK | http://autobuild.buildroot.net/results/b0feacdb62f9440cb1a07bb596969890bfa7710d |     
   mips64    |          ffmpeg-4.4.2          | NOK | http://autobuild.buildroot.net/results/4b0f23f73e625d0798ad7e7f8c9f63b8f391a036 |     
  mips64el   |          flann-1.9.1           | NOK | http://autobuild.buildroot.net/results/3784d60111553095729b03733a91184978d3e7df |     
  mips64el   | fs/ubi/ubi.mk:51: /home/aut... | NOK | http://autobuild.buildroot.net/results/98c36c76b5fcc9a57df461fff4e650da92d1df18 |     
    mips     | fs/ubi/ubi.mk:51: /home/aut... | NOK | http://autobuild.buildroot.net/results/2f0bfb026237d8f47f6e2f41586ea5376698c454 |     
   mips64    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/686fc49dd7a16e774b0c596364ed8d15a02d56c6 |     
   s390x     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/3999fb58834a33a593136754eedc75a1b69542cc |     
    i586     | fs/ubifs/ubifs.mk:49: /nvme... | NOK | http://autobuild.buildroot.net/results/373e3837e3675e5fabd7ebb8e2503f2a557398ee |     
   arceb     | fs/ubifs/ubifs.mk:49: /nvme... | NOK | http://autobuild.buildroot.net/results/1aa645736be990d64e7062892aec1a50c5cc8de4 |     
   arceb     | glibc-2.35-96-g2c4fc8e5ca74... | NOK | http://autobuild.buildroot.net/results/bfc3df460d34d80c8edc28195a2ec7ab4933837a |     
  riscv32    | glibc-2.35-96-g2c4fc8e5ca74... | NOK | http://autobuild.buildroot.net/results/5fa8e4477bdc3473fcb57c54b06dfa6239bc3336 |     
   nios2     | glibc-2.35-96-g2c4fc8e5ca74... | NOK | http://autobuild.buildroot.net/results/506d7c5b495ef0f436455168d8f5bc491916eeb7 |     
  mips64el   |         gnu-efi-3.0.10         | NOK | http://autobuild.buildroot.net/results/b4086046ab5f74521449fa2f9db6db850d872cec |     
  mips64el   |         gnu-efi-3.0.10         | NOK | http://autobuild.buildroot.net/results/b9f14e3ba25022c0ed69e0848b9a32cba26a487e |     
 microblaze  |  gobject-introspection-1.70.0  | NOK | http://autobuild.buildroot.net/results/47a29a0500ab3f224b1e4b6899a18b3a682b4779 | ORPH
   nios2     |  gobject-introspection-1.70.0  | NOK | http://autobuild.buildroot.net/results/3fc1f20ea522b5e05e8dc92cf3944659f55b53a6 | ORPH
    i686     |  gobject-introspection-1.70.0  | NOK | http://autobuild.buildroot.net/results/fdb166193668329b91b844c3a82ca3db8a9cb8d8 | ORPH
  aarch64    |          gtest-1.11.0          | NOK | http://autobuild.buildroot.net/results/1723705cb7aea5f6fcc7e6722d866ed3bd098115 |     
   sparc     |       host-cmake-3.22.3        | NOK | http://autobuild.buildroot.net/results/7c558006464cfa47ccd9e96483405cfce372930c |     
    arm      |        host-delve-1.8.0        | NOK | http://autobuild.buildroot.net/results/715797ef6a8b624136eb7c3d3a18a6628d92d540 |     
  riscv32    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/07f01eac221788b6d89b92ce3683329bf5c3afc1 |     
  riscv32    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/13d80fd556aa8c5fc8bbdf168229b1703b57fce1 |     
   x86_64    |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/6551e253809bf9ab531bc8b0ce60ad3e6ffe708a |     
powerpc64le  |         host-go-1.18.3         | NOK | http://autobuild.buildroot.net/results/6ff866ce3645e75ef60dc725bc64eaa34246ded8 |     
    i686     |         host-go-1.18.3         | NOK | http://autobuild.buildroot.net/results/67716129db2f5673303e241f4aa5b8d0e1b0ee85 |     
   mips64    |         host-go-1.18.3         | NOK | http://autobuild.buildroot.net/results/e3194bd966a3c3e9ca340114f032555cae2ed182 |     
   mips64    |         host-go-1.18.3         | NOK | http://autobuild.buildroot.net/results/2f0879f0f779f7d8a019cb9966ea91dba95a0466 |     
  aarch64    |         host-go-1.18.3         | NOK | http://autobuild.buildroot.net/results/99e11733b92ed402323d3c4ff5d94becc0b7e9a2 |     
    i686     |         host-go-1.18.3         | NOK | http://autobuild.buildroot.net/results/8ef34ac69122e0c195516808c97591cd6fbbccb7 |     
   mips64    |         host-go-1.18.3         | NOK | http://autobuild.buildroot.net/results/fa8caa4850119ce6371af5c711a0db85aed500d4 |     
  aarch64    |         host-go-1.18.3         | NOK | http://autobuild.buildroot.net/results/76a5c9c4d980a451419c43455258d5aa9646dbc9 |     
  mips64el   | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/efb727579364c098e84d1b0daf25d083b78e9abe |     
 aarch64_be  | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/890904fbabdbb91133dde59a5e313d4a8d2b5784 |     
   arceb     | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/8b311de6e2ee306c482c97cdd2a2dfa89065dc98 |     
   nios2     |     host-protobuf-c-1.4.0      | NOK | http://autobuild.buildroot.net/results/a20d14a1257c7d7bbfb1a19fcce59cc64a0a5f8e |     
  sparc64    |        host-rust-1.60.0        | NOK | http://autobuild.buildroot.net/results/4dc68787e51ada26491d9280ab94d4b69a85885b |     
 powerpc64   |        host-rust-1.60.0        | NOK | http://autobuild.buildroot.net/results/421c1aa1f1145362212bfac4e14140d662021cfa |     
    i686     |        host-rust-1.60.0        | NOK | http://autobuild.buildroot.net/results/1bb6645675b10d3652ac86d039bf7c625c723ae9 |     
    or1k     |       igh-ethercat-1.5.2       | NOK | http://autobuild.buildroot.net/results/4b95c4e07e64a60d4ac23b7cf49045f43102d2f4 |     
powerpc64le  |        jpeg-turbo-2.1.3        | NOK | http://autobuild.buildroot.net/results/c7176534f3eb08ad0812d9366cc08e536e6ca42e |     
   sh4aeb    |         lesstif-0.95.2         | NOK | http://autobuild.buildroot.net/results/a1cd7fbcdd0ec78d73aca4cd749c81469812d993 | ORPH
   x86_64    |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/b3d20a55d63ba9dcd4b1a9f8ea4c20a576de03c0 |     
  mips64el   |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/9208fda5f907f68f3f68d05f4513414db53a8671 |     
    i686     |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/eb866703900800f341581c0b67ca57d1c9934198 |     
   sparc     |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/7847816c6a620e52c9b607c81d7f4898e85be978 |     
    arm      |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/93756cb882a200f9adf9d7cac0a89c50a4572bdc |     
    arm      |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/cd0257bff4588abc01828f011ab577dc15cc1cff |     
    arm      |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/2532a7b72dc93e3f1efa22df9af98be4c33ebc57 | ORPH
    arc      |        libglib2-2.70.4         | NOK | http://autobuild.buildroot.net/results/7dbafd97b0ac90f82a6b0fd542616872a0725968 |     
   arceb     |        libglib2-2.70.4         | NOK | http://autobuild.buildroot.net/results/456383cdf28329d2323f0565c9695207f9604305 |     
    arc      |        libglib2-2.70.4         | NOK | http://autobuild.buildroot.net/results/a4d463675db67e8646f059eaeb18b9e73ab0bb6d |     
    arc      |        libglib2-2.70.4         | NOK | http://autobuild.buildroot.net/results/d1d5b3e3b1ab48bea92ac94063c2b9c763273cdc |     
   arceb     |        libglib2-2.70.4         | NOK | http://autobuild.buildroot.net/results/c2c7114bd565f12a2cba884e898ad5ca83bb9f42 |     
   s390x     |           liblo-0.31           | NOK | http://autobuild.buildroot.net/results/07cb255d31bd101812d695ef6769790fc539be0e | ORPH
microblazeel |         libmdbx-0.11.7         | NOK | http://autobuild.buildroot.net/results/af8b7084b79f50b84ef52724a9c13048870cb65c |     
   xtensa    |      libmicrohttpd-0.9.75      | NOK | http://autobuild.buildroot.net/results/a2482ac25b1009bacc050764a5196b2ce4cb07f0 |     
  aarch64    |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/8ac91df3f04091002c9bb3d1358c5e9329314f09 |     
    arc      |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/04c207def456b450b79f3f8c343df59072048570 |     
   xtensa    |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/7ebfa182ba5bacd3a7c3fb8b0598e3b9749b2890 |     
   sparc     |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/133a2df6a4f66b6b32d4cad1c777751bcc269429 |     
   sparc     |         libressl-3.5.3         | NOK | http://autobuild.buildroot.net/results/94872390e66c5444f23b00a71b387e124e6036f7 | ORPH
   sh4eb     |         libressl-3.5.3         | NOK | http://autobuild.buildroot.net/results/5b2b38eb9812c027e49fff4dee561948e363147d | ORPH
  mips64el   |         libressl-3.5.3         | NOK | http://autobuild.buildroot.net/results/b817b4192d8c08ba2a391b12d879fb0ddfed4e47 | ORPH
   mipsel    |  libtorrent-rasterbar-1.2.15   | NOK | http://autobuild.buildroot.net/results/4ae7b25fe3e7f22deb80d9139c1a93d3f1f1257f |     
  mips64el   |      libwebsockets-4.3.1       | NOK | http://autobuild.buildroot.net/results/cb31162a6bfda87458b3de62f0e2e2c83a4abc89 |     
    arm      |      libwebsockets-4.3.1       | NOK | http://autobuild.buildroot.net/results/c0ca2e60664449c39a0a1b2470a8cf5a459875e7 |     
   mips64    |      libwebsockets-4.3.1       | NOK | http://autobuild.buildroot.net/results/ee526af72cb95dd60be78e8c511065951001c25d |     
    sh4a     |    linux-5.10.109-cip5-rt4     | NOK | http://autobuild.buildroot.net/results/0fe108f9e6af405d46ba8b1812965863500d936d | ORPH
    mips     |    linux-5.10.109-cip5-rt4     | NOK | http://autobuild.buildroot.net/results/ff0a2076117435a4cb55345cdd2581102c817920 | ORPH
   x86_64    |      linux-5.10.115-cip7       | NOK | http://autobuild.buildroot.net/results/710be6b56783f79c7140edc737969c0d46da4324 | ORPH
  powerpc    |         linux-5.17.13          | NOK | http://autobuild.buildroot.net/results/445c3ca94ad3cd50a9f35f0c80650d88987d6ad9 | ORPH
  mips64el   |         linux-5.17.13          | NOK | http://autobuild.buildroot.net/results/6b6cc962f7fe73ef8817a1ac9c888eb8f33d26a5 | ORPH
   x86_64    |         linux-5.17.13          | NOK | http://autobuild.buildroot.net/results/4a6802f0e708c08c7b943e776ac61643b4610474 | ORPH
  mips64el   |         linux-5.17.13          | NOK | http://autobuild.buildroot.net/results/7879a2efe2d2ef5cd6d9976148eb4243898ab721 | ORPH
  powerpc    |         linux-5.17.13          | NOK | http://autobuild.buildroot.net/results/269c9b32f64d2a89754ac964bb53b6d5c17a7da0 | ORPH
    mips     |         linux-5.17.13          | NOK | http://autobuild.buildroot.net/results/de1c9f1e3cfaf6bf33f86ccb8e5761c932d4cef5 | ORPH
    mips     |         linux-5.17.13          | NOK | http://autobuild.buildroot.net/results/19463a401b4195ceb3190779939c2c7388d122df | ORPH
   mipsel    |         linux-5.17.13          | NOK | http://autobuild.buildroot.net/results/cb9c9ddc752974fe17c32bc9bca74eed6396337c | ORPH
   arceb     |         linux-5.17.13          | NOK | http://autobuild.buildroot.net/results/b0e208bb2dabaec9ee224c90cc1b003726c6183e | ORPH
    m68k     |         linux-5.17.13          | NOK | http://autobuild.buildroot.net/results/a5694fd83a96c9403563d8852f3286cd1e872efc | ORPH
   arceb     |       linux-fusion-9.0.3       | NOK | http://autobuild.buildroot.net/results/2c3e100fc82a0295d2bc505b655ae6e50b89f127 | ORPH
  mips64el   |     ltp-testsuite-20220121     | NOK | http://autobuild.buildroot.net/results/c62a83ab2610bb69dd56300f570a59f7b87f810a |     
   x86_64    |           lv2-1.18.2           | NOK | http://autobuild.buildroot.net/results/436d41dd4ba191e33b8383859b4c1b77f79f6527 |     
 aarch64_be  |       makedumpfile-1.7.0       | NOK | http://autobuild.buildroot.net/results/bc959e8ddbe40d6f17f063893a0c697deebbee71 |     
  mips64el   |       mesa3d-demos-8.4.0       | NOK | http://autobuild.buildroot.net/results/3dcd265228b604f421b4cebefafa9bd6749d19a8 |     
  sparc64    |     multipath-tools-0.8.9      | NOK | http://autobuild.buildroot.net/results/bf077528ab145b15578845d505596337200521f7 |     
  riscv64    |          ncurses-6.1           | NOK | http://autobuild.buildroot.net/results/454ced462e0b0942525c8ea782a3be2af68ae813 | ORPH
    arm      |          ndisc6-1.0.5          | NOK | http://autobuild.buildroot.net/results/35cfa5370ac0a6f4e2e30ed472b1bd1dd763bf09 | ORPH
    arc      |          nginx-1.20.1          | NOK | http://autobuild.buildroot.net/results/d379a921336701e403186ab881f750a60e578987 |     
   x86_64    |         nodejs-16.15.0         | NOK | http://autobuild.buildroot.net/results/e87980774988b23aae6a5e879fa92db09a50105c |     
  riscv64    |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/17ab76037d6ca2d75031cbad46ade4aff243930b | ORPH
  riscv64    |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/ab8c9a46263f5619664004e968ad5972bd4aefff | ORPH
  riscv64    |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/e040ee5a2d9e74a2adb93ce009f6319411a75097 | ORPH
    or1k     |       ocf-linux-20120127       | NOK | http://autobuild.buildroot.net/results/90ca9f9287611e2664ace9b847e88a42895eeadd | ORPH
    m68k     |        openpgm-5-3-128         | NOK | http://autobuild.buildroot.net/results/1347bef047c7031632d816efd9fad0c02bf1de6b |     
   sh4eb     |        openpgm-5-3-128         | NOK | http://autobuild.buildroot.net/results/7203676b77eb97abf419cd09d2c1c073addc9c30 |     
  sparc64    |        openpgm-5-3-128         | NOK | http://autobuild.buildroot.net/results/e7a37128da782e4cf9f9d579340f103919384543 |     
powerpc64le  |        openpgm-5-3-128         | NOK | http://autobuild.buildroot.net/results/5c5dbd9254e84e912b2eaafcc572bd6a5b1b12f3 |     
 microblaze  |         paxtest-0.9.15         | NOK | http://autobuild.buildroot.net/results/9714e817cb8bf09f3b93c653454525dbd06f3090 |     
   mipsel    |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/42e7884f5fc9cc083f33e154b88efbe9db063e27 |     
 aarch64_be  |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/3ee18f914a316c33dfc8a62277cdb76b375157ff |     
    mips     |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/125f2780667288bb39d071ca813a0d7de74f7a49 |     
   mipsel    |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/90f84badd4123ab3b499d3019faf129446356d0a |     
    mips     |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/fa37561c860c0dee6c5c0f01647808d5246f393b |     
   arceb     |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/280678a18ae5c0d869c43ee08f0a4f0384d3d401 |     
    or1k     |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/1587440e7f2999db1b40376cce942ae737562049 |     
powerpc64le  |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/bb9f8cd482fd34eda06b9d2848059b4a4cb215fc |     
powerpc64le  |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/5a35823590a5c77624dcf8cb0915fc90e70702b4 |     
    or1k     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/9a433a5eff374022a14288b54177e6d6eb5a6698 |     
   nios2     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/67bbb4453c67c75609e4739aa5be847bcc815196 |     
    or1k     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/460413d06eed0625e117ac4f7b744d40f276c0b9 |     
   armeb     |           pv-1.6.20            | NOK | http://autobuild.buildroot.net/results/bac39dc594aae0b72029ce56c6d9210c81266e48 | ORPH
    or1k     |       python-ujson-5.2.0       | NOK | http://autobuild.buildroot.net/results/e9811d68a18075891705e7e5c457e51e9c47aaf9 |     
    arc      |       python-ujson-5.2.0       | NOK | http://autobuild.buildroot.net/results/d1e27c4f1bc083dc226ac76dde8c9f5212882733 |     
   x86_64    | qt-webkit-kiosk-a7720e50f2b... | NOK | http://autobuild.buildroot.net/results/75d715a4bc0cd54b0e2fab2759c94cc95e159d69 |     
   sh4aeb    |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/0f8b1a34e16f5b24126bfe24ebccbc534caaedcb |     
    or1k     |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/5b51180eb7291380db4dc4543ebe1d7b10d61283 |     
   sh4aeb    |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/c4aebc5c325d1a14246a3fcd966c636091d69be4 |     
    mips     |           refpolicy            | NOK | http://autobuild.buildroot.net/results/fe74df942619e52b9584fcce12b64a280c76f0cd |     
    sh4      |           refpolicy            | NOK | http://autobuild.buildroot.net/results/f48e3d6312b3c34de78ea1f21aa02e963c69302d |     
  aarch64    |           refpolicy            | NOK | http://autobuild.buildroot.net/results/3340870b11775be1185e40ea3c65caa2479f1946 |     
 aarch64_be  |    shadowsocks-libev-3.3.5     | NOK | http://autobuild.buildroot.net/results/d61280c61c4bc05e62135e3da68f8e25bef0cbc1 |     
    or1k     |        skalibs-2.10.0.3        | NOK | http://autobuild.buildroot.net/results/c0c80124a3c7232210a779317d13811303b12133 |     
  aarch64    |        swupdate-2022.05        | NOK | http://autobuild.buildroot.net/results/9e249e8304ffd426a01e8de1eb179d9a46078a40 |     
   mipsel    |        swupdate-2022.05        | NOK | http://autobuild.buildroot.net/results/11f80121c74b9b54d6a6ee8ec93abe6de3bac91b |     
  aarch64    |         tinifier-3.4.0         | NOK | http://autobuild.buildroot.net/results/9a6c78c409e63c4eb7a40a35ef23f5be73aaa361 |     
   mips64    |   toolchain-external-bootlin   | NOK | http://autobuild.buildroot.net/results/dac64a6c51ea8c5573a95e98719fd8e206d9c33b |     
    or1k     |          uacme-1.7.1           | NOK | http://autobuild.buildroot.net/results/0b872b77f99858a776befec46bb5640656e9f9fa |     
microblazeel |          uacme-1.7.1           | NOK | http://autobuild.buildroot.net/results/eb448910d0038ef636ad3cb95c0a889b9710730b |     
   sparc     |          uacme-1.7.1           | NOK | http://autobuild.buildroot.net/results/a64b6e616a9362c26ce54bc3cfffcf27819e999f |     
  powerpc    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/afa1f0cbe4be867f3f68ecd4d48eafc816998f3f |     
  riscv64    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/fe53b64164c1ec583cf8c1d9e231fa5f332271f1 |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/2096d8aeccd5141c11d71fd3b06776f82f7cfcee |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/1b6eefe8280742a948199ee0c8ed1acd58ae1f33 |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/97a7db2080d16ed83fefb248c47508befb44b6dc |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/869181695ebb960af8f9855fb2f13ceae593b334 |     
   s390x     | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/3b6977bbd2523fb6244d797c0061ba2c594e6abf |     
  riscv32    | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/00447f5e1563f46e04810119caec378aee829567 |     
  sparc64    |            unknown             | NOK | http://autobuild.buildroot.net/results/728286a346a025d40bae4140c3e54ae44c97a765 |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.net/results/a3c713eb8b6c27790433900a8200c9f3aee3f5de |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/6ee9231ec6c009dcf4640377e6e292c3ec2446dc |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/433e5720502a2b3b4689b2a25fc601204bb22564 |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/67a2fa4aabd6177e3b1d22b20e23f0a18a60ac55 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/3315a290e99f745397ad532d7142a8fc1b650330 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/e33701ac5df6b2f236e1b36b5ac3d64efa8f3097 |     
    arc      |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/a82426029ef3a1c4b731e1bf94da0f504bf275fc |     
    arm      |         wolfssl-5.2.0          | NOK | http://autobuild.buildroot.net/results/8f5dbd9af289a498188c2b36eada58265460c830 |     
   armeb     |         wolfssl-5.2.0          | NOK | http://autobuild.buildroot.net/results/be656d3a08fffd2e09a5c9d7f2854d6bb7599f46 |     
    mips     |            xenomai             | NOK | http://autobuild.buildroot.net/results/4832aa93e5319eba741e5fd11b6429a0890d9850 |     
 powerpc64   |         xenomai-custom         | NOK | http://autobuild.buildroot.net/results/d2be6ac814daed268830b2eeef7f7ee8c8d597a2 |     
    mips     |        xfsprogs-5.14.2         | NOK | http://autobuild.buildroot.net/results/c34c1ef47d6fac5a5237326afee99c53cc046a89 | ORPH
 aarch64_be  |          zchunk-1.2.2          | NOK | http://autobuild.buildroot.net/results/481d1979920daaecac48dec763151e124651740f |     
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/98f3001df120e02980de336d8476342d040d5aac | ORPH
  aarch64    |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/d684ccfb32ed4dd8a0bf6287d9a7529135c63cf4 | ORPH
  aarch64    |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/42397733ce78ba5673dd167544276a3310ce6f21 | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/5beceecf075f171646a029698a8911b0a1e7d7ec | ORPH
microblazeel |           zstd-1.5.2           | NOK | http://autobuild.buildroot.net/results/f99214cd772fd28d0f31d59fb7013c0b5087708d |     
microblazeel |           zstd-1.5.2           | NOK | http://autobuild.buildroot.net/results/681f696936400acf35bbd12244007dad4e058919 |     


Classification of failures by reason for 2022.02.x
--------------------------------------------------

                       frr-8.1 | 2 
           libfreeimage-3.18.0 | 1 


Detail of failures for 2022.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/038c4d1171aba0589b6a1de583a608e5a93f7c3d |     
  mips64el   |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/0d552a34134fb5e5ab1d188f31c07f1448b0fb9d |     
   nios2     |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/e6d5889d9a531963b2f2ba72cf06484044cc4651 |     


Classification of failures by reason for 2022.05.x
--------------------------------------------------

                     refpolicy | 3 
                  exempi-2.6.1 | 1 
                     frr-8.2.2 | 1 
              host-rust-1.60.0 | 1 
            igh-ethercat-1.5.2 | 1 
           libfreeimage-3.18.0 | 1 
                libzlib-1.2.12 | 1 
                 linux-5.17.13 | 1 
make: *** wait: No child pr... | 1 
          moby-buildkit-0.10.0 | 1 
                mongodb-4.2.18 | 1 
                    mpv-0.33.1 | 1 
                    putty-0.76 | 1 
            python-ujson-5.2.0 | 1 
                 uclibc-1.0.41 | 1 
                       unknown | 1 
               valgrind-3.19.0 | 1 


Detail of failures for 2022.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |          exempi-2.6.1          | NOK | http://autobuild.buildroot.net/results/13efc02b16da56c1655f84cd722c544943dfaebe |     
  mips64el   |           frr-8.2.2            | NOK | http://autobuild.buildroot.net/results/da63c2ec3fd53e9b00f235dd77a814856db26e2f |     
    i686     |        host-rust-1.60.0        | NOK | http://autobuild.buildroot.net/results/e4417172261a43b31d6a4c8f6c4d900921ecb21a |     
    i586     |       igh-ethercat-1.5.2       | NOK | http://autobuild.buildroot.net/results/1d2bf7ae8395452306f297e13351847a753b5eed |     
  riscv32    |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/c2dc873a8ae911f6b352403cd9d638be86316a1b |     
    m68k     |         libzlib-1.2.12         | NOK | http://autobuild.buildroot.net/results/173814022291521d75b0d6f4a65d44c9629f78f8 | ORPH
    m68k     |         linux-5.17.13          | NOK | http://autobuild.buildroot.net/results/5bc14ec5480130a12b09ce647d7c96fd105b51b9 | ORPH
    arc      | make: *** wait: No child pr... | NOK | http://autobuild.buildroot.net/results/4890264f6eea2cd143a397dd45fd38c112379607 |     
powerpc64le  |      moby-buildkit-0.10.0      | NOK | http://autobuild.buildroot.net/results/c2c86c009be300ddb824633199b259151b4ec116 |     
  aarch64    |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/da4882c042a46568701029a724f41cded3842644 |     
   sh4aeb    |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/6f163d54225a834fcba601facfa0c7a522280383 |     
  aarch64    |           putty-0.76           | NOK | http://autobuild.buildroot.net/results/76e8cc7f42d583bf9d2d29e67b7aac102f80c027 |     
microblazeel |       python-ujson-5.2.0       | NOK | http://autobuild.buildroot.net/results/a9b332c42eb1f955453b73cd3587bc84f421dcfb |     
    mips     |           refpolicy            | NOK | http://autobuild.buildroot.net/results/86d8eed645b9d31bdfb304519bedb07e397d3933 |     
   mipsel    |           refpolicy            | NOK | http://autobuild.buildroot.net/results/9951e4484f9af0d5de242eb7d94f03b83dcece9d |     
 aarch64_be  |           refpolicy            | NOK | http://autobuild.buildroot.net/results/c77418e6d937608fd9db7c0327b7113163526717 |     
    arc      |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/4987548d1042816d64e233a9ac26b393aa6fa031 |     
    m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/1f4b246f4c798b3edf3a0805f189eeb2d88e0cc5 |     
  powerpc    |        valgrind-3.19.0         | NOK | http://autobuild.buildroot.net/results/258efa739f11710948db9e2665b4570a3ff152f1 | ORPH


Gitlab CI results for 2022-06-10
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
                amarula_a64_relic | https://gitlab.com/buildroot.org/buildroot/-/jobs/2566635792  |      
                         arm_juno | https://gitlab.com/buildroot.org/buildroot/-/jobs/2566635896  |      
                      bananapi_m1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2566635962  |      
                 bananapi_m1_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/2566635964  |      
                 bananapi_m2_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/2566635967  |      
                     bananapi_m64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2566635972  |      
                        bananapro | https://gitlab.com/buildroot.org/buildroot/-/jobs/2566635974  |      
                     csky_gx6605s | https://gitlab.com/buildroot.org/buildroot/-/jobs/2566635993  |      
             freescale_imx6ullevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/2566636016  |      
              freescale_imx8mqevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/2566636021  |      
              freescale_imx8qmmek | https://gitlab.com/buildroot.org/buildroot/-/jobs/2566636022  |      
           friendlyarm_nanopi_a64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2566636029  |      
            friendlyarm_nanopi_m1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2566636030  | ORPH 
       friendlyarm_nanopi_m1_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/2566636031  | ORPH 
           friendlyarm_nanopi_neo | https://gitlab.com/buildroot.org/buildroot/-/jobs/2566636039  |      
          friendlyarm_nanopi_neo2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2566636035  |      
     friendlyarm_nanopi_neo_plus2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2566636041  |      
            friendlyarm_nanopi_r1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2566636043  |      
                          galileo | https://gitlab.com/buildroot.org/buildroot/-/jobs/2566636046  |      
                       imx8mmpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/2566636062  |      
                        imx8mpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/2566636063  |      
               kontron_pitx_imx8m | https://gitlab.com/buildroot.org/buildroot/-/jobs/2566636069  |      
                    licheepi_zero | https://gitlab.com/buildroot.org/buildroot/-/jobs/2566636075  |      
        minnowboard_max-graphical | https://gitlab.com/buildroot.org/buildroot/-/jobs/2566636092  |      
              octavo_osd32mp1_brk | https://gitlab.com/buildroot.org/buildroot/-/jobs/2566636113  |      
                orangepi_one_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/2566636141  |      
                     orangepi_pc2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2566636143  |      
                    orangepi_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/2566636148  | ORPH 
                   orangepi_prime | https://gitlab.com/buildroot.org/buildroot/-/jobs/2566636149  |      
                     orangepi_win | https://gitlab.com/buildroot.org/buildroot/-/jobs/2566636156  |      
               orangepi_zero_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/2566636161  |      
                           pine64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2566636167  |      
                    pine64_sopine | https://gitlab.com/buildroot.org/buildroot/-/jobs/2566636168  |      
                qemu_m68k_mcf5208 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2566636175  |      
           qemu_xtensa_lx60_nommu | https://gitlab.com/buildroot.org/buildroot/-/jobs/2566636210  |      
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/2566636221  |      
                            warp7 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2566636267  |      



-- 
http://autobuild.buildroot.net

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

