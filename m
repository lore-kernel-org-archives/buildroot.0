Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4439CC3DA5D
	for <buildroot@archiver.kernel.org>; Fri, 19 Jul 2024 04:58:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 02BAF40B3F;
	Fri, 19 Jul 2024 04:58:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f_reh5nxSfVK; Fri, 19 Jul 2024 04:58:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4AF6740B3E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4AF6740B3E;
	Fri, 19 Jul 2024 04:58:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E66181BF841
 for <buildroot@lists.busybox.net>; Fri, 19 Jul 2024 04:58:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CA52B402E8
 for <buildroot@lists.busybox.net>; Fri, 19 Jul 2024 04:58:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0VzHCX9HF75P for <buildroot@lists.busybox.net>;
 Fri, 19 Jul 2024 04:58:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 17002402E5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 17002402E5
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 17002402E5
 for <buildroot@buildroot.org>; Fri, 19 Jul 2024 04:58:06 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BEDE32000F
 for <buildroot@buildroot.org>; Fri, 19 Jul 2024 04:58:03 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Fri, 19 Jul 2024 04:58:03 -0000
X-GND-Sasl: bot@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1721365083; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Oqmtcxp5RCQuUu7VGkeRN7Wfq0U8zEXrDa5CHbiSRiw=;
 b=SRWDH3Hm3+xbbHWWwSF2dDiHi/gXF4Zef1D3RC/ltzF0LS4UZb18/h5GQ+Z8QpMz2g5X5f
 hX1bmPyH/Ub61iR1eJySkUAtV1Gozqv4G2Lz7HhprXCMT7u0VeVvRkJkL8Itdm5J+E5OVA
 yTDFTgN9uSUAPhALaHK9AL1c0NiS4+0AWVg5dcgW7RrJ9bxDljMXn0+MB/2/4mqZGPJvEg
 5vN20eo944gJC+wR2UcSlDQUSTX1028vxDzU80ACNOhgHLTHsxFXsHlSKTdmTs1okc2FR6
 q+6C6jOIP0dYnnqo84IE13xPQbYkQaCxLDDQwGgIpsbaMz1kJYJhS15+vQeYtA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=SRWDH3Hm
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2024-07-18
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
Message-ID: <20240719045803.BiABuflVhx8VLuj9dYUj82aPblMBp2ILymXX_OjTL8U@z>

Hello,

Autobuild statistics for 2024-07-18
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  9  |  9  |  0  | 18  |
  2024.05.x  |  6  |  4  |  0  | 10  |
    master   | 117 | 418 |  2  | 537 |

Classification of failures by reason for master
-----------------------------------------------

                  cairo-1.18.0 | 114
                elfutils-0.189 | 14
                    mpir-3.0.0 | 13
                     avahi-0.8 | 10
                flashrom-1.3.0 | 10
  gobject-introspection-1.76.1 | 10
                   httping-2.5 | 10
                  bcusdk-0.0.5 | 9 
glibc-2.39-74-g198632a05f6c... | 9 
                host-odb-2.4.0 | 7 
                  libffi-3.4.6 | 7 
               tipidee-0.0.5.0 | 7 
ibm-sw-tpm2-5452af422edeff7... | 6 
aer-inject-9bd5e2c7886fca72... | 5 
edid-decode-6f117a8f8c0e76e... | 5 
                gerbera-1.12.1 | 5 
                   linux-6.9.8 | 5 
     bandwidthd-2.0.1-auto-r11 | 4 
                  ffmpeg-6.1.1 | 4 
host-go-bootstrap-stage1-1.... | 4 
host-vboot-utils-bbdd62f9b0... | 4 
                     mtd-2.2.0 | 4 
                    norm-1.5.8 | 4 
android-tools-4.2.2+git2013... | 3 
              cache-calibrator | 3 
                espflash-3.1.0 | 3 
                   foot-1.16.2 | 3 
                 gnuplot-6.0.1 | 3 
             gnuradio-3.10.7.0 | 3 
         host-libxcrypt-4.4.36 | 3 
              host-rust-1.79.0 | 3 
                  libdex-0.6.1 | 3 
               libglib2-2.76.1 | 3 
                libressl-3.8.4 | 3 
               mariadb-10.11.6 | 3 
             rabbitmq-c-0.13.0 | 3 
tftpd-e52af4207a6e09a1ba21f... | 3 
                apr-util-1.6.3 | 2 
                 augeas-1.12.0 | 2 
brcm-patchram-plus-95b7b691... | 2 
                 chicken-5.3.0 | 2 
           crucible-2023.11.02 | 2 
              fftw-quad-3.3.10 | 2 
                gnu-efi-3.0.18 | 2 
               graphene-1.10.8 | 2 
            gtkiostream-v1.8.0 | 2 
            host-binutils-2.42 | 2 
 host-binutils-bare-metal-2.42 | 2 
host-go-bootstrap-stage3-1.... | 2 
host-heimdal-f4faaeaba371ff... | 2 
           host-librsvg-2.50.9 | 2 
                  libsepol-3.6 | 2 
          linux-5.10.162-cip24 | 2 
     linux-5.10.162-cip24-rt10 | 2 
                  mender-3.4.0 | 2 
                  ntp-4.2.8p18 | 2 
                 openssh-9.8p1 | 2 
                      xz-5.6.2 | 2 
                       aespipe | 1 
                 apache-2.4.61 | 1 
aubio-152d6819b360c2e7b379e... | 1 
                 avro-c-1.11.3 | 1 
                  bind-9.16.48 | 1 
                  boost-1.83.0 | 1 
                bpftool-v7.1.0 | 1 
                busybox-1.36.1 | 1 
                 coreutils-9.3 | 1 
                   cpuload-0.3 | 1 
cwiid-fadf11e89b579bcc0336a... | 1 
                   duma-2.5.21 | 1 
dvb-apps-3d43b280298c39a67d... | 1 
            ecryptfs-utils-111 | 1 
                  fbdump-0.4.2 | 1 
                    fcft-3.1.6 | 1 
                     file-5.45 | 1 
             fontconfig-2.14.2 | 1 
                     frr-8.5.4 | 1 
                  gamin-0.1.10 | 1 
                    gdal-3.8.2 | 1 
                      gdb-14.2 | 1 
            gdk-pixbuf-2.42.10 | 1 
google-breakpad-f49c2f1a202... | 1 
                 hddtemp-0.4.3 | 1 
             host-delve-1.22.1 | 1 
         host-gcc-final-13.3.0 | 1 
         host-gcc-final-14.1.0 | 1 
           host-gengetopt-2.23 | 1 
host-go-bootstrap-stage2-1.... | 1 
                   host-go-src | 1 
     host-moby-buildkit-0.11.6 | 1 
                     host-mono | 1 
           host-python3-3.12.4 | 1 
              host-runc-1.1.12 | 1 
 host-softether-4.30-9700-beta | 1 
                jemalloc-5.3.0 | 1 
                  kexec-2.0.28 | 1 
                       kmod-31 | 1 
           libatomic_ops-7.8.2 | 1 
                 libcli-1.10.7 | 1 
                 libcurl-8.8.0 | 1 
        liblog4c-localtime-1.0 | 1 
                 libp11-0.4.12 | 1 
                librsvg-2.50.9 | 1 
               libunwind-1.8.1 | 1 
           lksctp-tools-1.0.19 | 1 
                   llvm-15.0.3 | 1 
                 logsurfer-1.8 | 1 
           mediastreamer-4.4.8 | 1 
                memtest86-6.20 | 1 
                 openal-1.22.0 | 1 
               openblas-0.3.27 | 1 
                openswan-3.0.0 | 1 
               pulseaudio-17.0 | 1 
                python3-3.12.4 | 1 
                    rtty-8.1.0 | 1 
              skalibs-2.14.2.0 | 1 
                   thttpd-2.29 | 1 
                 uclibc-1.0.49 | 1 
ulog-0389d243352255f6182326... | 1 
                unbound-1.19.1 | 1 
                       unknown | 1 
             util-linux-2.39.3 | 1 
           v4l2loopback-0.12.7 | 1 
                  zabbix-6.2.7 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/ae49c96accebc47b1f49a58f2be9d7eb3c3a97bb | ORPH
   mips64    | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/65de18765f13cd39e555792ad704079795c05205 | ORPH
  riscv64    | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/3625c0e1906d6269f2704ca3e69d9e001b1bfc7f | ORPH
 powerpc64   | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/189796b79a939ce097a0f8f83222411b0070a333 | ORPH
 microblaze  | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/8b78edbf5ebc684060f7557b3a74b2700ebef1d8 | ORPH
  powerpc    |            aespipe             | TIM | http://autobuild.buildroot.net/results/abcefdee1202b3fe076707a41235125a4a006594 |     
    arc      | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/c7d78e97ce497d6abc2ae0c8b47901859db769bf |     
 microblaze  | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/143cc94c55a34c755ecb908ee98faa431bc4d410 |     
