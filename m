Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECA6AC3DA63
	for <buildroot@archiver.kernel.org>; Fri, 26 Jul 2024 05:14:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D25F581E4C;
	Fri, 26 Jul 2024 05:14:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7iZqveHOt3jO; Fri, 26 Jul 2024 05:14:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 79B9681E68
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 79B9681E68;
	Fri, 26 Jul 2024 05:14:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 59A311BF863
 for <buildroot@lists.busybox.net>; Fri, 26 Jul 2024 05:14:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E6C7E405A7
 for <buildroot@lists.busybox.net>; Fri, 26 Jul 2024 05:14:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R04nLOo4h_xb for <buildroot@lists.busybox.net>;
 Fri, 26 Jul 2024 05:14:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::226;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4A4BF40968
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4A4BF40968
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4A4BF40968
 for <buildroot@buildroot.org>; Fri, 26 Jul 2024 05:14:00 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E855DC0013
 for <buildroot@buildroot.org>; Fri, 26 Jul 2024 05:13:57 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Fri, 26 Jul 2024 05:13:57 -0000
X-GND-Sasl: bot@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1721970838; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=5jQt/BJJuFAFphBG76+cKGll3QSf9gpm9br1VRmSwJk=;
 b=C8JWafYzJ3Yq/JzeW9kn1ZSRAFU92mXZnyGALbF2W3XcPwsGpvo86VlmGy+jud2HJeyWWo
 uvyGqNtYVtQxI6QT+cq9ljPiLZ+70XTyHH6ODB3lbUPWxAkrYTfROmrm3PMyzLQ7Wvd9/1
 Wc1EwYmDaxdtrr03TgNWqDJIkg+XfUQiaqAJDQeKbqlqvIGiFpbgoBBKOkoPJPyrsbwBFU
 1x456f2d4acc58QgVDsc7/zWcPNXEYncqe4WJaMBuPvBvNSsY3oICBJLIfJLSCbbzhEPLs
 9dnhI/QUvcdVp4ZXtUEdc0JEv6Zr3uc+4qKDmHseful3cEeoehCU8+2t77HunA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=C8JWafYz
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2024-07-25
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
Message-ID: <20240726051357.ebSPK3-ulAVDYjs0RQFEhTJiAo1eLfutxYQpdvkbLAY@z>

Hello,

Autobuild statistics for 2024-07-25
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  7  |  7  |  0  | 14  |
  2024.05.x  |  3  |  7  |  0  | 10  |
    master   | 109 | 277 |  2  | 388 |

Classification of failures by reason for master
-----------------------------------------------

  gobject-introspection-1.76.1 | 12
                elfutils-0.189 | 10
                  bcusdk-0.0.5 | 9 
                host-odb-2.4.0 | 9 
           host-systemd-254.13 | 9 
                    norm-1.5.8 | 9 
                     avahi-0.8 | 8 
                  ffmpeg-6.1.1 | 7 
host-vboot-utils-bbdd62f9b0... | 7 
                   linux-6.9.8 | 7 
      python-autocommand-2.2.2 | 7 
                espflash-3.1.0 | 6 
                      xz-5.6.2 | 6 
                   foot-1.16.2 | 5 
                 gnuplot-6.0.1 | 5 
                  libffi-3.4.6 | 5 
            gdk-pixbuf-2.42.10 | 4 
                gerbera-1.12.1 | 4 
             gnuradio-3.10.7.0 | 4 
             host-delve-1.22.1 | 4 
host-heimdal-f4faaeaba371ff... | 4 
                  mender-3.4.0 | 4 
               procps-ng-4.0.4 | 4 
    python-cryptography-39.0.2 | 4 
                s6-dns-2.3.7.2 | 4 
                  cairo-1.18.0 | 3 
                     crun-1.15 | 3 
              host-rust-1.79.0 | 3 
               ipmitool-1_8_19 | 3 
               libglib2-2.76.1 | 3 
                libressl-3.8.4 | 3 
                libxml2-2.12.6 | 3 
          linux-5.10.162-cip24 | 3 
                  ntp-4.2.8p18 | 3 
                       unknown | 3 
aer-inject-9bd5e2c7886fca72... | 2 
  binutils-arc-2023.09-release | 2 
                 dc3dd-7.2.641 | 2 
                      ell-0.65 | 2 
              fluent-bit-3.1.3 | 2 
glibc-2.39-74-g198632a05f6c... | 2 
                gnu-efi-3.0.18 | 2 
         gobject-introspection | 2 
 host-binutils-bare-metal-2.42 | 2 
     host-moby-buildkit-0.11.6 | 2 
     host-python-maturin-1.7.0 | 2 
                  libnfs-5.0.3 | 2 
                  libva-2.22.0 | 2 
     linux-5.10.162-cip24-rt10 | 2 
                   linux-tools | 2 
                    ncmpc-0.49 | 2 
             parsec-tool-0.7.0 | 2 
           python-daemon-3.0.1 | 2 
         python-remi-2022.7.27 | 2 
android-tools-4.2.2+git2013... | 1 
                 apache-2.4.61 | 1 
                  assimp-5.3.1 | 1 
aubio-152d6819b360c2e7b379e... | 1 
                 avro-c-1.11.3 | 1 
                  bitcoin-26.2 | 1 
                    brltty-6.6 | 1 
              cache-calibrator | 1 
             containerd-1.7.20 | 1 
cwiid-fadf11e89b579bcc0336a... | 1 
                     exim-4.98 | 1 
              fftw-quad-3.3.10 | 1 
                     file-5.45 | 1 
            flashrom-1.4.0-rc2 | 1 
           ghostscript-10.03.1 | 1 
               graphene-1.10.8 | 1 
                 hddtemp-0.4.3 | 1 
                 highway-1.2.0 | 1 
         host-gcc-final-13.3.0 | 1 
 host-softether-4.30-9700-beta | 1 
                   httping-2.5 | 1 
igh-ethercat-f5dc109176400f... | 1 
                  iozone-3.506 | 1 
               libcap-ng-0.8.5 | 1 
                libcuefile-475 | 1 
                  libdex-0.6.1 | 1 
                 libgee-0.20.6 | 1 
                libmad-0.15.1b | 1 
                  libnfc-1.8.0 | 1 
                   libnl-3.9.0 | 1 
                 libp11-0.4.12 | 1 
                  libsepol-3.6 | 1 
                 libwpe-1.16.0 | 1 
               lighttpd-1.4.76 | 1 
                 lrzsz-0.12.20 | 1 
ltrace-82c66409c7a93ca6ad2e... | 1 
               lynx-2.8.9rel.1 | 1 
               mariadb-10.11.6 | 1 
                 mesa3d-24.0.9 | 1 
          moby-buildkit-0.11.6 | 1 
                 mokutil-0.7.2 | 1 
                nushell-0.85.0 | 1 
             open62541-v1.3.11 | 1 
                 openssh-9.8p1 | 1 
           python-numpy-1.25.0 | 1 
