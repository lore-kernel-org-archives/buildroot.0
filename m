Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D12BC10F1A
	for <buildroot@archiver.kernel.org>; Sun, 12 May 2024 04:01:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CAC8740015;
	Sun, 12 May 2024 04:01:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FtaqBD53COq5; Sun, 12 May 2024 04:01:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 179CD40347
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 179CD40347;
	Sun, 12 May 2024 04:01:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 03B761BF333
 for <buildroot@lists.busybox.net>; Sun, 12 May 2024 04:01:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E3E8C40347
 for <buildroot@lists.busybox.net>; Sun, 12 May 2024 04:01:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UET_CE2V-MkQ for <buildroot@lists.busybox.net>;
 Sun, 12 May 2024 04:01:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::226;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org DBB8B40015
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DBB8B40015
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DBB8B40015
 for <buildroot@buildroot.org>; Sun, 12 May 2024 04:01:22 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 68315C0003
 for <buildroot@buildroot.org>; Sun, 12 May 2024 04:01:19 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sun, 12 May 2024 04:01:19 -0000
X-GND-Sasl: bot@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1715486479; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=uX18H1FJfHqOj7nZTUlbeh/BRZ/3yQlroLiTbKYzsLE=;
 b=PW9YW4biIKqOWkERKWp2+txm88bpxylnSj6F8opvWfot4uh1XcJYfdqbRljpfJ6HMYVTE0
 lKeej89VjoL9E+LVgPgZOj+UFz/+m1rMnaOF1SH3leQs6ZNOC1ItLzhQZmE3oNhRhJuyzj
 vD2Z+tVo61qCr5I9iTGHwYvgFPthXjm/Z5FYHmUjpeaPpRn0FjbcuutLC6xpX1fG/mdgii
 RNT7Tj1YWJ+LrULQf0diwsrdmAeL6Yuy5UGChtRBvjT1qPQtUmYxPuFSL/sjbVwJQ11cYF
 qilpCALVr2PngKC4X5QdRPWTSUYCSmeZRxa6mkCc6Vj3hyj53BWn3F3Bkfqcgg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=PW9YW4bi
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2024-05-11
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
Message-ID: <20240512040119.DR7aRI-fVvNtRYG1bWYrc1oKsbXbHGWq__u_t5WJ1V4@z>

Hello,

Autobuild statistics for 2024-05-11
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  9  |  9  |  0  | 18  |
    master   | 71  | 96  |  0  | 167 |

Classification of failures by reason for master
-----------------------------------------------

ibm-sw-tpm2-5452af422edeff7... | 6 
                libselinux-3.6 | 6 
                    bat-0.24.0 | 5 
                elfutils-0.189 | 4 
        host-sentry-cli-2.20.3 | 4 
                libressl-3.8.4 | 4 
                       unknown | 4 
check-11970a7e112dfe243a2e6... | 3 
           dmraid-1.0.0.rc16-3 | 3 
                    dust-0.9.0 | 3 
                fail2ban-1.0.2 | 3 
                gnu-efi-3.0.18 | 3 
host-heimdal-f4faaeaba371ff... | 3 
          libcamera-apps-1.2.1 | 3 
                nushell-0.85.0 | 3 
                     crun-1.12 | 2 
                  ffmpeg-6.1.1 | 2 
                   linux-6.8.6 | 2 
             stress-ng-0.17.07 | 2 
                   bird-2.0.12 | 1 
                   botan-3.3.0 | 1 
                 dc3dd-7.2.641 | 1 
        edk2-edk2-stable202308 | 1 
                flannel-0.25.1 | 1 
               freeipmi-1.6.14 | 1 
            gdk-pixbuf-2.42.10 | 1 
                  gnupg2-2.4.5 | 1 
 host-binutils-bare-metal-2.42 | 1 
         host-libxcrypt-4.4.36 | 1 
              host-rust-1.74.1 | 1 
              hyperfine-1.18.0 | 1 
               ipmitool-1_8_19 | 1 
              libarchive-3.7.3 | 1 
                  libffi-3.4.6 | 1 
              libgeotiff-1.7.1 | 1 
                 libp11-0.4.12 | 1 
                   linux-tools | 1 
                   lmdb-0.9.31 | 1 
