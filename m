Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4C68C433EF
	for <buildroot@archiver.kernel.org>; Sun, 19 Jun 2022 05:33:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 31B4A60DED;
	Sun, 19 Jun 2022 05:33:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 31B4A60DED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O5bC66xvUn9I; Sun, 19 Jun 2022 05:33:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1913860BAA;
	Sun, 19 Jun 2022 05:33:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1913860BAA
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3AF1D1BF46A
 for <buildroot@lists.busybox.net>; Sun, 19 Jun 2022 05:33:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C5EDC60BAA
 for <buildroot@lists.busybox.net>; Sun, 19 Jun 2022 05:33:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C5EDC60BAA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6MvTIJOdvM7m for <buildroot@lists.busybox.net>;
 Sun, 19 Jun 2022 05:33:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C5DAA607B5
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C5DAA607B5
 for <buildroot@buildroot.org>; Sun, 19 Jun 2022 05:33:22 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 58C1C60008
 for <buildroot@buildroot.org>; Sun, 19 Jun 2022 05:33:19 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sun, 19 Jun 2022 05:33:19 -0000
Message-Id: <20220619053325.C5EDC60BAA@smtp3.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1655616799; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=QB4qLBn38jzVSCj+IgYdsFXC2TcYqG3p/uvo1lmha9I=;
 b=Bm+ezHYuwmPw00u7DUzpuaFqICMHK3oCsW/plgMdcso7tBPQchLcDen/1I1BoNCaP/kd9m
 PMTBiJL8ou2fflF6kwgd3TZMNtlKhjRQAhLtI4meAaZsiTMf9jxn/NzQzCDKRy1yjPWGm+
 H+FTuAYYb/SGwfgWTSaF08HjmrdtI/JMo9Z7DBQwYCD5bpur8esJM51YuHJc734Eo4QRyh
 H2SBczNPT7Hv3Cc8zXStKqaRK+5g1TV4Q/LvJs/RY/Kw3KK39tqL7ysLaSjJAi1u9coB03
 TH6Ho6e0zT+TKNwyu2cSQCEHECV2WyG7zaHp634o8uGiE9wKWPMvS74jK0zrrg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Bm+ezHYu
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-06-18
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

Autobuild statistics for 2022-06-18
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  | 19  |  5  |  2  | 26  |
  2022.05.x  | 21  | 40  |  0  | 61  |
    master   | 175 | 168 |  0  | 343 |

Classification of failures by reason for master
-----------------------------------------------

              alsa-utils-1.2.7 | 18
                 uclibc-1.0.41 | 13
             libopenssl-1.1.1o | 11
host-pahole-73383b3a39afe86... | 8 
                iptables-1.8.8 | 7 
                       unknown | 7 
                 zlib-ng-2.0.6 | 7 
                 linux-5.17.13 | 6 
                   perl-5.34.1 | 5 
                 pixman-0.40.0 | 5 
           libfreeimage-3.18.0 | 4 
                libressl-3.5.3 | 4 
              host-rust-1.60.0 | 3 
               protobuf-3.20.1 | 3 
                xenomai-custom | 3 
                alsa-lib-1.2.7 | 2 
                arp-scan-1.9.7 | 2 
                busybox-1.35.0 | 2 
glibc-2.35-96-g2c4fc8e5ca74... | 2 
  gobject-introspection-1.70.0 | 2 
                host-go-1.18.3 | 2 
host-google-breakpad-c85eb4... | 2 
              jpeg-turbo-2.1.3 | 2 
            ocf-linux-20120127 | 2 
             18xx-ti-utils-8.8 | 1 
                  bitwise-0.43 | 1 
                      bmon-4.0 | 1 
              containerd-1.6.2 | 1 
                 dash-0.5.11.5 | 1 
                  dhcpdump-1.8 | 1 
                 dmalloc-5.6.5 | 1 
                     frr-8.2.2 | 1 
google-breakpad-c85eb4a59b6... | 1 
gummiboot-2bcd919c681c952eb... | 1 
         host-gcc-final-11.3.0 | 1 
          host-gcc-final-9.4.0 | 1 
host-gdb-arc-2020.09-releas... | 1 
               libcap-ng-0.8.3 | 1 
               libdcadec-0.2.0 | 1 
libeastl-45469730d641868ce0... | 1 
                    libev-4.33 | 1 
             libgpg-error-1.42 | 1 
                libmad-0.15.1b | 1 
              libsodium-1.0.18 | 1 
             libstrophe-0.12.0 | 1 
              libuhttpd-3.14.1 | 1 
               libvorbis-1.3.7 | 1 
           linux-5.10.115-cip7 | 1 
