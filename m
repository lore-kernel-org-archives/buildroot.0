Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6FF7C2BD09
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 05:05:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E074C4118D;
	Fri, 12 Jul 2024 05:05:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Flyz0X5hODKU; Fri, 12 Jul 2024 05:05:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A0506403AD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A0506403AD;
	Fri, 12 Jul 2024 05:05:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 447FF1BF859
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 05:05:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2DECC4178D
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 05:05:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CMOuvLF8WNAg for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 05:05:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 848A4416ED
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 848A4416ED
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 848A4416ED
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 05:05:13 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A089E20005
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 05:05:10 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Fri, 12 Jul 2024 05:05:10 -0000
X-GND-Sasl: bot@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1720760710; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=A2TPVmwZA2Z+hpGV57vWR6JHgk8zxkwj029lH/nVL9g=;
 b=InpnySNXzySGKxCjN/FUmJyRAu92fzlDf7XPn7XCE7Ix8nCpysEqR/5CYfyoLNsucOZXxE
 dWNWzkPZ6w0Ja5vNem1gv5QWZUVB4ACdhtCW3XS1KhreML3otp6eb43Ap/sAeSqdr5jPWe
 DfZTuYrmyLUGia2y+v/fvkrhiygmgmdF6CmukeS9BOmi70bm5KcjovKrITsv9ak8FxovFs
 MmbYRsKHfpO6qyDaOi+vAEREYkvmF/qvpZxOF2qi87rUNyjkESZy8MzbRQbqB2OcBAmJbC
 ZGOMHOdL/muv88dI+WeDvldVz+VqMal1uPlK4Nt9W9/IZHw2j83W8P5+EW6SuQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=InpnySNX
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2024-07-11
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
Message-ID: <20240712050510.ICK3a8D6mTp3efFaHeqqOaFBTqlixkEC3UnsMbyfNZk@z>

Hello,

Autobuild statistics for 2024-07-11
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  7  |  8  |  0  | 15  |
  2024.05.x  |  4  |  8  |  0  | 12  |
    master   | 97  | 470 |  1  | 568 |

Classification of failures by reason for master
-----------------------------------------------

                    zstd-1.5.6 | 65
host-prelink-cross-a853a5d7... | 48
            host-cdrkit-1.1.11 | 44
                libressl-3.8.4 | 22
                    mpir-3.0.0 | 14
                elfutils-0.189 | 13
                   host-go-src | 10
               cracklib-2.9.11 | 9 
                   httping-2.5 | 9 
ibm-sw-tpm2-5452af422edeff7... | 8 
                gnu-efi-3.0.18 | 7 
libsvgtiny-ea9d99fc8b231c22... | 7 
                   linux-6.9.8 | 7 
                       unknown | 7 
                host-odb-2.4.0 | 6 
                    norm-1.5.8 | 6 
android-tools-4.2.2+git2013... | 5 
                  ffmpeg-6.1.1 | 5 
host-android-tools-4.2.2+gi... | 5 
host-vboot-utils-bbdd62f9b0... | 5 
                  jack2-1.9.22 | 5 
                     avahi-0.8 | 4 
                  bcusdk-0.0.5 | 4 
                 dc3dd-7.2.641 | 4 
edid-decode-6f117a8f8c0e76e... | 4 
                   evemu-2.7.0 | 4 
                fail2ban-1.0.2 | 4 
glibc-2.39-74-g198632a05f6c... | 4 
               libglib2-2.76.1 | 4 
                 openssh-9.8p1 | 4 
     bandwidthd-2.0.1-auto-r11 | 3 
check-11970a7e112dfe243a2e6... | 3 
                 gnuplot-6.0.1 | 3 
host-heimdal-f4faaeaba371ff... | 3 
              libarchive-3.7.4 | 3 
                libcuefile-475 | 3 
                  libffi-3.4.6 | 3 
                libxml2-2.12.6 | 3 
           mediastreamer-4.4.8 | 3 
                python3-3.12.4 | 3 
             rabbitmq-c-0.13.0 | 3 
              udpcast-20230924 | 3 
                  zabbix-6.2.7 | 3 
aer-inject-9bd5e2c7886fca72... | 2 
                  autossh-1.4g | 2 
                   botan-3.3.0 | 2 
          cloudflared-2024.6.1 | 2 
         host-gcc-final-13.3.0 | 2 
           host-gengetopt-2.23 | 2 
              host-rust-1.79.0 | 2 
 host-softether-4.30-9700-beta | 2 
                 libp11-0.4.12 | 2 
     linux-5.10.162-cip24-rt10 | 2 
                  mender-3.4.0 | 2 
                   mpd-0.23.15 | 2 
                  ntp-4.2.8p18 | 2 
squeezelite-71c012ad9ba102f... | 2 
             util-linux-2.39.3 | 2 
                      xz-5.6.2 | 2 
                 apache-2.4.61 | 1 
                     apr-1.7.2 | 1 
               arp-scan-1.10.0 | 1 
           at-spi2-core-2.50.0 | 1 
                    attr-2.5.2 | 1 
                    bat-0.24.0 | 1 
                beecrypt-4.2.1 | 1 
  binutils-arc-2023.09-release | 1 
                   bird-2.0.12 | 1 
                  boost-1.83.0 | 1 
brcm-patchram-plus-95b7b691... | 1 
                    brltty-6.6 | 1 
                  brotli-1.1.0 | 1 
                 c-icap-0.5.10 | 1 
              cache-calibrator | 1 
             can-utils-2023.03 | 1 
                 cdrkit-1.1.11 | 1 
                 coreutils-9.3 | 1 
          cryptodev-linux-1.13 | 1 
             dahdi-linux-3.3.0 | 1 
             docker-cli-27.0.2 | 1 
                  fbdump-0.4.2 | 1 
                   foot-1.16.2 | 1 
                    frotz-2.54 | 1 
           ghostscript-10.03.1 | 1 
             gnuradio-3.10.7.0 | 1 
         gobject-introspection | 1 
            host-binutils-2.42 | 1 
 host-binutils-bare-metal-2.42 | 1 
                 host-gdb-12.1 | 1 
                    htop-3.3.0 | 1 
          imagemagick-7.1.1-31 | 1 
               ipmitool-1_8_19 | 1 
                iproute2-6.9.0 | 1 
                jemalloc-5.3.0 | 1 
          libcamera-apps-1.2.1 | 1 
                 libcoap-4.3.4 | 1 
               libdeflate-1.20 | 1 
             libfreefare-0.4.0 | 1 
              libopenssl-3.3.1 | 1 
                   libsha1-0.3 | 1 
              libtracefs-1.8.0 | 1 
          linux-5.10.162-cip24 | 1 
                   linux-tools | 1 
ltrace-82c66409c7a93ca6ad2e... | 1 
               mariadb-10.11.6 | 1 
                memtest86-6.20 | 1 
                     mtd-2.2.0 | 1 
                openswan-3.0.0 | 1 
                      opus-1.4 | 1 
         python-remi-2022.7.27 | 1 
                ripgrep-14.1.0 | 1 
rtmpdump-c5f04a58fc2aeea629... | 1 
                s6-dns-2.3.7.1 | 1 
                tpm2-tss-3.2.2 | 1 
ulog-0389d243352255f6182326... | 1 
                wtfutil-0.41.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/7f69938d9e38d90e3f1dde7c538734777af01d68 | ORPH
 microblaze  | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/a368df04f52cd30f0b604b34d23ca3b35400bbad | ORPH
   mips64    | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/e35aac7b90903fcb65f4eea7de82950fe0c72335 |     
powerpc64le  | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/01c888f023909001d2fec7d0a433b35eded757ec |     
   mipsel    | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/f62359d98383d673ebe03952dc436bab1e4c9c39 |     
  sparc64    | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/553f64a2fedc075f9bb759ef80d7de23bcb8d7cc |     
   sparc     | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/8de7f81f915612ae2aff59767e677fd9babc21b6 |     
   nios2     |         apache-2.4.61          | NOK | http://autobuild.buildroot.net/results/6994254c1fcfeebdc0ea65ff551bd6dcf991932c |     
 microblaze  |           apr-1.7.2            | NOK | http://autobuild.buildroot.net/results/7eae24869099672a3f24973376424df66008eb4c |     
 microblaze  |        arp-scan-1.10.0         | NOK | http://autobuild.buildroot.net/results/bef451c07ba1c7e00cde12122e97317d1ff826b8 |     
