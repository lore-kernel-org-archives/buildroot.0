Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FD6EC54749
	for <buildroot@archiver.kernel.org>; Wed, 28 Aug 2024 03:17:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8477940ACB;
	Wed, 28 Aug 2024 03:17:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xW605eYfyXpB; Wed, 28 Aug 2024 03:17:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E054C400FB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E054C400FB;
	Wed, 28 Aug 2024 03:17:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 28CD61BF2EC
 for <buildroot@lists.busybox.net>; Wed, 28 Aug 2024 03:17:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 23648400FB
 for <buildroot@lists.busybox.net>; Wed, 28 Aug 2024 03:17:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TCNaMscDFWnJ for <buildroot@lists.busybox.net>;
 Wed, 28 Aug 2024 03:17:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org F3429400D2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F3429400D2
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F3429400D2
 for <buildroot@buildroot.org>; Wed, 28 Aug 2024 03:17:22 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3718706cf8aso3543007f8f.3
 for <buildroot@buildroot.org>; Tue, 27 Aug 2024 20:17:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724815041; x=1725419841;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NCegMH6We0yzs9F2zyhN1kteEKdKK/3zem1GOhGNrGc=;
 b=NmuUtXshJGsLH2VnTIdEPqj8FUeEKqFw73lP9KxjaeTzotAAKwtPuLby13Eh7bvPTn
 FgVVGVAD8rkQWU0LsFPeeAodhGi2zxD+WimcAZYydghHg9bpJG9tuGaCRkhwiqA3iXI5
 q81PSxrMVfqMqalFIsBvxJzB15b9pERv8yq5sSooWSpK4CrbMFPDLtuF15Oa540nMEeu
 VyBFDDrMYy+0kRFPOAQXDy4RYgQ+A+VEvnBHFIYaGdyDn2a7Fp7nsS0Xvu+GSXMiy0zW
 ZWEkAxr4C1E/dz98Eor6h05MiIUdLod3hUCC/d1xVe91idYmaWnsH4m7TZyRyPQlWQIE
 NBWg==
X-Gm-Message-State: AOJu0YxogG1J+hIzjRw/s1UMJEY+ArGby7OLJ52SGvH3VOPTVgxgcg5f
 kPT+vBlD7hcYQOGCoi852b+u95ZasXnIa6WP4Gl8/ya9MZpDIRpc3sjcBw==
X-Google-Smtp-Source: AGHT+IE7TvkAmqpweSBHYPJs5fBjP0nios1Mm/x5sO1r7cQk9IMnTifa5KTbzwFj2v4blXE5u4hOmA==
X-Received: by 2002:a05:6000:1f0e:b0:371:890c:3157 with SMTP id
 ffacd0b85a97d-373118c868fmr8975841f8f.38.1724815040424; 
 Tue, 27 Aug 2024 20:17:20 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3730813cdcfsm14545251f8f.29.2024.08.27.20.17.20
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Aug 2024 20:17:20 -0700 (PDT)
Message-ID: <66ce96c0.5d0a0220.256d87.830f@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Wed, 28 Aug 2024 03:17:20 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724815041; x=1725419841; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=NCegMH6We0yzs9F2zyhN1kteEKdKK/3zem1GOhGNrGc=;
 b=bAtHRv6wgwu9PKY+xRunvIaufyvW4IGA+1HOmuJzoyo9vtQziZktago4gaWztPdUN8
 1U5JWQOC1EtgmrcOlnSMCWkBbE0HrFwpZnU0CocBezu1mxPoXMkM6W46gfHlA7zfo37k
 vsBPykij7TamItGyf68chsVOrh1vxS/W1aSiqRgk4S1NIIvJ7EDEumgqbJg6LfUhV9pm
 5ivrGvZkWtfcYO/roPoI86EDnKF05/YjNnVuUMLYtbANmk57PTo/vdDdq8FkEIQsHJyZ
 p5P6yMncC4bCFWBXf85XpFummbOEEnMQ0tT9b3wUKp9K5SBQv3SSki+6KTQ+FTLf5bGy
 bdbg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=bAtHRv6w
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2024-08-27
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

Autobuild statistics for 2024-08-27
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  | 12  |  6  |  0  | 18  |
  2024.05.x  | 10  | 17  |  0  | 27  |
    master   | 39  | 163 |  2  | 204 |
     next    |  8  | 18  |  0  | 26  |

Classification of failures by reason for master
-----------------------------------------------

                  babeld-1.9.2 | 10
                  linux-6.10.6 | 10
                       unknown | 10
  gobject-introspection-1.76.1 | 7 
             armadillo-9.900.2 | 6 
aubio-152d6819b360c2e7b379e... | 5 
          linux-5.10.162-cip24 | 5 
               linux-pam-1.6.1 | 5 
               procps-ng-4.0.4 | 5 
      python-autocommand-2.2.2 | 4 
           at-spi2-core-2.50.0 | 3 
          cryptodev-linux-1.13 | 3 
                  libsepol-3.6 | 3 
                  ramsmp-3.5.0 | 3 
  binutils-arc-2023.09-release | 2 
                directfb-1.7.7 | 2 
                  ffmpeg-6.1.2 | 2 
                     file-5.45 | 2 
              fluent-bit-3.1.3 | 2 
                 gnuplot-6.0.1 | 2 
         gobject-introspection | 2 
 host-softether-4.30-9700-beta | 2 
