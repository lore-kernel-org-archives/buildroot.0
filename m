Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A36E2EEE27A
	for <buildroot@archiver.kernel.org>; Fri, 13 Sep 2024 03:17:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 219B880DD0;
	Fri, 13 Sep 2024 03:17:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4HLZdMy8AFsx; Fri, 13 Sep 2024 03:17:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F391484171
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F391484171;
	Fri, 13 Sep 2024 03:17:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 68F911BF95A
 for <buildroot@lists.busybox.net>; Fri, 13 Sep 2024 03:17:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4D127401BD
 for <buildroot@lists.busybox.net>; Fri, 13 Sep 2024 03:17:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gnio3ZQLKe4h for <buildroot@lists.busybox.net>;
 Fri, 13 Sep 2024 03:17:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::636; helo=mail-ej1-x636.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B42BE400B7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B42BE400B7
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B42BE400B7
 for <buildroot@buildroot.org>; Fri, 13 Sep 2024 03:17:21 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a8d6ac24a3bso297454666b.1
 for <buildroot@buildroot.org>; Thu, 12 Sep 2024 20:17:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726197439; x=1726802239;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JHa3tj0tkrS8VPAwlz97ISgE5IjFZr4UNC+SNKgEG/I=;
 b=kp4RoJk0QuTGzEbmNkPb975le1r8u0GRLWW8YSJGao1CC4qVcVTu80+1QdXPW6L6aC
 ogk+DeyqpK4c5UeYQks3AZbi3euBJfc6jx4JxX0VZ85lqm9gussh4QWoyFF2fZpUC4Y8
 +34aPWxP4mLCNQQH1U1Goj/sBacMvq7/dnnTMFXBdmT2Jvt4JB/8GRbbrcVs+7YbGbnS
 +NivYRzv+coiNEbuv+TISw1n81/LgRAcEcptVJLMq5HLo/TV0VLTlUkCwlToafc8U//N
 4wWH/+LdSX4ompNN/oXSzk3FwQgOkyqoDB9fPAaBA3DZm++XoSij4HYfcMzYzwBuiWK6
 /gtQ==
X-Gm-Message-State: AOJu0Yzs9TwQd4+ZwnRN3CIDB3wLIvmbpv+xUpFYymDpVxmLKvFTo9R9
 PuEJaS5JEVgnZyj2ykCfl9FTNPuBRndsG7ek6pxGrV4JrDxPxiXxg7usJQ==
X-Google-Smtp-Source: AGHT+IFwwtbIUt4sLHvGjJIrKVk+P5eS4YX5/R4GBOFpvMniiby7beIxaX4fMrzZ7k5ebmTI9U+lYA==
X-Received: by 2002:a17:907:7f8f:b0:a8d:6dab:b8ee with SMTP id
 a640c23a62f3a-a902a8c3499mr481278366b.23.1726197438847; 
 Thu, 12 Sep 2024 20:17:18 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8d25d40e8csm818071966b.196.2024.09.12.20.17.18
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Sep 2024 20:17:18 -0700 (PDT)
Message-ID: <66e3aebe.170a0220.2535e1.9466@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Fri, 13 Sep 2024 03:17:18 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726197439; x=1726802239; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=JHa3tj0tkrS8VPAwlz97ISgE5IjFZr4UNC+SNKgEG/I=;
 b=kVNkyDRMN7+x28QBg0luTnuxnk3yM8P4wRNVQaAX2sF+8zbGzktmkmdH/vLtHSNprj
 wQ4qIiPBKb6dc7nOYbh1FBzhWmRs2R9q28f7OeqgOXAwa81JozXNo91JDaavAwVIpT/a
 RoT77ZU1aF3roau+5G1yXa6Z4BhvC4zX9Y+gedBJb8YSJ2i/kkEd/GPYksMMzeQluO48
 6z8voA5OI3TbP9ik4IjimiSsGntck9aPDDBuR7bQBBrWsDtRKGTUtmmMvYBp1ekn+M+f
 9vErfpS/A5tRHU4GglG267DxMt3zRFlIp4VVxOGKUj+KXxv+X+DNPLYdTfStzGMnEQbL
 B8zA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=kVNkyDRM
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2024-09-12
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

Autobuild statistics for 2024-09-12
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  | 15  | 12  |  0  | 27  |
  2024.05.x  |  7  | 17  |  1  | 25  |
  2024.08.x  |  3  |  4  |  0  |  7  |
    master   | 20  | 302 | 10  | 332 |

Classification of failures by reason for master
-----------------------------------------------

                 libssh-0.11.0 | 24
aubio-152d6819b360c2e7b379e... | 21
                  linux-6.10.8 | 21
               procps-ng-4.0.4 | 18
              host-rust-1.80.1 | 11
         gobject-introspection | 10
          linux-5.10.162-cip24 | 10
                  cairo-1.18.0 | 8 
          cryptodev-linux-1.13 | 8 
                       unknown | 8 
android-tools-4.2.2+git2013... | 7 
              libopenssl-3.3.2 | 7 
     linux-5.10.162-cip24-rt10 | 7 
               pulseaudio-17.0 | 7 
                  bind-9.18.28 | 6 
                    bsdiff-4.3 | 6 
                  ffmpeg-6.1.2 | 6 
            gettext-gnu-0.22.4 | 6 
               ipmitool-1_8_19 | 6 
glibc-2.40-18-g564178076272... | 5 
               linux-pam-1.6.1 | 5 
           at-spi2-core-2.50.0 | 4 
                  libsepol-3.6 | 4 
             bluez5_utils-5.77 | 3 
check-11970a7e112dfe243a2e6... | 3 
                     file-5.45 | 3 
                   foot-1.16.2 | 3 
  gobject-introspection-1.76.1 | 3 
           host-librsvg-2.50.9 | 3 
                  jack2-1.9.22 | 3 
                 libv4l-1.28.1 | 3 
            linux-fusion-9.0.3 | 3 
                 openssh-9.8p1 | 3 
                 pixman-0.42.2 | 3 
                 apache-2.4.62 | 2 
                directfb-1.7.7 | 2 
            gdk-pixbuf-2.42.10 | 2 
            host-binutils-2.42 | 2 
            host-ccache-4.10.2 | 2 
                  libsvg-0.1.4 | 2 
               mariadb-10.11.6 | 2 
                 mesa3d-24.0.9 | 2 
                      opus-1.4 | 2 
                   sdl2-2.30.6 | 2 
               valgrind-3.23.0 | 2 
               acpica-20240321 | 1 
                  acpid-2.0.34 | 1 
                  atkmm-2.36.2 | 1 
             berkeleydb-5.3.28 | 1 
                 coreutils-9.3 | 1 
             docker-cli-27.0.3 | 1 
                   duma-2.5.21 | 1 
              fluent-bit-3.1.3 | 1 
            freeswitch-1.10.12 | 1 
              gcc-final-13.3.0 | 1 
                    git-2.46.0 | 1 
        gmrender-resurrect-0.1 | 1 
                 gnuplot-6.0.1 | 1 
               graphene-1.10.8 | 1 
           host-doxygen-1.8.18 | 1 
            host-libzlib-1.3.1 | 1 
host-riscv-isa-sim-00dfa28c... | 1 
                latencytop-0.5 | 1 
                 libcddb-1.3.2 | 1 
                 libcurl-8.9.1 | 1 
               libdeflate-1.20 | 1 
                libressl-3.9.2 | 1 
                  libva-2.22.0 | 1 
                 libvpl-2.12.0 | 1 
                libxml2-2.13.3 | 1 
             lirc-tools-0.10.2 | 1 
ltrace-82c66409c7a93ca6ad2e... | 1 
make: *** wait: No child pr... | 1 
                  ntp-4.2.8p18 | 1 
          obsidian-cursors-1.0 | 1 
                   pcre2-10.43 | 1 
      python-autocommand-2.2.2 | 1 
           python-daemon-3.0.1 | 1 
         python-remi-2022.7.27 | 1 
                    qemu-9.0.2 | 1 
                  quagga-1.2.4 | 1 
                s6-dns-2.3.7.2 | 1 
                   trinity-1.9 | 1 
                 uclibc-1.0.50 | 1 
wilc-driver-linux4microchip... | 1 
                 wolfssl-5.7.2 | 1 
                xenomai-3.0.10 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |        acpica-20240321         | NOK | http://autobuild.buildroot.org/results/693a8dc5ad80ee88cb7e9143c09862ae83211981 |     
  mips64el   |          acpid-2.0.34          | NOK | http://autobuild.buildroot.org/results/855565f242a8de392277bdab853e24d7ae5ce86f | ORPH
microblazeel | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.org/results/1e2179a55445243d2e3af2dc2f1b812ff3c534a8 |     
 powerpc64   | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.org/results/f3b62081dde7fe5298bdb823687ea739b03776f9 |     
