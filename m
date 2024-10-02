Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABE9DCF3194
	for <buildroot@archiver.kernel.org>; Wed,  2 Oct 2024 03:17:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 159E580D67;
	Wed,  2 Oct 2024 03:17:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zN-j73pczCmi; Wed,  2 Oct 2024 03:17:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B5B188132A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B5B188132A;
	Wed,  2 Oct 2024 03:17:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D61551BF2F6
 for <buildroot@lists.busybox.net>; Wed,  2 Oct 2024 03:17:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C61A460859
 for <buildroot@lists.busybox.net>; Wed,  2 Oct 2024 03:17:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dES2KMe13IY6 for <buildroot@lists.busybox.net>;
 Wed,  2 Oct 2024 03:17:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::632; helo=mail-ej1-x632.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 809AD60652
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 809AD60652
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 809AD60652
 for <buildroot@buildroot.org>; Wed,  2 Oct 2024 03:17:46 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a8d60e23b33so914798166b.0
 for <buildroot@buildroot.org>; Tue, 01 Oct 2024 20:17:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727839064; x=1728443864;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2IP+/JNpCSC1OlX6Z2NSWnFMY913QiDZWE10RjZsTp4=;
 b=Lky7Fk2o4Siml5Z+J44TFTCYuykTx4oYHAWB6eD+y8QZzp257OG+gnsUIlOJP2bhcY
 STfRyhhkCXV2v4zuBGfttInWyY3y8pmPLY67RoNUzizSjCZDRt94+lXuELsfeSJNrFRK
 8Scs1OIhJQqu9MnWCNZGZRWpmasr4kAoAdNC6eik9hOEkwzPk2/QgXiCTavTxHfIz9NY
 FdsUpquFF7M79slmaOGnO3rNGAXjynyVUXV2IoVbPYPHfwO+klQ2A5y9l4fIgowidYaT
 6/Xm8szWL0rQ+5QrEvf11urQq7v4mg+MN2Yk2SBPu1fUYH0w2QmaxEMRCTvoYAKk5ayZ
 mM2g==
X-Gm-Message-State: AOJu0YxjMCojkDFzI1IESUveEebbT+3PM206ckZxBU/IIw7dfMTPiTxv
 XFuxnl3NaJHLfeSz8Uw82/vsHYNr5fCGo/tNV9qvklWLYupIdevBbYTv8g==
X-Google-Smtp-Source: AGHT+IExDsSvJjWJF6NC/IoUBcWq+OCqKSFGKGJElE2By5Fq7hKck1p0JTaL78f5ZMUY6lKRUGe72A==
X-Received: by 2002:a17:907:2d87:b0:a91:15ba:7387 with SMTP id
 a640c23a62f3a-a98f8207cbbmr151793266b.12.1727839063763; 
 Tue, 01 Oct 2024 20:17:43 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93c2979d88sm797684166b.156.2024.10.01.20.17.43
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Oct 2024 20:17:43 -0700 (PDT)
Message-ID: <66fcbb57.170a0220.3b6a0c.babb@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Wed, 02 Oct 2024 03:17:43 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727839064; x=1728443864; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=2IP+/JNpCSC1OlX6Z2NSWnFMY913QiDZWE10RjZsTp4=;
 b=ORrUwhOk6XFPGB3JIFBAj/vhMGLfm+xE5U+N4inVEbeJO6q8DZ4E3yCpEOVQkw5XZ/
 wET00l7rUhjE8NzF/MhkaoEPvJKanr2stVmMKqq7Il0ubvFxBSrT9rFl2mrZLVzb7Vz1
 W01df0EXfjkx+mmFmCcbeUExxMEV9fsn63MHTc7VQUbR5lRSihu6KKoT+Zig2X+zkbIZ
 Lzi/PEW9s3Ftg7qZjXb3aI4JIKw93Oqvznx53izUN8I3959oBiytqcqDI8PhkPq4B1l9
 AOTmJRBSQFroSxfn7i2u9xFDVrcetVY8RSVkr2U8gILpOXxyAqoSajkMWHlOLzsUV73k
 ToYg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=ORrUwhOk
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2024-10-01
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

Autobuild statistics for 2024-10-01
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  6  |  7  |  0  | 13  |
  2024.05.x  | 16  | 24  |  0  | 40  |
  2024.08.x  |  2  |  6  |  1  |  9  |
    master   | 15  | 239 |  0  | 254 |

Classification of failures by reason for master
-----------------------------------------------

host-gobject-introspection-... | 28
                 host-tar-1.35 | 19
                host-m4-1.4.19 | 15
             bluez5_utils-5.77 | 14
          host-binutils-2.43.1 | 9 
 host-binutils-bare-metal-2.42 | 9 
       host-gcc-initial-14.2.0 | 8 
                libcurl-8.10.1 | 8 
                  linux-6.10.9 | 8 
               procps-ng-4.0.4 | 8 
            host-binutils-2.42 | 7 
                host-gperf-3.1 | 6 
       host-gettext-gnu-0.22.4 | 5 
                 gnuplot-6.0.1 | 4 
       host-gcc-initial-12.4.0 | 4 
aubio-152d6819b360c2e7b379e... | 3 
            host-autoconf-2.72 | 3 
           host-librsvg-2.50.9 | 3 
                 libiconv-1.15 | 3 
                   libidn-1.42 | 3 
                  libsepol-3.6 | 3 
