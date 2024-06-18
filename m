Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E31EDC27C4F
	for <buildroot@archiver.kernel.org>; Tue, 18 Jun 2024 04:48:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6BD1240154;
	Tue, 18 Jun 2024 04:48:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 81FP2d5i0aIH; Tue, 18 Jun 2024 04:48:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BD29E40B86
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BD29E40B86;
	Tue, 18 Jun 2024 04:48:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5A44A1BF286
 for <buildroot@lists.busybox.net>; Tue, 18 Jun 2024 04:48:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5486860B25
 for <buildroot@lists.busybox.net>; Tue, 18 Jun 2024 04:48:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LQntyQesCTzU for <buildroot@lists.busybox.net>;
 Tue, 18 Jun 2024 04:48:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B0912608E8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B0912608E8
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B0912608E8
 for <buildroot@buildroot.org>; Tue, 18 Jun 2024 04:48:28 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 348171C0008
 for <buildroot@buildroot.org>; Tue, 18 Jun 2024 04:48:26 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Tue, 18 Jun 2024 04:48:26 -0000
X-GND-Sasl: bot@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1718686106; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=2wM5Acz8QOkdjmXWNGY47IgeqxcEYhDbLuiOWb7VD60=;
 b=nH2T05IEEXQ55uIx7mtrBRswxyRHGV9K4njDghHZXDHQANHbQaFlghjY7xJu92lmRR3rXg
 GCbZLQnsFm8YGYNSmAPHQUjG36M1ViMYMrYDV2g2jHFT/fczXFqK24wb+5NRwRLs8oBNqc
 M3BBa1sqBeO+/z8xZh6wu8zrZm6uRgDQB4EbadPMQwPTAnD53CW8x8icFz8rDjLoAU55DA
 ODMO62UEvSTCo1SdnV0oLqZ01pXyGaIp76iOE7qH2VqaDd83tbydzXZsATwerEN8IR625y
 2HhyZrgC3hTLS+QHJz2U980BuJcOe4S8OUkTKHmpusVtpTSs8euAsm0gzQyGJg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=nH2T05IE
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2024-06-17
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
Message-ID: <20240618044826.7dyvDQTd_zlnKRKIpUL8nZ_KiciTZPtarqy4NoObbXY@z>

Hello,

Autobuild statistics for 2024-06-17
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  6  | 11  |  0  | 17  |
  2024.05.x  |  3  | 12  |  0  | 15  |
    master   | 152 | 374 |  0  | 526 |

Classification of failures by reason for master
-----------------------------------------------

            host-cdrkit-1.1.11 | 45
host-prelink-cross-a853a5d7... | 43
                libressl-3.8.4 | 15
                    mpir-3.0.0 | 14
                fail2ban-1.0.2 | 12
ibm-sw-tpm2-5452af422edeff7... | 11
                   host-go-src | 9 
                host-odb-2.4.0 | 9 
check-11970a7e112dfe243a2e6... | 7 
                  ffmpeg-6.1.1 | 7 
                gnu-efi-3.0.18 | 7 
host-android-tools-4.2.2+gi... | 7 
      host-riscv-isa-sim-1.1.0 | 7 
                   linux-6.9.4 | 7 
aer-inject-9bd5e2c7886fca72... | 6 
                  bcusdk-0.0.5 | 6 
                elfutils-0.189 | 6 
glibc-2.39-74-g198632a05f6c... | 6 
host-vboot-utils-bbdd62f9b0... | 6 
                       unknown | 6 
                 coreutils-9.3 | 5 
host-heimdal-f4faaeaba371ff... | 5 
                s6-dns-2.3.7.1 | 5 
                 uclibc-1.0.48 | 5 
 host-softether-4.30-9700-beta | 4 
              libarchive-3.7.4 | 4 
                  libffi-3.4.6 | 4 
               libglib2-2.76.1 | 4 
                 openssh-9.7p1 | 4 
aubio-152d6819b360c2e7b379e... | 3 
                   bzip2-1.0.8 | 3 
                   cpuload-0.3 | 3 
                   foot-1.16.2 | 3 
            gdk-pixbuf-2.42.10 | 3 
brcm-patchram-plus-95b7b691... | 2 
                 cdrkit-1.1.11 | 2 
         host-libxcrypt-4.4.36 | 2 
               ipmitool-1_8_19 | 2 
               lighttpd-1.4.76 | 2 
     linux-5.10.162-cip24-rt10 | 2 
                  nginx-1.24.0 | 2 
             util-linux-2.39.3 | 2 
                acpitool-0.5.1 | 1 
android-tools-4.2.2+git2013... | 1 
                    attr-2.5.2 | 1 
     bandwidthd-2.0.1-auto-r11 | 1 
                    bat-0.24.0 | 1 
                   bird-2.0.12 | 1 
                  bitcoin-26.0 | 1 
              bluez-alsa-4.1.1 | 1 
                  boost-1.83.0 | 1 
                  clang-15.0.3 | 1 
                    cramfs-2.1 | 1 
          cryptodev-linux-1.13 | 1 
             dahdi-linux-3.3.0 | 1 
                 dc3dd-7.2.641 | 1 
                   duma-2.5.21 | 1 
                  dump1090-9.0 | 1 
                    dust-0.9.0 | 1 
dvb-apps-3d43b280298c39a67d... | 1 
               ebtables-2.0.11 | 1 
        edk2-edk2-stable202308 | 1 
                     faifa-0.1 | 1 
falcosecurity-libs-e5c53d64... | 1 
                    fcft-3.1.6 | 1 
              fftw-quad-3.3.10 | 1 
flutter-animations-example-... | 1 
                  gamin-0.1.10 | 1 
           ghostscript-10.02.1 | 1 
        gmrender-resurrect-0.1 | 1 
                 gnuplot-6.0.0 | 1 
google-breakpad-f49c2f1a202... | 1 
                 hddtemp-0.4.3 | 1 
                 hiawatha-11.2 | 1 
         host-gcc-final-14.1.0 | 1 
              host-rust-1.74.1 | 1 
                    htop-3.3.0 | 1 
                  jack2-1.9.22 | 1 
jailhouse-e57d1eff6d55aeed5... | 1 
kvmtool-4d2c017f41533b0e51e... | 1 
                  ledmon-1.0.0 | 1 
          libcamera-apps-1.2.1 | 1 
                 libcli-1.10.7 | 1 
                libcuefile-475 | 1 
libdill-32d0e8b733416208e04... | 1 
                  libsepol-3.6 | 1 
              libtracefs-1.8.0 | 1 
               libunwind-1.8.1 | 1 
libutp-c95738b1a6644b919e5b... | 1 
          linux-5.10.162-cip24 | 1 
                   linux-tools | 1 
        ltp-testsuite-20240129 | 1 
                     mtd-2.2.0 | 1 
                  ntpsec-1.2.3 | 1 
   openvmtools-11.3.5-18557794 | 1 
                    opkg-0.6.2 | 1 
pppd-e1266c76d1ad39f98f1167... | 1 
          python-grpcio-1.60.0 | 1 
         python-remi-2022.7.27 | 1 
                python3-3.11.8 | 1 
rtl8812au-aircrack-ng-f2397... | 1 
                     shim-15.8 | 1 
             sofia-sip-1.13.17 | 1 
squeezelite-71c012ad9ba102f... | 1 
                    sslh-2.0.1 | 1 
                 tbtools-0.4.0 | 1 