powerpc64le  | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/d94fecec9203f27ec9fab7658e8d3d53f5d66fae |     
 powerpc64   |         apache-2.4.61          | NOK | http://autobuild.buildroot.net/results/42ae3039dca2c92e2b0a2ea97d0dcb9b8246c29f |     
powerpc64le  |         apr-util-1.6.3         | NOK | http://autobuild.buildroot.net/results/2c2bddc5d9b70382e8aec934c8d81ea955a36b96 |     
   sh4aeb    |         apr-util-1.6.3         | NOK | http://autobuild.buildroot.net/results/f401034a976fb7f45851e6103b2000e1fb28e1e3 |     
    or1k     | aubio-152d6819b360c2e7b379e... | NOK | http://autobuild.buildroot.net/results/bd5b2681012921d5b7dcdcfdc2223bcea09d9f35 |     
    sh4a     |         augeas-1.12.0          | NOK | http://autobuild.buildroot.net/results/b76afff3c63fe145bd8b96cc0de04428e021fb58 | ORPH
   armeb     |         augeas-1.12.0          | NOK | http://autobuild.buildroot.net/results/d451fad96284c9c6f27b14259bab128adff68d3b | ORPH
powerpc64le  |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/8d5aef4e670b5bb2adc2e47e0e10d3685cd5cdf6 | ORPH
  aarch64    |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/c624ef3b58260030e8085207ae6f10ca98698bef | ORPH
    m68k     |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/7e564160d4980dba9ee92e7100c7a924d4735d84 | ORPH
powerpc64le  |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/f746cbdcdd8dca79e6049dcc53fdb1849f64d373 | ORPH
microblazeel |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/d29ed408f05edbffcc96ea09aa4ccad74196b7e7 | ORPH
  sparc64    |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/1e7fd5dc28f09b87d3beb309f20c77202df183a5 | ORPH
   nios2     |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/50da391fb58ed6b46d8bab73dbbc5882bc7fad3e | ORPH
  sparc64    |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/3eca76e51d9bb65c3d55cfc8f19ce2b377a7bf29 | ORPH
   armeb     |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/504ff4b362ff89fbaccc7d410e443b74db6a82af | ORPH
  sparc64    |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/fcbf083268a78fcbd9c49df89628992a271d8ec5 | ORPH
   mips64    |         avro-c-1.11.3          | NOK | http://autobuild.buildroot.net/results/53662c35ecced01339be3dea5d0f739b47fc67f1 |     
   sparc     |   bandwidthd-2.0.1-auto-r11    | NOK | http://autobuild.buildroot.net/results/a15bcc408d0ee31ab0510876c888cf64110e1d93 |     
microblazeel |   bandwidthd-2.0.1-auto-r11    | NOK | http://autobuild.buildroot.net/results/1f99215539deaa7c8cbcc10b34b1d496a66f1141 |     
 powerpc64   |   bandwidthd-2.0.1-auto-r11    | NOK | http://autobuild.buildroot.net/results/6c767972f47f766d5f64714531c9b65020ec6777 |     
  mips64el   |   bandwidthd-2.0.1-auto-r11    | NOK | http://autobuild.buildroot.net/results/383045b3f14c9cf3321c314cb6a274d9400caaad |     
   sh4eb     |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/0fe1c356e60fe303886f0d9655cd3c5eb6961e3a |     
   sparc     |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/e89833c502fea2c8dc75662918588fd5f99288a9 |     
    arc      |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/622cdd8b7cb665921ed0d8aac2fbc21df04b1269 |     
 aarch64_be  |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/a895b24c251064583cd3131649626bec29b666ae |     
    i686     |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/5a246d2eded28beca7f1bbc93c61571abb51ce49 |     
    arc      |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/c9ee0ecc154e33eb7f48310b03967d37c7072cbb |     
  mips64el   |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/62cd3f8ee5b5184c2614c2ff0b2ff0ded3870a2e |     
    or1k     |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/04e1fa035b8c02363a77656ebe9be08e6d359393 |     
   mips64    |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/70f3e82c8860c3e59f5d5a1c9ba7bb66cda90142 |     
  powerpc    |          bind-9.16.48          | NOK | http://autobuild.buildroot.net/results/f117535f60867441caba3f35941d485888a6373b | ORPH
   x86_64    |          boost-1.83.0          | NOK | http://autobuild.buildroot.net/results/448ec36208a7dc70d59156aebc75a289f07d3481 |     
   x86_64    |         bpftool-v7.1.0         | NOK | http://autobuild.buildroot.net/results/2e6efb86a69f69b29ee3f1168c9c6d0632220251 |     
  sparc64    | brcm-patchram-plus-95b7b691... | NOK | http://autobuild.buildroot.net/results/d3b0342817f17cd1bdd6a80c3da1fd303589d4a5 |     
    i686     | brcm-patchram-plus-95b7b691... | NOK | http://autobuild.buildroot.net/results/16c2a5d9d709506109cd5cd8a89a668f76c72086 |     
  riscv32    |         busybox-1.36.1         | NOK | http://autobuild.buildroot.net/results/01e3e85b4a43dc4ad1fe36e3b51457fec177da1a | ORPH
  powerpc    |        cache-calibrator        | NOK | http://autobuild.buildroot.net/results/7b241c61fafa40f918f5806ede6eff15270d7785 |     
powerpc64le  |        cache-calibrator        | NOK | http://autobuild.buildroot.net/results/1d4afceda6f793319de3d444e80dee8b0090ab8e |     
   armeb     |        cache-calibrator        | NOK | http://autobuild.buildroot.net/results/4c5c228fc662d23f0f615f59c5ce4606adac16c5 |     
   s390x     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/666545924c6a184a24e5fad4dbad9cf4b169e467 |     
 microblaze  |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/8ab2797f07bfd739e7bd1890c712f52c449f9dcb |     
   sh4aeb    |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/b6adc03a293e306bb83842e92f5efd411af8f60f |     
   x86_64    |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/324d57bc8db18ed0e25024c9d41146dcec96a28c |     
   sparc     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/5b29cc6779d8873b8b04e738ea780915bb6baa03 |     
    i686     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/7401f78b0e85ec5ba61eddaa0f6dad7e30ef2618 |     
   s390x     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/23cfec1b53d6ef2408df06e8fa73692ecdc808c8 |     
   sparc     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/5a415539beeab2cc0ca0ac5500e2df53bb4a6761 |     
   armeb     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/0ca68881b795a34926a17e66387c9bd9076ce6e7 |     
    arc      |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/326a6a1329011371facfb1f8fc0e44dba87dc49f |     
    arm      |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/5740ef6aacb3a19e5fa045d63dd9c4cfa3f5b4b3 |     
   mipsel    |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/5f9e2b5a5c3aaa54e294727ff3c4630df7c56cfc |     
   mipsel    |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/cf83f3802b7a6d5141f030e5ff5f0878bf747a41 |     
    or1k     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/24f9f7113d25ddc985c532d9abab6cd28e44a024 |     
  aarch64    |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/cd609bc7d23e0aad518ada5d9f7da53bbd8e6a78 |     
   arceb     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/182afe2a351d17bb3bd7625df61925ce4f89cc0e |     
   mips64    |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/869bf282b9ba54ba1aeff04153d022a5b977301d |     
   sparc     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/bc10be956dfee2e3a3006ac5c753dfe0f2044c58 |     
   nios2     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/e2311c6c2d305a4440ecf6dcefcda532316599b8 |     
microblazeel |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/5af422ce96ce72600167d03651a836db819b67d4 |     
 powerpc64   |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/ec1503d67214762d5b3f6f9eb226894bfd392cd0 |     
   s390x     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/a2ed589eb1f50073d30df4b01f4d90fbcc46ed1b |     
 aarch64_be  |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/870b6af72b264c49e1fb0bad3f796e6e760c80f0 |     
 powerpc64   |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/2ec6aa0820d0d63f667757ba19556674fca310cd |     
powerpc64le  |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/f4ef7d9fa227e8d2279fc3c04fc201e7b00328ac |     
   mipsel    |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/d463a63bc84c7ffc3deb5ba4d9f90fd4093041c1 |     
  mips64el   |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/4a91ce5fe1798230c5dc08f63a60bad728cdeac8 |     
   s390x     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/6ba3c563abc5ea096a4af54896ebef4a85586a02 |     
   x86_64    |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/a62545fd716611634d38d1fb0984a5bdd6d6e31d |     
 aarch64_be  |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/ad5ab2afb0fbb067da97b283fb912360deee3e92 |     
 aarch64_be  |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/7a9c8fe531837c609a37da1f78dd0f4a55784a16 |     
  riscv64    |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/4b0adf6cfc4cc126328dab28236b757669600054 |     
   mips64    |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/9d33eb2fd8709ac411ae256127c0b3d87408f00d |     
 aarch64_be  |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/4db92977b85e8da13299b0a5be6ad5bd97ed0e25 |     
    mips     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/dc9b6268f870ca34ab07c8836178a79b124c063d |     
