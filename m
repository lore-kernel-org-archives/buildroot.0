Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7498C27C53
	for <buildroot@archiver.kernel.org>; Sun,  9 Jun 2024 04:11:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 813A340018;
	Sun,  9 Jun 2024 04:11:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sr-fUwY3zpKB; Sun,  9 Jun 2024 04:11:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 45D714034B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 45D714034B;
	Sun,  9 Jun 2024 04:11:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 758071BF3FB
 for <buildroot@lists.busybox.net>; Sun,  9 Jun 2024 04:11:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 65B43846B1
 for <buildroot@lists.busybox.net>; Sun,  9 Jun 2024 04:11:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OZkN-ndVfg1h for <buildroot@lists.busybox.net>;
 Sun,  9 Jun 2024 04:10:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D027F84692
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D027F84692
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D027F84692
 for <buildroot@buildroot.org>; Sun,  9 Jun 2024 04:10:57 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id EB0454000D
 for <buildroot@buildroot.org>; Sun,  9 Jun 2024 04:10:54 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sun, 09 Jun 2024 04:10:54 -0000
X-GND-Sasl: bot@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1717906255; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=5JtwfNKhEwJRxMEsaoONpSGLPcsfOeB+4cFccl17y7A=;
 b=U6Cj8n9ghK2LFWqUYQbQXavgCRQM/yaZ/ZF8ANXoS7brKa/4GONxE+r1dkQS18F5l93CyL
 Jmh6qsvgmbI9o2woxaqiKQpVb5XyOSjnKH6Qa91fXGlCFuOBY0DLm+XMx9qrAuZ+NtZRYG
 rTBBRpwuTuwHRogl6WSK+vO0APvGU8VfDUgsKP1dBeKTNH9+J+1/vb8bDNjcZG8ET4Zd8u
 pGFOFezlVsky93kkVCnE2W7b+6tou8mrE81d1Y7A8163zkXwwVuBw5xuURLFCOnF8Y/Hvp
 DvKOuw8agWF9ZOJ9PB+kXAyuHLyeMgzHIoBlCF4qbHfnbC0nKLdyo2sRklbHbg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=U6Cj8n9g
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2024-06-08
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
Message-ID: <20240609041054.jpQt7p98T1IZOccMUcDSH7QbhWZJKnpKGSNzLnbmr6w@z>

Hello,

Autobuild statistics for 2024-06-08
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  9  |  3  |  0  | 12  |
    master   | 162 | 490 |  0  | 652 |

Classification of failures by reason for master
-----------------------------------------------

host-prelink-cross-a853a5d7... | 73
            host-cdrkit-1.1.11 | 38
                host-odb-2.4.0 | 20
                    mpir-3.0.0 | 19
                elfutils-0.189 | 18
                libressl-3.8.4 | 18
host-vboot-utils-bbdd62f9b0... | 17
                fail2ban-1.0.2 | 13
ibm-sw-tpm2-5452af422edeff7... | 13
host-android-tools-4.2.2+gi... | 11
      host-riscv-isa-sim-1.1.0 | 11
                  ffmpeg-6.1.1 | 10
                  linux-6.8.12 | 10
         host-libxcrypt-4.4.36 | 8 
              libarchive-3.7.4 | 8 
aer-inject-9bd5e2c7886fca72... | 7 
                  bcusdk-0.0.5 | 7 
glibc-2.39-5-ge0910f1d3278f... | 7 
                 openssh-9.7p1 | 7 
                       unknown | 7 
brcm-patchram-plus-95b7b691... | 5 
                host-go-1.22.4 | 5 
                  libffi-3.4.6 | 5 
               libglib2-2.76.1 | 5 
pppd-e1266c76d1ad39f98f1167... | 5 
android-tools-4.2.2+git2013... | 4 
                gnu-efi-3.0.18 | 4 
host-heimdal-f4faaeaba371ff... | 4 
                 avro-c-1.11.3 | 3 
     bandwidthd-2.0.1-auto-r11 | 3 
              cache-calibrator | 3 
check-11970a7e112dfe243a2e6... | 3 
                 coreutils-9.3 | 3 
 host-softether-4.30-9700-beta | 3 
          libcamera-apps-1.2.1 | 3 
                 uclibc-1.0.48 | 3 
                  cairo-1.17.4 | 2 
             docker-cli-26.0.2 | 2 
                   duma-2.5.21 | 2 
              fftw-quad-3.3.10 | 2 
            gdk-pixbuf-2.42.10 | 2 
                 highway-1.1.0 | 2 
        host-sentry-cli-2.20.3 | 2 
                libdrm-2.4.120 | 2 
                  libnss-3.100 | 2 
              libopenssl-3.3.1 | 2 
               lighttpd-1.4.76 | 2 
     linux-5.10.162-cip24-rt10 | 2 
                   linux-tools | 2 
               mariadb-10.11.6 | 2 
          python-grpcio-1.60.0 | 2 
                rocksdb-6.20.3 | 2 
                 shadow-4.14.5 | 2 
              skalibs-2.12.0.1 | 2 
             sofia-sip-1.13.17 | 2 
             strongswan-5.9.13 | 2 
                   trinity-1.9 | 2 
                 apache-2.4.59 | 1 
                     apr-1.7.2 | 1 
                  assimp-5.3.1 | 1 
                    bat-0.24.0 | 1 
                beecrypt-4.2.1 | 1 
                   bird-2.0.12 | 1 
                    brltty-6.6 | 1 
             can-utils-2023.03 | 1 
                 cdrkit-1.1.11 | 1 
cegui-00b4e1fe174da53b7ed72... | 1 
                   cpuload-0.3 | 1 
                     criu-3.19 | 1 
                     crun-1.12 | 1 
                   cvs-1.12.13 | 1 
                     daq-2.0.7 | 1 
                   dhrystone-2 | 1 
                  dump1090-9.0 | 1 
dvb-apps-3d43b280298c39a67d... | 1 
                 erlang-26.0.2 | 1 
                  fbdump-0.4.2 | 1 
                    fcft-3.1.6 | 1 
                     file-5.45 | 1 
                     frr-8.5.4 | 1 
                  gamin-0.1.10 | 1 
              gcc-final-13.3.0 | 1 
           ghostscript-10.02.1 | 1 
                 gnuplot-6.0.0 | 1 
google-breakpad-f49c2f1a202... | 1 
                    gpm-1.20.7 | 1 
         host-gcc-final-14.1.0 | 1 
                   hwloc-2.9.3 | 1 
               ipmitool-1_8_19 | 1 
                  jack2-1.9.22 | 1 
                jemalloc-5.3.0 | 1 
kvmtool-4d2c017f41533b0e51e... | 1 
                 lapack-3.10.1 | 1 
      libabseil-cpp-20230802.1 | 1 
                 libcoap-4.3.4 | 1 
                libcuefile-475 | 1 
               libdeflate-1.20 | 1 
           libfreeimage-3.18.0 | 1 
                  libsepol-3.6 | 1 
              libtracefs-1.8.0 | 1 
        libzenoh-pico-0.11.0.1 | 1 
ltrace-82c66409c7a93ca6ad2e... | 1 
         lttng-modules-2.13.10 | 1 
                     lxc-5.0.3 | 1 
                     lzop-1.04 | 1 
                memtest86-6.20 | 1 
                  ntpsec-1.2.3 | 1 
                     nut-2.8.2 | 1 
             open62541-v1.3.10 | 1 
               openblas-0.3.27 | 1 
                opencv3-3.4.19 | 1 
   python-pydantic-core-2.14.6 | 1 
python-unittest-xml-reporti... | 1 
            quickjs-2024-01-13 | 1 
                     shim-15.8 | 1 
squeezelite-71c012ad9ba102f... | 1 
           uboot-tools-2021.07 | 1 
