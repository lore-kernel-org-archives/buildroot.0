Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 977FDC3DA60
	for <buildroot@archiver.kernel.org>; Thu, 18 Jul 2024 05:14:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F33F0401B3;
	Thu, 18 Jul 2024 05:14:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 60KYobXnIcUN; Thu, 18 Jul 2024 05:14:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C626A401BE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C626A401BE;
	Thu, 18 Jul 2024 05:14:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2D5481BF375
 for <buildroot@lists.busybox.net>; Thu, 18 Jul 2024 05:14:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0E738401B3
 for <buildroot@lists.busybox.net>; Thu, 18 Jul 2024 05:14:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pZ4H9EILsw9I for <buildroot@lists.busybox.net>;
 Thu, 18 Jul 2024 05:14:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 37B8740183
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 37B8740183
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 37B8740183
 for <buildroot@buildroot.org>; Thu, 18 Jul 2024 05:14:40 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3C98D20005
 for <buildroot@buildroot.org>; Thu, 18 Jul 2024 05:14:38 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Thu, 18 Jul 2024 05:14:38 -0000
X-GND-Sasl: bot@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1721279678; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=0eyBX6R1tMQheSPySz96/eMqSZZE/svkaIot4hhoJSU=;
 b=UVlaOOWfLqR5qhErcx4Lnm8rZkjAYq5qwUH6g+2VIJgZ45LWJJCBFkvAEsdIaYT1W+WHRx
 yl+O+tzRQJw1IrXhkKcj5CMiDTp7pZ6ndVmXqgTL2gBqIf3agpF8jH4KTCKn2VeyWNFDkS
 TF69gRbXkTHVPzLoKXm+HPf8xCvABBNBU3hLz0CZlQ/3PcZ4NogL5Az/Fxo3PRmaJYguI1
 XRbgNkMuFY+/5gAL/ZmmqtKYuWDZOMcuAseZ6BfW7ThB3TYdjuF7iVMTNsNk0ShtD4X3Lp
 /W8fXH4GlqgJ4qiJexLGlZDRiW0RarC4aGHqqQVOCUMQBoWfq43uQEkmJiwPjA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=UVlaOOWf
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2024-07-17
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
Message-ID: <20240718051438.6U4Jm02NvmS7qcyFeBFBywds3yw9ELtJF_ThE0nzOdM@z>

Hello,

Autobuild statistics for 2024-07-17
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  6  | 16  |  0  | 22  |
  2024.05.x  |  5  |  8  |  0  | 13  |
    master   | 101 | 404 |  1  | 506 |

Classification of failures by reason for master
-----------------------------------------------

                  cairo-1.18.0 | 144
                elfutils-0.189 | 13
                   httping-2.5 | 11
ibm-sw-tpm2-5452af422edeff7... | 10
                flashrom-1.3.0 | 9 
                     avahi-0.8 | 8 
aer-inject-9bd5e2c7886fca72... | 7 
edid-decode-6f117a8f8c0e76e... | 7 
host-vboot-utils-bbdd62f9b0... | 7 
                    mpir-3.0.0 | 7 
                  bcusdk-0.0.5 | 6 
                  ffmpeg-6.1.1 | 6 
                host-odb-2.4.0 | 6 
                 libp11-0.4.12 | 5 
                s6-dns-2.3.7.2 | 5 
                 dc3dd-7.2.641 | 4 
             gnuradio-3.10.7.0 | 4 
  gobject-introspection-1.76.1 | 4 
            host-binutils-2.42 | 4 
                   linux-6.9.8 | 4 
                  mender-3.4.0 | 4 
                    norm-1.5.8 | 4 
               tipidee-0.0.5.0 | 4 
android-tools-4.2.2+git2013... | 3 
glibc-2.39-74-g198632a05f6c... | 3 
host-heimdal-f4faaeaba371ff... | 3 
                  libffi-3.4.6 | 3 
                libressl-3.8.4 | 3 
                 openssh-9.8p1 | 3 
                unbound-1.19.1 | 3 
                       unknown | 3 
aubio-152d6819b360c2e7b379e... | 2 
                   bird-2.0.12 | 2 
              cache-calibrator | 2 
                 coreutils-9.3 | 2 
                   cpuload-0.3 | 2 
                   cvs-1.12.13 | 2 
                gerbera-1.12.1 | 2 
                gnu-efi-3.0.18 | 2 
              host-runc-1.1.12 | 2 
                       kmod-31 | 2 
          libcamera-apps-1.2.1 | 2 
               libglib2-2.76.1 | 2 
                   linux-tools | 2 
               mariadb-10.11.6 | 2 
                     mtd-2.2.0 | 2 
         python-remi-2022.7.27 | 2 
                python3-3.12.4 | 2 
                tpm2-tss-3.2.2 | 2 
                    zeek-4.1.1 | 2 
               zxing-cpp-2.1.0 | 2 
                 avro-c-1.11.3 | 1 
                    bat-0.24.0 | 1 
brcm-patchram-plus-95b7b691... | 1 
                    brltty-6.6 | 1 
           crucible-2023.11.02 | 1 
          cryptodev-linux-1.13 | 1 
                  delve-1.22.1 | 1 
                   duma-2.5.21 | 1 
dvb-apps-3d43b280298c39a67d... | 1 
                  fbterm-1.7.0 | 1 
                    fcft-3.1.6 | 1 
                   foot-1.16.2 | 1 
       freeradius-server-3.2.3 | 1 
            gdk-pixbuf-2.42.10 | 1 
                  gensio-2.5.5 | 1 
           ghostscript-10.03.1 | 1 
        gmrender-resurrect-0.1 | 1 
                 gnuplot-6.0.1 | 1 
         gobject-introspection | 1 
 host-binutils-bare-metal-2.42 | 1 
         host-gcc-final-14.1.0 | 1 
          host-libglib2-2.76.1 | 1 
         host-libxcrypt-4.4.36 | 1 
 host-softether-4.30-9700-beta | 1 
           host-systemd-254.13 | 1 
               ipmitool-1_8_19 | 1 
                  kexec-2.0.28 | 1 
kvmtool-4d2c017f41533b0e51e... | 1 
                libcuefile-475 | 1 
                  libdex-0.6.1 | 1 
             libfreefare-0.4.0 | 1 
                libglvnd-1.4.0 | 1 
                    liblo-0.31 | 1 
                  libnss-3.102 | 1 
                  libsepol-3.6 | 1 
                libxml2-2.12.6 | 1 
               lighttpd-1.4.76 | 1 
               linux-pam-1.6.1 | 1 
                 lrzsz-0.12.20 | 1 
ltrace-82c66409c7a93ca6ad2e... | 1 
                    mpv-0.35.1 | 1 
                  ntp-4.2.8p18 | 1 
                nushell-0.85.0 | 1 
                     nut-2.8.2 | 1 
             open62541-v1.3.11 | 1 
               pulseaudio-17.0 | 1 
             rabbitmq-c-0.13.0 | 1 
              sdl2_mixer-2.6.3 | 1 
             sofia-sip-1.13.17 | 1 
             strongswan-5.9.13 | 1 
                  sysprof-46.0 | 1 
tftpd-e52af4207a6e09a1ba21f... | 1 
toolchain-external-bootlin-... | 1 
uclibc-ng-test-132c6134d691... | 1 
ulog-0389d243352255f6182326... | 1 
               valgrind-3.22.0 | 1 
                 wolfssl-5.7.2 | 1 
                      xz-5.6.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/e230762c854dd49992dc9e5ee8c87a53ca874e0d | ORPH
   x86_64    | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/7aacb978856d6551579f181afee34d5b3e4a12f6 | ORPH
  powerpc    | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/9a95966afa873431dcf842aeb879c6b490f6edc4 | ORPH
   arceb     | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/bcce59ee2dbbf6ae94e03341915dea9c2aefd49f | ORPH