powerpc64le  |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/d63d77e0c978aa5d6e4796012a0f20251da1bcfb |     
   arceb     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/ad0713c6ae50ad236826e06aa8aef56619174325 |     
  mips64el   |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/5f2a61d5c0cec497b1a5713a8c66e632f76648ac |     
    i686     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/9f99f8d760a5f01ad90a1197dfede5d7e3483809 |     
    arm      |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/609482718f090923c2915f749c2999786154730c |     
   armeb     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/2c24e36fcf464d39ed441a98d9ed07af304868ab |     
  powerpc    |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/50b7f58d59bcff709585f4037d1279f3ccf2502b |     
 powerpc64   |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/221a5a768079283cb3377ac8b91bc1a190a400dd |     
  mips64el   |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/a1448a25c7356b14cf4e8b84ea05d5ecbf61a412 |     
  powerpc    |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/215ff114620c7d818317c228c03f2b4dac9c15cf |     
    i686     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/c256001b56c68dc1b63500ef19df9adcda4466df |     
   arceb     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/725dc98f7af66de44d2f52dae2730782c8621ec1 |     
   nios2     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/6faa93099bc48f63b3abe1b1ad7e40235ab13919 |     
    arm      |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/8f4e82eead4cad40d73a21099262aaac4fdcff62 |     
   sparc     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/62cec079fce170a4ef164a1e9dd7a4a120036bea |     
    mips     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/d10c6f5d85d5facda672a51d62a026b22e568360 |     
   nios2     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/1bf98fb3731679497be13753feb89d0d05962693 |     
   mipsel    |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/a4021d2b00c4484f7a5c41ac119309f82a0c2fc9 |     
   armeb     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/2d0ece86642972914b2a62c440fd3b7575266700 |     
    arm      |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/3dfe6727b033cf91a49aebf96fbdb26262a3aca6 |     
   s390x     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/3384dfa03a1ede5cbd0885ec9cfa8187a9d7fc6c |     
   s390x     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/3981e6286de7f624499c0755e4964680d796c3b7 |     
   armeb     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/4eb2bf6a3977abefd51568d658d49cdaf3ae1b51 |     
   mips64    |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/b1a5f66467423122212c84ba30d9a39260793447 |     
    or1k     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/5e5b8e2767aa312aa3f828f28c5133061de387e5 |     
    arc      |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/4a9c773a6f652aa6e68198bf9b3a3a68ca5d1701 |     
   nios2     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/14fafc469c03fa834dce2722d8e8400bc7fa2145 |     
   sparc     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/869ff7db04f7e3d072b6fc9b465ccd6a44635a1f |     
  sparc64    |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/9f773fff3fbd7453ba825c5e38b4fbe376fb459e |     
   s390x     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/236db8f68abae103446998224e35cd9c56e80d06 |     
   s390x     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/de9d35dfa024ed23b69334c67e43c85e093587c2 |     
 aarch64_be  |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/cda7718a5b54567d6577337342d4bdfcdce2a30c |     
   armeb     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/2f445241f849f31362402ad5f993eaaca4353203 |     
    mips     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/3e0a83c2d2adf45c0fa23a9dd8dcfd5ec11d9146 |     
    m68k     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/625e5ed8bbd041200398c12164e2cbc5e09bc80a |     
    or1k     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/b3d942f04e83b38da41de2002982e0bd89b2bc87 |     
microblazeel |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/f2735b7cee987a7c99e799788e9e7e28a3bc7424 |     
   x86_64    |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/06fccd29429641856ebbf8f60823afb5b1ade3ea |     
   nios2     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/78fcf80e917f6a6d9a0313eb17df0fa79f9d9297 |     
   nios2     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/605f0c5622c270baab63ad4fafe96db652dfaa5d |     
    mips     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/0fe68f55d4eb53031f0c57d1151d9fb166b56a71 |     
   nios2     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/cb2a601c8a7bb3b4a54578dd3896f1f6a2288fbd |     
    or1k     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/00f381269ee7f16e560873982c17b089787199de |     
  aarch64    |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/bce7fced1b69d2704f884289048ba5f71641e6cd |     
    mips     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/5116ad1d797ef079d05081bfc4ab774345b84f94 |     
microblazeel |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/35ed41390cb01e47b7101043e4bb3770d424fb0a |     
 aarch64_be  |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/855ea3959f8ca9e395b0018800314af7367a4489 |     
  sparc64    |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/49195d94a3fcd1eb57446741eb88c568794134d2 |     
    arm      |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/348e1c10cba9ecb09bf745abb0f3d185c7f17058 |     
   mips64    |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/6016fc0105562ed8a77d92ebf0423e8936aad29e |     
    m68k     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/b8a7e0aaeec9ec03c037f2951b32b24679374244 |     
   mips64    |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/016f543b5ccc7fed9b70f1d5258b2ffeac0984fd |     
   nios2     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/984a3d258dc2eef468d641676fff7f09cb4f1920 |     
   sh4aeb    |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/e48f5b0b03d63aee54f0de03bfbb8ce576a4e6b5 |     
   sparc     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/9219956485e50082629d4662bc6156d63f1d4bfc |     
    m68k     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/c732af930df12f608177cbe48a0c6c2ffe1f40f0 |     
   nios2     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/1957aa9fb26ed70b38fe71da4f72992a5e8d6963 |     
  mips64el   |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/4d5bde19e90d70f4fbc4282b1202a4d1b482893e |     
    or1k     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/8a39b164b095d7adfff54d57aaaf0d2e9dffb58d |     
 powerpc64   |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/85cdc266b686dfecb14085738757f846db68841d |     
   xtensa    |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/ff6e7a118156309a9db3c211ba3f0d58f5d34835 |     
 microblaze  |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/ec27a4b7951fb3139f327eeb7d28231f7b7ea268 |     
 aarch64_be  |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/e6db4b746ccd0f79ef4f7d329fdcd494b0103b39 |     
powerpc64le  |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/a408f21281736d9e9e74d6896c69dc4eea9f5801 |     
  sparc64    |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/ea7b139c0b5e4cb749c9b05aa399feffc51ed173 |     
