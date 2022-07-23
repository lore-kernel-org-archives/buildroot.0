Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B06E6C43334
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 05:38:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EF3E860FAE;
	Sat, 23 Jul 2022 05:38:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EF3E860FAE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7_x0waN0kh6f; Sat, 23 Jul 2022 05:38:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F110960FA8;
	Sat, 23 Jul 2022 05:38:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F110960FA8
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 144C11BF5F5
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 05:38:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A9472422C4
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 05:38:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A9472422C4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fps5WxLf8c1a for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 05:37:57 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 09975414E7
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 09975414E7
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 05:37:56 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id AE114FF806
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 05:37:53 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sat, 23 Jul 2022 05:37:53 -0000
Message-Id: <20220723053800.A9472422C4@smtp4.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1658554673; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=2ZWJVxj+x9N9oXmhvxstmhMNlaV/TWSREtQhTzpXWUo=;
 b=I1JAUv0kAke5RLMngof0OGAkGkX7RDCsSpeg6IHT3ymnbbggh2C1RrwrnQOqd4eaSFXSDK
 7sZrpCcNXoTvVBtNiaHj0eWx7BJiHocHdOl90StgUKd3Qq14NnVDjw+m+iCiaIihRSWLV9
 fbKwBBKt8bfxDESEFbuOBgV9BuDAN+gEDDi2UN/yQM3ide7gGgw8PdV3iSgtK/xPcIoT85
 SxabSilSfu0RGCKgdxu+RB3zzX6IgcKsDnl6qQp4TaT/7KOOPlo4W7GZ7XuODGasUJggDB
 6wzXvtjfDkwfNBYuQdL4NHRTl1CFr3gCmboXrN/KP4sy5hHQgyWEICW52bqwSw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=I1JAUv0k
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-07-22
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

Autobuild statistics for 2022-07-22
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  | 18  |  5  |  0  | 23  |
  2022.05.x  | 20  | 15  |  0  | 35  |
    master   | 116 | 143 |  0  | 259 |

Classification of failures by reason for master
-----------------------------------------------

                 linux-5.17.15 | 8 
                 uclibc-1.0.41 | 8 
                   speex-1.2.1 | 7 
                speexdsp-1.2.1 | 7 
host-pahole-73383b3a39afe86... | 6 
              open62541-v1.3.1 | 6 
                       unknown | 6 
              bluez-alsa-4.0.0 | 5 
                iptables-1.8.8 | 5 
               protobuf-3.20.1 | 5 
                   tor-0.4.7.8 | 5 
                host-go-1.18.3 | 4 
           libfreeimage-3.18.0 | 4 
                     refpolicy | 4 
              swupdate-2022.05 | 4 
                busybox-1.35.0 | 3 
                     frr-8.2.2 | 3 
                 fdk-aac-2.0.2 | 2 
glibc-2.35-134-gb6aade18a7e... | 2 
         host-gcc-final-11.3.0 | 2 
host-spirv-llvm-translator-... | 2 
               libglib2-2.72.3 | 2 
             libgpg-error-1.45 | 2 
               libvorbis-1.3.7 | 2 
                    nettle-3.8 | 2 
               openpgm-5-3-128 | 2 
                 sudo-1.9.11p2 | 2 
                 zlib-ng-2.0.6 | 2 
             18xx-ti-utils-8.8 | 1 
                  acpid-2.0.33 | 1 
               apcupsd-3.14.14 | 1 
                  check-0.15.2 | 1 
dahdi-linux-5c840cf43838e06... | 1 
                 dash-0.5.11.5 | 1 
              dieharder-3.31.1 | 1 
fs/ubi/ubi.mk:51: /home/aut... | 1 
                    glog-0.6.0 | 1 
  gobject-introspection-1.70.0 | 1 
               gocryptfs-2.2.1 | 1 
                harfbuzz-4.4.1 | 1 
         host-gcc-final-10.3.0 | 1 
           host-harfbuzz-4.4.1 | 1 
         host-protobuf-c-1.4.0 | 1 
              host-rust-1.60.0 | 1 
                  janet-1.22.0 | 1 
                libcurl-7.84.0 | 1 
             libopenssl-1.1.1q | 1 
           linux-5.10.115-cip7 | 1 
                   linux-tools | 1 