microblazeel | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/047ee6ab322be1239e5b44e4ac89bb20d5666d55 | ORPH
  mips64el   | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/34f41c5b2bf0cfb35a9f4a5652343a9c13c7ce8c | ORPH
   armeb     | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/bc551a5e50cc2e77a57ddcb85f3e4689d30fb2f5 | ORPH
 powerpc64   | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/9b0d6029ac03a0518727987a0e89a3488aea2ab0 |     
 powerpc64   | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/c41facfa3960e23cf50a51816fefccfaa692ed1f |     
  mips64el   | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/11f9c387c96499b1162bc8f0ac6d2f6618f8c2ca |     
  powerpc    | aubio-152d6819b360c2e7b379e... | NOK | http://autobuild.buildroot.net/results/f3356f583e7ed577195ba6f2dc77ecb8f15f176d |     
   s390x     | aubio-152d6819b360c2e7b379e... | NOK | http://autobuild.buildroot.net/results/8e517f8aa77b2a614db4f408934f49d13e0642eb |     
    arc      |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/b886965ee41f42cd39dba0af97d7785792d21cdd | ORPH
 aarch64_be  |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/4c60ee52dd47b16739a57103b43b987be9bc8659 | ORPH
  riscv32    |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/416876d9ee56c20849b0a082d146a528d0447377 | ORPH
   armeb     |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/7389e08efd234d261b154ac1ab0aed2b2909df2a | ORPH
  riscv32    |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/fa26f95ef307c41fabaeb596f24aadaaee32a9c8 | ORPH
    i686     |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/d9038488cd5dc28407070b5b0bc2114a9b6e465e | ORPH
   nios2     |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/e689a63d1dc19ffe19ac6248c8917c7dba1ce817 | ORPH
  aarch64    |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/a6d225665f49833aa66dba7bca0042323b1609c5 | ORPH
   mips64    |         avro-c-1.11.3          | NOK | http://autobuild.buildroot.net/results/27ff8ade96d90ee4a1920aec32a9daefa7022404 |     
    i686     |           bat-0.24.0           | NOK | http://autobuild.buildroot.net/results/19ec85f920c95ab6f72013c1eff5954db9bbc888 |     
 aarch64_be  |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/2461e3788fc44ec5d3128f0eff17947dd1f0d7d7 |     
    arc      |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/8649498398ac0a86e762974d527881b6069a7fea |     
  powerpc    |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/61d6d1eb34fa8086fd267ebf78159568991abf1b |     
    i686     |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/f9a2a643d126aca73f6afe8a1abaf01def08cf7b |     
  aarch64    |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/2ab8628a45ec8e480e1a925f99f40dd4df62115b |     
    arm      |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/e6d9eacb7d1d2a65c2e780d855773223b5089caf |     
 aarch64_be  |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/9aa93202774b11d9f5b288e5a2f9fa768650f23e |     
    mips     |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/b00126dd1e4c1165f6dc6a857179cb714c12bfe8 |     
microblazeel | brcm-patchram-plus-95b7b691... | NOK | http://autobuild.buildroot.net/results/a3ec03114df6a0e55c60423841de25d92e8b3d55 |     
 microblaze  |           brltty-6.6           | NOK | http://autobuild.buildroot.net/results/07c62c554a3a1238d4bac85dc6a0353ab019d723 |     
   xtensa    |        cache-calibrator        | NOK | http://autobuild.buildroot.net/results/abe450c85d7af9d32176a42ddfe2152bb2b5d6b3 |     
  mips64el   |        cache-calibrator        | NOK | http://autobuild.buildroot.net/results/03f4039183ab064c2273078e8b0e808d05bc28b4 |     
    arc      |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/367fee9904dfd3cb09a08536bcbab22b131f2b94 |     
   x86_64    |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/71d671664026edae728357f0e32f35861bd21650 |     
    sh4a     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/29a5dff15fd81956dcb1705ded20519a715e6bef |     
   nios2     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/4bd93a58fdab1cedcfff4e37dcf0904a88077115 |     
  riscv64    |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/6842989c0c1f631f2866fdaa93f7ba3dbf7c2f16 |     
  mips64el   |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/e682ceb855060cfa3f3da49180f932ef144a7e10 |     
    mips     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/2c2eae43aa76744f0bf61ed5f220907d9145ba77 |     
   arceb     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/d2177135db4787c7407f165cd36d0623f81eb5f1 |     
   nios2     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/538197aa2264966cb6bdacb1e766639fac6c8715 |     
   arceb     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/c4ffc0c9b2603995b0d05035340b57021fd299e8 |     
 powerpc64   |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/c750b1a6a5477f03e383bebc4c112479b1b44863 |     
   sparc     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/63312a57f916da9cd35e90254d0878960598c8fc |     
  sparc64    |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/6031616e1249b68c60755494ee9bab370c7b01d2 |     
  sparc64    |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/d61866ffec7c92b6e493fb49b0cfd54065b8d821 |     
  aarch64    |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/867bc592752d0d29f18bc6c765e5ceb12055bb4c |     
  aarch64    |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/06d325174fa7c3c686ef0029443be75e59bf911a |     
   arceb     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/a5c3ae6510c90230481dfc85fbbb1d09f44a0659 |     
   mips64    |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/6cf848bc8657830787cde4b8ed1d374115123141 |     
  aarch64    |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/a4e2ecc439f7bce92c3cefbcef35757b9478c8bb |     
   s390x     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/319ad0b0bf7cb1ba2d4fc395b38ec3540a23d440 |     
 aarch64_be  |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/1c6da4db1369b06fac95c58d85c56979961542c1 |     
microblazeel |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/157ce149007235bd3c0a3d450b97ab719163ef15 |     
   s390x     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/5e69e4260aadea6100bfcc76c2bc3f728a5ba2b5 |     
 powerpc64   |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/f497ebed801b4e9d867cbd664c3296ff530dd94c |     
 aarch64_be  |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/4b44668b588499252233b4594cff6d9d201cd4ab |     
microblazeel |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/411e1c595c3a017aa9b94041bdf5b9c7823ea6db |     
   mipsel    |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/4788e4b772f2def730d5dbba20b38482f0c51702 |     
   x86_64    |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/ac0466862b2b927a5d2fd9a8964cfccdf235e4c7 |     
   mips64    |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/67959a0c7c1a62fe452164cb6d9638da519d6ec0 |     
  powerpc    |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/f1e8936ea7c2a71c863705c04d7444b9cf6d89c0 |     
    i686     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/bb77c886e008b4ba48ebb0825ce5d08d8f01422c |     
 powerpc64   |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/870bbe54210935487bc13c349a26a0fc8b6f7ad2 |     
  sparc64    |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/264504a8228c8c7ac24d38e96821394b38fc39e9 |     
 aarch64_be  |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/e71489211698f4c89082582b6d4299466c7c23da |     
    mips     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/7d417d73ee4bac8468b710bc4dca9a6e4218aec0 |     
   sh4eb     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/b0c71dbc6186eb013b10d87caf5c2cd70deb7d1c |     
   x86_64    |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/bbbc1ccb758bfaee1b1d66da222c1ff59aac4872 |     
microblazeel |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/a26ce2b0bd2e1a98466b3ca44be79256597b840e |     
 aarch64_be  |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/9b5902606cbaa09d0dfcacfeb3fe21f3e4798450 |     
   sparc     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/4c636667d9908bd1067e513409308793754b13f5 |     
    arm      |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/9de5093707b0f7589ed253ed496d3b44ca5c4bbc |     
  aarch64    |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/ff5e5226d04a76cfb4993b1005dc39f70a95442f |     
  riscv32    |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/28b4461e095e4455044a4463ebe6a70cc1aa11bd |     
   sparc     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/e4028ba43d9bb4d65a8dce2b499ba39ca36c78a8 |     
