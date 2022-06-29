Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08B17C433EF
	for <buildroot@archiver.kernel.org>; Wed, 29 Jun 2022 05:52:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3D0A060B3A;
	Wed, 29 Jun 2022 05:52:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3D0A060B3A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id or5uZv9qXGUO; Wed, 29 Jun 2022 05:52:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E736460AC0;
	Wed, 29 Jun 2022 05:51:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E736460AC0
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5E74C1BF366
 for <buildroot@lists.busybox.net>; Wed, 29 Jun 2022 05:51:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 38E0E826A8
 for <buildroot@lists.busybox.net>; Wed, 29 Jun 2022 05:51:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 38E0E826A8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZWFObCyuSBZC for <buildroot@lists.busybox.net>;
 Wed, 29 Jun 2022 05:51:54 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C3B30824E3
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::231])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C3B30824E3
 for <buildroot@buildroot.org>; Wed, 29 Jun 2022 05:51:53 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 70976100008
 for <buildroot@buildroot.org>; Wed, 29 Jun 2022 05:51:50 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Wed, 29 Jun 2022 05:51:50 -0000
Message-Id: <20220629055157.38E0E826A8@smtp1.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1656481910; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=/bNZGhOAFTppNntGHyERnU32CanCnnPT3LYp8R2ZAxc=;
 b=OZj09hlqjTXZFmepCD5ky56N4HlvLKk1p+n+qjPlZJk+aGdQ4kwdnNj1gAaQejl2WetnLj
 0nPw0ggsRfAs4EELBD3+zmBAjsOw/ehIETQSVPXpwEDU8k3Wvoj54a3A2Bj6bjuShA6Wja
 9phF7xyRJ52PLXh99IrsVRewhlM/W+cxEXZWGYPpZmlztgUYFjicDzlk9DbGleByT8PbTS
 DeD/SOS5/gCdXxWT66tHKu3Y2CiaDniFhqZIV0MprPHlaCA5lbBk1TUTAAKbc9mTrOLP3n
 jTWjFi85k/tRZOkg/SoV/M+eutBGpAoMFtRAjj/6g53WxS9prEVH6IKboPDMEw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=OZj09hlq
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-06-28
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

Autobuild statistics for 2022-06-28
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  | 13  |  5  |  0  | 18  |
  2022.05.x  | 38  | 28  |  0  | 66  |
    master   | 158 | 241 |  0  | 399 |

Classification of failures by reason for master
-----------------------------------------------

              alsa-utils-1.2.7 | 19
                iptables-1.8.8 | 15
             libopenssl-1.1.1o | 12
                       unknown | 11
glibc-2.35-96-g2c4fc8e5ca74... | 10
                   speex-1.2.1 | 10
           libfreeimage-3.18.0 | 7 
                 linux-5.17.13 | 7 
host-pahole-73383b3a39afe86... | 6 
                 uclibc-1.0.41 | 6 
                host-go-1.18.3 | 5 
                 pixman-0.40.0 | 5 
                speexdsp-1.2.1 | 5 
         host-gcc-final-10.3.0 | 4 
                libressl-3.5.3 | 4 
                     refpolicy | 4 
                busybox-1.35.0 | 3 
                 dash-0.5.11.5 | 3 
  gobject-introspection-1.70.0 | 3 
              host-rust-1.60.0 | 3 
                   perl-5.34.1 | 3 
               protobuf-3.20.1 | 3 
            quickjs-2021-03-27 | 3 
              swupdate-2022.05 | 3 
                   tor-0.4.7.8 | 3 
                 zlib-ng-2.0.6 | 3 
/home/buildroot/autobuild/i... | 2 
                     aufs-util | 2 
                bitcoin-0.21.2 | 2 
                 fdk-aac-2.0.2 | 2 
                  ffmpeg-4.4.2 | 2 
                     frr-8.2.2 | 2 
                gnu-efi-3.0.10 | 2 
           host-dos2unix-7.4.3 | 2 
         host-protobuf-c-1.4.0 | 2 
              libgcrypt-1.10.1 | 2 
               libglib2-2.70.4 | 2 
             libgpg-error-1.42 | 2 
           libsamplerate-0.1.9 | 2 
              liquid-dsp-1.4.0 | 2 
                 wavemon-0.9.4 | 2 
                  acpid-2.0.33 | 1 
aer-inject-9bd5e2c7886fca72... | 1 
                alsa-lib-1.2.7 | 1 
                arp-scan-1.9.7 | 1 
bayer2rgb-neon-15feb1115b48... | 1 
                  bcg729-1.0.4 | 1 
             berkeleydb-5.3.28 | 1 
                    brltty-6.4 | 1 
            cppcms-2.0.0-beta2 | 1 
                 dmalloc-5.6.5 | 1 
dvb-apps-3d43b280298c39a67d... | 1 
                  exempi-2.6.1 | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /nvme... | 1 
               gocryptfs-2.2.1 | 1 
                      grep-3.7 | 1 
                       gsl-2.6 | 1 
         host-gcc-final-11.3.0 | 1 
host-spirv-llvm-translator-... | 1 
                ipmiutil-3.1.8 | 1 
              jpeg-turbo-2.1.3 | 1 
          libmicrohttpd-0.9.75 | 1 
                   libnss-3.79 | 1 
   libtorrent-rasterbar-1.2.15 | 1 
               libvorbis-1.3.7 | 1 
       linux-5.10.109-cip5-rt4 | 1 
make: *** Waiting for unfin... | 1 
                minimodem-0.24 | 1 
                   ncurses-6.1 | 1 
             netsniff-ng-0.6.8 | 1 
                  netsurf-3.10 | 1 
                nodejs-16.15.0 | 1 
                     nvme-1.12 | 1 
                    opus-1.3.1 | 1 
                     php-8.1.7 | 1 
                      poke-2.1 | 1 
           python-orjson-3.6.7 | 1 
                sg3_utils-1.47 | 1 
       shadowsocks-libev-3.3.5 | 1 
                  snort-2.9.19 | 1 
