Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3EA3C27C4F
	for <buildroot@archiver.kernel.org>; Sat, 15 Jun 2024 04:55:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CB9334051A;
	Sat, 15 Jun 2024 04:55:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v0PYsJ5fn-ST; Sat, 15 Jun 2024 04:55:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 45B0B400FB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 45B0B400FB;
	Sat, 15 Jun 2024 04:55:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8BB1D1BF21A
 for <buildroot@lists.busybox.net>; Sat, 15 Jun 2024 04:55:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6F20380EA1
 for <buildroot@lists.busybox.net>; Sat, 15 Jun 2024 04:55:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZyVsxpKvQAqY for <buildroot@lists.busybox.net>;
 Sat, 15 Jun 2024 04:55:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C69FC80E5D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C69FC80E5D
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C69FC80E5D
 for <buildroot@buildroot.org>; Sat, 15 Jun 2024 04:54:59 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A4A401C0004
 for <buildroot@buildroot.org>; Sat, 15 Jun 2024 04:54:55 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sat, 15 Jun 2024 04:54:55 -0000
X-GND-Sasl: bot@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1718427295; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=vDy092zEINAbdBtXg/iACcBeKUXlyXYaFeJAOWGtqWg=;
 b=U26BeF3jhtbl9BXKBCQ88BX+mEqxNdpUlWMS2vZFjKlSzYDlLsA0IflEnGdAPwesa+jCp7
 bLGukwOki4expyOWDcLWw61HkyDhiEkJSKeASbJFGvcLyedP2tlBZ1ITr5LM8t/Am4O5Qe
 Sh8S1rz+jrIP7V6OIyV2k3uqnM0SUIP1xhi63dXpNijgYBKz6lnaSO7y+5MYJRZWNItJul
 vzcyGakA2tQKsrBWUK686om+WX9aEjhL4heXTxQIoDVSUzZ8Q3ChwuprVST80HZAETa21B
 ks0RYZTBJT9pgJYXfUdcq1VPxFBuB1B/n2CPKUVlhBXcMmOy2eqbG1SfxctQpQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=U26BeF3j
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2024-06-14
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
Message-ID: <20240615045455.Rnf91TOhWJdYkTAZX3ukaCjedrDxj0CN9ggC9fS94KY@z>

Hello,

Autobuild statistics for 2024-06-14
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  5  |  2  |  0  |  7  |
  2024.05.x  |  1  |  8  |  0  |  9  |
    master   | 159 | 450 |  0  | 609 |

Classification of failures by reason for master
-----------------------------------------------

host-prelink-cross-a853a5d7... | 64
            host-cdrkit-1.1.11 | 41
              execline-2.9.5.1 | 22
ibm-sw-tpm2-5452af422edeff7... | 19
                libressl-3.8.4 | 19
                    mpir-3.0.0 | 17
                   host-go-src | 15
                fail2ban-1.0.2 | 12
host-android-tools-4.2.2+gi... | 12
                  bcusdk-0.0.5 | 10
                elfutils-0.189 | 10
                  ffmpeg-6.1.1 | 9 
                  linux-6.8.12 | 9 
      host-riscv-isa-sim-1.1.0 | 8 
glibc-2.39-5-ge0910f1d3278f... | 7 
aer-inject-9bd5e2c7886fca72... | 6 
check-11970a7e112dfe243a2e6... | 6 
                host-odb-2.4.0 | 6 
host-vboot-utils-bbdd62f9b0... | 6 
                   foot-1.16.2 | 5 
                gnu-efi-3.0.18 | 5 
              libarchive-3.7.4 | 5 
        host-sentry-cli-2.20.3 | 4 
          libcamera-apps-1.2.1 | 4 
         python-remi-2022.7.27 | 4 
                       unknown | 4 
 host-softether-4.30-9700-beta | 3 
                  libffi-3.4.6 | 3 
                    ncmpc-0.49 | 3 
                 openssh-9.7p1 | 3 
pppd-e1266c76d1ad39f98f1167... | 3 
           python-numpy-1.25.0 | 3 
                python3-3.11.8 | 3 
android-tools-4.2.2+git2013... | 2 
                 avro-c-1.11.3 | 2 
     bandwidthd-2.0.1-auto-r11 | 2 
brcm-patchram-plus-95b7b691... | 2 
                    dust-0.9.0 | 2 
                    fcft-3.1.6 | 2 
                    flac-1.4.3 | 2 
            gdk-pixbuf-2.42.10 | 2 
           ghostscript-10.02.1 | 2 
  gobject-introspection-1.76.1 | 2 
         host-gcc-final-14.1.0 | 2 
host-heimdal-f4faaeaba371ff... | 2 
         host-libxcrypt-4.4.36 | 2 
                    htop-3.3.0 | 2 
              libopenssl-3.3.1 | 2 
               libunwind-1.8.1 | 2 
          linux-5.10.162-cip24 | 2 
     linux-5.10.162-cip24-rt10 | 2 
                   linux-tools | 2 
                 mesa3d-24.0.7 | 2 
          python-grpcio-1.60.0 | 2 
           python-zlmdb-22.6.1 | 2 
rtl8188eu-306f3e62cf7cddf8c... | 2 
tftpd-b2b34cecc8cbc18ff6f1f... | 2 
                 uclibc-1.0.48 | 2 
ulog-0389d243352255f6182326... | 2 
                    zeek-4.1.1 | 2 
          alsa-plugins-1.2.7.1 | 1 
                 apache-2.4.59 | 1 
                apr-util-1.6.3 | 1 
                    attr-2.5.2 | 1 
                 augeas-1.12.0 | 1 
                beecrypt-4.2.1 | 1 
                    brltty-6.6 | 1 
                  cairo-1.17.4 | 1 
                 coreutils-9.3 | 1 
                   cpuload-0.3 | 1 
                    cramfs-2.1 | 1 
                     crun-1.12 | 1 
             dahdi-linux-3.3.0 | 1 
             docker-cli-26.0.2 | 1 
              dropbear-2024.85 | 1 
                   duma-2.5.21 | 1 
                 erlang-26.0.2 | 1 
                flannel-0.25.2 | 1 
                 glibmm-2.76.0 | 1 
                 gnuplot-6.0.0 | 1 
               gocryptfs-2.3.2 | 1 
                 hddtemp-0.4.3 | 1 
            host-qt6base-6.4.3 | 1 
                  jack2-1.9.22 | 1 
      libabseil-cpp-20230802.1 | 1 
               libdeflate-1.20 | 1 
              libgeotiff-1.7.3 | 1 
               libglib2-2.76.1 | 1 
                  libnss-3.100 | 1 
                  libsepol-3.6 | 1 
libsvgtiny-ea9d99fc8b231c22... | 1 
               libvorbis-1.3.7 | 1 
               lighttpd-1.4.76 | 1 
                 log4cpp-1.1.4 | 1 
                     mtd-2.2.0 | 1 
                nushell-0.85.0 | 1 
               openblas-0.3.27 | 1 
                openswan-3.0.0 | 1 
              procps-ng-3.3.17 | 1 
    python-cryptography-39.0.2 | 1 
                s6-dns-2.3.7.1 | 1 
                tpm2-tss-3.2.2 | 1 
uclibc-ng-test-0f303c63fab7... | 1 
                ustreamer-6.11 | 1 
               valgrind-3.22.0 | 1 
                    xen-4.14.6 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mipsel    | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/d4ecd04f5be1cf393730943a67f3872a95b1a047 | ORPH
   nios2     | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/045a0a9d7e6cb624fc589fb12c0c488c1d53d206 | ORPH
  powerpc    | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/59b1be8fc460aff5d12ec1a9b58158edaa87a1b2 | ORPH
   mips64    | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/658835d86963d77c9138387a7b7efefce5ed017b | ORPH
   mipsel    | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/a6ebd59f452f9cb93d59c395de493ebf5e331542 | ORPH
  powerpc    | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/13648090fb23bc0fe9cd86f671ac5d848ef3ba75 | ORPH
 aarch64_be  |      alsa-plugins-1.2.7.1      | NOK | http://autobuild.buildroot.net/results/27555acb1675b56e04e4719077099ff0a2afc9ab |     
    i686     | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/9d0a9278e577479ca3ce429834b268582740d85f |     
 powerpc64   | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/e371ea922dbc02b046614d8b3824941222ba4caf |     
 powerpc64   |         apache-2.4.59          | NOK | http://autobuild.buildroot.net/results/0da7db7733366228b30dcdeb309f085df798cf8d |     
   sparc     |         apr-util-1.6.3         | NOK | http://autobuild.buildroot.net/results/cd19bd2a6d214c7296654244031b41df6be35027 |     
    arm      |           attr-2.5.2           | NOK | http://autobuild.buildroot.net/results/7453b64ec182ca566ebbd058cc45aca1be248d08 |     
    arm      |         augeas-1.12.0          | NOK | http://autobuild.buildroot.net/results/efc9fdc60e08a00d5ccdf4be4d7f92b6b6baac01 | ORPH
  mips64el   |         avro-c-1.11.3          | NOK | http://autobuild.buildroot.net/results/4dc3f324c50d6eaef186a3b0c537e1958d9920fc |     
  powerpc    |         avro-c-1.11.3          | NOK | http://autobuild.buildroot.net/results/106aefd04a837ef7af621b09811584be6a2e8cb3 |     
   nios2     |   bandwidthd-2.0.1-auto-r11    | NOK | http://autobuild.buildroot.net/results/4a8bafa1689cc468ecb146fbfaa3d65d4c91085d |     
   xtensa    |   bandwidthd-2.0.1-auto-r11    | NOK | http://autobuild.buildroot.net/results/f9437f8644155c600d562e6d1ee0e96eafcc7d1a |     
