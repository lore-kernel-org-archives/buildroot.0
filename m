Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B9F0C25B76
	for <buildroot@archiver.kernel.org>; Wed,  5 Jun 2024 05:01:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1150741761;
	Wed,  5 Jun 2024 05:01:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W_aNhZki5ioT; Wed,  5 Jun 2024 05:00:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0E4EA413CC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0E4EA413CC;
	Wed,  5 Jun 2024 05:00:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2EC691BF5F6
 for <buildroot@lists.busybox.net>; Wed,  5 Jun 2024 05:00:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1DB4840B59
 for <buildroot@lists.busybox.net>; Wed,  5 Jun 2024 05:00:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HIW7CcqrrSaV for <buildroot@lists.busybox.net>;
 Wed,  5 Jun 2024 05:00:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2D3B940B58
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2D3B940B58
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2D3B940B58
 for <buildroot@buildroot.org>; Wed,  5 Jun 2024 05:00:51 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2BBA920003
 for <buildroot@buildroot.org>; Wed,  5 Jun 2024 05:00:49 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Wed, 05 Jun 2024 05:00:49 -0000
X-GND-Sasl: bot@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1717563649; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Gf8XPsEChhFRPv86vrCWiov8T5qfjcWDvTSyYuyEuvo=;
 b=nJfS59UxqZf71+sUuuKdbPZf8tKbvxHHjywlP3P2dHf195v94vJ5mi46mjKPlOW30Ygsmt
 DaGZ7QpwvEVDUOeUXS12B4Pv47K2APNIlY16YKpEaHUiCgdXKzr2TT1m13D9DcSHfjlO7m
 hA4+AwDxQLAAzev+r0vut71tC2O2qZnJ/Lm9rgzG7B0gbokfg6IlgvS7oaFuumV0sJFdSp
 ba+cv4hldukX/yHX2nmnZjK47FaGvOrWem8ndLsk60CB4X1nEpQnPMIbpsfnM5XqryqRRM
 fnhd9zMDtYec/r8yjx+KJoWV6oxfmFRcKTb9s+cwsyKBl2HESyEYflNw74orYQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=nJfS59Ux
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2024-06-04
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
Message-ID: <20240605050049.MlHKl0whErqwrj3QgMCDzR5yPZ5FZ0ApvdQAG4Nff1k@z>

Hello,

Autobuild statistics for 2024-06-04
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  | 10  |  5  |  0  | 15  |
    master   | 108 | 277 |  0  | 385 |

Classification of failures by reason for master
-----------------------------------------------

host-prelink-cross-a853a5d7... | 40
            host-cdrkit-1.1.11 | 21
                libressl-3.8.4 | 15
ibm-sw-tpm2-5452af422edeff7... | 13
                    mpir-3.0.0 | 11
                host-odb-2.4.0 | 9 
        host-python-lxml-5.1.0 | 9 
                elfutils-0.189 | 8 
      host-riscv-isa-sim-1.1.0 | 7 
             host-vala-0.56.14 | 6 
                  bcusdk-0.0.5 | 5 
host-android-tools-4.2.2+gi... | 5 
                 coreutils-9.3 | 4 
                  ffmpeg-6.1.1 | 4 
              libopenssl-3.3.0 | 4 
                  linux-6.8.12 | 4 
                   foot-1.16.2 | 3 
                host-go-1.22.3 | 3 
host-heimdal-f4faaeaba371ff... | 3 
        host-sentry-cli-2.20.3 | 3 
           libzenoh-c-0.11.0.2 | 3 
              procps-ng-3.3.17 | 3 
aer-inject-9bd5e2c7886fca72... | 2 
brcm-patchram-plus-95b7b691... | 2 
check-11970a7e112dfe243a2e6... | 2 
             containerd-1.7.14 | 2 
         docker-compose-2.27.0 | 2 
                    fcft-3.1.6 | 2 
            gdk-pixbuf-2.42.10 | 2 
         host-libxcrypt-4.4.36 | 2 
host-vboot-utils-bbdd62f9b0... | 2 
              libarchive-3.7.4 | 2 
          libcamera-apps-1.2.1 | 2 
               libglib2-2.76.1 | 2 
     linux-5.10.162-cip24-rt10 | 2 
        ltp-testsuite-20240129 | 2 
                 openssh-9.7p1 | 2 
pppd-e1266c76d1ad39f98f1167... | 2 
          python-grpcio-1.60.0 | 2 
                    zeek-4.1.1 | 2 
                  acpid-2.0.34 | 1 
               alsa-lib-1.2.11 | 1 
android-tools-4.2.2+git2013... | 1 
                 avro-c-1.11.3 | 1 
     bandwidthd-2.0.1-auto-r11 | 1 
                    bat-0.24.0 | 1 
                     bc-1.07.1 | 1 
                    bcc-0.29.1 | 1 
                   bird-2.0.12 | 1 
                    brltty-6.6 | 1 
                   bzip2-1.0.8 | 1 
                  cairo-1.17.4 | 1 
                  clang-15.0.3 | 1 
                     crun-1.12 | 1 
             dahdi-linux-3.3.0 | 1 
                 dc3dd-7.2.641 | 1 
                 dhcp-4.4.3-P1 | 1 
                  dhcpdump-1.8 | 1 
dvb-apps-3d43b280298c39a67d... | 1 
                      ell-0.65 | 1 
                fail2ban-1.0.2 | 1 
              fftw-quad-3.3.10 | 1 
              fluent-bit-3.0.3 | 1 
                    frotz-2.54 | 1 
