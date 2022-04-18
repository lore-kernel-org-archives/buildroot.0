Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73161C433F5
	for <buildroot@archiver.kernel.org>; Mon, 18 Apr 2022 04:42:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CA54183F7A;
	Mon, 18 Apr 2022 04:42:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KqqrcshMliSO; Mon, 18 Apr 2022 04:42:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1465F83F71;
	Mon, 18 Apr 2022 04:42:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7F4181BF2B7
 for <buildroot@lists.busybox.net>; Mon, 18 Apr 2022 04:42:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6D1B783F71
 for <buildroot@lists.busybox.net>; Mon, 18 Apr 2022 04:42:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5TLhRQtO1YRo for <buildroot@lists.busybox.net>;
 Mon, 18 Apr 2022 04:42:16 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6AF3383F6D
 for <buildroot@buildroot.org>; Mon, 18 Apr 2022 04:42:14 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 0C156C0002
 for <buildroot@buildroot.org>; Mon, 18 Apr 2022 04:42:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1650256932; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=JtgdbO9Y8K63V+GA21xg6C7kvlSJT34sO5xGtKNMZTg=;
 b=Y/6DCByQaKKovGwpyk7mfIGisOa0O1goDZ6kXDUhf2zJF3Jh++WWxvOST3celXDmLQhg8V
 7Q89XBJ62v0ZtpawSI7on2YUhtVbg2fBNt9K49PqPoS8MY+XKSwQxTNyKd4kqd8gslQmdg
 b3dMk5yBwE3WL3frt/F1o1JektfbRwGvrD801O3ckeONoEYSMR3kMGYez4/ZtKKFM/Q80Y
 QPaz4lFN/jQQ+5GOAVC6ZtlVBZYUxLWVA7kX0Hhillnf/L5nm+bCM3B2Ei9obqFRufEy5a
 4BxReURLGlsV8h8gwpoELKHH7LVzgpwhPOSPK4ActFYE/PoxGu1Dwj5nDxZSrQ==
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Mon, 18 Apr 2022 04:42:11 -0000
Message-Id: <20220418044219.6D1B783F71@smtp1.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-04-17
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

Autobuild statistics for 2022-04-17
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  | 17  |  5  |  0  | 22  |
    master   | 191 | 403 |  1  | 595 |

Classification of failures by reason for master
-----------------------------------------------

            host-binutils-2.32 | 53
         host-gcc-final-10.3.0 | 33
             libopenssl-1.1.1n | 15
                 uclibc-1.0.40 | 14
              fetchmail-6.4.29 | 13
           argp-standalone-1.3 | 12
tvheadend-1295dd2be863f5beb... | 12
host-elf2flt-7e33f28df198c4... | 11
           libwebsockets-4.3.1 | 11
                 linux-5.15.33 | 10
toolchain-external-bootlin-... | 10
                    ttyd-1.6.3 | 8 
                    git-2.31.2 | 7 
         linux-headers-5.15.33 | 7 
                    dhcp-4.4.3 | 6 
                     frr-8.2.2 | 5 
          host-gcc-final-9.4.0 | 5 
                libressl-3.4.3 | 5 
                   perl-5.34.1 | 5 
    toolchain-external-bootlin | 5 
                 zlib-ng-2.0.6 | 5 
                     gmp-6.2.1 | 4 
         host-gcc-final-11.2.0 | 4 
   linux-headers-5.10.104-cip3 | 4 
                python3-3.10.2 | 4 
               aircrack-ng-1.6 | 3 
                 dash-0.5.11.5 | 3 
glibc-2.34-109-gd64b08d5ba7... | 3 
          host-erofs-utils-1.4 | 3 
host-gdb-arc-2020.09-releas... | 3 
linux-headers-5.10.104-cip3... | 3 
            qpid-proton-0.35.0 | 3 
                     refpolicy | 3 
       shadowsocks-libev-3.3.5 | 3 
                 dmalloc-5.6.5 | 2 
                  exempi-2.6.1 | 2 
fs/ext2/ext2.mk:65: /home/a... | 2 
fs/f2fs/f2fs.mk:64: /home/a... | 2 
fs/f2fs/f2fs.mk:64: /nvmeda... | 2 
       host-gcc-initial-10.3.0 | 2 
       host-gcc-initial-11.2.0 | 2 
                host-go-1.17.9 | 2 
                  jack2-1.9.20 | 2 
                   json-c-0.15 | 2 
               libglib2-2.70.4 | 2 
                 pixman-0.40.0 | 2 
                    pppd-2.4.9 | 2 
                   uacme-1.7.1 | 2 
                 wavemon-0.9.4 | 2 
afboot-stm32-3566acd582e553... | 1 
               arptables-0.0.5 | 1 
              asterisk-16.25.2 | 1 
atest-895b0183a89c15f5e2305... | 1 
                     aufs-util | 1 
                    bat-0.19.0 | 1 
  binutils-arc-2020.09-release | 1 
                  botan-2.19.1 | 1 
            btrfs-progs-5.16.2 | 1 
              bubblewrap-0.6.1 | 1 
                   bullet-3.21 | 1 
                       cfm-0.3 | 1 
              containerd-1.6.2 | 1 
             ctorrent-dnh3.3.2 | 1 
              dieharder-3.31.1 | 1 
                 diffutils-3.8 | 1 
                elfutils-0.186 | 1 
                espeak-1.48.04 | 1 
                     exim-4.95 | 1 
fs/ext2/ext2.mk:65: /home/a... | 1 
fs/ext2/ext2.mk:65: /nvmeda... | 1 
fs/ext2/ext2.mk:65: /nvmeda... | 1 
fs/f2fs/f2fs.mk:64: /home/a... | 1 
fs/f2fs/f2fs.mk:64: /home/a... | 1 
fs/f2fs/f2fs.mk:64: /home/a... | 1 
fs/ubifs/ubifs.mk:49: /nvme... | 1 
         gobject-introspection | 1 
  gobject-introspection-1.70.0 | 1 
               gocryptfs-2.2.1 | 1 
                       gsl-2.6 | 1 
gummiboot-2bcd919c681c952eb... | 1 
             host-gtest-1.11.0 | 1 
              host-libcap-2.63 | 1 
             host-pahole-v1.23 | 1 
               host-qemu-6.2.0 | 1 
           host-wayland-1.20.0 | 1 
                   i2pd-2.40.0 | 1 
                jailhouse-0.12 | 1 
                jemalloc-5.2.1 | 1 
               libcap-ng-0.8.3 | 1 
         libcpprestsdk-2.10.18 | 1 
              libgcrypt-1.10.0 | 1 
                libgeos-3.10.2 | 1 
                libglvnd-1.3.2 | 1 
                libkrb5-1.18.4 | 1 
                   libnl-3.5.0 | 1 
                  libnspr-4.33 | 1 
                   libnss-3.77 | 1 
               liboping-1.10.0 | 1 
                librsvg-2.50.7 | 1 
               libsigsegv-2.13 | 1 
              libuhttpd-3.14.1 | 1 
                   linux-tools | 1 
            luaossl-20200709-0 | 1 
               mariadb-10.3.34 | 1 
                 minizip-3.0.5 | 1 
                mongodb-4.2.18 | 1 
                    mpd-0.23.6 | 1 
                    musl-1.2.2 | 1 
               netatalk-3.1.13 | 1 
                  netsurf-3.10 | 1 
               pamtester-0.1.2 | 1 
               pcsc-lite-1.9.5 | 1 
               poppler-21.12.0 | 1 
           python-pybind-2.9.0 | 1 
                    quazip-1.2 | 1 
                      rauc-1.6 | 1 
                   rsync-3.2.3 | 1 
              skalibs-2.10.0.3 | 1 
                   tbb-2018_U5 | 1 
toolchain-external-codescap... | 1 
                       unknown | 1 
                usbguard-1.1.1 | 1 
               util-linux-2.38 | 1 
               valgrind-3.18.1 | 1 
x264-35417dcd65a57321fbadf9... | 1 
                       xenomai | 1 
                xenomai-custom | 1 
                    zstd-1.5.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      | afboot-stm32-3566acd582e553... | NOK | http://autobuild.buildroot.net/results/473258568c4e39ee2e0391333f9209c8aefe73b6 |     
    i686     |        aircrack-ng-1.6         | NOK | http://autobuild.buildroot.net/results/fce1d4ef36416ed37e998858ea429714f99d4aa6 |     
    arc      |        aircrack-ng-1.6         | NOK | http://autobuild.buildroot.net/results/33db9c1b1f8678b41bebd0e62eee5640d2920ee1 |     
    i686     |        aircrack-ng-1.6         | NOK | http://autobuild.buildroot.net/results/271d98b2347f3c7852c2ad9224b07218859ab936 |     
 microblaze  |      argp-standalone-1.3       | NOK | http://autobuild.buildroot.net/results/d1a83168b0a8c15a29d6b7033692b65134c512b4 |     
   mips64    |      argp-standalone-1.3       | NOK | http://autobuild.buildroot.net/results/5c83d1e77c84b5c49afdd2fd02a60ee8a26a68c7 |     
   sparc     |      argp-standalone-1.3       | NOK | http://autobuild.buildroot.net/results/84b96ea07aa518a0f9ea72d7229ede9f7382cdb0 |     
    m68k     |      argp-standalone-1.3       | NOK | http://autobuild.buildroot.net/results/4d779edc6d015715f575c74df359f1603ec65644 |     
    arc      |      argp-standalone-1.3       | NOK | http://autobuild.buildroot.net/results/4fc82cda44699e55c7f5c73b94e62c1c0945bd45 |     
   xtensa    |      argp-standalone-1.3       | NOK | http://autobuild.buildroot.net/results/ffc5643ecc5c5f21f18ab8e94e816febe4c9bc62 |     
    or1k     |      argp-standalone-1.3       | NOK | http://autobuild.buildroot.net/results/60044e7194e630da1db5de1569bbf521b18ce9fa |     
   mipsel    |      argp-standalone-1.3       | NOK | http://autobuild.buildroot.net/results/a5b7076d21532881a2274ea1e2e159cdbfd8c72a |     
    arc      |      argp-standalone-1.3       | NOK | http://autobuild.buildroot.net/results/197e89ee2c792ab8a21534f8e62b1332b9ebef44 |     
microblazeel |      argp-standalone-1.3       | NOK | http://autobuild.buildroot.net/results/c72c0db9fe1913f0e2e8710f34d6e3743f2eff84 |     
    arc      |      argp-standalone-1.3       | NOK | http://autobuild.buildroot.net/results/dd675e975e201b0b5a32f9bc3dcfbcca5bd2a9f9 |     
   sparc     |      argp-standalone-1.3       | NOK | http://autobuild.buildroot.net/results/77354fba050f2f9225aaef85d74862a6e91c1c62 |     
  sparc64    |        arptables-0.0.5         | NOK | http://autobuild.buildroot.net/results/9972909d37fde3a12902b51723e5250e17ca8821 | ORPH
    m68k     |        asterisk-16.25.2        | NOK | http://autobuild.buildroot.net/results/ce4d62d00bb77ba5b303cacf6be7e350581a62f9 |     
    arm      | atest-895b0183a89c15f5e2305... | NOK | http://autobuild.buildroot.net/results/6673efecb2ea37eed42d063a3ea175c69dd6d868 |     
    arc      |           aufs-util            | NOK | http://autobuild.buildroot.net/results/9b896939e22a5f3e3ad648ceb0a7dfc2c81c4fb9 |     
    i686     |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/a46c5e678c995658963f445fb12946e2c4177497 |     
   arceb     |  binutils-arc-2020.09-release  | NOK | http://autobuild.buildroot.net/results/99b1ca2d6d46d81941ede11701690aea46292597 |     
  mips64el   |          botan-2.19.1          | NOK | http://autobuild.buildroot.net/results/c44f44f36686268479563afd879db588e15ede7d | ORPH
    or1k     |       btrfs-progs-5.16.2       | NOK | http://autobuild.buildroot.net/results/b630aea27a6ff0ab0c4f744540a4ccbc0fdf38a4 | ORPH
   mipsel    |        bubblewrap-0.6.1        | NOK | http://autobuild.buildroot.net/results/22a13c87b24759b184828d73ba0eb192b84ae485 |     
   nios2     |          bullet-3.21           | NOK | http://autobuild.buildroot.net/results/2bf6737325f0f14406903038733c17fc24a78c04 |     
    i686     |            cfm-0.3             | NOK | http://autobuild.buildroot.net/results/45bfbe890a82f579db4eea18fc3b335d20a58748 |     
   x86_64    |        containerd-1.6.2        | NOK | http://autobuild.buildroot.net/results/125370db581395b7486f7ed60ba3ebc9f64f77f2 |     
  riscv64    |       ctorrent-dnh3.3.2        | NOK | http://autobuild.buildroot.net/results/1c0d7ba54e725313b1352847f41a22ae0d5c5088 |     
   mipsel    |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/2760980af38b4af02dcdfd8f391096a6139f944f | ORPH
   xtensa    |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/5aa3bb8074f220f296cc78031d1adc4be72a19ee | ORPH
  sparc64    |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/82057cbe30a6a2d6470d688288214a6e4f30567d | ORPH
    arm      |           dhcp-4.4.3           | NOK | http://autobuild.buildroot.net/results/4eb68fe257dbef89a1fcbeaceaf103ea16ed197c | ORPH
  riscv64    |           dhcp-4.4.3           | NOK | http://autobuild.buildroot.net/results/44a08efc565afd6fe1b1d3a6c771fe32a7b0553d | ORPH
  riscv64    |           dhcp-4.4.3           | NOK | http://autobuild.buildroot.net/results/dcd010ea01796727c7a33b09098540a1d3f549f6 | ORPH
    mips     |           dhcp-4.4.3           | NOK | http://autobuild.buildroot.net/results/ae29a89912957e89175b9d5f82827ef4f3b9db5f | ORPH
   armeb     |           dhcp-4.4.3           | NOK | http://autobuild.buildroot.net/results/1736cebe01a13d7a4a9b9d84478f1d01a136dbea | ORPH
  riscv64    |           dhcp-4.4.3           | NOK | http://autobuild.buildroot.net/results/af7f74c973329c545009ccabbc32ff0de35b4aa4 | ORPH
 microblaze  |        dieharder-3.31.1        | NOK | http://autobuild.buildroot.net/results/74be425d3131029121b924f2a05477c52fcb28de |     
  powerpc    |         diffutils-3.8          | NOK | http://autobuild.buildroot.net/results/198258abe7f39b40ea1ceb1ff364d19f4bbc7d42 | ORPH
powerpc64le  |         dmalloc-5.6.5          | NOK | http://autobuild.buildroot.net/results/1d8e0233768c1e278dd103a172244d042678524a | ORPH
  powerpc    |         dmalloc-5.6.5          | NOK | http://autobuild.buildroot.net/results/91c710d2d1072d63c80e357cd2b492f2e1b4d7b2 | ORPH
    arc      |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/0d58a50afef2dd1dfa5ddbe3ffc0271cbc131426 | ORPH
   x86_64    |         espeak-1.48.04         | NOK | http://autobuild.buildroot.net/results/a4a6e3203ad70cd724da8130ee1648141ab39a6a |     
    arm      |          exempi-2.6.1          | NOK | http://autobuild.buildroot.net/results/94326b10575d8c5e32481d59384e8e14c101759c |     
    arm      |          exempi-2.6.1          | NOK | http://autobuild.buildroot.net/results/c2773599a85a36e5af0d2622fd8deeaf81717d8a |     
   armeb     |           exim-4.95            | NOK | http://autobuild.buildroot.net/results/0472f8b9c5dad5925b2f5fd6c9c90dfd549b48d2 |     
   xtensa    |        fetchmail-6.4.29        | NOK | http://autobuild.buildroot.net/results/ecddd5427846e3e730d51a25fe7e8ebd1adf8f73 |     
    mips     |        fetchmail-6.4.29        | NOK | http://autobuild.buildroot.net/results/8cd7a767013cc2fb077f4d7de7514f63447a5216 |     
microblazeel |        fetchmail-6.4.29        | NOK | http://autobuild.buildroot.net/results/ed6507a374f2570356c84e4389c9fae96a3100e6 |     
   s390x     |        fetchmail-6.4.29        | NOK | http://autobuild.buildroot.net/results/ef030b8843db0e722daf3ad444f27579aaba95d0 |     
  powerpc    |        fetchmail-6.4.29        | NOK | http://autobuild.buildroot.net/results/cf09f73b39c546b1fd1135bf6ff6f4f34c6d403c |     
  riscv32    |        fetchmail-6.4.29        | NOK | http://autobuild.buildroot.net/results/c288e82ad1f97130ee71287fe529a60c3c7290e6 |     
    or1k     |        fetchmail-6.4.29        | NOK | http://autobuild.buildroot.net/results/dae13e50db33708ea1b3780697f19dafa627fea6 |     
microblazeel |        fetchmail-6.4.29        | NOK | http://autobuild.buildroot.net/results/cce4494276d6e13d11a47b0343966c4a9f77cb03 |     
   s390x     |        fetchmail-6.4.29        | NOK | http://autobuild.buildroot.net/results/f85263b7bb3f10cbd147850c4d11bae1325457d4 |     
   mips64    |        fetchmail-6.4.29        | NOK | http://autobuild.buildroot.net/results/7ed065cba540719188a58d2b7f24f57d385b508d |     
    or1k     |        fetchmail-6.4.29        | NOK | http://autobuild.buildroot.net/results/ac9a727fcd9ac6f7e084de5e27cec6206d792f08 |     
    m68k     |        fetchmail-6.4.29        | NOK | http://autobuild.buildroot.net/results/7bdd2fe7d2a6a7d56bb921ad7f50bf7bd4a0409f |     
microblazeel |        fetchmail-6.4.29        | NOK | http://autobuild.buildroot.net/results/ad45879224a85aaec9ed069d52ede3e575d2fe65 |     
  mips64el   |           frr-8.2.2            | NOK | http://autobuild.buildroot.net/results/ed999e4ea72e7d7d8ba24eb8715449042f9e6c24 |     
    arc      |           frr-8.2.2            | NOK | http://autobuild.buildroot.net/results/ea729ebaff251affadec3a84b9448848ee27db20 |     
  mips64el   |           frr-8.2.2            | NOK | http://autobuild.buildroot.net/results/7f08ad72d76fffd3cc402865e2b3fa0de3047b0d |     
    arc      |           frr-8.2.2            | NOK | http://autobuild.buildroot.net/results/a676faa3d4c6fd4dec6666251a0dcc0dab9706e0 |     
   xtensa    |           frr-8.2.2            | NOK | http://autobuild.buildroot.net/results/df6e0df03767ef68b59708d4ed5739add4ce0f2b |     
    arm      | fs/ext2/ext2.mk:65: /home/a... | NOK | http://autobuild.buildroot.net/results/95b04900ea79f751a5ee00b7b2b18cd9bf8765cf |     
   s390x     | fs/ext2/ext2.mk:65: /home/a... | NOK | http://autobuild.buildroot.net/results/19e03d776c81a7a2ea9722a5481d6da498607d60 |     
  mips64el   | fs/ext2/ext2.mk:65: /home/a... | NOK | http://autobuild.buildroot.net/results/18024797b9e26991ee092a3a9fb24bf7a8957e80 |     
 microblaze  | fs/ext2/ext2.mk:65: /nvmeda... | NOK | http://autobuild.buildroot.net/results/749afb4dff70442dac3320967c92d364b8fd9329 |     
    m68k     | fs/ext2/ext2.mk:65: /nvmeda... | NOK | http://autobuild.buildroot.net/results/c0c304d4e7b53f6d3cad937e8c4281fbc5ce9948 |     
   arceb     | fs/f2fs/f2fs.mk:64: /home/a... | NOK | http://autobuild.buildroot.net/results/4de41c6018b71b8f6949d9ef441e7ddd8f0d7fc8 |     
 microblaze  | fs/f2fs/f2fs.mk:64: /home/a... | NOK | http://autobuild.buildroot.net/results/12cacb06e6ef35e543e1aea5b92728ece6eb923c |     
microblazeel | fs/f2fs/f2fs.mk:64: /home/a... | NOK | http://autobuild.buildroot.net/results/b366dbebfd4da3eb1786730a318caad041eb593e |     
   xtensa    | fs/f2fs/f2fs.mk:64: /home/a... | NOK | http://autobuild.buildroot.net/results/1ef28ceed2fab7f4dd16fba7a3e69878ea4c0a15 |     
    arc      | fs/f2fs/f2fs.mk:64: /home/a... | NOK | http://autobuild.buildroot.net/results/0886b9c593314391d1f9e6790f51a3a8531c070e |     
   mips64    | fs/f2fs/f2fs.mk:64: /nvmeda... | NOK | http://autobuild.buildroot.net/results/11f022e2c9e1f86de1251e955b1c8420160e0972 |     
  riscv32    | fs/f2fs/f2fs.mk:64: /nvmeda... | NOK | http://autobuild.buildroot.net/results/1612c56e36f1267af36dd54b015080778ba5dc11 |     
  sparc64    | fs/ubifs/ubifs.mk:49: /nvme... | NOK | http://autobuild.buildroot.net/results/5f065f5d8f32c2931ae03c6300db37158d4a7278 |     
    or1k     |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/a445089e4f8d66621273811aa59c4617433f3486 |     
    mips     |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/1963168359cfa67cf8b0769f109e92e051ef65b6 |     
    arc      |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/6c473ba944852bd15b63d339b98d45fb9b9fbca6 |     
    i686     |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/e0b2ade216b971b353862f9346a7c484058e224e |     
   arceb     |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/7fea216c74541990f2c3cf9cbd0e424e2238daaf |     
    or1k     |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/6ddb2240c83ed56d7db350802313f1d4a79c2c35 |     
   mipsel    |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/14cd6546b3af7ce7b0004e04d531ceb71af66576 |     
   nios2     | glibc-2.34-109-gd64b08d5ba7... | NOK | http://autobuild.buildroot.net/results/ce3f0106d824a277d5670b36c38fc01ffb8159d2 |     
  riscv32    | glibc-2.34-109-gd64b08d5ba7... | NOK | http://autobuild.buildroot.net/results/359bd6187d2da7c0cd5d1b95a91b314a98f00eff |     
powerpc64le  | glibc-2.34-109-gd64b08d5ba7... | NOK | http://autobuild.buildroot.net/results/5f35dad0ca3b7ac2e8153c6689a4df74836e66a4 |     
  riscv64    |           gmp-6.2.1            | NOK | http://autobuild.buildroot.net/results/d31344f0585df5d6173934c8b57bd0adec7b00a6 | ORPH
  riscv64    |           gmp-6.2.1            | NOK | http://autobuild.buildroot.net/results/2bc8157f474ed21e8eb69c85dbd194a0ac9dd62c | ORPH
  riscv64    |           gmp-6.2.1            | NOK | http://autobuild.buildroot.net/results/466b39df218b9080c6a40661de271046f5196423 | ORPH
  riscv64    |           gmp-6.2.1            | NOK | http://autobuild.buildroot.net/results/40afa0c4efcb8c6a0f9dea1afcb060b7ce8c6a84 | ORPH
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/0ee6b337fa6cca12529acbc4060b3d4736556753 |     
  powerpc    |  gobject-introspection-1.70.0  | NOK | http://autobuild.buildroot.net/results/79b695651fda1936f7fcd8aff4d1a5b0e2e4555d | ORPH
   x86_64    |        gocryptfs-2.2.1         | NOK | http://autobuild.buildroot.net/results/83f0eba51ecb8a020c4595eda50e73a2d33ce1e3 |     
  powerpc    |            gsl-2.6             | NOK | http://autobuild.buildroot.net/results/8d6487001b2b48abbff1e6092b4b179ca6f5c9e2 | ORPH
   x86_64    | gummiboot-2bcd919c681c952eb... | NOK | http://autobuild.buildroot.net/results/237ce34d0f35728c9d383888fe699bfe0c0e2d42 |     
 aarch64_be  |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/6c1aa8fee49539e7f257861a4994245054a4b404 |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/745f178da4b74d4a80177713d49929b2d13e649b |     
 aarch64_be  |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/fdb78e6f574c99ddf36aa5924003da924e6161b3 |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/4664645db65b19bca67c35ac57b82107ef50a793 |     
   sh4eb     |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/5baacd836bdf249c1e46dc76f57d933fc7c7292d |     
 aarch64_be  |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/2a9b674a63cb3805a75c0c4fe2f216b393ca0db5 |     
 aarch64_be  |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/fe14243a899c7dcf1526e9b5131470ebe61d05f5 |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/cb14ef0770236a89d7b493a306b765ef9fc42d86 |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/fc4a32508b04a6d8d340dcd7632085a0183d4de6 |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/70b1612f2d461ddc646da31852424517d83e4ac6 |     
 aarch64_be  |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/845192d3fb2e3b9ee6fa7dc9c3e2e8f55d7ab0f8 |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/cb22ba8987895d5b730b3b0b427851f0601e6f6c |     
 aarch64_be  |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/db70e552553ff4ab7094dc35ec003b83e28053b4 |     
 aarch64_be  |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/f759d81196aee63c34fd2188824efb59a0a4c490 |     
 aarch64_be  |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/0a075b2a54265b68ae103c46838ff9bf303ac8cd |     
    sh4      |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/5ee37f8ec82e496fb946835977d3257feee2a94b |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/a97536cdb843987f9ea811fb30107f18733baffd |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/c0753d92d565bffd8b18c474d3e99fc8aeb0cc42 |     
 aarch64_be  |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/945b54fc3972b49ccd98672152d98c1b83ca5d56 |     
 aarch64_be  |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/6f6817e56999b60ec9e1126b9e50a8ce8c971ac4 |     
    sh2a     |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/948ce02a7348adbaea2654d26e18942bb0d6b62b |     
    sh2a     |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/daf8c7ef1766f4746b90bd44cb9e812578f6ffd2 |     
   sh4aeb    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/615d6d73354549e76b6009d76af88b220b81b58f |     
 aarch64_be  |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/53777fd7f07164f4e52c861513585556f00d5479 |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/63857517fc574bb72b6bb9e422e4db82778e7527 |     
 aarch64_be  |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/5251ae0b14c35642a95a5cf4a669bd70a26de90d |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/7424462ce21c934bf382f43f472d97248eacd079 |     
   sh4eb     |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/ecef113740799ee82d6e254cad45f1788074bb6e |     
    sh2a     |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/1d4f5ca0abd976f4bde67b3199a69f0e23ba4a9e |     
    sh4a     |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/1bfe6ffe1fd92cc3e43643c36e7531fa86307023 |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/ff955f5373b4f4ec24e1a718ad9440917df08fef |     
 aarch64_be  |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/a18a925277575bb5534919fb4346b34e8de45b87 |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/15237468a8797e011a0cca2b7c86b68e9c186320 |     
   sh4aeb    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/a43cf0358d38a1c08307cd2a960debc791747aaa |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/6a79b63c2dce3b31b0268640e7a225384a9b5d82 |     
    sh2a     |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/818feba878bfc6aafe4af52c2861d1b7d753f2b0 |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/987da66c81e2f21393245b17cc0441933fb4381b |     
    sh4a     |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/92b384580ad993d77b2b6dcf7d8114899f9b9efb |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/ffa1a86506303f3c26c792c21257e4a7b6e31c07 |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/ebea8fcae944d289b9f689d5c2324937eb29ff71 |     
    sh4a     |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/301ed90dbd24e636b9eb20f22d2aee16590d7393 |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/8617ed47471fe342c1ee98f024e7d323be4566d3 |     
   sh4eb     |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/376f90c069dfe1e84ab99614825a0b63e1dc19aa |     
   sh4aeb    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/6b2e85b13f7a04a442ba38b23b202b3892d8dfd9 |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/de35d1b035f30ec1fc8acc25ff85c2c35e6dfd76 |     
    sh2a     |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/9963d362415d471fcdb7b813855d1f9431237d1b |     
   sh4aeb    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/4042420d0e5f52ec35f63b4f3d3832fda68dc836 |     
 aarch64_be  |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/82520f08cd88560057eb0ef4f1b07d14e9bdfc0c |     
    sh2a     |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/bfaa3827d1fe5763da3a1b9e945169ad2d557c17 |     
 aarch64_be  |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/c30b30c5c47087bbedfbb3de52abff19982aa3c3 |     
 aarch64_be  |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/62205d18329205ba4cfa1c78585848cab6a23e68 |     
  aarch64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/2b22e1c6becbd6a5c3e614faf707972230859543 |     
    sh2a     |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/87fe686b681f4500219540e1c24cc2e67a0ec796 |     
   armeb     | host-elf2flt-7e33f28df198c4... | NOK | http://autobuild.buildroot.net/results/884b2b95600ef682a77a0cb93d066c008b45265b | ORPH
   armeb     | host-elf2flt-7e33f28df198c4... | NOK | http://autobuild.buildroot.net/results/952f506a932dd3b8c1e8234ccf809af6370d6369 | ORPH
   armeb     | host-elf2flt-7e33f28df198c4... | NOK | http://autobuild.buildroot.net/results/00cee0aa49c443bcf7ee5295757f1482c7030a73 | ORPH
   armeb     | host-elf2flt-7e33f28df198c4... | NOK | http://autobuild.buildroot.net/results/23df79b02813dfd1ca816f9d44b0c64766bd52fd | ORPH
   armeb     | host-elf2flt-7e33f28df198c4... | NOK | http://autobuild.buildroot.net/results/0cb16d78b62b97ec414d304b4e0fea8fdef6daed | ORPH
   armeb     | host-elf2flt-7e33f28df198c4... | NOK | http://autobuild.buildroot.net/results/fde07ad6b3db22cd3988715993ed713d14da86d1 | ORPH
   armeb     | host-elf2flt-7e33f28df198c4... | NOK | http://autobuild.buildroot.net/results/41b4ef98e1195e64ba193c7b790614ef2ca06b70 | ORPH
   armeb     | host-elf2flt-7e33f28df198c4... | NOK | http://autobuild.buildroot.net/results/a3022e54f86f7bed8b14a3860758d26a66b9fac6 | ORPH
   armeb     | host-elf2flt-7e33f28df198c4... | NOK | http://autobuild.buildroot.net/results/1c81f605d98d210230a19664eb158291a435708f | ORPH
   armeb     | host-elf2flt-7e33f28df198c4... | NOK | http://autobuild.buildroot.net/results/8974ed85c862959fbb6c4b9be517e10023c968df | ORPH
   armeb     | host-elf2flt-7e33f28df198c4... | NOK | http://autobuild.buildroot.net/results/90636781c13c08beaf289cc7d9870e1176e1a42d | ORPH
   xtensa    |      host-erofs-utils-1.4      | NOK | http://autobuild.buildroot.net/results/0f2d1a6f91e37de25f44a4dbd9592a89e224c8a5 |     
    arm      |      host-erofs-utils-1.4      | NOK | http://autobuild.buildroot.net/results/68a1874cb2aeec786de054f8846d5019ec7b36c3 |     
   x86_64    |      host-erofs-utils-1.4      | NOK | http://autobuild.buildroot.net/results/12d18ae043b32443983af514690f27816008fff3 |     
  riscv32    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/3496698a4a5eeea67625101b24f31d830e3f2fb7 |     
powerpc64le  |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/b7c128d28ee14367a557de00a9d816d32206ef80 |     
powerpc64le  |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/b6bc03c06a0edcabefbbd37abb46c326f55f6ea1 |     
   nios2     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/7440dd016621923f906019aef4dc45d18bd1ee04 |     
powerpc64le  |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/51ecb3a3f93699b7d6c1103340e2b96fe4598f22 |     
  sparc64    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/3989db9ac0dcae13d9a89d7dade6861ec3c3d82c |     
powerpc64le  |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/9fb8a104e9660cdb329c9c734280f5dac83a5944 |     
  sparc64    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/5faf6041fe025c2ade36f1457939425735adb41f |     
  riscv32    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/159b187471ccbed87d7b2f185aaf661159c2d06d |     
   nios2     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/db9281bd200c28414dc86ce5b31c0d3078c14017 |     
 powerpc64   |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/d3dd4aec89f1f47e4b75463ea56a6145daf1b523 |     
powerpc64le  |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/ea7d0bf1a4544a58507e6bf8ad8e6ebe4a8a55e8 |     
  sparc64    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/fac1b2b10f4b8ff59f931830cdf06a734d40db0b |     
   nios2     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/919648a1f4fc103f895b1bb11af1116fb6293fa2 |     
 powerpc64   |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/90b45a4b98c2f986b1a9123805bfd68482b45948 |     
 powerpc64   |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/1eb0b77ec3a1d81838ab0e4de0bab124ed7f1773 |     
 powerpc64   |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/0fb5f2415648570334e5c5b39c63c42321feeea1 |     
  riscv32    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/8a5c0cf8754ab089a8a75f1aaf43adc5f97a4399 |     
  sparc64    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/ad186203669ba0a1e4f16fa771fe22c330fd1a64 |     
 powerpc64   |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/20af58e5dcc00c8cbc154cfe1072c7bea8dd79a7 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/e952673ced1a51d7a2ae9f1011e94c250c43f2fd |     
