Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F22B6C27C53
	for <buildroot@archiver.kernel.org>; Wed, 19 Jun 2024 04:49:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 72B9581415;
	Wed, 19 Jun 2024 04:49:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RHIYU_t1c50B; Wed, 19 Jun 2024 04:49:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CC2A681280
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CC2A681280;
	Wed, 19 Jun 2024 04:49:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4C2291BF2F3
 for <buildroot@lists.busybox.net>; Wed, 19 Jun 2024 04:49:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 46AF160F08
 for <buildroot@lists.busybox.net>; Wed, 19 Jun 2024 04:49:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3s8NYJoVr6rs for <buildroot@lists.busybox.net>;
 Wed, 19 Jun 2024 04:49:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8B78F606B4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8B78F606B4
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8B78F606B4
 for <buildroot@buildroot.org>; Wed, 19 Jun 2024 04:49:03 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5104724000D
 for <buildroot@buildroot.org>; Wed, 19 Jun 2024 04:49:01 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Wed, 19 Jun 2024 04:49:01 -0000
X-GND-Sasl: bot@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1718772541; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ZsRRz6/yEbCJLaYbona83sa5SqCDYX+jdOWIQBCJC2A=;
 b=YwP1NlwVlTl6DWBsoPaeSWj6sv8T55at4S+X13XrJ/VLuzms+/KNVErbruacxePsNrtsFG
 qjTgboUKlPPucmL09YpKQsTe4aQbHdnSheqKJGikj1/JniHkjeSTEwq+fl4AKia5W/JB7Z
 dvoQwCmntRRzQTNw3IxW6VY3suHUCRVRpp89SraAcTpt9qr9V09d3kQkJuDxQzAr+EcC8H
 qhVqYPLKUKs6wr2X8gwHTC4doX0EcZGPNE7f4uWmoyKtniN0AmzSx3JcwhfjboCvraOeTT
 1qt7G/mvZ/04YmnNFwcHbIL99OYlBFxh7kr1CO+7Pa/i0idDD1t1pdUrPRN8XQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=YwP1NlwV
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2024-06-18
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
Message-ID: <20240619044901.7pbNouCyvOHAUu-r1cSCfLNiMgSaviWobqVg63FulpU@z>

Hello,

Autobuild statistics for 2024-06-18
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  6  |  7  |  0  | 13  |
  2024.05.x  |  9  |  7  |  0  | 16  |
    master   | 120 | 360 |  1  | 481 |

Classification of failures by reason for master
-----------------------------------------------

host-prelink-cross-a853a5d7... | 45
            host-cdrkit-1.1.11 | 32
ibm-sw-tpm2-5452af422edeff7... | 24
                libressl-3.8.4 | 17
      host-riscv-isa-sim-1.1.0 | 12
                host-odb-2.4.0 | 11
                    mpir-3.0.0 | 11
                elfutils-0.189 | 9 
                fail2ban-1.0.2 | 9 
host-vboot-utils-bbdd62f9b0... | 9 
                   linux-6.9.4 | 9 
host-android-tools-4.2.2+gi... | 8 
                   host-go-src | 7 
host-heimdal-f4faaeaba371ff... | 7 
                  bcusdk-0.0.5 | 6 
                  ffmpeg-6.1.1 | 6 
 host-softether-4.30-9700-beta | 6 
          libcamera-apps-1.2.1 | 6 
                 openssh-9.7p1 | 5 
                       unknown | 5 
                    attr-2.5.2 | 4 
              libopenssl-3.3.1 | 4 
android-tools-4.2.2+git2013... | 3 
check-11970a7e112dfe243a2e6... | 3 
               ipmitool-1_8_19 | 3 
              libarchive-3.7.4 | 3 
                   linux-tools | 3 
         python-remi-2022.7.27 | 3 
                    rtty-8.1.0 | 3 
                s6-dns-2.3.7.1 | 3 
aer-inject-9bd5e2c7886fca72... | 2 
                 cdrkit-1.1.11 | 2 
                 coreutils-9.3 | 2 
dvb-apps-3d43b280298c39a67d... | 2 
                   foot-1.16.2 | 2 
            gdk-pixbuf-2.42.10 | 2 
             host-delve-1.22.1 | 2 
         host-libxcrypt-4.4.36 | 2 
               libglib2-2.76.1 | 2 
                  libsepol-3.6 | 2 
               lighttpd-1.4.76 | 2 
          linux-5.10.162-cip24 | 2 
                python3-3.11.8 | 2 
             sofia-sip-1.13.17 | 2 
                     apr-1.7.2 | 1 
aubio-152d6819b360c2e7b379e... | 1 
     bandwidthd-2.0.1-auto-r11 | 1 
  binutils-arc-2023.09-release | 1 
                   bird-2.0.12 | 1 
                   bullet-3.25 | 1 
              cache-calibrator | 1 
                  clang-15.0.3 | 1 
               collectd-5.12.0 | 1 
             containerd-1.7.14 | 1 
                   cpuload-0.3 | 1 
                dos2unix-7.5.2 | 1 
                  dump1090-9.0 | 1 
                     faifa-0.1 | 1 
           flatbuffers-23.5.26 | 1 
                flutter-engine | 1 
                    frotz-2.54 | 1 
                    gdal-3.8.2 | 1 
           ghostscript-10.02.1 | 1 
glibc-2.39-74-g198632a05f6c... | 1 
                gnu-efi-3.0.18 | 1 
                 gnuplot-6.0.0 | 1 
  gobject-introspection-1.76.1 | 1 
                 highway-1.1.0 | 1 
            host-binutils-2.42 | 1 
         host-gcc-final-14.1.0 | 1 
                    htop-3.3.0 | 1 
                  kexec-2.0.28 | 1 
kvmtool-4d2c017f41533b0e51e... | 1 
                libcuefile-475 | 1 
               libdeflate-1.20 | 1 
                  libnss-3.100 | 1 
                 libp11-0.4.12 | 1 
               libunwind-1.8.1 | 1 
                 libv4l-1.24.1 | 1 
     linux-5.10.162-cip24-rt10 | 1 
                   llvm-15.0.3 | 1 
        ltp-testsuite-20240129 | 1 
                     lxc-5.0.3 | 1 
           mediastreamer-4.4.8 | 1 
                     mtd-2.2.0 | 1 
                    ncmpc-0.49 | 1 
                  nginx-1.24.0 | 1 
pistache-3ec9d7c4f8b828fdd3... | 1 
                 pixman-0.42.2 | 1 
pppd-e1266c76d1ad39f98f1167... | 1 
rtl8189es-eb51e021b0e1b6f94... | 1 
rtl8822cs-fda6cd263e8956727... | 1 
                 shadow-4.14.5 | 1 
                     shim-15.8 | 1 
                 uclibc-1.0.48 | 1 