ulog-0389d243352255f6182326... | 1 
           v4l2loopback-0.12.7 | 1 
                xenomai-3.0.10 | 1 
                     z3-4.13.0 | 1 
                    zeek-4.1.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/ce315d7e7de3d713ccfdf1293ac61a6d09f6e656 | ORPH
   mipsel    | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/98c56228a1c142c3f9f6b05b9fa17eacbfd59850 | ORPH
    mips     | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/31b2a8fa7555fba06f734ce1b68e3719adc64e5e | ORPH
   mipsel    | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/0475aece2b2c19c8a16996a467c8050b36d48d65 | ORPH
 aarch64_be  | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/7728d538b26660d7c88f721d6b57142d601ffe87 | ORPH
 powerpc64   | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/af2aeaace67f451854b8ef6e4ca8b825e241f831 | ORPH
 microblaze  | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/1caa13c5c1ce507aaeba0768e4d65c7cb883f454 | ORPH
 microblaze  | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/1b3c21cfd36ae9dadf3b49248080d0a0df77d28d |     
    m68k     | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/ff66fb9aa6c0b0b0dc0a4f04c286285fba1f5077 |     
   s390x     | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/ce708394086f3f4689861d6d2056199eeedbdc4e |     
   mips64    | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/292acca6c8c0075886e0076a8312fde7a2bfc945 |     
    sh4a     |         apache-2.4.59          | NOK | http://autobuild.buildroot.net/results/66363b4151604c7d8c0acca99552aea79c108793 |     
  mips64el   |           apr-1.7.2            | NOK | http://autobuild.buildroot.net/results/7816ad0bc4d6ca72daca4c18cfe1018b9ebaa3af |     
    mips     |          assimp-5.3.1          | NOK | http://autobuild.buildroot.net/results/a98b43c7916bbab56bbb98b64dd69faff6163cc0 | ORPH
   x86_64    |         avro-c-1.11.3          | NOK | http://autobuild.buildroot.net/results/a01bdd3d898870f33aa7bb84fe5ca276f77b4955 |     
  sparc64    |         avro-c-1.11.3          | NOK | http://autobuild.buildroot.net/results/a9e4c02f74c9df956a4785c2211175a1c522cb75 |     
   armeb     |         avro-c-1.11.3          | NOK | http://autobuild.buildroot.net/results/f99b631de7d69947046e2cb64fdd402a63462205 |     
   x86_64    |   bandwidthd-2.0.1-auto-r11    | NOK | http://autobuild.buildroot.net/results/f90157b8cbdf32b4c9a9d29a4555e7f5f7ee699c |     
powerpc64le  |   bandwidthd-2.0.1-auto-r11    | NOK | http://autobuild.buildroot.net/results/0476631a32f607f7515bac800e0ee72b8a14b86c |     
   s390x     |   bandwidthd-2.0.1-auto-r11    | NOK | http://autobuild.buildroot.net/results/2693f581fb7a2ddbc332645a392427ae98342648 |     
  aarch64    |           bat-0.24.0           | NOK | http://autobuild.buildroot.net/results/da2ddc48ed7fbb9a10b4e73c72a6bc8eda7b51a5 |     
  sparc64    |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/c492b3359cec85252ffc3831a11db41583e1af01 |     
   mips64    |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/332cf293365c9b7505b6357969a9cc43d9a6b594 |     
powerpc64le  |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/832e67e460202da2b66c170da8c4989f77393104 |     
    i686     |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/fd6fbf0135207518edeb12598b776adfd4f0e901 |     
    m68k     |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/c7119ff2a3b900ae6b274757b39649f675bc60fb |     
   mipsel    |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/89f50633e08485d4ab6f3af4294e3fed6d743b78 |     
    arc      |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/0db220e8b08566fba79daccc5a083086031b80b3 |     
   nios2     |         beecrypt-4.2.1         | NOK | http://autobuild.buildroot.net/results/ada41666f65f94ab3eb40599ee76a4a2fe378f42 | ORPH
   arceb     |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/2ad3d06b3230dd6516d1f6461d5e9d417b7e10de |     
    m68k     | brcm-patchram-plus-95b7b691... | NOK | http://autobuild.buildroot.net/results/82eaa29a5ee78e9d62dda711ffcd98c33cd4fb57 |     
 microblaze  | brcm-patchram-plus-95b7b691... | NOK | http://autobuild.buildroot.net/results/bcd9e388b86f152c994bd12cd3529b550cb4e554 |     
   mipsel    | brcm-patchram-plus-95b7b691... | NOK | http://autobuild.buildroot.net/results/efb7cd7d09c7cad259e6cff993a942c8df840331 |     
  sparc64    | brcm-patchram-plus-95b7b691... | NOK | http://autobuild.buildroot.net/results/13fcee8c0e9955a0f630f654c9482b20a4305f50 |     
   mips64    | brcm-patchram-plus-95b7b691... | NOK | http://autobuild.buildroot.net/results/de2768cbffdcb4d42c10af66785556e8704909de |     
microblazeel |           brltty-6.6           | NOK | http://autobuild.buildroot.net/results/6feeaa2e329086dd8b8c08a0358aee21f1e8cee2 |     
   s390x     |        cache-calibrator        | NOK | http://autobuild.buildroot.net/results/ddfced33698b3b2e226a68b01b5d9311acccdfd5 |     
   armeb     |        cache-calibrator        | NOK | http://autobuild.buildroot.net/results/9055da8e7e43ece1481348ef162eba41173f582a |     
   armeb     |        cache-calibrator        | NOK | http://autobuild.buildroot.net/results/821f6f24c67e4d38c26daa9463dbeb0a0e6195b3 |     
    arc      |          cairo-1.17.4          | NOK | http://autobuild.buildroot.net/results/25cfaeb94f85813951e027fe8cb0621aa31c292f |     
   x86_64    |          cairo-1.17.4          | NOK | http://autobuild.buildroot.net/results/cdd871ff4a5d0e46144d10ab57771afe6f35d9fb |     
   arceb     |       can-utils-2023.03        | NOK | http://autobuild.buildroot.net/results/8e378120e44127a500e6ae9d9cecd5f5fe1d3f8a |     
 aarch64_be  |         cdrkit-1.1.11          | NOK | http://autobuild.buildroot.net/results/3a36737aecd8514252564d3513b6b767d8337439 |     
    or1k     | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/62f9e639da3671da6093f7d29f76090aeb4bfc62 |     
    arc      | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/5c12e262f4f1c9848da4e888a13990912cdbdafc | ORPH
   sparc     | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/c2ba0f31352f6ce814802c6941e3d3aac75e9f82 | ORPH
   xtensa    | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/3da86583a471fe36dbae2fe7af20a42d35911082 | ORPH
    arc      |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/d22cdde5f4d9ade4e14b8f564e529301c01f65e0 | ORPH
   mipsel    |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/baea334b697f346cde3478d74d667056f568dde7 | ORPH
  sparc64    |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/fe1a9f151ca0f35ccf5d0b4b8ba073a9c3f0d70f | ORPH
 powerpc64   |          cpuload-0.3           | NOK | http://autobuild.buildroot.net/results/0545f903cad56518be1f65d588326ebcbf36865b |     
powerpc64le  |           criu-3.19            | NOK | http://autobuild.buildroot.net/results/7687f18c9e801482658ef2d28f97f48315e3fa23 |     
microblazeel |           crun-1.12            | NOK | http://autobuild.buildroot.net/results/e3d9bae6ef64cb9497c87e93be2612c7885aa6cd |     
    mips     |          cvs-1.12.13           | NOK | http://autobuild.buildroot.net/results/02d527a738e841692840f22a27e69364a24f39ce | ORPH
  sparc64    |           daq-2.0.7            | NOK | http://autobuild.buildroot.net/results/090cc1a1fa803762293cdf41cec54a61eef6f87c |     
   sparc     |          dhrystone-2           | NOK | http://autobuild.buildroot.net/results/c66fecfd565fc9917ca70e81d2c0d1629d81f9e5 | ORPH
   s390x     |       docker-cli-26.0.2        | NOK | http://autobuild.buildroot.net/results/7cbaa58053cc6ac298cb300fc8c8c77fe45b20bf |     
  riscv64    |       docker-cli-26.0.2        | NOK | http://autobuild.buildroot.net/results/1561dd5223282f7a09f1c2f433d6ed13a3392dc3 |     
  sparc64    |          duma-2.5.21           | NOK | http://autobuild.buildroot.net/results/87af633ecbb69fc85fc0432cc60a71ee9db3651c | ORPH
 powerpc64   |          duma-2.5.21           | NOK | http://autobuild.buildroot.net/results/f412d6009ed1e744b2342aaa71823a4e8cb39eb1 | ORPH
   x86_64    |          dump1090-9.0          | NOK | http://autobuild.buildroot.net/results/2c15528566405eed87cc8e86e6faf68a583d7e01 |     
  aarch64    | dvb-apps-3d43b280298c39a67d... | NOK | http://autobuild.buildroot.net/results/9423346c4db084bdcb5ac5cdbe8438f50e961239 |     
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/a8f82105fe08d8393d46a7598c7dcf2efac2561e | ORPH
   arceb     |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/a81c9dc10f796bbd9f10ee1a69c86cdabf8d1fe6 | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/85abe497efd5feba57580c9311d00bea631eb756 | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/5861702a559a556c2b56cc0afa545f7dc4c7a935 | ORPH
   mipsel    |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/768d0eec87dc6a1196c46d1abc04aeb394927b39 | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/77d05978e193ce06d121cca2493d0c590c48498a | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/89ad8fe71f1c9ddf9e19e68da1ab343e35de8c22 | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/68ca5e163e24d01498b60decc1e26751024cffc3 | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/85ec45cbe79128bd4fb23efa3fadb2ed41781a1c | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/91446d1d0001bb2bcd95b80be9c7ac01090bd49b | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/a6af299ecc9b95f7fc9b30302265733fa930d1e6 | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/550834d985a724ea7c6032622ab45139574ad870 | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/18212c86fe985a59a52f3621e500de8d0d6edf3c | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/941c940d2794b444251f38fb2f54ebf4bf34077c | ORPH
    arm      |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/53b79d2b8290da7a1f951fab281b5bdb58add13b | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/b0e8fb76b6d64ce90b63695c4f876a02576f37e5 | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/a44920013bc963b713d4e24f9ab216be58273d6a | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/a48059242c04d9a423a75bc276905c899f2acfbd | ORPH
    arm      |         erlang-26.0.2          | NOK | http://autobuild.buildroot.net/results/c52b8385f19c107d6c3908deaca6b13692943555 |     
    m68k     |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/034c2be79fa86173dcaa014facf01d569c62e686 |     