host-vboot-utils-4b12d392e5... | 2 
               ipmitool-1_8_19 | 2 
            linux-fusion-9.0.3 | 2 
                  ntp-4.2.8p18 | 2 
                 openssh-9.8p1 | 2 
             parsec-tool-0.7.0 | 2 
           python-daemon-3.0.1 | 2 
                  acpid-2.0.34 | 1 
               alsa-lib-1.2.12 | 1 
             alsa-utils-1.2.12 | 1 
android-tools-4.2.2+git2013... | 1 
                 apache-2.4.62 | 1 
                apparmor-3.1.7 | 1 
                apr-util-1.6.3 | 1 
                    bsdiff-4.3 | 1 
              cache-calibrator | 1 
                  cairo-1.18.0 | 1 
                 dc3dd-7.2.641 | 1 
                   duma-2.5.21 | 1 
                    dust-0.9.0 | 1 
            ecryptfs-utils-111 | 1 
                      ell-0.65 | 1 
                enscript-1.6.6 | 1 
                espflash-3.1.0 | 1 
                  fbdump-0.4.2 | 1 
                   foot-1.16.2 | 1 
                gerbera-1.12.1 | 1 
            gettext-gnu-0.22.4 | 1 
glibc-2.39-74-g198632a05f6c... | 1 
        gmrender-resurrect-0.1 | 1 
             host-cairo-1.18.0 | 1 
            host-ccache-4.10.1 | 1 
           host-librsvg-2.50.9 | 1 
         host-libxcrypt-4.4.36 | 1 
host-riscv-isa-sim-00dfa28c... | 1 
                 iperf3-3.17.1 | 1 
                  jack2-1.9.22 | 1 
jailhouse-e57d1eff6d55aeed5... | 1 
             libargtable2-2.13 | 1 