ltrace-82c66409c7a93ca6ad2e... | 1 
           mediastreamer-4.4.8 | 1 
                  nginx-1.24.0 | 1 
                 openssh-9.7p1 | 1 
   openvmtools-11.3.5-18557794 | 1 
            python-scapy-2.5.0 | 1 
                  ramsmp-3.5.0 | 1 
                    rtty-8.1.0 | 1 
                 shadow-4.14.5 | 1 
                     shim-15.8 | 1 
                tealdeer-1.6.1 | 1 
                xenomai-3.0.10 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   s390x     |           bat-0.24.0           | NOK | http://autobuild.buildroot.net/results/312e26c6ef17502c0262b918d7d4868285878105 |     
  sparc64    |           bat-0.24.0           | NOK | http://autobuild.buildroot.net/results/5581a21dcd848a6f145726e49650585963800b2a |     
   s390x     |           bat-0.24.0           | NOK | http://autobuild.buildroot.net/results/946a6987af400a6852555efe0d1a7f416f4e12ed |     
    arm      |           bat-0.24.0           | NOK | http://autobuild.buildroot.net/results/ddc2b9fed3b81c27d9961cf8aa8bfee2ebf59da9 |     
  aarch64    |           bat-0.24.0           | NOK | http://autobuild.buildroot.net/results/4fc5717989e8d76bb9cbc695fc2f5973c2f84fc6 |     
    arm      |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/1dec459db48e1cabd118e7dfa7305866011c299f |     
    arm      |          botan-3.3.0           | NOK | http://autobuild.buildroot.net/results/50069c94f5347eefb927fd248b3e8c29ff7ffada | ORPH
    arm      | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/a3f416b4d21b1dfc4c9d2681900418be5dc2fd0d | ORPH
    arm      | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/7ae0ddaa0b47ca1c5eb6fd2cf1bdd1dc4b95fceb | ORPH
  riscv64    | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/0fb58008c40d87200f8f24b461468221a64e6177 | ORPH
    sh4      |           crun-1.12            | NOK | http://autobuild.buildroot.net/results/66ebada226fcd30445d4f9b5212a6be80d1edbec |     
   sh4eb     |           crun-1.12            | NOK | http://autobuild.buildroot.net/results/d29c88a446de7b439288cabc538fbc6372839b2a |     
    or1k     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/7e0f17ca5abaa9a3a4fec055205e1f9d2db23feb | ORPH
    or1k     |      dmraid-1.0.0.rc16-3       | NOK | http://autobuild.buildroot.net/results/5a37fe6322f347c2ec37b28c1bda61ac348ea1e4 | ORPH
    or1k     |      dmraid-1.0.0.rc16-3       | NOK | http://autobuild.buildroot.net/results/297c9531fce503d665e89c087037d7df5d8b09da | ORPH
