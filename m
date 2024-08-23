Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93264C52D7C
	for <buildroot@archiver.kernel.org>; Fri, 23 Aug 2024 03:17:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6DBD7607D2;
	Fri, 23 Aug 2024 03:17:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IMN6nJdR0noH; Fri, 23 Aug 2024 03:17:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 29259607D5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 29259607D5;
	Fri, 23 Aug 2024 03:17:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EB6241BF95D
 for <buildroot@lists.busybox.net>; Fri, 23 Aug 2024 03:17:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D8860400E0
 for <buildroot@lists.busybox.net>; Fri, 23 Aug 2024 03:17:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hZtt0_j4KMtL for <buildroot@lists.busybox.net>;
 Fri, 23 Aug 2024 03:17:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::642; helo=mail-ej1-x642.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1211340096
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1211340096
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com
 [IPv6:2a00:1450:4864:20::642])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1211340096
 for <buildroot@buildroot.org>; Fri, 23 Aug 2024 03:17:34 +0000 (UTC)
Received: by mail-ej1-x642.google.com with SMTP id
 a640c23a62f3a-a7a9185e1c0so147057666b.1
 for <buildroot@buildroot.org>; Thu, 22 Aug 2024 20:17:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724383053; x=1724987853;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ddVmUiEz2pAmWZu1Gf5490b5EIuXq5Nyl7Gg6Ce4PcY=;
 b=OHKdnQ1np6HEeiWue54r2ToAoX4l6RbgaUJmZwphHp1MsliqPFsaJGsHhqp2EW6kU2
 AR/oSxzILKxsxKyKFW7NfodyTIXkTMxL89vZ5XaIHZmNGHPvhlEYjpkGZNFC6WoY3snq
 SPeU3QIjCDjFY7TGkiitUiz/GrE1YMhiiFOZTds4sckuw7yuIkRHqPBtQYwjT5NurTSh
 +CnK9+aWAaihsAUi23KuGEspKBVk5N/3+bu51hFqcXwSB842gAO5hGkqEoCTFlnMs4QI
 eDv4mgseu9I8evzMofqqm4gpaGw0GjG2uMx7OjfqaOYaE8LKhMJamUqPCsMx+FqvnDtI
 tmNA==
X-Gm-Message-State: AOJu0YyUGsm3ddHknZ+r4ZtpRvU6Z+cZ9ptxG6ZPLw/0a6RK2WHU/ut1
 SavTtw94SAtVtBtFNj7k1FgEtzKBFl11DlWnmuzHE7jLKu2PNUQkX7vdtJsbZc0=
X-Google-Smtp-Source: AGHT+IF52WVIJtodWdh49Eg5XpXyFdiScTDohmxmOOaWkZBoTFjdIfdWzxqgf5SdpjO/Ym//NZ5XtA==
X-Received: by 2002:a17:907:7d89:b0:a83:94bd:d913 with SMTP id
 a640c23a62f3a-a86a516542emr47909766b.10.1724383052320; 
 Thu, 22 Aug 2024 20:17:32 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a868f2b0745sm195746266b.72.2024.08.22.20.17.32
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Aug 2024 20:17:32 -0700 (PDT)
Message-ID: <66c7ff4c.170a0220.9d4e0.6547@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Fri, 23 Aug 2024 03:17:32 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724383053; x=1724987853; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=ddVmUiEz2pAmWZu1Gf5490b5EIuXq5Nyl7Gg6Ce4PcY=;
 b=BKnPtQBfev6go06qbjFF9Gw/9UwbyFTPrJkl46/aE9/4Yrqrj6xpgrRgfqZdNK9uoJ
 xhI2srpWQNoaYCgPugE9HOvOWcG0BIxePFuybaHBz89/Uotv6AOV3iM77xn5a4G9OiWs
 HKfMLTs6ebrA9fO2taVLT1haB9hID5/kd6EZ6A3p6+7a5K7KT0xSl9goFLIOSrJe938n
 u+jzV9NuW0CfmqvB98SPhVewMGRGoQGgG8GUJ4hME/Z3TLvxx9S5iVOlz7tIF9OpQ4Y/
 OV3eEOQIBZfe5E95T6+BfrGLzPfUfZKPh8s1nwLUBD3EiXsGZ97vfFZoiWI+riAdJ3Np
 58iA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=BKnPtQBf
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2024-08-22
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

Autobuild statistics for 2024-08-22
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  | 14  | 11  |  0  | 25  |
  2024.05.x  | 20  | 27  |  0  | 47  |
    master   | 56  | 86  |  0  | 142 |
     next    |  6  | 21  |  1  | 28  |

