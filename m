Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAD39C87FCA
	for <buildroot@archiver.kernel.org>; Sun, 27 Jul 2025 03:14:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6BC8761127;
	Sun, 27 Jul 2025 03:14:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0ZfDgEtavKyd; Sun, 27 Jul 2025 03:14:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0F8906115D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0F8906115D;
	Sun, 27 Jul 2025 03:14:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 287F6198
 for <buildroot@buildroot.org>; Sun, 27 Jul 2025 03:14:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0E97440075
 for <buildroot@buildroot.org>; Sun, 27 Jul 2025 03:14:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VftUkaOyuS1q for <buildroot@buildroot.org>;
 Sun, 27 Jul 2025 03:14:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::629; helo=mail-ej1-x629.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4407B4004D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4407B4004D
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4407B4004D
 for <buildroot@buildroot.org>; Sun, 27 Jul 2025 03:14:06 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-ae3b336e936so663841766b.3
 for <buildroot@buildroot.org>; Sat, 26 Jul 2025 20:14:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753586044; x=1754190844;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=leW+8oM/svlbxNvBMFj7G0VAAH2wZB95bwYp/PYfBcs=;
 b=PAp+BiCO1l++HkVD2Yml3iyHXr1j+M19nmJh243sLy68QEs415GgavxNIAttTxduBO
 asrrkwzS1pDauMqKCkdHxiL74dDTsMSdY+a18nHGcEyP2HFcmPOrs4Kk5c7M9Axb9eFP
 I9yXBAZWugdxEiI0rbyuBRin4FAjcjfAizDjkTwRCrKkDaC5s4vhg6GvhSCs8s2sC/g+
 m5e+xKD4FFUASQb1fB+zsVJAm8KS3dGPI8rUI3mJk9krSW4PFF3xGPH/Yr02tR465p2e
 WBuluvMI08UfnuG9BqaCW0Is67o2aeOijLreK4aLX8fSg9AgDGPxskJoKraypRzT53g5
 P/oA==
X-Gm-Message-State: AOJu0YwWHX1aZ+duLTwoxNH2CVJijXdsHRRDpmTfYLyO/+OSiVjxm1NL
 bRUlQUY5EHvOUmh5WW/KFadsQhjD8YIZucXlmCG1iGMTu1q964VE3H9VQJUe/Q==
X-Gm-Gg: ASbGncvFGP+sWAv/HgsxCoTnuqD5RBWqWg63wEKPRC7Y+sv3O4aWicENDHmG7wZmufi
 cP4krhikEgNgAaaN7RaBaUm5vHkP93boHcvl7IELiz7Oy8e6WzXSILMs+mkJ41RG+bom6feeq8N
 z5Nrxke1/aBJXVXJahIOnwCsZtGbkrUwXHpFsMYasOumT3iyfKoQHawV3IGpBudv/lfxmRI3YVS
 sZwtyCc+4f6CbHNtqy2gd/aEEb2bv2cU8ke5IrgFAQ/OZamlgI8vvhf/Eq7Pi5pdo1ZrpmY+RUn
 kozsZcH1hifyFFzVNVUecVEAQ3mZvuh1FZdw1BFDoiv0upSp3E33/IRuL9N1mOd3at02R8/vME+
 8BoxrTyFeCz1vvCqJWhqzx3nl9w==