powerpc64le  |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/01f67457eb5afb761c747582426e86015d7279da |     
powerpc64le  |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/a2702a900288b479c1f8420124c9cf840cd5b9e3 |     
   nios2     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/3d6122d76055eaaee10603ebb78992378b4ea66b |     
    i686     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/eb6e6665e3bd912cd47197f2b997373f4376c643 |     
   nios2     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/6533fb3e892f9482a5390c08d26a464678dc0419 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/fb9618d5b77cff3255a9441210328aef7a0e5a86 |     
  powerpc    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/ab8e78e7bb044a223fe9f9e9c3f291d58f2f0d33 |     
 powerpc64   |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/937fea78cda9d2ba238ffacf58df9d0d894d62b4 |     
   nios2     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/19104b0262c9ad7b503c0be70fd6a041f4633975 |     
  sparc64    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/723fb6939b09e3b71c85fde3a5c372d2893b951a |     
 powerpc64   |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/9031aef3465666f849a2fa6a57db95a4cd4c3dba |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/4accfa93520e687ffb353abe50c83be12364da78 |     
   nios2     |     host-gcc-final-11.2.0      | NOK | http://autobuild.buildroot.net/results/df6193f49c54fc695d3c83346693dd576f6f911c |     
   nios2     |     host-gcc-final-11.2.0      | NOK | http://autobuild.buildroot.net/results/2b87b8e17a671c0adedc1389229eba57d0bf15f9 |     
   s390x     |     host-gcc-final-11.2.0      | NOK | http://autobuild.buildroot.net/results/1e98c69642c6bb39f74ca80f0e973b1aff6aa8a5 |     
   nios2     |     host-gcc-final-11.2.0      | NOK | http://autobuild.buildroot.net/results/eb7a3a41d8c289693b70555fee76fc965f315951 |     
  sparc64    |      host-gcc-final-9.4.0      | NOK | http://autobuild.buildroot.net/results/2b2943e4fe37e9235fb4999d783b69a59d03ef4f |     
  sparc64    |      host-gcc-final-9.4.0      | NOK | http://autobuild.buildroot.net/results/b1019218cab913864a2fc91248e2d5eee8b0a6fb |     
  riscv32    |      host-gcc-final-9.4.0      | NOK | http://autobuild.buildroot.net/results/aee57df117cb6cdef981df1a6e15a80596c2c283 |     
 powerpc64   |      host-gcc-final-9.4.0      | NOK | http://autobuild.buildroot.net/results/256083457da2d2c1335e7726d8b8655bf02e6f21 |     
   nios2     |      host-gcc-final-9.4.0      | NOK | http://autobuild.buildroot.net/results/dfdeabfff2854f851869e8aa47cd4ae49c0bf196 |     
    i686     |    host-gcc-initial-10.3.0     | NOK | http://autobuild.buildroot.net/results/5d6a4296d6457e9f1df9922446a65e32182adfb6 |     
    arm      |    host-gcc-initial-10.3.0     | NOK | http://autobuild.buildroot.net/results/056219943fb90c2edc2674ec3929dca47c0cf3b4 |     
    arc      |    host-gcc-initial-11.2.0     | NOK | http://autobuild.buildroot.net/results/75471dd8df983710688812d0311e2095db9b4ede |     
   arceb     |    host-gcc-initial-11.2.0     | NOK | http://autobuild.buildroot.net/results/11dfdd86959235ff03581417c35933782952fb4f |     
   arceb     | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/ebed543cc74a5ad948ed35c5b2de4984c9acee3f | ORPH
   arceb     | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/67472629245d61ec016667f47e2e819520774201 | ORPH
    arc      | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/99819f0b23342795f6a759bce0215dd593bc29b7 | ORPH
  mips64el   |         host-go-1.17.9         | NOK | http://autobuild.buildroot.net/results/49d4a580f3c945156bb81d006bc122d70c17e647 |     
  mips64el   |         host-go-1.17.9         | NOK | http://autobuild.buildroot.net/results/ccc1d18fab32ae1f104665482916a34d97261e9e |     
microblazeel |       host-gtest-1.11.0        | NOK | http://autobuild.buildroot.net/results/01e77b600b9ec3dabf018aaf0ed96ab7d843eb21 |     
   nios2     |        host-libcap-2.63        | NOK | http://autobuild.buildroot.net/results/183452e9057c322622a0a6c00a980cc65a63326b |     
microblazeel |       host-pahole-v1.23        | NOK | http://autobuild.buildroot.net/results/4688c113b063a390b3222b9c1accb4c38a2f58cc |     
   armeb     |        host-qemu-6.2.0         | NOK | http://autobuild.buildroot.net/results/a6f97308aa2e634ed3d5b80b33b4663aa16c4693 |     
    arm      |      host-wayland-1.20.0       | NOK | http://autobuild.buildroot.net/results/c001a864b8b0c300a73c50a264f1e26b12aa5741 |     
  mips64el   |          i2pd-2.40.0           | NOK | http://autobuild.buildroot.net/results/f03cad1ca6e2783c0427a3592452ff7c64bd76a9 |     
    m68k     |          jack2-1.9.20          | NOK | http://autobuild.buildroot.net/results/24f0e9c0a6879ea904d78ebad2bed03ff6a5318e |     
    m68k     |          jack2-1.9.20          | NOK | http://autobuild.buildroot.net/results/3a5eb9c005b0497545e003e74271a680654326a9 |     
   x86_64    |         jailhouse-0.12         | NOK | http://autobuild.buildroot.net/results/da1ed2d0efac84f03bbe5f09782d599be592ec9e |     
    arm      |         jemalloc-5.2.1         | NOK | http://autobuild.buildroot.net/results/773b3fcd97247ad19f4752b9faf134cab8510665 |     
  riscv64    |          json-c-0.15           | NOK | http://autobuild.buildroot.net/results/36fead17cb6695f4377060b9f86999111a4e28c8 |     
  riscv64    |          json-c-0.15           | NOK | http://autobuild.buildroot.net/results/8b7e1bf398714488d77782a275b88568a4b6b4d9 |     
    or1k     |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/2d266ea575796be1d9e2bfeea589aa431a7d134d |     
  powerpc    |     libcpprestsdk-2.10.18      | NOK | http://autobuild.buildroot.net/results/5ba8f1af064097b85dd2e96e2c57b94c72c984ef | ORPH
 powerpc64   |        libgcrypt-1.10.0        | NOK | http://autobuild.buildroot.net/results/99311c7b33559d5f0b1d6c71288810e4f09d9df3 | ORPH
    or1k     |         libgeos-3.10.2         | NOK | http://autobuild.buildroot.net/results/36e3e30df6f7a07327cd8f864b7e713f93217656 |     
   arceb     |        libglib2-2.70.4         | NOK | http://autobuild.buildroot.net/results/5979e78563136ff21c40e4e71ed6cce9d77cbc59 |     
    arc      |        libglib2-2.70.4         | NOK | http://autobuild.buildroot.net/results/89ae13818955f4510aa90d1bfe2443dbc369a25a |     
    mips     |         libglvnd-1.3.2         | NOK | http://autobuild.buildroot.net/results/ab186c9d31898246b86045fec69de8f4cf311be8 | ORPH
    mips     |         libkrb5-1.18.4         | NOK | http://autobuild.buildroot.net/results/fe199969f35b99f8d84e842147712270aa4307f6 |     
   mips64    |          libnl-3.5.0           | NOK | http://autobuild.buildroot.net/results/40ba839923d1487d1974c31e04edc8e2e18d9859 | ORPH
    mips     |          libnspr-4.33          | NOK | http://autobuild.buildroot.net/results/eb187dc4f97db700336f551290d9c97fbc32fef8 |     
   x86_64    |          libnss-3.77           | NOK | http://autobuild.buildroot.net/results/43a214e63a86512d17e48bb1c091452772ea7906 |     
   sparc     |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/d296f867bead9cbdbae65ed8f6d28fe202774e08 |     
   xtensa    |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/da9af1b1bd71e104fa540fc9a4eaf4a4eef5ee57 |     
    arm      |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/a69ac7201e964764d4e58c16b90f8dde78254777 |     
   arceb     |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/c9b00516a5735078b6441ccfeb8061760ef1ce3c |     
    arc      |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/b7856df8bd8fe53e8158243148c3f941983f0192 |     
    arm      |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/7ac88165b3616068f82ab26ea0be95f72b2f3049 |     
   arceb     |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/90e49ffef03edacc6402123ce8bbb9052d4c0607 |     
  riscv64    |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/0035bb3a5aba4afeb010b0257dd0aa7f26bdfb36 |     
    arc      |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/9ce7f86e1669055a7ac4a0b3a47e158c02df7203 |     
   sparc     |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/ffbd9c7bd47f816c9963608c617113239918050a |     
   xtensa    |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/15edd46a35b383bbd352f3c75465b97788dd92f3 |     
    arc      |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/adac39b1f34a78f6653080bebedfa7f4591c5882 |     
    m68k     |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/f29c58777bed7e59e08eecc7b1e1272f071af8a0 |     
    m68k     |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/0f9878222eeeea5eed619b9e3aa63e90dcd56c74 |     
    or1k     |       libopenssl-1.1.1n        | NOK | http://autobuild.buildroot.net/results/d1d4837c80d58f1aef5766f3c9c3f731ee4b4c38 |     
   mips64    |        liboping-1.10.0         | NOK | http://autobuild.buildroot.net/results/a88c964117789d8ffcf8d9a6eb179a0920b95525 |     
   arceb     |         libressl-3.4.3         | NOK | http://autobuild.buildroot.net/results/e65f83babf02f2c338c5cc6136e12492fbbafab9 | ORPH
microblazeel |         libressl-3.4.3         | NOK | http://autobuild.buildroot.net/results/bfc1aac239996749b039e45bc46d63749cca0aae | ORPH
   arceb     |         libressl-3.4.3         | NOK | http://autobuild.buildroot.net/results/c61b1c130737de48af74ab2ad748d0455a2460f4 | ORPH
   arceb     |         libressl-3.4.3         | NOK | http://autobuild.buildroot.net/results/eef4142a479411981a74d2c121dcbb876ef927ee | ORPH
    or1k     |         libressl-3.4.3         | NOK | http://autobuild.buildroot.net/results/852898c9b239bd9d6557017f3dfed7371e01d18c | ORPH
    i686     |         librsvg-2.50.7         | NOK | http://autobuild.buildroot.net/results/54d94bad293fb3b7242e8a56fb3fbaee0c9a8c19 |     
microblazeel |        libsigsegv-2.13         | NOK | http://autobuild.buildroot.net/results/61a2a2f43ebe9901212d9694965d78803c117494 |     
   mips64    |        libuhttpd-3.14.1        | NOK | http://autobuild.buildroot.net/results/f36c65afd1d1f2045a937b58bc44bf8edc266d25 |     
   mipsel    |      libwebsockets-4.3.1       | NOK | http://autobuild.buildroot.net/results/2a457b65405a0e7c0c72f0ce780320e2fd13ca1f |     
  sparc64    |      libwebsockets-4.3.1       | NOK | http://autobuild.buildroot.net/results/358788a03685552b6106865731c6eebf0e69df17 |     
powerpc64le  |      libwebsockets-4.3.1       | NOK | http://autobuild.buildroot.net/results/5bf2096f657b516261327116903236a84ad6aeea |     
  mips64el   |      libwebsockets-4.3.1       | NOK | http://autobuild.buildroot.net/results/9cbf00fbe1a2e1329d0117648099d9e3fa63dafb |     
  riscv32    |      libwebsockets-4.3.1       | NOK | http://autobuild.buildroot.net/results/81d0b10a340cb154a1446c5bd39705820a7f5a80 |     
   sparc     |      libwebsockets-4.3.1       | NOK | http://autobuild.buildroot.net/results/69527359d8181a1bde4ea56ace056451b499bcff |     
   mips64    |      libwebsockets-4.3.1       | NOK | http://autobuild.buildroot.net/results/8d64c67267c066143be2f98d2b74829cb168cfa4 |     
    m68k     |      libwebsockets-4.3.1       | NOK | http://autobuild.buildroot.net/results/93edf63062629e27d5708ee20b11816351780e22 |     
microblazeel |      libwebsockets-4.3.1       | NOK | http://autobuild.buildroot.net/results/a40e8c8f203ddfe1baabdce332f5fc5655d5355e |     
powerpc64le  |      libwebsockets-4.3.1       | NOK | http://autobuild.buildroot.net/results/ca7243f184d412ed2f09d88decf3c1849614824c |     
    mips     |      libwebsockets-4.3.1       | NOK | http://autobuild.buildroot.net/results/572fbdcb2b506498850896e8d1833f73fd1346ee |     
  mips64el   |         linux-5.15.33          | NOK | http://autobuild.buildroot.net/results/87d16cb57f2ded052865f84de07f8fbe03fda704 | ORPH
  mips64el   |         linux-5.15.33          | NOK | http://autobuild.buildroot.net/results/6c413f06e9a48eb6023bf31623897cfa5fd22062 | ORPH
    m68k     |         linux-5.15.33          | NOK | http://autobuild.buildroot.net/results/11c6e8ca64c66cadb686bcbcc9951226c3ee9299 | ORPH
   nios2     |         linux-5.15.33          | NOK | http://autobuild.buildroot.net/results/5148e2601f6ef7d40dd2d8caf7082afea0d75fbb | ORPH
  mips64el   |         linux-5.15.33          | NOK | http://autobuild.buildroot.net/results/8b8663b63b6d57939adcd17caf617406a98a42f4 | ORPH
    m68k     |         linux-5.15.33          | NOK | http://autobuild.buildroot.net/results/0e924bc034235bff81f7fb3dc6ca6634029f32c9 | ORPH
  mips64el   |         linux-5.15.33          | NOK | http://autobuild.buildroot.net/results/d03da556744eab57f9a9bb2e5ab5c5fec002880c | ORPH
  mips64el   |         linux-5.15.33          | NOK | http://autobuild.buildroot.net/results/702c4ee11673e81abe265cbbf7b9e465e6a84c84 | ORPH
  powerpc    |         linux-5.15.33          | NOK | http://autobuild.buildroot.net/results/c1620a20a876c764ac1fc91aeaa3e412434ea8c9 | ORPH
    i686     |         linux-5.15.33          | NOK | http://autobuild.buildroot.net/results/3e435fd062629a03a3381cd364a5b3661d8446bf | ORPH
   xtensa    |  linux-headers-5.10.104-cip3   | NOK | http://autobuild.buildroot.net/results/7e3d1da922a6d903f7d34057f5dcc73c082a0c8c | ORPH
 microblaze  |  linux-headers-5.10.104-cip3   | NOK | http://autobuild.buildroot.net/results/5e274cdc2b9cd53ec6edf775d873465a60c79612 | ORPH
    m68k     |  linux-headers-5.10.104-cip3   | NOK | http://autobuild.buildroot.net/results/6da27ad1c10a074c53234d713c8f547a6b3c07cf | ORPH
   s390x     |  linux-headers-5.10.104-cip3   | NOK | http://autobuild.buildroot.net/results/1980fd6be1af549373032238c5026a4762623d5c | ORPH
   mipsel    | linux-headers-5.10.104-cip3... | NOK | http://autobuild.buildroot.net/results/c8f81e3b86a71c204cf5684690daa6e5f7460fee | ORPH
   sparc     | linux-headers-5.10.104-cip3... | NOK | http://autobuild.buildroot.net/results/c909a558776103530603809c7d1bcd09c8c98fcb | ORPH
  riscv64    | linux-headers-5.10.104-cip3... | NOK | http://autobuild.buildroot.net/results/2f5849d9d7d50dab4c79d759285b77a1a0536776 | ORPH
 powerpc64   |     linux-headers-5.15.33      | NOK | http://autobuild.buildroot.net/results/cb29dd9083b7819cb5464f06bd823b63f30d295a | ORPH
    arc      |     linux-headers-5.15.33      | NOK | http://autobuild.buildroot.net/results/4acaf1713b2bdec39b6029e373aae1d8b0dfe541 | ORPH
   mips64    |     linux-headers-5.15.33      | NOK | http://autobuild.buildroot.net/results/5b1a2b90bb0e98b9eb7e47a3a0eeac04c739b51a | ORPH
   mips64    |     linux-headers-5.15.33      | NOK | http://autobuild.buildroot.net/results/914279bad229beec735b66cb23d2e82d544b651e | ORPH
  riscv64    |     linux-headers-5.15.33      | NOK | http://autobuild.buildroot.net/results/378c080056b491dd90e31892cd7091eb569f641e | ORPH
  riscv32    |     linux-headers-5.15.33      | NOK | http://autobuild.buildroot.net/results/778acd460d870ec3c53fe55de4a3dc56d867dfd5 | ORPH
   sparc     |     linux-headers-5.15.33      | NOK | http://autobuild.buildroot.net/results/2fa6250e105249f447b4ec4388c0e070d1f6f057 | ORPH
    or1k     |          linux-tools           | NOK | http://autobuild.buildroot.net/results/0f5ed2e007d66686bc14a28ed2113f6d171779d7 | ORPH
    arc      |       luaossl-20200709-0       | NOK | http://autobuild.buildroot.net/results/79cdc6b3c262db0f3076b189a7054465b9b0dfd1 |     
   sparc     |        mariadb-10.3.34         | NOK | http://autobuild.buildroot.net/results/f237f1e899a4f7b3b30aceb3a54d3b2ce1c79d6c | ORPH
   mips64    |         minizip-3.0.5          | NOK | http://autobuild.buildroot.net/results/fba4d25a013d450f93c25a0fd54a6a4615a0546f |     
    arm      |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/85f5b55843e854fb7fe9e93ba6d66ecd299122d4 |     
    i686     |           mpd-0.23.6           | NOK | http://autobuild.buildroot.net/results/7a0fe4e9248ed96a5c4934361de16e0b59a51d50 |     
  powerpc    |           musl-1.2.2           | NOK | http://autobuild.buildroot.net/results/7bc1d4dc0441ac80982c9491ea39f65c387159f3 |     
   nios2     |        netatalk-3.1.13         | NOK | http://autobuild.buildroot.net/results/7de9b9b1005fbe92679a5e74a9b7e75ed32a17d7 | ORPH
  sparc64    |          netsurf-3.10          | NOK | http://autobuild.buildroot.net/results/11c78b90278d61f1f7871942d3d91a858ecfd57f |     
  sparc64    |        pamtester-0.1.2         | NOK | http://autobuild.buildroot.net/results/616e706aa278aa6aefe4b7da040aa3e417e618f4 | ORPH
    or1k     |        pcsc-lite-1.9.5         | NOK | http://autobuild.buildroot.net/results/0eb0ba8052582c4e2f1b33c1038db9b950c837af | ORPH
  powerpc    |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/a50ca7ccf93786f07368261b8ee22ea8acda02da |     
    or1k     |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/cd1bd76820a8209f530be44a5fad86a5139955da |     
   arceb     |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/34ba3253cb9925ac8875bc4ea4ebb08c1c0afbcb |     
microblazeel |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/d08550fbe1973370427e859b337c1a405f7cdabc |     
    arc      |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/fa05c1305156e7ef6e6cbe81a4e4fc18a8bed24b |     
    mips     |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/a76703e481e1367fecad1f1548c40b886211a2a3 |     
  mips64el   |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/55b7431a50b85c24406131af1932d6f3f6853de6 |     
   xtensa    |        poppler-21.12.0         | NOK | http://autobuild.buildroot.net/results/321403726dca95810ef0bacde144ed57db4a45d1 |     
   s390x     |           pppd-2.4.9           | NOK | http://autobuild.buildroot.net/results/7999792a67a0d10b3a2f337c2be41ad70a07bf71 | ORPH
    mips     |           pppd-2.4.9           | NOK | http://autobuild.buildroot.net/results/0e801314852d3d271791f39e34829195ce0532c6 | ORPH
  mips64el   |      python-pybind-2.9.0       | NOK | http://autobuild.buildroot.net/results/9fbe871588361eade13bf6d0e2b60c07a45e7f75 |     
    arc      |         python3-3.10.2         | NOK | http://autobuild.buildroot.net/results/18251d3e3ecf3a55fb4c69b9646e6635fa54970a |     
   nios2     |         python3-3.10.2         | NOK | http://autobuild.buildroot.net/results/37e2fe01ef73779fbba358013d969b0580f6638e |     
powerpc64le  |         python3-3.10.2         | NOK | http://autobuild.buildroot.net/results/c63cb20e6635ec70df6b473f1b41d8964fc1c858 |     
 microblaze  |         python3-3.10.2         | NOK | http://autobuild.buildroot.net/results/e241652584040a9f90ec769f24f64b653f0bda19 |     
   xtensa    |       qpid-proton-0.35.0       | NOK | http://autobuild.buildroot.net/results/d2e8b43f0ba3e31bfa7ef6c870b33c2e24c32c43 |     
  riscv32    |       qpid-proton-0.35.0       | NOK | http://autobuild.buildroot.net/results/6b7f7d481e82d166b1913dd36189ced745c24e9e |     
  riscv32    |       qpid-proton-0.35.0       | NOK | http://autobuild.buildroot.net/results/1fcec82d488dfe66bd1a7d6aa1dc8ca17f42fe50 |     
 powerpc64   |           quazip-1.2           | NOK | http://autobuild.buildroot.net/results/02272c154ce58bacf0518dab5fc1ef0084121e1a |     
   s390x     |            rauc-1.6            | NOK | http://autobuild.buildroot.net/results/6ba2ec17d3acd9404048de65ac575219e373845d |     
  riscv32    |           refpolicy            | NOK | http://autobuild.buildroot.net/results/9b2900f75198dfa710b66d1c88948ac76404b624 |     
   mips64    |           refpolicy            | NOK | http://autobuild.buildroot.net/results/b630e662fcecd5dff3102ccea4d9d485f6212a47 |     
   s390x     |           refpolicy            | NOK | http://autobuild.buildroot.net/results/97b68b5bde2b1efa2705107677252c6bfd1355d2 |     
   x86_64    |          rsync-3.2.3           | NOK | http://autobuild.buildroot.net/results/38670651ed542cbcc4d9fc39e895b5f6796f3a9c | ORPH
   mips64    |    shadowsocks-libev-3.3.5     | NOK | http://autobuild.buildroot.net/results/148bc86010bf3a56fc55ad9dbdc1d792b8958cc6 |     
   x86_64    |    shadowsocks-libev-3.3.5     | NOK | http://autobuild.buildroot.net/results/014bb53c2fe0e9e46f69521d75626a39191a0775 |     
    or1k     |    shadowsocks-libev-3.3.5     | NOK | http://autobuild.buildroot.net/results/f76b0f69a604bf26c961d8d75645378f919bb099 |     
    or1k     |        skalibs-2.10.0.3        | NOK | http://autobuild.buildroot.net/results/e04a7eba62557d244913fbd35de7cdf71d1dcd08 |     
    mips     |          tbb-2018_U5           | NOK | http://autobuild.buildroot.net/results/c1d173f808edb33579ddf3043109afc0f8568650 |     
   nios2     |   toolchain-external-bootlin   | NOK | http://autobuild.buildroot.net/results/5ed0a3340c8874305058009833d9795a7c0e5302 |     
   mips64    |   toolchain-external-bootlin   | NOK | http://autobuild.buildroot.net/results/65fed192739f312a8cbafee733d69f678bc6a317 |     
   mips64    |   toolchain-external-bootlin   | NOK | http://autobuild.buildroot.net/results/f9d86dafc887a4b4725863739558dc3a0d1eff10 |     
   nios2     |   toolchain-external-bootlin   | NOK | http://autobuild.buildroot.net/results/ad258964ec7b697fb203b4c87411ea2180572bba |     
   nios2     |   toolchain-external-bootlin   | NOK | http://autobuild.buildroot.net/results/826ffe4f64fd7fde090a20486986fed54753309e |     
 aarch64_be  | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/7beb71d7799bece4cb40220285eff9800f3e00d3 | ORPH
    sh4      | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/595a924dfd995dc48857750049f8782db0e9ca01 | ORPH
 aarch64_be  | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/0fe6a6cb48c6e0cdefb2d446cb937bef2a766a0e | ORPH
  aarch64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/28738061fb48c89c3c63ffe9c0d44955d0178aed | ORPH
 aarch64_be  | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/6ab1b90d3da037f811990e15064937956609af80 | ORPH
  aarch64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/51d70465971e0db70c566ecaa877bec934dcc61b | ORPH
microblazeel | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/f433b89259111615c3b62db031a1fe6913a8a1ab | ORPH
    arm      | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/493da8367825fe4e05dbb32d25089eb6a3e4f9a7 | ORPH
  aarch64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/cafea0a39bfd7000b4d724c6e4caf344907907ad | ORPH
 aarch64_be  | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/55fe107cabe7a2b1189f25fd424f1666ec605cd2 | ORPH
   mips64    | toolchain-external-codescap... | NOK | http://autobuild.buildroot.net/results/67b76934f1fac52a84330566df3642c6b2def3fa | ORPH
  riscv64    |           ttyd-1.6.3           | NOK | http://autobuild.buildroot.net/results/17f52abae633223f092d582caf3b579140b9859b |     
  riscv64    |           ttyd-1.6.3           | NOK | http://autobuild.buildroot.net/results/f622c35b0f7b686dc8f54ab96f857c9351626631 |     
    sh4      |           ttyd-1.6.3           | NOK | http://autobuild.buildroot.net/results/5a90c7d71644896ba4c49c519a6ede2443f5799f |     
    arc      |           ttyd-1.6.3           | NOK | http://autobuild.buildroot.net/results/90d81aa45c1252e94fabe67e311bc0d6d87e33fc |     
    arm      |           ttyd-1.6.3           | NOK | http://autobuild.buildroot.net/results/aa847b5118801638243f555fc80d7ce99f2ea2a6 |     
  powerpc    |           ttyd-1.6.3           | NOK | http://autobuild.buildroot.net/results/4db5f4d91ff47612b5d515fb7a891e53285b60df |     
    arm      |           ttyd-1.6.3           | NOK | http://autobuild.buildroot.net/results/1b0279e9b3cb9909abeb85c573ec7a27988ff368 |     
   x86_64    |           ttyd-1.6.3           | NOK | http://autobuild.buildroot.net/results/14a23f1c1887c9d8b50aa3a9db371a9584bd1742 |     
  riscv32    | tvheadend-1295dd2be863f5beb... | NOK | http://autobuild.buildroot.net/results/b2b7c7ec755bacef9e579d14daf365dbcf5df4ad |     
  riscv64    | tvheadend-1295dd2be863f5beb... | NOK | http://autobuild.buildroot.net/results/871b9f65ec5976f7de2a35c6495451b8afe60416 |     
  riscv64    | tvheadend-1295dd2be863f5beb... | NOK | http://autobuild.buildroot.net/results/b56088751ce1894db6fa6d214903937c7c5dd4ee |     
  mips64el   | tvheadend-1295dd2be863f5beb... | NOK | http://autobuild.buildroot.net/results/3c26853033b967344363738d24764be5edf57a1d |     
    or1k     | tvheadend-1295dd2be863f5beb... | NOK | http://autobuild.buildroot.net/results/704dea419c56de4bd4a6f8ac82ed0ab3a019fa74 |     
  riscv64    | tvheadend-1295dd2be863f5beb... | NOK | http://autobuild.buildroot.net/results/812886c6d18441464230e1d2f9a5ac159489b108 |     
   nios2     | tvheadend-1295dd2be863f5beb... | NOK | http://autobuild.buildroot.net/results/9fb14265cde5b7438a2ebad0c0dec894f651c0af |     
    arm      | tvheadend-1295dd2be863f5beb... | NOK | http://autobuild.buildroot.net/results/d55d28f58484f201bf506e0fc6987597f0f01d96 |     
  mips64el   | tvheadend-1295dd2be863f5beb... | NOK | http://autobuild.buildroot.net/results/48fd9e12bc6f3a184f6a7257700c3c0b45cb5a1c |     
    sh4      | tvheadend-1295dd2be863f5beb... | NOK | http://autobuild.buildroot.net/results/90e5c8edb30a41884fc54154825013278df279f4 |     
    or1k     | tvheadend-1295dd2be863f5beb... | NOK | http://autobuild.buildroot.net/results/d3963a7425e55cdeb3d786ab405cf0947393f8bc |     
    arm      | tvheadend-1295dd2be863f5beb... | NOK | http://autobuild.buildroot.net/results/53b5d998075ef056e778967cf2b3401c534d75f5 |     
    arm      |          uacme-1.7.1           | NOK | http://autobuild.buildroot.net/results/71046951e02c8cba1272aebc89d4934d3bb22c61 |     
  sparc64    |          uacme-1.7.1           | NOK | http://autobuild.buildroot.net/results/eebe757d784334dada5a8b014bd485623c6a6c9a |     
    arm      |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/804ba1b697756deaa019aea13fd880e2218af4c6 |     
   xtensa    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/28e5b28f5e71d276d769e41d30e2537c2c1303db |     
   arceb     |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/1bf886867a759f5a063cdd3eac9873c9cff3c8be |     
   xtensa    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/ed3c24200d8d39ab094b161e650b3743948213a6 |     
   xtensa    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/33dbe9ca79d16a57bb53e8e75d6e8aff0c59141b |     
    arm      |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/bcf4aed74215cf35885943e918e21fadf0862b12 |     
   xtensa    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/ad2689f76169be78592445555a76d01199d605a8 |     
    arc      |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/564cfc724533d0e5fb80af42d21f0d2913fe2fb9 |     
   xtensa    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/6d46facbe370457aec2e5232fc815725e6833ff6 |     
  powerpc    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/a2c6acd68435ca01da2293a479e70b2efbf1ae80 |     
    arm      |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/897a07972941dc62f36e5aa88a01a7feaf350071 |     
   xtensa    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/fbf07e73966110c08c98026c77c1205cdba02e1d |     
  powerpc    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/438f12c87becb7f9835485f05cb4a31018f515ad |     
   arceb     |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/ffbb99608f4108b82b3979580d39cb870583f147 |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/ec6dcf8e5762b59e3b64234302c2055b53e05a45 |     
   nios2     |         usbguard-1.1.1         | NOK | http://autobuild.buildroot.net/results/700296606f1a79dcb61904874816358173b1071e |     
    mips     |        util-linux-2.38         | NOK | http://autobuild.buildroot.net/results/384e3a2cee738a9e41ad499a714888e3fbd84386 | ORPH
   mips64    |        valgrind-3.18.1         | NOK | http://autobuild.buildroot.net/results/99da15fcf4bfb2b70fd3def9884086c55b4ddeef | ORPH
  powerpc    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/62ae9538dd52d48ad3413117a0692106f6c4312b |     
   x86_64    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/75786930ac5e25753e1e063f0ccb048dccf48280 |     
    i686     | x264-35417dcd65a57321fbadf9... | NOK | http://autobuild.buildroot.net/results/08011e939f9d2ed949392656d744c53b1bb07117 |     
   x86_64    |            xenomai             | NOK | http://autobuild.buildroot.net/results/a50a2225c3cb295fb454da79fd0806838b0a12b3 |     
    or1k     |         xenomai-custom         | NOK | http://autobuild.buildroot.net/results/2d85c3673d80dcfd9dbf80a6eb5d197a2f5dbf94 |     
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/ad372e06a1754274bec43074ca8246bfadec2f5d | ORPH
  aarch64    |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/020ad807e98337c68b83334dce0c69447392ed53 | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/dfd95bb65ca677b8589df99b8e2b686c5e8cf359 | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/0735e7c920595f9ca3d5aec4945a45f1553bd197 | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/efc1a8279dc5d4d1ff4450a673eb3efcd315e0fe | ORPH
 microblaze  |           zstd-1.5.2           | NOK | http://autobuild.buildroot.net/results/43c2cf78d42304d16b0ec3f86976b0275856a898 |     


Classification of failures by reason for 2022.02.x
--------------------------------------------------

                       frr-8.1 | 1 
                  jack2-1.9.20 | 1 
   openvmtools-10.3.5-10430147 | 1 
               sdl2_ttf-2.0.18 | 1 
tvheadend-1295dd2be863f5beb... | 1 


Detail of failures for 2022.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   xtensa    |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/516f404e2f291f2057ecca5c8279b77eb8833693 |     
    m68k     |          jack2-1.9.20          | NOK | http://autobuild.buildroot.net/results/3dde3b8399056a0c99981e92942697d35170bf98 |     
   x86_64    |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/c463a1e7cb04ec1916f9c438c4d199b9b8891d6e |     
    arm      |        sdl2_ttf-2.0.18         | NOK | http://autobuild.buildroot.net/results/f6f862a74a0df8f01e5836784f7917ee9ef5a6e9 |     
    arc      | tvheadend-1295dd2be863f5beb... | NOK | http://autobuild.buildroot.net/results/75c193653f54eb584d33a00d8ebb877bbde560a3 |     


Packages having a newer version
===============================

             name              | found by |        link to release-monitoring.org        |   version    |   upstream   | orph?
