Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D896C30653
	for <buildroot@archiver.kernel.org>; Sun,  7 Jul 2024 04:47:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 89E1A608CB;
	Sun,  7 Jul 2024 04:47:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n7xK46W02ckg; Sun,  7 Jul 2024 04:47:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 54177608BF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 54177608BF;
	Sun,  7 Jul 2024 04:47:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E023F1BF40A
 for <buildroot@lists.busybox.net>; Sun,  7 Jul 2024 04:47:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C3A21608BF
 for <buildroot@lists.busybox.net>; Sun,  7 Jul 2024 04:47:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x00Jvm6OmQ1b for <buildroot@lists.busybox.net>;
 Sun,  7 Jul 2024 04:47:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C30A36083D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C30A36083D
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C30A36083D
 for <buildroot@buildroot.org>; Sun,  7 Jul 2024 04:47:14 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 70475FF80A
 for <buildroot@buildroot.org>; Sun,  7 Jul 2024 04:47:11 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sun, 07 Jul 2024 04:47:11 -0000
X-GND-Sasl: bot@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1720327631; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=0viJYcuWlsD6xY34khPdQLgEGOTW18X749V3S4iojnI=;
 b=ZlaUgUhkoo0PTLkZy1DqdlOenX1GimQO9Sv8THvw/oF+G9t3uz7yqTzDJr+OXdn4YybGF+
 dw+MrlHLsLRD6I/p6sQhhbNAjXNXqkAQ5PY7Uq385NqXl2G6FZQD8KvHedoJdZgwXu0pMr
 s1VUchgkAHCBxipMVb+bL1LtqnJdAmdkcNb4RoDlX2RERBh0nu16NnVGnl401XW/NHIJTo
 euac6Uv6ILtQb/RXL+Dl3pupcBZ0B30Dc8C+ALDkbwpfS4wm7FMawRQuyQXJcIj8vSD8Q8
 MxqPj0yLA2p1d3sZRUnhswCRq14Z7GEXOo77IBwhRLC4VGCfOlrneand+eIapQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ZlaUgUhk
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2024-07-06
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
Message-ID: <20240707044711.J3FIlOY5rQKy9ZT8nqQa6dUbwkwo6-RzdO08EthWwog@z>

Hello,

Autobuild statistics for 2024-07-06
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  5  |  5  |  0  | 10  |
  2024.05.x  |  5  |  6  |  0  | 11  |
    master   | 103 | 652 |  0  | 755 |

Classification of failures by reason for master
-----------------------------------------------

                    zstd-1.5.6 | 78
host-prelink-cross-a853a5d7... | 64
            host-cdrkit-1.1.11 | 61
                    yajl-2.1.0 | 34
              fluent-bit-3.0.4 | 23
               cracklib-2.9.11 | 16
                 haserl-0.9.36 | 16
                dovecot-2.3.21 | 14
                elfutils-0.189 | 13
host-android-tools-4.2.2+gi... | 13
                libressl-3.8.4 | 13
                 libcurl-8.8.0 | 10
                   linux-6.9.4 | 10
glibc-2.39-74-g198632a05f6c... | 9 
ibm-sw-tpm2-5452af422edeff7... | 9 
                 libssh-0.10.6 | 9 
                    mpir-3.0.0 | 9 
                  bcusdk-0.0.5 | 8 
       freeradius-server-3.2.3 | 8 
                gnu-efi-3.0.18 | 8 
                  libffi-3.4.6 | 8 
libsvgtiny-ea9d99fc8b231c22... | 8 
                apr-util-1.6.3 | 7 
                   host-go-src | 6 
                host-odb-2.4.0 | 6 
           sane-backends-1.1.1 | 6 
                fail2ban-1.0.2 | 5 
                  ffmpeg-6.1.1 | 5 
                   httping-2.5 | 5 
                  jack2-1.9.22 | 5 
aer-inject-9bd5e2c7886fca72... | 4 
                     apr-1.7.2 | 4 
check-11970a7e112dfe243a2e6... | 4 
                   foot-1.16.2 | 4 
                 libp11-0.4.12 | 4 
                  ntp-4.2.8p18 | 4 
             rabbitmq-c-0.13.0 | 4 
                       unknown | 4 
                    vtun-3.0.4 | 4 
                     avahi-0.8 | 3 
                beecrypt-4.2.1 | 3 
                   evemu-2.7.0 | 3 
host-vboot-utils-bbdd62f9b0... | 3 
     linux-5.10.162-cip24-rt10 | 3 
                  mender-3.4.0 | 3 
                  monit-5.33.0 | 3 
              udpcast-20230924 | 3 
                    ympd-1.3.0 | 3 
android-tools-4.2.2+git2013... | 2 
brcm-patchram-plus-95b7b691... | 2 
                 coreutils-9.3 | 2 
                 dc3dd-7.2.641 | 2 
                     file-5.45 | 2 
                 gnuplot-6.0.0 | 2 
  gobject-introspection-1.76.1 | 2 
         host-gcc-final-14.1.0 | 2 
         host-libxcrypt-4.4.36 | 2 
           janus-gateway-1.1.2 | 2 
              libarchive-3.7.4 | 2 
               libglib2-2.76.1 | 2 
                  libsepol-3.6 | 2 
          linux-5.10.162-cip24 | 2 
           mediastreamer-4.4.8 | 2 
                     mtd-2.2.0 | 2 
                 openssh-9.8p1 | 2 
             stress-ng-0.17.07 | 2 
                unbound-1.19.1 | 2 
                      xz-5.6.2 | 2 
aubio-152d6819b360c2e7b379e... | 1 
                 augeas-1.12.0 | 1 
                  autofs-5.1.9 | 1 
                  axel-2.17.14 | 1 
     bandwidthd-2.0.1-auto-r11 | 1 
                  boost-1.83.0 | 1 
                   botan-3.3.0 | 1 
                 cdrkit-1.1.11 | 1 
             containerd-1.7.18 | 1 
                   cpuload-0.3 | 1 
           crucible-2023.11.02 | 1 
cwiid-fadf11e89b579bcc0336a... | 1 
             dahdi-tools-3.3.0 | 1 
                  dump1090-9.0 | 1 
dvb-apps-3d43b280298c39a67d... | 1 
                     faifa-0.1 | 1 
                  fbdump-0.4.2 | 1 
                   flann-1.9.2 | 1 
                flannel-0.25.2 | 1 
              fmlib-LSDK-21.08 | 1 
                     frr-8.5.4 | 1 
            gdk-pixbuf-2.42.10 | 1 
          gitlab-runner-15.5.0 | 1 
         host-gcc-final-13.3.0 | 1 
                 host-gdb-12.1 | 1 
           host-gengetopt-2.23 | 1 
host-heimdal-f4faaeaba371ff... | 1 
     host-moby-buildkit-0.11.6 | 1 
            host-qt6base-6.4.3 | 1 
 host-softether-4.30-9700-beta | 1 
               ipmitool-1_8_19 | 1 
                iproute2-6.9.0 | 1 
jailhouse-e57d1eff6d55aeed5... | 1 
             libargtable2-2.13 | 1 
                libcuefile-475 | 1 
             libfreefare-0.4.0 | 1 
              libopenssl-3.3.1 | 1 
     libphidget-2.1.9.20190409 | 1 
   libtorrent-rasterbar-1.2.19 | 1 
                libxml2-2.12.6 | 1 
               lighttpd-1.4.76 | 1 
                   lsuio-0.2.0 | 1 
        ltp-testsuite-20240524 | 1 
           lttng-libust-2.13.1 | 1 
               mongrel2-1.13.0 | 1 
          ncurses-6.4-20230603 | 1 
            netstat-nat-1.4.10 | 1 
                  nginx-1.24.0 | 1 
                    norm-1.5.8 | 1 
                paxtest-0.9.15 | 1 
                     php-8.3.8 | 1 
pppd-e1266c76d1ad39f98f1167... | 1 
         python-remi-2022.7.27 | 1 
python-unittest-xml-reporti... | 1 
                   rauc-1.11.3 | 1 
                   redis-7.2.5 | 1 
                s6-dns-2.3.7.1 | 1 
          shairport-sync-3.3.9 | 1 
              skalibs-2.14.1.1 | 1 
squeezelite-71c012ad9ba102f... | 1 
                      tar-1.35 | 1 
                   trinity-1.9 | 1 
uemacs-1cdcf9df881440497501... | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv32    | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/cf7f2582ecf0705eeaa0ab1644118260271ef754 | ORPH
    arc      | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/a53529188838f48c21d5e365d4bc260b4698f125 | ORPH
   sparc     | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/8da986ed607814f9cf16526a6a5f9a79a83570fb | ORPH
  mips64el   | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/fa3c2cb6a7b3fbb9ecf4f8ea8d3edf37db425bf5 | ORPH
  sparc64    | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/65c4949f305bebab723fb7e9f6995274c0ada2ae |     
  aarch64    | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/f4eb5dfbcfc5ecdc057ce5629c7249dcfb2ebc68 |     
 microblaze  |           apr-1.7.2            | NOK | http://autobuild.buildroot.net/results/1bb817220520cefdf3648080185313320e1148f3 |     
    i686     |           apr-1.7.2            | NOK | http://autobuild.buildroot.net/results/a4d9c1a041a6181e800c0c2cea62fa7078573143 |     
  riscv64    |           apr-1.7.2            | NOK | http://autobuild.buildroot.net/results/94c63fd327a871496d8171360105ac3e6b51351e |     
   x86_64    |           apr-1.7.2            | NOK | http://autobuild.buildroot.net/results/1fea32333d497530bc15bc26232e6605a9ab20a3 |     
   xtensa    |         apr-util-1.6.3         | NOK | http://autobuild.buildroot.net/results/3aba8f1f7adcdd7210d555128787ba1b8c277635 |     
  sparc64    |         apr-util-1.6.3         | NOK | http://autobuild.buildroot.net/results/7f6a4a466dcd41b6474f6aff2a77cf7e29e22663 |     
  powerpc    |         apr-util-1.6.3         | NOK | http://autobuild.buildroot.net/results/781a0e9907696c820856b7ab966e233a7b82195d |     
 powerpc64   |         apr-util-1.6.3         | NOK | http://autobuild.buildroot.net/results/7f45161209984eaa99efa42178c6b7a31b0c8096 |     
 microblaze  |         apr-util-1.6.3         | NOK | http://autobuild.buildroot.net/results/4c0e8ed1f41c485fb6cb273736f8367266739ab8 |     
   sparc     |         apr-util-1.6.3         | NOK | http://autobuild.buildroot.net/results/546e344f8d9fdb2347398def4fe997f1c1ee3761 |     
    or1k     |         apr-util-1.6.3         | NOK | http://autobuild.buildroot.net/results/adb8cddebe0e33860e59e1c635ae6d9226239f10 |     
   armeb     | aubio-152d6819b360c2e7b379e... | NOK | http://autobuild.buildroot.net/results/d5040444fbba5abb4a73dd4eb95590a27a8dbace |     
   mips64    |         augeas-1.12.0          | NOK | http://autobuild.buildroot.net/results/2d7a348f7c1082f535a2c6f4fabcc78ea6c7b98d | ORPH
  powerpc    |          autofs-5.1.9          | NOK | http://autobuild.buildroot.net/results/b7a2c7103f48620cc4fa0821bff45eac20bb6e5a |     
   nios2     |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/33f9938855c282e65215537fe38ebdec6f6bf9ac | ORPH
  mips64el   |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/9a0a1f690d43a4b3909176f575f8e99c5d874fa8 | ORPH