microblazeel |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/7708c75da18d3cd3a4832912ff23344640ee1b63 |     
 aarch64_be  |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/64da77906867b1febf39969acf24c35deb959920 |     
 aarch64_be  |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/560c55b8d74de57f76652499317f7423d88a936a |     
  aarch64    |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/4fba4cdc99daa7a3e23d6ebddbd229f98a252be1 |     
 powerpc64   |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/b5fd742f2a7098cae3a4c18f8ccf23f82c4d45b4 |     
   armeb     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/ea6fda3b8500b90e23e3d9a843cdf7fbcba40897 |     
   s390x     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/350c930ab23f4786783552ed56c6d51460f2e8d1 |     
    i586     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/dfaf15a6942d3019313402639f9125289f8f4d39 |     
    arm      |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/14bd095de973dd9ee04bda106ebcd7ea5f5b5f7f |     
   sparc     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/f03c69dc29fe5d96b35880de16011dc808888e81 |     
  aarch64    |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/910974c5df7d3de349713a6a1bda787c26dbc129 |     
   arceb     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/63699c31656698f420394b0a8558bdc297fb1617 |     
 microblaze  |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/4b42a1c8b667ccbb19d6de171c87cd8f5274e249 |     
    sh4a     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/bf2b60f834596aab6a20589912aa734fcd731ee8 |     
powerpc64le  |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/bd54edbece033153bf8b602ba8d748365456571b |     
   sh4aeb    |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/71d476fc3da4f61664e44e102aed871d1e5118e5 |     
    mips     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/c552c768479b40adbd221359b04713b03bee087a |     
  mips64el   |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/8899f600d6391491055adb5bca5916ca867fb01f |     
   s390x     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/87426012f3262cdd93eb92edca8e014ade16bf42 |     
  powerpc    |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/38782912b658502583cda9d7eff3d64a4adfd59f |     
   arceb     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/151cf9e37047209de5a1e7cb7b4790700d50c615 |     
 microblaze  |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/9d78a34b6ec4d500b48313d248270eaa57b98d06 |     
powerpc64le  |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/87efbc01f985b58c873bd93e0c91b42ae2188705 |     
   sparc     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/1f202412413fdea378cb26ea51ca9d0bc969f885 |     
  aarch64    |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/1526c6ecb30e0885bd08367cb5e7ffe3cc026215 |     
    m68k     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/d9d2af9f242e0efb9487089c9d75cb3e0c1e2f47 |     
   mips64    |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/14d278cb7987b2b3b82aab96b3358019866b90e7 |     
 aarch64_be  |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/db1da671fa255511c1f591cb9c21b56d88d0a084 |     
    mips     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/4143e6ed5c15177eeb81c7dd634294740cfa14a3 |     
 powerpc64   |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/53ace2878abfe48ed0c15ed0e63b8c31808135e8 |     
  riscv32    |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/91379ab5d09ca02f657a97e1c7f9459c2636d978 |     
 aarch64_be  |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/ed1ddeabb1d6fc02584bf8ba78d5076431e9b41c |     
   armeb     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/3bc35f0153f18f10242153c79a85c6581edda4b5 |     
   armeb     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/855cae389a26d86144af2bc77ac6fe7d89c96014 |     
   nios2     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/7762c380db3cedb8cd5bb737413421149f607ae2 |     
   mipsel    |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/a6421a247f7a0bfcb4249c1878ed48d5bccded43 |     
    mips     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/bbfef53861c9e0e8b8ce928574246ad640eec547 |     
 powerpc64   |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/16dc99334acc2234462329867028aa667878c44c |     
  mips64el   |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/474f8e71b8615ecfb4f9d5f32ff1b8af53846d1b |     
   mips64    |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/60c5ab621e5f8b8b435c80c2c21ab4ae6bb1a069 |     
   mips64    |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/7242fbdb331f166cad2e325c18f00e75c40eec9a |     
    i686     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/e7f050b07ec392d1551fd789d3e0ebe22e053648 |     
  aarch64    |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/330cdd177f635090ade8dbc5f02ab9974eeff420 |     
microblazeel |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/0ee4b4c5de78efd8d58676829045d18683ecf9c3 |     
   mips64    |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/58a13b3161620e62473921b05607f1f5f20251fc |     
    arm      |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/cb68445aa1ba7d6c1ddfb4e7d5e32528b3521abc |     
    mips     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/be70dd206f07906066d3d7228aa264db57df20d2 |     
  riscv64    |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/349b72b3652dca4bfc6655b113b58b28906ace24 |     
  aarch64    |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/4da124a591bec1dd81aaf1424fe113dd830de4ae |     
  aarch64    |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/a03e43e4b26bb7bcdd2639b8770492f85bd0ef60 |     
 microblaze  |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/124fd2cded6c4e49ac2f4aa092acac0bbd7979bb |     
   sparc     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/f4a9f3bb8a6519aedc59c39a0635f7327aad10ff |     
   x86_64    |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/fa7aa437fec2077ebb13ac453801ff62cd005421 |     
    arc      |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/5964794bca039447d78b0508dada80237dd133be |     
   arceb     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/1f613c57b8676bc49ebe8963d50e9250fd9e306a |     
    arc      |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/dadaafca4a76d1e7739bdb80b6cff342be8ffeb6 |     
 aarch64_be  |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/304ad228fb13d92d0e543fa668821ddb59cded63 |     
   mips64    |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/d0b638b899c2ae452324b7da9d8790deebc6044e |     
  sparc64    |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/949b1105c37c760d28e146d3a1da1d5d2b529c4d |     
   nios2     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/a41e6b9e7fdeed4f6642778923ec72839ccad44c |     
 powerpc64   |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/75a04a6e868d22217345ea0e6246bc1b560cac46 |     
 microblaze  |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/a151e6a4621033c4558e9bdb77940f05c8369694 |     
microblazeel |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/d50d20c7b88ea669ea8454e8655cd2bdbc4d875e |     
   armeb     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/b945a86acd673ad4fc73296ad543256e1c5f180a |     
  mips64el   |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/d0f6c976e5fd6a3ab65a93aae66164abbc471be4 |     
   mips64    |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/764efdab08dfa249092229cfd2deb5a4ad1443af |     
   mipsel    |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/5b9a4769a42782589ca0da68df7f65eaf4e4b007 |     
   s390x     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/6bab97f5a741f4ac4491e6ff5e6e4996dfa0f937 |     
   sparc     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/07fe45ed21937961bd624ce6f68f4b0e3c51dcd2 |     
 powerpc64   |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/0f9453fc7f09dc65354e138165643b765266411e |     
  riscv64    |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/6e50a8628fd0790578f2768043f67458b349f24e |     
powerpc64le  |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/8169e44b3bdd64428a76dcf93c1d1bd643de864b |     
   mips64    |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/316a10371a28f82629634f32fd25b84e0da185c0 |     
   mipsel    |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/8dd251ecdd1d0b402e09d1a6322ba4d6e3568eb7 |     
 aarch64_be  |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/1edaafdec8dddf7b6a19b24afff8c6f2240097c7 |     
  aarch64    |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/8cadc45ec0c21b13ce49b61474d993e4acf8b168 |     
    or1k     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/349e23d82a4276f17dd40c68bf3f18d58f90d2c3 |     
   mipsel    |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/e25b3eee66e444d7ea7c81949a3752d5951f7d87 |     
   s390x     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/8283516a09dbd180cc251ee56b9d5dd8270a6c71 |     