powerpc64le  | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.org/results/7788819fe08cc35a3f6954f4e74c27cec2bce0ed |     
 microblaze  | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.org/results/9beeb101d12cb965c6b4b6ebe925c80df8f28d1b |     
   mips64    | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.org/results/c8ff96671fb59600ab379a087dad51b7c87140e6 |     
  mips64el   | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.org/results/16f1950cc8358a1a1bed7c609c80ec90ad31aa4a |     
powerpc64le  | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.org/results/46acd0d1835a0cc6ae8652d9963511fa581ff427 |     
   mips64    |         apache-2.4.62          | NOK | http://autobuild.buildroot.org/results/46521259a4fd9320483f46326650576e95c92d3c |     
   nios2     |         apache-2.4.62          | NOK | http://autobuild.buildroot.org/results/2011ab7a4ed3fdb90ae6a5c9fd8efb33e0cf77ea |     
    arc      |      at-spi2-core-2.50.0       | NOK | http://autobuild.buildroot.org/results/0c5a94b56876f3921c2e01c8166bf8fec14b10f5 |     
 microblaze  |      at-spi2-core-2.50.0       | NOK | http://autobuild.buildroot.org/results/20573412f1aa2c2fd0c66c95f7caad71e61c9946 |     
 microblaze  |      at-spi2-core-2.50.0       | NOK | http://autobuild.buildroot.org/results/08090e32fa7ffd60a6a08ef4e49d6c858cc00202 |     
   arceb     |      at-spi2-core-2.50.0       | NOK | http://autobuild.buildroot.org/results/674bb3aa091a94e99b03c9f772eef771865eca2e |     
   s390x     |          atkmm-2.36.2          | NOK | http://autobuild.buildroot.org/results/fab771694d36995d705836c86e4f0682da53a829 |     
   s390x     | aubio-152d6819b360c2e7b379e... | NOK | http://autobuild.buildroot.org/results/164b72d2ebb056920268a4a017bdc431b58c4645 |     
   s390x     | aubio-152d6819b360c2e7b379e... | NOK | http://autobuild.buildroot.org/results/16683913b1a62d944da8886b4d374a040602201d |     
 powerpc64   | aubio-152d6819b360c2e7b379e... | NOK | http://autobuild.buildroot.org/results/0bf4846797dddcb867b8d2e5eb58b5b5829f9f51 |     
   armeb     | aubio-152d6819b360c2e7b379e... | NOK | http://autobuild.buildroot.org/results/8cac7ca9ae55c0b5c0016468e41bf5c4039d42e7 |     
   s390x     | aubio-152d6819b360c2e7b379e... | NOK | http://autobuild.buildroot.org/results/5eb0449dd648ee743715378caabbcbac36776408 |     
   mips64    | aubio-152d6819b360c2e7b379e... | NOK | http://autobuild.buildroot.org/results/a007302d776d06670df17fd416165d4a92526f70 |     
   armeb     | aubio-152d6819b360c2e7b379e... | NOK | http://autobuild.buildroot.org/results/3e974342a9fd9d22c7f18c1aa0cb98eeeb1f022e |     
 powerpc64   | aubio-152d6819b360c2e7b379e... | NOK | http://autobuild.buildroot.org/results/c8031eb900cad69a943e5975cbc36bfad22adced |     
   mips64    | aubio-152d6819b360c2e7b379e... | NOK | http://autobuild.buildroot.org/results/dd7f182985c6824181ee9bf8ab14abf5b40a7686 |     
 powerpc64   | aubio-152d6819b360c2e7b379e... | NOK | http://autobuild.buildroot.org/results/d9813832c978149a431f846b180bd0dd72529b40 |     
   s390x     | aubio-152d6819b360c2e7b379e... | NOK | http://autobuild.buildroot.org/results/ca3971ab61dd25c09f72b51dd597617b84e9f111 |     
   armeb     | aubio-152d6819b360c2e7b379e... | NOK | http://autobuild.buildroot.org/results/e3a4a5f5d8c30c602e25a55dee08a797e242032a |     
   mips64    | aubio-152d6819b360c2e7b379e... | NOK | http://autobuild.buildroot.org/results/e5911e34333593713166dccc1fbbf495ccf926ff |     
   mips64    | aubio-152d6819b360c2e7b379e... | NOK | http://autobuild.buildroot.org/results/c63a21330bce10a4c6a4bb5878aa23ea7b5268ef |     
  sparc64    | aubio-152d6819b360c2e7b379e... | NOK | http://autobuild.buildroot.org/results/afe44c2cb47bdea796c26910679c5629d17a7b34 |     
   armeb     | aubio-152d6819b360c2e7b379e... | NOK | http://autobuild.buildroot.org/results/86ade8f332561ab39e5f2ff266598a092588ae1f |     
  sparc64    | aubio-152d6819b360c2e7b379e... | NOK | http://autobuild.buildroot.org/results/b6f40cd36d6bf1c3879ea9a08b2fb055150988ab |     
   mips64    | aubio-152d6819b360c2e7b379e... | NOK | http://autobuild.buildroot.org/results/aa1fb9a9dba64694076738dde117514fce20fd01 |     
    or1k     | aubio-152d6819b360c2e7b379e... | NOK | http://autobuild.buildroot.org/results/3da85a8b579045edd01322a79df97c5988af9ba3 |     
   armeb     | aubio-152d6819b360c2e7b379e... | NOK | http://autobuild.buildroot.org/results/e8295fe76fc8f57c8b5197b81a5d87a9497bd9f0 |     
  sparc64    | aubio-152d6819b360c2e7b379e... | NOK | http://autobuild.buildroot.org/results/8381f03f956f3ed1f03a8f636ea6b6e4b6fcee9a |     
   xtensa    |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.org/results/487d0ca3fa51f50d50c61cc72de5826aa0c7010e | ORPH
microblazeel |          bind-9.18.28          | NOK | http://autobuild.buildroot.org/results/fe229d49edfe2cf2ffa242f27c8f8f284915476d | ORPH
   s390x     |          bind-9.18.28          | NOK | http://autobuild.buildroot.org/results/8f7885a743efac1064eecf9dd9609c84835e1163 | ORPH
powerpc64le  |          bind-9.18.28          | NOK | http://autobuild.buildroot.org/results/3515cadc2f612ad3480d998a1fb230ea416e4800 | ORPH
   nios2     |          bind-9.18.28          | NOK | http://autobuild.buildroot.org/results/3c19b8b7786776e83bd4fb6e4e41c883f4da3c6c | ORPH
   x86_64    |          bind-9.18.28          | NOK | http://autobuild.buildroot.org/results/080891e1d10c47cc54bd81609dccac0d7872f97d | ORPH
   mipsel    |          bind-9.18.28          | NOK | http://autobuild.buildroot.org/results/685ce5ee3f9769731548df3a6e083034378547fa | ORPH
   nios2     |       bluez5_utils-5.77        | NOK | http://autobuild.buildroot.org/results/773a4f8e2b77de4747e2dee7740af063cbf4d6be |     
 powerpc64   |       bluez5_utils-5.77        | NOK | http://autobuild.buildroot.org/results/ec7a743d5f07cee234b0e12c5b74b7025ba9f49e |     
    sh4      |       bluez5_utils-5.77        | NOK | http://autobuild.buildroot.org/results/2adab4f0a01bb782b05a373113ad3a10c7c58e21 |     
   armeb     |           bsdiff-4.3           | NOK | http://autobuild.buildroot.org/results/669acdd379503ff259981389289c9c461857d5ad | ORPH
   mips64    |           bsdiff-4.3           | NOK | http://autobuild.buildroot.org/results/4f35bc9f0aa6a34907e7ec911e236b6614ff7049 | ORPH
    m68k     |           bsdiff-4.3           | NOK | http://autobuild.buildroot.org/results/988383bab84e06e8451737646798cdb0a619a7da | ORPH
   s390x     |           bsdiff-4.3           | NOK | http://autobuild.buildroot.org/results/d75163d497df8a97d17745e584617d038c3924b4 | ORPH
  mips64el   |           bsdiff-4.3           | NOK | http://autobuild.buildroot.org/results/8c144f7543da83d963c7595f88cb8808a134f181 | ORPH
   sparc     |           bsdiff-4.3           | NOK | http://autobuild.buildroot.org/results/7af5d867f137e61503abde08ceccfbaec37b9d36 | ORPH
  sparc64    |          cairo-1.18.0          | NOK | http://autobuild.buildroot.org/results/bb1aa7588cbda373738f13d3c6c10b8fc2c727ea |     
