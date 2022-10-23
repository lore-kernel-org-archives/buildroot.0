Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2901C433FE
	for <buildroot@archiver.kernel.org>; Sun, 23 Oct 2022 05:35:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3BDFB41061;
	Sun, 23 Oct 2022 05:35:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3BDFB41061
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VRRq2vNwF7RA; Sun, 23 Oct 2022 05:35:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1D91040E46;
	Sun, 23 Oct 2022 05:35:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1D91040E46
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3F2AE1BF5B5
 for <buildroot@lists.busybox.net>; Sun, 23 Oct 2022 05:34:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0254A60BB9
 for <buildroot@lists.busybox.net>; Sun, 23 Oct 2022 05:34:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0254A60BB9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id USy8cqHZqJ_M for <buildroot@lists.busybox.net>;
 Sun, 23 Oct 2022 05:34:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0157360AF4
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0157360AF4
 for <buildroot@buildroot.org>; Sun, 23 Oct 2022 05:34:55 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id BFFA81BF207
 for <buildroot@buildroot.org>; Sun, 23 Oct 2022 05:34:52 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sun, 23 Oct 2022 05:34:52 -0000
Message-Id: <20221023053459.0254A60BB9@smtp3.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1666503292; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=2laZpIbB4RGzDKxG6ZvQHDeNpYQkRMbvyLgK2zua5+Q=;
 b=Eaa7bjmGLqF72Vef+vt18pJoUALsWOs8egOPO4lNlwk1X/1PZnFn3gHdgRV0SvdR6RX2xy
 1l9tnEjol5juVPfCKfivWgY48h09hJON2oCaqodIpPz6Ie16+SF2eOKFAf8361XHfs/iOC
 vp5FxUNOQCgq/88lpXvH32xa2/NnbHOIbHIKDxD1UHFq8UDLpdR24piRH2SwEVt/dvdKy0
 76zt6+sXA5XIt4ITBlpZbGM+p8B2Lmu9ojLlt915DUehdCv0ZRGGu6TAV8Sb4hTI+E2/jp
 dJegn0n2nZIo0gzBCBLefXOTQ0lucoDtpi5/AjxAnjQDVhbVcQPxjdk5g9J7sg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Eaa7bjmG
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-10-22
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

Autobuild statistics for 2022-10-22
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  |  3  |  3  |  0  |  6  |
  2022.08.x  |  7  | 16  |  0  | 23  |
    master   | 115 | 227 |  7  | 349 |

Classification of failures by reason for master
-----------------------------------------------

                      crun-1.5 | 13
                   libnss-3.84 | 11
        host-sentry-cli-1.59.0 | 10
        host-f2fs-tools-1.15.0 | 9 
                 systemd-250.4 | 9 
                 sysvinit-2.99 | 9 
                        brltty | 7 
            igd2-for-linux-2.1 | 7 
            btrfs-progs-5.16.2 | 6 
                gerbera-1.10.0 | 6 
glibc-2.36-44-g2628500f5dff... | 6 
dahdi-linux-5c840cf43838e06... | 5 
            host-binutils-2.38 | 5 
                host-go-1.19.1 | 5 
host-pahole-73383b3a39afe86... | 4 
              host-rust-1.64.0 | 4 
                   linux-6.0.1 | 4 
                   perl-5.34.1 | 4 
                       unknown | 4 
                  autofs-5.1.8 | 3 
             batman-adv-2021.4 | 3 
                     efivar-38 | 3 
                  gensio-2.5.5 | 3 
             libgpg-error-1.45 | 3 
                    lxc-4.0.12 | 3 
              procps-ng-3.3.17 | 3 
                 wolfssl-5.5.1 | 3 
                      xz-5.2.7 | 3 
                  botan-2.19.2 | 2 
casync-4ad9bcb94bc83ff36cfc... | 2 
fs/cpio/cpio.mk:117: /tmp/i... | 2 
fs/cpio/cpio.mk:117: /tmp/i... | 2 
            host-binutils-2.37 | 2 
              libarchive-3.6.1 | 2 
               libglib2-2.72.3 | 2 
      linux-5.10.145-cip17-rt7 | 2 
                  ntp-4.2.8p15 | 2 
                    sdl-1.2.15 | 2 
                    volk-2.5.2 | 2 
/home/buildroot/autobuild/i... | 1 
/home/buildroot/autobuild/i... | 1 
              alsa-lib-1.2.7.2 | 1 
                  boost-1.80.0 | 1 
                   bullet-3.21 | 1 
                  check-0.15.2 | 1 
               collectd-5.12.0 | 1 
              containerd-1.6.8 | 1 
                 dash-0.5.11.5 | 1 
dawgdic-16ac537ba9883ff01b6... | 1 
              dieharder-3.31.1 | 1 
                elfutils-0.186 | 1 
              erlang-22.3.4.22 | 1 
                 fdk-aac-2.0.2 | 1 
                     file-5.41 | 1 
                flannel-0.14.0 | 1 
       freeradius-client-1.1.7 | 1 
