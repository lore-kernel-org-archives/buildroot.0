Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C7DBC433EF
	for <buildroot@archiver.kernel.org>; Thu,  7 Jul 2022 05:39:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D8E4940C5F;
	Thu,  7 Jul 2022 05:39:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D8E4940C5F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ykC3uYV5HsHZ; Thu,  7 Jul 2022 05:39:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3724740154;
	Thu,  7 Jul 2022 05:39:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3724740154
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 146A11BF578
 for <buildroot@lists.busybox.net>; Thu,  7 Jul 2022 05:39:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BCB0440154
 for <buildroot@lists.busybox.net>; Thu,  7 Jul 2022 05:39:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BCB0440154
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id g4APqZ29qhez for <buildroot@lists.busybox.net>;
 Thu,  7 Jul 2022 05:39:44 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 39B5640151
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 39B5640151
 for <buildroot@buildroot.org>; Thu,  7 Jul 2022 05:39:42 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 3D3F9240006
 for <buildroot@buildroot.org>; Thu,  7 Jul 2022 05:39:40 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Thu, 07 Jul 2022 05:39:40 -0000
Message-Id: <20220707053946.BCB0440154@smtp2.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1657172380; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=IIqP80F3YVekejWqXOlxcCYz0oaY4kxlWirxmF4eofU=;
 b=YtZ65rtJDhePeHDv2pmR/0fUCuqgsbfrjbXxBHPTPMOoW/Kh+BiS5ffl7HmuMdgrzwKQzE
 sVg91nN3SX5tshysq8q0K9xIpVSSklWxgDNS7otbDaCDjPJRN7nsypTLIszEU9Dhflnjq+
 5BYJApT9gd6OBYxJ4ZiEFJBUfs275gVEUXt16JijHiV6fEUZarFZTRP5v2IIKV2dCrbNdd
 BTmb96VaJtXj9Fnk8BHZKlieIdyX5ccj0xIkb92jLVJHGbou9lSTdNHMYv9D+lv4xL+ySx
 IH6ZYcEFFNwb7cGCLvXDKzQADfTPjsiswJ3zqXJi71W6AQVll9e7rwKBdLEACg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=YtZ65rtJ
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-07-06
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

Autobuild statistics for 2022-07-06
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  | 16  |  5  |  0  | 21  |
  2022.05.x  | 30  | 33  |  0  | 63  |
    master   | 168 | 488 |  2  | 658 |

Classification of failures by reason for master
-----------------------------------------------

                libcurl-7.84.0 | 210
              alsa-utils-1.2.7 | 40
                 uclibc-1.0.41 | 20
             libopenssl-1.1.1p | 19
                 zlib-ng-2.0.6 | 11
                speexdsp-1.2.1 | 9 
glibc-2.35-96-g2c4fc8e5ca74... | 8 
                host-go-1.18.3 | 8 
                libressl-3.5.3 | 8 
                busybox-1.35.0 | 6 
                 linux-5.17.13 | 6 
                       unknown | 5 
                    bat-0.19.0 | 4 
                  ffmpeg-4.4.2 | 4 
                iptables-1.8.8 | 4 
                     refpolicy | 4 
                   speex-1.2.1 | 4 
                    brltty-6.4 | 3 
         host-gcc-final-10.3.0 | 3 
host-pahole-73383b3a39afe86... | 3 
           linux-5.10.115-cip7 | 3 
                 pixman-0.40.0 | 3 
                    pppd-2.4.9 | 3 
              swupdate-2022.05 | 3 
                   tor-0.4.7.8 | 3 
                     ace-7.0.6 | 2 
               acpica-20200717 | 2 
                arp-scan-1.9.7 | 2 
                     aufs-util | 2 
                    bird-2.0.8 | 2 
            cppcms-2.0.0-beta2 | 2 
dahdi-linux-5c840cf43838e06... | 2 
                 dash-0.5.11.5 | 2 
                     frr-8.2.2 | 2 
  gobject-introspection-1.70.0 | 2 
host-gdb-arc-2020.09-releas... | 2 
              host-rust-1.60.0 | 2 
host-spirv-llvm-translator-... | 2 
                  jack2-1.9.20 | 2 
                    lame-3.100 | 2 
           libfreeimage-3.18.0 | 2 
              libgcrypt-1.10.1 | 2 
                minimodem-0.24 | 2 
                nodejs-16.15.0 | 2 
                   perl-5.34.1 | 2 
               protobuf-3.20.1 | 2 
                       sbc-1.5 | 2 
               tcpreplay-4.4.1 | 2 
                       xenomai | 2 
                  acpid-2.0.33 | 1 
                alsa-lib-1.2.7 | 1 
                bitcoin-0.21.2 | 1 
                  botan-2.19.1 | 1 
                   bullet-3.21 | 1 
              containerd-1.6.2 | 1 
                    dhcp-4.4.3 | 1 
        edk2-edk2-stable202102 | 1 
                elfutils-0.186 | 1 
              erlang-22.3.4.22 | 1 
                   expat-2.4.8 | 1 
                 fdk-aac-2.0.2 | 1 
fs/ubifs/ubifs.mk:49: /nvme... | 1 
                gnu-efi-3.0.10 | 1 
                heirloom-mailx | 1 
          host-gcc-final-9.4.0 | 1 
             host-gtest-1.12.0 | 1 
                     host-mono | 1 
                   i2pd-2.40.0 | 1 
            igh-ethercat-1.5.2 | 1 
              jpeg-turbo-2.1.3 | 1 
                  kexec-2.0.24 | 1 
      libabseil-cpp-20211102.0 | 1 
                  libftdi1-1.5 | 1 
                libglvnd-1.3.2 | 1 
                   libnss-3.79 | 1 
             libstrophe-0.12.0 | 1 
   libtorrent-rasterbar-1.2.15 | 1 
           libwebsockets-4.3.1 | 1 
make: *** wait: No child pr... | 1 
               mariadb-10.3.35 | 1 
                     mtd-2.1.3 | 1 
                    musl-1.2.3 | 1 
                   ncurses-6.1 | 1 
            ocf-linux-20120127 | 1 
on2-8170-modules-73b08061d3... | 1 
                 opencv4-4.5.5 | 1 
                     php-8.1.7 | 1 
                      pigz-2.6 | 1 
                    pimd-2.3.2 | 1 
           powerpc-utils-1.3.8 | 1 
            python-ujson-5.2.0 | 1 
qt-webkit-kiosk-a7720e50f2b... | 1 
rpi-userland-14b90ff9d9f031... | 1 
rtl8189es-39c17661136da48f8... | 1 
                   sdl2-2.0.22 | 1 
       shadowsocks-libev-3.3.5 | 1 
                 sudo-1.9.11p2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |           ace-7.0.6            | NOK | http://autobuild.buildroot.net/results/82beac11a8eb29a94a0fb6938fcf8137f0d7f36e |     
 microblaze  |           ace-7.0.6            | NOK | http://autobuild.buildroot.net/results/d9d7f257d8df05c2ac3fec22727782181fbad978 |     
    m68k     |        acpica-20200717         | NOK | http://autobuild.buildroot.net/results/139b2d4e4e50bba8fe54c00975f11ed874933f7d |     
    m68k     |        acpica-20200717         | NOK | http://autobuild.buildroot.net/results/9076d73a3362aeb441b7c674f1518ee57782ce70 |     
  mips64el   |          acpid-2.0.33          | NOK | http://autobuild.buildroot.net/results/802c670e36ce44e585a3da37ebbdd8a5dab021e1 | ORPH
    m68k     |         alsa-lib-1.2.7         | NOK | http://autobuild.buildroot.net/results/6f9c500f6cd21860f2d91f4c0c883a477a3b350b |     
    i686     |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/2d09cd2b8c68392e571826c8ac880c14737f989b |     
    or1k     |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/e47b1dae19015d134f2ead1db659733b8977dc07 |     
   sparc     |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/d9e5b7b401690317fb1af3c9394cc7bea2526430 |     
   sparc     |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/e84d44438c9eb948eff21747281ec74a278fae54 |     
    m68k     |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/75b06a2a67176a7c8a013d03aa7018bacfdae2e1 |     
  mips64el   |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/0a61cfbb1e0ab0840370cc9549ddd0eb74f7ec82 |     
   armeb     |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/0e930f141740de74809a670e233baec65ed88a45 |     
   s390x     |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/f6d66d932ea27c15bbe290a7002d4d94090ca2a6 |     
   mipsel    |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/9dfc7600d9e825a83b1a16225bf41da185cf59e3 |     
 aarch64_be  |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/7eef8328f3a50785554c12ebfb373b62b84a2c9e |     
    sh4      |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/ae95848bac02f3eb162341c893644b7991896619 |     
   mips64    |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/5b6526605afdc016ee8f7dcf9222baac1156f404 |     
   mipsel    |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/03261794ed3c4674bbeb8d0ace1623c4b051eef2 |     
   x86_64    |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/2e4fc7c1e61731aaae9d06b704c4c397459566e7 |     
   sparc     |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/7aa1eb5b78d99687420e5172876c896aa38e6d6e |     
  aarch64    |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/8ad38c5d65fd44911f7a0c6c07f8c996780dd9b3 |     
 microblaze  |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/afba30db1f6285a08dcc097faffd05cf5c644cf6 |     
    i686     |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/d35c6dd7cd271e97c8557ce4d3b0f9be36a04a9f |     
   x86_64    |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/ddee140d4b4cf76d0fd9b564af75d3e9bc4d5a12 |     
   xtensa    |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/88f369a0339851e7658c593fbc0611f867809a9c |     