-------------------------------+----------+----------------------------------------------+--------------+--------------+-------
                        acpica |  DISTRO  | https://release-monitoring.org/project/00018 | 20200717     | 20220331     |     
            adwaita-icon-theme |  DISTRO  | https://release-monitoring.org/project/13117 | 3.37.2       | 42.0         |     
                       agentpp |  DISTRO  | https://release-monitoring.org/project/21316 | 4.5.3        | 4.5.4        |     
                      alsa-lib |  DISTRO  | https://release-monitoring.org/project/00038 | 1.2.6        | 1.2.6.1      |     
                 android-tools |  GUESS   | https://release-monitoring.org/project/13989 | 4.2.2+git... | 12.1.0_r4    |     
                     angularjs |  DISTRO  | https://release-monitoring.org/project/21321 | 1.8.2        | 1.8.3        |     
                     armadillo |  DISTRO  | https://release-monitoring.org/project/07006 | 9.900.2      | 11.0.1       |     
                        assimp |  DISTRO  | https://release-monitoring.org/project/06988 | 5.2.1        | 5.2.3        |     
                      asterisk |  DISTRO  | https://release-monitoring.org/project/09838 | 16.25.2      | 19.3.2       |     
                   at-spi2-atk |  DISTRO  | https://release-monitoring.org/project/07840 | 2.34.2       | 2.38.0       |     
                  at-spi2-core |  DISTRO  | https://release-monitoring.org/project/07841 | 2.36.0       | 2.44.0       |     
                         audit |  DISTRO  | https://release-monitoring.org/project/15225 | 3.0.7        | 3.0.8        |     
              autoconf-archive |  DISTRO  | https://release-monitoring.org/project/00142 | 2021.02.19   | 2022.02.11   |     
               azure-iot-sdk-c |  DISTRO  | https://release-monitoring.org/project/21322 | LTS_01_20... | 3033-01-05   |     
                        babeld |  DISTRO  | https://release-monitoring.org/project/00154 | 1.9.2        | 1.11         | ORPH
                 balena-engine |  DISTRO  | https://release-monitoring.org/project/141616 | 20.10.12     | 20.10.16     | ORPH
                           bat |  DISTRO  | https://release-monitoring.org/project/241901 | 0.19.0       | 0.20.0       |     
                        batctl |  DISTRO  | https://release-monitoring.org/project/14740 | 2021.0       | 2022.0       |     
                    batman-adv |  DISTRO  | https://release-monitoring.org/project/19529 | 2021.4       | 2022.0       |     
                     bats-core |  DISTRO  | https://release-monitoring.org/project/10587 | 1.4.1        | 1.6.0        |     
                        bcg729 |  DISTRO  | https://release-monitoring.org/project/14743 | 1.0.4        | 1.1.1        |     
                     bctoolbox |  DISTRO  | https://release-monitoring.org/project/14746 | 4.4.8        | 5.1.17       | ORPH
                         bdwgc |  DISTRO  | https://release-monitoring.org/project/17108 | 8.0.6        | 8.2.0        |     
                     belle-sip |  DISTRO  | https://release-monitoring.org/project/14378 | 4.4.8        | 5.1.12       |     
                          belr |  DISTRO  | https://release-monitoring.org/project/80042 | 4.4.8        | 5.1.12       |     
                    berkeleydb |  GUESS   | https://release-monitoring.org/project/138386 | 5.3.28       | 18.1.5       | ORPH
                          bind |  DISTRO  | https://release-monitoring.org/project/14923 | 9.16.27      | 9.18.1       | ORPH
                      binutils |  DISTRO  | https://release-monitoring.org/project/07981 | 2.36.1       | 2.38         |     
                          bird |  DISTRO  | https://release-monitoring.org/project/00192 | 2.0.8        | 2.0.9        |     
                       bitcoin |  DISTRO  | https://release-monitoring.org/project/13618 | 0.21.2       | 22.0         |     
                        bonnie |  DISTRO  | https://release-monitoring.org/project/00212 | 1.03e        | 2.00a        | ORPH
                         boost |  DISTRO  | https://release-monitoring.org/project/06845 | 1.78.0       | 1.79.0       |     
                     bootstrap |  DISTRO  | https://release-monitoring.org/project/21578 | 4.3.1        | 5.1.3        |     
                        bullet |  DISTRO  | https://release-monitoring.org/project/07669 | 3.21         | 3.22b        |     
                        c-icap |  DISTRO  | https://release-monitoring.org/project/21325 | 0.5.7        | 0.5.9        | ORPH
                c-icap-modules |  DISTRO  | https://release-monitoring.org/project/21326 | 0.5.4        | 0.5.5        | ORPH
                         cairo |  DISTRO  | https://release-monitoring.org/project/00247 | 1.16.0       | 1.17.6       |     
                     cantarell |  DISTRO  | https://release-monitoring.org/project/10888 | 0.0.25       | 0.303.1      | ORPH
                        ccache |  DISTRO  | https://release-monitoring.org/project/00257 | 3.7.12       | 4.6          | ORPH
                          ccid |  DISTRO  | https://release-monitoring.org/project/02612 | 1.4.34       | 1.5.0        | ORPH
                        cereal |  DISTRO  | https://release-monitoring.org/project/11606 | 1.3.1        | 1.3.2        |     
                       chartjs |  DISTRO  | https://release-monitoring.org/project/85785 | 2.9.4        | 3.7.1        |     
                   checkpolicy |  DISTRO  | https://release-monitoring.org/project/00276 | 3.3          | 20200710     |     
                    cifs-utils |  DISTRO  | https://release-monitoring.org/project/00287 | 6.13         | 6.14         |     
                        circus |  DISTRO  | https://release-monitoring.org/project/21726 | 0.16.1       | 0.17.1       |     
                        clamav |  DISTRO  | https://release-monitoring.org/project/00291 | 0.103.5      | 0.104.2      |     
                         clang |  DISTRO  | https://release-monitoring.org/project/11811 | 9.0.1        | 14.0.1       |     
                         cmake |  DISTRO  | https://release-monitoring.org/project/00306 | 3.18.6       | 3.23.1       |     
                           cog |  DISTRO  | https://release-monitoring.org/project/21333 | 0.12.4       | 0.13.3       |     
                      collectl |  DISTRO  | https://release-monitoring.org/project/00330 | 4.3.2        | 4.3.3        |     
                     coreutils |  DISTRO  | https://release-monitoring.org/project/00343 | 9.0          | 9.1          | ORPH
                  cups-filters |  DISTRO  | https://release-monitoring.org/project/05541 | 1.28.12      | 1.28.15      |     
                      cutelyst |  DISTRO  | https://release-monitoring.org/project/21335 | 2.11.0       | 3.4.0        |     
                        dacapo |  DISTRO  | https://release-monitoring.org/project/20546 | 9.12-MR1-... | 9.12-vbump   |     
                          daq3 |  DISTRO  | https://release-monitoring.org/project/212345 | 3.0.5        | 3.0.6        |     
                    datatables |  DISTRO  | https://release-monitoring.org/project/141588 | 1.10.20      | 1.11.5       |     
            datatables-buttons |  DISTRO  | https://release-monitoring.org/project/141589 | 1.6.1        | 2.2.2        |     
       datatables-fixedcolumns |  DISTRO  | https://release-monitoring.org/project/141590 | 3.3.0        | 4.0.2        |     
         datatables-responsive |  DISTRO  | https://release-monitoring.org/project/141591 | 2.2.3        | 2.2.9        |     
                          dbus |  DISTRO  | https://release-monitoring.org/project/05356 | 1.12.22      | 1.14.0       | ORPH
                         dc3dd |  DISTRO  | https://release-monitoring.org/project/15086 | 7.2.641      | 7.2.646      | ORPH
                   debianutils |  DISTRO  | https://release-monitoring.org/project/21341 | 4.11         | 5.7          | ORPH
                         delve |  DISTRO  | https://release-monitoring.org/project/40149 | 1.8.0        | 1.8.2        |     
                        dialog |  DISTRO  | https://release-monitoring.org/project/00431 | 1.3-20220117 | 1.3-20220414 | ORPH
                docker-compose |  DISTRO  | https://release-monitoring.org/project/06185 | 1.24.1       | 2.4.1        |     
                    drbd-utils |  DISTRO  | https://release-monitoring.org/project/00462 | 9.19.0       | 9.20.2       |     
                      dropbear |  DISTRO  | https://release-monitoring.org/project/00466 | 2020.81      | 2022.82      |     
                            dt |  DISTRO  | https://release-monitoring.org/project/21844 | 18.32        | 21.27        | ORPH
                      earlyoom |  DISTRO  | https://release-monitoring.org/project/17392 | 1.6.2        | 1.7          |     
                          edk2 |  DISTRO  | https://release-monitoring.org/project/125953 | edk2-stab... | 202202       |     
                        efivar |  DISTRO  | https://release-monitoring.org/project/00664 | 37           | 38           |     
                           efl |  DISTRO  | https://release-monitoring.org/project/06128 | 1.26.1       | 1.26.2       |     
                         eigen |  DISTRO  | https://release-monitoring.org/project/00666 | 3.3.7        | 3.4.0        |     
                      ejabberd |  DISTRO  | https://release-monitoring.org/project/00667 | 20.07        | 21.12        |     
                        elixir |  DISTRO  | https://release-monitoring.org/project/00673 | 1.9.4        | 1.13.4       |     
                       enchant |  DISTRO  | https://release-monitoring.org/project/06601 | 2.3.2        | 2.3.3        |     
                 enlightenment |  DISTRO  | https://release-monitoring.org/project/00698 | 0.25.1       | 0.25.3       |     
                        erlang |  DISTRO  | https://release-monitoring.org/project/00707 | 22.3.4.22    | 24.3.3       |     
                   erlang-eimp |  DISTRO  | https://release-monitoring.org/project/17060 | 1.0.17       | 1.0.21       |     
               erlang-goldrush |  DISTRO  | https://release-monitoring.org/project/09692 | 0.1.9        | 0.2.0        |     
                   erlang-idna |  DISTRO  | https://release-monitoring.org/project/45374 | 6.0.0        | 6.1.1        |     
                   erlang-jose |  DISTRO  | https://release-monitoring.org/project/16913 | 1.9.0        | 1.11.2       |     
                  erlang-lager |  DISTRO  | https://release-monitoring.org/project/00727 | 3.6.10       | 3.9.2        |     
                erlang-p1-acme |  DISTRO  | https://release-monitoring.org/project/45375 | 1.0.9        | 1.0.18       |     
           erlang-p1-cache-tab |  DISTRO  | https://release-monitoring.org/project/08757 | 1.0.25       | 1.0.29       |     
              erlang-p1-mqtree |  DISTRO  | https://release-monitoring.org/project/20220 | 1.0.10       | 1.0.14       |     
              erlang-p1-oauth2 |  DISTRO  | https://release-monitoring.org/project/09302 | 0.6.7        | 0.8.0        |     
                erlang-p1-pkix |  DISTRO  | https://release-monitoring.org/project/20539 | 1.0.6        | 1.0.8        |     
                 erlang-p1-sip |  DISTRO  | https://release-monitoring.org/project/10576 | 1.0.38       | 1.0.45       |     
          erlang-p1-stringprep |  DISTRO  | https://release-monitoring.org/project/09222 | 1.0.23       | 1.0.27       |     
                erlang-p1-stun |  DISTRO  | https://release-monitoring.org/project/09151 | 1.0.39       | 1.2.0        |     
                 erlang-p1-tls |  DISTRO  | https://release-monitoring.org/project/10455 | 1.1.9        | 1.1.13       |     
               erlang-p1-utils |  DISTRO  | https://release-monitoring.org/project/08643 | 1.0.20       | 1.0.24       |     
                 erlang-p1-xml |  DISTRO  | https://release-monitoring.org/project/10464 | 1.1.44       | 1.1.48       |     
                erlang-p1-xmpp |  DISTRO  | https://release-monitoring.org/project/12752 | 1.4.10       | 1.5.6        |     
                erlang-p1-yaml |  DISTRO  | https://release-monitoring.org/project/10243 | 1.0.28       | 1.0.32       |     
               erlang-p1-yconf |  DISTRO  | https://release-monitoring.org/project/45378 | 1.0.8        | 1.0.12       |     
                erlang-p1-zlib |  DISTRO  | https://release-monitoring.org/project/09283 | 1.0.9        | 1.0.10       |     
                       ethtool |  DISTRO  | https://release-monitoring.org/project/00763 | 5.15         | 5.17         |     
                      execline |  DISTRO  | https://release-monitoring.org/project/05482 | 2.8.0.1      | 2.8.3.0      |     
                         expat |  DISTRO  | https://release-monitoring.org/project/00770 | 2.4.7        | 2.4.8        |     
                      fakeroot |  DISTRO  | https://release-monitoring.org/project/12048 | 1.26         | 1.28         | ORPH
                           feh |  DISTRO  | https://release-monitoring.org/project/00790 | 3.7.1        | 3.8          |     
                        ffmpeg |  DISTRO  | https://release-monitoring.org/project/05405 | 4.4.1        | 5.0.1        |     
                   fftw-double |  DISTRO  | https://release-monitoring.org/project/00803 | 3.3.8        | 3.3.10       | ORPH
              fftw-long-double |  DISTRO  | https://release-monitoring.org/project/00803 | 3.3.8        | 3.3.10       | ORPH
                     fftw-quad |  DISTRO  | https://release-monitoring.org/project/00803 | 3.3.8        | 3.3.10       | ORPH
                   fftw-single |  DISTRO  | https://release-monitoring.org/project/00803 | 3.3.8        | 3.3.10       | ORPH
                           fio |  DISTRO  | https://release-monitoring.org/project/00806 | 3.28         | 3.30         |     
                       flannel |  DISTRO  | https://release-monitoring.org/project/07421 | 0.14.0       | 0.17.0       |     
                  flare-engine |  DISTRO  | https://release-monitoring.org/project/21433 | 1.12         | 1.13.04      |     
                    flare-game |  DISTRO  | https://release-monitoring.org/project/21434 | 1.12         | 1.13.04      |     
                          flot |  DISTRO  | https://release-monitoring.org/project/07184 | 0.8.3        | 4.2.2        | ORPH
                          fltk |  DISTRO  | https://release-monitoring.org/project/00823 | 1.3.7        | 1.3.8        | ORPH
                           fmc |  GUESS   | https://release-monitoring.org/project/145761 | fsl-sdk-v2.0 | 0.2.0        |     
                  font-awesome |  DISTRO  | https://release-monitoring.org/project/00826 | 4.7.0        | 6.1.1        | ORPH
                    fontconfig |  DISTRO  | https://release-monitoring.org/project/00827 | 2.13.1       | 2.14.0       | ORPH
                         frotz |  DISTRO  | https://release-monitoring.org/project/36391 | 2.53         | 2.54         |     
                fuse-overlayfs |  DISTRO  | https://release-monitoring.org/project/101220 | 1.5.0        | 1.8.2        |     
                          fwts |  DISTRO  | https://release-monitoring.org/project/17383 | 21.11.00     | 22.03.00     |     
                        gauche |  DISTRO  | https://release-monitoring.org/project/00873 | 0.9.9        | 0.9.11       |     
                           gcr |  DISTRO  | https://release-monitoring.org/project/11801 | 3.40.0       | 3.41.0       | ORPH
                          gdbm |  DISTRO  | https://release-monitoring.org/project/00882 | 1.22         | 1.23         | ORPH
                    gdk-pixbuf |  DISTRO  | https://release-monitoring.org/project/09533 | 2.42.4       | 2.42.8       | ORPH
                        gensio |  DISTRO  | https://release-monitoring.org/project/67634 | 2.2.9        | 2.3.6        |     
                   gettext-gnu |  DISTRO  | https://release-monitoring.org/project/00898 | 0.20.1       | 0.21         | ORPH
                   ghostscript |  DISTRO  | https://release-monitoring.org/project/01157 | 9.55.0       | 9.56.1       |     
                           git |  DISTRO  | https://release-monitoring.org/project/05350 | 2.31.2       | 2.35.3       |     
               glib-networking |  DISTRO  | https://release-monitoring.org/project/21353 | 2.70.1       | 2.72.0       | ORPH
                        glibmm |  DISTRO  | https://release-monitoring.org/project/07960 | 2.68.2       | 2.72.0       |     
                           glm |  DISTRO  | https://release-monitoring.org/project/01181 | 0.9.9.5      | 0.9.9.8      | ORPH
                          glog |  DISTRO  | https://release-monitoring.org/project/08732 | 0.5.0        | 0.6.0        |     
                       gnu-efi |  DISTRO  | https://release-monitoring.org/project/01202 | 3.0.10       | 3.0.14       |     
                        gnupg2 |  DISTRO  | https://release-monitoring.org/project/01215 | 2.2.32       | 2.3.4        | ORPH
                      gnuradio |  DISTRO  | https://release-monitoring.org/project/01217 | 3.8.2.0      | 3.10.2.0     |     
                            go |  DISTRO  | https://release-monitoring.org/project/01227 | 1.17.9       | 1.18.1       |     
         gobject-introspection |  DISTRO  | https://release-monitoring.org/project/01223 | 1.70.0       | 1.72.0       | ORPH
                      gptfdisk |  DISTRO  | https://release-monitoring.org/project/00885 | 1.0.8        | 1.0.9        |     
                          gqrx |  DISTRO  | https://release-monitoring.org/project/09771 | 2.14.4       | 2.15.9       |     
                       granite |  DISTRO  | https://release-monitoring.org/project/05410 | 6.0.0        | 6.2.0        | ORPH
                graphicsmagick |  DISTRO  | https://release-monitoring.org/project/01248 | 1.3.37       | 1.3.38       |     
                          grpc |  DISTRO  | https://release-monitoring.org/project/19117 | 1.44.0       | 1.45.2       |     
                         grub2 |  DISTRO  | https://release-monitoring.org/project/01257 | 2.04         | 2.06         |     
     gsettings-desktop-schemas |  DISTRO  | https://release-monitoring.org/project/13139 | 3.36.1       | 42.0         | ORPH
                           gsl |  DISTRO  | https://release-monitoring.org/project/01267 | 2.6          | 2.7.1        | ORPH
                      gst1-imx |  DISTRO  | https://release-monitoring.org/project/21846 | 0.13.1       | 2.0.0        |     
                        gtkmm3 |  DISTRO  | https://release-monitoring.org/project/07963 | 3.22.0       | 4.6.1        |     
                 gtksourceview |  DISTRO  | https://release-monitoring.org/project/07724 | 3.24.7       | 5.4.0        |     
                    gutenprint |  DISTRO  | https://release-monitoring.org/project/01285 | 5.2.14       | 5.3.4        | ORPH
                          gvfs |  DISTRO  | https://release-monitoring.org/project/05496 | 1.48.1       | 1.50.0       | ORPH
                          gzip |  DISTRO  | https://release-monitoring.org/project/01290 | 1.11         | 1.12         | ORPH
                        hackrf |  DISTRO  | https://release-monitoring.org/project/06136 | 2018.01.1    | 2021.03.1    | ORPH
                       haproxy |  DISTRO  | https://release-monitoring.org/project/01298 | 2.4.15       | 2.5.5        |     
                       haveged |  DISTRO  | https://release-monitoring.org/project/11695 | 1.9.15       | 1.9.18       |     
                        hidapi |  DISTRO  | https://release-monitoring.org/project/05594 | 0.11.0       | 0.11.2       | ORPH
                         hplip |  DISTRO  | https://release-monitoring.org/project/01327 | 3.17.10      | 3.22.2       | ORPH
                        hwdata |  DISTRO  | https://release-monitoring.org/project/05387 | 0.355        | 0.358        | ORPH
                         hwloc |  DISTRO  | https://release-monitoring.org/project/13501 | 2.7.0        | 2.7.1        |     
                          i2pd |  DISTRO  | https://release-monitoring.org/project/21355 | 2.40.0       | 2.41.0       |     
                           icu |  DISTRO  | https://release-monitoring.org/project/16134 | 70-1         | 71-1         | ORPH
                     ifenslave |  DISTRO  | https://release-monitoring.org/project/21670 | 2.9          | 2.13         | ORPH
                      ifupdown |  DISTRO  | https://release-monitoring.org/project/21673 | 0.8.16       | 0.8.37       | ORPH
                   imagemagick |  DISTRO  | https://release-monitoring.org/project/01372 | 7.1.0-19     | 7.1.0-30     | ORPH
                        imlib2 |  DISTRO  | https://release-monitoring.org/project/21676 | 1.7.3        | 1.8.1        |     
                          inih |  DISTRO  | https://release-monitoring.org/project/11600 | 53           | 55           |     
                 inotify-tools |  DISTRO  | https://release-monitoring.org/project/08864 | 3.20.2.2     | 3.22.1.0     | ORPH
               intel-microcode |  DISTRO  | https://release-monitoring.org/project/20614 | 20210608     | 20220207     | ORPH
                         iperf |  DISTRO  | https://release-monitoring.org/project/01388 | 2.1.6        | 2.1.7        |     
                        iperf3 |  DISTRO  | https://release-monitoring.org/project/01389 | 3.10.1       | 3.11         |     
                      irrlicht |  DISTRO  | https://release-monitoring.org/project/01403 | 1.8.4        | 1.8.5        |     
                           isl |  DISTRO  | https://release-monitoring.org/project/13286 | 0.23         | 0.24         | ORPH
                           iwd |  DISTRO  | https://release-monitoring.org/project/18380 | 1.25         | 1.26         |     
                         jack2 |  DISTRO  | https://release-monitoring.org/project/21358 | 1.9.20       | 1.9.21       |     
                         janet |  DISTRO  | https://release-monitoring.org/project/155612 | 1.19.2       | 1.21.2       |     
                 janus-gateway |  DISTRO  | https://release-monitoring.org/project/15715 | 0.11.6       | 1.0.0        |     
                        jasper |  DISTRO  | https://release-monitoring.org/project/01421 | 2.0.33       | 3.0.3        |     
         jitterentropy-library |  DISTRO  | https://release-monitoring.org/project/29701 | 3.3.1        | 3.4.0        |     
         jquery-datetimepicker |  DISTRO  | https://release-monitoring.org/project/13910 | 2.4.5        | 2.5.20       |     
               jquery-keyboard |  DISTRO  | https://release-monitoring.org/project/21681 | 1.18.12      | 1.30.4       | ORPH
                 jquery-mobile |  DISTRO  | https://release-monitoring.org/project/59395 | 1.4.3        | 1.4.5        | ORPH
                     jquery-ui |  DISTRO  | https://release-monitoring.org/project/21815 | 1.10.4       | 1.13.1       |     
              jquery-ui-themes |  DISTRO  | https://release-monitoring.org/project/21816 | 1.10.4       | 1.13.1       |     
                        json-c |  DISTRO  | https://release-monitoring.org/project/01477 | 0.15         | 0.16         |     
                         jszip |  DISTRO  | https://release-monitoring.org/project/141558 | 3.2.2        | 3.9.1        |     
                         kexec |  DISTRO  | https://release-monitoring.org/project/12689 | 2.0.23       | 2.0.24       | ORPH
       kf5-extra-cmake-modules |  DISTRO  | https://release-monitoring.org/project/08762 | 5.91.0       | 5.93.0       |     
               kf5-kcoreaddons |  DISTRO  | https://release-monitoring.org/project/08762 | 5.91.0       | 5.93.0       |     
           kf5-modemmanager-qt |  DISTRO  | https://release-monitoring.org/project/08762 | 5.91.0       | 5.93.0       |     
         kf5-networkmanager-qt |  DISTRO  | https://release-monitoring.org/project/08762 | 5.91.0       | 5.93.0       |     
     kodi-audiodecoder-modplug |  DISTRO  | https://release-monitoring.org/project/21818 | 19.0.2-Ma... | 20.2.0-Nexus |     
    kodi-audiodecoder-nosefart |  DISTRO  | https://release-monitoring.org/project/21819 | 19.0.2-Ma... | 20.2.0-Nexus |     
     kodi-audiodecoder-sidplay |  DISTRO  | https://release-monitoring.org/project/21820 | 19.0.1-Ma... | 20.2.0-Nexus |     
     kodi-audiodecoder-snesapu |  DISTRO  | https://release-monitoring.org/project/21802 | 19.0.2-Ma... | 20.2.0-Nexus |     
     kodi-audiodecoder-stsound |  DISTRO  | https://release-monitoring.org/project/21801 | 19.0.1-Ma... | 20.2.0-Nexus |     
    kodi-audiodecoder-timidity |  DISTRO  | https://release-monitoring.org/project/21800 | 19.0.2-Ma... | 20.2.0-Nexus |     
   kodi-audiodecoder-vgmstream |  DISTRO  | https://release-monitoring.org/project/21799 | 19.0.0-Ma... | 20.2.0-Nexus |     
        kodi-audioencoder-flac |  DISTRO  | https://release-monitoring.org/project/17755 | 19.0.1-Ma... | 20.2.0-Nexus |     
        kodi-audioencoder-lame |  DISTRO  | https://release-monitoring.org/project/21798 | 19.1.2-Ma... | 20.3.0-Nexus |     
      kodi-audioencoder-vorbis |  DISTRO  | https://release-monitoring.org/project/21797 | 19.0.1-Ma... | 20.2.0-Nexus |     
         kodi-audioencoder-wav |  DISTRO  | https://release-monitoring.org/project/21796 | 19.0.1-Ma... | 20.2.0-Nexus |     
     kodi-inputstream-adaptive |  DISTRO  | https://release-monitoring.org/project/21795 | 19.0.3-Ma... | 20.1.2-Nexus |     
 kodi-inputstream-ffmpegdirect |  DISTRO  | https://release-monitoring.org/project/177174 | 19.0.1-Ma... | 20.1.0-Nexus |     
         kodi-inputstream-rtmp |  DISTRO  | https://release-monitoring.org/project/21794 | 19.0.1-Ma... | 20.1.0-Nexus |     
      kodi-peripheral-joystick |  DISTRO  | https://release-monitoring.org/project/21793 | 19.0.1-Ma... | 20.1.0-Nexus |     
       kodi-peripheral-xarcade |  DISTRO  | https://release-monitoring.org/project/21791 | 19.0.1-Ma... | 20.1.1-Nexus |     
              kodi-pvr-argustv |  DISTRO  | https://release-monitoring.org/project/21788 | 19.2.1-Ma... | 20.4.1-Nexus |     
              kodi-pvr-dvblink |  DISTRO  | https://release-monitoring.org/project/21787 | 19.0.1-Ma... | 20.2.0-Nexus |     
            kodi-pvr-dvbviewer |  DISTRO  | https://release-monitoring.org/project/21786 | 19.0.2-Ma... | 20.2.0-Nexus |     
               kodi-pvr-filmon |  DISTRO  | https://release-monitoring.org/project/21785 | 19.0.1-Ma... | 20.2.1-Nexus |     
            kodi-pvr-hdhomerun |  DISTRO  | https://release-monitoring.org/project/21784 | 19.1.0-Ma... | 20.3.0-Nexus |     
                  kodi-pvr-hts |  DISTRO  | https://release-monitoring.org/project/21783 | 19.0.6-Ma... | 20.2.2-Nexus |     
           kodi-pvr-iptvsimple |  DISTRO  | https://release-monitoring.org/project/21782 | 19.1.0-Ma... | 20.3.0-Nexus |     
 kodi-pvr-mediaportal-tvserver |  DISTRO  | https://release-monitoring.org/project/21781 | 19.0.2-Ma... | 20.2.0-Nexus |     
               kodi-pvr-mythtv |  DISTRO  | https://release-monitoring.org/project/21780 | 19.0.8-Ma... | 20.2.5-Nexus |     
              kodi-pvr-nextpvr |  DISTRO  | https://release-monitoring.org/project/21779 | 19.0.3-Ma... | 20.2.3-Nexus |     
                 kodi-pvr-njoy |  DISTRO  | https://release-monitoring.org/project/21778 | 19.0.1-Ma... | 20.2.0-Nexus |     
              kodi-pvr-octonet |  DISTRO  | https://release-monitoring.org/project/100437 | 19.0.0-Ma... | 20.2.0-Nexus |     
                 kodi-pvr-pctv |  DISTRO  | https://release-monitoring.org/project/21777 | 19.0.1-Ma... | 20.3.0-Nexus |     
              kodi-pvr-plutotv |  DISTRO  | https://release-monitoring.org/project/241527 | 19.0.3-Ma... | 20.1.0-Nexus |     
              kodi-pvr-stalker |  DISTRO  | https://release-monitoring.org/project/21776 | 19.0.2-Ma... | 20.2.1-Nexus |     
                 kodi-pvr-vbox |  DISTRO  | https://release-monitoring.org/project/21775 | 19.0.0-Ma... | 20.2.0-Nexus |     
             kodi-pvr-vdr-vnsi |  DISTRO  | https://release-monitoring.org/project/21774 | 19.0.3-Ma... | 20.2.2-Nexus |     
               kodi-pvr-vuplus |  DISTRO  | https://release-monitoring.org/project/21773 | 19.0.0-Ma... | 20.2.0-Nexus |     
                kodi-pvr-waipu |  DISTRO  | https://release-monitoring.org/project/241529 | 19.2.1-Ma... | 20.4.2-Nexus |     
                  kodi-pvr-wmc |  DISTRO  | https://release-monitoring.org/project/21772 | 19.0.2-Ma... | 20.2.1-Nexus |     
               kodi-pvr-zattoo |  DISTRO  | https://release-monitoring.org/project/100438 | 19.7.11-M... | 20.2.1-Nexus |     
    kodi-screensaver-asteroids |  DISTRO  | https://release-monitoring.org/project/21771 | 19.0.1-Ma... | 20.1.0-Nexus |     
    kodi-screensaver-asterwave |  DISTRO  | https://release-monitoring.org/project/21770 | 19.0.1-Ma... | 20.1.0-Nexus |     
   kodi-screensaver-biogenesis |  DISTRO  | https://release-monitoring.org/project/21768 | 19.0.1-Ma... | 20.1.0-Nexus |     
      kodi-screensaver-cpblobs |  DISTRO  | https://release-monitoring.org/project/21767 | 19.0.1-Ma... | 20.1.0-Nexus |     
    kodi-screensaver-greynetic |  DISTRO  | https://release-monitoring.org/project/21765 | 19.0.1-Ma... | 20.1.0-Nexus |     
 kodi-screensaver-matrixtrails |  DISTRO  | https://release-monitoring.org/project/21764 | 19.0.1-Ma... | 20.1.0-Nexus |     
     kodi-screensaver-pingpong |  DISTRO  | https://release-monitoring.org/project/21763 | 19.0.1-Ma... | 20.1.0-Nexus |     
         kodi-screensaver-pyro |  DISTRO  | https://release-monitoring.org/project/21761 | 19.0.1-Ma... | 20.1.0-Nexus |     
         kodi-screensaver-rsxs |  DISTRO  | https://release-monitoring.org/project/21760 | 19.0.2-Ma... | 20.1.0-Nexus |     
        kodi-screensaver-stars |  DISTRO  | https://release-monitoring.org/project/21759 | 19.0.0-Ma... | 20.1.0-Nexus |     
           kodi-vfs-libarchive |  DISTRO  | https://release-monitoring.org/project/177173 | 19.0.1-Ma... | 20.1.0-Nexus |     
                  kodi-vfs-rar |  DISTRO  | https://release-monitoring.org/project/21900 | 19.0.1-Ma... | 20.1.0-Nexus |     
                 kodi-vfs-sftp |  DISTRO  | https://release-monitoring.org/project/21899 | 19.0.1-Ma... | 20.1.0-Nexus |     
    kodi-visualisation-fishbmc |  DISTRO  | https://release-monitoring.org/project/21758 | 19.0.1-Ma... | 20.1.0-Nexus |     
       kodi-visualisation-goom |  DISTRO  | https://release-monitoring.org/project/21757 | 19.0.1-Ma... | 20.1.0-Nexus |     
     kodi-visualisation-matrix |  DISTRO  | https://release-monitoring.org/project/177172 | 19.0.1-Ma... | 20.1.0-Nexus |     
  kodi-visualisation-shadertoy |  DISTRO  | https://release-monitoring.org/project/21756 | 19.1.2-Ma... | 20.2.0-Nexus |     
   kodi-visualisation-spectrum |  DISTRO  | https://release-monitoring.org/project/21755 | 19.0.1-Ma... | 20.1.0-Nexus |     
  kodi-visualisation-starburst |  DISTRO  | https://release-monitoring.org/project/85703 | 19.0.1-Ma... | 20.1.0-Nexus |     
   kodi-visualisation-waveform |  DISTRO  | https://release-monitoring.org/project/21753 | 19.0.2-Ma... | 20.1.0-Nexus |     
                       kvazaar |  DISTRO  | https://release-monitoring.org/project/12418 | 1.2.0        | 2.1.0        |     
                        lapack |  DISTRO  | https://release-monitoring.org/project/01534 | 3.10.0       | 3.10.1       |     
                         lcms2 |  DISTRO  | https://release-monitoring.org/project/09815 | 2.13         | 2.13.1       |     
                       lensfun |  DISTRO  | https://release-monitoring.org/project/01548 | 0.3.2        | 0.3.95       |     
                        libaio |  DISTRO  | https://release-monitoring.org/project/01557 | 0.3.112      | 0.3.113      | ORPH
                         libao |  DISTRO  | https://release-monitoring.org/project/07629 | 1.2.0        | 1.2.2        | ORPH
                    libarchive |  DISTRO  | https://release-monitoring.org/project/01558 | 3.5.3        | 3.6.1        |     
                   libblockdev |  DISTRO  | https://release-monitoring.org/project/09397 | 2.26         | 2.26-1       | ORPH
                        libbsd |  DISTRO  | https://release-monitoring.org/project/01567 | 0.11.3       | 0.11.6       |     
                        libcap |  DISTRO  | https://release-monitoring.org/project/01569 | 2.63         | 2.64         |     
                     libcgroup |  DISTRO  | https://release-monitoring.org/project/01575 | 0.42.2       | 2.0.1        |     
                     libcodec2 |  DISTRO  | https://release-monitoring.org/project/14605 | 1.0.1        | 1.03         |     
                       libfuse |  GUESS   | https://release-monitoring.org/project/00861 | 2.9.9        | 3.10.5       | ORPH
                     libgcrypt |  DISTRO  | https://release-monitoring.org/project/01623 | 1.10.0       | 1.10.1       | ORPH
                    libgdiplus |  DISTRO  | https://release-monitoring.org/project/06440 | 6.0.5        | 6.1          |     
                       libgit2 |  DISTRO  | https://release-monitoring.org/project/01627 | 1.4.2        | 1.4.3        |     
                      libglade |  DISTRO  | https://release-monitoring.org/project/01174 | 2.6.4        | 3.38.2       | ORPH
                       libglfw |  DISTRO  | https://release-monitoring.org/project/01180 | 3.3.6        | 3.3.7        |     
                      libglib2 |  DISTRO  | https://release-monitoring.org/project/10024 | 2.70.4       | 2.72.1       |     
                      libglvnd |  DISTRO  | https://release-monitoring.org/project/12098 | 1.3.2        | 1.4.0        | ORPH
                  libgpg-error |  DISTRO  | https://release-monitoring.org/project/01628 | 1.42         | 1.45         | ORPH
                      libgpgme |  DISTRO  | https://release-monitoring.org/project/01239 | 1.16.0       | 1.17.1       | ORPH
                    libgphoto2 |  DISTRO  | https://release-monitoring.org/project/12558 | 2.5.27       | 2.5.29       | ORPH
                       libgtk2 |  DISTRO  | https://release-monitoring.org/project/13942 | 2.24.33      | 4.6.2        |     
                      libgudev |  DISTRO  | https://release-monitoring.org/project/07735 | 236          | 237          |     
                     libiberty |  DISTRO  | https://release-monitoring.org/project/07981 | 2.32         | 2.38         |     
                       libical |  DISTRO  | https://release-monitoring.org/project/01637 | 1.0.1        | 3.0.14       |     
                      libiconv |  DISTRO  | https://release-monitoring.org/project/10656 | 1.15         | 1.16         | ORPH
                  libimxvpuapi |  DISTRO  | https://release-monitoring.org/project/21479 | 0.10.3       | 2.2.0        |     
                        libite |  DISTRO  | https://release-monitoring.org/project/17367 | 2.5.1        | 2.5.2        |     
                      libkcapi |  DISTRO  | https://release-monitoring.org/project/16828 | 1.1.5        | 1.4.0        | ORPH
                       libmdbx |  DISTRO  | https://release-monitoring.org/project/141559 | 0.11.4       | 0.11.6       |     
                      libmhash |  DISTRO  | https://release-monitoring.org/project/21488 | 0.9.9.9      | 1.4          | ORPH
                  libminiupnpc |  DISTRO  | https://release-monitoring.org/project/01986 | 2.1.20201016 | 2.2.3        |     
                        libmnl |  DISTRO  | https://release-monitoring.org/project/01663 | 1.0.4        | 1.0.5        | ORPH
                     libmspack |  DISTRO  | https://release-monitoring.org/project/16827 | 0.10.1alpha  | 1.9.1        |     
                   libnetconf2 |  DISTRO  | https://release-monitoring.org/project/31639 | 2.0.24       | 2.1.7        |     
                  libnfnetlink |  DISTRO  | https://release-monitoring.org/project/01682 | 1.0.1        | 1.0.2        | ORPH
                        libnfs |  DISTRO  | https://release-monitoring.org/project/07325 | 4.0.0        | 5.0.1        | ORPH
                        libolm |  DISTRO  | https://release-monitoring.org/project/29706 | 3.2.9        | 3.2.11       |     
                    libopenssl |  DISTRO  | https://release-monitoring.org/project/02566 | 1.1.1n       | 3.0.2        |     
                     libosmium |  DISTRO  | https://release-monitoring.org/project/07023 | 2.17.3       | 2.18.0       |     
                   libpagekite |  DISTRO  | https://release-monitoring.org/project/21366 | 0.91.190530  | 0.91.201110  |     
            libpam-radius-auth |  DISTRO  | https://release-monitoring.org/project/57834 | 1.4.0        | 2.0.0        | ORPH
                       libpeas |  DISTRO  | https://release-monitoring.org/project/06871 | 1.30.0       | 1.32.0       | ORPH
                       libpqxx |  DISTRO  | https://release-monitoring.org/project/21367 | 6.4.5        | 7.7.3        |     
                        libpri |  DISTRO  | https://release-monitoring.org/project/11042 | 1.5.0        | 1.6.0        |     
                         libqb |  DISTRO  | https://release-monitoring.org/project/09399 | 2.0.3        | 2.0.6        |     
                      libressl |  DISTRO  | https://release-monitoring.org/project/12102 | 3.4.3        | 3.5.1        | ORPH
                       librsvg |  DISTRO  | https://release-monitoring.org/project/05420 | 2.50.7       | 2.54.0       |     
                       librtas |  DISTRO  | https://release-monitoring.org/project/10717 | 2.0.2        | 2.0.3        | ORPH
                   libsemanage |  DISTRO  | https://release-monitoring.org/project/01718 | 3.3          | 20200710     |     
                      libsepol |  DISTRO  | https://release-monitoring.org/project/01719 | 3.3          | 20200710     |     
                      libshout |  DISTRO  | https://release-monitoring.org/project/11084 | 2.4.5        | 2.4.6        | ORPH
                       libsigc |  DISTRO  | https://release-monitoring.org/project/07961 | 3.0.7        | 3.2.0        | ORPH
                    libsigsegv |  DISTRO  | https://release-monitoring.org/project/01722 | 2.13         | 2.14         |     
                    libsndfile |  DISTRO  | https://release-monitoring.org/project/13277 | 1.0.31       | 1.1.0        |     
                       libsoup |  DISTRO  | https://release-monitoring.org/project/11483 | 2.74.0       | 3.0.6        |     
                  libtextstyle |  DISTRO  | https://release-monitoring.org/project/00898 | 0.20.1       | 0.21         | ORPH
                       libtool |  DISTRO  | https://release-monitoring.org/project/01741 | 2.4.6        | 2.4.7        | ORPH
          libtorrent-rasterbar |  DISTRO  | https://release-monitoring.org/project/04166 | 1.2.15       | 2.0.6        |     
                     libunwind |  DISTRO  | https://release-monitoring.org/project/01748 | 1.5.0        | 1.6.2        | ORPH
                        libusb |  DISTRO  | https://release-monitoring.org/project/01749 | 1.0.25       | 1.0.26       |     
                         libuv |  DISTRO  | https://release-monitoring.org/project/10784 | 1.43.0       | 1.44.1       |     
                      libvdpau |  DISTRO  | https://release-monitoring.org/project/01755 | 1.4          | 1.5          |     
                       libvips |  DISTRO  | https://release-monitoring.org/project/05097 | 8.10.6       | 8.12.2       |     
                       libvirt |  DISTRO  | https://release-monitoring.org/project/224041 | 7.10.0       | 8.2.0        |     
                     libxmlrpc |  DISTRO  | https://release-monitoring.org/project/09024 | r3119        | 1.54.05      |     
                       libyang |  DISTRO  | https://release-monitoring.org/project/18554 | 2.0.112      | 2.0.164      |     
                      linphone |  DISTRO  | https://release-monitoring.org/project/01823 | 4.4.8        | 5.1.23       | ORPH
                linux-firmware |  DISTRO  | https://release-monitoring.org/project/141464 | 20220310     | 20220411     |     
                       live555 |  DISTRO  | https://release-monitoring.org/project/12414 | 2021.05.03   | 2022.04.15   | ORPH
                           lld |  DISTRO  | https://release-monitoring.org/project/01830 | 9.0.1        | 14.0.1       |     
                         lldpd |  DISTRO  | https://release-monitoring.org/project/14019 | 1.0.9        | 1.0.13       | ORPH
                          llvm |  DISTRO  | https://release-monitoring.org/project/01830 | 9.0.1        | 14.0.1       |     
                     logrotate |  DISTRO  | https://release-monitoring.org/project/10567 | 3.18.0       | 3.19.0       |     
                          lpty |  DISTRO  | https://release-monitoring.org/project/11671 | 1.0.1-1      | 1.2.2        |     
                         lrzip |  DISTRO  | https://release-monitoring.org/project/01842 | 0.641        | 0.651        |     
                         ltris |  DISTRO  | https://release-monitoring.org/project/21503 | 1.2          | 1.2.4        |     
              lttng-babeltrace |  DISTRO  | https://release-monitoring.org/project/00155 | 1.5.7        | 1.5.8        |     
                  lttng-libust |  DISTRO  | https://release-monitoring.org/project/07135 | 2.13.1       | 2.13.2       |     
                 lttng-modules |  DISTRO  | https://release-monitoring.org/project/07141 | 2.13.1       | 2.13.3       |     
                   lttng-tools |  DISTRO  | https://release-monitoring.org/project/07136 | 2.13.2       | 2.13.7       |     
                           lua |  DISTRO  | https://release-monitoring.org/project/01847 | 5.1.5        | 5.4.4        |     
                lua-resty-http |  DISTRO  | https://release-monitoring.org/project/13887 | 0.15-0       | 0.16.1       |     
                      luarocks |  DISTRO  | https://release-monitoring.org/project/01856 | 3.8.0        | 3.9.0        |     
                          lvm2 |  DISTRO  | https://release-monitoring.org/project/05354 | 2.03.14      | 2.03.15      | ORPH
                          lynx |  DISTRO  | https://release-monitoring.org/project/01863 | 2.8.9rel.1   | 2.9.0        |     
                    lzma-alone |  DISTRO  | https://release-monitoring.org/project/242840 | 9.22         | 2107         | ORPH
                          lzop |  DISTRO  | https://release-monitoring.org/project/07486 | 1.03         | 1.04         |     
                          make |  DISTRO  | https://release-monitoring.org/project/01877 | 4.2.1        | 4.3          | ORPH
                       mariadb |  DISTRO  | https://release-monitoring.org/project/01887 | 10.3.34      | 10.8.2       | ORPH
             matchbox-keyboard |  DISTRO  | https://release-monitoring.org/project/230595 | 0.1          | 0.1.1        |     
                         matio |  DISTRO  | https://release-monitoring.org/project/01893 | 1.5.22       | 1.5.23       |     
                       mbedtls |  DISTRO  | https://release-monitoring.org/project/13824 | 2.28.0       | 3.1.0        |     
                        mbpfan |  DISTRO  | https://release-monitoring.org/project/115980 | 2.2.1        | 2.3.0        |     
                         mdevd |  DISTRO  | https://release-monitoring.org/project/16553 | 0.1.4.0      | 0.1.5.1      |     
                 mediastreamer |  DISTRO  | https://release-monitoring.org/project/21746 | 4.4.8        | 5.1.20       | ORPH
                     memcached |  DISTRO  | https://release-monitoring.org/project/01965 | 1.6.12       | 1.6.15       | ORPH
                     memtest86 |  DISTRO  | https://release-monitoring.org/project/01966 | 5.01         | 5.31b        |     
                     memtester |  DISTRO  | https://release-monitoring.org/project/01967 | 4.5.0        | 4.5.1        |     
                        mender |  DISTRO  | https://release-monitoring.org/project/20629 | 3.1.0        | 3.2.1        |     
                        mesa3d |  DISTRO  | https://release-monitoring.org/project/01970 | 21.3.8       | 22.0.1       |     
                mesa3d-headers |  DISTRO  | https://release-monitoring.org/project/01970 | 21.3.8       | 22.0.1       |     
                      metacity |  DISTRO  | https://release-monitoring.org/project/15392 | 2.25.1       | 3.44.0       | ORPH
                      mfgtools |  DISTRO  | https://release-monitoring.org/project/21519 | 0.02         | 2.8.0        |     
                         mimic |  DISTRO  | https://release-monitoring.org/project/21521 | 1.1.0        | 1.3.0.1      |     
                      minetest |  DISTRO  | https://release-monitoring.org/project/01978 | 5.4.1        | 5.5.0        |     
                 minetest-game |  DISTRO  | https://release-monitoring.org/project/21522 | 5.4.1        | 5.5.0        |     
                        moarvm |  DISTRO  | https://release-monitoring.org/project/21100 | 2022.02      | 2022.03      |     
