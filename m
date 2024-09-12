Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 243F1EEB590
	for <buildroot@archiver.kernel.org>; Thu, 12 Sep 2024 11:04:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AF2F341980;
	Thu, 12 Sep 2024 11:04:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C_lE7muvnebq; Thu, 12 Sep 2024 11:04:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2D79F41985
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2D79F41985;
	Thu, 12 Sep 2024 11:04:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2461B1BF29F
 for <buildroot@lists.busybox.net>; Thu, 12 Sep 2024 11:04:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 154DA40233
 for <buildroot@lists.busybox.net>; Thu, 12 Sep 2024 11:04:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ySzGL03Md8vC for <buildroot@lists.busybox.net>;
 Thu, 12 Sep 2024 11:04:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::533; helo=mail-ed1-x533.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 41D9740160
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 41D9740160
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 41D9740160
 for <buildroot@buildroot.org>; Thu, 12 Sep 2024 11:04:22 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5c3d2f9f896so981800a12.1
 for <buildroot@buildroot.org>; Thu, 12 Sep 2024 04:04:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726139060; x=1726743860;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BAh8Az8Cpfw8bbYowksn6vhLXNhEOAA5D6fzen1/FaA=;
 b=tnpMa3eBRsgVDLR56lKrXmvpNhHGDcaRgtOMnxh8rvWnV05jAHHi6mQzwQuYdcKoZe
 Gg+AKElQqMZ+F7Np5RF0NnfGU3dGaeYZGn/U7yjKP9MYj4C8wviCSdeXcL+LJ+HlIffP
 17dxYbw5fPmaqzsaGsF2GuoYAi+8kb+qFtB1SSUretVXjKWqDJDxexe292t/eyWtGBde
 6oUtp+qQGlJHm90jG3xUkvB3L4+TTHvHLmc+1IrVuxNt/G1nlPdsxf26Y/duNlVqD566
 SxMFHdFxZGT/xHe3hM25ZRpPgv05CmTEeFWtbVmf55bgL4uV1O9crjEs5THSlVbq0shn
 AEFQ==
X-Gm-Message-State: AOJu0Yw+v/8KBEKU6Vy+ssiPcr3QAdguoJaYH1nib1EV2uJbsA/URXKE
 AX5xVdfTbzJskt91UwOQFiv3zEIGcua/Nu02F793glz0PG+eiaoxgUTlqg==
X-Google-Smtp-Source: AGHT+IG18YAiFU+i5wYt3UnylQvfd5fXuquBA897fkVLVs4uAi8TlJRFRS8HQSIjsMEQiOJ3W//eJw==
X-Received: by 2002:a17:907:ea0:b0:a8a:8c04:ce95 with SMTP id
 a640c23a62f3a-a9029608a7emr245786266b.43.1726139059680; 
 Thu, 12 Sep 2024 04:04:19 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8d25835d16sm724056866b.36.2024.09.12.04.04.19
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Sep 2024 04:04:19 -0700 (PDT)
Message-ID: <66e2cab3.170a0220.335243.7263@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Thu, 12 Sep 2024 11:04:19 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726139060; x=1726743860; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=BAh8Az8Cpfw8bbYowksn6vhLXNhEOAA5D6fzen1/FaA=;
 b=S+3yLbdYmAg34t+Qw5H7YeHlqiztFjm284o9Zg1q3q1foKp43oqwNvcwD2qgVvbuEd
 4wVYTZjn5opBt7VXXL5ttA4LfAxYy8d6BRURS53Gjx1mQFEoT992PbQvV+2BAdcqPccY
 RlF96L42vwW++/fnBJgFeQC1xBWCel2g6JlYEF8j6eQtckIYnkFaDBsPqjc5R8uomDma
 O1TWT4WhEFQeqCXKbXlanY8f6VldtbLNkUZ0+YgF7qcGwm8uca5v+sczERUmNb5wxdn0
 Wxgd7qhgREqt+U51in2Tc+bzLqLfAy2go7Xr39jPF5FVEntfpNaKl896/0UxFu1gjQZ5
 FTvg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=S+3yLbdY
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2024-09-11
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

Autobuild statistics for 2024-09-11
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  | 14  | 15  |  0  | 29  |
  2024.05.x  | 12  | 15  |  0  | 27  |
  2024.08.x  |  5  |  6  |  0  | 11  |
    master   | 19  | 269 |  5  | 293 |

Classification of failures by reason for master
-----------------------------------------------

                 libssh-0.11.0 | 28
                  linux-6.10.8 | 27
               procps-ng-4.0.4 | 13
aubio-152d6819b360c2e7b379e... | 12
              host-rust-1.80.1 | 11
           at-spi2-core-2.50.0 | 9 
                    bsdiff-4.3 | 9 
               linux-pam-1.6.1 | 8 
                directfb-1.7.7 | 7 
glibc-2.40-18-g564178076272... | 7 
               pulseaudio-17.0 | 7 
  gobject-introspection-1.76.1 | 6 
                       unknown | 6 
android-tools-4.2.2+git2013... | 5 
             bluez5_utils-5.77 | 5 
          cryptodev-linux-1.13 | 5 
         gobject-introspection | 5 
          linux-5.10.162-cip24 | 5 
                 apache-2.4.62 | 4 
           host-librsvg-2.50.9 | 4 
                 libv4l-1.28.1 | 4 
     linux-5.10.162-cip24-rt10 | 4 
                  ntp-4.2.8p18 | 4 
                  ffmpeg-6.1.2 | 3 
            gettext-gnu-0.22.4 | 3 
               ipmitool-1_8_19 | 3 
              libopenssl-3.3.2 | 3 
            linux-fusion-9.0.3 | 3 
             batman-adv-2024.2 | 2 
  binutils-arc-2023.09-release | 2 
             dahdi-linux-3.3.0 | 2 
                   duma-2.5.21 | 2 
                elfutils-0.189 | 2 
                     file-5.45 | 2 
host-vboot-utils-4b12d392e5... | 2 
                  libva-2.22.0 | 2 
             lirc-tools-0.10.2 | 2 
               mariadb-10.11.6 | 2 
                   pcre2-10.43 | 2 
                 pixman-0.42.2 | 2 
                python3-3.12.5 | 2 
                  whois-5.5.14 | 2 
                  acpid-2.0.34 | 1 
                apparmor-3.1.7 | 1 
             berkeleydb-5.3.28 | 1 
                  bind-9.18.28 | 1 
                   bird-2.15.1 | 1 
                   bzip2-1.0.8 | 1 
                  cairo-1.18.0 | 1 
                 coreutils-9.3 | 1 
                   cvs-1.12.13 | 1 
                    dust-0.9.0 | 1 
                   eza-0.18.22 | 1 
              fluent-bit-3.1.3 | 1 
                   foot-1.16.2 | 1 
                  fwupd-1.9.20 | 1 
                gerbera-1.12.1 | 1 
                 gnuplot-6.0.1 | 1 
            host-binutils-2.42 | 1 
       host-gcc-initial-14.2.0 | 1 
                   host-go-src | 1 
         host-libxcrypt-4.4.36 | 1 
                      iwd-2.19 | 1 
                  jack2-1.9.22 | 1 
                latencytop-0.5 | 1 
                   libsha1-0.3 | 1 
                libxml2-2.13.3 | 1 
        linux-headers-5.10.225 | 1 
