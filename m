Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB6A4C6FA82
	for <buildroot@archiver.kernel.org>; Fri, 23 Sep 2022 05:31:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 214D760D58;
	Fri, 23 Sep 2022 05:31:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 214D760D58
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4NtOsn1Zucss; Fri, 23 Sep 2022 05:31:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CF6AA60C2A;
	Fri, 23 Sep 2022 05:30:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CF6AA60C2A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C25E31BF94B
 for <buildroot@lists.busybox.net>; Fri, 23 Sep 2022 05:30:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9373660C2A
 for <buildroot@lists.busybox.net>; Fri, 23 Sep 2022 05:30:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9373660C2A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WCbfQtMMGAXS for <buildroot@lists.busybox.net>;
 Fri, 23 Sep 2022 05:30:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 75A1F60C1C
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 75A1F60C1C
 for <buildroot@buildroot.org>; Fri, 23 Sep 2022 05:30:54 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 708BE100011
 for <buildroot@buildroot.org>; Fri, 23 Sep 2022 05:30:51 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Fri, 23 Sep 2022 05:30:51 -0000
Message-Id: <20220923053057.9373660C2A@smtp3.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1663911051; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Fbq7biq9Oop5Jf62DzxE7crSr75cY5CNZiYATb6yjJ0=;
 b=ATVJF5fm1YmKuzuuOwAMXwDCYoohYiHXhQ5Ok3FgzFlOm/l5//ATnkxEZF3wrNKe0PyK4/
 Q5REIud7whczlPyb0d+9YIkM99fqwFJ1b5YiCk4B1aACi9mEX3xpV9eVTzmDYwrz9BNfmb
 pB5Lghmi/9OesJMpF5pWPXkTMxiKwyidqVu9LCLAdRxvywE1n1a2evdeWAzUanj5aF2oA/
 GWbSRJikAWgA7mvMP0+QpSLoq+tMDbZGtXkS4+FqJ5BCrxp4X5UN/EX/fi158DlIR6dr5S
 SzgvM8wXqNe/ygsI8j7oKuawt0c2O01KmtUuhRX1q+vuOuqD01bDlPgTCEgYvA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ATVJF5fm
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-09-22
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

Hello,

Autobuild statistics for 2022-09-22
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  | 16  |  4  |  1  | 21  |
  2022.05.x  | 24  | 23  |  0  | 47  |
    master   | 248 | 256 |  1  | 505 |

Classification of failures by reason for master
-----------------------------------------------

                 linux-5.17.15 | 16
            igd2-for-linux-2.1 | 15
glibc-2.35-134-gb6aade18a7e... | 11
                host-go-1.19.1 | 11
            host-binutils-2.38 | 10
            host-binutils-2.37 | 7 
              host-rust-1.62.0 | 7 
                 dash-0.5.11.5 | 6 
                elfutils-0.186 | 6 
  gobject-introspection-1.72.0 | 5 
                    brltty-6.4 | 4 
                  gensio-2.5.2 | 4 
host-pahole-73383b3a39afe86... | 4 
               libglib2-2.72.3 | 4 
                tealdeer-1.5.0 | 4 
                       unknown | 4 
                 wolfssl-5.5.0 | 4 
dahdi-linux-5c840cf43838e06... | 3 
       host-gcc-initial-11.3.0 | 3 
                   perl-5.34.1 | 3 
                     php-8.1.9 | 3 
           wayland-utils-1.1.0 | 3 
                    bat-0.19.0 | 2 
                  cairo-1.16.0 | 2 
              erlang-22.3.4.22 | 2 
                 fdk-aac-2.0.2 | 2 
             fontconfig-2.13.1 | 2 
              fstrcmp-0.7.D001 | 2 
            host-binutils-2.39 | 2 
              libgcrypt-1.10.1 | 2 
             libgpg-error-1.45 | 2 
                   libiio-0.24 | 2 
                   linux-tools | 2 
               openpgm-5-3-128 | 2 
                xenomai-3.0.10 | 2 
/home/buildroot/autobuild/i... | 1 
/home/buildroot/autobuild/i... | 1 
/home/buildroot/autobuild/i... | 1 
                 a10disp-0.6.1 | 1 
                  acpid-2.0.33 | 1 
                acpitool-0.5.1 | 1 
afboot-stm32-3566acd582e553... | 1 
              alsa-lib-1.2.7.2 | 1 
                  assimp-5.2.1 | 1 
azure-iot-sdk-c-LTS_07_2022... | 1 
                  bcg729-1.1.1 | 1 
                bitcoin-0.21.2 | 1 
                  boost-1.80.0 | 1 
                bpftool-v6.8.0 | 1 
               collectd-5.12.0 | 1 
                dbus-broker-32 | 1 
             f2fs-tools-1.15.0 | 1 
                  ffmpeg-4.4.2 | 1 
               fftw-quad-3.3.8 | 1 
       freeradius-server-3.2.0 | 1 
fs/cpio/cpio.mk:117: /home/... | 1 
fs/cpio/cpio.mk:117: /home/... | 1 
fs/cpio/cpio.mk:117: /home/... | 1 
fs/cpio/cpio.mk:117: /nvmed... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /nvme... | 1 
fs/ubifs/ubifs.mk:49: /nvme... | 1 
                 fwts-21.11.00 | 1 
                      gdb-11.2 | 1 
                gerbera-1.10.0 | 1 
                     gmp-6.2.1 | 1 
         gobject-introspection | 1 
                     gpsd-3.24 | 1 
                      grep-3.7 | 1 
gummiboot-2bcd919c681c952eb... | 1 
               host-4th-3.64.1 | 1 
         host-gcc-final-10.4.0 | 1 
         host-gcc-final-11.3.0 | 1 
host-gdb-arc-2020.09-releas... | 1 
     host-moby-buildkit-0.10.0 | 1 
host-spirv-llvm-translator-... | 1 
               ipmitool-1_8_19 | 1 
                jailhouse-0.12 | 1 
                  kexec-2.0.25 | 1 
               libcap-ng-0.8.3 | 1 