sox-7524160b29a476f7e87bc14... | 1 
              strongswan-5.9.5 | 1 
toolchain-external-codescap... | 1 
                   uacme-1.7.1 | 1 
                  whois-5.5.11 | 1 
           wpa_supplicant-2.10 | 1 
                       xenomai | 1 
                xenomai-custom | 1 
               xfsprogs-5.14.2 | 1 
                  zabbix-5.4.9 | 1 
                    zstd-1.5.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/b032056b3ddfa94aa8cab9d868c7c6aaa012f5df |     
    arc      | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/c1e7e2747fe23ef06fdc139108449f512eb0708d |     
  mips64el   |          acpid-2.0.33          | NOK | http://autobuild.buildroot.net/results/7da5377c12c6b689284357dce33600708ce3e0d7 | ORPH
  mips64el   | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/e3dc838b716a42c67781ebe821c33e7d602e5546 | ORPH
    m68k     |         alsa-lib-1.2.7         | NOK | http://autobuild.buildroot.net/results/5f9a31cda5f68631223648c1120e8c9724d0cb48 |     
    arc      |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/88c372c89b8109b54e8756d312c64951f1ecc9ed |     
   arceb     |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/66546db1f17b535d8550cb978c4fb8dee8b7f114 |     
    arm      |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/561c9c5c1d76f0428396304a427caf0a400ff34b |     
   mipsel    |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/91525ca1ff2a97ccba1f1da85b0f73c8c954d74d |     
    sh4      |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/049dca68fc1f27ccaebdd90a22124ef9303759dd |     
    arm      |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/52da6a847b3c377b49f02d065cc0d91b99ca26a9 |     
  mips64el   |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/3f9c8c5f18e5f9971725f730304511276cbf5e96 |     
   xtensa    |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/6f8a5f9f661531bd3b1246fb5eb8335fa3e5d901 |     
  aarch64    |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/c8e832a5f67ef5a47ea6ddac276941a1acb0d9d3 |     
   sh4eb     |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/2390bb291131ed5ca29354a3870223d1b4a1be23 |     
   sparc     |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/39f7cfd229f60499699cd43dd21da7216e819e70 |     
    i586     |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/bef148aac177a37be3f767a64e85855f99435523 |     
    i686     |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/0c26e667d970bee5201e38a048522d00d60dc8f2 |     
 aarch64_be  |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/fd4158ede6cdfb37b76ba1b2588333769007809d |     
   xtensa    |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/af1a9b5a35bd5bb69d92d55bf1f3b2edda67b706 |     
powerpc64le  |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/b290b150877e64a9f4ed3e5afac119eac2dc7299 |     
   sparc     |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/699231b4171aa30ce776adb8c93a89dee3a1c75c |     
    or1k     |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/c445d573180229fca4044628e389523af984ab8a |     
    or1k     |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/3acd26826a86660b460dbc6130afd6d334919838 |     
    m68k     |         arp-scan-1.9.7         | NOK | http://autobuild.buildroot.net/results/1a819a1eb1d864ff3aaca6a1db550db2d46aa79e |     
microblazeel |           aufs-util            | NOK | http://autobuild.buildroot.net/results/bda756a41d46da8fc8b5ddfb7fab8690f5da559f |     
    arc      |           aufs-util            | NOK | http://autobuild.buildroot.net/results/db420231bf41fb58c35533f5656c35f558e2932d |     
  aarch64    | bayer2rgb-neon-15feb1115b48... | NOK | http://autobuild.buildroot.net/results/36606ade84f4b647db932d206b7a65e4737fc371 |     
  riscv64    |          bcg729-1.0.4          | NOK | http://autobuild.buildroot.net/results/b2ded552539f695f4b7774d2dc1558c61b9b8b27 |     
    m68k     |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/d3fd450d2b1c41a1751aafd4b47b6808be9bb6d1 | ORPH
    m68k     |         bitcoin-0.21.2         | NOK | http://autobuild.buildroot.net/results/17e926613100a70773f276a549064b60b65fef70 |     
    m68k     |         bitcoin-0.21.2         | NOK | http://autobuild.buildroot.net/results/99a905addef2a6495d5b04a16ec728d9171a4e05 |     
    mips     |           brltty-6.4           | NOK | http://autobuild.buildroot.net/results/d995b98c67fddc48fd0beecd46f91078e07a41e5 |     
  riscv64    |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/b090f646d1867c4e281082f205165353e4b70ef6 | ORPH
  riscv64    |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/5e11e1195ee2bf4bbeb7dfdd746c21f78fcf67de | ORPH
  riscv64    |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/840c885c0783da3b92eee0801d664d4c503f8279 | ORPH
    or1k     |       cppcms-2.0.0-beta2       | NOK | http://autobuild.buildroot.net/results/c3c8c90c8e2ec912c5bc80256ff5451b09c019c5 | ORPH
  mips64el   |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/2f1f2056a69699f26075cc7c53039a48610c7585 | ORPH
    or1k     |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/8f2896a3c56ad5de1e9359836f1157394afcda01 | ORPH
 aarch64_be  |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/aafdf06eac57175279cfce42737966421e940211 | ORPH
  powerpc    |         dmalloc-5.6.5          | NOK | http://autobuild.buildroot.net/results/6644efff7739edc49c4aed0973a4e59d0b8230b1 | ORPH
    m68k     | dvb-apps-3d43b280298c39a67d... | NOK | http://autobuild.buildroot.net/results/edd84117da995173bd96b8c739569f29f76dde5e |     
    arm      |          exempi-2.6.1          | NOK | http://autobuild.buildroot.net/results/8b51a40ad4da4704d7459e13608c34207604e7b0 |     
    i686     |         fdk-aac-2.0.2          | NOK | http://autobuild.buildroot.net/results/d7221c5daae10ab154edb1f1b6a7f63d75358b6a |     
    arm      |         fdk-aac-2.0.2          | NOK | http://autobuild.buildroot.net/results/8ceb9ffa0e21af84990b6c5a73cf2160aa4d652e |     
