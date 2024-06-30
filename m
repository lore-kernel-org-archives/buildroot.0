Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DB39C27C4F
	for <buildroot@archiver.kernel.org>; Sun, 30 Jun 2024 05:25:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C8FC581EE3;
	Sun, 30 Jun 2024 05:25:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B0ydnyEQQXRn; Sun, 30 Jun 2024 05:25:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 67CFE81D3A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 67CFE81D3A;
	Sun, 30 Jun 2024 05:25:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EC1701BF365
 for <buildroot@lists.busybox.net>; Sun, 30 Jun 2024 05:25:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D77D340390
 for <buildroot@lists.busybox.net>; Sun, 30 Jun 2024 05:25:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gO3Q1EK_Fvc3 for <buildroot@lists.busybox.net>;
 Sun, 30 Jun 2024 05:25:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 46C7E40533
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 46C7E40533
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 46C7E40533
 for <buildroot@buildroot.org>; Sun, 30 Jun 2024 05:25:13 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E967AC0002
 for <buildroot@buildroot.org>; Sun, 30 Jun 2024 05:25:10 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sun, 30 Jun 2024 05:25:10 -0000
X-GND-Sasl: bot@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1719725111; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=jfG3HTHTFNiaR7z8jNjwOqDGShNwMGohrkGUSd0a1vk=;
 b=pBrcEWKO1+L/4WvBH54KglhGWduaLrxO9kRoSZk0HR6eySNnLme0wNdSFvIBpwJvpHZmaN
 VcMgp1hKpAxr0ol1JgipN1Fs6IlVfbgNOBJKFgwodxdQNRZyp1w2JJpNaktVKl1SO2/3Wa
 yrV+BrBkyo31q1HkgCptECXoDnOcqv9zQi0/wyeXs0UiMolmY+pNFfyJewMvoUrX63SNLQ
 YGUszTgyu35Ydjh00hl2KtfGLKUVrHmZEBJMtetbCyxt+/YQEDj6KlOEU3xOFu6tqRZ0xH
 NXNas2pqZ7gVe83/HXlvnXzUQFBjFZaJ44YVAaXqqN5ZXKW30Ffc5yZAEs+0IA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=pBrcEWKO
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2024-06-29
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
Message-ID: <20240630052510.DtlI4tqpsy_tCQRye4AICZ1Unw0aHaJECBAriwKAcyg@z>

Hello,

Autobuild statistics for 2024-06-29
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  | 15  |  9  |  0  | 24  |
  2024.05.x  |  4  | 14  |  0  | 18  |
    master   | 68  | 891 |  0  | 959 |

Classification of failures by reason for master
-----------------------------------------------

              libgcrypt-1.10.3 | 109
                    zstd-1.5.6 | 83
            host-cdrkit-1.1.11 | 79
                    gpm-1.20.7 | 68
host-prelink-cross-a853a5d7... | 64
                     cgic-2.07 | 40
                 libfcgi-2.4.2 | 24
                    yajl-2.1.0 | 22
                    ficl-4.1.0 | 19
                 empty-0.6.23c | 18
                libmad-0.15.1b | 18
               cracklib-2.9.11 | 16
                dovecot-2.3.21 | 16
                libressl-3.8.4 | 16
host-android-tools-4.2.2+gi... | 13
                     flite-2.2 | 12
glibc-2.39-74-g198632a05f6c... | 11
                libssh2-1.11.0 | 11
                  libsvg-0.1.4 | 9 
                elfutils-0.189 | 7 
                 haserl-0.9.36 | 7 
                python3-3.12.4 | 7 
                       unknown | 7 
aer-inject-9bd5e2c7886fca72... | 6 
                fail2ban-1.0.2 | 6 
                   host-go-src | 6 
                 libcurl-8.8.0 | 6 
                   linux-6.9.4 | 6 
                 dc3dd-7.2.641 | 5 
              fluent-bit-3.0.4 | 5 
               libtheora-1.1.1 | 5 
                     mtd-2.2.0 | 5 
                  ffmpeg-6.1.1 | 4 
                  jack2-1.9.22 | 4 
           janus-gateway-1.1.2 | 4 
                  libffi-3.4.6 | 4 
               libglib2-2.76.1 | 4 
              libopenssl-3.3.1 | 4 
                     nmap-7.94 | 4 
                    norm-1.5.8 | 4 
                     apr-1.7.2 | 3 
                    attr-2.5.2 | 3 
                  bcusdk-0.0.5 | 3 
                 libhid-0.2.16 | 3 
                  libnfs-5.0.3 | 3 
libsvgtiny-ea9d99fc8b231c22... | 3 
                  ntp-4.2.8p18 | 3 
                   rauc-1.11.3 | 3 
sdl_mixer-d1725fcb7c4e987ae... | 3 
              udpcast-20230924 | 3 
android-tools-4.2.2+git2013... | 2 
                apr-util-1.6.3 | 2 
                     avahi-0.8 | 2 
                beecrypt-4.2.1 | 2 
check-11970a7e112dfe243a2e6... | 2 
                 coreutils-9.3 | 2 
                   eigen-3.4.0 | 2 
                  fbdump-0.4.2 | 2 
                gnu-efi-3.0.18 | 2 
             host-clang-15.0.3 | 2 
                host-odb-2.4.0 | 2 
                   httping-2.5 | 2 
ibm-sw-tpm2-5452af422edeff7... | 2 
          linux-5.10.162-cip24 | 2 
                    mpir-3.0.0 | 2 
                      poke-3.0 | 2 
sox-7524160b29a476f7e87bc14... | 2 
             util-linux-2.39.3 | 2 
                      xz-5.6.2 | 2 
                    ympd-1.3.0 | 2 
          alsa-plugins-1.2.7.1 | 1 
                 apache-2.4.59 | 1 
           at-spi2-core-2.50.0 | 1 
aubio-152d6819b360c2e7b379e... | 1 
                 augeas-1.12.0 | 1 
     bandwidthd-2.0.1-auto-r11 | 1 
             batman-adv-2023.1 | 1 
  binutils-arc-2023.09-release | 1 
                   bird-2.0.12 | 1 
              cache-calibrator | 1 
                  cairo-1.17.4 | 1 
                 cdrkit-1.1.11 | 1 
             containerd-1.7.14 | 1 
             dahdi-linux-3.3.0 | 1 
             dahdi-tools-3.3.0 | 1 
                   dante-1.4.3 | 1 
                 ddrescue-1.28 | 1 
               ding-libs-0.6.2 | 1 
              e2fsprogs-1.47.0 | 1 
                   evemu-2.7.0 | 1 
                     file-5.45 | 1 
       freeradius-server-3.2.3 | 1 
                freerdp-2.11.6 | 1 
fs/jffs2/jffs2.mk:71: /home... | 1 
            gdk-pixbuf-2.42.10 | 1 
                  gensio-2.5.5 | 1 
                 gnuplot-6.0.0 | 1 
         host-gcc-final-13.3.0 | 1 
         host-gcc-final-14.1.0 | 1 
       host-gcc-initial-14.1.0 | 1 
host-vboot-utils-bbdd62f9b0... | 1 
                       kmod-31 | 1 
                  leveldb-1.23 | 1 
              libarchive-3.7.4 | 1 
             libblockdev-3.1.1 | 1 
                 libcli-1.10.7 | 1 
                  libnfc-1.8.0 | 1 
                 libp11-0.4.12 | 1 
                  libsepol-3.6 | 1 
                libsoup-2.74.3 | 1 
                 libv4l-1.24.1 | 1 
                libxml2-2.12.6 | 1 
libyuv-413a8d8041f1cc5a350a... | 1 
     linux-5.10.162-cip24-rt10 | 1 
               linux-pam-1.6.1 | 1 
                  monit-5.33.0 | 1 
         nvidia-driver-390.151 | 1 
                   oatpp-1.3.0 | 1 
               openblas-0.3.27 | 1 
                   pcre2-10.43 | 1 
                 pixman-0.42.2 | 1 
              procps-ng-3.3.17 | 1 
                   psmisc-23.5 | 1 
             rabbitmq-c-0.13.0 | 1 
                   redis-7.2.5 | 1 
                  rt-tests-2.7 | 1 
     s6-portable-utils-2.3.0.3 | 1 
                     shim-15.8 | 1 
                  snmppp-3.5.1 | 1 
                sysklogd-2.5.2 | 1 
                      tar-1.35 | 1 
                unbound-1.19.1 | 1 
               valgrind-3.22.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/d8db3ba26b5fc5630d31ef8f7d7b2d63d8bd7661 | ORPH
microblazeel | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/7f2109bb63fdb10eacca7fdc3bcd84f789066734 | ORPH
   mipsel    | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/6f8e40b61c6286b6585983508e1a6ffe34362223 | ORPH
   armeb     | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/968b33cae872d15559fa7814eebd6ea62660510d | ORPH
  mips64el   | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/26f5df794a377e14a20f385884230bf9f3b72715 | ORPH
   mips64    | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/2779e7311439d0e4f94c2db971581241bcc5eba7 | ORPH
    sh4      |      alsa-plugins-1.2.7.1      | NOK | http://autobuild.buildroot.net/results/f62dcac497d642ad44c3981a5ca086ccb60c85b1 |     
    mips     | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/f2aea3e59e6cc1e397d6290bf2e17861d3f16b29 |     
    or1k     | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/aeae35cddc3dab474330cd8c6e58beeaddfd8fa4 |     
   x86_64    |         apache-2.4.59          | NOK | http://autobuild.buildroot.net/results/fc203753a4b1175b2f2849c08d5ba9a05adb19a8 |     
  powerpc    |           apr-1.7.2            | NOK | http://autobuild.buildroot.net/results/bde07b1c0c658a8c1f35b78e178ad3c602596da7 |     
   x86_64    |           apr-1.7.2            | NOK | http://autobuild.buildroot.net/results/73370ca54531e22738f18303a3c4363859d78dfc |     
   s390x     |           apr-1.7.2            | NOK | http://autobuild.buildroot.net/results/2effde1d673024430671f90231b4518828a39900 |     
 aarch64_be  |         apr-util-1.6.3         | NOK | http://autobuild.buildroot.net/results/edecdfdf5526ac91e00e100b0319f50eaf3757b6 |     
    mips     |         apr-util-1.6.3         | NOK | http://autobuild.buildroot.net/results/7baab95b40f158e39c391acfa5bb628bc3dd19a6 |     
  aarch64    |      at-spi2-core-2.50.0       | NOK | http://autobuild.buildroot.net/results/ea4db10457574011449cbc2551189cdede0be459 |     
  riscv64    |           attr-2.5.2           | NOK | http://autobuild.buildroot.net/results/0705d094603ee58ce400b73c0f520c47592ad2ca |     
  aarch64    |           attr-2.5.2           | NOK | http://autobuild.buildroot.net/results/5aab7bc51efb3d37b4b07dcce778d8f1ff2eaf0e |     
  powerpc    |           attr-2.5.2           | NOK | http://autobuild.buildroot.net/results/113b7669489e51dc0b110fdc3fcfea67331972f1 |     
    or1k     | aubio-152d6819b360c2e7b379e... | NOK | http://autobuild.buildroot.net/results/5d759e13d7087d1dc384f25d170032426a060c4e |     
  riscv64    |         augeas-1.12.0          | NOK | http://autobuild.buildroot.net/results/9082bf97083ff351bb1ad22f859073afd3ce5d7c | ORPH
   mips64    |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/7382237f228ab0bb7bb9db6718d5ad32f619f94f | ORPH
  riscv32    |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/2689ce856e6b76d0fc1d2309568a890f63a86b22 | ORPH
   sh4aeb    |   bandwidthd-2.0.1-auto-r11    | NOK | http://autobuild.buildroot.net/results/b04cf1b3e5737809c87a3366fb54e94ab6bff60d |     
   mipsel    |       batman-adv-2023.1        | NOK | http://autobuild.buildroot.net/results/409355121cb8f2b365411855d661069de1e17bb8 |     
  mips64el   |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/c57a427f06a9381f19decebb13e8d20d256d9f37 |     
  sparc64    |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/3ef1fe9acb29c8c1bf9c1ee4b079612cf4a64588 |     
    arc      |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/0ac1c3f22cdae439052e752117e28738d12608d1 |     
  mips64el   |         beecrypt-4.2.1         | NOK | http://autobuild.buildroot.net/results/5d00406d86c1bd050e6a6866bb14546d0f70f009 | ORPH
    sh4      |         beecrypt-4.2.1         | NOK | http://autobuild.buildroot.net/results/9b2b3b44c6dd221ca5b810f06e46a99de5ef5ee5 | ORPH
    arc      |  binutils-arc-2023.09-release  | NOK | http://autobuild.buildroot.net/results/ebda09eda72f4e7a69e823574d7319f59ccf02a7 |     
microblazeel |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/9a47bd98a4f4775cbfd486fea853ff48f0b86970 |     
   s390x     |        cache-calibrator        | NOK | http://autobuild.buildroot.net/results/0a84c27ae9ad010ba6916ff5ce2a6d1d095ad605 |     
   xtensa    |          cairo-1.17.4          | NOK | http://autobuild.buildroot.net/results/9b97bdae5edaba877ec771f057c3883ef1a1e668 |     
powerpc64le  |         cdrkit-1.1.11          | NOK | http://autobuild.buildroot.net/results/997d91cfeb238d1287da478c0c0cfb1fa5f7d9a0 |     
   nios2     |           cgic-2.07            | NOK | http://autobuild.buildroot.net/results/e1c13e930849e3ec13bedd88c41949498d61a34c |     
   s390x     |           cgic-2.07            | NOK | http://autobuild.buildroot.net/results/e26f15bd8d66bba4dde9830a8b3ca9bdefe76827 |     
   x86_64    |           cgic-2.07            | NOK | http://autobuild.buildroot.net/results/4acdac948df78c02c089b546b00a0b3ec30713f2 |     
   xtensa    |           cgic-2.07            | NOK | http://autobuild.buildroot.net/results/fc84eebd8094fd4bfa4618c73ab740a542c1c733 |     
    i686     |           cgic-2.07            | NOK | http://autobuild.buildroot.net/results/48e15517d52cb98b81d36e6717b3790568484437 |     
   nios2     |           cgic-2.07            | NOK | http://autobuild.buildroot.net/results/c88a4697a2e773e11f1f3c91fa47170e1dab28a0 |     
   s390x     |           cgic-2.07            | NOK | http://autobuild.buildroot.net/results/7c17609262fb8c2e033a7ac17c23fe305631a280 |     
    m68k     |           cgic-2.07            | NOK | http://autobuild.buildroot.net/results/dca77a08464c9403bc42615bc3d4d04354308aef |     
    m68k     |           cgic-2.07            | NOK | http://autobuild.buildroot.net/results/1e3e001d940ed49a7423f57fa21ca7b1414c1431 |     
   s390x     |           cgic-2.07            | NOK | http://autobuild.buildroot.net/results/13f2cf382d8545a75671c80a65936da3932d37b9 |     
 aarch64_be  |           cgic-2.07            | NOK | http://autobuild.buildroot.net/results/f03859ab5b2e111cfb7711117e8cd38374fd979f |     
    arc      |           cgic-2.07            | NOK | http://autobuild.buildroot.net/results/42caf750c472a3cf873c1cf197163e3d8acf7383 |     
 microblaze  |           cgic-2.07            | NOK | http://autobuild.buildroot.net/results/8d4783bfd692309da465f0ec494108527a8b26ce |     
    arc      |           cgic-2.07            | NOK | http://autobuild.buildroot.net/results/3b4b990e5ac8ba1687e1c09dd547bd6c24c75b26 |     
   s390x     |           cgic-2.07            | NOK | http://autobuild.buildroot.net/results/2ff0b21a924b89348c8eb6b5ed4198ccd50ee49a |     
  powerpc    |           cgic-2.07            | NOK | http://autobuild.buildroot.net/results/28c38f50f53419dcaf750a81f3879f48bbdc3004 |     
   mipsel    |           cgic-2.07            | NOK | http://autobuild.buildroot.net/results/caca05366060af999fe6ee1293ef752a017b462e |     
  sparc64    |           cgic-2.07            | NOK | http://autobuild.buildroot.net/results/dced3d0bea4d7ca11b23d8cf9a9c81a604956f6d |     
  riscv64    |           cgic-2.07            | NOK | http://autobuild.buildroot.net/results/0f6672f04c36559792a6def4e7ecf53bc295563e |     
   sparc     |           cgic-2.07            | NOK | http://autobuild.buildroot.net/results/34187bbc29df22c03b59999e02fa4418309f3eea |     
    mips     |           cgic-2.07            | NOK | http://autobuild.buildroot.net/results/bc0c6494eabc0a363180c93566fa6ae46e37795b |     
   nios2     |           cgic-2.07            | NOK | http://autobuild.buildroot.net/results/7651ea91d3fb7ce71e4a1d8c40fa5760d62aa2dd |     
   s390x     |           cgic-2.07            | NOK | http://autobuild.buildroot.net/results/74acdb52069695572e87c3c04678c6b49ac4de18 |     
    m68k     |           cgic-2.07            | NOK | http://autobuild.buildroot.net/results/ae8fa8597a5faec4bd0f4f28b3f7baee7f67954e |     
   nios2     |           cgic-2.07            | NOK | http://autobuild.buildroot.net/results/a2ffa39cf7d39ef4411686b8d9d7cf057deb87b5 |     
 powerpc64   |           cgic-2.07            | NOK | http://autobuild.buildroot.net/results/aab8b8b23d0a0f204f1e8ed5a34d9e6bce9f8dfe |     
  aarch64    |           cgic-2.07            | NOK | http://autobuild.buildroot.net/results/a2b867e80ebe420f54ee0f3263557e50761c4cc5 |     