libdill-32d0e8b733416208e04... | 1 
           libfreeimage-3.18.0 | 1 
                libglvnd-1.4.0 | 1 
               libmdbx-0.11.11 | 1 
                   libnl-3.6.0 | 1 
                   libnss-3.83 | 1 
                   libqb-2.0.6 | 1 
               libvorbis-1.3.7 | 1 
           linux-5.10.115-cip7 | 1 
               linux-pam-1.5.2 | 1 
              liquid-dsp-1.4.0 | 1 
        ltp-testsuite-20220527 | 1 
          lttng-modules-2.13.1 | 1 
              memcached-1.6.16 | 1 
                moarvm-2022.06 | 1 
              mosquitto-2.0.15 | 1 
                    musl-1.2.3 | 1 
         mxs-bootlets-10.12.01 | 1 
                nodejs-16.16.0 | 1 
                  ntp-4.2.8p15 | 1 
                  ntpsec-1_2_1 | 1 
                 openal-1.22.0 | 1 
                 openssh-9.0p1 | 1 
                 protobuf-21.5 | 1 
                     pv-1.6.20 | 1 
                python3-3.10.7 | 1 
                 qt6base-6.3.2 | 1 
            quickjs-2021-03-27 | 1 
ripgrep-af6b6c543b224d348a8... | 1 
rtl8189es-39c17661136da48f8... | 1 
rtl8812au-aircrack-ng-e7a4a... | 1 
                    ruby-3.1.2 | 1 
              skalibs-2.10.0.3 | 1 
toolchain-external-arm-aarc... | 1 
toolchain-external-arm-aarc... | 1 
toolchain-external-codescap... | 1 
toolchain-external-codescap... | 1 
                 uclibc-1.0.42 | 1 
                  uhd-3.15.0.0 | 1 
ulog-0389d243352255f6182326... | 1 
                 wavemon-0.9.4 | 1 
                wtfutil-0.41.0 | 1 
x264-baee400fa9ced6f5481a72... | 1 
                  xvisor-0.3.1 | 1 
                    zeek-4.1.1 | 1 
                 zlib-ng-2.0.6 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/09771160d6637489c6475b8c88a9c0d8c199f47c |     
   armeb     | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/d77da80eceb1f8744e5ff5609883df47d363fe88 |     
  aarch64    | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/e7670951324d2e06c2423adf399a34a20dac7d0c |     
    arm      |         a10disp-0.6.1          | NOK | http://autobuild.buildroot.net/results/01082961ff3287d827d8e853c5d505380a2e52b3 |     
   mips64    |          acpid-2.0.33          | NOK | http://autobuild.buildroot.net/results/3e52a5ec6c68786639d8c5cc203ad644ead062c2 | ORPH
powerpc64le  |         acpitool-0.5.1         | NOK | http://autobuild.buildroot.net/results/52a06e4f3efabafd5d3cca2fe7f17e5c48f76129 |     
    arm      | afboot-stm32-3566acd582e553... | NOK | http://autobuild.buildroot.net/results/012c16063fbef82be498b4e8e00f72d8c590098c |     
    or1k     |        alsa-lib-1.2.7.2        | NOK | http://autobuild.buildroot.net/results/ddcef5e7e5b7fc618095b07c6e4b236cfaef720e |     
   nios2     |          assimp-5.2.1          | NOK | http://autobuild.buildroot.net/results/688e7ffb96793e4ef5e9f6e2887a9313ee2de858 |     
    arm      | azure-iot-sdk-c-LTS_07_2022... | NOK | http://autobuild.buildroot.net/results/cecf2eeb19aac887bb11b7f29f1dc10a0683fdea |     
   mipsel    |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/4db65cb93d4858bc470b086f5232aa44dfd7cbc4 |     
    i586     |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/52a34ec14666fa1a37c87e80969c8adc0c995d0e |     
  riscv64    |          bcg729-1.1.1          | NOK | http://autobuild.buildroot.net/results/cd138b6cfbf157a4cc65ea807811c6e3f8f34d99 |     
  aarch64    |         bitcoin-0.21.2         | NOK | http://autobuild.buildroot.net/results/e6f8ebe3ad5530ee777bfd37045b71a74a758058 |     
   arceb     |          boost-1.80.0          | NOK | http://autobuild.buildroot.net/results/268ca1ce96dc2dcc60321b0907e53d23fdbc41c3 |     
  sparc64    |         bpftool-v6.8.0         | NOK | http://autobuild.buildroot.net/results/4d1e3d0465f3fa7e8dce0bd1eca1ab5fbe69c410 |     
microblazeel |           brltty-6.4           | NOK | http://autobuild.buildroot.net/results/891cc43987c80f0fc42a295e3ab1da77d8f2831e |     
microblazeel |           brltty-6.4           | NOK | http://autobuild.buildroot.net/results/9cab8ff2e6b85292525a3c5c096a04892490047b |     
    mips     |           brltty-6.4           | NOK | http://autobuild.buildroot.net/results/b9e0b892a44937638a345536bf5d28be960dc494 |     
    mips     |           brltty-6.4           | NOK | http://autobuild.buildroot.net/results/cef51a7ee941723e493d8cb3e82051190d152517 |     
    i686     |          cairo-1.16.0          | NOK | http://autobuild.buildroot.net/results/b2da67956599e8e4cf804aa899d359108c9b389f |     
  aarch64    |          cairo-1.16.0          | NOK | http://autobuild.buildroot.net/results/a055492c1ddd4dbe9c5b88558220d6fb38e6a0c8 |     
 microblaze  |        collectd-5.12.0         | NOK | http://autobuild.buildroot.net/results/6a87bbe17e6f606a97097800dc484a7b17bffa7d |     
    or1k     | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/bba1233cfe8d32b6d9ed4615c512e07d6063696e |     
  sparc64    | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/bf2ef257543e3c4e0bddaadb85b3508c7dd110a7 |     
   armeb     | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/0979ae3c0096179ce921450b030946358fef3c79 |     
   sparc     |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/cdd51445596b9de82b4629b22326423709c4b6e3 | ORPH
 microblaze  |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/9ca1002753a77f67d63f30303fec04140588dcb8 | ORPH
    arc      |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/aecb187edfb19e16816464340cd8d63aa4afac4e | ORPH
    sh4      |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/b89197f62a551438ef47e15c8b0c1da973739313 | ORPH
 aarch64_be  |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/52b529d6c9096eaf9585ff4d14f4519267c5d55d | ORPH
