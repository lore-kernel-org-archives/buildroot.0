Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3614EC3DA42
	for <buildroot@archiver.kernel.org>; Sun, 14 Jul 2024 05:02:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 52464607B0;
	Sun, 14 Jul 2024 05:02:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0IRYAjxkVIwW; Sun, 14 Jul 2024 05:02:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BF089607CC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BF089607CC;
	Sun, 14 Jul 2024 05:02:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 305801BF232
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 05:02:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1FF0081F46
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 05:02:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lnPxUYwdjS6A for <buildroot@lists.busybox.net>;
 Sun, 14 Jul 2024 05:02:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BFB6C81F44
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BFB6C81F44
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BFB6C81F44
 for <buildroot@buildroot.org>; Sun, 14 Jul 2024 05:02:19 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 92C7320007
 for <buildroot@buildroot.org>; Sun, 14 Jul 2024 05:02:16 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sun, 14 Jul 2024 05:02:16 -0000
X-GND-Sasl: bot@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1720933336; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ErUlov+YSsSgen1/QxgjLz68zkFaKUJp1bQdyoGey9E=;
 b=aq/9ksSxbFYOtHayzTU0bxMsMygENG+6W8KUXrSLOSsj70StsJww3vRX/LTEo0653bLvA2
 D8wIfGhGmokovyZV/zMNTRkKKVYtSDdAdL8yCLdxA2wbHVSfZyZ0Odvui3sSyGJCa5D50Y
 7DnuNxwiyillFBoXSHNeCwyDrBBSfsptQCXXys3jx5yolmOjf+yV/blUFgC1Y1bTUIQBVV
 b1ipEEZrV/dXZOZgq6ZcX+bjfBrvowuI9SOKgUUY63BxDmQg2DL4BHZjtS1fvcrVAFiezO
 5Suc3U7miBGwmYPCk8/YAXLl4BW1OSsyynCxtUFhfVAA6HQGYKpagmWVwmq3jg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=aq/9ksSx
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2024-07-13
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
Message-ID: <20240714050216.FzvlCEMvtwcb3clGcBtK4khSvJvmUP2epbXvtYVrKts@z>

Hello,

Autobuild statistics for 2024-07-13
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  5  |  3  |  0  |  8  |
  2024.05.x  |  3  | 11  |  0  | 14  |
    master   | 117 | 405 |  0  | 522 |

Classification of failures by reason for master
-----------------------------------------------

                    zstd-1.5.6 | 52
  gobject-introspection-1.76.1 | 39
            host-cdrkit-1.1.11 | 20
                libressl-3.8.4 | 19
                host-odb-2.4.0 | 13
               cracklib-2.9.11 | 11
ibm-sw-tpm2-5452af422edeff7... | 11
glibc-2.39-74-g198632a05f6c... | 8 
host-android-tools-4.2.2+gi... | 8 
                    mpir-3.0.0 | 8 
                elfutils-0.189 | 7 
                   evemu-2.7.0 | 6 
                   linux-6.9.8 | 6 
android-tools-4.2.2+git2013... | 5 
edid-decode-6f117a8f8c0e76e... | 5 
                gnu-efi-3.0.18 | 5 
host-vboot-utils-bbdd62f9b0... | 5 
                    norm-1.5.8 | 5 
                unbound-1.19.1 | 5 
                      xz-5.6.2 | 5 
aer-inject-9bd5e2c7886fca72... | 4 
                 dc3dd-7.2.641 | 4 
             host-delve-1.22.1 | 4 
                 libp11-0.4.12 | 4 
             rabbitmq-c-0.13.0 | 4 
                     avahi-0.8 | 3 
     bandwidthd-2.0.1-auto-r11 | 3 
                   foot-1.16.2 | 3 
            gdk-pixbuf-2.42.10 | 3 
            host-binutils-2.42 | 3 
              host-rust-1.79.0 | 3 
                  libffi-3.4.6 | 3 
                  zabbix-6.2.7 | 3 
                  bcusdk-0.0.5 | 2 
brcm-patchram-plus-95b7b691... | 2 
             dahdi-linux-3.3.0 | 2 
                    fcft-3.1.6 | 2 
                  ffmpeg-6.1.1 | 2 
                     file-5.45 | 2 
                gerbera-1.12.1 | 2 
                 gnuplot-6.0.1 | 2 
 host-binutils-bare-metal-2.42 | 2 
host-heimdal-f4faaeaba371ff... | 2 
         host-libxcrypt-4.4.36 | 2 
 host-softether-4.30-9700-beta | 2 
                   httping-2.5 | 2 
                       kmod-31 | 2 
libdbi-drivers-0bfae6c43134... | 2 
               libglib2-2.76.1 | 2 
       linux-firmware-20240410 | 2 
        ltp-testsuite-20240524 | 2 
               mariadb-10.11.6 | 2 
                    mpv-0.35.1 | 2 
                     mtd-2.2.0 | 2 
                    ncmpc-0.49 | 2 
                  ntp-4.2.8p18 | 2 
                 openssh-9.8p1 | 2 
                python3-3.12.4 | 2 
                s6-dns-2.3.7.1 | 2 
             strongswan-5.9.13 | 2 
tftpd-e52af4207a6e09a1ba21f... | 2 
                       unknown | 2 
               alsa-lib-1.2.12 | 1 
                 apache-2.4.61 | 1 
                apr-util-1.6.3 | 1 
                    attr-2.5.2 | 1 
aubio-152d6819b360c2e7b379e... | 1 
                 augeas-1.12.0 | 1 
                    bat-0.24.0 | 1 
                   bird-2.0.12 | 1 
                   bullet-3.25 | 1 
                 c-icap-0.5.10 | 1 
              cache-calibrator | 1 
             can-utils-2023.03 | 1 
                  clang-15.0.3 | 1 
             cni-plugins-1.3.0 | 1 
                 coreutils-9.3 | 1 
                   cvs-1.12.13 | 1 
                   dhrystone-2 | 1 
                    dust-0.9.0 | 1 
                  fbdump-0.4.2 | 1 
                flannel-0.25.3 | 1 
               freeipmi-1.6.14 | 1 
            gettext-gnu-0.22.4 | 1 
         host-gcc-final-13.3.0 | 1 
           host-gengetopt-2.23 | 1 
                   host-go-src | 1 
     host-moby-buildkit-0.11.6 | 1 
host-prelink-cross-440c0059... | 1 
              host-runc-1.1.12 | 1 
                   hwloc-2.9.3 | 1 
igh-ethercat-f5dc109176400f... | 1 
               ipmitool-1_8_19 | 1 
                iproute2-6.9.0 | 1 
                jemalloc-5.3.0 | 1 
          libcamera-apps-1.2.1 | 1 
                libcuefile-475 | 1 
        liblog4c-localtime-1.0 | 1 
              libopenssl-3.3.1 | 1 
              libsndfile-1.2.2 | 1 
                libxml2-2.12.6 | 1 
               lighttpd-1.4.76 | 1 
          linux-5.10.162-cip24 | 1 
               linux-pam-1.6.1 | 1 
                   linux-tools | 1 
                  mender-3.4.0 | 1 
          ncurses-6.4-20230603 | 1 
                nushell-0.85.0 | 1 
                  octave-9.2.0 | 1 
                 pixman-0.42.2 | 1 
procrank_linux-21c30ab4514a... | 1 
           python-numpy-1.25.0 | 1 
         python-remi-2022.7.27 | 1 
             sofia-sip-1.13.17 | 1 
                softhsm2-2.6.1 | 1 
             stress-ng-0.17.07 | 1 
                  sysprof-46.0 | 1 
                    tiff-4.6.0 | 1 