microblazeel |           cgic-2.07            | NOK | http://autobuild.buildroot.net/results/440c28ea08a40972e73cf1eddfef3bc57614c764 |     
  riscv64    |           cgic-2.07            | NOK | http://autobuild.buildroot.net/results/367d6548f28e80d5c388cafdc6bb4e070ceea8a8 |     
  mips64el   |           cgic-2.07            | NOK | http://autobuild.buildroot.net/results/df0029325d5705e709686d1d328493237c0dcda5 |     
   s390x     |           cgic-2.07            | NOK | http://autobuild.buildroot.net/results/e3c53b2e85efc582bdb5d605649208c89bb50bc0 |     
  riscv64    |           cgic-2.07            | NOK | http://autobuild.buildroot.net/results/89f6d144fc79b3af52fcc1f5d72d6e395348a29b |     
 aarch64_be  |           cgic-2.07            | NOK | http://autobuild.buildroot.net/results/370b01691fa5960e1fc9fc7501e5f70bbbb9b200 |     
  riscv32    |           cgic-2.07            | NOK | http://autobuild.buildroot.net/results/a00b151d3f94556b7d1a66e8f92769ef0291b9cd |     
  mips64el   |           cgic-2.07            | NOK | http://autobuild.buildroot.net/results/33526e0585e4fe599946bf17043308202f60e2b4 |     
   sh4eb     |           cgic-2.07            | NOK | http://autobuild.buildroot.net/results/bb59c207201d307f0018bd180b0d2ff341ae1a77 |     
  riscv64    |           cgic-2.07            | NOK | http://autobuild.buildroot.net/results/d628e28cbc3430910b1080c69ee795445cb33c4e |     
  aarch64    |           cgic-2.07            | NOK | http://autobuild.buildroot.net/results/8a8489d0249d3a49ac231a3f7243e96aef0f8fff |     
 powerpc64   |           cgic-2.07            | NOK | http://autobuild.buildroot.net/results/db6531aef6729df2088f5dee2110c4828663a4fc |     
powerpc64le  |           cgic-2.07            | NOK | http://autobuild.buildroot.net/results/395e45acc11dffdda33d1f7f70ce1057c3bd011e |     
 aarch64_be  | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/cc37ac1807bde08331a5a1869222ffea00f10305 | ORPH
    arm      | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/936bb5d53e9604bb6489842ee9ee45341271cd76 | ORPH
  riscv64    |       containerd-1.7.14        | NOK | http://autobuild.buildroot.net/results/aeffd6856eb541b06dddb2fb994ecaf55a1c03a9 |     
   sparc     |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/f05a8709921ba2ff458f4e7511dcd94b52a48264 | ORPH
   mipsel    |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/24d9a774bead67fe2557844b65569f70c315882a | ORPH
  sparc64    |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/776fcc23d87745a31239f9a58a5a5f093760d7ef |     
   x86_64    |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/c5944fdf3463929d80d7663c05f36c76b2579018 |     
 aarch64_be  |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/6bccef64d751137cdbe3bec7ebdd06e6f234e276 |     
    i686     |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/816bbab251b1fb80537116be3fee7a73391b5b51 |     
 microblaze  |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/b2843e780cf3f57d6e12275c7ef7fae2b669f2fa |     
   s390x     |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/1229e84a2660ba732124612b9f490094000c4215 |     
powerpc64le  |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/d8e2e841a5be4f77003956cc9bb8e6ab912dac6c |     
   sh4aeb    |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/eb87cfc169c108e4e4a6ee38579cfdada4ec545b |     
   armeb     |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/e95abbe47b02e45e606ac4ee7f463da1dea76a4d |     
   mipsel    |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/66e74d8466e7a156d88ad6e7e305970f5ab5d1fc |     
   armeb     |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/87ec7a9fc1aa6af26061b1b34b749b0642b8a22c |     
   xtensa    |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/18ebf9a1ff1dd0c3f0d0a20c8a997d66e34cf551 |     
    arc      |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/5b09f19c141b602198e2bdbbc767f8be0d6f9357 |     
    arc      |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/8a25c914783c8e8c7182e935223f9dbae8457a1a |     
 aarch64_be  |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/032470eff82d282356f0d7a4e58d7a501f93c9b4 |     
  mips64el   |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/fac18c9de65b92088cd6a0bddb46fd55de17818e |     
   s390x     |       dahdi-linux-3.3.0        | NOK | http://autobuild.buildroot.net/results/bdbcc57fa190672e9a8a50838142f03589a68bf8 |     
 aarch64_be  |       dahdi-tools-3.3.0        | NOK | http://autobuild.buildroot.net/results/37463cdb44cd58eaa6140c5274c1b444857d4181 |     
   sparc     |          dante-1.4.3           | NOK | http://autobuild.buildroot.net/results/c9dd1aae9017c6c5d84696dd82442409d98f00e1 | ORPH
    m68k     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/865d334eba3f5f867d1fe08793a2c1b9e01f0333 | ORPH
   mipsel    |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/50db6538032bfd9e4134f734cf8f9fe973b12403 | ORPH
    or1k     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/b3a7b35a8cb2241c63a59338504d665bf78bf199 | ORPH
   nios2     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/c9f736edde93ba5b479f809c43f3df120b5aca8d | ORPH
    or1k     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/e1b9e93965dc88f52a2a41df03968f487e546e9a | ORPH
  riscv64    |         ddrescue-1.28          | NOK | http://autobuild.buildroot.net/results/566933a1ba7fdea6a44509b4cc392f9ce94421b4 | ORPH
   arceb     |        ding-libs-0.6.2         | NOK | http://autobuild.buildroot.net/results/b12b99d0eebd5de91af9c45431b43203ef1580bd |     
   armeb     |         dovecot-2.3.21         | NOK | http://autobuild.buildroot.net/results/071875a4df3253d579cd7c405c8e432ca8d2b696 |     
   armeb     |         dovecot-2.3.21         | NOK | http://autobuild.buildroot.net/results/58633dbfe7b060bbe77249fca6822ef569a4599d |     
    m68k     |         dovecot-2.3.21         | NOK | http://autobuild.buildroot.net/results/5a7b904d553679f6cc288484a814423e96deba4d |     
   xtensa    |         dovecot-2.3.21         | NOK | http://autobuild.buildroot.net/results/c3a06c101b084f1b0a24974ef14551f586e6fb70 |     
 powerpc64   |         dovecot-2.3.21         | NOK | http://autobuild.buildroot.net/results/a17c9f7d4fb774dfdf0f3c073f0b8097cfef4c14 |     
   mips64    |         dovecot-2.3.21         | NOK | http://autobuild.buildroot.net/results/bc1c89f47ed05ef10946799e34e0c55f91c383c3 |     
   mipsel    |         dovecot-2.3.21         | NOK | http://autobuild.buildroot.net/results/988e801d290023094e3a5e3fc8b317314cc15674 |     
   xtensa    |         dovecot-2.3.21         | NOK | http://autobuild.buildroot.net/results/f594e52d790110840d4e01fde6347629e682a10a |     
 powerpc64   |         dovecot-2.3.21         | NOK | http://autobuild.buildroot.net/results/dbb6779488958be6d1ede2ba76c4bda53cca6c61 |     
   nios2     |         dovecot-2.3.21         | NOK | http://autobuild.buildroot.net/results/efc8a7245b555f1d8765d61846ce3ae098e6059b |     
  riscv64    |         dovecot-2.3.21         | NOK | http://autobuild.buildroot.net/results/14a9e51d39d1a5b4f551411a163b285cff46e687 |     
 microblaze  |         dovecot-2.3.21         | NOK | http://autobuild.buildroot.net/results/cc258a5e16ce8e2763ddfddc697a59fd229d82f1 |     
   x86_64    |         dovecot-2.3.21         | NOK | http://autobuild.buildroot.net/results/3192d4075b23e5dc4f93f48a6a7b91bf8eca1514 |     
   sparc     |         dovecot-2.3.21         | NOK | http://autobuild.buildroot.net/results/dff1ea46e85676dd8f4c8ce93c368c7645dc8219 |     
 powerpc64   |         dovecot-2.3.21         | NOK | http://autobuild.buildroot.net/results/5f2b59de5a24cdde4586c28defcce5d7548ef2fe |     
   nios2     |         dovecot-2.3.21         | NOK | http://autobuild.buildroot.net/results/e5a9dc77460308e913f2a5dfd5d0e83b5e7d7929 |     
   arceb     |        e2fsprogs-1.47.0        | NOK | http://autobuild.buildroot.net/results/f3f52847c9ab42200eecf5ef72648173cd3d12a4 | ORPH
    arc      |          eigen-3.4.0           | NOK | http://autobuild.buildroot.net/results/46327a0db7d2dc6a237d78167f926e5f159b5f66 | ORPH
 powerpc64   |          eigen-3.4.0           | NOK | http://autobuild.buildroot.net/results/53ae5e9c0cf7b1a455c4901a9c6b50f025f32ae6 | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/42feec9ba1b95c29af9d61c3cbf0df1387f5decf | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/786caf75bdab79c9820331ebc8ddc943bba0a322 | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/8c745210426292de2ea6261bf3c23b1b798d26af | ORPH
  mips64el   |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/ab6ea2bf778622aad5cef9843547f4edaedaef10 | ORPH
  mips64el   |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/2578169d89cd48bb3ffc92f4de29a236cc70d9c1 | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/85e02e434e462925ab14badc2467639d84cf49c9 | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/67c2758f598a03bf36ac95ea785d51e30f59527d | ORPH
   s390x     |         empty-0.6.23c          | NOK | http://autobuild.buildroot.net/results/363ac7b18e423fd358f23df26dd84262cb5239ae | ORPH
   mipsel    |         empty-0.6.23c          | NOK | http://autobuild.buildroot.net/results/db4b82bc09c6d87d667ee90851a0f5d2f3450b1e | ORPH
    arm      |         empty-0.6.23c          | NOK | http://autobuild.buildroot.net/results/c3703db1c255d12bc809cc5e6bcc84d674babac0 | ORPH
  sparc64    |         empty-0.6.23c          | NOK | http://autobuild.buildroot.net/results/fa656274dce8b6eece8afa282af60756b2902500 | ORPH
   x86_64    |         empty-0.6.23c          | NOK | http://autobuild.buildroot.net/results/d9ed15a5e2dbf3d914ace9e835bce2f8d647c132 | ORPH
    m68k     |         empty-0.6.23c          | NOK | http://autobuild.buildroot.net/results/a65430a6849c975755ec1db2b1568ec31c7b8769 | ORPH
   mipsel    |         empty-0.6.23c          | NOK | http://autobuild.buildroot.net/results/7b150415325a27e39fd7a4ee67dfa150038a6a7b | ORPH
   mipsel    |         empty-0.6.23c          | NOK | http://autobuild.buildroot.net/results/0fe874c2206f715c0dfeb98ef6022e579d71a753 | ORPH
 aarch64_be  |         empty-0.6.23c          | NOK | http://autobuild.buildroot.net/results/e30eb1221a971a2235f08c7f4306f205f5469ece | ORPH
   nios2     |         empty-0.6.23c          | NOK | http://autobuild.buildroot.net/results/bce71db1c19a347c18606b2e923ff33261c8c890 | ORPH
 powerpc64   |         empty-0.6.23c          | NOK | http://autobuild.buildroot.net/results/2b47943b1defd46fb6dfbb1ccc0d5075f767d6f8 | ORPH
  powerpc    |         empty-0.6.23c          | NOK | http://autobuild.buildroot.net/results/76cbb8a963b6a92cac52339f4b92298fa6d51865 | ORPH
    or1k     |         empty-0.6.23c          | NOK | http://autobuild.buildroot.net/results/264b6e5f634dfc3ba814e899020b0649863b6ec8 | ORPH
 aarch64_be  |         empty-0.6.23c          | NOK | http://autobuild.buildroot.net/results/c1356d74d3514d249af43b679449466048c89054 | ORPH
    sh4      |         empty-0.6.23c          | NOK | http://autobuild.buildroot.net/results/c12b4d95b54fcdfd99b0db85d40bb66f8c06b83b | ORPH
   mipsel    |         empty-0.6.23c          | NOK | http://autobuild.buildroot.net/results/21143cb9f09ce3b6b28c86419a7ef5e0da31d55a | ORPH
   armeb     |         empty-0.6.23c          | NOK | http://autobuild.buildroot.net/results/e6916935252f5190d52ed316a1f74966671d7855 | ORPH
    mips     |         empty-0.6.23c          | NOK | http://autobuild.buildroot.net/results/1fba773437a169d4bc293e7c42389b1b6856ee2f | ORPH
   s390x     |          evemu-2.7.0           | NOK | http://autobuild.buildroot.net/results/3656d402c95b7d222444dbf432ed4d431ab27c76 |     
    mips     |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/d8e8005c6ec3fe7f1e33904c514455ae7f0cf0ed |     
   nios2     |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/816f3df9db8074f5856af40153ff867615d5b780 |     
  mips64el   |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/dc15e20cee252a480550c9ad41c26de55468ba50 |     
    or1k     |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/72dce3abd7c956bb54a219a5ff63e5bf7afd94a5 |     
   nios2     |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/eca4b9e2da0971e2ebdfd264a6579fc2d1e4d2bc |     
   nios2     |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/de15586f04dc27643e7ff3930a9f49162148c275 |     
    arc      |          fbdump-0.4.2          | NOK | http://autobuild.buildroot.net/results/9355842d21da05363ff7911b6de09e5654a20873 | ORPH
   armeb     |          fbdump-0.4.2          | NOK | http://autobuild.buildroot.net/results/4210e800640a5c707684c1157e3e9e78ed0fec5f | ORPH
    arc      |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/64903b44f66946e84db2b823315fc8108db741c6 |     
    arc      |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/784e7cca4c44a1ca620bf1ba09d9404c12f142c9 |     
  riscv32    |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/575e3e002b445614f5c429681b67df7ff3c63757 |     