fs/cramfs/cramfs.mk:46: /ho... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /tmp/... | 1 
                gnu-efi-3.0.15 | 1 
  gobject-introspection-1.72.0 | 1 
         host-gcc-final-11.3.0 | 1 
               host-runc-1.1.4 | 1 
host-spirv-llvm-translator-... | 1 
            igh-ethercat-1.5.2 | 1 
               libcap-ng-0.8.3 | 1 
         libcpprestsdk-2.10.18 | 1 
                libcurl-7.84.0 | 1 
               libdcadec-0.2.0 | 1 
              libgcrypt-1.10.1 | 1 
                libglvnd-1.4.0 | 1 
               libmdbx-0.11.12 | 1 
                 libsigc-3.2.0 | 1 
               libvorbis-1.3.7 | 1 
        lttng-babeltrace-1.5.7 | 1 
            lttng-tools-2.13.2 | 1 
                   luvi-2.13.0 | 1 
            makedumpfile-1.7.0 | 1 
               mariadb-10.3.36 | 1 
                  matio-1.5.22 | 1 
                  mender-3.4.0 | 1 
                    ne10-1.2.1 | 1 
                nodejs-16.17.1 | 1 
                  ntpsec-1_2_1 | 1 
            ocf-linux-20171122 | 1 
                 openal-1.22.0 | 1 
                    php-8.1.11 | 1 
                    pixz-1.0.7 | 1 
               poppler-21.12.0 | 1 
                     pv-1.6.20 | 1 
rtl8821au-4235b0ec7d7220a63... | 1 
                 uclibc-1.0.42 | 1 
uqmi-0a19b5b77140465c29e2af... | 1 
               valgrind-3.19.0 | 1 
                  vlc-3.0.17.4 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/97b8a22267c5f5937e9b70beff19ddb3d19b672d |     
  riscv32    | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/d0455bd72accea4bb1ec36b96008ed5c7965631f |     
  mips64el   |        alsa-lib-1.2.7.2        | NOK | http://autobuild.buildroot.net/results/a03c7c4cf7b92c5a836be9c6e1e9c99bd7951657 |     
  mips64el   |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/6f42eeabc6c78a6ff5e02466f0c105512b19354c |     
    arm      |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/212049ce3068eec03c1552e0475df91769b07a2e |     
  mips64el   |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/710fb00e0067a03a9406a9fbab0ab0c10c7b8cce |     
 microblaze  |       batman-adv-2021.4        | NOK | http://autobuild.buildroot.net/results/d0a7fa247b1b5d8d615143808b06b97af5ec88aa |     
    or1k     |       batman-adv-2021.4        | NOK | http://autobuild.buildroot.net/results/945ef6fe73e29d12412d7c7536d3d77f60f9883f |     
   sparc     |       batman-adv-2021.4        | NOK | http://autobuild.buildroot.net/results/538e1f2ffff989105ef404994e13cc71b0a1e81a |     
   arceb     |          boost-1.80.0          | NOK | http://autobuild.buildroot.net/results/6d05efc42e9be3afecc20325b4858055a732fde6 |     
   mipsel    |          botan-2.19.2          | NOK | http://autobuild.buildroot.net/results/cdc7ff2a17f2e9b0daaf2081c46746d8b5110c64 | ORPH
    mips     |          botan-2.19.2          | NOK | http://autobuild.buildroot.net/results/e02648e66e5ef1a82e781997d60bc24bc0b069e5 | ORPH
 powerpc64   |             brltty             | TIM | http://autobuild.buildroot.net/results/e50235040f5b62a79588229a64c0d789411f0c8b |     
powerpc64le  |             brltty             | TIM | http://autobuild.buildroot.net/results/d001edfc3f70d1efd506bba91c304b3f77a5dd62 |     
 powerpc64   |             brltty             | TIM | http://autobuild.buildroot.net/results/2e9850c766ec06d26607e9bf30b8abd5f7523160 |     