make: *** wait: No child pr... | 1 
                  mender-3.1.0 | 1 
                mongodb-4.2.18 | 1 
                    mpv-0.33.1 | 1 
                  mxs-bootlets | 1 
             netsniff-ng-0.6.8 | 1 
                nodejs-16.15.0 | 1 
              open62541-v1.2.4 | 1 
                     php-8.1.7 | 1 
                    pimd-2.3.2 | 1 
                      poke-2.1 | 1 
                    pppd-2.4.9 | 1 
           python-numpy-1.21.2 | 1 
                     refpolicy | 1 
rtl8723bs-11ab92d8ccd71c80f... | 1 
       shadowsocks-libev-3.3.5 | 1 
              swupdate-2022.05 | 1 
                 systemd-250.4 | 1 
                  vlc-3.0.17.4 | 1 
x264-35417dcd65a57321fbadf9... | 1 
                       xenomai | 1 
                  zabbix-5.4.9 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |       18xx-ti-utils-8.8        | NOK | http://autobuild.buildroot.net/results/d1d37765d5730df3525780e45613ccecacc9d169 |     
    m68k     |         alsa-lib-1.2.7         | NOK | http://autobuild.buildroot.net/results/1a3317e0075c5857adcaa5f212732448cb0c3f43 |     
    m68k     |         alsa-lib-1.2.7         | NOK | http://autobuild.buildroot.net/results/ef58586107a273bb43852763f272207ee8d53e8f |     
 microblaze  |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/99e5d0203fc6758a6a70a2cecbfd008c569c8607 |     
microblazeel |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/93681dfe4b2d517203d04e7689a1967b078211c6 |     
    or1k     |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/0b98839d0e60c27e2f39dad0c3dab5b0565d713d |     
    or1k     |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/b1ba02d8e8898367e698bd95f79b74c5dc319c06 |     
   s390x     |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/345f90cbbe9e9a201858dd05e26d64cb46065671 |     
    i686     |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/023199f6e5c7be912c5702665aa234be98a974d6 |     
powerpc64le  |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/f0b7d42e1ec5b89091ecde05f465d0c5a5ad1ed9 |     
  riscv64    |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/a83f3b8ef912941fa227c19a975ca78e263381ff |     
