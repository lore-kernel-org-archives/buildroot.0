Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC295C27C6E
	for <buildroot@archiver.kernel.org>; Sun, 16 Jun 2024 04:51:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1211482B3E;
	Sun, 16 Jun 2024 04:51:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OxdBlSmZsYfA; Sun, 16 Jun 2024 04:51:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8FC3782A87
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8FC3782A87;
	Sun, 16 Jun 2024 04:51:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B26771BF308
 for <buildroot@lists.busybox.net>; Sun, 16 Jun 2024 04:51:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 96B3460659
 for <buildroot@lists.busybox.net>; Sun, 16 Jun 2024 04:51:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GsQlwW4sDPF8 for <buildroot@lists.busybox.net>;
 Sun, 16 Jun 2024 04:51:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::224;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 09BC760625
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 09BC760625
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 09BC760625
 for <buildroot@buildroot.org>; Sun, 16 Jun 2024 04:51:21 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B5A50E0008
 for <buildroot@buildroot.org>; Sun, 16 Jun 2024 04:51:18 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sun, 16 Jun 2024 04:51:18 -0000
X-GND-Sasl: bot@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1718513478; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=GnOOAkI8fML+hMfFSDnnw8EWHxCHefgipHmTzCpxym4=;
 b=dffr2naXS5UYZt2aKyaxaEd/TzmrvC5AJ9EOOUHJkuqI+Ph9jgcT726Oo1GMPD4p2N6mhq
 COw6UPEUs41eEG+I5TT5AcLaCbHr/E4YtXKrNhzgrHUNoqft0v3fnllTgIfVnIRHlRVVlB
 0AU9fpSAIaTUiOYNrtnOTXYn7z8xzCk92ALT2MyVhtYWas0fmMR1N38WPOc6A/OM6yWeqx
 gJ/3a14ecXmcfgZo6SAybyxsQ1ltUAefqvEdpAVz/09xM+FdU0cZVbg8r1EU/rdX+jG6U+
 4sS1MWGgRAxLvN1atI1MKmvMjZdUjOMfGQIsY10E77NoOb+3Rf8ndCjGTJ3c7A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=dffr2naX
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2024-06-15
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
Message-ID: <20240616045118.CnIo4eGvxVad-qyqX8-mqlaa1VINEWUHMUytgMZAcG4@z>

Hello,

Autobuild statistics for 2024-06-15
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  8  |  8  |  0  | 16  |
  2024.05.x  |  7  |  8  |  0  | 15  |
    master   | 166 | 462 |  0  | 628 |

Classification of failures by reason for master
-----------------------------------------------

host-prelink-cross-a853a5d7... | 65
            host-cdrkit-1.1.11 | 33
                libressl-3.8.4 | 23
                    mpir-3.0.0 | 23
              execline-2.9.5.1 | 21
                host-odb-2.4.0 | 18
ibm-sw-tpm2-5452af422edeff7... | 16
                   host-go-src | 11
aer-inject-9bd5e2c7886fca72... | 8 
                elfutils-0.189 | 8 
                  ffmpeg-6.1.1 | 8 
host-heimdal-f4faaeaba371ff... | 8 
host-vboot-utils-bbdd62f9b0... | 8 
                       unknown | 8 
                  bcusdk-0.0.5 | 7 
                fail2ban-1.0.2 | 7 
glibc-2.39-5-ge0910f1d3278f... | 7 
         python-remi-2022.7.27 | 7 
android-tools-4.2.2+git2013... | 6 
check-11970a7e112dfe243a2e6... | 5 
                 coreutils-9.3 | 5 
host-android-tools-4.2.2+gi... | 5 
      host-riscv-isa-sim-1.1.0 | 5 
                  linux-6.8.12 | 5 
                gnu-efi-3.0.18 | 4 
         host-libxcrypt-4.4.36 | 4 
                  libffi-3.4.6 | 4 
                 openssh-9.7p1 | 4 
                 uclibc-1.0.48 | 4 
                 apache-2.4.59 | 3 
                 dc3dd-7.2.641 | 3 
                 gnuplot-6.0.0 | 3 
               ipmitool-1_8_19 | 3 
              libarchive-3.7.4 | 3 
               libglib2-2.76.1 | 3 
              libopenssl-3.3.1 | 3 
                    rtty-8.1.0 | 3 
                apr-util-1.6.3 | 2 
                   bzip2-1.0.8 | 2 
                 c-icap-0.5.10 | 2 
               collectd-5.12.0 | 2 
                     crun-1.12 | 2 
                   dhrystone-2 | 2 
                    fcft-3.1.6 | 2 
                     frr-8.5.4 | 2 
            gdk-pixbuf-2.42.10 | 2 
        host-sentry-cli-2.20.3 | 2 
 host-softether-4.30-9700-beta | 2 
                  libsepol-3.6 | 2 
                    links-2.29 | 2 
          linux-5.10.162-cip24 | 2 
                   linux-6.9.4 | 2 
                   linux-tools | 2 
                     mtd-2.2.0 | 2 
                     php-8.3.7 | 2 
                python3-3.11.8 | 2 
             sofia-sip-1.13.17 | 2 
               alsa-lib-1.2.11 | 1 
          alsa-plugins-1.2.7.1 | 1 
                     apr-1.7.2 | 1 
                 avro-c-1.11.3 | 1 
     bandwidthd-2.0.1-auto-r11 | 1 
                    bat-0.24.0 | 1 
                   bird-2.0.12 | 1 
                  bitcoin-26.0 | 1 
brcm-patchram-plus-95b7b691... | 1 
                   ccrypt-1.11 | 1 
                 cdrkit-1.1.11 | 1 
             dahdi-linux-3.3.0 | 1 
dawgdic-16ac537ba9883ff01b6... | 1 
             docker-cli-26.0.2 | 1 
        edk2-edk2-stable202308 | 1 
                 erlang-26.0.2 | 1 
                    eza-0.18.8 | 1 
                   foot-1.16.2 | 1 
                     fping-5.1 | 1 
       freeradius-server-3.2.3 | 1 
fs/jffs2/jffs2.mk:71: /home... | 1 
              gcc-final-13.3.0 | 1 
           ghostscript-10.02.1 | 1 
       gst1-plugins-bad-1.22.9 | 1 
                host-go-1.22.4 | 1 
              host-rust-1.74.1 | 1 
                    htop-3.3.0 | 1 
              hyperfine-1.18.0 | 1 
kvmtool-4d2c017f41533b0e51e... | 1 
          libcamera-apps-1.2.1 | 1 
                 libcli-1.10.7 | 1 
libdbi-drivers-0bfae6c43134... | 1 
                 libgee-0.20.6 | 1 
                 libp11-0.4.12 | 1 
                librsvg-2.50.9 | 1 
               libunwind-1.8.1 | 1 
     linux-5.10.162-cip24-rt10 | 1 
ltrace-82c66409c7a93ca6ad2e... | 1 
         lttng-modules-2.13.10 | 1 
               mariadb-10.11.6 | 1 
           mediastreamer-4.4.8 | 1 
          moby-buildkit-0.11.6 | 1 
                    ncmpc-0.49 | 1 
                     nut-2.8.2 | 1 
pistache-3ec9d7c4f8b828fdd3... | 1 
                 pixman-0.42.2 | 1 
pppd-e1266c76d1ad39f98f1167... | 1 
               pulseaudio-17.0 | 1 
          python-grpcio-1.60.0 | 1 
                s6-dns-2.3.7.1 | 1 
    start-stop-daemon-1.20.7.1 | 1 
             stress-ng-0.17.07 | 1 
             strongswan-5.9.13 | 1 
                 tbb-2021.11.0 | 1 
              tinyssh-20240101 | 1 
                tpm2-tss-3.2.2 | 1 
                   trinity-1.9 | 1 
             util-linux-2.39.3 | 1 
                 wolfssl-5.7.0 | 1 
                    zeek-4.1.1 | 1 
                       zsh-5.9 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/e39f5edbf753ad0c2dfbbfce4ed9311531114cbf | ORPH
  aarch64    | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/abebb4f800667fd5dca8aca443c14367ba49af1b | ORPH
  aarch64    | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/b1d9bad773475b913aa0077bd95d2e6f7add55c9 | ORPH
   armeb     | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/2db23f11bed458d4162d1e28f51ca6e52ccb0842 | ORPH
    mips     | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/d5623724a8d5af0f24f787f57c7e2d7ac6f34df1 | ORPH
  mips64el   | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/0d16e98dbc4b70afab30a983914635296394d486 | ORPH
   x86_64    | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/a7e779c18f696338cc4ea870e9d986fa1b3b2aad | ORPH
    mips     | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/40802ad949f9febb593ffda5f21e5063f3c50025 | ORPH