libdbi-drivers-0bfae6c43134... | 1 
                libdrm-2.4.122 | 1 
              libopenssl-3.3.1 | 1 
     linux-5.10.162-cip24-rt10 | 1 
                   linux-tools | 1 
             lirc-tools-0.10.2 | 1 
               mariadb-10.11.6 | 1 
                   mimic-1.1.0 | 1 
                    mpir-3.0.0 | 1 
                    mpv-0.35.1 | 1 
            netstat-nat-1.4.10 | 1 
               openblas-0.3.27 | 1 
                   pcre2-10.43 | 1 
               postgresql-16.4 | 1 
               pulseaudio-17.0 | 1 
           python-numpy-1.25.0 | 1 
  python-pypika-tortoise-0.1.6 | 1 
                s6-dns-2.3.7.2 | 1 
                    sdl-1.2.15 | 1 
          sphinxbase-5prealpha | 1 
                   swipl-9.2.6 | 1 
                   trinity-1.9 | 1 
               valgrind-3.23.0 | 1 
                xenomai-3.0.10 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |          acpid-2.0.34          | NOK | http://autobuild.buildroot.org/results/49ec39674a5c717af1a31dc0ed329e97d3521b85 | ORPH
 powerpc64   |        alsa-lib-1.2.12         | NOK | http://autobuild.buildroot.org/results/77a89f255b2edaeec3bcb930b9261e6afeee9642 |     
   mipsel    |       alsa-utils-1.2.12        | NOK | http://autobuild.buildroot.org/results/0f4f0ef52208d9c7349b825c4f086d21ef6a7ae4 |     
 microblaze  | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.org/results/694292e5b34043df8473db4bc18c6376c96dff29 |     
 powerpc64   |         apache-2.4.62          | NOK | http://autobuild.buildroot.org/results/8f73839a972db7d6f27e789a2f1fe1de925334f6 |     
    arc      |         apparmor-3.1.7         | NOK | http://autobuild.buildroot.org/results/f48003c433ab4bd3e82a91547085e89d7be172ed |     
 microblaze  |         apr-util-1.6.3         | NOK | http://autobuild.buildroot.org/results/c42eda185b58950750eff38783c3d66d27837990 |     
  riscv64    |       armadillo-9.900.2        | NOK | http://autobuild.buildroot.org/results/f3b4d78da2a26815d00e3a5bcdd33f579e6720a8 |     
   arceb     |       armadillo-9.900.2        | NOK | http://autobuild.buildroot.org/results/7aef358316bef069e9555cec68184ee7f9ccd615 |     
   s390x     |       armadillo-9.900.2        | NOK | http://autobuild.buildroot.org/results/54daf91168a49a4ff6642461e486151258363123 |     
  mips64el   |       armadillo-9.900.2        | NOK | http://autobuild.buildroot.org/results/63a14a750510c66fa84879bfb083111afef4a383 |     
   mips64    |       armadillo-9.900.2        | NOK | http://autobuild.buildroot.org/results/98b933e4407bdca877161cc387c7a0c72dc54292 |     
   s390x     |       armadillo-9.900.2        | NOK | http://autobuild.buildroot.org/results/15ddb809dd069c4e8d1d4e48a8e66c60d257646d |     
 microblaze  |      at-spi2-core-2.50.0       | NOK | http://autobuild.buildroot.org/results/11b42a44e4ae1be716409dc503c91185cc0dab20 |     
   armeb     |      at-spi2-core-2.50.0       | NOK | http://autobuild.buildroot.org/results/b6a4116acf10f6fdc26c49639f48c7da6efe2300 |     
    arc      |      at-spi2-core-2.50.0       | NOK | http://autobuild.buildroot.org/results/67eb382544aa2cc618353b89b828dd440f7cbf2c |     
  sparc64    | aubio-152d6819b360c2e7b379e... | NOK | http://autobuild.buildroot.org/results/5b58ce9d1cb63a1f881b073d07767ba31c048a90 |     
  sparc64    | aubio-152d6819b360c2e7b379e... | NOK | http://autobuild.buildroot.org/results/9bb3eb0a9918d4424d4e39126acba8579b9c9744 |     
  sparc64    | aubio-152d6819b360c2e7b379e... | NOK | http://autobuild.buildroot.org/results/0a33627bf3845006fb5b2366b20afe7c0173078a |     
   s390x     | aubio-152d6819b360c2e7b379e... | NOK | http://autobuild.buildroot.org/results/1b239cead904fdabb9333b78634490b06b04c938 |     
   armeb     | aubio-152d6819b360c2e7b379e... | NOK | http://autobuild.buildroot.org/results/549a36ec8309377f7af1b423cf53f07a048e0f8e |     
   armeb     |          babeld-1.9.2          | NOK | http://autobuild.buildroot.org/results/88f9fd5965e2ae2830381d861a9e753667acca2b | ORPH
    i486     |          babeld-1.9.2          | NOK | http://autobuild.buildroot.org/results/8559e1625759305fb3c0bbbdae1dc2844900a577 | ORPH
  riscv64    |          babeld-1.9.2          | NOK | http://autobuild.buildroot.org/results/b5d72daf7607d32537f48dc014855124e1a42867 | ORPH
   sh4eb     |          babeld-1.9.2          | NOK | http://autobuild.buildroot.org/results/b137e87b6593fee64cda9cff9a8574820d77423b | ORPH
 powerpc64   |          babeld-1.9.2          | NOK | http://autobuild.buildroot.org/results/ca52895c9189d335a172bdc65884db08bfdf17a3 | ORPH
   sparc     |          babeld-1.9.2          | NOK | http://autobuild.buildroot.org/results/82078c21093b0a88db894c153e7f34d881dfbdd6 | ORPH
   mipsel    |          babeld-1.9.2          | NOK | http://autobuild.buildroot.org/results/d7cddde668e5752b83b4a5462b2ac04068252fa1 | ORPH
    or1k     |          babeld-1.9.2          | NOK | http://autobuild.buildroot.org/results/79634f6963377197137e9a17691972fd9d74bbe8 | ORPH
  mips64el   |          babeld-1.9.2          | NOK | http://autobuild.buildroot.org/results/7db77ffb1968fb2c9a6f2a96fcf0812693aa33d7 | ORPH
   xtensa    |          babeld-1.9.2          | NOK | http://autobuild.buildroot.org/results/b7fbdf34ac3c78ee51b2ae761e8d2877e1cb1a0b | ORPH
   arceb     |  binutils-arc-2023.09-release  | NOK | http://autobuild.buildroot.org/results/88f5c46fc195da9798737fefc2c95bef621ffd45 |     
   arceb     |  binutils-arc-2023.09-release  | NOK | http://autobuild.buildroot.org/results/dcf9015342eeada005a484ce660c66a961b8b9ee |     
   xtensa    |           bsdiff-4.3           | NOK | http://autobuild.buildroot.org/results/79376230312ee32ba3a89a50101423a7cd11ab0c | ORPH
    m68k     |        cache-calibrator        | NOK | http://autobuild.buildroot.org/results/7cb96e1083fb7da7a5dd1c8bb49273133a89bffc |     
 microblaze  |          cairo-1.18.0          | NOK | http://autobuild.buildroot.org/results/8d6abba7737f16a0409826f374c523153f33f8b0 |     
    mips     |      cryptodev-linux-1.13      | NOK | http://autobuild.buildroot.org/results/76acc9dc54ba125d20bdc72acdfd74b1a66ed530 | ORPH
   mipsel    |      cryptodev-linux-1.13      | NOK | http://autobuild.buildroot.org/results/22772a61b5b4bf14f6e70e02fc184607d150c12f | ORPH
   mips64    |      cryptodev-linux-1.13      | NOK | http://autobuild.buildroot.org/results/54c201cb10224e1ea0eded1d12b15d1829f41086 | ORPH
 microblaze  |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.org/results/6eb9f3d6d44d16b2caa44c593711b3ae84956fee | ORPH
   mipsel    |         directfb-1.7.7         | NOK | http://autobuild.buildroot.org/results/2214bcdf45a36c3f9b05f9b3539cb14140b3467c | ORPH
   mipsel    |         directfb-1.7.7         | NOK | http://autobuild.buildroot.org/results/d894a8e0d6134cbb334689f9c49c888b9e99056a | ORPH
  sparc64    |          duma-2.5.21           | NOK | http://autobuild.buildroot.org/results/9efb140564d05e9d32a334994b8004cfeae604cc | ORPH
  aarch64    |           dust-0.9.0           | NOK | http://autobuild.buildroot.org/results/176d0e6817e4a6e88387639304460cf58ff3ede9 | ORPH
  aarch64    |       ecryptfs-utils-111       | NOK | http://autobuild.buildroot.org/results/0066d0f761c5ef582f05faf9cdf37350c37c8f55 |     
    sh4      |            ell-0.65            | NOK | http://autobuild.buildroot.org/results/9024717b5e2d69568bda7e95d06582800a76a232 | ORPH