microblazeel |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/cbc184798a01a038180c3e65e713d828f87256a2 |     
   xtensa    |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/d50c51394dc8a556fd14f7d5a609ca12e003ac46 |     
  aarch64    |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/a1572f7ab14b56d45b284bc1df73c9035372e708 |     
   mips64    |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/de1a79b4d85ff6a7faae9d221580d9a31c50cb31 |     
   mipsel    |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/c64e83876419aee551d37c04f9ba94e49e771444 |     
   mips64    |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/4c9d47c49df89368ee5681ab8b1ded2a80d23755 |     
   sh4eb     |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/b6f9a1d6733d75a9b5779a7601a81927ecae1965 |     
   sparc     |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/e79b21ad8929331cf0b8c3da5dae53d633e74d35 |     
   x86_64    |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/37412700a72b6ddf166f1eeaf02ab0559df8db6c |     
   arceb     |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/fa1ba4ff327e853e024c5b0181fead2e61665345 |     
    m68k     |         arp-scan-1.9.7         | NOK | http://autobuild.buildroot.net/results/1407697dc91b5002f7a148c42fa9f06be790c09e |     
    m68k     |         arp-scan-1.9.7         | NOK | http://autobuild.buildroot.net/results/86a43ee6b8fdac4d4308c0ffd0abdf365f8cb34f |     
    m68k     |          bitwise-0.43          | NOK | http://autobuild.buildroot.net/results/e8ecd9e297cf68587770f04aa430714d0466497c |     
    m68k     |            bmon-4.0            | NOK | http://autobuild.buildroot.net/results/eafc641f717413eda736cf24181eab1f8ed02b17 | ORPH
  riscv64    |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/10e3b7cd4c2f375bbd412555848bde0b58711763 | ORPH
  riscv64    |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/ec5c6532f23f5722ec556b5adc51061cc04e3ad4 | ORPH
   x86_64    |        containerd-1.6.2        | NOK | http://autobuild.buildroot.net/results/fe24084048d3b926d642a9d8da52dcef15fc89be |     
   x86_64    |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/f7090b38270d9eec21963a065e0f457482482ea0 | ORPH
    m68k     |          dhcpdump-1.8          | NOK | http://autobuild.buildroot.net/results/a347363cbc611080d2a0f7f4882802d15f587250 | ORPH
    i686     |         dmalloc-5.6.5          | NOK | http://autobuild.buildroot.net/results/95325a241334e75c6e6beab3e38b07ced5269340 | ORPH
   xtensa    |           frr-8.2.2            | NOK | http://autobuild.buildroot.net/results/0431a203e49cc82373d95a211cd35b4810bc1d46 |     
  riscv32    | glibc-2.35-96-g2c4fc8e5ca74... | NOK | http://autobuild.buildroot.net/results/21845942092f9455ba90169cd1cacb11bc16f095 |     
   sh4aeb    | glibc-2.35-96-g2c4fc8e5ca74... | NOK | http://autobuild.buildroot.net/results/9d6a8a30bf19e37159d14dd204773fef3bff610e |     
   nios2     |  gobject-introspection-1.70.0  | NOK | http://autobuild.buildroot.net/results/3f8c6accdfa9012953c238875daed233b717123d | ORPH
   nios2     |  gobject-introspection-1.70.0  | NOK | http://autobuild.buildroot.net/results/a72ad0e5d4b4c8e1e69ab0c0ea9be6339dee3886 | ORPH
   mipsel    | google-breakpad-c85eb4a59b6... | NOK | http://autobuild.buildroot.net/results/f8b961f99125ff5ae29f4054c8bb2f6037ba7129 |     
   x86_64    | gummiboot-2bcd919c681c952eb... | NOK | http://autobuild.buildroot.net/results/074ed90c83cd9edb695dbc489c7bd4fb5c324eed |     
   x86_64    |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/a23c351c9653a5cb1c9421eb07315a4042bca411 |     
  powerpc    |      host-gcc-final-9.4.0      | NOK | http://autobuild.buildroot.net/results/f5fb01908b1c6f8a547e173bdf7f76ca7ad12424 |     
   arceb     | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/f68f79a2ebe89f795a7cef2d745dc45dc105feb5 | ORPH
   mips64    |         host-go-1.18.3         | NOK | http://autobuild.buildroot.net/results/3b66cab6c5121e3e7aec4f8b24b3bb37e3089811 |     
  aarch64    |         host-go-1.18.3         | NOK | http://autobuild.buildroot.net/results/37299c1073d19e50e0ebd3bebd3319e904dfbc1f |     
    arm      | host-google-breakpad-c85eb4... | NOK | http://autobuild.buildroot.net/results/fdb94e521e985f34d8c3a96cfee04193b638ba1f |     
    arm      | host-google-breakpad-c85eb4... | NOK | http://autobuild.buildroot.net/results/54d5f3d61145bc98d73852716a54d1aad7f60cdd |     
    or1k     | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/2bb876f6416712b9855e994e3b2d539be56742a4 |     
   mipsel    | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/197020f1cd22ed0a4f7ee819654ee5c23cb2d501 |     
   xtensa    | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/8c3668890adec212036b1e1a27f94ab1e3c7bd17 |     
   mipsel    | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/033189d4d66e0160d3b73a1f3a939b2934c35eda |     
  aarch64    | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/94d72053ddb0cb9c214bf2ac4ed98876faa963ac |     
  sparc64    | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/4e045dbb01034571735144e2e4f273523927408b |     
    or1k     | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/2a30cf044a41db0c88215feb39fb67210c529ab9 |     
  aarch64    | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/35a5b453c13eeac4bba53b7d0a783cc743d8bde1 |     
   mipsel    |        host-rust-1.60.0        | NOK | http://autobuild.buildroot.net/results/07f1a77ae7adf26fa2270eaf20a425286f7f349c |     
  powerpc    |        host-rust-1.60.0        | NOK | http://autobuild.buildroot.net/results/b2096fc89c2dfba0e8898d3ab8f766b51723c246 |     
   s390x     |        host-rust-1.60.0        | NOK | http://autobuild.buildroot.net/results/54feb10cf060848b657007df19ae638fe61e41f4 |     
  mips64el   |         iptables-1.8.8         | NOK | http://autobuild.buildroot.net/results/51e09614be76b37cf42ba91eebbe0efb3f2272de | ORPH
 microblaze  |         iptables-1.8.8         | NOK | http://autobuild.buildroot.net/results/35444de3d6cb0c300d2919fdc985102afa5ce626 | ORPH
  riscv64    |         iptables-1.8.8         | NOK | http://autobuild.buildroot.net/results/5e3f6d18f46cc7f03bd79d30c3b50f862c4eb270 | ORPH
    or1k     |         iptables-1.8.8         | NOK | http://autobuild.buildroot.net/results/40729ab50adbb34b75067f5e61456f1edad8f3ff | ORPH
   mipsel    |         iptables-1.8.8         | NOK | http://autobuild.buildroot.net/results/2174ae64ebed87f61e137ef2cbf898667bd1d381 | ORPH
    i586     |         iptables-1.8.8         | NOK | http://autobuild.buildroot.net/results/4cae67333c6dfee7036ac567695be2563c60f27e | ORPH
   mipsel    |         iptables-1.8.8         | NOK | http://autobuild.buildroot.net/results/66cf3e6245a7884cf99e4185fc4cb128c0519124 | ORPH
    or1k     |        jpeg-turbo-2.1.3        | NOK | http://autobuild.buildroot.net/results/08f2a791460c1b16fdb59310fb427cd38ca5bffc |     
