Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EF30CF58C1
	for <buildroot@archiver.kernel.org>; Fri, 20 Sep 2024 03:18:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8B4F584C25;
	Fri, 20 Sep 2024 03:18:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tkaJBQk9kMa7; Fri, 20 Sep 2024 03:18:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 69A5D84C1E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 69A5D84C1E;
	Fri, 20 Sep 2024 03:18:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2A1E41BF5E0
 for <buildroot@lists.busybox.net>; Fri, 20 Sep 2024 03:18:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 18679403FB
 for <buildroot@lists.busybox.net>; Fri, 20 Sep 2024 03:18:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FuDGt5-JYPoX for <buildroot@lists.busybox.net>;
 Fri, 20 Sep 2024 03:18:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62d; helo=mail-ej1-x62d.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 98AC640120
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 98AC640120
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 98AC640120
 for <buildroot@buildroot.org>; Fri, 20 Sep 2024 03:18:09 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a8d2daa2262so173363966b.1
 for <buildroot@buildroot.org>; Thu, 19 Sep 2024 20:18:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726802287; x=1727407087;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oLCrDVWP7GasStq2qpyV1GLd9qUkb6jURy7X3fxWFVU=;
 b=iV0wE+VkW73NyYXaVDdwQCFPYPF+K4pa0r6+B9aGGnOuaPy5YOYh6bz6UXtTH2MYfa
 8tgOLS1jObmD16/s7qo6DVM9PcZv2/pdWj9k6TXRtyt7h0sW3g+2hV6lc/gr43RLp0XV
 itxRg5x5ySMKg8p1vOoGopBck5OH+7a/JCCMVRFFJ77GagWAwufgSen0yGRaSTytHsm0
 YPsheOyFHjJyLSJrvQQXtyBp3KkA5lfQh5z4D/DUbXUsJi9wS7YGMAJLXRBgITMbh4zC
 QST7WlCIcByjtiW3JXd0SvQbyh2CijkLDqgYmkQhB8mY8DaYBGSLsiCfklhYPG+HzOQp
 5P4Q==
X-Gm-Message-State: AOJu0YxFgN+2gKrkiqpWpNn0p9oJ5i0jCi4OTqIEnZloae8a5VurpLL2
 gB6LHquhqf5SdO2Fy/BDrOdifPe/UFNC3ZA5tvjEkQ/kQ368RmzDTi+FHA==
X-Google-Smtp-Source: AGHT+IGQR7uy/hgAasm8C7VrZUgezxRxBdZnXnkwnreF7unFeuqt23WPuOdbdXN52lZ3TA8SUpYlYQ==
X-Received: by 2002:a17:907:efc4:b0:a90:348f:fad7 with SMTP id
 a640c23a62f3a-a90d508b211mr106219166b.38.1726802287015; 
 Thu, 19 Sep 2024 20:18:07 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a90610f440bsm786911666b.86.2024.09.19.20.18.06
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Sep 2024 20:18:06 -0700 (PDT)
Message-ID: <66ece96e.170a0220.12b72c.af1c@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Fri, 20 Sep 2024 03:18:06 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726802287; x=1727407087; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=oLCrDVWP7GasStq2qpyV1GLd9qUkb6jURy7X3fxWFVU=;
 b=nEwOaQbx0wcxU5wtePvN5J+t4bHvjoSgD57eEH3yS/P0gstqD0PnUiWZnGzwEVE1SG
 E4bncJtFwAvAVo38LZ/HHyIppJRiXPZM1YgJt+J6ASc2eSKfQAosylKqNXw5s7gmTad5
 xetENLcoz/XlSU9c0Eg3tVq3Nn8l8ya49UDqfpKkVLf6INgEFhugcv5mDjF+w5YPPerv
 msfBpBsDBJ1DoJ8pNJd3P3YY+M+ccxNbLesDKq1p5mT/nfDzRvrNzmMzbvCqp0u/nh2E
 kntHbvBlvDFJgMOgkqBXVYHuNpR0xbhUA7meNfMKLq20LmnJkAT5Gj8s5KCdJnd9eeuG
 NXBA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=nEwOaQbx
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2024-09-19
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