powerpc64le  |             brltty             | TIM | http://autobuild.buildroot.net/results/ee325a61a0dd0b6564a219093c0c4f1f7345ec38 |     
   nios2     |             brltty             | TIM | http://autobuild.buildroot.net/results/81ee6368e90e86f16d2c2db34a82ea60566c5e72 |     
   mipsel    |             brltty             | TIM | http://autobuild.buildroot.net/results/2d06828b3df51b4e18d7a422174f4ffd4c8f0c0c |     
  powerpc    |             brltty             | TIM | http://autobuild.buildroot.net/results/4a52b2eaf2354feee49604b42d9440c67757e20e |     
  sparc64    |       btrfs-progs-5.16.2       | NOK | http://autobuild.buildroot.net/results/5db6f81c741a1fb8a1b2f8651beeea28aded17a0 | ORPH
    i686     |       btrfs-progs-5.16.2       | NOK | http://autobuild.buildroot.net/results/e49c8795cb956f32705fbc6535b4d4c107621104 | ORPH
  aarch64    |       btrfs-progs-5.16.2       | NOK | http://autobuild.buildroot.net/results/5ea16778b993f85450d8cf06da249d7930bb831e | ORPH
    i686     |       btrfs-progs-5.16.2       | NOK | http://autobuild.buildroot.net/results/5c7ea6f7d1790a7140b59ef75c20a6c5a66687b9 | ORPH
  riscv32    |       btrfs-progs-5.16.2       | NOK | http://autobuild.buildroot.net/results/89dacc23bf62f569b24fbc95b0104bb5039d205a | ORPH
   s390x     |       btrfs-progs-5.16.2       | NOK | http://autobuild.buildroot.net/results/ad27ea177ac34a95916671eede6227aba5137efd | ORPH
 powerpc64   |          bullet-3.21           | NOK | http://autobuild.buildroot.net/results/b3a6fbb6be6ccdbb2e3847608c7317f581be1069 |     
  sparc64    | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/bb2f0a10eeffc99900bfbaaa6cedd8eccea57b62 |     
  mips64el   | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/f96b8e3472c40da3ef09b064372370f6fa91b92e |     
   sh4aeb    |          check-0.15.2          | NOK | http://autobuild.buildroot.net/results/18bba18baac8621e1d1463b13755aa3fe21b2257 | ORPH
    or1k     |        collectd-5.12.0         | NOK | http://autobuild.buildroot.net/results/fbfa60672ff03fed148956d52a985aa4b12c9454 |     
   x86_64    |        containerd-1.6.8        | NOK | http://autobuild.buildroot.net/results/a76c7280798855f638336524bd5bc392659b4ba7 |     
  mips64el   |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/85d93ed6fcc3dfabded76c8d3740a058d4350d2b |     
    arm      |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/6ef0e324ac7afda61fc43ac355841c210c4f41a7 |     
   s390x     |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/4bbc5ab949fd4a69b90086e07c1029d4c82cda07 |     
   mipsel    |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/4cc41728b3d640d6f122984708622d6dcf790fbd |     
    sh4a     |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/2a6eb0bbe94332ec8d1b91fb68c3928057b3c308 |     
  aarch64    |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/f661f320fbf812503747257b88fa051410087abf |     
    arm      |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/70604ba9bc2dc5905860cfa8b63a4538051ca44d |     
   arceb     |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/c5fd5b2f7198d041d4baf1957fda19988e864f92 |     
   x86_64    |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/69fa7b34c1f2e2f5fea3c93c1703c8331b4c67fa |     
    arm      |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/c0babc4832984b554ae98037cd19bbd49122f0d0 |     
  sparc64    |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/7331d71e2a23b1dad10e4cf2966608383dc39b9d |     
 aarch64_be  |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/dbe0ac17f2186f47b854e90c92eb13f1131c2bb5 |     
 microblaze  |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/5188fbbdab2a14de3b8e11e43c7a2e8ebaad85b7 |     
   mipsel    | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/c3508cdf7df2845d4bad866b7d1c06c8dd855d0c |     
   arceb     | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/f92e16818e1d01f0479df8a96962a357f3ef9425 |     
   armeb     | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/8f4c913a3ab059c541d7976a211cf86cb4601c23 |     
  sparc64    | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/5eb06f2930c5350a8c17605a16c8a57efee50c24 |     
powerpc64le  | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/ab5a35c211a91b23cbd56df110c52227a84b5987 |     
 microblaze  |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/8e7db6d74424845ba9d41b95b1d6c1952ce062a6 | ORPH
  riscv64    | dawgdic-16ac537ba9883ff01b6... | NOK | http://autobuild.buildroot.net/results/1ee035de3d3218f521c2fe11bf797317e87fb738 |     
microblazeel |        dieharder-3.31.1        | NOK | http://autobuild.buildroot.net/results/28ec2bf5be1623bdc7805a6e35e4f7062671f34f |     
  aarch64    |           efivar-38            | NOK | http://autobuild.buildroot.net/results/d428b124ec2701802ac2f56ab35d9cfd12e16d2d |     
    i686     |           efivar-38            | NOK | http://autobuild.buildroot.net/results/dfd02f6a97777872d10dfe7cb983b9e1f9edd8d2 |     
  aarch64    |           efivar-38            | NOK | http://autobuild.buildroot.net/results/4fa13dd076001eddd163436642d1ff487c91d4a8 |     
   arceb     |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/8b25874278e4d7073085d6a41a95a02301603741 | ORPH
  sparc64    |        erlang-22.3.4.22        | NOK | http://autobuild.buildroot.net/results/c6d9a89e5f550310c672a621ca8e8d63575dda87 |     
    mips     |         fdk-aac-2.0.2          | NOK | http://autobuild.buildroot.net/results/1ca8e68b27bc58dca94b7a7af02a306497be7a02 |     
    mips     |           file-5.41            | NOK | http://autobuild.buildroot.net/results/461b1b46310e2df7e2d153e8116ead4793f68088 | ORPH
  aarch64    |         flannel-0.14.0         | NOK | http://autobuild.buildroot.net/results/f3e40ca88f7c314822e26dce95e3ce8b68a624e5 |     
  riscv64    |    freeradius-client-1.1.7     | NOK | http://autobuild.buildroot.net/results/0bc09dc6406fa152955ba7f8d62218e758b4d2ad |     
    mips     | fs/cpio/cpio.mk:117: /tmp/i... | NOK | http://autobuild.buildroot.net/results/18f707a01908a77d9e4c6edf581e8768be466c19 |     
  riscv32    | fs/cpio/cpio.mk:117: /tmp/i... | NOK | http://autobuild.buildroot.net/results/5a61d06fb52ed6225e9d62c6a20e573fc374fb3f |     
 powerpc64   | fs/cpio/cpio.mk:117: /tmp/i... | NOK | http://autobuild.buildroot.net/results/2ce976eb4ad7bc1ef1c34d66617ef4d99583c48c |     
   arceb     | fs/cpio/cpio.mk:117: /tmp/i... | NOK | http://autobuild.buildroot.net/results/0405d9b4c423e83c4d053e9650e897b2eaddcf35 |     
   mipsel    | fs/cramfs/cramfs.mk:46: /ho... | NOK | http://autobuild.buildroot.net/results/7dfc85f8bd9cfc9a3617b5b2956c5861e05dc40e |     