microblazeel |      dmraid-1.0.0.rc16-3       | NOK | http://autobuild.buildroot.net/results/f8c38c2b913b279a1ed8641088dc78cb12f48be2 | ORPH
   s390x     |           dust-0.9.0           | NOK | http://autobuild.buildroot.net/results/1ac19144f66abed326b0ec14e377f300429aaebb | ORPH
   s390x     |           dust-0.9.0           | NOK | http://autobuild.buildroot.net/results/80476d477318555afbf05ca85d4b9077f11d6a61 | ORPH
  sparc64    |           dust-0.9.0           | NOK | http://autobuild.buildroot.net/results/5eb8e84654de6e5a10dc2b9f67c0a445effe5265 | ORPH
    i686     |     edk2-edk2-stable202308     | NOK | http://autobuild.buildroot.net/results/0ad7ed2dccfc1eaee4bbb23806923f4a61bc6fa4 |     
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/b03ddc8f9f31a494c7e5526a1aa844d8e03ca4cf | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/25f14ff5013b6741873492d9909db02bf3df5741 | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/5c0c6a453804737d8f07ca787f4fa40b3ca67d2e | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/06a475b933a1c52b5936bc75f6fc6cedf7e5fa45 | ORPH
powerpc64le  |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/af91d0418dfc28c15543f1333c181f29ad1cd22b |     
  riscv64    |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/4950650e7bba2024a738b29872aebbf974905b4e |     
   xtensa    |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/020fe957afe9455a7048e4b541acb77bdfd0e284 |     
    arc      |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/e1e28e8fa9a5a82676935a664cfc40baad8e736f |     
    arc      |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/70a6fbb065e173aa792ebb0c2f8eccfdf8fea8ce |     
  riscv64    |         flannel-0.25.1         | NOK | http://autobuild.buildroot.net/results/3e8bf8d6dbc03533d0e0e71d5b16ad0e1df0917f |     
    sh4      |        freeipmi-1.6.14         | NOK | http://autobuild.buildroot.net/results/43fbfe5a2e636efbd7c71b12641ba50d91c1dc00 |     
 microblaze  |       gdk-pixbuf-2.42.10       | NOK | http://autobuild.buildroot.net/results/3d07c802743245604911aff45aee4b151db41045 | ORPH
   armeb     |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/849ec65501c42e4cf2453ebd2d51056c338f77ab |     
 aarch64_be  |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/0d4efd4126232761e80f58395d43a12f0a616515 |     
    arm      |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/05bfc9bd34e729af3f349ef6aad39572acdb7586 |     
    mips     |          gnupg2-2.4.5          | NOK | http://autobuild.buildroot.net/results/fce0afbcf2ae359746d24e1a066519f9d0c0ffa7 |     
  riscv64    | host-binutils-bare-metal-2.42  | NOK | http://autobuild.buildroot.net/results/6142df6490803b02e15972c9179095a091a76aa3 |     
   sh4aeb    | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/641a605bd73e81d95ff37288a8ce8d70242a515b | ORPH
 powerpc64   | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/39a860f930dcdd2421e7e2fc4ec9b9b01c53b179 | ORPH
   mipsel    | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/95e7feef13a97791277b463782bc379b3dfe342d | ORPH
  powerpc    |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.net/results/6af753fa3a482f35ad3276260b76d88b62a9c4f3 |     
  aarch64    |        host-rust-1.74.1        | NOK | http://autobuild.buildroot.net/results/4d4e8e4aca1e4a85a5f6c3b5a1f43ee50badc79b |     
  sparc64    |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/2057c777bff76f6e68b3e46a6fc9dd08d411fe4d |     
  mips64el   |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/47025c61be56e912a67c95a95e12673d4832ca75 |     
   mips64    |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/30d70f211ae6827fe16449aa9af9c34b7e06229b |     
 microblaze  |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/af8e2d6a4aa9c0cb8d162bc4402717ceffad1f62 |     
   x86_64    |        hyperfine-1.18.0        | NOK | http://autobuild.buildroot.net/results/bc327e99285d60b393576fb1b0d99c8edafb88bd | ORPH
   mipsel    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/a89e686cfca9e4784f62c700a70273689c5c08fb |     
  sparc64    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/9f16aae80504da507a447fe7ae7ffb39de60b0b2 |     
 microblaze  | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/f54b9cd5766c29781f0b02af3dc4cfcf53f900b7 |     
   nios2     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/906afb74ee844c3c3ea1242ac8075395b4102e2f |     
 aarch64_be  | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/125d1863c4f8be17859a3537d93333305ff279f8 |     
  mips64el   | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/89d40834502ef988446da59f5d400e5298826c46 |     
   mips64    |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.net/results/76a5fbee63dbe6b1706e257e6bbee69ff4104b1d |     