glibc-2.39-5-ge0910f1d3278f... | 1 
                 glibmm-2.76.0 | 1 
                 gnuplot-6.0.0 | 1 
  gobject-introspection-1.76.1 | 1 
google-breakpad-f49c2f1a202... | 1 
                    gpm-1.20.7 | 1 
                 highway-1.1.0 | 1 
             host-delve-1.22.1 | 1 
                    htop-3.3.0 | 1 
               ipmitool-1_8_19 | 1 
                  kexec-2.0.28 | 1 
                libdrm-2.4.120 | 1 
             libfreefare-0.4.0 | 1 
                 libp11-0.4.12 | 1 
                  libsepol-3.6 | 1 
                   linux-tools | 1 
                     lxc-5.0.3 | 1 
                     lzop-1.04 | 1 
               mariadb-10.11.6 | 1 
           mediastreamer-4.4.8 | 1 
          ncurses-6.4-20230603 | 1 
                opencv3-3.4.19 | 1 
                p11-kit-0.25.3 | 1 
                     php-8.3.7 | 1 
                    proj-9.3.0 | 1 
         python-remi-2022.7.27 | 1 
            python-sip-4.19.25 | 1 
              skalibs-2.12.0.1 | 1 
             sofia-sip-1.13.17 | 1 
                      tar-1.35 | 1 
                 uclibc-1.0.48 | 1 
                       unknown | 1 
             util-linux-2.39.3 | 1 
                 x11vnc-0.9.16 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |          acpid-2.0.34          | NOK | http://autobuild.buildroot.net/results/d077af7d985c84f3c66f83ed8484ae396ff88c40 | ORPH
  aarch64    | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/7e41392ff2ac613f4511d6f0747e8d9ed190fbfd | ORPH
  mips64el   | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/6860e49901ed420b1ed29f369c08d31cfbeb8162 | ORPH
powerpc64le  |        alsa-lib-1.2.11         | NOK | http://autobuild.buildroot.net/results/fa868135163953347004a276fbde007b5fa5ac16 |     
   x86_64    | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/0f367f0f573379ae3fa47aa2bd70047771f56133 |     
   sh4eb     |         avro-c-1.11.3          | NOK | http://autobuild.buildroot.net/results/818ebefba8f464f492013577ea7b6a893dd39463 |     
 aarch64_be  |   bandwidthd-2.0.1-auto-r11    | NOK | http://autobuild.buildroot.net/results/4b36a2aa8d56ec2fe3072f9765a517263b8958cb |     
   x86_64    |           bat-0.24.0           | NOK | http://autobuild.buildroot.net/results/8a2b558f1da23adb7d731c9de7f81de706162ef1 |     
   mipsel    |           bc-1.07.1            | NOK | http://autobuild.buildroot.net/results/2012c27a3e5f2b140d6ea9dcef3454c82c40632a | ORPH
    arm      |           bcc-0.29.1           | NOK | http://autobuild.buildroot.net/results/8332eaee3407702e77bdf1a45247c92f9838602e |     
  aarch64    |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/62591a7e3d4f3775a183ccb3ece6129e86915af5 |     
   sh4aeb    |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/2c3efb99813ab30eb5a5faa7f446066f76949739 |     
   arceb     |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/c897f9faf5300c6c46f29ed75ca42cf9cff49ba3 |     
    or1k     |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/9bc292f076f1d56e8eb83708654fe25ec2750f2f |     
   sparc     |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/c19eda387c53a4ec82708214b0620adece29ff36 |     
 microblaze  |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/7a6c14eb1342422dbdfb7326977b66efd2743f50 |     
   mips64    | brcm-patchram-plus-95b7b691... | NOK | http://autobuild.buildroot.net/results/fc2319a83ed461add26dc5cdd5d1b2b80de39d47 |     
 aarch64_be  | brcm-patchram-plus-95b7b691... | NOK | http://autobuild.buildroot.net/results/ae2e537316bae0adca04e698d73aac648cab0d71 |     
powerpc64le  |           brltty-6.6           | NOK | http://autobuild.buildroot.net/results/9ce3cdd0d35fc2a8bacded6f9471d42a0698106e |     
  riscv32    |          bzip2-1.0.8           | NOK | http://autobuild.buildroot.net/results/a79f989fb62d535fe17f50e69a3c71a77198745c | ORPH
   sparc     |          cairo-1.17.4          | NOK | http://autobuild.buildroot.net/results/abfd86ffe1f4fbf08b3564c7ae9cf132f6c91c1e |     
   arceb     | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/fe1a4c53b6718f1d9002f95467aed93d6efb2375 | ORPH
    arm      | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/fc9af8c16e34fde2323371320bc2e6c4bb1e5c6a | ORPH
    arm      |          clang-15.0.3          | NOK | http://autobuild.buildroot.net/results/3cba1b85d4f38616bf6ba17c2fd6c2d2025f1e03 |     
  riscv64    |       containerd-1.7.14        | NOK | http://autobuild.buildroot.net/results/7604fd94eda9da2ba668058e33ebf740b163ee41 |     
  riscv64    |       containerd-1.7.14        | NOK | http://autobuild.buildroot.net/results/45efc0b34b03e19c625557942c1ad9c424a68734 |     
