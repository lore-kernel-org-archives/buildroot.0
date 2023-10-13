Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC8BACDB47E
	for <buildroot@archiver.kernel.org>; Fri, 13 Oct 2023 05:34:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0714D8227B;
	Fri, 13 Oct 2023 05:34:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0714D8227B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dlhZ1QNfoI0j; Fri, 13 Oct 2023 05:34:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AA489822A1;
	Fri, 13 Oct 2023 05:34:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AA489822A1
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BB8041BF30A
 for <buildroot@lists.busybox.net>; Fri, 13 Oct 2023 05:34:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8D51261015
 for <buildroot@lists.busybox.net>; Fri, 13 Oct 2023 05:34:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8D51261015
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lscfzT5f2VVR for <buildroot@lists.busybox.net>;
 Fri, 13 Oct 2023 05:34:36 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 90C706100D
 for <buildroot@buildroot.org>; Fri, 13 Oct 2023 05:34:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 90C706100D
Received: by mail.gandi.net (Postfix) with ESMTPSA id A625040008
 for <buildroot@buildroot.org>; Fri, 13 Oct 2023 05:34:32 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Fri, 13 Oct 2023 05:34:32 -0000
X-GND-Sasl: bot@bootlin.com
Message-Id: <20231013053437.8D51261015@smtp3.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1697175272; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=CNwLfRY2kvZWudh6nGjFP82d1uCF4Gjb87CbAqYoV6g=;
 b=PWdnnCP4Uy2ztCcPKhPYvETZ9piWFKBvy3lFb03cqWMig28VaE6TFjnAGkY2CmWK+soSSE
 R553WyuebscOJWAFQ8GUIsDVl2Av9kSQvF2m+MLeRCqsTH2bY18cPkPeEM75RO3QJrBbYu
 CJX4beH2CWsfy1P+LuqBZ+KgVWTm8cydGG89kCLmXj5cYElG7JmG9ITLJmfkAcT/0SP5BK
 m5kApVDKXSWKBYydV93XYGTBToektjefyxrJ0zb2jwicFypXpPWQHFyHI2zH89hPVkv2tk
 Na5VKSi3EGAsWqEgsUuxgZFfvAWePtd7qBG9GbEu24huNs0thsidNc8Pe0ZldA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=PWdnnCP4
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-10-12
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

Hello,

Autobuild statistics for 2023-10-12
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  | 14  |  4  |  0  | 18  |
  2023.08.x  | 11  |  7  |  1  | 19  |
    master   | 75  | 107 |  2  | 184 |

Classification of failures by reason for master
-----------------------------------------------

                 openrc-0.43.3 | 13
         spirv-tools-1.3.261.1 | 10
               alsa-lib-1.2.10 | 7 
  gobject-introspection-1.76.1 | 6 
             alsa-utils-1.2.10 | 5 
                elfutils-0.189 | 5 
                       unknown | 5 
                   bird-2.0.12 | 3 
               mariadb-10.11.4 | 3 
              gcc-final-11.4.0 | 2 
              gcc-final-12.3.0 | 2 
glibc-2.38-27-g750a45a78390... | 2 
         host-gcc-final-12.3.0 | 2 
                host-go-1.21.2 | 2 
              libarchive-3.7.2 | 2 
libdill-32d0e8b733416208e04... | 2 
                     pound-4.8 | 2 
               apcupsd-3.14.14 | 1 
                    attr-2.5.1 | 1 