android-tools-4.2.2+git2013... | 2 
                  bind-9.18.28 | 2 
                    brltty-6.6 | 2 
            host-binutils-2.41 | 2 
               host-gawk-5.3.1 | 2 
       host-gettext-tiny-0.3.2 | 2 
              libopenssl-3.3.2 | 2 
          linux-5.10.162-cip24 | 2 
                memtest86-6.20 | 2 
                  ntp-4.2.8p18 | 2 
                 pixman-0.42.2 | 2 
      python-autocommand-2.2.2 | 2 
                acpitool-0.5.1 | 1 
                 apache-2.4.62 | 1 
               arp-scan-1.10.0 | 1 
                    attr-2.5.2 | 1 
                    azmq-1.0.3 | 1 
                   bash-5.2.21 | 1 
                     bc-1.07.1 | 1 
             berkeleydb-5.3.28 | 1 
                    bsdiff-4.3 | 1 
                   bzip2-1.0.8 | 1 
          cryptodev-linux-1.13 | 1 
                  dlib-19.24.6 | 1 
                 dmidecode-3.6 | 1 
                  ffmpeg-6.1.2 | 1 
                    fmt-11.0.2 | 1 
                   foot-1.16.2 | 1 
       freeradius-server-3.2.6 | 1 
            gettext-gnu-0.22.4 | 1 
        gmrender-resurrect-0.1 | 1 
                 highway-1.2.0 | 1 
                host-acl-2.3.2 | 1 
              host-bison-3.8.2 | 1 
                host-cpio-2.15 | 1 
                 host-gdb-15.1 | 1 
                host-gmp-6.3.0 | 1 
                host-go-1.22.7 | 1 
                 host-isl-0.26 | 1 
           host-libiberty-2.41 | 1 
            host-libtool-2.4.6 | 1 
               host-make-4.4.1 | 1 
                host-mpc-1.3.1 | 1 
              host-rust-1.80.1 | 1 
                latencytop-0.5 | 1 
               libcgicc-3.2.20 | 1 
libdbi-drivers-0bfae6c43134... | 1 
                libdrm-2.4.123 | 1 
                 libv4l-1.28.1 | 1 
                  libva-2.22.0 | 1 
     linux-5.10.162-cip24-rt10 | 1 
                   linux-tools | 1 
                 openssh-9.8p1 | 1 
                pipewire-1.2.2 | 1 
              skalibs-2.14.2.0 | 1 
                       unknown | 1 
                 wolfssl-5.7.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |         acpitool-0.5.1         | NOK | https://autobuild.buildroot.org/results/cd186e1011884a09652e5b812a8008e868d1f87d |     
   arceb     | android-tools-4.2.2+git2013... | NOK | https://autobuild.buildroot.org/results/e0ea963e2f7ed07ab6e43944b921eca25a0745b6 |     
  mips64el   | android-tools-4.2.2+git2013... | NOK | https://autobuild.buildroot.org/results/7a9175fed0c3e83c19e79b706102df42f83e538e |     
   s390x     |         apache-2.4.62          | NOK | https://autobuild.buildroot.org/results/02a8fe74757dbaef01c8a20ee244c6a72ed44e63 |     
   arceb     |        arp-scan-1.10.0         | NOK | https://autobuild.buildroot.org/results/66ee26677777124eafb4740a3c7437e06f704f98 |     
 aarch64_be  |           attr-2.5.2           | NOK | https://autobuild.buildroot.org/results/a29734e26af6a293f9fffcb151fb1a4b137b430b |     
 microblaze  | aubio-152d6819b360c2e7b379e... | NOK | https://autobuild.buildroot.org/results/488c970d425b145fe0122d36c24bc59a95775b7e |     
   armeb     | aubio-152d6819b360c2e7b379e... | NOK | https://autobuild.buildroot.org/results/8b818c02e132012d683841e1236a6b922c03404d |     
    or1k     | aubio-152d6819b360c2e7b379e... | NOK | https://autobuild.buildroot.org/results/90af8e0ca1fd0ee99efcf50d4246d1663fe9beca |     
microblazeel |           azmq-1.0.3           | NOK | https://autobuild.buildroot.org/results/8c87529e165291a70bb8378ae80b1f0789752b50 |     
   arceb     |          bash-5.2.21           | NOK | https://autobuild.buildroot.org/results/e2809e42304043d8194bbc6720b56866d8aa1403 | ORPH
    arc      |           bc-1.07.1            | NOK | https://autobuild.buildroot.org/results/96a19568f5b6f87bf67c509475fc42adffa0b810 | ORPH
   xtensa    |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/0da492ceb0190ca21c4e4ba8835f58cba2e68193 | ORPH
   mipsel    |          bind-9.18.28          | NOK | https://autobuild.buildroot.org/results/7dc34ef04b58d03145bc3f982ee025108811b557 | ORPH
 aarch64_be  |          bind-9.18.28          | NOK | https://autobuild.buildroot.org/results/283dca0f87c5cccbb4f81d8536b5eb32e9bef501 | ORPH
   nios2     |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/318bbaefc57e514b0d1cd9c7f50a9e4654e14c6a |     
    or1k     |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/8979843d23ce914fe1f0aaf69fc66ce68e2e13c3 |     
  mips64el   |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/8f364ab58940a0a9eefe0af9826ebf3acbc3e2c6 |     
   arceb     |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/eb2751e13e0a22f360c36c87f1cf159569187794 |     
   sh4eb     |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/9ff8c2f267437f12bba6c031da386e69da739d28 |     
    mips     |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/d25b24d989fb5cee63cc4aacaf9d3eb2eb6123ad |     
   x86_64    |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/d24e204ef2064ad54cdf16931ae0609d53e2cfc8 |     
  mips64el   |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/fc8024ef7e6dcab8a14a33f40b72a347636abdc0 |     
    or1k     |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/9648ae0322b782fa7b5188b5d3e6fe5f56b15c1e |     
   armeb     |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/70856fb5ae928d2f2e1c6f23f18b47d3d26782fd |     
    mips     |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/c978e09b531d726775bf26812ec2cc2d3a9f80f2 |     
  sparc64    |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/c90d54d92ce9d84e8187ac14eb3954ba857a163f |     
 powerpc64   |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/fad46ef1b3468e26797a6510f34c1514b8a35f0b |     
  mips64el   |       bluez5_utils-5.77        | NOK | https://autobuild.buildroot.org/results/24ece42860314a8d77d11156f035c91f79a03fd5 |     
powerpc64le  |           brltty-6.6           | NOK | https://autobuild.buildroot.org/results/bf0058f06fb20ac454a9b5b9ef8fd23d7ce81935 |     
microblazeel |           brltty-6.6           | NOK | https://autobuild.buildroot.org/results/611784eaab102cb4ddee5b15f9a4b1b478c6d916 |     
   mips64    |           bsdiff-4.3           | NOK | https://autobuild.buildroot.org/results/a114b644941d03a2eaa5e9160caf16e129ce0ce4 | ORPH