powerpc64le  |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/78f5996b0ea101b53bf5cfbfcd9b95509a25f991 |     
   s390x     |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/b5a8f476d3b85fbf2dbd85db42b4144378c0d2f1 |     
   armeb     |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/9d503930e76afd4fe2740d152aa54005bf00e887 |     
    i686     |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/6f77774ada21c25affa96cb572f3ac73b786029a |     
  riscv32    |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/1039cba7a69cc2b82495ed2c972c097857fea40a |     
  aarch64    |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/06547a0a6a6255680529908eb2ded62a04ef4b27 |     
 microblaze  |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/9df61fe92c2ffe98ad75156df15831d0e6b71140 |     
   x86_64    |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/4305b8b570fe8bf80872c3ac492b1a8eca515e86 |     
   sparc     |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/e3ec05e7daade29726aaf6082a131e3721f62271 |     
  mips64el   |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/1ee6c8c9b3799e49a2b9d2e2eaa43cd935fd2f15 |     
  aarch64    |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/77d3c8a07d3dc84294e07bf95651e61cc3b70fb0 |     
  powerpc    |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/181465c93487aae142b5a2269531dba2c00e3a5d |     
   x86_64    |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/56bb6e6dba60d74fa0a1854b30655541b794d247 |     
   mips64    |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/ed8e2eaa9a0f580910242f0a6e47ce9f5e5fd87d |     
    arc      |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/b92f9d72f8a10ee1b9ba15cbc8db79b143490e76 |     
  mips64el   |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/f696cea529f370ebb97e363a43d2a341dfcdf9fa |     
   x86_64    |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/b69916abe16129321f086d5d53dfdc21006e4629 |     
 microblaze  |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/b0ef8d343c5b494d88cad838c7012257bf39559e |     
   mips64    |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/429f35c91041cf63af1bd23b1a941b88da705f13 |     
   sh4aeb    |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/a35dd2e70e3efc24155ce207e6506b762bf1a1b5 |     
    m68k     |         arp-scan-1.9.7         | NOK | http://autobuild.buildroot.net/results/17574949c8e70b4709e2c1f1db8e1c36b4d96922 |     
    m68k     |         arp-scan-1.9.7         | NOK | http://autobuild.buildroot.net/results/4c1a3d214ba9076e3a0f9bef6507fbcbbe8b453d |     
   arceb     |           aufs-util            | NOK | http://autobuild.buildroot.net/results/b1526fc817523e1f4f155799ae473f04be48f49e |     
    i686     |           aufs-util            | NOK | http://autobuild.buildroot.net/results/dbe191a8c1ca322af0f8787bc7b18c6883a1a074 |     
    i686     |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/3046237a99eebc4aa01808b7a978a8d495353e31 |     
   mipsel    |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/bf2e1e7774709fb8ddf943a5db8bde74f8ead607 |     
    arm      |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/03aa0bc8b909a0bba95e518584417e243c7bab1e |     
  aarch64    |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/3f1ee21e60bbf8b8749661803e34c3f2dbfa3009 |     
  mips64el   |           bird-2.0.8           | NOK | http://autobuild.buildroot.net/results/f8c5fba3dc585f277a9d88a57b377ca03c8d1d95 |     
  powerpc    |           bird-2.0.8           | NOK | http://autobuild.buildroot.net/results/80c865f8933199f5affc5b9803b6dcfc64b023d4 |     
    sh4      |         bitcoin-0.21.2         | NOK | http://autobuild.buildroot.net/results/32833c70d1da8ed61852cdf4b53960afba4d681e |     
   sh4aeb    |          botan-2.19.1          | NOK | http://autobuild.buildroot.net/results/9a1d0a947b11f7c7f2ba8256050ed52ce429edd4 | ORPH
 microblaze  |           brltty-6.4           | NOK | http://autobuild.buildroot.net/results/411b8ad27a86be706a6a1cb5efe3af7a9fec276e |     
 microblaze  |           brltty-6.4           | NOK | http://autobuild.buildroot.net/results/fa3c19ff1cc45a6cc92aa9c96009dbadd2b99857 |     
    mips     |           brltty-6.4           | NOK | http://autobuild.buildroot.net/results/9bdd8ea4e9bbeabddd94dcc74e9a0978b9c97035 |     
   sh4aeb    |          bullet-3.21           | NOK | http://autobuild.buildroot.net/results/1e4fa05ccfde354233364be9c573eba935b38bb7 |     
  riscv64    |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/abf857041756021f84946a5faaccd4414ae6e3c3 | ORPH
  riscv64    |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/86b1155668a107212c16b7f188781fecae1668f6 | ORPH
  riscv64    |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/cbd4517306bcc1d54667f0a97d5cf610ae234ce6 | ORPH
  riscv64    |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/29558eb5d57eb71b89e0eed0cac74883a3a44645 | ORPH
  riscv64    |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/5c61d240ae0ac4bdf5863b7553bf4491cacf7045 | ORPH
    m68k     |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/01bb7d88289ed8e92b68918a0e3dec4507be3362 | ORPH
powerpc64le  |        containerd-1.6.2        | NOK | http://autobuild.buildroot.net/results/d0766009224758695f7ba096c30290d4074f3099 |     
    or1k     |       cppcms-2.0.0-beta2       | NOK | http://autobuild.buildroot.net/results/784341a40de7a841d5c04f122d924a9b156994a0 | ORPH
 aarch64_be  |       cppcms-2.0.0-beta2       | NOK | http://autobuild.buildroot.net/results/02d094ace5425f55fe245bbb1a8778ce2100e2f3 | ORPH
   sparc     | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/3ff78f0cb7d6139cc1baff5a810c9f8d62dad731 |     
   nios2     | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/42658fc77bae78f5eb84a686ee8f9a5a11742c87 |     
  sparc64    |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/ca18a4f14594f0a0186639d49dc51ac57d8c99e2 | ORPH
 powerpc64   |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/b2d2abef80cfb09c1b1b9b03482dce6ba7880de3 | ORPH
   armeb     |           dhcp-4.4.3           | NOK | http://autobuild.buildroot.net/results/4ce4a8a0e4b12b9ee97fec1b57d4dfd2a55c0790 | ORPH
  aarch64    |     edk2-edk2-stable202102     | NOK | http://autobuild.buildroot.net/results/dae58e09f7d31a15d485d5e678ba61458824aecc |     
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/f68d05b7b4551e4955ed147529d999944dd5e160 | ORPH
   x86_64    |        erlang-22.3.4.22        | NOK | http://autobuild.buildroot.net/results/a937eda1ef7e0bee14ef514dbf0a40a3eeea5fdd |     
 aarch64_be  |          expat-2.4.8           | NOK | http://autobuild.buildroot.net/results/5b55b6416c9b78226567c4ef2af813e38407f541 |     
    i686     |         fdk-aac-2.0.2          | NOK | http://autobuild.buildroot.net/results/3133cda6a9c8908739f8ba05a97ca9c89ac336af |     
