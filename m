Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA923C433F5
	for <buildroot@archiver.kernel.org>; Mon,  9 May 2022 04:59:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2A0DB60F17;
	Mon,  9 May 2022 04:59:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C2Ih6cjYrZkm; Mon,  9 May 2022 04:59:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8B28F60F22;
	Mon,  9 May 2022 04:59:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DE9D11BF20D
 for <buildroot@lists.busybox.net>; Mon,  9 May 2022 04:59:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CC45A818EC
 for <buildroot@lists.busybox.net>; Mon,  9 May 2022 04:59:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y_4IKajjBVWm for <buildroot@lists.busybox.net>;
 Mon,  9 May 2022 04:59:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D6DE8818B5
 for <buildroot@buildroot.org>; Mon,  9 May 2022 04:59:09 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id D83C2240008
 for <buildroot@buildroot.org>; Mon,  9 May 2022 04:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1652072347; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=pTQEpEPo0S5FEvWfqyj+4Tzic8knV3RmrFCEi0f4Pzo=;
 b=SAtozd8g0HxcStUnHgK3dOlVW/7eLmPykCEA1eFwCDVKvSglmHtG6db+0occfV/4xmiQcH
 8I4lCTP/6zKCEszDiTGdQGugWqL2vaZ+NzzjurSQS9gi0cfAIYCNGhmXJLACPBM0XdCh24
 9rKLMUtVw6jecnbCNZvh8wdxvjoS1Cb0huCJBlHnG+bWsJCufVnNG4q8RFWmX4WJNtFIp9
 pWzC0IQF4Fc9DSL4Z8SJijbqcUAk1IsWuS172uQ7TCM0JIxV3m0M7SV4BId7vaz1XnitY/
 pUCaEFQ3+1lntv31Fhy+ggwoOGk2U2gNBPpe6/9J1XdY4oVTyayQwW0y428cAA==
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Mon, 09 May 2022 04:59:06 -0000
Message-Id: <20220509045913.CC45A818EC@smtp1.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-05-08
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

Autobuild statistics for 2022-05-08
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  | 27  |  7  |  0  | 34  |
    master   | 149 | 205 |  0  | 354 |

Classification of failures by reason for master
-----------------------------------------------

           optee-client-3.17.0 | 22
             libopenssl-1.1.1o | 11
               protobuf-3.20.1 | 11
                 uclibc-1.0.40 | 11
                    git-2.31.2 | 8 
                 zlib-ng-2.0.6 | 8 
         host-gcc-final-10.3.0 | 7 
            qpid-proton-0.35.0 | 5 
                busybox-1.35.0 | 4 
glibc-2.34-109-gd64b08d5ba7... | 4 
  gobject-introspection-1.70.0 | 4 
                host-go-1.18.1 | 4 
                 linux-5.15.37 | 4 
                gnu-efi-3.0.10 | 3 
         host-gcc-final-11.3.0 | 3 
                pciutils-3.8.0 | 3 
           python-orjson-3.6.7 | 3 
                     refpolicy | 3 
                  bcusdk-0.0.5 | 2 
                     frr-8.2.2 | 2 
          host-gcc-final-9.4.0 | 2 
              host-rust-1.60.0 | 2 
            igh-ethercat-1.5.2 | 2 
               libglib2-2.70.4 | 2 
                   libnss-3.78 | 2 
           libwebsockets-4.3.1 | 2 
                 mesa3d-21.3.8 | 2 
                nodejs-14.18.3 | 2 
                   perl-5.34.1 | 2 
toolchain-external-bootlin-... | 2 
                   uacme-1.7.1 | 2 
                       unknown | 2 
                xenomai-custom | 2 
             18xx-ti-utils-8.8 | 1 
                    4th-3.64.0 | 1 
                  acpid-2.0.33 | 1 
               aircrack-ng-1.6 | 1 
                    attr-2.5.1 | 1 
                     aufs-util | 1 
                    bird-2.0.8 | 1 
                      bmon-4.0 | 1 
            bridge-utils-1.7.1 | 1 
                    brltty-6.4 | 1 
                  bwm-ng-0.6.3 | 1 
                 coremark-1.01 | 1 
                 coreutils-9.1 | 1 
                  cpulimit-0.2 | 1 
                 dash-0.5.11.5 | 1 
                 dmalloc-5.6.5 | 1 
                  faad2-2.10.0 | 1 
                   flann-1.9.1 | 1 
                 freerdp-2.6.1 | 1 
fs/cramfs/cramfs.mk:46: /nv... | 1 
fs/ubi/ubi.mk:51: /nvmedata... | 1 
fs/ubi/ubi.mk:51: /nvmedata... | 1 
fs/ubi/ubi.mk:51: /nvmedata... | 1 
fs/ubifs/ubifs.mk:49: /nvme... | 1 
                     gmp-6.2.1 | 1 
                   gstd-0.14.0 | 1 
host-pahole-73383b3a39afe86... | 1 
                  jack2-1.9.20 | 1 
                  libcgi-1.3.0 | 1 
   libtorrent-rasterbar-1.2.15 | 1 
              libuhttpd-3.14.1 | 1 
               libvorbis-1.3.7 | 1 
           linux-5.10.104-cip3 | 1 
       linux-5.10.104-cip3-rt3 | 1 
              liquid-dsp-1.4.0 | 1 
        ltp-testsuite-20220121 | 1 
          lua-cqueues-20200726 | 1 
luajit-f2b37f51f69ba7e9f8de... | 1 
          moby-buildkit-0.10.0 | 1 
                  ndisc6-1.0.5 | 1 
                    ne10-1.2.1 | 1 
               openpgm-5-3-128 | 1 
                    opus-1.3.1 | 1 
               pipewire-0.3.50 | 1 
                    pppd-2.4.9 | 1 
                proftpd-1.3.6e | 1 
                    qemu-7.0.0 | 1 
            quickjs-2021-03-27 | 1 
                    ruby-3.1.0 | 1 
                     shim-15.4 | 1 
              skalibs-2.10.0.3 | 1 
                  sngrep-1.4.7 | 1 
                  sudo-1.9.8p2 | 1 
               valgrind-3.19.0 | 1 
                  vlc-3.0.17.4 | 1 
                 wavemon-0.9.4 | 1 
               xfsprogs-5.14.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |       18xx-ti-utils-8.8        | NOK | http://autobuild.buildroot.net/results/31a4d48e7173908390e318d608d2d3c2c91627d3 |     
  riscv64    |           4th-3.64.0           | NOK | http://autobuild.buildroot.net/results/f2d5dbfa629b08dfeaba96407c54f50851cdc0dd |     
   mips64    |          acpid-2.0.33          | NOK | http://autobuild.buildroot.net/results/bbb696dd7a910ea88faf6e3de71a190efa6469bb | ORPH
    i686     |        aircrack-ng-1.6         | NOK | http://autobuild.buildroot.net/results/ca1da5117aa272b4f85069f6f9fe4da55779a223 |     
   arceb     |           attr-2.5.1           | NOK | http://autobuild.buildroot.net/results/af8a2f5042424e52bc7209f51884b618e6cff454 |     
    i686     |           aufs-util            | NOK | http://autobuild.buildroot.net/results/eeb1ad35643596b92a66f0d614de91304f299e3c |     
    sh4      |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/9277a064b61f24ad35334b318fe4d899a4c39aa1 |     
  powerpc    |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/bad5b1049cda49ffa0ddeca8ba14c5f6939bde9a |     
  powerpc    |           bird-2.0.8           | NOK | http://autobuild.buildroot.net/results/e30eb541a6e4c19bd3c7fcfc4bb6e0473b62da84 |     
    m68k     |            bmon-4.0            | NOK | http://autobuild.buildroot.net/results/dd794e86a8557cd1d9ecd308cbf202317f7f4d20 | ORPH
    m68k     |       bridge-utils-1.7.1       | NOK | http://autobuild.buildroot.net/results/9eb1aaf8fa4c9c3ecd815a3602ec00d04d024332 |     
    mips     |           brltty-6.4           | NOK | http://autobuild.buildroot.net/results/9054da87113a6cdfd9d393dea2469a8c806538d1 |     
  riscv64    |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/6bfcf6e4676012cddeded7e18181e2351647e6c7 | ORPH
  riscv64    |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/41eb5c0b5564a3ab74ef3fc53df8363bda366c15 | ORPH
  riscv64    |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/f9fb22171fbb85d36bfdd17b11afdfb932283f15 | ORPH
  riscv64    |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/4746de46c82b95392bc3aceb84d654a0644d7ede | ORPH
  riscv64    |          bwm-ng-0.6.3          | NOK | http://autobuild.buildroot.net/results/b8553de2413d081a4cd5b61cb643c6bcd08a1844 |     
   armeb     |         coremark-1.01          | NOK | http://autobuild.buildroot.net/results/4ada94c454cd743db03b29da29b74b65fa594e03 |     
   sh4aeb    |         coreutils-9.1          | NOK | http://autobuild.buildroot.net/results/2b029fb6bc4d5848a75320fc9d54770d6fedbb37 | ORPH
 aarch64_be  |          cpulimit-0.2          | NOK | http://autobuild.buildroot.net/results/44842d8fbedb702c68f003fe513788fd34167ad1 |     
   s390x     |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/95cefe3156fee817a4e32f36c53ab0fd6467abd7 | ORPH
powerpc64le  |         dmalloc-5.6.5          | NOK | http://autobuild.buildroot.net/results/1f84facd106abdd59be87b9f6e1eb24bcef0a846 | ORPH
    sh4a     |          faad2-2.10.0          | NOK | http://autobuild.buildroot.net/results/be96d4dc1607d0f83777fcda5d6d98208db06c16 |     
   mips64    |          flann-1.9.1           | NOK | http://autobuild.buildroot.net/results/9d173a4cb7d422871ec62b6ce5af98e7c0f15e05 |     
microblazeel |         freerdp-2.6.1          | NOK | http://autobuild.buildroot.net/results/8fe2335994c9337c7acfadd105cd1a8d048eb2c7 |     
    arc      |           frr-8.2.2            | NOK | http://autobuild.buildroot.net/results/81b73cde58e9a0babcf206a54030fed5fc8a011e |     
  mips64el   |           frr-8.2.2            | NOK | http://autobuild.buildroot.net/results/6f4288101802c04ba5f8e99616d17408abe9cbf8 |     
powerpc64le  | fs/cramfs/cramfs.mk:46: /nv... | NOK | http://autobuild.buildroot.net/results/0234d8e5ad6f5a3cb9c6b8cc2e8a1e54ce64237b |     
 powerpc64   | fs/ubi/ubi.mk:51: /nvmedata... | NOK | http://autobuild.buildroot.net/results/11c3215edbc0caa9b9f40f0d02ba75b7b284db5d |     
  powerpc    | fs/ubi/ubi.mk:51: /nvmedata... | NOK | http://autobuild.buildroot.net/results/14a68c92c474adb804bc85caf4bd125bcdd3bccf |     
 microblaze  | fs/ubi/ubi.mk:51: /nvmedata... | NOK | http://autobuild.buildroot.net/results/093accf74c83be5a7cb7ddfcc1c11190c219a8a7 |     
    mips     | fs/ubifs/ubifs.mk:49: /nvme... | NOK | http://autobuild.buildroot.net/results/dc9ab33369a023500dc7f4598cb4a3d33e928b6a |     
   armeb     |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/38a5653c0c66378c17b126c4aaf488d8b423df7b |     
   xtensa    |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/427da93644d6f8ab117e55176b75be0eeea20435 |     
 microblaze  |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/ea6be9da2eaee4eec0c16a84bf147093e71c7a7a |     
microblazeel |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/e3b724ffc7c0b86ebaa04b94f4deb5ca76bc03da |     
    i586     |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/a02261c99fe7236582feb6a785bad8fd8d6a889b |     
   arceb     |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/6cd72ccf0b3bf23587960dc3b7140553b7dada81 |     
  mips64el   |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/fc8ed345b247d512cc2d91282fc89b490be8fcc6 |     
  mips64el   |           git-2.31.2           | NOK | http://autobuild.buildroot.net/results/db20b3c38e1ebf24ecb8bd5b0627f88b9996c031 |     
microblazeel | glibc-2.34-109-gd64b08d5ba7... | NOK | http://autobuild.buildroot.net/results/663e77cc5eb86aef863ee5a905544e0b3841c35f |     
  riscv32    | glibc-2.34-109-gd64b08d5ba7... | NOK | http://autobuild.buildroot.net/results/20514bd9e3b1b615b8a2962875cbb87235a785d0 |     
   nios2     | glibc-2.34-109-gd64b08d5ba7... | NOK | http://autobuild.buildroot.net/results/42d6337358c4091004e3b9ef32c8a2a52b7f71e3 |     
  powerpc    | glibc-2.34-109-gd64b08d5ba7... | NOK | http://autobuild.buildroot.net/results/46693ca5b551c7b8c7164753afc1e2f6cd2a0437 |     
  riscv64    |           gmp-6.2.1            | NOK | http://autobuild.buildroot.net/results/aa6f6353c2a7445ca62b243f2413d321ffa701c5 | ORPH
  mips64el   |         gnu-efi-3.0.10         | NOK | http://autobuild.buildroot.net/results/68fe48ef757d7471674ca1cef101865417e9b98b |     
  mips64el   |         gnu-efi-3.0.10         | NOK | http://autobuild.buildroot.net/results/b02322bb2de69e7559934d8a545780334ebda773 |     
  mips64el   |         gnu-efi-3.0.10         | NOK | http://autobuild.buildroot.net/results/af0751d3ecd614c20d246967e0518736faec2407 |     
 microblaze  |  gobject-introspection-1.70.0  | NOK | http://autobuild.buildroot.net/results/06b185dc4748d25cfd0d88ad27ae97102443b725 | ORPH
   s390x     |  gobject-introspection-1.70.0  | NOK | http://autobuild.buildroot.net/results/fdd675906278aa274a2f4e459a27b6ecc346d29b | ORPH
   nios2     |  gobject-introspection-1.70.0  | NOK | http://autobuild.buildroot.net/results/d192e330aab489b897d890e9fffb1d62db64305a | ORPH
   x86_64    |  gobject-introspection-1.70.0  | NOK | http://autobuild.buildroot.net/results/087f1220969dcd8eec471f37714ad02a56d71e52 | ORPH
microblazeel |          gstd-0.14.0           | NOK | http://autobuild.buildroot.net/results/a5dee116cd20857f4525a1879e78cb29adcb895d | ORPH
  sparc64    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/665d9d3eae4cab9a1be2d97e494c9b06029fdd66 |     
  riscv32    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/1166b56d175c545f4fcb59c0a71b629a54662570 |     
  riscv32    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/68eef0b2db86ec101207c920f33a07426cedf70a |     
 powerpc64   |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/18d93f7a4189bf9fba56d35c249cfa5d6be6e526 |     
powerpc64le  |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/b1bcc8f320ae47ece80dbbecbfcac3c381177ff6 |     
    i686     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/1a42baf24e2a84b9060914ea73ee16d386882195 |     
powerpc64le  |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/c122b8083041b63a0b76fd2e8d8ec81656e4715e |     
   nios2     |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/38862dde7310a1a2399b29e66b64d08ac7c1d589 |     
powerpc64le  |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/50ae50e01fa698d77cf7b6221a7196b3c3d8b24f |     
  sparc64    |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/0ae438e2b9ce1e4d7ef3268de20e1bb322d61324 |     
 powerpc64   |      host-gcc-final-9.4.0      | NOK | http://autobuild.buildroot.net/results/f6660e8e632b6054bfb2f23e12bd3d04fb164c13 |     
  sparc64    |      host-gcc-final-9.4.0      | NOK | http://autobuild.buildroot.net/results/8d7cf4594b903a6077dada78d299b6cf8c076d1d |     
   mips64    |         host-go-1.18.1         | NOK | http://autobuild.buildroot.net/results/87391824beb413f21becff4b5c19a70f45448c19 |     
  mips64el   |         host-go-1.18.1         | NOK | http://autobuild.buildroot.net/results/283b6c611bb070d1a50cc81586cc7f7eeffbd4f0 |     
  mips64el   |         host-go-1.18.1         | NOK | http://autobuild.buildroot.net/results/aab5a42347a8ed2bcb191dd56cff30f193f22f5b |     
   mips64    |         host-go-1.18.1         | NOK | http://autobuild.buildroot.net/results/86c56b842bef5ce96738f3d8bbba0b334d0ddc5f |     
    m68k     | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/1539896414cec099ebce9ce82281c0944879c620 |     
   x86_64    |        host-rust-1.60.0        | NOK | http://autobuild.buildroot.net/results/187e254217a9349f4a12741fc12d23e804951722 |     
  sparc64    |        host-rust-1.60.0        | NOK | http://autobuild.buildroot.net/results/b046523960079cbf85931b8f67c3b98dd07fbbda |     
   armeb     |       igh-ethercat-1.5.2       | NOK | http://autobuild.buildroot.net/results/6efc0256aff96e2aabc2ebdaec3838bd4758e411 |     
   arceb     |       igh-ethercat-1.5.2       | NOK | http://autobuild.buildroot.net/results/9f869b674382b6c28b2806f4f7e7e83b36ffc449 |     
    m68k     |          jack2-1.9.20          | NOK | http://autobuild.buildroot.net/results/75ebeb77ffc7af25e27d820d15c5b4146d1ef0f1 |     
   sh4aeb    |          libcgi-1.3.0          | NOK | http://autobuild.buildroot.net/results/84a2339568d23b328af2416bfcec1ef41eccdce5 | ORPH
   arceb     |        libglib2-2.70.4         | NOK | http://autobuild.buildroot.net/results/5b121295ccfdabebcdade49b4fb3820ffde44798 |     
   arceb     |        libglib2-2.70.4         | NOK | http://autobuild.buildroot.net/results/5255a080293697e5a171f5eb75fed9b2b6aa6a77 |     
microblazeel |          libnss-3.78           | NOK | http://autobuild.buildroot.net/results/1597156d6fa5256ae299e9d364fb75ecb63e7317 |     
 microblaze  |          libnss-3.78           | NOK | http://autobuild.buildroot.net/results/2bd7d132f242e451a2feec131c8e4bd1b2fa532a |     
    m68k     |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/effc3b06222586e5e8f4aabe384f74e1afd72ff7 |     
   arceb     |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/11c74457a1c4a3611a964ac4754980dba9ff4c57 |     
   sparc     |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/ac39c13a01b1f376a9d97335891ec522605f9568 |     
    sh4      |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/924205cb0db5cffd757c9ac895527286247295a5 |     
    arc      |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/992c18dc83416eae36973c1dd4372184f602429f |     
  powerpc    |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/06d8c306747de00d6891c338c3db21d4ae4e3728 |     
    or1k     |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/ce3baaa52b1ab0965b8c92e03a0fdfcce77a5df3 |     
 aarch64_be  |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/866b1c9b32202c7f6bc359dea0ef4793850aff58 |     
    arc      |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/ed90065989a73d4130f816d47b6577c4f96cafcc |     
    arc      |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/da27a6ce62ef4ecdc3465d4f8242bc6138f1d7d4 |     
    m68k     |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/9508ab67410b404b0066fba862b4e9098a3d2731 |     
    i686     |  libtorrent-rasterbar-1.2.15   | NOK | http://autobuild.buildroot.net/results/9f6a7e6afa1b8a0429b531f619311301e7422c47 |     
   mips64    |        libuhttpd-3.14.1        | NOK | http://autobuild.buildroot.net/results/a7f7625c3d0017620e76a447194d0f4fa4d64025 |     
  powerpc    |        libvorbis-1.3.7         | NOK | http://autobuild.buildroot.net/results/7e3779dc432930ac9448c845e90b8b2a3f4daa70 |     
    arm      |      libwebsockets-4.3.1       | NOK | http://autobuild.buildroot.net/results/04f77ba92c8622f650d35dc44c1f910bed733d56 |     
   xtensa    |      libwebsockets-4.3.1       | NOK | http://autobuild.buildroot.net/results/1f600e49a15bb81fd0cfebca1e28b6457313ac46 |     
powerpc64le  |      linux-5.10.104-cip3       | NOK | http://autobuild.buildroot.net/results/dd76d53bab56470c0b83e296872d7bb90f9e8296 | ORPH
   arceb     |    linux-5.10.104-cip3-rt3     | NOK | http://autobuild.buildroot.net/results/032c180ef06e1ee362f7e1ddd86b633eb2581cdc | ORPH
    arm      |         linux-5.15.37          | NOK | http://autobuild.buildroot.net/results/9153ea311876c413df364b90c04ae52657d51955 | ORPH
    mips     |         linux-5.15.37          | NOK | http://autobuild.buildroot.net/results/d874425675088a3893d65df8fe3963ec5b564e18 | ORPH
powerpc64le  |         linux-5.15.37          | NOK | http://autobuild.buildroot.net/results/c9098ced12301d09f2de6d20645b9ed468548255 | ORPH
  mips64el   |         linux-5.15.37          | NOK | http://autobuild.buildroot.net/results/4099b069c015ab47b2d3a692378800e7130f9192 | ORPH
    arm      |        liquid-dsp-1.4.0        | NOK | http://autobuild.buildroot.net/results/4c843c83268741a0623730b4fdb20d86a2c6fb14 |     
   mips64    |     ltp-testsuite-20220121     | NOK | http://autobuild.buildroot.net/results/2dafec94b888960335115b44c281741dfd55840b |     
    i686     |      lua-cqueues-20200726      | NOK | http://autobuild.buildroot.net/results/66eec0818c58ac64bb1aa5f3218b8ca94e643cdd |     
   armeb     | luajit-f2b37f51f69ba7e9f8de... | NOK | http://autobuild.buildroot.net/results/2e1bdc0ee3d7a34e608b4e15151ac7927388a63b |     
    arm      |         mesa3d-21.3.8          | NOK | http://autobuild.buildroot.net/results/7a3b74f34742c03a7470c74888451f9207db28f9 |     
  mips64el   |         mesa3d-21.3.8          | NOK | http://autobuild.buildroot.net/results/3014a8d2c5b7efe1281ffea5c229171d9e0f117f |     
powerpc64le  |      moby-buildkit-0.10.0      | NOK | http://autobuild.buildroot.net/results/a4aab952acca33577822daf9541c25ccb8e68e60 |     
    arm      |          ndisc6-1.0.5          | NOK | http://autobuild.buildroot.net/results/195faec7e6679bee6faa952ab7ec809cc506766d | ORPH
  aarch64    |           ne10-1.2.1           | NOK | http://autobuild.buildroot.net/results/a86d09d569babe6b88cb8e5fbb47483772f42aed |     
   mipsel    |         nodejs-14.18.3         | NOK | http://autobuild.buildroot.net/results/c29384cae5389cc16d055c0f0995b65886e2ca2f |     
   mipsel    |         nodejs-14.18.3         | NOK | http://autobuild.buildroot.net/results/8cc9521b0280f1cb1a7a976aaf007acc5a41f72b |     
  sparc64    |        openpgm-5-3-128         | NOK | http://autobuild.buildroot.net/results/52dd6fc21f703f9beaef99b1be77bc39d1874da2 |     
    mips     |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/95b83be4aae0ef4885fed15cdf57998a8944c715 |     
   mipsel    |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/23c545510a29c7f7c2d575aab889a3bd3cfb8915 |     
   mipsel    |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/a735e1e63b3940b031831b2d5839685b469c6ade |     
microblazeel |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/4bfd56d73f8b1898f761950def7e315f11dbdb38 |     
    i686     |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/cd3bf8f55e63c4cfebf7cd1ff62509a74cdbd45e |     
 microblaze  |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/94257718c6b9514cde5ffd56a4f847a66b054137 |     
   xtensa    |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/f32b4517b3b645579e5e1a848c50e8bfef962b18 |     
    sh4      |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/5e280b72fa3004dcde58f1f0447127c425f73aaa |     
    m68k     |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/429959fce2656914017cb8641db0020442b2c47e |     
   mipsel    |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/019ddd00161a697c117dd7bd95dfb25ee8e6403e |     
  riscv64    |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/3c0b83214b988709c2f0ab689278a8d63eb97eb9 |     
    or1k     |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/4a03be578c13bbaf53b4b2d0bcd0ea04f68479bd |     
   xtensa    |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/6b4b0e3ecddad9fad3ebd2e0e875ce44c7b6a391 |     
    i686     |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/0fcf55173f22c67aa9847b005874007ab87895d2 |     
    i686     |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/d1647598fdb37f4a49b25c9b2f31d1d6f8473b69 |     
  powerpc    |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/420580ca03ac2ce2c0924e3a4ef28cfb89a1c5c9 |     
    arc      |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/cd664a8ef606233a41c6f2e866e4732d5fdc99a9 |     
 microblaze  |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/7fafca9b555f6b282642751c98ba5c2a268a1e83 |     
   sparc     |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/41885ccbffc39f060d0ce5a69fa79c82e9645103 |     
   s390x     |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/383d90bb4d4f47f041c2038be087eb527c9ac3c8 |     
   mipsel    |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/c57f97a97adb2bb57a8e0f236a8a244eca1d9be0 |     
microblazeel |      optee-client-3.17.0       | NOK | http://autobuild.buildroot.net/results/ac9391b070626a9e544648ffefcc4cddf4b6f997 |     
   armeb     |           opus-1.3.1           | NOK | http://autobuild.buildroot.net/results/f08728fb1b0157addbd0da331231f39664bf03c2 | ORPH
 powerpc64   |         pciutils-3.8.0         | NOK | http://autobuild.buildroot.net/results/4a95818197f527a9fdfb2ac8c52aff358dadb9d8 | ORPH
    mips     |         pciutils-3.8.0         | NOK | http://autobuild.buildroot.net/results/15a6e7f7572427c9dd689f42bca31dd71f87752d | ORPH
    arm      |         pciutils-3.8.0         | NOK | http://autobuild.buildroot.net/results/7aedac7a2533d2afc90578f9dff98569ceba264a | ORPH
  riscv64    |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/f33b7ba3a9a0b0fe05015f85eaf06b653448bc5e |     
    mips     |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/ebe8e5e82207921a35ceaee45fc3318d7638e097 |     
   x86_64    |        pipewire-0.3.50         | NOK | http://autobuild.buildroot.net/results/e30cc4595bb0c18c5470e0ca1275645a7b6888af |     
  riscv32    |           pppd-2.4.9           | NOK | http://autobuild.buildroot.net/results/a5d93f2410e56d40f4ce1d8d2489606d6fdb2ff4 | ORPH
   armeb     |         proftpd-1.3.6e         | NOK | http://autobuild.buildroot.net/results/6c9d50bacde4e0d82d1090f737c80c1a482fd637 |     
microblazeel |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/839a10fc2c041ce20f87c2b36561f5dab4f4cc50 |     
   nios2     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/33868d70fb3a439d3be9bc4801c9be3631417b0d |     
microblazeel |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/8397e1aa84f8c5cd6030ca0efcba71063d4b1a60 |     
    m68k     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/d4e25461b2ec0a3515564171630dcda200d4b533 |     
    m68k     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/d43b5e2b110f49cfefbe225209a216d266ab1718 |     
microblazeel |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/4aebc8ea3f3f827adc3469545854220e4661c6f8 |     
    arc      |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/2aecf8518dad516f5df35e6af4bf8cc968ba5fad |     
    arc      |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/3e1cb2600490f502b0bfdcdfc86a3bccfbcb6592 |     
    arc      |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/78a7a3f5bc39f1babf7efc83795967211e07f565 |     
    arc      |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/5a93091f4c1e11e76801cf14c583a39b8ee15d8f |     
    sh4      |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/4e89ccff7a0a8ee62388b73d6258e98150bddf56 |     
    i586     |      python-orjson-3.6.7       | NOK | http://autobuild.buildroot.net/results/989bb3395c03109e88b41537f0c5cebe77022c1c |     
   s390x     |      python-orjson-3.6.7       | NOK | http://autobuild.buildroot.net/results/8fe8b003272ff1372a3c44af30922f4083da0214 |     
    i586     |      python-orjson-3.6.7       | NOK | http://autobuild.buildroot.net/results/7151e63bf18f0c67336b608902d27e17dde84d9e |     
   mipsel    |           qemu-7.0.0           | NOK | http://autobuild.buildroot.net/results/bf523c9a7919856ab08fd40a901aa1022e5cbe92 |     
   mipsel    |       qpid-proton-0.35.0       | NOK | http://autobuild.buildroot.net/results/5d43a7b4645a10bf1f1abe776df52f30323245df |     
    sh4a     |       qpid-proton-0.35.0       | NOK | http://autobuild.buildroot.net/results/7bdaeacefa26d036351aa5998baffed0888860ed |     
   s390x     |       qpid-proton-0.35.0       | NOK | http://autobuild.buildroot.net/results/32c09a1eb5d720dfcc024675acb71848db2ce169 |     
   mipsel    |       qpid-proton-0.35.0       | NOK | http://autobuild.buildroot.net/results/ffd94519fdbe7a4eec2388b4bbc9ef23e9aebea1 |     
