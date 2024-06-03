Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD536C25B75
	for <buildroot@archiver.kernel.org>; Mon,  3 Jun 2024 04:03:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 676A5404F6;
	Mon,  3 Jun 2024 04:03:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eo2FTw7FfzMH; Mon,  3 Jun 2024 04:03:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2E90B400FE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2E90B400FE;
	Mon,  3 Jun 2024 04:03:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DC2361BF82C
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 04:03:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C8D424012E
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 04:03:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QTP18dKfRSzN for <buildroot@lists.busybox.net>;
 Mon,  3 Jun 2024 04:03:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0B66D405D1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0B66D405D1
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0B66D405D1
 for <buildroot@buildroot.org>; Mon,  3 Jun 2024 04:03:25 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B2A2F20012
 for <buildroot@buildroot.org>; Mon,  3 Jun 2024 04:03:22 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Mon, 03 Jun 2024 04:03:22 -0000
X-GND-Sasl: bot@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1717387402; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=bJ5K1Ifdhd6kp0m+ZV+tWQ1/xVmLmKRtnfLRf76nh/M=;
 b=FA7sQtmXl3Jkdbf9sP78xw1/WVkovHA4JDZQIDLWU83P5U6ogAGF5/LMejCz0ujKpfIAP4
 DxQucWZG6kFZw6GHr2VNNxRjbW40Wlr4jC0Ol+u3wEK1qM5PhePYHSTZE6OTqXOHmu9yKp
 aJEh08ZnTSaINPuuLh6bGKAeSjlIOt8r9WZeEh8QyFHKuawchus5NTDS0ZhR+zgJ/Vd+lm
 jStN70ZnP6dBXr8FpKtgOP0XuqdYd9MAh02jy+mljHqyZOFoQnamhpwd6If0o6Q29svLGC
 tUJt7359H9yg7Gx64v90zZcqd0EObEmne72BFJ65qIBVhHgxF4rV6c6M5vrvUw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=FA7sQtmX
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2024-06-02
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
Message-ID: <20240603040322.s3p9wrULC9yk16bPVDA-FCxOrDlzWLdqacbpBTHVtdY@z>

Hello,

Autobuild statistics for 2024-06-02
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  6  | 18  |  0  | 24  |
    master   | 196 | 565 |  1  | 762 |

Classification of failures by reason for master
-----------------------------------------------

host-prelink-cross-a853a5d7... | 84
            host-cdrkit-1.1.11 | 57
             host-vala-0.56.14 | 21
                    mpir-3.0.0 | 20
                fail2ban-1.0.2 | 15
host-android-tools-4.2.2+gi... | 15
ibm-sw-tpm2-5452af422edeff7... | 15
                libressl-3.8.4 | 15
                host-odb-2.4.0 | 13
      host-riscv-isa-sim-1.1.0 | 13
        host-python-lxml-5.1.0 | 11
                  linux-6.8.12 | 11
                 uclibc-1.0.48 | 10
                elfutils-0.189 | 9 
                host-go-1.22.3 | 9 
                  libffi-3.4.6 | 9 
                 gnuplot-6.0.0 | 8 
                  bcusdk-0.0.5 | 7 
check-11970a7e112dfe243a2e6... | 7 
glibc-2.39-5-ge0910f1d3278f... | 7 
aer-inject-9bd5e2c7886fca72... | 6 
android-tools-4.2.2+git2013... | 6 
                  ffmpeg-6.1.1 | 6 
               libglib2-2.76.1 | 6 
        host-sentry-cli-2.20.3 | 5 
          libcamera-apps-1.2.1 | 5 
                       unknown | 5 
 host-softether-4.30-9700-beta | 4 
              libarchive-3.7.4 | 4 
              libopenssl-3.3.0 | 4 
                  libsepol-3.6 | 4 
         python-remi-2022.7.27 | 4 
                   trinity-1.9 | 4 
                    zeek-4.1.1 | 4 
     bandwidthd-2.0.1-auto-r11 | 3 
                 coreutils-9.3 | 3 
                   foot-1.16.2 | 3 
         host-libxcrypt-4.4.36 | 3 
                mongodb-4.2.18 | 3 
                  ntp-4.2.8p17 | 3 
pppd-e1266c76d1ad39f98f1167... | 3 
             util-linux-2.39.3 | 3 
                     apr-1.7.2 | 2 
                    attr-2.5.2 | 2 
                 augeas-1.12.0 | 2 
                  bitcoin-26.0 | 2 
                   bzip2-1.0.8 | 2 
           crucible-2023.11.02 | 2 
                 dc3dd-7.2.641 | 2 
                  dhcpdump-1.8 | 2 
esp-hosted-669fd9cd1892bb8b... | 2 
              fluent-bit-3.0.3 | 2 
            gdk-pixbuf-2.42.10 | 2 
                gnu-efi-3.0.18 | 2 
         host-gcc-final-13.3.0 | 2 
host-heimdal-f4faaeaba371ff... | 2 
host-vboot-utils-bbdd62f9b0... | 2 
          linux-5.10.162-cip24 | 2 
                   linux-tools | 2 
ltrace-82c66409c7a93ca6ad2e... | 2 
               openblas-0.3.27 | 2 
                 rrdtool-1.8.0 | 2 
                ustreamer-6.11 | 2 
               acpica-20240321 | 1 
                  assimp-5.3.1 | 1 
           at-spi2-core-2.50.0 | 1 
             batman-adv-2023.1 | 1 
             berkeleydb-5.3.28 | 1 
              bluez-alsa-4.1.1 | 1 
                  boost-1.83.0 | 1 
              cache-calibrator | 1 
                 cdrkit-1.1.11 | 1 
             containerd-1.7.14 | 1 
                   cvs-1.12.13 | 1 
cwiid-fadf11e89b579bcc0336a... | 1 
                   dhrystone-2 | 1 
                    dust-0.9.0 | 1 
        edk2-edk2-stable202308 | 1 
                    flac-1.4.3 | 1 
                   flann-1.9.2 | 1 
           flatbuffers-23.5.26 | 1 
               freeipmi-1.6.14 | 1 
                  gamin-0.1.10 | 1 
                      gdb-13.2 | 1 
           ghostscript-10.02.1 | 1 
          gitlab-runner-15.5.0 | 1 
         gobject-introspection | 1 
  gobject-introspection-1.76.1 | 1 
                    gpm-1.20.7 | 1 
            host-binutils-2.42 | 1 
         host-gcc-final-14.1.0 | 1 
     host-moby-buildkit-0.11.6 | 1 
            host-qt6base-6.4.3 | 1 
                    htop-3.3.0 | 1 
               ipmitool-1_8_19 | 1 
                  jack2-1.9.22 | 1 
                  kexec-2.0.28 | 1 
                 libcoap-4.3.4 | 1 
                libcuefile-475 | 1 
               libdeflate-1.20 | 1 
                libdrm-2.4.120 | 1 
                libesmtp-1.1.0 | 1 
                libglvnd-1.4.0 | 1 
             libgphoto2-2.5.27 | 1 
                  libnfc-1.8.0 | 1 
                liboauth-1.0.3 | 1 
               libunwind-1.8.1 | 1 
                 libv4l-1.24.1 | 1 
           libzenoh-c-0.11.0.2 | 1 
        libzenoh-pico-0.11.0.1 | 1 
               lighttpd-1.4.76 | 1 
               mariadb-10.11.6 | 1 
           mediastreamer-4.4.8 | 1 
                memtest86-6.20 | 1 
          moby-buildkit-0.11.6 | 1 
              mosquitto-2.0.18 | 1 
                     mtd-2.1.6 | 1 
                    ncmpc-0.49 | 1 
                  nginx-1.24.0 | 1 
                 openal-1.22.0 | 1 
                opencv3-3.4.19 | 1 
                 openssh-9.7p1 | 1 
                openswan-3.0.0 | 1 
                     php-8.3.7 | 1 
          python-grpcio-1.60.0 | 1 
           python-rtoml-0.10.0 | 1 
            python-scapy-2.5.0 | 1 
                python3-3.11.8 | 1 
            qbee-agent-2024.09 | 1 
              skalibs-2.12.0.1 | 1 
             sofia-sip-1.13.17 | 1 
squeezelite-71c012ad9ba102f... | 1 
             stress-ng-0.17.07 | 1 
             strongswan-5.9.13 | 1 
               syslog-ng-4.7.1 | 1 
               unixodbc-2.3.12 | 1 
                    vlc-3.0.20 | 1 
                 wavemon-0.9.5 | 1 
                 wolfssl-5.7.0 | 1 
                 zlib-ng-2.1.6 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |        acpica-20240321         | NOK | http://autobuild.buildroot.net/results/88afb2de317d909935cd1c9dbcd4916856bc111d |     
powerpc64le  | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/0d075035f8d8b8f474e71f1dceb238cc426208a7 | ORPH
  mips64el   | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/8eb03090243804a3ebc820e871618774bd3a4b97 | ORPH
    arm      | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/7e18d55acfc7b787a892a7ffa6a41ce424ee42a1 | ORPH
 powerpc64   | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/6bf2841fc619a94ca72b19b48a971e62def04e25 | ORPH
    or1k     | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/79382b13bfd8239a0285d715d58236c9d2f7433c | ORPH
   sparc     | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/374c79c3a4296a7c311c59f52f9d3564d65370bc | ORPH
   mipsel    | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/4e9c55fdb38f526e0d02c00184b353870f300cc0 |     
  mips64el   | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/613dc3b5b2c8685e05dc0ec2393d83e944ae1990 |     
 aarch64_be  | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/d9c9a8c9be292bb058d1571feddcbb485bc56b2e |     
    mips     | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/e131a57a057010e64b58abe6a207af125b2bf1d2 |     
   sh4aeb    | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/d9c81da7ee4f5237255eedab461274a5e971f3a4 |     
powerpc64le  | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/512fa06402a0456a9564c5744feb6839912b985d |     
    sh4      |           apr-1.7.2            | NOK | http://autobuild.buildroot.net/results/ac519aabb5a3a91f76ddb5123d81c5b42e7a43a0 |     
    m68k     |           apr-1.7.2            | NOK | http://autobuild.buildroot.net/results/998bd5fa824730b09ec722c841ccf951078c0f1f |     
    mips     |          assimp-5.3.1          | NOK | http://autobuild.buildroot.net/results/26ec1d06ac9078d7fe83042de2d411ecf3c4a856 | ORPH
    arc      |      at-spi2-core-2.50.0       | NOK | http://autobuild.buildroot.net/results/ae5ded10a291b33be485f31b0f1cb75039f822c8 |     
    arm      |           attr-2.5.2           | NOK | http://autobuild.buildroot.net/results/cb5fd1bcb16875acefe3a050766c6a6d0e469673 |     
    mips     |           attr-2.5.2           | NOK | http://autobuild.buildroot.net/results/17796f3f6ff4559d0f0b5aeb5168fc9ec780d978 |     
    sh4      |         augeas-1.12.0          | NOK | http://autobuild.buildroot.net/results/d4c6ede33591d7afe68ccfbdec76e6029e22e505 | ORPH
   sh4eb     |         augeas-1.12.0          | NOK | http://autobuild.buildroot.net/results/f0808bd0c5855b67cb9813d7f12ce2c0be184ce5 | ORPH
   x86_64    |   bandwidthd-2.0.1-auto-r11    | NOK | http://autobuild.buildroot.net/results/bd70fb52417c95932c55ba61f1f24aab717da384 |     
   s390x     |   bandwidthd-2.0.1-auto-r11    | NOK | http://autobuild.buildroot.net/results/896c740c71880a38df982641e6703e3b435f501d |     
    i686     |   bandwidthd-2.0.1-auto-r11    | NOK | http://autobuild.buildroot.net/results/0fd4fa563b2c8c02d0662d423663d140227f6728 |     
    mips     |       batman-adv-2023.1        | NOK | http://autobuild.buildroot.net/results/6bbe46c6fd90105eb122de25cebb4921bf3d0ff0 |     
   sparc     |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/1342a5c9bd25b8293fc707d8a80ad24b4cd3ed55 |     
   s390x     |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/669d38fb6cd6465ce7048443a94e3bf6ccc7088f |     
    m68k     |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/4d250d363d4a5f82c724d3f024c9409c10e728ce |     
   nios2     |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/2128c94b14fa911fa9e874444a53fa56959da3bf |     
    mips     |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/938a61ff148337be28d5489807977d973d5f0b32 |     
   x86_64    |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/683e6c0768ecc4ccb39500f2908a5dd685b8bce5 |     
    sh4a     |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/74c5765c5a795617250c3975fe0d35d74e0b7db2 |     
   sh4aeb    |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/227effdb1500f9b212afedbfbfa16c5c7279d824 | ORPH
    m68k     |          bitcoin-26.0          | NOK | http://autobuild.buildroot.net/results/a1a7264a394643a1183c9b51330c6ecea74ded55 |     
    m68k     |          bitcoin-26.0          | NOK | http://autobuild.buildroot.net/results/9b6e4030b4333d3471f5d77e890cc7e86e43bc98 |     
  mips64el   |        bluez-alsa-4.1.1        | NOK | http://autobuild.buildroot.net/results/4ce4086ceda6c846190c1f5dc85527625b1f8739 | ORPH
  mips64el   |          boost-1.83.0          | NOK | http://autobuild.buildroot.net/results/5b7df8e4275b35e83bc640a08ebd142ff2e855bb |     
  riscv32    |          bzip2-1.0.8           | NOK | http://autobuild.buildroot.net/results/087ecd9a999d0bfee3f08141dfb7d5894a675e35 | ORPH
  riscv32    |          bzip2-1.0.8           | NOK | http://autobuild.buildroot.net/results/d8a024a4a9db7fc26c38215f12bceee721c41e77 | ORPH
  riscv64    |        cache-calibrator        | NOK | http://autobuild.buildroot.net/results/1631aba9cc74af27c441e46c944a05d35af9bd23 |     
   nios2     |         cdrkit-1.1.11          | NOK | http://autobuild.buildroot.net/results/f7f67efb828af4bd46adcd4c0dfd1c8d1d26dc77 |     
  riscv64    | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/16be7edfc26312a4f44a54c628254c0e4950fb49 | ORPH
   arceb     | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/fb03353a4dbf6ef91f8a19a1a94d2402babd0a64 | ORPH
   mips64    | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/0d7295e91d913386c3d69f4fea19c074a48e5563 | ORPH
   mips64    | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/e9d4dca4879fe69ff2ad98e250ec74800e477047 | ORPH
    arc      | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/1e87067a29bff64231cb903ce6d0ea29c1aa0436 | ORPH
microblazeel | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/ef5a9005d06023847dfaec48c6f3fd73e0f25b55 | ORPH
    mips     | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/eb93aee2f099734b8eaaeefe0776d7f0b49efaf4 | ORPH
  riscv64    |       containerd-1.7.14        | NOK | http://autobuild.buildroot.net/results/5dc92359cea9bf2594224c5f65725c9ec77463e0 |     
    mips     |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/1060e0312442465b6a4e7bae01fab32feb8f6ced | ORPH
    arm      |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/d2dda83694c22ef8766649dbe0c7298da76694c2 | ORPH
    arm      |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/04a31bff95df5051521475f12edd22049347bd3f | ORPH
    arm      |      crucible-2023.11.02       | NOK | http://autobuild.buildroot.net/results/c160d54dfdbeeb720ef5926202a6b0793fe92e6e |     
   s390x     |      crucible-2023.11.02       | NOK | http://autobuild.buildroot.net/results/fa6d360a137c9f178c67e077b2820d00a3bf84bf |     
   nios2     |          cvs-1.12.13           | NOK | http://autobuild.buildroot.net/results/9249bf97471501a6311ad4fef26f09ca929fd9ec | ORPH
  sparc64    | cwiid-fadf11e89b579bcc0336a... | NOK | http://autobuild.buildroot.net/results/4c5dc08fbfd288307890d2e562bfd602492bc645 |     
   nios2     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/a406fb19bb2d5a6d1a8bd2e6907cac292a473687 | ORPH
    or1k     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/16228d6b610c3cabf3e05e3dec4bbcd5583d41dd | ORPH
   s390x     |          dhcpdump-1.8          | NOK | http://autobuild.buildroot.net/results/2fe3de56189a4d2bec043707b5cb519c6851114c | ORPH
  sparc64    |          dhcpdump-1.8          | NOK | http://autobuild.buildroot.net/results/b171b728b927aef08de97ca9f118d3b5376805a8 | ORPH
   s390x     |          dhrystone-2           | NOK | http://autobuild.buildroot.net/results/bc90ca6db821a36ea3984b5e614df1f91402e3e4 | ORPH
    arm      |           dust-0.9.0           | NOK | http://autobuild.buildroot.net/results/b89907afcba62350059d1508c413952bd8e5ecf9 | ORPH
    i686     |     edk2-edk2-stable202308     | NOK | http://autobuild.buildroot.net/results/b8d3de2a768486a309ffe3e82755f44800b57777 |     
   arceb     |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/d60c0d73870e0a02835ff7a8596ba66065cba2ed | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/19b7a500343b296ab665c265e9e2358168904aee | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/424904e05388dc07f502c6aa53a9d9c65085a230 | ORPH
    arc      |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/42c8b656bbe32d49ee3640f2c31c20ea307f8aa5 | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/d97c78bd096d1bd5ac03fbee0d18a3be5202692d | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/7b7722503bdd46a4c9eb0aca769ef49608f02e7d | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/55e20718a01e51bca2a64da2c0c9ea63fe05000b | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/8052d79826d33fd5de083d04b18a59f02560e275 | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/28c9fceae341e48352fc7d4d5b6889931fc0224d | ORPH
  sparc64    | esp-hosted-669fd9cd1892bb8b... | NOK | http://autobuild.buildroot.net/results/5c4fac191970444e63109a762023c0e60f9693e2 |     
    i686     | esp-hosted-669fd9cd1892bb8b... | NOK | http://autobuild.buildroot.net/results/d64fa083ec27c3684d4186d2b1b05e041ad330f5 |     
    m68k     |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/5b382b1caa9c0dda568323429c83a587246b54bd |     
  sparc64    |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/e6446fc025259d39db5596872c64130612a36dc1 |     
  sparc64    |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/0115465ef20ec5b96cd9f0037d07d1fc64bdc2f6 |     
    arm      |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/9e1535176d11b1a10ca607776d4f4434d94fc459 |     
microblazeel |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/17256563c58c4d51aa6217cc74f95dec8151ad44 |     
    or1k     |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/13cd39d28b45c60b8a82daac7e9795f4a091bf69 |     
 powerpc64   |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/4394e39db0073252ba1f377c2b169bb60b40af97 |     
  powerpc    |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/9f0fdec7851db1be5264bfe1cfd387203dbf3713 |     
 aarch64_be  |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/87bb29d81b710b09054a76ffe102a6e350e1ad42 |     
   x86_64    |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/842a48438ba011b318cc9bff8ee208d21e084984 |     
   sh4aeb    |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/49f49d56122480724fd6a8e8ed547571b6694b2d |     
 microblaze  |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/fe3c0be6a293d6a918c0b5895988069dd3ce0ca5 |     
  sparc64    |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/6854afe187b62472284b78913249c99c963aab98 |     
   mipsel    |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/2c96d6041427e88d537ac3ff4381700f998c31f8 |     
  powerpc    |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/7dd826cf8909aac4cabf69c1f5828b6c0a4b1dbd |     
