Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81251E95A80
	for <buildroot@archiver.kernel.org>; Sun,  8 Oct 2023 05:38:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EFAF560B68;
	Sun,  8 Oct 2023 05:38:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EFAF560B68
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jNtCLSGh5Z3c; Sun,  8 Oct 2023 05:38:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7664760BAB;
	Sun,  8 Oct 2023 05:38:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7664760BAB
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B55141BF25B
 for <buildroot@lists.busybox.net>; Sun,  8 Oct 2023 05:38:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 62DEE419C3
 for <buildroot@lists.busybox.net>; Sun,  8 Oct 2023 05:38:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 62DEE419C3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id laiusrnbREC6 for <buildroot@lists.busybox.net>;
 Sun,  8 Oct 2023 05:38:32 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4154941974
 for <buildroot@buildroot.org>; Sun,  8 Oct 2023 05:38:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4154941974
Received: by mail.gandi.net (Postfix) with ESMTPSA id 03C5FC0007
 for <buildroot@buildroot.org>; Sun,  8 Oct 2023 05:38:28 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sun, 08 Oct 2023 05:38:28 -0000
X-GND-Sasl: bot@bootlin.com
Message-Id: <20231008053835.62DEE419C3@smtp4.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1696743509; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=deBF49cF4nzQmxgnlKO46x6rjhM+imMqMIGDlQL/n/E=;
 b=pcEB8r/KOo3kkdnZTAuWwMl1PbNFNf0P6cYF5V4HKVEXCgN5roQT+9YpNQ2RRnOWKJA2A/
 q5d5JX2lKJVqX/qdUAJ/qm07HfWdDj0w4+v2jmtQvTjecoBtXESgn7Z7XK1k5EgsZ2WX8a
 74K5QXq9vPdX8i1iM1ybGZXTkMZr43u0vALxBzKLWYYDmZGDJ6WeNnSPm+VjgX+/p2bkbp
 fHjF/+vmRa7j/ducuCuTXkqAzFzKhQpbGvuDMWNvjQ9tFTzR88G32wAOTODHA7ER5SwTpt
 OCBXoR01w4Hg2juV370X7zzQnWTMbnABCz+5Xv//HUcdN9+7KnQynTAoaE73Gw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=pcEB8r/K
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-10-07
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

Autobuild statistics for 2023-10-07
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  | 18  |  6  |  0  | 24  |
  2023.08.x  | 15  |  8  |  0  | 23  |
    master   | 96  | 143 |  0  | 239 |

Classification of failures by reason for master
-----------------------------------------------

                 openrc-0.43.3 | 18
                   bird-2.0.12 | 12
               alsa-lib-1.2.10 | 9 
         spirv-tools-1.3.261.1 | 8 
                       unknown | 8 
  gobject-introspection-1.76.1 | 7 
             alsa-utils-1.2.10 | 4 
              gcc-final-12.3.0 | 4 
glibc-2.38-27-g750a45a78390... | 4 
google-breakpad-c85eb4a59b6... | 4 
                  monit-5.33.0 | 4 
                elfutils-0.189 | 3 
              host-rust-1.71.1 | 3 
                   linux-6.5.5 | 3 
                  conmon-2.1.8 | 2 
                 coreutils-9.3 | 2 
        host-sentry-cli-2.20.3 | 2 
              libarchive-3.7.2 | 2 
            libmemcached-1.1.4 | 2 
     linux-5.10.162-cip24-rt10 | 2 
              liquid-dsp-1.5.0 | 2 
                    php-8.2.11 | 2 
                     squid-6.2 | 2 
                  acpid-2.0.34 | 1 
               apcupsd-3.14.14 | 1 
                  boost-1.83.0 | 1 
                   bullet-3.21 | 1 
                  cairo-1.16.0 | 1 
check-11970a7e112dfe243a2e6... | 1 
                   cpuload-0.3 | 1 
          cryptodev-linux-1.13 | 1 
        edk2-edk2-stable202308 | 1 
                      fio-3.34 | 1 
           flatbuffers-23.5.26 | 1 
              gcc-final-11.4.0 | 1 
              gcc-final-13.2.0 | 1 
            host-erlang-26.0.2 | 1 
         host-gcc-final-13.2.0 | 1 
                host-go-1.21.1 | 1 