ulog-0389d243352255f6182326... | 1 
               upmpdcli-1.5.12 | 1 
             util-linux-2.39.3 | 1 
              webkitgtk-2.42.5 | 1 
                 xinetd-2.3.15 | 1 
                    zeek-4.1.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mipsel    | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/919c325f94309b3401a8e7126d309c39b8b1216b | ORPH
 aarch64_be  | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/d6f27478a240d9a0d8f25d8712d84adb4484a760 | ORPH
   arceb     | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/752a91869c83f6b13b9f0240abd584b931c97a8c |     
   arceb     | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/93944e1d626d43e824e69f3767f4dbaecc634c5a |     
   arceb     | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/2b30d1634cbd5ab2a03a1b47bfcd0aebe3974d31 |     
    arm      |           apr-1.7.2            | NOK | http://autobuild.buildroot.net/results/9a292e621d5b9a7fb3e2761e149c280b520815fd |     
  mips64el   |           attr-2.5.2           | NOK | http://autobuild.buildroot.net/results/c61206968eda9913e37e95a61dc3e10399503fcd |     
 microblaze  |           attr-2.5.2           | NOK | http://autobuild.buildroot.net/results/fb60dd6f812f54b4586b212cdf56e6a462efa4ec |     
   sh4aeb    |           attr-2.5.2           | NOK | http://autobuild.buildroot.net/results/f030fbc9b7c29419f253feeb7bc9fc9eb210a756 |     
   armeb     |           attr-2.5.2           | NOK | http://autobuild.buildroot.net/results/80c5a3de45b5044e517a66b506d567ba8883e9b5 |     
 aarch64_be  | aubio-152d6819b360c2e7b379e... | NOK | http://autobuild.buildroot.net/results/5bd65046a2a182a3d3f8a5bfb93339eba6dc8693 |     
   armeb     |   bandwidthd-2.0.1-auto-r11    | NOK | http://autobuild.buildroot.net/results/d482d7a0addb06c2f5d7d142d58669c63805051e |     
   s390x     |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/233a874f91b7624131945fde003a5219b37d4850 |     
   nios2     |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/3f38ab712a3352f76006042a62f88e7489f0f84c |     
  mips64el   |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/fc1e33632289b5e4e8c8d66fe47c417d5f567f66 |     
  powerpc    |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/8ba7d70930dd97b94223376e19b84afe6c544c53 |     
   sparc     |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/0f8caf640767a11642c450b569df6e9d55621bb6 |     
 aarch64_be  |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/c8ca5bfaccd1751b2ccd446c953971a0a5549c33 |     
   arceb     |  binutils-arc-2023.09-release  | NOK | http://autobuild.buildroot.net/results/a5ba1b83de9540314de796459bea8ba2076c255f |     
  powerpc    |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/9688112a0aa93f1fa5494a35ea5003331a3ef23f |     
  mips64el   |          bullet-3.25           | NOK | http://autobuild.buildroot.net/results/1c0f3d20d64446817901de3cf5b0af189467151b |     
    sh4      |        cache-calibrator        | NOK | http://autobuild.buildroot.net/results/73577028ee5a8870ffcdfbaab636eedfb214f40e |     
   arceb     |         cdrkit-1.1.11          | NOK | http://autobuild.buildroot.net/results/51ead5510716896ab86fa15d10a4acee0e0ef525 |     
  mips64el   |         cdrkit-1.1.11          | NOK | http://autobuild.buildroot.net/results/976f66a0cfedf1cdc68f9c68256b9f2adb00d6e1 |     
    mips     | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/6abd59436f2252dcc3afe22f6d3f5f02be21e0fe | ORPH
  mips64el   | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/ec7e9409faedc783c589a99aae0cac600053161f | ORPH
    or1k     | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/980c6463bc3fe3b148e1823582864199f94b3501 | ORPH
  riscv32    |          clang-15.0.3          | NOK | http://autobuild.buildroot.net/results/cbf230836aae4002a53737c0f939409eb1357d01 |     
    arc      |        collectd-5.12.0         | NOK | http://autobuild.buildroot.net/results/37539a7d7135400732eafdcb8c4d0ca42398204b |     
    arm      |       containerd-1.7.14        | NOK | http://autobuild.buildroot.net/results/eaf1bb926bd168c02b998669d96714402fd07bf4 |     
   armeb     |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/0923eb785459cb856d02bd74c35d0a14810291c3 | ORPH
   mipsel    |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/dc28998c79917fd4b921cb3b25c5ec4b38868682 | ORPH
   s390x     |          cpuload-0.3           | NOK | http://autobuild.buildroot.net/results/2f1cd511919c048b10bd20dbb02616ae32ab9627 |     
  riscv32    |         dos2unix-7.5.2         | NOK | http://autobuild.buildroot.net/results/70a9935418c39974eb557ee876bfdde01ae33563 | ORPH
   mips64    |          dump1090-9.0          | NOK | http://autobuild.buildroot.net/results/486162c8975cdae11eaf78befc84008c9fd99065 |     
microblazeel | dvb-apps-3d43b280298c39a67d... | NOK | http://autobuild.buildroot.net/results/c053aace567db2375e3a49b561dc177026fc4612 |     
   s390x     | dvb-apps-3d43b280298c39a67d... | NOK | http://autobuild.buildroot.net/results/921ce40a4832e50659e776959c688bfb79d98aa0 |     
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/da150203600d2c20e91cd11c35a9bb1a512d913a | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/c35f97e460805b71ae20bed6bad9d5d304497d07 | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/8c569b7da2aa23890acc07b9e0f6a2e6dad24106 | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/297a7dbf455543f317e7e86a0a218324b0899f83 | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/fe48476821ae8d08d9524ba4edf2443e533be72a | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/f316286783bbc466234ceb5d748567a806d5a70d | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/051624825884c83ba5b0549978372d07f62b51ba | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/58c6b697fea94b7c0bab5a952be784177b250d31 | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/86b4614158671b26bce41e239aeaf13c63ac7a39 | ORPH
 powerpc64   |           faifa-0.1            | NOK | http://autobuild.buildroot.net/results/5238024169b0b9e1cd7e9bd7dd91b413dee8b01b | ORPH
   armeb     |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/f7db152e9f765e86e3db65291d67474e90b9af93 |     
   mips64    |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/f8d29abf8e52096ffb58c33d5c4e480bc7d328db |     
    mips     |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/73c83fcb8f7a596405d0b0aca3b7c9e686d40ea5 |     
   x86_64    |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/5315d76a29db8daca208f0b5d88128baee979f5b |     
    arm      |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/dd62a1dcd8001a99219757ed6f0d52433df8b138 |     
    or1k     |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/355e2e2e867318123f383f2e3b77abccbe1fb787 |     
  aarch64    |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/4ac87dc868ad552cd96b1d42a5907745414462fe |     
    or1k     |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/3a1f99b9b0845f3d502795a2f989ec63224061a3 |     
  sparc64    |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/508d615ae6d81cfdbab7ac052f7fd17041646919 |     
   arceb     |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/b78b296b4cbdc026f551ae943aca5d1b7107aa17 |     