powerpc64le  |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/d6fb0be4c2af175e6e3853c99031fd8e4d47b2c9 | ORPH
 powerpc64   |         dbus-broker-32         | NOK | http://autobuild.buildroot.net/results/e4ccd7445eca72adcfa173897234b7f7e2392b88 |     
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/e845939d170c260167f4182682947d611723dcce | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/6731dc00018c13565bfbfa78cdd34740bedd4768 | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/0b417772a869058e4b1289d5c348d556995a1828 | ORPH
    arc      |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/991f32af80fabe2e70e3cad17ca5c907f944008d | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/e453bf9ef7a256ea7dafdf8e209789200855a9c9 | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/29f0933ddddcb7eb610d59bd975a61d9a39571e2 | ORPH
    i686     |        erlang-22.3.4.22        | NOK | http://autobuild.buildroot.net/results/0c2ed53d9099e69b05edb700c48c8d2f64f29574 |     
  sparc64    |        erlang-22.3.4.22        | NOK | http://autobuild.buildroot.net/results/585be6b0cc0993f1864a7b6b3e8014d50046cbe4 |     
    or1k     |       f2fs-tools-1.15.0        | NOK | http://autobuild.buildroot.net/results/94b948bab0885aa5048130a3b89f12142bee2e0d |     
  mips64el   |         fdk-aac-2.0.2          | NOK | http://autobuild.buildroot.net/results/c37827412acbb95191010da3aaa682ef44ef1637 |     
    arm      |         fdk-aac-2.0.2          | NOK | http://autobuild.buildroot.net/results/0ffc9323b006a40db19779e48160359fc0f20872 |     
   mips64    |          ffmpeg-4.4.2          | NOK | http://autobuild.buildroot.net/results/559fd58549c1a9be24c4df965adde72928d773f1 |     
powerpc64le  |        fftw-quad-3.3.8         | NOK | http://autobuild.buildroot.net/results/8586cb69500a948979896cbb7e7d96ccf11ec3cd | ORPH
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/067218f68904fe24724672b826459be8f0187cb0 | ORPH
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/7229bdbf3e8afa00fa8a51ac51f1ad6e822b3301 | ORPH
   sh4aeb    |    freeradius-server-3.2.0     | NOK | http://autobuild.buildroot.net/results/893e221fc9c122aed0a6f1765c53cd55823f7982 |     
    mips     | fs/cpio/cpio.mk:117: /home/... | NOK | http://autobuild.buildroot.net/results/448beafcff0de82f391833059fd0751dc9d64966 |     
   mips64    | fs/cpio/cpio.mk:117: /home/... | NOK | http://autobuild.buildroot.net/results/da408d62d6917488d7108b3b2ca3dc11d41dd08a |     
    arc      | fs/cpio/cpio.mk:117: /home/... | NOK | http://autobuild.buildroot.net/results/5f12e701c0a2f54a3e4e29d691f7a5742f9c7fe0 |     
   arceb     | fs/cpio/cpio.mk:117: /nvmed... | NOK | http://autobuild.buildroot.net/results/4a9391bb6cf562d3bd75ce26443101693ff3ca0e |     
   mipsel    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/819896d349a13857fd3b8739713656e413e87f45 |     
   mipsel    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/9b545a3231a19dd8e21c764cbcd71f12c5fa4c18 |     
    arc      | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/d0b1892ee6cb1be9bb81a63431bd2da94e73d7dc |     
 powerpc64   | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/79ef8e55b94bbf9f12a3e25da410819de94394af |     
  sparc64    | fs/ubifs/ubifs.mk:49: /nvme... | NOK | http://autobuild.buildroot.net/results/d5a4a810b1a98f33962e71ce2f5f38d0cacd26ee |     
   sparc     | fs/ubifs/ubifs.mk:49: /nvme... | NOK | http://autobuild.buildroot.net/results/d11cf9cdabf67fad9b14cb5e98a4458d9d808d62 |     
    arm      |        fstrcmp-0.7.D001        | NOK | http://autobuild.buildroot.net/results/3a41e2ed27fd296d19731bd22a44213e7ad4fefc |     