host-go-bootstrap-stage2-1.... | 1 
kvmtool-f77d646ba01d04be5aa... | 1 
                    lcms2-2.15 | 1 
              libopenssl-3.1.3 | 1 
                libselinux-3.5 | 1 
               mariadb-10.11.4 | 1 
              memcached-1.6.21 | 1 
                  motion-4.5.1 | 1 
                 netsnmp-5.9.4 | 1 
   openvmtools-11.3.5-18557794 | 1 
                     pound-4.8 | 1 
                     pv-1.6.20 | 1 
              skalibs-2.12.0.1 | 1 
                   systemd-254 | 1 
                tpm2-tss-3.2.2 | 1 
             util-linux-2.39.2 | 1 
               valgrind-3.21.0 | 1 
                 zlib-ng-2.1.3 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |          acpid-2.0.34          | NOK | http://autobuild.buildroot.net/results/2d9b7a82cf6e0b30b4746d53475a522486becb40 | ORPH
    or1k     |        alsa-lib-1.2.10         | NOK | http://autobuild.buildroot.net/results/adbc3708a2575b8c35faeb782cadce794afe6175 |     
powerpc64le  |        alsa-lib-1.2.10         | NOK | http://autobuild.buildroot.net/results/eaf2fd899537d12c2c31749ad913932ffd6d287f |     
   x86_64    |        alsa-lib-1.2.10         | NOK | http://autobuild.buildroot.net/results/4c647e0f680d148ba3a67f754e7baccbd13b17c7 |     
    or1k     |        alsa-lib-1.2.10         | NOK | http://autobuild.buildroot.net/results/1a6ca1f9c83e9295cd688f00550431269a351db5 |     
microblazeel |        alsa-lib-1.2.10         | NOK | http://autobuild.buildroot.net/results/b4263e4e7df1d804b4b543d40a02ee298a8694a1 |     
    i686     |        alsa-lib-1.2.10         | NOK | http://autobuild.buildroot.net/results/543bd45d18fc8e395ef5c2c2e54e068b998751f8 |     
 aarch64_be  |        alsa-lib-1.2.10         | NOK | http://autobuild.buildroot.net/results/baa87e2fa9ee5223dc1c455ffe6238b2c5a87afb |     
 aarch64_be  |        alsa-lib-1.2.10         | NOK | http://autobuild.buildroot.net/results/7ceebba4389ef0a95d1581f2e7f5fd6ea4e7cdb8 |     
  powerpc    |        alsa-lib-1.2.10         | NOK | http://autobuild.buildroot.net/results/9e5a85b426e6eb09deed07650705325d9f326d21 |     
    arm      |       alsa-utils-1.2.10        | NOK | http://autobuild.buildroot.net/results/6430e41d4f52ed77e89b40c0f024830769b0688f |     
   arceb     |       alsa-utils-1.2.10        | NOK | http://autobuild.buildroot.net/results/ef78b81988be72c2745a6bcd7d6bcb9bcbd892c9 |     
   mips64    |       alsa-utils-1.2.10        | NOK | http://autobuild.buildroot.net/results/7137209e59f1c6d588cc68da82ab71a6a284582e |     
  riscv32    |       alsa-utils-1.2.10        | NOK | http://autobuild.buildroot.net/results/0c1c35996e70004cea9044b72cca379972b2c9a9 |     
  mips64el   |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/38ccb0feecf71a9e8db3de2f9070929377a5797c |     
    or1k     |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/92351cbd55b712d4d44b4e7e46881f0cf40d8394 |     
   arceb     |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/efb5c3d811d42e5734a4e4494566df5e7608324d |     
 microblaze  |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/6fcb6e9ef580955b459ce0efafaa7d88d0164102 |     
    arm      |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/b53739966e995bb47980d913ca82b4b928771fda |     
   x86_64    |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/0aca1131a471aab52fe3579f03e53b89f3b3204c |     
   mipsel    |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/8e9b80dfbd8f095e93abf8716fb714e7e9451cfa |     