X-Google-Smtp-Source: AGHT+IGtOaJGTst/1ALwUEKAqpeZKsmpax+vj2uF20B0Ii/ly90DN2jsLuVVhJtWFeaYKslSnRy4nA==
X-Received: by 2002:a17:907:7ea9:b0:ae0:9fdf:25e8 with SMTP id
 a640c23a62f3a-af61e6368d8mr757065666b.47.1753586043864; 
 Sat, 26 Jul 2025 20:14:03 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af635860143sm230475366b.24.2025.07.26.20.14.03
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Jul 2025 20:14:03 -0700 (PDT)
Message-ID: <6885997b.170a0220.326a2e.76dc@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sun, 27 Jul 2025 03:14:03 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753586044; x=1754190844; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=leW+8oM/svlbxNvBMFj7G0VAAH2wZB95bwYp/PYfBcs=;
 b=LI7DJBV57Pjqva7saX/8y+A6AfuhHbaZpoiBgdddCfV0J32nUU5BroDuKp27rkQscO
 X6kutDN0ByzBhRV/XbOfrSn8oOUobFBBoFpT0EKM4kZta5TD78K77v3z+LLj5YmyS6Q3
 3pAj/eZQAsNa1xHP5Y0tLuLxiLQ89jmzVLrbykfmS47vsv+iEhzwxEw3HrbFj1UM/9gu
 N/DGeh+iVQDopDgmwzfMnLlWwgtwDYpgmZT0mCsZILGmmf+gIoacPtGUbq7kLJuGvgAq
 ai4MbV7+sAFShl6jmXAuqqnfsDgxbHeRa5iP/1aW+FhhSVOlVzcNJafRH7VQLX/G+JWx
 0okw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=LI7DJBV5
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-07-26
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

Autobuild statistics for 2025-07-26
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  5  |  6  |  0  | 11  |
  2025.05.x  |  2  |  3  |  0  |  5  |
    master   | 17  | 127 |  0  | 144 |

Classification of failures by reason for master
-----------------------------------------------

                   bash-5.2.37 | 5 
            python-yarl-1.18.3 | 5 
                   cvs-1.12.13 | 4 
host-binutils-arc-2023.09-r... | 4 
               bctoolbox-4.4.8 | 3 
  gobject-introspection-1.84.0 | 3 
         host-gcc-final-14.3.0 | 3 
libsvgtiny-ea9d99fc8b231c22... | 3 
             util-linux-2.41.1 | 3 
               asterisk-22.3.0 | 2 
        b43-firmware-5.100.138 | 2 
cegui-00b4e1fe174da53b7ed72... | 2 
          chocolate-doom-3.0.1 | 2 
glibc-2.41-5-gcb7f206537240... | 2 
        host-berkeleydb-5.3.28 | 2 
            host-binutils-2.42 | 2 
                libressl-3.9.2 | 2 
                libshout-2.4.6 | 2 
                 libspdm-3.5.0 | 2 
                  libsvg-0.1.4 | 2 
        linux-headers-5.10.240 | 2 
                   nanocom-1.0 | 2 
python-remi-2022.7.27-37-g1... | 2 
              skalibs-2.14.3.0 | 2 
                    sslh-2.0.1 | 2 
        vulkan-headers-1.4.317 | 2 
          aardvark-dns-v1.15.0 | 1 
                apr-util-1.6.3 | 1 
                   avrdude-8.0 | 1 
                    bat-0.25.0 | 1 
                     bc-1.07.1 | 1 
             berkeleydb-5.3.28 | 1 
brcm-patchram-plus-15bd6638... | 1 
                 c-icap-0.5.10 | 1 
                  cairo-1.18.4 | 1 
              containerd-2.0.2 | 1 
                 dc3dd-7.2.641 | 1 
               dvbsnoop-1.4.50 | 1 
            ecryptfs-utils-111 | 1 
                 expect-5.45.4 | 1 
                    ficl-4.1.0 | 1 
              fluent-bit-4.0.3 | 1 
            gdk-pixbuf-2.42.12 | 1 
                    gpm-1.20.7 | 1 
          host-binutils-2.43.1 | 1 
       host-gcc-initial-15.1.0 | 1 
                 host-gdb-15.2 | 1 
              host-guile-3.0.9 | 1 
     host-python-maturin-1.9.1 | 1 
               host-vde2-2.3.3 | 1 
                  iozone-3.506 | 1 
                  janet-1.35.2 | 1 
                  kexec-2.0.31 | 1 
                    kmon-1.7.1 | 1 
      libabseil-cpp-20250127.0 | 1 