powerpc64le  |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/d02253af43681a4393481be4d9564d6a890ac441 | ORPH
 microblaze  |          axel-2.17.14          | NOK | http://autobuild.buildroot.net/results/85c4ebc64630d5b7c91de2d8427bc171230f253a |     
   arceb     |   bandwidthd-2.0.1-auto-r11    | NOK | http://autobuild.buildroot.net/results/2b5cfbb4b4dd5ec53d93e30344f4a7f9771f218b |     
    i686     |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/30096f4ec626d8be5d6c5eb9b4488d51f6fd1d54 |     
 aarch64_be  |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/8abefa5d3123150895d4ff35c1d39dc2a1453d6f |     
microblazeel |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/fcc44c401c8e87912dd4fc8288a6d915ce39691d |     
 powerpc64   |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/df590e8dbc6de09eba0b4e7f9ff4cc88a1f9c84e |     
    arc      |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/011f130ef4e1d1965af550ced4da28e8c0d748f1 |     
powerpc64le  |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/3e3b3426e3c0e668b0a09458c6dc7c17e91412c9 |     
    m68k     |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/30c9dd7f83b7f71444538b69ce8cb9f8f0577f49 |     
  sparc64    |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/72d47796a3955dd01c7a42dd35ceed6402890e38 |     
microblazeel |         beecrypt-4.2.1         | NOK | http://autobuild.buildroot.net/results/a78c6a6d59224daf48f35349ec4f1be92ce051ba | ORPH
    arm      |         beecrypt-4.2.1         | NOK | http://autobuild.buildroot.net/results/36f28dfe058033ec45657e1de7e4e8a2b0f07efe | ORPH
    arm      |         beecrypt-4.2.1         | NOK | http://autobuild.buildroot.net/results/b0690e9b4e3168aee7f781d892e70e985016e29d | ORPH
   arceb     |          boost-1.83.0          | NOK | http://autobuild.buildroot.net/results/5ece275bba7e2489124fc44b34272d5a3ddf7524 |     
  aarch64    |          botan-3.3.0           | NOK | http://autobuild.buildroot.net/results/cfd73eed9d3dd11a72a1bd01977099c583a32f06 | ORPH
 powerpc64   | brcm-patchram-plus-95b7b691... | NOK | http://autobuild.buildroot.net/results/ee9244bef25f3909828952b4c8886941a6393cf1 |     
  riscv32    | brcm-patchram-plus-95b7b691... | NOK | http://autobuild.buildroot.net/results/067e0175327a6ec6ce3917d8833111db106bb75a |     
   sparc     |         cdrkit-1.1.11          | NOK | http://autobuild.buildroot.net/results/b558b5614e9a91c19244827f961ab4f0cfe88976 |     
   sparc     | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/a8b89ba1c0964ed2ebb5584597d4b603256fc38f | ORPH
 microblaze  | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/3af19996362ad64430e10333bee3278b4cbd982b | ORPH
microblazeel | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/070ce194344ac5842e69c3320e1a6de492e466aa | ORPH
  riscv32    | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/6c4da8f6d6e444e166c98668e05e6648c3098a7a | ORPH
    i686     |       containerd-1.7.18        | NOK | http://autobuild.buildroot.net/results/8f8ab0f7bea087de9af97870895462d8f0493f96 |     
    arc      |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/eb1eb0e532bae738ea37a98f4292253d7ce068db | ORPH
 powerpc64   |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/c18d40a48ade96aee2de81e7bdece704fcc6b016 | ORPH
  powerpc    |          cpuload-0.3           | NOK | http://autobuild.buildroot.net/results/bf031032fb8ea7f343a36ded2726ed0e0ef2490e |     
   s390x     |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/0fad64083a24f2f76ae85359fade71debe0c6d5b |     
   mipsel    |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/bb194a3d5a54ffdd1e7c8b18522a219e09624669 |     
    i686     |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/c6b4176ae1a316932a3c1344e8c799080f1e9300 |     
   s390x     |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/400e1eef30e6a8c1dacd1afcfff91bc5675faaf7 |     
    arm      |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/1999540a2876b39bf904ca70003378b993db49d3 |     
 powerpc64   |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/8af2a07c36974f5cab09e6ff1b01cf11f57e79e2 |     
   nios2     |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/c664f288b24e3b5a13d590adfe5cd8943f8864a8 |     
   mipsel    |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/72a4cdbe1cea5e0bd82a75339731319d6f7e89da |     
   armeb     |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/3b65b04a412bbbac909b1dd2259b0ff729290bca |     
   mipsel    |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/e731b4d3a1e309883473dc153c74d14f75a1505c |     
  sparc64    |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/11a7b554a3654b968b3cdc4adeb9076cdbaefab0 |     
   nios2     |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/057dc3c0df79beb844254db59c11740c238ed833 |     
 aarch64_be  |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/bdc52a8d491cc32cd6459631f26345fb9903add9 |     
  sparc64    |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/3600e88692fbbfbfd1d6b993868a20e92b20dd37 |     
    mips     |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/c8421f1b86ffeb5d026cb04d8d6307371a19eee9 |     
 aarch64_be  |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/89e826600d7d6067c0883610d7ca0827d9dcd194 |     
    arm      |      crucible-2023.11.02       | NOK | http://autobuild.buildroot.net/results/370c7ca05753d07e5e71ccce8a42fef013038a81 |     
   s390x     | cwiid-fadf11e89b579bcc0336a... | NOK | http://autobuild.buildroot.net/results/debe66a2570e72aae61b3ecc3934f66d59dbbad0 |     
  riscv64    |       dahdi-tools-3.3.0        | NOK | http://autobuild.buildroot.net/results/ca7be579eb7c24bb470d7fae709e0a1a661ae5ea |     
   armeb     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/916fbfb126bf33730ad6293b0f399bbeb1b4fdce | ORPH
   sparc     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/a3640cdf325b178277f08722f6f9db50878277f0 | ORPH
   s390x     |         dovecot-2.3.21         | NOK | http://autobuild.buildroot.net/results/fe9951f7e6be2d99c434fe887395423c1d1689da |     
microblazeel |         dovecot-2.3.21         | NOK | http://autobuild.buildroot.net/results/bd8426778f94b1ddeafacf267c4721b6f8c9f96e |     
powerpc64le  |         dovecot-2.3.21         | NOK | http://autobuild.buildroot.net/results/f511ac0983e66cf1f8862a7cdcf869913c7cb7d3 |     
powerpc64le  |         dovecot-2.3.21         | NOK | http://autobuild.buildroot.net/results/775ff5ce3cea4e0d519efa16e7c9b890db7adc36 |     
   arceb     |         dovecot-2.3.21         | NOK | http://autobuild.buildroot.net/results/12fba01ee66f072cc4ff620d87a41700818477cf |     
 aarch64_be  |         dovecot-2.3.21         | NOK | http://autobuild.buildroot.net/results/b6a3cbebe8f72372310fe3715d6b35b0b0cfeaac |     
    arm      |         dovecot-2.3.21         | NOK | http://autobuild.buildroot.net/results/a9035533eae365b13c64b0180b552c9ebf544c6f |     
    mips     |         dovecot-2.3.21         | NOK | http://autobuild.buildroot.net/results/95120b4eadf655b66efb2623c4ebd9b3f96dcb94 |     
 powerpc64   |         dovecot-2.3.21         | NOK | http://autobuild.buildroot.net/results/af6decab05d847eacdf3d482ebd45fdb79372226 |     
   mipsel    |         dovecot-2.3.21         | NOK | http://autobuild.buildroot.net/results/0f8a04afed516efd8c4d62ced24ead2712e1787c |     
  aarch64    |         dovecot-2.3.21         | NOK | http://autobuild.buildroot.net/results/7b693664200b83b4a2c1f6ee553b3cde725e7117 |     
   armeb     |         dovecot-2.3.21         | NOK | http://autobuild.buildroot.net/results/4fba0647177c0035fde9b5408af94660d81ec947 |     
   xtensa    |         dovecot-2.3.21         | NOK | http://autobuild.buildroot.net/results/128455e77ba6919f222a0286c80e9fa36b443ba7 |     
    sh4      |         dovecot-2.3.21         | NOK | http://autobuild.buildroot.net/results/6712c1b38dce3576bfe25fd09c42e00ff1c7e45c |     
   mips64    |          dump1090-9.0          | NOK | http://autobuild.buildroot.net/results/ff19ae6912c9ba36efcf8220ab2c687a02761cba |     
  powerpc    | dvb-apps-3d43b280298c39a67d... | NOK | http://autobuild.buildroot.net/results/dc1fb7af6f84acccb19bb42de720ed2aae22a88d |     
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/5cfe9eb55c0b60dcf4f2c0ba9ee542cbc622a783 | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/b0c8e63bd4b4c4fe4bed4a7919bc4170957dc207 | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/8a640c2ce1e3ed5e6c92b8b962ae66ed5795e7c9 | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/79403cb850e8393d56d47816a2b1ba1533c4b94a | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/e1c92b8ff1b5a6ece43a2e1a57a6788b35e79f05 | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/7ad22237d0f424d3400e3299a4de7554a4868bb7 | ORPH
   arceb     |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/e9826c3dc68b2411ddf0be798f11ec3e31e385bd | ORPH
  mips64el   |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/ee8a4a38fac843e5fff520bcebb71ae22405cb59 | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/6f37ff9b34ae3c6ae96a41de7bc69d63a1ea59b2 | ORPH
  mips64el   |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/8018d6a01667766e802cd5b142334d2897c75dc5 | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/6c82cb75d4f26d78153a89805cd09e29db456374 | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/10baa053e65429804b7b646277e1894200de918f | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/6350c5828cc565d9e87090fa4d47b3936e7027f9 | ORPH
 microblaze  |          evemu-2.7.0           | NOK | http://autobuild.buildroot.net/results/f64fb3de18df05d02e7bddff25c0ea24347d00a4 |     
    sh4      |          evemu-2.7.0           | NOK | http://autobuild.buildroot.net/results/871304207577d9b8a60fcd6ff1fd16eaf6b626b2 |     
    arm      |          evemu-2.7.0           | NOK | http://autobuild.buildroot.net/results/066172a4bb60762240a287aa8ce5622f879f2975 |     
   sparc     |           faifa-0.1            | NOK | http://autobuild.buildroot.net/results/3bb1949c5c615bbf78cae0868afc22c72aecc3fe | ORPH
   nios2     |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/cd69661aa8041b838efa3c20ed071e19f62f7cd1 |     
   xtensa    |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/801f2a402a5f8ccc208aa26db8fb47de10a214a8 |     
   s390x     |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/80f46efe9bdb24b767d1ed79c325d131d381209b |     
   x86_64    |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/462f0183b85c4fcebf208ef8bf1b8d7eafceb955 |     
microblazeel |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/f1cddcc30cf69adaa8390a2317575085fc2a235a |     
  sparc64    |          fbdump-0.4.2          | NOK | http://autobuild.buildroot.net/results/0e20e238f5f17233d0c9c5d49f64cf225e7b36cf | ORPH
microblazeel |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/5836fd0d1d13a0885bf659ef4d62c0ffb51f81b5 |     
 microblaze  |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/65c4507378f731871e3814418476ce6aa0e70c17 |     
   mipsel    |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/c989faa56e2e296665440e28d549e745ca2fea59 |     
 microblaze  |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/ba1704e0f717f51c4d0162958726c29ea8422594 |     
 microblaze  |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/335cc6bc3be261cc295ca3ac0c0934d334ce0384 |     
    arm      |           file-5.45            | NOK | http://autobuild.buildroot.net/results/95f0f721b3ef2c3185ce5443c91de142fc02c70b | ORPH
    mips     |           file-5.45            | NOK | http://autobuild.buildroot.net/results/9119d281e0bdde95243079ad2bfe2301a53ccadf | ORPH
    mips     |          flann-1.9.2           | NOK | http://autobuild.buildroot.net/results/d23129390ce6899ab4e365dc5491c41251af7940 |     