powerpc64le  |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/7ee9da352baad127f1970a24a178ae22187abdbe |     
   mipsel    |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/2d48915db31327ac1dc2a9378b33ced1c2bf6acc |     
    mips     |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/494cb348e0ab0abd42d87e6ab43165c9ad5e2544 |     
    sh4      |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/e1f9e12fc4a86114e553f4692f71de76625ab61c |     
   xtensa    |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/0c487188103b298cc6ff84899863e0b63a8524c3 |     
    mips     |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/6cf7b187dfc03964b4abc76894312fc1e7ef5a45 |     
    or1k     |          boost-1.83.0          | NOK | http://autobuild.buildroot.net/results/21088c2b4bcedbba6f15b5a9aaa68736b718ccc6 |     
   xtensa    |          bullet-3.21           | NOK | http://autobuild.buildroot.net/results/a7d51995debe518cdb1d60aac12584b492ddd3f2 |     
   xtensa    |          cairo-1.16.0          | NOK | http://autobuild.buildroot.net/results/00f3abaab8825f070957119881c3f5ccba0d48f7 |     
    mips     | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/28c0231e4724c01c82f9f38525313a6aada29163 | ORPH
  aarch64    |          conmon-2.1.8          | NOK | http://autobuild.buildroot.net/results/a3f550ae79bf42074d1c8a3c9a3c8c52d0797de6 |     
   mipsel    |          conmon-2.1.8          | NOK | http://autobuild.buildroot.net/results/a3ed99f47aee2dae7e3223cfc1de546d3c425f22 |     
   nios2     |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/f6c023123c7efeb8954503a034f5788c801f93fc | ORPH
    arm      |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/7d36981bd262dd4f4a50babef820e0e76d6a9af1 | ORPH
   arceb     |          cpuload-0.3           | NOK | http://autobuild.buildroot.net/results/d23914e6000caa6586e68a75a736fc9276efac8c |     
 powerpc64   |      cryptodev-linux-1.13      | NOK | http://autobuild.buildroot.net/results/34aba5d41658d37440547f1c9e3b0c4b5f2b464d | ORPH
   x86_64    |     edk2-edk2-stable202308     | NOK | http://autobuild.buildroot.net/results/d9a92934f62d4841c02ce3af7da2eb0f2e4b7a03 |     
  powerpc    |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/eb4cdd89600ab39e86dcb221a044745ea8a20af5 | ORPH
  powerpc    |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/f6e34636c79f4bd4a7c874c8ac3e2b239dfe760f | ORPH
   arceb     |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/5f5b783b4b61278a1d95663056ca54ff16a02d24 | ORPH
    mips     |            fio-3.34            | NOK | http://autobuild.buildroot.net/results/9b604eadadcafcc5613c865b732aec5eb8d74c68 |     
    m68k     |      flatbuffers-23.5.26       | NOK | http://autobuild.buildroot.net/results/a159367bf02e28d71dc8d4c97f60b90c76161331 |     
   mips64    |        gcc-final-11.4.0        | NOK | http://autobuild.buildroot.net/results/c9732dafff9f44c5f61326524fbde74e3ff3fb17 |     
  riscv64    |        gcc-final-12.3.0        | NOK | http://autobuild.buildroot.net/results/bf6c14da0a55ed9d9d6a4e8089710943ca5945bb |     
   mips64    |        gcc-final-12.3.0        | NOK | http://autobuild.buildroot.net/results/ca97671884a4fa3d21f80261a830f53af8463b78 |     
  riscv64    |        gcc-final-12.3.0        | NOK | http://autobuild.buildroot.net/results/22c796474f0d17c56ee39b8027fe476e845c3d28 |     
 aarch64_be  |        gcc-final-12.3.0        | NOK | http://autobuild.buildroot.net/results/d3adaf956c50dbe79d3c1ef6e365e195cdd0f49b |     
   xtensa    |        gcc-final-13.2.0        | NOK | http://autobuild.buildroot.net/results/3b07bc0eb6c7a3ddb31836c0e8da6db73d258015 |     
 powerpc64   | glibc-2.38-27-g750a45a78390... | NOK | http://autobuild.buildroot.net/results/e851d99aee011093d8e8771d4026485c59816f1e |     