powerpc64le  |        jpeg-turbo-2.1.3        | NOK | http://autobuild.buildroot.net/results/0fe1d505c5ec32ec01fa807ba3434accad6dcd19 |     
  riscv64    |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/d32ee5ecc5f4be2cadb4e517b6de75ddc9fccb08 |     
    arm      |        libdcadec-0.2.0         | NOK | http://autobuild.buildroot.net/results/3539c96009dab70dab912a0d7e5f82551ae6cd15 |     
  aarch64    | libeastl-45469730d641868ce0... | NOK | http://autobuild.buildroot.net/results/54ff018467d157530bde4d35602fd1820d9eb348 |     
   armeb     |           libev-4.33           | NOK | http://autobuild.buildroot.net/results/37ceea5844a347676d2fd02b1b819cbac080d26d | ORPH
   s390x     |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/229caadb4d383b68f115ff499b83700812923df2 |     
   nios2     |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/b4c8b32b0d79b613528bbaa4e6ec45c768ce3be8 |     
 powerpc64   |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/6ca70678b5efefb8ede496019837e91ce5cc68f9 |     
   x86_64    |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/c86d1e5037afd81cdc001465282ea01adc8cda62 |     
  aarch64    |       libgpg-error-1.42        | NOK | http://autobuild.buildroot.net/results/8a6fe40d6b0b4ec791b10d87d406d9ed40ecec8f | ORPH
    arm      |         libmad-0.15.1b         | NOK | http://autobuild.buildroot.net/results/7d2ecf227c4baa14f7b361883a1c7a956eae9ee8 | ORPH