libdbi-drivers-0bfae6c43134... | 1 
libdill-32d0e8b733416208e04... | 1 
libftdi1-v1.5-48-g22b4667a8... | 1 
                 libgee-0.20.6 | 1 
                  libjwt-3.2.0 | 1 
        liblog4c-localtime-1.0 | 1 
                liboauth-1.0.3 | 1 
     libphidget-2.1.9.20190409 | 1 
              libselinux-3.8.1 | 1 
                  linux-6.15.8 | 1 
         linux-headers-5.4.296 | 1 
                   linux-tools | 1 
                 logsurfer-1.8 | 1 
        ltp-testsuite-20250530 | 1 
              netavark-v1.15.2 | 1 
            netstat-nat-1.4.10 | 1 
open-plc-utils-1ba7d5a042e4... | 1 
                openocd-0.12.0 | 1 
                   perl-5.40.2 | 1 
                pipewire-1.2.7 | 1 
                  prboom-2.5.0 | 1 
             python-webpy-0.62 | 1 
                python3-3.13.5 | 1 
        s6-linux-utils-2.6.2.1 | 1 
                 s6-rc-0.5.5.0 | 1 
           sane-backends-1.1.1 | 1 
                    sdl-1.2.15 | 1 
              tinyssh-20240101 | 1 
toolchain-external-bootlin-... | 1 
                       unknown | 1 
                    wipe-2.3.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   armeb     |      aardvark-dns-v1.15.0      | NOK | https://autobuild.buildroot.org/results/82191162b2de0adfab390d903670f61325ef26fd | ORPH
   arceb     |         apr-util-1.6.3         | NOK | https://autobuild.buildroot.org/results/2a262d33cf52e0b5c7ea1b3b240a6e04d3880e56 |     
    m68k     |        asterisk-22.3.0         | NOK | https://autobuild.buildroot.org/results/44323c942e11ba2f1db96a89d3473eecf1c086bf |     
    or1k     |        asterisk-22.3.0         | NOK | https://autobuild.buildroot.org/results/f5b4c7d08132a0bd0241505be01b0c733c852a78 |     
   s390x     |          avrdude-8.0           | NOK | https://autobuild.buildroot.org/results/2e74957a0011be5b7c47530752eaae20ed491812 |     
microblazeel |     b43-firmware-5.100.138     | NOK | https://autobuild.buildroot.org/results/a8622a68f2860cce22fcb0dd1d96b2944472a5cf |     
   sparc     |     b43-firmware-5.100.138     | NOK | https://autobuild.buildroot.org/results/c5058841c2e9cb183a5cd34ded88a63ca1c9a2e2 |     
 aarch64_be  |          bash-5.2.37           | NOK | https://autobuild.buildroot.org/results/5bcb5ac4e6ed8362eece721fcd4945a07915e6a8 | ORPH
    arm      |          bash-5.2.37           | NOK | https://autobuild.buildroot.org/results/d88dfbdbd646bfb37b95de83ce5d7be4f9e28c32 | ORPH
    arc      |          bash-5.2.37           | NOK | https://autobuild.buildroot.org/results/3e7860039de3583fa3d07a37cbe538b878a1aca9 | ORPH
 aarch64_be  |          bash-5.2.37           | NOK | https://autobuild.buildroot.org/results/1df13e98ceeb46adcf759f23eb354583563f9641 | ORPH
   x86_64    |          bash-5.2.37           | NOK | https://autobuild.buildroot.org/results/077405de6e97d7731fbfdf705feec70a23970f30 | ORPH
    i686     |           bat-0.25.0           | NOK | https://autobuild.buildroot.org/results/f32cda3bbce4488995caaccd83d9cd24529abe7f |     
   s390x     |           bc-1.07.1            | NOK | https://autobuild.buildroot.org/results/6605aa03d1f5d066677dc6cfabc929c9d3cf6db8 | ORPH
   sparc     |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/bc273d57a273ffef49cd20780a4790d8c68395e6 | ORPH
   x86_64    |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/81435d8dc3f7cba380b0f8528dbacc483d21c8a8 | ORPH
    i686     |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/4746697137ad96daecd64e7a22e57b37edb50c4a | ORPH
  aarch64    |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/71ed3cc3b92f5306713728ce52c6a1549a46cb81 | ORPH
  riscv64    | brcm-patchram-plus-15bd6638... | NOK | https://autobuild.buildroot.org/results/a753c8fc61a99200bec0827cabfd2261ce41223d |     