python-unittest-xml-reporti... | 1 
                rocksdb-6.20.3 | 1 
                    rtty-8.1.0 | 1 
                 shadow-4.15.1 | 1 
         spirv-tools-1.3.261.1 | 1 
squeezelite-71c012ad9ba102f... | 1 
ulog-0389d243352255f6182326... | 1 
               valgrind-3.22.0 | 1 
                wlroots-0.16.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/f911bb74593d52742886df38e2c252aa81b26531 | ORPH
 powerpc64   | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/91a6acf0bce1e8e0616dea1bb429b4c27c3921e4 | ORPH
    mips     | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/d8a0c587026346294a0e8cda1294582d3defc519 |     
    i686     |         apache-2.4.61          | NOK | http://autobuild.buildroot.net/results/b4b03663598276b8125ad1f2606eeb177bbb0a05 |     
   sh4aeb    |          assimp-5.3.1          | NOK | http://autobuild.buildroot.net/results/834d8a2e0a9b050c3f2818cba5584b0e0ba5d128 | ORPH
    mips     | aubio-152d6819b360c2e7b379e... | NOK | http://autobuild.buildroot.net/results/77d14d356f2e921f5c2bc5578d7415938e1c4ed9 |     
powerpc64le  |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/c120372a8b842960e212d12b6985d40cd3572ec4 | ORPH
   nios2     |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/13913c4f8dc5d08364fdfef76917e5a6899da5cb | ORPH
   nios2     |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/b09cd6f798e0a3d2c8ea876afa5cd372d11cad2f | ORPH
   x86_64    |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/838bd651217e93be760c0a21c5ff469d6715a2fe | ORPH
   s390x     |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/9d37c18adab88b4f95dce6b9a46f4a3b760e9386 | ORPH
   armeb     |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/35e77d942932baf62b06027dcc50a81606c1a31a | ORPH
   armeb     |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/2900fbd4d16699c5f4d205cba1e5352ab5c2a1c4 | ORPH
   mipsel    |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/960874a070e557840dba89c04f86a4bf5b852caa | ORPH
  mips64el   |         avro-c-1.11.3          | NOK | http://autobuild.buildroot.net/results/944a178d57b3b97580ee137f26f4f57bdeba6a87 |     
    or1k     |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/760fcb2f0acf528c530fd465289e621ee617ca47 |     
microblazeel |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/527585d0874542c8f4f2f618a6d8c7a7c2c179c5 |     
   x86_64    |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/d7132d9307c0ba08d4e774aeece593f0f21c0c9f |     
   x86_64    |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/1ceca2a0dff73e53dcf44abf02ef2dc8b25a5e34 |     
    i686     |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/4bb88b2ac8b4bd37c28e222e44949283cca0d35e |     
    arc      |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/5f3b0876194bbebaad9a48754e1462d94933a320 |     
 aarch64_be  |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/74fd7219e9939845a8a33279857cf4cacc21c68d |     
microblazeel |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/f3305b1751d8a2cf978b1cea3a82f492493f6d52 |     
   nios2     |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/8e934d241d898ce46e6951598b68a79bf20c8ef2 |     
    arc      |  binutils-arc-2023.09-release  | NOK | http://autobuild.buildroot.net/results/3c098d2d95dd291ca136cb3cfcbf7b374f31d43e |     
    arc      |  binutils-arc-2023.09-release  | NOK | http://autobuild.buildroot.net/results/23588331f4537ddee38b430b7f90bdbdaf4836e7 |     
    m68k     |          bitcoin-26.2          | NOK | http://autobuild.buildroot.net/results/032a5cb1e9a592ace9cf1500aedb418bb11d95a6 |     
   mipsel    |           brltty-6.6           | NOK | http://autobuild.buildroot.net/results/96f78cf482779214e884c70c2b7a87d07c045ecb |     
   s390x     |        cache-calibrator        | NOK | http://autobuild.buildroot.net/results/0447b01e47ff2553aed5d7e6b3daff37dd4ebfd2 |     
  aarch64    |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/733aa7cab78e3d616ad4e34505822b55bd057992 |     
microblazeel |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/e10855026ac4e698ad0ded7796e57aeebb8dba6a |     
   x86_64    |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/796d1c71e5078c3ec9e0ff5e2c984ee0b9990d5c |     
  riscv64    |       containerd-1.7.20        | NOK | http://autobuild.buildroot.net/results/d4c7dc9ea9e375258e20d8a655ae77d00e7f6191 |     
microblazeel |           crun-1.15            | NOK | http://autobuild.buildroot.net/results/f14acd103cccd754d32ee16b455d201b20e8b8ed |     
    m68k     |           crun-1.15            | NOK | http://autobuild.buildroot.net/results/1ee4fd4b738827dca985c1b9cc7ba91803657039 |     
    m68k     |           crun-1.15            | NOK | http://autobuild.buildroot.net/results/273beaad623165d948eabe24e41fc3ace5b85aee |     
   s390x     | cwiid-fadf11e89b579bcc0336a... | NOK | http://autobuild.buildroot.net/results/d6d7f376cecfee14b113854bb18f38426704e327 |     
   sparc     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/affa0329ea56cb83fbabe6692e7f6f4ba755e898 | ORPH
   mipsel    |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/0a482f16f3e172bfb518ba1b9f2e7c9cc54f1d60 | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/035026b458431593338cabf4d7bb29a20dccb035 | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/f9fd58be514f92733dc28ce9af8213f7ba8db23f | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/cea734f0bdf18e88209e48f0ebd349a55514d247 | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/8f1433290991dcbfa9f28141b9c4a8c03f65e2be | ORPH
   arceb     |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/3c7bece49aaf009186af9e0023ff56d478666bc0 | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/f92144856b65065125b07445db291baa0db24dd4 | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/e87bc2f0e20b79a6d584d393ab88235c7840caff | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/ccab2593a51169f33be17a7eb79b9896f90b2ca9 | ORPH
    m68k     |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/4f5365049cffa77f573a1d605d548b404e59d9e2 | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/770f0d7b7cf37ddfacb16b7a7203d960c8028155 | ORPH
    sh4      |            ell-0.65            | NOK | http://autobuild.buildroot.net/results/9496fcd8a1d7f4cc8028fc914936a74c0a965035 | ORPH
    sh4      |            ell-0.65            | NOK | http://autobuild.buildroot.net/results/dc6e4d87fb346a300e93234d0974205b56fec843 | ORPH
   x86_64    |         espflash-3.1.0         | NOK | http://autobuild.buildroot.net/results/796db4a92eca62b0c5dfe8cb051a38f689bc4378 |     
powerpc64le  |         espflash-3.1.0         | NOK | http://autobuild.buildroot.net/results/f4f3b444e406b62a47307107748144d1bfaff29e |     
    i686     |         espflash-3.1.0         | NOK | http://autobuild.buildroot.net/results/08bb56f9a51af60fa7426a81683b01254ddd9bb3 |     