powerpc64le  |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/b27d9adbfbfd3e6dbf6adc23b7a5a5568570542c |     
   sparc     |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/52812d96f8589fa9346616d3292986e152654fa3 |     
 aarch64_be  |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/43814331ba90270dd150cbc9d1fb05279502cd2d |     
   sh4aeb    |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/0e7d139d1f70cb82403a9473a58065870633e7e1 |     
   sparc     |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/b2da17e4c58f41b4923843663d2c4d0e8c0dae30 |     
  sparc64    |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/2487ba6dd7361396d2d9ab3c75c4ba5cf5198a76 |     
   sparc     |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/19e416ec101ffa372ea766ea96009b176bc3988f |     
    arc      |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/86e53ef3db44d2072f0197ffee66f9632c04675f |     
   nios2     |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/6dadfa720f2fb698747a8ffe3916f5644f1537c4 |     
powerpc64le  |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/07fe1d6181aacd8349972bd45fc923efb06df302 |     
    i586     |         beecrypt-4.2.1         | NOK | http://autobuild.buildroot.net/results/651e0e31305b1f211071d94ea74f7b7a5793b03e | ORPH
   sparc     | brcm-patchram-plus-95b7b691... | NOK | http://autobuild.buildroot.net/results/b4a8fa02bc47c4c2a567b9df5c0b907c61e2bc08 |     
    mips     | brcm-patchram-plus-95b7b691... | NOK | http://autobuild.buildroot.net/results/5d82ed79c43eb2fe688f75a238ca505e502cf9a0 |     
powerpc64le  |           brltty-6.6           | NOK | http://autobuild.buildroot.net/results/1ccc8db1d46699e542f6105747dadfe3ac98577a |     
  mips64el   |          cairo-1.17.4          | NOK | http://autobuild.buildroot.net/results/855ba1cb8efd40793e2fab057e3906af8f3b0249 |     
   armeb     | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/08441eeed19a55201863a27102acfd9af0dec88e | ORPH
   sparc     | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/faf948808b049435f792b9a6c48bac9496e55fe6 | ORPH
    arm      | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/361cb362f40a77b045cfe9dadecb294f76ac6bb7 | ORPH
    arc      | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/905cc242c7319e10e0c1b089bf829d8a8b3fcd03 | ORPH
   xtensa    | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/aa4b5b37a7c05d2dee30deb451b1a7443daa37b6 | ORPH
    arc      | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/67c258eea2c5095f8a840655120e9b0f161675fd | ORPH
    sh4      |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/5a004832778083c486a36919ac910ddf3e826d94 | ORPH
   arceb     |          cpuload-0.3           | NOK | http://autobuild.buildroot.net/results/881a7be24bcb0928704edbccc71601dc90f40fbb |     
  riscv32    |           cramfs-2.1           | NOK | http://autobuild.buildroot.net/results/f9f1b6bf4602ee1540e230ad33f71b1725b3c636 |     
    arm      |           crun-1.12            | NOK | http://autobuild.buildroot.net/results/c91784a5e865ec6ea0d25285401044c1c6e505c8 |     
  mips64el   |       dahdi-linux-3.3.0        | NOK | http://autobuild.buildroot.net/results/a6960a51a3b3b439c21f5c2743c6e778a44dc944 |     
  riscv64    |       docker-cli-26.0.2        | NOK | http://autobuild.buildroot.net/results/96ca85c044ff2c20ecc2e7ba6af8cbc277bc1558 |     
    or1k     |        dropbear-2024.85        | NOK | http://autobuild.buildroot.net/results/49c0cfc0ca2a3e9d399b78fdbc4525046329d35b |     
  sparc64    |          duma-2.5.21           | NOK | http://autobuild.buildroot.net/results/8888069fe8fe4cb077c03964f1c78c183caabdf6 | ORPH
   armeb     |           dust-0.9.0           | NOK | http://autobuild.buildroot.net/results/675c97c658244199a7814558a766ae2d0476a28c | ORPH
  powerpc    |           dust-0.9.0           | NOK | http://autobuild.buildroot.net/results/1fff67f98309d695c9ec7396ab07d4606fd3f55a | ORPH
 aarch64_be  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/1ba86807b659e336f933d60ea22a77f09929e9be | ORPH
    arc      |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/1eb51fd501b59acfbfc04c114c1755aaa3a0dbed | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/63dbf4e9525f8c1ff3b196e5f0db2702114e27b6 | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/1da071c767e839a4731d59edf532e03242d3fbe3 | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/7511354942d4b3722a0a2797169daefe9735a5bf | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/9174d22c6180ac0d8f44b12cee68766ef47641ce | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/e242e4f586ea9651a9a81cde9285ff96a24b52f3 | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/313354a750365f7abb7b9c8c9e8c65bdd2f02797 | ORPH
   armeb     |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/b55aaf2b1b0552c60ea671fd2fe60292181b4dc1 | ORPH
    arc      |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/cb62943d5ba6ee5fec280710cfe1b3ea64b62e50 | ORPH
    i686     |         erlang-26.0.2          | NOK | http://autobuild.buildroot.net/results/6db27c629061ea72f71d2355df5c9de35c4f0c9d |     
   arceb     |        execline-2.9.5.1        | NOK | http://autobuild.buildroot.net/results/500ab60bbc0cefead27b61679e13606b62ccef07 |     
   sparc     |        execline-2.9.5.1        | NOK | http://autobuild.buildroot.net/results/9c7d163c18abdffa73229b2e1f85a0ad1a37deaa |     
   sparc     |        execline-2.9.5.1        | NOK | http://autobuild.buildroot.net/results/d235b42850244b95fd08ac0020add0492f9292ad |     
   sparc     |        execline-2.9.5.1        | NOK | http://autobuild.buildroot.net/results/837839fecf3e6bf258de53c1b0d90c59ba7d0716 |     
   sparc     |        execline-2.9.5.1        | NOK | http://autobuild.buildroot.net/results/cd2ff5490717f571baf32e5bd5b7f4c4a66b41ca |     
    i586     |        execline-2.9.5.1        | NOK | http://autobuild.buildroot.net/results/c62d2dc94c758de4f703ac91e465af7959f30c63 |     
    m68k     |        execline-2.9.5.1        | NOK | http://autobuild.buildroot.net/results/16486ecf47ac16e2b62c85a881cc7109db7beb29 |     
  mips64el   |        execline-2.9.5.1        | NOK | http://autobuild.buildroot.net/results/749f1a05f38aab9e43e44d712fec71c687374bc2 |     
   sparc     |        execline-2.9.5.1        | NOK | http://autobuild.buildroot.net/results/9a2bc37a4c665a760824508f3a0e69b37e33e294 |     
microblazeel |        execline-2.9.5.1        | NOK | http://autobuild.buildroot.net/results/ca3586bcda598919a1209f9c75056c09ae4ece69 |     
  mips64el   |        execline-2.9.5.1        | NOK | http://autobuild.buildroot.net/results/b76e7d3a178328fb0c73218f8e4b1d07d44aba1f |     
   xtensa    |        execline-2.9.5.1        | NOK | http://autobuild.buildroot.net/results/fa68010184c53038eb668abedea96adca6306670 |     
   mips64    |        execline-2.9.5.1        | NOK | http://autobuild.buildroot.net/results/9f5df9ec7ec68ee7a92c53a618e91a112724a715 |     
    mips     |        execline-2.9.5.1        | NOK | http://autobuild.buildroot.net/results/bdb0a8d65a4fd786e221c8a5dcb05a7db080ba4e |     
   sparc     |        execline-2.9.5.1        | NOK | http://autobuild.buildroot.net/results/78a4288b0fcfbda8d561be6d087f427d8e7d5f78 |     
    arm      |        execline-2.9.5.1        | NOK | http://autobuild.buildroot.net/results/16ccf1b3a9849a6df4835580a520b343046f93e7 |     
  mips64el   |        execline-2.9.5.1        | NOK | http://autobuild.buildroot.net/results/4c08a1ee34f47eb3a74c1adb6f5744206d9d531f |     
   sparc     |        execline-2.9.5.1        | NOK | http://autobuild.buildroot.net/results/d4d1219dfdc2cb0c82950e38a43fc614c94b4bba |     
  powerpc    |        execline-2.9.5.1        | NOK | http://autobuild.buildroot.net/results/29af0ee9d2a113f6f940e52f13430c5eb432c525 |     
  powerpc    |        execline-2.9.5.1        | NOK | http://autobuild.buildroot.net/results/147ee454eaa11fa5032ff58ec37280ec91723afe |     
   xtensa    |        execline-2.9.5.1        | NOK | http://autobuild.buildroot.net/results/cb117c02208e0233c5070c5837476a650cb0990b |     
   mipsel    |        execline-2.9.5.1        | NOK | http://autobuild.buildroot.net/results/9e6300190b7e2e380e3644cf2fd7eebf7e9ef4b2 |     
  aarch64    |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/d972528836916344cfd10f189a3e071d3dd13655 |     
   mips64    |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/b06581c0b222178299a757e58af70bad18f9a052 |     
    or1k     |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/307cfbcf4c8c445fb08ef5ad9dff613cd29dc54c |     
    sh4a     |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/78e757944cbe0b48c611e47e35c1c07688222c51 |     
   nios2     |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/9ebdde059584a19915fc6948fdf89edb257b7496 |     
   mips64    |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/7d5dd101950a8cb7d7b47bc39252593bd7447bbf |     
