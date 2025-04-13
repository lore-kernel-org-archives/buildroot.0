Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1302DC369AB
	for <buildroot@archiver.kernel.org>; Sun, 13 Apr 2025 03:14:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4DC90821A0;
	Sun, 13 Apr 2025 03:14:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sLBhZ-OJoeOK; Sun, 13 Apr 2025 03:14:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 180D580BA3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 180D580BA3;
	Sun, 13 Apr 2025 03:14:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3DBD6DE
 for <buildroot@buildroot.org>; Sun, 13 Apr 2025 03:14:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2305C40611
 for <buildroot@buildroot.org>; Sun, 13 Apr 2025 03:14:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XebMEfLsDvDs for <buildroot@buildroot.org>;
 Sun, 13 Apr 2025 03:14:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::630; helo=mail-ej1-x630.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D306540655
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D306540655
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D306540655
 for <buildroot@buildroot.org>; Sun, 13 Apr 2025 03:14:41 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-aaee2c5ee6eso508253666b.1
 for <buildroot@buildroot.org>; Sat, 12 Apr 2025 20:14:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744514080; x=1745118880;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YS74bE6v8puKt5yyJtxHocloRvNiRSFQyamAciRbOpM=;
 b=Byh6FnL6J9VGQk54Z8JAl1oHHRcBjbT7OMqCPx+xzf2FTLDIuztBoZfbeYgtxpCrv3
 /rdYUac/s+j95kTfJhgePNlZp+8Fyx5mfLlb8ex6VeY2zXpJXAis1WzAcgCvDem+4gVF
 4r/Z3NslO6uMB2Vp8VEV7NdDeK2RBnjIx6UIdx8JqQIxSEwPlDmcbfNZ8Zst68UeMddo
 OsHYVBOVG7hmokfKYRN0QHNZCmtOkB4z/gcX2I+ZeP8LDadJ0HjcMDPmMNj/0+iWtHQA
 EEtXGk8Ydy167FEHkxZvN/+pc+4oDcPWib6sap+EwzNixTXTP4STXLykAOj47AsttJXv
 pAxQ==
X-Gm-Message-State: AOJu0YyXopqKWSAABiSt8Gzhz672BFyqBg7Zo+Dg+K7BXG1iKp16SoPD
 xSiKrz2bw001I3NEw1e/+PsU/FrMRT6cSFDcjTlMuPNE7aFazyTbX93QDw==
X-Gm-Gg: ASbGncumCtLFjqBGOqHnthf/wp9dktgSifVdevBQMkyaohzS3CfxQvGfvgmSmokgxnQ
 WxavdHGeqNCesV/0OOpMioAIjthkYmCgtiUtq/UUZyWg0SB08kz61IkJwmH8p+u0MWXyAIpRkQA
 FFERPrqZEtUELkLjHdl5OkLD7ogwWrBYG1eH1oXMtSUuqYWps6jx0Zj4fvinmRvkxrQvaWDH0EC
 ZmtJgKf/EVIgd7rabt2VY582wyFy+psCwcOomRj7GRjBMfjUtDxCddOH6QARgAqdeyOMhE75DEe
 MT8bXmMbnfIx6uAttWEw+5i4ClzdfSdYHZUvjy1nwR+z
X-Google-Smtp-Source: AGHT+IFW7IayjZwzkIGNlogi7cAHfXgdTv/OlY1EDqnlgendAQXlTwXi7/J6gkVsZn2Ro4Vf98RTfg==
X-Received: by 2002:a17:907:9810:b0:ac3:bf36:80e2 with SMTP id
 a640c23a62f3a-acad3489285mr707614566b.20.1744514079534; 
 Sat, 12 Apr 2025 20:14:39 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-acaa1ce70aesm681947566b.174.2025.04.12.20.14.39
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 12 Apr 2025 20:14:39 -0700 (PDT)
Message-ID: <67fb2c1f.170a0220.158275.6a1b@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sun, 13 Apr 2025 03:14:39 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744514080; x=1745118880; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=YS74bE6v8puKt5yyJtxHocloRvNiRSFQyamAciRbOpM=;
 b=QttzmShFUCB/24ym+bb0JAaxRGaBOge47L2TG0QB1Rz7vPcASDdphwYdgzeWx46zvL
 R6s0IY+HrCHFGuGLc8c2GJ4iG5qvmdxgTdhlE6gPrgt4bWJUbZ+BnN4fDpo1R3NiX2aM
 m8rUKp+GsIyy58OzGoaVP4bQ2PbdHbv7tQ1Q6GqEG7tlcms8F6WtUC8vJcWEst6qiKm6
 yS2tXJUKiFvRwC0L3s1c3hRuiL7dgzW1Jj9LU7X7/nyLi1ENcj/sACWYmPFAtaiMY39f
 p1SjQVcu9KN7PQRayPoWtT0nRrcU2LjqOqSy9xzhtl4QIDTJUX50D005npDrJsH+bzKO
 jKIQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=QttzmShF
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-04-12
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