powerpc64le  |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/624e71448588ce6241450cfd0034aeba63c04581 |     
powerpc64le  |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/b9704e9ce9dda247eba6797dcd7827589e8e35ec |     
    or1k     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/1d9dbb5bf001ae36818188dd070eb62003bd0abd |     
    m68k     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/164a96b45041637ab19c0e9d71469f24793e4066 |     
  mips64el   |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/1e78d4f8e3ecf88e6665899c46b0e3cc7c557be3 |     
   sh4aeb    |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/28c132ff4c26ebac99163048b484b753db564900 |     
  riscv64    |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/782a8567da7e9fc2b2b4ef1f1dd11f2b693fed80 |     
  riscv64    |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/ba3a12a2d7e80f1409eae113144c8361fde77722 |     
    arc      |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/86377c3b3700c71cbe7ea73115292eade3117059 |     
powerpc64le  |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/438200a05f69b30f11ca0d1f8d246be49d54ec25 |     
 aarch64_be  |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/af66ba212407ae3d1505774a8317a5ba029f8277 |     
  mips64el   |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/f7e25fb5cc430e6f81149c50444abee25794e086 |     
microblazeel |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/e563a963b8e31f5c8917dc72c9b1529b7dcee635 |     
  powerpc    |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/2141f55dee7d7ffe854ce68fc4ac1a48af9fb321 |     
    mips     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/18d9fd25a7751e6ea3554b2925171925631e89f4 |     
  mips64el   |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/7687e357984a01a5cf2b14810ce69a9bd834dfa8 |     
    or1k     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/4ce1ccd2938ebd0490a9ad4a4f2697a0d62806e8 |     
 aarch64_be  |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/bdbaad38c37f3e5a79b97b8270bb93b61a971e9c |     
    arc      |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/5948549cfb3d71553f47e055025b9f9ae675a785 |     
 microblaze  |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/af4743644f21448a091a26d9efbbedbe89c15492 |     
    or1k     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/ce8edf9f497d630c36e7ec364e33a83533161c75 |     
    arc      |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/cbddc2d73c447d7badde615955af4949d40e39b6 | ORPH
    arm      |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/da29b5b08d9e0bdce1a89ce6d346c8e9e7a2e073 | ORPH
   armeb     |          cpuload-0.3           | NOK | http://autobuild.buildroot.net/results/b78f2ec3844cd789ecc3b1cf4c313319a66616a3 |     
 powerpc64   |          cpuload-0.3           | NOK | http://autobuild.buildroot.net/results/c76b27a4dd8beb8664111a3ae880879837d0f511 |     
  riscv64    |      crucible-2023.11.02       | NOK | http://autobuild.buildroot.net/results/99a324fae7f7ccc8e4e04b2dac9d77858151c2bc |     
    or1k     |      cryptodev-linux-1.13      | NOK | http://autobuild.buildroot.net/results/04c396335ebb411fc175aa26c68b0ed3737e4e6b | ORPH
   nios2     |          cvs-1.12.13           | NOK | http://autobuild.buildroot.net/results/c233f090885074ec688e7da825cc3c273e13362d | ORPH
    arc      |          cvs-1.12.13           | NOK | http://autobuild.buildroot.net/results/7908b7c67407d1d159c0055af469959342255b3c | ORPH
 microblaze  |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/53a0308d57e71146825696d10323b9d861882160 | ORPH
    i686     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/0a826f5545d492c69be050880d1c4adb0dd0216f | ORPH
   sparc     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/2e3c1a3246d8989f2b0f52cb5f6cdb6f477a4253 | ORPH
   xtensa    |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/4b77dd4d898b812bcb41fb2bb5a2bbbe1e562349 | ORPH
   x86_64    |          delve-1.22.1          | NOK | http://autobuild.buildroot.net/results/8845fea5f8f52d5557a63d46c70536c20336eb24 |     
powerpc64le  |          duma-2.5.21           | NOK | http://autobuild.buildroot.net/results/0f842a822cbca9d88dd07cdc31ac93f10ed6f08f | ORPH
   s390x     | dvb-apps-3d43b280298c39a67d... | NOK | http://autobuild.buildroot.net/results/85d9ddaefb4376ff13ad59e69986ca6d16277f25 |     
microblazeel | edid-decode-6f117a8f8c0e76e... | NOK | http://autobuild.buildroot.net/results/a6e2638dc9f97172f39700780dc996ba93e007a8 | ORPH
  mips64el   | edid-decode-6f117a8f8c0e76e... | NOK | http://autobuild.buildroot.net/results/b1a076ba4a7f86ddd27a2961b08ed91c374ddbd3 | ORPH
   armeb     | edid-decode-6f117a8f8c0e76e... | NOK | http://autobuild.buildroot.net/results/11f1d44f72c284113fa281a420fb49ddc90d6e7a | ORPH
  riscv64    | edid-decode-6f117a8f8c0e76e... | NOK | http://autobuild.buildroot.net/results/3967fab31fd373070faf07750a6c152e9fe22ede | ORPH
   x86_64    | edid-decode-6f117a8f8c0e76e... | NOK | http://autobuild.buildroot.net/results/4ddcdeb970e88591b94786f1ca6b12a4589318e7 | ORPH
   nios2     | edid-decode-6f117a8f8c0e76e... | NOK | http://autobuild.buildroot.net/results/dc80bc996dc4a794ad1c3e491fab3b079ff66f8d | ORPH
   x86_64    | edid-decode-6f117a8f8c0e76e... | NOK | http://autobuild.buildroot.net/results/f6c2ec635e53c797ba0976c6f0e5e455c49a684e | ORPH
    arm      |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/e75a96fc6a5643ce63a22c0c2f3dbbb59072a5a9 | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/0bef60d3b430a06a49bf335fe25b89e31898d9bf | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/5885b183fafa821cd4eae210b43e170fc14992d3 | ORPH
   mips64    |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/f03242501678756c4857cff269a1a92bcc63fb2b | ORPH
   mips64    |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/b65c5efce0a963dfa862e3b3acb55098a377df21 | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/cad2815e774ff5678a22a736c84927b3b047deed | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/1b2e2bedb16f6d0fadb963b8e159ad0f4d730cd9 | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/91d3191c77f4e320dcb43fa8acc590dd45dff2d3 | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/15a8de83bdf668df65599f6173700d2b181ad8d3 | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/f831f8b4255b1c8517c0276e62eda8059991ce87 | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/a5cf2d9f2c07e7fe24502f2d1917fb1b9a2c6a95 | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/393830ee7dd8f192cb0b19ca611d55f5966ab6a2 | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/33d5067ad0917cde03bca8eb6d0e2b9b480f192a | ORPH
  sparc64    |          fbterm-1.7.0          | NOK | http://autobuild.buildroot.net/results/5f802a173ed863fe6959a6c10a96c3077b087203 | ORPH
 aarch64_be  |           fcft-3.1.6           | NOK | http://autobuild.buildroot.net/results/20a5913c764abed55ececfbadfe0caf39854870a |     
 microblaze  |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/80b3a4e3ab6f8403e2e1eca30316677d1c1e3a3f |     
 microblaze  |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/edec14f2729ac2b2918327119b867a886ac4193d |     
    arc      |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/9e5af2e3050c6190f5b4c48aed8b40e03d37f2de |     
    arc      |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/c077ead5756edb73dd29a17fcc09b260dc2593f1 |     
 microblaze  |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/10a923e7df4c6c07985532faaedd52c9897f6fcb |     
microblazeel |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/8f2090f3749d106a9d680852b979260ef7692e7b |     
  mips64el   |         flashrom-1.3.0         | NOK | http://autobuild.buildroot.net/results/98277ff8db9ae340bc6a11962aedc0a81cba2e14 |     
   sparc     |         flashrom-1.3.0         | NOK | http://autobuild.buildroot.net/results/11a8efde32df95b4f2de76ffc18cb147611761c3 |     
    m68k     |         flashrom-1.3.0         | NOK | http://autobuild.buildroot.net/results/0111479094d705baa7e2a2459e668c7ec65bd1db |     