uclibc-ng-test-0f303c63fab7... | 1 
                   uhd-4.3.0.0 | 1 
ulog-0389d243352255f6182326... | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 microblaze  |         acpitool-0.5.1         | NOK | http://autobuild.buildroot.net/results/652a562be40986ae822f51d0a972de8979e28721 |     
   armeb     | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/d652ed166259a425768024afc075a00f8521f932 | ORPH
   mips64    | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/9b2ed27de78612bd6a3bf3452632ab162c63ce48 | ORPH
   mips64    | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/96d122efd60b1f98ca042c062269e53690e1d8b1 | ORPH
   s390x     | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/bf175364dcaf197f079d93de9107010ea060bce2 | ORPH
   nios2     | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/c870e9e1b057ec3d47b5bbb350650115a79aabf1 | ORPH
   nios2     | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/e134e30b0987707e1c082dc05c2ebbc925539f2d | ORPH
   mips64    | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/1f27331212816d50687661b5bcefa771c2e7b8c1 |     
    mips     |           attr-2.5.2           | NOK | http://autobuild.buildroot.net/results/a9c5981037e8c3fc74be0af6991d0c18263e31e5 |     
 microblaze  | aubio-152d6819b360c2e7b379e... | NOK | http://autobuild.buildroot.net/results/29fcd9219d2979b7ce043b46afeffde276197f8d |     
   s390x     | aubio-152d6819b360c2e7b379e... | NOK | http://autobuild.buildroot.net/results/0f1f0215785303d2b16b4c9c0b7d891b25f40d2d |     
   s390x     | aubio-152d6819b360c2e7b379e... | NOK | http://autobuild.buildroot.net/results/da5646e8e8c358ac05ddd332a0d209d9bc5f05d5 |     
   mips64    |   bandwidthd-2.0.1-auto-r11    | NOK | http://autobuild.buildroot.net/results/380974a36a92b50dc26cca70844479513759208d |     
    i686     |           bat-0.24.0           | NOK | http://autobuild.buildroot.net/results/9e6d1677817b961ffae05b120a2b87fec534bb05 |     
   x86_64    |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/e3299fd0e8c233df0ffd283efc0ac7f8760171cd |     
  riscv32    |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/1945d1e285157fde3e62cfedb433f2851d0d850a |     
  aarch64    |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/12bbf88da1aae341f2deedb747baccdd8ff826fc |     
   mipsel    |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/5a767592ceea40d292dbafdb4fb629df2f26f3f1 |     
 aarch64_be  |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/630a4ccd72db5920a7073057f8449291976c4974 |     
 aarch64_be  |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/5ee6252a13fff95f8cc88cacebbbd31961c3b838 |     
   xtensa    |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/0cc1a2c5e26045aab0fcd5c0b59c0944c4a5c601 |     
    m68k     |          bitcoin-26.0          | NOK | http://autobuild.buildroot.net/results/150e24abfc200d704e32c4ff5a341b1defddf9f8 |     
   armeb     |        bluez-alsa-4.1.1        | NOK | http://autobuild.buildroot.net/results/54d2397c9a13752455e521b1a7b1bfff3a2048f7 | ORPH
  mips64el   |          boost-1.83.0          | NOK | http://autobuild.buildroot.net/results/c0900de9cf104d0f0f399b8a4063f0548aaef02c |     
   mips64    | brcm-patchram-plus-95b7b691... | NOK | http://autobuild.buildroot.net/results/a7e08f88d5223dbd2c302a187b1dd04b276351d9 |     
  sparc64    | brcm-patchram-plus-95b7b691... | NOK | http://autobuild.buildroot.net/results/0c8b21e5d8154f5f4de1bfc4c48b9b5558cfb244 |     
  riscv32    |          bzip2-1.0.8           | NOK | http://autobuild.buildroot.net/results/d92e11126f7b7ca519418f66882f7ab062a281bb | ORPH
  riscv32    |          bzip2-1.0.8           | NOK | http://autobuild.buildroot.net/results/d71b06bb601f58f0fe679832fd6ed8f9f4834824 | ORPH
  riscv32    |          bzip2-1.0.8           | NOK | http://autobuild.buildroot.net/results/5e3046e029de0ee59f6a9feb7a1a9cdc3344e493 | ORPH
   xtensa    |         cdrkit-1.1.11          | NOK | http://autobuild.buildroot.net/results/316157ec605db055e9f8ee23f545b07c6db7ae58 |     
    i686     |         cdrkit-1.1.11          | NOK | http://autobuild.buildroot.net/results/ef2b20ee93184157765c132118f2d12bdf488fbd |     
    arc      | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/d1becc7d40f3a7278e865c8c922352269275af2f | ORPH
  riscv64    | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/d0750a2d9b67e12fd1d88878a07567431b2d13a4 | ORPH
   arceb     | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/0466a926d7882b1a11781bc226a002901ddc5fee | ORPH
  riscv64    | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/33902889639faea4598a7ef908ee810cb3a44f91 | ORPH
   xtensa    | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/fd33b12b40acc0fb98e0be9e9c2e004ec2e3e381 | ORPH
    arm      | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/c061a9face202e0ee9a97276f84f6d3ba1ecd290 | ORPH
microblazeel | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/2a82215722cd7cf854f821e57f4cad81c2046379 | ORPH
  riscv32    |          clang-15.0.3          | NOK | http://autobuild.buildroot.net/results/25cf7f418a4f348632e0462eac6222636c2f3ac3 |     
    m68k     |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/898323dfe39ccd089e94e1f43c0a4d79803624d7 | ORPH
    arm      |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/2a3d9a481dd2dbfa16386bfb761a4a73b3a17742 | ORPH
    i686     |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/c8deb8d95ebdabac7296d9df85db527bbb83416f | ORPH
   sparc     |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/aad0918adc5d3c695263968c147ea9c6345f0ea5 | ORPH
   s390x     |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/45fa463fa964f3af393e0d6cd37813e9ccfb5c0b | ORPH
   sparc     |          cpuload-0.3           | NOK | http://autobuild.buildroot.net/results/e9967588850213b0700613c426d9c6d61189ea02 |     
  sparc64    |          cpuload-0.3           | NOK | http://autobuild.buildroot.net/results/6370ebce963874524534333f931002e1e88bbac6 |     
    i686     |          cpuload-0.3           | NOK | http://autobuild.buildroot.net/results/01f19915b33df0f5eab7a01a2e869a921102ab1a |     
  riscv32    |           cramfs-2.1           | NOK | http://autobuild.buildroot.net/results/34d889e58c42c0d2759a7bd5a1fb5e3c6ce7609d |     
    or1k     |      cryptodev-linux-1.13      | NOK | http://autobuild.buildroot.net/results/222d879c71e6d2c09c80c8b10d9dffdf9021a11c | ORPH
   s390x     |       dahdi-linux-3.3.0        | NOK | http://autobuild.buildroot.net/results/c57eb7f469c5e59e0442ef9ae3eb502f8638d75e |     
    sh4a     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/88a446c13dd56d363845159f43c6f801cb94350f | ORPH
   s390x     |          duma-2.5.21           | NOK | http://autobuild.buildroot.net/results/41b9e9652ebb2780c84eaf0d9da2be2ab53ff5d8 | ORPH
  powerpc    |          dump1090-9.0          | NOK | http://autobuild.buildroot.net/results/a309a35b791dad19cebf8ae5f4f21979741eef55 |     
    arm      |           dust-0.9.0           | NOK | http://autobuild.buildroot.net/results/1cd4a27eac98ca4afb392d6f405d9c8948be6be5 | ORPH
    sh4      | dvb-apps-3d43b280298c39a67d... | NOK | http://autobuild.buildroot.net/results/52d5509dada9ac48819160c74830203b6562a719 |     
  mips64el   |        ebtables-2.0.11         | NOK | http://autobuild.buildroot.net/results/0df655d373b72196adbd2de36c7540034d524e15 |     
    i686     |     edk2-edk2-stable202308     | NOK | http://autobuild.buildroot.net/results/9c8d316dc94509f0dfc41ff3da5162c354199afb |     
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/b62aeb91091c9100cead47a4e41f9cf00fbec174 | ORPH
    arc      |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/1c0369ef79de92e09a3bfc70e1b2ec3b44380b5e | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/cec86cec9c96ce28a7ecfa21c0ce0f5cb095e90c | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/330dbba841b9e7e22cc395ba4d0812d2186a066e | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/9398d1cb7e379d9c423e725845c92486569e9cc8 | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/8826b24d072cd8e1abd48a87fa3fad33f85059b6 | ORPH
  powerpc    |           faifa-0.1            | NOK | http://autobuild.buildroot.net/results/f6b10b04ed8a3f43c2d6e928389140b7846bb5e1 | ORPH
 powerpc64   |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/7d7257b2b5400a6725f8e2321877d9d986b172c5 |     
   mips64    |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/fb3de994b93fc0e69215970106d0b99afdf34f08 |     
   armeb     |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/1043e6dc08207410ffba3d9821635eb4ac1af77a |     
  sparc64    |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/8ec6b59a4159b717f18b0769ad5a1aa59527cf0b |     
    m68k     |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/c2b7bc01b030be13327ded9ae0b2bdea87174789 |     
   s390x     |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/0fe3a12b3eaf9fbba305e4f1ab2c44b448db51cb |     