ulog-0389d243352255f6182326... | 1 
             util-linux-2.39.3 | 1 
           v4l2loopback-0.12.7 | 1 
                 zlib-ng-2.1.6 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/ca6802c979d9fcc5ca6a825f35df615189ca6961 | ORPH
   arceb     | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/1c72d3e8cd50eaa76aa8420e32918bffc4740af2 | ORPH
  aarch64    | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/6c89d8f3800dcfc3029a67232499e2517c195be8 | ORPH
 microblaze  | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/8c4c790c1d18ec220b61643f7940f35694881c99 | ORPH
  riscv64    |        alsa-lib-1.2.12         | NOK | http://autobuild.buildroot.net/results/2e791d25d819ba0404167013cfe2cd6d427ce037 |     
    mips     | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/abfaf53328d0b29c778f75e105cc7043f2ad44fe |     
   sparc     | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/d2467a2ac4a915d850cc8bc2341d9803346604a9 |     
   xtensa    | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/a4cf59ce479b7db7f0a3269c0462ce1ccc9f600e |     
  powerpc    | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/667a49bff45b226dec4349d54f977c8bd6abadd5 |     
   mipsel    | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/92cf3eea0e0d7531220cd9850993e269a3a4744d |     
 powerpc64   |         apache-2.4.61          | NOK | http://autobuild.buildroot.net/results/7e4b60a343d16076bc81e9c8aeefb0bc05f3316c |     
   xtensa    |         apr-util-1.6.3         | NOK | http://autobuild.buildroot.net/results/9ddc7c94c371d2d7733708616b4db6f69e3bba08 |     
  aarch64    |           attr-2.5.2           | NOK | http://autobuild.buildroot.net/results/7938993e6fe4ba9248d9cccc03852ce2c211a282 |     
 aarch64_be  | aubio-152d6819b360c2e7b379e... | NOK | http://autobuild.buildroot.net/results/5cf1183ff46b1c28a913c802f75bed95454faced |     
    arm      |         augeas-1.12.0          | NOK | http://autobuild.buildroot.net/results/bb3b043133beb495e59fd0ab3fb03820071f121c | ORPH
    or1k     |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/dc5275b5d0be29016e4ecc769ab6734cf908846e | ORPH
 aarch64_be  |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/c2aea68efb483e1f0b06eb51722cdacc07a3328c | ORPH
  aarch64    |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/71a69a4ce2f623d48c31316a034e07e367624d22 | ORPH
    arc      |   bandwidthd-2.0.1-auto-r11    | NOK | http://autobuild.buildroot.net/results/ce04d818f5b9a32f1739124ffbb24bd65178faa4 |     
   xtensa    |   bandwidthd-2.0.1-auto-r11    | NOK | http://autobuild.buildroot.net/results/77e9795a66e4a800320e43e78f3531a08b504b94 |     
    or1k     |   bandwidthd-2.0.1-auto-r11    | NOK | http://autobuild.buildroot.net/results/8465d58be974e47e993b5949655f50f5b6783f9a |     
   armeb     |           bat-0.24.0           | NOK | http://autobuild.buildroot.net/results/ebf367146e845f9b8e612a79f5a4c22668d144a7 |     
  sparc64    |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/3b01937d6db575f8d4db3904088b8be74dae9a43 |     
    or1k     |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/1f29cea00ee681ef48fbc1f76f36700f6c1a9528 |     
   mips64    |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/b852d5e6a716d8d01f816becf1d56336d47ba634 |     
    mips     | brcm-patchram-plus-95b7b691... | NOK | http://autobuild.buildroot.net/results/edbd4ff6f7529a691a5e76bdbe02408aea11ffa3 |     
   sparc     | brcm-patchram-plus-95b7b691... | NOK | http://autobuild.buildroot.net/results/0917aeb20de9b94b73e6f6929e231c64b037ec28 |     
    or1k     |          bullet-3.25           | NOK | http://autobuild.buildroot.net/results/2961bf1619bf48594030334f490b901d6cbcd6d6 |     
    arc      |         c-icap-0.5.10          | NOK | http://autobuild.buildroot.net/results/2255785d3d432ecc7ec6a8d05f378a51f800d914 | ORPH
 powerpc64   |        cache-calibrator        | NOK | http://autobuild.buildroot.net/results/b7b0c2f0fa8ed764c21d4e5ffabe02399ed26e50 |     
  mips64el   |       can-utils-2023.03        | NOK | http://autobuild.buildroot.net/results/452b4299dff3ba3024f8fcc80640f35a35dc8e90 |     
    arm      |          clang-15.0.3          | NOK | http://autobuild.buildroot.net/results/cfb1fd325d272d22c853b4bf780811240de5ff7e |     
   s390x     |       cni-plugins-1.3.0        | NOK | http://autobuild.buildroot.net/results/2343930e561b68a6c9fff54100ede21a33cb62a9 |     
   x86_64    |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/c3504b8430b6425c4c65dcbe7982881cbc0a9081 | ORPH
 powerpc64   |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/a8a8d012051c4f9fe2d8c73eeeaade3ad68bf182 |     
  sparc64    |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/52cf3bb13afac151c20b1b4a68eac8cbceee4248 |     
    or1k     |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/cae7ccb6c93dc767ee7db0aef94f2f1845933907 |     
   nios2     |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/9a44db013ca549e58d401d359791c5411e8ab6ef |     
   mips64    |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/effe67c7bd3923e319cb9160439ce98eadcc459e |     
microblazeel |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/d7c560298b0362a1f6221b82738f895d0a50c56e |     
    mips     |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/5eba92207394855a3e72c088460549e39925677a |     
microblazeel |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/84937d354f40dbc20f69b2da2e21007867221140 |     
  powerpc    |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/cd58e81f21823d87333fea11d029872736018830 |     
   x86_64    |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/17c3edcfb3223273688f2e045aa90dfb07f99941 |     
microblazeel |        cracklib-2.9.11         | NOK | http://autobuild.buildroot.net/results/4686dcc532ed2afdddb28295f25ba5327c55d523 |     
    mips     |          cvs-1.12.13           | NOK | http://autobuild.buildroot.net/results/d1b9cbaccd17ec700a4c9e01ea02cc9f8853f020 | ORPH
   s390x     |       dahdi-linux-3.3.0        | NOK | http://autobuild.buildroot.net/results/44645cd4c30d41baa029cf1fed399fae69222e46 |     
   s390x     |       dahdi-linux-3.3.0        | NOK | http://autobuild.buildroot.net/results/47391ca1ad181673d7650d5ee45af97d35c8321a |     
    or1k     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/a46bbb80a29bc83d2c73af89a75b872d2063be54 | ORPH
   sh4eb     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/170841db0a19434aa829ceaf20e9cb54e05aee36 | ORPH
    or1k     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/2b0d6b4e8b9fb32e37407b2339c2023945e93598 | ORPH
    arm      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/06f9fb29fbd006da36c6c59e1d3948a71be137c2 | ORPH
   nios2     |          dhrystone-2           | NOK | http://autobuild.buildroot.net/results/8e65ba30efd5a6bca197f24ced2db1f8226b2c51 | ORPH
   armeb     |           dust-0.9.0           | NOK | http://autobuild.buildroot.net/results/91afc485bca97d4c10132e504b232ba369eb6b19 | ORPH
    arc      | edid-decode-6f117a8f8c0e76e... | NOK | http://autobuild.buildroot.net/results/3fa75ceea6031fe0ae72bb8a15d83a637850c9e5 | ORPH
  aarch64    | edid-decode-6f117a8f8c0e76e... | NOK | http://autobuild.buildroot.net/results/d89f262fd3e007b2447ac3afdbce496768b1babe | ORPH
    m68k     | edid-decode-6f117a8f8c0e76e... | NOK | http://autobuild.buildroot.net/results/861b3336549887b97005631605dfe06befedefb2 | ORPH
   sparc     | edid-decode-6f117a8f8c0e76e... | NOK | http://autobuild.buildroot.net/results/b0771a24fb3f4c11b041e76fc4ad10765d158adb | ORPH
   x86_64    | edid-decode-6f117a8f8c0e76e... | NOK | http://autobuild.buildroot.net/results/ab356ecfd29714f6d69ef0c5795172203c87ccb5 | ORPH
  mips64el   |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/056a55c984f7b436672e2601f514c8a4e22fc8e0 | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/413c684ef99d89dd2b3b695dd828b6e4654481ae | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/ab39aa4d2332ca05e12d806c72e9ce9e832f18c0 | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/ea8f175115e0fe7038d0392329e2ba5d1d12b220 | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/a9efffe4bc2f0a69c6a3f1b549c3071a020f098e | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/45b9990554f6a09cb7cfcef12430d6d7598bcd95 | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/d90e9dc4420229a303df9e896017870b56a72655 | ORPH
    m68k     |          evemu-2.7.0           | NOK | http://autobuild.buildroot.net/results/a5d55b1e996ab0fa95a90457567921daf0b0a2ac |     
   mips64    |          evemu-2.7.0           | NOK | http://autobuild.buildroot.net/results/b87c7fe51c116da7ba6b9b79336dbd54c6de43f2 |     
   x86_64    |          evemu-2.7.0           | NOK | http://autobuild.buildroot.net/results/065e290228a3f06f1641db9d11bcd588f72dbc57 |     
   x86_64    |          evemu-2.7.0           | NOK | http://autobuild.buildroot.net/results/336c708b5f560bf0e85782a8675212e7eeae26cb |     