powerpc64le  |         flashrom-1.3.0         | NOK | http://autobuild.buildroot.net/results/e0978c82a82c49d22d81edf5ab54be08f15ea654 |     
powerpc64le  |         flashrom-1.3.0         | NOK | http://autobuild.buildroot.net/results/6840581bc9e1c7cca994a1f201b1098c3de534dd |     
 powerpc64   |         flashrom-1.3.0         | NOK | http://autobuild.buildroot.net/results/d6ef52389473577bda4ad1d68bcb80d69eeffffa |     
 aarch64_be  |         flashrom-1.3.0         | NOK | http://autobuild.buildroot.net/results/8511be749eb7dae7776e63dbc282b73c1c1b9224 |     
   mipsel    |         flashrom-1.3.0         | NOK | http://autobuild.buildroot.net/results/fcc6b441b3b774191a471f5a01f9a78bb54b0dab |     
   arceb     |         flashrom-1.3.0         | NOK | http://autobuild.buildroot.net/results/ef6d7ae3a19d18e0302dc28715af82800408cda7 |     
microblazeel |          foot-1.16.2           | NOK | http://autobuild.buildroot.net/results/7df27f504e64c8fd62d52c5b0553a355877f1e66 |     
 powerpc64   |    freeradius-server-3.2.3     | NOK | http://autobuild.buildroot.net/results/57e2b79f75a3ef769c7ca25fc8c134de7841d56b |     
    mips     |       gdk-pixbuf-2.42.10       | NOK | http://autobuild.buildroot.net/results/97179d1cf4d9cca4318eadf168037fe8553e1272 | ORPH
   arceb     |          gensio-2.5.5          | NOK | http://autobuild.buildroot.net/results/ce36b9adacc64949d328ce91bdc5361df3ba2056 |     
    m68k     |         gerbera-1.12.1         | NOK | http://autobuild.buildroot.net/results/f1c47517b0548ae57af58aef1c98b92a9b8c3e16 |     
    or1k     |         gerbera-1.12.1         | NOK | http://autobuild.buildroot.net/results/36051fefc031dd71425d4ba542ff357aca7b5c15 |     
   sh4eb     |      ghostscript-10.03.1       | NOK | http://autobuild.buildroot.net/results/2d7d6118ab65000d551912db210486f0be8619ac |     
 powerpc64   | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/f36034973bbd9312a72861cf36869596dc5c5914 |     
 powerpc64   | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/5c13a5e851615b86e934e8425a858adbc1127d04 |     
  powerpc    | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/f9ffa9c8622ec959a9b99b7cf6925e21ee34af51 |     
    m68k     |     gmrender-resurrect-0.1     | NOK | http://autobuild.buildroot.net/results/1373622bc7ec0545674981e54e2f9e664d71ed51 |     
   armeb     |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/d9583298e6239f81242919ca8ae99bdf761bfb05 |     
    arm      |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/9081f208caeebef9256915c33b407c77930b28bc |     
   nios2     |         gnuplot-6.0.1          | NOK | http://autobuild.buildroot.net/results/2e9ee78907fe7050dc14f0dc8781b79d6cf0fe58 |     
    or1k     |       gnuradio-3.10.7.0        | NOK | http://autobuild.buildroot.net/results/330a7b27578917b73f1a99cf1f083f65e6de0ac6 |     
    m68k     |       gnuradio-3.10.7.0        | NOK | http://autobuild.buildroot.net/results/2581773363d3dde5b55a4b43a550105f70cd68f2 |     
powerpc64le  |       gnuradio-3.10.7.0        | NOK | http://autobuild.buildroot.net/results/03236ed913b5a0762a35b2cfdb7798011f1a78f1 |     
microblazeel |       gnuradio-3.10.7.0        | NOK | http://autobuild.buildroot.net/results/fa26acf8e7bf3b36aae4e61f4e873d6a1978cb9c |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/b843d2b847412e8d3d22d3fa955cf1ede3211439 |     
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/ed39b88942ea0dfae42edf637deb9d1ec2d9fa74 | ORPH
   x86_64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/b93b520a076a46a9c90b438e3b580efc6caa6dc9 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/589a22ab00ae2d43b15d91585738e18975558446 | ORPH
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/fe9a3806ba66340bb5158ec94fb9c381af09006d | ORPH
  sparc64    |       host-binutils-2.42       | NOK | http://autobuild.buildroot.net/results/07c892e84d79aeb8b6d4aeda81e1b134f62254a4 |     
   armeb     |       host-binutils-2.42       | NOK | http://autobuild.buildroot.net/results/b739c1605af63dd3cd7d153b6625c59fd25cf4f4 |     
   xtensa    |       host-binutils-2.42       | NOK | http://autobuild.buildroot.net/results/ac1510a6877287b4b5ad3a8016289ed1072371af |     
 aarch64_be  |       host-binutils-2.42       | NOK | http://autobuild.buildroot.net/results/5166288ca5a8f9df7e4b67df4b7874e3dc9446de |     
  aarch64    | host-binutils-bare-metal-2.42  | NOK | http://autobuild.buildroot.net/results/6f19ea69704d329a4b629329873e50727b44ee57 |     
powerpc64le  |     host-gcc-final-14.1.0      | NOK | http://autobuild.buildroot.net/results/b3c1f9d2ec011639b2e6fb640a1039b7564bd258 |     
    or1k     | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/0dcf429a04180ebee2d73b612efbc43b519a26e0 | ORPH
    arm      | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/0ade6cba6f611db628aefcad15570880d7bc3a6c | ORPH
   sh4eb     | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/34f902d38261471d55e04cde8a473693e5dc5c3a | ORPH
    arc      |      host-libglib2-2.76.1      | NOK | http://autobuild.buildroot.net/results/fbbde7218e1ea86650082981660be3d326895ebf |     
 powerpc64   |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.net/results/1de25e09ceb53e0c62827b71431b7352bf0f7062 |     
   armeb     |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/f1b3fcbe4f84747b8879326daef7cc05ce6d28d2 | ORPH
   xtensa    |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/76d2269289b9cb912c78fea6d9ff5c1f950b8c09 | ORPH
  mips64el   |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/0080f2538c735fca6b0c90559a55617b100bca2b | ORPH
 powerpc64   |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/e0f3a15092252c1ce3ed4c241f3911f313bb1cb4 | ORPH
  riscv32    |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/b95060c94152e0128f273be4cdf869903bdf9542 | ORPH
   xtensa    |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/ad59669925ed6467e0a0783a2af42b51a3282905 | ORPH
  mips64el   |        host-runc-1.1.12        | NOK | http://autobuild.buildroot.net/results/2f05be3879ee0805bcbaa972e64551ea8af92241 |     
  mips64el   |        host-runc-1.1.12        | NOK | http://autobuild.buildroot.net/results/304ef2fe000c7a63add4f3393861729f3db2dc44 |     
    mips     | host-softether-4.30-9700-beta  | NOK | http://autobuild.buildroot.net/results/016c888732cee4801dfb6f83e22b14b8946734a1 | ORPH
microblazeel |      host-systemd-254.13       | NOK | http://autobuild.buildroot.net/results/b67b24c90a8b298293eb426caeda7a5cec18ce2b |     
  powerpc    | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/c0b0621752f6303427e57afb2a2040c5a3d93c85 |     
   mips64    | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/bde532d633fd28629d647cff091186911f0afe56 |     
   x86_64    | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/846f2b150e634e0844082d9bcb1dc78964ff88b7 |     
  aarch64    | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/4dc584d55d5e8d8273848b85ee9558481987192c |     
  aarch64    | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/209efa576892b7b5b32b257c56d31b7e1b8610fb |     
   sparc     | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/7adbfc1bd8ed91943f8003553fc67d9990f92fc1 |     
   sh4aeb    | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/9a5529797288353432ecfe21881fb2a01878ba57 |     