microblazeel |         enscript-1.6.6         | NOK | http://autobuild.buildroot.org/results/eb53b42db0d4bcaf574380d5a89a096cc4ce4b14 | ORPH
 powerpc64   |         espflash-3.1.0         | NOK | http://autobuild.buildroot.org/results/cb5fbf1faa2607af8517d98a6179605939504be3 |     
   mipsel    |          fbdump-0.4.2          | NOK | http://autobuild.buildroot.org/results/c390e273e964e377361683c317a303213a6d4891 | ORPH
    arc      |          ffmpeg-6.1.2          | NOK | http://autobuild.buildroot.org/results/c971d2d916c5e63c1ecda46391e8c34b9cc260c0 |     
  riscv32    |          ffmpeg-6.1.2          | NOK | http://autobuild.buildroot.org/results/e84a8a6f587c11bec870bbbd34ac72c7e471ebc8 |     
    mips     |           file-5.45            | NOK | http://autobuild.buildroot.org/results/abbc3611d4c425bdf4f101a1c425dd56a14e8758 | ORPH
  powerpc    |           file-5.45            | NOK | http://autobuild.buildroot.org/results/fe5e45bde08e391377573f2c7d931895d128b0cf | ORPH
   mips64    |        fluent-bit-3.1.3        | NOK | http://autobuild.buildroot.org/results/20898dda454dc73f641ef2919fcb3fd183054d70 |     
powerpc64le  |        fluent-bit-3.1.3        | NOK | http://autobuild.buildroot.org/results/57d450d7f0a7f0eb5be65901ee6bba12f4a6983b |     
microblazeel |          foot-1.16.2           | NOK | http://autobuild.buildroot.org/results/52c1f29fea7ebcccdf98aafcf5bb42daf911def8 |     
   mipsel    |         gerbera-1.12.1         | NOK | http://autobuild.buildroot.org/results/369ee6d2dcb0d60fd066c5aeed5751a670fc669d |     
   armeb     |       gettext-gnu-0.22.4       | NOK | http://autobuild.buildroot.org/results/3e52e5b8974fe4b9b99887c6d07809377a047087 | ORPH
powerpc64le  | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.org/results/41ab7ddab0d6c182392a11e9228a89a8cbde4432 |     
 powerpc64   |     gmrender-resurrect-0.1     | NOK | http://autobuild.buildroot.org/results/0c5ea1eb4f51ab515c5ef884fabfa270ec609e50 |     
 microblaze  |         gnuplot-6.0.1          | NOK | http://autobuild.buildroot.org/results/b5693e0cf077c925b3fc2c275b7bf3cfed28fad0 |     
    arm      |         gnuplot-6.0.1          | NOK | http://autobuild.buildroot.org/results/1624ea9e28976499875b8ad9a897bf4e65003ded |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.org/results/fae262060eae5ed2e470d83a0f65e9c519ff6269 |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.org/results/74869a189e0cb50f5050a5132e68f1f8af6dea99 |     
    m68k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.org/results/46d01178195eb6b49fb590b8aeeea088a1192f13 | ORPH
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.org/results/2ea0b1afe8f008712e0331b7e06c9effa5ff03ff | ORPH
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.org/results/c184a832b9e3f939de422a66e4877ed237ac7eb6 | ORPH
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.org/results/184730e6a79d76541d40c73df576eb28e213a243 | ORPH
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.org/results/94592605be52fc4bb03077b158a2733439441e3f | ORPH
    m68k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.org/results/70776e769ac223a070b30c8a1fb87cee90266271 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.org/results/a3abb151065f8ff07ec94a616c9d215893d5e267 | ORPH
powerpc64le  |       host-cairo-1.18.0        | NOK | http://autobuild.buildroot.org/results/d9fe809331b24d536443ffbcd7024d2113940e7a |     
  sparc64    |       host-ccache-4.10.1       | NOK | http://autobuild.buildroot.org/results/fb504bde205d770571ad9c0bf5d8dc44a3933dc0 | ORPH
powerpc64le  |      host-librsvg-2.50.9       | NOK | http://autobuild.buildroot.org/results/493862694889b1ec53990ed43c2509a4e65276c6 |     
   armeb     |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.org/results/c7d53aee98f452acf13a8c06e775f4405453fdb0 |     
microblazeel | host-riscv-isa-sim-00dfa28c... | NOK | http://autobuild.buildroot.org/results/2b29a1b1fdb5445931c70aec8817cd2694fb7702 |     
    arc      | host-softether-4.30-9700-beta  | NOK | http://autobuild.buildroot.org/results/72ee8488479f5ff6e11a10a41d722a4c852bb9a1 | ORPH
   sparc     | host-softether-4.30-9700-beta  | NOK | http://autobuild.buildroot.org/results/6ae7d4eabd0af3734a9efc55303fc12171c8c956 | ORPH
   mipsel    | host-vboot-utils-4b12d392e5... | NOK | http://autobuild.buildroot.org/results/6077b306bf339e408e0da7ee300b362271f13f57 |     