powerpc64le  |         espflash-3.1.0         | NOK | http://autobuild.buildroot.net/results/034d74c1057a3da41bae3214f5e5d4e0ff84342e |     
  aarch64    |         espflash-3.1.0         | NOK | http://autobuild.buildroot.net/results/2c53637a497e17619dde9bb50e0e582647a2daaa |     
  aarch64    |         espflash-3.1.0         | NOK | http://autobuild.buildroot.net/results/75541c8949ee06f429b8aadb440f38071800b514 |     
    arm      |           exim-4.98            | NOK | http://autobuild.buildroot.net/results/e063a8a8eed7a9941e85f23cfaa9c97a00719c04 |     
 microblaze  |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/c2a0a1a8b040562776b18b61d3592a3776e72c3f |     
 aarch64_be  |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/d67d1e2a81004ddd4e833df7e375de943aeb7259 |     
   arceb     |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/1efbc808777de78703da6d26a4f9f87ce62ced36 |     
 microblaze  |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/64e8a854b85c19f750900702eb527b11b31e7f6f |     
 microblaze  |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/2aee5d4a005c6ed57313805a8d045b4f25228307 |     
   arceb     |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/60314ad6c495d25b7d94de3ba22ff94c2863764d |     
 microblaze  |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/4200d7a900e36e0e44aafd98addb727edbd75abb |     
powerpc64le  |        fftw-quad-3.3.10        | NOK | http://autobuild.buildroot.net/results/4ae363f7b84499c97e9561f7ce6435408dce7c81 | ORPH
  powerpc    |           file-5.45            | NOK | http://autobuild.buildroot.net/results/f0b186c5b8d5f8f813c4f6162c573449669a1123 | ORPH
    arc      |       flashrom-1.4.0-rc2       | NOK | http://autobuild.buildroot.net/results/256a6d12742317ec668d666c0d9d0cea7cac5d17 |     
   mips64    |        fluent-bit-3.1.3        | NOK | http://autobuild.buildroot.net/results/80ab6947149cd54fd5c00cbf81de5944c128bcae |     
    arm      |        fluent-bit-3.1.3        | NOK | http://autobuild.buildroot.net/results/dea140d2ef1b6c8acf0672d0bb8883d1447c13cf |     
microblazeel |          foot-1.16.2           | NOK | http://autobuild.buildroot.net/results/d043da13cd3557bb55f454bd20e882498b7bf9c8 |     
   nios2     |          foot-1.16.2           | NOK | http://autobuild.buildroot.net/results/e8c825450186d1f5d3a65323691c01aa09b56a54 |     
   nios2     |          foot-1.16.2           | NOK | http://autobuild.buildroot.net/results/83f703d573bc06951f3e0d18424be8e079cea02b |     
   mipsel    |          foot-1.16.2           | NOK | http://autobuild.buildroot.net/results/d0cb32c6af869e14518cd88cc7dced5eac9c9bdf |     
   nios2     |          foot-1.16.2           | NOK | http://autobuild.buildroot.net/results/bb7f61c93229e8dc482c181b571528d6b6d7e717 |     
   sparc     |       gdk-pixbuf-2.42.10       | NOK | http://autobuild.buildroot.net/results/b9c396df16f6bdd6fdbd3aa8c52db608ddff4bc1 | ORPH
    arc      |       gdk-pixbuf-2.42.10       | NOK | http://autobuild.buildroot.net/results/9b03b5e542122e0bbc036da6569cecb959479612 | ORPH
 aarch64_be  |       gdk-pixbuf-2.42.10       | NOK | http://autobuild.buildroot.net/results/6c67cee2dd98122531447d7bb432260e15e7e145 | ORPH
    arm      |       gdk-pixbuf-2.42.10       | NOK | http://autobuild.buildroot.net/results/580a0d4215b73da1ff9a9ae9e1a553524c9cb7fd | ORPH
   mipsel    |         gerbera-1.12.1         | NOK | http://autobuild.buildroot.net/results/52ba8275e35c130215ff8e482948ff738a6f494f |     
powerpc64le  |         gerbera-1.12.1         | NOK | http://autobuild.buildroot.net/results/74027c849191ac9d2fa51a901e16103281a9ffac |     
  powerpc    |         gerbera-1.12.1         | NOK | http://autobuild.buildroot.net/results/3d5792293836f4dc4e2374e01ba7e198dd704d35 |     
    i686     |         gerbera-1.12.1         | NOK | http://autobuild.buildroot.net/results/2d1fedd6cbf4a297042186dbe95c51327ba62c96 |     
    arc      |      ghostscript-10.03.1       | NOK | http://autobuild.buildroot.net/results/502d8d0e2e5106e30bb53f04a2b6aea053d2cae2 |     
powerpc64le  | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/684717a70705b57d20dc12bfdb00002912211b7b |     
 powerpc64   | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/e527dc74f4cbc11e68365c918a83beade2335ed4 |     
 aarch64_be  |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/cd2aa0e72c995ad8539d0fd752c4e80593bd44b4 |     
 aarch64_be  |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/168748e75411aeab935ab6dae138a5a6cf2b3781 |     
   mips64    |         gnuplot-6.0.1          | NOK | http://autobuild.buildroot.net/results/52f35400b7e20869594d08fd866e639fb4b2bac9 |     
   nios2     |         gnuplot-6.0.1          | NOK | http://autobuild.buildroot.net/results/44e17308257d0e36ec0bb97a547c2e15fb45fa74 |     
   arceb     |         gnuplot-6.0.1          | NOK | http://autobuild.buildroot.net/results/71f7d77dee19a008e1b60ac08b27c4b49663ac97 |     
  mips64el   |         gnuplot-6.0.1          | NOK | http://autobuild.buildroot.net/results/ab1e1fa638e8e6a570687368e81985e665609eb3 |     
   mipsel    |         gnuplot-6.0.1          | NOK | http://autobuild.buildroot.net/results/94c218c0f0225b5c9f1da996fa412ca277add952 |     
