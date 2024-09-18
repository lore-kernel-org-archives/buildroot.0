Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4588CAC5B2
	for <buildroot@archiver.kernel.org>; Wed, 18 Sep 2024 03:18:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7529E60E15;
	Wed, 18 Sep 2024 03:18:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xuWcD3iZKMfi; Wed, 18 Sep 2024 03:18:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D244760E18
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D244760E18;
	Wed, 18 Sep 2024 03:18:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A38D41BF215
 for <buildroot@lists.busybox.net>; Wed, 18 Sep 2024 03:17:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9286260E2A
 for <buildroot@lists.busybox.net>; Wed, 18 Sep 2024 03:17:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id go__JGIODbbG for <buildroot@lists.busybox.net>;
 Wed, 18 Sep 2024 03:17:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::635; helo=mail-ej1-x635.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B555960E15
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B555960E15
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B555960E15
 for <buildroot@buildroot.org>; Wed, 18 Sep 2024 03:17:56 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a8b155b5e9eso879149166b.1
 for <buildroot@buildroot.org>; Tue, 17 Sep 2024 20:17:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726629474; x=1727234274;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Te9urGb2e9ls+t8L2V+3vMxWtEJVQPs5OMai0baytBs=;
 b=IHhe5kU9QNLaq3m8x6BXQDty/QhP+3USiImH1+3a+tvHITuRgguUWQEdpPIoX3sCFY
 o771wDYM5p8uOwDirt9LGJx+54GebezcyfdaPJApaZ++pY1+5rr0/h7RMrjUZQzpD21n
 rxsmG2lOl9RkV9k5npbYqoaNN/KeZx7iN5ENwywibdkev4Oi5sMJWX02W4r4pX7VRXhm
 h1VSOERZWJxMnBa0UrN/2uaMlWIr4bscn0GRpziMuiEU4GhpeX0M4Z1mdRRMI7bCWt5M
 oRhD45AcRQc+zJSEwksh3NTik2w5ouL/1EYZUAyxDmZVbZqaeN466s+gtbMAujvAOyuy
 8haQ==
X-Gm-Message-State: AOJu0YyDH+kfvkz2hUey0H8ZxkR+VAKeneXabBEfH8RFzw0F4UhcTrPS
 hRHpFd6E7ZIEaAndHaZjI39ShuVgnTh2l9jhRzQn9F5s4B/bJ8/MsfMXxQ==
X-Google-Smtp-Source: AGHT+IFu3jpFJkX9sC1oh7PfRGdYj6ZPI/wMu+uG0JF7egEeHVNz/eGGPgsLgRsOyT1Sdqtdq7gOTA==
X-Received: by 2002:a17:906:6a12:b0:a86:8d83:542d with SMTP id
 a640c23a62f3a-a9029617539mr1995582366b.45.1726629474222; 
 Tue, 17 Sep 2024 20:17:54 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a90610f151esm522517766b.48.2024.09.17.20.17.53
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Sep 2024 20:17:54 -0700 (PDT)
Message-ID: <66ea4662.170a0220.29e86b.0d5f@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Wed, 18 Sep 2024 03:17:53 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726629474; x=1727234274; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=Te9urGb2e9ls+t8L2V+3vMxWtEJVQPs5OMai0baytBs=;
 b=V+bc8qer68Y56efjyrrtLw7sbrbK9ZaD8QPPWZZYSF9w4hX1FLZx2eOoxub0IFA+ip
 akJ2pM6Pz2uf2NSl8bh4VMLhrxEWxKY5Zr/8F8bFx8PIh5DA/OOejQwgVGPeyzh/vxn1
 XYqgjxCpE7A4DKhTf53P5trlNewf5qfoRftoEZwKgZ6X99Q7OpKBdpVvvtlbVBcUGtgq
 HLJo2vpd+ZBTPvokEqn+c5mdhdth48ce9g392u2jMPG1Y/d3mxyA1ckrw+QZ3/vVq3Zv
 KsPrt21Mq8yUQ2VmbfETuVlXH9IJu23dItfsRZThGdCrIwXkDlXTKOhiMiTxXxuVAEFm
 Wt8A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=V+bc8qer
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2024-09-17
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