Classification of failures by reason for master
-----------------------------------------------

                      fbv-1.0b | 4 
glibc-2.39-74-g198632a05f6c... | 4 
  gobject-introspection-1.76.1 | 3 
host-heimdal-f4faaeaba371ff... | 3 
                   httping-2.5 | 3 
              cache-calibrator | 2 
           comix-cursors-0.9.1 | 2 
              execline-2.9.6.0 | 2 
                    frotz-2.54 | 2 
host-riscv-isa-sim-00dfa28c... | 2 
             libargtable2-2.13 | 2 
               libglib2-2.76.1 | 2 
                   lsuio-0.2.0 | 2 
               popperjs-1.16.0 | 2 
               procps-ng-4.0.4 | 2 
           python-daemon-3.0.1 | 2 
                   swipl-9.2.6 | 2 
                 apache-2.4.62 | 1 
                  axel-2.17.14 | 1 
                  bind-9.16.48 | 1 
  binutils-arc-2023.09-release | 1 
                 c-icap-0.5.10 | 1 
            cairomm1_14-1.14.4 | 1 
                     crun-1.15 | 1 
          cryptodev-linux-1.13 | 1 
                dos2unix-7.5.2 | 1 
                elfutils-0.189 | 1 
                   eza-0.18.22 | 1 
                  fbdump-0.4.2 | 1 
                  fbterm-1.7.0 | 1 
                    fcft-3.1.6 | 1 
                 fdk-aac-2.0.3 | 1 
                   foot-1.16.2 | 1 
                gerbera-1.12.1 | 1 
        gmrender-resurrect-0.1 | 1 
                 gnuplot-6.0.1 | 1 
 host-binutils-bare-metal-2.42 | 1 
             host-delve-1.22.1 | 1 
           host-doxygen-1.8.18 | 1 
                   host-go-src | 1 
         host-libxcrypt-4.4.36 | 1 
                latencytop-0.5 | 1 
                   libglob-1.0 | 1 
                liblinear-2.45 | 1 
                 libp11-0.4.12 | 1 
                     libuecc-7 | 1 
                 libv4l-1.24.1 | 1 
                  libva-2.22.0 | 1 
               lighttpd-1.4.76 | 1 
                    links-2.29 | 1 
                  linux-6.10.3 | 1 
            linux-fusion-9.0.3 | 1 
                  nginx-1.26.2 | 1 
          obsidian-cursors-1.0 | 1 
               openblas-0.3.27 | 1 
         python-remi-2022.7.27 | 1 
                    qemu-9.0.2 | 1 
                  ramsmp-3.5.0 | 1 
       riemann-c-client-1.10.5 | 1 
                 rtptools-1.22 | 1 
                  tllist-1.1.0 | 1 
                       unknown | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |         apache-2.4.62          | NOK | http://autobuild.buildroot.org/results/b78b8963ad49da56cbe299ae7b7eb07162af4314 |     
