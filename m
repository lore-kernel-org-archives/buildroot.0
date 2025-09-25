Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13294CAC5A5
	for <buildroot@archiver.kernel.org>; Thu, 25 Sep 2025 03:20:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BFC4D61367;
	Thu, 25 Sep 2025 03:20:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A_8_IPZY1PJG; Thu, 25 Sep 2025 03:20:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 07FD66129A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 07FD66129A;
	Thu, 25 Sep 2025 03:20:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8BAE4177
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 03:20:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7BB5B822BA
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 03:20:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n8vAYEG2LAQg for <buildroot@buildroot.org>;
 Thu, 25 Sep 2025 03:20:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D2A128272D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D2A128272D
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D2A128272D
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 03:20:03 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3f2cf786abeso336060f8f.3
 for <buildroot@buildroot.org>; Wed, 24 Sep 2025 20:20:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758770402; x=1759375202;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bFHieQCKzNiNZLXzVL3hDxaqVQmAYBioy7jNl9RPyLE=;
 b=eC/8VaEoCho7ydg5iymYeEnmDQjx54BHu1i8R7VT9M2dw7XYQPT0mSJuUpjeex1D7v
 cJ5a9nI0tvMqIg2jfTo1ti0HJglkCI0GA1NuqhBD1P2+xWLf8VO76r48CVUDWW86LTbu
 PoNO9jAlRcrloRZtnTVxFhD31ys1MnKvbfqxiwovwv1tyJURX/8utU56rHP5uT/iWBJw
 SaTsknnLBvOGsvkKezBBDKRYe/NbsyAeFgqu0Z301vGEsXSE8bv2aBSFBdl6Ntkk+RDe
 GX/HxFQ3hKtIuaO+erIgcSRC5FlLYlU/3WKt+y++t2ndPSQo3DaCIs8UfgEkyDAIbDUN
 Mv+w==
X-Gm-Message-State: AOJu0YwKyuKowinzlwiHWX3QSQDInnxBAj9ocvw9soFLACVfzyv/H6Tv
 nTfFlz0r7CADg/TvdoEoQxIcox0pwqBLPllgYMLb57Q+o1Xrtao0nDbhsVeS5w==
X-Gm-Gg: ASbGncsW8RL3+9jkyaZBVbAlqsDBIaCq/5tRQa2CQHngRO36WWeJsXQlEdqAWyY0RTR
 PEiX0f+rIDZLTt5rJnf41VQmDajTg+Ro2qzkzynPazutA36asJrMctkxvYd0PFrcJ3/53GX9b06
 VsfX2GmAInY2/7s8g3vgHt2mnS4ZP4fnrePqfUF+/fU9TD4wRM/p62FljNdy4FD1fC/li6zoXKG
 s2EsSU0I/28ocMbr2+PcdcDINXCw10YfASnVBTXNM8F8QAsw5V+8LL50GgGTy4pCoAUReWApLHF
 NgxPSLQ636RgsXbTwz8mqCIsE/PrSkbRSo1tR4eZgdIF71oQ5X0vRpbiEbFJnu7z24QiwjhM6yG
 SK9afMS9hXacucWCfu7YOqpXsiQ==
X-Google-Smtp-Source: AGHT+IEegJLZjCSOsrBp/E3yeM1tebPYrvgMLiNL6GIoEeEF4eukmwe9CLuvYxt0Chybyb1yVCGFPw==
X-Received: by 2002:a05:6000:4282:b0:3ec:b899:bc39 with SMTP id
 ffacd0b85a97d-40e50d6dfa2mr1456165f8f.58.1758770401197; 
 Wed, 24 Sep 2025 20:20:01 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-40fc5602f15sm958571f8f.39.2025.09.24.20.20.00
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Sep 2025 20:20:01 -0700 (PDT)
Message-ID: <68d4b4e1.df0a0220.3b757b.233a@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Thu, 25 Sep 2025 03:20:00 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758770402; x=1759375202; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=bFHieQCKzNiNZLXzVL3hDxaqVQmAYBioy7jNl9RPyLE=;
 b=EYUbmj0Te8N7SyoIc7iRkZNld+vHie/zv1HbENKx50KlNqaLFL3eMDaMVX17yxF+oQ
 CdIYre+ZKjWbCc9gFpghiCtjtKAeR9itHNMpsnNxpUB+p+HfrD35LAzcMEYDgQxeHujk
 4iEGi5lfEoMvI+n/QkNbqispCxCgS9mJioW4vXPghyGgUSZ5r+FmdM6slqDrxe73hEIP
 Fgda/qZAP2zJ5POHCEudqF4h4l2MP22kGv7aUgXz1LaaOh7UPmHNYBOTrIhjL7pl2xga
 CeWlyQcSRL/caPD1oVKPEyhWollAHPMTb63pub32xCbIP7Y//+gTUsH5WDd3JaWGkAvQ
 ER/Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=EYUbmj0T
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-09-24
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