microblazeel |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/df1b2a01374dcff3a3c96afad46b7f3e516378a3 |     
   x86_64    |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/4219541a4692d3f52f13c34868e83a4822fa77b2 |     
    arm      |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/b3bd982b63737be61650302c8e16de54bed2eca9 |     
 powerpc64   |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/101cd3160684d7918e8f6833194c91c909fbb5fe |     
   armeb     |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/b6ab007db46603541f4ba04108e1c38b3d062ac1 |     
   nios2     |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/532f6341b51b6df8d28fe22c9ce7a0a81b185e6c |     
 powerpc64   |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/94af1c9dd256722e74c5c86ad4364d9d8c0f28d0 |     
   s390x     |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/150949e759746096d34c433d81bd5b8ac46be3f2 |     
    mips     |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/ad0a4f1a9e5c34a11a07b054abf291fe75ff3522 |     
   mipsel    |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/3cfd213a6990c7908b2eaccee7cff543f934d0aa |     
   x86_64    |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/a8e5cb45ccba1b0af6119c50faf6ed6948beb430 |     
 microblaze  |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/b46c7850172504176dd2e96dde14b8c4ed9298ff |     
  mips64el   |          fbdump-0.4.2          | NOK | http://autobuild.buildroot.net/results/1b830955bfa1a7c070e6c2d43e000de0206f0dbe | ORPH
  mips64el   |           fcft-3.1.6           | NOK | http://autobuild.buildroot.net/results/e1f89fe9c3db486a799b337a76170669543b1069 |     
   arceb     |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/8ce2c6394a2e211020deb016ec6d64054a7b2344 |     
microblazeel |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/bf522bc7065a17ccef8505164051d4906787b10c |     
  riscv32    |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/9e63579544616e55b6fe1cce70361b8ef0ccf664 |     
microblazeel |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/51da13519dbc51654ee869b4de669f6a760a16cf |     
 microblaze  |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/1e0be5e125dd0494961c527566dd600573226d67 |     
microblazeel |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/d30af6cd3490ec84c8ef1bc055cf8bc37c609cd0 |     
   arceb     |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/b940b87ee4f2b8d33fc67346f5b64f4e507932c8 |     
    arc      |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/054db09ce4820c04bfa3769aa28ef07a45ea0ae3 |     
microblazeel |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/14aad04820a8055fe0abb71e212a3ff37745c96c |     
microblazeel |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/119351ef329641c4728369e9f320d31178a2033c |     
 powerpc64   |        fftw-quad-3.3.10        | NOK | http://autobuild.buildroot.net/results/aefbcc00f8e25804f988021b44816c128e755c7f | ORPH
powerpc64le  |        fftw-quad-3.3.10        | NOK | http://autobuild.buildroot.net/results/b40a4780e83d5c43ae4f36a1120ebca4d1f5003b | ORPH
  powerpc    |           file-5.45            | NOK | http://autobuild.buildroot.net/results/642d253a5e89eabd3900e9c87b3ace6b980c1a65 | ORPH
    arc      |           frr-8.5.4            | NOK | http://autobuild.buildroot.net/results/6ea7c3c3716a27e0d82ff4974357b40f757cdad8 |     
   s390x     |          gamin-0.1.10          | NOK | http://autobuild.buildroot.net/results/fc6cbf3c647c57a544ed2e7ec25235cdf6148158 | ORPH
  powerpc    |        gcc-final-13.3.0        | NOK | http://autobuild.buildroot.net/results/55fbb774a70d2230f03fc78d578f6e5ee3a2459c |     
   arceb     |       gdk-pixbuf-2.42.10       | NOK | http://autobuild.buildroot.net/results/17c0416ea38ad356b30f3149c541e4699c702217 | ORPH
   x86_64    |       gdk-pixbuf-2.42.10       | NOK | http://autobuild.buildroot.net/results/78e9d746607baeea923b025cc8bf5a70bfa6d9bd | ORPH
    sh4      |      ghostscript-10.02.1       | NOK | http://autobuild.buildroot.net/results/c8277049e180c2d3b7e032a846b1a77440939289 |     
 powerpc64   | glibc-2.39-5-ge0910f1d3278f... | NOK | http://autobuild.buildroot.net/results/d4cce45700584130cd10494d4cfc3bdac1cfe79c |     
powerpc64le  | glibc-2.39-5-ge0910f1d3278f... | NOK | http://autobuild.buildroot.net/results/a0b9d2934be7a89734ed59c84179bde211b1cab1 |     
 powerpc64   | glibc-2.39-5-ge0910f1d3278f... | NOK | http://autobuild.buildroot.net/results/91aeb831834a1ead105cd4bacce7724f68eafa5f |     
 powerpc64   | glibc-2.39-5-ge0910f1d3278f... | NOK | http://autobuild.buildroot.net/results/8706ae46b8e2e72221959fa806669ace6e232717 |     
powerpc64le  | glibc-2.39-5-ge0910f1d3278f... | NOK | http://autobuild.buildroot.net/results/0d2f9a9191b55f1fd56c08ea6dc9a694146545a0 |     
 powerpc64   | glibc-2.39-5-ge0910f1d3278f... | NOK | http://autobuild.buildroot.net/results/f0ab2e954e233f5fe3db12470dc4978d7e3c56b5 |     
    arc      | glibc-2.39-5-ge0910f1d3278f... | NOK | http://autobuild.buildroot.net/results/8716fe0b5d31b117c9bd21a53e319739f170fcce |     
    arm      |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/25d5a66a0b0f7867399f79649b1d09f7bea0f657 |     
   armeb     |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/98902ce88a3c831ba52534d5f0764f17fe92041d |     
   armeb     |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/d9391ddd19fcc6958ac86728aa221fe8e80e2b1b |     
    arm      |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/998ac4fb230475f74219ae48e539d81400c7aa5f |     
   nios2     |         gnuplot-6.0.0          | NOK | http://autobuild.buildroot.net/results/16789e726d8d083362e2e90d9c6479a3e1ca38cf |     
   mipsel    | google-breakpad-f49c2f1a202... | NOK | http://autobuild.buildroot.net/results/79bd29512b75c705c80f0e48a2cf1c0d6f14cc2d |     
  mips64el   |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/8e857736b64c157e187b138a941eb408247f5e89 |     
   xtensa    |         highway-1.1.0          | NOK | http://autobuild.buildroot.net/results/c6b35030e519de59c4ffff10bb010fe77393e446 |     
 powerpc64   |         highway-1.1.0          | NOK | http://autobuild.buildroot.net/results/3072fa974668e942ef8c5a469625669499764f80 |     
   sh4eb     | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/1f3e7fd15a24dae9d336a5f07d0b32ca5fff74eb |     
  sparc64    | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/791c339f107522db177301854168792ee8df555e |     
   xtensa    | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/a9a206578d7297d99d52868beb3f9f98649f5ee2 |     
    arm      | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/eb43e71faf1fad84fc2fad57973ca54b2f87880b |     
 aarch64_be  | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/84f5fb758feb7fbbbbd55c79dd6373e0da168707 |     