powerpc64le  |          ffmpeg-4.4.2          | NOK | http://autobuild.buildroot.net/results/8232f8f593e47f24781a27edda76e2dd0f4598ad |     
   armeb     |          ffmpeg-4.4.2          | NOK | http://autobuild.buildroot.net/results/c8a88272a635caa7de0f8e60896b7ffa4e5fc226 |     
   xtensa    |           frr-8.2.2            | NOK | http://autobuild.buildroot.net/results/0252310e1cf9cdf141430b7fb5c4fdab3fc70539 |     
   xtensa    |           frr-8.2.2            | NOK | http://autobuild.buildroot.net/results/f696d580894f972ccefcc285c59fdb8e32bc44c7 |     
    i686     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/33f875054667f108a3a7eee3d022b3e9f07e7ab8 |     
    or1k     | fs/ubifs/ubifs.mk:49: /nvme... | NOK | http://autobuild.buildroot.net/results/bca7ed1fe3d8f5a87207ee15c88e125e52fa3d6f |     
   nios2     | glibc-2.35-96-g2c4fc8e5ca74... | NOK | http://autobuild.buildroot.net/results/02c69df8b5d24f15f5a05bfddc0e1b61a92f4ac3 |     
microblazeel | glibc-2.35-96-g2c4fc8e5ca74... | NOK | http://autobuild.buildroot.net/results/59f937ec197470d61dff748d24da63cad51244fc |     
    or1k     | glibc-2.35-96-g2c4fc8e5ca74... | NOK | http://autobuild.buildroot.net/results/1d6a568996b6c36f09e55b626b782e33cf765ab8 |     
   nios2     | glibc-2.35-96-g2c4fc8e5ca74... | NOK | http://autobuild.buildroot.net/results/a75d04f3c9d18f47b21c05bc3fbd938a486aadff |     
    sh4      | glibc-2.35-96-g2c4fc8e5ca74... | NOK | http://autobuild.buildroot.net/results/136f7b180f5873e90792f8d1ade3d869d542b35a |     
  powerpc    | glibc-2.35-96-g2c4fc8e5ca74... | NOK | http://autobuild.buildroot.net/results/6b9eac51cff7f95f1dcc1e789a0b7dcc692d8c69 |     
  riscv32    | glibc-2.35-96-g2c4fc8e5ca74... | NOK | http://autobuild.buildroot.net/results/620a33523506a88b32b7237fd18fbda4b47e79ad |     
  powerpc    | glibc-2.35-96-g2c4fc8e5ca74... | NOK | http://autobuild.buildroot.net/results/e5e3ef8e886e9bcf15baf1131953c9dd10e97a8d |     
  riscv32    | glibc-2.35-96-g2c4fc8e5ca74... | NOK | http://autobuild.buildroot.net/results/ccf80acf25647974658a2a1330af7ab15771060a |     
    or1k     | glibc-2.35-96-g2c4fc8e5ca74... | NOK | http://autobuild.buildroot.net/results/b4fb7c4d794af8beea177027193d0e552b4a9dbb |     
  mips64el   |         gnu-efi-3.0.10         | NOK | http://autobuild.buildroot.net/results/cd01205b73f2d254edb6d375ee9e574e7d38056a |     
  mips64el   |         gnu-efi-3.0.10         | NOK | http://autobuild.buildroot.net/results/1cea177dcb41fb558786ae32fc72a22c0ff3649a |     
   s390x     |  gobject-introspection-1.70.0  | NOK | http://autobuild.buildroot.net/results/bea706cde574e79a19780d834c948c23ff24b938 | ORPH
  sparc64    |  gobject-introspection-1.70.0  | NOK | http://autobuild.buildroot.net/results/a4458c57bc838e61986dba110dc1c5c9d68b4e75 | ORPH
  sparc64    |  gobject-introspection-1.70.0  | NOK | http://autobuild.buildroot.net/results/1cfe413e470ac3e540ebe08e2dc4376827f899d8 | ORPH
  riscv64    |        gocryptfs-2.2.1         | NOK | http://autobuild.buildroot.net/results/c040165fca083806942d746c1cdb52360476c759 |     
   arceb     |            grep-3.7            | NOK | http://autobuild.buildroot.net/results/09cc0a5f6614765b9d81839cbc24bf119cbdd377 |     
  powerpc    |            gsl-2.6             | NOK | http://autobuild.buildroot.net/results/32b5a27b7699ee6bacaf481547490f3a74e5030d | ORPH
    mips     |      host-dos2unix-7.4.3       | NOK | http://autobuild.buildroot.net/results/680f238d720335ae4378e9bcce05c5d3d0b04933 |     
   mipsel    |      host-dos2unix-7.4.3       | NOK | http://autobuild.buildroot.net/results/a5d28a0822b92550e2b991efc595b5f8806b4e45 |     
    i686     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/33214abee392a1cfd2debf32e35317673336e9bd |     
    i686     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/bac488939a5b2d9a900d4fd9c88a5c9d9a956bad |     
   x86_64    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/8b47ed9dbfee374f7a7fef04568788b72933007a |     
    i686     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/c397edae5c9ac2a4388de99ceb150e32a8c308b5 |     
   x86_64    |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/ecd3142fed61b05b0cdcfa1ca0379e36c19124ba |     
  mips64el   |         host-go-1.18.3         | NOK | http://autobuild.buildroot.net/results/6e25a28e6b18d3087260e0547e57718ed255f17a |     
    i686     |         host-go-1.18.3         | NOK | http://autobuild.buildroot.net/results/08514323495b310ed8d52b1d54a4457c9db8d0a6 |     