make: *** wait: No child pr... | 1 
make: *** Waiting for unfin... | 1 
                mongodb-4.2.18 | 1 
                     php-8.1.8 | 1 
                      pigz-2.7 | 1 
                 pixman-0.40.0 | 1 
                    putty-0.76 | 1 
            python-ujson-5.2.0 | 1 
               valgrind-3.19.0 | 1 
                zerofree-1.1.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |       18xx-ti-utils-8.8        | NOK | http://autobuild.buildroot.net/results/8a886218ab1259b9408b18e4658af41fb1f14e33 |     
  mips64el   |          acpid-2.0.33          | NOK | http://autobuild.buildroot.net/results/f6448f0ab5ad9a2c991d74e4fc5d4e65a493157b | ORPH
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/6aeb66434a074a8bd83bc91b610b4d970475e19b |     
powerpc64le  |        bluez-alsa-4.0.0        | NOK | http://autobuild.buildroot.net/results/01fe981908f3e1b812683d95489b3952c63c4287 |     
  aarch64    |        bluez-alsa-4.0.0        | NOK | http://autobuild.buildroot.net/results/85f3e296225ddd9bc65b0ee3a0920aa2b6744e25 |     
    arm      |        bluez-alsa-4.0.0        | NOK | http://autobuild.buildroot.net/results/ef0673a893ead2e5f3197dfbbff59820147d0852 |     
  powerpc    |        bluez-alsa-4.0.0        | NOK | http://autobuild.buildroot.net/results/e4fdb6d95ebbcfede897291020eec05f2741a6be |     
  aarch64    |        bluez-alsa-4.0.0        | NOK | http://autobuild.buildroot.net/results/329fd4adac43fe229e6f0b65ef2d77de6d3e45ca |     
  riscv64    |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/a6dfabeda2af72dd48c6aa8fa4fbdeff4e3ebb56 | ORPH
    m68k     |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/ae863d5073cee8988b05fdcbf8a07a7d1bf7342e | ORPH
    m68k     |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/87ae050ea6e381069c54a86efe2a24067d1fb291 | ORPH
  mips64el   |          check-0.15.2          | NOK | http://autobuild.buildroot.net/results/2e89b84bb68f536abb234931986343693e6386c8 | ORPH
    arc      | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/c3a608d04ae4b99343ee716882d21868cb80a976 |     
    sh4      |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/689472bc64d00f91c5d495059c49b9983a8d5bd4 | ORPH