powerpc64le  | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/c2e9b1d3e1ca765176b47be5004122244c7d1a31 |     
powerpc64le  | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/e2e9970eb640b2ab396f852271ba17237960e1a9 |     
  powerpc    | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/6b6de041b5005f49671610e6e50dceba8c259707 |     
   arceb     | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/fb142fb86f073a8396d067c906090b7b81174b9a |     
  mips64el   | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/04d0e8ccd76de341cda5ff92109cbd501d64d0bf |     
microblazeel | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/ef860ca8a1a02e1371268448ab524132d3d3b81a |     
  riscv64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/c53c1ba8dfad4c1312d863a02cc86b8531482428 |     
    i686     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/0bc587fb92a0bae0e532153e85abdd84723df387 |     
   mipsel    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/c0e6500feb48cd66993ff855711764c861275fbe |     
   sparc     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/269f21424566b41473d92dc6706f5321b6c3e466 |     
    i686     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/e8aaa3b94a2e75e1762872d5fc8137270ee0f08d |     
  powerpc    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/32ebd41007a7236a396c56af75839bb790448dcc |     
   mipsel    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/25a399f45f3018fb3debb31aaf47a6d69d562392 |     
  mips64el   |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/c1e86281f2dd30dfa8e3f6562b5360032f9723ca |     
   s390x     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/3dff37fb99cdc02484ab4cd5a340abd6a27be182 |     
   nios2     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/fdcd7ed5840ba21f222543d11898d1731445527f |     
  sparc64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/bdbbf904fcb7b068f07e625edad8625fc6c45976 |     
   armeb     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/806ae1544116cbd9303575f60f538b32fd366be4 |     
    sh4a     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/d6453268417dce415924804369a056a3f98a8695 |     
   arceb     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/859483fcca267c1c4bca068cca9f545e07f88faf |     
   armeb     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/072951c77611e4050c1c807c2b06df6b38138f28 |     
microblazeel |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/0057632d04e7c079e935b8e16389b9145562b95c |     
   sparc     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/1240b3d1fbe839576f1bec88eec2baba5ca5bf7f |     
   arceb     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/cca972124cf8b31e0ca19f7c30b177c9ae202abb |     
   mips64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/22c53d9e8ab3db4efe333f8b3bae49bd981a5085 |     
    arc      |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/954a6b80e40e082ea88c3bd578b68d45e7da514a |     
   xtensa    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/10573b42c495f830a5f74bb3097467c35064eca7 |     
powerpc64le  |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/3fb14ca845d0323ac8fde0153d93ce10e1cd70fd |     
 aarch64_be  |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/0f293419d6ab4190a5e7086d5cff13b0287dfdcb |     
  aarch64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/ac26e6925e4b9462ead5e40bd2da8d9e350e6da3 |     
    sh4      |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/53c1ac8392a6d05e91220a31697c28bda93eb88b |     
    arm      |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/d5ee5eac8f3fcab769a3b3f7f4655e786aba1ffc |     
microblazeel |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/430376e39c41b7ab9360713afc90f25faf59e126 |     
 powerpc64   |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/52436cf9186e04ee801919ea321d0a17a6d6662d |     
   mips64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/627a1bddafb963eff7abb2afa6a433df9d3f2985 |     
    arm      |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/2ee13551c20c6bb70cc06a0c99bb8b2cdf754382 |     
   armeb     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/96b9f2133be91afefb38cc6775565fbc16f0fa0e |     
    i686     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/b13cbae3b839bef42bdb4601bd5617b461f8d8fd |     
   mips64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/26a839e40621dd2f381e7fb4d74faa0f3d91e0c0 |     
    arm      |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/287c477001dcbd8b32840ef8f2f315c3bbff267a |     
    arm      |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/665f94ed9dab2dd1aeeae5d85579fc46dabdfd26 |     
 microblaze  |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/bb112a47f18e9902137e6b3954230c59127a6441 |     
  aarch64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/92e4d4f56a0cb3a49e768740e69f5db9ed0c8240 |     
   mips64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/3469428aa1e109ed9fa72a67bc538636f17743ca |     
powerpc64le  |     host-gcc-final-14.1.0      | NOK | http://autobuild.buildroot.net/results/6dc5a2fab61b40236f56720877c06bb301c5c446 |     
  riscv64    |         host-go-1.22.4         | NOK | http://autobuild.buildroot.net/results/497143ae0349171f821feef1f901216aa7714d44 |     
   mips64    |         host-go-1.22.4         | NOK | http://autobuild.buildroot.net/results/e64fff3b6bb5ea0cb2de04229259185ce97ab78c |     
   mips64    |         host-go-1.22.4         | NOK | http://autobuild.buildroot.net/results/e82deed7119b80fb10baf67f6964b83c65985524 |     
  aarch64    |         host-go-1.22.4         | NOK | http://autobuild.buildroot.net/results/c1f65e3e2dba0335289c310115e81205c7d10f15 |     
  mips64el   |         host-go-1.22.4         | NOK | http://autobuild.buildroot.net/results/1723b7cef4dfee5c2ac2bb6e63f255d403e1e2fd |     
 microblaze  | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/6a61e079d3b380a819e6ccb70f6bd373e3872027 | ORPH
    i686     | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/ab0f4c4620a9c3de9178f33dc18554bcf37a6be3 | ORPH
  sparc64    | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/70b150abf16518733897f9afcfda407ddf0726d5 | ORPH
 aarch64_be  | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/2d3d10317c149afcd19e5e09de3657af7dc97eee | ORPH
   s390x     |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.net/results/ced15fcebdc75ed678ced2d7c47ae93840421c11 |     
    mips     |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.net/results/3e38a7fc0a7c76a674a35165e4ad5a092a28d068 |     
    mips     |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.net/results/91963f1013b8716f1e8adc5950b862c394d7ec52 |     
powerpc64le  |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.net/results/27cc335b84e237f0c382a1d05f79cbd745c02f73 |     
   mips64    |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.net/results/0d3a90170e320583a018542a7e352137f27e3ad2 |     
 powerpc64   |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.net/results/9a4d19c1d87b0c3692f99466f9701f791d29c8c7 |     
  mips64el   |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.net/results/f3f338bd44cf18e957eb07539be9b6fa336cf3e4 |     
   nios2     |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.net/results/f147455debbdc5cc393a54771fb251b50d0a393c |     
 aarch64_be  |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/5ef7a1c1194deddcc33a0dedb0992a803834730b | ORPH
 aarch64_be  |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/e2f70f48e928eb6d748e2e583f16a4b039b9e4b6 | ORPH
  powerpc    |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/69405a84ce1ce45b9833d443a52cc80113c606d8 | ORPH
    arm      |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/cf2dbf80f1beafc6c2ab86a81f42c190d862185c | ORPH
    sh4      |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/d62302149908cc11cab226213d53b468432009e5 | ORPH
   sh4eb     |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/acf4b44b0b490b716004d5b3e025bcf775d05029 | ORPH
   mips64    |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/3182d9ed113a0805930bff63f1bdfd6f49145cb2 | ORPH
    i586     |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/e02ca704f34e6c123d5805c7cd1b185f83a65bdf | ORPH
    m68k     |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/693234d671890312ca517c9e8edbabc012c01aff | ORPH
  powerpc    |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/8fe94f648e51f164443ea83f7f4472b615c19aa2 | ORPH
    arm      |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/5c46c69ac0fcc941c36a391aa651b344ef6fd519 | ORPH
    arc      |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/cfc0d2a7ab4620cc5752920d38d3f9c0fc2f791c | ORPH
microblazeel |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/e3079e579f9225322d032054537b4953c02a84aa | ORPH
   armeb     |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/6140ee8fd78b0fe912f1360fed87da7ac13534c8 | ORPH
 aarch64_be  |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/50ec6c4bd3cee887c799a6490f937b5087c47208 | ORPH
   x86_64    |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/e6278681a501d7a7decde5baeae5169290cbe143 | ORPH
  powerpc    |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/0561408776fa90697b22839b10b6418aead2b146 | ORPH
 powerpc64   |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/caba3f41fed671a821406db37f6676ba809318ad | ORPH
