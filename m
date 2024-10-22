Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59506D1715C
	for <buildroot@archiver.kernel.org>; Tue, 22 Oct 2024 03:17:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F15C740392;
	Tue, 22 Oct 2024 03:17:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 41gCeqJ_cNt7; Tue, 22 Oct 2024 03:17:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8C86B4034E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8C86B4034E;
	Tue, 22 Oct 2024 03:17:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3089F963
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 03:17:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E26F280CE7
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 03:17:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Bu7kEKkocpG5 for <buildroot@buildroot.org>;
 Tue, 22 Oct 2024 03:17:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52c; helo=mail-ed1-x52c.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 93D9080CE5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 93D9080CE5
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 93D9080CE5
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 03:17:31 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-5c903f5bd0eso1466724a12.3
 for <buildroot@buildroot.org>; Mon, 21 Oct 2024 20:17:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729567049; x=1730171849;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RLwzsZDAkqoPdgGmatjpkVRzG7RYpm4Dk79IUdxU7v8=;
 b=sgTbA+2s9Gq+t/rGyGTevS+113krUWoIb3XFGozpEX1fs520FdJcUaZWA+Q5EDJ/RP
 lDjDjOq7J6x4IUAXvrE5qZ/WVhXgOmpCBYH/bpgu4LQikcYPQH4BfRak0t2hhxy3kDYQ
 G15pX9a2HJAICEl9i8HB0Cggdb0EvnyZ6sleGqQEYjzhji2W6eFySuGyLxmoq5JLQQ0j
 qnPZvMO7i7xvjfPVbV7tGJUJOVPowd6PuBxVZ60co8kR8YEYrYdvCwjiDc5iq2tWKcLu
 ++sjmwpTtnEwLErwKxJw7y2BxUP0lXl5uSenB/7+1vL5bHzQQ4EOvsVS4aFx3tbY+6/t
 06CQ==
X-Gm-Message-State: AOJu0YzRFCGi7hVdOkoCwPugR9gPW27u+jfG6Z1aOyles7mmgjIRzrh3
 9amjmBrrO4F/teUlDRu1HRfAKBgFl1rK4LRBqOzy1Ff25Wp+sN85SDa3fQ==
X-Google-Smtp-Source: AGHT+IFhmYr6zytu+rNqS10TfoLwWaI+qqaLWEpzooNboMhTHayFr2/bbsOJsWT7SmSuAA+LJmFefA==
X-Received: by 2002:a17:907:86a4:b0:a9a:222f:45d1 with SMTP id
 a640c23a62f3a-a9aace39a93mr92623066b.20.1729567048914; 
 Mon, 21 Oct 2024 20:17:28 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9a91559c06sm279968866b.138.2024.10.21.20.17.28
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Oct 2024 20:17:28 -0700 (PDT)
Message-ID: <67171948.170a0220.1c2b5b.ab1e@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Tue, 22 Oct 2024 03:17:28 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729567049; x=1730171849; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=RLwzsZDAkqoPdgGmatjpkVRzG7RYpm4Dk79IUdxU7v8=;
 b=m+4eM5GpAaI9gPO4I9ZJxMbzYEdExENONvRrgDiGHQ3NOBTFe9HOU7aAhx1+hDGoY5
 HLhmwJ7nS+keVmluJfE6b7K0nesbvnu9eZ79V4dINytbJHAwhiIr1kdHHVDEzfsBjGer
 90WELkEr5ht7H9geuyw5Q9eskksD1sqPJiM5Z/70KR4lYB/4i/bB68o/iMvt1AXaqSJ9
 g14jnOR6zz2UVOGFZmxgU0L+mAjpKDRxFcbyXXSPnD89m/JE88KPqC30tZFRLlbnypj0
 CAd2d57Em+oXB526Ym1BC/W9RwgIEhjUDI2rvVKKzPmMTD3C6Th+tFhDX6S0/uVg+lQX
 X7og==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=m+4eM5Gp
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2024-10-21
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

Autobuild statistics for 2024-10-21
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  6  |  4  |  0  | 10  |
  2024.05.x  | 26  | 20  |  1  | 47  |
  2024.08.x  |  1  |  3  |  0  |  4  |
    master   | 23  | 255 |  8  | 286 |

Classification of failures by reason for master
-----------------------------------------------

               procps-ng-4.0.4 | 17
                 linux-6.10.10 | 16
              host-rust-1.80.1 | 10
                  bind-9.18.28 | 8 
         gobject-introspection | 8 
                 apache-2.4.62 | 7 
  gobject-introspection-1.76.1 | 7 
         host-libxcrypt-4.4.36 | 7 
                       unknown | 7 
                    git-2.47.0 | 6 
                 gnuplot-6.0.1 | 6 
                 coreutils-9.5 | 5 
            host-binutils-2.42 | 5 
           musl-compat-headers | 5 
                  ntp-4.2.8p18 | 5 
                  evilwm-1.4.3 | 4 
                  ffmpeg-6.1.2 | 4 
           host-librsvg-2.50.9 | 4 
    host-python-greenlet-3.1.1 | 4 
           at-spi2-core-2.50.0 | 3 
                  bcusdk-0.0.5 | 3 
                   bird-2.15.1 | 3 
             dahdi-linux-3.3.0 | 3 
              fftw-quad-3.3.10 | 3 
           host-doxygen-1.8.18 | 3 
                liblinear-2.45 | 3 
              libopenssl-3.3.2 | 3 
          obsidian-cursors-1.0 | 3 
                 pixman-0.42.2 | 3 
      python-autocommand-2.2.2 | 3 
android-tools-4.2.2+git2013... | 2 
             berkeleydb-5.3.28 | 2 
                    bsdiff-4.3 | 2 
                   foot-1.16.2 | 2 
                 fwupd-efi-1.6 | 2 
            gdk-pixbuf-2.42.12 | 2 
            gnuradio-3.10.11.0 | 2 
 host-binutils-bare-metal-2.42 | 2 
           host-checksec-2.7.1 | 2 
   host-mender-artifact-3.11.2 | 2 
                libdrm-2.4.123 | 2 
                   libnl-3.9.0 | 2 
                  libnss-3.104 | 2 
                 libv4l-1.28.1 | 2 
          linux-5.10.162-cip24 | 2 
     linux-5.10.162-cip24-rt10 | 2 
               mariadb-10.11.6 | 2 
                    mpir-3.0.0 | 2 
               pcsc-lite-2.1.0 | 2 
               pulseaudio-17.0 | 2 
       riemann-c-client-1.10.5 | 2 
                acpitool-0.5.1 | 1 
                 agentpp-4.6.1 | 1 
                apparmor-3.1.7 | 1 
                  assimp-5.3.1 | 1 
                    azmq-1.0.3 | 1 
             batman-adv-2024.2 | 1 
                  boost-1.83.0 | 1 
cegui-00b4e1fe174da53b7ed72... | 1 
          cryptodev-linux-1.13 | 1 
                cryptopp-8.9.0 | 1 
                  curlpp-0.8.1 | 1 
                   cvs-1.12.13 | 1 
                 dc3dd-7.2.641 | 1 
                   duma-2.5.21 | 1 
               ebtables-2.0.11 | 1 
                elfutils-0.189 | 1 
                    emlog-0.70 | 1 
                   eza-0.18.22 | 1 
              fetchmail-6.4.39 | 1 
                     file-5.45 | 1 
              fluent-bit-3.1.3 | 1 
                  fwupd-1.9.20 | 1 
       gdb-arc-2023.09-release | 1 
            gettext-gnu-0.22.4 | 1 
                  giblib-1.2.4 | 1 