microblazeel |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/9efb255a3b782e44e6f06779537287b948bd9c7d |     
  aarch64    |           ficl-4.1.0           | NOK | http://autobuild.buildroot.net/results/da6ee03f600fd2e4dc33d204498c03f8399b228d |     
  riscv64    |           ficl-4.1.0           | NOK | http://autobuild.buildroot.net/results/69e4c715b2e3e557c9fb4f36c67a0fef57ebcdd7 |     
  aarch64    |           ficl-4.1.0           | NOK | http://autobuild.buildroot.net/results/5e72517e5b61619abb7b45f7865efa9376ea1867 |     
  riscv64    |           ficl-4.1.0           | NOK | http://autobuild.buildroot.net/results/0434eda3d6f51c77b1b3eee26a9eef7c6e7fe283 |     
powerpc64le  |           ficl-4.1.0           | NOK | http://autobuild.buildroot.net/results/49d73630720affffeb28c0961d3dc4e67a4fe2ef |     
    sh4a     |           ficl-4.1.0           | NOK | http://autobuild.buildroot.net/results/621ad605919fce83168f9475b393a3d42662dbe4 |     
   armeb     |           ficl-4.1.0           | NOK | http://autobuild.buildroot.net/results/1e3472b7557d1738d2074c9ffa682286688ec10c |     
   nios2     |           ficl-4.1.0           | NOK | http://autobuild.buildroot.net/results/8fc72e0cd46c58fab24a787dc82a753a25811370 |     
    or1k     |           ficl-4.1.0           | NOK | http://autobuild.buildroot.net/results/c61041720fc6d26d529b4b268ce65695f69dca7d |     
 aarch64_be  |           ficl-4.1.0           | NOK | http://autobuild.buildroot.net/results/038006a779b60a5bac0c52d6cf7c34fef38e6f13 |     
   s390x     |           ficl-4.1.0           | NOK | http://autobuild.buildroot.net/results/7b89b6f7f73d49091d5219db4703a6e7333e3761 |     
  mips64el   |           ficl-4.1.0           | NOK | http://autobuild.buildroot.net/results/18deaea8d8ae602f6f2c328f1d109a2821181801 |     
   sparc     |           ficl-4.1.0           | NOK | http://autobuild.buildroot.net/results/4ee61d88e5e894811d1e65bab70b3e430cd60a32 |     
    arm      |           ficl-4.1.0           | NOK | http://autobuild.buildroot.net/results/cfd6c81e356793516f9a3d93960f09a8140939a9 |     
  riscv32    |           ficl-4.1.0           | NOK | http://autobuild.buildroot.net/results/c988c94f93b267467e74206cf05a3f1319e99565 |     
    or1k     |           ficl-4.1.0           | NOK | http://autobuild.buildroot.net/results/c1b8905cad3c7e80f4c6d25bb796ec7f1dc88d7c |     
  sparc64    |           ficl-4.1.0           | NOK | http://autobuild.buildroot.net/results/a5a1ead3b28e2cb1d8609d50e44622c99ab45de4 |     
   nios2     |           ficl-4.1.0           | NOK | http://autobuild.buildroot.net/results/9827e3c8ce8ab89011a0e535f59a5d14e84c88d6 |     
    i486     |           ficl-4.1.0           | NOK | http://autobuild.buildroot.net/results/0e5b86e0646931cbad983a3ed4aa2533e3baae05 |     
  mips64el   |           file-5.45            | NOK | http://autobuild.buildroot.net/results/2552fc5f8f7b71df039d1f70efff06d07a83d322 | ORPH
  powerpc    |           flite-2.2            | NOK | http://autobuild.buildroot.net/results/962a1070fcc6f789d7efadca6bf6e058ad536c81 |     
   mipsel    |           flite-2.2            | NOK | http://autobuild.buildroot.net/results/cb35afe24d057fa14f553b0db980fae1711fcdd1 |     
microblazeel |           flite-2.2            | NOK | http://autobuild.buildroot.net/results/08fcb485ba841f96ed9b28e3a508155f0394ed9b |     
  aarch64    |           flite-2.2            | NOK | http://autobuild.buildroot.net/results/40b06ba8975ccffd859192f43777a272baec7225 |     
  mips64el   |           flite-2.2            | NOK | http://autobuild.buildroot.net/results/2975d26064c8a07cf6f5f7d729cb57626570c94d |     
  sparc64    |           flite-2.2            | NOK | http://autobuild.buildroot.net/results/35a082b95df7faf4eb1ce793fb382a6f6a451922 |     
    arm      |           flite-2.2            | NOK | http://autobuild.buildroot.net/results/a8c0f532d7888c6d3a6ed438f3a3448a43c69dea |     
microblazeel |           flite-2.2            | NOK | http://autobuild.buildroot.net/results/5a3ad30054ef9bea7c2610eace41ff477294f36a |     
    arm      |           flite-2.2            | NOK | http://autobuild.buildroot.net/results/cd4f79a0380af642a7b457700e36b09b94260387 |     
    i686     |           flite-2.2            | NOK | http://autobuild.buildroot.net/results/6f904cdab3972f777784906b33fa3f15b96cafed |     
   arceb     |           flite-2.2            | NOK | http://autobuild.buildroot.net/results/95e32b6017d439e228889a7bc926373d31ceabf3 |     
    i686     |           flite-2.2            | NOK | http://autobuild.buildroot.net/results/23522a997fee63e65994d4b0cd0a7aaa1b9e0245 |     
    m68k     |        fluent-bit-3.0.4        | NOK | http://autobuild.buildroot.net/results/b560c679e95ff226bdd29451c19e1d7a0913fa1d |     
   s390x     |        fluent-bit-3.0.4        | NOK | http://autobuild.buildroot.net/results/17805ccf8d5c369976e7e0fe15b8b37626fc0d2f |     
    m68k     |        fluent-bit-3.0.4        | NOK | http://autobuild.buildroot.net/results/12cf405f10471006a571c18f7171976ad46562be |     
    or1k     |        fluent-bit-3.0.4        | NOK | http://autobuild.buildroot.net/results/79c3b31b2a80dbbfd9433ed0c90c2a1d09b4fd40 |     
    i686     |        fluent-bit-3.0.4        | NOK | http://autobuild.buildroot.net/results/3d87307e5d6931fb42d6e361ca515542feda190c |     
   x86_64    |    freeradius-server-3.2.3     | NOK | http://autobuild.buildroot.net/results/b0a0bc00edb5daecd2413098d6e703405d777af8 |     
  sparc64    |         freerdp-2.11.6         | NOK | http://autobuild.buildroot.net/results/43126c94702e44241e64535c05207f4fbb4079d3 |     
  sparc64    | fs/jffs2/jffs2.mk:71: /home... | NOK | http://autobuild.buildroot.net/results/b64e16eac0c824832e052f75ca20bb91bc221849 |     
 microblaze  |       gdk-pixbuf-2.42.10       | NOK | http://autobuild.buildroot.net/results/20c27b28ae3884b4b9eb1bcb51060f3927dae711 | ORPH
   arceb     |          gensio-2.5.5          | NOK | http://autobuild.buildroot.net/results/c3bdf15058fddbe4ecb31f430e027b121b27eb62 |     
 powerpc64   | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/3d1c28655a576c90b522bfe6b232f8e4fd9f417b |     
powerpc64le  | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/aac676368856f916c7c6440c73a3fc333a0da74b |     
 powerpc64   | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/dac08d1960bc5cb83c3e172ac3b9a948a999415a |     
powerpc64le  | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/d7292b7c77b8a21db730b08da77f635af7b02ff2 |     
  powerpc    | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/1c11e0e9bd636d73bf55265ee3c682674b0037b6 |     
 powerpc64   | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/f81f046ca3c4c80a72b117229b7d7d7667efad16 |     
  powerpc    | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/69e15d9410a846433d2d06a16891c7fb2698f8e3 |     
powerpc64le  | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/9318fd221e0280dc892604f9163bac101d3b20d6 |     
    arc      | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/dabf585318778135118c816df369ea8320a417a6 |     
   arceb     | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/08c7fd21d6c23caa8915fd4d44d84a329486e4a0 |     
powerpc64le  | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/e18bae5a95ad57ae38318b3d03cd6c2e1e1fae1f |     
  aarch64    |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/d2adffb7c3d0dd02a75de443f0ed25749533af85 |     
   armeb     |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/ed8f158503928ca2abe0ec0cf8bc123dd266e7e2 |     
  mips64el   |         gnuplot-6.0.0          | NOK | http://autobuild.buildroot.net/results/b72702ca3d7b5ca8eea8e053b21706c96dc34c48 |     
microblazeel |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/9b73f1137be74101dab77b1ddc00110a1ffb0b3b |     
 aarch64_be  |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/80cda5992c4ef1e49b1271eeb42989ab6c38c99a |     
microblazeel |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/d5dc2563c8d06dfa433af2c62e148305401b7ec1 |     
   s390x     |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/6fc3a31210a8132c0cdbd527cd424e8992ff1e2a |     
   s390x     |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/63931334a450de662952f81c5095ed98bc14c35d |     
powerpc64le  |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/89fdcfaf2692e50ae9127d556c86bc6e826c02fa |     
 aarch64_be  |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/6df44a2a9e8263260e166fb34148f7003b85beb4 |     
   nios2     |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/ec18f9f0f08909a8d016333a71b266d588faf628 |     
   arceb     |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/6d7b46dea334571c51c4e2ec09f73a7c71f5fa3f |     
 aarch64_be  |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/caabeac080d462c3156dc2eaf04ac783f9364a68 |     
  mips64el   |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/c7147c64b82d17e6240ff43ba5eb942d9765b8f3 |     
  aarch64    |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/06bfc8f988e99c143c9dc3cf19b8801de925df8c |     
  mips64el   |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/c44b7d7cc3c94a11a2758038abec8363dab911dc |     
powerpc64le  |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/c0ebc61c860df2d67c1e5502d73fa0585393e84f |     
    arm      |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/269ad35222f162ec9a1d001c5abdd4d2735cc916 |     
 aarch64_be  |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/6eabcae1a9dd9f5b2bb8b46db185e7f72ae03728 |     
microblazeel |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/32ecb20d8fe3f719ff75205021a7672eb03f5924 |     
    mips     |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/cd1558aada165c8d461bc395c2262e72a5cf948d |     
   mips64    |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/4cfbbe6d65842cc583680fc4d9fa738d203f0c30 |     
  sparc64    |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/fca33d5fec15a04c3733de162384451df28c3739 |     
   x86_64    |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/ef90d4a18fc538993594524d3d3d934c6f58d197 |     
   nios2     |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/6cb1906e5211ecb01f3d8b23a272aa3cb601e191 |     
powerpc64le  |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/45e1f8e21bc7e9bfaaa6ba3a78ea922009e921cf |     
 aarch64_be  |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/5950052718e6e99369d58cc993d4a73ced00e1a3 |     
 aarch64_be  |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/e955da88b2f39666da4db9eff6acba78fde6426d |     
  aarch64    |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/9694ce16bb36ebfd56335166f6871e7e89034614 |     
  riscv64    |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/0ab6b10aa595f5f50577ccb7ff220d52be794d8a |     
   x86_64    |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/5bf333337005e24133e22b1bd31375a13e634cb4 |     
powerpc64le  |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/81bb81361f7ead2fc4854d32b23a10fcea5067e3 |     
  sparc64    |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/a260febe84b51840c3019c21480058cc5cea9794 |     
   s390x     |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/77376c2cda16144b887dc159f33cd20c7fcc8470 |     
   nios2     |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/9f0c4135460120bc70020bd231a7d9acc4a08789 |     
   s390x     |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/529805cedbef1097f572cf897a3a64232271a1b6 |     
   mipsel    |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/f8dcd4d2f34a220c76f9ca7b69c4a4db81bc7b85 |     
  mips64el   |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/4f6ded85f8984cfa627cf725d54f2c6bc1b7a218 |     
 microblaze  |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/7b8bd31106da8d6a9f317d845f01d885c7cbb18d |     
    arc      |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/00b230e115a20de250b60b6b37192c6280785d42 |     
microblazeel |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/b04ba001b019fe79e0217d7eb9b1e204c216bce9 |     
 powerpc64   |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/a2440bf55e3f97086d701f965f41dfa01b989dc8 |     
    arc      |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/dcf8e7ddd336f9919c05e8c71b722dfdf012f0b2 |     
    i686     |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/a29e001e02a6a87852fa65af9c538ac3340fcbc1 |     
    i686     |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/b7d7be68bf03d70c39e198fe39ac4616b710de5f |     
   mips64    |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/650acb87d44028c8dbab6a690759fd029c3750aa |     
 powerpc64   |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/e1315bd77949d156f4c85c31afd769343b959a7d |     
  aarch64    |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/8358ccc7048327aeb7e41d06496f3658e2568fa6 |     
  riscv64    |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/6216bd13b51e9d59acf14329bbc0f5e3e6a72d23 |     
powerpc64le  |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/dc3265ad53b9973342abf10bb6994d91bccbc6c1 |     
powerpc64le  |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/8340f37357990609ccb543ac78c5964f68a6c3ab |     
 aarch64_be  |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/54c39b2784380bf3b270f54954cb58bcc47c1c7d |     
   nios2     |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/c1611bf56e294c65701df1e84fa82e3a339ae6a7 |     
  riscv32    |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/b20e86b54d7ba357c0d196cc6dff0ab258f17a7c |     
microblazeel |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/3c7c5f2e4e9d469aa7e5bba4a52f12486e78ea2d |     
    i686     |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/2980e91da6663b8c6bc3b518325685f8bc057332 |     
   sh4eb     |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/1bee8a0ac3230cbfa5bb33d97009c1e4668a4328 |     
   sparc     |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/dc0fea6957fe9de34d8958d8ef4376681dc39546 |     
  aarch64    |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/c09d526eaa3ee0ac8483bc6dd44eb242a688f844 |     
    i686     |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/f454246b3fe2d3bc13b373dbf05bf24e7e3f8bcd |     
  sparc64    |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/a26c9edc77f34befeb890f0fd984732ba0220fde |     
  sparc64    |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/170880b7d634982c5c581320dffa9f6f9fdcb2d7 |     
  sparc64    |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/59146509e0fc6f56b6e4e3ee0ac9ad26dc004159 |     
  mips64el   |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/8ee1aa788e0d5813125c0d559f0e2ba92bf4031d |     
    arc      |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/149f553572251467de357ed33c602ad60b04cb36 |     
 powerpc64   |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/6c10d55564118d930a589af7416b259edaaa916a |     