powerpc64le  |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/ef6f34863cff2dc157983b78b7e6504daaee6418 |     
 aarch64_be  |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/e3e70e2984226470aced991026db9954bcb679d4 |     
powerpc64le  |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/32216467023063678af6ad955857af6624337243 |     
  aarch64    |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/6c0e4b52516c5d1d06ca1249ae6655f5a3572132 |     
powerpc64le  |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/0ce5fc617042d6ef25b203372348987599327cae |     
 powerpc64   |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/227e9227e050720d687fe256cb02f2782781cbf1 |     
 aarch64_be  | falcosecurity-libs-e5c53d64... | NOK | http://autobuild.buildroot.net/results/2da19e57db42f1d9999e2894cf1347919f5c85fc |     
  aarch64    |           fcft-3.1.6           | NOK | http://autobuild.buildroot.net/results/9d5d014949cf567240c1ef944e0344cab74dc795 |     
microblazeel |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/bc43d7e6c0700cbacf3b227e3c80da8b922e5111 |     
    arc      |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/e6aa916b41a2865ae77a4515f162adc41c8c5840 |     
  riscv32    |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/e39258cd05f634a21ab2f4ce0f816c9a3288ea4e |     
microblazeel |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/43b02dce0cd77df9c15483c2e1c42fd819ae521a |     
microblazeel |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/ffce353327bd9531ef4dcd2139d36e1b6546d71b |     
 microblaze  |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/937b447dc2a9f9f114d261877197859d5943f402 |     
 microblaze  |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/10a8928046d35c9a74aa1cba559b1bd4acb06ad2 |     
powerpc64le  |        fftw-quad-3.3.10        | NOK | http://autobuild.buildroot.net/results/990731a2023ae63e0288db93da97dd43f2ddd24f | ORPH
  aarch64    | flutter-animations-example-... | NOK | http://autobuild.buildroot.net/results/f60e2f0dae0dfceb2c75ac48598dee1dee284e34 |     
   mips64    |          foot-1.16.2           | NOK | http://autobuild.buildroot.net/results/157905993fb9ce0986228756537588f0876418a7 |     
   nios2     |          foot-1.16.2           | NOK | http://autobuild.buildroot.net/results/012eb476ad8a0bd334584f4e5a40df5d2908e4d2 |     
   nios2     |          foot-1.16.2           | NOK | http://autobuild.buildroot.net/results/27048e1ba7d6bd065c217b302f64bc42f9b064cb |     
   x86_64    |          gamin-0.1.10          | NOK | http://autobuild.buildroot.net/results/4da686496e90ae3d48df79d60d7b2e421c21c42b | ORPH
   mipsel    |       gdk-pixbuf-2.42.10       | NOK | http://autobuild.buildroot.net/results/bd4fb067feb27d0880b6b4f8bfb563d6eb1321ca | ORPH
    i686     |       gdk-pixbuf-2.42.10       | NOK | http://autobuild.buildroot.net/results/876c4a8869626628cfe8d922b76ea13475ebab20 | ORPH
   xtensa    |       gdk-pixbuf-2.42.10       | NOK | http://autobuild.buildroot.net/results/53eccab78e4c6c273428b0c5ed4860b44b75229a | ORPH
powerpc64le  |      ghostscript-10.02.1       | NOK | http://autobuild.buildroot.net/results/04ec3abf756ce624ddb9ec7c61241147284cfff6 |     
   arceb     | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/c9bb429c7175d85e49b608eec552af8ef77307fa |     
  powerpc    | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/9bf47a7884ee8c3fc1b26b7413661f633d56f013 |     
 powerpc64   | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/a91764730fcf0b760f386b7b0545c02cc1e734e7 |     
 powerpc64   | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/899062c1cc0676165729fe4493c804bedaf7392c |     
 powerpc64   | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/490b143c1e05ff81d728087a1ed394beb7b86565 |     
 powerpc64   | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/fec880783f1a0d9c1bafee0e166205ac80333491 |     
powerpc64le  |     gmrender-resurrect-0.1     | NOK | http://autobuild.buildroot.net/results/5298bee11b6e692d6132adf487e3b91e25b099fa |     
   armeb     |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/d8f346333084706c76de7112c946ccf4dab60c59 |     
  aarch64    |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/5f1018a020691ace3abb23272dc3bbde0e21fcdc |     
    arm      |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/89f242fe9b3b71db1cf75dfa210694b4985a20d5 |     
 aarch64_be  |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/ede0a2ab44a9c2d46bae043e8f0ad5b825112c0b |     
   armeb     |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/ab111d9a15ec5c9a6589d3e197e23ccb98323495 |     
    arm      |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/59aefbc3a8954c0000cb98ad86c0b891fa9184d1 |     
  aarch64    |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/02c92fc90b96016e846617b0cc9970851f018b1f |     
  mips64el   |         gnuplot-6.0.0          | NOK | http://autobuild.buildroot.net/results/64efe0976f94e0f91c272efede32c1943d96926b |     
   mipsel    | google-breakpad-f49c2f1a202... | NOK | http://autobuild.buildroot.net/results/56e14cfb42d256a9d932da861754444a9fb7e5d3 |     
   arceb     |         hddtemp-0.4.3          | NOK | http://autobuild.buildroot.net/results/b2cd207cb41af12256f84a4e6290fa4f58c4488b |     