powerpc64le  |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/9f42a4a2c5727f336ceaa8e79c45fb0039359723 |     
  sparc64    |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/7fa5fe8ee6f792c0ec05badb79d7d6f6d943c485 |     
   x86_64    |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/b5c9d0346623c61560f121c3f89a3f3bbe6b8f6d |     
   x86_64    |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/98b62ab7ed3092f9f9085f723baf7d6267451e5c |     
    i686     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/42527cd58d0984a3ccf09cf6713cb404ed275f9a |     
   mipsel    |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/e9f54dbf8bedd69612a185d03d09160d9e7764c5 |     
   s390x     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/cd6808880419ecc2dc2dcd72690307e682c4152f |     
    sh4a     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/03cb37122f4fc2439fe6e5ae68eea80542e7bd7c |     
  sparc64    |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/b71f5682c81a0ad261202f271d6ff893664b60a6 |     
   mipsel    |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/35dee7973b36206d0b69552813bc1f9127392a97 |     
    i686     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/9d209cc72453bb3d251954968e135a5678496389 |     
   armeb     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/a141748d6464fb72b5e181ee53a32456f19c105f |     
   sparc     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/82fae56a2b687cd9ae8894b1eb38f7327215abad |     
  riscv32    |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/8626f36ba34a510fdf10b30bd4cc2029c445fd4e |     
   xtensa    |         chicken-5.3.0          | NOK | http://autobuild.buildroot.net/results/13d09b66548d662d98eec6fcb8c9a51aa2ae1c1d |     
   xtensa    |         chicken-5.3.0          | NOK | http://autobuild.buildroot.net/results/ed97b5c4dbaf2de43795e34978e6f37e525e4ad3 |     
    i686     |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/2df687a3817b6de3405f81f5c112fd0c2cf7f869 | ORPH
  aarch64    |          cpuload-0.3           | NOK | http://autobuild.buildroot.net/results/81a9e281e6ba40513cf37ef08eda6c912e638e46 |     
  riscv64    |      crucible-2023.11.02       | NOK | http://autobuild.buildroot.net/results/26c87c49862b6ac9f383e46451acce1ad41066ae |     
   x86_64    |      crucible-2023.11.02       | NOK | http://autobuild.buildroot.net/results/befcabff0bb5e4253f8d57702ebb0d8eceffe44c |     
    i686     | cwiid-fadf11e89b579bcc0336a... | NOK | http://autobuild.buildroot.net/results/5a623f0be66f7e7cf5ded2d66470c7aeb6470be8 |     
    i686     |          duma-2.5.21           | NOK | http://autobuild.buildroot.net/results/9c2f39f935a4b22e5b050b92a2e1766ea2516050 | ORPH
    arc      | dvb-apps-3d43b280298c39a67d... | NOK | http://autobuild.buildroot.net/results/bdafdbf0a40e3e9db9a316f97b3700c06d75eb51 |     
  sparc64    |       ecryptfs-utils-111       | NOK | http://autobuild.buildroot.net/results/f20ad4009f99f10552f2cdd7f600aa7a93195e37 |     
  sparc64    | edid-decode-6f117a8f8c0e76e... | NOK | http://autobuild.buildroot.net/results/70dba6aa3a12b0aa9616aba3eafd3d4c46780d3b | ORPH
  mips64el   | edid-decode-6f117a8f8c0e76e... | NOK | http://autobuild.buildroot.net/results/cbd73158cf06cd0637aa48aac36b8eb9412be8ad | ORPH
   arceb     | edid-decode-6f117a8f8c0e76e... | NOK | http://autobuild.buildroot.net/results/bbda7c81dd2c44373d0206d69bb16e7e0d8a475d | ORPH
    sh4      | edid-decode-6f117a8f8c0e76e... | NOK | http://autobuild.buildroot.net/results/fa253aafeb99d7f81ae8c735944dc55f518dd188 | ORPH
   nios2     | edid-decode-6f117a8f8c0e76e... | NOK | http://autobuild.buildroot.net/results/2a29369ba3121cffdf8f78af89dae5bd57794f5f | ORPH
    arc      |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/3b2bec8ea7734a4a382da26f8bbe149540edcd2d | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/c52f4f321bae7d596539c5a5ebdabeeec2a89bd5 | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/119ef3b3ad6b827b06199469d6f921b391803c1b | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/7b26c0a4d370b6236ed725ce618c7ac9c6e2ce5e | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/5c8ed84c2d16875e7f4132969a4912065061ec2b | ORPH
    arc      |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/f35e380891e6c1f34516f136f827274e888fec45 | ORPH
  mips64el   |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/6defa67594d5085f4807b94d60504d0147640ee6 | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/e7518f9c6d07d7d9601d8e7682b10f8a9f316956 | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/26f11d8b0fdfc980f18ce0b050a533423114cd8c | ORPH
  aarch64    |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/adac62cd46b41434398c421d286bd83eb29fb5db | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/d6f3e6721b77719016af633deff21eeb3563a7c4 | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/27d1e727efc64fe0060e425403bcb79ce2ef8792 | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/cb527cf1a72624637b5c9337eac549817dfe5bcf | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/20f29065e0196b563e2ec1d0ff3c335ed7b48bce | ORPH
  aarch64    |         espflash-3.1.0         | NOK | http://autobuild.buildroot.net/results/aa0287b172053727918e75f383257986d261297b |     
   x86_64    |         espflash-3.1.0         | NOK | http://autobuild.buildroot.net/results/6691e9443d97373a8a49c7290a9abd2d11cddd4b |     
  sparc64    |         espflash-3.1.0         | NOK | http://autobuild.buildroot.net/results/108956ae9c8d1c113b7bf7be9d1a50bc3d39735d |     
   mips64    |          fbdump-0.4.2          | NOK | http://autobuild.buildroot.net/results/facd451c5c99ca53f75512256157903e1043ebe6 | ORPH
 aarch64_be  |           fcft-3.1.6           | NOK | http://autobuild.buildroot.net/results/8fd2cfee4b7c0c1bfbeb05ea1537763c813d1ca1 |     
    arc      |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/756c79b6192d678dbc43e9b07d136ce97fb1d984 |     
   arceb     |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/ec1741e83b1906b57f10bbd5e814e9dc35851c5c |     
   arceb     |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/b3a2e0fa2dfbfd727457eb0364b3e9233b6b2a9c |     
microblazeel |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/cdcf5f2dfc35715ed6602ebbbf21c2a59b7e93d0 |     
powerpc64le  |        fftw-quad-3.3.10        | NOK | http://autobuild.buildroot.net/results/671be9b70d688c91e41d5d460af2914abd571b04 | ORPH
powerpc64le  |        fftw-quad-3.3.10        | NOK | http://autobuild.buildroot.net/results/5857926b1ca7a00236cb59bf2e44877c78521c89 | ORPH
   mipsel    |           file-5.45            | NOK | http://autobuild.buildroot.net/results/25c48b51cddf21efbc74dd5fb755043ef0a3949e | ORPH
 powerpc64   |         flashrom-1.3.0         | NOK | http://autobuild.buildroot.net/results/cc71492d9f2fff3692b17ee72a36f040a9300799 |     
  powerpc    |         flashrom-1.3.0         | NOK | http://autobuild.buildroot.net/results/cd2a572f35c3460a893f7d3fad0b836756cf2eca |     
   x86_64    |         flashrom-1.3.0         | NOK | http://autobuild.buildroot.net/results/7c9499cca5ef415e66dea38625e9a8d75de587c3 |     
  riscv64    |         flashrom-1.3.0         | NOK | http://autobuild.buildroot.net/results/3e961aec0cec5da3a25e1e062c662f590c820703 |     
   sparc     |         flashrom-1.3.0         | NOK | http://autobuild.buildroot.net/results/b2bc3d194fa3ba92bc3c452710d8dc963e32175b |     
    arc      |         flashrom-1.3.0         | NOK | http://autobuild.buildroot.net/results/f8ac2d6746e2715b1e44278c5c93ea768f72bbd7 |     
  aarch64    |         flashrom-1.3.0         | NOK | http://autobuild.buildroot.net/results/8a4d9f67ad427293334163b33a17ef75f1e30455 |     
    sh4a     |         flashrom-1.3.0         | NOK | http://autobuild.buildroot.net/results/860c277b51d9ff73bb163f58626ce5448395de81 |     
  riscv64    |         flashrom-1.3.0         | NOK | http://autobuild.buildroot.net/results/50d250ee86673c19173d2cfe58fb8bc5720db916 |     
  riscv64    |         flashrom-1.3.0         | NOK | http://autobuild.buildroot.net/results/e50a7511e3e9fd9915ef81e46c7e7b55834c5128 |     
  powerpc    |       fontconfig-2.14.2        | NOK | http://autobuild.buildroot.net/results/d0f5bf89ad315c2fd040d461fcd428e53bf4af25 | ORPH
 microblaze  |          foot-1.16.2           | NOK | http://autobuild.buildroot.net/results/4d14dec2496e304f37e4fc9ff11a8aa74a1e37bf |     
   nios2     |          foot-1.16.2           | NOK | http://autobuild.buildroot.net/results/1e7aa893d9aa3339fe4c5436b08735fe69799ab0 |     
   nios2     |          foot-1.16.2           | NOK | http://autobuild.buildroot.net/results/7a52ca54af58c602760501615a5494c46974fd3c |     
   arceb     |           frr-8.5.4            | NOK | http://autobuild.buildroot.net/results/d28f922744f42c4a55bf4eb6b3fde3c9dbdcf5fc |     
   nios2     |          gamin-0.1.10          | NOK | http://autobuild.buildroot.net/results/b021c3402ff8bf2cef252805fb67b5b77158b6c7 | ORPH
   nios2     |           gdal-3.8.2           | NOK | http://autobuild.buildroot.net/results/efbfe40a3a2b4c7935921523dcf7a1e00d1ace6a |     
   x86_64    |            gdb-14.2            | NOK | http://autobuild.buildroot.net/results/3472592402b77e287353c502732e794a751eb548 | ORPH
microblazeel |       gdk-pixbuf-2.42.10       | NOK | http://autobuild.buildroot.net/results/9df64762c57d2b6c6c851da1837b967c6c8feebc | ORPH
    i686     |         gerbera-1.12.1         | NOK | http://autobuild.buildroot.net/results/b825f107a040dabd8b76e67b9d5ad8080aadfab3 |     
   mipsel    |         gerbera-1.12.1         | NOK | http://autobuild.buildroot.net/results/75b39b262cdb7cdc397ee6d0e09e78f09419ea94 |     
  powerpc    |         gerbera-1.12.1         | NOK | http://autobuild.buildroot.net/results/46f513ec78b735ff38f4f1f34bf6e0ecd0f252df |     
 aarch64_be  |         gerbera-1.12.1         | NOK | http://autobuild.buildroot.net/results/43c50530193bc2ba5146f893f9f8909d54e54b59 |     
    m68k     |         gerbera-1.12.1         | NOK | http://autobuild.buildroot.net/results/57a1524c528a6b2b5d7cb3e76aa3355aebd179ac |     
powerpc64le  | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/92f5970dc15e880afbfbdf30c63e9b1d3941fc83 |     
 powerpc64   | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/0775ea9092e3848b552ad496760044a3922645b8 |     
 powerpc64   | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/05f1ccdda828f0bdac6368a734a8eb39763b6244 |     
 powerpc64   | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/36f64cf8a94bda6d4884d825180be6a805925a2a |     
 powerpc64   | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/429944d900b170f8a4eb637b91cb44bf92b59344 |     
 powerpc64   | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/b407300ceaa511118946dc455704d878a3576abc |     
 powerpc64   | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/dae3f65295e9df7c9ccdb354e8d0f5afe1faa720 |     
    i686     | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/69790a0be811f2bc46ca8825e2e3c261ffb015fe |     