Autobuild statistics for 2024-09-19
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  2  |  2  |  1  |  5  |
  2024.05.x  | 14  | 28  |  0  | 42  |
  2024.08.x  |  3  |  8  |  0  | 11  |
    master   |  9  | 58  |  1  | 68  |

Classification of failures by reason for master
-----------------------------------------------

             bluez5_utils-5.77 | 10
                  linux-6.10.9 | 5 
           host-librsvg-2.50.9 | 3 
aubio-152d6819b360c2e7b379e... | 2 
                    bat-0.24.0 | 2 
                  bind-9.18.28 | 2 
                  ffmpeg-6.1.2 | 2 
              fluent-bit-3.1.3 | 2 
            host-binutils-2.42 | 2 
                libxml2-2.13.3 | 2 
                  ntp-4.2.8p18 | 2 
               procps-ng-4.0.4 | 2 
                 apitrace-10.0 | 1 
             batman-adv-2024.2 | 1 
                  cairo-1.18.0 | 1 
                   cvs-1.12.13 | 1 
             docker-cli-27.0.3 | 1 
                elfutils-0.189 | 1 
                espflash-3.1.0 | 1 
glibc-2.40-18-g564178076272... | 1 
         gobject-introspection | 1 
  gobject-introspection-1.76.1 | 1 
           host-doxygen-1.8.18 | 1 
              host-rust-1.80.1 | 1 
                   httping-2.5 | 1 
                  iozone-3.506 | 1 
                      iwd-2.20 | 1 
               libglib2-2.76.1 | 1 
                  libsepol-3.6 | 1 
          linux-5.10.162-cip24 | 1 
               linux-pam-1.6.1 | 1 
                 openssh-9.8p1 | 1 
                    polkit-123 | 1 
               postgresql-16.4 | 1 
                       unknown | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |         apitrace-10.0          | NOK | https://autobuild.buildroot.org/results/ec9f1949dce14d4017eee319177282421da81d51 |     
  powerpc    | aubio-152d6819b360c2e7b379e... | NOK | https://autobuild.buildroot.org/results/08e13c4c2ea908c7b8fd06d91b10e2b9db99d5a3 |     
    or1k     | aubio-152d6819b360c2e7b379e... | NOK | https://autobuild.buildroot.org/results/43d9b7e775ee0009242511c1a8c2e6e70912a3f1 |     
   armeb     |           bat-0.24.0           | NOK | https://autobuild.buildroot.org/results/22cc2bf8ce9150edc7d9154809211a031b752105 |     
   armeb     |           bat-0.24.0           | NOK | https://autobuild.buildroot.org/results/71f876eb03488e69b212dbbec514202d107efe75 |     
    mips     |       batman-adv-2024.2        | NOK | https://autobuild.buildroot.org/results/1c6659f96eda2b5eff2ade534871a6087d502d12 |     
    sh4      |          bind-9.18.28          | NOK | https://autobuild.buildroot.org/results/ddaa90f90caf00a004ecbbb56237a0312792a94a | ORPH
   s390x     |          bind-9.18.28          | NOK | https://autobuild.buildroot.org/results/c319280ac171b400fee7b1a4092718cd93991c97 | ORPH
    i586     |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/000f6e92c95da37586589147b78d6a1b8dda11d3 |     
   sh4aeb    |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/da96d1556999f2b1e63866d90f49ee2a9cb88fd1 |     
    arc      |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/685ff96c55035819f3383fbbd9fa80837284ec5f |     
  powerpc    |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/65397bf40f40bab8997bb8ac3998365640521e26 |     
   nios2     |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/996369415c55d6d110751f4bac51f3dfcc4cc06a |     
powerpc64le  |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/918fd1488001e527ce46f84c0c551d31aed1b343 |     
    i686     |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/13fbc0536ec90d3b7a3599156c044852efe1d22e |     
   nios2     |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/17c44ff2a65b1cfd1464ab927f3cd67615b31f8b |     
    i686     |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/f51f19f7e29685e4a4dd9236300f633c81f48732 |     
   nios2     |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/a2b9be64c62639ea7a091fb24e46d6b61407e5a4 |     
    arc      |          cairo-1.18.0          | NOK | https://autobuild.buildroot.org/results/9e5199410f5c0e7d38965ec74725443d6e397a0f |     
   nios2     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/df4dba5a8a25d1633681ff72e80aaf6a439dccb4 | ORPH
   s390x     |       docker-cli-27.0.3        | NOK | https://autobuild.buildroot.org/results/3ca35eed6051589f5d8c4a8808f0498ebbce4981 |     
    arc      |         elfutils-0.189         | NOK | https://autobuild.buildroot.org/results/21c38eab303ebe0651baf9c23c539ba4935a31d0 | ORPH