bayer2rgb-neon-15feb1115b48... | 1 
                    brltty-6.5 | 1 
                busybox-1.36.1 | 1 
          cryptodev-linux-1.13 | 1 
                    flac-1.4.3 | 1 
              gcc-final-13.2.0 | 1 
            gdk-pixbuf-2.42.10 | 1 
         gobject-introspection | 1 
                heirloom-mailx | 1 
         host-gcc-final-11.4.0 | 1 
     host-ncurses-6.4-20230603 | 1 
              host-rust-1.71.1 | 1 
           libfreeimage-3.18.0 | 1 
              libnetfilter_log | 1 
              libostree-2023.6 | 1 
                libselinux-3.5 | 1 
               libsigsegv-2.14 | 1 
                libsoup-2.74.3 | 1 
          linux-5.10.162-cip24 | 1 
                   linux-6.5.6 | 1 
               linux-pam-1.5.3 | 1 
              memcached-1.6.21 | 1 
                  monit-5.33.0 | 1 
                     nmap-7.92 | 1 
              open-iscsi-2.1.9 | 1 
                      pdbg-3.5 | 1 
                   perl-5.36.1 | 1 
                    php-8.2.11 | 1 
                    pppd-2.5.0 | 1 
                    sdl-1.2.15 | 1 
                     squid-6.2 | 1 
             util-linux-2.39.2 | 1 
               valgrind-3.21.0 | 1 
                xenomai-3.0.10 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |        alsa-lib-1.2.10         | NOK | http://autobuild.buildroot.net/results/454a31890af8ef8ee20f5ed1adef41510410efcc |     
 microblaze  |        alsa-lib-1.2.10         | NOK | http://autobuild.buildroot.net/results/f4b9f1e5c52a638baee6cc4a7ffcefebb1c08d2c |     
    mips     |        alsa-lib-1.2.10         | NOK | http://autobuild.buildroot.net/results/6017d1d8457091bab740d12157f38227412f3666 |     
   x86_64    |        alsa-lib-1.2.10         | NOK | http://autobuild.buildroot.net/results/97239d22fd6bad4c0a7a32b0d05584b2c575b1d7 |     
   mips64    |        alsa-lib-1.2.10         | NOK | http://autobuild.buildroot.net/results/695cbab333ca1334447788a09f1e9ee49c41269e |     
 microblaze  |        alsa-lib-1.2.10         | NOK | http://autobuild.buildroot.net/results/a0302ba5998248c5fbbb0be263a3a7a9b7674f43 |     
   armeb     |        alsa-lib-1.2.10         | NOK | http://autobuild.buildroot.net/results/2c2b2a7233f0e92f2bc2bc8a978a822b2771c3cd |     
    arm      |       alsa-utils-1.2.10        | NOK | http://autobuild.buildroot.net/results/17c63c038abd65dff751c85128a1b34427a27fbb |     
   mips64    |       alsa-utils-1.2.10        | NOK | http://autobuild.buildroot.net/results/1775cfe56c7d54130574ab57163822dd3e631c02 |     
    i686     |       alsa-utils-1.2.10        | NOK | http://autobuild.buildroot.net/results/dc9e8398c45663181620f9c0d1c0b9f4892fb904 |     
 aarch64_be  |       alsa-utils-1.2.10        | NOK | http://autobuild.buildroot.net/results/6bdfb4c8b1e4642314edf59e19ae9f8b84390112 |     
    sh4      |       alsa-utils-1.2.10        | NOK | http://autobuild.buildroot.net/results/ecc9132414ddc8304e67ffd248d3b8cb42588595 |     
 microblaze  |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/6e0cbd6e214acff284546c438f8829cc07cdf387 |     
   mips64    |           attr-2.5.1           | NOK | http://autobuild.buildroot.net/results/f4d5d7c79ebe599337ac20d1298b3b9d14345700 |     
  aarch64    | bayer2rgb-neon-15feb1115b48... | NOK | http://autobuild.buildroot.net/results/ca8d25df50ab25a01fa1b135c3c3879aa55a21c3 |     
   sh4aeb    |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/0f7670e71083ed994f10f82967a4ff3bddfa1515 |     
  mips64el   |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/2827f45076bf97b72e3446a84fc045fd0c2b04a0 |     
    arc      |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/f077d3144e907d4b995fac1c32edbe05f71ec886 |     
   nios2     |           brltty-6.5           | NOK | http://autobuild.buildroot.net/results/ab4001df89038b7378453503eec34b8ee89f2550 |     
  riscv32    |         busybox-1.36.1         | NOK | http://autobuild.buildroot.net/results/d0e06f1ebe9b439ca5d241b70e9b0a66702791d4 | ORPH
    i686     |      cryptodev-linux-1.13      | NOK | http://autobuild.buildroot.net/results/f45e6f9dcfadba08050de48d673a3dc585424c80 | ORPH
    mips     |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/a1547472dd89b8fac4d2b0fd6a59d9521328af3e | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/8bd3b9b7c882d16c4b98186a4dafa41c8460e78f | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/192e5458c2529d5737fff0a34d500a0909be6de1 | ORPH
    i586     |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/df179c84afe7d587d37bf79b9828a8edcc998f32 | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/4640a336c99675a4a75f9347122ae9ba063f2f57 | ORPH
   sh4aeb    |           flac-1.4.3           | NOK | http://autobuild.buildroot.net/results/660e551e7e58a236273f094a6915b35d3c43c65a |     
  aarch64    |        gcc-final-11.4.0        | NOK | http://autobuild.buildroot.net/results/f62f282267c0879549e969462c1ee343191944cd |     
   xtensa    |        gcc-final-11.4.0        | NOK | http://autobuild.buildroot.net/results/cd50f2f362bbbcd224a11184aa281b5f26ded89e |     
  riscv64    |        gcc-final-12.3.0        | NOK | http://autobuild.buildroot.net/results/fb0ddd774f997129f52cefde15db999e61a2ced8 |     
   mips64    |        gcc-final-12.3.0        | NOK | http://autobuild.buildroot.net/results/75cdd8e978ea137dd7c492da9bac32912fb8f423 |     
   xtensa    |        gcc-final-13.2.0        | NOK | http://autobuild.buildroot.net/results/47d670ebfac0b617012d0a2fb86f35c831c23d97 |     
   sparc     |       gdk-pixbuf-2.42.10       | NOK | http://autobuild.buildroot.net/results/142142cfeebcf0deb220e43480b16d2b2123d890 | ORPH
 powerpc64   | glibc-2.38-27-g750a45a78390... | NOK | http://autobuild.buildroot.net/results/17868721069b9587476ea4c6b437626ae5b17f33 |     