powerpc64le  | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/201b1f236565d7d660195198ef8945f411b6deb3 |     
   armeb     |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/048dd033e02129919482a3d955174dc93fd16821 |     
   armeb     |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/c165c92ab21679971dd0d9b4b256bbe32ea11473 |     
    arm      |         gnuplot-6.0.1          | NOK | http://autobuild.buildroot.net/results/23e2de648204c7e0d1ee4c9189022d604e2156ba |     
   nios2     |         gnuplot-6.0.1          | NOK | http://autobuild.buildroot.net/results/2ce975b81cf0f4bf324e5cfcf6f1e9d53de0db15 |     
microblazeel |         gnuplot-6.0.1          | NOK | http://autobuild.buildroot.net/results/bc70d73b533c8a5058d12d30238e10a2bc4a9da9 |     
  riscv64    |       gnuradio-3.10.7.0        | NOK | http://autobuild.buildroot.net/results/a0a74969177869ee1cd19b3d5923cea5ed959f76 |     
    mips     |       gnuradio-3.10.7.0        | NOK | http://autobuild.buildroot.net/results/b1f0304da439114141e43accaf1e9926e54e797a |     
powerpc64le  |       gnuradio-3.10.7.0        | NOK | http://autobuild.buildroot.net/results/2c20e707a47e3865ace839cb5aa24d66b4a81f0d |     
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/20c66039917a43b703a9ff7125ffd765a3cc0510 | ORPH
   x86_64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/936c08a29d98c29ae9066e468bcf68a0e1c111bf | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/f7c9d728052e2556d2e9738512232133868df225 | ORPH
    i686     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/8895b0ec5acade1e2b22b8d8869c9c388606eddd | ORPH
    m68k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/4d72cf2aad77a42af197fae21498e2c55bf9e697 | ORPH
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/560dc382b0f9869d33666e1054a6b1d7de996503 | ORPH
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/cae80a9eefdff2b3643ba7bedf1857d32732aa7d | ORPH
    i686     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/df8792dc68b1db0784250c87fa9983909b337adb | ORPH
    m68k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/3fdaa092d82a7c7968f3c3101ffdc3c70fc0eb68 | ORPH
   x86_64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/58b26e536cfcac2e60615489363796b9066dc021 | ORPH
   mipsel    | google-breakpad-f49c2f1a202... | NOK | http://autobuild.buildroot.net/results/fde23bfd5c4e72297c7a52271178b26b013dcc28 |     
   sh4aeb    |        graphene-1.10.8         | NOK | http://autobuild.buildroot.net/results/6129a9c8c6fcc5c26c41e3a77dace76bc654c8b1 |     
  riscv32    |        graphene-1.10.8         | NOK | http://autobuild.buildroot.net/results/587a516a349ad0fcb2ca079947b2ebacb551c44d |     
microblazeel |       gtkiostream-v1.8.0       | NOK | http://autobuild.buildroot.net/results/2b91d73b8d60e73647dd0116d0d9b4201c1eb0e4 |     
    mips     |       gtkiostream-v1.8.0       | NOK | http://autobuild.buildroot.net/results/e797de981464aac1d0e1c36a7d571f789ef67343 |     
    arc      |         hddtemp-0.4.3          | NOK | http://autobuild.buildroot.net/results/7c545d74e61a32deb32b4b8e95d9623c7928f8e0 |     
   armeb     |       host-binutils-2.42       | NOK | http://autobuild.buildroot.net/results/d146ae921fc21412253f40bc23c73aa097d53f13 |     
powerpc64le  |       host-binutils-2.42       | NOK | http://autobuild.buildroot.net/results/e80f48ab088335d13096dce5124442fcfd5373b3 |     
    or1k     | host-binutils-bare-metal-2.42  | NOK | http://autobuild.buildroot.net/results/448821c50660db76141f73ca8c4e28156968c189 |     
   mipsel    | host-binutils-bare-metal-2.42  | NOK | http://autobuild.buildroot.net/results/c9e643e329e5f67bfa50869ebf98e8cfd797d107 |     
  mips64el   |       host-delve-1.22.1        | NOK | http://autobuild.buildroot.net/results/d9c4da8179ac72b40c937c00c7df1f08c8c31ae7 |     
  sparc64    |     host-gcc-final-13.3.0      | NOK | http://autobuild.buildroot.net/results/44c3ccf9458d6ef9ba27911342b20752d41b2e89 |     
powerpc64le  |     host-gcc-final-14.1.0      | NOK | http://autobuild.buildroot.net/results/8f585b83166d94772fe581f2efb0691676b33dab |     
  aarch64    |      host-gengetopt-2.23       | NOK | http://autobuild.buildroot.net/results/93bffc10a4a29ed795d6f67280d03a17eb82ccb8 |     
    arm      | host-go-bootstrap-stage1-1.... | NOK | http://autobuild.buildroot.net/results/bc98e5d7559d62859fff65253868ccc34cf2b225 |     
   mipsel    | host-go-bootstrap-stage1-1.... | NOK | http://autobuild.buildroot.net/results/82e79e2030bec4d05fb677cfbc3aeb6788f81454 |     
    or1k     | host-go-bootstrap-stage1-1.... | NOK | http://autobuild.buildroot.net/results/9190aaa50758d9febeb50ddd960f5a00b861f2e1 |     
    or1k     | host-go-bootstrap-stage1-1.... | NOK | http://autobuild.buildroot.net/results/1425df60d0ea55b5814e6a95b02c4797dd3a3419 |     
  aarch64    | host-go-bootstrap-stage2-1.... | NOK | http://autobuild.buildroot.net/results/c9ed1a9da00bc52e52eceebbad3e010ab57a45c4 |     
  aarch64    | host-go-bootstrap-stage3-1.... | NOK | http://autobuild.buildroot.net/results/713ca3e3c59b7d8208bd9eb46566466f9600bd63 |     
   s390x     | host-go-bootstrap-stage3-1.... | NOK | http://autobuild.buildroot.net/results/1e7779fe245afbb3e1a3943062b2d5938b66f8d3 |     
   x86_64    |          host-go-src           | NOK | http://autobuild.buildroot.net/results/39c09884f4c6f6d53903753427fbbcd3010d0e63 |     
  mips64el   | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/af40dd2f5f23029940b81029461c6b30f0951ae1 | ORPH
  powerpc    | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/0e24a1d06b2ff6ab5444f1ee8e5e4cb25296a74f | ORPH
  mips64el   |      host-librsvg-2.50.9       | NOK | http://autobuild.buildroot.net/results/bae34880c8edec89bccb3809fa1bd4abc81b5384 |     
   mipsel    |      host-librsvg-2.50.9       | NOK | http://autobuild.buildroot.net/results/831ab1e001b31eaa0fb296baec440e6142432686 |     
   nios2     |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.net/results/ff4af1cdf77fe019c26ba4bf3628ec5a9c83d8ee |     
   mips64    |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.net/results/fb4eb3173a10e84d2bc6e23307e1f565e5c17de1 |     
    arm      |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.net/results/da41a022b7d1255f8f330c158f8a9c289044b44f |     
  riscv64    |   host-moby-buildkit-0.11.6    | NOK | http://autobuild.buildroot.net/results/1d87db77b1ed5eabc26a310f7c2fa2c05102f580 |     
  powerpc    |           host-mono            | TIM | http://autobuild.buildroot.net/results/8776a2507c927c2150ee0a2fcc501ff1705d6fc7 |     
