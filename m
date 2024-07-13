Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4D03C3DA42
	for <buildroot@archiver.kernel.org>; Sat, 13 Jul 2024 05:10:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 882AE608EA;
	Sat, 13 Jul 2024 05:10:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mgroROTuPsNd; Sat, 13 Jul 2024 05:10:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C7D7A606CB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C7D7A606CB;
	Sat, 13 Jul 2024 05:10:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 11A881BF86D
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 05:10:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E5EEF413E5
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 05:10:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IwAL_FXq0PLy for <buildroot@lists.busybox.net>;
 Sat, 13 Jul 2024 05:10:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::226;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 23ED14133F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 23ED14133F
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 23ED14133F
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 05:10:11 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A54C5C0002
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 05:10:08 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sat, 13 Jul 2024 05:10:08 -0000
X-GND-Sasl: bot@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1720847408; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=BSd4huO1gQgLZ6DxKaYrZMR0/W75K/81bBmWMZ91e3g=;
 b=aDcjwY+1OzkGSGrpnwqQhixn2kurL0hqIjlM0EvqUVsncQh0BVp3HIebfVXgz1DnXquMOT
 pbXd4+dqs6nI3xkwEOBXsAbVtwFZdy8owpWKSJodIUP/Gc0nHumpgqAx7JlwZWOqW4iwmQ
 jQS1jKMR36v/RfJi0Luunzyxgh03yLKXpyxmzoCKdPhvX6aSQJF51xQx++0cuNpaxfAKsl
 50ag9SU1Yl9OfhxtqhSOsNvahJAz3LPR1uUwlrme3SHSWfHKLZPM4xX0j1ZDnpuXSHcvVh
 f1cMukaFyVXctfccS+Rcvu1lihpbrSWtd0D34+1lvVyShedQb/U1ZtFcQZM5Pw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=aDcjwY+1
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2024-07-12
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
Message-ID: <20240713051008.WiA1n4UUYh7pNqIwE407WQ74UMzM5pdK0mfPQGXjmgc@z>

Hello,

Autobuild statistics for 2024-07-12
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  4  |  4  |  0  |  8  |
  2024.05.x  |  7  |  9  |  0  | 16  |
    master   | 96  | 452 |  0  | 548 |

Classification of failures by reason for master
-----------------------------------------------

                    zstd-1.5.6 | 67
host-prelink-cross-a853a5d7... | 39
            host-cdrkit-1.1.11 | 36
                libressl-3.8.4 | 24
libsvgtiny-ea9d99fc8b231c22... | 16
host-prelink-cross-440c0059... | 12
               cracklib-2.9.11 | 11
                   host-go-src | 10
                elfutils-0.189 | 9 
                   evemu-2.7.0 | 9 
                    mpir-3.0.0 | 9 
                   linux-6.9.8 | 8 
                  ffmpeg-6.1.1 | 7 
host-android-tools-4.2.2+gi... | 7 
android-tools-4.2.2+git2013... | 6 
ibm-sw-tpm2-5452af422edeff7... | 6 
aer-inject-9bd5e2c7886fca72... | 5 
                  bcusdk-0.0.5 | 5 
                host-odb-2.4.0 | 5 
               libglib2-2.76.1 | 5 
                fail2ban-1.0.2 | 4 
                gnu-efi-3.0.18 | 4 
                   httping-2.5 | 4 
               linux-pam-1.6.1 | 4 
edid-decode-6f117a8f8c0e76e... | 3 
                   foot-1.16.2 | 3 
glibc-2.39-74-g198632a05f6c... | 3 
         host-libxcrypt-4.4.36 | 3 
host-vboot-utils-bbdd62f9b0... | 3 
              libarchive-3.7.4 | 3 
                  libffi-3.4.6 | 3 
                 libp11-0.4.12 | 3 
                python3-3.12.4 | 3 
                unbound-1.19.1 | 3 
                     apr-1.7.2 | 2 
     bandwidthd-2.0.1-auto-r11 | 2 
check-11970a7e112dfe243a2e6... | 2 
                 dhcp-4.4.3-P1 | 2 
                     file-5.45 | 2 
                gerbera-1.12.1 | 2 
  gobject-introspection-1.76.1 | 2 
         host-gcc-final-12.3.0 | 2 
                  jack2-1.9.22 | 2 
                libxml2-2.12.6 | 2 
       linux-firmware-20240410 | 2 
ltrace-82c66409c7a93ca6ad2e... | 2 
                  mender-3.4.0 | 2 
                    mpv-0.35.1 | 2 
                     mtd-2.2.0 | 2 
                  ntp-4.2.8p18 | 2 
                   oatpp-1.3.0 | 2 
         python-remi-2022.7.27 | 2 
                    rtty-8.1.0 | 2 
tftpd-e52af4207a6e09a1ba21f... | 2 
              udpcast-20230924 | 2 
                       unknown | 2 
                      xz-5.6.2 | 2 
                  zabbix-6.2.7 | 2 
                 apache-2.4.61 | 1 
                 augeas-1.12.0 | 1 
                     avahi-0.8 | 1 
                beecrypt-4.2.1 | 1 
                   bird-2.0.12 | 1 
                  boost-1.83.0 | 1 
brcm-patchram-plus-95b7b691... | 1 
                    brltty-6.6 | 1 
              cache-calibrator | 1 
                  cairo-1.17.4 | 1 
                 coreutils-9.3 | 1 
                     crun-1.12 | 1 
                   cvs-1.12.13 | 1 
                   dhrystone-2 | 1 
                  dump1090-9.0 | 1 
                  eudev-3.2.14 | 1 
              fluent-bit-3.0.4 | 1 
                    frotz-2.54 | 1 
                     frr-8.5.4 | 1 
fs/romfs/romfs.mk:32: /home... | 1 
           ghostscript-10.03.1 | 1 
               gptfdisk-1.0.10 | 1 
         host-gcc-final-13.3.0 | 1 
           host-gengetopt-2.23 | 1 
igh-ethercat-f5dc109176400f... | 1 
                       kmod-31 | 1 
          libcamera-apps-1.2.1 | 1 
                 libcurl-8.8.0 | 1 
                  libdex-0.6.1 | 1 
libdill-32d0e8b733416208e04... | 1 
                libglvnd-1.4.0 | 1 
              libopenssl-3.3.1 | 1 
     libphidget-2.1.9.20190409 | 1 
                libvips-8.10.6 | 1 
               lighttpd-1.4.76 | 1 
          linux-5.10.162-cip24 | 1 
                   linux-tools | 1 
                  linuxptp-4.2 | 1 
                   luvi-2.14.0 | 1 
               mariadb-10.11.6 | 1 
           mediastreamer-4.4.8 | 1 
                    ncmpc-0.49 | 1 
               openblas-0.3.27 | 1 
                 openssh-9.8p1 | 1 
               pcsc-lite-2.1.0 | 1 
                     php-8.3.9 | 1 
                    proj-9.3.0 | 1 
python-unittest-xml-reporti... | 1 
                rdesktop-1.9.0 | 1 
                 rrdtool-1.8.0 | 1 
                s6-dns-2.3.7.1 | 1 
                  screen-4.9.1 | 1 
                     shim-15.8 | 1 
                softhsm2-2.6.1 | 1 
             stress-ng-0.17.07 | 1 
             strongswan-5.9.13 | 1 
                tpm2-tss-3.2.2 | 1 
                   trinity-1.9 | 1 
               valgrind-3.22.0 | 1 
                    volk-3.0.0 | 1 
                 watchdog-5.16 | 1 
                 zlib-ng-2.1.6 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  sparc64    | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/33822f23d8015ef9d471af9e9025bb09f94b051f | ORPH
   s390x     | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/9105b6a2b24657e80576fc83497b8a713518c450 | ORPH
   nios2     | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/4d24005afd542ffba48a36c9e111b7721eb888c3 | ORPH
  sparc64    | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/0d10f8abadf86834bd28200bb3c8dae8e06f8a57 | ORPH
   sparc     | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/f41efe9f65d4d3ff115d9ea92cba3a6674c64cc9 | ORPH
   mips64    | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/5164a4078bc63e0abc34740498e58cf0081e7801 |     
   nios2     | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/55d51eed7f2f7d285f7690a81178785b817c58ce |     
   armeb     | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/51c10d53f835a5045a819bc84e906edb7dcf9f15 |     
    arm      | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/6e3feb403a3c97db4f5234759ed397d8280a630a |     
powerpc64le  | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/fcc4bc811206da9a929617856f41c23f626857cc |     
    mips     | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/df9bfee7b49b9f938dc65cfe3332a0000793785c |     
   mips64    |         apache-2.4.61          | NOK | http://autobuild.buildroot.net/results/2e48158c9dfd76b0e0034c152ff9efbe5aa13a26 |     
    sh4      |           apr-1.7.2            | NOK | http://autobuild.buildroot.net/results/54c2ce9651dbbcdf6be3c74ea5759847a8130547 |     
 aarch64_be  |           apr-1.7.2            | NOK | http://autobuild.buildroot.net/results/18fcc0083a1e5eb7d260a1a094c3e81de3abb625 |     
   mips64    |         augeas-1.12.0          | NOK | http://autobuild.buildroot.net/results/1420ad701d19a3dc4f057fdbbbbfa826d3bc656f | ORPH
  sparc64    |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/13ce68095ee7f5bb63b218f45adb3da5ab7d51d1 | ORPH
   sparc     |   bandwidthd-2.0.1-auto-r11    | NOK | http://autobuild.buildroot.net/results/d0aba01b9020d46af1a31aca99c793884c7a4556 |     
  aarch64    |   bandwidthd-2.0.1-auto-r11    | NOK | http://autobuild.buildroot.net/results/db6755a7cc46879154e3aba2b23ce9e4a0c82a70 |     
   s390x     |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/07703c61004d7a4f28b8325e873a1efd6ddd04fb |     