powerpc64le  |         flannel-0.25.2         | NOK | http://autobuild.buildroot.net/results/aeaf609cdc8b080f2017ac83c5a207e76c3a30eb |     
  mips64el   |        fluent-bit-3.0.4        | NOK | http://autobuild.buildroot.net/results/5d2eac31b54d85fd1a422fe959dc211f2fed5c27 |     
   sh4eb     |        fluent-bit-3.0.4        | NOK | http://autobuild.buildroot.net/results/2c28722658c6e15fb67d056c67bafeadb8b40e59 |     
   nios2     |        fluent-bit-3.0.4        | NOK | http://autobuild.buildroot.net/results/90bf2e19653a35a1b5e8b3558146bb2b34d70e98 |     
   nios2     |        fluent-bit-3.0.4        | NOK | http://autobuild.buildroot.net/results/a564a1a2db6680752c95301ebae76c6302f6618d |     
 aarch64_be  |        fluent-bit-3.0.4        | NOK | http://autobuild.buildroot.net/results/cd3a8192802b5b69477e5ba2a425c77977ae05c1 |     
    sh4a     |        fluent-bit-3.0.4        | NOK | http://autobuild.buildroot.net/results/3f91796ea63dde24dab0f17f6c0b45bec4fc7af4 |     
    or1k     |        fluent-bit-3.0.4        | NOK | http://autobuild.buildroot.net/results/f4ba330152f772d28c0d727df1da1cc1c416440a |     
   x86_64    |        fluent-bit-3.0.4        | NOK | http://autobuild.buildroot.net/results/3401540d8cc1796cb3e61dc074318a75ac407b11 |     
 aarch64_be  |        fluent-bit-3.0.4        | NOK | http://autobuild.buildroot.net/results/99dd4c4b04c2b7fb4b701b51a46fe49a0387fcd2 |     
    arm      |        fluent-bit-3.0.4        | NOK | http://autobuild.buildroot.net/results/1238e638764abe124632168a5d8d585a923181db |     
powerpc64le  |        fluent-bit-3.0.4        | NOK | http://autobuild.buildroot.net/results/49817dc034fbe020bd5415f5c5b9fa2f6646ff7c |     
    arm      |        fluent-bit-3.0.4        | NOK | http://autobuild.buildroot.net/results/d7b120680a16e1f6f6088a7f9976471481d00901 |     
   nios2     |        fluent-bit-3.0.4        | NOK | http://autobuild.buildroot.net/results/d10c2f3c8eb4166cc0fd3a87ca324ce82d52813a |     
   armeb     |        fluent-bit-3.0.4        | NOK | http://autobuild.buildroot.net/results/a80639575e4d9b62b680cbfb268385800d8f7fd9 |     
   mips64    |        fluent-bit-3.0.4        | NOK | http://autobuild.buildroot.net/results/c7983912f0707d9ab902ddd63abce03b94f3aa4f |     
    sh4a     |        fluent-bit-3.0.4        | NOK | http://autobuild.buildroot.net/results/4d64907a57fa90ddeba19a447bfadbef887f41ef |     
 microblaze  |        fluent-bit-3.0.4        | NOK | http://autobuild.buildroot.net/results/69957476021ef6d1500fd581ddff73993b643566 |     
    m68k     |        fluent-bit-3.0.4        | NOK | http://autobuild.buildroot.net/results/87b2842bfa6b29e472515a3c94fbad24d87302af |     
  sparc64    |        fluent-bit-3.0.4        | NOK | http://autobuild.buildroot.net/results/9c895e16b171456bfed862a0ef26beee48fd22dd |     
   nios2     |        fluent-bit-3.0.4        | NOK | http://autobuild.buildroot.net/results/6ad18dbf029b46b5d3f04a7cea166c80d898c93f |     
   x86_64    |        fluent-bit-3.0.4        | NOK | http://autobuild.buildroot.net/results/fd17599d1ae84de5908e06302429da2ebf780f24 |     
    arm      |        fluent-bit-3.0.4        | NOK | http://autobuild.buildroot.net/results/370daae94bf81df457d1d0b339acb687cd2556e3 |     
 powerpc64   |        fluent-bit-3.0.4        | NOK | http://autobuild.buildroot.net/results/ac694d2a53e83fd0d38197f4e79c824f4c1023d6 |     
  aarch64    |        fmlib-LSDK-21.08        | NOK | http://autobuild.buildroot.net/results/59eaa7410a1e6dd42a6bbfc1de22fd04625ab071 | ORPH
microblazeel |          foot-1.16.2           | NOK | http://autobuild.buildroot.net/results/2a8d86891812e503d4bfeda7e6d25b2aeb939ec6 |     
   s390x     |          foot-1.16.2           | NOK | http://autobuild.buildroot.net/results/ec5589f9006a85c8379e0aee0ce8e3fca280f609 |     
   nios2     |          foot-1.16.2           | NOK | http://autobuild.buildroot.net/results/98789673c4c404295df4dc71155bc5067d72a6e3 |     
 microblaze  |          foot-1.16.2           | NOK | http://autobuild.buildroot.net/results/7dd839e34d44bf2d1725aa9b51b9846bfbc9f6f2 |     
 aarch64_be  |    freeradius-server-3.2.3     | NOK | http://autobuild.buildroot.net/results/fe51ccf45960dcaa321fe379c32228908a76d941 |     
   x86_64    |    freeradius-server-3.2.3     | NOK | http://autobuild.buildroot.net/results/4bfa9925bb6a96defc0914eb056317f8fe69d53c |     
   s390x     |    freeradius-server-3.2.3     | NOK | http://autobuild.buildroot.net/results/3a4f6f5f2108ff4e84a4785f3683e25d82420a4a |     
 powerpc64   |    freeradius-server-3.2.3     | NOK | http://autobuild.buildroot.net/results/c21202de493f6620b55ccfa424d7b306b1072ae4 |     
 aarch64_be  |    freeradius-server-3.2.3     | NOK | http://autobuild.buildroot.net/results/ec2c10bcc353388b6661949fe3c733f9e2b1fb30 |     
 powerpc64   |    freeradius-server-3.2.3     | NOK | http://autobuild.buildroot.net/results/4248d7c42e29dfa3553d0a180ad0093257c38d05 |     
   mips64    |    freeradius-server-3.2.3     | NOK | http://autobuild.buildroot.net/results/ca1d762bbba5cd0dc0e1a9e1cacf89b3f0812fba |     
   mipsel    |    freeradius-server-3.2.3     | NOK | http://autobuild.buildroot.net/results/fe2590c9ec3de9c04f9bf38f90ff45e32feb28cb |     
   xtensa    |           frr-8.5.4            | NOK | http://autobuild.buildroot.net/results/0c192b1beb6ff182a8688b9b6dc34b4b23ad61e6 |     
    arm      |       gdk-pixbuf-2.42.10       | NOK | http://autobuild.buildroot.net/results/7465ce5855301ec72dc674cc8a825833ce4b2e45 | ORPH
    i686     |      gitlab-runner-15.5.0      | NOK | http://autobuild.buildroot.net/results/2fa2a6601095832230bd022c25f8fcc5f66d13dd |     
powerpc64le  | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/cf7efef4fb8fba401b9616d45c3072e85d36e117 |     
 powerpc64   | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/7f5b291f6eba14abf2415cb0b7aa2eef930679a3 |     
powerpc64le  | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/3ca38fc90d65618259b3b27a0e86b4f0bea12b15 |     
    arc      | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/e36a177f7c6c8588d0cbc512cdab23cbb1b82955 |     
 powerpc64   | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/72d56232e70d4d6484481ff713a91fe77a9531d8 |     
  powerpc    | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/136dcfe4f0693f9609d98e0e90e71c4d0ab4369c |     
 powerpc64   | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/9a1e9f5e71dac0a4fc091af0030a23533d571440 |     
    arc      | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/b7177477b21a25558e84ccdae23a2edae3598dcf |     
 powerpc64   | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/991e8ae3a806f95206d69520f3915d858fdf656f |     
  riscv64    |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/c6a4006b5d975d1db173596609c0dbe4e15b6f68 |     
    arm      |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/846d4acdcc63636b6cc4b9300e75e074d443e211 |     
    arm      |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/3c744a14cda2d3da90303bd1728d2d9ed1670699 |     
   armeb     |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/a3f2206b2aa5f2748975fbc2355fdf179cbd2c2b |     
 aarch64_be  |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/a49d6c9886021ab7d0a2fed0a507b825caeae15a |     
    arm      |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/638a0f57c0df8774f089e0aab79934af40a23f4f |     
 aarch64_be  |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/a42ef3aca599a1304634d706b4ea9d537097ddbf |     
 aarch64_be  |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/7eabf12e43ce044d0355288fab326567b83da6a7 |     
   nios2     |         gnuplot-6.0.0          | NOK | http://autobuild.buildroot.net/results/547f6c915ffe725705ecc417f47767b67b04dbea |     
microblazeel |         gnuplot-6.0.0          | NOK | http://autobuild.buildroot.net/results/fe5836d9d81589346d6341718decddab121e4f8d |     
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/a5a157c079449ccddadc33ac5024f9fd9058dff6 | ORPH
   sh4aeb    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/ed592a158fbbea5530734f8c1de6c071ff64ce46 | ORPH
powerpc64le  |         haserl-0.9.36          | NOK | http://autobuild.buildroot.net/results/45c2e9b1ecd5ad641a4a7bc0499a9d27d0b5dc2c | ORPH
   xtensa    |         haserl-0.9.36          | NOK | http://autobuild.buildroot.net/results/58b6937b5997303b167a20d3683b71c65ba3768f | ORPH
    arc      |         haserl-0.9.36          | NOK | http://autobuild.buildroot.net/results/b2c5363e671f91fd6b92a038871c9d7cc87dbf84 | ORPH
  mips64el   |         haserl-0.9.36          | NOK | http://autobuild.buildroot.net/results/97e1874f0f0ee2e7126405e41648846c6938b1bb | ORPH
  mips64el   |         haserl-0.9.36          | NOK | http://autobuild.buildroot.net/results/a8f723c13313096fbf0cba24aa5f4e1ea4a8470c | ORPH
   arceb     |         haserl-0.9.36          | NOK | http://autobuild.buildroot.net/results/8f66d8f35b1abaebbd07988e4a1dfa62b2e4861d | ORPH
    or1k     |         haserl-0.9.36          | NOK | http://autobuild.buildroot.net/results/8ab75c2f36bf130e68fe075741c81e7a152a45ce | ORPH
   mips64    |         haserl-0.9.36          | NOK | http://autobuild.buildroot.net/results/ac35f5c78b5ad4bcd1c54b1d3ebd2c4f65e1419a | ORPH
  sparc64    |         haserl-0.9.36          | NOK | http://autobuild.buildroot.net/results/a614a4aed8722569191d7f0000e79014559198b3 | ORPH
  powerpc    |         haserl-0.9.36          | NOK | http://autobuild.buildroot.net/results/8b09ad26d55228dae8567427593b9c9d59f2a8d9 | ORPH