powerpc64le  |         c-icap-0.5.10          | NOK | https://autobuild.buildroot.org/results/5b6e92dab7a39d8ef2f6f705e241e3c00aa9f8d0 | ORPH
  mips64el   |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/96959f4ab93c2dfa689b704b5f1bd8ca5f839994 |     
powerpc64le  | cegui-00b4e1fe174da53b7ed72... | NOK | https://autobuild.buildroot.org/results/981b6c99f43395ae3312a39c45f182b5e1ef0441 | ORPH
    i686     | cegui-00b4e1fe174da53b7ed72... | NOK | https://autobuild.buildroot.org/results/b93bc5228eeae359847ae6ee1d3284a9a5caeeea | ORPH
powerpc64le  |      chocolate-doom-3.0.1      | NOK | https://autobuild.buildroot.org/results/e5894ccaabbf7a5cdaebd833b00ec2ef9d871aac |     
   armeb     |      chocolate-doom-3.0.1      | NOK | https://autobuild.buildroot.org/results/00bace4a9e0750c43548bab227006a5a246d34f8 |     
  riscv64    |        containerd-2.0.2        | NOK | https://autobuild.buildroot.org/results/62f5dfda5c69245165c7e66ceb07bd02b6c87fc0 |     
    i686     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/7f31f8c12493073df654ec38389936aaf2ced509 | ORPH
    arm      |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/de5e39631fe5c21ed3833b31f8e8ddf3896b9c84 | ORPH
 aarch64_be  |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/a883b6cec37a94e91f20d198f899f2ab2e0f4965 | ORPH
   s390x     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/113dd68f5f9201357fe21d8eddbc5ee0c1717fa4 | ORPH
   sparc     |         dc3dd-7.2.641          | NOK | https://autobuild.buildroot.org/results/6b4b62d7f0e4f8a2be5a207f5e3699739f1eaa77 | ORPH
   sh4aeb    |        dvbsnoop-1.4.50         | NOK | https://autobuild.buildroot.org/results/5547670f5a357f8fdcbb206a38aaa98708d6c5b2 |     
 aarch64_be  |       ecryptfs-utils-111       | NOK | https://autobuild.buildroot.org/results/c50f95d0caf6b04bd5c45cd2a02f006fe988ea8b |     
   mips64    |         expect-5.45.4          | NOK | https://autobuild.buildroot.org/results/c777718639f6a3efabd6d42e1c6cebc28e68ba1d | ORPH
powerpc64le  |           ficl-4.1.0           | NOK | https://autobuild.buildroot.org/results/4aa29aeacbf2ef7c84bffc3018fcb302dde57f2f |     
  powerpc    |        fluent-bit-4.0.3        | NOK | https://autobuild.buildroot.org/results/a688b241716e36d7302ed108c4e345781562b34f |     