microblazeel |          evemu-2.7.0           | NOK | http://autobuild.buildroot.net/results/aaf5036aaac01318aa0cd456f5937189cbee3fe4 |     
    i686     |          evemu-2.7.0           | NOK | http://autobuild.buildroot.net/results/2c57d11884c9a814a759c5ec0bd9ebd2795a1329 |     
    sh4a     |          fbdump-0.4.2          | NOK | http://autobuild.buildroot.net/results/17f8fe1b4b2d53f76207cdc8c7661ef5ba6f4510 | ORPH
 aarch64_be  |           fcft-3.1.6           | NOK | http://autobuild.buildroot.net/results/35fa874a40857dcbda1146a67909efe74f6eee5f |     
 aarch64_be  |           fcft-3.1.6           | NOK | http://autobuild.buildroot.net/results/5c86d678cbbcb44dab5ace3125577971711e7884 |     
microblazeel |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/5b29a63f6d71d2059513ed6a93014750532ccfa6 |     
microblazeel |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/a1150066f084864a36850b2cff6203c2d1ce7acb |     
    mips     |           file-5.45            | NOK | http://autobuild.buildroot.net/results/2dcd4e88eba8243e284fe19bedb1df4f0ff9a355 | ORPH
   mipsel    |           file-5.45            | NOK | http://autobuild.buildroot.net/results/a16001df93bd5acd7845bd9cd6a4a9802d11e6e6 | ORPH
   s390x     |         flannel-0.25.3         | NOK | http://autobuild.buildroot.net/results/da18fce1cf0cd7da2bf33a5967abacf814786605 |     
   nios2     |          foot-1.16.2           | NOK | http://autobuild.buildroot.net/results/5863e826b306d729ff3e2ac261919958c79619f2 |     
 microblaze  |          foot-1.16.2           | NOK | http://autobuild.buildroot.net/results/065d1cb37f8cf97870ed033d45fcdfe8675f34b9 |     
    mips     |          foot-1.16.2           | NOK | http://autobuild.buildroot.net/results/9c699075c4245046963a66aa6cc6532e72fdd993 |     
    sh4      |        freeipmi-1.6.14         | NOK | http://autobuild.buildroot.net/results/7e27e8a8e2965217086e10bd220e6239356dad39 |     
microblazeel |       gdk-pixbuf-2.42.10       | NOK | http://autobuild.buildroot.net/results/94477e61ff4a8386e2fe6d6bdac77fbc0c5c3e64 | ORPH
powerpc64le  |       gdk-pixbuf-2.42.10       | NOK | http://autobuild.buildroot.net/results/294795b6f603a58e5e2aed84472b66e115102727 | ORPH
 aarch64_be  |       gdk-pixbuf-2.42.10       | NOK | http://autobuild.buildroot.net/results/06eb6c810e9d03f100dfa8ad7a20a043e0ba1b2d | ORPH
   mipsel    |         gerbera-1.12.1         | NOK | http://autobuild.buildroot.net/results/e79983a07a93c5c78559a9af25b8418608e86eb6 |     
   sparc     |         gerbera-1.12.1         | NOK | http://autobuild.buildroot.net/results/c0091426342f5b42d9cd3c1bf0a139842062317a |     
   xtensa    |       gettext-gnu-0.22.4       | NOK | http://autobuild.buildroot.net/results/42c3f4c5d822f0f469d95b4168d54e0bbd532a85 | ORPH
powerpc64le  | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/13bd7fe1ca95ae969dd8d507b996a7b08a9122c1 |     
powerpc64le  | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/f3881b63c037ee737d1d36cca3063bfcde5a2762 |     
powerpc64le  | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/3a46d102c0803819b5a411456067dfb34be398e2 |     
    arc      | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/c7ec5bf19564f1082f2c61464c325d289909898d |     
  powerpc    | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/7afe72e9460afbb6be434edeef6be7dfd354d515 |     
 powerpc64   | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/dc783dc978d974aedbb65b698b6e89214123ec9c |     
powerpc64le  | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/a5d4ec16b6a0c802682e478a78e5609b57f204cf |     
powerpc64le  | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/16bf513fe9f449f5ecfa934d59c374a19d40a00d |     
    arm      |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/a420e31852d218e4f9fb43c77e94dbd03851e9c7 |     
   armeb     |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/b272d8b5d9973a57daed6a84ce0502695b8073c3 |     
 aarch64_be  |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/fd68680cd6539031fb416d7db5cb3bd7e9c1bc4e |     
 aarch64_be  |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/4071d4c784a24c5ea3c0e12845123514e3a906f1 |     
  riscv64    |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/951c6a6a99b262488f8c7a2849a9fdb6c699f29c |     
    or1k     |         gnuplot-6.0.1          | NOK | http://autobuild.buildroot.net/results/efc534fe83c2b040dc72e0f2dd1fbf9f23e67b3e |     
 microblaze  |         gnuplot-6.0.1          | NOK | http://autobuild.buildroot.net/results/47527784a661ea87624e54b8c1f5218cb67ac2b5 |     
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/aa209dd673fe5b126f661043f06d91442eecec50 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/82ac8af4bf906900423f55c13eebf1d7bece08a7 | ORPH
powerpc64le  |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/c4f9a708fe9b1b0b0ebb85ec2e606278cf5e65d5 | ORPH
   x86_64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/4b3e33cf8b347e8632625fb71a4e40098a4d438c | ORPH
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/d98c9378949166c5e2c7fa6eff867edd27ae1e03 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/676f49e29f6059f5eedb1777ceb1992094ed74c5 | ORPH
 powerpc64   |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/6c0bdd354b91f3b25a25def5dc3d9aafe21b2e48 | ORPH
    mips     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/55f2c0192eb09f929753763f0616381bb6062e4e | ORPH