microblazeel | host-vboot-utils-4b12d392e5... | NOK | http://autobuild.buildroot.org/results/001081cd5ca053664e2e0702b0ed5a18e26cbf04 |     
 microblaze  |         iperf3-3.17.1          | NOK | http://autobuild.buildroot.org/results/dd9cdfe11d37eac7bb4f38ca274399ca5cd3dcf3 | ORPH
   sh4aeb    |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.org/results/f2c02b75ee67f5d72ecb040f3a61f318e4d8318b |     
    mips     |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.org/results/727c1a0b4303eb01c9bf581ef11b5e3fd6ff662f |     
    m68k     |          jack2-1.9.22          | NOK | http://autobuild.buildroot.org/results/b18e9534ac917b7ad49e487e85c7d6dc049f4d72 |     
   x86_64    | jailhouse-e57d1eff6d55aeed5... | NOK | http://autobuild.buildroot.org/results/74c3f5ac1bc73929827ecb933c5046511fa3771c |     
   armeb     |       libargtable2-2.13        | NOK | http://autobuild.buildroot.org/results/0fc818b251b8478953c2bc518f1eeccf72f50621 | ORPH
    sh4a     | libdbi-drivers-0bfae6c43134... | NOK | http://autobuild.buildroot.org/results/773b4a9496b8eee0236654e3cfbe34612741d20b |     
   sparc     |         libdrm-2.4.122         | NOK | http://autobuild.buildroot.org/results/2e7f9664d860c7bff7504687c67ee5f520202050 |     
 microblaze  |        libopenssl-3.3.1        | NOK | http://autobuild.buildroot.org/results/88d327a3cd3c49877ded8e7fe78f44f937e8b5a1 | ORPH
   xtensa    |          libsepol-3.6          | NOK | http://autobuild.buildroot.org/results/21d1425ac2d4e61dd53a5a1d4d949ca6978df5c2 |     
   xtensa    |          libsepol-3.6          | NOK | http://autobuild.buildroot.org/results/998162832b9182c677c00508860f50a708c03af3 |     
   xtensa    |          libsepol-3.6          | NOK | http://autobuild.buildroot.org/results/318d44a10f209e3c3fbbb17a39235e8e21eb5cba |     
    i686     |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.org/results/f41cf0a884a6619047207f4d5875805f11f0c0d4 | ORPH
  powerpc    |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.org/results/7f9e6ca477060eeddb5866d94b84ab650a8dcd57 | ORPH
  mips64el   |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.org/results/006a28c26e4020da706f1c7f436ad4688c51cec4 | ORPH
   sh4aeb    |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.org/results/6591dc40b70324affad51c635b591da7825b0e91 | ORPH
  mips64el   |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.org/results/d9230cf237b0fdbda3fb807b5adfccc47d5e8fed | ORPH
   armeb     |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.org/results/8864e63938eb327779dcdfe62bb11137460ae075 | ORPH
    mips     |          linux-6.10.6          | NOK | http://autobuild.buildroot.org/results/b42a13f2c99b36be1912b84b9a89baeaa865c82d | ORPH
   armeb     |          linux-6.10.6          | NOK | http://autobuild.buildroot.org/results/2a3e1e818c5e73928b1c61d76c08f7772e434283 | ORPH
   sh4aeb    |          linux-6.10.6          | NOK | http://autobuild.buildroot.org/results/b5d871444d9f3161125efaf2f4c45a602aa4aba7 | ORPH
  mips64el   |          linux-6.10.6          | NOK | http://autobuild.buildroot.org/results/9e46127e273b90cd46860dc9e0e871536f82af6f | ORPH
   sparc     |          linux-6.10.6          | NOK | http://autobuild.buildroot.org/results/91d5b86ea7c58dbbef5c6efca01a73379f316d04 | ORPH
  riscv64    |          linux-6.10.6          | NOK | http://autobuild.buildroot.org/results/67f5466f73e3e14b705ccabc10a3b61a9b2bbaff | ORPH
   sparc     |          linux-6.10.6          | NOK | http://autobuild.buildroot.org/results/1affcfd4c66289ac162fe5934b5396a4804798ba | ORPH
   armeb     |          linux-6.10.6          | NOK | http://autobuild.buildroot.org/results/c586039a2615ee5e40c0e80c4d81ae58c417bf18 | ORPH
 powerpc64   |          linux-6.10.6          | NOK | http://autobuild.buildroot.org/results/0f14ad8a7d950fc224af8570833609c660b7d6d9 | ORPH
   mipsel    |          linux-6.10.6          | NOK | http://autobuild.buildroot.org/results/d55139fd3945071e7163603514bf19a97f3618f2 | ORPH
  sparc64    |       linux-fusion-9.0.3       | NOK | http://autobuild.buildroot.org/results/b670b195b4ffd0b990409c78ad066b3de0034967 | ORPH
    sh4      |       linux-fusion-9.0.3       | NOK | http://autobuild.buildroot.org/results/ddad5d86eb259456c5e8a2de3dd84b77a502944b | ORPH