microblazeel |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/a09bc146e2b37cf7b812112a085cf6e31fe344cf | ORPH
loongarch64  | glibc-2.41-5-gcb7f206537240... | NOK | https://autobuild.buildroot.org/results/26cadd29800f87cba778774ac23fd3d8d3cc6b41 |     
loongarch64  | glibc-2.41-5-gcb7f206537240... | NOK | https://autobuild.buildroot.org/results/212822b8ab9f359e9bc363a63c27f02859a593a0 |     
    i686     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/f1fe65a39dc82d12aa5b69c56d7662575548b399 | ORPH
  sparc64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/44bdde1f1809772ed22ad623a32e5e7734c28f2c | ORPH
   sh4aeb    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/fe7af14388f82f1cbee7feee7300b5f5b568276e | ORPH
 aarch64_be  |           gpm-1.20.7           | NOK | https://autobuild.buildroot.org/results/78d6bc28f29f14e1119817961e2c8dd73ae6e187 |     
 microblaze  |     host-berkeleydb-5.3.28     | NOK | https://autobuild.buildroot.org/results/c5ce1a92b6efddd0afbe20df155f5d0135055669 | ORPH
  aarch64    |     host-berkeleydb-5.3.28     | NOK | https://autobuild.buildroot.org/results/ecd45c58e5a6a933aafc97aeff0713a428064293 | ORPH
   x86_64    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/0775f048564e881ec2224152d0f8bca02c435ba7 |     
   x86_64    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/04b947a86708894230489e7c259153974d1fa8ff |     
   x86_64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/89f71237c46ccdd501938150ac26891319500027 |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/b58d98ce30cac3d359fd25050f3ab0af329d92b8 |     
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/74d17ee4cd11cdb6835b0251201fe2ee9740c1da |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/0c0a3618c7337db35ccb12243d66bd7036b9fc0f |     
    arc      | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/9c2ffc7615046c08cb1f534e91c20e8813bcacc8 |     
loongarch64  |     host-gcc-final-14.3.0      | NOK | https://autobuild.buildroot.org/results/82f3a577f774abcef8bd44e22ae91fbddb0ca15b |     
loongarch64  |     host-gcc-final-14.3.0      | NOK | https://autobuild.buildroot.org/results/7e49c7985bcb703db705cc1be17ebef1e4691a70 |     
loongarch64  |     host-gcc-final-14.3.0      | NOK | https://autobuild.buildroot.org/results/e6cf709da6700d3c9135027b640023149f4d2000 |     
loongarch64  |    host-gcc-initial-15.1.0     | NOK | https://autobuild.buildroot.org/results/67a2b3627ec521a15d9f6680165a968e818745b8 |     
   armeb     |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/6f156b5b26edbf8a335ec61177ff2797805ac87b | ORPH
 powerpc64   |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/cad671092f21a07fba5053c9b0af6cb0401210f9 |     
  aarch64    |   host-python-maturin-1.9.1    | NOK | https://autobuild.buildroot.org/results/c5af7d59416d1f12fa796ccfb07d759926896430 |     
  sparc64    |        host-vde2-2.3.3         | NOK | https://autobuild.buildroot.org/results/60638c39d672be12b30fe923a5944cd2ec8a5df4 | ORPH
  mips64el   |          iozone-3.506          | NOK | https://autobuild.buildroot.org/results/5009ac44e512756ad306010e1e24791fe44a192f |     
    arm      |          janet-1.35.2          | NOK | https://autobuild.buildroot.org/results/4f86d82f1cabb8d2a732cfab49900f3e382c7950 |     
   mipsel    |          kexec-2.0.31          | NOK | https://autobuild.buildroot.org/results/d77e5a212ce255c4de864e6afd024d58caa92afc |     
   armeb     |           kmon-1.7.1           | NOK | https://autobuild.buildroot.org/results/7c1494d299be72150cad6a4ed9dc609076039ef7 |     
  mips64el   |    libabseil-cpp-20250127.0    | NOK | https://autobuild.buildroot.org/results/53905e45ea95a4a98c774b9bee5c0372e2b2305f |     
   s390x     | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/5a6bc41fafc2f90c4b2003eb868e61b410ff2731 |     
   s390x     | libdill-32d0e8b733416208e04... | NOK | https://autobuild.buildroot.org/results/24eaea853d2ed4bf6cedf00e400adc8ea803c61f |     
 aarch64_be  | libftdi1-v1.5-48-g22b4667a8... | NOK | https://autobuild.buildroot.org/results/423e69ebfcdc5124163b25e77e21ac6ac705836d |     
   s390x     |         libgee-0.20.6          | NOK | https://autobuild.buildroot.org/results/353da44ee514850acf5bd71811b2805739c40524 |     
    arm      |          libjwt-3.2.0          | NOK | https://autobuild.buildroot.org/results/bd5ffb593a6273d076a373d488c364bdbc5dfe62 |     
  aarch64    |     liblog4c-localtime-1.0     | NOK | https://autobuild.buildroot.org/results/b0c1acf5498730397557096e7806d11f43ea1b2b |     