powerpc64le  |        libarchive-3.7.3        | NOK | http://autobuild.buildroot.net/results/2c5a006b9713cde71059d5ca553c9c78aaf2ec2a |     
   nios2     |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/bfa4d26a0b23dabab48d10e23442e4c2ee79fe73 |     
   x86_64    |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/55ed39d0815c1ebd5e0f52c94973eb05f83d529b |     
 aarch64_be  |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/9ab809cfb93b2569ff97c58d7af8c5008eb6b9f4 |     
   arceb     |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/9c4a0e09677bcd5d5163759ffbfdcf8425ffde59 |     
 aarch64_be  |        libgeotiff-1.7.1        | NOK | http://autobuild.buildroot.net/results/c34ad14bbf19da212312af44bd14c8f5caedbcaf |     
   x86_64    |         libp11-0.4.12          | NOK | http://autobuild.buildroot.net/results/ed0d19aa8ea1591a0cd0fd2a0ae93c61f09574a3 | ORPH
powerpc64le  |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/d7298d6a145ae7c34ddcae57309cfb0f6f8079e7 | ORPH
   s390x     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/ecff3a3f00df7f055d2f41513f23f47f98b3bd0b | ORPH
    m68k     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/b8982cc67d6c5e8bc761adc455b78ebc6084504c | ORPH
    sh4a     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/45733c8b390709577f808b6c8493208b4a3ed6eb | ORPH
microblazeel |         libselinux-3.6         | NOK | http://autobuild.buildroot.net/results/c481db1c0d9f9310b3a10cdd04f417e1004882cf |     
  mips64el   |         libselinux-3.6         | NOK | http://autobuild.buildroot.net/results/ee1ab492db70e4254fb816c7f5b4244ee810c179 |     
    or1k     |         libselinux-3.6         | NOK | http://autobuild.buildroot.net/results/7e627744beaa4f7fdfd488dfacbaafc074a999f7 |     
    i686     |         libselinux-3.6         | NOK | http://autobuild.buildroot.net/results/f70169cca682aaec82b303de8f7e844f3b15a581 |     
    arm      |         libselinux-3.6         | NOK | http://autobuild.buildroot.net/results/98669d91c7e21c75b75f97f63c4db20adca38967 |     
    mips     |         libselinux-3.6         | NOK | http://autobuild.buildroot.net/results/80d4cf4eb06adf405ea4cf6be074ba7e2071331d |     
   mips64    |          linux-6.8.6           | NOK | http://autobuild.buildroot.net/results/84197c215284a8738907031df96c39ada9d5e630 | ORPH
   mipsel    |          linux-6.8.6           | NOK | http://autobuild.buildroot.net/results/b89bcb670216a2bb6484a20924d180f25460a9e4 | ORPH
    i686     |          linux-tools           | NOK | http://autobuild.buildroot.net/results/859be738b7b3c9f72ccf9fdee9e5bd9f169999a8 | ORPH
 aarch64_be  |          lmdb-0.9.31           | NOK | http://autobuild.buildroot.net/results/2fd397efd82126a670cde2b6c2418087e7c07ea3 |     
   x86_64    | ltrace-82c66409c7a93ca6ad2e... | NOK | http://autobuild.buildroot.net/results/1a11b5c9094d2de4ed8e9342dae50a51e9dc9019 | ORPH
    sh4      |      mediastreamer-4.4.8       | NOK | http://autobuild.buildroot.net/results/b9dde038104f13ef5b211fc1c8dac8663a93f61c | ORPH
   sparc     |          nginx-1.24.0          | NOK | http://autobuild.buildroot.net/results/4bb3a6e15d15621493f04452a041e84fce5fad1b |     
  sparc64    |         nushell-0.85.0         | NOK | http://autobuild.buildroot.net/results/eeea6a0dc7099a8a7f4d8ef956a6eb350e1ba198 | ORPH
   x86_64    |         nushell-0.85.0         | NOK | http://autobuild.buildroot.net/results/64e219e90c452daa953bd130bb48df09ba427950 | ORPH