microblazeel |         haserl-0.9.36          | NOK | http://autobuild.buildroot.net/results/ca88f6cce6ebe2243c658db0ca3ee039479fdf40 | ORPH
    arm      |         haserl-0.9.36          | NOK | http://autobuild.buildroot.net/results/dc0437a3bbb567dbac483995ec6bb528cac435de | ORPH
   armeb     |         haserl-0.9.36          | NOK | http://autobuild.buildroot.net/results/cfbb683d6b21788a8888058394a915d20a37bc3e | ORPH
 powerpc64   |         haserl-0.9.36          | NOK | http://autobuild.buildroot.net/results/0fde664b9246ef42a3734f23547d259812eb330f | ORPH
    i686     |         haserl-0.9.36          | NOK | http://autobuild.buildroot.net/results/161a47b09d50eddd94183e27cbb33fcf50663c56 | ORPH
    or1k     |         haserl-0.9.36          | NOK | http://autobuild.buildroot.net/results/5740013d75d82e8391740c2af519d4a34ebfb661 | ORPH
    m68k     | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/6daa67832a00549a6f6563a65c24d4cd3d5f72cb |     
  mips64el   | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/b963859239c5063583ed88c0065b90b1c69ef8ae |     
    arc      | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/1ff9711d1590396c501d8abc8d7da30ab9fc54fc |     
    or1k     | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/e839445ce21577111340c945cc6a172c2335a53f |     
   mips64    | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/5ceef4c1d8a2d695bec662d99e21524c91ec793a |     
    i686     | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/68568254f4790ae3a255801eeb472b641a9bbbfe |     
   nios2     | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/43be55c57cccfb104cbe964f796da6f17c80201c |     
  riscv64    | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/cd7ffd1b77a0e56f22c9318961db3a7b32316fd4 |     
  mips64el   | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/7cbeaf118862b9cc415dbd88a06c4147403482a4 |     
    sh4      | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/c07ff202664639ea5c85bfd45dea6fb3c1087635 |     
   nios2     | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/b3f4bcd8a3525d46007876028c5cba5626e71d2a |     
   mipsel    | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/52246d5377227e9525af0b497d827ac61e8bc906 |     
microblazeel | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/da0bedb1ee0a3f4bc86668852f22ab72941434fa |     
   x86_64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/73d4618f24614b7a73d2e895dfeb0eb7480becac |     
    or1k     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/b21f8dded29f5a6b7a66192416406cef0f8ac6f2 |     
   armeb     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/65d7c18c885e72c899d03a1ad6a5c05fc02bd15f |     
   sparc     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/f23f86bcd05ae91d70868c7d2e58030093b46746 |     
 aarch64_be  |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/6eb2726c6c70f97059c63762ab42fc54f04a905c |     
   mips64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/06292b66c6ef137a8ae456ef902d38532a60d8b0 |     
   arceb     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/847a862e7bca47c1ab0ebe4a8334087d114f8fec |     
microblazeel |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/14bd497bf5e6c41ae566a412ce54d6a02f008e81 |     
   s390x     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/6f1d8dc91276c334a1beebd28219fd1a754de9e4 |     
   nios2     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/282e887d1e4ff7fa655684fb5e57275f573e5664 |     
microblazeel |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/d94c92174306c4f648c3981476f4b3da4bd953d2 |     
   nios2     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/6592ddf5229607ab12bd115211f41ed02adf031d |     
microblazeel |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/45f41e7c7eef483642e635f65a476f2271962a55 |     
   nios2     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/774054fef8f4a7fc9983bce120b964d00f39a9c8 |     
   arceb     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/d1a6529f3bcc340af1787ce7e540983959580d1d |     
 microblaze  |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/5bcb64eabbcf796e009c91ba54eb8cd498ea7e2c |     
 powerpc64   |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/eb43629818a9bf5342b58abf3d9b5669e223b9a5 |     
   armeb     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/1e1d76863389d1cc4d94e33b49ae2151027ca8fd |     
   nios2     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/94565f93c226530929afc530ec2afd67cbedde70 |     
    or1k     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/f9a610ba2dd888cc4eaee85a20d2ee3148c4c593 |     
    arm      |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/90014a417ebf9a664501f69fd415278271f44dbf |     
microblazeel |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/411c4bed70faa3e4fd1a45c73a6951bec1b2f879 |     
   armeb     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/338e71ddfa9d98aed34823fcbc1ee08154eec718 |     
    or1k     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/5dab075de7cbfdee72a5e6084709b18bb0c24a85 |     
 powerpc64   |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/b0463152d4a11af0875e492b911991c65ce78bd1 |     
   s390x     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/32ae4d6e465f49db916ec0ad7fdc1373793988d4 |     
   nios2     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/5e7df17a267c3f9bfce9e48e6f2e2b81b0245e21 |     
    i686     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/f3ac2987f8f1b6f531fc37284111e89fcc12a934 |     
   armeb     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/43fbab5b5839d15dc4c2ee6f6eb80e2c0df89333 |     
   sparc     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/d9f02c2f928c81daa02b9467aec134e2e7f12e41 |     
   s390x     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/bce8e4a9d7ada9498673b83432be686bfb7b7009 |     
 aarch64_be  |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/ed0b0b78b7cb74de51323283facf6a11ea1a5bef |     
    or1k     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/fce284f774da66f3561415c356b04667511149ba |     
  powerpc    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/9229f35f3eac4df736a44434d87440dad824722f |     
microblazeel |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/f90eb803b4042b6f7be480db9081e4b33f66599d |     
   nios2     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/27d21dd183429cc92834479de768a19b5cf8ed87 |     
 microblaze  |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/1af099809602a8c06b690fe0efc01fff61a4bb6c |     
    or1k     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/234ba1edb7f7230f9f85c55dbed7b395a8bfcf3b |     
 microblaze  |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/21d44b51e01dcc10d272cc9a0920a6a64152356e |     
 aarch64_be  |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/dd4f4ae78ae10194fc86571a4a265b4ef9380295 |     
   xtensa    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/df7441eefa8329538956e9a93b55a89c58de0dc3 |     
 powerpc64   |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/5163479c9ba1cf595ab726f1a2349c94bfda9e91 |     
    i686     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/b0c155e024810ea9e573ce23cfdde1f19dcfe32e |     
    m68k     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/817f5c154dc22e125bf7f7579c5ad23cca690268 |     
    i686     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/616d650ac92b5bb5cb00c6b6cb3bb3b96f5215ed |     
    sh4      |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/59d9b6c316b46b24e7bb06227b477ec722914773 |     
    arm      |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/0ca106c3242c48559dcb5da3da699f2d174bcfaa |     
microblazeel |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/de8ee1e6bfabd419c0bd4966414e03d6d7f1ff33 |     
powerpc64le  |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/4de739c62df0d77b5fba55cf2a938cc92f4e89c5 |     
   sh4eb     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/2aa34cf7fb0794a23cea88be3215c22da81745f7 |     
  mips64el   |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/1414b04c33e83bb20332aee1b3841d933e35dce3 |     
  aarch64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/017fbcedbee7134dfaa68a658dac6ff3cc0918f6 |     
 microblaze  |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/c415bb88f07c5f564436887ebb5c1ec875e73bae |     
   xtensa    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/2e2c3f1f31619c79f2d27cd1f1a43054705f4a3b |     
    m68k     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/fad215e9e461eaac154236b67edaabe4b8781836 |     
    or1k     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/eb61918739eb15fa468df9de4d9375ca49636aa2 |     
   armeb     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/45705d94672d5e8be2cd574549228b9ef59d0879 |     
   x86_64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/c27f39e97b5af2c0abfd680990428c84b7f9db9f |     
  mips64el   |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/e7b504c559dd0b1615d1174ea63bebb9410808ef |     
    sh4a     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/617df1d67b981d7e522eab38a1213ae1a52326c1 |     
    or1k     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/deb9b45270bdbb2af2578dbc69f345f473503cda |     
microblazeel |     host-gcc-final-13.3.0      | NOK | http://autobuild.buildroot.net/results/fbcf5ddac01da7f52f3575b472ce55cf5ba05dc1 |     
powerpc64le  |     host-gcc-final-14.1.0      | NOK | http://autobuild.buildroot.net/results/2069e23387bded9dc5333e3bd9298d5b5f2ec07a |     
powerpc64le  |     host-gcc-final-14.1.0      | NOK | http://autobuild.buildroot.net/results/3d1c516025d8d75ebe100e1e52696d26b5e90fb5 |     
powerpc64le  |         host-gdb-12.1          | NOK | http://autobuild.buildroot.net/results/af89585a1b24e8e6d1e9cec73cca8713f2808083 | ORPH
  aarch64    |      host-gengetopt-2.23       | NOK | http://autobuild.buildroot.net/results/bf3dc9a7934a59b77aeae660677d5600236b5bbf |     
  riscv64    |          host-go-src           | NOK | http://autobuild.buildroot.net/results/82cfc3a0946992c4005a9782bc3274f6a2e59ffa |     
   mips64    |          host-go-src           | NOK | http://autobuild.buildroot.net/results/0216f49af33e6afe20bd54b0f469c8ecf109ce38 |     
  riscv64    |          host-go-src           | NOK | http://autobuild.buildroot.net/results/3312277fbbe3fba221e91096ee41c20c2e54c785 |     
  riscv64    |          host-go-src           | NOK | http://autobuild.buildroot.net/results/8bfb2598ac5a5b3c3fa86662d966b76d7983d07d |     
  mips64el   |          host-go-src           | NOK | http://autobuild.buildroot.net/results/960e8296efae7dfe8449737122204193f49067ac |     
  riscv64    |          host-go-src           | NOK | http://autobuild.buildroot.net/results/7a50fe7484db5a00dc70fa03ce355ae49e3807e4 |     
  sparc64    | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/62ad44ac57c0f8015921b2eeefb7dda751f48906 | ORPH
    i686     |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.net/results/9d036be858b924cde87439467c2294321555eced |     
  aarch64    |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.net/results/ca239a91b6f304ba76d9168ae695dc4907199cc4 |     
   x86_64    |   host-moby-buildkit-0.11.6    | NOK | http://autobuild.buildroot.net/results/f3c20a6dee7f971ca142d7922b8e398def77103f |     
    arc      |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/797cfeec9fd563b134cb2ca300da278e37db3cfe | ORPH
 aarch64_be  |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/7ef29022009d542d55cfa9ed026c40fa29ec23d5 | ORPH
  powerpc    |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/08f9c31e0ea67f3c2c56822492fffe606d41421d | ORPH
   mipsel    |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/0dae0eb660c159d095995c2ce50577fc35a0bc69 | ORPH
 aarch64_be  |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/5fe0940d48d276781a589f3a5bfaafb27ea3c6d5 | ORPH
  mips64el   |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/98c25714042a996806274f1ccb36ada16e9d2f45 | ORPH
  mips64el   | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/fee4811f78f46a948f7ba99fecf2ecd62a0e8405 | ORPH
    sh4a     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/45b39c0ccd81ef660d179226c741b25934261515 | ORPH
   mipsel    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/8a51b39f1d98d5054cb1b98b478c623b4a1edbd1 | ORPH
  aarch64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/8e05844baeddc91ecf979475b30d5061ae681b3c | ORPH
   armeb     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/9d88d7b8845bdb4cf5e72ecc8d12f3d96117d7c2 | ORPH
microblazeel | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/326b87b14aa838290316d68b97e6f81df9abe5a5 | ORPH
   sh4eb     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/4d0198f17e209372fdac8f0988214eea0a41b685 | ORPH