microblazeel |       gnuradio-3.10.7.0        | NOK | http://autobuild.buildroot.net/results/49afba10717126613abf80d097d184bc1550e6ef |     
  sparc64    |       gnuradio-3.10.7.0        | NOK | http://autobuild.buildroot.net/results/dc0bf8b2d7d70a022b1d03f27ac2e4153aeacf55 |     
  riscv32    |       gnuradio-3.10.7.0        | NOK | http://autobuild.buildroot.net/results/cee05b6f618233836584add06154cf079c379325 |     
  sparc64    |       gnuradio-3.10.7.0        | NOK | http://autobuild.buildroot.net/results/be970bae1295c56bb4511c0eee8de7f645a6d3d7 |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/703d7da765d42be7803d6696aecea39577c6e03a |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/6c5846b346caf7c5b9f4da2e729e4ab11cc3a927 |     
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/73ffa3776895d1f61107f08f395235f86a3c5e5f | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/6a00ad76aff7d27b850e3757f2ca178b563e1329 | ORPH
   x86_64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/08d6c1684b56149a696c20f850d5cd2ac8135a15 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/e13ecd4f0155e394bb7494b6905c05da22ad519e | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/57ee3a86fee681120af019d28d289f550ffce795 | ORPH
    m68k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/5b693d44aa574be0b21e3c2aa81525aab2841d53 | ORPH
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/1463d441f030e16e0ce2189bd77a4a85af825ce0 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/766a5eeabc2f037276d17fc7eb9bfc9d8c3dc594 | ORPH
   x86_64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/3a0fd31bf04bad45444885b0acbdd0175c9286e8 | ORPH
  powerpc    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/86bd9938bcc9437c96d54cf119473d8100d4cab1 | ORPH
    m68k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/636c9cdf7a1b125f55e057c001308ad5038763c8 | ORPH
    m68k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/90bba11f5dea35d6c69d73066d3db83898d6ee66 | ORPH
 aarch64_be  |        graphene-1.10.8         | NOK | http://autobuild.buildroot.net/results/4d2ce7652574052c6f5fce799cee7cd672720ab7 |     
 powerpc64   |         hddtemp-0.4.3          | NOK | http://autobuild.buildroot.net/results/15407a4e79ebafa8b82ac807abeb415f9059c0c3 |     
  aarch64    |         highway-1.2.0          | NOK | http://autobuild.buildroot.net/results/b2defa3b1ace35a1f911b9affb881aa40049cbb0 |     
    arc      | host-binutils-bare-metal-2.42  | NOK | http://autobuild.buildroot.net/results/c226dd688be83e38cf8c81d139b0d440b97c5eb2 |     
 aarch64_be  | host-binutils-bare-metal-2.42  | NOK | http://autobuild.buildroot.net/results/1032ecc3e033aa177d000b544d6ef54f2d972391 |     
  mips64el   |       host-delve-1.22.1        | NOK | http://autobuild.buildroot.net/results/ff287c5b7d1ed220a35190633243e9adefd13856 |     
  riscv64    |       host-delve-1.22.1        | NOK | http://autobuild.buildroot.net/results/4d04d4a5834a499fb28769f6315c138789c949ee |     
   mips64    |       host-delve-1.22.1        | NOK | http://autobuild.buildroot.net/results/433b462be6c7164f259d2bfebf62b0c7baed89da |     
   s390x     |       host-delve-1.22.1        | NOK | http://autobuild.buildroot.net/results/8ce85a8eca60e19691b5aab70d5326277eac374b |     
    i686     |     host-gcc-final-13.3.0      | NOK | http://autobuild.buildroot.net/results/5858cd2bf767471515ffa1fe0f8b740cb8ca7a26 |     
 aarch64_be  | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/1ea81c8bb1b7ce7a53a8f32bbfc95e57bda7ebc9 | ORPH
    i686     | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/6598a2039e6a589db45528094d3954934caad081 | ORPH
microblazeel | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/e94517220a636da6ac50fe09230c7e9ab388aa17 | ORPH
 microblaze  | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/988e941ab1af1a02ce701a319868ab62397d577e | ORPH
  mips64el   |   host-moby-buildkit-0.11.6    | NOK | http://autobuild.buildroot.net/results/c0b2b7c172991ef7cb98b582893e56e8a4692dc2 |     
   x86_64    |   host-moby-buildkit-0.11.6    | NOK | http://autobuild.buildroot.net/results/49f2e18e6c2984610662782e88ae0962bf74c1b1 |     
   armeb     |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/7129662ed69914b414d879fb052672cd3aee3763 | ORPH
    or1k     |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/955856478b6e54f21fd0e8817a9adc6e944a86f8 | ORPH
  sparc64    |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/bd80ff49a16b6700097ffacaa11fb61e333f10d2 | ORPH
  aarch64    |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/245c363d457abf9c4cffaf6f2e98a15c4e1c8465 | ORPH
    arm      |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/ed78c35285e094febf03b0ca6076c6a80c4360d8 | ORPH
 aarch64_be  |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/65e2fbe85f480a2bb18e1da8fbdb2ab9ff0abdaf | ORPH
    i686     |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/888ae8ef5e11e4c1cadd9ab5c28797535c67f0d6 | ORPH
   armeb     |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/37d2df8ede3daae73a93a57df1bb15bfc06ebfc8 | ORPH
   mipsel    |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/177054e822849acc6a4a13b35f65b963a2cbba06 | ORPH
  sparc64    |   host-python-maturin-1.7.0    | NOK | http://autobuild.buildroot.net/results/adf3078310b17a942c332d13f36d2eb5cefaff0e |     
powerpc64le  |   host-python-maturin-1.7.0    | NOK | http://autobuild.buildroot.net/results/7fd961a47f58749fd87d63b15a2d380e32bb7146 |     
   x86_64    |        host-rust-1.79.0        | NOK | http://autobuild.buildroot.net/results/3b454fcaf44938eff6a0e932139942e05b065988 |     
 powerpc64   |        host-rust-1.79.0        | NOK | http://autobuild.buildroot.net/results/5194a7ce985f9b3b7246b888acb0614ecaa64fd1 |     
   x86_64    |        host-rust-1.79.0        | NOK | http://autobuild.buildroot.net/results/e1aec24702b26c57d3ef6482a0b10d0ab43a802d |     
   mipsel    | host-softether-4.30-9700-beta  | NOK | http://autobuild.buildroot.net/results/410fbaf50b2114252aca46f4205f10447512f52e | ORPH
  powerpc    |      host-systemd-254.13       | NOK | http://autobuild.buildroot.net/results/d3461726ef172420f4de03aca12a88213facd9ac |     
   mipsel    |      host-systemd-254.13       | NOK | http://autobuild.buildroot.net/results/ffe8bde7b5da63b1347e055490ce1524d3150168 |     
 aarch64_be  |      host-systemd-254.13       | NOK | http://autobuild.buildroot.net/results/340a5d89197b9c89ad533b8e78e3d2d9ab82917a |     
  aarch64    |      host-systemd-254.13       | NOK | http://autobuild.buildroot.net/results/da22ea4f567ed88440297f3ca5009076efda6717 |     
    mips     |      host-systemd-254.13       | NOK | http://autobuild.buildroot.net/results/bf52f1eb4d4414b5dd8636fb2901918b73a4d8df |     
   s390x     |      host-systemd-254.13       | NOK | http://autobuild.buildroot.net/results/5213d9e60e36f3941a64023df2843502b1477376 |     
    or1k     |      host-systemd-254.13       | NOK | http://autobuild.buildroot.net/results/6b83d265d763be1c19cfcf78ef890e2692389f67 |     
    i686     |      host-systemd-254.13       | NOK | http://autobuild.buildroot.net/results/470ed51a56dca349295b59b02f221d0b40975e48 |     
   nios2     |      host-systemd-254.13       | NOK | http://autobuild.buildroot.net/results/c84bec75c451b6588e7a5ed00b0dd867f269ab06 |     
    or1k     | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/4906aec0c61bb4bf0358a66157cea8670eefed32 |     
   armeb     | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/af6e84a7c9a57fba2e1b95e05e3cafdd4d777b73 |     
   armeb     | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/c3c467eab3f99cec16f8ec38b3b99d3d16ea39b8 |     
    arc      | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/09cdc9296e197cb8917764be265bac7c0435a36c |     
    or1k     | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/03c4e036a1db27f51672523da91f18e003606379 |     
   mips64    | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/09a061783481dda940a046871ddf1f3adc97e5ed |     
   mips64    | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/d04bbbad0cfaf7d82c987949517fced3e05a4896 |     
   nios2     |          httping-2.5           | NOK | http://autobuild.buildroot.net/results/f9806593255d607ab0560b5e6aeaddbc8ad34a0e |     
  riscv64    | igh-ethercat-f5dc109176400f... | NOK | http://autobuild.buildroot.net/results/840caac01aa31dbfcecc9b90a4d18f6b42af8e95 |     
   sparc     |          iozone-3.506          | NOK | http://autobuild.buildroot.net/results/93ff40d9797b3db22e29de56187823e47476e2e7 |     
    i686     |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.net/results/961f906f7d83b8415dcd54eae8d757501b984bad |     