microblazeel |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/ee4dd55c88b2be08e36bc8531a338333b7e48d2d |     
    or1k     |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/6c7111ea59354158152b9fe2a27a06a4c2bdcdc8 |     
  aarch64    |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/ea1f5a5f62891cdfab0b76f86437c5aad48d2cc5 |     
  sparc64    |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/8a87537ec29ec44d85010c95393498708ae25b4d |     
    i686     |         beecrypt-4.2.1         | NOK | http://autobuild.buildroot.net/results/e2ff4df13f13070916c4521e64e600dcc2fd8a95 |     
   mipsel    |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/62324ddae8ed4eccc36c6a7a2d7e3607c35bfc6c |     
   sh4aeb    |          boost-1.83.0          | NOK | http://autobuild.buildroot.net/results/4a356725e4e7da1d3fa2fa8dd855542438e81324 |     
  powerpc    | brcm-patchram-plus-95b7b691... | NOK | http://autobuild.buildroot.net/results/5b6cac0e2d1704fd82413630ab67afd617f4245d |     
    mips     |           brltty-6.6           | NOK | http://autobuild.buildroot.net/results/166bb5de641d160c2bf68482f4cb6475d691e673 |     
   mips64    |        cache-calibrator        | NOK | http://autobuild.buildroot.net/results/2ae522fc7a173118bd907e1bf0bcca8360078810 |     
   mips64    |          cairo-1.17.4          | NOK | http://autobuild.buildroot.net/results/b1e05beac529cb57ab775eaaeb6f47d10338dfcf |     
   mips64    | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/23277969e38f75a8208825ad3adb493e265f2524 | ORPH
   sparc     | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/d4a1c6d49dd15ce6b73cfade2557d49733e9318b | ORPH
    sh4      |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/e3dbe8f41bd70a1206461455bb30f25603f3f619 | ORPH
 aarch64_be  |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/54608aecf8e0642abe213d4353c8bc1d6a289dc4 |     
   sh4aeb    |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/75e927e85249f2e500a8f85e8c3ae107f71d9e73 |     
microblazeel |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/48f637198c5a3daa100e657f6b0219602f57342e |     
  sparc64    |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/0dd815bad602c07ea7bb4b132f94e071cf944b38 |     
powerpc64le  |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/0c633cf161d2c6e5317c32cf2c620088f3e83edf |     
 aarch64_be  |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/de975acec6cf4ca249f22b03fac52b64c6ed62bd |     
    arm      |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/03c1e0813e3ee88554983decb10d18d268532352 |     
   nios2     |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/c6fc430b141051e98cb8fbe4b7df076359fc4f31 |     
   nios2     |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/83e7a531cde9206bbe3b19711ab2650caa9ffffe |     
   mipsel    |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/bafa2be0cebcf35ca5d3b4db598574204f6bb21d |     
   sh4aeb    |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/fa53a9ed4476ddd61ec5f1e77db6d23411a0c62d |     
  mips64el   |           crun-1.12            | NOK | http://autobuild.buildroot.net/results/022727f468e07e0c04523c84833de375aa2fe12a |     
powerpc64le  |          cvs-1.12.13           | NOK | http://autobuild.buildroot.net/results/584e0218efafd3e348ec3e6331e28abff869f556 | ORPH
   xtensa    |         dhcp-4.4.3-P1          | NOK | http://autobuild.buildroot.net/results/be6c42085fcbcb4634b38c05f230879c0b0e3e33 | ORPH
   sh4aeb    |         dhcp-4.4.3-P1          | NOK | http://autobuild.buildroot.net/results/32a98595b31d6abc7477b2acfd21732efd727119 | ORPH
   sparc     |          dhrystone-2           | NOK | http://autobuild.buildroot.net/results/96078ec1dad71b9ed979597356d2a53d637c1247 | ORPH
   armeb     |          dump1090-9.0          | NOK | http://autobuild.buildroot.net/results/d7bcd2b67bb25cab5d9611d799804772761f6968 |     
  riscv64    | edid-decode-6f117a8f8c0e76e... | NOK | http://autobuild.buildroot.net/results/d7fb122183d9c99d0951424585b6fd3539d8940a | ORPH
  aarch64    | edid-decode-6f117a8f8c0e76e... | NOK | http://autobuild.buildroot.net/results/c6084a202dfe957cc1943b6c59bc04c2735a8f89 | ORPH
 aarch64_be  | edid-decode-6f117a8f8c0e76e... | NOK | http://autobuild.buildroot.net/results/22f9d8bcdb7d83ed26c77849b2bd545fc4ec2e89 | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/5dd11840cf133218b6e413c6a1affe1da1c755ff | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/d7a3a5cd23836593187083ec19c512c8befc3fee | ORPH
   mips64    |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/924fce4a4283df627dcf3e511eb3856055e738df | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/fb1c7aec4e0c6409fbab489ccf1b2a41186a3c17 | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/d60c8a754afec069df337a1b97c9200780f6e2ca | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/a002e127a75333d931d36a261105418d0576c6a0 | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/e37a2d0ee5d1ca452dae85826e57b9e3d58e2ec6 | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/333fa9d9e0ab879c91f06c180fc699cf5be4256b | ORPH
   armeb     |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/9388ac608b350f6b8662e0d663c1420a5fe4f9e0 | ORPH
   arceb     |          eudev-3.2.14          | NOK | http://autobuild.buildroot.net/results/557c2739192f73a720054fbc4f64c0a35fad692b |     
 powerpc64   |          evemu-2.7.0           | NOK | http://autobuild.buildroot.net/results/565865c559033b86b4cb8680a613d4c9ab071f21 |     
    arm      |          evemu-2.7.0           | NOK | http://autobuild.buildroot.net/results/9d54e4054bbde2451ab9fd621cfb4b40c13aa813 |     
    mips     |          evemu-2.7.0           | NOK | http://autobuild.buildroot.net/results/4efd125d8ceb22bcf2ff637a80cab37760866c50 |     
powerpc64le  |          evemu-2.7.0           | NOK | http://autobuild.buildroot.net/results/173859b4405276e72ba67f82404b67960e91e243 |     
 microblaze  |          evemu-2.7.0           | NOK | http://autobuild.buildroot.net/results/d98702e8a862e65066c35cab1d331c25b6b2ea9f |     
powerpc64le  |          evemu-2.7.0           | NOK | http://autobuild.buildroot.net/results/5ae4179831f27050c1fd66c2479f5d5d59812622 |     
powerpc64le  |          evemu-2.7.0           | NOK | http://autobuild.buildroot.net/results/44da65d33ace3dc971ae4f7aa6e1833f9a81d48b |     
   mipsel    |          evemu-2.7.0           | NOK | http://autobuild.buildroot.net/results/b66e098e6e1a4bc32dbe704c24b79fc0c6c80496 |     
   nios2     |          evemu-2.7.0           | NOK | http://autobuild.buildroot.net/results/fe4df47347dd2c9133139e4cdda3a1423889a509 |     
powerpc64le  |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/0bd27d2016d389d1b970765bc1eaffd494217425 |     
   sh4aeb    |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/82e49034cce3db4966a5dbe67c5c832b552754ed |     
 aarch64_be  |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/4ebb91951bf182263f11f5cb0529bb63e9b1d5a9 |     
  sparc64    |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/3361467a011517cebd9fe2929c4e341f511e130a |     
    arc      |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/c07b14a9376f12d9f3efb50e7bbc142413369d2c |     
microblazeel |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/73fbe931b0ffc764ae29896cdfc06d0f7c330cc4 |     
 microblaze  |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/2abee4c6e30f95ea6eefb33f033c1ee738d67a5e |     
   arceb     |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/3c507495f0a922e4d91b54f3fccef3a6c5f39bc3 |     
microblazeel |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/1924399eabf1b41ec159c9b9741e5b2c0521db71 |     
   arceb     |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/eacc5ef5c367145d67a7337e011528dc0972eda9 |     