powerpc64le  |          cairo-1.18.0          | NOK | http://autobuild.buildroot.org/results/e4db0d8c940d57fddd215b9ca8b6fcfe8abf3257 |     
powerpc64le  |          cairo-1.18.0          | NOK | http://autobuild.buildroot.org/results/7e973887824c85ab9d1ff41be18f780f9723ec9b |     
   nios2     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.org/results/08bf2611a22b0da783851ed6c3b9e1fa959195d6 |     
   arceb     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.org/results/ce7cfaf7435972bc157e66335abe44e4ab168dc6 |     
   s390x     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.org/results/4d9962de8be4d01e8d51d5b1312754425bfa6fec |     
   sparc     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.org/results/fc33510c69434429df7651cbd812ae1ac99f37ad |     
 aarch64_be  |          cairo-1.18.0          | NOK | http://autobuild.buildroot.org/results/a6528c01ebe37a7478be1b3ee7454877c7682629 |     
powerpc64le  | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.org/results/f0f310aeb0205aa9f689a20ea12f37c6ecab46c9 | ORPH
powerpc64le  | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.org/results/c1f799160094b888991c42ff885433c3012a1548 | ORPH
powerpc64le  | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.org/results/153590c29e63044d7482b96e1ac72c624ddcd5f5 | ORPH
  mips64el   |         coreutils-9.3          | NOK | http://autobuild.buildroot.org/results/83d4290896c48afa0bd9b66366d06bcd805b807d | ORPH
  mips64el   |      cryptodev-linux-1.13      | NOK | http://autobuild.buildroot.org/results/6834cb8e2527442121d5ab78dc21505a30120ac3 | ORPH
  mips64el   |      cryptodev-linux-1.13      | NOK | http://autobuild.buildroot.org/results/41868dc7582833323c43cbe0f2e84542bc11e68a | ORPH
   mips64    |      cryptodev-linux-1.13      | NOK | http://autobuild.buildroot.org/results/49725b496d4af9e30346d4828677f6166d3e3652 | ORPH
   mipsel    |      cryptodev-linux-1.13      | NOK | http://autobuild.buildroot.org/results/ac2d3f16643187b0d542279bbab71c30290e1694 | ORPH
    mips     |      cryptodev-linux-1.13      | NOK | http://autobuild.buildroot.org/results/c46165424fb7dad2091e23413a9d4ffeb8d1fd9f | ORPH
  mips64el   |      cryptodev-linux-1.13      | NOK | http://autobuild.buildroot.org/results/0de20b2405959f3ed3ab1c2d49829d2983bb390f | ORPH
  mips64el   |      cryptodev-linux-1.13      | NOK | http://autobuild.buildroot.org/results/7d5f752cbef0d18214be1de21fcd502dc6781fd4 | ORPH
   mipsel    |      cryptodev-linux-1.13      | NOK | http://autobuild.buildroot.org/results/f2ae56a9b33dd42421218afb052b06f3208fa2d9 | ORPH
   armeb     |         directfb-1.7.7         | NOK | http://autobuild.buildroot.org/results/e1458f83676e9617db558b44a8eb5ec8f25f9928 | ORPH
  riscv32    |         directfb-1.7.7         | NOK | http://autobuild.buildroot.org/results/9ef396d679ef8b579b9cf7059077f6923ce8c118 | ORPH
  riscv64    |       docker-cli-27.0.3        | NOK | http://autobuild.buildroot.org/results/727af1b3a6ade8ef864de9e6675d40a12ca0e31a |     
   nios2     |          duma-2.5.21           | NOK | http://autobuild.buildroot.org/results/6238fdf3f88dc5a19205eeaf04811273d9d7e837 | ORPH
    arc      |          ffmpeg-6.1.2          | NOK | http://autobuild.buildroot.org/results/36b6a7c16fb2b01232204faa683e47c31f384a16 |     
  powerpc    |          ffmpeg-6.1.2          | NOK | http://autobuild.buildroot.org/results/4943635bd66509ea8f597c70f07817eb5226a4dc |     
  riscv32    |          ffmpeg-6.1.2          | NOK | http://autobuild.buildroot.org/results/3a57b0651f75cac00643efec6033880050394d54 |     
    arc      |          ffmpeg-6.1.2          | NOK | http://autobuild.buildroot.org/results/3b128ad9c2c705786b921d642facc3b0d399a814 |     
   mipsel    |          ffmpeg-6.1.2          | NOK | http://autobuild.buildroot.org/results/fa02344b7708d8b911884d84b33fc82d49fe0d78 |     
  riscv32    |          ffmpeg-6.1.2          | NOK | http://autobuild.buildroot.org/results/b48f1523c0d358e29bc88344d8501966b49a415a |     
   mipsel    |           file-5.45            | NOK | http://autobuild.buildroot.org/results/9aa2b8e598e2a0ec4c1109508ac121136b6cb1f0 | ORPH
  powerpc    |           file-5.45            | NOK | http://autobuild.buildroot.org/results/3c388d11f712d9844241c0371c6964dbc2bc1095 | ORPH
  powerpc    |           file-5.45            | NOK | http://autobuild.buildroot.org/results/3968674600f305c7838bf9dcb130c1cd8b3e5a4e | ORPH
  aarch64    |        fluent-bit-3.1.3        | NOK | http://autobuild.buildroot.org/results/7da33ea8832d6addb05ab5ed7f735ac60440dc70 |     
   mips64    |          foot-1.16.2           | NOK | http://autobuild.buildroot.org/results/270ecf55bac24e9391c1b2215019c4269b9b75d5 |     
   mipsel    |          foot-1.16.2           | NOK | http://autobuild.buildroot.org/results/a485a5d03b32716051e8c531d82c7ad06cdf9e4c |     
   s390x     |          foot-1.16.2           | NOK | http://autobuild.buildroot.org/results/c9d2e64dfb24b2d645d7c60089c97cc8be577e64 |     
   nios2     |       freeswitch-1.10.12       | NOK | http://autobuild.buildroot.org/results/9ed6868a812a1e6234c471966c18bacc77e5be4d |     
  powerpc    |        gcc-final-13.3.0        | NOK | http://autobuild.buildroot.org/results/df07678234d800c6c2e242fa854f65b8760fb3a8 |     
    or1k     |       gdk-pixbuf-2.42.10       | NOK | http://autobuild.buildroot.org/results/067eee01e91309f3aeb10c0384d40fd94e5e58e7 | ORPH
   xtensa    |       gdk-pixbuf-2.42.10       | NOK | http://autobuild.buildroot.org/results/68bb9a3db9d90ff35758ade59e0fd81976b20a43 | ORPH
    arm      |       gettext-gnu-0.22.4       | NOK | http://autobuild.buildroot.org/results/d2ff0090d6fd3d1b24b864c6bb048f0e09cb96a0 | ORPH
   mipsel    |       gettext-gnu-0.22.4       | NOK | http://autobuild.buildroot.org/results/77b8cc26c0f3fc2e36dc5b8df1c22b46e0f40c09 | ORPH
   arceb     |       gettext-gnu-0.22.4       | NOK | http://autobuild.buildroot.org/results/2213ac4590b5d7f0007b77dc08019d6cfab1aae3 | ORPH
   xtensa    |       gettext-gnu-0.22.4       | NOK | http://autobuild.buildroot.org/results/623c2e0dd4c5930af591edb77a62378e7dff8007 | ORPH
    mips     |       gettext-gnu-0.22.4       | NOK | http://autobuild.buildroot.org/results/efa8b22bc318e189ea30649203b4746de0f1ab7d | ORPH
   arceb     |       gettext-gnu-0.22.4       | NOK | http://autobuild.buildroot.org/results/867f09a28cd93431db3389488d8aa5ac38ed67f9 | ORPH