microblazeel |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/fdeba5f863d336dc35a36d83b4b66a545694bbf6 |     
microblazeel |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/99e8f37f2d2c7b048faaf7bd1397a5416f0f682d |     
    arc      |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/3fc8a46a3957f145391e1080e2a81ad52149929c |     
    m68k     |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/11a0b684460c8bbe481c55c4c9e0fe6985f18a9a |     
 aarch64_be  |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/e90a33624499c51d99f48cc547a853b56d3b0fd7 |     
    arc      |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/ca18d1559f9ac49c99da307f308a69e84d0dd8b9 |     
   xtensa    |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/a25f640f157a3f8ba12b7a2d175722140d466d55 |     
   sparc     |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/8dd1eaf33c90f6b76da85cf29888fb77c0ffa847 |     
    arc      |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/80c7c9eb55d0fc4be7687b1890c8090de9dcf3a5 |     
  aarch64    |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/44846cb1d7ab094f413f1c606b73243fb261f058 |     
    arc      |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/7f40b6158b145ad5c39feae1f20c5b9776751f9b |     
   mipsel    |         libressl-3.5.3         | NOK | http://autobuild.buildroot.net/results/35e262da7458d344c05d92d6410ee8f13a73572d | ORPH
    arc      |         libressl-3.5.3         | NOK | http://autobuild.buildroot.net/results/0aa2d79f15aa92adccdcd0a14441c7113550ac2d | ORPH
   arceb     |         libressl-3.5.3         | NOK | http://autobuild.buildroot.net/results/707ca24d689b3275024156c7b780e9e8490719e7 | ORPH
   mips64    |         libressl-3.5.3         | NOK | http://autobuild.buildroot.net/results/aeb6288707cf565da57036c2ccfcfeade9384332 | ORPH
   arceb     |        libsodium-1.0.18        | NOK | http://autobuild.buildroot.net/results/092a5c6a1f21d8f951d90bd1e3b880edbcd7773f |     
   sparc     |       libstrophe-0.12.0        | NOK | http://autobuild.buildroot.net/results/aa8128cd36ea996d3d4632020d83104f34b630d0 |     
  mips64el   |        libuhttpd-3.14.1        | NOK | http://autobuild.buildroot.net/results/53c1b80ccbe9d067008b8db873fa02ea51daf17d |     
  powerpc    |        libvorbis-1.3.7         | NOK | http://autobuild.buildroot.net/results/bd43895955e2303feb24133f1712fd035dad562c |     
   mipsel    |      linux-5.10.115-cip7       | NOK | http://autobuild.buildroot.net/results/114c8476ca73bc8408e164b25c5b21793b8b1016 | ORPH
   nios2     |         linux-5.17.13          | NOK | http://autobuild.buildroot.net/results/59e50611e1373b827611aac261a9a93ae06cefac | ORPH
   mipsel    |         linux-5.17.13          | NOK | http://autobuild.buildroot.net/results/a4ad77674fa440a3fd3e68173eeebb171505955e | ORPH
 powerpc64   |         linux-5.17.13          | NOK | http://autobuild.buildroot.net/results/b725c805a6ee8e71580ff5791e10988e915456f2 | ORPH
 microblaze  |         linux-5.17.13          | NOK | http://autobuild.buildroot.net/results/2afe6ab4373e0ff1449059b3a1797bab94eeac2b | ORPH
   xtensa    |         linux-5.17.13          | NOK | http://autobuild.buildroot.net/results/39d2eff7d636a476822ce7b3f7bc8b5520be7211 | ORPH
    mips     |         linux-5.17.13          | NOK | http://autobuild.buildroot.net/results/94f8df31137ed9dbf0bad495a436bc62290cc044 | ORPH
   armeb     | make: *** wait: No child pr... | NOK | http://autobuild.buildroot.net/results/190fd039d1aafb5e2f7b24d9e7c496eb8cfdd1aa |     
  aarch64    |          mender-3.1.0          | NOK | http://autobuild.buildroot.net/results/7609dcd02d46cd57778a261de78b61cf7119c94d |     
    arm      |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/6a85ad42925996988c486e35b684afe36fe31e53 |     
   mips64    |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/b476bcd965397245839bb845a5d6fe84e98b146b |     
    arm      |          mxs-bootlets          | NOK | http://autobuild.buildroot.net/results/b3020421a7bb78ba9c796bfad4905fb78ecf5307 |     
   mips64    |       netsniff-ng-0.6.8        | NOK | http://autobuild.buildroot.net/results/9a053097fc3962b6c72648fabe2f4b4e584ea57d |     
  aarch64    |         nodejs-16.15.0         | NOK | http://autobuild.buildroot.net/results/c8fc830ebd5ff5870a4cbaf2ef39e4524c967235 |     
   x86_64    |       ocf-linux-20120127       | NOK | http://autobuild.buildroot.net/results/5a334fc2d485bd025c68002a9f521524247cfb3c | ORPH
 microblaze  |       ocf-linux-20120127       | NOK | http://autobuild.buildroot.net/results/5c9408bdbc18236be346de92e51b2df94c402cdb | ORPH
   nios2     |        open62541-v1.2.4        | NOK | http://autobuild.buildroot.net/results/42a0739c5094ee9bc081b3224317b146624ff551 | ORPH
   mips64    |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/ec655c2cb6f33f41594ff12d9293c52c79c802e7 |     
   arceb     |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/372a7eadd544184e2f56d61076f9e46bd52766e9 |     
microblazeel |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/52b5a49c17231cae5fed00dc1294cc91b90b2b65 |     
    or1k     |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/7bfdd311a85c498684bef021a9fda212bb93189f |     
microblazeel |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/f73f729c732c4713a560e7e81809b6d798deb7b9 |     
   xtensa    |           php-8.1.7            | NOK | http://autobuild.buildroot.net/results/c7e2a89093ce1b6738297ee5e664c03e4a4245b4 |     
   mipsel    |           pimd-2.3.2           | NOK | http://autobuild.buildroot.net/results/39cfce0d2a63a37452e1523fcfc431e493c8c4f2 |     
powerpc64le  |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/e4f3c705e4633acc9a12d777b38e18c70a1e438b |     
powerpc64le  |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/60c18f509cd9c5db99773be9e3a566ae01cfa891 |     
powerpc64le  |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/1aca1b61a5e7e2dfbf10d0a82349693a7da97075 |     
powerpc64le  |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/35609af9db4d65a05140266b53b552b2f24ca902 |     
powerpc64le  |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/62f1f7cd76d81b2a04f048234d53b4840e21c3ea |     
  riscv32    |            poke-2.1            | NOK | http://autobuild.buildroot.net/results/9b679a0a388d94885730bca8865a86723940e08a | ORPH
 powerpc64   |           pppd-2.4.9           | NOK | http://autobuild.buildroot.net/results/354d258e5a80be9bdea4b6a0de7b0bec489eb2ca | ORPH
    m68k     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/54f2a7a4ed698395e8040e9b8caa58c216396506 |     