Autobuild statistics for 2025-09-24
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  6  |  5  |  0  | 11  |
  2025.05.x  |  5  |  2  |  0  |  7  |
  2025.08.x  |  2  |  5  |  0  |  7  |
    master   | 32  | 101 |  0  | 133 |

Classification of failures by reason for master
-----------------------------------------------

                       unknown | 6 
                  linux-6.16.7 | 5 
                 logsurfer-1.8 | 4 
        vulkan-headers-1.4.317 | 4 
                   cvs-1.12.13 | 3 
libdbi-drivers-0bfae6c43134... | 3 
                    sdl-1.2.15 | 3 
               bctoolbox-4.4.8 | 2 
                   foot-1.16.2 | 2 
            gdk-pixbuf-2.42.12 | 2 
               graphene-1.10.8 | 2 
 host-softether-4.30-9700-beta | 2 
libftdi1-v1.5-62-g5e67403c4... | 2 
                libselinux-3.9 | 2 
                     nvme-1.12 | 2 
                openvpn-2.6.14 | 2 
              udpcast-20230924 | 2 
                     ace-7.1.1 | 1 
             berkeleydb-5.3.28 | 1 
                  cmake-3.31.8 | 1 
             cni-plugins-1.7.1 | 1 
          cryptodev-linux-1.13 | 1 
                diffutils-3.12 | 1 
  distribution-registry-v3.0.0 | 1 
           dmraid-1.0.0.rc16-3 | 1 
                enscript-1.6.6 | 1 
firmware-utils-86739f2b3ae9... | 1 
       freeradius-server-3.2.6 | 1 
fs/cpio/cpio.mk:131: /home/... | 1 
glibc-2.42-3-gbc13db7393773... | 1 
  gobject-introspection-1.84.0 | 1 
                 host-gdb-14.2 | 1 
    host-llvm-libunwind-20.1.8 | 1 
    host-mender-artifact-4.1.0 | 1 
      host-uboot-tools-2021.07 | 1 
             igt-gpu-tools-2.1 | 1 
                   iotools-1.8 | 1 
                libcurl-8.16.0 | 1 
                 libgee-0.20.6 | 1 
              libgeotiff-1.7.3 | 1 
                libglvnd-1.4.0 | 1 
                  libjwt-3.2.0 | 1 
                  libsepol-3.9 | 1 
                libshout-2.4.6 | 1 
libuci-f3fc0b76040685829191... | 1 
          linux-5.10.162-cip24 | 1 
     linux-5.10.162-cip24-rt10 | 1 
                     mdadm-4.3 | 1 
            micropython-1.22.2 | 1 
                 netsnmp-5.9.4 | 1 
                 open-lldp-1.1 | 1 
      passt-2025_06_11.0293c6f | 1 
                   perl-5.40.2 | 1 
          perl-net-ssleay-1.94 | 1 
                pipewire-1.2.8 | 1 
                     popt-1.19 | 1 
               procps-ng-4.0.5 | 1 
procrank_linux-21c30ab4514a... | 1 
           python-bcrypt-4.2.1 | 1 