microblazeel |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/cffe5356354b71d4e96d1d98032796c5a1425447 | ORPH
    sh4      |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/a6b0ed87cebed58f037b20e9e92c6a0ed884e904 | ORPH
   arceb     |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/df21e208709727232894863c70f52c425bacba19 | ORPH
    sh4a     |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/932b75e289226896fad63b15e793900c5824ec4c | ORPH
    arm      |           crun-1.12            | NOK | http://autobuild.buildroot.net/results/8897b4b6c5edd91fc525e956dbb1583476fe7bfe |     
   s390x     |       dahdi-linux-3.3.0        | NOK | http://autobuild.buildroot.net/results/6697d29939cbe527a9deb1ee976d246b2cfedae8 |     
   sh4aeb    |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/aeeeb09d08607be3e5bddef470e1f93d1b6e9459 | ORPH
   sh4aeb    |         dhcp-4.4.3-P1          | NOK | http://autobuild.buildroot.net/results/5b18af65e32f5e812d8feb1bcb1856f601b00b96 | ORPH
microblazeel |          dhcpdump-1.8          | NOK | http://autobuild.buildroot.net/results/3c6d6c5a74fc2203ebe20ad03d1296f7fc66ca44 | ORPH
    i686     |     docker-compose-2.27.0      | NOK | http://autobuild.buildroot.net/results/77d59910880830c4bcefd8455fcf739928fc21ab |     
  aarch64    |     docker-compose-2.27.0      | NOK | http://autobuild.buildroot.net/results/3a84e12ea7a88d1aefbc9e467416458d7bc6e7f5 |     
   xtensa    | dvb-apps-3d43b280298c39a67d... | NOK | http://autobuild.buildroot.net/results/40cc3bcca736040a7b8d9627f29e1f3c678e9fb8 |     
    m68k     |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/02b58cf9e039b35fa633edd5ab4fcea6bbc53a6b | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/441a5c438a467caa2e7ce1a281ea7bcfb5d75329 | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/519d8f9e5a6b2621ecb2fb6980685c4163066960 | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/e6c701e94ee733fae14c4d42da0bf76ef4439f19 | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/e9a6ba69ee3ec04e659543ceca8117c6cbe3e897 | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/28885de7b5455f58ad70fa7ac213719c26a8a15a | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/86ffa5b4214eea03c426936e3a72cc13c7dc7faa | ORPH
    arc      |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/7daef170becdeeb63d4c84e7858a166e65e0ec4e | ORPH
    sh4      |            ell-0.65            | NOK | http://autobuild.buildroot.net/results/1044cdf4bc3aa8897e67c9ca15ef721c12e83952 | ORPH
    or1k     |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/21b877cb87b0007de2726105736b4a2242fd0f59 |     
  aarch64    |           fcft-3.1.6           | NOK | http://autobuild.buildroot.net/results/7aab96e719e03201a0b036a22bee121b811d755b |     
 aarch64_be  |           fcft-3.1.6           | NOK | http://autobuild.buildroot.net/results/74cefb6869f2d03ad9f75432ca4a6ca6631c4dfc |     
microblazeel |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/ddbfcb5b3a22a24f674a345713ce2105c057bba5 |     
 microblaze  |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/fa047d21061b747f31bb673340f9f680c1f8343b |     
microblazeel |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/710ebe8ca8294838b64cf76d75d15f867f07e983 |     
    arc      |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/d16cf3ed42542081c283ef14644e8b87c0984a51 |     
powerpc64le  |        fftw-quad-3.3.10        | NOK | http://autobuild.buildroot.net/results/d525e8102b45492fde98e431c84e535b2481a67b | ORPH
   s390x     |        fluent-bit-3.0.3        | NOK | http://autobuild.buildroot.net/results/872503333c47581b543334ed6eac75fffb2227ef |     
    or1k     |          foot-1.16.2           | NOK | http://autobuild.buildroot.net/results/5f556a7302dff1c2246d794b7ce42ed8a6b11d03 |     
   nios2     |          foot-1.16.2           | NOK | http://autobuild.buildroot.net/results/5ba7f8f4fbec718c5788c05f89bf90dca291c35d |     
   nios2     |          foot-1.16.2           | NOK | http://autobuild.buildroot.net/results/0e59aba54276e5f42c70e1fd49c9f4d1616c9b9e |     
   xtensa    |           frotz-2.54           | NOK | http://autobuild.buildroot.net/results/66bd94996907bef6c1b835e4362e2e9ff1485798 |     
  mips64el   |       gdk-pixbuf-2.42.10       | NOK | http://autobuild.buildroot.net/results/5d8db93bb71db5ed30a7b9735a9621a87aca3e07 | ORPH
 aarch64_be  |       gdk-pixbuf-2.42.10       | NOK | http://autobuild.buildroot.net/results/5bbeb6f356f82d04a6c1644b97e398772806417d | ORPH
 powerpc64   | glibc-2.39-5-ge0910f1d3278f... | NOK | http://autobuild.buildroot.net/results/8fc10606f6b8a684f768c5f270201633b5d60f33 |     
    or1k     |         glibmm-2.76.0          | NOK | http://autobuild.buildroot.net/results/164fb6a543ad7ebf271dfc7ea1f7bbc51cab1b60 |     
   mipsel    |         gnuplot-6.0.0          | NOK | http://autobuild.buildroot.net/results/0c340e0f32be1072e78ef1a5fbcfa865ba484116 |     
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/dca22eb648e5876806e83a221670c294b9deb2c9 | ORPH
   mipsel    | google-breakpad-f49c2f1a202... | NOK | http://autobuild.buildroot.net/results/9c858b911faafd5124138cc22207093e2a43fb1b |     
   x86_64    |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/ecd56c75e587298a174efe7a2b3e639e25c69ad8 |     
 powerpc64   |         highway-1.1.0          | NOK | http://autobuild.buildroot.net/results/c198a67ed3abe5cad9aa471826a07ccfae1c6d25 |     