microblazeel |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/040f5d49f4727ef2a22f1ca10011539c730dd3fa | ORPH
    m68k     |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/8d562c5f71588b52397255901a5f0795a34e56bb | ORPH
    i686     |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/e33c430932a00282ae0a3e0ac9c78ed37ffd81bb | ORPH
   xtensa    |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/30b2673c2852fcf9a9428205ea9dcffd9d0ca3ca | ORPH
  mips64el   |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/5280a2f3b223527b51ecab9c0aec7990b8e9ad79 | ORPH
   xtensa    |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/d1a14452d623ee1e28a57c3cb385c39b653a30cb | ORPH
   arceb     |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/8f0c8387e217da6386322f84b521145c9e955d11 | ORPH
    m68k     |      host-python3-3.12.4       | NOK | http://autobuild.buildroot.net/results/5d63651311372cbee53bbfecd7096cc861b16577 |     
  riscv64    |        host-runc-1.1.12        | NOK | http://autobuild.buildroot.net/results/3b1b8a3e3605c6631a3808807bd06a5155c66d80 |     
   x86_64    |        host-rust-1.79.0        | NOK | http://autobuild.buildroot.net/results/d21df1bc8c0bc24020ac6b16e0a9de7749a26ddd |     
  sparc64    |        host-rust-1.79.0        | NOK | http://autobuild.buildroot.net/results/cb3eb8103553466982a2049a4c5e4b2b69b4d898 |     
   armeb     |        host-rust-1.79.0        | NOK | http://autobuild.buildroot.net/results/ee5c55c92ecbe1fc4ee1aac61b05adff77bd5cb7 |     
 aarch64_be  | host-softether-4.30-9700-beta  | NOK | http://autobuild.buildroot.net/results/9d48bf2653740af4c5368c69754d3786ae92d4d1 | ORPH
  sparc64    | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/afc0bdd4ab63722149d49057a576c8bbdd409ff2 |     
 powerpc64   | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/87d8640c3e0b1ef761d22c3795f83c577b45e614 |     
   mips64    | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/f0664c401d5d66d7ce9b63a14c84bab023f1957d |     
    sh4a     | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/403f330ceb9a66e65176c7924d3a5180e7db1fcb |     
 aarch64_be  |          httping-2.5           | NOK | http://autobuild.buildroot.net/results/e6ee6910d1b29e2012503ea427aa8da4c971f518 |     
    mips     |          httping-2.5           | NOK | http://autobuild.buildroot.net/results/acdbb55d4825f2b9d9a5897e603908b6985d38cf |     
   mips64    |          httping-2.5           | NOK | http://autobuild.buildroot.net/results/dcee0992349b02e8abf90ab3ce93bf970850b525 |     
   mips64    |          httping-2.5           | NOK | http://autobuild.buildroot.net/results/15fcda4a4c19c0098391ef8a1af98eb75314267a |     
  mips64el   |          httping-2.5           | NOK | http://autobuild.buildroot.net/results/2addb9679b6c275c3631369555678dd515480b7d |     
   mipsel    |          httping-2.5           | NOK | http://autobuild.buildroot.net/results/d608bbd16a2d5d4a995ca4f2eeaa93148da08e0f |     
  sparc64    |          httping-2.5           | NOK | http://autobuild.buildroot.net/results/edf630574a0caf7660f74a16d78fa59550ed07d9 |     
   nios2     |          httping-2.5           | NOK | http://autobuild.buildroot.net/results/22578675e12a8d1be7d4a812cf3e8dd38b849618 |     
  aarch64    |          httping-2.5           | NOK | http://autobuild.buildroot.net/results/0a5aadd841ab29cbb065196888691140ac592fec |     
  aarch64    |          httping-2.5           | NOK | http://autobuild.buildroot.net/results/11fd9c35f6a9dcd77b88364795a63c1296dba182 |     
    m68k     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/d1401be3fa8ed4c7210f28ca1707153e1d561bde |     
  sparc64    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/4cd39790f0c9d7ffc37c46f152281bc5751c0565 |     
   nios2     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/a17470d2a2ebfddfe16269f9efe472611c700664 |     
   arceb     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/1c574001f1263aed9ca0cf883b697a11690eed26 |     
   armeb     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/950fd3e10dfd341f49aa0a9355ab54b114cc8d63 |     
   nios2     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/aee95eaacb64f779a01b6e584ec73a456d4e16f1 |     
  riscv64    |         jemalloc-5.3.0         | NOK | http://autobuild.buildroot.net/results/e3a1adfefc9d9151b43125487de8b13ecf75a3ad |     
   s390x     |          kexec-2.0.28          | NOK | http://autobuild.buildroot.net/results/ad833fbaf712b533c5458a7146e14c058ea8f794 |     
   mips64    |            kmod-31             | NOK | http://autobuild.buildroot.net/results/be40547b096653672398ba3a7abb5d9a99d0074f |     
    arm      |      libatomic_ops-7.8.2       | NOK | http://autobuild.buildroot.net/results/5e46107c0ce6b84a30f2b7496b2e09d209889680 | ORPH
    arc      |         libcli-1.10.7          | NOK | http://autobuild.buildroot.net/results/c4beafed44a0cbe7fc4b903fa955e74eb0e1fdcb |     
   x86_64    |         libcurl-8.8.0          | NOK | http://autobuild.buildroot.net/results/907ea077c47ea18e0d2c377997835ca5d4e48a4b |     
   armeb     |          libdex-0.6.1          | NOK | http://autobuild.buildroot.net/results/1e9fa56a041f25661dbc457fa9d8015f74e41be6 |     
    mips     |          libdex-0.6.1          | NOK | http://autobuild.buildroot.net/results/12156ac6578d03f533c01fe05abe5697763ca445 |     
    mips     |          libdex-0.6.1          | NOK | http://autobuild.buildroot.net/results/09d2b38285b23307ba2db23ff3ccc5501b71c50f |     
    arc      |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/8feb9fd09bd44778c19190a30193cb3fe6af59d7 |     
   arceb     |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/ef5712820f997f90ea45ef7b69825adfc9352727 |     
   arceb     |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/f9b7f244cd82009b52aea5e4e41db70c1dd45f93 |     
    arc      |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/efdb171af09d9bb346b9081d7f8cea615109402d |     
    arc      |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/0e489c61e1ea190cd2e78434b6025a3e2332b33d |     
    arc      |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/401aa90d105fe42b840ff113ebe49105be5fd151 |     
    arc      |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/1197cafd50cb3ac9609655dd45c93e573ccdd942 |     
   arceb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/f6ef66a1a0c7802649cbe4e8f88934d8adb27767 |     
    arc      |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/416a24d5144a2a4c2630cb021f2c79f276019a05 |     
   arceb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/8ef021ad613f063ef57265eb701ac3e5615dd47a |     
   sparc     |     liblog4c-localtime-1.0     | NOK | http://autobuild.buildroot.net/results/8fc52681c9a13bb47a620cd435663226800684ff |     
 microblaze  |         libp11-0.4.12          | NOK | http://autobuild.buildroot.net/results/93f52dc6b68aefb6ca9e2b003928f9cc293ee14b | ORPH
   mips64    |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/1af515a1e8b574657f59704f4ff0a67cca0be20d | ORPH
   mips64    |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/b1017906360cf797da7dc114a6fb1146cc52f3f3 | ORPH
powerpc64le  |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/be66ab52bd36e1d068ed4accfaf63519d538e207 | ORPH
  aarch64    |         librsvg-2.50.9         | NOK | http://autobuild.buildroot.net/results/9ad4b7028c7dff59f7953a3e9e17093d6d7edaf3 |     
  riscv64    |          libsepol-3.6          | NOK | http://autobuild.buildroot.net/results/1de6d044d6d3fe1f8472f705acdaa72a3ea7582a |     
   xtensa    |          libsepol-3.6          | NOK | http://autobuild.buildroot.net/results/b2cb3204b114ebd5ddf10318818f102aa5e1d88f |     
   mipsel    |        libunwind-1.8.1         | NOK | http://autobuild.buildroot.net/results/27fe85fdcdd7974624ae426c9b0c02ed8bb8684c | ORPH
   mips64    |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/b4fe6c8c11eeee9eba26f5459a6234d5fd28aafb | ORPH
 powerpc64   |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/daf042e806a54efc9282febcc34f1ee9482e542b | ORPH
   nios2     |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/26287069a35e5e51aac5c6457a407e8363b3f5fe | ORPH
    i686     |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/b15ee539ba3363c93b6c86bb18f7084215410e17 | ORPH
   x86_64    |          linux-6.9.8           | NOK | http://autobuild.buildroot.net/results/209256e32d8fd7e99883562f8fb59a34164f7ccc | ORPH
    arc      |          linux-6.9.8           | NOK | http://autobuild.buildroot.net/results/ce06578ab187a9249dc326f8385f55939fc6a0ca | ORPH
   x86_64    |          linux-6.9.8           | NOK | http://autobuild.buildroot.net/results/c808c82ae6f28d433ba17854afbdb87819727972 | ORPH
   mipsel    |          linux-6.9.8           | NOK | http://autobuild.buildroot.net/results/81b525234883a4b9c50dea751dfef45d51dc6c1a | ORPH
   armeb     |          linux-6.9.8           | NOK | http://autobuild.buildroot.net/results/47110e57999c6e3f04abb5544eb2567bea6dd584 | ORPH
   x86_64    |      lksctp-tools-1.0.19       | NOK | http://autobuild.buildroot.net/results/1d62487e518f5ff73954ab233b073f0741f0a828 | ORPH
    arm      |          llvm-15.0.3           | NOK | http://autobuild.buildroot.net/results/19b290c0ee87f3638a8fef388b27a1376c829951 |     
 powerpc64   |         logsurfer-1.8          | NOK | http://autobuild.buildroot.net/results/d4f1bf9d4e655f49e5dc908b32f8bfa1d305fcad |     
   s390x     |        mariadb-10.11.6         | NOK | http://autobuild.buildroot.net/results/d2dc4134080daf0947125b70eed0f2003bd0e9c5 | ORPH
  riscv32    |        mariadb-10.11.6         | NOK | http://autobuild.buildroot.net/results/fd2da303fc0117996e12da4b78a0376c4a7e1adb | ORPH
 aarch64_be  |        mariadb-10.11.6         | NOK | http://autobuild.buildroot.net/results/aeeab2f742a1435ba2b939202c31cdc5e52c1324 | ORPH