microblazeel |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/11bacf9a547c7c24478985e57962cc6da32871d0 |     
    m68k     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/9158a3dae7c8dd342d79c2717c7d903dbe281800 |     
    arm      |      python-numpy-1.21.2       | NOK | http://autobuild.buildroot.net/results/778a1f8adf65d4745e84d099f5ff546b0f8fcd81 |     
   nios2     |           refpolicy            | NOK | http://autobuild.buildroot.net/results/54aff0e188dcbf50acd2bd0d39cd197f69f94695 |     
 aarch64_be  | rtl8723bs-11ab92d8ccd71c80f... | NOK | http://autobuild.buildroot.net/results/a408aaaef51e0d9ac72c40be372bcf0abb804af7 |     
    mips     |    shadowsocks-libev-3.3.5     | NOK | http://autobuild.buildroot.net/results/95188c7fbd6401afea876969383ec3a0527a05ae |     
   mips64    |        swupdate-2022.05        | NOK | http://autobuild.buildroot.net/results/47f6384797d4112742cb15a81d8a5f81b56985f5 |     
   s390x     |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/9122a55343804a6141c189d0deafe2abab7e7a51 |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/5fa682eeb23efd09bd10ee05be56744dc9634449 |     
  powerpc    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/8a642cf9e2fc5e2816b29f01eb25b0371bc8cbec |     
  riscv64    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/c5ecd6ca59fd2125fa08fe194ae557e4adad0068 |     
  riscv64    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/236c849b79566c8b97f5e4a883c6cb6af37b41fb |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/243094e08019bc79631a5daa8504a99ff3c68433 |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/078adcd0c3fe5a78724f7e05d707343066d969c1 |     
    arm      |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/07582484814dfeb35504d74576015366fa261f45 |     
    arm      |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/16eb29e92063e42f231a0830de39feeb92a69403 |     
    arc      |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/8910e6bcdabc8d406f5f2d1c08748029b5be9320 |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/60f2f2023ce37451b5bc41fc174cd8fa9d0342af |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/04fad02f2801d845d2e16a6bbbe80d25e12f86aa |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/1cf22134817dddfb5bdfac43d197dd56b357a12a |     
  powerpc    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/700f62c0ec9f8215f617a5d701bd16fc8b79ca53 |     
  riscv32    |            unknown             | NOK | http://autobuild.buildroot.net/results/39814074fa3b9cd4b38908a17157790d967b5ffc |     
  sparc64    |            unknown             | NOK | http://autobuild.buildroot.net/results/8f671c32adf61e6beb3503de9261ed43c5b39c4e |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/5d6f2b9e2da5783778d8be5ba8031af7709f3d40 |     
    m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/1bb9e1b5dfa162f68949f6db702fb6d801ee9c4e |     
 microblaze  |            unknown             | NOK | http://autobuild.buildroot.net/results/4fb084561cf3b6b17aab235cceaee2832f913a17 |     
 aarch64_be  |            unknown             | NOK | http://autobuild.buildroot.net/results/1a335a0b6e797eee10c49243844b0c4969e2ca3c |     
powerpc64le  |            unknown             | NOK | http://autobuild.buildroot.net/results/ad3bb40169b3e3a2449e84d01bc83532ab1caf17 |     
  riscv64    |          vlc-3.0.17.4          | NOK | http://autobuild.buildroot.net/results/86189e14c426b35b8274f399a16576266af172c8 |     
    i686     | x264-35417dcd65a57321fbadf9... | NOK | http://autobuild.buildroot.net/results/961693a2f1c0f01cf561f040326218d45b64952c |     
   s390x     |            xenomai             | NOK | http://autobuild.buildroot.net/results/0f71813c222ae3c1d56e48abaff85cd8fbf0482a |     
   armeb     |         xenomai-custom         | NOK | http://autobuild.buildroot.net/results/0f9f96ae9cf27c6971354fd2e2ff912aeb8360d4 |     
