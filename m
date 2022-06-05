Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0537AC433EF
	for <buildroot@archiver.kernel.org>; Sun,  5 Jun 2022 04:53:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6470461256;
	Sun,  5 Jun 2022 04:53:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lBE3_Cxi1iei; Sun,  5 Jun 2022 04:53:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 79A3E61251;
	Sun,  5 Jun 2022 04:53:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2D4861BF3BD
 for <buildroot@lists.busybox.net>; Sun,  5 Jun 2022 04:53:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1ECA4845BD
 for <buildroot@lists.busybox.net>; Sun,  5 Jun 2022 04:53:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5Kt_J1QwNh87 for <buildroot@lists.busybox.net>;
 Sun,  5 Jun 2022 04:53:09 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 141C4845B3
 for <buildroot@buildroot.org>; Sun,  5 Jun 2022 04:53:08 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id DB58EFF808
 for <buildroot@buildroot.org>; Sun,  5 Jun 2022 04:53:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1654404784; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=rZlLOROTukfWQtddKOtshH7koNUoIo4Os0wjvI9WoKk=;
 b=OUo/aw8HkRL/bqwIhMWkT5aQCOSMeyafa6o5W9ZdMS54iW32mlRog5ErrlTvZROOraYNrx
 p9eolFh7Jkbk4cdpdXx07/E+WiDjyrZ414Bqevm1o2enbU9+wBk+5LASFvSj/EQkx5qx1I
 QE0G890EZ8t/1yEdsRZmpbs3U6XDh7hMOG6YxFTS/Kayi2/pGGuLAyeTt0ch45vFaK/T/6
 1dGG505ixsMhubPOWFkyXH2wtfvrVlp6jumxMTS51mw0dL9H1FNXi04DYDW/JVMu56w116
 lqL8WFPu9Du3jibHjGp1+0/p1tuIfVf6QPLV78C90Cvwawgb/wBi3j3VDM34tg==
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sun, 05 Jun 2022 04:53:03 -0000
Message-Id: <20220605045312.1ECA4845BD@smtp1.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-06-04
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

Autobuild statistics for 2022-06-04
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  | 24  |  4  |  1  | 29  |
    master   | 198 | 198 |  0  | 396 |

Classification of failures by reason for master
-----------------------------------------------

         host-gcc-final-10.3.0 | 24
                   perl-5.34.1 | 7 
glibc-2.35-96-g2c4fc8e5ca74... | 6 
                  linux-5.17.7 | 6 
              swupdate-2022.05 | 6 
           libfreeimage-3.18.0 | 5 
    toolchain-external-bootlin | 5 
host-pahole-73383b3a39afe86... | 4 
             libopenssl-1.1.1o | 4 
                libressl-3.5.2 | 4 
       linux-5.10.104-cip3-rt3 | 4 
                 zlib-ng-2.0.6 | 4 
                     frr-8.2.2 | 3 
          host-gcc-final-9.4.0 | 3 
                host-go-1.18.2 | 3 
               libglib2-2.70.4 | 3 
             libgpg-error-1.42 | 3 
                mongodb-4.2.18 | 3 
                     refpolicy | 3 
       shadowsocks-libev-3.3.5 | 3 
                 uclibc-1.0.41 | 3 
                    4th-3.64.0 | 2 
                  acpid-2.0.33 | 2 
               apcupsd-3.14.14 | 2 
                bitcoin-0.21.2 | 2 
              containerd-1.6.2 | 2 
                 dash-0.5.11.5 | 2 
                     file-5.41 | 2 
  gobject-introspection-1.70.0 | 2 
         host-gcc-final-11.3.0 | 2 
host-google-breakpad-c85eb4... | 2 
                  netsurf-3.10 | 2 
                  nginx-1.20.1 | 2 
               protobuf-3.20.1 | 2 
            qpid-proton-0.35.0 | 2 
                       unknown | 2 
                  vlc-3.0.17.4 | 2 
                       xenomai | 2 
                xenomai-custom | 2 
              alsa-lib-1.2.6.1 | 1 
                    apg-2.3.0b | 1 
                     aufs-util | 1 
                    bat-0.19.0 | 1 
                  boost-1.79.0 | 1 
            bridge-utils-1.7.1 | 1 
                    brltty-6.4 | 1 
               collectd-5.12.0 | 1 
dahdi-linux-5c840cf43838e06... | 1 
                elfutils-0.186 | 1 
              erlang-22.3.4.22 | 1 
                  exempi-2.6.1 | 1 