powerpc64le  |         liboauth-1.0.3         | NOK | https://autobuild.buildroot.org/results/f67435eaf095f2a7f398549cd5082425eb0cc84f | ORPH
 aarch64_be  |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/4a49b4fbc3234fb4305ffa5403ead3441b5faaf9 |     
   armeb     |         libressl-3.9.2         | NOK | https://autobuild.buildroot.org/results/0548960b7741cabdd9723b5cc18d7a517e1db808 | ORPH
   mips64    |         libressl-3.9.2         | NOK | https://autobuild.buildroot.org/results/eb4a03de74c1281faae632205ef99706576d8812 | ORPH
    arm      |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/e53c9134d58d28bbb02da319543acaadd0f9f910 |     
    mips     |         libshout-2.4.6         | NOK | https://autobuild.buildroot.org/results/b9fe5f8b66e638c9d79a034092c8c689cd6bf6c1 | ORPH
   xtensa    |         libshout-2.4.6         | NOK | https://autobuild.buildroot.org/results/2bb28f687e8044fb0f0f5f2bf0723601ffa4c581 | ORPH
  aarch64    |         libspdm-3.5.0          | NOK | https://autobuild.buildroot.org/results/f84de8c5a987f111e743c2f5ffe75b60153f7325 |     
 aarch64_be  |         libspdm-3.5.0          | NOK | https://autobuild.buildroot.org/results/48077a130ee6b9f756e042f4630e6e29c6e28c78 |     
   mipsel    |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/0bd167af7ff6d0c88f6d88cfd9d1bffe43d11dce |     
   xtensa    |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/c78cc9e004e3e6c371a10961c9ab885dc5630846 |     
   mips64    | libsvgtiny-ea9d99fc8b231c22... | NOK | https://autobuild.buildroot.org/results/f590b7162f76c35b33f4ad548d2f53bebcf82886 | ORPH
 powerpc64   | libsvgtiny-ea9d99fc8b231c22... | NOK | https://autobuild.buildroot.org/results/1c87ae96fa60ae0a26e4fac00d500a60a8eb1d9f | ORPH
    m68k     | libsvgtiny-ea9d99fc8b231c22... | NOK | https://autobuild.buildroot.org/results/fb5ac75c848782d762f59676b3f483947262fa4a | ORPH
    i586     |          linux-6.15.8          | NOK | https://autobuild.buildroot.org/results/7bccf470164ee01c3fb057978469f22d1167264b | ORPH
loongarch64  |     linux-headers-5.10.240     | NOK | https://autobuild.buildroot.org/results/70fbbdf63af24b1fa01347bc463d901b48e8bbc6 | ORPH
loongarch64  |     linux-headers-5.10.240     | NOK | https://autobuild.buildroot.org/results/c07e2e76dae4ba49e702509ea8a0b663fb1873e2 | ORPH
loongarch64  |     linux-headers-5.4.296      | NOK | https://autobuild.buildroot.org/results/142f5e1bf1a4318f41c63985fa2f3362e66f8c31 | ORPH
    i686     |          linux-tools           | NOK | https://autobuild.buildroot.org/results/ada9b325ff4bafa1571d8b4cb4e5ad7add3d000e | ORPH
    arm      |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/ab554bbd4e646a19971f93d7d54e8a8f6d4601c9 |     
