Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77995C25B74
	for <buildroot@archiver.kernel.org>; Sun,  2 Jun 2024 04:03:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4D4B8423A3;
	Sun,  2 Jun 2024 04:03:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BA-xouTxIrNJ; Sun,  2 Jun 2024 04:03:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 829B341D7E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 829B341D7E;
	Sun,  2 Jun 2024 04:03:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C14DB1BF852
 for <buildroot@lists.busybox.net>; Sun,  2 Jun 2024 04:03:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A341D8447A
 for <buildroot@lists.busybox.net>; Sun,  2 Jun 2024 04:03:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gPV8xlk4ZChc for <buildroot@lists.busybox.net>;
 Sun,  2 Jun 2024 04:03:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::226;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EC98984445
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EC98984445
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EC98984445
 for <buildroot@buildroot.org>; Sun,  2 Jun 2024 04:03:06 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CC4D9C000C
 for <buildroot@buildroot.org>; Sun,  2 Jun 2024 04:03:03 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sun, 02 Jun 2024 04:03:03 -0000
X-GND-Sasl: bot@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1717300984; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=eJUApM19h0GwjB73ZiLBWTCNWg6b+10GPp+NjJnXVKo=;
 b=ZcNAF96rn+GwLYMercdysqxusuvc7RkMDGUkd//Bdz/OMeuFsdkP2zOWgUp7eJ6g6ySqXz
 JwqS/kzCuot1R3u0bmiHdEgnaZ+S96s6IY/5kP+XPkrsBnJC9VjBdJK5dM1xnwljbQD2+z
 msj02CQd6AW55oBpR6y8WZGu5Tjow/T4Dbj1zixkTRRJwJ/gUKpV8A70X8vF9PYeqpLVPr
 XCJM9A4j/ecgYypJ9BgEfltFpoSic9iTFftkZJfRaDyD/XcGLnXoyS0YJX02waVw2V2ouq
 O5UqRhHHGtC+0rIJh8BTZ97/haTL4AW13JTmLTLOcf5EGEMKRGukBhq+QI8jKQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ZcNAF96r
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2024-06-01
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
Message-ID: <20240602040303.WztnE_52rPe3Z3FR2rbw3_4q1idHCI9Bgvm79MrHmT0@z>

Hello,

Autobuild statistics for 2024-06-01
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  6  |  3  |  0  |  9  |
    master   | 189 | 571 |  0  | 760 |

Classification of failures by reason for master
-----------------------------------------------

host-prelink-cross-a853a5d7... | 91
            host-cdrkit-1.1.11 | 49
ibm-sw-tpm2-5452af422edeff7... | 31
                libressl-3.8.4 | 28
                    mpir-3.0.0 | 22
                host-odb-2.4.0 | 19
             host-vala-0.56.14 | 17
      host-riscv-isa-sim-1.1.0 | 16
host-android-tools-4.2.2+gi... | 14
host-vboot-utils-bbdd62f9b0... | 13
                host-go-1.22.3 | 12
                elfutils-0.189 | 9 
                fail2ban-1.0.2 | 9 
                  ffmpeg-6.1.1 | 9 
        host-python-lxml-5.1.0 | 9 
                   linux-6.8.9 | 9 
check-11970a7e112dfe243a2e6... | 7 
                  libffi-3.4.6 | 7 
              libopenssl-3.3.0 | 7 
                 uclibc-1.0.48 | 7 
                       unknown | 7 
aer-inject-9bd5e2c7886fca72... | 6 
                  bcusdk-0.0.5 | 6 
                 coreutils-9.3 | 5 
                gnu-efi-3.0.18 | 5 
              libarchive-3.7.4 | 5 
          libcamera-apps-1.2.1 | 5 
android-tools-4.2.2+git2013... | 4 
                     bc-1.07.1 | 4 
                   foot-1.16.2 | 4 
 host-softether-4.30-9700-beta | 4 
               ipmitool-1_8_19 | 4 
               libglib2-2.76.1 | 4 
                 openssh-9.7p1 | 4 
glibc-2.39-5-ge0910f1d3278f... | 3 
                 gnuplot-6.0.0 | 3 
              host-rust-1.74.1 | 3 
                    ncmpc-0.49 | 3 
pppd-e1266c76d1ad39f98f1167... | 3 
         python-remi-2022.7.27 | 3 
                 apache-2.4.59 | 2 
                 avro-c-1.11.3 | 2 
     bandwidthd-2.0.1-auto-r11 | 2 
                 cdrkit-1.1.11 | 2 
cegui-00b4e1fe174da53b7ed72... | 2 
         host-gcc-final-13.2.0 | 2 
host-heimdal-f4faaeaba371ff... | 2 
         host-libxcrypt-4.4.36 | 2 
        host-sentry-cli-2.20.3 | 2 
                       kmod-31 | 2 
                libglvnd-1.4.0 | 2 
                 libp11-0.4.12 | 2 
           libzenoh-c-0.11.0.2 | 2 
               lighttpd-1.4.76 | 2 
                  linux-6.8.12 | 2 
              skalibs-2.12.0.1 | 2 
             sofia-sip-1.13.17 | 2 
                      tar-1.35 | 2 
             util-linux-2.39.3 | 2 
                    vlc-3.0.20 | 2 
                  acpid-2.0.34 | 1 
                     apr-1.7.2 | 1 
                apr-util-1.6.3 | 1 
                   bird-2.0.12 | 1 
                  bitcoin-26.0 | 1 
                 c-icap-0.5.10 | 1 
             containerd-1.7.14 | 1 
                     crun-1.12 | 1 
             dahdi-linux-3.3.0 | 1 
                 dc3dd-7.2.641 | 1 
                 dhcp-4.4.3-P1 | 1 
                   dhrystone-2 | 1 
         docker-compose-2.27.0 | 1 
              e2fsprogs-1.47.0 | 1 
                      ell-0.65 | 1 
                   exim-4.97.1 | 1 
                    eza-0.18.8 | 1 
                     file-5.45 | 1 
fs/axfs/axfs.mk:32: /home/a... | 1 
                    gdal-3.8.2 | 1 
            gdk-pixbuf-2.42.10 | 1 
          gitlab-runner-15.5.0 | 1 
  gobject-introspection-1.76.1 | 1 
            host-fakeroot-1.34 | 1 
       host-gcc-initial-14.1.0 | 1 
                 host-gdb-12.1 | 1 
                    htop-3.3.0 | 1 
                      jq-1.7.1 | 1 
                  kexec-2.0.28 | 1 
                  ledmon-1.0.0 | 1 
               libdeflate-1.20 | 1 
                  libnfs-5.0.3 | 1 
               libpthsem-2.0.8 | 1 
                librsvg-2.50.9 | 1 
                 libvpl-2.11.0 | 1 
               lightning-2.2.3 | 1 
          linux-5.10.162-cip24 | 1 
     linux-5.10.162-cip24-rt10 | 1 
         linux-headers-5.4.277 | 1 
                   linux-tools | 1 
                memtest86-6.20 | 1 
          ncurses-6.4-20230603 | 1 
                  ntp-4.2.8p17 | 1 
                     nut-2.8.2 | 1 
               openblas-0.3.27 | 1 
               pciutils-3.10.0 | 1 
          python-grpcio-1.60.0 | 1 
           python-numpy-1.25.0 | 1 
           python-zlmdb-22.6.1 | 1 
                python3-3.11.8 | 1 
            qbee-agent-2024.09 | 1 
                    qemu-9.0.0 | 1 
                   qpdf-10.5.0 | 1 
                    rtty-8.1.0 | 1 
sconeserver-8d1935919a20133... | 1 
                     shim-15.8 | 1 
             strongswan-5.9.13 | 1 