fs/axfs/axfs.mk:32: /home/a... | 1 
fs/cramfs/cramfs.mk:46: /nv... | 1 
fs/f2fs/f2fs.mk:64: /nvmeda... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /nvme... | 1 
google-breakpad-c85eb4a59b6... | 1 
                       gsl-2.6 | 1 
       host-gcc-initial-10.3.0 | 1 
         host-protobuf-c-1.4.0 | 1 
                  hostapd-2.10 | 1 
kmscube-4660a7dca6512b6e658... | 1 
               libcodec2-1.0.1 | 1 
                libmad-0.15.1b | 1 
                  libsepol-3.3 | 1 
               libsigsegv-2.14 | 1 
   libtorrent-rasterbar-1.2.15 | 1 
           libwebsockets-4.3.1 | 1 
                libzlib-1.2.12 | 1 
               lighttpd-1.4.64 | 1 
           linux-5.10.104-cip3 | 1 
                   linux-tools | 1 
        lttng-babeltrace-1.5.7 | 1 
          moby-buildkit-0.10.0 | 1 
         multipath-tools-0.8.9 | 1 
                  mxs-bootlets | 1 
                  ndisc6-1.0.5 | 1 
                    ne10-1.2.1 | 1 
                netdata-1.33.1 | 1 
             netsniff-ng-0.6.8 | 1 
            ocf-linux-20120127 | 1 
               openpgm-5-3-128 | 1 
          perl-net-ssleay-1.85 | 1 
                     pv-1.6.20 | 1 
rtl8189es-39c17661136da48f8... | 1 
rtl8723bs-11ab92d8ccd71c80f... | 1 
rtl8821au-4235b0ec7d7220a63... | 1 
                    ruby-3.1.2 | 1 
                  sudo-1.9.8p2 | 1 
                 systemd-250.4 | 1 