microblazeel |        linux-pam-1.6.1         | NOK | http://autobuild.buildroot.org/results/810fe3192b181052a36088a66171202edeaea7cf | ORPH
   arceb     |        linux-pam-1.6.1         | NOK | http://autobuild.buildroot.org/results/ab9d091a212a7139fbd9e899b7e979a24e799269 | ORPH
   xtensa    |        linux-pam-1.6.1         | NOK | http://autobuild.buildroot.org/results/19ca6884102176fac1afa9cf63c516d555ad7a7f | ORPH
   x86_64    |        linux-pam-1.6.1         | NOK | http://autobuild.buildroot.org/results/a36390b0af7ee0cb62aa05d207e872aaa75991a8 | ORPH
   xtensa    |        linux-pam-1.6.1         | NOK | http://autobuild.buildroot.org/results/1622e45fb3bd9c6714085956f946f0f3a52ffdcb | ORPH
  mips64el   |          linux-tools           | NOK | http://autobuild.buildroot.org/results/7b942d476b36913318f3cf5b98993544c1e27eaa | ORPH
   nios2     |       lirc-tools-0.10.2        | NOK | http://autobuild.buildroot.org/results/2f64accd430d9467add3f1195f3f59eff8e99a4d | ORPH
 microblaze  |        mariadb-10.11.6         | NOK | http://autobuild.buildroot.org/results/a1e861e9ba09333ef275b2bce489b3e1273b89c3 | ORPH
powerpc64le  |          mimic-1.1.0           | NOK | http://autobuild.buildroot.org/results/5031bbaaea197a016f54dce4f181f2ac10af61a1 |     
    arm      |           mpir-3.0.0           | NOK | http://autobuild.buildroot.org/results/824358226dd4b7509ab47b7e31390bbd30e0b694 |     
    m68k     |           mpv-0.35.1           | NOK | http://autobuild.buildroot.org/results/7a48b6152d9a04c6a2b8149b7838ef83bcd78d85 |     
 microblaze  |       netstat-nat-1.4.10       | NOK | http://autobuild.buildroot.org/results/0ee3a0fa14ac2a34b0e70ab312a918d9d880d9ff | ORPH
   xtensa    |          ntp-4.2.8p18          | NOK | http://autobuild.buildroot.org/results/dc78fdbd42468c646bbdcd0ae82998a6dcb8b3d8 |     
   sparc     |          ntp-4.2.8p18          | NOK | http://autobuild.buildroot.org/results/56d225c5dce2ca60421975fca0f9810ab4b9e062 |     
   mips64    |        openblas-0.3.27         | NOK | http://autobuild.buildroot.org/results/50faf6b72cb251f7ab8c7fa6f91148d61e58058f |     
  mips64el   |         openssh-9.8p1          | NOK | http://autobuild.buildroot.org/results/d7739da2d2d753d4f9f7a1243337cb0ad173c085 | ORPH
    mips     |         openssh-9.8p1          | NOK | http://autobuild.buildroot.org/results/0020259ec21a07f8072b4a4af18f58eaa18df0b5 | ORPH
  powerpc    |       parsec-tool-0.7.0        | NOK | http://autobuild.buildroot.org/results/0c1d17e8b92d6aff97f24057931bfa589d90179d |     
   s390x     |       parsec-tool-0.7.0        | NOK | http://autobuild.buildroot.org/results/c85439d519b28987ad470ff36d6e7594b0ddc6bf |     
   mipsel    |          pcre2-10.43           | NOK | http://autobuild.buildroot.org/results/f95632c682261c20bfd4c45d514eefe0bf5233f6 | ORPH
   arceb     |        postgresql-16.4         | NOK | http://autobuild.buildroot.org/results/38120fb40d948cb7d9eb5dc6506a809b63db4211 |     
 powerpc64   |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/ad19abcae3c39fa314cde7132befd495c39be580 | ORPH
   sparc     |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/e3619fb33fb97d43719ec3edc0e6d1ba53c40829 | ORPH
   xtensa    |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/9bf8ae8f86b66b9652f65bccdcaab35147175735 | ORPH
  powerpc    |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/a2f7d71df25a8c7cc71ef5af3e830e82c7528ffc | ORPH
   armeb     |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/33eca58b69e13eecee8845037d3da1ae6e1d4965 | ORPH
   nios2     |        pulseaudio-17.0         | NOK | http://autobuild.buildroot.org/results/0f1e2e61aba9811ff8bc52f7ba5485d3b164870b | ORPH
 aarch64_be  |    python-autocommand-2.2.2    | NOK | http://autobuild.buildroot.org/results/f8913fdab36452f836eb3aa23e4a65839c502480 |     
    arc      |    python-autocommand-2.2.2    | NOK | http://autobuild.buildroot.org/results/44c4b3c3ee805e7c03e013b26e95394903d9cdd8 |     
  sparc64    |    python-autocommand-2.2.2    | NOK | http://autobuild.buildroot.org/results/a5ac8741b990e2598344a3a3aaa1a2f43f237579 |     
   mips64    |    python-autocommand-2.2.2    | NOK | http://autobuild.buildroot.org/results/c0494ba77f856908057ed1134a409a3dae15ee6d |     
   sparc     |      python-daemon-3.0.1       | NOK | http://autobuild.buildroot.org/results/19d846602675c91b14d45d0347902950f48a710e |     
 aarch64_be  |      python-daemon-3.0.1       | NOK | http://autobuild.buildroot.org/results/b9ef56f375105685a18d463170c3e7044932bad5 |     
 powerpc64   |      python-numpy-1.25.0       | NOK | http://autobuild.buildroot.org/results/d971734c0fddd71f69499d483c4c114dbd115037 |     
