Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 674E0C3DA7F
	for <buildroot@archiver.kernel.org>; Thu, 15 Aug 2024 05:06:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 97044401F5;
	Thu, 15 Aug 2024 05:06:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KDhXG37a_4fK; Thu, 15 Aug 2024 05:06:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A06E240264
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A06E240264;
	Thu, 15 Aug 2024 05:06:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 09D5C1BF2A4
 for <buildroot@lists.busybox.net>; Thu, 15 Aug 2024 05:06:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EAFFA60900
 for <buildroot@lists.busybox.net>; Thu, 15 Aug 2024 05:06:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OKmBYzgSx-RW for <buildroot@lists.busybox.net>;
 Thu, 15 Aug 2024 05:06:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org EA27160593
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EA27160593
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EA27160593
 for <buildroot@buildroot.org>; Thu, 15 Aug 2024 05:06:43 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2B1771BF203
 for <buildroot@buildroot.org>; Thu, 15 Aug 2024 05:06:40 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Thu, 15 Aug 2024 05:06:40 -0000
X-GND-Sasl: bot@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1723698400; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=bg+onz6mEwlyGoEe7wfmiShfxh4Yc5IIngYWG56qFEY=;
 b=fVRKvMEfAVWEGcNIwQpMBU2k8RJwaCOaRgS5esYqws9A6Vz6NQTC+3AP87gbmKWdyW2ua2
 PeVbVlcDwTrvA5HD2BsP+fTCUcktjfCc2wAJ+Vd/WvRokgFOyL21ovJ0nySqZIKys9OoRz
 w/7DBcHILafOGgEGiuZLj6C+CIaj37QPDgDqF5XAX4P8AHBdllVHcZVWXpxUH7K3M0Yybm
 tZnPk8kAw/aagWl29878yz6KN32mHA84wu3KdXvYS5gXvdiW3S9mTSI+uHehVD05RdjI95
 UfpsVT0cnhJOKmzLnkScmN2QVvGtPnkH2Ejwpp+0h5b3Yq1PXu3eqS8BJopPwg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=fVRKvMEf
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2024-08-14
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
Message-ID: <20240815050640.SYhs97V6luxKkG9EHJFe2YYftem8WR75NpFDaHFieug@z>

Hello,

Autobuild statistics for 2024-08-14
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  4  |  3  |  0  |  7  |
  2024.05.x  |  7  |  4  |  0  | 11  |
    master   | 59  | 77  |  2  | 138 |
     next    |  5  |  8  |  0  | 13  |

Classification of failures by reason for master
-----------------------------------------------

                  ffmpeg-6.1.2 | 7 
                 openssh-9.8p1 | 4 
      python-autocommand-2.2.2 | 4 
                gnu-efi-3.0.18 | 3 
host-go-bootstrap-stage1-1.... | 3 
         host-libxcrypt-4.4.36 | 3 
                  linux-6.10.3 | 3 
                  ntp-4.2.8p18 | 3 
               procps-ng-4.0.4 | 3 
           python-daemon-3.0.1 | 3 
glibc-2.39-74-g198632a05f6c... | 2 
         gobject-introspection | 2 
                    norm-1.5.8 | 2 