microblazeel |          axel-2.17.14          | NOK | http://autobuild.buildroot.org/results/1fac45df9f877854d1d0f34560a96be32befd097 |     
 powerpc64   |          bind-9.16.48          | NOK | http://autobuild.buildroot.org/results/eda2b53dd0b04c193775321e49ae7f3f114fe2c7 | ORPH
    arc      |  binutils-arc-2023.09-release  | NOK | http://autobuild.buildroot.org/results/2926d79be3402d2cfc8e1d05d6faccd736c3911b |     
   x86_64    |         c-icap-0.5.10          | NOK | http://autobuild.buildroot.org/results/c8b04b88825ea0e4aa5a3d19a3d26120865972c4 | ORPH
   sparc     |        cache-calibrator        | NOK | http://autobuild.buildroot.org/results/04f23ff896728d52120a258e81c00e53525d48b8 |     
 aarch64_be  |        cache-calibrator        | NOK | http://autobuild.buildroot.org/results/4dbc1f8fb6803e4755ef82d96f0f1712157f03fb |     
   sh4aeb    |       cairomm1_14-1.14.4       | NOK | http://autobuild.buildroot.org/results/9daf9cad396b2bb19c713b39d155ac72695ad9ea |     
 aarch64_be  |      comix-cursors-0.9.1       | NOK | http://autobuild.buildroot.org/results/d5bdb5243b17edbe5547d72674232941a5a9ff26 | ORPH
 powerpc64   |      comix-cursors-0.9.1       | NOK | http://autobuild.buildroot.org/results/fc0f2b44217f5cc8de46dc60a8d757011fc965ea | ORPH
    arc      |           crun-1.15            | NOK | http://autobuild.buildroot.org/results/cdf8351764a1bd8a38621ead7a39277e700d4e19 |     
    mips     |      cryptodev-linux-1.13      | NOK | http://autobuild.buildroot.org/results/825373dca75a4a198167a27a3cbabdefdab292f8 | ORPH
    sh4a     |         dos2unix-7.5.2         | NOK | http://autobuild.buildroot.org/results/4dc305b66f47aeb71df3751f5f92ed1d7e62c086 | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.org/results/7f64a3cffaf15e493a5c1acacb37c801e2280768 | ORPH
 aarch64_be  |        execline-2.9.6.0        | NOK | http://autobuild.buildroot.org/results/43457bc7e9c3a7b0d2300f6e6820981f121a327a |     
  aarch64    |        execline-2.9.6.0        | NOK | http://autobuild.buildroot.org/results/3839d8fd7437e9bc847c2ba0d60f377a1cec0974 |     
    arm      |          eza-0.18.22           | NOK | http://autobuild.buildroot.org/results/f630811e3914a4eb589315b34caa503f1260c5c4 |     
   arceb     |          fbdump-0.4.2          | NOK | http://autobuild.buildroot.org/results/391c79c4ae06a366e5b7b388955777efe7d1174b | ORPH
   arceb     |          fbterm-1.7.0          | NOK | http://autobuild.buildroot.org/results/d38022c1de696ffb5fd437a107f179fe970b3482 | ORPH
    arm      |            fbv-1.0b            | NOK | http://autobuild.buildroot.org/results/0c58fd10a0d0959bcbf94ba891493beef75211e8 | ORPH
  sparc64    |            fbv-1.0b            | NOK | http://autobuild.buildroot.org/results/c0a0342822525a35c026f108b5b7f2238ca82d3c | ORPH
  powerpc    |            fbv-1.0b            | NOK | http://autobuild.buildroot.org/results/ae0dd224ead39577e3a673840d00cd97d790db00 | ORPH
   arceb     |            fbv-1.0b            | NOK | http://autobuild.buildroot.org/results/ddcb62ec37247db2ae4bc7a5d52ba0410b4a18c6 | ORPH
 microblaze  |           fcft-3.1.6           | NOK | http://autobuild.buildroot.org/results/bf0e6416e006f88087b9a074a9e8a85af72c9a5b |     
    arm      |         fdk-aac-2.0.3          | NOK | http://autobuild.buildroot.org/results/913eb82a1465e2f39441029452f1e1fdd71ac8db |     
 microblaze  |          foot-1.16.2           | NOK | http://autobuild.buildroot.org/results/6d2ad00dc2a813f1a68d51e2872f74519aab2cea |     
   mipsel    |           frotz-2.54           | NOK | http://autobuild.buildroot.org/results/8f3929d2959e90f30134ff98fa04e1bfa70eeff6 |     
microblazeel |           frotz-2.54           | NOK | http://autobuild.buildroot.org/results/541205fee89fe98375da9a061959313b0fd3ad4e |     
   nios2     |         gerbera-1.12.1         | NOK | http://autobuild.buildroot.org/results/370850678a701ed3527c187f381450778ef2a860 |     
 powerpc64   | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.org/results/a4a5bb031146a60e21ed3bade2bcb3ca82cea7b5 |     
  powerpc    | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.org/results/6deda5ef07beea4d513bc6e4b6b85bb4bc933c6d |     
    arc      | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.org/results/7d393f84efd02d69767b828f6863d7d3f7b3def6 |     
 powerpc64   | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.org/results/64b0f74a3efb148f0750a8804f23719f45b7c8f7 |     
    mips     |     gmrender-resurrect-0.1     | NOK | http://autobuild.buildroot.org/results/f574ea2d2d377cba044bab2180cb62f309cd9db5 |     
microblazeel |         gnuplot-6.0.1          | NOK | http://autobuild.buildroot.org/results/240d21bf87e98b598efb92b019ccfffe2872217b |     
   x86_64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.org/results/901306c8d994b805a8cc997d71f611c7b86fbbfb | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.org/results/fca5552946ea8b1b32cfdb5012b3240b2f58f32c | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.org/results/880179972dcab3bee3b795b430713d8978fb1456 | ORPH