powerpc64le  |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/196a2acdc712376f4fe7f40a9f753dce0109327d |     
powerpc64le  |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/7793b135d75521812dc9ba9278ac7f03951e1c98 |     
   x86_64    |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/3a14c721c08e42e757f7afa2fed1e3abd190fa10 |     
  aarch64    |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/c24de0971d32a3b946c0043c4ff1d3c8c35dbe4c |     
 aarch64_be  |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/a28f1543e46ce3d9b25656fd05de65730b2e12c1 |     
  aarch64    |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/ccf1568704c4416459a73296122332b52d496d30 |     
 aarch64_be  |           fcft-3.1.6           | NOK | http://autobuild.buildroot.net/results/f8f35feb1070d969b87c1f3bb564ca99feda23d2 |     
 aarch64_be  |           fcft-3.1.6           | NOK | http://autobuild.buildroot.net/results/1511af1bbdec80253f4c30be7fd0d53f1139dadf |     
 microblaze  |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/a2df4a529860b09dd6609050843df3c9b42cbc03 |     
    arc      |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/744cc42caebf34549d3ab79fe17eb56e825c2fdd |     
   arceb     |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/67ccd35bfdc4e0ab4a22f2ec75af037147f41b6e |     
 microblaze  |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/0d80513597c6a6ed8ccceb10ecbc9f02a558672f |     
microblazeel |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/1ef5b62e6f208e3f4c8a19a61f7008c6efe1444b |     
microblazeel |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/1695a7de261b93678f3dc8ea879291dfd5547b26 |     
microblazeel |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/7bcf392b3e273a55865fdba928ba81d2492374db |     
microblazeel |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/980a0c8874743c94884059eafd2fe51b11e0b09e |     
 microblaze  |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/cec134c7f9440a50c7bdefffadaa7dd6fbd91d06 |     
   sh4aeb    |           flac-1.4.3           | NOK | http://autobuild.buildroot.net/results/aa87dd9ef6d0ab5321267df268773d62549082b2 |     
   sh4aeb    |           flac-1.4.3           | NOK | http://autobuild.buildroot.net/results/7cbe28682744da96394b0772337f727eac9be1a4 |     
  riscv64    |         flannel-0.25.2         | NOK | http://autobuild.buildroot.net/results/a821e4391c02d2a4ad3f784e86c45526bab46d24 |     
microblazeel |          foot-1.16.2           | NOK | http://autobuild.buildroot.net/results/6344dc4a844da71958006dbfe2b08cef054107d6 |     
microblazeel |          foot-1.16.2           | NOK | http://autobuild.buildroot.net/results/3d6c5e0a3c40253f2fb675c6462196c37cee04d6 |     
 microblaze  |          foot-1.16.2           | NOK | http://autobuild.buildroot.net/results/f8a36252d2c9f2653ab9adcf0fe18409f1b58a1c |     
   nios2     |          foot-1.16.2           | NOK | http://autobuild.buildroot.net/results/9226fd819960728bee17f4ed7c71126dc5349284 |     
    or1k     |          foot-1.16.2           | NOK | http://autobuild.buildroot.net/results/7bc54c1438c7fa561cdd897f0b45b9f6760d3dce |     
  mips64el   |       gdk-pixbuf-2.42.10       | NOK | http://autobuild.buildroot.net/results/a507279e2e4ddff3a2854e8c7cd28c48b491ea1c | ORPH
  aarch64    |       gdk-pixbuf-2.42.10       | NOK | http://autobuild.buildroot.net/results/17ae735715c1d44255e3b9e4e2ec7b63517f641a | ORPH
    sh4      |      ghostscript-10.02.1       | NOK | http://autobuild.buildroot.net/results/66f970dcd9097f40290ba8441dbaa71f84a0ab58 |     
  mips64el   |      ghostscript-10.02.1       | NOK | http://autobuild.buildroot.net/results/1fe2fcfb19c5ad8f2a2dac9012274380c23aef57 |     
 powerpc64   | glibc-2.39-5-ge0910f1d3278f... | NOK | http://autobuild.buildroot.net/results/90cab500da2f4936b1a725d170a40565d3787f55 |     
 powerpc64   | glibc-2.39-5-ge0910f1d3278f... | NOK | http://autobuild.buildroot.net/results/6e4b2345dce43c1b0a8ec9bad87cb96b010b55c4 |     
  powerpc    | glibc-2.39-5-ge0910f1d3278f... | NOK | http://autobuild.buildroot.net/results/20071078d20a7ad29b05fcde48755af38ffcbe31 |     
 powerpc64   | glibc-2.39-5-ge0910f1d3278f... | NOK | http://autobuild.buildroot.net/results/cb43ae93437c06d61e6ffe46e74f66faef89decb |     
 powerpc64   | glibc-2.39-5-ge0910f1d3278f... | NOK | http://autobuild.buildroot.net/results/71609d90d724f7e9718614bd7e4ea34024ced4c7 |     
 powerpc64   | glibc-2.39-5-ge0910f1d3278f... | NOK | http://autobuild.buildroot.net/results/ff485bc29fc3f38a60e841628f4be371b812b9e9 |     
    arc      | glibc-2.39-5-ge0910f1d3278f... | NOK | http://autobuild.buildroot.net/results/8e66e0e531cae137d5cfe459ff3e1a55e151df23 |     
    or1k     |         glibmm-2.76.0          | NOK | http://autobuild.buildroot.net/results/8b858e633e2672b8860bf0f6cbba4a97950bf02f |     
 aarch64_be  |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/b33b0aca0bc83678f225563f5b1aa4913a69c281 |     
   armeb     |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/756e43fca12277fdc287b6c013c71313898d7dcf |     
   armeb     |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/1d9e77a6c2702c4e4c094b034c88485011d95120 |     
   armeb     |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/47fde43f2a976c14d9787746df43a81fc0576def |     
   x86_64    |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/bc46e555fadb194fe03843b047953caf25f5344d |     
 microblaze  |         gnuplot-6.0.0          | NOK | http://autobuild.buildroot.net/results/e95f3daa8c7aaae1fe4b4779f4098d2a795f7b09 |     
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/2814f06f54fc90a9ad4c7fb3f14a42d44ec82eb8 | ORPH
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/d7c1735a79dfaaa59a24224561862f3253451b99 | ORPH
   x86_64    |        gocryptfs-2.3.2         | NOK | http://autobuild.buildroot.net/results/a533b64a62bccef573bfe57659df05ee659e92c1 |     
   armeb     |         hddtemp-0.4.3          | NOK | http://autobuild.buildroot.net/results/83fb81d87422752e236c044d2910fe011f0f259c |     
   sh4eb     | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/f43de4060e28634dced3c3aa4573e2864b2b7168 |     
   sparc     | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/b1c303ee5bbbc44bab65895d379008ff7ff8446b |     
  mips64el   | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/fa430787fdc6900b4b902f61dcde3255395e8aa7 |     
  sparc64    | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/3c144e5ab0b250b050999f2706c0cb158c4d936f |     
   s390x     | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/36405439a7e7e28b61be58ba6579badc5c13ab45 |     
   mipsel    | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/eb0a6426a81780dae282869bc8ad4ef0183dccd1 |     
 microblaze  | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/7462da91690f4dd79cf04767560306fb8a29db35 |     
   s390x     | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/9178b37d71922452a4f70820465951c577370932 |     
 powerpc64   | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/2ca1e748dec40ffa2382e1679d34b319eb519bf0 |     
  sparc64    | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/35f78d7ba6cb220261733376d5041d8fe40fd26e |     
   nios2     | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/0fd65ce69403199a24a13c6891acb11f4a1791c9 |     
    i686     | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/3116cb4ad6b04508fbc05b2bcbd789c7750db892 |     
  powerpc    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/19d949da76d3a3ef56228f9abba9657696feba28 |     
    m68k     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/9c82e4067793e8baea984c0b4cb18f6877522569 |     
    mips     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/324a9848e29ad3985af54ae3a720cfc05ba1e084 |     
   armeb     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/6b44028e9e2dbdb3430dd1fdb00cad98d965cfc0 |     
    arc      |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/2a2de346942c66943779d50a1aa33c09127f2386 |     
   s390x     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/ff5d1cd2f40614871b1fbe142f85c94f69ec7839 |     
    mips     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/30f7899c948b357a4d8eb92c4223be6486937406 |     
  riscv64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/078fe5cd74f9b372381c545dbc3424b86543d391 |     
   s390x     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/227ddc925eab84989a8bc5e56d9be1642f70d721 |     
    arc      |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/350a84febd3a557dcee725005ab8ce6514f01f89 |     
   nios2     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/58392256245874671c5dad0c70425ba93a56597a |     
    or1k     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/f7265b9dd7098efe22e1b7808b7a67e04b26fc9f |     
   arceb     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/79fe30acc7ee978cf4fbb7b309b8bd633f35b3b4 |     
   x86_64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/710ed9821c05b1b210017842779cbdd902ce166b |     