toolchain-external-codescap... | 1 
                   tor-0.4.7.7 | 1 
               valgrind-3.19.0 | 1 
                wtfutil-0.41.0 | 1 
                    zstd-1.5.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |           4th-3.64.0           | NOK | http://autobuild.buildroot.net/results/081ffddf7f878dfdcb1370b5f2b98a2d3bf69ed9 |     
  mips64el   |           4th-3.64.0           | NOK | http://autobuild.buildroot.net/results/54353d2657758794d1c0c5524b8ba09dafd330d4 |     
  mips64el   |          acpid-2.0.33          | NOK | http://autobuild.buildroot.net/results/9f2a6be2c95bf767d6a74b7c5eb47a0a2bfaacae | ORPH
   mips64    |          acpid-2.0.33          | NOK | http://autobuild.buildroot.net/results/61928412f908cc433234a621153e522077e69507 | ORPH
    m68k     |        alsa-lib-1.2.6.1        | NOK | http://autobuild.buildroot.net/results/60f2e5058732046892bd377434e856127796ce3a |     
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/5cc0b01e4ddcf436d74ed274de42aff732973e2f |     
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/5ec91fd3ba73b64b89ac2d78547cd9ab1f552a71 |     
    sh4a     |           apg-2.3.0b           | NOK | http://autobuild.buildroot.net/results/773d594d563531c973c2cd437eccaf614acf29c8 |     
    i686     |           aufs-util            | NOK | http://autobuild.buildroot.net/results/84f09da9e3c62ca3ba049970b55d7859e7e387db |     
    mips     |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/abc50eea576324982ad8324c3c912c411207e734 |     
   s390x     |         bitcoin-0.21.2         | NOK | http://autobuild.buildroot.net/results/f4ef697f339180c90fbd1e183199fe9d282aa2d9 |     
 aarch64_be  |         bitcoin-0.21.2         | NOK | http://autobuild.buildroot.net/results/43fde3fa3b3671bbcafb748d5eef6965eecd6360 |     
    arc      |          boost-1.79.0          | NOK | http://autobuild.buildroot.net/results/30f65781075da4432659c730cff98a99445a832b |     
    m68k     |       bridge-utils-1.7.1       | NOK | http://autobuild.buildroot.net/results/a1b7ae20c0236498bc4419bcba752542cf8f7b93 |     
   mipsel    |           brltty-6.4           | NOK | http://autobuild.buildroot.net/results/181734a26d22e6289abf7b63af644c2b64d3c8aa |     
    arm      |        collectd-5.12.0         | NOK | http://autobuild.buildroot.net/results/19e36f48f739e2682dbd8f0502df627d5be009c4 |     
   x86_64    |        containerd-1.6.2        | NOK | http://autobuild.buildroot.net/results/76b084494e9bf4345e93a9ac3f33407115ba2862 |     
    i686     |        containerd-1.6.2        | NOK | http://autobuild.buildroot.net/results/b584676b56be473e791c777d2f5da40f4789d006 |     
 aarch64_be  | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/93399fe632663c1c9716f97787e599fbf4a697c6 |     
    arc      |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/8ee1c1efdb7c39ce412de46eda42f2992f14c432 | ORPH
   armeb     |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/b18fa59efd3b4e32d5f10534012ab1396f0347a0 | ORPH
   arceb     |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/5f2803023ff2ac4654e1aa4b69619ac8997362cb | ORPH
    arm      |        erlang-22.3.4.22        | NOK | http://autobuild.buildroot.net/results/2d5f0edb02bd592d1300f2407db6b24e0fd8608f |     
    arm      |          exempi-2.6.1          | NOK | http://autobuild.buildroot.net/results/a2fd8ced9dcc8216234b85b27607d93426243fd4 |     
  powerpc    |           file-5.41            | NOK | http://autobuild.buildroot.net/results/e39230e5a636d6125b4c81a21c8a17ca802722f8 | ORPH
    mips     |           file-5.41            | NOK | http://autobuild.buildroot.net/results/5e3cdb511e9aec3208a88a45e342d6567ce8fbdd | ORPH
  mips64el   |           frr-8.2.2            | NOK | http://autobuild.buildroot.net/results/81546093980198d44c8dbd31b799c21373af1acb |     
  mips64el   |           frr-8.2.2            | NOK | http://autobuild.buildroot.net/results/db5ad0025d8f874212a871f166afb57187997e19 |     
  mips64el   |           frr-8.2.2            | NOK | http://autobuild.buildroot.net/results/6cb8cb2a56daad8fee34a6f84832c43fcc497958 |     
  sparc64    | fs/axfs/axfs.mk:32: /home/a... | NOK | http://autobuild.buildroot.net/results/c37689cfbd39645b25c3839364c84e87ae40cf2e |     
    i586     | fs/cramfs/cramfs.mk:46: /nv... | NOK | http://autobuild.buildroot.net/results/c740e53f8e2f9b2a8cb9a10f09b7e838b1501091 |     
   mipsel    | fs/f2fs/f2fs.mk:64: /nvmeda... | NOK | http://autobuild.buildroot.net/results/9474dbdd81d6761ce31cdd955790596338f85ebc |     
   nios2     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/3e7fdf765535fa075aa529aee76f2ffb34f0e915 |     
    m68k     | fs/ubifs/ubifs.mk:49: /nvme... | NOK | http://autobuild.buildroot.net/results/a1a4c7940439ee52ab95e1fbda73701e16fcd408 |     
  riscv32    | glibc-2.35-96-g2c4fc8e5ca74... | NOK | http://autobuild.buildroot.net/results/d25939579a7f9c0abbd2ab2e46bb15f844bbe452 |     
  powerpc    | glibc-2.35-96-g2c4fc8e5ca74... | NOK | http://autobuild.buildroot.net/results/0bf819b87b4c6cff0d235bee3de4c7a247eacd64 |     
   sh4aeb    | glibc-2.35-96-g2c4fc8e5ca74... | NOK | http://autobuild.buildroot.net/results/bab2c3eafabe9573f863aa5a46e00435a5dc402e |     
    or1k     | glibc-2.35-96-g2c4fc8e5ca74... | NOK | http://autobuild.buildroot.net/results/bdb997a7c72031412eff7bd254580427245265cb |     
  riscv32    | glibc-2.35-96-g2c4fc8e5ca74... | NOK | http://autobuild.buildroot.net/results/6826f9dd2a1c18f8ff1caa8a4b998a4cc89c5395 |     
   sh4aeb    | glibc-2.35-96-g2c4fc8e5ca74... | NOK | http://autobuild.buildroot.net/results/0d79ec152ffeade8a376fe196bc41c92b897392b |     
    or1k     |  gobject-introspection-1.70.0  | NOK | http://autobuild.buildroot.net/results/35072dd96fb3e6efc47a3edf20d0fb8b13c0948b | ORPH
   nios2     |  gobject-introspection-1.70.0  | NOK | http://autobuild.buildroot.net/results/ee557f5e18c3bf077e95cce8afe088c130ac96b7 | ORPH
    arm      | google-breakpad-c85eb4a59b6... | NOK | http://autobuild.buildroot.net/results/226868b3d384d04332ec18f0123928e85c27f751 |     
  powerpc    |            gsl-2.6             | NOK | http://autobuild.buildroot.net/results/51e15d3b7a700f6b3c63acd085462bc174e30373 | ORPH
powerpc64le  |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/81081bd76098cb27f432ab27bc7107100d75b224 |     
  riscv32    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/774d37a1b42a82ca4de8612a171229ac943a8c6f |     