powerpc64le  |       qpid-proton-0.35.0       | NOK | http://autobuild.buildroot.net/results/2ab48d2f42fed7c121626c0b3a80e857314dedda |     
   armeb     |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/0ce868434aaa41057cc4b8067ce96c9fecdc434e |     
   sh4aeb    |           refpolicy            | NOK | http://autobuild.buildroot.net/results/cd899208f9e0d710b4be39f385e5930562f55264 |     
  aarch64    |           refpolicy            | NOK | http://autobuild.buildroot.net/results/54412b96f6f527397eb254200ce9735ef44c195e |     
  sparc64    |           refpolicy            | NOK | http://autobuild.buildroot.net/results/0761bb5fd42b56b320e258af9f0cca9cb417e54e |     
  mips64el   |           ruby-3.1.0           | NOK | http://autobuild.buildroot.net/results/8b41ce8d91fee29d8c5647ea17d4d921bd8ec9d2 |     
 aarch64_be  |           shim-15.4            | NOK | http://autobuild.buildroot.net/results/dc4074149272ad7900249d02d1515eb22dd91cd6 |     
    or1k     |        skalibs-2.10.0.3        | NOK | http://autobuild.buildroot.net/results/b87a154006e6f58906e532873bd6496d108cb247 |     
  mips64el   |          sngrep-1.4.7          | NOK | http://autobuild.buildroot.net/results/e22f648905adc6f024f4f7ecf94c9321abec0bb9 | ORPH
   mips64    |          sudo-1.9.8p2          | NOK | http://autobuild.buildroot.net/results/0ba87410dabd11b059042df5afbb44137995af66 | ORPH
   armeb     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/1d25483df96187c9b0170aaee03ce9b08ae60495 | ORPH
    i586     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/5b65b7372ed721d4c2e5fe88e53dd207370afd25 | ORPH
 microblaze  |          uacme-1.7.1           | NOK | http://autobuild.buildroot.net/results/e5ea8fcc810ac80c40bbf0be3a3b5419b1ecb911 |     
    i686     |          uacme-1.7.1           | NOK | http://autobuild.buildroot.net/results/1495f9c673b9f7bdcc7b6877fa340a718b75d05f |     
   xtensa    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/0cbcb2d507434a0e828050aef888a43c1ce7d1ae |     
  riscv64    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/f4f639bf5a4a00633565889d1125812879105e0d |     
  powerpc    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/3bc29ef6e98cf8458b1a6c8179f827bc43637a3a |     
   xtensa    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/aeae22efbb4c1aefba3727d47ee87df751823af4 |     
  powerpc    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/71372bc184788bf19e92a4c753053bf91540b7dc |     
   xtensa    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/f674f7953afcb09b2dd0ec9a1b2c3122a9250239 |     
  powerpc    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/62674b358cd98eacfca368e78c363c531ef1cf37 |     
   xtensa    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/3be031995c625b0ca6bdc32737b9ae1ef9e02631 |     
  riscv64    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/ac2687f136c9f557f577b8fe716351a8452f94ed |     
   xtensa    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/a58acd8039f70a72e156f3abcfcbd2e660915541 |     
  powerpc    |         uclibc-1.0.40          | NOK | http://autobuild.buildroot.net/results/0923ed856f0dd7b0f68aa2822440a80b46f55b46 |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/34789f3b1d55311d04e5ed2a9f56dc32aed8f961 |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/b80cfee006963465102c39caed0292216db70b26 |     
   mips64    |        valgrind-3.19.0         | NOK | http://autobuild.buildroot.net/results/eeda3ae7442cbb5891f0015893931f4109a7dbb3 | ORPH
  powerpc    |          vlc-3.0.17.4          | NOK | http://autobuild.buildroot.net/results/fad267c30bd5dfc5d0a19cb651d336e6ce4a395c |     
   mipsel    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/59c25df9fef36d0403967b2273cf204bcb611536 |     
   s390x     |         xenomai-custom         | NOK | http://autobuild.buildroot.net/results/893cfd87e3d6f2f81234b5ceb949a05e282807be |     
    arc      |         xenomai-custom         | NOK | http://autobuild.buildroot.net/results/684889193eef83394a13ac00637c41ad157fdbff |     
   mips64    |        xfsprogs-5.14.2         | NOK | http://autobuild.buildroot.net/results/e33cf8f0afd5b32975b0cdb755e0a1ba4588525e | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/e632dd6b7fb15717ffbe39392096e8c1cf20265d | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/b37167f2ad06756b723dd16fb98d595d53450166 | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/9b1d63152393ebf9b16088e2ad4f8e42fd40ced0 | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/42bc86fcbdc7c4137d60fc6f306df7bc493c7479 | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/0a47cff164656ea64d61c28020cbbd8f9c2aa35f | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/3d669b87a53d93b90e8767cc5e46914d5f438c4d | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/a3409a2477e075b72e64f49c178e50fac7cb5ff3 | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/91149767e6b4c8f0dd0faac70ff3383310205fb3 | ORPH


Classification of failures by reason for 2022.02.x
--------------------------------------------------

                  exempi-2.6.1 | 2 
                       frr-8.1 | 2 
              python-pyqt5-5.7 | 1 
tvheadend-1295dd2be863f5beb... | 1 
                       unknown | 1 


Detail of failures for 2022.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |          exempi-2.6.1          | NOK | http://autobuild.buildroot.net/results/25885c1bbf56e3e72bfbacd59358bdf46e5dfab5 |     
    arm      |          exempi-2.6.1          | NOK | http://autobuild.buildroot.net/results/f4a098ff8ee5e00167a6b55defdd17312872c9fd |     
  mips64el   |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/53bacfbf87ccd29c80438d1280c0e4975537017a |     
  mips64el   |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/d03f357831469862e0a25f44d75d101b75260b29 |     
  aarch64    |        python-pyqt5-5.7        | NOK | http://autobuild.buildroot.net/results/05597997378a9d9eaa94113eaea07100224c454a |     
   nios2     | tvheadend-1295dd2be863f5beb... | NOK | http://autobuild.buildroot.net/results/b063a11c44197345b4f9c98ec767808e34a0e6e4 |     
    m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/ef64916684d391b36fc73b3285b1a7c1936dbaeb |     


Packages having a newer version
===============================

             name              | found by |        link to release-monitoring.org        |   version    |   upstream   | orph?
-------------------------------+----------+----------------------------------------------+--------------+--------------+-------
                        acpica |  DISTRO  | https://release-monitoring.org/project/00018 | 20200717     | 20220331     |     
            adwaita-icon-theme |  DISTRO  | https://release-monitoring.org/project/13117 | 3.37.2       | 42.0         |     
                       agentpp |  DISTRO  | https://release-monitoring.org/project/21316 | 4.5.3        | 4.5.4        |     
                        alfred |  DISTRO  | https://release-monitoring.org/project/241870 | 2022.0       | 2022.1       |     
                      alsa-lib |  DISTRO  | https://release-monitoring.org/project/00038 | 1.2.6        | 1.2.6.1      |     
                 android-tools |  GUESS   | https://release-monitoring.org/project/13989 | 4.2.2+git... | 12.1.0_r5    |     
                     angularjs |  DISTRO  | https://release-monitoring.org/project/21321 | 1.8.2        | 1.8.3        |     
                      apitrace |  DISTRO  | https://release-monitoring.org/project/06170 | 10.0         | 11.0         |     
                     armadillo |  DISTRO  | https://release-monitoring.org/project/07006 | 9.900.2      | 11.0.1       |     
                        assimp |  DISTRO  | https://release-monitoring.org/project/06988 | 5.2.1        | 5.2.3        |     
                      asterisk |  DISTRO  | https://release-monitoring.org/project/09838 | 16.25.2      | 19.3.3       |     
                   at-spi2-atk |  DISTRO  | https://release-monitoring.org/project/07840 | 2.34.2       | 2.38.0       |     
                  at-spi2-core |  DISTRO  | https://release-monitoring.org/project/07841 | 2.36.0       | 2.44.1       |     
                         audit |  DISTRO  | https://release-monitoring.org/project/15225 | 3.0.7        | 3.0.8        |     
              autoconf-archive |  DISTRO  | https://release-monitoring.org/project/00142 | 2021.02.19   | 2022.02.11   |     
                       avrdude |  DISTRO  | https://release-monitoring.org/project/10751 | 6.4          | 7.0          |     
               azure-iot-sdk-c |  DISTRO  | https://release-monitoring.org/project/21322 | LTS_01_20... | 3033-01-05   |     
                        babeld |  DISTRO  | https://release-monitoring.org/project/00154 | 1.9.2        | 1.12         | ORPH
                 balena-engine |  DISTRO  | https://release-monitoring.org/project/141616 | 20.10.12     | 20.10.16     | ORPH
                           bat |  DISTRO  | https://release-monitoring.org/project/241901 | 0.19.0       | 0.20.0       |     
                        batctl |  DISTRO  | https://release-monitoring.org/project/14740 | 2021.0       | 2022.1       |     
                    batman-adv |  DISTRO  | https://release-monitoring.org/project/19529 | 2021.4       | 2022.1       |     
                     bats-core |  DISTRO  | https://release-monitoring.org/project/10587 | 1.4.1        | 1.6.0        |     
                        bcg729 |  DISTRO  | https://release-monitoring.org/project/14743 | 1.0.4        | 1.1.1        |     
                     bctoolbox |  DISTRO  | https://release-monitoring.org/project/14746 | 4.4.8        | 5.1.17       | ORPH
                         bdwgc |  DISTRO  | https://release-monitoring.org/project/17108 | 8.0.6        | 8.2.0        |     
                     belle-sip |  DISTRO  | https://release-monitoring.org/project/14378 | 4.4.8        | 5.1.12       |     
                          belr |  DISTRO  | https://release-monitoring.org/project/80042 | 4.4.8        | 5.1.12       |     
                    berkeleydb |  GUESS   | https://release-monitoring.org/project/138386 | 5.3.28       | 18.1.5       | ORPH
                          bind |  DISTRO  | https://release-monitoring.org/project/14923 | 9.16.27      | 9.18.2       | ORPH
                      binutils |  DISTRO  | https://release-monitoring.org/project/07981 | 2.37         | 2.38         |     
                          bird |  DISTRO  | https://release-monitoring.org/project/00192 | 2.0.8        | 2.0.9        |     
                       bitcoin |  DISTRO  | https://release-monitoring.org/project/13618 | 0.21.2       | 23.0         |     
                        bonnie |  DISTRO  | https://release-monitoring.org/project/00212 | 1.03e        | 2.00a        | ORPH
                         boost |  DISTRO  | https://release-monitoring.org/project/06845 | 1.78.0       | 1.79.0       |     
                     bootstrap |  DISTRO  | https://release-monitoring.org/project/21578 | 4.3.1        | 5.1.3        |     
                   btrfs-progs |  DISTRO  | https://release-monitoring.org/project/00227 | 5.16.2       | 5.17         | ORPH
                        bullet |  DISTRO  | https://release-monitoring.org/project/07669 | 3.21         | 3.24         |     
                        c-icap |  DISTRO  | https://release-monitoring.org/project/21325 | 0.5.7        | 0.5.9        | ORPH
                c-icap-modules |  DISTRO  | https://release-monitoring.org/project/21326 | 0.5.4        | 0.5.5        | ORPH
                         cairo |  DISTRO  | https://release-monitoring.org/project/00247 | 1.16.0       | 1.17.6       |     
                     cantarell |  DISTRO  | https://release-monitoring.org/project/10888 | 0.0.25       | 0.303.1      | ORPH
                        ccache |  DISTRO  | https://release-monitoring.org/project/00257 | 3.7.12       | 4.6          | ORPH
                          ccid |  DISTRO  | https://release-monitoring.org/project/02612 | 1.4.34       | 1.5.0        | ORPH
                        cereal |  DISTRO  | https://release-monitoring.org/project/11606 | 1.3.1        | 1.3.2        |     
                       chartjs |  DISTRO  | https://release-monitoring.org/project/85785 | 2.9.4        | 3.7.1        |     
                   checkpolicy |  DISTRO  | https://release-monitoring.org/project/00276 | 3.3          | 20200710     |     
                    cifs-utils |  DISTRO  | https://release-monitoring.org/project/00287 | 6.13         | 6.15         |     
                        circus |  DISTRO  | https://release-monitoring.org/project/21726 | 0.16.1       | 0.17.1       |     
                        clamav |  DISTRO  | https://release-monitoring.org/project/00291 | 0.103.5      | 0.105.0      |     
                         clang |  DISTRO  | https://release-monitoring.org/project/11811 | 9.0.1        | 14.0.3       |     
                         cmake |  DISTRO  | https://release-monitoring.org/project/00306 | 3.18.6       | 3.23.1       |     
                           cog |  DISTRO  | https://release-monitoring.org/project/21333 | 0.12.4       | 0.13.3       |     
                      collectl |  DISTRO  | https://release-monitoring.org/project/00330 | 4.3.2        | 4.3.3        |     
                    containerd |  DISTRO  | https://release-monitoring.org/project/16460 | 1.6.2        | 1.6.4        |     
                  cups-filters |  DISTRO  | https://release-monitoring.org/project/05541 | 1.28.12      | 1.28.15      |     
                      cutelyst |  DISTRO  | https://release-monitoring.org/project/21335 | 2.11.0       | 3.4.0        |     
                        dacapo |  DISTRO  | https://release-monitoring.org/project/20546 | 9.12-MR1-... | 9.12-vbump   |     
                          daq3 |  DISTRO  | https://release-monitoring.org/project/212345 | 3.0.5        | 3.0.7        |     
                    datatables |  DISTRO  | https://release-monitoring.org/project/141588 | 1.10.20      | 1.11.5       |     
            datatables-buttons |  DISTRO  | https://release-monitoring.org/project/141589 | 1.6.1        | 2.2.2        |     
       datatables-fixedcolumns |  DISTRO  | https://release-monitoring.org/project/141590 | 3.3.0        | 4.0.2        |     
         datatables-responsive |  DISTRO  | https://release-monitoring.org/project/141591 | 2.2.3        | 2.2.9        |     
                          dbus |  DISTRO  | https://release-monitoring.org/project/05356 | 1.12.22      | 1.14.0       | ORPH
                         dc3dd |  DISTRO  | https://release-monitoring.org/project/15086 | 7.2.641      | 7.2.646      | ORPH
                   debianutils |  DISTRO  | https://release-monitoring.org/project/21341 | 4.11         | 5.7          | ORPH
                         delve |  DISTRO  | https://release-monitoring.org/project/40149 | 1.8.0        | 1.8.3        |     
                        dialog |  DISTRO  | https://release-monitoring.org/project/00431 | 1.3-20220117 | 1.3-20220414 | ORPH
                    docker-cli |  DISTRO  | https://release-monitoring.org/project/21076 | 20.10.14     | 20.10.15     |     
                docker-compose |  DISTRO  | https://release-monitoring.org/project/06185 | 1.24.1       | 2.5.0        |     
                 docker-engine |  DISTRO  | https://release-monitoring.org/project/00447 | 20.10.14     | 20.10.15     |     
                    drbd-utils |  DISTRO  | https://release-monitoring.org/project/00462 | 9.19.0       | 9.21.1       |     
                     dropwatch |  DISTRO  | https://release-monitoring.org/project/21344 | 1.5.3        | 1.5.4        |     
                            dt |  DISTRO  | https://release-monitoring.org/project/21844 | 18.32        | 21.27        | ORPH
                      earlyoom |  DISTRO  | https://release-monitoring.org/project/17392 | 1.6.2        | 1.7          |     
                          edk2 |  DISTRO  | https://release-monitoring.org/project/125953 | edk2-stab... | 202202       |     
                        efivar |  DISTRO  | https://release-monitoring.org/project/00664 | 37           | 38           |     
                           efl |  DISTRO  | https://release-monitoring.org/project/06128 | 1.26.1       | 1.26.2       |     
                      ejabberd |  DISTRO  | https://release-monitoring.org/project/00667 | 20.07        | 22.05        |     
                      elfutils |  DISTRO  | https://release-monitoring.org/project/05679 | 0.186        | 0.187        | ORPH
                        elixir |  DISTRO  | https://release-monitoring.org/project/00673 | 1.9.4        | 1.13.4       |     
                           ell |  DISTRO  | https://release-monitoring.org/project/17781 | 0.49         | 0.50         |     
                 enlightenment |  DISTRO  | https://release-monitoring.org/project/00698 | 0.25.1       | 0.25.3       |     
                        erlang |  DISTRO  | https://release-monitoring.org/project/00707 | 22.3.4.22    | 24.3.4       |     
                   erlang-eimp |  DISTRO  | https://release-monitoring.org/project/17060 | 1.0.17       | 1.0.22       |     
               erlang-goldrush |  DISTRO  | https://release-monitoring.org/project/09692 | 0.1.9        | 0.2.0        |     
                   erlang-idna |  DISTRO  | https://release-monitoring.org/project/45374 | 6.0.0        | 6.1.1        |     
                   erlang-jose |  DISTRO  | https://release-monitoring.org/project/16913 | 1.9.0        | 1.11.2       |     
                  erlang-lager |  DISTRO  | https://release-monitoring.org/project/00727 | 3.6.10       | 3.9.2        |     
                erlang-p1-acme |  DISTRO  | https://release-monitoring.org/project/45375 | 1.0.9        | 1.0.19       |     
           erlang-p1-cache-tab |  DISTRO  | https://release-monitoring.org/project/08757 | 1.0.25       | 1.0.30       |     
              erlang-p1-mqtree |  DISTRO  | https://release-monitoring.org/project/20220 | 1.0.10       | 1.0.15       |     
              erlang-p1-oauth2 |  DISTRO  | https://release-monitoring.org/project/09302 | 0.6.7        | 0.8.0        |     
                erlang-p1-pkix |  DISTRO  | https://release-monitoring.org/project/20539 | 1.0.6        | 1.0.9        |     
                 erlang-p1-sip |  DISTRO  | https://release-monitoring.org/project/10576 | 1.0.38       | 1.0.47       |     
          erlang-p1-stringprep |  DISTRO  | https://release-monitoring.org/project/09222 | 1.0.23       | 1.0.28       |     
                erlang-p1-stun |  DISTRO  | https://release-monitoring.org/project/09151 | 1.0.39       | 1.2.2        |     
                 erlang-p1-tls |  DISTRO  | https://release-monitoring.org/project/10455 | 1.1.9        | 1.1.15       |     
               erlang-p1-utils |  DISTRO  | https://release-monitoring.org/project/08643 | 1.0.20       | 1.0.25       |     
                 erlang-p1-xml |  DISTRO  | https://release-monitoring.org/project/10464 | 1.1.44       | 1.1.49       |     
                erlang-p1-xmpp |  DISTRO  | https://release-monitoring.org/project/12752 | 1.4.10       | 1.5.8        |     
                erlang-p1-yaml |  DISTRO  | https://release-monitoring.org/project/10243 | 1.0.28       | 1.0.33       |     
               erlang-p1-yconf |  DISTRO  | https://release-monitoring.org/project/45378 | 1.0.8        | 1.0.13       |     
                erlang-p1-zlib |  DISTRO  | https://release-monitoring.org/project/09283 | 1.0.9        | 1.0.12       |     
                      execline |  DISTRO  | https://release-monitoring.org/project/05482 | 2.8.0.1      | 2.8.3.0      |     
                         expat |  DISTRO  | https://release-monitoring.org/project/00770 | 2.4.7        | 2.4.8        |     
                      fakeroot |  DISTRO  | https://release-monitoring.org/project/12048 | 1.26         | 1.28         | ORPH
                           feh |  DISTRO  | https://release-monitoring.org/project/00790 | 3.7.1        | 3.8          |     
                     fetchmail |  DISTRO  | https://release-monitoring.org/project/00801 | 6.4.29       | 6.4.30       |     
                        ffmpeg |  DISTRO  | https://release-monitoring.org/project/05405 | 4.4.2        | 5.0.1        |     
                   fftw-double |  DISTRO  | https://release-monitoring.org/project/00803 | 3.3.8        | 3.3.10       | ORPH
              fftw-long-double |  DISTRO  | https://release-monitoring.org/project/00803 | 3.3.8        | 3.3.10       | ORPH
                     fftw-quad |  DISTRO  | https://release-monitoring.org/project/00803 | 3.3.8        | 3.3.10       | ORPH
                   fftw-single |  DISTRO  | https://release-monitoring.org/project/00803 | 3.3.8        | 3.3.10       | ORPH
                           fio |  DISTRO  | https://release-monitoring.org/project/00806 | 3.28         | 3.30         |     
                       flannel |  DISTRO  | https://release-monitoring.org/project/07421 | 0.14.0       | 0.17.0       |     
                  flare-engine |  DISTRO  | https://release-monitoring.org/project/21433 | 1.12         | 1.13.04      |     
                    flare-game |  DISTRO  | https://release-monitoring.org/project/21434 | 1.12         | 1.13.04      |     
                          flot |  DISTRO  | https://release-monitoring.org/project/07184 | 0.8.3        | 4.2.2        | ORPH
                          fltk |  DISTRO  | https://release-monitoring.org/project/00823 | 1.3.7        | 1.3.8        | ORPH
                           fmc |  GUESS   | https://release-monitoring.org/project/145761 | fsl-sdk-v2.0 | 0.2.0        |     
                  font-awesome |  DISTRO  | https://release-monitoring.org/project/00826 | 4.7.0        | 6.1.1        | ORPH
                    fontconfig |  DISTRO  | https://release-monitoring.org/project/00827 | 2.13.1       | 2.14.0       | ORPH
                       freerdp |  DISTRO  | https://release-monitoring.org/project/10442 | 2.6.1        | 2.7.0        |     
                fuse-overlayfs |  DISTRO  | https://release-monitoring.org/project/101220 | 1.5.0        | 1.8.2        |     
                          fwts |  DISTRO  | https://release-monitoring.org/project/17383 | 21.11.00     | 22.03.00     |     
                        gauche |  DISTRO  | https://release-monitoring.org/project/00873 | 0.9.9        | 0.9.11       |     
                           gcr |  DISTRO  | https://release-monitoring.org/project/11801 | 3.40.0       | 3.41.0       | ORPH
                          gdbm |  DISTRO  | https://release-monitoring.org/project/00882 | 1.22         | 1.23         | ORPH
                    gdk-pixbuf |  DISTRO  | https://release-monitoring.org/project/09533 | 2.42.4       | 2.42.8       | ORPH
                        gensio |  DISTRO  | https://release-monitoring.org/project/67634 | 2.2.9        | 2.4.0        |     
                       gerbera |  DISTRO  | https://release-monitoring.org/project/18420 | 1.10.0       | 1.11.0       |     
                   gettext-gnu |  DISTRO  | https://release-monitoring.org/project/00898 | 0.20.1       | 0.21         | ORPH
                   ghostscript |  DISTRO  | https://release-monitoring.org/project/01157 | 9.55.0       | 9.56.1       |     
                           git |  DISTRO  | https://release-monitoring.org/project/05350 | 2.31.2       | 2.36.1       |     
                     git-crypt |  DISTRO  | https://release-monitoring.org/project/17093 | 0.6.0        | 0.7.0        | ORPH
               glib-networking |  DISTRO  | https://release-monitoring.org/project/21353 | 2.70.1       | 2.72.0       | ORPH
                        glibmm |  DISTRO  | https://release-monitoring.org/project/07960 | 2.68.2       | 2.72.1       |     
                           glm |  DISTRO  | https://release-monitoring.org/project/01181 | 0.9.9.5      | 0.9.9.8      | ORPH
                          glog |  DISTRO  | https://release-monitoring.org/project/08732 | 0.5.0        | 0.6.0        |     
                       gnu-efi |  DISTRO  | https://release-monitoring.org/project/01202 | 3.0.10       | 3.0.14       |     
                        gnupg2 |  DISTRO  | https://release-monitoring.org/project/01215 | 2.2.32       | 2.3.6        | ORPH
                      gnuradio |  DISTRO  | https://release-monitoring.org/project/01217 | 3.8.2.0      | 3.10.2.0     |     
         gobject-introspection |  DISTRO  | https://release-monitoring.org/project/01223 | 1.70.0       | 1.72.0       | ORPH
                          gpsd |  DISTRO  | https://release-monitoring.org/project/06846 | 3.23.1       | 3.24         |     
                      gptfdisk |  DISTRO  | https://release-monitoring.org/project/00885 | 1.0.8        | 1.0.9        |     
                          gqrx |  DISTRO  | https://release-monitoring.org/project/09771 | 2.14.4       | 2.15.9       |     
                       granite |  DISTRO  | https://release-monitoring.org/project/05410 | 6.0.0        | 7.0.0        | ORPH
                graphicsmagick |  DISTRO  | https://release-monitoring.org/project/01248 | 1.3.37       | 1.3.38       |     
                          grpc |  DISTRO  | https://release-monitoring.org/project/19117 | 1.45.2       | 1.46.0       |     
                         grub2 |  DISTRO  | https://release-monitoring.org/project/01257 | 2.04         | 2.06         |     
     gsettings-desktop-schemas |  DISTRO  | https://release-monitoring.org/project/13139 | 3.36.1       | 42.0         | ORPH
                           gsl |  DISTRO  | https://release-monitoring.org/project/01267 | 2.6          | 2.7.1        | ORPH
                         gssdp |  DISTRO  | https://release-monitoring.org/project/01262 | 1.4.0.1      | 1.5.0        |     
                       gst-omx |  DISTRO  | https://release-monitoring.org/project/21845 | 1.20.1       | 1.20.2       | ORPH
                 gst1-devtools |  DISTRO  | https://release-monitoring.org/project/21856 | 1.20.1       | 1.20.2       |     
                      gst1-imx |  DISTRO  | https://release-monitoring.org/project/21846 | 0.13.1       | 2.0.0        |     
                    gst1-libav |  DISTRO  | https://release-monitoring.org/project/21848 | 1.20.1       | 1.20.2       | ORPH
              gst1-plugins-bad |  DISTRO  | https://release-monitoring.org/project/21849 | 1.20.1       | 1.20.2       | ORPH
             gst1-plugins-base |  DISTRO  | https://release-monitoring.org/project/21850 | 1.20.1       | 1.20.2       | ORPH
             gst1-plugins-good |  DISTRO  | https://release-monitoring.org/project/21852 | 1.20.1       | 1.20.2       | ORPH
             gst1-plugins-ugly |  DISTRO  | https://release-monitoring.org/project/15187 | 1.20.1       | 1.20.2       | ORPH
                   gst1-python |  DISTRO  | https://release-monitoring.org/project/03881 | 1.20.1       | 1.20.2       | ORPH
              gst1-rtsp-server |  DISTRO  | https://release-monitoring.org/project/21853 | 1.20.1       | 1.20.2       | ORPH
                    gst1-vaapi |  DISTRO  | https://release-monitoring.org/project/21855 | 1.20.1       | 1.20.2       | ORPH
                    gstreamer1 |  DISTRO  | https://release-monitoring.org/project/01263 | 1.20.1       | 1.20.2       | ORPH
   gstreamer1-editing-services |  DISTRO  | https://release-monitoring.org/project/230920 | 1.20.1       | 1.20.2       |     
                        gtkmm3 |  DISTRO  | https://release-monitoring.org/project/07963 | 3.22.0       | 4.6.1        |     
                 gtksourceview |  DISTRO  | https://release-monitoring.org/project/07724 | 3.24.7       | 5.4.1        |     
                         gupnp |  DISTRO  | https://release-monitoring.org/project/01281 | 1.4.3        | 1.5.0        |     
                    gutenprint |  DISTRO  | https://release-monitoring.org/project/01285 | 5.2.14       | 5.3.4        | ORPH
                          gvfs |  DISTRO  | https://release-monitoring.org/project/05496 | 1.48.1       | 1.50.1       | ORPH
                        hackrf |  DISTRO  | https://release-monitoring.org/project/06136 | 2018.01.1    | 2021.03.1    | ORPH
                       haproxy |  DISTRO  | https://release-monitoring.org/project/01298 | 2.4.15       | 2.5.6        |     
                       haveged |  DISTRO  | https://release-monitoring.org/project/11695 | 1.9.15       | 1.9.18       |     
                        hidapi |  DISTRO  | https://release-monitoring.org/project/05594 | 0.11.0       | 0.11.2       | ORPH
                         hplip |  DISTRO  | https://release-monitoring.org/project/01327 | 3.17.10      | 3.22.4       | ORPH
                          htop |  DISTRO  | https://release-monitoring.org/project/01332 | 3.1.2        | 3.2.0        | ORPH
                        hwdata |  DISTRO  | https://release-monitoring.org/project/05387 | 0.358        | 0.359        | ORPH
                         hwloc |  DISTRO  | https://release-monitoring.org/project/13501 | 2.7.0        | 2.7.1        |     
                          i2pd |  DISTRO  | https://release-monitoring.org/project/21355 | 2.40.0       | 2.41.0       |     
                           icu |  DISTRO  | https://release-monitoring.org/project/16134 | 70-1         | 71-1         | ORPH
                     ifenslave |  DISTRO  | https://release-monitoring.org/project/21670 | 2.9          | 2.13         | ORPH
                      ifupdown |  DISTRO  | https://release-monitoring.org/project/21673 | 0.8.16       | 0.8.37       | ORPH
                   imagemagick |  DISTRO  | https://release-monitoring.org/project/01372 | 7.1.0-19     | 7.1.0-33     | ORPH
                        imlib2 |  DISTRO  | https://release-monitoring.org/project/21676 | 1.7.3        | 1.9.0        |     
                          inih |  DISTRO  | https://release-monitoring.org/project/11600 | 53           | 55           |     
                 inotify-tools |  DISTRO  | https://release-monitoring.org/project/08864 | 3.20.2.2     | 3.22.1.0     | ORPH
             intel-mediadriver |  DISTRO  | https://release-monitoring.org/project/20341 | 22.4.0       | 22.4.1       |     
                intel-mediasdk |  DISTRO  | https://release-monitoring.org/project/21814 | 22.4.0       | 22.4.1       |     
               intel-microcode |  DISTRO  | https://release-monitoring.org/project/20614 | 20210608     | 20220419     | ORPH
                         iperf |  DISTRO  | https://release-monitoring.org/project/01388 | 2.1.6        | 2.1.7        |     
                        iperf3 |  DISTRO  | https://release-monitoring.org/project/01389 | 3.10.1       | 3.11         |     
                      irrlicht |  DISTRO  | https://release-monitoring.org/project/01403 | 1.8.4        | 1.8.5        |     
                           isl |  DISTRO  | https://release-monitoring.org/project/13286 | 0.23         | 0.24         | ORPH
                           iwd |  DISTRO  | https://release-monitoring.org/project/18380 | 1.25         | 1.27         |     
                         jack2 |  DISTRO  | https://release-monitoring.org/project/21358 | 1.9.20       | 1.9.21       |     
                 janus-gateway |  DISTRO  | https://release-monitoring.org/project/15715 | 0.11.6       | 1.0.1        |     
                        jasper |  DISTRO  | https://release-monitoring.org/project/01421 | 2.0.33       | 3.0.3        |     
                      jemalloc |  DISTRO  | https://release-monitoring.org/project/01441 | 5.2.1        | 5.3.0        |     
         jitterentropy-library |  DISTRO  | https://release-monitoring.org/project/29701 | 3.3.1        | 3.4.0        |     
         jquery-datetimepicker |  DISTRO  | https://release-monitoring.org/project/13910 | 2.4.5        | 2.5.20       |     
               jquery-keyboard |  DISTRO  | https://release-monitoring.org/project/21681 | 1.18.12      | 1.30.4       | ORPH
                 jquery-mobile |  DISTRO  | https://release-monitoring.org/project/59395 | 1.4.3        | 1.4.5        | ORPH
                     jquery-ui |  DISTRO  | https://release-monitoring.org/project/21815 | 1.10.4       | 1.13.1       |     
              jquery-ui-themes |  DISTRO  | https://release-monitoring.org/project/21816 | 1.10.4       | 1.13.1       |     
                        json-c |  DISTRO  | https://release-monitoring.org/project/01477 | 0.15         | 0.16         |     
                         jszip |  DISTRO  | https://release-monitoring.org/project/141558 | 3.2.2        | 3.9.1        |     
                         kexec |  DISTRO  | https://release-monitoring.org/project/12689 | 2.0.23       | 2.0.24       | ORPH
       kf5-extra-cmake-modules |  DISTRO  | https://release-monitoring.org/project/08762 | 5.91.0       | 5.93.0       |     
               kf5-kcoreaddons |  DISTRO  | https://release-monitoring.org/project/08762 | 5.91.0       | 5.93.0       |     
           kf5-modemmanager-qt |  DISTRO  | https://release-monitoring.org/project/08762 | 5.91.0       | 5.93.0       |     
         kf5-networkmanager-qt |  DISTRO  | https://release-monitoring.org/project/08762 | 5.91.0       | 5.93.0       |     
     kodi-audiodecoder-modplug |  DISTRO  | https://release-monitoring.org/project/21818 | 19.0.2-Ma... | 20.2.0-Nexus |     
    kodi-audiodecoder-nosefart |  DISTRO  | https://release-monitoring.org/project/21819 | 19.0.2-Ma... | 20.2.0-Nexus |     
     kodi-audiodecoder-sidplay |  DISTRO  | https://release-monitoring.org/project/21820 | 19.0.1-Ma... | 20.2.0-Nexus |     
     kodi-audiodecoder-snesapu |  DISTRO  | https://release-monitoring.org/project/21802 | 19.0.2-Ma... | 20.2.0-Nexus |     
     kodi-audiodecoder-stsound |  DISTRO  | https://release-monitoring.org/project/21801 | 19.0.1-Ma... | 20.2.0-Nexus |     
    kodi-audiodecoder-timidity |  DISTRO  | https://release-monitoring.org/project/21800 | 19.0.2-Ma... | 20.2.0-Nexus |     
   kodi-audiodecoder-vgmstream |  DISTRO  | https://release-monitoring.org/project/21799 | 19.0.0-Ma... | 20.2.0-Nexus |     
        kodi-audioencoder-flac |  DISTRO  | https://release-monitoring.org/project/17755 | 19.0.1-Ma... | 20.2.0-Nexus |     
        kodi-audioencoder-lame |  DISTRO  | https://release-monitoring.org/project/21798 | 19.1.2-Ma... | 20.3.0-Nexus |     
      kodi-audioencoder-vorbis |  DISTRO  | https://release-monitoring.org/project/21797 | 19.0.1-Ma... | 20.2.0-Nexus |     
         kodi-audioencoder-wav |  DISTRO  | https://release-monitoring.org/project/21796 | 19.0.1-Ma... | 20.2.0-Nexus |     
     kodi-inputstream-adaptive |  DISTRO  | https://release-monitoring.org/project/21795 | 19.0.4-Ma... | 20.2.0-Nexus |     
 kodi-inputstream-ffmpegdirect |  DISTRO  | https://release-monitoring.org/project/177174 | 19.0.1-Ma... | 20.2.0-Nexus |     
         kodi-inputstream-rtmp |  DISTRO  | https://release-monitoring.org/project/21794 | 19.0.1-Ma... | 20.2.0-Nexus |     
      kodi-peripheral-joystick |  DISTRO  | https://release-monitoring.org/project/21793 | 19.0.2-Ma... | 20.1.1-Nexus |     
       kodi-peripheral-xarcade |  DISTRO  | https://release-monitoring.org/project/21791 | 19.0.3-Ma... | 20.1.1-Nexus |     
              kodi-pvr-argustv |  DISTRO  | https://release-monitoring.org/project/21788 | 19.2.1-Ma... | 20.4.1-Nexus |     
              kodi-pvr-dvblink |  DISTRO  | https://release-monitoring.org/project/21787 | 19.0.1-Ma... | 20.2.0-Nexus |     
            kodi-pvr-dvbviewer |  DISTRO  | https://release-monitoring.org/project/21786 | 19.0.2-Ma... | 20.2.0-Nexus |     
               kodi-pvr-filmon |  DISTRO  | https://release-monitoring.org/project/21785 | 19.0.1-Ma... | 20.2.1-Nexus |     
            kodi-pvr-hdhomerun |  DISTRO  | https://release-monitoring.org/project/21784 | 19.1.0-Ma... | 20.3.0-Nexus |     
                  kodi-pvr-hts |  DISTRO  | https://release-monitoring.org/project/21783 | 19.0.6-Ma... | 20.3.0-Nexus |     
           kodi-pvr-iptvsimple |  DISTRO  | https://release-monitoring.org/project/21782 | 19.1.0-Ma... | 20.3.0-Nexus |     
 kodi-pvr-mediaportal-tvserver |  DISTRO  | https://release-monitoring.org/project/21781 | 19.0.2-Ma... | 20.2.0-Nexus |     
               kodi-pvr-mythtv |  DISTRO  | https://release-monitoring.org/project/21780 | 19.0.8-Ma... | 20.2.5-Nexus |     
              kodi-pvr-nextpvr |  DISTRO  | https://release-monitoring.org/project/21779 | 19.0.3-Ma... | 20.2.3-Nexus |     
                 kodi-pvr-njoy |  DISTRO  | https://release-monitoring.org/project/21778 | 19.0.1-Ma... | 20.2.0-Nexus |     
              kodi-pvr-octonet |  DISTRO  | https://release-monitoring.org/project/100437 | 19.0.0-Ma... | 20.2.0-Nexus |     
                 kodi-pvr-pctv |  DISTRO  | https://release-monitoring.org/project/21777 | 19.0.1-Ma... | 20.3.0-Nexus |     
              kodi-pvr-plutotv |  DISTRO  | https://release-monitoring.org/project/241527 | 19.0.3-Ma... | 20.1.0-Nexus |     
              kodi-pvr-stalker |  DISTRO  | https://release-monitoring.org/project/21776 | 19.0.2-Ma... | 20.2.1-Nexus |     
                 kodi-pvr-vbox |  DISTRO  | https://release-monitoring.org/project/21775 | 19.0.0-Ma... | 20.2.0-Nexus |     
             kodi-pvr-vdr-vnsi |  DISTRO  | https://release-monitoring.org/project/21774 | 19.0.3-Ma... | 20.2.2-Nexus |     
               kodi-pvr-vuplus |  DISTRO  | https://release-monitoring.org/project/21773 | 19.0.0-Ma... | 20.3.0-Nexus |     
                kodi-pvr-waipu |  DISTRO  | https://release-monitoring.org/project/241529 | 19.2.1-Ma... | 20.4.2-Nexus |     
                  kodi-pvr-wmc |  DISTRO  | https://release-monitoring.org/project/21772 | 19.0.2-Ma... | 20.2.1-Nexus |     
               kodi-pvr-zattoo |  DISTRO  | https://release-monitoring.org/project/100438 | 19.7.14-M... | 20.2.1-Nexus |     
    kodi-screensaver-asteroids |  DISTRO  | https://release-monitoring.org/project/21771 | 19.0.1-Ma... | 20.1.0-Nexus |     
    kodi-screensaver-asterwave |  DISTRO  | https://release-monitoring.org/project/21770 | 19.0.1-Ma... | 20.1.0-Nexus |     
   kodi-screensaver-biogenesis |  DISTRO  | https://release-monitoring.org/project/21768 | 19.0.1-Ma... | 20.1.0-Nexus |     
      kodi-screensaver-cpblobs |  DISTRO  | https://release-monitoring.org/project/21767 | 19.0.1-Ma... | 20.1.0-Nexus |     
    kodi-screensaver-greynetic |  DISTRO  | https://release-monitoring.org/project/21765 | 19.0.1-Ma... | 20.1.0-Nexus |     
 kodi-screensaver-matrixtrails |  DISTRO  | https://release-monitoring.org/project/21764 | 19.0.1-Ma... | 20.1.0-Nexus |     
     kodi-screensaver-pingpong |  DISTRO  | https://release-monitoring.org/project/21763 | 19.0.1-Ma... | 20.1.0-Nexus |     
         kodi-screensaver-pyro |  DISTRO  | https://release-monitoring.org/project/21761 | 19.0.1-Ma... | 20.1.0-Nexus |     
         kodi-screensaver-rsxs |  DISTRO  | https://release-monitoring.org/project/21760 | 19.0.2-Ma... | 20.1.0-Nexus |     
        kodi-screensaver-stars |  DISTRO  | https://release-monitoring.org/project/21759 | 19.0.0-Ma... | 20.1.0-Nexus |     
           kodi-vfs-libarchive |  DISTRO  | https://release-monitoring.org/project/177173 | 19.0.1-Ma... | 20.1.0-Nexus |     
                  kodi-vfs-rar |  DISTRO  | https://release-monitoring.org/project/21900 | 19.0.1-Ma... | 20.1.0-Nexus |     
                 kodi-vfs-sftp |  DISTRO  | https://release-monitoring.org/project/21899 | 19.0.1-Ma... | 20.1.0-Nexus |     
    kodi-visualisation-fishbmc |  DISTRO  | https://release-monitoring.org/project/21758 | 19.0.1-Ma... | 20.1.0-Nexus |     
       kodi-visualisation-goom |  DISTRO  | https://release-monitoring.org/project/21757 | 19.0.1-Ma... | 20.1.0-Nexus |     
     kodi-visualisation-matrix |  DISTRO  | https://release-monitoring.org/project/177172 | 19.0.1-Ma... | 20.1.0-Nexus |     
  kodi-visualisation-shadertoy |  DISTRO  | https://release-monitoring.org/project/21756 | 19.1.2-Ma... | 20.2.0-Nexus |     
   kodi-visualisation-spectrum |  DISTRO  | https://release-monitoring.org/project/21755 | 19.0.1-Ma... | 20.1.0-Nexus |     
  kodi-visualisation-starburst |  DISTRO  | https://release-monitoring.org/project/85703 | 19.0.1-Ma... | 20.1.0-Nexus |     
   kodi-visualisation-waveform |  DISTRO  | https://release-monitoring.org/project/21753 | 19.0.2-Ma... | 20.1.0-Nexus |     
                       kvazaar |  DISTRO  | https://release-monitoring.org/project/12418 | 1.2.0        | 2.1.0        |     
                        lapack |  DISTRO  | https://release-monitoring.org/project/01534 | 3.10.0       | 3.10.1       |     
                         lcms2 |  DISTRO  | https://release-monitoring.org/project/09815 | 2.13         | 2.13.1       |     
                       lensfun |  DISTRO  | https://release-monitoring.org/project/01548 | 0.3.2        | 0.3.95       |     
                        libaio |  DISTRO  | https://release-monitoring.org/project/01557 | 0.3.112      | 0.3.113      | ORPH
                         libao |  DISTRO  | https://release-monitoring.org/project/07629 | 1.2.0        | 1.2.2        | ORPH
                   libblockdev |  DISTRO  | https://release-monitoring.org/project/09397 | 2.26         | 2.26-1       | ORPH
                        libbsd |  DISTRO  | https://release-monitoring.org/project/01567 | 0.11.3       | 0.11.6       |     
                     libcgroup |  DISTRO  | https://release-monitoring.org/project/01575 | 0.42.2       | 2.0.1        |     
                     libcodec2 |  DISTRO  | https://release-monitoring.org/project/14605 | 1.0.1        | 1.03         |     
                       libdnet |  DISTRO  | https://release-monitoring.org/project/06308 | 1.14         | 1.16.1       | ORPH
                       libfuse |  GUESS   | https://release-monitoring.org/project/00861 | 2.9.9        | 3.11.0       | ORPH
                      libfuse3 |  DISTRO  | https://release-monitoring.org/project/00861 | 3.10.5       | 3.11.0       |     
                    libgdiplus |  DISTRO  | https://release-monitoring.org/project/06440 | 6.0.5        | 6.1          |     
                      libglade |  DISTRO  | https://release-monitoring.org/project/01174 | 2.6.4        | 3.38.2       | ORPH
                       libglfw |  DISTRO  | https://release-monitoring.org/project/01180 | 3.3.6        | 3.3.7        |     
                      libglib2 |  DISTRO  | https://release-monitoring.org/project/10024 | 2.70.4       | 2.72.1       |     
                      libglvnd |  DISTRO  | https://release-monitoring.org/project/12098 | 1.3.2        | 1.4.0        | ORPH
                  libgpg-error |  DISTRO  | https://release-monitoring.org/project/01628 | 1.42         | 1.45         | ORPH
                      libgpgme |  DISTRO  | https://release-monitoring.org/project/01239 | 1.16.0       | 1.17.1       | ORPH
                    libgphoto2 |  DISTRO  | https://release-monitoring.org/project/12558 | 2.5.27       | 2.5.29       | ORPH
                       libgtk2 |  DISTRO  | https://release-monitoring.org/project/13942 | 2.24.33      | 4.7.0        |     
                      libgudev |  DISTRO  | https://release-monitoring.org/project/07735 | 236          | 237          |     
                     libiberty |  DISTRO  | https://release-monitoring.org/project/07981 | 2.32         | 2.38         |     
                       libical |  DISTRO  | https://release-monitoring.org/project/01637 | 1.0.1        | 3.0.14       |     
                      libiconv |  DISTRO  | https://release-monitoring.org/project/10656 | 1.15         | 1.16         | ORPH
                  libimxvpuapi |  DISTRO  | https://release-monitoring.org/project/21479 | 0.10.3       | 2.2.0        |     
                        libite |  DISTRO  | https://release-monitoring.org/project/17367 | 2.5.1        | 2.5.2        |     
                      libkcapi |  DISTRO  | https://release-monitoring.org/project/16828 | 1.1.5        | 1.4.0        | ORPH
                       libmbim |  DISTRO  | https://release-monitoring.org/project/07308 | 1.26.2       | 1.26.4       |     
                      libmhash |  DISTRO  | https://release-monitoring.org/project/21488 | 0.9.9.9      | 1.4          | ORPH
                  libminiupnpc |  DISTRO  | https://release-monitoring.org/project/01986 | 2.1.20201016 | 2.2.3        |     
                     libmspack |  DISTRO  | https://release-monitoring.org/project/16827 | 0.10.1alpha  | 1.9.1        |     
                   libnetconf2 |  DISTRO  | https://release-monitoring.org/project/31639 | 2.0.24       | 2.1.11       |     
         libnetfilter_cthelper |  DISTRO  | https://release-monitoring.org/project/01677 | 1.0.0        | 1.0.1        | ORPH
        libnetfilter_cttimeout |  DISTRO  | https://release-monitoring.org/project/01676 | 1.0.0        | 1.0.1        | ORPH
                  libnfnetlink |  DISTRO  | https://release-monitoring.org/project/01682 | 1.0.1        | 1.0.2        | ORPH
                        libnfs |  DISTRO  | https://release-monitoring.org/project/07325 | 4.0.0        | 5.0.1        | ORPH
                       libnice |  DISTRO  | https://release-monitoring.org/project/01683 | 0.1.18       | 0.1.19       |     
                         libnl |  DISTRO  | https://release-monitoring.org/project/01684 | 3.5.0        | 3.6.0        | ORPH
                        libolm |  DISTRO  | https://release-monitoring.org/project/29706 | 3.2.9        | 3.2.11       |     
                    libopenssl |  DISTRO  | https://release-monitoring.org/project/02566 | 1.1.1o       | 3.0.3        |     
                     libostree |  DISTRO  | https://release-monitoring.org/project/10899 | 2022.2       | 2022.3       |     
                   libpagekite |  DISTRO  | https://release-monitoring.org/project/21366 | 0.91.190530  | 0.91.201110  |     
            libpam-radius-auth |  DISTRO  | https://release-monitoring.org/project/57834 | 1.4.0        | 2.0.0        | ORPH
                       libpeas |  DISTRO  | https://release-monitoring.org/project/06871 | 1.30.0       | 1.32.0       | ORPH
                       libpqxx |  DISTRO  | https://release-monitoring.org/project/21367 | 6.4.5        | 7.7.3        |     
                         libqb |  DISTRO  | https://release-monitoring.org/project/09399 | 2.0.3        | 2.0.6        |     
                        libqmi |  DISTRO  | https://release-monitoring.org/project/07307 | 1.30.4       | 1.30.6       |     
                       librsvg |  DISTRO  | https://release-monitoring.org/project/05420 | 2.50.7       | 2.54.1       |     
                       librtas |  DISTRO  | https://release-monitoring.org/project/10717 | 2.0.2        | 2.0.3        | ORPH
                    libseccomp |  DISTRO  | https://release-monitoring.org/project/13823 | 2.5.3        | 2.5.4        |     
                   libsemanage |  DISTRO  | https://release-monitoring.org/project/01718 | 3.3          | 20200710     |     
                      libsepol |  DISTRO  | https://release-monitoring.org/project/01719 | 3.3          | 20200710     |     
                      libshout |  DISTRO  | https://release-monitoring.org/project/11084 | 2.4.5        | 2.4.6        | ORPH
                       libsigc |  DISTRO  | https://release-monitoring.org/project/07961 | 3.0.7        | 3.2.0        | ORPH
                    libsndfile |  DISTRO  | https://release-monitoring.org/project/13277 | 1.0.31       | 1.1.0        |     
                       libsoup |  DISTRO  | https://release-monitoring.org/project/11483 | 2.74.0       | 3.0.6        |     
                  libtextstyle |  DISTRO  | https://release-monitoring.org/project/00898 | 0.20.1       | 0.21         | ORPH
                       libtool |  DISTRO  | https://release-monitoring.org/project/01741 | 2.4.6        | 2.4.7        | ORPH
          libtorrent-rasterbar |  DISTRO  | https://release-monitoring.org/project/04166 | 1.2.15       | 2.0.6        |     
                     libunwind |  DISTRO  | https://release-monitoring.org/project/01748 | 1.5.0        | 1.6.2        | ORPH
                        libusb |  DISTRO  | https://release-monitoring.org/project/01749 | 1.0.25       | 1.0.26       |     
                         libuv |  DISTRO  | https://release-monitoring.org/project/10784 | 1.43.0       | 1.44.1       |     
                      libvdpau |  DISTRO  | https://release-monitoring.org/project/01755 | 1.4          | 1.5          |     
                       libvips |  DISTRO  | https://release-monitoring.org/project/05097 | 8.10.6       | 8.12.2       |     
                       libvirt |  DISTRO  | https://release-monitoring.org/project/224041 | 7.10.0       | 8.3.0        |     
                        libxcb |  DISTRO  | https://release-monitoring.org/project/01767 | 1.14         | 1.15         |     
                     libxmlrpc |  DISTRO  | https://release-monitoring.org/project/09024 | r3119        | 1.54.05      |     
                       libyang |  DISTRO  | https://release-monitoring.org/project/18554 | 2.0.112      | 2.0.194      |     
                      linphone |  DISTRO  | https://release-monitoring.org/project/01823 | 4.4.8        | 5.1.28       | ORPH
                linux-firmware |  DISTRO  | https://release-monitoring.org/project/141464 | 20220310     | 20220411     |     
                       live555 |  DISTRO  | https://release-monitoring.org/project/12414 | 2021.05.03   | 2022.04.26   | ORPH
                           lld |  DISTRO  | https://release-monitoring.org/project/01830 | 9.0.1        | 14.0.3       |     
                         lldpd |  DISTRO  | https://release-monitoring.org/project/14019 | 1.0.9        | 1.0.13       | ORPH
                          llvm |  DISTRO  | https://release-monitoring.org/project/01830 | 9.0.1        | 14.0.3       |     
                       log4cxx |  DISTRO  | https://release-monitoring.org/project/15330 | 0.12.1       | 0.13.0       |     
                     logrotate |  DISTRO  | https://release-monitoring.org/project/10567 | 3.18.0       | 3.19.0       |     
                          lpty |  DISTRO  | https://release-monitoring.org/project/11671 | 1.0.1-1      | 1.2.2        |     
                         lrzip |  DISTRO  | https://release-monitoring.org/project/01842 | 0.641        | 0.651        |     
                          lsof |  DISTRO  | https://release-monitoring.org/project/01844 | 4.94.0       | 4.95.0       | ORPH
                         ltris |  DISTRO  | https://release-monitoring.org/project/21503 | 1.2          | 1.2.4        |     
              lttng-babeltrace |  DISTRO  | https://release-monitoring.org/project/00155 | 1.5.7        | 1.5.8        |     
                  lttng-libust |  DISTRO  | https://release-monitoring.org/project/07135 | 2.13.1       | 2.13.2       |     
                 lttng-modules |  DISTRO  | https://release-monitoring.org/project/07141 | 2.13.1       | 2.13.3       |     
                   lttng-tools |  DISTRO  | https://release-monitoring.org/project/07136 | 2.13.2       | 2.13.7       |     
                           lua |  DISTRO  | https://release-monitoring.org/project/01847 | 5.1.5        | 5.4.4        |     
                lua-resty-http |  DISTRO  | https://release-monitoring.org/project/13887 | 0.15-0       | 0.16.1       |     
                          lvm2 |  DISTRO  | https://release-monitoring.org/project/05354 | 2.03.14      | 2.03.15      | ORPH
                          lynx |  DISTRO  | https://release-monitoring.org/project/01863 | 2.8.9rel.1   | 2.9.0        |     
                    lzma-alone |  DISTRO  | https://release-monitoring.org/project/242840 | 9.22         | 2107         | ORPH
                          lzop |  DISTRO  | https://release-monitoring.org/project/07486 | 1.03         | 1.04         |     
                          make |  DISTRO  | https://release-monitoring.org/project/01877 | 4.2.1        | 4.3          | ORPH
                  makedumpfile |  DISTRO  | https://release-monitoring.org/project/131396 | 1.7.0        | 1.7.1        |     
                       mariadb |  DISTRO  | https://release-monitoring.org/project/01887 | 10.3.34      | 10.8.2       | ORPH
             matchbox-keyboard |  DISTRO  | https://release-monitoring.org/project/230595 | 0.1          | 0.1.1        |     
                         matio |  DISTRO  | https://release-monitoring.org/project/01893 | 1.5.22       | 1.5.23       |     
                       mbedtls |  DISTRO  | https://release-monitoring.org/project/13824 | 2.28.0       | 3.1.0        |     
                        mbpfan |  DISTRO  | https://release-monitoring.org/project/115980 | 2.2.1        | 2.3.0        |     
                       mbuffer |  DISTRO  | https://release-monitoring.org/project/15518 | 20211018     | 20220418     |     
                        mcelog |  DISTRO  | https://release-monitoring.org/project/08093 | 180          | 181          |     
                         mdevd |  DISTRO  | https://release-monitoring.org/project/16553 | 0.1.4.0      | 0.1.5.1      |     
                 mediastreamer |  DISTRO  | https://release-monitoring.org/project/21746 | 4.4.8        | 5.1.29       | ORPH
                     memcached |  DISTRO  | https://release-monitoring.org/project/01965 | 1.6.12       | 1.6.15       | ORPH
                     memtest86 |  DISTRO  | https://release-monitoring.org/project/01966 | 5.01         | 5.31b        |     
                     memtester |  DISTRO  | https://release-monitoring.org/project/01967 | 4.5.0        | 4.5.1        |     
                        mesa3d |  DISTRO  | https://release-monitoring.org/project/01970 | 21.3.8       | 22.0.3       |     
                mesa3d-headers |  DISTRO  | https://release-monitoring.org/project/01970 | 21.3.8       | 22.0.3       |     
                      metacity |  DISTRO  | https://release-monitoring.org/project/15392 | 2.25.1       | 3.44.0       | ORPH
                      mfgtools |  DISTRO  | https://release-monitoring.org/project/21519 | 0.02         | 2.8.0        |     
                         mimic |  DISTRO  | https://release-monitoring.org/project/21521 | 1.1.0        | 1.3.0.1      |     
                      minetest |  DISTRO  | https://release-monitoring.org/project/01978 | 5.4.1        | 5.5.0        |     
                 minetest-game |  DISTRO  | https://release-monitoring.org/project/21522 | 5.4.1        | 5.5.0        |     
                       minizip |  DISTRO  | https://release-monitoring.org/project/17546 | 3.0.5        | 3.0.6        |     