powerpc64le  | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/4065137cc3c7226ad2b255c661ef15ff4f458396 |     
   sparc     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/2cef12f539d923c66eb861dd4d642800efd025be |     
powerpc64le  | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/bef57d887c148841a437e2c07db4bc8f40ea6248 |     
powerpc64le  |          gensio-2.5.5          | NOK | http://autobuild.buildroot.net/results/dbf46cefcf8cb2d9aed032044b716b0d276a0347 |     
  aarch64    |          gensio-2.5.5          | NOK | http://autobuild.buildroot.net/results/085a0788854305d6c5124012b95ea6eedcb00686 |     
   sh4eb     |          gensio-2.5.5          | NOK | http://autobuild.buildroot.net/results/28b4ac92ee13fdf2c96f6b3fd093fc72286f83db |     
    mips     |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/fc0b43dc5da16e0ae9bfd8189fe28e8ed5466f6d |     
    i686     |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/84b92eedd79d07e70b4b54248d2e6a775a57c308 |     
    or1k     |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/88b00fa24365eeabdfe4e15e1a705c082aff134d |     
    sh4      |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/c1beb326b8e26343e6a7949bc3e61faaa4d3a854 |     
   xtensa    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/cbcfe1ac85b2a761489c8b2d4cf434a5b6fc96b8 |     
   nios2     |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/b9ec03ccdf32f150e68914dfa0ffbbb06b33a795 |     
   nios2     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/076e25d8e5e8bd902511b1bc0c492fb6c9405696 |     
   mipsel    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/f8148a7cbcc61d6bbf5d35cd713444222d1c9fe5 |     
   nios2     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/546b8bf086fefc0b195817cadd725769e5237ce7 |     
 microblaze  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/2156387319e067925518c0d4155466d03a1be55b |     
   arceb     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/7d23e0fca8c0bb8dcd4c5e6da2b18e8943fa73df |     
  powerpc    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/4be90eb9e22a92f14ecc56cf3cbc084fbe68767d |     
  mips64el   |         gnu-efi-3.0.15         | NOK | http://autobuild.buildroot.net/results/108130430ba379d0c791a7637b07439859e528a1 |     
   s390x     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/111ea2e51b060a816343d663b8bc0ac52f0c4efa | ORPH
   arceb     |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/f3da7d48240b46592c1e833b46b95ca5bd29072b |     
    m68k     |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/0ff0183f99f3cb0077254611e8fe8c9dcdcc4239 |     
  riscv64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/db0c1a961721b08b933e451fbd1e815f2a6ecc79 |     
    sh4      |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/9987bb20ef729f1961359fd814c5fe8cfa20e87f |     
 powerpc64   |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/82c19e57717fd592fc5b8ac28c5ea54c90142034 |     
   xtensa    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/fc3003f4d041d991df62f982012af8e5d6806f8b |     
 aarch64_be  |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/d7071b7bb51f837058e2f270a70ef775fabf3567 |     
    i686     |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/b4868b17c10ac7414b4f19223d1abc08345b4f11 |     
   mips64    |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/a9c365182b262a4c304499d8162c17b0e6246d4f |     
 microblaze  |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/48a27896f7a6682fdc973b041b8f455fa0c9122d |     
   s390x     |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/8ce8fb5950b50ca53a3e89baa4423d8131c534a2 |     
   xtensa    |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/c0b38d2a099b52b90ea074ddf800f63dd6e57e8e |     
 powerpc64   |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/7898672ee5e1e08c783716df8864ad27be47865c |     
   x86_64    |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/7e6b02a11fde037a47eaf1483c0bb723bd210afa |     
    mips     |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/63d55a79e9fa5887ab2cf21bae9442f669b2b980 |     
    or1k     |     host-f2fs-tools-1.15.0     | NOK | http://autobuild.buildroot.net/results/abbd49f42afb6ff3d7ec8cc4493ec07e6e6a70a8 |     
   s390x     |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/77e5da7f47199d04aafb32b16321e1d07c57faae |     