powerpc64le  |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/a76c146fe878f998ebd74c87549de644cb77ed5c |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/1be60da2b941d248ef06e7aedd34e213bcb8ed72 |     
    i686     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/a1f6dbefc65ced06ef71020bccc83c8c8722a5c8 |     
 powerpc64   |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/5754fce98482b0aaa2cb35958f981c866e5eac9b |     
powerpc64le  |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/a7a41099d907912daa577d4000c9541fd424581f |     
 powerpc64   |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/fa94b991ea00b6e4f6093c75751c07956de6d6a6 |     
   x86_64    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/b7a302e7f363dfb301994d59167228a30cdfc107 |     
  sparc64    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/d6e9048b8e565b513e7eebd638ee0027ec073ddb |     
powerpc64le  |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/aefcb1c3226c6e07c056bacd3e5ccd2f00c316bb |     
powerpc64le  |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/dace08cb3a612da3c197b45042913bb9ac54f9ae |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/9f5c2b1cab1d2216a8036bb2624ff8b92ddea9f6 |     
powerpc64le  |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/2f21ac2a29cb1f60f86e511b6fafb8e64a702539 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/6fa9e6a30d3427a3b3b9a79b1b24b84b2ad52473 |     
 powerpc64   |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/b2ed65cc2be5440b6cc7935b33b8949e8fb74ff3 |     
  powerpc    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/561f258aa338b6ac5b2c93584b0d6d11017749ef |     
  sparc64    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/cdf34da4bd6f6599b85671cbfb2ac7cb30dac805 |     
 powerpc64   |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/6ba7526a4ceb286fa62fba30cd8dd65fa414aa10 |     
powerpc64le  |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/eea551869aad08aa0cc1e9b28b5a9264253d506b |     
powerpc64le  |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/2fd2e34752bd08b4be839e17c64dd4d89cf4c557 |     
  riscv32    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/19343ae5a2dcc512cf02ed5460ace365dc1e324e |     
powerpc64le  |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/c5431a70b72642354ba314a4d9a4f1a37b5ca749 |     
   nios2     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/93d8fe2ecb8da51cb3ab9a40d4e33bae24703902 |     
  riscv32    |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/bbfa97fe7ddd159378123fb45ef73eae51a7659e |     
    i686     |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/92667a6b975595dd2e9bc0e5d1c9c3fa7596084f |     
  riscv32    |      host-gcc-final-9.4.0      | NOK | http://autobuild.buildroot.net/results/d388c955dbf2f7b2d6096ad71f88fc885427a063 |     
powerpc64le  |      host-gcc-final-9.4.0      | NOK | http://autobuild.buildroot.net/results/1233463e4907b15b3760981fefffe67acb7c61f6 |     
   nios2     |      host-gcc-final-9.4.0      | NOK | http://autobuild.buildroot.net/results/4555a75a3de7414bb7ba12930f0bea409d98a0ee |     
    arm      |    host-gcc-initial-10.3.0     | NOK | http://autobuild.buildroot.net/results/98878190c02ff60491bc5952769c30bb951f1e08 |     
   mips64    |         host-go-1.18.2         | NOK | http://autobuild.buildroot.net/results/ec5eaa8f64b9ca29b045fd6f54e792c6bf671525 |     
   mips64    |         host-go-1.18.2         | NOK | http://autobuild.buildroot.net/results/29c6bb3f68c24b7e2c5ec647be851df67ccda597 |     
    i586     |         host-go-1.18.2         | NOK | http://autobuild.buildroot.net/results/3705f24464510569be3759e37449d671576bdb87 |     
    arm      | host-google-breakpad-c85eb4... | NOK | http://autobuild.buildroot.net/results/fa97acf10d4d91e69f7106df83b176e4614f5ec5 |     
    mips     | host-google-breakpad-c85eb4... | NOK | http://autobuild.buildroot.net/results/85b16d7a0c8f5e825f9e6f37654af283470ab6cd |     
  riscv64    | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/c896dded062250f0c5920320cefcac0cc42d5682 |     
   nios2     | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/906ed6712a775aca42efdaedf779f50029df3ec5 |     
  riscv64    | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/8052b66d08bf28e0b3f4e2a9c1ccf39a916c09dc |     