microblazeel |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/bf08b1a862af2df6f5d010c23fb392b62be900d3 |     
   arceb     |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/35db72e38ebd7143bd5a4f7d799acbc2c1d2b0a7 |     
    arc      |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/0f003255cd433c0756060c16282075df7277ef8d |     
microblazeel |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/caad009d26b48add722d8fd7239ecda0adffe2e0 |     
    m68k     |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/50667fa2b5adefe98c7ca039f743b617bf4be2bd |     
    m68k     |      flatbuffers-23.5.26       | NOK | http://autobuild.buildroot.net/results/97515ad426ee563885e310188f01f360de15ada4 |     
  aarch64    |         flutter-engine         | TIM | http://autobuild.buildroot.net/results/3c2358aa1f090fa1f56e3bf68d86081b8ee1dccd |     
 microblaze  |          foot-1.16.2           | NOK | http://autobuild.buildroot.net/results/4ee509f974f896de841d7ba47dfae00e1e265c01 |     
microblazeel |          foot-1.16.2           | NOK | http://autobuild.buildroot.net/results/93b373c0090a53ec136c2de01bf7d7bd8a0fdd59 |     
   mips64    |           frotz-2.54           | NOK | http://autobuild.buildroot.net/results/12a6cd1ea90b658f178a43a88dc900d82d5c7e73 |     
microblazeel |           gdal-3.8.2           | NOK | http://autobuild.buildroot.net/results/12999ecd54ad4e820125f9cae5fc00de758e72a4 |     
 microblaze  |       gdk-pixbuf-2.42.10       | NOK | http://autobuild.buildroot.net/results/eb6398fb574cbdf4758b852b5a21ec65d36c0403 | ORPH
    arm      |       gdk-pixbuf-2.42.10       | NOK | http://autobuild.buildroot.net/results/75cc69e7b29784f3fd6637e79ac7f1a91533590a | ORPH
    sh4a     |      ghostscript-10.02.1       | NOK | http://autobuild.buildroot.net/results/c59f3ef38d7343e3ff97494509b15399e7075353 |     
powerpc64le  | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/ac0b28d2db74a29183a536e1cf0ce61f8a661e77 |     
    arm      |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/d5dc35f8533317db82321198b7e45ebb56c67ae0 |     
microblazeel |         gnuplot-6.0.0          | NOK | http://autobuild.buildroot.net/results/4339d1693670b9469f28b2362e5793fbc1115c2d |     
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/74744a3004653a0d3b9bc024ed5b3c4dc695bed1 | ORPH
 powerpc64   |         highway-1.1.0          | NOK | http://autobuild.buildroot.net/results/892b492b232ac31fa2d6ae69151ca1f5aa45e11b |     
 aarch64_be  | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/4609319b5aa188c6e1e052f8fbe444cd3c4d69bd |     
   armeb     | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/74e15a1dcabf64132b8ac980ed94aa1efc42df68 |     
   nios2     | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/bf37b2d64433d26fed358e6b38929d3d55c8755d |     
  powerpc    | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/0d8fd55fbc8754843206b95c2e01824f4dab3c2a |     
   s390x     | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/25593a96a6b871911e33193a060c62af1841d82b |     
   x86_64    | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/91acf0f4b3f505b48f4970ed5c6030d01816e2e4 |     
   armeb     | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/ab2c0757a3a406f0a8219cdccdeb50a5d992b3f7 |     
powerpc64le  | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/6b3f9c092719b535fbd3177c002bf90a45c41346 |     
   arceb     |       host-binutils-2.42       | NOK | http://autobuild.buildroot.net/results/95b0eb1e0d29ac13d91613d25bb73e7ec59c7b0b |     
    or1k     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/daed439e7c967d60338fe69c5120f148af956b3a |     
   nios2     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/05c46ea2b835e1b2e220581e5feee32b8ea35794 |     
  sparc64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/f980aaec4e5901af9652ee4772ad4cb1895cca9f |     
   s390x     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/c763e10807a80b66e9861058caf307c1f058efea |     
 microblaze  |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/637da82014fa4b20b5ecab00034ea14b52b24733 |     
  mips64el   |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/de43f6bc0619a486b2f1397bdc7314a237f7a3c7 |     
   mipsel    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/f9afaedde5e0726830e764dca2d64edc18e06246 |     
    or1k     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/219fba41ee48e3d20874864ebf31b2a622275edd |     
   arceb     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/b5cc0a57f84275ed18f5e96adc0df19d749127de |     
microblazeel |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/6723c4c4bae492d7e01f346ca56454749d8f5f28 |     
   mipsel    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/362a61116eaa09216bb9ed5595c28ad021a12f8f |     
    sh4      |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/592fbd82ed1b1706bfa67d8e9a3f4c82ee022a52 |     
   x86_64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/01be3cb7808fcf8a83e94030d2d70fe85db86147 |     
    arm      |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/c7bc5c054875d86d4d5617f5ec64fe29377c08a1 |     
   s390x     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/0379834ba750a994e6e3871f56b53d2ddff19472 |     
  aarch64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/bfca0720455d42326d65c1c29fbd52161b596591 |     
  powerpc    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/3ef6d9285ea73a75e521f702be39a8a8be15ae42 |     
microblazeel |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/64885d60d3605b41ecbb95057fadd3331d30abdb |     
    i686     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/52b103511b57d3cda0c8e5aa028682ee40141611 |     
   nios2     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/ecbf7f4270923711776527ec76bdb1783de6d8f2 |     
   armeb     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/ab04fd4d17176e754c2daa2b8b3fdf9e1d4af2cb |     
   arceb     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/1dc69b3fbfc887ea8195819032b3a07938d47ba1 |     
    m68k     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/8ae1ccceeb315feb2c4a8f038b639a5a14ac0d1b |     
    or1k     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/8982a435368ac9e38837eb5424c699e5a079ed60 |     
  sparc64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/45cccd755d348d960c7e46a8cce302179d2ecfa5 |     
    sh4a     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/c6e2122d237039cba4d4f5b74ed8c3c3b0afa7f5 |     
   x86_64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/484c4043493533055e52dc26280574f727c83747 |     
    m68k     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/a18d3b63ab07a20a9621990e43d9777635641822 |     
 powerpc64   |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/93bf8c7d3f231fb1c4a92d129758aad9434bb3c3 |     
   xtensa    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/3611108729f287e68784cbec447d62f337d683b2 |     
   s390x     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/f2fc1f8d96e57c8ebf9f5c1b33ed8305368cfc5f |     
 powerpc64   |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/6aa521b3bf28b56f75381f45c4e520b245e9c0d1 |     
    i686     |       host-delve-1.22.1        | NOK | http://autobuild.buildroot.net/results/b1a23e33af6f3a543b600e14d10128408c795ba3 |     
  mips64el   |       host-delve-1.22.1        | NOK | http://autobuild.buildroot.net/results/e5f69c5440bfdd3801c3ac37cb5f59eea92685ec |     