powerpc64le  |          bzip2-1.0.8           | NOK | https://autobuild.buildroot.org/results/bf5f3b85c3347b7225f7974ad288d46f24bc7d4c | ORPH
   mips64    |      cryptodev-linux-1.13      | NOK | https://autobuild.buildroot.org/results/f3cf2716f0f0009e55ba76d5572ab8d50d1eede0 | ORPH
   armeb     |          dlib-19.24.6          | NOK | https://autobuild.buildroot.org/results/22a5dbd5d3eb00237140a953c00545938e6f1b73 |     
   x86_64    |         dmidecode-3.6          | NOK | https://autobuild.buildroot.org/results/2d8d7c21e55d5f92294f0a103c377b201f506b04 |     
  riscv32    |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/6296937013b94fd1494e157198390183f938025b |     
 microblaze  |           fmt-11.0.2           | NOK | https://autobuild.buildroot.org/results/0e1fa7126c6cbe70c1da531b8c51fac309bb27af |     
    or1k     |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/bdf84ea709a893ed43a56eb09573522611589268 |     
    m68k     |    freeradius-server-3.2.6     | NOK | https://autobuild.buildroot.org/results/f2623960aee4279129720e9464b55d73efbd648e |     
   sparc     |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/2c5c9fbf1061cf4b659f1a8541c36b120d12fed4 | ORPH
  mips64el   |     gmrender-resurrect-0.1     | NOK | https://autobuild.buildroot.org/results/2a801e5abf4b4cc8093b3e75d8f0a0920c749217 |     
   nios2     |         gnuplot-6.0.1          | NOK | https://autobuild.buildroot.org/results/832535df849bdad42a1b34ec682ea805288d955b |     
    mips     |         gnuplot-6.0.1          | NOK | https://autobuild.buildroot.org/results/aad6decef40e2aa980481b9ebebbca65d14687ef |     
microblazeel |         gnuplot-6.0.1          | NOK | https://autobuild.buildroot.org/results/63472b306b8d4399f76fb976c7f73ec88b60ba95 |     
microblazeel |         gnuplot-6.0.1          | NOK | https://autobuild.buildroot.org/results/610e792d6e48ed50c01f625255022fc7d4454d18 |     
  riscv64    |         highway-1.2.0          | NOK | https://autobuild.buildroot.org/results/73881b9fbc5de1eb9060d7636d3b58c15a406df9 |     
   mips64    |         host-acl-2.3.2         | NOK | https://autobuild.buildroot.org/results/c6518a1cac54a5cc0b298bf1851ba791a9ed7033 |     
   x86_64    |       host-autoconf-2.72       | NOK | https://autobuild.buildroot.org/results/137cf7e82cc1833792eaed2c81efdb6af82d9f64 | ORPH
 microblaze  |       host-autoconf-2.72       | NOK | https://autobuild.buildroot.org/results/e9f262058f7a47d5228358957a4f6bdf93a7b26b | ORPH
   sparc     |       host-autoconf-2.72       | NOK | https://autobuild.buildroot.org/results/8516bf556edc9ddaf7b9f7b358eb6c29f967a632 | ORPH
  powerpc    |       host-binutils-2.41       | NOK | https://autobuild.buildroot.org/results/38e0c43655b779868ad1ac35127b7dab91a03133 |     
microblazeel |       host-binutils-2.41       | NOK | https://autobuild.buildroot.org/results/915e4fd6fed530520f2642b010148b6c2cc9bcc8 |     
powerpc64le  |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/1b5a1fd62679790e87e664a3b43ffe8c1be814b2 |     
    mips     |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/f0c55b9333db959662bae6cee0cc672f5ff63c54 |     
   mips64    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/b9c8bcb7cbfc6efcb39d4bd62218932ead836a09 |     
   mips64    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/90dead9dad4715d4598b67ba10441035e754f8f4 |     
   x86_64    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/55bbab4f703bdeb7bc88baf0f8e566f4ffd19a36 |     
  powerpc    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/0f8ee42a00e811c0a7df21ace947b0ac27001aa4 |     
    mips     |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/006f6372a171325d7775888bd73de917e99413d7 |     
  aarch64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/fbd0be8b715dfc8b658bedd2df1285a10f2c840c |     
  sparc64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/3e6a26730caebb2076bf500b4fe97469f5a3a97b |     
   sh4eb     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/4116fcc662d17267f516f1f01412217d180a4547 |     
   s390x     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/37666253b5007a63ab1f693bdee1ec9e1b020371 |     
   armeb     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/594eda5b42e841ab2db17b0ee5050037f8899a44 |     
   arceb     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/0050a122330168ed7c126ba6101951e6ef9e6b1e |     
  powerpc    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/37eeb5c59455ccee87019b6b8589eaa8bfebd25c |     
  aarch64    |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/d27da34267e0c4f7c6998da5ad1876666ea188d9 |     
   armeb     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/3717d0782d7315c51060e12d3ba0c1c354f7e4ed |     
    or1k     | host-binutils-bare-metal-2.42  | NOK | https://autobuild.buildroot.org/results/0f98a09dcfe6eac5afebd4273a8b5c1ea343e21d |     
    mips     | host-binutils-bare-metal-2.42  | NOK | https://autobuild.buildroot.org/results/d4fa8b2194cfeb8cfbf3c185f00e8c338bf2182a |     
  riscv64    | host-binutils-bare-metal-2.42  | NOK | https://autobuild.buildroot.org/results/79b7293e36f221b703ca305646163b2e0b6de590 |     
    i686     | host-binutils-bare-metal-2.42  | NOK | https://autobuild.buildroot.org/results/e2a2ab54783138f7abf4f6aca6f0e9526bffdd7f |     