powerpc64le  |         host-go-1.18.3         | NOK | http://autobuild.buildroot.net/results/aa26266f861a95afa370b2153a5f94f660c7e0af |     
  mips64el   |         host-go-1.18.3         | NOK | http://autobuild.buildroot.net/results/6ac8dd54f7810fd9a85e8c2d00d7b69ebc9aa4c5 |     
    i686     |         host-go-1.18.3         | NOK | http://autobuild.buildroot.net/results/14fbe6491770f3415497529fea4bdda37f248f98 |     
   x86_64    | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/c25b7253950bd85c0d1b17eaadb5a69098dec1f7 |     
   mips64    | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/fb4d8d06ac117b14223f91871e2c29e79f1a5f43 |     
    arc      | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/797896f25f75e50b52417431d7c85f6f94d58b94 |     
microblazeel | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/6d85dc6748b165a850b8454b12e5021d1f613b04 |     
  sparc64    | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/2eaa6098bb372170af0264cbcdd3e42c3b7699ee |     
    m68k     | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/19e1d232334dba4f62b576d8d8042896fd279f3a |     
  sparc64    |     host-protobuf-c-1.4.0      | NOK | http://autobuild.buildroot.net/results/63e5309772039062b9202824e48e0fa7eacbb28e |     
   xtensa    |     host-protobuf-c-1.4.0      | NOK | http://autobuild.buildroot.net/results/75d5aad026c3d2962f2454ca280b922ff8efdfa9 |     
   x86_64    |        host-rust-1.60.0        | NOK | http://autobuild.buildroot.net/results/cc1def54c73d4b17886c3205a66a4d2ebef4ae9c |     
   x86_64    |        host-rust-1.60.0        | NOK | http://autobuild.buildroot.net/results/af5c2150e54063f392ad1ed729ebf9e4979fe975 |     
  aarch64    |        host-rust-1.60.0        | NOK | http://autobuild.buildroot.net/results/2db5fbd3b815fa32dc005f494fa83366d5fd227e |     
   armeb     | host-spirv-llvm-translator-... | NOK | http://autobuild.buildroot.net/results/81bd0304cd9d3756d092e34995dc76593514aaa3 | ORPH
   x86_64    |         ipmiutil-3.1.8         | NOK | http://autobuild.buildroot.net/results/8e6279e4a8f1bd6dbcec92c7660137f9e1a08be8 |     
   mipsel    |         iptables-1.8.8         | NOK | http://autobuild.buildroot.net/results/460bf73a6324fbecd1d1cf72653e4b274bac1365 | ORPH
   mips64    |         iptables-1.8.8         | NOK | http://autobuild.buildroot.net/results/46694d174b1f8a06ba1c50bf51fa303fdac63a5f | ORPH
powerpc64le  |         iptables-1.8.8         | NOK | http://autobuild.buildroot.net/results/ca6e8186a10d31e92343f494a3cfe9d17fc1d344 | ORPH
  mips64el   |         iptables-1.8.8         | NOK | http://autobuild.buildroot.net/results/58022979ec0326d493acd6b22a82279c338bcb15 | ORPH
    arm      |         iptables-1.8.8         | NOK | http://autobuild.buildroot.net/results/1592350aaab760006907e6b92381d9f777b2660a | ORPH
  mips64el   |         iptables-1.8.8         | NOK | http://autobuild.buildroot.net/results/b7946611f7e53b4ba22ee54526d1730362c04f00 | ORPH
   sh4aeb    |         iptables-1.8.8         | NOK | http://autobuild.buildroot.net/results/004569ba9ce45db9ced1a10b2bf70dbc41f0ee4a | ORPH
    mips     |         iptables-1.8.8         | NOK | http://autobuild.buildroot.net/results/9b14c415cc4dbb7b2283425297c64559f243d37f | ORPH
    i686     |         iptables-1.8.8         | NOK | http://autobuild.buildroot.net/results/2d63fd8c8c923476d45a2fbe03f80de7b5f124cb | ORPH
    arm      |         iptables-1.8.8         | NOK | http://autobuild.buildroot.net/results/17aecfb19554734e6a722dd7abfa25e5a66b5468 | ORPH
    arm      |         iptables-1.8.8         | NOK | http://autobuild.buildroot.net/results/fcac49a0935086dfa9718b1ae5d04428f6cc17f8 | ORPH
    i686     |         iptables-1.8.8         | NOK | http://autobuild.buildroot.net/results/6e1436f3409517a4e660a34efe4b13aaa1debf5c | ORPH
   mipsel    |         iptables-1.8.8         | NOK | http://autobuild.buildroot.net/results/e0e08b873d27c0b9a1042f0be02a6b5fe8fae771 | ORPH
   x86_64    |         iptables-1.8.8         | NOK | http://autobuild.buildroot.net/results/6ba6f9de6fbfdfa2bec369d578456399f38c6f3d | ORPH
   sh4eb     |         iptables-1.8.8         | NOK | http://autobuild.buildroot.net/results/994ca8c048f971f17cf55184cd4e18f927bab5fd | ORPH