powerpc64le  |         nushell-0.85.0         | NOK | http://autobuild.buildroot.net/results/a4e04d2df3949e8b218db11616f8036fed538cb9 | ORPH
  powerpc    |         openssh-9.7p1          | NOK | http://autobuild.buildroot.net/results/d0876a2cd8c170f65fd4e3da9ccc1e47d8c76d69 | ORPH
  aarch64    |  openvmtools-11.3.5-18557794   | NOK | http://autobuild.buildroot.net/results/513727424bb6775782a6d5f5b0b57521376d3a20 |     
   nios2     |       python-scapy-2.5.0       | NOK | http://autobuild.buildroot.net/results/2191e26bf500c096789e160109ac416c685e83c3 |     
   sh4eb     |          ramsmp-3.5.0          | NOK | http://autobuild.buildroot.net/results/a7c51e326b94ac81427ba713d9a44f199f254263 |     
   armeb     |           rtty-8.1.0           | NOK | http://autobuild.buildroot.net/results/ba38cba87d2ae0614dbadc8a477f70ac1c121880 |     
    sh4      |         shadow-4.14.5          | NOK | http://autobuild.buildroot.net/results/8efaee3c6cd91c902f1f0f192d04e24c4863becd |     
    arm      |           shim-15.8            | NOK | http://autobuild.buildroot.net/results/59b2edb62d4469398d826a7fa5a5957426509ec7 |     
   xtensa    |       stress-ng-0.17.07        | NOK | http://autobuild.buildroot.net/results/1694ae0c6571a24eba0d4c28916bdc8f9cddc9bf |     
   xtensa    |       stress-ng-0.17.07        | NOK | http://autobuild.buildroot.net/results/03ca167d74a63a7ece903e63737534021a27141e |     
   x86_64    |         tealdeer-1.6.1         | NOK | http://autobuild.buildroot.net/results/ea6503d95fdfa636a369b2513090283269a042e0 |     
    mips     |            unknown             | NOK | http://autobuild.buildroot.net/results/5326c91a05d9baddc0be0cebab06e385cd149264 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/7b88de02d6bf66b4749ea74949ad89223a4b46ce |     
  riscv32    |            unknown             | NOK | http://autobuild.buildroot.net/results/da6585d38ae644ac32188ddca8234cbeabc2f1a4 |     
powerpc64le  |            unknown             | NOK | http://autobuild.buildroot.net/results/389413d0839b414a2ca9f8aa8c953b7fe092036a |     
   nios2     |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/3319ce62706ffc0ed741173b90d50fa497a3eefb |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

          libcamera-apps-1.2.1 | 2 
glibc-2.38-44-gd37c2b20a478... | 1 
                gnu-efi-3.0.17 | 1 
  gobject-introspection-1.76.1 | 1 
ivi-homescreen-5ab78a19e95c... | 1 
                mongodb-4.2.18 | 1 
                    proj-9.3.0 | 1 
                xenomai-3.0.10 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  | glibc-2.38-44-gd37c2b20a478... | NOK | http://autobuild.buildroot.net/results/aba003aed87139247cc4f173d498b830cc053084 |     
    arm      |         gnu-efi-3.0.17         | NOK | http://autobuild.buildroot.net/results/caf9033b1b5d3b18a8a65c040ed3e5a2d0c63f5a |     
  powerpc    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/bfb236bcc590c0f9165fa97419042be461cbec10 | ORPH
    arm      | ivi-homescreen-5ab78a19e95c... | NOK | http://autobuild.buildroot.net/results/259467560a2472c38973a3fe576841f2bf986a40 |     
  riscv64    |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/4fab64082ffb848c704160340ab08000b2d6e78e |     
    arm      |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/3f79381b520d7482fc4237b5895c21d0cdc990b1 |     
  aarch64    |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/b88c5d626d6046e6b5296f46d2b6d4223a6b68bd |     
   mips64    |           proj-9.3.0           | NOK | http://autobuild.buildroot.net/results/571e9eca9b9e8328d0633767b6c3c46b16e4c134 |     
   nios2     |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/c59a5614b72872b33e3a66bc34e294131d050dbf |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
