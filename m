Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4C60C04FFE
	for <buildroot@archiver.kernel.org>; Sat, 11 May 2024 04:05:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2E15042580;
	Sat, 11 May 2024 04:05:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dbkUI_MGhfz5; Sat, 11 May 2024 04:05:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C206042501
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C206042501;
	Sat, 11 May 2024 04:05:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EA6F41BF3A7
 for <buildroot@lists.busybox.net>; Sat, 11 May 2024 04:05:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D68024044B
 for <buildroot@lists.busybox.net>; Sat, 11 May 2024 04:05:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J527ibw19zfO for <buildroot@lists.busybox.net>;
 Sat, 11 May 2024 04:05:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 40ECE401CA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 40ECE401CA
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 40ECE401CA
 for <buildroot@buildroot.org>; Sat, 11 May 2024 04:05:10 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 35414C0005
 for <buildroot@buildroot.org>; Sat, 11 May 2024 04:05:08 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sat, 11 May 2024 04:05:08 -0000
X-GND-Sasl: bot@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1715400308; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Vsp1TZ/U4Bd7gQKfkd+k/M/t2OkhJ/R1EqsbQb1qJag=;
 b=FHKCBI35Bzgucpin4yGnZHV3SaDZPWeQbZ2GBVCMY87fzKX5Z+tqmXi6ARZToTPUesxWUO
 AR4aprjZlGppr4eJxtNd7kCx1Gnyxn/v39HvRNfd4BZ4FuwXreOntTGmeCZclLH5oepXdW
 x01maaFMNTNwB6QHeHicfwF2S5dbiB4HjOhVQV7UY0uNRrD/Kg16mEA2lDrh+hSkmSvbRn
 R9/TnoBR0i9f4xCvm5dQqiFJJkdENDCcMHdD017rdOiYV8m0rXRBZvTUl1Cc7RH5KAyIMK
 y0+x70KzBfpfyH3nfMxqApQmj+6uEU14DJQ1czSKOLQm8Xajd/8YHQlf0zuYYw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=FHKCBI35
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2024-05-10
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
Message-ID: <20240511040508.tdnkq0Z_oXVOW0v_7mYfHc0Y8slEyHs8lfeNo-MCb-c@z>

Hello,

Autobuild statistics for 2024-05-10
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  | 10  |  9  |  0  | 19  |
    master   | 76  | 92  |  1  | 169 |

Classification of failures by reason for master
-----------------------------------------------

                    dust-0.9.0 | 4 
  gobject-introspection-1.76.1 | 4 
         host-libxcrypt-4.4.36 | 4 
                libressl-3.8.4 | 4 
                    bat-0.24.0 | 3 
check-11970a7e112dfe243a2e6... | 3 
                 coreutils-9.3 | 3 
           dmraid-1.0.0.rc16-3 | 3 
                   foot-1.16.2 | 3 
glibc-2.39-5-ge0910f1d3278f... | 3 
                gnu-efi-3.0.18 | 3 
host-heimdal-f4faaeaba371ff... | 3 
ibm-sw-tpm2-5452af422edeff7... | 3 
                       unknown | 3 
                elfutils-0.189 | 2 
firmware-utils-86739f2b3ae9... | 2 
            gdk-pixbuf-2.42.10 | 2 
            host-binutils-2.42 | 2 
              hyperfine-1.18.0 | 2 
                  libffi-3.4.6 | 2 
                libselinux-3.6 | 2 
                  procs-0.14.5 | 2 
             strongswan-5.9.13 | 2 
aubio-152d6819b360c2e7b379e... | 1 
                  boost-1.83.0 | 1 
        edk2-edk2-stable202308 | 1 
                      ell-0.65 | 1 
                    eza-0.18.8 | 1 
                fail2ban-1.0.2 | 1 
                  ffmpeg-6.1.1 | 1 
                flutter-engine | 1 
                 highway-1.1.0 | 1 
                host-go-1.22.3 | 1 
              host-rust-1.74.1 | 1 
        host-sentry-cli-2.20.3 | 1 
               ipmitool-1_8_19 | 1 
              libarchive-3.7.3 | 1 
               libglib2-2.76.1 | 1 
              libopenssl-3.3.0 | 1 
               libunwind-1.8.1 | 1 
               lighttpd-1.4.76 | 1 
                   linux-6.8.6 | 1 
                    ncmpc-0.49 | 1 
   openvmtools-11.3.5-18557794 | 1 
        python-ml-dtypes-0.3.2 | 1 
         python-remi-2022.7.27 | 1 