powerpc64le  | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/5fbc4af146c6ddc07aeccc09b0647465715b7e20 |     
 aarch64_be  | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/2456480e55bfa8b5e624f9f4e717ebeefee2a47c |     
 microblaze  | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/67afbbf3b91c7fb30ac24ef4daf7e6bba257d679 |     
    mips     | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/b2bdb4c7de7d32db367c1cdff9e2d69f6006b217 |     
powerpc64le  | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/779b4124e284e887f762611943571fe21053f4f3 |     
  mips64el   |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/f94a199ef109ebf3f3cbe17c02e213ed9d504b97 |     
  aarch64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/f7cbcfe0d3b56b582e4574ffe0cff180720da5af |     
    or1k     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/c22f9bfa872fc6fb7ad94dc4213e1adb4ac9972f |     
   nios2     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/a9d8a72860f3cccd04054e15e3c2745c16803530 |     
   armeb     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/8d52a27dd79228c3d2447b34dab092a01c37b15f |     
    arc      |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/4df6a70ecc79ed6ceb1564b5b373d2b97a20dd77 |     
    sh4a     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/d713f0b3e357fb0c024bcfb853672962d0b1126b |     
   arceb     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/ce4f9e1adb90f3c9c746bb6e27508954dd895dc2 |     
  powerpc    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/3c9954acfff726e33a3252b8d5cc2d49ad1e7f33 |     
 microblaze  |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/c2af2ba5e67243e57c336f806bc0b073fcf28928 |     
powerpc64le  |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/04975d8b1236116abef1a753b8c93ff8021df9c2 |     
    i686     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/1335875ec11a816a82f178b6ed355ea24dd0b40f |     
    arm      |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/a1c4f475c0096b2785b22fcbf88ea95805090d84 |     
    m68k     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/b01815e5f57e723cc0ad6a2fe510ac8138ce4432 |     
   mipsel    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/9d0fcdcc77d503bd452c9e205d9f70448d235045 |     
   xtensa    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/3c004572900fe626ad0774f683f23496c94e333a |     
  aarch64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/742e0f7a5bb95780a799d6ea116644aa0367bd38 |     
   armeb     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/ace36215812539dcf60cb08cdd418d9121290cb6 |     
microblazeel |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/263b135f8312839b61a2747b122c6cb2e23f8d9e |     
    mips     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/e375a5e2d10fda430b5d1aef283d70c2ce2843fb |     
    arc      |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/21a68484d299b5f6be0b748c08ef06788bec6bf4 |     
    arm      |       host-delve-1.22.1        | NOK | http://autobuild.buildroot.net/results/6965fc077c493bb5be90c663b3d7d18d22ee321c |     
  mips64el   |         host-go-1.22.3         | NOK | http://autobuild.buildroot.net/results/85e0df30b0f942940fc4a09511a0c08c0eca2795 |     
   mips64    |         host-go-1.22.3         | NOK | http://autobuild.buildroot.net/results/b25f278e4be6390de4c770ea167548d4a54f39e2 |     
  mips64el   |         host-go-1.22.3         | NOK | http://autobuild.buildroot.net/results/d3860eb26293d2fa08f72c4a93caf2a9c52e2f94 |     
    mips     | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/a43f7895612da03b4107053c22a0aa26561940e0 | ORPH
  sparc64    | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/969b49c08b2c463ed341c41449cb91e65a537d1b | ORPH
   mips64    | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/e48083e4280bfedc487ce27282cab059ebaf58a7 | ORPH
    sh4a     |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.net/results/b95977729e72036c4effa20cab2d3badaeb745da |     
   x86_64    |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.net/results/8a7871771cc72b7b4315d9464ac20daf7325728d |     
   arceb     |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/b8c37bcb08274224b042e7f8b8d7ca450e3f3755 | ORPH
  sparc64    |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/ba24e30fb28c44cdee9be3f739633bbe43526bd1 | ORPH
    m68k     |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/a745a3b36b9061034b6822f34a1f6cba559cf15e | ORPH
 aarch64_be  |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/686115c03710ad0e80b4fe8be5a4b5d013977886 | ORPH
  sparc64    |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/2ac06a4819104caba3b5db8a456bc2ce57635386 | ORPH
    i686     |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/b580f181a3bae54f14e6dac8286a53f24297aa81 | ORPH
    or1k     |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/8c7239deaaca6fcecc922493549df97249e780db | ORPH
    i686     |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/7926fc789d2d0e730fd32d3275d801eb7b5e16ae | ORPH
   armeb     |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/58f06390bf686cabe669f9807753755b044ea960 | ORPH