glibc-2.40-18-g564178076272... | 1 
                gnu-efi-3.0.18 | 1 
          host-binutils-2.43.1 | 1 
                host-go-1.22.8 | 1 
host-heimdal-f4faaeaba371ff... | 1 
                  iozone-3.506 | 1 
                latencytop-0.5 | 1 
             libargtable2-2.13 | 1 
               libcap-ng-0.8.5 | 1 
               libgpgme-1.23.2 | 1 
                  libsepol-3.6 | 1 
               libsigsegv-2.14 | 1 
               linux-pam-1.6.1 | 1 
             lirc-tools-0.10.2 | 1 
                   mimic-1.1.0 | 1 
          modem-manager-1.22.0 | 1 
                   nanocom-1.0 | 1 
            netstat-nat-1.4.10 | 1 
                 openssh-9.8p1 | 1 
               postgresql-16.4 | 1 
                  quagga-1.2.4 | 1 
                  ramsmp-3.5.0 | 1 
                 rtptools-1.22 | 1 
                s6-dns-2.3.7.2 | 1 
                     shim-15.8 | 1 
                 uclibc-1.0.50 | 1 
           v4l2loopback-0.12.7 | 1 
               valgrind-3.23.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 microblaze  |         acpitool-0.5.1         | NOK | https://autobuild.buildroot.org/results/beaef6e4bb418e5d32fc775c4917a76d261a19ab |     
powerpc64le  |         agentpp-4.6.1          | NOK | https://autobuild.buildroot.org/results/2c44a944ca61e7816963108a4b5582d84b64691c |     
 powerpc64   | android-tools-4.2.2+git2013... | NOK | https://autobuild.buildroot.org/results/f46f4c10e7e60215cdbd39fb5fe1345eec922cbe |     
   s390x     | android-tools-4.2.2+git2013... | NOK | https://autobuild.buildroot.org/results/983239f9e64208f4005268ce9db16f3d70fc74d8 |     
  riscv32    |         apache-2.4.62          | NOK | https://autobuild.buildroot.org/results/0f10dfdbd6e1be4b76d4bb3710b79f484a933dda |     
    or1k     |         apache-2.4.62          | NOK | https://autobuild.buildroot.org/results/14a4bcb39b2410bf303aa556c2cfe554bc1e75a6 |     
  sparc64    |         apache-2.4.62          | NOK | https://autobuild.buildroot.org/results/4ccbc14f28a82bfef2caa3305714851586946fae |     
   mipsel    |         apache-2.4.62          | NOK | https://autobuild.buildroot.org/results/8215dae171c2699cc0263e5399c79fe2bf1fc599 |     
  sparc64    |         apache-2.4.62          | NOK | https://autobuild.buildroot.org/results/f5c94b814014f468ecc847754b4ec9105af9e6a2 |     
    i686     |         apache-2.4.62          | NOK | https://autobuild.buildroot.org/results/2a7c97de7b3946ba5eeef002daaefdc18c69f670 |     
  sparc64    |         apache-2.4.62          | NOK | https://autobuild.buildroot.org/results/2e3ab0b574cfef7d6e6ac86ca1e6090df5473526 |     
   arceb     |         apparmor-3.1.7         | NOK | https://autobuild.buildroot.org/results/749189ffaeb3bbcf0127e445f3207f9d085da733 |     
    or1k     |          assimp-5.3.1          | NOK | https://autobuild.buildroot.org/results/084f583a908091ba9ac2020bdd2ba0f04db03c71 | ORPH
microblazeel |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/8e19bfe7ab4a9d8a99896a89629bb93e3caa2895 |     
   x86_64    |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/2d3206b4876bddaeff854fe8968cb4537340fe57 |     
    mips     |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/f1c262cb8f94a2c233d6101112be49228e40301e |     
   s390x     |           azmq-1.0.3           | NOK | https://autobuild.buildroot.org/results/3e391fb437c9dbe48aab513b67bd5b7d6875f599 |     
  mips64el   |       batman-adv-2024.2        | NOK | https://autobuild.buildroot.org/results/ccd047e981a410b6abec8576edb75fc8ba423511 |     
   mipsel    |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/fddd480195271adb12170d8d3d21e94883a131cf |     
    m68k     |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/7cbdcf90cd654f3941965db80f5232c17f74417d |     
   x86_64    |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/1b506b0dab00888351dbe2ee12aa67bfe8e88e7a |     
    sh4a     |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/96e6a1608ca4b2a578ab7714d204b62a26e78d8f | ORPH
  riscv64    |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/35a231fa6cbd7963d927e76b83f840c3ac9eea8f | ORPH
 aarch64_be  |          bind-9.18.28          | NOK | https://autobuild.buildroot.org/results/52a4bbd159178124bdbd5c98b48c2c318c66d725 | ORPH
 microblaze  |          bind-9.18.28          | NOK | https://autobuild.buildroot.org/results/d05e17b07a1199b3e6824a6ed4eee9972d5a66b4 | ORPH
powerpc64le  |          bind-9.18.28          | NOK | https://autobuild.buildroot.org/results/e32c32c10f034051b3649a4dd49f70ec141d7684 | ORPH
   x86_64    |          bind-9.18.28          | NOK | https://autobuild.buildroot.org/results/4d72d4458ca00da8f6cd86a72d31ad6865573e0d | ORPH
 microblaze  |          bind-9.18.28          | NOK | https://autobuild.buildroot.org/results/a8e78580509adefaaa0351d9b9108627b7acc24e | ORPH
 aarch64_be  |          bind-9.18.28          | NOK | https://autobuild.buildroot.org/results/5dae8e6a604f85877c4de5a333f3c7ea97056893 | ORPH
   mipsel    |          bind-9.18.28          | NOK | https://autobuild.buildroot.org/results/c46e17cf2562ab3f7a1a9d66d68f5d0c5bff9a2f | ORPH
  riscv64    |          bind-9.18.28          | NOK | https://autobuild.buildroot.org/results/429851d87496cf8a7afa4910efe2f1c1cefc1196 | ORPH
   x86_64    |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/c1e981a45fa9e38e34443f23c2f2724310e0ffe6 |     