powerpc64le  | host-binutils-bare-metal-2.42  | NOK | http://autobuild.buildroot.org/results/7655b90dea6d70b19428eaf34b24905922a88cfd |     
  mips64el   |       host-delve-1.22.1        | NOK | http://autobuild.buildroot.org/results/99800f6be0800b384cfc4689869a6ac98e6851b0 |     
   mips64    |      host-doxygen-1.8.18       | NOK | http://autobuild.buildroot.org/results/a5e0838eaad9b6440217abeffe19c2e357a823a7 | ORPH
    i686     |          host-go-src           | NOK | http://autobuild.buildroot.org/results/1dd0eb48cfb36d093ae72f23706ff228d26ce39a |     
 microblaze  | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.org/results/cb05c3860c2cdddc2292fd74635c295021d32234 | ORPH
    arm      | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.org/results/ec9c15ca25eb08fdaa4b0bbbbb3c42bc65689a32 | ORPH
 microblaze  | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.org/results/c14d9793807ef5d9b4dbec85914d634eac28e83a | ORPH
   sparc     |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.org/results/09125d7fc42e3ed019fc2faee2cb2c0cd92e9942 |     
 aarch64_be  | host-riscv-isa-sim-00dfa28c... | NOK | http://autobuild.buildroot.org/results/b4937e2ed49fa42561be7795bc2e3e4a6b60714f |     
    sh4      | host-riscv-isa-sim-00dfa28c... | NOK | http://autobuild.buildroot.org/results/a0d55b124aa43ce26ce7cf9559c259b8bff14ff9 |     
    arm      |          httping-2.5           | NOK | http://autobuild.buildroot.org/results/4eb2ea3ce3594f2baa8b8fe628c5391e17569818 |     
    m68k     |          httping-2.5           | NOK | http://autobuild.buildroot.org/results/6b6359638e04f98b95a50131ef67be88d92efd54 |     
   mips64    |          httping-2.5           | NOK | http://autobuild.buildroot.org/results/9ca2acfce9591e254ef0939f35b24058afc3d903 |     
 powerpc64   |         latencytop-0.5         | NOK | http://autobuild.buildroot.org/results/79d52d825d326e8ed314daf8f63e69646e6ffa4f | ORPH
   sparc     |       libargtable2-2.13        | NOK | http://autobuild.buildroot.org/results/17169cf7901621a3154ca61e40a491d8c3b7a9d7 | ORPH
    mips     |       libargtable2-2.13        | NOK | http://autobuild.buildroot.org/results/e950e4f5cdf6bccc4e8879b838d186aecd69de2e | ORPH
    arc      |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.org/results/07efe89f79e02ba0bfc1d5b4a4ba00c3dbaf8f45 |     
    arc      |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.org/results/a26ff05ba070d55ebd148098bd13b797da2503b6 |     
   armeb     |          libglob-1.0           | NOK | http://autobuild.buildroot.org/results/147849d5cede0c37294b6c4b00a0a9d1888328f7 | ORPH
  aarch64    |         liblinear-2.45         | NOK | http://autobuild.buildroot.org/results/94b56e2e43d8d9049e7e319378f1e0e0955ce239 |     
   s390x     |         libp11-0.4.12          | NOK | http://autobuild.buildroot.org/results/eea6141b67e2ce80470a9afed92dda0119bfa743 | ORPH
    sh4a     |           libuecc-7            | NOK | http://autobuild.buildroot.org/results/c1e1332d7574cc60f5ab6d255e6a79fd6c8ee16f |     