Autobuild statistics for 2025-04-12
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  4  |  1  |  0  |  5  |
  2024.11.x  |  4  |  3  |  0  |  7  |
    master   | 14  | 56  |  0  | 70  |

Classification of failures by reason for master
-----------------------------------------------

    host-python-greenlet-3.1.1 | 5 
     bandwidthd-2.0.1-auto-r11 | 3 
              host-rust-1.82.0 | 3 
                 libv4l-1.28.1 | 3 
      passt-2025_02_17.a1e48a0 | 3 
           at-spi2-core-2.50.0 | 2 
                elfutils-0.192 | 2 
host-heimdal-f4faaeaba371ff... | 2 
     linux-5.10.162-cip24-rt10 | 2 
                  nginx-1.26.3 | 2 
   nxp-mwifiex-lf-6.6.52_2.2.0 | 2 
                 sudo-1.9.15p5 | 2 
             bluez5_utils-5.79 | 1 
             bmap-writer-1.0.2 | 1 
                 c-ares-1.34.2 | 1 
cpuinfo-8a1772a0c5c447df2d1... | 1 
                     criu-3.19 | 1 
             dahdi-linux-3.3.0 | 1 
        edk2-edk2-stable202411 | 1 
              fftw-quad-3.3.10 | 1 
                   fwupd-2.0.4 | 1 
glibc-2.41-5-gcb7f206537240... | 1 
                 host-gdb-14.2 | 1 
jailhouse-e57d1eff6d55aeed5... | 1 
                   libks-2.0.5 | 1 
                  liburing-2.6 | 1 
           libzenoh-pico-1.2.1 | 1 
          linux-5.10.162-cip24 | 1 
                  linux-6.13.8 | 1 
                   linux-tools | 1 
              mosquitto-2.0.20 | 1 
                     mtd-2.2.1 | 1 
                   perl-5.40.1 | 1 
               pulseaudio-17.0 | 1 
rtl8188eu-f42fc9c45d2086c41... | 1 
rtl8189fs-94cc959d56c1425fb... | 1 
                       unknown | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/9e3674db980e1d40f0f24d7d95d3422a30a8cafc |     
   mipsel    |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/573eb6b04723a18239153725313c46df93d42ca2 |     
   x86_64    |   bandwidthd-2.0.1-auto-r11    | NOK | https://autobuild.buildroot.org/results/c775dca029aa05b0651af0ba3e3cc1cb69f46f84 |     
    m68k     |   bandwidthd-2.0.1-auto-r11    | NOK | https://autobuild.buildroot.org/results/92b0b723607aceece90a407b56e1032dc5c24e1a |     
   sparc     |   bandwidthd-2.0.1-auto-r11    | NOK | https://autobuild.buildroot.org/results/1824a76eee4a877a2f19c1fd19a710ef9f059168 |     
   s390x     |       bluez5_utils-5.79        | NOK | https://autobuild.buildroot.org/results/caa9933ddac6c9f856f15d5f03fb3e57eabf2868 |     
   sparc     |       bmap-writer-1.0.2        | NOK | https://autobuild.buildroot.org/results/d3832c9d8d3f64f6136f97a5ba9ad40ec2d6f146 |     
   mipsel    |         c-ares-1.34.2          | NOK | https://autobuild.buildroot.org/results/b608831807af7caf6e18cdf46ba0b8d5e048506e | ORPH
    arm      | cpuinfo-8a1772a0c5c447df2d1... | NOK | https://autobuild.buildroot.org/results/a433a71c9d9bcc070c203e617c59c9db00a33605 |     