android-tools-4.2.2+git2013... | 1 
                 apache-2.4.62 | 1 
                   atop-2.10.0 | 1 
              bubblewrap-0.9.0 | 1 
              cache-calibrator | 1 
                  clamav-1.0.6 | 1 
                 coreutils-9.3 | 1 
                     criu-3.19 | 1 
                   cvs-1.12.13 | 1 
                elfutils-0.189 | 1 
                gerbera-1.12.1 | 1 
           ghostscript-10.03.1 | 1 
                 gnuplot-6.0.1 | 1 
                   host-go-src | 1 
           host-librsvg-2.50.9 | 1 
 host-softether-4.30-9700-beta | 1 
               iproute2-6.10.0 | 1 
                  libffi-3.4.6 | 1 
               libglib2-2.76.1 | 1 
             libgpg-error-1.50 | 1 
                 libp11-0.4.12 | 1 
                libpcap-1.10.4 | 1 
                  libsepol-3.6 | 1 
                 logsurfer-1.8 | 1 
        ltp-testsuite-20240524 | 1 
               mariadb-10.11.6 | 1 
                    ncmpc-0.49 | 1 
          ncurses-6.4-20230603 | 1 
               openblas-0.3.27 | 1 
          perl-net-ssleay-1.94 | 1 
                    proj-9.3.0 | 1 
         python-remi-2022.7.27 | 1 
                s6-dns-2.3.7.2 | 1 
                   trinity-1.9 | 1 
                       unknown | 1 
                     z3-4.13.0 | 1 
               zxing-cpp-2.2.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 microblaze  | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/e3c64daf1069882b1a609ca9a334e5e31e76dab5 |     
   s390x     |         apache-2.4.62          | NOK | http://autobuild.buildroot.net/results/8497028637b648a5d8c44cd78a648eba00137cd3 |     
microblazeel |          atop-2.10.0           | NOK | http://autobuild.buildroot.net/results/1c3a427d9adc15d67d7fe78df40a2f5233fe41ac |     
    arc      |        bubblewrap-0.9.0        | NOK | http://autobuild.buildroot.net/results/8840cf3b4a009e5ebb191a6e3f1ba7f146c1ae96 |     
   sparc     |        cache-calibrator        | NOK | http://autobuild.buildroot.net/results/642848a2e54f06d255c4edc24aab397b5fc3ffb2 |     
   armeb     |          clamav-1.0.6          | NOK | http://autobuild.buildroot.net/results/91145b28babcce0edfa703e874bdccc2744d9c60 |     
   sh4aeb    |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/08e41768e6d26ab78951e57346163d2d4613bccd | ORPH
    arm      |           criu-3.19            | NOK | http://autobuild.buildroot.net/results/f6a04d4e926935b9de34c58017fc3161d185fedb |     
   nios2     |          cvs-1.12.13           | NOK | http://autobuild.buildroot.net/results/1f22fcae7c82909d8af077fff0b3062549b8ab7c | ORPH
   mips64    |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/852cb30f76e3c9c8bebaa357b3a86012c896a6c6 | ORPH
microblazeel |          ffmpeg-6.1.2          | NOK | http://autobuild.buildroot.net/results/c49bb2652471550f9926ed118f4c06471c226597 |     
    arc      |          ffmpeg-6.1.2          | NOK | http://autobuild.buildroot.net/results/5bcdb6cf7da58bbf55e0c1c002e518118c857e10 |     
 microblaze  |          ffmpeg-6.1.2          | NOK | http://autobuild.buildroot.net/results/0dbd2ee01958709cca133b2508cd3c2d0715615f |     
   arceb     |          ffmpeg-6.1.2          | NOK | http://autobuild.buildroot.net/results/14bf0340e1bade20902e4faca296ddaaf0f47ab4 |     
    arc      |          ffmpeg-6.1.2          | NOK | http://autobuild.buildroot.net/results/095ceb89fad76ee12de80d411c71721dd3f6138f |     
 microblaze  |          ffmpeg-6.1.2          | NOK | http://autobuild.buildroot.net/results/ffe90ad742ba0b5393a37b6af2830c46b0c03119 |     
microblazeel |          ffmpeg-6.1.2          | NOK | http://autobuild.buildroot.net/results/1f2ec1fed5aa30cdfd7407ae0a6f632951f63ca9 |     
   mipsel    |         gerbera-1.12.1         | NOK | http://autobuild.buildroot.net/results/91c2d8ae72209f34ca70a8810c514aa3e8b5d7f8 |     
   sparc     |      ghostscript-10.03.1       | NOK | http://autobuild.buildroot.net/results/e00c0c2e1726a5cf4b6c08c2693d08ec8098a2c8 |     