powerpc64le  |         hiawatha-11.2          | NOK | http://autobuild.buildroot.net/results/02ffbbb40b704a9dc1df3cff0be26ec51491e550 |     
   xtensa    | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/d83d5e5bee193ec9126b92cab618d42eddeccfc0 |     
 powerpc64   | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/04e0e1a7c5375687d79f465e629cbfcbf29d39f7 |     
 microblaze  | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/dc7f514d1a15857d733d1d444296f3b0b203e174 |     
   nios2     | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/d5b7357b3115883845c5064bd4a0b6ea31556e34 |     
   s390x     | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/ad23d1fac9f6265b38717b60b98ab9ee5b7e5c73 |     
   armeb     | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/91ae2e587b02e57ed0a7adc72db9d825b76c161c |     
    or1k     | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/98e81763883143477a95dc19bfe54b657901ff2f |     
  mips64el   |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/4ab4078b65b6ddb5045aed8e248831142fe4c0b6 |     
   x86_64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/27d5f9562a6e02962526e06b47777bd475defe0c |     
powerpc64le  |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/954f90e298ec269a6e96b4d9b5f964d877944cfd |     
    m68k     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/3083bac5f72da39f3c23651172b9de55257107d3 |     
 aarch64_be  |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/2c9e026c046df045d266dc84a1a98ad905291135 |     
 aarch64_be  |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/146931ebde897b13bd0a8e9be2f8a88262c808fc |     
   xtensa    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/d19d0a768a0167b086305875a52ae0d3134af404 |     
   arceb     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/aa62296c5f0395ec226b7547b799ce04ff7066d2 |     
  sparc64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/8ff137ed39fddd9da40fc7ab2c687923f2ac8f8c |     
microblazeel |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/e20667ea6ea3a5d023b8301a60ffdbba28db688c |     
   nios2     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/c28d4dc51f9cfff8c82205c967e54aca3394f2be |     
   nios2     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/28ce5fdf4fb123932711b12f45fec4eb50fe563a |     
  sparc64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/1b6f62ceba92b81f66df3a1b503e4d5288702fc8 |     
    i686     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/8a830ba6141d8e397e11ce7117db31b596b7b7a0 |     
 powerpc64   |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/442cf38b511e2421d2f2b289b948def4e023d17c |     
  aarch64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/81aa3dee16a806e6a5fced96048f7900dff348a4 |     
  sparc64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/76f653e635a5217d5cead9fa2bf1190c58f2a2cb |     
   mips64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/ab82980eeed43cd2591a0407f185f08bc24ae5eb |     
   nios2     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/f71c6afe89f6da9f7559237fe1c36107aa916803 |     
    m68k     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/a259256feb3b32362a70fef6cf3f1dcc3c438b67 |     
  powerpc    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/dbfaa25933e4e13a4ad3d546a13ec24971f65fdf |     
    m68k     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/31385116ffa96f80ba2cbcde388e58af87d92c6b |     
   x86_64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/dacade9149d4d7ae11ce9718ab03f019df3d877d |     
  mips64el   |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/3eb2449d92ce2fd5bd66c2cca55624e3f6428a1e |     
 powerpc64   |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/71c42d303276c7274b608b32bd271c35e269826b |     
   xtensa    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/8de5cb9b7f5266179aa6d79a591b999fc079e4a6 |     
  mips64el   |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/07267039581ba95f2d00fa1443fda1a7e5cabf71 |     
   s390x     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/1fbc565d1f7be1287a1a857e2661b8ed593a935e |     
   nios2     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/dc263060560b653188046e3e9a6903b4cb1082ad |     
    or1k     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/27dc3441ac3d1c2d326cd6e9f631cbad4e32a90f |     
   sh4eb     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/accddfc0adc40d8db85c7457ac9a70aa4beb3e62 |     
   nios2     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/7f64d4d53e9c8d4ee1c8590364fe5b6ac842f95b |     
 microblaze  |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/3b35175f736357ddc3bc44cbeea4e8fe9497699e |     
    or1k     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/e0c5289742b34acee968966454b33cdfe1f6e5fc |     
   sparc     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/0c9ddcc2511f86dfc213c0b0c01e9bb6540cd667 |     
    arm      |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/e100478d7912d879f0b3091e8029d23bcae790d4 |     
   sh4aeb    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/dfe2c308f3dba17b1efbf2f9a27ed327c2d54c4f |     
   x86_64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/2af1c37fc2df083739e736688cc4528ac65aade2 |     
   sparc     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/8b6e4d06ad5cde5cfb90355a2124f87458d42f82 |     
    i686     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/2b7f1b003518db9b27381d313b2e5737a94e4cd1 |     
    mips     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/32865f58e694c4f71834bc5d1fc7fc5014c14127 |     
   armeb     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/5023e768fa74d148d8fb8a4f22a601daa9d24d7b |     
    i686     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/6a369ad217b94688afb8fe13326d3664d989c3d3 |     
    mips     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/b228a5c3cad7c10a31242c506718c1c646690d5e |     
   mips64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/aedb58608bda92fe26095246139b9d783b9e5b32 |     
powerpc64le  |     host-gcc-final-14.1.0      | NOK | http://autobuild.buildroot.net/results/a60bcfa71e5382a7c351883f67d5d265e4f16c7a |     
   mips64    |          host-go-src           | NOK | http://autobuild.buildroot.net/results/c563634463858b9bb030fba2664f20ffe18a0c04 |     
   s390x     |          host-go-src           | NOK | http://autobuild.buildroot.net/results/8c1430e23f8f9fb42efe8f129013c4b7981086d4 |     
   mips64    |          host-go-src           | NOK | http://autobuild.buildroot.net/results/145794cb07ab2bfa7a2612855244676a590b3c67 |     
powerpc64le  |          host-go-src           | NOK | http://autobuild.buildroot.net/results/04ddf27c1d366518c9a94180e1e574bc64f3b1b0 |     
   mips64    |          host-go-src           | NOK | http://autobuild.buildroot.net/results/bd9de95d1e8e20df16722fa7f45d29e38a5fd955 |     
   mips64    |          host-go-src           | NOK | http://autobuild.buildroot.net/results/fded23976dc568428070c946b9a7790f41cbb735 |     
   mips64    |          host-go-src           | NOK | http://autobuild.buildroot.net/results/e3e44317eee10eb5f649db1139e7d498b9fe1367 |     
    i686     |          host-go-src           | NOK | http://autobuild.buildroot.net/results/65356c57f9cbbbe424a6d996dc3bc7709011692a |     
  riscv64    |          host-go-src           | NOK | http://autobuild.buildroot.net/results/26dabbd6464a0217a800655541d5c68ed7af35f5 |     
    m68k     | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/71b57109bcdf5a898daf1811bcfeacc5c0dbc8eb | ORPH
   x86_64    | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/fe97dbd2550f2351be795c846f85dfe4865f170b | ORPH
   s390x     | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/d1d55041e494c5eddb3b80959dc7b4e65497718c | ORPH
 microblaze  | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/d7aa0405c82d430a255f7ade51023b93464a5bb6 | ORPH
    i686     | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/a66e4b09b30124e1029f6cb3a5ba5efc9c388449 | ORPH
  mips64el   |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.net/results/4a98cd33b1ad820a29607f9ca2d57f3e6f441fa5 |     
   sparc     |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.net/results/3f02c597f22c9211f558e2f909015c7499e0333f |     
    sh4a     |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/7ab0a564b5d8d8dfbde58540f327102597a77d6b | ORPH
  riscv32    |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/88c7b15395574f72700f0cf05b2ca7eac8d08286 | ORPH
    i686     |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/4bb726f3959536ded991fe70bfaa58da80b94d17 | ORPH
  riscv32    |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/012fe2dc8feb8d4a57d067a3e0a98a80af819d10 | ORPH
 powerpc64   |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/dfd7d56faf886efbae2d52748595de110cea577b | ORPH
   s390x     |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/55b41d90ca13a96d8822ca302b0d33cfaafca607 | ORPH
    arm      |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/9db4322f991c05f24a69c01cf9ac6e78982da593 | ORPH