powerpc64le  |          ffmpeg-4.4.2          | NOK | http://autobuild.buildroot.net/results/97ff82c32f5f63a1b272d3a964fe0fc87009cb56 |     
powerpc64le  |          ffmpeg-4.4.2          | NOK | http://autobuild.buildroot.net/results/e58cda37a2ac3302f96071a14e53ee7a16cfd01b |     
powerpc64le  |          ffmpeg-4.4.2          | NOK | http://autobuild.buildroot.net/results/9542c40be134cc8b0fb443ebaaf5eac94c089a7d |     
powerpc64le  |          ffmpeg-4.4.2          | NOK | http://autobuild.buildroot.net/results/a06abad6c1bd3d2f1b7da834618af8447e26edff |     
    arc      |           frr-8.2.2            | NOK | http://autobuild.buildroot.net/results/1485ff0763d17c09bf775c0b1f93f89b6c4745a8 |     
  mips64el   |           frr-8.2.2            | NOK | http://autobuild.buildroot.net/results/0404cf2fe8dd27ebb843fcdd35f2ba2fb49faa01 |     
    i586     | fs/ubifs/ubifs.mk:49: /nvme... | NOK | http://autobuild.buildroot.net/results/dab48bcfcaffd33658270293723da4837f9e7327 |     
  riscv32    | glibc-2.35-96-g2c4fc8e5ca74... | NOK | http://autobuild.buildroot.net/results/5929c5ea20144eae87594b682d24d37e93f8e757 |     
   nios2     | glibc-2.35-96-g2c4fc8e5ca74... | NOK | http://autobuild.buildroot.net/results/7ec3335bb8d311e3f01b35c3fa9d103e26a25abd |     
  riscv32    | glibc-2.35-96-g2c4fc8e5ca74... | NOK | http://autobuild.buildroot.net/results/f3e696dcd83efecf611aa8fef6754550fd084aae |     
   nios2     | glibc-2.35-96-g2c4fc8e5ca74... | NOK | http://autobuild.buildroot.net/results/572863bc02950cd95c51b264e385790dd5f341da |     
   sh4aeb    | glibc-2.35-96-g2c4fc8e5ca74... | NOK | http://autobuild.buildroot.net/results/9215d182ce55e44177425595a86c6b5df7b30f30 |     
   mipsel    | glibc-2.35-96-g2c4fc8e5ca74... | NOK | http://autobuild.buildroot.net/results/3ba89c6278b729ea904a070ccd4c7d5e5d3eb509 |     
   nios2     | glibc-2.35-96-g2c4fc8e5ca74... | NOK | http://autobuild.buildroot.net/results/b5d91824f27b7089c4657846e9087e4dc355c38b |     
 microblaze  | glibc-2.35-96-g2c4fc8e5ca74... | NOK | http://autobuild.buildroot.net/results/2dedc9ed56f55fda92521fef4d8befef342b87f7 |     
  mips64el   |         gnu-efi-3.0.10         | NOK | http://autobuild.buildroot.net/results/333f2c72eb3116adc07b05c2a16e154d550b06d1 |     
   x86_64    |  gobject-introspection-1.70.0  | NOK | http://autobuild.buildroot.net/results/79892dcb971dc695bd699ea15bd82a94446cf8c6 | ORPH
    i686     |  gobject-introspection-1.70.0  | NOK | http://autobuild.buildroot.net/results/357673d4503ae3b92778907311f44673cf579173 | ORPH
   armeb     |         heirloom-mailx         | TIM | http://autobuild.buildroot.net/results/d5ccfd9b94e9a2248e80b2e043b4dff7bd9cb30f |     
   x86_64    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/844994d02ae3c22c226eb97e05b2d7533c6e519e |     
    i586     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/97be54ef8cad56bd133d708636f1d9eaf31009a6 |     
    i686     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/17e9eaddc80ca0d8972c947e1602b5eca0785084 |     
   x86_64    |      host-gcc-final-9.4.0      | NOK | http://autobuild.buildroot.net/results/9f85e39c5e068d2a7d24aaebc7417e5d4ecbf849 |     
   arceb     | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/e545fc72ad5b159ad4faf90920e054e641737ee9 | ORPH
    arc      | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/0e15485650d5406f7ce967433cd6c3cc0a2bf4a9 | ORPH
powerpc64le  |         host-go-1.18.3         | NOK | http://autobuild.buildroot.net/results/c965a23df9a8ae0e0f6cb2d094846b94c605fb46 |     
  mips64el   |         host-go-1.18.3         | NOK | http://autobuild.buildroot.net/results/f578fa4221609332b21cbfca96db40555a3f72f6 |     
    i686     |         host-go-1.18.3         | NOK | http://autobuild.buildroot.net/results/ab35a2b6a27aec1a05fdef6d20629e672696a275 |     
   mips64    |         host-go-1.18.3         | NOK | http://autobuild.buildroot.net/results/a9f9f3891dc01b87983bb51eb05ef2485ce722bb |     
  aarch64    |         host-go-1.18.3         | NOK | http://autobuild.buildroot.net/results/5a72cb57706157f1ac7d2da84c8bc4f57770fcdd |     
  aarch64    |         host-go-1.18.3         | NOK | http://autobuild.buildroot.net/results/deb9bdf818cb9a83e4c4e32e9e3609b65233b0e2 |     
  aarch64    |         host-go-1.18.3         | NOK | http://autobuild.buildroot.net/results/4d45920a1395ef6c2a3ac97db15437de18e7b54c |     
powerpc64le  |         host-go-1.18.3         | NOK | http://autobuild.buildroot.net/results/e4a58a1ef378f5125c3d29c3fd2e928e7dcf8e14 |     
  sparc64    |       host-gtest-1.12.0        | NOK | http://autobuild.buildroot.net/results/f2468e1b8c29cae6241434f0ba105a4c5e57d517 |     
   x86_64    |           host-mono            | TIM | http://autobuild.buildroot.net/results/e64248dd71cb6beae1d4e14e53d5738e99f9b289 |     
  mips64el   | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/e327a4ca724a0af7e487846832a1e51baf1595d9 |     
 powerpc64   | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/09658f7f1165d3601956352b3e252e00390a9fdf |     
   armeb     | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/95907adf28275148818fc6390eb7f9934a592043 |     
    i686     |        host-rust-1.60.0        | NOK | http://autobuild.buildroot.net/results/e722b604f96ac9180102f8a7bbb525d8d69d513b |     
    mips     |        host-rust-1.60.0        | NOK | http://autobuild.buildroot.net/results/c8a430eed03819bfcfccbd570d0de6e2754ec2ca |     
   armeb     | host-spirv-llvm-translator-... | NOK | http://autobuild.buildroot.net/results/21a430ce2c34121ec712eb2d861413292ec56605 | ORPH
   x86_64    | host-spirv-llvm-translator-... | NOK | http://autobuild.buildroot.net/results/971680b41da67e72f41f07666fc2a3757a635576 | ORPH
   x86_64    |          i2pd-2.40.0           | NOK | http://autobuild.buildroot.net/results/e16cf92f07c018540d91c5536d93d1579dc7c447 |     
 microblaze  |       igh-ethercat-1.5.2       | NOK | http://autobuild.buildroot.net/results/e3c9f306f45533098475e58f85768cc6f8de26b6 |     
    arm      |         iptables-1.8.8         | NOK | http://autobuild.buildroot.net/results/a78287fac1f687e157ab8e28eaf92111cffaf676 | ORPH
    arm      |         iptables-1.8.8         | NOK | http://autobuild.buildroot.net/results/919fff13db5e84a2ee6196b1462c4e28e894df2b | ORPH
    arm      |         iptables-1.8.8         | NOK | http://autobuild.buildroot.net/results/5152fc8ecf2e7d399dbeab2ef9db48abba892d3c | ORPH
    i686     |         iptables-1.8.8         | NOK | http://autobuild.buildroot.net/results/d1bf3fb750514fabe129170f597874a3d7d3818d | ORPH
    m68k     |          jack2-1.9.20          | NOK | http://autobuild.buildroot.net/results/49d52e2b4929f013e9b4983b37484742232ba79f |     
    m68k     |          jack2-1.9.20          | NOK | http://autobuild.buildroot.net/results/155e2a270d0cd2ca6e4a790d471a11b2f86da51d |     
powerpc64le  |        jpeg-turbo-2.1.3        | NOK | http://autobuild.buildroot.net/results/d86ec3a37ab98c9e61f4ae4c7ea5cb523f741d78 |     
 powerpc64   |          kexec-2.0.24          | NOK | http://autobuild.buildroot.net/results/beec8616306ba93e9925a6b4778dd721fd07a9ab | ORPH
   xtensa    |           lame-3.100           | NOK | http://autobuild.buildroot.net/results/b12d4b1591493535e35a29a5ced1a7cb0d887979 |     
    arm      |           lame-3.100           | NOK | http://autobuild.buildroot.net/results/5929ada1c0089e3c6874356464f62156230d90b0 |     
  mips64el   |    libabseil-cpp-20211102.0    | NOK | http://autobuild.buildroot.net/results/53c74dcca5958c55a623bcb68312c1384891a69b |     
  powerpc    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/9d9e9339407de569d64f4706f9c2078c967f2124 |     
   mips64    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/e689b020a8169ff0adb59779600478f4a0f5c225 |     
   armeb     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/0a96545ed3394b066fb9675443f9941749c36cc8 |     
    sh4      |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/e147eff7247ec137f5fc2f5da1ce8e5ffde3d8e2 |     
 powerpc64   |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/4d98cae3fc8c9b8c114f62f67c4d6e589a47dc57 |     
  sparc64    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/694cbcc7fa67d1287334df947a4e0e32910807d5 |     
    m68k     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/c71d3fb7e7f540ea49467260bf21a57e5746f28e |     
   mipsel    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/a43236ef94d497878b75d0760f93ec85abd72c70 |     