microblazeel |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/5704a2435308ca40801c200ce2a24fed82a4f1b6 |     
   arceb     |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/9cdee0ea58fa85cc63d43b757cc7d4bdf737ec86 |     
microblazeel |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/256e6c20fca09c4bf327fd2f34ef329db5a4087e |     
  riscv32    |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/82d78c3037009f1042dacb4486f3f0a3382024e2 |     
    arc      |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/8b74651e3e5103eb6f4cb6c109e9e1959a4d9ed8 |     
   arceb     |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/730bdec54d2d8e085e29393569d399f685b67797 |     
   sh4aeb    |           flac-1.4.3           | NOK | http://autobuild.buildroot.net/results/f79ece1c148ca8753d183a9be55a52028db2429e |     
    or1k     |          flann-1.9.2           | NOK | http://autobuild.buildroot.net/results/dd13e451e1837fe7ad20acaed9c14dfd846adcbe |     
    m68k     |      flatbuffers-23.5.26       | NOK | http://autobuild.buildroot.net/results/240706cf3eeaad3bf0be17bc785b2c0474848a1f |     
  powerpc    |        fluent-bit-3.0.3        | NOK | http://autobuild.buildroot.net/results/5571b07e061acca759e7c47937f203c12d212a81 |     
   nios2     |        fluent-bit-3.0.3        | NOK | http://autobuild.buildroot.net/results/144be9bac273aa8ac7ee3663a7ff4d60fe331747 |     
   mips64    |          foot-1.16.2           | NOK | http://autobuild.buildroot.net/results/cf2ece4ab3c507d3cf0f53dcd501a2ef9188d4a3 |     
 microblaze  |          foot-1.16.2           | NOK | http://autobuild.buildroot.net/results/5be444f30d1ed9cdb57cf0c80c31900c74b4b707 |     
   mipsel    |          foot-1.16.2           | NOK | http://autobuild.buildroot.net/results/cae6fbe670e3b93e204e5359326d1d841b8b8216 |     
powerpc64le  |        freeipmi-1.6.14         | NOK | http://autobuild.buildroot.net/results/104285cd45071e48004fda2a4cc65c481748d948 |     
   s390x     |          gamin-0.1.10          | NOK | http://autobuild.buildroot.net/results/c6928e5566e2a300f0f0c43579ec38053805d0a0 | ORPH
    mips     |            gdb-13.2            | NOK | http://autobuild.buildroot.net/results/dd3164cc145f8a62ba421503eff0cd411db705f5 | ORPH
powerpc64le  |       gdk-pixbuf-2.42.10       | NOK | http://autobuild.buildroot.net/results/84be731c39526d6ab6e743c8862997c6bcea58da | ORPH
    sh4a     |       gdk-pixbuf-2.42.10       | NOK | http://autobuild.buildroot.net/results/066dc2174eda7d5ec41ee788b830872fd23469b4 | ORPH
    sh4a     |      ghostscript-10.02.1       | NOK | http://autobuild.buildroot.net/results/d1de3a70433a9e2bf238a1699b398ac07f96fec4 |     
   x86_64    |      gitlab-runner-15.5.0      | NOK | http://autobuild.buildroot.net/results/e22d9206a236eed8527df9fe3220dd937e446205 |     
  powerpc    | glibc-2.39-5-ge0910f1d3278f... | NOK | http://autobuild.buildroot.net/results/30d5d8bee0e03309c9055e3684db6ac7ffb64d30 |     
 powerpc64   | glibc-2.39-5-ge0910f1d3278f... | NOK | http://autobuild.buildroot.net/results/5f61a0d5d22a81ecd3a3b58260eb1431b44abeac |     
 powerpc64   | glibc-2.39-5-ge0910f1d3278f... | NOK | http://autobuild.buildroot.net/results/36947e05f7bd618a416ed68b424e7e82e7358d05 |     
 powerpc64   | glibc-2.39-5-ge0910f1d3278f... | NOK | http://autobuild.buildroot.net/results/715bd403890c5640819b0c36ecc0668373812fe0 |     
  powerpc    | glibc-2.39-5-ge0910f1d3278f... | NOK | http://autobuild.buildroot.net/results/d2104d4605fc44ed74a97a409dfa3566b0953061 |     
powerpc64le  | glibc-2.39-5-ge0910f1d3278f... | NOK | http://autobuild.buildroot.net/results/0022dce4e160a2a855818d72728fc3da7430c9bc |     
 powerpc64   | glibc-2.39-5-ge0910f1d3278f... | NOK | http://autobuild.buildroot.net/results/b593a9a18d390da5e03dc4c116dbd30a7383cfd4 |     
    arm      |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/d32fa051dcdf5f75e2c6301d0d7641e6229f139e |     
 aarch64_be  |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/27080400215226b8cf5a8aad140406e2e2d944fd |     
 microblaze  |         gnuplot-6.0.0          | NOK | http://autobuild.buildroot.net/results/029d83ca3b526b0772dfc5aa7cf959adc2d00764 |     
   mips64    |         gnuplot-6.0.0          | NOK | http://autobuild.buildroot.net/results/1aa0043a818352ea02cc501af216c4bb0f027939 |     
    or1k     |         gnuplot-6.0.0          | NOK | http://autobuild.buildroot.net/results/a7eca427f7aaf34b7807ab33651b750216a94d72 |     
   mips64    |         gnuplot-6.0.0          | NOK | http://autobuild.buildroot.net/results/34a05465108c1123cae9b9b0c5ceb25ff695d9fe |     
   nios2     |         gnuplot-6.0.0          | NOK | http://autobuild.buildroot.net/results/4effeea8608b4a703e7d1b7b383a735bfa1ef44b |     
   nios2     |         gnuplot-6.0.0          | NOK | http://autobuild.buildroot.net/results/1da213db331ce21487288d7489605b85d0a1218d |     
microblazeel |         gnuplot-6.0.0          | NOK | http://autobuild.buildroot.net/results/2ec10138ddaaddf5f02ba4b6dd06e61b2e488de4 |     
   nios2     |         gnuplot-6.0.0          | NOK | http://autobuild.buildroot.net/results/b027912ff433bc34fe602d4af70d68a55a94f6b7 |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/13296e2feb99c629f23c071a5a22b039ba1239b6 |     
   x86_64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/22cb015057af86fadc60f234c651361e98942fbe | ORPH
   mips64    |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/3e0e8443c2245223d30495bbbb5ac1c418dee476 |     
 aarch64_be  | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/b627a1f760cdd435214561dee9b82b3d983284b1 |     
    arc      | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/e81cfe0d15b0719e85af752505bcf9c3ae5e9c98 |     
    m68k     | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/07944102fadbe49fa39a3de7d94b1bad1cf679f6 |     
    arm      | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/b4c44c910081ceba0c42f93b6bbacf4d99bf3d25 |     
  sparc64    | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/08c37aa4ce4df7505e8871ae7fccd03b003e4bb8 |     
    arc      | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/4710608386782f3af5015e764c3bacfce77b2e9e |     
 aarch64_be  | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/7a41029ae6a0e106b89b83e012d16a23cbb52d2c |     
    i686     | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/b5418623a47bdad8b46b98c625f6cec50a6272f2 |     
   armeb     | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/0687a25c6c6b74309b2976dad60aa31a38f2a517 |     
 aarch64_be  | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/797dd81ca720377e95ccea8f5ba2a3ac156f4cca |     
   x86_64    | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/6f5424bf509e4540325a6f17bbc45da3e4665de4 |     
   arceb     | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/176cef787b916261875547d098ad4b3d30b27c68 |     
    arc      | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/0cf444e20a2fa60d399c57ed5d54448c86550fc0 |     
  mips64el   | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/3f00c49399372878d1999b6112724e8b77c0a43c |     
microblazeel | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/6e8551b7abe1c4ee0c148c5974e56bbcfece1e8b |     
microblazeel |       host-binutils-2.42       | NOK | http://autobuild.buildroot.net/results/e3eec216cabffc2ed2762a9cea5d3a7f833330b4 |     
  powerpc    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/6ce79c6fa7bc2269145613ab021c0980c1ea0a5b |     
microblazeel |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/66f62bde0271a8b31dabf690826b5f3fef421304 |     
   sh4eb     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/b37022424c3569fbab0d63678088651d550c12da |     
   sparc     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/92db6d73c653376fab004128b59b74237365b22b |     
    m68k     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/9afb8b7f48e37cfbf9e2ec7b8e5845e1f10d53da |     
    mips     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/6a97be8ab9f4e153654f9264e244a146a61392c6 |     
   arceb     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/80960150bb65edf3c53d0b1b652868a2dc37ebe7 |     
    or1k     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/5d8f6c8586c0db09ebe0aa09de6ab280c85bf697 |     
powerpc64le  |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/e6d66078e03071634633d61f422119c7e2af2e73 |     
   s390x     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/d093299063628b919a215ef0700ad760d0c31766 |     
  mips64el   |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/95319b5c67031afd3aa497f9886568675772f735 |     
    arc      |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/81762392ceee0ce5b01ee4884f3f0dd3ecdbc4b3 |     
   mips64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/6131bf1127d2144b05daa82e68bfb625a8a78b4a |     
    arm      |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/8d0b20c60f441bf5dd67cbdd3a66d1de0ca75c5c |     
  aarch64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/7a6a2427c6a6372455381459eca12b9130cd207c |     
  sparc64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/ad490dccc1de46d5df4ad8144cff053528ab7ff0 |     
powerpc64le  |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/a9ea25f28cb9f623c6cddc220dfe883259c4d30b |     
    mips     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/4db62871e34060453b6d7b7b299aecc545c62d7b |     
   s390x     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/8ab0bf60cf8a5ad58d8511c25b0b1efadf27b4ad |     
    m68k     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/ee5798044011a692b031d67de077dabb0d1564c9 |     
   s390x     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/6c026dc1b79f89da8044e6aa350327a95cd91ed2 |     
 microblaze  |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/eb08fd6d649d2c9710bdfe348ed67a685b340afa |     
microblazeel |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/1f81e9496823aa2bb2bf01fcf38d5459a6f430f2 |     
   armeb     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/b8293c8a5c193e79ad1bed6263e3e636a06ff60d |     
   mips64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/bcbe1edfd256ddae3f02cac5549270d1799bb2c3 |     
  aarch64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/a1e638e2858fe7786c6e8f4daa49577f5bfc32af |     
 microblaze  |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/63a37e14e8853b74185379fa4d15e0b3c32516ac |     
 powerpc64   |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/b0bb0f461e2110479e536f72fe273b3f6b167fa9 |     
   x86_64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/287b8d51ddd9c2a245ce414c94e2d4d75a88bc98 |     
   arceb     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/e8928e5e22ff71112c117b23558f8ead9239af80 |     
 aarch64_be  |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/054ab86c42e2a17fce9499d850d0f7f7a03528ac |     
 aarch64_be  |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/468d5508ab6c285fbb039ee31c1edc3db99a0050 |     
  mips64el   |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/f30d220a0484a3b0d598181263dd6ee49038d66e |     
   x86_64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/d57f6335c53776ab14b9be12a50c7ff4337e225e |     
   x86_64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/7a1e5ce24760df9c32a070a1b91572fe6a264fd9 |     
   x86_64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/8669308a933412a906c9c7f7b12de522ca2bc459 |     
  sparc64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/c8fef4323c6dac1fa72fa0c3d1f093bcd8ef472b |     
    arc      |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/946d2dae23f367d4f0c66e41acb98be740f5a7f6 |     
   armeb     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/3d63c5cf16362aa828524291eada6fd7953990fd |     
   s390x     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/3597e127d7e4a086f6a384e025256e5597515b69 |     
 aarch64_be  |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/0ef4eb7a291bd496ef48344fd6a863e414a840ec |     
    i686     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/3189becefca05d44cacdf084b11a0d4af4a940dd |     
    i686     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/aec010bb8748b8a07f707a657a45e8aae045d5a9 |     
powerpc64le  |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/578691b1ac38a37a43cd1484c26bf4071f92b43c |     
    or1k     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/c94bc32ec8d9dcaa7b62010692f12927150d3f85 |     
   armeb     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/e299ed8409a5e1f38dc055af7b9fcd54f4f4424d |     
  mips64el   |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/d332bdca73ded59ebd48a8cf4010eae775d88596 |     
   nios2     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/e36f17b3269fc45bf89c238ddf4a905fe0bed444 |     
   nios2     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/72b9ca676385336db489669363d843c3fcf0df1f |     
   armeb     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/bc5ebc8780f52baa25769587f9c01b7e39c5e442 |     
 aarch64_be  |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/a29fe341d30c7e9ea0579bfd79ab65bfefbe8d1a |     
   arceb     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/16a33b0aebf0193390588eaf22f636668fe7822d |     
  mips64el   |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/dcb8bac383035244e0e1e8fcf9d9189e5c92551c |     
   arceb     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/8ab06f092f524599ac92c9b5127f5a90fd2d9802 |     
    or1k     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/f1cbdeee65ba4849508a69f7d7b95d6272465e08 |     
  mips64el   |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/89dd11ff9d0df30bb6ab8842466651cfd3494b3e |     
    i686     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/0f880a72060751983e35721e723ec5a0562f6f22 |     
 microblaze  |     host-gcc-final-13.3.0      | NOK | http://autobuild.buildroot.net/results/3ba8c19362bdff52306bbc594caf8bf58165b159 |     
 microblaze  |     host-gcc-final-13.3.0      | NOK | http://autobuild.buildroot.net/results/29b68bfff84ff32d6bfeeda0a9eeff165e82253e |     
powerpc64le  |     host-gcc-final-14.1.0      | NOK | http://autobuild.buildroot.net/results/947e899f9dc6a1e1160cb15be760bd0b24ddf336 |     
   mips64    |         host-go-1.22.3         | NOK | http://autobuild.buildroot.net/results/26f5693af5802f3fe18ddf9860680b311ea6d97d |     
  riscv64    |         host-go-1.22.3         | NOK | http://autobuild.buildroot.net/results/dee2f6a48022538794e406d605d7348fdc8a0f0b |     
  mips64el   |         host-go-1.22.3         | NOK | http://autobuild.buildroot.net/results/53dcc797bc3d44de873b9385076bc9a956b92bfe |     
  mips64el   |         host-go-1.22.3         | NOK | http://autobuild.buildroot.net/results/4af8747cfac5a17e4b84656e52ef43fef03e665b |     
  riscv64    |         host-go-1.22.3         | NOK | http://autobuild.buildroot.net/results/b7afbfdf6d9ae02123d8300b57e9e25b0fc82d29 |     
   mips64    |         host-go-1.22.3         | NOK | http://autobuild.buildroot.net/results/a1fb3aa5f75a619c6da9160a7f0f28cdf09b5c9d |     
  riscv64    |         host-go-1.22.3         | NOK | http://autobuild.buildroot.net/results/cd582119187d737dab14c0bfe3e2d5b5285c9f2f |     
   mips64    |         host-go-1.22.3         | NOK | http://autobuild.buildroot.net/results/0aa449f9d01b4d6bc745d9240b941de7eba0bb5b |     
  riscv64    |         host-go-1.22.3         | NOK | http://autobuild.buildroot.net/results/3ceae60bf7ca3c8c405dfe84db427991d25bff48 |     
   x86_64    | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/5e5b50a43338c9884aa79748b719af057f91d091 | ORPH
powerpc64le  | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/24092a337455af7dfee7d1629d432fe77f2d6a56 | ORPH
   arceb     |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.net/results/571abc5a6327141a963a9df0d99c311e2c0e0a39 |     
   armeb     |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.net/results/b4abfce3712ab62ae4857b07498bad13775bacae |     
   nios2     |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.net/results/a810b281ae2772a2318fe1af0fbceeb9e412a8f4 |     
  riscv64    |   host-moby-buildkit-0.11.6    | NOK | http://autobuild.buildroot.net/results/997319e0e8404ecfa2733a5206628209d5fd2bb5 |     
    i586     |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/9e3d826fa3f348d8dc4576cb7ecee9857b034dc0 | ORPH
   mipsel    |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/55da1f76d7df4a9c8d1ccc0fc1da4f7455c56d2c | ORPH
  mips64el   |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/7899807876ab33a971903726d8568e54b1bcd127 | ORPH
   sh4aeb    |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/00ee3f73c8de11d9bc9f79c43c8cb2bc53a385e3 | ORPH
    arc      |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/74f151edf3452101b4672098b3ad60cac455489b | ORPH
    sh4a     |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/1b129c8f96beedac26f62bbeaaa96c5fbb40328e | ORPH
    mips     |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/7a0a7f7b63297c8111ff919185ee85120c2c46e6 | ORPH
 microblaze  |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/5200e495dd4cbc6eb155aa6998d286fb45eb4f7d | ORPH
   s390x     |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/108fb20cad48c7a1befed0acd1b6a4bd59376d09 | ORPH
 aarch64_be  |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/1526ade66013c07372e7834d2a431362c8d6d877 | ORPH
  powerpc    |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/66ea7f8ca1b6882bc07a7d05f5835d5026a33215 | ORPH
  sparc64    |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/4cfeb110757f55565595f67619b848acde8d4c93 | ORPH
   s390x     |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/d6e593cc2c4f69177785ac60a8d1fc1757a0e6f8 | ORPH
   mipsel    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/febbcb85b6366b47a84e789b2a42bc746f6240ee | ORPH
    or1k     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/e573d51a9ebf52f8498fc360e44be207b83523f1 | ORPH
microblazeel | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/313161ee2c0e1f2a633cd317027467ba0e3a3d50 | ORPH
  powerpc    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/af45c530011f7d34f9f4b4854a3d7093c1e80a73 | ORPH
    or1k     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/9b9e4a1bbcdec59a1a8aecfbad371ddfe366d142 | ORPH
  sparc64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/580bc8dd6dffa0f81cfc3cc6ddfb6545481b4aee | ORPH
  sparc64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/ccd0ee5938a030ac846e1d766c8ac5181c3c5012 | ORPH
  sparc64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/7bf712f8acf7405192dcb6d77b2297cafa3cb023 | ORPH
microblazeel | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/170f733d47d4404af0ef22c7ebc0633532aff3b6 | ORPH
  powerpc    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/14478bbb55f0e855db8ebc1006d71d305ed4c0d8 | ORPH
 aarch64_be  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/ff42e72708bd1e56b73f42b5d6e143c4b4e77333 | ORPH
   mipsel    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/6f90fe323e1d10eb6bd298712a6fd5beb514086a | ORPH
powerpc64le  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/5745dcc1905d4f715973f58a3ed33b475f3e9769 | ORPH
   x86_64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/b667901e25f992dad206e565e18d7aab9b1e04c9 | ORPH
    mips     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/e12ea99cdc0a409042eef1864b17e7fa75380af8 | ORPH
   x86_64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/b49ea148253c604d330609f9c4931251b879390c | ORPH
    arm      | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/fb460082b4f0b5f6725684d3458c1b27f74ec680 | ORPH
  sparc64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/2759e1a4daa590306ec39a88ab9610d756b6815a | ORPH
   armeb     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/f0dff8eb045c71c09ac01cb25dbf9aba2a4ba1e3 | ORPH