microblazeel |         libv4l-1.24.1          | NOK | http://autobuild.buildroot.org/results/330039de7dc9830d5b93f31d17d6485f24b53628 |     
 aarch64_be  |          libva-2.22.0          | NOK | http://autobuild.buildroot.org/results/a6789957b4dc42a9ed1a90d598e67b0120860125 |     
   sparc     |        lighttpd-1.4.76         | NOK | http://autobuild.buildroot.org/results/cb835343b5e07c996aebf39853a3b844108a22ee | ORPH
   mips64    |           links-2.29           | NOK | http://autobuild.buildroot.org/results/15ed8d0dc86c535e6d9e8fbe992eef16f64ee019 | ORPH
    m68k     |          linux-6.10.3          | NOK | http://autobuild.buildroot.org/results/28209e4bee495897650f28aa2cfe2e8655840cd5 | ORPH
 aarch64_be  |       linux-fusion-9.0.3       | NOK | http://autobuild.buildroot.org/results/80eca55d50b655a652a8e7557ee8147d30852332 | ORPH
  powerpc    |          lsuio-0.2.0           | NOK | http://autobuild.buildroot.org/results/efade93621e97048ad116fd8c2a3dabfa931c8b8 | ORPH
    i686     |          lsuio-0.2.0           | NOK | http://autobuild.buildroot.org/results/0fb15a8495046f9ce6bcbfab9e218a3e5eb52307 | ORPH
   sparc     |          nginx-1.26.2          | NOK | http://autobuild.buildroot.org/results/011cc4a0efb5f0d26bbf3fa7fac98f90bc2b0901 |     
   sparc     |      obsidian-cursors-1.0      | NOK | http://autobuild.buildroot.org/results/dce5c72627b65206d32a9e71c6b779463d3b2f69 | ORPH
   mips64    |        openblas-0.3.27         | NOK | http://autobuild.buildroot.org/results/15add7f48fd9a19e168a39a2b0cd93d6a011dfdd |     
   nios2     |        popperjs-1.16.0         | NOK | http://autobuild.buildroot.org/results/bef49a29642af76b0bb28573feac5a37452cba26 | ORPH
   x86_64    |        popperjs-1.16.0         | NOK | http://autobuild.buildroot.org/results/45a498a0e8ae45f07871bbe1011994dbb604ea5a | ORPH
   xtensa    |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/1435caf1d356793c01da593608e2859541428981 | ORPH
    arm      |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/deae4026aad4169ad730d7efae2963000be360e0 | ORPH
 powerpc64   |      python-daemon-3.0.1       | NOK | http://autobuild.buildroot.org/results/89edb6dc88046c2e75206a448cebbd1838ec9cae |     
   arceb     |      python-daemon-3.0.1       | NOK | http://autobuild.buildroot.org/results/8780cabc63a0d35d95fcbe3f6a857e8787fbd030 |     
  sparc64    |     python-remi-2022.7.27      | NOK | http://autobuild.buildroot.org/results/1eebc56b124b36e3026a28a8937490f9f1df41a3 |     
    mips     |           qemu-9.0.2           | NOK | http://autobuild.buildroot.org/results/4ff1a65c769b42b0da08e0dfc8de518e407e8690 |     
    arm      |          ramsmp-3.5.0          | NOK | http://autobuild.buildroot.org/results/3073789e1e95d3372049d12ca481b8fda176bc5c |     
   nios2     |    riemann-c-client-1.10.5     | NOK | http://autobuild.buildroot.org/results/865d5b57082a3528fa1a9911089b2810d0ac1bf4 | ORPH
   sparc     |         rtptools-1.22          | NOK | http://autobuild.buildroot.org/results/c26ef17eb56dc1072ec85101d3eede2af61afb35 | ORPH
    arm      |          swipl-9.2.6           | NOK | http://autobuild.buildroot.org/results/633de473b67c5e6dbd1c53229e9166a6ecec9c6e |     
powerpc64le  |          swipl-9.2.6           | NOK | http://autobuild.buildroot.org/results/807a325976e66d86f6c3721fa4f08f57a4fef393 |     
   armeb     |          tllist-1.1.0          | NOK | http://autobuild.buildroot.org/results/9c3368aafb7dbf2db8c9c2cb4b0e074b5457b808 |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.org/results/65dabe1998b241bc50143bf9bfd7b69a4adae087 |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

               collectd-5.12.0 | 2 
           ghostscript-10.03.1 | 1 
               host-go-1.21.13 | 1 
host-prelink-cross-a853a5d7... | 1 
              host-rust-1.74.1 | 1 
               ipmitool-1_8_19 | 1 
                  libbpf-1.1.0 | 1 
                libvips-8.10.6 | 1 
                   speex-1.2.1 | 1 
                    volk-3.0.0 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   arceb     |        collectd-5.12.0         | NOK | http://autobuild.buildroot.org/results/8421cad22231be6866b95760ea5ec31cf68043b6 |     
   nios2     |        collectd-5.12.0         | NOK | http://autobuild.buildroot.org/results/d860d5c7d7885aad97c850e8307907d343629012 |     
    arm      |      ghostscript-10.03.1       | NOK | http://autobuild.buildroot.org/results/776d8ce92137a075458bc34ce5562591016e484a |     
    i586     |        host-go-1.21.13         | NOK | http://autobuild.buildroot.org/results/b65c8cdb5b691cf86e1d18b6acd548cb4ab90e96 |     
 powerpc64   | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.org/results/6f46667e0944eb95f41cf4222e0e3d4bcaa53eae | ORPH
   x86_64    |        host-rust-1.74.1        | NOK | http://autobuild.buildroot.org/results/f8dac4dcb811af6a5c7824c2eafe0674e1c0b1e7 |     
   x86_64    |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.org/results/5ae5ee948d99679cd50d1115a7d46f4368347b4f |     
  mips64el   |          libbpf-1.1.0          | NOK | http://autobuild.buildroot.org/results/3246f5e59694a6365e48b65370522d0eb02596a4 |     
    arc      |         libvips-8.10.6         | NOK | http://autobuild.buildroot.org/results/223eaa519452392f2f1d352990b72723461684a0 |     
    arm      |          speex-1.2.1           | NOK | http://autobuild.buildroot.org/results/ccb5b0d688455e9f9a35cdb8129a24472e2bec3d | ORPH
  powerpc    |           volk-3.0.0           | NOK | http://autobuild.buildroot.org/results/256d4a24f9eaaf1231137c9f8dfa348174a8f058 |     