powerpc64le  |     host-gcc-final-14.1.0      | NOK | http://autobuild.buildroot.net/results/561c5c52671d52b0dba3858e4cd4229551535912 |     
   mips64    |          host-go-src           | NOK | http://autobuild.buildroot.net/results/7cd4ac1a4bdf27fbfec1be3f1160be01ad0bb4e0 |     
   mips64    |          host-go-src           | NOK | http://autobuild.buildroot.net/results/7e96d05bcc4c7bec1ed8d7b196875dca38713057 |     
  riscv64    |          host-go-src           | NOK | http://autobuild.buildroot.net/results/dbc862e43aae73922436d9fa01393279f0671dc9 |     
   mips64    |          host-go-src           | NOK | http://autobuild.buildroot.net/results/9fb98189968ca708a8e32f53c63f2456650edc09 |     
   s390x     |          host-go-src           | NOK | http://autobuild.buildroot.net/results/b2e14fe7722f064b1ebc44a5e9dfa1812994a63c |     
  riscv64    |          host-go-src           | NOK | http://autobuild.buildroot.net/results/5fc70ccb29b4cc0d1c6ef8e222c9d4607fe49810 |     
  mips64el   |          host-go-src           | NOK | http://autobuild.buildroot.net/results/04be8834810dfa61fca378bdc3eda829ef23c4e4 |     
  sparc64    | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/70bd8d780ebf8752d7e28a56b9575766369c733d | ORPH
microblazeel | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/ad1bfcef81c19bd46c7ef4c4252a9f6218471cb9 | ORPH
  mips64el   | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/a6ceb90a62aff2dc63d295d4946982b574e26fe7 | ORPH
  sparc64    | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/e7c1435fb04acf3acc75bce96c3add152aef7b6d | ORPH
   s390x     | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/430af3bcd50470326042270193db72924657a741 | ORPH
   s390x     | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/2f2353f83f3413ef01fdcea874cffcb268ea5ca9 | ORPH
   mipsel    | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/2225286463a80374c01b85af260abe0674db6752 | ORPH
   s390x     |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.net/results/92afd37a6139c5ff35b4384208d4679ec65c4258 |     
   s390x     |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.net/results/fe974d9bd54e3aa03c5c54ea3ead47443200c178 |     
  mips64el   |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/48ca5bf6847f2f51c04f566690f5a77c5568ba96 | ORPH
 powerpc64   |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/2d8e33a9a42e0ba4a5308b6f7652091793c55be4 | ORPH
 aarch64_be  |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/3a5b970c7b04c1146125795bd2b2b0cf0d702346 | ORPH
   armeb     |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/08901618a3e6678b274c2342969dafa6d217f380 | ORPH
    or1k     |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/42ea24718cd18c0ee9d8410639c3083a29cac5b0 | ORPH
  riscv64    |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/681181ec7e36893a0112ade2f8d82fc6a74eed79 | ORPH
   x86_64    |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/896ea877e110526e055b0fea73d6589bb158de3a | ORPH
  sparc64    |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/f02136671e2c06ed9cd7703f121852c080b7667f | ORPH
    sh4a     |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/8678707503d1920044871587e25a13ee444350b5 | ORPH
    arc      |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/4455421ed54ae9a4313893497cc7b818f92bbbb4 | ORPH
    mips     |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/0a0332c5ccf2ea15d9bc3c344e124223c0d5c29c | ORPH
  aarch64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/867c4f54ec702271f5b3a78596ad652a2d24bee6 | ORPH
  powerpc    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/9fadffb557f978199e76b17aa8208d2daa41f496 | ORPH
  powerpc    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/998fc23d27f42a3eb974e61c6407fbbc3fd6a1c0 | ORPH
 microblaze  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/1f0b272aa4513ea2eb162a89fa5a03b47d589ca9 | ORPH
 microblaze  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/45a584c49364d6da36673728f476833b1d92cc20 | ORPH
 aarch64_be  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/dfe10c58470c33dc5cbcea967016fa713156aa3c | ORPH
   armeb     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/7d9290b7eb5534da4522599110383d5f29bcaefd | ORPH
    m68k     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/05ccf8aae2b561c173f288c01ee02670fadc3cfa | ORPH
powerpc64le  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/74656c2e48df600b19d5580cb732391020e397e8 | ORPH
   mipsel    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/f0b8d6571a8a43839e86b548056ce7a07bc9da3a | ORPH
   sparc     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/80e9d317c69497437dc4a978a3202085af063e2f | ORPH
    or1k     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/3303a54a84228617208af8d98901e4a8322ce241 | ORPH
  aarch64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/8520346ecee5c7322395640c3552cf3fe8c67f47 | ORPH
  sparc64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/a271e92cf60dae9bc11fa455206d048fa6c91e6f | ORPH
    or1k     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/794aca3468701b608510e0fc04012505cf4a8724 | ORPH
   arceb     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/a52e749a946d5078edca94c5b6eeb0f0b478ab88 | ORPH
    mips     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/17629933d2205d804fe13db529dce26ac995be16 | ORPH
   s390x     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/a5d0a2d13bdb32199f968973bb2936ec52c1546b | ORPH
powerpc64le  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/17c47937a04e0f533f2015a2f787157149b60a77 | ORPH
  mips64el   | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/ec8241a762b81e0a5860ba18f946c6e10f504484 | ORPH
   armeb     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/e7ed24fd0b46ae3580cb398e728a51329fd48a93 | ORPH
   armeb     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/f78f41ed087d024c38eb8b7be386a9a7e7340df9 | ORPH
    i686     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/37e4ec654664ddf2452c231d441acfaca1e5899e | ORPH
  sparc64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/288feb7dce52b20e79c233f28b8e2ae02f3bd7a8 | ORPH
   x86_64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/1dc8cda42ec01c13d2b6df592e2ea72d88d5c3f5 | ORPH