microblazeel |        fstrcmp-0.7.D001        | NOK | http://autobuild.buildroot.net/results/f8428ad38a627853856e7cf41804c80ec36c757b |     
    i686     |         fwts-21.11.00          | NOK | http://autobuild.buildroot.net/results/52c316a28fbe7f57952a412a3329667a8e2e06af |     
    arm      |            gdb-11.2            | NOK | http://autobuild.buildroot.net/results/fa4de87152b470b7e44c8d4819db69c5697fad17 | ORPH
   x86_64    |          gensio-2.5.2          | NOK | http://autobuild.buildroot.net/results/ed4d2a5e945c371e7ecdd24406443cdcc11280df |     
    i686     |          gensio-2.5.2          | NOK | http://autobuild.buildroot.net/results/b14028a304894b9f1f3128fd9f12cd09ef36b1cf |     
 microblaze  |          gensio-2.5.2          | NOK | http://autobuild.buildroot.net/results/08e229fa8eafd1c8331f7c7f4ca03aedcd86df35 |     
 aarch64_be  |          gensio-2.5.2          | NOK | http://autobuild.buildroot.net/results/8b935a947bbfe34b2bfd29872f014a00a85fb75b |     
   mipsel    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/c96b5ba27d5fb53e50d675dc6515ca6c6085426f |     
    arc      | glibc-2.35-134-gb6aade18a7e... | NOK | http://autobuild.buildroot.net/results/c0565ef4a7903c9d89ad150c4cc2c3e35eb69538 |     
   nios2     | glibc-2.35-134-gb6aade18a7e... | NOK | http://autobuild.buildroot.net/results/48a4982b3ab8c80b1d2059b3e8a9548ea6c42475 |     
   nios2     | glibc-2.35-134-gb6aade18a7e... | NOK | http://autobuild.buildroot.net/results/b62e36a619429926ec6c4685a38515ef84ec52ee |     
   nios2     | glibc-2.35-134-gb6aade18a7e... | NOK | http://autobuild.buildroot.net/results/1eae33d4373fbfb3fc26ea020e420224a40c4be2 |     
   sh4aeb    | glibc-2.35-134-gb6aade18a7e... | NOK | http://autobuild.buildroot.net/results/1f621470f1f4d348da702b1215a161395a2ac040 |     
 microblaze  | glibc-2.35-134-gb6aade18a7e... | NOK | http://autobuild.buildroot.net/results/381fd1d5b96bab26d2499ac0cc205822a2f2f8ff |     
    mips     | glibc-2.35-134-gb6aade18a7e... | NOK | http://autobuild.buildroot.net/results/96b12d687469e1f75d5cfa1c6fd118c4208d08ed |     
   sh4aeb    | glibc-2.35-134-gb6aade18a7e... | NOK | http://autobuild.buildroot.net/results/d24fb0589d8863c6716f5886794197d431781aae |     
  powerpc    | glibc-2.35-134-gb6aade18a7e... | NOK | http://autobuild.buildroot.net/results/3e9a7ba63210c7d2b8a88e2cff00c30e64a2ed47 |     
  powerpc    | glibc-2.35-134-gb6aade18a7e... | NOK | http://autobuild.buildroot.net/results/9242459fb338dfa009c05318dc0a82ea9f9c80e6 |     
microblazeel | glibc-2.35-134-gb6aade18a7e... | NOK | http://autobuild.buildroot.net/results/cfe356c05e0845433abc35be635f202952efdb4c |     
  riscv64    |           gmp-6.2.1            | NOK | http://autobuild.buildroot.net/results/dd546b39b31390c091fa3a41cb8fe14441f16df9 | ORPH
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/b4589f55aafb86f142184d1937dd0e1a9b10a6fa |     
   x86_64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/59f87cc53649237a63128629ae8e7331ebea0a52 | ORPH
microblazeel |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/2a95ecb922c62c25cc8818b73fee0d9259bd3286 | ORPH
   s390x     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/3866bafe76666b2ef1f79df4583b9fa46a841c67 | ORPH
    or1k     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/e2512cc121f2f2ca983a7a3be119f34e78b0f8c9 | ORPH
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/b5d3062ed5a0d844bea366ed4f21500b33a70fff | ORPH
    or1k     |           gpsd-3.24            | NOK | http://autobuild.buildroot.net/results/7adc125e843b21b559f1e8813059d65af58feb8d |     
   arceb     |            grep-3.7            | NOK | http://autobuild.buildroot.net/results/f24dcad4cd209654d9ae58ef7d0cd5fb18b4e5e2 |     
    i686     | gummiboot-2bcd919c681c952eb... | NOK | http://autobuild.buildroot.net/results/87cd41aa9ba2f862f476e1edc275207bce8debf2 |     
   mips64    |        host-4th-3.64.1         | NOK | http://autobuild.buildroot.net/results/bd31f7a84e34e26d5ca2afaa2212e8de3a0b9e28 |     
   mipsel    |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/58952281717560a00f9211e3e2adde16868e5ac5 |     
   armeb     |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/a68d81a83171a0d47ec9895561721f7b83493540 |     
powerpc64le  |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/c7737c3885d109c277d11ffeb6ea949bd8174305 |     
   arceb     |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/b071cd987ccf9d9478356dd5d15b8bf4e1b4ac78 |     
   mipsel    |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/878d5ed0fe6d5170ef726cb947f055c43a08839c |     
  riscv64    |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/0ec515b6e86b6389b7e144970c83528c154a673d |     
    arc      |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/347f0e6e6ddc50e3961d80a7338a99b34553732a |     
  sparc64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/6d6ff68d24f8044c410f6460dec15fff81f0fa04 |     
   nios2     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/781fade3f057b7ef0f45dff90e64798517856c26 |     
   arceb     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/d6ee3a4514e46489b6562805eba4ff14a56aa754 |     
    i686     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/302161e30b42532247f4fe1b05215017c502cf84 |     
   mips64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/1080bc1145e2f5bbf1fe423b26bca8178f9666ec |     
   s390x     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/db82025388829486260099dc9eb490a665e9e2ff |     
  mips64el   |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/1d6b9820c5a927546945d1d987e79833624bd33f |     
 microblaze  |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/5ab9371d0e10179ec212ada0db6cdacffd2c7357 |     
  riscv64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/88f85b8bd5222343d9def77fce3dd9a76046ec42 |     
   mipsel    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/7df9088625be25051cc10c70c1309c8359ab64c3 |     
   sparc     |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/f51c61a4a3858cc4f2e071641d8b6ccee557eff9 |     
microblazeel |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/64fe6356988db1fdfa231997a1a8e55653435900 |     
   sparc     |     host-gcc-final-10.4.0      | NOK | http://autobuild.buildroot.net/results/ba2c7c1b4ea7a5534e0c88720aae72931c9883c1 |     
microblazeel |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/df84db3f09cc5918bbf1f01af40570539ec92ad7 |     
    arm      |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/0ee2d485287836e0c71b1dbc03f5b25c79a7e3a0 |     
   armeb     |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/f809bc8cba576a6929262e6df35a87f0259a6ea5 |     
    arm      |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/e7a1b1641aee83bc37721d45bbbe80f68fec77fd |     
   arceb     | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/e6f99030b525f69289203c28a61dd98912a3738a | ORPH
    i586     |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/4bc95a18f70216777bea340334baa40a7cf71611 |     
  mips64el   |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/f96dc41c836d03b7b878487213aca4d3b7240c5d |     
  mips64el   |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/521bb07ec56e89f5a1acfe26f9e53f22de9e3a96 |     
    i686     |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/eaf618b32bcc8bdb05a7f76e966f6d4320e5465f |     
  mips64el   |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/09014f9a71b1ce71319155ab2f009192c3d2ff5e |     