mali-driver-d40c57d81c9cf4b... | 1 
                  musepack-475 | 1 
               openblas-0.3.28 | 1 
                    polkit-123 | 1 
               postgresql-16.4 | 1 
      python-autocommand-2.2.2 | 1 
           python-numpy-1.25.0 | 1 
                  quagga-1.2.4 | 1 
               valgrind-3.23.0 | 1 
                zerofree-1.1.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mips64    |          acpid-2.0.34          | NOK | http://autobuild.buildroot.org/results/f7f48565e38903e7afba2876dc1d901e48201657 | ORPH
powerpc64le  | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.org/results/3b38b7c935f54e1d85ea953123e9bab06442f075 |     
powerpc64le  | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.org/results/40bf1ff87eff8b6bb112b299170671b9000be321 |     
 powerpc64   | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.org/results/0a0ee4613aec57230a2b0fdb4f39e79176d5ba5c |     
 powerpc64   | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.org/results/879ceb9e0a5763f74c7310d1c31a61a4ec77e2f5 |     
  riscv32    | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.org/results/dc1f075db4ee1e4f4472cea7ea963a46c319f355 |     
    m68k     |         apache-2.4.62          | NOK | http://autobuild.buildroot.org/results/fdffea75ac54d50caec33a03706ff6ae073d2afa |     
   x86_64    |         apache-2.4.62          | NOK | http://autobuild.buildroot.org/results/c84fea6643ab8ea1dbee4290d5878f72d784c02f |     
  aarch64    |         apache-2.4.62          | NOK | http://autobuild.buildroot.org/results/ae459ca31946bb75046cb0289e3f41610503c36e |     
    m68k     |         apache-2.4.62          | NOK | http://autobuild.buildroot.org/results/16708d282584c95ae274b34ae0c1fbbb16c36664 |     
    arc      |         apparmor-3.1.7         | NOK | http://autobuild.buildroot.org/results/b205e0d021672be8c2dc5e96a490f0a746418a52 |     
microblazeel |      at-spi2-core-2.50.0       | NOK | http://autobuild.buildroot.org/results/3801f06e060f5e8db6ce4443ecf32af617755028 |     
   sparc     |      at-spi2-core-2.50.0       | NOK | http://autobuild.buildroot.org/results/69f2eb9a54e6f8c00dcf269e302204fec4bf4df1 |     
   sparc     |      at-spi2-core-2.50.0       | NOK | http://autobuild.buildroot.org/results/d190cf3488c1c4f907c7068b0f6737f2009604b2 |     
microblazeel |      at-spi2-core-2.50.0       | NOK | http://autobuild.buildroot.org/results/a446fe7d6c36cddf81ba60ab47ca64c7fe7c8471 |     
microblazeel |      at-spi2-core-2.50.0       | NOK | http://autobuild.buildroot.org/results/e88b65370bb3b4c72eb289d256e59d41e9df0f57 |     
   arceb     |      at-spi2-core-2.50.0       | NOK | http://autobuild.buildroot.org/results/99319db403706a43ca8d2010429f4d238c30dbe3 |     
    mips     |      at-spi2-core-2.50.0       | NOK | http://autobuild.buildroot.org/results/3420e64b4313a4e726ad6ebde31a8826f950a07f |     
   sparc     |      at-spi2-core-2.50.0       | NOK | http://autobuild.buildroot.org/results/58855763fb1ee5a45f549a666e0f5a72490e8263 |     
    or1k     |      at-spi2-core-2.50.0       | NOK | http://autobuild.buildroot.org/results/311ed4da1fbf08cf8c2743f443ffdf65941b85f0 |     
   s390x     | aubio-152d6819b360c2e7b379e... | NOK | http://autobuild.buildroot.org/results/fa9b0ba956cdac6428c3bf7b6f61e41057f99703 |     
   s390x     | aubio-152d6819b360c2e7b379e... | NOK | http://autobuild.buildroot.org/results/ab39028bb97ed3f7639588ee9f3745091e273858 |     
   armeb     | aubio-152d6819b360c2e7b379e... | NOK | http://autobuild.buildroot.org/results/452e14556bff5e633939bcb012029180c020ce2e |     
   s390x     | aubio-152d6819b360c2e7b379e... | NOK | http://autobuild.buildroot.org/results/b18279ea141d324dafd0aae6b6b8eaf001697c13 |     
 powerpc64   | aubio-152d6819b360c2e7b379e... | NOK | http://autobuild.buildroot.org/results/0f51cad9d103672fd4828edc87abe2b7d107259c |     
    mips     | aubio-152d6819b360c2e7b379e... | NOK | http://autobuild.buildroot.org/results/644c7ae117d15836c0c994621bdb287446cb4093 |     
   armeb     | aubio-152d6819b360c2e7b379e... | NOK | http://autobuild.buildroot.org/results/4dfac7fbf28b392f34b0e6d595e1b33890eb69dd |     
   armeb     | aubio-152d6819b360c2e7b379e... | NOK | http://autobuild.buildroot.org/results/a018a19fa3aab5c8987238580614870cf431a6fd |     
  sparc64    | aubio-152d6819b360c2e7b379e... | NOK | http://autobuild.buildroot.org/results/da27f3b1979782fa94cf1bcb4612dd140e90a9bc |     
 aarch64_be  | aubio-152d6819b360c2e7b379e... | NOK | http://autobuild.buildroot.org/results/e595776dc4e804196057441f3681cde9ef98e3f4 |     
 powerpc64   | aubio-152d6819b360c2e7b379e... | NOK | http://autobuild.buildroot.org/results/1e96a30b20a777a4014100291b174375b9f4ac81 |     
 microblaze  | aubio-152d6819b360c2e7b379e... | NOK | http://autobuild.buildroot.org/results/724c624a5dff7c2154bf40044d78a7fb56e11f1b |     
    mips     |       batman-adv-2024.2        | NOK | http://autobuild.buildroot.org/results/d181fb6326972c54e58957786b0bccc93e92de04 |     
   mips64    |       batman-adv-2024.2        | NOK | http://autobuild.buildroot.org/results/74b7430e7f68ce80447fece7092799f8745c9fdd |     
  riscv64    |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.org/results/ce34501bd0fbacfb0f5526b5b1f6d50a670b6176 | ORPH
   s390x     |          bind-9.18.28          | NOK | http://autobuild.buildroot.org/results/5151dda356403aeae9bedbbb3688cafd8c221d23 | ORPH
   arceb     |  binutils-arc-2023.09-release  | NOK | http://autobuild.buildroot.org/results/bc0b8c072aba55e142f46d963bec4505f00cfd04 |     
   arceb     |  binutils-arc-2023.09-release  | NOK | http://autobuild.buildroot.org/results/4816c125ecf72139350a3242fc5cf333f959799c |     
    arc      |          bird-2.15.1           | NOK | http://autobuild.buildroot.org/results/10c43ce60749574967624fd2524ade82d4534619 |     
 aarch64_be  |       bluez5_utils-5.77        | NOK | http://autobuild.buildroot.org/results/547ec159d7df6c0773b66694acd25b707abdfdfd |     
    or1k     |       bluez5_utils-5.77        | NOK | http://autobuild.buildroot.org/results/87d5ff4f8775cee0fda7a94d50775a8c94d4fdbd |     
   s390x     |       bluez5_utils-5.77        | NOK | http://autobuild.buildroot.org/results/f647e8d35ab43afb277dba962f71d511e78afa44 |     
  mips64el   |       bluez5_utils-5.77        | NOK | http://autobuild.buildroot.org/results/5e95c56370b0b08c31fccb6627a46745a7b16352 |     
  sparc64    |       bluez5_utils-5.77        | NOK | http://autobuild.buildroot.org/results/47271d252d2a9b7f5f0cb0d4bd2168dd0e640920 |     
  riscv64    |           bsdiff-4.3           | NOK | http://autobuild.buildroot.org/results/fa3a8fa00403b9eac571c07c70047cc75861edbc | ORPH
   nios2     |           bsdiff-4.3           | NOK | http://autobuild.buildroot.org/results/da59ec0edae38efaf26554d4d090541d83eee0f0 | ORPH
  sparc64    |           bsdiff-4.3           | NOK | http://autobuild.buildroot.org/results/ff3559666144ec863abf2a2b97709e1a5cdb2a44 | ORPH
 powerpc64   |           bsdiff-4.3           | NOK | http://autobuild.buildroot.org/results/c457c76f4157c108eaf68278b6f2420fa002455c | ORPH
  riscv64    |           bsdiff-4.3           | NOK | http://autobuild.buildroot.org/results/0c3d19c5d4b1aea9e4a267bd6e786ce8c9ac00df | ORPH
   mips64    |           bsdiff-4.3           | NOK | http://autobuild.buildroot.org/results/65ee2ece96ab6d226c7fd3868c0c00ae7d276063 | ORPH
  riscv64    |           bsdiff-4.3           | NOK | http://autobuild.buildroot.org/results/11c118e10345f0a632373e07aaba8c2e089c4833 | ORPH
  powerpc    |           bsdiff-4.3           | NOK | http://autobuild.buildroot.org/results/81089c38349f417b5590e61dfe6f02d72a090eff | ORPH
    mips     |           bsdiff-4.3           | NOK | http://autobuild.buildroot.org/results/f0cd7c6567b154ac626f813a46d94903e8639e9e | ORPH