powerpc64le  |        alsa-lib-1.2.11         | NOK | http://autobuild.buildroot.net/results/2de20a1acd90b1c5e8d78d5d9f6e4ba350a86be2 |     
   sh4aeb    |      alsa-plugins-1.2.7.1      | NOK | http://autobuild.buildroot.net/results/3d6c6a242f2a6bcfaebb3236f40d5c639201b34f |     
 aarch64_be  | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/82fd0452a04803302dea2256659210141ea4582b |     
  sparc64    | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/4ebdf52de3259a55f93366fd8a7654596e9ff0b8 |     
   sh4aeb    | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/2049586de05ccffbd2b72c90d0fa8983ab2556d6 |     
  sparc64    | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/02e251e5552427e6435027bfe2debf10c71ef608 |     
   mips64    | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/6da97f1469ea2e903fd615b77ca8065f038266b4 |     
   arceb     | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/7b2bf18c9660099d150fbd530bafaa64af8deb23 |     
   mips64    |         apache-2.4.59          | NOK | http://autobuild.buildroot.net/results/e48b3637592f5d283b7ca332aa214642103de2db |     
 powerpc64   |         apache-2.4.59          | NOK | http://autobuild.buildroot.net/results/640a90fb5d6293fe561e57bdf97d3c3bac7af90f |     
   armeb     |         apache-2.4.59          | NOK | http://autobuild.buildroot.net/results/9ac3385644eee45fc93dfb06189c2731406a7581 |     
  riscv64    |           apr-1.7.2            | NOK | http://autobuild.buildroot.net/results/b4707087ab2a346538e373532f881fa692d377bd |     
   sh4aeb    |         apr-util-1.6.3         | NOK | http://autobuild.buildroot.net/results/387fe332ce13926d6f7ce9a03b8cff7eb7055419 |     
 powerpc64   |         apr-util-1.6.3         | NOK | http://autobuild.buildroot.net/results/2254f7cea6b5175f1500c1e03295874c7dd77a59 |     
   mipsel    |         avro-c-1.11.3          | NOK | http://autobuild.buildroot.net/results/fdbc6a888ba8bb51f4e076a450919477d1378eb3 |     
  mips64el   |   bandwidthd-2.0.1-auto-r11    | NOK | http://autobuild.buildroot.net/results/31cd8e73f358483bb59fba2c4eb5d508650eaba1 |     
  aarch64    |           bat-0.24.0           | NOK | http://autobuild.buildroot.net/results/baea7b45707eef69f3459923a6a57b0bda8aa2b1 |     
   sh4aeb    |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/bbdbf3c3983a4f40abd436b09c0bf7f61a4dc5d7 |     
   nios2     |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/e9728490ea9d20da8e9467cd05d483fcd57f6d3f |     
    or1k     |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/605e48080705afa495ae0547205a19729b2e60f5 |     
   arceb     |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/0a2e5f2b5eae945b2ff0765807569d74f9198c49 |     
   arceb     |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/3b0600a093205e97fd236ebe3b55fd96933b6083 |     
  sparc64    |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/d6c07635c150a7633c8341587a592a553305b5ca |     
  aarch64    |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/7c9818eab13f21a32f9389eddfd8929802093306 |     
    mips     |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/902546d062b2794087c058f20228919c802f398b |     
    m68k     |          bitcoin-26.0          | NOK | http://autobuild.buildroot.net/results/7853ca829e2c3fb375ecdbecf33d634311655d08 |     
   s390x     | brcm-patchram-plus-95b7b691... | NOK | http://autobuild.buildroot.net/results/68603f0b02c214c39557bb333797ab3db12abb9a |     
  riscv32    |          bzip2-1.0.8           | NOK | http://autobuild.buildroot.net/results/89f6e30ccbb92c3fc7efb890ede66465e0edfea4 | ORPH
  riscv32    |          bzip2-1.0.8           | NOK | http://autobuild.buildroot.net/results/e4a983b1d151264d5acc25456e62b6a186a075a0 | ORPH
    i686     |         c-icap-0.5.10          | NOK | http://autobuild.buildroot.net/results/4c1f585b4a465f521d3e9437a0de0f32db4bcc5d | ORPH
    arc      |         c-icap-0.5.10          | NOK | http://autobuild.buildroot.net/results/8074c2ca6585487ec1db3c16c3f5308178b9a200 | ORPH
  riscv32    |          ccrypt-1.11           | NOK | http://autobuild.buildroot.net/results/2703d8d7bf8c92c0f38867c39080645e78259b20 | ORPH
  sparc64    |         cdrkit-1.1.11          | NOK | http://autobuild.buildroot.net/results/4b0e3df0f916a53d6b21183a74470aac6b2c9390 |     
  riscv64    | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/eda1806dc8a4a9c915118c12ae114fe5b5c2e8d6 | ORPH
   armeb     | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/dc29cac74690cc8a06a2413f23a63d3fe4c7ad0b | ORPH
  riscv64    | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/d501dcb4005a1719f3f9f81cc25f12a427ea2e98 | ORPH
    mips     | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/98cff507d1c1fb6938d1b4c2fadb316c373e41bf | ORPH
  riscv64    | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/53609003a7164ca8d5d3b3bac63f54ecf7ed3cc0 | ORPH
   x86_64    |        collectd-5.12.0         | NOK | http://autobuild.buildroot.net/results/2058f87ad7dbf7fbc62c8747855c82da4157ea35 |     
    arc      |        collectd-5.12.0         | NOK | http://autobuild.buildroot.net/results/05c66b6d195909ad02223de1f7d609cca0f92eba |     
   sparc     |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/d6989de814c77b45ca972d94c4820ab710f756bb | ORPH
    sh4      |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/1c31d2cb3105d4a0dc2ae5eaee9bbf94e44e2dd0 | ORPH
    sh4a     |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/63c6706e9708c07b5918f39b8c441a1a3f9df3d5 | ORPH
   mipsel    |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/b40fb0905d794a046ad9dea6ea599b75a360e03b | ORPH
    sh4      |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/02fa21d669ef76e182dabd670a37c96b4e090ebc | ORPH
   s390x     |           crun-1.12            | NOK | http://autobuild.buildroot.net/results/deb7a72c4d8540b1ed4645e445cf9067f79c400c |     