powerpc64le  |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/173dad6c097a43839594804675f871f03426b7a6 | ORPH
  aarch64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/845c1c0ab0a266a10fc6bd83356de7cbd0281e0e | ORPH
   x86_64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/9779942f144807b559cc01b4509260bcea347941 | ORPH
   mipsel    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/d07b3f4090903f98a81be17a731c45cb30237481 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/9b6be6774de87dd4b04da8e9d69a83dcd203b4ab | ORPH
  aarch64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/39ed99b71ab9622865210eb6821f105d433f4afa | ORPH
  riscv32    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/a0fea954f5902bc01de2db6f33fbac566220d6c9 | ORPH
   mipsel    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/a457bad97553c740db164393b9d3b583a003495e | ORPH
   s390x     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/c842fdccfb5634ab2e6b70df5214d06629fdb374 | ORPH
 microblaze  |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/a8752f541f3b4603669779c75aa1c4295f0641ab | ORPH
   nios2     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/9ed4c034f03459becfe342df2996dd60c6a4633a | ORPH
  aarch64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/2cc8593f75790b65cd12fae20c046a7961999090 | ORPH
    mips     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/307766439694eafd78e7cd857630c4ade11a80e1 | ORPH
microblazeel |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/533f5e6f88ae1713d28257f205e035768204a7aa | ORPH
    sh4      |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/4d787dfbc02a64da71209e0060f92d580d12dca2 | ORPH
  aarch64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/44208b7944cbccefda4a5d0681888c7cd77d5a2b | ORPH
   mipsel    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/c9d480d0b08958a1a1f71e07e18171397590027d | ORPH
    m68k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/629ec7dda629e81fc470d412a2a121eeb4fab6bc | ORPH
   nios2     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/3a2c3b6ace53e84bc33b1a6dec3fd65b0b19935f | ORPH
   mipsel    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/2a9d0e7e77642c50703701b63cc345d7f87db372 | ORPH
 powerpc64   |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/05c1064434877ee83deef0f16d5ae5a3616cc227 | ORPH
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/28e625490a781a0d43c8cc95c1ae1e19d31c5d0b | ORPH
microblazeel |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/ea19d6715dce5fe0916e5b12c67e041118a10595 | ORPH
    mips     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/378ad1fc62f450a1d26d34cd66d62a4546bfd326 | ORPH
   nios2     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/98400f7614a68960f765ff3f30899c59f8cf1c10 | ORPH
   x86_64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/96d240f5b66d33a6a35f0fdabb34f15acf0819f7 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/50c23f2a1e6836619f29c2524c0adffb0510270b | ORPH
  aarch64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/8c50fea495d238c14eaae38b95d8fdd9c45c2677 | ORPH
   nios2     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/9ffd96d095fe1ada0d5cddbdbe0b744c174721f2 | ORPH
   nios2     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/ee42520e584a9bae4703791943561684f1d0eea0 | ORPH
    mips     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/8716e379f9dd960ade6ad438f056c68cb0af51b1 | ORPH
   s390x     | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/1fd0d0a9547d4ad2a24916eb79230d49a825e694 |     
    arm      | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/9e3bb951d7db1c8a8725b5570c54f6dec0e8b344 |     
  powerpc    | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/8c9345fcad6e935c13b16c318bbb27282de10ac1 |     
    sh4a     | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/4e8a2ce69bfb8a86da2711cb32a99ad51b0bdf5f |     
    arc      | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/ca6310cfcb0a9787eb5cec3c33aab903f4964cab |     
   xtensa    | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/a77509d4df8281d666d870faeb008f9196d3bbc3 |     
 powerpc64   | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/74cdcbcbe8bab244b1c368260162e3cef133376f |     
 microblaze  | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/225b2722b030b1ea1706db8dd54d62da81d8725b |     
   xtensa    |       host-binutils-2.42       | NOK | http://autobuild.buildroot.net/results/36a9a7ac1bbcc522e831bba176b061761e2e87e5 |     
   arceb     |       host-binutils-2.42       | NOK | http://autobuild.buildroot.net/results/b85b6b79012993e6a2d356cb5df452eb26e78836 |     
    i686     |       host-binutils-2.42       | NOK | http://autobuild.buildroot.net/results/88e24ecf2fdb78e5b9b8fdce47c86374bbda9c23 |     
    arc      | host-binutils-bare-metal-2.42  | NOK | http://autobuild.buildroot.net/results/84077ebf8f01f987e04abde97afd58f964870173 |     
    m68k     | host-binutils-bare-metal-2.42  | NOK | http://autobuild.buildroot.net/results/5b86268bb808fe286df9e3eba2a21e7526a0cd8e |     
    arc      |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/cdf074fa932be9a47b91b4e0d925a89a2ec2ef49 |     
    i686     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/f05a1b3d6ca19d7c8d061d9745cf9808f9a63498 |     
    or1k     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/fd8049cbc8cb6d6fe64a6b803b7ecaefffa31de2 |     
  sparc64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/1f74a788c4c99e00510c6300f90ac99d5945ec5c |     
 aarch64_be  |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/e5f8dace77526337ba8ee842b0bd2e3a1a2426fa |     
microblazeel |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/e41991438b7a7ff4f107a0418634cab2d9ccd0e2 |     
microblazeel |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/7d14a0918443e3db49694698b3789bc001fdfc54 |     
   arceb     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/a9b0c72ed537c01495f7c5937ccf6c8069731548 |     
   s390x     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/8567ffbfe2a1833a235caed90186d6d7c9e37015 |     
   mips64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/0e83d70bed0c72ad1edecb85528f9a09f56411e8 |     
   s390x     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/9ec66f4c06f5c09518077026268a9739fd691521 |     
   nios2     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/1d64e544aa8cd617b0885b88994f1eb5131a3a24 |     
   s390x     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/f3b4d4a9aa5b43d828abadf6683e7cc7b1920a91 |     
    arm      |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/cd90e1fb600282161ba1014cdf5bab30d717e007 |     
  powerpc    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/036a3699fee82911f2f7f4d1bb1adbcc292d931b |     
  sparc64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/e4ecbd4bb32c830d4f58d6aa468c6873e1379367 |     
  mips64el   |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/f7b9ccb712a6669fb27a24364a7ba75f8a087c78 |     
  riscv64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/3a39b2b9c8dfd5b91d8abc555237c9830193ee5a |     
    mips     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/984e2c057b511d801c58ac2f28a9eec19fc5f2e2 |     