powerpc64le  |          bzip2-1.0.8           | NOK | http://autobuild.buildroot.org/results/b88469a582c95d3ab2e09fc3e0e5df66b7c04445 | ORPH
    i686     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.org/results/6d0d5e2915e49b92dca5113bd69aa999b40e44dc |     
    sh4      |         coreutils-9.3          | NOK | http://autobuild.buildroot.org/results/3a87a474f7743a7ded744d0929670a4545cec885 | ORPH
    mips     |      cryptodev-linux-1.13      | NOK | http://autobuild.buildroot.org/results/c877eef7e2de4504ecc02332f0af916591939edf | ORPH
  mips64el   |      cryptodev-linux-1.13      | NOK | http://autobuild.buildroot.org/results/d4d5c51b0c6aba6708ef0bc39905596533a00210 | ORPH
  mips64el   |      cryptodev-linux-1.13      | NOK | http://autobuild.buildroot.org/results/7c03ccdbf3d5bb34f5e054e7c57c7f3ec6e3d75d | ORPH
    m68k     |      cryptodev-linux-1.13      | NOK | http://autobuild.buildroot.org/results/9b12690dd6ddaba493bdb8a9c14cdc213ea95a85 | ORPH
  mips64el   |      cryptodev-linux-1.13      | NOK | http://autobuild.buildroot.org/results/e6f9de864179dfcdbe5a8001c58fba53f070fa55 | ORPH
   s390x     |          cvs-1.12.13           | NOK | http://autobuild.buildroot.org/results/7b5fe94e524c5ba9ac0a802a631d8a4e4541ec6b | ORPH
  mips64el   |       dahdi-linux-3.3.0        | NOK | http://autobuild.buildroot.org/results/6cecf44f2f2ec75680174b98a01b853bf2fca55a |     
  mips64el   |       dahdi-linux-3.3.0        | NOK | http://autobuild.buildroot.org/results/fda61ce7efb3193553763dc26a2bd4a247e6f0c5 |     
  riscv32    |         directfb-1.7.7         | NOK | http://autobuild.buildroot.org/results/8a466a9df15817fe35e291772d88a4f2088c71a8 | ORPH
   arceb     |         directfb-1.7.7         | NOK | http://autobuild.buildroot.org/results/78006ffd51e3b2d718d226faee7c3baa8f9a2886 | ORPH
   sh4aeb    |         directfb-1.7.7         | NOK | http://autobuild.buildroot.org/results/a8b02a6bd0c98b7c961afb496b5d53f231fb65e2 | ORPH
   mipsel    |         directfb-1.7.7         | NOK | http://autobuild.buildroot.org/results/15c6597c58e610bba809b656612ba7dbdc5c2da3 | ORPH
    or1k     |         directfb-1.7.7         | NOK | http://autobuild.buildroot.org/results/798a35b03b6b0f907617a35565e0aeb2b5f1d97c | ORPH
    sh4      |         directfb-1.7.7         | NOK | http://autobuild.buildroot.org/results/3bec7619a805c488cd8d15e575312f1adc4673e1 | ORPH
    arc      |         directfb-1.7.7         | NOK | http://autobuild.buildroot.org/results/50c8ad649509289b9d5a4efa8006f39f07e9009f | ORPH
    or1k     |          duma-2.5.21           | NOK | http://autobuild.buildroot.org/results/2f0d8b989f29160e8d5d4db00e7eb5578cc3c965 | ORPH
  sparc64    |          duma-2.5.21           | NOK | http://autobuild.buildroot.org/results/3d23d71887653aea05115f0a81abac26b79ddf9b | ORPH
   armeb     |           dust-0.9.0           | NOK | http://autobuild.buildroot.org/results/c07d2f0c09ffccb789fbbeb81d2518365326acf7 | ORPH
   sh4eb     |         elfutils-0.189         | NOK | http://autobuild.buildroot.org/results/10a1d20846939dd0de9a28028ae7c1f34b7f42e7 | ORPH
   s390x     |         elfutils-0.189         | NOK | http://autobuild.buildroot.org/results/3c894e8020572d4e93559c3bdee459225a6ad7ca | ORPH
   s390x     |          eza-0.18.22           | NOK | http://autobuild.buildroot.org/results/b5dde5681939b9f7555ddd4970bac7c9a208a7e2 |     
   arceb     |          ffmpeg-6.1.2          | NOK | http://autobuild.buildroot.org/results/7a84bcbeb306f49ee286b13b5a256c0e7a317129 |     
  riscv32    |          ffmpeg-6.1.2          | NOK | http://autobuild.buildroot.org/results/76bcdf109341842a107c6c7ed14c612e1aa3f810 |     
   arceb     |          ffmpeg-6.1.2          | NOK | http://autobuild.buildroot.org/results/4e3733e6bc33d14f068b7dce4862339d49d72407 |     
   mipsel    |           file-5.45            | NOK | http://autobuild.buildroot.org/results/044305be1b58988bc1286f727680dc331ab3d8d3 | ORPH
    mips     |           file-5.45            | NOK | http://autobuild.buildroot.org/results/92600044832729d2f9801e15eb3aa51fd26f391a | ORPH
    or1k     |        fluent-bit-3.1.3        | NOK | http://autobuild.buildroot.org/results/26a9271162e84ef86566721973d5aa39840891e4 |     
    or1k     |          foot-1.16.2           | NOK | http://autobuild.buildroot.org/results/972e383f34310c5d63abde69feee3ace0cf022c1 |     
    i586     |          fwupd-1.9.20          | NOK | http://autobuild.buildroot.org/results/8782f5dd15b5a174c1de7c68acc4d5eddc307d24 |     
   x86_64    |         gerbera-1.12.1         | NOK | http://autobuild.buildroot.org/results/9cbc70f01cf6ecfe265b82f05a38e725fec0c8be |     
   xtensa    |       gettext-gnu-0.22.4       | NOK | http://autobuild.buildroot.org/results/83a242145a5f6c647dec13eccdfb221d201a5ae0 | ORPH
    arc      |       gettext-gnu-0.22.4       | NOK | http://autobuild.buildroot.org/results/4dab9af8068fc0ef832bde34b0cbaf009941613a | ORPH
    or1k     |       gettext-gnu-0.22.4       | NOK | http://autobuild.buildroot.org/results/e640ac6ac92d5f0eebb74e4814e2c8c636291e11 | ORPH
   arceb     | glibc-2.40-18-g564178076272... | NOK | http://autobuild.buildroot.org/results/fe0d0e5bbdcea2a78892f48f772c695a0829855d |     
    arc      | glibc-2.40-18-g564178076272... | NOK | http://autobuild.buildroot.org/results/5fae5da022abd594b9ba2dc4615864aa10144e20 |     
    arc      | glibc-2.40-18-g564178076272... | NOK | http://autobuild.buildroot.org/results/778e352af7e2d5fd819763dcc51c69957a4c5961 |     
    arc      | glibc-2.40-18-g564178076272... | NOK | http://autobuild.buildroot.org/results/4b689155afb677568668cf3780a3da560a251b91 |     
  riscv64    | glibc-2.40-18-g564178076272... | NOK | http://autobuild.buildroot.org/results/92ca9d0312327f9133401d5c88a4554154cb5570 |     
   arceb     | glibc-2.40-18-g564178076272... | NOK | http://autobuild.buildroot.org/results/07c775c943b219f18ce4fdd66bef6642f982c5aa |     
   arceb     | glibc-2.40-18-g564178076272... | NOK | http://autobuild.buildroot.org/results/283cae78f73993573ed89c644c1e6537c1103e04 |     
    or1k     |         gnuplot-6.0.1          | NOK | http://autobuild.buildroot.org/results/a13eb9a6b17601607802c6019549bce3c20f66be |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.org/results/c32cdb057b71c8e64c94a7955f0fbca73d61255e |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.org/results/fdfe0771d978a0632da689049f3606b6fe505e8e |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.org/results/bc9fb12aaaf72afef0f665626cd8f40804c4812c |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.org/results/8afa89187acb53affc1ed0bd3b37f5114953fbad |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.org/results/80a3f9e248d9848f73dd3a03af28c15ed498b69c |     
    i686     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.org/results/74407f1c9079c8e3b1dc97f7f64aad9b9b7e43db | ORPH
    i686     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.org/results/5e584c84312134dcc415f51e435a301c085723d2 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.org/results/4f2914a598d71321ac1bd511bd0da8dd369d4c40 | ORPH
   nios2     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.org/results/f1438b7450704e90e247f67d629408fdb390ed2c | ORPH
    i686     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.org/results/e60acd7f0d6a85f08275e6068d42dd3be16c4a8f | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.org/results/b545ed3234b65c081ca31b89a5557bd2c9b1d418 | ORPH
   armeb     |       host-binutils-2.42       | NOK | http://autobuild.buildroot.org/results/00d5f9c93fb0648c3dccf4e8dc3031ef149b380b |     
 powerpc64   |    host-gcc-initial-14.2.0     | NOK | http://autobuild.buildroot.org/results/d79f97bf8e24f4b9ccbe52fedeaa2b46c5f0374a |     
    i586     |          host-go-src           | NOK | http://autobuild.buildroot.org/results/211e8af6145956d51cf1eac9e0172c62765b021c |     
    or1k     |      host-librsvg-2.50.9       | NOK | http://autobuild.buildroot.org/results/64d60a567873d56e89e5fd242ca5a483eeda45dc |     
   arceb     |      host-librsvg-2.50.9       | NOK | http://autobuild.buildroot.org/results/a0dd65cfe5437fdfe4dac0804716b5b024f2bf6e |     
   sparc     |      host-librsvg-2.50.9       | NOK | http://autobuild.buildroot.org/results/17ab4d075d21b0f9f53799c46ee63642e0707b5f |     
   mipsel    |      host-librsvg-2.50.9       | NOK | http://autobuild.buildroot.org/results/8545a42ad42cf46894e9483d4faeb36c06d703b0 |     
 powerpc64   |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.org/results/93d461b3af584cf36895082993392d99a6860432 |     
   s390x     |        host-rust-1.80.1        | NOK | http://autobuild.buildroot.org/results/57a417c3ae3f2760e521bbe2080b1e2c24dab2b9 |     
   s390x     |        host-rust-1.80.1        | NOK | http://autobuild.buildroot.org/results/006f6ba5439c7ce66e980e39218469004a6ae944 |     
    i686     |        host-rust-1.80.1        | NOK | http://autobuild.buildroot.org/results/9dd478901ac68ebd7c8799ec984dfef48fec54ab |     
 powerpc64   |        host-rust-1.80.1        | NOK | http://autobuild.buildroot.org/results/5171707841e6f1248a619e65b3482abba2d419ae |     
   s390x     |        host-rust-1.80.1        | NOK | http://autobuild.buildroot.org/results/927b5ef05d7987ecbd47349619491e10fdf835b4 |     
 powerpc64   |        host-rust-1.80.1        | NOK | http://autobuild.buildroot.org/results/f7fbfaca13a4f68c7d135d1d2845eefa2923f782 |     
  sparc64    |        host-rust-1.80.1        | NOK | http://autobuild.buildroot.org/results/ef45c083b7d75deb81b7a6f1fd9b358d62f36aa9 |     
  sparc64    |        host-rust-1.80.1        | NOK | http://autobuild.buildroot.org/results/7893bcc992a9482299f37246855ba810e52897b7 |     
  sparc64    |        host-rust-1.80.1        | NOK | http://autobuild.buildroot.org/results/6f087799772601b8c12c644b284954ed962f4c30 |     
   s390x     |        host-rust-1.80.1        | NOK | http://autobuild.buildroot.org/results/c1383188d69963384bd2519b04d63b76f51610df |     
   x86_64    |        host-rust-1.80.1        | NOK | http://autobuild.buildroot.org/results/cb8209d63df689175ef8c7344442688582c54d9b |     
   nios2     | host-vboot-utils-4b12d392e5... | NOK | http://autobuild.buildroot.org/results/5b6041b816e2abbbec6e638e3f03cb4aad7b42ac |     
  riscv64    | host-vboot-utils-4b12d392e5... | NOK | http://autobuild.buildroot.org/results/6de68cacf1d9b2d9481d41217ad3a54d6018c60d |     
    arm      |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.org/results/0a8295e07ef3a1a29b2b3304b0dd6a8a6f90fe14 |     
    mips     |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.org/results/ff84fc557f1a6a51bd4d77748ad89e4a87bbe13e |     
 powerpc64   |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.org/results/b39bd6020f3e1b3775dd8c9d0f3a610daf2f4ec5 |     
   sh4eb     |            iwd-2.19            | NOK | http://autobuild.buildroot.org/results/c493f86f3a241d59123609cd06274ab64e6015af | ORPH
    m68k     |          jack2-1.9.22          | NOK | http://autobuild.buildroot.org/results/11a91a5347c7baf0bc93a34a39d31a1ccc498ef5 |     
   sh4aeb    |         latencytop-0.5         | NOK | http://autobuild.buildroot.org/results/cc9fe2bd61d9c36b5a2a102ffe9c601c9d597160 | ORPH
 microblaze  |        libopenssl-3.3.2        | NOK | http://autobuild.buildroot.org/results/745c529083e4ec314bc46da7d70e1980848debd1 | ORPH
 microblaze  |        libopenssl-3.3.2        | NOK | http://autobuild.buildroot.org/results/e45dab90bab2768d200eedc8aff970ecff150e02 | ORPH