microblazeel |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/32603b92015566e76e5b2c193bd8f3f569d2bb8f |     
   armeb     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/397a293912b0ea69d78c31c5f02cfe97625761d0 |     
    arc      |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/4b638e6a2df64e8a9ce262c52226095b4079d910 |     
   sparc     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/1e434888c09d6d0e262ee3483adac530015d7893 |     
    arm      |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/8929fd89a55ca33e65f67fdd71379acf068137e4 |     
    or1k     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/560a504ca882a824ead0d80019331821d7574e72 |     
 powerpc64   |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/114a3791bdafe0508f0021733b42678d071af31c |     
   s390x     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/3c865ebde0383e34cb7b77d142cb370ed12f82ec |     
  mips64el   |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/b274aa7ec201626ab62fa7b322d72daa78d8c9e6 |     
   sparc     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/b591bf1e6c94b1286fe32f482140e36165dea16b |     
   sparc     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/c94920e92bc9c9ab9cd1b5b7f207824ca9c42a38 |     
    m68k     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/de7158d0e29b670139cf11d4e27df96caaa83571 |     
   xtensa    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/6b94a509b3650c419d9cace58426b7fc76915ba4 |     
   armeb     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/c864d919d52c325e4e6907168b52f53708d8f213 |     
    arc      |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/9733c39cd8cb1ab6a5e3dd7b3e8c473c2fa2d6fc |     
   s390x     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/f13b8da148582aef6e69507f8ac95f33b2db3aac |     
  riscv32    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/0b90451b2849220d1d15734f2b1890573f6c5447 |     
   mips64    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/9032a987af6f2d1ecfa1ec65fd69306cee01fb5f |     
 powerpc64   |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/1ee6bb56b7e702146d2fbb29d8b37d58c454688e |     
  sparc64    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/ac1e1e496d53cec5bf196f7d34e194631f410651 |     
  powerpc    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/8d24ebaf7981b7f17cde1371db00219b4233a873 |     
    arm      |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/6da8e417985b54b421d15ac5c6e3e7ad26ebaea8 |     
   nios2     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/1824aaa5b8429907386e098afe206800b490eec2 |     
    mips     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/378cd9bb0396ad8635c5dfc9edb7347ef97ca196 |     
    arc      |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/6ff010dd68cb609d80558e72ecd5070e29826e42 |     
   nios2     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/0725a2e008a3dcbbcf2c7ebffc391ef3cfecef0e |     
   nios2     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/27ee6081701bc3d429f73572c466349b842e3289 |     
microblazeel |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/a3e61126ac24f7c912bc23a47729e3f67d92b2b7 |     
  riscv64    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/420267e4c87aec3876bd9a9684b050eb7e3c6ea2 |     
    arc      |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/0fa85ca3fbe3c2733a88173b9a59b8739876879c |     
powerpc64le  |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/7a3452c0e41ce1ebc01929f7e7b7830855a440a8 |     
  sparc64    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/c0648f2346fa005c5b7e3ed8c69acd97c5a28f10 |     
  sparc64    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/03c0dd788d66e9717496c8420985ad97bd11b005 |     
 microblaze  |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/6005a454dac1ee1581c90c8b4590da8082ccdbb4 |     
    mips     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/ec51edbf6d3b2977b49e52d455c5229a96d38470 |     
   s390x     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/0a5a1b4e0111a91b4865a21e711ce161fe5805f8 |     
  sparc64    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/974f768de96380814d3251540a86e2b650184b08 |     
    sh4      |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/148cb1a3007f016f96d490a6bafef9b1382c79e3 |     
 powerpc64   |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/01edd00b2b25943baf2a81aabbffadb93fb64f3c |     
   mipsel    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/ffaffc5caaca862b00c14853fc5b3fec14ee7a7a |     
 microblaze  |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/4707c829c4dbe178b73af462523d8a7928839543 |     
   mipsel    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/8661fbb988bfb83be5fee0bfa6a28b38051a2d0e |     
    or1k     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/b0d9c75d565f56753c9b3ba56087b9b9934e5ce2 |     
   s390x     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/2f0180439b3d22d4cef15cf374f9d32f2c844901 |     
  sparc64    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/9234da91ce549fc9a4741f24d9a64f402fddb2eb |     
  powerpc    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/029dbc7584578cec5a8d944bf5edd8c950289be4 |     
    m68k     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/671e72f5a0eef364980f87a1b87bd86092a91aaf |     
   mipsel    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/bc5926bf760cd682e832a10eb2a2cb364dd69111 |     
  mips64el   |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/2f9bade0a0633536ed5e6e66bd890e265917cd27 |     
    sh4      |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/fbdf44e4581244807c94840aec2ea9280a5df37a |     
  sparc64    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/8a4297c1f47c928cd334a22ad1a86daf2ec332e7 |     
microblazeel |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/62875092945113ff74028cca038ead464cf98efd |     
   nios2     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/f70b24982a6bd4a37ceee833c3972b166a17b39c |     
    or1k     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/e6595b0c8dad83796f298c617b0aefd919f189ab |     
   xtensa    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/039a5e38baeee24d71ab0d31aead212266e3670c |     
    m68k     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/96c625738662fa5006673d7cd35b8eb033c1a70e |     
    or1k     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/c4e1f48aee9f619acee20d894e51b7a001aa49ea |     
   mips64    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/76b4295fe6048089a7446c10f8aa9fe8f8dc8e96 |     
   s390x     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/e1267e85cae720345a96f28a357d784757710f6e |     
  powerpc    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/efc3b96986e73198ee5244970b42b4ff92065176 |     
microblazeel |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/87061c35375f3de0a07f15a3f4e48173d773f60b |     
 powerpc64   |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/e880f3ded31d295500a875713d9ba83ca88ff932 |     
  powerpc    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/6fc1b42ac0a39687331727f148cad8f7441f4183 |     
  powerpc    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/4652f70b0d9a4b425b4bd20b095f0839701c16e2 |     
   armeb     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/66ec9b7ea7ef57cb05437f9f898a8bd1c150a470 |     
    or1k     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/9151016672682d8a6d5a79e34338541bb3022592 |     
  powerpc    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/2dad0a2c3d0f839f78060ca114ff174058cee4b3 |     
  riscv64    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/20c887424014299bcaeeee0baa5a6e8c91602dbf |     
   sparc     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/1acadd0946d8f7ee2007aa88db7ca23742b0f48c |     
  riscv32    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/e8ef1fe7fecf3bf2a514d72bf9c0bf8fcc4c4a00 |     
    mips     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/a6f8540a7fa34c04f6cfdbc03a3528cb758c5dfc |     
  sparc64    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/554beb6d87e7f7868b81f0bb9c8357ec462aaa36 |     
 microblaze  |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/b6f4afbb0c65264881b3e6dd89392a5465770056 |     
    arm      |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/2845f9e1ec9031b097f2e2936e55b300a2bbb76c |     
   s390x     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/e181aa733cd4971ef4d22ca59374cb0e89d4a179 |     
    or1k     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/117eb69a6b8234d42e61bfdf962503f4e5a5f2e6 |     
   s390x     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/db80cc2d0c80d1355c3faf8ae6be7eb4a2299251 |     
   arceb     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/c1c06587a0543bc5104d1feb97f1b945906c631f |     
   s390x     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/50e446e116a169dc21e8e0caf4325250040cf649 |     
   armeb     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/b6b907a48ae8e8427c3f458bea039be7dbd5d633 |     
  sparc64    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/bcd7dd3b8662e4faf48afa7976e904bb359305cc |     
  mips64el   |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/6dfe8c94dec7f9180f0f6e3e1517ff854de51391 |     
  mips64el   |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/cdfc4f50067c132fca234c0c5c6bfd21e23fc962 |     
   mipsel    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/f864dca0f5e1afe05755e49c5f422584f8a9deb9 |     
 powerpc64   |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/2888eb4514bd217761e677597e8b94b0340f8d40 |     
    arc      |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/40b788e91bf6f95b1961bbef6e5b9b42e2b5cefc |     
    arc      |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/b2d7cbe031ad9073fe4c2132c35943288030527b |     
  mips64el   |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/72a29eab555d19ac15bef191835c548d80204551 |     
   s390x     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/5735941bddfdb7b28b7e420d0d16142130314365 |     
microblazeel |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/72db0f892211b5a65be0319d9afc63b238dd7411 |     
    or1k     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/af8255091d20359438c80f2754f649dbe362a25c |     
  powerpc    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/fcbc51c203242a6506e9c113a841c50144159872 |     
   nios2     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/a60bd0f60004b3c46105a06eadabff547eb1c481 |     
  mips64el   |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/5707d12dd48e494a4445b40aee5873e5e766a4c5 |     
    arc      |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/3daf299e3b128577b5f4f85832a329dc9f347935 |     
   mips64    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/0ffb9321395d10235a4ba3de8f76305844a7583c |     
   sparc     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/3a54e3e3a806617ff3a990eddc81ff9950c859a2 |     
   s390x     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/a2d0e600b156bce99c129886476d2cd6e9ed602c |     
  riscv32    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/9c0d4275e4815c8b53d0f0088204c4624887d6a8 |     
    arm      |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/595f62b83c914d650a099dedbcbf48021c0a4367 |     
    sh4a     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/c5afbe183c0b847d91acdcc247ac2795dd323bcb |     
   sh4aeb    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/9a864114ace43d70478e323745e1fbd14f6315d7 |     