microblazeel |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/b33efdd12f5fa7c64a634421bff86db50a7674f0 |     
   x86_64    |       host-delve-1.22.1        | NOK | http://autobuild.buildroot.net/results/70eef4657009dd9ec15edc65057eb42ad4734327 |     
    i686     |       host-delve-1.22.1        | NOK | http://autobuild.buildroot.net/results/7c1665bfff4ee39eafb516d1940d3c642dd9283e |     
  mips64el   |       host-delve-1.22.1        | NOK | http://autobuild.buildroot.net/results/2fb0f2d63217de420bfb86a93e6e52951d1986f0 |     
   mips64    |       host-delve-1.22.1        | NOK | http://autobuild.buildroot.net/results/391813a24749497984abb957e1cf5ad9864c6fb5 |     
 microblaze  |     host-gcc-final-13.3.0      | NOK | http://autobuild.buildroot.net/results/34cc8d76af8bf09d17436d49d3f85f6cb0f4300b |     
    arm      |      host-gengetopt-2.23       | NOK | http://autobuild.buildroot.net/results/19a1844ad72f4eb8a9ea3f93e45834e39cb61240 |     
  riscv64    |          host-go-src           | NOK | http://autobuild.buildroot.net/results/a9de62374c948f773634c694a47abcaa2bc266d0 |     
   x86_64    | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/9dc4bb86f9f192f7df76cef9161b56c0eca17454 | ORPH
   mipsel    | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/729e2960a4e411b4ddcf2a8d9e309eb8717c9504 | ORPH
    mips     |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.net/results/35b8d416befc7ffe28c0a25c1a08434a3a6427a1 |     
    i686     |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.net/results/4254817b78d79a320f212ca9563419fc14f31e81 |     
   x86_64    |   host-moby-buildkit-0.11.6    | NOK | http://autobuild.buildroot.net/results/6cfeb4eba9f8a6a8f584b94eae6faa7950a11fdb |     
   armeb     |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/b7bd3d4ed2e1ad966d60c7930bd5c538d5e29851 | ORPH
  aarch64    |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/463d90e600ecb32c1cf84274644d66ae509e31b1 | ORPH
   x86_64    |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/f35a0098e5252eb1a03d83d558094b2abc3d7b1c | ORPH
   nios2     |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/1b3811c141179b8fd0284b3e7a3792a8e8555808 | ORPH
   sparc     |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/7e776187401571510483e2e74fd8af8db1aaef3e | ORPH
  aarch64    |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/52b3143975c2278dbdf0cad5581dd2abda3bf641 | ORPH
   mipsel    |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/e8d4df419eddeb0b1aa77d01fe58f314abfbdec4 | ORPH
   x86_64    |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/9ef9a003ddfcee16eb68eea528da33962cd98b89 | ORPH
  riscv64    |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/5ee7d42c7300ac67ff92cba7878cb3f7b9ee9cd3 | ORPH
   sparc     |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/7b84ee30e99d5aae8208072e8a504f96b0045147 | ORPH
  aarch64    |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/a171ebcbf8d32a719e4800632ac0bb1c78e1e97b | ORPH
   nios2     |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/ca3b085172d3b5a079fd30d9634b64cde29c62ef | ORPH
 aarch64_be  |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/6c4100cf39cee280af9f7f47b37df6943e43e87e | ORPH
  aarch64    | host-prelink-cross-440c0059... | NOK | http://autobuild.buildroot.net/results/9703955c07f6f2c27819dc1d72940fc412546fd3 | ORPH
  riscv64    |        host-runc-1.1.12        | NOK | http://autobuild.buildroot.net/results/4b15e7a48229e9e0aa49fa77179833b186ab4e2d |     
   x86_64    |        host-rust-1.79.0        | NOK | http://autobuild.buildroot.net/results/a01e9c1e5c230051e7359d5100033174e8ea1ed2 |     
   armeb     |        host-rust-1.79.0        | NOK | http://autobuild.buildroot.net/results/0b9ddb865a882f752f11115b58a442f7337d78f1 |     
 powerpc64   |        host-rust-1.79.0        | NOK | http://autobuild.buildroot.net/results/fee6859cbc6e23a3b5e973c5e78abf02d0ea56c3 |     
   nios2     | host-softether-4.30-9700-beta  | NOK | http://autobuild.buildroot.net/results/e1bb1dd3a3560ffac7504a5df87d4376cc60035d | ORPH
  aarch64    | host-softether-4.30-9700-beta  | NOK | http://autobuild.buildroot.net/results/cd2100f05f8e1b067ab22d08b26cfaae5d8cec13 | ORPH
 powerpc64   | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/e93af88064a9739f84950883b96a03c30151bdc3 |     
microblazeel | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/7ca609b88a876cf2a94d7da4c08bfc43b70b5b6e |     
    arm      | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/0b214ccda745a2af57433b0805318ccdb8cd07a3 |     
    or1k     | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/01b0310ad0bb19c9a80e76db8f949950c827d1bd |     
   armeb     | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/f807d0d7844e05f273da13cc78e9de9e15b37b39 |     
  powerpc    |          httping-2.5           | NOK | http://autobuild.buildroot.net/results/f0ccb0545e60c25d5c07527fcca57875d3fc97f5 |     
    arm      |          httping-2.5           | NOK | http://autobuild.buildroot.net/results/43b6e5ad07ffe35f154eefe7e2b54483129ed7f7 |     
   x86_64    |          hwloc-2.9.3           | NOK | http://autobuild.buildroot.net/results/cfbdba324dbc305b1d9285fc8cfa237369e73db9 |     
   arceb     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/9c43396c227d9281ef83dd6dc29f426b4b7a041e |     
   arceb     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/7fe907c56227987f6047c35202343f379b2acade |     
powerpc64le  | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/ce4a70e60f09ba2bea04591fd850a5987a34cadb |     
    sh4a     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/5830982ba79b1232b3c280694abc2b2fa41cabc2 |     
  sparc64    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/c0681fa92f56157b871822d9572659a44d509412 |     
microblazeel | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/7a2bfcb3b1e8d0da30113db3f4958ad4f11bf24c |     
   s390x     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/4c232b95b1d49c94a0f02779c0ee0a70ea4bba5d |     
    mips     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/b8ddbbdf40db0b978251249abb7d5daba3a00ec2 |     
microblazeel | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/17f114eb558e0ad0d3de5fdf0e600dc34f6235b4 |     
powerpc64le  | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/56fcbc2fe16772a443c772e3f265653130d1ac32 |     
  mips64el   | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/8576ec2f76010c8df2a2a153e1435def65b84b17 |     
  riscv64    | igh-ethercat-f5dc109176400f... | NOK | http://autobuild.buildroot.net/results/e0163ff8a492f97b220a5dfc51a467f1a18a7e88 |     
   mips64    |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.net/results/3799c2015580e564d0b164c1d5dbbeb937b215ac |     
    i686     |         iproute2-6.9.0         | NOK | http://autobuild.buildroot.net/results/00da5b949192dd2705716759da6bd72aa720df72 |     
  riscv64    |         jemalloc-5.3.0         | NOK | http://autobuild.buildroot.net/results/ac2087ffd56fa3562fb5c07ac47ce4c3456fcc57 |     
  mips64el   |            kmod-31             | NOK | http://autobuild.buildroot.net/results/02f643f10150149ad67a66c63bfe64a5f7ad932a |     
  mips64el   |            kmod-31             | NOK | http://autobuild.buildroot.net/results/4f52dbde1789b185f36186fcef5e3264fc9bc422 |     
  mips64el   |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/59cc439f7ea6d1c5af9fb7ce155ed74c34a6e20f |     
    m68k     |         libcuefile-475         | NOK | http://autobuild.buildroot.net/results/c62404e590e3b7ffa5a4d92a6ba99dbbb121033c | ORPH
    i686     | libdbi-drivers-0bfae6c43134... | NOK | http://autobuild.buildroot.net/results/ce3d0451ae002bb2eae54c9142cf567c4c01db08 |     
  aarch64    | libdbi-drivers-0bfae6c43134... | NOK | http://autobuild.buildroot.net/results/dee21537de160233e4dd099bc5092e14a5b636c3 |     
   arceb     |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/37fea7180fa8bb20be474ed07f2195df9d070d0d |     
   arceb     |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/d571f468d4800bc74674ac903d77c3b41f83b7e1 |     
   arceb     |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/310d63e91df189c1d3be99faa031a58a7d48f744 |     
   arceb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/2073a4b3c3b95b094d8b979e94ff2fc659ecec84 |     
    arc      |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/6611ea121c82f53e3ae5d6b401b8f632965a53cf |     
    arm      |     liblog4c-localtime-1.0     | NOK | http://autobuild.buildroot.net/results/9262aa6b39ff1be2b0a6f7a0768cffe492f042d7 |     
 microblaze  |        libopenssl-3.3.1        | NOK | http://autobuild.buildroot.net/results/07fc8310760ce0126c9a6dc1cb2b7a9d01d530c3 | ORPH
    m68k     |         libp11-0.4.12          | NOK | http://autobuild.buildroot.net/results/2b6c905e7b6e002ffee5f834024b701a232f2e5f | ORPH
    sh4      |         libp11-0.4.12          | NOK | http://autobuild.buildroot.net/results/3939ed4a382a49b7de9241c39a60eb6f3bb7d3f2 | ORPH
 microblaze  |         libp11-0.4.12          | NOK | http://autobuild.buildroot.net/results/5c2a3ee93d746a12364fc50fee8b2995bd00890e | ORPH
  mips64el   |         libp11-0.4.12          | NOK | http://autobuild.buildroot.net/results/27d48c4608ff63dbd9befe81a19d200a47b212c2 | ORPH
    sh4      |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/cbf6038c17e08ed8d0824591b1eaaf071c03fcec | ORPH
   xtensa    |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/67a4da875f7f38e920e3b89f0eced570918f7eec | ORPH
 microblaze  |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/339786492ad67a19e483e822711f125b55008475 | ORPH