powerpc64le  |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.net/results/116a60b8f874ce357a065e4135763729375f0526 |     
   mips64    |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.net/results/78b472cd52fabe692350904be806e3fe46506e3c |     
  riscv32    |        libcap-ng-0.8.5         | NOK | http://autobuild.buildroot.net/results/1ebced39af9d2c8d43365c8bf35d427775a7bb37 |     
   arceb     |         libcuefile-475         | NOK | http://autobuild.buildroot.net/results/7455fe00ac74b430916fc093e8c3eaad4466a77e | ORPH
    mips     |          libdex-0.6.1          | NOK | http://autobuild.buildroot.net/results/276646bf224d5927cf0311cf978571a7f8774116 |     
   arceb     |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/584109a7920bf288b3ccf9031e49216904e49deb |     
   arceb     |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/d751f4eea19ba08196005c9744a759fdfcc69dee |     
   arceb     |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/71f3f759d1828edbba6b0c1006fb08e5ebaa294c |     
   arceb     |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/83b5dbf245f7accbf1812a4a9ccc60bc7ff8307a |     
   arceb     |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/59728679aada4a342f1879d4935e54a705d13e2c |     
   s390x     |         libgee-0.20.6          | NOK | http://autobuild.buildroot.net/results/bda4d437e94b666cd55c3e55a8d0654ec8ce13f7 |     
   arceb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/e8e3c54fadc07a76603dee09ffb83310fb1dcfca |     
   arceb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/f05a9de55ac21db348f3cb6c7a7a24c27a0c0291 |     
    arc      |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/84193c0e53660899ed6bd71be5c60b8cf6e21194 |     
    arm      |         libmad-0.15.1b         | NOK | http://autobuild.buildroot.net/results/4b08fe369655d35a598e672cc311e2b4a5281180 | ORPH
    or1k     |          libnfc-1.8.0          | NOK | http://autobuild.buildroot.net/results/160f7b194681a947e62c8020f6942e7e83137674 |     
   xtensa    |          libnfs-5.0.3          | NOK | http://autobuild.buildroot.net/results/b0adf763398b7084aa3b920bc5e2ed07e135e02f | ORPH
  mips64el   |          libnfs-5.0.3          | NOK | http://autobuild.buildroot.net/results/7d661738d0d8b071cfbf49330cc81a17ff880311 | ORPH
powerpc64le  |          libnl-3.9.0           | NOK | http://autobuild.buildroot.net/results/c45d3c0ba90a1d3bc39472b752c527e561f5b34d | ORPH
   x86_64    |         libp11-0.4.12          | NOK | http://autobuild.buildroot.net/results/1aaa6a49d6f5c4c915c2aa33f48e25cd30255a6c | ORPH
  mips64el   |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/568989612d0a58a70f98a0965ca1c7d2cdaec484 | ORPH
  mips64el   |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/09b86c95ea1054d5f54d4ef4a041eb105c3f4aa9 | ORPH
  mips64el   |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/a2efe8a2b2fd69eaf386a708acdf72ee580bdee5 | ORPH
   xtensa    |          libsepol-3.6          | NOK | http://autobuild.buildroot.net/results/9da4f4cb1f233b1ba6c35bd92449cc924f94e892 |     
  aarch64    |          libva-2.22.0          | NOK | http://autobuild.buildroot.net/results/7d80694a36b50257c4ae7abbfa4bf5ca45221242 |     
    or1k     |          libva-2.22.0          | NOK | http://autobuild.buildroot.net/results/ee9870c81e4666df4cdb32144130f6555c02be34 |     
  aarch64    |         libwpe-1.16.0          | NOK | http://autobuild.buildroot.net/results/d5801db7b5254c4eaccc17693ed5bb488355b792 |     
   mips64    |         libxml2-2.12.6         | NOK | http://autobuild.buildroot.net/results/dddd0968981a081224755e3fc1eeb4720996f34a |     
   mips64    |         libxml2-2.12.6         | NOK | http://autobuild.buildroot.net/results/9fb59af96d4f0a85492ad421ce700426ecf967d1 |     
   mips64    |         libxml2-2.12.6         | NOK | http://autobuild.buildroot.net/results/63953ed0832cfee7f9b15e5589bbe3dd3cd16044 |     
  sparc64    |        lighttpd-1.4.76         | NOK | http://autobuild.buildroot.net/results/b344e5d250da778f23a67a6993c215123f3cbc05 | ORPH
    mips     |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/8deeb126716bf76bc7713b659221d75b7b7aa8e7 | ORPH
  mips64el   |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/d0d89970b3a412e60857101b20e0ef91cec6a2e0 | ORPH
    mips     |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/abc8e0615cf8861a5c630cc8116dceb4bb21be0d | ORPH
   s390x     |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/0031a66b91ae379255f5af7a872cdfd1615fac3f | ORPH
  mips64el   |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/2b068c2eacc194a76e4f5ea08192ec73df14378a | ORPH
    arc      |          linux-6.9.8           | NOK | http://autobuild.buildroot.net/results/3521495ed91d79a18ae24a8f1409ad43b30ed1aa | ORPH
   mips64    |          linux-6.9.8           | NOK | http://autobuild.buildroot.net/results/15962c15a67149dcd365426808dd9c67f3489d99 | ORPH
   nios2     |          linux-6.9.8           | NOK | http://autobuild.buildroot.net/results/358cc1987c552e33d78f74c9b11606ad77811502 | ORPH
    m68k     |          linux-6.9.8           | NOK | http://autobuild.buildroot.net/results/ce2e7fcfc2ce1a0bbf7b1aa91b114a78511a912a | ORPH
    sh4a     |          linux-6.9.8           | NOK | http://autobuild.buildroot.net/results/a1ea479e67244a594c4fae4df1f0a500abfcbeab | ORPH
   sh4aeb    |          linux-6.9.8           | NOK | http://autobuild.buildroot.net/results/241aa78d552d01975653f790392f6b5e11bd4b87 | ORPH
    mips     |          linux-6.9.8           | NOK | http://autobuild.buildroot.net/results/a69616be375daf0d4acba44d1397c69977a5913a | ORPH
 powerpc64   |          linux-tools           | NOK | http://autobuild.buildroot.net/results/3f88f3045514c402202ce619405b5eddab981667 | ORPH
   x86_64    |          linux-tools           | NOK | http://autobuild.buildroot.net/results/55712a4802da1120c47684b6cdba676a2f23e14f | ORPH
    arm      |         lrzsz-0.12.20          | NOK | http://autobuild.buildroot.net/results/076db37c936786291028b770ef2f83cd39f87ef3 | ORPH
  aarch64    | ltrace-82c66409c7a93ca6ad2e... | NOK | http://autobuild.buildroot.net/results/6d4b14e6ab345fa1433a4c780a4707828d1488f1 | ORPH
 aarch64_be  |        lynx-2.8.9rel.1         | NOK | http://autobuild.buildroot.net/results/757d6d65d7c8a97899ac0ae382eb61adf9335563 |     
  sparc64    |        mariadb-10.11.6         | NOK | http://autobuild.buildroot.net/results/bba0479a22c5f94a539d09fe86652e97127e4d81 | ORPH
    arm      |          mender-3.4.0          | NOK | http://autobuild.buildroot.net/results/64ba385c0f413347494855a94d3f103dd0237e7d |     
    i686     |          mender-3.4.0          | NOK | http://autobuild.buildroot.net/results/5c7d67bafcaf0a4ee42c74858914bc28c90d1118 |     
  aarch64    |          mender-3.4.0          | NOK | http://autobuild.buildroot.net/results/7c4b84fc59fba2c14c3e9e6916557e1fe59de95d |     
  aarch64    |          mender-3.4.0          | NOK | http://autobuild.buildroot.net/results/c71b2fbf1f81c0f5877fb2e1785d6dcaf36a6e4d |     
 aarch64_be  |         mesa3d-24.0.9          | NOK | http://autobuild.buildroot.net/results/ee1953b7a4a96d5c6a3f09b68ad9953443c84d0c |     
  riscv64    |      moby-buildkit-0.11.6      | NOK | http://autobuild.buildroot.net/results/9bba84416b25c820d78ef5b0065937286d905728 |     
    i686     |         mokutil-0.7.2          | NOK | http://autobuild.buildroot.net/results/05ac319bfb2a252f3dcdc5d04761f276afb53b6f |     
   s390x     |           ncmpc-0.49           | NOK | http://autobuild.buildroot.net/results/bd67bc02327bffc958ae393e88abaf0dd467f10d |     
  sparc64    |           ncmpc-0.49           | NOK | http://autobuild.buildroot.net/results/bb6453afc1968d1eb480f828e3a8d07a99b6dc20 |     
   x86_64    |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/f3c8de047bff93714c74205c895aba192c8113dd | ORPH
 microblaze  |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/58178b2881fb971fabf820b74fc46c3ed7794638 | ORPH
 aarch64_be  |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/690350b8e480aa0936769838cfdf6da1662f086b | ORPH
   mipsel    |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/8bf99ab0dcd4c54c278ccc191eaf5927b0938feb | ORPH