python-remi-2022.7.27-37-g1... | 1 
                python3-3.13.7 | 1 
                   seatd-0.9.1 | 1 
                setserial-2.17 | 1 
      spandsp-3.0.0-6ec23e5a7e | 1 
             strongswan-5.9.14 | 1 
               syslog-ng-4.8.3 | 1 
              tailscale-1.78.1 | 1 
             util-linux-2.41.1 | 1 
        wireless_tools-30.pre9 | 1 
                  zoxide-0.9.8 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |           ace-7.1.1            | NOK | https://autobuild.buildroot.org/results/6798e98c810fcb9d477aa9ce28340330dc5afe49 | ORPH
   mips64    |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/97f7074806ff23c161fa345b4ab04f73b9553ea8 | ORPH
  mips64el   |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/b3355edfd0da71e051432d91d27783fc824aa55a | ORPH
  mips64el   |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/1b5da864dc9e4ab1340bd27e4621e2ac3c0c8eca | ORPH
    i686     |          cmake-3.31.8          | NOK | https://autobuild.buildroot.org/results/63ba30c9ffa5631ee8e868f5849919d9adb13df7 |     
    i686     |       cni-plugins-1.7.1        | NOK | https://autobuild.buildroot.org/results/4a78fd458426521820220226c316ef09a5357df8 |     
  powerpc    |      cryptodev-linux-1.13      | NOK | https://autobuild.buildroot.org/results/cd62d911d34378d78327383a6be16d5add4d6e47 | ORPH
  mips64el   |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/855312189d687eec7ac0026c951aeb3119bfc28a | ORPH
    mips     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/e3a00d7cd84218223eec057c7d1e86a3dcb47397 | ORPH
  powerpc    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/4dca48c6eb2e7255e8e06bcc153352445dd5173b | ORPH
loongarch64  |         diffutils-3.12         | NOK | https://autobuild.buildroot.org/results/a470943ddff89efddf4552abe2ddc2efe02008fc | ORPH
    i686     |  distribution-registry-v3.0.0  | NOK | https://autobuild.buildroot.org/results/a281e0324bd709779f8adafd2795189a1c944a19 | ORPH
    i686     |      dmraid-1.0.0.rc16-3       | NOK | https://autobuild.buildroot.org/results/4292c31a46bf250856882f469d207db761339754 | ORPH
    mips     |         enscript-1.6.6         | NOK | https://autobuild.buildroot.org/results/f67bf65efda739d24032a8d60a1550832c49230c | ORPH
    arc      | firmware-utils-86739f2b3ae9... | NOK | https://autobuild.buildroot.org/results/385fc93bcf3b3e8549543090b7b1930b66f0f8e6 |     
   s390x     |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/1a4de05b40283c68f952aadc02abb368e7368eb4 |     
 microblaze  |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/255dc227815269775d95781ea4572f92f4aef81f |     
    or1k     |    freeradius-server-3.2.6     | NOK | https://autobuild.buildroot.org/results/6270682470551d0e5baa3f9fb98bcf17e52a6535 |     
loongarch64  | fs/cpio/cpio.mk:131: /home/... | NOK | https://autobuild.buildroot.org/results/dc0a6cbeddecc7d4e8cee0931e1763bf8cf293c0 |     
   x86_64    |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/606c315a72ef758373271c9912084bf2fb3503cf | ORPH
powerpc64le  |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/aac76e4f839a6d4aa44841fab094a43ae7e8c764 | ORPH
   mipsel    | glibc-2.42-3-gbc13db7393773... | NOK | https://autobuild.buildroot.org/results/8463fe3ff377f3ee9a05abc13fcee8b0b38a52ec |     
loongarch64  |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/b1931afe7775a289853c69e8b1062ed52f8c9a3d | ORPH
   x86_64    |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/0e9f108e3cbbf42c49b1d88a20e3d298f0901065 |     
   xtensa    |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/6c5b99a7af6469232759a96bf0a063074ca4efbc |     
 powerpc64   |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/4130d426038ef53f9d705dfb83734fd216f9b610 | ORPH
    i686     |   host-llvm-libunwind-20.1.8   | NOK | https://autobuild.buildroot.org/results/7815b36aa1fa2f59d1db0604619883611b942955 |     
  riscv64    |   host-mender-artifact-4.1.0   | NOK | https://autobuild.buildroot.org/results/3c9ff92eade509c1331d81b6faf8a8a17befd07c |     
 microblaze  | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/0f537b2607e58907ec789c235a141f93a34c2c80 | ORPH
   s390x     | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/b9385d1fd0952c6034ffd5c35d610e1924abf521 | ORPH
loongarch64  |    host-uboot-tools-2021.07    | NOK | https://autobuild.buildroot.org/results/9cc2edee46ff70040a643a7d2187125b8154042f | ORPH
microblazeel |       igt-gpu-tools-2.1        | NOK | https://autobuild.buildroot.org/results/4ea00bd87f0fcf3bb7787a23bdc320bc062697cb |     
powerpc64le  |          iotools-1.8           | NOK | https://autobuild.buildroot.org/results/458a4ada08a46fc802e718d163c4d58f01dc869e |     
  mips64el   |         libcurl-8.16.0         | NOK | https://autobuild.buildroot.org/results/267118e59a9a155c31d1ee3abc1023478bb1e287 |     
 microblaze  | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/8591c3a9c09be2ebdea9d8675a42963339d0abe9 |     
  sparc64    | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/a1702d10dbc3c338473f79ff23ab6f5ba425bc62 |     
   armeb     | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/4bd051e6f1c45507119e4a4dc95159b9ccf5173a |     
  riscv64    | libftdi1-v1.5-62-g5e67403c4... | NOK | https://autobuild.buildroot.org/results/52e06fee64a0c09811722f0d0fa03393236ea383 |     