uclibc-ng-test-0f303c63fab7... | 1 
                 x11vnc-0.9.16 | 1 
                xenomai-3.0.10 | 1 
                    zeek-4.1.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |          acpid-2.0.34          | NOK | http://autobuild.buildroot.net/results/8b6d6fb92384100c02b00165342be1b745073c23 | ORPH
   mipsel    | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/3b111b4fb8a53a919af289474175907d789d4c6a | ORPH
   nios2     | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/6f40a0a3932a7e9605a14d10182bea9697b82344 | ORPH
   s390x     | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/304e3942f8a0203722aef2327bc161715ea3a820 | ORPH
   mipsel    | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/4cb92939e8676bfeaac76477f1df3c4a2a5c13f1 | ORPH
   mips64    | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/0e4471322451548f8e39ccea617b4dc4dd615ee7 | ORPH
  sparc64    | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/ce6d956981722b7e4498deeca1683728f053ff45 | ORPH
    mips     | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/dbc902b2aa764856134f879e1b1c091436c5d60f |     
  powerpc    | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/f770e4792e35720d1f35cb26e0d76ecc58fcd5ea |     
   armeb     | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/98db828740afee5cc37efbff43f2aa37a8442975 |     
   mipsel    | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/e92801e5e9e06d73e0fa06a855f7d0cb03234fe7 |     
  sparc64    |         apache-2.4.59          | NOK | http://autobuild.buildroot.net/results/3cd1ecf1b3e953d2bd1783aaa46534bad7e73e63 |     
   nios2     |         apache-2.4.59          | NOK | http://autobuild.buildroot.net/results/53278e0cc26b9cb6fa50d5fd8fee4fe7d73ec8cc |     
   mips64    |           apr-1.7.2            | NOK | http://autobuild.buildroot.net/results/52a200731e87eec252b17894401c9c4e59a2cfc7 |     
   nios2     |         apr-util-1.6.3         | NOK | http://autobuild.buildroot.net/results/4b1088a705f8564f85e629316f5cfc92953f0047 |     
 powerpc64   |         avro-c-1.11.3          | NOK | http://autobuild.buildroot.net/results/dd464feff6a9c46c57a8ecb62e9ac2d3e45cf0c0 |     
   mips64    |         avro-c-1.11.3          | NOK | http://autobuild.buildroot.net/results/030a7ccf07d3abd00aa25deaa57e1bb500bf0344 |     
   mips64    |   bandwidthd-2.0.1-auto-r11    | NOK | http://autobuild.buildroot.net/results/499608ad5a85ba3b5e2b3b45b7dfa43ae1f754f8 |     
   sparc     |   bandwidthd-2.0.1-auto-r11    | NOK | http://autobuild.buildroot.net/results/0020dd02ae0ae9f5d38e5a04459117b0448ac510 |     
   s390x     |           bc-1.07.1            | NOK | http://autobuild.buildroot.net/results/26a96b46bc05bd5ef415c13dedd2ba439d406176 | ORPH
    mips     |           bc-1.07.1            | NOK | http://autobuild.buildroot.net/results/7e61677b220109c01bf50843cc2d1c8ddb5df82b | ORPH
   armeb     |           bc-1.07.1            | NOK | http://autobuild.buildroot.net/results/ed92eafbedb059b7c2e531f63d338f10817867fc | ORPH
  riscv64    |           bc-1.07.1            | NOK | http://autobuild.buildroot.net/results/cf31cf27a3d693acedf056ad71fa08e2d88ec56c | ORPH
    arm      |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/3b01f694abd4f1d588d74dda09cd8a25a47dbb94 |     
    arc      |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/70d49ccf45e9a3fbf48cb47a7dc8bf84da6bd598 |     
   nios2     |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/a1d19cfbb44f1c2033552e7a19ec42d03a5a9a23 |     
   arceb     |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/9aa2c4752fcf9dd48e10db1a1fec3c7def0c8814 |     
    arm      |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/6457cf34325dbe3a322fded52f9c15496a27ba12 |     
 aarch64_be  |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/395881ca3bd17fc809111726fd75481f1353a260 |     
  powerpc    |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/1565bf7049af7429fdc41fe7c341ea09b0c8c19f |     
    m68k     |          bitcoin-26.0          | NOK | http://autobuild.buildroot.net/results/0807f666790440233b19aa96622e7056f1c90a5a |     
  aarch64    |         c-icap-0.5.10          | NOK | http://autobuild.buildroot.net/results/ae8a0e3673c5ac3c85a43a8a5e0c61e75e80c486 | ORPH
   mips64    |         cdrkit-1.1.11          | NOK | http://autobuild.buildroot.net/results/250b5babb612028c02f3c9fe6448f62767b43253 |     
   sh4aeb    |         cdrkit-1.1.11          | NOK | http://autobuild.buildroot.net/results/3af05be72a647b4e7fcdaafc690f2e04716165fc |     
   nios2     | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/57f0607720bec24233f66e12fd9dfa3dcb9b6cde |     
    or1k     | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/5677622409cef6a236254d6b723edc855da5572f |     
   sparc     | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/549efa8d20124e2e63a3402bcafe4e22390a6807 | ORPH
  riscv64    | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/1616ba8028f2ef7756aee3242813e80871224c1a | ORPH
    arc      | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/0410a642aefbccb3b877630ec797914545c37c04 | ORPH
    m68k     | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/97038f0b20d463a017610dd8a8995588036ebc1e | ORPH
 aarch64_be  | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/a777d2217d98a0e1c3d3aa3e300c7b626bbf21c7 | ORPH
  powerpc    | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/f1b9ab4b254ab70ed44bda5143d4442b6615b36f | ORPH
  mips64el   | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/d78e57e5b4ab669ae8f2ede3a33645891f6bb5d4 | ORPH
  riscv64    |       containerd-1.7.14        | NOK | http://autobuild.buildroot.net/results/31115c9358d453aa84aee5419443c1c7f5b254b1 |     
    i686     |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/bafaecf8924cf9906e3a63e3bb322df4ce6be331 | ORPH
   mipsel    |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/95e162216ce30f69eb5a7f396d06a2043201df30 | ORPH
   nios2     |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/23b4b5081d07857afff254a771078886179f7a1b | ORPH
    sh4      |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/7fa7608ffdaf3019a6d328b763f646d35dfd9830 | ORPH
    arm      |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/2d60e4591b085b57a44cff1811eaa35d65d54add | ORPH
   x86_64    |           crun-1.12            | NOK | http://autobuild.buildroot.net/results/cf88b7601c952311df4dfe7b4425e5a2463fc806 |     
   s390x     |       dahdi-linux-3.3.0        | NOK | http://autobuild.buildroot.net/results/8c04468d92d830eae8b1a446430258b3a1f78838 |     
    i686     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/b464ef6ade33fe97d996abbe1af4058315493853 | ORPH
    arm      |         dhcp-4.4.3-P1          | NOK | http://autobuild.buildroot.net/results/d4c2b724f469dc5fc88e6c8543672523d644bf8a | ORPH
    arm      |          dhrystone-2           | NOK | http://autobuild.buildroot.net/results/f506e0873d62d156f4fa1f86fd07a74ae0219488 | ORPH
   x86_64    |     docker-compose-2.27.0      | NOK | http://autobuild.buildroot.net/results/cd3a19e9172fb49591fe3a1a7da28c09a4919495 |     
   sh4eb     |        e2fsprogs-1.47.0        | NOK | http://autobuild.buildroot.net/results/2ca2b7b412d957044c297f33fa33c0c2cfd502c7 | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/949d2d08ecbaedda12594a1b3fa599f5c2d2b12c | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/6c06039765ad2daf1e378f09a0232c9ee301521a | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/bba2858ec3c85ae23c10a615547f7e7f457c66d8 | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/3522a6e56ab7e8869f7a4f5460a75423e9e320aa | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/7916c0994a91bd1efdd00b59eafafd8d9a0abfde | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/1d02addad01cb574bbd6c46781943f09c0129c55 | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/8e360804d5879bc25ffa3b387abba01a4106cb9e | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/bafa93d28e32885495a268e692e8c4d83f689148 | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/39938a0e2f9dae5d36f9cf23fafe277cc290e833 | ORPH
    sh4      |            ell-0.65            | NOK | http://autobuild.buildroot.net/results/80b60d44db4ae1c8a19a4ad940175252c52fd354 | ORPH
   armeb     |          exim-4.97.1           | NOK | http://autobuild.buildroot.net/results/00d0c6ea27639f4e1c4e7a4f3799f701097443a5 |     
  mips64el   |           eza-0.18.8           | NOK | http://autobuild.buildroot.net/results/9117809c319f8de9bc66f25b6ee5c740c363d768 |     
   mips64    |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/c7cdc540e8dddd91def3bf6e77c356788cc47d38 |     
   mips64    |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/b6cd11872cfe530d9472f91f236d4dc20fe7afde |     
    arm      |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/b57444094444263d315bc2758d7f7ba15bc53af3 |     
microblazeel |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/6d78f2d36aedbb1905042841307a6beb442a9826 |     
    sh4a     |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/037f9da554186c986a28acddac4995bc1e8611e4 |     
   s390x     |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/adb567a3da0c407eee29490f8e671da1d1a9eb97 |     
    mips     |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/ec118cabbe140a28554d1720e7cead2b451dce01 |     
    or1k     |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/4ba25f46bb368fa4177d1f99752b758c7c8f94a1 |     
   mipsel    |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/886ddd628f45ca66420d2c6b75a9b9bfd71ac6f9 |     
microblazeel |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/e6d5bd30162a03108d6c0c58809a319269878a52 |     
    arc      |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/f1a4402e43bb0e3e2a77b2db1ecfc5f5a6097052 |     
 microblaze  |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/0cc8c2c6790398827f8fe3757048a540a61b568e |     
 microblaze  |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/efa2837c0fe256737966ac213f313dd4984ad5c8 |     
microblazeel |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/3c2c005e0294fb6c0a5d14a210ba4121114eabf5 |     
    arc      |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/223db017762fb76fdcedc3594af14c57136bf06d |     
 microblaze  |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/ab186e55b565255f53acbcd6e9de48f7121dafce |     
microblazeel |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/10ef709d9fdfdfd12044946103a2b0a1b7a9a29d |     
    arc      |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/4a0f238c8351e1f1fb800dee25a48da7cfa25851 |     
    arm      |           file-5.45            | NOK | http://autobuild.buildroot.net/results/62a7d02cef6d417cc4e3d45145364e5cde7a9788 | ORPH
   nios2     |          foot-1.16.2           | NOK | http://autobuild.buildroot.net/results/36fd6e0c412552efe175c9c396293fd654030820 |     
  powerpc    |          foot-1.16.2           | NOK | http://autobuild.buildroot.net/results/762daa28d8069db3b67a58e018734e15c8df86cc |     
   nios2     |          foot-1.16.2           | NOK | http://autobuild.buildroot.net/results/a20a4263820a1d41a2b393514e2e1f4a307050f1 |     
   armeb     |          foot-1.16.2           | NOK | http://autobuild.buildroot.net/results/88fcb5a9bf7ab22a95118773c20b64dba672367f |     
    or1k     | fs/axfs/axfs.mk:32: /home/a... | NOK | http://autobuild.buildroot.net/results/03f012ee6fae7bc2f05470b2f6a7551c486792f2 |     
    sh4      |           gdal-3.8.2           | NOK | http://autobuild.buildroot.net/results/8710c072b2f47a677f6a81b43733a443249d2ad8 |     
powerpc64le  |       gdk-pixbuf-2.42.10       | NOK | http://autobuild.buildroot.net/results/03c3eb15865466b2b90f4cca4a12c4bd9b0d3320 | ORPH
   x86_64    |      gitlab-runner-15.5.0      | NOK | http://autobuild.buildroot.net/results/6c1a033ebf7f0cce32c85cbc6f2817e6df6bb872 |     