powerpc64le  |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/7b98752699536c4d5b6751599d27fb4d2abdf22a |     
 aarch64_be  |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/568525eb96746622f30f211ce6f843cdc0230947 |     
   mipsel    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/77f23ef05a0b9291ea1625439a31b9109d3ef45a |     
    arm      |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/5bcf5327f47cb078e021fcd01c3e85edb0317df0 |     
powerpc64le  |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/15f53a16bf548210b47aa2fde48691cf1c697f96 |     
   xtensa    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/4052d2af1182bd4785940fd34db4b9288d61f046 |     
    arc      |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/a50828ecd22b0ec0588447ec996ee787ae3faba2 |     
   arceb     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/59dec504e2172c996b4fc568f5c2e330b0ca33db |     
   x86_64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/17545004cfc004eabca3393b9675a4df6242f0e0 |     
   xtensa    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/371861421e2b62ad90462df8585eb0e54ad5af05 |     
powerpc64le  |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/504d3bb69eca40afee57edddbcdbb53571a7cf80 |     
  powerpc    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/7de74cb189c80b4197c95938ad740fd662af3132 |     
   armeb     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/5e154cae66a66ae7c8a92f4911040b91b748a4cf |     
   armeb     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/c6af2402951acfac39b9bbea1e7f7036407debd1 |     
   x86_64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/0a175d3abf2305c6cf1d5d2ee85d747db7db71f0 |     
   mips64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/32c4e003624b202698918736e279df3164afaba1 |     
 powerpc64   |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/15165de931f9123e829d3384dd00e3f2fcd1c828 |     
   mips64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/e648b57f595315ac0fd25e93778aef9d2c26a87f |     
   sparc     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/5b220b11eceee4a829d6e17a37345f65ea02e889 |     
   mipsel    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/28816f70ed3f6bd2f2c390fa865a473c00623c53 |     
microblazeel |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/eeebc2a33ac98cb7518de4103849d969a0665a46 |     
   sh4aeb    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/cb913c72af65bdcea6d110bcf1d48e3db647a171 |     
    or1k     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/ee310bd445e12ee8aabe2e66352ebafe4519d145 |     
 powerpc64   |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/27be52f6bd4e0312d6c589fe0d9a4e0a4a119cb3 |     
   armeb     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/f6db6155635447ac6a19bb111e6709702b43f40f |     
 aarch64_be  |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/3481cf7e0709a01ef7856e0e648fd47a203ed8ff |     
  powerpc    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/6b04aa11a9e52732a577b3569610771ed422f2d0 |     
powerpc64le  |     host-gcc-final-14.1.0      | NOK | http://autobuild.buildroot.net/results/4af0be70bcfbfb9152c82c1079054b9e47e5aaab |     
powerpc64le  |     host-gcc-final-14.1.0      | NOK | http://autobuild.buildroot.net/results/78c3808cb19bee52eab88a4a368d11df02f3a252 |     
  riscv64    |          host-go-src           | NOK | http://autobuild.buildroot.net/results/02f0f4875c8d541be2656dfa84751a4c84d0aa7f |     
powerpc64le  |          host-go-src           | NOK | http://autobuild.buildroot.net/results/5304de44991bcbfab179dbfda1b43dc0ba2eba0f |     
   s390x     |          host-go-src           | NOK | http://autobuild.buildroot.net/results/218097524e2349fc57111c62d49d4d7075fada3b |     
  riscv64    |          host-go-src           | NOK | http://autobuild.buildroot.net/results/f864c8ca26487de5190617c5e749f04685258fc5 |     
   s390x     |          host-go-src           | NOK | http://autobuild.buildroot.net/results/e5f10de05b9528e8252111b4ab90dacbbc1096e9 |     
  riscv64    |          host-go-src           | NOK | http://autobuild.buildroot.net/results/e85c9fb7dfb0712aa8a649c2c466144dbe228299 |     
  aarch64    |          host-go-src           | NOK | http://autobuild.buildroot.net/results/68ccc670d2db82a493bf8516cf01ba42b976c2fd |     
  mips64el   |          host-go-src           | NOK | http://autobuild.buildroot.net/results/a3d2eaf26f94dccebd3eeb77a43b27e6d6f5c3e0 |     
   mips64    |          host-go-src           | NOK | http://autobuild.buildroot.net/results/6a0b6475a602763cfc4b4c919ab1ac67d88c3e77 |     
  mips64el   |          host-go-src           | NOK | http://autobuild.buildroot.net/results/cfdc2fb296f3ecb4271e5225033a996ec93f0953 |     
    arm      |          host-go-src           | NOK | http://autobuild.buildroot.net/results/9500fd6238b778501cf4d911dca78ac2aa84db15 |     
  mips64el   |          host-go-src           | NOK | http://autobuild.buildroot.net/results/c0f65ad83ed267246fff8849d537dcae4fb6ffdf |     
  mips64el   |          host-go-src           | NOK | http://autobuild.buildroot.net/results/58dff4424e69ee97d97a40fe16462d42e977482d |     
  mips64el   |          host-go-src           | NOK | http://autobuild.buildroot.net/results/c949137bd8c393349843ad05d4f41a8633761b00 |     
   mips64    |          host-go-src           | NOK | http://autobuild.buildroot.net/results/503aefe015249aa8b92bd4ab53438a29ebeef8af |     
   mipsel    | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/6c713934603f98ac628a7553305f2798098456f4 | ORPH
   x86_64    | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/f4478b51777b23cb361756691293c2f49d5c5078 | ORPH
  sparc64    |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.net/results/c78f5e343a623ae8be7e27ff3b686e4783807d71 |     
   nios2     |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.net/results/2d43796befa846e4215a4dd22f4b6820d627eb4d |     
powerpc64le  |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/cf10947770b1f8b7bb906038b471353c5364bb8e | ORPH
microblazeel |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/8da45925ee376886f036f29146beda4bd7f89eae | ORPH
   armeb     |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/f60f6a80103c3afd448966ead264fc71beaaff9b | ORPH
    arc      |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/519c9e8161c10524916dae474e4b847c17d88f1d | ORPH
    sh4      |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/9bd55e2e244d113188bf47186712c73e4d1d2794 | ORPH
  riscv64    |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/af0eb498cac62bf3db1cbffe46d807239c43c7ce | ORPH
   s390x     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/e6da74cf01aa056e9a5fa6857101460b1cb7e384 | ORPH
   nios2     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/8297527a1f260ef28994eba1f38df9d1f277acb0 | ORPH
  powerpc    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/c2b90f558e9278875ab1806252d5e8d6c46dca45 | ORPH
    mips     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/1519cecc3bd34b08745589801a036c0659a4d35b | ORPH
  sparc64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/637ca307bd73afbb73b3f07a42661fcd18709202 | ORPH
   nios2     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/a8df38e80586c0765e5b11b2bc8c08a8bc4f46ae | ORPH
    m68k     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/2760f3f7013b47ad87f671c3d9f3935974d379fd | ORPH
microblazeel | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/ca9b961f98e659543cd6dcb32426ee0efa4b5ae4 | ORPH
  aarch64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/632afa01b33f097ff5962deaaeef846fe1b61592 | ORPH
   sh4aeb    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/daf11fe771c6584b9ad4ec8f94db7f83a8d64b2c | ORPH
    mips     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/3dd8465a4618f51e3ec2956492170c589b219a0e | ORPH
   arceb     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/cd3d0f6460ff86408cdcb7f0cedb5ba402b6e75a | ORPH
   x86_64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/713760f7446c5eb5e8a15acabaae08905af3e3aa | ORPH