microblazeel |        libopenssl-3.3.2        | NOK | http://autobuild.buildroot.org/results/6f231e19094bc4a6fa93ff8b297b933981a5901f | ORPH
   armeb     |          libsha1-0.3           | NOK | http://autobuild.buildroot.org/results/f5138cfd461bb05a935a379dbb68de96ef819b65 |     
  riscv64    |         libssh-0.11.0          | NOK | http://autobuild.buildroot.org/results/cb6a1542a02594724eba647a79042e0cbfd54424 | ORPH
   s390x     |         libssh-0.11.0          | NOK | http://autobuild.buildroot.org/results/b6fdb6cbdd172307aac5c74fca3c7f0939ae6e17 | ORPH
  sparc64    |         libssh-0.11.0          | NOK | http://autobuild.buildroot.org/results/6b118795634277d1caf82db38a908704451e7c3c | ORPH
   sh4eb     |         libssh-0.11.0          | NOK | http://autobuild.buildroot.org/results/75523a58137b4da1b306077e401c3574e25706cc | ORPH
   mips64    |         libssh-0.11.0          | NOK | http://autobuild.buildroot.org/results/584198e0fec68252e4f470e1866aa6db23f2fb6a | ORPH
   nios2     |         libssh-0.11.0          | NOK | http://autobuild.buildroot.org/results/55f07a2aa9463e5263f07354e002e6a72d3a53b4 | ORPH
    sh4      |         libssh-0.11.0          | NOK | http://autobuild.buildroot.org/results/aa10b82bb8033c5b51c449c998720f7a0b2d0705 | ORPH
  sparc64    |         libssh-0.11.0          | NOK | http://autobuild.buildroot.org/results/97c24818ace1c681fb22626147ab7a6c47cb3a16 | ORPH
    or1k     |         libssh-0.11.0          | NOK | http://autobuild.buildroot.org/results/73efc4f4cab8cb7cd798302d1a765404bb3d8936 | ORPH
   sh4eb     |         libssh-0.11.0          | NOK | http://autobuild.buildroot.org/results/43298eb2e9487e1e69dd2f14ff15492083f09072 | ORPH
   s390x     |         libssh-0.11.0          | NOK | http://autobuild.buildroot.org/results/68200c97f81f85ba872c7e52afa38c6425d46444 | ORPH
   sh4aeb    |         libssh-0.11.0          | NOK | http://autobuild.buildroot.org/results/99914737acd5626b947b5e12974b95391a2575f2 | ORPH
   armeb     |         libssh-0.11.0          | NOK | http://autobuild.buildroot.org/results/751c5612130ebec371a722e4335dfba4e3f49c9c | ORPH
   sh4eb     |         libssh-0.11.0          | NOK | http://autobuild.buildroot.org/results/060daae14a06c259e3754bb03330fe50b92cac94 | ORPH
   mipsel    |         libssh-0.11.0          | NOK | http://autobuild.buildroot.org/results/35a0b01adc9bd9714a7207a5dc9ac27c37ed9d5f | ORPH
   arceb     |         libssh-0.11.0          | NOK | http://autobuild.buildroot.org/results/e9a90f36876be39d757651d04a976eb89def5602 | ORPH