powerpc64le  |      at-spi2-core-2.50.0       | NOK | http://autobuild.buildroot.net/results/57e1e7a0f671e07b4c738656ac8c136bec274b01 |     
    mips     |           attr-2.5.2           | NOK | http://autobuild.buildroot.net/results/ad833fba6357733a2ffab9fa8e15efd1b532c5e3 |     
   mips64    |          autossh-1.4g          | NOK | http://autobuild.buildroot.net/results/903f38a77105c57edef423d7324555ff5105ece7 | ORPH
 microblaze  |          autossh-1.4g          | NOK | http://autobuild.buildroot.net/results/f68b8f48243b6597fcb01dd0597bfd7f059b8efa | ORPH
powerpc64le  |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/bbff42aea00799b9ddb619ad3e5f491ddef5d1f9 | ORPH
   x86_64    |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/476964fe65d9d9c67f4081ac3ee4a5f099fddbbd | ORPH
  riscv32    |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/ba78ad0260a045f1f37ebb364361b41b4365fe75 | ORPH
 microblaze  |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/94d17d12d6dd32ad6731e194512dedf3e685d0c1 | ORPH
  mips64el   |   bandwidthd-2.0.1-auto-r11    | NOK | http://autobuild.buildroot.net/results/f4cf355698611f78b2e0eaf46ab6d3eb6e231aa8 |     
 powerpc64   |   bandwidthd-2.0.1-auto-r11    | NOK | http://autobuild.buildroot.net/results/effe3bea6f98b7de11b06a6a4e601db17b2f9196 |     
    or1k     |   bandwidthd-2.0.1-auto-r11    | NOK | http://autobuild.buildroot.net/results/72e1e5d1844afb70e110c552fa0fece24675c7a8 |     
   x86_64    |           bat-0.24.0           | NOK | http://autobuild.buildroot.net/results/15335ebcdd96a531f9381633f407cbff4d9729c7 |     
   sparc     |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/ba447aae904751a4b575104f4daf4b3cc0ea06d7 |     
   mipsel    |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/5cfa1dcd9539dc73b1f2ea590114d8d76e15b85a |     
powerpc64le  |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/d62005022ad2b2aff9d2de901c4674c58e50bc55 |     
    i686     |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/89da1a8287f6248ccab9679ca0becd6437b73a56 |     
    arm      |         beecrypt-4.2.1         | NOK | http://autobuild.buildroot.net/results/ecf34ba729a610aa7405b6aa92ae5a167d3a9249 | ORPH
   arceb     |  binutils-arc-2023.09-release  | NOK | http://autobuild.buildroot.net/results/7697a799280c9a3832bfe6c6deef33224d790e0e |     
 aarch64_be  |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/3683190746b618bc7758be1f9c3b108a75da7190 |     
  mips64el   |          boost-1.83.0          | NOK | http://autobuild.buildroot.net/results/f337375b0a3bef75388be20adaadd4e9cb72c96c |     
  riscv64    |          botan-3.3.0           | NOK | http://autobuild.buildroot.net/results/08aaf3fa3fa82f8a8aaa45e53b5d7283ada4f17a | ORPH
   mips64    |          botan-3.3.0           | NOK | http://autobuild.buildroot.net/results/9d96f702c771561025e2609c66aaaa695e347f78 | ORPH
  sparc64    | brcm-patchram-plus-95b7b691... | NOK | http://autobuild.buildroot.net/results/c7c41bb6d1e5445f66f986d052b3720123f8fe01 |     
powerpc64le  |           brltty-6.6           | NOK | http://autobuild.buildroot.net/results/0aa03b046b4db251515d6d314f4e404205d4c828 |     
   arceb     |          brotli-1.1.0          | NOK | http://autobuild.buildroot.net/results/c9179b3d9401028359a78508a225ea7bb769e76d |     
 aarch64_be  |         c-icap-0.5.10          | NOK | http://autobuild.buildroot.net/results/b1695a1213c45d00d480133041cab2b05c2bba42 | ORPH
   armeb     |        cache-calibrator        | NOK | http://autobuild.buildroot.net/results/432303a73def1756f5338e05eded76c1bc00c981 |     
   sparc     |       can-utils-2023.03        | NOK | http://autobuild.buildroot.net/results/474a0c996840c33c3eec7778f345ab5b17385eb4 |     
   x86_64    |         cdrkit-1.1.11          | NOK | http://autobuild.buildroot.net/results/771db6c1e043cca70af3909167b2b339b3330af3 |     
   arceb     | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/29264ef3b329ccb7de14642d88ab02162573c844 | ORPH
   xtensa    | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/58c73550a1c99e267662fca969494ce0ba64f741 | ORPH
 aarch64_be  | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/d7391e62cbaa4aad1a7f00b29ec501a860c2997f | ORPH
  mips64el   |      cloudflared-2024.6.1      | NOK | http://autobuild.buildroot.net/results/42e149434ad2bf0eb789c5031dd26eee66d8daae |     
  riscv64    |      cloudflared-2024.6.1      | NOK | http://autobuild.buildroot.net/results/dbe7d49853f4b59db73c931014862ab0bba2fe60 |     
    m68k     |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/ba111ea38590a2a00655993222b08b1829339ae2 | ORPH
   nios2     |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/1479f94ee82fe5a53c5933ef9f2c03899d7c8c2f |     
    i686     |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/3e1a267e7ee578302f7b8d1f56e537faa8ff6d17 |     
 aarch64_be  |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/be7f8efe51098d567b460c6e56a7e93bc8cbe611 |     
  mips64el   |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/0be10b105966914432186f0857dc237df8523cdb |     
   x86_64    |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/22cfb86cb4c894235a98e19c32b7fcb707e3b437 |     
   nios2     |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/071461192e324a2b7ac2933d029a45338433696e |     
  aarch64    |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/2ed4ba2a8261035212bb0bb6e133eb2d9f6f8626 |     
   nios2     |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/4dceb1a6f8efbf69a46dd484f506c147349da4e5 |     
 microblaze  |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/771bc1dde2181ffb04a9dde04ece159f83cc807e |     
   mips64    |      cryptodev-linux-1.13      | NOK | http://autobuild.buildroot.net/results/a1f9591af559b1d5e713b2b2b090f89f77f4bb81 | ORPH
   s390x     |       dahdi-linux-3.3.0        | NOK | http://autobuild.buildroot.net/results/ca17c69d2f2c1d6a62273f0d8313a480d5376d17 |     
   sparc     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/680d00f9787da2fa79e83dd4da55e39fd0f07e82 | ORPH
    or1k     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/df7ce539fe0939223704ba31cd7197a97c27b0b5 | ORPH
   sparc     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/3d0f4c5480ffc5f21ff80fd19c3f32f0ad684f4f | ORPH
   sparc     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/2c813b22b5653edb17e13ae8ee8460813be085c7 | ORPH
  riscv64    |       docker-cli-27.0.2        | NOK | http://autobuild.buildroot.net/results/f6d956deb46ca03afda197fb28c4d60de5899222 |     
   sparc     | edid-decode-6f117a8f8c0e76e... | NOK | http://autobuild.buildroot.net/results/16779cff4ba83f9318ba2589e927a9c799b896db | ORPH
microblazeel | edid-decode-6f117a8f8c0e76e... | NOK | http://autobuild.buildroot.net/results/deed1d3a0ebff7b1ba880b06d61bfea5056c41dc | ORPH
microblazeel | edid-decode-6f117a8f8c0e76e... | NOK | http://autobuild.buildroot.net/results/fcac392f952f45526d0ecb4bc905e578b8cf8008 | ORPH
 microblaze  | edid-decode-6f117a8f8c0e76e... | NOK | http://autobuild.buildroot.net/results/4b17108cab622e3fcca90c4fa87b0daaa646dd21 | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/4ffcdf3c4eb0891966ddfeea6b6cafd7d858bc24 | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/a58fdd1914380001dd18a109476772aaf0ec09ce | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/89da5f91d9baac2bc92439ef817e86b4faa76152 | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/3ca32f24b57d67245e505edb6f3a2f9eadc53864 | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/a060c3b1d5c5dc43ae0fd659ff05bfc3aefef21b | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/4ba667d554ede6d19a4cb49345375a67595a9fde | ORPH
  mips64el   |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/9c78fc1a0d8c9f9b4c7aeb69d90ee0abf7d2e031 | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/190652d6283887b88f8e1a203d4f5a23015909cd | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/323626c2c719295bf0a352e42a5a010283838996 | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/a4b498d8bcd1d831524cb2b8c7b8d9f065740ad9 | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/39cd7446ff12c6a61d6f5e1a090b13f2287339c2 | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/468783ea074cdc7553c82821a14321ba76323c75 | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/552fe47759ac9a45f349929286785a03e1ed75d3 | ORPH
  aarch64    |          evemu-2.7.0           | NOK | http://autobuild.buildroot.net/results/37a71698054d400a7486d41429082f8257d02451 |     
   mips64    |          evemu-2.7.0           | NOK | http://autobuild.buildroot.net/results/e88c3921bf79ae9ab7c68202d74776efcfcd9b75 |     