powerpc64le  |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/1ee0499a2f66b4a7ab32fd06d7bbbe751e57cba0 |     
   mips64    |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/bbb3d3c27c4cc8c2df8e12b7674432977be75d00 |     
    i586     |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/ff6a0da387e33ba384fe7b4e8d32cece2c7f64e4 |     
  mips64el   |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/1468570ca5158d9d52ed6657b351564d448099bb |     
   mips64    |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/6b3a182b3ef26a9926c0b538fdb20431a9282a3a |     
   nios2     | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/0916fa0b6ff6710b1c2831847564bd41c039c9c8 |     
   mipsel    | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/920ba99a550cd2a263dddb8247a5c3a045ac3608 |     
  mips64el   | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/e4d9caf8405ecd7b55233a6c49d9b5940b115330 |     
  aarch64    | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/84da2747f1eda7c6803eaccdef7ac2b28c32b1db |     
   x86_64    |        host-runc-1.1.4         | NOK | http://autobuild.buildroot.net/results/462b9427a1d2702d5e4a67bb5cc2d4355eaf92dc |     
    mips     |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/72f067fd226d70a448f2542358fb27f7a2aad111 |     
powerpc64le  |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/ffc24194cc11985edeff1d9af8c546910c118343 |     
  sparc64    |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/150cb36e233739fecfce8c49bae3fe61e2b551e5 |     
  sparc64    |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/847205190d689fd10ff4813365ffadc24c2176d7 |     
    or1k     |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/d8a7d731607651db06846cee614fc35a8595a5f3 |     
   mips64    |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/8ace710890307da277c62185a588a698ab3719d7 |     
powerpc64le  |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/08ab9a4737faedc824fb4b11af4e98c8e109a9ca |     
   xtensa    |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/bd1272cf5f1a7a43df6ba579c635f40d30548b2d |     
    arm      |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/17cf8726e2bd785f133c05a567db42dbff33037e |     
   s390x     |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/55eadd1d3ff53f0618b623df70645942b1c899ad |     
   xtensa    |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/8f6153271027aae6786ef9c1e1314777566e2def |     
  powerpc    |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/110fa547341d074c5b218d25a5de47a1312d00f5 |     
  mips64el   |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/ed36c83e9a3c281c7982078d6ec2b4693d27bf01 |     
   sparc     |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/d58719f648a6468ff55a8422e482d1df965abb1f |     
    arm      | host-spirv-llvm-translator-... | NOK | http://autobuild.buildroot.net/results/092df43a8a280988e6608b7ac74b33b40f100dac | ORPH
    sh4      |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/9cdb0761d3ef3d7d2301a2a0210a599cb2e13cf1 |     
 microblaze  |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/c3c592fd6439fb099ad34c824c9e206a233cfa4f |     
 microblaze  |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/961e26d839d0ec77ceb123e2c03103ffa34f634b |     
    arm      |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/4b8674d9c8f64dfe89aa64cbc9ae614eaff0e81e |     
powerpc64le  |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/00063882e86f5e16d8914750491760c2c8b53c7f |     
   mips64    |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/9d828251e5c7e7136da08be9f498f75b8255cca4 |     
  sparc64    |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/c3ee5a906e4c9ef2f808386f53565031d359845b |     