microblazeel |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/4ce1425115bd72db19cc96e4ac8cbd69973ff0c5 | ORPH
powerpc64le  |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/8c97e6f6400a18d21deabcd9a248c9929327798d | ORPH
   nios2     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/06d586b7a273190f50b485b7a58f4ad4f6236754 | ORPH
powerpc64le  |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/d8610da58e22758141a7e99d6a6b9e22813f6ecf | ORPH
 powerpc64   |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/92c2a81f2550e8509a758cb5e4447b6169011e84 | ORPH
   sh4eb     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/35857dfc2b6ae1c15f45fec166638eaa0a2c9a80 | ORPH
   sparc     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/a794601bc3c899652ae93689081c3c5af78a28f8 | ORPH
  mips64el   |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/e19b0a5b51fcc0230c89dffc51888e9117cf95ae | ORPH
   arceb     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/a4ff56d13ec5b80bbaf627db844a524b10601afe | ORPH
   arceb     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/b6f0715fbcd1f78685d7f5329cfa1150009545f5 | ORPH
   xtensa    |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/baa113c5e9e05ef0e7d31094299b4dd209bb6927 | ORPH
   nios2     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/8970cb9a534558e16d4c6a4a7be057b5f198b3f9 | ORPH
 powerpc64   |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/5b601a316cce127ba0375ebd468ffa4c0d7ac081 | ORPH
    sh4a     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/52af36cfc73dc144fb12359b235a00058b280084 | ORPH
powerpc64le  |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/0b0c4857d39284fd804b278e854054baed8bcf08 | ORPH
powerpc64le  |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/9322776e44d8befe8312e25f3544d6c87ef55164 | ORPH
   arceb     |        libsndfile-1.2.2        | NOK | http://autobuild.buildroot.net/results/75a89859802d66de247aadf73bde6640dc6fc86f |     
  mips64el   |         libxml2-2.12.6         | NOK | http://autobuild.buildroot.net/results/8a87e9a5ab8131a19fdf3a2651519377ad46a3a7 |     
   sparc     |        lighttpd-1.4.76         | NOK | http://autobuild.buildroot.net/results/7b7e6c6d0ca82f74af487aaf23ca012f7deefa61 | ORPH
   armeb     |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/60021771d2311d53da771a3faf5c4e2f8e2f46b2 | ORPH
  mips64el   |          linux-6.9.8           | NOK | http://autobuild.buildroot.net/results/1418f5c76a755b9939fbbeaf8a172b73b303f3f1 | ORPH
   mips64    |          linux-6.9.8           | NOK | http://autobuild.buildroot.net/results/0851a876eb724b691213eae39ee03ab5eb487c55 | ORPH
  sparc64    |          linux-6.9.8           | NOK | http://autobuild.buildroot.net/results/0b18698e7838e23e9da9729cb0f86e87eff7d904 | ORPH
    mips     |          linux-6.9.8           | NOK | http://autobuild.buildroot.net/results/6d8999e718aabd9543514e8555e31876a0d9b637 | ORPH
    mips     |          linux-6.9.8           | NOK | http://autobuild.buildroot.net/results/25834442143581dcf08df12f15b81aa5a2058f91 | ORPH
  mips64el   |          linux-6.9.8           | NOK | http://autobuild.buildroot.net/results/585295e664533d75c46ea99de6ecbdbd51f5ba9c | ORPH
 powerpc64   |    linux-firmware-20240410     | NOK | http://autobuild.buildroot.net/results/2e5978c4fdb495ad6874d912c4ccbd5f23259dc6 |     
  sparc64    |    linux-firmware-20240410     | NOK | http://autobuild.buildroot.net/results/30cb7e0b4951a715bdf3e581ee1e228e03f68c18 |     
   sparc     |        linux-pam-1.6.1         | NOK | http://autobuild.buildroot.net/results/5cfd61ac217061bbe88a2759c074868192ff6e89 | ORPH
powerpc64le  |          linux-tools           | NOK | http://autobuild.buildroot.net/results/5c2b684ec9e35a7a128a4273122d293380215b29 | ORPH
  sparc64    |     ltp-testsuite-20240524     | NOK | http://autobuild.buildroot.net/results/89b064af424edddce62943dc33bd085f5914e584 |     
    arm      |     ltp-testsuite-20240524     | NOK | http://autobuild.buildroot.net/results/6193963f8f41f81181a7187c30f11208ff17b17a |     
   sh4aeb    |        mariadb-10.11.6         | NOK | http://autobuild.buildroot.net/results/a06e474ea6f0e74bb46dc4c7d8339b052e0e47f2 | ORPH
  powerpc    |        mariadb-10.11.6         | NOK | http://autobuild.buildroot.net/results/d3ffad0114ccb1783f9d6add5992cc2debb5ca51 | ORPH
   s390x     |          mender-3.4.0          | NOK | http://autobuild.buildroot.net/results/a6cc3c3a598eb1478b1a9b98000a91e55ba42cbd |     
   mips64    |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/2d116c73532d95dcf6b405c3cfc0c3e69dbb33e0 |     
  powerpc    |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/5e92b58a7f0a01829a396ea7f1e9b9f9c55b43a2 |     
   mips64    |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/d7cf06af3b3610a9c990a716b3599cae5aafbf2d |     
    sh4a     |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/83c35587bcae3e91b480bf4527954c30f42a8719 |     
    or1k     |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/31a30cdb35310fbe81b55ae764a0a25b769e2988 |     
  mips64el   |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/a4744b5e9129be07026980208576a64b9364ca85 |     
   arceb     |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/cd01f492cef0940d1c4a7518e4e1476e30588371 |     
   xtensa    |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/f06a391bdbf7a94a0027cb080e8ebe32f9cb8aa2 |     
 aarch64_be  |           mpv-0.35.1           | NOK | http://autobuild.buildroot.net/results/9bdb638e752f2e99de843b8ffa14d7a2a0743e6e |     
   x86_64    |           mpv-0.35.1           | NOK | http://autobuild.buildroot.net/results/936e543cafe7a0876162117008336a3f0deb6713 |     
   arceb     |           mtd-2.2.0            | NOK | http://autobuild.buildroot.net/results/11860f376f3b64db60850fecc20cee8099fd898f |     
   arceb     |           mtd-2.2.0            | NOK | http://autobuild.buildroot.net/results/6ee810faee2f6bffd92d285f634b1e9ccfc1ccbc |     
   mipsel    |           ncmpc-0.49           | NOK | http://autobuild.buildroot.net/results/3c3237e90556a96f702af2c9dd9131f1ffe1ce4d |     
powerpc64le  |           ncmpc-0.49           | NOK | http://autobuild.buildroot.net/results/0f354065953a2eba1c3f7ab6366c8cb5d816662b |     
  aarch64    |      ncurses-6.4-20230603      | NOK | http://autobuild.buildroot.net/results/af4034e86e140879d211ce0331c098c00f26b04d | ORPH
 aarch64_be  |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/7f56c1ac53fb187668b37e9ea66830671084573c | ORPH
powerpc64le  |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/fd1640f14db8974f04cf2e3344c49f12de651961 | ORPH
   sparc     |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/123e8a9d17cf5370db4f568bd87abbc2a17ac3bc | ORPH
   x86_64    |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/5fc9014c33ce83e6f2fbbfe8dc45d9cc702c5a47 | ORPH
   s390x     |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/66a3243373e39b8e390aa96c3291482d106c3021 | ORPH
    i586     |          ntp-4.2.8p18          | NOK | http://autobuild.buildroot.net/results/d8c124c956e8aafe618cfb828c553f12c7cf423b |     
   xtensa    |          ntp-4.2.8p18          | NOK | http://autobuild.buildroot.net/results/29dbc9859256a34c2aa3798a93b1c997dfd4e03f |     
   armeb     |         nushell-0.85.0         | NOK | http://autobuild.buildroot.net/results/daf078b8941459a6bc320d5a0dbce20002bbe87a | ORPH