microblazeel |           git-2.46.0           | NOK | http://autobuild.buildroot.org/results/42610fb4e8443b26e8fb3bdd5973045ab67f5d5b |     
  riscv64    | glibc-2.40-18-g564178076272... | NOK | http://autobuild.buildroot.org/results/0dd4db74b373d4def471cf46bf8544c6c94d3c31 |     
    arc      | glibc-2.40-18-g564178076272... | NOK | http://autobuild.buildroot.org/results/ab59e89594bcf9f96c044f9bed3cf751de77f89d |     
   arceb     | glibc-2.40-18-g564178076272... | NOK | http://autobuild.buildroot.org/results/856b7582e752657a924a5e8923d2d10b60249f4f |     
    arc      | glibc-2.40-18-g564178076272... | NOK | http://autobuild.buildroot.org/results/1b59ff009ecd7c294817c3481c0df22a26a12f42 |     
    arc      | glibc-2.40-18-g564178076272... | NOK | http://autobuild.buildroot.org/results/f8aba3d8462ff167b502f0595d64cd4d4f62e7ad |     
  sparc64    |     gmrender-resurrect-0.1     | NOK | http://autobuild.buildroot.org/results/24e8c2f485f64aabe9a049df43efe794f94a50e5 |     
   mips64    |         gnuplot-6.0.1          | NOK | http://autobuild.buildroot.org/results/0ef0a8834ce810338f53cffa80c771affed73dcd |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.org/results/af7736fcb090a844efdbb2b9c69e767f4e5b25f3 |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.org/results/383da58b9f956cd61466dbbbbb9eb87e613b476d |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.org/results/ca31b4201e78ff3eb6f389a0764f56df6a781721 |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.org/results/7a6e0873474d32313b1c34359977890c5947e3b2 |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.org/results/74190c7656c87ec378b29fa497b6cba9c4046f23 |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.org/results/730f1270780a9833302979291ed8b5c15852f1d0 |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.org/results/8dcff2b3611497d7328a903facfec63d63503dcb |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.org/results/10159e5f8455ccd0ee35a27aacfef6518f9ec0f8 |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.org/results/295bd41cffb67fd75cd67bdebc88656ee7abb681 |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.org/results/5d2cd95613a2835762018db6ec636e29f156cacb |     
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.org/results/2e21f25ed6a8ee26e2b73adff45cdfd0a199441c | ORPH
  powerpc    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.org/results/b9f812b274b1385050a7abe97e3e34a448a827ce | ORPH
    mips     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.org/results/8ac2ec1f867ed571cb1ab7bbbe139b6df0d130a6 | ORPH
   xtensa    |        graphene-1.10.8         | NOK | http://autobuild.buildroot.org/results/7fcdab0c3911762868f0b02c37ec13dc39284747 |     
   armeb     |       host-binutils-2.42       | NOK | http://autobuild.buildroot.org/results/dfbcddecfb1a56c3d370be083ba1ccc3b1ab28d9 |     
 powerpc64   |       host-binutils-2.42       | NOK | http://autobuild.buildroot.org/results/2ba8e9f197bba8192ddad3d80eecbdff3c1ba392 |     
  powerpc    |       host-ccache-4.10.2       | NOK | http://autobuild.buildroot.org/results/24383ac30a8da1c57378e513a4fbdb2faa1aab57 | ORPH
  riscv64    |       host-ccache-4.10.2       | NOK | http://autobuild.buildroot.org/results/136def3fbb10eef53bb3859cb170b16173985bd1 | ORPH
 powerpc64   |      host-doxygen-1.8.18       | NOK | http://autobuild.buildroot.org/results/1e7c1be50876853bac7e5cc39b3f99c4a1ec06c6 | ORPH
   armeb     |      host-librsvg-2.50.9       | NOK | http://autobuild.buildroot.org/results/d8a25ae3bf3c9969c752b7856052dfe69025d630 |     
microblazeel |      host-librsvg-2.50.9       | NOK | http://autobuild.buildroot.org/results/36a442d9ac0adfd94b0ab97733237bc543dff9a1 |     
   nios2     |      host-librsvg-2.50.9       | NOK | http://autobuild.buildroot.org/results/d8024cb9b4349edcaa1c78f4dde4c921f93a6cdb |     
   sh4aeb    |       host-libzlib-1.3.1       | NOK | http://autobuild.buildroot.org/results/bbe828d0d8a7348500ec96ddeeead8978c101bdc | ORPH
   mips64    | host-riscv-isa-sim-00dfa28c... | NOK | http://autobuild.buildroot.org/results/2701b5e898c4d704422f9d006457bf6f10b67588 |     
   s390x     |        host-rust-1.80.1        | NOK | http://autobuild.buildroot.org/results/a057091c0ea3c8d87298a1d5edbc57efb60e5f9a |     
   s390x     |        host-rust-1.80.1        | NOK | http://autobuild.buildroot.org/results/16cc4d62370b6e1655acea5c0dbf4edb9d58669e |     
powerpc64le  |        host-rust-1.80.1        | NOK | http://autobuild.buildroot.org/results/ad0f90246e7b8195e46805cbb3ccd87c933bf377 |     
  sparc64    |        host-rust-1.80.1        | NOK | http://autobuild.buildroot.org/results/0cb14c103a86d9df0c572bedbdee75794c1a92fa |     
  powerpc    |        host-rust-1.80.1        | NOK | http://autobuild.buildroot.org/results/045fa70d93ceff0ef4e8a8dc449fef014b6e09b3 |     
powerpc64le  |        host-rust-1.80.1        | NOK | http://autobuild.buildroot.org/results/7d9387de29bae8fa0cdd82d138e429aeb4ebe5bd |     
  sparc64    |        host-rust-1.80.1        | NOK | http://autobuild.buildroot.org/results/f6d815ccf7496f8911ccbcb34c24d0c862d3dc53 |     
  aarch64    |        host-rust-1.80.1        | NOK | http://autobuild.buildroot.org/results/5725c9865478ea3684540d71e1ab7f3005de49ef |     
  sparc64    |        host-rust-1.80.1        | NOK | http://autobuild.buildroot.org/results/9b9d747380f912e13c1fc8059d10208cd8944ec1 |     
  sparc64    |        host-rust-1.80.1        | NOK | http://autobuild.buildroot.org/results/a8d6eaa06961d3a42b5133f6aae509ed8b7155f8 |     
   x86_64    |        host-rust-1.80.1        | NOK | http://autobuild.buildroot.org/results/9edd45696e10587fdf8edb95f47ffe99e17bc97f |     
   xtensa    |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.org/results/5ae49c2e30a0378f6ea12833c2b057d1b055b958 |     
   sh4eb     |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.org/results/c7e92ee66d42526f31da155694ee960ff50de559 |     
   armeb     |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.org/results/f4e1e9e2207f1230230f2af9f2cc9f7e19d1aba1 |     
   mips64    |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.org/results/3d60eef0e80ca31f6cc842315706d989e5b5eb19 |     
 powerpc64   |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.org/results/7b95fef23628234cea6714c844798221d41feeca |     
   x86_64    |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.org/results/05b849a348a188788ff71cccbc24e15d96967225 |     
    m68k     |          jack2-1.9.22          | NOK | http://autobuild.buildroot.org/results/980b4419302ab625a814b3ea7e694ce9518c1ee3 |     
    or1k     |          jack2-1.9.22          | NOK | http://autobuild.buildroot.org/results/76df07c8d52936b13912dbf82100c17fd43c6e09 |     
    m68k     |          jack2-1.9.22          | NOK | http://autobuild.buildroot.org/results/2863e22ef1f1d8a302226813f8dc5dd715c2c90b |     
   nios2     |         latencytop-0.5         | NOK | http://autobuild.buildroot.org/results/08a91c8e3d7ca06c2525efb5b475d32dbd2cc15e | ORPH
  sparc64    |         libcddb-1.3.2          | NOK | http://autobuild.buildroot.org/results/e0ea6ce4086b6f27f0440dc7dc0e5fd535d041e1 |     
microblazeel |         libcurl-8.9.1          | NOK | http://autobuild.buildroot.org/results/81ac58009b005193f45151b6e6e9e5aa8ab9899a |     
  aarch64    |        libdeflate-1.20         | NOK | http://autobuild.buildroot.org/results/21b9ac48c6af3cac1ea48f375ce6d8a86a68ddea |     
 microblaze  |        libopenssl-3.3.2        | NOK | http://autobuild.buildroot.org/results/40ad60e7f0af968d3b28b47e221ed53bb97e5e82 | ORPH
 microblaze  |        libopenssl-3.3.2        | NOK | http://autobuild.buildroot.org/results/433b6d9b528639989865bad4a8ef68e20774f006 | ORPH
 microblaze  |        libopenssl-3.3.2        | NOK | http://autobuild.buildroot.org/results/f83118049a4cba313e3cd1ccb5be2a30c682e23e | ORPH
microblazeel |        libopenssl-3.3.2        | NOK | http://autobuild.buildroot.org/results/085235c467fc01df3c41ce094491d98ed93f31c1 | ORPH
microblazeel |        libopenssl-3.3.2        | NOK | http://autobuild.buildroot.org/results/77dc0086c2fae3f7eb7bb7e20705897bb11bf60d | ORPH
microblazeel |        libopenssl-3.3.2        | NOK | http://autobuild.buildroot.org/results/fa5e564a5e8829ca021d7758e0e39f8a0d4f8cb4 | ORPH
 microblaze  |        libopenssl-3.3.2        | NOK | http://autobuild.buildroot.org/results/e31c008e0061ae526b5bd26c520542675d00a8f5 | ORPH
   armeb     |         libressl-3.9.2         | NOK | http://autobuild.buildroot.org/results/a1ce8764a20abf2920491d4b2aa9b731315c0677 | ORPH
   xtensa    |          libsepol-3.6          | NOK | http://autobuild.buildroot.org/results/d509a5cb1dca549519e80b32a151bda0c0479242 |     
   xtensa    |          libsepol-3.6          | NOK | http://autobuild.buildroot.org/results/bd0e5eb221339909de0f8953cebe9626aa721a49 |     
   xtensa    |          libsepol-3.6          | NOK | http://autobuild.buildroot.org/results/7a86e025bb0d1f94bff8045639257d12cbac43a1 |     
   xtensa    |          libsepol-3.6          | NOK | http://autobuild.buildroot.org/results/6e838ac3d7918fc3a35eb9580db3f1c111e632cf |     
   x86_64    |         libssh-0.11.0          | NOK | http://autobuild.buildroot.org/results/528170ac4a18fd19ceeff27d074837557430ad26 | ORPH
 microblaze  |         libssh-0.11.0          | NOK | http://autobuild.buildroot.org/results/befac5b441881d45b5815458270cc4c1aa4b1ec0 | ORPH
 microblaze  |         libssh-0.11.0          | NOK | http://autobuild.buildroot.org/results/b11698591ce25852e056231c25054e4c355a6dae | ORPH
   mipsel    |         libssh-0.11.0          | NOK | http://autobuild.buildroot.org/results/736e4ddc5c5a0180ae04cc12b686016d61d339d5 | ORPH