microblazeel |           crun-1.12            | NOK | http://autobuild.buildroot.net/results/504954dff174f88a7e5196d264570590956a33e8 |     
   s390x     |       dahdi-linux-3.3.0        | NOK | http://autobuild.buildroot.net/results/e83262f5fd4e04bb68f255686c7655f2843b2c2a |     
  riscv64    | dawgdic-16ac537ba9883ff01b6... | NOK | http://autobuild.buildroot.net/results/51b318fbbe30f41900f9b493bdd64c15fb8ca696 |     
    or1k     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/7f37101a859378eb46ab9865bdf6df09ea56cd08 | ORPH
    or1k     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/0f4f7c2d7e521a206cb06c02fd9892e2eaacd57f | ORPH
   sh4eb     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/b5eb2f27eae1127e9e5fa85a9513e973d34cf506 | ORPH
 powerpc64   |          dhrystone-2           | NOK | http://autobuild.buildroot.net/results/40a3ea2a60c715a6392d40ad868257ae99fdcf34 | ORPH
    i686     |          dhrystone-2           | NOK | http://autobuild.buildroot.net/results/1222c34e8fefc917e8ce6d7ebf7a470b5a74ea67 | ORPH
    i686     |       docker-cli-26.0.2        | NOK | http://autobuild.buildroot.net/results/3407f42e75a3484232e96f62651b9642fb754e0e |     
    i686     |     edk2-edk2-stable202308     | NOK | http://autobuild.buildroot.net/results/edda74ff98dccb3c512e696aa7572047988263ab |     
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/407c44177099129c591a298ec36fc4f8ab7d6450 | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/5a9b2a9f242fe47351b8922cbee4383760df2cd4 | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/934e396b74afb54183e781bb9ce937e5cbbd7160 | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/71ab42d9083badb490f9d5aeeda2201f064f6a64 | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/e8e512bb0b0dca8ed99c92fb802c4e881ce957e9 | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/3aec1080917b28f656c8d003cbf52316f72b9b41 | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/f82333090d8e0cb50ac247a8df131a321462f68d | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/33138b80eab7f0b1eb5925e0db309cab73136f2c | ORPH
   mipsel    |         erlang-26.0.2          | NOK | http://autobuild.buildroot.net/results/ff48df09307985a99e1ad3e619d1b6fc6ad6deaa |     
    m68k     |        execline-2.9.5.1        | NOK | http://autobuild.buildroot.net/results/ceeee155fdf3103866d83c825a8416cb7fe6ae50 |     
   sparc     |        execline-2.9.5.1        | NOK | http://autobuild.buildroot.net/results/087676a6ca29c5d649e4765eb4dc531fb5341091 |     
   xtensa    |        execline-2.9.5.1        | NOK | http://autobuild.buildroot.net/results/907c2ffd76babee72122e164bb5d40d754a0a196 |     
   xtensa    |        execline-2.9.5.1        | NOK | http://autobuild.buildroot.net/results/3db4cc90cdcec7fad52f96bfd106878bb589f724 |     
  mips64el   |        execline-2.9.5.1        | NOK | http://autobuild.buildroot.net/results/d18667de29b621d03939636a449e9dd95adba05e |     
   xtensa    |        execline-2.9.5.1        | NOK | http://autobuild.buildroot.net/results/64bf2928f36e07332052854cbaaa7a6f8f347e29 |     
 microblaze  |        execline-2.9.5.1        | NOK | http://autobuild.buildroot.net/results/c2833913c9cb1d9dc5a6d1ee89d107c6077baf3a |     
   xtensa    |        execline-2.9.5.1        | NOK | http://autobuild.buildroot.net/results/7a823a8e1b2ecb4c3a76b7318457243882c89d84 |     
   sparc     |        execline-2.9.5.1        | NOK | http://autobuild.buildroot.net/results/87ba16043b4e56f17976bab711f94f7411744219 |     
  mips64el   |        execline-2.9.5.1        | NOK | http://autobuild.buildroot.net/results/335d3ddb696f48f5944f8fc5a73182212710651d |     
   xtensa    |        execline-2.9.5.1        | NOK | http://autobuild.buildroot.net/results/3329a2fd29f37e388848a68ab0266b1a5de4e246 |     
    arm      |        execline-2.9.5.1        | NOK | http://autobuild.buildroot.net/results/dbd717ee1eefa9361551995e016fc553c85028da |     
    arm      |        execline-2.9.5.1        | NOK | http://autobuild.buildroot.net/results/7f4139aabcbf3f0e6dae3d6cd625007636918869 |     
   armeb     |        execline-2.9.5.1        | NOK | http://autobuild.buildroot.net/results/0a0ae435b81383d5dd71111c72af34b359355729 |     
   xtensa    |        execline-2.9.5.1        | NOK | http://autobuild.buildroot.net/results/cbd6af9e7ac23199ae1f964a8f7e587cda148613 |     
    arm      |        execline-2.9.5.1        | NOK | http://autobuild.buildroot.net/results/36122600ab6b3cebd471c9da97203e98b2fa5c4d |     
 microblaze  |        execline-2.9.5.1        | NOK | http://autobuild.buildroot.net/results/9ab2345804962109069eee1d7243cb3907df970b |     
   mipsel    |        execline-2.9.5.1        | NOK | http://autobuild.buildroot.net/results/ef68a69382b0d4b5f0ac8c85380e3776c60eea68 |     
    m68k     |        execline-2.9.5.1        | NOK | http://autobuild.buildroot.net/results/64f54dfde0d7c5316c15d62f203663e88d842031 |     
    arm      |        execline-2.9.5.1        | NOK | http://autobuild.buildroot.net/results/addf0be6278c6e57522490056a189c25659fe992 |     
   xtensa    |        execline-2.9.5.1        | NOK | http://autobuild.buildroot.net/results/a4960c30570352f914d47fbfd00f6b155d1ab7e1 |     
   armeb     |           eza-0.18.8           | NOK | http://autobuild.buildroot.net/results/c30229ef0eaa117ef04c8350b1405d5330ba9e94 |     
   s390x     |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/049822e81bae7e2bef7cdb4df44bc4fed350bf37 |     
   x86_64    |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/6c324cec606cecceb69e204c849178bfcba99488 |     
 aarch64_be  |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/da0f90df1591f933e166a98786a85cb8d181b5d5 |     
    or1k     |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/92d24b61e6542c34bfd0318d74f3f437957fd2ec |     
 aarch64_be  |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/2666e61a003db1d43bb8adba2bf3aa50bb562d00 |     
   armeb     |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/754257f642a1fc7dc644b696be0ebb40567a808f |     
   armeb     |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/ffc0445b7ff7ced2f48a79e7207f52a8485a9066 |     
 aarch64_be  |           fcft-3.1.6           | NOK | http://autobuild.buildroot.net/results/cf2e816d642c40b0e366f62e21d9dffbbf0f136d |     
    mips     |           fcft-3.1.6           | NOK | http://autobuild.buildroot.net/results/5aef396a27d1dd572badeb79a70f3d9a12bbf6ce |     
microblazeel |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/903516747b6a2d79e76a48e6b5331bad5536804f |     
   arceb     |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/5755ed1218451cdf4bad84e29110bdd4ec769d6d |     
 microblaze  |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/5af92ac7471dffbe15e9a3f21024a297b66485e2 |     
microblazeel |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/94fed0b8f0346f20f2bb4e95a1d52d1ab8f1196f |     
   arceb     |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/7bc524574590ba033c209c2242b0369959b41baa |     
    arc      |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/9efc766347ff5f5959641b0375515734f0776eae |     
 microblaze  |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/bd11fc3aba5aebf51b02ced9ab73e741dfca6a18 |     
microblazeel |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/7464f5c6df6ed229024fb9956fa06de22c9875b4 |     
    arm      |          foot-1.16.2           | NOK | http://autobuild.buildroot.net/results/23e88fab90f24bdf8a05215a60c142d676c45039 |     
 aarch64_be  |           fping-5.1            | NOK | http://autobuild.buildroot.net/results/89ce030a03b493929711375752dc343121e84c59 |     
   mipsel    |    freeradius-server-3.2.3     | NOK | http://autobuild.buildroot.net/results/1d64959dd0bae0dee13df85efe2f90d6a10b6280 |     
   xtensa    |           frr-8.5.4            | NOK | http://autobuild.buildroot.net/results/9aeb00b3d588248929373cb4e97f44d75767dbc1 |     
 aarch64_be  |           frr-8.5.4            | NOK | http://autobuild.buildroot.net/results/de40e6df3f160a55306f85338f656e541df31312 |     
   sparc     | fs/jffs2/jffs2.mk:71: /home... | NOK | http://autobuild.buildroot.net/results/c8657be018206b8fe28fafc037dea396c9650f19 |     
  powerpc    |        gcc-final-13.3.0        | NOK | http://autobuild.buildroot.net/results/4ea76c60ddc5e24b0c0fb43474e9d86176c28e43 |     
   armeb     |       gdk-pixbuf-2.42.10       | NOK | http://autobuild.buildroot.net/results/d9e3c097a6f5f782528bd3a8324a0037e2ecf854 | ORPH
 microblaze  |       gdk-pixbuf-2.42.10       | NOK | http://autobuild.buildroot.net/results/c7ff2bbec856d4fc56c2ad3c3dd13e6d60167ee4 | ORPH
   x86_64    |      ghostscript-10.02.1       | NOK | http://autobuild.buildroot.net/results/51732a7c05e92f59b89bd28512b9ac835640338d |     
powerpc64le  | glibc-2.39-5-ge0910f1d3278f... | NOK | http://autobuild.buildroot.net/results/ba7b2991c5844d38e3c8a9ae0b509649e26e7369 |     
  powerpc    | glibc-2.39-5-ge0910f1d3278f... | NOK | http://autobuild.buildroot.net/results/fea77a66e800f7ab705544c5ecf0b5c2282c97ac |     
powerpc64le  | glibc-2.39-5-ge0910f1d3278f... | NOK | http://autobuild.buildroot.net/results/145b0b4516353fe160362e94116b51968bcb7268 |     
    arc      | glibc-2.39-5-ge0910f1d3278f... | NOK | http://autobuild.buildroot.net/results/87e9b4e2d967a4742512f4e16b349e2055c9ee30 |     
  powerpc    | glibc-2.39-5-ge0910f1d3278f... | NOK | http://autobuild.buildroot.net/results/259abe5e203f66a363906dd7521748f4570a0e13 |     
 powerpc64   | glibc-2.39-5-ge0910f1d3278f... | NOK | http://autobuild.buildroot.net/results/bbdaa9c05e9e992947c5d2898042b17fa317821f |     