powerpc64le  |         espflash-3.1.0         | NOK | https://autobuild.buildroot.org/results/321598baef543b84ce82c09a88e51ad745a15dfd |     
   arceb     |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/b8c94099f015726c2ca33f6e10a4b3e05a206869 |     
    arc      |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/022c337d11e961e9dc77a4fc318a80196cf6774b |     
powerpc64le  |        fluent-bit-3.1.3        | NOK | https://autobuild.buildroot.org/results/f20e4bba1f2f0391a64503aa914ff515163ad000 |     
   sh4eb     |        fluent-bit-3.1.3        | NOK | https://autobuild.buildroot.org/results/5ec9995de627bac0882d15de87686af2d98d0b7a |     
   arceb     | glibc-2.40-18-g564178076272... | NOK | https://autobuild.buildroot.org/results/89e8412a748da113d48abffd4cb6e50c6e37bcca |     
 microblaze  |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/6ad83224a9dbd1c59850bca09f4d09d07dbfc77e |     
    sh4a     |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/ff2dd1ef0b6985f1b360ee7d7dce20504a04c78c | ORPH
  powerpc    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/a31894b66f5643d7c4b7d0d707bd8d6c1a28aa64 |     
 powerpc64   |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/d0be9f023d00561723208ba277b5cce5d5ae05bd |     
   mipsel    |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/f314a69d84d675ed6e415eeb358f99470ca1a0fa | ORPH
   s390x     |      host-librsvg-2.50.9       | NOK | https://autobuild.buildroot.org/results/4a943bad3e98b17bf098075af5b86abe5ef2a6d9 |     
    m68k     |      host-librsvg-2.50.9       | NOK | https://autobuild.buildroot.org/results/7f18627a57806a036564724c53a2917bc6046477 |     
   x86_64    |      host-librsvg-2.50.9       | NOK | https://autobuild.buildroot.org/results/b2abac3f67e0d3a42237bc5545e419c8f154e1fd |     
   s390x     |        host-rust-1.80.1        | NOK | https://autobuild.buildroot.org/results/3517883a31095cbbf4556996295909b034ad1b4a |     
    mips     |          httping-2.5           | NOK | https://autobuild.buildroot.org/results/d4500b3a2b7b8b50eaef7e86d66a54090e76d3d9 |     
  mips64el   |          iozone-3.506          | NOK | https://autobuild.buildroot.org/results/7cc95023b52e9c74ce2440e927e83a5c5b4292f4 |     
 powerpc64   |            iwd-2.20            | NOK | https://autobuild.buildroot.org/results/290880fb79a22e0a43040f34d08c24cc0afd0cf7 | ORPH
    arc      |        libglib2-2.76.1         | NOK | https://autobuild.buildroot.org/results/4809f80307011643f7b54be2e5271614133c5d80 |     
  riscv32    |          libsepol-3.6          | NOK | https://autobuild.buildroot.org/results/fc344811528638999e9abd8fe3149cca1e6a0e1f |     
   sparc     |         libxml2-2.13.3         | NOK | https://autobuild.buildroot.org/results/b4c9ecdaa623c630e4654416b73937b021a1eda0 |     
   mipsel    |         libxml2-2.13.3         | NOK | https://autobuild.buildroot.org/results/d25effdbe6513b7a464104d35715ab227257a749 |     
  mips64el   |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/22e67b14396a527e43e3aaf9afb311a12b75979d | ORPH
   s390x     |          linux-6.10.9          | NOK | https://autobuild.buildroot.org/results/8c0859a69445c2a89173ced1b40e9a4e9ef9e41b | ORPH
   mips64    |          linux-6.10.9          | NOK | https://autobuild.buildroot.org/results/5498453e3559676d2ddc5d7e8ad3feb8937e8002 | ORPH
 powerpc64   |          linux-6.10.9          | NOK | https://autobuild.buildroot.org/results/d356c09ac35a6022b9fe7d445525abd5caead87b | ORPH
   sh4aeb    |          linux-6.10.9          | NOK | https://autobuild.buildroot.org/results/adb06f2d399a421eca789e6992406b39a27e9916 | ORPH
  powerpc    |          linux-6.10.9          | NOK | https://autobuild.buildroot.org/results/e6986ca81019a0473006132f157d5d3420bce483 | ORPH
   sparc     |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/8120e7b9e6927628ff57c4183ef8cb04ac4d513a | ORPH
   sparc     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/8f036f69d1e77568671270ffc87d1265ccb2b034 |     
    sh4      |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/ef4dde704f28d1a5f9a7cc677b29eab768b17643 |     