python-unittest-xml-reporti... | 1 
                tealdeer-1.6.1 | 1 
                   trinity-1.9 | 1 
ulog-0389d243352255f6182326... | 1 
                 wavemon-0.9.5 | 1 
              wpewebkit-2.42.5 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  sparc64    | aubio-152d6819b360c2e7b379e... | NOK | http://autobuild.buildroot.net/results/68bccf28237964f285efae6f019b32cd8891993d |     
  aarch64    |           bat-0.24.0           | NOK | http://autobuild.buildroot.net/results/015436d834286ae30b0a9700ab77fbacf582e305 |     
 powerpc64   |           bat-0.24.0           | NOK | http://autobuild.buildroot.net/results/4049af53afa7a51dc4e43fb74188c7f320221a1d |     
  sparc64    |           bat-0.24.0           | NOK | http://autobuild.buildroot.net/results/8679b24c3c45992cfd01d97361bcb728b69fdb8c |     
    arc      |          boost-1.83.0          | NOK | http://autobuild.buildroot.net/results/6b2f725769647929a83f926405bc65eb20b8e5a6 |     
 microblaze  | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/6471d2877a332c38a6f0dd840d8159ba907b8d88 | ORPH
   sparc     | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/00fac255adbf145ee3f28e42ccbb9f2dea411a33 | ORPH
  riscv64    | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/bc6a91e9d43c8dd77196ea1cc83013a246337f24 | ORPH
   arceb     |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/45d5a4abb58f49847a6ef735698564324a7e9137 | ORPH
    m68k     |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/cba2ec1ae61434009b7141f8d73f4da1e70729f9 | ORPH
    sh4a     |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/33f525b6a0833b91aefae23a9f7ec0d656b9638c | ORPH
microblazeel |      dmraid-1.0.0.rc16-3       | NOK | http://autobuild.buildroot.net/results/34cf2aa9cfbe6422622546b9d948a5fbde8dd859 | ORPH
   armeb     |      dmraid-1.0.0.rc16-3       | NOK | http://autobuild.buildroot.net/results/33eab97149903af7e304658017797862782ae605 | ORPH
 aarch64_be  |      dmraid-1.0.0.rc16-3       | NOK | http://autobuild.buildroot.net/results/0db5e9031a83075681013b750383a33585e13b77 | ORPH
 powerpc64   |           dust-0.9.0           | NOK | http://autobuild.buildroot.net/results/32120de12d1b730dbbb535dc206c610df8becc8e | ORPH
  aarch64    |           dust-0.9.0           | NOK | http://autobuild.buildroot.net/results/556fe3b09d582af5b1da64a72f2468a3125d3656 | ORPH
  sparc64    |           dust-0.9.0           | NOK | http://autobuild.buildroot.net/results/b1fc4a25eafa9d50c356952c80ff80d6ca09434e | ORPH
  aarch64    |           dust-0.9.0           | NOK | http://autobuild.buildroot.net/results/d7c8603d07bf636ce1ec826b4b5efdbb3efda83c | ORPH
   x86_64    |     edk2-edk2-stable202308     | NOK | http://autobuild.buildroot.net/results/1117351d2b9257654e333983e5dd9803e139d099 |     
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/3a6e5848af68a4d1ff3a9d2cf1b837419d6c925f | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/e75861cc82ec55efdb9f91ed6609a55b40df63f3 | ORPH
   sh4aeb    |            ell-0.65            | NOK | http://autobuild.buildroot.net/results/70d045d0a92f4883f4382c3d37aae73bd21e904e | ORPH
powerpc64le  |           eza-0.18.8           | NOK | http://autobuild.buildroot.net/results/8ae7c0fe07d11c8c828ad1cc9808caf4ae47b217 |     
 aarch64_be  |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/c7d76ccd85ceff8c29413ca60aa5abaa149fde38 |     