powerpc64le  |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/d2a5d3bc6bf2371f0f1a26148651df1b949f76da | ORPH
    m68k     |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/6fa92934dac02c4c274719cfe37999772555744e | ORPH
    mips     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/5b94eb67ed60afb04ec224eb29b11baf42b55fb1 | ORPH
   mipsel    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/1bc7bbc66635e12aa7f4438eb8a6303f43694a62 | ORPH
  aarch64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/66e6e5957f4ba03a82ca5aa1f7010a8a81ebc626 | ORPH
    arm      | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/e072ae4489dad0f83effc2eedc521ac326b14bc2 | ORPH
   nios2     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/d1d36f3ed175ad1af2caf08d229b390ba5d3266f | ORPH
   mipsel    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/7a1dc6a8f3424cdff16ddd408c826a84eab5c20f | ORPH
  powerpc    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/f22734b9d864bf8d4d29e77f937ff0db044740f6 | ORPH
  sparc64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/1d16a07b1cbf29fa4bb7a8cc3f4bda76a9d588ef | ORPH
  mips64el   | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/4731c5d365dfe6070aac93cacf0257fa4510d660 | ORPH
   nios2     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/345a48e2c7fa48bd4b97befb4e94fcda41e12121 | ORPH
   s390x     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/01d1eb2915887bae1b50cd4e3a278cfa30d08b86 | ORPH
   armeb     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/9dd0ee6eaa5a0c3fad7cc44c5611778e98cd987b | ORPH
 microblaze  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/61ded6273023ee671e9127aba1e3ebe82f42f277 | ORPH
    m68k     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/8977164e44aef47adf8a0f4072b65deed21c610a | ORPH
  sparc64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/4e80dc70cd459ee6d678a6a2be898dfcb3d5f119 | ORPH
    arm      | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/53f92e04124c0b79d05bc0a5739ef26ad49149ae | ORPH
   mipsel    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/6c17ac64b93d693fa8e3a5d38849436d626a01fd | ORPH
    or1k     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/1de54931a16e684eb59770c2638057973059f5e4 | ORPH
    mips     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/fbb17cc2c5863b2ac30f4819044d405e92dd2ad5 | ORPH
    mips     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/71c2752a0d86fffa91f9fa36cc9dae85f53ce254 | ORPH
  sparc64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/496d05d3e93c9e6a8d669b9358a34eb436057b8f | ORPH
    mips     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/28fed977d897e60d12ecbc08fcb57755b05b0ff2 | ORPH
 powerpc64   | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/11fa32ec7f4d18442b12bf7ce4a160d59521a8a2 | ORPH
 microblaze  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/a8d907d5ca4d0f6023746a6227d66cf3683f44ec | ORPH
   sparc     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/26a410a67fc8558f36498bce6086ab6c7655825d | ORPH
 microblaze  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/6888ddaca47492e2f429bd877586863e3dd343d4 | ORPH
  sparc64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/2b756274cf333975cb874b7b894f072e92e51730 | ORPH
  aarch64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/55898a7ac6b48cab0dba6337fa98bfc0960a90b3 | ORPH
 microblaze  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/4e03cc4dbea288f54518011726d144fafccd3d48 | ORPH
   s390x     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/37deb6e52ba32f4547227e053345e5c69d0bde68 | ORPH
  mips64el   | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/2b08bc4431e1495363d4013565e9b888a7b3d003 | ORPH
   nios2     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/6d2e1309170a6478e4a64756433bdddd724f0ba7 | ORPH
  sparc64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/2e3fcd34301ab3c2c7ec7317bb7c1685e72fa8fb | ORPH
    i586     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/33c53a9de11baa52a9127768383996e8a83ed4c1 | ORPH
  aarch64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/fb27ac8ebe09e953b0ec49480633401fccd91f27 | ORPH
 microblaze  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/72cb915c3fb6b05d59d408d9dc41661541c540f2 | ORPH
   nios2     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/8cb613f8b7a7f51be6405bdd999d43539b92b2e5 | ORPH
microblazeel | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/3c015eabb6e1d9c63bd7c12f85c170e3ec9a439f | ORPH
   nios2     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/7d129963cf2e3e3da12e59bf65e2677648fb5089 | ORPH
    sh4a     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/ac8a78d5b1eebb7dcd9a9ba985f43f4728db2f1d | ORPH
    sh4a     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/52de5a07b93be1b8e94d9866ed020dead823814b | ORPH
  aarch64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/b901af2b7da83852123b3742ebbf580b7c1a0ee8 | ORPH
    or1k     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/b7147e283e836ffca859b83d0b99d3e96d874cae | ORPH
microblazeel | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/418763be73e03bce5314e075b27028c0b5343c04 | ORPH
  sparc64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/86c608b35e36163a54b0801f9dd2037c1a3f26b5 | ORPH
   nios2     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/68bf8e40fc44b964f9878548520831e796261793 | ORPH
   nios2     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/892e964bbd26c661145489bce7e4679732793bb9 | ORPH
 microblaze  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/e834fc051dfedc1ab71a830c118e22b40d0741d2 | ORPH
   x86_64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/2d1ca716aa5ae0dfe1422b65e882b31f2664acb3 | ORPH
   s390x     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/5f013bcdb6cf225f7c480c94e82b96bed9ed7a45 | ORPH
  riscv64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/33e50c161d286ac1ecc539f5180e091c76d00fb2 | ORPH
  aarch64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/f5126439a9f7f3ccd80cbcf4959354c8301f3735 | ORPH
    sh4      | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/532cffbea72caf2f97f2de2615e1974b86d14352 | ORPH
  sparc64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/236fc2bfa6b6465ad74158d5847a4087f471e7fa | ORPH
   s390x     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/75606cbf23520d45958ec963e702297dd65846d6 | ORPH
   sparc     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/a66a25f08e2dac030c4af0635f0965b3d1f94ef1 | ORPH
   nios2     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/750a53076b4c7abe6c11f62196d88867f28eb0b5 | ORPH
    i586     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/bb1be0a42f043911e3c24f4912f54cfa02e70e85 | ORPH
  aarch64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/712a1e2706c74fa698dbcaa7d188bdf67c3d3c74 | ORPH
microblazeel | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/bf95b815ae31c846a24555cc8cdd9ee57bca01d6 | ORPH
   sh4aeb    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/f75f1a859175d6cf59038239c6a62e547659d91c | ORPH
    m68k     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/c1fa8a9136e44c3d42a38800b61ecde5e64a974c | ORPH
 aarch64_be  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/846393a621a4a2caf74371d2d0ee37fdaf31f3bd | ORPH
  sparc64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/f8036eb392746b7ad9098acea0c57e15b9f82359 | ORPH
    or1k     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/76fe7168a2335aeb91745e07ab623c5713788f87 | ORPH
   mips64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/96e38edcf742db93a9c787164129ebece58df53e | ORPH
    or1k     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/3a09ccf53db7cd0321677086aece2d42b191c724 | ORPH
   s390x     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/1b0c49b75b59c24e6f561cb766fb2fb1b07518a5 | ORPH
    or1k     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/fee6dab7ffc331af411cbbe76504cee596e23488 | ORPH
   nios2     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/a453be31100960f6886b452521eeaf840ce858d7 | ORPH
  aarch64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/554d52df1cab10756f2d67614d0e550c8abdd3e1 | ORPH
   x86_64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/b712c572e52fc3739b96dba7c6f0cea95c90e374 | ORPH
powerpc64le  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/309302946d497206d98a7e1a40ce5ef5bbe0b4ef | ORPH
   nios2     |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/5c876643e0240cd7aa7b3a99330a1f00d7c494e5 |     
   mips64    |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/3b22414740abb55a22f44b24cff25a4551d83038 |     
microblazeel |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/7474ab8605c5407e8930d734f610a14328a8fc71 |     
   nios2     |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/722dd0a133d9a3926278631c9af3839085eb2d95 |     
   xtensa    |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/9ed329d46d0a5349cc241583d3d6e53bdbb513e9 |     
    or1k     |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/f40cf424866013af2aa984e15c2dfc72b2cbd1b2 |     
powerpc64le  |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/207d8429088a9237ec39420b6257b6e390a646d7 |     
   sparc     |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/128320ba96a164b97c2e919a45fded5111443afe |     
   sparc     |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/dc5e1ab022ceb841207f64a0cee53885ea04f2af |     
   mipsel    |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/9637cdc085124cff5b7bf95a24d63e45c84ae7de |     
 powerpc64   |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/b65cef6bc4df8774dfdb59898828b16091a594b2 |     
 aarch64_be  |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/13cde1c9e0458da528c96c71ea44acae510875df |     
    arm      |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/2a3da02ec461cbb8b90fa0136148b139c2c60487 |     
   mipsel    | host-softether-4.30-9700-beta  | NOK | http://autobuild.buildroot.net/results/c5b13524f37d4b3158fdbaee89ac98244542f015 | ORPH
   armeb     | host-softether-4.30-9700-beta  | NOK | http://autobuild.buildroot.net/results/ba6932f7f1d7a8f4c5e358ca7c3f0995772a03fe | ORPH
   sparc     | host-softether-4.30-9700-beta  | NOK | http://autobuild.buildroot.net/results/7a0de09359b5b49b91c03c18ee11fdcb4fc74ae2 | ORPH
   armeb     | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/ae6135d63f802401fba104f9b50c868047c0058f |     