microblazeel |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/6429e50f19620febd4c777def70728e316a27fa0 |     
  sparc64    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/7daaeda1b98738f22c0b61f3d20caf9394c3aace |     
   sparc     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/d1cc6be99c7738fc89d9034843e44ddff731dbfc |     
  powerpc    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/aabe925c2820114ce002c14a82752f95c6cfdbc0 |     
    or1k     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/13ab4979acefc8f6449e2e7694d3043019e92051 |     
   xtensa    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/5235e4dcd01836e15ac5fd8a0ed310d4a3bf1571 |     
 powerpc64   |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/162110f8801f806413f6742f630bb263aff9a6de |     
    sh4      |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/9db66ecb21c4ae1be42d532754e342111499a2cc |     
 powerpc64   |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/f1105cdb69e4a9b50ee9d8ad41bd03d52ef4f1b7 |     
   sparc     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/97f0d0bd06a0e16689e2aea03f15195896e5474d |     
  mips64el   |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/fb3b0c875b9b190c800ac76f470fdc515ec327d5 |     
  powerpc    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/3c5f502eb615b770c2d6fb6fb66d9b2b3289880a |     
   xtensa    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/3811e9e2ce7785cbc9671ed1d77a3b224bb502e7 |     
   sparc     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/353b930d3523567d86e1a03ce90099a4a59887ad |     
   nios2     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/2f9bdeb3ea7cf7ea643d14d0b331ee7e4c92678b |     
    mips     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/5f68f5b4334dfd51ab1aafa6ead77ec4a01614b8 |     
   nios2     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/f992886f6e52bee548686964d40346a571ee45bb |     
   arceb     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/7d4374da1fa1ba4f990ef670111aa8ba56e1e9ee |     
 powerpc64   |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/bec4c29595e1ceb1298c0362761b4fb54b40ab50 |     
    sh4      |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/0898b59ffca8def77ab44cbd558dbacd4550f366 |     
   sh4eb     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/192ccc110204d705c6ab6ed3b51d95b7d94e5d11 |     
   sh4aeb    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/c8ace86a67c6cd6902c3ad5eb02e18dab65956bc |     
  mips64el   |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/0eb0b82249d3378d8096868f9b029471f74eeb87 |     
   armeb     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/2d8114b1528b777b96c798b37c5c8db7ef126bad |     
   sparc     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/ccce704cb56ab89f759b37df78d60539032a5f2e |     
   arceb     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/6a7123144a501ef50a28024f0ac73f3bc5fc0968 |     
 powerpc64   |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/7178b0c63abec28128139782e5939525c152e184 |     
    arc      |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/22ff1f84d24dc450cf4025b3b1ab8cf16b83f960 |     
   nios2     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/45cfe476e6ac09bd7222da4befbb876b49762f75 |     
    arc      |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/788eeb7e75bfd78d2f3d34dc9d0774097d9970f2 |     
    sh4      |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/d3076d00a54a2e09e11e243b5d53ab9cf656c1bd |     
   xtensa    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/8ad5e275b8d774c3eb1b7d81a4ba3d1f3e670b6a |     
    m68k     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/d99d0251b511b6348d4c4d0b06a1785670984355 |     
    or1k     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/ebaf42e73a65cf725c833a87c18ed3efed629c5d |     
  sparc64    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/3919dd74b21121da6fdc48d01932394d45e7609b |     
   mips64    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/92db429789072382de5011743a12c7d1b45444b7 |     
   sh4aeb    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/b5d61e3437b77ab82670c9747780388bd796bc89 |     
  mips64el   |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/b4eb29c951ef6b61aee516784bfc736f16b5de98 |     
 microblaze  |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/459cc5b0d9ef50902fd30c06b24be2747e1e6b24 |     
    m68k     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/c2f3f401bd48a6091a4239e535528475e40ee2a3 |     
  riscv32    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/e8f10c0f00ad590facf5475e5dd06c1fc684e35d |     
    or1k     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/6e620936a17f519b6eb63bddbaf6932031d78aaf |     
    arc      |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/255fc0c33cc24e31cd404306298675805c8bce1a |     
    or1k     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/62ac37cfc467c5621bf11ccf09d71f785297da0c |     
    sh4      |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/734483a1619bb4b7b768a2a42186d49e195ab9b7 |     
    sh4a     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/b816758248a4f5b95a1cea7f94bc674eeb9a9691 |     
  riscv32    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/a718690f8e12315ce231eb6caf783c74a287a1e3 |     
   mipsel    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/a60e1939f5a483b9f660cdba69ed50cc73ea5c41 |     
 powerpc64   |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/d03ca0700b805dcf97266e9a3d3db2e67203145d |     
   nios2     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/5827227e3588588d31d46827020ee55f8d035904 |     
    or1k     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/99c6821fe5845e67a97ed82e5d31a535fc99c729 |     
   mipsel    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/b1c3be9a4b1ad053767aae38c85786b4f9a78e09 |     
 powerpc64   |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/758ed03bc0adf65cba997e943c91e3c29d443ab2 |     
   sparc     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/d3fe81ef847b1d238e4247b512ece0b2251b7822 |     
  mips64el   |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/afcb5153257c44ccadaee691d8da9d886aa3cd9b |     
  mips64el   |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/0f0f1e25ee02e6add3f11f9c42998024dc9f03c8 |     
  powerpc    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/d789071df342853e8f873d621bb32858babe5408 |     
  mips64el   |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/1c846583c1d381893705febc96293d8ba607bdac |     
   nios2     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/d65a084cc1789291607cb465caca2d17b71959cc |     
   s390x     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/32da30c6aec33365e117c6fdf32cdf30abaee161 |     
    m68k     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/20af4b224a42a5d55a9490283995fb34f560ec41 |     
  powerpc    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/3d42521d85944eeb16ec8aed425903697136a6fa |     
   sh4aeb    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/6c5280b34c74082966ad8d6845e9ca160b125bd8 |     
   s390x     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/6b1fece72fb248cf31775d716a236b9e3316a3ef |     
   mipsel    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/dcf33f10ae38d3da4691f4c4a1e39d49463c1237 |     
microblazeel |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/d2ad3767af29e618184a082765645305d8fc981f |     
   nios2     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/3235a86d3468fed7b5231181dcd765d56f3e1728 |     
    arc      |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/238bdb22267325c9c492c93a20b30f36df7b78da |     
  sparc64    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/74fc7b64036e9effafbe0888780d47854e444960 |     
    arc      |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/d14aa70521d6ecc31240d03ad4b442e1f9cd95aa |     
    sh4a     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/0edf30baedfdbaf61fad50857280a0bffb9918c8 |     
 powerpc64   |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/b5050f648a861f71fad1100bfefab6e2889355ab |     
   mipsel    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/071b673c93db1ea641b492fb37bb3fc06f3f98e1 |     
   arceb     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/70ffdffc6eb1fd2be3c77580102065263f2e4420 |     
    arc      |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/9038724b5137ef154702e2cddc35dce80084ed57 |     
   mipsel    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/7136bdcb7b4edae7b4fb454fa3ff7ad8410c6626 |     
   mipsel    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/13ae15251bae76b56bca8e05e84944e91915a831 |     
 powerpc64   |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/13ecf29102edd0718302c3fc5d12fff5ae2c48c8 |     
 powerpc64   |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/201210ce8c7ce084fab5afce4ed3514d617b00fb |     
    m68k     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/4a49b98e518c5c32964e5e30347fcfc8f5585402 |     
   s390x     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/8a4e26f894663bd14e3cb07f9e7d9ead74c3e032 |     
  riscv32    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/015f077527fb183367c39570f1f92f5cf84aa2f1 |     
  riscv64    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/73a6cd206bade0ad32c912cca9a29636f2bca4df |     
 powerpc64   |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/8d2f63954297a65094f8cb121a525e3f8c668318 |     
 powerpc64   |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/36da8dac07cfbb4ae8da15f8f59824366dc85b29 |     
 powerpc64   |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/0e8f97a5aa0db1f94b648b5a0052b4bbe6a2d748 |     
   nios2     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/d0b370949a7f4571a5d69119a38296be29cc2ab5 |     
   mips64    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/b61e15b134e2e9bd529980ba14fd05d4fb96eda0 |     
   arceb     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/9ed63c7996e14abf47f78293aff6b581084ac2f4 |     
 powerpc64   |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/0980ab84d8617091680ebd81615cbbb29ee4d45e |     
  riscv32    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/492bf3fd4dc181891904b30921dd953d670183df |     
  riscv64    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/64872bd745903a4b06f3e576ac07979635f387b9 |     
   sparc     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/3313044d40a9930960e71734eaa4bc53be9ff01c |     
    sh4      |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/34bb10c6ff8e214b12b5ce0cb9f1df76f2e97e10 |     
   armeb     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/f76f2dc798b727eeb783c841f10768b935661372 |     
   s390x     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/9d21171500b88d202f356c3a149d50a6ca937f3f |     
   arceb     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/7e8a61fd8a5b000448cac787ae231c03f56b58c4 |     
    or1k     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/c925df97fa0aff9334bfb3ff2cf97b7ab5bc9d9e |     
 microblaze  |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/27b8aac7471a342b971424d48baadfda54f6893f |     
    or1k     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/438b31fd43cd0dfd0cbe99090e712af4c9e194aa |     
    arm      |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/a859b9f936981c81bf2fba3323f288cac1d9c9da |     
    i686     |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/70d6734a87795ba4a5a712f219f8f74f639e9744 |     
   sparc     |          libftdi1-1.5          | NOK | http://autobuild.buildroot.net/results/ea818db4ac57c966ab98f0967464fda9fcd44d86 |     
    arm      |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/777b5780cb87d29c1ebb87e676bc3b65cb701909 | ORPH
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/df2c075c258a575c868a45ea64ab6c33f87ddf8a | ORPH
    mips     |         libglvnd-1.3.2         | NOK | http://autobuild.buildroot.net/results/fb5aafe5e70afffb2506cf2dfbf185ff2753f5f9 | ORPH
   x86_64    |          libnss-3.79           | NOK | http://autobuild.buildroot.net/results/e915e2229a77706fe672a85dc4c3b8d8a547689f |     
  powerpc    |       libopenssl-1.1.1p        | NOK | http://autobuild.buildroot.net/results/130d99b6ff392ea8710ed7949fa1b6a24d887e67 |     
   sparc     |       libopenssl-1.1.1p        | NOK | http://autobuild.buildroot.net/results/f489627c9aa3f0eee39fd3ecb737a6005abaca19 |     
   arceb     |       libopenssl-1.1.1p        | NOK | http://autobuild.buildroot.net/results/a44cdd61b6bd10cd4c88ccea969abc283aa0f67b |     