microblazeel | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/bf5044bb680202e9528006d42cc90c4a2b41f8ce | ORPH
    i686     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/f641dcbd1e5502e815510b990aecf8a9aa3cdf19 | ORPH
   x86_64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/489a4229e43d3f482390a2d824b21e3ff6d87572 | ORPH
 microblaze  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/6a09e69bf8a41bc1bfd6a1d8ce0afc3f738f744e | ORPH
  sparc64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/6ab8ae77d9e89589d48f8e2dd6cddd3d26660712 | ORPH
    i686     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/d2f5eb33ddca218f118f8bd9eb1a4b37aed7e7f5 | ORPH
    or1k     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/986242ddc1344f04981c15b7c076e6c1224fe300 | ORPH
 microblaze  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/fc4182594e8b68825428c001736f992c8e74cf24 | ORPH
   s390x     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/7f836d477015c1a1175724443e20b6cac7ace8a2 | ORPH
  sparc64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/f66df65860742abf815c0c7f23c5a25d8ad4bf37 | ORPH
    arm      | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/b2f363e35379b408bd2cc99ac1d30e6f0d30bf11 | ORPH
microblazeel | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/896db8a3d00cb16cae583af01032f9982115bcb6 | ORPH
    i586     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/310dbd8ad1b3fbffc88f229b24dae2cb0ebe3b4c | ORPH
    or1k     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/343511753c922d943f6afee4319299701a3559ec | ORPH
    m68k     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/0a7563165fbad45fe3e4a914633f65649651aa35 | ORPH
   armeb     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/93df5fbbb97faad4301ae60fb12a959c1e43792f | ORPH
  sparc64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/e915b8a842e0a6e564c7ea62dca50d48f4ccab26 | ORPH
    i686     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/9669610a9f522166dbf0fb8c75e513a85c03761d | ORPH
  aarch64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/1acc68188432a2a33d9f9b5f46f50b43849a0720 | ORPH
    sh4a     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/c97f53d613c66e74f19dc4ba1a13fe7291d84cda | ORPH
  mips64el   |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/6e2136311bca316338d442bbe4ca97de4ac895e0 |     
 aarch64_be  |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/993e069db1352d62550829d6a81621a3f2e6978e |     
  riscv64    |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/ca632f6ee75ed9b823509ecfadaa6b218b17b2c4 |     
   arceb     |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/f6d0475b2e205bf8bcb20ac195438349e5285d2c |     
   mipsel    |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/3edb3758fbb9b821fcf687b1fc551a6a2ed4ec28 |     
   mips64    |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/113fe02686ca0e94c28b089a967c4ea8dcb75d95 |     
    arc      |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/e9b638e069e4308d913271356da99487d764a3ad |     
   nios2     |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/728b04117f1888acd35293a4105531c8f226f460 |     
  riscv32    |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/4b66d34a990eb70569f92c5c156c80538bc33598 |     
   armeb     |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/d48fb68be2ca08659eb45ceacc8969c4b27b026c |     
   mips64    |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/db1ceb667ebdd42b78e73e6d6e1759f33e53d301 |     
  sparc64    |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/493849d3d8b11151a0970a2200332aae6b27672a |     
microblazeel | host-softether-4.30-9700-beta  | NOK | http://autobuild.buildroot.net/results/d500d45808aee9a495e0bf03c2095c69f4c3eab8 | ORPH
    or1k     | host-softether-4.30-9700-beta  | NOK | http://autobuild.buildroot.net/results/d2ec73b83022e557c7696b6281df17d9d767678d | ORPH
   s390x     | host-softether-4.30-9700-beta  | NOK | http://autobuild.buildroot.net/results/e4a6abee802ad5cc173c210798be9d7430aacf44 | ORPH
  aarch64    | host-softether-4.30-9700-beta  | NOK | http://autobuild.buildroot.net/results/ee9be32598d7865f9076d6212f56d5c54f0a9d27 | ORPH
    m68k     | host-softether-4.30-9700-beta  | NOK | http://autobuild.buildroot.net/results/9eab42a0bd85680d3a1c9be76166e48cce0668ab | ORPH
   armeb     | host-softether-4.30-9700-beta  | NOK | http://autobuild.buildroot.net/results/24b3ff7475685df0398059bf13296f69b0a20ec6 | ORPH
 powerpc64   | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/aca7bc9a513b0d4622e5d68641bae8ff0bd76419 |     
   armeb     | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/81e565a75afe2c4f300597c15bcd7f4d14265f8c |     
   s390x     | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/bd5a120b7a8792d5b6024dbbb341be91694a94de |     
  powerpc    | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/c19d0171ec1cff748dcc53a76a8629ad54ef688e |     
   sparc     | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/822c99df6dcf4ecf315492cf93775093a2f03111 |     
 aarch64_be  | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/0087eafbc19813ef3df56055480e542c12f7b068 |     
 aarch64_be  | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/b8d3b752310879163d6838c7448021393eaf5f86 |     
   mipsel    | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/f6dfca4b719fd8b6eb0bedd1d2329187bb3ea2cb |     
  sparc64    | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/3a5ab1d1c29c44853b69f0465518fa1a46477116 |     
microblazeel |           htop-3.3.0           | NOK | http://autobuild.buildroot.net/results/a47e69e61ca7258ae42e985d989da8ba6f557ed5 | ORPH
    arc      | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/de03db69ee2cfd6fdff4e983041b7f5ee37dff1e |     
 microblaze  | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/b922b8a2ca3cf4b5edf1dcfe0bc964f1288360bc |     
 aarch64_be  | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/2a3470a2f1fde27fb54c2ce6111eba86c6af8e25 |     
microblazeel | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/1f0410642532d14bfb1245c17e87813aab00c811 |     
    mips     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/47b85797a2ca3ca7bb7d3efa06f4cc61dad9ca31 |     
    i686     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/68ed9c88adcf6d200367c12a074556c042ece548 |     
  powerpc    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/02d4bbb75c386f79d2d3f91d039affd9d550838b |     
   nios2     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/3240ad7dbb041ff4251246440de940b39502ab4b |     
   x86_64    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/85729a73997775806e022766fe80c4934c5db82e |     
   nios2     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/ba22bb2bd937bac0ae26eb1a3829562c0b38ceb0 |     
   s390x     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/dad2943cda890fb1d698a546f2b7e163342a405f |     
    arc      | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/4db4e35a65bd8b54ceeccc819c9699245da230cd |     
    arm      | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/e563acbb14a96a14e8ed7c9d35ae50e4e95d9a8b |     
   sparc     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/a3e728259a633be70df6d26acebbc469a9449d40 |     
    or1k     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/7bec6f7a5328e8962a7d18ac9ee1c0616ac0a3cc |     
    or1k     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/4f831e3145b2b49147a675dba5fe7eea3b4ddd1a |     
  mips64el   | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/361a0923229f6ba259dababb24d52acbf3a4aa8e |     
    mips     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/c1f3b34bda45dd24aea53934c6cf43dfc82b5b52 |     
   mipsel    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/6cf146e94ec5ad94b3b458c7189ed244b6fa5da9 |     
    i686     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/08e2f56172e0010e7edd6e22c4913e4fc2a28987 |     
   x86_64    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/a86da4401cae985a01babafb0bb85277871aadfe |     
   xtensa    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/f0485fa85c9bcab7042035a9273570907bce18bf |     
  aarch64    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/cf6d1e8e4bc0d50d5d25973d566d9ed3f600f50b |     
 aarch64_be  | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/d3b34367a897de87522b84f864b88b07b284bc39 |     