powerpc64le  |        jpeg-turbo-2.1.3        | NOK | http://autobuild.buildroot.net/results/7e080bcac6787f04b011fcbbf24b382da8cbe733 |     
   s390x     |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/4a6957b4219668d084edb5df0282158d94cd3de9 |     
   xtensa    |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/413e1fdbe3e81532e9c19d5b4018bdb027e8f651 |     
  riscv64    |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/7f0a1823271be50ed02b2408f89c7b15ce6be013 |     
   s390x     |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/b458d608279fbcad22937423d787b78ff50dfa63 |     
  aarch64    |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/7145006fafe230c762a64651bcb3535db4a973f5 |     
  aarch64    |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/8b06181dbec762af5109df98e7af76d7809ef1e5 |     
    arm      |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/b6d19ddb5faf441839022c7b7a9b04e83a6ae170 |     
    i586     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/7181bbc4eb41eb9991fdcd354b4c501797f729f9 | ORPH
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/c4d5eca25a7352dc94d7008fe2fdb240643f51b3 | ORPH
    arc      |        libglib2-2.70.4         | NOK | http://autobuild.buildroot.net/results/219b1740a6c589a0250727643f7bd8e33bcdea1c |     
   arceb     |        libglib2-2.70.4         | NOK | http://autobuild.buildroot.net/results/1b73fe15d1c8d2ef73f34f6d11ecdfbb27f4ee1f |     
  aarch64    |       libgpg-error-1.42        | NOK | http://autobuild.buildroot.net/results/df4ecda19af811b8496edca32e68dee826b60eb6 | ORPH
  aarch64    |       libgpg-error-1.42        | NOK | http://autobuild.buildroot.net/results/b128f7c6a87d98d7f81e6f0537c1a1cb9657a641 | ORPH
   xtensa    |      libmicrohttpd-0.9.75      | NOK | http://autobuild.buildroot.net/results/6976483d95154737d756cf5673fdc2ee2758020b |     
    or1k     |          libnss-3.79           | NOK | http://autobuild.buildroot.net/results/f3cbc6f08a2d0d731e285c2cf8fb23e81a62f420 |     
   arceb     |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/7223c54048c80f9c2ba93e2e82d5e85da3a26321 |     
   xtensa    |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/567b922bceb1638210b24aa7b874b5f8c3cc522b |     
   sparc     |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/cea02c3a48ad555bdf1acc9bc19fc939ad5b5c2f |     
   xtensa    |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/9f03708db14ed4eae4e45bd25a8a2eeb7aeaeba9 |     
 aarch64_be  |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/08824c2b9e38562d1b6dbb08ad8f34516d2029ae |     
    arc      |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/95d20919f18feb5b0679bad2ab5cc7d62d45f7de |     
    or1k     |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/c95863de0d02d730fab6e89983117e84ea9a39ee |     
   sparc     |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/c2cf2508dcb70f7bc7106b356f1012ac628ad373 |     
    m68k     |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/086524853f3c62ed898c0d0c92cf5bf88a358364 |     
microblazeel |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/ebfa210aa9d9a1e1f8e44d27fec5cd880c35ce3b |     
   arceb     |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/97d5a6991136d510e95a0dfb0d9d7300822b6ae5 |     
 microblaze  |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/4dcd1de18feb27dc509142c08054853c6b3a009d |     
    arc      |         libressl-3.5.3         | NOK | http://autobuild.buildroot.net/results/3a02922cda23d08b58c363f6f4a4c18289d31158 | ORPH
    arc      |         libressl-3.5.3         | NOK | http://autobuild.buildroot.net/results/ef8be294cd0d2a3b9d257833adebdd7a352cfbb3 | ORPH
    arc      |         libressl-3.5.3         | NOK | http://autobuild.buildroot.net/results/de24adf7fc15ec40cb01dbff00b8a4dcd2eb80ff | ORPH
    arc      |         libressl-3.5.3         | NOK | http://autobuild.buildroot.net/results/d8f310211274302d95c40854074f7373ba09ad02 | ORPH
   armeb     |      libsamplerate-0.1.9       | NOK | http://autobuild.buildroot.net/results/9882b7cafc5fde636386ee6d4a104e89f97b6d9d | ORPH
   mipsel    |      libsamplerate-0.1.9       | NOK | http://autobuild.buildroot.net/results/6c8697935533704d3ddb7c3bb9a6833e3572cbb7 | ORPH
 aarch64_be  |  libtorrent-rasterbar-1.2.15   | NOK | http://autobuild.buildroot.net/results/506caba98ca24bb0aafbe64a7a297f28ab2565f6 |     
  powerpc    |        libvorbis-1.3.7         | NOK | http://autobuild.buildroot.net/results/fb7f41d859583f742ebd8765df59db0f9a1b9afb |     
 microblaze  |    linux-5.10.109-cip5-rt4     | NOK | http://autobuild.buildroot.net/results/cdc6694d8cc342a55b1fedebc955d6f2beef4fcf | ORPH
   arceb     |         linux-5.17.13          | NOK | http://autobuild.buildroot.net/results/2722afce53393a64969deb66e7f3a26a0704f461 | ORPH
   nios2     |         linux-5.17.13          | NOK | http://autobuild.buildroot.net/results/a87a07b1939ee57cf85316dfbe66d0948f75acfb | ORPH
microblazeel |         linux-5.17.13          | NOK | http://autobuild.buildroot.net/results/ed94560bb1645d4343078c5abfb14c16cfd5479d | ORPH
   xtensa    |         linux-5.17.13          | NOK | http://autobuild.buildroot.net/results/7bf0182cd46230b99a67ad0d6e1166a8004c01b2 | ORPH
  powerpc    |         linux-5.17.13          | NOK | http://autobuild.buildroot.net/results/333954fdae267dfbef8c790be8c15ab6f75a02b4 | ORPH