mobile-broadband-provider-info |  DISTRO  | https://release-monitoring.org/project/10267 | 20190618     | 20220315     | ORPH
                 moby-buildkit |  DISTRO  | https://release-monitoring.org/project/20836 | 0.10.0       | 0.10.1       |     
                       mongodb |  DISTRO  | https://release-monitoring.org/project/02008 | 4.2.18       | 5.3.1        |     
                      mongoose |  DISTRO  | https://release-monitoring.org/project/07603 | 7.2          | 7.6          |     
                         monit |  DISTRO  | https://release-monitoring.org/project/05483 | 5.26.0       | 5.32.0       |     
                          mono |  DISTRO  | https://release-monitoring.org/project/06360 | 6.12.0.122   | 6.12.0.174   |     
                        mpg123 |  DISTRO  | https://release-monitoring.org/project/12413 | 1.25.15      | 1.29.3       | ORPH
                           mpv |  DISTRO  | https://release-monitoring.org/project/05348 | 0.33.1       | 0.34.1       |     
                       msgpack |  DISTRO  | https://release-monitoring.org/project/12278 | 3.3.0        | 4.1.1        |     
                         msmtp |  DISTRO  | https://release-monitoring.org/project/02024 | 1.8.14       | 1.8.20       |     
                         mstpd |  DISTRO  | https://release-monitoring.org/project/235098 | 0.1.0        | 0.05         |     
                           mtd |  DISTRO  | https://release-monitoring.org/project/02026 | 2.1.3        | 2.1.4        |     
                        mtools |  DISTRO  | https://release-monitoring.org/project/02028 | 4.0.38       | 4.0.39       |     
                           mtr |  DISTRO  | https://release-monitoring.org/project/02029 | 0.94         | 0.95         | ORPH
               multipath-tools |  DISTRO  | https://release-monitoring.org/project/00424 | 0.8.8        | 0.8.9        |     
                         mupdf |  DISTRO  | https://release-monitoring.org/project/02034 | 1.18.0       | 1.19.0       |     
                          musl |  DISTRO  | https://release-monitoring.org/project/11688 | 1.2.2        | 1.2.3        |     
                          ncdu |  DISTRO  | https://release-monitoring.org/project/06045 | 1.16         | 2.1.1        |     
                       ncurses |  DISTRO  | https://release-monitoring.org/project/02057 | 6.1          | 6.3-20220416 | ORPH
                        netcat |  DISTRO  | https://release-monitoring.org/project/21534 | 0.7.1        | 1.218        | ORPH
                       netdata |  DISTRO  | https://release-monitoring.org/project/11046 | 1.33.1       | 1.34.1       |     
                       netifrc |  DISTRO  | https://release-monitoring.org/project/21917 | 0.6.1        | 0.7.3        |     
                     netopeer2 |  DISTRO  | https://release-monitoring.org/project/114978 | 2.0.35       | 2.1.16       |     
                       netsnmp |  DISTRO  | https://release-monitoring.org/project/02062 | 5.9          | 5.9.1        | ORPH
       network-manager-openvpn |  DISTRO  | https://release-monitoring.org/project/69977 | 1.8.14       | 1.8.18       |     
                      nftables |  DISTRO  | https://release-monitoring.org/project/02082 | 1.0.1        | 1.0.2        |     
                       nghttp2 |  DISTRO  | https://release-monitoring.org/project/08651 | 1.41.0       | 1.47.0       |     
                         nginx |  DISTRO  | https://release-monitoring.org/project/05413 | 1.20.1       | 1.21.6       |     
                        nodejs |  DISTRO  | https://release-monitoring.org/project/08251 | 14.18.3      | 17.9.0       |     
                      nss-mdns |  DISTRO  | https://release-monitoring.org/project/05491 | 0.14.1       | 0.15.1       | ORPH
                        nuttcp |  DISTRO  | https://release-monitoring.org/project/02511 | 6.1.2        | 8.2.2        |     
                 nvidia-driver |  DISTRO  | https://release-monitoring.org/project/21843 | 390.132      | 390.147      |     
               nvidia-modprobe |  DISTRO  | https://release-monitoring.org/project/141657 | 450.57       | 510.60.02    | ORPH
                          nvme |  DISTRO  | https://release-monitoring.org/project/09074 | 1.12         | 2.0          | ORPH
                     ocf-linux |  DISTRO  | https://release-monitoring.org/project/21541 | 20120127     | 20171122     | ORPH
                         ocrad |  DISTRO  | https://release-monitoring.org/project/02526 | 0.27         | 0.28         |     
                          ogre |  DISTRO  | https://release-monitoring.org/project/33334 | v1.12.12     | 13.3.4       |     
                     open62541 |  DISTRO  | https://release-monitoring.org/project/16896 | v1.2.2       | 1.3          | ORPH
                       opencv3 |  DISTRO  | https://release-monitoring.org/project/06615 | 3.4.17       | 4.5.5        |     
                openfpgaloader |  DISTRO  | https://release-monitoring.org/project/241709 | 0.6.1        | 0.8.0        |     
                       openjdk |  GUESS   | https://release-monitoring.org/project/176098 | 11.0.13+8    | 19+18        |     
                    openlayers |  DISTRO  | https://release-monitoring.org/project/06847 | 6.12.0       | 6.14.1       |     
                       openmpi |  DISTRO  | https://release-monitoring.org/project/02554 | 4.0.0        | 4.1.3        | ORPH
                 openpowerlink |  DISTRO  | https://release-monitoring.org/project/21550 | 2.7.1        | 2.7.2        |     
                        openrc |  DISTRO  | https://release-monitoring.org/project/11687 | 0.43.3       | 0.44.10      |     
                       openssh |  DISTRO  | https://release-monitoring.org/project/02565 | 8.9p1        | 9.0p1        | ORPH
                   openvmtools |  DISTRO  | https://release-monitoring.org/project/10998 | 10.3.5-10... | 12.0.0       |     
                          opkg |  DISTRO  | https://release-monitoring.org/project/59397 | 0.4.5        | 0.5.0        | ORPH
                    opkg-utils |  DISTRO  | https://release-monitoring.org/project/59396 | 0.4.5        | 0.5.0        |     
               optee-benchmark |  DISTRO  | https://release-monitoring.org/project/21555 | 3.16.0       | 3.17.0       |     
                  optee-client |  DISTRO  | https://release-monitoring.org/project/21556 | 3.16.0       | 3.17.0       |     
                optee-examples |  DISTRO  | https://release-monitoring.org/project/21557 | 3.16.0       | 3.17.0       |     
                    optee-test |  DISTRO  | https://release-monitoring.org/project/21558 | 3.16.0       | 3.17.0       |     
                  oracle-mysql |  DISTRO  | https://release-monitoring.org/project/00334 | 5.1.73       | 8.0.28       | ORPH
                          ortp |  DISTRO  | https://release-monitoring.org/project/21691 | 4.4.8        | 5.1.12       | ORPH
                         pango |  DISTRO  | https://release-monitoring.org/project/11783 | 1.50.6       | 1.50.7       | ORPH
                       pangomm |  DISTRO  | https://release-monitoring.org/project/07958 | 2.48.2       | 2.50.0       |     
                    parprouted |  DISTRO  | https://release-monitoring.org/project/10309 | 0.7          | 0.65         | ORPH
                      patchelf |  DISTRO  | https://release-monitoring.org/project/02598 | 0.9          | 0.14.5       | ORPH
                     pax-utils |  DISTRO  | https://release-monitoring.org/project/02601 | 1.2.6        | 1.3.3        | ORPH
                     pcm-tools |  DISTRO  | https://release-monitoring.org/project/21377 | 202110       | 202203       | ORPH
                         pcre2 |  DISTRO  | https://release-monitoring.org/project/05832 | 10.39        | 10.40        | ORPH
                perl-crypt-cbc |  DISTRO  | https://release-monitoring.org/project/11930 | 2.33         | 3.04         |     
      perl-crypt-openssl-guess |  DISTRO  | https://release-monitoring.org/project/17375 | 0.12         | 0.15         |     
        perl-crypt-openssl-rsa |  DISTRO  | https://release-monitoring.org/project/02748 | 0.31         | 0.32         |     
                perl-dbd-mysql |  DISTRO  | https://release-monitoring.org/project/02807 | 4.046        | 4.050        |     
             perl-file-listing |  DISTRO  | https://release-monitoring.org/project/02892 | 6.14         | 6.15         |     
              perl-html-parser |  DISTRO  | https://release-monitoring.org/project/02967 | 3.76         | 3.78         |     
              perl-http-daemon |  DISTRO  | https://release-monitoring.org/project/02975 | 6.12         | 6.14         |     
              perl-libwww-perl |  DISTRO  | https://release-monitoring.org/project/03024 | 6.60         | 6.62         |     
                perl-mail-dkim |  DISTRO  | https://release-monitoring.org/project/11868 | 1.20200824   | 1.20220408   |     
              perl-mojolicious |  DISTRO  | https://release-monitoring.org/project/05966 | 9.22         | 9.23         |     
                 perl-net-http |  DISTRO  | https://release-monitoring.org/project/03152 | 6.21         | 6.22         |     
               perl-net-ssleay |  DISTRO  | https://release-monitoring.org/project/06575 | 1.85         | 1.92         |     
            perl-package-stash |  DISTRO  | https://release-monitoring.org/project/11885 | 0.39         | 0.40         |     
                  perl-sys-cpu |  DISTRO  | https://release-monitoring.org/project/14338 | 0.52         | 0.61         |     
               perl-xml-libxml |  DISTRO  | https://release-monitoring.org/project/03527 | 2.0134       | 2.0207       |     
                           php |  DISTRO  | https://release-monitoring.org/project/03627 | 8.0.17       | 8.1.5        |     
                      php-amqp |  DISTRO  | https://release-monitoring.org/project/15603 | 1.10.2       | 1.11.0       |     
                      php-apcu |  DISTRO  | https://release-monitoring.org/project/11010 | 5.1.20       | 5.1.21       |     
                     php-gnupg |  DISTRO  | https://release-monitoring.org/project/21743 | 1.5.0        | 1.5.1        | ORPH
                   php-imagick |  DISTRO  | https://release-monitoring.org/project/17401 | 3.5.0        | 3.7.0        | ORPH
                 php-memcached |  DISTRO  | https://release-monitoring.org/project/17400 | 3.1.5        | 3.2.0        | ORPH
                       php-pam |  DISTRO  | https://release-monitoring.org/project/241707 | 2.2.3        | 2.2.4        |     
                    php-xdebug |  DISTRO  | https://release-monitoring.org/project/13302 | 3.0.4        | 3.1.4        |     
                      php-yaml |  DISTRO  | https://release-monitoring.org/project/12515 | 2.2.1        | 2.2.2        | ORPH
                        pigpio |  DISTRO  | https://release-monitoring.org/project/21577 | 79           | 7301         |     
                          pigz |  DISTRO  | https://release-monitoring.org/project/03642 | 2.6          | 2.7          |     
                      pinentry |  DISTRO  | https://release-monitoring.org/project/03643 | 1.1.1        | 1.2.0        | ORPH
                      pipewire |  DISTRO  | https://release-monitoring.org/project/57357 | 0.3.48       | 0.3.50       |     
                       pkgconf |  DISTRO  | https://release-monitoring.org/project/12753 | 1.6.3        | 1.8.0        | ORPH
                          poco |  DISTRO  | https://release-monitoring.org/project/05418 | 1.11.1       | 1.11.2       |     
                          poke |  DISTRO  | https://release-monitoring.org/project/179926 | 2.1          | 2.3          | ORPH
               policycoreutils |  DISTRO  | https://release-monitoring.org/project/03680 | 3.2          | 20200710     |     
                       poppler |  DISTRO  | https://release-monitoring.org/project/03686 | 21.12.0      | 22.04.0      |     
                       postgis |  DISTRO  | https://release-monitoring.org/project/03694 | 3.2.0        | 3.2.1        |     
                 powerpc-utils |  DISTRO  | https://release-monitoring.org/project/10715 | 1.3.8        | 1.3.9        | ORPH
                      powertop |  DISTRO  | https://release-monitoring.org/project/03702 | 2.13         | 2.14         |     
                     procps-ng |  DISTRO  | https://release-monitoring.org/project/03708 | 3.3.17       | 4.0.0        | ORPH
                       proftpd |  DISTRO  | https://release-monitoring.org/project/07609 | 1.3.6e       | 1.3.7c       |     
                          proj |  DISTRO  | https://release-monitoring.org/project/21570 | 8.1.1        | 9.0.0        |     
                       prosody |  DISTRO  | https://release-monitoring.org/project/03709 | 0.11.13      | 0.12.0       |     
                      protobuf |  DISTRO  | https://release-monitoring.org/project/03715 | 3.19.1       | 3.20.0       |     
                proxychains-ng |  DISTRO  | https://release-monitoring.org/project/06499 | 4.14         | 4.16         | ORPH
          pru-software-support |  DISTRO  | https://release-monitoring.org/project/21825 | 6.0.1        | 6.1.0        |     
                          ptpd |  GUESS   | https://release-monitoring.org/project/03726 | 1.1.0        | 2.3.1        | ORPH
                    pulseaudio |  DISTRO  | https://release-monitoring.org/project/03729 | 14.2         | 15.0         |     
                  python-aenum |  DISTRO  | https://release-monitoring.org/project/34074 | 3.1.0        | 3.1.11       |     
             python-aioblescan |  DISTRO  | https://release-monitoring.org/project/21242 | 0.2.8        | 0.2.12       |     
                python-aiocoap |  DISTRO  | https://release-monitoring.org/project/21243 | 0.4.1        | 0.4.3        |     
        python-aiohttp-remotes |  DISTRO  | https://release-monitoring.org/project/21248 | 1.1.0        | 1.2.0        |     
                python-aiojobs |  DISTRO  | https://release-monitoring.org/project/21252 | 0.3.0        | 1.0.0        |     
              python-alsaaudio |  DISTRO  | https://release-monitoring.org/project/10072 | 0.8.4        | 0.9.0        |     
                  python-arrow |  DISTRO  | https://release-monitoring.org/project/05314 | 1.2.0        | 1.2.2        |     
                python-asgiref |  DISTRO  | https://release-monitoring.org/project/18462 | 3.3.4        | 3.5.0        |     
             python-asn1crypto |  DISTRO  | https://release-monitoring.org/project/13875 | 1.4.0        | 1.5.1        |     
               python-autobahn |  DISTRO  | https://release-monitoring.org/project/07015 | 22.1.1       | 22.3.2       |     
         python-beautifulsoup4 |  DISTRO  | https://release-monitoring.org/project/03779 | 4.10.0       | 4.11.1       |     
                 python-bidict |  DISTRO  | https://release-monitoring.org/project/114352 | 0.21.3       | 0.22.0       |     
                  python-bleak |  DISTRO  | https://release-monitoring.org/project/26271 | 0.12.1       | 0.14.2       |     
                  python-boto3 |  DISTRO  | https://release-monitoring.org/project/08778 | 1.19.2       | 1.21.42      |     
               python-botocore |  DISTRO  | https://release-monitoring.org/project/08748 | 1.22.2       | 1.24.42      |     
                python-bsdiff4 |  DISTRO  | https://release-monitoring.org/project/44268 | 1.2.1        | 1.2.2        |     
                python-canopen |  DISTRO  | https://release-monitoring.org/project/23230 | 1.0.0        | 2.0.0b1      |     
               python-channels |  DISTRO  | https://release-monitoring.org/project/21937 | 2.3.1        | 3.0.4        |     
         python-channels-redis |  DISTRO  | https://release-monitoring.org/project/21936 | 2.4.1        | 3.4.0        |     
     python-charset-normalizer |  DISTRO  | https://release-monitoring.org/project/55366 | 2.0.11       | 2.0.12       |     
                python-cheroot |  DISTRO  | https://release-monitoring.org/project/20163 | 8.2.1        | 8.6.0        |     
               python-cherrypy |  DISTRO  | https://release-monitoring.org/project/03799 | 12.0.1       | 18.6.1       |     
                  python-click |  DISTRO  | https://release-monitoring.org/project/03802 | 7.1.2        | 8.1.2        |     
               python-colorlog |  DISTRO  | https://release-monitoring.org/project/12509 | 6.4.1        | 6.6.0        |     
         python-configshell-fb |  DISTRO  | https://release-monitoring.org/project/19734 | 1.1.29       | 1.5          |     
               python-crossbar |  DISTRO  | https://release-monitoring.org/project/21696 | 21.3.1       | 22.3.1       |     
           python-cryptography |  DISTRO  | https://release-monitoring.org/project/05532 | 36.0.1       | 36.0.2       |     
             python-cssselect2 |  DISTRO  | https://release-monitoring.org/project/86109 | 0.5.0        | 0.6.0        |     
               python-cssutils |  DISTRO  | https://release-monitoring.org/project/13259 | 2.3.0        | 2.4.0        |     
                 python-cython |  DISTRO  | https://release-monitoring.org/project/12679 | 0.29.27      | 3.0.0a10     |     
                 python-daemon |  DISTRO  | https://release-monitoring.org/project/03816 | 2.2.3        | 2.3.0        |     
                 python-daphne |  DISTRO  | https://release-monitoring.org/project/21939 | 2.4.1        | 3.0.2        |     
           python-dataproperty |  DISTRO  | https://release-monitoring.org/project/21697 | 0.54.2       | 0.55.0       |     
              python-decorator |  DISTRO  | https://release-monitoring.org/project/03819 | 5.1.0        | 5.1.1        |     
                python-dialog3 |  DISTRO  | https://release-monitoring.org/project/03823 | 3.5.1        | 3.5.3        |     
              python-dnspython |  DISTRO  | https://release-monitoring.org/project/13190 | 2.1.0        | 2.2.1        |     
                 python-docker |  DISTRO  | https://release-monitoring.org/project/03847 | 4.1.0        | 5.0.3        |     
                  python-ecdsa |  DISTRO  | https://release-monitoring.org/project/08370 | 0.17.0       | 0.18.0b2     |     
               python-engineio |  DISTRO  | https://release-monitoring.org/project/15064 | 4.2.1        | 4.3.1        |     
            python-entrypoints |  DISTRO  | https://release-monitoring.org/project/12081 | 0.3          | 0.4          |     
                python-esptool |  DISTRO  | https://release-monitoring.org/project/11619 | 3.2          | 3.3          |     
                 python-falcon |  DISTRO  | https://release-monitoring.org/project/03860 | 3.0.1        | 3.1.0        |     
               python-filelock |  DISTRO  | https://release-monitoring.org/project/11739 | 3.3.0        | 3.6.0        |     
                  python-flask |  DISTRO  | https://release-monitoring.org/project/03867 | 1.1.2        | 2.1.1        |     
     python-flask-expects-json |  DISTRO  | https://release-monitoring.org/project/127659 | 1.5.0        | 1.7.0        |     
          python-flask-jsonrpc |  DISTRO  | https://release-monitoring.org/project/21698 | 0.3.1        | 2.1.0        |     
            python-flask-login |  DISTRO  | https://release-monitoring.org/project/03868 | 0.5.0        | 0.6.0        |     
       python-flask-sqlalchemy |  DISTRO  | https://release-monitoring.org/project/05701 | 2.4.1        | 2.5.1        |     
              python-flask-wtf |  DISTRO  | https://release-monitoring.org/project/05702 | 0.15.1       | 1.0.1        |     
              python-fonttools |  DISTRO  | https://release-monitoring.org/project/07388 | 4.29.1       | 4.32.0       |     
                    python-git |  DISTRO  | https://release-monitoring.org/project/06459 | 3.1.24       | 3.1.27       |     
                 python-gitdb2 |  DISTRO  | https://release-monitoring.org/project/12730 | 4.0.7        | 4.0.9        |     
                python-gobject |  DISTRO  | https://release-monitoring.org/project/13158 | 3.42.0       | 3.42.1       |     
               python-httplib2 |  DISTRO  | https://release-monitoring.org/project/03887 | 0.19.1       | 0.20.4       |     
               python-humanize |  DISTRO  | https://release-monitoring.org/project/19799 | 3.11.0       | 4.0.0        |     
                python-ipython |  DISTRO  | https://release-monitoring.org/project/01399 | 7.31.1       | 8.2.0        |     
                python-iso8601 |  DISTRO  | https://release-monitoring.org/project/17228 | 0.1.14       | 1.0.2        |     
           python-itsdangerous |  DISTRO  | https://release-monitoring.org/project/03892 | 2.0.1        | 2.1.2        |     
                  python-iwlib |  DISTRO  | https://release-monitoring.org/project/51611 | 1.5          | 1.7.0        |     
         python-jaraco-classes |  DISTRO  | https://release-monitoring.org/project/20150 | 2.0          | 3.2.1        |     
       python-jaraco-functools |  DISTRO  | https://release-monitoring.org/project/20165 | 2.0          | 3.5.0        |     
                 python-jinja2 |  DISTRO  | https://release-monitoring.org/project/03894 | 3.0.3        | 3.1.1        |     
               python-jmespath |  DISTRO  | https://release-monitoring.org/project/08749 | 0.10.0       | 1.0.0        |     
             python-jsonschema |  DISTRO  | https://release-monitoring.org/project/03898 | 2.5.1        | 4.4.0        |     
                python-keyring |  DISTRO  | https://release-monitoring.org/project/03901 | 19.2.0       | 23.5.0       |     
             python-kiwisolver |  DISTRO  | https://release-monitoring.org/project/16910 | 1.1.0        | 1.4.2        |     
                python-libusb1 |  DISTRO  | https://release-monitoring.org/project/12301 | 2.0.1        | 3.0.0        |     
               python-logstash |  DISTRO  | https://release-monitoring.org/project/65575 | 0.4.6        | 0.4.8        |     
                   python-lxml |  DISTRO  | https://release-monitoring.org/project/03914 | 4.6.5        | 4.7.1        |     
                   python-mako |  DISTRO  | https://release-monitoring.org/project/03915 | 1.1.5        | 1.2.0        |     
               python-markdown |  DISTRO  | https://release-monitoring.org/project/03916 | 3.3.4        | 3.3.6        |     
              python-markdown2 |  DISTRO  | https://release-monitoring.org/project/03917 | 2.4.1        | 2.4.2        |     
             python-markupsafe |  DISTRO  | https://release-monitoring.org/project/03918 | 2.0.1        | 2.1.1        |     
             python-matplotlib |  DISTRO  | https://release-monitoring.org/project/03919 | 3.4.3        | 3.5.1        |     
        python-memory-profiler |  DISTRO  | https://release-monitoring.org/project/38508 | 0.58.0       | 0.60.0       |     
                python-mistune |  DISTRO  | https://release-monitoring.org/project/06189 | 0.8.4        | 2.0.2        |     
         python-more-itertools |  DISTRO  | https://release-monitoring.org/project/12201 | 8.10.0       | 8.12.0       |     
                  python-msgfy |  DISTRO  | https://release-monitoring.org/project/29716 | 0.1.0        | 0.2.0        |     
         python-networkmanager |  DISTRO  | https://release-monitoring.org/project/12909 | 2.1          | 2.2          |     
               python-networkx |  DISTRO  | https://release-monitoring.org/project/07791 | 2.6.3        | 2.8          |     
                  python-numpy |  DISTRO  | https://release-monitoring.org/project/02509 | 1.21.2       | 1.22.3       |     
               python-oauthlib |  DISTRO  | https://release-monitoring.org/project/05377 | 3.1.1        | 3.2.0        |     
          python-opcua-asyncio |  DISTRO  | https://release-monitoring.org/project/131612 | 0.8.4        | 0.98.9       |     
              python-paho-mqtt |  DISTRO  | https://release-monitoring.org/project/06084 | 1.4.0        | 1.6.1        |     
                 python-pathpy |  DISTRO  | https://release-monitoring.org/project/21703 | 12.0.1       | 12.5.0       |     
                    python-pbr |  DISTRO  | https://release-monitoring.org/project/03960 | 5.6.0        | 5.8.1        |     
                 python-pillow |  DISTRO  | https://release-monitoring.org/project/07974 | 9.0.1        | 9.1.0        |     
                    python-pip |  DISTRO  | https://release-monitoring.org/project/06529 | 21.2.4       | 22.0.4       |     
                python-portend |  DISTRO  | https://release-monitoring.org/project/20203 | 2.5          | 3.1.0        |     
         python-prompt-toolkit |  DISTRO  | https://release-monitoring.org/project/08742 | 3.0.20       | 3.0.29       |     
               python-protobuf |  DISTRO  | https://release-monitoring.org/project/03715 | 3.19.1       | 3.20.0       |     
                 python-psutil |  DISTRO  | https://release-monitoring.org/project/03978 | 5.8.0        | 5.9.0        |     
               python-psycopg2 |  DISTRO  | https://release-monitoring.org/project/03979 | 2.9.1        | 2.9.3        |     
                   python-pudb |  DISTRO  | https://release-monitoring.org/project/03980 | 2021.1       | 2022.1.1     |     
                     python-py |  DISTRO  | https://release-monitoring.org/project/03981 | 1.10.0       | 1.11.0       |     
                 python-pybind |  DISTRO  | https://release-monitoring.org/project/13384 | 2.9.0        | 2.9.2        |     
                python-pycairo |  DISTRO  | https://release-monitoring.org/project/13166 | 1.19.1       | 1.21.0       |     
          python-pycryptodomex |  DISTRO  | https://release-monitoring.org/project/36851 | 3.14.0       | 3.14.1       |     
               python-pydantic |  DISTRO  | https://release-monitoring.org/project/29768 | 1.8.2        | 1.9.0        |     
             python-pyelftools |  DISTRO  | https://release-monitoring.org/project/16219 | 0.27         | 0.28         |     
                 python-pygame |  DISTRO  | https://release-monitoring.org/project/17480 | d61ea8eabd56 | 2.1.2        |     
               python-pygments |  DISTRO  | https://release-monitoring.org/project/03986 | 2.7.4        | 2.11.2       |     
             python-pyhamcrest |  DISTRO  | https://release-monitoring.org/project/11633 | 2.0.2        | 2.0.3        |     
                  python-pyicu |  DISTRO  | https://release-monitoring.org/project/12004 | 1.9.7        | 2.9          |     
              python-pylibftdi |  DISTRO  | https://release-monitoring.org/project/21583 | 0.18.1       | 0.20.0       |     
                  python-pylru |  DISTRO  | https://release-monitoring.org/project/21584 | 1.2.0        | 1.2.1        |     
               python-pymodbus |  DISTRO  | https://release-monitoring.org/project/15600 | 2.2.0        | 2.5.3        |     
                python-pymupdf |  DISTRO  | https://release-monitoring.org/project/17320 | 1.18.14      | 1.19.6       |     
              python-pyopenssl |  DISTRO  | https://release-monitoring.org/project/05535 | 21.0.0       | 22.0.0       |     
              python-pyparsing |  DISTRO  | https://release-monitoring.org/project/03756 | 3.0.7        | 3.0.8        |     
               python-pyparted |  DISTRO  | https://release-monitoring.org/project/15558 | 3.11.6       | 3.12.0       |     
                  python-pyqt5 |  DISTRO  | https://release-monitoring.org/project/20104 | 5.7          | 5.15.6       |     
               python-pyroute2 |  DISTRO  | https://release-monitoring.org/project/20081 | 0.5.7        | 0.6.9        |     
          python-pytablereader |  DISTRO  | https://release-monitoring.org/project/21592 | 0.26.1       | 0.31.3       |     
          python-pytablewriter |  DISTRO  | https://release-monitoring.org/project/21593 | 0.46.1       | 0.64.2       |     
                 python-pytest |  DISTRO  | https://release-monitoring.org/project/03765 | 6.2.5        | 7.1.1        |     
         python-pytest-asyncio |  DISTRO  | https://release-monitoring.org/project/07273 | 0.15.1       | 0.18.3       |     
                   python-pytz |  DISTRO  | https://release-monitoring.org/project/06537 | 2021.3       | 2022.1       |     
                 python-pyudev |  DISTRO  | https://release-monitoring.org/project/08485 | 0.22.0       | 0.23.2       |     
                  python-pyzmq |  DISTRO  | https://release-monitoring.org/project/04104 | 19.0.2       | 23.0.0b1     |     
                  python-redis |  DISTRO  | https://release-monitoring.org/project/03992 | 3.5.3        | 4.2.2        |     
                python-reentry |  DISTRO  | https://release-monitoring.org/project/21596 | 1.3.2        | 1.3.3        |     
                  python-regex |  DISTRO  | https://release-monitoring.org/project/05548 | 2021.4.4     | 2022.3.15    |     
                   python-remi |  DISTRO  | https://release-monitoring.org/project/21597 | 2021.3.2     | 2022.3.7     |     
      python-requests-oauthlib |  DISTRO  | https://release-monitoring.org/project/11803 | 1.3.0        | 1.3.1        |     
               python-rpi-gpio |  DISTRO  | https://release-monitoring.org/project/12026 | 0.7.0        | 0.7.1        |     
             python-rpi-ws281x |  DISTRO  | https://release-monitoring.org/project/21898 | 4.3.0        | 4.3.4        |     
                    python-rsa |  DISTRO  | https://release-monitoring.org/project/08808 | 4.7.2        | 4.8          |     
              python-rtslib-fb |  DISTRO  | https://release-monitoring.org/project/19641 | 2.1.74       | 2.2          |     
             python-s3transfer |  DISTRO  | https://release-monitoring.org/project/10428 | 0.5.0        | 0.5.2        |     
          python-secretstorage |  DISTRO  | https://release-monitoring.org/project/04020 | 3.1.2        | 3.3.1        |     
       python-semantic-version |  DISTRO  | https://release-monitoring.org/project/06514 | 2.8.5        | 2.9.0        |     
             python-sentry-sdk |  DISTRO  | https://release-monitoring.org/project/21603 | 1.4.3        | 1.5.10       |     
       python-service-identity |  DISTRO  | https://release-monitoring.org/project/07917 | 18.1.0       | 21.1.0       |     
           python-setproctitle |  DISTRO  | https://release-monitoring.org/project/11699 | 1.2.2        | 1.2.3        |     
             python-setuptools |  DISTRO  | https://release-monitoring.org/project/04021 | 60.9.3       | 62.1.0       |     
        python-setuptools-rust |  DISTRO  | https://release-monitoring.org/project/122284 | 1.1.2        | 1.2.0        |     
             python-simplejson |  DISTRO  | https://release-monitoring.org/project/04026 | 3.17.5       | 3.17.6       |     
           python-simplesqlite |  DISTRO  | https://release-monitoring.org/project/21608 | 0.45.2       | 1.3.0        |     
                    python-sip |  DISTRO  | https://release-monitoring.org/project/13626 | 4.18         | 5.0.0        |     
                 python-smmap2 |  DISTRO  | https://release-monitoring.org/project/12729 | 4.0.0        | 5.0.0        |     
               python-socketio |  DISTRO  | https://release-monitoring.org/project/21611 | 5.4.0        | 5.5.2        |     
              python-soupsieve |  DISTRO  | https://release-monitoring.org/project/27570 | 2.2.1        | 2.3.2.post1  |     
             python-sqlalchemy |  DISTRO  | https://release-monitoring.org/project/04034 | 1.3.10       | 1.4.35       |     
           python-sqliteschema |  DISTRO  | https://release-monitoring.org/project/29718 | 1.2.1        | 1.3.0        |     
               python-sqlparse |  DISTRO  | https://release-monitoring.org/project/04038 | 0.3.0        | 0.4.2        |     
                python-tempora |  DISTRO  | https://release-monitoring.org/project/21225 | 1.14.1       | 5.0.1        |     
                 python-thrift |  DISTRO  | https://release-monitoring.org/project/21614 | 0.13.0       | 0.16.0       |     
                  python-tomli |  DISTRO  | https://release-monitoring.org/project/207408 | 1.2.0        | 2.0.1        |     
                python-tornado |  DISTRO  | https://release-monitoring.org/project/07498 | 6.0.4        | 6.1          |     
                   python-tqdm |  DISTRO  | https://release-monitoring.org/project/11524 | 4.40.1       | 4.64.0       |     
              python-traitlets |  DISTRO  | https://release-monitoring.org/project/12211 | 5.1.0        | 5.1.1        |     
                python-twisted |  DISTRO  | https://release-monitoring.org/project/04071 | 22.2.0       | 22.4.0       |     
               python-txtorcon |  DISTRO  | https://release-monitoring.org/project/19661 | 21.1.0       | 22.0.0       |     
      python-typing-extensions |  DISTRO  | https://release-monitoring.org/project/19755 | 3.10.0.2     | 4.2.0        |     
                  python-ujson |  DISTRO  | https://release-monitoring.org/project/04076 | 4.2.0        | 5.2.0        |     
 python-unittest-xml-reporting |  DISTRO  | https://release-monitoring.org/project/72281 | 3.0.4        | 3.2.0        |     
                python-urllib3 |  DISTRO  | https://release-monitoring.org/project/04078 | 1.26.8       | 1.26.9       |     
             python-validators |  DISTRO  | https://release-monitoring.org/project/19818 | 0.15.0       | 0.18.2       |     
               python-watchdog |  DISTRO  | https://release-monitoring.org/project/05341 | 2.1.6        | 2.1.7        |     
                python-wcwidth |  DISTRO  | https://release-monitoring.org/project/08743 | 0.1.9        | 0.2.5        |     
             python-weasyprint |  DISTRO  | https://release-monitoring.org/project/11057 | 54.2         | 55.0b1       |     
                  python-webpy |  DISTRO  | https://release-monitoring.org/project/04090 | 0.40         | 0.62         |     
       python-websocket-client |  DISTRO  | https://release-monitoring.org/project/07288 | 0.58.0       | 1.3.2        |     
             python-websockets |  DISTRO  | https://release-monitoring.org/project/08100 | 10.0         | 10.3         |     
               python-werkzeug |  DISTRO  | https://release-monitoring.org/project/04092 | 1.0.1        | 2.1.1        |     
                  python-wrapt |  DISTRO  | https://release-monitoring.org/project/06108 | 1.12.1       | 1.14.0       |     
                python-wtforms |  DISTRO  | https://release-monitoring.org/project/11805 | 2.3.3        | 3.0.1        |     
                   python-xlib |  DISTRO  | https://release-monitoring.org/project/12180 | 0.27         | 0.31         |     
             python-xlsxwriter |  DISTRO  | https://release-monitoring.org/project/12031 | 3.0.1        | 3.0.3        |     
                   python-yarl |  DISTRO  | https://release-monitoring.org/project/12895 | 1.7.2        | 1.8.0        |     
               python-zeroconf |  DISTRO  | https://release-monitoring.org/project/12681 | 0.29.0       | 0.38.4       |     
                 python-zopfli |  DISTRO  | https://release-monitoring.org/project/50016 | 0.1.9        | 0.2.1        |     
                       python3 |  DISTRO  | https://release-monitoring.org/project/13254 | 3.10.2       | 3.10.4       |     
          qcom-db410c-firmware |  DISTRO  | https://release-monitoring.org/project/235382 | 1034.2.1     | 1036.1       |     
                          qpdf |  DISTRO  | https://release-monitoring.org/project/05542 | 10.5.0       | 10.6.3       |     
                   qpid-proton |  DISTRO  | https://release-monitoring.org/project/15198 | 0.35.0       | 0.37.0       |     
                       qt5coap |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.3.0        |     
                        qt5knx |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.3.0        |     
                       qt5mqtt |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.3.0        |     
                      qt5opcua |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.3.0        |     
                  qt5webengine |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.3.0        |     
                        quazip |  DISTRO  | https://release-monitoring.org/project/04141 | 1.2          | 1.3          |     
                           qwt |  DISTRO  | https://release-monitoring.org/project/04147 | 6.1.6        | 6.2.0        | ORPH
               rabbitmq-server |  DISTRO  | https://release-monitoring.org/project/05585 | 3.8.2        | 3.9.15       |     
                        ranger |  DISTRO  | https://release-monitoring.org/project/07426 | 1.7.2        | 1.9.3        |     
                           re2 |  DISTRO  | https://release-monitoring.org/project/10500 | 2022-02-01   | 2022-04-01   |     
                   restorecond |  DISTRO  | https://release-monitoring.org/project/16520 | 3.3          | 20200710     | ORPH
              riemann-c-client |  DISTRO  | https://release-monitoring.org/project/21389 | 1.10.5       | 2.0.0        | ORPH
                       rocksdb |  DISTRO  | https://release-monitoring.org/project/15560 | 6.20.3       | 7.1.1        |     
                         rsync |  DISTRO  | https://release-monitoring.org/project/04217 | 3.2.3        | 3.2.4        | ORPH
                       rsyslog |  DISTRO  | https://release-monitoring.org/project/04218 | 8.2010.0     | 8.2202.0     |     
                          rtai |  DISTRO  | https://release-monitoring.org/project/21658 | 4.0.1        | 5.3          | ORPH
                          rtty |  DISTRO  | https://release-monitoring.org/project/87994 | 7.4.0        | 8.0.0        |     
                          ruby |  DISTRO  | https://release-monitoring.org/project/04223 | 3.1.0        | 3.1.2        |     
                          rust |  DISTRO  | https://release-monitoring.org/project/07635 | 1.58.1       | 1.60.0       |     
                      rust-bin |  DISTRO  | https://release-monitoring.org/project/07635 | 1.58.1       | 1.60.0       |     
                         rygel |  DISTRO  | https://release-monitoring.org/project/04751 | 0.40.2       | 0.40.3       |     
                            s6 |  DISTRO  | https://release-monitoring.org/project/05485 | 2.10.0.3     | 2.11.1.0     |     
                        s6-dns |  DISTRO  | https://release-monitoring.org/project/16547 | 2.3.5.1      | 2.3.5.3      |     
                 s6-linux-init |  DISTRO  | https://release-monitoring.org/project/16552 | 1.0.6.3      | 1.0.7.3      |     
                s6-linux-utils |  DISTRO  | https://release-monitoring.org/project/16551 | 2.5.1.5      | 2.5.1.7      |     
                 s6-networking |  DISTRO  | https://release-monitoring.org/project/16550 | 2.4.1.1      | 2.5.1.0      |     
             s6-portable-utils |  DISTRO  | https://release-monitoring.org/project/16549 | 2.2.3.2      | 2.2.4.0      |     
                         s6-rc |  DISTRO  | https://release-monitoring.org/project/16548 | 0.5.2.2      | 0.5.3.1      |     
                      safeclib |  DISTRO  | https://release-monitoring.org/project/21385 | 3.7.1        | 01022022     |     
                        samba4 |  DISTRO  | https://release-monitoring.org/project/04758 | 4.15.6       | 4.16.0       |     
                 sane-backends |  DISTRO  | https://release-monitoring.org/project/04760 | 1.0.32       | 1.1.1        |     
                         scons |  DISTRO  | https://release-monitoring.org/project/04770 | 3.1.2        | 4.3.0        |     
                       sdl_gfx |  DISTRO  | https://release-monitoring.org/project/04778 | 2.0.23       | 2.0.25       | ORPH
                     sdl_sound |  DISTRO  | https://release-monitoring.org/project/10262 | 1.0.3        | 2.0.1        | ORPH
                        sdparm |  DISTRO  | https://release-monitoring.org/project/04787 | 1.10         | 1.12         |     
                       sedutil |  DISTRO  | https://release-monitoring.org/project/15203 | 1.15.1       | 1.20.0       |     
                    sentry-cli |  DISTRO  | https://release-monitoring.org/project/135642 | 1.59.0       | 2.0.2        |     
                 sentry-native |  DISTRO  | https://release-monitoring.org/project/135639 | 0.4.1        | 0.4.15       |     
                       ser2net |  DISTRO  | https://release-monitoring.org/project/21655 | 4.3.4        | 4.3.5        |     
              shared-mime-info |  DISTRO  | https://release-monitoring.org/project/05524 | 1.12         | 2.2          | ORPH
                          shim |  DISTRO  | https://release-monitoring.org/project/10719 | 15.4         | 15.5         |     
                       skalibs |  DISTRO  | https://release-monitoring.org/project/05486 | 2.10.0.3     | 2.11.2.0     |     
                 smartmontools |  DISTRO  | https://release-monitoring.org/project/04835 | 7.2          | 7.3          | ORPH
                        sngrep |  DISTRO  | https://release-monitoring.org/project/17075 | 1.4.7        | 1.4.10       | ORPH
                        snmppp |  DISTRO  | https://release-monitoring.org/project/21318 | 3.4.9        | 3.4.10       |     
                        snort3 |  DISTRO  | https://release-monitoring.org/project/13263 | 3.1.18.0     | 3.1.27.0     |     
                     sofia-sip |  DISTRO  | https://release-monitoring.org/project/10509 | 1.13.6-41... | 1.13.7       |     
                     softether |  DISTRO  | https://release-monitoring.org/project/21383 | 4.30-9700... | 4.38-9760... |     
       sound-theme-freedesktop |  DISTRO  | https://release-monitoring.org/project/10152 | 0.7          | 0.8          |     
                       spandsp |  DISTRO  | https://release-monitoring.org/project/12600 | 3.0.0-6ec... | 3.0.0        |     
                    sphinxbase |  DISTRO  | https://release-monitoring.org/project/20548 | 5prealpha    | 0.8          |     
                spice-protocol |  DISTRO  | https://release-monitoring.org/project/14892 | 0.14.3       | 0.14.4       |     
                     sqlcipher |  DISTRO  | https://release-monitoring.org/project/11213 | 4.5.0        | 4.5.1        |     
                      squashfs |  DISTRO  | https://release-monitoring.org/project/04879 | 4.5          | 4.5.1        |     
                         squid |  DISTRO  | https://release-monitoring.org/project/04880 | 5.3          | 5.5          | ORPH
                         sshfs |  DISTRO  | https://release-monitoring.org/project/11058 | 3.7.1        | 3.7.2        | ORPH
             start-stop-daemon |  DISTRO  | https://release-monitoring.org/project/08127 | 1.20.7.1     | 1.21.7       | ORPH
          startup-notification |  DISTRO  | https://release-monitoring.org/project/10089 | 0.9          | 0.12         | ORPH
                    stellarium |  DISTRO  | https://release-monitoring.org/project/04891 | 0.22.0       | 0.22.1       |     
                    stm32flash |  DISTRO  | https://release-monitoring.org/project/227276 | 0.6          | 0.7          |     
                        strace |  DISTRO  | https://release-monitoring.org/project/04897 | 5.16         | 5.17         |     
                        stress |  DISTRO  | https://release-monitoring.org/project/08048 | 1.0.4        | 1.0.5        |     
                       stunnel |  DISTRO  | https://release-monitoring.org/project/04901 | 5.60         | 5.63         |     
                          sudo |  DISTRO  | https://release-monitoring.org/project/04906 | 1.9.8p2      | 1.9.10       | ORPH
                    supervisor |  DISTRO  | https://release-monitoring.org/project/16289 | 4.2.2        | 4.2.4        | ORPH
                       synergy |  DISTRO  | https://release-monitoring.org/project/05718 | 2.0.12-beta  | 2.3.2        |     
                        sysdig |  DISTRO  | https://release-monitoring.org/project/16898 | 0.27.1       | 0.29.1       |     
                     syslog-ng |  DISTRO  | https://release-monitoring.org/project/04930 | 3.35.1       | 3.36.1       |     
                       sysprof |  DISTRO  | https://release-monitoring.org/project/21649 | 1.2.0        | 3.44.0       |     
                       sysrepo |  DISTRO  | https://release-monitoring.org/project/34820 | 2.0.53       | 2.1.42       |     
                       sysstat |  DISTRO  | https://release-monitoring.org/project/04931 | 12.4.2       | 12.5.6       | ORPH
         system-config-printer |  DISTRO  | https://release-monitoring.org/project/08855 | 1.5.15       | 1.5.16       | ORPH
             systemd-bootchart |  DISTRO  | https://release-monitoring.org/project/11774 | 233          | 234          |     
                      sysvinit |  DISTRO  | https://release-monitoring.org/project/21648 | 2.99         | 3.03         | ORPH
                           tbb |  DISTRO  | https://release-monitoring.org/project/08217 | 2018_U5      | 2021.5.0     |     
                         tclap |  DISTRO  | https://release-monitoring.org/project/04942 | 1.2.4        | 1.2.5        |     
                     tcpreplay |  DISTRO  | https://release-monitoring.org/project/13716 | 4.3.4        | 4.4.1        | ORPH
                 tesseract-ocr |  DISTRO  | https://release-monitoring.org/project/04954 | 5.0.1        | 5.1.0        |     
                      thermald |  DISTRO  | https://release-monitoring.org/project/14500 | 2.4.8        | 2.4.9        |     
                        thrift |  DISTRO  | https://release-monitoring.org/project/05581 | 0.14.1       | 0.16.0       | ORPH
                   timescaledb |  DISTRO  | https://release-monitoring.org/project/17545 | 2.5.2        | 2.6.1        |     
                      tinifier |  DISTRO  | https://release-monitoring.org/project/241900 | 3.4.0        | 3.5.0        |     
                       tinyssh |  DISTRO  | https://release-monitoring.org/project/14678 | 20210601     | 20220311     |     
                       tinyxml |  DISTRO  | https://release-monitoring.org/project/10162 | 2.6.2_2      | 2.6.2        | ORPH
                           tio |  DISTRO  | https://release-monitoring.org/project/20587 | 1.32         | 1.37         |     
                          tmux |  DISTRO  | https://release-monitoring.org/project/04980 | 3.1c         | 3.2a         |     
                     tpm-tools |  DISTRO  | https://release-monitoring.org/project/21640 | 1.3.9.1      | 1.3.9.2      |     
                    tpm2-abrmd |  DISTRO  | https://release-monitoring.org/project/16819 | 2.3.3        | 2.4.1        | ORPH
                   tpm2-pkcs11 |  DISTRO  | https://release-monitoring.org/project/18777 | 1.7.0        | 1.8.0        |     
                     tpm2-totp |  DISTRO  | https://release-monitoring.org/project/18790 | 0.2.1        | 0.3.0        |     
                      tpm2-tss |  DISTRO  | https://release-monitoring.org/project/12683 | 3.1.0        | 3.2.0        | ORPH
                     trace-cmd |  DISTRO  | https://release-monitoring.org/project/07873 | 2.9.7        | 3.0.3        |     
                        tzdata |  DISTRO  | https://release-monitoring.org/project/05021 | 2021e        | 2022a        |     
                   uboot-tools |  DISTRO  | https://release-monitoring.org/project/05022 | 2021.07      | 2022.04      |     
                       udpcast |  DISTRO  | https://release-monitoring.org/project/10206 | 20200328     | 20211207     | ORPH
                       uftrace |  DISTRO  | https://release-monitoring.org/project/195039 | 0.10         | 0.11         |     
                           uhd |  DISTRO  | https://release-monitoring.org/project/12572 | 3.15.0.0     | 4.1.0.5      |     
                       unionfs |  DISTRO  | https://release-monitoring.org/project/17617 | 2.1          | 2.2          |     
                         unrar |  DISTRO  | https://release-monitoring.org/project/13306 | 6.1.3        | 6.1.6        | ORPH
                      upmpdcli |  DISTRO  | https://release-monitoring.org/project/15848 | 1.5.12       | 1.5.15       |     
                        upower |  DISTRO  | https://release-monitoring.org/project/05056 | 0.99.11      | 0.99.17      |     
                           uvw |  DISTRO  | https://release-monitoring.org/project/33083 | 2.11.0_li... | 2.12.1_li... |     
                          vala |  DISTRO  | https://release-monitoring.org/project/05065 | 0.52.4       | 0.56.0       | ORPH
                      valgrind |  DISTRO  | https://release-monitoring.org/project/13639 | 3.18.1       | 3.19.0       | ORPH
                           vim |  DISTRO  | https://release-monitoring.org/project/05092 | 8.2.4732     | 8.2.4779     | ORPH
                           vlc |  DISTRO  | https://release-monitoring.org/project/06504 | 3.0.16       | 3.0.17.4     |     
                        vnstat |  DISTRO  | https://release-monitoring.org/project/07283 | 2.8          | 2.9          |     
                          vpnc |  DISTRO  | https://release-monitoring.org/project/15955 | 0.5.3r550... | 0.5.3        | ORPH
                           vte |  DISTRO  | https://release-monitoring.org/project/10895 | 0.66.2       | 0.68.0       | ORPH
                         vuejs |  DISTRO  | https://release-monitoring.org/project/89353 | 3.2.22       | 3.2.33       |     
                  vuejs-router |  DISTRO  | https://release-monitoring.org/project/234796 | 4.0.12       | 4.0.14       |     
                vulkan-headers |  DISTRO  | https://release-monitoring.org/project/88835 | 1.2.203      | 1.3.211      | ORPH
                        waffle |  DISTRO  | https://release-monitoring.org/project/21633 | 1.6.1        | 1.7.0        |     
                     waylandpp |  DISTRO  | https://release-monitoring.org/project/16969 | 0.2.8        | 0.2.10       |     
       webrtc-audio-processing |  DISTRO  | https://release-monitoring.org/project/15929 | 0.3.1        | 1.0          | ORPH
                         whois |  DISTRO  | https://release-monitoring.org/project/05128 | 5.5.11       | 5.5.13       |     
             wilc1000-firmware |  DISTRO  | https://release-monitoring.org/project/65598 | 14.1         | 15.7         |     
                          wine |  DISTRO  | https://release-monitoring.org/project/05134 | 6.0          | 7.6          |     
        wireguard-linux-compat |  DISTRO  | https://release-monitoring.org/project/62379 | 1.0.20210606 | 1.0.20211208 |     
                wireless-regdb |  DISTRO  | https://release-monitoring.org/project/15257 | 2022.02.18   | 2022.04.08   |     
                   wireplumber |  DISTRO  | https://release-monitoring.org/project/235056 | 0.4.8        | 0.4.9        | ORPH
                     wireshark |  DISTRO  | https://release-monitoring.org/project/05137 | 3.4.12       | 3.6.3        | ORPH
                       wlroots |  DISTRO  | https://release-monitoring.org/project/18357 | 0.14.1       | 0.15.1       |     
                   xapp_appres |  DISTRO  | https://release-monitoring.org/project/15053 | 1.0.5        | 1.0.6        |     
                  xapp_editres |  DISTRO  | https://release-monitoring.org/project/17160 | 1.0.7        | 1.0.8        |     
                  xapp_iceauth |  DISTRO  | https://release-monitoring.org/project/15048 | 1.0.8        | 1.0.9        |     
                  xapp_listres |  DISTRO  | https://release-monitoring.org/project/17161 | 1.0.4        | 1.0.5        |     
                     xapp_luit |  DISTRO  | https://release-monitoring.org/project/15047 | 1.1.1        | 20220111     |     
              xapp_mkfontscale |  DISTRO  | https://release-monitoring.org/project/15043 | 1.2.1        | 1.2.2        |     
                   xapp_rstart |  DISTRO  | https://release-monitoring.org/project/21256 | 1.0.5        | 1.0.6        |     
                xapp_setxkbmap |  DISTRO  | https://release-monitoring.org/project/12314 | 1.3.2        | 1.3.3        |     
                      xapp_twm |  DISTRO  | https://release-monitoring.org/project/15038 | 1.0.11       | 1.0.12       |     
                    xapp_xcalc |  DISTRO  | https://release-monitoring.org/project/05164 | 1.1.0        | 1.1.1        |     
                   xapp_xclock |  DISTRO  | https://release-monitoring.org/project/15032 | 1.0.9        | 1.1.1        |     
                      xapp_xdm |  DISTRO  | https://release-monitoring.org/project/05255 | 1.1.12       | 1.1.13       |     
                 xapp_xdpyinfo |  DISTRO  | https://release-monitoring.org/project/15028 | 1.3.2        | 1.3.3        |     
                    xapp_xedit |  DISTRO  | https://release-monitoring.org/project/05180 | 1.2.2        | 1.2.3        |     
                    xapp_xload |  DISTRO  | https://release-monitoring.org/project/14992 | 1.1.3        | 1.1.4        |     
                 xapp_xlsfonts |  DISTRO  | https://release-monitoring.org/project/14964 | 1.0.6        | 1.0.7        |     
                      xapp_xsm |  DISTRO  | https://release-monitoring.org/project/05259 | 1.0.4        | 1.0.5        |     
   xdriver_xf86-input-libinput |  DISTRO  | https://release-monitoring.org/project/05782 | 1.2.0        | 1.2.1        |     
     xdriver_xf86-video-amdgpu |  DISTRO  | https://release-monitoring.org/project/15900 | 19.1.0       | 22.0.0       |     
      xdriver_xf86-video-dummy |  DISTRO  | https://release-monitoring.org/project/05216 | 0.3.8        | 0.4.0        |     
                           xen |  DISTRO  | https://release-monitoring.org/project/05181 | 4.14.4       | 4.16.1       |     
                      xfsprogs |  DISTRO  | https://release-monitoring.org/project/05188 | 5.14.2       | 5.15.0       | ORPH
                        xinetd |  DISTRO  | https://release-monitoring.org/project/06382 | 2.3.15       | 2.3.15.4     |     
              xkeyboard-config |  DISTRO  | https://release-monitoring.org/project/05191 | 2.34         | 2.35.1       |     
                   xlib_libX11 |  DISTRO  | https://release-monitoring.org/project/01764 | 1.7.3.1      | 1.7.5        |     
               xlib_libXcursor |  DISTRO  | https://release-monitoring.org/project/01770 | 1.2.0        | 1.2.1        |     
                  xlib_libXvMC |  DISTRO  | https://release-monitoring.org/project/01796 | 1.0.12       | 1.0.13       |     
                         xmrig |  DISTRO  | https://release-monitoring.org/project/17499 | 6.16.4       | 6.17.0       |     
           xserver_xorg-server |  DISTRO  | https://release-monitoring.org/project/05250 | 21.1.2       | 21.1.3       |     
                xtables-addons |  DISTRO  | https://release-monitoring.org/project/07736 | 3.17         | 3.20         | ORPH
                         xterm |  DISTRO  | https://release-monitoring.org/project/05272 | 371          | 372          | ORPH
                           yad |  DISTRO  | https://release-monitoring.org/project/05280 | 0.40.0       | 11.1         |     
                      yaml-cpp |  DISTRO  | https://release-monitoring.org/project/05284 | 0.6.3        | 0.7.0        | ORPH
                        zabbix |  DISTRO  | https://release-monitoring.org/project/05492 | 5.4.9        | 6.0.3        |     
                        zchunk |  DISTRO  | https://release-monitoring.org/project/178035 | 1.1.16       | 1.2.1        |     
                           zfs |  DISTRO  | https://release-monitoring.org/project/11706 | 2.0.5        | 2.1.4        |     
                           zic |  DISTRO  | https://release-monitoring.org/project/16905 | 2021e        | 2022a        |     