powerpc64le  |         libssh-0.11.0          | NOK | http://autobuild.buildroot.org/results/b3d69975dcc05bee52d566d5064feaf78ce784b8 | ORPH
  sparc64    |         libssh-0.11.0          | NOK | http://autobuild.buildroot.org/results/2b7cabe09e859ab50e619e78c4c4b431ce225ca3 | ORPH
   mipsel    |         libssh-0.11.0          | NOK | http://autobuild.buildroot.org/results/0c0f97711d1172619498b79a9e8f8daa28014afd | ORPH
    i686     |         libssh-0.11.0          | NOK | http://autobuild.buildroot.org/results/d9cf19f6613a4ec82934eef90cbb74ac41587051 | ORPH
   sh4eb     |         libssh-0.11.0          | NOK | http://autobuild.buildroot.org/results/9e74be61848157f202e62cb40ae5e3fddc1cb23b | ORPH
   x86_64    |         libssh-0.11.0          | NOK | http://autobuild.buildroot.org/results/c550ab65cf8ba2cb6854635e290c841de77ef5d4 | ORPH
    sh4a     |         libssh-0.11.0          | NOK | http://autobuild.buildroot.org/results/63fc93fc1ce16a4ecb1ddaf0f8aa9db6c01e0053 | ORPH
    arc      |         libssh-0.11.0          | NOK | http://autobuild.buildroot.org/results/dc54545ae0cd42b6bd57dfe372b592c025af1d58 | ORPH
 microblaze  |         libssh-0.11.0          | NOK | http://autobuild.buildroot.org/results/f6c9b6b75a71780846813c291b653125a2a1999b | ORPH
   x86_64    |         libssh-0.11.0          | NOK | http://autobuild.buildroot.org/results/e7944341fff010627ddecebf7885f879e5ad0705 | ORPH
    i486     |         libssh-0.11.0          | NOK | http://autobuild.buildroot.org/results/29fdc8773494f56bf3d2e12b3665545329c8332c | ORPH
    i586     |         libssh-0.11.0          | NOK | http://autobuild.buildroot.org/results/805204e56dbb042934616532aaecf5bd21a83262 | ORPH
 microblaze  |         libv4l-1.28.1          | NOK | http://autobuild.buildroot.org/results/99c3c71e205b0a2d4cc4043af342f32ed96836ab |     
   sh4eb     |         libv4l-1.28.1          | NOK | http://autobuild.buildroot.org/results/e8e0830f3f8277a3f543491ff4079f8097a0905b |     
   arceb     |         libv4l-1.28.1          | NOK | http://autobuild.buildroot.org/results/6b4799d8fcd5a77df898c46ad882e716638fe56a |     
   armeb     |         libv4l-1.28.1          | NOK | http://autobuild.buildroot.org/results/427f0477a8ca42bc5722e95ac079c13ca16b1ba4 |     
   mipsel    |          libva-2.22.0          | NOK | http://autobuild.buildroot.org/results/687ad39fc0897aae43dd07df0eed9f68b0d73cb5 |     
 aarch64_be  |          libva-2.22.0          | NOK | http://autobuild.buildroot.org/results/c1222a59b0ff6263fc7ef5265a3793771f6a7ac9 |     
   armeb     |         libxml2-2.13.3         | NOK | http://autobuild.buildroot.org/results/8c31167a64104395173f113cfdc1aa886e8de4cb |     
    mips     |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.org/results/ff2dfacd9e2675edaa9e63e62ab2a4e417123892 | ORPH
   arceb     |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.org/results/54006790d6bf2f609adf8d415abd81875e483254 | ORPH
   sparc     |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.org/results/5e79197ddf66c8661300ad0feca882111ce07746 | ORPH
    i686     |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.org/results/dabc80c862b872f728a1fa6dd5a0d9c1a1d8a0ed | ORPH
   armeb     |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.org/results/4c8347ee1f5a9ca9bc8ac1d879cafe3a7f7d11e3 | ORPH
   mips64    |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.org/results/eb1cba0d9b73f78e2a9f31d6cb62ef8e36821ee5 | ORPH
   mipsel    |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.org/results/c454cd67020e77593580bc43921e5596e7225d7f | ORPH
   armeb     |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.org/results/52b8a4985c78d09c5e2ac28f8e05e29925fba6c2 | ORPH
   mipsel    |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.org/results/2fd74c770b4f6b34abc965ec236a159f780f0022 | ORPH
   armeb     |          linux-6.10.8          | NOK | http://autobuild.buildroot.org/results/e269c346057edd0dbbf508499d60913518026149 | ORPH
   mipsel    |          linux-6.10.8          | NOK | http://autobuild.buildroot.org/results/86eb9d56658f74568d6d4f12dee7ce126c974c87 | ORPH
   arceb     |          linux-6.10.8          | NOK | http://autobuild.buildroot.org/results/dd834052168e371ae73889e6bc176ee6670b3cea | ORPH
    sh4a     |          linux-6.10.8          | NOK | http://autobuild.buildroot.org/results/142156a9171f3f18be18d1d367200d6fd520a275 | ORPH
    sh4a     |          linux-6.10.8          | NOK | http://autobuild.buildroot.org/results/9c1ba5c0c3e9e6a097559b96c5755e726609fbac | ORPH
   sparc     |          linux-6.10.8          | NOK | http://autobuild.buildroot.org/results/00807dca38b354bc64ee9d038bdd8165b9f2d43a | ORPH
  powerpc    |          linux-6.10.8          | NOK | http://autobuild.buildroot.org/results/801babc887eeee8e6d5fcf71be84c9f7e5655e4d | ORPH
   nios2     |          linux-6.10.8          | NOK | http://autobuild.buildroot.org/results/6b619a4d149cdde744c925589517da1e5d21271f | ORPH
   sparc     |          linux-6.10.8          | NOK | http://autobuild.buildroot.org/results/f1e7c05c786da62d2a4318a15de3cb2041de5b0a | ORPH
    or1k     |          linux-6.10.8          | NOK | http://autobuild.buildroot.org/results/6565befb71da69226e084ca5ea1ee09c6c225c0e | ORPH
   armeb     |          linux-6.10.8          | NOK | http://autobuild.buildroot.org/results/00b2b1ff4d2a61f7b7b4288b93e544affa691a72 | ORPH
 powerpc64   |          linux-6.10.8          | NOK | http://autobuild.buildroot.org/results/5388e3ad7c8c143e52ba4b3b2a60eb04dff67697 | ORPH
   mipsel    |          linux-6.10.8          | NOK | http://autobuild.buildroot.org/results/5f7c31742b9ea15af913e232ddf005f5a4b6f494 | ORPH
   arceb     |          linux-6.10.8          | NOK | http://autobuild.buildroot.org/results/f29ab9cd540fc209466946b51198770da8152fd7 | ORPH
  powerpc    |          linux-6.10.8          | NOK | http://autobuild.buildroot.org/results/30d80fe8ab9a0d213fc3b02fe0b4f8efc49352c8 | ORPH
  mips64el   |          linux-6.10.8          | NOK | http://autobuild.buildroot.org/results/111c048a4acc5d065c2018b3b52815327f42e761 | ORPH
   mipsel    |          linux-6.10.8          | NOK | http://autobuild.buildroot.org/results/8264644994c2a220b6ced7e52ea3cd9cc16efe5f | ORPH
    arm      |          linux-6.10.8          | NOK | http://autobuild.buildroot.org/results/58f02b2ce5dcfdf6f54a0be4c28ce91f210c5121 | ORPH
  powerpc    |          linux-6.10.8          | NOK | http://autobuild.buildroot.org/results/bebe9f48105f6621e237173f0c1fb7804bea7f2b | ORPH
 powerpc64   |          linux-6.10.8          | NOK | http://autobuild.buildroot.org/results/b1d91cb9c2399f99bd712b28fb9d52d2c24dfafd | ORPH
    m68k     |          linux-6.10.8          | NOK | http://autobuild.buildroot.org/results/7c45af89e2d9654d0f4f212535f65cb980ded3f4 | ORPH
   armeb     |          linux-6.10.8          | NOK | http://autobuild.buildroot.org/results/b42434a7e039fea11aecc8c26810ad7a0d2959b5 | ORPH
   s390x     |          linux-6.10.8          | NOK | http://autobuild.buildroot.org/results/642b09b8dd593278e88038196383dc96b70093e7 | ORPH
    mips     |          linux-6.10.8          | NOK | http://autobuild.buildroot.org/results/8f3d398ae6cce4e6851350f607acda3bc763a009 | ORPH
    m68k     |          linux-6.10.8          | NOK | http://autobuild.buildroot.org/results/c7b1aba9b7620cff2f6707e103a41b2a8ab736f5 | ORPH
   mipsel    |          linux-6.10.8          | NOK | http://autobuild.buildroot.org/results/9d28c1cf108b03c450c5c66d4ef57c04038d02db | ORPH
   sparc     |          linux-6.10.8          | NOK | http://autobuild.buildroot.org/results/141372bedb9dd7d9e43ddf95839d6b6c7f916bef | ORPH