mobile-broadband-provider-info |  DISTRO  | https://release-monitoring.org/project/10267 | 20190618     | 20220315     | ORPH
                 moby-buildkit |  DISTRO  | https://release-monitoring.org/project/20836 | 0.10.0       | 0.10.3       |     
                 modem-manager |  DISTRO  | https://release-monitoring.org/project/07306 | 1.18.6       | 1.18.8       |     
                       mongodb |  DISTRO  | https://release-monitoring.org/project/02008 | 4.2.18       | 5.3.1        |     
                      mongoose |  DISTRO  | https://release-monitoring.org/project/07603 | 7.2          | 7.6          |     
                         monit |  DISTRO  | https://release-monitoring.org/project/05483 | 5.26.0       | 5.32.0       |     
                          mono |  DISTRO  | https://release-monitoring.org/project/06360 | 6.12.0.122   | 6.12.0.178   |     
                        mpg123 |  DISTRO  | https://release-monitoring.org/project/12413 | 1.25.15      | 1.29.3       | ORPH
                           mpv |  DISTRO  | https://release-monitoring.org/project/05348 | 0.33.1       | 0.34.1       |     
                       msgpack |  DISTRO  | https://release-monitoring.org/project/12278 | 3.3.0        | 4.1.1        |     
                         msmtp |  DISTRO  | https://release-monitoring.org/project/02024 | 1.8.14       | 1.8.20       |     
                         mstpd |  DISTRO  | https://release-monitoring.org/project/235098 | 0.1.0        | 0.05         |     
                           mtd |  DISTRO  | https://release-monitoring.org/project/02026 | 2.1.3        | 2.1.4        |     
                        mtools |  DISTRO  | https://release-monitoring.org/project/02028 | 4.0.38       | 4.0.39       |     
                           mtr |  DISTRO  | https://release-monitoring.org/project/02029 | 0.94         | 0.95         | ORPH
                         mupdf |  DISTRO  | https://release-monitoring.org/project/02034 | 1.18.0       | 1.19.0       |     
                          musl |  DISTRO  | https://release-monitoring.org/project/11688 | 1.2.2        | 1.2.3        |     
                          mutt |  DISTRO  | https://release-monitoring.org/project/02035 | 2.2.3        | 2.2.4        |     
                          ncdu |  DISTRO  | https://release-monitoring.org/project/06045 | 1.16         | 2.1.2        |     
                       ncurses |  DISTRO  | https://release-monitoring.org/project/02057 | 6.1          | 6.3-20220507 | ORPH
                        netcat |  DISTRO  | https://release-monitoring.org/project/21534 | 0.7.1        | 1.218        | ORPH
                       netdata |  DISTRO  | https://release-monitoring.org/project/11046 | 1.33.1       | 1.34.1       |     
                       netifrc |  DISTRO  | https://release-monitoring.org/project/21917 | 0.6.1        | 0.7.3        |     
                     netopeer2 |  DISTRO  | https://release-monitoring.org/project/114978 | 2.0.35       | 2.1.23       |     
                       netsnmp |  DISTRO  | https://release-monitoring.org/project/02062 | 5.9          | 5.9.1        | ORPH
       network-manager-openvpn |  DISTRO  | https://release-monitoring.org/project/69977 | 1.8.14       | 1.8.18       |     
           networkd-dispatcher |  DISTRO  | https://release-monitoring.org/project/242008 | 2.1          | 2.2.2        |     
                      nftables |  DISTRO  | https://release-monitoring.org/project/02082 | 1.0.1        | 1.0.2        |     
                       nghttp2 |  DISTRO  | https://release-monitoring.org/project/08651 | 1.41.0       | 1.47.0       |     
                         nginx |  DISTRO  | https://release-monitoring.org/project/05413 | 1.20.1       | 1.21.6       |     
                         ninja |  DISTRO  | https://release-monitoring.org/project/02089 | 1.10.2.g5... | 1.10.2       |     
                        nodejs |  DISTRO  | https://release-monitoring.org/project/08251 | 14.18.3      | 18.1.0       |     
                      nss-mdns |  DISTRO  | https://release-monitoring.org/project/05491 | 0.14.1       | 0.15.1       | ORPH
                        nuttcp |  DISTRO  | https://release-monitoring.org/project/02511 | 6.1.2        | 8.2.2        |     
                 nvidia-driver |  DISTRO  | https://release-monitoring.org/project/21843 | 390.132      | 390.147      |     
               nvidia-modprobe |  DISTRO  | https://release-monitoring.org/project/141657 | 450.57       | 510.68.02    | ORPH
                          nvme |  DISTRO  | https://release-monitoring.org/project/09074 | 1.12         | 2.0          | ORPH
                     ocf-linux |  DISTRO  | https://release-monitoring.org/project/21541 | 20120127     | 20171122     | ORPH
                         ocrad |  DISTRO  | https://release-monitoring.org/project/02526 | 0.27         | 0.28         |     
                          ogre |  DISTRO  | https://release-monitoring.org/project/33334 | v1.12.12     | 13.3.4       |     
                     open62541 |  DISTRO  | https://release-monitoring.org/project/16896 | v1.2.2       | 1.3          | ORPH
                        openal |  DISTRO  | https://release-monitoring.org/project/08172 | 1.21.1       | 1.22.0       |     
                       opencv3 |  DISTRO  | https://release-monitoring.org/project/06615 | 3.4.17       | 4.5.5        |     
                openfpgaloader |  DISTRO  | https://release-monitoring.org/project/241709 | 0.6.1        | 0.8.0        |     
                       openjdk |  GUESS   | https://release-monitoring.org/project/176098 | 11.0.14.1+1  | 19+21        |     
                       openmpi |  DISTRO  | https://release-monitoring.org/project/02554 | 4.0.0        | 4.1.3        | ORPH
                 openpowerlink |  DISTRO  | https://release-monitoring.org/project/21550 | 2.7.1        | 2.7.2        |     
                        openrc |  DISTRO  | https://release-monitoring.org/project/11687 | 0.43.3       | 0.44.10      |     
                   openvmtools |  DISTRO  | https://release-monitoring.org/project/10998 | 10.3.5-10... | 12.0.0       |     
                          opkg |  DISTRO  | https://release-monitoring.org/project/59397 | 0.4.5        | 0.5.0        | ORPH
                    opkg-utils |  DISTRO  | https://release-monitoring.org/project/59396 | 0.4.5        | 0.5.0        |     
                  oracle-mysql |  DISTRO  | https://release-monitoring.org/project/00334 | 5.1.73       | 8.0.29       | ORPH
                          ortp |  DISTRO  | https://release-monitoring.org/project/21691 | 4.4.8        | 5.1.12       | ORPH
                       pangomm |  DISTRO  | https://release-monitoring.org/project/07958 | 2.48.2       | 2.50.0       |     
                    parprouted |  DISTRO  | https://release-monitoring.org/project/10309 | 0.7          | 0.65         | ORPH
                        parted |  DISTRO  | https://release-monitoring.org/project/02596 | 3.4          | 3.5          |     
                      patchelf |  DISTRO  | https://release-monitoring.org/project/02598 | 0.9          | 0.14.5       | ORPH
                     pax-utils |  DISTRO  | https://release-monitoring.org/project/02601 | 1.2.6        | 1.3.4        | ORPH
                     pcm-tools |  DISTRO  | https://release-monitoring.org/project/21377 | 202110       | 202203       | ORPH
                perl-crypt-cbc |  DISTRO  | https://release-monitoring.org/project/11930 | 2.33         | 3.04         |     
        perl-crypt-openssl-rsa |  DISTRO  | https://release-monitoring.org/project/02748 | 0.31         | 0.32         |     
                perl-dbd-mysql |  DISTRO  | https://release-monitoring.org/project/02807 | 4.046        | 4.050        |     
             perl-file-listing |  DISTRO  | https://release-monitoring.org/project/02892 | 6.14         | 6.15         |     
              perl-html-parser |  DISTRO  | https://release-monitoring.org/project/02967 | 3.76         | 3.78         |     
              perl-http-daemon |  DISTRO  | https://release-monitoring.org/project/02975 | 6.12         | 6.14         |     
              perl-libwww-perl |  DISTRO  | https://release-monitoring.org/project/03024 | 6.62         | 6.64         |     
                perl-mail-dkim |  DISTRO  | https://release-monitoring.org/project/11868 | 1.20200824   | 1.20220408   |     
              perl-mojolicious |  DISTRO  | https://release-monitoring.org/project/05966 | 9.24         | 9.25         |     
                 perl-net-http |  DISTRO  | https://release-monitoring.org/project/03152 | 6.21         | 6.22         |     
               perl-net-ssleay |  DISTRO  | https://release-monitoring.org/project/06575 | 1.85         | 1.92         |     
            perl-package-stash |  DISTRO  | https://release-monitoring.org/project/11885 | 0.39         | 0.40         |     
                  perl-sys-cpu |  DISTRO  | https://release-monitoring.org/project/14338 | 0.52         | 0.61         |     
               perl-xml-libxml |  DISTRO  | https://release-monitoring.org/project/03527 | 2.0134       | 2.0207       |     
                           php |  DISTRO  | https://release-monitoring.org/project/03627 | 8.0.18       | 8.1.5        |     
                      php-amqp |  DISTRO  | https://release-monitoring.org/project/15603 | 1.10.2       | 1.11.0       |     
                      php-apcu |  DISTRO  | https://release-monitoring.org/project/11010 | 5.1.20       | 5.1.21       |     
                     php-gnupg |  DISTRO  | https://release-monitoring.org/project/21743 | 1.5.0        | 1.5.1        | ORPH
                   php-imagick |  DISTRO  | https://release-monitoring.org/project/17401 | 3.5.0        | 3.7.0        | ORPH
                 php-memcached |  DISTRO  | https://release-monitoring.org/project/17400 | 3.1.5        | 3.2.0        | ORPH
                       php-pam |  DISTRO  | https://release-monitoring.org/project/241707 | 2.2.3        | 2.2.4        |     
                    php-xdebug |  DISTRO  | https://release-monitoring.org/project/13302 | 3.0.4        | 3.1.4        |     
                      php-yaml |  DISTRO  | https://release-monitoring.org/project/12515 | 2.2.1        | 2.2.2        | ORPH
                        pigpio |  DISTRO  | https://release-monitoring.org/project/21577 | 79           | 7301         |     
                          pigz |  DISTRO  | https://release-monitoring.org/project/03642 | 2.6          | 2.7          |     
                      pinentry |  DISTRO  | https://release-monitoring.org/project/03643 | 1.1.1        | 1.2.0        | ORPH
                      pipewire |  DISTRO  | https://release-monitoring.org/project/57357 | 0.3.50       | 0.3.51       |     
                 pkcs11-helper |  DISTRO  | https://release-monitoring.org/project/91990 | 1.28         | 1.29.0       | ORPH
                       pkgconf |  DISTRO  | https://release-monitoring.org/project/12753 | 1.6.3        | 1.8.0        | ORPH
                          poco |  DISTRO  | https://release-monitoring.org/project/05418 | 1.11.1       | 1.11.2       |     
                          poke |  DISTRO  | https://release-monitoring.org/project/179926 | 2.1          | 2.3          | ORPH
               policycoreutils |  DISTRO  | https://release-monitoring.org/project/03680 | 3.2          | 20200710     |     
                       poppler |  DISTRO  | https://release-monitoring.org/project/03686 | 21.12.0      | 22.05.0      |     
                 powerpc-utils |  DISTRO  | https://release-monitoring.org/project/10715 | 1.3.8        | 1.3.9        | ORPH
                      powertop |  DISTRO  | https://release-monitoring.org/project/03702 | 2.13         | 2.14         |     
                     procps-ng |  DISTRO  | https://release-monitoring.org/project/03708 | 3.3.17       | 4.0.0        | ORPH
                       proftpd |  DISTRO  | https://release-monitoring.org/project/07609 | 1.3.6e       | 1.3.7d       |     
                          proj |  DISTRO  | https://release-monitoring.org/project/21570 | 8.1.1        | 9.0.0        |     
                       prosody |  DISTRO  | https://release-monitoring.org/project/03709 | 0.11.13      | 0.12.0       |     
                proxychains-ng |  DISTRO  | https://release-monitoring.org/project/06499 | 4.14         | 4.16         | ORPH
          pru-software-support |  DISTRO  | https://release-monitoring.org/project/21825 | 6.0.1        | 6.1.0        |     
                          ptpd |  GUESS   | https://release-monitoring.org/project/03726 | 1.1.0        | 2.3.1        | ORPH
                    pulseaudio |  DISTRO  | https://release-monitoring.org/project/03729 | 14.2         | 15.0         |     
             python-aioblescan |  DISTRO  | https://release-monitoring.org/project/21242 | 0.2.8        | 0.2.13       |     
                python-aiocoap |  DISTRO  | https://release-monitoring.org/project/21243 | 0.4.1        | 0.4.3        |     
        python-aiohttp-remotes |  DISTRO  | https://release-monitoring.org/project/21248 | 1.1.0        | 1.2.0        |     
                python-aiojobs |  DISTRO  | https://release-monitoring.org/project/21252 | 0.3.0        | 1.0.0        |     
              python-alsaaudio |  DISTRO  | https://release-monitoring.org/project/10072 | 0.8.4        | 0.9.2        |     
                  python-arrow |  DISTRO  | https://release-monitoring.org/project/05314 | 1.2.0        | 1.2.2        |     
                python-asgiref |  DISTRO  | https://release-monitoring.org/project/18462 | 3.3.4        | 3.5.1        |     
              python-async-lru |  DISTRO  | https://release-monitoring.org/project/56566 | 1.0.2        | 1.0.3        |     
               python-autobahn |  DISTRO  | https://release-monitoring.org/project/07015 | 22.3.2       | 22.4.2       |     
                  python-babel |  DISTRO  | https://release-monitoring.org/project/11984 | 2.9.1        | 2.10.1       |     
                 python-bcrypt |  DISTRO  | https://release-monitoring.org/project/09047 | 3.2.0        | 3.2.2        |     
         python-beautifulsoup4 |  DISTRO  | https://release-monitoring.org/project/03779 | 4.10.0       | 4.11.1       |     
                  python-bleak |  DISTRO  | https://release-monitoring.org/project/26271 | 0.12.1       | 0.14.3       |     
                  python-boto3 |  DISTRO  | https://release-monitoring.org/project/08778 | 1.19.2       | 1.22.9       |     
               python-botocore |  DISTRO  | https://release-monitoring.org/project/08748 | 1.22.2       | 1.25.9       |     
                python-canopen |  DISTRO  | https://release-monitoring.org/project/23230 | 1.0.0        | 2.0.0b1      |     
                  python-cbor2 |  DISTRO  | https://release-monitoring.org/project/64102 | 5.4.2.post1  | 5.4.3        |     
               python-channels |  DISTRO  | https://release-monitoring.org/project/21937 | 2.3.1        | 3.0.4        |     
         python-channels-redis |  DISTRO  | https://release-monitoring.org/project/21936 | 2.4.1        | 3.4.0        |     
                python-cheroot |  DISTRO  | https://release-monitoring.org/project/20163 | 8.2.1        | 8.6.0        |     
               python-cherrypy |  DISTRO  | https://release-monitoring.org/project/03799 | 12.0.1       | 18.6.1       |     
                  python-click |  DISTRO  | https://release-monitoring.org/project/03802 | 7.1.2        | 8.1.3        |     
               python-colorlog |  DISTRO  | https://release-monitoring.org/project/12509 | 6.4.1        | 6.6.0        |     
         python-configshell-fb |  DISTRO  | https://release-monitoring.org/project/19734 | 1.1.29       | 1.5          |     
               python-crossbar |  DISTRO  | https://release-monitoring.org/project/21696 | 21.3.1       | 22.4.1       |     
           python-cryptography |  DISTRO  | https://release-monitoring.org/project/05532 | 37.0.1       | 37.0.2       |     
               python-cssutils |  DISTRO  | https://release-monitoring.org/project/13259 | 2.3.0        | 2.4.0        |     
                 python-cython |  DISTRO  | https://release-monitoring.org/project/12679 | 0.29.27      | 3.0.0a10     |     
                 python-daemon |  DISTRO  | https://release-monitoring.org/project/03816 | 2.2.3        | 2.3.0        |     
                 python-daphne |  DISTRO  | https://release-monitoring.org/project/21939 | 2.4.1        | 3.0.2        |     
           python-dataproperty |  DISTRO  | https://release-monitoring.org/project/21697 | 0.54.2       | 0.55.0       |     
              python-decorator |  DISTRO  | https://release-monitoring.org/project/03819 | 5.1.0        | 5.1.1        |     
                python-dialog3 |  DISTRO  | https://release-monitoring.org/project/03823 | 3.5.1        | 3.5.3        |     
              python-dnspython |  DISTRO  | https://release-monitoring.org/project/13190 | 2.1.0        | 2.2.1        |     
                 python-docker |  DISTRO  | https://release-monitoring.org/project/03847 | 4.1.0        | 5.0.3        |     
                  python-ecdsa |  DISTRO  | https://release-monitoring.org/project/08370 | 0.17.0       | 0.18.0b2     |     
               python-engineio |  DISTRO  | https://release-monitoring.org/project/15064 | 4.2.1        | 4.3.2        |     
            python-entrypoints |  DISTRO  | https://release-monitoring.org/project/12081 | 0.3          | 0.4          |     
                 python-falcon |  DISTRO  | https://release-monitoring.org/project/03860 | 3.0.1        | 3.1.0        |     
               python-filelock |  DISTRO  | https://release-monitoring.org/project/11739 | 3.3.0        | 3.6.0        |     
                  python-flask |  DISTRO  | https://release-monitoring.org/project/03867 | 1.1.2        | 2.1.2        |     
     python-flask-expects-json |  DISTRO  | https://release-monitoring.org/project/127659 | 1.5.0        | 1.7.0        |     
          python-flask-jsonrpc |  DISTRO  | https://release-monitoring.org/project/21698 | 0.3.1        | 2.2.0        |     
            python-flask-login |  DISTRO  | https://release-monitoring.org/project/03868 | 0.5.0        | 0.6.1        |     
       python-flask-sqlalchemy |  DISTRO  | https://release-monitoring.org/project/05701 | 2.4.1        | 2.5.1        |     
              python-flask-wtf |  DISTRO  | https://release-monitoring.org/project/05702 | 0.15.1       | 1.0.1        |     
              python-fonttools |  DISTRO  | https://release-monitoring.org/project/07388 | 4.32.0       | 4.33.3       |     
                    python-git |  DISTRO  | https://release-monitoring.org/project/06459 | 3.1.24       | 3.1.27       |     
                 python-gitdb2 |  DISTRO  | https://release-monitoring.org/project/12730 | 4.0.7        | 4.0.9        |     
                python-gobject |  DISTRO  | https://release-monitoring.org/project/13158 | 3.42.0       | 3.42.1       |     
               python-httplib2 |  DISTRO  | https://release-monitoring.org/project/03887 | 0.19.1       | 0.20.4       |     
               python-humanize |  DISTRO  | https://release-monitoring.org/project/19799 | 3.11.0       | 4.0.0        |     
                python-ipython |  DISTRO  | https://release-monitoring.org/project/01399 | 7.31.1       | 8.3.0        |     
                python-iso8601 |  DISTRO  | https://release-monitoring.org/project/17228 | 0.1.14       | 1.0.2        |     
           python-itsdangerous |  DISTRO  | https://release-monitoring.org/project/03892 | 2.0.1        | 2.1.2        |     
                  python-iwlib |  DISTRO  | https://release-monitoring.org/project/51611 | 1.5          | 1.7.0        |     
         python-jaraco-classes |  DISTRO  | https://release-monitoring.org/project/20150 | 2.0          | 3.2.1        |     
       python-jaraco-functools |  DISTRO  | https://release-monitoring.org/project/20165 | 2.0          | 3.5.0        |     
                 python-jinja2 |  DISTRO  | https://release-monitoring.org/project/03894 | 3.0.3        | 3.1.2        |     
               python-jmespath |  DISTRO  | https://release-monitoring.org/project/08749 | 0.10.0       | 1.0.0        |     
             python-jsonschema |  DISTRO  | https://release-monitoring.org/project/03898 | 2.5.1        | 4.5.1        |     
                python-keyring |  DISTRO  | https://release-monitoring.org/project/03901 | 19.2.0       | 23.5.0       |     
             python-kiwisolver |  DISTRO  | https://release-monitoring.org/project/16910 | 1.1.0        | 1.4.2        |     
                python-libusb1 |  DISTRO  | https://release-monitoring.org/project/12301 | 2.0.1        | 3.0.0        |     
                   python-mako |  DISTRO  | https://release-monitoring.org/project/03915 | 1.1.5        | 1.2.0        |     
               python-markdown |  DISTRO  | https://release-monitoring.org/project/03916 | 3.3.4        | 3.3.7        |     
              python-markdown2 |  DISTRO  | https://release-monitoring.org/project/03917 | 2.4.1        | 2.4.3        |     
             python-markupsafe |  DISTRO  | https://release-monitoring.org/project/03918 | 2.0.1        | 2.1.1        |     
             python-matplotlib |  DISTRO  | https://release-monitoring.org/project/03919 | 3.4.3        | 3.5.2        |     
        python-memory-profiler |  DISTRO  | https://release-monitoring.org/project/38508 | 0.58.0       | 0.60.0       |     
                python-mistune |  DISTRO  | https://release-monitoring.org/project/06189 | 0.8.4        | 2.0.2        |     
         python-more-itertools |  DISTRO  | https://release-monitoring.org/project/12201 | 8.10.0       | 8.13.0       |     
                  python-msgfy |  DISTRO  | https://release-monitoring.org/project/29716 | 0.1.0        | 0.2.0        |     
         python-networkmanager |  DISTRO  | https://release-monitoring.org/project/12909 | 2.1          | 2.2          |     
               python-networkx |  DISTRO  | https://release-monitoring.org/project/07791 | 2.6.3        | 2.8          |     
                  python-numpy |  DISTRO  | https://release-monitoring.org/project/02509 | 1.21.2       | 1.22.3       |     
               python-oauthlib |  DISTRO  | https://release-monitoring.org/project/05377 | 3.1.1        | 3.2.0        |     
          python-opcua-asyncio |  DISTRO  | https://release-monitoring.org/project/131612 | 0.8.4        | 0.98.9       |     
                 python-orjson |  DISTRO  | https://release-monitoring.org/project/31737 | 3.6.7        | 3.6.8        |     
              python-paho-mqtt |  DISTRO  | https://release-monitoring.org/project/06084 | 1.4.0        | 1.6.1        |     
               python-paramiko |  DISTRO  | https://release-monitoring.org/project/03954 | 2.10.3       | 2.10.4       |     
                 python-pathpy |  DISTRO  | https://release-monitoring.org/project/21703 | 12.0.1       | 12.5.0       |     
                    python-pbr |  DISTRO  | https://release-monitoring.org/project/03960 | 5.6.0        | 5.9.0        |     
                    python-pip |  DISTRO  | https://release-monitoring.org/project/06529 | 21.2.4       | 22.1b1       |     
                python-portend |  DISTRO  | https://release-monitoring.org/project/20203 | 2.5          | 3.1.0        |     
         python-prompt-toolkit |  DISTRO  | https://release-monitoring.org/project/08742 | 3.0.20       | 3.0.29       |     
                 python-psutil |  DISTRO  | https://release-monitoring.org/project/03978 | 5.8.0        | 5.9.0        |     
               python-psycopg2 |  DISTRO  | https://release-monitoring.org/project/03979 | 2.9.1        | 2.9.3        |     
                   python-pudb |  DISTRO  | https://release-monitoring.org/project/03980 | 2021.1       | 2022.1.1     |     
                     python-py |  DISTRO  | https://release-monitoring.org/project/03981 | 1.10.0       | 1.11.0       |     
                 python-pybind |  DISTRO  | https://release-monitoring.org/project/13384 | 2.9.0        | 2.9.2        |     
                python-pycairo |  DISTRO  | https://release-monitoring.org/project/13166 | 1.19.1       | 1.21.0       |     
               python-pydantic |  DISTRO  | https://release-monitoring.org/project/29768 | 1.8.2        | 1.9.0        |     
             python-pyelftools |  DISTRO  | https://release-monitoring.org/project/16219 | 0.27         | 0.28         |     
                 python-pygame |  DISTRO  | https://release-monitoring.org/project/17480 | d61ea8eabd56 | 2.1.2        |     
               python-pygments |  DISTRO  | https://release-monitoring.org/project/03986 | 2.7.4        | 2.12.0       |     
             python-pyhamcrest |  DISTRO  | https://release-monitoring.org/project/11633 | 2.0.2        | 2.0.3        |     
                  python-pyicu |  DISTRO  | https://release-monitoring.org/project/12004 | 1.9.7        | 2.9          |     
              python-pylibftdi |  DISTRO  | https://release-monitoring.org/project/21583 | 0.18.1       | 0.20.0       |     
                  python-pylru |  DISTRO  | https://release-monitoring.org/project/21584 | 1.2.0        | 1.2.1        |     
               python-pymodbus |  DISTRO  | https://release-monitoring.org/project/15600 | 2.2.0        | 2.5.3        |     
                python-pymupdf |  DISTRO  | https://release-monitoring.org/project/17320 | 1.18.14      | 1.19.6       |     
              python-pyopenssl |  DISTRO  | https://release-monitoring.org/project/05535 | 21.0.0       | 22.0.0       |     
               python-pyparted |  DISTRO  | https://release-monitoring.org/project/15558 | 3.11.6       | 3.12.0       |     
                  python-pyqt5 |  DISTRO  | https://release-monitoring.org/project/20104 | 5.7          | 5.15.6       |     
               python-pyroute2 |  DISTRO  | https://release-monitoring.org/project/20081 | 0.5.7        | 0.6.9        |     
          python-pytablereader |  DISTRO  | https://release-monitoring.org/project/21592 | 0.26.1       | 0.31.3       |     
          python-pytablewriter |  DISTRO  | https://release-monitoring.org/project/21593 | 0.46.1       | 0.64.2       |     
                 python-pytest |  DISTRO  | https://release-monitoring.org/project/03765 | 6.2.5        | 7.1.2        |     
         python-pytest-asyncio |  DISTRO  | https://release-monitoring.org/project/07273 | 0.15.1       | 0.18.3       |     
                   python-pytz |  DISTRO  | https://release-monitoring.org/project/06537 | 2021.3       | 2022.1       |     
                 python-pyudev |  DISTRO  | https://release-monitoring.org/project/08485 | 0.22.0       | 0.23.2       |     
                  python-pyzmq |  DISTRO  | https://release-monitoring.org/project/04104 | 19.0.2       | 23.0.0b1     |     
                  python-redis |  DISTRO  | https://release-monitoring.org/project/03992 | 3.5.3        | 4.3.0        |     
                python-reentry |  DISTRO  | https://release-monitoring.org/project/21596 | 1.3.2        | 1.3.3        |     
                  python-regex |  DISTRO  | https://release-monitoring.org/project/05548 | 2021.4.4     | 2022.4.24    |     
                   python-remi |  DISTRO  | https://release-monitoring.org/project/21597 | 2021.3.2     | 2022.3.7     |     
      python-requests-oauthlib |  DISTRO  | https://release-monitoring.org/project/11803 | 1.3.0        | 1.3.1        |     
               python-rpi-gpio |  DISTRO  | https://release-monitoring.org/project/12026 | 0.7.0        | 0.7.1        |     
             python-rpi-ws281x |  DISTRO  | https://release-monitoring.org/project/21898 | 4.3.0        | 4.3.4        |     
                    python-rsa |  DISTRO  | https://release-monitoring.org/project/08808 | 4.7.2        | 4.8          |     
              python-rtslib-fb |  DISTRO  | https://release-monitoring.org/project/19641 | 2.1.74       | 2.2          |     
             python-s3transfer |  DISTRO  | https://release-monitoring.org/project/10428 | 0.5.0        | 0.5.2        |     
          python-secretstorage |  DISTRO  | https://release-monitoring.org/project/04020 | 3.1.2        | 3.3.2        |     
       python-semantic-version |  DISTRO  | https://release-monitoring.org/project/06514 | 2.8.5        | 2.9.0        |     
             python-sentry-sdk |  DISTRO  | https://release-monitoring.org/project/21603 | 1.4.3        | 1.5.11       |     
       python-service-identity |  DISTRO  | https://release-monitoring.org/project/07917 | 18.1.0       | 21.1.0       |     
           python-setproctitle |  DISTRO  | https://release-monitoring.org/project/11699 | 1.2.2        | 1.2.3        |     
           python-simplesqlite |  DISTRO  | https://release-monitoring.org/project/21608 | 0.45.2       | 1.3.0        |     
                    python-sip |  DISTRO  | https://release-monitoring.org/project/13626 | 4.18         | 5.0.0        |     
                 python-smmap2 |  DISTRO  | https://release-monitoring.org/project/12729 | 4.0.0        | 5.0.0        |     
               python-socketio |  DISTRO  | https://release-monitoring.org/project/21611 | 5.4.0        | 5.6.0        |     
              python-soupsieve |  DISTRO  | https://release-monitoring.org/project/27570 | 2.2.1        | 2.3.2.post1  |     
             python-sqlalchemy |  DISTRO  | https://release-monitoring.org/project/04034 | 1.3.10       | 1.4.36       |     
           python-sqliteschema |  DISTRO  | https://release-monitoring.org/project/29718 | 1.2.1        | 1.3.0        |     
               python-sqlparse |  DISTRO  | https://release-monitoring.org/project/04038 | 0.3.0        | 0.4.2        |     
                python-tempora |  DISTRO  | https://release-monitoring.org/project/21225 | 1.14.1       | 5.0.1        |     
                 python-thrift |  DISTRO  | https://release-monitoring.org/project/21614 | 0.13.0       | 0.16.0       |     
                python-tornado |  DISTRO  | https://release-monitoring.org/project/07498 | 6.0.4        | 6.1          |     
                   python-tqdm |  DISTRO  | https://release-monitoring.org/project/11524 | 4.40.1       | 4.64.0       |     
              python-traitlets |  DISTRO  | https://release-monitoring.org/project/12211 | 5.1.0        | 5.1.1        |     
                python-twisted |  DISTRO  | https://release-monitoring.org/project/04071 | 22.2.0       | 22.4.0       |     
               python-txtorcon |  DISTRO  | https://release-monitoring.org/project/19661 | 21.1.0       | 22.0.0       |     
 python-unittest-xml-reporting |  DISTRO  | https://release-monitoring.org/project/72281 | 3.0.4        | 3.2.0        |     
             python-validators |  DISTRO  | https://release-monitoring.org/project/19818 | 0.15.0       | 0.19.0       |     
               python-watchdog |  DISTRO  | https://release-monitoring.org/project/05341 | 2.1.6        | 2.1.7        |     
                python-wcwidth |  DISTRO  | https://release-monitoring.org/project/08743 | 0.1.9        | 0.2.5        |     
             python-weasyprint |  DISTRO  | https://release-monitoring.org/project/11057 | 54.3         | 55.0b1       |     
                  python-webpy |  DISTRO  | https://release-monitoring.org/project/04090 | 0.40         | 0.62         |     
       python-websocket-client |  DISTRO  | https://release-monitoring.org/project/07288 | 0.58.0       | 1.3.2        |     
             python-websockets |  DISTRO  | https://release-monitoring.org/project/08100 | 10.0         | 10.3         |     
               python-werkzeug |  DISTRO  | https://release-monitoring.org/project/04092 | 1.0.1        | 2.1.2        |     
                  python-wrapt |  DISTRO  | https://release-monitoring.org/project/06108 | 1.12.1       | 1.14.1       |     
                python-wtforms |  DISTRO  | https://release-monitoring.org/project/11805 | 2.3.3        | 3.0.1        |     
                   python-xlib |  DISTRO  | https://release-monitoring.org/project/12180 | 0.27         | 0.31         |     
             python-xlsxwriter |  DISTRO  | https://release-monitoring.org/project/12031 | 3.0.1        | 3.0.3        |     
              python-xmltodict |  DISTRO  | https://release-monitoring.org/project/15109 | 0.12.0       | 0.13.0       |     
                   python-yarl |  DISTRO  | https://release-monitoring.org/project/12895 | 1.7.2        | 1.8.0        |     
               python-zeroconf |  DISTRO  | https://release-monitoring.org/project/12681 | 0.29.0       | 0.38.6       |     
          qcom-db410c-firmware |  DISTRO  | https://release-monitoring.org/project/235382 | 1034.2.1     | 1036.1       |     
                          qpdf |  DISTRO  | https://release-monitoring.org/project/05542 | 10.5.0       | 10.6.3       |     
                   qpid-proton |  DISTRO  | https://release-monitoring.org/project/15198 | 0.35.0       | 0.37.0       |     
                       qt5coap |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.3.0        |     
                        qt5knx |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.3.0        |     
                       qt5mqtt |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.3.0        |     
                      qt5opcua |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.3.0        |     
                  qt5webengine |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.3.0        |     
                        quazip |  DISTRO  | https://release-monitoring.org/project/04141 | 1.2          | 1.3          |     
                           qwt |  DISTRO  | https://release-monitoring.org/project/04147 | 6.1.6        | 6.2.0        | ORPH
               rabbitmq-server |  DISTRO  | https://release-monitoring.org/project/05585 | 3.8.2        | 3.10.0       |     
                         ragel |  DISTRO  | https://release-monitoring.org/project/12105 | 6.10         | 7.0.4        | ORPH
                        ranger |  DISTRO  | https://release-monitoring.org/project/07426 | 1.7.2        | 1.9.3        |     
                   restorecond |  DISTRO  | https://release-monitoring.org/project/16520 | 3.3          | 20200710     | ORPH
              riemann-c-client |  DISTRO  | https://release-monitoring.org/project/21389 | 1.10.5       | 2.0.0        | ORPH
                       rocksdb |  DISTRO  | https://release-monitoring.org/project/15560 | 6.20.3       | 7.2.2        |     
                         rsync |  DISTRO  | https://release-monitoring.org/project/04217 | 3.2.3        | 3.2.4        | ORPH
                       rsyslog |  DISTRO  | https://release-monitoring.org/project/04218 | 8.2010.0     | 8.2204.1     |     
                          rtty |  DISTRO  | https://release-monitoring.org/project/87994 | 7.4.0        | 8.0.0        |     
                          ruby |  DISTRO  | https://release-monitoring.org/project/04223 | 3.1.0        | 3.1.2        |     
                         rygel |  DISTRO  | https://release-monitoring.org/project/04751 | 0.40.2       | 0.40.3       |     
                            s6 |  DISTRO  | https://release-monitoring.org/project/05485 | 2.10.0.3     | 2.11.1.0     |     
                        s6-dns |  DISTRO  | https://release-monitoring.org/project/16547 | 2.3.5.1      | 2.3.5.3      |     
                 s6-linux-init |  DISTRO  | https://release-monitoring.org/project/16552 | 1.0.6.3      | 1.0.7.3      |     
                s6-linux-utils |  DISTRO  | https://release-monitoring.org/project/16551 | 2.5.1.5      | 2.5.1.7      |     
                 s6-networking |  DISTRO  | https://release-monitoring.org/project/16550 | 2.4.1.1      | 2.5.1.0      |     
             s6-portable-utils |  DISTRO  | https://release-monitoring.org/project/16549 | 2.2.3.2      | 2.2.4.0      |     
                         s6-rc |  DISTRO  | https://release-monitoring.org/project/16548 | 0.5.2.2      | 0.5.3.1      |     
                      safeclib |  DISTRO  | https://release-monitoring.org/project/21385 | 3.7.1        | 01022022     |     
                        samba4 |  DISTRO  | https://release-monitoring.org/project/04758 | 4.15.7       | 4.16.1       |     
                 sane-backends |  DISTRO  | https://release-monitoring.org/project/04760 | 1.0.32       | 1.1.1        |     
                         scons |  DISTRO  | https://release-monitoring.org/project/04770 | 3.1.2        | 4.3.0        |     
                       sdl_gfx |  DISTRO  | https://release-monitoring.org/project/04778 | 2.0.23       | 2.0.25       | ORPH
                     sdl_sound |  DISTRO  | https://release-monitoring.org/project/10262 | 1.0.3        | 2.0.1        | ORPH
                        sdparm |  DISTRO  | https://release-monitoring.org/project/04787 | 1.10         | 1.12         |     
                       sedutil |  DISTRO  | https://release-monitoring.org/project/15203 | 1.15.1       | 1.20.0       |     
                    sentry-cli |  DISTRO  | https://release-monitoring.org/project/135642 | 1.59.0       | 2.0.4        |     
                 sentry-native |  DISTRO  | https://release-monitoring.org/project/135639 | 0.4.1        | 0.4.17       |     
                       ser2net |  DISTRO  | https://release-monitoring.org/project/21655 | 4.3.4        | 4.3.5        |     
              shared-mime-info |  DISTRO  | https://release-monitoring.org/project/05524 | 1.12         | 2.2          | ORPH
                          shim |  DISTRO  | https://release-monitoring.org/project/10719 | 15.4         | 15.5         |     
                       skalibs |  DISTRO  | https://release-monitoring.org/project/05486 | 2.10.0.3     | 2.11.2.0     |     
                         slirp |  DISTRO  | https://release-monitoring.org/project/96796 | 4.6.1        | 4.7.0        |     
                 smartmontools |  DISTRO  | https://release-monitoring.org/project/04835 | 7.2          | 7.3          | ORPH
                        sngrep |  DISTRO  | https://release-monitoring.org/project/17075 | 1.4.7        | 1.5.0        | ORPH
                        snmppp |  DISTRO  | https://release-monitoring.org/project/21318 | 3.4.9        | 3.4.10       |     
                        snort3 |  DISTRO  | https://release-monitoring.org/project/13263 | 3.1.18.0     | 3.1.29.0     |     
                     sofia-sip |  DISTRO  | https://release-monitoring.org/project/10509 | 1.13.6-41... | 1.13.7       |     
                     softether |  DISTRO  | https://release-monitoring.org/project/21383 | 4.30-9700... | 4.38-9760... |     
       sound-theme-freedesktop |  DISTRO  | https://release-monitoring.org/project/10152 | 0.7          | 0.8          |     
                       spandsp |  DISTRO  | https://release-monitoring.org/project/12600 | 3.0.0-6ec... | 3.0.0        |     
                    sphinxbase |  DISTRO  | https://release-monitoring.org/project/20548 | 5prealpha    | 0.8          |     
                spice-protocol |  DISTRO  | https://release-monitoring.org/project/14892 | 0.14.3       | 0.14.4       |     
                     sqlcipher |  DISTRO  | https://release-monitoring.org/project/11213 | 4.5.0        | 4.5.1        |     
                        sqlite |  DISTRO  | https://release-monitoring.org/project/04877 | 3.38.3       | 3.38.5       |     
                      squashfs |  DISTRO  | https://release-monitoring.org/project/04879 | 4.5          | 4.5.1        |     
                         squid |  DISTRO  | https://release-monitoring.org/project/04880 | 5.3          | 5.5          | ORPH
                         sshfs |  DISTRO  | https://release-monitoring.org/project/11058 | 3.7.1        | 3.7.2        | ORPH
             start-stop-daemon |  DISTRO  | https://release-monitoring.org/project/08127 | 1.20.7.1     | 1.21.7       | ORPH
                    stm32flash |  DISTRO  | https://release-monitoring.org/project/227276 | 0.6          | 0.7          |     
                        stress |  DISTRO  | https://release-monitoring.org/project/08048 | 1.0.4        | 1.0.5        |     
                    strongswan |  DISTRO  | https://release-monitoring.org/project/04899 | 5.9.5        | 5.9.6        |     
                       stunnel |  DISTRO  | https://release-monitoring.org/project/04901 | 5.60         | 5.64         |     
                          sudo |  DISTRO  | https://release-monitoring.org/project/04906 | 1.9.8p2      | 1.9.10       | ORPH
                    supervisor |  DISTRO  | https://release-monitoring.org/project/16289 | 4.2.2        | 4.2.4        | ORPH
                       synergy |  DISTRO  | https://release-monitoring.org/project/05718 | 2.0.12-beta  | 2.3.2        |     
                        sysdig |  DISTRO  | https://release-monitoring.org/project/16898 | 0.29.2       | 0.29.3       |     
                     syslog-ng |  DISTRO  | https://release-monitoring.org/project/04930 | 3.35.1       | 3.36.1       |     
                       sysprof |  DISTRO  | https://release-monitoring.org/project/21649 | 1.2.0        | 3.44.0       |     
                       sysrepo |  DISTRO  | https://release-monitoring.org/project/34820 | 2.0.53       | 2.1.64       |     
                       sysstat |  DISTRO  | https://release-monitoring.org/project/04931 | 12.4.2       | 12.5.6       | ORPH
         system-config-printer |  DISTRO  | https://release-monitoring.org/project/08855 | 1.5.15       | 1.5.16       | ORPH
             systemd-bootchart |  DISTRO  | https://release-monitoring.org/project/11774 | 233          | 234          |     
                      sysvinit |  DISTRO  | https://release-monitoring.org/project/21648 | 2.99         | 3.04         | ORPH
                         tclap |  DISTRO  | https://release-monitoring.org/project/04942 | 1.2.4        | 1.2.5        |     
                        tcllib |  DISTRO  | https://release-monitoring.org/project/04943 | 1.20         | 1.21         |     
                     tcpreplay |  DISTRO  | https://release-monitoring.org/project/13716 | 4.3.4        | 4.4.1        | ORPH
                 tesseract-ocr |  DISTRO  | https://release-monitoring.org/project/04954 | 5.0.1        | 5.1.0        |     
                      thermald |  DISTRO  | https://release-monitoring.org/project/14500 | 2.4.8        | 2.4.9        |     
                        thrift |  DISTRO  | https://release-monitoring.org/project/05581 | 0.14.1       | 0.16.0       | ORPH
                      tinifier |  DISTRO  | https://release-monitoring.org/project/241900 | 3.4.0        | 3.5.0        |     
                       tinyssh |  DISTRO  | https://release-monitoring.org/project/14678 | 20210601     | 20220311     |     
                       tinyxml |  DISTRO  | https://release-monitoring.org/project/10162 | 2.6.2_2      | 2.6.2        | ORPH
                           tio |  DISTRO  | https://release-monitoring.org/project/20587 | 1.32         | 1.37         |     
                          tmux |  DISTRO  | https://release-monitoring.org/project/04980 | 3.1c         | 3.2a         |     
                     tpm-tools |  DISTRO  | https://release-monitoring.org/project/21640 | 1.3.9.1      | 1.3.9.2      |     
                    tpm2-abrmd |  DISTRO  | https://release-monitoring.org/project/16819 | 2.3.3        | 2.4.1        | ORPH
                   tpm2-pkcs11 |  DISTRO  | https://release-monitoring.org/project/18777 | 1.7.0        | 1.8.0        |     
                     tpm2-totp |  DISTRO  | https://release-monitoring.org/project/18790 | 0.2.1        | 0.3.0        |     
                      tpm2-tss |  DISTRO  | https://release-monitoring.org/project/12683 | 3.1.0        | 3.2.0        | ORPH
                     trace-cmd |  DISTRO  | https://release-monitoring.org/project/07873 | 2.9.7        | 3.0.3        |     
                        tzdata |  DISTRO  | https://release-monitoring.org/project/05021 | 2021e        | 2022a        |     
                   uboot-tools |  DISTRO  | https://release-monitoring.org/project/05022 | 2021.07      | 2022.04      |     
                       udpcast |  DISTRO  | https://release-monitoring.org/project/10206 | 20200328     | 20211207     | ORPH
                       uftrace |  DISTRO  | https://release-monitoring.org/project/195039 | 0.10         | 0.11         |     
                           uhd |  DISTRO  | https://release-monitoring.org/project/12572 | 3.15.0.0     | 4.2.0.0      |     
                       unionfs |  DISTRO  | https://release-monitoring.org/project/17617 | 2.1          | 2.2          |     
                      unixodbc |  DISTRO  | https://release-monitoring.org/project/07344 | 2.3.9        | 2.3.11       |     
                         unrar |  DISTRO  | https://release-monitoring.org/project/13306 | 6.1.3        | 6.1.7        | ORPH
                      upmpdcli |  DISTRO  | https://release-monitoring.org/project/15848 | 1.5.12       | 1.5.16       |     
                        upower |  DISTRO  | https://release-monitoring.org/project/05056 | 0.99.11      | 0.99.17      |     
                           uvw |  DISTRO  | https://release-monitoring.org/project/33083 | 2.11.0_li... | 2.12.1_li... |     
                          vala |  DISTRO  | https://release-monitoring.org/project/05065 | 0.52.4       | 0.56.1       | ORPH
                           vim |  DISTRO  | https://release-monitoring.org/project/05092 | 8.2.4843     | 8.2.4922     | ORPH
                        vnstat |  DISTRO  | https://release-monitoring.org/project/07283 | 2.8          | 2.9          |     
                          vpnc |  DISTRO  | https://release-monitoring.org/project/15955 | 0.5.3r550... | 0.5.3        | ORPH
                           vte |  DISTRO  | https://release-monitoring.org/project/10895 | 0.66.2       | 0.68.0       | ORPH
                  vuejs-router |  DISTRO  | https://release-monitoring.org/project/234796 | 4.0.14       | 4.0.15       |     
                vulkan-headers |  DISTRO  | https://release-monitoring.org/project/88835 | 1.2.203      | 1.3.212      | ORPH
                        waffle |  DISTRO  | https://release-monitoring.org/project/21633 | 1.6.1        | 1.7.0        |     
                     waylandpp |  DISTRO  | https://release-monitoring.org/project/16969 | 0.2.8        | 1.0.0        |     
       webrtc-audio-processing |  DISTRO  | https://release-monitoring.org/project/15929 | 0.3.1        | 1.0          | ORPH
                         whois |  DISTRO  | https://release-monitoring.org/project/05128 | 5.5.11       | 5.5.13       |     
                          wine |  DISTRO  | https://release-monitoring.org/project/05134 | 6.0          | 7.8          |     
        wireguard-linux-compat |  DISTRO  | https://release-monitoring.org/project/62379 | 1.0.20210606 | 1.0.20211208 |     
                wireless-regdb |  DISTRO  | https://release-monitoring.org/project/15257 | 2022.02.18   | 2022.04.08   |     
                   wireplumber |  DISTRO  | https://release-monitoring.org/project/235056 | 0.4.8        | 0.4.9        | ORPH
                     wireshark |  DISTRO  | https://release-monitoring.org/project/05137 | 3.4.12       | 3.6.5        | ORPH
                   xapp_appres |  DISTRO  | https://release-monitoring.org/project/15053 | 1.0.5        | 1.0.6        |     
                   xapp_bitmap |  DISTRO  | https://release-monitoring.org/project/00191 | 1.0.9        | 1.1.0        |     
                  xapp_editres |  DISTRO  | https://release-monitoring.org/project/17160 | 1.0.7        | 1.0.8        |     
                  xapp_iceauth |  DISTRO  | https://release-monitoring.org/project/15048 | 1.0.8        | 1.0.9        |     
                  xapp_listres |  DISTRO  | https://release-monitoring.org/project/17161 | 1.0.4        | 1.0.5        |     
                     xapp_luit |  DISTRO  | https://release-monitoring.org/project/15047 | 1.1.1        | 20220111     |     
              xapp_mkfontscale |  DISTRO  | https://release-monitoring.org/project/15043 | 1.2.1        | 1.2.2        |     
                   xapp_rstart |  DISTRO  | https://release-monitoring.org/project/21256 | 1.0.5        | 1.0.6        |     
                xapp_setxkbmap |  DISTRO  | https://release-monitoring.org/project/12314 | 1.3.2        | 1.3.3        |     
                      xapp_twm |  DISTRO  | https://release-monitoring.org/project/15038 | 1.0.11       | 1.0.12       |     
                    xapp_xauth |  DISTRO  | https://release-monitoring.org/project/05253 | 1.1.1        | 1.1.2        |     
                    xapp_xcalc |  DISTRO  | https://release-monitoring.org/project/05164 | 1.1.0        | 1.1.1        |     
                   xapp_xclock |  DISTRO  | https://release-monitoring.org/project/15032 | 1.0.9        | 1.1.1        |     
                      xapp_xdm |  DISTRO  | https://release-monitoring.org/project/05255 | 1.1.12       | 1.1.13       |     
                 xapp_xdpyinfo |  DISTRO  | https://release-monitoring.org/project/15028 | 1.3.2        | 1.3.3        |     
                    xapp_xedit |  DISTRO  | https://release-monitoring.org/project/05180 | 1.2.2        | 1.2.3        |     
                    xapp_xload |  DISTRO  | https://release-monitoring.org/project/14992 | 1.1.3        | 1.1.4        |     
                 xapp_xlsfonts |  DISTRO  | https://release-monitoring.org/project/14964 | 1.0.6        | 1.0.7        |     
                      xapp_xsm |  DISTRO  | https://release-monitoring.org/project/05259 | 1.0.4        | 1.0.5        |     
                     xcb-proto |  DISTRO  | https://release-monitoring.org/project/13646 | 1.14.1       | 1.15         |     
   xdriver_xf86-input-libinput |  DISTRO  | https://release-monitoring.org/project/05782 | 1.2.0        | 1.2.1        |     
     xdriver_xf86-video-amdgpu |  DISTRO  | https://release-monitoring.org/project/15900 | 19.1.0       | 22.0.0       |     
      xdriver_xf86-video-dummy |  DISTRO  | https://release-monitoring.org/project/05216 | 0.3.8        | 0.4.0        |     
                           xen |  DISTRO  | https://release-monitoring.org/project/05181 | 4.14.4       | 4.16.1       |     
                      xfsprogs |  DISTRO  | https://release-monitoring.org/project/05188 | 5.14.2       | 5.16.0       | ORPH
                        xinetd |  DISTRO  | https://release-monitoring.org/project/06382 | 2.3.15       | 2.3.15.4     |     
              xkeyboard-config |  DISTRO  | https://release-monitoring.org/project/05191 | 2.34         | 2.35.1       |     
                   xlib_libX11 |  DISTRO  | https://release-monitoring.org/project/01764 | 1.7.3.1      | 1.8          |     
               xlib_libXcursor |  DISTRO  | https://release-monitoring.org/project/01770 | 1.2.0        | 1.2.1        |     
                  xlib_libXvMC |  DISTRO  | https://release-monitoring.org/project/01796 | 1.0.12       | 1.0.13       |     
                     xorgproto |  DISTRO  | https://release-monitoring.org/project/17190 | 2021.5       | 2022.1       |     
           xserver_xorg-server |  DISTRO  | https://release-monitoring.org/project/05250 | 21.1.2       | 21.1.3       |     
                xtables-addons |  DISTRO  | https://release-monitoring.org/project/07736 | 3.17         | 3.20         | ORPH
                         xterm |  DISTRO  | https://release-monitoring.org/project/05272 | 371          | 372          | ORPH
                           yad |  DISTRO  | https://release-monitoring.org/project/05280 | 0.40.0       | 12.0         |     
                      yaml-cpp |  DISTRO  | https://release-monitoring.org/project/05284 | 0.6.3        | 0.7.0        | ORPH
                        zabbix |  DISTRO  | https://release-monitoring.org/project/05492 | 5.4.9        | 6.0.4        |     
                           zic |  DISTRO  | https://release-monitoring.org/project/16905 | 2021e        | 2022a        |     