powerpc64le  |          octave-9.2.0          | NOK | http://autobuild.buildroot.net/results/e1cc79bd239013870bd0bc1ac6cec93fe1c2476d |     
   mips64    |         openssh-9.8p1          | NOK | http://autobuild.buildroot.net/results/86070abcba2c70a730fd4711dfd74a41b8047ff3 | ORPH
  powerpc    |         openssh-9.8p1          | NOK | http://autobuild.buildroot.net/results/cfd34c99dea99a22619028ebfb8b1a178019f8d3 | ORPH
 aarch64_be  |         pixman-0.42.2          | NOK | http://autobuild.buildroot.net/results/9c4636c19cc3331508f83b93c76966869638f549 | ORPH
   arceb     | procrank_linux-21c30ab4514a... | NOK | http://autobuild.buildroot.net/results/75c69a8442401e6d3842bdbbb263c28bcf47672b | ORPH
   x86_64    |      python-numpy-1.25.0       | NOK | http://autobuild.buildroot.net/results/6bff02454fa88cdb2e9b9d51c6ba8ea752c5da9c |     
    sh4a     |     python-remi-2022.7.27      | NOK | http://autobuild.buildroot.net/results/54007062b99a06b176793f02acbc96a63da0ec86 |     
   mips64    |         python3-3.12.4         | NOK | http://autobuild.buildroot.net/results/4ab63c0b365a7bc898fa6788984b68fea61df8b5 |     
  mips64el   |         python3-3.12.4         | NOK | http://autobuild.buildroot.net/results/bdce2eca8b0326b9b21ebd90d5fe174dbb6f3612 |     
    i586     |       rabbitmq-c-0.13.0        | NOK | http://autobuild.buildroot.net/results/99389b387b70f74c4f148232ca051b072b2f5f3e |     
   x86_64    |       rabbitmq-c-0.13.0        | NOK | http://autobuild.buildroot.net/results/498d87e37a281caa03e745f43f2cb7e0ae141e09 |     
    arm      |       rabbitmq-c-0.13.0        | NOK | http://autobuild.buildroot.net/results/82a4638d31ed4d5a69da8a30e005a17290599c89 |     
    arc      |       rabbitmq-c-0.13.0        | NOK | http://autobuild.buildroot.net/results/daaea98233b93ce9b74f088a91e43ec8ccb3f06d |     
   xtensa    |         s6-dns-2.3.7.1         | NOK | http://autobuild.buildroot.net/results/f8ad6dc7598cdce8307936ceb2bef55c0826dae4 |     
    mips     |         s6-dns-2.3.7.1         | NOK | http://autobuild.buildroot.net/results/35e69632525d78c6ea091d757a2869490dee9293 |     
    arc      |       sofia-sip-1.13.17        | NOK | http://autobuild.buildroot.net/results/addf5fbdaabf970d68bfceaee3232762979694ca |     
    m68k     |         softhsm2-2.6.1         | NOK | http://autobuild.buildroot.net/results/3c11592e12c2d218fb2d1e3c26fd6fd6c1dcb873 | ORPH
   sh4aeb    |       stress-ng-0.17.07        | NOK | http://autobuild.buildroot.net/results/b1fd5829dec8b4054deb66537123423b6c70b617 |     
microblazeel |       strongswan-5.9.13        | NOK | http://autobuild.buildroot.net/results/ce78ff91461a84ded554610310df351585b7b899 |     
    arm      |       strongswan-5.9.13        | NOK | http://autobuild.buildroot.net/results/da1557f19dd3ca897c465c55cea8a1a6768e9f96 |     
   armeb     |          sysprof-46.0          | NOK | http://autobuild.buildroot.net/results/486f28d5fe59b18bb655ab927cfe7f5b36668395 |     
powerpc64le  | tftpd-e52af4207a6e09a1ba21f... | NOK | http://autobuild.buildroot.net/results/6a9b5b4f69f0f1aa9135c35e7c6f069187d94d07 | ORPH
   armeb     | tftpd-e52af4207a6e09a1ba21f... | NOK | http://autobuild.buildroot.net/results/2177c7288f5bb462deae1342fe24e80f4cc956e6 | ORPH
   mips64    |           tiff-4.6.0           | NOK | http://autobuild.buildroot.net/results/3be32415a90e7546e9a6e10a0e9a564554847ab5 | ORPH
 aarch64_be  | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/475e7118daad585164a3855fa8abc75a4ccb7f33 |     
   sparc     |         unbound-1.19.1         | NOK | http://autobuild.buildroot.net/results/9414298fae92add9bd6c438b79310cffd459a049 |     
 aarch64_be  |         unbound-1.19.1         | NOK | http://autobuild.buildroot.net/results/90c599e973243b88c30f9c430f742621bb8f2e1d |     
    sh4a     |         unbound-1.19.1         | NOK | http://autobuild.buildroot.net/results/5e1f65417c8c1667485054b512c05381b74ccfbf |     
  mips64el   |         unbound-1.19.1         | NOK | http://autobuild.buildroot.net/results/2a43225f40d6cf5aad5dfd3bffbfc416d4c54017 |     
    m68k     |         unbound-1.19.1         | NOK | http://autobuild.buildroot.net/results/1db4c1a7b4b1a49b7c0f7351e2cb2dccf705f52e |     
   mips64    |            unknown             | NOK | http://autobuild.buildroot.net/results/7f6ff8c5c8346703987e4c6d9c8a9a378c31e275 |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/801d7f80604ceaff188a5616ad58d92cbe141015 |     
   arceb     |       util-linux-2.39.3        | NOK | http://autobuild.buildroot.net/results/362b83da3dd65f30ae3c53c2bdacd761db5ec035 | ORPH
 powerpc64   |      v4l2loopback-0.12.7       | NOK | http://autobuild.buildroot.net/results/c1044080b5da1dcb1bd7ebf65a349a610cd15943 |     
   mips64    |            xz-5.6.2            | NOK | http://autobuild.buildroot.net/results/64cef6314d2a6317fcb186aaca5916b925124f4b | ORPH
   sparc     |            xz-5.6.2            | NOK | http://autobuild.buildroot.net/results/ba4500f4f1fd1a3329ef30d4a9b9cd6b3fd57d61 | ORPH
    arc      |            xz-5.6.2            | NOK | http://autobuild.buildroot.net/results/d25278c08aa5cb71f6acbd6e20b81cbbda158d93 | ORPH
 microblaze  |            xz-5.6.2            | NOK | http://autobuild.buildroot.net/results/38296ce6eb0488e4ffc43b829d712b8ca0186b29 | ORPH
   sparc     |            xz-5.6.2            | NOK | http://autobuild.buildroot.net/results/e625fbc9c9ca7de08fcc93ad2c70122eb6f91c87 | ORPH
 powerpc64   |          zabbix-6.2.7          | NOK | http://autobuild.buildroot.net/results/73f1e84199513e94a291f7920bd60145ae2acf36 |     
  aarch64    |          zabbix-6.2.7          | NOK | http://autobuild.buildroot.net/results/a2dbcf5679fb5d8ee7db16b306a32ae2fd8e2dc8 |     
  mips64el   |          zabbix-6.2.7          | NOK | http://autobuild.buildroot.net/results/681f9e3126bacf7d31bdabe165b1478ec2cf88ea |     