powerpc64le  |          httping-2.5           | NOK | http://autobuild.buildroot.net/results/229b918ef0f302e51892d9073eb9022edf90a8c8 |     
  mips64el   |          httping-2.5           | NOK | http://autobuild.buildroot.net/results/952ef922fd459f285e47b77926447646af15f354 |     
   x86_64    |          httping-2.5           | NOK | http://autobuild.buildroot.net/results/62d4f403e6dc558f235478abfe978bdbab0291e5 |     
  sparc64    |          httping-2.5           | NOK | http://autobuild.buildroot.net/results/1de0104a93eacc8d0dc451e955df355d7c6240f3 |     
  aarch64    |          httping-2.5           | NOK | http://autobuild.buildroot.net/results/84a0f91cfabbce1340f0a24f378454fe95ee2aa3 |     
   nios2     |          httping-2.5           | NOK | http://autobuild.buildroot.net/results/4d24e4d198f9c017679f71d226b4b16ebdba2708 |     
   x86_64    |          httping-2.5           | NOK | http://autobuild.buildroot.net/results/6858abe7a41f0404ee0170c81d8ca1fd2b4db603 |     
  aarch64    |          httping-2.5           | NOK | http://autobuild.buildroot.net/results/2b560601e089fa8814880dcd9fba8d4aac0ec7ed |     
    arm      |          httping-2.5           | NOK | http://autobuild.buildroot.net/results/8b0412ed8807bcea5cfb71dde99a54c8e7784faf |     
    i686     |          httping-2.5           | NOK | http://autobuild.buildroot.net/results/d724a7d3290c304450d14adb9a0953d4a00eafe1 |     
powerpc64le  |          httping-2.5           | NOK | http://autobuild.buildroot.net/results/6da83b06eb2446fb588a76cfede70c3ca9a928d6 |     
   armeb     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/47cceb39cdb5d47cf49f616e7b45c263db22ba24 |     
   sparc     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/d9b7d3ca6053770d98b07665297b337540207219 |     
  powerpc    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/de554f20bc5bb2bcaf57ae788b0c24269146fb23 |     
   sparc     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/6c2d758e8105ad0bef15488631a18342dc39a40d |     
    m68k     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/2b7dd88b90cf166e7b457beca96fbc421511db81 |     
   sh4eb     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/a93e3a9e45c9091ef699f1e65d06cab831d0cda3 |     
    i686     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/f08d5d6be222951c0b708063aac1f257cb76ce28 |     
    mips     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/21c47e9d9998f10a6313da58b7cd4ee6bf0ad59d |     
powerpc64le  | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/201461e05b636eee4a875eae3f100a1d55a30876 |     
  aarch64    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/5474459df19a235cc46433e6ff64125a4603b4cb |     
 aarch64_be  |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.net/results/054cd52c10f9493762c790e2aecc46da952c9c5b |     
   s390x     |          kexec-2.0.28          | NOK | http://autobuild.buildroot.net/results/d586d047c24dc3c595d1da04710f6fe093df2dd7 |     
   mips64    |            kmod-31             | NOK | http://autobuild.buildroot.net/results/d74cdde915193808ed53b3b85d600e5362b45d74 |     
   mips64    |            kmod-31             | NOK | http://autobuild.buildroot.net/results/823a74a4ef2581dfadcb1532c4aedf90e01dbcca |     
   x86_64    | kvmtool-4d2c017f41533b0e51e... | NOK | http://autobuild.buildroot.net/results/5e4643c92507f771c15821656fb29845f6a9971e | ORPH
   s390x     |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/8429222600adff22870bd8a708bd75ae6737e44c |     
microblazeel |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/9efdf0f4a002f6121b9076d35b57829456799b9c |     
   s390x     |         libcuefile-475         | NOK | http://autobuild.buildroot.net/results/3b877c67f8f66edd68c0c7fd85ebe9639d9d0965 | ORPH
  aarch64    |          libdex-0.6.1          | NOK | http://autobuild.buildroot.net/results/79041125ab9093fd3a477356274f6e72f56cecdf |     
    arc      |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/9281f1fdfbb1c8f382c05bb1fe003aff0b8f9d67 |     
    arc      |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/26578e8d40c8c6dda30deab78f4a7f0c382f61c7 |     
    arc      |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/fcc717a2472e251e899cc217acbd667bff795374 |     
   mipsel    |       libfreefare-0.4.0        | NOK | http://autobuild.buildroot.net/results/d4572b0424326ce9d5d1224e7366730ff3bf3923 |     
   arceb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/0a5421f57716320658ed4fae5e57f9a15687e097 |     
    arc      |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/4119d420913c9a15a5834ddf5baf27a833cba0b7 |     
    or1k     |         libglvnd-1.4.0         | NOK | http://autobuild.buildroot.net/results/5d756d59925c2b75706e882578bc176db8d3e22d | ORPH
  riscv64    |           liblo-0.31           | NOK | http://autobuild.buildroot.net/results/3b640eba0dbef4f809bef5125f3315ffdec4a01f | ORPH
   s390x     |          libnss-3.102          | NOK | http://autobuild.buildroot.net/results/95f93b924d7c180df2b4e3bf307f69e0692607ff |     
   armeb     |         libp11-0.4.12          | NOK | http://autobuild.buildroot.net/results/ccf42d1964f19966d9b789165e606a88a9ce0af1 | ORPH
    or1k     |         libp11-0.4.12          | NOK | http://autobuild.buildroot.net/results/f69b1e5ddc426d559e31c8b3394fa2aaedeb028b | ORPH
  powerpc    |         libp11-0.4.12          | NOK | http://autobuild.buildroot.net/results/d7827145343f83ceebd5a3ddfb792ef113872071 | ORPH