microblazeel |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/39ffad6cf691abc181974be6471b30279decdea8 |     
  mips64el   |           file-5.45            | NOK | http://autobuild.buildroot.net/results/60d59b0f8f56ae4755472c4fd099ac5ae1a9c55b | ORPH
   armeb     |           file-5.45            | NOK | http://autobuild.buildroot.net/results/c850a021c650ab20b7fdfdf48df83e18e402ff4c | ORPH
    arc      |        fluent-bit-3.0.4        | NOK | http://autobuild.buildroot.net/results/5dc4182b4fd64a03d588044cf9f262d8e052f294 |     
    mips     |          foot-1.16.2           | NOK | http://autobuild.buildroot.net/results/800d17e5b51d97dbbbf443805fa825de121add8a |     
  mips64el   |          foot-1.16.2           | NOK | http://autobuild.buildroot.net/results/f583d37ccb1ff5f59e420efd49a04216e5e0eee4 |     
   nios2     |          foot-1.16.2           | NOK | http://autobuild.buildroot.net/results/72088c5297a16950b2870a840670048bddc42f8b |     
   x86_64    |           frotz-2.54           | NOK | http://autobuild.buildroot.net/results/dcec31d18bffb2a8f9a31b32c40d5efce32a678d |     
    arc      |           frr-8.5.4            | NOK | http://autobuild.buildroot.net/results/b1d07bc154b47b577fe184302b9900a9d013a2be |     
    arc      | fs/romfs/romfs.mk:32: /home... | NOK | http://autobuild.buildroot.net/results/5d529ee3010fd75ffbf6f96effe02b5464bbee25 |     
    sh4      |         gerbera-1.12.1         | NOK | http://autobuild.buildroot.net/results/c85e82a0a6822f39c1db9e03a67b00b3082d3acd |     
  sparc64    |         gerbera-1.12.1         | NOK | http://autobuild.buildroot.net/results/a63948890c7667bcc3d350f185ebf20e7569c9ab |     
   sparc     |      ghostscript-10.03.1       | NOK | http://autobuild.buildroot.net/results/7244db04375142bb85d4f7a8ad720b831a2fdf6a |     
powerpc64le  | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/8d585fa3246378e7a7ff651bafed28bc71e286e5 |     
  powerpc    | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/8ca1ee9bacc79e608bf4cd279f5d76b9b6f4f425 |     
  powerpc    | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/fc0afcc802be018a8eb3cd7cb5c060898f896633 |     
   armeb     |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/750d54167aedf13e2aa180e881981618accd4726 |     
 aarch64_be  |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/821e29b7b63b9ee7e89da83f16c2b4dfe8f8b116 |     
  riscv64    |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/cca6e6e1dc67d11af637ccba2afad04680eb543d |     
  riscv64    |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/b952a5cef6386690a2e64b28789f917bf8246d65 |     
  aarch64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/10529294746f8df342b34508b08fe9d904b18e6e | ORPH
    mips     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/962c709e8de69f04e3536a29b4bd8654bb541b79 | ORPH
  riscv32    |        gptfdisk-1.0.10         | NOK | http://autobuild.buildroot.net/results/e03d2b51eadb54727bf97f9dac838abe2da54028 |     
  aarch64    | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/9c717f1bc272709bc1431fe8b0c90e1b941b2c23 |     
   x86_64    | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/93e56e81387592772a78e2e49e9cb806e6ad0053 |     
    arm      | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/6fbd6769fcdfa30c63780215a36968fdc9cd1bca |     
   s390x     | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/2e13cd3554446e5e71e04ab08cd719c7c8bd8dd0 |     
    m68k     | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/1465e9c836bc5e4863eb67c0f4bcf1f2c4a63b4a |     
   mips64    | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/92b9c49e3924d2c0018ea0ca23c78745cedd5638 |     
  aarch64    | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/edd83a439ef7f0bda536b45589abf1a647de1f18 |     
   xtensa    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/df061906067a6be3821a2ef32eaa885a91a6a846 |     
   nios2     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/cfb4cd3f2b543db3a7d6312311f3b970177e0009 |     
    or1k     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/097dea6e4d181ca40475bf92c0cc4ca3068d1899 |     
   mips64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/33989d912bef46d84a3273314c35fcb3868b9e18 |     
   nios2     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/a9cca8da22774ecafdbb382697aae71f78e348f4 |     
  sparc64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/70ae752975fa9df210a08cbc600e893dceea5937 |     
    arm      |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/a99fbb1925708690f5410b36bfbe4ecea5503919 |     
microblazeel |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/7da24b11bf3a1c8ad0e37d1771eadad8618893d9 |     
   armeb     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/5386889fa4642d9a1bcb048a12f2ea43a34cb4a7 |     
   x86_64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/5ed26c86006ceb1a743becfd4b28f0717e0c250a |     
   mipsel    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/5fb4664ea95a965969c0ad164f456fe0fb318977 |     
 powerpc64   |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/42841abf6beae083ac20f56481c8dafa9cada716 |     
   mipsel    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/8b40e40362a4c1165f9eb9fc7bf2ee98b5c9f12a |     
   sparc     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/b3fed0957dc0eac33cbce131242a71470d347534 |     
   mips64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/be2f3aef5548052fd182b53b5c4305b88497f195 |     
  aarch64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/1d696dafff74d2e46a3bb7c420a1ca901c8401d6 |     
microblazeel |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/ce13aaeaf814edd5f6a7b215915ef7e76c2ae5a7 |     
 microblaze  |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/d94661fab98eebcee7ff3e65bea5a3ee7a7a0f3b |     
    i686     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/96112f5302f43ed0c3d34678ae5c618700331511 |     
    sh4      |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/d417dceff7bfdf3cb60d34587448f776e2917a88 |     
 powerpc64   |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/e29be4e5145d6ce8590aa00830e90ce9c586f9be |     
  sparc64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/898be78f409275f809f560326bcc33015e71473a |     
  riscv64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/9acec118b4e067730a043ee743e26ab07e62b4ba |     
    i686     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/9430600d305afeabf1ea798b3d8ebcce2fb68638 |     
   x86_64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/86a05910895aa89713d196e40b43d880bb9e6b3d |     
    arc      |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/975b31f58bf6450dbd5042161870baba044d7317 |     
 aarch64_be  |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/2dfc5dc8c1870759ef2af99ac32666bb1e1bfe89 |     
    mips     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/73a2709ca856f9f7d20ea07ab36d1618744a3c00 |     
 microblaze  |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/8fa4c519b982720637a50244004e23ed245e9450 |     
   mipsel    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/e378bb738a4b5f10bda0bc74230917c6ee4c064f |     
   mipsel    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/385ba700a3d758b33b0409e07467fe00d19f7963 |     
 microblaze  |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/bcbfafac55925b2250d183594efa539a4ba6e23c |     
    mips     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/b6bc8fe0bf6fc4b19334d99dda3b6006ffdc73e1 |     
   sparc     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/a38786f3738f79bfbf9c786b855954e7e97a1329 |     
   mips64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/d3a6dc496c8e168b5c1b61b2061f1218cd1f2a6a |     
   s390x     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/e040ac00c92db2687eb7cae936547c2737725926 |     
microblazeel |     host-gcc-final-12.3.0      | NOK | http://autobuild.buildroot.net/results/5b4eee1d9b119c9f923f9518618f45a6482ddc85 |     
microblazeel |     host-gcc-final-12.3.0      | NOK | http://autobuild.buildroot.net/results/45339741903971b4b56ad6f03a93958e56a2d967 |     
 microblaze  |     host-gcc-final-13.3.0      | NOK | http://autobuild.buildroot.net/results/9e983d33797548e2191e33b11f7129219423a506 |     
  aarch64    |      host-gengetopt-2.23       | NOK | http://autobuild.buildroot.net/results/e5bfb23250636a50329609256c160eacc7fe57da |     
  riscv64    |          host-go-src           | NOK | http://autobuild.buildroot.net/results/6b2b9725cc92f213383cdb9e594fe8eeb478bdc9 |     
   mips64    |          host-go-src           | NOK | http://autobuild.buildroot.net/results/597f44e100cdb06288732f1c1e3d9c418d63f4f5 |     
  mips64el   |          host-go-src           | NOK | http://autobuild.buildroot.net/results/844d28f013370cc378557de323504f51c288a75a |     
  mips64el   |          host-go-src           | NOK | http://autobuild.buildroot.net/results/6f6bd7f5a4664ee3f87110bed4943ed35f4ed99b |     
   mips64    |          host-go-src           | NOK | http://autobuild.buildroot.net/results/d10ca7f3a2da0290267534971738690dd0130989 |     
  mips64el   |          host-go-src           | NOK | http://autobuild.buildroot.net/results/89d1f65a5a14a9ea15f2074ecb986f2cdd1ab32f |     
   mips64    |          host-go-src           | NOK | http://autobuild.buildroot.net/results/c257f09ada85ca27c322fd01f952c0e0ba71aa8e |     
   mips64    |          host-go-src           | NOK | http://autobuild.buildroot.net/results/e7320f3bc6b8604bbfe3cf05c774158385440227 |     
  riscv64    |          host-go-src           | NOK | http://autobuild.buildroot.net/results/086dbe7c47e2526a12637387b04ef142524a158d |     
  mips64el   |          host-go-src           | NOK | http://autobuild.buildroot.net/results/375e3c995974908322815cccee1f09b3a510a25e |     
    mips     |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.net/results/ed8dc7fe1dd415ae16ade62142bc7af308adcf4c |     
  aarch64    |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.net/results/d66b0f7f229120609007f52a8a85cd6f8fe0a153 |     
    m68k     |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.net/results/42176f0174ddc72a82d127d8e27775b2da4d5497 |     
    mips     |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/a7b16aadf300d0c7b1c04a3962f9dab7db2f54ec | ORPH
 powerpc64   |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/47d9de08e29eb6d218f31eb60a253d28e5b08bd9 | ORPH