powerpc64le  |          evemu-2.7.0           | NOK | http://autobuild.buildroot.net/results/e29dad25c5083b90f1cd365549aaab61317bc436 |     
    i686     |          evemu-2.7.0           | NOK | http://autobuild.buildroot.net/results/af9e2b9df973a9174788afb8189c4e4305a4e33d |     
 aarch64_be  |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/e19f9d4b77250d01a9375110def535c8134f7668 |     
  mips64el   |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/e8ef5fd7461fdca0400856cc9fe2e1f7d5d96a6d |     
    m68k     |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/4be53db40f88ee0eb4395d7b1ecc2a15e8cb3f38 |     
    mips     |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/7b9adcd7d0ed0b8ac103d64b79b99b233cf5459a |     
   sparc     |          fbdump-0.4.2          | NOK | http://autobuild.buildroot.net/results/87ac62c4930eef6270ccb5aef538b61c725f79f4 | ORPH
   arceb     |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/e3df349c25b91ee230e8e5fd934873a6949235a5 |     
microblazeel |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/38ef89695bad158273a36eca7976d1f406a5b77f |     
microblazeel |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/7f8bb6c9a8940a47fe965843b82a15161141d9b9 |     
    arc      |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/77a051747f47418579a8fe963a5d2130663c0cd4 |     
   arceb     |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/f00e0c721873c777e773b0f393e865b5ffcddb22 |     
   armeb     |          foot-1.16.2           | NOK | http://autobuild.buildroot.net/results/7cff681d572416aeb55c1d81031d5f23d6adf0d8 |     
  riscv64    |           frotz-2.54           | NOK | http://autobuild.buildroot.net/results/566630f654e770c9de1368f563a8520315466fc2 |     
   sparc     |      ghostscript-10.03.1       | NOK | http://autobuild.buildroot.net/results/1ab4767c1198838c3e3d126cdba790197d102053 |     
 powerpc64   | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/0e6d53eb043fe49543a3a66bf753dba904dcb79c |     
  powerpc    | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/f170b68ab1b699dcdd19155477dd7e9678770af6 |     
    arc      | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/91bf113e7059bae121cbf298286860e9a207f6b6 |     
 powerpc64   | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/b65556cc2fcc540b618fe234312dd18da7cbfab7 |     
   armeb     |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/529e148ee1478088ff5ed73923ef5f5a3bfd6552 |     
    arm      |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/0f961bb43158b90fc97eb75d75089a6bddf3e8a8 |     
   armeb     |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/5301a4241aa0ff07d599474cab1b6d263ab781c8 |     
    arm      |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/d45f1da808f30ae24fa1cc612ef6c2ee80fc1fcf |     
   armeb     |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/8c21a82f0000d1e9225e7ab48e0673880721f53d |     
    arm      |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/7de1c4e99bbc52145a70aa9ede5530e7c5cce22a |     
    arm      |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/c61396375be939beff95bc16a172564285a0461a |     
    mips     |         gnuplot-6.0.1          | NOK | http://autobuild.buildroot.net/results/9cf474301cda7a0e40ed1ff13500a7926d13f4dd |     
    or1k     |         gnuplot-6.0.1          | NOK | http://autobuild.buildroot.net/results/33add16bcaef0076b30ea95a77631d9bdccebdaf |     
 microblaze  |         gnuplot-6.0.1          | NOK | http://autobuild.buildroot.net/results/e121ae44e10860a693df829e2a5c7b9978721fcb |     
  sparc64    |       gnuradio-3.10.7.0        | NOK | http://autobuild.buildroot.net/results/977887775473e08b15a7fe6ec31e0619dd486c72 |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/321cb64fadd6e9fb6fa5713cd8172978203a4642 |     
 microblaze  | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/74820d62672c1c93620b705f6037c332e2574cde |     
   s390x     | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/e745dfee45f961c111f0b08f0068bd624034961f |     
  powerpc    | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/1830ce8ec737ae92e5308e94211c7cd88e47336f |     
 aarch64_be  | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/3f4dc588b046e1fe741fed1e52355d489d2a3b8a |     
    i686     | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/c70058c7eec340beb872045cf899e19eaf6a0110 |     
 microblaze  |       host-binutils-2.42       | NOK | http://autobuild.buildroot.net/results/47b2c66b02fbd6dd4f315017821bd7b302979094 |     
microblazeel | host-binutils-bare-metal-2.42  | NOK | http://autobuild.buildroot.net/results/afab26e13966cc0f77e779c84e6d0bb68df360a7 |     
    arc      |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/5f629e552ae1ea840320df2689f94c24426fd68c |     
    arc      |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/5e18e728383a66bed11e4339d470a6b3ddea80ea |     
    i686     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/35f5e690fb3b8195a042c0c252a3be22065f20c0 |     
   nios2     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/9b740c118dba62cd9a9dba0c258ae941b40b9772 |     
 powerpc64   |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/ec982006f0f4e00ff9230506d32c112252b5fd03 |     
powerpc64le  |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/4d313535a002f156132ff236281d792cac2506ab |     
    arc      |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/737d6b2b01dccb5f41145c2fdc60be9ccbc28298 |     
    mips     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/9d6349939fc64733adef91c046dcc88c9d6d9bd1 |     
microblazeel |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/6e604d8268b9fbe6104ac88046409010e1c3462c |     
    or1k     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/bf9d7c1d603949418224256b6e155a209469482f |     
  riscv32    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/b24a52f65a95f28c1f1dddfb7fdc86358373b8e9 |     
   sparc     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/ecd6baf50dd1fafe831ed880e6420f017ecc7736 |     
powerpc64le  |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/1063f255193cc6058338ce5890648c942d35290d |     
 powerpc64   |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/76e8ccedb21f34c520ca50190cea78dc4bb7f727 |     
    m68k     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/0a1a7fd9f3b72bf3974d61267e4242c4ee449ce7 |     
   s390x     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/80508a46ba14d3371e3e1dceacb8db57359e1c39 |     
 powerpc64   |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/60eb26a07ff5c497cc95b4c537b201f1882c130a |     
   armeb     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/7f0551086e358a4ef3bdd7f672a18c4953c6b4ad |     
microblazeel |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/41cbc51203f5fe73bd040ee7f6e96c9451fef38b |     
 microblaze  |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/6769b1f9daa1ec08e3427e344f1e93cfa07b0390 |     
  aarch64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/650315ba961bac33a0a69bb0579fc20f2a8c691c |     
   arceb     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/913073990143434575a39cb04c8103f86a10bb88 |     
   sh4eb     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/865c5fd302479ca4eae8c5ce06bcda71a61225bf |     
    arc      |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/3542a6b2f9b6442db4b3d8d152d7129fd7912759 |     
   xtensa    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/ce209177a81ae4bd5411906c71ede6429ed63827 |     
  sparc64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/799790402c3f0eb5de379531599b66740f8f0ae9 |     
  riscv64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/e2e16d21f793c6984b9068b08955ee2b4d6c5907 |     
    i686     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/56f889ac5a4ca9720c870e088364b03934bf5606 |     
   armeb     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/90b973679870dddb135fa87c4e9bb321ec6f8261 |     
   mips64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/e966e5fcfef22efa699bd3a4afb3e7b8c79080d2 |     
   nios2     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/4246ace74e459b42215314246393f4431aebbe6d |     
    arc      |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/5d897d31dd9b9f8b61a4b8c77f2298f814e1668c |     
   x86_64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/9faa54c83a71abd936ab0db66c56b956ad152dce |     
   s390x     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/1be9765123431d9c9cf123500320cf6a03d96478 |     
powerpc64le  |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/eda0cb56b8ea4cdcd3ab1068a7b40fc60b303a23 |     
 microblaze  |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/94cf48999485c3a78fadf3156a4fd6149567bb81 |     
   armeb     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/b046cf58d84717da16da25be2d26b22da4f07695 |     
   x86_64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/793e008c7ef2cd0204be01f071f0887290f17b97 |     