powerpc64le  | glibc-2.39-5-ge0910f1d3278f... | NOK | http://autobuild.buildroot.net/results/24937f9148c8e742b2c6bd7e1a8a4f45c2c9a4c5 |     
 aarch64_be  |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/73994c33feb9f89169af7668e170432e94fc25bc |     
 aarch64_be  |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/365d99179f614687c998e2c434a1481f8cf61385 |     
 aarch64_be  |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/d2893502ed96df55976823519926a4a72371a5bb |     
   armeb     |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/6b95ecc4f6a1f3de500b44a11bdc967919cecf1b |     
   mipsel    |         gnuplot-6.0.0          | NOK | http://autobuild.buildroot.net/results/742274d6d232aeab79cdc0ae7f72a967637ee921 |     
microblazeel |         gnuplot-6.0.0          | NOK | http://autobuild.buildroot.net/results/f3abe0bc666f05b0f0f97339d01be6a64dec5ff8 |     
    or1k     |         gnuplot-6.0.0          | NOK | http://autobuild.buildroot.net/results/1d9a8810ff6f4f6b6e66e6a112cbd8aa56ad37dc |     
    arm      |    gst1-plugins-bad-1.22.9     | NOK | http://autobuild.buildroot.net/results/7079df166208fd7beb3fdaf408dee1ccb66301e1 | ORPH
    arc      | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/f5ca529853afc8e5f4e8b82960fab5a9714903a6 |     
microblazeel | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/ea9199fce0d25f4ddaa14b2e0c66e77589de2ab0 |     
   arceb     | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/5abbaf638bfcb447c58fbae2f3a29183ffd16664 |     
   x86_64    | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/d8746bf1fa1f0cbca8a9afee2fbe790b59ade3f5 |     
   mipsel    | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/7b31f19fda21bde342e51895a7d3a1e311400d36 |     
   arceb     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/1732da35ce8d549d2fbd6888f2547a5c851feeae |     
microblazeel |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/3bee68d5ca9066c5fe0977075260e2bf8d971309 |     
powerpc64le  |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/6b23b70f5243ee8557cfab6fc4607569a4bbca14 |     
  riscv64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/6430e3542afc235761762e2d69a90fdb89fa83c2 |     
  mips64el   |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/704860b251e60f27dd2c8470a5f2fb184a2f6af2 |     
  mips64el   |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/9cfdbc9cdf32ecaacee8f196b94d16f7468fe386 |     
    i686     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/a8c69e7a19cf3ef7dde7bae9b2d9d30e35f48d37 |     
   arceb     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/e9a4c939cb7b793d58a4fbc3a1fa2aeed588025d |     
    mips     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/4de43945f16dd9d85b5f91ac8f27aaadce5a4093 |     
  mips64el   |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/80b7f2ab3bcf6cc61786b4997b47bb8b6c490715 |     
   s390x     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/29e97c858b57e8d25990c78f09cbbc774456a3fb |     
    m68k     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/783fb05a8d62b673dc983f5049986028a9009315 |     
   sparc     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/d175a5d2a3e6d43f3d2fbb684f5584f1b9451c52 |     
   xtensa    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/99f44ee62c7903975c16ef2ba34ea75c65a763ed |     
   sparc     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/0184d76cd79e8298f40721763e4f9931942e19f3 |     
  powerpc    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/0afa4425ee35346596788029635dfe812653ba37 |     
   armeb     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/48eab36f828d46734bb27eb51a6d5a863cefa3f5 |     
   mipsel    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/be5060fac1994740b75727d79c9c11e044d3e0ba |     
   arceb     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/bf6fdc7af373d425cdad557d76cf5c6b58fcd5d4 |     
    or1k     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/3aa94cf49d9c27625e7bd22c2696d609b7c831ea |     
   x86_64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/bed62cd03204a4a6e4335f13417e24fce04e562c |     
    or1k     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/9b3d87a6da75ce85157ddeabffaa14192aed280f |     
    m68k     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/867950ded408912d367b1b73f2fa33e5e1e31020 |     
microblazeel |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/94189fc00f956aa1c5914a63f08239ba6c1ff0d6 |     
   xtensa    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/da7447b5a166d28791f4611cab10785de4215593 |     
   arceb     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/ebd8aa0e8be46df6cac950d454889b8f165b5272 |     
 powerpc64   |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/182feb121acb7929ed860d129b0ec584206402ef |     
 aarch64_be  |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/4544259cb7d8197dcede272446e66c3db14cb1e8 |     
  sparc64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/87108cd090c04c53d5ee7c975d40b2ee26a07441 |     
   mipsel    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/1561c7f067c848d049624bc454a3849fb2acce6f |     
    arm      |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/4fd1b4c9a642e5ef77394257d57dddd1bc991425 |     
 aarch64_be  |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/5e399caa41706b8c0ab0fd59e5db33c845e5d3a5 |     
    m68k     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/b3be93f9c3f02c6bcb7690c37c244f150538d1c6 |     
    i686     |         host-go-1.22.4         | NOK | http://autobuild.buildroot.net/results/60033b902169855c59289362c6a5acf60e3f716c |     
   mips64    |          host-go-src           | NOK | http://autobuild.buildroot.net/results/8ee18be9ecdd791063ae4181cabcc96c3169a3dc |     
   mips64    |          host-go-src           | NOK | http://autobuild.buildroot.net/results/4adcabea180e7cd603e2e98ee8f0d73815a35572 |     
  aarch64    |          host-go-src           | NOK | http://autobuild.buildroot.net/results/19b6533c61147143f20a39dc34b26ed9bcb85e58 |     
   mips64    |          host-go-src           | NOK | http://autobuild.buildroot.net/results/8113d267bb6643be51e035bfb60f802a2ce3f4e4 |     
  aarch64    |          host-go-src           | NOK | http://autobuild.buildroot.net/results/178ff9fc93b7a211588377af581d0ca49c3e514e |     
   x86_64    |          host-go-src           | NOK | http://autobuild.buildroot.net/results/dceeb2918408ba32632f6829cc6f4a9d658aca68 |     
  mips64el   |          host-go-src           | NOK | http://autobuild.buildroot.net/results/b6aee29ce4f9a36ddecec16dc1660e5a4b8f0b21 |     
  mips64el   |          host-go-src           | NOK | http://autobuild.buildroot.net/results/3975176178bbde721a6855190453940d1f30facf |     
    arm      |          host-go-src           | NOK | http://autobuild.buildroot.net/results/1ea8341750381ce2a448f2996291d3fe89f71b47 |     
    arm      |          host-go-src           | NOK | http://autobuild.buildroot.net/results/1ae18f84c330031e97e7cefc03fb2652124c46e0 |     
  riscv64    |          host-go-src           | NOK | http://autobuild.buildroot.net/results/54521e53c4bf3feddfa73ba8be69c09d6b6a7c0f |     
    or1k     | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/4612b9187e5bef76d5543d126adf03f913c06c93 | ORPH
   xtensa    | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/c3096f604b6bd57f2fd9bb846163f974d4c441a0 | ORPH
    or1k     | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/6e4074fe07ba575cba3b1c5dbd7a49272af90782 | ORPH
  sparc64    | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/4ea32fa37f065ce7ec5f97299660bb45aa0cb5e5 | ORPH
    i686     | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/2186aedb1149bb9cb71f78e0adfc51835dbd5db8 | ORPH
  mips64el   | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/787105dc98f959703d0ad5b9a4af0c993964c5bb | ORPH
powerpc64le  | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/3e313aea794fd6d05f5cd762c7f6f62b714edc8d | ORPH
    or1k     | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/ee8187446fb88b362ecf31df3359d10a62f143cf | ORPH
   nios2     |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.net/results/30cee613260d5177ace09640596151ad1c7f9b16 |     
   x86_64    |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.net/results/cc9e4e4fad9d34cb9891c489317ac0a4774c51c4 |     
    mips     |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.net/results/ecfa6860a6fb23fa45b06da74d801f69947d38dc |     
 aarch64_be  |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.net/results/f019e1aa3163a078509983c37485148ba2cdca28 |     
  mips64el   |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/ce4d494a5c7de442f5ae8f79a0b7456b7368cdca | ORPH
 aarch64_be  |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/9461848d2a2fed6dad027802bef1b51dfcff6634 | ORPH
  powerpc    |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/8a46b48cf4893423f7db504aa6b1b95d3931198d | ORPH
  mips64el   |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/da0ef306052680ec326bad93d88389e4bce3d2fd | ORPH
 microblaze  |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/af2f275d281419bc1fd54f1bccccc5770136bd12 | ORPH
    arm      |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/e4c48872c5c4a32a53f7bd3741f58648044b3d02 | ORPH
    arc      |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/b8cac7e688e001cc843ea8ffe5c239ad3b89697f | ORPH
   armeb     |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/fb4d9eef52dbe5896481ebf3a501612cb6fd90cd | ORPH
 powerpc64   |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/7e201e1aa08d12dcc181a6566ed742f27adafb24 | ORPH
    m68k     |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/c237a210b1c0b33eecfbe509f25f116adca9cab9 | ORPH