powerpc64le  |       linux-fusion-9.0.3       | NOK | http://autobuild.buildroot.org/results/8b34c12be4c78a566c3d9f9247410978b0c13143 | ORPH
   nios2     |       linux-fusion-9.0.3       | NOK | http://autobuild.buildroot.org/results/38a13558014d74ea2eee5290c59d3f2d543d2f93 | ORPH
  sparc64    |       linux-fusion-9.0.3       | NOK | http://autobuild.buildroot.org/results/facc395fdfdbccccfc4284d3b4a7fc07ef1098b4 | ORPH
powerpc64le  |     linux-headers-5.10.225     | NOK | http://autobuild.buildroot.org/results/bf01e3831372dc3e4ecb9ca52f2253574a2ccfac | ORPH
    mips     |        linux-pam-1.6.1         | NOK | http://autobuild.buildroot.org/results/d22dd63fc8cd75bcbb8078407e7ecccc84d78645 | ORPH
   arceb     |        linux-pam-1.6.1         | NOK | http://autobuild.buildroot.org/results/e256d4914e2cee673f7b5c798936a7f2b664cde9 | ORPH
   xtensa    |        linux-pam-1.6.1         | NOK | http://autobuild.buildroot.org/results/ea51dd0c1c0a2b30426a7754fcd778d8970486ba | ORPH
   mipsel    |        linux-pam-1.6.1         | NOK | http://autobuild.buildroot.org/results/f03bd1d7b13f9e2d307acf1b7c79e2c1e66388bc | ORPH
    or1k     |        linux-pam-1.6.1         | NOK | http://autobuild.buildroot.org/results/39bee05b0dd4aa608ba629fca96b659d398d842f | ORPH
  mips64el   |        linux-pam-1.6.1         | NOK | http://autobuild.buildroot.org/results/0818105d4df920fb13e554e8e438297b5fe066a7 | ORPH
 aarch64_be  |        linux-pam-1.6.1         | NOK | http://autobuild.buildroot.org/results/beae4af9311f4ed853ab115bde1cb13946f8529f | ORPH
   armeb     |        linux-pam-1.6.1         | NOK | http://autobuild.buildroot.org/results/4cd01956d407758831256c6d9276bf6d5cbb374b | ORPH