powerpc64le  | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/d4984be0d677b0e1673db4e6c9ccf4a9e066acf7 |     
 powerpc64   | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/7d98ed7571652d9e5a0afad6cf2b23f0a5666cb7 |     
    mips     | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/daf680bdf3e07aad0f6d338bcdc6c6d58ce82bd7 |     
   sparc     | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/84a590b6b3d2432b57c634b1113f9a537b4581d9 |     
   s390x     | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/641ba52541e72b067e60fb6b5414aeaa61ead672 |     
   s390x     | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/71a17d326691a1664379c9fd08b972ca7eccdd12 |     
    mips     | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/a5d9461ba67532ade6a408518a1a67e35a4e7aa2 |     
   mips64    | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/4983d9acee38079fedd92710cd16b6ae614d277d |     
    m68k     | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/41d7ef24c4dbb86876a324e67ea9a3ab72040cc7 |     
 powerpc64   | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/e45d08fcc104afb3ff1c53acb6f817f80dd1c9ec |     
   mips64    | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/d57e05ebd8f73043c469a693d5aeff370fdabd0d |     
   mips64    | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/6f5b4bd764a2d27f932a23060ef482b5103f3c0f |     
   nios2     | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/c13a78a025dec20011ac9c10a5448cbf713b7629 |     
    mips     | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/337026dd458f409678dee2fc8100f1e6f9176378 |     
    i686     | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/38863536089730d3394d3feecdacffc901201788 |     
 aarch64_be  | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/054da93eb53250c2b4050d0e5b24635d3604d890 |     
   x86_64    |          hwloc-2.9.3           | NOK | http://autobuild.buildroot.net/results/3f5d98f44287db4ca06586fe7836fd603ce3bc07 |     
   s390x     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/c9f22ee1ac7e0c0b56370a70636f4db01d8486d8 |     
   sh4aeb    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/70e049015dbf282f6270053b7974c0ca2b36bdb9 |     
   nios2     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/8faaf02b55431be2b4732a343e4eeeec6eb1b991 |     
    mips     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/5c64d43a4761f3dc198082a0974fb2b85326b8c1 |     
   nios2     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/998f09338fce89498f3ba671f85d861bccb8d5d9 |     
   sparc     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/59f6858815f8ce25d7b5fb8307f3cbe9beb9bcbb |     
  sparc64    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/2de5bfd92fd43df06e69a965e5ff9c20bef71d28 |     
 aarch64_be  | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/e995b8544e8d1b2af0892484feba9521f19ed806 |     
   mips64    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/62b9df0b610fcfeb302b266aad0541a77ca8ecd7 |     
   x86_64    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/6ff80fc367de2fc974f6cf0c9826d79bdd2ca6d5 |     
powerpc64le  | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/9889e705352aedf57720bc9ceda38fd3bfd42ab5 |     
    mips     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/1f72e13a6eba4339bc738198eed95974a20da5bb |     
    or1k     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/8dd79fbf1e85c213ca29f5849bb3fbb403b6f461 |     
   sparc     |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.net/results/b88f25ac2143b8b051c8d9555f519a670a932ca3 |     
    m68k     |          jack2-1.9.22          | NOK | http://autobuild.buildroot.net/results/1475183f1626f00d6ae529954abc620ad92a274a |     
  riscv64    |         jemalloc-5.3.0         | NOK | http://autobuild.buildroot.net/results/adf52f767c92ab1db7b817094a3929f3cf918e82 |     
  riscv32    | kvmtool-4d2c017f41533b0e51e... | NOK | http://autobuild.buildroot.net/results/5e8f72f2bcf4d6a1574019138ef2e3ca7e41c1b6 | ORPH
   sh4aeb    |         lapack-3.10.1          | NOK | http://autobuild.buildroot.net/results/ea910542c3035eaec246da8c5aaac1fab4c66faa |     
   mips64    |    libabseil-cpp-20230802.1    | NOK | http://autobuild.buildroot.net/results/495f2d347104b8fbdfe84336e8fcb8237d459a80 |     
   sparc     |        libarchive-3.7.4        | NOK | http://autobuild.buildroot.net/results/6bd0a20fe04686e526fa4e4562951a29341b765b |     
    arm      |        libarchive-3.7.4        | NOK | http://autobuild.buildroot.net/results/500487c9cf1ea76131adcc657e5fcfd7439afa6c |     
    m68k     |        libarchive-3.7.4        | NOK | http://autobuild.buildroot.net/results/a1f40b7cea39e4157432a9a6d3b9ae9ef2d9a539 |     
   armeb     |        libarchive-3.7.4        | NOK | http://autobuild.buildroot.net/results/aff8f286bf55e2524e0af53bd1d08ce35716b873 |     
   s390x     |        libarchive-3.7.4        | NOK | http://autobuild.buildroot.net/results/2f6976e0cb4317762ac1701a74f6bfb264cbb0f0 |     
 aarch64_be  |        libarchive-3.7.4        | NOK | http://autobuild.buildroot.net/results/da73ee683f81e6b14d83435d4e1c9d608c411f45 |     
    i686     |        libarchive-3.7.4        | NOK | http://autobuild.buildroot.net/results/6cd33868091be8a89659255eea757849a2c30a23 |     
    arm      |        libarchive-3.7.4        | NOK | http://autobuild.buildroot.net/results/3d7d39b81c70fc5eb9fbb4775f6d1ec38e108b8f |     
    or1k     |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/384fe0cb262da5e340ae391eaecb5a6426dc748a |     
 aarch64_be  |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/adaddf548b3721d5cf1a2e35a098411255ce3f1c |     
   xtensa    |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/9eb8300efa417ee96a80984656945fef9a76530e |     
   mips64    |         libcoap-4.3.4          | NOK | http://autobuild.buildroot.net/results/69fd759df6c638d977cfab926a257da16990a128 |     
 microblaze  |         libcuefile-475         | NOK | http://autobuild.buildroot.net/results/1562663d25787680641ddc770e2613cfda66ebcd | ORPH
  aarch64    |        libdeflate-1.20         | NOK | http://autobuild.buildroot.net/results/56e5688b5df98548350d431c7e51e507640ff1cb |     
   sparc     |         libdrm-2.4.120         | NOK | http://autobuild.buildroot.net/results/bce282c57b19f73c61c3ef2ce16a264ddb09edad |     
   sparc     |         libdrm-2.4.120         | NOK | http://autobuild.buildroot.net/results/cc7706905f6236352908e6958d367a663a90db74 |     
    arc      |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/6ad557428305f1d58f58f8b3dd8365b83a2eba56 |     
   arceb     |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/d467c18315c741ca526a9af95d3a1dde108ff688 |     
    arc      |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/8ea83918db8eca95b4834c50dbd622c7596981e0 |     
    arc      |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/d6f92c4e36e3b652879522e624c862c20649ec2e |     
   arceb     |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/8760728ffe89f01c26a3154671e4a8d1f5d2c1f9 |     
   x86_64    |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/3a7f8fb101803a4ff0b5a64b9bf14efb72bed86f |     
    arc      |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/f6a01b7bdd7193985df104026f9b1c6da00f3626 |     
   arceb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/3d3cfddbef7992a31112ea972c4fd2f773f4bd4d |     
   arceb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/b7f96eb5f8413f012a369d6b4760466de7503bd7 |     
    arc      |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/b982e277b867cff9ebfde4c9377a0e6ea5be783f |     
   arceb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/88ec60960a5f57e9b08c41b932376c4522eaf5bb |     
  mips64el   |          libnss-3.100          | NOK | http://autobuild.buildroot.net/results/2723688bb6028dac4f6c3514d0dcaaed331f9b95 |     
   armeb     |          libnss-3.100          | NOK | http://autobuild.buildroot.net/results/aae824f9fc34ffc3a76e71d815124e215ba0e482 |     