powerpc64le  | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/1552037221ec86de24e617a90940e5bb23bf051b |     
  riscv32    |     host-protobuf-c-1.4.0      | NOK | http://autobuild.buildroot.net/results/79986e0547db8fc130dfe19bc74c91f7c75fcadd |     
   x86_64    |          hostapd-2.10          | NOK | http://autobuild.buildroot.net/results/9901df820d3afa4cde78e8ad6d62cb8ce7e69fdb |     
    arm      | kmscube-4660a7dca6512b6e658... | NOK | http://autobuild.buildroot.net/results/89c4182da40de30818cd14e8e48c5be633024905 |     
  powerpc    |        libcodec2-1.0.1         | NOK | http://autobuild.buildroot.net/results/01fa7cf71e32032e5611ae3afb62b340b79deb23 |     
 powerpc64   |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/d91c33502dc2f2abe2a015bbadf89708260c2ec4 |     
   s390x     |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/279d676fe1e1fd3f24bb4417a7d71b5480a3b4f9 |     
  riscv64    |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/8d6ccc76a46a95cac63bb64d6390243e74abfb06 |     
   x86_64    |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/fe654987714d1e75c32d95d6e1d18d893c014326 |     
   x86_64    |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/0eda5aee987042b8861d253b73abf0339e0bd75d |     
   arceb     |        libglib2-2.70.4         | NOK | http://autobuild.buildroot.net/results/e2c6eca6fd9d1e5d00b2c2768d358dc9a96bc7e8 |     
   arceb     |        libglib2-2.70.4         | NOK | http://autobuild.buildroot.net/results/4a6a1163ca8ff343455d7b4b7496b28bf019f1dc |     
    arc      |        libglib2-2.70.4         | NOK | http://autobuild.buildroot.net/results/fcc09cc233de6e133076ecf8432d3805e8ef379b |     
  aarch64    |       libgpg-error-1.42        | NOK | http://autobuild.buildroot.net/results/233c42effb912cde16c71805d8960b4f56eadcaa | ORPH
  aarch64    |       libgpg-error-1.42        | NOK | http://autobuild.buildroot.net/results/28cd4c2e69307247fc6ace3477f508a786e1e9d3 | ORPH
  aarch64    |       libgpg-error-1.42        | NOK | http://autobuild.buildroot.net/results/c4078717ff1229f7f5441921874b5803af22f953 | ORPH
    arm      |         libmad-0.15.1b         | NOK | http://autobuild.buildroot.net/results/6fa1ff263d7e0f6c11475207c18bf4eff2885032 | ORPH
    arc      |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/40485f170ca0bda61c6db8b30d3577d5962875e6 |     
   sparc     |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/877a1ee38bcee57a31b1353502754721f42b703e |     
   sh4eb     |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/848ccdf52d78661f8f7bce33917dc7d681fef664 |     
    sh4      |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/4bbbd64875612ddf70a7e299a3e28d3bdabeb2d8 |     
   armeb     |         libressl-3.5.2         | NOK | http://autobuild.buildroot.net/results/57b03b81018948b2345d5182e4d2a0ad60861bc5 | ORPH
   armeb     |         libressl-3.5.2         | NOK | http://autobuild.buildroot.net/results/4e0884563b9daa768bd5d70dbd9e416e2bcbd009 | ORPH
 microblaze  |         libressl-3.5.2         | NOK | http://autobuild.buildroot.net/results/fed65efed8ee7d23fdf0f70b241bd0b790c91ef2 | ORPH
    arm      |         libressl-3.5.2         | NOK | http://autobuild.buildroot.net/results/4a90e575638fedd74200c71ac57371c761bb1994 | ORPH
  mips64el   |          libsepol-3.3          | NOK | http://autobuild.buildroot.net/results/e34a8706cc061962fa7e4374c51d2a6eb4dd3023 |     
  powerpc    |        libsigsegv-2.14         | NOK | http://autobuild.buildroot.net/results/77b600071f07605be3ec28e2da46d6938e240087 |     
   x86_64    |  libtorrent-rasterbar-1.2.15   | NOK | http://autobuild.buildroot.net/results/b0fa6d067e9ad6cdebd1337373199f9268f4c54a |     
    arc      |      libwebsockets-4.3.1       | NOK | http://autobuild.buildroot.net/results/8c3020b620f921d89073f734303353ab5c4f625a |     
    m68k     |         libzlib-1.2.12         | NOK | http://autobuild.buildroot.net/results/999217fa5ced3fbb915ba3f151ae7d92c914f5d1 | ORPH
   arceb     |        lighttpd-1.4.64         | NOK | http://autobuild.buildroot.net/results/1ff3eeaeec442ee435f87253a538085f5410e4ec |     
   arceb     |      linux-5.10.104-cip3       | NOK | http://autobuild.buildroot.net/results/688fcc703da2cdd765de9aa68a3e8b3402b16aa7 | ORPH
