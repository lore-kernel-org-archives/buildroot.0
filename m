Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80CFBC27C6E
	for <buildroot@archiver.kernel.org>; Mon, 17 Jun 2024 07:28:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7607D406F2;
	Mon, 17 Jun 2024 07:28:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uodWWHpHBHBS; Mon, 17 Jun 2024 07:28:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0E220404E2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0E220404E2;
	Mon, 17 Jun 2024 07:28:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9A7871BF2AF
 for <buildroot@lists.busybox.net>; Mon, 17 Jun 2024 04:41:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7C3556082D
 for <buildroot@lists.busybox.net>; Mon, 17 Jun 2024 04:41:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wl-uPnGM2NCX for <buildroot@lists.busybox.net>;
 Mon, 17 Jun 2024 04:41:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E8C3D60819
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E8C3D60819
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E8C3D60819
 for <buildroot@buildroot.org>; Mon, 17 Jun 2024 04:41:18 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id F2F29FF80E
 for <buildroot@buildroot.org>; Mon, 17 Jun 2024 04:41:15 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Mon, 17 Jun 2024 04:41:15 -0000
X-GND-Sasl: bot@bootlin.com
X-Mailman-Approved-At: Mon, 17 Jun 2024 07:28:44 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1718599276; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=6G2TpedueeTCjfsN4Z2LJlc8x2cR03QY6XuBJiWOaoU=;
 b=YYVDFG1RuF7vptnB3pVgF9e2xWVypQiR5FEd1BZJOnSYBBSs8mumfmHigXV+5il7j2FFIo
 EjTg1xx+jIuzorKPMk7QBBcuDb3+B0Y/LWk3LQD8+zFyzkr/Wt1dARtyvgODdaDUoQ2qkw
 J86tBouiDUglTWApyaB16Uhjc+VyZfur04MoNkTsvKvh8TcFt25TYZ8xepMKsmwel9iQNi
 xWzN2LY4725DjpYFGEQE8jYUJYAp/lMMfcDcjBiINA0SVwXCyKRbi1maZCBWR6fQ5OazGi
 yfYH3ZI7aUII0XtP+1VUrj90UjMAscN0L2BIFYG15NnaBOx6ab4lLEJE2Ijejg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=YYVDFG1R
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2024-06-16
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
Message-ID: <20240617044115.ZM8BEti1LpOzDj-6edyuYbzhpAAL9UX7vRUEQPobxpE@z>

Hello,

Autobuild statistics for 2024-06-16
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  5  |  6  |  0  | 11  |
  2024.05.x  |  5  |  6  |  0  | 11  |
    master   | 153 | 507 |  1  | 661 |

Classification of failures by reason for master
-----------------------------------------------

host-prelink-cross-a853a5d7... | 66
            host-cdrkit-1.1.11 | 62
ibm-sw-tpm2-5452af422edeff7... | 20
                    mpir-3.0.0 | 18
host-android-tools-4.2.2+gi... | 16
                host-odb-2.4.0 | 16
                fail2ban-1.0.2 | 15
      host-riscv-isa-sim-1.1.0 | 15
                libressl-3.8.4 | 15
                   host-go-src | 14
                elfutils-0.189 | 10
                  ffmpeg-6.1.1 | 10
host-vboot-utils-bbdd62f9b0... | 10
                   linux-6.9.4 | 10
                 coreutils-9.3 | 7 
                gnu-efi-3.0.18 | 7 
               libglib2-2.76.1 | 7 
              libopenssl-3.3.1 | 7 
                  bcusdk-0.0.5 | 6 
                   foot-1.16.2 | 6 
glibc-2.39-5-ge0910f1d3278f... | 6 
check-11970a7e112dfe243a2e6... | 5 
 host-softether-4.30-9700-beta | 5 
                 openssh-9.7p1 | 5 
                python3-3.11.8 | 5 
aer-inject-9bd5e2c7886fca72... | 4 
            gdk-pixbuf-2.42.10 | 4 
host-heimdal-f4faaeaba371ff... | 4 
          libcamera-apps-1.2.1 | 4 
                  libffi-3.4.6 | 4 
                       unknown | 4 
android-tools-4.2.2+git2013... | 3 
                     crun-1.12 | 3 
                 gnuplot-6.0.0 | 3 
         host-gcc-final-13.3.0 | 3 
               ipmitool-1_8_19 | 3 
                  libsepol-3.6 | 3 
     linux-5.10.162-cip24-rt10 | 3 
           mediastreamer-4.4.8 | 3 
                s6-dns-2.3.7.1 | 3 
               alsa-lib-1.2.11 | 2 
     bandwidthd-2.0.1-auto-r11 | 2 
  gobject-introspection-1.76.1 | 2 
               gocryptfs-2.3.2 | 2 
                host-go-1.22.4 | 2 
         host-libxcrypt-4.4.36 | 2 
     host-moby-buildkit-0.11.6 | 2 
                  kexec-2.0.28 | 2 
              libarchive-3.7.4 | 2 
                  libnss-3.100 | 2 
          linux-5.10.162-cip24 | 2 
                  ntp-4.2.8p17 | 2 
         python-remi-2022.7.27 | 2 
                    sslh-2.0.1 | 2 
                  acpid-2.0.34 | 1 
                acpitool-0.5.1 | 1 
                 apache-2.4.59 | 1 
                apparmor-3.1.7 | 1 
           at-spi2-core-2.50.0 | 1 
                    attr-2.5.2 | 1 
                 avro-c-1.11.3 | 1 
                    bat-0.24.0 | 1 
                beecrypt-4.2.1 | 1 
  binutils-arc-2023.09-release | 1 
                   bzip2-1.0.8 | 1 
                 c-icap-0.5.10 | 1 
                  cairo-1.17.4 | 1 
                  cc-tool-0.27 | 1 
                  clang-15.0.3 | 1 
                   cpuload-0.3 | 1 
                enscript-1.6.6 | 1 
                   exim-4.97.1 | 1 
                     file-5.45 | 1 
           flatbuffers-23.5.26 | 1 
             gnuradio-3.10.7.0 | 1 
         gobject-introspection | 1 
google-breakpad-f49c2f1a202... | 1 
                    gpm-1.20.7 | 1 
                 highway-1.1.0 | 1 
 host-binutils-bare-metal-2.42 | 1 
             host-delve-1.22.1 | 1 
         host-gcc-final-14.1.0 | 1 
              host-rust-1.74.1 | 1 
                    htop-3.3.0 | 1 
kvmtool-4d2c017f41533b0e51e... | 1 
             libargtable2-2.13 | 1 
                libdrm-2.4.120 | 1 
               libunwind-1.8.1 | 1 
               lighttpd-1.4.76 | 1 
                   linux-tools | 1 
               mariadb-10.11.6 | 1 
                memtest86-6.20 | 1 
                moarvm-2023.12 | 1 
                mongodb-4.2.18 | 1 
              mosquitto-2.0.18 | 1 
                  octave-9.2.0 | 1 
               openblas-0.3.27 | 1 
                opencv3-3.4.19 | 1 
                openswan-3.0.0 | 1 
   openvmtools-11.3.5-18557794 | 1 
pppd-e1266c76d1ad39f98f1167... | 1 
           python-numpy-1.25.0 | 1 
   python-pydantic-core-2.14.6 | 1 
            python-scapy-2.5.0 | 1 
           python-zlmdb-22.6.1 | 1 
                    qemu-9.0.0 | 1 
rtl8189es-eb51e021b0e1b6f94... | 1 
                    ruby-3.3.1 | 1 
                 shadow-4.14.5 | 1 
                 siproxd-0.8.3 | 1 
squeezelite-71c012ad9ba102f... | 1 
             stress-ng-0.17.07 | 1 
                 syslinux-6.03 | 1 
tftpd-b2b34cecc8cbc18ff6f1f... | 1 
              tinyssh-20240101 | 1 
                 uclibc-1.0.48 | 1 
ulog-0389d243352255f6182326... | 1 
             util-linux-2.39.3 | 1 
                 wavemon-0.9.5 | 1 
                 x11vnc-0.9.16 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |          acpid-2.0.34          | NOK | http://autobuild.buildroot.net/results/7c8738cae6c91657a3dc9c90b147024afa864919 | ORPH
 microblaze  |         acpitool-0.5.1         | NOK | http://autobuild.buildroot.net/results/e0fa7eb83f39d61a641596b9747f0fe49b00ac32 |     
  sparc64    | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/cbbc18882f13a668806b211886f15fba99d6f639 | ORPH
   x86_64    | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/77946017adf84bb3ea3036db46a626ab4b1b34d4 | ORPH
   x86_64    | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/2b188e474d74cf49a2448e7136dded7dbcd0a6a9 | ORPH
    or1k     | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/14ac7b42c18a5a9f986ee9e828f1b3ae97ff26d5 | ORPH
powerpc64le  |        alsa-lib-1.2.11         | NOK | http://autobuild.buildroot.net/results/5ada9a33754b0086c6773e48f909f58e6093330c |     
powerpc64le  |        alsa-lib-1.2.11         | NOK | http://autobuild.buildroot.net/results/0a69ebdc9cc5b147eaea5557a654486e03b95e16 |     
   arceb     | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/5a0af7a99ffae972b1548f5ce88cd600e070fbd1 |     
    i586     | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/d6d07312f59e0ebf88ab11915da74a9d4d4ad3d5 |     
   armeb     | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/43cf2da0765a31393bb2feb4d48cc5343cf139b5 |     
  aarch64    |         apache-2.4.59          | NOK | http://autobuild.buildroot.net/results/a0f68dad14310ec22e6b0f2a05ae802e01a648c5 |     
    arc      |         apparmor-3.1.7         | NOK | http://autobuild.buildroot.net/results/517fa6d1ac347d12e62f481eda1010b187e1dd78 |     
  mips64el   |      at-spi2-core-2.50.0       | NOK | http://autobuild.buildroot.net/results/1057d6f953f5ccbb2f195915146abb4698f379c0 |     
   mips64    |           attr-2.5.2           | NOK | http://autobuild.buildroot.net/results/bb819271e8c5e8125a92f37918385fed86e03e1a |     
    i686     |         avro-c-1.11.3          | NOK | http://autobuild.buildroot.net/results/34ff09b696701705119325f09772249fe9765ddb |     
  powerpc    |   bandwidthd-2.0.1-auto-r11    | NOK | http://autobuild.buildroot.net/results/dfd3ee1b3db361265354a12f810426d5d5fb4272 |     
   nios2     |   bandwidthd-2.0.1-auto-r11    | NOK | http://autobuild.buildroot.net/results/a716e31292848e24465bd67b81e698fba399c51a |     
    i686     |           bat-0.24.0           | NOK | http://autobuild.buildroot.net/results/60977048f671671caa1d4bfa948495af2f406869 |     
   armeb     |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/7df1b771d1ed7183c9b20b04698500c70988025c |     
   arceb     |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/831c678a743bfe93d9bb5693cb0a86528c257aeb |     
 microblaze  |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/773d9b17179369b19d3589f9072bdd33217ae656 |     
  sparc64    |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/6631b528d3efde48d4ec30225759ae5a28bd9516 |     
powerpc64le  |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/e983bfe9157d38caeea694789a8e80374d1bc99a |     
  sparc64    |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/df1131b69a8c8096f22c25cc25cddf4bed978ec9 |     
  aarch64    |         beecrypt-4.2.1         | NOK | http://autobuild.buildroot.net/results/f8bcace998ddb7a0e555091c94e1f8ac06ba34fe | ORPH
   arceb     |  binutils-arc-2023.09-release  | NOK | http://autobuild.buildroot.net/results/86666ec76024986949cb09452ba75307441513a5 |     
  riscv32    |          bzip2-1.0.8           | NOK | http://autobuild.buildroot.net/results/9d2f1ca61aa52aab65696e66a828ee21e729aeb7 | ORPH
   nios2     |         c-icap-0.5.10          | NOK | http://autobuild.buildroot.net/results/2a6c83fa4b3fc3615acbe4faad187b73b4c85438 | ORPH
   arceb     |          cairo-1.17.4          | NOK | http://autobuild.buildroot.net/results/18ac208fb959c60e97e480061c28c19bdf1547f9 |     
  riscv64    |          cc-tool-0.27          | NOK | http://autobuild.buildroot.net/results/1719999db8dede8dd88ebd6340342969bf37abde |     
  riscv64    | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/b0552cd05e2398732ea38f5d735b2acc725baf24 | ORPH
  riscv64    | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/13d03ea637dfb32febabee7a815f1f616fe58c4d | ORPH
    sh4      | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/16c3173277e711065187123761372ca3deba33f8 | ORPH
    i586     | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/ec0aaab079ed0587d00be74e638e25b27d7e3c9a | ORPH
microblazeel | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/6046bf755e90d189e329d87c54aa974f7b1352e1 | ORPH
  riscv32    |          clang-15.0.3          | NOK | http://autobuild.buildroot.net/results/71cbfce30a88649d00ac70d05874af01d910af50 |     
    arc      |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/7519ed020d69829269377b585d51dfc016d71e3a | ORPH
    mips     |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/447a320de78fd428269d2031d575cfaea45c56d3 | ORPH
   sparc     |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/f9ae3fad20b7e2c7ebba150fc049b71a96be9211 | ORPH
    sh4      |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/82dba9163521e3ae440803edc30dbc51fdcde568 | ORPH
    arc      |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/03187a1e720868f5cac2ea3154e3a0c54c22391c | ORPH
   sh4eb     |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/fd62f23c0145fce63f5e78a247f97c6bddef2983 | ORPH
    arm      |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/f13d2f7755d9aae9d708b46cb38c0022f27cc3ff | ORPH
  sparc64    |          cpuload-0.3           | NOK | http://autobuild.buildroot.net/results/ff79b7c0f015d4e48fd1373cd4fc060d18524806 |     
 aarch64_be  |           crun-1.12            | NOK | http://autobuild.buildroot.net/results/7f6e1cb109c2c887043ddc92737666a0ab56355c |     
   x86_64    |           crun-1.12            | NOK | http://autobuild.buildroot.net/results/4271f3d31fc9223ba7c85ae81a297f87177d93b2 |     
  mips64el   |           crun-1.12            | NOK | http://autobuild.buildroot.net/results/400c2ef2c6e08bf63e1213ed4f719122960e3ad8 |     
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/b67c5fddf71057da0651d1876f3e9b85fab1026b | ORPH
    mips     |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/276a50e63985c761b00eeb694720935c63035232 | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/d1a0c289edbe63dd1029518aeebe11bd0420c611 | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/40c463a4e5294729eeff53e4f345099380f82bdf | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/d99aa59e247f79e457813918c79af838d78d2bd4 | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/7ce28d7f0874c3d59ef3742a5b400b0dde6bbbeb | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/373694479b5e809a859d9bf572eb4dde3376ef0b | ORPH
   x86_64    |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/10703c16cd36ffa07cf95b13cfbfaf2e763b25ba | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/bc48428a4e8fa738042c66dd180a7c417184371a | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/3e28c1c854787977e019a12fc0e618bb4acf5bbe | ORPH
 aarch64_be  |         enscript-1.6.6         | NOK | http://autobuild.buildroot.net/results/52766feb2c3f63aa47f1add98e4733ab687996e6 | ORPH
    arc      |          exim-4.97.1           | NOK | http://autobuild.buildroot.net/results/a9c22113e058c8d9ba516913265893a33c264948 |     
powerpc64le  |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/d618f7b0fd16d4b083b06435dda870508996419b |     
 powerpc64   |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/9fb2a52ffc77f3ac39c691d036f55e49e3fe7b9e |     
    i686     |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/6d59482a0167f43aff97ca36a2a39d44aa233b5a |     
   mips64    |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/477b29b9c1d2cd3757264de4e9930a56d7f11ffd |     
microblazeel |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/99512b4751a3aea94af782f72e0369a45d9ab54a |     
  sparc64    |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/cf39a797421a2482af419538e7072d7673fc3d87 |     
    arc      |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/8290a3996913de097803615205390add659355fc |     
  aarch64    |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/eec1763bbafa396d15d2f014f51414ffafcc653e |     
   mips64    |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/b7bc108ba64738c3aed25984294ff1c7f7fe141a |     
 aarch64_be  |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/c233b33c9fc40a10fe62332c51871ab51bf7394f |     
    or1k     |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/d8b48d5416e026fb993f2a31f85b5b8324fba2f0 |     
    m68k     |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/cf24f494f113ccf25fd65ad9ab85aa7582192f77 |     
    mips     |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/875b8fdf338af033d330f4302e82ade70fbcdfd6 |     
  sparc64    |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/62d0329733640d57d7e74682b10d9beb0daaeb1c |     
   mipsel    |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/28c85e85cd766c99b63d6e8458455061edbe7937 |     
   arceb     |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/932e49b80efdbe8fbbc5b33e52eb641704a560e2 |     
 microblaze  |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/da70b65050e08bcd7360cfcd7129e51a0cf5cb57 |     
    arc      |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/939af537ce3be3342817f9628ada4796d608638a |     
  sparc64    |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/082f520d5d837659e5ccfe8c07ec26520843e63b |     
 microblaze  |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/155dca56c9ac912987ea87265ca65286aa42372c |     
  riscv32    |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/17bb5fc72e999d5c5c550c993698230805f0385f |     
   arceb     |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/16c892e7b2cacce5eef0817d9fcdb98fa1bb5bc2 |     
 microblaze  |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/d4f2d5ae5c0b1563b92b7ca7ff8f894385fd3f40 |     
    arc      |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/68c57d2fb66be9caaae95693c74d50e7cdf7c7eb |     
 microblaze  |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/b21bcb6c76151efd307b1e205d4b6098997ae164 |     
    arm      |           file-5.45            | NOK | http://autobuild.buildroot.net/results/67019afa4185ee2913d99bb579dbdb986a3ab64d | ORPH
    m68k     |      flatbuffers-23.5.26       | NOK | http://autobuild.buildroot.net/results/96b8706947c46c4b2bd4c3ca9ff8c327559b7474 |     
   nios2     |          foot-1.16.2           | NOK | http://autobuild.buildroot.net/results/0fbaea85fb18a5c07930a3c9ba97a9ea33c8e60c |     
   nios2     |          foot-1.16.2           | NOK | http://autobuild.buildroot.net/results/553e0cc7ffd3e69233a1aef9f4fb37a6b51cb797 |     
   nios2     |          foot-1.16.2           | NOK | http://autobuild.buildroot.net/results/a6c6da6ca5c548f2587b1ce3e949871d46b12878 |     
  mips64el   |          foot-1.16.2           | NOK | http://autobuild.buildroot.net/results/32ab5fdc2a2c3df31c52587965a2a4daaeca1c94 |     
    m68k     |          foot-1.16.2           | NOK | http://autobuild.buildroot.net/results/c8f01500fe8ba069fb8f467655fcfcc7991daf3c |     
microblazeel |          foot-1.16.2           | NOK | http://autobuild.buildroot.net/results/07cd42b359be97e3f06beab641722ea7543156ca |     
   x86_64    |       gdk-pixbuf-2.42.10       | NOK | http://autobuild.buildroot.net/results/60a38416164ddafb61c0784bfb5e0989415bfe6c | ORPH
   mips64    |       gdk-pixbuf-2.42.10       | NOK | http://autobuild.buildroot.net/results/2613d9ec5babe3dda0d14af776dfb498431f2b9e | ORPH
    mips     |       gdk-pixbuf-2.42.10       | NOK | http://autobuild.buildroot.net/results/22afefa623176c70f6f9864f1b023e8c332255a5 | ORPH
    m68k     |       gdk-pixbuf-2.42.10       | NOK | http://autobuild.buildroot.net/results/b0efdc6863ee96562831d4560d76e97015676a20 | ORPH
  powerpc    | glibc-2.39-5-ge0910f1d3278f... | NOK | http://autobuild.buildroot.net/results/e2ddfbeda4f6a29c03af4cb71eaeab67f8b91daf |     
 powerpc64   | glibc-2.39-5-ge0910f1d3278f... | NOK | http://autobuild.buildroot.net/results/f4d01a4162ca1acefe9cb816cb1d53bbd96f3081 |     
 powerpc64   | glibc-2.39-5-ge0910f1d3278f... | NOK | http://autobuild.buildroot.net/results/45d3efb42efabe52e8c6760c3fae188abc3ac13c |     
 powerpc64   | glibc-2.39-5-ge0910f1d3278f... | NOK | http://autobuild.buildroot.net/results/464044b2fc1f96038cd387ef913100609a0c54e0 |     
 powerpc64   | glibc-2.39-5-ge0910f1d3278f... | NOK | http://autobuild.buildroot.net/results/dfd06e67300bc73a28db8de620f90fe7f336f792 |     
powerpc64le  | glibc-2.39-5-ge0910f1d3278f... | NOK | http://autobuild.buildroot.net/results/31084cfe9165d82c123cf03e54e5739f2f04c51e |     
 aarch64_be  |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/e163c6e0bac90efc40de2c5dcd2ae9cad9294602 |     
   armeb     |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/cebc4180ea4883b4f60ebab6be0e6bef71f638da |     
  riscv64    |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/6f045f61c4d31b554c0604594348b11b39fb93c6 |     
 aarch64_be  |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/28cb804ac332dd468a0dff1e9d3598df44c59dce |     
 aarch64_be  |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/99e0a4f8956de6f07158aebf7acee8d358e43ade |     
    arm      |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/275a72164923aedf6305c796ea4525f60bbb0b74 |     
   armeb     |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/cc943e19a38df85083d482c7462d765d7b5ad1f6 |     
 microblaze  |         gnuplot-6.0.0          | NOK | http://autobuild.buildroot.net/results/28a4c7a020636d347f696598df7788720ceb5cdc |     
   nios2     |         gnuplot-6.0.0          | NOK | http://autobuild.buildroot.net/results/5fd00d535435e19f3d61cf0ff4d1b23112e7f1c0 |     
   nios2     |         gnuplot-6.0.0          | NOK | http://autobuild.buildroot.net/results/c9195018a2e2dc399d586829e09d4fcc88fd7bdd |     
 aarch64_be  |       gnuradio-3.10.7.0        | NOK | http://autobuild.buildroot.net/results/9fe5ee64faf2a2cc3d28bf14d6e2f76e44e2881b |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/9589fa3dc9899b874bc73976a49589245c9d1804 |     
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/c3a91211cc8b9c4b9be0de3856674bdd58921554 | ORPH
  powerpc    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/3e755a4d49542c3ec43471dc30b7b23ac61f6211 | ORPH
powerpc64le  |        gocryptfs-2.3.2         | NOK | http://autobuild.buildroot.net/results/2de9917d7f89b0d72ccd9a274599a221458c0cb6 |     
  riscv64    |        gocryptfs-2.3.2         | NOK | http://autobuild.buildroot.net/results/ad431df4a369b46dfba25f8c9f2f4a1e2d552878 |     
   mipsel    | google-breakpad-f49c2f1a202... | NOK | http://autobuild.buildroot.net/results/f846b5e668a61c998f5e402a68d9f379b2070035 |     
   armeb     |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/2a4215481e20cb750e950ad379af9a186fcfbdea |     
 powerpc64   |         highway-1.1.0          | NOK | http://autobuild.buildroot.net/results/6b182f0b7e5a2d4cae417bff1fe0e045279eb03a |     
 microblaze  | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/8c051f36b5e4a3c716ba49d3b27eedc04fe1b0c1 |     
  sparc64    | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/5647f1615e6f55fdccfee1d695832281ec55f455 |     
    or1k     | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/ccfd8ac30fef9b69b6f996c3f55303d07c69b39d |     
microblazeel | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/4379dcbf8f00f50922fe81baeb6db32409961e3e |     
   nios2     | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/05cf3922d5c3b60b64cb9c0f1b7f332802ba64f3 |     
  aarch64    | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/4fcc8472754d7de3061f3c3b081979c869c9d636 |     
microblazeel | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/05c2f4114a88b0db51cba7e59e4b5296eb414d56 |     
   sh4aeb    | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/260b0a63be34272a79d3ada058c18ac9b9067318 |     
    or1k     | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/13851f4938f485728f3d90cfb05d59cf09d3e4db |     
   x86_64    | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/21ab7a0439744598b1c6d5a2d8214e5a78d0b0cf |     
    mips     | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/5222ea3c6d082b80c858e0048d766ca933065265 |     
   s390x     | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/2ba3b6f035d06832bfc2f47e77d865f1fcfdc02b |     
   arceb     | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/d57c96b6ea4ccf03580bbc61eb1eb5616200ba5d |     
    or1k     | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/d86896c82e520822f1ee0b9ad6e8c2eef16a0f8b |     
 aarch64_be  | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/c368749b4ec8162effea8120c42441803a472a31 |     
    i686     | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/472971a2ac1229e2b1ad66a08325d190ef547254 |     
   x86_64    | host-binutils-bare-metal-2.42  | NOK | http://autobuild.buildroot.net/results/6bb2aced7ffd6a80fe9649338463ff68ee781644 |     
   mipsel    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/b7ffbd089dac8eb42ef120c9b9943abf7c13a548 |     
  sparc64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/70d3e1ccd2a5af4aeca1c9e644e09dc73f65caf6 |     
    arm      |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/920dfe46e66c32b2d02160b221cfa610cade8c3d |     
    or1k     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/18b5d54f3bd0913a6573a7814f0ab41b9d529a2e |     
    m68k     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/a0c5ad79600ea41dc151a7a57e694c57f645f2e6 |     
 aarch64_be  |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/642f5cf712bc015f0c9e7de6d696b78e52ed0bba |     
microblazeel |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/b670e6d05d8af16d48fced48370b180ae79c7e76 |     
   armeb     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/85822cebe97dc1b89aca1935c2e164720a9198da |     
  aarch64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/a346f2728ec10b2453e9a857e3c29616d5c266d3 |     
    or1k     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/2dceaa7779d79c8d2b2a83271d1059153fdc703b |     
   nios2     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/e501d687e5ee6ba45585f79d13fea7c5d7a13f72 |     
  sparc64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/0b4938873a30ce91ea5c8e84747b5313b3454173 |     
    sh4      |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/64741ca7349b032d423e040bd26f249d67b3601e |     
  mips64el   |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/1fab121d62b1a7370e1c1eb6f3b5f9c8fb5fa28c |     
    arm      |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/ff77c8bfeee4d8d4571a96bacaae50b1c7d8dc92 |     
    arc      |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/d19243b4bb8baf6d4a1c6dba5e09ed5f9f53d90d |     
 powerpc64   |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/a5419c3df765b41f882fb1dcef76247897504e00 |     
   nios2     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/3e699747046bd0859cdaf268c93f93270d44e1d7 |     
   sparc     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/ccef8ca030c64d506a68e4716d2ab311e4382a9b |     
 aarch64_be  |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/67fa82ed328f7f77f2388475861f1e94ac815b63 |     
    m68k     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/d6ceb6c7470bc5b7a6448a379a9b77e33ebcaf99 |     
   s390x     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/7f9721dc3f644893d87ac46c9377964b07a9825c |     
   nios2     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/9f8ad824ef8a9565417abcacc2aa948585e675bd |     
   mipsel    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/fbd9c18b9325372e1aaebd424b0a85d522d7c661 |     
  aarch64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/fca6d29cceccaea6735cdb336e02f97b3e410fed |     
   s390x     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/ed058dcbd4730cd16b7b0804cb2eb1bf515defeb |     
   mips64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/ec774adb8cdb5b3d4d9dbaf026943a7e5aa64bff |     
   xtensa    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/28cd70e62ce7a9a37b5c923ac628542a3dc79c88 |     
    arm      |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/e2d528c503af751865f70bb241b209740eb5b47d |     
   sparc     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/66ec571228988a5fdcdaf635b58dfdd4b5679224 |     
powerpc64le  |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/ac8fa3a1e2fff896825f7c6496a76b8e642be6e7 |     
    i686     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/95ac90b893798a145a781eba5b4dc448543098eb |     
    or1k     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/9c0ebcf518124af19b1e826273e88333369b9421 |     
   armeb     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/9e50a224b47f5b2bacde8679871d4474801d85e7 |     
  riscv64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/72e6689e0855a67102cce8cca5ad9e4bccea4c0f |     
    i686     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/d6dbf9e7614cb40589a495e09f21ae472442b367 |     
 aarch64_be  |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/fe6e463c1abc2fa9831baab28f60ca9829f68db9 |     
  sparc64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/dff93c998d690d559637066145a8a999c4057000 |     
   arceb     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/38aacb14d8e1ab666cdabafa02f644e3fce4fea6 |     
  sparc64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/aa611d6c8fc10b9dc6dfb849ca07efd1528bf6f4 |     
powerpc64le  |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/220446dafbb0adebbd7ed64da29427277e1a16ed |     
 microblaze  |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/81ea083cffdcf359bc30d7d0b8c424c25fc6249d |     
    i586     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/ae91002293c3a986a2132dbf2920fba69539cf17 |     
    mips     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/057fcae03ad2e72c270747e4f44aae243516470f |     
   x86_64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/5f5735f33176f7f99c2ecd3d94cdbab9de875b12 |     
    i686     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/0e94f2345d52e6f4d6391cf91a6344a751ede945 |     
    mips     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/d7afe2ad7ea0f2dbbb952c3be9f4bc260f85a928 |     
  riscv64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/3947a5991bb5322d0b039ce87eeb5378aea088cb |     
 microblaze  |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/1e7f854d758e1dcdde830037828341cc04398cc3 |     
    arc      |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/f1da0814fe38f4b6d2d3f7f0272477b6bdb03969 |     
  riscv64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/b59fb0c758636f759e7526f1433fb9ca65072396 |     
   sh4aeb    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/1a68403a627a7eb5d00e9992c966a164f8be2a9f |     
 aarch64_be  |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/3849fd3dccf631ad64ed90b9615f01c922174d81 |     
    or1k     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/aec357eac0c2705b90f8f48269b1a015779eb97a |     
powerpc64le  |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/cefa7c74b0a545ae1b50395e11275ba0ab1e94df |     
   s390x     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/845907afce857bba53a3b417f7bb8543551b3d40 |     
    i686     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/2b7ab95824e1f509f7e0d2443f06d83295dd65ac |     
 microblaze  |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/9d1f4e3ffc386453491e835ae3cd334bd2c42e71 |     
    arc      |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/92eab501951540afbbf3b4b9b16f7a5accbdf662 |     
   armeb     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/3215b5362238c5f2f00ed6851e0a5bb63d4821ef |     
   armeb     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/ff85466b4e4627f62a576e0e3d8db52392d53093 |     
    or1k     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/8e9ac56fd3a6bd1cd31106efd84b60d99abe10d8 |     
  mips64el   |       host-delve-1.22.1        | NOK | http://autobuild.buildroot.net/results/4d4eeab7fba726e4edfdf633328b86cc02bf8900 |     
microblazeel |     host-gcc-final-13.3.0      | NOK | http://autobuild.buildroot.net/results/39d59453abc4a3b43f88269cacfb68430591c09a |     
 microblaze  |     host-gcc-final-13.3.0      | NOK | http://autobuild.buildroot.net/results/12fd84269436153b78cbd1ae39e04435001c686a |     
microblazeel |     host-gcc-final-13.3.0      | NOK | http://autobuild.buildroot.net/results/029fa53b72c68f7757c372059b3c3778c5fbf06d |     
powerpc64le  |     host-gcc-final-14.1.0      | NOK | http://autobuild.buildroot.net/results/585333f065b7491e8223f00ee25c5420d7442a92 |     
   x86_64    |         host-go-1.22.4         | NOK | http://autobuild.buildroot.net/results/0480782ae883c8a6b7580a1990ae13e261f2832c |     
  mips64el   |         host-go-1.22.4         | NOK | http://autobuild.buildroot.net/results/df5a1f25b8ec7dd2fbc0e014f15c7828cd9f4cfd |     
   mips64    |          host-go-src           | NOK | http://autobuild.buildroot.net/results/a4b3eca158ea4c7288ccc5b2f1dc7a57623f3264 |     
  mips64el   |          host-go-src           | NOK | http://autobuild.buildroot.net/results/c1bc02bf16220761b51365bcc64d59f98ea1e662 |     
   x86_64    |          host-go-src           | NOK | http://autobuild.buildroot.net/results/56beed405e691e21a0c42b07602bb496ca4e9271 |     
   mips64    |          host-go-src           | NOK | http://autobuild.buildroot.net/results/e4c5f12e890de57e471bd110162d0deb213ac9d2 |     
  mips64el   |          host-go-src           | NOK | http://autobuild.buildroot.net/results/755b6d65815b1efb795d8dbb9e33721f9c052066 |     
  mips64el   |          host-go-src           | NOK | http://autobuild.buildroot.net/results/5b6a2815b927e21684a858c199494a29f2e0636b |     
  riscv64    |          host-go-src           | NOK | http://autobuild.buildroot.net/results/15d7ad1e1d4ade2a291b0da62101d0ee4fe42b38 |     
  riscv64    |          host-go-src           | NOK | http://autobuild.buildroot.net/results/e092d83889c919edff07a705fea7aca3199c9ede |     
  aarch64    |          host-go-src           | NOK | http://autobuild.buildroot.net/results/d42b27c4fad8fb5abd48667de817515cd49d66f8 |     
   x86_64    |          host-go-src           | NOK | http://autobuild.buildroot.net/results/95ca1e9c9ed634f47fbacc143640a3758a72171a |     
   mips64    |          host-go-src           | NOK | http://autobuild.buildroot.net/results/4e7c6a0804d978df4af29c996c87b3badd2d8336 |     
  mips64el   |          host-go-src           | NOK | http://autobuild.buildroot.net/results/d8e290fbaabee2a604240a2a02b2e641159182cf |     
   mips64    |          host-go-src           | NOK | http://autobuild.buildroot.net/results/e317811cbcf5443a638d286540983ab86f6ea707 |     
  aarch64    |          host-go-src           | NOK | http://autobuild.buildroot.net/results/7734ff39c5d8c74ecf3c56500a125a402c1232f5 |     
powerpc64le  | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/ff6f9075d52ab06229076299bf3e02b423b1fb3a | ORPH
  sparc64    | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/6ee7c5339950ab781afea4d13ea3a338d1d43e4e | ORPH
   x86_64    | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/88072e5e1b184f544676bd72f76b00e61b18b739 | ORPH
  sparc64    | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/932376fae07463a3002e337fd3d6fc0cc27ec5a9 | ORPH
 aarch64_be  |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.net/results/a57ec08974a46b4955b56c343456f12d308f91e4 |     
   x86_64    |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.net/results/f0031e49f7842e7ec099a933661aaaac07c62b6f |     
  riscv64    |   host-moby-buildkit-0.11.6    | NOK | http://autobuild.buildroot.net/results/794aec752d9731f5dad68573e8bf1c9311065c28 |     
  riscv64    |   host-moby-buildkit-0.11.6    | NOK | http://autobuild.buildroot.net/results/8f592135936b30b25f78c692746dcf1351d589cd |     
  aarch64    |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/6a7e32c96de6e5f1d12f1e98e5ab6d2bd001619d | ORPH
  aarch64    |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/800202a0054c73370e0b134b7eb909d4a11779a5 | ORPH
   x86_64    |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/389e0ea32e61ef8c43199e5dc2f20de3c82d3953 | ORPH
  aarch64    |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/f74cb73fee0440058e35798a1a55d9b91c01c01d | ORPH
   s390x     |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/9d673e5c79760149d97e3c2cb7f489602d5bb025 | ORPH
    arm      |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/25a46614b2999f4134fe8fafa548576768641ef8 | ORPH
   mips64    |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/5a0be20a08151517ed53e8ca5426ed108a7995c7 | ORPH
   s390x     |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/0dcee5f0afbadf65c0dd22ee4eaf81d985f40f64 | ORPH
  powerpc    |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/5cdfb2fd9fe3befbfa24eb163ec445128df4b55b | ORPH
  riscv64    |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/2e47fb891af1b171c65b56e90a18c54c4c3ea926 | ORPH
    arm      |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/1684aceea817a71092246684e8a8fc51f45b530a | ORPH
 microblaze  |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/83685dd4694aa1cc240634a9c4f7b3ee20793ab7 | ORPH
   s390x     |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/46612c8336e680952b8465ceb99bfb45e99bf46e | ORPH
  sparc64    |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/86c2ca657e053fc88d3139040abe14b2cc88c4c4 | ORPH
  powerpc    |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/05c1d078a95aba3b58f31ebe58327fa1dd29e205 | ORPH
   s390x     |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/0cf16e1779d925267a10c481f9ee0ac1da019b15 | ORPH
   sh4aeb    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/ac8859b6d59630c780f59c9ae10acf8ce3e4d54d | ORPH
    sh4a     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/9a401dbfbfbd96f4e04d611e373c333cbd98d25f | ORPH
   sparc     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/0af3f477bb211bfe4047b2859b4c9d00d911d60a | ORPH
    or1k     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/3233eec7fbebd833c615e28258272c2c8233e67c | ORPH
   arceb     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/5d81fb1dbe720539e25c10c03464946011ed9436 | ORPH
    mips     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/e0b98d2a21993fc4cbf77506c85f7b45c43f09a9 | ORPH
   xtensa    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/698d89bdc5e4fdbf168a6008227a78d0dbec97f7 | ORPH
  sparc64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/f2b01ea868747fb8f92910d10564316191b533d8 | ORPH
   x86_64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/68567d59d91775c1c6bfdc273f302ced6b50bf64 | ORPH
  powerpc    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/4e131fdd5ffb22d26da305871dab6bce4e6d4e7c | ORPH
   s390x     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/3b58be8add993fe6719bbe3c1c4f5a773618c45b | ORPH
   nios2     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/1f0c18ec50d1d6deb6f505e96864463a7e6f9092 | ORPH
   mipsel    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/889e5eccfdf9694a75790d9a237cb6ed889c672b | ORPH
    sh4a     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/d377b41cfa6bfe70a61fba843ae41e507f4caf06 | ORPH
 microblaze  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/34b4283f52d0384a3fb82af27bc6fbc0a19d14a5 | ORPH
 aarch64_be  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/b7ac7ab79ac3d8d7677d911770268fbc6532631c | ORPH
  sparc64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/40ced3f157e3153562f3d35094fb9813988eb46f | ORPH
  sparc64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/96b930de5d2af0767c02a07ad2d365f190c87cb4 | ORPH
 microblaze  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/212c4cd5fd49d880fbbd17bef2a1d793e19b79d7 | ORPH
    mips     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/1b03064c3356b7a586cb39b09c2ee3970909a288 | ORPH
   armeb     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/0464182eb957d3f9c1e55d956edd876407237845 | ORPH
microblazeel | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/b06aac800600d94d777de007a10e93e05340dd6e | ORPH
microblazeel | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/929f74b9e9d5935b518ca1d7746040832f095bc7 | ORPH
   x86_64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/d94037029a133eb881e94d218009aa454db5b10c | ORPH
 powerpc64   | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/ab9c6b9185882f20a47d27b7902456a92296821c | ORPH
    or1k     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/ed46dc55732e887a0300d1407b65f42d6e5edcc5 | ORPH
   x86_64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/3d60530668d1080f1295c26658a9ace90905d923 | ORPH
microblazeel | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/11b85b95a357609e6c1313b7c9ff6a210174559d | ORPH
 powerpc64   | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/23ba3c07451f0d4a3fc0a8813fec636155f0e189 | ORPH
   nios2     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/f9c5b0bbbbd940c39a47aaf03e3f5d7634067271 | ORPH
    i686     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/7e9b2a341bedc26cf1449d60cdfd55ef2b2e6261 | ORPH
   mipsel    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/e23313bd147db05faa6827e93d8b9c66d7102914 | ORPH
    sh4a     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/ddf2c62c917996a57f41ba16ac7a9848f986266f | ORPH
powerpc64le  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/1a5e9039d51bc28e92919d6bc005b6aa8554b88b | ORPH
   s390x     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/e567a0a8f74e7a93d3e5f15f11eac95adacdc602 | ORPH
   x86_64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/8264bc855573cf3a4be05a9f4c4b230b05e692af | ORPH
    mips     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/a78bd9a43e82319361f58f5434bc9cc561c36983 | ORPH
  aarch64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/b90913038ae493be394c645959567f74fd8c645e | ORPH
powerpc64le  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/aa056c22a8884917bb33d90a5e185f5a2780d321 | ORPH
  aarch64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/fa4b1fc1873d572a6ab4c3c31619b8cb367d617a | ORPH
powerpc64le  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/695b8f7d5ac4ceb478bc71399c128090ed615ed6 | ORPH
 aarch64_be  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/0c55cfa25c87e7ddd2fcb649db19fda819261d7c | ORPH
    or1k     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/30f4ea9858cf3dd368bbfde23c4d6f65a9b8a9c1 | ORPH
    m68k     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/d7ce47fd3411b64fc94c0014462e3bf13ae457f3 | ORPH
   nios2     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/c3ec484374c69ecc2ef5d1a74028c67b68f5ae5d | ORPH
    or1k     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/996a430c05205690c1582be923043a38d9b63429 | ORPH
   x86_64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/36e7b037c53b2d917ff323ac261d35ef92b9015a | ORPH
microblazeel | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/023f03894fd8e897a1a81408146056bf66025fb8 | ORPH
   nios2     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/3b8fe791a5704eccb828de5fa5b9ae01d7b925c1 | ORPH
    arm      | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/85f9720c535e9c31c7cfb7a95544e5c9c07966b1 | ORPH
   sparc     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/986f14ca84fdb6596c2dc50f66d28abaf2b55c07 | ORPH
    arm      | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/3b5a4b0094521688c3aeab07f7530cc0090cc0d9 | ORPH
    mips     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/b817e5a2869975929f797281998c2e9b463e7745 | ORPH
microblazeel | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/de9abf2b72f30e296cafb7969831b3527a04d4c1 | ORPH
   nios2     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/4ba88b1fb4b3218b1ac98947c28adb573ccdd895 | ORPH
  aarch64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/e2c7f113cccb219c45c0048f082015e9b5c9468d | ORPH
  aarch64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/e70462e2308a2dda0dbafa8a6ec4c377b5c785cc | ORPH
   x86_64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/264a4123649b6fc91a02f9f830459aa0b6363346 | ORPH
  sparc64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/fd677f79ca142ba61965207f851ece91d45f197c | ORPH
   nios2     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/c0b13bbae78ba9dbca0c30f3bad27dde26da24a1 | ORPH
    mips     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/f26fa2c3884291db48b67f2744159bf458f4b40b | ORPH
 powerpc64   | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/49e9f29e54b5420d431ce1b6f6f8dfd931be6231 | ORPH
    m68k     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/75c4506e25c7d94974c31c8f6b82cd2af2eb58e5 | ORPH
    or1k     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/d0403a8f84a68755f42be1ede4a41f9b949b6f77 | ORPH
   x86_64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/ad2709e4e9edb376cbdeab7e6958fe0ff6e882e5 | ORPH
powerpc64le  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/5006740a08dc7dd1cf70d59f4090293ed0e2ed24 | ORPH
   nios2     |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/a50292903cea504202a9d3b073c35c9edde495a8 |     
  sparc64    |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/4e056ba8e099bd8c7411ee3fd461bf0ccdb2dd18 |     
   armeb     |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/720a5776ae06df1110feb27f011fbaf09ecc700d |     
    arm      |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/1b25603b59872f1a713abeee8c1f963f26ab048e |     
   mips64    |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/1b34a1a9c1f41953a87f61b67ebfcb4fb37fd162 |     
   armeb     |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/4007b63f74bfa3cac82ac9fce0ab93408337aa44 |     
   sh4eb     |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/51c3698512d0c3daad54fb446ba4ea0489dda7c4 |     
   mipsel    |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/c5556115723a64362d018cdcdf1cf43c33ce3f55 |     
   x86_64    |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/1d3bd8623699e85fc0d485a9aeef694903ae3df4 |     
  mips64el   |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/922b23337eeb0d718a6d7ac7472ec3cb9a12f23c |     
    arc      |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/49e6053c8f41fcc1a3378b73616b1d6c72111b1b |     
  mips64el   |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/170bf4feda0f10e1346c81554575e78580af04b3 |     
   armeb     |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/958131cf06c51eb0d01249427f2a5145430a82be |     
 powerpc64   |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/7aa4b347f1bcb5e01994cc7e7fdd9c801cd33806 |     
   sparc     |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/5ecc03054ceb1c0347317e304dd5e0af30f35bfd |     
   x86_64    |        host-rust-1.74.1        | NOK | http://autobuild.buildroot.net/results/eab7f909559b450c5172bfa40fcd32ca3bc7263a |     
   arceb     | host-softether-4.30-9700-beta  | NOK | http://autobuild.buildroot.net/results/c67193d14c52727a2a0ffd8175d42e5b291004ab | ORPH
  sparc64    | host-softether-4.30-9700-beta  | NOK | http://autobuild.buildroot.net/results/c8f8c464aac2c888fd3557f643e0915f41e12de0 | ORPH
 aarch64_be  | host-softether-4.30-9700-beta  | NOK | http://autobuild.buildroot.net/results/ebd9fd75438f6d2d91e3bf80147d0ff5dc8f1cb7 | ORPH
  sparc64    | host-softether-4.30-9700-beta  | NOK | http://autobuild.buildroot.net/results/1edd0ddc16adad11dd93abac3a84793bea013738 | ORPH
microblazeel | host-softether-4.30-9700-beta  | NOK | http://autobuild.buildroot.net/results/3dfcaa0a51e23d4845e6f672a2da1d79d6a0d213 | ORPH
   s390x     | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/19da2751d6114fe8b33e45b84687584539d59552 |     
 powerpc64   | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/3a1ecb335bd3b558897c4bb6a2bbbe984d020433 |     
  aarch64    | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/0ca238ce3f63380ef3af16c334c6c5c21ef465a3 |     
microblazeel | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/daa5f7a921d8cbd87d8bd85e8beb7cb0306f3bc0 |     
microblazeel | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/87ab0a2513fa2cb9b4236768bc0f1597affb7c05 |     
    mips     | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/f30769aed1b185ac0f850e1d7158c63b8b85075a |     
  aarch64    | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/82e103ccde8658e9329504f95537d341f02754a2 |     
    arc      | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/0441de44e85fe34e30b7efe35637c2bb04d46c07 |     
   s390x     | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/fa05814c8ee2c1b801a68b4dee4387eadbca636e |     
    arm      | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/02e2964d0f3cef502cb9b359d75f5a7532e76680 |     
   nios2     |           htop-3.3.0           | NOK | http://autobuild.buildroot.net/results/fb49a43e3421b8b1b4045124d3a31c3e06b496da | ORPH
   arceb     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/a5050df8189f4f670b580a13da924e647b4effc8 |     
  sparc64    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/4cdf0226e8e360dba1633dca4569c1cf6caea16a |     
   mips64    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/4b26500866feaa1f5b405954d233721d425f0b62 |     
   xtensa    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/60778db88ef868e7a549cb215c3374efc3c7b72c |     
   s390x     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/fa53f18a596511ecf549cc608ba5eb4ef9b90dcf |     
 microblaze  | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/0f79a1d751d4a2405e6353ae7bc92fb92bbcc95f |     
    or1k     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/e07dfa854e610a97369414bb6622af48724dc68d |     
  aarch64    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/0f2467b2d5dfeff2f77fc450d5f10c38ff7958e9 |     
   x86_64    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/7fe91ff8dc03916c62116b5171aa0989e24fb432 |     
  sparc64    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/a57d038eae85262b623b9cee6e2e122d52ae375d |     
   mips64    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/4d88a3cb61d5f59d9631a337aaacb9aa4785bb9e |     
  mips64el   | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/fc5c211813ed94a7b30219ba3882f083053f7e2f |     
    arm      | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/3a9a24d3942913ec349f0e42dca21fdd5e8d4ea0 |     
powerpc64le  | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/8462ed164ceb46c2a8a7e192c7fe501494e8f4c8 |     
    sh4a     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/c64b2858b78d87b332beb4fe176fe28123acf5ee |     
  mips64el   | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/c9ed4ead566764629e3ff051cd0d94a44736fb7a |     
    mips     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/98ca93fecaaa7c6d5dab93deca198cd47541c12a |     
   xtensa    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/2c13cf217d70fd5bf422c4dea7de24887178db23 |     
   arceb     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/f59f7360b458f1867178cdf47e5c3499a0802e9b |     
   nios2     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/48faa8c9ae288b741e1d2529281965b9d5f49d79 |     
    i686     |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.net/results/59fac2c1b1d49494af02286ccfde74b21124eebd |     
   sparc     |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.net/results/92c8a1c47b1786260847287914a4de85dcc2f184 |     
  powerpc    |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.net/results/83a4dae5e4c7f3065ca3822d3b412ad9159b2bbe |     
    sh4      |          kexec-2.0.28          | NOK | http://autobuild.buildroot.net/results/35e2ac2d66e6b63e74c689963a1474b61dd4485f |     
    sh4a     |          kexec-2.0.28          | NOK | http://autobuild.buildroot.net/results/b5db709a90c5aa6318e9c8d862e4d0a5428874e4 |     
    arm      | kvmtool-4d2c017f41533b0e51e... | NOK | http://autobuild.buildroot.net/results/d455998da389c66ce9149adabb349e5d44d9ee20 | ORPH
   mipsel    |        libarchive-3.7.4        | NOK | http://autobuild.buildroot.net/results/a755e1cb1ddf5a70a44f5e078991884c4f75154c |     
   x86_64    |        libarchive-3.7.4        | NOK | http://autobuild.buildroot.net/results/e114b5a4942a326ac350b13ff8d0f77244aafeea |     
   sparc     |       libargtable2-2.13        | NOK | http://autobuild.buildroot.net/results/14736724090c0b74270d93e85a678c9c9134c17e | ORPH
   mipsel    |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/2fe3e23b57a410580a733c988a97790e903b3c00 |     
  mips64el   |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/b61726d66e86cc549e1af04b225ac580eaa31ec4 |     
  sparc64    |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/28a038951233c40fcc31c1d1cf4fd0a14c98c2b5 |     
    sh4      |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/212a4d08e9380b8ccb1fc7c22268da8d06e4a6ca |     
   sparc     |         libdrm-2.4.120         | NOK | http://autobuild.buildroot.net/results/7383e851883f2dbad7a4c024ec8138cac240f07f |     
   arceb     |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/317314d1bb13819f8db3b1bb0f32b81dc0c599df |     
   arceb     |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/98a5d16d4a873214e099b7d37012ecdc6727bedd |     
   arceb     |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/7b9e09b2ab8a17487300b040ff01e8f1f54f093e |     
    arc      |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/29ad4384292d16db49fdc7a62f6c2f63b366edee |     
    arc      |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/9fcb975f5f18331d186ed2c09c83534406c43cb1 |     
    arc      |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/ba8b3c4c0ad456530895490030d415c7b8085dfb |     
    arc      |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/0fafbca3d16f0dbfb1c8b56f7e9d32309644e3b0 |     
    arc      |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/fb150192a48518dfd5fbdbd478e847d4b9f55ea7 |     
    arc      |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/09b049eddeaaad9166e1e08d33eab9fb91a0e00e |     
   arceb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/2e186e7f4f733c81e8f6bf6b47cff9d515dc3d67 |     
   arceb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/9b13bfbe64d4143197b4fa707762bd3cea50ff6a |     
 microblaze  |          libnss-3.100          | NOK | http://autobuild.buildroot.net/results/6b48524f9bed4c799c1913abf3e344aaa78be0f6 |     
    i586     |          libnss-3.100          | NOK | http://autobuild.buildroot.net/results/7e04f56b35050225a3713493d6d1cd7cf02e8c61 |     
microblazeel |        libopenssl-3.3.1        | NOK | http://autobuild.buildroot.net/results/61a029f08271650ef4c4fa65f0fe30ad25a8a5c9 | ORPH
   arceb     |        libopenssl-3.3.1        | NOK | http://autobuild.buildroot.net/results/1cbbf06ba249f5ca18b413aa90a63b1772fbac6d | ORPH
   arceb     |        libopenssl-3.3.1        | NOK | http://autobuild.buildroot.net/results/3b1940d55bfbc375a13798abc403bee753123efb | ORPH
microblazeel |        libopenssl-3.3.1        | NOK | http://autobuild.buildroot.net/results/8f46e1929a7c23fb81c8e650449d08c18875f35a | ORPH
microblazeel |        libopenssl-3.3.1        | NOK | http://autobuild.buildroot.net/results/0c69f247fc19ecaed15accac25dd5f6157c0e842 | ORPH
    m68k     |        libopenssl-3.3.1        | NOK | http://autobuild.buildroot.net/results/5a762d8ad884236a62fd4c634e20aa15b5da3a56 | ORPH
 microblaze  |        libopenssl-3.3.1        | NOK | http://autobuild.buildroot.net/results/2d6c52dd6464a06225e49355b2927d912406ec30 | ORPH
    or1k     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/e9930412209ff6d9d4d691a426a95050568a99bf | ORPH
   sparc     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/064e956927afb5eb475a0fd57f6fee5aa16fa06b | ORPH
 microblaze  |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/fb34aa3ebcfc3a695ccbca5309068194394da39a | ORPH
    sh4a     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/6b114f867c3e37e0ef00b7ce9d11cfc16cd5d126 | ORPH
   s390x     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/afae7b6cf48da9b5e92c323f0314e4805994c865 | ORPH
   s390x     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/a46f95d6265eba2097337c5f55ce95aec0396a46 | ORPH
   nios2     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/ef72f32d0723aa75d69590d153ae36296d77f915 | ORPH
 microblaze  |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/100a2e6e4965a34cd54d4799699c43c26589dd95 | ORPH
   arceb     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/8d4f7d27eb0e837b53a38dc5948d70c0bda447cb | ORPH
   armeb     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/947fef579437a9b83e94d863c2a66312f2698704 | ORPH
    m68k     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/aa547f16dd277da7d5f4267917a6e4b1deb5ddfb | ORPH
  powerpc    |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/123c671455fd8962392fdc7d43a811b33f1a66ee | ORPH
    arc      |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/dfdc99d56ae00cc9eae5218b45e4d9cd511a3156 | ORPH
   s390x     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/d01f1567d6e58c999c9b107e573c82b3eb94b494 | ORPH
   nios2     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/01057b0a36d25e7fda640d23ec5d9857fa99f3e2 | ORPH
   armeb     |          libsepol-3.6          | NOK | http://autobuild.buildroot.net/results/43aeba8aeb348c46de0d4ceae510218abcc139cd |     
   xtensa    |          libsepol-3.6          | NOK | http://autobuild.buildroot.net/results/052dc21867cc9eed35385eb8e7ea02f4d33ed0da |     
   xtensa    |          libsepol-3.6          | NOK | http://autobuild.buildroot.net/results/b5b1d646ef93eea0439ccc7c422bddacd42a94b3 |     
    or1k     |        libunwind-1.8.1         | NOK | http://autobuild.buildroot.net/results/ab61a6887e61f4e2189f5d26ad5ac759351d9754 | ORPH
   sparc     |        lighttpd-1.4.76         | NOK | http://autobuild.buildroot.net/results/5a352b5f04825454934321a8665ec3e86f9bd394 | ORPH
   mipsel    |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/f5dfd902e49ca27bf0b2c6fef953e127e6ddd535 | ORPH
    m68k     |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/0ac82590f03f7174f3e7ebf59cb98a1349c2343f | ORPH
   x86_64    |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/4e3b0350bea412aacf4b7276638e5f020b79eb06 | ORPH
   xtensa    |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/bb9177eebf314892cbf04a706cefa2295c6767d2 | ORPH
   mips64    |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/d47e75d60595a7509cbb17284f63461a2837008d | ORPH
    mips     |          linux-6.9.4           | NOK | http://autobuild.buildroot.net/results/f1c3a73b28f8ad3f7a81e6c1790a8de767b549c4 | ORPH
   mips64    |          linux-6.9.4           | NOK | http://autobuild.buildroot.net/results/3a4fccd55aafd493aaae02760853aa38484eaf78 | ORPH
  mips64el   |          linux-6.9.4           | NOK | http://autobuild.buildroot.net/results/67580caa3e32e904ec3e45833033db6fa84ff316 | ORPH
   armeb     |          linux-6.9.4           | NOK | http://autobuild.buildroot.net/results/7d26543b5c82be2a1077b1b1147e7ee387fab0d2 | ORPH
   mipsel    |          linux-6.9.4           | NOK | http://autobuild.buildroot.net/results/36b834d3d6843ecce8ef56693317703fc39f6b39 | ORPH
   sh4aeb    |          linux-6.9.4           | NOK | http://autobuild.buildroot.net/results/2a17b788c6f8ba526f979b6d27f71f3e9b833d32 | ORPH
  powerpc    |          linux-6.9.4           | NOK | http://autobuild.buildroot.net/results/44063a525fe3a290d410fed1b76229028423ed44 | ORPH
   xtensa    |          linux-6.9.4           | NOK | http://autobuild.buildroot.net/results/4752cec4669efcf2b814fa0df8c28c90a5066edf | ORPH
   sh4aeb    |          linux-6.9.4           | NOK | http://autobuild.buildroot.net/results/50659661e61436addd488e54897b3b99045150e0 | ORPH
    mips     |          linux-6.9.4           | NOK | http://autobuild.buildroot.net/results/3625726c40c12bee134dd4a118db43537669c608 | ORPH
    sh4a     |          linux-tools           | NOK | http://autobuild.buildroot.net/results/10d0db40574f69eebf86acf9b64712eb2e11c9ea | ORPH
powerpc64le  |        mariadb-10.11.6         | NOK | http://autobuild.buildroot.net/results/4109ff0f540e3e5e6b007114b23f8b7ce9073309 | ORPH
  aarch64    |      mediastreamer-4.4.8       | NOK | http://autobuild.buildroot.net/results/37d81ba2ff33cd5e5b2e385e2f48e42b6442a26f | ORPH
  aarch64    |      mediastreamer-4.4.8       | NOK | http://autobuild.buildroot.net/results/4d671f9b8d4635f2412803eb5116d2d222d1e978 | ORPH
    arm      |      mediastreamer-4.4.8       | NOK | http://autobuild.buildroot.net/results/af17b1ff57ade59c3a517c5e3e45e5b706b4cf9e | ORPH
   x86_64    |         memtest86-6.20         | NOK | http://autobuild.buildroot.net/results/a865436bc786b03f149713851e7993629c2af532 |     
  powerpc    |         moarvm-2023.12         | NOK | http://autobuild.buildroot.net/results/145e20df59a1bf472f08657f127156be5b296d30 |     
  aarch64    |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/02d2fa34e266917ec7d20be395d0ddfdc7a6e97a |     
    or1k     |        mosquitto-2.0.18        | NOK | http://autobuild.buildroot.net/results/34837bba18417ece6d512178935717ce35acdd4b |     
 aarch64_be  |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/6bef21113b5f149111a1d768250b436bf8446c2d |     
    arc      |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/e9b41069870e9bdd669d85c60686ff5f57679564 |     
    mips     |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/d6bf4b60c0a9c7504631dfe69f8a741bbccb0ece |     
 aarch64_be  |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/1a0190846c4851e4c63d0db45bc1db1ca99a85cf |     
  riscv64    |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/6d471f3bc24916da4b34313a33286fb2c3b528ac |     
   x86_64    |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/2be76cce9e43fd5a2fbfbb6ac94fbb1740369747 |     
 powerpc64   |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/cf2fefe53b343b4d75f0bca4b2897dea4a519c54 |     
  mips64el   |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/708a5594aa073910f45f7c9d7894ef414201d947 |     
  powerpc    |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/29d23a04003f11b3dbe14b04a0ced4eff142bd2c |     
   armeb     |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/15e91c0bd8aa2187dce8c8b25a40c1825e297667 |     
   s390x     |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/4dee25b4de4bccd359f0cccc4363af60441c08cf |     
   xtensa    |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/39a33c6090e68102fc40752cb0e0d17b6336b9a2 |     
    mips     |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/b32e842da0b22ead6a34d8a74beed891aa491312 |     
   mipsel    |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/4c51064dad0ff739b6733b04856e8aa975b2279b |     
   sparc     |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/2aa900d5852d5b7f5d0ad82f9c98bdb600d19316 |     
  powerpc    |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/97f3a7ade1ea34d8ef6ac8adbb069f64c217a8e6 |     
microblazeel |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/eb65741ec1657b5cea95d2e6fe02b4a56738030c |     
   mips64    |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/c2a0342eeb16813234cf20c6ff4b81ffc59f075c |     
    m68k     |          ntp-4.2.8p17          | NOK | http://autobuild.buildroot.net/results/8f3fe1687f83c50cf77d8f2abb556279afa7f28a |     
    mips     |          ntp-4.2.8p17          | NOK | http://autobuild.buildroot.net/results/67e9d4e237b25165dd79057478bb2627ed78e77c |     
    i686     |          octave-9.2.0          | NOK | http://autobuild.buildroot.net/results/20bf833c7b0cd673a99428c53e05011f27f85a96 |     
   mips64    |        openblas-0.3.27         | NOK | http://autobuild.buildroot.net/results/772dc4515c267b1bc8e5f4d2b690ed6ce347b63f |     
   armeb     |         opencv3-3.4.19         | NOK | http://autobuild.buildroot.net/results/01f1dcffeea74e201d8cef1e8f44f87db0809b62 |     
 powerpc64   |         openssh-9.7p1          | NOK | http://autobuild.buildroot.net/results/0bf966a65d3cd09160173fcb53def9ba738bed2a | ORPH
powerpc64le  |         openssh-9.7p1          | NOK | http://autobuild.buildroot.net/results/60f17f766964911403759485291eb4115d665bda | ORPH
   mips64    |         openssh-9.7p1          | NOK | http://autobuild.buildroot.net/results/ffc7c0650d687df79f3d7bebe391fae36063c5b4 | ORPH
  mips64el   |         openssh-9.7p1          | NOK | http://autobuild.buildroot.net/results/0a7f5c9a319d41df2b638d291199627cb61dbc07 | ORPH
   mipsel    |         openssh-9.7p1          | NOK | http://autobuild.buildroot.net/results/f0f4af58ecabe787a971f58ccec255f94c2b6945 | ORPH
 powerpc64   |         openswan-3.0.0         | NOK | http://autobuild.buildroot.net/results/856b828db34740033a4ec5a4df87bad045a7eddf | ORPH
    i686     |  openvmtools-11.3.5-18557794   | NOK | http://autobuild.buildroot.net/results/235bbf10e7d22fd117eb05ee3fbaadb430368365 |     
   sparc     | pppd-e1266c76d1ad39f98f1167... | NOK | http://autobuild.buildroot.net/results/aa7d872d0ca61ebe6c3246c04329ff5615f9e493 |     
    i686     |      python-numpy-1.25.0       | NOK | http://autobuild.buildroot.net/results/de40cc3a391dd12ed19ebaa11a5b14ec471647e3 |     
  powerpc    |  python-pydantic-core-2.14.6   | NOK | http://autobuild.buildroot.net/results/c3af558dff35ad6a08c21c995fc4f3f2827da50e |     
    arm      |     python-remi-2022.7.27      | NOK | http://autobuild.buildroot.net/results/6e305a01e776e8f48133b990c87f26ba7b436757 |     
  mips64el   |     python-remi-2022.7.27      | NOK | http://autobuild.buildroot.net/results/c8c131113e1ce6a1b8d98fe3f7bdcfbe109a95bf |     
  aarch64    |       python-scapy-2.5.0       | NOK | http://autobuild.buildroot.net/results/1e81d8a58b84f5f46f0583f160fa406f1a1b8197 |     
    arm      |      python-zlmdb-22.6.1       | NOK | http://autobuild.buildroot.net/results/5a12d76f8347402770aeeb45003f178b2cd87106 |     
   mips64    |         python3-3.11.8         | NOK | http://autobuild.buildroot.net/results/a243daeac4f65df66d09926689c460b6c8efc9c3 |     
microblazeel |         python3-3.11.8         | NOK | http://autobuild.buildroot.net/results/9cbb6960c80f4fd8ce4778756c6b89c52a45253a |     
powerpc64le  |         python3-3.11.8         | NOK | http://autobuild.buildroot.net/results/d29b770b77f4d47f17dec5f4610e618b732d34ff |     
 microblaze  |         python3-3.11.8         | NOK | http://autobuild.buildroot.net/results/d284baf6d31eeeeb9e03baa6e1e6dd3ae3f2e84c |     
   s390x     |         python3-3.11.8         | NOK | http://autobuild.buildroot.net/results/fa1d7a6972fc75f7c5d9d8c94f72b72d2924d826 |     
  aarch64    |           qemu-9.0.0           | NOK | http://autobuild.buildroot.net/results/5a1b0210e642d137db815c162a580b87ea72b209 |     
  aarch64    | rtl8189es-eb51e021b0e1b6f94... | NOK | http://autobuild.buildroot.net/results/822bbd226fff436bf8e54cc0932ae6a1ecb88c41 |     
 powerpc64   |           ruby-3.3.1           | NOK | http://autobuild.buildroot.net/results/54a67ce06d1e05a91c00b2c5d38bb5eff8936d08 |     
   mipsel    |         s6-dns-2.3.7.1         | NOK | http://autobuild.buildroot.net/results/bfa5a728bd6043798158592ae2eb5d4a24f82b47 |     
  mips64el   |         s6-dns-2.3.7.1         | NOK | http://autobuild.buildroot.net/results/05a61775523701a313eee244f42383142ca9c272 |     
   xtensa    |         s6-dns-2.3.7.1         | NOK | http://autobuild.buildroot.net/results/b73582a273b11839984a5564054982be82b36c74 |     
   sparc     |         shadow-4.14.5          | NOK | http://autobuild.buildroot.net/results/490d0b95b6f61c2ceab8ec17f0ed6a7e161d8faa |     
  powerpc    |         siproxd-0.8.3          | NOK | http://autobuild.buildroot.net/results/5a78400c677ca48f9e743c4a3867dbb9ac040551 |     
powerpc64le  | squeezelite-71c012ad9ba102f... | NOK | http://autobuild.buildroot.net/results/de3b0bc286568358e93de60e52d59197bac85dc4 |     
   sh4eb     |           sslh-2.0.1           | NOK | http://autobuild.buildroot.net/results/b815d17add614dec6510f609797ef5170af6dc4a | ORPH
    arc      |           sslh-2.0.1           | NOK | http://autobuild.buildroot.net/results/5d2a4a2dfc4c512a6df766c391d689dd62ea0518 | ORPH
   xtensa    |       stress-ng-0.17.07        | NOK | http://autobuild.buildroot.net/results/241e078bc58b09e754fa4f655dff7a4a288f6769 |     
    i686     |         syslinux-6.03          | NOK | http://autobuild.buildroot.net/results/5ff9751600d203f197bd70859d0c120d274f7390 | ORPH
  sparc64    | tftpd-b2b34cecc8cbc18ff6f1f... | NOK | http://autobuild.buildroot.net/results/68e0d95d8c573193a9be96427c8a0832a589eab0 | ORPH
    i486     |        tinyssh-20240101        | NOK | http://autobuild.buildroot.net/results/13682998353eabd25f64cce7cd2333556555318f |     
  riscv32    |         uclibc-1.0.48          | NOK | http://autobuild.buildroot.net/results/79a3e7232a825355b0df3b4bd03d861c76171f66 |     
    m68k     | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/224f0c06f296ff2146e00154e64c5dddd77d53da |     
powerpc64le  |            unknown             | NOK | http://autobuild.buildroot.net/results/86617530a0a8daed8dc9f30e1d962557accbb34b |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/b289993b87e7b93d1d2205c478279db0c37d603d |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/5178ed8af910f8bae187ce05638adc23e7a44807 |     
    m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/0eaffed0791853377d52d688eb16245dce23f197 |     
   arceb     |       util-linux-2.39.3        | NOK | http://autobuild.buildroot.net/results/19bc25454ca8940db586607fedb37c1d1513a7d0 | ORPH
  riscv32    |         wavemon-0.9.5          | NOK | http://autobuild.buildroot.net/results/6541acdcf570d9e33706ee559c0a1b9986848b24 | ORPH
microblazeel |         x11vnc-0.9.16          | NOK | http://autobuild.buildroot.net/results/91fd7d222baac5e65478d29e074e11f1865c4e22 |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

                  bitcoin-26.0 | 1 
  gobject-introspection-1.76.1 | 1 
                  linux-6.6.32 | 1 
pppd-e1266c76d1ad39f98f1167... | 1 
                sysrepo-2.2.36 | 1 
                    zeek-4.1.1 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   xtensa    |          bitcoin-26.0          | NOK | http://autobuild.buildroot.net/results/bac79a714cee2d1f7b9b2560e95bc9fe23e461c3 |     
   x86_64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/1f20c4bcebcda6ab8eca6ffc03e6de2de505e2c0 | ORPH
  mips64el   |          linux-6.6.32          | NOK | http://autobuild.buildroot.net/results/865d821041fbc273ef541383146ea4426f1b54ad | ORPH
  sparc64    | pppd-e1266c76d1ad39f98f1167... | NOK | http://autobuild.buildroot.net/results/9e344c8d46e240e52e68b3bd372c90379a682831 |     
  riscv32    |         sysrepo-2.2.36         | NOK | http://autobuild.buildroot.net/results/ea35b3cd01da16c3b777dbc5278c710a52068b04 |     
   s390x     |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/d8a2c749b3b0ed44204a4dd278f32a4f600d462f |     


Classification of failures by reason for 2024.05.x
--------------------------------------------------

                   foot-1.16.2 | 1 
                libressl-3.8.4 | 1 
                librsvg-2.50.9 | 1 
                    proj-9.3.0 | 1 
   python-pydantic-core-2.14.6 | 1 
                       unknown | 1 


Detail of failures for 2024.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   nios2     |          foot-1.16.2           | NOK | http://autobuild.buildroot.net/results/74fb096fb43b6d5729a3f63f7d887a5719fb5ead |     
    arc      |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/839900e119b7e81c9303056d874d3d216d3d3229 | ORPH
   x86_64    |         librsvg-2.50.9         | NOK | http://autobuild.buildroot.net/results/a2478dd33ac6f5fe1d0d15ec474258b2b94199fc |     
    or1k     |           proj-9.3.0           | NOK | http://autobuild.buildroot.net/results/d41419b9e816ce6909c1ad3d3bf230e2e4b9bc3c |     
    arm      |  python-pydantic-core-2.14.6   | NOK | http://autobuild.buildroot.net/results/af80ff5fe803e5863bbd5f7a7da11c184a7a943d |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/263e05489d1749d0e6168fcef5fc3e23ebfabe75 |     


Packages having a newer version
===============================

             name              | found by |        link to release-monitoring.org        |   version    |   upstream   | orph?
-------------------------------+----------+----------------------------------------------+--------------+--------------+-------
                           ace |  DISTRO  | https://release-monitoring.org/project/242395 | 7.1.1        | 8.0.0        | ORPH
                        acpica |  DISTRO  | https://release-monitoring.org/project/00018 | 20240321     | 20240322     |     
                       acsccid |  DISTRO  | https://release-monitoring.org/project/15661 | 1.1.10       | 1.1.11       |     
            adwaita-icon-theme |  DISTRO  | https://release-monitoring.org/project/13117 | 3.37.2       | 46.2         |     
                       aespipe |  DISTRO  | https://release-monitoring.org/project/21320 | 2.4g         | 2.4h         | ORPH
                        alfred |  DISTRO  | https://release-monitoring.org/project/241870 | 2022.1       | 2024.1       | ORPH
                      alsa-lib |  DISTRO  | https://release-monitoring.org/project/00038 | 1.2.11       | 1.2.12       |     
                  alsa-plugins |  DISTRO  | https://release-monitoring.org/project/00041 | 1.2.7.1      | 1.2.12       |     
                    alsa-utils |  DISTRO  | https://release-monitoring.org/project/00037 | 1.2.11       | 1.2.12       |     
                 android-tools |  GUESS   | https://release-monitoring.org/project/13989 | 4.2.2+git... | 14.0.0_r50   |     
                     angularjs |  DISTRO  | https://release-monitoring.org/project/21321 | 1.8.2        | 1.8.3        |     
                      apitrace |  DISTRO  | https://release-monitoring.org/project/06170 | 10.0         | 12.0         |     
                           apr |  DISTRO  | https://release-monitoring.org/project/00095 | 1.7.2        | 1.7.4        |     
                     armadillo |  DISTRO  | https://release-monitoring.org/project/07006 | 9.900.2      | 12.8.4       |     
                        assimp |  DISTRO  | https://release-monitoring.org/project/06988 | 5.3.1        | 5.4.1        | ORPH
                      asterisk |  DISTRO  | https://release-monitoring.org/project/09838 | 20.7.0       | 21.3.1       |     
                  at-spi2-core |  DISTRO  | https://release-monitoring.org/project/07841 | 2.50.0       | 2.52.0       |     
                         atkmm |  DISTRO  | https://release-monitoring.org/project/07962 | 2.36.2       | 2.36.3       |     
                          atop |  DISTRO  | https://release-monitoring.org/project/00135 | 2.9.0        | 2.10.0       |     
                         audit |  DISTRO  | https://release-monitoring.org/project/15225 | 3.1.2        | 4.0.1        |     
                       avocado |  DISTRO  | https://release-monitoring.org/project/13385 | 98.0         | 105.0        | ORPH
                       avrdude |  DISTRO  | https://release-monitoring.org/project/10751 | 7.2          | 7.3          |     
               azure-iot-sdk-c |  DISTRO  | https://release-monitoring.org/project/21322 | LTS_08_2023  | 3033-01-05   |     
                        babeld |  DISTRO  | https://release-monitoring.org/project/00154 | 1.9.2        | 1.13.1       | ORPH
                   babeltrace2 |  DISTRO  | https://release-monitoring.org/project/07137 | 2.0.4        | 2.0.6        |     
                 balena-engine |  DISTRO  | https://release-monitoring.org/project/141616 | 20.10.26     | 20.10.44     |     
               bash-completion |  DISTRO  | https://release-monitoring.org/project/05667 | 2.11         | 2.14.0       | ORPH
                        batctl |  DISTRO  | https://release-monitoring.org/project/14740 | 2023.1       | 2024.1       |     
                    batman-adv |  DISTRO  | https://release-monitoring.org/project/19529 | 2023.1       | 2024.1       |     
                           bcc |  DISTRO  | https://release-monitoring.org/project/12803 | 0.29.1       | 0.30.0       |     
                       bcm2835 |  DISTRO  | https://release-monitoring.org/project/21323 | 1.73         | 1.75         | ORPH
                     bctoolbox |  DISTRO  | https://release-monitoring.org/project/14746 | 4.4.8        | 5.3.57       | ORPH
                         bdwgc |  DISTRO  | https://release-monitoring.org/project/17108 | 8.2.4        | 8.2.6        |     
                     belle-sip |  DISTRO  | https://release-monitoring.org/project/14378 | 4.4.8        | 5.3.57       |     
                          belr |  DISTRO  | https://release-monitoring.org/project/80042 | 4.4.8        | 5.3.57       |     
                    berkeleydb |  GUESS   | https://release-monitoring.org/project/138386 | 5.3.28       | 18.1.8       | ORPH
                      binutils |  DISTRO  | https://release-monitoring.org/project/07981 | 2.41         | 2.42         |     
                          bird |  DISTRO  | https://release-monitoring.org/project/00192 | 2.0.12       | 2.15.1       |     
                       bitcoin |  DISTRO  | https://release-monitoring.org/project/13618 | 26.0         | 27.0         |     
                    bluez-alsa |  DISTRO  | https://release-monitoring.org/project/21324 | 4.1.1        | 4.2.0        | ORPH
                  bluez5_utils |  DISTRO  | https://release-monitoring.org/project/10029 | 5.75         | 5.76         |     
          bluez5_utils-headers |  DISTRO  | https://release-monitoring.org/project/10029 | 5.75         | 5.76         |     
                         boinc |  DISTRO  | https://release-monitoring.org/project/00211 | 7.20.2       | 8.0.3        |     
                        bonnie |  DISTRO  | https://release-monitoring.org/project/00212 | 1.03e        | 2.00a        | ORPH
                         boost |  DISTRO  | https://release-monitoring.org/project/06845 | 1.83.0       | 1.85.0       |     
                     bootstrap |  DISTRO  | https://release-monitoring.org/project/21578 | 4.3.1        | 5.3.3        |     
                         botan |  DISTRO  | https://release-monitoring.org/project/00214 | 3.3.0        | 3.4.0        | ORPH
                       bpftool |  DISTRO  | https://release-monitoring.org/project/328454 | v7.1.0       | 7.4.0        |     
                      bpftrace |  DISTRO  | https://release-monitoring.org/project/141354 | 0.19.1       | 0.20.4       |     
                   btrfs-progs |  DISTRO  | https://release-monitoring.org/project/00227 | 5.16.2       | 6.9          | ORPH
                        c-ares |  DISTRO  | https://release-monitoring.org/project/05840 | 1.27.0       | 1.30.0       | ORPH
                        c-icap |  DISTRO  | https://release-monitoring.org/project/21325 | 0.5.10       | 0.6.3        | ORPH
                c-icap-modules |  DISTRO  | https://release-monitoring.org/project/21326 | 0.5.5        | 0.5.7        | ORPH
               ca-certificates |  DISTRO  | https://release-monitoring.org/project/09026 | 20230311     | 20240203     |     
                         cairo |  DISTRO  | https://release-monitoring.org/project/00247 | 1.17.4       | 1.18.0       |     
                       cairomm |  DISTRO  | https://release-monitoring.org/project/07959 | 1.16.2       | 1.18.0       |     
                   cairomm1_14 |  DISTRO  | https://release-monitoring.org/project/369459 | 1.14.4       | 1.14.5       |     
                    cannelloni |  DISTRO  | https://release-monitoring.org/project/21403 | 1.0.0        | 1.1.0        |     
                     cantarell |  DISTRO  | https://release-monitoring.org/project/10888 | 0.0.25       | 0.303.1      | ORPH
                     capnproto |  DISTRO  | https://release-monitoring.org/project/11515 | 0.10.4       | 1.0.2        |     
                        ccache |  DISTRO  | https://release-monitoring.org/project/00257 | 4.9.1        | 4.10         | ORPH
                          ccid |  DISTRO  | https://release-monitoring.org/project/02612 | 1.5.2        | 1.6.0        | ORPH
                       chartjs |  DISTRO  | https://release-monitoring.org/project/85785 | 3.9.1        | 4.4.3        | ORPH
                   checkpolicy |  DISTRO  | https://release-monitoring.org/project/00276 | 3.6          | 20200710     |     
                        chrony |  DISTRO  | https://release-monitoring.org/project/08810 | 4.4          | 4.5          | ORPH
                    cifs-utils |  DISTRO  | https://release-monitoring.org/project/00287 | 6.15         | 7.0          |     
                        circus |  DISTRO  | https://release-monitoring.org/project/21726 | 0.16.1       | 0.18.0       |     
                        clamav |  DISTRO  | https://release-monitoring.org/project/00291 | 1.0.6        | 1.3.1        |     
                         clang |  DISTRO  | https://release-monitoring.org/project/11811 | 15.0.3       | 18.1.7       |     
                         cli11 |  DISTRO  | https://release-monitoring.org/project/20578 | 2.3.2        | 2.4.2        |     
                        clinfo |  DISTRO  | https://release-monitoring.org/project/10503 | 3.0.21.02.21 | 3.0.23.01.25 |     
                         cloop |  DISTRO  | https://release-monitoring.org/project/21332 | 3.14.1.3     | 3.14.1.3+... |     
                         cmake |  DISTRO  | https://release-monitoring.org/project/00306 | 3.28.3       | 3.29.5       |     
                   cni-plugins |  DISTRO  | https://release-monitoring.org/project/96794 | 1.3.0        | 1.5.0        |     
                      collectl |  DISTRO  | https://release-monitoring.org/project/00330 | 4.3.2        | 4.3.8        |     
                 comix-cursors |  DISTRO  | https://release-monitoring.org/project/21882 | 0.9.1        | 0.10.0       | ORPH
                   compiler-rt |  DISTRO  | https://release-monitoring.org/project/17705 | 15.0.3       | 18.1.7       |     
                      composer |  DISTRO  | https://release-monitoring.org/project/09710 | 2.5.8        | 2.7.7        |     
                        conmon |  DISTRO  | https://release-monitoring.org/project/96793 | 2.1.8        | 2.1.12       |     
               conntrack-tools |  DISTRO  | https://release-monitoring.org/project/00338 | 1.4.7        | 1.4.8        | ORPH
                    containerd |  DISTRO  | https://release-monitoring.org/project/16460 | 1.7.14       | 1.7.18       |     
                     coreutils |  DISTRO  | https://release-monitoring.org/project/00343 | 9.3          | 9.5          | ORPH
                       crudini |  DISTRO  | https://release-monitoring.org/project/21669 | 0.9.3        | 0.9.5        |     
                          crun |  DISTRO  | https://release-monitoring.org/project/96792 | 1.12         | 1.15         |     
                    cryptsetup |  DISTRO  | https://release-monitoring.org/project/13709 | 2.7.1        | 2.7.2        |     
                       cukinia |  DISTRO  | https://release-monitoring.org/project/138119 | 0.6.0        | 0.7.0        | ORPH
                          cups |  DISTRO  | https://release-monitoring.org/project/00380 | 2.4.7        | 2.4.9        |     
                  cups-filters |  DISTRO  | https://release-monitoring.org/project/05541 | 1.28.17      | 2.0.0        |     
                      cutelyst |  DISTRO  | https://release-monitoring.org/project/21335 | 2.11.0       | 4.3.0        |     
                        dacapo |  DISTRO  | https://release-monitoring.org/project/20546 | 9.12-MR1-... | 2006-10-MR2  |     
                          dado |  DISTRO  | https://release-monitoring.org/project/58442 | 1.8.3-1      | 2.2.0-1      |     
                          daq3 |  DISTRO  | https://release-monitoring.org/project/212345 | 3.0.9        | 3.0.15       |     
                     darkhttpd |  DISTRO  | https://release-monitoring.org/project/00391 | 1.15         | 1.16         |     
                    datatables |  DISTRO  | https://release-monitoring.org/project/141588 | 1.10.20      | 1.13.4       | ORPH
            datatables-buttons |  DISTRO  | https://release-monitoring.org/project/141589 | 1.6.1        | 2.3.6        | ORPH
       datatables-fixedcolumns |  DISTRO  | https://release-monitoring.org/project/141590 | 3.3.0        | 4.2.2        | ORPH
         datatables-responsive |  DISTRO  | https://release-monitoring.org/project/141591 | 2.2.3        | 2.4.1        | ORPH
                         dav1d |  DISTRO  | https://release-monitoring.org/project/18920 | 1.4.1        | 1.4.3        |     
                   dbus-broker |  DISTRO  | https://release-monitoring.org/project/271475 | 33           | 36           |     
                      dbus-cxx |  DISTRO  | https://release-monitoring.org/project/242464 | 2.4.0        | 2.5.1        |     
                   dbus-python |  DISTRO  | https://release-monitoring.org/project/00402 | 1.2.18       | 1.3.2        | ORPH
                         dc3dd |  DISTRO  | https://release-monitoring.org/project/15086 | 7.2.641      | 7.3.1        | ORPH
                   debianutils |  DISTRO  | https://release-monitoring.org/project/21341 | 4.11         | 5.19         | ORPH
            desktop-file-utils |  DISTRO  | https://release-monitoring.org/project/00421 | 0.26         | 0.27         | ORPH
                        dialog |  DISTRO  | https://release-monitoring.org/project/00431 | 1.3-20220117 | 1.3-20230209 | ORPH
                         dillo |  DISTRO  | https://release-monitoring.org/project/00438 | 3.0.5        | 3.1.1        | ORPH
                    docker-cli |  DISTRO  | https://release-monitoring.org/project/21076 | 26.0.2       | 26.1.4       |     
                 docker-engine |  DISTRO  | https://release-monitoring.org/project/00447 | 26.0.2       | 26.1.4       |     
             double-conversion |  DISTRO  | https://release-monitoring.org/project/07454 | 3.2.1        | 3.3.0        |     
                        dracut |  DISTRO  | https://release-monitoring.org/project/10627 | 059          | 102          |     
                    drbd-utils |  DISTRO  | https://release-monitoring.org/project/00462 | 9.21.4       | 9.28.0       |     
                            dt |  DISTRO  | https://release-monitoring.org/project/21844 | 18.32        | 21.27        | ORPH
                      dt-utils |  DISTRO  | https://release-monitoring.org/project/21419 | 2023.08.0    | 2023.11.0    |     
                          dust |  DISTRO  | https://release-monitoring.org/project/141344 | 0.9.0        | 1.0.0        | ORPH
                     e2fsprogs |  DISTRO  | https://release-monitoring.org/project/00646 | 1.47.0       | 1.47.1       | ORPH
                      earlyoom |  DISTRO  | https://release-monitoring.org/project/17392 | 1.7          | 1.8.2        |     
                      easy-rsa |  DISTRO  | https://release-monitoring.org/project/17770 | 3.1.7        | 3.2.0        |     
                            ed |  DISTRO  | https://release-monitoring.org/project/00659 | 1.20         | 1.20.2       | ORPH
                          edk2 |  DISTRO  | https://release-monitoring.org/project/125953 | edk2-stab... | 202405       |     
                           efl |  DISTRO  | https://release-monitoring.org/project/06128 | 1.26.3       | 1.27.0       |     
                      ejabberd |  DISTRO  | https://release-monitoring.org/project/00667 | 23.04        | 24.02        |     
                       elf2flt |  DISTRO  | https://release-monitoring.org/project/115314 | 2024.02      | 2024.05      | ORPH
                      elfutils |  DISTRO  | https://release-monitoring.org/project/05679 | 0.189        | 0.191        | ORPH
                           ell |  DISTRO  | https://release-monitoring.org/project/17781 | 0.65         | 0.66         | ORPH
                       enchant |  DISTRO  | https://release-monitoring.org/project/06601 | 2.3.3        | 2.8.1        |     
                          enet |  DISTRO  | https://release-monitoring.org/project/00696 | 1.3.17       | 1.3.18       |     
                 enlightenment |  DISTRO  | https://release-monitoring.org/project/00698 | 0.25.4       | 0.26.0       |     
                        erlang |  DISTRO  | https://release-monitoring.org/project/00707 | 26.0.2       | 27.0         |     
                  erlang-jiffy |  DISTRO  | https://release-monitoring.org/project/09323 | 1.1.1        | 1.1.2        |     
                   erlang-jose |  DISTRO  | https://release-monitoring.org/project/16913 | 1.11.5       | 1.11.10      |     
              erlang-p1-mqtree |  DISTRO  | https://release-monitoring.org/project/20220 | 1.0.15       | 1.0.16       |     
              erlang-p1-oauth2 |  DISTRO  | https://release-monitoring.org/project/09302 | 0.6.11       | 0.8.0        |     
                 erlang-p1-sip |  DISTRO  | https://release-monitoring.org/project/10576 | 1.0.49       | 1.0.52       |     
                erlang-p1-stun |  DISTRO  | https://release-monitoring.org/project/09151 | 1.2.7        | 1.2.12       |     
                 erlang-p1-tls |  DISTRO  | https://release-monitoring.org/project/10455 | 1.1.16       | 1.1.19       |     
                 erlang-p1-xml |  DISTRO  | https://release-monitoring.org/project/10464 | 1.1.49       | 1.1.51       |     
                erlang-p1-xmpp |  DISTRO  | https://release-monitoring.org/project/12752 | 1.6.2        | 1.8.1        |     
                   erofs-utils |  DISTRO  | https://release-monitoring.org/project/63188 | 1.5          | 1.7.1        |     
                       ethtool |  DISTRO  | https://release-monitoring.org/project/00763 | 6.7          | 6.9          |     
                      execline |  DISTRO  | https://release-monitoring.org/project/05482 | 2.9.5.1      | 2.9.6.0      |     
                        exempi |  DISTRO  | https://release-monitoring.org/project/00767 | 2.6.3        | 2.6.5        |     
                    exfatprogs |  DISTRO  | https://release-monitoring.org/project/94441 | 1.2.2        | 1.2.3        |     
                         exiv2 |  DISTRO  | https://release-monitoring.org/project/00769 | 0.27.6       | 0.28.2       |     
                           eza |  DISTRO  | https://release-monitoring.org/project/369474 | 0.18.8       | 0.18.18      |     
                      fail2ban |  DISTRO  | https://release-monitoring.org/project/06602 | 1.0.2        | 1.1.0        |     
                      fakeroot |  DISTRO  | https://release-monitoring.org/project/12048 | 1.34         | 1.35         | ORPH
                          fcft |  DISTRO  | https://release-monitoring.org/project/143240 | 3.1.6        | 3.1.8        |     
                           feh |  DISTRO  | https://release-monitoring.org/project/00790 | 3.7.1        | 3.10.2       |     
                        ffmpeg |  DISTRO  | https://release-monitoring.org/project/05405 | 6.1.1        | 7.0.1        |     
                     findutils |  DISTRO  | https://release-monitoring.org/project/00812 | 4.9.0        | 4.10.0       | ORPH
                           fio |  DISTRO  | https://release-monitoring.org/project/00806 | 3.34         | 3.37         |     
                     firewalld |  DISTRO  | https://release-monitoring.org/project/09989 | 2.0.2        | 2.1.2        | ORPH
                       flannel |  DISTRO  | https://release-monitoring.org/project/07421 | 0.25.2       | 0.25.4       |     
                   flatbuffers |  DISTRO  | https://release-monitoring.org/project/16642 | 23.5.26      | 24.3.25      |     
                          flot |  DISTRO  | https://release-monitoring.org/project/07184 | 0.8.3        | 4.2.6        | ORPH
                          fltk |  DISTRO  | https://release-monitoring.org/project/00823 | 1.3.7        | 1.3.9        | ORPH
                    fluent-bit |  DISTRO  | https://release-monitoring.org/project/267335 | 3.0.3        | 3.0.7        |     
                           fmc |  GUESS   | https://release-monitoring.org/project/145761 | LSDK-21.08   | 0.2.0        | ORPH
                       fmtools |  DISTRO  | https://release-monitoring.org/project/21435 | 2.0.7        | 2.0.8        | ORPH
                  font-awesome |  DISTRO  | https://release-monitoring.org/project/00826 | 4.7.0        | 6.5.2        | ORPH
                    fontconfig |  DISTRO  | https://release-monitoring.org/project/00827 | 2.14.2       | 2.15.0       | ORPH
                          foot |  DISTRO  | https://release-monitoring.org/project/141611 | 1.16.2       | 1.17.2       |     
                         fping |  DISTRO  | https://release-monitoring.org/project/00834 | 5.1          | 5.2          |     
             freeradius-server |  DISTRO  | https://release-monitoring.org/project/00853 | 3.2.3        | 3.2.4        |     
                       freerdp |  DISTRO  | https://release-monitoring.org/project/10442 | 2.11.6       | 3.5.1        |     
                           frr |  DISTRO  | https://release-monitoring.org/project/18555 | 8.5.4        | 10.0.1       |     
                    fscryptctl |  DISTRO  | https://release-monitoring.org/project/270981 | 1.0.0        | 1.2.0        |     
                          fwup |  DISTRO  | https://release-monitoring.org/project/21438 | 1.9.1        | 1.10.2       |     
                           gcr |  DISTRO  | https://release-monitoring.org/project/11801 | 3.40.0       | 4.3.0        | ORPH
                          gdal |  DISTRO  | https://release-monitoring.org/project/00881 | 3.8.2        | 3.9.0        |     
                    gdk-pixbuf |  DISTRO  | https://release-monitoring.org/project/09533 | 2.42.10      | 2.42.12      | ORPH
                        gensio |  DISTRO  | https://release-monitoring.org/project/67634 | 2.5.5        | 2.8.5        |     
                       gerbera |  DISTRO  | https://release-monitoring.org/project/18420 | 1.12.1       | 2.1.0        |     
                   gettext-gnu |  DISTRO  | https://release-monitoring.org/project/00898 | 0.22.4       | 0.22.5       | ORPH
                   ghostscript |  DISTRO  | https://release-monitoring.org/project/01157 | 10.02.1      | 10.03.1      |     
                 gitlab-runner |  DISTRO  | https://release-monitoring.org/project/11337 | 15.5.0       | 17.0.0       |     
               glib-networking |  DISTRO  | https://release-monitoring.org/project/21353 | 2.76.0       | 2.80.0       | ORPH
                        glibmm |  DISTRO  | https://release-monitoring.org/project/07960 | 2.76.0       | 2.80.0       |     
                    glibmm2_66 |  DISTRO  | https://release-monitoring.org/project/369440 | 2.66.6       | 2.66.7       |     
                           glm |  DISTRO  | https://release-monitoring.org/project/01181 | 1.0.0        | 1.0.1        | ORPH
                          glog |  DISTRO  | https://release-monitoring.org/project/08732 | 0.7.0        | 0.7.1        |     
                       gnuplot |  DISTRO  | https://release-monitoring.org/project/01216 | 6.0.0        | 6.0.1        |     
                      gnuradio |  DISTRO  | https://release-monitoring.org/project/01217 | 3.10.7.0     | 3.10.10.0    |     
                        gnutls |  DISTRO  | https://release-monitoring.org/project/01221 | 3.8.3        | 3.8.5        | ORPH
         gobject-introspection |  DISTRO  | https://release-monitoring.org/project/01223 | 1.76.1       | 1.80.1       | ORPH
                     gocryptfs |  DISTRO  | https://release-monitoring.org/project/21085 | 2.3.2        | 2.4.0        |     
                          gqrx |  DISTRO  | https://release-monitoring.org/project/09771 | 2.15.9       | 2.17.5       |     
                    gr-osmosdr |  DISTRO  | https://release-monitoring.org/project/21447 | 0.2.4        | 0.2.6        |     
                       granite |  DISTRO  | https://release-monitoring.org/project/05410 | 6.2.0        | 7.5.0        | ORPH
                      grantlee |  DISTRO  | https://release-monitoring.org/project/21448 | 5.2.0        | 5.3.1        |     
                graphicsmagick |  DISTRO  | https://release-monitoring.org/project/01248 | 1.3.40       | 1.3.43       |     
                          grpc |  DISTRO  | https://release-monitoring.org/project/19117 | 1.51.1       | 1.64.2       |     
     gsettings-desktop-schemas |  DISTRO  | https://release-monitoring.org/project/13139 | 45.0         | 46.0         |     
                           gsl |  DISTRO  | https://release-monitoring.org/project/01267 | 2.7.1        | 2.8          | ORPH
                       gst-omx |  DISTRO  | https://release-monitoring.org/project/21845 | 1.22.9       | 1.22.12      | ORPH
                 gst1-devtools |  DISTRO  | https://release-monitoring.org/project/21856 | 1.22.9       | 1.24.4       | ORPH
                      gst1-imx |  DISTRO  | https://release-monitoring.org/project/21846 | 0.13.1       | 2.2.0        |     
                    gst1-libav |  DISTRO  | https://release-monitoring.org/project/21848 | 1.22.9       | 1.24.4       | ORPH
              gst1-plugins-bad |  DISTRO  | https://release-monitoring.org/project/21849 | 1.22.9       | 1.24.4       | ORPH
             gst1-plugins-base |  DISTRO  | https://release-monitoring.org/project/21850 | 1.22.9       | 1.24.4       | ORPH
             gst1-plugins-good |  DISTRO  | https://release-monitoring.org/project/21852 | 1.22.9       | 1.24.4       | ORPH
             gst1-plugins-ugly |  DISTRO  | https://release-monitoring.org/project/15187 | 1.22.9       | 1.24.4       | ORPH
                   gst1-python |  DISTRO  | https://release-monitoring.org/project/03881 | 1.22.9       | 1.24.4       | ORPH
              gst1-rtsp-server |  DISTRO  | https://release-monitoring.org/project/21853 | 1.22.9       | 1.24.4       | ORPH
                    gst1-vaapi |  DISTRO  | https://release-monitoring.org/project/21855 | 1.22.9       | 1.24.4       | ORPH
                    gstreamer1 |  DISTRO  | https://release-monitoring.org/project/01263 | 1.22.9       | 1.24.4       | ORPH
   gstreamer1-editing-services |  DISTRO  | https://release-monitoring.org/project/230920 | 1.22.9       | 1.24.4       | ORPH
                        gtkmm3 |  DISTRO  | https://release-monitoring.org/project/311572 | 3.24.8       | 3.24.9       |     
                 gtksourceview |  DISTRO  | https://release-monitoring.org/project/07724 | 3.24.7       | 5.12.1       |     
                    gutenprint |  DISTRO  | https://release-monitoring.org/project/01285 | 5.2.14       | 5.3.4        | ORPH
                          gvfs |  DISTRO  | https://release-monitoring.org/project/05496 | 1.48.1       | 1.54.1       | ORPH
                        hackrf |  DISTRO  | https://release-monitoring.org/project/06136 | 2023.01.1    | 2024.02.1    | ORPH
                       haproxy |  DISTRO  | https://release-monitoring.org/project/01298 | 2.6.15       | 3.0.0        |     
                      harfbuzz |  DISTRO  | https://release-monitoring.org/project/01299 | 8.4.0        | 8.5.0        |     
                      hiawatha |  DISTRO  | https://release-monitoring.org/project/13375 | 11.2         | 11.5         |     
            hicolor-icon-theme |  DISTRO  | https://release-monitoring.org/project/01316 | 0.17         | 0.18         |     
                       highway |  DISTRO  | https://release-monitoring.org/project/205809 | 1.1.0        | 1.2.0        |     
                         hplip |  DISTRO  | https://release-monitoring.org/project/01327 | 3.17.10      | 3.23.12      | ORPH
                        hwdata |  DISTRO  | https://release-monitoring.org/project/05387 | 0.379        | 0.383        | ORPH
                         hwloc |  DISTRO  | https://release-monitoring.org/project/13501 | 2.9.3        | 2.10.0       |     
                          i2pd |  DISTRO  | https://release-monitoring.org/project/21355 | 2.50.2       | 2.52.0       |     
                           icu |  DISTRO  | https://release-monitoring.org/project/16134 | 73-2         | 75-1         | ORPH
                     ifenslave |  DISTRO  | https://release-monitoring.org/project/21670 | 2.9          | 2.14         | ORPH
                      ifupdown |  DISTRO  | https://release-monitoring.org/project/21673 | 0.8.41       | 0.8.43       | ORPH
                   imagemagick |  DISTRO  | https://release-monitoring.org/project/01372 | 7.1.1-31     | 7.1.1-33     | ORPH
                        imlib2 |  DISTRO  | https://release-monitoring.org/project/21676 | 1.7.3        | 1.12.2       |     
                 inotify-tools |  DISTRO  | https://release-monitoring.org/project/08864 | 3.20.2.2     | 4.23.9.0     | ORPH
                  intel-gmmlib |  DISTRO  | https://release-monitoring.org/project/20342 | 22.3.19      | 22.3.20      |     
             intel-mediadriver |  DISTRO  | https://release-monitoring.org/project/20341 | 24.2.2       | 24.2.4       |     
               intel-microcode |  DISTRO  | https://release-monitoring.org/project/20614 | 20231114     | 20240531     |     
                        iperf3 |  DISTRO  | https://release-monitoring.org/project/01389 | 3.16         | 3.17.1       | ORPH
                      iproute2 |  DISTRO  | https://release-monitoring.org/project/01392 | 6.8.0        | 6.9.0        |     
                         ipset |  DISTRO  | https://release-monitoring.org/project/01393 | 7.16         | 7.22         |     
                    irqbalance |  DISTRO  | https://release-monitoring.org/project/01402 | 1.9.3        | 1.9.4        |     
                         irssi |  DISTRO  | https://release-monitoring.org/project/01404 | 1.4.4        | 1.4.5        |     
                            iw |  DISTRO  | https://release-monitoring.org/project/01410 | 5.19         | 6.9          | ORPH
                           iwd |  DISTRO  | https://release-monitoring.org/project/18380 | 2.17         | 2.18         | ORPH
                         janet |  DISTRO  | https://release-monitoring.org/project/155612 | 1.33.0       | 1.35.0       |     
                 janus-gateway |  DISTRO  | https://release-monitoring.org/project/15715 | 1.1.2        | 1.2.2        |     
                        jasper |  DISTRO  | https://release-monitoring.org/project/01421 | 2.0.33       | 4.2.4        |     
                      jbig2dec |  DISTRO  | https://release-monitoring.org/project/01431 | 0.19         | 0.20         |     
                        jimtcl |  DISTRO  | https://release-monitoring.org/project/01459 | 0.81         | 0.82         |     
         jitterentropy-library |  DISTRO  | https://release-monitoring.org/project/29701 | 3.4.1        | 3.5.0        | ORPH
                            jo |  DISTRO  | https://release-monitoring.org/project/18855 | 1.6          | 1.9          |     
                          jose |  DISTRO  | https://release-monitoring.org/project/11761 | 11           | 14           |     
                    jpeg-turbo |  DISTRO  | https://release-monitoring.org/project/01648 | 2.1.5        | 3.0.3        |     
         jquery-datetimepicker |  DISTRO  | https://release-monitoring.org/project/13910 | 2.4.5        | 2.5.20       |     
               jquery-keyboard |  DISTRO  | https://release-monitoring.org/project/21681 | 1.18.12      | 1.30.4       | ORPH
                 jquery-mobile |  DISTRO  | https://release-monitoring.org/project/59395 | 1.4.3        | 1.4.5        | ORPH
                     jquery-ui |  DISTRO  | https://release-monitoring.org/project/21815 | 1.13.1       | 1.13.3       |     
              jquery-ui-themes |  DISTRO  | https://release-monitoring.org/project/21816 | 1.10.4       | 1.13.3       |     
             jquery-validation |  DISTRO  | https://release-monitoring.org/project/21817 | 1.19.5       | 1.20.1       | ORPH
                           kbd |  DISTRO  | https://release-monitoring.org/project/01492 | 2.5.1        | 2.6.4        | ORPH
                    keepalived |  DISTRO  | https://release-monitoring.org/project/01504 | 2.2.8        | 2.3.1        |     
       kf5-extra-cmake-modules |  DISTRO  | https://release-monitoring.org/project/08762 | 5.91.0       | 6.0.90       |     
               kf5-kcoreaddons |  DISTRO  | https://release-monitoring.org/project/08762 | 5.91.0       | 6.0.90       |     
           kf5-modemmanager-qt |  DISTRO  | https://release-monitoring.org/project/08762 | 5.91.0       | 6.0.90       |     
         kf5-networkmanager-qt |  DISTRO  | https://release-monitoring.org/project/08762 | 5.91.0       | 6.0.90       |     
                          kmod |  DISTRO  | https://release-monitoring.org/project/01517 | 31           | 32           |     
                          kodi |  DISTRO  | https://release-monitoring.org/project/05511 | 21.0-Omega   | 21.0         |     
     kodi-inputstream-adaptive |  DISTRO  | https://release-monitoring.org/project/21795 | 21.4.7-Omega | 21.4.9-Omega |     
        kodi-jsonschemabuilder |  DISTRO  | https://release-monitoring.org/project/05511 | 21.0-Omega   | 21.0         |     
      kodi-peripheral-joystick |  DISTRO  | https://release-monitoring.org/project/21793 | 21.1.15-O... | 21.1.18-O... |     
                  kodi-pvr-hts |  DISTRO  | https://release-monitoring.org/project/21783 | 21.2.3-Omega | 21.2.4-Omega |     
               kodi-pvr-vuplus |  DISTRO  | https://release-monitoring.org/project/21773 | 21.1.2-Omega | 21.2.0       |     
                kodi-pvr-waipu |  DISTRO  | https://release-monitoring.org/project/241529 | 21.6.1-Omega | 21.8.0-Omega |     
               kodi-pvr-zattoo |  DISTRO  | https://release-monitoring.org/project/100438 | 21.0.1-Omega | 21.0.2-Omega |     
            kodi-texturepacker |  DISTRO  | https://release-monitoring.org/project/05511 | 21.0-Omega   | 21.0         |     
                  kompexsqlite |  DISTRO  | https://release-monitoring.org/project/21462 | 1.12.15      | 1.13.15      | ORPH
                   ksmbd-tools |  DISTRO  | https://release-monitoring.org/project/241856 | 3.5.1        | 3.5.2        |     
                       kvazaar |  DISTRO  | https://release-monitoring.org/project/12418 | 2.2.0        | 2.3.1        |     
                        lapack |  DISTRO  | https://release-monitoring.org/project/01534 | 3.10.1       | 3.12.0       |     
                 libabseil-cpp |  DISTRO  | https://release-monitoring.org/project/115295 | 20230802.1   | 20240116.2   |     
                         libao |  DISTRO  | https://release-monitoring.org/project/07629 | 1.2.0        | 1.2.2        | ORPH
                        libass |  DISTRO  | https://release-monitoring.org/project/01560 | 0.17.1       | 0.17.2       |     
                        libbpf |  DISTRO  | https://release-monitoring.org/project/141355 | 1.1.0        | 1.4.3        |     
                        libbsd |  DISTRO  | https://release-monitoring.org/project/01567 | 0.11.7       | 0.12.2       |     
                   libbytesize |  DISTRO  | https://release-monitoring.org/project/07869 | 2.7          | 2.10         | ORPH
                libcamera-apps |  DISTRO  | https://release-monitoring.org/project/328456 | 1.2.1        | 1.5.0        |     
                        libcap |  DISTRO  | https://release-monitoring.org/project/01569 | 2.69         | 2.70         |     
                     libcgroup |  DISTRO  | https://release-monitoring.org/project/01575 | 2.0.3        | 3.1.0        |     
                 libcpprestsdk |  DISTRO  | https://release-monitoring.org/project/15531 | 2.10.18      | 2.10.19      | ORPH
                       libcurl |  DISTRO  | https://release-monitoring.org/project/00381 | 8.7.1        | 8.8.0        |     
                      libdecor |  DISTRO  | https://release-monitoring.org/project/312806 | 0.1.1        | 0.2.2        |     
                       libdnet |  DISTRO  | https://release-monitoring.org/project/06308 | 1.16.4       | 1.18.0       | ORPH
                        libdrm |  DISTRO  | https://release-monitoring.org/project/01596 | 2.4.120      | 2.4.121      |     
                       libedit |  DISTRO  | https://release-monitoring.org/project/01599 | 20230828-3.1 | 20240517-3.1 |     
                      libevdev |  DISTRO  | https://release-monitoring.org/project/20540 | 1.13.1       | 1.13.2       |     
                   libfastjson |  DISTRO  | https://release-monitoring.org/project/12043 | 0.99.9.1     | 1.2304.0     |     
                   libfreeglut |  DISTRO  | https://release-monitoring.org/project/00846 | 3.4.0        | 3.6.0        |     
                    libfribidi |  DISTRO  | https://release-monitoring.org/project/00857 | 1.0.14       | 1.0.15       |     
                       libgeos |  DISTRO  | https://release-monitoring.org/project/13493 | 3.12.1       | 3.12.2       |     
                       libgit2 |  DISTRO  | https://release-monitoring.org/project/01627 | 1.8.0        | 1.8.1        |     
                      libglade |  DISTRO  | https://release-monitoring.org/project/01174 | 2.6.4        | 3.40.0       | ORPH
                       libglfw |  DISTRO  | https://release-monitoring.org/project/01180 | 3.3.8        | 3.4          |     
                      libglib2 |  DISTRO  | https://release-monitoring.org/project/10024 | 2.76.1       | 2.80.3       |     
                      libglvnd |  DISTRO  | https://release-monitoring.org/project/12098 | 1.4.0        | 1.7.0        | ORPH
                    libgphoto2 |  DISTRO  | https://release-monitoring.org/project/12558 | 2.5.27       | 2.5.31       | ORPH
                      libgpiod |  GUESS   | https://release-monitoring.org/project/20640 | 1.6.4        | 2.1.2        | ORPH
                     libgpiod2 |  DISTRO  | https://release-monitoring.org/project/20640 | 2.1          | 2.1.2        |     
                      libgsasl |  DISTRO  | https://release-monitoring.org/project/01563 | 1.10.0       | 2.2.1        | ORPH
                       libgtk3 |  DISTRO  | https://release-monitoring.org/project/311549 | 3.24.41      | 3.24.42      |     
                      libgudev |  DISTRO  | https://release-monitoring.org/project/07735 | 237          | 238          |     
                     libiberty |  DISTRO  | https://release-monitoring.org/project/07981 | 2.41         | 2.42         |     
                       libical |  DISTRO  | https://release-monitoring.org/project/01637 | 1.0.1        | 3.0.18       |     
                      libiconv |  DISTRO  | https://release-monitoring.org/project/10656 | 1.15         | 1.17         | ORPH
                  libimxvpuapi |  DISTRO  | https://release-monitoring.org/project/21479 | 0.10.3       | 2.3.0        |     
                      libinput |  DISTRO  | https://release-monitoring.org/project/05781 | 1.25.0       | 1.26.0       |     
                        libjwt |  DISTRO  | https://release-monitoring.org/project/242868 | 1.17.0       | 1.17.1       |     
                         libks |  DISTRO  | https://release-monitoring.org/project/241898 | 2.0.2        | 2.0.5        |     
                     liblinear |  DISTRO  | https://release-monitoring.org/project/21363 | 2.45         | 2.47         |     
                         liblo |  DISTRO  | https://release-monitoring.org/project/21483 | 0.31         | 0.32         | ORPH
                  libmaxminddb |  DISTRO  | https://release-monitoring.org/project/07470 | 1.9.1        | 1.10.0       |     
                  libminiupnpc |  DISTRO  | https://release-monitoring.org/project/01986 | 2.2.7        | 2.2.8        |     
                     libmspack |  DISTRO  | https://release-monitoring.org/project/16827 | 0.10.1alpha  | 1.11         |     
                   libnetconf2 |  DISTRO  | https://release-monitoring.org/project/31639 | 2.1.28       | 3.0.17       |     
                       libnice |  DISTRO  | https://release-monitoring.org/project/01683 | 0.1.21       | 0.1.22       |     
                     libnpupnp |  DISTRO  | https://release-monitoring.org/project/75209 | 4.2.2        | 6.1.3        |     
                        libnss |  DISTRO  | https://release-monitoring.org/project/02503 | 3.100        | 3.101        |     
                       libnvme |  DISTRO  | https://release-monitoring.org/project/242763 | 1.8          | 1.9          |     
                   libopenh264 |  DISTRO  | https://release-monitoring.org/project/21365 | 2.4.0        | 2.4.1        |     
                     libostree |  DISTRO  | https://release-monitoring.org/project/10899 | 2023.8       | 2024.6       |     
                       libpeas |  DISTRO  | https://release-monitoring.org/project/06871 | 1.32.0       | 2.0.2        | ORPH
                      libpjsip |  DISTRO  | https://release-monitoring.org/project/15701 | 2.14         | 2.14.1       |     
                      libplist |  DISTRO  | https://release-monitoring.org/project/11675 | 2.4.0        | 2.6.0        | ORPH
                       libpqxx |  DISTRO  | https://release-monitoring.org/project/21367 | 7.7.5        | 7.9.1        |     
                        libpri |  DISTRO  | https://release-monitoring.org/project/11042 | 1.6.0        | 1.6.1        |     
                      libressl |  DISTRO  | https://release-monitoring.org/project/12102 | 3.8.4        | 3.9.2        | ORPH
                       librsvg |  DISTRO  | https://release-monitoring.org/project/05420 | 2.50.9       | 2.58.91      |     
                       librtas |  DISTRO  | https://release-monitoring.org/project/10717 | 2.0.5        | 2.0.6        | ORPH
                     libsecret |  DISTRO  | https://release-monitoring.org/project/13150 | 0.20.5       | 0.21.4       | ORPH
                   libsemanage |  DISTRO  | https://release-monitoring.org/project/01718 | 3.6          | 20200710     |     
                      libsepol |  DISTRO  | https://release-monitoring.org/project/01719 | 3.6          | 20200710     |     
                       libsigc |  DISTRO  | https://release-monitoring.org/project/07961 | 3.4.0        | 3.6.0        |     
                      libsigc2 |  DISTRO  | https://release-monitoring.org/project/311642 | 2.12.0       | 2.12.1       |     
                     libsodium |  DISTRO  | https://release-monitoring.org/project/01728 | 1.0.18       | 1.0.20       |     
                       libsolv |  DISTRO  | https://release-monitoring.org/project/07908 | 0.7.25       | 0.7.29       |     
               libspatialindex |  DISTRO  | https://release-monitoring.org/project/04864 | 1.9.3        | 2.0.0        |     
                       libspdm |  DISTRO  | https://release-monitoring.org/project/369161 | 3.2.0        | 3.3.0        |     
                       libtool |  DISTRO  | https://release-monitoring.org/project/01741 | 2.4.6        | 2.5.0        | ORPH
          libtorrent-rasterbar |  DISTRO  | https://release-monitoring.org/project/04166 | 1.2.19       | 2.0.10       |     
                        libucl |  DISTRO  | https://release-monitoring.org/project/21371 | 0.8.2        | 0.9.2        |     
                   libunibreak |  DISTRO  | https://release-monitoring.org/project/326564 | 5.1          | 6.1          |     
                       libupnp |  DISTRO  | https://release-monitoring.org/project/21315 | 1.14.18      | 1.14.19      |     
                      libupnpp |  DISTRO  | https://release-monitoring.org/project/15849 | 0.21.0       | 0.26.6       | ORPH
                      liburing |  DISTRO  | https://release-monitoring.org/project/230185 | 2.5          | 2.6          |     
                        libv4l |  DISTRO  | https://release-monitoring.org/project/09998 | 1.24.1       | 1.26.1       |     
                       libvips |  DISTRO  | https://release-monitoring.org/project/05097 | 8.10.6       | 8.15.2       |     
                       libvirt |  DISTRO  | https://release-monitoring.org/project/13830 | 7.10.0       | 10.4.0       |     
                        libvpl |  DISTRO  | https://release-monitoring.org/project/242664 | 2.11.0       | 2023.4.0     |     
                        libvpx |  DISTRO  | https://release-monitoring.org/project/11083 | 1.13.1       | 1.14.1       |     
                        libxcb |  DISTRO  | https://release-monitoring.org/project/01767 | 1.15         | 1.17.0       | ORPH
                  libxkbcommon |  DISTRO  | https://release-monitoring.org/project/01780 | 1.4.0        | 1.7.0        |     
                       libxml2 |  DISTRO  | https://release-monitoring.org/project/01783 | 2.12.6       | 2.13.0       |     
                     libxmlrpc |  DISTRO  | https://release-monitoring.org/project/09024 | r3176        | 1.59.03      |     
                       libxslt |  DISTRO  | https://release-monitoring.org/project/13301 | 1.1.39       | 1.1.40       |     
                       libyang |  DISTRO  | https://release-monitoring.org/project/18554 | 2.1.148      | 2.2.8        |     
                    libzenoh-c |  DISTRO  | https://release-monitoring.org/project/372354 | 0.11.0.2     | 0.11.0.3     |     
                 libzenoh-pico |  DISTRO  | https://release-monitoring.org/project/369957 | 0.11.0.1     | 0.11.0.3     |     
                          lilv |  DISTRO  | https://release-monitoring.org/project/01818 | 0.24.12      | 0.24.24      |     
                      linphone |  DISTRO  | https://release-monitoring.org/project/01823 | 4.4.8        | 5.2.4        | ORPH
                linux-firmware |  DISTRO  | https://release-monitoring.org/project/141464 | 20240410     | 20240610     |     
                      linuxptp |  DISTRO  | https://release-monitoring.org/project/21114 | 4.2          | 4.3          |     
                       live555 |  DISTRO  | https://release-monitoring.org/project/12414 | 2021.05.03   | 2024.05.30   | ORPH
                           lld |  DISTRO  | https://release-monitoring.org/project/01830 | 15.0.3       | 18.1.7       |     
                         lldpd |  DISTRO  | https://release-monitoring.org/project/14019 | 1.0.17       | 1.0.18       | ORPH
                          llvm |  DISTRO  | https://release-monitoring.org/project/01830 | 15.0.3       | 18.1.7       |     
                          lmdb |  DISTRO  | https://release-monitoring.org/project/06974 | 0.9.31       | 0.9.33       |     
                lockfile-progs |  DISTRO  | https://release-monitoring.org/project/10135 | 0.1.19       | 0.1.19+nmu1  | ORPH
                     log4cplus |  DISTRO  | https://release-monitoring.org/project/01835 | 2.1.0        | 2.1.1        | ORPH
                       log4cxx |  DISTRO  | https://release-monitoring.org/project/15330 | 1.1.0        | 1.2.0        |     
                     logrotate |  DISTRO  | https://release-monitoring.org/project/10567 | 3.21.0       | 3.22.0       | ORPH
                          lpty |  DISTRO  | https://release-monitoring.org/project/11671 | 1.0.1-1      | 1.2.2        |     
                      lsqlite3 |  DISTRO  | https://release-monitoring.org/project/11649 | 0.9.5-1      | 0.9.6        |     
                 ltp-testsuite |  DISTRO  | https://release-monitoring.org/project/21502 | 20240129     | 20240524     |     
                         ltris |  DISTRO  | https://release-monitoring.org/project/21503 | 1.2.7        | 1.3.2        |     
              lttng-babeltrace |  DISTRO  | https://release-monitoring.org/project/00155 | 1.5.7        | 1.5.11       |     
                  lttng-libust |  DISTRO  | https://release-monitoring.org/project/07135 | 2.13.1       | 2.13.8       |     
                 lttng-modules |  DISTRO  | https://release-monitoring.org/project/07141 | 2.13.10      | 2.13.13      |     
                   lttng-tools |  DISTRO  | https://release-monitoring.org/project/07136 | 2.13.8       | 2.13.13      |     
                           lua |  DISTRO  | https://release-monitoring.org/project/01847 | 5.1.5        | 5.4.6        |     
                     lua-iconv |  DISTRO  | https://release-monitoring.org/project/11668 | 7-1          | 7.1.0        |     
                lua-resty-http |  DISTRO  | https://release-monitoring.org/project/13887 | 0.15-0       | 0.17.2       |     
                           luv |  DISTRO  | https://release-monitoring.org/project/21510 | 1.43.0-0     | 1.48.0-2     | ORPH
                          lvm2 |  DISTRO  | https://release-monitoring.org/project/05354 | 2.03.23      | 2.03.24      | ORPH
                           lxc |  DISTRO  | https://release-monitoring.org/project/01860 | 5.0.3        | 6.0.0        |     
                          lynx |  DISTRO  | https://release-monitoring.org/project/01863 | 2.8.9rel.1   | 2.9.2        |     
                          lzip |  DISTRO  | https://release-monitoring.org/project/01866 | 1.23         | 1.24.1       | ORPH
                    lzma-alone |  DISTRO  | https://release-monitoring.org/project/242840 | 9.22         | 2406         | ORPH
                       mariadb |  DISTRO  | https://release-monitoring.org/project/01887 | 10.11.6      | 11.5.1       | ORPH
                         matio |  DISTRO  | https://release-monitoring.org/project/01893 | 1.5.26       | 1.5.27       |     
                       mbedtls |  DISTRO  | https://release-monitoring.org/project/13824 | 2.28.8       | 3.6.0        |     
                       mbuffer |  DISTRO  | https://release-monitoring.org/project/15518 | 20220418     | 20240107     |     
                        mcelog |  DISTRO  | https://release-monitoring.org/project/08093 | 194          | 199          |     
                         mdevd |  DISTRO  | https://release-monitoring.org/project/16553 | 0.1.6.3      | 0.1.6.4      |     
                 mediastreamer |  DISTRO  | https://release-monitoring.org/project/21746 | 4.4.8        | 5.3.57       | ORPH
                     memcached |  DISTRO  | https://release-monitoring.org/project/01965 | 1.6.22       | 1.6.28       | ORPH
                     memtest86 |  DISTRO  | https://release-monitoring.org/project/01966 | 6.20         | 7.00         |     
                        mesa3d |  DISTRO  | https://release-monitoring.org/project/01970 | 24.0.7       | 24.1.1       |     
                mesa3d-headers |  DISTRO  | https://release-monitoring.org/project/01970 | 24.0.7       | 24.1.1       |     
                         meson |  DISTRO  | https://release-monitoring.org/project/06472 | 1.3.1        | 1.4.1        |     
                      metacity |  DISTRO  | https://release-monitoring.org/project/15392 | 2.25.1       | 3.46.0       | ORPH
                      mfgtools |  DISTRO  | https://release-monitoring.org/project/21519 | 0.02         | 2.8.0        |     
microchip-hss-payload-gener... |  DISTRO  | https://release-monitoring.org/project/368767 | 2023.09      | 2024.02.1    |     
                   micropython |  DISTRO  | https://release-monitoring.org/project/10539 | 1.22.0       | 1.23.0       |     
                         mimic |  DISTRO  | https://release-monitoring.org/project/21521 | 1.1.0        | 1.3.0.1      |     
                      minetest |  DISTRO  | https://release-monitoring.org/project/01978 | 5.6.1        | 5.8.0        |     
                 minetest-game |  DISTRO  | https://release-monitoring.org/project/21522 | 5.6.1        | 5.8.0        |     
                       minizip |  DISTRO  | https://release-monitoring.org/project/301509 | 4.0.3        | 4.0.7        |     
                        moarvm |  DISTRO  | https://release-monitoring.org/project/21100 | 2023.12      | 2024.05      |     
mobile-broadband-provider-info |  DISTRO  | https://release-monitoring.org/project/10267 | 20221107     | 20240407     | ORPH
                 moby-buildkit |  DISTRO  | https://release-monitoring.org/project/20836 | 0.11.6       | 0.14.0       |     
                  modsecurity2 |  DISTRO  | https://release-monitoring.org/project/68638 | 2.9.7        | 3.0.12       |     
                       mokutil |  DISTRO  | https://release-monitoring.org/project/246006 | 0.7.1        | 0.7.2        |     
                       mongodb |  DISTRO  | https://release-monitoring.org/project/02008 | 4.2.18       | 7.3.3        |     
                         monit |  DISTRO  | https://release-monitoring.org/project/05483 | 5.33.0       | 5.34.0       |     
                          mono |  DISTRO  | https://release-monitoring.org/project/06360 | 6.12.0.182   | 6.12.0.206   |     
                     mpdecimal |  DISTRO  | https://release-monitoring.org/project/11578 | 2.5.1        | 4.0.0        |     
                          mpfr |  DISTRO  | https://release-monitoring.org/project/02019 | 4.1.1        | 4.2.1        | ORPH
                        mpg123 |  DISTRO  | https://release-monitoring.org/project/12413 | 1.32.3       | 1.32.6       |     
                           mpv |  DISTRO  | https://release-monitoring.org/project/05348 | 0.35.1       | 0.38.0       |     
                       msgpack |  DISTRO  | https://release-monitoring.org/project/12278 | 3.3.0        | 6.1.1        |     
                         msmtp |  DISTRO  | https://release-monitoring.org/project/02024 | 1.8.25       | 1.8.26       |     
                         mtdev |  DISTRO  | https://release-monitoring.org/project/08868 | 1.1.6        | 1.1.7        |     
                        mtools |  DISTRO  | https://release-monitoring.org/project/02028 | 4.0.43       | 4.0.44       | ORPH
               multipath-tools |  DISTRO  | https://release-monitoring.org/project/00424 | 0.9.8        | 0.9.9        |     
                         mupdf |  DISTRO  | https://release-monitoring.org/project/02034 | 1.22.0       | 1.24.3       |     
                          mxml |  DISTRO  | https://release-monitoring.org/project/13545 | 3.3.1        | 4.0.3        |     
                       nanomsg |  DISTRO  | https://release-monitoring.org/project/14540 | 1.2          | 1.2.1        |     
                          nasm |  DISTRO  | https://release-monitoring.org/project/02048 | 2.16.02      | 2.16.03      | ORPH
                           nbd |  DISTRO  | https://release-monitoring.org/project/02052 | 3.25         | 3.26.1       |     
                          ncdu |  DISTRO  | https://release-monitoring.org/project/06045 | 1.20         | 2.4          |     
                        ndisc6 |  DISTRO  | https://release-monitoring.org/project/21531 | 1.0.7        | 1.0.8        | ORPH
                      neofetch |  DISTRO  | https://release-monitoring.org/project/16261 | 7.1.0        | 7.3.11       | ORPH
                       nerdctl |  DISTRO  | https://release-monitoring.org/project/242901 | 1.7.3        | 1.7.6        |     
                      netatalk |  DISTRO  | https://release-monitoring.org/project/02063 | 3.1.18       | 3.2.0        | ORPH
                netcat-openbsd |  DISTRO  | https://release-monitoring.org/project/21534 | 1.218        | 1.226        | ORPH
                       netdata |  DISTRO  | https://release-monitoring.org/project/11046 | 1.33.1       | 1.45.6       |     
                       netifrc |  DISTRO  | https://release-monitoring.org/project/21917 | 0.7.3        | 0.7.8        |     
                     netopeer2 |  DISTRO  | https://release-monitoring.org/project/114978 | 2.1.49       | 2.2.19       |     
                       netsnmp |  DISTRO  | https://release-monitoring.org/project/02062 | 5.9.3        | 5.9.4        | ORPH
                       netsurf |  DISTRO  | https://release-monitoring.org/project/05386 | 3.10         | 3.11         |     
                        nettle |  DISTRO  | https://release-monitoring.org/project/02073 | 3.9.1        | 3.10         | ORPH
               network-manager |  DISTRO  | https://release-monitoring.org/project/21197 | 1.46.0       | 1.48.0       | ORPH
                          newt |  DISTRO  | https://release-monitoring.org/project/15129 | 0.52.23      | 0.52.24      | ORPH
                      nftables |  DISTRO  | https://release-monitoring.org/project/02082 | 1.0.8        | 1.0.9        |     
               nftables-python |  DISTRO  | https://release-monitoring.org/project/02082 | 1.0.8        | 1.0.9        |     
                       nghttp2 |  DISTRO  | https://release-monitoring.org/project/08651 | 1.58.0       | 1.62.1       |     
                         nginx |  DISTRO  | https://release-monitoring.org/project/05413 | 1.24.0       | 1.27.0       |     
                        ngircd |  DISTRO  | https://release-monitoring.org/project/02083 | 26.1         | 27           | ORPH
                   nilfs-utils |  DISTRO  | https://release-monitoring.org/project/02091 | 2.2.9        | 2.2.11       |     
                         ninja |  DISTRO  | https://release-monitoring.org/project/02089 | 1.11.1.g9... | 1.12.1       |     
                          nmap |  DISTRO  | https://release-monitoring.org/project/02096 | 7.94         | 7.95         | ORPH
                          nmon |  DISTRO  | https://release-monitoring.org/project/02097 | 16p          | 16q          | ORPH
                    nodejs-bin |  DISTRO  | https://release-monitoring.org/project/08251 | 20.11.1      | 22.3.0       |     
                    nodejs-src |  DISTRO  | https://release-monitoring.org/project/08251 | 20.11.1      | 22.3.0       |     
                          noip |  DISTRO  | https://release-monitoring.org/project/21539 | 2.1.9        | 3.0.0        | ORPH
                           ntp |  DISTRO  | https://release-monitoring.org/project/09025 | 4.2.8p17     | 4.2.8p18     |     
                       numactl |  DISTRO  | https://release-monitoring.org/project/02507 | 2.0.16       | 2.0.18       |     
                       nushell |  DISTRO  | https://release-monitoring.org/project/31106 | 0.85.0       | 0.94.2       | ORPH
                        nuttcp |  DISTRO  | https://release-monitoring.org/project/02511 | 6.1.2        | 8.2.2        |     
                 nvidia-driver |  DISTRO  | https://release-monitoring.org/project/21843 | 390.151      | 390.157      |     
               nvidia-modprobe |  DISTRO  | https://release-monitoring.org/project/141657 | 450.57       | 555.52.04    | ORPH
           nvidia-persistenced |  DISTRO  | https://release-monitoring.org/project/369496 | 515.48.07    | 555.52.04    |     
                          nvme |  DISTRO  | https://release-monitoring.org/project/09074 | 1.12         | 2.9.1        | ORPH
                         ofono |  DISTRO  | https://release-monitoring.org/project/16859 | 2.2          | 2.8          |     
                          ogre |  DISTRO  | https://release-monitoring.org/project/33334 | v1.12.12     | 14.2.6       |     
                       omniorb |  DISTRO  | https://release-monitoring.org/project/21545 | 4.3.1        | 4.3.2        | ORPH
              onevpl-intel-gpu |  DISTRO  | https://release-monitoring.org/project/368736 | 24.2.1       | 24.2.4       |     
                    open-iscsi |  DISTRO  | https://release-monitoring.org/project/10861 | 2.1.9        | 2.1.10       |     
                     open-lldp |  DISTRO  | https://release-monitoring.org/project/115714 | 1.1          | 1.1.1        |     
                     open62541 |  DISTRO  | https://release-monitoring.org/project/16896 | v1.3.11      | 1.4.1        | ORPH
                        openal |  DISTRO  | https://release-monitoring.org/project/08172 | 1.22.0       | 1.23.1       | ORPH
                  opencl-clhpp |  DISTRO  | https://release-monitoring.org/project/271141 | 2023.12.14   | 2024.05.08   |     
                  opencore-amr |  DISTRO  | https://release-monitoring.org/project/21548 | 0.1.5        | 0.1.6        | ORPH
                       opencv3 |  DISTRO  | https://release-monitoring.org/project/06615 | 3.4.19       | 4.10.0       |     
                       opencv4 |  DISTRO  | https://release-monitoring.org/project/06615 | 4.9.0        | 4.10.0       |     
                openfpgaloader |  DISTRO  | https://release-monitoring.org/project/241709 | 0.11.0       | 0.12.1       |     
                      openipmi |  DISTRO  | https://release-monitoring.org/project/02549 | 2.0.34       | 2.0.35       | ORPH
                       openjdk |  GUESS   | https://release-monitoring.org/project/176098 | 17.0.9+9     | 24+2         |     
                    openlayers |  DISTRO  | https://release-monitoring.org/project/06847 | 9.1.0        | 9.2.4        |     
                       openmpi |  DISTRO  | https://release-monitoring.org/project/02554 | 4.1.5        | 5.0.3        |     
                        openrc |  DISTRO  | https://release-monitoring.org/project/11687 | 0.52.1       | 0.54         |     
                        opensc |  DISTRO  | https://release-monitoring.org/project/02559 | 0.24.0       | 0.25.1       | ORPH
                   openvmtools |  DISTRO  | https://release-monitoring.org/project/10998 | 11.3.5-18... | 12.4.0       |     
                          opkg |  DISTRO  | https://release-monitoring.org/project/59397 | 0.6.2        | 0.6.3        | ORPH
                    opkg-utils |  DISTRO  | https://release-monitoring.org/project/59396 | 0.6.2        | 0.6.3        | ORPH
                          opus |  DISTRO  | https://release-monitoring.org/project/11081 | 1.4          | 1.5.2        |     
                           orc |  DISTRO  | https://release-monitoring.org/project/02573 | 0.4.34       | 0.4.38       | ORPH
                          ortp |  DISTRO  | https://release-monitoring.org/project/21691 | 4.4.8        | 5.3.57       | ORPH
                        pahole |  DISTRO  | https://release-monitoring.org/project/231624 | 1.25         | 1.27         |     
                         pango |  DISTRO  | https://release-monitoring.org/project/11783 | 1.52.2       | 1.54.0       | ORPH
                       pangomm |  DISTRO  | https://release-monitoring.org/project/07958 | 2.50.1       | 2.52.0       |     
                   pangomm2_46 |  DISTRO  | https://release-monitoring.org/project/369412 | 2.46.3       | 2.46.4       |     
                    parprouted |  DISTRO  | https://release-monitoring.org/project/10309 | 0.7          | 0.65         | ORPH
                      patchelf |  DISTRO  | https://release-monitoring.org/project/02598 | 0.13         | 0.18.0       | ORPH
                      pciutils |  DISTRO  | https://release-monitoring.org/project/02605 | 3.10.0       | 3.13.0       |     
                         pcre2 |  DISTRO  | https://release-monitoring.org/project/05832 | 10.43        | 10.44        | ORPH
                     pcsc-lite |  DISTRO  | https://release-monitoring.org/project/02611 | 2.1.0        | 2.2.3        | ORPH
                          pdbg |  DISTRO  | https://release-monitoring.org/project/21378 | 3.5          | 3.6          |     
                          perl |  DISTRO  | https://release-monitoring.org/project/13599 | 5.38.2       | 5.41.0       |     
                perl-crypt-cbc |  DISTRO  | https://release-monitoring.org/project/11930 | 2.33         | 3.04         |     
        perl-crypt-openssl-aes |  DISTRO  | https://release-monitoring.org/project/02743 | 0.02         | 0.21         |     
     perl-crypt-openssl-random |  DISTRO  | https://release-monitoring.org/project/02747 | 0.15         | 0.17         |     
                perl-data-uuid |  DISTRO  | https://release-monitoring.org/project/11837 | 1.226        | 1.227        |     
               perl-date-manip |  DISTRO  | https://release-monitoring.org/project/02785 | 6.94         | 6.95         |     
                perl-dbd-mysql |  DISTRO  | https://release-monitoring.org/project/02807 | 4.046        | 5.006        |     
               perl-devel-size |  DISTRO  | https://release-monitoring.org/project/02835 | 0.83         | 0.84         |     
          perl-extutils-config |  DISTRO  | https://release-monitoring.org/project/11847 | 0.008        | 0.009        |     
    perl-extutils-installpaths |  DISTRO  | https://release-monitoring.org/project/11849 | 0.012        | 0.013        |     
                       perl-gd |  DISTRO  | https://release-monitoring.org/project/12660 | 2.77         | 2.82         |     
                  perl-gdgraph |  DISTRO  | https://release-monitoring.org/project/09187 | 1.54         | 1.56         |     
              perl-html-parser |  DISTRO  | https://release-monitoring.org/project/02967 | 3.81         | 3.82         |     
              perl-html-tagset |  DISTRO  | https://release-monitoring.org/project/02971 | 3.20         | 3.24         |     
             perl-http-cookies |  DISTRO  | https://release-monitoring.org/project/02974 | 6.10         | 6.11         |     
             perl-http-message |  DISTRO  | https://release-monitoring.org/project/02977 | 6.45         | 6.46         |     
           perl-image-exiftool |  DISTRO  | https://release-monitoring.org/project/06175 | 12.50        | 12.87        |     
            perl-io-socket-ssl |  DISTRO  | https://release-monitoring.org/project/06569 | 2.080        | 2.085        |     
              perl-libwww-perl |  DISTRO  | https://release-monitoring.org/project/03024 | 6.67         | 6.77         |     
       perl-lwp-protocol-https |  DISTRO  | https://release-monitoring.org/project/03050 | 6.12         | 6.14         |     
                perl-mail-dkim |  DISTRO  | https://release-monitoring.org/project/11868 | 1.20230630   | 1.20240124   |     
               perl-mime-tools |  DISTRO  | https://release-monitoring.org/project/11809 | 5.509        | 5.515        |     
        perl-module-build-tiny |  DISTRO  | https://release-monitoring.org/project/11870 | 0.047        | 0.048        |     
              perl-mojolicious |  DISTRO  | https://release-monitoring.org/project/05966 | 9.35         | 9.37         |     
               perl-mozilla-ca |  DISTRO  | https://release-monitoring.org/project/03136 | 20231213     | 20240313     |     
                  perl-net-dns |  DISTRO  | https://release-monitoring.org/project/03147 | 1.42         | 1.45         |     
                 perl-net-ssh2 |  DISTRO  | https://release-monitoring.org/project/03163 | 0.72         | 0.73         |     
                perl-path-tiny |  DISTRO  | https://release-monitoring.org/project/11962 | 0.144        | 0.146        |     
                  perl-sys-cpu |  DISTRO  | https://release-monitoring.org/project/14338 | 0.52         | 0.61         |     
                      perl-uri |  DISTRO  | https://release-monitoring.org/project/03485 | 5.21         | 5.28         |     
               perl-xml-libxml |  DISTRO  | https://release-monitoring.org/project/03527 | 2.0134       | 2.0210       |     
                           php |  DISTRO  | https://release-monitoring.org/project/03627 | 8.3.7        | 8.3.8        |     
                      php-amqp |  DISTRO  | https://release-monitoring.org/project/15603 | 2.0.0        | 2.1.2        |     
                      php-apcu |  DISTRO  | https://release-monitoring.org/project/11010 | 5.1.22       | 5.1.23       |     
                       php-pam |  DISTRO  | https://release-monitoring.org/project/241707 | 2.2.4        | 2.2.5        |     
                      php-ssh2 |  DISTRO  | https://release-monitoring.org/project/21742 | 1.4          | 1.4.1        | ORPH
                    php-xdebug |  DISTRO  | https://release-monitoring.org/project/13302 | 3.3.1        | 3.3.2        |     
                      pinentry |  DISTRO  | https://release-monitoring.org/project/03643 | 1.2.1        | 1.3.0        | ORPH
                      pipewire |  DISTRO  | https://release-monitoring.org/project/57357 | 0.3.81       | 1.1.82       |     
                        pixman |  DISTRO  | https://release-monitoring.org/project/03648 | 0.42.2       | 0.43.4       | ORPH
                       pkgconf |  DISTRO  | https://release-monitoring.org/project/12753 | 1.6.3        | 2.2.0        | ORPH
                      pngquant |  DISTRO  | https://release-monitoring.org/project/03674 | 2.18.0       | 3.0.3        |     
                          poco |  DISTRO  | https://release-monitoring.org/project/05418 | 1.13.2       | 1.13.3       |     
                          poke |  DISTRO  | https://release-monitoring.org/project/179926 | 3.0          | 4.1          | ORPH
                        polkit |  DISTRO  | https://release-monitoring.org/project/03682 | 123          | 124          |     
                       poppler |  DISTRO  | https://release-monitoring.org/project/03686 | 22.12.0      | 24.06.1      |     
                    postgresql |  DISTRO  | https://release-monitoring.org/project/05601 | 16.3         | 17           |     
                         pound |  DISTRO  | https://release-monitoring.org/project/05436 | 4.8          | 4.12         | ORPH
                 powerpc-utils |  DISTRO  | https://release-monitoring.org/project/10715 | 1.3.11       | 1.3.12       | ORPH
                     procps-ng |  DISTRO  | https://release-monitoring.org/project/03708 | 3.3.17       | 4.0.4        | ORPH
                          proj |  DISTRO  | https://release-monitoring.org/project/21570 | 9.3.0        | 9.4.1        |     
                       prosody |  DISTRO  | https://release-monitoring.org/project/03709 | 0.11.14      | 0.12.4       |     
                      protobuf |  DISTRO  | https://release-monitoring.org/project/03715 | 21.12        | 27.1         |     
                proxychains-ng |  DISTRO  | https://release-monitoring.org/project/06499 | 4.16         | 4.17         | ORPH
          pru-software-support |  DISTRO  | https://release-monitoring.org/project/21825 | 6.0.1        | 6.4.0        |     
                        psmisc |  DISTRO  | https://release-monitoring.org/project/03721 | 23.5         | 23.7         | ORPH
                          ptpd |  GUESS   | https://release-monitoring.org/project/03726 | 1.1.0        | 2.3.1        | ORPH
                            pv |  DISTRO  | https://release-monitoring.org/project/03736 | 1.8.5        | 1.8.10       | ORPH
                python-aiocoap |  DISTRO  | https://release-monitoring.org/project/21243 | 0.4.7        | 0.4.9        |     
             python-aioconsole |  DISTRO  | https://release-monitoring.org/project/21244 | 0.7.0        | 0.7.1        |     
                 python-aiodns |  DISTRO  | https://release-monitoring.org/project/21245 | 3.1.1        | 3.2.0        |     
                python-aiohttp |  DISTRO  | https://release-monitoring.org/project/06713 | 3.9.3        | 3.9.5        |     
         python-aiohttp-jinja2 |  DISTRO  | https://release-monitoring.org/project/21247 | 1.5.1        | 1.6          |     
            python-aiohttp-sse |  DISTRO  | https://release-monitoring.org/project/21251 | 2.1.0        | 2.2.0        |     
              python-aiorwlock |  DISTRO  | https://release-monitoring.org/project/21254 | 1.3.0        | 1.4.0        |     
              python-aiosqlite |  DISTRO  | https://release-monitoring.org/project/54836 | 0.19.0       | 0.20.0       |     
              python-alsaaudio |  DISTRO  | https://release-monitoring.org/project/10072 | 0.10.0       | 0.11.0       |     
        python-annotated-types |  DISTRO  | https://release-monitoring.org/project/257625 | 0.6.0        | 0.7.0        |     
                  python-anyio |  DISTRO  | https://release-monitoring.org/project/49275 | 4.2.0        | 4.4.0        |     
                python-apispec |  DISTRO  | https://release-monitoring.org/project/37849 | 6.3.1        | 6.6.1        |     
                   python-argh |  DISTRO  | https://release-monitoring.org/project/09299 | 0.31.0       | 0.31.2       |     
                python-asgiref |  DISTRO  | https://release-monitoring.org/project/18462 | 3.7.2        | 3.8.1        |     
                  python-babel |  DISTRO  | https://release-monitoring.org/project/11984 | 2.14.0       | 2.15.0       |     
                 python-bcrypt |  DISTRO  | https://release-monitoring.org/project/09047 | 4.0.1        | 4.1.3        |     
         python-beautifulsoup4 |  DISTRO  | https://release-monitoring.org/project/03779 | 4.12.2       | 4.12.3       |     
                 python-bidict |  DISTRO  | https://release-monitoring.org/project/114352 | 0.22.1       | 0.23.1       |     
              python-bitstring |  DISTRO  | https://release-monitoring.org/project/14665 | 4.1.4        | 4.2.3        |     
                  python-bleak |  DISTRO  | https://release-monitoring.org/project/26271 | 0.21.1       | 0.22.2       |     
                python-blinker |  DISTRO  | https://release-monitoring.org/project/20042 | 1.7.0        | 1.8.2        |     
               python-bluezero |  DISTRO  | https://release-monitoring.org/project/21929 | 0.8.0        | 0.9.0        |     
                  python-boto3 |  DISTRO  | https://release-monitoring.org/project/29737 | 1.34.14      | 1.34.127     |     
               python-botocore |  DISTRO  | https://release-monitoring.org/project/08748 | 1.34.14      | 1.34.127     |     
             python-cachetools |  DISTRO  | https://release-monitoring.org/project/07022 | 5.3.2        | 5.3.3        |     
                    python-can |  DISTRO  | https://release-monitoring.org/project/17873 | 4.3.1        | 4.4.0        |     
                python-canopen |  DISTRO  | https://release-monitoring.org/project/23230 | 2.2.0        | 2.3.0        |     
                  python-cbor2 |  DISTRO  | https://release-monitoring.org/project/64102 | 5.5.1        | 5.6.4        |     
               python-cchardet |  DISTRO  | https://release-monitoring.org/project/14813 | 2.1.7        | 2.2.0a2      |     
                python-certifi |  DISTRO  | https://release-monitoring.org/project/07995 | 2023.11.17   | 2024.6.2     |     
               python-channels |  DISTRO  | https://release-monitoring.org/project/21937 | 4.0.0        | 4.1.0        |     
         python-channels-redis |  DISTRO  | https://release-monitoring.org/project/21936 | 4.1.0        | 4.2.0        |     
                python-cheroot |  DISTRO  | https://release-monitoring.org/project/20163 | 10.0.0       | 11.0.0b3     |     
               python-cherrypy |  DISTRO  | https://release-monitoring.org/project/03799 | 18.8.0       | 18.10.0      |     
               python-colorlog |  DISTRO  | https://release-monitoring.org/project/12509 | 6.8.0        | 6.8.2        |     
         python-configshell-fb |  DISTRO  | https://release-monitoring.org/project/19734 | 1.1.30       | 1.5          |     
              python-contourpy |  DISTRO  | https://release-monitoring.org/project/244705 | 1.1.0        | 1.2.1        |     
                python-crontab |  DISTRO  | https://release-monitoring.org/project/31282 | 3.0.0        | 3.1.0        |     
           python-cryptography |  DISTRO  | https://release-monitoring.org/project/05532 | 39.0.2       | 42.0.8       |     
               python-cssutils |  DISTRO  | https://release-monitoring.org/project/13259 | 2.9.0        | 2.11.1       |     
                 python-cython |  DISTRO  | https://release-monitoring.org/project/12679 | 0.29.36      | 3.0.10       |     
                 python-daphne |  DISTRO  | https://release-monitoring.org/project/21939 | 4.0.0        | 4.1.2        |     
               python-dateutil |  DISTRO  | https://release-monitoring.org/project/05621 | 2.8.2        | 2.9.0.post0  |     
              python-dbus-fast |  DISTRO  | https://release-monitoring.org/project/287975 | 2.12.0       | 2.21.3       |     
                 python-django |  DISTRO  | https://release-monitoring.org/project/03828 | 5.0.3        | 5.0.6        |     
              python-dnspython |  DISTRO  | https://release-monitoring.org/project/13190 | 2.4.2        | 2.6.1        |     
                 python-docker |  DISTRO  | https://release-monitoring.org/project/03847 | 6.1.3        | 7.1.0        |     
               python-docutils |  DISTRO  | https://release-monitoring.org/project/03849 | 0.20.1       | 0.21.2       |     
               python-dtschema |  DISTRO  | https://release-monitoring.org/project/100908 | 2023.11      | 2024.5       |     
                  python-ecdsa |  DISTRO  | https://release-monitoring.org/project/08370 | 0.18.0       | 0.19.0       |     
        python-email-validator |  DISTRO  | https://release-monitoring.org/project/98134 | 2.1.1        | 2.1.2        |     
               python-engineio |  DISTRO  | https://release-monitoring.org/project/15064 | 4.8.2        | 4.9.1        |     
                  python-evdev |  DISTRO  | https://release-monitoring.org/project/62869 | 1.6.1        | 1.7.1        |     
                python-fastapi |  DISTRO  | https://release-monitoring.org/project/47977 | 0.110.0      | 0.111.0      |     
                 python-fastui |  DISTRO  | https://release-monitoring.org/project/372329 | 0.5.2        | 0.6.0        |     
               python-filelock |  DISTRO  | https://release-monitoring.org/project/11739 | 3.13.1       | 3.15.1       |     
                   python-fire |  DISTRO  | https://release-monitoring.org/project/21700 | 0.5.0        | 0.6.0        |     
                  python-flask |  DISTRO  | https://release-monitoring.org/project/03867 | 3.0.0        | 3.0.3        |     
             python-flask-cors |  DISTRO  | https://release-monitoring.org/project/19867 | 4.0.0        | 4.0.1        |     
          python-flask-jsonrpc |  DISTRO  | https://release-monitoring.org/project/21698 | 2.2.2        | 3.0.1        |     
          python-flask-smorest |  DISTRO  | https://release-monitoring.org/project/25028 | 0.42.3       | 0.44.0       |     
            python-flatbuffers |  DISTRO  | https://release-monitoring.org/project/85010 | 2.0.7        | 24.3.25      |     
              python-fonttools |  DISTRO  | https://release-monitoring.org/project/07388 | 4.47.0       | 4.53.0       |     
                 python-future |  DISTRO  | https://release-monitoring.org/project/26845 | 0.18.3       | 1.0.0        |     
                    python-git |  DISTRO  | https://release-monitoring.org/project/06459 | 3.1.40       | 3.1.43       |     
                python-glslang |  DISTRO  | https://release-monitoring.org/project/205796 | 11.13.0      | 14.2.0       |     
                python-gobject |  DISTRO  | https://release-monitoring.org/project/13158 | 3.42.2       | 3.48.2       |     
        python-google-api-core |  DISTRO  | https://release-monitoring.org/project/25386 | 2.15.0       | 2.19.0       |     
            python-google-auth |  DISTRO  | https://release-monitoring.org/project/38039 | 2.26.1       | 2.30.0       |     
python-googleapis-common-pr... |  DISTRO  | https://release-monitoring.org/project/63943 | 1.62.0       | 1.63.1       |     
               python-gpiozero |  DISTRO  | https://release-monitoring.org/project/19948 | 2.0          | 2.0.1        |     
          python-grpc-requests |  DISTRO  | https://release-monitoring.org/project/132701 | 0.1.13       | 0.1.18       |     
                 python-grpcio |  DISTRO  | https://release-monitoring.org/project/18429 | 1.60.0       | 1.64.1       |     
      python-grpcio-reflection |  DISTRO  | https://release-monitoring.org/project/30542 | 1.60.0       | 1.64.1       |     
               python-gunicorn |  DISTRO  | https://release-monitoring.org/project/03882 | 21.2.0       | 22.0.0       |     
              python-hatchling |  DISTRO  | https://release-monitoring.org/project/185085 | 1.22.4       | 1.24.2       |     
               python-httpcore |  DISTRO  | https://release-monitoring.org/project/79947 | 1.0.2        | 1.0.5        |     
                  python-httpx |  DISTRO  | https://release-monitoring.org/project/27210 | 0.26.0       | 0.27.0       |     
               python-humanize |  DISTRO  | https://release-monitoring.org/project/19799 | 4.4.0        | 4.9.0        |     
                 python-hwdata |  DISTRO  | https://release-monitoring.org/project/11771 | 2.4.1        | 2.4.1-1      |     
                   python-idna |  DISTRO  | https://release-monitoring.org/project/05487 | 3.6          | 3.7          |     
               python-influxdb |  DISTRO  | https://release-monitoring.org/project/12696 | 5.3.1        | 5.3.2        |     
                python-ipython |  DISTRO  | https://release-monitoring.org/project/01399 | 8.20.0       | 8.25.0       |     
           python-itsdangerous |  DISTRO  | https://release-monitoring.org/project/03892 | 2.1.2        | 2.2.0        |     
                  python-iwlib |  DISTRO  | https://release-monitoring.org/project/51611 | 1.5          | 1.7.0        |     
         python-jaraco-classes |  DISTRO  | https://release-monitoring.org/project/20150 | 3.3.0        | 3.4.0        |     
       python-jaraco-functools |  DISTRO  | https://release-monitoring.org/project/20165 | 4.0.0        | 4.0.1        |     
                     python-jc |  DISTRO  | https://release-monitoring.org/project/28963 | 1.25.2       | 1.25.3       |     
                 python-jinja2 |  DISTRO  | https://release-monitoring.org/project/03894 | 3.1.2        | 3.1.4        |     
             python-jsonschema |  DISTRO  | https://release-monitoring.org/project/03898 | 4.20.0       | 4.22.0       |     
                python-keyring |  DISTRO  | https://release-monitoring.org/project/03901 | 24.2.0       | 25.2.1       |     
                   python-lark |  DISTRO  | https://release-monitoring.org/project/140595 | 1.1.8        | 1.1.9        |     
               python-m2crypto |  DISTRO  | https://release-monitoring.org/project/06599 | 0.40.1       | 0.41.0       |     
         python-magic-wormhole |  DISTRO  | https://release-monitoring.org/project/17278 | 0.13.0       | 0.14.0       |     
                   python-mako |  DISTRO  | https://release-monitoring.org/project/03915 | 1.3.0        | 1.3.5        |     
               python-markdown |  DISTRO  | https://release-monitoring.org/project/03916 | 3.5.1        | 3.6          |     
              python-markdown2 |  DISTRO  | https://release-monitoring.org/project/03917 | 2.4.12       | 2.4.13       |     
             python-markupsafe |  DISTRO  | https://release-monitoring.org/project/03918 | 2.1.3        | 2.1.5        |     
            python-marshmallow |  DISTRO  | https://release-monitoring.org/project/08079 | 3.20.1       | 3.21.3       |     
 python-marshmallow-sqlalchemy |  DISTRO  | https://release-monitoring.org/project/50566 | 0.30.0       | 1.0.0        |     
             python-matplotlib |  DISTRO  | https://release-monitoring.org/project/03919 | 3.8.2        | 3.9.0        |     
      python-matplotlib-inline |  GUESS   | https://release-monitoring.org/project/198324 | 0.1.6        | 0.1.7        |     
                python-maturin |  DISTRO  | https://release-monitoring.org/project/42653 | 1.4.0        | 1.6.0        |     
           python-meson-python |  DISTRO  | https://release-monitoring.org/project/248985 | 0.15.0       | 0.16.0       |     
              python-ml-dtypes |  DISTRO  | https://release-monitoring.org/project/330555 | 0.3.2        | 0.4.0b1      |     
         python-more-itertools |  DISTRO  | https://release-monitoring.org/project/12201 | 10.2.0       | 10.3.0       |     
                python-msgpack |  DISTRO  | https://release-monitoring.org/project/21831 | 1.0.7        | 1.0.8        |     
              python-multidict |  DISTRO  | https://release-monitoring.org/project/11132 | 6.0.4        | 6.0.5        |     
              python-multipart |  DISTRO  | https://release-monitoring.org/project/18463 | 0.0.6        | 0.0.9        |     
                python-netaddr |  DISTRO  | https://release-monitoring.org/project/05586 | 0.10.1       | 1.3.0        |     
               python-networkx |  DISTRO  | https://release-monitoring.org/project/07791 | 3.2.1        | 3.3          |     
                  python-numpy |  DISTRO  | https://release-monitoring.org/project/02509 | 1.25.0       | 2.0.0b1      |     
          python-opcua-asyncio |  DISTRO  | https://release-monitoring.org/project/131612 | 1.0.5        | 1.05a1       |     
                 python-orjson |  DISTRO  | https://release-monitoring.org/project/31737 | 3.9.10       | 3.10.5       |     
              python-packaging |  DISTRO  | https://release-monitoring.org/project/11718 | 24.0         | 24.1         |     
              python-paho-mqtt |  DISTRO  | https://release-monitoring.org/project/06084 | 1.6.1        | 2.1.0        |     
                  python-parso |  DISTRO  | https://release-monitoring.org/project/16689 | 0.8.3        | 0.8.4        |     
                    python-pip |  DISTRO  | https://release-monitoring.org/project/06529 | 23.3.2       | 24.1b2       |     
                 python-pluggy |  DISTRO  | https://release-monitoring.org/project/07500 | 1.4.0        | 1.5.0        |     
         python-prompt-toolkit |  DISTRO  | https://release-monitoring.org/project/08742 | 3.0.43       | 3.0.47       |     
               python-protobuf |  DISTRO  | https://release-monitoring.org/project/03715 | 21.12        | 27.1         |     
                 python-psutil |  DISTRO  | https://release-monitoring.org/project/03978 | 5.9.7        | 5.9.8        |     
                 python-pyalsa |  DISTRO  | https://release-monitoring.org/project/03767 | 1.2.7        | 1.2.12       |     
         python-pyasn1-modules |  DISTRO  | https://release-monitoring.org/project/11987 | 0.3.0        | 0.4.0        |     
                 python-pybind |  DISTRO  | https://release-monitoring.org/project/13384 | 2.11.1       | 2.12.0       |     
                python-pycairo |  DISTRO  | https://release-monitoring.org/project/13166 | 1.25.1       | 1.26.0       |     
              python-pycparser |  DISTRO  | https://release-monitoring.org/project/08175 | 2.21         | 2.22         |     
                python-pycrate |  DISTRO  | https://release-monitoring.org/project/185106 | 0.7.2        | 0.7.5        |     
          python-pycryptodomex |  DISTRO  | https://release-monitoring.org/project/36851 | 3.19.1       | 3.20.0       |     
                 python-pycups |  DISTRO  | https://release-monitoring.org/project/07975 | 2.0.1        | 2.0.4        |     
                  python-pydal |  DISTRO  | https://release-monitoring.org/project/21582 | 20231114.3   | 20240601.3   |     
               python-pydantic |  DISTRO  | https://release-monitoring.org/project/29768 | 2.5.3        | 2.7.4        |     
          python-pydantic-core |  DISTRO  | https://release-monitoring.org/project/273695 | 2.14.6       | 2.19.0       |     
                  python-pydyf |  DISTRO  | https://release-monitoring.org/project/179112 | 0.8.0        | 0.10.0       |     
             python-pyelftools |  DISTRO  | https://release-monitoring.org/project/16219 | 0.30         | 0.31         |     
               python-pygments |  DISTRO  | https://release-monitoring.org/project/03986 | 2.17.2       | 2.18.0       |     
                  python-pyicu |  DISTRO  | https://release-monitoring.org/project/12004 | 2.12         | 2.13.1       |     
              python-pylibftdi |  DISTRO  | https://release-monitoring.org/project/21583 | 0.21.0       | 0.22.0       |     
                python-pymupdf |  DISTRO  | https://release-monitoring.org/project/17320 | 1.22.0       | 1.24.5       |     
                python-pymysql |  DISTRO  | https://release-monitoring.org/project/07284 | 1.1.0        | 1.1.1        |     
              python-pyopenssl |  DISTRO  | https://release-monitoring.org/project/05535 | 23.3.0       | 24.1.0       |     
             python-pypa-build |  DISTRO  | https://release-monitoring.org/project/132276 | 1.0.3        | 1.2.1        |     
              python-pyparsing |  DISTRO  | https://release-monitoring.org/project/03756 | 3.1.1        | 3.1.2        |     
               python-pyparted |  DISTRO  | https://release-monitoring.org/project/15558 | 3.12.0       | 3.13.0       |     
                 python-pyphen |  DISTRO  | https://release-monitoring.org/project/19681 | 0.14.0       | 0.15.0       |     
        python-pyproject-hooks |  DISTRO  | https://release-monitoring.org/project/320474 | 1.0.0        | 1.1.0        |     
     python-pyproject-metadata |  DISTRO  | https://release-monitoring.org/project/255630 | 0.7.1        | 0.8.0        |     
                  python-pyqt5 |  DISTRO  | https://release-monitoring.org/project/20104 | 5.15.6       | 5.15.10      |     
               python-pyroute2 |  DISTRO  | https://release-monitoring.org/project/20081 | 0.7.10       | 0.7.12       |     
                  python-pysmb |  DISTRO  | https://release-monitoring.org/project/21589 | 1.2.9        | 1.2.9.1      |     
               python-pyspnego |  DISTRO  | https://release-monitoring.org/project/107092 | 0.10.2       | 0.11.0       |     
          python-pytablereader |  DISTRO  | https://release-monitoring.org/project/21592 | 0.31.3       | 0.31.4       |     
                 python-pytest |  DISTRO  | https://release-monitoring.org/project/03765 | 8.1.1        | 8.2.2        |     
         python-pytest-asyncio |  DISTRO  | https://release-monitoring.org/project/07273 | 0.23.6       | 0.23.7       |     
                python-pythran |  DISTRO  | https://release-monitoring.org/project/21140 | 0.15.0       | 0.16.1       |     
                 python-pyudev |  DISTRO  | https://release-monitoring.org/project/08485 | 0.24.1       | 0.24.3       |     
                  python-pyzmq |  DISTRO  | https://release-monitoring.org/project/04104 | 25.1.2       | 26.0.3       |     
                  python-redis |  DISTRO  | https://release-monitoring.org/project/03992 | 5.0.1        | 5.0.6        |     
               python-reedsolo |  DISTRO  | https://release-monitoring.org/project/81160 | 1.7.0        | 2.0.13       |     
            python-referencing |  DISTRO  | https://release-monitoring.org/project/304263 | 0.32.1       | 0.35.1       |     
                  python-regex |  DISTRO  | https://release-monitoring.org/project/05548 | 2023.12.25   | 2024.5.15    |     
               python-requests |  DISTRO  | https://release-monitoring.org/project/04004 | 2.31.0       | 2.32.3       |     
      python-requests-oauthlib |  DISTRO  | https://release-monitoring.org/project/11803 | 1.3.1        | 2.0.0        |     
              python-rtslib-fb |  DISTRO  | https://release-monitoring.org/project/19641 | 2.1.76       | 2.2          |     
            python-ruamel-yaml |  DISTRO  | https://release-monitoring.org/project/66067 | 0.17.21      | 0.18.6       |     
             python-s3transfer |  DISTRO  | https://release-monitoring.org/project/10428 | 0.10.0       | 0.10.1       |     
               python-schedule |  DISTRO  | https://release-monitoring.org/project/21600 | 1.2.1        | 1.2.2        |     
                  python-scipy |  DISTRO  | https://release-monitoring.org/project/04768 | 1.11.4       | 1.13.1       |     
                  python-segno |  DISTRO  | https://release-monitoring.org/project/59641 | 1.6.0        | 1.6.1        |     
               python-selenium |  DISTRO  | https://release-monitoring.org/project/05645 | 4.16.0       | 4.21.0       |     
             python-sentry-sdk |  DISTRO  | https://release-monitoring.org/project/21603 | 1.39.2       | 2.5.1        |     
       python-service-identity |  DISTRO  | https://release-monitoring.org/project/07917 | 23.1.0       | 24.1.0       |     
             python-setuptools |  DISTRO  | https://release-monitoring.org/project/04021 | 69.2.0       | 70.0.0       |     
        python-setuptools-rust |  DISTRO  | https://release-monitoring.org/project/122284 | 1.8.1        | 1.9.0        |     
         python-setuptools-scm |  DISTRO  | https://release-monitoring.org/project/07874 | 8.0.4        | 8.1.0        |     
                     python-sh |  DISTRO  | https://release-monitoring.org/project/10429 | 2.0.6        | 2.0.7        |     
                    python-sip |  DISTRO  | https://release-monitoring.org/project/13626 | 4.19.25      | 6.8.3        |     
            python-smbprotocol |  DISTRO  | https://release-monitoring.org/project/47981 | 1.12.0       | 1.13.0       |     
                 python-smmap2 |  DISTRO  | https://release-monitoring.org/project/12729 | 5.0.0        | 6.0.0        |     
                 python-snappy |  DISTRO  | https://release-monitoring.org/project/07203 | 0.6.1        | 0.7.1        |     
                python-sniffio |  DISTRO  | https://release-monitoring.org/project/18170 | 1.3.0        | 1.3.1        |     
               python-socketio |  DISTRO  | https://release-monitoring.org/project/21611 | 5.11.0       | 5.11.2       |     
                 python-sockjs |  DISTRO  | https://release-monitoring.org/project/56562 | 0.11.0       | 0.13.0       |     
               python-sqlparse |  DISTRO  | https://release-monitoring.org/project/04038 | 0.4.4        | 0.5.0        |     
              python-starlette |  DISTRO  | https://release-monitoring.org/project/36570 | 0.36.3       | 0.37.2       |     
                  python-sympy |  DISTRO  | https://release-monitoring.org/project/04923 | 1.12         | 1.12.1       |     
               python-tcolorpy |  DISTRO  | https://release-monitoring.org/project/97274 | 0.1.4        | 0.1.6        |     
                python-tempora |  DISTRO  | https://release-monitoring.org/project/21225 | 5.5.0        | 5.5.1        |     
              python-texttable |  DISTRO  | https://release-monitoring.org/project/11635 | 1.6.7        | 1.7.0        |     
                 python-thrift |  DISTRO  | https://release-monitoring.org/project/21614 | 0.16.0       | 0.20.0       |     
               python-tinycss2 |  DISTRO  | https://release-monitoring.org/project/16655 | 1.2.1        | 1.3.0        |     
                python-tinyrpc |  DISTRO  | https://release-monitoring.org/project/12824 | 1.1.4        | 1.1.7        |     
                python-tornado |  DISTRO  | https://release-monitoring.org/project/07498 | 6.2          | 6.4.1        |     
                   python-tqdm |  DISTRO  | https://release-monitoring.org/project/11524 | 4.64.1       | 4.66.4       |     
              python-traitlets |  DISTRO  | https://release-monitoring.org/project/12211 | 5.8.0        | 5.14.3       |     
                   python-treq |  DISTRO  | https://release-monitoring.org/project/19614 | 22.2.0       | 23.11.0      |     
                   python-trio |  DISTRO  | https://release-monitoring.org/project/17451 | 0.22.0       | 0.25.1       |     
         python-trio-websocket |  DISTRO  | https://release-monitoring.org/project/136283 | 0.9.2        | 0.11.1       |     
      python-trove-classifiers |  DISTRO  | https://release-monitoring.org/project/88298 | 2024.3.3     | 2024.5.22    |     
                python-twisted |  DISTRO  | https://release-monitoring.org/project/04071 | 22.10.0      | 24.3.0       |     
               python-txtorcon |  DISTRO  | https://release-monitoring.org/project/19661 | 22.0.0       | 23.11.0      |     
              python-typeguard |  DISTRO  | https://release-monitoring.org/project/38819 | 2.13.3       | 4.3.0        |     
                 python-typepy |  DISTRO  | https://release-monitoring.org/project/21617 | 1.3.0        | 1.3.2        |     
  python-types-python-dateutil |  DISTRO  | https://release-monitoring.org/project/147859 | 2.8.19.14    | 2.9.0.202... |     
      python-typing-extensions |  DISTRO  | https://release-monitoring.org/project/19755 | 4.9.0        | 4.12.2       |     
         python-typing-inspect |  DISTRO  | https://release-monitoring.org/project/209826 | 0.8.0        | 0.9.0        |     
              python-u-msgpack |  DISTRO  | https://release-monitoring.org/project/19764 | 2.7.2        | 2.8.0        |     
                  python-ujson |  DISTRO  | https://release-monitoring.org/project/04076 | 5.7.0        | 5.10.0       |     
                python-urllib3 |  DISTRO  | https://release-monitoring.org/project/04078 | 2.0.7        | 2.2.1        |     
                  python-urwid |  DISTRO  | https://release-monitoring.org/project/04079 | 2.6.10       | 2.6.14       |     
         python-urwid-readline |  DISTRO  | https://release-monitoring.org/project/84198 | 0.13         | 0.14         |     
                python-uvicorn |  DISTRO  | https://release-monitoring.org/project/28526 | 0.29.0       | 0.30.1       |     
             python-validators |  DISTRO  | https://release-monitoring.org/project/19818 | 0.22.0       | 0.28.3       |     
               python-watchdog |  DISTRO  | https://release-monitoring.org/project/05341 | 2.2.1        | 4.0.1        |     
                python-wcwidth |  DISTRO  | https://release-monitoring.org/project/08743 | 0.2.5        | 0.2.13       |     
             python-weasyprint |  DISTRO  | https://release-monitoring.org/project/11057 | 59.0         | 62.2         |     
                 python-web2py |  DISTRO  | https://release-monitoring.org/project/20617 | 2.26.1       | 2.27.1       |     
                python-webargs |  DISTRO  | https://release-monitoring.org/project/24711 | 8.2.0        | 8.4.0        |     
       python-websocket-client |  DISTRO  | https://release-monitoring.org/project/07288 | 1.4.2        | 1.8.0        |     
             python-websockets |  DISTRO  | https://release-monitoring.org/project/08100 | 10.4         | 12.0         |     
               python-werkzeug |  DISTRO  | https://release-monitoring.org/project/04092 | 2.3.8        | 3.0.3        |     
                  python-wheel |  DISTRO  | https://release-monitoring.org/project/11428 | 0.40.0       | 0.43.0       |     
                  python-wrapt |  DISTRO  | https://release-monitoring.org/project/06108 | 1.14.1       | 1.16.0       |     
                python-wtforms |  DISTRO  | https://release-monitoring.org/project/11805 | 3.0.1        | 3.1.2        |     
                   python-xlib |  DISTRO  | https://release-monitoring.org/project/12180 | 0.32         | 0.33         |     
             python-xlsxwriter |  DISTRO  | https://release-monitoring.org/project/12031 | 3.0.6        | 3.2.0        |     
                   python-yarl |  DISTRO  | https://release-monitoring.org/project/12895 | 1.9.2        | 1.9.4        |     
                   python-yatl |  DISTRO  | https://release-monitoring.org/project/50636 | 20220907.1   | 20230507.3   |     
            python-zc-lockfile |  DISTRO  | https://release-monitoring.org/project/04100 | 2.0          | 3.0.post1    |     
               python-zeroconf |  DISTRO  | https://release-monitoring.org/project/12681 | 0.39.4       | 0.132.2      |     
                  python-zlmdb |  DISTRO  | https://release-monitoring.org/project/66674 | 22.6.1       | 23.1.1       |     
         python-zope-interface |  DISTRO  | https://release-monitoring.org/project/04112 | 5.5.2        | 6.4.post2    |     
                 python-zopfli |  DISTRO  | https://release-monitoring.org/project/50016 | 0.2.2        | 0.2.3        |     
                       python3 |  DISTRO  | https://release-monitoring.org/project/13254 | 3.11.8       | 3.12.4       |     
                    qbee-agent |  DISTRO  | https://release-monitoring.org/project/372328 | 2024.09      | 2024.23      |     
          qcom-db410c-firmware |  DISTRO  | https://release-monitoring.org/project/235382 | 1034.2.1     | 1036.1       |     
                          qemu |  DISTRO  | https://release-monitoring.org/project/13607 | 9.0.0        | 9.0.1        |     
                         qlibc |  DISTRO  | https://release-monitoring.org/project/21737 | 2.4.7        | 2.5.0        | ORPH
                          qpdf |  DISTRO  | https://release-monitoring.org/project/05542 | 10.5.0       | 11.9.1       |     
                   qpid-proton |  DISTRO  | https://release-monitoring.org/project/15198 | 0.35.0       | 0.39.0       |     
                       qt5coap |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.7.1        |     
                        qt5knx |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.7.1        |     
                       qt5mqtt |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.7.1        |     
                      qt5opcua |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.7.1        |     
                  qt5webengine |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.11      | 6.7.1        |     
                       qt6base |  DISTRO  | https://release-monitoring.org/project/07927 | 6.4.3        | 6.7.1        |     
                qt6core5compat |  DISTRO  | https://release-monitoring.org/project/07927 | 6.4.3        | 6.7.1        |     
                  qt6serialbus |  DISTRO  | https://release-monitoring.org/project/07927 | 6.4.3        | 6.7.1        |     
                 qt6serialport |  DISTRO  | https://release-monitoring.org/project/07927 | 6.4.3        | 6.7.1        |     
                        qt6svg |  DISTRO  | https://release-monitoring.org/project/07927 | 6.4.3        | 6.7.1        |     
                           qwt |  DISTRO  | https://release-monitoring.org/project/04147 | 6.1.6        | 6.3.0        | ORPH
                    rabbitmq-c |  DISTRO  | https://release-monitoring.org/project/13768 | 0.13.0       | 0.14.0       |     
                         ragel |  DISTRO  | https://release-monitoring.org/project/12105 | 6.10         | 7.0.4        | ORPH
           raspberrypi-usbboot |  DISTRO  | https://release-monitoring.org/project/115700 | 2021.07.01   | 20221215-... | ORPH
                     rdma-core |  DISTRO  | https://release-monitoring.org/project/12907 | 51.0         | 52.0         |     
                           re2 |  DISTRO  | https://release-monitoring.org/project/10500 | 2024-04-01   | 2024-06-01   |     
                         redis |  DISTRO  | https://release-monitoring.org/project/04181 | 7.2.4        | 7.2.5        |     
                     refpolicy |  DISTRO  | https://release-monitoring.org/project/21663 | 2.20231002   | 2.20240226   |     
                        reproc |  DISTRO  | https://release-monitoring.org/project/151400 | 14.2.4       | 14.2.5       |     
                   restorecond |  DISTRO  | https://release-monitoring.org/project/16520 | 3.6          | 20200710     | ORPH
              riemann-c-client |  DISTRO  | https://release-monitoring.org/project/21389 | 1.10.5       | 2.0.1        | ORPH
                       rocksdb |  DISTRO  | https://release-monitoring.org/project/15560 | 6.20.3       | 9.2.1        |     
                      rp-pppoe |  DISTRO  | https://release-monitoring.org/project/04209 | 3.15         | 4.0          | ORPH
                       rsyslog |  DISTRO  | https://release-monitoring.org/project/04218 | 8.2402.0     | 8.2404.0     |     
                      rt-tests |  DISTRO  | https://release-monitoring.org/project/59450 | 2.6          | 2.7          |     
                          rtty |  DISTRO  | https://release-monitoring.org/project/87994 | 8.1.0        | 8.1.2        |     
                          ruby |  DISTRO  | https://release-monitoring.org/project/04223 | 3.3.1        | 3.3.3        |     
                          runc |  DISTRO  | https://release-monitoring.org/project/07462 | 1.1.12       | 1.1.13       |     
                          rust |  DISTRO  | https://release-monitoring.org/project/07635 | 1.74.1       | 1.79.0       |     
                      rust-bin |  DISTRO  | https://release-monitoring.org/project/07635 | 1.74.1       | 1.79.0       |     
                  rust-bindgen |  DISTRO  | https://release-monitoring.org/project/17910 | 0.65.1       | 0.69.4       | ORPH
                         rygel |  DISTRO  | https://release-monitoring.org/project/04751 | 0.42.5       | 0.42.6       |     
                    s390-tools |  DISTRO  | https://release-monitoring.org/project/10714 | 2.32.0       | 2.33.1       |     
                            s6 |  DISTRO  | https://release-monitoring.org/project/05485 | 2.12.0.4     | 2.13.0.0     |     
                        s6-dns |  DISTRO  | https://release-monitoring.org/project/16547 | 2.3.7.1      | 2.3.7.2      |     
                 s6-networking |  DISTRO  | https://release-monitoring.org/project/16550 | 2.7.0.2      | 2.7.0.3      |     
                         s6-rc |  DISTRO  | https://release-monitoring.org/project/16548 | 0.5.4.2      | 0.5.4.3      |     
                      safeclib |  DISTRO  | https://release-monitoring.org/project/21385 | 3.7.1        | 08032024     |     
                        samba4 |  DISTRO  | https://release-monitoring.org/project/04758 | 4.19.6       | 4.20.1       |     
                 sane-backends |  DISTRO  | https://release-monitoring.org/project/04760 | 1.1.1        | 1.3.1        |     
                    sdl2_mixer |  DISTRO  | https://release-monitoring.org/project/04782 | 2.6.3        | 2.8.0        | ORPH
                       sdl_gfx |  DISTRO  | https://release-monitoring.org/project/04778 | 2.0.23       | 2.0.27       | ORPH
                     sdl_sound |  DISTRO  | https://release-monitoring.org/project/10262 | 1.0.3        | 2.0.2        | ORPH
                        sdparm |  DISTRO  | https://release-monitoring.org/project/04787 | 1.10         | 1.12         |     
                       sedutil |  DISTRO  | https://release-monitoring.org/project/15203 | 1.20.0       | 1.49.1       |     
                    sentry-cli |  DISTRO  | https://release-monitoring.org/project/135642 | 2.20.3       | 2.32.1       |     
                 sentry-native |  DISTRO  | https://release-monitoring.org/project/135639 | 0.4.1        | 0.7.6        |     
                       ser2net |  DISTRO  | https://release-monitoring.org/project/21655 | 4.3.8        | 4.6.2        |     
                          serd |  DISTRO  | https://release-monitoring.org/project/230531 | 0.30.14      | 0.32.2       |     
                       setools |  DISTRO  | https://release-monitoring.org/project/08951 | 4.4.4        | 4.5.1        | ORPH
                        shadow |  DISTRO  | https://release-monitoring.org/project/04802 | 4.14.5       | 4.15.1       |     
                shairport-sync |  DISTRO  | https://release-monitoring.org/project/21384 | 3.3.9        | 4.3.3        | ORPH
              shared-mime-info |  DISTRO  | https://release-monitoring.org/project/05524 | 1.12         | 2.4          | ORPH
              signal-estimator |  DISTRO  | https://release-monitoring.org/project/284559 | v0.0.4       | 0.0.9        | ORPH
                   simple-mail |  DISTRO  | https://release-monitoring.org/project/53352 | 2.3.0        | 3.0.0        |     
                      sispmctl |  DISTRO  | https://release-monitoring.org/project/21653 | 4.11         | 4.12         |     
                       skalibs |  DISTRO  | https://release-monitoring.org/project/05486 | 2.14.1.1     | 2.14.2.0     |     
                         slirp |  DISTRO  | https://release-monitoring.org/project/96796 | 4.7.0        | 4.8.0        |     
                   slirp4netns |  DISTRO  | https://release-monitoring.org/project/96795 | 1.2.3        | 1.3.1        |     
                 smartmontools |  DISTRO  | https://release-monitoring.org/project/04835 | 7.3          | 7.4          | ORPH
                        snappy |  DISTRO  | https://release-monitoring.org/project/04844 | 1.1.10       | 1.2.1        |     
                        sngrep |  DISTRO  | https://release-monitoring.org/project/17075 | 1.7.0        | 1.8.1        | ORPH
                        snmppp |  DISTRO  | https://release-monitoring.org/project/21318 | 3.5.1        | 3.5.2        |     
                        snort3 |  DISTRO  | https://release-monitoring.org/project/13263 | 3.1.40.0     | 3.2.2.0      |     
                     softether |  DISTRO  | https://release-monitoring.org/project/21383 | 4.30-9700... | 4.42-9798... | ORPH
                          sord |  DISTRO  | https://release-monitoring.org/project/230536 | 0.16.12      | 0.16.16      |     
       sound-theme-freedesktop |  DISTRO  | https://release-monitoring.org/project/10152 | 0.7          | 0.8          |     
                       spandsp |  DISTRO  | https://release-monitoring.org/project/12600 | 3.0.0-6ec... | 3.0.0        |     
                    spawn-fcgi |  DISTRO  | https://release-monitoring.org/project/05388 | 1.6.4        | 1.6.5        | ORPH
                    sphinxbase |  DISTRO  | https://release-monitoring.org/project/20548 | 5prealpha    | 0.8          |     
                         spice |  DISTRO  | https://release-monitoring.org/project/04871 | 0.15.0       | 0.15.2       |     
                     sqlcipher |  DISTRO  | https://release-monitoring.org/project/11213 | 4.5.5        | 4.6.0        |     
                        sqlite |  DISTRO  | https://release-monitoring.org/project/04877 | 3.45.1       | 3.46.0       |     
                         squid |  DISTRO  | https://release-monitoring.org/project/04880 | 6.9          | 6.10         | ORPH
                        sratom |  DISTRO  | https://release-monitoring.org/project/14903 | 0.6.14       | 0.6.16       |     
                          sslh |  DISTRO  | https://release-monitoring.org/project/06184 | 2.0.1        | 2.1.2        | ORPH
              starfive-spltool |  DISTRO  | https://release-monitoring.org/project/372234 | JH7110_VF... | JH7110-RT... |     
             start-stop-daemon |  DISTRO  | https://release-monitoring.org/project/08127 | 1.20.7.1     | 1.22.6       | ORPH
                    stellarium |  DISTRO  | https://release-monitoring.org/project/04891 | 23.3         | 24.1         |     
                        strace |  DISTRO  | https://release-monitoring.org/project/04897 | 6.8          | 6.9          |     
                     stress-ng |  DISTRO  | https://release-monitoring.org/project/12538 | 0.17.07      | 0.18.00      |     
                    strongswan |  DISTRO  | https://release-monitoring.org/project/04899 | 5.9.13       | 5.9.14       |     
                       stunnel |  DISTRO  | https://release-monitoring.org/project/04901 | 5.71         | 5.72         |     
                      suricata |  DISTRO  | https://release-monitoring.org/project/10925 | 6.0.19       | 7.0.5        |     
                          sway |  DISTRO  | https://release-monitoring.org/project/11497 | 1.8.1        | 1.9          |     
                        swaybg |  DISTRO  | https://release-monitoring.org/project/20562 | 1.2.0        | 1.2.1        |     
                          swig |  DISTRO  | https://release-monitoring.org/project/04919 | 4.1.1        | 4.2.1        |     
                       synergy |  DISTRO  | https://release-monitoring.org/project/05718 | 2.0.12-beta  | 2.3.2        |     
                        sysdig |  DISTRO  | https://release-monitoring.org/project/16898 | 0.29.3       | 0.37.1       |     
                       sysprof |  DISTRO  | https://release-monitoring.org/project/21649 | 1.2.0        | 46.0         |     
                       sysrepo |  DISTRO  | https://release-monitoring.org/project/34820 | 2.2.150      | 2.2.170      |     
                       systemd |  DISTRO  | https://release-monitoring.org/project/05440 | 254.13       | 256          |     
             systemd-bootchart |  DISTRO  | https://release-monitoring.org/project/11774 | 233          | 235          |     
                        taglib |  DISTRO  | https://release-monitoring.org/project/01982 | 1.13.1       | 2.0.1        |     
                           tbb |  DISTRO  | https://release-monitoring.org/project/08217 | 2021.11.0    | 2021.12.0    |     
                           tcl |  DISTRO  | https://release-monitoring.org/project/04941 | 8.6.13       | 8.6.14       | ORPH
                         tclap |  DISTRO  | https://release-monitoring.org/project/04942 | 1.2.4        | 1.2.5        | ORPH
                   terminology |  DISTRO  | https://release-monitoring.org/project/04951 | 1.12.1       | 1.13.0       |     
                 tesseract-ocr |  DISTRO  | https://release-monitoring.org/project/04954 | 5.3.4        | 5.4.1        |     
                      thermald |  DISTRO  | https://release-monitoring.org/project/14500 | 2.5.6        | 2.5.7        |     
                        thrift |  DISTRO  | https://release-monitoring.org/project/05581 | 0.14.1       | 0.20.0       | ORPH
                   timescaledb |  DISTRO  | https://release-monitoring.org/project/17545 | 2.15.0       | 2.15.2       |     
                      tinifier |  DISTRO  | https://release-monitoring.org/project/241900 | 3.4.0        | 4.1.0        |     
                       tinyxml |  DISTRO  | https://release-monitoring.org/project/10162 | 2.6.2_2      | 2.6.2        | ORPH
                           tio |  DISTRO  | https://release-monitoring.org/project/20587 | 2.7          | 3.4          |     
                            tk |  DISTRO  | https://release-monitoring.org/project/11426 | 8.6.13       | 8.6.14       |     
                   tl-expected |  DISTRO  | https://release-monitoring.org/project/112689 | v1.0.0       | 1.1.0        |     
                          tmux |  DISTRO  | https://release-monitoring.org/project/04980 | 3.3a         | 3.4          |     
                           tor |  DISTRO  | https://release-monitoring.org/project/04991 | 0.4.8.11     | 0.4.8.12     |     
                     tpm-tools |  DISTRO  | https://release-monitoring.org/project/21640 | 1.3.9.1      | 1.3.9.2      |     
                    tpm2-abrmd |  DISTRO  | https://release-monitoring.org/project/16819 | 2.3.3        | 3.0.0        | ORPH
                     tpm2-totp |  DISTRO  | https://release-monitoring.org/project/18790 | 0.2.1        | 0.3.0        |     
                      tpm2-tss |  DISTRO  | https://release-monitoring.org/project/12683 | 3.2.2        | 4.1.3        | ORPH
                    traceroute |  DISTRO  | https://release-monitoring.org/project/14877 | 2.1.3        | 2.1.5        |     
                  transmission |  DISTRO  | https://release-monitoring.org/project/05002 | 4.0.5        | 4.0.6        |     
                   uboot-tools |  DISTRO  | https://release-monitoring.org/project/05022 | 2021.07      | 2024.04      | ORPH
                        uclibc |  DISTRO  | https://release-monitoring.org/project/13815 | 1.0.48       | 1.0.49       |     
                       uftrace |  DISTRO  | https://release-monitoring.org/project/195039 | 0.14         | 0.16         |     
                           uhd |  DISTRO  | https://release-monitoring.org/project/12572 | 4.3.0.0      | 4.6.0.0      |     
                       unbound |  DISTRO  | https://release-monitoring.org/project/05042 | 1.19.1       | 1.20.0       |     
                       unionfs |  DISTRO  | https://release-monitoring.org/project/17617 | 2.1          | 3.4          | ORPH
                      upmpdcli |  DISTRO  | https://release-monitoring.org/project/15848 | 1.5.12       | 1.8.12       | ORPH
                        upower |  DISTRO  | https://release-monitoring.org/project/05056 | 0.99.19      | 1.90.4       |     
                           upx |  DISTRO  | https://release-monitoring.org/project/13737 | 4.2.1        | 4.2.4        |     
                      usbguard |  DISTRO  | https://release-monitoring.org/project/11151 | 1.1.2        | 1.1.3        |     
                      usbredir |  DISTRO  | https://release-monitoring.org/project/16012 | 0.13.0       | 0.14.0       |     
                     ustreamer |  DISTRO  | https://release-monitoring.org/project/314869 | 6.11         | 6.12         |     
                    util-linux |  DISTRO  | https://release-monitoring.org/project/08179 | 2.39.3       | 2.40.1       | ORPH
               util-linux-libs |  DISTRO  | https://release-monitoring.org/project/08179 | 2.39.3       | 2.40.1       | ORPH
                           uuu |  DISTRO  | https://release-monitoring.org/project/259328 | 1.5.181      | 1.5.182      |     
                           uvw |  DISTRO  | https://release-monitoring.org/project/33083 | 3.2.0_lib... | 3.4.0_lib... |     
                  v4l2loopback |  DISTRO  | https://release-monitoring.org/project/10956 | 0.12.7       | 0.13.2       |     
                      valgrind |  DISTRO  | https://release-monitoring.org/project/13639 | 3.22.0       | 3.23.0       | ORPH
                           vdr |  DISTRO  | https://release-monitoring.org/project/05069 | 2.6.5        | 2.6.7        | ORPH
         vdr-plugin-vnsiserver |  DISTRO  | https://release-monitoring.org/project/05080 | 1.8.0        | 1.8.3        | ORPH
                           vim |  DISTRO  | https://release-monitoring.org/project/05092 | 9.1.0145     | 9.1.0494     | ORPH
                   vis-network |  DISTRO  | https://release-monitoring.org/project/270536 | 9.1.0        | 9.1.9        |     
                           vlc |  DISTRO  | https://release-monitoring.org/project/06504 | 3.0.20       | 3.0.21       |     
                        vnstat |  DISTRO  | https://release-monitoring.org/project/07283 | 2.11         | 2.12         |     
                          volk |  DISTRO  | https://release-monitoring.org/project/147733 | 3.0.0        | 3.1.2        |     
                          vpnc |  DISTRO  | https://release-monitoring.org/project/15955 | 0.5.3r550... | 0.5.3        | ORPH
                           vte |  DISTRO  | https://release-monitoring.org/project/10895 | 0.66.2       | 0.76.3       | ORPH
                         vuejs |  DISTRO  | https://release-monitoring.org/project/89353 | 3.4.21       | 3.4.29       |     
                  vuejs-router |  DISTRO  | https://release-monitoring.org/project/234796 | 4.3.0        | 4.3.3        |     
                vulkan-headers |  DISTRO  | https://release-monitoring.org/project/88835 | 1.3.262      | 1.3.288      | ORPH
                 vulkan-loader |  DISTRO  | https://release-monitoring.org/project/230557 | 1.3.262      | 1.3.288      | ORPH
                  vulkan-tools |  DISTRO  | https://release-monitoring.org/project/242111 | 1.3.262      | 1.3.288      | ORPH
                           waf |  DISTRO  | https://release-monitoring.org/project/05116 | 2.0.26       | 2.1.1        |     
                        waffle |  DISTRO  | https://release-monitoring.org/project/21633 | 1.7.0        | 1.8.0        |     
                       wayland |  DISTRO  | https://release-monitoring.org/project/10061 | 1.22.0       | 1.23.0       |     
                     webkitgtk |  DISTRO  | https://release-monitoring.org/project/05355 | 2.42.5       | 2.45.3       |     
                          webp |  DISTRO  | https://release-monitoring.org/project/01761 | 1.3.2        | 1.4.0        |     
                        weston |  DISTRO  | https://release-monitoring.org/project/13745 | 13.0.1       | 13.0.3       |     
                          wget |  DISTRO  | https://release-monitoring.org/project/05124 | 1.21.4       | 1.24.5       |     
                         whois |  DISTRO  | https://release-monitoring.org/project/05128 | 5.5.14       | 5.5.23       |     
                          wine |  DISTRO  | https://release-monitoring.org/project/05134 | 8.0.2        | 9.11         |     
                wireless-regdb |  DISTRO  | https://release-monitoring.org/project/15257 | 2023.09.01   | 2024.05.08   |     
                   wireplumber |  DISTRO  | https://release-monitoring.org/project/235056 | 0.4.8        | 0.5.3        | ORPH
                     wireshark |  DISTRO  | https://release-monitoring.org/project/05137 | 4.0.12       | 4.2.5        | ORPH
                       wlroots |  DISTRO  | https://release-monitoring.org/project/18357 | 0.16.2       | 0.17.3       |     
                       wolftpm |  DISTRO  | https://release-monitoring.org/project/256219 | 3.1.0        | 3.2.0        |     
                       wtfutil |  DISTRO  | https://release-monitoring.org/project/243189 | 0.41.0       | 0.43.0       |     
                          x265 |  DISTRO  | https://release-monitoring.org/project/07275 | 3.5          | 3.6          |     
                        xapian |  DISTRO  | https://release-monitoring.org/project/15919 | 1.4.24       | 1.4.25       |     
                   xapp_bitmap |  DISTRO  | https://release-monitoring.org/project/00191 | 1.1.0        | 1.1.1        | ORPH
                  xapp_editres |  DISTRO  | https://release-monitoring.org/project/17160 | 1.0.8        | 1.0.9        | ORPH
               xapp_fonttosfnt |  DISTRO  | https://release-monitoring.org/project/21723 | 1.2.2        | 1.2.3        | ORPH
                  xapp_iceauth |  DISTRO  | https://release-monitoring.org/project/15048 | 1.0.9        | 1.0.10       | ORPH
                  xapp_listres |  DISTRO  | https://release-monitoring.org/project/17161 | 1.0.5        | 1.0.6        | ORPH
                     xapp_luit |  DISTRO  | https://release-monitoring.org/project/15047 | 1.1.1        | 20240102     | ORPH
                    xapp_xauth |  DISTRO  | https://release-monitoring.org/project/05253 | 1.1.2        | 1.1.3        | ORPH
                    xapp_xbiff |  DISTRO  | https://release-monitoring.org/project/15034 | 1.0.4        | 1.0.5        | ORPH
                      xapp_xdm |  DISTRO  | https://release-monitoring.org/project/05255 | 1.1.14       | 1.1.16       | ORPH
                    xapp_xedit |  DISTRO  | https://release-monitoring.org/project/05180 | 1.2.3        | 1.2.4        | ORPH
                    xapp_xeyes |  DISTRO  | https://release-monitoring.org/project/15025 | 1.2.0        | 1.3.0        | ORPH
                  xapp_xkbcomp |  DISTRO  | https://release-monitoring.org/project/15018 | 1.4.6        | 1.4.7        | ORPH
                      xapp_xmh |  DISTRO  | https://release-monitoring.org/project/21718 | 1.0.4        | 1.0.5        | ORPH
                    xapp_xmore |  DISTRO  | https://release-monitoring.org/project/18845 | 1.0.3        | 1.0.4        | ORPH
                    xapp_xprop |  DISTRO  | https://release-monitoring.org/project/14958 | 1.2.6        | 1.2.7        | ORPH
                      xapp_xsm |  DISTRO  | https://release-monitoring.org/project/05259 | 1.0.5        | 1.0.6        | ORPH
                     xcb-proto |  DISTRO  | https://release-monitoring.org/project/13646 | 1.15.2       | 1.17.0       | ORPH
   xdriver_xf86-input-libinput |  DISTRO  | https://release-monitoring.org/project/05782 | 1.3.0        | 1.4.0        | ORPH
         xdriver_xf86-video-nv |  DISTRO  | https://release-monitoring.org/project/21711 | 2.1.22       | 2.1.23       | ORPH
     xdriver_xf86-video-savage |  DISTRO  | https://release-monitoring.org/project/05235 | 2.4.0        | 2.4.1        | ORPH
xdriver_xf86-video-siliconm... |  DISTRO  | https://release-monitoring.org/project/05236 | 1.7.9        | 1.7.10       | ORPH
                           xen |  DISTRO  | https://release-monitoring.org/project/05181 | 4.14.6       | 4.18.2       |     
                        xerces |  DISTRO  | https://release-monitoring.org/project/05182 | 3.2.4        | 3.2.5        | ORPH
 xfont_font-adobe-utopia-75dpi |  DISTRO  | https://release-monitoring.org/project/17200 | 1.0.4        | 1.0.5        | ORPH
               xfont_font-util |  DISTRO  | https://release-monitoring.org/project/15055 | 1.4.0        | 1.4.1        | ORPH
                      xfsprogs |  DISTRO  | https://release-monitoring.org/project/05188 | 6.4.0        | 6.8.0        | ORPH
                        xinetd |  DISTRO  | https://release-monitoring.org/project/06382 | 2.3.15       | 2.3.15.4     |     
              xkeyboard-config |  DISTRO  | https://release-monitoring.org/project/05191 | 2.38         | 2.42         | ORPH
                   xlib_libX11 |  DISTRO  | https://release-monitoring.org/project/01764 | 1.8.7        | 1.8.9        | ORPH
                   xlib_libXaw |  DISTRO  | https://release-monitoring.org/project/01766 | 1.0.15       | 1.0.16       | ORPH
               xlib_libXcursor |  DISTRO  | https://release-monitoring.org/project/01770 | 1.2.1        | 1.2.2        | ORPH
                 xlib_libXdmcp |  DISTRO  | https://release-monitoring.org/project/01772 | 1.1.4        | 1.1.5        | ORPH
                  xlib_libXext |  DISTRO  | https://release-monitoring.org/project/01774 | 1.3.5        | 1.3.6        | ORPH
                   xlib_libXmu |  DISTRO  | https://release-monitoring.org/project/01785 | 1.1.4        | 1.2.1        | ORPH
                xlib_libXrandr |  DISTRO  | https://release-monitoring.org/project/01788 | 1.5.3        | 1.5.4        | ORPH
                  xlib_libXvMC |  DISTRO  | https://release-monitoring.org/project/01796 | 1.0.13       | 1.0.14       | ORPH
               xlib_libfontenc |  DISTRO  | https://release-monitoring.org/project/01613 | 1.1.7        | 1.1.8        | ORPH
               xlib_libxkbfile |  DISTRO  | https://release-monitoring.org/project/01781 | 1.1.2        | 1.1.3        | ORPH
                         xmrig |  DISTRO  | https://release-monitoring.org/project/17499 | 6.21.2       | 6.21.3       |     
                     xorgproto |  DISTRO  | https://release-monitoring.org/project/17190 | 2023.2       | 2024.1       | ORPH
                       xorriso |  DISTRO  | https://release-monitoring.org/project/13270 | 1.5.4.pl02   | 1.5.6.pl02   |     
                  xscreensaver |  DISTRO  | https://release-monitoring.org/project/05269 | 6.03         | 6.09         |     
           xserver_xorg-server |  DISTRO  | https://release-monitoring.org/project/05250 | 21.1.11      | 21.1.13      | ORPH
                xtables-addons |  DISTRO  | https://release-monitoring.org/project/07736 | 3.24         | 3.26         | ORPH
                         xterm |  DISTRO  | https://release-monitoring.org/project/05272 | 389          | 392          | ORPH
              xutil_makedepend |  DISTRO  | https://release-monitoring.org/project/13528 | 1.0.8        | 1.0.9        | ORPH
                      xwayland |  DISTRO  | https://release-monitoring.org/project/180949 | 23.2.4       | 24.1.0       |     
                            xz |  DISTRO  | https://release-monitoring.org/project/05277 | 5.4.6        | 5.6.2        | ORPH
                           yad |  DISTRO  | https://release-monitoring.org/project/05280 | 0.40.0       | 13.0         |     
                         ytree |  DISTRO  | https://release-monitoring.org/project/05296 | 2.05         | 2.09         |     
                        zabbix |  DISTRO  | https://release-monitoring.org/project/05492 | 6.2.7        | 7.0.0        |     
                        zchunk |  DISTRO  | https://release-monitoring.org/project/178035 | 1.3.2        | 1.4.0        |     
                          zeek |  DISTRO  | https://release-monitoring.org/project/267106 | 4.1.1        | 6.2.1        |     
                          zstd |  DISTRO  | https://release-monitoring.org/project/12083 | 1.5.5        | 1.5.6        |     
                     zxing-cpp |  DISTRO  | https://release-monitoring.org/project/101246 | 2.1.0        | 2.2.1        |     
                       zziplib |  DISTRO  | https://release-monitoring.org/project/13802 | 0.13.74      | 0.13.76      |     

Packages having CVEs
====================

CVEs for the 'master' branch
----------------------------

             name              |       CVE        |                             link                            
-------------------------------+------------------+--------------------------------------------------------------
                        apache | CVE-1999-1412    | https://security-tracker.debian.org/tracker/CVE-1999-1412   
                        apache | CVE-1999-0678    | https://security-tracker.debian.org/tracker/CVE-1999-0678   
                        apache | CVE-1999-0236    | https://security-tracker.debian.org/tracker/CVE-1999-0236   
                        apache | CVE-1999-0289    | https://security-tracker.debian.org/tracker/CVE-1999-0289   
                        apache | CVE-1999-1237    | https://security-tracker.debian.org/tracker/CVE-1999-1237   
                        apache | CVE-2007-0450    | https://security-tracker.debian.org/tracker/CVE-2007-0450   
                        apache | CVE-2007-0086    | https://security-tracker.debian.org/tracker/CVE-2007-0086   
                        apache | CVE-2007-6422    | https://security-tracker.debian.org/tracker/CVE-2007-6422   
                        apache | CVE-2007-6421    | https://security-tracker.debian.org/tracker/CVE-2007-6421   
                        apache | CVE-2007-6423    | https://security-tracker.debian.org/tracker/CVE-2007-6423   
                        apache | CVE-2008-2168    | https://security-tracker.debian.org/tracker/CVE-2008-2168   
                        apache | CVE-2010-0425    | https://security-tracker.debian.org/tracker/CVE-2010-0425   
                      apparmor | CVE-2016-1585    | https://security-tracker.debian.org/tracker/CVE-2016-1585   
                         argus | CVE-2011-3332    | https://security-tracker.debian.org/tracker/CVE-2011-3332   
                         asn1c | CVE-2017-12966   | https://security-tracker.debian.org/tracker/CVE-2017-12966  
                         asn1c | CVE-2020-23911   | https://security-tracker.debian.org/tracker/CVE-2020-23911  
                         asn1c | CVE-2020-23910   | https://security-tracker.debian.org/tracker/CVE-2020-23910  
                          atop | CVE-2011-3618    | https://security-tracker.debian.org/tracker/CVE-2011-3618   
                         avahi | CVE-2021-3468    | https://security-tracker.debian.org/tracker/CVE-2021-3468   
                         avahi | CVE-2023-38472   | https://security-tracker.debian.org/tracker/CVE-2023-38472  
                         avahi | CVE-2023-38469   | https://security-tracker.debian.org/tracker/CVE-2023-38469  
                         avahi | CVE-2023-38470   | https://security-tracker.debian.org/tracker/CVE-2023-38470  
                         avahi | CVE-2023-38473   | https://security-tracker.debian.org/tracker/CVE-2023-38473  
                         avahi | CVE-2023-38471   | https://security-tracker.debian.org/tracker/CVE-2023-38471  
                     belle-sip | CVE-2021-33056   | https://security-tracker.debian.org/tracker/CVE-2021-33056  
                     belle-sip | CVE-2021-43610   | https://security-tracker.debian.org/tracker/CVE-2021-43610  
                     belle-sip | CVE-2021-43611   | https://security-tracker.debian.org/tracker/CVE-2021-43611  
                        bento4 | CVE-2020-23332   | https://security-tracker.debian.org/tracker/CVE-2020-23332  
                        bento4 | CVE-2020-23331   | https://security-tracker.debian.org/tracker/CVE-2020-23331  
                        bento4 | CVE-2022-3807    | https://security-tracker.debian.org/tracker/CVE-2022-3807   
                    berkeleydb | CVE-2017-3604    | https://security-tracker.debian.org/tracker/CVE-2017-3604   
                    berkeleydb | CVE-2017-3614    | https://security-tracker.debian.org/tracker/CVE-2017-3614   
                    berkeleydb | CVE-2017-3610    | https://security-tracker.debian.org/tracker/CVE-2017-3610   
                    berkeleydb | CVE-2017-3609    | https://security-tracker.debian.org/tracker/CVE-2017-3609   
                    berkeleydb | CVE-2017-3616    | https://security-tracker.debian.org/tracker/CVE-2017-3616   
                    berkeleydb | CVE-2017-3605    | https://security-tracker.debian.org/tracker/CVE-2017-3605   
                    berkeleydb | CVE-2017-3608    | https://security-tracker.debian.org/tracker/CVE-2017-3608   
                    berkeleydb | CVE-2017-3611    | https://security-tracker.debian.org/tracker/CVE-2017-3611   
                    berkeleydb | CVE-2017-3613    | https://security-tracker.debian.org/tracker/CVE-2017-3613   
                    berkeleydb | CVE-2017-3617    | https://security-tracker.debian.org/tracker/CVE-2017-3617   
                    berkeleydb | CVE-2017-3607    | https://security-tracker.debian.org/tracker/CVE-2017-3607   
                    berkeleydb | CVE-2017-3612    | https://security-tracker.debian.org/tracker/CVE-2017-3612   
                    berkeleydb | CVE-2017-3615    | https://security-tracker.debian.org/tracker/CVE-2017-3615   
                    berkeleydb | CVE-2017-3606    | https://security-tracker.debian.org/tracker/CVE-2017-3606   
                    berkeleydb | CVE-2019-2708    | https://security-tracker.debian.org/tracker/CVE-2019-2708   
                    berkeleydb | CVE-2020-2981    | https://security-tracker.debian.org/tracker/CVE-2020-2981   
                       bitcoin | CVE-2012-1909    | https://security-tracker.debian.org/tracker/CVE-2012-1909   
                       bitcoin | CVE-2012-4682    | https://security-tracker.debian.org/tracker/CVE-2012-4682   
                       bitcoin | CVE-2012-4683    | https://security-tracker.debian.org/tracker/CVE-2012-4683   
                       bitcoin | CVE-2013-3220    | https://security-tracker.debian.org/tracker/CVE-2013-3220   
                       bitcoin | CVE-2013-2293    | https://security-tracker.debian.org/tracker/CVE-2013-2293   
                       bitcoin | CVE-2013-2273    | https://security-tracker.debian.org/tracker/CVE-2013-2273   
                       bitcoin | CVE-2013-2272    | https://security-tracker.debian.org/tracker/CVE-2013-2272   
                       bitcoin | CVE-2013-2292    | https://security-tracker.debian.org/tracker/CVE-2013-2292   
                       bitcoin | CVE-2023-50428   | https://security-tracker.debian.org/tracker/CVE-2023-50428  
                  bluez5_utils | CVE-2020-24490   | https://security-tracker.debian.org/tracker/CVE-2020-24490  
          bluez5_utils-headers | CVE-2020-24490   | https://security-tracker.debian.org/tracker/CVE-2020-24490  
                        bsdiff | CVE-2020-14315   | https://security-tracker.debian.org/tracker/CVE-2020-14315  
                       busybox | CVE-2023-42363   | https://security-tracker.debian.org/tracker/CVE-2023-42363  
                       busybox | CVE-2023-42366   | https://security-tracker.debian.org/tracker/CVE-2023-42366  
                       busybox | CVE-2023-42364   | https://security-tracker.debian.org/tracker/CVE-2023-42364  
                       busybox | CVE-2023-42365   | https://security-tracker.debian.org/tracker/CVE-2023-42365  
                        bwm-ng | CVE-2023-26129   | https://security-tracker.debian.org/tracker/CVE-2023-26129  
                      composer | CVE-2023-43655   | https://security-tracker.debian.org/tracker/CVE-2023-43655  
                      composer | CVE-2024-24821   | https://security-tracker.debian.org/tracker/CVE-2024-24821  
                     coreutils | CVE-2016-2781    | https://security-tracker.debian.org/tracker/CVE-2016-2781   
                     coreutils | CVE-2024-0684    | https://security-tracker.debian.org/tracker/CVE-2024-0684   
                          cpio | CVE-2010-4226    | https://security-tracker.debian.org/tracker/CVE-2010-4226   
                          cpio | CVE-2023-7216    | https://security-tracker.debian.org/tracker/CVE-2023-7216   
                      cryptopp | CVE-2023-50980   | https://security-tracker.debian.org/tracker/CVE-2023-50980  
                      cryptopp | CVE-2023-50981   | https://security-tracker.debian.org/tracker/CVE-2023-50981  
                      cryptopp | CVE-2023-50979   | https://security-tracker.debian.org/tracker/CVE-2023-50979  
                           cvs | CVE-2017-12836   | https://security-tracker.debian.org/tracker/CVE-2017-12836  
                          dash | CVE-2024-21485   | https://security-tracker.debian.org/tracker/CVE-2024-21485  
                           dht | CVE-2020-36562   | https://security-tracker.debian.org/tracker/CVE-2020-36562  
                        docker | CVE-2014-8178    | https://security-tracker.debian.org/tracker/CVE-2014-8178   
                        docker | CVE-2014-8179    | https://security-tracker.debian.org/tracker/CVE-2014-8179   
                        docker | CVE-2014-0048    | https://security-tracker.debian.org/tracker/CVE-2014-0048   
                        docker | CVE-2015-1843    | https://security-tracker.debian.org/tracker/CVE-2015-1843   
                        docker | CVE-2015-3627    | https://security-tracker.debian.org/tracker/CVE-2015-3627   
                        docker | CVE-2015-3631    | https://security-tracker.debian.org/tracker/CVE-2015-3631   
                        docker | CVE-2015-3630    | https://security-tracker.debian.org/tracker/CVE-2015-3630   
                        docker | CVE-2016-3697    | https://security-tracker.debian.org/tracker/CVE-2016-3697   
                        docker | CVE-2017-14992   | https://security-tracker.debian.org/tracker/CVE-2017-14992  
                        docker | CVE-2019-16884   | https://security-tracker.debian.org/tracker/CVE-2019-16884  
                        docker | CVE-2019-13509   | https://security-tracker.debian.org/tracker/CVE-2019-13509  
                        docker | CVE-2019-13139   | https://security-tracker.debian.org/tracker/CVE-2019-13139  
                        docker | CVE-2019-5736    | https://security-tracker.debian.org/tracker/CVE-2019-5736   
                        docker | CVE-2019-15752   | https://security-tracker.debian.org/tracker/CVE-2019-15752  
                        docker | CVE-2020-27534   | https://security-tracker.debian.org/tracker/CVE-2020-27534  
                        docker | CVE-2021-33183   | https://security-tracker.debian.org/tracker/CVE-2021-33183  
                        docker | CVE-2021-3162    | https://security-tracker.debian.org/tracker/CVE-2021-3162   
                        docker | CVE-2021-21285   | https://security-tracker.debian.org/tracker/CVE-2021-21285  
                        docker | CVE-2021-21284   | https://security-tracker.debian.org/tracker/CVE-2021-21284  
                        docker | CVE-2022-25365   | https://security-tracker.debian.org/tracker/CVE-2022-25365  
                        dracut | CVE-2010-4176    | https://security-tracker.debian.org/tracker/CVE-2010-4176   
                          edk2 | CVE-2014-8271    | https://security-tracker.debian.org/tracker/CVE-2014-8271   
                          edk2 | CVE-2014-4860    | https://security-tracker.debian.org/tracker/CVE-2014-4860   
                          edk2 | CVE-2014-4859    | https://security-tracker.debian.org/tracker/CVE-2014-4859   
                          edk2 | CVE-2019-14586   | https://security-tracker.debian.org/tracker/CVE-2019-14586  
                          edk2 | CVE-2019-14553   | https://security-tracker.debian.org/tracker/CVE-2019-14553  
                          edk2 | CVE-2019-14559   | https://security-tracker.debian.org/tracker/CVE-2019-14559  
                          edk2 | CVE-2019-14563   | https://security-tracker.debian.org/tracker/CVE-2019-14563  
                          edk2 | CVE-2019-14587   | https://security-tracker.debian.org/tracker/CVE-2019-14587  
                          edk2 | CVE-2019-14575   | https://security-tracker.debian.org/tracker/CVE-2019-14575  
                          edk2 | CVE-2019-14562   | https://security-tracker.debian.org/tracker/CVE-2019-14562  
                         emlog | CVE-2021-44584   | https://security-tracker.debian.org/tracker/CVE-2021-44584  
                         emlog | CVE-2022-3968    | https://security-tracker.debian.org/tracker/CVE-2022-3968   
                         emlog | CVE-2022-1526    | https://security-tracker.debian.org/tracker/CVE-2022-1526   
                         emlog | CVE-2023-43291   | https://security-tracker.debian.org/tracker/CVE-2023-43291  
                        erlang | CVE-2023-48795   | https://security-tracker.debian.org/tracker/CVE-2023-48795  
                         exiv2 | CVE-2007-6353    | https://security-tracker.debian.org/tracker/CVE-2007-6353   
             freeradius-server | CVE-2002-0318    | https://security-tracker.debian.org/tracker/CVE-2002-0318   
             freeradius-server | CVE-2011-4966    | https://security-tracker.debian.org/tracker/CVE-2011-4966   
                gcc-bare-metal | CVE-2023-4039    | https://security-tracker.debian.org/tracker/CVE-2023-4039   
                   ghostscript | CVE-2023-38560   | https://security-tracker.debian.org/tracker/CVE-2023-38560  
                         gnupg | CVE-2006-3082    | https://security-tracker.debian.org/tracker/CVE-2006-3082   
                         gnupg | CVE-2011-2207    | https://security-tracker.debian.org/tracker/CVE-2011-2207   
                         gnupg | CVE-2015-1606    | https://security-tracker.debian.org/tracker/CVE-2015-1606   
                         gnupg | CVE-2018-12020   | https://security-tracker.debian.org/tracker/CVE-2018-12020  
                         gnupg | CVE-2019-14855   | https://security-tracker.debian.org/tracker/CVE-2019-14855  
                         gnupg | CVE-2019-13050   | https://security-tracker.debian.org/tracker/CVE-2019-13050  
                         gnupg | CVE-2022-34903   | https://security-tracker.debian.org/tracker/CVE-2022-34903  
                         gnupg | CVE-2022-3219    | https://security-tracker.debian.org/tracker/CVE-2022-3219   
                        gnupg2 | CVE-2022-3219    | https://security-tracker.debian.org/tracker/CVE-2022-3219   
                graphicsmagick | CVE-2007-0770    | https://security-tracker.debian.org/tracker/CVE-2007-0770   
                graphicsmagick | CVE-2008-6621    | https://security-tracker.debian.org/tracker/CVE-2008-6621   
                     graphite2 | CVE-2017-5436    | https://security-tracker.debian.org/tracker/CVE-2017-5436   
                          grpc | CVE-2023-1428    | https://security-tracker.debian.org/tracker/CVE-2023-1428   
                          grpc | CVE-2023-33953   | https://security-tracker.debian.org/tracker/CVE-2023-33953  
                          grpc | CVE-2023-44487   | https://security-tracker.debian.org/tracker/CVE-2023-44487  
                          grpc | CVE-2023-4785    | https://security-tracker.debian.org/tracker/CVE-2023-4785   
                          grpc | CVE-2023-32732   | https://security-tracker.debian.org/tracker/CVE-2023-32732  
                         grub2 | CVE-2023-4001    | https://security-tracker.debian.org/tracker/CVE-2023-4001   
                         grub2 | CVE-2024-1048    | https://security-tracker.debian.org/tracker/CVE-2024-1048   
                       haproxy | CVE-2016-2102    | https://security-tracker.debian.org/tracker/CVE-2016-2102   
                       haproxy | CVE-2023-0056    | https://security-tracker.debian.org/tracker/CVE-2023-0056   
                       haproxy | CVE-2023-45539   | https://security-tracker.debian.org/tracker/CVE-2023-45539  
                   imagemagick | CVE-2007-1667    | https://security-tracker.debian.org/tracker/CVE-2007-1667   
                   imagemagick | CVE-2014-9813    | https://security-tracker.debian.org/tracker/CVE-2014-9813   
                   imagemagick | CVE-2014-9822    | https://security-tracker.debian.org/tracker/CVE-2014-9822   
                   imagemagick | CVE-2014-9831    | https://security-tracker.debian.org/tracker/CVE-2014-9831   
                   imagemagick | CVE-2014-9854    | https://security-tracker.debian.org/tracker/CVE-2014-9854   
                   imagemagick | CVE-2014-9814    | https://security-tracker.debian.org/tracker/CVE-2014-9814   
                   imagemagick | CVE-2014-9821    | https://security-tracker.debian.org/tracker/CVE-2014-9821   
                   imagemagick | CVE-2014-9829    | https://security-tracker.debian.org/tracker/CVE-2014-9829   
                   imagemagick | CVE-2014-9806    | https://security-tracker.debian.org/tracker/CVE-2014-9806   
                   imagemagick | CVE-2014-9805    | https://security-tracker.debian.org/tracker/CVE-2014-9805   
                   imagemagick | CVE-2014-9852    | https://security-tracker.debian.org/tracker/CVE-2014-9852   
                   imagemagick | CVE-2014-9808    | https://security-tracker.debian.org/tracker/CVE-2014-9808   
                   imagemagick | CVE-2014-9810    | https://security-tracker.debian.org/tracker/CVE-2014-9810   
                   imagemagick | CVE-2014-9853    | https://security-tracker.debian.org/tracker/CVE-2014-9853   
                   imagemagick | CVE-2014-9807    | https://security-tracker.debian.org/tracker/CVE-2014-9807   
                   imagemagick | CVE-2014-9819    | https://security-tracker.debian.org/tracker/CVE-2014-9819   
                   imagemagick | CVE-2014-9820    | https://security-tracker.debian.org/tracker/CVE-2014-9820   
                   imagemagick | CVE-2014-9823    | https://security-tracker.debian.org/tracker/CVE-2014-9823   
                   imagemagick | CVE-2014-9848    | https://security-tracker.debian.org/tracker/CVE-2014-9848   
                   imagemagick | CVE-2014-9816    | https://security-tracker.debian.org/tracker/CVE-2014-9816   
                   imagemagick | CVE-2014-9817    | https://security-tracker.debian.org/tracker/CVE-2014-9817   
                   imagemagick | CVE-2014-9825    | https://security-tracker.debian.org/tracker/CVE-2014-9825   
                   imagemagick | CVE-2014-9818    | https://security-tracker.debian.org/tracker/CVE-2014-9818   
                   imagemagick | CVE-2014-9804    | https://security-tracker.debian.org/tracker/CVE-2014-9804   
                   imagemagick | CVE-2014-9824    | https://security-tracker.debian.org/tracker/CVE-2014-9824   
                   imagemagick | CVE-2014-9812    | https://security-tracker.debian.org/tracker/CVE-2014-9812   
                   imagemagick | CVE-2014-9811    | https://security-tracker.debian.org/tracker/CVE-2014-9811   
                   imagemagick | CVE-2014-9827    | https://security-tracker.debian.org/tracker/CVE-2014-9827   
                   imagemagick | CVE-2014-9826    | https://security-tracker.debian.org/tracker/CVE-2014-9826   
                   imagemagick | CVE-2014-9815    | https://security-tracker.debian.org/tracker/CVE-2014-9815   
                   imagemagick | CVE-2014-9828    | https://security-tracker.debian.org/tracker/CVE-2014-9828   
                   imagemagick | CVE-2014-9830    | https://security-tracker.debian.org/tracker/CVE-2014-9830   
                   imagemagick | CVE-2014-9809    | https://security-tracker.debian.org/tracker/CVE-2014-9809   
                   imagemagick | CVE-2014-9907    | https://security-tracker.debian.org/tracker/CVE-2014-9907   
                   imagemagick | CVE-2016-10062   | https://security-tracker.debian.org/tracker/CVE-2016-10062  
                   imagemagick | CVE-2016-5118    | https://security-tracker.debian.org/tracker/CVE-2016-5118   
                   imagemagick | CVE-2016-10145   | https://security-tracker.debian.org/tracker/CVE-2016-10145  
                   imagemagick | CVE-2016-10144   | https://security-tracker.debian.org/tracker/CVE-2016-10144  
                   imagemagick | CVE-2016-10146   | https://security-tracker.debian.org/tracker/CVE-2016-10146  
                   imagemagick | CVE-2016-7515    | https://security-tracker.debian.org/tracker/CVE-2016-7515   
                   imagemagick | CVE-2016-7514    | https://security-tracker.debian.org/tracker/CVE-2016-7514   
                   imagemagick | CVE-2016-7530    | https://security-tracker.debian.org/tracker/CVE-2016-7530   
                   imagemagick | CVE-2016-7519    | https://security-tracker.debian.org/tracker/CVE-2016-7519   
                   imagemagick | CVE-2016-7537    | https://security-tracker.debian.org/tracker/CVE-2016-7537   
                   imagemagick | CVE-2016-7523    | https://security-tracker.debian.org/tracker/CVE-2016-7523   
                   imagemagick | CVE-2016-7521    | https://security-tracker.debian.org/tracker/CVE-2016-7521   
                   imagemagick | CVE-2016-7532    | https://security-tracker.debian.org/tracker/CVE-2016-7532   
                   imagemagick | CVE-2016-7538    | https://security-tracker.debian.org/tracker/CVE-2016-7538   
                   imagemagick | CVE-2016-7528    | https://security-tracker.debian.org/tracker/CVE-2016-7528   
                   imagemagick | CVE-2016-7525    | https://security-tracker.debian.org/tracker/CVE-2016-7525   
                   imagemagick | CVE-2016-7520    | https://security-tracker.debian.org/tracker/CVE-2016-7520   
                   imagemagick | CVE-2016-7518    | https://security-tracker.debian.org/tracker/CVE-2016-7518   
                   imagemagick | CVE-2016-7531    | https://security-tracker.debian.org/tracker/CVE-2016-7531   
                   imagemagick | CVE-2016-7522    | https://security-tracker.debian.org/tracker/CVE-2016-7522   
                   imagemagick | CVE-2016-7517    | https://security-tracker.debian.org/tracker/CVE-2016-7517   
                   imagemagick | CVE-2016-7524    | https://security-tracker.debian.org/tracker/CVE-2016-7524   
                   imagemagick | CVE-2016-7536    | https://security-tracker.debian.org/tracker/CVE-2016-7536   
                   imagemagick | CVE-2016-7529    | https://security-tracker.debian.org/tracker/CVE-2016-7529   
                   imagemagick | CVE-2016-7527    | https://security-tracker.debian.org/tracker/CVE-2016-7527   
                   imagemagick | CVE-2016-7533    | https://security-tracker.debian.org/tracker/CVE-2016-7533   
                   imagemagick | CVE-2016-7534    | https://security-tracker.debian.org/tracker/CVE-2016-7534   
                   imagemagick | CVE-2016-7516    | https://security-tracker.debian.org/tracker/CVE-2016-7516   
                   imagemagick | CVE-2016-7526    | https://security-tracker.debian.org/tracker/CVE-2016-7526   
                   imagemagick | CVE-2016-7535    | https://security-tracker.debian.org/tracker/CVE-2016-7535   
                   imagemagick | CVE-2016-7513    | https://security-tracker.debian.org/tracker/CVE-2016-7513   
                   imagemagick | CVE-2017-5509    | https://security-tracker.debian.org/tracker/CVE-2017-5509   
                   imagemagick | CVE-2017-5510    | https://security-tracker.debian.org/tracker/CVE-2017-5510   
                   imagemagick | CVE-2017-5506    | https://security-tracker.debian.org/tracker/CVE-2017-5506   
                   imagemagick | CVE-2017-5511    | https://security-tracker.debian.org/tracker/CVE-2017-5511   
                   imagemagick | CVE-2023-5341    | https://security-tracker.debian.org/tracker/CVE-2023-5341   
                        jasper | CVE-2023-51257   | https://security-tracker.debian.org/tracker/CVE-2023-51257  
                        jquery | CVE-2007-2379    | https://security-tracker.debian.org/tracker/CVE-2007-2379   
                       kvmtool | CVE-2021-45464   | https://security-tracker.debian.org/tracker/CVE-2021-45464  
                         libao | CVE-2017-11548   | https://security-tracker.debian.org/tracker/CVE-2017-11548  
                  libfreeimage | CVE-2019-12211   | https://security-tracker.debian.org/tracker/CVE-2019-12211  
                  libfreeimage | CVE-2019-12214   | https://security-tracker.debian.org/tracker/CVE-2019-12214  
                  libfreeimage | CVE-2019-12212   | https://security-tracker.debian.org/tracker/CVE-2019-12212  
                  libfreeimage | CVE-2019-12213   | https://security-tracker.debian.org/tracker/CVE-2019-12213  
                  libfreeimage | CVE-2020-21426   | https://security-tracker.debian.org/tracker/CVE-2020-21426  
                  libfreeimage | CVE-2020-21428   | https://security-tracker.debian.org/tracker/CVE-2020-21428  
                  libfreeimage | CVE-2020-21427   | https://security-tracker.debian.org/tracker/CVE-2020-21427  
                  libfreeimage | CVE-2021-33367   | https://security-tracker.debian.org/tracker/CVE-2021-33367  
                  libfreeimage | CVE-2023-47993   | https://security-tracker.debian.org/tracker/CVE-2023-47993  
                  libfreeimage | CVE-2023-47992   | https://security-tracker.debian.org/tracker/CVE-2023-47992  
                  libfreeimage | CVE-2023-47997   | https://security-tracker.debian.org/tracker/CVE-2023-47997  
                  libfreeimage | CVE-2023-47994   | https://security-tracker.debian.org/tracker/CVE-2023-47994  
                  libfreeimage | CVE-2023-47995   | https://security-tracker.debian.org/tracker/CVE-2023-47995  
                  libfreeimage | CVE-2023-47996   | https://security-tracker.debian.org/tracker/CVE-2023-47996  
                       libgtk2 | CVE-2014-1949    | https://security-tracker.debian.org/tracker/CVE-2014-1949   
                     libiberty | CVE-2012-3509    | https://security-tracker.debian.org/tracker/CVE-2012-3509   
                     libiberty | CVE-2016-4487    | https://security-tracker.debian.org/tracker/CVE-2016-4487   
                     libiberty | CVE-2016-4492    | https://security-tracker.debian.org/tracker/CVE-2016-4492   
                     libiberty | CVE-2016-4491    | https://security-tracker.debian.org/tracker/CVE-2016-4491   
                     libiberty | CVE-2016-4490    | https://security-tracker.debian.org/tracker/CVE-2016-4490   
                     libiberty | CVE-2016-4489    | https://security-tracker.debian.org/tracker/CVE-2016-4489   
                     libiberty | CVE-2016-4488    | https://security-tracker.debian.org/tracker/CVE-2016-4488   
                     libiberty | CVE-2016-4493    | https://security-tracker.debian.org/tracker/CVE-2016-4493   
                     libiberty | CVE-2016-6131    | https://security-tracker.debian.org/tracker/CVE-2016-6131   
                     libiberty | CVE-2016-2226    | https://security-tracker.debian.org/tracker/CVE-2016-2226   
                       libkrb5 | CVE-1999-0713    | https://security-tracker.debian.org/tracker/CVE-1999-0713   
                       libkrb5 | CVE-1999-0143    | https://security-tracker.debian.org/tracker/CVE-1999-0143   
                       libkrb5 | CVE-2007-5894    | https://security-tracker.debian.org/tracker/CVE-2007-5894   
                       libkrb5 | CVE-2007-3149    | https://security-tracker.debian.org/tracker/CVE-2007-3149   
                       libkrb5 | CVE-2007-5902    | https://security-tracker.debian.org/tracker/CVE-2007-5902   
                       libkrb5 | CVE-2009-0844    | https://security-tracker.debian.org/tracker/CVE-2009-0844   
                        libmad | CVE-2018-7263    | https://security-tracker.debian.org/tracker/CVE-2018-7263   
                      libmpeg2 | CVE-2022-37416   | https://security-tracker.debian.org/tracker/CVE-2022-37416  
                      libplist | CVE-2017-5834    | https://security-tracker.debian.org/tracker/CVE-2017-5834   
                      libplist | CVE-2017-5835    | https://security-tracker.debian.org/tracker/CVE-2017-5835   
                      libplist | CVE-2017-5836    | https://security-tracker.debian.org/tracker/CVE-2017-5836   
                        libraw | CVE-2020-22628   | https://security-tracker.debian.org/tracker/CVE-2020-22628  
                        libraw | CVE-2023-1729    | https://security-tracker.debian.org/tracker/CVE-2023-1729   
                    libsndfile | CVE-2022-33065   | https://security-tracker.debian.org/tracker/CVE-2022-33065  
                    libtorrent | CVE-2009-1760    | https://security-tracker.debian.org/tracker/CVE-2009-1760   
                    libtorrent | CVE-2016-5301    | https://security-tracker.debian.org/tracker/CVE-2016-5301   
                       libvirt | CVE-2014-8136    | https://security-tracker.debian.org/tracker/CVE-2014-8136   
                       libvirt | CVE-2014-8135    | https://security-tracker.debian.org/tracker/CVE-2014-8135   
                       libvirt | CVE-2015-5313    | https://security-tracker.debian.org/tracker/CVE-2015-5313   
                       libvirt | CVE-2018-6764    | https://security-tracker.debian.org/tracker/CVE-2018-6764   
                       libvirt | CVE-2018-5748    | https://security-tracker.debian.org/tracker/CVE-2018-5748   
                       libvirt | CVE-2023-3750    | https://security-tracker.debian.org/tracker/CVE-2023-3750   
                         lrzip | CVE-2022-33067   | https://security-tracker.debian.org/tracker/CVE-2022-33067  
                         lrzip | CVE-2023-39741   | https://security-tracker.debian.org/tracker/CVE-2023-39741  
                         lrzsz | CVE-2018-10195   | https://security-tracker.debian.org/tracker/CVE-2018-10195  
                           lua | CVE-2014-5461    | https://security-tracker.debian.org/tracker/CVE-2014-5461   
                           lua | CVE-2021-43519   | https://security-tracker.debian.org/tracker/CVE-2021-43519  
                       mbedtls | CVE-2021-45451   | https://security-tracker.debian.org/tracker/CVE-2021-45451  
                       mbedtls | CVE-2021-36647   | https://security-tracker.debian.org/tracker/CVE-2021-36647  
                       mbedtls | CVE-2021-43666   | https://security-tracker.debian.org/tracker/CVE-2021-43666  
                       mbedtls | CVE-2023-52353   | https://security-tracker.debian.org/tracker/CVE-2023-52353  
                   micropython | CVE-2023-7152    | https://security-tracker.debian.org/tracker/CVE-2023-7152   
                       mongodb | CVE-2014-8180    | https://security-tracker.debian.org/tracker/CVE-2014-8180   
                       mongodb | CVE-2017-2665    | https://security-tracker.debian.org/tracker/CVE-2017-2665   
                         mp4v2 | CVE-2023-33716   | https://security-tracker.debian.org/tracker/CVE-2023-33716  
                         mp4v2 | CVE-2023-33719   | https://security-tracker.debian.org/tracker/CVE-2023-33719  
                         mp4v2 | CVE-2023-33718   | https://security-tracker.debian.org/tracker/CVE-2023-33718  
                         mp4v2 | CVE-2023-33717   | https://security-tracker.debian.org/tracker/CVE-2023-33717  
                          mutt | CVE-2011-1429    | https://security-tracker.debian.org/tracker/CVE-2011-1429   
                          nasm | CVE-2023-31722   | https://security-tracker.debian.org/tracker/CVE-2023-31722  
                       netdata | CVE-2023-22497   | https://security-tracker.debian.org/tracker/CVE-2023-22497  
                       netdata | CVE-2023-22496   | https://security-tracker.debian.org/tracker/CVE-2023-22496  
                         nginx | CVE-2023-44487   | https://security-tracker.debian.org/tracker/CVE-2023-44487  
                         ninja | CVE-2021-4336    | https://security-tracker.debian.org/tracker/CVE-2021-4336   
                           ntp | CVE-2014-9750    | https://security-tracker.debian.org/tracker/CVE-2014-9750   
                           ntp | CVE-2014-9751    | https://security-tracker.debian.org/tracker/CVE-2014-9751   
                           ntp | CVE-2015-7691    | https://security-tracker.debian.org/tracker/CVE-2015-7691   
                           ntp | CVE-2015-7692    | https://security-tracker.debian.org/tracker/CVE-2015-7692   
                           ntp | CVE-2015-7977    | https://security-tracker.debian.org/tracker/CVE-2015-7977   
                           ntp | CVE-2015-7973    | https://security-tracker.debian.org/tracker/CVE-2015-7973   
                           ntp | CVE-2015-7974    | https://security-tracker.debian.org/tracker/CVE-2015-7974   
                           ntp | CVE-2015-7703    | https://security-tracker.debian.org/tracker/CVE-2015-7703   
                           ntp | CVE-2015-7705    | https://security-tracker.debian.org/tracker/CVE-2015-7705   
                           ntp | CVE-2015-7701    | https://security-tracker.debian.org/tracker/CVE-2015-7701   
                           ntp | CVE-2015-7704    | https://security-tracker.debian.org/tracker/CVE-2015-7704   
                           ntp | CVE-2015-7702    | https://security-tracker.debian.org/tracker/CVE-2015-7702   
                           ntp | CVE-2015-7854    | https://security-tracker.debian.org/tracker/CVE-2015-7854   
                           ntp | CVE-2015-7853    | https://security-tracker.debian.org/tracker/CVE-2015-7853   
                           ntp | CVE-2015-7852    | https://security-tracker.debian.org/tracker/CVE-2015-7852   
                           ntp | CVE-2015-7849    | https://security-tracker.debian.org/tracker/CVE-2015-7849   
                           ntp | CVE-2015-7855    | https://security-tracker.debian.org/tracker/CVE-2015-7855   
                           ntp | CVE-2015-7850    | https://security-tracker.debian.org/tracker/CVE-2015-7850   
                           ntp | CVE-2016-2518    | https://security-tracker.debian.org/tracker/CVE-2016-2518   
                           ntp | CVE-2016-4955    | https://security-tracker.debian.org/tracker/CVE-2016-4955   
                           ntp | CVE-2016-4953    | https://security-tracker.debian.org/tracker/CVE-2016-4953   
                           ntp | CVE-2016-4954    | https://security-tracker.debian.org/tracker/CVE-2016-4954   
                           ntp | CVE-2016-4956    | https://security-tracker.debian.org/tracker/CVE-2016-4956   
                           ntp | CVE-2016-7426    | https://security-tracker.debian.org/tracker/CVE-2016-7426   
                           ntp | CVE-2016-7434    | https://security-tracker.debian.org/tracker/CVE-2016-7434   
                           ntp | CVE-2017-6458    | https://security-tracker.debian.org/tracker/CVE-2017-6458   
                           ntp | CVE-2018-7170    | https://security-tracker.debian.org/tracker/CVE-2018-7170   
                           ntp | CVE-2018-7185    | https://security-tracker.debian.org/tracker/CVE-2018-7185   
                           ntp | CVE-2019-11331   | https://security-tracker.debian.org/tracker/CVE-2019-11331  
                           ntp | CVE-2019-8936    | https://security-tracker.debian.org/tracker/CVE-2019-8936   
                           ntp | CVE-2020-13817   | https://security-tracker.debian.org/tracker/CVE-2020-13817  
                           ntp | CVE-2020-11868   | https://security-tracker.debian.org/tracker/CVE-2020-11868  
                    open-iscsi | CVE-2020-13987   | https://security-tracker.debian.org/tracker/CVE-2020-13987  
                       opencv3 | CVE-2019-19624   | https://security-tracker.debian.org/tracker/CVE-2019-19624  
                       opencv3 | CVE-2019-14493   | https://security-tracker.debian.org/tracker/CVE-2019-14493  
                       opencv3 | CVE-2019-15939   | https://security-tracker.debian.org/tracker/CVE-2019-15939  
                       openjdk | CVE-2009-2476    | https://security-tracker.debian.org/tracker/CVE-2009-2476   
                       openjdk | CVE-2009-2475    | https://security-tracker.debian.org/tracker/CVE-2009-2475   
                       openjdk | CVE-2009-2690    | https://security-tracker.debian.org/tracker/CVE-2009-2690   
                       openjdk | CVE-2009-2689    | https://security-tracker.debian.org/tracker/CVE-2009-2689   
                       openjdk | CVE-2009-3881    | https://security-tracker.debian.org/tracker/CVE-2009-3881   
                       openjdk | CVE-2009-3882    | https://security-tracker.debian.org/tracker/CVE-2009-3882   
                       openjdk | CVE-2009-3880    | https://security-tracker.debian.org/tracker/CVE-2009-3880   
                       openjdk | CVE-2009-3884    | https://security-tracker.debian.org/tracker/CVE-2009-3884   
                       openjdk | CVE-2009-3879    | https://security-tracker.debian.org/tracker/CVE-2009-3879   
                       openjdk | CVE-2009-3883    | https://security-tracker.debian.org/tracker/CVE-2009-3883   
                       openjdk | CVE-2009-3728    | https://security-tracker.debian.org/tracker/CVE-2009-3728   
                       openssh | CVE-2007-2768    | https://security-tracker.debian.org/tracker/CVE-2007-2768   
                       openssh | CVE-2008-3844    | https://security-tracker.debian.org/tracker/CVE-2008-3844   
                       openssh | CVE-2014-9278    | https://security-tracker.debian.org/tracker/CVE-2014-9278   
                       openssh | CVE-2023-51767   | https://security-tracker.debian.org/tracker/CVE-2023-51767  
                      openswan | CVE-2019-10155   | https://security-tracker.debian.org/tracker/CVE-2019-10155  
                   openvmtools | CVE-2014-4199    | https://security-tracker.debian.org/tracker/CVE-2014-4199   
                   openvmtools | CVE-2014-4200    | https://security-tracker.debian.org/tracker/CVE-2014-4200   
                   openvmtools | CVE-2021-31693   | https://security-tracker.debian.org/tracker/CVE-2021-31693  
                   openvmtools | CVE-2022-31693   | https://security-tracker.debian.org/tracker/CVE-2022-31693  
                   openvmtools | CVE-2022-22943   | https://security-tracker.debian.org/tracker/CVE-2022-22943  
                   openvmtools | CVE-2023-20867   | https://security-tracker.debian.org/tracker/CVE-2023-20867  
                   openvmtools | CVE-2023-20900   | https://security-tracker.debian.org/tracker/CVE-2023-20900  
                   openvmtools | CVE-2023-34058   | https://security-tracker.debian.org/tracker/CVE-2023-34058  
                   openvmtools | CVE-2023-34057   | https://security-tracker.debian.org/tracker/CVE-2023-34057  
                         p7zip | CVE-2017-17969   | https://security-tracker.debian.org/tracker/CVE-2017-17969  
                         p7zip | CVE-2018-5996    | https://security-tracker.debian.org/tracker/CVE-2018-5996   
                         patch | CVE-2018-6952    | https://security-tracker.debian.org/tracker/CVE-2018-6952   
                         patch | CVE-2019-20633   | https://security-tracker.debian.org/tracker/CVE-2019-20633  
       perl-lwp-protocol-https | CVE-2014-3230    | https://security-tracker.debian.org/tracker/CVE-2014-3230   
                           php | CVE-2007-2728    | https://security-tracker.debian.org/tracker/CVE-2007-2728   
                           php | CVE-2007-3205    | https://security-tracker.debian.org/tracker/CVE-2007-3205   
                           php | CVE-2007-4596    | https://security-tracker.debian.org/tracker/CVE-2007-4596   
                           php | CVE-2022-4900    | https://security-tracker.debian.org/tracker/CVE-2022-4900   
                           php | CVE-2024-4577    | https://security-tracker.debian.org/tracker/CVE-2024-4577   
                           php | CVE-2024-5458    | https://security-tracker.debian.org/tracker/CVE-2024-5458   
                           php | CVE-2024-5585    | https://security-tracker.debian.org/tracker/CVE-2024-5585   
                           php | CVE-2024-2408    | https://security-tracker.debian.org/tracker/CVE-2024-2408   
                       pkgconf | CVE-2023-24056   | https://security-tracker.debian.org/tracker/CVE-2023-24056  
                 powerpc-utils | CVE-2014-8165    | https://security-tracker.debian.org/tracker/CVE-2014-8165   
                       proftpd | CVE-2023-48795   | https://security-tracker.debian.org/tracker/CVE-2023-48795  
           python-cryptography | CVE-2023-49083   | https://security-tracker.debian.org/tracker/CVE-2023-49083  
               python-m2crypto | CVE-2020-25657   | https://security-tracker.debian.org/tracker/CVE-2020-25657  
               python-m2crypto | CVE-2023-50781   | https://security-tracker.debian.org/tracker/CVE-2023-50781  
                     python-py | CVE-2022-42969   | https://security-tracker.debian.org/tracker/CVE-2022-42969  
                python-uvicorn | CVE-2020-7694    | https://security-tracker.debian.org/tracker/CVE-2020-7694   
                          qemu | CVE-2018-18438   | https://security-tracker.debian.org/tracker/CVE-2018-18438  
                          qemu | CVE-2019-12067   | https://security-tracker.debian.org/tracker/CVE-2019-12067  
                          qemu | CVE-2021-20255   | https://security-tracker.debian.org/tracker/CVE-2021-20255  
                          qemu | CVE-2023-2680    | https://security-tracker.debian.org/tracker/CVE-2023-2680   
                          qemu | CVE-2023-1386    | https://security-tracker.debian.org/tracker/CVE-2023-1386   
                          qemu | CVE-2024-3567    | https://security-tracker.debian.org/tracker/CVE-2024-3567   
                       qt6base | CVE-2023-51714   | https://security-tracker.debian.org/tracker/CVE-2023-51714  
                       qt6base | CVE-2023-38197   | https://security-tracker.debian.org/tracker/CVE-2023-38197  
                       qt6base | CVE-2023-34410   | https://security-tracker.debian.org/tracker/CVE-2023-34410  
                       qt6base | CVE-2023-37369   | https://security-tracker.debian.org/tracker/CVE-2023-37369  
                       qt6base | CVE-2023-33285   | https://security-tracker.debian.org/tracker/CVE-2023-33285  
                       qt6base | CVE-2023-32573   | https://security-tracker.debian.org/tracker/CVE-2023-32573  
                       qt6base | CVE-2023-32763   | https://security-tracker.debian.org/tracker/CVE-2023-32763  
                       qt6base | CVE-2023-32762   | https://security-tracker.debian.org/tracker/CVE-2023-32762  
                        quagga | CVE-2016-4049    | https://security-tracker.debian.org/tracker/CVE-2016-4049   
                        quagga | CVE-2017-3224    | https://security-tracker.debian.org/tracker/CVE-2017-3224   
                        quagga | CVE-2021-44038   | https://security-tracker.debian.org/tracker/CVE-2021-44038  
                   resiprocate | CVE-2017-9454    | https://security-tracker.debian.org/tracker/CVE-2017-9454   
                        samba4 | CVE-2011-2411    | https://security-tracker.debian.org/tracker/CVE-2011-2411   
                        samba4 | CVE-2018-14628   | https://security-tracker.debian.org/tracker/CVE-2018-14628  
                        samba4 | CVE-2021-3670    | https://security-tracker.debian.org/tracker/CVE-2021-3670   
                        samba4 | CVE-2022-32743   | https://security-tracker.debian.org/tracker/CVE-2022-32743  
                        samba4 | CVE-2022-1615    | https://security-tracker.debian.org/tracker/CVE-2022-1615   
                        samba4 | CVE-2022-38023   | https://security-tracker.debian.org/tracker/CVE-2022-38023  
                        samba4 | CVE-2022-37967   | https://security-tracker.debian.org/tracker/CVE-2022-37967  
                        samba4 | CVE-2022-37966   | https://security-tracker.debian.org/tracker/CVE-2022-37966  
                           sdl | CVE-2019-7635    | https://security-tracker.debian.org/tracker/CVE-2019-7635   
                           sdl | CVE-2019-7637    | https://security-tracker.debian.org/tracker/CVE-2019-7637   
                           sdl | CVE-2019-7638    | https://security-tracker.debian.org/tracker/CVE-2019-7638   
                           sdl | CVE-2019-7636    | https://security-tracker.debian.org/tracker/CVE-2019-7636   
                           sdl | CVE-2019-13616   | https://security-tracker.debian.org/tracker/CVE-2019-13616  
                           sdl | CVE-2019-14906   | https://security-tracker.debian.org/tracker/CVE-2019-14906  
                           sdl | CVE-2019-7576    | https://security-tracker.debian.org/tracker/CVE-2019-7576   
                           sdl | CVE-2019-7578    | https://security-tracker.debian.org/tracker/CVE-2019-7578   
                           sdl | CVE-2019-7577    | https://security-tracker.debian.org/tracker/CVE-2019-7577   
                           sdl | CVE-2019-7575    | https://security-tracker.debian.org/tracker/CVE-2019-7575   
                           sdl | CVE-2019-7573    | https://security-tracker.debian.org/tracker/CVE-2019-7573   
                           sdl | CVE-2019-7572    | https://security-tracker.debian.org/tracker/CVE-2019-7572   
                           sdl | CVE-2019-7574    | https://security-tracker.debian.org/tracker/CVE-2019-7574   
                           sdl | CVE-2020-14410   | https://security-tracker.debian.org/tracker/CVE-2020-14410  
                           sdl | CVE-2020-14409   | https://security-tracker.debian.org/tracker/CVE-2020-14409  
                        shadow | CVE-2013-4235    | https://security-tracker.debian.org/tracker/CVE-2013-4235   
                          shim | CVE-2023-40548   | https://security-tracker.debian.org/tracker/CVE-2023-40548  
                         smack | CVE-2014-0363    | https://security-tracker.debian.org/tracker/CVE-2014-0363   
                         smack | CVE-2014-0364    | https://security-tracker.debian.org/tracker/CVE-2014-0364   
                         smack | CVE-2016-10027   | https://security-tracker.debian.org/tracker/CVE-2016-10027  
                         spice | CVE-2016-0749    | https://security-tracker.debian.org/tracker/CVE-2016-0749   
                         spice | CVE-2016-2150    | https://security-tracker.debian.org/tracker/CVE-2016-2150   
                         spice | CVE-2018-10893   | https://security-tracker.debian.org/tracker/CVE-2018-10893  
                     syslog-ng | CVE-2022-38725   | https://security-tracker.debian.org/tracker/CVE-2022-38725  
                     tcpreplay | CVE-2023-4256    | https://security-tracker.debian.org/tracker/CVE-2023-4256   
                        thttpd | CVE-2012-5640    | https://security-tracker.debian.org/tracker/CVE-2012-5640   
                          tiff | CVE-2015-7313    | https://security-tracker.debian.org/tracker/CVE-2015-7313   
                          tiff | CVE-2023-6277    | https://security-tracker.debian.org/tracker/CVE-2023-6277   
                          tiff | CVE-2023-6228    | https://security-tracker.debian.org/tracker/CVE-2023-6228   
                          tiff | CVE-2023-52356   | https://security-tracker.debian.org/tracker/CVE-2023-52356  
                          tinc | CVE-2013-1428    | https://security-tracker.debian.org/tracker/CVE-2013-1428   
                           tor | CVE-2016-9079    | https://security-tracker.debian.org/tracker/CVE-2016-9079   
                           tor | CVE-2017-16541   | https://security-tracker.debian.org/tracker/CVE-2017-16541  
                      tpm2-tss | CVE-2023-22745   | https://security-tracker.debian.org/tracker/CVE-2023-22745  
                   uboot-tools | CVE-2022-2347    | https://security-tracker.debian.org/tracker/CVE-2022-2347   
                   uboot-tools | CVE-2022-33103   | https://security-tracker.debian.org/tracker/CVE-2022-33103  
                   uboot-tools | CVE-2022-30767   | https://security-tracker.debian.org/tracker/CVE-2022-30767  
                   uboot-tools | CVE-2022-34835   | https://security-tracker.debian.org/tracker/CVE-2022-34835  
                         unrar | CVE-2022-30333   | https://security-tracker.debian.org/tracker/CVE-2022-30333  
                         unzip | CVE-2021-4217    | https://security-tracker.debian.org/tracker/CVE-2021-4217   
                           upx | CVE-2023-23456   | https://security-tracker.debian.org/tracker/CVE-2023-23456  
                           upx | CVE-2023-23457   | https://security-tracker.debian.org/tracker/CVE-2023-23457  
                  vorbis-tools | CVE-2023-43361   | https://security-tracker.debian.org/tracker/CVE-2023-43361  
                           xen | CVE-2011-3346    | https://security-tracker.debian.org/tracker/CVE-2011-3346   
                           xen | CVE-2011-1936    | https://security-tracker.debian.org/tracker/CVE-2011-1936   
                           xen | CVE-2014-2580    | https://security-tracker.debian.org/tracker/CVE-2014-2580   
                           xen | CVE-2014-3672    | https://security-tracker.debian.org/tracker/CVE-2014-3672   
                           xen | CVE-2015-8553    | https://security-tracker.debian.org/tracker/CVE-2015-8553   
                           xen | CVE-2015-8550    | https://security-tracker.debian.org/tracker/CVE-2015-8550   
                           xen | CVE-2015-7504    | https://security-tracker.debian.org/tracker/CVE-2015-7504   
                           xen | CVE-2016-9383    | https://security-tracker.debian.org/tracker/CVE-2016-9383   
                           xen | CVE-2016-9380    | https://security-tracker.debian.org/tracker/CVE-2016-9380   
                           xen | CVE-2016-9386    | https://security-tracker.debian.org/tracker/CVE-2016-9386   
                           xen | CVE-2016-9379    | https://security-tracker.debian.org/tracker/CVE-2016-9379   
                           xen | CVE-2016-3960    | https://security-tracker.debian.org/tracker/CVE-2016-3960   
                           xen | CVE-2016-7092    | https://security-tracker.debian.org/tracker/CVE-2016-7092   
                           xen | CVE-2017-7228    | https://security-tracker.debian.org/tracker/CVE-2017-7228   
                           xen | CVE-2017-12137   | https://security-tracker.debian.org/tracker/CVE-2017-12137  
                           xen | CVE-2017-12135   | https://security-tracker.debian.org/tracker/CVE-2017-12135  
                           xen | CVE-2017-12134   | https://security-tracker.debian.org/tracker/CVE-2017-12134  
                           xen | CVE-2018-8897    | https://security-tracker.debian.org/tracker/CVE-2018-8897   
                           xen | CVE-2018-5244    | https://security-tracker.debian.org/tracker/CVE-2018-5244   
                           xen | CVE-2021-28039   | https://security-tracker.debian.org/tracker/CVE-2021-28039  
                           xen | CVE-2021-26313   | https://security-tracker.debian.org/tracker/CVE-2021-26313  
                           xen | CVE-2021-26314   | https://security-tracker.debian.org/tracker/CVE-2021-26314  
                           xen | CVE-2021-28707   | https://security-tracker.debian.org/tracker/CVE-2021-28707  
                           xen | CVE-2021-28704   | https://security-tracker.debian.org/tracker/CVE-2021-28704  
                           xen | CVE-2021-28702   | https://security-tracker.debian.org/tracker/CVE-2021-28702  
                           xen | CVE-2021-28713   | https://security-tracker.debian.org/tracker/CVE-2021-28713  
                           xen | CVE-2021-28712   | https://security-tracker.debian.org/tracker/CVE-2021-28712  
                           xen | CVE-2021-28703   | https://security-tracker.debian.org/tracker/CVE-2021-28703  
                           xen | CVE-2021-28708   | https://security-tracker.debian.org/tracker/CVE-2021-28708  
                           xen | CVE-2021-28700   | https://security-tracker.debian.org/tracker/CVE-2021-28700  
                           xen | CVE-2021-28701   | https://security-tracker.debian.org/tracker/CVE-2021-28701  
                           xen | CVE-2021-28711   | https://security-tracker.debian.org/tracker/CVE-2021-28711  
                           xen | CVE-2021-28696   | https://security-tracker.debian.org/tracker/CVE-2021-28696  
                           xen | CVE-2021-28697   | https://security-tracker.debian.org/tracker/CVE-2021-28697  
                           xen | CVE-2021-28690   | https://security-tracker.debian.org/tracker/CVE-2021-28690  
                           xen | CVE-2021-28695   | https://security-tracker.debian.org/tracker/CVE-2021-28695  
                           xen | CVE-2021-28699   | https://security-tracker.debian.org/tracker/CVE-2021-28699  
                           xen | CVE-2021-28694   | https://security-tracker.debian.org/tracker/CVE-2021-28694  
                           xen | CVE-2021-28693   | https://security-tracker.debian.org/tracker/CVE-2021-28693  
                           xen | CVE-2021-28698   | https://security-tracker.debian.org/tracker/CVE-2021-28698  
                           xen | CVE-2021-28687   | https://security-tracker.debian.org/tracker/CVE-2021-28687  
                           xen | CVE-2021-28692   | https://security-tracker.debian.org/tracker/CVE-2021-28692  
                           xen | CVE-2022-40982   | https://security-tracker.debian.org/tracker/CVE-2022-40982  
                           xen | CVE-2022-42325   | https://security-tracker.debian.org/tracker/CVE-2022-42325  
                           xen | CVE-2022-42311   | https://security-tracker.debian.org/tracker/CVE-2022-42311  
                           xen | CVE-2022-42321   | https://security-tracker.debian.org/tracker/CVE-2022-42321  
                           xen | CVE-2022-42313   | https://security-tracker.debian.org/tracker/CVE-2022-42313  
                           xen | CVE-2022-42333   | https://security-tracker.debian.org/tracker/CVE-2022-42333  
                           xen | CVE-2022-42315   | https://security-tracker.debian.org/tracker/CVE-2022-42315  
                           xen | CVE-2022-42316   | https://security-tracker.debian.org/tracker/CVE-2022-42316  
                           xen | CVE-2022-42314   | https://security-tracker.debian.org/tracker/CVE-2022-42314  
                           xen | CVE-2022-42326   | https://security-tracker.debian.org/tracker/CVE-2022-42326  
                           xen | CVE-2022-42318   | https://security-tracker.debian.org/tracker/CVE-2022-42318  
                           xen | CVE-2022-42317   | https://security-tracker.debian.org/tracker/CVE-2022-42317  
                           xen | CVE-2022-42312   | https://security-tracker.debian.org/tracker/CVE-2022-42312  
                           xen | CVE-2022-42320   | https://security-tracker.debian.org/tracker/CVE-2022-42320  
                           xen | CVE-2022-42309   | https://security-tracker.debian.org/tracker/CVE-2022-42309  
                           xen | CVE-2022-42332   | https://security-tracker.debian.org/tracker/CVE-2022-42332  
                           xen | CVE-2022-42324   | https://security-tracker.debian.org/tracker/CVE-2022-42324  
                           xen | CVE-2022-42331   | https://security-tracker.debian.org/tracker/CVE-2022-42331  
                           xen | CVE-2022-42322   | https://security-tracker.debian.org/tracker/CVE-2022-42322  
                           xen | CVE-2022-42319   | https://security-tracker.debian.org/tracker/CVE-2022-42319  
                           xen | CVE-2022-42323   | https://security-tracker.debian.org/tracker/CVE-2022-42323  
                           xen | CVE-2022-42334   | https://security-tracker.debian.org/tracker/CVE-2022-42334  
                           xen | CVE-2022-4949    | https://security-tracker.debian.org/tracker/CVE-2022-4949   
                           xen | CVE-2022-29901   | https://security-tracker.debian.org/tracker/CVE-2022-29901  
                           xen | CVE-2022-29900   | https://security-tracker.debian.org/tracker/CVE-2022-29900  
                           xen | CVE-2022-33743   | https://security-tracker.debian.org/tracker/CVE-2022-33743  
                           xen | CVE-2022-33745   | https://security-tracker.debian.org/tracker/CVE-2022-33745  
                           xen | CVE-2022-33742   | https://security-tracker.debian.org/tracker/CVE-2022-33742  
                           xen | CVE-2022-33747   | https://security-tracker.debian.org/tracker/CVE-2022-33747  
                           xen | CVE-2022-33748   | https://security-tracker.debian.org/tracker/CVE-2022-33748  
                           xen | CVE-2022-33746   | https://security-tracker.debian.org/tracker/CVE-2022-33746  
                           xen | CVE-2022-33741   | https://security-tracker.debian.org/tracker/CVE-2022-33741  
                           xen | CVE-2022-33740   | https://security-tracker.debian.org/tracker/CVE-2022-33740  
                           xen | CVE-2022-23824   | https://security-tracker.debian.org/tracker/CVE-2022-23824  
                           xen | CVE-2022-23960   | https://security-tracker.debian.org/tracker/CVE-2022-23960  
                           xen | CVE-2022-21127   | https://security-tracker.debian.org/tracker/CVE-2022-21127  
                           xen | CVE-2022-21166   | https://security-tracker.debian.org/tracker/CVE-2022-21166  
                           xen | CVE-2022-21125   | https://security-tracker.debian.org/tracker/CVE-2022-21125  
                           xen | CVE-2022-21123   | https://security-tracker.debian.org/tracker/CVE-2022-21123  
                           xen | CVE-2022-26362   | https://security-tracker.debian.org/tracker/CVE-2022-26362  
                           xen | CVE-2022-26361   | https://security-tracker.debian.org/tracker/CVE-2022-26361  
                           xen | CVE-2022-26364   | https://security-tracker.debian.org/tracker/CVE-2022-26364  
                           xen | CVE-2022-26357   | https://security-tracker.debian.org/tracker/CVE-2022-26357  
                           xen | CVE-2022-26359   | https://security-tracker.debian.org/tracker/CVE-2022-26359  
                           xen | CVE-2022-26363   | https://security-tracker.debian.org/tracker/CVE-2022-26363  
                           xen | CVE-2022-26358   | https://security-tracker.debian.org/tracker/CVE-2022-26358  
                           xen | CVE-2022-26360   | https://security-tracker.debian.org/tracker/CVE-2022-26360  
                           xen | CVE-2022-26365   | https://security-tracker.debian.org/tracker/CVE-2022-26365  
                           xen | CVE-2022-23039   | https://security-tracker.debian.org/tracker/CVE-2022-23039  
                           xen | CVE-2022-23035   | https://security-tracker.debian.org/tracker/CVE-2022-23035  
                           xen | CVE-2022-23038   | https://security-tracker.debian.org/tracker/CVE-2022-23038  
                           xen | CVE-2022-23037   | https://security-tracker.debian.org/tracker/CVE-2022-23037  
                           xen | CVE-2022-23033   | https://security-tracker.debian.org/tracker/CVE-2022-23033  
                           xen | CVE-2022-23041   | https://security-tracker.debian.org/tracker/CVE-2022-23041  
                           xen | CVE-2022-23036   | https://security-tracker.debian.org/tracker/CVE-2022-23036  
                           xen | CVE-2022-23042   | https://security-tracker.debian.org/tracker/CVE-2022-23042  
                           xen | CVE-2022-23040   | https://security-tracker.debian.org/tracker/CVE-2022-23040  
                           xen | CVE-2023-20588   | https://security-tracker.debian.org/tracker/CVE-2023-20588  
                           xen | CVE-2023-34320   | https://security-tracker.debian.org/tracker/CVE-2023-34320  
                           xen | CVE-2023-34322   | https://security-tracker.debian.org/tracker/CVE-2023-34322  
                           xen | CVE-2023-34323   | https://security-tracker.debian.org/tracker/CVE-2023-34323  
                           xen | CVE-2023-34325   | https://security-tracker.debian.org/tracker/CVE-2023-34325  
                           xen | CVE-2023-34324   | https://security-tracker.debian.org/tracker/CVE-2023-34324  
                           xen | CVE-2023-34319   | https://security-tracker.debian.org/tracker/CVE-2023-34319  
                           xen | CVE-2023-34326   | https://security-tracker.debian.org/tracker/CVE-2023-34326  
                           xen | CVE-2023-34327   | https://security-tracker.debian.org/tracker/CVE-2023-34327  
                           xen | CVE-2023-34321   | https://security-tracker.debian.org/tracker/CVE-2023-34321  
                           xen | CVE-2023-4949    | https://security-tracker.debian.org/tracker/CVE-2023-4949   
                           xen | CVE-2023-46835   | https://security-tracker.debian.org/tracker/CVE-2023-46835  
                           xen | CVE-2023-46837   | https://security-tracker.debian.org/tracker/CVE-2023-46837  
                           xen | CVE-2023-46836   | https://security-tracker.debian.org/tracker/CVE-2023-46836  
                        xerces | CVE-2012-0880    | https://security-tracker.debian.org/tracker/CVE-2012-0880   
                          yajl | CVE-2023-33460   | https://security-tracker.debian.org/tracker/CVE-2023-33460  
                          yasm | CVE-2021-33465   | https://security-tracker.debian.org/tracker/CVE-2021-33465  
                          yasm | CVE-2021-33463   | https://security-tracker.debian.org/tracker/CVE-2021-33463  
                          yasm | CVE-2021-33462   | https://security-tracker.debian.org/tracker/CVE-2021-33462  
                          yasm | CVE-2021-33464   | https://security-tracker.debian.org/tracker/CVE-2021-33464  
                          yasm | CVE-2021-33457   | https://security-tracker.debian.org/tracker/CVE-2021-33457  
                          yasm | CVE-2021-33456   | https://security-tracker.debian.org/tracker/CVE-2021-33456  
                          yasm | CVE-2021-33454   | https://security-tracker.debian.org/tracker/CVE-2021-33454  
                          yasm | CVE-2021-33468   | https://security-tracker.debian.org/tracker/CVE-2021-33468  
                          yasm | CVE-2021-33458   | https://security-tracker.debian.org/tracker/CVE-2021-33458  
                          yasm | CVE-2021-33467   | https://security-tracker.debian.org/tracker/CVE-2021-33467  
                          yasm | CVE-2021-33459   | https://security-tracker.debian.org/tracker/CVE-2021-33459  
                          yasm | CVE-2021-33460   | https://security-tracker.debian.org/tracker/CVE-2021-33460  
                          yasm | CVE-2021-33455   | https://security-tracker.debian.org/tracker/CVE-2021-33455  
                          yasm | CVE-2021-33466   | https://security-tracker.debian.org/tracker/CVE-2021-33466  
                          yasm | CVE-2021-33461   | https://security-tracker.debian.org/tracker/CVE-2021-33461  
                          yasm | CVE-2023-51258   | https://security-tracker.debian.org/tracker/CVE-2023-51258  
                          yasm | CVE-2023-31974   | https://security-tracker.debian.org/tracker/CVE-2023-31974  
                          yasm | CVE-2023-31973   | https://security-tracker.debian.org/tracker/CVE-2023-31973  
                          yasm | CVE-2023-31972   | https://security-tracker.debian.org/tracker/CVE-2023-31972  
                           zip | CVE-2018-13410   | https://security-tracker.debian.org/tracker/CVE-2018-13410  

CVEs for the '2024.02.x' branch
-------------------------------

             name              |       CVE        |                             link                            
-------------------------------+------------------+--------------------------------------------------------------
                        apache | CVE-1999-1412    | https://security-tracker.debian.org/tracker/CVE-1999-1412   
                        apache | CVE-1999-0678    | https://security-tracker.debian.org/tracker/CVE-1999-0678   
                        apache | CVE-1999-0236    | https://security-tracker.debian.org/tracker/CVE-1999-0236   
                        apache | CVE-1999-0289    | https://security-tracker.debian.org/tracker/CVE-1999-0289   
                        apache | CVE-1999-1237    | https://security-tracker.debian.org/tracker/CVE-1999-1237   
                        apache | CVE-2007-0450    | https://security-tracker.debian.org/tracker/CVE-2007-0450   
                        apache | CVE-2007-0086    | https://security-tracker.debian.org/tracker/CVE-2007-0086   
                        apache | CVE-2007-6422    | https://security-tracker.debian.org/tracker/CVE-2007-6422   
                        apache | CVE-2007-6421    | https://security-tracker.debian.org/tracker/CVE-2007-6421   
                        apache | CVE-2007-6423    | https://security-tracker.debian.org/tracker/CVE-2007-6423   
                        apache | CVE-2008-2168    | https://security-tracker.debian.org/tracker/CVE-2008-2168   
                        apache | CVE-2010-0425    | https://security-tracker.debian.org/tracker/CVE-2010-0425   
                      apparmor | CVE-2016-1585    | https://security-tracker.debian.org/tracker/CVE-2016-1585   
                         argus | CVE-2011-3332    | https://security-tracker.debian.org/tracker/CVE-2011-3332   
                         asn1c | CVE-2017-12966   | https://security-tracker.debian.org/tracker/CVE-2017-12966  
                         asn1c | CVE-2020-23911   | https://security-tracker.debian.org/tracker/CVE-2020-23911  
                         asn1c | CVE-2020-23910   | https://security-tracker.debian.org/tracker/CVE-2020-23910  
                          atop | CVE-2011-3618    | https://security-tracker.debian.org/tracker/CVE-2011-3618   
                         avahi | CVE-2021-3468    | https://security-tracker.debian.org/tracker/CVE-2021-3468   
                         avahi | CVE-2023-38472   | https://security-tracker.debian.org/tracker/CVE-2023-38472  
                         avahi | CVE-2023-38469   | https://security-tracker.debian.org/tracker/CVE-2023-38469  
                         avahi | CVE-2023-38470   | https://security-tracker.debian.org/tracker/CVE-2023-38470  
                         avahi | CVE-2023-38473   | https://security-tracker.debian.org/tracker/CVE-2023-38473  
                         avahi | CVE-2023-38471   | https://security-tracker.debian.org/tracker/CVE-2023-38471  
                     belle-sip | CVE-2021-33056   | https://security-tracker.debian.org/tracker/CVE-2021-33056  
                     belle-sip | CVE-2021-43610   | https://security-tracker.debian.org/tracker/CVE-2021-43610  
                     belle-sip | CVE-2021-43611   | https://security-tracker.debian.org/tracker/CVE-2021-43611  
                        bento4 | CVE-2020-23332   | https://security-tracker.debian.org/tracker/CVE-2020-23332  
                        bento4 | CVE-2020-23331   | https://security-tracker.debian.org/tracker/CVE-2020-23331  
                        bento4 | CVE-2022-3807    | https://security-tracker.debian.org/tracker/CVE-2022-3807   
                    berkeleydb | CVE-2017-3604    | https://security-tracker.debian.org/tracker/CVE-2017-3604   
                    berkeleydb | CVE-2017-3614    | https://security-tracker.debian.org/tracker/CVE-2017-3614   
                    berkeleydb | CVE-2017-3610    | https://security-tracker.debian.org/tracker/CVE-2017-3610   
                    berkeleydb | CVE-2017-3609    | https://security-tracker.debian.org/tracker/CVE-2017-3609   
                    berkeleydb | CVE-2017-3616    | https://security-tracker.debian.org/tracker/CVE-2017-3616   
                    berkeleydb | CVE-2017-3605    | https://security-tracker.debian.org/tracker/CVE-2017-3605   
                    berkeleydb | CVE-2017-3608    | https://security-tracker.debian.org/tracker/CVE-2017-3608   
                    berkeleydb | CVE-2017-3611    | https://security-tracker.debian.org/tracker/CVE-2017-3611   
                    berkeleydb | CVE-2017-3613    | https://security-tracker.debian.org/tracker/CVE-2017-3613   
                    berkeleydb | CVE-2017-3617    | https://security-tracker.debian.org/tracker/CVE-2017-3617   
                    berkeleydb | CVE-2017-3607    | https://security-tracker.debian.org/tracker/CVE-2017-3607   
                    berkeleydb | CVE-2017-3612    | https://security-tracker.debian.org/tracker/CVE-2017-3612   
                    berkeleydb | CVE-2017-3615    | https://security-tracker.debian.org/tracker/CVE-2017-3615   
                    berkeleydb | CVE-2017-3606    | https://security-tracker.debian.org/tracker/CVE-2017-3606   
                    berkeleydb | CVE-2019-2708    | https://security-tracker.debian.org/tracker/CVE-2019-2708   
                    berkeleydb | CVE-2020-2981    | https://security-tracker.debian.org/tracker/CVE-2020-2981   
                      binutils | CVE-2023-1972    | https://security-tracker.debian.org/tracker/CVE-2023-1972   
                      binutils | CVE-2023-25588   | https://security-tracker.debian.org/tracker/CVE-2023-25588  
                      binutils | CVE-2023-25586   | https://security-tracker.debian.org/tracker/CVE-2023-25586  
                      binutils | CVE-2023-25585   | https://security-tracker.debian.org/tracker/CVE-2023-25585  
                       bitcoin | CVE-2012-1909    | https://security-tracker.debian.org/tracker/CVE-2012-1909   
                       bitcoin | CVE-2012-4682    | https://security-tracker.debian.org/tracker/CVE-2012-4682   
                       bitcoin | CVE-2012-4683    | https://security-tracker.debian.org/tracker/CVE-2012-4683   
                       bitcoin | CVE-2013-3220    | https://security-tracker.debian.org/tracker/CVE-2013-3220   
                       bitcoin | CVE-2013-2293    | https://security-tracker.debian.org/tracker/CVE-2013-2293   
                       bitcoin | CVE-2013-2273    | https://security-tracker.debian.org/tracker/CVE-2013-2273   
                       bitcoin | CVE-2013-2272    | https://security-tracker.debian.org/tracker/CVE-2013-2272   
                       bitcoin | CVE-2013-2292    | https://security-tracker.debian.org/tracker/CVE-2013-2292   
                       bitcoin | CVE-2023-50428   | https://security-tracker.debian.org/tracker/CVE-2023-50428  
                  bluez5_utils | CVE-2020-24490   | https://security-tracker.debian.org/tracker/CVE-2020-24490  
          bluez5_utils-headers | CVE-2020-24490   | https://security-tracker.debian.org/tracker/CVE-2020-24490  
                        bsdiff | CVE-2020-14315   | https://security-tracker.debian.org/tracker/CVE-2020-14315  
                       busybox | CVE-2023-42363   | https://security-tracker.debian.org/tracker/CVE-2023-42363  
                       busybox | CVE-2023-42366   | https://security-tracker.debian.org/tracker/CVE-2023-42366  
                       busybox | CVE-2023-42364   | https://security-tracker.debian.org/tracker/CVE-2023-42364  
                       busybox | CVE-2023-42365   | https://security-tracker.debian.org/tracker/CVE-2023-42365  
                        bwm-ng | CVE-2023-26129   | https://security-tracker.debian.org/tracker/CVE-2023-26129  
                      composer | CVE-2023-43655   | https://security-tracker.debian.org/tracker/CVE-2023-43655  
                      composer | CVE-2024-24821   | https://security-tracker.debian.org/tracker/CVE-2024-24821  
                     coreutils | CVE-2016-2781    | https://security-tracker.debian.org/tracker/CVE-2016-2781   
                     coreutils | CVE-2024-0684    | https://security-tracker.debian.org/tracker/CVE-2024-0684   
                          cpio | CVE-2010-4226    | https://security-tracker.debian.org/tracker/CVE-2010-4226   
                          cpio | CVE-2023-7216    | https://security-tracker.debian.org/tracker/CVE-2023-7216   
                      cryptopp | CVE-2023-50980   | https://security-tracker.debian.org/tracker/CVE-2023-50980  
                      cryptopp | CVE-2023-50981   | https://security-tracker.debian.org/tracker/CVE-2023-50981  
                      cryptopp | CVE-2023-50979   | https://security-tracker.debian.org/tracker/CVE-2023-50979  
                           cvs | CVE-2017-12836   | https://security-tracker.debian.org/tracker/CVE-2017-12836  
                          dash | CVE-2024-21485   | https://security-tracker.debian.org/tracker/CVE-2024-21485  
                           dht | CVE-2020-36562   | https://security-tracker.debian.org/tracker/CVE-2020-36562  
                        docker | CVE-2014-8178    | https://security-tracker.debian.org/tracker/CVE-2014-8178   
                        docker | CVE-2014-8179    | https://security-tracker.debian.org/tracker/CVE-2014-8179   
                        docker | CVE-2014-0048    | https://security-tracker.debian.org/tracker/CVE-2014-0048   
                        docker | CVE-2015-1843    | https://security-tracker.debian.org/tracker/CVE-2015-1843   
                        docker | CVE-2015-3627    | https://security-tracker.debian.org/tracker/CVE-2015-3627   
                        docker | CVE-2015-3631    | https://security-tracker.debian.org/tracker/CVE-2015-3631   
                        docker | CVE-2015-3630    | https://security-tracker.debian.org/tracker/CVE-2015-3630   
                        docker | CVE-2016-3697    | https://security-tracker.debian.org/tracker/CVE-2016-3697   
                        docker | CVE-2017-14992   | https://security-tracker.debian.org/tracker/CVE-2017-14992  
                        docker | CVE-2019-16884   | https://security-tracker.debian.org/tracker/CVE-2019-16884  
                        docker | CVE-2019-13509   | https://security-tracker.debian.org/tracker/CVE-2019-13509  
                        docker | CVE-2019-13139   | https://security-tracker.debian.org/tracker/CVE-2019-13139  
                        docker | CVE-2019-5736    | https://security-tracker.debian.org/tracker/CVE-2019-5736   
                        docker | CVE-2019-15752   | https://security-tracker.debian.org/tracker/CVE-2019-15752  
                        docker | CVE-2020-27534   | https://security-tracker.debian.org/tracker/CVE-2020-27534  
                        docker | CVE-2021-33183   | https://security-tracker.debian.org/tracker/CVE-2021-33183  
                        docker | CVE-2021-3162    | https://security-tracker.debian.org/tracker/CVE-2021-3162   
                        docker | CVE-2021-21285   | https://security-tracker.debian.org/tracker/CVE-2021-21285  
                        docker | CVE-2021-21284   | https://security-tracker.debian.org/tracker/CVE-2021-21284  
                        docker | CVE-2022-25365   | https://security-tracker.debian.org/tracker/CVE-2022-25365  
                        dracut | CVE-2010-4176    | https://security-tracker.debian.org/tracker/CVE-2010-4176   
                          edk2 | CVE-2014-8271    | https://security-tracker.debian.org/tracker/CVE-2014-8271   
                          edk2 | CVE-2014-4860    | https://security-tracker.debian.org/tracker/CVE-2014-4860   
                          edk2 | CVE-2014-4859    | https://security-tracker.debian.org/tracker/CVE-2014-4859   
                          edk2 | CVE-2019-14586   | https://security-tracker.debian.org/tracker/CVE-2019-14586  
                          edk2 | CVE-2019-14553   | https://security-tracker.debian.org/tracker/CVE-2019-14553  
                          edk2 | CVE-2019-14559   | https://security-tracker.debian.org/tracker/CVE-2019-14559  
                          edk2 | CVE-2019-14563   | https://security-tracker.debian.org/tracker/CVE-2019-14563  
                          edk2 | CVE-2019-14587   | https://security-tracker.debian.org/tracker/CVE-2019-14587  
                          edk2 | CVE-2019-14575   | https://security-tracker.debian.org/tracker/CVE-2019-14575  
                          edk2 | CVE-2019-14562   | https://security-tracker.debian.org/tracker/CVE-2019-14562  
                         emlog | CVE-2021-44584   | https://security-tracker.debian.org/tracker/CVE-2021-44584  
                         emlog | CVE-2022-3968    | https://security-tracker.debian.org/tracker/CVE-2022-3968   
                         emlog | CVE-2022-1526    | https://security-tracker.debian.org/tracker/CVE-2022-1526   
                         emlog | CVE-2023-43291   | https://security-tracker.debian.org/tracker/CVE-2023-43291  
                        erlang | CVE-2023-48795   | https://security-tracker.debian.org/tracker/CVE-2023-48795  
                         exiv2 | CVE-2007-6353    | https://security-tracker.debian.org/tracker/CVE-2007-6353   
                        ffmpeg | CVE-2022-3109    | https://security-tracker.debian.org/tracker/CVE-2022-3109   
                        ffmpeg | CVE-2022-48434   | https://security-tracker.debian.org/tracker/CVE-2022-48434  
                        ffmpeg | CVE-2022-3341    | https://security-tracker.debian.org/tracker/CVE-2022-3341   
                        ffmpeg | CVE-2023-47470   | https://security-tracker.debian.org/tracker/CVE-2023-47470  
                        ffmpeg | CVE-2023-46407   | https://security-tracker.debian.org/tracker/CVE-2023-46407  
                        ffmpeg | CVE-2024-22860   | https://security-tracker.debian.org/tracker/CVE-2024-22860  
                        ffmpeg | CVE-2024-22862   | https://security-tracker.debian.org/tracker/CVE-2024-22862  
                        ffmpeg | CVE-2024-22861   | https://security-tracker.debian.org/tracker/CVE-2024-22861  
             freeradius-server | CVE-2002-0318    | https://security-tracker.debian.org/tracker/CVE-2002-0318   
             freeradius-server | CVE-2011-4966    | https://security-tracker.debian.org/tracker/CVE-2011-4966   
                gcc-bare-metal | CVE-2023-4039    | https://security-tracker.debian.org/tracker/CVE-2023-4039   
                   ghostscript | CVE-2023-38560   | https://security-tracker.debian.org/tracker/CVE-2023-38560  
                         gnupg | CVE-2006-3082    | https://security-tracker.debian.org/tracker/CVE-2006-3082   
                         gnupg | CVE-2011-2207    | https://security-tracker.debian.org/tracker/CVE-2011-2207   
                         gnupg | CVE-2015-1606    | https://security-tracker.debian.org/tracker/CVE-2015-1606   
                         gnupg | CVE-2018-12020   | https://security-tracker.debian.org/tracker/CVE-2018-12020  
                         gnupg | CVE-2019-14855   | https://security-tracker.debian.org/tracker/CVE-2019-14855  
                         gnupg | CVE-2019-13050   | https://security-tracker.debian.org/tracker/CVE-2019-13050  
                         gnupg | CVE-2022-34903   | https://security-tracker.debian.org/tracker/CVE-2022-34903  
                         gnupg | CVE-2022-3219    | https://security-tracker.debian.org/tracker/CVE-2022-3219   
                        gnupg2 | CVE-2022-3219    | https://security-tracker.debian.org/tracker/CVE-2022-3219   
                graphicsmagick | CVE-2007-0770    | https://security-tracker.debian.org/tracker/CVE-2007-0770   
                graphicsmagick | CVE-2008-6621    | https://security-tracker.debian.org/tracker/CVE-2008-6621   
                     graphite2 | CVE-2017-5436    | https://security-tracker.debian.org/tracker/CVE-2017-5436   
                          grpc | CVE-2023-1428    | https://security-tracker.debian.org/tracker/CVE-2023-1428   
                          grpc | CVE-2023-33953   | https://security-tracker.debian.org/tracker/CVE-2023-33953  
                          grpc | CVE-2023-44487   | https://security-tracker.debian.org/tracker/CVE-2023-44487  
                          grpc | CVE-2023-4785    | https://security-tracker.debian.org/tracker/CVE-2023-4785   
                          grpc | CVE-2023-32732   | https://security-tracker.debian.org/tracker/CVE-2023-32732  
                         grub2 | CVE-2023-4001    | https://security-tracker.debian.org/tracker/CVE-2023-4001   
                         grub2 | CVE-2024-1048    | https://security-tracker.debian.org/tracker/CVE-2024-1048   
                       haproxy | CVE-2016-2102    | https://security-tracker.debian.org/tracker/CVE-2016-2102   
                       haproxy | CVE-2023-0056    | https://security-tracker.debian.org/tracker/CVE-2023-0056   
                       haproxy | CVE-2023-45539   | https://security-tracker.debian.org/tracker/CVE-2023-45539  
                   imagemagick | CVE-2007-1667    | https://security-tracker.debian.org/tracker/CVE-2007-1667   
                   imagemagick | CVE-2014-9813    | https://security-tracker.debian.org/tracker/CVE-2014-9813   
                   imagemagick | CVE-2014-9822    | https://security-tracker.debian.org/tracker/CVE-2014-9822   
                   imagemagick | CVE-2014-9831    | https://security-tracker.debian.org/tracker/CVE-2014-9831   
                   imagemagick | CVE-2014-9854    | https://security-tracker.debian.org/tracker/CVE-2014-9854   
                   imagemagick | CVE-2014-9814    | https://security-tracker.debian.org/tracker/CVE-2014-9814   
                   imagemagick | CVE-2014-9821    | https://security-tracker.debian.org/tracker/CVE-2014-9821   
                   imagemagick | CVE-2014-9829    | https://security-tracker.debian.org/tracker/CVE-2014-9829   
                   imagemagick | CVE-2014-9806    | https://security-tracker.debian.org/tracker/CVE-2014-9806   
                   imagemagick | CVE-2014-9805    | https://security-tracker.debian.org/tracker/CVE-2014-9805   
                   imagemagick | CVE-2014-9852    | https://security-tracker.debian.org/tracker/CVE-2014-9852   
                   imagemagick | CVE-2014-9808    | https://security-tracker.debian.org/tracker/CVE-2014-9808   
                   imagemagick | CVE-2014-9810    | https://security-tracker.debian.org/tracker/CVE-2014-9810   
                   imagemagick | CVE-2014-9853    | https://security-tracker.debian.org/tracker/CVE-2014-9853   
                   imagemagick | CVE-2014-9807    | https://security-tracker.debian.org/tracker/CVE-2014-9807   
                   imagemagick | CVE-2014-9819    | https://security-tracker.debian.org/tracker/CVE-2014-9819   
                   imagemagick | CVE-2014-9820    | https://security-tracker.debian.org/tracker/CVE-2014-9820   
                   imagemagick | CVE-2014-9823    | https://security-tracker.debian.org/tracker/CVE-2014-9823   
                   imagemagick | CVE-2014-9848    | https://security-tracker.debian.org/tracker/CVE-2014-9848   
                   imagemagick | CVE-2014-9816    | https://security-tracker.debian.org/tracker/CVE-2014-9816   
                   imagemagick | CVE-2014-9817    | https://security-tracker.debian.org/tracker/CVE-2014-9817   
                   imagemagick | CVE-2014-9825    | https://security-tracker.debian.org/tracker/CVE-2014-9825   
                   imagemagick | CVE-2014-9818    | https://security-tracker.debian.org/tracker/CVE-2014-9818   
                   imagemagick | CVE-2014-9804    | https://security-tracker.debian.org/tracker/CVE-2014-9804   
                   imagemagick | CVE-2014-9824    | https://security-tracker.debian.org/tracker/CVE-2014-9824   
                   imagemagick | CVE-2014-9812    | https://security-tracker.debian.org/tracker/CVE-2014-9812   
                   imagemagick | CVE-2014-9811    | https://security-tracker.debian.org/tracker/CVE-2014-9811   
                   imagemagick | CVE-2014-9827    | https://security-tracker.debian.org/tracker/CVE-2014-9827   
                   imagemagick | CVE-2014-9826    | https://security-tracker.debian.org/tracker/CVE-2014-9826   
                   imagemagick | CVE-2014-9815    | https://security-tracker.debian.org/tracker/CVE-2014-9815   
                   imagemagick | CVE-2014-9828    | https://security-tracker.debian.org/tracker/CVE-2014-9828   
                   imagemagick | CVE-2014-9830    | https://security-tracker.debian.org/tracker/CVE-2014-9830   
                   imagemagick | CVE-2014-9809    | https://security-tracker.debian.org/tracker/CVE-2014-9809   
                   imagemagick | CVE-2014-9907    | https://security-tracker.debian.org/tracker/CVE-2014-9907   
                   imagemagick | CVE-2016-10062   | https://security-tracker.debian.org/tracker/CVE-2016-10062  
                   imagemagick | CVE-2016-5118    | https://security-tracker.debian.org/tracker/CVE-2016-5118   
                   imagemagick | CVE-2016-10145   | https://security-tracker.debian.org/tracker/CVE-2016-10145  
                   imagemagick | CVE-2016-10144   | https://security-tracker.debian.org/tracker/CVE-2016-10144  
                   imagemagick | CVE-2016-10146   | https://security-tracker.debian.org/tracker/CVE-2016-10146  
                   imagemagick | CVE-2016-7515    | https://security-tracker.debian.org/tracker/CVE-2016-7515   
                   imagemagick | CVE-2016-7514    | https://security-tracker.debian.org/tracker/CVE-2016-7514   
                   imagemagick | CVE-2016-7530    | https://security-tracker.debian.org/tracker/CVE-2016-7530   
                   imagemagick | CVE-2016-7519    | https://security-tracker.debian.org/tracker/CVE-2016-7519   
                   imagemagick | CVE-2016-7537    | https://security-tracker.debian.org/tracker/CVE-2016-7537   
                   imagemagick | CVE-2016-7523    | https://security-tracker.debian.org/tracker/CVE-2016-7523   
                   imagemagick | CVE-2016-7521    | https://security-tracker.debian.org/tracker/CVE-2016-7521   
                   imagemagick | CVE-2016-7532    | https://security-tracker.debian.org/tracker/CVE-2016-7532   
                   imagemagick | CVE-2016-7538    | https://security-tracker.debian.org/tracker/CVE-2016-7538   
                   imagemagick | CVE-2016-7528    | https://security-tracker.debian.org/tracker/CVE-2016-7528   
                   imagemagick | CVE-2016-7525    | https://security-tracker.debian.org/tracker/CVE-2016-7525   
                   imagemagick | CVE-2016-7520    | https://security-tracker.debian.org/tracker/CVE-2016-7520   
                   imagemagick | CVE-2016-7518    | https://security-tracker.debian.org/tracker/CVE-2016-7518   
                   imagemagick | CVE-2016-7531    | https://security-tracker.debian.org/tracker/CVE-2016-7531   
                   imagemagick | CVE-2016-7522    | https://security-tracker.debian.org/tracker/CVE-2016-7522   
                   imagemagick | CVE-2016-7517    | https://security-tracker.debian.org/tracker/CVE-2016-7517   
                   imagemagick | CVE-2016-7524    | https://security-tracker.debian.org/tracker/CVE-2016-7524   
                   imagemagick | CVE-2016-7536    | https://security-tracker.debian.org/tracker/CVE-2016-7536   
                   imagemagick | CVE-2016-7529    | https://security-tracker.debian.org/tracker/CVE-2016-7529   
                   imagemagick | CVE-2016-7527    | https://security-tracker.debian.org/tracker/CVE-2016-7527   
                   imagemagick | CVE-2016-7533    | https://security-tracker.debian.org/tracker/CVE-2016-7533   
                   imagemagick | CVE-2016-7534    | https://security-tracker.debian.org/tracker/CVE-2016-7534   
                   imagemagick | CVE-2016-7516    | https://security-tracker.debian.org/tracker/CVE-2016-7516   
                   imagemagick | CVE-2016-7526    | https://security-tracker.debian.org/tracker/CVE-2016-7526   
                   imagemagick | CVE-2016-7535    | https://security-tracker.debian.org/tracker/CVE-2016-7535   
                   imagemagick | CVE-2016-7513    | https://security-tracker.debian.org/tracker/CVE-2016-7513   
                   imagemagick | CVE-2017-5509    | https://security-tracker.debian.org/tracker/CVE-2017-5509   
                   imagemagick | CVE-2017-5510    | https://security-tracker.debian.org/tracker/CVE-2017-5510   
                   imagemagick | CVE-2017-5506    | https://security-tracker.debian.org/tracker/CVE-2017-5506   
                   imagemagick | CVE-2017-5511    | https://security-tracker.debian.org/tracker/CVE-2017-5511   
                   imagemagick | CVE-2023-5341    | https://security-tracker.debian.org/tracker/CVE-2023-5341   
                        jasper | CVE-2023-51257   | https://security-tracker.debian.org/tracker/CVE-2023-51257  
                        jquery | CVE-2007-2379    | https://security-tracker.debian.org/tracker/CVE-2007-2379   
                       kvmtool | CVE-2021-45464   | https://security-tracker.debian.org/tracker/CVE-2021-45464  
                         libao | CVE-2017-11548   | https://security-tracker.debian.org/tracker/CVE-2017-11548  
                  libfreeimage | CVE-2019-12211   | https://security-tracker.debian.org/tracker/CVE-2019-12211  
                  libfreeimage | CVE-2019-12214   | https://security-tracker.debian.org/tracker/CVE-2019-12214  
                  libfreeimage | CVE-2019-12212   | https://security-tracker.debian.org/tracker/CVE-2019-12212  
                  libfreeimage | CVE-2019-12213   | https://security-tracker.debian.org/tracker/CVE-2019-12213  
                  libfreeimage | CVE-2020-21426   | https://security-tracker.debian.org/tracker/CVE-2020-21426  
                  libfreeimage | CVE-2020-21428   | https://security-tracker.debian.org/tracker/CVE-2020-21428  
                  libfreeimage | CVE-2020-21427   | https://security-tracker.debian.org/tracker/CVE-2020-21427  
                  libfreeimage | CVE-2021-33367   | https://security-tracker.debian.org/tracker/CVE-2021-33367  
                  libfreeimage | CVE-2023-47993   | https://security-tracker.debian.org/tracker/CVE-2023-47993  
                  libfreeimage | CVE-2023-47992   | https://security-tracker.debian.org/tracker/CVE-2023-47992  
                  libfreeimage | CVE-2023-47997   | https://security-tracker.debian.org/tracker/CVE-2023-47997  
                  libfreeimage | CVE-2023-47994   | https://security-tracker.debian.org/tracker/CVE-2023-47994  
                  libfreeimage | CVE-2023-47995   | https://security-tracker.debian.org/tracker/CVE-2023-47995  
                  libfreeimage | CVE-2023-47996   | https://security-tracker.debian.org/tracker/CVE-2023-47996  
                       libgtk2 | CVE-2014-1949    | https://security-tracker.debian.org/tracker/CVE-2014-1949   
                     libiberty | CVE-2012-3509    | https://security-tracker.debian.org/tracker/CVE-2012-3509   
                     libiberty | CVE-2016-4487    | https://security-tracker.debian.org/tracker/CVE-2016-4487   
                     libiberty | CVE-2016-4492    | https://security-tracker.debian.org/tracker/CVE-2016-4492   
                     libiberty | CVE-2016-4491    | https://security-tracker.debian.org/tracker/CVE-2016-4491   
                     libiberty | CVE-2016-4490    | https://security-tracker.debian.org/tracker/CVE-2016-4490   
                     libiberty | CVE-2016-4489    | https://security-tracker.debian.org/tracker/CVE-2016-4489   
                     libiberty | CVE-2016-4488    | https://security-tracker.debian.org/tracker/CVE-2016-4488   
                     libiberty | CVE-2016-4493    | https://security-tracker.debian.org/tracker/CVE-2016-4493   
                     libiberty | CVE-2016-6131    | https://security-tracker.debian.org/tracker/CVE-2016-6131   
                     libiberty | CVE-2016-2226    | https://security-tracker.debian.org/tracker/CVE-2016-2226   
                       libkrb5 | CVE-1999-0713    | https://security-tracker.debian.org/tracker/CVE-1999-0713   
                       libkrb5 | CVE-1999-0143    | https://security-tracker.debian.org/tracker/CVE-1999-0143   
                       libkrb5 | CVE-2007-5894    | https://security-tracker.debian.org/tracker/CVE-2007-5894   
                       libkrb5 | CVE-2007-3149    | https://security-tracker.debian.org/tracker/CVE-2007-3149   
                       libkrb5 | CVE-2007-5902    | https://security-tracker.debian.org/tracker/CVE-2007-5902   
                       libkrb5 | CVE-2009-0844    | https://security-tracker.debian.org/tracker/CVE-2009-0844   
                        libmad | CVE-2018-7263    | https://security-tracker.debian.org/tracker/CVE-2018-7263   
                      libmpeg2 | CVE-2022-37416   | https://security-tracker.debian.org/tracker/CVE-2022-37416  
                      libplist | CVE-2017-5834    | https://security-tracker.debian.org/tracker/CVE-2017-5834   
                      libplist | CVE-2017-5835    | https://security-tracker.debian.org/tracker/CVE-2017-5835   
                      libplist | CVE-2017-5836    | https://security-tracker.debian.org/tracker/CVE-2017-5836   
                        libraw | CVE-2020-22628   | https://security-tracker.debian.org/tracker/CVE-2020-22628  
                        libraw | CVE-2023-1729    | https://security-tracker.debian.org/tracker/CVE-2023-1729   
                    libsndfile | CVE-2022-33065   | https://security-tracker.debian.org/tracker/CVE-2022-33065  
                    libtorrent | CVE-2009-1760    | https://security-tracker.debian.org/tracker/CVE-2009-1760   
                    libtorrent | CVE-2016-5301    | https://security-tracker.debian.org/tracker/CVE-2016-5301   
                       libvirt | CVE-2014-8136    | https://security-tracker.debian.org/tracker/CVE-2014-8136   
                       libvirt | CVE-2014-8135    | https://security-tracker.debian.org/tracker/CVE-2014-8135   
                       libvirt | CVE-2015-5313    | https://security-tracker.debian.org/tracker/CVE-2015-5313   
                       libvirt | CVE-2018-6764    | https://security-tracker.debian.org/tracker/CVE-2018-6764   
                       libvirt | CVE-2018-5748    | https://security-tracker.debian.org/tracker/CVE-2018-5748   
                       libvirt | CVE-2023-3750    | https://security-tracker.debian.org/tracker/CVE-2023-3750   
                         lrzip | CVE-2022-33067   | https://security-tracker.debian.org/tracker/CVE-2022-33067  
                         lrzip | CVE-2023-39741   | https://security-tracker.debian.org/tracker/CVE-2023-39741  
                         lrzsz | CVE-2018-10195   | https://security-tracker.debian.org/tracker/CVE-2018-10195  
                           lua | CVE-2014-5461    | https://security-tracker.debian.org/tracker/CVE-2014-5461   
                           lua | CVE-2021-43519   | https://security-tracker.debian.org/tracker/CVE-2021-43519  
                       mbedtls | CVE-2021-45451   | https://security-tracker.debian.org/tracker/CVE-2021-45451  
                       mbedtls | CVE-2021-36647   | https://security-tracker.debian.org/tracker/CVE-2021-36647  
                       mbedtls | CVE-2021-43666   | https://security-tracker.debian.org/tracker/CVE-2021-43666  
                       mbedtls | CVE-2023-52353   | https://security-tracker.debian.org/tracker/CVE-2023-52353  
                         mdadm | CVE-2023-28736   | https://security-tracker.debian.org/tracker/CVE-2023-28736  
                         mdadm | CVE-2023-28938   | https://security-tracker.debian.org/tracker/CVE-2023-28938  
                   micropython | CVE-2023-7152    | https://security-tracker.debian.org/tracker/CVE-2023-7152   
                       mongodb | CVE-2014-8180    | https://security-tracker.debian.org/tracker/CVE-2014-8180   
                       mongodb | CVE-2017-2665    | https://security-tracker.debian.org/tracker/CVE-2017-2665   
                         mp4v2 | CVE-2023-33716   | https://security-tracker.debian.org/tracker/CVE-2023-33716  
                         mp4v2 | CVE-2023-33719   | https://security-tracker.debian.org/tracker/CVE-2023-33719  
                         mp4v2 | CVE-2023-33718   | https://security-tracker.debian.org/tracker/CVE-2023-33718  
                         mp4v2 | CVE-2023-33717   | https://security-tracker.debian.org/tracker/CVE-2023-33717  
                          mutt | CVE-2011-1429    | https://security-tracker.debian.org/tracker/CVE-2011-1429   
                          nasm | CVE-2022-46456   | https://security-tracker.debian.org/tracker/CVE-2022-46456  
                       netdata | CVE-2023-22497   | https://security-tracker.debian.org/tracker/CVE-2023-22497  
                       netdata | CVE-2023-22496   | https://security-tracker.debian.org/tracker/CVE-2023-22496  
                         nginx | CVE-2023-44487   | https://security-tracker.debian.org/tracker/CVE-2023-44487  
                         ninja | CVE-2021-4336    | https://security-tracker.debian.org/tracker/CVE-2021-4336   
                           ntp | CVE-2014-9750    | https://security-tracker.debian.org/tracker/CVE-2014-9750   
                           ntp | CVE-2014-9751    | https://security-tracker.debian.org/tracker/CVE-2014-9751   
                           ntp | CVE-2015-7691    | https://security-tracker.debian.org/tracker/CVE-2015-7691   
                           ntp | CVE-2015-7692    | https://security-tracker.debian.org/tracker/CVE-2015-7692   
                           ntp | CVE-2015-7977    | https://security-tracker.debian.org/tracker/CVE-2015-7977   
                           ntp | CVE-2015-7973    | https://security-tracker.debian.org/tracker/CVE-2015-7973   
                           ntp | CVE-2015-7974    | https://security-tracker.debian.org/tracker/CVE-2015-7974   
                           ntp | CVE-2015-7703    | https://security-tracker.debian.org/tracker/CVE-2015-7703   
                           ntp | CVE-2015-7705    | https://security-tracker.debian.org/tracker/CVE-2015-7705   
                           ntp | CVE-2015-7701    | https://security-tracker.debian.org/tracker/CVE-2015-7701   
                           ntp | CVE-2015-7704    | https://security-tracker.debian.org/tracker/CVE-2015-7704   
                           ntp | CVE-2015-7702    | https://security-tracker.debian.org/tracker/CVE-2015-7702   
                           ntp | CVE-2015-7854    | https://security-tracker.debian.org/tracker/CVE-2015-7854   
                           ntp | CVE-2015-7853    | https://security-tracker.debian.org/tracker/CVE-2015-7853   
                           ntp | CVE-2015-7852    | https://security-tracker.debian.org/tracker/CVE-2015-7852   
                           ntp | CVE-2015-7849    | https://security-tracker.debian.org/tracker/CVE-2015-7849   
                           ntp | CVE-2015-7855    | https://security-tracker.debian.org/tracker/CVE-2015-7855   
                           ntp | CVE-2015-7850    | https://security-tracker.debian.org/tracker/CVE-2015-7850   
                           ntp | CVE-2016-2518    | https://security-tracker.debian.org/tracker/CVE-2016-2518   
                           ntp | CVE-2016-4955    | https://security-tracker.debian.org/tracker/CVE-2016-4955   
                           ntp | CVE-2016-4953    | https://security-tracker.debian.org/tracker/CVE-2016-4953   
                           ntp | CVE-2016-4954    | https://security-tracker.debian.org/tracker/CVE-2016-4954   
                           ntp | CVE-2016-4956    | https://security-tracker.debian.org/tracker/CVE-2016-4956   
                           ntp | CVE-2016-7426    | https://security-tracker.debian.org/tracker/CVE-2016-7426   
                           ntp | CVE-2016-7434    | https://security-tracker.debian.org/tracker/CVE-2016-7434   
                           ntp | CVE-2017-6458    | https://security-tracker.debian.org/tracker/CVE-2017-6458   
                           ntp | CVE-2018-7170    | https://security-tracker.debian.org/tracker/CVE-2018-7170   
                           ntp | CVE-2018-7185    | https://security-tracker.debian.org/tracker/CVE-2018-7185   
                           ntp | CVE-2019-11331   | https://security-tracker.debian.org/tracker/CVE-2019-11331  
                           ntp | CVE-2019-8936    | https://security-tracker.debian.org/tracker/CVE-2019-8936   
                           ntp | CVE-2020-13817   | https://security-tracker.debian.org/tracker/CVE-2020-13817  
                           ntp | CVE-2020-11868   | https://security-tracker.debian.org/tracker/CVE-2020-11868  
                    open-iscsi | CVE-2020-13987   | https://security-tracker.debian.org/tracker/CVE-2020-13987  
                       opencv3 | CVE-2019-19624   | https://security-tracker.debian.org/tracker/CVE-2019-19624  
                       opencv3 | CVE-2019-14493   | https://security-tracker.debian.org/tracker/CVE-2019-14493  
                       opencv3 | CVE-2019-15939   | https://security-tracker.debian.org/tracker/CVE-2019-15939  
                       openjdk | CVE-2009-2476    | https://security-tracker.debian.org/tracker/CVE-2009-2476   
                       openjdk | CVE-2009-2475    | https://security-tracker.debian.org/tracker/CVE-2009-2475   
                       openjdk | CVE-2009-2690    | https://security-tracker.debian.org/tracker/CVE-2009-2690   
                       openjdk | CVE-2009-2689    | https://security-tracker.debian.org/tracker/CVE-2009-2689   
                       openjdk | CVE-2009-3881    | https://security-tracker.debian.org/tracker/CVE-2009-3881   
                       openjdk | CVE-2009-3882    | https://security-tracker.debian.org/tracker/CVE-2009-3882   
                       openjdk | CVE-2009-3880    | https://security-tracker.debian.org/tracker/CVE-2009-3880   
                       openjdk | CVE-2009-3884    | https://security-tracker.debian.org/tracker/CVE-2009-3884   
                       openjdk | CVE-2009-3879    | https://security-tracker.debian.org/tracker/CVE-2009-3879   
                       openjdk | CVE-2009-3883    | https://security-tracker.debian.org/tracker/CVE-2009-3883   
                       openjdk | CVE-2009-3728    | https://security-tracker.debian.org/tracker/CVE-2009-3728   
                       openssh | CVE-2007-2768    | https://security-tracker.debian.org/tracker/CVE-2007-2768   
                       openssh | CVE-2008-3844    | https://security-tracker.debian.org/tracker/CVE-2008-3844   
                       openssh | CVE-2014-9278    | https://security-tracker.debian.org/tracker/CVE-2014-9278   
                       openssh | CVE-2023-51767   | https://security-tracker.debian.org/tracker/CVE-2023-51767  
                      openswan | CVE-2019-10155   | https://security-tracker.debian.org/tracker/CVE-2019-10155  
                   openvmtools | CVE-2014-4199    | https://security-tracker.debian.org/tracker/CVE-2014-4199   
                   openvmtools | CVE-2014-4200    | https://security-tracker.debian.org/tracker/CVE-2014-4200   
                   openvmtools | CVE-2021-31693   | https://security-tracker.debian.org/tracker/CVE-2021-31693  
                   openvmtools | CVE-2022-31693   | https://security-tracker.debian.org/tracker/CVE-2022-31693  
                   openvmtools | CVE-2022-22943   | https://security-tracker.debian.org/tracker/CVE-2022-22943  
                   openvmtools | CVE-2023-20867   | https://security-tracker.debian.org/tracker/CVE-2023-20867  
                   openvmtools | CVE-2023-20900   | https://security-tracker.debian.org/tracker/CVE-2023-20900  
                   openvmtools | CVE-2023-34058   | https://security-tracker.debian.org/tracker/CVE-2023-34058  
                   openvmtools | CVE-2023-34057   | https://security-tracker.debian.org/tracker/CVE-2023-34057  
                         p7zip | CVE-2017-17969   | https://security-tracker.debian.org/tracker/CVE-2017-17969  
                         p7zip | CVE-2018-5996    | https://security-tracker.debian.org/tracker/CVE-2018-5996   
                         patch | CVE-2018-6952    | https://security-tracker.debian.org/tracker/CVE-2018-6952   
                         patch | CVE-2019-20633   | https://security-tracker.debian.org/tracker/CVE-2019-20633  
       perl-lwp-protocol-https | CVE-2014-3230    | https://security-tracker.debian.org/tracker/CVE-2014-3230   
                           php | CVE-2007-2728    | https://security-tracker.debian.org/tracker/CVE-2007-2728   
                           php | CVE-2007-3205    | https://security-tracker.debian.org/tracker/CVE-2007-3205   
                           php | CVE-2007-4596    | https://security-tracker.debian.org/tracker/CVE-2007-4596   
                           php | CVE-2022-4900    | https://security-tracker.debian.org/tracker/CVE-2022-4900   
                           php | CVE-2024-4577    | https://security-tracker.debian.org/tracker/CVE-2024-4577   
                           php | CVE-2024-5458    | https://security-tracker.debian.org/tracker/CVE-2024-5458   
                           php | CVE-2024-5585    | https://security-tracker.debian.org/tracker/CVE-2024-5585   
                           php | CVE-2024-2408    | https://security-tracker.debian.org/tracker/CVE-2024-2408   
                       pkgconf | CVE-2023-24056   | https://security-tracker.debian.org/tracker/CVE-2023-24056  
                 powerpc-utils | CVE-2014-8165    | https://security-tracker.debian.org/tracker/CVE-2014-8165   
                       proftpd | CVE-2023-48795   | https://security-tracker.debian.org/tracker/CVE-2023-48795  
           python-cryptography | CVE-2023-49083   | https://security-tracker.debian.org/tracker/CVE-2023-49083  
               python-m2crypto | CVE-2020-25657   | https://security-tracker.debian.org/tracker/CVE-2020-25657  
               python-m2crypto | CVE-2023-50781   | https://security-tracker.debian.org/tracker/CVE-2023-50781  
                     python-py | CVE-2022-42969   | https://security-tracker.debian.org/tracker/CVE-2022-42969  
                python-uvicorn | CVE-2020-7694    | https://security-tracker.debian.org/tracker/CVE-2020-7694   
                          qemu | CVE-2018-18438   | https://security-tracker.debian.org/tracker/CVE-2018-18438  
                          qemu | CVE-2019-12067   | https://security-tracker.debian.org/tracker/CVE-2019-12067  
                          qemu | CVE-2021-20255   | https://security-tracker.debian.org/tracker/CVE-2021-20255  
                          qemu | CVE-2023-6683    | https://security-tracker.debian.org/tracker/CVE-2023-6683   
                          qemu | CVE-2023-6693    | https://security-tracker.debian.org/tracker/CVE-2023-6693   
                          qemu | CVE-2023-2680    | https://security-tracker.debian.org/tracker/CVE-2023-2680   
                          qemu | CVE-2023-5088    | https://security-tracker.debian.org/tracker/CVE-2023-5088   
                          qemu | CVE-2023-1386    | https://security-tracker.debian.org/tracker/CVE-2023-1386   
                          qemu | CVE-2023-3019    | https://security-tracker.debian.org/tracker/CVE-2023-3019   
                          qemu | CVE-2024-3567    | https://security-tracker.debian.org/tracker/CVE-2024-3567   
                       qt6base | CVE-2023-51714   | https://security-tracker.debian.org/tracker/CVE-2023-51714  
                       qt6base | CVE-2023-38197   | https://security-tracker.debian.org/tracker/CVE-2023-38197  
                       qt6base | CVE-2023-34410   | https://security-tracker.debian.org/tracker/CVE-2023-34410  
                       qt6base | CVE-2023-37369   | https://security-tracker.debian.org/tracker/CVE-2023-37369  
                       qt6base | CVE-2023-33285   | https://security-tracker.debian.org/tracker/CVE-2023-33285  
                       qt6base | CVE-2023-32573   | https://security-tracker.debian.org/tracker/CVE-2023-32573  
                       qt6base | CVE-2023-32763   | https://security-tracker.debian.org/tracker/CVE-2023-32763  
                       qt6base | CVE-2023-32762   | https://security-tracker.debian.org/tracker/CVE-2023-32762  
                        quagga | CVE-2016-4049    | https://security-tracker.debian.org/tracker/CVE-2016-4049   
                        quagga | CVE-2017-3224    | https://security-tracker.debian.org/tracker/CVE-2017-3224   
                        quagga | CVE-2021-44038   | https://security-tracker.debian.org/tracker/CVE-2021-44038  
                   resiprocate | CVE-2017-9454    | https://security-tracker.debian.org/tracker/CVE-2017-9454   
                        samba4 | CVE-2011-2411    | https://security-tracker.debian.org/tracker/CVE-2011-2411   
                        samba4 | CVE-2018-14628   | https://security-tracker.debian.org/tracker/CVE-2018-14628  
                        samba4 | CVE-2021-3670    | https://security-tracker.debian.org/tracker/CVE-2021-3670   
                        samba4 | CVE-2022-32743   | https://security-tracker.debian.org/tracker/CVE-2022-32743  
                        samba4 | CVE-2022-1615    | https://security-tracker.debian.org/tracker/CVE-2022-1615   
                        samba4 | CVE-2022-38023   | https://security-tracker.debian.org/tracker/CVE-2022-38023  
                        samba4 | CVE-2022-37967   | https://security-tracker.debian.org/tracker/CVE-2022-37967  
                        samba4 | CVE-2022-37966   | https://security-tracker.debian.org/tracker/CVE-2022-37966  
                           sdl | CVE-2019-7635    | https://security-tracker.debian.org/tracker/CVE-2019-7635   
                           sdl | CVE-2019-7637    | https://security-tracker.debian.org/tracker/CVE-2019-7637   
                           sdl | CVE-2019-7638    | https://security-tracker.debian.org/tracker/CVE-2019-7638   
                           sdl | CVE-2019-7636    | https://security-tracker.debian.org/tracker/CVE-2019-7636   
                           sdl | CVE-2019-13616   | https://security-tracker.debian.org/tracker/CVE-2019-13616  
                           sdl | CVE-2019-14906   | https://security-tracker.debian.org/tracker/CVE-2019-14906  
                           sdl | CVE-2019-7576    | https://security-tracker.debian.org/tracker/CVE-2019-7576   
                           sdl | CVE-2019-7578    | https://security-tracker.debian.org/tracker/CVE-2019-7578   
                           sdl | CVE-2019-7577    | https://security-tracker.debian.org/tracker/CVE-2019-7577   
                           sdl | CVE-2019-7575    | https://security-tracker.debian.org/tracker/CVE-2019-7575   
                           sdl | CVE-2019-7573    | https://security-tracker.debian.org/tracker/CVE-2019-7573   
                           sdl | CVE-2019-7572    | https://security-tracker.debian.org/tracker/CVE-2019-7572   
                           sdl | CVE-2019-7574    | https://security-tracker.debian.org/tracker/CVE-2019-7574   
                           sdl | CVE-2020-14410   | https://security-tracker.debian.org/tracker/CVE-2020-14410  
                           sdl | CVE-2020-14409   | https://security-tracker.debian.org/tracker/CVE-2020-14409  
                        shadow | CVE-2013-4235    | https://security-tracker.debian.org/tracker/CVE-2013-4235   
                          shim | CVE-2023-40548   | https://security-tracker.debian.org/tracker/CVE-2023-40548  
                         smack | CVE-2014-0363    | https://security-tracker.debian.org/tracker/CVE-2014-0363   
                         smack | CVE-2014-0364    | https://security-tracker.debian.org/tracker/CVE-2014-0364   
                         smack | CVE-2016-10027   | https://security-tracker.debian.org/tracker/CVE-2016-10027  
                         spice | CVE-2016-0749    | https://security-tracker.debian.org/tracker/CVE-2016-0749   
                         spice | CVE-2016-2150    | https://security-tracker.debian.org/tracker/CVE-2016-2150   
                         spice | CVE-2018-10893   | https://security-tracker.debian.org/tracker/CVE-2018-10893  
                     syslog-ng | CVE-2022-38725   | https://security-tracker.debian.org/tracker/CVE-2022-38725  
                     tcpreplay | CVE-2023-4256    | https://security-tracker.debian.org/tracker/CVE-2023-4256   
                        thttpd | CVE-2012-5640    | https://security-tracker.debian.org/tracker/CVE-2012-5640   
                          tiff | CVE-2015-7313    | https://security-tracker.debian.org/tracker/CVE-2015-7313   
                          tiff | CVE-2023-6277    | https://security-tracker.debian.org/tracker/CVE-2023-6277   
                          tiff | CVE-2023-6228    | https://security-tracker.debian.org/tracker/CVE-2023-6228   
                          tiff | CVE-2023-52356   | https://security-tracker.debian.org/tracker/CVE-2023-52356  
                          tinc | CVE-2013-1428    | https://security-tracker.debian.org/tracker/CVE-2013-1428   
                           tor | CVE-2016-9079    | https://security-tracker.debian.org/tracker/CVE-2016-9079   
                           tor | CVE-2017-16541   | https://security-tracker.debian.org/tracker/CVE-2017-16541  
                      tpm2-tss | CVE-2023-22745   | https://security-tracker.debian.org/tracker/CVE-2023-22745  
                   uboot-tools | CVE-2022-2347    | https://security-tracker.debian.org/tracker/CVE-2022-2347   
                   uboot-tools | CVE-2022-33103   | https://security-tracker.debian.org/tracker/CVE-2022-33103  
                   uboot-tools | CVE-2022-30767   | https://security-tracker.debian.org/tracker/CVE-2022-30767  
                   uboot-tools | CVE-2022-34835   | https://security-tracker.debian.org/tracker/CVE-2022-34835  
                         unrar | CVE-2022-30333   | https://security-tracker.debian.org/tracker/CVE-2022-30333  
                         unzip | CVE-2021-4217    | https://security-tracker.debian.org/tracker/CVE-2021-4217   
                           upx | CVE-2023-23456   | https://security-tracker.debian.org/tracker/CVE-2023-23456  
                           upx | CVE-2023-23457   | https://security-tracker.debian.org/tracker/CVE-2023-23457  
                  vorbis-tools | CVE-2023-43361   | https://security-tracker.debian.org/tracker/CVE-2023-43361  
                           xen | CVE-2011-3346    | https://security-tracker.debian.org/tracker/CVE-2011-3346   
                           xen | CVE-2011-1936    | https://security-tracker.debian.org/tracker/CVE-2011-1936   
                           xen | CVE-2014-2580    | https://security-tracker.debian.org/tracker/CVE-2014-2580   
                           xen | CVE-2014-3672    | https://security-tracker.debian.org/tracker/CVE-2014-3672   
                           xen | CVE-2015-8553    | https://security-tracker.debian.org/tracker/CVE-2015-8553   
                           xen | CVE-2015-8550    | https://security-tracker.debian.org/tracker/CVE-2015-8550   
                           xen | CVE-2015-7504    | https://security-tracker.debian.org/tracker/CVE-2015-7504   
                           xen | CVE-2016-9383    | https://security-tracker.debian.org/tracker/CVE-2016-9383   
                           xen | CVE-2016-9380    | https://security-tracker.debian.org/tracker/CVE-2016-9380   
                           xen | CVE-2016-9386    | https://security-tracker.debian.org/tracker/CVE-2016-9386   
                           xen | CVE-2016-9379    | https://security-tracker.debian.org/tracker/CVE-2016-9379   
                           xen | CVE-2016-3960    | https://security-tracker.debian.org/tracker/CVE-2016-3960   
                           xen | CVE-2016-7092    | https://security-tracker.debian.org/tracker/CVE-2016-7092   
                           xen | CVE-2017-7228    | https://security-tracker.debian.org/tracker/CVE-2017-7228   
                           xen | CVE-2017-12137   | https://security-tracker.debian.org/tracker/CVE-2017-12137  
                           xen | CVE-2017-12135   | https://security-tracker.debian.org/tracker/CVE-2017-12135  
                           xen | CVE-2017-12134   | https://security-tracker.debian.org/tracker/CVE-2017-12134  
                           xen | CVE-2018-8897    | https://security-tracker.debian.org/tracker/CVE-2018-8897   
                           xen | CVE-2018-5244    | https://security-tracker.debian.org/tracker/CVE-2018-5244   
                           xen | CVE-2021-28039   | https://security-tracker.debian.org/tracker/CVE-2021-28039  
                           xen | CVE-2021-26313   | https://security-tracker.debian.org/tracker/CVE-2021-26313  
                           xen | CVE-2021-26314   | https://security-tracker.debian.org/tracker/CVE-2021-26314  
                           xen | CVE-2021-28707   | https://security-tracker.debian.org/tracker/CVE-2021-28707  
                           xen | CVE-2021-28704   | https://security-tracker.debian.org/tracker/CVE-2021-28704  
                           xen | CVE-2021-28702   | https://security-tracker.debian.org/tracker/CVE-2021-28702  
                           xen | CVE-2021-28713   | https://security-tracker.debian.org/tracker/CVE-2021-28713  
                           xen | CVE-2021-28712   | https://security-tracker.debian.org/tracker/CVE-2021-28712  
                           xen | CVE-2021-28703   | https://security-tracker.debian.org/tracker/CVE-2021-28703  
                           xen | CVE-2021-28708   | https://security-tracker.debian.org/tracker/CVE-2021-28708  
                           xen | CVE-2021-28700   | https://security-tracker.debian.org/tracker/CVE-2021-28700  
                           xen | CVE-2021-28701   | https://security-tracker.debian.org/tracker/CVE-2021-28701  
                           xen | CVE-2021-28711   | https://security-tracker.debian.org/tracker/CVE-2021-28711  
                           xen | CVE-2021-28696   | https://security-tracker.debian.org/tracker/CVE-2021-28696  
                           xen | CVE-2021-28697   | https://security-tracker.debian.org/tracker/CVE-2021-28697  
                           xen | CVE-2021-28690   | https://security-tracker.debian.org/tracker/CVE-2021-28690  
                           xen | CVE-2021-28695   | https://security-tracker.debian.org/tracker/CVE-2021-28695  
                           xen | CVE-2021-28699   | https://security-tracker.debian.org/tracker/CVE-2021-28699  
                           xen | CVE-2021-28694   | https://security-tracker.debian.org/tracker/CVE-2021-28694  
                           xen | CVE-2021-28693   | https://security-tracker.debian.org/tracker/CVE-2021-28693  
                           xen | CVE-2021-28698   | https://security-tracker.debian.org/tracker/CVE-2021-28698  
                           xen | CVE-2021-28687   | https://security-tracker.debian.org/tracker/CVE-2021-28687  
                           xen | CVE-2021-28692   | https://security-tracker.debian.org/tracker/CVE-2021-28692  
                           xen | CVE-2022-40982   | https://security-tracker.debian.org/tracker/CVE-2022-40982  
                           xen | CVE-2022-42325   | https://security-tracker.debian.org/tracker/CVE-2022-42325  
                           xen | CVE-2022-42311   | https://security-tracker.debian.org/tracker/CVE-2022-42311  
                           xen | CVE-2022-42321   | https://security-tracker.debian.org/tracker/CVE-2022-42321  
                           xen | CVE-2022-42313   | https://security-tracker.debian.org/tracker/CVE-2022-42313  
                           xen | CVE-2022-42333   | https://security-tracker.debian.org/tracker/CVE-2022-42333  
                           xen | CVE-2022-42315   | https://security-tracker.debian.org/tracker/CVE-2022-42315  
                           xen | CVE-2022-42316   | https://security-tracker.debian.org/tracker/CVE-2022-42316  
                           xen | CVE-2022-42314   | https://security-tracker.debian.org/tracker/CVE-2022-42314  
                           xen | CVE-2022-42326   | https://security-tracker.debian.org/tracker/CVE-2022-42326  
                           xen | CVE-2022-42318   | https://security-tracker.debian.org/tracker/CVE-2022-42318  
                           xen | CVE-2022-42317   | https://security-tracker.debian.org/tracker/CVE-2022-42317  
                           xen | CVE-2022-42312   | https://security-tracker.debian.org/tracker/CVE-2022-42312  
                           xen | CVE-2022-42320   | https://security-tracker.debian.org/tracker/CVE-2022-42320  
                           xen | CVE-2022-42309   | https://security-tracker.debian.org/tracker/CVE-2022-42309  
                           xen | CVE-2022-42332   | https://security-tracker.debian.org/tracker/CVE-2022-42332  
                           xen | CVE-2022-42324   | https://security-tracker.debian.org/tracker/CVE-2022-42324  
                           xen | CVE-2022-42331   | https://security-tracker.debian.org/tracker/CVE-2022-42331  
                           xen | CVE-2022-42322   | https://security-tracker.debian.org/tracker/CVE-2022-42322  
                           xen | CVE-2022-42319   | https://security-tracker.debian.org/tracker/CVE-2022-42319  
                           xen | CVE-2022-42323   | https://security-tracker.debian.org/tracker/CVE-2022-42323  
                           xen | CVE-2022-42334   | https://security-tracker.debian.org/tracker/CVE-2022-42334  
                           xen | CVE-2022-4949    | https://security-tracker.debian.org/tracker/CVE-2022-4949   
                           xen | CVE-2022-29901   | https://security-tracker.debian.org/tracker/CVE-2022-29901  
                           xen | CVE-2022-29900   | https://security-tracker.debian.org/tracker/CVE-2022-29900  
                           xen | CVE-2022-33743   | https://security-tracker.debian.org/tracker/CVE-2022-33743  
                           xen | CVE-2022-33745   | https://security-tracker.debian.org/tracker/CVE-2022-33745  
                           xen | CVE-2022-33742   | https://security-tracker.debian.org/tracker/CVE-2022-33742  
                           xen | CVE-2022-33747   | https://security-tracker.debian.org/tracker/CVE-2022-33747  
                           xen | CVE-2022-33748   | https://security-tracker.debian.org/tracker/CVE-2022-33748  
                           xen | CVE-2022-33746   | https://security-tracker.debian.org/tracker/CVE-2022-33746  
                           xen | CVE-2022-33741   | https://security-tracker.debian.org/tracker/CVE-2022-33741  
                           xen | CVE-2022-33740   | https://security-tracker.debian.org/tracker/CVE-2022-33740  
                           xen | CVE-2022-23824   | https://security-tracker.debian.org/tracker/CVE-2022-23824  
                           xen | CVE-2022-23960   | https://security-tracker.debian.org/tracker/CVE-2022-23960  
                           xen | CVE-2022-21127   | https://security-tracker.debian.org/tracker/CVE-2022-21127  
                           xen | CVE-2022-21166   | https://security-tracker.debian.org/tracker/CVE-2022-21166  
                           xen | CVE-2022-21125   | https://security-tracker.debian.org/tracker/CVE-2022-21125  
                           xen | CVE-2022-21123   | https://security-tracker.debian.org/tracker/CVE-2022-21123  
                           xen | CVE-2022-26362   | https://security-tracker.debian.org/tracker/CVE-2022-26362  
                           xen | CVE-2022-26361   | https://security-tracker.debian.org/tracker/CVE-2022-26361  
                           xen | CVE-2022-26364   | https://security-tracker.debian.org/tracker/CVE-2022-26364  
                           xen | CVE-2022-26357   | https://security-tracker.debian.org/tracker/CVE-2022-26357  
                           xen | CVE-2022-26359   | https://security-tracker.debian.org/tracker/CVE-2022-26359  
                           xen | CVE-2022-26363   | https://security-tracker.debian.org/tracker/CVE-2022-26363  
                           xen | CVE-2022-26358   | https://security-tracker.debian.org/tracker/CVE-2022-26358  
                           xen | CVE-2022-26360   | https://security-tracker.debian.org/tracker/CVE-2022-26360  
                           xen | CVE-2022-26365   | https://security-tracker.debian.org/tracker/CVE-2022-26365  
                           xen | CVE-2022-23039   | https://security-tracker.debian.org/tracker/CVE-2022-23039  
                           xen | CVE-2022-23035   | https://security-tracker.debian.org/tracker/CVE-2022-23035  
                           xen | CVE-2022-23038   | https://security-tracker.debian.org/tracker/CVE-2022-23038  
                           xen | CVE-2022-23037   | https://security-tracker.debian.org/tracker/CVE-2022-23037  
                           xen | CVE-2022-23033   | https://security-tracker.debian.org/tracker/CVE-2022-23033  
                           xen | CVE-2022-23041   | https://security-tracker.debian.org/tracker/CVE-2022-23041  
                           xen | CVE-2022-23036   | https://security-tracker.debian.org/tracker/CVE-2022-23036  
                           xen | CVE-2022-23042   | https://security-tracker.debian.org/tracker/CVE-2022-23042  
                           xen | CVE-2022-23040   | https://security-tracker.debian.org/tracker/CVE-2022-23040  
                           xen | CVE-2023-20588   | https://security-tracker.debian.org/tracker/CVE-2023-20588  
                           xen | CVE-2023-34320   | https://security-tracker.debian.org/tracker/CVE-2023-34320  
                           xen | CVE-2023-34322   | https://security-tracker.debian.org/tracker/CVE-2023-34322  
                           xen | CVE-2023-34323   | https://security-tracker.debian.org/tracker/CVE-2023-34323  
                           xen | CVE-2023-34325   | https://security-tracker.debian.org/tracker/CVE-2023-34325  
                           xen | CVE-2023-34324   | https://security-tracker.debian.org/tracker/CVE-2023-34324  
                           xen | CVE-2023-34319   | https://security-tracker.debian.org/tracker/CVE-2023-34319  
                           xen | CVE-2023-34326   | https://security-tracker.debian.org/tracker/CVE-2023-34326  
                           xen | CVE-2023-34327   | https://security-tracker.debian.org/tracker/CVE-2023-34327  
                           xen | CVE-2023-34321   | https://security-tracker.debian.org/tracker/CVE-2023-34321  
                           xen | CVE-2023-4949    | https://security-tracker.debian.org/tracker/CVE-2023-4949   
                           xen | CVE-2023-46835   | https://security-tracker.debian.org/tracker/CVE-2023-46835  
                           xen | CVE-2023-46837   | https://security-tracker.debian.org/tracker/CVE-2023-46837  
                           xen | CVE-2023-46836   | https://security-tracker.debian.org/tracker/CVE-2023-46836  
                        xerces | CVE-2012-0880    | https://security-tracker.debian.org/tracker/CVE-2012-0880   
                          yajl | CVE-2023-33460   | https://security-tracker.debian.org/tracker/CVE-2023-33460  
                          yasm | CVE-2021-33465   | https://security-tracker.debian.org/tracker/CVE-2021-33465  
                          yasm | CVE-2021-33463   | https://security-tracker.debian.org/tracker/CVE-2021-33463  
                          yasm | CVE-2021-33462   | https://security-tracker.debian.org/tracker/CVE-2021-33462  
                          yasm | CVE-2021-33464   | https://security-tracker.debian.org/tracker/CVE-2021-33464  
                          yasm | CVE-2021-33457   | https://security-tracker.debian.org/tracker/CVE-2021-33457  
                          yasm | CVE-2021-33456   | https://security-tracker.debian.org/tracker/CVE-2021-33456  
                          yasm | CVE-2021-33454   | https://security-tracker.debian.org/tracker/CVE-2021-33454  
                          yasm | CVE-2021-33468   | https://security-tracker.debian.org/tracker/CVE-2021-33468  
                          yasm | CVE-2021-33458   | https://security-tracker.debian.org/tracker/CVE-2021-33458  
                          yasm | CVE-2021-33467   | https://security-tracker.debian.org/tracker/CVE-2021-33467  
                          yasm | CVE-2021-33459   | https://security-tracker.debian.org/tracker/CVE-2021-33459  
                          yasm | CVE-2021-33460   | https://security-tracker.debian.org/tracker/CVE-2021-33460  
                          yasm | CVE-2021-33455   | https://security-tracker.debian.org/tracker/CVE-2021-33455  
                          yasm | CVE-2021-33466   | https://security-tracker.debian.org/tracker/CVE-2021-33466  
                          yasm | CVE-2021-33461   | https://security-tracker.debian.org/tracker/CVE-2021-33461  
                          yasm | CVE-2023-51258   | https://security-tracker.debian.org/tracker/CVE-2023-51258  
                          yasm | CVE-2023-31974   | https://security-tracker.debian.org/tracker/CVE-2023-31974  
                          yasm | CVE-2023-31973   | https://security-tracker.debian.org/tracker/CVE-2023-31973  
                          yasm | CVE-2023-31972   | https://security-tracker.debian.org/tracker/CVE-2023-31972  
                           zip | CVE-2018-13410   | https://security-tracker.debian.org/tracker/CVE-2018-13410  

CVEs for the '2024.05.x' branch
-------------------------------

             name              |       CVE        |                             link                            
-------------------------------+------------------+--------------------------------------------------------------
                        apache | CVE-1999-1412    | https://security-tracker.debian.org/tracker/CVE-1999-1412   
                        apache | CVE-1999-0678    | https://security-tracker.debian.org/tracker/CVE-1999-0678   
                        apache | CVE-1999-0236    | https://security-tracker.debian.org/tracker/CVE-1999-0236   
                        apache | CVE-1999-0289    | https://security-tracker.debian.org/tracker/CVE-1999-0289   
                        apache | CVE-1999-1237    | https://security-tracker.debian.org/tracker/CVE-1999-1237   
                        apache | CVE-2007-0450    | https://security-tracker.debian.org/tracker/CVE-2007-0450   
                        apache | CVE-2007-0086    | https://security-tracker.debian.org/tracker/CVE-2007-0086   
                        apache | CVE-2007-6422    | https://security-tracker.debian.org/tracker/CVE-2007-6422   
                        apache | CVE-2007-6421    | https://security-tracker.debian.org/tracker/CVE-2007-6421   
                        apache | CVE-2007-6423    | https://security-tracker.debian.org/tracker/CVE-2007-6423   
                        apache | CVE-2008-2168    | https://security-tracker.debian.org/tracker/CVE-2008-2168   
                        apache | CVE-2010-0425    | https://security-tracker.debian.org/tracker/CVE-2010-0425   
                      apparmor | CVE-2016-1585    | https://security-tracker.debian.org/tracker/CVE-2016-1585   
                         argus | CVE-2011-3332    | https://security-tracker.debian.org/tracker/CVE-2011-3332   
                         asn1c | CVE-2017-12966   | https://security-tracker.debian.org/tracker/CVE-2017-12966  
                         asn1c | CVE-2020-23911   | https://security-tracker.debian.org/tracker/CVE-2020-23911  
                         asn1c | CVE-2020-23910   | https://security-tracker.debian.org/tracker/CVE-2020-23910  
                          atop | CVE-2011-3618    | https://security-tracker.debian.org/tracker/CVE-2011-3618   
                         avahi | CVE-2021-3468    | https://security-tracker.debian.org/tracker/CVE-2021-3468   
                         avahi | CVE-2023-38472   | https://security-tracker.debian.org/tracker/CVE-2023-38472  
                         avahi | CVE-2023-38469   | https://security-tracker.debian.org/tracker/CVE-2023-38469  
                         avahi | CVE-2023-38470   | https://security-tracker.debian.org/tracker/CVE-2023-38470  
                         avahi | CVE-2023-38473   | https://security-tracker.debian.org/tracker/CVE-2023-38473  
                         avahi | CVE-2023-38471   | https://security-tracker.debian.org/tracker/CVE-2023-38471  
                     belle-sip | CVE-2021-33056   | https://security-tracker.debian.org/tracker/CVE-2021-33056  
                     belle-sip | CVE-2021-43610   | https://security-tracker.debian.org/tracker/CVE-2021-43610  
                     belle-sip | CVE-2021-43611   | https://security-tracker.debian.org/tracker/CVE-2021-43611  
                        bento4 | CVE-2020-23332   | https://security-tracker.debian.org/tracker/CVE-2020-23332  
                        bento4 | CVE-2020-23331   | https://security-tracker.debian.org/tracker/CVE-2020-23331  
                        bento4 | CVE-2022-3807    | https://security-tracker.debian.org/tracker/CVE-2022-3807   
                    berkeleydb | CVE-2017-3604    | https://security-tracker.debian.org/tracker/CVE-2017-3604   
                    berkeleydb | CVE-2017-3614    | https://security-tracker.debian.org/tracker/CVE-2017-3614   
                    berkeleydb | CVE-2017-3610    | https://security-tracker.debian.org/tracker/CVE-2017-3610   
                    berkeleydb | CVE-2017-3609    | https://security-tracker.debian.org/tracker/CVE-2017-3609   
                    berkeleydb | CVE-2017-3616    | https://security-tracker.debian.org/tracker/CVE-2017-3616   
                    berkeleydb | CVE-2017-3605    | https://security-tracker.debian.org/tracker/CVE-2017-3605   
                    berkeleydb | CVE-2017-3608    | https://security-tracker.debian.org/tracker/CVE-2017-3608   
                    berkeleydb | CVE-2017-3611    | https://security-tracker.debian.org/tracker/CVE-2017-3611   
                    berkeleydb | CVE-2017-3613    | https://security-tracker.debian.org/tracker/CVE-2017-3613   
                    berkeleydb | CVE-2017-3617    | https://security-tracker.debian.org/tracker/CVE-2017-3617   
                    berkeleydb | CVE-2017-3607    | https://security-tracker.debian.org/tracker/CVE-2017-3607   
                    berkeleydb | CVE-2017-3612    | https://security-tracker.debian.org/tracker/CVE-2017-3612   
                    berkeleydb | CVE-2017-3615    | https://security-tracker.debian.org/tracker/CVE-2017-3615   
                    berkeleydb | CVE-2017-3606    | https://security-tracker.debian.org/tracker/CVE-2017-3606   
                    berkeleydb | CVE-2019-2708    | https://security-tracker.debian.org/tracker/CVE-2019-2708   
                    berkeleydb | CVE-2020-2981    | https://security-tracker.debian.org/tracker/CVE-2020-2981   
                       bitcoin | CVE-2012-1909    | https://security-tracker.debian.org/tracker/CVE-2012-1909   
                       bitcoin | CVE-2012-4682    | https://security-tracker.debian.org/tracker/CVE-2012-4682   
                       bitcoin | CVE-2012-4683    | https://security-tracker.debian.org/tracker/CVE-2012-4683   
                       bitcoin | CVE-2013-3220    | https://security-tracker.debian.org/tracker/CVE-2013-3220   
                       bitcoin | CVE-2013-2293    | https://security-tracker.debian.org/tracker/CVE-2013-2293   
                       bitcoin | CVE-2013-2273    | https://security-tracker.debian.org/tracker/CVE-2013-2273   
                       bitcoin | CVE-2013-2272    | https://security-tracker.debian.org/tracker/CVE-2013-2272   
                       bitcoin | CVE-2013-2292    | https://security-tracker.debian.org/tracker/CVE-2013-2292   
                       bitcoin | CVE-2023-50428   | https://security-tracker.debian.org/tracker/CVE-2023-50428  
                  bluez5_utils | CVE-2020-24490   | https://security-tracker.debian.org/tracker/CVE-2020-24490  
          bluez5_utils-headers | CVE-2020-24490   | https://security-tracker.debian.org/tracker/CVE-2020-24490  
                        bsdiff | CVE-2020-14315   | https://security-tracker.debian.org/tracker/CVE-2020-14315  
                       busybox | CVE-2023-42363   | https://security-tracker.debian.org/tracker/CVE-2023-42363  
                       busybox | CVE-2023-42366   | https://security-tracker.debian.org/tracker/CVE-2023-42366  
                       busybox | CVE-2023-42364   | https://security-tracker.debian.org/tracker/CVE-2023-42364  
                       busybox | CVE-2023-42365   | https://security-tracker.debian.org/tracker/CVE-2023-42365  
                        bwm-ng | CVE-2023-26129   | https://security-tracker.debian.org/tracker/CVE-2023-26129  
                      composer | CVE-2023-43655   | https://security-tracker.debian.org/tracker/CVE-2023-43655  
                      composer | CVE-2024-24821   | https://security-tracker.debian.org/tracker/CVE-2024-24821  
                     coreutils | CVE-2016-2781    | https://security-tracker.debian.org/tracker/CVE-2016-2781   
                     coreutils | CVE-2024-0684    | https://security-tracker.debian.org/tracker/CVE-2024-0684   
                          cpio | CVE-2010-4226    | https://security-tracker.debian.org/tracker/CVE-2010-4226   
                          cpio | CVE-2023-7216    | https://security-tracker.debian.org/tracker/CVE-2023-7216   
                      cryptopp | CVE-2023-50980   | https://security-tracker.debian.org/tracker/CVE-2023-50980  
                      cryptopp | CVE-2023-50981   | https://security-tracker.debian.org/tracker/CVE-2023-50981  
                      cryptopp | CVE-2023-50979   | https://security-tracker.debian.org/tracker/CVE-2023-50979  
                           cvs | CVE-2017-12836   | https://security-tracker.debian.org/tracker/CVE-2017-12836  
                          dash | CVE-2024-21485   | https://security-tracker.debian.org/tracker/CVE-2024-21485  
                           dht | CVE-2020-36562   | https://security-tracker.debian.org/tracker/CVE-2020-36562  
                        docker | CVE-2014-8178    | https://security-tracker.debian.org/tracker/CVE-2014-8178   
                        docker | CVE-2014-8179    | https://security-tracker.debian.org/tracker/CVE-2014-8179   
                        docker | CVE-2014-0048    | https://security-tracker.debian.org/tracker/CVE-2014-0048   
                        docker | CVE-2015-1843    | https://security-tracker.debian.org/tracker/CVE-2015-1843   
                        docker | CVE-2015-3627    | https://security-tracker.debian.org/tracker/CVE-2015-3627   
                        docker | CVE-2015-3631    | https://security-tracker.debian.org/tracker/CVE-2015-3631   
                        docker | CVE-2015-3630    | https://security-tracker.debian.org/tracker/CVE-2015-3630   
                        docker | CVE-2016-3697    | https://security-tracker.debian.org/tracker/CVE-2016-3697   
                        docker | CVE-2017-14992   | https://security-tracker.debian.org/tracker/CVE-2017-14992  
                        docker | CVE-2019-16884   | https://security-tracker.debian.org/tracker/CVE-2019-16884  
                        docker | CVE-2019-13509   | https://security-tracker.debian.org/tracker/CVE-2019-13509  
                        docker | CVE-2019-13139   | https://security-tracker.debian.org/tracker/CVE-2019-13139  
                        docker | CVE-2019-5736    | https://security-tracker.debian.org/tracker/CVE-2019-5736   
                        docker | CVE-2019-15752   | https://security-tracker.debian.org/tracker/CVE-2019-15752  
                        docker | CVE-2020-27534   | https://security-tracker.debian.org/tracker/CVE-2020-27534  
                        docker | CVE-2021-33183   | https://security-tracker.debian.org/tracker/CVE-2021-33183  
                        docker | CVE-2021-3162    | https://security-tracker.debian.org/tracker/CVE-2021-3162   
                        docker | CVE-2021-21285   | https://security-tracker.debian.org/tracker/CVE-2021-21285  
                        docker | CVE-2021-21284   | https://security-tracker.debian.org/tracker/CVE-2021-21284  
                        docker | CVE-2022-25365   | https://security-tracker.debian.org/tracker/CVE-2022-25365  
                        dracut | CVE-2010-4176    | https://security-tracker.debian.org/tracker/CVE-2010-4176   
                          edk2 | CVE-2014-8271    | https://security-tracker.debian.org/tracker/CVE-2014-8271   
                          edk2 | CVE-2014-4860    | https://security-tracker.debian.org/tracker/CVE-2014-4860   
                          edk2 | CVE-2014-4859    | https://security-tracker.debian.org/tracker/CVE-2014-4859   
                          edk2 | CVE-2019-14586   | https://security-tracker.debian.org/tracker/CVE-2019-14586  
                          edk2 | CVE-2019-14553   | https://security-tracker.debian.org/tracker/CVE-2019-14553  
                          edk2 | CVE-2019-14559   | https://security-tracker.debian.org/tracker/CVE-2019-14559  
                          edk2 | CVE-2019-14563   | https://security-tracker.debian.org/tracker/CVE-2019-14563  
                          edk2 | CVE-2019-14587   | https://security-tracker.debian.org/tracker/CVE-2019-14587  
                          edk2 | CVE-2019-14575   | https://security-tracker.debian.org/tracker/CVE-2019-14575  
                          edk2 | CVE-2019-14562   | https://security-tracker.debian.org/tracker/CVE-2019-14562  
                         emlog | CVE-2021-44584   | https://security-tracker.debian.org/tracker/CVE-2021-44584  
                         emlog | CVE-2022-3968    | https://security-tracker.debian.org/tracker/CVE-2022-3968   
                         emlog | CVE-2022-1526    | https://security-tracker.debian.org/tracker/CVE-2022-1526   
                         emlog | CVE-2023-43291   | https://security-tracker.debian.org/tracker/CVE-2023-43291  
                        erlang | CVE-2023-48795   | https://security-tracker.debian.org/tracker/CVE-2023-48795  
                         exiv2 | CVE-2007-6353    | https://security-tracker.debian.org/tracker/CVE-2007-6353   
             freeradius-server | CVE-2002-0318    | https://security-tracker.debian.org/tracker/CVE-2002-0318   
             freeradius-server | CVE-2011-4966    | https://security-tracker.debian.org/tracker/CVE-2011-4966   
                gcc-bare-metal | CVE-2023-4039    | https://security-tracker.debian.org/tracker/CVE-2023-4039   
                   ghostscript | CVE-2023-38560   | https://security-tracker.debian.org/tracker/CVE-2023-38560  
                         gnupg | CVE-2006-3082    | https://security-tracker.debian.org/tracker/CVE-2006-3082   
                         gnupg | CVE-2011-2207    | https://security-tracker.debian.org/tracker/CVE-2011-2207   
                         gnupg | CVE-2015-1606    | https://security-tracker.debian.org/tracker/CVE-2015-1606   
                         gnupg | CVE-2018-12020   | https://security-tracker.debian.org/tracker/CVE-2018-12020  
                         gnupg | CVE-2019-14855   | https://security-tracker.debian.org/tracker/CVE-2019-14855  
                         gnupg | CVE-2019-13050   | https://security-tracker.debian.org/tracker/CVE-2019-13050  
                         gnupg | CVE-2022-34903   | https://security-tracker.debian.org/tracker/CVE-2022-34903  
                         gnupg | CVE-2022-3219    | https://security-tracker.debian.org/tracker/CVE-2022-3219   
                        gnupg2 | CVE-2022-3219    | https://security-tracker.debian.org/tracker/CVE-2022-3219   
                graphicsmagick | CVE-2007-0770    | https://security-tracker.debian.org/tracker/CVE-2007-0770   
                graphicsmagick | CVE-2008-6621    | https://security-tracker.debian.org/tracker/CVE-2008-6621   
                     graphite2 | CVE-2017-5436    | https://security-tracker.debian.org/tracker/CVE-2017-5436   
                          grpc | CVE-2023-1428    | https://security-tracker.debian.org/tracker/CVE-2023-1428   
                          grpc | CVE-2023-33953   | https://security-tracker.debian.org/tracker/CVE-2023-33953  
                          grpc | CVE-2023-44487   | https://security-tracker.debian.org/tracker/CVE-2023-44487  
                          grpc | CVE-2023-4785    | https://security-tracker.debian.org/tracker/CVE-2023-4785   
                          grpc | CVE-2023-32732   | https://security-tracker.debian.org/tracker/CVE-2023-32732  
                         grub2 | CVE-2023-4001    | https://security-tracker.debian.org/tracker/CVE-2023-4001   
                         grub2 | CVE-2024-1048    | https://security-tracker.debian.org/tracker/CVE-2024-1048   
                       haproxy | CVE-2016-2102    | https://security-tracker.debian.org/tracker/CVE-2016-2102   
                       haproxy | CVE-2023-0056    | https://security-tracker.debian.org/tracker/CVE-2023-0056   
                       haproxy | CVE-2023-45539   | https://security-tracker.debian.org/tracker/CVE-2023-45539  
                   imagemagick | CVE-2007-1667    | https://security-tracker.debian.org/tracker/CVE-2007-1667   
                   imagemagick | CVE-2014-9813    | https://security-tracker.debian.org/tracker/CVE-2014-9813   
                   imagemagick | CVE-2014-9822    | https://security-tracker.debian.org/tracker/CVE-2014-9822   
                   imagemagick | CVE-2014-9831    | https://security-tracker.debian.org/tracker/CVE-2014-9831   
                   imagemagick | CVE-2014-9854    | https://security-tracker.debian.org/tracker/CVE-2014-9854   
                   imagemagick | CVE-2014-9814    | https://security-tracker.debian.org/tracker/CVE-2014-9814   
                   imagemagick | CVE-2014-9821    | https://security-tracker.debian.org/tracker/CVE-2014-9821   
                   imagemagick | CVE-2014-9829    | https://security-tracker.debian.org/tracker/CVE-2014-9829   
                   imagemagick | CVE-2014-9806    | https://security-tracker.debian.org/tracker/CVE-2014-9806   
                   imagemagick | CVE-2014-9805    | https://security-tracker.debian.org/tracker/CVE-2014-9805   
                   imagemagick | CVE-2014-9852    | https://security-tracker.debian.org/tracker/CVE-2014-9852   
                   imagemagick | CVE-2014-9808    | https://security-tracker.debian.org/tracker/CVE-2014-9808   
                   imagemagick | CVE-2014-9810    | https://security-tracker.debian.org/tracker/CVE-2014-9810   
                   imagemagick | CVE-2014-9853    | https://security-tracker.debian.org/tracker/CVE-2014-9853   
                   imagemagick | CVE-2014-9807    | https://security-tracker.debian.org/tracker/CVE-2014-9807   
                   imagemagick | CVE-2014-9819    | https://security-tracker.debian.org/tracker/CVE-2014-9819   
                   imagemagick | CVE-2014-9820    | https://security-tracker.debian.org/tracker/CVE-2014-9820   
                   imagemagick | CVE-2014-9823    | https://security-tracker.debian.org/tracker/CVE-2014-9823   
                   imagemagick | CVE-2014-9848    | https://security-tracker.debian.org/tracker/CVE-2014-9848   
                   imagemagick | CVE-2014-9816    | https://security-tracker.debian.org/tracker/CVE-2014-9816   
                   imagemagick | CVE-2014-9817    | https://security-tracker.debian.org/tracker/CVE-2014-9817   
                   imagemagick | CVE-2014-9825    | https://security-tracker.debian.org/tracker/CVE-2014-9825   
                   imagemagick | CVE-2014-9818    | https://security-tracker.debian.org/tracker/CVE-2014-9818   
                   imagemagick | CVE-2014-9804    | https://security-tracker.debian.org/tracker/CVE-2014-9804   
                   imagemagick | CVE-2014-9824    | https://security-tracker.debian.org/tracker/CVE-2014-9824   
                   imagemagick | CVE-2014-9812    | https://security-tracker.debian.org/tracker/CVE-2014-9812   
                   imagemagick | CVE-2014-9811    | https://security-tracker.debian.org/tracker/CVE-2014-9811   
                   imagemagick | CVE-2014-9827    | https://security-tracker.debian.org/tracker/CVE-2014-9827   
                   imagemagick | CVE-2014-9826    | https://security-tracker.debian.org/tracker/CVE-2014-9826   
                   imagemagick | CVE-2014-9815    | https://security-tracker.debian.org/tracker/CVE-2014-9815   
                   imagemagick | CVE-2014-9828    | https://security-tracker.debian.org/tracker/CVE-2014-9828   
                   imagemagick | CVE-2014-9830    | https://security-tracker.debian.org/tracker/CVE-2014-9830   
                   imagemagick | CVE-2014-9809    | https://security-tracker.debian.org/tracker/CVE-2014-9809   
                   imagemagick | CVE-2014-9907    | https://security-tracker.debian.org/tracker/CVE-2014-9907   
                   imagemagick | CVE-2016-10062   | https://security-tracker.debian.org/tracker/CVE-2016-10062  
                   imagemagick | CVE-2016-5118    | https://security-tracker.debian.org/tracker/CVE-2016-5118   
                   imagemagick | CVE-2016-10145   | https://security-tracker.debian.org/tracker/CVE-2016-10145  
                   imagemagick | CVE-2016-10144   | https://security-tracker.debian.org/tracker/CVE-2016-10144  
                   imagemagick | CVE-2016-10146   | https://security-tracker.debian.org/tracker/CVE-2016-10146  
                   imagemagick | CVE-2016-7515    | https://security-tracker.debian.org/tracker/CVE-2016-7515   
                   imagemagick | CVE-2016-7514    | https://security-tracker.debian.org/tracker/CVE-2016-7514   
                   imagemagick | CVE-2016-7530    | https://security-tracker.debian.org/tracker/CVE-2016-7530   
                   imagemagick | CVE-2016-7519    | https://security-tracker.debian.org/tracker/CVE-2016-7519   
                   imagemagick | CVE-2016-7537    | https://security-tracker.debian.org/tracker/CVE-2016-7537   
                   imagemagick | CVE-2016-7523    | https://security-tracker.debian.org/tracker/CVE-2016-7523   
                   imagemagick | CVE-2016-7521    | https://security-tracker.debian.org/tracker/CVE-2016-7521   
                   imagemagick | CVE-2016-7532    | https://security-tracker.debian.org/tracker/CVE-2016-7532   
                   imagemagick | CVE-2016-7538    | https://security-tracker.debian.org/tracker/CVE-2016-7538   
                   imagemagick | CVE-2016-7528    | https://security-tracker.debian.org/tracker/CVE-2016-7528   
                   imagemagick | CVE-2016-7525    | https://security-tracker.debian.org/tracker/CVE-2016-7525   
                   imagemagick | CVE-2016-7520    | https://security-tracker.debian.org/tracker/CVE-2016-7520   
                   imagemagick | CVE-2016-7518    | https://security-tracker.debian.org/tracker/CVE-2016-7518   
                   imagemagick | CVE-2016-7531    | https://security-tracker.debian.org/tracker/CVE-2016-7531   
                   imagemagick | CVE-2016-7522    | https://security-tracker.debian.org/tracker/CVE-2016-7522   
                   imagemagick | CVE-2016-7517    | https://security-tracker.debian.org/tracker/CVE-2016-7517   
                   imagemagick | CVE-2016-7524    | https://security-tracker.debian.org/tracker/CVE-2016-7524   
                   imagemagick | CVE-2016-7536    | https://security-tracker.debian.org/tracker/CVE-2016-7536   
                   imagemagick | CVE-2016-7529    | https://security-tracker.debian.org/tracker/CVE-2016-7529   
                   imagemagick | CVE-2016-7527    | https://security-tracker.debian.org/tracker/CVE-2016-7527   
                   imagemagick | CVE-2016-7533    | https://security-tracker.debian.org/tracker/CVE-2016-7533   
                   imagemagick | CVE-2016-7534    | https://security-tracker.debian.org/tracker/CVE-2016-7534   
                   imagemagick | CVE-2016-7516    | https://security-tracker.debian.org/tracker/CVE-2016-7516   
                   imagemagick | CVE-2016-7526    | https://security-tracker.debian.org/tracker/CVE-2016-7526   
                   imagemagick | CVE-2016-7535    | https://security-tracker.debian.org/tracker/CVE-2016-7535   
                   imagemagick | CVE-2016-7513    | https://security-tracker.debian.org/tracker/CVE-2016-7513   
                   imagemagick | CVE-2017-5509    | https://security-tracker.debian.org/tracker/CVE-2017-5509   
                   imagemagick | CVE-2017-5510    | https://security-tracker.debian.org/tracker/CVE-2017-5510   
                   imagemagick | CVE-2017-5506    | https://security-tracker.debian.org/tracker/CVE-2017-5506   
                   imagemagick | CVE-2017-5511    | https://security-tracker.debian.org/tracker/CVE-2017-5511   
                   imagemagick | CVE-2023-5341    | https://security-tracker.debian.org/tracker/CVE-2023-5341   
                        jasper | CVE-2023-51257   | https://security-tracker.debian.org/tracker/CVE-2023-51257  
                        jquery | CVE-2007-2379    | https://security-tracker.debian.org/tracker/CVE-2007-2379   
                       kvmtool | CVE-2021-45464   | https://security-tracker.debian.org/tracker/CVE-2021-45464  
                         libao | CVE-2017-11548   | https://security-tracker.debian.org/tracker/CVE-2017-11548  
                  libfreeimage | CVE-2019-12211   | https://security-tracker.debian.org/tracker/CVE-2019-12211  
                  libfreeimage | CVE-2019-12214   | https://security-tracker.debian.org/tracker/CVE-2019-12214  
                  libfreeimage | CVE-2019-12212   | https://security-tracker.debian.org/tracker/CVE-2019-12212  
                  libfreeimage | CVE-2019-12213   | https://security-tracker.debian.org/tracker/CVE-2019-12213  
                  libfreeimage | CVE-2020-21426   | https://security-tracker.debian.org/tracker/CVE-2020-21426  
                  libfreeimage | CVE-2020-21428   | https://security-tracker.debian.org/tracker/CVE-2020-21428  
                  libfreeimage | CVE-2020-21427   | https://security-tracker.debian.org/tracker/CVE-2020-21427  
                  libfreeimage | CVE-2021-33367   | https://security-tracker.debian.org/tracker/CVE-2021-33367  
                  libfreeimage | CVE-2023-47993   | https://security-tracker.debian.org/tracker/CVE-2023-47993  
                  libfreeimage | CVE-2023-47992   | https://security-tracker.debian.org/tracker/CVE-2023-47992  
                  libfreeimage | CVE-2023-47997   | https://security-tracker.debian.org/tracker/CVE-2023-47997  
                  libfreeimage | CVE-2023-47994   | https://security-tracker.debian.org/tracker/CVE-2023-47994  
                  libfreeimage | CVE-2023-47995   | https://security-tracker.debian.org/tracker/CVE-2023-47995  
                  libfreeimage | CVE-2023-47996   | https://security-tracker.debian.org/tracker/CVE-2023-47996  
                       libgtk2 | CVE-2014-1949    | https://security-tracker.debian.org/tracker/CVE-2014-1949   
                     libiberty | CVE-2012-3509    | https://security-tracker.debian.org/tracker/CVE-2012-3509   
                     libiberty | CVE-2016-4487    | https://security-tracker.debian.org/tracker/CVE-2016-4487   
                     libiberty | CVE-2016-4492    | https://security-tracker.debian.org/tracker/CVE-2016-4492   
                     libiberty | CVE-2016-4491    | https://security-tracker.debian.org/tracker/CVE-2016-4491   
                     libiberty | CVE-2016-4490    | https://security-tracker.debian.org/tracker/CVE-2016-4490   
                     libiberty | CVE-2016-4489    | https://security-tracker.debian.org/tracker/CVE-2016-4489   
                     libiberty | CVE-2016-4488    | https://security-tracker.debian.org/tracker/CVE-2016-4488   
                     libiberty | CVE-2016-4493    | https://security-tracker.debian.org/tracker/CVE-2016-4493   
                     libiberty | CVE-2016-6131    | https://security-tracker.debian.org/tracker/CVE-2016-6131   
                     libiberty | CVE-2016-2226    | https://security-tracker.debian.org/tracker/CVE-2016-2226   
                       libkrb5 | CVE-1999-0713    | https://security-tracker.debian.org/tracker/CVE-1999-0713   
                       libkrb5 | CVE-1999-0143    | https://security-tracker.debian.org/tracker/CVE-1999-0143   
                       libkrb5 | CVE-2007-5894    | https://security-tracker.debian.org/tracker/CVE-2007-5894   
                       libkrb5 | CVE-2007-3149    | https://security-tracker.debian.org/tracker/CVE-2007-3149   
                       libkrb5 | CVE-2007-5902    | https://security-tracker.debian.org/tracker/CVE-2007-5902   
                       libkrb5 | CVE-2009-0844    | https://security-tracker.debian.org/tracker/CVE-2009-0844   
                        libmad | CVE-2018-7263    | https://security-tracker.debian.org/tracker/CVE-2018-7263   
                      libmpeg2 | CVE-2022-37416   | https://security-tracker.debian.org/tracker/CVE-2022-37416  
                      libplist | CVE-2017-5834    | https://security-tracker.debian.org/tracker/CVE-2017-5834   
                      libplist | CVE-2017-5835    | https://security-tracker.debian.org/tracker/CVE-2017-5835   
                      libplist | CVE-2017-5836    | https://security-tracker.debian.org/tracker/CVE-2017-5836   
                        libraw | CVE-2020-22628   | https://security-tracker.debian.org/tracker/CVE-2020-22628  
                        libraw | CVE-2023-1729    | https://security-tracker.debian.org/tracker/CVE-2023-1729   
                    libsndfile | CVE-2022-33065   | https://security-tracker.debian.org/tracker/CVE-2022-33065  
                    libtorrent | CVE-2009-1760    | https://security-tracker.debian.org/tracker/CVE-2009-1760   
                    libtorrent | CVE-2016-5301    | https://security-tracker.debian.org/tracker/CVE-2016-5301   
                       libvirt | CVE-2014-8136    | https://security-tracker.debian.org/tracker/CVE-2014-8136   
                       libvirt | CVE-2014-8135    | https://security-tracker.debian.org/tracker/CVE-2014-8135   
                       libvirt | CVE-2015-5313    | https://security-tracker.debian.org/tracker/CVE-2015-5313   
                       libvirt | CVE-2018-6764    | https://security-tracker.debian.org/tracker/CVE-2018-6764   
                       libvirt | CVE-2018-5748    | https://security-tracker.debian.org/tracker/CVE-2018-5748   
                       libvirt | CVE-2023-3750    | https://security-tracker.debian.org/tracker/CVE-2023-3750   
                         lrzip | CVE-2022-33067   | https://security-tracker.debian.org/tracker/CVE-2022-33067  
                         lrzip | CVE-2023-39741   | https://security-tracker.debian.org/tracker/CVE-2023-39741  
                         lrzsz | CVE-2018-10195   | https://security-tracker.debian.org/tracker/CVE-2018-10195  
                           lua | CVE-2014-5461    | https://security-tracker.debian.org/tracker/CVE-2014-5461   
                           lua | CVE-2021-43519   | https://security-tracker.debian.org/tracker/CVE-2021-43519  
                       mbedtls | CVE-2021-45451   | https://security-tracker.debian.org/tracker/CVE-2021-45451  
                       mbedtls | CVE-2021-36647   | https://security-tracker.debian.org/tracker/CVE-2021-36647  
                       mbedtls | CVE-2021-43666   | https://security-tracker.debian.org/tracker/CVE-2021-43666  
                       mbedtls | CVE-2023-52353   | https://security-tracker.debian.org/tracker/CVE-2023-52353  
                   micropython | CVE-2023-7152    | https://security-tracker.debian.org/tracker/CVE-2023-7152   
                       mongodb | CVE-2014-8180    | https://security-tracker.debian.org/tracker/CVE-2014-8180   
                       mongodb | CVE-2017-2665    | https://security-tracker.debian.org/tracker/CVE-2017-2665   
                         mp4v2 | CVE-2023-33716   | https://security-tracker.debian.org/tracker/CVE-2023-33716  
                         mp4v2 | CVE-2023-33719   | https://security-tracker.debian.org/tracker/CVE-2023-33719  
                         mp4v2 | CVE-2023-33718   | https://security-tracker.debian.org/tracker/CVE-2023-33718  
                         mp4v2 | CVE-2023-33717   | https://security-tracker.debian.org/tracker/CVE-2023-33717  
                          mutt | CVE-2011-1429    | https://security-tracker.debian.org/tracker/CVE-2011-1429   
                          nasm | CVE-2023-31722   | https://security-tracker.debian.org/tracker/CVE-2023-31722  
                       netdata | CVE-2023-22497   | https://security-tracker.debian.org/tracker/CVE-2023-22497  
                       netdata | CVE-2023-22496   | https://security-tracker.debian.org/tracker/CVE-2023-22496  
                         nginx | CVE-2023-44487   | https://security-tracker.debian.org/tracker/CVE-2023-44487  
                         ninja | CVE-2021-4336    | https://security-tracker.debian.org/tracker/CVE-2021-4336   
                           ntp | CVE-2014-9750    | https://security-tracker.debian.org/tracker/CVE-2014-9750   
                           ntp | CVE-2014-9751    | https://security-tracker.debian.org/tracker/CVE-2014-9751   
                           ntp | CVE-2015-7691    | https://security-tracker.debian.org/tracker/CVE-2015-7691   
                           ntp | CVE-2015-7692    | https://security-tracker.debian.org/tracker/CVE-2015-7692   
                           ntp | CVE-2015-7977    | https://security-tracker.debian.org/tracker/CVE-2015-7977   
                           ntp | CVE-2015-7973    | https://security-tracker.debian.org/tracker/CVE-2015-7973   
                           ntp | CVE-2015-7974    | https://security-tracker.debian.org/tracker/CVE-2015-7974   
                           ntp | CVE-2015-7703    | https://security-tracker.debian.org/tracker/CVE-2015-7703   
                           ntp | CVE-2015-7705    | https://security-tracker.debian.org/tracker/CVE-2015-7705   
                           ntp | CVE-2015-7701    | https://security-tracker.debian.org/tracker/CVE-2015-7701   
                           ntp | CVE-2015-7704    | https://security-tracker.debian.org/tracker/CVE-2015-7704   
                           ntp | CVE-2015-7702    | https://security-tracker.debian.org/tracker/CVE-2015-7702   
                           ntp | CVE-2015-7854    | https://security-tracker.debian.org/tracker/CVE-2015-7854   
                           ntp | CVE-2015-7853    | https://security-tracker.debian.org/tracker/CVE-2015-7853   
                           ntp | CVE-2015-7852    | https://security-tracker.debian.org/tracker/CVE-2015-7852   
                           ntp | CVE-2015-7849    | https://security-tracker.debian.org/tracker/CVE-2015-7849   
                           ntp | CVE-2015-7855    | https://security-tracker.debian.org/tracker/CVE-2015-7855   
                           ntp | CVE-2015-7850    | https://security-tracker.debian.org/tracker/CVE-2015-7850   
                           ntp | CVE-2016-2518    | https://security-tracker.debian.org/tracker/CVE-2016-2518   
                           ntp | CVE-2016-4955    | https://security-tracker.debian.org/tracker/CVE-2016-4955   
                           ntp | CVE-2016-4953    | https://security-tracker.debian.org/tracker/CVE-2016-4953   
                           ntp | CVE-2016-4954    | https://security-tracker.debian.org/tracker/CVE-2016-4954   
                           ntp | CVE-2016-4956    | https://security-tracker.debian.org/tracker/CVE-2016-4956   
                           ntp | CVE-2016-7426    | https://security-tracker.debian.org/tracker/CVE-2016-7426   
                           ntp | CVE-2016-7434    | https://security-tracker.debian.org/tracker/CVE-2016-7434   
                           ntp | CVE-2017-6458    | https://security-tracker.debian.org/tracker/CVE-2017-6458   
                           ntp | CVE-2018-7170    | https://security-tracker.debian.org/tracker/CVE-2018-7170   
                           ntp | CVE-2018-7185    | https://security-tracker.debian.org/tracker/CVE-2018-7185   
                           ntp | CVE-2019-11331   | https://security-tracker.debian.org/tracker/CVE-2019-11331  
                           ntp | CVE-2019-8936    | https://security-tracker.debian.org/tracker/CVE-2019-8936   
                           ntp | CVE-2020-13817   | https://security-tracker.debian.org/tracker/CVE-2020-13817  
                           ntp | CVE-2020-11868   | https://security-tracker.debian.org/tracker/CVE-2020-11868  
                    open-iscsi | CVE-2020-13987   | https://security-tracker.debian.org/tracker/CVE-2020-13987  
                       opencv3 | CVE-2019-19624   | https://security-tracker.debian.org/tracker/CVE-2019-19624  
                       opencv3 | CVE-2019-14493   | https://security-tracker.debian.org/tracker/CVE-2019-14493  
                       opencv3 | CVE-2019-15939   | https://security-tracker.debian.org/tracker/CVE-2019-15939  
                       openjdk | CVE-2009-2476    | https://security-tracker.debian.org/tracker/CVE-2009-2476   
                       openjdk | CVE-2009-2475    | https://security-tracker.debian.org/tracker/CVE-2009-2475   
                       openjdk | CVE-2009-2690    | https://security-tracker.debian.org/tracker/CVE-2009-2690   
                       openjdk | CVE-2009-2689    | https://security-tracker.debian.org/tracker/CVE-2009-2689   
                       openjdk | CVE-2009-3881    | https://security-tracker.debian.org/tracker/CVE-2009-3881   
                       openjdk | CVE-2009-3882    | https://security-tracker.debian.org/tracker/CVE-2009-3882   
                       openjdk | CVE-2009-3880    | https://security-tracker.debian.org/tracker/CVE-2009-3880   
                       openjdk | CVE-2009-3884    | https://security-tracker.debian.org/tracker/CVE-2009-3884   
                       openjdk | CVE-2009-3879    | https://security-tracker.debian.org/tracker/CVE-2009-3879   
                       openjdk | CVE-2009-3883    | https://security-tracker.debian.org/tracker/CVE-2009-3883   
                       openjdk | CVE-2009-3728    | https://security-tracker.debian.org/tracker/CVE-2009-3728   
                       openssh | CVE-2007-2768    | https://security-tracker.debian.org/tracker/CVE-2007-2768   
                       openssh | CVE-2008-3844    | https://security-tracker.debian.org/tracker/CVE-2008-3844   
                       openssh | CVE-2014-9278    | https://security-tracker.debian.org/tracker/CVE-2014-9278   
                       openssh | CVE-2023-51767   | https://security-tracker.debian.org/tracker/CVE-2023-51767  
                      openswan | CVE-2019-10155   | https://security-tracker.debian.org/tracker/CVE-2019-10155  
                   openvmtools | CVE-2014-4199    | https://security-tracker.debian.org/tracker/CVE-2014-4199   
                   openvmtools | CVE-2014-4200    | https://security-tracker.debian.org/tracker/CVE-2014-4200   
                   openvmtools | CVE-2021-31693   | https://security-tracker.debian.org/tracker/CVE-2021-31693  
                   openvmtools | CVE-2022-31693   | https://security-tracker.debian.org/tracker/CVE-2022-31693  
                   openvmtools | CVE-2022-22943   | https://security-tracker.debian.org/tracker/CVE-2022-22943  
                   openvmtools | CVE-2023-20867   | https://security-tracker.debian.org/tracker/CVE-2023-20867  
                   openvmtools | CVE-2023-20900   | https://security-tracker.debian.org/tracker/CVE-2023-20900  
                   openvmtools | CVE-2023-34058   | https://security-tracker.debian.org/tracker/CVE-2023-34058  
                   openvmtools | CVE-2023-34057   | https://security-tracker.debian.org/tracker/CVE-2023-34057  
                         p7zip | CVE-2017-17969   | https://security-tracker.debian.org/tracker/CVE-2017-17969  
                         p7zip | CVE-2018-5996    | https://security-tracker.debian.org/tracker/CVE-2018-5996   
                         patch | CVE-2018-6952    | https://security-tracker.debian.org/tracker/CVE-2018-6952   
                         patch | CVE-2019-20633   | https://security-tracker.debian.org/tracker/CVE-2019-20633  
       perl-lwp-protocol-https | CVE-2014-3230    | https://security-tracker.debian.org/tracker/CVE-2014-3230   
                           php | CVE-2007-2728    | https://security-tracker.debian.org/tracker/CVE-2007-2728   
                           php | CVE-2007-3205    | https://security-tracker.debian.org/tracker/CVE-2007-3205   
                           php | CVE-2007-4596    | https://security-tracker.debian.org/tracker/CVE-2007-4596   
                           php | CVE-2022-4900    | https://security-tracker.debian.org/tracker/CVE-2022-4900   
                           php | CVE-2024-4577    | https://security-tracker.debian.org/tracker/CVE-2024-4577   
                           php | CVE-2024-5458    | https://security-tracker.debian.org/tracker/CVE-2024-5458   
                           php | CVE-2024-5585    | https://security-tracker.debian.org/tracker/CVE-2024-5585   
                           php | CVE-2024-2408    | https://security-tracker.debian.org/tracker/CVE-2024-2408   
                       pkgconf | CVE-2023-24056   | https://security-tracker.debian.org/tracker/CVE-2023-24056  
                 powerpc-utils | CVE-2014-8165    | https://security-tracker.debian.org/tracker/CVE-2014-8165   
                       proftpd | CVE-2023-48795   | https://security-tracker.debian.org/tracker/CVE-2023-48795  
           python-cryptography | CVE-2023-49083   | https://security-tracker.debian.org/tracker/CVE-2023-49083  
               python-m2crypto | CVE-2020-25657   | https://security-tracker.debian.org/tracker/CVE-2020-25657  
               python-m2crypto | CVE-2023-50781   | https://security-tracker.debian.org/tracker/CVE-2023-50781  
                     python-py | CVE-2022-42969   | https://security-tracker.debian.org/tracker/CVE-2022-42969  
                python-uvicorn | CVE-2020-7694    | https://security-tracker.debian.org/tracker/CVE-2020-7694   
                          qemu | CVE-2018-18438   | https://security-tracker.debian.org/tracker/CVE-2018-18438  
                          qemu | CVE-2019-12067   | https://security-tracker.debian.org/tracker/CVE-2019-12067  
                          qemu | CVE-2021-20255   | https://security-tracker.debian.org/tracker/CVE-2021-20255  
                          qemu | CVE-2023-2680    | https://security-tracker.debian.org/tracker/CVE-2023-2680   
                          qemu | CVE-2023-1386    | https://security-tracker.debian.org/tracker/CVE-2023-1386   
                          qemu | CVE-2024-3567    | https://security-tracker.debian.org/tracker/CVE-2024-3567   
                       qt6base | CVE-2023-51714   | https://security-tracker.debian.org/tracker/CVE-2023-51714  
                       qt6base | CVE-2023-38197   | https://security-tracker.debian.org/tracker/CVE-2023-38197  
                       qt6base | CVE-2023-34410   | https://security-tracker.debian.org/tracker/CVE-2023-34410  
                       qt6base | CVE-2023-37369   | https://security-tracker.debian.org/tracker/CVE-2023-37369  
                       qt6base | CVE-2023-33285   | https://security-tracker.debian.org/tracker/CVE-2023-33285  
                       qt6base | CVE-2023-32573   | https://security-tracker.debian.org/tracker/CVE-2023-32573  
                       qt6base | CVE-2023-32763   | https://security-tracker.debian.org/tracker/CVE-2023-32763  
                       qt6base | CVE-2023-32762   | https://security-tracker.debian.org/tracker/CVE-2023-32762  
                        quagga | CVE-2016-4049    | https://security-tracker.debian.org/tracker/CVE-2016-4049   
                        quagga | CVE-2017-3224    | https://security-tracker.debian.org/tracker/CVE-2017-3224   
                        quagga | CVE-2021-44038   | https://security-tracker.debian.org/tracker/CVE-2021-44038  
                   resiprocate | CVE-2017-9454    | https://security-tracker.debian.org/tracker/CVE-2017-9454   
                        samba4 | CVE-2011-2411    | https://security-tracker.debian.org/tracker/CVE-2011-2411   
                        samba4 | CVE-2018-14628   | https://security-tracker.debian.org/tracker/CVE-2018-14628  
                        samba4 | CVE-2021-3670    | https://security-tracker.debian.org/tracker/CVE-2021-3670   
                        samba4 | CVE-2022-32743   | https://security-tracker.debian.org/tracker/CVE-2022-32743  
                        samba4 | CVE-2022-1615    | https://security-tracker.debian.org/tracker/CVE-2022-1615   
                        samba4 | CVE-2022-38023   | https://security-tracker.debian.org/tracker/CVE-2022-38023  
                        samba4 | CVE-2022-37967   | https://security-tracker.debian.org/tracker/CVE-2022-37967  
                        samba4 | CVE-2022-37966   | https://security-tracker.debian.org/tracker/CVE-2022-37966  
                           sdl | CVE-2019-7635    | https://security-tracker.debian.org/tracker/CVE-2019-7635   
                           sdl | CVE-2019-7637    | https://security-tracker.debian.org/tracker/CVE-2019-7637   
                           sdl | CVE-2019-7638    | https://security-tracker.debian.org/tracker/CVE-2019-7638   
                           sdl | CVE-2019-7636    | https://security-tracker.debian.org/tracker/CVE-2019-7636   
                           sdl | CVE-2019-13616   | https://security-tracker.debian.org/tracker/CVE-2019-13616  
                           sdl | CVE-2019-14906   | https://security-tracker.debian.org/tracker/CVE-2019-14906  
                           sdl | CVE-2019-7576    | https://security-tracker.debian.org/tracker/CVE-2019-7576   
                           sdl | CVE-2019-7578    | https://security-tracker.debian.org/tracker/CVE-2019-7578   
                           sdl | CVE-2019-7577    | https://security-tracker.debian.org/tracker/CVE-2019-7577   
                           sdl | CVE-2019-7575    | https://security-tracker.debian.org/tracker/CVE-2019-7575   
                           sdl | CVE-2019-7573    | https://security-tracker.debian.org/tracker/CVE-2019-7573   
                           sdl | CVE-2019-7572    | https://security-tracker.debian.org/tracker/CVE-2019-7572   
                           sdl | CVE-2019-7574    | https://security-tracker.debian.org/tracker/CVE-2019-7574   
                           sdl | CVE-2020-14410   | https://security-tracker.debian.org/tracker/CVE-2020-14410  
                           sdl | CVE-2020-14409   | https://security-tracker.debian.org/tracker/CVE-2020-14409  
                        shadow | CVE-2013-4235    | https://security-tracker.debian.org/tracker/CVE-2013-4235   
                          shim | CVE-2023-40548   | https://security-tracker.debian.org/tracker/CVE-2023-40548  
                         smack | CVE-2014-0363    | https://security-tracker.debian.org/tracker/CVE-2014-0363   
                         smack | CVE-2014-0364    | https://security-tracker.debian.org/tracker/CVE-2014-0364   
                         smack | CVE-2016-10027   | https://security-tracker.debian.org/tracker/CVE-2016-10027  
                         spice | CVE-2016-0749    | https://security-tracker.debian.org/tracker/CVE-2016-0749   
                         spice | CVE-2016-2150    | https://security-tracker.debian.org/tracker/CVE-2016-2150   
                         spice | CVE-2018-10893   | https://security-tracker.debian.org/tracker/CVE-2018-10893  
                     syslog-ng | CVE-2022-38725   | https://security-tracker.debian.org/tracker/CVE-2022-38725  
                     tcpreplay | CVE-2023-4256    | https://security-tracker.debian.org/tracker/CVE-2023-4256   
                        thttpd | CVE-2012-5640    | https://security-tracker.debian.org/tracker/CVE-2012-5640   
                          tiff | CVE-2015-7313    | https://security-tracker.debian.org/tracker/CVE-2015-7313   
                          tiff | CVE-2023-6277    | https://security-tracker.debian.org/tracker/CVE-2023-6277   
                          tiff | CVE-2023-6228    | https://security-tracker.debian.org/tracker/CVE-2023-6228   
                          tiff | CVE-2023-52356   | https://security-tracker.debian.org/tracker/CVE-2023-52356  
                          tinc | CVE-2013-1428    | https://security-tracker.debian.org/tracker/CVE-2013-1428   
                           tor | CVE-2016-9079    | https://security-tracker.debian.org/tracker/CVE-2016-9079   
                           tor | CVE-2017-16541   | https://security-tracker.debian.org/tracker/CVE-2017-16541  
                      tpm2-tss | CVE-2023-22745   | https://security-tracker.debian.org/tracker/CVE-2023-22745  
                   uboot-tools | CVE-2022-2347    | https://security-tracker.debian.org/tracker/CVE-2022-2347   
                   uboot-tools | CVE-2022-33103   | https://security-tracker.debian.org/tracker/CVE-2022-33103  
                   uboot-tools | CVE-2022-30767   | https://security-tracker.debian.org/tracker/CVE-2022-30767  
                   uboot-tools | CVE-2022-34835   | https://security-tracker.debian.org/tracker/CVE-2022-34835  
                         unrar | CVE-2022-30333   | https://security-tracker.debian.org/tracker/CVE-2022-30333  
                         unzip | CVE-2021-4217    | https://security-tracker.debian.org/tracker/CVE-2021-4217   
                           upx | CVE-2023-23456   | https://security-tracker.debian.org/tracker/CVE-2023-23456  
                           upx | CVE-2023-23457   | https://security-tracker.debian.org/tracker/CVE-2023-23457  
                  vorbis-tools | CVE-2023-43361   | https://security-tracker.debian.org/tracker/CVE-2023-43361  
                           xen | CVE-2011-3346    | https://security-tracker.debian.org/tracker/CVE-2011-3346   
                           xen | CVE-2011-1936    | https://security-tracker.debian.org/tracker/CVE-2011-1936   
                           xen | CVE-2014-2580    | https://security-tracker.debian.org/tracker/CVE-2014-2580   
                           xen | CVE-2014-3672    | https://security-tracker.debian.org/tracker/CVE-2014-3672   
                           xen | CVE-2015-8553    | https://security-tracker.debian.org/tracker/CVE-2015-8553   
                           xen | CVE-2015-8550    | https://security-tracker.debian.org/tracker/CVE-2015-8550   
                           xen | CVE-2015-7504    | https://security-tracker.debian.org/tracker/CVE-2015-7504   
                           xen | CVE-2016-9383    | https://security-tracker.debian.org/tracker/CVE-2016-9383   
                           xen | CVE-2016-9380    | https://security-tracker.debian.org/tracker/CVE-2016-9380   
                           xen | CVE-2016-9386    | https://security-tracker.debian.org/tracker/CVE-2016-9386   
                           xen | CVE-2016-9379    | https://security-tracker.debian.org/tracker/CVE-2016-9379   
                           xen | CVE-2016-3960    | https://security-tracker.debian.org/tracker/CVE-2016-3960   
                           xen | CVE-2016-7092    | https://security-tracker.debian.org/tracker/CVE-2016-7092   
                           xen | CVE-2017-7228    | https://security-tracker.debian.org/tracker/CVE-2017-7228   
                           xen | CVE-2017-12137   | https://security-tracker.debian.org/tracker/CVE-2017-12137  
                           xen | CVE-2017-12135   | https://security-tracker.debian.org/tracker/CVE-2017-12135  
                           xen | CVE-2017-12134   | https://security-tracker.debian.org/tracker/CVE-2017-12134  
                           xen | CVE-2018-8897    | https://security-tracker.debian.org/tracker/CVE-2018-8897   
                           xen | CVE-2018-5244    | https://security-tracker.debian.org/tracker/CVE-2018-5244   
                           xen | CVE-2021-28039   | https://security-tracker.debian.org/tracker/CVE-2021-28039  
                           xen | CVE-2021-26313   | https://security-tracker.debian.org/tracker/CVE-2021-26313  
                           xen | CVE-2021-26314   | https://security-tracker.debian.org/tracker/CVE-2021-26314  
                           xen | CVE-2021-28707   | https://security-tracker.debian.org/tracker/CVE-2021-28707  
                           xen | CVE-2021-28704   | https://security-tracker.debian.org/tracker/CVE-2021-28704  
                           xen | CVE-2021-28702   | https://security-tracker.debian.org/tracker/CVE-2021-28702  
                           xen | CVE-2021-28713   | https://security-tracker.debian.org/tracker/CVE-2021-28713  
                           xen | CVE-2021-28712   | https://security-tracker.debian.org/tracker/CVE-2021-28712  
                           xen | CVE-2021-28703   | https://security-tracker.debian.org/tracker/CVE-2021-28703  
                           xen | CVE-2021-28708   | https://security-tracker.debian.org/tracker/CVE-2021-28708  
                           xen | CVE-2021-28700   | https://security-tracker.debian.org/tracker/CVE-2021-28700  
                           xen | CVE-2021-28701   | https://security-tracker.debian.org/tracker/CVE-2021-28701  
                           xen | CVE-2021-28711   | https://security-tracker.debian.org/tracker/CVE-2021-28711  
                           xen | CVE-2021-28696   | https://security-tracker.debian.org/tracker/CVE-2021-28696  
                           xen | CVE-2021-28697   | https://security-tracker.debian.org/tracker/CVE-2021-28697  
                           xen | CVE-2021-28690   | https://security-tracker.debian.org/tracker/CVE-2021-28690  
                           xen | CVE-2021-28695   | https://security-tracker.debian.org/tracker/CVE-2021-28695  
                           xen | CVE-2021-28699   | https://security-tracker.debian.org/tracker/CVE-2021-28699  
                           xen | CVE-2021-28694   | https://security-tracker.debian.org/tracker/CVE-2021-28694  
                           xen | CVE-2021-28693   | https://security-tracker.debian.org/tracker/CVE-2021-28693  
                           xen | CVE-2021-28698   | https://security-tracker.debian.org/tracker/CVE-2021-28698  
                           xen | CVE-2021-28687   | https://security-tracker.debian.org/tracker/CVE-2021-28687  
                           xen | CVE-2021-28692   | https://security-tracker.debian.org/tracker/CVE-2021-28692  
                           xen | CVE-2022-40982   | https://security-tracker.debian.org/tracker/CVE-2022-40982  
                           xen | CVE-2022-42325   | https://security-tracker.debian.org/tracker/CVE-2022-42325  
                           xen | CVE-2022-42311   | https://security-tracker.debian.org/tracker/CVE-2022-42311  
                           xen | CVE-2022-42321   | https://security-tracker.debian.org/tracker/CVE-2022-42321  
                           xen | CVE-2022-42313   | https://security-tracker.debian.org/tracker/CVE-2022-42313  
                           xen | CVE-2022-42333   | https://security-tracker.debian.org/tracker/CVE-2022-42333  
                           xen | CVE-2022-42315   | https://security-tracker.debian.org/tracker/CVE-2022-42315  
                           xen | CVE-2022-42316   | https://security-tracker.debian.org/tracker/CVE-2022-42316  
                           xen | CVE-2022-42314   | https://security-tracker.debian.org/tracker/CVE-2022-42314  
                           xen | CVE-2022-42326   | https://security-tracker.debian.org/tracker/CVE-2022-42326  
                           xen | CVE-2022-42318   | https://security-tracker.debian.org/tracker/CVE-2022-42318  
                           xen | CVE-2022-42317   | https://security-tracker.debian.org/tracker/CVE-2022-42317  
                           xen | CVE-2022-42312   | https://security-tracker.debian.org/tracker/CVE-2022-42312  
                           xen | CVE-2022-42320   | https://security-tracker.debian.org/tracker/CVE-2022-42320  
                           xen | CVE-2022-42309   | https://security-tracker.debian.org/tracker/CVE-2022-42309  
                           xen | CVE-2022-42332   | https://security-tracker.debian.org/tracker/CVE-2022-42332  
                           xen | CVE-2022-42324   | https://security-tracker.debian.org/tracker/CVE-2022-42324  
                           xen | CVE-2022-42331   | https://security-tracker.debian.org/tracker/CVE-2022-42331  
                           xen | CVE-2022-42322   | https://security-tracker.debian.org/tracker/CVE-2022-42322  
                           xen | CVE-2022-42319   | https://security-tracker.debian.org/tracker/CVE-2022-42319  
                           xen | CVE-2022-42323   | https://security-tracker.debian.org/tracker/CVE-2022-42323  
                           xen | CVE-2022-42334   | https://security-tracker.debian.org/tracker/CVE-2022-42334  
                           xen | CVE-2022-4949    | https://security-tracker.debian.org/tracker/CVE-2022-4949   
                           xen | CVE-2022-29901   | https://security-tracker.debian.org/tracker/CVE-2022-29901  
                           xen | CVE-2022-29900   | https://security-tracker.debian.org/tracker/CVE-2022-29900  
                           xen | CVE-2022-33743   | https://security-tracker.debian.org/tracker/CVE-2022-33743  
                           xen | CVE-2022-33745   | https://security-tracker.debian.org/tracker/CVE-2022-33745  
                           xen | CVE-2022-33742   | https://security-tracker.debian.org/tracker/CVE-2022-33742  
                           xen | CVE-2022-33747   | https://security-tracker.debian.org/tracker/CVE-2022-33747  
                           xen | CVE-2022-33748   | https://security-tracker.debian.org/tracker/CVE-2022-33748  
                           xen | CVE-2022-33746   | https://security-tracker.debian.org/tracker/CVE-2022-33746  
                           xen | CVE-2022-33741   | https://security-tracker.debian.org/tracker/CVE-2022-33741  
                           xen | CVE-2022-33740   | https://security-tracker.debian.org/tracker/CVE-2022-33740  
                           xen | CVE-2022-23824   | https://security-tracker.debian.org/tracker/CVE-2022-23824  
                           xen | CVE-2022-23960   | https://security-tracker.debian.org/tracker/CVE-2022-23960  
                           xen | CVE-2022-21127   | https://security-tracker.debian.org/tracker/CVE-2022-21127  
                           xen | CVE-2022-21166   | https://security-tracker.debian.org/tracker/CVE-2022-21166  
                           xen | CVE-2022-21125   | https://security-tracker.debian.org/tracker/CVE-2022-21125  
                           xen | CVE-2022-21123   | https://security-tracker.debian.org/tracker/CVE-2022-21123  
                           xen | CVE-2022-26362   | https://security-tracker.debian.org/tracker/CVE-2022-26362  
                           xen | CVE-2022-26361   | https://security-tracker.debian.org/tracker/CVE-2022-26361  
                           xen | CVE-2022-26364   | https://security-tracker.debian.org/tracker/CVE-2022-26364  
                           xen | CVE-2022-26357   | https://security-tracker.debian.org/tracker/CVE-2022-26357  
                           xen | CVE-2022-26359   | https://security-tracker.debian.org/tracker/CVE-2022-26359  
                           xen | CVE-2022-26363   | https://security-tracker.debian.org/tracker/CVE-2022-26363  
                           xen | CVE-2022-26358   | https://security-tracker.debian.org/tracker/CVE-2022-26358  
                           xen | CVE-2022-26360   | https://security-tracker.debian.org/tracker/CVE-2022-26360  
                           xen | CVE-2022-26365   | https://security-tracker.debian.org/tracker/CVE-2022-26365  
                           xen | CVE-2022-23039   | https://security-tracker.debian.org/tracker/CVE-2022-23039  
                           xen | CVE-2022-23035   | https://security-tracker.debian.org/tracker/CVE-2022-23035  
                           xen | CVE-2022-23038   | https://security-tracker.debian.org/tracker/CVE-2022-23038  
                           xen | CVE-2022-23037   | https://security-tracker.debian.org/tracker/CVE-2022-23037  
                           xen | CVE-2022-23033   | https://security-tracker.debian.org/tracker/CVE-2022-23033  
                           xen | CVE-2022-23041   | https://security-tracker.debian.org/tracker/CVE-2022-23041  
                           xen | CVE-2022-23036   | https://security-tracker.debian.org/tracker/CVE-2022-23036  
                           xen | CVE-2022-23042   | https://security-tracker.debian.org/tracker/CVE-2022-23042  
                           xen | CVE-2022-23040   | https://security-tracker.debian.org/tracker/CVE-2022-23040  
                           xen | CVE-2023-20588   | https://security-tracker.debian.org/tracker/CVE-2023-20588  
                           xen | CVE-2023-34320   | https://security-tracker.debian.org/tracker/CVE-2023-34320  
                           xen | CVE-2023-34322   | https://security-tracker.debian.org/tracker/CVE-2023-34322  
                           xen | CVE-2023-34323   | https://security-tracker.debian.org/tracker/CVE-2023-34323  
                           xen | CVE-2023-34325   | https://security-tracker.debian.org/tracker/CVE-2023-34325  
                           xen | CVE-2023-34324   | https://security-tracker.debian.org/tracker/CVE-2023-34324  
                           xen | CVE-2023-34319   | https://security-tracker.debian.org/tracker/CVE-2023-34319  
                           xen | CVE-2023-34326   | https://security-tracker.debian.org/tracker/CVE-2023-34326  
                           xen | CVE-2023-34327   | https://security-tracker.debian.org/tracker/CVE-2023-34327  
                           xen | CVE-2023-34321   | https://security-tracker.debian.org/tracker/CVE-2023-34321  
                           xen | CVE-2023-4949    | https://security-tracker.debian.org/tracker/CVE-2023-4949   
                           xen | CVE-2023-46835   | https://security-tracker.debian.org/tracker/CVE-2023-46835  
                           xen | CVE-2023-46837   | https://security-tracker.debian.org/tracker/CVE-2023-46837  
                           xen | CVE-2023-46836   | https://security-tracker.debian.org/tracker/CVE-2023-46836  
                        xerces | CVE-2012-0880    | https://security-tracker.debian.org/tracker/CVE-2012-0880   
                          yajl | CVE-2023-33460   | https://security-tracker.debian.org/tracker/CVE-2023-33460  
                          yasm | CVE-2021-33465   | https://security-tracker.debian.org/tracker/CVE-2021-33465  
                          yasm | CVE-2021-33463   | https://security-tracker.debian.org/tracker/CVE-2021-33463  
                          yasm | CVE-2021-33462   | https://security-tracker.debian.org/tracker/CVE-2021-33462  
                          yasm | CVE-2021-33464   | https://security-tracker.debian.org/tracker/CVE-2021-33464  
                          yasm | CVE-2021-33457   | https://security-tracker.debian.org/tracker/CVE-2021-33457  
                          yasm | CVE-2021-33456   | https://security-tracker.debian.org/tracker/CVE-2021-33456  
                          yasm | CVE-2021-33454   | https://security-tracker.debian.org/tracker/CVE-2021-33454  
                          yasm | CVE-2021-33468   | https://security-tracker.debian.org/tracker/CVE-2021-33468  
                          yasm | CVE-2021-33458   | https://security-tracker.debian.org/tracker/CVE-2021-33458  
                          yasm | CVE-2021-33467   | https://security-tracker.debian.org/tracker/CVE-2021-33467  
                          yasm | CVE-2021-33459   | https://security-tracker.debian.org/tracker/CVE-2021-33459  
                          yasm | CVE-2021-33460   | https://security-tracker.debian.org/tracker/CVE-2021-33460  
                          yasm | CVE-2021-33455   | https://security-tracker.debian.org/tracker/CVE-2021-33455  
                          yasm | CVE-2021-33466   | https://security-tracker.debian.org/tracker/CVE-2021-33466  
                          yasm | CVE-2021-33461   | https://security-tracker.debian.org/tracker/CVE-2021-33461  
                          yasm | CVE-2023-51258   | https://security-tracker.debian.org/tracker/CVE-2023-51258  
                          yasm | CVE-2023-31974   | https://security-tracker.debian.org/tracker/CVE-2023-31974  
                          yasm | CVE-2023-31973   | https://security-tracker.debian.org/tracker/CVE-2023-31973  
                          yasm | CVE-2023-31972   | https://security-tracker.debian.org/tracker/CVE-2023-31972  
                           zip | CVE-2018-13410   | https://security-tracker.debian.org/tracker/CVE-2018-13410  


-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