loongarch64  | libftdi1-v1.5-62-g5e67403c4... | NOK | https://autobuild.buildroot.org/results/b1e601473030c2c1be24d62919895ef245364f38 |     
loongarch64  |         libgee-0.20.6          | NOK | https://autobuild.buildroot.org/results/8795205ada8f012cbfcf9712ae710cbdd73787cd |     
powerpc64le  |        libgeotiff-1.7.3        | NOK | https://autobuild.buildroot.org/results/f1601021fd42a98a026cfe873432636ea96f408f |     
   arceb     |         libglvnd-1.4.0         | NOK | https://autobuild.buildroot.org/results/834748dcf77f374d9926199d5d5f548265d71755 | ORPH
  aarch64    |          libjwt-3.2.0          | NOK | https://autobuild.buildroot.org/results/1f38b3947b0264811caec928a96cbccd6633a337 |     
  mips64el   |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/41f45bae215dee603fbfcfd61ce1203134b6cc10 |     
   mips64    |         libselinux-3.9         | NOK | https://autobuild.buildroot.org/results/a7bbbb08fca765640a213d649392ea22d98a9113 |     
   xtensa    |          libsepol-3.9          | NOK | https://autobuild.buildroot.org/results/5f24318080563d8f150222a05991ceffa8bfa590 |     
  riscv32    |         libshout-2.4.6         | NOK | https://autobuild.buildroot.org/results/8ff582cb8f0e9bbb3f048aaab44f7c4e72492ff6 | ORPH
   sparc     | libuci-f3fc0b76040685829191... | NOK | https://autobuild.buildroot.org/results/54313cc17aa4f87491b5b9eeb861754aea211bee |     
    i586     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/ba96215e580e36d38f97838b03f95df855a88496 | ORPH
   mipsel    |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/d4df07785a7d6edee70549bc960c79a867c65d8e | ORPH
  sparc64    |          linux-6.16.7          | NOK | https://autobuild.buildroot.org/results/4d1f04d76d6a3f165beb8437e4c14b0b0c162689 | ORPH
    arm      |          linux-6.16.7          | NOK | https://autobuild.buildroot.org/results/79bea53acd9259953450fcf2c7d7880d1b28562e | ORPH
  powerpc    |          linux-6.16.7          | NOK | https://autobuild.buildroot.org/results/433c3c1b346473029b557c5c61205d02318e3c4d | ORPH
   xtensa    |          linux-6.16.7          | NOK | https://autobuild.buildroot.org/results/48c7790e6b313df9a29b1062168025e8eeee6cf5 | ORPH
microblazeel |          linux-6.16.7          | NOK | https://autobuild.buildroot.org/results/1d67edb975ae4b2bcc99fcf35fcbe9857de6781b | ORPH
  mips64el   |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/d5dd1683d9163e4a7780cc229ec9c744554eb00f |     
   armeb     |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/9d53885c726454344220460606189529a37022d5 |     
   x86_64    |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/bbe95ecd6990bdad50575637623056fd5ad7311c |     
 powerpc64   |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/d368e4195780c01d1db0c4a66ce455faa6f6768c |     
loongarch64  |           mdadm-4.3            | NOK | https://autobuild.buildroot.org/results/9ff4eaf9bad28bde40adc822bf05009a27b414fc | ORPH
   arceb     |       micropython-1.22.2       | NOK | https://autobuild.buildroot.org/results/c05d060549415eda76fb33b8d6ba5d64988dd3c7 |     
  powerpc    |         netsnmp-5.9.4          | NOK | https://autobuild.buildroot.org/results/0dbf1f1b479751ff71dfbee9d8bacf5b7d317429 | ORPH
    or1k     |           nvme-1.12            | NOK | https://autobuild.buildroot.org/results/700d824a7e76c61bcf69982e81b0daadd67e90bd | ORPH
    arc      |           nvme-1.12            | NOK | https://autobuild.buildroot.org/results/f604909e91d2d6c63d53b6388fe5ed1b27bd8115 | ORPH
 aarch64_be  |         open-lldp-1.1          | NOK | https://autobuild.buildroot.org/results/873044632dcd5a506956d18a4da8ec277281a48f |     
 aarch64_be  |         openvpn-2.6.14         | NOK | https://autobuild.buildroot.org/results/57d53eddb589054418b2a6207aae45f4ba09b087 |     