microblazeel |    linux-5.10.104-cip3-rt3     | NOK | http://autobuild.buildroot.net/results/ce7920cfe5d29c560e3ad3b7ff4495ee43065b59 | ORPH
   mipsel    |    linux-5.10.104-cip3-rt3     | NOK | http://autobuild.buildroot.net/results/0f3ef486b1a452ea4b7f10e0e506836984e2dcc5 | ORPH
  mips64el   |    linux-5.10.104-cip3-rt3     | NOK | http://autobuild.buildroot.net/results/9b4de322588893aa01871ad9fc3da9f166851c04 | ORPH
    mips     |    linux-5.10.104-cip3-rt3     | NOK | http://autobuild.buildroot.net/results/256f39d67e7e30b75a8eba9d51cc26f95184d744 | ORPH
    mips     |          linux-5.17.7          | NOK | http://autobuild.buildroot.net/results/c47a05a3f78b6d46b738cace0c551bd9ba3714cb | ORPH
  mips64el   |          linux-5.17.7          | NOK | http://autobuild.buildroot.net/results/b740f0c0aacac760f3ada2075052bcef23ab3f17 | ORPH
    mips     |          linux-5.17.7          | NOK | http://autobuild.buildroot.net/results/592165292a631e71ddfa46bc9223f71d99272e90 | ORPH
  powerpc    |          linux-5.17.7          | NOK | http://autobuild.buildroot.net/results/ae17dfdddf76d9e5431f60e3aa2fad09d0cd7eb7 | ORPH
    m68k     |          linux-5.17.7          | NOK | http://autobuild.buildroot.net/results/d090f1685bafd19effc0e46676a915d7d164a15f | ORPH
  mips64el   |          linux-5.17.7          | NOK | http://autobuild.buildroot.net/results/38c5c798114df7c2c06b48b058924f3e5998f832 | ORPH
   xtensa    |          linux-tools           | NOK | http://autobuild.buildroot.net/results/24206071721479a6ba4d0267e7e20ef9498e1e05 | ORPH
   mips64    |     lttng-babeltrace-1.5.7     | NOK | http://autobuild.buildroot.net/results/c14cb0f9b7a75599404ee778adc23487bb5fc883 |     
   x86_64    |      moby-buildkit-0.10.0      | NOK | http://autobuild.buildroot.net/results/70827c0680d60f707b3bb49b44952f5d3c17cd2c |     
   x86_64    |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/bd5a5a45b0dfb49e3ef6675f7546ed85bf7c0290 |     
  aarch64    |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/a78807fa9c0917a02614df5673c26da3e562d11b |     
   x86_64    |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/aedc633e7bc3c62d9ae3309beb8ba7276e981a01 |     
 aarch64_be  |     multipath-tools-0.8.9      | NOK | http://autobuild.buildroot.net/results/740c2e6fc5ff408498b9ea1996c3eeb415850cc8 |     
    arm      |          mxs-bootlets          | NOK | http://autobuild.buildroot.net/results/5745934a63d0a6cbee7df58c775bdb6885c2e472 |     
    arm      |          ndisc6-1.0.5          | NOK | http://autobuild.buildroot.net/results/bd2c68d600f3d9cfe98e517fad7de8570dc88738 | ORPH
  aarch64    |           ne10-1.2.1           | NOK | http://autobuild.buildroot.net/results/a4f2979b490c2f0edfbd4cece78697fe57926b9f |     
  nds32le    |         netdata-1.33.1         | NOK | http://autobuild.buildroot.net/results/5a0caa580a9d3b9a29a49c31b801af25645a29c9 |     
   x86_64    |       netsniff-ng-0.6.8        | NOK | http://autobuild.buildroot.net/results/ceadbdea8cc35bfd7d601a6d4b18137f81f61406 |     
    arc      |          netsurf-3.10          | NOK | http://autobuild.buildroot.net/results/c006563dd45164ff57076d3a600ce95993e56725 |     
    i686     |          netsurf-3.10          | NOK | http://autobuild.buildroot.net/results/032b39b92b321a37852b1a2aed69063951dd9aaf |     
   arceb     |          nginx-1.20.1          | NOK | http://autobuild.buildroot.net/results/98a51d2364b0f450ed53d5d22aceaa560b886635 |     
  riscv32    |          nginx-1.20.1          | NOK | http://autobuild.buildroot.net/results/0938757c2a87218f75be0e618a18309f14ba7db1 |     
   armeb     |       ocf-linux-20120127       | NOK | http://autobuild.buildroot.net/results/411e77291ca83e9941fd235571bdbf63014eacda | ORPH
 powerpc64   |        openpgm-5-3-128         | NOK | http://autobuild.buildroot.net/results/f8d19b05a2d11d3dee481e72eeb2d9a9d9f1b9c1 |     
    sh4      |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/2b1825e299048d59ed58815a4e6cb228a02a3bae |     
    m68k     |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/2342709d5d812067d9f5433b0cc705ed82bbf137 |     