powerpc64le  |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/c708194d01ee2086822e19cdccf4aa5d94835fab |     
    mips     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/a24ab20877950d11ffe7132764317788ee8f3667 |     
   nios2     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/2b04487fc2deb1f81e0ab0aa2bf6c40bac60b92c |     
    i586     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/a120d53a3d55284c8dde7fcf5795939fa3d5d311 |     
   sh4aeb    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/4cd119c9b7263095b1c284d637f50fe0d6cc9add |     
 microblaze  |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/d7a3079964cb3a873d567f632d8c5c30be463c00 |     
microblazeel |     host-gcc-final-13.3.0      | NOK | http://autobuild.buildroot.net/results/ad605cc6c7b58f806c10c7fba583a18c714214ab |     
 microblaze  |     host-gcc-final-13.3.0      | NOK | http://autobuild.buildroot.net/results/f4f11875bbd24cd412306a9ecb7e5e270b1a6c94 |     
   sparc     |         host-gdb-12.1          | NOK | http://autobuild.buildroot.net/results/3f65d22bd5557da67ad4d5e827424df1c2bda6aa | ORPH
  aarch64    |      host-gengetopt-2.23       | NOK | http://autobuild.buildroot.net/results/fa669a89081053a0ba24b981a170de977b91cbf4 |     
  aarch64    |      host-gengetopt-2.23       | NOK | http://autobuild.buildroot.net/results/4c74156421a9355c84165e4d07249c33a9ca76bd |     
  mips64el   |          host-go-src           | NOK | http://autobuild.buildroot.net/results/e1f76b57752d4bb883e3f84f24064d2345da8e8d |     
  riscv64    |          host-go-src           | NOK | http://autobuild.buildroot.net/results/f2272f5368301ec3288c651d33fbe4976ba4dd59 |     
  riscv64    |          host-go-src           | NOK | http://autobuild.buildroot.net/results/9ebb332f0661975ddb3d12f9a7526cf87e6d78a4 |     
  mips64el   |          host-go-src           | NOK | http://autobuild.buildroot.net/results/f2cbd2d965144d5e9f0832af1c00fa2de845d81a |     
  mips64el   |          host-go-src           | NOK | http://autobuild.buildroot.net/results/a92da4ef86b4a1eb298df0bdd96d6a413d1bda4e |     
  mips64el   |          host-go-src           | NOK | http://autobuild.buildroot.net/results/c79f9ff03db936116a7e6d51e5590f0c480951a8 |     
  riscv64    |          host-go-src           | NOK | http://autobuild.buildroot.net/results/444aacc9cf2a98bdf39e7a2e0f2b76384cd9738a |     
    i586     |          host-go-src           | NOK | http://autobuild.buildroot.net/results/57051c7873fda2a4d6d656d3df177873536f46b3 |     
   mips64    |          host-go-src           | NOK | http://autobuild.buildroot.net/results/8e119f4236ea6b6674babf6c1f639a2a9a949ed5 |     
  aarch64    |          host-go-src           | NOK | http://autobuild.buildroot.net/results/1f4b9882986b9df723a1446493d270c29287b505 |     
    mips     | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/5414ac6ab318041cf3d0c6240083a1bc079722a8 | ORPH
 powerpc64   | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/60b015905621fdd2082d04fcc5ccbbecdccdad6b | ORPH
   s390x     | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/a23cd77a3e8d0497bd882ace28666aae7e58b8a0 | ORPH
  aarch64    |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/d6c8c7420deb2e4a77d6389b5467cce245a20802 | ORPH
    sh4a     |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/bcc002cd71881a15d5f7354db9c5812abae8569a | ORPH
   armeb     |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/c1f18ef70c7ea9723d39599129c3853dc12bf74d | ORPH
  riscv32    |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/abae42c18dbca04a7033c953e0a2b46e0ee2eff8 | ORPH
  sparc64    |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/9cb754aaf06138ed8fa1a66e181bca61a76f4615 | ORPH
   armeb     |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/eeee54c1f31da3226f6a97158bc1a5f03764bcb7 | ORPH
    mips     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/6c7fcd4ec98150fc802e17337ab32d01749faa41 | ORPH
  mips64el   | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/43cc9ea8326ea1dcce5040e42cc1af5ce70f8edc | ORPH
   sh4aeb    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/d26de0c1ec36c334d4bb315d4bf63abd56ec4698 | ORPH
   nios2     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/0ab71d0193f80dde35fba82039b58c0bb671044f | ORPH
   xtensa    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/f5ae2bb467ec4c8b10582f783ea8af8b243af597 | ORPH
   armeb     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/706f8b8dbfcb2a14616a02d7c9f93a0a5de4e252 | ORPH
powerpc64le  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/a772b8b738350b86a84915ba7b63cf04c1561858 | ORPH
   nios2     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/4e6173411ad61789221b7396e87643d9771cd190 | ORPH
   mipsel    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/4d22d66ede47913c8362116c309ec57412fd67db | ORPH
   s390x     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/f2bfc60fb0fdfff98974171ab009ad3c94883f76 | ORPH
    i686     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/e8edc57e17c18f6e1650d5c83bdbba5c60e3108b | ORPH
   s390x     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/958fe4d4b1e81663d7662e9708dabf774f132661 | ORPH
   sh4aeb    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/d4354f26949391f894f5f045e09346a31b4845d6 | ORPH
    or1k     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/46b729a73483603624f990cc000cdcd7d9e42d9b | ORPH
    arc      | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/c2cfd4a46cbb783799dce0237ef5c6029e46448c | ORPH
   sh4eb     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/716f3af9281f9d066e889dcd504dd0cb686094f9 | ORPH
   mipsel    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/8540ad7df3be7ef685882fb006250bbd7144e962 | ORPH
    or1k     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/4f016a20ef7b5421c637a39721773838302d1b9d | ORPH
   armeb     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/14b7c0891ed186b2f2cfb8d3568451e78a69ab94 | ORPH
    m68k     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/9ab592d72f6b93d4c75a7a86619e55f881ac7dc6 | ORPH
 microblaze  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/70fd81d7748083feaaccd021592d68419b29a45b | ORPH
   x86_64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/25171fff7d3ddadebbb0f3f98c017776e734224f | ORPH
   sh4aeb    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/3e0e2a4c7bd616d04e6b4e8ae0c52f73df4eef24 | ORPH
   arceb     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/295223295e5e056c223e69bfdaf02e05f88a808d | ORPH
   nios2     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/fa7311abd237be094edcb8718454082b76e5a217 | ORPH
   mipsel    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/8c338f7355faebad49c6372da1e7aa6fb5b8758f | ORPH
 microblaze  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/ed9af6aa4fe4f0c362430bc7ab7b4f7b9be5dfd5 | ORPH
  sparc64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/1b7a592304ca6659e74896a9f61b656938cbaf99 | ORPH
    mips     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/ff95bb0474085d0e86b579a85e95fcee44874774 | ORPH
    m68k     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/86578285f7d9d5830ba3ed6eff8df90c4bbe985f | ORPH
   nios2     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/223d7d9c461576a9606c1a806624af31e788db07 | ORPH
 aarch64_be  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/8b53531751384195fd4aee90afa55fbb6f3e24b6 | ORPH