microblazeel |         xenomai-custom         | NOK | http://autobuild.buildroot.net/results/ce7d41773d4e558a89b0b25cb51f387dc9f38834 |     
 aarch64_be  |         xenomai-custom         | NOK | http://autobuild.buildroot.net/results/e865387d25c4a08e995c07a40280d80e84ddd99a |     
  powerpc    |          zabbix-5.4.9          | NOK | http://autobuild.buildroot.net/results/4261d939a9577c334f977ea4e5c871f504bbb7ab |     
  aarch64    |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/a849acbf5c34dd192f2c7d7602d56f0ce8aa8c4d | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/9afe9e31272a735a4bfc9c0921e1040b384fe72a | ORPH
  aarch64    |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/08eee4a7409a0428c623617bc71b8511b3e7976c | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/578d10baad526993d10bd510d20e3a96a4649380 | ORPH
  aarch64    |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/2728953f221227cf2db925fff96fe1aac5082287 | ORPH
  aarch64    |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/8df755b6dee00011d3ab0db6bff3eb7254ef53e8 | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/47cec7d4690e42a8d4326840792ea896775c0b95 | ORPH


Classification of failures by reason for 2022.02.x
--------------------------------------------------

                       libuwsc | 2 
            ecryptfs-utils-111 | 1 
           libfreeimage-3.18.0 | 1 
                mongodb-4.2.18 | 1 
                 uclibc-1.0.41 | 1 
                 wavemon-0.9.4 | 1 


Detail of failures for 2022.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mipsel    |       ecryptfs-utils-111       | NOK | http://autobuild.buildroot.net/results/1f41d5f8289e1721e68522abc9ab7ff91dabf62b |     
   x86_64    |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/c41a5696c722409666204340479094aa1f2dfe0d |     
    i586     |            libuwsc             | TIM | http://autobuild.buildroot.net/results/610f27739a58d0aa6013dce6e1944799bbf6957a |     
    or1k     |            libuwsc             | TIM | http://autobuild.buildroot.net/results/c2751c96e3b96aee4c9531b07c4b0acb9c07e9ff |     
    arm      |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/2ecd6f9108adff4fb76896ece7bb6470a3056896 |     
  riscv64    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/21cb275b2bc0a57262878b692589e6f28264a649 |     
  mips64el   |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/68a44533de6199b1d0e56e8712d5125417a77382 |     


Classification of failures by reason for 2022.05.x
--------------------------------------------------

           libfreeimage-3.18.0 | 4 
              host-rust-1.60.0 | 3 
             libopenssl-1.1.1o | 2 
                 linux-5.17.13 | 2 
                   perl-5.34.1 | 2 
                  xvisor-0.3.1 | 2 
                 zlib-ng-2.0.6 | 2 
              alsa-lib-1.2.6.1 | 1 
                busybox-1.35.0 | 1 
                 coremark-1.01 | 1 
                 coreutils-9.1 | 1 
                  exempi-2.6.1 | 1 
               gocryptfs-2.2.1 | 1 
                host-go-1.18.3 | 1 
host-pahole-73383b3a39afe86... | 1 
              libgcrypt-1.10.1 | 1 
                libgeos-3.10.2 | 1 
                libressl-3.5.2 | 1 
make: *** wait: No child pr... | 1 
                 musepack-r475 | 1 
                    noip-2.1.9 | 1 
            ocf-linux-20120127 | 1 
               protobuf-3.20.1 | 1 
                     refpolicy | 1 
             uccp420wlan-6.9.1 | 1 
                 uclibc-1.0.41 | 1 
                       unknown | 1 
                  vlc-3.0.17.4 | 1 
                 wavemon-0.9.4 | 1 
                       xenomai | 1 