powerpc64le  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/9233f218a1eeddb34ae46c2fe21e2864d97bc411 | ORPH
    mips     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/3e612003379c9cb394aa609b6d88782cc91bfc7a | ORPH
    mips     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/fe5bd453338a720da12fa19cdc47f75bd6e6dccb | ORPH
   nios2     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/fef39e31890d8fa2daaf77cc677d374f3282a2f6 | ORPH
    mips     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/9fb5fc4eb6919e5b2345a4ee14961f2cb7d19b40 | ORPH
   x86_64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/c495a579d4446349bdb3674fc26b2a8d9bb2d8d1 | ORPH
  sparc64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/f15b9999b0823d4e71190a35f81f2d96df273688 | ORPH
   x86_64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/56b64a3d0098d11e0eb2fbaa7366c4e8f570fa7c | ORPH
    or1k     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/9caa0985a4a8120c6f6442573f0a56e0bdc4e743 | ORPH
   armeb     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/0b0736f3e5ffa663515f8a5fc3369ce88bcc9dfa | ORPH
 aarch64_be  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/3fce87623d5f7db5151264837f43389dffa7dd21 | ORPH
 powerpc64   | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/7007b470add8f0e908d68c594d2803deb4956a88 | ORPH
    or1k     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/32d91f583c11e6c53571858748646ef09b439ec0 | ORPH
 powerpc64   | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/f3bd9b70932bd080052c386f3707bdcf88e817b9 | ORPH
  powerpc    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/239e3f808f8112d3b2fff6d769c060e9df2ad285 | ORPH
   nios2     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/6cac4b1526b4b68ab627c65c66be860320aa2c7a | ORPH
microblazeel | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/a9d7b3b48cfa44cf4e65585613b913d9d28a639e | ORPH
microblazeel | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/8c2a0eb78e63cf5705eeaa2ac2d67db8d18584bf | ORPH
   nios2     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/38846a6c9fbf549054e58f5dc9a2846c7bf45d07 | ORPH
   nios2     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/eb1505169d483d08de355884a0f4639e6e4c1301 | ORPH
   sh4aeb    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/2d1068b890d5dcfe63600882215d521d1162ed27 | ORPH
   s390x     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/2e1ebf85d50008bf904d287d71059bb9fbf5bdc7 | ORPH
    arm      | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/fdf8a9e55ec1246d455adab4d408498bb992b8c8 | ORPH
microblazeel | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/b8a35d8a8e43e9c61512d09b83e7ae4bdcdf7507 | ORPH
 aarch64_be  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/0a6fb50abcb2b881327b6b360e4f3f8ffdd763e9 | ORPH
  powerpc    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/43fb5b1f725a52faa54c57df141f3c5ac22d58be | ORPH
   s390x     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/b7433f442346d06688887f6a7b2a283a3e56b046 | ORPH
   s390x     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/ba4cfe8ec3921e3068defdf44bcbd647bf7ea948 | ORPH
    arm      | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/d5f5a9661293ec87f73702eb2cbc8a3a7798506e | ORPH
 microblaze  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/123d113496f228146e2e4d134ec977eb462b4d7f | ORPH
    mips     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/ad1c845630c66a264f2b2fc265b4f06cbd47e1ce | ORPH
   nios2     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/81841cbbf45d1398d7a853710a0b30755159f993 | ORPH
powerpc64le  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/1400d83bb356b62613cc6363973a3801cf72eebd | ORPH
 aarch64_be  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/9ebf0b79ab397af6b35fecd71ad3306a432329f6 | ORPH
   armeb     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/b55df2c98c975ff6c45503cc7dfa13ce34f8fc7d | ORPH
    or1k     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/7062f78e5f3ab6dfae287c9232ff5364fbfeafab | ORPH
   x86_64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/37acd6bcca004cac5d0881869bdeb0a1dc68a2d7 | ORPH
   x86_64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/a94c08fa12a01971337fb41fcb0445cbde4ed53c | ORPH
    i686     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/3f2dc4531a01c9795e89a79d2e110dda9100a632 | ORPH
   s390x     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/59c69f3f826cce7b661d115fef1fb749e1b6d39f | ORPH
 aarch64_be  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/fb69546ea0ede76e49c66faa79d73f618669f8f7 | ORPH
powerpc64le  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/506a9010d67a6c9b2720d481b7db2d47591d74c7 | ORPH
 microblaze  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/93d2e9da0bd6286d16ff259598233257af9ab07e | ORPH
   armeb     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/54c88f997144eca2f2aa9c019e2e50b76cc303f0 | ORPH
    i686     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/4ac0605247ee426c75552c75f07dbef6f3a69a2d | ORPH
 aarch64_be  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/5bbcc3844f5a09bbfc6f7c7714875d7c8d6d8e4d | ORPH
    i686     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/b316d6d9ed64e2e5c9bfac2c1d409c0689c615f8 | ORPH
   mipsel    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/a5a6028065b505f778540e888edc0131302c1416 | ORPH
    or1k     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/415dbeb2e98a30034462d6e54a638aaf3d59a356 | ORPH
   armeb     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/f204895335ee9b9d1e97acdfc504327d8841e66d | ORPH
    arc      | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/4f9d6807ae52306642383ed7619c256ae2a67119 | ORPH
 microblaze  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/b2fe0909b58a4b2a088fb2541ad4a0a7bd88e427 | ORPH
   mipsel    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/433048233ac00fd08385eb7d0f5fb63ac2165256 | ORPH
powerpc64le  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/b802a94c383cae7bf34cc1ec9242ada161b9aad8 | ORPH
    or1k     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/1c140b2877962b6f3e0a8f02b83c8d47db7ff0e5 | ORPH
   armeb     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/02c09e4ac12eff8c187e54ee53282838b4f94adb | ORPH
    mips     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/f3f8260de99c9ba966ed5cc1571379eed4308ae7 | ORPH
 aarch64_be  |       host-qt6base-6.4.3       | NOK | http://autobuild.buildroot.net/results/f17bb2f6430f8f428ddcb9d612a0c6871ad65e63 |     
   sh4eb     | host-softether-4.30-9700-beta  | NOK | http://autobuild.buildroot.net/results/1aa490d1ed1274a2e1d03ebda0216dfae9db3853 | ORPH
   nios2     | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/b2b1fab04c8f772a9cbab9dfaac806ff2cd0eee0 |     
   nios2     | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/85117284f7e124146257ff8c343ef652f63bca08 |     
    or1k     | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/6890b2f3b94978f549dc6062e2e1374f267c8f15 |     
    arm      |          httping-2.5           | NOK | http://autobuild.buildroot.net/results/7c491201ff012f839ae0c38de8788498e69727be |     
  powerpc    |          httping-2.5           | NOK | http://autobuild.buildroot.net/results/b96f78ad61344067a4f5250d18cdbe0650f8eaf6 |     
    or1k     |          httping-2.5           | NOK | http://autobuild.buildroot.net/results/08db07e4ed22637bb078dc73277144b981eee098 |     
microblazeel |          httping-2.5           | NOK | http://autobuild.buildroot.net/results/42ed2c3d4bf1c76ef24ec7aa2322089bf4f40472 |     
powerpc64le  |          httping-2.5           | NOK | http://autobuild.buildroot.net/results/76606f55eb51fef18b0e2ff92b3c7e6c51f67885 |     
    arc      | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/852eca940c5b744c033aa9e08630eea466b0bf1e |     
   nios2     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/1819af73b74e46c7013a9355352f2e44f68b0d3f |     