powerpc64le  | host-binutils-bare-metal-2.42  | NOK | https://autobuild.buildroot.org/results/e6bb49b76c0b69563f015961bf98022e64f031c2 |     
   x86_64    | host-binutils-bare-metal-2.42  | NOK | https://autobuild.buildroot.org/results/7abb410f454998968109a18aa5df00cdc88a9d73 |     
  mips64el   | host-binutils-bare-metal-2.42  | NOK | https://autobuild.buildroot.org/results/17d8e496314fcaaf41a2f42ebebae2f6fa687e8b |     
    m68k     | host-binutils-bare-metal-2.42  | NOK | https://autobuild.buildroot.org/results/54a47176a8dbc43985d4b51bda6eac7356c4eeb7 |     
    m68k     | host-binutils-bare-metal-2.42  | NOK | https://autobuild.buildroot.org/results/8fa0a2c3a501fe976e7e324ce14f986e2568e035 |     
    or1k     |        host-bison-3.8.2        | NOK | https://autobuild.buildroot.org/results/00bae42a8a0e6c00da0337c80fb6fa28936f9ed9 | ORPH
  sparc64    |         host-cpio-2.15         | NOK | https://autobuild.buildroot.org/results/b83835d951f6364d2adb94d620a39a4c24e6c270 |     
   s390x     |        host-gawk-5.3.1         | NOK | https://autobuild.buildroot.org/results/fb218a6bebce91199b1d4e84f106cf9471c04316 | ORPH
 aarch64_be  |        host-gawk-5.3.1         | NOK | https://autobuild.buildroot.org/results/03cab606cb7df494dd01e06820d878805dadd6f3 | ORPH
    mips     |    host-gcc-initial-12.4.0     | NOK | https://autobuild.buildroot.org/results/b123ffcb938fb7533ee9fad6f6d2d76ec7657ce0 |     
   mips64    |    host-gcc-initial-12.4.0     | NOK | https://autobuild.buildroot.org/results/1739d5becedc0b28dba4d64836ea4d12ec344889 |     
 microblaze  |    host-gcc-initial-12.4.0     | NOK | https://autobuild.buildroot.org/results/125e0af6ade474c26bc5fe8b385fc49bbe5a6394 |     
    arc      |    host-gcc-initial-12.4.0     | NOK | https://autobuild.buildroot.org/results/7553e6d33ea2aea9946f5e71e66920d11f6fb6cb |     
   s390x     |    host-gcc-initial-14.2.0     | NOK | https://autobuild.buildroot.org/results/234949744a9b8ae0ca197ce532c1612e09219302 |     
    mips     |    host-gcc-initial-14.2.0     | NOK | https://autobuild.buildroot.org/results/6e29b2ad4c9360bdb8788eafc44d6ea54960c90d |     
    or1k     |    host-gcc-initial-14.2.0     | NOK | https://autobuild.buildroot.org/results/f2cec98c65775b4af2620793d6053eec170856af |     
  aarch64    |    host-gcc-initial-14.2.0     | NOK | https://autobuild.buildroot.org/results/1623580426dc5066a2333369369d372d3a21df00 |     
   s390x     |    host-gcc-initial-14.2.0     | NOK | https://autobuild.buildroot.org/results/68affaad7fcf650533ea885a0fb760b4a3c1d88d |     
   sparc     |    host-gcc-initial-14.2.0     | NOK | https://autobuild.buildroot.org/results/61a240893a7772c1a1541cc09c6efd8e624d18d1 |     
  sparc64    |    host-gcc-initial-14.2.0     | NOK | https://autobuild.buildroot.org/results/24468c15a2f92d7b93a391eb58b0593667b69571 |     
   x86_64    |    host-gcc-initial-14.2.0     | NOK | https://autobuild.buildroot.org/results/0667d70dc56303fe9c8affa5773bd00da55aef1f |     
   mips64    |         host-gdb-15.1          | NOK | https://autobuild.buildroot.org/results/99cd4253ab30a1f0e13c92042fc51fbfe23c1a6f | ORPH
  mips64el   |    host-gettext-gnu-0.22.4     | NOK | https://autobuild.buildroot.org/results/0f69fc8886d8896c2444bd30ddc6ede53c61b78f | ORPH
   mipsel    |    host-gettext-gnu-0.22.4     | NOK | https://autobuild.buildroot.org/results/4a3f93096a0fa24b7ef87d78c6a94fa06b95cd53 | ORPH
   mips64    |    host-gettext-gnu-0.22.4     | NOK | https://autobuild.buildroot.org/results/0a00fbd3046969ebad8ba16beaee2afcaeddb016 | ORPH
    or1k     |    host-gettext-gnu-0.22.4     | NOK | https://autobuild.buildroot.org/results/900932c1aec0cb3cf8baacac6f6b2592dd1ffa47 | ORPH
   nios2     |    host-gettext-gnu-0.22.4     | NOK | https://autobuild.buildroot.org/results/72663e2c3c22d05eef3d4be71f819ea5f157d627 | ORPH
 microblaze  |    host-gettext-tiny-0.3.2     | NOK | https://autobuild.buildroot.org/results/53d4ae801aa6c8876fe5ff9a6222dd02a9dfa1b3 |     
    m68k     |    host-gettext-tiny-0.3.2     | NOK | https://autobuild.buildroot.org/results/a42eb1e2b3492a9add4abf77ca8c72eebdde914b |     
    or1k     |         host-gmp-6.3.0         | NOK | https://autobuild.buildroot.org/results/3cee9c39596d82c0cebc18c0968c456f80630a7b | ORPH
   armeb     |         host-go-1.22.7         | NOK | https://autobuild.buildroot.org/results/c34717cb59bd85156fa9cb9b40c37c37ef3d53b2 |     
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/42f06f3a8d99db9c1e4cbfd290db082a1bf69075 | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/08b58e1286ba92c5dccb8fa89584e783c70e3ebf | ORPH
   sh4aeb    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/678b67c67cbf703fccf5a197ff3b308472e119c2 | ORPH
    or1k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/4e966098442b2fcd00005aa86593bdaa9fffaf63 | ORPH
   mipsel    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/27db98e765592410c259388d38a905335fdbcb4c | ORPH
 powerpc64   | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/e3d9161cad255c2e332e37e56ba6256eaa45e944 | ORPH
   nios2     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/96a9311109b0b1841f48a1530fba13d56ad71f07 | ORPH
    i586     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/f63699a6427759a12245d0d20847b0f234974bb8 | ORPH