powerpc64le  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/43d2284e3ea58f6e21ab27dbe1061e8472e1b6f3 | ORPH
  mips64el   | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/f3ab7687bab567cc22b1256445a4dec5657112bf | ORPH
   mipsel    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/eb4777b13d76df66fb6601ad3178321809f7dda7 | ORPH
    arc      | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/46dd3576ec2846f510c726541631567032b17b9d | ORPH
   nios2     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/0a08f9fe1e92dbef920a9077d3297ee594401103 | ORPH
   nios2     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/f266b9d2d34a5d57b5947425660d962da57b6b42 | ORPH
   nios2     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/4054ecadd2c2b1e7412405483cef6df7c10e3e21 | ORPH
    or1k     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/2d2eeb5e759a42ff19270e9d29242dfe2493176e | ORPH
  sparc64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/6ce75205edf8f32bc0945b43421b35275937664b | ORPH
 microblaze  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/1f0352c076234de64ddf103c2e4afa90f5aee769 | ORPH
powerpc64le  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/e6ccd7e1ec6c90837255771714848282add9686f | ORPH
   nios2     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/f16d4ed634807baf834ff46af3e72c3e57f298ad | ORPH
  aarch64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/8218b140539e5c683050019743f9f715a8877828 | ORPH
   s390x     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/20a84319b003598d71d7aaddd146089275c03045 | ORPH
    i686     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/95f7880b7e6a155f61c4d710a1140422467c2a06 | ORPH
   s390x     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/5421b9413e5160bdca271d318f2ff3bc02fb389d | ORPH
 microblaze  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/a260e88cc1f73514275dd36f36a31f9288af54d1 | ORPH
  sparc64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/4a9027a797f060915e51c8ed7f70d24c5152b830 | ORPH
powerpc64le  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/3151dd74a5399c005a9302c560aca6c87491caa2 | ORPH
    mips     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/5ea20e9391089655ac54382b68d42f1631faaedb | ORPH
   s390x     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/ef826e0a0a602b0d4e97f2597a1616802d2a2508 | ORPH
powerpc64le  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/e7ca063739c0bac241d9a056f2791c66deea4fe1 | ORPH
    or1k     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/c84307f73fae884aba399336b7c1b996e45b474a | ORPH
    mips     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/faeb85114f6205460fc6a401e3bb912c8589fc4f | ORPH
  sparc64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/d2cb112d4b1fe8d8e153bccf81653c0afbc517a2 | ORPH
 microblaze  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/ed2cb6992f699662a0824ca0df19a23fc4835d5b | ORPH
   sh4eb     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/1b5530e4d4c061d9e3009638f20213bcaa50303f | ORPH
powerpc64le  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/fcdf35cdc58c4e18f955e6f6c4e0db8fd024fe2a | ORPH
  sparc64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/333245e29c704804ad9e3beb456b9fe2294cbe69 | ORPH
microblazeel | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/9676acde174e72fb064c7448a46c335ba3b14a4a | ORPH
  aarch64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/1de7fa7912e0cca949e7e36bf36a3d6cfdb175ca | ORPH