microblazeel |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.net/results/48e0e8e12f506acbff31b88c1457a1822c806992 |     
  powerpc    |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.net/results/89040d5188272e5426276119731f51b42e089251 |     
    mips     |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.net/results/300153eb5891de723bb459090c7e5b1a33f77629 |     
    sh4      |          kexec-2.0.28          | NOK | http://autobuild.buildroot.net/results/bfd065516307933443a7f435079fee37edf705aa |     
    i686     | kvmtool-4d2c017f41533b0e51e... | NOK | http://autobuild.buildroot.net/results/b5c257ad8cdf5e261e55d487a401846c7ccffd01 | ORPH
   nios2     |        libarchive-3.7.4        | NOK | http://autobuild.buildroot.net/results/19cf6c999141ca934a1b6f7992d12b7e4ba50730 |     
 powerpc64   |        libarchive-3.7.4        | NOK | http://autobuild.buildroot.net/results/2f710b38395b2f4d0becc211b72d196e73267bb8 |     
    m68k     |        libarchive-3.7.4        | NOK | http://autobuild.buildroot.net/results/71f5cb67dc04b28e3ad7777e249df146cd38495a |     
    arm      |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/e87978489f64ebb46239a147a8fd30763b2e50fb |     
    sh4      |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/0620c0bc14b19a92196172d53f9b119dbce85801 |     
  sparc64    |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/372da365a6da53c2f5afeabb6a15e17527d3cdd3 |     
    i686     |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/9937f54f6b5db461dd4fd77285ed7408e688354e |     
   mipsel    |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/f583f59cd7de5f2af63c70fd3ba427d65adec39a |     
  mips64el   |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/204274da3bf812e673fe1e7a734ac47a54178f48 |     
  powerpc    |         libcuefile-475         | NOK | http://autobuild.buildroot.net/results/04cec22199cc2a893cd1a54a6dff668ac2d36169 | ORPH
  aarch64    |        libdeflate-1.20         | NOK | http://autobuild.buildroot.net/results/d6cfa3b12287d14062a92a65919906ed84b2e7fc |     
    arc      |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/38bec589b0f38d77add5298a5183f024e8f06f67 |     
    arc      |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/245b2227c46bafad90ed15d69e48601882488da8 |     
 aarch64_be  |          libnss-3.100          | NOK | http://autobuild.buildroot.net/results/8d6dd302097a1d6b44a1b6f1ebf1f59cba713d86 |     
microblazeel |        libopenssl-3.3.1        | NOK | http://autobuild.buildroot.net/results/4ef7955f7b6b2f2cb26205b0888bf728b59c4164 | ORPH
microblazeel |        libopenssl-3.3.1        | NOK | http://autobuild.buildroot.net/results/c7402f5b318a06471b0da75d796665e80ae232e6 | ORPH
 microblaze  |        libopenssl-3.3.1        | NOK | http://autobuild.buildroot.net/results/0d32992ef97873678e0a4e30a33ad3eca0301c5d | ORPH
 microblaze  |        libopenssl-3.3.1        | NOK | http://autobuild.buildroot.net/results/af18acb146941ef8587540b1c486ee3be8bc4824 | ORPH
   x86_64    |         libp11-0.4.12          | NOK | http://autobuild.buildroot.net/results/e800714fb9a82c603ecce40056b27eb8ada97133 | ORPH
   mips64    |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/6b5d7d41761ae702f2ed83f42a0899e93bdaa179 | ORPH
   sh4aeb    |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/fa000371545b48d2aace7b64e979964cc7b60d49 | ORPH
   mips64    |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/0590d795389257a8753cf066d015055a2ccfd181 | ORPH
    arc      |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/2b36950a1cf1a4b4299e3792638c664f87137f83 | ORPH
    m68k     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/3e63666d58a04d371418faa79b13264a5a191a6f | ORPH
   nios2     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/0bcca6261b7d540220b303663c66570898f72c6e | ORPH
microblazeel |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/010d11c4129ff6f984c71d0e3102c460f739062d | ORPH
  mips64el   |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/8edbebeb7700baceac34771eba9e27f71c1b33e4 | ORPH
    arc      |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/90b9f8c18a38f953c6b3f06e5e96d8ed8a553cd8 | ORPH
   sparc     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/90bb140d59bb2551aac7db4ea7aabcc80e4c241b | ORPH
 powerpc64   |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/d7719e7cd8e7cdc4fc409bfd917719677b2a6105 | ORPH
   s390x     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/106c4de769dc8e465ad3ee42297240b25289a029 | ORPH
  mips64el   |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/6595fdab67f9e32bf13447498ef85231d946bd36 | ORPH
   sparc     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/f890f3016ebeb81e66420846ccbaa96f6c144bed | ORPH
   s390x     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/a6da786a2bbeacbcbf279b3142dec6cbfc83367c | ORPH
  mips64el   |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/f2ab7c685f2fefbaf3118012df1ba72985be43cb | ORPH