microblazeel |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/67e19a19889ad0e969c235456acd0cc6534a8b38 |     
   arceb     |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/98fe1efa898964427b13ed67d64ca2613e26552a |     
   s390x     |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/1e4f1cb769fc72e56b6cb153737a2efdde6431ce |     
   arceb     |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/73c559e562eaa0f578b4061d67c8eadb7b9a93e4 |     
 microblaze  |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/6efca033b9996704d03d8143112e8c172a68cf77 |     
    i686     |         haserl-0.9.36          | NOK | http://autobuild.buildroot.net/results/eadb71b61e8b3cac2594e35cf5fd61d9b8d272fc | ORPH
  mips64el   |         haserl-0.9.36          | NOK | http://autobuild.buildroot.net/results/d08843a88e818de3360a4de6f7f44d55a1b514a7 | ORPH
powerpc64le  |         haserl-0.9.36          | NOK | http://autobuild.buildroot.net/results/37f4964843db68745c38bf759f10d07be6b55579 | ORPH
microblazeel |         haserl-0.9.36          | NOK | http://autobuild.buildroot.net/results/cdfd8f387bf3e0931f3d9b20d6260310387948e1 | ORPH
   s390x     |         haserl-0.9.36          | NOK | http://autobuild.buildroot.net/results/b2422d1a396af456be8dd1a7e014921e72bf8592 | ORPH
   armeb     |         haserl-0.9.36          | NOK | http://autobuild.buildroot.net/results/f89dec0e1774de69f58d0d8e21646000a5bcc9a8 | ORPH
   mips64    |         haserl-0.9.36          | NOK | http://autobuild.buildroot.net/results/1bd3e0a7710f73fe5a90bcce6a293ba696f1873d | ORPH
   arceb     | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/56d5e50a242826937fb72fb0430f344a9129878f |     
 microblaze  | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/34f9757b425fb6132e2bd065a9abb231f99e4628 |     
   xtensa    | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/7db4e3f9eea969701ba2922fdb89d9f2049f37e1 |     
  mips64el   | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/1b88226001d5b14d37f25c9c049038b924433ea0 |     
  sparc64    | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/0796095a3f6fa593ebf8511b5e2352efb456c906 |     
  aarch64    | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/feee23000e440b535582b8421bae2f376dbcde71 |     
    arm      | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/03e932944d0950bebac5246c634ee6343b0663ec |     
 aarch64_be  | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/c1bf99c1e520d291aaa1f2aab8676a9a3bae4063 |     
   x86_64    | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/fe96232a51034689a8cae6170489d59cb5605342 |     
   sparc     | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/ae7f9f68cba7ecbc90d7b08a2f6b7b8a80dcdbb0 |     
   sparc     | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/b278e3b6b95135c4f06a1360fe5f6d03439a3828 |     
   s390x     | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/86b1c0ed1dfab520a624a0594eee0c1ebd376c80 |     
  riscv32    | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/a1ffa5a7d694181446110e4bd2a6e2dd1b1043d0 |     
  riscv64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/b79444db12463093d9f06b396fa3e43ae523b7fb |     
  riscv64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/8692421a355e684f77df54b75505f7e9e9617a41 |     
    arm      |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/6e94415536c8b585579d11c0e533127a730eab05 |     
    mips     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/cd661e2300123b5faff7162556449a277e29714d |     
   xtensa    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/594fe7b7ec0e3b7a56e5f730ad433024f2fcb094 |     
 microblaze  |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/0d034e9c36b255e5658c82dc453e442fc3a2b438 |     
microblazeel |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/31f8191eae7086d57b926be9e11e150f82066aac |     
   arceb     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/5e03632da26dee18fcfdb442ab94c558022c3891 |     
powerpc64le  |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/a517ed20fc47ff459437b632deab3bdb32eb9921 |     
 microblaze  |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/3a03b80a93f6123df2b7cae46da3aab40b48faed |     
   nios2     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/269ad5d38a00b9f618a1f2b981cbff737fb6f819 |     
  sparc64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/861115851daffb36542aa05902d6c8668714a40e |     
powerpc64le  |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/4f6c52429f41550ae1c1e9a975241553b9a8313e |     
   xtensa    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/0a454fea88cc81c20e4df173a6463c42d6a996ad |     
   xtensa    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/93fba089c9db5296ed524080c39092aedf3bd89c |     
   armeb     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/2cf887c21463d3ede1e12b62abd8c18823c9c8bd |     
  sparc64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/9296735437c8df7431833fd280e9617b2d1d3f15 |     
 aarch64_be  |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/7568314dbc38a94c60927ba28669f611c1085929 |     
   sparc     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/87b16dede72497a4a0ccc6a456e5e6ea81b1bba9 |     
    arc      |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/cf433aa65a95c15c9917870dfe218daf36460bcc |     
    or1k     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/ea1198951a05808d9b00d666ad50714df827def9 |     
    mips     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/6ab0e90b6ddb712c458da30b34bd767ee8e4695b |     
   sparc     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/a569ef8940dd65175074f81051c3f2eaed923745 |     
    arm      |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/d6a88caad7e37eed92e7f962d674b10bcac7bbd0 |     
 aarch64_be  |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/5e65fedec113acc4a51ab0f27b608fb9782c142d |     
   armeb     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/eb4a8f7e32bb2632ee394acfd590dbe89172113f |     
   arceb     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/298c281db3a6a3a1a5e55c2264d5c3d2ba66d47f |     
   x86_64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/4807ec57ad164867f71529b3c79203de67d6dc54 |     
   nios2     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/387af7d7ea3b14cf0756f5609253d8f667802654 |     
  sparc64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/348126f104baa2f9012098d07648c66a05886990 |     
microblazeel |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/3db4088d29f6e96dc96c592e04e266fd33a62c59 |     
 powerpc64   |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/f2a38c0b4df9a593e289622e2dfb1fc3656e6445 |     
  mips64el   |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/e5e4a5b72927f60a3b0db65905a8d4eeaa0b325b |     
  riscv64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/31cbc321a6e8dd2791b64ab142912dca3ac439f9 |     
   sparc     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/229e4b3a5ee8be0cb2585022278416a097ef321e |     
microblazeel |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/55dac34ac395383a784c2c6212a2290c1c8bbc10 |     
powerpc64le  |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/38590c08babf1d40a3ca7d3fa379fac9c0edd81b |     
powerpc64le  |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/9c8ccf84d385fbf04180b4ffffc21ef0fc79427d |     
    mips     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/5dcd4dd952e8c50eab6c5e9ce5fffc9573d2d101 |     
   armeb     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/8cdd39ab8760bddb7acfb8036cee0d8c5a0c9337 |     
 microblaze  |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/bce8561c4e3ccacbce2f665abb16c05b42a80f6e |     
    m68k     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/d9f6fd6d6aa5ae642616b9df60af50641b6bed86 |     
   s390x     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/245b19164a0b18bdfc6592d03f9456ec30c0952a |     
   xtensa    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/e2c0c0980c078b9f772bebb96df8e8465f911f29 |     
   s390x     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/0fc7f1f2417bd5480687aa2dcf8e430c13c04f4a |     
    i686     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/5ced39e24b4fc93d431022d6d9d19ae9a2aea91d |     
   s390x     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/412218bcc10ca12580433d623cc7df26ef63dab1 |     
   armeb     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/3c53a173c3c4a1f2fcb98c8023f0cefb5580a45b |     
   x86_64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/7f7570565e9aa08853bf7b0e5f35d021279d59c3 |     
 aarch64_be  |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/21a5e523f33077c292417b51af191821713c331e |     
   xtensa    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/3f634751d44d408a8c06848186c919acf7581cb4 |     
   s390x     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/65d9f6f75e96c23e0eefeda6068434f480fb4dbb |     
    mips     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/b9d909c0b404c54df2f4b89ce5ecf5e672083bdb |     
    mips     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/2942d8569f0f191be53c57e66550906f75c1332d |     
    m68k     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/58c1d7892b2ffc6df57c1eff4b50f7234b292b3f |     
 aarch64_be  |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/b893e2f5da3207afdfebd9dea1b30939e514644d |     
   armeb     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/61306ead2cfd029e801812f2b4c5f9fa0861162f |     
   mips64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/e85b512642016869f3649586b58d480c8fb7d20d |     
   armeb     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/f12a56064e0f0690580f2552100df2ab80d0f67b |     
   nios2     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/ad5f893cff4d6a9067a2d478da9852fe73410645 |     
   mips64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/08d4a650467ac361d5e487cfea9cbc9af6af6865 |     
    sh4a     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/15b45a4b7f825bb50861b826b6499662ea5071a3 |     
    i486     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/574c9cf707a0966231c52846538208c8ce4599da |     
  riscv32    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/1b127d03193a8cc8287d0c726eac02a0593c748f |     
microblazeel |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/223ec7d7860358c1c79b53f3ab1de48b47da3cf4 |     
   sparc     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/2ada43993b6697823cc948ca34efcc98baa951fc |     
   mips64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/98481443f257df83e5cd142c8a74ffa59500ead3 |     
   x86_64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/b4d7402567d3cf49b3fdec32f8c001a71770e29e |     
  riscv64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/8588b5b0f717e4b0badad9605948ac1da9a87895 |     
   s390x     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/81bcf747dc9fe8a7113e3a000ce4a1340a3ff437 |     
 microblaze  |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/9ac09ecc3372690fc55c8b7380cfd8b366f86e59 |     
  sparc64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/e3decb0f958f3b532307a73f44e47b693c8685ce |     
    arm      |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/4eeae86d7529df9438a59d3759af35ba54e0d9ee |     
    m68k     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/9673c9dfa070a9184eae98abf407b7f2d973f7f4 |     
    arm      |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/25e37edef6ee54bf23b7fa437ffe73e0f6be75a8 |     
 powerpc64   |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/4ff757bc54036bfd6a8e5681a2b2232732f2ed05 |     
powerpc64le  |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/fa3c9ce99793c61dab785cd1f02cbb37c3592718 |     
  mips64el   |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/098a8e00fb730aa3e8d396d2a33443845fb597bf |     
  sparc64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/e46bd85ea26f4078ac3e1db8f492a18eecbe3237 |     
   x86_64    |       host-clang-15.0.3        | NOK | http://autobuild.buildroot.net/results/79bc307daadcabe7cd08dc1832f60a46c313b29f |     
  riscv32    |       host-clang-15.0.3        | NOK | http://autobuild.buildroot.net/results/2e5d435bdc160ebfa8864a7b1d88805b9a4dfbe8 |     
   armeb     |     host-gcc-final-13.3.0      | NOK | http://autobuild.buildroot.net/results/2753c5275cb39d57edf20c46ae3d671a2533f475 |     
powerpc64le  |     host-gcc-final-14.1.0      | NOK | http://autobuild.buildroot.net/results/e9804174b57c5fbf2f85613287a2e2a5395530ba |     
    arm      |    host-gcc-initial-14.1.0     | NOK | http://autobuild.buildroot.net/results/40c83a42c798b020855d0c3005203377a75eb111 |     
  riscv64    |          host-go-src           | NOK | http://autobuild.buildroot.net/results/62c817dda6f9516337978fd8159d7df3d6f26f68 |     
  riscv64    |          host-go-src           | NOK | http://autobuild.buildroot.net/results/30b18fed8785e7a3a2cec97752e6f45cd3d27869 |     
   mips64    |          host-go-src           | NOK | http://autobuild.buildroot.net/results/1f480929d878cac55a5b8422acffa5615c1ce06c |     
  riscv64    |          host-go-src           | NOK | http://autobuild.buildroot.net/results/91f6c2e9fcfb35d8c96ab353f178b6b9bb98f2e1 |     
  mips64el   |          host-go-src           | NOK | http://autobuild.buildroot.net/results/e6b13184b6c783fd61224c3f7057ac1787b78203 |     
  mips64el   |          host-go-src           | NOK | http://autobuild.buildroot.net/results/5ac604e8649d0658351fec4b1fb55f189a7ac09c |     
  mips64el   |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/06994cbfcf20acb00d1f3684489f970465647c9b | ORPH
   sparc     |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/fff0fedca67f1db3f0c2623166edc9032eef0958 | ORPH
   arceb     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/4c55a1bc1c5bafbc312f3088b5f13b941bb16fe1 | ORPH
   s390x     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/decc4103b56e88f664e6b591f20c4309fbf1c8b1 | ORPH
    mips     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/1ba9328ec0423842681b24fab749613d0af0b897 | ORPH
    or1k     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/aff5312e2531aa6f0cd249b53acc4efa7adc526c | ORPH
   sh4aeb    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/c94869c9b48b6a18ab7a3b0eba0345b2808eb4d4 | ORPH
   s390x     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/c45eedf26f5bc0d63c716529a5e4ee7d04c30af2 | ORPH
microblazeel | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/982a916195e9ceb3e80d75a8a15cbf8d858ecb01 | ORPH
microblazeel | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/550bdf27f321a8546bbaca7a9a45c63b23b26e0d | ORPH
   mipsel    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/9f9b4cb996995ab5e3be45f387c6a6bfd4c28d61 | ORPH
 powerpc64   | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/7432b01c458f0cc5f18efb95fd55a75c5625837d | ORPH
    sh4      | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/d6629d4772c29f31e8bdd780179c653f443503e3 | ORPH
  aarch64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/1a7f6a9e306560fc9e29dec12e793e3f2702491c | ORPH
 powerpc64   | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/d7e20376b2fd573b88966084e46ceae64769c053 | ORPH
   s390x     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/9f136b2de2a18a08f9aa6be63769df08ed3a3c66 | ORPH
microblazeel | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/3f2bc15378bea48653f6e3570f87341ad7a8ddc1 | ORPH
 powerpc64   | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/0498bd7881cc219ea0b4d388acb5bcf01840df08 | ORPH
    i686     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/2fb45bbc2e23fa4cce829b777d22812147cdb39b | ORPH
   sparc     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/f37babda5f8a39f8ff5f1cf7b7c056dcca7e9fcd | ORPH
 powerpc64   | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/352858756f6edf60b852823ed1928ca969e4b9d6 | ORPH
powerpc64le  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/411906701a88e10c3b8ec543f9b888eb6f4b3a03 | ORPH
  mips64el   | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/46ff3b8867b222494bcd559a82b0997d2e074eb6 | ORPH
    or1k     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/ec0480918b2c3561e47d5ede448b38ea46c7928e | ORPH
    or1k     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/93971c04e6dab054ddc7bb8e6f03e6400a4b0375 | ORPH
    arc      | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/ac58064c4a87ff0bfda1e0e61835943ba162f461 | ORPH
   mipsel    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/87a4e5a47430b2496562ae502d2427ed747a3797 | ORPH
  powerpc    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/08747d1ba07651c9f31e57ea38441dff252e51aa | ORPH