powerpc64le  |         linux-5.17.13          | NOK | http://autobuild.buildroot.net/results/942a0d200552b165647cff05cc8a36f7a863f6fe | ORPH
   arceb     |         linux-5.17.13          | NOK | http://autobuild.buildroot.net/results/5e80ee72536ecca110c625e13b688af5db20dcf3 | ORPH
    arm      |        liquid-dsp-1.4.0        | NOK | http://autobuild.buildroot.net/results/5f3a3ef05f4dfcb50ad354a89fa125ca463be1eb |     
    arm      |        liquid-dsp-1.4.0        | NOK | http://autobuild.buildroot.net/results/fd34ad95e248a250245912ce9bad19652274bc25 |     
   armeb     | make: *** Waiting for unfin... | NOK | http://autobuild.buildroot.net/results/812939e1d55762118316975b0b3127df644bb04e |     
   sh4eb     |         minimodem-0.24         | NOK | http://autobuild.buildroot.net/results/bf66b19cacd6394957f534035af647ddd8037d60 |     
    arc      |          ncurses-6.1           | NOK | http://autobuild.buildroot.net/results/8c606f96ef37998d208c51edfa53cbfd5bc72327 | ORPH
   armeb     |       netsniff-ng-0.6.8        | NOK | http://autobuild.buildroot.net/results/377076868015c0b3d3692968e72ca7f498f4f329 |     
microblazeel |          netsurf-3.10          | NOK | http://autobuild.buildroot.net/results/57a990178c32536317107b4db358cb6d3fe56779 |     
   x86_64    |         nodejs-16.15.0         | NOK | http://autobuild.buildroot.net/results/ecfc038236b530aa0524ac64260ee0277528fd0c |     
 aarch64_be  |           nvme-1.12            | NOK | http://autobuild.buildroot.net/results/c5224e97d4b671d3eefabd5084f3b4643dcbb440 | ORPH
   armeb     |           opus-1.3.1           | NOK | http://autobuild.buildroot.net/results/75c2519c0083a3ddde060cf425ec49689f4dce12 | ORPH
   sparc     |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/d7b3c8bdcbc79917d8d5eafa8c36b67466757969 |     
    arc      |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/1197c3beb37ac9bbc14f1bfc1e73275dd7fa3253 |     
microblazeel |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/cabd2c8bedee011b67a016f100f97415cee9c07b |     
   armeb     |           php-8.1.7            | NOK | http://autobuild.buildroot.net/results/d9d368791cdfe27289b94e06241df3474072e87e |     
powerpc64le  |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/7d31a3603e86b97c1c3817a48f33b92656ec4de5 |     
powerpc64le  |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/31b860310a9faf6654ad8bd9c41c4ba9800550a3 |     
powerpc64le  |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/3d4b5a247ceaf0307c8ea45e83308738d41829f0 |     
powerpc64le  |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/0c100cf0706c9717de7e0e8b9fc654686f86fb5a |     
powerpc64le  |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/2e71d9318c1a0debfd040dfd45cde5dd31ba21aa |     
  riscv32    |            poke-2.1            | NOK | http://autobuild.buildroot.net/results/0a0070e0290947872e4f3874879cafc99e7321f5 | ORPH
    arc      |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/fa56e1e978112e201f835e7313fdbafb8660789b |     
microblazeel |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/b6595c2be14ae7f6b9388b509c108bc2fa287db1 |     
    arc      |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/fb20f1328125254fe207c7242c44f7a3b03c7d44 |     
  sparc64    |      python-orjson-3.6.7       | NOK | http://autobuild.buildroot.net/results/579e1a51e2d802e0ded2f08e224b4cce8aa9bfc8 |     
    sh4      |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/499f68171aa8c7d5f93912e34fdfa8b062b59149 |     
microblazeel |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/ef517a52ec6f2f66d293b0634097d6f82fa3d32f |     
microblazeel |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/9924c0acf73e161ff7c6083e7a9399a6151414af |     
  sparc64    |           refpolicy            | NOK | http://autobuild.buildroot.net/results/9c6d83e01965a6543dc8ef22a64902f0512f54ea |     
 powerpc64   |           refpolicy            | NOK | http://autobuild.buildroot.net/results/4d0f1129e710f0465c6e15adb65876ff777ad721 |     
    mips     |           refpolicy            | NOK | http://autobuild.buildroot.net/results/25c4ec27919e149c4b0f2968fedc6b6e4a5587a9 |     
  riscv32    |           refpolicy            | NOK | http://autobuild.buildroot.net/results/82f25f206d241dc203b5cc4d66d9622f6f58c91b |     
    m68k     |         sg3_utils-1.47         | NOK | http://autobuild.buildroot.net/results/b352a178738b73f94adbc168cd2119e99ba1f230 |     
   mips64    |    shadowsocks-libev-3.3.5     | NOK | http://autobuild.buildroot.net/results/e967857f7d293fe571ac4a5f34c54d29f63fb274 |     
  sparc64    |          snort-2.9.19          | NOK | http://autobuild.buildroot.net/results/0414c57fd92672631565225cde98c74e3274f980 |     
    or1k     | sox-7524160b29a476f7e87bc14... | NOK | http://autobuild.buildroot.net/results/cd69690feff25a4b14ee3c67dc963462deee5b6a | ORPH
    arc      |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/c031fbb6d1dc588cc4567472cda5c684f88900d9 | ORPH
 powerpc64   |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/fbf04c1354de1ea592380397ca68a3a12a35fcbc | ORPH
   mips64    |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/9c0381925a32827959f75785c649cf11a3cf010e | ORPH
 microblaze  |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/570295836f9bb77317fc5730bbcaec6bb730981a | ORPH
    i686     |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/04391a2e0dbfb4ea1ddae7677909eb53eb14f6d8 | ORPH
 powerpc64   |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/d1e57b4dbf645c2f8f42fa5295eec4742453f3a2 | ORPH
 microblaze  |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/21df18a762fedb474af295f3014e31696ca4ef1d | ORPH
 microblaze  |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/15c2760300624b225a8e20aee9b512a549569c6a | ORPH
  powerpc    |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/2b4a7b8a6501e6cde84c045b991e267d404a0592 | ORPH
    mips     |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/2f6efa34d7cb47449716b0e0d7a3ea0c24b3479c | ORPH
  aarch64    |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/8c8c43db7a97f5e2d876abc055226a6513aad55a | ORPH