microblazeel | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/1a37067e050998316bd8899409cdca5a6b8aa5d6 | ORPH
   x86_64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/3ac888c233fd28355751d2da3d013c1d8c47b5c3 | ORPH
 microblaze  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/dadab001fe8e41d17d0e48d4382d87799f3179d7 | ORPH
   nios2     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/64928514485ce321c317fc263e2cae716f1ff3ea | ORPH
    or1k     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/c39d3d20a28b16d51cedf02387cf423c129be867 | ORPH
   x86_64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/c372d0bb165e369c9e0825f9b5f473c657bc0aaa | ORPH
    or1k     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/dce308ca04b58e2e7e3ef3d69e4394c16437c00e | ORPH
    i686     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/f7905c5d295bcf479ed8a7e9c8f7ba10ca6dd625 | ORPH
  powerpc    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/2647220a509302e3b464f23994504a70a3ac922c | ORPH
  riscv32    |     host-python-lxml-5.1.0     | NOK | http://autobuild.buildroot.net/results/4ec1fafb2452f45c5dbf37b96fe1a58bda487715 |     
   sparc     |     host-python-lxml-5.1.0     | NOK | http://autobuild.buildroot.net/results/f2de2fa48fb38bb9b78571115850f6a26d07fe56 |     
    arc      |     host-python-lxml-5.1.0     | NOK | http://autobuild.buildroot.net/results/34fafb8a147ecad8b23117c0cdd1500c4a0c09b0 |     
   armeb     |     host-python-lxml-5.1.0     | NOK | http://autobuild.buildroot.net/results/bb9e40300dd7ac639d2373f8a930abe3d8fb3851 |     
  powerpc    |     host-python-lxml-5.1.0     | NOK | http://autobuild.buildroot.net/results/bc344a52261ccfce961d2a01effef573a708d44d |     
   arceb     |     host-python-lxml-5.1.0     | NOK | http://autobuild.buildroot.net/results/d6d71479a24ed4409353c658741d016b6da341d8 |     
   mips64    |     host-python-lxml-5.1.0     | NOK | http://autobuild.buildroot.net/results/f32d8567de4cad8f891119cb7f21a94e84f06e86 |     
    mips     |     host-python-lxml-5.1.0     | NOK | http://autobuild.buildroot.net/results/dc9f40b141ac69958785812aad4f38c0eb8bc4e7 |     
    arm      |     host-python-lxml-5.1.0     | NOK | http://autobuild.buildroot.net/results/daafd837d437a58fb90d52a6ae56e338cdfb5740 |     
  mips64el   |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/7520fd32fafb8f07ec7cf80edabeda4710e8450b |     
  aarch64    |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/085cc938d1208407867a64e7b37da02d2c726e5e |     
  riscv64    |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/8113558e9440c40d575cf9494966ba329ee84522 |     
  mips64el   |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/c82fc1bcf3d7a85910c2480ac72b551155256982 |     
   mips64    |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/7528ab3e417c05d2a02d2d2517fb33bb9ab0a8f8 |     
    sh4a     |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/2416cc6d76bde29700bf7b2becff1432f9adab87 |     
    arc      |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/eca7e0c4dca408c19f60c9b026497b9e01486385 |     
   s390x     |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/9fc4da63b2006a09dfdc86c8047ad2c07f075877 |     
   armeb     |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/d21f0ce0ac8c89cbf2eebfbea598e83e8c913e88 |     
   xtensa    |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/7960badb2472f3fbc0a74b90c44e22cbe766f0c2 |     
   mipsel    |       host-vala-0.56.14        | NOK | http://autobuild.buildroot.net/results/74b5110d56366dbb178f06413840aad90b545f8a | ORPH
    or1k     |       host-vala-0.56.14        | NOK | http://autobuild.buildroot.net/results/9e5339183c41df412a47c71ff1ea848048b04120 | ORPH
    i686     |       host-vala-0.56.14        | NOK | http://autobuild.buildroot.net/results/da43c1afecf900474e14c4131f0718e0e7d2a74a | ORPH
   sh4aeb    |       host-vala-0.56.14        | NOK | http://autobuild.buildroot.net/results/5f1c57ce8d34daf76024e3161b2a2551f03e5731 | ORPH
   mipsel    |       host-vala-0.56.14        | NOK | http://autobuild.buildroot.net/results/fbdf348b219fd1879ddad348c12f0d82279bda07 | ORPH
   x86_64    |       host-vala-0.56.14        | NOK | http://autobuild.buildroot.net/results/c8969cf174547012aa8e9d9093cf09846095eb08 | ORPH
  sparc64    | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/d655c456e8ef5c9f822abd58c8f72ef01860c349 |     
    sh4      | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/2a9f6701c9f315666c6316a2cd1efc6703048391 |     
  aarch64    |           htop-3.3.0           | NOK | http://autobuild.buildroot.net/results/23096962e74e0ff22421672cc23ab77bf927c7ef | ORPH
   sparc     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/7c295dd4f38e85e8b1b0219274400eb74044181d |     
 microblaze  | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/288afb02dc53111f116f4d922f2626387372b70a |     
   s390x     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/cc373eef08110fcfdc1a648dffbd828e0be17b31 |     
  aarch64    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/2320b7ec55163b8f4a33dbaaf2eefa910556f706 |     
   sparc     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/190f1ca7bc5f8c15ec8a599127fcc3db11bfaf2d |     
  sparc64    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/f846177d0cd8b71d2b1fc4ce6d386628df34c805 |     
  sparc64    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/498b73a7cc50e338ef3265721a3ebd564d96697e |     
   nios2     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/0b441e7f7f36f506bc012e06b435b873df892cf0 |     
    arm      | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/dcf27ff172dce1b5e313afa808d14688aca7e7b1 |     
  powerpc    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/a28201c40604cf8ccd91fd05953e55c78bdf1b27 |     
    m68k     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/811d07ca2b717b6a406355ffd5680ac7687d6e69 |     
   xtensa    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/0ac28b79b76e2fa93abd3a050324b7dfaae7db05 |     
    arm      | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/0d0178759a344f09db6b84f0fbf6f9d8545b307c |     
   s390x     |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.net/results/087a30030f936d4f79fa8f232a8a1b8122e68545 |     
   armeb     |          kexec-2.0.28          | NOK | http://autobuild.buildroot.net/results/cecb7287b397925d102deeff0ddc83d72e491770 |     
powerpc64le  |        libarchive-3.7.4        | NOK | http://autobuild.buildroot.net/results/7f4949d3c80e3f3f7d4929923c8ee065fd2e6a09 |     
powerpc64le  |        libarchive-3.7.4        | NOK | http://autobuild.buildroot.net/results/8e41ed0c60a54ae568a417f3f76406e6d6d803fa |     
  powerpc    |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/ac374bd97efcc76a60790ea393bf95ec1faec1ba |     
  aarch64    |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/13afe7b7154b90cb1287d965f0b4016326484602 |     
   sparc     |         libdrm-2.4.120         | NOK | http://autobuild.buildroot.net/results/af526dd7768759551aaa39e7195cf71f0987f81d |     
   x86_64    |       libfreefare-0.4.0        | NOK | http://autobuild.buildroot.net/results/c7ac9025e5317fa991ccc983727dad7ba562eb94 |     
    arc      |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/feedbc1c2da563cb3c9556041b151d1bc40a0122 |     
   arceb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/4a1112dacf11bdd1937ba7ba6bb4e160b5a92aec |     
microblazeel |        libopenssl-3.3.0        | NOK | http://autobuild.buildroot.net/results/7d5b5121780ba4bdc8a9a69a6bababc23895780e | ORPH
microblazeel |        libopenssl-3.3.0        | NOK | http://autobuild.buildroot.net/results/0e512448ae3b68bb8fa73cd48443a7df458cc32b | ORPH
  riscv32    |        libopenssl-3.3.0        | NOK | http://autobuild.buildroot.net/results/2663ad25de53a2407ffc5abc392e3628b6fa33fc | ORPH
  riscv32    |        libopenssl-3.3.0        | NOK | http://autobuild.buildroot.net/results/82fb0f30082d839f742189c08ba49ba7de3ce2af | ORPH
   s390x     |         libp11-0.4.12          | NOK | http://autobuild.buildroot.net/results/997fc9a849b76c05d1b837ec76ce378cc5dc01d1 | ORPH
   arceb     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/7da20f422edb37e22edd6748a3610960734d40cf | ORPH
    arc      |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/d40b66ee8eb270149534d1b3e0e54bd0a6581c98 | ORPH