powerpc64le  |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/af7ad844cb55fa043a1be11cf5eae6a1ccc11346 | ORPH
  powerpc    |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/659a0a4879919e41ffb649116b5a5820c71b54f2 | ORPH
  sparc64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/8650c5cb56c8f8b0dd3d3d6b0c42976af0e785e0 | ORPH
   mipsel    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/2cbd7ec652997531634df069b06146b34a9a6c7e | ORPH
  aarch64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/a74c576969d79b91d7014c879c3a64d8d8737e3a | ORPH
   mipsel    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/811f057e5fb74c6dec2cd714174c2a82b89b56f7 | ORPH
 aarch64_be  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/b527895ba3e3948e8ae4957145e81fd1c3e2ff5b | ORPH
    m68k     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/e6dd02796f0f5c4d4a9e9eaf5b0adc911614e34e | ORPH
   sh4eb     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/71ddcc8bb16570013a2af225bff06f5f2246687c | ORPH
 microblaze  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/25c4e7ab043cb9c0dc722ba4e78f1e059bbdabdf | ORPH
microblazeel | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/7cfb99d5b282503dcf275c8357d5de97c5dbee44 | ORPH
    arc      | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/25dbc8df405ce07a2a427c3e01273a648387cc1b | ORPH
  aarch64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/7feaa4d53315975b46a5ef95bccc6a6e8332a55c | ORPH
    mips     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/aca97d4d6919efb2f313af0caa454a6cc26e5697 | ORPH
  sparc64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/0e3e39582e9360f57e17a22ce21a08aeee4eca35 | ORPH
   sparc     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/2844fc44392a251ef18ba54084b8414ae190f1ea | ORPH
powerpc64le  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/2f8f46bcdcaaf4cb14a47ac65113add640449bfb | ORPH
    i686     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/ab5f554718fed20e92593bc05116e2db570c1263 | ORPH
    sh4      | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/d4bf585c61a06126c47d994c567ff5bfed3fef45 | ORPH
   nios2     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/51c70acc5cc2cc6f1d6b2c789d458e22724da167 | ORPH
   sparc     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/42bc953d95dd0e0fbd28c9017933c06384e4c477 | ORPH
    or1k     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/18e053e850a222a53d18a0a5323a9ea33b9adca0 | ORPH
  aarch64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/00b67801546b1729c9d4d4c80f5c8cdf72625ceb | ORPH
microblazeel | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/6237c7a1b2a7fc69bb433aa817d556c116d2f63e | ORPH
 aarch64_be  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/8355025c08c7a4639054fd46c5dcb84678ed893e | ORPH
    mips     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/c604e1649e3b025e0b8cd4b91c4edf8959ec473b | ORPH
microblazeel | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/c5673a575fd6e4283488b454d0fc48f33f55a9cd | ORPH
powerpc64le  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/7c5cd1ccc7ecbabbb2a609bd9ebbd912c03d4293 | ORPH
  mips64el   | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/7a9027437fe517aab1c1fbe88f2e600e553eeda9 | ORPH
   sh4eb     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/d111217a5971fb70cfc0afdf60a3fe4fb0a7dd76 | ORPH
  sparc64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/fe0ab4257ae08960b638f52ae375166fb1046332 | ORPH
   xtensa    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/6342b61c0ebf832ef5df25d825545d5268470b2c | ORPH
   s390x     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/4529c89823e5a602401d57297b5ef6fbaf0b2d0d | ORPH
    sh4a     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/42337d2b38a97acede87b9d8e501194db50fbf22 | ORPH
   x86_64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/3e8e84c2605983637f7b314ccbd3bfe227362876 | ORPH
   x86_64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/07fed6a3964d683a28055b43afe78eea3cc8470b | ORPH
   x86_64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/ff51695d3ad04dc35f6eaa67b79b08849bc3c0bc | ORPH
  mips64el   | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/74f4ccc6feb0125705095885519e4e31807493fa | ORPH
 microblaze  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/ba2e4af3230967dc19bb5d28041e33e7427d64ba | ORPH
microblazeel | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/39a3db32e9881e09f4ed9c1dfb3b647a032f99dc | ORPH
  aarch64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/77775ac00926da4df2d838d734243c8de3a325b8 | ORPH
   nios2     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/734d53b364ae631ad1716e0c0954ed27b422494c | ORPH
   nios2     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/75c9feff3d059fe0103093a8e9db775b15bbf000 | ORPH
   nios2     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/77bd51aae47ebbe68a73950bf779674c37d66ca3 | ORPH
  sparc64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/3340dbbef7652406cca5684a4a14ff5c40587879 | ORPH
   mips64    |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/6d980001d3572af5b73b550735a00eee1999ac98 |     
   s390x     |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/c41f53531271b4aba19bf6de209ec86766dd9dc2 |     
 microblaze  |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/a95254c41c7f04f9d580b40355fe11d9eddbe2f0 |     
  aarch64    |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/aac1be1a6554f0d8ce6c0025cbfeeb3bf2b8b6d5 |     
  aarch64    |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/0f9936da2af70b442ce34380e94803aa3f85c754 |     
   mips64    |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/c7f9795c612ea89b1cd8d03592f7c4d6bdc9aca9 |     
   sparc     |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/3bfc1c031f5c17ce228de985843d047ead3792d7 |     
   x86_64    |        host-rust-1.74.1        | NOK | http://autobuild.buildroot.net/results/02bbd55af02fddb92720510384dd657921a5d50e |     