powerpc64le  | glibc-2.39-5-ge0910f1d3278f... | NOK | http://autobuild.buildroot.net/results/c5bdb6a99267f23db8c84cb48fa9083f4005eb13 |     
powerpc64le  | glibc-2.39-5-ge0910f1d3278f... | NOK | http://autobuild.buildroot.net/results/cb1958844a07badc2b9287865a092a588b1737f0 |     
powerpc64le  | glibc-2.39-5-ge0910f1d3278f... | NOK | http://autobuild.buildroot.net/results/b8251dd2f9f1cd50c1f30a3f4a6b418012c7beff |     
  aarch64    |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/f453b3b6dde96784c5fc35675fb195a4a55a88bf |     
  riscv64    |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/32dc159390619aed76d21833dddf7d38e520a7c5 |     
 aarch64_be  |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/586f38cd02b4f10735f89978565b51ec065029f6 |     
 aarch64_be  |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/2fbd581e5bb351d7707e25daaaa731ab9777cd19 |     
  riscv64    |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/79ac1335cee2a9049f853ab24281dce0c0275c48 |     
   nios2     |         gnuplot-6.0.0          | NOK | http://autobuild.buildroot.net/results/568de1ff0bd653800e01b0b5ae7f1af315e80fda |     
  mips64el   |         gnuplot-6.0.0          | NOK | http://autobuild.buildroot.net/results/bab01b758953f8aeaf37fee1681735e189e533f4 |     
   nios2     |         gnuplot-6.0.0          | NOK | http://autobuild.buildroot.net/results/c6546d92966db9eb3c29130dbd790e399278e0e8 |     
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/1d0488c054858782febab67ddc3919dc8d98af33 | ORPH
 powerpc64   | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/06fe47b0e347854c6403bcc591c8dbcc73b3f750 |     
   sparc     | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/e909e40d4610238cf450887de410d47c73adb91d |     
    or1k     | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/82f29b3e1255436b293966add669bb7253fa5c81 |     
  aarch64    | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/e6d53a2a5c0d84ad68ebe963a5321bdc3fa4d50c |     
   arceb     | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/a2ef0ff89bfc389d2c88a8e20c8d4b788ef13cae |     
   s390x     | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/df562834a8add6f333fc49eee9230e2cd0e62359 |     
    mips     | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/b770ca5afe02557cf3b5cc25f64619d83f4bb8e3 |     
   s390x     | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/f22257ac12a7c16ef331194b5636a15ab860a409 |     
   mips64    | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/3820f78426c03c52d13d3664cc4e2b5546b4de2f |     
   armeb     | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/171f5f3380a8c8deeab449e4501d9a5c4c50d929 |     
   mipsel    | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/643edbeeaf35330376e55ab6a4ee4ce408e7727c |     
    mips     | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/8cfd53fa0b2ebb8f04934b3418247e4cd982bb3d |     
    arc      | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/8895fcb094065fec23c8d0728f7e008532c2941d |     
    or1k     | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/ffccec6bc21c0f8018ba7e630c69861f4ef1394e |     
   armeb     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/9f81b9df2a2291df0712b9216d845de56a35b559 |     
   sparc     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/aa0cc4fb4f69c57e2ba6bba16802ecb10776666f |     
microblazeel |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/3610ab2716c664a84ca8be536cb9a97336a45721 |     
   xtensa    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/f14e8447722662ce1d867b8b0cf93da32e3d5c56 |     
powerpc64le  |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/7879291bc4437b487d26f6ab81abd493d1c7f305 |     
   nios2     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/05445f34b88cebfbfd9758ce51158aa6314d42a6 |     
  aarch64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/b2f3093306cb7d765d81dd441fe29fc09c9f41b1 |     
   armeb     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/b5fe0b49e4f01370f2acb54908152e06bb2ac790 |     
 microblaze  |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/247db4c92ede619c0a1ae2d835c79ea4ce63e339 |     
  mips64el   |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/09d186515a22bfd23c1571ccd5a0ae7f4c7b5875 |     
 microblaze  |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/189ce9d66c9e3f5032ca13daa5451d62f8a80ea7 |     
  powerpc    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/2d8dc9650b0acc2efd48ff7679ca2f8bec0b7947 |     
  sparc64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/0647b56c7e87b3149fa8b96d20f36c7fca750981 |     
  aarch64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/89e24d371af29f8efe206a6506c360c23014f3e1 |     
   s390x     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/d5cc3ca0e59c74ae1e9490345a6cc42ac2ab9eea |     
    or1k     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/ec0668621eee486f0ef717a72640f1e851ef107e |     
   mips64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/f9fecaa65f8bcb8c82bc97039f2d70a138fcdc52 |     
  riscv64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/d6d9c12d0dac0e20aa7e7d0d881b659ab6473727 |     
   x86_64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/2c7e7a44ed1c25ecd1e14532072cf3f3fbd6aa7e |     
 aarch64_be  |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/b68e259d39c7420bf54f2f90eff445906eedbcb5 |     
 aarch64_be  |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/b935f36641016dac6a9096e60294e6917cbbf0b2 |     
    arc      |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/41eb230668190f4a2e59b45b3828868e7253f56a |     
powerpc64le  |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/cd870e900b2257d551e6522c4f32703997293ee8 |     
   xtensa    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/7b8d08f008c3ee3cb94d9367f4f86fdaa79005b9 |     
powerpc64le  |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/ca40a4271f2c2e5a4a4390dc3837f41e0befa2db |     
    mips     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/291c3c88bf14db25027c8fea54b5ce086ac048f3 |     
  powerpc    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/961717fbb97f9f3454c55eafcbf471381db570e1 |     
 microblaze  |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/d6b5e847373897f9f92d0454dba4fa0a0e95a822 |     
   x86_64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/d9c5c943af42861f4cf75cabce1653c8b76c202e |     
  sparc64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/2d236f26634c48d6020a0814c9fb33ed75e3310d |     
   sh4aeb    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/b023c28aea413f9c8a2d6620c68f45f72659e6ed |     
 powerpc64   |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/798fb07fbc74447f95d60b6038a53e73666b7b7b |     
   arceb     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/03afeea92ba27824334541062c599e60a0c426bd |     
   s390x     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/47671d6b97937996b60696334b386dd19f49e65b |     
    mips     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/93bf72e2e9926f289b6dcf70e389606173acea3b |     
  mips64el   |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/6401f95bd7c5a867bffe066686559537aa59e6d4 |     
   mips64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/805e7edccfa343a43b9dea069b803191d70be7ed |     
   s390x     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/fe02b0bb6d9b6116bb68b50175b014a45593c342 |     
   nios2     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/2f1651e29eaf3ffdc0a83ffa28ba910834a3cf7a |     
   sparc     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/96221af33a5c83d0dcf90ad07d0823ce09be8b63 |     
 aarch64_be  |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/c6996bf23b5c553ed9d76df04c9c6b20bc34dd9c |     
  riscv64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/22774a452503f294b13b674f95d43a8d6180deb0 |     
   mipsel    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/714533ef329d324096beebb9bba03c60d4bcc4dc |     
    arc      |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/b5443f8bdf6921556e96a3b72a510833bb72fde1 |     
   s390x     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/0f30e024ae6ba32d2f79516d6443fc5ff48cf05b |     
    i686     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/71b46f0241117b312695253373f9bde298269f7b |     
 microblaze  |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/62f51ed7f2b6a7a81f918c3a92f6a306ee135d1d |     
  riscv64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/f184e9262dcf85171d0c4c1f7a070f1247fe34c5 |     
  powerpc    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/6e14a3aec5aabfdd8ed1a1e21ae03f6fbecfd2f8 |     
 microblaze  |       host-fakeroot-1.34       | NOK | http://autobuild.buildroot.net/results/9928beb9318d3b40b3ac859fca2ccc30e09fca5b | ORPH
 microblaze  |     host-gcc-final-13.2.0      | NOK | http://autobuild.buildroot.net/results/958807ee910c258c9e280ae5c941984191cc857b |     
 microblaze  |     host-gcc-final-13.2.0      | NOK | http://autobuild.buildroot.net/results/3105fb12b42af42b2a113d134d7b5932a073f64a |     
    mips     |    host-gcc-initial-14.1.0     | NOK | http://autobuild.buildroot.net/results/bccacc0da2ebeacbce4a7820c062134bfa081054 |     
   sparc     |         host-gdb-12.1          | NOK | http://autobuild.buildroot.net/results/e743a83f2ed5fdb327b2f62c813d86eee8104c0e | ORPH
   mips64    |         host-go-1.22.3         | NOK | http://autobuild.buildroot.net/results/f5cbf721a55f64227532adfc5e47b6d92a595e30 |     
  riscv64    |         host-go-1.22.3         | NOK | http://autobuild.buildroot.net/results/4fcd43b8bcaa33b73dcfe7cedef02341b4ddfa5b |     
    i586     |         host-go-1.22.3         | NOK | http://autobuild.buildroot.net/results/99eb286f5595d3e2686f987b8a49891dcf6e6d8c |     
  mips64el   |         host-go-1.22.3         | NOK | http://autobuild.buildroot.net/results/aca4aaaf4c5d0648cc8f1ce88e88d521c4893b76 |     
  riscv64    |         host-go-1.22.3         | NOK | http://autobuild.buildroot.net/results/760a7b97083eb77c5104742bfda3f9134dc34acd |     
   mips64    |         host-go-1.22.3         | NOK | http://autobuild.buildroot.net/results/9675c02a14520760e0798ffa5c4f61c378ce2b26 |     
  riscv64    |         host-go-1.22.3         | NOK | http://autobuild.buildroot.net/results/d6986c660b3b4b586071a9eb8050ec3ec97c1eaa |     
  riscv64    |         host-go-1.22.3         | NOK | http://autobuild.buildroot.net/results/fd387e2f2de22832e89b678ad5bfd26c5ac5c53f |     
   mips64    |         host-go-1.22.3         | NOK | http://autobuild.buildroot.net/results/2fd4f68fd66863f33194177e8d48724d960a6508 |     
  riscv64    |         host-go-1.22.3         | NOK | http://autobuild.buildroot.net/results/b4ccbad36c686476e88377b9b5bdd6be2ef44ec9 |     
  aarch64    |         host-go-1.22.3         | NOK | http://autobuild.buildroot.net/results/74c1dde49b7a41f3912eac71bf77c8693f4e1736 |     
  riscv64    |         host-go-1.22.3         | NOK | http://autobuild.buildroot.net/results/dbd59c69c84deddcb1181c3805db36f8b18418c6 |     
    i686     | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/18c191f91abac1c91e0c3d1631031241c2115569 | ORPH
  sparc64    | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/6b81b43828d53dfcde1e9dd23e1684647464aa91 | ORPH
    i686     |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.net/results/d948ea126afd31545af25a99aaef68dc38dc9832 |     
   mipsel    |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.net/results/8ea4f0487a4ed192c0ee40bc4bf30baeb398116f |     
    or1k     |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/5513b44d90382042953d8bf05c46ee97ef0db67c | ORPH
   arceb     |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/2ab59577c6ccd668b866b294108407b1815a7367 | ORPH
    mips     |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/a855b7d04e78ed1de97e101814072e0883d7ab2d | ORPH
 powerpc64   |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/b76a1315d78d011d564674aa519cf06d3686babf | ORPH
   x86_64    |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/bdbe47ee9b4d2aca15cf2f0f7364d56d7a92b211 | ORPH