microblazeel |         libssh-0.11.0          | NOK | http://autobuild.buildroot.org/results/d6c1ee4003816ab34729b81d31ef2001766b8bf2 | ORPH
  sparc64    |         libssh-0.11.0          | NOK | http://autobuild.buildroot.org/results/f66168a79a2af3c93317a631e08757f6a8f2e6d5 | ORPH
   sh4eb     |         libssh-0.11.0          | NOK | http://autobuild.buildroot.org/results/53f36fac3b733e6a03e3d9f751069bf859ae1a4b | ORPH
   mipsel    |         libssh-0.11.0          | NOK | http://autobuild.buildroot.org/results/a8138e07d919784bc25e07753299fcd5e892016b | ORPH
    sh4a     |         libssh-0.11.0          | NOK | http://autobuild.buildroot.org/results/f8f343cebf9eb2e4768e1824db46b6fb5b938ca9 | ORPH
   mips64    |         libssh-0.11.0          | NOK | http://autobuild.buildroot.org/results/05ad0e7624dc2b8b7299e7f4afcbb84e7931933e | ORPH
   x86_64    |         libssh-0.11.0          | NOK | http://autobuild.buildroot.org/results/97b333f16d7881ca2cbebcd33a0cbba846df9f51 | ORPH
   sparc     |         libssh-0.11.0          | NOK | http://autobuild.buildroot.org/results/eaabc499c1010d25833553b3dddb6f4577afb265 | ORPH
  sparc64    |         libssh-0.11.0          | NOK | http://autobuild.buildroot.org/results/c81ebea75983c9afbe4dcc3653875421fe3a903c | ORPH
  sparc64    |         libssh-0.11.0          | NOK | http://autobuild.buildroot.org/results/939f810a148915b77e8907c8c573a16d24b1d4f2 | ORPH
   s390x     |         libssh-0.11.0          | NOK | http://autobuild.buildroot.org/results/4501750b152059725e4bfd759230c38aaef92388 | ORPH
   nios2     |         libssh-0.11.0          | NOK | http://autobuild.buildroot.org/results/c1624f4e14b6cf04a7166aaf0cc5b1333b6bfe29 | ORPH
    i686     |         libssh-0.11.0          | NOK | http://autobuild.buildroot.org/results/dca11eb76e017c4faa0c2df885fd275b6f3aead4 | ORPH
  riscv64    |         libssh-0.11.0          | NOK | http://autobuild.buildroot.org/results/f77b4f31c474549995fd009d6b799132c9cf2410 | ORPH
  mips64el   |         libssh-0.11.0          | NOK | http://autobuild.buildroot.org/results/b79d81e3dd75cfded25722f66bc4f34be458fdca | ORPH
powerpc64le  |         libssh-0.11.0          | NOK | http://autobuild.buildroot.org/results/2834768e5379706cda92ba910d956064b7831155 | ORPH
microblazeel |         libssh-0.11.0          | NOK | http://autobuild.buildroot.org/results/b2e940dbc3d766136f83d7cb49280a97cb3d3405 | ORPH
   sh4eb     |         libssh-0.11.0          | NOK | http://autobuild.buildroot.org/results/cfd75d9fc5a50ddc6b61cda91917c876f9ff5ad9 | ORPH
   x86_64    |         libssh-0.11.0          | NOK | http://autobuild.buildroot.org/results/e7fec384355c1889cfcbd71ad9d43cad5a500db5 | ORPH
   armeb     |         libssh-0.11.0          | NOK | http://autobuild.buildroot.org/results/07e265389d1c97a8b00838653bebd2057d0fa368 | ORPH
    or1k     |          libsvg-0.1.4          | NOK | http://autobuild.buildroot.org/results/d3b943fb9b4e4f49fc73bc7ba8601e4646a8a000 |     
   arceb     |          libsvg-0.1.4          | NOK | http://autobuild.buildroot.org/results/4a448e47aa8537a327449a77d2da4c1aa15c47ed |     
    or1k     |         libv4l-1.28.1          | NOK | http://autobuild.buildroot.org/results/b4ba4636728a9c02bc6527ef96b6dea8532b3778 |     
    sh4a     |         libv4l-1.28.1          | NOK | http://autobuild.buildroot.org/results/afe0aeb2001819e278f39dcfe09579cb367c1cf6 |     
   sparc     |         libv4l-1.28.1          | NOK | http://autobuild.buildroot.org/results/6cf2bddef3f31eef21465ee98e13440dca65ca0f |     
    or1k     |          libva-2.22.0          | NOK | http://autobuild.buildroot.org/results/df16c38d82eeefef10a69122b2f3fb0ac772eb8f |     
   mips64    |         libvpl-2.12.0          | NOK | http://autobuild.buildroot.org/results/a8954014839be30dc6102fad1a9143e74b352509 |     
   sparc     |         libxml2-2.13.3         | NOK | http://autobuild.buildroot.org/results/e73d3a504e9e68c711db1bc7ad4a6132dab23d16 |     
   mipsel    |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.org/results/6efe64041bf9a9f0ff21ae8fa72610763b576cfc | ORPH
   mips64    |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.org/results/8bee18c5be674ac72a2e7d53cfbbb9dbc56fec3d | ORPH
   mipsel    |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.org/results/18895a538aec635d71fe10a5e9b1c4e266a32fb7 | ORPH
  powerpc    |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.org/results/2ad57e8697bb134ed714f17158237e16c5d8941b | ORPH
   armeb     |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.org/results/21f21744a288e339a247aa912f85d9039d8bc137 | ORPH
   mipsel    |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.org/results/7dd4ca4e342759ff97aeb7bc79f27f4ea2354c6a | ORPH
   mips64    |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.org/results/db423e24e7b2bddf748cc4167d14c8750ac20eec | ORPH
   mips64    |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.org/results/a680037db21d12ac3b0ed211bfe80d30fa94249a | ORPH
   mipsel    |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.org/results/30b074e968a260ab2fe7ed79353eb68603df5616 | ORPH
  mips64el   |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.org/results/7fb8e6f390a5c4be5d127b79be7c171cc96fe115 | ORPH
    mips     |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.org/results/d13a738a7d714b3fd5827b988dc96e006887c001 | ORPH
   mips64    |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.org/results/f06efd4923faf21f9f6339983bbe4e2fa9791325 | ORPH
    mips     |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.org/results/334b94d5dbc8fea4bb00a7603bfdcd63a1265316 | ORPH
  mips64el   |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.org/results/977866bafe0bf57e477039a97028be3656bb76ac | ORPH
    mips     |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.org/results/a9a48d90088162bcdbc4ed47f2f6066e86e7614a | ORPH
 powerpc64   |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.org/results/0f9e6cc08e0329e6dd034165cb472a0e50d0dce9 | ORPH
  riscv64    |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.org/results/c29bc99b4ca087117b47064062a6eab09d513f03 | ORPH
   armeb     |          linux-6.10.8          | NOK | http://autobuild.buildroot.org/results/523c5e362b6f078fcc9f7f3a95f6ffeac96a9f92 | ORPH
   mips64    |          linux-6.10.8          | NOK | http://autobuild.buildroot.org/results/e84bd329efb6fcd627ac780572585a13dd3235ac | ORPH
  powerpc    |          linux-6.10.8          | NOK | http://autobuild.buildroot.org/results/42f28667994c96dffc6a5c8d2714632a75034f22 | ORPH
    mips     |          linux-6.10.8          | NOK | http://autobuild.buildroot.org/results/b0fd89484b7e5ee02501f2bba40364be22e30af9 | ORPH
  powerpc    |          linux-6.10.8          | NOK | http://autobuild.buildroot.org/results/dfadf5ffcc1a70185c11e28ad3cc90a4db100fb2 | ORPH