powerpc64le  |         zlib-ng-2.1.6          | NOK | http://autobuild.buildroot.net/results/7cd06853ad122ae71e3215903db333d4f9f343a0 | ORPH
    arm      |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/3e980f4dac66ae371887792c1c8246c3041a6f05 |     
    arc      |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/2173f931673f5cdb065f70133f9f3035ebd74e08 |     
  sparc64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/39607a08a4901c57446468f205eb8bcd88e9703f |     
   armeb     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/81e3709dd12b4d676f2b17751c5dbe782b810626 |     
    i686     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/216a857180069e83750ca4d37f540c77cc442b53 |     
   nios2     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/b5d863300fcd0f5267fba6ac8a4aca93a4b35670 |     
    i686     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/f2146a51ca72fdc5f44e5a6089f7e3f6d24a20a2 |     
    mips     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/0c49f090fb9f7775fc8c4ad0fff184ee242b1ebc |     
   s390x     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/a8e642060f3eab7453a20895c12c3c9874c1cd18 |     
microblazeel |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/3136bdc8589ba3f493637ea83a1e02ad74f2e39f |     
    i686     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/6b29357b0c8523cb3008c9111af9e7ac02c3c517 |     
  sparc64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/37afe9a8209f131c01f6dda4ee8901fa3c263e35 |     
microblazeel |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/03106f010791774b1a44633785acc9cb416ea3d5 |     
powerpc64le  |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/e778fd409f9413ecd39712a733526d3362a11206 |     
  mips64el   |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/f3ced963b793f730bb8e224dfb0757554a4e1b1d |     
    or1k     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/d08f29b060b38b8564a89cc8a6ab023b94b33529 |     
 powerpc64   |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/516ce83f8ee77f433f537d4d9422958a6b931d78 |     
   sh4eb     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/319ca88e756e3f7e51a37e363b3a5a76bded7702 |     
 powerpc64   |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/987def1383cdfbb3ecdf0cf6dcdaa4c27083ff3c |     
 microblaze  |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/2e5c884df824f225575d9ff444fa9de1633a9538 |     
  mips64el   |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/38c3ef3941b59fd3510277f996a0c49fa18e4633 |     
 powerpc64   |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/66cae6e20d537b634fe92546645459e6fb691d01 |     
   mips64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/3d3e5d836c59ee6df1ef08c8b317a50a70b29ef4 |     
powerpc64le  |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/fa79bd4b687a87719993f1dcd9bddd9e76f4452a |     
   arceb     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/7996eb68c1051b7e9c12ee3df8f927892a048ab5 |     
  sparc64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/48f82f7c9a3919f5a2ad155a9aeb3965d6893d3b |     
    m68k     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/1affb384318c1579583bb4e8d12616ebf7e96d1e |     
 aarch64_be  |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/4ffb7bba36e3436fcc6552a5cb0ae153256a2c64 |     
  mips64el   |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/1f97193335021ed3d8a0403c4f93bb32c276d5c0 |     
 aarch64_be  |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/ba3054d852edbab5eab626ebaef44c2343b95428 |     
  sparc64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/8adb55d15a0a301ff7136def42855b7db444fdf5 |     
    mips     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/7a21447af6423df13e1f5c68c004b1e228af08a3 |     
    i686     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/e53007addd2eafb817535146359448a7132d18d8 |     
   armeb     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/931a9dd62bfeabfaaf378d69d71e4d786eba065d |     
    arm      |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/0ae55fca9a48d5a6bf037d3450c13ae6d7582d17 |     
  sparc64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/5ae121346cd8b2b0ce1c34885e9761b76c832c98 |     
 powerpc64   |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/c617856233890f82499ff5f709ea93aa55860a96 |     
  sparc64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/b69104526e691476a70084a6963c8377ab681677 |     
   armeb     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/bea4beae99790cf49492ccac90c51329c65e2c55 |     
  aarch64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/a6a8ec43149fd7e3bde5d5893f09765c9a067e30 |     
   mipsel    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/3e361c318d486fce85e880c233262cc44c2e20b8 |     
   arceb     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/9dd7eb9963cc37f40b05cc7d955e216a2b3855dd |     
    or1k     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/6c28c093727cc3073e9e1916ab37d94de22f8cb5 |     
   x86_64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/1e914ea450b6b2ed08957547edfa666e47c537ab |     
   sparc     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/6e81e724450e237ec13c929d8cb1bb3fcc132585 |     
microblazeel |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/4e42c98e8c38c670159e4d43ba6cd4096f8dde65 |     
    sh4      |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/81cab45f611ed1184d63298ffa9351c717b98bf3 |     
 microblaze  |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/943fc434b640d25ecc9d5383593f9c4e657b33c5 |     
  sparc64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/2a35b4e13ac11c4014a401c4ad618da20e020e67 |     
   sh4eb     |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/05c3a632a8ae21e99c3da6d169d6276f1d403d35 |     
  powerpc    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/7dd1e20d5f9073fab00b9fb3773e883eaac64c23 |     
   x86_64    |           zstd-1.5.6           | NOK | http://autobuild.buildroot.net/results/19ee9919a5d2a1dc40e99d212c9e71903624e575 |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

                 coreutils-9.3 | 1 
                    eza-0.16.0 | 1 
 host-binutils-bare-metal-2.42 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   xtensa    |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/85c0dfbdb27dcf988a72adf7e425467ad0364da4 | ORPH
    arm      |           eza-0.16.0           | NOK | http://autobuild.buildroot.net/results/e6ab3a0732ef70845f2aca8c16a2bd35dea4d4d0 |     
    sh4      | host-binutils-bare-metal-2.42  | NOK | http://autobuild.buildroot.net/results/08af5d894b26261f2de0d51c08062aa59df00203 |     


Classification of failures by reason for 2024.05.x
--------------------------------------------------

                fail2ban-1.0.2 | 2 
  binutils-arc-2023.09-release | 1 
                 coreutils-9.3 | 1 
cwiid-fadf11e89b579bcc0336a... | 1 
                  libsepol-3.6 | 1 
                  linux-6.8.12 | 1 
                    ncmpc-0.49 | 1 
                     php-8.3.9 | 1 
squeezelite-71c012ad9ba102f... | 1 
                       unknown | 1 


Detail of failures for 2024.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |  binutils-arc-2023.09-release  | NOK | http://autobuild.buildroot.net/results/a72e6f35e0dd3fee3b9915422194e45d782a3cea |     
microblazeel |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/cfd6d2960e8f790b99d1862c5370de2b2201e4fa | ORPH
   sh4eb     | cwiid-fadf11e89b579bcc0336a... | NOK | http://autobuild.buildroot.net/results/a8b4b2c1af081ec586cb1414f56ca1eb29081a58 |     
  mips64el   |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/db76ef3571cc0e623d78f40b80db133f578cad36 |     
    i686     |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/cba96b4518987a034086b575f3f55470513c6ba9 |     
   xtensa    |          libsepol-3.6          | NOK | http://autobuild.buildroot.net/results/f772ff1dde3c4dee0f7dd6e1f59c4e300bacb033 |     
 powerpc64   |          linux-6.8.12          | NOK | http://autobuild.buildroot.net/results/6a83c840983edf3c3d4715edf15dc9dae313c626 | ORPH
    arc      |           ncmpc-0.49           | NOK | http://autobuild.buildroot.net/results/96b4f955b856dd18154d016d3edc9125f77920b1 |     
   armeb     |           php-8.3.9            | NOK | http://autobuild.buildroot.net/results/552f50954cc9311fa7bd8f2f5d4bd8681b08f2e4 |     
   s390x     | squeezelite-71c012ad9ba102f... | NOK | http://autobuild.buildroot.net/results/c710be8534d75a408e8e462963d01d0921a034ea |     
  riscv32    |            unknown             | NOK | http://autobuild.buildroot.net/results/f36c8bbd55aa744bbd2fa7800163a32584d8dc79 |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