powerpc64le  |       lirc-tools-0.10.2        | NOK | http://autobuild.buildroot.org/results/9b921c5b2490549f5d877a982faaf1adeb8d5962 | ORPH
   nios2     |       lirc-tools-0.10.2        | NOK | http://autobuild.buildroot.org/results/a1416a7ec4df64c4960a3dc59da048a7c90a4b20 | ORPH
    arm      | mali-driver-d40c57d81c9cf4b... | NOK | http://autobuild.buildroot.org/results/7521bd861834b8d43b6d9e729e6162e476210b66 |     
   sparc     |        mariadb-10.11.6         | NOK | http://autobuild.buildroot.org/results/c9ba593e66b1855ed7ec385f011c4563e8048103 | ORPH
powerpc64le  |        mariadb-10.11.6         | NOK | http://autobuild.buildroot.org/results/257eb9664d6c5b91abbe903a6ab73dcfcc13e7ab | ORPH
   nios2     |          musepack-475          | NOK | http://autobuild.buildroot.org/results/6b0fc8f74be86f464f4dc6c9b0f0b7ae3944611c | ORPH
   armeb     |          ntp-4.2.8p18          | NOK | http://autobuild.buildroot.org/results/1294d2f55a575c259101eb9faebb2365f6ed4483 |     
   sparc     |          ntp-4.2.8p18          | NOK | http://autobuild.buildroot.org/results/8a6d4820cc271043efd7d6e84f163654ff8b5aeb |     
    arc      |          ntp-4.2.8p18          | NOK | http://autobuild.buildroot.org/results/e00448e8cee1bf4c09cf8e90b67c4607b1f2a34d |     
  riscv64    |          ntp-4.2.8p18          | NOK | http://autobuild.buildroot.org/results/c90c11eeb8b080092c33033b0bf26b445bed334c |     
  riscv64    |        openblas-0.3.28         | NOK | http://autobuild.buildroot.org/results/4a037ed36b985e73ddc02b64f3637ab19a3d14b1 |     
   mipsel    |          pcre2-10.43           | NOK | http://autobuild.buildroot.org/results/9db20c642face2963034c4453526fc038df5be86 | ORPH
   mips64    |          pcre2-10.43           | NOK | http://autobuild.buildroot.org/results/cd7f5fe5fd9530fbcc18a78339b641d116458205 | ORPH
   armeb     |         pixman-0.42.2          | NOK | http://autobuild.buildroot.org/results/ce6672f8b2e309d7dfbca6337d6d36fff245dc37 | ORPH
    or1k     |         pixman-0.42.2          | NOK | http://autobuild.buildroot.org/results/9beaaf4908925a689fe384af2ac7b605231842dd | ORPH
   nios2     |           polkit-123           | NOK | http://autobuild.buildroot.org/results/ed97691d946ca0a55509578b8bbfabb760d9d2af |     
 aarch64_be  |        postgresql-16.4         | NOK | http://autobuild.buildroot.org/results/0bfabd785c84a0fb648c9e9d807458010b95423d |     
   nios2     |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/092a239e1df7e93ad0930a8b5261e2e478d1265c | ORPH
   sparc     |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/1a472a9a502254c63fcb1e7756bcde54529e4fb7 | ORPH
    i586     |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/4ada11286062cc45072d754be1c2057a9d94a1b3 | ORPH
 powerpc64   |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/b795d860939420e9a017e80192687651d3889e05 | ORPH
   mips64    |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/fe4d4abe47f06d70f5639ccf49ee4dd0ef24ffe4 | ORPH
 aarch64_be  |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/9a61e7bd0ab73b73a887f5a292037a64b718baef | ORPH
    arc      |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/8531f9addd32e3445bc6ed148d6aa11746a66ca0 | ORPH
 aarch64_be  |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/1b03356763ac6edb51e7af04be7ee0eec90e389c | ORPH
   sparc     |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/be5cbb67dddb0fbc76407343b013a63cf5aa0789 | ORPH
  riscv64    |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/d582cb6864c4c88e511ff3cf0311557e28208dde | ORPH
  riscv32    |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/9901e0323852c5b94e131553586fd48841bd40cf | ORPH
   sparc     |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/3eb5eb578823130e740928910b7f9dadbd2c9c62 | ORPH
   sh4eb     |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/509dac8f740181959297ab1b98fed6858f4fb002 | ORPH
    or1k     |        pulseaudio-17.0         | NOK | http://autobuild.buildroot.org/results/0028ac3fd0e742636336933279537e5d57176a3a | ORPH
   nios2     |        pulseaudio-17.0         | NOK | http://autobuild.buildroot.org/results/27454564a1331c1fe1841e93335dc7e26ccab707 | ORPH
    arm      |        pulseaudio-17.0         | NOK | http://autobuild.buildroot.org/results/e77ef56688667b7e4dfcca812c43693450b34e8a | ORPH
    or1k     |        pulseaudio-17.0         | NOK | http://autobuild.buildroot.org/results/f0ede1088cbd4418137552ff1520090db0b45550 | ORPH
   nios2     |        pulseaudio-17.0         | NOK | http://autobuild.buildroot.org/results/2d7715c844b5419b0eb19653994bbe59ad60c115 | ORPH
    or1k     |        pulseaudio-17.0         | NOK | http://autobuild.buildroot.org/results/b5bd808179ea7cc277e5ac1f30a10e59a6e8a456 | ORPH
   nios2     |        pulseaudio-17.0         | NOK | http://autobuild.buildroot.org/results/c3d06b2650c9e5a2b61100013bba05666f194039 | ORPH
   x86_64    |    python-autocommand-2.2.2    | NOK | http://autobuild.buildroot.org/results/5836e7492f6d776da57e784ac9dbf9d49984cb27 |     
   x86_64    |      python-numpy-1.25.0       | NOK | http://autobuild.buildroot.org/results/173e71af481caa2c5005eb714fceacb8f9f16b4f |     
   arceb     |         python3-3.12.5         | NOK | http://autobuild.buildroot.org/results/a95a3edf3c0d198092bf7f1b172ab12689562ec9 |     
    arc      |         python3-3.12.5         | NOK | http://autobuild.buildroot.org/results/eeb3650efabab29e9e3ea52bd36217e6d3941e0d |     
   xtensa    |          quagga-1.2.4          | NOK | http://autobuild.buildroot.org/results/a4b34149d284f13e1188ba72082a28faf7370ff3 | ORPH
    m68k     |            unknown             | NOK | http://autobuild.buildroot.org/results/45b0b1a44f6e567b067bb21ea74ae3a9ab937c7e |     
  sparc64    |            unknown             | NOK | http://autobuild.buildroot.org/results/195cf4fb14882d413f34b677804b188f4166ea65 |     
   arceb     |            unknown             | NOK | http://autobuild.buildroot.org/results/dd64793867dfe607b42643f658729cb94832b8d1 |     
 microblaze  |            unknown             | NOK | http://autobuild.buildroot.org/results/c5b8187cae244c74928613b1bb7a79983a39fedd |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.org/results/c9b272dc787090d20a17ea6434207aa392553c88 |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.org/results/bebb3bc8484b41a2e17652e3f879ea13e7074d2b |     
    i586     |        valgrind-3.23.0         | NOK | http://autobuild.buildroot.org/results/c32b8e36f2be1e478721054ecde820f5b9dff471 | ORPH
  riscv64    |          whois-5.5.14          | NOK | http://autobuild.buildroot.org/results/3b78614f0ff0f4470e49a6ffcfe94484456954da |     
  riscv64    |          whois-5.5.14          | NOK | http://autobuild.buildroot.org/results/fe41007fbc1b93afa6e4cc1d615732b54a112021 |     
 microblaze  |         zerofree-1.1.1         | NOK | http://autobuild.buildroot.org/results/a9e4c6a869ec4241ec5b070f26d315c4047cf332 |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

               host-go-1.21.13 | 3 
                 coreutils-9.3 | 2 
                  boost-1.83.0 | 1 
                elfutils-0.189 | 1 