Autobuild statistics for 2024-09-17
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  9  | 10  |  0  | 19  |
  2024.05.x  |  9  | 11  |  1  | 21  |
  2024.08.x  |  3  |  6  |  0  |  9  |
    master   | 11  | 82  |  1  | 94  |

Classification of failures by reason for master
-----------------------------------------------

             bluez5_utils-5.77 | 8 
               procps-ng-4.0.4 | 6 
           host-librsvg-2.50.9 | 5 
                  bind-9.18.28 | 4 
          linux-5.10.162-cip24 | 4 
                  linux-6.10.9 | 4 
           at-spi2-core-2.50.0 | 3 
     linux-5.10.162-cip24-rt10 | 3 
                 apache-2.4.62 | 2 
                    bsdiff-4.3 | 2 
            gdk-pixbuf-2.42.10 | 2 
                 gnuplot-6.0.1 | 2 
           host-doxygen-1.8.18 | 2 
host-heimdal-f4faaeaba371ff... | 2 
              host-rust-1.80.1 | 2 
                  ntp-4.2.8p18 | 2 
                acpitool-0.5.1 | 1 
aubio-152d6819b360c2e7b379e... | 1 
                benejson-0.9.7 | 1 
                   bird-2.15.1 | 1 
          cryptodev-linux-1.13 | 1 
                   cvs-1.12.13 | 1 
                  evilwm-1.4.3 | 1 
                  ffmpeg-6.1.2 | 1 
       freeradius-server-3.2.6 | 1 
              gcc-final-13.3.0 | 1 
glibc-2.40-18-g564178076272... | 1 
         gobject-introspection | 1 
            host-binutils-2.42 | 1 
         host-gcc-final-13.3.0 | 1 
                host-go-1.22.7 | 1 
jailhouse-e57d1eff6d55aeed5... | 1 
                libdrm-2.4.123 | 1 
                 libv4l-1.28.1 | 1 
               linux-pam-1.6.1 | 1 
                   ltris-1.3.2 | 1 
               mariadb-10.11.6 | 1 
                     mdadm-4.3 | 1 
                   mimic-1.1.0 | 1 
                    mpir-3.0.0 | 1 
               pcsc-lite-2.1.0 | 1 
               popperjs-1.16.0 | 1 
               postgresql-16.4 | 1 
    python-cryptography-43.0.1 | 1 
        s6-linux-utils-2.6.2.0 | 1 
                       unknown | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |         acpitool-0.5.1         | NOK | https://autobuild.buildroot.org/results/edf08b5da94df8a0d844aae02e0b56b681b65dce |     
  riscv64    |         apache-2.4.62          | NOK | https://autobuild.buildroot.org/results/57b96430588842d9883e0d70f8d6b5981f0422f1 |     
  sparc64    |         apache-2.4.62          | NOK | https://autobuild.buildroot.org/results/306a0185177e29609a7374cb66e41efe57b36794 |     
  aarch64    |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/2844dacc0c98ace439b5b56cc50614909a72a6cb |     
   x86_64    |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/c4dc28f6172559de0b45f5d5c45ca6d714264683 |     
   mipsel    |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/13c29709fd0687f5edefd5fa7948055edad65c42 |     
 microblaze  | aubio-152d6819b360c2e7b379e... | NOK | https://autobuild.buildroot.org/results/e6c6a6b802c24ccccacc8406e340be885def00a3 |     
   arceb     |         benejson-0.9.7         | NOK | https://autobuild.buildroot.org/results/a08225746d629bb2a5702185ffde4f4ae51fb200 |     
    or1k     |          bind-9.18.28          | NOK | https://autobuild.buildroot.org/results/bfc0c0b93c27d23fe53d30c955cb224a9a32b6b1 | ORPH
 microblaze  |          bind-9.18.28          | NOK | https://autobuild.buildroot.org/results/c23ffde27a52d3171709bc8d66614de2733a08dd | ORPH