powerpc64le  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/34bebc014fab238f238864df3daea188a8a6d818 | ORPH
   armeb     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/5aa6ed65c1c821423daf65c0d6febb41724ea27f | ORPH
  aarch64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/e224e24e2b1206a32a32babf9f80d5abeacdf709 | ORPH
  aarch64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/3c02c87920865aa13b040fc96cfe948ce4dcdb8f | ORPH
 powerpc64   | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/6b6b5ad269f672720ed53ab35803e58f7c78e744 | ORPH
  sparc64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/aacca7d68b33291e6e944487851c3eaec7a4ed8f | ORPH
   mips64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/3593d5b65d90c14b24cdc37b1c22363cc69826aa | ORPH
   mipsel    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/6c62bd2fc64ab871fa0cf153ebac4645e0fb1068 | ORPH
  sparc64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/c58c18674ccfdd536457b8b60efff5c41a8635da | ORPH
   x86_64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/5d85b239a459c3094c7d11d38e1a7a8767a6cd75 | ORPH
  powerpc    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/b6ac19db3ab027f46000311ba9d88bd8b063e1d8 | ORPH
   s390x     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/207130abf0f45e85119b311415451af5df0aae74 | ORPH
   mipsel    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/15042efcd128259aeb47df242cff48737cd28b55 | ORPH
   s390x     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/11c9b8bca9f57cba67ad6644a7921056ddeb422c | ORPH
    i686     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/bab51a3e51a9d7c21798bc71d8eaf31437a88418 | ORPH
microblazeel | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/0f01dfc7d1a57151e89794c5c4694611cec63d29 | ORPH
   armeb     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/1f697d2ad19e6455c7cc3f3895c85f8bd8e32e04 | ORPH
   x86_64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/3251060c286dd61771648197753799aea6179324 | ORPH
powerpc64le  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/25c0e33db2b78eff1f56ae2c04bfa59b4e422b7c | ORPH
microblazeel | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/034dfd2767e1361c02ea961c468a79e70a39c444 | ORPH
    i686     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/00f9a35b713b7b0249df24806d30cf0ca7a3c26b | ORPH
    or1k     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/c8fedb84416cb8bcfdf1add8169e987fe5fe0cd7 | ORPH
    arm      | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/5fd356bb623af1e8cebfbfb8df8d6fdad5978dba | ORPH
    or1k     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/9be59c0535274093685ebaf0c32f67ae203a925c | ORPH
    mips     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/d95cf5c1ee3a523eea2a7811d501faacff4ff0dd | ORPH
    or1k     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/be2d885daaa714c8eb5066caee13a93b5237354a | ORPH
 microblaze  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/858fcae56826575089a2a61ee282e3b1df5976b1 | ORPH
   nios2     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/acc5437463aec82b2829febc886c0a2b67a40476 | ORPH
  sparc64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/cecc48e684632ec9b8b973aae409f4ed44e78f9e | ORPH
  powerpc    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/bf87f3b869488a9c725ba2768178af2ec8611c88 | ORPH
  aarch64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/d7404214b0665889805d34e6f27e08a05c64386f | ORPH
powerpc64le  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/1b3a7c8ef8b4a2b6472b6eb7b269ddcf0c95c679 | ORPH
   sparc     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/ea94ba70242a7a58c42eee3bd65cb955dbc80183 | ORPH
  sparc64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/b17e0f2dcd85b738883d0967b8760a369e69e47d | ORPH
microblazeel | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/b1ce4a9247d220245dd711c3da498dfc041b5d3f | ORPH
  aarch64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/3866a8f8a580675b60ff3b9229a1485c526cd308 | ORPH
  aarch64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/955ca2b9d87ad261efd58b4b81cb9b1c1621e9d4 | ORPH
   nios2     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/eacfb9045c4b8095ad2d45817c417bae30dc6160 | ORPH
    arc      | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/d7d079bbd30643078ad72da7ee9cea2e652b8c90 | ORPH
powerpc64le  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/6d9bf168a04505d11056bb224e51c50b51b3ba09 | ORPH
  powerpc    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/61edb79a0609767cd539858fce6eafd7a688b02a | ORPH
powerpc64le  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/2186b0c114ab2e963191410aaf69d93a8be7f1c4 | ORPH
 microblaze  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/e42db1d79a15358bc95c2aa38f07e3d8c015bd9d | ORPH
microblazeel | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/423d7e71aee857c6c52fc626bb2588c4798cab6e | ORPH
   s390x     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/a3c9ca5d6a53803ea85ef548e03e1c3cd5398fb0 | ORPH
 powerpc64   | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/2770ad557142066de32bb9b9159843b97f73cf94 | ORPH
    or1k     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/7488983b4e90e7304545ced00b50131de4d3d914 | ORPH
   x86_64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/0fc5e556d0ee3d51e29f657e69650bced07eaa80 | ORPH
    sh4      | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/936a8ab0129dad84da709184ce48bb228578b311 | ORPH
 microblaze  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/6dfd7abb6f3bfbc460d1962d5eb9448380762348 | ORPH
    m68k     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/191d6710c572c5a9ae2d4c4fecafd87462be0857 | ORPH
   armeb     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/02a4a6fd92583d03b677997e7826781d80037537 | ORPH
 microblaze  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/c7516f6f1b51152c26db23704d6664efe0539aa6 | ORPH
  aarch64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/32f7775396307e4c304e73328499b67771a1f412 | ORPH
 microblaze  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/be7f009897f664b2e31eef4f398f3fb98eab4317 | ORPH
powerpc64le  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/4c423e7f0cf0dc7e5b20bca196ca42d6f07eaaae | ORPH
    mips     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/219eb74d74e04a67cf6c43bb9793189e763e3c51 | ORPH
    i686     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/4125067d563ef924691c835e2c9cb7624d0115c5 | ORPH
   nios2     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/bd75ad1fc4e25df43a8750786f91260592488228 | ORPH
powerpc64le  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/4a49b8ddbcf0c6c1cee92ae457acf48427e26763 | ORPH
 powerpc64   | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/34d4a5a5091a90e0a6b687b437a3a20babcc96aa | ORPH
    i686     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/5f53eb2119451a150f785cdfa162e5bd73830e6e | ORPH
powerpc64le  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/039d0cd11171472bc81ff58fbe91544dcbd796ec | ORPH
  sparc64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/9c3725c24d9596892b21ec83c4dafe73413fc0df | ORPH
    mips     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/410154d0bdc70a57875a2f437998999bf8342a1d | ORPH
microblazeel |     host-python-lxml-5.1.0     | NOK | http://autobuild.buildroot.net/results/e0a5f53e29f7fb5955972c473c317f33ff332bbb |     
   mips64    |     host-python-lxml-5.1.0     | NOK | http://autobuild.buildroot.net/results/b1c37be3f180bc728464ba62215f1bfeb45e8377 |     
    mips     |     host-python-lxml-5.1.0     | NOK | http://autobuild.buildroot.net/results/724b1fea235c1916bf0f80d5200f131010dc7600 |     
   xtensa    |     host-python-lxml-5.1.0     | NOK | http://autobuild.buildroot.net/results/95dde8d534ec697c71ae9cd9eff506cdccab7b9a |     
   arceb     |     host-python-lxml-5.1.0     | NOK | http://autobuild.buildroot.net/results/daa6145e765a64c179f85a11f877706339dd6ce8 |     
  riscv32    |     host-python-lxml-5.1.0     | NOK | http://autobuild.buildroot.net/results/c798e9b97868659daa824434b7b2203826b7ca37 |     
 aarch64_be  |     host-python-lxml-5.1.0     | NOK | http://autobuild.buildroot.net/results/a7528a92acb2689fff38cd4f1d971612722eea1e |     
   mips64    |     host-python-lxml-5.1.0     | NOK | http://autobuild.buildroot.net/results/d42ca7a23992359c2aefd19de2fd4207516ad6ce |     
   mips64    |     host-python-lxml-5.1.0     | NOK | http://autobuild.buildroot.net/results/85bec147920d096495430ac855b0daab54923a19 |     
   armeb     |     host-python-lxml-5.1.0     | NOK | http://autobuild.buildroot.net/results/40f110af6c1d220f4e91563aa1cc84edd4055c11 |     
   s390x     |     host-python-lxml-5.1.0     | NOK | http://autobuild.buildroot.net/results/e04c616ba1dab2b42df8628b2b781517005ed4c4 |     
 aarch64_be  |       host-qt6base-6.4.3       | NOK | http://autobuild.buildroot.net/results/47bed3154bd42c4be345e482610e8cc9e382b885 |     
    i686     |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/4af7787c34873b64b83df7ee7dac2e57bec1ff74 |     
 aarch64_be  |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/281ce842be754590f77a2941e5d79ed63c98ef5c |     
   sparc     |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/6f4a8efe33ea3739f343cabc27bec0c1f664512d |     
  mips64el   |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/a9345bb997d79a32f62ba378b4cd837edda7991f |     
   x86_64    |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/852c51d6bec0cd9b2426d5450c482c37f6a2675d |     
   x86_64    |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/c300f1c84033aec1d265b682e4c1da5362d25f8b |     
   arceb     |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/96e2650f6e9618872becab7292a311f1281766d8 |     
   mips64    |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/597473cfcac8baaa492b731ab7fe1bbb35e9e939 |     
   xtensa    |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/0f34c46516fba11bbf22b7a5c7f6985fbe150ca6 |     
   x86_64    |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/6922db0a54b165c12be1b5571ffc7c34c27021b9 |     
   sparc     |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/f8d8d1ae7c53dc29a78c01eab47b83483c5f9aff |     
    i686     |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/8fd208d1574b274551c8a1d865a0787dc2adb541 |     
  aarch64    |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/6a9ab36d7786979c42963ddfb1b544aa1d9efcec |     
    mips     |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/1fecf7361c9afb1a2113e7223e16537f29dc1c64 |     
  powerpc    |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/bb2e320e719fb55b5a7d37e1fe3d75693c7bc8a3 |     
   xtensa    |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/49638f7639f588a7c6a17863a43f1eb4899e4b28 |     
   x86_64    |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/ab18d8056dcfde7a2f0a0014341232a19844fddf |     
   sparc     |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/f08d6fcf8f5a9f8c1e8d98ea0f8eb797cdf5de04 |     
   x86_64    | host-softether-4.30-9700-beta  | NOK | http://autobuild.buildroot.net/results/46151451a2af1b3f7189aa99ce488585efc5e009 | ORPH
    arm      | host-softether-4.30-9700-beta  | NOK | http://autobuild.buildroot.net/results/19418757c894d48054efc61deda8270d29d72bf5 | ORPH
powerpc64le  | host-softether-4.30-9700-beta  | NOK | http://autobuild.buildroot.net/results/b4de1d92a9b897487c99dc6b7f6f86eccbdb338b | ORPH
   mipsel    | host-softether-4.30-9700-beta  | NOK | http://autobuild.buildroot.net/results/865555eb27f8abb25bd3aca19002141a0e98ef80 | ORPH
    or1k     |       host-vala-0.56.14        | NOK | http://autobuild.buildroot.net/results/3c9c697dde4d974e19acbed6412dbfbdc3bd4c3f | ORPH
    or1k     |       host-vala-0.56.14        | NOK | http://autobuild.buildroot.net/results/4848b87b70cc33b99674755c981ab9e07dcea7d5 | ORPH
powerpc64le  |       host-vala-0.56.14        | NOK | http://autobuild.buildroot.net/results/67bbbea42f686eb7e4cf033291c86b1d3de9d933 | ORPH
  sparc64    |       host-vala-0.56.14        | NOK | http://autobuild.buildroot.net/results/4c1f176ed46943958a692ec0221f64152a3c8cdc | ORPH
   sh4aeb    |       host-vala-0.56.14        | NOK | http://autobuild.buildroot.net/results/bfa0e238e3b16c04a3101a6e1c2fef7cf1483f79 | ORPH
  sparc64    |       host-vala-0.56.14        | NOK | http://autobuild.buildroot.net/results/69596a1ef0add0d7509cfcd8ec4477dab8414421 | ORPH
   mipsel    |       host-vala-0.56.14        | NOK | http://autobuild.buildroot.net/results/70f6970c327f15834c1f8ede3f4132424437cbc7 | ORPH
 aarch64_be  |       host-vala-0.56.14        | NOK | http://autobuild.buildroot.net/results/e39a6ad369060ddc2fc81b55b8b48aab9d330977 | ORPH
   x86_64    |       host-vala-0.56.14        | NOK | http://autobuild.buildroot.net/results/f38190fb6e325881a6c35663c98c220070514c41 | ORPH
 aarch64_be  |       host-vala-0.56.14        | NOK | http://autobuild.buildroot.net/results/9e6dbe08d855e55ab5ea1857e8ebae43206522fe | ORPH
 aarch64_be  |       host-vala-0.56.14        | NOK | http://autobuild.buildroot.net/results/11066aa883128a122bc8d4c549d5ac77290b0c6b | ORPH
 aarch64_be  |       host-vala-0.56.14        | NOK | http://autobuild.buildroot.net/results/a7b7d19eb2b92fc420cc5cde0c6b4824772694fe | ORPH
 aarch64_be  |       host-vala-0.56.14        | NOK | http://autobuild.buildroot.net/results/01a567ef225d4b3cd1fc37c33e05e637c2852169 | ORPH
   x86_64    |       host-vala-0.56.14        | NOK | http://autobuild.buildroot.net/results/9d469522567c8e277a032d9dfb153d7dbc61fb27 | ORPH
  mips64el   |       host-vala-0.56.14        | NOK | http://autobuild.buildroot.net/results/5ff75de06245fe74b4baad5edace69370faed688 | ORPH
  aarch64    |       host-vala-0.56.14        | NOK | http://autobuild.buildroot.net/results/e76f8c741a4211e3518bc7b7a78ca876ca088387 | ORPH
  sparc64    |       host-vala-0.56.14        | NOK | http://autobuild.buildroot.net/results/87960e807e987432484d78390ca71752ae8370a2 | ORPH
  mips64el   |       host-vala-0.56.14        | NOK | http://autobuild.buildroot.net/results/6d4fdd3b1d43b602845b3b3eb868f2c0747cea82 | ORPH
  mips64el   |       host-vala-0.56.14        | NOK | http://autobuild.buildroot.net/results/c45f0a8f84d17ed323dced30d1894d9790d21766 | ORPH
   mipsel    |       host-vala-0.56.14        | NOK | http://autobuild.buildroot.net/results/75596c1efd670c9024c4ee4b0a688fa5b7b99c9c | ORPH
 powerpc64   |       host-vala-0.56.14        | NOK | http://autobuild.buildroot.net/results/c2e1302d6983d330f759e406bde89dfc03051430 | ORPH
    or1k     | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/043753a4ab154af3417ef6fcb5c8f4a025c23fbb |     
 aarch64_be  | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/3171fecb20dfe4f39d280760ddecf4040674948d |     
 powerpc64   |           htop-3.3.0           | NOK | http://autobuild.buildroot.net/results/5becb65570b077ed6442633b3e9747f218e6e51c | ORPH
   s390x     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/28ebb1c34745dcbf29920897b1e121269a28619a |     
   sparc     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/bcd9db2fe95b8053733ddc8b2fac8a4839f0d1ba |     
   x86_64    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/4dfc15813494bd8c9f4c176a2acaa53f9b02b4a0 |     
  aarch64    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/34da13fc6b0546f6796e53d5ad1b007943f53714 |     
 aarch64_be  | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/080d2c1ab3bf46d3cb4dc89ca131ae30541f582c |     
   s390x     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/f422aba8728cf3e685133f724054aad9b4cb0f1d |     
    arm      | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/9fbda856d8fd00a10d45515b49606edc9fe6674a |     
   mips64    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/b136e8cf2d2de460f70d099eb623820be3d3e89b |     
   s390x     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/87972af1b94b563bc6c675df5c1aec003bb47541 |     
   x86_64    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/e590a520954ac8c90449fdb6d5a8f33bae1f8567 |     
    arm      | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/c578c1fc1023be4093905862b88be2284df74d5c |     
    arm      | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/a2cdfb8887ccf86d955f8c8308f902c98f9c0f99 |     
  sparc64    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/ff19776598cb86d6b830e7f1525b9493ce5b249f |     
   s390x     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/f848a0fbfa41059ba9fef87dd48c67f04b690f78 |     
   nios2     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/f0e3faa1a98c77da1d700adcaecd26c3405b4187 |     
   mips64    |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.net/results/c046012e036d47fc6b9c05db41fc4b1ee1880fb1 |     
    m68k     |          jack2-1.9.22          | NOK | http://autobuild.buildroot.net/results/4f0580a7f271b41dce74f900c1469e0cd7d0bed2 |     
   armeb     |          kexec-2.0.28          | NOK | http://autobuild.buildroot.net/results/3f6fc7df39e972c0e5f6abac3565b813a7a75f93 |     
  aarch64    |        libarchive-3.7.4        | NOK | http://autobuild.buildroot.net/results/ad9cf58a8fa578c9e108ae04f1e61c2b0b9f7836 |     
powerpc64le  |        libarchive-3.7.4        | NOK | http://autobuild.buildroot.net/results/5f19cb056d9890a7b35cd7387bffcb2c15bb0f3d |     
  aarch64    |        libarchive-3.7.4        | NOK | http://autobuild.buildroot.net/results/796f3e8dc13e7128a4a1924c712fad5bab20443c |     
    or1k     |        libarchive-3.7.4        | NOK | http://autobuild.buildroot.net/results/b8a48458363f3611f47b70ae91cde7e9e4430fb3 |     
   s390x     |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/90ff7662456a2b2e3d52fc230a92d6bb6ce12047 |     
  sparc64    |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/91e89811f3aa30cedd52982671f4f1c1a9a45f54 |     
   nios2     |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/c81c44a73647e54e8f451e1f22a1611bb9d3641b |     
 microblaze  |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/4467bf9ecf9cd0e165ac843bceffdead4ef0d3e0 |     
   sparc     |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/f32cd0deaf104fbfecedaf90be3bed69f0677f43 |     
    i586     |         libcoap-4.3.4          | NOK | http://autobuild.buildroot.net/results/f243209454feed4f33f759786c2023c576a2cd3d |     
   armeb     |         libcuefile-475         | NOK | http://autobuild.buildroot.net/results/c727650787fdb6239597aba6765593903ff12d9a | ORPH
  aarch64    |        libdeflate-1.20         | NOK | http://autobuild.buildroot.net/results/2522a9687be39ae648ac00a8b40f63fcc737db5c |     
   sparc     |         libdrm-2.4.120         | NOK | http://autobuild.buildroot.net/results/3db65ad17d29dd24d2eac9453439cddb4065b623 |     
 aarch64_be  |         libesmtp-1.1.0         | NOK | http://autobuild.buildroot.net/results/9a05b27d3d55ddf95c324da7732f74b54f8f1dc6 | ORPH
    or1k     |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/d5cc4f7a8b7492624f2de025222c8146c8eae9a1 |     
    arc      |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/3e0fee659dabd1a570d826ee9fd3065f3d2025d4 |     
    arc      |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/03bfefecae1f0685867efbeebba4bd422c881a05 |     
    arc      |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/d8d58c740472363dc1af42ac50a176933b92f31f |     
    or1k     |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/f2841c4c93311ec241e5f6b6dde4fb1b431365cf |     
   arceb     |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/46b3a77c92af2ad7b232964c0f57feed85b74f7c |     
    arc      |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/f2b091570c9b6c338677dae974cf42a6d018ead6 |     
    arc      |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/e686d47c7f6dcb288ee25d99499cb6f43f53e425 |     
    or1k     |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/14b85d6ad4cc346805bc71779aa7a0bc66e58081 |     
   arceb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/a53d83176f591cc3a1a2311ddcbd2ab2cffffbe0 |     
   arceb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/48a4afa7913e47815e4f63f8eecbc121ad0f1f24 |     
   arceb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/3f13e0a97c02dec3b5042df3f32efce78681a1cc |     
    arc      |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/b246de3b2e0fb12041a3bd791b7c7926702b65e5 |     
   arceb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/94251b9d1b7c26a49c007691878af1df83082325 |     
   arceb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/c373ba095cc063dd33131e4c36d776a6062f3576 |     
   mipsel    |         libglvnd-1.4.0         | NOK | http://autobuild.buildroot.net/results/a03ec755f194252353319af1714f1c653eab9d7b | ORPH
  riscv32    |       libgphoto2-2.5.27        | NOK | http://autobuild.buildroot.net/results/d31bb05e72537e19438e9b53d011b1521f48912d | ORPH
    or1k     |          libnfc-1.8.0          | NOK | http://autobuild.buildroot.net/results/9978a1bdf8b6c8579638348bb443d22a091651ee |     
   xtensa    |         liboauth-1.0.3         | NOK | http://autobuild.buildroot.net/results/bdb4409df2af413d48b9a0b8a5aca1168d176350 | ORPH
 microblaze  |        libopenssl-3.3.0        | NOK | http://autobuild.buildroot.net/results/0aeaf1d4b77305ead59a8af47702d9bbc2ab98de | ORPH