microblazeel |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/e280c76cd40215d7f82471034d6c9c13e58ce16e |     
   arceb     |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/91df93d45723386e21db9ffd02bf83ad9d843415 |     
   sh4eb     |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/7bfbcbb33df5bcd2735ff9b62fdfaf0b02f810db |     
   sparc     |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/1d776865a00f2e376171242ab73213237463817e |     
  powerpc    |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/ae1965f483196d1ad38e789df05a1f5d39bd9f6f |     
    arm      |      perl-net-ssleay-1.85      | NOK | http://autobuild.buildroot.net/results/8d71211d9a41a0fc1773aedd2b9dd540510b2ad4 |     
    sh4      |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/145da18d359b88662dcac614a93b56399ec904b6 |     
   nios2     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/ee96e1e3e63621b31728806ecc5a0aa1b2b5c394 |     
   armeb     |           pv-1.6.20            | NOK | http://autobuild.buildroot.net/results/bd2c0af390e97e31320008f26329d24fb4823817 | ORPH
microblazeel |       qpid-proton-0.35.0       | NOK | http://autobuild.buildroot.net/results/c2b855fad86e568e4dbec59cf36922cc806ba7c7 |     
    mips     |       qpid-proton-0.35.0       | NOK | http://autobuild.buildroot.net/results/3bc387411e92799c7e50389cddb735e10c7a38f1 |     
  mips64el   |           refpolicy            | NOK | http://autobuild.buildroot.net/results/60363ea4b85d4c4eb7827a2019e11193e61588ac |     
  riscv32    |           refpolicy            | NOK | http://autobuild.buildroot.net/results/6eae11ebe3389d71d91a49b2643b1688c6dc5185 |     
   arceb     |           refpolicy            | NOK | http://autobuild.buildroot.net/results/14c5fb498c98dff495a81e8f9cfa2dd828f0c75f |     
   arceb     | rtl8189es-39c17661136da48f8... | NOK | http://autobuild.buildroot.net/results/ecc68435f9bc6409e75566991b97aac0ff6b6d84 |     
microblazeel | rtl8723bs-11ab92d8ccd71c80f... | NOK | http://autobuild.buildroot.net/results/f01f52f422c57b674b465091598ab95771ab85bd |     
    or1k     | rtl8821au-4235b0ec7d7220a63... | NOK | http://autobuild.buildroot.net/results/4069253cb40f1e0fb9d346857a8ae263d0abd8b0 |     
   nios2     |           ruby-3.1.2           | NOK | http://autobuild.buildroot.net/results/5d26577d5c2e03241dbea153f5d0e797a9b92a67 |     
  mips64el   |    shadowsocks-libev-3.3.5     | NOK | http://autobuild.buildroot.net/results/400ee9847838f462b8e98cf5701cb513cbf8cc32 |     
  aarch64    |    shadowsocks-libev-3.3.5     | NOK | http://autobuild.buildroot.net/results/b8c97913f0edea35058ed10178477ccdb91ca071 |     
microblazeel |    shadowsocks-libev-3.3.5     | NOK | http://autobuild.buildroot.net/results/658a47d8589a5adeeff21e3093a58b5f75339038 |     
   mips64    |          sudo-1.9.8p2          | NOK | http://autobuild.buildroot.net/results/54534acf4b4eac72a2eee62f98e98b26c69d5de6 | ORPH
microblazeel |        swupdate-2022.05        | NOK | http://autobuild.buildroot.net/results/c341a330825376427d4c87c72f899f6903878e62 |     
    mips     |        swupdate-2022.05        | NOK | http://autobuild.buildroot.net/results/e1b02353e93a74e5acaab333add4b7043cbdcafb |     
  powerpc    |        swupdate-2022.05        | NOK | http://autobuild.buildroot.net/results/bf6f03c6bebe5bccd849dae4588aba1638529dc6 |     
   xtensa    |        swupdate-2022.05        | NOK | http://autobuild.buildroot.net/results/36bf1ab62054608bb3f8b0d2cdf36a31a8a4c95d |     
    i686     |        swupdate-2022.05        | NOK | http://autobuild.buildroot.net/results/38ee4717cb9de769d09c4e50d37174e0aae45f2d |     