powerpc64le  |         openssh-9.8p1          | NOK | https://autobuild.buildroot.org/results/70aba0514195a955a2d7b99d38a62df21df9d5dd | ORPH
   nios2     |           polkit-123           | NOK | https://autobuild.buildroot.org/results/322a44b5a24637dbdf36c9b225c182b18ecd48ce |     
    i686     |        postgresql-16.4         | NOK | https://autobuild.buildroot.org/results/d9f64b0e34d9f8e622325693ab176a71643d3a0f |     
   x86_64    |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/38118e28c10085d39a7e3087e09d060476a00036 | ORPH
   xtensa    |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/7a0d37ece165068047685380e24e92218244d8dc | ORPH
  powerpc    |            unknown             | NOK | https://autobuild.buildroot.org/results/cec7c06e679257c40f93b34e09f6befe4343a3ff |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

         gobject-introspection | 1 
            host-cdrkit-1.1.11 | 1 
                libressl-3.8.4 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/b2935f1f786afa2abdc42c91c9f2983cc5256fde |     
   x86_64    |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/8f8ba8e59818cdda8dc0c2bdcf3761196fc0d8d0 |     
   mips64    |         libressl-3.8.4         | NOK | https://autobuild.buildroot.org/results/011eb8f3a0611a5e9e6c36974565e3a665144308 | ORPH


Classification of failures by reason for 2024.05.x
--------------------------------------------------

                  ffmpeg-6.1.2 | 3 
  gobject-introspection-1.76.1 | 2 
                  ntp-4.2.8p18 | 2 
                 openssh-9.7p1 | 2 
               procps-ng-4.0.4 | 2 
android-tools-4.2.2+git2013... | 1 
                   foot-1.16.2 | 1 
glibc-2.39-74-g198632a05f6c... | 1 
               gupnp-av-0.14.1 | 1 
            host-binutils-2.42 | 1 
                host-go-1.22.5 | 1 
host-go-bootstrap-stage2-1.... | 1 
host-heimdal-f4faaeaba371ff... | 1 
host-prelink-cross-a853a5d7... | 1 
              host-rust-1.74.1 | 1 
               ipmitool-1_8_19 | 1 
             libargtable2-2.13 | 1 
               mariadb-10.11.6 | 1 
                    ola-0.10.9 | 1 
         python-remi-2022.7.27 | 1 
              skalibs-2.12.0.1 | 1 
                       unknown | 1 


Detail of failures for 2024.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sh4aeb    | android-tools-4.2.2+git2013... | NOK | https://autobuild.buildroot.org/results/b8c49c86366a17e680aef36e12dfdd9afdb4ad23 |     
 microblaze  |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/8fddc75f7a67fc9fff30bb14a9c13272f6813bfc |     