microblazeel | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/68f2509b49fb98c79c2081d2fb4ad5a022d82fe3 | ORPH
   x86_64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/396ec018c7de47250ba6f0e4d7bbc615c8ffe94a | ORPH
   mips64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/6089b738cc869262d12b9db2b06147172dbe2099 | ORPH
   x86_64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/9053b38c65386cfcf364167d24b9f855292999b6 | ORPH
   x86_64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/8cea2efb91a84d517f6db17be7ca600daa7676b7 | ORPH
    m68k     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/f1269cabd2fcb0e10029b52a0befd8081548d15c | ORPH
    arc      | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/15245a2a3dc25b0914c059c3823fa009b3b6202a | ORPH
    sh4a     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/3d3fb7f2533a1eccc9eadc5dc4c9712275b77ea9 | ORPH
   mips64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/013a1c5f9380da41ebdc41d750b60b5490c41e56 | ORPH
  sparc64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/c927c783d7bee8040152d2038f1aaea955d26ca3 | ORPH
 powerpc64   | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/8bec0f40c4cff6698d48ce7fa0a4c72a7886e84c | ORPH
  mips64el   | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/e3a93dd94eed7fc6ebb15b36b727521119c5f869 | ORPH
   mipsel    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/92a471f5dd70aa843fe3d7472513f84a6755d382 | ORPH
    arc      | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/c5d1eed484e6719d07df23524190cf8a6742a06e | ORPH
    arm      | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/29e66199a785237fb2dced08f4f7b076afffa460 | ORPH
   s390x     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/4b629215d40782e285c5ab3b38e9ab1a7d344d9d | ORPH
  mips64el   | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/2827ce248112caa6d4f5d836ad914abcb6c23ad6 | ORPH
   arceb     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/4a2ffe9e3da1b577a8fdcd79ab49b08d3aeb5ec1 | ORPH
    i686     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/2e079ba812fb441008f952d9973b19d9b18d0b54 | ORPH
 powerpc64   | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/32c4828774675892652cd816303d0cc9dbc18ede | ORPH
powerpc64le  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/c292aafbb2e786e0d6bb02497aea1ff2d3b6c2d1 | ORPH
   sh4eb     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/2103d87bdf075f29d6b6e076597a538862825c3f | ORPH
  powerpc    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/36ebdda2b7ba4739f12ad2ef2258b7bd9101490c | ORPH
    mips     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/a9557ad5b845069c5106aef93b602f569e479326 | ORPH
   mips64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/dcc662976734c252265b1369f75e69438d83ad20 | ORPH
powerpc64le  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/ef00cf747bc5e73f83aea6b9af1300de7b551150 | ORPH
powerpc64le  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/3974d18edf5ab0f4b81a577ecd89074a40b613ee | ORPH
  sparc64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/cb5b7683bf3c0c58aa1c4cc65d6d2385db75bf89 | ORPH
  riscv64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/0d1fca923c23c6b2c0bfca6f52a2c52ca21973b7 | ORPH
   mipsel    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/b8853f22fe577e6e2f3c7d00c334cd2d3a3d7669 | ORPH
  sparc64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/9af01de72d32b9b73bc213f8ea08031b83995728 | ORPH
   arceb     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/5f1df6d99fc2c125b71007cd8b7af362fd94d3c6 | ORPH
   s390x     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/30c052f395eb05e8e83af9f79ee34fd086ee8f9d | ORPH
  sparc64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/66b241809dbf4d2d84d491635f9ea0ffb6b5c86c | ORPH
powerpc64le  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/12c4bd7c1fc1f3f366731b1cfb98dcc87c5b83b1 | ORPH
powerpc64le  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/00a9fe6dfb4f53a467bade863fd8a0e2b78a19ca | ORPH
    i686     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/34d21c135bd5c723866f46013339873a85159ac7 | ORPH
    mips     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/6f1461c676addcfad35d0ecf4e0a4d624d2b6d2e | ORPH
    mips     | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/889f71907b5a2d2e7c4c248150eb2bfb7389d6cd |     
    arc      |          httping-2.5           | NOK | http://autobuild.buildroot.net/results/95e52c8bb4bf2713411dc86eee4c4b1f35c9ad6d |     
    arm      |          httping-2.5           | NOK | http://autobuild.buildroot.net/results/3fed95566a80debceaf34db884abc6d486743d6a |     
powerpc64le  | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/30bf0199e60b6753e1501399db62139fce5f3e4e |     
  aarch64    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/74e261ebcb924d1cfe49cd7d8b628bbc9437044d |     
 microblaze  |          jack2-1.9.22          | NOK | http://autobuild.buildroot.net/results/4ccb424352a696e9e7f7ab6a4e3e56d465db7e32 |     
   nios2     |          jack2-1.9.22          | NOK | http://autobuild.buildroot.net/results/f8f3d1d8ec80e1ee55336ecc4c9e1a5eca107292 |     
  aarch64    |          jack2-1.9.22          | NOK | http://autobuild.buildroot.net/results/d27bf3453d086bc948ab0354043d395c9ecb6d5e |     
    sh4      |          jack2-1.9.22          | NOK | http://autobuild.buildroot.net/results/b5f77a37543fa3691ac7de2a1442271a2852f52f |     
   nios2     |      janus-gateway-1.1.2       | NOK | http://autobuild.buildroot.net/results/b3e5d1067fe0b7b35f66655aa8444a0edf5c3853 |     
powerpc64le  |      janus-gateway-1.1.2       | NOK | http://autobuild.buildroot.net/results/4e364794b6554eff10ddfbaf27e41cb98c31ed56 |     
   s390x     |      janus-gateway-1.1.2       | NOK | http://autobuild.buildroot.net/results/6e7e390c8e6898d2e428d7d6fa1177c9726453bc |     
    i686     |      janus-gateway-1.1.2       | NOK | http://autobuild.buildroot.net/results/66b3914de386b83bd85f9c276331aa4ebf4b48b9 |     
  mips64el   |            kmod-31             | NOK | http://autobuild.buildroot.net/results/954babab04fa9aaa7e404db7b86c217ada8167fe |     
   nios2     |          leveldb-1.23          | NOK | http://autobuild.buildroot.net/results/be4c774dcb09ad2cdad72097342e49586c3febbd |     
    mips     |        libarchive-3.7.4        | NOK | http://autobuild.buildroot.net/results/b8e7b0ed77aa4eb6ea1275344a18a2558ae22be1 |     
   mipsel    |       libblockdev-3.1.1        | NOK | http://autobuild.buildroot.net/results/2dff0ae2249ef1fc466dbbdd57089c9675ce38de |     
   sparc     |         libcli-1.10.7          | NOK | http://autobuild.buildroot.net/results/7bd8da67018da1f2fd72ba96998ab0d0b276cb39 |     
microblazeel |         libcurl-8.8.0          | NOK | http://autobuild.buildroot.net/results/b95c9882d5cc93deb6d87c8e0fcd3d4b9c47ea63 |     
   mipsel    |         libcurl-8.8.0          | NOK | http://autobuild.buildroot.net/results/ec55a9b3095cb31f36e9bc791adffe17ecb60ac6 |     
   mips64    |         libcurl-8.8.0          | NOK | http://autobuild.buildroot.net/results/1313ef153ecff6a3bddd3935d05f9efff8433942 |     
 powerpc64   |         libcurl-8.8.0          | NOK | http://autobuild.buildroot.net/results/f4a2e9d3b6be564bb68ad6588e791a2d0d6f26e9 |     
  sparc64    |         libcurl-8.8.0          | NOK | http://autobuild.buildroot.net/results/840817e9cb098a3b7a91cb20177300b75db9cc0c |     
    i686     |         libcurl-8.8.0          | NOK | http://autobuild.buildroot.net/results/28af3cc046081e991f14677d597371d126b878d4 |     
microblazeel |         libfcgi-2.4.2          | NOK | http://autobuild.buildroot.net/results/7a49015b6db82071cc101bb4f21f62e0c749d7c7 | ORPH
   sh4aeb    |         libfcgi-2.4.2          | NOK | http://autobuild.buildroot.net/results/85226b3e255453e8bdddaf9691bc88a1843af9eb | ORPH
  mips64el   |         libfcgi-2.4.2          | NOK | http://autobuild.buildroot.net/results/e2618307e45168553cb85ab42b8e278aade7c19d | ORPH
   armeb     |         libfcgi-2.4.2          | NOK | http://autobuild.buildroot.net/results/bf45d41326fe1570e8c67438050842d64f90bb01 | ORPH
 aarch64_be  |         libfcgi-2.4.2          | NOK | http://autobuild.buildroot.net/results/876e6cd6f6405444b63425a51fafbdabf46e206a | ORPH
    mips     |         libfcgi-2.4.2          | NOK | http://autobuild.buildroot.net/results/72f7586b12f4a195d285c024b762841eb92fa0cf | ORPH
   mipsel    |         libfcgi-2.4.2          | NOK | http://autobuild.buildroot.net/results/cf71af1980a484fb6d337c9a6812fe1d0a9121cb | ORPH
powerpc64le  |         libfcgi-2.4.2          | NOK | http://autobuild.buildroot.net/results/4a13525f280108f88735c72eb8e3e1bcb2970f8c | ORPH
    mips     |         libfcgi-2.4.2          | NOK | http://autobuild.buildroot.net/results/83453620d32a5e21456e5d411526f7140e7fe460 | ORPH
  aarch64    |         libfcgi-2.4.2          | NOK | http://autobuild.buildroot.net/results/f079728cbd3e8a5394a303c3b8f36c476ad61118 | ORPH
   sparc     |         libfcgi-2.4.2          | NOK | http://autobuild.buildroot.net/results/b76f7374bd7851e2ac00e726623cfc92b23c1788 | ORPH
 powerpc64   |         libfcgi-2.4.2          | NOK | http://autobuild.buildroot.net/results/c20c810aab57e4befd8d2abbdab4a07178f27e2c | ORPH
  aarch64    |         libfcgi-2.4.2          | NOK | http://autobuild.buildroot.net/results/998356cc16a997442a4809ad2a307da3a5c56f9a | ORPH
microblazeel |         libfcgi-2.4.2          | NOK | http://autobuild.buildroot.net/results/c89117ea8c9ff6b92a97153779790a5910db8fa3 | ORPH
microblazeel |         libfcgi-2.4.2          | NOK | http://autobuild.buildroot.net/results/4aad590daed52a34f7a3bf01f9ce972a85c4c87f | ORPH
    m68k     |         libfcgi-2.4.2          | NOK | http://autobuild.buildroot.net/results/4d6833f9e8e70774bd3c31cb351b9daf3de70843 | ORPH
   armeb     |         libfcgi-2.4.2          | NOK | http://autobuild.buildroot.net/results/ad93eed0d4e035512f8218c5c167448b1230cf9d | ORPH
   x86_64    |         libfcgi-2.4.2          | NOK | http://autobuild.buildroot.net/results/c83719e1bc4a975e1a7591f96041dfc2971ca8b0 | ORPH
    arc      |         libfcgi-2.4.2          | NOK | http://autobuild.buildroot.net/results/ce75b8045589d35edf700f0abee0b2bafa382f23 | ORPH
 powerpc64   |         libfcgi-2.4.2          | NOK | http://autobuild.buildroot.net/results/7e59aba5912b2efb9c48f8e9706bd8676fdf43ed | ORPH
 powerpc64   |         libfcgi-2.4.2          | NOK | http://autobuild.buildroot.net/results/e7d15903318bc7da94db77d8d99c94d1f38f2290 | ORPH
 aarch64_be  |         libfcgi-2.4.2          | NOK | http://autobuild.buildroot.net/results/8876788a28a20f2176219704e9992f8359bed61f | ORPH
   mips64    |         libfcgi-2.4.2          | NOK | http://autobuild.buildroot.net/results/bc127650d39e9c2251da51e24298fa403557efd5 | ORPH
   nios2     |         libfcgi-2.4.2          | NOK | http://autobuild.buildroot.net/results/1e7def44579875ed2babd4a539a8dbe0cb229db4 | ORPH
    or1k     |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/6c47a255609a044311decb38d59dbdaf0bf479a5 |     
   arceb     |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/3612eee802c7ae16fabd851f1058df1566cb9eed |     
    arc      |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/86b9aeedc4a531e8537d702ffcdc77d64aa7ac93 |     
    or1k     |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/17a28112f10d96f013615b7d0c8cfbbaa3e1a933 |     
    or1k     |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/327c0d1c366701feb27ccc2548f9acca3651d42f | ORPH
   x86_64    |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/4cdff57e8f9b615c50d07d73fbb2ffe632ca5550 | ORPH
   x86_64    |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/8fa7ef9a4c916bf62df7b075269922e34b58e81b | ORPH
   sh4eb     |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/5845bb508374f1b5d475f068a1a049a6afcba69b | ORPH
  riscv64    |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/dcc92c6cefd6f838f27094442a3df4ee0c3b4e8a | ORPH
   s390x     |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/7fa94d9ba87ee42451b2040a39b6b9ceda54ffff | ORPH
  sparc64    |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/e7383303028924f0c5da16c217bbce66f3d14809 | ORPH
    m68k     |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/62cbc7caa9359df76fd70633a51c1ed8925bce05 | ORPH
   mips64    |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/5f3daec42019fe065e14b3add202415dc1f18165 | ORPH
   sparc     |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/93310a3da730558d1ca672867d176e6536096b65 | ORPH
 aarch64_be  |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/e308f39beb15f06485c89f06c1034cd70e375ca8 | ORPH
    i686     |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/94a84e4a2a3de477fdae4650d39a173dc86ab9f0 | ORPH
    arm      |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/43d784a9e48bbb71c806c7f5cee3423291495dbd | ORPH
 powerpc64   |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/03a29c4cc9dd25ddb4d455e1a0fe1bdf602d2558 | ORPH
   s390x     |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/e76d345b74e6ef2ccd15475fadde86d408808fc3 | ORPH
   x86_64    |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/fef97af8596c5fbc2cf469a23e59a5647b1a21d7 | ORPH
  sparc64    |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/724500edb1ba99b8f23fc57e8cc84eeb4591f92c | ORPH
   nios2     |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/639b56bb56f772ed9c8559237b04b7fc71aaa069 | ORPH
 aarch64_be  |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/038b8ba7a34a082ef2ff0f0ce5f9152262339c03 | ORPH
   armeb     |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/2b7bf05dfd5c66fc0c2d5ad23259f1c7de0fcf12 | ORPH
  sparc64    |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/e98932b5e0acd66e074cdfa92727f32f00a3656d | ORPH
  aarch64    |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/04cdba1e8f3c94fb2f76af417ac786a5795daeca | ORPH
    arm      |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/1a167902d7961572de429dbe27effd82e638dc25 | ORPH
   mips64    |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/6ea7132359e2cc9d02f6ea377509e3ae04822284 | ORPH
 powerpc64   |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/bac107969fc1cf89e408e44fdcf3cb7a1ef30fb7 | ORPH
   s390x     |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/420382f2bcc7d2ab2d614888e2a06a7c66091829 | ORPH
   mipsel    |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/3cda901aa245455e7e8d5869d205e3943a0c141b | ORPH
  powerpc    |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/d0b510b62fb221ad5dd8e807887458e8babed006 | ORPH
  mips64el   |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/e175ac7c20ffc129bd1b2dd84f1a4156de1408e6 | ORPH
   mips64    |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/162c02ac3ccfc1854ed14906debb6f9215b38ad7 | ORPH
 powerpc64   |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/f1277e1dec6ba1f61c7ed1b1559adffdf98306df | ORPH
  aarch64    |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/fa68828bc7b3b94b52926acda74a22afd3075a3d | ORPH
    mips     |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/a75898687e050bbb2f8a4c193a4eb1b9d66610ac | ORPH
 aarch64_be  |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/fbd32343819eebf5d6240f3e5e1445fe486910c5 | ORPH
   s390x     |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/29db994487a82a51df745383f2f36cc45affe593 | ORPH
    sh4a     |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/cdc246e579366d6c9ae8da474162cf6c083999ac | ORPH
  mips64el   |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/6e15212fca45937060c5a194aa3a5c419993f8c6 | ORPH
   sparc     |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/d6548c54a8643eefcd75a2acb9cd08a97330d38d | ORPH
   nios2     |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/b30ed697247fbded5810249c90d9e0af8643aeed | ORPH
    arm      |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/3c7085dd40a6516518e5add9d1428e9aa7a70547 | ORPH
  mips64el   |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/2473a2937ef426bae64f7aa403bf28c2f3112dcd | ORPH