powerpc64le  |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/082c2d40c1c272c94a451e125a46c514178c3a31 | ORPH
 powerpc64   |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/3c430c3a965d75f9aae3d5accda147ea572d1cab | ORPH
   sparc     |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/c678d6ba539eeb8d143ece0a374cfeb5b734521b | ORPH
    m68k     | host-prelink-cross-440c0059... | NOK | http://autobuild.buildroot.net/results/9c53e77a6342795d54bc6e60e848feb96c34a59e | ORPH
 aarch64_be  | host-prelink-cross-440c0059... | NOK | http://autobuild.buildroot.net/results/f4e03d345662154680b5d8e3265aafc9b566245e | ORPH
    sh4      | host-prelink-cross-440c0059... | NOK | http://autobuild.buildroot.net/results/e0f46983dafdc7d309e6cdfdeda268c582a03156 | ORPH
  sparc64    | host-prelink-cross-440c0059... | NOK | http://autobuild.buildroot.net/results/8778aa0018ffd109a83c592623ea16a8dbae769e | ORPH
    m68k     | host-prelink-cross-440c0059... | NOK | http://autobuild.buildroot.net/results/52d2716038c78d6fcf7de0137d6ebe84d6b9fc2b | ORPH
  sparc64    | host-prelink-cross-440c0059... | NOK | http://autobuild.buildroot.net/results/7ad10f99dd2f9182e1b2976974214c9590bdba1d | ORPH
    i686     | host-prelink-cross-440c0059... | NOK | http://autobuild.buildroot.net/results/4ccb7579d5c5726631ff538d6506681b640ef4ab | ORPH
 aarch64_be  | host-prelink-cross-440c0059... | NOK | http://autobuild.buildroot.net/results/640b1dd10053370191f303f2f5214ac1006a3ed6 | ORPH
   mipsel    | host-prelink-cross-440c0059... | NOK | http://autobuild.buildroot.net/results/de11b6365059069b4b8db7ab57f65164cc23a747 | ORPH
  aarch64    | host-prelink-cross-440c0059... | NOK | http://autobuild.buildroot.net/results/fc4561ba604fd959be0adc9d611cf5799cc8ea5b | ORPH
 powerpc64   | host-prelink-cross-440c0059... | NOK | http://autobuild.buildroot.net/results/21f317247aded65e3c291bd4efa2c71748436aba | ORPH
    sh4      | host-prelink-cross-440c0059... | NOK | http://autobuild.buildroot.net/results/8b211bac8d7aa075abf9557fb2d8f420e78a044d | ORPH
   nios2     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/a44f5b1475672c892c5e9578ccacfb6471cf3ce8 | ORPH
    or1k     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/6e16c33e82c0e672d1f524a7130905df0ca54a53 | ORPH
  riscv64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/f16affd47ff87148153136df774a0dbde5beb27e | ORPH
   s390x     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/a1efa320f8956c9f5cf59ec0f96c7ccfda754172 | ORPH
    mips     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/9ddfc4dd3653b523baa5048359019024b5cec861 | ORPH
   x86_64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/c0c56ada7aff12fec3e47dd2acfc83845d283468 | ORPH
   x86_64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/54e1354339fb75b67b015eca858b85ef0220ecfd | ORPH
 powerpc64   | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/f379eecd154b8662d380d5fc0eaa8934a385d3cf | ORPH
 powerpc64   | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/f2a794be56c304b47ee81d880b0bb2f81494a484 | ORPH
    arm      | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/bef69de2c4065c32d9a5cea2fd3f1fd987345bf6 | ORPH
  sparc64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/5c79256bfc65e3a749dcb3dbe921fda6ba78b327 | ORPH
   s390x     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/435f3a2834c6443492b14aeb0427de701ad34a4c | ORPH
 microblaze  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/967e27797b29852ac583a206800d30bfbe7796f9 | ORPH
microblazeel | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/bc14f2bef239e2f2f18ef5429badbaf4c0c8a462 | ORPH
powerpc64le  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/d047276b24dfc4cdf4d71cfadf45b245cbaf8299 | ORPH
  riscv64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/f76c9ed398d69e77a3c434d5f23f1d42cee70872 | ORPH
 powerpc64   | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/377c95f53254ea52dd2a9bacd7a74fcb1109e2ce | ORPH
   s390x     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/b8c8aa0157f783f737b28fd0dbcbe497986a5b1c | ORPH
   s390x     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/a87edc5434c6c1422423508417f30bc98cab8f09 | ORPH
powerpc64le  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/7eb7ca5b87f6e590023e4d348eaded18d21be746 | ORPH
   mipsel    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/61a2a93f6f85da3caf6869d43242c509ab862abb | ORPH
   x86_64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/f56acd1695b8125c82b5af7b96de32e696ceeb52 | ORPH
 powerpc64   | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/f65beffaa2dc5d38a40bef878740e49f54a4ea5e | ORPH
 microblaze  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/1f64fbe23a56ccb2555803fa8f836ea829be4290 | ORPH
   nios2     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/bc5552427b6c0918334b958852301e2c1b959117 | ORPH
    or1k     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/a9de4890fd2499842a26abc8f595f43206e4bdc1 | ORPH
   s390x     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/b35c256d60fe5b29622341a273824bb25b1db239 | ORPH
 aarch64_be  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/ead2c26d6f7ebea370868d2543be54d9258584ef | ORPH
  sparc64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/5a3ec6f8d912c4db8262ebfe5bfe1ea7e65a67a8 | ORPH
   mips64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/92bd3ec30bb7032bf686a35b3e020dbd0d7427ed | ORPH
  riscv32    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/b0eaa5aeea191a79e6a9cce9c094ac1e83a24d81 | ORPH
    sh4      | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/a1bdb110f08b7ba35edafb5072910b9f6cdd3f01 | ORPH
   mipsel    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/c55410f8b1f16307285ac39781a7fd54108a118c | ORPH
   nios2     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/83f620337607f711f11e612321234cf11d639d0f | ORPH
   mipsel    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/85a89b91c989c9e6f15529cfbd19c0e803e2b3d9 | ORPH
microblazeel | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/6a631ad3388fab96c33d6dbd6219e8e3da0ee656 | ORPH
  sparc64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/d0855c3f1db327fe50e04a95b671b66ef63028e3 | ORPH
   nios2     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/b5e3b25dac0fb632fc41bcc8c5bb951c87982b2b | ORPH
powerpc64le  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/92e64dc27b03dbc20c78644dcf191fd79c7bcb22 | ORPH
   mips64    | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/d14ec606d73bc1406cad2593733fb53b8e88cf2f |     
   mips64    | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/95792f393c461808e0f343668e991e2d1780ad3d |     
  powerpc    | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/6141b0acb3f4fbac817d3dcb5a8a424cb031507a |     
   x86_64    |          httping-2.5           | NOK | http://autobuild.buildroot.net/results/2efbb76b04cab54127ef6593bc4ad7ff2fa98afe |     
  sparc64    |          httping-2.5           | NOK | http://autobuild.buildroot.net/results/e3dc5f1a0305475e90e649dad124beb17c23cca1 |     
 aarch64_be  |          httping-2.5           | NOK | http://autobuild.buildroot.net/results/9e6b031105251b3b14413fa71239801af5c7e01c |     
   arceb     |          httping-2.5           | NOK | http://autobuild.buildroot.net/results/e512d15b2f792ef05ec64fb258ebf5b121207bca |     
   sparc     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/2a8cd991f84d4be7a11e1372226d0f263ef74318 |     
  sparc64    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/c2d82447d9b0217ce3d952096229e9cc905161af |     
   x86_64    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/2d847d5b40c286cba682825c779235641c0b5764 |     
    arc      | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/9711e4ef8e3e8fbd50086035fcbcb8773e97501f |     
  sparc64    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/822ea78b190a0f0f1fc9dfda26ac92e42ede435f |     
   arceb     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/6e10d35804db93d7b239eb9dbf50982d41ce38c3 |     
   xtensa    | igh-ethercat-f5dc109176400f... | NOK | http://autobuild.buildroot.net/results/626b5ae01218ee0bb9b9c3a1b3b80c0078f326de |     