microblazeel |        swupdate-2022.05        | NOK | http://autobuild.buildroot.net/results/b455dd9652e75cbf9dd40f009f29921e0f9e6a9d |     
   s390x     |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/450b088803237ab5ce230a6a61814eac561136f8 |     
   nios2     |   toolchain-external-bootlin   | NOK | http://autobuild.buildroot.net/results/5b2968025ce19d1846f8362214382eb0988bcfde |     
   mips64    |   toolchain-external-bootlin   | NOK | http://autobuild.buildroot.net/results/09af904af8253a34431b5b554601324d76bf7b7e |     
   mips64    |   toolchain-external-bootlin   | NOK | http://autobuild.buildroot.net/results/94937afba077991df7623d282ca5c8ca671c663d |     
   mips64    |   toolchain-external-bootlin   | NOK | http://autobuild.buildroot.net/results/242ffc57f8ec95d9262b0c5da88e9ede7c08b27c |     
  sparc64    |   toolchain-external-bootlin   | NOK | http://autobuild.buildroot.net/results/b640fe5118ec5277cfa9fa3847d9a5caa8e20a31 |     
   mipsel    | toolchain-external-codescap... | NOK | http://autobuild.buildroot.net/results/a6814867d46bec1e6a751c7e34d180900441430e | ORPH
    or1k     |          tor-0.4.7.7           | NOK | http://autobuild.buildroot.net/results/74608a8a57ef17afec5d89371a990d23cea97ca7 |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/239ff28824eccc5b3b3fd7b2a17b37d1d81b322d |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/9ee90a5306b8732955c1da5d92d9ad6867aa6edc |     
  powerpc    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/dcd6ce4f9e06a8ea7fcfda33f543b38c75d59f34 |     
 aarch64_be  |            unknown             | NOK | http://autobuild.buildroot.net/results/6beb258cefedaf6457f5c38a5ecf07e4df221b57 |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/a31ed3f1532c81d8f71ad4ea1946012d23d59224 |     
   mips64    |        valgrind-3.19.0         | NOK | http://autobuild.buildroot.net/results/c479cfa900bd7a9db3f4609bf73be2706a09719e | ORPH
  aarch64    |          vlc-3.0.17.4          | NOK | http://autobuild.buildroot.net/results/ba983e185fbf5a01ef3e68d45b46e3e31331b1dd |     
   xtensa    |          vlc-3.0.17.4          | NOK | http://autobuild.buildroot.net/results/25727d4c6b82d03bf5235072d9c317511bd640bc |     
   s390x     |         wtfutil-0.41.0         | NOK | http://autobuild.buildroot.net/results/223b9407773dcd8a98e8f3424a14d36d1a6c1875 |     
   mips64    |            xenomai             | NOK | http://autobuild.buildroot.net/results/8d1d2486ff7098a3061d8337999bd9ed8e8550b7 |     
 aarch64_be  |            xenomai             | NOK | http://autobuild.buildroot.net/results/1d4c8ecf556d5bbb1984098613acbaf1e8af24cb |     
   s390x     |         xenomai-custom         | NOK | http://autobuild.buildroot.net/results/af3bd77d6937a16182bcbf3692726a7cef1fef3f |     
   x86_64    |         xenomai-custom         | NOK | http://autobuild.buildroot.net/results/93c7e1a87e52eb5d2b11143225711d9c0a4571c9 |     
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/c9995eee813981b9de37362c5ac4e3c1ccbebef5 | ORPH
  aarch64    |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/8fb10325865ab672d36a9b4d559bafccc908280d | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/eac7f1fd0d5095e65a56a7a5e34fb8f0b1eeeff5 | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/45e3ee0ddc29b2aad0f7c68439f6a5cfa0b57dca | ORPH
 microblaze  |           zstd-1.5.2           | NOK | http://autobuild.buildroot.net/results/a84f4a10dd0ef5b0f53d48aaa5155cee863dd1a3 |     


Classification of failures by reason for 2022.02.x
--------------------------------------------------

                 wavemon-0.9.4 | 2 
               apcupsd-3.14.14 | 1 
             containerd-1.5.11 | 1 
                       libuwsc | 1 


Detail of failures for 2022.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/e5fed0ca1e740785709a18c8e1fc0b3118b32b35 |     
    i586     |       containerd-1.5.11        | NOK | http://autobuild.buildroot.net/results/4d6caadc5b0c646340b2b488f3fdf56a186713a5 |     
  riscv64    |            libuwsc             | TIM | http://autobuild.buildroot.net/results/5135fad400c225cd4642a827bf40cc23f5ce2e4e |     
   nios2     |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/90cb17442fc28ed3294d09be8841bf388f44cbd4 |     
    arc      |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/c6e87fb81d8545a53337a2b0b255ce14fbec30f4 |     


Gitlab CI results for 2022-06-04
================================


-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