powerpc64le  | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/9d69887f20037ec24031476aa4c530f7385793d0 |     
 powerpc64   | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/3151bca72992f6b331f8fc19c42d33334e48a00b |     
    arm      |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/d37c8aadf3b2d7a43dcebe009c6b754f1d8883e7 |     
  riscv64    |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/5e72bfc7d12bb1b8519e4ee8400b8d5772446a69 |     
   armeb     |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/e0cc126cee5030b9b33289d8ec9b778afd56e866 |     
 microblaze  |         gnuplot-6.0.1          | NOK | http://autobuild.buildroot.net/results/3f9ac91869338e7b99f659903a92b4370e374d7c |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/93c8c4022499863c77727fcd84df5b56a173997d |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/0cd2e6ff2fade513b60f451bfc8ffdbdcacab372 |     
  mips64el   | host-go-bootstrap-stage1-1.... | NOK | http://autobuild.buildroot.net/results/f2b12f0c775929393f90461fce15aa2b5939eede |     
  mips64el   | host-go-bootstrap-stage1-1.... | NOK | http://autobuild.buildroot.net/results/4f970ac18401220c3942ac2f263df571a5749f67 |     
 aarch64_be  | host-go-bootstrap-stage1-1.... | NOK | http://autobuild.buildroot.net/results/e1805e01569d7876f12751cf6f4840f617b6ca9a |     
  aarch64    |          host-go-src           | NOK | http://autobuild.buildroot.net/results/74560de1aeb82b81c54decddbb00c9b2cba15132 |     
  sparc64    |      host-librsvg-2.50.9       | NOK | http://autobuild.buildroot.net/results/fd8be2816ea438b83d756f6852a28e1f1419b8cb |     
   x86_64    |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.net/results/4b97202685f8c24f9691abfe24df5f2f7f95a49d |     
  mips64el   |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.net/results/b169bfff697008e570da0cd93bebce0a64cfb55f |     
 aarch64_be  |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.net/results/9e65a11b0de80a3dbfca5e5f26bebb5771f569fe |     
 microblaze  | host-softether-4.30-9700-beta  | NOK | http://autobuild.buildroot.net/results/a42a0a22fed3148b6727b74955dfb0aae6289412 | ORPH
    arm      |        iproute2-6.10.0         | NOK | http://autobuild.buildroot.net/results/8d713bd911f8d6b97272a7bb5dc2c188aeb99b05 |     
   arceb     |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/768f5ac57c715204a5bfb1eac8ab72dfdf3c39a9 |     
   arceb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/466b9a4eda17c4574fd3ffa40a972e53d3c1900f |     
    arm      |       libgpg-error-1.50        | NOK | http://autobuild.buildroot.net/results/759c55ad1081f69c915c19fbe556da8269d0a44f | ORPH
   x86_64    |         libp11-0.4.12          | NOK | http://autobuild.buildroot.net/results/86f064f5969e1b1a0328633dbdf44caf6fba1fe4 | ORPH
    m68k     |         libpcap-1.10.4         | NOK | http://autobuild.buildroot.net/results/db58215fb3c7f30b6c0f0764a84271010346edfb |     
   xtensa    |          libsepol-3.6          | NOK | http://autobuild.buildroot.net/results/43994970d8450d5d8a0d5f5b09383bbd26c6fb57 |     
   mips64    |          linux-6.10.3          | NOK | http://autobuild.buildroot.net/results/ae6c6214221a66cac224ceab108c433908eb3188 | ORPH
    i686     |          linux-6.10.3          | NOK | http://autobuild.buildroot.net/results/6fcf6cca35f908d3d7fe2107c87b473d16d38b5f | ORPH
  powerpc    |          linux-6.10.3          | NOK | http://autobuild.buildroot.net/results/0ea56aa6430a01055d492f0ab5e6c3703778eaf2 | ORPH
  aarch64    |         logsurfer-1.8          | NOK | http://autobuild.buildroot.net/results/902a9681359c481a306c5d8f8f4b273cabc17b1e |     
   x86_64    |     ltp-testsuite-20240524     | NOK | http://autobuild.buildroot.net/results/ba479d503bb13f8faf5ea447849a67fe2479b93a |     
   sparc     |        mariadb-10.11.6         | NOK | http://autobuild.buildroot.net/results/b16df94640e0a52bee694e4eea764349c38daa3d | ORPH
  riscv32    |           ncmpc-0.49           | NOK | http://autobuild.buildroot.net/results/dc087d062f459e9fd944bd3e520990e822f3f5ce |     
   xtensa    |      ncurses-6.4-20230603      | NOK | http://autobuild.buildroot.net/results/01cbc188c70f53fe492128100b430857f1cd98f2 | ORPH
    m68k     |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/ae7b734ddff276fe9d4321db6b150963c73b8743 | ORPH
    arm      |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/5c1d440ee3ac8e46cc8bb6c87285f31fc4cbf925 | ORPH
   arceb     |          ntp-4.2.8p18          | NOK | http://autobuild.buildroot.net/results/57cf9f9db7da26a5152a1ae6c69344dc8729f829 |     
    arm      |          ntp-4.2.8p18          | NOK | http://autobuild.buildroot.net/results/e3ccaa02fd3ac5958129a2f53bad8c49d6301cc8 |     
  powerpc    |          ntp-4.2.8p18          | NOK | http://autobuild.buildroot.net/results/56c4181a83d8f415412c33647bec7e4c0357a749 |     
  mips64el   |        openblas-0.3.27         | NOK | http://autobuild.buildroot.net/results/499a4a43eb11931f296bddf5b1e3e1851f2fa0c2 |     