microblazeel |          bind-9.18.28          | NOK | https://autobuild.buildroot.org/results/9a113837dd9c734e4d796ff354c61b799ba6fb0e | ORPH
   x86_64    |          bind-9.18.28          | NOK | https://autobuild.buildroot.org/results/bcfb8e2e5cadeda8a344b77b90779236a4e97d99 | ORPH
    or1k     |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/30487a72170a5c34a64241facfac30817a67ed49 |     
  riscv64    |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/32e7d6faf0b7c96b81960db9efed49b3e2d41749 |     
  mips64el   |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/9ca67c39b4ce40ea7744f234afdbf14f985975ec |     
powerpc64le  |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/4668bca1878bc41f41202f086973f8e423e627df |     
microblazeel |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/8e54aa01b58436749ce83086ae76f8d62ef21d36 |     
   nios2     |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/3d41fc44035b3350ec7a982db1086817fae1d89d |     
powerpc64le  |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/21f22002a71f555db0c70e21c7534a019cb05a7b |     
powerpc64le  |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/d0daef2f41f392ba3ef95e7df6028b3bfb2a769b |     
   s390x     |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/20c17f3c5815fbced23d51155a499762d6f81331 |     
    mips     |           bsdiff-4.3           | NOK | https://autobuild.buildroot.org/results/9a999f6c5f5d5ae90bf8dfb8a51800d33b552db1 | ORPH
powerpc64le  |           bsdiff-4.3           | NOK | https://autobuild.buildroot.org/results/3b3721a727e7a0f24dd6f89286ea6a1a326932f9 | ORPH
   mipsel    |      cryptodev-linux-1.13      | NOK | https://autobuild.buildroot.org/results/fd6f6be89850e637bceb2bed7718f0e80104353a | ORPH
  sparc64    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/f152a226cc309c18e0b668f99e8ed2f3d57f7038 | ORPH
   mipsel    |          evilwm-1.4.3          | NOK | https://autobuild.buildroot.org/results/f152c27a04aff6b1e8c1c4162938b105117067c5 |     
  riscv32    |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/727d417ae2aa062f0a547aa5fecf271f54229589 |     
  sparc64    |    freeradius-server-3.2.6     | NOK | https://autobuild.buildroot.org/results/f909d1f7315028fc0a7c019508579b6e23e6927a |     
  powerpc    |        gcc-final-13.3.0        | NOK | https://autobuild.buildroot.org/results/b58c3c3eb363cbe1e0858e4ae8ecff0e1bd5fc15 |     
   armeb     |       gdk-pixbuf-2.42.10       | NOK | https://autobuild.buildroot.org/results/2504a9ca8b83f645675c6709847a0710f13eaed1 | ORPH
   armeb     |       gdk-pixbuf-2.42.10       | NOK | https://autobuild.buildroot.org/results/1211cdd82710ae567a03f9a62348fd8c51f007aa | ORPH
  riscv64    | glibc-2.40-18-g564178076272... | NOK | https://autobuild.buildroot.org/results/babb983df7d001609873d3d222e9f5561f5fd0d9 |     
    or1k     |         gnuplot-6.0.1          | NOK | https://autobuild.buildroot.org/results/5f5a24fb93ded8827d193e588cb5a2a3e96ec1a6 |     
microblazeel |         gnuplot-6.0.1          | NOK | https://autobuild.buildroot.org/results/a33f8ca817c27b4bc75a81ea09454af62093fd60 |     
microblazeel |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/fbf7fee47a639b8fd33747aa8dbb2aaf1dd224f8 |     
   x86_64    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/821e1a94e8e3b5992748821cf33cecccb36f1b59 |     
  riscv64    |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/eb66d365e33767816894fd6f9c846db1940f242f | ORPH
   sh4eb     |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/43901cfddd0a583f2e0bbbc2f0089be1b660c4e4 | ORPH
   arceb     |     host-gcc-final-13.3.0      | NOK | https://autobuild.buildroot.org/results/d6bb38847f46bd93499afffa7a99c26e163e54b9 |     
  powerpc    |         host-go-1.22.7         | NOK | https://autobuild.buildroot.org/results/eea2b26918e29ba2d4d91f36e3678952589a6805 |     