microblazeel |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/4c952951dd21ab88ee65ff9d07217cd2410adc90 |     
microblazeel |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/f45df9a298938274073a53c1f68b0f5b58589f84 |     
    arm      |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/10b73422267a3079c141dcee8b2bae26f2d22692 |     
   arceb     | glibc-2.39-74-g198632a05f6c... | NOK | https://autobuild.buildroot.org/results/b7c873771b62021dcf74aff95649c1624edb7234 |     
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/9a478cd16daa96779018a766971e44d654669ba9 | ORPH
   x86_64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/a1daa709878c2c66e234ac687d2e07df87be7c5b | ORPH
   armeb     |        gupnp-av-0.14.1         | NOK | https://autobuild.buildroot.org/results/a79062251a26353354e01570bffd5b88f64bef1d |     
   mips64    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/f505f9468ba6d24c9587842438048d3e4766f9c6 |     
   mips64    |         host-go-1.22.5         | NOK | https://autobuild.buildroot.org/results/d77c21f78a83c2ec5da9d5984c39f5d1dda182e5 |     
   nios2     | host-go-bootstrap-stage2-1.... | NOK | https://autobuild.buildroot.org/results/1902261b625c2fbf7d8e03f28e32b047088644c0 |     
   mips64    | host-heimdal-f4faaeaba371ff... | NOK | https://autobuild.buildroot.org/results/3077ad603e3134b0be6c2069ec6d3c0a3eef0a6c | ORPH
  sparc64    | host-prelink-cross-a853a5d7... | NOK | https://autobuild.buildroot.org/results/1881be020c49f2e4f606010faa44869b2739de07 | ORPH
   x86_64    |        host-rust-1.74.1        | NOK | https://autobuild.buildroot.org/results/c85857847444c01a96a06ab361a182ff15ddc54c |     
   mips64    |        ipmitool-1_8_19         | NOK | https://autobuild.buildroot.org/results/df9be85a5e6b19bc679d2d41f7773821efa77452 |     
  powerpc    |       libargtable2-2.13        | NOK | https://autobuild.buildroot.org/results/ccf80ce8d2c4e435725e0535c487fd988d4360b0 | ORPH
  riscv32    |        mariadb-10.11.6         | NOK | https://autobuild.buildroot.org/results/d81d6c67be00280a5cf1d62794e008adfa832b25 | ORPH
    i686     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/435b2cda84fa0b449bfe29bf93e30f91578f7a19 |     
   sparc     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/0bdaf13e929c29c7edad7e2e12c68748ed835a81 |     
  sparc64    |           ola-0.10.9           | NOK | https://autobuild.buildroot.org/results/3a129e37daf0e2c13a2185f9454184ce12da671e |     
powerpc64le  |         openssh-9.7p1          | NOK | https://autobuild.buildroot.org/results/a1166f4c704127ff3a0d76ec868ff83db0b0fbfd | ORPH
    mips     |         openssh-9.7p1          | NOK | https://autobuild.buildroot.org/results/12881f166acd293fdcca3f225b740bff8e8a263f | ORPH
powerpc64le  |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/1a883a49488a9c6eee7544181499a6c430f8dc7c | ORPH
powerpc64le  |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/5ab9d6239101110f2d0f5a5009fc060c998a0a04 | ORPH
  aarch64    |     python-remi-2022.7.27      | NOK | https://autobuild.buildroot.org/results/838fa600367122f45102589bfc11fecdb6fc154c |     
   armeb     |        skalibs-2.12.0.1        | NOK | https://autobuild.buildroot.org/results/d786656fa8ba46b21a1b00274a6c2fe5f53b9978 |     
  aarch64    |            unknown             | NOK | https://autobuild.buildroot.org/results/640b5b327d4daa083ba42147ee8dab9186dd044c |     


Classification of failures by reason for 2024.08.x
--------------------------------------------------

            host-ccache-4.10.1 | 2 
                  acpid-2.0.34 | 1 
                  assimp-5.3.1 | 1 
                  linux-6.10.8 | 1 
                    ncmpc-0.49 | 1 
      python-autocommand-2.2.2 | 1 
             stress-ng-0.17.07 | 1 