esp-hosted-6a25417fc880fd74... | 1 
                  fbterm-1.7.0 | 1 
                    fcft-3.1.6 | 1 
  gobject-introspection-1.76.1 | 1 
                  jack2-1.9.22 | 1 
                memtest86-6.20 | 1 
                  ntp-4.2.8p18 | 1 
                       unknown | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |          boost-1.83.0          | NOK | http://autobuild.buildroot.org/results/3ac28c6e16d6d7cac493801c866653d055642728 |     
    arm      |         coreutils-9.3          | NOK | http://autobuild.buildroot.org/results/f18d1251d3aa9613ca2aecb67de33c884cce97f3 | ORPH
    arc      |         coreutils-9.3          | NOK | http://autobuild.buildroot.org/results/579d943d276a042b19a4b2b07b069b0d0a513000 | ORPH
    arc      |         elfutils-0.189         | NOK | http://autobuild.buildroot.org/results/89dfd5cf9b8d4697d7518bbb49b4fab38a5c57e9 | ORPH
  riscv32    | esp-hosted-6a25417fc880fd74... | NOK | http://autobuild.buildroot.org/results/0f309188627a546b6a89eda660cd127abb6a020d |     
   mipsel    |          fbterm-1.7.0          | NOK | http://autobuild.buildroot.org/results/e5076907029ddf9fa6a8a90be0ae1700e4f4ee45 | ORPH
  mips64el   |           fcft-3.1.6           | NOK | http://autobuild.buildroot.org/results/ff51affbfbfc3ae3d1e53aacd9953da3e912a695 |     
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.org/results/1211e46176ea50d45e351d13db712f206f919918 | ORPH
 aarch64_be  |        host-go-1.21.13         | NOK | http://autobuild.buildroot.org/results/614906db4bef81ec4c882afa7686662f3bf9f46d |     
  mips64el   |        host-go-1.21.13         | NOK | http://autobuild.buildroot.org/results/83f0fee4d555215baae3776bf9b4e180440634d8 |     
  mips64el   |        host-go-1.21.13         | NOK | http://autobuild.buildroot.org/results/df5c55025ac84f2569cfce8241a21ddc8dd81539 |     
    m68k     |          jack2-1.9.22          | NOK | http://autobuild.buildroot.org/results/52edb5ea56d16d3af81bdfd1ac368d169e0e90bd |     
    i686     |         memtest86-6.20         | NOK | http://autobuild.buildroot.org/results/5218158403de491e6c627b684428b77ef8b8ec81 |     
    arm      |          ntp-4.2.8p18          | NOK | http://autobuild.buildroot.org/results/73cca105b725838313377ee5c100c285b6cad8de |     
   arceb     |            unknown             | NOK | http://autobuild.buildroot.org/results/0d08e141b4ebaeacb30e190e8ac5b860fcfaf14b |     


Classification of failures by reason for 2024.05.x
--------------------------------------------------

                  acpid-2.0.34 | 1 
                   bzip2-1.0.8 | 1 
              cache-calibrator | 1 
             cni-plugins-1.3.0 | 1 
           crucible-2023.11.02 | 1 
             dahdi-linux-3.3.0 | 1 
host-heimdal-f4faaeaba371ff... | 1 
           host-systemd-254.13 | 1 
          libcamera-apps-1.2.1 | 1 
               lighttpd-1.4.76 | 1 
                openswan-3.0.0 | 1 
               procps-ng-4.0.4 | 1 
                 shadow-4.14.5 | 1 
              skalibs-2.12.0.1 | 1 
                    zeek-4.1.1 | 1 


Detail of failures for 2024.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mips64    |          acpid-2.0.34          | NOK | http://autobuild.buildroot.org/results/fa76fa7616a26c34ad65b65441a4929ba1b78ade | ORPH
  riscv32    |          bzip2-1.0.8           | NOK | http://autobuild.buildroot.org/results/b1bd952895eaf0b83f10ff56b5096f8d42e7830f | ORPH
   armeb     |        cache-calibrator        | NOK | http://autobuild.buildroot.org/results/faf57915b5c26a151831173298e7db4342fea55a |     
  riscv64    |       cni-plugins-1.3.0        | NOK | http://autobuild.buildroot.org/results/5b461504e42b388c053de838f755a017a3ea7768 |     
  riscv64    |      crucible-2023.11.02       | NOK | http://autobuild.buildroot.org/results/691e3d4286380984f9aae18847aa478b53f6aea2 |     
   mips64    |       dahdi-linux-3.3.0        | NOK | http://autobuild.buildroot.org/results/58f66c49cf00a41f70d64c2453c9d49322c65fe4 |     
   mipsel    | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.org/results/72775c2d36e591979451148e4577e33e9116453f | ORPH
    arc      |      host-systemd-254.13       | NOK | http://autobuild.buildroot.org/results/1934c27bb5d8c93f9021ba163e2fba294723b77d |     
  sparc64    |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.org/results/6c3bf0dcbadd5596ca65d951bc4d41f8f3e12c80 |     
   sparc     |        lighttpd-1.4.76         | NOK | http://autobuild.buildroot.org/results/d91966015292e1312ac8e21f99bdb8777845c4d7 | ORPH
   armeb     |         openswan-3.0.0         | NOK | http://autobuild.buildroot.org/results/95e7f82a91f991075bc07031a3b8bae911c2db7e | ORPH
   sparc     |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/24a1c3dc72a52eae2c51126078d224be02b78ea3 | ORPH
  mips64el   |         shadow-4.14.5          | NOK | http://autobuild.buildroot.org/results/2d454ab8c3e00b6f62f8e81957ddc806491b73c5 |     
 powerpc64   |        skalibs-2.12.0.1        | NOK | http://autobuild.buildroot.org/results/d71e3893b3da9992fd93f8307cc8996a5761227d |     
  riscv64    |           zeek-4.1.1           | NOK | http://autobuild.buildroot.org/results/9285d34ad23e8fca5a8717ca8e898536dc04a6a4 |     


Classification of failures by reason for 2024.08.x
--------------------------------------------------

aubio-152d6819b360c2e7b379e... | 1 
               linux-pam-1.6.1 | 1 
               mariadb-10.11.6 | 1 
               procps-ng-4.0.4 | 1 
          python-grpcio-1.60.0 | 1 
                 wolfssl-5.7.2 | 1 


Detail of failures for 2024.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     | aubio-152d6819b360c2e7b379e... | NOK | http://autobuild.buildroot.org/results/a528797fd9b2e8d68af8eb38200ffdb5546f121d |     
 microblaze  |        linux-pam-1.6.1         | NOK | http://autobuild.buildroot.org/results/d85171b44da1f768bb5aab83ccf9002e2f93387f | ORPH
   sparc     |        mariadb-10.11.6         | NOK | http://autobuild.buildroot.org/results/d639db7fbe4ccb6bea385632f72c690cad9e702f | ORPH
   nios2     |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/28095e821d5fe1d6dd97fa0235d72ff0cf2c2fe6 | ORPH
 aarch64_be  |      python-grpcio-1.60.0      | NOK | http://autobuild.buildroot.org/results/0a8a4f6f0f0d328039460726b99f88c2bc37bcd8 |     
  mips64el   |         wolfssl-5.7.2          | NOK | http://autobuild.buildroot.org/results/9900fe5589aa74728f2a29bffd6235ad07cdd0bc |     



-- 
http://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