powerpc64le  | glibc-2.38-27-g750a45a78390... | NOK | http://autobuild.buildroot.net/results/5e4953c429c535136f621039bb25a684c533ff1b |     
 powerpc64   | glibc-2.38-27-g750a45a78390... | NOK | http://autobuild.buildroot.net/results/0afb72385579111572d39c425f28ef4161c2a030 |     
 powerpc64   | glibc-2.38-27-g750a45a78390... | NOK | http://autobuild.buildroot.net/results/77cea31375de775fe723e54cdd0a82b216cd4ee4 |     
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/08a305e3de3ef2273c19cfb1aa93f03c1b9a31f5 | ORPH
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/c72bcb2d8c18d8f0a6089012389cac6e9415079f | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/e80192229fd13a6b319a974175f6d8d0100baf6c | ORPH
   sh4aeb    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/09687e4690a574baf8b7e64eede5b243e950cfe7 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/18069be9ecf6e1878745410a6912403529449f88 | ORPH
   mipsel    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/0e9ca55ae0cdb3b60ae2a37a67a3de3db2f26a84 | ORPH
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/7ac3eb243faa3231677be9e0bcca33f2d2805d03 | ORPH
    i686     | google-breakpad-c85eb4a59b6... | NOK | http://autobuild.buildroot.net/results/81b0a8c14141309c6d759b61d7addd7b71377bbf |     
   mipsel    | google-breakpad-c85eb4a59b6... | NOK | http://autobuild.buildroot.net/results/a11b8b16a89654ac7b8583c04e3cc20027deae39 |     
   x86_64    | google-breakpad-c85eb4a59b6... | NOK | http://autobuild.buildroot.net/results/db1d68d31e26f154f398a528bd2423d743831da2 |     
   mipsel    | google-breakpad-c85eb4a59b6... | NOK | http://autobuild.buildroot.net/results/be960970896f5b14968a479e6ff831b66bcbbc3b |     
   x86_64    |       host-erlang-26.0.2       | NOK | http://autobuild.buildroot.net/results/202f06dd639ddf6548975bc42d867f6aa8f918eb |     
  powerpc    |     host-gcc-final-13.2.0      | NOK | http://autobuild.buildroot.net/results/5371e7f77369d7b52f7f56492c986f04c97d639e |     
  mips64el   |         host-go-1.21.1         | NOK | http://autobuild.buildroot.net/results/986b83c2754fc3bd87d6758155edee326b3924de |     
  riscv64    | host-go-bootstrap-stage2-1.... | NOK | http://autobuild.buildroot.net/results/b3674df5cb61f302ff33478a91c62d57e725efec |     
   x86_64    |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/4d9517307e3d9da1e04856fd890513b68a569459 |     
  sparc64    |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/c0ffe09d4157706c7d493e93332a3d60c4cb1cb9 |     
   armeb     |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/f085ed5918bec6be1d84e867c9038a555d260eb8 |     
    or1k     |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/55176fe4be2eeadddb056023c8fd75b05e7c0b95 |     
   mipsel    |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/a3d70f680c7ed3a9603765d91f640fd63b523622 |     
   x86_64    | kvmtool-f77d646ba01d04be5aa... | NOK | http://autobuild.buildroot.net/results/a9a8d12ae3a037503405f50eead3172cbcce976c | ORPH
  powerpc    |           lcms2-2.15           | NOK | http://autobuild.buildroot.net/results/50a501343d0715872ff7919d615154a1759a4948 |     
  aarch64    |        libarchive-3.7.2        | NOK | http://autobuild.buildroot.net/results/abaaa65c0ed4abe59723494dcfc400d5222c5858 |     
   x86_64    |        libarchive-3.7.2        | NOK | http://autobuild.buildroot.net/results/e3364d5ba51e69fb7d307f23f87a0af350572497 |     
    arm      |       libmemcached-1.1.4       | NOK | http://autobuild.buildroot.net/results/ea5468597c1f6ab12e186d9eae796adbdd005666 | ORPH
   sparc     |       libmemcached-1.1.4       | NOK | http://autobuild.buildroot.net/results/c8e4e1f9609d1339fe070afe440c63660892600e | ORPH
    arm      |        libopenssl-3.1.3        | NOK | http://autobuild.buildroot.net/results/727da5fa493907f9821f9732813c8d6dd67259da | ORPH
    or1k     |         libselinux-3.5         | NOK | http://autobuild.buildroot.net/results/10113bd377c1c0e77b2e43858182fe0ca01fcc42 |     
    m68k     |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/0b47fc48793a17c58c1b4e6adcdc703ec305e826 | ORPH
    mips     |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/8eacc23298ca190300fde9ca2fba26b39d4ab54b | ORPH
 powerpc64   |          linux-6.5.5           | NOK | http://autobuild.buildroot.net/results/e37c6ab73fcfe7fde5b3ff8559e696a33dafd8cb | ORPH
   arceb     |          linux-6.5.5           | NOK | http://autobuild.buildroot.net/results/284aa41d823efe4aaaf4cf6e04cb300fe1544b7b | ORPH
 powerpc64   |          linux-6.5.5           | NOK | http://autobuild.buildroot.net/results/f53766324e8a7413a18791d72030938575c0d913 | ORPH
   x86_64    |        liquid-dsp-1.5.0        | NOK | http://autobuild.buildroot.net/results/785014444f80355987a017f5eae76ba37188deda |     
   x86_64    |        liquid-dsp-1.5.0        | NOK | http://autobuild.buildroot.net/results/9d155f66b06ce8e2c36c36981c53e342afc6551f |     