powerpc64le  |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/f52391b4d7ce814d882e87c58a24333baf25d5f2 | ORPH
   mipsel    |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/ff65d25a8bc82e1ec80e9c3a143c69537bcd1cac | ORPH
   arceb     |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/b912b534b4ba159fadfb5cc8a51052476a5124ca | ORPH
  sparc64    |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/4da3b4b1e14f6fccd053b0dfa854e018de269600 | ORPH
   sh4eb     |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/e423d4b0552d33d0b07ccecfc65c58a6c44bb0a0 | ORPH
   sparc     |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/c035dd2f1ec9a40989246be2b987ec3d85818c40 | ORPH
   sparc     |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/b3ef7338a671273bb8bb78b12ad529fa698565ae | ORPH
   s390x     |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/0f3b2793344da5ead971e27d2e02143cdfff351e | ORPH
  sparc64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/84d3d435df86f33e9275abcbdaefb5a1098e631a | ORPH
   nios2     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/de9da5373202c41ed094f7b63e313facb5c8295f | ORPH
   x86_64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/630523edd827113849718be640dc49b4e5761768 | ORPH
   mipsel    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/2f3d3140509b73185dd34bfa8207c4c746052c5f | ORPH
  sparc64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/478272505e9452647e33554f6c4c6226cf2b7893 | ORPH
   mipsel    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/8c5f48b79ed61c6e0950daba7adb048d1b83680b | ORPH
    arm      | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/473e18ecd58d1fbc3639c29f96c6c39d3c4f78c5 | ORPH
 powerpc64   | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/9bd502d01c88789e2ba0c26bc042f503e30e9a33 | ORPH
 powerpc64   | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/162e4ca2bd874acc2f67bd3a6a80daa8e7eaa518 | ORPH
   sh4eb     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/2ee070161f0ce1800461f99ab767dcdd582f2d3d | ORPH
    arc      | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/8001beff99e126f1e902001d3d67ed7c487a664b | ORPH
   sparc     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/6f17d249bd80ceab8a4d9832fa44b05c070b9e3f | ORPH
powerpc64le  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/729600e98fe41f4fd25151d752962ca99998b0f8 | ORPH
    i686     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/12bafa80f2d0b39a6422cba239f71427bfbee2b0 | ORPH
    i586     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/2990a7e9f5c3ff7153dbc9eb7387b7e5b1c2a064 | ORPH
 microblaze  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/cb66f80612802942342116dab4a9fa9fb6d5f49c | ORPH
   sparc     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/ca7080d158d1a6e1b9a534f6e2762a9c88718525 | ORPH
powerpc64le  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/6e1aca090e797c5e99e614ab5154878130dcde55 | ORPH
    arm      | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/f52579cf2d307fddb60e6ebb0b8af42a28ab6827 | ORPH
microblazeel | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/60946dc8c0f001366e6a647509b5fac7af8011d2 | ORPH
  powerpc    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/2e690e0a9b81760cd5f8b1d93a751960d9dd6b21 | ORPH
   x86_64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/dccaacb6ec4f89a23dde614d705f6d6299ebd2b3 | ORPH
microblazeel | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/5e27964b8bc423230f86061075d96f3501c413c5 | ORPH
   nios2     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/b2e9e4d47dcd0640775bebe587792b4bfd1ab4ad | ORPH
    m68k     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/b57cb246770a3ddd6e02037b8fded1ccbfd844f6 | ORPH
powerpc64le  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/903cce92f3826dca15ee38dd9f3dabbeb6a0bb76 | ORPH
    i686     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/d720f61a45bb65c85f5753caf8f5429ee9b53187 | ORPH
powerpc64le  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/fbed999c7c7a33ee17084700b303465bc5bfd8ae | ORPH
   x86_64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/12d41a542681968fee0d0e348a394c15979d2c7c | ORPH
    i686     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/e51f1b8fd66f1866f2ef018cc82e7b8bf4eacbda | ORPH
   nios2     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/4ea775d8833132b7aa7c41154e601aaa5753f50c | ORPH
    mips     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/95e2edba535189a1f7f6d995a30703f1f9a17356 | ORPH
   nios2     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/ad1a2005128b9b93e122e5af7dda3758f643ea39 | ORPH
   nios2     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/78db224ce971c73b1befd9c100fec45cd2bd3e28 | ORPH
   nios2     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/d57e20d9e883676bf290cca1994689ea9f9713a6 | ORPH
   x86_64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/c87bbd39cbbbfb82d7ab804b0edffca66558d562 | ORPH
  riscv64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/32d2c7944cf91aff1da82854d3aad2c6c33e2014 | ORPH
    m68k     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/04d2fbbff87936d033f4110c8bbe806d2d1c3625 | ORPH
   x86_64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/309822fd84839e0f77e4f9b5c963f91268e0f2ec | ORPH
  aarch64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/34c0c3b9f88be341c26d12c8405f0684d822e68f | ORPH
powerpc64le  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/5a41a2ccf4d760f4d3f40dbbf96e38848c0c2bf6 | ORPH
  sparc64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/afd6b5f5c56425d156a17f889105e44809898c85 | ORPH
    i686     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/2603f92efc68a95c5170e6c37f31cbb4a174a705 | ORPH
powerpc64le  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/66b51dfe65822e50b603d26eda513036498429fc | ORPH
   s390x     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/b00a9653b753cc12ceaecd1dbc18e53018667023 | ORPH
    arm      | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/ccc1c9419b6af71760ad868c7a78107f47b3eabe | ORPH
   nios2     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/7e8c756dfc5f7756a33335ca1d99157b2016720d | ORPH
microblazeel | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/af7ebe7babf56150ef1bc440aa1e32447b9c5f3c | ORPH
   x86_64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/a56e414917b450d4c366df43b36fe94709bbd51e | ORPH
    mips     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/15946ec6e3393952c894274065501209d7741dc8 | ORPH
   nios2     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/c0337beb7659355dd436d45f626238f2c345ef9f | ORPH
 microblaze  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/774ccc7069caec27d000bbc3ce48cb8685bc1b3c | ORPH
    arm      | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/b8c1cc59fafacf2173c574b9b6a4939dd9aba120 | ORPH
  sparc64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/0917280858280c1820f53778f51bd8790c5e14d4 | ORPH
   nios2     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/bc0c3afc56d70e724a9b07898641dfb9e861395c | ORPH
   s390x     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/24cfa2aad7699a57d56e4fb9879770b62747dd1d | ORPH
powerpc64le  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/b534e818b776c829b0d22da37312bcb4045ab390 | ORPH
  powerpc    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/b552d287a27a16f8ac98d46cb707395e75f656a8 | ORPH
  powerpc    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/ff93c63ccfcd76862ec4bcba2687628d34b64d3a | ORPH
powerpc64le  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/b59d51b71d9ec114b347347d612272e1bbd26a74 | ORPH
   mips64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/fad62596dc4a33e22b95220edfe18e39fd3e50c4 | ORPH
   nios2     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/bf7c6ae5336a5eb4146017d0d3b64db13844d25d | ORPH
 powerpc64   | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/4075eca0a24a6d22fba5f4a4de433ac31f1297c3 | ORPH
 microblaze  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/f402b45945a2ebb9e8d17cf36fb6b1dc757873c1 | ORPH
powerpc64le  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/812e12a1a0e9f8f13840943216e9ce25c5497b26 | ORPH
   xtensa    |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/2960df60054d0b88ef9426d4e00a650792d6d46c |     
    or1k     |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/d3fd6c7b78ffe21ae410b2fba7824c51c4233388 |     
 microblaze  |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/69d9e6f0a9c7839fca87876d2062f3e6ef44c65a |     
    or1k     |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/14436a8d23c4951ab17be3c1ed8f2a90ce942d97 |     
   x86_64    |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/58dd6568c6a16096cd74879e9a97360f3b2bc0c5 |     
   armeb     |        host-rust-1.74.1        | NOK | http://autobuild.buildroot.net/results/d72f23961661c0c8e1064461255b840db3556de9 |     
  mips64el   |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/43cbbb73ef3c527cbf8d03e03e0cf0bed6f73d99 |     
   arceb     |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/fc5bda4200a8d501409d3871f2b0ee1c8a96d02b |     