microblazeel | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/7bca50c8fa8c6754c1b765b3b08b556819be3af8 |     
    arc      | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/c87c23a8150aacf1a2bf980141dd97161d9ad538 |     
  powerpc    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/c890a25da4f357294d584c5e8ee1ccd71e314627 |     
   nios2     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/c18e644ccf538adf66912bf40d83aaf665aa1899 |     
  mips64el   | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/12fb11281280ff6cf42bcac56a13357455263262 |     
    or1k     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/45235f25931de916925e95bdc81b185935e31239 |     
 powerpc64   | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/ea4992132089ce920338bf6d1ff40149ff56d8bc |     
    or1k     |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.net/results/39aed1b446c841b8c3c28cd06946536de09e78aa |     
    i586     |         iproute2-6.9.0         | NOK | http://autobuild.buildroot.net/results/84a21270ddf783f5bc2f72642e8cc3540df45b10 |     
    or1k     |          jack2-1.9.22          | NOK | http://autobuild.buildroot.net/results/806976d9a042a61803e587235c9fc3b04c81a313 |     
   x86_64    |          jack2-1.9.22          | NOK | http://autobuild.buildroot.net/results/eb32b1ffbf7c242aeb30b8c21b8272be302153d7 |     
    mips     |          jack2-1.9.22          | NOK | http://autobuild.buildroot.net/results/eaff23b5b7b5e167d8ed4b9ff36105967a43a23d |     
    or1k     |          jack2-1.9.22          | NOK | http://autobuild.buildroot.net/results/5cf399ea964c9dcafa52cd16a40aaeb333718f11 |     
    or1k     |          jack2-1.9.22          | NOK | http://autobuild.buildroot.net/results/86aa17df0d2d068c648c74a68033a7e3eb926406 |     
  aarch64    | jailhouse-e57d1eff6d55aeed5... | NOK | http://autobuild.buildroot.net/results/90d00afb8723226ffbfd762f3585ba520711b75d |     
   nios2     |      janus-gateway-1.1.2       | NOK | http://autobuild.buildroot.net/results/0b12f98727d4711f079182ae7871263934e76165 |     
    m68k     |      janus-gateway-1.1.2       | NOK | http://autobuild.buildroot.net/results/856c338b8a1000fccd5473c487d1e97e1f836623 |     
    mips     |        libarchive-3.7.4        | NOK | http://autobuild.buildroot.net/results/149626e6a3bcd4a22ab83ae2678e7f3e0271ae2b |     
  sparc64    |        libarchive-3.7.4        | NOK | http://autobuild.buildroot.net/results/2b09edefefa9bc7cf3f3ea48a569f589cc2fdfa2 |     
   x86_64    |       libargtable2-2.13        | NOK | http://autobuild.buildroot.net/results/6839657c9d2da20dd36bc28b6cdcddb697193917 | ORPH
   arceb     |         libcuefile-475         | NOK | http://autobuild.buildroot.net/results/d3669fdf7958d256d4067d7d212e79d1eb49a61a | ORPH
    or1k     |         libcurl-8.8.0          | NOK | http://autobuild.buildroot.net/results/d076758989cd97992171e56b814a8274559a2a41 |     
   x86_64    |         libcurl-8.8.0          | NOK | http://autobuild.buildroot.net/results/8e5a006ab7b37ba20c6326b6ee72cfe6d9def805 |     
   armeb     |         libcurl-8.8.0          | NOK | http://autobuild.buildroot.net/results/f6b4a464e7cdd072abf4516191a3669edba5ea48 |     
    mips     |         libcurl-8.8.0          | NOK | http://autobuild.buildroot.net/results/f238cb4e78447dbb01ec7df5484241ae4ad76b49 |     
   sparc     |         libcurl-8.8.0          | NOK | http://autobuild.buildroot.net/results/db7edd8d36e4affde0d88fdc72d2abc6ac4e126e |     
   nios2     |         libcurl-8.8.0          | NOK | http://autobuild.buildroot.net/results/4908302989601c382fbabbad635cae29e8bee3be |     
    sh4      |         libcurl-8.8.0          | NOK | http://autobuild.buildroot.net/results/006c2ac582e21a50de455447ae010057084cf708 |     
    i686     |         libcurl-8.8.0          | NOK | http://autobuild.buildroot.net/results/d4bd0789b88001ec2026ce3332bbb27099d34a35 |     
   arceb     |         libcurl-8.8.0          | NOK | http://autobuild.buildroot.net/results/12879e70c67c9a8f6220a97c1b9d42b2abb589bf |     
   mips64    |         libcurl-8.8.0          | NOK | http://autobuild.buildroot.net/results/e85d64b5927c5c95b05db1370fc50282ab61cd07 |     
    arc      |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/bd9c30fdb75e602f0b7fab332be64ffe2e8f4417 |     
   arceb     |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/321de2a18d38856c83ec4209843eaf7280a86dfa |     
    arc      |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/27f6ab5d1184a688eff3048679799511c596c99b |     
   arceb     |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/a236c69eea770437a59534370b6a5990873c3a29 |     
   arceb     |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/c0a21807341540843fc1c507b4992fcc4b0d050f |     
   arceb     |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/d33c4198a4b6e129d2a3fec82580367b2feed255 |     
   arceb     |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/83fc18be15ecfb533aae6276a56902943db0c900 |     
   arceb     |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/255cb3c2e5303bd31e9aeae0919a2c00b5b08524 |     
  riscv64    |       libfreefare-0.4.0        | NOK | http://autobuild.buildroot.net/results/564260a29767e0c207feddd4907047b9ef15b834 |     
    arc      |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/659a6b6eb29c011323e7030acfc722fd8dc30e00 |     
   arceb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/b0478445d6896f6d1669fda389703674483fa37f |     
 microblaze  |        libopenssl-3.3.1        | NOK | http://autobuild.buildroot.net/results/5a7f2a3343e5e34dc4b6b1efd401ab891635824c | ORPH
  sparc64    |         libp11-0.4.12          | NOK | http://autobuild.buildroot.net/results/fc8473d5b57d7ac63cda678676e60355dd8bc0a6 | ORPH
    or1k     |         libp11-0.4.12          | NOK | http://autobuild.buildroot.net/results/4624976316455eb1adb409547da236a638e08407 | ORPH
    arc      |         libp11-0.4.12          | NOK | http://autobuild.buildroot.net/results/1d1cb71e5d7c6d32ca310aeb88c0946d659776fc | ORPH
 microblaze  |         libp11-0.4.12          | NOK | http://autobuild.buildroot.net/results/6cef6f2eb4023df77dfd2fea1eca3ef4082ddcb7 | ORPH
  aarch64    |   libphidget-2.1.9.20190409    | NOK | http://autobuild.buildroot.net/results/2eb4cfa6d68d9047ed4cb5577cd85e13b8112d38 |     
    arc      |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/02b51c2708990336f9da38500f6b3569248fcae7 | ORPH
   sparc     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/0e208ccf410a1cce323842f31a3326078341ba4c | ORPH
   arceb     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/cfa73e6eddfccaa56fea78a45df6ce745e579f11 | ORPH
    m68k     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/15a7a8fd62fc271f252b9e3a4e549f0d96c3e00b | ORPH
   arceb     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/df08e99707ce45415c9ff257e923e756fc122b98 | ORPH
   nios2     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/977263eca21bbb85a468bfbecb465241c8da8d92 | ORPH
   arceb     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/af481647bb4b47473eb48380bf832b9a65ab9ffb | ORPH
 microblaze  |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/b51fcf0d71967ae907c280df8166ec84daccc59c | ORPH
    arc      |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/15534fbfae66f0c8d03b1cc3d44598bec9c04e4e | ORPH
  mips64el   |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/508ae26f6cab02e2cdf553e1d861f4c1bb53db21 | ORPH
   mips64    |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/7378ae0120cb2292520b59cb6c92d0ffd9547b96 | ORPH
 microblaze  |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/cba12c54d923bd0cd9abdca4446f8991b06514de | ORPH
   s390x     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/02027c2fad1c6dce8b189abc059d5ab87e0ec39f | ORPH
   xtensa    |          libsepol-3.6          | NOK | http://autobuild.buildroot.net/results/8a0cf483e8693cb13bc6d413267e00c2f7736ecb |     
   xtensa    |          libsepol-3.6          | NOK | http://autobuild.buildroot.net/results/f66266d2e6013421dfd4c489f8581558b3c9d641 |     
  riscv64    |         libssh-0.10.6          | NOK | http://autobuild.buildroot.net/results/35478ba6789e9b12218ae3ede032b99fc53c9fc7 | ORPH
  sparc64    |         libssh-0.10.6          | NOK | http://autobuild.buildroot.net/results/6d61f2176c76b7c593c5a8eca0a86cdd63d92468 | ORPH
    mips     |         libssh-0.10.6          | NOK | http://autobuild.buildroot.net/results/70eca62fe137798c41b08c088e899f8366bb9eb2 | ORPH
 aarch64_be  |         libssh-0.10.6          | NOK | http://autobuild.buildroot.net/results/7c4b546b4ad4bff6f4271065ccbb6df72cd6fde3 | ORPH
   x86_64    |         libssh-0.10.6          | NOK | http://autobuild.buildroot.net/results/5f7499590b717a4c5c6fe94591a32d51984b3077 | ORPH
    arc      |         libssh-0.10.6          | NOK | http://autobuild.buildroot.net/results/534c083fb52661f1adcc83ed7f2c89443923830f | ORPH
   x86_64    |         libssh-0.10.6          | NOK | http://autobuild.buildroot.net/results/c85df2437bee9ec0063e56cef4a73dac80e08568 | ORPH
   sparc     |         libssh-0.10.6          | NOK | http://autobuild.buildroot.net/results/4438c279717487fbc44b09dad7fede1cdaa86afe | ORPH
    mips     |         libssh-0.10.6          | NOK | http://autobuild.buildroot.net/results/7ebd4c7341d0371ffd899f30cd9ed137c38cacd4 | ORPH
   arceb     | libsvgtiny-ea9d99fc8b231c22... | NOK | http://autobuild.buildroot.net/results/2e61bbad2130b9a024695762999b9ef7fafcedb7 | ORPH
    mips     | libsvgtiny-ea9d99fc8b231c22... | NOK | http://autobuild.buildroot.net/results/9cff5ea5bed77aa9dd15c3e96c4396b327056b84 | ORPH
  aarch64    | libsvgtiny-ea9d99fc8b231c22... | NOK | http://autobuild.buildroot.net/results/5b75eb0634721909d43a7f59f39bb0b4a8ef05a3 | ORPH
 powerpc64   | libsvgtiny-ea9d99fc8b231c22... | NOK | http://autobuild.buildroot.net/results/5d58819376e010a4716a4e8a9b37823adb28f79a | ORPH
   xtensa    | libsvgtiny-ea9d99fc8b231c22... | NOK | http://autobuild.buildroot.net/results/ea01415248ad7d507b5a4f6ccf8f46bd8c6571b7 | ORPH
  sparc64    | libsvgtiny-ea9d99fc8b231c22... | NOK | http://autobuild.buildroot.net/results/d787487f9b26e9034f22c865c7c2f9034537e7a3 | ORPH
    mips     | libsvgtiny-ea9d99fc8b231c22... | NOK | http://autobuild.buildroot.net/results/28e6a683499bb7924ad848d370a77f271d39ad2e | ORPH
powerpc64le  | libsvgtiny-ea9d99fc8b231c22... | NOK | http://autobuild.buildroot.net/results/10b502699612ff87940df8ad55d52bb42b5e3378 | ORPH
   x86_64    |  libtorrent-rasterbar-1.2.19   | NOK | http://autobuild.buildroot.net/results/3ee7753c2c5522c0075091b1d3c79ed9dffe6f40 |     
   mips64    |         libxml2-2.12.6         | NOK | http://autobuild.buildroot.net/results/d6fa0d3d2d7969b6f9e169ba15198b8f285efe7f |     
   sparc     |        lighttpd-1.4.76         | NOK | http://autobuild.buildroot.net/results/3c31f73c6222f50d0db8e7afb98a049adc2aac86 | ORPH
    i586     |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/7a8165383c2d822b2b12ec0c2629e8f6c05fed18 | ORPH
   nios2     |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/c79e6229aec6f421cc6dc8d248d5db5ecad7b9e1 | ORPH
  powerpc    |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/7aac863546a0385ad6497eb8876cdf21dfc0fc89 | ORPH
    arc      |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/2336b1c4218586242a3fde65dce8c6b026cffc1f | ORPH
   xtensa    |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/a82f89a81570d374e2ffdd49885ce9221ab021bd | ORPH
  mips64el   |          linux-6.9.4           | NOK | http://autobuild.buildroot.net/results/1d6a8f623e64718c1cc2a11aaf4fa6043011cd4c | ORPH
   mipsel    |          linux-6.9.4           | NOK | http://autobuild.buildroot.net/results/8bd7687dd0bffd2cdb8629ec8c1f7d0f53dbba3c | ORPH
  mips64el   |          linux-6.9.4           | NOK | http://autobuild.buildroot.net/results/9bf66f06f4868611ff38a0cf225b8ad5d2bfbba8 | ORPH
  powerpc    |          linux-6.9.4           | NOK | http://autobuild.buildroot.net/results/dee71fbea580be1b98facf5eafec3e57ca164f37 | ORPH
  powerpc    |          linux-6.9.4           | NOK | http://autobuild.buildroot.net/results/c6741b0b1efbc3e745115ee4ce87b52c3db75a9e | ORPH
  sparc64    |          linux-6.9.4           | NOK | http://autobuild.buildroot.net/results/6ef181fd854f12ad0f8c8b73141cf50d9c583e6d | ORPH
    arm      |          linux-6.9.4           | NOK | http://autobuild.buildroot.net/results/33b6e6a13771f4d4b3458703cfacf237e64b743f | ORPH
   sh4aeb    |          linux-6.9.4           | NOK | http://autobuild.buildroot.net/results/0f99128d1463e257828fe012b71e11b0aac30669 | ORPH
   mips64    |          linux-6.9.4           | NOK | http://autobuild.buildroot.net/results/278365ab8d5369e163311d56fb884cebdf8d24ea | ORPH
   mipsel    |          linux-6.9.4           | NOK | http://autobuild.buildroot.net/results/2d584030004c49c9184a91d751b798c380fb2c6f | ORPH
   sh4eb     |          lsuio-0.2.0           | NOK | http://autobuild.buildroot.net/results/f698ef094c3f06ebffc4aef9316e4b2d419c9b1a | ORPH
   x86_64    |     ltp-testsuite-20240524     | NOK | http://autobuild.buildroot.net/results/0fe6db46038a3d0084476f5205e580d6ff8b76d5 |     
   mipsel    |      lttng-libust-2.13.1       | NOK | http://autobuild.buildroot.net/results/014497807c77db87c415f6f4327c060a5848f0c1 |     
    mips     |      mediastreamer-4.4.8       | NOK | http://autobuild.buildroot.net/results/42b619a34b5bc46cdc8b7e9009c1315473a0edbd | ORPH
 aarch64_be  |      mediastreamer-4.4.8       | NOK | http://autobuild.buildroot.net/results/01f4f00fd2c675117c2b713d7ef11bb555f39a5d | ORPH
   x86_64    |          mender-3.4.0          | NOK | http://autobuild.buildroot.net/results/7b5ebb6c2c81cd56c2ff7a2965430ca518c961e6 |     
  aarch64    |          mender-3.4.0          | NOK | http://autobuild.buildroot.net/results/25fd659574efd14874c1ee66de2d81d49a3876e2 |     
    i686     |          mender-3.4.0          | NOK | http://autobuild.buildroot.net/results/e53eeac7f83af22ad5f4763fe448fee1f233cbe2 |     
   mipsel    |        mongrel2-1.13.0         | NOK | http://autobuild.buildroot.net/results/14cf52a2e77ee3005664329103c76457fe991cc9 |     
    i686     |          monit-5.33.0          | NOK | http://autobuild.buildroot.net/results/436ad34af15864411796841994ab7f6f0662bf8f |     
    or1k     |          monit-5.33.0          | NOK | http://autobuild.buildroot.net/results/ca142dac007c6fa38b917f517f7595bb8b53009d |     
 microblaze  |          monit-5.33.0          | NOK | http://autobuild.buildroot.net/results/0635e759901c94c6b376a23036f76a1af9069b74 |     
    mips     |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/dd6523b332a49a4b0632851a2fc92649309a9e97 |     
   armeb     |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/7f39a730af0630126ad3513bc298d79627dfc75c |     
   x86_64    |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/6136037f04657862ccbf463c5a4bd1708cb536e7 |     
   sh4aeb    |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/c3ce87e675cc19b2f2d5076dc6fa3a167f52c128 |     
   sh4eb     |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/e0810d106ac9b4535a45969bf812f75524acb7bb |     
   sparc     |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/30c6578f51f2d6945ec3b7572d7d7d1310eefe2a |     
    arm      |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/d6a239f8ff191aa561626c21c326441896e7a647 |     
   x86_64    |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/7d2e8f99e9128fa0e8157df47549f0077ba7429b |     
    i586     |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/09f9350f66f3b28a7e2b563326760b0406caa816 |     
    m68k     |           mtd-2.2.0            | NOK | http://autobuild.buildroot.net/results/ac647d6d716fd5795b51eeb2dd245bb6eac04dc1 |     
 microblaze  |           mtd-2.2.0            | NOK | http://autobuild.buildroot.net/results/625a23de5c18a4ec176cb3e5a1283a77e3b0d286 |     
   x86_64    |      ncurses-6.4-20230603      | NOK | http://autobuild.buildroot.net/results/7562799e9aebe823816be9fc385c97c8ee258e75 | ORPH
   armeb     |       netstat-nat-1.4.10       | NOK | http://autobuild.buildroot.net/results/fcd1652c8d51c4a76d08aebb97876a554ab4af74 | ORPH
   sparc     |          nginx-1.24.0          | NOK | http://autobuild.buildroot.net/results/c9fda924fdbf6f211b249fe6bc726431aaa257d9 |     
    or1k     |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/33004de50efa1e2ccb6a87230962c1f183f45f9f | ORPH
   arceb     |          ntp-4.2.8p18          | NOK | http://autobuild.buildroot.net/results/495f03a40f2a66b2def467ca9bb242574870920b |     
   sparc     |          ntp-4.2.8p18          | NOK | http://autobuild.buildroot.net/results/0d2e770c1351b00785a3fffb4dacfff2e23a905e |     
   xtensa    |          ntp-4.2.8p18          | NOK | http://autobuild.buildroot.net/results/6e2a9f459ed3b813e3b7955a9b5f0e8041ae8ac7 |     
   sparc     |          ntp-4.2.8p18          | NOK | http://autobuild.buildroot.net/results/ca9905c9c6b2fe729f0eb6a1b66053fcc5325173 |     