powerpc64le  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/bf385f83f8c561459b742dc0e4e0ba272eaf9beb | ORPH
   mipsel    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/256c544e603b4ec93c13cc4941beb3a1dda47c44 | ORPH
   x86_64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/3c5e6cd6697333c93152a0e3f368ff10fc99845a | ORPH
 powerpc64   | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/31aaa6664e1f77e0160c055f89ea9cd9bb34eccb | ORPH
 aarch64_be  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/eefca804696f3779baff469b66b953deefcc5e2f | ORPH
   mipsel    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/4fd85979aff18bd988addc19cbc39f997e4c6715 | ORPH
   arceb     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/f3ffcfe44b4b0771a9f7f5c0f431ee1531b2b5c4 | ORPH
   nios2     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/60dfd43b819df426013c1850b35fc77379847b7e | ORPH
    or1k     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/9ba10bd45fd3409784d3decf697d811bd37cf50a | ORPH
   sparc     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/fe6e69386d1e46e165d89ed9be52346373d64a28 | ORPH
   sh4aeb    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/4012f755936f48a48d5f15fb8351d8530e64dc84 | ORPH
   xtensa    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/f6c543c08607a09ab6135c079812c29c0c936565 | ORPH
   arceb     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/6410725484ec42c5a62794ffed8719bd3d591cd4 | ORPH
  mips64el   | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/9e97a5d8724ccab40c097246dbea773efbc7423c | ORPH
   armeb     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/80939019a8334e53c86d305a55eadcdeb03c21ce | ORPH
   sh4aeb    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/e9c37c1b12e817217a7391143c905ad5bdb9e29d | ORPH
  sparc64    |        host-rust-1.79.0        | NOK | http://autobuild.buildroot.net/results/a84cdfd0efa91af10d7877b6ab1a36897f8eb494 |     
   x86_64    |        host-rust-1.79.0        | NOK | http://autobuild.buildroot.net/results/e7d30fe084684a486384a4bf430e9f96d9548bcb |     
  aarch64    | host-softether-4.30-9700-beta  | NOK | http://autobuild.buildroot.net/results/982856110c3c37bd458e45de539c2e27bb6f1507 | ORPH
    m68k     | host-softether-4.30-9700-beta  | NOK | http://autobuild.buildroot.net/results/4cb695d236709129f31c69e2a344b723db118eb1 | ORPH
 powerpc64   | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/7ce958df03179477c2849e9d658c5f4c473bbb8c |     
   sparc     | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/a13e272a258b33990b6cd6469e7d50f740235d43 |     
  mips64el   | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/9b47be4f2721b38c8bb0ef729c7b9558b33bff65 |     
    arm      | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/820d682fb38a57f0f92ca0301142aa120f32dfaa |     
   xtensa    | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/472fa95f4e17845a44f10a859e083f394d7c6013 |     
    i686     |           htop-3.3.0           | NOK | http://autobuild.buildroot.net/results/f74e61160854b299df7f88c874b74b86a1fcb70a | ORPH
   sparc     |          httping-2.5           | NOK | http://autobuild.buildroot.net/results/355187b356ea909e9bc8d8e722dcb7acfadf710e |     
   mipsel    |          httping-2.5           | NOK | http://autobuild.buildroot.net/results/8680ae4e731159dbf344340c32c1fffddcbd00d4 |     
 aarch64_be  |          httping-2.5           | NOK | http://autobuild.buildroot.net/results/38779871b160a7b4bfbc64da08c9eb5d319bf643 |     
    mips     |          httping-2.5           | NOK | http://autobuild.buildroot.net/results/add9a6713889f5d481f27875d41e76dfeacee65e |     
    arm      |          httping-2.5           | NOK | http://autobuild.buildroot.net/results/d11c394362fcfab69fbed1bfee9ff952ae6315c8 |     
   nios2     |          httping-2.5           | NOK | http://autobuild.buildroot.net/results/7a6fa361f4d0fa8ade32ab2911736a3b3fda5c05 |     
powerpc64le  |          httping-2.5           | NOK | http://autobuild.buildroot.net/results/2d93bab24f58d1203e2d78b08084d3153052fed8 |     
    sh4a     |          httping-2.5           | NOK | http://autobuild.buildroot.net/results/a7de0c9eda70ed80509707ae97e7da09b22a5132 |     
  sparc64    |          httping-2.5           | NOK | http://autobuild.buildroot.net/results/25c7aa764e982d47916f544b121959bf147b913e |     
   x86_64    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/3c6dfe07015db830e2fcbbebdd1b47627deac3f9 |     
   sparc     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/12671968481996e60a8181bd32ba8377bf6a6247 |     
  mips64el   | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/2cfd3432804f3a9f0b5c9e8aefad6238cafa225c |     
   arceb     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/84d67daf3b6de0324aa92b5d7fe3320664d4770a |     
   sparc     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/bf0308d8ea45dc36426271e905dfed809eed69c3 |     
    m68k     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/0a18f3ae7e4850110ca97436da5399fecc4e12be |     
   mips64    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/dd41ff7727dfc7ee7cb23d33555e402c24526179 |     
 powerpc64   | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/c193e58b4ce49b9d2e9ab81e7e9018c5fe445c14 |     
    m68k     |      imagemagick-7.1.1-31      | NOK | http://autobuild.buildroot.net/results/e08e47973703b37ce6e422d51f00475130b61931 | ORPH
   s390x     |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.net/results/37113ecd17c23563a890bd153323119c5ec6ace6 |     
  mips64el   |         iproute2-6.9.0         | NOK | http://autobuild.buildroot.net/results/2f230d9986c78bbe51e92eb8037fe73679c75969 |     
  aarch64    |          jack2-1.9.22          | NOK | http://autobuild.buildroot.net/results/b319e75435fb04610bbea09db21da494f244f900 |     
  mips64el   |          jack2-1.9.22          | NOK | http://autobuild.buildroot.net/results/0903b20536f8e69f7a1239da518f27b47f5d110e |     
    arc      |          jack2-1.9.22          | NOK | http://autobuild.buildroot.net/results/175aacd8f86ee68bf7ca617208f12e0720f4a313 |     
 microblaze  |          jack2-1.9.22          | NOK | http://autobuild.buildroot.net/results/10879a49ef060acda72e0a8fd54b3222b454dad0 |     
    or1k     |          jack2-1.9.22          | NOK | http://autobuild.buildroot.net/results/63433e4a01a7448bcbd6ec471a4223b81630291b |     
  riscv32    |         jemalloc-5.3.0         | NOK | http://autobuild.buildroot.net/results/7e2d24faaab65b0fe2770a8f6197689420148409 |     
    or1k     |        libarchive-3.7.4        | NOK | http://autobuild.buildroot.net/results/2cd46dfcd3964eab0bc3c564c2b8595ebda7195d |     
powerpc64le  |        libarchive-3.7.4        | NOK | http://autobuild.buildroot.net/results/fea23b6e115f290e64a2f97b0bd73658f48bc652 |     
    or1k     |        libarchive-3.7.4        | NOK | http://autobuild.buildroot.net/results/08f07a1ac072ea6b7645e3e245b2e88e3762be1f |     
    or1k     |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/c750c80087c003c5d87296383138899c4e9b07ea |     
 aarch64_be  |         libcoap-4.3.4          | NOK | http://autobuild.buildroot.net/results/85ebab4e353f38bcf08e3a7c7cb80e5e7e4d4e29 |     
    sh4      |         libcuefile-475         | NOK | http://autobuild.buildroot.net/results/44d42c1c1351756c7c324121f3fca0c3b2473d31 | ORPH
microblazeel |         libcuefile-475         | NOK | http://autobuild.buildroot.net/results/43038de3cfc2a01e74b381e2f938970e8044e4d7 | ORPH
  riscv64    |         libcuefile-475         | NOK | http://autobuild.buildroot.net/results/c3fcce1cbd4f71a515095b06a8c9841fc2f959d4 | ORPH
  aarch64    |        libdeflate-1.20         | NOK | http://autobuild.buildroot.net/results/25b685a880eb9dd3c9764b4b6f38edc6f340eae9 |     
    arc      |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/dba3b0c34b6e12c261eeb475ad92d3f5c29de005 |     
   arceb     |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/8afe7c8bcad018d21c02472aad86f82dd03b77ea |     
   arceb     |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/edd5310aece0ea697a25fb639ee442c48d492729 |     
    i686     |       libfreefare-0.4.0        | NOK | http://autobuild.buildroot.net/results/c3b9e4c9522e4b8883219e5d40c1957694dfeaf5 |     
   arceb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/e5f386b937c10c2fed35e4820f9bc7dee1d0a7c3 |     
   arceb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/798fef11856836b89f9eebdf2b01ae0cbff31dd0 |     
    arc      |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/306323ab70cdde7ee6cea65daf640f950c30a37f |     
   arceb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/dbfa35dfc3eae1710b712cae1d95a333f9e2b108 |     
 microblaze  |        libopenssl-3.3.1        | NOK | http://autobuild.buildroot.net/results/551a1accb8d59e73f444ba1093a6b943eab5df98 | ORPH
   mips64    |         libp11-0.4.12          | NOK | http://autobuild.buildroot.net/results/3b1aef3f117a5bf0d06e1b6a061e46869338b42c | ORPH
   mips64    |         libp11-0.4.12          | NOK | http://autobuild.buildroot.net/results/d80003420a171a0afe22dab9377a28624677e3d6 | ORPH
   nios2     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/33b3297c39bfe8a788ad75753ad0686190ccf456 | ORPH
   s390x     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/c34c3909947c090fda4c1f1f993b0c2450e13767 | ORPH