microblazeel | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/1e497db66c806b1a4a3a6836edfdd935839f659b | ORPH
 powerpc64   | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/efdec3d2a546699772f9cf1a1b820377676b937a | ORPH
 microblaze  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/0cda8efeb79ae2ec9111bcc940aa07373cc89897 | ORPH
    or1k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/5150254e1ba928f1816283937874e02535355f66 | ORPH
   mipsel    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/151d1f2b8e88f914d08869adcbef32c0cc2e4b75 | ORPH
   mipsel    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/dcee0d4f3efaaf1aef4f7ea807c16270b6a61b53 | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/c0b4d5445e1809749488e3e04f7d05cd3e8ee32e | ORPH
   nios2     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/6a2f804243c727436440199afb785c0a3aebbcc9 | ORPH
 microblaze  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/b88c3b7b6dc4099a464d6591567cf8235c7cfdf9 | ORPH
   nios2     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/47f3e2a78fb2a6e1f7e457c77f91faa8700228fc | ORPH
microblazeel | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/a9c14da1c530e77105e2ca3d7fda6ae4f3eb594f | ORPH
   mipsel    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/2be15ede78b0e430acfb848744e6ef863474c84f | ORPH
   s390x     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/d674393245e9845a2fe688b5770a031992256f42 | ORPH
 powerpc64   | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/325eb7800dfeef95bc92e8fa0384719be35a4183 | ORPH
 microblaze  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/435aff682c056410aba944c0cd8a1eab0322ed5f | ORPH
  sparc64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/84852f71444ff52ba30ff00da02dd05391f67b49 | ORPH
   x86_64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/66d6ee2b2d5444d7b30122770f29333075463f8c | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/62494f827d76329727355e2776b9e26c689afaa8 | ORPH
   nios2     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/e46382c5779fefec70dd93d2257bce01e6e559ef | ORPH
  riscv32    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/66cf1158dff6f3f14d2ee9b99762e8af81ec9eb1 | ORPH
   x86_64    |         host-gperf-3.1         | NOK | https://autobuild.buildroot.org/results/e1ed4fb23143450f77618cd8bb3b0f669bff09c1 | ORPH
   mipsel    |         host-gperf-3.1         | NOK | https://autobuild.buildroot.org/results/b67e483c7a576001aa1bfed1da2adf29af898eb4 | ORPH
   x86_64    |         host-gperf-3.1         | NOK | https://autobuild.buildroot.org/results/468a48671632b826d176612a7d8511f8e41e2e44 | ORPH
   nios2     |         host-gperf-3.1         | NOK | https://autobuild.buildroot.org/results/e448e55fb4935026bb1b6eb10f5ca0e3b45303f8 | ORPH
   s390x     |         host-gperf-3.1         | NOK | https://autobuild.buildroot.org/results/cdd3c17d1de3985ef6885545431b5eac5e860aa6 | ORPH
   nios2     |         host-gperf-3.1         | NOK | https://autobuild.buildroot.org/results/55541250cd232a559193728f4dea72916a256a91 | ORPH
 aarch64_be  |         host-isl-0.26          | NOK | https://autobuild.buildroot.org/results/3140cbb70408a8394d27db4a8297cc959bbefeb4 | ORPH
   x86_64    |      host-libiberty-2.41       | NOK | https://autobuild.buildroot.org/results/2c060048f482ba85e1d1dfdbee3e3d6716bb2a74 |     
    or1k     |      host-librsvg-2.50.9       | NOK | https://autobuild.buildroot.org/results/8fbffa7edba98cbf0376925d08580dc2824cb330 |     
  riscv32    |      host-librsvg-2.50.9       | NOK | https://autobuild.buildroot.org/results/654203f1f6495c5d02a79736a3a2b17143b9e144 |     
    i686     |      host-librsvg-2.50.9       | NOK | https://autobuild.buildroot.org/results/95d9ae80c969506ce89cdd0cc57440e5233dbf36 |     
powerpc64le  |       host-libtool-2.4.6       | NOK | https://autobuild.buildroot.org/results/b80d8306f52ff269511d0a684d84d577cf734871 | ORPH
   s390x     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/ddd3e42b15788dcd6cbdb59c94502811abb6a1db | ORPH
   xtensa    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/605057e1f4bceb0d58dff4151e76f1d9036acfd4 | ORPH
  riscv32    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/6cc4d210d824a08f5151a2c0acf512f0c3822c76 | ORPH
   sh4eb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/f5cc45e80b04c402a4b5b65aa956307aea84d801 | ORPH
   arceb     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/35e184ee0a1047f19772ef3721c7424c4f0e290c | ORPH
  sparc64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/66f28b52c1a620f019dadf47d056cd41992cbc30 | ORPH
   xtensa    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/4bf9f24ba53979304f518000b1f4caac33739a8c | ORPH
    i686     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/80ab41f25bce01019d80a2a0370ef9fad00a8fe1 | ORPH
    i686     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/ad65d1692b635e597e5e6ca8a9617aa92e1a67d1 | ORPH
    i686     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/a8acc121da241f404a256379072c9b7f0cf1313d | ORPH
  powerpc    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/6e89ee88eedf43c3698b522f22f92865b6221120 | ORPH
   mips64    |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/48bf881fbde8f6540b3ea8b5b10a0cbc331a5910 | ORPH
    arm      |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/695bd0a2ec04590e2b1ef4ba78109a1e2ccfa6fb | ORPH
    mips     |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/bb77e5a3d86534bd9153b49a4e9c6475ca0dbfde | ORPH
 powerpc64   |         host-m4-1.4.19         | NOK | https://autobuild.buildroot.org/results/f217c92c03e9a8f53a9ae9a88f3f343b6ef18a1d | ORPH
   arceb     |        host-make-4.4.1         | NOK | https://autobuild.buildroot.org/results/d0bf9bbf9b7e02c3acc4c5e5046b89024a847dee | ORPH