powerpc64le  |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/dd9118f8ce0764ea0030d8995e6e0e9b91aa7ef2 |     
    i686     |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/f3863a1eceb6154bdbacf767a04b535694aa2c7f |     
  mips64el   |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/659f913b04c225408de74428a4427c16e2ad3a04 |     
   mips64    |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/efd2ddfdbe91986462510dabd2c37173cdfafaf4 |     
  mips64el   |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/d8a6e40f5140780852084336496dfc68ae5e87b4 |     
   mips64    |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/34a2a1a39b825a35865c184d78868b48e2b97622 |     
   x86_64    |   host-moby-buildkit-0.10.0    | NOK | http://autobuild.buildroot.net/results/b1849afba1bef1a405c1c1eca58176a7065f6e98 |     
   armeb     | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/e0c29bafd4c599db956e2e832c9aa176687d2c3f |     
  powerpc    | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/4c9ce0f368a950674df2a45579018d2a826e98dd |     
  mips64el   | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/d08a47e79bed51023f5eaae26412f79cc0b5a779 |     
   nios2     | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/b85a8a102c6b1bcb1b4ae6a0963f9a8987fc9383 |     
   s390x     |        host-rust-1.62.0        | NOK | http://autobuild.buildroot.net/results/84961434957e30348eb9fc81c9c9c306af1c5cd2 |     
   armeb     |        host-rust-1.62.0        | NOK | http://autobuild.buildroot.net/results/e2528abae78b8537156528152f5750eee0ba1c0c |     
  aarch64    |        host-rust-1.62.0        | NOK | http://autobuild.buildroot.net/results/ad3747d92021641bbfa14024eb4894b5c7ee7167 |     
  aarch64    |        host-rust-1.62.0        | NOK | http://autobuild.buildroot.net/results/684ad097a336a69a093544fb0aac5799938288e3 |     
powerpc64le  |        host-rust-1.62.0        | NOK | http://autobuild.buildroot.net/results/b96da8d61e965735120e85bb3483a0d53c77fbd6 |     
  sparc64    |        host-rust-1.62.0        | NOK | http://autobuild.buildroot.net/results/d6dfae1a67857bd9646b34e86b4b57f82ad294a4 |     
  sparc64    |        host-rust-1.62.0        | NOK | http://autobuild.buildroot.net/results/ea28405912ba9fbbcf1bd3b4d5568182c9176cd6 |     
   armeb     | host-spirv-llvm-translator-... | NOK | http://autobuild.buildroot.net/results/1af90b97f0d0d0838246164052bc4510202aae0b | ORPH
   s390x     |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/daa43f5d37666f27cf8abf9554348a599b06f179 |     
 microblaze  |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/ce2afd27200b42f2ebfcc67cc902080e7800b07c |     
   nios2     |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/eac13b5d7496b9747b6de3246f2d173f90b9b6c7 |     
 aarch64_be  |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/4a85f8359ab257d5df93074fee78401483b6a584 |     
   mipsel    |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/d2ab76af0e4aba15df23d1bceed59f5fe59d5eb3 |     
   xtensa    |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/463f49dad57004cd897776d76b5ecd62cb81e853 |     
   x86_64    |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/d7cc03dd1204cbb09f6bdbbc54dfaba13b89b6df |     
  powerpc    |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/7e378a5f8e80b981f21277617c7c0c0cace3a36c |     
    m68k     |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/b96ebb1fc4ec4f9cd18bd2345099af4c28a2e19c |     
powerpc64le  |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/535e2a234bdb2300b2e323a3496906ebf27ce35d |     
   mipsel    |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/b85be91fe13f77bf92de03835630a38ba9754fe0 |     
microblazeel |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/b73aae402853425f4441155fa192a99503ec5b4f |     
powerpc64le  |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/18804507358389989f4413cd8435b9b3ae9a4e29 |     
 powerpc64   |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/4290340672407d3f11fe48b3d7829046edeea0c4 |     
    m68k     |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/d55008f32b3b3c4ab086087de7a40f9fd05b9d7c |     
   x86_64    |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.net/results/5713b30325c704be82f8191e18d0978be45cabc9 |     
   x86_64    |         jailhouse-0.12         | NOK | http://autobuild.buildroot.net/results/073cdafc227846e8c3f26ff1c295fdc3e541d1f7 |     
   armeb     |          kexec-2.0.25          | NOK | http://autobuild.buildroot.net/results/dfe5718ee9e1d8f88822d74802b8d3e5a8a5be8b | ORPH
  riscv64    |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/dbefa40fb599c7ae6ca56231eff6aed3ad43d23c |     
   sparc     | libdill-32d0e8b733416208e04... | NOK | http://autobuild.buildroot.net/results/5bfba19ac2e6fd33341bcfd0d3aa461ff055ed73 |     
  mips64el   |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/418f52cce88de6690cf2fa17adb83fb620b822c9 |     
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/42abef7d81128a221540b70043e41faad1ed634e | ORPH
    i586     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/668607dfe0e2c0a294d75aed776c0eb5854a8239 | ORPH
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/c1659cbc446eece005a45b34bc79bdb993f14e07 |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/74d3b6a54e5d99e213ba7a9a7c7d8f5bf8d3f0e2 |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/3adcd36de1081c6c227bff1a8d6e80bb5990cfed |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/ff88044f3a3ea6569161e073fe4341520de9f315 |     
    m68k     |         libglvnd-1.4.0         | NOK | http://autobuild.buildroot.net/results/95738df85614080a044fd87139a8bbe747393a19 | ORPH
  aarch64    |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/dbf6495024e09a8157451366b78af1837e308da0 | ORPH
  aarch64    |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/06a81ca6a6122a4510473dce74018d8b8b8dbd36 | ORPH
   sparc     |          libiio-0.24           | NOK | http://autobuild.buildroot.net/results/f88959e7248512559756571e6816b588c2406d1f |     
   sparc     |          libiio-0.24           | NOK | http://autobuild.buildroot.net/results/79f00e458a28a827be775d34d5f04a5e4e565ef4 |     
 microblaze  |        libmdbx-0.11.11         | NOK | http://autobuild.buildroot.net/results/032470b75a946983a73b7a5bb20898f6b2cf4fa6 |     
   mips64    |          libnl-3.6.0           | NOK | http://autobuild.buildroot.net/results/33a06faabf65c8539b74d04eafcf6800e3c1bbd2 | ORPH
    or1k     |          libnss-3.83           | NOK | http://autobuild.buildroot.net/results/82d1fa4671d9b7136bd3f4c9c578d8ede4b33fc3 |     
   mipsel    |          libqb-2.0.6           | NOK | http://autobuild.buildroot.net/results/d38dd6512c2841b4c8e0a136353c30f24003a54b |     
  powerpc    |        libvorbis-1.3.7         | NOK | http://autobuild.buildroot.net/results/961a92789c90dbdff696bb3cb64935f14cec9261 |     
    sh4a     |      linux-5.10.115-cip7       | NOK | http://autobuild.buildroot.net/results/93031b2dcf605ed29691ee08fb586ac027c75105 | ORPH