powerpc64le  |         openssh-9.8p1          | NOK | http://autobuild.buildroot.net/results/2f5cf48c831c09b24ba6e7cf1fe84ef8764e10c5 | ORPH
   mips64    |         openssh-9.8p1          | NOK | http://autobuild.buildroot.net/results/4b3630ac717722a8eb9cc20a3c5591b4d465dc43 | ORPH
powerpc64le  |         paxtest-0.9.15         | NOK | http://autobuild.buildroot.net/results/e0872337f45d8542d59b2ae9cd7847cfca1f56ab | ORPH
   sh4aeb    |           php-8.3.8            | NOK | http://autobuild.buildroot.net/results/fd3065f2a492588c5a7ef636c87b96264db7318c |     
  sparc64    | pppd-e1266c76d1ad39f98f1167... | NOK | http://autobuild.buildroot.net/results/8eec92f81a78437b9d013dc9e9bcfd1310f561aa |     
  sparc64    |     python-remi-2022.7.27      | NOK | http://autobuild.buildroot.net/results/4f406a54decdb3a1b97adb9e4d8ff0c6e5d37d98 |     
   s390x     | python-unittest-xml-reporti... | NOK | http://autobuild.buildroot.net/results/abdf29bc72b1ec494fa22de2510f877ddb784cea |     
   x86_64    |       rabbitmq-c-0.13.0        | NOK | http://autobuild.buildroot.net/results/d4066c4cd032da144b07324a0ff03208fc3874b7 |     
   armeb     |       rabbitmq-c-0.13.0        | NOK | http://autobuild.buildroot.net/results/99115fe506aebc63d2530fe3f27a97363baade01 |     
    sh4a     |       rabbitmq-c-0.13.0        | NOK | http://autobuild.buildroot.net/results/f3278bfeefc9a60160ced8b59fdfcc2f8c63acba |     
    i686     |       rabbitmq-c-0.13.0        | NOK | http://autobuild.buildroot.net/results/c4dc771fb044534980f663f213f16bb21fca8c15 |     
    mips     |          rauc-1.11.3           | NOK | http://autobuild.buildroot.net/results/24dec4c3418226f9ea6f841c238500c62ff28f52 |     
   x86_64    |          redis-7.2.5           | NOK | http://autobuild.buildroot.net/results/98a5aa443e06cb1cb0e7a89c68f60057ee28cd04 |     
   xtensa    |         s6-dns-2.3.7.1         | NOK | http://autobuild.buildroot.net/results/9b9448085c5d431c3cbb1c41df0795ad1f9150da |     
   nios2     |      sane-backends-1.1.1       | NOK | http://autobuild.buildroot.net/results/b701ab076b2a6e20c20fc7daa7ece5105feeb8ed |     
   nios2     |      sane-backends-1.1.1       | NOK | http://autobuild.buildroot.net/results/b8d6ee5154620ddd3a51c0b717783ff3e0c24084 |     
   armeb     |      sane-backends-1.1.1       | NOK | http://autobuild.buildroot.net/results/26d6e1489960df5c83d30b32ac85fcace62f5290 |     
   armeb     |      sane-backends-1.1.1       | NOK | http://autobuild.buildroot.net/results/e25fd1c11a2e396d173df3b582c26150467a0406 |     
 aarch64_be  |      sane-backends-1.1.1       | NOK | http://autobuild.buildroot.net/results/593f257b6f0a39cb62975bac41fe4a3e91d48fd4 |     
    arm      |      sane-backends-1.1.1       | NOK | http://autobuild.buildroot.net/results/dedb86a09798989c742d3c8fd55c09883815164f |     
powerpc64le  |      shairport-sync-3.3.9      | NOK | http://autobuild.buildroot.net/results/4e914d8d27a6ace45f65d45b245805451e4f921a | ORPH
    or1k     |        skalibs-2.14.1.1        | NOK | http://autobuild.buildroot.net/results/9c616894b62e1b38b817fbfb399e72ec25a81860 |     
   s390x     | squeezelite-71c012ad9ba102f... | NOK | http://autobuild.buildroot.net/results/9bd15a72f5b0c473a88ff910566de85f294786e7 |     
  mips64el   |       stress-ng-0.17.07        | NOK | http://autobuild.buildroot.net/results/6e82ceb10019c6fda01548d8a41063b1b36edf0b |     
   xtensa    |       stress-ng-0.17.07        | NOK | http://autobuild.buildroot.net/results/c38fbd6bc38c4211b6e14c37a07929414fb7933b |     
    i686     |            tar-1.35            | NOK | http://autobuild.buildroot.net/results/b23abcea4fdf310765fedce9135b3d56eb30bca3 | ORPH
    i686     |          trinity-1.9           | NOK | http://autobuild.buildroot.net/results/80bb59e7e843e920ba6b216cdbbaa6a9046ce4cf | ORPH
    arc      |        udpcast-20230924        | NOK | http://autobuild.buildroot.net/results/7e9006b198549c759a6038a2e06dc9ffd3bb3411 | ORPH
   mipsel    |        udpcast-20230924        | NOK | http://autobuild.buildroot.net/results/94754132c54fd8fad0c9a4c3e93bb18ec0a13d65 | ORPH
    arc      |        udpcast-20230924        | NOK | http://autobuild.buildroot.net/results/9fdc16f9067d41a62390214faf7ec6af4b3bf104 | ORPH
   s390x     | uemacs-1cdcf9df881440497501... | NOK | http://autobuild.buildroot.net/results/58c260810ea2f4276ffb2b868ddc1c5d69fc2cc4 | ORPH
   xtensa    |         unbound-1.19.1         | NOK | http://autobuild.buildroot.net/results/71e56eb51715531783344a2581eab59054c80c60 |     
   sh4eb     |         unbound-1.19.1         | NOK | http://autobuild.buildroot.net/results/cc2ec80cf12f515475ae3a6ba6c73221d7af378f |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/c051e110982f6fedc825b56d8b98c8f16f243198 |     
   mips64    |            unknown             | NOK | http://autobuild.buildroot.net/results/f50fcee9b478c777a1bab58fe22f78c5036921ba |     
    sh4      |            unknown             | NOK | http://autobuild.buildroot.net/results/4e1fe8dd2e5982fdc2f39c99f5c3359c34b84ca2 |     
    mips     |            unknown             | NOK | http://autobuild.buildroot.net/results/b60b42983e6ad9cc7bc651c2a68c24f7cf277033 |     
   sparc     |           vtun-3.0.4           | NOK | http://autobuild.buildroot.net/results/358505ffbe5ef6a9ce9d46ed407ff7740d9af8e7 | ORPH
powerpc64le  |           vtun-3.0.4           | NOK | http://autobuild.buildroot.net/results/6417310491bf6cc3f5d565474ca4dd75e0cdb574 | ORPH
    mips     |           vtun-3.0.4           | NOK | http://autobuild.buildroot.net/results/1ed54e047ddfb2c9e84ea5a6fae0c2f9ce2fd379 | ORPH
   sparc     |           vtun-3.0.4           | NOK | http://autobuild.buildroot.net/results/f8c0defe1ff8f117df839aacd3bf4db05cba0857 | ORPH
  powerpc    |            xz-5.6.2            | NOK | http://autobuild.buildroot.net/results/6a4ea1be5a7ac39f37f5917caa06b10acd9959ed | ORPH
    mips     |            xz-5.6.2            | NOK | http://autobuild.buildroot.net/results/14569718485bc0d90eb53955ff66287a7294cdf6 | ORPH
    sh4      |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/54bd6679c5ad284318e088cf17bbc7a1f684ed1c | ORPH
  sparc64    |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/a5187272be225fbfc0f4877449e51698459b9dbb | ORPH
   armeb     |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/0a2a10df5a10b3cbc32394bd04c3225a89141b6b | ORPH
    i586     |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/73a1725f406d12b5edadf7047bfe238e451b3e23 | ORPH
   mipsel    |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/7c94c7014c5ba9714fd56c3672495581f063f74e | ORPH
   sparc     |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/2f1aeb9ad41d0e191b6e8b83e65344cb98ffe1d2 | ORPH
   arceb     |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/cb004d0fbeff7b1c50e3285ec2047c93f5e04907 | ORPH
   s390x     |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/7aa7e254130a18e4d327267ebc85edc5dd3b2123 | ORPH
  mips64el   |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/a7233d17dc5661c96a2cbd620afd059ddf084b93 | ORPH
   mipsel    |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/5461122d1fc7d5454171741aa13458e3b5cf4270 | ORPH
   x86_64    |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/a89e7d76b7952e49727707d8b001922b131dd567 | ORPH
  mips64el   |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/102dd404f3b0b4e3bb122cc36cb93eba6a57051b | ORPH
   s390x     |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/fd44a1cf6cbb14e15e1c3adafff31a0d3184b5ff | ORPH
    sh4      |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/4f1e4a926c590f8ab9e0edf95ceabf36953a7d2f | ORPH
   nios2     |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/6792c537e6493068fb451c041e70b7c7214adf67 | ORPH
   xtensa    |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/17509d381025f929c5211089a550f64cec2d270d | ORPH
    sh4      |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/bb2df6fa4938179e1d4a7e28d0acf6088e04b5c5 | ORPH