powerpc64le  |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/9704b3bb0bda29f16f86cdcd0853dd907a4965a8 |     
   s390x     |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/6b5e226fdd8fddf06a3a8d504d19bf821c5bc62a |     
 aarch64_be  |          boost-1.83.0          | NOK | https://autobuild.buildroot.org/results/3d0daecf7044e137342b6383efa82e834a25a724 |     
   xtensa    |           bsdiff-4.3           | NOK | https://autobuild.buildroot.org/results/69e429538c67a623c9b8f5e0ae8b9af0c5c4645d | ORPH
  mips64el   |           bsdiff-4.3           | NOK | https://autobuild.buildroot.org/results/86daa57f92f617306feb2e07cd36d679ea5086db | ORPH
  mips64el   | cegui-00b4e1fe174da53b7ed72... | NOK | https://autobuild.buildroot.org/results/43c41ba7827819c1c21c7b24bd132c198a409961 |     
   armeb     |         coreutils-9.5          | NOK | https://autobuild.buildroot.org/results/02b61bfd70f0618810a2d4f671bb77febcb43064 | ORPH
  mips64el   |         coreutils-9.5          | NOK | https://autobuild.buildroot.org/results/d1d49d0c235fecc9581facd031c4b6d9dac64432 | ORPH
    or1k     |         coreutils-9.5          | NOK | https://autobuild.buildroot.org/results/0a1b5ba32c290909a12a1a062151a83dfa95b631 | ORPH
    i486     |         coreutils-9.5          | NOK | https://autobuild.buildroot.org/results/275e34c372454dbe132e411b3746c54fa93c3c78 | ORPH
    i686     |         coreutils-9.5          | NOK | https://autobuild.buildroot.org/results/950cc935649990962793e8628535977a55be629a | ORPH
  mips64el   |      cryptodev-linux-1.13      | NOK | https://autobuild.buildroot.org/results/1fb4bbaa85cfcb54076bde0f6860acf8ff383f5a | ORPH
   s390x     |         cryptopp-8.9.0         | NOK | https://autobuild.buildroot.org/results/f77dfd629a87f6fb8de77ff9beded1642c632d9d |     
   x86_64    |          curlpp-0.8.1          | NOK | https://autobuild.buildroot.org/results/800b92e0441922b06ea9c75b5a594b53d48920c8 |     
  sparc64    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/acba9dec79aa7bd1eb40c32717b3e5f7237296a3 | ORPH
   s390x     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/3eeaa73ab5079a93ba1ab87cb3706415f4247256 |     
   s390x     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/1dfcbf659c3a70425e869dee93788b2b68490750 |     
   s390x     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/99dafab2b843d130312551046fce8439f4675889 |     
    or1k     |         dc3dd-7.2.641          | NOK | https://autobuild.buildroot.org/results/2912714d22db41de072357a86c55bf540dad6174 | ORPH
  sparc64    |          duma-2.5.21           | NOK | https://autobuild.buildroot.org/results/f1c9a0f2ee7f0ac6561230dcca051635fdd8bcaa | ORPH
  sparc64    |        ebtables-2.0.11         | NOK | https://autobuild.buildroot.org/results/968e6669b927918de88456e76b3d3921752f81ef |     
powerpc64le  |         elfutils-0.189         | NOK | https://autobuild.buildroot.org/results/7bb752f3436a73ad658dc871ac7252b929d873c8 | ORPH
   mipsel    |           emlog-0.70           | NOK | https://autobuild.buildroot.org/results/94f33262a95badc77fb5ec19f1764a3fed344be4 |     
powerpc64le  |          evilwm-1.4.3          | NOK | https://autobuild.buildroot.org/results/94a555fb8d50fe08be56b89ba379848327f9bc23 |     
   mips64    |          evilwm-1.4.3          | NOK | https://autobuild.buildroot.org/results/db054c15ffcd76e2c0784b09e39660ce0bce00db |     
    or1k     |          evilwm-1.4.3          | NOK | https://autobuild.buildroot.org/results/ec8eb8d4f1aebcf7f74f5609d801dc6015313456 |     
powerpc64le  |          evilwm-1.4.3          | NOK | https://autobuild.buildroot.org/results/ad58a74cf198fa9011fe3b43719f20246ce4617c |     
  aarch64    |          eza-0.18.22           | NOK | https://autobuild.buildroot.org/results/0e91d33bd28f6c69c761771c288bcb5ffe1419a2 |     
   s390x     |        fetchmail-6.4.39        | NOK | https://autobuild.buildroot.org/results/3a64e1d041016c04c09defde35f58c4f038cdc9c |     
  riscv32    |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/0c98011074e5618d72fac2b103c3829ee55c4855 |     
  riscv32    |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/d1faad71107b5cc989b8bb91a6bce93aceb4968f |     
   arceb     |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/e776c30bdf49a9c44d2633c47aa30c0192804330 |     
  riscv32    |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/aa6d1968fd03993b31b174f38480bf2173e03df2 |     
powerpc64le  |        fftw-quad-3.3.10        | NOK | https://autobuild.buildroot.org/results/b122e885b02c692e2cbe01b194a14aadee93be53 | ORPH
powerpc64le  |        fftw-quad-3.3.10        | NOK | https://autobuild.buildroot.org/results/7657c455360066c289fb8a15557c7e2d139960af | ORPH
powerpc64le  |        fftw-quad-3.3.10        | NOK | https://autobuild.buildroot.org/results/9a69b4d9ce6b782b8d0f66bc51ec45875db7abc8 | ORPH
   mipsel    |           file-5.45            | NOK | https://autobuild.buildroot.org/results/c5d8873184a276a7ed970f627c620420fac6d7fb | ORPH
   mipsel    |        fluent-bit-3.1.3        | NOK | https://autobuild.buildroot.org/results/2795defda7d2047e7117ccb218094a723fd8ab90 |     
   nios2     |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/88ff84f98fa0235192d870ab5bf3443587657141 |     
   s390x     |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/922d1461b995a15786d81f742be143c2102fc97d |     
microblazeel |          fwupd-1.9.20          | NOK | https://autobuild.buildroot.org/results/7870a452f90c6e887b1136c5bdda10b9055d877d |     
    i686     |         fwupd-efi-1.6          | NOK | https://autobuild.buildroot.org/results/38eb057490b489a9e5a89033b408d76e891fedf7 |     
    i686     |         fwupd-efi-1.6          | NOK | https://autobuild.buildroot.org/results/f3b2fa4aff4da5d8115e7bd567e01752f61a59a9 |     
   arceb     |    gdb-arc-2023.09-release     | NOK | https://autobuild.buildroot.org/results/ae2719851a31c926001802bf46429aa4132a82ae | ORPH
   xtensa    |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/8bf36b3e7a5b0f8c733597d35182e25de6673c9d | ORPH
powerpc64le  |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/395b62ad47b43eb94f9c9eec04fb018a0957eb32 | ORPH
   sparc     |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/20d4293448acb7a3111f0b09c2da49ae1a3708e8 | ORPH
   nios2     |          giblib-1.2.4          | NOK | https://autobuild.buildroot.org/results/8f60efa37843109f465e53ec6e1ee673034db4ed |     
    arc      |           git-2.47.0           | NOK | https://autobuild.buildroot.org/results/1b47b4ec70b726396a07175478cf484af60c7a40 |     
 aarch64_be  |           git-2.47.0           | NOK | https://autobuild.buildroot.org/results/0af15cf5267a53bfeab2beb3f4dcfd90dfe2af05 |     
   xtensa    |           git-2.47.0           | NOK | https://autobuild.buildroot.org/results/91dbb606de31623dd815d6dbf6571f4e562994f3 |     
   xtensa    |           git-2.47.0           | NOK | https://autobuild.buildroot.org/results/47cbaffd9717b37b206114665e28183dab224135 |     
   mips64    |           git-2.47.0           | NOK | https://autobuild.buildroot.org/results/7721e1378327f5528a0e3c79be50bbb2199c4d21 |     
   xtensa    |           git-2.47.0           | NOK | https://autobuild.buildroot.org/results/0843810430f1bbfe884b0e520ba9e8599d70b1ea |     
    arc      | glibc-2.40-18-g564178076272... | NOK | https://autobuild.buildroot.org/results/be7fb46a4911cf31b1eadb470fe3385905ea9c89 |     
   x86_64    |         gnu-efi-3.0.18         | NOK | https://autobuild.buildroot.org/results/ba154fd6ade6bd33329a9b7f85e93aae63db591c |     
    or1k     |         gnuplot-6.0.1          | NOK | https://autobuild.buildroot.org/results/3282d4d59ad8d48b2d82dce5f442bc3ee8561bbe |     
 microblaze  |         gnuplot-6.0.1          | NOK | https://autobuild.buildroot.org/results/7089fd4eb690daf8111edfb04ad41edb87b60c44 |     
    or1k     |         gnuplot-6.0.1          | NOK | https://autobuild.buildroot.org/results/f4f1143367d6145d5dabd5f0b748873434863b8b |     
    or1k     |         gnuplot-6.0.1          | NOK | https://autobuild.buildroot.org/results/35f634681d90a4af28bdfada635f688437c7dad4 |     
    or1k     |         gnuplot-6.0.1          | NOK | https://autobuild.buildroot.org/results/8e7486e7cd1827b129cdaeb5b7f404a7310735a8 |     
    mips     |         gnuplot-6.0.1          | NOK | https://autobuild.buildroot.org/results/92949166a49613c81b8229192b60a5f2d3f793cb |     
   s390x     |       gnuradio-3.10.11.0       | NOK | https://autobuild.buildroot.org/results/8b701bbd1b66470fc8fb6ca4b6a501296a245053 |     
 aarch64_be  |       gnuradio-3.10.11.0       | NOK | https://autobuild.buildroot.org/results/a5ae607349810f9f476cb2b1639b521dea9c9a0a |     
 microblaze  |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/3af2feb45a5cf26c76f0d2e23b28af3f5d3e7ef0 |     
 microblaze  |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/68a1a5033129da50358d9a44fa3bd99d77865ab1 |     