Packages having CVEs
====================

CVEs for the 'master' branch
----------------------------

             name              |       CVE        |                             link                            
-------------------------------+------------------+--------------------------------------------------------------
                        apache | CVE-1999-0236    | https://security-tracker.debian.org/tracker/CVE-1999-0236   
                        apache | CVE-1999-0289    | https://security-tracker.debian.org/tracker/CVE-1999-0289   
                        apache | CVE-1999-0678    | https://security-tracker.debian.org/tracker/CVE-1999-0678   
                        apache | CVE-1999-1237    | https://security-tracker.debian.org/tracker/CVE-1999-1237   
                        apache | CVE-1999-1412    | https://security-tracker.debian.org/tracker/CVE-1999-1412   
                        apache | CVE-2007-0086    | https://security-tracker.debian.org/tracker/CVE-2007-0086   
                        apache | CVE-2007-0450    | https://security-tracker.debian.org/tracker/CVE-2007-0450   
                        apache | CVE-2007-4465    | https://security-tracker.debian.org/tracker/CVE-2007-4465   
                        apache | CVE-2007-5000    | https://security-tracker.debian.org/tracker/CVE-2007-5000   
                        apache | CVE-2007-6388    | https://security-tracker.debian.org/tracker/CVE-2007-6388   
                        apache | CVE-2007-6420    | https://security-tracker.debian.org/tracker/CVE-2007-6420   
                        apache | CVE-2007-6421    | https://security-tracker.debian.org/tracker/CVE-2007-6421   
                        apache | CVE-2007-6422    | https://security-tracker.debian.org/tracker/CVE-2007-6422   
                        apache | CVE-2007-6423    | https://security-tracker.debian.org/tracker/CVE-2007-6423   
                        apache | CVE-2008-0455    | https://security-tracker.debian.org/tracker/CVE-2008-0455   
                        apache | CVE-2008-2168    | https://security-tracker.debian.org/tracker/CVE-2008-2168   
                        apache | CVE-2008-2939    | https://security-tracker.debian.org/tracker/CVE-2008-2939   
                        apache | CVE-2009-1195    | https://security-tracker.debian.org/tracker/CVE-2009-1195   
                        apache | CVE-2009-1890    | https://security-tracker.debian.org/tracker/CVE-2009-1890   
                        apache | CVE-2009-1891    | https://security-tracker.debian.org/tracker/CVE-2009-1891   
                        apache | CVE-2009-2699    | https://security-tracker.debian.org/tracker/CVE-2009-2699   
                        apache | CVE-2010-0408    | https://security-tracker.debian.org/tracker/CVE-2010-0408   
                        apache | CVE-2010-0425    | https://security-tracker.debian.org/tracker/CVE-2010-0425   
                        apache | CVE-2010-0434    | https://security-tracker.debian.org/tracker/CVE-2010-0434   
                        apache | CVE-2010-1452    | https://security-tracker.debian.org/tracker/CVE-2010-1452   
                        apache | CVE-2014-0231    | https://security-tracker.debian.org/tracker/CVE-2014-0231   
                      apparmor | CVE-2016-1585    | https://security-tracker.debian.org/tracker/CVE-2016-1585   
                         argus | CVE-2011-3332    | https://security-tracker.debian.org/tracker/CVE-2011-3332   
                         asn1c | CVE-2017-12966   | https://security-tracker.debian.org/tracker/CVE-2017-12966  
                          atop | CVE-2011-3618    | https://security-tracker.debian.org/tracker/CVE-2011-3618   
                         avahi | CVE-2021-3468    | https://security-tracker.debian.org/tracker/CVE-2021-3468   
                     belle-sip | CVE-2021-33056   | https://security-tracker.debian.org/tracker/CVE-2021-33056  
                     belle-sip | CVE-2021-43610   | https://security-tracker.debian.org/tracker/CVE-2021-43610  
                     belle-sip | CVE-2021-43611   | https://security-tracker.debian.org/tracker/CVE-2021-43611  
                        bento4 | CVE-2020-23331   | https://security-tracker.debian.org/tracker/CVE-2020-23331  
                        bento4 | CVE-2020-23332   | https://security-tracker.debian.org/tracker/CVE-2020-23332  
                        bento4 | CVE-2022-27607   | https://security-tracker.debian.org/tracker/CVE-2022-27607  
                    berkeleydb | CVE-2017-3604    | https://security-tracker.debian.org/tracker/CVE-2017-3604   
                    berkeleydb | CVE-2017-3605    | https://security-tracker.debian.org/tracker/CVE-2017-3605   
                    berkeleydb | CVE-2017-3606    | https://security-tracker.debian.org/tracker/CVE-2017-3606   
                    berkeleydb | CVE-2017-3607    | https://security-tracker.debian.org/tracker/CVE-2017-3607   
                    berkeleydb | CVE-2017-3608    | https://security-tracker.debian.org/tracker/CVE-2017-3608   
                    berkeleydb | CVE-2017-3609    | https://security-tracker.debian.org/tracker/CVE-2017-3609   
                    berkeleydb | CVE-2017-3610    | https://security-tracker.debian.org/tracker/CVE-2017-3610   
                    berkeleydb | CVE-2017-3611    | https://security-tracker.debian.org/tracker/CVE-2017-3611   
                    berkeleydb | CVE-2017-3612    | https://security-tracker.debian.org/tracker/CVE-2017-3612   
                    berkeleydb | CVE-2017-3613    | https://security-tracker.debian.org/tracker/CVE-2017-3613   
                    berkeleydb | CVE-2017-3614    | https://security-tracker.debian.org/tracker/CVE-2017-3614   
                    berkeleydb | CVE-2017-3615    | https://security-tracker.debian.org/tracker/CVE-2017-3615   
                    berkeleydb | CVE-2017-3616    | https://security-tracker.debian.org/tracker/CVE-2017-3616   
                    berkeleydb | CVE-2017-3617    | https://security-tracker.debian.org/tracker/CVE-2017-3617   
                    berkeleydb | CVE-2019-2708    | https://security-tracker.debian.org/tracker/CVE-2019-2708   
                    berkeleydb | CVE-2020-2981    | https://security-tracker.debian.org/tracker/CVE-2020-2981   
                      binutils | CVE-2021-45078   | https://security-tracker.debian.org/tracker/CVE-2021-45078  
                       bitcoin | CVE-2012-1909    | https://security-tracker.debian.org/tracker/CVE-2012-1909   
                       bitcoin | CVE-2012-4682    | https://security-tracker.debian.org/tracker/CVE-2012-4682   
                       bitcoin | CVE-2012-4683    | https://security-tracker.debian.org/tracker/CVE-2012-4683   
                       bitcoin | CVE-2013-2272    | https://security-tracker.debian.org/tracker/CVE-2013-2272   
                       bitcoin | CVE-2013-2273    | https://security-tracker.debian.org/tracker/CVE-2013-2273   
                       bitcoin | CVE-2013-2292    | https://security-tracker.debian.org/tracker/CVE-2013-2292   
                       bitcoin | CVE-2013-2293    | https://security-tracker.debian.org/tracker/CVE-2013-2293   
                       bitcoin | CVE-2013-3220    | https://security-tracker.debian.org/tracker/CVE-2013-3220   
                  bluez5_utils | CVE-2020-12352   | https://security-tracker.debian.org/tracker/CVE-2020-12352  
                  bluez5_utils | CVE-2020-24490   | https://security-tracker.debian.org/tracker/CVE-2020-24490  
          bluez5_utils-headers | CVE-2020-12352   | https://security-tracker.debian.org/tracker/CVE-2020-12352  
          bluez5_utils-headers | CVE-2020-24490   | https://security-tracker.debian.org/tracker/CVE-2020-24490  
                        bsdiff | CVE-2020-14315   | https://security-tracker.debian.org/tracker/CVE-2020-14315  
                       busybox | CVE-2022-28391   | https://security-tracker.debian.org/tracker/CVE-2022-28391  
                         cairo | CVE-2019-6461    | https://security-tracker.debian.org/tracker/CVE-2019-6461   
                         cairo | CVE-2019-6462    | https://security-tracker.debian.org/tracker/CVE-2019-6462   
                         cairo | CVE-2020-35492   | https://security-tracker.debian.org/tracker/CVE-2020-35492  
                    cifs-utils | CVE-2022-27239   | https://security-tracker.debian.org/tracker/CVE-2022-27239  
                    cifs-utils | CVE-2022-29869   | https://security-tracker.debian.org/tracker/CVE-2022-29869  
                        clamav | CVE-2016-1405    | https://security-tracker.debian.org/tracker/CVE-2016-1405   
                     coreutils | CVE-2016-2781    | https://security-tracker.debian.org/tracker/CVE-2016-2781   
                          cpio | CVE-2010-4226    | https://security-tracker.debian.org/tracker/CVE-2010-4226   
                      cryptopp | CVE-2021-43398   | https://security-tracker.debian.org/tracker/CVE-2021-43398  
                          cups | CVE-2018-6553    | https://security-tracker.debian.org/tracker/CVE-2018-6553   
                           cvs | CVE-2017-12836   | https://security-tracker.debian.org/tracker/CVE-2017-12836  
                     darkhttpd | CVE-2020-25691   | https://security-tracker.debian.org/tracker/CVE-2020-25691  
                       dnsmasq | CVE-2021-45951   | https://security-tracker.debian.org/tracker/CVE-2021-45951  
                       dnsmasq | CVE-2021-45952   | https://security-tracker.debian.org/tracker/CVE-2021-45952  
                       dnsmasq | CVE-2021-45953   | https://security-tracker.debian.org/tracker/CVE-2021-45953  
                       dnsmasq | CVE-2021-45954   | https://security-tracker.debian.org/tracker/CVE-2021-45954  
                       dnsmasq | CVE-2021-45955   | https://security-tracker.debian.org/tracker/CVE-2021-45955  
                       dnsmasq | CVE-2021-45956   | https://security-tracker.debian.org/tracker/CVE-2021-45956  
                       dnsmasq | CVE-2021-45957   | https://security-tracker.debian.org/tracker/CVE-2021-45957  
                        docker | CVE-2014-0048    | https://security-tracker.debian.org/tracker/CVE-2014-0048   
                        docker | CVE-2014-8178    | https://security-tracker.debian.org/tracker/CVE-2014-8178   
                        docker | CVE-2014-8179    | https://security-tracker.debian.org/tracker/CVE-2014-8179   
                        docker | CVE-2015-1843    | https://security-tracker.debian.org/tracker/CVE-2015-1843   
                        docker | CVE-2015-3627    | https://security-tracker.debian.org/tracker/CVE-2015-3627   
                        docker | CVE-2015-3630    | https://security-tracker.debian.org/tracker/CVE-2015-3630   
                        docker | CVE-2015-3631    | https://security-tracker.debian.org/tracker/CVE-2015-3631   
                        docker | CVE-2016-3697    | https://security-tracker.debian.org/tracker/CVE-2016-3697   
                        docker | CVE-2017-14992   | https://security-tracker.debian.org/tracker/CVE-2017-14992  
                        docker | CVE-2019-13139   | https://security-tracker.debian.org/tracker/CVE-2019-13139  
                        docker | CVE-2019-13509   | https://security-tracker.debian.org/tracker/CVE-2019-13509  
                        docker | CVE-2019-15752   | https://security-tracker.debian.org/tracker/CVE-2019-15752  
                        docker | CVE-2019-16884   | https://security-tracker.debian.org/tracker/CVE-2019-16884  
                        docker | CVE-2019-5736    | https://security-tracker.debian.org/tracker/CVE-2019-5736   
                        docker | CVE-2020-27534   | https://security-tracker.debian.org/tracker/CVE-2020-27534  
                        docker | CVE-2021-21284   | https://security-tracker.debian.org/tracker/CVE-2021-21284  
                        docker | CVE-2021-21285   | https://security-tracker.debian.org/tracker/CVE-2021-21285  
                        docker | CVE-2021-3162    | https://security-tracker.debian.org/tracker/CVE-2021-3162   
                        docker | CVE-2021-33183   | https://security-tracker.debian.org/tracker/CVE-2021-33183  
                        docker | CVE-2022-25365   | https://security-tracker.debian.org/tracker/CVE-2022-25365  
                     e2fsprogs | CVE-2022-1304    | https://security-tracker.debian.org/tracker/CVE-2022-1304   
                          edk2 | CVE-2014-4859    | https://security-tracker.debian.org/tracker/CVE-2014-4859   
                          edk2 | CVE-2014-4860    | https://security-tracker.debian.org/tracker/CVE-2014-4860   
                          edk2 | CVE-2014-8271    | https://security-tracker.debian.org/tracker/CVE-2014-8271   
                          edk2 | CVE-2019-14553   | https://security-tracker.debian.org/tracker/CVE-2019-14553  
                          edk2 | CVE-2019-14559   | https://security-tracker.debian.org/tracker/CVE-2019-14559  
                          edk2 | CVE-2019-14562   | https://security-tracker.debian.org/tracker/CVE-2019-14562  
                          edk2 | CVE-2019-14563   | https://security-tracker.debian.org/tracker/CVE-2019-14563  
                          edk2 | CVE-2019-14575   | https://security-tracker.debian.org/tracker/CVE-2019-14575  
                          edk2 | CVE-2019-14586   | https://security-tracker.debian.org/tracker/CVE-2019-14586  
                          edk2 | CVE-2019-14587   | https://security-tracker.debian.org/tracker/CVE-2019-14587  
                         emlog | CVE-2021-44584   | https://security-tracker.debian.org/tracker/CVE-2021-44584  
                        erlang | CVE-2020-35733   | https://security-tracker.debian.org/tracker/CVE-2020-35733  
                          exim | CVE-2020-28017   | https://security-tracker.debian.org/tracker/CVE-2020-28017  
                         exiv2 | CVE-2007-6353    | https://security-tracker.debian.org/tracker/CVE-2007-6353   
                        ffmpeg | CVE-2021-38291   | https://security-tracker.debian.org/tracker/CVE-2021-38291  
                       freerdp | CVE-2022-24882   | https://security-tracker.debian.org/tracker/CVE-2022-24882  
                       freerdp | CVE-2022-24883   | https://security-tracker.debian.org/tracker/CVE-2022-24883  
                      freetype | CVE-2022-27404   | https://security-tracker.debian.org/tracker/CVE-2022-27404  
                      freetype | CVE-2022-27405   | https://security-tracker.debian.org/tracker/CVE-2022-27405  
                      freetype | CVE-2022-27406   | https://security-tracker.debian.org/tracker/CVE-2022-27406  
                        giflib | CVE-2022-28506   | https://security-tracker.debian.org/tracker/CVE-2022-28506  
                           git | CVE-2022-24765   | https://security-tracker.debian.org/tracker/CVE-2022-24765  
                           git | CVE-2022-24975   | https://security-tracker.debian.org/tracker/CVE-2022-24975  
                         glibc | CVE-2010-4756    | https://security-tracker.debian.org/tracker/CVE-2010-4756   
                         glibc | CVE-2019-1010022 | https://security-tracker.debian.org/tracker/CVE-2019-1010022
                         glibc | CVE-2019-1010023 | https://security-tracker.debian.org/tracker/CVE-2019-1010023
                         glibc | CVE-2019-1010024 | https://security-tracker.debian.org/tracker/CVE-2019-1010024
                         glibc | CVE-2019-1010025 | https://security-tracker.debian.org/tracker/CVE-2019-1010025
                         gnupg | CVE-2006-3082    | https://security-tracker.debian.org/tracker/CVE-2006-3082   
                         gnupg | CVE-2011-2207    | https://security-tracker.debian.org/tracker/CVE-2011-2207   
                         gnupg | CVE-2015-1606    | https://security-tracker.debian.org/tracker/CVE-2015-1606   
                         gnupg | CVE-2018-12020   | https://security-tracker.debian.org/tracker/CVE-2018-12020  
                         gnupg | CVE-2019-13050   | https://security-tracker.debian.org/tracker/CVE-2019-13050  
                         gnupg | CVE-2019-14855   | https://security-tracker.debian.org/tracker/CVE-2019-14855  
                            go | CVE-2020-29509   | https://security-tracker.debian.org/tracker/CVE-2020-29509  
                            go | CVE-2020-29511   | https://security-tracker.debian.org/tracker/CVE-2020-29511  
                graphicsmagick | CVE-2007-0770    | https://security-tracker.debian.org/tracker/CVE-2007-0770   
                graphicsmagick | CVE-2008-6621    | https://security-tracker.debian.org/tracker/CVE-2008-6621   
                     graphite2 | CVE-2017-5436    | https://security-tracker.debian.org/tracker/CVE-2017-5436   
                         grub2 | CVE-2021-3981    | https://security-tracker.debian.org/tracker/CVE-2021-3981   
                         grub2 | CVE-2021-46705   | https://security-tracker.debian.org/tracker/CVE-2021-46705  
                       haproxy | CVE-2016-2102    | https://security-tracker.debian.org/tracker/CVE-2016-2102   
                       haproxy | CVE-2022-0711    | https://security-tracker.debian.org/tracker/CVE-2022-0711   
                heirloom-mailx | CVE-2004-2771    | https://security-tracker.debian.org/tracker/CVE-2004-2771   
                   imagemagick | CVE-2007-1667    | https://security-tracker.debian.org/tracker/CVE-2007-1667   
                   imagemagick | CVE-2014-9804    | https://security-tracker.debian.org/tracker/CVE-2014-9804   
                   imagemagick | CVE-2014-9805    | https://security-tracker.debian.org/tracker/CVE-2014-9805   
                   imagemagick | CVE-2014-9806    | https://security-tracker.debian.org/tracker/CVE-2014-9806   
                   imagemagick | CVE-2014-9807    | https://security-tracker.debian.org/tracker/CVE-2014-9807   
                   imagemagick | CVE-2014-9808    | https://security-tracker.debian.org/tracker/CVE-2014-9808   
                   imagemagick | CVE-2014-9809    | https://security-tracker.debian.org/tracker/CVE-2014-9809   
                   imagemagick | CVE-2014-9810    | https://security-tracker.debian.org/tracker/CVE-2014-9810   
                   imagemagick | CVE-2014-9811    | https://security-tracker.debian.org/tracker/CVE-2014-9811   
                   imagemagick | CVE-2014-9812    | https://security-tracker.debian.org/tracker/CVE-2014-9812   
                   imagemagick | CVE-2014-9813    | https://security-tracker.debian.org/tracker/CVE-2014-9813   
                   imagemagick | CVE-2014-9814    | https://security-tracker.debian.org/tracker/CVE-2014-9814   
                   imagemagick | CVE-2014-9815    | https://security-tracker.debian.org/tracker/CVE-2014-9815   
                   imagemagick | CVE-2014-9816    | https://security-tracker.debian.org/tracker/CVE-2014-9816   
                   imagemagick | CVE-2014-9817    | https://security-tracker.debian.org/tracker/CVE-2014-9817   
                   imagemagick | CVE-2014-9818    | https://security-tracker.debian.org/tracker/CVE-2014-9818   
                   imagemagick | CVE-2014-9819    | https://security-tracker.debian.org/tracker/CVE-2014-9819   
                   imagemagick | CVE-2014-9820    | https://security-tracker.debian.org/tracker/CVE-2014-9820   
                   imagemagick | CVE-2014-9821    | https://security-tracker.debian.org/tracker/CVE-2014-9821   
                   imagemagick | CVE-2014-9822    | https://security-tracker.debian.org/tracker/CVE-2014-9822   
                   imagemagick | CVE-2014-9823    | https://security-tracker.debian.org/tracker/CVE-2014-9823   
                   imagemagick | CVE-2014-9824    | https://security-tracker.debian.org/tracker/CVE-2014-9824   
                   imagemagick | CVE-2014-9825    | https://security-tracker.debian.org/tracker/CVE-2014-9825   
                   imagemagick | CVE-2014-9826    | https://security-tracker.debian.org/tracker/CVE-2014-9826   
                   imagemagick | CVE-2014-9827    | https://security-tracker.debian.org/tracker/CVE-2014-9827   
                   imagemagick | CVE-2014-9828    | https://security-tracker.debian.org/tracker/CVE-2014-9828   
                   imagemagick | CVE-2014-9829    | https://security-tracker.debian.org/tracker/CVE-2014-9829   
                   imagemagick | CVE-2014-9830    | https://security-tracker.debian.org/tracker/CVE-2014-9830   
                   imagemagick | CVE-2014-9831    | https://security-tracker.debian.org/tracker/CVE-2014-9831   
                   imagemagick | CVE-2014-9848    | https://security-tracker.debian.org/tracker/CVE-2014-9848   
                   imagemagick | CVE-2014-9852    | https://security-tracker.debian.org/tracker/CVE-2014-9852   
                   imagemagick | CVE-2014-9853    | https://security-tracker.debian.org/tracker/CVE-2014-9853   
                   imagemagick | CVE-2014-9854    | https://security-tracker.debian.org/tracker/CVE-2014-9854   
                   imagemagick | CVE-2014-9907    | https://security-tracker.debian.org/tracker/CVE-2014-9907   
                   imagemagick | CVE-2016-10062   | https://security-tracker.debian.org/tracker/CVE-2016-10062  
                   imagemagick | CVE-2016-10144   | https://security-tracker.debian.org/tracker/CVE-2016-10144  
                   imagemagick | CVE-2016-10145   | https://security-tracker.debian.org/tracker/CVE-2016-10145  
                   imagemagick | CVE-2016-10146   | https://security-tracker.debian.org/tracker/CVE-2016-10146  
                   imagemagick | CVE-2016-7513    | https://security-tracker.debian.org/tracker/CVE-2016-7513   
                   imagemagick | CVE-2016-7514    | https://security-tracker.debian.org/tracker/CVE-2016-7514   
                   imagemagick | CVE-2016-7515    | https://security-tracker.debian.org/tracker/CVE-2016-7515   
                   imagemagick | CVE-2016-7516    | https://security-tracker.debian.org/tracker/CVE-2016-7516   
                   imagemagick | CVE-2016-7517    | https://security-tracker.debian.org/tracker/CVE-2016-7517   
                   imagemagick | CVE-2016-7518    | https://security-tracker.debian.org/tracker/CVE-2016-7518   
                   imagemagick | CVE-2016-7519    | https://security-tracker.debian.org/tracker/CVE-2016-7519   
                   imagemagick | CVE-2016-7520    | https://security-tracker.debian.org/tracker/CVE-2016-7520   
                   imagemagick | CVE-2016-7521    | https://security-tracker.debian.org/tracker/CVE-2016-7521   
                   imagemagick | CVE-2016-7522    | https://security-tracker.debian.org/tracker/CVE-2016-7522   
                   imagemagick | CVE-2016-7523    | https://security-tracker.debian.org/tracker/CVE-2016-7523   
                   imagemagick | CVE-2016-7524    | https://security-tracker.debian.org/tracker/CVE-2016-7524   
                   imagemagick | CVE-2016-7525    | https://security-tracker.debian.org/tracker/CVE-2016-7525   
                   imagemagick | CVE-2016-7526    | https://security-tracker.debian.org/tracker/CVE-2016-7526   
                   imagemagick | CVE-2016-7527    | https://security-tracker.debian.org/tracker/CVE-2016-7527   
                   imagemagick | CVE-2016-7528    | https://security-tracker.debian.org/tracker/CVE-2016-7528   
                   imagemagick | CVE-2016-7529    | https://security-tracker.debian.org/tracker/CVE-2016-7529   
                   imagemagick | CVE-2016-7530    | https://security-tracker.debian.org/tracker/CVE-2016-7530   
                   imagemagick | CVE-2016-7531    | https://security-tracker.debian.org/tracker/CVE-2016-7531   
                   imagemagick | CVE-2016-7532    | https://security-tracker.debian.org/tracker/CVE-2016-7532   
                   imagemagick | CVE-2016-7533    | https://security-tracker.debian.org/tracker/CVE-2016-7533   
                   imagemagick | CVE-2016-7534    | https://security-tracker.debian.org/tracker/CVE-2016-7534   
                   imagemagick | CVE-2016-7535    | https://security-tracker.debian.org/tracker/CVE-2016-7535   
                   imagemagick | CVE-2016-7536    | https://security-tracker.debian.org/tracker/CVE-2016-7536   
                   imagemagick | CVE-2016-7537    | https://security-tracker.debian.org/tracker/CVE-2016-7537   
                   imagemagick | CVE-2016-7538    | https://security-tracker.debian.org/tracker/CVE-2016-7538   
                   imagemagick | CVE-2017-5506    | https://security-tracker.debian.org/tracker/CVE-2017-5506   
                   imagemagick | CVE-2017-5509    | https://security-tracker.debian.org/tracker/CVE-2017-5509   
                   imagemagick | CVE-2017-5510    | https://security-tracker.debian.org/tracker/CVE-2017-5510   
                   imagemagick | CVE-2017-5511    | https://security-tracker.debian.org/tracker/CVE-2017-5511   
                        jasper | CVE-2015-8751    | https://security-tracker.debian.org/tracker/CVE-2015-8751   
                        jquery | CVE-2007-2379    | https://security-tracker.debian.org/tracker/CVE-2007-2379   
                         libao | CVE-2017-11548   | https://security-tracker.debian.org/tracker/CVE-2017-11548  
                  libfreeimage | CVE-2019-12211   | https://security-tracker.debian.org/tracker/CVE-2019-12211  
                  libfreeimage | CVE-2019-12212   | https://security-tracker.debian.org/tracker/CVE-2019-12212  
                  libfreeimage | CVE-2019-12213   | https://security-tracker.debian.org/tracker/CVE-2019-12213  
                  libfreeimage | CVE-2019-12214   | https://security-tracker.debian.org/tracker/CVE-2019-12214  
                     libiberty | CVE-2012-3509    | https://security-tracker.debian.org/tracker/CVE-2012-3509   
                     libiberty | CVE-2016-2226    | https://security-tracker.debian.org/tracker/CVE-2016-2226   
                     libiberty | CVE-2016-4487    | https://security-tracker.debian.org/tracker/CVE-2016-4487   
                     libiberty | CVE-2016-4488    | https://security-tracker.debian.org/tracker/CVE-2016-4488   
                     libiberty | CVE-2016-4489    | https://security-tracker.debian.org/tracker/CVE-2016-4489   
                     libiberty | CVE-2016-4490    | https://security-tracker.debian.org/tracker/CVE-2016-4490   
                     libiberty | CVE-2016-4491    | https://security-tracker.debian.org/tracker/CVE-2016-4491   
                     libiberty | CVE-2016-4492    | https://security-tracker.debian.org/tracker/CVE-2016-4492   
                     libiberty | CVE-2016-4493    | https://security-tracker.debian.org/tracker/CVE-2016-4493   
                     libiberty | CVE-2016-6131    | https://security-tracker.debian.org/tracker/CVE-2016-6131   
                       libkrb5 | CVE-1999-0143    | https://security-tracker.debian.org/tracker/CVE-1999-0143   
                       libkrb5 | CVE-1999-0713    | https://security-tracker.debian.org/tracker/CVE-1999-0713   
                       libkrb5 | CVE-2007-3149    | https://security-tracker.debian.org/tracker/CVE-2007-3149   
                       libkrb5 | CVE-2007-5894    | https://security-tracker.debian.org/tracker/CVE-2007-5894   
                       libkrb5 | CVE-2007-5902    | https://security-tracker.debian.org/tracker/CVE-2007-5902   
                       libkrb5 | CVE-2009-0844    | https://security-tracker.debian.org/tracker/CVE-2009-0844   
                       libkrb5 | CVE-2009-0846    | https://security-tracker.debian.org/tracker/CVE-2009-0846   
                        libmad | CVE-2018-7263    | https://security-tracker.debian.org/tracker/CVE-2018-7263   
                      libpjsip | CVE-2022-24754   | https://security-tracker.debian.org/tracker/CVE-2022-24754  
                      libpjsip | CVE-2022-24764   | https://security-tracker.debian.org/tracker/CVE-2022-24764  
                      libpjsip | CVE-2022-24792   | https://security-tracker.debian.org/tracker/CVE-2022-24792  
                      libplist | CVE-2017-5834    | https://security-tracker.debian.org/tracker/CVE-2017-5834   
                      libplist | CVE-2017-5835    | https://security-tracker.debian.org/tracker/CVE-2017-5835   
                      libplist | CVE-2017-5836    | https://security-tracker.debian.org/tracker/CVE-2017-5836   
                    libtorrent | CVE-2009-1760    | https://security-tracker.debian.org/tracker/CVE-2009-1760   
                    libtorrent | CVE-2016-5301    | https://security-tracker.debian.org/tracker/CVE-2016-5301   
                       libvirt | CVE-2014-8135    | https://security-tracker.debian.org/tracker/CVE-2014-8135   
                       libvirt | CVE-2014-8136    | https://security-tracker.debian.org/tracker/CVE-2014-8136   
                       libvirt | CVE-2015-5313    | https://security-tracker.debian.org/tracker/CVE-2015-5313   
                       libvirt | CVE-2018-5748    | https://security-tracker.debian.org/tracker/CVE-2018-5748   
                       libvirt | CVE-2018-6764    | https://security-tracker.debian.org/tracker/CVE-2018-6764   
                         lrzsz | CVE-2018-10195   | https://security-tracker.debian.org/tracker/CVE-2018-10195  
                           lua | CVE-2014-5461    | https://security-tracker.debian.org/tracker/CVE-2014-5461   
                           lua | CVE-2020-15888   | https://security-tracker.debian.org/tracker/CVE-2020-15888  
                           lua | CVE-2020-15945   | https://security-tracker.debian.org/tracker/CVE-2020-15945  
                           lua | CVE-2021-43519   | https://security-tracker.debian.org/tracker/CVE-2021-43519  
                           lua | CVE-2022-28805   | https://security-tracker.debian.org/tracker/CVE-2022-28805  
                       mariadb | CVE-2021-46669   | https://security-tracker.debian.org/tracker/CVE-2021-46669  
                       mariadb | CVE-2022-27376   | https://security-tracker.debian.org/tracker/CVE-2022-27376  
                       mariadb | CVE-2022-27377   | https://security-tracker.debian.org/tracker/CVE-2022-27377  
                       mariadb | CVE-2022-27378   | https://security-tracker.debian.org/tracker/CVE-2022-27378  
                       mariadb | CVE-2022-27379   | https://security-tracker.debian.org/tracker/CVE-2022-27379  
                       mariadb | CVE-2022-27380   | https://security-tracker.debian.org/tracker/CVE-2022-27380  
                       mariadb | CVE-2022-27381   | https://security-tracker.debian.org/tracker/CVE-2022-27381  
                       mariadb | CVE-2022-27382   | https://security-tracker.debian.org/tracker/CVE-2022-27382  
                       mariadb | CVE-2022-27383   | https://security-tracker.debian.org/tracker/CVE-2022-27383  
                       mariadb | CVE-2022-27384   | https://security-tracker.debian.org/tracker/CVE-2022-27384  
                       mariadb | CVE-2022-27385   | https://security-tracker.debian.org/tracker/CVE-2022-27385  
                       mariadb | CVE-2022-27386   | https://security-tracker.debian.org/tracker/CVE-2022-27386  
                       mariadb | CVE-2022-27387   | https://security-tracker.debian.org/tracker/CVE-2022-27387  
                       mariadb | CVE-2022-27444   | https://security-tracker.debian.org/tracker/CVE-2022-27444  
                       mariadb | CVE-2022-27445   | https://security-tracker.debian.org/tracker/CVE-2022-27445  
                       mariadb | CVE-2022-27446   | https://security-tracker.debian.org/tracker/CVE-2022-27446  
                       mariadb | CVE-2022-27447   | https://security-tracker.debian.org/tracker/CVE-2022-27447  
                       mariadb | CVE-2022-27448   | https://security-tracker.debian.org/tracker/CVE-2022-27448  
                       mariadb | CVE-2022-27449   | https://security-tracker.debian.org/tracker/CVE-2022-27449  
                       mariadb | CVE-2022-27451   | https://security-tracker.debian.org/tracker/CVE-2022-27451  
                       mariadb | CVE-2022-27452   | https://security-tracker.debian.org/tracker/CVE-2022-27452  
                       mariadb | CVE-2022-27455   | https://security-tracker.debian.org/tracker/CVE-2022-27455  
                       mariadb | CVE-2022-27456   | https://security-tracker.debian.org/tracker/CVE-2022-27456  
                       mariadb | CVE-2022-27457   | https://security-tracker.debian.org/tracker/CVE-2022-27457  
                       mariadb | CVE-2022-27458   | https://security-tracker.debian.org/tracker/CVE-2022-27458  
                       mbedtls | CVE-2021-45451   | https://security-tracker.debian.org/tracker/CVE-2021-45451  
                       mongodb | CVE-2014-8180    | https://security-tracker.debian.org/tracker/CVE-2014-8180   
                       mongodb | CVE-2017-18381   | https://security-tracker.debian.org/tracker/CVE-2017-18381  
                       mongodb | CVE-2017-2665    | https://security-tracker.debian.org/tracker/CVE-2017-2665   
                          mutt | CVE-2011-1429    | https://security-tracker.debian.org/tracker/CVE-2011-1429   
                          nasm | CVE-2020-18974   | https://security-tracker.debian.org/tracker/CVE-2020-18974  
                       ncurses | CVE-2021-39537   | https://security-tracker.debian.org/tracker/CVE-2021-39537  
                       ncurses | CVE-2022-29458   | https://security-tracker.debian.org/tracker/CVE-2022-29458  
                           ntp | CVE-2014-9750    | https://security-tracker.debian.org/tracker/CVE-2014-9750   
                           ntp | CVE-2014-9751    | https://security-tracker.debian.org/tracker/CVE-2014-9751   
                           ntp | CVE-2015-7691    | https://security-tracker.debian.org/tracker/CVE-2015-7691   
                           ntp | CVE-2015-7692    | https://security-tracker.debian.org/tracker/CVE-2015-7692   
                           ntp | CVE-2015-7701    | https://security-tracker.debian.org/tracker/CVE-2015-7701   
                           ntp | CVE-2015-7702    | https://security-tracker.debian.org/tracker/CVE-2015-7702   
                           ntp | CVE-2015-7703    | https://security-tracker.debian.org/tracker/CVE-2015-7703   
                           ntp | CVE-2015-7704    | https://security-tracker.debian.org/tracker/CVE-2015-7704   
                           ntp | CVE-2015-7705    | https://security-tracker.debian.org/tracker/CVE-2015-7705   
                           ntp | CVE-2015-7849    | https://security-tracker.debian.org/tracker/CVE-2015-7849   
                           ntp | CVE-2015-7850    | https://security-tracker.debian.org/tracker/CVE-2015-7850   
                           ntp | CVE-2015-7852    | https://security-tracker.debian.org/tracker/CVE-2015-7852   
                           ntp | CVE-2015-7853    | https://security-tracker.debian.org/tracker/CVE-2015-7853   
                           ntp | CVE-2015-7854    | https://security-tracker.debian.org/tracker/CVE-2015-7854   
                           ntp | CVE-2015-7855    | https://security-tracker.debian.org/tracker/CVE-2015-7855   
                           ntp | CVE-2015-7973    | https://security-tracker.debian.org/tracker/CVE-2015-7973   
                           ntp | CVE-2015-7974    | https://security-tracker.debian.org/tracker/CVE-2015-7974   
                           ntp | CVE-2015-7977    | https://security-tracker.debian.org/tracker/CVE-2015-7977   
                           ntp | CVE-2016-2518    | https://security-tracker.debian.org/tracker/CVE-2016-2518   
                           ntp | CVE-2016-4953    | https://security-tracker.debian.org/tracker/CVE-2016-4953   
                           ntp | CVE-2016-4954    | https://security-tracker.debian.org/tracker/CVE-2016-4954   
                           ntp | CVE-2016-4955    | https://security-tracker.debian.org/tracker/CVE-2016-4955   
                           ntp | CVE-2016-4956    | https://security-tracker.debian.org/tracker/CVE-2016-4956   
                           ntp | CVE-2016-7426    | https://security-tracker.debian.org/tracker/CVE-2016-7426   
                           ntp | CVE-2016-7434    | https://security-tracker.debian.org/tracker/CVE-2016-7434   
                           ntp | CVE-2017-6458    | https://security-tracker.debian.org/tracker/CVE-2017-6458   
                           ntp | CVE-2018-7170    | https://security-tracker.debian.org/tracker/CVE-2018-7170   
                           ntp | CVE-2018-7185    | https://security-tracker.debian.org/tracker/CVE-2018-7185   
                           ntp | CVE-2019-11331   | https://security-tracker.debian.org/tracker/CVE-2019-11331  
                           ntp | CVE-2019-8936    | https://security-tracker.debian.org/tracker/CVE-2019-8936   
                           ntp | CVE-2020-11868   | https://security-tracker.debian.org/tracker/CVE-2020-11868  
                           ntp | CVE-2020-13817   | https://security-tracker.debian.org/tracker/CVE-2020-13817  
                       opencv3 | CVE-2019-14493   | https://security-tracker.debian.org/tracker/CVE-2019-14493  
                       opencv3 | CVE-2019-15939   | https://security-tracker.debian.org/tracker/CVE-2019-15939  
                       opencv3 | CVE-2019-19624   | https://security-tracker.debian.org/tracker/CVE-2019-19624  
                       openjdk | CVE-2009-2475    | https://security-tracker.debian.org/tracker/CVE-2009-2475   
                       openjdk | CVE-2009-2476    | https://security-tracker.debian.org/tracker/CVE-2009-2476   
                       openjdk | CVE-2009-2689    | https://security-tracker.debian.org/tracker/CVE-2009-2689   
                       openjdk | CVE-2009-2690    | https://security-tracker.debian.org/tracker/CVE-2009-2690   
                       openjdk | CVE-2009-3728    | https://security-tracker.debian.org/tracker/CVE-2009-3728   
                       openjdk | CVE-2009-3879    | https://security-tracker.debian.org/tracker/CVE-2009-3879   
                       openjdk | CVE-2009-3880    | https://security-tracker.debian.org/tracker/CVE-2009-3880   
                       openjdk | CVE-2009-3881    | https://security-tracker.debian.org/tracker/CVE-2009-3881   
                       openjdk | CVE-2009-3882    | https://security-tracker.debian.org/tracker/CVE-2009-3882   
                       openjdk | CVE-2009-3883    | https://security-tracker.debian.org/tracker/CVE-2009-3883   
                       openjdk | CVE-2009-3884    | https://security-tracker.debian.org/tracker/CVE-2009-3884   
                       openjdk | CVE-2013-0169    | https://security-tracker.debian.org/tracker/CVE-2013-0169   
                      openjpeg | CVE-2015-1239    | https://security-tracker.debian.org/tracker/CVE-2015-1239   
                      openjpeg | CVE-2016-9675    | https://security-tracker.debian.org/tracker/CVE-2016-9675   
                      openjpeg | CVE-2021-29338   | https://security-tracker.debian.org/tracker/CVE-2021-29338  
                      openjpeg | CVE-2021-3575    | https://security-tracker.debian.org/tracker/CVE-2021-3575   
                      openjpeg | CVE-2022-1122    | https://security-tracker.debian.org/tracker/CVE-2022-1122   
                      openldap | CVE-2015-3276    | https://security-tracker.debian.org/tracker/CVE-2015-3276   
                       openssh | CVE-2007-2768    | https://security-tracker.debian.org/tracker/CVE-2007-2768   
                       openssh | CVE-2008-3844    | https://security-tracker.debian.org/tracker/CVE-2008-3844   
                       openssh | CVE-2014-9278    | https://security-tracker.debian.org/tracker/CVE-2014-9278   
                      openswan | CVE-2019-10155   | https://security-tracker.debian.org/tracker/CVE-2019-10155  
                         p7zip | CVE-2017-17969   | https://security-tracker.debian.org/tracker/CVE-2017-17969  
                         p7zip | CVE-2018-5996    | https://security-tracker.debian.org/tracker/CVE-2018-5996   
                         patch | CVE-2018-6952    | https://security-tracker.debian.org/tracker/CVE-2018-6952   
                         patch | CVE-2019-20633   | https://security-tracker.debian.org/tracker/CVE-2019-20633  
                           php | CVE-2007-2728    | https://security-tracker.debian.org/tracker/CVE-2007-2728   
                           php | CVE-2007-3205    | https://security-tracker.debian.org/tracker/CVE-2007-3205   
                           php | CVE-2007-4596    | https://security-tracker.debian.org/tracker/CVE-2007-4596   
                        polkit | CVE-2021-4034    | https://security-tracker.debian.org/tracker/CVE-2021-4034   
                    postgresql | CVE-2017-8806    | https://security-tracker.debian.org/tracker/CVE-2017-8806   
                 powerpc-utils | CVE-2014-8165    | https://security-tracker.debian.org/tracker/CVE-2014-8165   
                          pppd | CVE-2018-11574   | https://security-tracker.debian.org/tracker/CVE-2018-11574  
               python-m2crypto | CVE-2020-25657   | https://security-tracker.debian.org/tracker/CVE-2020-25657  
                    python-pip | CVE-2018-20225   | https://security-tracker.debian.org/tracker/CVE-2018-20225  
                python-twisted | CVE-2022-24801   | https://security-tracker.debian.org/tracker/CVE-2022-24801  
                       python3 | CVE-2015-20107   | https://security-tracker.debian.org/tracker/CVE-2015-20107  
                          qemu | CVE-2018-18438   | https://security-tracker.debian.org/tracker/CVE-2018-18438  
                          qemu | CVE-2019-12067   | https://security-tracker.debian.org/tracker/CVE-2019-12067  
                          qemu | CVE-2021-20255   | https://security-tracker.debian.org/tracker/CVE-2021-20255  
                        quagga | CVE-2016-4049    | https://security-tracker.debian.org/tracker/CVE-2016-4049   
                        quagga | CVE-2017-3224    | https://security-tracker.debian.org/tracker/CVE-2017-3224   
                        quagga | CVE-2021-44038   | https://security-tracker.debian.org/tracker/CVE-2021-44038  
               rabbitmq-server | CVE-2018-11087   | https://security-tracker.debian.org/tracker/CVE-2018-11087  
               rabbitmq-server | CVE-2018-1279    | https://security-tracker.debian.org/tracker/CVE-2018-1279   
                   resiprocate | CVE-2017-9454    | https://security-tracker.debian.org/tracker/CVE-2017-9454   
                        samba4 | CVE-2011-2411    | https://security-tracker.debian.org/tracker/CVE-2011-2411   
                        samba4 | CVE-2018-1050    | https://security-tracker.debian.org/tracker/CVE-2018-1050   
                        samba4 | CVE-2018-1057    | https://security-tracker.debian.org/tracker/CVE-2018-1057   
                           sdl | CVE-2019-13616   | https://security-tracker.debian.org/tracker/CVE-2019-13616  
                           sdl | CVE-2019-14906   | https://security-tracker.debian.org/tracker/CVE-2019-14906  
                           sdl | CVE-2019-7572    | https://security-tracker.debian.org/tracker/CVE-2019-7572   
                           sdl | CVE-2019-7573    | https://security-tracker.debian.org/tracker/CVE-2019-7573   
                           sdl | CVE-2019-7574    | https://security-tracker.debian.org/tracker/CVE-2019-7574   
                           sdl | CVE-2019-7575    | https://security-tracker.debian.org/tracker/CVE-2019-7575   
                           sdl | CVE-2019-7576    | https://security-tracker.debian.org/tracker/CVE-2019-7576   
                           sdl | CVE-2019-7577    | https://security-tracker.debian.org/tracker/CVE-2019-7577   
                           sdl | CVE-2019-7578    | https://security-tracker.debian.org/tracker/CVE-2019-7578   
                           sdl | CVE-2019-7635    | https://security-tracker.debian.org/tracker/CVE-2019-7635   
                           sdl | CVE-2019-7636    | https://security-tracker.debian.org/tracker/CVE-2019-7636   
                           sdl | CVE-2019-7637    | https://security-tracker.debian.org/tracker/CVE-2019-7637   
                           sdl | CVE-2019-7638    | https://security-tracker.debian.org/tracker/CVE-2019-7638   
                           sdl | CVE-2020-14409   | https://security-tracker.debian.org/tracker/CVE-2020-14409  
                           sdl | CVE-2020-14410   | https://security-tracker.debian.org/tracker/CVE-2020-14410  
                         smack | CVE-2014-0363    | https://security-tracker.debian.org/tracker/CVE-2014-0363   
                         smack | CVE-2014-0364    | https://security-tracker.debian.org/tracker/CVE-2014-0364   
                         smack | CVE-2016-10027   | https://security-tracker.debian.org/tracker/CVE-2016-10027  
                         spice | CVE-2016-0749    | https://security-tracker.debian.org/tracker/CVE-2016-0749   
                         spice | CVE-2016-2150    | https://security-tracker.debian.org/tracker/CVE-2016-2150   
                         spice | CVE-2018-10893   | https://security-tracker.debian.org/tracker/CVE-2018-10893  
                        thttpd | CVE-2012-5640    | https://security-tracker.debian.org/tracker/CVE-2012-5640   
                          tiff | CVE-2015-7313    | https://security-tracker.debian.org/tracker/CVE-2015-7313   
                          tiff | CVE-2022-0561    | https://security-tracker.debian.org/tracker/CVE-2022-0561   
                          tiff | CVE-2022-0562    | https://security-tracker.debian.org/tracker/CVE-2022-0562   
                          tiff | CVE-2022-0865    | https://security-tracker.debian.org/tracker/CVE-2022-0865   
                          tiff | CVE-2022-0891    | https://security-tracker.debian.org/tracker/CVE-2022-0891   
                          tiff | CVE-2022-0907    | https://security-tracker.debian.org/tracker/CVE-2022-0907   
                          tiff | CVE-2022-0908    | https://security-tracker.debian.org/tracker/CVE-2022-0908   
                          tiff | CVE-2022-0909    | https://security-tracker.debian.org/tracker/CVE-2022-0909   
                          tiff | CVE-2022-0924    | https://security-tracker.debian.org/tracker/CVE-2022-0924   
                          tiff | CVE-2022-1056    | https://security-tracker.debian.org/tracker/CVE-2022-1056   
                          tiff | CVE-2022-1210    | https://security-tracker.debian.org/tracker/CVE-2022-1210   
                          tinc | CVE-2013-1428    | https://security-tracker.debian.org/tracker/CVE-2013-1428   
                           tor | CVE-2016-9079    | https://security-tracker.debian.org/tracker/CVE-2016-9079   
                           tor | CVE-2017-16541   | https://security-tracker.debian.org/tracker/CVE-2017-16541  
                         unzip | CVE-2022-0529    | https://security-tracker.debian.org/tracker/CVE-2022-0529   
                         unzip | CVE-2022-0530    | https://security-tracker.debian.org/tracker/CVE-2022-0530   
                           xen | CVE-2011-1936    | https://security-tracker.debian.org/tracker/CVE-2011-1936   
                           xen | CVE-2011-3346    | https://security-tracker.debian.org/tracker/CVE-2011-3346   
                           xen | CVE-2014-2580    | https://security-tracker.debian.org/tracker/CVE-2014-2580   
                           xen | CVE-2014-3672    | https://security-tracker.debian.org/tracker/CVE-2014-3672   
                           xen | CVE-2015-7504    | https://security-tracker.debian.org/tracker/CVE-2015-7504   
                           xen | CVE-2015-8550    | https://security-tracker.debian.org/tracker/CVE-2015-8550   
                           xen | CVE-2015-8553    | https://security-tracker.debian.org/tracker/CVE-2015-8553   
                           xen | CVE-2016-3960    | https://security-tracker.debian.org/tracker/CVE-2016-3960   
                           xen | CVE-2016-7092    | https://security-tracker.debian.org/tracker/CVE-2016-7092   
                           xen | CVE-2016-9379    | https://security-tracker.debian.org/tracker/CVE-2016-9379   
                           xen | CVE-2016-9380    | https://security-tracker.debian.org/tracker/CVE-2016-9380   
                           xen | CVE-2016-9383    | https://security-tracker.debian.org/tracker/CVE-2016-9383   
                           xen | CVE-2016-9386    | https://security-tracker.debian.org/tracker/CVE-2016-9386   
                           xen | CVE-2017-12134   | https://security-tracker.debian.org/tracker/CVE-2017-12134  
                           xen | CVE-2017-12135   | https://security-tracker.debian.org/tracker/CVE-2017-12135  
                           xen | CVE-2017-12137   | https://security-tracker.debian.org/tracker/CVE-2017-12137  
                           xen | CVE-2017-7228    | https://security-tracker.debian.org/tracker/CVE-2017-7228   
                           xen | CVE-2018-5244    | https://security-tracker.debian.org/tracker/CVE-2018-5244   
                           xen | CVE-2018-8897    | https://security-tracker.debian.org/tracker/CVE-2018-8897   
                           xen | CVE-2021-26313   | https://security-tracker.debian.org/tracker/CVE-2021-26313  
                           xen | CVE-2021-26314   | https://security-tracker.debian.org/tracker/CVE-2021-26314  
                           xen | CVE-2021-28038   | https://security-tracker.debian.org/tracker/CVE-2021-28038  
                           xen | CVE-2021-28039   | https://security-tracker.debian.org/tracker/CVE-2021-28039  
                           xen | CVE-2021-28687   | https://security-tracker.debian.org/tracker/CVE-2021-28687  
                           xen | CVE-2021-28690   | https://security-tracker.debian.org/tracker/CVE-2021-28690  
                           xen | CVE-2021-28692   | https://security-tracker.debian.org/tracker/CVE-2021-28692  
                           xen | CVE-2021-28693   | https://security-tracker.debian.org/tracker/CVE-2021-28693  
                           xen | CVE-2021-28694   | https://security-tracker.debian.org/tracker/CVE-2021-28694  
                           xen | CVE-2021-28695   | https://security-tracker.debian.org/tracker/CVE-2021-28695  
                           xen | CVE-2021-28696   | https://security-tracker.debian.org/tracker/CVE-2021-28696  
                           xen | CVE-2021-28697   | https://security-tracker.debian.org/tracker/CVE-2021-28697  
                           xen | CVE-2021-28698   | https://security-tracker.debian.org/tracker/CVE-2021-28698  
                           xen | CVE-2021-28699   | https://security-tracker.debian.org/tracker/CVE-2021-28699  
                           xen | CVE-2021-28700   | https://security-tracker.debian.org/tracker/CVE-2021-28700  
                           xen | CVE-2021-28701   | https://security-tracker.debian.org/tracker/CVE-2021-28701  
                           xen | CVE-2021-28702   | https://security-tracker.debian.org/tracker/CVE-2021-28702  
                           xen | CVE-2021-28703   | https://security-tracker.debian.org/tracker/CVE-2021-28703  
                           xen | CVE-2021-28704   | https://security-tracker.debian.org/tracker/CVE-2021-28704  
                           xen | CVE-2021-28707   | https://security-tracker.debian.org/tracker/CVE-2021-28707  
                           xen | CVE-2021-28708   | https://security-tracker.debian.org/tracker/CVE-2021-28708  
                           xen | CVE-2021-28711   | https://security-tracker.debian.org/tracker/CVE-2021-28711  
                           xen | CVE-2021-28712   | https://security-tracker.debian.org/tracker/CVE-2021-28712  
                           xen | CVE-2021-28713   | https://security-tracker.debian.org/tracker/CVE-2021-28713  
                           xen | CVE-2022-23033   | https://security-tracker.debian.org/tracker/CVE-2022-23033  
                           xen | CVE-2022-23035   | https://security-tracker.debian.org/tracker/CVE-2022-23035  
                           xen | CVE-2022-23036   | https://security-tracker.debian.org/tracker/CVE-2022-23036  
                           xen | CVE-2022-23037   | https://security-tracker.debian.org/tracker/CVE-2022-23037  
                           xen | CVE-2022-23038   | https://security-tracker.debian.org/tracker/CVE-2022-23038  
                           xen | CVE-2022-23039   | https://security-tracker.debian.org/tracker/CVE-2022-23039  
                           xen | CVE-2022-23040   | https://security-tracker.debian.org/tracker/CVE-2022-23040  
                           xen | CVE-2022-23041   | https://security-tracker.debian.org/tracker/CVE-2022-23041  
                           xen | CVE-2022-23042   | https://security-tracker.debian.org/tracker/CVE-2022-23042  
                           xen | CVE-2022-23960   | https://security-tracker.debian.org/tracker/CVE-2022-23960  
                           xen | CVE-2022-26357   | https://security-tracker.debian.org/tracker/CVE-2022-26357  
                           xen | CVE-2022-26358   | https://security-tracker.debian.org/tracker/CVE-2022-26358  
                           xen | CVE-2022-26359   | https://security-tracker.debian.org/tracker/CVE-2022-26359  
                           xen | CVE-2022-26360   | https://security-tracker.debian.org/tracker/CVE-2022-26360  
                           xen | CVE-2022-26361   | https://security-tracker.debian.org/tracker/CVE-2022-26361  
                        xerces | CVE-2012-0880    | https://security-tracker.debian.org/tracker/CVE-2012-0880   
                           zip | CVE-2018-13410   | https://security-tracker.debian.org/tracker/CVE-2018-13410  