Classification of failures by reason for 2024.05.x
--------------------------------------------------

                 coreutils-9.3 | 2 
                elfutils-0.189 | 2 
host-heimdal-f4faaeaba371ff... | 2 
              host-rust-1.74.1 | 2 
ibm-sw-tpm2-5452af422edeff7... | 2 
          libcamera-apps-1.2.1 | 2 
                       unknown | 2 
             berkeleydb-5.3.28 | 1 
             containerd-1.7.18 | 1 
           host-systemd-254.13 | 1 
               ipmitool-1_8_19 | 1 
                    mpir-3.0.0 | 1 
          ncurses-6.4-20230603 | 1 
                 openal-1.22.0 | 1 
              procps-ng-3.3.17 | 1 
               quotatool-1.6.2 | 1 
                rocksdb-6.20.3 | 1 
                   slang-2.3.3 | 1 
tftpd-e52af4207a6e09a1ba21f... | 1 
                   trinity-1.9 | 1 


Detail of failures for 2024.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mips64    |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.org/results/5c9fcb42b492acea13adbf93b32178e16852f400 | ORPH
  riscv64    |       containerd-1.7.18        | NOK | http://autobuild.buildroot.org/results/fd75528a9bd9d435aec04e23eb44256702552862 |     
    arm      |         coreutils-9.3          | NOK | http://autobuild.buildroot.org/results/e180bb7544b07696e2dabbc23ce49399f2777e00 | ORPH
   mipsel    |         coreutils-9.3          | NOK | http://autobuild.buildroot.org/results/74839dce73c1c4105aea5f726e8b32af8e7fac93 | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.org/results/d585c777f5571cb1aff3d2eb21de15489738eed6 | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.org/results/b1458e0a81ee0f224fc012dad9abbdc8ff8db4af | ORPH
  mips64el   | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.org/results/6755c57107fcecca69ffbad397a19e1d5f9b2eba | ORPH
 aarch64_be  | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.org/results/132d73961ecaa55a8acc62ce50a55a62e66759f0 | ORPH
   x86_64    |        host-rust-1.74.1        | NOK | http://autobuild.buildroot.org/results/9b449df4d4249f71dc9eb276ff5287a2024f07ff |     
   x86_64    |        host-rust-1.74.1        | NOK | http://autobuild.buildroot.org/results/e8fc140b3934043f984dedf40b017c7333421bf1 |     
   sparc     |      host-systemd-254.13       | NOK | http://autobuild.buildroot.org/results/309a4f41643d641dbe0cf136837c382e7b5e7ab8 |     
 microblaze  | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.org/results/f9e52e4489698613d07e64d9231fb21166c3ef65 |     
   xtensa    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.org/results/168f6a2faa921002a2f0a6a6a73945ee3ad5ebfd |     
 powerpc64   |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.org/results/d44e5a15c75ec2a9cfca916071f272f283353458 |     
  mips64el   |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.org/results/a15bc5cc885ba37f15c5967597dd3b499580dd20 |     
  aarch64    |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.org/results/e0d57a90b0fbd193dbb074e4a4ffd9ed72e923ab |     
microblazeel |           mpir-3.0.0           | NOK | http://autobuild.buildroot.org/results/b4cc88507c593a7a350f2fe73436384f4697e2ae |     
  aarch64    |      ncurses-6.4-20230603      | NOK | http://autobuild.buildroot.org/results/fc3cdb5761936c616dafd22268c790fee7cb83ed | ORPH
    mips     |         openal-1.22.0          | NOK | http://autobuild.buildroot.org/results/682dbcd506236e594e7b09aa88e7def3cc0adc95 | ORPH
   mips64    |        procps-ng-3.3.17        | NOK | http://autobuild.buildroot.org/results/73f9ddf08bdf1161331d19edfb36fb32334a16a9 | ORPH
   mipsel    |        quotatool-1.6.2         | NOK | http://autobuild.buildroot.org/results/3ab4c21ce4e50455f0a76541fc96d4e5ca20aa9b | ORPH
   x86_64    |         rocksdb-6.20.3         | NOK | http://autobuild.buildroot.org/results/1b11c5005120fd76f3cea252d3117864b60fa93a |     
    arc      |          slang-2.3.3           | NOK | http://autobuild.buildroot.org/results/31a1e192c775dc12f3754a24893cc01b6e3bfd97 | ORPH
    arm      | tftpd-e52af4207a6e09a1ba21f... | NOK | http://autobuild.buildroot.org/results/15ee32b839a22a59ff8e3bd0de53d9e12c712bd6 | ORPH
    mips     |          trinity-1.9           | NOK | http://autobuild.buildroot.org/results/32f2ed47b3da039c6fc3e8b3b34aaaf9b6d50e3d | ORPH