Packages having CVEs
====================

CVEs for the 'master' branch
----------------------------

             name              |       CVE        |                             link                            
-------------------------------+------------------+--------------------------------------------------------------
                        apache | CVE-1999-0236    | https://security-tracker.debian.org/tracker/CVE-1999-0236   
                        apache | CVE-1999-0289    | https://security-tracker.debian.org/tracker/CVE-1999-0289   
                        apache | CVE-1999-0678    | https://security-tracker.debian.org/tracker/CVE-1999-0678   
                        apache | CVE-1999-1237    | https://security-tracker.debian.org/tracker/CVE-1999-1237   
                        apache | CVE-1999-1412    | https://security-tracker.debian.org/tracker/CVE-1999-1412   
                        apache | CVE-2007-0086    | https://security-tracker.debian.org/tracker/CVE-2007-0086   
                        apache | CVE-2007-0450    | https://security-tracker.debian.org/tracker/CVE-2007-0450   
                        apache | CVE-2007-4465    | https://security-tracker.debian.org/tracker/CVE-2007-4465   
                        apache | CVE-2007-5000    | https://security-tracker.debian.org/tracker/CVE-2007-5000   
                        apache | CVE-2007-6388    | https://security-tracker.debian.org/tracker/CVE-2007-6388   
                        apache | CVE-2007-6420    | https://security-tracker.debian.org/tracker/CVE-2007-6420   
                        apache | CVE-2007-6421    | https://security-tracker.debian.org/tracker/CVE-2007-6421   
                        apache | CVE-2007-6422    | https://security-tracker.debian.org/tracker/CVE-2007-6422   
                        apache | CVE-2007-6423    | https://security-tracker.debian.org/tracker/CVE-2007-6423   
                        apache | CVE-2008-0455    | https://security-tracker.debian.org/tracker/CVE-2008-0455   
                        apache | CVE-2008-2168    | https://security-tracker.debian.org/tracker/CVE-2008-2168   
                        apache | CVE-2008-2939    | https://security-tracker.debian.org/tracker/CVE-2008-2939   
                        apache | CVE-2009-1195    | https://security-tracker.debian.org/tracker/CVE-2009-1195   
                        apache | CVE-2009-1890    | https://security-tracker.debian.org/tracker/CVE-2009-1890   
                        apache | CVE-2009-1891    | https://security-tracker.debian.org/tracker/CVE-2009-1891   
                        apache | CVE-2009-2699    | https://security-tracker.debian.org/tracker/CVE-2009-2699   
                        apache | CVE-2010-0408    | https://security-tracker.debian.org/tracker/CVE-2010-0408   
                        apache | CVE-2010-0425    | https://security-tracker.debian.org/tracker/CVE-2010-0425   
                        apache | CVE-2010-0434    | https://security-tracker.debian.org/tracker/CVE-2010-0434   
                        apache | CVE-2010-1452    | https://security-tracker.debian.org/tracker/CVE-2010-1452   
                        apache | CVE-2014-0231    | https://security-tracker.debian.org/tracker/CVE-2014-0231   
                      apparmor | CVE-2016-1585    | https://security-tracker.debian.org/tracker/CVE-2016-1585   
                         argus | CVE-2011-3332    | https://security-tracker.debian.org/tracker/CVE-2011-3332   
                         asn1c | CVE-2017-12966   | https://security-tracker.debian.org/tracker/CVE-2017-12966  
                          atop | CVE-2011-3618    | https://security-tracker.debian.org/tracker/CVE-2011-3618   
                         avahi | CVE-2021-3468    | https://security-tracker.debian.org/tracker/CVE-2021-3468   
                     belle-sip | CVE-2021-33056   | https://security-tracker.debian.org/tracker/CVE-2021-33056  
                     belle-sip | CVE-2021-43610   | https://security-tracker.debian.org/tracker/CVE-2021-43610  
                     belle-sip | CVE-2021-43611   | https://security-tracker.debian.org/tracker/CVE-2021-43611  
                        bento4 | CVE-2020-23331   | https://security-tracker.debian.org/tracker/CVE-2020-23331  
                        bento4 | CVE-2020-23332   | https://security-tracker.debian.org/tracker/CVE-2020-23332  
                        bento4 | CVE-2022-27607   | https://security-tracker.debian.org/tracker/CVE-2022-27607  
                    berkeleydb | CVE-2017-3604    | https://security-tracker.debian.org/tracker/CVE-2017-3604   
                    berkeleydb | CVE-2017-3605    | https://security-tracker.debian.org/tracker/CVE-2017-3605   
                    berkeleydb | CVE-2017-3606    | https://security-tracker.debian.org/tracker/CVE-2017-3606   
                    berkeleydb | CVE-2017-3607    | https://security-tracker.debian.org/tracker/CVE-2017-3607   
                    berkeleydb | CVE-2017-3608    | https://security-tracker.debian.org/tracker/CVE-2017-3608   
                    berkeleydb | CVE-2017-3609    | https://security-tracker.debian.org/tracker/CVE-2017-3609   
                    berkeleydb | CVE-2017-3610    | https://security-tracker.debian.org/tracker/CVE-2017-3610   
                    berkeleydb | CVE-2017-3611    | https://security-tracker.debian.org/tracker/CVE-2017-3611   
                    berkeleydb | CVE-2017-3612    | https://security-tracker.debian.org/tracker/CVE-2017-3612   
                    berkeleydb | CVE-2017-3613    | https://security-tracker.debian.org/tracker/CVE-2017-3613   
                    berkeleydb | CVE-2017-3614    | https://security-tracker.debian.org/tracker/CVE-2017-3614   
                    berkeleydb | CVE-2017-3615    | https://security-tracker.debian.org/tracker/CVE-2017-3615   
                    berkeleydb | CVE-2017-3616    | https://security-tracker.debian.org/tracker/CVE-2017-3616   
                    berkeleydb | CVE-2017-3617    | https://security-tracker.debian.org/tracker/CVE-2017-3617   
                    berkeleydb | CVE-2019-2708    | https://security-tracker.debian.org/tracker/CVE-2019-2708   
                    berkeleydb | CVE-2020-2981    | https://security-tracker.debian.org/tracker/CVE-2020-2981   
                      binutils | CVE-2021-45078   | https://security-tracker.debian.org/tracker/CVE-2021-45078  
                       bitcoin | CVE-2012-1909    | https://security-tracker.debian.org/tracker/CVE-2012-1909   
                       bitcoin | CVE-2012-4682    | https://security-tracker.debian.org/tracker/CVE-2012-4682   
                       bitcoin | CVE-2012-4683    | https://security-tracker.debian.org/tracker/CVE-2012-4683   
                       bitcoin | CVE-2013-2272    | https://security-tracker.debian.org/tracker/CVE-2013-2272   
                       bitcoin | CVE-2013-2273    | https://security-tracker.debian.org/tracker/CVE-2013-2273   
                       bitcoin | CVE-2013-2292    | https://security-tracker.debian.org/tracker/CVE-2013-2292   
                       bitcoin | CVE-2013-2293    | https://security-tracker.debian.org/tracker/CVE-2013-2293   
                       bitcoin | CVE-2013-3220    | https://security-tracker.debian.org/tracker/CVE-2013-3220   
                  bluez5_utils | CVE-2020-12352   | https://security-tracker.debian.org/tracker/CVE-2020-12352  
                  bluez5_utils | CVE-2020-24490   | https://security-tracker.debian.org/tracker/CVE-2020-24490  
          bluez5_utils-headers | CVE-2020-12352   | https://security-tracker.debian.org/tracker/CVE-2020-12352  
          bluez5_utils-headers | CVE-2020-24490   | https://security-tracker.debian.org/tracker/CVE-2020-24490  
                        bsdiff | CVE-2020-14315   | https://security-tracker.debian.org/tracker/CVE-2020-14315  
                       busybox | CVE-2022-28391   | https://security-tracker.debian.org/tracker/CVE-2022-28391  
                         cairo | CVE-2019-6461    | https://security-tracker.debian.org/tracker/CVE-2019-6461   
                         cairo | CVE-2019-6462    | https://security-tracker.debian.org/tracker/CVE-2019-6462   
                         cairo | CVE-2020-35492   | https://security-tracker.debian.org/tracker/CVE-2020-35492  
                        clamav | CVE-2016-1405    | https://security-tracker.debian.org/tracker/CVE-2016-1405   
                     coreutils | CVE-2016-2781    | https://security-tracker.debian.org/tracker/CVE-2016-2781   
                          cpio | CVE-2010-4226    | https://security-tracker.debian.org/tracker/CVE-2010-4226   
                      cryptopp | CVE-2021-43398   | https://security-tracker.debian.org/tracker/CVE-2021-43398  
                          cups | CVE-2018-6553    | https://security-tracker.debian.org/tracker/CVE-2018-6553   
                           cvs | CVE-2017-12836   | https://security-tracker.debian.org/tracker/CVE-2017-12836  
                     darkhttpd | CVE-2020-25691   | https://security-tracker.debian.org/tracker/CVE-2020-25691  
                       dnsmasq | CVE-2021-45951   | https://security-tracker.debian.org/tracker/CVE-2021-45951  
                       dnsmasq | CVE-2021-45952   | https://security-tracker.debian.org/tracker/CVE-2021-45952  
                       dnsmasq | CVE-2021-45953   | https://security-tracker.debian.org/tracker/CVE-2021-45953  
                       dnsmasq | CVE-2021-45954   | https://security-tracker.debian.org/tracker/CVE-2021-45954  
                       dnsmasq | CVE-2021-45955   | https://security-tracker.debian.org/tracker/CVE-2021-45955  
                       dnsmasq | CVE-2021-45956   | https://security-tracker.debian.org/tracker/CVE-2021-45956  
                       dnsmasq | CVE-2021-45957   | https://security-tracker.debian.org/tracker/CVE-2021-45957  
                        docker | CVE-2014-0048    | https://security-tracker.debian.org/tracker/CVE-2014-0048   
                        docker | CVE-2014-8178    | https://security-tracker.debian.org/tracker/CVE-2014-8178   
                        docker | CVE-2014-8179    | https://security-tracker.debian.org/tracker/CVE-2014-8179   
                        docker | CVE-2015-1843    | https://security-tracker.debian.org/tracker/CVE-2015-1843   
                        docker | CVE-2015-3627    | https://security-tracker.debian.org/tracker/CVE-2015-3627   
                        docker | CVE-2015-3630    | https://security-tracker.debian.org/tracker/CVE-2015-3630   
                        docker | CVE-2015-3631    | https://security-tracker.debian.org/tracker/CVE-2015-3631   
                        docker | CVE-2016-3697    | https://security-tracker.debian.org/tracker/CVE-2016-3697   
                        docker | CVE-2017-14992   | https://security-tracker.debian.org/tracker/CVE-2017-14992  
                        docker | CVE-2019-13139   | https://security-tracker.debian.org/tracker/CVE-2019-13139  
                        docker | CVE-2019-13509   | https://security-tracker.debian.org/tracker/CVE-2019-13509  
                        docker | CVE-2019-15752   | https://security-tracker.debian.org/tracker/CVE-2019-15752  
                        docker | CVE-2019-16884   | https://security-tracker.debian.org/tracker/CVE-2019-16884  
                        docker | CVE-2019-5736    | https://security-tracker.debian.org/tracker/CVE-2019-5736   
                        docker | CVE-2020-27534   | https://security-tracker.debian.org/tracker/CVE-2020-27534  
                        docker | CVE-2021-21284   | https://security-tracker.debian.org/tracker/CVE-2021-21284  
                        docker | CVE-2021-21285   | https://security-tracker.debian.org/tracker/CVE-2021-21285  
                        docker | CVE-2021-3162    | https://security-tracker.debian.org/tracker/CVE-2021-3162   
                        docker | CVE-2021-33183   | https://security-tracker.debian.org/tracker/CVE-2021-33183  
                        docker | CVE-2022-25365   | https://security-tracker.debian.org/tracker/CVE-2022-25365  
                          edk2 | CVE-2014-4859    | https://security-tracker.debian.org/tracker/CVE-2014-4859   
                          edk2 | CVE-2014-4860    | https://security-tracker.debian.org/tracker/CVE-2014-4860   
                          edk2 | CVE-2014-8271    | https://security-tracker.debian.org/tracker/CVE-2014-8271   
                          edk2 | CVE-2019-14553   | https://security-tracker.debian.org/tracker/CVE-2019-14553  
                          edk2 | CVE-2019-14559   | https://security-tracker.debian.org/tracker/CVE-2019-14559  
                          edk2 | CVE-2019-14562   | https://security-tracker.debian.org/tracker/CVE-2019-14562  
                          edk2 | CVE-2019-14563   | https://security-tracker.debian.org/tracker/CVE-2019-14563  
                          edk2 | CVE-2019-14575   | https://security-tracker.debian.org/tracker/CVE-2019-14575  
                          edk2 | CVE-2019-14586   | https://security-tracker.debian.org/tracker/CVE-2019-14586  
                          edk2 | CVE-2019-14587   | https://security-tracker.debian.org/tracker/CVE-2019-14587  
                         emlog | CVE-2021-44584   | https://security-tracker.debian.org/tracker/CVE-2021-44584  
                        erlang | CVE-2020-35733   | https://security-tracker.debian.org/tracker/CVE-2020-35733  
                          exim | CVE-2020-28017   | https://security-tracker.debian.org/tracker/CVE-2020-28017  
                         exiv2 | CVE-2007-6353    | https://security-tracker.debian.org/tracker/CVE-2007-6353   
                        ffmpeg | CVE-2021-38291   | https://security-tracker.debian.org/tracker/CVE-2021-38291  
                           git | CVE-2022-24975   | https://security-tracker.debian.org/tracker/CVE-2022-24975  
                         glibc | CVE-2010-4756    | https://security-tracker.debian.org/tracker/CVE-2010-4756   
                         glibc | CVE-2019-1010022 | https://security-tracker.debian.org/tracker/CVE-2019-1010022
                         glibc | CVE-2019-1010023 | https://security-tracker.debian.org/tracker/CVE-2019-1010023
                         glibc | CVE-2019-1010024 | https://security-tracker.debian.org/tracker/CVE-2019-1010024
                         glibc | CVE-2019-1010025 | https://security-tracker.debian.org/tracker/CVE-2019-1010025
                         gnupg | CVE-2006-3082    | https://security-tracker.debian.org/tracker/CVE-2006-3082   
                         gnupg | CVE-2011-2207    | https://security-tracker.debian.org/tracker/CVE-2011-2207   
                         gnupg | CVE-2015-1606    | https://security-tracker.debian.org/tracker/CVE-2015-1606   
                         gnupg | CVE-2018-12020   | https://security-tracker.debian.org/tracker/CVE-2018-12020  
                         gnupg | CVE-2019-13050   | https://security-tracker.debian.org/tracker/CVE-2019-13050  
                         gnupg | CVE-2019-14855   | https://security-tracker.debian.org/tracker/CVE-2019-14855  
                            go | CVE-2020-29509   | https://security-tracker.debian.org/tracker/CVE-2020-29509  
                            go | CVE-2020-29511   | https://security-tracker.debian.org/tracker/CVE-2020-29511  
                graphicsmagick | CVE-2007-0770    | https://security-tracker.debian.org/tracker/CVE-2007-0770   
                graphicsmagick | CVE-2008-6621    | https://security-tracker.debian.org/tracker/CVE-2008-6621   
                     graphite2 | CVE-2017-5436    | https://security-tracker.debian.org/tracker/CVE-2017-5436   
                         grub2 | CVE-2021-3981    | https://security-tracker.debian.org/tracker/CVE-2021-3981   
                         grub2 | CVE-2021-46705   | https://security-tracker.debian.org/tracker/CVE-2021-46705  
                       haproxy | CVE-2016-2102    | https://security-tracker.debian.org/tracker/CVE-2016-2102   
                       haproxy | CVE-2022-0711    | https://security-tracker.debian.org/tracker/CVE-2022-0711   
                heirloom-mailx | CVE-2004-2771    | https://security-tracker.debian.org/tracker/CVE-2004-2771   
                   imagemagick | CVE-2007-1667    | https://security-tracker.debian.org/tracker/CVE-2007-1667   
                   imagemagick | CVE-2014-9804    | https://security-tracker.debian.org/tracker/CVE-2014-9804   
                   imagemagick | CVE-2014-9805    | https://security-tracker.debian.org/tracker/CVE-2014-9805   
                   imagemagick | CVE-2014-9806    | https://security-tracker.debian.org/tracker/CVE-2014-9806   
                   imagemagick | CVE-2014-9807    | https://security-tracker.debian.org/tracker/CVE-2014-9807   
                   imagemagick | CVE-2014-9808    | https://security-tracker.debian.org/tracker/CVE-2014-9808   
                   imagemagick | CVE-2014-9809    | https://security-tracker.debian.org/tracker/CVE-2014-9809   
                   imagemagick | CVE-2014-9810    | https://security-tracker.debian.org/tracker/CVE-2014-9810   
                   imagemagick | CVE-2014-9811    | https://security-tracker.debian.org/tracker/CVE-2014-9811   
                   imagemagick | CVE-2014-9812    | https://security-tracker.debian.org/tracker/CVE-2014-9812   
                   imagemagick | CVE-2014-9813    | https://security-tracker.debian.org/tracker/CVE-2014-9813   
                   imagemagick | CVE-2014-9814    | https://security-tracker.debian.org/tracker/CVE-2014-9814   
                   imagemagick | CVE-2014-9815    | https://security-tracker.debian.org/tracker/CVE-2014-9815   
                   imagemagick | CVE-2014-9816    | https://security-tracker.debian.org/tracker/CVE-2014-9816   
                   imagemagick | CVE-2014-9817    | https://security-tracker.debian.org/tracker/CVE-2014-9817   
                   imagemagick | CVE-2014-9818    | https://security-tracker.debian.org/tracker/CVE-2014-9818   
                   imagemagick | CVE-2014-9819    | https://security-tracker.debian.org/tracker/CVE-2014-9819   
                   imagemagick | CVE-2014-9820    | https://security-tracker.debian.org/tracker/CVE-2014-9820   
                   imagemagick | CVE-2014-9821    | https://security-tracker.debian.org/tracker/CVE-2014-9821   
                   imagemagick | CVE-2014-9822    | https://security-tracker.debian.org/tracker/CVE-2014-9822   
                   imagemagick | CVE-2014-9823    | https://security-tracker.debian.org/tracker/CVE-2014-9823   
                   imagemagick | CVE-2014-9824    | https://security-tracker.debian.org/tracker/CVE-2014-9824   
                   imagemagick | CVE-2014-9825    | https://security-tracker.debian.org/tracker/CVE-2014-9825   
                   imagemagick | CVE-2014-9826    | https://security-tracker.debian.org/tracker/CVE-2014-9826   
                   imagemagick | CVE-2014-9827    | https://security-tracker.debian.org/tracker/CVE-2014-9827   
                   imagemagick | CVE-2014-9828    | https://security-tracker.debian.org/tracker/CVE-2014-9828   
                   imagemagick | CVE-2014-9829    | https://security-tracker.debian.org/tracker/CVE-2014-9829   
                   imagemagick | CVE-2014-9830    | https://security-tracker.debian.org/tracker/CVE-2014-9830   
                   imagemagick | CVE-2014-9831    | https://security-tracker.debian.org/tracker/CVE-2014-9831   
                   imagemagick | CVE-2014-9848    | https://security-tracker.debian.org/tracker/CVE-2014-9848   
                   imagemagick | CVE-2014-9852    | https://security-tracker.debian.org/tracker/CVE-2014-9852   
                   imagemagick | CVE-2014-9853    | https://security-tracker.debian.org/tracker/CVE-2014-9853   
                   imagemagick | CVE-2014-9854    | https://security-tracker.debian.org/tracker/CVE-2014-9854   
                   imagemagick | CVE-2014-9907    | https://security-tracker.debian.org/tracker/CVE-2014-9907   
                   imagemagick | CVE-2016-10062   | https://security-tracker.debian.org/tracker/CVE-2016-10062  
                   imagemagick | CVE-2016-10144   | https://security-tracker.debian.org/tracker/CVE-2016-10144  
                   imagemagick | CVE-2016-10145   | https://security-tracker.debian.org/tracker/CVE-2016-10145  
                   imagemagick | CVE-2016-10146   | https://security-tracker.debian.org/tracker/CVE-2016-10146  
                   imagemagick | CVE-2016-7513    | https://security-tracker.debian.org/tracker/CVE-2016-7513   
                   imagemagick | CVE-2016-7514    | https://security-tracker.debian.org/tracker/CVE-2016-7514   
                   imagemagick | CVE-2016-7515    | https://security-tracker.debian.org/tracker/CVE-2016-7515   
                   imagemagick | CVE-2016-7516    | https://security-tracker.debian.org/tracker/CVE-2016-7516   
                   imagemagick | CVE-2016-7517    | https://security-tracker.debian.org/tracker/CVE-2016-7517   
                   imagemagick | CVE-2016-7518    | https://security-tracker.debian.org/tracker/CVE-2016-7518   
                   imagemagick | CVE-2016-7519    | https://security-tracker.debian.org/tracker/CVE-2016-7519   
                   imagemagick | CVE-2016-7520    | https://security-tracker.debian.org/tracker/CVE-2016-7520   
                   imagemagick | CVE-2016-7521    | https://security-tracker.debian.org/tracker/CVE-2016-7521   
                   imagemagick | CVE-2016-7522    | https://security-tracker.debian.org/tracker/CVE-2016-7522   
                   imagemagick | CVE-2016-7523    | https://security-tracker.debian.org/tracker/CVE-2016-7523   
                   imagemagick | CVE-2016-7524    | https://security-tracker.debian.org/tracker/CVE-2016-7524   
                   imagemagick | CVE-2016-7525    | https://security-tracker.debian.org/tracker/CVE-2016-7525   
                   imagemagick | CVE-2016-7526    | https://security-tracker.debian.org/tracker/CVE-2016-7526   
                   imagemagick | CVE-2016-7527    | https://security-tracker.debian.org/tracker/CVE-2016-7527   
                   imagemagick | CVE-2016-7528    | https://security-tracker.debian.org/tracker/CVE-2016-7528   
                   imagemagick | CVE-2016-7529    | https://security-tracker.debian.org/tracker/CVE-2016-7529   
                   imagemagick | CVE-2016-7530    | https://security-tracker.debian.org/tracker/CVE-2016-7530   
                   imagemagick | CVE-2016-7531    | https://security-tracker.debian.org/tracker/CVE-2016-7531   
                   imagemagick | CVE-2016-7532    | https://security-tracker.debian.org/tracker/CVE-2016-7532   
                   imagemagick | CVE-2016-7533    | https://security-tracker.debian.org/tracker/CVE-2016-7533   
                   imagemagick | CVE-2016-7534    | https://security-tracker.debian.org/tracker/CVE-2016-7534   
                   imagemagick | CVE-2016-7535    | https://security-tracker.debian.org/tracker/CVE-2016-7535   
                   imagemagick | CVE-2016-7536    | https://security-tracker.debian.org/tracker/CVE-2016-7536   
                   imagemagick | CVE-2016-7537    | https://security-tracker.debian.org/tracker/CVE-2016-7537   
                   imagemagick | CVE-2016-7538    | https://security-tracker.debian.org/tracker/CVE-2016-7538   
                   imagemagick | CVE-2017-5506    | https://security-tracker.debian.org/tracker/CVE-2017-5506   
                   imagemagick | CVE-2017-5509    | https://security-tracker.debian.org/tracker/CVE-2017-5509   
                   imagemagick | CVE-2017-5510    | https://security-tracker.debian.org/tracker/CVE-2017-5510   
                   imagemagick | CVE-2017-5511    | https://security-tracker.debian.org/tracker/CVE-2017-5511   
                        jasper | CVE-2015-8751    | https://security-tracker.debian.org/tracker/CVE-2015-8751   
                        jquery | CVE-2007-2379    | https://security-tracker.debian.org/tracker/CVE-2007-2379   
                         libao | CVE-2017-11548   | https://security-tracker.debian.org/tracker/CVE-2017-11548  
                  libfreeimage | CVE-2019-12211   | https://security-tracker.debian.org/tracker/CVE-2019-12211  
                  libfreeimage | CVE-2019-12212   | https://security-tracker.debian.org/tracker/CVE-2019-12212  
                  libfreeimage | CVE-2019-12213   | https://security-tracker.debian.org/tracker/CVE-2019-12213  
                  libfreeimage | CVE-2019-12214   | https://security-tracker.debian.org/tracker/CVE-2019-12214  
                     libiberty | CVE-2012-3509    | https://security-tracker.debian.org/tracker/CVE-2012-3509   
                     libiberty | CVE-2016-2226    | https://security-tracker.debian.org/tracker/CVE-2016-2226   
                     libiberty | CVE-2016-4487    | https://security-tracker.debian.org/tracker/CVE-2016-4487   
                     libiberty | CVE-2016-4488    | https://security-tracker.debian.org/tracker/CVE-2016-4488   
                     libiberty | CVE-2016-4489    | https://security-tracker.debian.org/tracker/CVE-2016-4489   
                     libiberty | CVE-2016-4490    | https://security-tracker.debian.org/tracker/CVE-2016-4490   
                     libiberty | CVE-2016-4491    | https://security-tracker.debian.org/tracker/CVE-2016-4491   
                     libiberty | CVE-2016-4492    | https://security-tracker.debian.org/tracker/CVE-2016-4492   
                     libiberty | CVE-2016-4493    | https://security-tracker.debian.org/tracker/CVE-2016-4493   
                     libiberty | CVE-2016-6131    | https://security-tracker.debian.org/tracker/CVE-2016-6131   
                       libkrb5 | CVE-1999-0143    | https://security-tracker.debian.org/tracker/CVE-1999-0143   
                       libkrb5 | CVE-1999-0713    | https://security-tracker.debian.org/tracker/CVE-1999-0713   
                       libkrb5 | CVE-2007-3149    | https://security-tracker.debian.org/tracker/CVE-2007-3149   
                       libkrb5 | CVE-2007-5894    | https://security-tracker.debian.org/tracker/CVE-2007-5894   
                       libkrb5 | CVE-2007-5902    | https://security-tracker.debian.org/tracker/CVE-2007-5902   
                       libkrb5 | CVE-2009-0844    | https://security-tracker.debian.org/tracker/CVE-2009-0844   
                       libkrb5 | CVE-2009-0846    | https://security-tracker.debian.org/tracker/CVE-2009-0846   
                        libmad | CVE-2018-7263    | https://security-tracker.debian.org/tracker/CVE-2018-7263   
                      libpjsip | CVE-2022-24754   | https://security-tracker.debian.org/tracker/CVE-2022-24754  
                      libpjsip | CVE-2022-24764   | https://security-tracker.debian.org/tracker/CVE-2022-24764  
                      libplist | CVE-2017-5834    | https://security-tracker.debian.org/tracker/CVE-2017-5834   
                      libplist | CVE-2017-5835    | https://security-tracker.debian.org/tracker/CVE-2017-5835   
                      libplist | CVE-2017-5836    | https://security-tracker.debian.org/tracker/CVE-2017-5836   
                    libtorrent | CVE-2009-1760    | https://security-tracker.debian.org/tracker/CVE-2009-1760   
                    libtorrent | CVE-2016-5301    | https://security-tracker.debian.org/tracker/CVE-2016-5301   
                       libvirt | CVE-2014-8135    | https://security-tracker.debian.org/tracker/CVE-2014-8135   
                       libvirt | CVE-2014-8136    | https://security-tracker.debian.org/tracker/CVE-2014-8136   
                       libvirt | CVE-2015-5313    | https://security-tracker.debian.org/tracker/CVE-2015-5313   
                       libvirt | CVE-2018-5748    | https://security-tracker.debian.org/tracker/CVE-2018-5748   
                       libvirt | CVE-2018-6764    | https://security-tracker.debian.org/tracker/CVE-2018-6764   
                         lrzsz | CVE-2018-10195   | https://security-tracker.debian.org/tracker/CVE-2018-10195  
                           lua | CVE-2014-5461    | https://security-tracker.debian.org/tracker/CVE-2014-5461   
                           lua | CVE-2020-15888   | https://security-tracker.debian.org/tracker/CVE-2020-15888  
                           lua | CVE-2020-15945   | https://security-tracker.debian.org/tracker/CVE-2020-15945  
                           lua | CVE-2021-43519   | https://security-tracker.debian.org/tracker/CVE-2021-43519  
                           lua | CVE-2022-28805   | https://security-tracker.debian.org/tracker/CVE-2022-28805  
                       mariadb | CVE-2021-46669   | https://security-tracker.debian.org/tracker/CVE-2021-46669  
                       mbedtls | CVE-2021-45451   | https://security-tracker.debian.org/tracker/CVE-2021-45451  
                       mongodb | CVE-2014-8180    | https://security-tracker.debian.org/tracker/CVE-2014-8180   
                       mongodb | CVE-2017-18381   | https://security-tracker.debian.org/tracker/CVE-2017-18381  
                       mongodb | CVE-2017-2665    | https://security-tracker.debian.org/tracker/CVE-2017-2665   
                         mupdf | CVE-2017-5991    | https://security-tracker.debian.org/tracker/CVE-2017-5991   
                          mutt | CVE-2011-1429    | https://security-tracker.debian.org/tracker/CVE-2011-1429   
                          nasm | CVE-2020-18974   | https://security-tracker.debian.org/tracker/CVE-2020-18974  
                       ncurses | CVE-2021-39537   | https://security-tracker.debian.org/tracker/CVE-2021-39537  
                           ntp | CVE-2014-9750    | https://security-tracker.debian.org/tracker/CVE-2014-9750   
                           ntp | CVE-2014-9751    | https://security-tracker.debian.org/tracker/CVE-2014-9751   
                           ntp | CVE-2015-7691    | https://security-tracker.debian.org/tracker/CVE-2015-7691   
                           ntp | CVE-2015-7692    | https://security-tracker.debian.org/tracker/CVE-2015-7692   
                           ntp | CVE-2015-7701    | https://security-tracker.debian.org/tracker/CVE-2015-7701   
                           ntp | CVE-2015-7702    | https://security-tracker.debian.org/tracker/CVE-2015-7702   
                           ntp | CVE-2015-7703    | https://security-tracker.debian.org/tracker/CVE-2015-7703   
                           ntp | CVE-2015-7704    | https://security-tracker.debian.org/tracker/CVE-2015-7704   
                           ntp | CVE-2015-7705    | https://security-tracker.debian.org/tracker/CVE-2015-7705   
                           ntp | CVE-2015-7849    | https://security-tracker.debian.org/tracker/CVE-2015-7849   
                           ntp | CVE-2015-7850    | https://security-tracker.debian.org/tracker/CVE-2015-7850   
                           ntp | CVE-2015-7852    | https://security-tracker.debian.org/tracker/CVE-2015-7852   
                           ntp | CVE-2015-7853    | https://security-tracker.debian.org/tracker/CVE-2015-7853   
                           ntp | CVE-2015-7854    | https://security-tracker.debian.org/tracker/CVE-2015-7854   
                           ntp | CVE-2015-7855    | https://security-tracker.debian.org/tracker/CVE-2015-7855   
                           ntp | CVE-2015-7973    | https://security-tracker.debian.org/tracker/CVE-2015-7973   
                           ntp | CVE-2015-7974    | https://security-tracker.debian.org/tracker/CVE-2015-7974   
                           ntp | CVE-2015-7977    | https://security-tracker.debian.org/tracker/CVE-2015-7977   
                           ntp | CVE-2016-2518    | https://security-tracker.debian.org/tracker/CVE-2016-2518   
                           ntp | CVE-2016-4953    | https://security-tracker.debian.org/tracker/CVE-2016-4953   
                           ntp | CVE-2016-4954    | https://security-tracker.debian.org/tracker/CVE-2016-4954   
                           ntp | CVE-2016-4955    | https://security-tracker.debian.org/tracker/CVE-2016-4955   
                           ntp | CVE-2016-4956    | https://security-tracker.debian.org/tracker/CVE-2016-4956   
                           ntp | CVE-2016-7426    | https://security-tracker.debian.org/tracker/CVE-2016-7426   
                           ntp | CVE-2016-7434    | https://security-tracker.debian.org/tracker/CVE-2016-7434   
                           ntp | CVE-2017-6458    | https://security-tracker.debian.org/tracker/CVE-2017-6458   
                           ntp | CVE-2018-7170    | https://security-tracker.debian.org/tracker/CVE-2018-7170   
                           ntp | CVE-2018-7185    | https://security-tracker.debian.org/tracker/CVE-2018-7185   
                           ntp | CVE-2019-11331   | https://security-tracker.debian.org/tracker/CVE-2019-11331  
                           ntp | CVE-2019-8936    | https://security-tracker.debian.org/tracker/CVE-2019-8936   
                           ntp | CVE-2020-11868   | https://security-tracker.debian.org/tracker/CVE-2020-11868  
                           ntp | CVE-2020-13817   | https://security-tracker.debian.org/tracker/CVE-2020-13817  
                       opencv3 | CVE-2019-14493   | https://security-tracker.debian.org/tracker/CVE-2019-14493  
                       opencv3 | CVE-2019-15939   | https://security-tracker.debian.org/tracker/CVE-2019-15939  
                       opencv3 | CVE-2019-19624   | https://security-tracker.debian.org/tracker/CVE-2019-19624  
                       openjdk | CVE-2009-2475    | https://security-tracker.debian.org/tracker/CVE-2009-2475   
                       openjdk | CVE-2009-2476    | https://security-tracker.debian.org/tracker/CVE-2009-2476   
                       openjdk | CVE-2009-2689    | https://security-tracker.debian.org/tracker/CVE-2009-2689   
                       openjdk | CVE-2009-2690    | https://security-tracker.debian.org/tracker/CVE-2009-2690   
                       openjdk | CVE-2009-3728    | https://security-tracker.debian.org/tracker/CVE-2009-3728   
                       openjdk | CVE-2009-3879    | https://security-tracker.debian.org/tracker/CVE-2009-3879   
                       openjdk | CVE-2009-3880    | https://security-tracker.debian.org/tracker/CVE-2009-3880   
                       openjdk | CVE-2009-3881    | https://security-tracker.debian.org/tracker/CVE-2009-3881   
                       openjdk | CVE-2009-3882    | https://security-tracker.debian.org/tracker/CVE-2009-3882   
                       openjdk | CVE-2009-3883    | https://security-tracker.debian.org/tracker/CVE-2009-3883   
                       openjdk | CVE-2009-3884    | https://security-tracker.debian.org/tracker/CVE-2009-3884   
                       openjdk | CVE-2013-0169    | https://security-tracker.debian.org/tracker/CVE-2013-0169   
                      openjpeg | CVE-2015-1239    | https://security-tracker.debian.org/tracker/CVE-2015-1239   
                      openjpeg | CVE-2016-9675    | https://security-tracker.debian.org/tracker/CVE-2016-9675   
                      openjpeg | CVE-2021-29338   | https://security-tracker.debian.org/tracker/CVE-2021-29338  
                      openjpeg | CVE-2021-3575    | https://security-tracker.debian.org/tracker/CVE-2021-3575   
                      openjpeg | CVE-2022-1122    | https://security-tracker.debian.org/tracker/CVE-2022-1122   
                      openldap | CVE-2015-3276    | https://security-tracker.debian.org/tracker/CVE-2015-3276   
                       openssh | CVE-2007-2768    | https://security-tracker.debian.org/tracker/CVE-2007-2768   
                       openssh | CVE-2008-3844    | https://security-tracker.debian.org/tracker/CVE-2008-3844   
                       openssh | CVE-2014-9278    | https://security-tracker.debian.org/tracker/CVE-2014-9278   
                      openswan | CVE-2019-10155   | https://security-tracker.debian.org/tracker/CVE-2019-10155  
                         p7zip | CVE-2017-17969   | https://security-tracker.debian.org/tracker/CVE-2017-17969  
                         p7zip | CVE-2018-5996    | https://security-tracker.debian.org/tracker/CVE-2018-5996   
                         patch | CVE-2018-6952    | https://security-tracker.debian.org/tracker/CVE-2018-6952   
                         patch | CVE-2019-20633   | https://security-tracker.debian.org/tracker/CVE-2019-20633  
                           php | CVE-2007-2728    | https://security-tracker.debian.org/tracker/CVE-2007-2728   
                           php | CVE-2007-3205    | https://security-tracker.debian.org/tracker/CVE-2007-3205   
                           php | CVE-2007-4596    | https://security-tracker.debian.org/tracker/CVE-2007-4596   
                        polkit | CVE-2021-4034    | https://security-tracker.debian.org/tracker/CVE-2021-4034   
                    postgresql | CVE-2017-8806    | https://security-tracker.debian.org/tracker/CVE-2017-8806   
                 powerpc-utils | CVE-2014-8165    | https://security-tracker.debian.org/tracker/CVE-2014-8165   
                          pppd | CVE-2018-11574   | https://security-tracker.debian.org/tracker/CVE-2018-11574  
               python-m2crypto | CVE-2020-25657   | https://security-tracker.debian.org/tracker/CVE-2020-25657  
                    python-pip | CVE-2018-20225   | https://security-tracker.debian.org/tracker/CVE-2018-20225  
                python-twisted | CVE-2022-24801   | https://security-tracker.debian.org/tracker/CVE-2022-24801  
                       python3 | CVE-2022-26488   | https://security-tracker.debian.org/tracker/CVE-2022-26488  
                          qemu | CVE-2018-18438   | https://security-tracker.debian.org/tracker/CVE-2018-18438  
                          qemu | CVE-2019-12067   | https://security-tracker.debian.org/tracker/CVE-2019-12067  
                          qemu | CVE-2021-20255   | https://security-tracker.debian.org/tracker/CVE-2021-20255  
                          qemu | CVE-2021-3947    | https://security-tracker.debian.org/tracker/CVE-2021-3947   
                          qemu | CVE-2022-1050    | https://security-tracker.debian.org/tracker/CVE-2022-1050   
                          qemu | CVE-2022-26353   | https://security-tracker.debian.org/tracker/CVE-2022-26353  
                          qemu | CVE-2022-26354   | https://security-tracker.debian.org/tracker/CVE-2022-26354  
                        quagga | CVE-2016-4049    | https://security-tracker.debian.org/tracker/CVE-2016-4049   
                        quagga | CVE-2017-3224    | https://security-tracker.debian.org/tracker/CVE-2017-3224   
                        quagga | CVE-2021-44038   | https://security-tracker.debian.org/tracker/CVE-2021-44038  
               rabbitmq-server | CVE-2018-11087   | https://security-tracker.debian.org/tracker/CVE-2018-11087  
               rabbitmq-server | CVE-2018-1279    | https://security-tracker.debian.org/tracker/CVE-2018-1279   
                   resiprocate | CVE-2017-9454    | https://security-tracker.debian.org/tracker/CVE-2017-9454   
                        samba4 | CVE-2011-2411    | https://security-tracker.debian.org/tracker/CVE-2011-2411   
                        samba4 | CVE-2018-1050    | https://security-tracker.debian.org/tracker/CVE-2018-1050   
                        samba4 | CVE-2018-1057    | https://security-tracker.debian.org/tracker/CVE-2018-1057   
                           sdl | CVE-2019-13616   | https://security-tracker.debian.org/tracker/CVE-2019-13616  
                           sdl | CVE-2019-14906   | https://security-tracker.debian.org/tracker/CVE-2019-14906  
                           sdl | CVE-2019-7572    | https://security-tracker.debian.org/tracker/CVE-2019-7572   
                           sdl | CVE-2019-7573    | https://security-tracker.debian.org/tracker/CVE-2019-7573   
                           sdl | CVE-2019-7574    | https://security-tracker.debian.org/tracker/CVE-2019-7574   
                           sdl | CVE-2019-7575    | https://security-tracker.debian.org/tracker/CVE-2019-7575   
                           sdl | CVE-2019-7576    | https://security-tracker.debian.org/tracker/CVE-2019-7576   
                           sdl | CVE-2019-7577    | https://security-tracker.debian.org/tracker/CVE-2019-7577   
                           sdl | CVE-2019-7578    | https://security-tracker.debian.org/tracker/CVE-2019-7578   
                           sdl | CVE-2019-7635    | https://security-tracker.debian.org/tracker/CVE-2019-7635   
                           sdl | CVE-2019-7636    | https://security-tracker.debian.org/tracker/CVE-2019-7636   
                           sdl | CVE-2019-7637    | https://security-tracker.debian.org/tracker/CVE-2019-7637   
                           sdl | CVE-2019-7638    | https://security-tracker.debian.org/tracker/CVE-2019-7638   
                           sdl | CVE-2020-14409   | https://security-tracker.debian.org/tracker/CVE-2020-14409  
                           sdl | CVE-2020-14410   | https://security-tracker.debian.org/tracker/CVE-2020-14410  
                         smack | CVE-2014-0363    | https://security-tracker.debian.org/tracker/CVE-2014-0363   
                         smack | CVE-2014-0364    | https://security-tracker.debian.org/tracker/CVE-2014-0364   
                         smack | CVE-2016-10027   | https://security-tracker.debian.org/tracker/CVE-2016-10027  
                         spice | CVE-2016-0749    | https://security-tracker.debian.org/tracker/CVE-2016-0749   
                         spice | CVE-2016-2150    | https://security-tracker.debian.org/tracker/CVE-2016-2150   
                         spice | CVE-2018-10893   | https://security-tracker.debian.org/tracker/CVE-2018-10893  
                        thttpd | CVE-2012-5640    | https://security-tracker.debian.org/tracker/CVE-2012-5640   
                          tiff | CVE-2015-7313    | https://security-tracker.debian.org/tracker/CVE-2015-7313   
                          tiff | CVE-2022-0561    | https://security-tracker.debian.org/tracker/CVE-2022-0561   
                          tiff | CVE-2022-0562    | https://security-tracker.debian.org/tracker/CVE-2022-0562   
                          tiff | CVE-2022-0865    | https://security-tracker.debian.org/tracker/CVE-2022-0865   
                          tiff | CVE-2022-0891    | https://security-tracker.debian.org/tracker/CVE-2022-0891   
                          tiff | CVE-2022-0907    | https://security-tracker.debian.org/tracker/CVE-2022-0907   
                          tiff | CVE-2022-0908    | https://security-tracker.debian.org/tracker/CVE-2022-0908   
                          tiff | CVE-2022-0909    | https://security-tracker.debian.org/tracker/CVE-2022-0909   
                          tiff | CVE-2022-0924    | https://security-tracker.debian.org/tracker/CVE-2022-0924   
                          tiff | CVE-2022-1056    | https://security-tracker.debian.org/tracker/CVE-2022-1056   
                          tiff | CVE-2022-1210    | https://security-tracker.debian.org/tracker/CVE-2022-1210   
                          tinc | CVE-2013-1428    | https://security-tracker.debian.org/tracker/CVE-2013-1428   
                           tor | CVE-2016-9079    | https://security-tracker.debian.org/tracker/CVE-2016-9079   
                           tor | CVE-2017-16541   | https://security-tracker.debian.org/tracker/CVE-2017-16541  
                         unzip | CVE-2022-0529    | https://security-tracker.debian.org/tracker/CVE-2022-0529   
                         unzip | CVE-2022-0530    | https://security-tracker.debian.org/tracker/CVE-2022-0530   
                           xen | CVE-2011-1936    | https://security-tracker.debian.org/tracker/CVE-2011-1936   
                           xen | CVE-2011-3346    | https://security-tracker.debian.org/tracker/CVE-2011-3346   
                           xen | CVE-2014-2580    | https://security-tracker.debian.org/tracker/CVE-2014-2580   
                           xen | CVE-2014-3672    | https://security-tracker.debian.org/tracker/CVE-2014-3672   
                           xen | CVE-2015-7504    | https://security-tracker.debian.org/tracker/CVE-2015-7504   
                           xen | CVE-2015-8550    | https://security-tracker.debian.org/tracker/CVE-2015-8550   
                           xen | CVE-2015-8553    | https://security-tracker.debian.org/tracker/CVE-2015-8553   
                           xen | CVE-2016-3960    | https://security-tracker.debian.org/tracker/CVE-2016-3960   
                           xen | CVE-2016-7092    | https://security-tracker.debian.org/tracker/CVE-2016-7092   
                           xen | CVE-2016-9379    | https://security-tracker.debian.org/tracker/CVE-2016-9379   
                           xen | CVE-2016-9380    | https://security-tracker.debian.org/tracker/CVE-2016-9380   
                           xen | CVE-2016-9383    | https://security-tracker.debian.org/tracker/CVE-2016-9383   
                           xen | CVE-2016-9386    | https://security-tracker.debian.org/tracker/CVE-2016-9386   
                           xen | CVE-2017-12134   | https://security-tracker.debian.org/tracker/CVE-2017-12134  
                           xen | CVE-2017-12135   | https://security-tracker.debian.org/tracker/CVE-2017-12135  
                           xen | CVE-2017-12137   | https://security-tracker.debian.org/tracker/CVE-2017-12137  
                           xen | CVE-2017-7228    | https://security-tracker.debian.org/tracker/CVE-2017-7228   
                           xen | CVE-2018-5244    | https://security-tracker.debian.org/tracker/CVE-2018-5244   
                           xen | CVE-2018-8897    | https://security-tracker.debian.org/tracker/CVE-2018-8897   
                           xen | CVE-2021-26313   | https://security-tracker.debian.org/tracker/CVE-2021-26313  
                           xen | CVE-2021-26314   | https://security-tracker.debian.org/tracker/CVE-2021-26314  
                           xen | CVE-2021-28038   | https://security-tracker.debian.org/tracker/CVE-2021-28038  
                           xen | CVE-2021-28039   | https://security-tracker.debian.org/tracker/CVE-2021-28039  
                           xen | CVE-2021-28687   | https://security-tracker.debian.org/tracker/CVE-2021-28687  
                           xen | CVE-2021-28690   | https://security-tracker.debian.org/tracker/CVE-2021-28690  
                           xen | CVE-2021-28692   | https://security-tracker.debian.org/tracker/CVE-2021-28692  
                           xen | CVE-2021-28693   | https://security-tracker.debian.org/tracker/CVE-2021-28693  
                           xen | CVE-2021-28694   | https://security-tracker.debian.org/tracker/CVE-2021-28694  
                           xen | CVE-2021-28695   | https://security-tracker.debian.org/tracker/CVE-2021-28695  
                           xen | CVE-2021-28696   | https://security-tracker.debian.org/tracker/CVE-2021-28696  
                           xen | CVE-2021-28697   | https://security-tracker.debian.org/tracker/CVE-2021-28697  
                           xen | CVE-2021-28698   | https://security-tracker.debian.org/tracker/CVE-2021-28698  
                           xen | CVE-2021-28699   | https://security-tracker.debian.org/tracker/CVE-2021-28699  
                           xen | CVE-2021-28700   | https://security-tracker.debian.org/tracker/CVE-2021-28700  
                           xen | CVE-2021-28701   | https://security-tracker.debian.org/tracker/CVE-2021-28701  
                           xen | CVE-2021-28702   | https://security-tracker.debian.org/tracker/CVE-2021-28702  
                           xen | CVE-2021-28703   | https://security-tracker.debian.org/tracker/CVE-2021-28703  
                           xen | CVE-2021-28704   | https://security-tracker.debian.org/tracker/CVE-2021-28704  
                           xen | CVE-2021-28707   | https://security-tracker.debian.org/tracker/CVE-2021-28707  
                           xen | CVE-2021-28708   | https://security-tracker.debian.org/tracker/CVE-2021-28708  
                           xen | CVE-2021-28711   | https://security-tracker.debian.org/tracker/CVE-2021-28711  
                           xen | CVE-2021-28712   | https://security-tracker.debian.org/tracker/CVE-2021-28712  
                           xen | CVE-2021-28713   | https://security-tracker.debian.org/tracker/CVE-2021-28713  
                           xen | CVE-2022-23033   | https://security-tracker.debian.org/tracker/CVE-2022-23033  
                           xen | CVE-2022-23035   | https://security-tracker.debian.org/tracker/CVE-2022-23035  
                           xen | CVE-2022-23036   | https://security-tracker.debian.org/tracker/CVE-2022-23036  
                           xen | CVE-2022-23037   | https://security-tracker.debian.org/tracker/CVE-2022-23037  
                           xen | CVE-2022-23038   | https://security-tracker.debian.org/tracker/CVE-2022-23038  
                           xen | CVE-2022-23039   | https://security-tracker.debian.org/tracker/CVE-2022-23039  
                           xen | CVE-2022-23040   | https://security-tracker.debian.org/tracker/CVE-2022-23040  
                           xen | CVE-2022-23041   | https://security-tracker.debian.org/tracker/CVE-2022-23041  
                           xen | CVE-2022-23042   | https://security-tracker.debian.org/tracker/CVE-2022-23042  
                           xen | CVE-2022-23960   | https://security-tracker.debian.org/tracker/CVE-2022-23960  
                           xen | CVE-2022-26357   | https://security-tracker.debian.org/tracker/CVE-2022-26357  
                           xen | CVE-2022-26358   | https://security-tracker.debian.org/tracker/CVE-2022-26358  
                           xen | CVE-2022-26359   | https://security-tracker.debian.org/tracker/CVE-2022-26359  
                           xen | CVE-2022-26360   | https://security-tracker.debian.org/tracker/CVE-2022-26360  
                           xen | CVE-2022-26361   | https://security-tracker.debian.org/tracker/CVE-2022-26361  
                        xerces | CVE-2012-0880    | https://security-tracker.debian.org/tracker/CVE-2012-0880   
                           zip | CVE-2018-13410   | https://security-tracker.debian.org/tracker/CVE-2018-13410  
                          zlog | CVE-2021-43521   | https://security-tracker.debian.org/tracker/CVE-2021-43521  