CVEs for the '2022.02.x' branch
-------------------------------

             name              |       CVE        |                             link                            
-------------------------------+------------------+--------------------------------------------------------------
                        apache | CVE-1999-0236    | https://security-tracker.debian.org/tracker/CVE-1999-0236   
                        apache | CVE-1999-0289    | https://security-tracker.debian.org/tracker/CVE-1999-0289   
                        apache | CVE-1999-0678    | https://security-tracker.debian.org/tracker/CVE-1999-0678   
                        apache | CVE-1999-1237    | https://security-tracker.debian.org/tracker/CVE-1999-1237   
                        apache | CVE-1999-1412    | https://security-tracker.debian.org/tracker/CVE-1999-1412   
                        apache | CVE-2007-0086    | https://security-tracker.debian.org/tracker/CVE-2007-0086   
                        apache | CVE-2007-0450    | https://security-tracker.debian.org/tracker/CVE-2007-0450   
                        apache | CVE-2007-4465    | https://security-tracker.debian.org/tracker/CVE-2007-4465   
                        apache | CVE-2007-5000    | https://security-tracker.debian.org/tracker/CVE-2007-5000   
                        apache | CVE-2007-6388    | https://security-tracker.debian.org/tracker/CVE-2007-6388   
                        apache | CVE-2007-6420    | https://security-tracker.debian.org/tracker/CVE-2007-6420   
                        apache | CVE-2007-6421    | https://security-tracker.debian.org/tracker/CVE-2007-6421   
                        apache | CVE-2007-6422    | https://security-tracker.debian.org/tracker/CVE-2007-6422   
                        apache | CVE-2007-6423    | https://security-tracker.debian.org/tracker/CVE-2007-6423   
                        apache | CVE-2008-0455    | https://security-tracker.debian.org/tracker/CVE-2008-0455   
                        apache | CVE-2008-2168    | https://security-tracker.debian.org/tracker/CVE-2008-2168   
                        apache | CVE-2008-2939    | https://security-tracker.debian.org/tracker/CVE-2008-2939   
                        apache | CVE-2009-1195    | https://security-tracker.debian.org/tracker/CVE-2009-1195   
                        apache | CVE-2009-1890    | https://security-tracker.debian.org/tracker/CVE-2009-1890   
                        apache | CVE-2009-1891    | https://security-tracker.debian.org/tracker/CVE-2009-1891   
                        apache | CVE-2009-2699    | https://security-tracker.debian.org/tracker/CVE-2009-2699   
                        apache | CVE-2010-0408    | https://security-tracker.debian.org/tracker/CVE-2010-0408   
                        apache | CVE-2010-0425    | https://security-tracker.debian.org/tracker/CVE-2010-0425   
                        apache | CVE-2010-0434    | https://security-tracker.debian.org/tracker/CVE-2010-0434   
                        apache | CVE-2010-1452    | https://security-tracker.debian.org/tracker/CVE-2010-1452   
                        apache | CVE-2014-0231    | https://security-tracker.debian.org/tracker/CVE-2014-0231   
                      apparmor | CVE-2016-1585    | https://security-tracker.debian.org/tracker/CVE-2016-1585   
                         argus | CVE-2011-3332    | https://security-tracker.debian.org/tracker/CVE-2011-3332   
                         asn1c | CVE-2017-12966   | https://security-tracker.debian.org/tracker/CVE-2017-12966  
                          atop | CVE-2011-3618    | https://security-tracker.debian.org/tracker/CVE-2011-3618   
                         avahi | CVE-2021-3468    | https://security-tracker.debian.org/tracker/CVE-2021-3468   
                     belle-sip | CVE-2021-33056   | https://security-tracker.debian.org/tracker/CVE-2021-33056  
                     belle-sip | CVE-2021-43610   | https://security-tracker.debian.org/tracker/CVE-2021-43610  
                     belle-sip | CVE-2021-43611   | https://security-tracker.debian.org/tracker/CVE-2021-43611  
                        bento4 | CVE-2020-23331   | https://security-tracker.debian.org/tracker/CVE-2020-23331  
                        bento4 | CVE-2020-23332   | https://security-tracker.debian.org/tracker/CVE-2020-23332  
                        bento4 | CVE-2022-27607   | https://security-tracker.debian.org/tracker/CVE-2022-27607  
                    berkeleydb | CVE-2017-3604    | https://security-tracker.debian.org/tracker/CVE-2017-3604   
                    berkeleydb | CVE-2017-3605    | https://security-tracker.debian.org/tracker/CVE-2017-3605   
                    berkeleydb | CVE-2017-3606    | https://security-tracker.debian.org/tracker/CVE-2017-3606   
                    berkeleydb | CVE-2017-3607    | https://security-tracker.debian.org/tracker/CVE-2017-3607   
                    berkeleydb | CVE-2017-3608    | https://security-tracker.debian.org/tracker/CVE-2017-3608   
                    berkeleydb | CVE-2017-3609    | https://security-tracker.debian.org/tracker/CVE-2017-3609   
                    berkeleydb | CVE-2017-3610    | https://security-tracker.debian.org/tracker/CVE-2017-3610   
                    berkeleydb | CVE-2017-3611    | https://security-tracker.debian.org/tracker/CVE-2017-3611   
                    berkeleydb | CVE-2017-3612    | https://security-tracker.debian.org/tracker/CVE-2017-3612   
                    berkeleydb | CVE-2017-3613    | https://security-tracker.debian.org/tracker/CVE-2017-3613   
                    berkeleydb | CVE-2017-3614    | https://security-tracker.debian.org/tracker/CVE-2017-3614   
                    berkeleydb | CVE-2017-3615    | https://security-tracker.debian.org/tracker/CVE-2017-3615   
                    berkeleydb | CVE-2017-3616    | https://security-tracker.debian.org/tracker/CVE-2017-3616   
                    berkeleydb | CVE-2017-3617    | https://security-tracker.debian.org/tracker/CVE-2017-3617   
                    berkeleydb | CVE-2019-2708    | https://security-tracker.debian.org/tracker/CVE-2019-2708   
                    berkeleydb | CVE-2020-2981    | https://security-tracker.debian.org/tracker/CVE-2020-2981   
                      binutils | CVE-2021-45078   | https://security-tracker.debian.org/tracker/CVE-2021-45078  
                       bitcoin | CVE-2012-1909    | https://security-tracker.debian.org/tracker/CVE-2012-1909   
                       bitcoin | CVE-2012-4682    | https://security-tracker.debian.org/tracker/CVE-2012-4682   
                       bitcoin | CVE-2012-4683    | https://security-tracker.debian.org/tracker/CVE-2012-4683   
                       bitcoin | CVE-2013-2272    | https://security-tracker.debian.org/tracker/CVE-2013-2272   
                       bitcoin | CVE-2013-2273    | https://security-tracker.debian.org/tracker/CVE-2013-2273   
                       bitcoin | CVE-2013-2292    | https://security-tracker.debian.org/tracker/CVE-2013-2292   
                       bitcoin | CVE-2013-2293    | https://security-tracker.debian.org/tracker/CVE-2013-2293   
                       bitcoin | CVE-2013-3220    | https://security-tracker.debian.org/tracker/CVE-2013-3220   
                  bluez5_utils | CVE-2020-12352   | https://security-tracker.debian.org/tracker/CVE-2020-12352  
                  bluez5_utils | CVE-2020-24490   | https://security-tracker.debian.org/tracker/CVE-2020-24490  
          bluez5_utils-headers | CVE-2020-12352   | https://security-tracker.debian.org/tracker/CVE-2020-12352  
          bluez5_utils-headers | CVE-2020-24490   | https://security-tracker.debian.org/tracker/CVE-2020-24490  
                        bsdiff | CVE-2020-14315   | https://security-tracker.debian.org/tracker/CVE-2020-14315  
                       busybox | CVE-2022-28391   | https://security-tracker.debian.org/tracker/CVE-2022-28391  
                         cairo | CVE-2019-6461    | https://security-tracker.debian.org/tracker/CVE-2019-6461   
                         cairo | CVE-2019-6462    | https://security-tracker.debian.org/tracker/CVE-2019-6462   
                         cairo | CVE-2020-35492   | https://security-tracker.debian.org/tracker/CVE-2020-35492  
                    cifs-utils | CVE-2022-27239   | https://security-tracker.debian.org/tracker/CVE-2022-27239  
                    cifs-utils | CVE-2022-29869   | https://security-tracker.debian.org/tracker/CVE-2022-29869  
                        clamav | CVE-2016-1405    | https://security-tracker.debian.org/tracker/CVE-2016-1405   
                     coreutils | CVE-2016-2781    | https://security-tracker.debian.org/tracker/CVE-2016-2781   
                          cpio | CVE-2010-4226    | https://security-tracker.debian.org/tracker/CVE-2010-4226   
                      cryptopp | CVE-2021-43398   | https://security-tracker.debian.org/tracker/CVE-2021-43398  
                          cups | CVE-2018-6553    | https://security-tracker.debian.org/tracker/CVE-2018-6553   
                           cvs | CVE-2017-12836   | https://security-tracker.debian.org/tracker/CVE-2017-12836  
                     darkhttpd | CVE-2020-25691   | https://security-tracker.debian.org/tracker/CVE-2020-25691  
                       dnsmasq | CVE-2021-45951   | https://security-tracker.debian.org/tracker/CVE-2021-45951  
                       dnsmasq | CVE-2021-45952   | https://security-tracker.debian.org/tracker/CVE-2021-45952  
                       dnsmasq | CVE-2021-45953   | https://security-tracker.debian.org/tracker/CVE-2021-45953  
                       dnsmasq | CVE-2021-45954   | https://security-tracker.debian.org/tracker/CVE-2021-45954  
                       dnsmasq | CVE-2021-45955   | https://security-tracker.debian.org/tracker/CVE-2021-45955  
                       dnsmasq | CVE-2021-45956   | https://security-tracker.debian.org/tracker/CVE-2021-45956  
                       dnsmasq | CVE-2021-45957   | https://security-tracker.debian.org/tracker/CVE-2021-45957  
                        docker | CVE-2014-0048    | https://security-tracker.debian.org/tracker/CVE-2014-0048   
                        docker | CVE-2014-8178    | https://security-tracker.debian.org/tracker/CVE-2014-8178   
                        docker | CVE-2014-8179    | https://security-tracker.debian.org/tracker/CVE-2014-8179   
                        docker | CVE-2015-1843    | https://security-tracker.debian.org/tracker/CVE-2015-1843   
                        docker | CVE-2015-3627    | https://security-tracker.debian.org/tracker/CVE-2015-3627   
                        docker | CVE-2015-3630    | https://security-tracker.debian.org/tracker/CVE-2015-3630   
                        docker | CVE-2015-3631    | https://security-tracker.debian.org/tracker/CVE-2015-3631   
                        docker | CVE-2016-3697    | https://security-tracker.debian.org/tracker/CVE-2016-3697   
                        docker | CVE-2017-14992   | https://security-tracker.debian.org/tracker/CVE-2017-14992  
                        docker | CVE-2019-13139   | https://security-tracker.debian.org/tracker/CVE-2019-13139  
                        docker | CVE-2019-13509   | https://security-tracker.debian.org/tracker/CVE-2019-13509  
                        docker | CVE-2019-15752   | https://security-tracker.debian.org/tracker/CVE-2019-15752  
                        docker | CVE-2019-16884   | https://security-tracker.debian.org/tracker/CVE-2019-16884  
                        docker | CVE-2019-5736    | https://security-tracker.debian.org/tracker/CVE-2019-5736   
                        docker | CVE-2020-27534   | https://security-tracker.debian.org/tracker/CVE-2020-27534  
                        docker | CVE-2021-21284   | https://security-tracker.debian.org/tracker/CVE-2021-21284  
                        docker | CVE-2021-21285   | https://security-tracker.debian.org/tracker/CVE-2021-21285  
                        docker | CVE-2021-3162    | https://security-tracker.debian.org/tracker/CVE-2021-3162   
                        docker | CVE-2021-33183   | https://security-tracker.debian.org/tracker/CVE-2021-33183  
                        docker | CVE-2022-25365   | https://security-tracker.debian.org/tracker/CVE-2022-25365  
                     e2fsprogs | CVE-2022-1304    | https://security-tracker.debian.org/tracker/CVE-2022-1304   
                          edk2 | CVE-2014-4859    | https://security-tracker.debian.org/tracker/CVE-2014-4859   
                          edk2 | CVE-2014-4860    | https://security-tracker.debian.org/tracker/CVE-2014-4860   
                          edk2 | CVE-2014-8271    | https://security-tracker.debian.org/tracker/CVE-2014-8271   
                          edk2 | CVE-2019-14553   | https://security-tracker.debian.org/tracker/CVE-2019-14553  
                          edk2 | CVE-2019-14559   | https://security-tracker.debian.org/tracker/CVE-2019-14559  
                          edk2 | CVE-2019-14562   | https://security-tracker.debian.org/tracker/CVE-2019-14562  
                          edk2 | CVE-2019-14563   | https://security-tracker.debian.org/tracker/CVE-2019-14563  
                          edk2 | CVE-2019-14575   | https://security-tracker.debian.org/tracker/CVE-2019-14575  
                          edk2 | CVE-2019-14586   | https://security-tracker.debian.org/tracker/CVE-2019-14586  
                          edk2 | CVE-2019-14587   | https://security-tracker.debian.org/tracker/CVE-2019-14587  
                         emlog | CVE-2021-44584   | https://security-tracker.debian.org/tracker/CVE-2021-44584  
                        erlang | CVE-2020-35733   | https://security-tracker.debian.org/tracker/CVE-2020-35733  
                          exim | CVE-2020-28017   | https://security-tracker.debian.org/tracker/CVE-2020-28017  
                         exiv2 | CVE-2007-6353    | https://security-tracker.debian.org/tracker/CVE-2007-6353   
                        ffmpeg | CVE-2021-38291   | https://security-tracker.debian.org/tracker/CVE-2021-38291  
                       freerdp | CVE-2022-24882   | https://security-tracker.debian.org/tracker/CVE-2022-24882  
                       freerdp | CVE-2022-24883   | https://security-tracker.debian.org/tracker/CVE-2022-24883  
                      freetype | CVE-2022-27404   | https://security-tracker.debian.org/tracker/CVE-2022-27404  
                      freetype | CVE-2022-27405   | https://security-tracker.debian.org/tracker/CVE-2022-27405  
                      freetype | CVE-2022-27406   | https://security-tracker.debian.org/tracker/CVE-2022-27406  
                        giflib | CVE-2022-28506   | https://security-tracker.debian.org/tracker/CVE-2022-28506  
                           git | CVE-2022-24765   | https://security-tracker.debian.org/tracker/CVE-2022-24765  
                           git | CVE-2022-24975   | https://security-tracker.debian.org/tracker/CVE-2022-24975  
                         glibc | CVE-2010-4756    | https://security-tracker.debian.org/tracker/CVE-2010-4756   
                         glibc | CVE-2019-1010022 | https://security-tracker.debian.org/tracker/CVE-2019-1010022
                         glibc | CVE-2019-1010023 | https://security-tracker.debian.org/tracker/CVE-2019-1010023
                         glibc | CVE-2019-1010024 | https://security-tracker.debian.org/tracker/CVE-2019-1010024
                         glibc | CVE-2019-1010025 | https://security-tracker.debian.org/tracker/CVE-2019-1010025
                         gnupg | CVE-2006-3082    | https://security-tracker.debian.org/tracker/CVE-2006-3082   
                         gnupg | CVE-2011-2207    | https://security-tracker.debian.org/tracker/CVE-2011-2207   
                         gnupg | CVE-2015-1606    | https://security-tracker.debian.org/tracker/CVE-2015-1606   
                         gnupg | CVE-2018-12020   | https://security-tracker.debian.org/tracker/CVE-2018-12020  
                         gnupg | CVE-2019-13050   | https://security-tracker.debian.org/tracker/CVE-2019-13050  
                         gnupg | CVE-2019-14855   | https://security-tracker.debian.org/tracker/CVE-2019-14855  
                            go | CVE-2020-29509   | https://security-tracker.debian.org/tracker/CVE-2020-29509  
                            go | CVE-2020-29511   | https://security-tracker.debian.org/tracker/CVE-2020-29511  
                            go | CVE-2022-24675   | https://security-tracker.debian.org/tracker/CVE-2022-24675  
                            go | CVE-2022-28327   | https://security-tracker.debian.org/tracker/CVE-2022-28327  
                graphicsmagick | CVE-2007-0770    | https://security-tracker.debian.org/tracker/CVE-2007-0770   
                graphicsmagick | CVE-2008-6621    | https://security-tracker.debian.org/tracker/CVE-2008-6621   
                     graphite2 | CVE-2017-5436    | https://security-tracker.debian.org/tracker/CVE-2017-5436   
                         grub2 | CVE-2021-3981    | https://security-tracker.debian.org/tracker/CVE-2021-3981   
                         grub2 | CVE-2021-46705   | https://security-tracker.debian.org/tracker/CVE-2021-46705  
                       haproxy | CVE-2016-2102    | https://security-tracker.debian.org/tracker/CVE-2016-2102   
                       haproxy | CVE-2022-0711    | https://security-tracker.debian.org/tracker/CVE-2022-0711   
                heirloom-mailx | CVE-2004-2771    | https://security-tracker.debian.org/tracker/CVE-2004-2771   
                   imagemagick | CVE-2007-1667    | https://security-tracker.debian.org/tracker/CVE-2007-1667   
                   imagemagick | CVE-2014-9804    | https://security-tracker.debian.org/tracker/CVE-2014-9804   
                   imagemagick | CVE-2014-9805    | https://security-tracker.debian.org/tracker/CVE-2014-9805   
                   imagemagick | CVE-2014-9806    | https://security-tracker.debian.org/tracker/CVE-2014-9806   
                   imagemagick | CVE-2014-9807    | https://security-tracker.debian.org/tracker/CVE-2014-9807   
                   imagemagick | CVE-2014-9808    | https://security-tracker.debian.org/tracker/CVE-2014-9808   
                   imagemagick | CVE-2014-9809    | https://security-tracker.debian.org/tracker/CVE-2014-9809   
                   imagemagick | CVE-2014-9810    | https://security-tracker.debian.org/tracker/CVE-2014-9810   
                   imagemagick | CVE-2014-9811    | https://security-tracker.debian.org/tracker/CVE-2014-9811   
                   imagemagick | CVE-2014-9812    | https://security-tracker.debian.org/tracker/CVE-2014-9812   
                   imagemagick | CVE-2014-9813    | https://security-tracker.debian.org/tracker/CVE-2014-9813   
                   imagemagick | CVE-2014-9814    | https://security-tracker.debian.org/tracker/CVE-2014-9814   
                   imagemagick | CVE-2014-9815    | https://security-tracker.debian.org/tracker/CVE-2014-9815   
                   imagemagick | CVE-2014-9816    | https://security-tracker.debian.org/tracker/CVE-2014-9816   
                   imagemagick | CVE-2014-9817    | https://security-tracker.debian.org/tracker/CVE-2014-9817   
                   imagemagick | CVE-2014-9818    | https://security-tracker.debian.org/tracker/CVE-2014-9818   
                   imagemagick | CVE-2014-9819    | https://security-tracker.debian.org/tracker/CVE-2014-9819   
                   imagemagick | CVE-2014-9820    | https://security-tracker.debian.org/tracker/CVE-2014-9820   
                   imagemagick | CVE-2014-9821    | https://security-tracker.debian.org/tracker/CVE-2014-9821   
                   imagemagick | CVE-2014-9822    | https://security-tracker.debian.org/tracker/CVE-2014-9822   
                   imagemagick | CVE-2014-9823    | https://security-tracker.debian.org/tracker/CVE-2014-9823   
                   imagemagick | CVE-2014-9824    | https://security-tracker.debian.org/tracker/CVE-2014-9824   
                   imagemagick | CVE-2014-9825    | https://security-tracker.debian.org/tracker/CVE-2014-9825   
                   imagemagick | CVE-2014-9826    | https://security-tracker.debian.org/tracker/CVE-2014-9826   
                   imagemagick | CVE-2014-9827    | https://security-tracker.debian.org/tracker/CVE-2014-9827   
                   imagemagick | CVE-2014-9828    | https://security-tracker.debian.org/tracker/CVE-2014-9828   
                   imagemagick | CVE-2014-9829    | https://security-tracker.debian.org/tracker/CVE-2014-9829   
                   imagemagick | CVE-2014-9830    | https://security-tracker.debian.org/tracker/CVE-2014-9830   
                   imagemagick | CVE-2014-9831    | https://security-tracker.debian.org/tracker/CVE-2014-9831   
                   imagemagick | CVE-2014-9848    | https://security-tracker.debian.org/tracker/CVE-2014-9848   
                   imagemagick | CVE-2014-9852    | https://security-tracker.debian.org/tracker/CVE-2014-9852   
                   imagemagick | CVE-2014-9853    | https://security-tracker.debian.org/tracker/CVE-2014-9853   
                   imagemagick | CVE-2014-9854    | https://security-tracker.debian.org/tracker/CVE-2014-9854   
                   imagemagick | CVE-2014-9907    | https://security-tracker.debian.org/tracker/CVE-2014-9907   
                   imagemagick | CVE-2016-10062   | https://security-tracker.debian.org/tracker/CVE-2016-10062  
                   imagemagick | CVE-2016-10144   | https://security-tracker.debian.org/tracker/CVE-2016-10144  
                   imagemagick | CVE-2016-10145   | https://security-tracker.debian.org/tracker/CVE-2016-10145  
                   imagemagick | CVE-2016-10146   | https://security-tracker.debian.org/tracker/CVE-2016-10146  
                   imagemagick | CVE-2016-7513    | https://security-tracker.debian.org/tracker/CVE-2016-7513   
                   imagemagick | CVE-2016-7514    | https://security-tracker.debian.org/tracker/CVE-2016-7514   
                   imagemagick | CVE-2016-7515    | https://security-tracker.debian.org/tracker/CVE-2016-7515   
                   imagemagick | CVE-2016-7516    | https://security-tracker.debian.org/tracker/CVE-2016-7516   
                   imagemagick | CVE-2016-7517    | https://security-tracker.debian.org/tracker/CVE-2016-7517   
                   imagemagick | CVE-2016-7518    | https://security-tracker.debian.org/tracker/CVE-2016-7518   
                   imagemagick | CVE-2016-7519    | https://security-tracker.debian.org/tracker/CVE-2016-7519   
                   imagemagick | CVE-2016-7520    | https://security-tracker.debian.org/tracker/CVE-2016-7520   
                   imagemagick | CVE-2016-7521    | https://security-tracker.debian.org/tracker/CVE-2016-7521   
                   imagemagick | CVE-2016-7522    | https://security-tracker.debian.org/tracker/CVE-2016-7522   
                   imagemagick | CVE-2016-7523    | https://security-tracker.debian.org/tracker/CVE-2016-7523   
                   imagemagick | CVE-2016-7524    | https://security-tracker.debian.org/tracker/CVE-2016-7524   
                   imagemagick | CVE-2016-7525    | https://security-tracker.debian.org/tracker/CVE-2016-7525   
                   imagemagick | CVE-2016-7526    | https://security-tracker.debian.org/tracker/CVE-2016-7526   
                   imagemagick | CVE-2016-7527    | https://security-tracker.debian.org/tracker/CVE-2016-7527   
                   imagemagick | CVE-2016-7528    | https://security-tracker.debian.org/tracker/CVE-2016-7528   
                   imagemagick | CVE-2016-7529    | https://security-tracker.debian.org/tracker/CVE-2016-7529   
                   imagemagick | CVE-2016-7530    | https://security-tracker.debian.org/tracker/CVE-2016-7530   
                   imagemagick | CVE-2016-7531    | https://security-tracker.debian.org/tracker/CVE-2016-7531   
                   imagemagick | CVE-2016-7532    | https://security-tracker.debian.org/tracker/CVE-2016-7532   
                   imagemagick | CVE-2016-7533    | https://security-tracker.debian.org/tracker/CVE-2016-7533   
                   imagemagick | CVE-2016-7534    | https://security-tracker.debian.org/tracker/CVE-2016-7534   
                   imagemagick | CVE-2016-7535    | https://security-tracker.debian.org/tracker/CVE-2016-7535   
                   imagemagick | CVE-2016-7536    | https://security-tracker.debian.org/tracker/CVE-2016-7536   
                   imagemagick | CVE-2016-7537    | https://security-tracker.debian.org/tracker/CVE-2016-7537   
                   imagemagick | CVE-2016-7538    | https://security-tracker.debian.org/tracker/CVE-2016-7538   
                   imagemagick | CVE-2017-5506    | https://security-tracker.debian.org/tracker/CVE-2017-5506   
                   imagemagick | CVE-2017-5509    | https://security-tracker.debian.org/tracker/CVE-2017-5509   
                   imagemagick | CVE-2017-5510    | https://security-tracker.debian.org/tracker/CVE-2017-5510   
                   imagemagick | CVE-2017-5511    | https://security-tracker.debian.org/tracker/CVE-2017-5511   
                        jasper | CVE-2015-8751    | https://security-tracker.debian.org/tracker/CVE-2015-8751   
                        jquery | CVE-2007-2379    | https://security-tracker.debian.org/tracker/CVE-2007-2379   
                         libao | CVE-2017-11548   | https://security-tracker.debian.org/tracker/CVE-2017-11548  
                        libbpf | CVE-2021-45940   | https://security-tracker.debian.org/tracker/CVE-2021-45940  
                        libbpf | CVE-2021-45941   | https://security-tracker.debian.org/tracker/CVE-2021-45941  
                  libfreeimage | CVE-2019-12211   | https://security-tracker.debian.org/tracker/CVE-2019-12211  
                  libfreeimage | CVE-2019-12212   | https://security-tracker.debian.org/tracker/CVE-2019-12212  
                  libfreeimage | CVE-2019-12213   | https://security-tracker.debian.org/tracker/CVE-2019-12213  
                  libfreeimage | CVE-2019-12214   | https://security-tracker.debian.org/tracker/CVE-2019-12214  
                     libiberty | CVE-2012-3509    | https://security-tracker.debian.org/tracker/CVE-2012-3509   
                     libiberty | CVE-2016-2226    | https://security-tracker.debian.org/tracker/CVE-2016-2226   
                     libiberty | CVE-2016-4487    | https://security-tracker.debian.org/tracker/CVE-2016-4487   
                     libiberty | CVE-2016-4488    | https://security-tracker.debian.org/tracker/CVE-2016-4488   
                     libiberty | CVE-2016-4489    | https://security-tracker.debian.org/tracker/CVE-2016-4489   
                     libiberty | CVE-2016-4490    | https://security-tracker.debian.org/tracker/CVE-2016-4490   
                     libiberty | CVE-2016-4491    | https://security-tracker.debian.org/tracker/CVE-2016-4491   
                     libiberty | CVE-2016-4492    | https://security-tracker.debian.org/tracker/CVE-2016-4492   
                     libiberty | CVE-2016-4493    | https://security-tracker.debian.org/tracker/CVE-2016-4493   
                     libiberty | CVE-2016-6131    | https://security-tracker.debian.org/tracker/CVE-2016-6131   
                       libkrb5 | CVE-1999-0143    | https://security-tracker.debian.org/tracker/CVE-1999-0143   
                       libkrb5 | CVE-1999-0713    | https://security-tracker.debian.org/tracker/CVE-1999-0713   
                       libkrb5 | CVE-2007-3149    | https://security-tracker.debian.org/tracker/CVE-2007-3149   
                       libkrb5 | CVE-2007-5894    | https://security-tracker.debian.org/tracker/CVE-2007-5894   
                       libkrb5 | CVE-2007-5902    | https://security-tracker.debian.org/tracker/CVE-2007-5902   
                       libkrb5 | CVE-2009-0844    | https://security-tracker.debian.org/tracker/CVE-2009-0844   
                       libkrb5 | CVE-2009-0846    | https://security-tracker.debian.org/tracker/CVE-2009-0846   
                        libmad | CVE-2018-7263    | https://security-tracker.debian.org/tracker/CVE-2018-7263   
                      libpjsip | CVE-2022-24754   | https://security-tracker.debian.org/tracker/CVE-2022-24754  
                      libpjsip | CVE-2022-24764   | https://security-tracker.debian.org/tracker/CVE-2022-24764  
                      libpjsip | CVE-2022-24792   | https://security-tracker.debian.org/tracker/CVE-2022-24792  
                      libplist | CVE-2017-5834    | https://security-tracker.debian.org/tracker/CVE-2017-5834   
                      libplist | CVE-2017-5835    | https://security-tracker.debian.org/tracker/CVE-2017-5835   
                      libplist | CVE-2017-5836    | https://security-tracker.debian.org/tracker/CVE-2017-5836   
                    libtorrent | CVE-2009-1760    | https://security-tracker.debian.org/tracker/CVE-2009-1760   
                    libtorrent | CVE-2016-5301    | https://security-tracker.debian.org/tracker/CVE-2016-5301   
                       libvirt | CVE-2014-8135    | https://security-tracker.debian.org/tracker/CVE-2014-8135   
                       libvirt | CVE-2014-8136    | https://security-tracker.debian.org/tracker/CVE-2014-8136   
                       libvirt | CVE-2015-5313    | https://security-tracker.debian.org/tracker/CVE-2015-5313   
                       libvirt | CVE-2018-5748    | https://security-tracker.debian.org/tracker/CVE-2018-5748   
                       libvirt | CVE-2018-6764    | https://security-tracker.debian.org/tracker/CVE-2018-6764   
                         lrzsz | CVE-2018-10195   | https://security-tracker.debian.org/tracker/CVE-2018-10195  
                           lua | CVE-2014-5461    | https://security-tracker.debian.org/tracker/CVE-2014-5461   
                           lua | CVE-2020-15888   | https://security-tracker.debian.org/tracker/CVE-2020-15888  
                           lua | CVE-2020-15945   | https://security-tracker.debian.org/tracker/CVE-2020-15945  
                           lua | CVE-2021-43519   | https://security-tracker.debian.org/tracker/CVE-2021-43519  
                           lua | CVE-2022-28805   | https://security-tracker.debian.org/tracker/CVE-2022-28805  
                       mariadb | CVE-2021-46669   | https://security-tracker.debian.org/tracker/CVE-2021-46669  
                       mariadb | CVE-2022-27376   | https://security-tracker.debian.org/tracker/CVE-2022-27376  
                       mariadb | CVE-2022-27377   | https://security-tracker.debian.org/tracker/CVE-2022-27377  
                       mariadb | CVE-2022-27378   | https://security-tracker.debian.org/tracker/CVE-2022-27378  
                       mariadb | CVE-2022-27379   | https://security-tracker.debian.org/tracker/CVE-2022-27379  
                       mariadb | CVE-2022-27380   | https://security-tracker.debian.org/tracker/CVE-2022-27380  
                       mariadb | CVE-2022-27381   | https://security-tracker.debian.org/tracker/CVE-2022-27381  
                       mariadb | CVE-2022-27382   | https://security-tracker.debian.org/tracker/CVE-2022-27382  
                       mariadb | CVE-2022-27383   | https://security-tracker.debian.org/tracker/CVE-2022-27383  
                       mariadb | CVE-2022-27384   | https://security-tracker.debian.org/tracker/CVE-2022-27384  
                       mariadb | CVE-2022-27385   | https://security-tracker.debian.org/tracker/CVE-2022-27385  
                       mariadb | CVE-2022-27386   | https://security-tracker.debian.org/tracker/CVE-2022-27386  
                       mariadb | CVE-2022-27387   | https://security-tracker.debian.org/tracker/CVE-2022-27387  
                       mariadb | CVE-2022-27444   | https://security-tracker.debian.org/tracker/CVE-2022-27444  
                       mariadb | CVE-2022-27445   | https://security-tracker.debian.org/tracker/CVE-2022-27445  
                       mariadb | CVE-2022-27446   | https://security-tracker.debian.org/tracker/CVE-2022-27446  
                       mariadb | CVE-2022-27447   | https://security-tracker.debian.org/tracker/CVE-2022-27447  
                       mariadb | CVE-2022-27448   | https://security-tracker.debian.org/tracker/CVE-2022-27448  
                       mariadb | CVE-2022-27449   | https://security-tracker.debian.org/tracker/CVE-2022-27449  
                       mariadb | CVE-2022-27451   | https://security-tracker.debian.org/tracker/CVE-2022-27451  
                       mariadb | CVE-2022-27452   | https://security-tracker.debian.org/tracker/CVE-2022-27452  
                       mariadb | CVE-2022-27455   | https://security-tracker.debian.org/tracker/CVE-2022-27455  
                       mariadb | CVE-2022-27456   | https://security-tracker.debian.org/tracker/CVE-2022-27456  
                       mariadb | CVE-2022-27457   | https://security-tracker.debian.org/tracker/CVE-2022-27457  
                       mariadb | CVE-2022-27458   | https://security-tracker.debian.org/tracker/CVE-2022-27458  
                       mbedtls | CVE-2021-45451   | https://security-tracker.debian.org/tracker/CVE-2021-45451  
                       mongodb | CVE-2014-8180    | https://security-tracker.debian.org/tracker/CVE-2014-8180   
                       mongodb | CVE-2017-18381   | https://security-tracker.debian.org/tracker/CVE-2017-18381  
                       mongodb | CVE-2017-2665    | https://security-tracker.debian.org/tracker/CVE-2017-2665   
                          mutt | CVE-2011-1429    | https://security-tracker.debian.org/tracker/CVE-2011-1429   
                          mutt | CVE-2022-1328    | https://security-tracker.debian.org/tracker/CVE-2022-1328   
                          nasm | CVE-2020-18974   | https://security-tracker.debian.org/tracker/CVE-2020-18974  
                       ncurses | CVE-2021-39537   | https://security-tracker.debian.org/tracker/CVE-2021-39537  
                       ncurses | CVE-2022-29458   | https://security-tracker.debian.org/tracker/CVE-2022-29458  
                           ntp | CVE-2014-9750    | https://security-tracker.debian.org/tracker/CVE-2014-9750   
                           ntp | CVE-2014-9751    | https://security-tracker.debian.org/tracker/CVE-2014-9751   
                           ntp | CVE-2015-7691    | https://security-tracker.debian.org/tracker/CVE-2015-7691   
                           ntp | CVE-2015-7692    | https://security-tracker.debian.org/tracker/CVE-2015-7692   
                           ntp | CVE-2015-7701    | https://security-tracker.debian.org/tracker/CVE-2015-7701   
                           ntp | CVE-2015-7702    | https://security-tracker.debian.org/tracker/CVE-2015-7702   
                           ntp | CVE-2015-7703    | https://security-tracker.debian.org/tracker/CVE-2015-7703   
                           ntp | CVE-2015-7704    | https://security-tracker.debian.org/tracker/CVE-2015-7704   
                           ntp | CVE-2015-7705    | https://security-tracker.debian.org/tracker/CVE-2015-7705   
                           ntp | CVE-2015-7849    | https://security-tracker.debian.org/tracker/CVE-2015-7849   
                           ntp | CVE-2015-7850    | https://security-tracker.debian.org/tracker/CVE-2015-7850   
                           ntp | CVE-2015-7852    | https://security-tracker.debian.org/tracker/CVE-2015-7852   
                           ntp | CVE-2015-7853    | https://security-tracker.debian.org/tracker/CVE-2015-7853   
                           ntp | CVE-2015-7854    | https://security-tracker.debian.org/tracker/CVE-2015-7854   
                           ntp | CVE-2015-7855    | https://security-tracker.debian.org/tracker/CVE-2015-7855   
                           ntp | CVE-2015-7973    | https://security-tracker.debian.org/tracker/CVE-2015-7973   
                           ntp | CVE-2015-7974    | https://security-tracker.debian.org/tracker/CVE-2015-7974   
                           ntp | CVE-2015-7977    | https://security-tracker.debian.org/tracker/CVE-2015-7977   
                           ntp | CVE-2016-2518    | https://security-tracker.debian.org/tracker/CVE-2016-2518   
                           ntp | CVE-2016-4953    | https://security-tracker.debian.org/tracker/CVE-2016-4953   
                           ntp | CVE-2016-4954    | https://security-tracker.debian.org/tracker/CVE-2016-4954   
                           ntp | CVE-2016-4955    | https://security-tracker.debian.org/tracker/CVE-2016-4955   
                           ntp | CVE-2016-4956    | https://security-tracker.debian.org/tracker/CVE-2016-4956   
                           ntp | CVE-2016-7426    | https://security-tracker.debian.org/tracker/CVE-2016-7426   
                           ntp | CVE-2016-7434    | https://security-tracker.debian.org/tracker/CVE-2016-7434   
                           ntp | CVE-2017-6458    | https://security-tracker.debian.org/tracker/CVE-2017-6458   
                           ntp | CVE-2018-7170    | https://security-tracker.debian.org/tracker/CVE-2018-7170   
                           ntp | CVE-2018-7185    | https://security-tracker.debian.org/tracker/CVE-2018-7185   
                           ntp | CVE-2019-11331   | https://security-tracker.debian.org/tracker/CVE-2019-11331  
                           ntp | CVE-2019-8936    | https://security-tracker.debian.org/tracker/CVE-2019-8936   
                           ntp | CVE-2020-11868   | https://security-tracker.debian.org/tracker/CVE-2020-11868  
                           ntp | CVE-2020-13817   | https://security-tracker.debian.org/tracker/CVE-2020-13817  
                       opencv3 | CVE-2019-14493   | https://security-tracker.debian.org/tracker/CVE-2019-14493  
                       opencv3 | CVE-2019-15939   | https://security-tracker.debian.org/tracker/CVE-2019-15939  
                       opencv3 | CVE-2019-19624   | https://security-tracker.debian.org/tracker/CVE-2019-19624  
                       openjdk | CVE-2009-2475    | https://security-tracker.debian.org/tracker/CVE-2009-2475   
                       openjdk | CVE-2009-2476    | https://security-tracker.debian.org/tracker/CVE-2009-2476   
                       openjdk | CVE-2009-2689    | https://security-tracker.debian.org/tracker/CVE-2009-2689   
                       openjdk | CVE-2009-2690    | https://security-tracker.debian.org/tracker/CVE-2009-2690   
                       openjdk | CVE-2009-3728    | https://security-tracker.debian.org/tracker/CVE-2009-3728   
                       openjdk | CVE-2009-3879    | https://security-tracker.debian.org/tracker/CVE-2009-3879   
                       openjdk | CVE-2009-3880    | https://security-tracker.debian.org/tracker/CVE-2009-3880   
                       openjdk | CVE-2009-3881    | https://security-tracker.debian.org/tracker/CVE-2009-3881   
                       openjdk | CVE-2009-3882    | https://security-tracker.debian.org/tracker/CVE-2009-3882   
                       openjdk | CVE-2009-3883    | https://security-tracker.debian.org/tracker/CVE-2009-3883   
                       openjdk | CVE-2009-3884    | https://security-tracker.debian.org/tracker/CVE-2009-3884   
                       openjdk | CVE-2013-0169    | https://security-tracker.debian.org/tracker/CVE-2013-0169   
                      openjpeg | CVE-2015-1239    | https://security-tracker.debian.org/tracker/CVE-2015-1239   
                      openjpeg | CVE-2016-9675    | https://security-tracker.debian.org/tracker/CVE-2016-9675   
                      openjpeg | CVE-2021-29338   | https://security-tracker.debian.org/tracker/CVE-2021-29338  
                      openjpeg | CVE-2021-3575    | https://security-tracker.debian.org/tracker/CVE-2021-3575   
                      openjpeg | CVE-2022-1122    | https://security-tracker.debian.org/tracker/CVE-2022-1122   
                      openldap | CVE-2015-3276    | https://security-tracker.debian.org/tracker/CVE-2015-3276   
                       openssh | CVE-2007-2768    | https://security-tracker.debian.org/tracker/CVE-2007-2768   
                       openssh | CVE-2008-3844    | https://security-tracker.debian.org/tracker/CVE-2008-3844   
                       openssh | CVE-2014-9278    | https://security-tracker.debian.org/tracker/CVE-2014-9278   
                      openswan | CVE-2019-10155   | https://security-tracker.debian.org/tracker/CVE-2019-10155  
                         p7zip | CVE-2017-17969   | https://security-tracker.debian.org/tracker/CVE-2017-17969  
                         p7zip | CVE-2018-5996    | https://security-tracker.debian.org/tracker/CVE-2018-5996   
                         patch | CVE-2018-6952    | https://security-tracker.debian.org/tracker/CVE-2018-6952   
                         patch | CVE-2019-20633   | https://security-tracker.debian.org/tracker/CVE-2019-20633  
                           php | CVE-2007-2728    | https://security-tracker.debian.org/tracker/CVE-2007-2728   
                           php | CVE-2007-3205    | https://security-tracker.debian.org/tracker/CVE-2007-3205   
                           php | CVE-2007-4596    | https://security-tracker.debian.org/tracker/CVE-2007-4596   
                        polkit | CVE-2021-4034    | https://security-tracker.debian.org/tracker/CVE-2021-4034   
                    postgresql | CVE-2017-8806    | https://security-tracker.debian.org/tracker/CVE-2017-8806   
                 powerpc-utils | CVE-2014-8165    | https://security-tracker.debian.org/tracker/CVE-2014-8165   
                          pppd | CVE-2018-11574   | https://security-tracker.debian.org/tracker/CVE-2018-11574  
                 python-django | CVE-2022-28346   | https://security-tracker.debian.org/tracker/CVE-2022-28346  
                 python-django | CVE-2022-28347   | https://security-tracker.debian.org/tracker/CVE-2022-28347  
               python-m2crypto | CVE-2020-25657   | https://security-tracker.debian.org/tracker/CVE-2020-25657  
                    python-pip | CVE-2018-20225   | https://security-tracker.debian.org/tracker/CVE-2018-20225  
                python-twisted | CVE-2022-24801   | https://security-tracker.debian.org/tracker/CVE-2022-24801  
                       python3 | CVE-2015-20107   | https://security-tracker.debian.org/tracker/CVE-2015-20107  
                       python3 | CVE-2022-26488   | https://security-tracker.debian.org/tracker/CVE-2022-26488  
                          qemu | CVE-2018-18438   | https://security-tracker.debian.org/tracker/CVE-2018-18438  
                          qemu | CVE-2019-12067   | https://security-tracker.debian.org/tracker/CVE-2019-12067  
                          qemu | CVE-2021-20255   | https://security-tracker.debian.org/tracker/CVE-2021-20255  
                          qemu | CVE-2021-3947    | https://security-tracker.debian.org/tracker/CVE-2021-3947   
                          qemu | CVE-2022-1050    | https://security-tracker.debian.org/tracker/CVE-2022-1050   
                          qemu | CVE-2022-26353   | https://security-tracker.debian.org/tracker/CVE-2022-26353  
                          qemu | CVE-2022-26354   | https://security-tracker.debian.org/tracker/CVE-2022-26354  
                        quagga | CVE-2016-4049    | https://security-tracker.debian.org/tracker/CVE-2016-4049   
                        quagga | CVE-2017-3224    | https://security-tracker.debian.org/tracker/CVE-2017-3224   
                        quagga | CVE-2021-44038   | https://security-tracker.debian.org/tracker/CVE-2021-44038  
               rabbitmq-server | CVE-2018-11087   | https://security-tracker.debian.org/tracker/CVE-2018-11087  
               rabbitmq-server | CVE-2018-1279    | https://security-tracker.debian.org/tracker/CVE-2018-1279   
                   resiprocate | CVE-2017-9454    | https://security-tracker.debian.org/tracker/CVE-2017-9454   
                       rtl_433 | CVE-2022-27419   | https://security-tracker.debian.org/tracker/CVE-2022-27419  
                        samba4 | CVE-2011-2411    | https://security-tracker.debian.org/tracker/CVE-2011-2411   
                        samba4 | CVE-2018-1050    | https://security-tracker.debian.org/tracker/CVE-2018-1050   
                        samba4 | CVE-2018-1057    | https://security-tracker.debian.org/tracker/CVE-2018-1057   
                           sdl | CVE-2019-13616   | https://security-tracker.debian.org/tracker/CVE-2019-13616  
                           sdl | CVE-2019-14906   | https://security-tracker.debian.org/tracker/CVE-2019-14906  
                           sdl | CVE-2019-7572    | https://security-tracker.debian.org/tracker/CVE-2019-7572   
                           sdl | CVE-2019-7573    | https://security-tracker.debian.org/tracker/CVE-2019-7573   
                           sdl | CVE-2019-7574    | https://security-tracker.debian.org/tracker/CVE-2019-7574   
                           sdl | CVE-2019-7575    | https://security-tracker.debian.org/tracker/CVE-2019-7575   
                           sdl | CVE-2019-7576    | https://security-tracker.debian.org/tracker/CVE-2019-7576   
                           sdl | CVE-2019-7577    | https://security-tracker.debian.org/tracker/CVE-2019-7577   
                           sdl | CVE-2019-7578    | https://security-tracker.debian.org/tracker/CVE-2019-7578   
                           sdl | CVE-2019-7635    | https://security-tracker.debian.org/tracker/CVE-2019-7635   
                           sdl | CVE-2019-7636    | https://security-tracker.debian.org/tracker/CVE-2019-7636   
                           sdl | CVE-2019-7637    | https://security-tracker.debian.org/tracker/CVE-2019-7637   
                           sdl | CVE-2019-7638    | https://security-tracker.debian.org/tracker/CVE-2019-7638   
                           sdl | CVE-2020-14409   | https://security-tracker.debian.org/tracker/CVE-2020-14409  
                           sdl | CVE-2020-14410   | https://security-tracker.debian.org/tracker/CVE-2020-14410  
                         smack | CVE-2014-0363    | https://security-tracker.debian.org/tracker/CVE-2014-0363   
                         smack | CVE-2014-0364    | https://security-tracker.debian.org/tracker/CVE-2014-0364   
                         smack | CVE-2016-10027   | https://security-tracker.debian.org/tracker/CVE-2016-10027  
                         spice | CVE-2016-0749    | https://security-tracker.debian.org/tracker/CVE-2016-0749   
                         spice | CVE-2016-2150    | https://security-tracker.debian.org/tracker/CVE-2016-2150   
                         spice | CVE-2018-10893   | https://security-tracker.debian.org/tracker/CVE-2018-10893  
                    subversion | CVE-2021-28544   | https://security-tracker.debian.org/tracker/CVE-2021-28544  
                    subversion | CVE-2022-24070   | https://security-tracker.debian.org/tracker/CVE-2022-24070  
                        thttpd | CVE-2012-5640    | https://security-tracker.debian.org/tracker/CVE-2012-5640   
                          tiff | CVE-2015-7313    | https://security-tracker.debian.org/tracker/CVE-2015-7313   
                          tiff | CVE-2022-0561    | https://security-tracker.debian.org/tracker/CVE-2022-0561   
                          tiff | CVE-2022-0562    | https://security-tracker.debian.org/tracker/CVE-2022-0562   
                          tiff | CVE-2022-0865    | https://security-tracker.debian.org/tracker/CVE-2022-0865   
                          tiff | CVE-2022-0891    | https://security-tracker.debian.org/tracker/CVE-2022-0891   
                          tiff | CVE-2022-0907    | https://security-tracker.debian.org/tracker/CVE-2022-0907   
                          tiff | CVE-2022-0908    | https://security-tracker.debian.org/tracker/CVE-2022-0908   
                          tiff | CVE-2022-0909    | https://security-tracker.debian.org/tracker/CVE-2022-0909   
                          tiff | CVE-2022-0924    | https://security-tracker.debian.org/tracker/CVE-2022-0924   
                          tiff | CVE-2022-1056    | https://security-tracker.debian.org/tracker/CVE-2022-1056   
                          tiff | CVE-2022-1210    | https://security-tracker.debian.org/tracker/CVE-2022-1210   
                          tinc | CVE-2013-1428    | https://security-tracker.debian.org/tracker/CVE-2013-1428   
                           tor | CVE-2016-9079    | https://security-tracker.debian.org/tracker/CVE-2016-9079   
                           tor | CVE-2017-16541   | https://security-tracker.debian.org/tracker/CVE-2017-16541  
                         unzip | CVE-2022-0529    | https://security-tracker.debian.org/tracker/CVE-2022-0529   
                         unzip | CVE-2022-0530    | https://security-tracker.debian.org/tracker/CVE-2022-0530   
                      usbguard | CVE-2019-25058   | https://security-tracker.debian.org/tracker/CVE-2019-25058  
                           vim | CVE-2022-1381    | https://security-tracker.debian.org/tracker/CVE-2022-1381   
                           vim | CVE-2022-1420    | https://security-tracker.debian.org/tracker/CVE-2022-1420   
                           xen | CVE-2011-1936    | https://security-tracker.debian.org/tracker/CVE-2011-1936   
                           xen | CVE-2011-3346    | https://security-tracker.debian.org/tracker/CVE-2011-3346   
                           xen | CVE-2014-2580    | https://security-tracker.debian.org/tracker/CVE-2014-2580   
                           xen | CVE-2014-3672    | https://security-tracker.debian.org/tracker/CVE-2014-3672   
                           xen | CVE-2015-7504    | https://security-tracker.debian.org/tracker/CVE-2015-7504   
                           xen | CVE-2015-8550    | https://security-tracker.debian.org/tracker/CVE-2015-8550   
                           xen | CVE-2015-8553    | https://security-tracker.debian.org/tracker/CVE-2015-8553   
                           xen | CVE-2016-3960    | https://security-tracker.debian.org/tracker/CVE-2016-3960   
                           xen | CVE-2016-7092    | https://security-tracker.debian.org/tracker/CVE-2016-7092   
                           xen | CVE-2016-9379    | https://security-tracker.debian.org/tracker/CVE-2016-9379   
                           xen | CVE-2016-9380    | https://security-tracker.debian.org/tracker/CVE-2016-9380   
                           xen | CVE-2016-9383    | https://security-tracker.debian.org/tracker/CVE-2016-9383   
                           xen | CVE-2016-9386    | https://security-tracker.debian.org/tracker/CVE-2016-9386   
                           xen | CVE-2017-12134   | https://security-tracker.debian.org/tracker/CVE-2017-12134  
                           xen | CVE-2017-12135   | https://security-tracker.debian.org/tracker/CVE-2017-12135  
                           xen | CVE-2017-12137   | https://security-tracker.debian.org/tracker/CVE-2017-12137  
                           xen | CVE-2017-7228    | https://security-tracker.debian.org/tracker/CVE-2017-7228   
                           xen | CVE-2018-5244    | https://security-tracker.debian.org/tracker/CVE-2018-5244   
                           xen | CVE-2018-8897    | https://security-tracker.debian.org/tracker/CVE-2018-8897   
                           xen | CVE-2021-26313   | https://security-tracker.debian.org/tracker/CVE-2021-26313  
                           xen | CVE-2021-26314   | https://security-tracker.debian.org/tracker/CVE-2021-26314  
                           xen | CVE-2021-28038   | https://security-tracker.debian.org/tracker/CVE-2021-28038  
                           xen | CVE-2021-28039   | https://security-tracker.debian.org/tracker/CVE-2021-28039  
                           xen | CVE-2021-28687   | https://security-tracker.debian.org/tracker/CVE-2021-28687  
                           xen | CVE-2021-28690   | https://security-tracker.debian.org/tracker/CVE-2021-28690  
                           xen | CVE-2021-28692   | https://security-tracker.debian.org/tracker/CVE-2021-28692  
                           xen | CVE-2021-28693   | https://security-tracker.debian.org/tracker/CVE-2021-28693  
                           xen | CVE-2021-28694   | https://security-tracker.debian.org/tracker/CVE-2021-28694  
                           xen | CVE-2021-28695   | https://security-tracker.debian.org/tracker/CVE-2021-28695  
                           xen | CVE-2021-28696   | https://security-tracker.debian.org/tracker/CVE-2021-28696  
                           xen | CVE-2021-28697   | https://security-tracker.debian.org/tracker/CVE-2021-28697  
                           xen | CVE-2021-28698   | https://security-tracker.debian.org/tracker/CVE-2021-28698  
                           xen | CVE-2021-28699   | https://security-tracker.debian.org/tracker/CVE-2021-28699  
                           xen | CVE-2021-28700   | https://security-tracker.debian.org/tracker/CVE-2021-28700  
                           xen | CVE-2021-28701   | https://security-tracker.debian.org/tracker/CVE-2021-28701  
                           xen | CVE-2021-28702   | https://security-tracker.debian.org/tracker/CVE-2021-28702  
                           xen | CVE-2021-28703   | https://security-tracker.debian.org/tracker/CVE-2021-28703  
                           xen | CVE-2021-28704   | https://security-tracker.debian.org/tracker/CVE-2021-28704  
                           xen | CVE-2021-28707   | https://security-tracker.debian.org/tracker/CVE-2021-28707  
                           xen | CVE-2021-28708   | https://security-tracker.debian.org/tracker/CVE-2021-28708  
                           xen | CVE-2021-28711   | https://security-tracker.debian.org/tracker/CVE-2021-28711  
                           xen | CVE-2021-28712   | https://security-tracker.debian.org/tracker/CVE-2021-28712  
                           xen | CVE-2021-28713   | https://security-tracker.debian.org/tracker/CVE-2021-28713  
                           xen | CVE-2022-23033   | https://security-tracker.debian.org/tracker/CVE-2022-23033  
                           xen | CVE-2022-23035   | https://security-tracker.debian.org/tracker/CVE-2022-23035  
                           xen | CVE-2022-23036   | https://security-tracker.debian.org/tracker/CVE-2022-23036  
                           xen | CVE-2022-23037   | https://security-tracker.debian.org/tracker/CVE-2022-23037  
                           xen | CVE-2022-23038   | https://security-tracker.debian.org/tracker/CVE-2022-23038  
                           xen | CVE-2022-23039   | https://security-tracker.debian.org/tracker/CVE-2022-23039  
                           xen | CVE-2022-23040   | https://security-tracker.debian.org/tracker/CVE-2022-23040  
                           xen | CVE-2022-23041   | https://security-tracker.debian.org/tracker/CVE-2022-23041  
                           xen | CVE-2022-23042   | https://security-tracker.debian.org/tracker/CVE-2022-23042  
                           xen | CVE-2022-23960   | https://security-tracker.debian.org/tracker/CVE-2022-23960  
                           xen | CVE-2022-26357   | https://security-tracker.debian.org/tracker/CVE-2022-26357  
                           xen | CVE-2022-26358   | https://security-tracker.debian.org/tracker/CVE-2022-26358  
                           xen | CVE-2022-26359   | https://security-tracker.debian.org/tracker/CVE-2022-26359  
                           xen | CVE-2022-26360   | https://security-tracker.debian.org/tracker/CVE-2022-26360  
                           xen | CVE-2022-26361   | https://security-tracker.debian.org/tracker/CVE-2022-26361  
                        xerces | CVE-2012-0880    | https://security-tracker.debian.org/tracker/CVE-2012-0880   
                  xscreensaver | CVE-2021-34557   | https://security-tracker.debian.org/tracker/CVE-2021-34557  
                           zip | CVE-2018-13410   | https://security-tracker.debian.org/tracker/CVE-2018-13410  
                          zlog | CVE-2021-43521   | https://security-tracker.debian.org/tracker/CVE-2021-43521  


-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