microblazeel |        mariadb-10.11.4         | NOK | http://autobuild.buildroot.net/results/1864e37e59c96ab7389810c1277a1df0a39745d8 | ORPH
    or1k     |        memcached-1.6.21        | NOK | http://autobuild.buildroot.net/results/e1bdb1615f0e1f61763d728ec514cf48d0d6943a | ORPH
    mips     |          monit-5.33.0          | NOK | http://autobuild.buildroot.net/results/9c0564678f8d01e4a43806a1e2ba21b89bf5c9f2 |     
    arc      |          monit-5.33.0          | NOK | http://autobuild.buildroot.net/results/f7a07448e36abc5e5f48e140d6ed566980b54a66 |     
 microblaze  |          monit-5.33.0          | NOK | http://autobuild.buildroot.net/results/515a001f76be31a39af93049adabf9db8a0d5d9b |     
    arc      |          monit-5.33.0          | NOK | http://autobuild.buildroot.net/results/d70a4b8ab9736fb9130630db970827c706c55fc2 |     
 powerpc64   |          motion-4.5.1          | NOK | http://autobuild.buildroot.net/results/042d4ce7edc74a02ad3f4c536346c6feb74d2c9a |     
  mips64el   |         netsnmp-5.9.4          | NOK | http://autobuild.buildroot.net/results/d4cb12bf6d892b3e4ecc363db1ee35fb47ec5da5 | ORPH
   armeb     |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/6a6f8a1e8bd03b1b17454ba492018570c6bcf63a |     
 microblaze  |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/6f3e89c0ac6f06fcdc3089db4556b66d1463dcb6 |     
   s390x     |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/2ffa7a86125772a7e5a5d68b4ec44b493c29e279 |     
  aarch64    |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/804e3b059a228778497097826ae3b895d4fdc6ec |     
   armeb     |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/43ffd497a3f5f76104897ecca419bf845540354d |     
   mipsel    |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/3406992fa1836b30bb0b59c7d5313ed6d0b83ade |     