microblazeel |         host-mpc-1.3.1         | NOK | https://autobuild.buildroot.org/results/5ae6a53091bcb41d23a92be11e9b5d8624dd07fb | ORPH
   s390x     |        host-rust-1.80.1        | NOK | https://autobuild.buildroot.org/results/50850423d9ef6f24e1e0483edada5aacf03397db |     
   sparc     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/ab9d002a584f4f3c1382d444df9e80eea9c34509 | ORPH
 powerpc64   |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/6942296c9ce9ca38efcd77ec5b397752be4889a0 | ORPH
powerpc64le  |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/1785c0aac978b2bf48f54ec31c149b855d4c46e4 | ORPH
   s390x     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/b6d7968cefd04a40d8a5035daf967c6359e5c715 | ORPH
   sh4eb     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/7e0f385e2f0108ebc14f706ff0902b6b5fdc9198 | ORPH
    mips     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/93dc06afb726ef0daa6ac138b23c5f84a5c0d50a | ORPH
 microblaze  |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/65e9ce04d0e8eab4b161d0c7148693dec7f06259 | ORPH
   xtensa    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/e6096e0dc8aa39e63ec1e2328bb5c7673c350e2f | ORPH
  powerpc    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/3dbb205fbcbe237bc59ce1aa4deb2ce8629eefe7 | ORPH
   nios2     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/a9288f51c0abd221b1b5d066dfb04ab2b1fb95a7 | ORPH
   sparc     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/b3793f848c7504a58548b6c6f85226844fdb3600 | ORPH
    sh4a     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/35ec473dce91cc9b89797397418595ca1c10f641 | ORPH
   nios2     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/f26528e2e0fb89df7e642f1df1c3d595121b6b22 | ORPH
powerpc64le  |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/ef0a0add3ddbc7caf3de540dc999f7e46899a87b | ORPH
  aarch64    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/cecbe0cd13da5dbeeee447efc608d068c1922209 | ORPH
    sh4a     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/2aaceda4a111ac977cb028ea70cc3b616d73e1ea | ORPH
    m68k     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/4b34ef7f8e66ebaeaa59847174a55de57d4f2abe | ORPH
   sparc     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/36066eef3fbe5855774f6f1c0a0645236432de94 | ORPH
  riscv64    |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/45696eeb3d9858d1cb2bb63cc56d3392aacf9ea3 | ORPH
  sparc64    |         latencytop-0.5         | NOK | https://autobuild.buildroot.org/results/6cd54efb19222fe1a2e560ea435770324075f132 | ORPH
  riscv64    |        libcgicc-3.2.20         | NOK | https://autobuild.buildroot.org/results/36cbdc81a6cb454761da03137b744aeee76b616a |     
 aarch64_be  |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/f30dada3be371731a938246c244b994c6a047048 |     
  sparc64    |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/ffa0c2c1c4de22b359f98f4fa4f0f0291603e46b |     
 powerpc64   |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/41b26ee700c6a6d5cdba7f59b9af4be4d008f499 |     
  riscv64    |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/b41cde5b9a1559e8ead4401676ec2107597f3e3f |     
   mips64    |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/c89efee1bced30c5b5c5d882c1860c14f5f10f48 |     
   s390x     |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/74e570ab8c202140ccc88a8ecef055a0f487f543 |     
   armeb     |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/b23b31a3178764429fcc1686fa2907a181fe6428 |     
  mips64el   |         libcurl-8.10.1         | NOK | https://autobuild.buildroot.org/results/e391de663df5d4b2e6bbd0bea4648de22d01ec7a |     
    m68k     | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/d3d9149c5cd44322377bdfab9f00ea155a6749ff |     
   sparc     |         libdrm-2.4.123         | NOK | https://autobuild.buildroot.org/results/89fad1b4a23352a568500ad02087749462db00c7 |     
   x86_64    |         libiconv-1.15          | NOK | https://autobuild.buildroot.org/results/62431c0baab95eb54d6aef9ca8d5a952ddda2d78 | ORPH
  riscv64    |         libiconv-1.15          | NOK | https://autobuild.buildroot.org/results/7dc0dd7edcf0ca0526ba2353765a622ffe197bfc | ORPH
 microblaze  |         libiconv-1.15          | NOK | https://autobuild.buildroot.org/results/189692634d931f9d9c45febf9853cc9d8daa3098 | ORPH
microblazeel |          libidn-1.42           | NOK | https://autobuild.buildroot.org/results/a6cd51569c9b7b2079f10f9d5b5a0effc9ebaa9c |     
   mipsel    |          libidn-1.42           | NOK | https://autobuild.buildroot.org/results/0929b058d6c113911f28bb0eee5a3af0a7dae7ca |     
microblazeel |          libidn-1.42           | NOK | https://autobuild.buildroot.org/results/4c90802a58f7e098774e0657c57635b83a807168 |     
 microblaze  |        libopenssl-3.3.2        | NOK | https://autobuild.buildroot.org/results/79682ab3adecd7f7df20a07fd652a6328d7fbd1f | ORPH