microblazeel |        dieharder-3.31.1        | NOK | http://autobuild.buildroot.net/results/5fb575c16461085862158d84127a356630570c07 |     
   mipsel    |         fdk-aac-2.0.2          | NOK | http://autobuild.buildroot.net/results/eb9eb4b85782ec14e208141c86f42ac4e4b5adee |     
   x86_64    |         fdk-aac-2.0.2          | NOK | http://autobuild.buildroot.net/results/444dac578d2569150eed9d3cc1ffc6269390d5d5 |     
   xtensa    |           frr-8.2.2            | NOK | http://autobuild.buildroot.net/results/fa87dec153f2b820879d77417de921d61409f576 |     
    arc      |           frr-8.2.2            | NOK | http://autobuild.buildroot.net/results/79fa726e39a8b5f9dfcaad12a879fee38958ad5f |     
    arc      |           frr-8.2.2            | NOK | http://autobuild.buildroot.net/results/c121a719cae006782e9f71d2e7d35f6dce98afdf |     
   arceb     | fs/ubi/ubi.mk:51: /home/aut... | NOK | http://autobuild.buildroot.net/results/5da997562dab0d43a0c1d838feccac82a4c85157 |     
   sh4aeb    | glibc-2.35-134-gb6aade18a7e... | NOK | http://autobuild.buildroot.net/results/bc173dc5de1a84f8a7a40b82a219d7b628b99aa1 |     
  powerpc    | glibc-2.35-134-gb6aade18a7e... | NOK | http://autobuild.buildroot.net/results/20a9bcd733fe8394919b407b32c3a6b76c8ff419 |     
  mips64el   |           glog-0.6.0           | NOK | http://autobuild.buildroot.net/results/193defd246eb2117e5bb5b2b3b6f6435efa4e81f |     
   nios2     |  gobject-introspection-1.70.0  | NOK | http://autobuild.buildroot.net/results/eefaba912cd276b3d8b341ce6ba4c7f259686622 | ORPH
  riscv64    |        gocryptfs-2.2.1         | NOK | http://autobuild.buildroot.net/results/fd1ec6441f5cd6b5cab3905068f2d20021b16e2d |     
  mips64el   |         harfbuzz-4.4.1         | NOK | http://autobuild.buildroot.net/results/c21b76a17561631729e4f314d6923d887f61ecfa |     
   x86_64    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/8f9732f4448a49a9682b520cfa4c094c0e85aa9e |     
  riscv64    |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/695616f558131f1376c64259fade980ff5190473 |     
   x86_64    |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/a4e6c899bed835d82dd8692cfb39cd4cff0ce0ea |     
  aarch64    |         host-go-1.18.3         | NOK | http://autobuild.buildroot.net/results/d74f9a3121e74ab97f5b1e25614e11af792c2c7d |     
  mips64el   |         host-go-1.18.3         | NOK | http://autobuild.buildroot.net/results/4943f9ed2f735994098ef98e36d7baa75806dcc4 |     
  mips64el   |         host-go-1.18.3         | NOK | http://autobuild.buildroot.net/results/da93e66e53965601c4e6e34067bd94596182a38b |     
    i686     |         host-go-1.18.3         | NOK | http://autobuild.buildroot.net/results/86ad158f759892e47c66cf39a36da0d5faf3c5ab |     
  powerpc    |      host-harfbuzz-4.4.1       | NOK | http://autobuild.buildroot.net/results/96fd5d4fa361dbe71f97ca8df7357eb2f1bb6ad5 |     
  sparc64    | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/47dbc72e0466a23801835d4b70dc9734cbcfabae |     
    or1k     | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/1b3993f8a39a8b2004ebfac51762150dc042c989 |     
    arc      | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/5456fc42d7649c1e1ca4af55e5a07f5482afdf1f |     
   mips64    | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/9acaabe79c5af2a284da51b3c9eee92203866bac |     
 powerpc64   | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/dceeba19a82e4a39ce5bfce910666c75aa61820d |     
   arceb     | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/f263a98dd011bb71a1448ce4441de9c278618635 |     
  sparc64    |     host-protobuf-c-1.4.0      | NOK | http://autobuild.buildroot.net/results/5ecdb77ed38281a7e43c0a6773eb785e4f6ac5a9 |     
  sparc64    |        host-rust-1.60.0        | NOK | http://autobuild.buildroot.net/results/334053571de37f1b113765fe60f6977ff50ff17b |     
   x86_64    | host-spirv-llvm-translator-... | NOK | http://autobuild.buildroot.net/results/5861dfd3db99a169d782df5c1550f76b73416da3 | ORPH
    arm      | host-spirv-llvm-translator-... | NOK | http://autobuild.buildroot.net/results/1ba395409620d7168ac1283d6b485f8f62fe545a | ORPH
    arm      |         iptables-1.8.8         | NOK | http://autobuild.buildroot.net/results/ac6124fdbe96454c0cc96528dc26d8d10820fbda | ORPH
  mips64el   |         iptables-1.8.8         | NOK | http://autobuild.buildroot.net/results/47633e2c159bf8e432c574a481913a72e01a3893 | ORPH
    arm      |         iptables-1.8.8         | NOK | http://autobuild.buildroot.net/results/3c986be704860b24c718ad966e742db2bf33ade9 | ORPH
    arm      |         iptables-1.8.8         | NOK | http://autobuild.buildroot.net/results/5f01461419c13e53e329ccc982dee82ecc5f1d5d | ORPH
    i686     |         iptables-1.8.8         | NOK | http://autobuild.buildroot.net/results/bda8fa21839a0b40a3cd69e44cd1a986a436c87e | ORPH