powerpc64le  |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/aca64702240bdb4ef82bfe13084f2b4f9f08ca9b | ORPH
   xtensa    |          libsepol-3.6          | NOK | http://autobuild.buildroot.net/results/38097743ca493221a943b27d76873fc1d9b24c96 |     
   xtensa    |          libsepol-3.6          | NOK | http://autobuild.buildroot.net/results/9b9b0dc1fad2b789c0340f2f18084b79f6367a37 |     
   mips64    |        libunwind-1.8.1         | NOK | http://autobuild.buildroot.net/results/e3b03d7ed72e9ffb36da53bcc3a04fc0381dd457 | ORPH
   sh4aeb    |         libv4l-1.24.1          | NOK | http://autobuild.buildroot.net/results/98768d32d64ec21bc97576d7bbf95e7234d08201 |     
   sparc     |        lighttpd-1.4.76         | NOK | http://autobuild.buildroot.net/results/117947cb727155f3711500590100ddfd87123fb1 | ORPH
  sparc64    |        lighttpd-1.4.76         | NOK | http://autobuild.buildroot.net/results/e37657c7e454f7e9814e0488703049f925e136cf | ORPH
   mips64    |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/d59c6a99646352c39fc8e6c62c30cbab3a7dac96 | ORPH
    i686     |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/216d16c9ca9a778a4d15202e5b13b17e5e3349f6 | ORPH
   mips64    |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/8c18cf9f19767f81c85f8c2faf1d70d1096cd37c | ORPH
   armeb     |          linux-6.9.4           | NOK | http://autobuild.buildroot.net/results/cad5c9d7cf56f7874523c0a872158b701cead57c | ORPH
  powerpc    |          linux-6.9.4           | NOK | http://autobuild.buildroot.net/results/c14cb2af39967f589697eb72635874385cdfdc13 | ORPH
   sh4eb     |          linux-6.9.4           | NOK | http://autobuild.buildroot.net/results/c6c3f182fab1d5fbd2cf7a690768cf2901375b92 | ORPH
   mips64    |          linux-6.9.4           | NOK | http://autobuild.buildroot.net/results/73602ae7e58b0e6035d17c1bb42020beb421243b | ORPH
    or1k     |          linux-6.9.4           | NOK | http://autobuild.buildroot.net/results/a8f3c35c82ba7f9128fd77e7fd041694d48591bd | ORPH
    arc      |          linux-6.9.4           | NOK | http://autobuild.buildroot.net/results/57077bb1ed48c66e07cfa4943b9e8361a3b18c03 | ORPH
   nios2     |          linux-6.9.4           | NOK | http://autobuild.buildroot.net/results/bf96f08c77913f4517c91304ab92fcf6f6a6f9f9 | ORPH
   nios2     |          linux-6.9.4           | NOK | http://autobuild.buildroot.net/results/ece13db40563da5318f05a80be9531acc157f4f6 | ORPH
  powerpc    |          linux-6.9.4           | NOK | http://autobuild.buildroot.net/results/69629c64be9e0601dcbfa0d9ea4072764a4eda60 | ORPH
    mips     |          linux-tools           | NOK | http://autobuild.buildroot.net/results/e977f70c4d9fc8cd00bb75546a5a1e5445e7e7f8 | ORPH
  aarch64    |          linux-tools           | NOK | http://autobuild.buildroot.net/results/d466a1ea654a7db76bb050bb0e77fb740992ad7b | ORPH
   x86_64    |          linux-tools           | NOK | http://autobuild.buildroot.net/results/2c939be60cedadf9bfe024df5e7913d2de42f50e | ORPH
    arm      |          llvm-15.0.3           | NOK | http://autobuild.buildroot.net/results/72195fd8055e60d87e33463255ec57263fa0ef1e |     
  sparc64    |     ltp-testsuite-20240129     | NOK | http://autobuild.buildroot.net/results/c537f2bfc963e144c15b9724ba1e49332e121634 |     
    arm      |           lxc-5.0.3            | NOK | http://autobuild.buildroot.net/results/271c60e6c750ef31cd9bdb923243176bea7246ff |     
   x86_64    |      mediastreamer-4.4.8       | NOK | http://autobuild.buildroot.net/results/ea175c4553390fecb148aedb1e50050c0f7eed83 | ORPH
powerpc64le  |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/bcd5a6ebdf7dd27fa29184db730d56b4545277fd |     
powerpc64le  |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/c787beeea17a1f1bd536843403fb1411d6f800d6 |     
 aarch64_be  |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/3270f6eb82bb3eb28e7618f2fae4ce1e4311f228 |     
   nios2     |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/2edd3c82434b826d26d1648d803375aa3dcdaa67 |     
    arm      |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/43d33b5b0c8f50a46f0b78f5b8ce3c47794835c6 |     
    m68k     |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/b40ab48915efa96dc2e473af1c8dcba0d1bde2b6 |     
   mipsel    |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/6a5a141567727e958d77dc84cbb43fbdb1636de8 |     
   s390x     |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/c42ba4ce73939c0735a42a0279515a4394da1732 |     
   armeb     |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/b34d8d25365114f133ee01aee8cd169b459ea75e |     
   nios2     |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/335574e4c78a10abb80670e60de4f16e76696202 |     
microblazeel |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/b0a8fd30882faa26597dcdc3fe73f37d26a21682 |     
   xtensa    |           mtd-2.2.0            | NOK | http://autobuild.buildroot.net/results/934f8fa3974654269006bf7a0b6d314781501b82 |     
  aarch64    |           ncmpc-0.49           | NOK | http://autobuild.buildroot.net/results/cb570ab0c966320b465d9cccfe0c17fc712ede07 |     
   sparc     |          nginx-1.24.0          | NOK | http://autobuild.buildroot.net/results/e67f01b89c16c0db6f9f2a16349fe7a2cdba17e2 |     
    mips     |         openssh-9.7p1          | NOK | http://autobuild.buildroot.net/results/df88f86ac9cc529d7c60b376a2f8307496a6bd7e | ORPH
   mips64    |         openssh-9.7p1          | NOK | http://autobuild.buildroot.net/results/59da5c335638f0eff37d0c181fb9297b8f76064b | ORPH
    mips     |         openssh-9.7p1          | NOK | http://autobuild.buildroot.net/results/71dfba8e02eb73a33e80e60fc84b95c0cb6116c6 | ORPH
   mips64    |         openssh-9.7p1          | NOK | http://autobuild.buildroot.net/results/0d46c60b11c7f31d52e3c8f7429154bca894ff8f | ORPH
    mips     |         openssh-9.7p1          | NOK | http://autobuild.buildroot.net/results/c9d7c6a9f388fa5afe6d315fcc7200a2b30039f3 | ORPH
    arm      | pistache-3ec9d7c4f8b828fdd3... | NOK | http://autobuild.buildroot.net/results/26299711a3e5867e11d52e7c20b14c6dd5c93f60 | ORPH