powerpc64le  |       igh-ethercat-1.5.2       | NOK | http://autobuild.buildroot.net/results/0010268524cf25a4b38dff1cc6154872cd0c8482 |     
    arc      |        libarchive-3.6.1        | NOK | http://autobuild.buildroot.net/results/23d50b241271c8a8fdd9671705064267ab0ca9ed |     
   mips64    |        libarchive-3.6.1        | NOK | http://autobuild.buildroot.net/results/d73477b293a6b789b29cd3d1a7b43517b898cda0 |     
    or1k     |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/b4ce34cc926f509cce2dbd5b8bd27679f188e93d |     
   sh4eb     |     libcpprestsdk-2.10.18      | NOK | http://autobuild.buildroot.net/results/c1c262c1387a0088c919280c30767a7c6412fcc0 | ORPH
  riscv64    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/757da8be50d8d6fc29106b5831356d131fff5f4f |     
   armeb     |        libdcadec-0.2.0         | NOK | http://autobuild.buildroot.net/results/973d55b9070895d94e76ae4988cc137396c31725 |     
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/dfceabb8b52649122759a85bce1031f304315e62 | ORPH
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/2c9d1d8b7663ae9e9590646165af4885d3f42f63 |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/5aae5fa14ba55ac096d9dbf1ae551afee75db2ab |     
   x86_64    |         libglvnd-1.4.0         | NOK | http://autobuild.buildroot.net/results/3381151b3efd2d2498a38d2579b017238bc5b744 | ORPH
  aarch64    |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/23d5016df79d770a5414125d31bed20030f53153 | ORPH
  aarch64    |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/c5fcf97392e30c2ab4ee180e80404ced531bf399 | ORPH
 aarch64_be  |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/4b9f5cac4349067523dc973b767e2cc3c9809a2e | ORPH
 microblaze  |        libmdbx-0.11.12         | NOK | http://autobuild.buildroot.net/results/35468575bf2865dbfdd648694ad62a20ab52d83a |     
   s390x     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/90071f7f6ef2705589c62f77cf01ddb4d08b2e88 |     
    mips     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/43c7a58b787e947c2ef7393b04401585aff093c4 |     
  aarch64    |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/46737758f7644eea3cbd061209f203399bc966fe |     
   sparc     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/2d2e70b307d1b80288f203fac03c3976032b3987 |     
   s390x     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/da6273feaeec84112a9c2d4ae0da6278ec92ff6d |     
   s390x     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/ba33fed7b78aae49fd9124282b4f626f6a830b7d |     
    or1k     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/8ce4f88059132bca1129b2aa0cc0ac0bad37ea67 |     
    m68k     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/f1e311f60c1ed03397b5d3bfb8d98f50e90c760c |     
 powerpc64   |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/e882ea33d1e7fcb61c1a15f9de331e4ba26f7a7e |     
  powerpc    |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/0b00c5d2a62038f7d728c6b9fe694241c1b7fd0b |     
   mipsel    |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/11f0237bb3f31cd8804cb4a855b1665046671e1f |     
    i686     |         libsigc-3.2.0          | NOK | http://autobuild.buildroot.net/results/3342af733950b9e83c8e241b35ba8e575f338a3d | ORPH
  powerpc    |        libvorbis-1.3.7         | NOK | http://autobuild.buildroot.net/results/942532328dfe37ddba1f364230672510e9f7c28f |     
powerpc64le  |    linux-5.10.145-cip17-rt7    | NOK | http://autobuild.buildroot.net/results/539d82daae77e097bf914d33c93c899c6ad23515 | ORPH
   mipsel    |    linux-5.10.145-cip17-rt7    | NOK | http://autobuild.buildroot.net/results/032ecc729f64f74fe656e21523391507fc3834c5 | ORPH
 microblaze  |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/483dd42f320933eb2a5202984d19a522f8c6343a | ORPH
    mips     |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/9239a88f12bf9ec240ca6f34c8e5243f87681be1 | ORPH
   sh4eb     |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/394c3b5a11cd6315ef5f58c11b88dce49ff296c8 | ORPH
    arm      |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/b9da14feb9cb59e1f357b4a86d52f1ef51c26131 | ORPH
    arc      |     lttng-babeltrace-1.5.7     | NOK | http://autobuild.buildroot.net/results/aa717921f3b93ae9d0880497153546729d0e999c |     
  powerpc    |       lttng-tools-2.13.2       | NOK | http://autobuild.buildroot.net/results/b80e41376f9ad40c1e6fc088980097298de633ea |     
 aarch64_be  |          luvi-2.13.0           | NOK | http://autobuild.buildroot.net/results/4ee8bb7b8d69e1b102fe3ed89cc813585d5ea9c5 | ORPH
    or1k     |           lxc-4.0.12           | NOK | http://autobuild.buildroot.net/results/56bf348b16e2de0c0f905ba506efc8d90e37a6a2 |     
   nios2     |           lxc-4.0.12           | NOK | http://autobuild.buildroot.net/results/805543ae55950de68b734004d6dddc36a6a7660f |     
  sparc64    |           lxc-4.0.12           | NOK | http://autobuild.buildroot.net/results/155f0810c9cd8acbfc76a14976b962c1ed296646 |     
  mips64el   |       makedumpfile-1.7.0       | NOK | http://autobuild.buildroot.net/results/7de26c873b325b4b0b25e70ac7d42f5e9c914b5d |     
   sparc     |        mariadb-10.3.36         | NOK | http://autobuild.buildroot.net/results/50750370b59d3fcde621688babf467d7e73c9900 | ORPH
   nios2     |          matio-1.5.22          | NOK | http://autobuild.buildroot.net/results/21bd18ce879d8bcc75345b78ce13a29d2185d9c3 |     
   s390x     |          mender-3.4.0          | NOK | http://autobuild.buildroot.net/results/c6e70bd975f56d225a1e7774923395d9c4bca6b1 |     
  aarch64    |           ne10-1.2.1           | NOK | http://autobuild.buildroot.net/results/a339b4a3927379b2e30d1e83f481b7cc8c5ce7d5 |     
   mipsel    |         nodejs-16.17.1         | NOK | http://autobuild.buildroot.net/results/79a507e35e1f4eb0f563772171dfab4ca1c1878c |     
  riscv64    |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/1c61d4b0fd6ebb4a92c30c8e2ea216dbe0353786 | ORPH
  riscv64    |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/00a76566a0de7622bd8005d69d6f83d44c3e5301 | ORPH