powerpc64le  |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/4ce0ca54429534f1518fa8eebe50672745066245 | ORPH
   sh4aeb    |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/47d6eaf5ce0d66e2929eae527203609c3eb30309 | ORPH
   arceb     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/c2f4a264e5b97cd0c39f3191bad2e57847972280 | ORPH
   nios2     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/430e564662a579424a136734e95a19dff1430f21 | ORPH
   nios2     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/3913da7a3b806df7f76b46aea5f8a29b5655c15b | ORPH
   nios2     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/5179e59f13cb75f4b803aa147cc4ac91e340d96f | ORPH
   arceb     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/e6af250e8203c2ecff976844ee2a490f3d7ee130 | ORPH
 microblaze  |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/6e4e1199243b624b751fc8d38c6985861fbdf934 | ORPH
   armeb     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/3ec173d1990eebff7774af5394cee8593760b648 | ORPH
    sh4a     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/83410111f0af7daade4cb4c060f7b586fccf01be | ORPH
   sh4aeb    |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/b3841e4a8495730ac02e92527a78e3bc8514a539 | ORPH
    or1k     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/e9ab6a8677856561714a31f90e6382c0c77d5e25 | ORPH
    arc      |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/5e3ae1d8df4f31abdd754a095903e3bbcc9b033b | ORPH
    arm      |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/5bf385a89cf6db6ab2732c3429b08fa47867811b | ORPH
microblazeel |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/d7ee737c2ed23e957530aa304bdbe2ee381e7457 | ORPH
   nios2     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/3e788d3ff8c4a479d3f54b9601b4a7c5d61ca27c | ORPH
    or1k     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/e3fbece8b2de3b7fcdfcb079816ffc2d1c5a014d | ORPH
microblazeel |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/07615260bdaf120e8000e63d88770a88047de7d5 | ORPH
    or1k     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/a6303220dec0430ecdb5a89a1fd04df06e4a1da2 | ORPH
 powerpc64   |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/34ad213568b41db784246372ef88c8ec1d7daa00 | ORPH
   armeb     |          libsha1-0.3           | NOK | http://autobuild.buildroot.net/results/9d4e036b799fff28a8f5aa6906816e770ec35ddb |     
  riscv64    | libsvgtiny-ea9d99fc8b231c22... | NOK | http://autobuild.buildroot.net/results/790d533748c61597b471fa511eb7360b4f28cfdc | ORPH
   arceb     | libsvgtiny-ea9d99fc8b231c22... | NOK | http://autobuild.buildroot.net/results/9c5b439bc8bd26370858e764d35bb2549592e10e | ORPH
    or1k     | libsvgtiny-ea9d99fc8b231c22... | NOK | http://autobuild.buildroot.net/results/c4065b1509ed97c31b49eac16643f2a689cc2c55 | ORPH
  mips64el   | libsvgtiny-ea9d99fc8b231c22... | NOK | http://autobuild.buildroot.net/results/960d74b0e537f5b9930e83d53446ce0dcc3032a1 | ORPH
    m68k     | libsvgtiny-ea9d99fc8b231c22... | NOK | http://autobuild.buildroot.net/results/a0b2802e66a7ffd5c16ce429719ea9b1ac0ffa3b | ORPH
   nios2     | libsvgtiny-ea9d99fc8b231c22... | NOK | http://autobuild.buildroot.net/results/0d0badc9cd65747c2cfdb752bf1e0cefef0e7290 | ORPH
   x86_64    | libsvgtiny-ea9d99fc8b231c22... | NOK | http://autobuild.buildroot.net/results/556a9c8dbf385c949e829496f3b276ad4e3c75db | ORPH
    arc      |        libtracefs-1.8.0        | NOK | http://autobuild.buildroot.net/results/248b9b89adfe5ff959657de771cf5c086d239839 |     
  mips64el   |         libxml2-2.12.6         | NOK | http://autobuild.buildroot.net/results/5d3170d2b21303868890f8dc3637b31f7e5fb7cb |     
   mips64    |         libxml2-2.12.6         | NOK | http://autobuild.buildroot.net/results/2cfa9c8c832830d33316b6c9b956e51e513ac92c |     
  mips64el   |         libxml2-2.12.6         | NOK | http://autobuild.buildroot.net/results/95884b5ea76ee7a743d1c878660ed65c95a30f9a |     
   armeb     |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/320ffe76130cd9d02dcfc083b8394d8e84fbbdaf | ORPH
   xtensa    |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/412bd06bacfb4af864ff402740700354d1002baa | ORPH
   mipsel    |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/1540dc3167f496d94cf6aef3721883ac29f1ca50 | ORPH
   arceb     |          linux-6.9.8           | NOK | http://autobuild.buildroot.net/results/fa2d2d9451c3d7c0151bce934e573e824f1d3d58 | ORPH
    mips     |          linux-6.9.8           | NOK | http://autobuild.buildroot.net/results/b471cbea5238f5ffc201592d0a51a72019f0a3fc | ORPH
  powerpc    |          linux-6.9.8           | NOK | http://autobuild.buildroot.net/results/88a49a3477b15c428afda80e3b701e83dff4e4e0 | ORPH
   sh4aeb    |          linux-6.9.8           | NOK | http://autobuild.buildroot.net/results/de0a606c264e603672e8b1ac5bb51fad24c05d80 | ORPH
    mips     |          linux-6.9.8           | NOK | http://autobuild.buildroot.net/results/92636e53595862951156d99c305789c9fa2adbb0 | ORPH
   mips64    |          linux-6.9.8           | NOK | http://autobuild.buildroot.net/results/7883830376a0bd24f3ea7a41a448fe782844d151 | ORPH
  powerpc    |          linux-6.9.8           | NOK | http://autobuild.buildroot.net/results/92850eec5add06b715a5cb3c92c57baa5a79d8af | ORPH
  sparc64    |          linux-tools           | NOK | http://autobuild.buildroot.net/results/22912d2f2a198193fa76079f3b29539211b15f6f | ORPH
    i686     | ltrace-82c66409c7a93ca6ad2e... | NOK | http://autobuild.buildroot.net/results/e35c1582fd100c4048b28717669a21d62316380c | ORPH
   nios2     |        mariadb-10.11.6         | NOK | http://autobuild.buildroot.net/results/56bdcd9f3c3fd10b8d0c4ffbcb6583f36376d91a | ORPH
powerpc64le  |      mediastreamer-4.4.8       | NOK | http://autobuild.buildroot.net/results/58a03aaffb4c9470cb6db025b9b8a2cddf945a9a | ORPH
   nios2     |      mediastreamer-4.4.8       | NOK | http://autobuild.buildroot.net/results/fdc949d3e843e5272b020fb80fc9c7e6227a094a | ORPH
  powerpc    |      mediastreamer-4.4.8       | NOK | http://autobuild.buildroot.net/results/c67417a200223218a669798a39443c8e49e99e97 | ORPH
    i586     |         memtest86-6.20         | NOK | http://autobuild.buildroot.net/results/aaa742eecf050c63b0d2041e6cbacefe2f6a5d2d |     
  riscv64    |          mender-3.4.0          | NOK | http://autobuild.buildroot.net/results/191a11b1555e0d5c77b088b9a13094aeb3dc1eac |     
  aarch64    |          mender-3.4.0          | NOK | http://autobuild.buildroot.net/results/fe12581b37a4fce82cf6674ee62bb373d2cfeb9e |     
  riscv32    |          mpd-0.23.15           | NOK | http://autobuild.buildroot.net/results/a58ddbdfe35bd19021e65db0b8b8cc4c1c884d51 |     
   s390x     |          mpd-0.23.15           | NOK | http://autobuild.buildroot.net/results/73514ea76a5960f59b4c50e2074571b10e4682d4 |     
  powerpc    |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/e939f9e7480eca991edc6536a66a9b4e0b84d976 |     