microblazeel |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/648135741ac0419c12d65afcee49f0fd33969b32 |     
  powerpc    | firmware-utils-86739f2b3ae9... | NOK | http://autobuild.buildroot.net/results/ba0d91656d33f9d1076c992f6392bbf73ee98d5a |     
   x86_64    | firmware-utils-86739f2b3ae9... | NOK | http://autobuild.buildroot.net/results/0add82a3a05c5559ff58e7dfacacac7b082ad05f |     
  aarch64    |         flutter-engine         | TIM | http://autobuild.buildroot.net/results/dc4df381fd1b9336b8c477bf35d704bde55df5a4 |     
   nios2     |          foot-1.16.2           | NOK | http://autobuild.buildroot.net/results/0e52450af66ada917b8d47a33c82c7c5be88fa21 |     
    mips     |          foot-1.16.2           | NOK | http://autobuild.buildroot.net/results/ee8cd17a950b2b00fcd179e286da4b3523c636fc |     
  mips64el   |          foot-1.16.2           | NOK | http://autobuild.buildroot.net/results/4c6dee6091a23b813ba7f3e10243ac7531559b0e |     
  powerpc    |       gdk-pixbuf-2.42.10       | NOK | http://autobuild.buildroot.net/results/9f13f5c4a8e0b4633d7ac87846de11a0defea1b3 | ORPH
    arm      |       gdk-pixbuf-2.42.10       | NOK | http://autobuild.buildroot.net/results/5866580d707301f458e2ae02124714a666f9269f | ORPH
powerpc64le  | glibc-2.39-5-ge0910f1d3278f... | NOK | http://autobuild.buildroot.net/results/5e63642bce74bb22a172ab58dedbe77373d5d02e |     
 powerpc64   | glibc-2.39-5-ge0910f1d3278f... | NOK | http://autobuild.buildroot.net/results/8478520a648ec25f1d406aaf8385aebb052327d8 |     
 powerpc64   | glibc-2.39-5-ge0910f1d3278f... | NOK | http://autobuild.buildroot.net/results/5bf26b284dc4fa670095313319592722d2a67248 |     
   armeb     |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/e02a11db517f66ff471f73d7c2e3eca0648b0d33 |     
  riscv64    |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/aa6c8e15a458092171a5c94984a0a2414cf3c36f |     
   armeb     |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/74cefe0a22864fc2411ba97d9230d918dce7f727 |     
   x86_64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/4ef1a99c25ab62f60c36e70a2a52141ea32e8c4e | ORPH
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/6ab248f6b9b4aaa4206c0a92607c910beb12741a | ORPH
   s390x     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/76643c62f002829e73cd436c5cbbc7c983977aa3 | ORPH
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/af53d2be5fed5896374e7b47c6a80c4f7998c557 | ORPH
 powerpc64   |         highway-1.1.0          | NOK | http://autobuild.buildroot.net/results/7a8c3bb8d4abbbbc517adcc8774a5b8fadfa5aca |     
   mips64    |       host-binutils-2.42       | NOK | http://autobuild.buildroot.net/results/948f76a685119f56af7a7db30deb56bc239be31f |     
   mips64    |       host-binutils-2.42       | NOK | http://autobuild.buildroot.net/results/2ef4a5acf32f3cb700dbcb2e1c48470eafe5cd4a |     
  mips64el   |         host-go-1.22.3         | NOK | http://autobuild.buildroot.net/results/53e06c209410e2a2b89c90e481aa265c9191da21 |     
   sh4aeb    | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/14f612f45639236076e1f5c46d1169222afb5782 | ORPH
  aarch64    | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/64d1ba0cb02aeb92586884aa04ec367d3c1651c3 | ORPH
  sparc64    | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/29e65b5ccb123ed9a8c8bb29b6f8257ced712931 | ORPH
   mipsel    |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.net/results/f6ec53f6b8f65cca59f128363899be723a5935a6 |     
 microblaze  |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.net/results/b3c055ef97ae62e5c3177ff06cb3b6b3b3b3cb58 |     
    i686     |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.net/results/b24c8cb3a504a32a78877af3a1e8418a62182cf2 |     
   x86_64    |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.net/results/4bd0e2b7de1640795b43ab9d63289b2892f6f07b |     
   armeb     |        host-rust-1.74.1        | NOK | http://autobuild.buildroot.net/results/87662110bef04acc318735e8af1b3ed0a24926d9 |     
   xtensa    |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/052fbdc2fd1cc1f474bdb81ec45d6f0f3e56d461 |     
  sparc64    |        hyperfine-1.18.0        | NOK | http://autobuild.buildroot.net/results/cb7f269ca803b36a2b44e51d8f94c126c91c34bb | ORPH
   s390x     |        hyperfine-1.18.0        | NOK | http://autobuild.buildroot.net/results/cc3f9aa87c95d2713407b578c12f047c51b8f92b | ORPH
    arm      | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/c6c6c6d9e9a8aa6acb08f50c206137ecc5c1d491 |     
  riscv64    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/14170e55150bbd4c9644499cbf6af95e05981139 |     
 powerpc64   | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/d1e8bcf8750f3dbf8d98cdc1ae9ab93800de917d |     
    m68k     |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.net/results/7dde66c88947daef0b8bd551400414f891f51943 |     