powerpc64le  |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/d6ebfee81bf912b0e541b3d18b199567ce7cc53f | ORPH
  mips64el   |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/44b696d347894d1213c1f3201a330bc034ec030a | ORPH
   sparc     |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/5a56cc32e1ba262eb94c0088e43b5fbda04c12af | ORPH
   xtensa    |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/78dd56506fe2f420a2f79cd5321cc481ccad005a | ORPH
powerpc64le  |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/1ef46fd5f0d4f0822462a3a12d8080fda912c435 | ORPH
   sparc     |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/f8ef044b032460f79072830d950af00ce5fc7171 | ORPH
   s390x     |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/f23c7fb907a57324fac865513abd39bf0ef46ee2 | ORPH
    sh4a     |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/71bd48d7a347bd6f3ac2a6c4ad6fde82006bd899 | ORPH
powerpc64le  |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/2d0066b500996cd64021bde6c5ebceb435c8d033 | ORPH
   armeb     |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/24582af20805d7b8a7a60f4ff14b9dc4f3bb623f | ORPH
    or1k     |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/5b6c551b544355aa48c5847e0603159bc2f4481e | ORPH
   sh4aeb    |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/289a2552e62db4ea483f6f41092b68e52d0c8425 | ORPH
    sh4a     |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/8dea339a2439ee52a5a5dc3b0e47494a4d91328d | ORPH
    i486     |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/73a1904692fc0873176b5a550606908c4cfdda7f | ORPH
  powerpc    |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/37c2b78b8bb6d06205908ba128a4836d61bd18ec | ORPH
    sh4a     |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/74ce48530aa6098a24ae6f885f59c8b975361aa2 | ORPH
    i686     |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/a5fe77eefcc2560ed93522920062004525ceda5f | ORPH
 microblaze  |           ympd-1.3.0           | NOK | http://autobuild.buildroot.net/results/42ab76c429af065f143a89ad57b1c5bd5b371798 |     
   mips64    |           ympd-1.3.0           | NOK | http://autobuild.buildroot.net/results/2c9a7b06273846914ac1f3009d9c7c743757ab79 |     
 aarch64_be  |           ympd-1.3.0           | NOK | http://autobuild.buildroot.net/results/5d4195671993dd84193c3044086abff23db0eaa0 |     
  sparc64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/8993c3dd3681f3d3093f345ad5960f3021a2588c |     
  mips64el   |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/0d64d7c6533954b33bbcf7d4929d6f857a9478ff |     
powerpc64le  |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/2de9c4537ebf38d147abff9385b51c758c17ca51 |     
   xtensa    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/ee497759aa636d81cf63f6ef9365f51706ea3703 |     
 microblaze  |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/16c25b3512e346a30b5363784af444fac28649a7 |     
  mips64el   |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/c3f374b281830bd4054062118757367db9efe6f5 |     
   mips64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/429fb0d86790de48ece5e78457f6504afdf16deb |     
   nios2     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/693400e96188f6869a28779d6bd55a61dcac4bc2 |     
 aarch64_be  |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/be2dfa2f650d8b90680e3ac6d4ab186cb31cb048 |     
   arceb     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/8f312250340b50ba556dd549b8ef44775f9f9d12 |     
    i686     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/bcf24d11b711d4de2460b3591b088d67717dcfeb |     
   mipsel    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/3b7a5aae2154a22f8e53bd06bd50d2711fcdc1fd |     
  sparc64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/0df73b12694f046b4caaab94be9acd1f506700ec |     
    sh4a     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/81f1a05643b724f2d262f2469f385e1ae9ced89c |     
   mipsel    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/5e445a52ad9881e1f45bc3162eca15633a85b5e3 |     
    m68k     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/87b66debff91115275dc057be40c600caecef7a8 |     
 aarch64_be  |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/280fd6b0716fd86d96adc78505bb016d97525db6 |     
  sparc64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/2f772c6e8337fef57cc840948621bf5f6d3cefed |     
    arc      |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/a5c8fa5b16a7fb391dc3bf03b01531ced39c46e8 |     
   arceb     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/74bedf71ab083e7da2c386498ae06309236019ab |     
   mips64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/eac374574b83d9ac687722de802564d48998c222 |     
   mips64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/6e0822fcf519de4938979bee479b51fab1517223 |     
   x86_64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/b4c3b35c0836c8420c2bccb4353dfa854b9f682f |     
   nios2     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/cf066e547d80fe16e894b62038cb129771e6c699 |     
  sparc64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/536f4a6a4912ffd8639db4c42bc84ab2cc2d41ec |     
 aarch64_be  |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/147f24910ab2ab7fc1d53862be156a5f15f04cd2 |     
  sparc64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/3028796616325aabfad7b1272d6b838a8906b096 |     
  sparc64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/3f37a451d272ce47d61b661985216622091f080b |     
   mipsel    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/7e772fe53b6345c579700f3fa19edfffea0cc7b8 |     
   mipsel    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/12836d5d4b95f0000cea68e2798a7b1aad008d92 |     
    arm      |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/6abdbc67a5c53f3c1019a71d20685ceed01e04ac |     
    arm      |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/a7ecb8213f50f7eb2b509dbe0181a21cd099079a |     
    mips     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/0a7676da024a926a144b70d1248295907bdb35d8 |     
   mips64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/b0f8621c447c6851a930ca6479a6edab3e827c5c |     
  sparc64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/cf41a1c65575f963d54b3f0096e135d7323ae323 |     
  aarch64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/5cd28eda31793be91e2efd79250764968074dd76 |     
  riscv64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/92f4894e5533eddcc68d7e8b1e4105913f6dfbf8 |     
 aarch64_be  |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/fe567186c69d727ed0cd5f2da036ae6506e44bfe |     
 microblaze  |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/8867cfb1ae76e447b12d880c80703e4ff42243da |     
    arm      |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/4bd009b6ce5f7b0cc680402c9f240e1490f9840c |     
    i686     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/fac392254b1634151a5f61ce282450c706f772d8 |     
    arc      |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/5e00bf8ecf6f73c184a6c76865b84ebc74bc7972 |     
   xtensa    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/b273013a5224253a0f6117297325d0ba289779b8 |     
   sh4eb     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/966ea8cc3d38ded400a54de9b947b5b8352192f2 |     
 microblaze  |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/066d71adf2f692e77092129ade88a63b21f7d03b |     
powerpc64le  |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/13ab840fc472ea35d14821eebe4deb0f8c2d6e73 |     
    i586     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/2213f963ae5df1ca5680925a51854e7208cc5183 |     
    arm      |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/f143db306c3a90d04f0d5a7bd30498fec6128c20 |     
    mips     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/9dd518ad15438a0a07002f4776f1d7924bb9b6eb |     
   mips64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/051b52ce49559ae0e598000a53c87cbc1b2727da |     
 powerpc64   |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/0b2d06056796f04fc92de1adda8dd389aab6c18a |     
   nios2     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/e3d7807a2c49455a784fd54781e049646fdffe21 |     
    mips     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/c27abfeff9edb300f277c6d9bcd67e300c642ec4 |     
  powerpc    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/03b61aca2549721a60254653085a90068d7f0458 |     
  mips64el   |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/7b1f1ed31bc6f368b9da20c6f7aa6a591a452d1f |     
   mips64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/874fc7756d0bdd91865bea95edb291c15d2f79fc |     
  powerpc    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/2929cbbcbde5b193aeda1760800653f31e8c8ad6 |     
microblazeel |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/09abcdfc3b548d9150e2438d21cb42febefa4529 |     
   x86_64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/b8d341f63d00ddbc1ea2b9df791d8da09fcf7b40 |     
microblazeel |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/53ca36fbf1180bde7df411c2d4bd9ce737a7ad08 |     
    or1k     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/ebc9fe69d335bf63e0a7f3696a0f7472f1e4c751 |     
   mipsel    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/f083b53c62d3003480da9fc4096aed60ca8f9b19 |     
   mipsel    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/a3d39433e17499757f6e186afc5401045d312820 |     
   mipsel    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/6d0c24a863a18efb5867cee6f8b2c4f03a0d2034 |     
  aarch64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/a46986251ab7559babc56b3bf4d9bd74336f6c67 |     
 powerpc64   |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/214af53fe3c99b134cd9af0cc42a7a7398f9ad3c |     
   mipsel    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/3e35d6a8dc198babb5935603c55532e2316439d9 |     
powerpc64le  |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/172cbf8ff6281ad45dcc4bdd28a2bf96b99d5ca3 |     
   x86_64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/3a2a37dbcb549849505de6280e7852febeb34aaf |     
    arm      |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/8a1b4a1e23fceb101adcd92c530d0b3304d65484 |     
   s390x     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/ed1d1a8c8879812064efba6b4e01787ec8820cde |     
   mips64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/f6cb15d2a7d90a1a45a2521284cc482e3c5643ef |     
 aarch64_be  |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/e4076a6ebb67b7bf1f62ba564061b48560c9d46b |     
    arm      |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/204f60ba0f7b668c01a0302e54da407ea54d7032 |     
  mips64el   |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/417f6729a7dd3545c6d2b61773c1bb1073ab46fd |     
   arceb     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/f372777e4e2590e01d13cfd647c1b52c73045b58 |     
 powerpc64   |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/d4bcc343a8451c5eef5b528614433aa488ecfa68 |     
   nios2     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/229e6dcc3c3ed7bc39aec95687a49e867413fc3c |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

                  linux-6.6.33 | 1 
                 openal-1.22.0 | 1 
pistache-3ec9d7c4f8b828fdd3... | 1 
          python-grpcio-1.60.0 | 1 
                       unknown | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sh4aeb    |          linux-6.6.33          | NOK | http://autobuild.buildroot.net/results/f47f0fd83830da14a9ceff4a2b0e578ca74b4f66 | ORPH
    mips     |         openal-1.22.0          | NOK | http://autobuild.buildroot.net/results/9359c00761909ce562ddfed2a6d5617099764782 | ORPH
    arm      | pistache-3ec9d7c4f8b828fdd3... | NOK | http://autobuild.buildroot.net/results/0cb128161e7fba964456d0412f92c9893a0f6aa2 | ORPH
    i686     |      python-grpcio-1.60.0      | NOK | http://autobuild.buildroot.net/results/71746cf5f082890836f431bebe6a7d57876eff0d |     
 aarch64_be  |            unknown             | NOK | http://autobuild.buildroot.net/results/d59f336f7ada90549a2d600b66fe806942593f2f |     


Classification of failures by reason for 2024.05.x
--------------------------------------------------

check-11970a7e112dfe243a2e6... | 1 
                fail2ban-1.0.2 | 1 
                  ffmpeg-6.1.1 | 1 
                flannel-0.25.2 | 1 
                  linux-6.8.12 | 1 
                    proj-9.3.0 | 1 


Detail of failures for 2024.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/1509108aa111da706d544eb67e1ae2c2b34bd4e4 | ORPH
  sparc64    |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/7ec085592b0080701b3714447ea07304465da207 |     
    arc      |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/6644b1e697874190a8ff8ee84dc1599b3d2ba334 |     
  riscv64    |         flannel-0.25.2         | NOK | http://autobuild.buildroot.net/results/5fa1dd514d1673320576b390729e1cb94f12eb2c |     
    i686     |          linux-6.8.12          | NOK | http://autobuild.buildroot.net/results/45c521f54ae4db9257f3a1539f9703e60dd18c54 | ORPH
  sparc64    |           proj-9.3.0           | NOK | http://autobuild.buildroot.net/results/d7d6819dc947932b326e09ca07458e748101f076 |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