powerpc64le  |         openssh-9.8p1          | NOK | http://autobuild.buildroot.net/results/8f8e37bc40eb0243461a8243abbbe5d445a2fa6f | ORPH
powerpc64le  |         openssh-9.8p1          | NOK | http://autobuild.buildroot.net/results/2fd0c27e090171649e66375dd494b05fb60ada4b | ORPH
  sparc64    |         openssh-9.8p1          | NOK | http://autobuild.buildroot.net/results/c229c7ae7b8660d97d04373ae013846adc0e18ef | ORPH
powerpc64le  |         openssh-9.8p1          | NOK | http://autobuild.buildroot.net/results/45444510e834a767b2af97004c71c804c44ff0ab | ORPH
    arm      |      perl-net-ssleay-1.94      | NOK | http://autobuild.buildroot.net/results/4751f099d5293405da1303382d57942ab30f9721 |     
  aarch64    |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.net/results/861369c07de40573e0627c9e09824a451d11d075 | ORPH
    or1k     |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.net/results/56680fc94a9b61e0d661a526cde4abe2c1960e17 | ORPH
   s390x     |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.net/results/3bf55919f4da6f950072010f0a9ca09f8d9ad292 | ORPH
    m68k     |           proj-9.3.0           | NOK | http://autobuild.buildroot.net/results/26f8f2aa747112e360bc17e736cd5445f3e96e49 |     
   x86_64    |    python-autocommand-2.2.2    | NOK | http://autobuild.buildroot.net/results/474d8ff05a0d46fd13293a0b000b93d4a7edff7d |     
  sparc64    |    python-autocommand-2.2.2    | NOK | http://autobuild.buildroot.net/results/4dbf63eef246fdc7d03d7a56596789a01ea15ebf |     
    arm      |    python-autocommand-2.2.2    | NOK | http://autobuild.buildroot.net/results/3a68af30279075d7d0d5b453cdf89e6d4099b400 |     
    arm      |    python-autocommand-2.2.2    | NOK | http://autobuild.buildroot.net/results/718e999443480ba86f645dd5302a0089b3055d85 |     
  aarch64    |      python-daemon-3.0.1       | NOK | http://autobuild.buildroot.net/results/06273f16321b574129610e113f16f1bc2fb54fed |     
  mips64el   |      python-daemon-3.0.1       | NOK | http://autobuild.buildroot.net/results/e78f8de0c6315fb3c49cba8b159a946d557003a1 |     
    mips     |      python-daemon-3.0.1       | NOK | http://autobuild.buildroot.net/results/b09da0136d3a69fb82bd9ef9774d4fcb0e24dd99 |     
   nios2     |     python-remi-2022.7.27      | NOK | http://autobuild.buildroot.net/results/0e90e5223435c81ab30d1836a136929a1f571186 |     
    arm      |         s6-dns-2.3.7.2         | NOK | http://autobuild.buildroot.net/results/5d923272ec43e65a676594d8b31a599370058441 |     
    mips     |          trinity-1.9           | NOK | http://autobuild.buildroot.net/results/0d56f879beae4789a16a13fb72f09a54413ff850 | ORPH
   sparc     |            unknown             | NOK | http://autobuild.buildroot.net/results/b7f7afb26122b7c79448abf883fbd0d5242f7ffb |     
  riscv64    |           z3-4.13.0            | NOK | http://autobuild.buildroot.net/results/9e7a56964aec4acab7722486366ebd8e23253a6d |     
  mips64el   |        zxing-cpp-2.2.1         | NOK | http://autobuild.buildroot.net/results/4d5ec2567118ca58b41177c7e9fe12c5a6708c22 |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

                    mpir-3.0.0 | 1 
                 openssh-9.7p1 | 1 
                       unknown | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   s390x     |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/b3d317f3712c07790b73286552844d53216d2118 |     
    mips     |         openssh-9.7p1          | NOK | http://autobuild.buildroot.net/results/f5a04babb8b198a5ab136773f836043ab255b0d7 | ORPH
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/7b8bc51835c05b28e773d752d4c954e801d4147b |     