microblazeel |     ltp-testsuite-20250530     | NOK | https://autobuild.buildroot.org/results/66169db2727608f27c814666a154c9dacc9f95bc |     
powerpc64le  |          nanocom-1.0           | NOK | https://autobuild.buildroot.org/results/ccc744378c6f6449ff07e1556cdf79737627f643 |     
   mipsel    |          nanocom-1.0           | NOK | https://autobuild.buildroot.org/results/11f131a0087d0c9f0ca8eaee9ac074fdbcab4732 |     
powerpc64le  |        netavark-v1.15.2        | NOK | https://autobuild.buildroot.org/results/4c1ba522fd80f0217dbf64072cd659ff0983749a | ORPH
 aarch64_be  |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/49f54b657c6d781192c0a4495917b268546db623 | ORPH
    or1k     | open-plc-utils-1ba7d5a042e4... | NOK | https://autobuild.buildroot.org/results/a78f1bad3c0e0eec2383baa8b880c4b62ffdfe54 | ORPH
   arceb     |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/bf8d768726d107ecbf2b8f4952c1b393d339d443 | ORPH
    or1k     |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/f853afee46cefc686ed66c9e8e58e2d8da6ae0d1 |     
    mips     |         pipewire-1.2.7         | NOK | https://autobuild.buildroot.org/results/d4f915902624536484a23f1ffe5a15eccd8b66f7 |     
   x86_64    |          prboom-2.5.0          | NOK | https://autobuild.buildroot.org/results/e228f1c63bfbe5eec78de7497b0d72ed37c86156 | ORPH
    mips     | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/e5d15d087c382fb47d127ef4ed08393f9afe85f0 |     
    mips     | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/f72a4a048406ecb6239ada9cb35d80e681d50c6c |     
   sh4aeb    |       python-webpy-0.62        | NOK | https://autobuild.buildroot.org/results/a73e749ced136274df64acfc928d254e23533c29 |     
   x86_64    |       python-yarl-1.18.3       | NOK | https://autobuild.buildroot.org/results/c10722ba5eb6c68de4b59ae4664a0d3da968a4c2 |     
microblazeel |       python-yarl-1.18.3       | NOK | https://autobuild.buildroot.org/results/d5dabb0e5eb3ef8359f50307d288bb954a84e072 |     
    i686     |       python-yarl-1.18.3       | NOK | https://autobuild.buildroot.org/results/084bd1f57f9e4787e5b2280822e552931232dfa6 |     
  mips64el   |       python-yarl-1.18.3       | NOK | https://autobuild.buildroot.org/results/66f5c2492eda68bcf6e4dd05d809057391ada01b |     
 microblaze  |       python-yarl-1.18.3       | NOK | https://autobuild.buildroot.org/results/57feb082ce6ce0ae15622858a25f26b4e0e7d2e4 |     
   sh4aeb    |         python3-3.13.5         | NOK | https://autobuild.buildroot.org/results/641cec6cd7c6e6ccdfa70308fd9355afb788251d |     
    sh4a     |     s6-linux-utils-2.6.2.1     | NOK | https://autobuild.buildroot.org/results/e89345ac2f81a61d710ded6d9057c2878badf459 |     
   x86_64    |         s6-rc-0.5.5.0          | NOK | https://autobuild.buildroot.org/results/08a0cff019030d37b0b27ab49d653505d61f7872 |     
   arceb     |      sane-backends-1.1.1       | NOK | https://autobuild.buildroot.org/results/aa56df2ffb956b98662523acd014fd858c32e073 |     
   mipsel    |           sdl-1.2.15           | NOK | https://autobuild.buildroot.org/results/5aa0781559cf66bbecf5bb1619e7054d55621822 | ORPH
 microblaze  |        skalibs-2.14.3.0        | NOK | https://autobuild.buildroot.org/results/af9806833bb9c92c9f5958ae7e1e8fe0b887c077 |     
 aarch64_be  |        skalibs-2.14.3.0        | NOK | https://autobuild.buildroot.org/results/f63a3e60769a7544536baa65daec652dff466451 |     
  sparc64    |           sslh-2.0.1           | NOK | https://autobuild.buildroot.org/results/261f29382ed5adfa43303a364e0c60bb4fd9c609 | ORPH
  powerpc    |           sslh-2.0.1           | NOK | https://autobuild.buildroot.org/results/b3bc32e2b26aa86661c143ed6054928d47238a48 | ORPH