powerpc64le  |  python-pypika-tortoise-0.1.6  | NOK | http://autobuild.buildroot.org/results/0d84b7b7621d58e816cba46d04a5a89070e68919 |     
    arm      |          ramsmp-3.5.0          | NOK | http://autobuild.buildroot.org/results/66b69dd0cfda028ede7a5ba8ec7b573c24c9ba6d |     
 powerpc64   |          ramsmp-3.5.0          | NOK | http://autobuild.buildroot.org/results/7885b32c8f8bafb7641fd067c716df8b966f1c68 |     
 powerpc64   |          ramsmp-3.5.0          | NOK | http://autobuild.buildroot.org/results/969065eafc80d4604e01828af2589404030e7779 |     
   s390x     |         s6-dns-2.3.7.2         | NOK | http://autobuild.buildroot.org/results/44d933573c781c4600248bcd48769e818a5e0dd2 |     
powerpc64le  |           sdl-1.2.15           | NOK | http://autobuild.buildroot.org/results/c3edc4f83101f141aece4045a54d9175c0a20559 | ORPH
    i686     |      sphinxbase-5prealpha      | NOK | http://autobuild.buildroot.org/results/fc8f02a44ae13a76685750c3f6dfc69c1c7d1c2a |     
  aarch64    |          swipl-9.2.6           | NOK | http://autobuild.buildroot.org/results/edc1954a56be8524b6cf6fd343992a7bb3550d66 |     
    arm      |          trinity-1.9           | NOK | http://autobuild.buildroot.org/results/022835711ac757ed8fbdb4e0690642c764dda0ae | ORPH
    or1k     |            unknown             | NOK | http://autobuild.buildroot.org/results/1a3f4b2b2ccadf1e645477c1a6021314875860e9 |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.org/results/aa59c4d9997b293e774392009abc95fb861aa734 |     
   sparc     |            unknown             | NOK | http://autobuild.buildroot.org/results/1b8372a51a1355641bf6d7f4c6be9fedec9a1ae0 |     
    i686     |            unknown             | NOK | http://autobuild.buildroot.org/results/9548c7111e4d891c5d34b56bd777676221c2bf67 |     
   arceb     |            unknown             | NOK | http://autobuild.buildroot.org/results/dc18cf16052c84947067c3abe081699084b7316e |     
 aarch64_be  |            unknown             | NOK | http://autobuild.buildroot.org/results/accd8ccbe79804adf71bc5c70fbe4f0c6caf3d10 |     
   sh4aeb    |            unknown             | NOK | http://autobuild.buildroot.org/results/4872b87dd60129f4e932114065648fc0231870df |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.org/results/60627ebba29275d3ffcf75a1efef4f7c17be0635 |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.org/results/cd7c40143b8bab2994bcdf5dd79cbfaa300322b7 |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.org/results/3fa438339231509b9a0773798ae78c394f3966a0 |     
  mips64el   |        valgrind-3.23.0         | NOK | http://autobuild.buildroot.org/results/6ab6e50cc47b814354a04a73ab9b2be1e1caf191 | ORPH
  powerpc    |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.org/results/2ce834765b8ce15260f487b2fa38c90c54a90471 |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

host-heimdal-f4faaeaba371ff... | 2 
                elfutils-0.189 | 1 
                gnu-efi-3.0.17 | 1 
               host-go-1.21.13 | 1 
               libglib2-2.76.1 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.org/results/b18dfedac0cd2b721a759d97b698a33be4bc601c | ORPH
 aarch64_be  |         gnu-efi-3.0.17         | NOK | http://autobuild.buildroot.org/results/d963541eef59f6af4e5fbfd29d14dfd84249d995 |     
  aarch64    |        host-go-1.21.13         | NOK | http://autobuild.buildroot.org/results/e283792df97cbb11c37b84f5bfe902db891fa4d7 |     
    i686     | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.org/results/c49c793c37e707f641c43968955aeb4b1b401ad6 | ORPH
   mipsel    | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.org/results/a54a5cde5e917848d1fa8e8301c998c3c4f0b135 | ORPH
   arceb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.org/results/4ec811666644f7d0d947f0e07d6a226b9b626102 |     


Classification of failures by reason for 2024.05.x
--------------------------------------------------

                  ffmpeg-6.1.1 | 3 
                host-go-1.22.5 | 3 
                    fcft-3.1.6 | 1 
                 gnuplot-6.0.0 | 1 
         host-libxcrypt-4.4.36 | 1 
              host-rust-1.74.1 | 1 
           host-systemd-254.13 | 1 
                libressl-3.8.4 | 1 
                  ntp-4.2.8p18 | 1 
         python-remi-2022.7.27 | 1 
                   trinity-1.9 | 1 
                 uclibc-1.0.48 | 1 
        util-linux-libs-2.39.3 | 1 


Detail of failures for 2024.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |           fcft-3.1.6           | NOK | http://autobuild.buildroot.org/results/0a1e8f660d0ebf811dd07f38a9660026c3d161db |     
  riscv32    |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.org/results/13167f718f4cc49cfe3b754cbed420583000bc9a |     
    arc      |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.org/results/5189197781c3359dcaef15d6e2404d1da8b40011 |     