Classification of failures by reason for 2024.05.x
--------------------------------------------------

aubio-152d6819b360c2e7b379e... | 1 
           ghostscript-10.03.1 | 1 
                iproute2-6.8.0 | 1 
                       unknown | 1 


Detail of failures for 2024.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     | aubio-152d6819b360c2e7b379e... | NOK | http://autobuild.buildroot.net/results/a2d27cecbe6a20c8af8d3ce83b9b454dd30657df |     
    arm      |      ghostscript-10.03.1       | NOK | http://autobuild.buildroot.net/results/07bdd67af1551c6ead142abcc04e6fcbf6b13ecb |     
   arceb     |         iproute2-6.8.0         | NOK | http://autobuild.buildroot.net/results/491a68dae81b19f8c4ca2025ebf1cea0c0fdd0c0 |     
    sh4a     |            unknown             | NOK | http://autobuild.buildroot.net/results/b676a5ce448138248e651a8431f0084af6f31bc9 |     


Classification of failures by reason for next
---------------------------------------------

                       unknown | 3 
                   atop-2.10.0 | 1 
                gerbera-1.12.1 | 1 
  gobject-introspection-1.76.1 | 1 
               procps-ng-4.0.4 | 1 
         python-remi-2022.7.27 | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    sh4      |          atop-2.10.0           | NOK | http://autobuild.buildroot.net/results/f91373b15d346885a1a84a44567853fe3ad3078c |     
   sh4aeb    |         gerbera-1.12.1         | NOK | http://autobuild.buildroot.net/results/55ded4a83f4f429256484bc7744ee5704dc9f63c |     
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/39f636d8e6931608bb157f3a0aae21b3675661a9 | ORPH
   x86_64    |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.net/results/81b90cea98d947eca577d999fc789e8edbdf4f36 | ORPH
  riscv32    |     python-remi-2022.7.27      | NOK | http://autobuild.buildroot.net/results/fc5a463311400101bcad2db760934ebfe1023958 |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.net/results/73de431cd799b98919b07725dd9411deb477b317 |     
   armeb     |            unknown             | NOK | http://autobuild.buildroot.net/results/616fbc63de3e2661e899594131eb08c8a0bf04a7 |     
    mips     |            unknown             | NOK | http://autobuild.buildroot.net/results/48cdd992e1e30f7e374a5f02cddd8db372d70a9a |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