microblazeel |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/1fabbabb3049f855343c4604b330383672bb8986 | ORPH
 microblaze  |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/4797ec55b1be78aac5b69a51bfd66eb647edfba3 | ORPH
    or1k     |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/06e9ffc1faaaf4f97dc21fac255e9b81474a97c9 | ORPH
    mips     |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/1010e36c72c7db9115bc8104f9bf1bfe255acc7a | ORPH
microblazeel |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/9195fe9e1f855d182a6e65884e8601ed45bc9cc4 | ORPH
   xtensa    |          ntp-4.2.8p18          | NOK | http://autobuild.buildroot.net/results/01da64c50d6b64b2454756ba93a0767e0792893f |     
    i686     |          ntp-4.2.8p18          | NOK | http://autobuild.buildroot.net/results/9c913ccb120655aab7ac63ab62fb0483c5e8c70a |     
    arc      |          ntp-4.2.8p18          | NOK | http://autobuild.buildroot.net/results/923f796ff981fcdc19554d123c730d7fbc94c2e1 |     
  aarch64    |         nushell-0.85.0         | NOK | http://autobuild.buildroot.net/results/e8c78cd76379f5a8471ed0e8d82618e85e38aa3c | ORPH
   nios2     |       open62541-v1.3.11        | NOK | http://autobuild.buildroot.net/results/b682395f53308073cf55c84df78f26310ce4c915 | ORPH
powerpc64le  |         openssh-9.8p1          | NOK | http://autobuild.buildroot.net/results/84ab2ccd618e08b124bc255bf542949aac1402b3 | ORPH
powerpc64le  |       parsec-tool-0.7.0        | NOK | http://autobuild.buildroot.net/results/f13cd1e0dd1230566e6bb5944bfe2c067296363b |     
  powerpc    |       parsec-tool-0.7.0        | NOK | http://autobuild.buildroot.net/results/d5a262787cb3f6e4aa9cdb2a2df65ed333fa767a |     
   arceb     |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.net/results/495f329f5953222b597f591d20926c00fd7eec51 | ORPH
 powerpc64   |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.net/results/8f4372ba7edd89bfa11ca9850f1aaefa3499fd92 | ORPH
  sparc64    |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.net/results/f7a9a17425260d2b6d6efb230e19d620a94f0ae7 | ORPH
   nios2     |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.net/results/73ce84859a7194d9c7dcc0077a3f84748dc3321b | ORPH
    mips     |    python-autocommand-2.2.2    | NOK | http://autobuild.buildroot.net/results/a4b36af7f6a2a6f9c9475f2e9c56262a43d71891 |     
   mipsel    |    python-autocommand-2.2.2    | NOK | http://autobuild.buildroot.net/results/92922aadb1c02c609e96c5b3b23b7fc2762b4172 |     
  powerpc    |    python-autocommand-2.2.2    | NOK | http://autobuild.buildroot.net/results/8f60b9f12b5e6ad16213d7d7086ccc4805cc7633 |     