powerpc64le  |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/1596ef9aee19ab09108c113110bf96d2bfc29702 | ORPH
   mipsel    |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/fe6d2d179c39bcabd7d4ac83c95771ae1293f89c | ORPH
    sh4a     |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/1c1754da1ca1bc4a04b9f66dbbbed415893ee6d6 | ORPH
    mips     |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/c668b5d4d3510580217f3bdb48642229337e3f82 | ORPH
   mips64    |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/3b2f7f0c0eaa9ac0483af1fb990126bcb7e14cbe | ORPH
    m68k     |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/d589d3b8628ed536181a3421b500198fe1a0788c | ORPH
    or1k     |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/71c3f3ef6656c6c48b70dc8b96c430558c5e2c11 | ORPH
    i686     |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/aad6ab12257fce5a3c136148761257056c206f05 | ORPH
   sparc     |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/6613c4cc63b4c5920b0dcd3f61df67dca0029c72 | ORPH
    i686     |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/71e6625d0f16068b13fa71c045fa844b61921d86 | ORPH
  aarch64    |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/86952637ca3b7915dca61e1d6346bbc6e8432dcc | ORPH
  mips64el   |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/d7b1fd01c2fc0d8dac54dc145a7602b668cec1a8 | ORPH
    arm      |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/1bdaec240ff26e96ec3984138892575c86d35b5f | ORPH
   sparc     |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/303e1dffb6872443c5f283b4fc5a1bf72583dfd0 | ORPH
    sh4a     |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/11826fc3e17bf6cd7563852b06d42e6410e3e9b5 | ORPH
   armeb     |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/38122327431aa9e52853affcb325450a51914c16 | ORPH
   mipsel    |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/54542949ae058b0bcd1a2fd3d20966d0ac960ef2 | ORPH
    i686     |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/00634d91e644785c7654c7141e5bb5e6c40afa9a | ORPH
   mipsel    |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/be50d6ad850c98f33630954682d3b7d69b887217 | ORPH
   nios2     |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/d7284f0a1226441f2e4a2ce1a2f8fda4aa9838cd | ORPH
 aarch64_be  |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/25a1ead58bb7adfa1797d557b6422e5c53806036 | ORPH
    or1k     |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/eee11494ac4662362890f2918d05c5652592f898 | ORPH
  riscv32    |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/e55bfec2968b7089f361ec16e13bbdba97e36779 | ORPH
 aarch64_be  |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/47a11362dc9096ef4678252d7deef212671ba379 | ORPH
  aarch64    |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/f9aeea6fde82a97b5abb88cd964693b28e49758a | ORPH
  mips64el   |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/8ea4091811f5035a5394e66fcf3fd0971c778437 | ORPH
  mips64el   |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/f080b1e20d8cf74ca717d2a7a8e85e9848c9a5c3 | ORPH
   s390x     |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/04c1044016b72cfe70683182527287f03b35a75f | ORPH
   sparc     |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/58b076a5eff4292d98b4ed2a5605cd1b234ab99c | ORPH
  powerpc    |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/ed41638eac87477fdcdce64ec7df9cad9e630980 | ORPH
 powerpc64   |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/c3b467595f3bae6535523aa29952aa1abd5ba5e1 | ORPH
    i686     |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/eb10d26645558112ce15e5475d86c8ea470a04ac | ORPH
   armeb     |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/fa5ea23c23f59bf6d7722f54035b8812ba76d758 | ORPH
 aarch64_be  |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/39699d2f2844a834d193d9da9686af5184c33401 | ORPH
   x86_64    |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/f5beee4acf1df217e6e46ae51ebe2295d648405d | ORPH
    or1k     |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/6a11491a192860ff3bc126a622a6e9cbcdf13dc9 | ORPH
    sh4      |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/e82ec1bf5f4a9e1ea86675ad1d113e0103a03c8a | ORPH
  aarch64    |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/d01c9786e3e50cffa01650db3db2d0a902e249f4 | ORPH
   sparc     |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/1125cef919e180d2f5caf6f639bbe666fde0333c | ORPH
   nios2     |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/79c7128f27f2911c739cfda9e38db6d8b96232b7 | ORPH
powerpc64le  |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/dd56d427480aab2db2b81eb5067ac17a222ed9ee | ORPH
  powerpc    |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/a2ed0f9b03efbcc0abed80c9976760c0a0d4ad60 | ORPH
    m68k     |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/d0b3c34b065752555f877ac19fa5c9aa457658a5 | ORPH
   s390x     |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/ddad400ba9c6d7efb316e026460f46f7c1118bbf | ORPH
   mipsel    |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/bf885990e8000685ffe6a1fcfbc6e2e97e2d8dac | ORPH
  mips64el   |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/06d8ba19949db7d7deedce0103d11c20b98a5627 | ORPH
    i686     |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/b6d6d8e30792f6ab060c36c2ecb3e0d8c0b63262 | ORPH
    arm      |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/1d992351e8aab34851a984eda853c9284078cf64 | ORPH
 powerpc64   |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/2cd25cbb9a079403a6f373ff480d8f4fec9d17e0 | ORPH
    arm      |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/60f551e2a0ea6fd159fc8252b6202c9abd175a67 | ORPH
    or1k     |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/83c41a6c3f314c7fef6ae4ca21965ba24c341b77 | ORPH
  aarch64    |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/80546504afba5385855a902f8ff9615c51926dbc | ORPH
   nios2     |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/fb1b97fe101d28006a433a2306ac4ec5d3ffaea3 | ORPH
  powerpc    |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/8fa1e45454a79c974192445381145e3631dac9f0 | ORPH
 powerpc64   |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/80a4bb0f437714a33dbfb023b0785cc6e8db7404 | ORPH
  powerpc    |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/955f00a7bfcad5543ff7f8f441858c3db26386f8 | ORPH
  mips64el   |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/31987795b0ddbbfd58045718bbc7f7811c2e2848 | ORPH
   mips64    |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/ba25a971bec315d79ccf502ce2fc2d43f7bf6f90 | ORPH
   sparc     |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/31af39e46b9381788c3879c3b521419d0d04a618 | ORPH
  mips64el   |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/bcf861fa497adb3ed0e3f47cca8695dd7732db32 | ORPH
   mips64    |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/476dc88d1ecd70dddc291f26af5863014865b202 | ORPH
   x86_64    |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/9d9faa079a833a54b0ba1cb88f590989bf047116 | ORPH
  mips64el   |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/b4de20b7fe6fb57ced8d672562b4c21ea5faf0b2 | ORPH
   s390x     |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/67f4542893bd7b45378af061907503195bd41cae | ORPH
   s390x     |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/022eebcceeef7240a51e4f35dbe280270efef6bb | ORPH
  powerpc    |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/d358c9150954f427bc35b635637772cf116bc51a | ORPH
    sh4a     |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/a66ad0fb72d580255c6ffb1f9769a0fd5c150d21 | ORPH
  sparc64    |        libgcrypt-1.10.3        | NOK | http://autobuild.buildroot.net/results/cc56e1a877abfa992d001f4fd2728627c645c54c | ORPH
   arceb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/a361a80568cd9c39c2b412b35c1ae02cf59dbacc |     
   arceb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/9a118524e6b949d28b50d7c94c541a36b7c403a9 |     
    arc      |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/e2c1be624c22fd3d01612f67ef31cc414e636d4b |     
    arc      |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/66d743b2c681064f5a7198ed77f51afd8c716bee |     
  powerpc    |         libhid-0.2.16          | NOK | http://autobuild.buildroot.net/results/93998f4bfb70619ff573eb9a68cbd7937c878642 | ORPH
 microblaze  |         libhid-0.2.16          | NOK | http://autobuild.buildroot.net/results/38b4d90248474a94f7adfe17760eb6e855bd49c5 | ORPH
   sh4aeb    |         libhid-0.2.16          | NOK | http://autobuild.buildroot.net/results/d17060224d18c389985ab9545025f40c3dc9c2af | ORPH
    or1k     |         libmad-0.15.1b         | NOK | http://autobuild.buildroot.net/results/ad2228750d51e2a1de7b01a686e562aed798ddf4 | ORPH
    sh4a     |         libmad-0.15.1b         | NOK | http://autobuild.buildroot.net/results/a6a823bca950d6a97b9ee5629a861bee72fc3d47 | ORPH
  aarch64    |         libmad-0.15.1b         | NOK | http://autobuild.buildroot.net/results/5e6fff21109578b8151bcd128e651ed13992ac26 | ORPH
    arc      |         libmad-0.15.1b         | NOK | http://autobuild.buildroot.net/results/7599765cb2c42d4a05147ac609be761775923ccd | ORPH
    or1k     |         libmad-0.15.1b         | NOK | http://autobuild.buildroot.net/results/c0a01bb81aa46b2322a0ed4a3d640cd40b2233ca | ORPH
 microblaze  |         libmad-0.15.1b         | NOK | http://autobuild.buildroot.net/results/6cb716f40fd05f6549f49f6d4e6bf61998ca9ff3 | ORPH
  mips64el   |         libmad-0.15.1b         | NOK | http://autobuild.buildroot.net/results/6bb711f7ad977c2f4de62c198db212f2a7618b81 | ORPH
 powerpc64   |         libmad-0.15.1b         | NOK | http://autobuild.buildroot.net/results/117f9476e7eab120f12a3bb1346094f30a0dcb48 | ORPH
 aarch64_be  |         libmad-0.15.1b         | NOK | http://autobuild.buildroot.net/results/88695b528237ee2b5272eb53b93a50a3f6339b50 | ORPH
   xtensa    |         libmad-0.15.1b         | NOK | http://autobuild.buildroot.net/results/2ef79e36b6edd7c9404dc32a4d60262169518515 | ORPH
  riscv64    |         libmad-0.15.1b         | NOK | http://autobuild.buildroot.net/results/0cf46a8cc95cd88ad3d3cc461757ec1e71cf0f0d | ORPH
    i686     |         libmad-0.15.1b         | NOK | http://autobuild.buildroot.net/results/f3ccfb5ef66e8fb5a3b51c77a87242a0d7cc5a64 | ORPH
   xtensa    |         libmad-0.15.1b         | NOK | http://autobuild.buildroot.net/results/99338eb546629c2ad23b74d1b8d506bee04745e2 | ORPH
   arceb     |         libmad-0.15.1b         | NOK | http://autobuild.buildroot.net/results/f0839dfdf03879b72e95ab5743aba14e8667319e | ORPH
   sparc     |         libmad-0.15.1b         | NOK | http://autobuild.buildroot.net/results/363f1e6ee928bedc48d4b905757ea0a2c0a9337c | ORPH
powerpc64le  |         libmad-0.15.1b         | NOK | http://autobuild.buildroot.net/results/00bf46cbd0044765e15ace3d1f50bbd89ca04754 | ORPH
  sparc64    |         libmad-0.15.1b         | NOK | http://autobuild.buildroot.net/results/b944515c52acd5e8b202173c15e8fecbd3a7230a | ORPH
    m68k     |         libmad-0.15.1b         | NOK | http://autobuild.buildroot.net/results/0ec479e5154c0cf60fc159f2b63f8228b32675e3 | ORPH
    or1k     |          libnfc-1.8.0          | NOK | http://autobuild.buildroot.net/results/bf8c40b3d8cd7dbb754323ac3f729743fb08d564 |     
 powerpc64   |          libnfs-5.0.3          | NOK | http://autobuild.buildroot.net/results/bb332f65787b0ffbf897987be64849ce771ffded | ORPH
   armeb     |          libnfs-5.0.3          | NOK | http://autobuild.buildroot.net/results/f94d7e1b4385aab5463b60e58b2f65fe923b5808 | ORPH
microblazeel |          libnfs-5.0.3          | NOK | http://autobuild.buildroot.net/results/2086612467a4e36af75a67a5d73d5311cf90c18d | ORPH
    arc      |        libopenssl-3.3.1        | NOK | http://autobuild.buildroot.net/results/7fc814426df23ba1092b4fd5684423f816957499 | ORPH
 microblaze  |        libopenssl-3.3.1        | NOK | http://autobuild.buildroot.net/results/98b320631ead72090114dd7d969557a2ebc9c6db | ORPH
microblazeel |        libopenssl-3.3.1        | NOK | http://autobuild.buildroot.net/results/d3bb93980205a6e1dbbff9aa43e26fb35e25e3d8 | ORPH
 microblaze  |        libopenssl-3.3.1        | NOK | http://autobuild.buildroot.net/results/3de6f39f083790d295e796f1779f6817f1319cad | ORPH
   arceb     |         libp11-0.4.12          | NOK | http://autobuild.buildroot.net/results/d06d7e9ee44ae24cf9def813bd0eda453cd34bb4 | ORPH
   sparc     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/468f7b226ce78bc57be2eba5aa263cf7533b75af | ORPH
    sh4      |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/f13bbf237bc30126e26b306695d6a634606ffa47 | ORPH
   arceb     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/e3ed9f34d253131faa898445d6bca9185fdf7e0e | ORPH
   nios2     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/c408a4c2345acdf919a63b12609f785daafaaa03 | ORPH
 powerpc64   |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/fc8d33e28ae3611799a5b0ce4df356acbb167b1e | ORPH
    m68k     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/cd3a83e8b70f4cb6fb0872d2a983a5885859c6c6 | ORPH
   sh4aeb    |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/9558c21bacc29e3042b7aea5d3ccd4050547c8f3 | ORPH
   mips64    |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/2b64e55a6e90b51d754ee1523dc01823ab0e809a | ORPH
 microblaze  |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/37b2ea7355043ee6c1e102513f68fbfe09e5a3d1 | ORPH
 powerpc64   |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/b1c082cecb04070e93e35115e33a6774b72c99e9 | ORPH
   nios2     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/6d6cf7ea1d3f45a3b82e7604b232504e78eafa4b | ORPH
   mips64    |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/db8c6dae14b733e02fa4582a94b12e6cd3633409 | ORPH
powerpc64le  |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/12d66dde43f38fc1835ebd02d4be0a3429005eb5 | ORPH
   mips64    |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/49c3b814352e54527fcd3fc272dc2eeaa486a376 | ORPH