powerpc64le  | glibc-2.38-27-g750a45a78390... | NOK | http://autobuild.buildroot.net/results/47284fcae1cbe9e3bb536fb2455a644c9dd58fa8 |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/8299fd128422477f8367b52295c523fb444fcaae |     
   s390x     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/ea831518a1e4e72d4fa9481363d6e1d337dd05d9 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/df3fe3cc91630738a84c3fcc355f71df6ae12231 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/17c8ea0c730a43e55bc21b04376f822cf28a9a58 | ORPH
   nios2     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/8af222d89323620d7694ab3134b9901596cd3614 | ORPH
   s390x     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/c90e7347640cfa758dfdc6add739a83e1560cb17 | ORPH
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/aee385b64456886312f3d2348c60ae0a32c9c024 | ORPH
   armeb     |         heirloom-mailx         | TIM | http://autobuild.buildroot.net/results/0e881260a7846d67e25bee0742a2c69641ce475b |     
microblazeel |     host-gcc-final-11.4.0      | NOK | http://autobuild.buildroot.net/results/87428ea8b9e8231f6a817b941fd599884abc1bfd |     
 microblaze  |     host-gcc-final-12.3.0      | NOK | http://autobuild.buildroot.net/results/9d3727562232960e4cea28681ba32c46fc1c3c9a |     
    arm      |     host-gcc-final-12.3.0      | NOK | http://autobuild.buildroot.net/results/41ba2924775bec4e2d73a50c8be177a2f8f6b300 |     
   mips64    |         host-go-1.21.2         | NOK | http://autobuild.buildroot.net/results/fa31138a0afdda7698301b5147531ec924f4b30a |     
    i686     |         host-go-1.21.2         | NOK | http://autobuild.buildroot.net/results/157711987663ddb51df310fec822fa70a8a5d4c8 |     