microblazeel |          jack2-1.9.22          | NOK | http://autobuild.buildroot.net/results/370880b06140f4b31b5d66bdab6c4ddf9ec92e30 |     
   x86_64    |          jack2-1.9.22          | NOK | http://autobuild.buildroot.net/results/2c7d5a25fdb96769d3357c9b3a5c21a9a36c1cc2 |     
  mips64el   |            kmod-31             | NOK | http://autobuild.buildroot.net/results/99137a997909cec0f9c8bc7f8bf5a41bca541339 |     
    mips     |        libarchive-3.7.4        | NOK | http://autobuild.buildroot.net/results/35b7df81b465f7610654b516d419e51a3e5ab179 |     
   mipsel    |        libarchive-3.7.4        | NOK | http://autobuild.buildroot.net/results/fd76caa1c0844ea564d053a228d463cf1ef451fb |     
   armeb     |        libarchive-3.7.4        | NOK | http://autobuild.buildroot.net/results/4b0bb5d490e84893809b5cdd4b629f1286c17c2f |     
 aarch64_be  |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/2eb2ad708e1e99f5aad922c92c350ade162a5efa |     
  aarch64    |         libcurl-8.8.0          | NOK | http://autobuild.buildroot.net/results/2ebcc6f330ee5f50e68c0382173c5888a86be3c8 |     
   sh4eb     |          libdex-0.6.1          | NOK | http://autobuild.buildroot.net/results/d2b71a056134efb6fa7d45942bb05a1062b38394 |     
   xtensa    | libdill-32d0e8b733416208e04... | NOK | http://autobuild.buildroot.net/results/188d1fb9c86dc42e4ca505fee12f5dd6c5a1b833 |     
   arceb     |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/87e6a9ccd6f59bb53da9f0474980fd998ac158fa |     
   arceb     |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/929b9b12d674b81d38e485ccebd3abb6e7caa714 |     
    arc      |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/33a843e0f9076873e437f4c148a043965f5d296a |     
    arc      |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/7a0be7c1e925762800228ad070d94f0cff47a71f |     
   arceb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/27e2125e7652898756ea423fb5396677c27e5f17 |     
    arc      |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/1949a2f5e259610affe8a2c25ff5e418e25dbb7e |     
   arceb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/2d509b2a333dd6db5155a655ccb3c0fddfa80e2a |     
   arceb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/e818130c2ef7487427959a54b9403f2acaa14edc |     
    m68k     |         libglvnd-1.4.0         | NOK | http://autobuild.buildroot.net/results/99344959179994593f840b0cd00e1fbaa1f8aeaa | ORPH
   arceb     |        libopenssl-3.3.1        | NOK | http://autobuild.buildroot.net/results/e86c3657cf68743374730bd3035549bad3024a57 | ORPH
 aarch64_be  |         libp11-0.4.12          | NOK | http://autobuild.buildroot.net/results/bb01192b8c2f5d13fa05f1f84901019b73d08d4d | ORPH
  aarch64    |         libp11-0.4.12          | NOK | http://autobuild.buildroot.net/results/80dcd1a0216e36c31a6b081962b6dcae4dd3138a | ORPH
   armeb     |         libp11-0.4.12          | NOK | http://autobuild.buildroot.net/results/002175b305e04da3b008c7fe9e156104b97af0d2 | ORPH
  sparc64    |   libphidget-2.1.9.20190409    | NOK | http://autobuild.buildroot.net/results/1cb95a79d51eaf97f38bebec0abfb912ddd1ebe7 |     
    m68k     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/2ef4df39edf3ced5ec1062372ac61583af316a4e | ORPH
    arc      |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/6b0b191636d5bf6fcd7a81b63747c4a122ebc4cc | ORPH
    arc      |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/bbca537c4cabd2ee4f941fe0bca96ed9ead56679 | ORPH
  mips64el   |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/c1c016a243781a13d9d7adb5a21c5e537bfd216e | ORPH
   s390x     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/5b99e38ccd575753a5f6ea3b6add9e1585462cd7 | ORPH
microblazeel |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/f2563cc05f1ae8ab7ca0940775c9f37c2035ef9b | ORPH
    arc      |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/c37e283fa1524e8b1fa4dd6eaa3680a35f7c57b8 | ORPH
   s390x     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/f79cfb6b9a9aeb497a3229a4b3a0e3d37d2a7792 | ORPH
   s390x     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/afbef175bf037309885a29acf495ebf0add5ae81 | ORPH
powerpc64le  |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/45a83c1b785a0410207cb49dabaa8cf735df92df | ORPH
   arceb     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/800cde52c9f860bf20e356d18089ab70098e32d4 | ORPH
  mips64el   |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/2a38272c6876811b4abeb94005756babd1f4d9c3 | ORPH
   arceb     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/09cfec8a393c0b33a5e2dcbb4c35d4dbc1df63dd | ORPH
   xtensa    |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/d2dabcc7401dd0148c72a54c47a2c951840a4527 | ORPH
    arc      |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/b7bf3a8c473169346fc821236c0649c03c8c6411 | ORPH
   xtensa    |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/be5c3d712b1153acc20b5757cf1d637888041640 | ORPH
 microblaze  |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/ee83226cf91dbfe1611a841e14c5c0f97b143fc5 | ORPH
    m68k     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/2afa1ef79abd52fb9fdb088c6b1df0b548668248 | ORPH
    arc      |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/37181f1ff221ceaacfabc4512248cb315b020aa3 | ORPH
   nios2     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/b723e3f25d026ea6cbe5243f765d379d78b267a8 | ORPH
  mips64el   |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/bdc4bcbaff2135fd37b101e3b1951500594c5510 | ORPH
    or1k     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/95ce61639d2d9eebd0874d4c37afe28dd4eb03e2 | ORPH
   nios2     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/bc42b71bca594deae4a1152ea4398e5c5569be99 | ORPH
 microblaze  |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/b35c5d619eeb57acce57dcfd639bcbd1b73837a5 | ORPH
   sparc     | libsvgtiny-ea9d99fc8b231c22... | NOK | http://autobuild.buildroot.net/results/16afc77a19e3fdab4611f8a0f5dc153f151db99d | ORPH
   x86_64    | libsvgtiny-ea9d99fc8b231c22... | NOK | http://autobuild.buildroot.net/results/bb803205e6210a0b641c2f531735b0e5809fd7d8 | ORPH
    or1k     | libsvgtiny-ea9d99fc8b231c22... | NOK | http://autobuild.buildroot.net/results/ad1a77af0ae247dbb3d9a21b20b3d83e7184f4c4 | ORPH
 microblaze  | libsvgtiny-ea9d99fc8b231c22... | NOK | http://autobuild.buildroot.net/results/bc775ff975711ebec183810dea7e01caca404a98 | ORPH
 powerpc64   | libsvgtiny-ea9d99fc8b231c22... | NOK | http://autobuild.buildroot.net/results/77d17f287cfd6d793ecf14f6fd7c3bb4d7af5e70 | ORPH
   sparc     | libsvgtiny-ea9d99fc8b231c22... | NOK | http://autobuild.buildroot.net/results/454e8bd67855c8b4c7dd0961b5ea6dd485b3f3c4 | ORPH
  powerpc    | libsvgtiny-ea9d99fc8b231c22... | NOK | http://autobuild.buildroot.net/results/61b8bf530b2212e6be947a38e4c7d8b128801a53 | ORPH
 microblaze  | libsvgtiny-ea9d99fc8b231c22... | NOK | http://autobuild.buildroot.net/results/5fe84d8c327a067e1f8f89e5895a856f227b752c | ORPH
  powerpc    | libsvgtiny-ea9d99fc8b231c22... | NOK | http://autobuild.buildroot.net/results/3c524d8a86cabd531f3615419061ec286d1aaf27 | ORPH
   x86_64    | libsvgtiny-ea9d99fc8b231c22... | NOK | http://autobuild.buildroot.net/results/a4334cde4f44193bcaf0b9e9befbe3b032b22623 | ORPH
    mips     | libsvgtiny-ea9d99fc8b231c22... | NOK | http://autobuild.buildroot.net/results/defd9cbaede91350959de9b2dcf4ec2abefc2cae | ORPH
   armeb     | libsvgtiny-ea9d99fc8b231c22... | NOK | http://autobuild.buildroot.net/results/84f82d49b6eec068ed925bf6e2552ad19a0b3dba | ORPH
   sparc     | libsvgtiny-ea9d99fc8b231c22... | NOK | http://autobuild.buildroot.net/results/6bc5042e6c7e9e1cecb342d1c632b3ec79af3661 | ORPH
   x86_64    | libsvgtiny-ea9d99fc8b231c22... | NOK | http://autobuild.buildroot.net/results/94e6b31149d51a641dc703881b5789a50afaf915 | ORPH
    arc      | libsvgtiny-ea9d99fc8b231c22... | NOK | http://autobuild.buildroot.net/results/f16f95348f734b3eed98c28e64f3b618f59bc87b | ORPH
   mipsel    | libsvgtiny-ea9d99fc8b231c22... | NOK | http://autobuild.buildroot.net/results/f58cc801a8036db6a935650bb52513238e0bf246 | ORPH
    arc      |         libvips-8.10.6         | NOK | http://autobuild.buildroot.net/results/73c1503988ac714c93e60737209eb0ba68dcd165 |     
   mips64    |         libxml2-2.12.6         | NOK | http://autobuild.buildroot.net/results/e0e6fc256c6825d381e2f8c494ca17d90afc4c2b |     
   mips64    |         libxml2-2.12.6         | NOK | http://autobuild.buildroot.net/results/38c18ba6a044b8da4ee662bbb2bcaecef55995f2 |     
  sparc64    |        lighttpd-1.4.76         | NOK | http://autobuild.buildroot.net/results/c91b59b721906f337608ab14acb79e2f1ab17c7b | ORPH
  mips64el   |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/5ae495605422b6fef0f992f1594ea830562396f2 | ORPH
   sh4eb     |          linux-6.9.8           | NOK | http://autobuild.buildroot.net/results/00e6d1e1b4086fb49fa18c152b4f8adaad137098 | ORPH
  mips64el   |          linux-6.9.8           | NOK | http://autobuild.buildroot.net/results/f7dfd4634e02d067582a97baee9a3dd41e819655 | ORPH
  powerpc    |          linux-6.9.8           | NOK | http://autobuild.buildroot.net/results/950534f220593f2cf7e85584f02a8edaaf0ec8af | ORPH
   nios2     |          linux-6.9.8           | NOK | http://autobuild.buildroot.net/results/46c79278a0bd4db5c6d4fc683ca51b31253e09df | ORPH
   nios2     |          linux-6.9.8           | NOK | http://autobuild.buildroot.net/results/e85ca40768b028334021080ed6d12146d817aff1 | ORPH
  mips64el   |          linux-6.9.8           | NOK | http://autobuild.buildroot.net/results/024847ecedde0b7b7ed707d5d9a74d88171e9a7e | ORPH
 microblaze  |          linux-6.9.8           | NOK | http://autobuild.buildroot.net/results/92159f5655a4c04baeddaf1290cf7d8aa6790255 | ORPH
    m68k     |          linux-6.9.8           | NOK | http://autobuild.buildroot.net/results/859e10650931693d35b9242494ce5456189fa56a | ORPH
    m68k     |    linux-firmware-20240410     | NOK | http://autobuild.buildroot.net/results/a472de9e8e6c2ed58aa4214513b5e11a1bc281e7 |     
   x86_64    |    linux-firmware-20240410     | NOK | http://autobuild.buildroot.net/results/ad45e9f9ffe61907fb558859ffb95fd287db673e |     
 microblaze  |        linux-pam-1.6.1         | NOK | http://autobuild.buildroot.net/results/aa886b8a7033e0ab9c0533e6f56b14e7f1bcc90d | ORPH
 microblaze  |        linux-pam-1.6.1         | NOK | http://autobuild.buildroot.net/results/a9300d0c3102c7201a8d8832c50310e139991613 | ORPH
   xtensa    |        linux-pam-1.6.1         | NOK | http://autobuild.buildroot.net/results/a7759732fc086b4dfe86d8ffb6d3b5aa35d45854 | ORPH
 microblaze  |        linux-pam-1.6.1         | NOK | http://autobuild.buildroot.net/results/df82c90c66c5509bc1d632a70edec3568385adb0 | ORPH
    arc      |          linux-tools           | NOK | http://autobuild.buildroot.net/results/182279209d122849c471b0b5b623dbf6a3e58799 | ORPH
  riscv32    |          linuxptp-4.2          | NOK | http://autobuild.buildroot.net/results/0c242acc0b41445010b2f107f2bb76e3f7e40e85 |     
  aarch64    | ltrace-82c66409c7a93ca6ad2e... | NOK | http://autobuild.buildroot.net/results/cefcf1076e494fe24957fba2adbe22c131e6a68b | ORPH
   x86_64    | ltrace-82c66409c7a93ca6ad2e... | NOK | http://autobuild.buildroot.net/results/c42b94057393d828fd1ddfba418396a361e9a1e4 | ORPH
   x86_64    |          luvi-2.14.0           | NOK | http://autobuild.buildroot.net/results/010cec7b48e79036e229f7d187369d5bcbc37a9a | ORPH
   sparc     |        mariadb-10.11.6         | NOK | http://autobuild.buildroot.net/results/7d546f330b9344eb600dd5b016b1f5d43e9b6dc8 | ORPH
   sparc     |      mediastreamer-4.4.8       | NOK | http://autobuild.buildroot.net/results/76ee3be72567a1003471e593c2d861cd786a98a4 | ORPH
   s390x     |          mender-3.4.0          | NOK | http://autobuild.buildroot.net/results/abfa9ed6614404f09027f13b0c90ec0475690872 |     
    arm      |          mender-3.4.0          | NOK | http://autobuild.buildroot.net/results/1e2c399d2d15a9f68d069a442af2771e02551c7e |     
  riscv64    |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/f6eb7c97a84a7bed8e74750f3d6cfc7107090bc3 |     
   mips64    |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/9e4bec5b8fdba6ae49e89fa26f4b80d6704bdb74 |     
   mips64    |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/478351dfc94f330f0a0b669e9addcaad695e487f |     
  riscv64    |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/97efc92913e84ca57cae478c60773e6951d85c1f |     
   sh4eb     |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/9ee0f67c8bbd924320c6860a9ba6814da0b955dc |     
    arc      |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/a254dd09dc731a56702a81aff0eb7843f76691d2 |     
 aarch64_be  |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/8637f96e31242784bb66e8bc57803f808309f1f8 |     
  powerpc    |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/3df072255ee5784a5704aa74e3fbf4b64ea26582 |     
   mips64    |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/fd1ef24737366d6a48221d0918775de68affd00e |     
    or1k     |           mpv-0.35.1           | NOK | http://autobuild.buildroot.net/results/bbf40526cf5642422e88dc6eb8692eb116c8858e |     
    mips     |           mpv-0.35.1           | NOK | http://autobuild.buildroot.net/results/47d9aaecb3461b92be96fc92c95d1bbd3f2f6a4e |     
 powerpc64   |           mtd-2.2.0            | NOK | http://autobuild.buildroot.net/results/4e01a2f41aeb0db17291e82f7679b130e1d2bd37 |     
   mipsel    |           mtd-2.2.0            | NOK | http://autobuild.buildroot.net/results/464592fa396686bf9391ec6e8c183527cfd0f621 |     