powerpc64le  |           criu-3.19            | NOK | https://autobuild.buildroot.org/results/d443a2f3338da63793c35989c712e1b9c52110db |     
   s390x     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/1969b7dbe702ebed5656b925c56799413bceffc4 | ORPH
    i686     |     edk2-edk2-stable202411     | NOK | https://autobuild.buildroot.org/results/73687439153afa49f4c46cf4bd8fdcbe4ed3f8c3 |     
 powerpc64   |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/4077c9473184afb90558df29f47cf60d59779d93 | ORPH
    i686     |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/7b4dd589d747202eadbb89c62fcb515f273c91e5 | ORPH
powerpc64le  |        fftw-quad-3.3.10        | NOK | https://autobuild.buildroot.org/results/f0d6182fbbdc5b13f784c48be2bf122ea65cdec5 | ORPH
microblazeel |          fwupd-2.0.4           | NOK | https://autobuild.buildroot.org/results/49bc748dc3c58e7fdecd82ef160dc57d8e8f92ee |     
   arceb     | glibc-2.41-5-gcb7f206537240... | NOK | https://autobuild.buildroot.org/results/fdfc82aab0d8170d9a4443857212c60ab756b79c |     
   sparc     |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/041b78a53532a17b6b9a91c618d43bc731be3d26 | ORPH
   x86_64    | host-heimdal-f4faaeaba371ff... | NOK | https://autobuild.buildroot.org/results/5d76a7a41bc1496f6473bc8849cbc56440ae55bc | ORPH
    mips     | host-heimdal-f4faaeaba371ff... | NOK | https://autobuild.buildroot.org/results/d016113fafd3d98d01e386bcfcd575159bcb9888 | ORPH
   sparc     |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/98ef2b6f057e5197c85bfd8b2b36b730b0b9a3a1 |     
   armeb     |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/4ec5f380e1b99d119b62d2f8144558b8b04afc2d |     
   mips64    |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/178139e92a627d201d86c1bb0debcb38aa917469 |     
 microblaze  |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/b40db3d0616a8c09e93e4247d27a5dca4965645c |     
   x86_64    |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/7d94fcca39bdde9fc41a302e85297f6eabfd8898 |     
  aarch64    |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/b91171e0ba55c2c983fe557abdc337cf2c4758ab |     
   s390x     |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/68dcf7b3a5145112c2cf4c1ca7768dd0ec83b910 |     
  sparc64    |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/daddb7ee3433102254cd4bb746b51371ed5528a2 |     
   x86_64    | jailhouse-e57d1eff6d55aeed5... | NOK | https://autobuild.buildroot.org/results/82c43d4fc9d04197931c95b6382fdf3d96eaa033 |     
  aarch64    |          libks-2.0.5           | NOK | https://autobuild.buildroot.org/results/e2b632c5f1084390c0afca4765d71b89fbfa39b8 | ORPH
   armeb     |          liburing-2.6          | NOK | https://autobuild.buildroot.org/results/420096efff6af11c3a026de52b4b08cfdf2fd55e |     
    i686     |         libv4l-1.28.1          | NOK | https://autobuild.buildroot.org/results/616608ef2a44efff67fa21b3263b341da82744c4 |     
  powerpc    |         libv4l-1.28.1          | NOK | https://autobuild.buildroot.org/results/f76b992ac6a392cc3e192f4228817720a4402449 |     
   mipsel    |         libv4l-1.28.1          | NOK | https://autobuild.buildroot.org/results/89c6c7c0fd991d777ac7cd2b2322424099fa89cc |     
   s390x     |      libzenoh-pico-1.2.1       | NOK | https://autobuild.buildroot.org/results/3bc597c583e15bc99b3a09eed7517412968378c6 |     
    i686     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/8a3686ec133a302d3214f3110b321e5331da32f2 | ORPH
    mips     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/2a6f5bc720efbf541d540f25763aab85baae9add | ORPH
   x86_64    |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/230653b329cc912d6a7c20bf39966df617597158 | ORPH
    i686     |          linux-6.13.8          | NOK | https://autobuild.buildroot.org/results/f9227fc9dcd0e9c6301ab4653df4719d3bd864e4 | ORPH
    or1k     |          linux-tools           | NOK | https://autobuild.buildroot.org/results/bb8b09890f0c96522cb9d106990d3c5511249ea8 | ORPH
    or1k     |        mosquitto-2.0.20        | NOK | https://autobuild.buildroot.org/results/f2d132465bc041f327be967fb1480c35cc1c5460 |     
  mips64el   |           mtd-2.2.1            | NOK | https://autobuild.buildroot.org/results/1db1a213c450b6f984bfb1dea72327578c934e73 |     
   sparc     |          nginx-1.26.3          | NOK | https://autobuild.buildroot.org/results/04d6cd2b1d5c70f654f792573d4c15b9c99b1251 | ORPH
   sparc     |          nginx-1.26.3          | NOK | https://autobuild.buildroot.org/results/1c74ada522626884e9e5def1dec2794e40331914 | ORPH
  sparc64    |  nxp-mwifiex-lf-6.6.52_2.2.0   | NOK | https://autobuild.buildroot.org/results/f3aeb4d0f79171de4cdcdb1a9bcca8a60cc73134 |     
   mipsel    |  nxp-mwifiex-lf-6.6.52_2.2.0   | NOK | https://autobuild.buildroot.org/results/078dc61f92e7a3e8980d1cdcfc090bdee74ef3a5 |     
 aarch64_be  |    passt-2025_02_17.a1e48a0    | NOK | https://autobuild.buildroot.org/results/7d0b08367af2dbfbc5f13dbd76a43078c61a6c51 | ORPH
   sh4aeb    |    passt-2025_02_17.a1e48a0    | NOK | https://autobuild.buildroot.org/results/ac8a9a89163058d5d4ad7447935e40c9e6883ab3 | ORPH
   sparc     |    passt-2025_02_17.a1e48a0    | NOK | https://autobuild.buildroot.org/results/62015aa9e3355f6ba57b94f32fc40da653ef7ec1 | ORPH
   xtensa    |          perl-5.40.1           | NOK | https://autobuild.buildroot.org/results/83ac1cccb4430aa49df96400fd57cfbff2ec90d0 |     
   armeb     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/e2c145bda6e80cae9307b6d27a66eb979a139bb3 | ORPH
  riscv32    | rtl8188eu-f42fc9c45d2086c41... | NOK | https://autobuild.buildroot.org/results/3052594f1e76d7f2655ae29be749636fe445ea3f |     