powerpc64le  |    python-autocommand-2.2.2    | NOK | http://autobuild.buildroot.net/results/36723768acc2681076d83d95b2bc66ccce323817 |     
   x86_64    |    python-autocommand-2.2.2    | NOK | http://autobuild.buildroot.net/results/337b58c318b98e5e4c37327558f3c8ebfdf928b2 |     
   mipsel    |    python-autocommand-2.2.2    | NOK | http://autobuild.buildroot.net/results/20ad572a2ccd13b2a74486518a465e57a23d6df0 |     
  sparc64    |    python-autocommand-2.2.2    | NOK | http://autobuild.buildroot.net/results/4e4f1b79af183f70d93d9a75fb61bef15c8ff02c |     
   nios2     |   python-cryptography-39.0.2   | NOK | http://autobuild.buildroot.net/results/2d8af3eae69f44a645045234333a49ba511c335b |     
    m68k     |   python-cryptography-39.0.2   | NOK | http://autobuild.buildroot.net/results/ce7873f65e58c2bba6150806dc3b6e301ab684b2 |     
    mips     |   python-cryptography-39.0.2   | NOK | http://autobuild.buildroot.net/results/643ea73ca256d9c76e5b13cb46fee72fdd1f5341 |     
  powerpc    |   python-cryptography-39.0.2   | NOK | http://autobuild.buildroot.net/results/21070e80e3a660e8421b91f69480e20306690ad2 |     
   x86_64    |      python-daemon-3.0.1       | NOK | http://autobuild.buildroot.net/results/2097ac1a70f553d819976cd54a23ba5b2daf2965 |     
  mips64el   |      python-daemon-3.0.1       | NOK | http://autobuild.buildroot.net/results/8106cd1bb98850d9fccb78ae59eee4d03f6ed341 |     
    i686     |      python-numpy-1.25.0       | NOK | http://autobuild.buildroot.net/results/632c465dd3b3b00c9e81f4cc0273559db29a69ea |     
   s390x     |     python-remi-2022.7.27      | NOK | http://autobuild.buildroot.net/results/4e3345478c9de44a6515c12d83028512d91f1eba |     
 aarch64_be  |     python-remi-2022.7.27      | NOK | http://autobuild.buildroot.net/results/4c45062b47cad1b8045d9a4c492c36b39cb0d636 |     
 microblaze  | python-unittest-xml-reporti... | NOK | http://autobuild.buildroot.net/results/db5e0d65e3bb454e35292ea8405a653e04ab5411 |     
  aarch64    |         rocksdb-6.20.3         | NOK | http://autobuild.buildroot.net/results/f466347bb1c091f475f48af90c63eb076ffe1423 |     
  aarch64    |           rtty-8.1.0           | NOK | http://autobuild.buildroot.net/results/85746a9635e284a8e507dec52787fda226ea0a57 |     
   x86_64    |         s6-dns-2.3.7.2         | NOK | http://autobuild.buildroot.net/results/fc27e019b29e03a3f037c07916dc1c6f925bb0a6 |     
    i686     |         s6-dns-2.3.7.2         | NOK | http://autobuild.buildroot.net/results/f97634e33c4ed94d6ab382a7c266288d814cfa0b |     
   mipsel    |         s6-dns-2.3.7.2         | NOK | http://autobuild.buildroot.net/results/f3d0a4d289745d6ed629286e67d81624aca88ae9 |     
   sparc     |         s6-dns-2.3.7.2         | NOK | http://autobuild.buildroot.net/results/21f0a0d4224ce01bd7fa8d1c4d71ba1f121a6f7f |     
microblazeel |         shadow-4.15.1          | NOK | http://autobuild.buildroot.net/results/af9916c2cfaa838f079eee2e6e247a5d08459f4b |     
  mips64el   |     spirv-tools-1.3.261.1      | NOK | http://autobuild.buildroot.net/results/16d2cf2ffc9ceacf8d34714dfa3d13a4eb4f280a | ORPH
    or1k     | squeezelite-71c012ad9ba102f... | NOK | http://autobuild.buildroot.net/results/f13f80f6dab76042745b6e8896b796549237a069 |     
   s390x     | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/486c37cbd4e252bbc115312010845ff6f8261dc8 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/439826ca9c20334f27048b8d1923f7a0856106fe |     
   sparc     |            unknown             | NOK | http://autobuild.buildroot.net/results/098c359cf145d3e7d184ee5e9f929e3a9d4d58f8 |     
    i686     |            unknown             | NOK | http://autobuild.buildroot.net/results/f14fd53590e56e67059a0fba431afa9d97deb337 |     
  mips64el   |        valgrind-3.22.0         | NOK | http://autobuild.buildroot.net/results/1f73d325b58d2f486b642bf578e1177869e854b0 | ORPH
    arm      |         wlroots-0.16.2         | NOK | http://autobuild.buildroot.net/results/3ca903fc31418248b2c844f1afdd697c047ce186 |     
   armeb     |            xz-5.6.2            | NOK | http://autobuild.buildroot.net/results/e48f3cbcf9bb44c68d65864f7ce1a0d9511f3063 | ORPH
   xtensa    |            xz-5.6.2            | NOK | http://autobuild.buildroot.net/results/5080dd617f4f92ca4070cc209dead76dd3b0b9cd | ORPH
   armeb     |            xz-5.6.2            | NOK | http://autobuild.buildroot.net/results/758b246f180bf8f2d9b8aab7be164c0dc712492e | ORPH
   xtensa    |            xz-5.6.2            | NOK | http://autobuild.buildroot.net/results/49d20f262935d1ea39caedef4a36386e47e4d6c8 | ORPH
   arceb     |            xz-5.6.2            | NOK | http://autobuild.buildroot.net/results/a76ab772b4572a4d830bcf5e352581ecae210151 | ORPH
    arc      |            xz-5.6.2            | NOK | http://autobuild.buildroot.net/results/ad0cd62a4a8a0af33a98e59b2d6436e58b5682ec | ORPH


Classification of failures by reason for 2024.02.x
--------------------------------------------------

           at-spi2-core-2.50.0 | 1 
                    bat-0.24.0 | 1 
                gnu-efi-3.0.17 | 1 
                libressl-3.8.4 | 1 
                  linux-6.6.37 | 1 
                    ncmpc-0.49 | 1 
             strongswan-5.9.13 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |      at-spi2-core-2.50.0       | NOK | http://autobuild.buildroot.net/results/69d081537a38af7598ae1b93475b7e18b26aaaa5 |     
    i686     |           bat-0.24.0           | NOK | http://autobuild.buildroot.net/results/d9a94caeea391521bfbd3a677705f5069bb3b0f0 |     
   armeb     |         gnu-efi-3.0.17         | NOK | http://autobuild.buildroot.net/results/99af4c775310f386cb7744e23bfd312cf703f04c |     
 microblaze  |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/adf1517337159cac3e9d3498abbfc6b5ebb837a1 | ORPH
   mips64    |          linux-6.6.37          | NOK | http://autobuild.buildroot.net/results/fb29c8e636ee3e849b4f2e28177cfcf6866f9c32 | ORPH
   x86_64    |           ncmpc-0.49           | NOK | http://autobuild.buildroot.net/results/6aae1d69ae13e09d512a8341834f2b0381023c34 |     
   mips64    |       strongswan-5.9.13        | NOK | http://autobuild.buildroot.net/results/10076528945efe40af2abcf9af24207ce5f27570 |     


Classification of failures by reason for 2024.05.x
--------------------------------------------------

                 coreutils-9.3 | 1 
                     crun-1.12 | 1 
                elfutils-0.189 | 1 
                fail2ban-1.0.2 | 1 
                  libbpf-1.1.0 | 1 
                       unknown | 1 
                    volk-3.0.0 | 1 