microblazeel | host-heimdal-f4faaeaba371ff... | NOK | https://autobuild.buildroot.org/results/a064e42d34f827b076c872d6689dadc945ed9e63 | ORPH
    mips     | host-heimdal-f4faaeaba371ff... | NOK | https://autobuild.buildroot.org/results/ee9045ba6ff0a9e1e4bc5f5823aa8ae4f3a545f9 | ORPH
   sparc     |      host-librsvg-2.50.9       | NOK | https://autobuild.buildroot.org/results/53d1c9c6c380218ec93e261bd4b0e0b19fb9d04e |     
   mipsel    |      host-librsvg-2.50.9       | NOK | https://autobuild.buildroot.org/results/e25160144cdf88c84489099ba056465d2d8b02f4 |     
  riscv64    |      host-librsvg-2.50.9       | NOK | https://autobuild.buildroot.org/results/ce3622021dcf6a1c931db67bda5f58012109989a |     
  riscv64    |      host-librsvg-2.50.9       | NOK | https://autobuild.buildroot.org/results/adb2b716c8e5eb07c2d8c541cb466a7e39e1a974 |     
   armeb     |      host-librsvg-2.50.9       | NOK | https://autobuild.buildroot.org/results/8c841f69e1e7e6efe515440bba6a52318efe0a22 |     
 powerpc64   |        host-rust-1.80.1        | NOK | https://autobuild.buildroot.org/results/d1490098596824984cd638ff155ecc2cfd425ed2 |     
  aarch64    |        host-rust-1.80.1        | NOK | https://autobuild.buildroot.org/results/6fb33ee93c5baad0d36b461e47f97e3394a2e711 |     
   x86_64    | jailhouse-e57d1eff6d55aeed5... | NOK | https://autobuild.buildroot.org/results/a5d64a34b54401aa84cd4e3abef407bc2b848e3b |     
   sparc     |         libdrm-2.4.123         | NOK | https://autobuild.buildroot.org/results/e85d5f6067281fabf4716fcde3ec8cc51128b3d0 |     
    i686     |         libv4l-1.28.1          | NOK | https://autobuild.buildroot.org/results/a248cbb221e6e7262d60efcd474a5cd95972c6ef |     
    arm      |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/26947e1c03a0d15ce5500be37d4412cb13011230 | ORPH
    i686     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/0e251f9f751c298dca2cabf3d0164ebca6dda586 | ORPH
    mips     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/f288a5896cfc78aa1667912c66123f264c95644b | ORPH
   nios2     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/4a46ac04ab0fd036ebd7075750339cf8d7d9d0fa | ORPH
    m68k     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/5bed5620fa0241cf3dbc59d53d3cf988984b2163 | ORPH
   sh4aeb    |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/f2d192eb95d73470417d2705edc0a5cb22ee7294 | ORPH
   armeb     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/9dc8742d83a7e3acc65860f793ecca7ce46497ab | ORPH
    arm      |          linux-6.10.9          | NOK | https://autobuild.buildroot.org/results/8ba80b9aea60d34a0610bfd72b7c1841f9f4ee9a | ORPH
   x86_64    |          linux-6.10.9          | NOK | https://autobuild.buildroot.org/results/b7c7f41393ad6c801d02d8bc617f91c8bbc5c207 | ORPH
   mips64    |          linux-6.10.9          | NOK | https://autobuild.buildroot.org/results/cb6705c6c29b947cff68d81ed42095afa95a7f1b | ORPH
   nios2     |          linux-6.10.9          | NOK | https://autobuild.buildroot.org/results/b9eb78f6343a8e5ca87e9cdf8cf15b08ce5fe7ee | ORPH
microblazeel |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/f43b484f33a605ea4ba5c9839a1fb3977b3dfbd8 | ORPH
    arc      |          ltris-1.3.2           | NOK | https://autobuild.buildroot.org/results/f9b2a946de504552264e55e890bb7ed42fc16702 |     
   sparc     |        mariadb-10.11.6         | NOK | https://autobuild.buildroot.org/results/b93ed3f46ac1219787a280229bcb66c486933ac0 | ORPH
  aarch64    |           mdadm-4.3            | NOK | https://autobuild.buildroot.org/results/62a00741bb62aefb37b9967e73024e2a846bf464 | ORPH