Detail of failures for 2024.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |          acpid-2.0.34          | NOK | https://autobuild.buildroot.org/results/5f1217c40651cca35023cdcfcf10342012ebc10c | ORPH
   sh4aeb    |          assimp-5.3.1          | NOK | https://autobuild.buildroot.org/results/f5347a1fafcae87eeeb002e177716976c7af44fd | ORPH
    i686     |       host-ccache-4.10.1       | NOK | https://autobuild.buildroot.org/results/3c3ea052a7013a03aace1d6e1e07697383ee249f | ORPH
    arm      |       host-ccache-4.10.1       | NOK | https://autobuild.buildroot.org/results/a5fae5414ab2fa0d575b71f24de305f7dcae2000 | ORPH
   nios2     |          linux-6.10.8          | NOK | https://autobuild.buildroot.org/results/268af9c869bd1bb8144a9ddf8ac91918711c36f9 | ORPH
    i686     |           ncmpc-0.49           | NOK | https://autobuild.buildroot.org/results/a197c37bbdf80262753dc595e09434788f9377cb |     
   s390x     |    python-autocommand-2.2.2    | NOK | https://autobuild.buildroot.org/results/c37be6264d099d11fb7a9be2d98677c074fd9ac5 |     
   mips64    |       stress-ng-0.17.07        | NOK | https://autobuild.buildroot.org/results/b81a9399c5c6284d58de71ba6775fa837692c286 |     


Gitlab CI results for 2024-09-19
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
                 arcturus_ucp1020 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7861075714  |      
                  at91sam9260eknf | https://gitlab.com/buildroot.org/buildroot/-/jobs/7861075734  |      
                   at91sam9g20dfc | https://gitlab.com/buildroot.org/buildroot/-/jobs/7861075739  |      
                 at91sam9g45m10ek | https://gitlab.com/buildroot.org/buildroot/-/jobs/7861075740  |      
                     at91sam9rlek | https://gitlab.com/buildroot.org/buildroot/-/jobs/7861075744  |      
                 atmel_sama5d3xek | https://gitlab.com/buildroot.org/buildroot/-/jobs/7861075788  |      
                        bananapro | https://gitlab.com/buildroot.org/buildroot/-/jobs/7861075842  | ORPH 
                      beelink_gs1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7861075863  |      
                  chromebook_snow | https://gitlab.com/buildroot.org/buildroot/-/jobs/7861076104  |      
                             ci20 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7861076108  |      
                      cubieboard2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7861076112  |      
            engicam_imx6qdl_icore | https://gitlab.com/buildroot.org/buildroot/-/jobs/7861076113  |      
        engicam_imx6qdl_icore_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7861076116  |      
        engicam_imx6qdl_icore_rqs | https://gitlab.com/buildroot.org/buildroot/-/jobs/7861076120  |      
              engicam_imx6ul_geam | https://gitlab.com/buildroot.org/buildroot/-/jobs/7861076123  |      
             engicam_imx6ul_isiot | https://gitlab.com/buildroot.org/buildroot/-/jobs/7861076124  |      
           friendlyarm_nanopi_r2s | https://gitlab.com/buildroot.org/buildroot/-/jobs/7861076162  |      
               kontron_pitx_imx8m | https://gitlab.com/buildroot.org/buildroot/-/jobs/7861076231  |      
                       ls1028ardb | https://gitlab.com/buildroot.org/buildroot/-/jobs/7861076244  |      
                     ls1046a-frwy | https://gitlab.com/buildroot.org/buildroot/-/jobs/7861076246  |      
                mender_x86_64_efi | https://gitlab.com/buildroot.org/buildroot/-/jobs/7861076251  | ORPH 
              octavo_osd32mp1_brk | https://gitlab.com/buildroot.org/buildroot/-/jobs/7861076323  |      
              octavo_osd32mp1_red | https://gitlab.com/buildroot.org/buildroot/-/jobs/7861076324  |      
                        odroidxu4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7861076328  |      
                   orangepi_lite2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7861076351  |      
                orangepi_one_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/7861076356  |      
                    pine64_sopine | https://gitlab.com/buildroot.org/buildroot/-/jobs/7861076388  |      
                qemu_aarch64_sbsa | https://gitlab.com/buildroot.org/buildroot/-/jobs/7861076394  |      
              qemu_mips64r6_malta | https://gitlab.com/buildroot.org/buildroot/-/jobs/7861076427  |      
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/7861076475  | ORPH 
                        riotboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/7861076484  |      
                           rock64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7861076489  |      
                       rock_pi_n8 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7861076490  |      
             sipeed_licheepi_zero | https://gitlab.com/buildroot.org/buildroot/-/jobs/7861076500  |      
                socrates_cyclone5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7861076517  |      
              toradex_apalis_imx6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7861076545  |      
                           ts4900 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7861076547  | ORPH 
                           ts7680 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7861076564  |      



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