microblazeel |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/a6e51f877784c1c4bc91edeeba6af14e92d20953 |     
microblazeel |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/a26cd36a57aa50a50e251642e7dab72530a3e868 |     
 microblaze  |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/eaab4cf06d43de2f63d046f8f11ea940507087a0 |     
 microblaze  |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/18f7b7871d0a83d3b9a5a966d40be343467b7fc5 |     
microblazeel |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/8b54d6b06bfd5228b9f2d264e0f17a5bdceb026a |     
 microblaze  |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/48070284cbbfd669b492e84a58f07bcade58b4c9 |     
    mips     |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/6aca80e4a9c9cdd1fed75f647913ebf6277c67ab | ORPH
    i686     |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/46171b4239fc844e6c5313a15046ffdbb63f46e2 | ORPH
    mips     |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/33132fbfb106e27edbd72ff7b52612b51590e6c6 | ORPH
   x86_64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/0995bbdd224884a5b08af0865aca1b7494156776 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/39c729395dcde392ed2f873880e8e36dcb5336a9 | ORPH
    mips     |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/02228dfb6ae9da5f3c694894989d63b66b5e3f84 | ORPH
    i686     |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/e6e04203e419736ca33505e03ea96908b7480104 | ORPH
   mips64    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/bf4546782545fe29f2f41ebcfe3e0a50256c03b5 |     
   mips64    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/b2cac2f416d4ec4aeccfacdb70cd8a31ad59312b |     
    i686     |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/de8a0cd8f00dbb0176c55f3093b553c0d81b6314 |     
powerpc64le  |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/36ec22e8ef2887971f450d1b86d39ebbfd3d4de6 |     
microblazeel |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/515be7d5c403e14adab27c9cc4312f45ca69cf79 |     
   s390x     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/637d51ba43db625f955799ba11aa211dcd3391e6 |     
    i686     | host-binutils-bare-metal-2.42  | NOK | https://autobuild.buildroot.org/results/dbc968e019eea40e53cc86c8bd43f232ab7c6097 |     
   arceb     | host-binutils-bare-metal-2.42  | NOK | https://autobuild.buildroot.org/results/7b36abd2a0724bd0c2b6f4145c78e2f4b28ebfb7 |     
   xtensa    |      host-checksec-2.7.1       | NOK | https://autobuild.buildroot.org/results/b00d7481bda543001d0ffa97ec9df7afdeaed888 | ORPH
    arc      |      host-checksec-2.7.1       | NOK | https://autobuild.buildroot.org/results/770d8dc0b8bace36cb06c1abe78c2d78e47a7479 | ORPH
 powerpc64   |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/224cdb2104849f4895219fae4372caa2cdfe66e3 | ORPH
powerpc64le  |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/7e1c530e18f8fbe7e68be08c8e590d923f0a4f9f | ORPH
  mips64el   |      host-doxygen-1.8.18       | NOK | https://autobuild.buildroot.org/results/5695abd963d4b9e79d72ca25f6779608d9192fec | ORPH
   mipsel    |         host-go-1.22.8         | NOK | https://autobuild.buildroot.org/results/4bf4185ea4d8a70ee50454713aa213db2592c656 |     
    m68k     | host-heimdal-f4faaeaba371ff... | NOK | https://autobuild.buildroot.org/results/ef0fc8a372036fa7cae0a8997ff7e021f8cf9d13 | ORPH
   nios2     |      host-librsvg-2.50.9       | NOK | https://autobuild.buildroot.org/results/fa4491ac10822746cce207bae881db2df40c3794 |     
    mips     |      host-librsvg-2.50.9       | NOK | https://autobuild.buildroot.org/results/7ae1ce3cdab02cbdba6e12c9f65b6a4db36eb795 |     
microblazeel |      host-librsvg-2.50.9       | NOK | https://autobuild.buildroot.org/results/e82a7c4c5b00c8ae9b4b6f9fa77e5a4f57d5c64f |     
  powerpc    |      host-librsvg-2.50.9       | NOK | https://autobuild.buildroot.org/results/6f58c214c91c976551155480ae33839739da0bd3 |     
  sparc64    |     host-libxcrypt-4.4.36      | NOK | https://autobuild.buildroot.org/results/6a2aa579f7336ad165c07a5d4fe3877bde0c671b |     
 powerpc64   |     host-libxcrypt-4.4.36      | NOK | https://autobuild.buildroot.org/results/91e5f92f2d99d3dd82290ef75e5a679406130262 |     
 aarch64_be  |     host-libxcrypt-4.4.36      | NOK | https://autobuild.buildroot.org/results/d5b5db51f50eda233e3c1a91f5810b50cec4e291 |     
   s390x     |     host-libxcrypt-4.4.36      | NOK | https://autobuild.buildroot.org/results/31583d392c727f6db1982180db40d84880a4b897 |     
   s390x     |     host-libxcrypt-4.4.36      | NOK | https://autobuild.buildroot.org/results/90f0368c08d0bbeb996a0ca3a864735fa478375e |     
   armeb     |     host-libxcrypt-4.4.36      | NOK | https://autobuild.buildroot.org/results/749402feb23d296963e862b0949a5b37b7f0ad75 |     
   s390x     |     host-libxcrypt-4.4.36      | NOK | https://autobuild.buildroot.org/results/213ba7ad677860274b74faa1095fb6b213578447 |     
  mips64el   |  host-mender-artifact-3.11.2   | NOK | https://autobuild.buildroot.org/results/8263204945535a81e1e2542a8912e6857c30503e |     
  riscv64    |  host-mender-artifact-3.11.2   | NOK | https://autobuild.buildroot.org/results/c810a1359a4c1baa7724889a318daeb7decb482c |     
  sparc64    |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/b17ee9271dc061ec1382f9e3fbc8d4300090dad0 |     
    mips     |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/12c858321c84b93d3367269bc10f387cd2361e6f |     
   sparc     |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/a40ee32d0930092a43d51c1d1c7b36d8e1e418c4 |     
 powerpc64   |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/7357e185fe580fecf0fe9acdba69637c6d2fdf44 |     
    i686     |        host-rust-1.80.1        | NOK | https://autobuild.buildroot.org/results/87add75011036d2ef62a9bb1d339029d6cba48a7 |     