powerpc64le  |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/5868db5f7dc1441bb0eca55965806467299e1074 | ORPH
    m68k     |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/4fbf564735a132c828eefbe9f5d7aeb8da6f8bac | ORPH
   mipsel    |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/e8551fdc49a3957f5dc5329d7e21d23dedbd5699 | ORPH
   mips64    |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/921ab581931e65bf4333fed01251851d09cb93dd | ORPH
    mips     |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/9c6437e5502e5e0fa78bec0ff25004b807a0de32 | ORPH
  powerpc    |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/d4d80cc26e38e6b5faf1a147ccd68d8b80c5ba34 | ORPH
   sh4aeb    |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/24ad3a4ee8f81182932d10ad8331e99ac9de1e4f | ORPH
    mips     |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/b8a97d40ef4f969b646aa61a5d4d48e3b6d847f7 | ORPH
  riscv64    |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/6ab64ca56d4dd9e2ab850439365b0615e426462d | ORPH
    m68k     |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/dff8bc454b136a4a740054c5889063183dfb2249 | ORPH
   mipsel    |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/7d577c48131358af6bff4193cd4be330c8e5f528 | ORPH
  riscv64    |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/ea568b90f8bd8966f468cf439a18e7fc7b21d56a | ORPH
   s390x     |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/09798c3daafe10329de62caba14172fa6ddcd8ba | ORPH
    arc      |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/59447c759731ec4209b3261ad4a12b55c478e582 | ORPH
   arceb     |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/f3c9498c3a4100215daaf8cca1030e554d8af765 | ORPH
    sh4a     |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/7cc7e9fed2a792088fc5865173110c3bd7ff96df | ORPH
    i686     |        linux-pam-1.5.2         | NOK | http://autobuild.buildroot.net/results/b1ee64b80b92189a0177c07f905ba500495cc046 | ORPH
    i686     |          linux-tools           | NOK | http://autobuild.buildroot.net/results/7866c201599b11e79450ef2ec4504e2f6441e530 | ORPH
microblazeel |          linux-tools           | NOK | http://autobuild.buildroot.net/results/504ec8be1ebd15c5da09f8b90bb723a58d4c58c5 | ORPH
    arm      |        liquid-dsp-1.4.0        | NOK | http://autobuild.buildroot.net/results/d2a63f146cbb83a7105e2e85b2b805ed61f66338 |     
  aarch64    |     ltp-testsuite-20220527     | NOK | http://autobuild.buildroot.net/results/80e8759abdf76e55cb534da6c689b707243ad0ab |     
  sparc64    |      lttng-modules-2.13.1      | NOK | http://autobuild.buildroot.net/results/eec3fec0918ae870ec6d8ece8126cb0e5295a729 |     
    m68k     |        memcached-1.6.16        | NOK | http://autobuild.buildroot.net/results/f9777731b3fe11b60483d29baab6da6dd78b346a | ORPH
  mips64el   |         moarvm-2022.06         | NOK | http://autobuild.buildroot.net/results/eeb453826457af7751392b5900c78965bf3c552d |     
    or1k     |        mosquitto-2.0.15        | NOK | http://autobuild.buildroot.net/results/b66381e6fc4590d60aca5da17a80dc94e216d4ca |     
  powerpc    |           musl-1.2.3           | NOK | http://autobuild.buildroot.net/results/88fea198902d39f09cfb4791fcd2ef6fe4772de7 |     
    arm      |     mxs-bootlets-10.12.01      | NOK | http://autobuild.buildroot.net/results/4e301ad85f6018682ce1153280842a0919749abd | ORPH
   mipsel    |         nodejs-16.16.0         | NOK | http://autobuild.buildroot.net/results/66aae6ab17159e711f627ff04bc243456372dc01 |     
  riscv64    |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/8a7197ea72c74d8648075173cd8fe4dea9e27554 | ORPH
microblazeel |          ntpsec-1_2_1          | NOK | http://autobuild.buildroot.net/results/0c7278dfdd59c3a1e7a1cc100cfca37c7987b6e3 |     
   mipsel    |         openal-1.22.0          | NOK | http://autobuild.buildroot.net/results/c573ddf869746ff76c68c8cd8b204d03f994a17e |     
   mipsel    |        openpgm-5-3-128         | NOK | http://autobuild.buildroot.net/results/af03148a8c91f104734dcb019d4adb3f285212cb |     
   mipsel    |        openpgm-5-3-128         | NOK | http://autobuild.buildroot.net/results/b73e5127e1c6fe926f7615962b5a8f66d4d451c9 |     
  sparc64    |         openssh-9.0p1          | NOK | http://autobuild.buildroot.net/results/80b874e6dd8887e2fbb9a0368997f204db837fca | ORPH