powerpc64le  |          mimic-1.1.0           | NOK | https://autobuild.buildroot.org/results/46eae0a05a248ac1a3695ea214f2c2555eb2eada |     
 aarch64_be  |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/bc113174ff6800c99dc09093b40cc6bb425ed153 |     
microblazeel |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/79ca75785c12740008b4eed0787ea88abe8d114b |     
   sparc     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/3dadf380830c5affece03050138c47aefa59f11a |     
 microblaze  |        pcsc-lite-2.1.0         | NOK | https://autobuild.buildroot.org/results/efa98cc6966d0cfa22f327d7c14729304528cb6f | ORPH
   xtensa    |        popperjs-1.16.0         | NOK | https://autobuild.buildroot.org/results/f07b042735d24bf478fe99c47e60fec2d29482a1 | ORPH
   sparc     |        postgresql-16.4         | NOK | https://autobuild.buildroot.org/results/6170b96b2bdb62b727b00fc42341b786b9668d8b |     
   mipsel    |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/999e29126375c224cd2b486418c7d2361292d16f | ORPH
   mips64    |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/ed7fec7bc5eb57e2a148253692deb504635302cd | ORPH
  powerpc    |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/ba4c707cc4bca42635344a6db4652d5d9f1dd512 | ORPH
    i586     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/0e0dfc1e98746f0351b68eaf166d0dd9dde720c5 | ORPH
   armeb     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/47838d41a10ca790044c42c677074ed40698e515 | ORPH
   x86_64    |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/9130a8a27b91469a2493160ab419c56ab73b0e57 | ORPH
powerpc64le  |   python-cryptography-43.0.1   | NOK | https://autobuild.buildroot.org/results/f39c4be7645b9348acaedea025a9ef972f44f610 |     
  sparc64    |     s6-linux-utils-2.6.2.0     | NOK | https://autobuild.buildroot.org/results/9244f5768d8358f8a92f0f1cfc5d06643cccf144 |     
   s390x     |            unknown             | NOK | https://autobuild.buildroot.org/results/f1248d2e27d89fa02e10e66c78f2b187656bb618 |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

                  linux-6.6.44 | 2 
                  boost-1.83.0 | 1 
            gdk-pixbuf-2.42.10 | 1 
               host-go-1.21.13 | 1 
               ipmitool-1_8_19 | 1 
          libcamera-apps-1.2.1 | 1 
               mono-6.12.0.182 | 1 
                    ncmpc-0.49 | 1 
                       unknown | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |          boost-1.83.0          | NOK | https://autobuild.buildroot.org/results/a5e1eafc79965f3659865ccdd878fa9979d40e24 |     
  aarch64    |       gdk-pixbuf-2.42.10       | NOK | https://autobuild.buildroot.org/results/9731cb1a151015d3e9975b37a57ad85970b1de2c | ORPH
    mips     |        host-go-1.21.13         | NOK | https://autobuild.buildroot.org/results/569f7b90c0a47b9ffdd75178d0e88265d1188aba |     
 powerpc64   |        ipmitool-1_8_19         | NOK | https://autobuild.buildroot.org/results/89636ca12ab5faf90f3cec0dd417334e5dbb56ff |     
   sparc     |      libcamera-apps-1.2.1      | NOK | https://autobuild.buildroot.org/results/49ad4fb12dc3d435fe607436717e8ffe32b1209a |     
 aarch64_be  |          linux-6.6.44          | NOK | https://autobuild.buildroot.org/results/d709b14143d03441da6b4b68644d851eece52adf | ORPH
  riscv64    |          linux-6.6.44          | NOK | https://autobuild.buildroot.org/results/13d7a226236fc8b83ce0a247863e15cab727fc5a | ORPH
  powerpc    |        mono-6.12.0.182         | NOK | https://autobuild.buildroot.org/results/542390fd2df62d8b9e40fbc182103b79c3a19250 |     
 aarch64_be  |           ncmpc-0.49           | NOK | https://autobuild.buildroot.org/results/dbd2d149eb0e4695c990b7767ac12d01a7f3cd9e |     
    arc      |            unknown             | NOK | https://autobuild.buildroot.org/results/f8000b4374cc9f5cda0a26b837b151f62b93219d |     