microblazeel |          janet-1.22.0          | NOK | http://autobuild.buildroot.net/results/2886474d6dd0608c1b8d2e9b826a2ff97875ff9c |     
microblazeel |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/eac6c1674522cf43384ba62bd930834dffe3710c |     
microblazeel |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/2b721e55d2effef89a0c6f4c19f3498f5cd69d8e |     
 powerpc64   |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/65f8cbcd4cd36391783bb1aa8bdedd2ad09e1dd2 |     
  riscv64    |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/b1863354c4fbf622eac21032f6764f8094c994de |     
   xtensa    |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/6f774706f712df71afe8b77e32290b8cddf896a3 |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/0c7d984f18d48f2b7e3dec9aece8f97f4aa90151 |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/2fba7df52b794fd2e17b656bfb40059366780a30 |     
  aarch64    |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/155b8c16d0a0845d95adaa0430c09f128f99a421 | ORPH
  aarch64    |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/a7186ffd0081dbfa21d3507014392214b54fd6e7 | ORPH
   sparc     |       libopenssl-1.1.1q        | NOK | http://autobuild.buildroot.net/results/96b81ac90c5476a015615c63477977a1eaf99b48 |     
  powerpc    |        libvorbis-1.3.7         | NOK | http://autobuild.buildroot.net/results/e99170fd1714d5126d49c9b969be82834d51b1d9 |     
  powerpc    |        libvorbis-1.3.7         | NOK | http://autobuild.buildroot.net/results/6bc93dd4dad1a2ae924037580b512809c601e74c |     
    arm      |      linux-5.10.115-cip7       | NOK | http://autobuild.buildroot.net/results/13018a2585bb06c04eadeb578162fd118354f9cf | ORPH
   sh4eb     |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/d039e3d90497a09c939b80128a552ae6d47f1078 | ORPH
 aarch64_be  |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/0858df7a6a89945ab0844e5fb173609562e41593 | ORPH
    mips     |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/bf9936a2c1cd506fdbf32890f4e34e947ce41c43 | ORPH
   armeb     |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/7e401c667e1f70b3b28a8221da7d928450cef971 | ORPH
   armeb     |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/8e1feb5fbce8b9ecd9d7b0249301ed84b693440f | ORPH
 aarch64_be  |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/03024359c1c9b57d481d10d9c38d440017d178d7 | ORPH
 aarch64_be  |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/bfe6c879e7ee419b7b9fd949a205bf2cc257b988 | ORPH
    i686     |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/c9770c29e93cd93b7dd7897137b64ca771b1448c | ORPH
   s390x     |          linux-tools           | NOK | http://autobuild.buildroot.net/results/089a62b8ec6a9ba25e1710a6c3f656afd3deec42 | ORPH
   s390x     | make: *** wait: No child pr... | NOK | http://autobuild.buildroot.net/results/d82bface71b6c76d6114430017b6c921a99ecac2 |     
    or1k     | make: *** Waiting for unfin... | NOK | http://autobuild.buildroot.net/results/2cd24aafc67be15807e030dcbd08c21633419add |     
   x86_64    |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/007abdddaa755cfaefeefea21fb2a40916176e14 |     
   nios2     |           nettle-3.8           | NOK | http://autobuild.buildroot.net/results/6e5c576e8363de4c0f821db40c36d6c1445269cc | ORPH
    mips     |           nettle-3.8           | NOK | http://autobuild.buildroot.net/results/30e1f8e548852b94f25c51551723570e6d8c9d85 | ORPH
  aarch64    |        open62541-v1.3.1        | NOK | http://autobuild.buildroot.net/results/a0a0ccd24c386d50c9afdc726db379dab29d2565 | ORPH
   arceb     |        open62541-v1.3.1        | NOK | http://autobuild.buildroot.net/results/a854ce87a95ead32d29309545184fa2b178bbf1a | ORPH
   sparc     |        open62541-v1.3.1        | NOK | http://autobuild.buildroot.net/results/b17a742858a044b3d9c7e6cc3f962af908195ae1 | ORPH
 microblaze  |        open62541-v1.3.1        | NOK | http://autobuild.buildroot.net/results/0aa39e812d8745e4bad0152990fa694e784009be | ORPH
 microblaze  |        open62541-v1.3.1        | NOK | http://autobuild.buildroot.net/results/b1ac6e7507e1a3af68a88a9d6d7985b7d00bc1c8 | ORPH
 powerpc64   |        open62541-v1.3.1        | NOK | http://autobuild.buildroot.net/results/a2dd59122b7853c427907caaf9f2336510c9d9d9 | ORPH
  sparc64    |        openpgm-5-3-128         | NOK | http://autobuild.buildroot.net/results/d4034f753bdce77e3b6aa650df29abe3bdc7f2b1 |     