microblazeel |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/b8caea3d67b4fffdd895692223a9651b03108641 |     
   nios2     |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/6aaae44aef2e4c0ad1eb222847a165e112c60b5d |     
   mipsel    |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/51736dc1c845557bb3da68db1309ea38eb62e92f |     
    or1k     |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/e6bba3e8bdcc8d60b4f6f72f532caed53b695d04 |     
  sparc64    |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/e5c5777ceca625459b0aa72a163cd64e6e81bf02 |     
   s390x     |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/31f822c5b28788c1da48dcb1d6124e58f0ae7f01 |     
   s390x     |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/b28a8bd0f518b3c748bff9838f36742bb08e757c |     
   x86_64    |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/5bc1f8f1482745b86100af331cdc6a641e55ec18 |     
    mips     |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/9a31aaf961d94cc579aba945e8e6a7882c4a4621 |     
 aarch64_be  |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/c069d29a59b97f25ac59fd101732782145ec83a0 |     
  aarch64    |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/bdcf7ead416a21b814bfe60a86743823cea724e8 |     
   s390x     |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/1404607632c2910d24c2e7870b5a38189e5bb16c |     
   x86_64    |  openvmtools-11.3.5-18557794   | NOK | http://autobuild.buildroot.net/results/07baf4c1bc7f6cc61d0e1c5e286da156f4d70a9e |     
   armeb     |           php-8.2.11           | NOK | http://autobuild.buildroot.net/results/9ebcd082a490a58ae74e033645aaf33c17f999f8 |     
   sh4eb     |           php-8.2.11           | NOK | http://autobuild.buildroot.net/results/2278d76768ddaa9fd78e6afb219515047c8aa485 |     
   mipsel    |           pound-4.8            | NOK | http://autobuild.buildroot.net/results/573257807098b3be4be37ee261bf5f9227093ec6 | ORPH
   armeb     |           pv-1.6.20            | NOK | http://autobuild.buildroot.net/results/ad63c9bbb130af53497040cd637ab7ede06eff19 | ORPH
    or1k     |        skalibs-2.12.0.1        | NOK | http://autobuild.buildroot.net/results/c1e02a5b38ac175e1744e198bedfc00835a0e1bf |     
   armeb     |     spirv-tools-1.3.261.1      | NOK | http://autobuild.buildroot.net/results/7a2592d8cb44f9d2a137a59f5875e43d862fb145 | ORPH
   mips64    |     spirv-tools-1.3.261.1      | NOK | http://autobuild.buildroot.net/results/9751bc146d325978843008adcde4663ad3b6aea0 | ORPH
microblazeel |     spirv-tools-1.3.261.1      | NOK | http://autobuild.buildroot.net/results/18e1172ae2e227f305c35a82c372a522c4d878f6 | ORPH
 powerpc64   |     spirv-tools-1.3.261.1      | NOK | http://autobuild.buildroot.net/results/e8e9cdb403f2b1977e645c4d349b79b6bf9bfbe9 | ORPH
   x86_64    |     spirv-tools-1.3.261.1      | NOK | http://autobuild.buildroot.net/results/3a186b2028a211c4bb8ac4c9627c1c75a49d8f76 | ORPH
   mips64    |     spirv-tools-1.3.261.1      | NOK | http://autobuild.buildroot.net/results/fdf505ba05268706e719fea1c21e42055b5b949a | ORPH
    sh4a     |     spirv-tools-1.3.261.1      | NOK | http://autobuild.buildroot.net/results/bda9d55c69695f69407864ffcfa6ef82c29c105e | ORPH
  mips64el   |     spirv-tools-1.3.261.1      | NOK | http://autobuild.buildroot.net/results/afee3af66170d5ed782932ce413dfacf79933f50 | ORPH
   sparc     |           squid-6.2            | NOK | http://autobuild.buildroot.net/results/2129092a5f51d599131055de817dad56e71fb74c | ORPH
  aarch64    |           squid-6.2            | NOK | http://autobuild.buildroot.net/results/b8168738562a3e00531657b7415e3567c9a03c8d | ORPH
  powerpc    |          systemd-254           | NOK | http://autobuild.buildroot.net/results/ae872d45064a37cd33dbf8adc31b606f1133a393 |     
    mips     |         tpm2-tss-3.2.2         | NOK | http://autobuild.buildroot.net/results/820f5f147d9c050bf88804d7eec1d662d8eca10a | ORPH
   s390x     |            unknown             | NOK | http://autobuild.buildroot.net/results/00f0e533dcc4aa8c267505239bc9b661d9e2f414 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/6a7fd6d689ec14dc5b5204c9ba91776e8905693e |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/8bd4be07dc0088d9a76f7d3d7a541ec0b1960db7 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/ed530cce91bed8fa7d02604d17be7811760a25b6 |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/465c3030339f5801a019fab1f479f3190655759f |     
   s390x     |            unknown             | NOK | http://autobuild.buildroot.net/results/1076836d61fdd84c0f375d64cbddcb7e8a86756f |     
 powerpc64   |            unknown             | NOK | http://autobuild.buildroot.net/results/0b512bf3ada923059c35b7b82c4ac68dc27bc628 |     
   mips64    |            unknown             | NOK | http://autobuild.buildroot.net/results/34a58f1201902441d9224267a0739b9756e0c6f6 |     
    sh4      |       util-linux-2.39.2        | NOK | http://autobuild.buildroot.net/results/f2797fbf5f7fa54855ffb2615916fd4bbab6d143 | ORPH
  powerpc    |        valgrind-3.21.0         | NOK | http://autobuild.buildroot.net/results/2eeb33cccdd09f22e0ed723ed0171e0959771e54 | ORPH
    arm      |         zlib-ng-2.1.3          | NOK | http://autobuild.buildroot.net/results/560a69cf60639d4651dfa454c35ead0b76409927 | ORPH