microblazeel |        libopenssl-3.3.0        | NOK | http://autobuild.buildroot.net/results/c8c78c4f044fc38f0d47e1540e90384b9d4cdfa0 | ORPH
  riscv32    |        libopenssl-3.3.0        | NOK | http://autobuild.buildroot.net/results/b1601bdb62c4dc1332144c15c4cf9b855eddb034 | ORPH
  riscv32    |        libopenssl-3.3.0        | NOK | http://autobuild.buildroot.net/results/ee691bc46e537324373f1847e680abad78dd33a2 | ORPH
    or1k     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/6cb2e419768d2931f2b76b0dae2d5f57fda808c2 | ORPH
  mips64el   |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/e87846caa8c20deb6c34fad09cc8849fced08f48 | ORPH
microblazeel |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/b479c930db7a1c7168fb382f4094c4d26ff435d1 | ORPH
    or1k     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/ef4a542dbd1dea5da70baaeb307eb25ee85bf328 | ORPH
   mips64    |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/e72d7c1597047d1d7895a0c3b3aa1240290c3195 | ORPH
 powerpc64   |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/b17e2f8a5fb0bb19203d8ed33410153a0e70b6c3 | ORPH
microblazeel |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/87c2efeeda48f329505f5619597254bac668c5fd | ORPH
   sparc     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/d39b5f50316e32ee8214b5de6e17844ba3bd5642 | ORPH
 powerpc64   |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/c50cc25cd06763e7561b6063e63a0d03ef41f1e0 | ORPH
    sh4a     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/834117e88cf58cb4c66a2e65ed8bf5588fd2549c | ORPH
   arceb     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/3087202597b87232b5b6a5738ef84bd15ef6cdf8 | ORPH
   s390x     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/8308b9c372f867f30b06891e69d63551677398dc | ORPH
   mips64    |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/18ee12b87f0620bc955bf952348d4a01d7acea6a | ORPH
    or1k     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/43711b7ac70d443fbe5e1e5e51631489cbb6a2e4 | ORPH
    sh4a     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/473b75cb36b0a6bcceb9dfd58b9206a6da194450 | ORPH
   xtensa    |          libsepol-3.6          | NOK | http://autobuild.buildroot.net/results/b522d38465c01c71d871e6ef74b6412311d712e4 |     
   xtensa    |          libsepol-3.6          | NOK | http://autobuild.buildroot.net/results/342551493a7438b58a7a908d7727f77ca251405b |     
   xtensa    |          libsepol-3.6          | NOK | http://autobuild.buildroot.net/results/6830e46af63ed9cecdd513556881811398d20390 |     
   xtensa    |          libsepol-3.6          | NOK | http://autobuild.buildroot.net/results/8d97a20759d6ca83f8c60ef1e57d6cbe6bbc31fd |     
  mips64el   |        libunwind-1.8.1         | NOK | http://autobuild.buildroot.net/results/1a27bf853acc021528667eb178627ccebde59695 | ORPH
 microblaze  |         libv4l-1.24.1          | NOK | http://autobuild.buildroot.net/results/1e2bc6c3dc50aaa13afc3e723292f3937f13fe58 |     
powerpc64le  |      libzenoh-c-0.11.0.2       | NOK | http://autobuild.buildroot.net/results/680f25769526e5eef43d254a10a525b165846c75 |     
   mips64    |     libzenoh-pico-0.11.0.1     | NOK | http://autobuild.buildroot.net/results/31ed69cb2ffe8e9bc13a27c3fda16c27e9855b56 |     
   sparc     |        lighttpd-1.4.76         | NOK | http://autobuild.buildroot.net/results/9c71301659b1f20cd4fc62876ccdf5d568a65eea | ORPH
  mips64el   |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/f8887d454c42cd076af7814b1ad6ed76f4d9ad5a | ORPH
   arceb     |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/b0cce1f9c1a186358263140d4d42c8ef88b115d0 | ORPH
    m68k     |          linux-6.8.12          | NOK | http://autobuild.buildroot.net/results/605f80785304b8df012e1c629a8e0627d585f1de | ORPH
microblazeel |          linux-6.8.12          | NOK | http://autobuild.buildroot.net/results/82325e14652736a4ada4ca01fb78dc5183f578bd | ORPH
    arc      |          linux-6.8.12          | NOK | http://autobuild.buildroot.net/results/41a0b69424e42a925e28ad5379de8d983138af80 | ORPH
    mips     |          linux-6.8.12          | NOK | http://autobuild.buildroot.net/results/af3868891fe952c696b0c77029b9bafc5ab34c0e | ORPH
    mips     |          linux-6.8.12          | NOK | http://autobuild.buildroot.net/results/bde0827f1dc97ff3c6719506fc7c24b12aee2717 | ORPH
   mips64    |          linux-6.8.12          | NOK | http://autobuild.buildroot.net/results/c7941446358c02accc6f9dd348f920d81fc0a78b | ORPH
    arm      |          linux-6.8.12          | NOK | http://autobuild.buildroot.net/results/4ca54154ac53d436b01fcdbcfad575618b61b0ef | ORPH
   x86_64    |          linux-6.8.12          | NOK | http://autobuild.buildroot.net/results/f53b7aacb04fd5b1aa0154f597c528de2fc24323 | ORPH
 aarch64_be  |          linux-6.8.12          | NOK | http://autobuild.buildroot.net/results/92ee7c2620441b44fd625039fab5134ea9305ca3 | ORPH
   sh4aeb    |          linux-6.8.12          | NOK | http://autobuild.buildroot.net/results/f5c247fb5916bd58dcb76dd3a4535c29e778db85 | ORPH
    arc      |          linux-6.8.12          | NOK | http://autobuild.buildroot.net/results/7478a265e69d4dd97e588d739a18097240cc82b9 | ORPH
microblazeel |          linux-tools           | NOK | http://autobuild.buildroot.net/results/5b569acc8e42512cf9736acc88a842d9cada0264 | ORPH
   arceb     |          linux-tools           | NOK | http://autobuild.buildroot.net/results/2ed23662069316e83ece8ae3b866e264c9ffa3c4 | ORPH
   x86_64    | ltrace-82c66409c7a93ca6ad2e... | NOK | http://autobuild.buildroot.net/results/0544533ea456bdf427912e0b99bf6ee5a10a6e69 | ORPH
    mips     | ltrace-82c66409c7a93ca6ad2e... | NOK | http://autobuild.buildroot.net/results/85ec01cae6b8c73906dcc9b9570b510f20b920de | ORPH
   sparc     |        mariadb-10.11.6         | NOK | http://autobuild.buildroot.net/results/23e22de976d79c20adb18df369cb66443c9698e0 | ORPH
    arm      |      mediastreamer-4.4.8       | NOK | http://autobuild.buildroot.net/results/fd1ab93e478593f1f1063c6c9ed7bfb25ec7bca8 | ORPH
   x86_64    |         memtest86-6.20         | NOK | http://autobuild.buildroot.net/results/bd4ff0f8d3307cb1bfb7d6b30d576f311f42c001 |     
  riscv64    |      moby-buildkit-0.11.6      | NOK | http://autobuild.buildroot.net/results/f47c5ec5697fc961ed717ee4096e86fbe656b42a |     
  aarch64    |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/edd1e2c26a36f60157b84bc394a523bf5b78f25d |     
    arm      |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/ecc616157069f141d07ee441df899cdf55663261 |     
    arm      |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/23748b931ac2afd5f97eed4fa6698b7d7d1c8b63 |     
    or1k     |        mosquitto-2.0.18        | NOK | http://autobuild.buildroot.net/results/b7cb1a3fb1eee2ef68b8760b9749655591ec5845 |     
    mips     |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/66ef0e6bc8767635669821cdb9cb91cc44c1f7cc |     
    m68k     |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/e817ce5c41a58eb67a00e33f5854d333d14309c6 |     
   nios2     |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/b0706c31902d16799dadfee2d4323d8ea50ee44e |     
   mips64    |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/a1e22fb50f7687a2769196e79ace7d97cfa5ecaf |     
   sparc     |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/5724b4b86903b0ce99ed8f066acf8dfff3b1a6f1 |     
  mips64el   |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/0e280e0780326bcbc267778b8080e35b3ea41f51 |     
 powerpc64   |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/3708ca4cac219bde2d3acaed9e6e79c09aa6cfc9 |     
   sparc     |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/95b6c79feb4a5c2d18272680388b408734774751 |     
  sparc64    |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/6ab451157db4376cf7a0bcc59bef542aa5538e19 |     
    arm      |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/014899a46a9878d95768de4c6cac6a7759e96e2c |     
   mips64    |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/8eca96e76a72157efa4c6ec825fef9580907adfe |     
 powerpc64   |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/d5ff6893db094b91f806067a0278776f82ba6be3 |     
 powerpc64   |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/4601372b99cff5e76f1e45146f639e646c41887d |     
  powerpc    |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/6f047c5c76585d1e9c0db970d66930d6ef44500d |     
 aarch64_be  |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/f3073d2de2bb897771e1634f65f9c360abc563d3 |     
   xtensa    |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/abdc1a85700d6db24e86200a57f96666b167eb61 |     
 aarch64_be  |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/530252925ebf40dac5c39bb6ed1f2694dbffd80d |     
 powerpc64   |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/1c358fdb22773e163addad599f679448fe5e42a3 |     
   nios2     |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/8ac895a29bb09778bb566d8acf3111bd574e5936 |     
    m68k     |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/c7fbf0d7ed967e5f065eb3dd5bed292cf88f4cc6 |     
    or1k     |           mtd-2.1.6            | NOK | http://autobuild.buildroot.net/results/3a38b7329bb364abd0f552af9dfa59f7999cc5ee |     
    i686     |           ncmpc-0.49           | NOK | http://autobuild.buildroot.net/results/71bc174d9d459e2a9c4c6cd338a055c8441c8590 |     
   sparc     |          nginx-1.24.0          | NOK | http://autobuild.buildroot.net/results/fcd218e2b8ff6ec8c4551d83ee10c37d668e9930 |     
  mips64el   |          ntp-4.2.8p17          | NOK | http://autobuild.buildroot.net/results/9524899a33015a4185a934efc30791ad40e4f3f1 |     
   armeb     |          ntp-4.2.8p17          | NOK | http://autobuild.buildroot.net/results/9d1dc3e2ed4530f19765ae7605ba42e1bddb90a8 |     
   sparc     |          ntp-4.2.8p17          | NOK | http://autobuild.buildroot.net/results/06465b976b119b6a9939bfa2346d0247ad01637e |     
    mips     |         openal-1.22.0          | NOK | http://autobuild.buildroot.net/results/7a78f12cccd2525e96df99fb0ec51d74eca2cab5 | ORPH
  mips64el   |        openblas-0.3.27         | NOK | http://autobuild.buildroot.net/results/fa6569af2ac72acd126334fc6f503e62be829e45 |     
  mips64el   |        openblas-0.3.27         | NOK | http://autobuild.buildroot.net/results/5e1431cfa434b3fcaacbf8e96fc56ab7df0734e0 |     
   x86_64    |         opencv3-3.4.19         | NOK | http://autobuild.buildroot.net/results/9603549e1f8f67e87a22b3cb7995fea1acef74c0 |     
 powerpc64   |         openssh-9.7p1          | NOK | http://autobuild.buildroot.net/results/b699f7f21e008329712996f54965e64392fd1314 | ORPH
  mips64el   |         openswan-3.0.0         | NOK | http://autobuild.buildroot.net/results/cad248d08e89a8fc5b46d729eea2744d5302d3f6 | ORPH
   sh4eb     |           php-8.3.7            | NOK | http://autobuild.buildroot.net/results/86c9354fa50873df668bd90b69991cfbc297364f |     
  sparc64    | pppd-e1266c76d1ad39f98f1167... | NOK | http://autobuild.buildroot.net/results/182c791655da75cf29766965d130404c1c929e80 |     
   sparc     | pppd-e1266c76d1ad39f98f1167... | NOK | http://autobuild.buildroot.net/results/7e6e07104420eae4d8572cf8b22e7d5e0cfb82f1 |     
  sparc64    | pppd-e1266c76d1ad39f98f1167... | NOK | http://autobuild.buildroot.net/results/124fabc3efaa00a2bb4129600035700882f18339 |     
    mips     |      python-grpcio-1.60.0      | NOK | http://autobuild.buildroot.net/results/ee7f1cd021d6f7ef0a120d0887196e24d43a0491 |     
    sh4      |     python-remi-2022.7.27      | NOK | http://autobuild.buildroot.net/results/8a6e68ba5e1cf90238f416fb4dcfc7f699a73175 |     
    or1k     |     python-remi-2022.7.27      | NOK | http://autobuild.buildroot.net/results/935c5f1a61fe6d9b427868de77295200a062b439 |     
 aarch64_be  |     python-remi-2022.7.27      | NOK | http://autobuild.buildroot.net/results/bd0e72bd007ab105563295dd046151799365a507 |     
 powerpc64   |     python-remi-2022.7.27      | NOK | http://autobuild.buildroot.net/results/8697a526b68146a6b86ea5b7e00df4a2ca177cf5 |     
  powerpc    |      python-rtoml-0.10.0       | NOK | http://autobuild.buildroot.net/results/3b9a22d946c5133a58d9b385b6e5647f5a322c38 |     
  sparc64    |       python-scapy-2.5.0       | NOK | http://autobuild.buildroot.net/results/7ec66bdb39b09bbe527bf3cba9d11bd27b557330 |     
    arc      |         python3-3.11.8         | NOK | http://autobuild.buildroot.net/results/9f67703ccbed761d21f2dca5aa87700331e359bd |     
   x86_64    |       qbee-agent-2024.09       | NOK | http://autobuild.buildroot.net/results/814c4fefa7aa7de4e23d95baae88b4bd3352992e |     
    m68k     |         rrdtool-1.8.0          | NOK | http://autobuild.buildroot.net/results/cababdcdf66517d4e4aab502beb12fa7fb298756 |     
  sparc64    |         rrdtool-1.8.0          | NOK | http://autobuild.buildroot.net/results/ff8e1850143a0833a3a33aeadbd889c9019a4781 |     
  powerpc    |        skalibs-2.12.0.1        | NOK | http://autobuild.buildroot.net/results/b24b0369558c407080ccf803b2e42731dac8bd4a |     
   sparc     |       sofia-sip-1.13.17        | NOK | http://autobuild.buildroot.net/results/ed32d2ebe47ead4a0edc2b7ff516c0290b9bd0af |     
    m68k     | squeezelite-71c012ad9ba102f... | NOK | http://autobuild.buildroot.net/results/dfd38d375b3db4110fb7bc64e7f52f06eba8819e |     
    arm      |       stress-ng-0.17.07        | NOK | http://autobuild.buildroot.net/results/cf67494c02ce834095bf9680d5787840459dbe74 |     
  sparc64    |       strongswan-5.9.13        | NOK | http://autobuild.buildroot.net/results/b2ab026ff87ced2446045f968738b599df7cca7e |     
   mipsel    |        syslog-ng-4.7.1         | NOK | http://autobuild.buildroot.net/results/0c208065c67a84a9b7551ade0323ff49d6b2db0b |     
 powerpc64   |          trinity-1.9           | NOK | http://autobuild.buildroot.net/results/16853865cce0ef536bbd909d6291f2aa746f0f38 | ORPH
   x86_64    |          trinity-1.9           | NOK | http://autobuild.buildroot.net/results/e0b717631e3a3f111b7d6f074896ee7fa944c269 | ORPH