microblazeel |   host-ncurses-6.4-20230603    | NOK | http://autobuild.buildroot.net/results/9c12f55cdf853ebd7bc9288aa02c359a45dd7740 | ORPH
  aarch64    |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/773d6195ec1d65a41eb5e9c582458e7b9c449f9b |     
    m68k     |        libarchive-3.7.2        | NOK | http://autobuild.buildroot.net/results/fbde23b13f515b7728fdf09cf226c7c5a1c3db4b |     
   sh4aeb    |        libarchive-3.7.2        | NOK | http://autobuild.buildroot.net/results/690cea99c926b9347e399d5bdf594d1de9ac1f28 |     
    mips     | libdill-32d0e8b733416208e04... | NOK | http://autobuild.buildroot.net/results/a0b50ecfc42a072893f173b4d861abc8816ab799 |     
  riscv32    | libdill-32d0e8b733416208e04... | NOK | http://autobuild.buildroot.net/results/0ac3e2ceebea0bbb47ed9174218079431c1acb6d |     
 powerpc64   |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/54bb00d28525bc5773c114b43b1417fb565fdd8f |     
   nios2     |        libnetfilter_log        | NOK | http://autobuild.buildroot.net/results/5800e81fadfb537847c6855e4c33a0532672364a |     
  mips64el   |        libostree-2023.6        | NOK | http://autobuild.buildroot.net/results/3d6c925f03c671044cc2120b57f8112de7d50904 |     
   nios2     |         libselinux-3.5         | NOK | http://autobuild.buildroot.net/results/738bee35557d0623e8fa58f8967655509074ebf1 |     
   arceb     |        libsigsegv-2.14         | NOK | http://autobuild.buildroot.net/results/394dff568fa01880a2ad36127a4c57037254c74f |     
   sparc     |         libsoup-2.74.3         | NOK | http://autobuild.buildroot.net/results/50434b24ade1515c4b0f952816a262853d771649 |     
  mips64el   |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/ec3d007f6806e23d6c4f4e95f1c35b7287005d39 | ORPH
   mipsel    |          linux-6.5.6           | NOK | http://autobuild.buildroot.net/results/a227f09e3648c4389cedca295467364bee325153 | ORPH
   sparc     |        linux-pam-1.5.3         | NOK | http://autobuild.buildroot.net/results/f37e59abe8ee0714e3811aa879b56e68c3a53bac | ORPH
    or1k     |        mariadb-10.11.4         | NOK | http://autobuild.buildroot.net/results/6467e53461e350715f2aeb12ee34ee5b7ce8508a | ORPH
    m68k     |        mariadb-10.11.4         | NOK | http://autobuild.buildroot.net/results/662c2d3d288df8ea833d6f09848e37ae16d2a74d | ORPH
 aarch64_be  |        mariadb-10.11.4         | NOK | http://autobuild.buildroot.net/results/3db8185d05d8595e5ae627f1e67e001e5c7784f9 | ORPH
   arceb     |        memcached-1.6.21        | NOK | http://autobuild.buildroot.net/results/b025c357936be83ae1c84cf3685910f81e8e8f8c | ORPH
 aarch64_be  |          monit-5.33.0          | NOK | http://autobuild.buildroot.net/results/bdc0f6d54d80be51ea156ce94e787e05ee158f1d |     
   mips64    |           nmap-7.92            | NOK | http://autobuild.buildroot.net/results/a58f6a69f71718cf1d76e4d49ada75b28d3a2651 | ORPH