microblazeel |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.org/results/b3e7109c4768145a9094afa61c2c2d6bf51b9cba |     
   nios2     |         gnuplot-6.0.0          | NOK | http://autobuild.buildroot.org/results/6defa500c246786cb18811d7c117b3b3f09e65d0 |     
   mips64    |         host-go-1.22.5         | NOK | http://autobuild.buildroot.org/results/3f795b1cdbf74f049e28ddf9730b07060525b58e |     
  mips64el   |         host-go-1.22.5         | NOK | http://autobuild.buildroot.org/results/fba396cb154bccb9e182937dc5917b840aa27800 |     
   mips64    |         host-go-1.22.5         | NOK | http://autobuild.buildroot.org/results/9cdda39781dc8fe5d3e7a1117efefe8de5185258 |     
   mipsel    |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.org/results/7bbcecc5920753ef478fdb593d8a744f97bb43d4 |     
   armeb     |        host-rust-1.74.1        | NOK | http://autobuild.buildroot.org/results/36c7ca2becf9e3ae9fe01cd3d26e05be7451e6a5 |     
    arm      |      host-systemd-254.13       | NOK | http://autobuild.buildroot.org/results/250b06292dafba5ea5938039556deb5761a3cb07 |     
 powerpc64   |         libressl-3.8.4         | NOK | http://autobuild.buildroot.org/results/22174a3ac21e9e67ea40b70895e9d75857a3e74a | ORPH
microblazeel |          ntp-4.2.8p18          | NOK | http://autobuild.buildroot.org/results/07cbbd9e5b5b7fa6d218723b67717535d1e7704c |     
   s390x     |     python-remi-2022.7.27      | NOK | http://autobuild.buildroot.org/results/014dceacca778aa35a8798e5fed4ee46865e4577 |     
powerpc64le  |          trinity-1.9           | NOK | http://autobuild.buildroot.org/results/dc7d0f1b9afd84add006fa54e1cf5566e7bb7e51 | ORPH
   mipsel    |         uclibc-1.0.48          | NOK | http://autobuild.buildroot.org/results/cc58fe59be987827b414ea9b5cd9314a4a4b0504 |     
   arceb     |     util-linux-libs-2.39.3     | NOK | http://autobuild.buildroot.org/results/011cfe753c8cadffd63c3354ca9e1ba0d3883700 | ORPH


Classification of failures by reason for next
---------------------------------------------

             libblockdev-3.1.1 | 2 
                       unknown | 2 
             bluez5_utils-5.77 | 1 
             containerd-1.7.20 | 1 
                  ffmpeg-6.1.2 | 1 
                gerbera-1.12.1 | 1 
                 gnuplot-6.0.1 | 1 
  gobject-introspection-1.76.1 | 1 
             gtkiostream-1.8.0 | 1 
host-heimdal-f4faaeaba371ff... | 1 
         host-libxcrypt-4.4.36 | 1 
                      iwd-2.19 | 1 
                  linux-6.10.3 | 1 
           mediastreamer-4.4.8 | 1 
                    norm-1.5.8 | 1 
    python-cryptography-39.0.2 | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    mips     |       bluez5_utils-5.77        | NOK | http://autobuild.buildroot.org/results/0deadd01256064d8302c888985461695ee2379db |     
  riscv64    |       containerd-1.7.20        | NOK | http://autobuild.buildroot.org/results/3f7f8a0816e1eb51aa0533e453c13f7080953b67 |     
microblazeel |          ffmpeg-6.1.2          | NOK | http://autobuild.buildroot.org/results/e7efafde5be1dd5b7ead6be1082d31dfcee3913a |     
  riscv32    |         gerbera-1.12.1         | NOK | http://autobuild.buildroot.org/results/43a7362ed37b4f06b3c7e9b46f8f683253842a59 |     
    arc      |         gnuplot-6.0.1          | NOK | http://autobuild.buildroot.org/results/c611afe1ae8eb4b7e05872c5d8c52dff2458bd51 |     
    m68k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.org/results/235442d5cce9789b535dcf156f5ad8602830fcce | ORPH
    arm      |       gtkiostream-1.8.0        | NOK | http://autobuild.buildroot.org/results/25156b7075dea3dba35ccefadaae71311311c074 |     
 aarch64_be  | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.org/results/3560959073140aa90a2e2513c0eb20c4f312a345 | ORPH
   sparc     |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.org/results/fe2aa3498b459537782bd76f1fb6e5806f7222b2 |     
  sparc64    |            iwd-2.19            | NOK | http://autobuild.buildroot.org/results/32176418b42c6085274af087af36964e66579777 | ORPH
   mips64    |       libblockdev-3.1.1        | NOK | http://autobuild.buildroot.org/results/f2312a5daf84a261b4cef0382140fc791abb22d6 |     
  mips64el   |       libblockdev-3.1.1        | NOK | http://autobuild.buildroot.org/results/a633a4dcd6ac9ec17a507bbf4c1445100b16574d |     
  mips64el   |          linux-6.10.3          | NOK | http://autobuild.buildroot.org/results/c73930877c031e639da6c101b72aa1f659cee227 | ORPH
    arm      |      mediastreamer-4.4.8       | NOK | http://autobuild.buildroot.org/results/27a15b4c6a66fce72ca9f2b0f412d28baaaafb6f | ORPH
   mipsel    |           norm-1.5.8           | NOK | http://autobuild.buildroot.org/results/4357404f18c05e3d0761b46f3fc792ccba3899b5 | ORPH
    sh4      |   python-cryptography-39.0.2   | NOK | http://autobuild.buildroot.org/results/babb1b090defff521760fc890f1f03c88e63a51f |     
   sh4eb     |            unknown             | NOK | http://autobuild.buildroot.org/results/c2b609216f335a455a4496348c27d5a0adb345e8 |     
    sh4a     |            unknown             | NOK | http://autobuild.buildroot.org/results/ed3baee6a0f3b3dc470099d5bd37a674df707bbc |     



-- 
http://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