powerpc64le  |        libarchive-3.7.3        | NOK | http://autobuild.buildroot.net/results/9e196d5b48f5e66470a13e2cbe02dbc8ed0a9a1c |     
    arc      |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/b9d2e6ce1c154d1406c04821de94ff0b9a738a2c |     
   arceb     |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/fbbba2f7f97be221767f034a4bacaca44dd5049e |     
   arceb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/2eec3125b7b92f3edf8c56e93927c6e011d9afdd |     
  riscv32    |        libopenssl-3.3.0        | NOK | http://autobuild.buildroot.net/results/95bee627ce3a5e3c9418b745da4523049ec12887 | ORPH
   arceb     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/89e196673498fec3a6caef37e5d4201b55784271 | ORPH
 powerpc64   |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/ee945b0584857ca01addb3a69be0c05df6a71a2d | ORPH
microblazeel |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/6c91b5695d2582f88f5894b3388720c6d2979484 | ORPH
  mips64el   |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/eb58937ea737bb72860ce0819c4e7e51da0e2adb | ORPH
  aarch64    |         libselinux-3.6         | NOK | http://autobuild.buildroot.net/results/b5e0da1faab1e1ca65f1438280f5225d274a0962 |     
    i686     |         libselinux-3.6         | NOK | http://autobuild.buildroot.net/results/da67c6d24e4d49ae0505c78b1fb5a0ef6d441769 |     
   armeb     |        libunwind-1.8.1         | NOK | http://autobuild.buildroot.net/results/5eda596395e8e6e7b4f9459019488e24ac58f791 | ORPH
  sparc64    |        lighttpd-1.4.76         | NOK | http://autobuild.buildroot.net/results/89d2b9d84433ee206170fafaa11898e7606596ef | ORPH
   mipsel    |          linux-6.8.6           | NOK | http://autobuild.buildroot.net/results/50f3a9bfa7f1d00d672fabd883870cae61cc82af | ORPH
    or1k     |           ncmpc-0.49           | NOK | http://autobuild.buildroot.net/results/fff8cc20f208ee14656d4339dba9f7ae1c487609 |     
    i586     |  openvmtools-11.3.5-18557794   | NOK | http://autobuild.buildroot.net/results/2b1d3f1037ae51d488890767d06dbee67e939043 |     
   s390x     |          procs-0.14.5          | NOK | http://autobuild.buildroot.net/results/bb41e87bc5c77ce8c399e5ea9b2df6c7ae2659c4 |     
   s390x     |          procs-0.14.5          | NOK | http://autobuild.buildroot.net/results/05607fb37c2d0e0c3cf214db3ad3c8d25e2f306a |     
  aarch64    |     python-ml-dtypes-0.3.2     | NOK | http://autobuild.buildroot.net/results/9f0572360b4013f68447665896060c477efaed28 |     
   nios2     |     python-remi-2022.7.27      | NOK | http://autobuild.buildroot.net/results/e94a810a12787aa480700799f61d5bb3e2cb10dd |     
  powerpc    | python-unittest-xml-reporti... | NOK | http://autobuild.buildroot.net/results/8c6390ad226b6a341fa27c6c87b133070f8fedef |     
    i686     |       strongswan-5.9.13        | NOK | http://autobuild.buildroot.net/results/ce1842a58d21cc84882e111cf2f38bd5bd22fe47 |     
   s390x     |       strongswan-5.9.13        | NOK | http://autobuild.buildroot.net/results/0ac8eaa3ff9c7a18a442468d5f73d789de828047 |     
   x86_64    |         tealdeer-1.6.1         | NOK | http://autobuild.buildroot.net/results/cca15f2573ccf914d15e6dc9d3efcf56b36d3d6e |     
  powerpc    |          trinity-1.9           | NOK | http://autobuild.buildroot.net/results/87dca81bdf5fe8b9ec72679e0dad40bfc9d1fecc | ORPH
    mips     | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/f1a1bc4b48f467260ec83b4745358ed0b647920d |     