powerpc64le  |        openpgm-5-3-128         | NOK | http://autobuild.buildroot.net/results/9ae5fd585406b41629e7ae23f92588cbd6a09e84 |     
 microblaze  |           php-8.1.8            | NOK | http://autobuild.buildroot.net/results/10f86242595f904318c7a5a4b9349c909cc235d1 |     
microblazeel |            pigz-2.7            | NOK | http://autobuild.buildroot.net/results/c2c81d58df7e65912642a165c6752a734a0b6169 |     
powerpc64le  |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/474b99695fd976d3eb74361862f4eff9f151ea6b |     
    or1k     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/0152c423f8d63b160d97a65058fd0d699346ee77 |     
    m68k     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/dad8aaeb9f2dfef84308ecc5d07db34012f1ef79 |     
   nios2     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/5125f587fa494750a5ee1f347266a861e955330e |     
   nios2     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/254419e05bb046e5f59cf80635156393538db9b9 |     
    arc      |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/fa31189a90bd0824694c8686293f1e1de27b9361 |     
  aarch64    |           putty-0.76           | NOK | http://autobuild.buildroot.net/results/cc09a854bad12a291d0f6f678e3f6ed09d583dbb |     
   nios2     |       python-ujson-5.2.0       | NOK | http://autobuild.buildroot.net/results/ce2a663b0a23ad61a1efb6ed919825d4e0358468 |     
   armeb     |           refpolicy            | NOK | http://autobuild.buildroot.net/results/b11e593e7d0550296bc9d6ae5d9beeafc1754f07 |     
    i686     |           refpolicy            | NOK | http://autobuild.buildroot.net/results/d10c431b6c1c9b949070245d25f62c4c5c2ca938 |     
 aarch64_be  |           refpolicy            | NOK | http://autobuild.buildroot.net/results/cbbc30676ecd12b06b24d03c01fab9a95dd9535f |     
  mips64el   |           refpolicy            | NOK | http://autobuild.buildroot.net/results/b7aff4109660d1351e39446af7acda7310600e29 |     
   mips64    |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/c0bb11b675073fda09a53228731e120698af19de | ORPH
 microblaze  |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/1d7c946b01820d6294935d01602fde94421eb1af | ORPH
 powerpc64   |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/8b1853912ca949048d5b991d75a1e977d80e3316 | ORPH
   sh4eb     |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/9521a0197c6551e123055fe5413f1efc89a13389 | ORPH
 microblaze  |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/1bd7241e3376d38a23d00d06485d4ef102f4d048 | ORPH
   sh4eb     |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/451438895af719959da17d9908882b5cb6279735 | ORPH
   sh4eb     |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/5d22db76b9f7bec4889341e3b75c7a3737785be5 | ORPH
 aarch64_be  |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/e124dabc88c7fb21747494e7b701649491a13ecf | ORPH
  riscv32    |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/c3a52fa9edded09424775e7ab6f89f2cea69c754 | ORPH
   sh4aeb    |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/5a21585d617cbcd5c5538ea75fca77331d581e0b | ORPH