powerpc64le  |      mediastreamer-4.4.8       | NOK | http://autobuild.buildroot.net/results/0e3bb05f8eef67ce97b148b70542ef887391db9b | ORPH
    i686     |         memtest86-6.20         | NOK | http://autobuild.buildroot.net/results/f56201a068f35e4903271dd9eaf3627c7068c80c |     
  aarch64    |          mender-3.4.0          | NOK | http://autobuild.buildroot.net/results/51aa8978d1b621a1a7b2872f64657828d3d0fc4f |     
    i686     |          mender-3.4.0          | NOK | http://autobuild.buildroot.net/results/f4a514e3a1e0cd1ef887e75d1beb13d148b8b94e |     
   sparc     |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/342bd5c77af8a52928d09bbc41b59b0e2e118990 |     
 aarch64_be  |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/5a4af678b4aee956e857536d5eb8f29b53191c0d |     
   xtensa    |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/368dc09f7f3ce4e98300fc9432ee30e27f3f5b28 |     
    arc      |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/a67f71ff15f4b60709a96642310c9615a62e93fd |     
   mipsel    |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/f7c9d5f966348bc3309356baf0dd4dc2d7b30acb |     
   x86_64    |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/7582487791e945a23a51d7e700cb8ff2e958950b |     
  mips64el   |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/c31b36a77977f37fbc08b619851c242ba6a9d5c3 |     
 powerpc64   |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/152fdf7a5240efcb02960b9572da6453fbdce8a9 |     
 powerpc64   |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/f18b8079dcb0bc1a2953e75644fc144a9a08642d |     
    arc      |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/5f2fd0149c0f7b9ac15c18221d2a4ebdef7fccf6 |     
  riscv32    |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/e21426322782084a4d63fbaafe3969809b535a1e |     
   sparc     |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/081570f7429225ac014bb95f28fe1e433c5eb738 |     
   arceb     |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/1d7e2b2c0736f8ce58eda9e8c9511fdf5e7e01ce |     
   sh4eb     |           mtd-2.2.0            | NOK | http://autobuild.buildroot.net/results/fb14996ab34f36afcf5a85eee995961d18f1627e |     
  mips64el   |           mtd-2.2.0            | NOK | http://autobuild.buildroot.net/results/893310f2b938adbce0c9346a6429be8c86418e6e |     
    arc      |           mtd-2.2.0            | NOK | http://autobuild.buildroot.net/results/f2ce4f99075946d0f7ac76eadcd4be09bc81e6e6 |     
  riscv64    |           mtd-2.2.0            | NOK | http://autobuild.buildroot.net/results/0bec055fcd2333d4b06ccaae2a2cb808db296c0b |     
   sparc     |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/4b9643ea51565d2affeb6753670d41e45fc51e50 | ORPH
  aarch64    |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/0bdb580a8c72a4ebe94669e460396e261184cf65 | ORPH
powerpc64le  |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/c18dbfbf5dd958fef833691aa4250d28d467e969 | ORPH
microblazeel |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/4a5ba0547bc0feb9c21efd6894ce9d28bf243d7c | ORPH
   arceb     |          ntp-4.2.8p18          | NOK | http://autobuild.buildroot.net/results/6b8bccd67ebe5ebed70d87dfb5fca1dff9ad25ea |     
   sparc     |          ntp-4.2.8p18          | NOK | http://autobuild.buildroot.net/results/94ae5364e30acfe6b3a942f55f89ae7e23be0654 |     
microblazeel |         openal-1.22.0          | NOK | http://autobuild.buildroot.net/results/cd4b9ede4206620b731a7af75c28c894862d6c3f | ORPH
   mips64    |        openblas-0.3.27         | NOK | http://autobuild.buildroot.net/results/918779923ebafbd72edeb3e62cb8ffef8cb97b61 |     
    mips     |         openssh-9.8p1          | NOK | http://autobuild.buildroot.net/results/6ddf897f943990091541bea3de79b31bf7e3ca01 | ORPH
  powerpc    |         openssh-9.8p1          | NOK | http://autobuild.buildroot.net/results/5931fb4cfc46b1c74351aa6519bf7d7127442213 | ORPH
   nios2     |         openswan-3.0.0         | NOK | http://autobuild.buildroot.net/results/df7cce809e3e4aa92e700a3fc5105c6c20f21f6b | ORPH
    mips     |        pulseaudio-17.0         | NOK | http://autobuild.buildroot.net/results/9f6bb88dc9826668e66ae3751b5c9c65b0b10cad | ORPH
  mips64el   |         python3-3.12.4         | NOK | http://autobuild.buildroot.net/results/bfa68a33678ecc2379636c0b1fe8551caf9a38f2 |     
   arceb     |       rabbitmq-c-0.13.0        | NOK | http://autobuild.buildroot.net/results/3d55e58c9cbe1472b3335cbee5ba718a7c24e5f3 |     
   s390x     |       rabbitmq-c-0.13.0        | NOK | http://autobuild.buildroot.net/results/8a5d8a3504c8d81f07f8bd9faec76434c7c5f1ab |     
 powerpc64   |       rabbitmq-c-0.13.0        | NOK | http://autobuild.buildroot.net/results/2b97dc377c4111afbd3de183afb1a2c32af57449 |     
 aarch64_be  |           rtty-8.1.0           | NOK | http://autobuild.buildroot.net/results/5f25a0e93ad70e57450516ff4925df202c15a752 |     
    or1k     |        skalibs-2.14.2.0        | NOK | http://autobuild.buildroot.net/results/a662794f1220c7296a3ff96d38fc7c94587f34ed |     
  mips64el   | tftpd-e52af4207a6e09a1ba21f... | NOK | http://autobuild.buildroot.net/results/aa25b6acd269b0039f304fe63d5780982b0590d9 | ORPH
   x86_64    | tftpd-e52af4207a6e09a1ba21f... | NOK | http://autobuild.buildroot.net/results/ed787fa34bd4f4a93ccd2e11f91668b390457cca | ORPH
 aarch64_be  | tftpd-e52af4207a6e09a1ba21f... | NOK | http://autobuild.buildroot.net/results/b1f5d94e591220d8d98d461c2d133da126f67f64 | ORPH
  aarch64    |          thttpd-2.29           | NOK | http://autobuild.buildroot.net/results/0113e70487ef43d6f9dff86a9ca06115d65f5e25 | ORPH
 powerpc64   |        tipidee-0.0.5.0         | NOK | http://autobuild.buildroot.net/results/837748f1b7bdd53e49a7edcf1d19b1341ad4dff9 |     
   s390x     |        tipidee-0.0.5.0         | NOK | http://autobuild.buildroot.net/results/70d3198d7946d08ee0db6344ff032e410e972b84 |     
   mipsel    |        tipidee-0.0.5.0         | NOK | http://autobuild.buildroot.net/results/7e95530a49239bdee79326c21fab4436073d39c5 |     
  powerpc    |        tipidee-0.0.5.0         | NOK | http://autobuild.buildroot.net/results/919413c5ca5144572b20c9fee7e46f245041a0f9 |     
    or1k     |        tipidee-0.0.5.0         | NOK | http://autobuild.buildroot.net/results/461eeac4c8163dfbcbb94f1998af80b157843136 |     
microblazeel |        tipidee-0.0.5.0         | NOK | http://autobuild.buildroot.net/results/3cb4eeb3911e162d02c5d01dc9213d90626c9c5d |     
   xtensa    |        tipidee-0.0.5.0         | NOK | http://autobuild.buildroot.net/results/0e5c5824201d674e65c088257553ee5be7293b22 |     
    sh4      |         uclibc-1.0.49          | NOK | http://autobuild.buildroot.net/results/dfa46b243aa6e289333cbd98e3162d62ee6fa865 |     
  aarch64    | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/1bbf9783a91165d984ccefe4e776302959e467ae |     
microblazeel |         unbound-1.19.1         | NOK | http://autobuild.buildroot.net/results/d8293b781204f01b5e34ff5eefb9632e4542e940 |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/eba782b31f8cc02b32be6c2a2d72741d0f13599e |     
  riscv64    |       util-linux-2.39.3        | NOK | http://autobuild.buildroot.net/results/7d9407e23bda26d853eeb00d0bb1d8d76f7c8921 | ORPH
    or1k     |      v4l2loopback-0.12.7       | NOK | http://autobuild.buildroot.net/results/261f46e5badf4564a04acb5ed982336dded1d95b |     
   armeb     |            xz-5.6.2            | NOK | http://autobuild.buildroot.net/results/d2c3c44893f405a0573ca5b6e323ed2e9b98b2a2 | ORPH
   sparc     |            xz-5.6.2            | NOK | http://autobuild.buildroot.net/results/a0a87765af25d43922db023a9d3c8013b9424de8 | ORPH
  sparc64    |          zabbix-6.2.7          | NOK | http://autobuild.buildroot.net/results/90b2b11dded01a0d5a821340d9074c9816cc982c |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

                 host-tar-1.34 | 3 
                 coreutils-9.3 | 1 
                    fcft-3.1.6 | 1 
                   foot-1.16.2 | 1 
                  gensio-2.5.5 | 1 
               libglib2-2.76.1 | 1 
                  linux-6.6.37 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/9a7716a7049513400f8ee1e73241c04b8667bdbd | ORPH
  aarch64    |           fcft-3.1.6           | NOK | http://autobuild.buildroot.net/results/fb7b8725e72358bbd258defe1d0d92e6cdb97f86 |     