powerpc64le  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/d8ce93daa6c10162621e3c791356aee0dd7018c2 | ORPH
   armeb     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/98701b0667a32de02d836c3b2ab382923eab4248 | ORPH
   x86_64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/4866cdf8ca3164d188e18aa61e9eccfc959be82c | ORPH
    sh4      | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/ca01caec6558476b7c84e401f84066cbed5bd709 | ORPH
    arm      | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/291845a2bdbe44805eac5bd0db62960fe4d91a9d | ORPH
    i686     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/d3fee7d419dc0feb9aa8444067b593bbabd110ca | ORPH
    or1k     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/171cff0da10039003fcd6bbc107f20508b1b6968 | ORPH
    i686     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/91b8683e02ecf57c066e7c3c3d1d70b4d86cb248 | ORPH
  sparc64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/3744ce7be2e7a2c25445f4e79e75de15416aeac5 | ORPH
  sparc64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/a1370ffee8b11bec94fc0c873625eef9b67088ee | ORPH
 powerpc64   | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/14385d0012c38db35d8a4ff3b375285aef5a53a1 | ORPH
  sparc64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/79d9a2e63552309b453a165b1ba850d9537019d0 | ORPH
   x86_64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/a90dbd65a00330a35d38aa389772a8f5a33dc923 | ORPH
 microblaze  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/647c11bd8be02c2bfc7cac70eb88a4ff9bb2a9e5 | ORPH
  riscv32    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/7480a0037c2fcfb039602d51b5a134ba66b0e3a5 | ORPH
   mipsel    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/62b8534c02374443845bf7203d3d805ea079f95a | ORPH
   x86_64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/b04cff6cf5322db804bc69b9e3109f7de9f5b1ba | ORPH
    mips     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/cb94e0ffffb2e3bffa12f7ccbef4bd0175c576da | ORPH
  sparc64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/1720d4da7819b2ab3a0830afaf89a6074e6757ff | ORPH
  sparc64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/8b6e8385a149d4d2fe09b6e546e1d71434979ef5 | ORPH
    mips     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/f12d2f822c32ece57cb6fff3dad07e9b4ce352d5 | ORPH
   nios2     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/bd42451b56648093322a3c988bcb77212ffba025 | ORPH
   x86_64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/076b8d0f07809382a250113f9efbd9d62a5e67e6 | ORPH
   mipsel    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/05519256b3c51c7d1c9df13d52a46fc42cc084bf | ORPH
   armeb     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/7fcbf63619de8d35658e8fbddd6d648b21b2ecc2 | ORPH
  riscv64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/828685c26cf6fe379d9eb2780d94ce35e7239faf | ORPH
    m68k     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/cf06d1b7bd0d4d23df23fa02dfdb10f59cbfad53 | ORPH
   x86_64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/c541f8812b8dc557d84ba728191cae5c65db4387 | ORPH
 microblaze  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/05a9cbce812ecbc04c82c6a89d1996b35b823606 | ORPH
  mips64el   | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/0679d6b0393548e12053ef5951975651d48d487d | ORPH
    mips     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/e28529088294c2921206bf9ae6ffe7dec38347f0 | ORPH
   nios2     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/0df964eb2c22790278de39c554edd61c8ef48220 | ORPH
    i686     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/27f2336a0fa052e72939d70ebc9733c85129ef4f | ORPH
   s390x     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/401fd5f862ea9c189289156b5d25a273ce7082c0 | ORPH
  aarch64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/7447fe6b5b609b0baaf50216c35545f430217423 | ORPH
   nios2     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/829ed8b758bf682f0542591d9d3e54510c4d061b | ORPH
  sparc64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/2e0c6081ee2038d84f26ab7fca022085e63a8069 | ORPH
   sparc     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/b0e64aa283637bb06ec33ed55b9623dbf1ae7164 | ORPH
  aarch64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/a2c73b2391ae2a331abcdbaadd79dead1b120235 | ORPH
    or1k     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/3ecf36d383a818f776b4cee0b78040245a9ac9c3 | ORPH
    or1k     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/23ab2dacb740713638e9e9357fbb7b8335aa9927 | ORPH
  powerpc    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/8b03c9609d84ca5fb0526585ecb597726cae8918 | ORPH
   x86_64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/d3124db086d55d195e46dcf7047b3f8d385d2eba | ORPH
   mipsel    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/e9fba485ee0c112349b01294a47a9539c4a4a169 | ORPH
    i686     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/0f29f212caf8e23f7098a50ea5b9dbe24cbc152e | ORPH
   s390x     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/f3ab54caecbf033c3d9793a524c1c9827b7aa2f9 | ORPH
  sparc64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/0f3dab357ad3caed6c056ffbeedcb87c7ad717bf | ORPH
  aarch64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/4532150de1d025bd8f2ad3d360955a04dadfdf68 | ORPH
  aarch64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/586f7532d7ac6e10628d283e56d3948fb36b422d | ORPH
 aarch64_be  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/9e1a5e0dc6689a12648a922c5f43131fb364f36b | ORPH
   sh4aeb    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/b40cf8b2a7cfe8379455deea785e4f9413c4db4f | ORPH
 powerpc64   |       host-qt6base-6.4.3       | NOK | http://autobuild.buildroot.net/results/d6709b790d7b772f85103915dfda81d2089be7bb |     
    or1k     |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/55a8e4d25df4811d7eb31f2fcbf965dfda8c0fc4 |     
    m68k     |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/77c52e6007737eefd3a006a82e17393ad4c5789e |     
 powerpc64   |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/6171921bb07360aaaa2050b29e40f2fa3ac2a8cb |     
   armeb     |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/2ca5b1049bb5f0b7aeb37f0cfffd86db866b4dda |     
    mips     |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/2e48a2aca1796bec5628c3731cd1b10811efe8f7 |     
 aarch64_be  |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/f6ea9657fd24f0eb8c336d666b391d5ba4c70331 |     
   sh4eb     |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/734f59ef77be57ab8514b71e3ae2b62da1d7b21c |     
   armeb     |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/7a87c8765be60665fe23cd287f02cb19d5a46376 |     
    mips     |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/b9939b580ee400352ed6e06d8533387a8d7b75a8 |     
   mips64    |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/1a6b3d23bfd47512bd422156a97b549e0d41967b |     
    i686     |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/b88cf323f06c1226f81ae2ce27a023c9e1a6fe00 |     
   mips64    |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/eae3688e8c3c8fd2a05220d1049d628695afb5a7 |     
    or1k     | host-softether-4.30-9700-beta  | NOK | http://autobuild.buildroot.net/results/b6ca1d045634236481e516c5e83f6ea4d6e9a80a | ORPH
   mipsel    | host-softether-4.30-9700-beta  | NOK | http://autobuild.buildroot.net/results/88053337e058b3dd9dc990971f4c53666b4be1a0 | ORPH
   mipsel    | host-softether-4.30-9700-beta  | NOK | http://autobuild.buildroot.net/results/7b838c4db4d7cebb3a03933254dd57a9a430006f | ORPH
   mipsel    | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/10638052c20e71eb53a51ad58436f07baa3844ce |     
   mipsel    | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/9e89d0203bc4d5fcbdfd8a29f9261a1e978d1f95 |     
   x86_64    | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/c1d91fe3cb82c1e8b620c69697a179e1446cef3c |     
 microblaze  | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/a4c319f9356aae3f295f63ca8a0a70b322de00f9 |     
  riscv64    | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/7ce79d304803fe7a5206a63fac28c67a4c89a52d |     
   sh4aeb    | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/b74a26b26f98c8f6a72f7c047177879ffa4cd074 |     
 aarch64_be  |           htop-3.3.0           | NOK | http://autobuild.buildroot.net/results/159772fbe2fabd0f0ed13a39ad594b40d90f93f6 | ORPH
powerpc64le  |           htop-3.3.0           | NOK | http://autobuild.buildroot.net/results/34cf0b5ae76f1628fa0b1faa5453acad86bb974e | ORPH
   mipsel    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/09430edc46af818c3cd643b4b67b469a37197ebc |     
 aarch64_be  | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/ff128af1c076f7c7ef70ab6540cb8bf4f488cfb0 |     
    arc      | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/74d0ff2025f1a0cfa860e40d79aa33e9dd9db9f2 |     
  sparc64    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/c4942bf71a12f4b351c7a6da16f229397dd66123 |     
   s390x     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/99548c3d1084b0d13755552ab30f95fe7ab92c0a |     
    mips     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/8461758933fcc55f2ab2a064f53f49ec8d981f6b |     
  mips64el   | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/5c7788ddda685719f0790fb3177adc11fe5fbb54 |     
   nios2     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/b6e7f322d1fc49b2ddabcb8f2c9ed89f526e49b6 |     
  sparc64    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/6a553d46a1ff6502ad4e72fa0eb117a4fe5dce67 |     
  aarch64    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/8161e6e6675989ce32077a4629016ea308dcd79a |     
    arc      | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/cc9d7a282b5e6017b80ef1092188c584c4c0a536 |     
  aarch64    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/dd4846a18c1e6718a87f5105bb07ae84fc9c1ead |     
   x86_64    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/c15a07fa036c75ee185b3b19860425ee192b4657 |     
    arm      | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/54235427e74337c99131d7d8a637f991d2e95cff |     