microblazeel |        libopenssl-3.3.1        | NOK | http://autobuild.buildroot.net/results/060a1459451589786378f719a98506199fd2199f | ORPH
    arc      |        libopenssl-3.3.1        | NOK | http://autobuild.buildroot.net/results/e8a5ffd39d715c56ee9d92cadcdcddd8257df797 | ORPH
    arc      |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/7fbc444fa042655e482ae4c86b05c58169775f2d | ORPH
    arc      |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/5f64528ba94851df78aef81cf2665dfb661f939a | ORPH
   mips64    |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/385b06d29d9aed38a730060821a768356244e6e4 | ORPH
   sh4aeb    |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/b82a5e7fb188266005c0c2ee62163243d3be4a88 | ORPH
    or1k     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/e953d2adb63b83a1d58b5961634c8b95cd5f2864 | ORPH
   xtensa    |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/bf781ca69f4d3b4dcca0cef4e7f360b3e053584e | ORPH
  mips64el   |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/353a0f4512ebca9539825bf3c8ba663380ba65f5 | ORPH
microblazeel |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/1e889f7e3d6f4b207812195d1f510ff66cdf8404 | ORPH
   s390x     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/b2650987df0c35abc7573cd2b0ba2f28d0cbf381 | ORPH
   arceb     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/61972fe5d6213838d58d890867c98d52fdd616f1 | ORPH
microblazeel |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/0d2e2e222d7e2a212b1d6cc80d3903a12887cc15 | ORPH
    sh4      |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/0406ac65841b14400287f25ace9d91046fba473a | ORPH
    sh4      |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/e183db042855667e843e23c505fe5473b735b8ce | ORPH
   sh4eb     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/33864056ae3ce1167fb8959bc1fe4ec0b0868135 | ORPH
   sh4eb     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/9fb21b50f47d3a6ad2de65467176cd0f9e935e5d | ORPH
    arc      |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/5a791d2fd5e8036700ed8130d46d5bcf86d0fd3d | ORPH
   nios2     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/98b7c8775bd28fffd9e9c4e26f2c27dd3f986953 | ORPH
   mips64    |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/f46d303af655768cb818dd520782989ba9e0a4c1 | ORPH
   xtensa    |          libsepol-3.6          | NOK | http://autobuild.buildroot.net/results/d41d42a2347dd2ca7d29a37712da161e73d02f9b |     
    i686     |        libtracefs-1.8.0        | NOK | http://autobuild.buildroot.net/results/aa016643fcc039c3f3d9c026fb069ded15c2884a |     
   armeb     |     libzenoh-pico-0.11.0.1     | NOK | http://autobuild.buildroot.net/results/9a043406668753062557f364671bb1030b9dc063 |     
   sparc     |        lighttpd-1.4.76         | NOK | http://autobuild.buildroot.net/results/6d069f69b37634dbdeb6158093552d1ac603465b | ORPH
   sparc     |        lighttpd-1.4.76         | NOK | http://autobuild.buildroot.net/results/1733fe1649b6603c0418b6855658a0a1617ecdda | ORPH
  powerpc    |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/ed16a2c289c6c1d0030f8b643c0057fccf430ee7 | ORPH
   sh4eb     |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/198de9ad86e1df7807553f5e2c9dadbe49a16b4e | ORPH
   nios2     |          linux-6.8.12          | NOK | http://autobuild.buildroot.net/results/c2b4c637c6be17a2b9a1defa5228068bd8c07b42 | ORPH
   mips64    |          linux-6.8.12          | NOK | http://autobuild.buildroot.net/results/a81600eae036e85bf88e3a5a485de5e52338813c | ORPH
   nios2     |          linux-6.8.12          | NOK | http://autobuild.buildroot.net/results/b3eda09ae6800bb3cf812520f19b4ef941aecdd7 | ORPH
    mips     |          linux-6.8.12          | NOK | http://autobuild.buildroot.net/results/3d0cc969b4092b414541217a34e842ce23ca855c | ORPH
 powerpc64   |          linux-6.8.12          | NOK | http://autobuild.buildroot.net/results/b2b33ab92ff105a6f8a429cd3666942bc82ba28c | ORPH
  powerpc    |          linux-6.8.12          | NOK | http://autobuild.buildroot.net/results/2bd33d2935559bfbe7570a7ede92f5a1feff8117 | ORPH
  aarch64    |          linux-6.8.12          | NOK | http://autobuild.buildroot.net/results/1fe035eb9bd8429d00964e1a371f8821228d578c | ORPH
    sh4      |          linux-6.8.12          | NOK | http://autobuild.buildroot.net/results/e34e21c071a5442ce118a1153fced314f7256bd3 | ORPH
   mips64    |          linux-6.8.12          | NOK | http://autobuild.buildroot.net/results/b51b36807069df928a8c1c410745e975b971f6d3 | ORPH
  powerpc    |          linux-6.8.12          | NOK | http://autobuild.buildroot.net/results/79d9d00210665aa9f48bfff07e74bab30ed1155b | ORPH
  sparc64    |          linux-tools           | NOK | http://autobuild.buildroot.net/results/5aa99ec0602813789418f1d21e3a26d0a351ba55 | ORPH
 aarch64_be  |          linux-tools           | NOK | http://autobuild.buildroot.net/results/ce2a603deb2606e81d53f873fd6962031e3bc319 | ORPH
    arm      | ltrace-82c66409c7a93ca6ad2e... | NOK | http://autobuild.buildroot.net/results/4f3a6d84a4b5f34a5d4f158f7591d0df7732c1ea | ORPH
   armeb     |     lttng-modules-2.13.10      | NOK | http://autobuild.buildroot.net/results/3a7995cef608cfcba60e622ee33992875e41e6aa |     
  aarch64    |           lxc-5.0.3            | NOK | http://autobuild.buildroot.net/results/dfe4a44a5b2e9f2c28e5350522187f3cd6d7d839 |     
  riscv32    |           lzop-1.04            | NOK | http://autobuild.buildroot.net/results/2445c26b16fe63def022b9a561940c00c811424c |     
microblazeel |        mariadb-10.11.6         | NOK | http://autobuild.buildroot.net/results/307c13b759404f647a7a866febd636ac0ab46d41 | ORPH
   sparc     |        mariadb-10.11.6         | NOK | http://autobuild.buildroot.net/results/3e5298a8756b65a5a305166259e806c8b70564da | ORPH
    i686     |         memtest86-6.20         | NOK | http://autobuild.buildroot.net/results/9b629e6c8e71fed2a52707671763afdaed33a609 |     
    m68k     |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/c3e8106fb4d15e4a6466ba6a831d10dab0bf5dcc |     
   sh4eb     |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/853bd5e173cd56148aec64ae39455fffb7ecfcee |     
   armeb     |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/0c6c59a23752e474554b1afdf71c8f531e46fc7c |     
powerpc64le  |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/153073685fa9a106c9ca9dd8dbc7e8752c13aed1 |     
 aarch64_be  |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/6b8f4cdb6b67245c05d35a156681f2c0c8510e78 |     
powerpc64le  |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/145b685bc8b6295479c398ae651bf4ee3a62f773 |     
 microblaze  |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/84249e8a6a6d90f819e65ed8ee53506205a380b4 |     
   arceb     |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/0a1890a5202018f7e42363d584e72ae83caf71d0 |     
  sparc64    |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/d88f3610f9726869065bfc9d441fa042cd743a09 |     
    arc      |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/c53f45dcc19182299e6c7a5c585089baa65569b4 |     
    or1k     |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/52807f3e6492db0283b72360b33edc53a67b5088 |     
  sparc64    |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/c4499c1483f63ef09309743e67c247a1e321e5fe |     
   s390x     |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/b043bad272ac5b3f753fe9587eaee799add0ec39 |     
   armeb     |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/a3600c4599a0f9f7ccbb42a5ee7b6b9eacfd57cd |     
   nios2     |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/77ca21f41657a44e71b6df88cc05ed428d7df863 |     
   armeb     |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/ed41a6cecfe18b4ed62adabf455132424d488f4f |     
   x86_64    |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/056dc78b285b7f31c01f2462e0ffb7be0c80b4dd |     
    mips     |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/1cd24527ebee0712c0284b9a7fdd652da7f002f2 |     
   x86_64    |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/70cfc146183e4bae6ee369ef75a07846be4dce28 |     
  sparc64    |          ntpsec-1.2.3          | NOK | http://autobuild.buildroot.net/results/b7a51c4148946814317be2a320b792ad785b9970 | ORPH
   sparc     |           nut-2.8.2            | NOK | http://autobuild.buildroot.net/results/d86313d95a61a9b8238ff52741ca04121a31b4a3 |     
   nios2     |       open62541-v1.3.10        | NOK | http://autobuild.buildroot.net/results/d30015c0d288bbf611834121bea10e72f842120c | ORPH
  mips64el   |        openblas-0.3.27         | NOK | http://autobuild.buildroot.net/results/593e8741988fc2c9a604677e287f4533344ea8cc |     
   armeb     |         opencv3-3.4.19         | NOK | http://autobuild.buildroot.net/results/c23d8db910db79c048d675362160cae92ab2d25a |     
   mips64    |         openssh-9.7p1          | NOK | http://autobuild.buildroot.net/results/71fe459a1b3d156728eea71833d68278d13c46fe | ORPH