microblazeel |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/937f2d0bbbea71e8555d94ea6f45b7c2ae8c8c60 | ORPH
 powerpc64   |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/601422332c3594324b831f85b0ab3e22d7eabf25 | ORPH
   xtensa    |          libsepol-3.6          | NOK | http://autobuild.buildroot.net/results/8b9cdd1c480c9e564105d856db3a4bfca671d35c |     
    or1k     |         libsoup-2.74.3         | NOK | http://autobuild.buildroot.net/results/9baf9fdfec563b58898b21661d7dab3dbbe499d9 |     
  aarch64    |         libssh2-1.11.0         | NOK | http://autobuild.buildroot.net/results/bb9dad616f638871651b984552a7e35f6a02d92e | ORPH
  sparc64    |         libssh2-1.11.0         | NOK | http://autobuild.buildroot.net/results/cad750b672f6d4e43ba2ebccbd0c5ba1d85e447b | ORPH
    arc      |         libssh2-1.11.0         | NOK | http://autobuild.buildroot.net/results/f089909061bd21db8aa3673078184ea4883e2e1b | ORPH
   nios2     |         libssh2-1.11.0         | NOK | http://autobuild.buildroot.net/results/04552feb7e1a25e67764a924258b116f1d11b123 | ORPH
 powerpc64   |         libssh2-1.11.0         | NOK | http://autobuild.buildroot.net/results/a2cca2994f8a0be7d404b7bbb8df89fe2326c288 | ORPH
 microblaze  |         libssh2-1.11.0         | NOK | http://autobuild.buildroot.net/results/df9a8105ede88b609e6a76613926404e85d52928 | ORPH
   nios2     |         libssh2-1.11.0         | NOK | http://autobuild.buildroot.net/results/473987d878b92afa5b874fdc0e7559fd7917e834 | ORPH
    arc      |         libssh2-1.11.0         | NOK | http://autobuild.buildroot.net/results/77bd15898b55ad232f256168c3c50dabff945ed4 | ORPH
    mips     |         libssh2-1.11.0         | NOK | http://autobuild.buildroot.net/results/1c89570a7423c0ede063b3ecfd6bed7c54b4daca | ORPH
  powerpc    |         libssh2-1.11.0         | NOK | http://autobuild.buildroot.net/results/cb892c1e6840468f3e2be88b4ef35852b4e626d5 | ORPH
   x86_64    |         libssh2-1.11.0         | NOK | http://autobuild.buildroot.net/results/6fc18b95a73a4cc5b8b1657b23c43e3ee5a16a0e | ORPH
   xtensa    |          libsvg-0.1.4          | NOK | http://autobuild.buildroot.net/results/5e82983603b55392242efebe92857be755598c78 |     
  riscv64    |          libsvg-0.1.4          | NOK | http://autobuild.buildroot.net/results/5806687e48b156a6cef74e076f4cf88a74b44488 |     
    mips     |          libsvg-0.1.4          | NOK | http://autobuild.buildroot.net/results/ae692a6521d4df8c0401fe7f9af3b6431f75a131 |     
   armeb     |          libsvg-0.1.4          | NOK | http://autobuild.buildroot.net/results/5d52c91fed62a7f4b71546014c69c2cd2dd17dac |     
  sparc64    |          libsvg-0.1.4          | NOK | http://autobuild.buildroot.net/results/130f598f34acbf8ed8e14a5321b36ba464815b90 |     
    sh4      |          libsvg-0.1.4          | NOK | http://autobuild.buildroot.net/results/ba4e0f744a4a0f658ed33a13206b38896ad309d2 |     
   sparc     |          libsvg-0.1.4          | NOK | http://autobuild.buildroot.net/results/c5ad5b90ef208a97bc200e30869802c5ab5baed8 |     
  powerpc    |          libsvg-0.1.4          | NOK | http://autobuild.buildroot.net/results/8dd918b9f3774e5d79760d0ee97d31c376e468db |     
    sh4a     |          libsvg-0.1.4          | NOK | http://autobuild.buildroot.net/results/93871926516026ee935d80cbd299519bee713e80 |     
   x86_64    | libsvgtiny-ea9d99fc8b231c22... | NOK | http://autobuild.buildroot.net/results/6b2f67c796d57b6336b70b33a608932e8fd236d1 | ORPH
  powerpc    | libsvgtiny-ea9d99fc8b231c22... | NOK | http://autobuild.buildroot.net/results/4c91b1530b78322222eab3cbfe84c6de7279e9d3 | ORPH
  powerpc    | libsvgtiny-ea9d99fc8b231c22... | NOK | http://autobuild.buildroot.net/results/3ca9cde437c77e6f9a6eb14ff028c7fcb1b99cde | ORPH
   nios2     |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/397036826c3dff091dfe8939c34c0a62265d3131 | ORPH
   arceb     |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/df006478d121daf12695e752da103fb7fb068774 | ORPH
  mips64el   |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/e6dbe9c24df82eade1204d2b2dfeb3a6d80713fa | ORPH
    or1k     |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/0e519882cd5284402f8c32e5a3575436dd88f2ba | ORPH
  riscv64    |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/3cc89f52c7398a5146ff60391ac9ebb498c94b9b | ORPH
    i686     |         libv4l-1.24.1          | NOK | http://autobuild.buildroot.net/results/b1c7f1bbec84000d92708583e5eccdc50ac61fd6 |     
   mips64    |         libxml2-2.12.6         | NOK | http://autobuild.buildroot.net/results/5e2a37e426455f8a03237945e265f1657aa8d22f |     
    arc      | libyuv-413a8d8041f1cc5a350a... | NOK | http://autobuild.buildroot.net/results/26bb5fb6c7d4cd750f187b67b3059c24ea67b3d1 |     
    i686     |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/4983e276a4cea8d5f4c894a314bcc7693d8dfafd | ORPH
   sh4eb     |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/d40714f5bd325b2ec7bdd251d7a430e115d7ed57 | ORPH
   xtensa    |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/db9a3fcc618ba7b55e8fab7fb5058e5323682370 | ORPH
    m68k     |          linux-6.9.4           | NOK | http://autobuild.buildroot.net/results/20d5afa66a41abd8caa16c57940b85ace65defbd | ORPH
    sh4a     |          linux-6.9.4           | NOK | http://autobuild.buildroot.net/results/2f1c0fb564a53f9b3ee73643337ea5da98b6a472 | ORPH
   sparc     |          linux-6.9.4           | NOK | http://autobuild.buildroot.net/results/c4f25b2bcd5760c3ca3b32860435261606ced435 | ORPH
   mipsel    |          linux-6.9.4           | NOK | http://autobuild.buildroot.net/results/a5a5f8ddf9e650007a1112798a23cc448408491b | ORPH
    arc      |          linux-6.9.4           | NOK | http://autobuild.buildroot.net/results/24cdfd60f961d3c663da3e9b5705f2b57a719d94 | ORPH
  mips64el   |          linux-6.9.4           | NOK | http://autobuild.buildroot.net/results/b7649ced996c399b7cd0be0c5b0a235ac11e3a41 | ORPH
   xtensa    |        linux-pam-1.6.1         | NOK | http://autobuild.buildroot.net/results/c618b8a1bb9952ca7509dcd3c5a09330313be21d | ORPH
    m68k     |          monit-5.33.0          | NOK | http://autobuild.buildroot.net/results/08e1a3661d3faf20c252dd115d9da41fc092ec17 |     
  powerpc    |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/afc3612f87f5dfc1ecd304312cfef5e652437e68 |     
    i686     |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/6aa70e690b1cd147e29691297511945acf00588a |     
  riscv64    |           mtd-2.2.0            | NOK | http://autobuild.buildroot.net/results/e83c0a960b55c90c15282ec86a67b89940faa3c0 |     
   armeb     |           mtd-2.2.0            | NOK | http://autobuild.buildroot.net/results/a589864e5e3c0e86a5b80bd5cfb1f5ec45baa43f |     
    arc      |           mtd-2.2.0            | NOK | http://autobuild.buildroot.net/results/7d81fbe0ff5f6bfe32c83c612a4b2848db96439e |     
  riscv64    |           mtd-2.2.0            | NOK | http://autobuild.buildroot.net/results/43b55f1afbe17666a09cb80930f64a9d25f29908 |     
    arm      |           mtd-2.2.0            | NOK | http://autobuild.buildroot.net/results/c710f6d8de37dcf792d67dd5415d113482663312 |     
 aarch64_be  |           nmap-7.94            | NOK | http://autobuild.buildroot.net/results/78917c6cd64c10495c12a6c961f73f3a6b454d32 | ORPH
microblazeel |           nmap-7.94            | NOK | http://autobuild.buildroot.net/results/969fb1f3c2c0aca2d6b6bf31ae29c07e3683b205 | ORPH
 aarch64_be  |           nmap-7.94            | NOK | http://autobuild.buildroot.net/results/d910ed2f4e42bc701facfde1c687e744d4ea9313 | ORPH
  mips64el   |           nmap-7.94            | NOK | http://autobuild.buildroot.net/results/9fdb510eb6e882feb7f9d8a02da9600e8abc5881 | ORPH
  riscv64    |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/fef3b8731d05508062dd88ef619259a2f8c5cf97 | ORPH
 microblaze  |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/9d83b2730809fbcbf7770d7cb6955d7794a15ac3 | ORPH
 microblaze  |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/a146393f2d867b16b019f10ea60f45d75a83332d | ORPH
   xtensa    |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/9389ae7a76a2577555e978cd60b1f5e8fa99d681 | ORPH
    arm      |          ntp-4.2.8p18          | NOK | http://autobuild.buildroot.net/results/055b843827222ac446b6927ec59401c48ee63f55 |     
   xtensa    |          ntp-4.2.8p18          | NOK | http://autobuild.buildroot.net/results/83ee315f8f11bec875180705dd000d2e248ceab7 |     
  powerpc    |          ntp-4.2.8p18          | NOK | http://autobuild.buildroot.net/results/e6793c9c08337d69ba3b700950c194811a5f02e2 |     
   x86_64    |     nvidia-driver-390.151      | NOK | http://autobuild.buildroot.net/results/190843b22538ec12df2d35a337fcd37a863d7165 |     
    i686     |          oatpp-1.3.0           | NOK | http://autobuild.buildroot.net/results/7b17d7ac657c311bde01d19bde078dcbf026b539 |     
   mips64    |        openblas-0.3.27         | NOK | http://autobuild.buildroot.net/results/52ea8eca09039ef53762c9c2d39149e83559268d |     
    mips     |          pcre2-10.43           | NOK | http://autobuild.buildroot.net/results/36831616cc049bca342ad33a0bb611d211a1f162 | ORPH
    mips     |         pixman-0.42.2          | NOK | http://autobuild.buildroot.net/results/a31b4f701d428d21d1ce09e4df35ab3b4575f9cd | ORPH
    mips     |            poke-3.0            | NOK | http://autobuild.buildroot.net/results/2e3adb81c37e0d72e16026c3e44f2d18d9b6bcab | ORPH
  mips64el   |            poke-3.0            | NOK | http://autobuild.buildroot.net/results/c11906a679f548bf68462e066744653452ee2aff | ORPH
   mipsel    |        procps-ng-3.3.17        | NOK | http://autobuild.buildroot.net/results/3d36ace108632f0167457bb68163f7ddcb80bf04 | ORPH
  aarch64    |          psmisc-23.5           | NOK | http://autobuild.buildroot.net/results/dfe19d05d0b778d76c2ffb8f5848a8d7540d7d85 | ORPH
  mips64el   |         python3-3.12.4         | NOK | http://autobuild.buildroot.net/results/7a78abd4ed0a0011665aeacaceff3caac7a046aa |     
  riscv64    |         python3-3.12.4         | NOK | http://autobuild.buildroot.net/results/f7546f166edb469b2a376f74e30d612208430ef2 |     
   mips64    |         python3-3.12.4         | NOK | http://autobuild.buildroot.net/results/d6b73441a03474a06e7a9068ba4945ed93cc8bf6 |     
  mips64el   |         python3-3.12.4         | NOK | http://autobuild.buildroot.net/results/6a219e945a89fa6201e6ca7bbb557361d06cfbbc |     
  powerpc    |         python3-3.12.4         | NOK | http://autobuild.buildroot.net/results/4b46a98f9b9aeb4e8ec3a5ec57c6f226d02764fd |     
   mips64    |         python3-3.12.4         | NOK | http://autobuild.buildroot.net/results/59abccf42676adca8574c740f5bb29661beeefda |     
    m68k     |         python3-3.12.4         | NOK | http://autobuild.buildroot.net/results/5553aa070548af8aefdfac066dfcce360624475c |     
   nios2     |       rabbitmq-c-0.13.0        | NOK | http://autobuild.buildroot.net/results/084c702a9c55a6fa1f0976ee41aac4dbdc44ac79 |     
   nios2     |          rauc-1.11.3           | NOK | http://autobuild.buildroot.net/results/e24de63e437aec41c9143134443577e5c8fbe2e8 |     
    i686     |          rauc-1.11.3           | NOK | http://autobuild.buildroot.net/results/3a28667221d70eb97ba40c7d4d4286bce98d714a |     
   nios2     |          rauc-1.11.3           | NOK | http://autobuild.buildroot.net/results/91ae2ec56f2b956a44cd4d7a2fb9dd45cc675bb3 |     
microblazeel |          redis-7.2.5           | NOK | http://autobuild.buildroot.net/results/2e9699aa2a6066c7b413091981eb81e314dc5896 |     
    or1k     |          rt-tests-2.7          | NOK | http://autobuild.buildroot.net/results/b45fe6e8c319924d1d0ee1908f9a13e1a483e4b1 |     
   xtensa    |   s6-portable-utils-2.3.0.3    | NOK | http://autobuild.buildroot.net/results/ab84f3e75609447aff2b92de26eeb43a803985d5 |     
    arc      | sdl_mixer-d1725fcb7c4e987ae... | NOK | http://autobuild.buildroot.net/results/19c1192ce93f3bff0286d62eda4efcd29828e530 | ORPH
  aarch64    | sdl_mixer-d1725fcb7c4e987ae... | NOK | http://autobuild.buildroot.net/results/25559933baa0613490abec786b933ea8fdf05d39 | ORPH
   arceb     | sdl_mixer-d1725fcb7c4e987ae... | NOK | http://autobuild.buildroot.net/results/0799aef4049efc8e4dc9103d3e54fba12e16aece | ORPH
    arm      |           shim-15.8            | NOK | http://autobuild.buildroot.net/results/e6fd6ca8618acdb262fa7958d1bc6a2c68ab6918 |     
 microblaze  |          snmppp-3.5.1          | NOK | http://autobuild.buildroot.net/results/65b69b86d63a05a690eb990851af02a4e62b36a3 |     
    sh4      | sox-7524160b29a476f7e87bc14... | NOK | http://autobuild.buildroot.net/results/db13952eb9f51f112ddd3d75528ffa0ee439daef | ORPH
   x86_64    | sox-7524160b29a476f7e87bc14... | NOK | http://autobuild.buildroot.net/results/e7030a46226f6a6df1b9f9ebb3200e303ed63e39 | ORPH
    i686     |         sysklogd-2.5.2         | NOK | http://autobuild.buildroot.net/results/b3916286bdc05a2ce0d57ba3f69ba228e79419c9 |     
    arc      |            tar-1.35            | NOK | http://autobuild.buildroot.net/results/30f409c194dd25aed9c8f7b186973f946f97b676 | ORPH
   x86_64    |        udpcast-20230924        | NOK | http://autobuild.buildroot.net/results/6de961452a16dfa27bab80dd5ec7b33960538637 | ORPH
  powerpc    |        udpcast-20230924        | NOK | http://autobuild.buildroot.net/results/2619d0554bba39a46ac968449599eb6a955acd74 | ORPH
    arc      |        udpcast-20230924        | NOK | http://autobuild.buildroot.net/results/9e5378edc16690fdfd85268c25a3a3c57671eed8 | ORPH
 aarch64_be  |         unbound-1.19.1         | NOK | http://autobuild.buildroot.net/results/6be0b2e523d67469cebd5efeb768f2265f823207 |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/3c2f776dd252cf301c29bf25f40413036d3bbd7d |     
   armeb     |            unknown             | NOK | http://autobuild.buildroot.net/results/d2fb27940802546b140bb3d0011a13e8e795583e |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/8a1f88f5474f2aa7248a97776ebdb4de0af789cc |     
   sparc     |            unknown             | NOK | http://autobuild.buildroot.net/results/43acc7d214fdef54124da6dbbaa382bc8260b76c |     
    sh4      |            unknown             | NOK | http://autobuild.buildroot.net/results/bd9863d99c3a8072d450ded50cd8f01e6c467b37 |     
 aarch64_be  |            unknown             | NOK | http://autobuild.buildroot.net/results/a27d3b0c98891c4deb980435f98cb785e29f5c59 |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/b4315e336b7cbdb6ab3fbb6d6e6cac8ee9bfa2a0 |     
   arceb     |       util-linux-2.39.3        | NOK | http://autobuild.buildroot.net/results/1dec4a752c9286e383a81e6b6d55555661d4a947 | ORPH
  riscv64    |       util-linux-2.39.3        | NOK | http://autobuild.buildroot.net/results/b39246485af522d1629b19f2ab51b4f8c86b266c | ORPH
    mips     |        valgrind-3.22.0         | NOK | http://autobuild.buildroot.net/results/6d61d643521fc6524bc9b33a3b54dd11d34767eb | ORPH
   sparc     |            xz-5.6.2            | NOK | http://autobuild.buildroot.net/results/df9d4472a5fac6115a1a0c1d7a27d57eac577e9b | ORPH
    arc      |            xz-5.6.2            | NOK | http://autobuild.buildroot.net/results/2bb9b0d31461b71cdab06776bd4741d788048b26 | ORPH
    i586     |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/b25994aed543efe0f678dd21425580bddacee03f | ORPH