microblazeel |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/36cc2bac51d5649ac02184968f906104662e375d |     
    arm      |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/936ad783a879d7025a828c45bc1d6094fac20441 |     
    sh4a     |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/1b13e15abd20bb995d71798093058172c8cbce32 |     
  powerpc    |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/89e3c1f81884e438839561f1c9c4cc73b1d75f1f |     
   xtensa    |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/1b6ef2ac084bab39dba32b94946b9b531b21b1b4 |     
  riscv32    |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/013b91164201632f0252d049e9253ac297f80f73 |     
   mipsel    |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/9353f19f9c959df58502f862c27ea08bac8058e5 |     
   mips64    |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/5e2b9f9c7f6db170cf0695dd13f2b3d936b78f12 |     
  mips64el   |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/395c3a8337f56566135bc92db1904a773e32df59 |     
   arceb     |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/7b7287f409c0bdaa472335614e97a0b8b0ab80a3 |     
   mips64    |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/0cc205ce53ae4f5c67d0ba25b48ed3ad452a0db5 |     
  mips64el   |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/9a15549666f3b0f6e4ab85322e0aee5a356b3afe |     
   nios2     |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/b77ad165a59e111f2f25ce8cda3cfcc19ac5831a |     
   xtensa    |           mtd-2.2.0            | NOK | http://autobuild.buildroot.net/results/96e724eb4056f5a06ca8d16fd0453a9eb786beed |     
  mips64el   |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/7d9d2c019ce88cde88f59abc1efe1fa30de154a4 | ORPH
    or1k     |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/7aa54f8d99767f4132b1ce3b583a1a9406680a9f | ORPH
    m68k     |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/1ea81db56f02a82c201a7f8fead78ad979431b8d | ORPH
 aarch64_be  |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/868cb2d28082d6d042a4331afc86b0048d38bb82 | ORPH
  riscv32    |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/7f0dc69aedc7c4fb4e74c4c69f2f8dd61b5182f5 | ORPH
   mips64    |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/7a38ed850818531a16e59c69bc6854ea1c7a3214 | ORPH
  riscv64    |          ntp-4.2.8p18          | NOK | http://autobuild.buildroot.net/results/cc199ae610952966c9761dbd02bd752de4df455f |     
 microblaze  |          ntp-4.2.8p18          | NOK | http://autobuild.buildroot.net/results/09d1b843c7c66a570eaf94202c9a9435c5095625 |     
   s390x     |         openssh-9.8p1          | NOK | http://autobuild.buildroot.net/results/f345dfa6674fb4a29b0341c966417628b4845cda | ORPH
powerpc64le  |         openssh-9.8p1          | NOK | http://autobuild.buildroot.net/results/ba5a49e6e7d82c4ae9eb1f4b3e51e36b0ea8e965 | ORPH
   armeb     |         openssh-9.8p1          | NOK | http://autobuild.buildroot.net/results/9fdcf278dc7236bbe695df4ca6c9a15238e4f0da | ORPH
   mips64    |         openssh-9.8p1          | NOK | http://autobuild.buildroot.net/results/4b4c12b2be1c92fbb412a0b079a8679ec44553f0 | ORPH
   s390x     |         openswan-3.0.0         | NOK | http://autobuild.buildroot.net/results/02ea84ce6c7fcade8c2770c3ea421c7d1a4271db | ORPH
    arc      |            opus-1.4            | NOK | http://autobuild.buildroot.net/results/3a84bef31e569c20145f54d94a4cb15ac328749c |     
    or1k     |     python-remi-2022.7.27      | NOK | http://autobuild.buildroot.net/results/6f8421156b46db17eefbebdc1e96fe0321833780 |     
  mips64el   |         python3-3.12.4         | NOK | http://autobuild.buildroot.net/results/ad75979b3a0cc1ac44dcb910981a857a8852aec8 |     
  riscv64    |         python3-3.12.4         | NOK | http://autobuild.buildroot.net/results/9af5823fbe45ad3181d8beba93856fcdb07b1a85 |     
 microblaze  |         python3-3.12.4         | NOK | http://autobuild.buildroot.net/results/12c0a5c588e54b3ec75e0a086b2f9335d519b0b0 |     
   sh4eb     |       rabbitmq-c-0.13.0        | NOK | http://autobuild.buildroot.net/results/334201367026957764bf12d0fb4544cd7c5013c3 |     
  sparc64    |       rabbitmq-c-0.13.0        | NOK | http://autobuild.buildroot.net/results/5b5185965bf398bb005eb778eca6094326e6e64e |     
 aarch64_be  |       rabbitmq-c-0.13.0        | NOK | http://autobuild.buildroot.net/results/34ca2cc50f5bddf36c213056726d960deabe7f2c |     
   armeb     |         ripgrep-14.1.0         | NOK | http://autobuild.buildroot.net/results/2696eec3dd7074c0494b14e9b3857b2283467a82 |     
  sparc64    | rtmpdump-c5f04a58fc2aeea629... | NOK | http://autobuild.buildroot.net/results/2dabaf755e18e908c8112a3693cfa348a522cea1 |     
   xtensa    |         s6-dns-2.3.7.1         | NOK | http://autobuild.buildroot.net/results/93c8ba91cf43c78c924132d9dac40f4ae5dc4016 |     
 powerpc64   | squeezelite-71c012ad9ba102f... | NOK | http://autobuild.buildroot.net/results/1ae2d4f14213d5cdd79d0899637943685b0ff62d |     
  sparc64    | squeezelite-71c012ad9ba102f... | NOK | http://autobuild.buildroot.net/results/a149c9adea651acfe3ed7c6ff02a632aad6145ea |     
  mips64el   |         tpm2-tss-3.2.2         | NOK | http://autobuild.buildroot.net/results/1fc309f2bca7ba1fce8cf9fd80a5f8a300cb309b | ORPH
    mips     |        udpcast-20230924        | NOK | http://autobuild.buildroot.net/results/61dfaf09c021281d6732eff8eb3e5c9f5dc92463 | ORPH
   sh4eb     |        udpcast-20230924        | NOK | http://autobuild.buildroot.net/results/c417ad2c96cf9097c0090e53b9ad3dca1d1cfd13 | ORPH
microblazeel |        udpcast-20230924        | NOK | http://autobuild.buildroot.net/results/55b368fec6ede9beafecc652b7bbe6eac1041872 | ORPH
   mips64    | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/75187dc493db765ff1e7e3a4c6c9c8e1ecc66908 |     
    i686     |            unknown             | NOK | http://autobuild.buildroot.net/results/55e1a4ffe234a1ea74facf66a38870238efed5ed |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/463441c482fb2e93d987bfb70f721b63ca1a8b52 |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/35cd99407f1e428596fb8038e18b5e5514e69b2c |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/508d4d0ef35b73f8e35383b6ab9a35914c6d955a |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/577d3f53217652838c2c6f7dc69e8c76ef29605f |     
   mips64    |            unknown             | NOK | http://autobuild.buildroot.net/results/55850c7a7f28a9adb6fa684084eb37c8584eca0b |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/55a7df248fb7781040a86e9ddd5ecb25c67e29fd |     
    arm      |       util-linux-2.39.3        | NOK | http://autobuild.buildroot.net/results/d29b9aca595569c1aaec7ea7cf470d3835c3f127 | ORPH
  riscv64    |       util-linux-2.39.3        | NOK | http://autobuild.buildroot.net/results/cde56d36b238998b2e3d492dcd2a1e23603789dc | ORPH
  riscv64    |         wtfutil-0.41.0         | NOK | http://autobuild.buildroot.net/results/2159027d8bf4db39790395c5664f666bd6440af3 |     
microblazeel |            xz-5.6.2            | NOK | http://autobuild.buildroot.net/results/188ecbed518c9ec3ea5c500ce9f929cceaea2070 | ORPH
   arceb     |            xz-5.6.2            | NOK | http://autobuild.buildroot.net/results/15467558693f58c72719fe53da7aefd95e31707e | ORPH
  sparc64    |          zabbix-6.2.7          | NOK | http://autobuild.buildroot.net/results/f32c19c64c567ad9aa30f0d9251761b411299534 |     
  sparc64    |          zabbix-6.2.7          | NOK | http://autobuild.buildroot.net/results/dba6b8677273614e588679af905c58faca97b2f5 |     
   nios2     |          zabbix-6.2.7          | NOK | http://autobuild.buildroot.net/results/3d45618f4b72a6ed81ff5ebbb4ba46f7a04148a8 |     
   sparc     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/da01333816a136104eba6198760c441e6fff9c22 |     
   mipsel    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/d35d4f7be21bae6c50d6fa8cc0a1479727bb889c |     
powerpc64le  |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/b15e7f4fe8c4c43065fbcafe8cc5aa60de07fd58 |     
    m68k     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/acde5997e16e5cd797a886382292b62035efabe5 |     