powerpc64le  |        host-rust-1.80.1        | NOK | https://autobuild.buildroot.org/results/6980cb2247eb228ead6a25d54f8af0761f13563a |     
   s390x     |        host-rust-1.80.1        | NOK | https://autobuild.buildroot.org/results/785a7d464c8152d5f6f6357427c0a1f1b4db32b5 |     
    i686     |        host-rust-1.80.1        | NOK | https://autobuild.buildroot.org/results/b403aa03a6c64b14019946f90b985586166eacd8 |     
powerpc64le  |        host-rust-1.80.1        | NOK | https://autobuild.buildroot.org/results/46adab8115fae3fe1c41dc1d06da67fc55711864 |     
  sparc64    |        host-rust-1.80.1        | NOK | https://autobuild.buildroot.org/results/54c32ed5029a31d6a3ef880d764957648a7c233c |     
   x86_64    |        host-rust-1.80.1        | NOK | https://autobuild.buildroot.org/results/bf6ed627d2824f346ef265b3540c89ec391e5093 |     
  sparc64    |        host-rust-1.80.1        | NOK | https://autobuild.buildroot.org/results/1ee042dfbd57cac7db1363693ffc6c8c11495b1c |     
    i686     |        host-rust-1.80.1        | NOK | https://autobuild.buildroot.org/results/99c8ca4d31e920d7286075d0013365cbf1f3cecf |     
  sparc64    |        host-rust-1.80.1        | NOK | https://autobuild.buildroot.org/results/2d5cc6726325a7cbd43c81e4ebeb7159a6dd7dc4 |     
powerpc64le  |          iozone-3.506          | NOK | https://autobuild.buildroot.org/results/43e405e327a80e217fed7d84a3649f650b6f8e9c |     
    or1k     |         latencytop-0.5         | NOK | https://autobuild.buildroot.org/results/0afc4808addab02d3558bfce35ddd9abb1de47d7 | ORPH
    i686     |       libargtable2-2.13        | NOK | https://autobuild.buildroot.org/results/6e75ee39918d8d189a008502415604d393a2ebf7 | ORPH
  riscv64    |        libcap-ng-0.8.5         | NOK | https://autobuild.buildroot.org/results/1b3c6fdfa884807c20dee90894a5f0af72f1812f |     
   sparc     |         libdrm-2.4.123         | NOK | https://autobuild.buildroot.org/results/279e58f586074d59e48128b177e5315af708a216 |     
   sparc     |         libdrm-2.4.123         | NOK | https://autobuild.buildroot.org/results/21a20e93577ea2749023cad3e8e14a4431ae1c9c |     
    sh4a     |        libgpgme-1.23.2         | NOK | https://autobuild.buildroot.org/results/be8c17b2a4401f18554f42bf34b4dfaa92b78d57 | ORPH
    i686     |         liblinear-2.45         | NOK | https://autobuild.buildroot.org/results/d38114a033e058b3d32acd388e9998573098058d |     
  sparc64    |         liblinear-2.45         | NOK | https://autobuild.buildroot.org/results/a880cfe9e1a28b7dc04407bfc4f46391b5c533e5 |     
microblazeel |         liblinear-2.45         | NOK | https://autobuild.buildroot.org/results/f9b440877edd5783db7d7f449b532874bf351173 |     
powerpc64le  |          libnl-3.9.0           | NOK | https://autobuild.buildroot.org/results/3865e696fec68f872c034cb5412a38c00e74056e | ORPH
powerpc64le  |          libnl-3.9.0           | NOK | https://autobuild.buildroot.org/results/a5d74d7bf1d36758590a663171f665822582bef6 | ORPH
    m68k     |          libnss-3.104          | NOK | https://autobuild.buildroot.org/results/b4aad330a459f05419a80552d7614a6f70f614d5 |     
   armeb     |          libnss-3.104          | NOK | https://autobuild.buildroot.org/results/7bf889137f323ff9a1b1571260f38e28c27579ab |     
    arc      |        libopenssl-3.3.2        | NOK | https://autobuild.buildroot.org/results/bd16ef8e598d9ef0f5fec098e45509e4ac3132b6 | ORPH
 microblaze  |        libopenssl-3.3.2        | NOK | https://autobuild.buildroot.org/results/df60b299dd99c96947253d8a5fef66c31fb6f7dc | ORPH
 microblaze  |        libopenssl-3.3.2        | NOK | https://autobuild.buildroot.org/results/f0d50c34bc3ec2a0c2a98b4139e49d3a2193f0a0 | ORPH
   xtensa    |          libsepol-3.6          | NOK | https://autobuild.buildroot.org/results/126bd0b1ce9cc3898190f3e40c6bdbbbbdc5742e |     
   arceb     |        libsigsegv-2.14         | NOK | https://autobuild.buildroot.org/results/c94f0ed0a5386ea86b0821887e8fc50be20b0695 |     
   mipsel    |         libv4l-1.28.1          | NOK | https://autobuild.buildroot.org/results/395ec09aa5c84a24676afed91e1a1d8d4efbf15d |     
 microblaze  |         libv4l-1.28.1          | NOK | https://autobuild.buildroot.org/results/94d25a8bedc02088db7e7e68b1a65a9ef370b675 |     
    arc      |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/df3806ed3ea16e5d4baa44ee92d6c7ece728abe9 | ORPH
   mipsel    |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/e6d4fd3cf64902d845a351abdc74b969b1617f71 | ORPH
  mips64el   |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/07d3626252fb78613d2252d8cbfe9fda54eaa71c | ORPH
    mips     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/f2f2547a07e306a6ea7092afb170e72dbe2405ae | ORPH
    m68k     |         linux-6.10.10          | NOK | https://autobuild.buildroot.org/results/5edb0f67f78c185b287b562f7c01508df9675605 | ORPH
    mips     |         linux-6.10.10          | NOK | https://autobuild.buildroot.org/results/1becf540d8e59ef723c3b2fb7928121b8ffbc802 | ORPH
powerpc64le  |         linux-6.10.10          | NOK | https://autobuild.buildroot.org/results/688951e0c5e8cb470ce4bad40a055856ffbcac82 | ORPH
  sparc64    |         linux-6.10.10          | NOK | https://autobuild.buildroot.org/results/6e2a7d54df115db7e073ce5d3f335849a45d1118 | ORPH
    sh4a     |         linux-6.10.10          | NOK | https://autobuild.buildroot.org/results/ddb13e52b658235d9c666fb6166ed232168cc8e2 | ORPH
    arc      |         linux-6.10.10          | NOK | https://autobuild.buildroot.org/results/c2e9dc97e75147c03071651d4102d487f6473ed3 | ORPH
   mips64    |         linux-6.10.10          | NOK | https://autobuild.buildroot.org/results/862c25db45ded3060ccd4562b4ea36418dd7cbee | ORPH
  powerpc    |         linux-6.10.10          | NOK | https://autobuild.buildroot.org/results/9510c487f467abf5c1e7b192567988b055c85423 | ORPH
   armeb     |         linux-6.10.10          | NOK | https://autobuild.buildroot.org/results/59ee63ca79f16106fbd57832a5bf1ddad0112547 | ORPH
   x86_64    |         linux-6.10.10          | NOK | https://autobuild.buildroot.org/results/4f3607474ce7a22d7998ef58ef56d1612d2bb405 | ORPH
   x86_64    |         linux-6.10.10          | NOK | https://autobuild.buildroot.org/results/c139ce1f86fe2125c5ea1f78274085cf1616e110 | ORPH
    arc      |         linux-6.10.10          | NOK | https://autobuild.buildroot.org/results/f66c6270dc4120abd38ffb074867930eba770650 | ORPH
 powerpc64   |         linux-6.10.10          | NOK | https://autobuild.buildroot.org/results/7963bced8e3598a48cdc5c46fbdb8bacd4a63876 | ORPH
  mips64el   |         linux-6.10.10          | NOK | https://autobuild.buildroot.org/results/b5010b6b7fa3a4395b4d0aa7f8776e1252c791e6 | ORPH
 powerpc64   |         linux-6.10.10          | NOK | https://autobuild.buildroot.org/results/ebaad9ea2de8f52498615ebd978485f090d560c5 | ORPH
   mipsel    |         linux-6.10.10          | NOK | https://autobuild.buildroot.org/results/8cdc0c9ed2e617e09dab447265a04c7a410fdc45 | ORPH
   sparc     |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/c27833f9e309e2adf396a1cf4e80c6b5457b9b06 | ORPH
 powerpc64   |       lirc-tools-0.10.2        | NOK | https://autobuild.buildroot.org/results/3e4dfb2abeb832c57e07868b746741c4383e4b9d | ORPH
   sh4aeb    |        mariadb-10.11.6         | NOK | https://autobuild.buildroot.org/results/3cabb839413058d82dfd9297dad151c7e68852fe | ORPH