powerpc64le  |          linux-6.10.8          | NOK | http://autobuild.buildroot.org/results/76afb3242e4b784399aab65f786fc44d88fe67cc | ORPH
   arceb     |          linux-6.10.8          | NOK | http://autobuild.buildroot.org/results/c011b3e3f570bf45f2b290cd0964c7aeaec9194a | ORPH
    mips     |          linux-6.10.8          | NOK | http://autobuild.buildroot.org/results/3b5fd7e71d4d97600e87fe7bd2bf4ab69e54f35a | ORPH
   mips64    |          linux-6.10.8          | NOK | http://autobuild.buildroot.org/results/10619f8696e0e586e1adfda4f14c035f8e2541cd | ORPH
  powerpc    |          linux-6.10.8          | NOK | http://autobuild.buildroot.org/results/38a84e8ed8eb15aa9cb3da2a8c90d8ed412d3a71 | ORPH
  powerpc    |          linux-6.10.8          | NOK | http://autobuild.buildroot.org/results/1bc452b37f7d3c047882c108bfde2ecb860132c5 | ORPH
 powerpc64   |          linux-6.10.8          | NOK | http://autobuild.buildroot.org/results/98e8ffe0d419a3619b0167bb437ed3b4dd178c6a | ORPH
  powerpc    |          linux-6.10.8          | NOK | http://autobuild.buildroot.org/results/cb7fbb1a7bf52a39a8514a95df993816d7c50166 | ORPH
    arc      |          linux-6.10.8          | NOK | http://autobuild.buildroot.org/results/7dfd0b27870e99874bf34dd32e1df53b9abdf0fb | ORPH
  mips64el   |          linux-6.10.8          | NOK | http://autobuild.buildroot.org/results/59199deef0c441777d0c09bd6441245ccb364dc3 | ORPH
   armeb     |          linux-6.10.8          | NOK | http://autobuild.buildroot.org/results/55b6eb3519fc7a50419205b37409e064773cebb8 | ORPH
   mips64    |          linux-6.10.8          | NOK | http://autobuild.buildroot.org/results/5b61ed55511f5b8a3c83113011a37ff9edd68811 | ORPH
    sh4a     |          linux-6.10.8          | NOK | http://autobuild.buildroot.org/results/7c639d067928e44a9b238e978453fbab185608c4 | ORPH
   xtensa    |          linux-6.10.8          | NOK | http://autobuild.buildroot.org/results/3f828146c9bf734fce8069e063543b0133f0d4ae | ORPH
   sh4aeb    |          linux-6.10.8          | NOK | http://autobuild.buildroot.org/results/5721f31b18499b8b250c2f568f02646e7b10a59f | ORPH
   arceb     |          linux-6.10.8          | NOK | http://autobuild.buildroot.org/results/ceb935a09577466fe15bd0240de0d4f4fc6b3dc6 | ORPH
 powerpc64   |       linux-fusion-9.0.3       | NOK | http://autobuild.buildroot.org/results/ebb1c9713153716681b25a66ca22f99e79888aef | ORPH
  sparc64    |       linux-fusion-9.0.3       | NOK | http://autobuild.buildroot.org/results/a544b2f49cb74925671a14c391150cadd459da82 | ORPH
  sparc64    |       linux-fusion-9.0.3       | NOK | http://autobuild.buildroot.org/results/db5a65fef11a8d2f66a4fade393aae41bcaecf73 | ORPH
   x86_64    |        linux-pam-1.6.1         | NOK | http://autobuild.buildroot.org/results/6708eeb0bd347777a15110df731a323e2ce5cba1 | ORPH
   mips64    |        linux-pam-1.6.1         | NOK | http://autobuild.buildroot.org/results/bb6d51bbab13c6cadc2e1835c0b9f58163058fb0 | ORPH
   sparc     |        linux-pam-1.6.1         | NOK | http://autobuild.buildroot.org/results/0774189b3f827785fa67b0a500d9cb115307e2af | ORPH
   arceb     |        linux-pam-1.6.1         | NOK | http://autobuild.buildroot.org/results/b7317807c71ca5759e2fdec562f3cc03625b9338 | ORPH
   armeb     |        linux-pam-1.6.1         | NOK | http://autobuild.buildroot.org/results/a06f06aaac346e2e8035a99bc00b738992699a91 | ORPH
   nios2     |       lirc-tools-0.10.2        | NOK | http://autobuild.buildroot.org/results/0c2a7700abecd3754fa4826967c0e71b48f72222 | ORPH
  powerpc    | ltrace-82c66409c7a93ca6ad2e... | NOK | http://autobuild.buildroot.org/results/3f67a7c03a227035e815650e5f3ece195a4c1ecd | ORPH
    m68k     | make: *** wait: No child pr... | NOK | http://autobuild.buildroot.org/results/c3a13b459844c72653c46d2e2496c1c7f5cce31b |     
   sparc     |        mariadb-10.11.6         | NOK | http://autobuild.buildroot.org/results/9601549fc6aee4e0b4eeaa165c9631599096c5e3 | ORPH
powerpc64le  |        mariadb-10.11.6         | NOK | http://autobuild.buildroot.org/results/679731bccfed2a56e3c6daf6841cccd20b38a3a9 | ORPH
 aarch64_be  |         mesa3d-24.0.9          | NOK | http://autobuild.buildroot.org/results/855f6787f0ef651157c6943067c66c86cea49082 |     
 aarch64_be  |         mesa3d-24.0.9          | NOK | http://autobuild.buildroot.org/results/71d8e6c8eb63e6c2c0bb75767cb0b7d6d408c785 |     
powerpc64le  |          ntp-4.2.8p18          | NOK | http://autobuild.buildroot.org/results/40f88095e465714739a5c64f60eba9571649a275 |     
   sparc     |      obsidian-cursors-1.0      | NOK | http://autobuild.buildroot.org/results/1b1b624060f72fefd22adf855dd56743f78a2aa8 | ORPH
   mips64    |         openssh-9.8p1          | NOK | http://autobuild.buildroot.org/results/f680b99d3fee26b078a3b5b98032982a8e899676 | ORPH
   mips64    |         openssh-9.8p1          | NOK | http://autobuild.buildroot.org/results/28dc8502b0580660d3268c4d391cbadc79da0062 | ORPH
   mips64    |         openssh-9.8p1          | NOK | http://autobuild.buildroot.org/results/4f974c93327e6ad7f3f9ef1eb7a12dc1d70384c4 | ORPH
   arceb     |            opus-1.4            | NOK | http://autobuild.buildroot.org/results/2bc7aadb46276c88ae2629bb7289d1535ff88698 |     
    arc      |            opus-1.4            | NOK | http://autobuild.buildroot.org/results/07d867f654a7c92845e8ac819c0fb90fd49046c4 |     
   mips64    |          pcre2-10.43           | NOK | http://autobuild.buildroot.org/results/c407ab32d1b048777bdb82d6126d40fcf40bac92 | ORPH
   armeb     |         pixman-0.42.2          | NOK | http://autobuild.buildroot.org/results/fb994364852202f47676544319ae567ace9ab1cf | ORPH
   armeb     |         pixman-0.42.2          | NOK | http://autobuild.buildroot.org/results/f5369ca2e6728c56dadc9414dc62c81740a26ea6 | ORPH
powerpc64le  |         pixman-0.42.2          | NOK | http://autobuild.buildroot.org/results/d477e9ffafdb7c309de21cd3d68411a6fbdeae65 | ORPH
   xtensa    |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/ae5eb5296ba4c72c6e6e05648aeec70b6b9e5e51 | ORPH
  mips64el   |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/0dac79a945b01505814bee04ba5e7c8ae122f63e | ORPH
    mips     |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/8d4845b3aeffd1c3541ed6fd2fae713f308c9077 | ORPH
   mipsel    |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/1d1d2cd01f806626b542d588365d5955841fe4da | ORPH
   sh4eb     |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/1198c93f1ee702e5694731b712abb664fd15ba70 | ORPH
  mips64el   |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/01b8895592bca372c894f0530a01b0271f025599 | ORPH
   armeb     |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/b3926695462d0cbd8502189f75ae320a3e36fc05 | ORPH
   sparc     |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/4a17be459e320ce4dcd1ccd1a78da01259011779 | ORPH
    mips     |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/ec74b2366a8f9740c484098bd3089b58e7e25950 | ORPH
   nios2     |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/8e920d51a7d0b66a5877060856c8c64d7d3e5d52 | ORPH
 powerpc64   |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/c945b18712b1c9ef8ea049c1977ec6ad09c227b9 | ORPH
   mips64    |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/c17d158e6b60e6da690bda6aaaf7d1ce981c693c | ORPH
    i586     |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/16b264e21311818af82ee867e8df98c9dd6fb816 | ORPH
   mipsel    |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/fa1d5eb457bef1e37ed6999d8ad22b4caf83dac5 | ORPH
  mips64el   |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/c2a68028c8ee0ea511f907311d4cebeb265937b3 | ORPH
   armeb     |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/46b87f04c40e7d2cc22135f0ee12d1e835eb2fc6 | ORPH
   s390x     |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/5aa16260f6fad5d39728f66e93485b547c25f0ad | ORPH
   mipsel    |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/990f54967a242a71a3580c96e13e2a5ad7b2ec29 | ORPH
    or1k     |        pulseaudio-17.0         | NOK | http://autobuild.buildroot.org/results/912fb45db65a20239a89c47e70eb8b78fb27b7ca | ORPH
   nios2     |        pulseaudio-17.0         | NOK | http://autobuild.buildroot.org/results/1a0e4e66807cf009371045e5f840fa8ee5e1940d | ORPH
    or1k     |        pulseaudio-17.0         | NOK | http://autobuild.buildroot.org/results/adca4e982ac9683062f75213497de3a932963605 | ORPH
    or1k     |        pulseaudio-17.0         | NOK | http://autobuild.buildroot.org/results/a46c19795a36604972a5c073ecb3747a583cd9ba | ORPH
   nios2     |        pulseaudio-17.0         | NOK | http://autobuild.buildroot.org/results/482db5ca7c8af684fd008704cade43eeee2f6653 | ORPH
    m68k     |        pulseaudio-17.0         | NOK | http://autobuild.buildroot.org/results/afef0a272b2370f7338551ce88574e6e066d0209 | ORPH
   nios2     |        pulseaudio-17.0         | NOK | http://autobuild.buildroot.org/results/b9f42f1530ef6b52f54a1687f7373ae3f4a3e467 | ORPH
 powerpc64   |    python-autocommand-2.2.2    | NOK | http://autobuild.buildroot.org/results/51ab29c81cbc1504493d3d7be88cbca44bedc755 |     