microblazeel |           ncmpc-0.49           | NOK | http://autobuild.buildroot.net/results/4908d49893533b30cae88a7baf98855c3ff7b223 |     
    arc      |          ntp-4.2.8p18          | NOK | http://autobuild.buildroot.net/results/9f6865c7b8ec4c005f7c4c29c3d6cca06ef4b7e1 |     
    arc      |          ntp-4.2.8p18          | NOK | http://autobuild.buildroot.net/results/d7dfc497aa00e6c3c489d36c5b89e580d497ce0f |     
 aarch64_be  |          oatpp-1.3.0           | NOK | http://autobuild.buildroot.net/results/940212e8a90bb395a6a6d7893d48b143d1183090 |     
  riscv64    |          oatpp-1.3.0           | NOK | http://autobuild.buildroot.net/results/5b5b38e430c64dfcaf7728249c47042b0e6f1884 |     
  riscv64    |        openblas-0.3.27         | NOK | http://autobuild.buildroot.net/results/ae8158eb28b40f85f5342755088c2b32d4118358 |     
   mips64    |         openssh-9.8p1          | NOK | http://autobuild.buildroot.net/results/f1d91b9acc20318b963a62dcf48832bcc7a5dd74 | ORPH
microblazeel |        pcsc-lite-2.1.0         | NOK | http://autobuild.buildroot.net/results/6db61960414f3944acb731193621a792736d7cac | ORPH
   sh4aeb    |           php-8.3.9            | NOK | http://autobuild.buildroot.net/results/8b4320a9bcfe6bd0855b015b36d6a8eed61af327 |     
  sparc64    |           proj-9.3.0           | NOK | http://autobuild.buildroot.net/results/9b2643a457605161cfb128eac0f2a87f6b7c5630 |     
  powerpc    |     python-remi-2022.7.27      | NOK | http://autobuild.buildroot.net/results/f9c29dbc3a17a924a1772adc1263e76aab7413f4 |     
  powerpc    |     python-remi-2022.7.27      | NOK | http://autobuild.buildroot.net/results/c94e1e995f2f5c8c6b478e1002ee3646d9477e7c |     
   mipsel    | python-unittest-xml-reporti... | NOK | http://autobuild.buildroot.net/results/518329a557a7b87725e55a69eb470a8b426ba684 |     
 microblaze  |         python3-3.12.4         | NOK | http://autobuild.buildroot.net/results/7fec0d4427f781fe573bdb8e45a9f7b2dd5e4383 |     
   mips64    |         python3-3.12.4         | NOK | http://autobuild.buildroot.net/results/0984e0795c7373ca2af693af6e2d10a1257dadb8 |     
  mips64el   |         python3-3.12.4         | NOK | http://autobuild.buildroot.net/results/12f2ddd0f76c0e06b06aaaeef37088b572c0b410 |     
    mips     |         rdesktop-1.9.0         | NOK | http://autobuild.buildroot.net/results/fc2ee9491e544dfc66189026e506d65013d4d6c9 | ORPH
   sparc     |         rrdtool-1.8.0          | NOK | http://autobuild.buildroot.net/results/5b50cb884647f4b561ffbf349d6654ec203d6a73 |     
   x86_64    |           rtty-8.1.0           | NOK | http://autobuild.buildroot.net/results/16e4b6bd7dc5c937ff6ac1923e38637dde529795 |     
 microblaze  |           rtty-8.1.0           | NOK | http://autobuild.buildroot.net/results/ca7b9c97eff4db60be2d4cffd1f1a60dae781112 |     
   xtensa    |         s6-dns-2.3.7.1         | NOK | http://autobuild.buildroot.net/results/7701a024b859d7da047ccb2d74c7cdecc1b93a9e |     
    m68k     |          screen-4.9.1          | NOK | http://autobuild.buildroot.net/results/a4e7fe63595452f8a2564030e8fc03c9400f1a1b | ORPH
  aarch64    |           shim-15.8            | NOK | http://autobuild.buildroot.net/results/98bea3c3192fb0785393291d882731c83877a55d |     
 microblaze  |         softhsm2-2.6.1         | NOK | http://autobuild.buildroot.net/results/bf24fafae21be85f41a6f03214337bf7b441939a | ORPH
   sh4aeb    |       stress-ng-0.17.07        | NOK | http://autobuild.buildroot.net/results/1a7f939f2701f09f5c6dfef2f84fc7af99953143 |     
  sparc64    |       strongswan-5.9.13        | NOK | http://autobuild.buildroot.net/results/75d74d6e0a722583b72622eeaee6379da7afb861 |     
    i586     | tftpd-e52af4207a6e09a1ba21f... | NOK | http://autobuild.buildroot.net/results/6236c95c2a1892d25d80cbe632bf0fe483554148 | ORPH