microblazeel |            unknown             | NOK | http://autobuild.buildroot.org/results/6d265943dc4ac44e9dffe77610266f48ff8562a6 |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.org/results/8244bc2fbe701b6637096292648cec23e02dd7ad |     


Classification of failures by reason for next
---------------------------------------------

                   atop-2.10.0 | 2 
                  ffmpeg-6.1.2 | 2 
            host-binutils-2.42 | 2 
                 libssh-0.11.0 | 2 
               mariadb-10.11.6 | 2 
                       unknown | 2 
                 coreutils-9.3 | 1 
            flashrom-1.4.0-rc2 | 1 
                gnu-efi-3.0.18 | 1 
         gobject-introspection | 1 
  gobject-introspection-1.76.1 | 1 
               gptfdisk-1.0.10 | 1 
                libdrm-2.4.122 | 1 
                    norm-1.5.8 | 1 
         python-remi-2022.7.27 | 1 
                s6-dns-2.3.7.2 | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    mips     |          atop-2.10.0           | NOK | http://autobuild.buildroot.org/results/c089486fc93c133204b868d3c3c51e526a3f3352 |     
   xtensa    |          atop-2.10.0           | NOK | http://autobuild.buildroot.org/results/07c1470f030729dbbd6cdd4bfd26b3bd72edc39b |     
    arm      |         coreutils-9.3          | NOK | http://autobuild.buildroot.org/results/fde114e7da7064fd016d3c91604ee1e725726d90 | ORPH
   arceb     |          ffmpeg-6.1.2          | NOK | http://autobuild.buildroot.org/results/1cdb62b7084a84aa3125b250f5a9cb628e26efd7 |     
  riscv32    |          ffmpeg-6.1.2          | NOK | http://autobuild.buildroot.org/results/fffcab64b464b51e2fede3ca68f29ce55ac0dad5 |     
 aarch64_be  |       flashrom-1.4.0-rc2       | NOK | http://autobuild.buildroot.org/results/164a06fc0aeb4778d5eff65ecec800775bd03f8a |     
    arm      |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.org/results/4c79e24c50b08a60498ab54f70f53efdb038089f |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.org/results/f88095b2086947c9af96ae9cc4021c143c9eaa0c |     
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.org/results/cff92cce4f96cd527d8873aa3ceb036b778e97bf | ORPH
  riscv32    |        gptfdisk-1.0.10         | NOK | http://autobuild.buildroot.org/results/016ad6f57fafd8e280b075af86d87acdf48342b6 |     
    mips     |       host-binutils-2.42       | NOK | http://autobuild.buildroot.org/results/650f54173d9f82112a83443619a5e8636dc53b63 |     
   xtensa    |       host-binutils-2.42       | NOK | http://autobuild.buildroot.org/results/5b691b44752b9aeb79cab779f619759f225e1c80 |     
   sparc     |         libdrm-2.4.122         | NOK | http://autobuild.buildroot.org/results/b0d9a147fbbeb8a2e6be206a38521bfa0240f298 |     
   nios2     |         libssh-0.11.0          | NOK | http://autobuild.buildroot.org/results/f198624e0b486dda73266638c1531d5595698bee | ORPH
microblazeel |         libssh-0.11.0          | NOK | http://autobuild.buildroot.org/results/3f0556df6ec80f7facb1ebd4958bdde8e3b72d2a | ORPH
  aarch64    |        mariadb-10.11.6         | NOK | http://autobuild.buildroot.org/results/e3b375717756c929a1351beec61f8636980f045a | ORPH
  aarch64    |        mariadb-10.11.6         | NOK | http://autobuild.buildroot.org/results/196b6525102208e61444ffe0a85032a11bb5cf5a | ORPH
  aarch64    |           norm-1.5.8           | NOK | http://autobuild.buildroot.org/results/9bddab5525bbabee724ce0a5a9fae35270c7efba | ORPH
   x86_64    |     python-remi-2022.7.27      | NOK | http://autobuild.buildroot.org/results/f4d2d68a3cc99395a8bf794f333f704754372d54 |     
  powerpc    |         s6-dns-2.3.7.2         | NOK | http://autobuild.buildroot.org/results/68ac12f020d6365b4dbeb0209b56febbc2f6e9bd |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.org/results/6383d0e5ac029245f05eb94befd62fe9199a34ed |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.org/results/c412970b9f82fea6df2a3f1b855cbc5b321521ea |     