microblazeel |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/2080ee6c0c4deb738ba6211e7e3995f6540b1387 | ORPH
 microblaze  |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/ee54335ab553c4f1cae092dd5e7b6586b9a50473 | ORPH
powerpc64le  |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/fe761540051ee0fea71c8d7e2ec9d35e0c380a26 | ORPH
   mips64    |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/cb73184981b27520c93ce77482d9885337efaf78 | ORPH
   arceb     |        strongswan-5.9.5        | NOK | http://autobuild.buildroot.net/results/028c267a3254ee50e105fb99ef2b5c7db9357b67 |     
    i686     |        swupdate-2022.05        | NOK | http://autobuild.buildroot.net/results/e69de3c7a24dcc3941cf9e3316da8386164c2200 |     
   arceb     |        swupdate-2022.05        | NOK | http://autobuild.buildroot.net/results/37335a7943be12af318244e5fbfc5997f0312c8d |     
microblazeel |        swupdate-2022.05        | NOK | http://autobuild.buildroot.net/results/5f6b5851890d5d0d4add598ba1e3c75768533bc6 |     
    mips     | toolchain-external-codescap... | NOK | http://autobuild.buildroot.net/results/ff7a8e5bf27b0b3747ba5a9776b31ce2acc4243b | ORPH
   sparc     |          tor-0.4.7.8           | NOK | http://autobuild.buildroot.net/results/69171c6d1244cef29b8a0e34a2e0b9184d87ec14 |     
  powerpc    |          tor-0.4.7.8           | NOK | http://autobuild.buildroot.net/results/2d9a4486328583fa2fd67be194e05a911f72e3ce |     
    arc      |          tor-0.4.7.8           | NOK | http://autobuild.buildroot.net/results/e74a44433c1c01da616411d63f5cfd3f11ae12ec |     
  sparc64    |          uacme-1.7.1           | NOK | http://autobuild.buildroot.net/results/584b38db83087a2773bcd7cf04e3ecc61e234d97 |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/1d72ea94962e8cde0db7bb5ce12a7fafd2953354 |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/a74cfea5413a98d247174bb48e4272f8d27cb978 |     
  powerpc    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/e131761de506997bfb141af322326705b99a3805 |     
    arm      |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/5164e7e902f4715b29eb2c6a5e1a809bc8bc4368 |     
  powerpc    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/a01ae55672e6f26816ca6c730eda8f87fd83d89b |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/84a271ceaa46e95c7e97976f81926c00ec4e5f2c |     
   armeb     |            unknown             | NOK | http://autobuild.buildroot.net/results/bcff6cd61216d37f8583c10d711c9e1d19312b91 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/d04d06bc718a91debc3bfcaff27537900fd04274 |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/4a751f02ae5302d2b9db0b898422607b49042227 |     
 microblaze  |            unknown             | NOK | http://autobuild.buildroot.net/results/85559ef580588fa4ba9bc4a0346337777b8ddc13 |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/8f28ceb4e9e64d807daeface96ac582f2b3fa814 |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/7850b1a7a9f5bf1d16b5822fd274f064592e603e |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/4a413c6d27f194dc455460d825423e39f02a5a6f |     
 aarch64_be  |            unknown             | NOK | http://autobuild.buildroot.net/results/b8bce15211d7137562be5647bf96dacc591c4a30 |     
 microblaze  |            unknown             | NOK | http://autobuild.buildroot.net/results/b8e1942615ce1a9f00b2461dcce45d34b6fa0924 |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/ca988f2ac5aabc6484edbe7255d8aea1a21e9616 |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/974d4523e5029d4b0c1313050c42295f4af6ea1c |     
    arm      |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/acfffa78d5168425e70881728f1974b42b5a70db |     
  mips64el   |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/5c0727af7df0f3cbbf300f1fe4eb805e21e60bc2 |     
    m68k     |          whois-5.5.11          | NOK | http://autobuild.buildroot.net/results/6b6cf932dc7191b467d22324bf77f4e8987f4a63 |     
   s390x     |      wpa_supplicant-2.10       | NOK | http://autobuild.buildroot.net/results/b507e05439ce39c09d3b141c6411e142ccc44fc3 |     
   sh4eb     |            xenomai             | NOK | http://autobuild.buildroot.net/results/b1fd3c3a33cf24303ebacab1c6e60ae3079d2b15 |     
 powerpc64   |         xenomai-custom         | NOK | http://autobuild.buildroot.net/results/99758bbca6278bc484544a5a1338f215242c31dd |     
   mipsel    |        xfsprogs-5.14.2         | NOK | http://autobuild.buildroot.net/results/ba3b072ff1ed115b6479a5f82f879433fbd7d534 | ORPH
    or1k     |          zabbix-5.4.9          | NOK | http://autobuild.buildroot.net/results/8ce099ed55ef244d07bf719fc3bc9fadf5949df7 |     
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/4338b8d76d4fb4973d8de37b616d0fc120916c90 | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/8cab47905d93b8eb6bbce14485e6da79373a2f6c | ORPH
  aarch64    |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/db30e1b12c087d51786f5d8851c9c5dd1293a300 | ORPH
microblazeel |           zstd-1.5.2           | NOK | http://autobuild.buildroot.net/results/203827c9ab4f228ce497388e652c4c43f0a87cf5 |     


Classification of failures by reason for 2022.02.x
--------------------------------------------------

                       frr-8.1 | 1 
kvm-unit-tests-kvm-unit-tes... | 1 
           libfreeimage-3.18.0 | 1 
                    vlc-3.0.16 | 1 
                  xvisor-0.3.1 | 1 