powerpc64le  | host-softether-4.30-9700-beta  | NOK | http://autobuild.buildroot.net/results/98b0180e5e53b552d3d8bc87a32bb0a9cad95eb2 | ORPH
   sh4eb     | host-softether-4.30-9700-beta  | NOK | http://autobuild.buildroot.net/results/a10848545213fff17d5cfcc947a4bffdc3d12d22 | ORPH
 microblaze  | host-softether-4.30-9700-beta  | NOK | http://autobuild.buildroot.net/results/cf322a7dd2e8c5342b9dedb1f722ef42d386f58f | ORPH
   s390x     | host-softether-4.30-9700-beta  | NOK | http://autobuild.buildroot.net/results/04377416367ace3448da7a179b374512132c4d3d | ORPH
   arceb     | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/fc2db036e13c00e90686fef0be2651a55892b19a |     
 powerpc64   | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/dbac848697aac68706467e1bc91c615a9795126c |     
    mips     | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/1022856fa6dad50d642885a300a52f8f6af4f742 |     
   sparc     | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/3a25875eb94d74793fb1f32502c6a8b076118d93 |     
  powerpc    | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/54b7697694dae5ee9779373cb5560cb60a874db6 |     
 aarch64_be  | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/da6e45a7bb8915cc6e7769679bd2fca5af402705 |     
   sparc     |           htop-3.3.0           | NOK | http://autobuild.buildroot.net/results/c994928dd23a0c19e31415519df4cc718bbf44c0 | ORPH
   mips64    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/6f1e337bd1844b97fb3db1196d224ad74f14b125 |     
   x86_64    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/77b1500e48dc4941bdac4da5babd3070d8cf9b98 |     
   mips64    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/0c04a8e8f5bf0b91f36c4220df4a4a3b0ce48bf2 |     
   mips64    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/de7339faed651807b51f94e4a4802fd418af7d2a |     
   mips64    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/50b753876d15f4e6a5a12f3d65fcfc2635f07ef9 |     
   sparc     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/707d79ac527edd56a9f6e7379f1721a5cb142017 |     
  mips64el   | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/5d8f4274774d6baa84e3447ceb126ae384bfdd3d |     
  mips64el   | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/d6322fba54ac53b8596e879a9dbb2dcb4405badc |     
   nios2     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/55d263279a3ef6d2effab721fe06601f172b961c |     
  aarch64    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/dee0bc9ef2376add8e229f0f21f4cbee74e2dd57 |     
   mipsel    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/dd932fe71962b8af4a2f42ba3ad67b22f2c335bb |     
    m68k     |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.net/results/eb092a0000ec210531fe270a039c072bada119b4 |     
    or1k     |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.net/results/baf9401598ba3923f26b060a7dcb43e443b62307 |     
    m68k     |          jack2-1.9.22          | NOK | http://autobuild.buildroot.net/results/22401ae8803bb2f8a6f921d48b75a7ebd6851b20 |     
   x86_64    | jailhouse-e57d1eff6d55aeed5... | NOK | http://autobuild.buildroot.net/results/7db4fd5e10573a1a2b1f0dca9bb8d352ffef1077 |     
    i686     | kvmtool-4d2c017f41533b0e51e... | NOK | http://autobuild.buildroot.net/results/d14886a1c2511ecc79c2d15b4760cc1c515c06b3 | ORPH
  powerpc    |          ledmon-1.0.0          | NOK | http://autobuild.buildroot.net/results/6f3ce6cd4102a78d4d7474a3d3411157f5f24067 |     
    arm      |        libarchive-3.7.4        | NOK | http://autobuild.buildroot.net/results/02481ac676076a2aba2c98deb0577317623ea27c |     
   s390x     |        libarchive-3.7.4        | NOK | http://autobuild.buildroot.net/results/bebbe28b6d02203f96e6beb40a9c6b21a3df7dbd |     
  aarch64    |        libarchive-3.7.4        | NOK | http://autobuild.buildroot.net/results/b79654e9913bdd155831b145cd7d5cf40750f121 |     
 microblaze  |        libarchive-3.7.4        | NOK | http://autobuild.buildroot.net/results/b6bc860ad56597e198d1f52c37a79454b06820c8 |     
  mips64el   |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/1aba3c2f52730396ddad5e41b8850d9bb47bf83b |     
   nios2     |         libcli-1.10.7          | NOK | http://autobuild.buildroot.net/results/3b1a2c61f85b5e9d4b38662dffe610cc647b63fd |     
   armeb     |         libcuefile-475         | NOK | http://autobuild.buildroot.net/results/1efc06b8be56ef0df7ea4d7398a788b76ee07000 | ORPH
  powerpc    | libdill-32d0e8b733416208e04... | NOK | http://autobuild.buildroot.net/results/970a020e1d501577b9f472dff587d28d2097080d |     
   arceb     |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/073647f2f955324db8b180bad1f4f0a368181a31 |     
    or1k     |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/37eef754c8a465d2f00d6b69b08f907f633a5e65 |     
   arceb     |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/2055021539c65f972883baf3fb6ce511fb18db70 |     
   arceb     |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/ea7fcfb458bc4c64ede7699a830a605e0b2b0d0e |     
    arc      |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/38f3ed34ba6db80dab0d25966f73d332be6ffed1 |     
    arc      |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/050cd6b7b031e194a51b2ad657dbe40be62eb9d7 |     
    arc      |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/5813cc0875d3b6fac26758b5c64c2c2375b50b5a |     
    arc      |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/9b8dfc692ac7598f95b08a0aa03cd198d711d3e0 |     
 microblaze  |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/0149500449d6df7b254d7f98bc1353c6fd76cfa7 | ORPH
   nios2     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/a0ab5e877c4d3951198d7d2f297270cdf22bf453 | ORPH
   mips64    |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/a8d9d480cfb1f03daf23ed9e2b844f3b919d6674 | ORPH