microblazeel |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/f74ab7c5d2fa94e0f296e55c2b245d8db3c5cdd2 | ORPH
   s390x     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/fcea7965f319a89d8ae24335136fe1c6f9e2efdc | ORPH
   sparc     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/e474e03e52395aa74d3bd7c1416adec151517bf9 | ORPH
   arceb     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/3d55e90c941d52b317d9776b14cf1005db749e7d | ORPH
   sh4eb     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/1eae8a7afb1cff58cb2dc8b217579aa066deb07c | ORPH
 microblaze  |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/f1e20979bb3f6665078377f2d5c8973c034613f2 | ORPH
    arc      |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/aaa4322d61c844a055180e7466982f4050cb3802 | ORPH
   sparc     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/60210d7ed872e27013da2fec4ebc1b1db46e6ba7 | ORPH
   nios2     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/c40d08c1685a351c4e93b2f29f143b18abf21396 | ORPH
   sparc     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/170c870d7b79a1c892b72b814a32defd9831ec43 | ORPH
microblazeel |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/f7879043c4a5575c9945b4f9f528b27721be654d | ORPH
 microblaze  |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/742e524992d7b739d26085fd018f27d2654cf8ca | ORPH
   nios2     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/8b249d79f07a474ed5ad433cd9296e83ce2a6e4f | ORPH
  riscv32    |          libsepol-3.6          | NOK | http://autobuild.buildroot.net/results/265ba64943b2ab3a95c0669f2161dab0c499521b |     
    i686     |      libzenoh-c-0.11.0.2       | NOK | http://autobuild.buildroot.net/results/d0000c5a674687c147316dac1c02bf1e394330e2 |     
  sparc64    |      libzenoh-c-0.11.0.2       | NOK | http://autobuild.buildroot.net/results/d9258048e216501440d3a9d66e80c32336a653a3 |     
 powerpc64   |      libzenoh-c-0.11.0.2       | NOK | http://autobuild.buildroot.net/results/4342c93e8b2bbf92431c79f25f029f25bb8bace0 |     
    mips     |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/648cda79addf5e9efc0537b1060d7bc6b17a698f | ORPH
    arc      |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/f4758d492d8cb973e9169bcac4ed71b6e68d0828 | ORPH
   nios2     |          linux-6.8.12          | NOK | http://autobuild.buildroot.net/results/552e32f0cbcf31f11cb5ac3e91c99fb12d56f42e | ORPH
    arm      |          linux-6.8.12          | NOK | http://autobuild.buildroot.net/results/0df59c29fbe69f16cf12e69f1999f0e045f84be7 | ORPH
   mips64    |          linux-6.8.12          | NOK | http://autobuild.buildroot.net/results/783516b7e64eb03ff2b7eb732436e1d2c429f02e | ORPH
    mips     |          linux-6.8.12          | NOK | http://autobuild.buildroot.net/results/6ddf37ca11c87581d71b26c70131af6a830927d2 | ORPH
   mips64    |          linux-tools           | NOK | http://autobuild.buildroot.net/results/ac856dd0ef3a1bf9d7f89a8a735652046f387cb5 | ORPH
   x86_64    |     ltp-testsuite-20240129     | NOK | http://autobuild.buildroot.net/results/1dbd20fbe8a587a2660e3ba7ab2c0f0f254686e5 |     
   x86_64    |     ltp-testsuite-20240129     | NOK | http://autobuild.buildroot.net/results/2e9d5dc3f70cdc3432d5521189a078059e5f9a52 |     
 aarch64_be  |           lxc-5.0.3            | NOK | http://autobuild.buildroot.net/results/94fd43b99076ccaf7d1f751d4f5830db2fb18fce |     
  riscv32    |           lzop-1.04            | NOK | http://autobuild.buildroot.net/results/68df52d3c1da1cc5c8855a89dd8bee94fdad5f0d |     
   sparc     |        mariadb-10.11.6         | NOK | http://autobuild.buildroot.net/results/616958cbf03d96028e0017cb8c83003fb789f253 | ORPH
  powerpc    |      mediastreamer-4.4.8       | NOK | http://autobuild.buildroot.net/results/9243af2a72f275d30859c6e80e5db8ed79e47f51 | ORPH
    m68k     |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/135a198b15e233ca4d3e45c0d00b2bf102ff556f |     
  mips64el   |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/9999b2a59e7c63bd55a66c964976b05e26429d4d |     
    or1k     |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/79b1ef5b5046296938296b2c8d948dfe8e65dae8 |     
 aarch64_be  |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/6a0e49247ab0f5d7bb950df240b9cb7e5bc1d2c0 |     
   s390x     |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/41b2f1fbe0b83205b2cdd6d48d3bea23869fea11 |     