powerpc64le  | tftpd-e52af4207a6e09a1ba21f... | NOK | http://autobuild.buildroot.net/results/ffd1780a315e83908766b5047eeb9a522b8b5648 | ORPH
  sparc64    |         tpm2-tss-3.2.2         | NOK | http://autobuild.buildroot.net/results/6606dce89f51625db1cb84c040eaaba269e25c0b | ORPH
 powerpc64   |          trinity-1.9           | NOK | http://autobuild.buildroot.net/results/f53365a27600262f94ddf20d718626ee4756f99a | ORPH
  powerpc    |        udpcast-20230924        | NOK | http://autobuild.buildroot.net/results/8f6aa298cf37c42914251d16a2939e5bf7906b87 | ORPH
    arc      |        udpcast-20230924        | NOK | http://autobuild.buildroot.net/results/b33a2ade8306f1b6473cd9c76861297ca3032e23 | ORPH
   s390x     |         unbound-1.19.1         | NOK | http://autobuild.buildroot.net/results/98c5cee782638872361b68c72dca5e6f7f27eafb |     
  powerpc    |         unbound-1.19.1         | NOK | http://autobuild.buildroot.net/results/9090ce25207e76e99d9852e59c7ebed0787e7741 |     
 powerpc64   |         unbound-1.19.1         | NOK | http://autobuild.buildroot.net/results/8c7a9549b0ee4749d9eee07eaef6461631298567 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/2e0e689c117a7081fbadbb736334077f392a5511 |     
   arceb     |            unknown             | NOK | http://autobuild.buildroot.net/results/8a93776594523299a3fcf59058ea01d5d8171ec7 |     
   mipsel    |        valgrind-3.22.0         | NOK | http://autobuild.buildroot.net/results/a9df0d7b0e75ca4696dc19d0fa1aa57744657a1f | ORPH
  powerpc    |           volk-3.0.0           | NOK | http://autobuild.buildroot.net/results/b73911e39c1ed2e4a056ef8e79625276fef3fa7e |     
    sh4a     |         watchdog-5.16          | NOK | http://autobuild.buildroot.net/results/69abd98454ee5108767e7e4a0e27db29621f8380 |     
    arm      |            xz-5.6.2            | NOK | http://autobuild.buildroot.net/results/06b27724e8a85d1a6e332b96a96929c31557c704 | ORPH
   arceb     |            xz-5.6.2            | NOK | http://autobuild.buildroot.net/results/9926bef908180792710a0c2242a28064c7bcc726 | ORPH
   s390x     |          zabbix-6.2.7          | NOK | http://autobuild.buildroot.net/results/b00d32dabc607c715815178e9d768ab26931a602 |     
   x86_64    |          zabbix-6.2.7          | NOK | http://autobuild.buildroot.net/results/829ea0976f45b179c7bb32f41e6406f1870befd7 |     
powerpc64le  |         zlib-ng-2.1.6          | NOK | http://autobuild.buildroot.net/results/81f6cf262a87cba2d2b3a273e732f4a0952a58e2 | ORPH
microblazeel |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/e0909dda77abe4988a108c95675adb7c8bde7307 |     
  powerpc    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/2ec1079831011fed10c4bc364b0b90641b11ceb4 |     
   sparc     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/b03496fcae5b0e7ad90691d8aa5cad128dca5238 |     
    mips     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/a77cacf5a74d890a51bd65681a8c83274d761300 |     
   mips64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/02f6879f32105e4251eaea170a0902d0e6b84fc9 |     
   sparc     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/579592d7ec1422d918162d47c5b67569a3482535 |     
    arm      |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/bba8aafefbaa71128e278a0131578eadbb6d74a5 |     
  aarch64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/fc461b7a84a52fce778aa5d68e4e76509e9bb4da |     
powerpc64le  |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/ea63656baa6856c8ad8d3d9b0aa91ffe76693771 |     
    i686     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/b3ba3520c8d94ea523161e3658b0b2693693b14e |     
    arm      |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/d5eeccf4ebbeeb50e7679274d3e213828c224aff |     
  sparc64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/efce574d772402f775a96abe9e09f21160c1a699 |     
 microblaze  |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/6b09952c5c491cef3395c573e311b276e8bd82b4 |     
 microblaze  |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/de80e539d20cc9630053f136b85666b7b2bf0994 |     
  aarch64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/d2fc886ed17889ea63f4d3ef3dbd5f7f003de04b |     
  sparc64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/2fb0b9c8bb2de48b07dbdb31c7dbc67637016d82 |     
   arceb     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/ae22f1f90c89e0ea120995cef237dc2a42bf9196 |     
    mips     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/901419af7179e41a359f9c7b6fa7f1e01deb6765 |     
    arc      |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/34bfb2e3a891b3427a4d9949039fea68d0ba8b5e |     
  mips64el   |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/477736de90b21bb1845b8e436f2107b2c8ea4c7a |     
   nios2     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/7b511632833896aa244af44dd504deb895aa8366 |     
 microblaze  |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/ebe7c42bcb54af54db056b197eabe9fe6a4cf33d |     
    arm      |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/c728f0e3ae197b1cb1deac5f7ae4af743142d032 |     
 powerpc64   |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/6c82ade18002c61feed6bb3a0e5a6f33135a9668 |     
   mips64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/57f61334a86124f7d02d64237fb0d64b68dc0f00 |     
    mips     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/68af03f5dec34774e2479f17258a6b4663729ae4 |     
microblazeel |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/3cd99f6010e061355f891312895658f770e250a7 |     
   armeb     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/be231bdcdda4c2499e684ce1f83ac5df0e27ee95 |     
    or1k     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/35ee0472181bc26a20bf8c4da1a7c7e5e410079a |     
   mipsel    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/27d0b3e5a15d0af9604277b24382bc753d127f51 |     
   mipsel    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/e6f884f8928d8ef7d2135cbaa249d5dcc9158f31 |     
 powerpc64   |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/df983da15a5918566c89a87038d0bdc6cb530485 |     
    or1k     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/188f27c957b11b23dcf84589bd74d31469f59008 |     
  riscv64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/29589e983b61d490d54c5032b59d08be699e6fd6 |     
powerpc64le  |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/a5bb18a1ebf74915bed695a3911dff69fcd5cd3c |     
  aarch64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/3999b993dfc693f2f60cf2f36636bcf6275569fd |     
    arc      |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/a82e01fa66a5ac8fb26303973ded1e78b241c61f |     
    i686     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/37a04c25d90f04bcad607a680607d7f1878a90c5 |     
   armeb     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/74f229c45ef2763e9e08be7ff789f3a1e85a090c |     
    i686     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/3125bd3c9f27f6ba9e760b277674355901445479 |     
 microblaze  |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/29585e47b1677d8c8809f460adda6679869ae1de |     
  aarch64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/8d0ddb327b30b2b5edfc3bcc453b7f3ffba3a753 |     
microblazeel |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/82ab5df6c2c8db9ebed5a6b114e3ee83f5014e94 |     
  mips64el   |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/04ebbe63b86b715db0aa3e88ae7e91d584339d2e |     
  sparc64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/ce52c9279beaeefb8e95355a9bbde0c32859c7df |     
   sparc     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/93242a43a0b238f323a68cb466d3bde2425805fb |     
  sparc64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/c1ad6139a5d6ba846fa5db2712a8fa452d2b9329 |     
microblazeel |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/7e2aeecbd70082cf5c01fa753d3d94541acad808 |     
  riscv32    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/a40c32b75d37bf820d99cfecc378d53b833f4411 |     
microblazeel |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/80a54f901c00ad391d22a99ef7460fd0fa0897a0 |     
   armeb     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/7ccc0e8041c046fc8b9759dd0013ee3583b8e127 |     
   s390x     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/7bb9973296e5d0adade05df43d5691b18ed7c5f5 |     
    i686     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/bd9c2288c57781104ea382e83c4992a8657070f1 |     
 aarch64_be  |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/a8a7cca73cd37719cbf23c134e328d292292918c |     
 powerpc64   |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/760fce584932e81ec78380a2c02cb24fe67d7f01 |     
 aarch64_be  |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/ba16669205f8aedf325afa67dac525410a30d2f4 |     
   arceb     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/18ce4656bbe81d945d03fbc4b8fafac55f9e41a2 |     
  sparc64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/1eaf6cd337a3a0a445ebe2fa7565d1c68a7802b0 |     
    or1k     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/1ffe681ba0d73a02264ab943b612cdcf3a2a37f5 |     
   x86_64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/54f3c511346dc3e414cdaa836342e9466b8435f2 |     
 aarch64_be  |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/9af35ac827cb3f1e8fbc63bda2a2d3053ab82d4e |     
    arm      |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/95b8a290689bcbb9ab61a37a1a72110ff413b14a |     
    sh4a     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/a04afd4b67b04c6bd556ef7ed76121aa3a5cb854 |     
   nios2     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/b99428d1516e562589a165eefe923412ba35429c |     
   mipsel    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/31fcb3d51939d9a8e6bd8438ea28615d88f6219a |     
    arm      |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/bcc5bb551411490b94980c70a8465aa428373234 |     
   s390x     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/ebd983764c0e998078af71bef12d30cd72f5a84a |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

          libcamera-apps-1.2.1 | 2 