microblazeel | host-softether-4.30-9700-beta  | NOK | http://autobuild.buildroot.net/results/a45ab2c64427402c83ee507f18872e486cee5c7b | ORPH
   s390x     | host-softether-4.30-9700-beta  | NOK | http://autobuild.buildroot.net/results/81f045ceb94d4490dc65a955a90c0194b35e2cda | ORPH
   mipsel    | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/d92b9b952bc4358a33dcf2821f3177fca6bd5721 |     
  powerpc    | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/1cce53aa0d6b307316555b70d3ee7bdb9cf7b45e |     
   mips64    | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/a908ea55043fd6488094d37cb094c29be8f8ad32 |     
   nios2     | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/25d8f9c7ba30127dc834684b5e8821cabf379407 |     
 powerpc64   | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/88f5091bf9eaf68099e4f985f51befd18387dd4c |     
   mips64    | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/d3fe0cc7d8b6d84cb345554876f4774709ac3eab |     
  sparc64    | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/bb46eae4613c8e0576c0d8cbc957d9f5a8811e5a |     
   x86_64    | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/2d7318ac9f3ac3e8d5e69a135a4837bc27c41f3d |     
   s390x     |           htop-3.3.0           | NOK | http://autobuild.buildroot.net/results/e19ed6193a0b666e97243953f1f589d29087247d | ORPH
   armeb     |        hyperfine-1.18.0        | NOK | http://autobuild.buildroot.net/results/526de58a8afd7ad08f651b2d9e35e4a82cfda6e7 | ORPH
  riscv32    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/4ce0c9f21c502744058580c3a44dc55f2084eac3 |     
   mipsel    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/2e7c2fb0867981295ec00ec29ed0838388cea628 |     
 powerpc64   | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/3d07d2f90038e8637d91a032e4264ee0ac018c30 |     
  aarch64    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/9bd3cae884957eb623b0e240eaf4a44dbcf8fad4 |     
   nios2     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/8898c896ebdae6493a223fe5376b42a712dfc0c5 |     
   s390x     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/b8a2ae4d8d2377151adb67fc8808100e8bba16e8 |     
microblazeel | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/81943562e2e2bbfb737775373e7d3ab545bdfa4f |     
   x86_64    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/e2cd348b5fce2240817eebd788f9da2a87883e85 |     
 aarch64_be  | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/4de065b58eda8f0ea16291dd4e83d2ea2d91b33c |     
   arceb     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/b42bb03512ea4a246abfb40840f8e206e3c95323 |     
    arc      | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/70b234efbc25431fd578b2687a8b879199465148 |     
   mipsel    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/8300f75411a08fed1a1e8d624ae1e9159cfbf408 |     
  sparc64    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/a13c386de3c5400cbed6a05761913716b9d714cc |     
   mipsel    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/34522301f66d9be017b612544dbf4d291657f1da |     
    arc      | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/8e36ab9b092799c3c00514b724ab1f5c46ce6fb7 |     
  aarch64    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/498aa799e56e0e63794b0bfcca539f2ced1b9167 |     
   arceb     |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.net/results/e58838cfbea09e7c29687ce7d71997e29905f7fa |     
    arm      |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.net/results/96d6323a06c66cbaf6351780ba8329b9a1341e52 |     
   s390x     |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.net/results/2c8a834f385851d947fdace1129b01cd48d90a41 |     
   x86_64    | kvmtool-4d2c017f41533b0e51e... | NOK | http://autobuild.buildroot.net/results/112c83d77c74474b76baa491c49d2d1ecaebaec7 | ORPH
    mips     |        libarchive-3.7.4        | NOK | http://autobuild.buildroot.net/results/fc5023be4c2b223d81b7c6ed6a181dbb701508c6 |     
  powerpc    |        libarchive-3.7.4        | NOK | http://autobuild.buildroot.net/results/7d16ce0f4bd6c49e4643d699cd65e2b33dae69e4 |     
    arc      |        libarchive-3.7.4        | NOK | http://autobuild.buildroot.net/results/1fdaf28b58b372f6748906950e632e4da6a23554 |     
   mipsel    |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/9818a25bcb762668cfac5417e2915ddf909e8421 |     
    arm      |         libcli-1.10.7          | NOK | http://autobuild.buildroot.net/results/895bbc26855b95d6324e2371a6d2d3efdea364e8 |     
   s390x     | libdbi-drivers-0bfae6c43134... | NOK | http://autobuild.buildroot.net/results/c91e771abc6bac767a22b316c0c4282bb9e916c3 |     
   arceb     |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/5465cbf51c4fea74a180df5c47c28375ca720767 |     
   arceb     |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/dffe1dca11124c48acaea9d0e6c06309a60c3b78 |     
   arceb     |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/fea41d86a5a2407b53ae93c7d6bd6fb8a7702c91 |     
   arceb     |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/5447b2c4cd690f7d8f21dbd75d2655bbff90c0cf |     
powerpc64le  |         libgee-0.20.6          | NOK | http://autobuild.buildroot.net/results/1e7e57942a9768c6126bac37f634d78198576d95 |     
   arceb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/79108d02ffa81ae5897c429ffa619a6f47a3f962 |     
    arc      |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/e52cd1e6bcd814cb276dd0bb9f4f7a15465e5f2f |     
   arceb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/f92cab5029c033ea35d25d37ef70adce57e12283 |     
microblazeel |        libopenssl-3.3.1        | NOK | http://autobuild.buildroot.net/results/fa73affa14dde6c48053c36696de3a402273a376 | ORPH
 microblaze  |        libopenssl-3.3.1        | NOK | http://autobuild.buildroot.net/results/d402b84027efa730fb167626b755247c05e52f1e | ORPH
microblazeel |        libopenssl-3.3.1        | NOK | http://autobuild.buildroot.net/results/b68a4fa03f2859632eb0b43a583f2b16d8014989 | ORPH
   s390x     |         libp11-0.4.12          | NOK | http://autobuild.buildroot.net/results/f6e32c61a869715e85bc74a0ea8e2d6c18efbd93 | ORPH
microblazeel |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/f9afbdc30b2c128f080e01267974d9fcd2d103d3 | ORPH
   nios2     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/4b2f55b58db3119f95f9363cda2c9800076de351 | ORPH
    arc      |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/4e529cc9434d3027f3e01700d0a7975a4c8c67ed | ORPH
    or1k     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/fdd9168c81ac4e93f9adf6d453944d3b983f6bda | ORPH
   xtensa    |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/5d46c96ed29f9e1a7bb55d55ad8dc19f956dcaff | ORPH
   s390x     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/092fe58f6bee661a525c87bdd3ca6d35b23cd6ca | ORPH
   mips64    |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/dc4e3f76d40b27d6595f97c3f875dd7af70000b5 | ORPH
   sparc     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/6f860f7547ff4cf42eaaf51ab6234c530d5f9e75 | ORPH
   s390x     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/a87d9d3fdb5db6f6b6d1a567ded02e34fd271a21 | ORPH
  mips64el   |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/4272653e52950a23c76bff2baf9de6487e8e22ef | ORPH
    arc      |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/0fc6ab332740af754d7d29c637da84251e6313f9 | ORPH
    sh4a     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/948202fcbd580e03f47e489fc73ce00b6bd7054c | ORPH
   arceb     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/f5cd4eeb61eb191638f14776b6ab4ee7a0ba3bc7 | ORPH
microblazeel |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/4085409ed12d0ef96fd4494a69e95d3b176bab47 | ORPH
 microblaze  |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/42694efd5fafbeaa1ef98981f60f5c63f6ef84dd | ORPH
    or1k     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/ae591adb8bfd398173682a2b5b70718fcdfd1d18 | ORPH
   armeb     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/d80cd04f5bc05c1270e0d2ce7f677ad7533031d3 | ORPH
    sh4      |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/36a22e5f65a60897a385acaedd1cf0e039f1f063 | ORPH
powerpc64le  |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/0b5b25d07e28f673dd824d80eac8f31b02ffdc76 | ORPH
    arc      |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/c0a4e35c61cd77a07a521a68ae920cceebd89c68 | ORPH