powerpc64le  |            unknown             | NOK | http://autobuild.buildroot.net/results/ff30c2fd08d55c3824a3fcf6756acbde006a0cf4 |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/d1973ac473dc85268ef06d530c46e9d0a047ed10 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/8b092d3ce0231dff7b862836ab239fb3519713d8 |     
    arc      |         wavemon-0.9.5          | NOK | http://autobuild.buildroot.net/results/b104b2cd44b7ba4b3e02f126070e94b09d58b774 | ORPH
   x86_64    |        wpewebkit-2.42.5        | NOK | http://autobuild.buildroot.net/results/f0d76cc75bc11fa6e6d44242d78d2efd13c9ffcc |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

check-11970a7e112dfe243a2e6... | 1 
                     crun-1.12 | 1 
          libcamera-apps-1.2.1 | 1 
              libopenssl-3.2.1 | 1 
                  linux-6.6.27 | 1 
            micropython-1.22.0 | 1 
   openvmtools-11.3.5-18557794 | 1 
             sofia-sip-1.13.17 | 1 
                       unknown | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/936b067546b7cf69a5c06e025c2584ad9f664639 | ORPH
    sh4      |           crun-1.12            | NOK | http://autobuild.buildroot.net/results/748bb6171b21e74edba209a19484799aec62b011 |     
  riscv32    |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/bb432e7db23911fa8c88363100ce743cc7d61949 |     
    arm      |        libopenssl-3.2.1        | NOK | http://autobuild.buildroot.net/results/1ee00a1ad0db22a36fe589c7c7401de2d28dcc25 | ORPH
   x86_64    |          linux-6.6.27          | NOK | http://autobuild.buildroot.net/results/f063d67f4f2c2ec94da0331d625fa83a1159a72f | ORPH
  aarch64    |       micropython-1.22.0       | NOK | http://autobuild.buildroot.net/results/9b36ef883fe7ce1206d4f535bde0a6a7afda5bdf |     
    i586     |  openvmtools-11.3.5-18557794   | NOK | http://autobuild.buildroot.net/results/598a3937b45299d573bb787f531a82d4afbc20cb |     
  mips64el   |       sofia-sip-1.13.17        | NOK | http://autobuild.buildroot.net/results/4c2aedc721f8b284c0140f314e4933e321f4aaba |     
  sparc64    |            unknown             | NOK | http://autobuild.buildroot.net/results/7785f30378ec94161900731ed4aa39a02e3b05df |     


Gitlab CI results for 2024-05-10
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
       acmesystems_aria_g25_128mb | https://gitlab.com/buildroot.org/buildroot/-/jobs/6813124460  |      
       acmesystems_aria_g25_256mb | https://gitlab.com/buildroot.org/buildroot/-/jobs/6813124469  |      
    acmesystems_arietta_g25_128mb | https://gitlab.com/buildroot.org/buildroot/-/jobs/6813124477  |      
    acmesystems_arietta_g25_256mb | https://gitlab.com/buildroot.org/buildroot/-/jobs/6813124495  |      
                  at91sam9260eknf | https://gitlab.com/buildroot.org/buildroot/-/jobs/6813124686  |      
                   at91sam9g20dfc | https://gitlab.com/buildroot.org/buildroot/-/jobs/6813124696  |      
                 at91sam9g45m10ek | https://gitlab.com/buildroot.org/buildroot/-/jobs/6813124701  |      
                     at91sam9rlek | https://gitlab.com/buildroot.org/buildroot/-/jobs/6813124708  |      
                     at91sam9x5ek | https://gitlab.com/buildroot.org/buildroot/-/jobs/6813124712  |      
                 at91sam9x5ek_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/6813124720  |      
                 at91sam9x5ek_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/6813124727  |      
             at91sam9x5ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/6813124742  |      
   atmel_sama5d27_som1_ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/6813124756  |      
   atmel_sama5d2_xplained_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/6813124784  |      
       atmel_sama5d3_xplained_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/6813124814  |      
   atmel_sama5d3_xplained_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/6813124861  |      
                 atmel_sama5d3xek | https://gitlab.com/buildroot.org/buildroot/-/jobs/6813124871  |      
       atmel_sama5d4_xplained_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/6813124880  |      
   atmel_sama5d4_xplained_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/6813124894  |      
                        avenger96 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6813124907  |      
                        bananapro | https://gitlab.com/buildroot.org/buildroot/-/jobs/6813124935  | ORPH 
                   beagleboardx15 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6813124938  |      
                   beaglebone_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6813124950  |      
                          beaglev | https://gitlab.com/buildroot.org/buildroot/-/jobs/6813124960  |      
                      beelink_gs1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6813124964  |      
                  chromebook_snow | https://gitlab.com/buildroot.org/buildroot/-/jobs/6813124983  |      
                             ci20 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6813124986  |      
                      cubieboard2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6813124990  |      
            engicam_imx6qdl_icore | https://gitlab.com/buildroot.org/buildroot/-/jobs/6813124992  |      
        engicam_imx6qdl_icore_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6813124996  |      
        engicam_imx6qdl_icore_rqs | https://gitlab.com/buildroot.org/buildroot/-/jobs/6813125002  |      
              engicam_imx6ul_geam | https://gitlab.com/buildroot.org/buildroot/-/jobs/6813125005  |      
             engicam_imx6ul_isiot | https://gitlab.com/buildroot.org/buildroot/-/jobs/6813125010  |      
           friendlyarm_nanopi_r2s | https://gitlab.com/buildroot.org/buildroot/-/jobs/6813125075  |      
            imx8mn_bsh_smm_s2_pro | https://gitlab.com/buildroot.org/buildroot/-/jobs/6813125131  |      
                        imx8mqevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/6813125139  |      
               kontron_pitx_imx8m | https://gitlab.com/buildroot.org/buildroot/-/jobs/6813125149  |      
                         lego_ev3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6813125156  |      
      microchip_sam9x60ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/6813125171  |      