powerpc64le  |         pixman-0.42.2          | NOK | http://autobuild.buildroot.net/results/150cbc251f82a1ab3f49a7b4430813b74b1aeffe | ORPH
   sparc     | pppd-e1266c76d1ad39f98f1167... | NOK | http://autobuild.buildroot.net/results/41bcf9bebc4835596c70ecd3651b2157b27e20bd |     
    sh4      |     python-remi-2022.7.27      | NOK | http://autobuild.buildroot.net/results/41b6228e89a13dd1dd6dd89eba2657a65f1beef3 |     
   x86_64    |     python-remi-2022.7.27      | NOK | http://autobuild.buildroot.net/results/32ef375f6a43286cfc2b20d09f7edacbe80bd446 |     
   nios2     |     python-remi-2022.7.27      | NOK | http://autobuild.buildroot.net/results/2ebb0b2a03359f48ccd065b96a8e81c1e08a184e |     
    i686     |         python3-3.11.8         | NOK | http://autobuild.buildroot.net/results/51b184805557f17a23d6fe04400f3bc328372f03 |     
    arm      |         python3-3.11.8         | NOK | http://autobuild.buildroot.net/results/fdb04625c6f874d46e5a5531ca7be8f42e91699e |     
    i686     | rtl8189es-eb51e021b0e1b6f94... | NOK | http://autobuild.buildroot.net/results/2384274cb6a4a4ffba28486723b3bd6224070d48 |     
    i686     | rtl8822cs-fda6cd263e8956727... | NOK | http://autobuild.buildroot.net/results/82dd4d986c0ddfb48e7316473186ef4c9d8ee783 |     
  aarch64    |           rtty-8.1.0           | NOK | http://autobuild.buildroot.net/results/2590df6753ef724df21b79de621383a55eb9dfeb |     
    i686     |           rtty-8.1.0           | NOK | http://autobuild.buildroot.net/results/07849811646624a76379d5b4efc1dcc3ac6f246b |     
   x86_64    |           rtty-8.1.0           | NOK | http://autobuild.buildroot.net/results/6d3cc05c85246a03af0864f285c2e8b1074ee3f2 |     
  powerpc    |         s6-dns-2.3.7.1         | NOK | http://autobuild.buildroot.net/results/1aaed4132c965ea72e044a5be2c314c2884af3ff |     
microblazeel |         s6-dns-2.3.7.1         | NOK | http://autobuild.buildroot.net/results/dc18166e1c75ed8f3c925f61ffbc5161fb559d09 |     
    arm      |         s6-dns-2.3.7.1         | NOK | http://autobuild.buildroot.net/results/3d4c739b92e88d9688d18607017efedfb07403f3 |     
  powerpc    |         shadow-4.14.5          | NOK | http://autobuild.buildroot.net/results/275786653d420df11592e6dbc255c476314eddcd |     
  aarch64    |           shim-15.8            | NOK | http://autobuild.buildroot.net/results/34bfdaea1e1575f5e8750db9bd5950f41ecfe1c9 |     
  powerpc    |       sofia-sip-1.13.17        | NOK | http://autobuild.buildroot.net/results/3c3fe3c268363cfac024cbe86ed2dd5e04c5a8b6 |     
 microblaze  |       sofia-sip-1.13.17        | NOK | http://autobuild.buildroot.net/results/b585987af619046a8d1298463060da6113eaa3bc |     
    or1k     |         uclibc-1.0.48          | NOK | http://autobuild.buildroot.net/results/a79fdc0bcf1c329636e42fc8a728f716ddf9a65e |     
powerpc64le  | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/43148cc45716128ea82535319cbd4d2f4a9de229 |     
   armeb     |            unknown             | NOK | http://autobuild.buildroot.net/results/947dc79546a002bf3ccde13ceb5521de4cba1158 |     
 aarch64_be  |            unknown             | NOK | http://autobuild.buildroot.net/results/cf4c6ef433969d2c582605e405a43e0a240095e6 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/62d476c76501e2b1eab0b1e8adb97bc378acfe7e |     
   sparc     |            unknown             | NOK | http://autobuild.buildroot.net/results/a27bef5924ad8a38341fe4ed2b69dc2efaa91a72 |     
powerpc64le  |            unknown             | NOK | http://autobuild.buildroot.net/results/eafe2cc64438a3ea8be333e3164348685ec5f46c |     
 aarch64_be  |        upmpdcli-1.5.12         | NOK | http://autobuild.buildroot.net/results/1909efc872e59556a99e6764b702915302d534f9 | ORPH
    arm      |       util-linux-2.39.3        | NOK | http://autobuild.buildroot.net/results/9a8c19eca83077e3c3abcb467c0fc7f46ab1419b | ORPH
  aarch64    |        webkitgtk-2.42.5        | NOK | http://autobuild.buildroot.net/results/00cde94d2e4868eff5205165c05d228d266f6d9f |     
   mips64    |         xinetd-2.3.15          | NOK | http://autobuild.buildroot.net/results/aeb8ca6625a1f6af8698fbb0817bc41807e98789 |     
    arc      |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/813aef10ca0d3e744155ac8110c67b0c2214f591 |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

                   bird-2.0.12 | 1 
                  bitcoin-26.0 | 1 
glibc-2.38-81-gc8cb4d2b86ec... | 1 
                libglvnd-1.4.0 | 1 
                libressl-3.8.4 | 1 
            micropython-1.22.0 | 1 
pistache-3ec9d7c4f8b828fdd3... | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/ce9354481596a0647ca09d76fd0379915d80bdf0 |     
microblazeel |          bitcoin-26.0          | NOK | http://autobuild.buildroot.net/results/c249301fc32c6eb97c4102f3e1d99160ab0d638e |     
powerpc64le  | glibc-2.38-81-gc8cb4d2b86ec... | NOK | http://autobuild.buildroot.net/results/07e86d453fefdd686709f8a3052841db6c636a93 |     
   mipsel    |         libglvnd-1.4.0         | NOK | http://autobuild.buildroot.net/results/7443ac0e476aa89f99e675966732ec91e1492a9b | ORPH
   mips64    |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/df48b04cf002ea23464c2d7b13c2080a3cb77346 | ORPH
 aarch64_be  |       micropython-1.22.0       | NOK | http://autobuild.buildroot.net/results/69af46afaab5e5ec30a2031c523d6a5996ebb431 |     
    arm      | pistache-3ec9d7c4f8b828fdd3... | NOK | http://autobuild.buildroot.net/results/d6cf811707e013a444d3560d947e61919be88ce4 | ORPH


Classification of failures by reason for 2024.05.x
--------------------------------------------------

ibm-sw-tpm2-5452af422edeff7... | 2 
                       unknown | 2 
                fail2ban-1.0.2 | 1 
                libglvnd-1.4.0 | 1 
               mariadb-10.11.6 | 1 


Detail of failures for 2024.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   nios2     |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/092fb6b3bfcc561c39de17b27e9d171d69407f17 |     
    arc      | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/3c70d5b81b04812976595c1b9c90145a993f6b57 |     
  mips64el   | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/81f6b8b2fdffcd27baadef1b41175a9ccbe37019 |     
    or1k     |         libglvnd-1.4.0         | NOK | http://autobuild.buildroot.net/results/9058b69dc5c948256ae953d7ed78c177b56a4a9d | ORPH
    mips     |        mariadb-10.11.6         | NOK | http://autobuild.buildroot.net/results/96253f00a8bd9774b3fbc9691c98f621194499e8 | ORPH
 microblaze  |            unknown             | NOK | http://autobuild.buildroot.net/results/fdd917f334a530d086124f85e6b9e46b3835253f |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/d576ddf2b58c89e80763d57934b22b818f31c144 |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