powerpc64le  |        open-iscsi-2.1.9        | NOK | http://autobuild.buildroot.net/results/3c3072c4eb270052f2b6f8e7015cd4a44556751f |     
   s390x     |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/d5d0d26e4dcd0ecb0a2bf2b6c6d50339b4ea0a3a |     
  mips64el   |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/b55613680ea502c58ffb149dde505252c36128f2 |     
   mips64    |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/c2c5bf3a7f0aefb7c0e0deb89a24d03c55ed05ad |     
 powerpc64   |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/b161f0a1d2f13fbf9b7dad26eb8b6b98c2e8a6f5 |     
   mips64    |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/7f79a1dab9bfbcf435003dbdc1a03be3e4d6ddc4 |     
 microblaze  |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/5c5418a0a223df9f18b682ad368be98b283d3c43 |     
   mips64    |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/42cb62aae5aedc632af0d424faa889e3c461dadf |     
  sparc64    |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/f3659eb8a220d9200f3f08447e8da2feaf53841b |     
powerpc64le  |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/9a56ed7f2bdc25e4cc3fbdaf58385bce2222becc |     
 aarch64_be  |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/889f157860f4f350fa9f502bbd3e1b730c398000 |     
  sparc64    |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/31685306a258d640bc6d5f10a9f4eb05f491b448 |     
   sh4aeb    |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/ae47fcfa115bc7bab93e5e88642c1db6f22cce70 |     
  mips64el   |         openrc-0.43.3          | NOK | http://autobuild.buildroot.net/results/a0aee6df974cf1a4896e39b61b74204d5f7474ac |     
 powerpc64   |            pdbg-3.5            | NOK | http://autobuild.buildroot.net/results/e3e17e6d26794e1bd0e5db9bfa30b80736f03fbf |     
 aarch64_be  |          perl-5.36.1           | NOK | http://autobuild.buildroot.net/results/9763f08f7167a264ac62ca993adb53ec5f27fa26 |     
    or1k     |           php-8.2.11           | NOK | http://autobuild.buildroot.net/results/8bba9cba15c72aeb86559d7400f51a76153cd356 |     
  sparc64    |           pound-4.8            | NOK | http://autobuild.buildroot.net/results/43b2ef7b199b686b7c57e55ea54defb3eb9f25c9 | ORPH
    m68k     |           pound-4.8            | NOK | http://autobuild.buildroot.net/results/692db714aa8b0dcfb67fd99977fb6f33c5d4810c | ORPH
  sparc64    |           pppd-2.5.0           | NOK | http://autobuild.buildroot.net/results/0570d9e4606a518da59c48cc12c40eb73bf723d2 |     
    sh4a     |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/f996fe88d06b1870518d59f3a554d4ec3a84cd32 | ORPH
    i686     |     spirv-tools-1.3.261.1      | NOK | http://autobuild.buildroot.net/results/5e7ee637173fa9631271733571fcb765f7635427 | ORPH
  sparc64    |     spirv-tools-1.3.261.1      | NOK | http://autobuild.buildroot.net/results/56a23b2500dfa5f670dd0c97ff30c9dc0d10bad4 | ORPH
    arm      |     spirv-tools-1.3.261.1      | NOK | http://autobuild.buildroot.net/results/d5a327f6b9e787168f062a70f18e5803091acd6a | ORPH
   x86_64    |     spirv-tools-1.3.261.1      | NOK | http://autobuild.buildroot.net/results/7854c3016255dd5ad0839436066f55fcddb1f5ab | ORPH
  mips64el   |     spirv-tools-1.3.261.1      | NOK | http://autobuild.buildroot.net/results/196bf27874aeb953e57ecb766ae31074a627ab20 | ORPH
 powerpc64   |     spirv-tools-1.3.261.1      | NOK | http://autobuild.buildroot.net/results/58f9aeade8ff5c2f38b51b76ee18a0ba1ab76b3c | ORPH
 powerpc64   |     spirv-tools-1.3.261.1      | NOK | http://autobuild.buildroot.net/results/57ca5dae5b523a9cf7821c1e48bd552c3f62e6db | ORPH
  sparc64    |     spirv-tools-1.3.261.1      | NOK | http://autobuild.buildroot.net/results/c37aa23426b9af50354f3947afc3aff08d400a7d | ORPH
   nios2     |     spirv-tools-1.3.261.1      | NOK | http://autobuild.buildroot.net/results/881254c4dc297cda2b535627c19e81e2936d9213 | ORPH
  riscv32    |     spirv-tools-1.3.261.1      | NOK | http://autobuild.buildroot.net/results/ce92846706b8919af109556546fd9aaff174c4db | ORPH