microblazeel |         openvpn-2.6.14         | NOK | https://autobuild.buildroot.org/results/4782f2c79e2bb9a355ca0403a0480b1e531d1696 |     
 aarch64_be  |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/a3063dd211b74fabc66fba806232ebbe2c2d6fc8 | ORPH
    or1k     |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/1458022a8f2ddd4dbc17e7ec8f3fe8e0dcfbe28d |     
  powerpc    |      perl-net-ssleay-1.94      | NOK | https://autobuild.buildroot.org/results/dfa9d51a23196bf540aa888cbe2103f06e16f6c0 |     
   sparc     |         pipewire-1.2.8         | NOK | https://autobuild.buildroot.org/results/69764cfb76c1668398386b15b28c5b8448027f05 |     
loongarch64  |           popt-1.19            | NOK | https://autobuild.buildroot.org/results/e482c0bb7fc945c82eda9348fae7f31051f9110c | ORPH
   sparc     |        procps-ng-4.0.5         | NOK | https://autobuild.buildroot.org/results/131176b578e8818326d0401fd4c22921bd7c814b | ORPH
   mipsel    | procrank_linux-21c30ab4514a... | NOK | https://autobuild.buildroot.org/results/d5e7f144bb761f59a219790e873e91a6c7de2d10 | ORPH
   armeb     |      python-bcrypt-4.2.1       | NOK | https://autobuild.buildroot.org/results/fe56d2201752b4356ead2ba943c17d00420c8626 |     
    or1k     | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/d53eaf80acb88e3510ad7f979938088eb1c289ae |     
    sh4a     |         python3-3.13.7         | NOK | https://autobuild.buildroot.org/results/c186c33dd52649217dea7ecd5f74a323325d93cc |     
loongarch64  |           sdl-1.2.15           | NOK | https://autobuild.buildroot.org/results/a29f219bbd0df9776135a2263fe80d0c4d1ff40b | ORPH
microblazeel |           sdl-1.2.15           | NOK | https://autobuild.buildroot.org/results/867f923def82bc6946bdc5252f256f181f538fd1 | ORPH
    i686     |           sdl-1.2.15           | NOK | https://autobuild.buildroot.org/results/7cfa0b6c089f7efaa456958804d4f92d965db9b1 | ORPH
  riscv64    |          seatd-0.9.1           | NOK | https://autobuild.buildroot.org/results/c793cf8cee7af4f8e1fc5c5a3eed5f2caa9bf011 | ORPH
    m68k     |         setserial-2.17         | NOK | https://autobuild.buildroot.org/results/b3e6fc7791fefce614331e79c1d5e61c481935a9 | ORPH
    arm      |    spandsp-3.0.0-6ec23e5a7e    | NOK | https://autobuild.buildroot.org/results/53cdbadad3e950ceb997a8624c6393b8dc86f953 |     
 powerpc64   |       strongswan-5.9.14        | NOK | https://autobuild.buildroot.org/results/df0db417a5dcd7a09b1e0b1e7e0760ee56b58e78 |     
 microblaze  |        syslog-ng-4.8.3         | NOK | https://autobuild.buildroot.org/results/f2015d345400364bd028e721e9081e2e543e96b1 |     
   mips64    |        tailscale-1.78.1        | NOK | https://autobuild.buildroot.org/results/b57f0317004ca3167a4e1455dbb51a0125e9f51e |     
   mips64    |        udpcast-20230924        | NOK | https://autobuild.buildroot.org/results/1b34aadfad5622f6a11eeff42f7592a9cceb4e18 | ORPH
    arc      |        udpcast-20230924        | NOK | https://autobuild.buildroot.org/results/eb23dbeadbb139548f39d3ba7f6982b1fb58501b | ORPH
powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/0dee5beb7d5716f60297ec2f2b5544ebaf7bd836 |     
   s390x     |            unknown             | NOK | https://autobuild.buildroot.org/results/86b75352e762fd3cb369d64e06fc609e8f8d6b14 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/ba7905ee45e6e8e471c0526df63becd39ce8ef12 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/5dde00ed86d81382fc6dbe8735af53e60516f156 |     
   s390x     |            unknown             | NOK | https://autobuild.buildroot.org/results/0cf43a197234d4e0bf3a6949f0f1dc4ddd2b7f8e |     
microblazeel |            unknown             | NOK | https://autobuild.buildroot.org/results/dedca84f246ca7ef7b8fac9d1ccd6ec6341f1262 |     
  riscv64    |       util-linux-2.41.1        | NOK | https://autobuild.buildroot.org/results/690594a8bc0360e05dc1e8157f36136353c86498 | ORPH
powerpc64le  |     vulkan-headers-1.4.317     | NOK | https://autobuild.buildroot.org/results/1f4b827a1c7df6679b62ade61539b920ebe9af6c | ORPH
   mips64    |     vulkan-headers-1.4.317     | NOK | https://autobuild.buildroot.org/results/403cb387be2da8f76abb9fceae69d3a30a055a75 | ORPH
   sparc     |     vulkan-headers-1.4.317     | NOK | https://autobuild.buildroot.org/results/b8be9d5dff0cda2fdafa8cf416ff73b8283896d4 | ORPH
    m68k     |     vulkan-headers-1.4.317     | NOK | https://autobuild.buildroot.org/results/7f5e2b52809790d174830ac004295078901a0520 | ORPH
powerpc64le  |     wireless_tools-30.pre9     | NOK | https://autobuild.buildroot.org/results/153b7df3e419acabb499a902b52d25a6f572ae9d |     
powerpc64le  |          zoxide-0.9.8          | NOK | https://autobuild.buildroot.org/results/2ad1054df5272d36cdd42ff1f762ff88d2f6e48f |     


Classification of failures by reason for 2025.08.x
--------------------------------------------------

          chocolate-doom-3.0.1 | 1 
              fftw-quad-3.3.10 | 1 
              libselinux-3.8.1 | 1 
                   perl-5.40.2 | 1 
               syslog-ng-4.8.1 | 1 


Detail of failures for 2025.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 microblaze  |      chocolate-doom-3.0.1      | NOK | https://autobuild.buildroot.org/results/0ebf152590422a74caa92702a6dba443ada4b3ab |     
powerpc64le  |        fftw-quad-3.3.10        | NOK | https://autobuild.buildroot.org/results/126e069098e6de249109c3ea36e688aa44ca06b4 | ORPH
  mips64el   |        libselinux-3.8.1        | NOK | https://autobuild.buildroot.org/results/86b93bd2bb7753874516041fd1abc972e0713bed |     
  mips64el   |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/1d351f162a69f0c815d528c7a76a70e8a14af8ed |     
    mips     |        syslog-ng-4.8.1         | NOK | https://autobuild.buildroot.org/results/a8689b4ee4f079333b4b9badcd4410ee672b85e3 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

                    brltty-6.6 | 1 
              host-rust-1.82.0 | 1 
                  libbpf-1.5.0 | 1 
                 linux-6.12.47 | 1 
        ltp-testsuite-20250130 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |           brltty-6.6           | NOK | https://autobuild.buildroot.org/results/31397dab8f8b316b7c1eb5c071dcdb7f911f9608 |     
   x86_64    |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/dd3f72fd544645fbcd6503a91eb7d29fc2e5d5a7 |     
    or1k     |          libbpf-1.5.0          | NOK | https://autobuild.buildroot.org/results/0b492eb9ec943dec35002ab2020886ad93b60494 |     
powerpc64le  |         linux-6.12.47          | NOK | https://autobuild.buildroot.org/results/d7bda3e9ae89542901cfcf5dbe2bf4a2925fee05 | ORPH
    i686     |     ltp-testsuite-20250130     | NOK | https://autobuild.buildroot.org/results/31271e8b4baeb6154e3d37f2c4b3435a756db8ad |     


Classification of failures by reason for 2025.05.x
--------------------------------------------------

                libcurl-8.16.0 | 1 
                wlroots-0.18.2 | 1 


Detail of failures for 2025.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |         libcurl-8.16.0         | NOK | https://autobuild.buildroot.org/results/2cceac53bf245c378369b5596f9b44a3434517c9 |     
  aarch64    |         wlroots-0.18.2         | NOK | https://autobuild.buildroot.org/results/ab227120f39d1b6d5058b55085503f7623b636c4 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