microblazeel |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/fa3374e4d4bc98a03163ed480a8590f2cf50863b | ORPH
    arm      |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/0ccaa3ffd9bf11ace7baee116314cbda7b857d7a | ORPH
   x86_64    |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/1276e7660087dcc33010627bbc7a918e4bde4fe3 | ORPH
    mips     |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/02b20ba90e0ba13674ce50fed6fa5c664074ad53 | ORPH
    arc      |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/6ca1467808105f10be311637f42f53bdd76dcbbe | ORPH
 microblaze  |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/865aaeebefab5ae7d1e0b25f9892bb93d638fb04 | ORPH
  aarch64    |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/f7e6e97b9599c1757d3e3a62e52c479cbbef7e20 | ORPH
    arm      |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/bfc673bde4248f2f3ee58479f6eeb6ffb296916c | ORPH
   x86_64    |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/537fc5e562b5e4c6ff5719bf5e05a44f300bd225 | ORPH
   mips64    |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/b4fc5e05716ca64e10764717d8c9177e00495ed1 | ORPH
 aarch64_be  |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/a848d06a4f209b82abbbcab84119939149463832 | ORPH
    arc      |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/0926b6a92c484d3f6873c80f53b2d3564ee11615 | ORPH
   sh4aeb    |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/ecf9cb2d5e2091ce58e38e3519f72ad7c903e619 | ORPH
   sparc     |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/ce5393268be70add8559ca29b898fb7c1a9bff9e | ORPH
    arc      | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/45248f60a01646490626e59ecfe5aed2726c10f7 | ORPH
   nios2     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/753a933d20ee2a51d1029f63b7670377bfe4303b | ORPH
 powerpc64   | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/27900cb62c3c8a31bd80c537a07fcf3eb9ee9011 | ORPH
 microblaze  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/28f8ecba5a7732588b045f350b8cbee361028ef1 | ORPH
    arm      | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/0afc5b5ae32d7914e97c51a5ff9e275c2c238b61 | ORPH
  aarch64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/9c19e4028db69353a8fd96e2d93166a8a04659de | ORPH
    m68k     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/c775dabbeba114e8602482c13bdc8e42f1c58de2 | ORPH
    i686     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/0e9a1d879e4998ddace4130cc655b4d52c96a4f9 | ORPH
    sh4a     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/7eb9dc65082bc59abf10327461f729bd37e52a55 | ORPH
 powerpc64   | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/acf3f407901a3492fe1b03e897c25ef5ea867821 | ORPH
   armeb     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/c6edf2ee1c286fce18edf165b9ca95a686ae8d83 | ORPH
powerpc64le  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/18af1047a6bbcfbaa7ba653126e59125631afae8 | ORPH
   xtensa    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/dddef28a703b0ef0fb827f04a87047d11914da43 | ORPH
    i686     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/05c4aea2d184003598a97c798730e9f19813786e | ORPH
  aarch64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/d115effdd973b5ac64b72afe9f3181df8af9c536 | ORPH
   nios2     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/095ce383f55c5316c3d570c9001e5c770b126c64 | ORPH
    mips     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/599da1113c898f54b64187ebe54e04ffa5e433e6 | ORPH
  sparc64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/39048a8e8f56650f14724f8395aeeefe4fcb08de | ORPH
  sparc64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/19ec026ed41862041e08476f962c7ef3cf1aa36e | ORPH
   mips64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/f1ce3443a0a71152067c8e160c7cd503de471bf3 | ORPH
   s390x     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/69691955ef426daaa66b09d86dc44bed39cf7c1c | ORPH
microblazeel | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/9f12432a6443d118dc8ed39b2745b4b69fcb52c8 | ORPH
    or1k     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/8f6a7b7c3d29f6832da4c7d4b0cb2d0c42817b73 | ORPH
  mips64el   | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/6cc216d4b9c22dc83387dd115c1b97b588789f61 | ORPH
    or1k     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/8a4f77739de4155b79fd9ebe3b6ce29968550655 | ORPH
powerpc64le  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/440d3b8478d392afe188a96c67d58ebd960768c9 | ORPH
   s390x     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/b36c7e765a27f28fa8957949d66ac791ad8470f9 | ORPH
powerpc64le  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/312bc0a403aa9d4ddd00ad9970fd81c39539e1a2 | ORPH
    m68k     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/e8b90b3c6174828e46298eff96f3db89cb1aba99 | ORPH
  aarch64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/9742583d641c006a556d6c232cb9fb058f33f178 | ORPH
   nios2     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/e958dfc36b6cd7da4cf1c0b547a99349f8cd9395 | ORPH
   mipsel    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/087528bee319062f0b783c404beb4c3b573a4dd3 | ORPH
   sh4aeb    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/71c1ddc28abce2d3c52fd00aa1cb65a4a8370ed2 | ORPH
   s390x     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/baebd2f6aedb60984cdbe81bfec59cf12d0e4dfd | ORPH
 powerpc64   | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/5c7ee462b32be95598368c8a4a9df8d5c3b5201b | ORPH
powerpc64le  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/ea83ba2765879bfc51aca58c6f635dbe01b482dc | ORPH
  riscv64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/5e6f849a44d0eb8741e25b7248bb2fdf9f49688e | ORPH
  sparc64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/26ac2085dd69ec6d67fba41c32ed18646e51c325 | ORPH
    arm      | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/10cce3ca3f19358761b80ca3a1cd607181a3d256 | ORPH
   nios2     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/03c99708dc67001645f75d3da0c02f4fdba925ab | ORPH
microblazeel | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/7dea5fc4002715bacb56a796f3026283ec8159d1 | ORPH
    i586     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/4709fade67958fec9a240cf9932afabfb159bca3 | ORPH
   mipsel    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/2d33f58d21c3ef259114c6a1f653cbd1a9416861 | ORPH
  aarch64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/385351143d9b5b2208783f901c6eb66be291cb18 | ORPH
powerpc64le  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/a6cc02a2a803aae45112f41a495d94c35f22aaf1 | ORPH
   sh4aeb    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/cadd1bc7551cd98a76f93e94d5845086ab87c96c | ORPH
   nios2     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/d8ccbc7b676ff16406911535aaf95d4ae9694d13 | ORPH
   x86_64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/e46c3ce3008f36d19e546cacdbf6e91ecd778fe3 | ORPH
    arm      | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/36c7c5a123562bfdaff520c433e962e129070ab0 | ORPH
 aarch64_be  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/add1cbf5b85b710749960a942d56b9d2b1823c67 | ORPH
   sparc     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/b78ae4aa0baa6f1c1d8ac2a0a0f112779b62fb5d | ORPH
   s390x     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/25328bebb503a584a20fc83584c17262c771d894 | ORPH
powerpc64le  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/112d1fe9a82d124f4dce2510496eacaf0c5eda30 | ORPH
   nios2     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/ece1d02f8f3f007b3955b0e0ecf74f3dd9663bc8 | ORPH
powerpc64le  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/cf17e6b6dd4e381da082dee32950a6d03cd34463 | ORPH
  sparc64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/1c4d4340698af4afd0532d772db401ea63ba1fe3 | ORPH
    m68k     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/26713b7ddae27d519515ec4026405b26e775f2ab | ORPH
   nios2     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/0eca72ff44b8ce75f954ef0a104c29ec92204734 | ORPH
   sh4eb     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/62588a5f573ecd1517f2bbd90629a71113471812 | ORPH
    m68k     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/dcb1485eaec641f8806b93645408a61926259a56 | ORPH
   x86_64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/f56064b4066c666c02e12b8a79a689336948474d | ORPH
   x86_64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/f3d7a46a424f46165d4027e3244e9a1eb889e131 | ORPH
   nios2     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/dd60c4f08700d36444c93b6c1d77b867543ae4ed | ORPH
    or1k     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/4cd2519e85916ad3e634092e52cb9784cc742aef | ORPH
  powerpc    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/79815021ad4c992f6c747aac3d7a2820040d24c7 | ORPH
 microblaze  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/0812f517cbd6ee0eee46be80615999aeb4f1f178 | ORPH
    or1k     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/9aec08daea1d72e704f6ca2b450afa8899d4341f | ORPH
   s390x     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/a8434243ff1cc1d069556d783211d07fa9a21b2d | ORPH
   mipsel    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/806374a4819670ceb38a23e0cb4eefbd0bab5f39 | ORPH
  powerpc    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/57b2503b7247bbb13270932f2b66c2e8cf1bf022 | ORPH
   nios2     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/29a470fad6e51733a0df94ed9707db893b471786 | ORPH
  riscv64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/8f660ab1b1ee4690d5877b2a50936e47e4fe0243 | ORPH
   x86_64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/52f0438c50c46c81bc7f4f66406dbbd23a647323 | ORPH
    arm      | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/48146eaa5d25d9aa0e9b5e5aeda3b5aca49425f7 | ORPH
  sparc64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/53fe6ac006e9f1ac9ad90389afa6bad28b81c67c | ORPH
  aarch64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/1ff9d89a91507f6f8e450353f432d1fbae8e3223 | ORPH
    or1k     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/f4b46e9b8762e602a6e109813b9400f87e0ff4a8 | ORPH
  aarch64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/9fee05ea04914b25248baa961f67645af96b5a4b | ORPH
 microblaze  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/92fb945ea9481cfa60992ec523f1e2c215b12917 | ORPH
    or1k     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/fbb117c14b8423f923ad5bc49007a948abf12eb2 | ORPH