CVEs for the '2022.02.x' branch
-------------------------------

             name              |       CVE        |                             link                            
-------------------------------+------------------+--------------------------------------------------------------
                        apache | CVE-1999-0236    | https://security-tracker.debian.org/tracker/CVE-1999-0236   
                        apache | CVE-1999-0289    | https://security-tracker.debian.org/tracker/CVE-1999-0289   
                        apache | CVE-1999-0678    | https://security-tracker.debian.org/tracker/CVE-1999-0678   
                        apache | CVE-1999-1237    | https://security-tracker.debian.org/tracker/CVE-1999-1237   
                        apache | CVE-1999-1412    | https://security-tracker.debian.org/tracker/CVE-1999-1412   
                        apache | CVE-2007-0086    | https://security-tracker.debian.org/tracker/CVE-2007-0086   
                        apache | CVE-2007-0450    | https://security-tracker.debian.org/tracker/CVE-2007-0450   
                        apache | CVE-2007-4465    | https://security-tracker.debian.org/tracker/CVE-2007-4465   
                        apache | CVE-2007-5000    | https://security-tracker.debian.org/tracker/CVE-2007-5000   
                        apache | CVE-2007-6388    | https://security-tracker.debian.org/tracker/CVE-2007-6388   
                        apache | CVE-2007-6420    | https://security-tracker.debian.org/tracker/CVE-2007-6420   
                        apache | CVE-2007-6421    | https://security-tracker.debian.org/tracker/CVE-2007-6421   
                        apache | CVE-2007-6422    | https://security-tracker.debian.org/tracker/CVE-2007-6422   
                        apache | CVE-2007-6423    | https://security-tracker.debian.org/tracker/CVE-2007-6423   
                        apache | CVE-2008-0455    | https://security-tracker.debian.org/tracker/CVE-2008-0455   
                        apache | CVE-2008-2168    | https://security-tracker.debian.org/tracker/CVE-2008-2168   
                        apache | CVE-2008-2939    | https://security-tracker.debian.org/tracker/CVE-2008-2939   
                        apache | CVE-2009-1195    | https://security-tracker.debian.org/tracker/CVE-2009-1195   
                        apache | CVE-2009-1890    | https://security-tracker.debian.org/tracker/CVE-2009-1890   
                        apache | CVE-2009-1891    | https://security-tracker.debian.org/tracker/CVE-2009-1891   
                        apache | CVE-2009-2699    | https://security-tracker.debian.org/tracker/CVE-2009-2699   
                        apache | CVE-2010-0408    | https://security-tracker.debian.org/tracker/CVE-2010-0408   
                        apache | CVE-2010-0425    | https://security-tracker.debian.org/tracker/CVE-2010-0425   
                        apache | CVE-2010-0434    | https://security-tracker.debian.org/tracker/CVE-2010-0434   
                        apache | CVE-2010-1452    | https://security-tracker.debian.org/tracker/CVE-2010-1452   
                        apache | CVE-2014-0231    | https://security-tracker.debian.org/tracker/CVE-2014-0231   
                      apparmor | CVE-2016-1585    | https://security-tracker.debian.org/tracker/CVE-2016-1585   
                         argus | CVE-2011-3332    | https://security-tracker.debian.org/tracker/CVE-2011-3332   
                         asn1c | CVE-2017-12966   | https://security-tracker.debian.org/tracker/CVE-2017-12966  
                          atop | CVE-2011-3618    | https://security-tracker.debian.org/tracker/CVE-2011-3618   
                         avahi | CVE-2021-3468    | https://security-tracker.debian.org/tracker/CVE-2021-3468   
                     belle-sip | CVE-2021-33056   | https://security-tracker.debian.org/tracker/CVE-2021-33056  
                     belle-sip | CVE-2021-43610   | https://security-tracker.debian.org/tracker/CVE-2021-43610  
                     belle-sip | CVE-2021-43611   | https://security-tracker.debian.org/tracker/CVE-2021-43611  
                        bento4 | CVE-2020-23331   | https://security-tracker.debian.org/tracker/CVE-2020-23331  
                        bento4 | CVE-2020-23332   | https://security-tracker.debian.org/tracker/CVE-2020-23332  
                        bento4 | CVE-2022-27607   | https://security-tracker.debian.org/tracker/CVE-2022-27607  
                    berkeleydb | CVE-2017-3604    | https://security-tracker.debian.org/tracker/CVE-2017-3604   
                    berkeleydb | CVE-2017-3605    | https://security-tracker.debian.org/tracker/CVE-2017-3605   
                    berkeleydb | CVE-2017-3606    | https://security-tracker.debian.org/tracker/CVE-2017-3606   
                    berkeleydb | CVE-2017-3607    | https://security-tracker.debian.org/tracker/CVE-2017-3607   
                    berkeleydb | CVE-2017-3608    | https://security-tracker.debian.org/tracker/CVE-2017-3608   
                    berkeleydb | CVE-2017-3609    | https://security-tracker.debian.org/tracker/CVE-2017-3609   
                    berkeleydb | CVE-2017-3610    | https://security-tracker.debian.org/tracker/CVE-2017-3610   
                    berkeleydb | CVE-2017-3611    | https://security-tracker.debian.org/tracker/CVE-2017-3611   
                    berkeleydb | CVE-2017-3612    | https://security-tracker.debian.org/tracker/CVE-2017-3612   
                    berkeleydb | CVE-2017-3613    | https://security-tracker.debian.org/tracker/CVE-2017-3613   
                    berkeleydb | CVE-2017-3614    | https://security-tracker.debian.org/tracker/CVE-2017-3614   
                    berkeleydb | CVE-2017-3615    | https://security-tracker.debian.org/tracker/CVE-2017-3615   
                    berkeleydb | CVE-2017-3616    | https://security-tracker.debian.org/tracker/CVE-2017-3616   
                    berkeleydb | CVE-2017-3617    | https://security-tracker.debian.org/tracker/CVE-2017-3617   
                    berkeleydb | CVE-2019-2708    | https://security-tracker.debian.org/tracker/CVE-2019-2708   
                    berkeleydb | CVE-2020-2981    | https://security-tracker.debian.org/tracker/CVE-2020-2981   
                      binutils | CVE-2021-45078   | https://security-tracker.debian.org/tracker/CVE-2021-45078  
                       bitcoin | CVE-2012-1909    | https://security-tracker.debian.org/tracker/CVE-2012-1909   
                       bitcoin | CVE-2012-4682    | https://security-tracker.debian.org/tracker/CVE-2012-4682   
                       bitcoin | CVE-2012-4683    | https://security-tracker.debian.org/tracker/CVE-2012-4683   
                       bitcoin | CVE-2013-2272    | https://security-tracker.debian.org/tracker/CVE-2013-2272   
                       bitcoin | CVE-2013-2273    | https://security-tracker.debian.org/tracker/CVE-2013-2273   
                       bitcoin | CVE-2013-2292    | https://security-tracker.debian.org/tracker/CVE-2013-2292   
                       bitcoin | CVE-2013-2293    | https://security-tracker.debian.org/tracker/CVE-2013-2293   
                       bitcoin | CVE-2013-3220    | https://security-tracker.debian.org/tracker/CVE-2013-3220   
                  bluez5_utils | CVE-2020-12352   | https://security-tracker.debian.org/tracker/CVE-2020-12352  
                  bluez5_utils | CVE-2020-24490   | https://security-tracker.debian.org/tracker/CVE-2020-24490  
          bluez5_utils-headers | CVE-2020-12352   | https://security-tracker.debian.org/tracker/CVE-2020-12352  
          bluez5_utils-headers | CVE-2020-24490   | https://security-tracker.debian.org/tracker/CVE-2020-24490  
                        bsdiff | CVE-2020-14315   | https://security-tracker.debian.org/tracker/CVE-2020-14315  
                       busybox | CVE-2022-28391   | https://security-tracker.debian.org/tracker/CVE-2022-28391  
                         cairo | CVE-2019-6461    | https://security-tracker.debian.org/tracker/CVE-2019-6461   
                         cairo | CVE-2019-6462    | https://security-tracker.debian.org/tracker/CVE-2019-6462   
                         cairo | CVE-2020-35492   | https://security-tracker.debian.org/tracker/CVE-2020-35492  
                        clamav | CVE-2016-1405    | https://security-tracker.debian.org/tracker/CVE-2016-1405   
                     coreutils | CVE-2016-2781    | https://security-tracker.debian.org/tracker/CVE-2016-2781   
                          cpio | CVE-2010-4226    | https://security-tracker.debian.org/tracker/CVE-2010-4226   
                      cryptopp | CVE-2021-43398   | https://security-tracker.debian.org/tracker/CVE-2021-43398  
                          cups | CVE-2018-6553    | https://security-tracker.debian.org/tracker/CVE-2018-6553   
                           cvs | CVE-2017-12836   | https://security-tracker.debian.org/tracker/CVE-2017-12836  
                     darkhttpd | CVE-2020-25691   | https://security-tracker.debian.org/tracker/CVE-2020-25691  
                       dnsmasq | CVE-2021-45951   | https://security-tracker.debian.org/tracker/CVE-2021-45951  
                       dnsmasq | CVE-2021-45952   | https://security-tracker.debian.org/tracker/CVE-2021-45952  
                       dnsmasq | CVE-2021-45953   | https://security-tracker.debian.org/tracker/CVE-2021-45953  
                       dnsmasq | CVE-2021-45954   | https://security-tracker.debian.org/tracker/CVE-2021-45954  
                       dnsmasq | CVE-2021-45955   | https://security-tracker.debian.org/tracker/CVE-2021-45955  
                       dnsmasq | CVE-2021-45956   | https://security-tracker.debian.org/tracker/CVE-2021-45956  
                       dnsmasq | CVE-2021-45957   | https://security-tracker.debian.org/tracker/CVE-2021-45957  
                        docker | CVE-2014-0048    | https://security-tracker.debian.org/tracker/CVE-2014-0048   
                        docker | CVE-2014-8178    | https://security-tracker.debian.org/tracker/CVE-2014-8178   
                        docker | CVE-2014-8179    | https://security-tracker.debian.org/tracker/CVE-2014-8179   
                        docker | CVE-2015-1843    | https://security-tracker.debian.org/tracker/CVE-2015-1843   
                        docker | CVE-2015-3627    | https://security-tracker.debian.org/tracker/CVE-2015-3627   
                        docker | CVE-2015-3630    | https://security-tracker.debian.org/tracker/CVE-2015-3630   
                        docker | CVE-2015-3631    | https://security-tracker.debian.org/tracker/CVE-2015-3631   
                        docker | CVE-2016-3697    | https://security-tracker.debian.org/tracker/CVE-2016-3697   
                        docker | CVE-2017-14992   | https://security-tracker.debian.org/tracker/CVE-2017-14992  
                        docker | CVE-2019-13139   | https://security-tracker.debian.org/tracker/CVE-2019-13139  
                        docker | CVE-2019-13509   | https://security-tracker.debian.org/tracker/CVE-2019-13509  
                        docker | CVE-2019-15752   | https://security-tracker.debian.org/tracker/CVE-2019-15752  
                        docker | CVE-2019-16884   | https://security-tracker.debian.org/tracker/CVE-2019-16884  
                        docker | CVE-2019-5736    | https://security-tracker.debian.org/tracker/CVE-2019-5736   
                        docker | CVE-2020-27534   | https://security-tracker.debian.org/tracker/CVE-2020-27534  
                        docker | CVE-2021-21284   | https://security-tracker.debian.org/tracker/CVE-2021-21284  
                        docker | CVE-2021-21285   | https://security-tracker.debian.org/tracker/CVE-2021-21285  
                        docker | CVE-2021-3162    | https://security-tracker.debian.org/tracker/CVE-2021-3162   
                        docker | CVE-2021-33183   | https://security-tracker.debian.org/tracker/CVE-2021-33183  
                        docker | CVE-2022-25365   | https://security-tracker.debian.org/tracker/CVE-2022-25365  
                          edk2 | CVE-2014-4859    | https://security-tracker.debian.org/tracker/CVE-2014-4859   
                          edk2 | CVE-2014-4860    | https://security-tracker.debian.org/tracker/CVE-2014-4860   
                          edk2 | CVE-2014-8271    | https://security-tracker.debian.org/tracker/CVE-2014-8271   
                          edk2 | CVE-2019-14553   | https://security-tracker.debian.org/tracker/CVE-2019-14553  
                          edk2 | CVE-2019-14559   | https://security-tracker.debian.org/tracker/CVE-2019-14559  
                          edk2 | CVE-2019-14562   | https://security-tracker.debian.org/tracker/CVE-2019-14562  
                          edk2 | CVE-2019-14563   | https://security-tracker.debian.org/tracker/CVE-2019-14563  
                          edk2 | CVE-2019-14575   | https://security-tracker.debian.org/tracker/CVE-2019-14575  
                          edk2 | CVE-2019-14586   | https://security-tracker.debian.org/tracker/CVE-2019-14586  
                          edk2 | CVE-2019-14587   | https://security-tracker.debian.org/tracker/CVE-2019-14587  
                         emlog | CVE-2021-44584   | https://security-tracker.debian.org/tracker/CVE-2021-44584  
                        erlang | CVE-2020-35733   | https://security-tracker.debian.org/tracker/CVE-2020-35733  
                          exim | CVE-2020-28017   | https://security-tracker.debian.org/tracker/CVE-2020-28017  
                         exiv2 | CVE-2007-6353    | https://security-tracker.debian.org/tracker/CVE-2007-6353   
                        ffmpeg | CVE-2021-38291   | https://security-tracker.debian.org/tracker/CVE-2021-38291  
                           git | CVE-2022-24975   | https://security-tracker.debian.org/tracker/CVE-2022-24975  
                         glibc | CVE-2010-4756    | https://security-tracker.debian.org/tracker/CVE-2010-4756   
                         glibc | CVE-2019-1010022 | https://security-tracker.debian.org/tracker/CVE-2019-1010022
                         glibc | CVE-2019-1010023 | https://security-tracker.debian.org/tracker/CVE-2019-1010023
                         glibc | CVE-2019-1010024 | https://security-tracker.debian.org/tracker/CVE-2019-1010024
                         glibc | CVE-2019-1010025 | https://security-tracker.debian.org/tracker/CVE-2019-1010025
                         gnupg | CVE-2006-3082    | https://security-tracker.debian.org/tracker/CVE-2006-3082   
                         gnupg | CVE-2011-2207    | https://security-tracker.debian.org/tracker/CVE-2011-2207   
                         gnupg | CVE-2015-1606    | https://security-tracker.debian.org/tracker/CVE-2015-1606   
                         gnupg | CVE-2018-12020   | https://security-tracker.debian.org/tracker/CVE-2018-12020  
                         gnupg | CVE-2019-13050   | https://security-tracker.debian.org/tracker/CVE-2019-13050  
                         gnupg | CVE-2019-14855   | https://security-tracker.debian.org/tracker/CVE-2019-14855  
                            go | CVE-2020-29509   | https://security-tracker.debian.org/tracker/CVE-2020-29509  
                            go | CVE-2020-29511   | https://security-tracker.debian.org/tracker/CVE-2020-29511  
                            go | CVE-2022-27191   | https://security-tracker.debian.org/tracker/CVE-2022-27191  
                graphicsmagick | CVE-2007-0770    | https://security-tracker.debian.org/tracker/CVE-2007-0770   
                graphicsmagick | CVE-2008-6621    | https://security-tracker.debian.org/tracker/CVE-2008-6621   
                     graphite2 | CVE-2017-5436    | https://security-tracker.debian.org/tracker/CVE-2017-5436   
                         grub2 | CVE-2021-3981    | https://security-tracker.debian.org/tracker/CVE-2021-3981   
                         grub2 | CVE-2021-46705   | https://security-tracker.debian.org/tracker/CVE-2021-46705  
                       haproxy | CVE-2016-2102    | https://security-tracker.debian.org/tracker/CVE-2016-2102   
                       haproxy | CVE-2022-0711    | https://security-tracker.debian.org/tracker/CVE-2022-0711   
                heirloom-mailx | CVE-2004-2771    | https://security-tracker.debian.org/tracker/CVE-2004-2771   
                   imagemagick | CVE-2007-1667    | https://security-tracker.debian.org/tracker/CVE-2007-1667   
                   imagemagick | CVE-2014-9804    | https://security-tracker.debian.org/tracker/CVE-2014-9804   
                   imagemagick | CVE-2014-9805    | https://security-tracker.debian.org/tracker/CVE-2014-9805   
                   imagemagick | CVE-2014-9806    | https://security-tracker.debian.org/tracker/CVE-2014-9806   
                   imagemagick | CVE-2014-9807    | https://security-tracker.debian.org/tracker/CVE-2014-9807   
                   imagemagick | CVE-2014-9808    | https://security-tracker.debian.org/tracker/CVE-2014-9808   
                   imagemagick | CVE-2014-9809    | https://security-tracker.debian.org/tracker/CVE-2014-9809   
                   imagemagick | CVE-2014-9810    | https://security-tracker.debian.org/tracker/CVE-2014-9810   
                   imagemagick | CVE-2014-9811    | https://security-tracker.debian.org/tracker/CVE-2014-9811   
                   imagemagick | CVE-2014-9812    | https://security-tracker.debian.org/tracker/CVE-2014-9812   
                   imagemagick | CVE-2014-9813    | https://security-tracker.debian.org/tracker/CVE-2014-9813   
                   imagemagick | CVE-2014-9814    | https://security-tracker.debian.org/tracker/CVE-2014-9814   
                   imagemagick | CVE-2014-9815    | https://security-tracker.debian.org/tracker/CVE-2014-9815   
                   imagemagick | CVE-2014-9816    | https://security-tracker.debian.org/tracker/CVE-2014-9816   
                   imagemagick | CVE-2014-9817    | https://security-tracker.debian.org/tracker/CVE-2014-9817   
                   imagemagick | CVE-2014-9818    | https://security-tracker.debian.org/tracker/CVE-2014-9818   
                   imagemagick | CVE-2014-9819    | https://security-tracker.debian.org/tracker/CVE-2014-9819   
                   imagemagick | CVE-2014-9820    | https://security-tracker.debian.org/tracker/CVE-2014-9820   
                   imagemagick | CVE-2014-9821    | https://security-tracker.debian.org/tracker/CVE-2014-9821   
                   imagemagick | CVE-2014-9822    | https://security-tracker.debian.org/tracker/CVE-2014-9822   
                   imagemagick | CVE-2014-9823    | https://security-tracker.debian.org/tracker/CVE-2014-9823   
                   imagemagick | CVE-2014-9824    | https://security-tracker.debian.org/tracker/CVE-2014-9824   
                   imagemagick | CVE-2014-9825    | https://security-tracker.debian.org/tracker/CVE-2014-9825   
                   imagemagick | CVE-2014-9826    | https://security-tracker.debian.org/tracker/CVE-2014-9826   
                   imagemagick | CVE-2014-9827    | https://security-tracker.debian.org/tracker/CVE-2014-9827   
                   imagemagick | CVE-2014-9828    | https://security-tracker.debian.org/tracker/CVE-2014-9828   
                   imagemagick | CVE-2014-9829    | https://security-tracker.debian.org/tracker/CVE-2014-9829   
                   imagemagick | CVE-2014-9830    | https://security-tracker.debian.org/tracker/CVE-2014-9830   
                   imagemagick | CVE-2014-9831    | https://security-tracker.debian.org/tracker/CVE-2014-9831   
                   imagemagick | CVE-2014-9848    | https://security-tracker.debian.org/tracker/CVE-2014-9848   
                   imagemagick | CVE-2014-9852    | https://security-tracker.debian.org/tracker/CVE-2014-9852   
                   imagemagick | CVE-2014-9853    | https://security-tracker.debian.org/tracker/CVE-2014-9853   
                   imagemagick | CVE-2014-9854    | https://security-tracker.debian.org/tracker/CVE-2014-9854   
                   imagemagick | CVE-2014-9907    | https://security-tracker.debian.org/tracker/CVE-2014-9907   
                   imagemagick | CVE-2016-10062   | https://security-tracker.debian.org/tracker/CVE-2016-10062  
                   imagemagick | CVE-2016-10144   | https://security-tracker.debian.org/tracker/CVE-2016-10144  
                   imagemagick | CVE-2016-10145   | https://security-tracker.debian.org/tracker/CVE-2016-10145  
                   imagemagick | CVE-2016-10146   | https://security-tracker.debian.org/tracker/CVE-2016-10146  
                   imagemagick | CVE-2016-7513    | https://security-tracker.debian.org/tracker/CVE-2016-7513   
                   imagemagick | CVE-2016-7514    | https://security-tracker.debian.org/tracker/CVE-2016-7514   
                   imagemagick | CVE-2016-7515    | https://security-tracker.debian.org/tracker/CVE-2016-7515   
                   imagemagick | CVE-2016-7516    | https://security-tracker.debian.org/tracker/CVE-2016-7516   
                   imagemagick | CVE-2016-7517    | https://security-tracker.debian.org/tracker/CVE-2016-7517   
                   imagemagick | CVE-2016-7518    | https://security-tracker.debian.org/tracker/CVE-2016-7518   
                   imagemagick | CVE-2016-7519    | https://security-tracker.debian.org/tracker/CVE-2016-7519   
                   imagemagick | CVE-2016-7520    | https://security-tracker.debian.org/tracker/CVE-2016-7520   
                   imagemagick | CVE-2016-7521    | https://security-tracker.debian.org/tracker/CVE-2016-7521   
                   imagemagick | CVE-2016-7522    | https://security-tracker.debian.org/tracker/CVE-2016-7522   
                   imagemagick | CVE-2016-7523    | https://security-tracker.debian.org/tracker/CVE-2016-7523   
                   imagemagick | CVE-2016-7524    | https://security-tracker.debian.org/tracker/CVE-2016-7524   
                   imagemagick | CVE-2016-7525    | https://security-tracker.debian.org/tracker/CVE-2016-7525   
                   imagemagick | CVE-2016-7526    | https://security-tracker.debian.org/tracker/CVE-2016-7526   
                   imagemagick | CVE-2016-7527    | https://security-tracker.debian.org/tracker/CVE-2016-7527   
                   imagemagick | CVE-2016-7528    | https://security-tracker.debian.org/tracker/CVE-2016-7528   
                   imagemagick | CVE-2016-7529    | https://security-tracker.debian.org/tracker/CVE-2016-7529   
                   imagemagick | CVE-2016-7530    | https://security-tracker.debian.org/tracker/CVE-2016-7530   
                   imagemagick | CVE-2016-7531    | https://security-tracker.debian.org/tracker/CVE-2016-7531   
                   imagemagick | CVE-2016-7532    | https://security-tracker.debian.org/tracker/CVE-2016-7532   
                   imagemagick | CVE-2016-7533    | https://security-tracker.debian.org/tracker/CVE-2016-7533   
                   imagemagick | CVE-2016-7534    | https://security-tracker.debian.org/tracker/CVE-2016-7534   
                   imagemagick | CVE-2016-7535    | https://security-tracker.debian.org/tracker/CVE-2016-7535   
                   imagemagick | CVE-2016-7536    | https://security-tracker.debian.org/tracker/CVE-2016-7536   
                   imagemagick | CVE-2016-7537    | https://security-tracker.debian.org/tracker/CVE-2016-7537   
                   imagemagick | CVE-2016-7538    | https://security-tracker.debian.org/tracker/CVE-2016-7538   
                   imagemagick | CVE-2017-5506    | https://security-tracker.debian.org/tracker/CVE-2017-5506   
                   imagemagick | CVE-2017-5509    | https://security-tracker.debian.org/tracker/CVE-2017-5509   
                   imagemagick | CVE-2017-5510    | https://security-tracker.debian.org/tracker/CVE-2017-5510   
                   imagemagick | CVE-2017-5511    | https://security-tracker.debian.org/tracker/CVE-2017-5511   
                        jasper | CVE-2015-8751    | https://security-tracker.debian.org/tracker/CVE-2015-8751   
                        jquery | CVE-2007-2379    | https://security-tracker.debian.org/tracker/CVE-2007-2379   
                         libao | CVE-2017-11548   | https://security-tracker.debian.org/tracker/CVE-2017-11548  
                        libbpf | CVE-2021-45940   | https://security-tracker.debian.org/tracker/CVE-2021-45940  
                        libbpf | CVE-2021-45941   | https://security-tracker.debian.org/tracker/CVE-2021-45941  
                  libfreeimage | CVE-2019-12211   | https://security-tracker.debian.org/tracker/CVE-2019-12211  
                  libfreeimage | CVE-2019-12212   | https://security-tracker.debian.org/tracker/CVE-2019-12212  
                  libfreeimage | CVE-2019-12213   | https://security-tracker.debian.org/tracker/CVE-2019-12213  
                  libfreeimage | CVE-2019-12214   | https://security-tracker.debian.org/tracker/CVE-2019-12214  
                     libiberty | CVE-2012-3509    | https://security-tracker.debian.org/tracker/CVE-2012-3509   
                     libiberty | CVE-2016-2226    | https://security-tracker.debian.org/tracker/CVE-2016-2226   
                     libiberty | CVE-2016-4487    | https://security-tracker.debian.org/tracker/CVE-2016-4487   
                     libiberty | CVE-2016-4488    | https://security-tracker.debian.org/tracker/CVE-2016-4488   
                     libiberty | CVE-2016-4489    | https://security-tracker.debian.org/tracker/CVE-2016-4489   
                     libiberty | CVE-2016-4490    | https://security-tracker.debian.org/tracker/CVE-2016-4490   
                     libiberty | CVE-2016-4491    | https://security-tracker.debian.org/tracker/CVE-2016-4491   
                     libiberty | CVE-2016-4492    | https://security-tracker.debian.org/tracker/CVE-2016-4492   
                     libiberty | CVE-2016-4493    | https://security-tracker.debian.org/tracker/CVE-2016-4493   
                     libiberty | CVE-2016-6131    | https://security-tracker.debian.org/tracker/CVE-2016-6131   
                       libkrb5 | CVE-1999-0143    | https://security-tracker.debian.org/tracker/CVE-1999-0143   
                       libkrb5 | CVE-1999-0713    | https://security-tracker.debian.org/tracker/CVE-1999-0713   
                       libkrb5 | CVE-2007-3149    | https://security-tracker.debian.org/tracker/CVE-2007-3149   
                       libkrb5 | CVE-2007-5894    | https://security-tracker.debian.org/tracker/CVE-2007-5894   
                       libkrb5 | CVE-2007-5902    | https://security-tracker.debian.org/tracker/CVE-2007-5902   
                       libkrb5 | CVE-2009-0844    | https://security-tracker.debian.org/tracker/CVE-2009-0844   
                       libkrb5 | CVE-2009-0846    | https://security-tracker.debian.org/tracker/CVE-2009-0846   
                        libmad | CVE-2018-7263    | https://security-tracker.debian.org/tracker/CVE-2018-7263   
                      libpjsip | CVE-2022-24754   | https://security-tracker.debian.org/tracker/CVE-2022-24754  
                      libpjsip | CVE-2022-24764   | https://security-tracker.debian.org/tracker/CVE-2022-24764  
                      libplist | CVE-2017-5834    | https://security-tracker.debian.org/tracker/CVE-2017-5834   
                      libplist | CVE-2017-5835    | https://security-tracker.debian.org/tracker/CVE-2017-5835   
                      libplist | CVE-2017-5836    | https://security-tracker.debian.org/tracker/CVE-2017-5836   
                    libtorrent | CVE-2009-1760    | https://security-tracker.debian.org/tracker/CVE-2009-1760   
                    libtorrent | CVE-2016-5301    | https://security-tracker.debian.org/tracker/CVE-2016-5301   
                       libvirt | CVE-2014-8135    | https://security-tracker.debian.org/tracker/CVE-2014-8135   
                       libvirt | CVE-2014-8136    | https://security-tracker.debian.org/tracker/CVE-2014-8136   
                       libvirt | CVE-2015-5313    | https://security-tracker.debian.org/tracker/CVE-2015-5313   
                       libvirt | CVE-2018-5748    | https://security-tracker.debian.org/tracker/CVE-2018-5748   
                       libvirt | CVE-2018-6764    | https://security-tracker.debian.org/tracker/CVE-2018-6764   
                         lrzsz | CVE-2018-10195   | https://security-tracker.debian.org/tracker/CVE-2018-10195  
                           lua | CVE-2014-5461    | https://security-tracker.debian.org/tracker/CVE-2014-5461   
                           lua | CVE-2020-15888   | https://security-tracker.debian.org/tracker/CVE-2020-15888  
                           lua | CVE-2020-15945   | https://security-tracker.debian.org/tracker/CVE-2020-15945  
                           lua | CVE-2021-43519   | https://security-tracker.debian.org/tracker/CVE-2021-43519  
                           lua | CVE-2022-28805   | https://security-tracker.debian.org/tracker/CVE-2022-28805  
                       mariadb | CVE-2021-46669   | https://security-tracker.debian.org/tracker/CVE-2021-46669  
                       mbedtls | CVE-2021-45451   | https://security-tracker.debian.org/tracker/CVE-2021-45451  
                       mongodb | CVE-2014-8180    | https://security-tracker.debian.org/tracker/CVE-2014-8180   
                       mongodb | CVE-2017-18381   | https://security-tracker.debian.org/tracker/CVE-2017-18381  
                       mongodb | CVE-2017-2665    | https://security-tracker.debian.org/tracker/CVE-2017-2665   
                         mupdf | CVE-2017-5991    | https://security-tracker.debian.org/tracker/CVE-2017-5991   
                          mutt | CVE-2011-1429    | https://security-tracker.debian.org/tracker/CVE-2011-1429   
                          nasm | CVE-2020-18974   | https://security-tracker.debian.org/tracker/CVE-2020-18974  
                       ncurses | CVE-2021-39537   | https://security-tracker.debian.org/tracker/CVE-2021-39537  
                           ntp | CVE-2014-9750    | https://security-tracker.debian.org/tracker/CVE-2014-9750   
                           ntp | CVE-2014-9751    | https://security-tracker.debian.org/tracker/CVE-2014-9751   
                           ntp | CVE-2015-7691    | https://security-tracker.debian.org/tracker/CVE-2015-7691   
                           ntp | CVE-2015-7692    | https://security-tracker.debian.org/tracker/CVE-2015-7692   
                           ntp | CVE-2015-7701    | https://security-tracker.debian.org/tracker/CVE-2015-7701   
                           ntp | CVE-2015-7702    | https://security-tracker.debian.org/tracker/CVE-2015-7702   
                           ntp | CVE-2015-7703    | https://security-tracker.debian.org/tracker/CVE-2015-7703   
                           ntp | CVE-2015-7704    | https://security-tracker.debian.org/tracker/CVE-2015-7704   
                           ntp | CVE-2015-7705    | https://security-tracker.debian.org/tracker/CVE-2015-7705   
                           ntp | CVE-2015-7849    | https://security-tracker.debian.org/tracker/CVE-2015-7849   
                           ntp | CVE-2015-7850    | https://security-tracker.debian.org/tracker/CVE-2015-7850   
                           ntp | CVE-2015-7852    | https://security-tracker.debian.org/tracker/CVE-2015-7852   
                           ntp | CVE-2015-7853    | https://security-tracker.debian.org/tracker/CVE-2015-7853   
                           ntp | CVE-2015-7854    | https://security-tracker.debian.org/tracker/CVE-2015-7854   
                           ntp | CVE-2015-7855    | https://security-tracker.debian.org/tracker/CVE-2015-7855   
                           ntp | CVE-2015-7973    | https://security-tracker.debian.org/tracker/CVE-2015-7973   
                           ntp | CVE-2015-7974    | https://security-tracker.debian.org/tracker/CVE-2015-7974   
                           ntp | CVE-2015-7977    | https://security-tracker.debian.org/tracker/CVE-2015-7977   
                           ntp | CVE-2016-2518    | https://security-tracker.debian.org/tracker/CVE-2016-2518   
                           ntp | CVE-2016-4953    | https://security-tracker.debian.org/tracker/CVE-2016-4953   
                           ntp | CVE-2016-4954    | https://security-tracker.debian.org/tracker/CVE-2016-4954   
                           ntp | CVE-2016-4955    | https://security-tracker.debian.org/tracker/CVE-2016-4955   
                           ntp | CVE-2016-4956    | https://security-tracker.debian.org/tracker/CVE-2016-4956   
                           ntp | CVE-2016-7426    | https://security-tracker.debian.org/tracker/CVE-2016-7426   
                           ntp | CVE-2016-7434    | https://security-tracker.debian.org/tracker/CVE-2016-7434   
                           ntp | CVE-2017-6458    | https://security-tracker.debian.org/tracker/CVE-2017-6458   
                           ntp | CVE-2018-7170    | https://security-tracker.debian.org/tracker/CVE-2018-7170   
                           ntp | CVE-2018-7185    | https://security-tracker.debian.org/tracker/CVE-2018-7185   
                           ntp | CVE-2019-11331   | https://security-tracker.debian.org/tracker/CVE-2019-11331  
                           ntp | CVE-2019-8936    | https://security-tracker.debian.org/tracker/CVE-2019-8936   
                           ntp | CVE-2020-11868   | https://security-tracker.debian.org/tracker/CVE-2020-11868  
                           ntp | CVE-2020-13817   | https://security-tracker.debian.org/tracker/CVE-2020-13817  
                       opencv3 | CVE-2019-14493   | https://security-tracker.debian.org/tracker/CVE-2019-14493  
                       opencv3 | CVE-2019-15939   | https://security-tracker.debian.org/tracker/CVE-2019-15939  
                       opencv3 | CVE-2019-19624   | https://security-tracker.debian.org/tracker/CVE-2019-19624  
                       openjdk | CVE-2009-2475    | https://security-tracker.debian.org/tracker/CVE-2009-2475   
                       openjdk | CVE-2009-2476    | https://security-tracker.debian.org/tracker/CVE-2009-2476   
                       openjdk | CVE-2009-2689    | https://security-tracker.debian.org/tracker/CVE-2009-2689   
                       openjdk | CVE-2009-2690    | https://security-tracker.debian.org/tracker/CVE-2009-2690   
                       openjdk | CVE-2009-3728    | https://security-tracker.debian.org/tracker/CVE-2009-3728   
                       openjdk | CVE-2009-3879    | https://security-tracker.debian.org/tracker/CVE-2009-3879   
                       openjdk | CVE-2009-3880    | https://security-tracker.debian.org/tracker/CVE-2009-3880   
                       openjdk | CVE-2009-3881    | https://security-tracker.debian.org/tracker/CVE-2009-3881   
                       openjdk | CVE-2009-3882    | https://security-tracker.debian.org/tracker/CVE-2009-3882   
                       openjdk | CVE-2009-3883    | https://security-tracker.debian.org/tracker/CVE-2009-3883   
                       openjdk | CVE-2009-3884    | https://security-tracker.debian.org/tracker/CVE-2009-3884   
                       openjdk | CVE-2013-0169    | https://security-tracker.debian.org/tracker/CVE-2013-0169   
                      openjpeg | CVE-2015-1239    | https://security-tracker.debian.org/tracker/CVE-2015-1239   
                      openjpeg | CVE-2016-9675    | https://security-tracker.debian.org/tracker/CVE-2016-9675   
                      openjpeg | CVE-2021-29338   | https://security-tracker.debian.org/tracker/CVE-2021-29338  
                      openjpeg | CVE-2021-3575    | https://security-tracker.debian.org/tracker/CVE-2021-3575   
                      openjpeg | CVE-2022-1122    | https://security-tracker.debian.org/tracker/CVE-2022-1122   
                      openldap | CVE-2015-3276    | https://security-tracker.debian.org/tracker/CVE-2015-3276   
                       openssh | CVE-2007-2768    | https://security-tracker.debian.org/tracker/CVE-2007-2768   
                       openssh | CVE-2008-3844    | https://security-tracker.debian.org/tracker/CVE-2008-3844   
                       openssh | CVE-2014-9278    | https://security-tracker.debian.org/tracker/CVE-2014-9278   
                      openswan | CVE-2019-10155   | https://security-tracker.debian.org/tracker/CVE-2019-10155  
                         p7zip | CVE-2017-17969   | https://security-tracker.debian.org/tracker/CVE-2017-17969  
                         p7zip | CVE-2018-5996    | https://security-tracker.debian.org/tracker/CVE-2018-5996   
                         patch | CVE-2018-6952    | https://security-tracker.debian.org/tracker/CVE-2018-6952   
                         patch | CVE-2019-20633   | https://security-tracker.debian.org/tracker/CVE-2019-20633  
                           php | CVE-2007-2728    | https://security-tracker.debian.org/tracker/CVE-2007-2728   
                           php | CVE-2007-3205    | https://security-tracker.debian.org/tracker/CVE-2007-3205   
                           php | CVE-2007-4596    | https://security-tracker.debian.org/tracker/CVE-2007-4596   
                        polkit | CVE-2021-4034    | https://security-tracker.debian.org/tracker/CVE-2021-4034   
                    postgresql | CVE-2017-8806    | https://security-tracker.debian.org/tracker/CVE-2017-8806   
                 powerpc-utils | CVE-2014-8165    | https://security-tracker.debian.org/tracker/CVE-2014-8165   
                          pppd | CVE-2018-11574   | https://security-tracker.debian.org/tracker/CVE-2018-11574  
               python-m2crypto | CVE-2020-25657   | https://security-tracker.debian.org/tracker/CVE-2020-25657  
                    python-pip | CVE-2018-20225   | https://security-tracker.debian.org/tracker/CVE-2018-20225  
                python-twisted | CVE-2022-24801   | https://security-tracker.debian.org/tracker/CVE-2022-24801  
                       python3 | CVE-2022-26488   | https://security-tracker.debian.org/tracker/CVE-2022-26488  
                          qemu | CVE-2018-18438   | https://security-tracker.debian.org/tracker/CVE-2018-18438  
                          qemu | CVE-2019-12067   | https://security-tracker.debian.org/tracker/CVE-2019-12067  
                          qemu | CVE-2021-20255   | https://security-tracker.debian.org/tracker/CVE-2021-20255  
                          qemu | CVE-2021-3947    | https://security-tracker.debian.org/tracker/CVE-2021-3947   
                          qemu | CVE-2022-1050    | https://security-tracker.debian.org/tracker/CVE-2022-1050   
                          qemu | CVE-2022-26353   | https://security-tracker.debian.org/tracker/CVE-2022-26353  
                          qemu | CVE-2022-26354   | https://security-tracker.debian.org/tracker/CVE-2022-26354  
                        quagga | CVE-2016-4049    | https://security-tracker.debian.org/tracker/CVE-2016-4049   
                        quagga | CVE-2017-3224    | https://security-tracker.debian.org/tracker/CVE-2017-3224   
                        quagga | CVE-2021-44038   | https://security-tracker.debian.org/tracker/CVE-2021-44038  
               rabbitmq-server | CVE-2018-11087   | https://security-tracker.debian.org/tracker/CVE-2018-11087  
               rabbitmq-server | CVE-2018-1279    | https://security-tracker.debian.org/tracker/CVE-2018-1279   
                   resiprocate | CVE-2017-9454    | https://security-tracker.debian.org/tracker/CVE-2017-9454   
                        samba4 | CVE-2011-2411    | https://security-tracker.debian.org/tracker/CVE-2011-2411   
                        samba4 | CVE-2018-1050    | https://security-tracker.debian.org/tracker/CVE-2018-1050   
                        samba4 | CVE-2018-1057    | https://security-tracker.debian.org/tracker/CVE-2018-1057   
                           sdl | CVE-2019-13616   | https://security-tracker.debian.org/tracker/CVE-2019-13616  
                           sdl | CVE-2019-14906   | https://security-tracker.debian.org/tracker/CVE-2019-14906  
                           sdl | CVE-2019-7572    | https://security-tracker.debian.org/tracker/CVE-2019-7572   
                           sdl | CVE-2019-7573    | https://security-tracker.debian.org/tracker/CVE-2019-7573   
                           sdl | CVE-2019-7574    | https://security-tracker.debian.org/tracker/CVE-2019-7574   
                           sdl | CVE-2019-7575    | https://security-tracker.debian.org/tracker/CVE-2019-7575   
                           sdl | CVE-2019-7576    | https://security-tracker.debian.org/tracker/CVE-2019-7576   
                           sdl | CVE-2019-7577    | https://security-tracker.debian.org/tracker/CVE-2019-7577   
                           sdl | CVE-2019-7578    | https://security-tracker.debian.org/tracker/CVE-2019-7578   
                           sdl | CVE-2019-7635    | https://security-tracker.debian.org/tracker/CVE-2019-7635   
                           sdl | CVE-2019-7636    | https://security-tracker.debian.org/tracker/CVE-2019-7636   
                           sdl | CVE-2019-7637    | https://security-tracker.debian.org/tracker/CVE-2019-7637   
                           sdl | CVE-2019-7638    | https://security-tracker.debian.org/tracker/CVE-2019-7638   
                           sdl | CVE-2020-14409   | https://security-tracker.debian.org/tracker/CVE-2020-14409  
                           sdl | CVE-2020-14410   | https://security-tracker.debian.org/tracker/CVE-2020-14410  
                         smack | CVE-2014-0363    | https://security-tracker.debian.org/tracker/CVE-2014-0363   
                         smack | CVE-2014-0364    | https://security-tracker.debian.org/tracker/CVE-2014-0364   
                         smack | CVE-2016-10027   | https://security-tracker.debian.org/tracker/CVE-2016-10027  
                         spice | CVE-2016-0749    | https://security-tracker.debian.org/tracker/CVE-2016-0749   
                         spice | CVE-2016-2150    | https://security-tracker.debian.org/tracker/CVE-2016-2150   
                         spice | CVE-2018-10893   | https://security-tracker.debian.org/tracker/CVE-2018-10893  
                        thttpd | CVE-2012-5640    | https://security-tracker.debian.org/tracker/CVE-2012-5640   
                          tiff | CVE-2015-7313    | https://security-tracker.debian.org/tracker/CVE-2015-7313   
                          tiff | CVE-2022-0561    | https://security-tracker.debian.org/tracker/CVE-2022-0561   
                          tiff | CVE-2022-0562    | https://security-tracker.debian.org/tracker/CVE-2022-0562   
                          tiff | CVE-2022-0865    | https://security-tracker.debian.org/tracker/CVE-2022-0865   
                          tiff | CVE-2022-0891    | https://security-tracker.debian.org/tracker/CVE-2022-0891   
                          tiff | CVE-2022-0907    | https://security-tracker.debian.org/tracker/CVE-2022-0907   
                          tiff | CVE-2022-0908    | https://security-tracker.debian.org/tracker/CVE-2022-0908   
                          tiff | CVE-2022-0909    | https://security-tracker.debian.org/tracker/CVE-2022-0909   
                          tiff | CVE-2022-0924    | https://security-tracker.debian.org/tracker/CVE-2022-0924   
                          tiff | CVE-2022-1056    | https://security-tracker.debian.org/tracker/CVE-2022-1056   
                          tiff | CVE-2022-1210    | https://security-tracker.debian.org/tracker/CVE-2022-1210   
                          tinc | CVE-2013-1428    | https://security-tracker.debian.org/tracker/CVE-2013-1428   
                           tor | CVE-2016-9079    | https://security-tracker.debian.org/tracker/CVE-2016-9079   
                           tor | CVE-2017-16541   | https://security-tracker.debian.org/tracker/CVE-2017-16541  
                         unzip | CVE-2022-0529    | https://security-tracker.debian.org/tracker/CVE-2022-0529   
                         unzip | CVE-2022-0530    | https://security-tracker.debian.org/tracker/CVE-2022-0530   
                      usbguard | CVE-2019-25058   | https://security-tracker.debian.org/tracker/CVE-2019-25058  
                           xen | CVE-2011-1936    | https://security-tracker.debian.org/tracker/CVE-2011-1936   
                           xen | CVE-2011-3346    | https://security-tracker.debian.org/tracker/CVE-2011-3346   
                           xen | CVE-2014-2580    | https://security-tracker.debian.org/tracker/CVE-2014-2580   
                           xen | CVE-2014-3672    | https://security-tracker.debian.org/tracker/CVE-2014-3672   
                           xen | CVE-2015-7504    | https://security-tracker.debian.org/tracker/CVE-2015-7504   
                           xen | CVE-2015-8550    | https://security-tracker.debian.org/tracker/CVE-2015-8550   
                           xen | CVE-2015-8553    | https://security-tracker.debian.org/tracker/CVE-2015-8553   
                           xen | CVE-2016-3960    | https://security-tracker.debian.org/tracker/CVE-2016-3960   
                           xen | CVE-2016-7092    | https://security-tracker.debian.org/tracker/CVE-2016-7092   
                           xen | CVE-2016-9379    | https://security-tracker.debian.org/tracker/CVE-2016-9379   
                           xen | CVE-2016-9380    | https://security-tracker.debian.org/tracker/CVE-2016-9380   
                           xen | CVE-2016-9383    | https://security-tracker.debian.org/tracker/CVE-2016-9383   
                           xen | CVE-2016-9386    | https://security-tracker.debian.org/tracker/CVE-2016-9386   
                           xen | CVE-2017-12134   | https://security-tracker.debian.org/tracker/CVE-2017-12134  
                           xen | CVE-2017-12135   | https://security-tracker.debian.org/tracker/CVE-2017-12135  
                           xen | CVE-2017-12137   | https://security-tracker.debian.org/tracker/CVE-2017-12137  
                           xen | CVE-2017-7228    | https://security-tracker.debian.org/tracker/CVE-2017-7228   
                           xen | CVE-2018-5244    | https://security-tracker.debian.org/tracker/CVE-2018-5244   
                           xen | CVE-2018-8897    | https://security-tracker.debian.org/tracker/CVE-2018-8897   
                           xen | CVE-2021-26313   | https://security-tracker.debian.org/tracker/CVE-2021-26313  
                           xen | CVE-2021-26314   | https://security-tracker.debian.org/tracker/CVE-2021-26314  
                           xen | CVE-2021-28038   | https://security-tracker.debian.org/tracker/CVE-2021-28038  
                           xen | CVE-2021-28039   | https://security-tracker.debian.org/tracker/CVE-2021-28039  
                           xen | CVE-2021-28687   | https://security-tracker.debian.org/tracker/CVE-2021-28687  
                           xen | CVE-2021-28690   | https://security-tracker.debian.org/tracker/CVE-2021-28690  
                           xen | CVE-2021-28692   | https://security-tracker.debian.org/tracker/CVE-2021-28692  
                           xen | CVE-2021-28693   | https://security-tracker.debian.org/tracker/CVE-2021-28693  
                           xen | CVE-2021-28694   | https://security-tracker.debian.org/tracker/CVE-2021-28694  
                           xen | CVE-2021-28695   | https://security-tracker.debian.org/tracker/CVE-2021-28695  
                           xen | CVE-2021-28696   | https://security-tracker.debian.org/tracker/CVE-2021-28696  
                           xen | CVE-2021-28697   | https://security-tracker.debian.org/tracker/CVE-2021-28697  
                           xen | CVE-2021-28698   | https://security-tracker.debian.org/tracker/CVE-2021-28698  
                           xen | CVE-2021-28699   | https://security-tracker.debian.org/tracker/CVE-2021-28699  
                           xen | CVE-2021-28700   | https://security-tracker.debian.org/tracker/CVE-2021-28700  
                           xen | CVE-2021-28701   | https://security-tracker.debian.org/tracker/CVE-2021-28701  
                           xen | CVE-2021-28702   | https://security-tracker.debian.org/tracker/CVE-2021-28702  
                           xen | CVE-2021-28703   | https://security-tracker.debian.org/tracker/CVE-2021-28703  
                           xen | CVE-2021-28704   | https://security-tracker.debian.org/tracker/CVE-2021-28704  
                           xen | CVE-2021-28707   | https://security-tracker.debian.org/tracker/CVE-2021-28707  
                           xen | CVE-2021-28708   | https://security-tracker.debian.org/tracker/CVE-2021-28708  
                           xen | CVE-2021-28711   | https://security-tracker.debian.org/tracker/CVE-2021-28711  
                           xen | CVE-2021-28712   | https://security-tracker.debian.org/tracker/CVE-2021-28712  
                           xen | CVE-2021-28713   | https://security-tracker.debian.org/tracker/CVE-2021-28713  
                           xen | CVE-2022-23033   | https://security-tracker.debian.org/tracker/CVE-2022-23033  
                           xen | CVE-2022-23035   | https://security-tracker.debian.org/tracker/CVE-2022-23035  
                           xen | CVE-2022-23036   | https://security-tracker.debian.org/tracker/CVE-2022-23036  
                           xen | CVE-2022-23037   | https://security-tracker.debian.org/tracker/CVE-2022-23037  
                           xen | CVE-2022-23038   | https://security-tracker.debian.org/tracker/CVE-2022-23038  
                           xen | CVE-2022-23039   | https://security-tracker.debian.org/tracker/CVE-2022-23039  
                           xen | CVE-2022-23040   | https://security-tracker.debian.org/tracker/CVE-2022-23040  
                           xen | CVE-2022-23041   | https://security-tracker.debian.org/tracker/CVE-2022-23041  
                           xen | CVE-2022-23042   | https://security-tracker.debian.org/tracker/CVE-2022-23042  
                           xen | CVE-2022-23960   | https://security-tracker.debian.org/tracker/CVE-2022-23960  
                           xen | CVE-2022-26357   | https://security-tracker.debian.org/tracker/CVE-2022-26357  
                           xen | CVE-2022-26358   | https://security-tracker.debian.org/tracker/CVE-2022-26358  
                           xen | CVE-2022-26359   | https://security-tracker.debian.org/tracker/CVE-2022-26359  
                           xen | CVE-2022-26360   | https://security-tracker.debian.org/tracker/CVE-2022-26360  
                           xen | CVE-2022-26361   | https://security-tracker.debian.org/tracker/CVE-2022-26361  
                        xerces | CVE-2012-0880    | https://security-tracker.debian.org/tracker/CVE-2012-0880   
                  xscreensaver | CVE-2021-34557   | https://security-tracker.debian.org/tracker/CVE-2021-34557  
                           zip | CVE-2018-13410   | https://security-tracker.debian.org/tracker/CVE-2018-13410  
                          zlog | CVE-2021-43521   | https://security-tracker.debian.org/tracker/CVE-2021-43521  


-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