powerpc64le  |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/ea3dd0e180aeb4de007407fcbc4b976aa9b1e7bb | ORPH
  mips64el   |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/7b7b00354e5e6c7148a9eb2303d2c2ac44e97115 | ORPH
    or1k     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/19ed4606215c6cd05173a5246ac325982881c70a | ORPH
   sh4eb     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/305d2ea7a34c0afb71b0ec2e3dcfbd8f4f520463 | ORPH
   sh4aeb    |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/6f072795d7bc0ed62b8087a578be541a8f813588 | ORPH
    sh4      |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/d1d9fd9ee8d560c6f5207f3099e9ad398b7c23ad | ORPH
    m68k     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/d3842c2fcc510247ebd3b7767cb67666cc462bfb | ORPH
  mips64el   |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/27f8ba2d882ff0bc44c32290243862ee13488181 | ORPH
   s390x     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/2bc6d66731636747ed5d247d507827507298b47b | ORPH
 microblaze  |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/76fa953c11ba35af86991567c21136d1a993e5a4 | ORPH
    or1k     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/47608decbb54d540356f0707f522dbbfb6240591 | ORPH
   nios2     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/346c019bd26925ffac3279c78e6a952de5474303 | ORPH
   xtensa    |          libsepol-3.6          | NOK | http://autobuild.buildroot.net/results/12a7cc28fd853722beb0a29ef2c4e32d192507c8 |     
   arceb     |        libtracefs-1.8.0        | NOK | http://autobuild.buildroot.net/results/62ffca1676b783e80419ecb3289bf5cf1559d3c3 |     
  powerpc    |        libunwind-1.8.1         | NOK | http://autobuild.buildroot.net/results/bc3009150be640735e26f091e826c191b268b5f0 | ORPH
  riscv64    | libutp-c95738b1a6644b919e5b... | NOK | http://autobuild.buildroot.net/results/90e34937441a24ec7259924b2d9aca27483ecb79 |     
   sparc     |        lighttpd-1.4.76         | NOK | http://autobuild.buildroot.net/results/efa135a40230fd5608d5ca339e0e178cca24376d | ORPH
  sparc64    |        lighttpd-1.4.76         | NOK | http://autobuild.buildroot.net/results/e72471fa48b091ae89a1f79e4a52a924f809c175 | ORPH
    m68k     |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/79b6c0248577c124d6d4c254fce0428b18b2623f | ORPH
   nios2     |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/5fb33427804ff1e34b16b00497eed03210ff402b | ORPH
    m68k     |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/d96de1109a6fc8eb6cc030657772e594653a13a3 | ORPH
    m68k     |          linux-6.9.4           | NOK | http://autobuild.buildroot.net/results/fe7912834a567c036d8811efd61ce27902a33e02 | ORPH
   nios2     |          linux-6.9.4           | NOK | http://autobuild.buildroot.net/results/2758def1582167a0d8bbc6f55f0df4d61e85b403 | ORPH
    i686     |          linux-6.9.4           | NOK | http://autobuild.buildroot.net/results/6f462fa4db655ecf22297a7442d2ba079311a418 | ORPH
   nios2     |          linux-6.9.4           | NOK | http://autobuild.buildroot.net/results/d499d2657a0de22d929b59b3fcf0f4aa814c5853 | ORPH
   mipsel    |          linux-6.9.4           | NOK | http://autobuild.buildroot.net/results/414569a6bf9bcd92e5d808f80eb52d2310d56375 | ORPH
  powerpc    |          linux-6.9.4           | NOK | http://autobuild.buildroot.net/results/b156a1b870eab98e6d5cff636fc5e2d6d54b40de | ORPH
   mips64    |          linux-6.9.4           | NOK | http://autobuild.buildroot.net/results/5aad5a71cb2a8798739fbdea90d2f69516187bf7 | ORPH
 powerpc64   |          linux-tools           | NOK | http://autobuild.buildroot.net/results/14c4bf03defe04f2d80fd366f7beb2098952c7e5 | ORPH
   xtensa    |     ltp-testsuite-20240129     | NOK | http://autobuild.buildroot.net/results/f937b7a7e07e030440d3e9ad777b541289d526fe |     
   xtensa    |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/2bbc33f1b01bf3aad30c97717720d389fc003d8f |     
   arceb     |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/9f6e3864c241be74bc2c40a9be6fe5d429692580 |     
  mips64el   |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/868249a2d8f85420774828d65b4d99e9e8d038b2 |     
   sparc     |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/26b7c98e520e6447f4505e142eb2395c257feb40 |     
  mips64el   |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/4db836d907e37df209164a50149022610ff0af38 |     
   armeb     |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/6e24d832e3a5a2aee579666f35af49fba47ff76f |     
   sparc     |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/9a8947fba348cac5a250d966a7603e2d4db3c367 |     
   armeb     |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/c0f909871bba732a6bc623f61ac797714e6bccaf |     
 powerpc64   |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/b8d628b9447c99c60f5190eccee26cef21d5241c |     
    or1k     |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/7e7d2d32e43a914fcb7c8c2f79010dc77365ede5 |     
   x86_64    |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/f72a7e880e720f8ee67170a1de3cc1b00548e63a |     
  aarch64    |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/7fd2370b5b971f77ed4e9791443ca4e4a9467f2f |     
   sparc     |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/533c138b300a4190a0bdc4abe69b5a1a97c1b846 |     
 powerpc64   |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/8b1d899577522f05b935d545e81860d2fb213ec2 |     
  riscv64    |           mtd-2.2.0            | NOK | http://autobuild.buildroot.net/results/523c748ac6d42a3e5b8b461d8898a199d5fc5f64 |     
   sparc     |          nginx-1.24.0          | NOK | http://autobuild.buildroot.net/results/af01ce6de6438c88c24906d6907b16389c7d8399 |     
   sparc     |          nginx-1.24.0          | NOK | http://autobuild.buildroot.net/results/8620f3a36f3634493fc8547eded6bddd0947eefc |     
   xtensa    |          ntpsec-1.2.3          | NOK | http://autobuild.buildroot.net/results/5da79dd748776030e215169284ec6f14005136aa | ORPH
 powerpc64   |         openssh-9.7p1          | NOK | http://autobuild.buildroot.net/results/4fd19aa112e4c6f33148bc89e2a1cbb72c9bdf05 | ORPH
   mips64    |         openssh-9.7p1          | NOK | http://autobuild.buildroot.net/results/e21d99beae43d25e4946047f8c52e1f244477c71 | ORPH
   mips64    |         openssh-9.7p1          | NOK | http://autobuild.buildroot.net/results/c36fd0cac2cd786dc2cd9328dd5a18873bd7d1be | ORPH
    arm      |         openssh-9.7p1          | NOK | http://autobuild.buildroot.net/results/d214a4499f649484b4d59ad875332f160432af71 | ORPH
    i686     |  openvmtools-11.3.5-18557794   | NOK | http://autobuild.buildroot.net/results/fa1e2859346eb72470b2bb7b055b13fc35996215 |     
 microblaze  |           opkg-0.6.2           | NOK | http://autobuild.buildroot.net/results/155e7be9296ac0f51a53f121d97d7d35bc3ca353 | ORPH
  sparc64    | pppd-e1266c76d1ad39f98f1167... | NOK | http://autobuild.buildroot.net/results/69621b0b499234d0d09e9608848b0dcf55b02494 |     
    i686     |      python-grpcio-1.60.0      | NOK | http://autobuild.buildroot.net/results/18df826a8f648796824212ef0df3544966eefd87 |     
    or1k     |     python-remi-2022.7.27      | NOK | http://autobuild.buildroot.net/results/b9b8d83b20b8d00dac5eaceaa336584b9bdee8a6 |     
   s390x     |         python3-3.11.8         | NOK | http://autobuild.buildroot.net/results/2a7a7fe26915a0e9106eab9360c9bb476aa1d31d |     
  sparc64    | rtl8812au-aircrack-ng-f2397... | NOK | http://autobuild.buildroot.net/results/250bb38411e24a7ff3be59d97ba446513e8e635d |     
   xtensa    |         s6-dns-2.3.7.1         | NOK | http://autobuild.buildroot.net/results/07bb4bc29946d8fbe978e030e635471005e50c93 |     
    arm      |         s6-dns-2.3.7.1         | NOK | http://autobuild.buildroot.net/results/b586ebb349094ee8baeb7f8d865d72ff65c4dade |     
   sparc     |         s6-dns-2.3.7.1         | NOK | http://autobuild.buildroot.net/results/32c9bc51855698ca78e033bc321354ef5242361c |     
   sparc     |         s6-dns-2.3.7.1         | NOK | http://autobuild.buildroot.net/results/d89c9752508194e958bf642a1061bdda7a951d0f |     
    m68k     |         s6-dns-2.3.7.1         | NOK | http://autobuild.buildroot.net/results/645532f70a9db26066b13b5933f4ee232835b1b1 |     
    i686     |           shim-15.8            | NOK | http://autobuild.buildroot.net/results/98211330c7608bc9e995073741cbb01ea7546958 |     
   mipsel    |       sofia-sip-1.13.17        | NOK | http://autobuild.buildroot.net/results/7edd01767765b5b944ddaf42e99583e21fd6e43d |     
   x86_64    | squeezelite-71c012ad9ba102f... | NOK | http://autobuild.buildroot.net/results/0af5848a738b7c4e4194b51e1bd19c5b905d2702 |     
   sh4eb     |           sslh-2.0.1           | NOK | http://autobuild.buildroot.net/results/1b9409816a007c8f0375c98933c0ce2f8a2b5695 | ORPH
  sparc64    |         tbtools-0.4.0          | NOK | http://autobuild.buildroot.net/results/b60b26043c2eb93084aa056f1fa652f06a404758 |     
  riscv64    |         uclibc-1.0.48          | NOK | http://autobuild.buildroot.net/results/64b112a89198221a1caf33714e1a579dba5bd172 |     
   sparc     |         uclibc-1.0.48          | NOK | http://autobuild.buildroot.net/results/95e1ee5f021bdcefdb6e5e4802a0dd6ee0ff94e0 |     
  riscv64    |         uclibc-1.0.48          | NOK | http://autobuild.buildroot.net/results/d73115d0dd6726e5e6d15f6b9ed5807b0ad3291d |     
  riscv64    |         uclibc-1.0.48          | NOK | http://autobuild.buildroot.net/results/eef6ea25b7a8405a97b93aeb191cdd4dcce525db |     
  riscv32    |         uclibc-1.0.48          | NOK | http://autobuild.buildroot.net/results/737275f904be94cf2b9ab41523e3150d34a62a14 |     
    arm      | uclibc-ng-test-0f303c63fab7... | NOK | http://autobuild.buildroot.net/results/4e5f4c0a0b5515b9f09a9e988c161c7c0a4e7580 |     
   xtensa    |          uhd-4.3.0.0           | NOK | http://autobuild.buildroot.net/results/239976960f886be912216064896fc74abe5d733e |     