microblazeel |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/9057526c29f2fad4bfec234fc77efbdb8a4ed7d6 | ORPH
  mips64el   |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/ad7dcd0e5b879dc716bb6d15fa0feca54290258f | ORPH
   s390x     |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/0b928eccf3122909f79711077f05260c4db23598 | ORPH
   s390x     |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/587d22dae252f79ad561b27861e206ce5610055f | ORPH
    i686     |         sudo-1.9.11p2          | NOK | http://autobuild.buildroot.net/results/c48aa7d4196630be19d0e7b51953f5f6604be458 | ORPH
  riscv32    |         sudo-1.9.11p2          | NOK | http://autobuild.buildroot.net/results/fd4210a0a6c63397527daaf8651446b43de8dd64 | ORPH
    mips     |        swupdate-2022.05        | NOK | http://autobuild.buildroot.net/results/39340c1da9b15692677f74de2f01d7ba60669740 |     
    arm      |        swupdate-2022.05        | NOK | http://autobuild.buildroot.net/results/7da454ade7adcb612193cefd27681d9094d5e551 |     
   mipsel    |        swupdate-2022.05        | NOK | http://autobuild.buildroot.net/results/aa080912c37fb8f9f4fb8fc96c3f0d053a334840 |     
    m68k     |        swupdate-2022.05        | NOK | http://autobuild.buildroot.net/results/46dc484759549162ec246e0bff2647995c307ab5 |     
  riscv64    |          tor-0.4.7.8           | NOK | http://autobuild.buildroot.net/results/786a5fb2b265684d5117a56737876ee62d47b498 |     
    i686     |          tor-0.4.7.8           | NOK | http://autobuild.buildroot.net/results/4c24a096c63321a4606b1f0e5888ac5b9cfb3d63 |     
    arc      |          tor-0.4.7.8           | NOK | http://autobuild.buildroot.net/results/e89037c573d8c9844c52a86270d3ca64620b4c64 |     
  sparc64    |          tor-0.4.7.8           | NOK | http://autobuild.buildroot.net/results/1b2f452825f726e35b19cd07cdc86bcd3d5c5b3d |     
    arc      |          tor-0.4.7.8           | NOK | http://autobuild.buildroot.net/results/6654aa21620c4691b938ea8559e67d770f4f391f |     
    arc      |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/f457671c3c5d8cf87ed0b8d64321f09084c61e6f |     
    arc      |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/1e73b8c1bbf390da525aaf486970edfe0b644c5f |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/2b8b0dc2acb30874000430799accc57bce43ac8c |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/38e9d9a76f1877e7952ad5c20a405382642fd227 |     
  riscv64    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/7011108bdc891a7d1099e8881fa29ccba605ed76 |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/6b71ae3843650462e66985d56f5d23bfa6b1556f |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/57d3d5ab4e3bdc9a512bd48bd37cbf327229a2fb |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/c6b4e69d5a440f241070b1cd237b7f2c95da0e9e |     
powerpc64le  |            unknown             | NOK | http://autobuild.buildroot.net/results/dda7e74739c60ac3347f915c74e37b1c2152a28f |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/1d18b07fa764ef5cf5cda73f46a26d4d2a9604fe |     
   sparc     |            unknown             | NOK | http://autobuild.buildroot.net/results/fe2212fe925eba27229b81c025386fba3af21edf |     
  riscv32    |            unknown             | NOK | http://autobuild.buildroot.net/results/fc94acb02b838e9270c206a4f98adbbe31a65250 |     
    m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/4965cb501a9ca2cd923c5de8cbe69a356ff43daf |     
   arceb     |            unknown             | NOK | http://autobuild.buildroot.net/results/87694969999bbfa1ff436bf6ca1d2ccb6a5c86a1 |     
   mips64    |        valgrind-3.19.0         | NOK | http://autobuild.buildroot.net/results/fdd1db811e489afbffd565e3f42dd88c07d66f9f | ORPH
  riscv32    |         zerofree-1.1.1         | NOK | http://autobuild.buildroot.net/results/8fc09fcb48d43c24e16f1e988d933db979abe083 |     
  aarch64    |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/d72fbd9892256bf536f76032152f96cbb5a7bf7b | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/1ac782825e897981d932b405ca60cd2ec4b3b8cb | ORPH