powerpc64le  | rtl8189fs-94cc959d56c1425fb... | NOK | https://autobuild.buildroot.org/results/111314e5f36240887eca367896a1bf4035997e07 |     
   xtensa    |         sudo-1.9.15p5          | NOK | https://autobuild.buildroot.org/results/c6d342e8123dd5a028c60f6c4c9623f4e548a12c | ORPH
   xtensa    |         sudo-1.9.15p5          | NOK | https://autobuild.buildroot.org/results/f94afd1e2b011a9c5ddaca5d7973b70889de943b | ORPH
   s390x     |            unknown             | NOK | https://autobuild.buildroot.org/results/005f097253118a8d8eeaa8959a4ca270b8a8e730 |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

      host-riscv-isa-sim-1.1.0 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |    host-riscv-isa-sim-1.1.0    | NOK | https://autobuild.buildroot.org/results/9112ba7018a39a0f793f9837e9e123f70e37e0c5 |     


Classification of failures by reason for 2024.11.x
--------------------------------------------------

             libargtable2-2.13 | 1 
     linux-5.10.162-cip24-rt10 | 1 
                    ncmpc-0.49 | 1 


Detail of failures for 2024.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   nios2     |       libargtable2-2.13        | NOK | https://autobuild.buildroot.org/results/eccca6a241cab0a7729fe163d2b7f6359d444fd4 | ORPH
   armeb     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/9318bc2fdc276c5975d072097debb50222f3be51 | ORPH
 aarch64_be  |           ncmpc-0.49           | NOK | https://autobuild.buildroot.org/results/1783f744d38184518ea6f2f8425e57e5bd61db51 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