powerpc64le  |           squid-6.2            | NOK | http://autobuild.buildroot.net/results/c07f8c2cd1d10ae9559130d6056935975a573124 | ORPH
 powerpc64   |            unknown             | NOK | http://autobuild.buildroot.net/results/3dd960d68c6fbcd43492f04e724c387ea33c1c88 |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/7ec2b6914ebaaed0a97cb1bdf9f7b8076d7eefd5 |     
   arceb     |            unknown             | NOK | http://autobuild.buildroot.net/results/815158cf206c67a0d7b9d772d4ad8117b65cbbe4 |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/28a22c29e3417d0aaae28c925edd82c26a703a56 |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/02e9ee2181bab797114b4144c5c842f98e0dfb97 |     
    arc      |       util-linux-2.39.2        | NOK | http://autobuild.buildroot.net/results/99b606d5a5f45228f4cdd55748080aa81c0aee07 | ORPH
  powerpc    |        valgrind-3.21.0         | NOK | http://autobuild.buildroot.net/results/8b1eb0e74cff41a4c15272bf7eab4826b795e806 | ORPH
   mips64    |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/edda2b407c5c5db21b1114303123ae10a92d7eaa |     


Classification of failures by reason for 2023.02.x
--------------------------------------------------

        ltp-testsuite-20220930 | 1 
                       unknown | 1 
               valgrind-3.19.0 | 1 
                  xvisor-0.3.1 | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |     ltp-testsuite-20220930     | NOK | http://autobuild.buildroot.net/results/e50d5234c1109ebb43b6a02c2ecb370995c32618 |     
    mips     |            unknown             | NOK | http://autobuild.buildroot.net/results/b1f22b0287a72df1cbf8c71a4b8d8e8dd57f2d1e |     
  mips64el   |        valgrind-3.19.0         | NOK | http://autobuild.buildroot.net/results/a880018bb6b9d1678cd71f3d9bfbd5ba756fcc32 | ORPH
  aarch64    |          xvisor-0.3.1          | NOK | http://autobuild.buildroot.net/results/049a35832e99ec55314763fd4df02b31f2e00f63 |     


Classification of failures by reason for 2023.08.x
--------------------------------------------------

              host-rust-1.71.1 | 2 
               libglib2-2.76.1 | 1 
                        nodejs | 1 
                    ruby-3.1.3 | 1 
               suricata-6.0.14 | 1 
                    vlc-3.0.18 | 1 
                xenomai-3.0.10 | 1 


Detail of failures for 2023.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/c303b552779e994801eb69a8d0f794fca77c254e |     
   s390x     |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/d14c4c6a643c4aeb31400375b05a5e221824fba8 |     
   arceb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/6cb46134c9180cbf0900594e0d6fe459c101d346 |     
    i686     |             nodejs             | TIM | http://autobuild.buildroot.net/results/9925369b5049bb164a31a2150c0c2ca91b34ab27 |     
    arc      |           ruby-3.1.3           | NOK | http://autobuild.buildroot.net/results/7a2c30adb9b78016ccbd4489449ba84d09b2427b |     
   x86_64    |        suricata-6.0.14         | NOK | http://autobuild.buildroot.net/results/fdf728ac0a4033547cc738cf8f99bed81f4dd27f |     
    sh4a     |           vlc-3.0.18           | NOK | http://autobuild.buildroot.net/results/5543fecce7308470a3a006cd89c2216ee39c7e08 |     
  aarch64    |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/953b6d0bed26a59ac4e99ce3ee27e4ee84ffe685 |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