Classification of failures by reason for 2023.02.x
--------------------------------------------------

                   bird-2.0.12 | 1 
                  check-0.15.2 | 1 
                elfutils-0.186 | 1 
              host-rust-1.67.1 | 1 
                       unknown | 1 
                     z3-4.12.1 | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mipsel    |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/67ec5bfda8e6a6409e83ad342965b1ab16cb16b5 |     
    arm      |          check-0.15.2          | NOK | http://autobuild.buildroot.net/results/fb69c7e5f286a3935ab57350b6d87346dbf0bd8e | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/265fa25e7549a15b73d57fa2a79c86b181304e99 | ORPH
    i686     |        host-rust-1.67.1        | NOK | http://autobuild.buildroot.net/results/b168f74b76afaf9a919a4cd29dfd813c78206b8a |     
 microblaze  |            unknown             | NOK | http://autobuild.buildroot.net/results/41144a922e61e9bc8521cac7001a393529868d76 |     
    or1k     |           z3-4.12.1            | NOK | http://autobuild.buildroot.net/results/ed1beb50a948a3c32e425c24cbdcb6adc1d98323 |     


Classification of failures by reason for 2023.08.x
--------------------------------------------------

              liquid-dsp-1.5.0 | 2 
                host-go-1.20.8 | 1 
                   luvi-2.14.0 | 1 
                       unknown | 1 
             util-linux-2.39.1 | 1 
        util-linux-libs-2.39.1 | 1 
                 wolfssl-5.6.3 | 1 


Detail of failures for 2023.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mips64    |         host-go-1.20.8         | NOK | http://autobuild.buildroot.net/results/f7a6a7008bf470d167ec6bd6eebf5d756f45eb12 |     
    i686     |        liquid-dsp-1.5.0        | NOK | http://autobuild.buildroot.net/results/60014472badc5d9d11c63cf45b570f416c196968 |     
    i686     |        liquid-dsp-1.5.0        | NOK | http://autobuild.buildroot.net/results/a5aa2e4e00c530888c9691323671fe0bce118a12 |     
 aarch64_be  |          luvi-2.14.0           | NOK | http://autobuild.buildroot.net/results/2048957a8f3fdb27e75e6624e2c29c7d34930654 | ORPH
   mips64    |            unknown             | NOK | http://autobuild.buildroot.net/results/9556cf8e2f5d967b6e5eec4a09cc446d5a7a12c5 |     
microblazeel |       util-linux-2.39.1        | NOK | http://autobuild.buildroot.net/results/516cec76470adf460d6d585835191b8e6be8c315 | ORPH
    arm      |     util-linux-libs-2.39.1     | NOK | http://autobuild.buildroot.net/results/1b93b1d92116fa72f3a40e1e18774241c89391c2 | ORPH
   x86_64    |         wolfssl-5.6.3          | NOK | http://autobuild.buildroot.net/results/cf19b89ac9d33ed094754cb6412088d621e50618 |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