microblazeel |          ntpsec-1_2_1          | NOK | http://autobuild.buildroot.net/results/42fd7fa4e1d0e2736f1cb9f1ada3cd33e99a802f | ORPH
 powerpc64   |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/7406486c275c8766ed2a2bb0278fd0d290f4c8ff | ORPH
    mips     |         openal-1.22.0          | NOK | http://autobuild.buildroot.net/results/e8ae47ac732936d4411ff2e669fccbb9ac2b5a1a |     
    i686     |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/20a5a3e9149990b1088162b76bbee0e80a915c7b |     
   sparc     |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/192fef81677d37c9c05232bccd3a9d50baabe365 |     
 aarch64_be  |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/439d82e92fe4d5268c3f902a659eddcf0ddd106f |     
    m68k     |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/363db5621fe14acb4c23a77bcffd6c19f72c98ae |     
    sh4      |           php-8.1.11           | NOK | http://autobuild.buildroot.net/results/97910f245c6d59f6b5f53471486b64fccd583292 |     
   armeb     |           pixz-1.0.7           | NOK | http://autobuild.buildroot.net/results/080174fe65f5e109ba8b331cea972f19ccfe5e05 |     
   xtensa    |        poppler-21.12.0         | NOK | http://autobuild.buildroot.net/results/d8dc2113bb676791f224cd36852318e31ca1c1f8 |     
   nios2     |        procps-ng-3.3.17        | NOK | http://autobuild.buildroot.net/results/25a1a88b3e6b3000e995778d0a34b0836d3403eb | ORPH
powerpc64le  |        procps-ng-3.3.17        | NOK | http://autobuild.buildroot.net/results/8871c6a4acba52961d73abaea5aee1ae6896ed30 | ORPH
   s390x     |        procps-ng-3.3.17        | NOK | http://autobuild.buildroot.net/results/615f896569fef6171b78a0882f75d63ef0332f3a | ORPH
   armeb     |           pv-1.6.20            | NOK | http://autobuild.buildroot.net/results/fa1c2a2f2345129a6cc53096baa259b59a04c57c | ORPH
 powerpc64   | rtl8821au-4235b0ec7d7220a63... | NOK | http://autobuild.buildroot.net/results/287f2fad8355577f03aea259b62cb0bcaee88219 |     
   sh4eb     |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/3df1e7312f144be1092bbd132d58c01f3183d0a3 | ORPH
   sh4eb     |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/6d03a37f3f73b9174d80a2c545ba72ec07c762e6 | ORPH
   nios2     |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/30005ff176ddbac7280cbe0eadff394151a4f56f |     
   s390x     |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/c0c5be5dc7b108dadbcda38b699837436a01d9e9 |     
   mips64    |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/44c012032a7bb959520c3f23a668997c1a833a89 |     
   x86_64    |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/62ed0c2a3349bc14e89b851fe9d2f9f39593c443 |     
    sh4      |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/5477bd1d37f0bff7bb35a8d703a49ffea32324ef |     
    sh4a     |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/836bdd1c81b8b2c4b9e317e3eb000f39a45f1bf3 |     
   nios2     |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/268bf7906a29604b131f858ee6100912c0343332 |     
   nios2     |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/e5aa762ed3a412e88a20d8cb0bf2ae3c72d7bd5d |     
   x86_64    |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/d25a439bdd692844c2862c82055ac0c97e98917c |     
   mipsel    |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/0b57597bebf43d98b3c5ee39a68ee7162c53ad7f | ORPH
   mipsel    |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/5246d96fdfc7b83868ee78643b9912d3f695f9be | ORPH
  sparc64    |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/a4a0967124d2fd98669beb2cf3fc5560cca3a618 | ORPH
  riscv64    |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/62c8561d33394c26a0693e93f391625cdcc291f5 | ORPH
 aarch64_be  |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/cc62d6d858164f73e1952be8bff8ef5ca2c12d3e | ORPH
  aarch64    |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/630dd0d55369995102052284f934522a96bfb5bb | ORPH
  sparc64    |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/a08164170a36a54a046df181f1680769695a42de | ORPH
   armeb     |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/262f87c077c0cd5183d5e47c876a07cb9d813aaf | ORPH
   nios2     |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/bc8fedcf14afadd5eaccf53e19b0f4220c53ca7e | ORPH
  powerpc    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/a6996bb8eb6a732fcfcb6480a32766df42c56bd6 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/f9abb09630b4357bbace52cade30d10b99fb16e2 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/37f63fe3c40357b63222e1e12867434b7f94e4d1 |     
   s390x     |            unknown             | NOK | http://autobuild.buildroot.net/results/42a43ccd387d4c49b97dff58969e28468d128704 |     
  sparc64    |            unknown             | NOK | http://autobuild.buildroot.net/results/812dbd853e5b6716c2ed5fb7dfa22b0e61e21de4 |     
    mips     | uqmi-0a19b5b77140465c29e2af... | NOK | http://autobuild.buildroot.net/results/2d6537663dc9fd86db9db917728da0a0d646a916 | ORPH
   mipsel    |        valgrind-3.19.0         | NOK | http://autobuild.buildroot.net/results/35b8f43552d6fed770f1f0b2c54103b65d0edb9b | ORPH
    i586     |          vlc-3.0.17.4          | NOK | http://autobuild.buildroot.net/results/d8e923c973ad94d43de4d0370ff608e07272d587 |     
    mips     |           volk-2.5.2           | NOK | http://autobuild.buildroot.net/results/3930efffb2686381f372a824f894530112410547 |     
  powerpc    |           volk-2.5.2           | NOK | http://autobuild.buildroot.net/results/02353aaa647812041240cbf651a840ca65b4f908 |     
   mips64    |         wolfssl-5.5.1          | NOK | http://autobuild.buildroot.net/results/9e48dcfd9a3c6d418901afbfb35a08cd5f33aee5 |     
   mipsel    |         wolfssl-5.5.1          | NOK | http://autobuild.buildroot.net/results/655fc4da4aa5538e98e1dc45c58074a7ddc65f5f |     
    arm      |         wolfssl-5.5.1          | NOK | http://autobuild.buildroot.net/results/3a0cd1fdcf9b47ee6d66cfa39edc1bd0953e0d71 |     
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/c3748f575d7c9c972d95067cb21e2c931760a3a8 | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/50c5f4582252ea2c40142fb14c7288f58680e807 | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/2c6ad6acbf9382d7df8a8114f4d067cb12670d7e | ORPH