powerpc64le  | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/b601d3a4ff4d9e7cd1717952ea95374f41157159 |     
   armeb     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/ffa360301f6dae075b9eb39163bd833b0e07c330 |     
    i686     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/415d4861a036a7230ce862220209cca3cb894a3d |     
   mipsel    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/4d56eb7600703595c09c93bfb30b300ea9000873 |     
   sh4eb     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/8800d6f741fe2c2a1cf8e92c058a2e9f23f85647 |     
    m68k     |          jack2-1.9.22          | NOK | http://autobuild.buildroot.net/results/1dc0ca0385bacefc788f8e03f30fafb092e9eb10 |     
  mips64el   |    libabseil-cpp-20230802.1    | NOK | http://autobuild.buildroot.net/results/af9a89680a42a8782d9db862aab88251fefb901d |     
 aarch64_be  |        libarchive-3.7.4        | NOK | http://autobuild.buildroot.net/results/cde3c27d1c3879e02e92b6e4c807bba6a16616f9 |     
    m68k     |        libarchive-3.7.4        | NOK | http://autobuild.buildroot.net/results/a0aeb182914ba6cdbb8590134284533f1e3990a0 |     
 powerpc64   |        libarchive-3.7.4        | NOK | http://autobuild.buildroot.net/results/254cc0f7011a4a3554d89acb990f5c6ac8f88f89 |     
    i686     |        libarchive-3.7.4        | NOK | http://autobuild.buildroot.net/results/a993f42b003aa3b50a85c90410400a49c68447e1 |     
microblazeel |        libarchive-3.7.4        | NOK | http://autobuild.buildroot.net/results/392a587c6cf18d51e85e15c8348d63436aab86a5 |     
   mipsel    |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/442823616229d15913d80da1e3cf15d32ca486b4 |     
   s390x     |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/d97504c1c40784c978987d08210434434653f067 |     
  sparc64    |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/1f54a5fd15c4a518cdb42948b123815363119dc8 |     
   armeb     |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/3eff2b436145685a25f060e8e6d355b87d485520 |     
  riscv64    |        libdeflate-1.20         | NOK | http://autobuild.buildroot.net/results/1ad4c239b8a50899de01f2b504bcc14693994b65 |     
   arceb     |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/edaa961a983132474631474fcd66f00d8952b7c3 |     
   arceb     |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/7272afcd24a7a54a5b926d433d8c01f3648c5b3a |     
    arc      |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/6edae01898d94143474d0bef542157f29cde099c |     
 aarch64_be  |        libgeotiff-1.7.3        | NOK | http://autobuild.buildroot.net/results/5bd41119ce9653a37848e3e5dcc35cc02f566674 |     
    arc      |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/58ab06e1a41cb522f95f296ad4432979c7ee0b46 |     
    m68k     |          libnss-3.100          | NOK | http://autobuild.buildroot.net/results/83485e55c3ac147fe0d1c972c42e6fccb0ebdecb |     
microblazeel |        libopenssl-3.3.1        | NOK | http://autobuild.buildroot.net/results/79db3f36fe198a0393c035e6574843be11f3cecd | ORPH
 microblaze  |        libopenssl-3.3.1        | NOK | http://autobuild.buildroot.net/results/aa5750422a701bbe7ab15399a30927bc1a07aaa1 | ORPH
    arc      |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/493932a061b6d9d8ec77cb27986d08c68a810c00 | ORPH
    m68k     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/9b2cc6c589e3d2aa2209002a4964f90b631ed21c | ORPH
   sparc     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/f26fcb3cbcd8c6b938625f9c51c2e8dbf7e7986e | ORPH
microblazeel |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/aca490fca812d657c8b3b1b70ef63a5a8dfb7cea | ORPH
   s390x     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/09de80c52a7535c6743f1fa71198ad4836c0488a | ORPH
   s390x     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/35df79c6c063a73a3f5692ab7b5037a862e6fd61 | ORPH
   arceb     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/0bc109e3413fac9e298c5ed3460ec7786ffe4963 | ORPH
    arc      |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/25018c2aa34093546a4d9ac78223386e12a5ce31 | ORPH
 powerpc64   |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/e661395ac20294b8ee3a60a96e7f2fe43eb00889 | ORPH
    arc      |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/9590ba2a5630cf01461318f107a79234bb20c724 | ORPH
powerpc64le  |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/753abc8f637bf3668ff857d1e8bb2c7439eef8c3 | ORPH
    arc      |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/249812a102317e0427fb7b02d678bcbfb2ad8b15 | ORPH
  mips64el   |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/a35e6d30c3e07bf4ba69056a364e57c94b4bbc13 | ORPH
   mips64    |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/4b600a83722505ea547331c515eb1b5f2289ee12 | ORPH
 microblaze  |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/c59554996bbd9669f413b0407393f55dc2a9b085 | ORPH
   mips64    |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/7a20af2f068afda72137b950b3065db9e9fe9340 | ORPH
    or1k     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/67bc17c52dc0c683a848905d5b96a3a3bd55b044 | ORPH
   s390x     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/080c3d688da2cc771efdd17544c90fed092b89f7 | ORPH
  mips64el   |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/4b41b625649b1f0242ee119bd4babb4dfa92c0ab | ORPH
   xtensa    |          libsepol-3.6          | NOK | http://autobuild.buildroot.net/results/f4e8fc8aad4c7216f5a586d89f6b21bf173f410a |     
    i686     | libsvgtiny-ea9d99fc8b231c22... | NOK | http://autobuild.buildroot.net/results/5f482554fb13f178ebbc3a56515f92952e1b8db3 | ORPH
  aarch64    |        libunwind-1.8.1         | NOK | http://autobuild.buildroot.net/results/9298b324363ca40c33b715dae9b5b0d7af755604 | ORPH
  powerpc    |        libunwind-1.8.1         | NOK | http://autobuild.buildroot.net/results/b62b8f100b3af8b88e024f07610eea61d912f14c | ORPH
  powerpc    |        libvorbis-1.3.7         | NOK | http://autobuild.buildroot.net/results/abfa7311ade3e2be753d48d6bb1642d896f23fbd |     
   sparc     |        lighttpd-1.4.76         | NOK | http://autobuild.buildroot.net/results/1bbf58c7887687c0f161cd3725506edaea51ddb9 | ORPH
    arm      |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/8b746354edf65f82f7a94bea986f7ee7546c67cc | ORPH
   nios2     |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/2da8cb883c3323363db687e9cc5f9ec9fc152fb8 | ORPH
    arc      |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/ea999962bf64982c3034558ec8a99fc737f822a5 | ORPH
   armeb     |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/c9c609ecf697f3f1d85a246975c677ff5460474a | ORPH
    m68k     |          linux-6.8.12          | NOK | http://autobuild.buildroot.net/results/774f1363494babe7ce8ce38d8c08b0e8eec6fb19 | ORPH
  mips64el   |          linux-6.8.12          | NOK | http://autobuild.buildroot.net/results/98ab4f9b32f22480779468d9dcf7701d902b3742 | ORPH
    sh4a     |          linux-6.8.12          | NOK | http://autobuild.buildroot.net/results/9e8e48201aeb3caf0c3c46cafe895e2d8ba4e077 | ORPH
    mips     |          linux-6.8.12          | NOK | http://autobuild.buildroot.net/results/611f5e0b06d4022b99913629bb130d503645cfe5 | ORPH
    or1k     |          linux-6.8.12          | NOK | http://autobuild.buildroot.net/results/7c9369ce2ccd50d1d9db9b053a1f9040bf018bee | ORPH
    m68k     |          linux-6.8.12          | NOK | http://autobuild.buildroot.net/results/4545a143d8929fc605ed9ccc33cb35b9b3adf733 | ORPH
    arc      |          linux-6.8.12          | NOK | http://autobuild.buildroot.net/results/5a907725dc622ba1162a3b04065697db194d983e | ORPH
   mipsel    |          linux-6.8.12          | NOK | http://autobuild.buildroot.net/results/f4f6ecd6a76d4239e8f250aec0d3c7a797b367c8 | ORPH
    m68k     |          linux-6.8.12          | NOK | http://autobuild.buildroot.net/results/b473ced267ca68a456afab2c43ed5891c6f96936 | ORPH
 aarch64_be  |          linux-tools           | NOK | http://autobuild.buildroot.net/results/ff4ab17f794e0a3c11c469190aee778bb3bff10a | ORPH