Gitlab CI results for 2024-08-22
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
                  at91sam9260eknf | https://gitlab.com/buildroot.org/buildroot/-/jobs/7636473278  |      
                   at91sam9g20dfc | https://gitlab.com/buildroot.org/buildroot/-/jobs/7636473284  |      
                 at91sam9g45m10ek | https://gitlab.com/buildroot.org/buildroot/-/jobs/7636473295  |      
                     at91sam9rlek | https://gitlab.com/buildroot.org/buildroot/-/jobs/7636473321  |      
                 atmel_sama5d3xek | https://gitlab.com/buildroot.org/buildroot/-/jobs/7636473561  |      
                        bananapro | https://gitlab.com/buildroot.org/buildroot/-/jobs/7636473628  | ORPH 
                      beelink_gs1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7636473654  |      
                  chromebook_snow | https://gitlab.com/buildroot.org/buildroot/-/jobs/7636473665  |      
                             ci20 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7636473669  |      
                      cubieboard2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7636473672  |      
            engicam_imx6qdl_icore | https://gitlab.com/buildroot.org/buildroot/-/jobs/7636473675  |      
        engicam_imx6qdl_icore_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7636473676  |      
        engicam_imx6qdl_icore_rqs | https://gitlab.com/buildroot.org/buildroot/-/jobs/7636473677  |      
              engicam_imx6ul_geam | https://gitlab.com/buildroot.org/buildroot/-/jobs/7636473679  |      
             engicam_imx6ul_isiot | https://gitlab.com/buildroot.org/buildroot/-/jobs/7636473680  |      
           friendlyarm_nanopi_r2s | https://gitlab.com/buildroot.org/buildroot/-/jobs/7636473715  |      
                   imx6-sabreauto | https://gitlab.com/buildroot.org/buildroot/-/jobs/7636473733  |      
                        imx6slevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/7636473741  |      
                       imx6sx-sdb | https://gitlab.com/buildroot.org/buildroot/-/jobs/7636473743  |      
                        imx6ulevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/7636473745  |      
                       imx6ulpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/7636473749  |      
                        imx7dpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/7636473755  |      
                        imx8mqevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/7636473762  |      
               kontron_pitx_imx8m | https://gitlab.com/buildroot.org/buildroot/-/jobs/7636473769  |      
                          lafrite | https://gitlab.com/buildroot.org/buildroot/-/jobs/7636473773  |      
                       ls1028ardb | https://gitlab.com/buildroot.org/buildroot/-/jobs/7636473778  |      
                     ls1046a-frwy | https://gitlab.com/buildroot.org/buildroot/-/jobs/7636473781  |      
                mender_x86_64_efi | https://gitlab.com/buildroot.org/buildroot/-/jobs/7636473786  | ORPH 
                          mx25pdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/7636473812  |      
                          mx6udoo | https://gitlab.com/buildroot.org/buildroot/-/jobs/7636473825  |      
              octavo_osd32mp1_brk | https://gitlab.com/buildroot.org/buildroot/-/jobs/7636473841  |      
              octavo_osd32mp1_red | https://gitlab.com/buildroot.org/buildroot/-/jobs/7636473843  |      
                        odroidxu4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7636473849  |      
                   orangepi_lite2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7636473882  |      
                orangepi_one_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/7636473891  |      
                       pandaboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/7636473911  |      
                           pine64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7636473919  |      
                    pine64_sopine | https://gitlab.com/buildroot.org/buildroot/-/jobs/7636473922  |      
                qemu_aarch64_ebbr | https://gitlab.com/buildroot.org/buildroot/-/jobs/7636473925  |      
                qemu_aarch64_sbsa | https://gitlab.com/buildroot.org/buildroot/-/jobs/7636473927  |      
                    qemu_arm_ebbr | https://gitlab.com/buildroot.org/buildroot/-/jobs/7636473930  |      
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/7636474008  | ORPH 
                        riotboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/7636474020  |      
                           rock64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7636474026  |      
                       rock_pi_n8 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7636474028  |      
             sipeed_licheepi_zero | https://gitlab.com/buildroot.org/buildroot/-/jobs/7636474051  |      
               snps_arc700_axs101 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7636474071  |      
                 snps_arc700_nsim | https://gitlab.com/buildroot.org/buildroot/-/jobs/7636474074  | ORPH 
                snps_archs38_hsdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/7636474083  |      
                socrates_cyclone5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7636474085  |      
              toradex_apalis_imx6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7636474134  |      
                           ts4900 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7636474135  | ORPH 
                           ts7680 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7636474139  |      



-- 
http://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