powerpc64le  | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/edb80366354bb0bbdcccb0ace0d27f5e7116d189 |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/90c04683c0625174391c949ea79a272181ed54c7 |     
   arceb     |            unknown             | NOK | http://autobuild.buildroot.net/results/3c894701cec5849314f3cfd898d3bac716fca5ca |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.net/results/48529e4085aaa8e7de92471c64c5bd7c476e03ec |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/0799cecea2821ebdd30bbbdc49971e19a1f606dc |     
   sparc     |            unknown             | NOK | http://autobuild.buildroot.net/results/41b9d7d8e6117da2fa23e075f3f4a202f728459b |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/5c5f0c68bb39f8f8fd47db1720a65d468f1eb746 |     
  mips64el   |       util-linux-2.39.3        | NOK | http://autobuild.buildroot.net/results/767d4b7b4468a4f265cd08e034e5e9f677c367c6 | ORPH
    arm      |       util-linux-2.39.3        | NOK | http://autobuild.buildroot.net/results/228947ce1afb69eabde216c8d6469d79188af5c3 | ORPH


Classification of failures by reason for 2024.02.x
--------------------------------------------------

                       unknown | 2 
               asterisk-20.5.2 | 1 
                 coreutils-9.3 | 1 
                     crun-1.12 | 1 
              fftw-quad-3.3.10 | 1 
                   foot-1.16.2 | 1 
                   libnss-3.97 | 1 
                memtest86-6.20 | 1 
                    ncmpc-0.49 | 1 
               openblas-0.3.26 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv32    |        asterisk-20.5.2         | NOK | http://autobuild.buildroot.net/results/eae51edade6588904a96d83ad81d9e73c898d870 |     
  powerpc    |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/c2f354004e231a9398cfcaab2d4b22ede6110259 | ORPH
    arm      |           crun-1.12            | NOK | http://autobuild.buildroot.net/results/6c55171315a1fadc81bb08c5824c1ea3a2910710 |     
powerpc64le  |        fftw-quad-3.3.10        | NOK | http://autobuild.buildroot.net/results/6b68713b695b521606456cdd5cb6894cc16a71e3 | ORPH
    or1k     |          foot-1.16.2           | NOK | http://autobuild.buildroot.net/results/0d46fde4e0834b725511396ef1e388063e8f91c7 |     
   mips64    |          libnss-3.97           | NOK | http://autobuild.buildroot.net/results/851866deff2906d1d9b61c74266586c233faf951 |     
    i686     |         memtest86-6.20         | NOK | http://autobuild.buildroot.net/results/232c0a76154eabdb08a0dcb8b0b9041859016891 |     
   x86_64    |           ncmpc-0.49           | NOK | http://autobuild.buildroot.net/results/0f3e9b8c180deed348c4aceafae022f69fef2600 |     
  mips64el   |        openblas-0.3.26         | NOK | http://autobuild.buildroot.net/results/aa77317ea543f5cc5e4e1d7fcc2cd9ca7edfcfb9 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/8665838f19e4c0ee2b560410559d1dc25c5ccfd1 |     
  riscv32    |            unknown             | NOK | http://autobuild.buildroot.net/results/7773190482c83fdeb4f124f5397dd31a82eef3e9 |     


Classification of failures by reason for 2024.05.x
--------------------------------------------------

          libcamera-apps-1.2.1 | 3 
ibm-sw-tpm2-5452af422edeff7... | 2 
                     frr-8.5.4 | 1 
                 gnuplot-6.0.0 | 1 
        host-sentry-cli-2.20.3 | 1 
                libressl-3.8.4 | 1 
                    proj-9.3.0 | 1 
          python-grpcio-1.60.0 | 1 
         python-remi-2022.7.27 | 1 


Detail of failures for 2024.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |           frr-8.5.4            | NOK | http://autobuild.buildroot.net/results/628f0342adcb4cb6677fc4ec378fc8a2787abd48 |     
microblazeel |         gnuplot-6.0.0          | NOK | http://autobuild.buildroot.net/results/cb9eacff0e5e048e8c467a154b0942557e5d2d75 |     
    i686     |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/1a9a74239b3b0db7faf4e9e0039b9b44b4661585 |     
   mipsel    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/6677b257a60356f0d2e79908740e15b87821764f |     
 aarch64_be  | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/4036f29c827b4852000b85ec9bd4bdb81cf07a6f |     
    sh4      |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/9a366c2fcc83a6b86d4fb1f65bbfa63e891c3756 |     
   sparc     |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/18cd393486b84f9faa856f423c1d7814f87d26ec |     
   s390x     |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/b5055fe71cf7d1d558a2bbef094a04dc73f79f28 |     
microblazeel |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/0d987bdea7f16881be2e92f1c640cbacfc14e678 | ORPH
   mipsel    |           proj-9.3.0           | NOK | http://autobuild.buildroot.net/results/3137ba70643511924f32819c11d94e24a773908f |     
    arm      |      python-grpcio-1.60.0      | NOK | http://autobuild.buildroot.net/results/7cc5244994ad9f0eb835a6e69d33109a89538ee6 |     
microblazeel |     python-remi-2022.7.27      | NOK | http://autobuild.buildroot.net/results/3d1be14db30bb2a65c30e58a13f82e49d985ee57 |     


Gitlab CI results for 2024-06-17
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
              TestBitcoin | https://gitlab.com/buildroot.org/buildroot/-/jobs/7111667598  | ORPH 
...ilp32dMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/7111670100  | ORPH 
...iscv32ilp32dMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/7111670101  | ORPH 
        TestLuajitInotify | https://gitlab.com/buildroot.org/buildroot/-/jobs/7111668087  | ORPH 
       TestPythonPy3SciPy | https://gitlab.com/buildroot.org/buildroot/-/jobs/7111669173  | ORPH 
         TestRelroPartial | https://gitlab.com/buildroot.org/buildroot/-/jobs/7111666933  | ORPH 
         TestS6Networking | https://gitlab.com/buildroot.org/buildroot/-/jobs/7111669353  | ORPH 
      TestS6PortableUtils | https://gitlab.com/buildroot.org/buildroot/-/jobs/7111669361  | ORPH 
               TestWeston | https://gitlab.com/buildroot.org/buildroot/-/jobs/7111669473  | ORPH 
            TestZfsUclibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/7111669507  | ORPH 



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