powerpc64le  |        mariadb-10.11.6         | NOK | https://autobuild.buildroot.org/results/ad45191520210820ff69aa385e3b8e64f4b55c76 | ORPH
   armeb     |          mimic-1.1.0           | NOK | https://autobuild.buildroot.org/results/0651ca9333a74d4b7a347e1e2c344f339fe015ef |     
 aarch64_be  |      modem-manager-1.22.0      | NOK | https://autobuild.buildroot.org/results/725800a1d65ee6223c2a0601448630f41b9628ff |     
   armeb     |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/332d620331c24dc921beee7884b535e402914e86 |     
 powerpc64   |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/2fb1cd168dfbd0a76186cddd9e32c20a2a1f96fd |     
  riscv64    |      musl-compat-headers       | NOK | https://autobuild.buildroot.org/results/e327924dd1ee88bf2984d419a1b27158333ea424 |     
   s390x     |      musl-compat-headers       | NOK | https://autobuild.buildroot.org/results/927de3a7487b42d4295e5e4e03153cba0177f29c |     
   mips64    |      musl-compat-headers       | NOK | https://autobuild.buildroot.org/results/200926fb03e64e36e7cabed5fade402f2dcb8be5 |     
 microblaze  |      musl-compat-headers       | NOK | https://autobuild.buildroot.org/results/31ab25e7b4893bc8506af7d01f1df590076037f9 |     
    i686     |      musl-compat-headers       | NOK | https://autobuild.buildroot.org/results/eeb12abcac1da24ca1f4a0482a746f20b39eef22 |     
   nios2     |          nanocom-1.0           | NOK | https://autobuild.buildroot.org/results/ef3d5702c25092ebfecede7aa3894fb20284feb3 |     
  powerpc    |       netstat-nat-1.4.10       | NOK | https://autobuild.buildroot.org/results/a77e3f40bcf2088022fc53800dba4748abf9e466 | ORPH
    m68k     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/ec681e2f7129ebb282564bfb25fa018244c4158f |     
    arm      |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/787b70595a58e020fbd1014120df0e6646373ad7 |     
  aarch64    |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/352add147d06e1feb5c175841f6c9d45d729de58 |     
   sparc     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/62e66da024c61b95f75cd89811390c39d431d402 |     
   sh4eb     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/b08da4eea78469c8ac8e3b55affd36905a43fe98 |     
   s390x     |      obsidian-cursors-1.0      | NOK | https://autobuild.buildroot.org/results/9a1020cf766c78694ad37fdc2f616e9c928bbef4 | ORPH
    arc      |      obsidian-cursors-1.0      | NOK | https://autobuild.buildroot.org/results/7440b83795ac7155d10adfb400304c0eb339f5d9 | ORPH
 powerpc64   |      obsidian-cursors-1.0      | NOK | https://autobuild.buildroot.org/results/8a1180a0dde963e56aaaed25727246b0225b4ff3 | ORPH
powerpc64le  |         openssh-9.8p1          | NOK | https://autobuild.buildroot.org/results/7d4a06bcf14f659d48100b166b63dfeec2866f09 | ORPH
microblazeel |        pcsc-lite-2.1.0         | NOK | https://autobuild.buildroot.org/results/cf08b439e0ebfa9621d0429869092b232727dbba | ORPH
microblazeel |        pcsc-lite-2.1.0         | NOK | https://autobuild.buildroot.org/results/b408a3d7d38cf6c4707c15548ade049193f2edcf | ORPH
    or1k     |         pixman-0.42.2          | NOK | https://autobuild.buildroot.org/results/24d1bb80fc1906c061fb4777bf722bbbb1065b21 | ORPH
  sparc64    |         pixman-0.42.2          | NOK | https://autobuild.buildroot.org/results/428d962c1928e000bd433e4bfdc623b1872b5e6b | ORPH
powerpc64le  |         pixman-0.42.2          | NOK | https://autobuild.buildroot.org/results/4c61967fd3f0637ba9d466f9905d2bcd9c3b81c1 | ORPH
microblazeel |        postgresql-16.4         | NOK | https://autobuild.buildroot.org/results/b3dbe229bff35154014d8afef9274be371d5d9cd |     
   mipsel    |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/91bd9938d4e32412a2b7ae6a5b749bafa2b830b3 | ORPH
  aarch64    |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/ed2c4c261d6e3f359ba88b4ecee879bec8fc6b1f | ORPH
  aarch64    |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/792c818138e2335ad7da6db019fed88712e5acbe | ORPH
 powerpc64   |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/ee9fce23b1002c257ab834a6e24d1f9cfe572a40 | ORPH
   sparc     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/f29b31683caea1b067d263843afa6419a04eb72d | ORPH
    i686     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/94cc53d243d065aec26e98e9c3c549cf2d56dabb | ORPH
   mips64    |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/2aa75589a17f50614bc7ac7b0b6e6e11eccfe246 | ORPH