microblazeel | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/cd382458ee7454acf08db815122578a4f758636e | ORPH
  sparc64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/01ad5bb6066e5fb9551a369d28be74951bcc9367 | ORPH
   nios2     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/e92f1f99d78a1f6fa77d21564fbba13a07abd98d | ORPH
   mips64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/33a29cbdecdbbb5086819ae335a8754b7d8b7013 | ORPH
   sparc     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/4ec30850a67575455a18e3741c749704f5e22fa6 | ORPH
   s390x     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/e56a8970e92bf6ba6266b6d880391129d60cb948 | ORPH
  sparc64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/70894bf13f4b69afb982b08ab8190b1db923621e | ORPH
    mips     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/95ea2bbe4b7743f512e81f4d7556cbd29292b32e | ORPH
    m68k     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/f9a166744bd94f59c5fd439864e50f8583aeff51 | ORPH
   mipsel    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/46161a68459c58cf4e82993642fab906c6d0df29 | ORPH
   x86_64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/98e5f7e7c1e5ae784e42f6015c346902503c2945 | ORPH
  riscv32    |     host-python-lxml-5.1.0     | NOK | http://autobuild.buildroot.net/results/f8ecd7a5ad90a53f582da789e84f9afbde9ce9f9 |     
   arceb     |     host-python-lxml-5.1.0     | NOK | http://autobuild.buildroot.net/results/d406ee1bc1fb1e67222a267bd15361ec6924131d |     
 aarch64_be  |     host-python-lxml-5.1.0     | NOK | http://autobuild.buildroot.net/results/0ee63dab25b4ceadffc15085b9fbe8dd66d2a457 |     
  powerpc    |     host-python-lxml-5.1.0     | NOK | http://autobuild.buildroot.net/results/93ef694b243fc9ac6c04631c74c6cf7c16b46532 |     
 powerpc64   |     host-python-lxml-5.1.0     | NOK | http://autobuild.buildroot.net/results/c507354aec7b49e0a7fb6e73e0988537efa43cd5 |     
   nios2     |     host-python-lxml-5.1.0     | NOK | http://autobuild.buildroot.net/results/603593a12af95e035c19b4e73a12c90b0f5262e6 |     
  sparc64    |     host-python-lxml-5.1.0     | NOK | http://autobuild.buildroot.net/results/9bb2f15621c8a3658eedb5947ccf76db5e67f18c |     
powerpc64le  |     host-python-lxml-5.1.0     | NOK | http://autobuild.buildroot.net/results/3d1d7ea1d58229910e6bce4e8ab621b2a85cbf0f |     
  aarch64    |     host-python-lxml-5.1.0     | NOK | http://autobuild.buildroot.net/results/14aa9118c3063b80e318cae5009b014beec6aa51 |     
 aarch64_be  |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/7fc7b2f19ba19feae37d909a67ecfd9200dab5f8 |     
   mips64    |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/f520ab1adab56e3071542149d824ec379361cb0d |     
  mips64el   |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/98a0ff1f8c7d7a7c7ee0c12e5d3b27d2e404c75f |     
 microblaze  |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/6e475a2006a7c8a1f258b252c90eb8c3d82affb4 |     
   sh4eb     |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/c58c23f58617627b8fe3aa58c84fd06e2c6cc550 |     
   armeb     |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/fece17f1f71f093acbb0eb75e91d6342e91b67e1 |     
   x86_64    |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/e523adc98e31b4478c3e56fb8c9e0d7cbfda2151 |     
  aarch64    |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/15b60e823d4be06358d18e6530832d425b0563b7 |     
 aarch64_be  |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/62e4f0587c49ec7896f684158c793be62e83a86e |     
   s390x     |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/c16766646c5f2ff240a0a06ae8cef3fbc8760cda |     
   sparc     |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/12e5401cd539514aa376602c79ad31934fb45790 |     
 powerpc64   |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/b971ffc11fa95a2315d418882262eeffafce73c3 |     
   x86_64    |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/e184efec749bfed00790515c1956d901c182ae33 |     
    arm      |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/2f8fdabbf16faf08b26d16429c5862537104c892 |     
 powerpc64   |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/18715acb5c1a3d8bba08107460e16a4271892116 |     
   sh4eb     |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/aa84044a7f9dc01c656740d774f28f5942d3b5dd |     
  aarch64    |        host-rust-1.74.1        | NOK | http://autobuild.buildroot.net/results/6b1975fa1d7676a91980a9c62e1f1441f070e693 |     
   armeb     |        host-rust-1.74.1        | NOK | http://autobuild.buildroot.net/results/9de6b5c68eca984fdd99383477b22eb7d5bc5abf |     
   x86_64    |        host-rust-1.74.1        | NOK | http://autobuild.buildroot.net/results/f740025742bebc4302da017855d3b310e96509e2 |     
   armeb     |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/2b5201e45fe4ada4d5b71ae9eba8eca753c7cb81 |     
   sh4aeb    |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/ee020c56abd8117fb5fcc5782f149f7fb40db841 |     
microblazeel | host-softether-4.30-9700-beta  | NOK | http://autobuild.buildroot.net/results/94c1b492466b01d12aa6400f0fbee2521436afca | ORPH
    arm      | host-softether-4.30-9700-beta  | NOK | http://autobuild.buildroot.net/results/59ff10827786ef003e3361a5f28a018092087842 | ORPH
    arc      | host-softether-4.30-9700-beta  | NOK | http://autobuild.buildroot.net/results/cbb087628e62c12ceae7506bd2a06e940095968a | ORPH
 aarch64_be  | host-softether-4.30-9700-beta  | NOK | http://autobuild.buildroot.net/results/95f8723d77ee98d563aa5ab6d75f1ff9f8ddca1e | ORPH
   sh4aeb    |       host-vala-0.56.14        | NOK | http://autobuild.buildroot.net/results/c93de1c8ea45e815fd46c181e54804f67b61f5bc | ORPH
powerpc64le  |       host-vala-0.56.14        | NOK | http://autobuild.buildroot.net/results/041f255e57aa56c8a7b33671a81c0d5e3769152a | ORPH
microblazeel |       host-vala-0.56.14        | NOK | http://autobuild.buildroot.net/results/a36c0f9e715889c8f2b7223c50ac00837345de12 | ORPH
powerpc64le  |       host-vala-0.56.14        | NOK | http://autobuild.buildroot.net/results/b65a829ce0142dacab261eecea28698a96bd5ebd | ORPH
    i686     |       host-vala-0.56.14        | NOK | http://autobuild.buildroot.net/results/a5dfeb62319dcd741a513bedae0dc3852ff3c53d | ORPH
  sparc64    |       host-vala-0.56.14        | NOK | http://autobuild.buildroot.net/results/1942c2311a579c0b445b837a19744f7382ce5a6b | ORPH
    mips     |       host-vala-0.56.14        | NOK | http://autobuild.buildroot.net/results/daf5767021d39963109c6289ffe4bbb192546c9c | ORPH
  mips64el   |       host-vala-0.56.14        | NOK | http://autobuild.buildroot.net/results/1233d5a7690f84da24f33dfb0c823757c25126b0 | ORPH
    arm      |       host-vala-0.56.14        | NOK | http://autobuild.buildroot.net/results/2c562e2d0807c7ef8f86f7a14596ae78c69655a2 | ORPH
 powerpc64   |       host-vala-0.56.14        | NOK | http://autobuild.buildroot.net/results/ddbf03556de0dd937973a7b0360851f07fdec659 | ORPH
 aarch64_be  |       host-vala-0.56.14        | NOK | http://autobuild.buildroot.net/results/22928a9f91ae7f132c5a97f27a74a41fbbf91571 | ORPH
    arm      |       host-vala-0.56.14        | NOK | http://autobuild.buildroot.net/results/d03792a40a797ebc14d97339bfa3a518a6082399 | ORPH
 aarch64_be  |       host-vala-0.56.14        | NOK | http://autobuild.buildroot.net/results/903db376819664be6e0a926f6d5f95952c77557b | ORPH
 powerpc64   |       host-vala-0.56.14        | NOK | http://autobuild.buildroot.net/results/a9e071dc4c3407abfcc214c5d0fd108f697d5588 | ORPH
   sparc     |       host-vala-0.56.14        | NOK | http://autobuild.buildroot.net/results/4a600f039ad5729a3fb131698ccde5132b3139ae | ORPH
    or1k     |       host-vala-0.56.14        | NOK | http://autobuild.buildroot.net/results/d405069a2ffdaba792a9e81897027d0a7e8cbdd3 | ORPH
   x86_64    |       host-vala-0.56.14        | NOK | http://autobuild.buildroot.net/results/32ed3c92ceac521239e1706f4f287f6fbd75e18c | ORPH
    mips     | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/f2ae8e5a4ae4cb2310e21e7aac55d42ef29a152c |     
   mipsel    | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/a14b9ff284140b3dbdd759746766ef62f3cb2889 |     
   sh4eb     | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/8b6689e3e147727c2887308569cd1688d8028a1f |     
    arc      | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/6c616c9123b2afaf971e16de4d5960269bc7c6e2 |     
  powerpc    | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/af20f8c683d9fa3776d8373dd3cd8407627afc8b |     
    or1k     | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/750b79c70e55979e665e391b54ff8a83d7afc2c0 |     
   sh4aeb    | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/ef24b99efcd5b7f5887b17894c8eaf8f1b85152c |     
  aarch64    | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/64302e3bb08fd65a5eba2c8f22b8d11585497f52 |     
   nios2     | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/52c9074c8043d41f8cb303c06382a11c2db7ed22 |     
   armeb     | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/8a27999d2959c54925958f3918893e43fd94340c |     
 powerpc64   | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/fc9ed970d0c57ccae0083ed26450416fc08b77b4 |     
   armeb     | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/577d904d9ed0b52eb80f34bbc7dad23a4a868eee |     
    or1k     | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/27674cccc90808ea4adeb38c8b6750bc31dae326 |     
    i686     |           htop-3.3.0           | NOK | http://autobuild.buildroot.net/results/005b1a6b4fa609c3153ebb187bf4cfa19b0f4576 | ORPH
  aarch64    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/a550295610a0ea526f4b18a5a6b2e0cc27c45501 |     
    sh4a     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/a8dd5a048e7095c52d1642818871ed6513c72f3e |     
   x86_64    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/e00e14b473764e7e8875ff4f5b0e06e4c04be5c6 |     
   s390x     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/1749621834d6fbbab70e18e31aa0940ef4d26944 |     
   nios2     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/c36e85c0b3c61024de4215a4e44c1db2b281a061 |     
    arm      | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/4011aee1e05b55ec4d67b3c4d38a68755faa1295 |     
    or1k     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/2b14fb04c03e57892e781612beccdf1c2e441135 |     
   nios2     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/417f0b09a1d1e7d02c2e7c6894d4dbee8cd46bd1 |     
   armeb     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/92240439ec41318b0aef7b567e49823bd8870666 |     
  sparc64    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/e383d9f619f1896020f4cb138a4e6deb2333d65f |     
   xtensa    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/bd30cb1c3cb2c5c32741be06f8491c6511476c13 |     