powerpc64le  |          trinity-1.9           | NOK | http://autobuild.buildroot.net/results/10344af7fa30cb763b3c32043e45120f7daebb2b | ORPH
   mipsel    |          trinity-1.9           | NOK | http://autobuild.buildroot.net/results/1d893281a0ee6e84ceb0e17c7f36292808fe0188 | ORPH
 aarch64_be  |         uclibc-1.0.48          | NOK | http://autobuild.buildroot.net/results/f77deecfc9df5d67c321bb6ab39108b7a188d161 |     
   arceb     |         uclibc-1.0.48          | NOK | http://autobuild.buildroot.net/results/534e19338a1d6c65a661955a18ab050189f98f52 |     
   arceb     |         uclibc-1.0.48          | NOK | http://autobuild.buildroot.net/results/30111f6557ea54f0b6749552c1f09c1f5a9e7735 |     
   arceb     |         uclibc-1.0.48          | NOK | http://autobuild.buildroot.net/results/e8f20b718b626d053fd3b6b69042126df02c7d32 |     
   arceb     |         uclibc-1.0.48          | NOK | http://autobuild.buildroot.net/results/bef92393ed7cca30d774aa6479799ee02884be97 |     
    or1k     |         uclibc-1.0.48          | NOK | http://autobuild.buildroot.net/results/2c9946760bb0f878f4884204f87ba0231e570887 |     
    arm      |         uclibc-1.0.48          | NOK | http://autobuild.buildroot.net/results/917d6c48eba2acc8b5618f17a7af3da3948e2515 |     
   sparc     |         uclibc-1.0.48          | NOK | http://autobuild.buildroot.net/results/c9e0503fa25becb90e9b64f8ce37c8cf522abff3 |     
   arceb     |         uclibc-1.0.48          | NOK | http://autobuild.buildroot.net/results/8affd3199e880660c9d71e23862573dca74c724f |     
    arc      |         uclibc-1.0.48          | NOK | http://autobuild.buildroot.net/results/ba28c14e568145540bd44736a147d163d9b3cacc |     
   sparc     |        unixodbc-2.3.12         | NOK | http://autobuild.buildroot.net/results/6944f3c3e9a30759f3806d870819cf904d2dcbbb |     
   arceb     |            unknown             | NOK | http://autobuild.buildroot.net/results/b3d4d05cc1913fea7790ddf2bb86cb4ed9e702e6 |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.net/results/dab13246ef508df7e4fbca8b1934252aba43cdd2 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/0f97126dead0c5c0ca073841c36ae1fbb8fd6414 |     
   sparc     |            unknown             | NOK | http://autobuild.buildroot.net/results/11ea41d3eb0211985e9f46340187a8347776c656 |     
    sh4      |            unknown             | NOK | http://autobuild.buildroot.net/results/66a8144d410ec081acbec8c85337de7fdf0a4953 |     
    mips     |         ustreamer-6.11         | NOK | http://autobuild.buildroot.net/results/b215c7912bdd3308262c129b953acf11e8d28f75 |     
 aarch64_be  |         ustreamer-6.11         | NOK | http://autobuild.buildroot.net/results/4775b1252d9935fa944c0faa2b6a1b00ce54cca6 |     
    arm      |       util-linux-2.39.3        | NOK | http://autobuild.buildroot.net/results/23bd2ceccae7e8e6cf8282e21ca44e9a25f0ccb7 | ORPH
  mips64el   |       util-linux-2.39.3        | NOK | http://autobuild.buildroot.net/results/afe44161a5f9502a245e5189a607c9fa3e36d4d4 | ORPH
    arc      |       util-linux-2.39.3        | NOK | http://autobuild.buildroot.net/results/50e5b075abdaa242871b2d0f08a24addb0c36070 | ORPH
  powerpc    |           vlc-3.0.20           | NOK | http://autobuild.buildroot.net/results/69e0f343dfb70acc8ea2f7811b6b93e5529ceb47 |     
    arm      |         wavemon-0.9.5          | NOK | http://autobuild.buildroot.net/results/a6aa0a4320ea0d5c63023a10d6c5514997c51ceb | ORPH
   mips64    |         wolfssl-5.7.0          | NOK | http://autobuild.buildroot.net/results/b7cac42a850f642f1863f26e6e0de690cf04b119 |     
   nios2     |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/99d8b22233d0bb1c78365b68c43e314b183741fe |     
    i686     |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/8802333fbf46cee2aa7d39dd007d6e66e2224dbb |     
    m68k     |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/e0ef17d5a284c784a2d2771713d1693a898908f8 |     
    arm      |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/434233f79d322a7396307c189ced4c7aacd81fe4 |     
powerpc64le  |         zlib-ng-2.1.6          | NOK | http://autobuild.buildroot.net/results/bacf0c1cd4c408802f7f1125efdffae23369e035 | ORPH


Classification of failures by reason for 2024.02.x
--------------------------------------------------

        host-sentry-cli-2.20.3 | 3 
          libcamera-apps-1.2.1 | 3 
host-heimdal-f4faaeaba371ff... | 2 
              libopenssl-3.2.1 | 2 
                    fcft-3.1.6 | 1 
               libglib2-2.76.1 | 1 
               libgtk3-3.24.41 | 1 
                    ola-0.10.9 | 1 
pppd-e1266c76d1ad39f98f1167... | 1 
             util-linux-2.39.3 | 1 
                 wolfssl-5.7.0 | 1 
                xenomai-3.0.10 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   nios2     |           fcft-3.1.6           | NOK | http://autobuild.buildroot.net/results/1f403be35ace8d5448b63d0ef91b17d776b98b74 |     
   s390x     | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/02a6616e31e605a194e4258d30ef7294e88deef6 | ORPH
microblazeel | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/aafccbb9930ab73839e2f40ff76974aeb0928c2f | ORPH
    arc      |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/99dcaf8ee88e839d69634cfba2c176724dac5204 |     
    arm      |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/f9746883bb6df3cab450ced9adf745dba8cda956 |     
  riscv32    |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/dd653c0c250c8dcfec4606413c562e80005da1eb |     
  aarch64    |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/ca2339ae063bedaafef0e574267baf159c1f1fee |     
  riscv64    |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/e0985b208a10b7babdb83914db4983e2518a2bef |     
  riscv64    |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/d9a4652b85cedb4c6ba585943a23759df8b29e92 |     
    arc      |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/cac99266501ac8e53df1ca31bbc26562c402fe20 |     
    i686     |        libgtk3-3.24.41         | NOK | http://autobuild.buildroot.net/results/897d49e1673dfc589c7c9f729e50e4d7f235d12e |     
    arm      |        libopenssl-3.2.1        | NOK | http://autobuild.buildroot.net/results/0648bae0518ee9de8149c0ffac907ed744d7668b | ORPH
    arm      |        libopenssl-3.2.1        | NOK | http://autobuild.buildroot.net/results/87e82cffa2d88daecc39d483cc973b9ed638e48e | ORPH
   sparc     |           ola-0.10.9           | NOK | http://autobuild.buildroot.net/results/3371c77dbb312e1d6c97322b786156f2d72ea8ee |     
   sparc     | pppd-e1266c76d1ad39f98f1167... | NOK | http://autobuild.buildroot.net/results/619382ff7d3bbdda70e1783455f4cde7603b39c1 |     
  powerpc    |       util-linux-2.39.3        | NOK | http://autobuild.buildroot.net/results/9e4bc3886e9b2a6b94441ee031e5bb82db403f5a | ORPH
  mips64el   |         wolfssl-5.7.0          | NOK | http://autobuild.buildroot.net/results/929251a306af94195b377cc000a62a6129bfcf15 |     
   s390x     |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/02ffa381c8316f4739658b22c65de5e5d1b8fc76 |     


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
                 android-tools |  GUESS   | https://release-monitoring.org/project/13989 | 4.2.2+git... | 14.0.0_r45   |     
                     angularjs |  DISTRO  | https://release-monitoring.org/project/21321 | 1.8.2        | 1.8.3        |     
                      apitrace |  DISTRO  | https://release-monitoring.org/project/06170 | 10.0         | 11.1         |     
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
                     bctoolbox |  DISTRO  | https://release-monitoring.org/project/14746 | 4.4.8        | 5.3.54       | ORPH
                         bdwgc |  DISTRO  | https://release-monitoring.org/project/17108 | 8.2.4        | 8.2.6        |     
                     belle-sip |  DISTRO  | https://release-monitoring.org/project/14378 | 4.4.8        | 5.3.54       |     
                          belr |  DISTRO  | https://release-monitoring.org/project/80042 | 4.4.8        | 5.3.54       |     
                    berkeleydb |  GUESS   | https://release-monitoring.org/project/138386 | 5.3.28       | 18.1.8       | ORPH
                      binutils |  DISTRO  | https://release-monitoring.org/project/07981 | 2.41         | 2.42         |     
                          bird |  DISTRO  | https://release-monitoring.org/project/00192 | 2.0.12       | 2.15.1       |     
                       bitcoin |  DISTRO  | https://release-monitoring.org/project/13618 | 26.0         | 27.0         |     
                    bluez-alsa |  DISTRO  | https://release-monitoring.org/project/21324 | 4.1.1        | 4.2.0        | ORPH
                  bluez5_utils |  DISTRO  | https://release-monitoring.org/project/10029 | 5.75         | 5.76         |     
          bluez5_utils-headers |  DISTRO  | https://release-monitoring.org/project/10029 | 5.75         | 5.76         |     
                        bonnie |  DISTRO  | https://release-monitoring.org/project/00212 | 1.03e        | 2.00a        | ORPH
                         boost |  DISTRO  | https://release-monitoring.org/project/06845 | 1.83.0       | 1.85.0       |     
                     bootstrap |  DISTRO  | https://release-monitoring.org/project/21578 | 4.3.1        | 5.3.3        |     
                         botan |  DISTRO  | https://release-monitoring.org/project/00214 | 3.3.0        | 3.4.0        | ORPH
                       bpftool |  DISTRO  | https://release-monitoring.org/project/328454 | v7.1.0       | 7.4.0        |     
                      bpftrace |  DISTRO  | https://release-monitoring.org/project/141354 | 0.19.1       | 0.20.4       |     
                   btrfs-progs |  DISTRO  | https://release-monitoring.org/project/00227 | 5.16.2       | 6.8.1        | ORPH
                        c-ares |  DISTRO  | https://release-monitoring.org/project/05840 | 1.27.0       | 1.29.0       | ORPH
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
                      checksec |  DISTRO  | https://release-monitoring.org/project/17677 | 2.6.0        | 2.7.1        | ORPH
                        chrony |  DISTRO  | https://release-monitoring.org/project/08810 | 4.4          | 4.5          | ORPH
                    cifs-utils |  DISTRO  | https://release-monitoring.org/project/00287 | 6.15         | 7.0          |     
                        circus |  DISTRO  | https://release-monitoring.org/project/21726 | 0.16.1       | 0.18.0       |     
                        clamav |  DISTRO  | https://release-monitoring.org/project/00291 | 1.0.6        | 1.3.1        |     
                         clang |  DISTRO  | https://release-monitoring.org/project/11811 | 15.0.3       | 18.1.6       |     
                         cli11 |  DISTRO  | https://release-monitoring.org/project/20578 | 2.3.2        | 2.4.2        |     
                        clinfo |  DISTRO  | https://release-monitoring.org/project/10503 | 3.0.21.02.21 | 3.0.23.01.25 |     
                         cloop |  DISTRO  | https://release-monitoring.org/project/21332 | 3.14.1.3     | 3.14.1.3+... |     
                         cmake |  DISTRO  | https://release-monitoring.org/project/00306 | 3.28.3       | 3.29.3       |     
                   cni-plugins |  DISTRO  | https://release-monitoring.org/project/96794 | 1.3.0        | 1.5.0        |     
                      collectl |  DISTRO  | https://release-monitoring.org/project/00330 | 4.3.2        | 4.3.8        |     
                 comix-cursors |  DISTRO  | https://release-monitoring.org/project/21882 | 0.9.1        | 0.10.0       | ORPH
                   compiler-rt |  DISTRO  | https://release-monitoring.org/project/17705 | 15.0.3       | 18.1.6       |     
                      composer |  DISTRO  | https://release-monitoring.org/project/09710 | 2.5.8        | 2.7.6        |     
                        conmon |  DISTRO  | https://release-monitoring.org/project/96793 | 2.1.8        | 2.1.12       |     
               conntrack-tools |  DISTRO  | https://release-monitoring.org/project/00338 | 1.4.7        | 1.4.8        | ORPH
                    containerd |  DISTRO  | https://release-monitoring.org/project/16460 | 1.7.14       | 1.7.17       |     
                     coreutils |  DISTRO  | https://release-monitoring.org/project/00343 | 9.3          | 9.5          | ORPH
                       crudini |  DISTRO  | https://release-monitoring.org/project/21669 | 0.9.3        | 0.9.5        |     
                          crun |  DISTRO  | https://release-monitoring.org/project/96792 | 1.12         | 1.15         |     
                    cryptsetup |  DISTRO  | https://release-monitoring.org/project/13709 | 2.7.1        | 2.7.2        |     
                       cukinia |  DISTRO  | https://release-monitoring.org/project/138119 | 0.6.0        | 0.7.0        | ORPH
                          cups |  DISTRO  | https://release-monitoring.org/project/00380 | 2.4.7        | 2.4.8        |     
                  cups-filters |  DISTRO  | https://release-monitoring.org/project/05541 | 1.28.17      | 2.0.0        |     
                      cutelyst |  DISTRO  | https://release-monitoring.org/project/21335 | 2.11.0       | 4.3.0        |     
                        dacapo |  DISTRO  | https://release-monitoring.org/project/20546 | 9.12-MR1-... | 2006-10-MR2  |     
                          dado |  DISTRO  | https://release-monitoring.org/project/58442 | 1.8.3-1      | 2.2.0-1      |     
                          daq3 |  DISTRO  | https://release-monitoring.org/project/212345 | 3.0.9        | 3.0.14       |     
                     darkhttpd |  DISTRO  | https://release-monitoring.org/project/00391 | 1.15         | 1.16         |     
                    datatables |  DISTRO  | https://release-monitoring.org/project/141588 | 1.10.20      | 1.13.4       | ORPH
            datatables-buttons |  DISTRO  | https://release-monitoring.org/project/141589 | 1.6.1        | 2.3.6        | ORPH
       datatables-fixedcolumns |  DISTRO  | https://release-monitoring.org/project/141590 | 3.3.0        | 4.2.2        | ORPH
         datatables-responsive |  DISTRO  | https://release-monitoring.org/project/141591 | 2.2.3        | 2.4.1        | ORPH
                         dav1d |  DISTRO  | https://release-monitoring.org/project/18920 | 1.4.1        | 1.4.2        |     
                   dbus-broker |  DISTRO  | https://release-monitoring.org/project/271475 | 33           | 36           |     
                      dbus-cxx |  DISTRO  | https://release-monitoring.org/project/242464 | 2.4.0        | 2.5.1        |     
                   dbus-python |  DISTRO  | https://release-monitoring.org/project/00402 | 1.2.18       | 1.3.2        | ORPH
                         dc3dd |  DISTRO  | https://release-monitoring.org/project/15086 | 7.2.641      | 7.3.1        | ORPH
                   debianutils |  DISTRO  | https://release-monitoring.org/project/21341 | 4.11         | 5.17         | ORPH
            desktop-file-utils |  DISTRO  | https://release-monitoring.org/project/00421 | 0.26         | 0.27         | ORPH
                      dhcpdump |  DISTRO  | https://release-monitoring.org/project/21415 | 1.8          | 1.9          | ORPH
                        dialog |  DISTRO  | https://release-monitoring.org/project/00431 | 1.3-20220117 | 1.3-20230209 | ORPH
                         dillo |  DISTRO  | https://release-monitoring.org/project/00438 | 3.0.5        | 3.1.0        | ORPH
                     dmidecode |  DISTRO  | https://release-monitoring.org/project/00443 | 3.5          | 3.6          |     
                    docker-cli |  DISTRO  | https://release-monitoring.org/project/21076 | 26.0.2       | 26.1.3       |     
                docker-compose |  DISTRO  | https://release-monitoring.org/project/06185 | 2.27.0       | 2.27.1       |     
                 docker-engine |  DISTRO  | https://release-monitoring.org/project/00447 | 26.0.2       | 26.1.3       |     
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
                       enchant |  DISTRO  | https://release-monitoring.org/project/06601 | 2.3.3        | 2.8.0        |     
                          enet |  DISTRO  | https://release-monitoring.org/project/00696 | 1.3.17       | 1.3.18       |     
                 enlightenment |  DISTRO  | https://release-monitoring.org/project/00698 | 0.25.4       | 0.26.0       |     
                        erlang |  DISTRO  | https://release-monitoring.org/project/00707 | 26.0.2       | 27.0         |     
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
                      execline |  DISTRO  | https://release-monitoring.org/project/05482 | 2.9.0.1      | 2.9.5.1      |     
                        exempi |  DISTRO  | https://release-monitoring.org/project/00767 | 2.6.3        | 2.6.5        |     
                    exfatprogs |  DISTRO  | https://release-monitoring.org/project/94441 | 1.2.2        | 1.2.3        |     
                         exiv2 |  DISTRO  | https://release-monitoring.org/project/00769 | 0.27.6       | 0.28.2       |     
                           eza |  DISTRO  | https://release-monitoring.org/project/369474 | 0.18.8       | 0.18.16      |     
                      fail2ban |  DISTRO  | https://release-monitoring.org/project/06602 | 1.0.2        | 1.1.0        |     
                          fcft |  DISTRO  | https://release-monitoring.org/project/143240 | 3.1.6        | 3.1.8        |     
                           feh |  DISTRO  | https://release-monitoring.org/project/00790 | 3.7.1        | 3.10.2       |     
                        ffmpeg |  DISTRO  | https://release-monitoring.org/project/05405 | 6.1.1        | 7.0.1        |     
                     findutils |  DISTRO  | https://release-monitoring.org/project/00812 | 4.9.0        | 4.10.0       | ORPH
                           fio |  DISTRO  | https://release-monitoring.org/project/00806 | 3.34         | 3.37         |     
                     firewalld |  DISTRO  | https://release-monitoring.org/project/09989 | 2.0.2        | 2.1.2        | ORPH
                       flannel |  DISTRO  | https://release-monitoring.org/project/07421 | 0.25.2       | 0.25.3       |     
                   flatbuffers |  DISTRO  | https://release-monitoring.org/project/16642 | 23.5.26      | 24.3.25      |     
                          flot |  DISTRO  | https://release-monitoring.org/project/07184 | 0.8.3        | 4.2.6        | ORPH
                          fltk |  DISTRO  | https://release-monitoring.org/project/00823 | 1.3.7        | 1.3.9        | ORPH
                    fluent-bit |  DISTRO  | https://release-monitoring.org/project/267335 | 3.0.3        | 3.0.6        |     
                           fmc |  GUESS   | https://release-monitoring.org/project/145761 | LSDK-21.08   | 0.2.0        | ORPH
                       fmtools |  DISTRO  | https://release-monitoring.org/project/21435 | 2.0.7        | 2.0.8        | ORPH
                  font-awesome |  DISTRO  | https://release-monitoring.org/project/00826 | 4.7.0        | 6.5.2        | ORPH
                    fontconfig |  DISTRO  | https://release-monitoring.org/project/00827 | 2.14.2       | 2.15.0       | ORPH
                          foot |  DISTRO  | https://release-monitoring.org/project/141611 | 1.16.2       | 1.17.2       |     
                         fping |  DISTRO  | https://release-monitoring.org/project/00834 | 5.1          | 5.2          |     
             freeradius-server |  DISTRO  | https://release-monitoring.org/project/00853 | 3.2.3        | 3.2.4        |     
                       freerdp |  DISTRO  | https://release-monitoring.org/project/10442 | 2.11.6       | 3.5.1        |     
                           frr |  DISTRO  | https://release-monitoring.org/project/18555 | 8.5.4        | 10.0         |     
                    fscryptctl |  DISTRO  | https://release-monitoring.org/project/270981 | 1.0.0        | 1.2.0        |     
                          fwup |  DISTRO  | https://release-monitoring.org/project/21438 | 1.9.1        | 1.10.2       |     
                           gcr |  DISTRO  | https://release-monitoring.org/project/11801 | 3.40.0       | 4.3.0        | ORPH
                          gdal |  DISTRO  | https://release-monitoring.org/project/00881 | 3.8.2        | 3.9.0        |     
                    gdk-pixbuf |  DISTRO  | https://release-monitoring.org/project/09533 | 2.42.10      | 2.42.12      | ORPH
                        gensio |  DISTRO  | https://release-monitoring.org/project/67634 | 2.5.5        | 2.8.5        |     
                       gerbera |  DISTRO  | https://release-monitoring.org/project/18420 | 1.12.1       | 2.1.0        |     
                   gettext-gnu |  DISTRO  | https://release-monitoring.org/project/00898 | 0.22.4       | 0.22.5       | ORPH
                   ghostscript |  DISTRO  | https://release-monitoring.org/project/01157 | 10.02.1      | 10.03.1      |     
                           git |  DISTRO  | https://release-monitoring.org/project/05350 | 2.45.1       | 2.45.2       |     
                 gitlab-runner |  DISTRO  | https://release-monitoring.org/project/11337 | 15.5.0       | 17.0.0       |     
               glib-networking |  DISTRO  | https://release-monitoring.org/project/21353 | 2.76.0       | 2.80.0       | ORPH
                        glibmm |  DISTRO  | https://release-monitoring.org/project/07960 | 2.76.0       | 2.80.0       |     
                    glibmm2_66 |  DISTRO  | https://release-monitoring.org/project/369440 | 2.66.6       | 2.66.7       |     
                           glm |  DISTRO  | https://release-monitoring.org/project/01181 | 1.0.0        | 1.0.1        | ORPH
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
                          grpc |  DISTRO  | https://release-monitoring.org/project/19117 | 1.51.1       | 1.64.1       |     
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
             intel-mediadriver |  DISTRO  | https://release-monitoring.org/project/20341 | 24.2.2       | 24.2.4       |     
               intel-microcode |  DISTRO  | https://release-monitoring.org/project/20614 | 20231114     | 20240531     |     
                        iperf3 |  DISTRO  | https://release-monitoring.org/project/01389 | 3.16         | 3.17.1       | ORPH
                      iproute2 |  DISTRO  | https://release-monitoring.org/project/01392 | 6.8.0        | 6.9.0        |     
                         ipset |  DISTRO  | https://release-monitoring.org/project/01393 | 7.16         | 7.21         |     
                    irqbalance |  DISTRO  | https://release-monitoring.org/project/01402 | 1.9.3        | 1.9.4        |     
                         irssi |  DISTRO  | https://release-monitoring.org/project/01404 | 1.4.4        | 1.4.5        |     
                            iw |  DISTRO  | https://release-monitoring.org/project/01410 | 5.19         | 6.9          | ORPH
                         janet |  DISTRO  | https://release-monitoring.org/project/155612 | 1.33.0       | 1.34.0       |     
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
             jquery-validation |  DISTRO  | https://release-monitoring.org/project/21817 | 1.19.5       | 1.20.0       | ORPH
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
                kodi-pvr-waipu |  DISTRO  | https://release-monitoring.org/project/241529 | 21.6.1-Omega | 21.6.6-Omega |     
               kodi-pvr-zattoo |  DISTRO  | https://release-monitoring.org/project/100438 | 21.0.1-Omega | 21.0.2-Omega |     
            kodi-texturepacker |  DISTRO  | https://release-monitoring.org/project/05511 | 21.0-Omega   | 21.0         |     
                  kompexsqlite |  DISTRO  | https://release-monitoring.org/project/21462 | 1.12.15      | 1.13.15      | ORPH
                   ksmbd-tools |  DISTRO  | https://release-monitoring.org/project/241856 | 3.5.1        | 3.5.2        |     
                       kvazaar |  DISTRO  | https://release-monitoring.org/project/12418 | 2.2.0        | 2.3.1        |     
                        lapack |  DISTRO  | https://release-monitoring.org/project/01534 | 3.10.1       | 3.12.0       |     
                 libabseil-cpp |  DISTRO  | https://release-monitoring.org/project/115295 | 20230802.1   | 20240116.2   |     
                         libao |  DISTRO  | https://release-monitoring.org/project/07629 | 1.2.0        | 1.2.2        | ORPH
                        libass |  DISTRO  | https://release-monitoring.org/project/01560 | 0.17.1       | 0.17.2       |     
                        libbpf |  DISTRO  | https://release-monitoring.org/project/141355 | 1.1.0        | 1.4.2        |     
                        libbsd |  DISTRO  | https://release-monitoring.org/project/01567 | 0.11.7       | 0.12.2       |     
                   libbytesize |  DISTRO  | https://release-monitoring.org/project/07869 | 2.7          | 2.10         | ORPH
                     libcamera |  DISTRO  | https://release-monitoring.org/project/301902 | v0.2.0       | 0.3.0        |     
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
                    libfribidi |  DISTRO  | https://release-monitoring.org/project/00857 | 1.0.13       | 1.0.14       |     
                       libgit2 |  DISTRO  | https://release-monitoring.org/project/01627 | 1.8.0        | 1.8.1        |     
                      libglade |  DISTRO  | https://release-monitoring.org/project/01174 | 2.6.4        | 3.40.0       | ORPH
                       libglfw |  DISTRO  | https://release-monitoring.org/project/01180 | 3.3.8        | 3.4          |     
                      libglib2 |  DISTRO  | https://release-monitoring.org/project/10024 | 2.76.1       | 2.80.2       |     
                      libglvnd |  DISTRO  | https://release-monitoring.org/project/12098 | 1.4.0        | 1.7.0        | ORPH
                  libgpg-error |  DISTRO  | https://release-monitoring.org/project/01628 | 1.48         | 1.49         | ORPH
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
                        libjwt |  DISTRO  | https://release-monitoring.org/project/242868 | 1.17.0       | 1.17.1       |     
                         libks |  DISTRO  | https://release-monitoring.org/project/241898 | 2.0.2        | 2.0.5        |     
                     liblinear |  DISTRO  | https://release-monitoring.org/project/21363 | 2.45         | 2.47         |     
                         liblo |  DISTRO  | https://release-monitoring.org/project/21483 | 0.31         | 0.32         | ORPH
                     libmspack |  DISTRO  | https://release-monitoring.org/project/16827 | 0.10.1alpha  | 1.11         |     
                   libnetconf2 |  DISTRO  | https://release-monitoring.org/project/31639 | 2.1.28       | 3.0.17       |     
                       libnice |  DISTRO  | https://release-monitoring.org/project/01683 | 0.1.21       | 0.1.22       |     
                     libnpupnp |  DISTRO  | https://release-monitoring.org/project/75209 | 4.2.2        | 6.1.3        |     
                       libnvme |  DISTRO  | https://release-monitoring.org/project/242763 | 1.8          | 1.9          |     
                   libopenh264 |  DISTRO  | https://release-monitoring.org/project/21365 | 2.4.0        | 2.4.1        |     
                     libostree |  DISTRO  | https://release-monitoring.org/project/10899 | 2023.8       | 2024.6       |     
                       libpeas |  DISTRO  | https://release-monitoring.org/project/06871 | 1.32.0       | 2.0.2        | ORPH
                      libpjsip |  DISTRO  | https://release-monitoring.org/project/15701 | 2.14         | 2.14.1       |     
                      libplist |  DISTRO  | https://release-monitoring.org/project/11675 | 2.4.0        | 2.6.0        | ORPH
                       libpqxx |  DISTRO  | https://release-monitoring.org/project/21367 | 7.7.5        | 7.9.0        |     
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
               libspatialindex |  DISTRO  | https://release-monitoring.org/project/04864 | 1.9.3        | 2.0.0b3      |     
                       libspdm |  DISTRO  | https://release-monitoring.org/project/369161 | 3.2.0        | 3.3.0        |     
                       libtool |  DISTRO  | https://release-monitoring.org/project/01741 | 2.4.6        | 2.5.0        | ORPH
          libtorrent-rasterbar |  DISTRO  | https://release-monitoring.org/project/04166 | 1.2.19       | 2.0.10       |     
                        libucl |  DISTRO  | https://release-monitoring.org/project/21371 | 0.8.2        | 0.9.2        |     
                   libunibreak |  DISTRO  | https://release-monitoring.org/project/326564 | 5.1          | 6.1          |     
                       libupnp |  DISTRO  | https://release-monitoring.org/project/21315 | 1.14.18      | 1.14.19      |     
                      libupnpp |  DISTRO  | https://release-monitoring.org/project/15849 | 0.21.0       | 0.26.6       | ORPH
                      liburing |  DISTRO  | https://release-monitoring.org/project/230185 | 2.5          | 2.6          |     
                        libv4l |  DISTRO  | https://release-monitoring.org/project/09998 | 1.24.1       | 1.26.1       |     
                       libvips |  DISTRO  | https://release-monitoring.org/project/05097 | 8.10.6       | 8.15.2a      |     
                       libvirt |  DISTRO  | https://release-monitoring.org/project/13830 | 7.10.0       | 10.3.0       |     
                        libvpl |  DISTRO  | https://release-monitoring.org/project/242664 | 2.11.0       | 2023.4.0     |     
                        libvpx |  DISTRO  | https://release-monitoring.org/project/11083 | 1.13.1       | 1.14.1       |     
                        libxcb |  DISTRO  | https://release-monitoring.org/project/01767 | 1.15         | 1.17.0       | ORPH
                  libxkbcommon |  DISTRO  | https://release-monitoring.org/project/01780 | 1.4.0        | 1.7.0        |     
                       libxml2 |  DISTRO  | https://release-monitoring.org/project/01783 | 2.12.6       | 2.12.7       |     
                     libxmlrpc |  DISTRO  | https://release-monitoring.org/project/09024 | r3176        | 1.59.03      |     
                       libyang |  DISTRO  | https://release-monitoring.org/project/18554 | 2.1.148      | 2.2.8        |     
                    libzenoh-c |  DISTRO  | https://release-monitoring.org/project/372354 | 0.11.0.2     | 0.11.0.3     |     
                 libzenoh-pico |  DISTRO  | https://release-monitoring.org/project/369957 | 0.11.0.1     | 0.11.0.3     |     
                          lilv |  DISTRO  | https://release-monitoring.org/project/01818 | 0.24.12      | 0.24.24      |     
                      linphone |  DISTRO  | https://release-monitoring.org/project/01823 | 4.4.8        | 5.2.4        | ORPH
                linux-firmware |  DISTRO  | https://release-monitoring.org/project/141464 | 20240410     | 20240513     |     
                       live555 |  DISTRO  | https://release-monitoring.org/project/12414 | 2021.05.03   | 2024.05.30   | ORPH
                           lld |  DISTRO  | https://release-monitoring.org/project/01830 | 15.0.3       | 18.1.6       |     
                         lldpd |  DISTRO  | https://release-monitoring.org/project/14019 | 1.0.17       | 1.0.18       | ORPH
                          llvm |  DISTRO  | https://release-monitoring.org/project/01830 | 15.0.3       | 18.1.6       |     
                          lmdb |  DISTRO  | https://release-monitoring.org/project/06974 | 0.9.31       | 0.9.33       |     
                lockfile-progs |  DISTRO  | https://release-monitoring.org/project/10135 | 0.1.19       | 0.1.19+nmu1  | ORPH
                     log4cplus |  DISTRO  | https://release-monitoring.org/project/01835 | 2.1.0        | 2.1.1        | ORPH
                       log4cxx |  DISTRO  | https://release-monitoring.org/project/15330 | 1.1.0        | 1.2.0        |     
                     logrotate |  DISTRO  | https://release-monitoring.org/project/10567 | 3.21.0       | 3.22.0       | ORPH
                          lpty |  DISTRO  | https://release-monitoring.org/project/11671 | 1.0.1-1      | 1.2.2        |     
                      lsqlite3 |  DISTRO  | https://release-monitoring.org/project/11649 | 0.9.5-1      | 0.9.6        |     
                 ltp-testsuite |  DISTRO  | https://release-monitoring.org/project/21502 | 20240129     | 20240524     |     
                         ltris |  DISTRO  | https://release-monitoring.org/project/21503 | 1.2.7        | 1.3.1        |     
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
                         mdevd |  DISTRO  | https://release-monitoring.org/project/16553 | 0.1.6.0      | 0.1.6.3      |     
                 mediastreamer |  DISTRO  | https://release-monitoring.org/project/21746 | 4.4.8        | 5.3.54       | ORPH
                     memcached |  DISTRO  | https://release-monitoring.org/project/01965 | 1.6.22       | 1.6.28       | ORPH
                     memtest86 |  DISTRO  | https://release-monitoring.org/project/01966 | 6.20         | 7.00         |     
                        mesa3d |  DISTRO  | https://release-monitoring.org/project/01970 | 24.0.7       | 24.1.0       |     
                mesa3d-headers |  DISTRO  | https://release-monitoring.org/project/01970 | 24.0.7       | 24.1.0       |     
                         meson |  DISTRO  | https://release-monitoring.org/project/06472 | 1.3.1        | 1.4.1        |     
                      metacity |  DISTRO  | https://release-monitoring.org/project/15392 | 2.25.1       | 3.46.0       | ORPH
                      mfgtools |  DISTRO  | https://release-monitoring.org/project/21519 | 0.02         | 2.8.0        |     