microblazeel |       libopenssl-1.1.1p        | NOK | http://autobuild.buildroot.net/results/279711bca93457793f9fbff813d4570949c45b9c |     
   arceb     |       libopenssl-1.1.1p        | NOK | http://autobuild.buildroot.net/results/fb9ad3b1b7b52041d93f3a973364bdb4ec9a10da |     
microblazeel |       libopenssl-1.1.1p        | NOK | http://autobuild.buildroot.net/results/096b9aa478818337733a00caa01fbebc2ad6d7ae |     
   arceb     |       libopenssl-1.1.1p        | NOK | http://autobuild.buildroot.net/results/58234e114228fe27b8391125f157f2595d3bb65b |     
    or1k     |       libopenssl-1.1.1p        | NOK | http://autobuild.buildroot.net/results/e89980cbb9422b5b430d6b4a2cb751692664e637 |     
    arc      |       libopenssl-1.1.1p        | NOK | http://autobuild.buildroot.net/results/f5bf4c79376f9296000647db3e524faffec8abd0 |     
   sparc     |       libopenssl-1.1.1p        | NOK | http://autobuild.buildroot.net/results/eca53fdbaabeef4b461364b38e161431af1a0f96 |     
microblazeel |       libopenssl-1.1.1p        | NOK | http://autobuild.buildroot.net/results/ea505cf1a7c7c4fa3c791bfdc316153a8a619579 |     
 microblaze  |       libopenssl-1.1.1p        | NOK | http://autobuild.buildroot.net/results/425e2d8699d3e0d76cdc549ef439b67c601ca884 |     
    arc      |       libopenssl-1.1.1p        | NOK | http://autobuild.buildroot.net/results/f261bd0cf14643a79f17a46c2c5cbd7cc0fd33c1 |     
    arc      |       libopenssl-1.1.1p        | NOK | http://autobuild.buildroot.net/results/926b54a3c0393dda2d6cd506c465b5164596c3f0 |     
 microblaze  |       libopenssl-1.1.1p        | NOK | http://autobuild.buildroot.net/results/24cd1bdb96c28e3f66fb822eb92ba68d93cf69d5 |     
    arc      |       libopenssl-1.1.1p        | NOK | http://autobuild.buildroot.net/results/6bbac68ac6a44ed4e2b2b139398ee608e21e19da |     
   sparc     |       libopenssl-1.1.1p        | NOK | http://autobuild.buildroot.net/results/c4a1ad30d1cca05bea9c59fefdce6205a55d3f9c |     
   xtensa    |       libopenssl-1.1.1p        | NOK | http://autobuild.buildroot.net/results/99e4a7413f180faf1cd52fc317cd675ca6035a2a |     
  aarch64    |       libopenssl-1.1.1p        | NOK | http://autobuild.buildroot.net/results/a81de4ffab31371a516474f4a9b853a43da101fb |     
   xtensa    |         libressl-3.5.3         | NOK | http://autobuild.buildroot.net/results/b23d0949e25517051fcb000efd422cb44e59131c | ORPH
    m68k     |         libressl-3.5.3         | NOK | http://autobuild.buildroot.net/results/7a8f9aa513e30bb169d8cef59a666a6c61ff6087 | ORPH
 microblaze  |         libressl-3.5.3         | NOK | http://autobuild.buildroot.net/results/737da821b0df8017560824e977a4d6d35f853167 | ORPH
   sparc     |         libressl-3.5.3         | NOK | http://autobuild.buildroot.net/results/febc6fc45f4278678a73d07a356b4fce195d729b | ORPH
   arceb     |         libressl-3.5.3         | NOK | http://autobuild.buildroot.net/results/ee264ee2a9acaaac3e5e8f0015469f08f6db8b48 | ORPH
    mips     |         libressl-3.5.3         | NOK | http://autobuild.buildroot.net/results/996c9378d928ee78d3922edfba2c27e1197f4801 | ORPH
    m68k     |         libressl-3.5.3         | NOK | http://autobuild.buildroot.net/results/bc693bb23fb49c13eb9f5f6aa72d4140f498cfe8 | ORPH
microblazeel |         libressl-3.5.3         | NOK | http://autobuild.buildroot.net/results/d007f25b7e898fbbfe8c5a4d6bb3177bf41fb404 | ORPH
   sparc     |       libstrophe-0.12.0        | NOK | http://autobuild.buildroot.net/results/cc6b4569b6979ab8fbe0b57035238c90370578f2 |     
    mips     |  libtorrent-rasterbar-1.2.15   | NOK | http://autobuild.buildroot.net/results/280a6809eab6bf3532407892e6163696f7e6f756 |     
    mips     |      libwebsockets-4.3.1       | NOK | http://autobuild.buildroot.net/results/5b3a93e1ebf2766529af3fad2b58e5f9fa940492 |     
  mips64el   |      linux-5.10.115-cip7       | NOK | http://autobuild.buildroot.net/results/907d3b5e591e030c15d55d40936bace026926273 | ORPH
    sh4a     |      linux-5.10.115-cip7       | NOK | http://autobuild.buildroot.net/results/44ad5a93612d214406aee0c357a40f2af1a04c38 | ORPH
  sparc64    |      linux-5.10.115-cip7       | NOK | http://autobuild.buildroot.net/results/dfd680a56f2eb45be186452f85fc342fe4ce5f18 | ORPH
   s390x     |         linux-5.17.13          | NOK | http://autobuild.buildroot.net/results/64e43a04c2d76f63ee764a0e9020685cc001dfc7 | ORPH
    mips     |         linux-5.17.13          | NOK | http://autobuild.buildroot.net/results/a703be0ca29d015bd9a9def13f68a17c9d2134f5 | ORPH
   mipsel    |         linux-5.17.13          | NOK | http://autobuild.buildroot.net/results/e2f5619c9a7c8e9d63217248a80599293d89f267 | ORPH
    m68k     |         linux-5.17.13          | NOK | http://autobuild.buildroot.net/results/f3c92fc870a64b8ec186eecdd3a240a5e0264c9b | ORPH
    mips     |         linux-5.17.13          | NOK | http://autobuild.buildroot.net/results/98f680e251611836de55630b455baa9a116dab37 | ORPH
    arm      |         linux-5.17.13          | NOK | http://autobuild.buildroot.net/results/48a045cdeb572e629406618a973e5aba36246e94 | ORPH
  aarch64    | make: *** wait: No child pr... | NOK | http://autobuild.buildroot.net/results/b970509f9c832a82d6eba4388776beb146c66634 |     
   x86_64    |        mariadb-10.3.35         | NOK | http://autobuild.buildroot.net/results/d7c918eda6afa6f88a97eeac4cba143e1183895f | ORPH
 aarch64_be  |         minimodem-0.24         | NOK | http://autobuild.buildroot.net/results/14655158cda174ccfdc1594fbe0368e67a0cb8c8 |     
   x86_64    |         minimodem-0.24         | NOK | http://autobuild.buildroot.net/results/207d33130be342679681f528659b2c820c3e34b2 |     
    or1k     |           mtd-2.1.3            | NOK | http://autobuild.buildroot.net/results/4c2170239eb2b60aaaad024b51172d9cb3d01542 |     
  powerpc    |           musl-1.2.3           | NOK | http://autobuild.buildroot.net/results/9f5d3edbe73c4bcd055c559bb1e6881dd1fcaea4 |     
  riscv64    |          ncurses-6.1           | NOK | http://autobuild.buildroot.net/results/b2100e7349f66d940452426422be196322d65a11 | ORPH
   x86_64    |         nodejs-16.15.0         | NOK | http://autobuild.buildroot.net/results/9a77f58e2a4f8153e1e92cf6790c2448e6a820ae |     
   x86_64    |         nodejs-16.15.0         | NOK | http://autobuild.buildroot.net/results/8286d9d21d560facaaa67f0d9b45b9e2432d370b |     
    or1k     |       ocf-linux-20120127       | NOK | http://autobuild.buildroot.net/results/ac69daee4291b47f7e765b12dc585946bc369380 | ORPH
   armeb     | on2-8170-modules-73b08061d3... | NOK | http://autobuild.buildroot.net/results/a456840f787bdc85d00f7c6786eee347ce3af5d7 | ORPH
    arm      |         opencv4-4.5.5          | NOK | http://autobuild.buildroot.net/results/8dd8c7ce6bc5a69011fb87aa0a3febe25f27b3bf |     
    m68k     |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/a393346ebc41068576e38fcd7a95c8577be705b7 |     
    arm      |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/c1e8bfbe8169fbd09641a7175e2f0eebe0c6f8c1 |     
    sh4      |           php-8.1.7            | NOK | http://autobuild.buildroot.net/results/1a6aadf2659bf07e29e713d3716ee7461e4fdbc3 |     
 microblaze  |            pigz-2.6            | NOK | http://autobuild.buildroot.net/results/df53023b292aaca0f5bdec59882212159aed9b06 |     
  powerpc    |           pimd-2.3.2           | NOK | http://autobuild.buildroot.net/results/bba0864a9c6bdd5375b2b1720d58604ca69d0b24 |     