Classification of failures by reason for 2022.02.x
--------------------------------------------------

           libfreeimage-3.18.0 | 2 
                  exempi-2.6.1 | 1 
               poppler-21.12.0 | 1 
                       unknown | 1 


Detail of failures for 2022.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |          exempi-2.6.1          | NOK | http://autobuild.buildroot.net/results/855c9f8a81547d0be9a73d3cca71ff2f3d58780f |     
   nios2     |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/828580100f88b1603da4e2a4ecf8b4421f96df8a |     
  sparc64    |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/89a4f9128d150ca65f7ed394e3d0ea8d6da49680 |     
   xtensa    |        poppler-21.12.0         | NOK | http://autobuild.buildroot.net/results/a796c7f38ea0e0c54388fb5ff502d62862631a62 |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/c24ba98e3cea6802c80cc76c25a42bfa51e9332f |     


Classification of failures by reason for 2022.05.x
--------------------------------------------------

                       unknown | 3 
                libcurl-7.84.0 | 2 
               protobuf-3.20.1 | 2 
                    brltty-6.4 | 1 
                elfutils-0.186 | 1 
                     frr-8.2.2 | 1 
glibc-2.35-96-g2c4fc8e5ca74... | 1 
                 pixman-0.40.0 | 1 
                     refpolicy | 1 
                   tor-0.4.7.8 | 1 
                 uclibc-1.0.41 | 1 


Detail of failures for 2022.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 microblaze  |           brltty-6.4           | NOK | http://autobuild.buildroot.net/results/ca595c18c21ab53ec694ca8581338ae89a412b26 |     
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/bf37189806594ab154242acc563f184996a9405d | ORPH
   xtensa    |           frr-8.2.2            | NOK | http://autobuild.buildroot.net/results/eddd94ce2416d5e11cf8847cda35499fee0ce920 |     
   nios2     | glibc-2.35-96-g2c4fc8e5ca74... | NOK | http://autobuild.buildroot.net/results/ad13ca12d710264a3bd28b8baa8cbda305b60e62 |     
   sparc     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/5a2fd6b669133e076dd3462e54263cdfbdd8d170 |     
   sparc     |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/ba63c085666cbbbee4d6b97ef058c4d8049827c9 |     
powerpc64le  |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/6113d236af34f4c463f91da5b32c920710da9769 |     
    or1k     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/3620a61e63de6b6b6c56ace0c7d5c4dbac075646 |     
    sh4      |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/b27345c638b9cb2b36d853eee77c949664eec241 |     
  mips64el   |           refpolicy            | NOK | http://autobuild.buildroot.net/results/ad251f61289a0b43e95376c824b143d784e7a59a |     
  riscv64    |          tor-0.4.7.8           | NOK | http://autobuild.buildroot.net/results/fb445e51107f1f1faa3c4a11ee728fcf8ad2c4f4 |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/e571379d3a3ce75385f435f84ee7e6d2424d64a9 |     
powerpc64le  |            unknown             | NOK | http://autobuild.buildroot.net/results/5cd95f3f1651cc68c54a92a64f639265771abd54 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/b948de4b16b87fa523c234c9136130a8eb2a2fa1 |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/fa4c6675bba2d9c76df2d7771d6086ae9c795051 |     