powerpc64le  |         openssh-9.7p1          | NOK | http://autobuild.buildroot.net/results/aa31e49d62a87c5ceea6916bac399981c3ca7162 | ORPH
    mips     |         openssh-9.7p1          | NOK | http://autobuild.buildroot.net/results/0127d92e7127dc4a43470010ab89e0a7b845adfb | ORPH
powerpc64le  |         openssh-9.7p1          | NOK | http://autobuild.buildroot.net/results/1676b2c50625e58fcd30fc4093271cc6405a9286 | ORPH
    mips     |         openssh-9.7p1          | NOK | http://autobuild.buildroot.net/results/d88b30d10fb89e26e3cfbba0333a8588e5e8154d | ORPH
   mips64    |         openssh-9.7p1          | NOK | http://autobuild.buildroot.net/results/bd0f87f3003cddf931bd183d37cf288a7da69c94 | ORPH
    mips     |         openssh-9.7p1          | NOK | http://autobuild.buildroot.net/results/51373038e5a8ac6004af09250860dc28368a7a9e | ORPH
  sparc64    | pppd-e1266c76d1ad39f98f1167... | NOK | http://autobuild.buildroot.net/results/f005010e659e5335cdbef5a258441a6a3d92a696 |     
  sparc64    | pppd-e1266c76d1ad39f98f1167... | NOK | http://autobuild.buildroot.net/results/5654060669338920769de108b0da02ffea33c938 |     
   sparc     | pppd-e1266c76d1ad39f98f1167... | NOK | http://autobuild.buildroot.net/results/1f6e10f6fa688654a16005d2bea1fa4bf56c4b7b |     
  sparc64    | pppd-e1266c76d1ad39f98f1167... | NOK | http://autobuild.buildroot.net/results/fc1d5c3b7f927c97b4776ed65c21453c1c1804a3 |     
   sparc     | pppd-e1266c76d1ad39f98f1167... | NOK | http://autobuild.buildroot.net/results/21969084f34c89406194f1d32de2a6a477ad5908 |     
 aarch64_be  |      python-grpcio-1.60.0      | NOK | http://autobuild.buildroot.net/results/7f4a4ee80fb6b62b7e8776b3cda1a12b9aca97c4 |     
  mips64el   |      python-grpcio-1.60.0      | NOK | http://autobuild.buildroot.net/results/e6cb7f473a28af8b53e7cbb8d8a582adffdeb66e |     
  powerpc    |  python-pydantic-core-2.14.6   | NOK | http://autobuild.buildroot.net/results/4a3d4762c6c0e9ab24b8201611670ab0d5478e28 |     
    sh4      | python-unittest-xml-reporti... | NOK | http://autobuild.buildroot.net/results/876eda676e385898fdeae31770cc1ff13579def5 |     
  powerpc    |       quickjs-2024-01-13       | NOK | http://autobuild.buildroot.net/results/2c77f2bdf65daa8ce6e8ce3c8d12663113cf7849 |     
powerpc64le  |         rocksdb-6.20.3         | NOK | http://autobuild.buildroot.net/results/067d7cadb204f7f98f32aaef4fcd367c57597e68 |     
powerpc64le  |         rocksdb-6.20.3         | NOK | http://autobuild.buildroot.net/results/b29a02fd15ef5ce09aeff8df22bdae86d348755e |     
    or1k     |         shadow-4.14.5          | NOK | http://autobuild.buildroot.net/results/81bf1d7f54ebd64b6f21ff564a9ae9df265e68f8 |     
 powerpc64   |         shadow-4.14.5          | NOK | http://autobuild.buildroot.net/results/86810c7ff02acc618d5fb74db90e8bbd49d49241 |     
  aarch64    |           shim-15.8            | NOK | http://autobuild.buildroot.net/results/02650438b714d5b2768573700a97e6b75b6270fd |     
  sparc64    |        skalibs-2.12.0.1        | NOK | http://autobuild.buildroot.net/results/945b0b151bbd3fd9064e5a0e30b3cf20f1225e76 |     
   s390x     |        skalibs-2.12.0.1        | NOK | http://autobuild.buildroot.net/results/a3db596bff613ade07c992ee9536b518d4c3baa3 |     
   x86_64    |       sofia-sip-1.13.17        | NOK | http://autobuild.buildroot.net/results/54403faff939c05678277289a9f74ae817379c81 |     
  powerpc    |       sofia-sip-1.13.17        | NOK | http://autobuild.buildroot.net/results/5a9825553f8f8c2c98ce3747e5b720b82bb0c409 |     
    arm      | squeezelite-71c012ad9ba102f... | NOK | http://autobuild.buildroot.net/results/1427d72587dc237d7adacbcdbc0460087a6ae85a |     
   sparc     |       strongswan-5.9.13        | NOK | http://autobuild.buildroot.net/results/a9e3e686cdfb938c65ede80cb59ee29fc70aab81 |     
  sparc64    |       strongswan-5.9.13        | NOK | http://autobuild.buildroot.net/results/b256e06707e6c2746e32109ff6de1aa5457be4b3 |     
   mipsel    |          trinity-1.9           | NOK | http://autobuild.buildroot.net/results/6e4594ab5ef4b7ff1a86fefbc2adc224a4971346 | ORPH
   x86_64    |          trinity-1.9           | NOK | http://autobuild.buildroot.net/results/c8219347bd75d09823e28358dfe230056aa1a828 | ORPH
   mipsel    |      uboot-tools-2021.07       | NOK | http://autobuild.buildroot.net/results/3cd55f0ef8091dd66e21c2161d54caa663d103b8 | ORPH
   sh4eb     |         uclibc-1.0.48          | NOK | http://autobuild.buildroot.net/results/80cdc3fa446d4a9f421a88be76c2afc60459b774 |     
    or1k     |         uclibc-1.0.48          | NOK | http://autobuild.buildroot.net/results/e2554cd714036c57afc441ba4092088aa4a12e69 |     
    or1k     |         uclibc-1.0.48          | NOK | http://autobuild.buildroot.net/results/81864fa8e96884cf8209470b0c0bdd9ecc7bf30b |     
  sparc64    | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/ab18895b5c4593e2c624fc6bafd2b994d6335f57 |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/61e51dba54ba9b960925bbc7c81cb8bd621e9d06 |     
   arceb     |            unknown             | NOK | http://autobuild.buildroot.net/results/2d898c43981cc972fa4a8ad212595ba69550f78e |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/cb6b30bd857cdc0220fedadeb163718e076959e7 |     
 microblaze  |            unknown             | NOK | http://autobuild.buildroot.net/results/fe78489dceec68b85369640d5e0228481a7364f5 |     
   arceb     |            unknown             | NOK | http://autobuild.buildroot.net/results/775e86f79d2922fa2e6e4897e015b279e206c270 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/45d85022d474b9dfbf42a8c1e307f6ab05937ee0 |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.net/results/47cc7698d9ffbfb702206a3f3fe0908d01e094f2 |     
   x86_64    |      v4l2loopback-0.12.7       | NOK | http://autobuild.buildroot.net/results/0359436c983233feddd9ab012a4017d2d680cff9 |     
  mips64el   |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/1b90165357a552a4fc1189b3219568f39196a1f8 |     
  mips64el   |           z3-4.13.0            | NOK | http://autobuild.buildroot.net/results/5a54d2448d9d9d8b932d75918a77b15b035de080 |     
   x86_64    |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/ac5d2f572b435d9a1053c5f198505841ee0ce2b5 |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

google-breakpad-f49c2f1a202... | 1 
          libcamera-apps-1.2.1 | 1 
               mariadb-10.11.6 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mipsel    | google-breakpad-f49c2f1a202... | NOK | http://autobuild.buildroot.net/results/55563426e59ad784f2999c357330d42cc31db802 |     
  aarch64    |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/54d49205660cacaa5c553f1be714b66edbbee389 |     
   sparc     |        mariadb-10.11.6         | NOK | http://autobuild.buildroot.net/results/90659977a896324e58f90b110290ae6ba29af4fe | ORPH



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