Detail of failures for 2022.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |        alsa-lib-1.2.6.1        | NOK | http://autobuild.buildroot.net/results/ceb09af063c4b3b629a6adcd4178b4077f424bb6 |     
  riscv64    |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/7ed1beef8da899ae539c3a803db3d0d16da4cee3 | ORPH
   armeb     |         coremark-1.01          | NOK | http://autobuild.buildroot.net/results/2ece0538bc2087da3a42a6048e3dc2b304195ebb |     
    sh4      |         coreutils-9.1          | NOK | http://autobuild.buildroot.net/results/8c39d64088bdfd3f3c0299fbd8a190942d714f6c | ORPH
    arm      |          exempi-2.6.1          | NOK | http://autobuild.buildroot.net/results/98b544597ff72f89bfbe212b1222de224ddfa2c9 |     
  riscv64    |        gocryptfs-2.2.1         | NOK | http://autobuild.buildroot.net/results/7a3fd3d1a365a93793ad4b441d3b271e0e9dde86 |     
  aarch64    |         host-go-1.18.3         | NOK | http://autobuild.buildroot.net/results/1071a15433e36ffd482e5e08f2a0f2b83eacb893 |     
   armeb     | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/e00727089d67ed8690e9fc5d1bbfff1e51e17c88 |     
  sparc64    |        host-rust-1.60.0        | NOK | http://autobuild.buildroot.net/results/ddbbd8e01d873feee2295e4a06b6e4719d913173 |     
   x86_64    |        host-rust-1.60.0        | NOK | http://autobuild.buildroot.net/results/77cb0408fb5406c50b716f3a8f17b2bc29620e5f |     
   x86_64    |        host-rust-1.60.0        | NOK | http://autobuild.buildroot.net/results/fc27d5979336a995c0a3793523fe785ed8804532 |     
    i586     |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/7b41c73daf9f519d48f9a8dbc411492296f59045 |     
    arm      |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/90b1d055107109fe13ad3a9ad74f57f792752b7a |     
   xtensa    |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/68084598ab1f4988f3bc2418ab260b03f0a61288 |     
  powerpc    |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/d006300df35a76430b02f6d98862ac9b8c4e8818 |     
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/e63dc03754627748db6717de8cac5b6f15e320db | ORPH
    or1k     |         libgeos-3.10.2         | NOK | http://autobuild.buildroot.net/results/c68541503153d0e06e069f91cba90b5b55014e9f |     
microblazeel |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/dfdb21fc7edd10a03f3e5dd8065e086375452878 |     
   sparc     |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/feab590884e17595301b62ba8446abfeeb4f76f1 |     
   sparc     |         libressl-3.5.2         | NOK | http://autobuild.buildroot.net/results/27fe54eb8c3981a2c42bcf59078dad3f1b16a2b4 | ORPH
 powerpc64   |         linux-5.17.13          | NOK | http://autobuild.buildroot.net/results/7721f0d7ca39b349de51dcbfa9574d78ff96cc56 | ORPH
   armeb     |         linux-5.17.13          | NOK | http://autobuild.buildroot.net/results/05bd07e303c87c1b869113a09572996e63c007e3 | ORPH
   x86_64    | make: *** wait: No child pr... | NOK | http://autobuild.buildroot.net/results/06eb01d3c79144e25c0664513fd2e75499a2b435 |     
   x86_64    |         musepack-r475          | NOK | http://autobuild.buildroot.net/results/5313e3bf7c37ee610d2a584d0e4178714523f18d | ORPH
   xtensa    |           noip-2.1.9           | NOK | http://autobuild.buildroot.net/results/48e31aa41c2abca7e9550e6a6da7d8c639aed7ef | ORPH
 aarch64_be  |       ocf-linux-20120127       | NOK | http://autobuild.buildroot.net/results/f3ead428506b1e877c8c8c5f0937f5a36464e2cc | ORPH
  mips64el   |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/3668cce1988f466c65d7f11f962ee7d4d1c0b215 |     
    mips     |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/69c53689755f92b0d1a473369f6c706446164c73 |     
   nios2     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/ecbd59e335fb463c87d1dc85e1731f748e09e3e7 |     
   arceb     |           refpolicy            | NOK | http://autobuild.buildroot.net/results/4838e279aa2e3d7519762c321d633495676579b2 |     
 aarch64_be  |       uccp420wlan-6.9.1        | NOK | http://autobuild.buildroot.net/results/3461d0df037be25bb1973f0a30b30633b8c57d04 | ORPH
  powerpc    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/8825454c5da42c7b87f9f0780165051fa7205658 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/9314edda87b5a240a352f2f5772c11ee46c05c80 |     
  aarch64    |          vlc-3.0.17.4          | NOK | http://autobuild.buildroot.net/results/66f81f0a4866366f0f5254ff0f7d5dbb1e0bf09e |     
   x86_64    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/d854807f1e6f76902a102e809a3782d4c78744f6 |     
  mips64el   |            xenomai             | NOK | http://autobuild.buildroot.net/results/16562f4a953dfed35bf64c90bc2f9af2828377c9 |     
  riscv32    |          xvisor-0.3.1          | NOK | http://autobuild.buildroot.net/results/94cb282230fed66238b7f4c029e12e4291167cb4 |     
  riscv32    |          xvisor-0.3.1          | NOK | http://autobuild.buildroot.net/results/25a183f8d285dc55e6b3fcdfce52065d2d7524e0 |     
  aarch64    |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/9cf32e25aee4e2b310cbf7b914f4896a55be957f | ORPH
  aarch64    |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/bb2a55d4f538d69e6ec38f636169d2d2f11ed174 | ORPH



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