Gitlab CI results for 2022-07-22
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
                amarula_a64_relic | https://gitlab.com/buildroot.org/buildroot/-/jobs/2750359059  |      
                         arm_juno | https://gitlab.com/buildroot.org/buildroot/-/jobs/2750359071  |      
                aspeed_ast2500evb | https://gitlab.com/buildroot.org/buildroot/-/jobs/2750359079  |      
                      bananapi_m1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2750359161  |      
                 bananapi_m1_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/2750359236  |      
                 bananapi_m2_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/2750359239  |      
                     bananapi_m64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2750359248  |      
                        bananapro | https://gitlab.com/buildroot.org/buildroot/-/jobs/2750359252  |      
                     csky_gx6605s | https://gitlab.com/buildroot.org/buildroot/-/jobs/2750359289  |      
              freescale_imx8mmevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/2750359442  |      
              freescale_imx8qmmek | https://gitlab.com/buildroot.org/buildroot/-/jobs/2750359544  |      
           friendlyarm_nanopi_a64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2750359569  |      
            friendlyarm_nanopi_m1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2750359578  | ORPH 
       friendlyarm_nanopi_m1_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/2750359583  | ORPH 
           friendlyarm_nanopi_neo | https://gitlab.com/buildroot.org/buildroot/-/jobs/2750359630  |      
          friendlyarm_nanopi_neo2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2750359604  |      
          friendlyarm_nanopi_neo4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2750359625  |      
     friendlyarm_nanopi_neo_plus2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2750359634  |      
            friendlyarm_nanopi_r1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2750359658  |      
           friendlyarm_nanopi_r2s | https://gitlab.com/buildroot.org/buildroot/-/jobs/2750359681  |      
                          galileo | https://gitlab.com/buildroot.org/buildroot/-/jobs/2750359718  |      
                   imx6-sabreauto | https://gitlab.com/buildroot.org/buildroot/-/jobs/2750359827  |      
                       imx6ulpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/2750360000  |      
                       imx8mmpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/2750360050  |      
                        imx8mpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/2750360055  |      
               kontron_pitx_imx8m | https://gitlab.com/buildroot.org/buildroot/-/jobs/2750360083  |      
                    licheepi_zero | https://gitlab.com/buildroot.org/buildroot/-/jobs/2750360107  |      
        minnowboard_max-graphical | https://gitlab.com/buildroot.org/buildroot/-/jobs/2750360139  |      
                orangepi_one_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/2750360298  |      
                     orangepi_pc2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2750360299  |      
                    orangepi_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/2750360305  | ORPH 
                   orangepi_prime | https://gitlab.com/buildroot.org/buildroot/-/jobs/2750360306  |      
                  orangepi_rk3399 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2750360308  |      
                     orangepi_win | https://gitlab.com/buildroot.org/buildroot/-/jobs/2750360309  |      
               orangepi_zero_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/2750360313  |      
                       pandaboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/2750360315  |      
                           pine64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2750360320  |      
                    pine64_sopine | https://gitlab.com/buildroot.org/buildroot/-/jobs/2750360323  |      
                qemu_m68k_mcf5208 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2750360340  |      
                 qemu_nios2_10m50 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2750360371  |      
            qemu_ppc64le_powernv8 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2750360375  |      
                qemu_riscv32_virt | https://gitlab.com/buildroot.org/buildroot/-/jobs/2750360388  |      
                 qemu_xtensa_lx60 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2750360410  |      
           qemu_xtensa_lx60_nommu | https://gitlab.com/buildroot.org/buildroot/-/jobs/2750360411  |      
                     raspberrypi0 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2750360413  |      
                    raspberrypi0w | https://gitlab.com/buildroot.org/buildroot/-/jobs/2750360414  |      
                     raspberrypi2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2750360416  |      
                  raspberrypi3_64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2750360417  |      
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/2750360422  |      
              stm32mp157c_odyssey | https://gitlab.com/buildroot.org/buildroot/-/jobs/2750360481  |      
        terasic_de10nano_cyclone5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2750360483  |      
                            warp7 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2750360490  |      
                        warpboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/2750360491  |      
                    zynq_microzed | https://gitlab.com/buildroot.org/buildroot/-/jobs/2750360492  |      
                      zynq_qmtech | https://gitlab.com/buildroot.org/buildroot/-/jobs/2750360493  |      
                       zynq_zc706 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2750360494  |      
                         zynq_zed | https://gitlab.com/buildroot.org/buildroot/-/jobs/2750360496  |      
                zynqmp_kria_kv260 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2750360497  |      
                    zynqmp_zcu102 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2750360498  |      
                    zynqmp_zcu106 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2750360499  |      



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