microblazeel |        libopenssl-3.3.2        | NOK | https://autobuild.buildroot.org/results/2690316911339523d1fb77ce269126e54b94bc7a | ORPH
   xtensa    |          libsepol-3.6          | NOK | https://autobuild.buildroot.org/results/9401bf4b470179bbdef8d5423cc25e61c9847e3e |     
  riscv64    |          libsepol-3.6          | NOK | https://autobuild.buildroot.org/results/fa22f1df31eaf29de309f6e8e34f7fef70d2242f |     
  riscv64    |          libsepol-3.6          | NOK | https://autobuild.buildroot.org/results/c2ad303c91aae07ab7fe49f62a7f8a57c94077bb |     
   mipsel    |         libv4l-1.28.1          | NOK | https://autobuild.buildroot.org/results/2719cf10a2853c1887db6b641ea85bf2d2362812 |     
    mips     |          libva-2.22.0          | NOK | https://autobuild.buildroot.org/results/59b447e2345ca9f407bfd101d442fce8f8f2a689 |     
   armeb     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/c3fab3616cdc6a4284aa30f02c0775ed53e07b5c | ORPH
    m68k     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/b2a791b0f5ed5ebc9a97a355624628ef61ec0fbc | ORPH
  powerpc    |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/32775ed9437e64fd388c824e153d103e96b06816 | ORPH
   mips64    |          linux-6.10.9          | NOK | https://autobuild.buildroot.org/results/74740bee975debda184cca075923a96a84e83980 | ORPH
 powerpc64   |          linux-6.10.9          | NOK | https://autobuild.buildroot.org/results/8144eadc2a6fbbdf732ee91290acd60de700077c | ORPH
  mips64el   |          linux-6.10.9          | NOK | https://autobuild.buildroot.org/results/0a638be0435e18118972473f6e8262c2a17abaae | ORPH
    mips     |          linux-6.10.9          | NOK | https://autobuild.buildroot.org/results/ec5e73dd7436d4d2cd4aab6dfc6705be4573bd0e | ORPH
  mips64el   |          linux-6.10.9          | NOK | https://autobuild.buildroot.org/results/bb83b949073e3e1329f06fff0f25a8835a53d1ac | ORPH
   s390x     |          linux-6.10.9          | NOK | https://autobuild.buildroot.org/results/ff4be08ed31bbf2cc152b6a60281958bb968fb3c | ORPH
    sh4a     |          linux-6.10.9          | NOK | https://autobuild.buildroot.org/results/9d62cc15ee88139fcfef2a1f49c71e498b04d211 | ORPH
    arc      |          linux-6.10.9          | NOK | https://autobuild.buildroot.org/results/2cf4fdd39a0944e3dad4a5df6a53ce4a94689743 | ORPH
   sparc     |          linux-tools           | NOK | https://autobuild.buildroot.org/results/1eae19eec649eed952df42f632ee31ed09cfaaaf | ORPH
    i686     |         memtest86-6.20         | NOK | https://autobuild.buildroot.org/results/2deebcc6ce21f31fb35e22096b0d52c22e638d30 |     
    i686     |         memtest86-6.20         | NOK | https://autobuild.buildroot.org/results/901cfc91cd68faf8e9a2fc6ae489c1546af182e1 |     
   armeb     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/a07f11d10e036d53c3cb7cf6332216dc9e60a423 |     
   mips64    |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/b462fdc7aebf250f2567f617dd65a2f6cc0878c4 |     
   mipsel    |         openssh-9.8p1          | NOK | https://autobuild.buildroot.org/results/392467cefecc3c7873ef8b2b86c12f4d54ccffdb | ORPH
    or1k     |         pipewire-1.2.2         | NOK | https://autobuild.buildroot.org/results/eea636784f23bf3f462d763d92d4833c42e35b01 |     
powerpc64le  |         pixman-0.42.2          | NOK | https://autobuild.buildroot.org/results/5f12c9fafc98b98372970c72a64136fc1739dbbf | ORPH
    arm      |         pixman-0.42.2          | NOK | https://autobuild.buildroot.org/results/bc0e04fcb0d32f79f0c2a653e7a351de9e29a9b2 | ORPH
    or1k     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/cb8fd5896ff1e5ac2d7ddd7b158d280e798e5465 | ORPH
 microblaze  |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/974f1960d200c4052c18b648aad0cd7c115481f8 | ORPH
 aarch64_be  |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/6f945a2c9f2ff2e0e173d2d87ff22bb232b91cd9 | ORPH
 microblaze  |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/87e1052de403848871a161d431fe98e7960863c1 | ORPH
   sparc     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/185e944f9d1072eaefb1c3017db76af2e40f5e51 | ORPH
    arc      |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/aedf85d0a6adfb64ae6b2c95e685bde81832912e | ORPH
 microblaze  |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/b69c544b45664166801677415b0433d669c22001 | ORPH
   xtensa    |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/b012ac40634d27aec1362759f4b554e6158191f4 | ORPH
   s390x     |    python-autocommand-2.2.2    | NOK | https://autobuild.buildroot.org/results/8a20eeff37d6a545f4449d8af3ee3587a6113743 |     
   sh4aeb    |    python-autocommand-2.2.2    | NOK | https://autobuild.buildroot.org/results/4ceaddfcab6c231bbb8c999a128f1dddd6469d31 |     
    or1k     |        skalibs-2.14.2.0        | NOK | https://autobuild.buildroot.org/results/376fdc4db89d4c861e104db12749040377e21c33 |     
  mips64el   |            unknown             | NOK | https://autobuild.buildroot.org/results/970320932b2b7e1fb4438cf8171a296a52938dcf |     
  mips64el   |         wolfssl-5.7.2          | NOK | https://autobuild.buildroot.org/results/40324686a748142677b563600c714880d96a989b |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

            host-cdrkit-1.1.11 | 2 
                host-acl-2.3.2 | 1 
        host-python-lxml-5.1.0 | 1 
               libglib2-2.76.1 | 1 
                  linux-6.6.50 | 1 
           python-rtoml-0.10.0 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   xtensa    |         host-acl-2.3.2         | NOK | https://autobuild.buildroot.org/results/d7a4596b06692b22c2836e68cd6c38723a5ba5f9 |     
    mips     |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/be00e948de626e423faae64dbaf4db47f98cfb01 |     
   arceb     |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/c6fa6d7f722aacecd6b53bb2dd49c44d97a6101c |     
   mips64    |     host-python-lxml-5.1.0     | NOK | https://autobuild.buildroot.org/results/8fbe7286f5b50d1e546e05d71db4d3d2d345f6a7 |     
   arceb     |        libglib2-2.76.1         | NOK | https://autobuild.buildroot.org/results/1cb0f1e86e74d54734a6a78ad095ecee150c19d7 |     
 powerpc64   |          linux-6.6.50          | NOK | https://autobuild.buildroot.org/results/b013c9946feb5fc57944f79eba4390e12a264ba6 | ORPH
  powerpc    |      python-rtoml-0.10.0       | NOK | https://autobuild.buildroot.org/results/ed76409f159c8042426f6fadf37b39cf1303158a |     