powerpc64le  |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/853242f33d03be526871eb9e3dae9a2a96a62122 |     
  mips64el   |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/64929fb74b55a912ba7b718202c6056bb293635c |     
    mips     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/ff8f0c581b9656f0c1f2aa00ca8b7b981c39b009 |     
    or1k     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/f1b89b45910bc98ad2f86ca3b11fae89dcadd590 |     
    i686     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/bb1d793580d11ab53192ee55bd7e6f3fa5fb7797 |     
   mips64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/eb82f0ce41f9b27780bf1ab68730b3367b436b65 |     
    i686     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/9ac5ca44fcc1597afd1b047c18aaf7db57a13f44 |     
   nios2     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/807626defacd0d18afd197a280772b4e9f0720ad |     
   armeb     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/5501516fc0c556c2fe5538afbbefff633d92a8a9 |     
    i586     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/7589b86ca6e5cf553c74123e0deaaa862bf7473b |     
   mips64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/fa7f764e79bf74c3dbab3b9f2e223a0b80b935b2 |     
    i686     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/823cb0502a5beb32ff73e25b510dba4fbf9f1f35 |     
 microblaze  |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/7564fc4bec6adb4e3c7a9109dca9c869f9ffc6d3 |     
  sparc64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/0626c7a44233e08960eda52cf13d5896f91deb31 |     
  powerpc    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/6dd7671ad592f7458a72493fc540e9777e54a3ba |     
   sparc     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/e5cafccb6480f7645c615c759695a46277f44f79 |     
    arm      |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/648d17e5193e522dcf422cdbe2335ecab7ba9d4f |     
    arm      |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/81fec2d72f527b18a3e7312cad98c462d4964343 |     
    arc      |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/77e05e03a15a05dcf782ce325ed2df0e31f2b4ce |     
   arceb     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/7a2af04dd8b048d36d769807dfec0c4eff228e3f |     
microblazeel |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/2538d6ec99aa4bc04f4593b21a1fee84a638873b |     
   mipsel    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/c04c3347ef875b1b3a937d2643a54a3e4f989fc7 |     
 powerpc64   |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/c1dada2df7dee9cf5be0aad1bed283c2ab2f43d1 |     
    m68k     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/3e27e5d16e31eb8abebbcc6160b2ceac866d5c58 |     
  aarch64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/355df29c8c475bf9b703b32ed03c2c4d8eb1dfab |     
 aarch64_be  |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/150fce978542ba95aac981297ada9ef41e7f336b |     
    or1k     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/acc28e00e4d96c900fac7ac66a546f74f72bb454 |     
microblazeel |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/fb80d35074c0e6217efbc105d527e10b38ced9a0 |     
  mips64el   |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/d95b5090af160d8cbf24b093baf44efceafcc34f |     
powerpc64le  |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/c21cad543bb36fd9f142fc71c9e37a33809ed0f5 |     
  aarch64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/eb1c4321d8823cb43be2ddd6e64a0d1b0debac33 |     
   mipsel    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/3f26f86faecf62445b302ef629a803289e87a538 |     
powerpc64le  |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/5a64174509011d134b465ba01271f71c9f26b5dd |     
  sparc64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/f182bae112d1e02fa61e136ff1ec13ca96054e26 |     
    sh4a     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/c98a91a02a675a8ff7008fc6feeab93c71f09081 |     
   nios2     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/e290495cba3ca7aa14c15a58c693c05c6a00e414 |     
powerpc64le  |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/86bb3ef8c99136b838dedf4bc02e47f910a9838d |     
   s390x     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/1f26fe359b61865231243d3c56093db5aa12fc8a |     
   armeb     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/604d7eb80ca1dbff72244c02a4744d7dd6843e14 |     
powerpc64le  |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/38cbb193a405fd7ca1c962ed4fe3c1c4abe8a799 |     
   mips64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/c117fe91c179b12dad5923d72fef89228d4d16bd |     
 aarch64_be  |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/eda31b757133207075c0cacb899125b9c7fef761 |     
  powerpc    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/35bc5bdb8121c34f7628842ac29bda0ff5334ea1 |     
  sparc64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/e16cf4dc5a868013a1698ada844fd471332a46a9 |     
   nios2     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/8441657fe52b5bd3e4faca50ae277801383f7c33 |     
    or1k     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/b02bfb1318e28def23c35b04d2a698bfb805d829 |     
 aarch64_be  |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/e6da79045da0c5c40629b4fe10263aa8951498f4 |     
   mipsel    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/63643cacef94660777100bce32655f66b6428126 |     
    or1k     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/a40c8327e415af23dbeba9069e4eb7f601e473e0 |     
 microblaze  |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/f997553abd76af240f874556b7ddc46339a305d8 |     
  sparc64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/9cb102f0636bb02aa87ea7d964665cf9d4e880c8 |     
    i686     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/10389d7f19c653ef89ef267a5e192d8334c1b3ea |     
   mips64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/be65a660ae9dd35cf8a2689af8976d166cc62f04 |     
   s390x     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/d69cb4ab35d9b2170746c1130f4cf31a0a079431 |     
    sh4      |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/f53df5c553f45b43cdc78d42ba4e5d18f6d2572e |     
  aarch64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/a5ba5affe7504eab6420ed276e84b72b6457c05a |     
   xtensa    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/bc4d50bf13f168a76e920f6f8cbc8249d7976e26 |     
powerpc64le  |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/9fa567f23b11d0bdce7b4d3211c450a942510702 |     
 powerpc64   |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/f923a281ceab304270c771694ebbe72a28796c82 |     
   armeb     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/fdc2d9522c2ccefbb6833b4ad42b855eb2ad6453 |     
powerpc64le  |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/b9352810db2e8312f6530c6e3ac31cdd8f08be88 |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

          chocolate-doom-3.0.1 | 1 
                elfutils-0.189 | 1 
                     file-5.45 | 1 
              fluent-bit-2.2.3 | 1 
                 libp11-0.4.12 | 1 
                       unknown | 1 
             util-linux-2.39.3 | 1 
                 x11vnc-0.9.16 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    sh4      |      chocolate-doom-3.0.1      | NOK | http://autobuild.buildroot.net/results/8bdf429140e6300a53febb8cf8e0e678c830ac28 |     
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/de33ce0db29b3ee299d9d8c3e6a946c67c38d54f | ORPH
    i686     |           file-5.45            | NOK | http://autobuild.buildroot.net/results/349a17009fdbbf902eb860c2a108a8ac9c3b1af4 | ORPH
   mips64    |        fluent-bit-2.2.3        | NOK | http://autobuild.buildroot.net/results/93a52c5162d00eff0f80e125c18e9eb61e7fa475 |     
powerpc64le  |         libp11-0.4.12          | NOK | http://autobuild.buildroot.net/results/d2088c0ddca95889c508dc37f530b670c540111b | ORPH
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/d4842d99fafd165cd3700ea1d1a6a214b43a9c70 |     
  mips64el   |       util-linux-2.39.3        | NOK | http://autobuild.buildroot.net/results/52ee44a4940d54cd825d883b18ec59ca4aeab468 | ORPH
  sparc64    |         x11vnc-0.9.16          | NOK | http://autobuild.buildroot.net/results/6914c3469078e98c0db72efe5d787ff1d311d34c |     


Classification of failures by reason for 2024.05.x
--------------------------------------------------

                softhsm2-2.6.1 | 2 
                 coreutils-9.3 | 1 
                elfutils-0.189 | 1 
ibm-sw-tpm2-5452af422edeff7... | 1 
libest-f8a6e5b53a5f70e72fe4... | 1 
                openswan-3.0.0 | 1 
                    zeek-4.1.1 | 1 


Detail of failures for 2024.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/c3f86e5eeaac9b40c96b353b6297225e25f7d366 | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/76077555eb4bba362cd19cd58b023316eea0c03f | ORPH
    arm      | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/695c4c89e639d95bf5c2c30800488a623734d0c6 |     
    sh4      | libest-f8a6e5b53a5f70e72fe4... | NOK | http://autobuild.buildroot.net/results/89024d6c1f10959282470b120d332fb32922b3b6 |     
  aarch64    |         openswan-3.0.0         | NOK | http://autobuild.buildroot.net/results/1a04e9931f36240f83b7efc5c3ecbe7fdb26fc33 | ORPH
  aarch64    |         softhsm2-2.6.1         | NOK | http://autobuild.buildroot.net/results/2dbafd59722e73dc1583bde0a2ec593826a9f4a8 | ORPH
    arm      |         softhsm2-2.6.1         | NOK | http://autobuild.buildroot.net/results/56caab5dac77b478b27f5acc0c65b8e372fd75df | ORPH
    arm      |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/ff5f4125f523f1823fa14a17f1083eec10bf8450 |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