microblazeel | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/6ad7903beef8eedc86706c3bfe261aed726ed4b8 |     
  powerpc    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/cdb4e2c52d7b2a4dcbb2d91cf3b2975deee11394 |     
   x86_64    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/e3da6d693e6a02b1684f61ca795b90c0562379c7 |     
   nios2     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/b53394e1478da156877a9fb1fcd6c147ab6e5640 |     
  mips64el   | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/f156b0bdca71c051a40094d34a71019f31ce8004 |     
    arc      | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/476d9c1e6b5a7e4434c3f24ecd734261c7b108ac |     
   sparc     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/74e766018ac0dd61ac3d7eb8a63119b9e438e67d |     
   arceb     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/8250a9953517286658dd80a526ff2243620b27e7 |     
    or1k     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/342d1660c884f13a8d9850ca939ef0b1136117c3 |     
    arc      | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/65537b53020651abef04edb3e08853dc5a663d21 |     
  sparc64    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/93ff32bd46bb5fde0c60b2d0969185cb0a6c9234 |     
    sh4      | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/f3d2f245eb5f2751deebcd73f59bc64c420d5379 |     
    m68k     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/94618425b4a1ae150acc229c8f256356cab593e6 |     
 microblaze  | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/9024cdcd3dfeddf605b6343859368fefc9437d7f |     
   s390x     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/9c46d3195efe38c5251d8e2bc2d26351cf37fa88 |     
  riscv64    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/3a3620ecd47f4ae6a776d41413670a579008c4d4 |     
    mips     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/0b22e1ff3783c5f4cd19539f6481abfd849f8d01 |     
 microblaze  | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/3f37e99df7cd235de438a98615fd67b0e6d0b8b9 |     
  mips64el   | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/e6d1f5ceb75444637bc25f9a5d0dc5472ebbacba |     
  aarch64    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/65466569d6a41e07f20adee20020199f6d6a66b8 |     
   xtensa    |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.net/results/d1b6d2b623cd597b73b41442841b0677b51a3b23 |     
   armeb     |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.net/results/856d5eaca4ada11c6caf501cb90aa0840a888d53 |     
    arc      |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.net/results/493c2dacff9498eab85265bac6ab2c3fcf576b11 |     
 powerpc64   |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.net/results/ee8d9a33942a2d8072726d2188a7d13ff661befb |     
    arc      |            jq-1.7.1            | NOK | http://autobuild.buildroot.net/results/8ebc5770058179e64b3de52d8a26aea26dc71158 |     
    arm      |          kexec-2.0.28          | NOK | http://autobuild.buildroot.net/results/1d2801561fc6b0e585b790a49740580ef6e2a7c4 |     
    arm      |            kmod-31             | NOK | http://autobuild.buildroot.net/results/aa04893f8c260dc2e9946d1910703f0360a0f75b |     
   mipsel    |            kmod-31             | NOK | http://autobuild.buildroot.net/results/d4846b9c13e25ba918b78fc64afb55f85eee2682 |     
microblazeel |          ledmon-1.0.0          | NOK | http://autobuild.buildroot.net/results/4e9bd86ebfad903c4e073218f3f779ec7a322513 |     
    i686     |        libarchive-3.7.4        | NOK | http://autobuild.buildroot.net/results/0f0dc9d01004bbc82e18d1613fa66a0a581b451d |     
   x86_64    |        libarchive-3.7.4        | NOK | http://autobuild.buildroot.net/results/c6ae89c33e616c81a8d270f15f887fb4efed4fad |     
    mips     |        libarchive-3.7.4        | NOK | http://autobuild.buildroot.net/results/020f68b70acfb64b90fc47c0ac8916f7ffd6db87 |     
    i686     |        libarchive-3.7.4        | NOK | http://autobuild.buildroot.net/results/47cf2bb09e6333e5268cc2aa4a870ee717dd86e5 |     
   s390x     |        libarchive-3.7.4        | NOK | http://autobuild.buildroot.net/results/dc3d445460d40bc252ee3be2a416769d9f79671b |     
  powerpc    |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/b2bc4f55a4f3b257178da1fecb91511426054fb5 |     
powerpc64le  |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/1d1313d52e332b2520817a7f47b29cc14d2a2b44 |     
    i686     |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/4810dcb9d3ea322375ea5391869062a42a176354 |     
 aarch64_be  |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/1bb00905a66988b1e1d92fbbde20448ceb582fb9 |     
  aarch64    |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/8c7a57998113daf1613f4670e2663c0b839d1019 |     
  aarch64    |        libdeflate-1.20         | NOK | http://autobuild.buildroot.net/results/b9780afc9e528c7fca85d397775a6bfd3b10d5bf |     
    arc      |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/ef35fe2019a46b7e378d5736b6d6b7c4f73b8912 |     
   arceb     |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/035cd02f9264df5e77cffa0f225d49b31ad92321 |     
   arceb     |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/13f09f82148cfae291389581742de986a47f844e |     
    or1k     |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/b9dca911bf7d65b575316910f42eae46baaf209d |     
   arceb     |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/12cf7b0e4a3d5bbb4b2c578f499b8260d7b7ee8d |     
    arc      |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/6cefbc29a10fcf2b8fd13fa7eb9a46495cd96430 |     
   arceb     |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/c895eaf3ec23bca7dd45600cbba362a00d0d9639 |     
   arceb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/3f1c3624ed8c9d3417fcd50a18fd651e50f65658 |     
   arceb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/e8bd3258c45c227c36e3b1438eb9d2a6463702a9 |     
   arceb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/8690e2501e4eb0e25d35c47e8376ac603ce86096 |     
    arc      |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/718e3239e980ba2bade475c5813479f5a2246729 |     
   mipsel    |         libglvnd-1.4.0         | NOK | http://autobuild.buildroot.net/results/7ba5d2e4434b2ad357fd507653056afa5b980d7f | ORPH
   mipsel    |         libglvnd-1.4.0         | NOK | http://autobuild.buildroot.net/results/67a89c3fad7a2ddb5a7db6d972a551135bdc7ee3 | ORPH
   nios2     |          libnfs-5.0.3          | NOK | http://autobuild.buildroot.net/results/588023c691292af9e489e2f99c1f905cf88017e0 | ORPH
  riscv32    |        libopenssl-3.3.0        | NOK | http://autobuild.buildroot.net/results/37d7a0cd30f55fcb29d7cc5be71cbd85b97f8640 | ORPH
   arceb     |        libopenssl-3.3.0        | NOK | http://autobuild.buildroot.net/results/76b9ec6b40c8ab819310b30cef9ea0547544cc06 | ORPH