microblazeel |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/5ee6fa0e309879697bd22ef33fcbfa4e7eb5ec0f | ORPH
   nios2     |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/f480c84aedb8217b849935ee596547c5844e369e | ORPH
    or1k     |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/bf4cb2fd0dee1971b8c517ec287ded321c5580df | ORPH
   nios2     |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/9851333f3e510f8bbd6353f9487f1ea6218394e1 | ORPH
    i586     |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/8b6a762362ca1fc405c42c0751201f9aaec304ae | ORPH
 powerpc64   |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/67f5a4f66b516273bd6df863333d3efbe7cf5a78 | ORPH
  powerpc    |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/68b00f5b04e5354cde9f36fe2ec5a725d8f5621b | ORPH
microblazeel |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/f7fe25e509356d4253d28838b41892fc25e208f2 | ORPH
 powerpc64   |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/c1d6e3b7052c2e031255a56fb094553ce72e72e4 | ORPH
  sparc64    |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/176edd673bd073e3bfe97b0cf20b797c8618ccaf | ORPH
   armeb     |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/3cea361aa9111316b63f60b6eea1fed670acb0d9 | ORPH
  sparc64    |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/d99d42adc38761b593e3f54366f2bc1bbc68f853 | ORPH
microblazeel |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/3fc67cfc59c7b49d8da60232579cb88373af4bf1 | ORPH
    arm      |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/b356f75d25605daec48ff35e1984e91b98b67f21 | ORPH
microblazeel |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/4d2de81763680e9747b6ef03b591cbf0a82a93ee | ORPH
 aarch64_be  |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/5eadcd47d94eb83f8ac3b2b2abc74e453cefddfe | ORPH
   mips64    |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/c7f970253216f2842b8e16dcd3da7edef088fd6b | ORPH
   arceb     |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/228cc4c10372b00ca1555fa3bebe7606f682d76d | ORPH
   x86_64    |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/a78809d94a95f5884168f9d0ba3e336ce6bccd2a | ORPH
  riscv32    |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/fc9551b8dbbb9cc9d1467d2185337ddccb3d6fb9 | ORPH
   mipsel    |           yajl-2.1.0           | NOK | http://autobuild.buildroot.net/results/89833f40283ebc3456d65a4671b0a835df9303cc | ORPH
  sparc64    |           ympd-1.3.0           | NOK | http://autobuild.buildroot.net/results/4012ea43cbc07d4ccf8f7d193bd3e939b4d26ef8 |     
    arm      |           ympd-1.3.0           | NOK | http://autobuild.buildroot.net/results/c1e3e4396506a71075045f03b8dafee4d5351478 |     
 microblaze  |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/346a47ac0e76b2ac4c702447a4d1f53b20806da4 |     
  aarch64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/5c846051dac547365700b66f09acd7384df12b4c |     
  sparc64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/be2e08e51bfab5ca4acf4c98f518c644754c7b1d |     
  mips64el   |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/e7f5bad8d03ddc993b71ad4d9146caa359a2f4f8 |     
    mips     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/90828bc6e3b8ff2ee3427121a4a92d0a35b89ef7 |     
  aarch64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/5707b6fc31f4b2c6922810641a2f2fedf3857901 |     
    m68k     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/836bbf414217436a81faf66a725b7a9cf5f2435b |     
    mips     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/0cc4b8b6728b932417f024ae7fd4265cfa159dd0 |     
    arm      |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/8cb8d246f5831fe1c8610a74f5fb7b0bf2c0aeef |     
   mipsel    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/0f7a09cd5baa2c535a09519b5637212b16a844be |     
   x86_64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/ccca690b53ac0cdeea195f3a2a88e2e487a65eb8 |     
   s390x     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/b3e857c80f49e2ad9212beb0e36e700d80c873f7 |     
    or1k     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/36da8ef5043d4167f2840883492f18f1541e8473 |     
   mips64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/0602450d280a105b41b9aeb79955c2098c9e2cd9 |     
   sh4aeb    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/07b21ea9a8ef90977cac3f685be3a25922fd0276 |     
  aarch64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/004cc159d33ef1e384d3774f81fad5362620876d |     
   nios2     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/fd2b7a6ff7b6722a6d001fad69764cf62087291e |     
    arc      |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/2435a61729e7acb95d8d965ad12eb5d3738a879b |     
  sparc64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/3d040d4760a9becbb4cd1d1ec44da6a1846603e3 |     
  sparc64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/b2a11fd09e57f5be6f96935e9549b1bd2043f84b |     
    m68k     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/1c42e7ef91b68dceb559b0507be5eb0d29275811 |     
powerpc64le  |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/2e378f6e068da3e1c894223ba3052f29328d5a7c |     
   mipsel    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/c97e4de72477914aab0f618ad7b31371da73dc5f |     
 powerpc64   |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/f786a84d724e881e0443f069047e62d23d665ab9 |     
 microblaze  |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/9a438b69b02d75278ccd85f5b27c5f5027c0f7d5 |     
   x86_64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/8c9be67fedb60001ddf760f81c6fa26358dc7c44 |     
    sh4a     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/fbe05658842bd4100f21f56820ace37e5bece52e |     
powerpc64le  |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/71f818dd89ad64aad5a5bdd20a1892f3da116423 |     
    arm      |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/59231b611d524bd5d9ee9450a3faadd564373aae |     
powerpc64le  |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/36fffec2001347b6c54aad0d67452e70779b1112 |     
  riscv64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/fadea6e0d1eb1a83221857928106094983f57d37 |     
    arm      |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/0f5be632f23412abb41f4815921efff7ec98e997 |     
  sparc64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/a27cdde6bd8cc8894371235e966cdb673148ad95 |     
    mips     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/c33f397110714f93c30673bc16e5f48c3afea235 |     
  powerpc    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/150434055b863e1f07fa28c97ff9b6116a286888 |     
   s390x     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/0301ca5dc753a3f64d29e8db295b37cde644bed5 |     
    i686     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/a86ac24b8c53b387aaff933f8c903b4e8ecc87c1 |     
   x86_64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/62905df3c7b93bc5c4e1cb12e33bb2d540a00a2e |     
    arm      |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/36cddfc6059aa70f5427d495e231dbb8852e405b |     
  aarch64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/27cee1b980e75823e002778152bef3b3f4223424 |     
    i686     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/a55c8a380809dfbfdd877383e3a50682e2317665 |     
   sh4aeb    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/ea60a617b5e7ac66dc6b8d91d7f72f89c97e5501 |     
  mips64el   |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/611fc78364642fcf5463ea891f71c33d7b888854 |     
  sparc64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/29c1343ed8836fcd0d84141fbd4065fd6df018df |     
powerpc64le  |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/4792496d0c5e08328e43852c52365e03b3be1666 |     
 powerpc64   |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/c51bae69d8485020ad8a54315df72413076285e5 |     
  riscv64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/5fe95857aa60b04162dcef5694f0f7eb26e08723 |     
microblazeel |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/bd07f06b597a5844abdd42e2ad72282dcd371971 |     
  powerpc    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/b6cd0a36f061111f05b0c7cd9210ecf3cb06ec7e |     
powerpc64le  |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/20300f20d09757e092968c60f5784248f8636972 |     
powerpc64le  |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/c932ac926da0f73763cb74641f51fa60ebcc7170 |     
   sh4eb     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/6746b15305a88fc0b56a6ad46a95d627d56acbb5 |     
  riscv32    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/976ca6f4081dab2d424e5edcb9cb5df716f93028 |     
powerpc64le  |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/7f177c9ac938f7326b7d01bdbcb910b5dc59cab4 |     
  aarch64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/55b20ca072e16abab9c1a61ba04bb6104639eb77 |     
powerpc64le  |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/0a9151f1e115b9410f9e36af4db6fb92db4d034e |     
    arm      |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/86338082d5f85e07af0e7ea43dcf6a8bd3eb8aa9 |     
   armeb     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/18da6c5fcc68c7120a0ca0c2196a80faff3f3a2e |     
 microblaze  |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/63547654ff5c0852b2c873ce5f1f861449e403d4 |     
  sparc64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/3c97f5fbefbc418ef90e357c166ef588a11e2471 |     
    arm      |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/8e521b3088e78d503babbeb64ebc94f8b4cd262b |     
  mips64el   |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/5102696860b84a7378d21d14150faf271958a1a2 |     
powerpc64le  |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/634527aeae66e2596c1de89b15c101317f359abd |     
   s390x     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/40e4cd84b9c74b1229dd163605aaa84dc395c4c0 |     
  mips64el   |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/648d352e51f7a859bf1f178228857a4013162f0c |     
    mips     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/90d38960b8f2cae3f781a53333a4e0213e528adc |     
microblazeel |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/1a4136a58c0e7a56ca47cfa221df4e6efc91691b |     
   sparc     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/80a467c0175eb28b2861f4e16cb30d557c78911c |     
   x86_64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/ab11682da88d72d282e9012413c59cb086ddae1e |     
   mipsel    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/86d2e6467379141ed96f95d0b3fe56b384e1f4a5 |     
 microblaze  |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/ac90b24813664180f7d9868319c102e388698710 |     
    arm      |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/f401bd62983969ee06bee884821333d0b3c43019 |     
   nios2     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/4bb577f5f26688a7d258b4a9ae9282ff273ff811 |     
    mips     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/3ac50bc5d166d13c954906df75a890ff246fa323 |     
    mips     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/38476a1c59434be376e08e07cea80117f339c04d |     
    mips     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/ea9c5b5069532e90adb7d7100826046945ed7029 |     
  mips64el   |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/0e8af20dddd4991a21da1d230cf8480eac9afebe |     
    or1k     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/8dbb028182ec398963838faea1a62a208b9baf5d |     
    mips     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/3a204fcd5a7240b2cdbe830b1ffc6e3e77a04e72 |     
   mipsel    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/41b8bed73b64f53b4d93d3efe7628cff790ab7aa |     
   x86_64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/70eae41cadd693fd7d198dd9bd6a67c633114651 |     
    sh4a     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/1487beab8a2dea4440d63948f3e35c0f0850ca42 |     
    m68k     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/423b0a314b01764c274fa4d095c4ede6fa823069 |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

                   bird-2.0.12 | 1 
                   foot-1.16.2 | 1 
                gnu-efi-3.0.17 | 1 
          libcamera-apps-1.2.1 | 1 
                libressl-3.8.4 | 1 
                mongodb-4.2.18 | 1 
                 openssh-9.7p1 | 1 
             sofia-sip-1.13.17 | 1 
ulog-0389d243352255f6182326... | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mipsel    |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/02a06c28ac2b54869afa23962852f53ac38c02c1 |     
    or1k     |          foot-1.16.2           | NOK | http://autobuild.buildroot.net/results/848e25b5acdd39a0a42ef94c7d756d5dcbc959f2 |     
    arm      |         gnu-efi-3.0.17         | NOK | http://autobuild.buildroot.net/results/973e2905b9722b1a5effceaf95b256bc65ab114c |     
   s390x     |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/d4a1408ca66ac002ec88c4b828d319af25d63404 |     
powerpc64le  |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/3252407e3b0775514a9f7a6fd557207ee1e3b7c4 | ORPH
    arm      |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/d45c378ccfaf9264d0cc6761a09d3132361a7d16 |     
   mipsel    |         openssh-9.7p1          | NOK | http://autobuild.buildroot.net/results/9e1dcbf0a2f20b5149499d800ead9bd47ee53c37 | ORPH
   sparc     |       sofia-sip-1.13.17        | NOK | http://autobuild.buildroot.net/results/d2dab7bc2f8a5a614875b04a1667968444e1a8b4 |     
  mips64el   | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/93dc29dd6649ba1c5fd851d08e8ac3ec7bbcf053 |     


Classification of failures by reason for 2024.05.x
--------------------------------------------------

                       unknown | 2 
android-tools-4.2.2+git2013... | 1 
  binutils-arc-2023.09-release | 1 
                fail2ban-1.0.2 | 1 
 glslsandbox-player-2023.04.05 | 1 
host-heimdal-f4faaeaba371ff... | 1 
ibm-sw-tpm2-5452af422edeff7... | 1 
                 libp11-0.4.12 | 1 
                libressl-3.8.4 | 1 
               mariadb-10.11.6 | 1 
pppd-e1266c76d1ad39f98f1167... | 1 
                  prboom-2.5.0 | 1 
             sofia-sip-1.13.17 | 1 


Detail of failures for 2024.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mips64    | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/87f26abcb3c112a1a80bcefee67be1d0c6ed298e |     
   arceb     |  binutils-arc-2023.09-release  | NOK | http://autobuild.buildroot.net/results/9b6d0906015ad16f3af112cfe82fe2a2e87b9d93 |     
  aarch64    |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/3e0ad2ecd40d3a03ffea934776ff1d0fc719a0bd |     
  aarch64    | glslsandbox-player-2023.04.05  | NOK | http://autobuild.buildroot.net/results/d498202dacced603e8aa7e48b7ab330ab3e00b0f |     
    arm      | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/a178b67a5f5c2829308ccda6aff9cc99e72760f3 | ORPH
   nios2     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/5097be697cd78cd2d90cd4f1601c2656dcdac716 |     
   s390x     |         libp11-0.4.12          | NOK | http://autobuild.buildroot.net/results/09e7e5f6f802b855951ed40965140e9fa12b26e1 | ORPH
    arc      |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/2e951d5fdeb07f7cdc4caf41bb897bc5aa8f1d28 | ORPH
  riscv32    |        mariadb-10.11.6         | NOK | http://autobuild.buildroot.net/results/125d463764192d51f625e19f8203189ac8bfa1fe | ORPH
  sparc64    | pppd-e1266c76d1ad39f98f1167... | NOK | http://autobuild.buildroot.net/results/fce6a0662f62b5e6dd42dadb425fe90eca52fcfe |     
    i686     |          prboom-2.5.0          | NOK | http://autobuild.buildroot.net/results/2778719c25c754d681b46f67a694066c6b79280a | ORPH
    arm      |       sofia-sip-1.13.17        | NOK | http://autobuild.buildroot.net/results/b82aa9352a6a477b5dbd18a69405daee27553739 |     
   sh4eb     |            unknown             | NOK | http://autobuild.buildroot.net/results/8947fd3c05170945bb4295f4d89efe685d347422 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/8930540f958cdf225aec125c1d3e92cd85d9259b |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