powerpc64le  |      python-daemon-3.0.1       | NOK | http://autobuild.buildroot.org/results/e80c06538630b019bc9b6ef2c036199a0affcab6 |     
  mips64el   |     python-remi-2022.7.27      | NOK | http://autobuild.buildroot.org/results/7530ef72783d00c4f1dd79f363c7289dc73e42e6 |     
   mipsel    |           qemu-9.0.2           | NOK | http://autobuild.buildroot.org/results/7ad4a27b8a13369697e87ea0c2d0c9a22ec1e7c3 |     
powerpc64le  |          quagga-1.2.4          | NOK | http://autobuild.buildroot.org/results/f58b1eb37c695f89ae278e29bc91bfab91b2d60f | ORPH
  sparc64    |         s6-dns-2.3.7.2         | NOK | http://autobuild.buildroot.org/results/e41bf117343bbc8a4a3105135486be7e1951178d |     
   mipsel    |          sdl2-2.30.6           | NOK | http://autobuild.buildroot.org/results/444143a7a87426943f2066942572469c65c92ce8 |     
powerpc64le  |          sdl2-2.30.6           | NOK | http://autobuild.buildroot.org/results/ab76547e517e7d51a73f51d83a5f89ce1ae6fd2d |     
   armeb     |          trinity-1.9           | NOK | http://autobuild.buildroot.org/results/6ab7377d0967ef582c7c680539b48c1f7f0152b3 | ORPH
    or1k     |         uclibc-1.0.50          | NOK | http://autobuild.buildroot.org/results/f4c5c1e62aef1f255b8e0fec2132180a6e6bb187 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.org/results/67813ac7fcce7d98cd73368125989d93a0009bd0 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.org/results/a7e1d9c3e50c3c032490f91f021dbdb4bf0f70e9 |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.org/results/4612859283fa77e3686cbc5f7c19b6ae36cd267a |     
    mips     |            unknown             | NOK | http://autobuild.buildroot.org/results/e1d7a0009f9e24f7a6680d1bd6263acbe265adba |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.org/results/3fc846e43203f157ce15c8f8b8e63fc815063552 |     
    m68k     |            unknown             | NOK | http://autobuild.buildroot.org/results/ade86b355c9f3ce443c9fa8e658b5f7f33e1dbf5 |     
  riscv32    |            unknown             | NOK | http://autobuild.buildroot.org/results/f6c6033bfc8c6fc516a8f22b11abed3ec5e2746f |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.org/results/be75068f52dedd55983a55cc8e549575b70dbfd2 |     
  powerpc    |        valgrind-3.23.0         | NOK | http://autobuild.buildroot.org/results/993f0609090fb4b44da0b79d2fd9ece63cb393db | ORPH
  powerpc    |        valgrind-3.23.0         | NOK | http://autobuild.buildroot.org/results/a271d307aff8cbee23b3513b5c64f709fbe7fe1a | ORPH
   nios2     | wilc-driver-linux4microchip... | NOK | http://autobuild.buildroot.org/results/f1b3f4aea703b3410093a2c18758cd66f38b0f77 |     
  mips64el   |         wolfssl-5.7.2          | NOK | http://autobuild.buildroot.org/results/a1a083a04e6fce4a62ac39531c60fdd0735ffef6 |     
   x86_64    |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.org/results/eba83b1fdc3abf035064defc24167c5f284de6e9 |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

                  bcusdk-0.0.5 | 2 
                    fcft-3.1.6 | 1 
  gobject-introspection-1.76.1 | 1 
               host-go-1.21.13 | 1 
host-vboot-utils-bbdd62f9b0... | 1 
               libvorbis-1.3.7 | 1 
ltrace-82c66409c7a93ca6ad2e... | 1 
                  ntp-4.2.8p18 | 1 
                     nut-2.8.1 | 1 
               openblas-0.3.26 | 1 
                 openssh-9.7p1 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  powerpc    |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.org/results/275bb5cec35b519c9ae60231f9ba37575b4f069b |     
    arm      |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.org/results/6f8b1037c240056ddeec9a4bbaf883ac87b6a59f |     
  aarch64    |           fcft-3.1.6           | NOK | http://autobuild.buildroot.org/results/1fee4538356c6f6a588b9056ee613d5b31f474e5 |     
  powerpc    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.org/results/1a850c1f5f325467681726be9c5e18e035c2e70a | ORPH
   mips64    |        host-go-1.21.13         | NOK | http://autobuild.buildroot.org/results/7fd761bac6b40712918f14594e09df36dd33f7ab |     
  powerpc    | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.org/results/2310bb2c240dd17f529939dd16babbcfdf4dabe1 |     
  powerpc    |        libvorbis-1.3.7         | NOK | http://autobuild.buildroot.org/results/3475249b37a2dd3305c1389aceb5a131bbc80911 |     
   x86_64    | ltrace-82c66409c7a93ca6ad2e... | NOK | http://autobuild.buildroot.org/results/1406dfb392be87f1155b34accc7a953e67e703a1 | ORPH
    arm      |          ntp-4.2.8p18          | NOK | http://autobuild.buildroot.org/results/35d7e2c579e511d80110ea721f1fac00b04033a3 |     
  mips64el   |           nut-2.8.1            | NOK | http://autobuild.buildroot.org/results/fd3a35a5ca54aadac5a4cdcd7a3e372eccbdcf1a |     
  mips64el   |        openblas-0.3.26         | NOK | http://autobuild.buildroot.org/results/c4e4b8d6c4854dc4425992a5eab06e3157451b8c |     
powerpc64le  |         openssh-9.7p1          | NOK | http://autobuild.buildroot.org/results/761e7bcd074411ccc8d3ac477a97f3b07a080e30 | ORPH


Classification of failures by reason for 2024.05.x
--------------------------------------------------

         python-remi-2022.7.27 | 2 
                   botan-3.3.0 | 1 
                    cramfs-2.1 | 1 
                  dhcpdump-1.8 | 1 
                    eza-0.18.8 | 1 
                    fcft-3.1.6 | 1 
glibc-2.39-74-g198632a05f6c... | 1 
                gnu-efi-3.0.18 | 1 
         gobject-introspection | 1 
host-heimdal-f4faaeaba371ff... | 1 
         host-libxcrypt-4.4.36 | 1 
                   linux-tools | 1 
                  mupdf-1.22.0 | 1 
                 openssh-9.7p1 | 1 
               procps-ng-4.0.4 | 1 
             strongswan-5.9.13 | 1 
                       unknown | 1 


Detail of failures for 2024.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |          botan-3.3.0           | NOK | http://autobuild.buildroot.org/results/7e87f13d9bb26190a13a4f92a0143e4092de4f5b | ORPH
  riscv32    |           cramfs-2.1           | NOK | http://autobuild.buildroot.org/results/2fc4b2697d5a9f3ebfd7d556ff1c7c3e1b4ed093 |     
   x86_64    |          dhcpdump-1.8          | NOK | http://autobuild.buildroot.org/results/5cfab9fbccaadbfb0f7ffce74d59f42b156827d8 | ORPH
    arm      |           eza-0.18.8           | NOK | http://autobuild.buildroot.org/results/f973b015ea85c559907efce3ae4cc478d0809fc7 |     
 aarch64_be  |           fcft-3.1.6           | NOK | http://autobuild.buildroot.org/results/02f8b92dfc2183ab1d8cb1cb8094ba1b19cc4a66 |     