powerpc64le  |          linux-tools           | NOK | http://autobuild.buildroot.net/results/ac2c6ac56daece157d715fc6a4111eea1cb8c704 | ORPH
  riscv32    |         log4cpp-1.1.4          | NOK | http://autobuild.buildroot.net/results/2c13af735b2bcdef2c47657766015549b945d70b |     
 aarch64_be  |         mesa3d-24.0.7          | NOK | http://autobuild.buildroot.net/results/a93b1742917a4018af8c44b553d544d37948e1ae |     
 aarch64_be  |         mesa3d-24.0.7          | NOK | http://autobuild.buildroot.net/results/4832369622e569d1c4932f38ffba5462aa034313 |     
  mips64el   |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/d172a8ef19c77d2872442345bfd276ec9b0f806a |     
   arceb     |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/b66a2a47c728a65278ea084946085c1aec001b35 |     
   armeb     |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/3364ab48e72ce5b4ab284ec15d6e5f459e9e729e |     
   mipsel    |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/92ccada5ac33a808f4714686a09647830342ef52 |     
   mips64    |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/096be253afd2ede8af61b47110b91a34bfad1718 |     
   mips64    |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/edac5d9bd7c7af5d23259f97cc28091b2e54a529 |     
    i686     |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/3b9babaa93e6a5ef27dfc927608368b6b4477fba |     
   mips64    |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/c24c148fa4ff0b49663aeee98f323a1da9d8dabc |     
   nios2     |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/e2e0b3d8a47774d02145dd82cf0c51a4d1ec44f6 |     
 powerpc64   |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/136eceeb9d9ea63f7507fd2ff361dd6f94cc9c16 |     
    sh4a     |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/31cf92bca7e879ea76be99f9dbdc80662084ff07 |     
 powerpc64   |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/a333d0c2aa3878fa046d659c421dea9f14214466 |     
 powerpc64   |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/f291d73406d5593dd127f55917d661ddfadfb8d2 |     
 aarch64_be  |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/74910cb45431929a2644e26b42edb49ad6803095 |     
powerpc64le  |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/7d8d6a4f2b03c95ba545d8c5de8e6408b31334a0 |     
   xtensa    |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/5bba7442dcd72ae873ea0eefd3e9b9f214e60546 |     
 microblaze  |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/0816e3f0f27a5a43f50fa31886621a7f0f50a372 |     
    arm      |           mtd-2.2.0            | NOK | http://autobuild.buildroot.net/results/c9a60c4f333919a2492b95f3ffb4eee38f065bf1 |     
 aarch64_be  |           ncmpc-0.49           | NOK | http://autobuild.buildroot.net/results/ec4438e6f7f3ce0c04922cd836b0d30e3e5c181c |     
   x86_64    |           ncmpc-0.49           | NOK | http://autobuild.buildroot.net/results/fdda46f51f0a45daf6d4b042ffeef420220bed22 |     
 aarch64_be  |           ncmpc-0.49           | NOK | http://autobuild.buildroot.net/results/2ff925901bfe2e060563c7d5b3805364fc8deb28 |     
   armeb     |         nushell-0.85.0         | NOK | http://autobuild.buildroot.net/results/0df57a3175762821d0b194b5b0f77937e30a113b | ORPH
   mips64    |        openblas-0.3.27         | NOK | http://autobuild.buildroot.net/results/beccad9df41a1b6b6a8fc046a3677eef96782cfe |     
   mips64    |         openssh-9.7p1          | NOK | http://autobuild.buildroot.net/results/81b0c6712035a395fe9991553423ff57fa6d550b | ORPH
   mips64    |         openssh-9.7p1          | NOK | http://autobuild.buildroot.net/results/0ff418065a5f2c953c82526c05e52775a4280069 | ORPH
   mips64    |         openssh-9.7p1          | NOK | http://autobuild.buildroot.net/results/b4fd471a3b105f8b277dd5fbe4bd14ef94de3edf | ORPH
 powerpc64   |         openswan-3.0.0         | NOK | http://autobuild.buildroot.net/results/672e99d75880bd64034ccc2f80638ab19a3d0bfc | ORPH
  sparc64    | pppd-e1266c76d1ad39f98f1167... | NOK | http://autobuild.buildroot.net/results/10d8cb31e9881439e29b83dda74217ec16fb059c |     
   sparc     | pppd-e1266c76d1ad39f98f1167... | NOK | http://autobuild.buildroot.net/results/795dfc99111cf1d5e74eb53ed11c14a946bbbc4e |     
  sparc64    | pppd-e1266c76d1ad39f98f1167... | NOK | http://autobuild.buildroot.net/results/c478b3a094abe4c1ff303f326e4bf3a81fbd6865 |     
  sparc64    |        procps-ng-3.3.17        | NOK | http://autobuild.buildroot.net/results/482a66c409378f84a48efa43bb05b2af1c9e4557 | ORPH
   armeb     |   python-cryptography-39.0.2   | NOK | http://autobuild.buildroot.net/results/4690b45cfb7485b63574df000d48b30107864081 |     
    mips     |      python-grpcio-1.60.0      | NOK | http://autobuild.buildroot.net/results/1c82f880e150e1ee6e6a58f591cf7d3fda6d64a6 |     
  riscv32    |      python-grpcio-1.60.0      | NOK | http://autobuild.buildroot.net/results/cf00785d432eba213733b9e747c9286f81d1349a |     
    i686     |      python-numpy-1.25.0       | NOK | http://autobuild.buildroot.net/results/b2136957a3c0bbe6e7d64c457002eea8b10778dc |     
    i686     |      python-numpy-1.25.0       | NOK | http://autobuild.buildroot.net/results/ec4c3e5298c3d2f466220f243ca1d9cc18a238eb |     
 powerpc64   |      python-numpy-1.25.0       | NOK | http://autobuild.buildroot.net/results/3f39805776d627eea5a97f9989addfd5f4e95f5c |     
   mipsel    |     python-remi-2022.7.27      | NOK | http://autobuild.buildroot.net/results/873c720a7e5bdc237e1aa1ccb85f1cca264682b1 |     
   mipsel    |     python-remi-2022.7.27      | NOK | http://autobuild.buildroot.net/results/7e9ce956c5eec469843d6a3f744f611b01067f42 |     
 aarch64_be  |     python-remi-2022.7.27      | NOK | http://autobuild.buildroot.net/results/d4889337ba028a4da6cf6c3de9bb09384b089e0c |     
  aarch64    |     python-remi-2022.7.27      | NOK | http://autobuild.buildroot.net/results/743a906c45a10e1d79d29ddc42298840122d0656 |     
  aarch64    |      python-zlmdb-22.6.1       | NOK | http://autobuild.buildroot.net/results/0a465244f1c1567e6e6e7ca40bb92f8857637ee4 |     
  aarch64    |      python-zlmdb-22.6.1       | NOK | http://autobuild.buildroot.net/results/23fa3c742a4cd8c6def4813b5159f495dd3b6be7 |     
   mips64    |         python3-3.11.8         | NOK | http://autobuild.buildroot.net/results/edba19da59dee67c7acf00978934428db1a91eb4 |     
   s390x     |         python3-3.11.8         | NOK | http://autobuild.buildroot.net/results/3d02625727f4cbbf84dc43533506c3b14c696f1a |     
   nios2     |         python3-3.11.8         | NOK | http://autobuild.buildroot.net/results/564b04364f47d4ecc1bbc020df89a2c7c4e78319 |     
   armeb     | rtl8188eu-306f3e62cf7cddf8c... | NOK | http://autobuild.buildroot.net/results/07cff677651540043cc9cc050efae24fbadb571f |     
   sparc     | rtl8188eu-306f3e62cf7cddf8c... | NOK | http://autobuild.buildroot.net/results/33d6164ab0ce318bd351083b13eb88de11e868b1 |     
   sparc     |         s6-dns-2.3.7.1         | NOK | http://autobuild.buildroot.net/results/94e031cf037f522705582256aaeb1d3307496074 |     
powerpc64le  | tftpd-b2b34cecc8cbc18ff6f1f... | NOK | http://autobuild.buildroot.net/results/f27cdb94a648c2a3f34cfa9082a50308706be46d | ORPH
   mipsel    | tftpd-b2b34cecc8cbc18ff6f1f... | NOK | http://autobuild.buildroot.net/results/97502ff7fdf49ad0b8ed7c62177b392b79c59eec | ORPH
powerpc64le  |         tpm2-tss-3.2.2         | NOK | http://autobuild.buildroot.net/results/88e64e6ae3d8d9193e57b664607a5ed6230d691d | ORPH
  riscv64    |         uclibc-1.0.48          | NOK | http://autobuild.buildroot.net/results/fdb09c7cf8e1b1411d9f4eaa5521e73e0a064921 |     
   sparc     |         uclibc-1.0.48          | NOK | http://autobuild.buildroot.net/results/cc96bfba9fd15ec879dec4e3ec90131bdca80833 |     
  mips64el   | uclibc-ng-test-0f303c63fab7... | NOK | http://autobuild.buildroot.net/results/18abe44fd43a5df29085845b3a837a05e9f2d619 |     