Classification of failures by reason for 2024.05.x
--------------------------------------------------

                  boost-1.83.0 | 1 
                host-go-1.22.5 | 1 
host-heimdal-f4faaeaba371ff... | 1 
               lighttpd-1.4.76 | 1 
                    links-2.29 | 1 
          linux-5.10.162-cip24 | 1 
                  linux-6.8.12 | 1 
                     lxc-5.0.3 | 1 
                mongodb-4.2.18 | 1 
                    nodejs-src | 1 
python-unittest-xml-reporti... | 1 
              skalibs-2.12.0.1 | 1 


Detail of failures for 2024.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |          boost-1.83.0          | NOK | https://autobuild.buildroot.org/results/89b3fb67d0be2fba2f0e69d0117b47b9af6c27db |     
    sh4a     |         host-go-1.22.5         | NOK | https://autobuild.buildroot.org/results/287c0868fdde6dc277d1625b882e83dc75dd7b38 |     
  sparc64    | host-heimdal-f4faaeaba371ff... | NOK | https://autobuild.buildroot.org/results/a2c5c6afd7d2675b0a92bd7ce28d061ec91619f8 | ORPH
  sparc64    |        lighttpd-1.4.76         | NOK | https://autobuild.buildroot.org/results/1dac27faf84d21f72e7ccf68d74c69f1030aed2a | ORPH
powerpc64le  |           links-2.29           | NOK | https://autobuild.buildroot.org/results/191319418bffdaee0506e9d85457474107470e36 | ORPH
    m68k     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/aa98338b19bbbf3271fea584b07168533be1bff4 | ORPH
    or1k     |          linux-6.8.12          | NOK | https://autobuild.buildroot.org/results/5db9cec4faff56f3236f05a563f6a63974b3367e | ORPH
  aarch64    |           lxc-5.0.3            | NOK | https://autobuild.buildroot.org/results/2b7439a826e61bfa9275a60949a64d9e12d3212c |     
  aarch64    |         mongodb-4.2.18         | NOK | https://autobuild.buildroot.org/results/1433d33ee6d3c848439b7f8983dae64c3945a24d |     
  aarch64    |           nodejs-src           | TIM | https://autobuild.buildroot.org/results/6f9f02f35651f7c717f53fe5a8e2b60ca0a71d32 |     
    sh4a     | python-unittest-xml-reporti... | NOK | https://autobuild.buildroot.org/results/99575c0990c4c9bf88035b111c25e02d0bbad711 |     
    or1k     |        skalibs-2.12.0.1        | NOK | https://autobuild.buildroot.org/results/e5e8929c8447d05bb897335c72d382eedc2298f2 |     


Classification of failures by reason for 2024.08.x
--------------------------------------------------

                  linux-6.10.8 | 2 
glibc-2.39-74-g198632a05f6c... | 1 
                   lsuio-0.2.0 | 1 
                       unknown | 1 
                xenomai-3.0.10 | 1 


Detail of failures for 2024.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  | glibc-2.39-74-g198632a05f6c... | NOK | https://autobuild.buildroot.org/results/a840120975e5013cab67ba18ca37ef7a1ba1406c |     
  sparc64    |          linux-6.10.8          | NOK | https://autobuild.buildroot.org/results/f56f921c14e993faba093f1329a6d895ac2957c4 | ORPH
   nios2     |          linux-6.10.8          | NOK | https://autobuild.buildroot.org/results/5ee3855f3dcdba1747bfaca5d5f13f93dd028d56 | ORPH
   x86_64    |          lsuio-0.2.0           | NOK | https://autobuild.buildroot.org/results/3decf95c74e5cca180d76b20feaa76365f450c2d | ORPH
microblazeel |            unknown             | NOK | https://autobuild.buildroot.org/results/d6fd2c5ddc5e8e8ecb262881fc669602dd672ebb |     
   sh4eb     |         xenomai-3.0.10         | NOK | https://autobuild.buildroot.org/results/6a7d53162c1c936b6dec2a4d99ec0b6c43a184c5 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