microblazeel |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/dccf149dbcad7060dcd6cedf2fee1e04a77a7253 | ORPH
 microblaze  |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/3e9fe0c32dea78221e8398b6761dcc472f59f991 | ORPH
  powerpc    |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/b1f798290529b34710daf418903b114854b450bc | ORPH
    arm      |         librsvg-2.50.9         | NOK | http://autobuild.buildroot.net/results/01c83d69056766dc9730d87e8c1f27a3e837dadf |     
   xtensa    |          libsepol-3.6          | NOK | http://autobuild.buildroot.net/results/16287e948545154725242e12bbd95d40cb8b29a7 |     
    m68k     |          libsepol-3.6          | NOK | http://autobuild.buildroot.net/results/a241312204325b5e3fde8203566b18204c5d0fa0 |     
   mips64    |        libunwind-1.8.1         | NOK | http://autobuild.buildroot.net/results/7e69008fde3204d12095cd57dcce3fc07ce04664 | ORPH
 powerpc64   |           links-2.29           | NOK | http://autobuild.buildroot.net/results/1b0225ef9f2ffe869cf28aec737427d6742b6b9b | ORPH
    m68k     |           links-2.29           | NOK | http://autobuild.buildroot.net/results/94abb85a668e54e4d8cef8ca0347ca86f0d6b19d | ORPH
   mipsel    |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/fb3f8af1a79682c2af951e7eebbad6e912fdfcd0 | ORPH
    m68k     |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/5a6b589d3f2f7f751d0fb570b2b86db6f22e7564 | ORPH
   mipsel    |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/2efad07c8b4b058f9ac427da7814998e50a97d00 | ORPH
    arc      |          linux-6.8.12          | NOK | http://autobuild.buildroot.net/results/ceee1a5f626f3dd12358dfd51bcb2f32b75179bb | ORPH
   nios2     |          linux-6.8.12          | NOK | http://autobuild.buildroot.net/results/1480a78f63913a6d9fec18183e0d02e4393ca520 | ORPH
  mips64el   |          linux-6.8.12          | NOK | http://autobuild.buildroot.net/results/128300dc9efbddf63a0e2c0e9d0d25f0e9b59f1a | ORPH
    m68k     |          linux-6.8.12          | NOK | http://autobuild.buildroot.net/results/753cd0841b3ef4de6b7b2b2c897ea89da74eb05b | ORPH
   nios2     |          linux-6.8.12          | NOK | http://autobuild.buildroot.net/results/4ee86ee40dd16a26c4639e46af5eb4af353ecfa6 | ORPH
   mips64    |          linux-6.9.4           | NOK | http://autobuild.buildroot.net/results/260b5f3c93560cf0a2ec9a5093a2e0aa6e14df79 | ORPH
 powerpc64   |          linux-6.9.4           | NOK | http://autobuild.buildroot.net/results/d6b0a6c2dc2db2b29ec5bd26a0143edcc2bcff2f | ORPH
   arceb     |          linux-tools           | NOK | http://autobuild.buildroot.net/results/5e9c2c98d8cabc46a130cdfb004890223f43556a | ORPH
 aarch64_be  |          linux-tools           | NOK | http://autobuild.buildroot.net/results/4203336559b29b35743d50007c9eb6f74c106150 | ORPH
  aarch64    | ltrace-82c66409c7a93ca6ad2e... | NOK | http://autobuild.buildroot.net/results/b038113f7b6bd7542279184d4f6019157cc418bb | ORPH
  riscv32    |     lttng-modules-2.13.10      | NOK | http://autobuild.buildroot.net/results/a28d69ebe6a755ab632123c5adf2f27386f1af81 |     
  mips64el   |        mariadb-10.11.6         | NOK | http://autobuild.buildroot.net/results/3a0bedfa99ef583094fa46ed56c3ea03770a2735 | ORPH
  aarch64    |      mediastreamer-4.4.8       | NOK | http://autobuild.buildroot.net/results/094dad03a6df6621c6ceec167cb50d6599363b3f | ORPH
  riscv64    |      moby-buildkit-0.11.6      | NOK | http://autobuild.buildroot.net/results/d210c6de0595c25ecb94d44e0e26c1f3bf862db1 |     
   arceb     |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/2eb8e342b70c6c91d8f9b67660f4c57fbbfd3b6a |     
   sh4aeb    |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/87fdfc345a13b5c0295ce063c8a46cc8ab8f02b9 |     
   armeb     |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/9501eb87b23c48183150cf323c4ed701684b4302 |     
   armeb     |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/8628fca4191ad250f99cc7570d437b83512e039e |     
    i686     |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/6d39dfb4c1a1bb0e82a378a363c70b0cf0225721 |     
   mipsel    |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/d4d99e524beb09a205c63405009b2e3ab3cd3159 |     
    or1k     |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/8e0b8684815c685d937a3fb4e08353beb5c00a13 |     
   arceb     |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/ed6905a2c953e61712a0bda77d6dcc79ff9ae367 |     
   mipsel    |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/8fbbeefe2337d2ea27560fc47c6211caa97cf8d0 |     
   sh4aeb    |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/e8791886b7fd165dd770ec8f854f6e4be12a018c |     
   arceb     |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/ba976874ca8a993b5bfd6dc325478cfbcd65506f |     
 aarch64_be  |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/6097247e51b04242da96180a9a14b4e4e45dcf15 |     
  mips64el   |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/26a1c143d8d643ee5e17b7e24a6ffb3bcdd5471b |     
   nios2     |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/4067f8176b637c85d1a53257cb80179084fbfc08 |     
   s390x     |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/60ed6e85a0339975f9a6867fb7e052f4fda7b5ce |     
 powerpc64   |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/59211f3eb16e7fa0af6a4f18d3d8a468d0665279 |     
 powerpc64   |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/20f2c91fb4158e68ff784f6742410d10adf217f7 |     
  mips64el   |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/6d5ca6e629ba7221187520d07105c004c4b111ef |     
    m68k     |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/2a7b9e9124f804dd782e0ec7b302f3324895fca8 |     
  powerpc    |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/7036bdbb15cf70f2d17a9577d73032f841bc4c69 |     
    sh4      |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/7601dc7e488a74b268c93d3d1a71d785649646b5 |     
 aarch64_be  |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/8cd3529f47299b067e1f3dfa08dff0ba442d8bdf |     
  mips64el   |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/f8fe1973f9f2c007c94514c6d6245d80420dcd32 |     
  riscv32    |           mtd-2.2.0            | NOK | http://autobuild.buildroot.net/results/b9695df64e7992b486c399fd37ab376acfb9c111 |     
    arm      |           mtd-2.2.0            | NOK | http://autobuild.buildroot.net/results/52a289c7033005b7a29b0f2bc6aa5056cbdabb34 |     
  aarch64    |           ncmpc-0.49           | NOK | http://autobuild.buildroot.net/results/3ef7213a6cb3737603c46849c7fc2fd589ff7926 |     
microblazeel |           nut-2.8.2            | NOK | http://autobuild.buildroot.net/results/f232ec6f37ad735913217834cbd92c3e019b5684 |     
   mips64    |         openssh-9.7p1          | NOK | http://autobuild.buildroot.net/results/ce25dd3aaa6b805837a7607a1e2ef615d9b503d1 | ORPH
 powerpc64   |         openssh-9.7p1          | NOK | http://autobuild.buildroot.net/results/992619631cd8cfaa9057d7d2a7a8e25217d36446 | ORPH
 powerpc64   |         openssh-9.7p1          | NOK | http://autobuild.buildroot.net/results/931b27022dd7724c67188f0c1580d5133eac1f69 | ORPH
    mips     |         openssh-9.7p1          | NOK | http://autobuild.buildroot.net/results/b27749285741b9f5165cbe76c1a4fcd0f06e68da | ORPH
    sh4      |           php-8.3.7            | NOK | http://autobuild.buildroot.net/results/2897a29fe67f592c1d105f5d8f3d15cc58b52cc1 |     
    arm      |           php-8.3.7            | NOK | http://autobuild.buildroot.net/results/0d999ede08d0c3ef9722251d58bb015ce2f07aba |     
    arm      | pistache-3ec9d7c4f8b828fdd3... | NOK | http://autobuild.buildroot.net/results/c93d096e427548329c81c5770ec3c07a546803f5 | ORPH