microchip-hss-payload-gener... |  DISTRO  | https://release-monitoring.org/project/368767 | 2023.09      | 2024.02.1    |     
                   micropython |  DISTRO  | https://release-monitoring.org/project/10539 | 1.22.0       | 1.23.0       |     
                         mimic |  DISTRO  | https://release-monitoring.org/project/21521 | 1.1.0        | 1.3.0.1      |     
                      minetest |  DISTRO  | https://release-monitoring.org/project/01978 | 5.6.1        | 5.8.0        |     
                 minetest-game |  DISTRO  | https://release-monitoring.org/project/21522 | 5.6.1        | 5.8.0        |     
                       minizip |  DISTRO  | https://release-monitoring.org/project/301509 | 4.0.3        | 4.0.6        |     
                        moarvm |  DISTRO  | https://release-monitoring.org/project/21100 | 2023.12      | 2024.05      |     
mobile-broadband-provider-info |  DISTRO  | https://release-monitoring.org/project/10267 | 20221107     | 20240407     | ORPH
                 moby-buildkit |  DISTRO  | https://release-monitoring.org/project/20836 | 0.11.6       | 0.13.2       |     
                  modsecurity2 |  DISTRO  | https://release-monitoring.org/project/68638 | 2.9.7        | 3.0.12       |     
                       mokutil |  DISTRO  | https://release-monitoring.org/project/246006 | 0.7.1        | 0.7.2        |     
                       mongodb |  DISTRO  | https://release-monitoring.org/project/02008 | 4.2.18       | 7.3.2        |     
                      mongoose |  DISTRO  | https://release-monitoring.org/project/07603 | 7.13         | 7.14         |     
                         monit |  DISTRO  | https://release-monitoring.org/project/05483 | 5.33.0       | 5.34.0       |     
                          mono |  DISTRO  | https://release-monitoring.org/project/06360 | 6.12.0.182   | 6.12.0.206   |     
                     mpdecimal |  DISTRO  | https://release-monitoring.org/project/11578 | 2.5.1        | 4.0.0        |     
                          mpfr |  DISTRO  | https://release-monitoring.org/project/02019 | 4.1.1        | 4.2.1        | ORPH
                        mpg123 |  DISTRO  | https://release-monitoring.org/project/12413 | 1.32.3       | 1.32.6       |     
                           mpv |  DISTRO  | https://release-monitoring.org/project/05348 | 0.35.1       | 0.38.0       |     
                       msgpack |  DISTRO  | https://release-monitoring.org/project/12278 | 3.3.0        | 6.1.1        |     
                         msmtp |  DISTRO  | https://release-monitoring.org/project/02024 | 1.8.25       | 1.8.26       |     
                           mtd |  DISTRO  | https://release-monitoring.org/project/02026 | 2.1.6        | 2.2.0        |     
                         mtdev |  DISTRO  | https://release-monitoring.org/project/08868 | 1.1.6        | 1.1.7        |     
                        mtools |  DISTRO  | https://release-monitoring.org/project/02028 | 4.0.43       | 4.0.44       | ORPH
                         mupdf |  DISTRO  | https://release-monitoring.org/project/02034 | 1.22.0       | 1.24.2       |     
                          mxml |  DISTRO  | https://release-monitoring.org/project/13545 | 3.3.1        | 4.0.3        |     
                          nano |  DISTRO  | https://release-monitoring.org/project/02046 | 7.2          | 8.0          | ORPH
                       nanomsg |  DISTRO  | https://release-monitoring.org/project/14540 | 1.2          | 1.2.1        |     
                          nasm |  DISTRO  | https://release-monitoring.org/project/02048 | 2.16.02      | 2.16.03      | ORPH
                           nbd |  DISTRO  | https://release-monitoring.org/project/02052 | 3.25         | 3.26.1       |     
                          ncdu |  DISTRO  | https://release-monitoring.org/project/06045 | 1.20         | 2.4          |     
                         ncftp |  DISTRO  | https://release-monitoring.org/project/02054 | 3.2.6        | 3.2.7        | ORPH
                        ndisc6 |  DISTRO  | https://release-monitoring.org/project/21531 | 1.0.7        | 1.0.8        | ORPH
                      neofetch |  DISTRO  | https://release-monitoring.org/project/16261 | 7.1.0        | 7.3.11       | ORPH
                       nerdctl |  DISTRO  | https://release-monitoring.org/project/242901 | 1.7.3        | 1.7.6        |     
                      netatalk |  DISTRO  | https://release-monitoring.org/project/02063 | 3.1.18       | 3.2.0        | ORPH
                netcat-openbsd |  DISTRO  | https://release-monitoring.org/project/21534 | 1.218        | 1.226        | ORPH
                       netdata |  DISTRO  | https://release-monitoring.org/project/11046 | 1.33.1       | 1.45.5       |     
                       netifrc |  DISTRO  | https://release-monitoring.org/project/21917 | 0.7.3        | 0.7.8        |     
                     netopeer2 |  DISTRO  | https://release-monitoring.org/project/114978 | 2.1.49       | 2.2.19       |     
                       netsnmp |  DISTRO  | https://release-monitoring.org/project/02062 | 5.9.3        | 5.9.4        | ORPH
                       netsurf |  DISTRO  | https://release-monitoring.org/project/05386 | 3.10         | 3.11         |     
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
                    nodejs-bin |  DISTRO  | https://release-monitoring.org/project/08251 | 20.11.1      | 22.2.0       |     
                    nodejs-src |  DISTRO  | https://release-monitoring.org/project/08251 | 20.11.1      | 22.2.0       |     
                          noip |  DISTRO  | https://release-monitoring.org/project/21539 | 2.1.9        | 3.0.0        | ORPH
                           ntp |  DISTRO  | https://release-monitoring.org/project/09025 | 4.2.8p17     | 4.2.8p18     |     
                       numactl |  DISTRO  | https://release-monitoring.org/project/02507 | 2.0.16       | 2.0.18       |     
                       nushell |  DISTRO  | https://release-monitoring.org/project/31106 | 0.85.0       | 0.94.1       | ORPH
                        nuttcp |  DISTRO  | https://release-monitoring.org/project/02511 | 6.1.2        | 8.2.2        |     
                 nvidia-driver |  DISTRO  | https://release-monitoring.org/project/21843 | 390.151      | 390.157      |     
               nvidia-modprobe |  DISTRO  | https://release-monitoring.org/project/141657 | 450.57       | 555.42.02    | ORPH
           nvidia-persistenced |  DISTRO  | https://release-monitoring.org/project/369496 | 515.48.07    | 555.42.02    |     
                          nvme |  DISTRO  | https://release-monitoring.org/project/09074 | 1.12         | 2.9.1        | ORPH
                         ofono |  DISTRO  | https://release-monitoring.org/project/16859 | 2.2          | 2.7          |     
                          ogre |  DISTRO  | https://release-monitoring.org/project/33334 | v1.12.12     | 14.2.6       |     
                       omniorb |  DISTRO  | https://release-monitoring.org/project/21545 | 4.3.1        | 4.3.2        | ORPH
              onevpl-intel-gpu |  DISTRO  | https://release-monitoring.org/project/368736 | 24.2.1       | 24.2.4       |     
                    open-iscsi |  DISTRO  | https://release-monitoring.org/project/10861 | 2.1.9        | 2.1.10       |     
                     open-lldp |  DISTRO  | https://release-monitoring.org/project/115714 | 1.1          | 1.1.1        |     
                     open62541 |  DISTRO  | https://release-monitoring.org/project/16896 | v1.3.10      | 1.4.1        | ORPH
                        openal |  DISTRO  | https://release-monitoring.org/project/08172 | 1.22.0       | 1.23.1       | ORPH
                  opencl-clhpp |  DISTRO  | https://release-monitoring.org/project/271141 | 2023.12.14   | 2024.05.08   |     
                  opencore-amr |  DISTRO  | https://release-monitoring.org/project/21548 | 0.1.5        | 0.1.6        | ORPH
                       opencv3 |  DISTRO  | https://release-monitoring.org/project/06615 | 3.4.19       | 4.9.0        |     
                openfpgaloader |  DISTRO  | https://release-monitoring.org/project/241709 | 0.11.0       | 0.12.1       |     
                      openipmi |  DISTRO  | https://release-monitoring.org/project/02549 | 2.0.34       | 2.0.35       | ORPH
                       openjdk |  GUESS   | https://release-monitoring.org/project/176098 | 17.0.9+9     | 23+25        |     
                    openlayers |  DISTRO  | https://release-monitoring.org/project/06847 | 9.1.0        | 9.2.4        |     
                       openmpi |  DISTRO  | https://release-monitoring.org/project/02554 | 4.1.5        | 5.0.3        |     
                        openrc |  DISTRO  | https://release-monitoring.org/project/11687 | 0.52.1       | 0.54         |     
                        opensc |  DISTRO  | https://release-monitoring.org/project/02559 | 0.24.0       | 0.25.1       | ORPH
                   openvmtools |  DISTRO  | https://release-monitoring.org/project/10998 | 11.3.5-18... | 12.4.0       |     
                          opkg |  DISTRO  | https://release-monitoring.org/project/59397 | 0.6.2        | 0.6.3        | ORPH
                    opkg-utils |  DISTRO  | https://release-monitoring.org/project/59396 | 0.6.2        | 0.6.3        | ORPH
                          opus |  DISTRO  | https://release-monitoring.org/project/11081 | 1.4          | 1.5.2        |     
                           orc |  DISTRO  | https://release-monitoring.org/project/02573 | 0.4.34       | 0.4.38       | ORPH
                          ortp |  DISTRO  | https://release-monitoring.org/project/21691 | 4.4.8        | 5.3.54       | ORPH
                        pahole |  DISTRO  | https://release-monitoring.org/project/231624 | 1.25         | 1.26         |     
                       pangomm |  DISTRO  | https://release-monitoring.org/project/07958 | 2.50.1       | 2.52.0       |     
                   pangomm2_46 |  DISTRO  | https://release-monitoring.org/project/369412 | 2.46.3       | 2.46.4       |     
                    parprouted |  DISTRO  | https://release-monitoring.org/project/10309 | 0.7          | 0.65         | ORPH
                      patchelf |  DISTRO  | https://release-monitoring.org/project/02598 | 0.13         | 0.18.0       | ORPH
                      pciutils |  DISTRO  | https://release-monitoring.org/project/02605 | 3.10.0       | 3.12.0       |     
                     pcsc-lite |  DISTRO  | https://release-monitoring.org/project/02611 | 2.1.0        | 2.2.3        | ORPH
                          pdbg |  DISTRO  | https://release-monitoring.org/project/21378 | 3.5          | 3.6          |     
                perl-crypt-cbc |  DISTRO  | https://release-monitoring.org/project/11930 | 2.33         | 3.04         |     
        perl-crypt-openssl-aes |  DISTRO  | https://release-monitoring.org/project/02743 | 0.02         | 0.19         |     
     perl-crypt-openssl-random |  DISTRO  | https://release-monitoring.org/project/02747 | 0.15         | 0.16         |     
                perl-data-uuid |  DISTRO  | https://release-monitoring.org/project/11837 | 1.226        | 1.227        |     
               perl-date-manip |  DISTRO  | https://release-monitoring.org/project/02785 | 6.94         | 6.95         |     
                perl-dbd-mysql |  DISTRO  | https://release-monitoring.org/project/02807 | 4.046        | 5.005        |     
               perl-devel-size |  DISTRO  | https://release-monitoring.org/project/02835 | 0.83         | 0.84         |     
          perl-extutils-config |  DISTRO  | https://release-monitoring.org/project/11847 | 0.008        | 0.009        |     
    perl-extutils-installpaths |  DISTRO  | https://release-monitoring.org/project/11849 | 0.012        | 0.013        |     
                       perl-gd |  DISTRO  | https://release-monitoring.org/project/12660 | 2.77         | 2.82         |     
                  perl-gdgraph |  DISTRO  | https://release-monitoring.org/project/09187 | 1.54         | 1.56         |     
              perl-html-parser |  DISTRO  | https://release-monitoring.org/project/02967 | 3.81         | 3.82         |     
              perl-html-tagset |  DISTRO  | https://release-monitoring.org/project/02971 | 3.20         | 3.24         |     
             perl-http-cookies |  DISTRO  | https://release-monitoring.org/project/02974 | 6.10         | 6.11         |     
             perl-http-message |  DISTRO  | https://release-monitoring.org/project/02977 | 6.45         | 6.46         |     
           perl-image-exiftool |  DISTRO  | https://release-monitoring.org/project/06175 | 12.50        | 12.85        |     
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
                       poppler |  DISTRO  | https://release-monitoring.org/project/03686 | 22.12.0      | 24.06.0      |     
                    postgresql |  DISTRO  | https://release-monitoring.org/project/05601 | 16.3         | 17           |     
                         pound |  DISTRO  | https://release-monitoring.org/project/05436 | 4.8          | 4.12         | ORPH
                 powerpc-utils |  DISTRO  | https://release-monitoring.org/project/10715 | 1.3.11       | 1.3.12       | ORPH
                     procps-ng |  DISTRO  | https://release-monitoring.org/project/03708 | 3.3.17       | 4.0.4        | ORPH
                          proj |  DISTRO  | https://release-monitoring.org/project/21570 | 9.3.0        | 9.4.1        |     
                       prosody |  DISTRO  | https://release-monitoring.org/project/03709 | 0.11.14      | 0.12.4       |     
                      protobuf |  DISTRO  | https://release-monitoring.org/project/03715 | 21.12        | 27.0         |     
                proxychains-ng |  DISTRO  | https://release-monitoring.org/project/06499 | 4.16         | 4.17         | ORPH
          pru-software-support |  DISTRO  | https://release-monitoring.org/project/21825 | 6.0.1        | 6.4.0        |     
                        psmisc |  DISTRO  | https://release-monitoring.org/project/03721 | 23.5         | 23.7         | ORPH
                          ptpd |  GUESS   | https://release-monitoring.org/project/03726 | 1.1.0        | 2.3.1        | ORPH
                            pv |  DISTRO  | https://release-monitoring.org/project/03736 | 1.8.5        | 1.8.9        | ORPH
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
                  python-boto3 |  DISTRO  | https://release-monitoring.org/project/29737 | 1.34.14      | 1.34.117     |     
               python-botocore |  DISTRO  | https://release-monitoring.org/project/08748 | 1.34.14      | 1.34.117     |     
             python-cachetools |  DISTRO  | https://release-monitoring.org/project/07022 | 5.3.2        | 5.3.3        |     
                  python-cbor2 |  DISTRO  | https://release-monitoring.org/project/64102 | 5.5.1        | 5.6.3        |     
                python-certifi |  DISTRO  | https://release-monitoring.org/project/07995 | 2023.11.17   | 2024.6.2     |     
               python-channels |  DISTRO  | https://release-monitoring.org/project/21937 | 4.0.0        | 4.1.0        |     
         python-channels-redis |  DISTRO  | https://release-monitoring.org/project/21936 | 4.1.0        | 4.2.0        |     
                python-cheroot |  DISTRO  | https://release-monitoring.org/project/20163 | 10.0.0       | 11.0.0b3     |     
               python-cherrypy |  DISTRO  | https://release-monitoring.org/project/03799 | 18.8.0       | 18.9.0       |     
               python-colorlog |  DISTRO  | https://release-monitoring.org/project/12509 | 6.8.0        | 6.8.2        |     
         python-configshell-fb |  DISTRO  | https://release-monitoring.org/project/19734 | 1.1.30       | 1.5          |     
              python-contourpy |  DISTRO  | https://release-monitoring.org/project/244705 | 1.1.0        | 1.2.1        |     
                python-crontab |  DISTRO  | https://release-monitoring.org/project/31282 | 3.0.0        | 3.1.0        |     
           python-cryptography |  DISTRO  | https://release-monitoring.org/project/05532 | 39.0.2       | 42.0.7       |     
               python-cssutils |  DISTRO  | https://release-monitoring.org/project/13259 | 2.9.0        | 2.11.0       |     
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
               python-engineio |  DISTRO  | https://release-monitoring.org/project/15064 | 4.8.2        | 4.9.1        |     
                  python-evdev |  DISTRO  | https://release-monitoring.org/project/62869 | 1.6.1        | 1.7.1        |     
                python-fastapi |  DISTRO  | https://release-monitoring.org/project/47977 | 0.110.0      | 0.111.0      |     
                 python-fastui |  DISTRO  | https://release-monitoring.org/project/372329 | 0.5.2        | 0.6.0        |     
               python-filelock |  DISTRO  | https://release-monitoring.org/project/11739 | 3.13.1       | 3.14.0       |     
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
            python-google-auth |  DISTRO  | https://release-monitoring.org/project/38039 | 2.26.1       | 2.29.0       |     