powerpc64le  |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/c2a3ea9d403b3dfaedd6b9be2bbf1daffe0c3d2d |     
powerpc64le  |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/7c5884d5f1926a7223f7e49f4f6076da522277c5 |     
powerpc64le  |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/75b1f1642dc4c13215fa985b30824c2f7ca574ff |     
powerpc64le  |      powerpc-utils-1.3.8       | NOK | http://autobuild.buildroot.net/results/ba3e8f8fcf732171e7c2d0e1396fc2903aa27ec4 | ORPH
   sh4aeb    |           pppd-2.4.9           | NOK | http://autobuild.buildroot.net/results/9655e314baa02fb093e23532f0f069066ac6dde5 | ORPH
 aarch64_be  |           pppd-2.4.9           | NOK | http://autobuild.buildroot.net/results/a4c042905ff004bfd482fd80e0fc73c77381e3fc | ORPH
    i686     |           pppd-2.4.9           | NOK | http://autobuild.buildroot.net/results/15e692da34bb23c1fdc96ec01348518e11c5cb6d | ORPH
    or1k     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/349f3e9b1c13be8c3a1c33392dd911effb110eb2 |     
    sh4      |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/237655c1e7c453e55df1445fd7b6699b474ec87b |     
   xtensa    |       python-ujson-5.2.0       | NOK | http://autobuild.buildroot.net/results/276ec30fdeb2abb1d749af35b3770903847684c6 |     
  aarch64    | qt-webkit-kiosk-a7720e50f2b... | NOK | http://autobuild.buildroot.net/results/3cc36410d37a3c18325f82184ba43f38a5d327c5 |     
 microblaze  |           refpolicy            | NOK | http://autobuild.buildroot.net/results/524178ee1e02f003706730fedd8c185c41c1942b |     
    i686     |           refpolicy            | NOK | http://autobuild.buildroot.net/results/486c066e51b4da01194afc09f87c155a9cc1af8b |     
   x86_64    |           refpolicy            | NOK | http://autobuild.buildroot.net/results/00aca3a6cd8659d007e50402d2260eaebfcac67b |     
   mipsel    |           refpolicy            | NOK | http://autobuild.buildroot.net/results/b529d31f3849336e0c697a7626aad1448c2a952d |     
    arm      | rpi-userland-14b90ff9d9f031... | NOK | http://autobuild.buildroot.net/results/64a9b490a8d008942d90f7de5a2d952aea7c9983 |     
   s390x     | rtl8189es-39c17661136da48f8... | NOK | http://autobuild.buildroot.net/results/13422579b76550f4390e34290b35558d8eee5733 |     
 aarch64_be  |            sbc-1.5             | NOK | http://autobuild.buildroot.net/results/4d62d71637f89fd45038da591020797638808eaf |     
   sparc     |            sbc-1.5             | NOK | http://autobuild.buildroot.net/results/b9309a72b4235f806d8142b1df4b5e2d4270678d |     
   armeb     |          sdl2-2.0.22           | NOK | http://autobuild.buildroot.net/results/2cb11b1f3c013c1f49e2b5383a11ba3f1db6a24c |     
microblazeel |    shadowsocks-libev-3.3.5     | NOK | http://autobuild.buildroot.net/results/fa7994b8a827c88ffd69ee2768ecfb235e9183f2 |     
  sparc64    |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/8b101cb689e48b3a3933c57e11840ed38a08dd5c | ORPH
   armeb     |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/d244a9f8a4872b846d92a01c41ead58beda62db8 | ORPH
    arc      |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/9d59850157d6011df8fb7aa28e7bffbd9988a1a5 | ORPH
 aarch64_be  |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/95500d2ef294ffb3468274d8e74f54392203b5e7 | ORPH
 aarch64_be  |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/f0f04546ffbddcfb8c91d04b8d3c3c4b78a731c7 | ORPH
    i686     |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/f4dce97c6552e02c64de4c6aa8c2032a7963be4b | ORPH
  aarch64    |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/1fe9a535d6e71f9d6bf884b048995705eafceac5 | ORPH
   x86_64    |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/0aa9021d8a27221942490f61c20f8174ce14a22d | ORPH
   s390x     |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/9a6cba912d2d091c2ee1eb735f8aaee2a2400810 | ORPH
    arc      |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/8e0bb17cb09b72737790f3c5c6dda5164c498a48 | ORPH
  aarch64    |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/ebba91e5a3f785dcfc0c25168e0f23c196926ee1 | ORPH
 powerpc64   |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/11cf0fd522375a7b86c092d3d2ee5d32959e369e | ORPH
  powerpc    |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/08cc53a60d6696b61658cb84621bf8e6cd6274e0 | ORPH
 aarch64_be  |         sudo-1.9.11p2          | NOK | http://autobuild.buildroot.net/results/2ea692773c392a5096d59a3255ef78ef23fd0bf6 | ORPH
   sparc     |        swupdate-2022.05        | NOK | http://autobuild.buildroot.net/results/a3c82208330457793c50aa710b536858d2e9fd9d |     
microblazeel |        swupdate-2022.05        | NOK | http://autobuild.buildroot.net/results/3033ffa93c1d47620a8aac206cb44ece7feda8af |     
  riscv64    |        swupdate-2022.05        | NOK | http://autobuild.buildroot.net/results/677f9785cc0d8b11c0489abf39aff345b95c348a |     
  powerpc    |        tcpreplay-4.4.1         | NOK | http://autobuild.buildroot.net/results/153dae802499675ef24dd5ea248c368895c05dbf | ORPH