powerpc64le  |         pixman-0.42.2          | NOK | http://autobuild.buildroot.net/results/bd3a9f1cf7931dda99c306fe13bf06712748f09b | ORPH
  sparc64    | pppd-e1266c76d1ad39f98f1167... | NOK | http://autobuild.buildroot.net/results/8afd9bb68896b502e712f22a08722bf264a3dbd9 |     
    or1k     |        pulseaudio-17.0         | NOK | http://autobuild.buildroot.net/results/12afaa141d55a3483c5527795924efaeddbf351e | ORPH
 aarch64_be  |      python-grpcio-1.60.0      | NOK | http://autobuild.buildroot.net/results/dbaf989d501a0093f3f28cc81feac0cb0535d555 |     
  riscv64    |     python-remi-2022.7.27      | NOK | http://autobuild.buildroot.net/results/72b3b6bfacef371848095259e3733eaceb0bee5c |     
  sparc64    |     python-remi-2022.7.27      | NOK | http://autobuild.buildroot.net/results/38e1c78c2ab81a7a57ed469f65ab7988653ea34e |     
    arc      |     python-remi-2022.7.27      | NOK | http://autobuild.buildroot.net/results/b78af7b9f505242a96543b7e4bde21fea5b91c2b |     
   s390x     |     python-remi-2022.7.27      | NOK | http://autobuild.buildroot.net/results/7817fda11bec70489ad475db33a77b4e17d17191 |     
  sparc64    |     python-remi-2022.7.27      | NOK | http://autobuild.buildroot.net/results/e87957080f535d22d682a149dbe4dceec2b55a7e |     
 aarch64_be  |     python-remi-2022.7.27      | NOK | http://autobuild.buildroot.net/results/6cb1489728d71a7d05686fbdb0c9804b3750714a |     
 aarch64_be  |     python-remi-2022.7.27      | NOK | http://autobuild.buildroot.net/results/04880f39e27a40991b45a28c057e07044a00066a |     
  aarch64    |         python3-3.11.8         | NOK | http://autobuild.buildroot.net/results/dc27262e82e9a2af9dad92d3ab42375e9b2979b5 |     
   s390x     |         python3-3.11.8         | NOK | http://autobuild.buildroot.net/results/26ca017e5052442fc55c242a0ad77cfd616f4836 |     
 aarch64_be  |           rtty-8.1.0           | NOK | http://autobuild.buildroot.net/results/7ae64d5c5639dae3a2fe4b3902e18bc118000bde |     
  powerpc    |           rtty-8.1.0           | NOK | http://autobuild.buildroot.net/results/55445316462d4eeb57280bcbe76a094ab46fa99b |     
    sh4a     |           rtty-8.1.0           | NOK | http://autobuild.buildroot.net/results/6165d341a04adcaef6a12627344d3fb8709d4d39 |     
   xtensa    |         s6-dns-2.3.7.1         | NOK | http://autobuild.buildroot.net/results/f1be09673356cd1d2c53c2c7e24d426cb52e4867 |     
   arceb     |       sofia-sip-1.13.17        | NOK | http://autobuild.buildroot.net/results/042141da77ce823a93ca8f686df223af73b4c51f |     
    arm      |       sofia-sip-1.13.17        | NOK | http://autobuild.buildroot.net/results/dfec90624f2af09c7018ca106fcfe32bb9beaca6 |     
    arm      |   start-stop-daemon-1.20.7.1   | NOK | http://autobuild.buildroot.net/results/968e183bd20d8d4b50e472aed89a3aea215a4327 | ORPH
    or1k     |       stress-ng-0.17.07        | NOK | http://autobuild.buildroot.net/results/4d39f20e119b26bdcb1cd0d8459be4feaa2da2bb |     
    i486     |       strongswan-5.9.13        | NOK | http://autobuild.buildroot.net/results/2f35d7977d9b98c6836cc468b100f0521b720770 |     
    i686     |         tbb-2021.11.0          | NOK | http://autobuild.buildroot.net/results/d3487a9c423b8f01c75ed75299e4a58b9e9a4105 |     
 aarch64_be  |        tinyssh-20240101        | NOK | http://autobuild.buildroot.net/results/9d2519a2df2c146b177222cbece2edce98facf9f |     
  aarch64    |         tpm2-tss-3.2.2         | NOK | http://autobuild.buildroot.net/results/1bab024c6b38ff6f3dee7694e94701d583c0d37f | ORPH
   x86_64    |          trinity-1.9           | NOK | http://autobuild.buildroot.net/results/e96f2c999265a63373d44c87560fe43083851e15 | ORPH
   sparc     |         uclibc-1.0.48          | NOK | http://autobuild.buildroot.net/results/6cccdbbc7ae40c356bbc33fcf7e92eee7c38a841 |     
    sh4      |         uclibc-1.0.48          | NOK | http://autobuild.buildroot.net/results/1a40fa7c46e9092ff564670754a68d2dd774e1d0 |     
 microblaze  |         uclibc-1.0.48          | NOK | http://autobuild.buildroot.net/results/f2ef014b7f72f41028a70542d25e3190b2f1f89b |     
   mips64    |         uclibc-1.0.48          | NOK | http://autobuild.buildroot.net/results/08549a927af7e1f2ee55678b5d0782a96c6c6052 |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.net/results/62237139860be1e49e82eb221e5e5d5a87e8e26a |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/d94b618eb2f988caaa446edf9012a5374a014e5a |     
 powerpc64   |            unknown             | NOK | http://autobuild.buildroot.net/results/4c50105788455a2f36702d7c484b813887a1dae2 |     
   sparc     |            unknown             | NOK | http://autobuild.buildroot.net/results/56a87d0a42ea848752b1b90726b82ede943e8ca3 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/62458f75dfef51c2e2423a147cd48b70ec8b7882 |     
powerpc64le  |            unknown             | NOK | http://autobuild.buildroot.net/results/11332298b12297d4e42c27bf1054597be5efa3ca |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/3fd6d7730ee543cf0dfdc3a3c33cf6671173f353 |     
   sparc     |            unknown             | NOK | http://autobuild.buildroot.net/results/1cd84969e957efa0fecd4857cff79125180248b9 |     
    arm      |       util-linux-2.39.3        | NOK | http://autobuild.buildroot.net/results/c5566e8f03c5d6e09344491bc3b72266a3270a8d | ORPH
  mips64el   |         wolfssl-5.7.0          | NOK | http://autobuild.buildroot.net/results/f041b27345688b553a7692b65abccdc7e3869767 |     
    i686     |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/faaaca4b2d4f96375a578cf7abd993a9969287a3 |     
   nios2     |            zsh-5.9             | NOK | http://autobuild.buildroot.net/results/bc1a2a11500f456cb98fc127c8a82eae91cdbcdd |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

               asterisk-20.5.2 | 1 
                 coreutils-9.3 | 1 
                elfutils-0.189 | 1 
                    eza-0.16.0 | 1 
host-heimdal-f4faaeaba371ff... | 1 
                   libnss-3.97 | 1 
               mariadb-10.11.6 | 1 
                    proj-9.3.0 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv32    |        asterisk-20.5.2         | NOK | http://autobuild.buildroot.net/results/8c5906e2e582341a23b5a002c04591d13c955cda |     
    sh4      |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/cd71621032e4f67c1249f615038ef97b7f54e74a | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/c2d11f781d7c6de7f551f4b3aec4ed834a58b209 | ORPH
    arm      |           eza-0.16.0           | NOK | http://autobuild.buildroot.net/results/f77dc6f1a39fc4aa718c8b9051c2b3e8e67eccdc |     
  riscv64    | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/62fe469f84d78db7a71bb3594a64bab68ae9027a | ORPH
   x86_64    |          libnss-3.97           | NOK | http://autobuild.buildroot.net/results/cf06001f8ac9dcd52ff4e92c30b6167f4adccc75 |     
  riscv32    |        mariadb-10.11.6         | NOK | http://autobuild.buildroot.net/results/207ca498bfa7495d6f4fe23def00c1e1e25ddf6a | ORPH
powerpc64le  |           proj-9.3.0           | NOK | http://autobuild.buildroot.net/results/6e69b9408e3568d1ab0541370e8109f80d4e3e98 |     


Classification of failures by reason for 2024.05.x
--------------------------------------------------

                    brltty-6.6 | 1 
                  clang-15.0.3 | 1 
                 dc3dd-7.2.641 | 1 
                fail2ban-1.0.2 | 1 
       gst1-plugins-bad-1.22.9 | 1 
                libressl-3.8.4 | 1 
           mediastreamer-4.4.8 | 1 
             util-linux-2.39.3 | 1 


Detail of failures for 2024.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |           brltty-6.6           | NOK | http://autobuild.buildroot.net/results/92780a95644ef0153e419b42b3fc027da6ec5122 |     
    arm      |          clang-15.0.3          | NOK | http://autobuild.buildroot.net/results/1fb67290c0bbb5f1a7eccbe7512a89e675ad7f10 |     
    or1k     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/0eded8b5e17444638004219810c0fe769bb188a8 | ORPH
    m68k     |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/14884a6fb23ca57088e6def6027361efd24bf826 |     
  mips64el   |    gst1-plugins-bad-1.22.9     | NOK | http://autobuild.buildroot.net/results/c2fa799915fd86802ef0314ddbd0ef9bdbb323c9 | ORPH
microblazeel |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/a162e5bf849ed6d9eead49e76551615e3657bf83 | ORPH
    mips     |      mediastreamer-4.4.8       | NOK | http://autobuild.buildroot.net/results/132bf1e5036ff0c635a1b77d9c7e34c7975fec3a | ORPH
    arm      |       util-linux-2.39.3        | NOK | http://autobuild.buildroot.net/results/a69ff3254114e76ede5c4a11ed7d219ad801d501 | ORPH



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