microblazeel |         libp11-0.4.12          | NOK | http://autobuild.buildroot.net/results/fa4ce7b669314c1ac145c69a31128c42266dad97 | ORPH
  aarch64    |         libp11-0.4.12          | NOK | http://autobuild.buildroot.net/results/9e949f2b3d7486a0dbd757c4c73818f303949cdb | ORPH
  mips64el   |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/a5e59d22af07a8260f32615391e21731be533551 | ORPH
  powerpc    |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/888fb0e3193503a2a644f1580ae743636ca63c08 | ORPH
  mips64el   |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/db595a5ea2762d382e975910397d524156a0fd74 | ORPH
   xtensa    |          libsepol-3.6          | NOK | http://autobuild.buildroot.net/results/8ec629808cc95b61076f2647476034aeba63b396 |     
   mips64    |         libxml2-2.12.6         | NOK | http://autobuild.buildroot.net/results/d878f1542aced1661120884f6a06717356eaa5d6 |     
  sparc64    |        lighttpd-1.4.76         | NOK | http://autobuild.buildroot.net/results/765d816ed8d37a63681235d25dba1281489e0fb1 | ORPH
   sh4aeb    |          linux-6.9.8           | NOK | http://autobuild.buildroot.net/results/0cab49dd63c83dd8c9e5540595c3aeede128f4f7 | ORPH
    m68k     |          linux-6.9.8           | NOK | http://autobuild.buildroot.net/results/8047b090f332f781bfd07e6b08559f7f756151e5 | ORPH
   sparc     |          linux-6.9.8           | NOK | http://autobuild.buildroot.net/results/80ac79d43d508ce180180ef95c24d4bcf4283817 | ORPH
   x86_64    |          linux-6.9.8           | NOK | http://autobuild.buildroot.net/results/4ec99524d25e2ff3e5a72145235814e9232a89c9 | ORPH
 microblaze  |        linux-pam-1.6.1         | NOK | http://autobuild.buildroot.net/results/7d3e0883228875385b49e2979578d7fe2c69f686 | ORPH
  sparc64    |          linux-tools           | NOK | http://autobuild.buildroot.net/results/f6514c4864ca2d43232dac91c03cdb7e6959e85e | ORPH
   x86_64    |          linux-tools           | NOK | http://autobuild.buildroot.net/results/f3824737ddd89c185b00516ea6a957a017d18959 | ORPH
   x86_64    |         lrzsz-0.12.20          | NOK | http://autobuild.buildroot.net/results/786a7ecd9bfdd46fa4204f51c7eafda89b86bd44 | ORPH
  aarch64    | ltrace-82c66409c7a93ca6ad2e... | NOK | http://autobuild.buildroot.net/results/a4d6e0035d288d24102644619fd454cbb3672c8e | ORPH
  aarch64    |        mariadb-10.11.6         | NOK | http://autobuild.buildroot.net/results/5e50041dae685ca40d7110a54071fd96f92fa89b | ORPH
   x86_64    |        mariadb-10.11.6         | NOK | http://autobuild.buildroot.net/results/085894e883a48052626cdf4ce8ccdb4c64e4570d | ORPH
    arm      |          mender-3.4.0          | NOK | http://autobuild.buildroot.net/results/d077b9940110f3908d55876dd486554cc7389045 |     
  aarch64    |          mender-3.4.0          | NOK | http://autobuild.buildroot.net/results/690f54e005bb87a68fb306aa7733af8880425d9d |     
    arm      |          mender-3.4.0          | NOK | http://autobuild.buildroot.net/results/959ddf3bdad89581f6e4a8cca9132242bc9e2e44 |     
   x86_64    |          mender-3.4.0          | NOK | http://autobuild.buildroot.net/results/8c53ac4048176f8bc1f66f9ab2a2637e5e10ea8c |     
   armeb     |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/439d66fe34e8c09aa0018552f65f56220ec7410a |     
   armeb     |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/2eb1bf3172e6b2acaa943f808244130bc4f17136 |     
   mips64    |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/4443e9135e7ed282c79973c0abd7a304f99d28d6 |     
    or1k     |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/065035c40bd19da4837b1e0576af8b3872b2930a |     
   mipsel    |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/effcf2f2286bb3453d8db2acad99e22575377a07 |     
  sparc64    |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/2cb838b9031f40819294d71784c4b2462e4efa54 |     
   mipsel    |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/6e94a019690b3dbbc556091186fe32748058272c |     
powerpc64le  |           mpv-0.35.1           | NOK | http://autobuild.buildroot.net/results/099afef86b9a9775e4a3feec38e1f2d25d1fb434 |     
   arceb     |           mtd-2.2.0            | NOK | http://autobuild.buildroot.net/results/41b0747da40d3b2399c65cb0719bf276f42ea599 |     
  powerpc    |           mtd-2.2.0            | NOK | http://autobuild.buildroot.net/results/7ac3fb1bec7bf75c353a07177876c7bc8382c1ea |     
  sparc64    |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/1b9068b5788ac2b4149e32aa28279990efb28577 | ORPH
 aarch64_be  |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/2e6f1563724eee412bec9f54f51f50e3e85d155b | ORPH
   sh4aeb    |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/b78fc2dcf119bf297eaeed46cc688b4c86cce6a9 | ORPH
   nios2     |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/22f62273d51e7bef1c6e352619ad373cf9ab623a | ORPH
   arceb     |          ntp-4.2.8p18          | NOK | http://autobuild.buildroot.net/results/1c106590c67dbac1fe5b9b20bde79627b690d181 |     
  sparc64    |         nushell-0.85.0         | NOK | http://autobuild.buildroot.net/results/d89354880b82e020fa599e4988d3a6e9977b3923 | ORPH
   sparc     |           nut-2.8.2            | NOK | http://autobuild.buildroot.net/results/8fbc08e02bf47eee633ecc8629ec8964cc58d520 |     
   nios2     |       open62541-v1.3.11        | NOK | http://autobuild.buildroot.net/results/7d30a2f3cbdf4d3f874dffe6875eea238ca0f11d | ORPH
   mips64    |         openssh-9.8p1          | NOK | http://autobuild.buildroot.net/results/37b87aebd5021c9ffc394b848d209b2ff07f9de1 | ORPH
   nios2     |         openssh-9.8p1          | NOK | http://autobuild.buildroot.net/results/2085909d8f5acb7ebfcbe6a735209b6a96372643 | ORPH
powerpc64le  |         openssh-9.8p1          | NOK | http://autobuild.buildroot.net/results/a5079e31d574a347c4469cc692528d160fc2aa55 | ORPH
   nios2     |        pulseaudio-17.0         | NOK | http://autobuild.buildroot.net/results/f3cc9bd09a5c41993b8088982d20ac6b61fc2067 | ORPH
  sparc64    |     python-remi-2022.7.27      | NOK | http://autobuild.buildroot.net/results/4a1430c785807a11d0222bbe1041e21a904633eb |     
    sh4      |     python-remi-2022.7.27      | NOK | http://autobuild.buildroot.net/results/24428a88fa6a57daea7946f1290c168ac3eed818 |     
   mips64    |         python3-3.12.4         | NOK | http://autobuild.buildroot.net/results/9adaa99824930d9202c8a1e81224a7466e901819 |     
   mips64    |         python3-3.12.4         | NOK | http://autobuild.buildroot.net/results/59333752b9324000613c0296f697f196da36935f |     
    arm      |       rabbitmq-c-0.13.0        | NOK | http://autobuild.buildroot.net/results/1b798a381f8d3a218801eabe326c2f9c14e738fa |     
   xtensa    |         s6-dns-2.3.7.2         | NOK | http://autobuild.buildroot.net/results/da7fd87536d9335639d1487ada50e56698576a7c |     
   mipsel    |         s6-dns-2.3.7.2         | NOK | http://autobuild.buildroot.net/results/ac3b0e773613e6077eff8ae9bbbb1771ef41075c |     
  powerpc    |         s6-dns-2.3.7.2         | NOK | http://autobuild.buildroot.net/results/851fee95294da21b5dad87445071cec8b0609b36 |     
   sparc     |         s6-dns-2.3.7.2         | NOK | http://autobuild.buildroot.net/results/f1a175550b7b5b5c971688455d954866c9607c52 |     
    sh4      |         s6-dns-2.3.7.2         | NOK | http://autobuild.buildroot.net/results/2cd06472989672ae85b207ca7394b9ab803ccf8c |     
   armeb     |        sdl2_mixer-2.6.3        | NOK | http://autobuild.buildroot.net/results/fb3a03f1dae9671502f601adf3955ce7c730b361 | ORPH
   sparc     |       sofia-sip-1.13.17        | NOK | http://autobuild.buildroot.net/results/57758e9148ebf50b12fbae3137d9a444ff5f060e |     
 aarch64_be  |       strongswan-5.9.13        | NOK | http://autobuild.buildroot.net/results/aacf9d906e553a1b9d5a6c8ae50f35fb195c9943 |     
   sh4aeb    |          sysprof-46.0          | NOK | http://autobuild.buildroot.net/results/a97241f97605af39a6014fefda1463be94e0b510 |     
 aarch64_be  | tftpd-e52af4207a6e09a1ba21f... | NOK | http://autobuild.buildroot.net/results/e770143fe9483be7ae8bfd9bd33c59f4400a87a9 | ORPH