powerpc64le  | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.org/results/9958b1a9938df9f09594455ba9f12811a3068b2a |     
  aarch64    |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.org/results/fbe98e39ac8e0b0566751a2754f30db708f8d4c8 |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.org/results/6410c6cd3ddf584e2e368245c9e87d0d6dfef751 |     
 microblaze  | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.org/results/a9a0f12c114a485883d81a9965319b126d2fe105 | ORPH
    arc      |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.org/results/564f0d0df31da73b7cbf42dccba67ba9b91f8be8 |     
    arc      |          linux-tools           | NOK | http://autobuild.buildroot.org/results/6ef160a6aad36ca0981295bcc72ffe73aca6dc88 | ORPH
    arm      |          mupdf-1.22.0          | NOK | http://autobuild.buildroot.org/results/7bf61ca686d3282a44987109316b871ed495210d |     
   mips64    |         openssh-9.7p1          | NOK | http://autobuild.buildroot.org/results/3d32c63884b9dfaebad9b3db6aef8c654db658d8 | ORPH
   mips64    |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.org/results/3663cc4239c94516def794b6fa76dc89eec1cbf5 | ORPH
powerpc64le  |     python-remi-2022.7.27      | NOK | http://autobuild.buildroot.org/results/2f95eb677d19e7183273783bfe6589ff99a1fa11 |     
    sh4      |     python-remi-2022.7.27      | NOK | http://autobuild.buildroot.org/results/70860b24e7d9ae9c5dd5eaf2fa7c7330d0c0fd69 |     
  sparc64    |       strongswan-5.9.13        | NOK | http://autobuild.buildroot.org/results/196c6dedc3b2756566f79c372a05afdfbad2747c |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.org/results/773dbd1ddfb83cadd71048ee1d63b25b5af94b2b |     


Classification of failures by reason for 2024.08.x
--------------------------------------------------

              fluent-bit-3.1.3 | 1 
            host-skopeo-1.13.3 | 1 
           mediastreamer-4.4.8 | 1 
                 openssh-9.8p1 | 1 


Detail of failures for 2024.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |        fluent-bit-3.1.3        | NOK | http://autobuild.buildroot.org/results/f13284d7e24b7b1e3d5ab66b83af04e01cc088b4 |     
  mips64el   |       host-skopeo-1.13.3       | NOK | http://autobuild.buildroot.org/results/2e5b458efd67fb6a51bb6b0c23be2640e10d4d45 |     
    or1k     |      mediastreamer-4.4.8       | NOK | http://autobuild.buildroot.org/results/2df773ef639639e18078a6c31961ad5e30201b06 | ORPH
    mips     |         openssh-9.8p1          | NOK | http://autobuild.buildroot.org/results/20a9e6e4435b77c4d5e270bc0f5ffb4b87abc495 | ORPH


Gitlab CI results for 2024-09-12
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
                       am574x_idk | https://gitlab.com/buildroot.org/buildroot/-/jobs/7803199588  |      
                   armadeus_apf27 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7803199613  |      
                  at91sam9260eknf | https://gitlab.com/buildroot.org/buildroot/-/jobs/7803199627  |      
                   at91sam9g20dfc | https://gitlab.com/buildroot.org/buildroot/-/jobs/7803199629  |      
                 at91sam9g45m10ek | https://gitlab.com/buildroot.org/buildroot/-/jobs/7803199630  |      
                     at91sam9rlek | https://gitlab.com/buildroot.org/buildroot/-/jobs/7803199639  |      
                 at91sam9x5ek_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/7803199647  |      
             at91sam9x5ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/7803199653  |      
   atmel_sama5d27_som1_ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/7803199656  |      
   atmel_sama5d2_xplained_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/7803199665  |      
       atmel_sama5d3_xplained_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/7803199678  |      
   atmel_sama5d3_xplained_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/7803199681  |      
                 atmel_sama5d3xek | https://gitlab.com/buildroot.org/buildroot/-/jobs/7803199686  |      
       atmel_sama5d4_xplained_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/7803199701  |      
   atmel_sama5d4_xplained_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/7803199713  |      
                        bananapro | https://gitlab.com/buildroot.org/buildroot/-/jobs/7803199754  | ORPH 
                      beelink_gs1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7803199780  |      
                     canaan_kd233 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7803199785  |      
                  chromebook_snow | https://gitlab.com/buildroot.org/buildroot/-/jobs/7803199789  |      
                             ci20 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7803199790  |      
                      cubieboard2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7803199793  |      
            engicam_imx6qdl_icore | https://gitlab.com/buildroot.org/buildroot/-/jobs/7803199794  |      
        engicam_imx6qdl_icore_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7803199797  |      
        engicam_imx6qdl_icore_rqs | https://gitlab.com/buildroot.org/buildroot/-/jobs/7803199798  |      
              engicam_imx6ul_geam | https://gitlab.com/buildroot.org/buildroot/-/jobs/7803199799  |      
             engicam_imx6ul_isiot | https://gitlab.com/buildroot.org/buildroot/-/jobs/7803199800  |      
          freescale_t2080_qds_rdb | https://gitlab.com/buildroot.org/buildroot/-/jobs/7803199834  | ORPH 
           friendlyarm_nanopi_r2s | https://gitlab.com/buildroot.org/buildroot/-/jobs/7803199838  |      
          globalscale_espressobin | https://gitlab.com/buildroot.org/buildroot/-/jobs/7803199842  |      
                        imx6slevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/7803199854  |      
               imx6ulz_bsh_smm_m2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7803199865  |      
                        imx7dpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/7803199869  |      
               kontron_pitx_imx8m | https://gitlab.com/buildroot.org/buildroot/-/jobs/7803199885  |      
              kontron_smarc_sal28 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7803199888  |      
                         lego_ev3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7803199894  |      
               linksprite_pcduino | https://gitlab.com/buildroot.org/buildroot/-/jobs/7803199898  |      
                       ls1028ardb | https://gitlab.com/buildroot.org/buildroot/-/jobs/7803199901  |      
                     ls1046a-frwy | https://gitlab.com/buildroot.org/buildroot/-/jobs/7803199902  |      
                mender_x86_64_efi | https://gitlab.com/buildroot.org/buildroot/-/jobs/7803199904  | ORPH 
      microchip_sam9x60ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/7803199911  |      
...hip_sama5d27_wlsom1_ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/7803199913  |      
    microchip_sama5d2_icp_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/7803199916  |      
      microchip_sama7g5ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/7803199918  |      
                          mx6udoo | https://gitlab.com/buildroot.org/buildroot/-/jobs/7803199927  |      
              octavo_osd32mp1_brk | https://gitlab.com/buildroot.org/buildroot/-/jobs/7803199942  |      
              octavo_osd32mp1_red | https://gitlab.com/buildroot.org/buildroot/-/jobs/7803199943  |      
                        odroidxu4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7803199947  |      
                   orangepi_lite2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7803199966  |      
                orangepi_one_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/7803199970  |      
                  pine64_pinecube | https://gitlab.com/buildroot.org/buildroot/-/jobs/7803199997  |      
                    pine64_sopine | https://gitlab.com/buildroot.org/buildroot/-/jobs/7803199999  |      
                qemu_aarch64_sbsa | https://gitlab.com/buildroot.org/buildroot/-/jobs/7803200004  |      
                qemu_aarch64_virt | https://gitlab.com/buildroot.org/buildroot/-/jobs/7803200007  |      
                    qemu_arm_ebbr | https://gitlab.com/buildroot.org/buildroot/-/jobs/7803200009  |      
             qemu_ppc64le_pseries | https://gitlab.com/buildroot.org/buildroot/-/jobs/7803200056  |      
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/7803200139  | ORPH 
                        riotboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/7803200161  |      
                           rock64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7803200169  |      
                       rock_pi_n8 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7803200170  |      
            sipeed_lichee_rv_dock | https://gitlab.com/buildroot.org/buildroot/-/jobs/7803200181  |      
             sipeed_licheepi_zero | https://gitlab.com/buildroot.org/buildroot/-/jobs/7803200184  |      
               snps_arc700_axs101 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7803200194  |      
                 snps_arc700_nsim | https://gitlab.com/buildroot.org/buildroot/-/jobs/7803200196  | ORPH 
                snps_archs38_hsdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/7803200202  |      
                socrates_cyclone5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7803200203  |      
              toradex_apalis_imx6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7803200239  |      
                           ts4900 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7803200241  | ORPH 
                           ts7680 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7803200245  |      
                         uevm5432 | https://gitlab.com/buildroot.org/buildroot/-/jobs/7803200249  |      



-- 
http://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