Detail of failures for 2024.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   xtensa    |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/36a5acd381b54525e72e108432cb121b34b06a50 | ORPH
    m68k     |           crun-1.12            | NOK | http://autobuild.buildroot.net/results/4a6d8146b871f036d53e3d667a99c427212350a4 |     
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/5ca2aa5c76415690ad4a85837ba47e7bcfbdbcbc | ORPH
   mipsel    |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/58647f8b7244f1b6c4a0afc0da074f1e6340851b |     
  mips64el   |          libbpf-1.1.0          | NOK | http://autobuild.buildroot.net/results/b261a08573a90c6df4b3517a2a7fbef2d2f28985 |     
   armeb     |            unknown             | NOK | http://autobuild.buildroot.net/results/aec35f9adcaf57e8538923cddcf95dd367b8af63 |     
  powerpc    |           volk-3.0.0           | NOK | http://autobuild.buildroot.net/results/ddfa9b2ce4f44ade92fe810d9476adeeed0df3c9 |     


Gitlab CI results for 2024-07-25
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
                  at91sam9260eknf | https://gitlab.com/buildroot.org/buildroot/-/jobs/7422089270  |      
                   at91sam9g20dfc | https://gitlab.com/buildroot.org/buildroot/-/jobs/7422089274  |      
                 at91sam9g45m10ek | https://gitlab.com/buildroot.org/buildroot/-/jobs/7422089279  |      
                     at91sam9rlek | https://gitlab.com/buildroot.org/buildroot/-/jobs/7422089281  |      
                 atmel_sama5d3xek | https://gitlab.com/buildroot.org/buildroot/-/jobs/7422089358  |      
                        bananapro | https://gitlab.com/buildroot.org/buildroot/-/jobs/7422089405  | ORPH 
                   beagleboneai64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7422089412  |      
                       beagleplay | https://gitlab.com/buildroot.org/buildroot/-/jobs/7422089418  |      
                      beelink_gs1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7422089421  |      
                  chromebook_snow | https://gitlab.com/buildroot.org/buildroot/-/jobs/7422089430  |      
                             ci20 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7422089432  |      
                      cubieboard2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7422089437  |      
            engicam_imx6qdl_icore | https://gitlab.com/buildroot.org/buildroot/-/jobs/7422089438  |      
        engicam_imx6qdl_icore_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7422089441  |      
        engicam_imx6qdl_icore_rqs | https://gitlab.com/buildroot.org/buildroot/-/jobs/7422089442  |      
              engicam_imx6ul_geam | https://gitlab.com/buildroot.org/buildroot/-/jobs/7422089443  |      
             engicam_imx6ul_isiot | https://gitlab.com/buildroot.org/buildroot/-/jobs/7422089445  |      
        freescale_imx6dlsabreauto | https://gitlab.com/buildroot.org/buildroot/-/jobs/7422089449  |      
          freescale_imx6dlsabresd | https://gitlab.com/buildroot.org/buildroot/-/jobs/7422089451  |      
         freescale_imx6qsabreauto | https://gitlab.com/buildroot.org/buildroot/-/jobs/7422089452  |      
           freescale_imx6qsabresd | https://gitlab.com/buildroot.org/buildroot/-/jobs/7422089455  |      
          freescale_imx6sxsabresd | https://gitlab.com/buildroot.org/buildroot/-/jobs/7422089456  |      
           freescale_imx7dsabresd | https://gitlab.com/buildroot.org/buildroot/-/jobs/7423016459  |      
             freescale_imx8dxlevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/7422089463  |      
              freescale_imx8mmevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/7422089464  |      
              freescale_imx8mnevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/7422089467  |      
              freescale_imx8mpevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/7422089468  |      
              freescale_imx8mqevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/7422089470  |      
              freescale_imx8qmmek | https://gitlab.com/buildroot.org/buildroot/-/jobs/7422089474  |      
             freescale_imx8qxpmek | https://gitlab.com/buildroot.org/buildroot/-/jobs/7422089475  |      
           friendlyarm_nanopi_r2s | https://gitlab.com/buildroot.org/buildroot/-/jobs/7422089485  |      
                   imx6-sabreauto | https://gitlab.com/buildroot.org/buildroot/-/jobs/7422089504  |      
                        imx6slevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/7422089509  |      
                       imx6sx-sdb | https://gitlab.com/buildroot.org/buildroot/-/jobs/7422089512  |      
                        imx6ulevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/7422089515  |      
                       imx6ulpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/7422089519  |      
                        imx7dpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/7422089529  |      
                        imx8mqevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/7422089537  |      
               kontron_pitx_imx8m | https://gitlab.com/buildroot.org/buildroot/-/jobs/7422089547  |      
                       ls1028ardb | https://gitlab.com/buildroot.org/buildroot/-/jobs/7422089558  |      
                     ls1046a-frwy | https://gitlab.com/buildroot.org/buildroot/-/jobs/7422089559  |      
                mender_x86_64_efi | https://gitlab.com/buildroot.org/buildroot/-/jobs/7422089561  | ORPH 
                          mx25pdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/7422089579  |      
                   mx6sx_udoo_neo | https://gitlab.com/buildroot.org/buildroot/-/jobs/7422089592  |      
                          mx6udoo | https://gitlab.com/buildroot.org/buildroot/-/jobs/7422089595  |      
              octavo_osd32mp1_brk | https://gitlab.com/buildroot.org/buildroot/-/jobs/7422089616  |      
              octavo_osd32mp1_red | https://gitlab.com/buildroot.org/buildroot/-/jobs/7422089618  |      
                        odroidxu4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7422089622  |      
                   orangepi_lite2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7422089653  |      
                orangepi_one_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/7422089658  |      
                       pandaboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/7422089673  |      
                           pine64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7422089680  |      
                    pine64_sopine | https://gitlab.com/buildroot.org/buildroot/-/jobs/7422089682  |      
                qemu_aarch64_sbsa | https://gitlab.com/buildroot.org/buildroot/-/jobs/7422089686  |      
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/7422089780  | ORPH 
                        riotboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/7422089799  |      
                           rock5b | https://gitlab.com/buildroot.org/buildroot/-/jobs/7422089803  |      
                           rock64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7422089807  |      
                       rock_pi_n8 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7422089810  |      
             sipeed_licheepi_zero | https://gitlab.com/buildroot.org/buildroot/-/jobs/7422089826  |      
               snps_arc700_axs101 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7422089841  |      
                 snps_arc700_nsim | https://gitlab.com/buildroot.org/buildroot/-/jobs/7422089842  | ORPH 
                snps_archs38_haps | https://gitlab.com/buildroot.org/buildroot/-/jobs/7422089844  |      
                snps_archs38_hsdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/7422089846  |      
                socrates_cyclone5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7422089848  |      
                     ti_am62ax_sk | https://gitlab.com/buildroot.org/buildroot/-/jobs/7422089865  |      
                      ti_am62x_sk | https://gitlab.com/buildroot.org/buildroot/-/jobs/7422089866  |      
                      ti_am64x_sk | https://gitlab.com/buildroot.org/buildroot/-/jobs/7422089867  |      
              toradex_apalis_imx6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7422089868  |      
                           ts4900 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7422089869  | ORPH 
                           ts7680 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7422089872  |      



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