python-googleapis-common-pr... |  DISTRO  | https://release-monitoring.org/project/63943 | 1.62.0       | 1.63.0       |     
               python-gpiozero |  DISTRO  | https://release-monitoring.org/project/19948 | 2.0          | 2.0.1        |     
          python-grpc-requests |  DISTRO  | https://release-monitoring.org/project/132701 | 0.1.13       | 0.1.18       |     
                 python-grpcio |  DISTRO  | https://release-monitoring.org/project/18429 | 1.60.0       | 1.64.0       |     
      python-grpcio-reflection |  DISTRO  | https://release-monitoring.org/project/30542 | 1.60.0       | 1.64.0       |     
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
                 python-jinja2 |  DISTRO  | https://release-monitoring.org/project/03894 | 3.1.2        | 3.1.4        |     
             python-jsonschema |  DISTRO  | https://release-monitoring.org/project/03898 | 4.20.0       | 4.22.0       |     
                python-keyring |  DISTRO  | https://release-monitoring.org/project/03901 | 24.2.0       | 25.2.1       |     
                   python-lark |  DISTRO  | https://release-monitoring.org/project/140595 | 1.1.8        | 1.1.9        |     
                   python-lxml |  DISTRO  | https://release-monitoring.org/project/03914 | 5.1.0        | 5.2.2        |     
               python-m2crypto |  DISTRO  | https://release-monitoring.org/project/06599 | 0.40.1       | 0.41.0       |     
         python-magic-wormhole |  DISTRO  | https://release-monitoring.org/project/17278 | 0.13.0       | 0.14.0       |     
                   python-mako |  DISTRO  | https://release-monitoring.org/project/03915 | 1.3.0        | 1.3.5        |     
               python-markdown |  DISTRO  | https://release-monitoring.org/project/03916 | 3.5.1        | 3.6          |     
              python-markdown2 |  DISTRO  | https://release-monitoring.org/project/03917 | 2.4.12       | 2.4.13       |     
             python-markupsafe |  DISTRO  | https://release-monitoring.org/project/03918 | 2.1.3        | 2.1.5        |     
            python-marshmallow |  DISTRO  | https://release-monitoring.org/project/08079 | 3.20.1       | 3.21.2       |     
 python-marshmallow-sqlalchemy |  DISTRO  | https://release-monitoring.org/project/50566 | 0.30.0       | 1.0.0        |     
             python-matplotlib |  DISTRO  | https://release-monitoring.org/project/03919 | 3.8.2        | 3.9.0        |     
      python-matplotlib-inline |  GUESS   | https://release-monitoring.org/project/198324 | 0.1.6        | 0.1.7        |     
                python-maturin |  DISTRO  | https://release-monitoring.org/project/42653 | 1.4.0        | 1.5.1        |     
           python-meson-python |  DISTRO  | https://release-monitoring.org/project/248985 | 0.15.0       | 0.16.0       |     
              python-ml-dtypes |  DISTRO  | https://release-monitoring.org/project/330555 | 0.3.2        | 0.4.0b1      |     
                python-msgpack |  DISTRO  | https://release-monitoring.org/project/21831 | 1.0.7        | 1.0.8        |     
              python-multidict |  DISTRO  | https://release-monitoring.org/project/11132 | 6.0.4        | 6.0.5        |     
              python-multipart |  DISTRO  | https://release-monitoring.org/project/18463 | 0.0.6        | 0.0.9        |     
                python-netaddr |  DISTRO  | https://release-monitoring.org/project/05586 | 0.10.1       | 1.3.0        |     
               python-networkx |  DISTRO  | https://release-monitoring.org/project/07791 | 3.2.1        | 3.3          |     
                  python-numpy |  DISTRO  | https://release-monitoring.org/project/02509 | 1.25.0       | 2.0.0b1      |     
          python-opcua-asyncio |  DISTRO  | https://release-monitoring.org/project/131612 | 1.0.5        | 1.05a1       |     
                 python-orjson |  DISTRO  | https://release-monitoring.org/project/31737 | 3.9.10       | 3.10.3       |     
              python-paho-mqtt |  DISTRO  | https://release-monitoring.org/project/06084 | 1.6.1        | 2.1.0        |     
                  python-parso |  DISTRO  | https://release-monitoring.org/project/16689 | 0.8.3        | 0.8.4        |     
                    python-pip |  DISTRO  | https://release-monitoring.org/project/06529 | 23.3.2       | 24.1b1       |     
                 python-pluggy |  DISTRO  | https://release-monitoring.org/project/07500 | 1.4.0        | 1.5.0        |     
         python-prompt-toolkit |  DISTRO  | https://release-monitoring.org/project/08742 | 3.0.43       | 3.0.45       |     
               python-protobuf |  DISTRO  | https://release-monitoring.org/project/03715 | 21.12        | 27.0         |     
                 python-psutil |  DISTRO  | https://release-monitoring.org/project/03978 | 5.9.7        | 5.9.8        |     
         python-pyasn1-modules |  DISTRO  | https://release-monitoring.org/project/11987 | 0.3.0        | 0.4.0        |     
                 python-pybind |  DISTRO  | https://release-monitoring.org/project/13384 | 2.11.1       | 2.12.0       |     
                python-pycairo |  DISTRO  | https://release-monitoring.org/project/13166 | 1.25.1       | 1.26.0       |     
              python-pycparser |  DISTRO  | https://release-monitoring.org/project/08175 | 2.21         | 2.22         |     
                python-pycrate |  DISTRO  | https://release-monitoring.org/project/185106 | 0.7.2        | 0.7.5        |     
          python-pycryptodomex |  DISTRO  | https://release-monitoring.org/project/36851 | 3.19.1       | 3.20.0       |     
                 python-pycups |  DISTRO  | https://release-monitoring.org/project/07975 | 2.0.1        | 2.0.4        |     
                  python-pydal |  DISTRO  | https://release-monitoring.org/project/21582 | 20231114.3   | 20240601.3   |     
               python-pydantic |  DISTRO  | https://release-monitoring.org/project/29768 | 2.5.3        | 2.7.2        |     
          python-pydantic-core |  DISTRO  | https://release-monitoring.org/project/273695 | 2.14.6       | 2.18.3       |     
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
          python-pytablereader |  DISTRO  | https://release-monitoring.org/project/21592 | 0.31.3       | 0.31.4       |     
                 python-pytest |  DISTRO  | https://release-monitoring.org/project/03765 | 8.1.1        | 8.2.1        |     
         python-pytest-asyncio |  DISTRO  | https://release-monitoring.org/project/07273 | 0.23.6       | 0.23.7       |     
                python-pythran |  DISTRO  | https://release-monitoring.org/project/21140 | 0.15.0       | 0.16.1       |     
                 python-pyudev |  DISTRO  | https://release-monitoring.org/project/08485 | 0.24.1       | 0.24.3       |     
                  python-pyzmq |  DISTRO  | https://release-monitoring.org/project/04104 | 25.1.2       | 26.0.3       |     
                  python-redis |  DISTRO  | https://release-monitoring.org/project/03992 | 5.0.1        | 5.0.4        |     
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
             python-sentry-sdk |  DISTRO  | https://release-monitoring.org/project/21603 | 1.39.2       | 2.3.1        |     
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
               python-sqlparse |  DISTRO  | https://release-monitoring.org/project/04038 | 0.4.4        | 0.5.0        |     
              python-starlette |  DISTRO  | https://release-monitoring.org/project/36570 | 0.36.3       | 0.37.2       |     
                  python-sympy |  DISTRO  | https://release-monitoring.org/project/04923 | 1.12         | 1.12.1       |     
               python-tcolorpy |  DISTRO  | https://release-monitoring.org/project/97274 | 0.1.4        | 0.1.6        |     
                python-tempora |  DISTRO  | https://release-monitoring.org/project/21225 | 5.5.0        | 5.5.1        |     
              python-texttable |  DISTRO  | https://release-monitoring.org/project/11635 | 1.6.7        | 1.7.0        |     
                 python-thrift |  DISTRO  | https://release-monitoring.org/project/21614 | 0.16.0       | 0.20.0       |     
               python-tinycss2 |  DISTRO  | https://release-monitoring.org/project/16655 | 1.2.1        | 1.3.0        |     
                python-tinyrpc |  DISTRO  | https://release-monitoring.org/project/12824 | 1.1.4        | 1.1.7        |     
                python-tornado |  DISTRO  | https://release-monitoring.org/project/07498 | 6.2          | 6.4          |     
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
      python-typing-extensions |  DISTRO  | https://release-monitoring.org/project/19755 | 4.9.0        | 4.12.1       |     
         python-typing-inspect |  DISTRO  | https://release-monitoring.org/project/209826 | 0.8.0        | 0.9.0        |     
              python-u-msgpack |  DISTRO  | https://release-monitoring.org/project/19764 | 2.7.2        | 2.8.0        |     
                  python-ujson |  DISTRO  | https://release-monitoring.org/project/04076 | 5.7.0        | 5.10.0       |     
                python-urllib3 |  DISTRO  | https://release-monitoring.org/project/04078 | 2.0.7        | 2.2.1        |     
                  python-urwid |  DISTRO  | https://release-monitoring.org/project/04079 | 2.6.10       | 2.6.12       |     
         python-urwid-readline |  DISTRO  | https://release-monitoring.org/project/84198 | 0.13         | 0.14         |     
                python-uvicorn |  DISTRO  | https://release-monitoring.org/project/28526 | 0.29.0       | 0.30.1       |     
             python-validators |  DISTRO  | https://release-monitoring.org/project/19818 | 0.22.0       | 0.28.3       |     
               python-watchdog |  DISTRO  | https://release-monitoring.org/project/05341 | 2.2.1        | 4.0.1        |     
                python-wcwidth |  DISTRO  | https://release-monitoring.org/project/08743 | 0.2.5        | 0.2.13       |     
             python-weasyprint |  DISTRO  | https://release-monitoring.org/project/11057 | 59.0         | 62.1         |     
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
                       python3 |  DISTRO  | https://release-monitoring.org/project/13254 | 3.11.8       | 3.12.3       |     
                    qbee-agent |  DISTRO  | https://release-monitoring.org/project/372328 | 2024.09      | 2024.19      |     
          qcom-db410c-firmware |  DISTRO  | https://release-monitoring.org/project/235382 | 1034.2.1     | 1036.1       |     
                         qlibc |  DISTRO  | https://release-monitoring.org/project/21737 | 2.4.7        | 2.5.0        | ORPH
                          qpdf |  DISTRO  | https://release-monitoring.org/project/05542 | 10.5.0       | 11.9.0       |     
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
                          ruby |  DISTRO  | https://release-monitoring.org/project/04223 | 3.3.1        | 3.3.2        |     
                          rust |  DISTRO  | https://release-monitoring.org/project/07635 | 1.74.1       | 1.78.0       |     
                      rust-bin |  DISTRO  | https://release-monitoring.org/project/07635 | 1.74.1       | 1.78.0       |     
                  rust-bindgen |  DISTRO  | https://release-monitoring.org/project/17910 | 0.65.1       | 0.69.4       | ORPH
                         rygel |  DISTRO  | https://release-monitoring.org/project/04751 | 0.42.5       | 0.42.6       |     
                    s390-tools |  DISTRO  | https://release-monitoring.org/project/10714 | 2.32.0       | 2.33.1       |     
                            s6 |  DISTRO  | https://release-monitoring.org/project/05485 | 2.11.1.2     | 2.12.0.4     |     
                        s6-dns |  DISTRO  | https://release-monitoring.org/project/16547 | 2.3.5.4      | 2.3.7.1      |     
                 s6-linux-init |  DISTRO  | https://release-monitoring.org/project/16552 | 1.0.8.0      | 1.1.2.0      |     
                s6-linux-utils |  DISTRO  | https://release-monitoring.org/project/16551 | 2.6.0.0      | 2.6.2.0      |     
                 s6-networking |  DISTRO  | https://release-monitoring.org/project/16550 | 2.5.1.1      | 2.7.0.2      |     
             s6-portable-utils |  DISTRO  | https://release-monitoring.org/project/16549 | 2.2.5.0      | 2.3.0.3      |     
                         s6-rc |  DISTRO  | https://release-monitoring.org/project/16548 | 0.5.3.2      | 0.5.4.2      |     
                      safeclib |  DISTRO  | https://release-monitoring.org/project/21385 | 3.7.1        | 08032024     |     
                        samba4 |  DISTRO  | https://release-monitoring.org/project/04758 | 4.19.6       | 4.20.1       |     
                 sane-backends |  DISTRO  | https://release-monitoring.org/project/04760 | 1.1.1        | 1.3.1        |     
                    sdl2_mixer |  DISTRO  | https://release-monitoring.org/project/04782 | 2.6.3        | 2.8.0        | ORPH
                       sdl_gfx |  DISTRO  | https://release-monitoring.org/project/04778 | 2.0.23       | 2.0.27       | ORPH
                     sdl_sound |  DISTRO  | https://release-monitoring.org/project/10262 | 1.0.3        | 2.0.2        | ORPH
                        sdparm |  DISTRO  | https://release-monitoring.org/project/04787 | 1.10         | 1.12         |     
                       sedutil |  DISTRO  | https://release-monitoring.org/project/15203 | 1.20.0       | 1.49.1       |     
                    sentry-cli |  DISTRO  | https://release-monitoring.org/project/135642 | 2.20.3       | 2.32.1       |     
                 sentry-native |  DISTRO  | https://release-monitoring.org/project/135639 | 0.4.1        | 0.7.5        |     
                       ser2net |  DISTRO  | https://release-monitoring.org/project/21655 | 4.3.8        | 4.6.2        |     
                          serd |  DISTRO  | https://release-monitoring.org/project/230531 | 0.30.14      | 0.32.2       |     
                       setools |  DISTRO  | https://release-monitoring.org/project/08951 | 4.4.4        | 4.5.1        | ORPH
                        shadow |  DISTRO  | https://release-monitoring.org/project/04802 | 4.14.5       | 4.15.1       |     
                shairport-sync |  DISTRO  | https://release-monitoring.org/project/21384 | 3.3.9        | 4.3.3        | ORPH
              shared-mime-info |  DISTRO  | https://release-monitoring.org/project/05524 | 1.12         | 2.4          | ORPH
              signal-estimator |  DISTRO  | https://release-monitoring.org/project/284559 | v0.0.4       | 0.0.9        | ORPH
                   simple-mail |  DISTRO  | https://release-monitoring.org/project/53352 | 2.3.0        | 3.0.0        |     
                      sispmctl |  DISTRO  | https://release-monitoring.org/project/21653 | 4.11         | 4.12         |     
                       skalibs |  DISTRO  | https://release-monitoring.org/project/05486 | 2.12.0.1     | 2.14.1.1     |     
                         slirp |  DISTRO  | https://release-monitoring.org/project/96796 | 4.7.0        | 4.8.0        |     
                   slirp4netns |  DISTRO  | https://release-monitoring.org/project/96795 | 1.2.3        | 1.3.1        |     
                 smartmontools |  DISTRO  | https://release-monitoring.org/project/04835 | 7.3          | 7.4          | ORPH
                        snappy |  DISTRO  | https://release-monitoring.org/project/04844 | 1.1.10       | 1.2.1        |     
                        sngrep |  DISTRO  | https://release-monitoring.org/project/17075 | 1.7.0        | 1.8.1        | ORPH
                        snort3 |  DISTRO  | https://release-monitoring.org/project/13263 | 3.1.40.0     | 3.2.1.0      |     
                     softether |  DISTRO  | https://release-monitoring.org/project/21383 | 4.30-9700... | 4.42-9798... | ORPH
                          sord |  DISTRO  | https://release-monitoring.org/project/230536 | 0.16.12      | 0.16.16      |     
       sound-theme-freedesktop |  DISTRO  | https://release-monitoring.org/project/10152 | 0.7          | 0.8          |     
                       spandsp |  DISTRO  | https://release-monitoring.org/project/12600 | 3.0.0-6ec... | 3.0.0        |     
                    spawn-fcgi |  DISTRO  | https://release-monitoring.org/project/05388 | 1.6.4        | 1.6.5        | ORPH
                    sphinxbase |  DISTRO  | https://release-monitoring.org/project/20548 | 5prealpha    | 0.8          |     
                         spice |  DISTRO  | https://release-monitoring.org/project/04871 | 0.15.0       | 0.15.2       |     
                     sqlcipher |  DISTRO  | https://release-monitoring.org/project/11213 | 4.5.5        | 4.6.0        |     
                        sqlite |  DISTRO  | https://release-monitoring.org/project/04877 | 3.45.1       | 3.46.0       |     
                        sratom |  DISTRO  | https://release-monitoring.org/project/14903 | 0.6.14       | 0.6.16       |     
                          sslh |  DISTRO  | https://release-monitoring.org/project/06184 | 2.0.1        | 2.1.2        | ORPH
              starfive-spltool |  DISTRO  | https://release-monitoring.org/project/372234 | JH7110_VF... | JH7110-RT... |     
             start-stop-daemon |  DISTRO  | https://release-monitoring.org/project/08127 | 1.20.7.1     | 1.22.6       | ORPH
                    stellarium |  DISTRO  | https://release-monitoring.org/project/04891 | 23.3         | 24.1         |     
                        strace |  DISTRO  | https://release-monitoring.org/project/04897 | 6.8          | 6.9          |     
                     stress-ng |  DISTRO  | https://release-monitoring.org/project/12538 | 0.17.07      | 0.17.08      |     
                    strongswan |  DISTRO  | https://release-monitoring.org/project/04899 | 5.9.13       | 5.9.14       |     
                       stunnel |  DISTRO  | https://release-monitoring.org/project/04901 | 5.71         | 5.72         |     
                      suricata |  DISTRO  | https://release-monitoring.org/project/10925 | 6.0.19       | 7.0.5        |     
                          sway |  DISTRO  | https://release-monitoring.org/project/11497 | 1.8.1        | 1.9          |     
                        swaybg |  DISTRO  | https://release-monitoring.org/project/20562 | 1.2.0        | 1.2.1        |     
                          swig |  DISTRO  | https://release-monitoring.org/project/04919 | 4.1.1        | 4.2.1        |     
                      swupdate |  DISTRO  | https://release-monitoring.org/project/15714 | 2023.12.1    | 2024.05      |     
                       synergy |  DISTRO  | https://release-monitoring.org/project/05718 | 2.0.12-beta  | 2.3.2        |     
                        sysdig |  DISTRO  | https://release-monitoring.org/project/16898 | 0.29.3       | 0.37.1       |     
                       sysprof |  DISTRO  | https://release-monitoring.org/project/21649 | 1.2.0        | 46.0         |     
                       sysrepo |  DISTRO  | https://release-monitoring.org/project/34820 | 2.2.150      | 2.2.170      |     
                       systemd |  DISTRO  | https://release-monitoring.org/project/05440 | 254.9        | 255.7        |     
             systemd-bootchart |  DISTRO  | https://release-monitoring.org/project/11774 | 233          | 235          |     
                        taglib |  DISTRO  | https://release-monitoring.org/project/01982 | 1.13.1       | 2.0.1        |     
                           tbb |  DISTRO  | https://release-monitoring.org/project/08217 | 2021.11.0    | 2021.12.0    |     
                       tbtools |  DISTRO  | https://release-monitoring.org/project/372327 | 0.3.2        | 0.4.0        |     
                           tcl |  DISTRO  | https://release-monitoring.org/project/04941 | 8.6.13       | 8.6.14       | ORPH
                         tclap |  DISTRO  | https://release-monitoring.org/project/04942 | 1.2.4        | 1.2.5        | ORPH
                   terminology |  DISTRO  | https://release-monitoring.org/project/04951 | 1.12.1       | 1.13.0       |     
                      thermald |  DISTRO  | https://release-monitoring.org/project/14500 | 2.5.6        | 2.5.7        |     
                        thrift |  DISTRO  | https://release-monitoring.org/project/05581 | 0.14.1       | 0.20.0       | ORPH
                   timescaledb |  DISTRO  | https://release-monitoring.org/project/17545 | 2.14.2       | 2.15.1       |     
                      tinifier |  DISTRO  | https://release-monitoring.org/project/241900 | 3.4.0        | 4.1.0        |     
                       tinyxml |  DISTRO  | https://release-monitoring.org/project/10162 | 2.6.2_2      | 2.6.2        | ORPH
                           tio |  DISTRO  | https://release-monitoring.org/project/20587 | 2.7          | 3.3          |     
                            tk |  DISTRO  | https://release-monitoring.org/project/11426 | 8.6.13       | 8.6.14       |     
                   tl-expected |  DISTRO  | https://release-monitoring.org/project/112689 | v1.0.0       | 1.1.0        |     
                          tmux |  DISTRO  | https://release-monitoring.org/project/04980 | 3.3a         | 3.4          |     
                     tpm-tools |  DISTRO  | https://release-monitoring.org/project/21640 | 1.3.9.1      | 1.3.9.2      |     
                    tpm2-abrmd |  DISTRO  | https://release-monitoring.org/project/16819 | 2.3.3        | 3.0.0        | ORPH
                    tpm2-tools |  DISTRO  | https://release-monitoring.org/project/12841 | 5.2          | 5.7          | ORPH
                     tpm2-totp |  DISTRO  | https://release-monitoring.org/project/18790 | 0.2.1        | 0.3.0        |     
                      tpm2-tss |  DISTRO  | https://release-monitoring.org/project/12683 | 3.2.2        | 4.1.3        | ORPH
                    traceroute |  DISTRO  | https://release-monitoring.org/project/14877 | 2.1.3        | 2.1.5        |     
                  transmission |  DISTRO  | https://release-monitoring.org/project/05002 | 4.0.5        | 4.0.6        |     
                   uboot-tools |  DISTRO  | https://release-monitoring.org/project/05022 | 2021.07      | 2024.04      | ORPH
                       uftrace |  DISTRO  | https://release-monitoring.org/project/195039 | 0.14         | 0.16         |     
                           uhd |  DISTRO  | https://release-monitoring.org/project/12572 | 4.3.0.0      | 4.6.0.0      |     
                       unbound |  DISTRO  | https://release-monitoring.org/project/05042 | 1.19.1       | 1.20.0       |     
                       unionfs |  DISTRO  | https://release-monitoring.org/project/17617 | 2.1          | 3.4          | ORPH
                      upmpdcli |  DISTRO  | https://release-monitoring.org/project/15848 | 1.5.12       | 1.8.12       | ORPH
                        upower |  DISTRO  | https://release-monitoring.org/project/05056 | 0.99.19      | 1.90.4       |     
                           upx |  DISTRO  | https://release-monitoring.org/project/13737 | 4.2.1        | 4.2.4        |     
                      usbredir |  DISTRO  | https://release-monitoring.org/project/16012 | 0.13.0       | 0.14.0       |     
                     ustreamer |  DISTRO  | https://release-monitoring.org/project/314869 | 6.11         | 6.12         |     
                    util-linux |  DISTRO  | https://release-monitoring.org/project/08179 | 2.39.3       | 2.40.1       | ORPH
               util-linux-libs |  DISTRO  | https://release-monitoring.org/project/08179 | 2.39.3       | 2.40.1       | ORPH
                           uuu |  DISTRO  | https://release-monitoring.org/project/259328 | 1.5.181      | 1.5.182      |     
                           uvw |  DISTRO  | https://release-monitoring.org/project/33083 | 3.2.0_lib... | 3.4.0_lib... |     
                  v4l2loopback |  DISTRO  | https://release-monitoring.org/project/10956 | 0.12.7       | 0.13.2       |     
                          vala |  DISTRO  | https://release-monitoring.org/project/05065 | 0.56.14      | 0.56.17      | ORPH
                      valgrind |  DISTRO  | https://release-monitoring.org/project/13639 | 3.22.0       | 3.23.0       | ORPH
                           vdr |  DISTRO  | https://release-monitoring.org/project/05069 | 2.6.5        | 2.6.7        | ORPH
         vdr-plugin-vnsiserver |  DISTRO  | https://release-monitoring.org/project/05080 | 1.8.0        | 1.8.3        | ORPH
                           vim |  DISTRO  | https://release-monitoring.org/project/05092 | 9.1.0145     | 9.1.0457     | ORPH
                   vis-network |  DISTRO  | https://release-monitoring.org/project/270536 | 9.1.0        | 9.1.9        |     
                        vnstat |  DISTRO  | https://release-monitoring.org/project/07283 | 2.11         | 2.12         |     
                          volk |  DISTRO  | https://release-monitoring.org/project/147733 | 3.0.0        | 3.1.2        |     
                          vpnc |  DISTRO  | https://release-monitoring.org/project/15955 | 0.5.3r550... | 0.5.3        | ORPH
                           vte |  DISTRO  | https://release-monitoring.org/project/10895 | 0.66.2       | 0.76.3       | ORPH
                         vuejs |  DISTRO  | https://release-monitoring.org/project/89353 | 3.4.21       | 3.4.27       |     
                  vuejs-router |  DISTRO  | https://release-monitoring.org/project/234796 | 4.3.0        | 4.3.2        |     
                vulkan-headers |  DISTRO  | https://release-monitoring.org/project/88835 | 1.3.262      | 1.3.286      | ORPH
                 vulkan-loader |  DISTRO  | https://release-monitoring.org/project/230557 | 1.3.262      | 1.3.285      | ORPH
                  vulkan-tools |  DISTRO  | https://release-monitoring.org/project/242111 | 1.3.262      | 1.3.285      | ORPH
                           waf |  DISTRO  | https://release-monitoring.org/project/05116 | 2.0.26       | 2.1.1        |     
                        waffle |  DISTRO  | https://release-monitoring.org/project/21633 | 1.7.0        | 1.8.0        |     
                       wayland |  DISTRO  | https://release-monitoring.org/project/10061 | 1.22.0       | 1.23.0       |     
                     webkitgtk |  DISTRO  | https://release-monitoring.org/project/05355 | 2.42.5       | 2.45.3       |     
                          webp |  DISTRO  | https://release-monitoring.org/project/01761 | 1.3.2        | 1.4.0        |     
                          wget |  DISTRO  | https://release-monitoring.org/project/05124 | 1.21.4       | 1.24.5       |     
                         whois |  DISTRO  | https://release-monitoring.org/project/05128 | 5.5.14       | 5.5.23       |     
                          wine |  DISTRO  | https://release-monitoring.org/project/05134 | 8.0.2        | 9.10         |     
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
              xkeyboard-config |  DISTRO  | https://release-monitoring.org/project/05191 | 2.38         | 2.41         | ORPH
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
                  xscreensaver |  DISTRO  | https://release-monitoring.org/project/05269 | 6.03         | 6.08         |     
           xserver_xorg-server |  DISTRO  | https://release-monitoring.org/project/05250 | 21.1.11      | 21.1.13      | ORPH
                xtables-addons |  DISTRO  | https://release-monitoring.org/project/07736 | 3.24         | 3.26         | ORPH
                         xterm |  DISTRO  | https://release-monitoring.org/project/05272 | 389          | 392          | ORPH
              xutil_makedepend |  DISTRO  | https://release-monitoring.org/project/13528 | 1.0.8        | 1.0.9        | ORPH
                      xwayland |  DISTRO  | https://release-monitoring.org/project/180949 | 23.2.4       | 24.1.0       |     
                            xz |  DISTRO  | https://release-monitoring.org/project/05277 | 5.4.6        | 5.6.2        | ORPH
                           yad |  DISTRO  | https://release-monitoring.org/project/05280 | 0.40.0       | 13.0         |     
                         ytree |  DISTRO  | https://release-monitoring.org/project/05296 | 2.05         | 2.09         |     
                        zabbix |  DISTRO  | https://release-monitoring.org/project/05492 | 6.2.7        | 6.4.15       |     
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
                       libkrb5 | CVE-2023-39975   | https://security-tracker.debian.org/tracker/CVE-2023-39975  
                       libkrb5 | CVE-2023-36054   | https://security-tracker.debian.org/tracker/CVE-2023-36054  
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
                       pkgconf | CVE-2023-24056   | https://security-tracker.debian.org/tracker/CVE-2023-24056  
                 powerpc-utils | CVE-2014-8165    | https://security-tracker.debian.org/tracker/CVE-2014-8165   
                       proftpd | CVE-2023-48795   | https://security-tracker.debian.org/tracker/CVE-2023-48795  
                         putty | CVE-2024-31497   | https://security-tracker.debian.org/tracker/CVE-2024-31497  
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