microblazeel |        libopenssl-3.3.0        | NOK | http://autobuild.buildroot.net/results/827ed1ba197671251ba7af1b7b702b8366199235 | ORPH
  riscv32    |        libopenssl-3.3.0        | NOK | http://autobuild.buildroot.net/results/5c4909a81c0871dac7481079b405d9dfcf71a8b5 | ORPH
  riscv32    |        libopenssl-3.3.0        | NOK | http://autobuild.buildroot.net/results/aa4c87753830d780e8ff37a7c465c2ec40ee4b99 | ORPH
  riscv32    |        libopenssl-3.3.0        | NOK | http://autobuild.buildroot.net/results/8ec8996482e93eb37d0a76a5fe3bb523cc792480 | ORPH
 microblaze  |        libopenssl-3.3.0        | NOK | http://autobuild.buildroot.net/results/a7c80c8bb4088b2f657d8f400377866bd3a8a42b | ORPH
   s390x     |         libp11-0.4.12          | NOK | http://autobuild.buildroot.net/results/082a0177cec5ffffb10ddc67a725ac016cd65202 | ORPH
   x86_64    |         libp11-0.4.12          | NOK | http://autobuild.buildroot.net/results/031aa1b3c16a1d6d4f95f48b3d7aefed70b6f239 | ORPH
  aarch64    |        libpthsem-2.0.8         | NOK | http://autobuild.buildroot.net/results/c4365e32945d4b1b4a8c729922128f244359f796 |     
  mips64el   |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/bd2d02fc0a629d75aeaa133c39325ef5c5e28cbd | ORPH
   s390x     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/1771c39dec89d8576159145ae4089c4e23e261af | ORPH
   nios2     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/0e5cdd979aaa22007303c658a7241a4a32599c87 | ORPH
microblazeel |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/95b6d8d0c52e83cb524aac024d2c48610276a1fa | ORPH
  mips64el   |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/aa0f52d86db413ba20da7de965c7b7202065d65d | ORPH
  powerpc    |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/ff8a16be93da5f16d2ba2f9484ddb23e3a56ee12 | ORPH
   sparc     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/af0a9f3d06718cf93c516c4ad3e23edc87872d35 | ORPH
   arceb     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/c1a36a8059860157416ece616aab0696547c3fdd | ORPH
    sh4      |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/fa82c6ea83d8d3a0afc9fadfd935dee071071df9 | ORPH
    sh4a     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/ac77b3240597ad3c74cc32da39d6a661450014d1 | ORPH
    m68k     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/9a6af8f66c56bbdf3c8087f942ff0c03057fd283 | ORPH
   s390x     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/f459af4173bcbc231058a035f7e6966ac1aebd2c | ORPH
   s390x     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/4f6fd1492b96c2a12f87e8722773d486614f3254 | ORPH
    arc      |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/5656dbb2f57faca6bef889ddd313934ad34e65c0 | ORPH
powerpc64le  |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/ca17ed559a9eb6b0d55ef679a85044d639f2a970 | ORPH
   arceb     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/4df9a9ce45fb3a4b23ec2cef30b9bfc5a61170ce | ORPH
   mips64    |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/d060a54a4bf20a08f54a65bee6df249732e54f0e | ORPH
microblazeel |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/5eeeab7eda3ad5cd0bacef2daab6f1c7035ec8e9 | ORPH
  mips64el   |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/b85ac0dd0c5206a2e4f6974509b0061658f444b7 | ORPH
    or1k     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/761d37826f569555d5610100c214d055751ef8bb | ORPH
  mips64el   |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/5c16400899049b99b83100358765638c2912745f | ORPH
  mips64el   |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/1cd6b436544ad92feca73b317f33009114a5a56c | ORPH
    arc      |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/81fb5b6bb66d3900548d4229822d6d68cd6326ca | ORPH
   arceb     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/27161071c5d6aceed6fe6d30a2e0670390ed52ae | ORPH
   sparc     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/35058f0e2fbe278cd596c009d863dfdbf745723b | ORPH
   nios2     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/50e4f92a2c51cc067036697110511d58662a7d07 | ORPH
  mips64el   |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/018cce937294b15e629dc972f999797c9fb46e89 | ORPH
    or1k     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/6c250c50032fe828a0c08d2aa9b3fa64880c7cdd | ORPH
   x86_64    |         librsvg-2.50.9         | NOK | http://autobuild.buildroot.net/results/b80bfe83c252c903180e9d81af41d0443f4cc1b8 |     
  mips64el   |         libvpl-2.11.0          | NOK | http://autobuild.buildroot.net/results/02293166c41ec983cf196d0714892a6b6090e03d |     
  sparc64    |      libzenoh-c-0.11.0.2       | NOK | http://autobuild.buildroot.net/results/fdc74b8a42388b51cc4197c38b552559b97cbb8c |     
  sparc64    |      libzenoh-c-0.11.0.2       | NOK | http://autobuild.buildroot.net/results/5eb141a75b50cd92392b33abe0d75c307ac7e50c |     
  mips64el   |        lightning-2.2.3         | NOK | http://autobuild.buildroot.net/results/27123bf0ddc84599bceb02ac987327817d498659 |     
  sparc64    |        lighttpd-1.4.76         | NOK | http://autobuild.buildroot.net/results/dfa22b63a5de9dda9e4f6e216de7fc9184006359 | ORPH
   sparc     |        lighttpd-1.4.76         | NOK | http://autobuild.buildroot.net/results/4b79cd5c84c6e594af9b1340fa17548972cffe2a | ORPH
  powerpc    |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/84a01d39034daed28a7100c5c596fceefaef3ed0 | ORPH
   mips64    |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/1662a2b8c39c97f1af4eb2e2445cef62fd9f4679 | ORPH
   mips64    |          linux-6.8.12          | NOK | http://autobuild.buildroot.net/results/7a136bef861d7a36461a4b3ec8c693bdcc748d48 | ORPH
   nios2     |          linux-6.8.12          | NOK | http://autobuild.buildroot.net/results/9ec3f2cd07b78d8683e91fdcd22d19179f8047c4 | ORPH
  mips64el   |          linux-6.8.9           | NOK | http://autobuild.buildroot.net/results/ee755f23a0d14b0c5c6f3ee739e4ca540a929b5b | ORPH
   nios2     |          linux-6.8.9           | NOK | http://autobuild.buildroot.net/results/62045202c65cba561505d652708f69e02df0de4b | ORPH
 powerpc64   |          linux-6.8.9           | NOK | http://autobuild.buildroot.net/results/03bd3d8b6c3a2bd8ea599cb3c87a4f2fc21e1849 | ORPH
  mips64el   |          linux-6.8.9           | NOK | http://autobuild.buildroot.net/results/4a3235b42215ee9ec1e95b504890adf5fc223e3a | ORPH
 powerpc64   |          linux-6.8.9           | NOK | http://autobuild.buildroot.net/results/c64ccd64b07b106df0f44e81a246d8317cad7f37 | ORPH
    sh4a     |          linux-6.8.9           | NOK | http://autobuild.buildroot.net/results/0fff7dca20f00da8c5747ecded36550e474f3e91 | ORPH
   xtensa    |          linux-6.8.9           | NOK | http://autobuild.buildroot.net/results/4b9be21d87f9b84e4513b169f319e060626c2720 | ORPH
    mips     |          linux-6.8.9           | NOK | http://autobuild.buildroot.net/results/597e4cf21c70348416ecafb2810ac6b64c2a891e | ORPH
  mips64el   |          linux-6.8.9           | NOK | http://autobuild.buildroot.net/results/797ad0dfd62aaaf7fb3f3ae836d04137c24ffebc | ORPH
   mips64    |     linux-headers-5.4.277      | NOK | http://autobuild.buildroot.net/results/83e83a4bce8ceb953b4f3fe916a4a158f3723ab0 | ORPH
   arceb     |          linux-tools           | NOK | http://autobuild.buildroot.net/results/7ced767de5dd39e4dc9484a6a911997aa74193bf | ORPH
   x86_64    |         memtest86-6.20         | NOK | http://autobuild.buildroot.net/results/06ef606aa9f7e5d47570be1464534e8db75e40dd |     
  aarch64    |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/d2214ed8fe0fb9e06ac54826c063f8dc844f5d61 |     
  riscv64    |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/ad42253dcf7564a39ec67a58f0649114b463e0ac |     
  mips64el   |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/659866346d5c191cf17cd025c237ab85bd46249b |     
   mips64    |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/77a0b64370aba32c785b2064d64f6cf1e1b1ed69 |     
   mips64    |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/671997d4ef822f5b97de27b02c159d9214ee0259 |     
 aarch64_be  |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/2cf86d879501ac7c06338e554a0a030eaa562717 |     
   x86_64    |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/7a1cdb51abdce7e8993ac9c98b81b09a6e8c01f5 |     
    m68k     |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/3529b09eafaf2e46c0f1655ed8d9c1fcef19f5ff |     
 aarch64_be  |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/2a1ff71d5e29a1032168fc1b29d6cfe9f95e15ef |     
   x86_64    |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/c48c50591cca20b5c90af7496accb85e87581353 |     
   nios2     |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/97f7ede25c7691d35e0a03719f32d5b140258587 |     
 aarch64_be  |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/65a3facbeef2886ec91977d703b1dddd0fd3fb4f |     
   s390x     |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/eb72a2bec2f4e6adc632f05d70f5fb1f86739c03 |     
  aarch64    |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/2d183e819308af13c942fffd52a0babad11a747f |     
   sh4eb     |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/1d66e18bf2ffda9fc4e22184c0cefaa4d7d3b174 |     
  riscv64    |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/03966bb580638b50958d420c144381f88bf2a9df |     
   x86_64    |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/18b488501bf9ed83935c3f65cede027205564342 |     
   armeb     |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/3df547a53076d50f1031d6b918cc3385ce9bc405 |     
  sparc64    |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/696ad4d41109af5fc2f4bab663d2c5e1d0c488b4 |     
   mips64    |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/5eefaa5c7112738e4fbb65f0defbbe893c3465b6 |     
    or1k     |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/3e62da863a1ae3a2b8f37452c5a8e3aaae80d6f3 |     
 powerpc64   |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/5678a5fb651adc4caf67ceb4b5bb4fe64453d5b4 |     
   mipsel    |           ncmpc-0.49           | NOK | http://autobuild.buildroot.net/results/e88b9d6eea2af82983954c4b9bb803c9f7ca162c |     
    i686     |           ncmpc-0.49           | NOK | http://autobuild.buildroot.net/results/20e37b43f688e95a9be0b550ba61b5efe9789d17 |     
    i686     |           ncmpc-0.49           | NOK | http://autobuild.buildroot.net/results/08a16d8cf3bb5c24fac6e2147e4bb9f51ff8f6eb |     
    i686     |      ncurses-6.4-20230603      | NOK | http://autobuild.buildroot.net/results/8347d2bd8fbe80a98a5f947585d39532a8d42d97 | ORPH
   sh4aeb    |          ntp-4.2.8p17          | NOK | http://autobuild.buildroot.net/results/886921f7fdef5fec4f729b9f9445fc7b7625dd97 |     
   xtensa    |           nut-2.8.2            | NOK | http://autobuild.buildroot.net/results/86d94fe0d2bc8420c3f32dd6df366b1f93b023c7 |     
  mips64el   |        openblas-0.3.27         | NOK | http://autobuild.buildroot.net/results/ae6e0aebf2188af1c37971a30fa1380bd2525477 |     
 powerpc64   |         openssh-9.7p1          | NOK | http://autobuild.buildroot.net/results/f8697f6121003e64a6e764594b300724e7b35780 | ORPH
   mips64    |         openssh-9.7p1          | NOK | http://autobuild.buildroot.net/results/c0cfcac41d9577ab80b89daa0d7c350965d8e87b | ORPH
    mips     |         openssh-9.7p1          | NOK | http://autobuild.buildroot.net/results/5ea90a276a3b04ae0e0a2a7a2f098f1929b19806 | ORPH
   mips64    |         openssh-9.7p1          | NOK | http://autobuild.buildroot.net/results/39ba2ae2faa2325aca27fc5939544f1494db5074 | ORPH
    arm      |        pciutils-3.10.0         | NOK | http://autobuild.buildroot.net/results/18081d5ddc9c749976f38d5f5f9c06bc8b29996d |     
  sparc64    | pppd-e1266c76d1ad39f98f1167... | NOK | http://autobuild.buildroot.net/results/0b73ab01e7bb093bc4e66dede9e81cb627a4669b |     
   sparc     | pppd-e1266c76d1ad39f98f1167... | NOK | http://autobuild.buildroot.net/results/f8e09d0f7b20499d3f4a3c413b7b892097d8cf17 |     
   sparc     | pppd-e1266c76d1ad39f98f1167... | NOK | http://autobuild.buildroot.net/results/73a7c45eff4e9971eea6efa1260c7cda5e6d7703 |     
   x86_64    |      python-grpcio-1.60.0      | NOK | http://autobuild.buildroot.net/results/db98f9384fee7373098c9f1f44fd7a0fe3ffcd47 |     
  aarch64    |      python-numpy-1.25.0       | NOK | http://autobuild.buildroot.net/results/d7039dbb36761a4af99ba63f2d8b5f852b340c47 |     
 microblaze  |     python-remi-2022.7.27      | NOK | http://autobuild.buildroot.net/results/491a061baf5d338c26b7afc228c31094e7746e68 |     