powerpc64le  | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/2e6d7e734b76339b790400062f204b98f1ee1430 |     
 aarch64_be  | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/edde397df404505927d4ed2a0f600d406be0b13a |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/ac5ffcbc8121882ec7abddf33be97bcadfcfc250 |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/2bd86cb4d9f3e36f19ea9403c4e70f86f130bfc8 |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.net/results/d0e53db841f2d5ea070e76ecd88699813e36ea04 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/4d0682e76e6b13a5811339f5ebbf4e2f6e695fce |     
 aarch64_be  |         ustreamer-6.11         | NOK | http://autobuild.buildroot.net/results/ecefebd79228901897422ffee893bc28137cd8b1 |     
  mips64el   |        valgrind-3.22.0         | NOK | http://autobuild.buildroot.net/results/78a253f521c5f43e415631c2f6283b271e4d0106 | ORPH
    arm      |           xen-4.14.6           | NOK | http://autobuild.buildroot.net/results/fce598e83d1495ab090999c75596b6b494a7e447 |     
  aarch64    |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/841e65646477d13bf8c1b238937d717ba28cdad4 |     
   s390x     |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/5c04bc57e59ebd57a28fb0501f40803606c7a378 |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

                    fcft-3.1.6 | 1 
               libglib2-2.76.1 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |           fcft-3.1.6           | NOK | http://autobuild.buildroot.net/results/cd954ed3e30bcc55b8f29455055225a925197b5b |     
   arceb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/b3a4bc5c440cab8bf1c69a3fafa35acee60c96d1 |     


Classification of failures by reason for 2024.05.x
--------------------------------------------------

  gobject-introspection-1.76.1 | 2 
                    fcft-3.1.6 | 1 
        host-sentry-cli-2.20.3 | 1 
          libcamera-apps-1.2.1 | 1 
     linux-5.10.162-cip24-rt10 | 1 
               mariadb-10.11.6 | 1 
           python-numpy-1.25.0 | 1 


Detail of failures for 2024.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |           fcft-3.1.6           | NOK | http://autobuild.buildroot.net/results/d8bc7242a284e9102bcda6e0b40b4060004b36bb |     
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/7b422862f628555cb1e2596ea8dc3567b4cd1234 | ORPH
    i686     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/89ecf5b8dd731220aab127abbba60ffc4ef5ea3f | ORPH
    m68k     |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/b26b33708659348b15488f9668d775931bec6039 |     
   sparc     |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/7edf9692da5e0c6cee66318068aa853133eebfb0 |     
powerpc64le  |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/ddc4afc0c23f41460ee8471ab809211a82a79101 | ORPH
   sparc     |        mariadb-10.11.6         | NOK | http://autobuild.buildroot.net/results/560e828cda476d194826b7dc1c0c2d6218e13f4e | ORPH
 powerpc64   |      python-numpy-1.25.0       | NOK | http://autobuild.buildroot.net/results/34a114f51ccd225d994f9b01337b38470ee7e368 |     


Gitlab CI results for 2024-06-14
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
                  at91sam9260eknf | https://gitlab.com/buildroot.org/buildroot/-/jobs/7089404572  |      
                   at91sam9g20dfc | https://gitlab.com/buildroot.org/buildroot/-/jobs/7089404579  |      
                 at91sam9g45m10ek | https://gitlab.com/buildroot.org/buildroot/-/jobs/7089404586  |      
                     at91sam9rlek | https://gitlab.com/buildroot.org/buildroot/-/jobs/7089404590  |      
                 atmel_sama5d3xek | https://gitlab.com/buildroot.org/buildroot/-/jobs/7089404708  |      
                        bananapro | https://gitlab.com/buildroot.org/buildroot/-/jobs/7089404763  | ORPH 
                   beagleboardx15 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7089404766  |      
                          beaglev | https://gitlab.com/buildroot.org/buildroot/-/jobs/7089404789  |      
                      beelink_gs1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7089404794  |      
                  chromebook_snow | https://gitlab.com/buildroot.org/buildroot/-/jobs/7089404803  |      
                             ci20 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7089404807  |      
                      cubieboard2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7089404809  |      
            engicam_imx6qdl_icore | https://gitlab.com/buildroot.org/buildroot/-/jobs/7089404811  |      
        engicam_imx6qdl_icore_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7089404815  |      
        engicam_imx6qdl_icore_rqs | https://gitlab.com/buildroot.org/buildroot/-/jobs/7089404817  |      
              engicam_imx6ul_geam | https://gitlab.com/buildroot.org/buildroot/-/jobs/7089404819  |      
             engicam_imx6ul_isiot | https://gitlab.com/buildroot.org/buildroot/-/jobs/7089404821  |      
        freescale_imx6dlsabreauto | https://gitlab.com/buildroot.org/buildroot/-/jobs/7089404824  |      
          freescale_imx6dlsabresd | https://gitlab.com/buildroot.org/buildroot/-/jobs/7089404826  |      
         freescale_imx6qsabreauto | https://gitlab.com/buildroot.org/buildroot/-/jobs/7089404830  |      
           freescale_imx6qsabresd | https://gitlab.com/buildroot.org/buildroot/-/jobs/7089404831  |      
          freescale_imx6sxsabresd | https://gitlab.com/buildroot.org/buildroot/-/jobs/7089404832  |      
           freescale_imx7dsabresd | https://gitlab.com/buildroot.org/buildroot/-/jobs/7089404837  |      
             freescale_imx8dxlevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/7089404839  |      
              freescale_imx8mmevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/7089404841  |      
              freescale_imx8mnevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/7089404844  |      
              freescale_imx8mpevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/7089404845  |      
              freescale_imx8mqevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/7089404850  |      
              freescale_imx8qmmek | https://gitlab.com/buildroot.org/buildroot/-/jobs/7089404853  |      
             freescale_imx8qxpmek | https://gitlab.com/buildroot.org/buildroot/-/jobs/7089404855  |      
           friendlyarm_nanopi_r2s | https://gitlab.com/buildroot.org/buildroot/-/jobs/7089404867  |      
                   imx6-sabreauto | https://gitlab.com/buildroot.org/buildroot/-/jobs/7089404884  |      
                        imx6slevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/7089404889  |      
                       imx6sx-sdb | https://gitlab.com/buildroot.org/buildroot/-/jobs/7089404891  |      
                        imx6ulevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/7089404892  |      
                       imx6ulpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/7089404894  |      
                        imx7dpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/7089404897  |      
                        imx8mpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/7089404906  |      
                        imx8mqevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/7089404907  |      
               kontron_pitx_imx8m | https://gitlab.com/buildroot.org/buildroot/-/jobs/7089404917  |      
                       ls1028ardb | https://gitlab.com/buildroot.org/buildroot/-/jobs/7089404929  |      
                     ls1046a-frwy | https://gitlab.com/buildroot.org/buildroot/-/jobs/7089404931  |      
                          mx25pdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/7089404955  |      
                   mx6sx_udoo_neo | https://gitlab.com/buildroot.org/buildroot/-/jobs/7089404965  |      
                          mx6udoo | https://gitlab.com/buildroot.org/buildroot/-/jobs/7089404969  |      
              octavo_osd32mp1_brk | https://gitlab.com/buildroot.org/buildroot/-/jobs/7089405002  |      
              octavo_osd32mp1_red | https://gitlab.com/buildroot.org/buildroot/-/jobs/7089405004  |      
                        odroidxu4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7089405014  |      
                    orangepi_lite | https://gitlab.com/buildroot.org/buildroot/-/jobs/7089405054  |      
                   orangepi_lite2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7089405052  |      
                orangepi_one_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/7089405061  |      
                       pandaboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/7089405087  |      
                           pine64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7089405102  |      
                    pine64_sopine | https://gitlab.com/buildroot.org/buildroot/-/jobs/7089405108  |      
                qemu_aarch64_sbsa | https://gitlab.com/buildroot.org/buildroot/-/jobs/7089405118  |      
                     qemu_sh4_r2d | https://gitlab.com/buildroot.org/buildroot/-/jobs/7089405248  |      
                   qemu_sh4eb_r2d | https://gitlab.com/buildroot.org/buildroot/-/jobs/7089405251  |      
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/7089405287  | ORPH 
                        riotboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/7099240731  |      
                           rock5b | https://gitlab.com/buildroot.org/buildroot/-/jobs/7099241064  |      
                           rock64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7099241134  |      
                       rock_pi_n8 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7099241188  |      
             sipeed_licheepi_zero | https://gitlab.com/buildroot.org/buildroot/-/jobs/7099242253  |      
                  sipeed_maix_bit | https://gitlab.com/buildroot.org/buildroot/-/jobs/7099242366  |      
               snps_arc700_axs101 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7099243287  |      
                 snps_arc700_nsim | https://gitlab.com/buildroot.org/buildroot/-/jobs/7099243356  | ORPH 
                socrates_cyclone5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7099243517  |      
              toradex_apalis_imx6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7099245325  |      
                           ts4900 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7099245362  |      
                           ts7680 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7099245415  |      
                         uevm5432 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7099245464  |      



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