microblazeel |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/54d2975b009738cf7023b7f62ead267abf3bd5e8 |     
  aarch64    |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/405a5e212354c2f7ddac5dbfe5d87e12cadfcf5b |     
 powerpc64   |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/56fd2f1a02fa561632b7858a635241518a109e1e |     
  riscv64    |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/2c0412550d2230e21d07a24baf45374ad1fd733c |     
    m68k     |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/3c695edfec60f56c6543b5a4b10e2d562008fa0a |     
   nios2     |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/75de78941af563a8525bae55df2db5fea6f9ea38 |     
   x86_64    |      ncurses-6.4-20230603      | NOK | http://autobuild.buildroot.net/results/48485fd011e1a9355d5d9d4fa0ff60fb161c7931 | ORPH
  mips64el   |         opencv3-3.4.19         | NOK | http://autobuild.buildroot.net/results/46ce5d94aa5e47d5abac08c00e234793db7b2f2d |     
powerpc64le  |         openssh-9.7p1          | NOK | http://autobuild.buildroot.net/results/f4285b7dd34355ac6916ff934ef5b0171604d9db | ORPH
   mips64    |         openssh-9.7p1          | NOK | http://autobuild.buildroot.net/results/775045eb553638314a3a83bf5ee55f19eb48b22d | ORPH
 microblaze  |         p11-kit-0.25.3         | NOK | http://autobuild.buildroot.net/results/4db3e8855b4305001d63dbf2a782c9561046091a | ORPH
    sh4a     |           php-8.3.7            | NOK | http://autobuild.buildroot.net/results/3fa9dd36a78fddde75fd45dbf15f7f1a332c2a94 |     
  sparc64    | pppd-e1266c76d1ad39f98f1167... | NOK | http://autobuild.buildroot.net/results/742abfcf5ef79cb5b9e85962d2a94cda46439961 |     
  sparc64    | pppd-e1266c76d1ad39f98f1167... | NOK | http://autobuild.buildroot.net/results/69ca1aacf7f3c1d9e7432210e7301dd0be278307 |     
    mips     |        procps-ng-3.3.17        | NOK | http://autobuild.buildroot.net/results/0a5199daf5c71d7029e6f486251a877a71b2ace3 | ORPH
 powerpc64   |        procps-ng-3.3.17        | NOK | http://autobuild.buildroot.net/results/10e9e0a1758e866aec77c12a9ab829b90f738c08 | ORPH
    arm      |        procps-ng-3.3.17        | NOK | http://autobuild.buildroot.net/results/af628ddf83c904859a6a08fd28f926db52c22132 | ORPH
   mips64    |           proj-9.3.0           | NOK | http://autobuild.buildroot.net/results/70300ec0c046056de9ed61843fceb720c97c0810 |     
    i686     |      python-grpcio-1.60.0      | NOK | http://autobuild.buildroot.net/results/5beba2513073428b9efe9fef4101d64b44b86c59 |     
    i686     |      python-grpcio-1.60.0      | NOK | http://autobuild.buildroot.net/results/daf124ac35f8bfa7d084ad8bfcf2853a641bedf1 |     
microblazeel |     python-remi-2022.7.27      | NOK | http://autobuild.buildroot.net/results/66b699d8ab75b50d52ef6a92ebb3bd72d8991b77 |     
    arc      |       python-sip-4.19.25       | NOK | http://autobuild.buildroot.net/results/bb9a09b6ed2d6438468e1e30a9a7b4593a7474a0 |     
    or1k     |        skalibs-2.12.0.1        | NOK | http://autobuild.buildroot.net/results/051fcb4030409992f7943c4beb7d586f6194b570 |     
   arceb     |       sofia-sip-1.13.17        | NOK | http://autobuild.buildroot.net/results/a16358a9401461d9297f561e4f2edab6a5224413 |     
   sparc     |            tar-1.35            | NOK | http://autobuild.buildroot.net/results/4b4f770cd3f375902804097254175efa467b8386 | ORPH
    or1k     |         uclibc-1.0.48          | NOK | http://autobuild.buildroot.net/results/a0ced2795040cec46d03ecfcdce94b11d841dd84 |     
 aarch64_be  |            unknown             | NOK | http://autobuild.buildroot.net/results/976cc680e2de8cbce0460ef648ec341b138bd0ac |     
    arm      |       util-linux-2.39.3        | NOK | http://autobuild.buildroot.net/results/85e195515519c0d2e6415fecf782b63d8692e795 | ORPH
powerpc64le  |         x11vnc-0.9.16          | NOK | http://autobuild.buildroot.net/results/248472f1dc4f3eb97d69ede97212d1eda5b3c134 |     
    or1k     |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/75279f39f9b302190a58877218012a735181b895 |     
   x86_64    |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/d4c7be43bf3d14cf88c65f6c7f8c96f98ebb8e04 |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

                elfutils-0.189 | 1 
               mariadb-10.11.6 | 1 
         multipath-tools-0.9.7 | 1 
      qt5webkit-5.212.0-alpha4 | 1 
                    zeek-4.1.1 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/a9ffb9b74cf6c5210c05eedb87e2e2aba32dbeb6 | ORPH
    mips     |        mariadb-10.11.6         | NOK | http://autobuild.buildroot.net/results/362febab71e2cfd27dddd4d8dc0f15ea2b858305 | ORPH
  mips64el   |     multipath-tools-0.9.7      | NOK | http://autobuild.buildroot.net/results/ece4bdc7b09a4fcd24e3c53bf3bbe1ba79a6fe57 |     
   mipsel    |    qt5webkit-5.212.0-alpha4    | NOK | http://autobuild.buildroot.net/results/4ede34dee5b4d95a895085627157c122970443a4 |     
    mips     |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/155adbf7b23256999384f9b6818f728c4e962116 |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