microblazeel |     python-remi-2022.7.27      | NOK | http://autobuild.buildroot.net/results/8f2970f927c85d449532f7a8d0563b93b4e36207 |     
  riscv64    |     python-remi-2022.7.27      | NOK | http://autobuild.buildroot.net/results/c0682a7fd9be22b50670defd515b9e7f03beed68 |     
   mipsel    |      python-zlmdb-22.6.1       | NOK | http://autobuild.buildroot.net/results/fbcabf75525516c2b6b6e4fdf9e27dc8a6a8cda3 |     
  powerpc    |         python3-3.11.8         | NOK | http://autobuild.buildroot.net/results/17fec4fea6780a7277d06b2275c806aeb3f4d3f0 |     
  riscv64    |       qbee-agent-2024.09       | NOK | http://autobuild.buildroot.net/results/dde0b0de6b3184055b4b4fae9003eef44179610d |     
    mips     |           qemu-9.0.0           | NOK | http://autobuild.buildroot.net/results/da083c8ae664ecb71946ee9d68f736bdd601fb08 |     
   xtensa    |          qpdf-10.5.0           | NOK | http://autobuild.buildroot.net/results/d78a6b208abc413f016d446a9a27126bd8b18d9e |     
   mipsel    |           rtty-8.1.0           | NOK | http://autobuild.buildroot.net/results/f93b021a0609613efeeabdd9474f9955284b7375 |     
powerpc64le  | sconeserver-8d1935919a20133... | NOK | http://autobuild.buildroot.net/results/de4223ca9760a21b4834164ece4700abfed97af5 |     
    arm      |           shim-15.8            | NOK | http://autobuild.buildroot.net/results/9e6eeb77bcc114bba3d3ba728d88f1ef812e61b7 |     
   sh4aeb    |        skalibs-2.12.0.1        | NOK | http://autobuild.buildroot.net/results/be3fdb5dcdadc46f7008824327eb9a360e173e67 |     
   mips64    |        skalibs-2.12.0.1        | NOK | http://autobuild.buildroot.net/results/386e834757b1f795658561269b79a39b72e7a069 |     
   sparc     |       sofia-sip-1.13.17        | NOK | http://autobuild.buildroot.net/results/36be83ebf87be9d2c81c8c6e13a9b5c7350bf71d |     
    arc      |       sofia-sip-1.13.17        | NOK | http://autobuild.buildroot.net/results/b52c5fe0ee65ad0585790cb0a7aef4c47ed9e94c |     
  sparc64    |       strongswan-5.9.13        | NOK | http://autobuild.buildroot.net/results/80e92a82daaf02de3a02ea1fcadf53e3654c8e11 |     
 microblaze  |            tar-1.35            | NOK | http://autobuild.buildroot.net/results/b9a1bd70468e12eebf07ecc884e0aeb308badc24 | ORPH
microblazeel |            tar-1.35            | NOK | http://autobuild.buildroot.net/results/f2ea169b5164e0375da8942079811bf47536640e | ORPH
   arceb     |         uclibc-1.0.48          | NOK | http://autobuild.buildroot.net/results/3a96bbd610bd3c539eb10f4e9e95b3da117c55aa |     
  riscv64    |         uclibc-1.0.48          | NOK | http://autobuild.buildroot.net/results/f27b4888536b7b1098627d10bac4176f04df5d8e |     
    or1k     |         uclibc-1.0.48          | NOK | http://autobuild.buildroot.net/results/961d3042e09ac3183d027d4bb16b2d77ea789245 |     
   arceb     |         uclibc-1.0.48          | NOK | http://autobuild.buildroot.net/results/b6aea93edca32d21933db1c21509c23021b39630 |     
    or1k     |         uclibc-1.0.48          | NOK | http://autobuild.buildroot.net/results/c7b63548e2fc240c6bbc36e17001e56618d0b93e |     
    or1k     |         uclibc-1.0.48          | NOK | http://autobuild.buildroot.net/results/43841a1e362134fd41c37c93cc7fa91e6de9d2f9 |     
    arc      |         uclibc-1.0.48          | NOK | http://autobuild.buildroot.net/results/db5e1899ef0de0d80a3ce00321584a95d4c32fc3 |     
    mips     | uclibc-ng-test-0f303c63fab7... | NOK | http://autobuild.buildroot.net/results/20a27742c8b49cce0cd0dbf40c88a3cc0366271a |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/7db6ea40717c14c00ba0ea029a13bebd33091510 |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/4cd5f81029e19eb3c85ffe085500b92d8ff38149 |     
   sparc     |            unknown             | NOK | http://autobuild.buildroot.net/results/34263acbac84bd8ef358cf2605aeeb5586aaf783 |     
   arceb     |            unknown             | NOK | http://autobuild.buildroot.net/results/48a60c90af6ca97f4eb719f47433da2507e25616 |     
 aarch64_be  |            unknown             | NOK | http://autobuild.buildroot.net/results/7c4e5e4adeecbf2d8353838d73baa5c110b686d2 |     
   mips64    |            unknown             | NOK | http://autobuild.buildroot.net/results/bc75119d35deb8d180fda4d4a203429f98030355 |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/5a8908772c7762e172ab8e7425c620225ff64155 |     
    arc      |       util-linux-2.39.3        | NOK | http://autobuild.buildroot.net/results/f0534b94a29a15790675cf7846ae71dd5d6d3f18 | ORPH
   arceb     |       util-linux-2.39.3        | NOK | http://autobuild.buildroot.net/results/e99b1ce7d6d0dd3bc8fa06c0a795ec74a43b257a | ORPH
   x86_64    |           vlc-3.0.20           | NOK | http://autobuild.buildroot.net/results/b70c2a4b2bfbe58073f4229a804449025e803f9c |     
   sh4aeb    |           vlc-3.0.20           | NOK | http://autobuild.buildroot.net/results/ba519fdcdf392a2437e83b58aefe0c6cc53cf2af |     
   sparc     |         x11vnc-0.9.16          | NOK | http://autobuild.buildroot.net/results/e8dec90d9ec14c4a5a1cd461b96e68a88257e1b4 |     
   x86_64    |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/7147b77cc1ef754eb1e54c29e88672828b00d095 |     
   s390x     |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/acfa61bf4d13cf11b07353738f6eb58f9e28b939 |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

                  bitcoin-26.0 | 1 
           dmraid-1.0.0.rc16-3 | 1 
                    dust-0.9.0 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |          bitcoin-26.0          | NOK | http://autobuild.buildroot.net/results/e6e86a45c8bc191f3c1ea0071e5bbd7905911b75 |     
   x86_64    |      dmraid-1.0.0.rc16-3       | NOK | http://autobuild.buildroot.net/results/2f74fbeddb36aa263b8b1ea49c87c1f588a4884d | ORPH
  powerpc    |           dust-0.9.0           | NOK | http://autobuild.buildroot.net/results/8a44ac26098ddf04f15c6fbc2f00ac1255d030d1 | ORPH



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