powerpc64le  |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/1490db255f786467424ab20d60f0f9c3c7261192 | ORPH
   arceb     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/07f4d154c51c1b799ffd548007c5cd77c8f04b4d | ORPH
   nios2     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/b383c5699bbda9cda9065fedb598216ab502e633 | ORPH
  sparc64    |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/3626a4d3bbc03db03ca7781ce670267c1bb3e89b | ORPH
 aarch64_be  |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/3c0515f0cd74d683ee4e82f2364f2f6aab6625a6 | ORPH
   mipsel    |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/71dfb97aae72ed3af7b56a18d31edd7325bf9aa3 | ORPH
 aarch64_be  |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/600c3dd0a563d2276eb990aa66362432bf5ce3de | ORPH
  riscv64    |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/b7028902f7c9c0fee7cb8dbcf7905921d7840c4c | ORPH
  sparc64    |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/1651c1aee809f1d2df35101aebae38bdaf459f00 | ORPH
   mipsel    |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/fd4bf07e49ae5b0b1e315c0883f4637bfe48c017 | ORPH
    m68k     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/597d013cf01af51404fb9fb194a7668dff5e9ac6 | ORPH
   sparc     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/33542786f5e772bd4d646456a7b8005eab01bebd | ORPH
   armeb     |    python-autocommand-2.2.2    | NOK | https://autobuild.buildroot.org/results/ae760bf96704b6b6ff8c85d98f91ab6b1114b140 |     
   s390x     |    python-autocommand-2.2.2    | NOK | https://autobuild.buildroot.org/results/2492653ffdbf572d2b86a51ed316640eadc5a7d6 |     
   mips64    |    python-autocommand-2.2.2    | NOK | https://autobuild.buildroot.org/results/f0577ec63c0d39d3a4a47543d3242b8caaf3780d |     
   xtensa    |          quagga-1.2.4          | NOK | https://autobuild.buildroot.org/results/0cb4c5d6ac83370727f7e6664e2bd992bb1515d5 | ORPH
    mips     |          ramsmp-3.5.0          | NOK | https://autobuild.buildroot.org/results/962b9f79073101ecb32585257b6cd76f5e9e9874 |     
   nios2     |    riemann-c-client-1.10.5     | NOK | https://autobuild.buildroot.org/results/0715664d538d1a59107f64affbb72d9671ab30df | ORPH
  mips64el   |    riemann-c-client-1.10.5     | NOK | https://autobuild.buildroot.org/results/099c8f0ee7002dea36f2f215ef8cc2a7889393d9 | ORPH
 powerpc64   |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/3b44b0ccd9009c7cf3242272389d4bde02cec140 | ORPH
    mips     |         s6-dns-2.3.7.2         | NOK | https://autobuild.buildroot.org/results/3a6bd24072cdfadbd0411961a6612778cf694aef |     
    arm      |           shim-15.8            | NOK | https://autobuild.buildroot.org/results/eb5abb8cd62ef32969edc1d2b2b9719bf1853f7a |     
    or1k     |         uclibc-1.0.50          | NOK | https://autobuild.buildroot.org/results/19a9554f341a896cdd803041529370d46414337d |     
    m68k     |            unknown             | NOK | https://autobuild.buildroot.org/results/467914ddf3e9b42b41d2331444ca7c19a9386b7c |     
   xtensa    |            unknown             | NOK | https://autobuild.buildroot.org/results/a2729043ef8e5c7f49a8f9740cdc8e0b3c53f3a6 |     
   arceb     |            unknown             | NOK | https://autobuild.buildroot.org/results/45bc5ddfb0a950357e04a8afab571d6dea29c478 |     
   s390x     |            unknown             | NOK | https://autobuild.buildroot.org/results/064c236d331eaa185e9c3ce37a54e9cd1be7271a |     
   arceb     |            unknown             | NOK | https://autobuild.buildroot.org/results/a5b9a03f462543f90082da200f2741ffbf8c7461 |     
   armeb     |            unknown             | NOK | https://autobuild.buildroot.org/results/8992f7792c461b35f8cd6cb6d8ccd6844434c866 |     
powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/f36dd601e12314662f58848549316f28addb2306 |     
   sh4eb     |      v4l2loopback-0.12.7       | NOK | https://autobuild.buildroot.org/results/2f1a6c55ffd5e49a447ed4467cdeed19515d3f3a |     
  mips64el   |        valgrind-3.23.0         | NOK | https://autobuild.buildroot.org/results/4f662a530d8eafbbd86eb492b3a52e51507c9279 | ORPH


Classification of failures by reason for 2024.02.x
--------------------------------------------------

            host-cdrkit-1.1.11 | 1 
                host-go-1.22.7 | 1 
                  linux-6.6.51 | 1 
               procps-ng-4.0.4 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 powerpc64   |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/74f8a9c1526b7b5a65a32be2a75699d549cde75e |     
  mips64el   |         host-go-1.22.7         | NOK | https://autobuild.buildroot.org/results/9e33c4f57f81393473b8aa376b00e53325389c7a |     
   x86_64    |          linux-6.6.51          | NOK | https://autobuild.buildroot.org/results/7bd27cfa8715ffdc57f962719314bc5ea9a8f221 | ORPH
   mips64    |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/d86938ee2ba06bc6750664541d12aaa16ef87f5f | ORPH


Classification of failures by reason for 2024.05.x
--------------------------------------------------

                  ffmpeg-6.1.2 | 2 
host-heimdal-f4faaeaba371ff... | 2 
                  libffi-3.4.6 | 2 
               procps-ng-4.0.4 | 2 
android-tools-4.2.2+git2013... | 1 
                   cvs-1.12.13 | 1 
            gdk-pixbuf-2.42.10 | 1 
glibc-2.39-74-g198632a05f6c... | 1 
         gobject-introspection | 1 
  gobject-introspection-1.76.1 | 1 
          libcamera-apps-1.2.1 | 1 
                 libgee-0.20.6 | 1 
                  linux-6.8.12 | 1 
                lmbench-3.0-a9 | 1 
            nodejs-src-20.15.1 | 1 
                tinifier-3.4.0 | 1 
                 uclibc-1.0.48 | 1 


Detail of failures for 2024.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    | android-tools-4.2.2+git2013... | NOK | https://autobuild.buildroot.org/results/0fcd9721468569e9cd78d4d518c37d296972f60f |     
   nios2     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/af08b33dee8ad07644c3b0d84c96c9b0fb5dac5a | ORPH
    arc      |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/901a6d8b6278aa051235a3a641d00eb50c537ce0 |     
microblazeel |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/954725c27442941b193c0662bbda0c2a89728a3e |     
    i686     |       gdk-pixbuf-2.42.10       | NOK | https://autobuild.buildroot.org/results/fbdcd8d49f1dd854c670f89c217d67be6a14afd2 | ORPH
powerpc64le  | glibc-2.39-74-g198632a05f6c... | NOK | https://autobuild.buildroot.org/results/2c914731096d9a6a077badc099d3717b1dda8378 |     
 microblaze  |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/c595436a7181ee7163c4b468deea55b77f2554e6 |     
    m68k     |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/429b967fd9aacab618b9c5977a15ccc78739a163 | ORPH
  aarch64    | host-heimdal-f4faaeaba371ff... | NOK | https://autobuild.buildroot.org/results/7cb496a2abccd4ec5fd8c4996969b864e1b6a48c | ORPH
    m68k     | host-heimdal-f4faaeaba371ff... | NOK | https://autobuild.buildroot.org/results/776b99b3277069bd5186fe71eca8c1ef7b5d5b5b | ORPH
 microblaze  |      libcamera-apps-1.2.1      | NOK | https://autobuild.buildroot.org/results/7e394d7d30cce33fbce5c18a77dcbadcf65c4cc9 |     
    arc      |          libffi-3.4.6          | NOK | https://autobuild.buildroot.org/results/db572d460e608e9cf6b4c03d044fb70a44b5faf8 |     
    arc      |          libffi-3.4.6          | NOK | https://autobuild.buildroot.org/results/5a4becac5d38ad6a0e514b28cb8bb911595ba758 |     
  powerpc    |         libgee-0.20.6          | NOK | https://autobuild.buildroot.org/results/51c26b5f9997ca9ba2bd0cbfb5705a3e337c3c9f |     
powerpc64le  |          linux-6.8.12          | NOK | https://autobuild.buildroot.org/results/28c3cc69b882c541a9740ea5a53aca45fbf94e40 | ORPH
    mips     |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/21c8177b89ce2699743312039bb3652d05573647 | ORPH
   x86_64    |       nodejs-src-20.15.1       | NOK | https://autobuild.buildroot.org/results/95c4036d431c154d66c1f3ff2a9abe6a14ab4fc7 |     
    arm      |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/5f319eb6c0aa98b3910dd7bc9824e49c671f4547 | ORPH
powerpc64le  |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/944c0ceeb2f076352ff1672a67f151e72e50f429 | ORPH
  mips64el   |         tinifier-3.4.0         | NOK | https://autobuild.buildroot.org/results/824318aa20b0b93fc75f5c802f12e5d97560880a |     
    or1k     |         uclibc-1.0.48          | NOK | https://autobuild.buildroot.org/results/d1419316944854a91b59e312ecf23203eddb233d |     