powerpc64le  |        tinyssh-20240101        | NOK | https://autobuild.buildroot.org/results/dd456369e3173576e6c64c966ea67937d64b5803 |     
    arm      | toolchain-external-bootlin-... | NOK | https://autobuild.buildroot.org/results/b1edf7b15655f34b08e7e085befe25a9edefe949 | ORPH
 aarch64_be  |            unknown             | NOK | https://autobuild.buildroot.org/results/919d4d46ee72b692d10fdc98cf5e0988db16ed9b |     
  riscv64    |       util-linux-2.41.1        | NOK | https://autobuild.buildroot.org/results/6853551591318af2fc2e415a059fcfe7b1914f81 | ORPH
  riscv64    |       util-linux-2.41.1        | NOK | https://autobuild.buildroot.org/results/eb468a16e6743a41a4ba7354f98b3e27bfa5b810 | ORPH
  riscv32    |       util-linux-2.41.1        | NOK | https://autobuild.buildroot.org/results/06a162a4ded39d9a207ccb0aa5f9847d6c42df24 | ORPH
 microblaze  |     vulkan-headers-1.4.317     | NOK | https://autobuild.buildroot.org/results/da513b52105aa7beb7bb9eedddb02cefbd5424e4 | ORPH
   sh4aeb    |     vulkan-headers-1.4.317     | NOK | https://autobuild.buildroot.org/results/a04b452e48d3ef4f1076208ba0fd481b7aa961af | ORPH
   s390x     |           wipe-2.3.1           | NOK | https://autobuild.buildroot.org/results/81f505f863a068730a63fa92e2926841935e0dd6 | ORPH


Classification of failures by reason for 2025.02.x
--------------------------------------------------

               bctoolbox-4.4.8 | 1 
                  bcusdk-0.0.5 | 1 
                 dc3dd-7.2.641 | 1 
              host-rust-1.82.0 | 1 
             parsec-tool-0.7.0 | 1 
              skalibs-2.14.2.0 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 microblaze  |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/ffc82a89e7bbdc21fb8cad45c82fe7c0163c7859 | ORPH
    arc      |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/05a7bc165762b2535ce65f1ce1315f82a764edb2 |     
   mipsel    |         dc3dd-7.2.641          | NOK | https://autobuild.buildroot.org/results/514c0d0770434d89ac1868b461f33008cc26f818 | ORPH
   x86_64    |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/d709bd6df350515361f3365298edf6f1a84371de |     
powerpc64le  |       parsec-tool-0.7.0        | NOK | https://autobuild.buildroot.org/results/43720865e786ff554b830f84fd24cb9de25e2ac6 |     
 powerpc64   |        skalibs-2.14.2.0        | NOK | https://autobuild.buildroot.org/results/e6052cab85eb9508fee276929d7673a0ccf58622 |     


Classification of failures by reason for 2025.05.x
--------------------------------------------------

      passt-2025_02_17.a1e48a0 | 1 
              skalibs-2.14.3.0 | 1 
               syslog-ng-4.8.1 | 1 


Detail of failures for 2025.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 microblaze  |    passt-2025_02_17.a1e48a0    | NOK | https://autobuild.buildroot.org/results/f7a0cf1da2e0c82d0e43fa2a1a8b620fc09c85cb | ORPH
   xtensa    |        skalibs-2.14.3.0        | NOK | https://autobuild.buildroot.org/results/1349200f133c96dd858c59537ee8a3bcbe88e32a |     
    m68k     |        syslog-ng-4.8.1         | NOK | https://autobuild.buildroot.org/results/42f1dc522208671c7a2592aa968c80130278e6e9 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