microblazeel |        tipidee-0.0.5.0         | NOK | http://autobuild.buildroot.net/results/733ee4a4e7290349813388958352d5fd0b26e52c |     
    arm      |        tipidee-0.0.5.0         | NOK | http://autobuild.buildroot.net/results/3b64d9a7b334a5aaaf9dd9ed06817e7e07ea0894 |     
   mipsel    |        tipidee-0.0.5.0         | NOK | http://autobuild.buildroot.net/results/7eb32c0ae668963ffe957e391e167b01d03ad13d |     
 powerpc64   |        tipidee-0.0.5.0         | NOK | http://autobuild.buildroot.net/results/832753ae3ab0943b83b1c15627dee5138fff20fc |     
  riscv64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/e0ecba0a8bcda06bbddacb1a6a7cbb0930e445d0 | ORPH
  aarch64    |         tpm2-tss-3.2.2         | NOK | http://autobuild.buildroot.net/results/817538ccbf3f249f6516fc1fa94a65efac347610 | ORPH
  aarch64    |         tpm2-tss-3.2.2         | NOK | http://autobuild.buildroot.net/results/2ab8b100d2268c7b1628a8156101d7f322780b43 | ORPH
  mips64el   | uclibc-ng-test-132c6134d691... | NOK | http://autobuild.buildroot.net/results/7f14757719ed32986c6ef85a299ab091e9efc2bc |     
   mipsel    | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/1f7f3df977794bce462ba91e602228c9491a2a43 |     
   armeb     |         unbound-1.19.1         | NOK | http://autobuild.buildroot.net/results/e1587f2fe7316c7e431cbefefffbbf5b65889660 |     
    m68k     |         unbound-1.19.1         | NOK | http://autobuild.buildroot.net/results/b5e924887e451f24bbfb77f638bfb246304d734f |     
    mips     |         unbound-1.19.1         | NOK | http://autobuild.buildroot.net/results/1a82015e07fca94df5223f4520933217ccd130ff |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/9df1c47e0fac293d3ec6dc6da6a4d2312745bb92 |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/4916a5a121884459933408c1520f34564cd07d2c |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/7f35cf6176e229181637a2308c1e8bdb8a22dd01 |     
   mipsel    |        valgrind-3.22.0         | NOK | http://autobuild.buildroot.net/results/0fd6eefbcfa87cad9512fa66f4d6642edb63de32 | ORPH
  mips64el   |         wolfssl-5.7.2          | NOK | http://autobuild.buildroot.net/results/a829865459724506cac98f20d0e7d2d6735f6c03 |     
   arceb     |            xz-5.6.2            | NOK | http://autobuild.buildroot.net/results/ebf6a22358b623f85f3d80c34d9dd8e3b2fcfea4 | ORPH
   nios2     |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/e97d5e82ddc25a5271b06123be228b5a0290f7cd |     
   x86_64    |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/1bd13bd3cf9be246925cf613b6464112c442d2cb |     
   nios2     |        zxing-cpp-2.1.0         | NOK | http://autobuild.buildroot.net/results/918af159b985fc0d808e28c1f0d75d276cb4cfb4 |     
  powerpc    |        zxing-cpp-2.1.0         | NOK | http://autobuild.buildroot.net/results/ecd624e897cae1ccfd1dc8a149dfcc2c9974b356 |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

                 host-tar-1.34 | 8 
                       unknown | 2 
                  bitcoin-26.0 | 1 
                  boost-1.83.0 | 1 
            gdk-pixbuf-2.42.10 | 1 
                host-m4-1.4.19 | 1 
                libressl-3.8.4 | 1 
                    php-8.2.21 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   xtensa    |          bitcoin-26.0          | NOK | http://autobuild.buildroot.net/results/faf6bf631a0e5fd7045ebeeb73acb762062953af |     
   x86_64    |          boost-1.83.0          | NOK | http://autobuild.buildroot.net/results/a19d061919f46007333132b1ce3a1733ad433f25 |     
    sh4      |       gdk-pixbuf-2.42.10       | NOK | http://autobuild.buildroot.net/results/801214e347a052c3864915385e7d76e047e6b6b5 | ORPH
   s390x     |         host-m4-1.4.19         | NOK | http://autobuild.buildroot.net/results/c5db17de6974497db348174c007bebabad2435a5 | ORPH
microblazeel |         host-tar-1.34          | NOK | http://autobuild.buildroot.net/results/ac7bd6aadc57299231afa8a1b705b4bc8815014f | ORPH
  riscv32    |         host-tar-1.34          | NOK | http://autobuild.buildroot.net/results/714d08872da7f3e770bc54c755f273fd1ab6eafd | ORPH
    arc      |         host-tar-1.34          | NOK | http://autobuild.buildroot.net/results/3173ef07c516451297ecfaf6c3c25b106a3fba0b | ORPH
powerpc64le  |         host-tar-1.34          | NOK | http://autobuild.buildroot.net/results/0e6cbe259848e820045d7c45f7db1b3d650710bc | ORPH
    arm      |         host-tar-1.34          | NOK | http://autobuild.buildroot.net/results/490410537a85d701f6293e942f9e081262a0a6ed | ORPH
   s390x     |         host-tar-1.34          | NOK | http://autobuild.buildroot.net/results/16aa09c9f3a6051d6a0382965616c11745428b85 | ORPH
  aarch64    |         host-tar-1.34          | NOK | http://autobuild.buildroot.net/results/40a3abd20c9006b8b8ec2fe3394f402dab990871 | ORPH
powerpc64le  |         host-tar-1.34          | NOK | http://autobuild.buildroot.net/results/0ac59ffb4392ef19342b22ac841ffd8c277c1a25 | ORPH
microblazeel |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/b03ee20e1775132dff5bd0445fa7a51fa8c5bf2f | ORPH
    sh4      |           php-8.2.21           | NOK | http://autobuild.buildroot.net/results/2b0858e975c376b11bdf3af326f32faffe7f53e2 |     
    m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/78d389fd8a9470fc6f0b16fe121f2eb049576dd5 |     
    i686     |            unknown             | NOK | http://autobuild.buildroot.net/results/43a1345c3e23ecaba6f0d906194aa0ea762af5ba |     


Classification of failures by reason for 2024.05.x
--------------------------------------------------

check-11970a7e112dfe243a2e6... | 1 
                  clang-15.0.3 | 1 
                     crun-1.12 | 1 
                elfutils-0.189 | 1 
                     frr-8.5.4 | 1 
           host-python3-3.11.8 | 1 
imx-m4fwloader-8cf4d17a09ba... | 1 
                  linux-6.8.12 | 1 


Detail of failures for 2024.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/4f9a41d22c1cbb9a4c4a9770b0b48b3c6d82c01f | ORPH
  riscv32    |          clang-15.0.3          | NOK | http://autobuild.buildroot.net/results/95fc4839f435be85dc9956e0ee2b2d7c34a42bf2 |     
   x86_64    |           crun-1.12            | NOK | http://autobuild.buildroot.net/results/23768e62851c391c71d086216aa5f10776d90e72 |     
    arc      |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/f1e534595995a9727c71123b116f30ae61966ab2 | ORPH
    arc      |           frr-8.5.4            | NOK | http://autobuild.buildroot.net/results/496a28955e00dd4d8f94275a2b1e189a03ea32a3 |     
   mipsel    |      host-python3-3.11.8       | NOK | http://autobuild.buildroot.net/results/43e531136e10c31f357f9016bd6b34a8da766842 |     
    arm      | imx-m4fwloader-8cf4d17a09ba... | NOK | http://autobuild.buildroot.net/results/3e1fdd04746efe852446ca438b9a14c0bf4f0970 |     
powerpc64le  |          linux-6.8.12          | NOK | http://autobuild.buildroot.net/results/a85b36a0228155a9192c6d77058491f827f1e57a | ORPH



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