Classification of failures by reason for 2024.08.x
--------------------------------------------------

  gobject-introspection-1.76.1 | 1 
                 libgee-0.20.6 | 1 
           python-daemon-3.0.1 | 1 


Detail of failures for 2024.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/a160867e28add8b6a1f8fd74cd043b532ee69483 | ORPH
 aarch64_be  |         libgee-0.20.6          | NOK | https://autobuild.buildroot.org/results/3353e338dca4384f2dcbd33e61a1b40e95843639 |     
 microblaze  |      python-daemon-3.0.1       | NOK | https://autobuild.buildroot.org/results/d166aefc9f39eeb13895757579bd92dfa1b6a720 |     


Gitlab CI results for 2024-10-21
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
         TestATFAllwinner | https://gitlab.com/buildroot.org/buildroot/-/jobs/8135639823  | ORPH 
  TestAarch64Pages64kMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/8135640345  | ORPH 
       TestCpioDracutMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/8135639869  | ORPH 
...pioDracutMuslMergedUsr | https://gitlab.com/buildroot.org/buildroot/-/jobs/8135639870  | ORPH 
           TestExfatProgs | https://gitlab.com/buildroot.org/buildroot/-/jobs/8135639992  | ORPH 
...arch64MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8135640362  | ORPH 
...otlinAarch64MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8135640364  | ORPH 
...ch64beMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8135640372  | ORPH 
...linAarch64beMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8135640373  | ORPH 
...eabihfMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8135640387  | ORPH 
...rmebv7eabihfMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8135640388  | ORPH 
...v5eabiMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8135640395  | ORPH 
...linArmv5eabiMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8135640396  | ORPH 
...eabihfMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8135640401  | ORPH 
...nArmv6eabihfMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8135640402  | ORPH 
...eabihfMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8135640408  | ORPH 
...nArmv7eabihfMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8135640409  | ORPH 
...k68xxxMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8135640416  | ORPH 
...linM68k68xxxMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8135640417  | ORPH 
...lazebeMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8135640427  | ORPH 
...MicroblazebeMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8135640429  | ORPH 
...lazeelMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8135640435  | ORPH 
...MicroblazeelMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8135640437  | ORPH 
...Mips32MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8135640442  | ORPH 
...ootlinMips32MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8135640443  | ORPH 
...ps32elMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8135640448  | ORPH 
...tlinMips32elMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8135640449  | ORPH 
...32r5elMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8135640454  | ORPH 
...inMips32r5elMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8135640455  | ORPH 
...32r6elMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8135640461  | ORPH 
...inMips32r6elMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8135640462  | ORPH 
...4eln32MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8135640467  | ORPH 
...nMips64eln32MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8135640468  | ORPH 
...s64n32MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8135640473  | ORPH 
...linMips64n32MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8135640475  | ORPH 
...6eln32MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8135640481  | ORPH 
...ips64r6eln32MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8135640482  | ORPH 
...ootlinNios2GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8135640486  | ORPH 
...enriscMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8135640489  | ORPH 
...tlinOpenriscMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8135640491  | ORPH 
...c440fpMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8135640496  | ORPH 
...Powerpc440fpMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8135640497  | ORPH 
...4e6500MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8135640504  | ORPH 
...werpc64e6500MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8135640505  | ORPH 
...power8MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8135640508  | ORPH 
...pc64lepower8MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8135640509  | ORPH 
...power8MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8135640512  | ORPH 
...erpc64power8MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8135640513  | ORPH 
...e300c3MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8135640516  | ORPH 
...owerpce300c3MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8135640518  | ORPH 
...e500mcMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8135640524  | ORPH 
...owerpce500mcMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8135640526  | ORPH 
...ilp32dMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8135640533  | ORPH 
...iscv32ilp32dMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8135640535  | ORPH 
...4lp64dMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8135640542  | ORPH 
...Riscv64lp64dMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8135640544  | ORPH 
...90xz13MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8135640550  | ORPH 
...tlinS390xz13MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8135640552  | ORPH 
...nShsh4MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8135640556  | ORPH 
...BootlinShsh4MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8135640557  | ORPH 
...sh4aebMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8135640564  | ORPH 
...tlinShsh4aebMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8135640565  | ORPH 
...nX8664MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8135640574  | ORPH 
...BootlinX8664MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8135640575  | ORPH 
...corei7MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8135640581  | ORPH 
...nX8664corei7MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8135640582  | ORPH 
...8664v2MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8135640589  | ORPH 
...otlinX8664v2MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8135640590  | ORPH 
...8664v3MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8135640595  | ORPH 
...otlinX8664v3MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8135640596  | ORPH 
...8664v4MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8135640601  | ORPH 
...otlinX8664v4MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8135640602  | ORPH 
...6core2MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8135640607  | ORPH 
...tlinX86core2MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8135640609  | ORPH 
...86i686MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/8135640616  | ORPH 
...otlinX86i686MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/8135640617  | ORPH 
...ToolchainBuildrootMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/8135640347  | ORPH 
...ernalToolchainCtngMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/8135640353  | ORPH 
       TestFortifyConserv | https://gitlab.com/buildroot.org/buildroot/-/jobs/8135639839  | ORPH 
          TestFortifyNone | https://gitlab.com/buildroot.org/buildroot/-/jobs/8135639841  | ORPH 
             TestGnuradio | https://gitlab.com/buildroot.org/buildroot/-/jobs/8135640016  | ORPH 
                 TestNmap | https://gitlab.com/buildroot.org/buildroot/-/jobs/8135640148  | ORPH 
                 TestOpkg | https://gitlab.com/buildroot.org/buildroot/-/jobs/8135640162  | ORPH 
         TestProsodyLua51 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8135640190  | ORPH 
              TestPyNdiff | https://gitlab.com/buildroot.org/buildroot/-/jobs/8135640261  | ORPH 
       TestPythonPy3GnuPG | https://gitlab.com/buildroot.org/buildroot/-/jobs/8135640232  | ORPH 
 TestPythonPy3Incremental | https://gitlab.com/buildroot.org/buildroot/-/jobs/8135640239  | ORPH 
...PythonPy3MagicWormhole | https://gitlab.com/buildroot.org/buildroot/-/jobs/8135640243  | ORPH 
       TestPythonPy3SciPy | https://gitlab.com/buildroot.org/buildroot/-/jobs/8135640272  | ORPH 
    TestPythonPy3Txtorcon | https://gitlab.com/buildroot.org/buildroot/-/jobs/8135640286  | ORPH 
                TestRelro | https://gitlab.com/buildroot.org/buildroot/-/jobs/8135639842  | ORPH 
         TestRelroPartial | https://gitlab.com/buildroot.org/buildroot/-/jobs/8135639843  | ORPH 
                 TestRust | https://gitlab.com/buildroot.org/buildroot/-/jobs/8135640299  | ORPH 
              TestSspNone | https://gitlab.com/buildroot.org/buildroot/-/jobs/8135639844  | ORPH 
            TestSspStrong | https://gitlab.com/buildroot.org/buildroot/-/jobs/8135639845  | ORPH 
               TestWeston | https://gitlab.com/buildroot.org/buildroot/-/jobs/8135640328  | ORPH 
               TestZchunk | https://gitlab.com/buildroot.org/buildroot/-/jobs/8135640335  | ORPH 
              TestZfsMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/8135640339  | ORPH 



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