microblazeel |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/4c827365a49e7692de475de5b0a47572c46faf77 |     
    arc      |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/4858cc84055644087873adba44c1d8bcf9987489 |     
   xtensa    |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/19685a882ace3278e0a1291e89b1572fee40b03c |     
 microblaze  |           php-8.1.9            | NOK | http://autobuild.buildroot.net/results/bce05f2e35052b47edae93cbcbfe088e053f16ef |     
   armeb     |           php-8.1.9            | NOK | http://autobuild.buildroot.net/results/ad5ac5ec9ba3c971bf30e2b5fc00a782bf0a2671 |     
 microblaze  |           php-8.1.9            | NOK | http://autobuild.buildroot.net/results/74c319164b70c98d9c6533938f67e10ad282a92a |     
    m68k     |         protobuf-21.5          | NOK | http://autobuild.buildroot.net/results/396c6dcc29d81bf59cf92debf8e99cb38131acab |     
   armeb     |           pv-1.6.20            | NOK | http://autobuild.buildroot.net/results/c9d7229b4a372f7db4400dc06fa538377e071179 | ORPH
   arceb     |         python3-3.10.7         | NOK | http://autobuild.buildroot.net/results/9a78589795fae3071975d76dc6815cad64811bb5 |     
   mipsel    |         qt6base-6.3.2          | NOK | http://autobuild.buildroot.net/results/544cdaa3f4e0fa57b54223ca8de838706561226c |     
 microblaze  |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/235d274e9a14c85035cf2ef2d397037a11a1d562 |     
   armeb     | ripgrep-af6b6c543b224d348a8... | NOK | http://autobuild.buildroot.net/results/3e2e10c81c24094cec7ffdc9d669b2b97d53ea5e |     
   xtensa    | rtl8189es-39c17661136da48f8... | NOK | http://autobuild.buildroot.net/results/03f4fad41606e723ac5d8fbb76028a01194cf319 |     
  riscv64    | rtl8812au-aircrack-ng-e7a4a... | NOK | http://autobuild.buildroot.net/results/0fd12a1979a84066eb0264c1c134a84cef3fed4e |     
  riscv64    |           ruby-3.1.2           | NOK | http://autobuild.buildroot.net/results/80fc6b1cbff07275f59bf14674f81d2a7f222dbd |     
    or1k     |        skalibs-2.10.0.3        | NOK | http://autobuild.buildroot.net/results/857f80e291307efc42d3b196cdcf61d4466f493f |     
   mipsel    |         tealdeer-1.5.0         | NOK | http://autobuild.buildroot.net/results/5b7708c773d6a9528dfd19dd4c352617400ba65c |     
  sparc64    |         tealdeer-1.5.0         | NOK | http://autobuild.buildroot.net/results/8c32fb26cd965e8c6c33456e49d4c57474de7f03 |     
 powerpc64   |         tealdeer-1.5.0         | NOK | http://autobuild.buildroot.net/results/0ed7a10427fe5022d37c08b16d7883b46f6f7dd9 |     
   s390x     |         tealdeer-1.5.0         | NOK | http://autobuild.buildroot.net/results/43e106c5070a8508ed9a5bd30abfaa40f70aad90 |     
  aarch64    | toolchain-external-arm-aarc... | NOK | http://autobuild.buildroot.net/results/09f57c5b7e2779af5c71a97649f894def7ce389e | ORPH
 aarch64_be  | toolchain-external-arm-aarc... | NOK | http://autobuild.buildroot.net/results/8119516f4e02bc3a97dcf749989d8750450f15fc | ORPH
    mips     | toolchain-external-codescap... | NOK | http://autobuild.buildroot.net/results/187341e2da48b2a431a75c5fdede05fa46a75638 | ORPH
   mips64    | toolchain-external-codescap... | NOK | http://autobuild.buildroot.net/results/d4558ec7304937264301495443ef3c241152309d | ORPH
  powerpc    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/b62822997155857c39c65ba8e9ff38c95949a56c |     
   s390x     |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/e026efdc4128a958cd5969b53ce661406897aa68 |     
powerpc64le  | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/efad0661b53dfa09d5ab4769db8378825b302c88 |     
 microblaze  |            unknown             | NOK | http://autobuild.buildroot.net/results/db823d105843439abe1d925631f6bdc714d8768a |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.net/results/1f03fc2b0da924fd0dca832979dcc32f456fb1d5 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/dfc30b932d3881a54b49f719487d16f5843bdf00 |     
   s390x     |            unknown             | NOK | http://autobuild.buildroot.net/results/1a37da07f4c909903dd7863f99d22d758140df1e |     
   sparc     |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/9b2fc383eb210bc2050a3e8d9347e6fead541c92 |     
   sparc     |      wayland-utils-1.1.0       | NOK | http://autobuild.buildroot.net/results/ae298debca5b0998d6116d5eeea76c7b166d9df8 |     
   nios2     |      wayland-utils-1.1.0       | NOK | http://autobuild.buildroot.net/results/a13e5bc4893a2057097aad268152212858c8e966 |     
    arc      |      wayland-utils-1.1.0       | NOK | http://autobuild.buildroot.net/results/83f161a0cd218d870d174b97f92a72bbc538e7d2 |     
  mips64el   |         wolfssl-5.5.0          | NOK | http://autobuild.buildroot.net/results/0d46e1b5a011e82e7ab4d4c2378ddf77a7d55073 |     
  mips64el   |         wolfssl-5.5.0          | NOK | http://autobuild.buildroot.net/results/6ef763e88f88e3bcf8a6b5c190bde8b9fcbc9f8c |     
    arm      |         wolfssl-5.5.0          | NOK | http://autobuild.buildroot.net/results/f531e5d338767ab137691581a49b002483169056 |     
   armeb     |         wolfssl-5.5.0          | NOK | http://autobuild.buildroot.net/results/cea0bba6b4100d9ccdbef495645c34f4e72828b6 |     
  mips64el   |         wtfutil-0.41.0         | NOK | http://autobuild.buildroot.net/results/6ea0b734934df8c9f08a8957068fe3f9da65fe54 |     
    i686     | x264-baee400fa9ced6f5481a72... | NOK | http://autobuild.buildroot.net/results/81f52bec11e07990d17d9191290ef0c9b572ebd7 |     
   x86_64    |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/2b01ba54ee0fc79157c15a3d36d3abf29269e14c |     
 powerpc64   |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/1d72f8639d13d647c20e848b0444695baa520877 |     
  riscv32    |          xvisor-0.3.1          | NOK | http://autobuild.buildroot.net/results/3eadd8a8eae1cc945b0a24bc99f1aae4105a48b6 |     
  riscv32    |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/1295b20bb88155ffdd0eab7885f73505833183aa |     
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/e65e2d270e2f60a0f843a0fb9dfad8f419ae20ea | ORPH