Detail of failures for 2022.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/9fb64777c60f788c2b7208b020416110240a5754 |     
powerpc64le  | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/90931497efcc1c8089d0fb35d7a70e3b78ad7cbb |     
  aarch64    |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/e0ee3ac29c0de539a96962d4b6a63e54d10430a7 |     
   xtensa    |           vlc-3.0.16           | NOK | http://autobuild.buildroot.net/results/c27dcc935894073666cf05b3cd0bf57b79d40681 |     
  riscv32    |          xvisor-0.3.1          | NOK | http://autobuild.buildroot.net/results/62f717267db1d99c53639d71c4701a1f3857162c |     


Classification of failures by reason for 2022.05.x
--------------------------------------------------

host-pahole-73383b3a39afe86... | 2 
                 pixman-0.40.0 | 2 
                 uclibc-1.0.41 | 2 
/home/buildroot/autobuild/i... | 1 
                     ace-7.0.6 | 1 
                 dash-0.5.11.5 | 1 
                 freerdp-2.7.0 | 1 
                     frr-8.2.2 | 1 
glibc-2.35-96-g2c4fc8e5ca74... | 1 
          host-gcc-final-9.4.0 | 1 
host-google-breakpad-c85eb4... | 1 
                  jack2-1.9.20 | 1 
           libfreeimage-3.18.0 | 1 
                   libnss-3.78 | 1 
             libopenssl-1.1.1o | 1 
                libzlib-1.2.12 | 1 
       linux-5.10.109-cip5-rt4 | 1 
                   linux-tools | 1 
            luaossl-20200709-0 | 1 
                  mender-3.1.0 | 1 
                 mesa3d-21.3.8 | 1 
                mongodb-4.2.18 | 1 
   openvmtools-10.3.5-10430147 | 1 
              swupdate-2022.05 | 1 
                       unknown | 1 


Detail of failures for 2022.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mipsel    | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/70618ed13c89e78ef0abe295f9cae0b3a037dc92 |     
microblazeel |           ace-7.0.6            | NOK | http://autobuild.buildroot.net/results/3302e7b1e2491f22067ef7f0f87da276542cc149 |     
powerpc64le  |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/a4d6492578734840ecc178326c7999b0f7daafc5 | ORPH
   mips64    |         freerdp-2.7.0          | NOK | http://autobuild.buildroot.net/results/c04204eab94b58303ad6fe6dc29d6bff41fb4547 |     
  mips64el   |           frr-8.2.2            | NOK | http://autobuild.buildroot.net/results/a4a919cbb45e255bb6ba71bc7f05e56f2bb5f771 |     
   nios2     | glibc-2.35-96-g2c4fc8e5ca74... | NOK | http://autobuild.buildroot.net/results/008aecc3d26ccb8d2926d023e68c89e16b297e01 |     
   x86_64    |      host-gcc-final-9.4.0      | NOK | http://autobuild.buildroot.net/results/31a5ac53fbb96c98a148312501e82d2dcf0e0851 |     
    mips     | host-google-breakpad-c85eb4... | NOK | http://autobuild.buildroot.net/results/4e453dd5168e2f919bcb2a11bad1832e839526d2 |     
   s390x     | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/703e7cb45fcd7bed422ed7768254417991096e1e |     
    arm      | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/90f89e3e6f30088ef86252c53d037eb88f9f11b6 |     
    m68k     |          jack2-1.9.20          | NOK | http://autobuild.buildroot.net/results/a72b47f9aa0128189aa1e05beb1772e912f98139 |     
   mipsel    |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/1093675eb5251bd000d95eacd2b6fe7ae487a6b5 |     
    or1k     |          libnss-3.78           | NOK | http://autobuild.buildroot.net/results/526c789a51c4a9f0fc4b1168efc8c0539209ec8e |     
    arc      |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/43f3db86505b026082b437ed16dc63fb394631b1 |     
    m68k     |         libzlib-1.2.12         | NOK | http://autobuild.buildroot.net/results/0778308934527df946a3e99b39907122adedbf84 | ORPH
 microblaze  |    linux-5.10.109-cip5-rt4     | NOK | http://autobuild.buildroot.net/results/357a84997d9bd0833a58f5c27edf68978b7c44d2 | ORPH
    mips     |          linux-tools           | NOK | http://autobuild.buildroot.net/results/2517adaa7f1880d71dc619ed92bbc98b96b08b73 | ORPH
   mipsel    |       luaossl-20200709-0       | NOK | http://autobuild.buildroot.net/results/630f9570afe8829baf2eef1ef32c83f1f75bddfb |     
   x86_64    |          mender-3.1.0          | NOK | http://autobuild.buildroot.net/results/f3c388b58d864c283f718a4ec08e8982b04377d7 |     
    arm      |         mesa3d-21.3.8          | NOK | http://autobuild.buildroot.net/results/885ba71ff1cc2447c27a840e5295dd8014ceaf90 |     
  aarch64    |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/136f9429abf3953cfb012b75ca038c3ba7a5916a |     
   x86_64    |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/d854d6f139a4d4705e96e532c6847bb93d05260b |     
powerpc64le  |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/88df291e213607d148fe99e7cc69fe9a112740b9 |     
powerpc64le  |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/cf4909f4f58eb88ea4d68a2c7330f98a055b42c5 |     
    i686     |        swupdate-2022.05        | NOK | http://autobuild.buildroot.net/results/2e2ea860a67423231cc0f3b073603bf87d223f3a |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/b1e15bdf17eb94327dba6b1d940c45f26246678a |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/8ccc84443a5a99d0807f5ce17562dfd095f14790 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/6a98052b2692404327b3487db1f7a6ef21524e4e |     



-- 
http://autobuild.buildroot.net

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