microblazeel |        tcpreplay-4.4.1         | NOK | http://autobuild.buildroot.net/results/3c9500fdfc167b8bc1104fee4b88bb77566dc935 | ORPH
    or1k     |          tor-0.4.7.8           | NOK | http://autobuild.buildroot.net/results/85b613bd6072b39d31c8cc5d145395192f10174b |     
  riscv64    |          tor-0.4.7.8           | NOK | http://autobuild.buildroot.net/results/1f1f1f7201ca5496a3fe808ca091e5420bae1d50 |     
  riscv64    |          tor-0.4.7.8           | NOK | http://autobuild.buildroot.net/results/f539ba9996c5162073ff0f9e833a14d9e896f3ed |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/a18f3b3a5d9a047aab133bf2a244c02a4661bcb8 |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/523e8ed5105f0fea47c1e97f8aafada3a2647d1a |     
  powerpc    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/31b243800e9e88cbb9214d71a1a3fec10b00977c |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/1e40862e5fd4de5575c5a10cba0b6cbf26c2ae46 |     
  powerpc    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/53d5170b00e1910c4dc14b8f74d73a823829b60a |     
  powerpc    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/68665c522b6188a961ae291f4e1cfc581421e07f |     
    arm      |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/577c93d7d26bf53294a1de862ae7a141b3e3580c |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/8573a9790fe15490d9e5e201248c1a15cc221593 |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/224e6c66e358b9a6337eb945270f17778a5bd33e |     
    arm      |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/21b0b25477d6d7049dd697fbc3b1efd9ccb904aa |     
  powerpc    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/8630437b1612ed31a9129192ac689e3b21ab3a72 |     
  powerpc    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/ad8d556416564cd65b599869f3ac0706e616598a |     
    arc      |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/0519e042434c1165814a0599a17e3f6fe692660f |     
  powerpc    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/68b3eb64a991c2f063502558f7242be372dd95b7 |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/92cf3e8e01b7e1fb04efe8f44c4cbadbc9ada0f7 |     
  riscv64    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/4cb4c8bfb9028960992a7b7c42f40eb5a3d80f5e |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/46d64686d0c9504456137fbca4819ff0577de00e |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/fab96ee545f985f20a9cede694030b6859e3c543 |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/ff0e6e6c18f0ca9409dd7b2ab70e7f34444975b6 |     
  powerpc    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/e339e3cd87c061fa2c5d58ab4533693b00355240 |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/0de1a409c3c25c53402fe77f6ffc3398bd9beb2c |     
   s390x     |            unknown             | NOK | http://autobuild.buildroot.net/results/86df9052f75c21e274550433dedb514af5097736 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/5e4cc181daa600e63caf1d6746144a89e326593e |     
   s390x     |            unknown             | NOK | http://autobuild.buildroot.net/results/e1fd5ce427d59c2067c1b1e2be1ecef44127ee00 |     
 microblaze  |            unknown             | NOK | http://autobuild.buildroot.net/results/148677e32f6ee0861794b560518e523ba06ef448 |     
   nios2     |            xenomai             | NOK | http://autobuild.buildroot.net/results/6971c2951c7e878eab7550d71889c39b9b417358 |     
 aarch64_be  |            xenomai             | NOK | http://autobuild.buildroot.net/results/acab63d917e3d3b0e3622bdff4b1addb387eb4dd |     
  riscv64    |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/97d7640ab135c3f057f664d374c6270ed854990e | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/3e0e8b6221367d0628bdd1a9cc900df83619e494 | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/7773eb93e427a91173906b961571483393d17966 | ORPH
  aarch64    |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/ed79b889e5872bf8c4d18d3d369fb43dc9e57801 | ORPH
  riscv64    |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/26529d8e3bb215ce24863fd08d0f36202c8c9313 | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/6cc1a2f7ae8dd43af2bf6feb2336d6ca04932a01 | ORPH
  aarch64    |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/ec4da50c70d91d8e106062692e214bc0c4ddefb4 | ORPH
  aarch64    |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/039532ffcd7deac4826660761c66efbd5ffb9d8f | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/db0439458b36ae07852defbaf599fa62b904bcbb | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/e45405d2a8665dd1488b3bb638537aca6750b8af | ORPH
  aarch64    |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/8326eebff58c962bc3709545006e522efc96eeb7 | ORPH


Classification of failures by reason for 2022.02.x
--------------------------------------------------

google-breakpad-7515ab13768... | 2 
                    bat-0.19.0 | 1 
                    bird-2.0.8 | 1 
           host-nodejs-14.18.3 | 1 


Detail of failures for 2022.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/45243252967da8f3bd0d3fcafcd35d82ce8b6c4e |     
  mips64el   |           bird-2.0.8           | NOK | http://autobuild.buildroot.net/results/3cf947a89e4356df969dbf1b78dac2403707a53c |     
   mipsel    | google-breakpad-7515ab13768... | NOK | http://autobuild.buildroot.net/results/dca11b1f5288ca979d1e0540f4ebb4aeace08413 |     
   mipsel    | google-breakpad-7515ab13768... | NOK | http://autobuild.buildroot.net/results/2fe8dc8101b2f62b00cb9f600e07c5c37b7e53a8 |     
microblazeel |      host-nodejs-14.18.3       | NOK | http://autobuild.buildroot.net/results/827ce43d8dfe75e0711f11aa213905d45f8f6058 |     


Classification of failures by reason for 2022.05.x
--------------------------------------------------

           libfreeimage-3.18.0 | 3 
                       unknown | 3 
                 zlib-ng-2.0.6 | 3 
                busybox-1.35.0 | 2 
                     frr-8.2.2 | 2 
host-pahole-73383b3a39afe86... | 2 
             libopenssl-1.1.1o | 2 
              swupdate-2022.05 | 2 
/home/buildroot/autobuild/i... | 1 
              containerd-1.6.2 | 1 
                  exempi-2.6.1 | 1 
                     gmp-6.2.1 | 1 
              host-delve-1.8.0 | 1 
              host-rust-1.60.0 | 1 
               libglib2-2.70.4 | 1 
                libzlib-1.2.12 | 1 
                 linux-5.17.13 | 1 
                  ndisc6-1.0.5 | 1 
               protobuf-3.20.1 | 1 
           python-orjson-3.6.7 | 1 
               tcf-agent-1.7.0 | 1 
                 uclibc-1.0.41 | 1 


Detail of failures for 2022.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv32    | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/f80accac06036656b552a32906a05b9461a8d377 |     
  riscv64    |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/da5a039f55c87ebe1e783d73bad9994b697687f8 | ORPH
  riscv64    |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/76767f738ce6ff0e7837dff750cf1cea0d8a52aa | ORPH
   x86_64    |        containerd-1.6.2        | NOK | http://autobuild.buildroot.net/results/8bf5052f1c0986e03c919f2b6557903fd9d38a33 |     
    arm      |          exempi-2.6.1          | NOK | http://autobuild.buildroot.net/results/30fbf63d28d881a2c133e4c21062691adff6e349 |     
   xtensa    |           frr-8.2.2            | NOK | http://autobuild.buildroot.net/results/88fcbb7a67445c72818c2f2fdae7459fd73e7d4b |     
   xtensa    |           frr-8.2.2            | NOK | http://autobuild.buildroot.net/results/1c4358cad42d6cc3f116c7988fd228f586982123 |     
  riscv64    |           gmp-6.2.1            | NOK | http://autobuild.buildroot.net/results/043b6840fce6bf80f34e7233e661000410c3e32b | ORPH
    arm      |        host-delve-1.8.0        | NOK | http://autobuild.buildroot.net/results/26a91fe4427b6782bd1b495c869f5cdeac11c246 |     
   mipsel    | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/62280fa75e92b8c31e7878fb373d77166b754ff8 |     
   xtensa    | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/7476bbee0b798062e702a21286f34cd6eb95a329 |     
  aarch64    |        host-rust-1.60.0        | NOK | http://autobuild.buildroot.net/results/406f0f1e06f9710ae3761aafeb49b8d525bb4de2 |     
  riscv32    |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/24c3e0d1ddd36475a6aeb05b42ae698c6a7874dd |     
  aarch64    |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/96b8746609714ed97f0607ce4d82058807b2b5fd |     
    arm      |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/a98513f55093c0fb2f574c724d80d653d7c46792 |     
    arc      |        libglib2-2.70.4         | NOK | http://autobuild.buildroot.net/results/a4a08ae4533b46a469957de39dd927283aab89db |     
    m68k     |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/28eebb7e1c25223712a2800e83a58905cd79a57c |     
   sparc     |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/0aee588bec16cca691fca3aa065c42ff09d39708 |     
    m68k     |         libzlib-1.2.12         | NOK | http://autobuild.buildroot.net/results/0c00489e5630907e739274d05f71d79c2d136bb1 | ORPH
   mips64    |         linux-5.17.13          | NOK | http://autobuild.buildroot.net/results/13ec16484a33d6f373f7997a5835baf2cb088375 | ORPH
    arm      |          ndisc6-1.0.5          | NOK | http://autobuild.buildroot.net/results/e7c7b3c51be6b2bfd3d6b0cc5aa3176e356fbfce | ORPH
microblazeel |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/55ae199b3d3afb0f3facd162484c1825e97f5f89 |     
   x86_64    |      python-orjson-3.6.7       | NOK | http://autobuild.buildroot.net/results/b34244e1195475e7b0acf59869f9c992f8aa4447 |     
    arm      |        swupdate-2022.05        | NOK | http://autobuild.buildroot.net/results/f005a03f2e24add6bcd610024ba5cd9945985a7c |     
   arceb     |        swupdate-2022.05        | NOK | http://autobuild.buildroot.net/results/57f26740014bd6bab56f3ce2981bf745d49be2fb |     
microblazeel |        tcf-agent-1.7.0         | NOK | http://autobuild.buildroot.net/results/7a39b786da689164b5d4aae7b498611ed73475da |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/68f8f9cd6df7bc8e9f3338ebb53ba2f30533c3ea |     
  sparc64    |            unknown             | NOK | http://autobuild.buildroot.net/results/5c98ec144cf6c9d7ce11883695a20a173b0e778f |     
    m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/6e8b17ae6dd11fd8c19726bc89309043e1b414bf |     
 powerpc64   |            unknown             | NOK | http://autobuild.buildroot.net/results/523f00187794bc4dd00e340ee955d8b2e1ec61b4 |     
  aarch64    |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/698f56287991368c0881562d7f0e9757c114388a | ORPH
  aarch64    |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/85dfc82caf77cc21df1beb5195f419a822cb6d73 | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/02cfbf2f1f5c8c50664299a9d294bc6937bb2355 | ORPH



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