Classification of failures by reason for 2022.02.x
--------------------------------------------------

                 wavemon-0.9.4 | 2 
         graphicsmagick-1.3.37 | 1 
                       libuwsc | 1 
                 wolfssl-5.5.0 | 1 


Detail of failures for 2022.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mipsel    |     graphicsmagick-1.3.37      | NOK | http://autobuild.buildroot.net/results/c8d8ca49a90e178f079d8e7ff08cf951cddcb115 |     
   nios2     |            libuwsc             | TIM | http://autobuild.buildroot.net/results/92c6f7243772a0300c95c6a728ffd06bcee88621 |     
  mips64el   |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/735a1e85ec1830d46f2b8a4c59a18d9e88030138 |     
  riscv32    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/47ad77806603a409b1f82084f2f62099863c2cde |     
    arm      |         wolfssl-5.5.0          | NOK | http://autobuild.buildroot.net/results/73f26465aea77e85308c9fe5031a65f936223a0d |     


Classification of failures by reason for 2022.05.x
--------------------------------------------------

         graphicsmagick-1.3.37 | 4 
               gocryptfs-2.2.1 | 2 
               libglib2-2.70.4 | 2 
/home/buildroot/autobuild/i... | 1 
host-gdb-arc-2020.09-releas... | 1 
                ipmiutil-3.1.8 | 1 
              libgcrypt-1.10.1 | 1 
             libopenssl-1.1.1q | 1 
       linux-5.10.109-cip5-rt4 | 1 
                 linux-5.17.15 | 1 
                   linux-tools | 1 
              memcached-1.6.12 | 1 
                   perl-5.34.1 | 1 
      qt5webkit-5.212.0-alpha4 | 1 
                     refpolicy | 1 
                wtfutil-0.41.0 | 1 
                       xenomai | 1 
                  zabbix-5.4.9 | 1 


Detail of failures for 2022.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 powerpc64   | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/2942add92254ed91fa19947156bd43c166770a5d |     
   x86_64    |        gocryptfs-2.2.1         | NOK | http://autobuild.buildroot.net/results/c5cd970eaa05ad94c8662ebd93f899bdf5004701 |     
  aarch64    |        gocryptfs-2.2.1         | NOK | http://autobuild.buildroot.net/results/311f0c8fc0ecf138513b4950f0a4538a492a6e43 |     
    i686     |     graphicsmagick-1.3.37      | NOK | http://autobuild.buildroot.net/results/418c30da39f0366b31ccddcafab838fcf4e1e0d6 |     
  riscv64    |     graphicsmagick-1.3.37      | NOK | http://autobuild.buildroot.net/results/3b4b3ad883b76c1c6fb6f96bdecb1a78a3f3a959 |     
   sh4aeb    |     graphicsmagick-1.3.37      | NOK | http://autobuild.buildroot.net/results/9d3020cb7a2ee7f36dad3328c3ae4ba062f29ce2 |     
    arm      |     graphicsmagick-1.3.37      | NOK | http://autobuild.buildroot.net/results/cd03a608428cd6286063c826df2d708bc135a0c4 |     
    arc      | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/3d053042112293b3c64c54aa00dcc8f5b116ede4 | ORPH
   x86_64    |         ipmiutil-3.1.8         | NOK | http://autobuild.buildroot.net/results/a2a949e0061a8e715443dad106d8af910cccee7a |     
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/c172f3e484eea81061a939938aa9194a87871144 | ORPH
    arc      |        libglib2-2.70.4         | NOK | http://autobuild.buildroot.net/results/ae75028c77263ca9c7247dcdcaa781f3f783663a |     
   arceb     |        libglib2-2.70.4         | NOK | http://autobuild.buildroot.net/results/90be74209b4f9f1afec9d193a959a6018db141b3 |     
    arc      |       libopenssl-1.1.1q        | NOK | http://autobuild.buildroot.net/results/efe31fda98388d73eb464873d9baf5fcbc002534 |     
    m68k     |    linux-5.10.109-cip5-rt4     | NOK | http://autobuild.buildroot.net/results/967cbfb02711e298953695f4537ed31ad6304165 | ORPH
   nios2     |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/56670da0a9723df4587d9eeeebcaf9009a2536cc | ORPH
  powerpc    |          linux-tools           | NOK | http://autobuild.buildroot.net/results/bc0c0edcb54a3a8b227145c6ca6737d8a1ee1e9a | ORPH
microblazeel |        memcached-1.6.12        | NOK | http://autobuild.buildroot.net/results/e46b168a97bd78facfc762085512eba71901f812 | ORPH
microblazeel |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/b8d595557b4bbfafbd8bede6dfdb85d702d1e562 |     
    arm      |    qt5webkit-5.212.0-alpha4    | NOK | http://autobuild.buildroot.net/results/6aa6ce5f2ca14c702684296f2aaf61591a696c6f |     
  aarch64    |           refpolicy            | NOK | http://autobuild.buildroot.net/results/cfb549e83b8590fdf5ccfbc7c530b3e7626c0c57 |     
   x86_64    |         wtfutil-0.41.0         | NOK | http://autobuild.buildroot.net/results/a63b0ee9e4c5c9fd72e93c6724914d625c222617 |     
   mips64    |            xenomai             | NOK | http://autobuild.buildroot.net/results/9e8750ad8da22ef46bc2129228635636b617b057 |     
    mips     |          zabbix-5.4.9          | NOK | http://autobuild.buildroot.net/results/77683c5ba6191f75bd4ab555939c41e5f08f1970 |     



-- 
http://autobuild.buildroot.net

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