microblazeel |          foot-1.16.2           | NOK | http://autobuild.buildroot.net/results/841931800884fc02496fb4172cce33243c4f97d8 |     
  sparc64    |          gensio-2.5.5          | NOK | http://autobuild.buildroot.net/results/a3fe480908df07309113cda8c7090a8f28c7dd5c |     
    arc      |         host-tar-1.34          | NOK | http://autobuild.buildroot.net/results/a5d6890f60526f85ae8e9dad5fdf8c6c5b73d870 | ORPH
   x86_64    |         host-tar-1.34          | NOK | http://autobuild.buildroot.net/results/63100171c040f16d527dfac48fb84e4b51188116 | ORPH
  mips64el   |         host-tar-1.34          | NOK | http://autobuild.buildroot.net/results/a226a437d37f977e28d8d2a772a43e6b2d54cd08 | ORPH
    arc      |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/239c526b1065923e3d8456a3c93e43637e9c7ad6 |     
    sh4a     |          linux-6.6.37          | NOK | http://autobuild.buildroot.net/results/f066944cc004833883a9eec9ce254c3335292477 | ORPH


Classification of failures by reason for 2024.05.x
--------------------------------------------------

                gnu-efi-3.0.18 | 1 
 host-binutils-bare-metal-2.42 | 1 
toolchain-external-bootlin-... | 1 
     toolchain-external-custom | 1 


Detail of failures for 2024.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 aarch64_be  |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/56fb0b1ff3fdc0f72209e41ef6b730cd7dcee772 |     
    arc      | host-binutils-bare-metal-2.42  | NOK | http://autobuild.buildroot.net/results/8843d0dbb8418860f6e81555cb7ff87ae93004e8 |     
   xtensa    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/807f12d2838c677079098247d46a238b2b9206ed | ORPH
  mips64el   |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/9091d4063eb28fd7657ecefbe5ea9ce624e6dccb |     


Gitlab CI results for 2024-07-18
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
                 arcturus_ucp1020 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7367627971  |      
                  at91sam9260eknf | https://gitlab.com/buildroot.org/buildroot/-/jobs/7367628004  |      
                   at91sam9g20dfc | https://gitlab.com/buildroot.org/buildroot/-/jobs/7367628006  |      
                 at91sam9g45m10ek | https://gitlab.com/buildroot.org/buildroot/-/jobs/7367628007  |      
                     at91sam9rlek | https://gitlab.com/buildroot.org/buildroot/-/jobs/7367628011  |      
                 atmel_sama5d3xek | https://gitlab.com/buildroot.org/buildroot/-/jobs/7367628031  |      
                        bananapro | https://gitlab.com/buildroot.org/buildroot/-/jobs/7367628043  | ORPH 
                   beagleboneai64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7367628046  |      
                       beagleplay | https://gitlab.com/buildroot.org/buildroot/-/jobs/7367628048  |      
                      beelink_gs1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7367628050  |      
                  chromebook_snow | https://gitlab.com/buildroot.org/buildroot/-/jobs/7367628056  |      
                             ci20 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7367628058  |      
                      cubieboard2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7367628061  |      
            engicam_imx6qdl_icore | https://gitlab.com/buildroot.org/buildroot/-/jobs/7367628062  |      
        engicam_imx6qdl_icore_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7367628063  |      
        engicam_imx6qdl_icore_rqs | https://gitlab.com/buildroot.org/buildroot/-/jobs/7367628064  |      
              engicam_imx6ul_geam | https://gitlab.com/buildroot.org/buildroot/-/jobs/7367628065  |      
             engicam_imx6ul_isiot | https://gitlab.com/buildroot.org/buildroot/-/jobs/7367628066  |      
        freescale_imx6dlsabreauto | https://gitlab.com/buildroot.org/buildroot/-/jobs/7367628070  |      
          freescale_imx6dlsabresd | https://gitlab.com/buildroot.org/buildroot/-/jobs/7367628071  |      
         freescale_imx6qsabreauto | https://gitlab.com/buildroot.org/buildroot/-/jobs/7367628073  |      
           freescale_imx6qsabresd | https://gitlab.com/buildroot.org/buildroot/-/jobs/7367628075  |      
          freescale_imx6sxsabresd | https://gitlab.com/buildroot.org/buildroot/-/jobs/7367628077  |      
           freescale_imx7dsabresd | https://gitlab.com/buildroot.org/buildroot/-/jobs/7367628080  |      
             freescale_imx8dxlevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/7367628083  |      
              freescale_imx8mmevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/7367628085  |      
              freescale_imx8mnevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/7367628087  |      
              freescale_imx8mpevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/7367628089  |      
              freescale_imx8mqevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/7367628091  |      
              freescale_imx8qmmek | https://gitlab.com/buildroot.org/buildroot/-/jobs/7367628094  |      
             freescale_imx8qxpmek | https://gitlab.com/buildroot.org/buildroot/-/jobs/7367628097  |      
           friendlyarm_nanopi_r2s | https://gitlab.com/buildroot.org/buildroot/-/jobs/7367628109  |      
                   imx6-sabreauto | https://gitlab.com/buildroot.org/buildroot/-/jobs/7367628121  |      
                        imx6slevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/7367628125  |      
                       imx6sx-sdb | https://gitlab.com/buildroot.org/buildroot/-/jobs/7367628126  |      
                        imx6ulevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/7367628127  |      
                       imx6ulpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/7367628130  |      
                        imx7dpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/7367628134  |      
                        imx8mqevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/7367628140  |      
               kontron_pitx_imx8m | https://gitlab.com/buildroot.org/buildroot/-/jobs/7367628144  |      
                       ls1028ardb | https://gitlab.com/buildroot.org/buildroot/-/jobs/7367628150  |      
                     ls1046a-frwy | https://gitlab.com/buildroot.org/buildroot/-/jobs/7367628152  |      
                mender_x86_64_efi | https://gitlab.com/buildroot.org/buildroot/-/jobs/7367628154  | ORPH 
                          mx25pdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/7367628172  |      
                   mx6sx_udoo_neo | https://gitlab.com/buildroot.org/buildroot/-/jobs/7367628180  |      
                          mx6udoo | https://gitlab.com/buildroot.org/buildroot/-/jobs/7367628183  |      
              octavo_osd32mp1_brk | https://gitlab.com/buildroot.org/buildroot/-/jobs/7367628213  |      
              octavo_osd32mp1_red | https://gitlab.com/buildroot.org/buildroot/-/jobs/7367628225  |      
                        odroidxu4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7367628231  |      
                   orangepi_lite2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7367628261  |      
                orangepi_one_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/7367628266  |      
                       pandaboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/7367628279  |      
                           pine64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7367628284  |      
                    pine64_sopine | https://gitlab.com/buildroot.org/buildroot/-/jobs/7367628289  |      
                qemu_aarch64_sbsa | https://gitlab.com/buildroot.org/buildroot/-/jobs/7367628292  |      
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/7367628351  | ORPH 
                        riotboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/7367628363  |      
                           rock5b | https://gitlab.com/buildroot.org/buildroot/-/jobs/7367628366  |      
                           rock64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7367628369  |      
                       rock_pi_n8 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7367628371  |      
             sipeed_licheepi_zero | https://gitlab.com/buildroot.org/buildroot/-/jobs/7367628385  |      
                 sipeed_maix_dock | https://gitlab.com/buildroot.org/buildroot/-/jobs/7367628394  |      
               snps_arc700_axs101 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7367628408  |      
                 snps_arc700_nsim | https://gitlab.com/buildroot.org/buildroot/-/jobs/7367628410  | ORPH 
                snps_archs38_hsdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/7367628417  |      
                socrates_cyclone5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7367628418  |      
                solidrun_clearfog | https://gitlab.com/buildroot.org/buildroot/-/jobs/7367628419  |      
                     ti_am62ax_sk | https://gitlab.com/buildroot.org/buildroot/-/jobs/7367628434  |      
                      ti_am62x_sk | https://gitlab.com/buildroot.org/buildroot/-/jobs/7367628435  |      
                      ti_am64x_sk | https://gitlab.com/buildroot.org/buildroot/-/jobs/7367628436  |      
              toradex_apalis_imx6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7367628437  |      
                           ts4900 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7367628438  | ORPH 
                           ts7680 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7367628442  |      



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