...hip_sama5d27_wlsom1_ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/6813125179  |      
    microchip_sama5d2_icp_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/6813125183  |      
      microchip_sama7g5ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/6813125189  |      
                          mx25pdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/6813125193  |      
                       nitrogen6x | https://gitlab.com/buildroot.org/buildroot/-/jobs/6813125220  |      
              octavo_osd32mp1_brk | https://gitlab.com/buildroot.org/buildroot/-/jobs/6813125235  |      
              octavo_osd32mp1_red | https://gitlab.com/buildroot.org/buildroot/-/jobs/6813125239  |      
                        odroidxu4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6813125247  |      
                    openblocks_a6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6813125272  |      
                    orangepi_lite | https://gitlab.com/buildroot.org/buildroot/-/jobs/6813125278  |      
                   orangepi_lite2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6813125276  |      
                orangepi_one_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/6813125283  |      
                      orangepi_pc | https://gitlab.com/buildroot.org/buildroot/-/jobs/6813125289  |      
                      orangepi_r1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6813125295  |      
               orangepi_zero_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/6813125306  |      
                           pine64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6813125317  |      
                    pine64_sopine | https://gitlab.com/buildroot.org/buildroot/-/jobs/6813125322  |      
                    pine64_star64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6813125327  |      
                qemu_m68k_mcf5208 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6813125362  |      
              qemu_mips32r6_malta | https://gitlab.com/buildroot.org/buildroot/-/jobs/6813125389  |      
               qemu_ppc64_pseries | https://gitlab.com/buildroot.org/buildroot/-/jobs/6813125429  |      
             qemu_ppc64le_pseries | https://gitlab.com/buildroot.org/buildroot/-/jobs/6813125433  |      
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/6813125509  | ORPH 
                        riotboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/6813125525  |      
                           rock5b | https://gitlab.com/buildroot.org/buildroot/-/jobs/6813125529  |      
                           rock64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6813125531  |      
                       rock_pi_n8 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6813125535  |      
            sipeed_lichee_rv_dock | https://gitlab.com/buildroot.org/buildroot/-/jobs/6813125550  |      
             sipeed_licheepi_zero | https://gitlab.com/buildroot.org/buildroot/-/jobs/6813125557  |      
               snps_arc700_axs101 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6821680965  |      
                 snps_arc700_nsim | https://gitlab.com/buildroot.org/buildroot/-/jobs/6821680993  | ORPH 
                socrates_cyclone5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6821681099  |      
              toradex_apalis_imx6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6821681572  |      
                           ts4900 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6821681582  |      
                           ts7680 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6821681607  |      
                      visionfive2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6821681718  |      



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