glibc-2.38-81-gc8cb4d2b86ec... | 1 
                    zeek-4.1.1 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  | glibc-2.38-81-gc8cb4d2b86ec... | NOK | http://autobuild.buildroot.net/results/6078e80fd1df942a3b2e01ada0a96837fd393acb |     
  sparc64    |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/5ba5d675bf72fef9b1fb267be49050044cfaff07 |     
  mips64el   |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/78a849e5598269f28633a698aaf2846b2ed0c287 |     
  riscv64    |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/b0cda1ac682eb118498e8dbcdcf95e154167b7f7 |     


Classification of failures by reason for 2024.05.x
--------------------------------------------------

               mariadb-10.11.6 | 2 
                 coreutils-9.3 | 1 
                gnu-efi-3.0.18 | 1 
  gobject-introspection-1.76.1 | 1 
         host-libxcrypt-4.4.36 | 1 
              libarchive-3.7.4 | 1 
               libglib2-2.76.1 | 1 
     linux-5.10.162-cip24-rt10 | 1 


Detail of failures for 2024.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/64a615acffe356fb59932b1277a36f5c5c1f6918 | ORPH
   armeb     |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/f69c0fd127c3f91f7a182ad561d81f451df85d66 |     
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/a6400d3afceb80159c51ede110b3f6b32699e56e | ORPH
 aarch64_be  |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.net/results/4fe27f3e4f5ea7028f711fe615bb96c2a48b61a7 |     
  riscv32    |        libarchive-3.7.4        | NOK | http://autobuild.buildroot.net/results/419dd2938ee004491bd8dac2d1a7add6ab4bfa9c |     
    arc      |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/046cace3ed22cbb9715e30a57f037867b58c68e4 |     
   nios2     |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/725a922b746b81cb3c5f2ff0f746e1584ab34bc6 | ORPH
   sparc     |        mariadb-10.11.6         | NOK | http://autobuild.buildroot.net/results/a020c3dec2c8d153b27c1cea1a74d435c465785b | ORPH
   sparc     |        mariadb-10.11.6         | NOK | http://autobuild.buildroot.net/results/9a7ef8b0d8b4378324a216e2d4bdceafcb502071 | ORPH


Gitlab CI results for 2024-07-12
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
                 arcturus_ucp1020 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7314633376  |      
                  at91sam9260eknf | https://gitlab.com/buildroot.org/buildroot/-/jobs/7314633474  |      
                   at91sam9g20dfc | https://gitlab.com/buildroot.org/buildroot/-/jobs/7314633492  |      
                 at91sam9g45m10ek | https://gitlab.com/buildroot.org/buildroot/-/jobs/7314633506  |      
                     at91sam9rlek | https://gitlab.com/buildroot.org/buildroot/-/jobs/7314633527  |      
                 atmel_sama5d3xek | https://gitlab.com/buildroot.org/buildroot/-/jobs/7314633641  |      
                        bananapro | https://gitlab.com/buildroot.org/buildroot/-/jobs/7314633693  | ORPH 
                   beagleboardx15 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7314633702  |      
                          beaglev | https://gitlab.com/buildroot.org/buildroot/-/jobs/7314633742  |      
                      beelink_gs1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7314633747  |      
                  chromebook_snow | https://gitlab.com/buildroot.org/buildroot/-/jobs/7314633776  |      
                             ci20 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7314633785  |      
                      cubieboard2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7314633788  |      
            engicam_imx6qdl_icore | https://gitlab.com/buildroot.org/buildroot/-/jobs/7314633794  |      
        engicam_imx6qdl_icore_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7314633799  |      
        engicam_imx6qdl_icore_rqs | https://gitlab.com/buildroot.org/buildroot/-/jobs/7314633803  |      
              engicam_imx6ul_geam | https://gitlab.com/buildroot.org/buildroot/-/jobs/7314633806  |      
             engicam_imx6ul_isiot | https://gitlab.com/buildroot.org/buildroot/-/jobs/7314633810  |      
        freescale_imx6dlsabreauto | https://gitlab.com/buildroot.org/buildroot/-/jobs/7314633816  |      
          freescale_imx6dlsabresd | https://gitlab.com/buildroot.org/buildroot/-/jobs/7314633819  |      
         freescale_imx6qsabreauto | https://gitlab.com/buildroot.org/buildroot/-/jobs/7314633822  |      
           freescale_imx6qsabresd | https://gitlab.com/buildroot.org/buildroot/-/jobs/7314633825  |      
          freescale_imx6sxsabresd | https://gitlab.com/buildroot.org/buildroot/-/jobs/7314633831  |      
           freescale_imx7dsabresd | https://gitlab.com/buildroot.org/buildroot/-/jobs/7314633847  |      
             freescale_imx8dxlevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/7314633853  |      
              freescale_imx8mmevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/7314633856  |      
              freescale_imx8mnevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/7314633859  |      
              freescale_imx8mpevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/7314633865  |      
              freescale_imx8mqevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/7314633873  |      
              freescale_imx8qmmek | https://gitlab.com/buildroot.org/buildroot/-/jobs/7314633883  |      
             freescale_imx8qxpmek | https://gitlab.com/buildroot.org/buildroot/-/jobs/7314633888  |      
           friendlyarm_nanopi_r2s | https://gitlab.com/buildroot.org/buildroot/-/jobs/7314633909  |      
                   imx6-sabreauto | https://gitlab.com/buildroot.org/buildroot/-/jobs/7314633956  |      
                        imx6slevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/7314633972  |      
                       imx6sx-sdb | https://gitlab.com/buildroot.org/buildroot/-/jobs/7314633982  |      
                        imx6ulevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/7314633989  |      
                       imx6ulpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/7314634004  |      
                        imx7dpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/7314634015  |      
                        imx8mpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/7314634035  | ORPH 
                        imx8mqevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/7314634048  |      
               kontron_pitx_imx8m | https://gitlab.com/buildroot.org/buildroot/-/jobs/7314634064  |      
                       ls1028ardb | https://gitlab.com/buildroot.org/buildroot/-/jobs/7314634091  |      
                     ls1046a-frwy | https://gitlab.com/buildroot.org/buildroot/-/jobs/7314634096  |      
                mender_x86_64_efi | https://gitlab.com/buildroot.org/buildroot/-/jobs/7314634107  | ORPH 
                          mx25pdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/7314634201  |      
                   mx6sx_udoo_neo | https://gitlab.com/buildroot.org/buildroot/-/jobs/7314634264  |      
                          mx6udoo | https://gitlab.com/buildroot.org/buildroot/-/jobs/7314634271  |      
              octavo_osd32mp1_brk | https://gitlab.com/buildroot.org/buildroot/-/jobs/7314634329  |      
              octavo_osd32mp1_red | https://gitlab.com/buildroot.org/buildroot/-/jobs/7314634336  |      
                        odroidxu4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7314634348  |      
        olimex_a20_olinuxino_lime | https://gitlab.com/buildroot.org/buildroot/-/jobs/7314634381  |      
       olimex_a20_olinuxino_lime2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7314634373  |      
                    orangepi_lite | https://gitlab.com/buildroot.org/buildroot/-/jobs/7314634420  |      
                   orangepi_lite2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7314634418  |      
                orangepi_one_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/7314634426  |      
                       pandaboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/7314634452  |      
                           pine64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7314634462  |      
                    pine64_sopine | https://gitlab.com/buildroot.org/buildroot/-/jobs/7314634467  |      
                qemu_aarch64_sbsa | https://gitlab.com/buildroot.org/buildroot/-/jobs/7314634478  |      
          qemu_riscv32_nommu_virt | https://gitlab.com/buildroot.org/buildroot/-/jobs/7314634575  |      
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/7314634644  | ORPH 
                        riotboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/7324770017  |      
                           rock5b | https://gitlab.com/buildroot.org/buildroot/-/jobs/7324770088  |      
                           rock64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7324770108  |      
                       rock_pi_n8 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7324770128  |      
             sipeed_licheepi_zero | https://gitlab.com/buildroot.org/buildroot/-/jobs/7324770328  |      
               snps_arc700_axs101 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7324770541  |      
                 snps_arc700_nsim | https://gitlab.com/buildroot.org/buildroot/-/jobs/7324770570  | ORPH 
                socrates_cyclone5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7324770866  |      
              toradex_apalis_imx6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7324775241  |      
                           ts4900 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7324775359  | ORPH 
                           ts7680 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7324775883  |      
                         uevm5432 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7324776263  |      



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