Classification of failures by reason for 2024.05.x
--------------------------------------------------

                  ffmpeg-6.1.2 | 2 
                host-go-1.22.5 | 2 
          libcamera-apps-1.2.1 | 2 
              skalibs-2.12.0.1 | 2 
              fftw-quad-3.3.10 | 1 
                   foot-1.16.2 | 1 
            gdk-pixbuf-2.42.10 | 1 
glibc-2.39-74-g198632a05f6c... | 1 
  gobject-introspection-1.76.1 | 1 
             host-delve-1.22.1 | 1 
host-heimdal-f4faaeaba371ff... | 1 
              host-rust-1.74.1 | 1 
                 libp11-0.4.12 | 1 
         lttng-modules-2.13.10 | 1 
           mediastreamer-4.4.8 | 1 
                    ola-0.10.9 | 1 
               procps-ng-4.0.4 | 1 
             strongswan-5.9.13 | 1 
                       unknown | 1 
               valgrind-3.22.0 | 1 


Detail of failures for 2024.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 microblaze  |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/2ae390c4c3ced70647b2e81f1de5f705bbff31c3 |     
 microblaze  |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/a6c9acec70255006155e6a1cec2d72af253e7c70 |     
 powerpc64   |        fftw-quad-3.3.10        | NOK | https://autobuild.buildroot.org/results/50bb3a9abfd5e41127d04e789c6c6f3bd4b4a438 | ORPH
 microblaze  |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/48ad7c5330998ce67d54a745405d4a5839a657ca |     
    arm      |       gdk-pixbuf-2.42.10       | NOK | https://autobuild.buildroot.org/results/0cbeda3be814a82903b2669531650e1be41028a7 | ORPH
   arceb     | glibc-2.39-74-g198632a05f6c... | NOK | https://autobuild.buildroot.org/results/0bf4b281e7a080bab2e01bd2a4febd1fbcad3864 |     
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/4789b2f983060b9303510d69b56905c4f30acc44 | ORPH
    arm      |       host-delve-1.22.1        | NOK | https://autobuild.buildroot.org/results/0c4445dc6c60a645910b9d79e34add3a40c6c2dd |     
   mips64    |         host-go-1.22.5         | NOK | https://autobuild.buildroot.org/results/f11c3fdeebfcc1834369dc7e4c61860f7355a696 |     
   mips64    |         host-go-1.22.5         | NOK | https://autobuild.buildroot.org/results/4b5bc96d3a9e2aea41512621ee84d7fddcdda44a |     
  mips64el   | host-heimdal-f4faaeaba371ff... | NOK | https://autobuild.buildroot.org/results/a6654b8bac51829adf4958ea8f6fff99ba4372e8 | ORPH
   x86_64    |        host-rust-1.74.1        | NOK | https://autobuild.buildroot.org/results/1e06e5ad3e86aff6f0799d9d080d8b5213d99bd6 |     
 aarch64_be  |      libcamera-apps-1.2.1      | NOK | https://autobuild.buildroot.org/results/718c492180d72920cc5b2ea2319b90827a6d0b92 |     
powerpc64le  |      libcamera-apps-1.2.1      | NOK | https://autobuild.buildroot.org/results/36ad56fcde5b40fa243abc440686a261692013db |     
 powerpc64   |         libp11-0.4.12          | NOK | https://autobuild.buildroot.org/results/a778dbc6503a21b714311d5f57ba47b8bd89dc8f | ORPH
powerpc64le  |     lttng-modules-2.13.10      | NOK | https://autobuild.buildroot.org/results/16efa350d8e6cec57c664655689ada63fd039ae6 |     
    i686     |      mediastreamer-4.4.8       | NOK | https://autobuild.buildroot.org/results/bcacd372720e7bf7306d0096ad7cc26797935bc2 | ORPH
  sparc64    |           ola-0.10.9           | NOK | https://autobuild.buildroot.org/results/408a140cffacb83a9782775b39a575d5bef54ee3 |     
   mips64    |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/20bd0a64db4bf93f3388b5600dd7ff879339c9a9 | ORPH
    m68k     |        skalibs-2.12.0.1        | NOK | https://autobuild.buildroot.org/results/468f68e5f0b3a6b2d86714a49e671627a1f11fa6 |     
   sparc     |        skalibs-2.12.0.1        | NOK | https://autobuild.buildroot.org/results/011f5dff37e56361b4c5cd3af5c1c5d7cfc739ea |     
   nios2     |       strongswan-5.9.13        | NOK | https://autobuild.buildroot.org/results/f1cf2ce1774aa69f22d58b2e42108fc594c0543c |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/b6d550ef93838208f5414e5eeab2f938166934ec |     
    mips     |        valgrind-3.22.0         | NOK | https://autobuild.buildroot.org/results/093cee2fc97a3c262e350dbe7067ee2f01ae3556 | ORPH


Classification of failures by reason for 2024.08.x
--------------------------------------------------

                  linux-6.10.9 | 2 
        gmrender-resurrect-0.1 | 1 
         gobject-introspection | 1 
            host-ccache-4.10.1 | 1 
              host-rust-1.79.0 | 1 
               procps-ng-4.0.4 | 1 


Detail of failures for 2024.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   arceb     |     gmrender-resurrect-0.1     | NOK | https://autobuild.buildroot.org/results/f2fdaca33f3f20df0e295cb03737660031ff31f4 |     
microblazeel |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/7487438f16b68f9f9525248e868959dafaaac887 |     
powerpc64le  |       host-ccache-4.10.1       | NOK | https://autobuild.buildroot.org/results/b303adda09983ff0ffde42f28694b1aab12042e1 | ORPH
  sparc64    |        host-rust-1.79.0        | NOK | https://autobuild.buildroot.org/results/ef1283090b0606ed7a17e552ba71376b4d9b171d |     
   mipsel    |          linux-6.10.9          | NOK | https://autobuild.buildroot.org/results/edcbf1d0e9bba847ef5b42c165f5527d919ae8f6 | ORPH
  powerpc    |          linux-6.10.9          | NOK | https://autobuild.buildroot.org/results/25da1c8e71877ca9ed1f16bff5262383073534d4 | ORPH
    arm      |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/7c5b7ccd0d23aad35f44ddcc021f5129fe46f3de | ORPH



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