Classification of failures by reason for 2022.02.x
--------------------------------------------------

            igd2-for-linux-2.1 | 1 
      qt5webkit-5.212.0-alpha4 | 1 
                    vlc-3.0.16 | 1 


Detail of failures for 2022.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/d2a0585030277a51bee5cda39b5cee01b3323a49 |     
   mipsel    |    qt5webkit-5.212.0-alpha4    | NOK | http://autobuild.buildroot.net/results/49c9f8e4d234ebb615f796e1ce50a76b82be399a |     
   x86_64    |           vlc-3.0.16           | NOK | http://autobuild.buildroot.net/results/3838dc3444188c44904528992a4b41ee8e2ace88 |     


Classification of failures by reason for 2022.08.x
--------------------------------------------------

host-spirv-llvm-translator-... | 3 
            openssh-legal-info | 2 
                       unknown | 2 
               acpica-20200717 | 1 
                gnu-efi-3.0.14 | 1 
              host-rust-1.62.0 | 1 
            igd2-for-linux-2.1 | 1 
            igh-ethercat-1.5.2 | 1 
              libgcrypt-1.10.1 | 1 
                mongodb-4.2.18 | 1 
                   perl-5.34.1 | 1 
                 systemd-250.4 | 1 


Detail of failures for 2022.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |        acpica-20200717         | NOK | http://autobuild.buildroot.net/results/92cb8ec6fbd9e485f88dfaefda531712310189a8 |     
  mips64el   |         gnu-efi-3.0.14         | NOK | http://autobuild.buildroot.net/results/ecdb5299588ae1de2d6a184e6b7b6d3df9249db7 |     
    i686     |        host-rust-1.62.0        | NOK | http://autobuild.buildroot.net/results/e5d45c8a2192e380805e8f64852bcf6a08bc6a99 |     
   armeb     | host-spirv-llvm-translator-... | NOK | http://autobuild.buildroot.net/results/fe5e15282913d1898ed7795d2ac6c2b868b11852 | ORPH
   x86_64    | host-spirv-llvm-translator-... | NOK | http://autobuild.buildroot.net/results/f4c01905adcc3c40b9c3fefa1b570246b251e94c | ORPH
    i686     | host-spirv-llvm-translator-... | NOK | http://autobuild.buildroot.net/results/b8633932159364822904ec10a189127e6f98a7e4 | ORPH
 aarch64_be  |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/245b3bcd99d09f7b1eb0d60520922345220b73af |     
  riscv32    |       igh-ethercat-1.5.2       | NOK | http://autobuild.buildroot.net/results/0f73a76df0aa6e39786527b7f854fd434f918b8b |     
    i586     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/e459a4745d2128142f42e20817e388a01f941e67 | ORPH
  aarch64    |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/3dfc010b35a0e0d06a18af1b1d4354c1d5fb0c0d |     
    or1k     |       openssh-legal-info       | NOK | http://autobuild.buildroot.net/results/ea03740ba6f639b64c71ae5899342f92afb34b39 | ORPH
   sparc     |       openssh-legal-info       | NOK | http://autobuild.buildroot.net/results/651ba52c5bc7ea5380147113de6e5c4e9407c911 | ORPH
    arm      |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/ebf0e0fd9d7712e47515ee676d109b9bfd98aeb6 |     
    arm      |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/34235256236802d76b827baf26b679b07f3a4a25 |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/cd91107c69194a5219abf0168d4a8d535877b08a |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/ca6dca94384cb2299fb12035b2a44b2ffcd7a62a |     



-- 
http://autobuild.buildroot.net

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

