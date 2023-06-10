Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88472C7EE2E
	for <buildroot@archiver.kernel.org>; Sat, 10 Jun 2023 04:39:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C68D84191F;
	Sat, 10 Jun 2023 04:39:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C68D84191F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AhPVwvGHSeCs; Sat, 10 Jun 2023 04:39:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 29E4D41BA8;
	Sat, 10 Jun 2023 04:39:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 29E4D41BA8
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1924D1BF2B3
 for <buildroot@lists.busybox.net>; Sat, 10 Jun 2023 04:39:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E686B40382
 for <buildroot@lists.busybox.net>; Sat, 10 Jun 2023 04:39:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E686B40382
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aqDT-xOG7oeG for <buildroot@lists.busybox.net>;
 Sat, 10 Jun 2023 04:39:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A61D0400DD
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A61D0400DD
 for <buildroot@buildroot.org>; Sat, 10 Jun 2023 04:39:43 +0000 (UTC)
X-GND-Sasl: thomas.petazzoni@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id AB50F1C0007
 for <buildroot@buildroot.org>; Sat, 10 Jun 2023 04:39:40 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sat, 10 Jun 2023 04:39:40 -0000
Message-Id: <20230610043947.E686B40382@smtp2.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1686371980; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=gRyE1Y4gEYNixqTNAmg7oUG2n4eABJ/vrR8+mz5Cf8U=;
 b=dnxthrtt+fMzZnzyDIt+UiWNh5tpt1rXBU2PtTYWm3zC6pVA+ZA9TflCn1F+vOUEl4l8Va
 kyjL1mbEkskDuaS5puFaLNb1svLZ+yo7iy7U5v5LzXRgw52HIldje3fEgrb7zS2CJGlTPH
 UMKIvb9bHYJT9iqn0JN0EeTiK+3ktViOlGRMcZ3Uaxz8rRBlO4TMY19r+LZQ0j8joB2O1D
 Sf6FCwq+atVHkgKaM6BUeg4Rz+CxYIrziiDSVWZH1j1CYIw/b4XkmVLBsbiHQIyipNaMVa
 8C/JgbRxlT8ueJMm9M42r5YP13qK7k+wmX5g4z8TWMg5b9Kyc1sYh0s0SDjNQw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=dnxthrtt
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-06-09
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

Autobuild statistics for 2023-06-09
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  |  5  |  3  |  0  |  8  |
    master   | 73  | 47  |  1  | 121 |

Classification of failures by reason for master
-----------------------------------------------

  gobject-introspection-1.74.0 | 4 
                elfutils-0.186 | 3 
                       unknown | 3 
                 agentpp-4.6.0 | 2 
            host-binutils-2.38 | 2 
               libglib2-2.76.1 | 2 
                   linux-6.3.6 | 2 
                     php-8.2.6 | 2 
                     audit-3.1 | 1 
             batman-adv-2022.3 | 1 
                  cmocka-1.1.5 | 1 
                 coreutils-9.3 | 1 
          cryptodev-linux-1.12 | 1 
              dropbear-2022.83 | 1 
fs/ubi/ubi.mk:51: /home/bui... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
glibc-2.37-2-g9f8513dc64119... | 1 
         gobject-introspection | 1 
google-breakpad-c85eb4a59b6... | 1 
            host-binutils-2.37 | 1 
host-gdb-arc-2020.09-releas... | 1 
              host-rust-1.68.2 | 1 
              libgcrypt-1.10.1 | 1 
               libsigsegv-2.14 | 1 
     linux-5.10.162-cip24-rt10 | 1 
             netsniff-ng-0.6.8 | 1 
               openblas-0.3.23 | 1 
                 opensc-0.22.0 | 1 
                   perl-5.36.1 | 1 
                    ruby-3.1.3 | 1 
                    sdl-1.2.15 | 1 
                   trinity-1.9 | 1 
                 uclibc-1.0.43 | 1 
                 zlib-ng-2.0.6 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    mips     |         agentpp-4.6.0          | NOK | http://autobuild.buildroot.net/results/e4774e09d1d50474ef6da6c179d100f71adbba42 |     
   arceb     |         agentpp-4.6.0          | NOK | http://autobuild.buildroot.net/results/bd51fc995bfa810fc8d68275af8b80a766a37a4e |     
   x86_64    |           audit-3.1            | NOK | http://autobuild.buildroot.net/results/7cf5140a5f4df6d721b14eecaf8cc8b11e452dc1 |     
   sparc     |       batman-adv-2022.3        | NOK | http://autobuild.buildroot.net/results/cb4ca51871910dc1c57129b9bc92215ed67845f7 |     
   armeb     |          cmocka-1.1.5          | NOK | http://autobuild.buildroot.net/results/b30fa4c4423115f8f1e203782280f84703c9be44 |     
    sh4      |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/531566cdb9ed7883bf1bffc76e493c7481c1f57a | ORPH
    i686     |      cryptodev-linux-1.12      | NOK | http://autobuild.buildroot.net/results/f55f7001f39b8aba1ea67ed0c1f71bb8a3669afd | ORPH
  riscv64    |        dropbear-2022.83        | NOK | http://autobuild.buildroot.net/results/977e58532806d4e4b18dc3188862ced0a6c94f19 |     
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/9106ab5c8db690dcef7a37c5a53c5434329748e8 | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/0ebbd57dc955d4c0d864b67f6c10975cf0fc571c | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/7ba91f1398bff196a8ddb6d1a1087ac5d4c6906d | ORPH
   s390x     | fs/ubi/ubi.mk:51: /home/bui... | NOK | http://autobuild.buildroot.net/results/f81fad5731ec9ad1e677c3345a4b6705d7350f73 |     
   sparc     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/0b6a2b8a5ca04126514925ebe736a5a8985d6f69 |     
   mipsel    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/ca1b654e46aff2403ade5eac8c455e6efe2121e3 |     
microblazeel | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/50ecb973e3684865a56031ca205cddf59141be5a |     
  powerpc    | glibc-2.37-2-g9f8513dc64119... | NOK | http://autobuild.buildroot.net/results/828d4ceee0321f8d020b80333687a48a69f9c71d |     
   armeb     |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/7bf10467bf747e9d728e44c0bb4d09ac4bee78a4 |     
    i586     |  gobject-introspection-1.74.0  | NOK | http://autobuild.buildroot.net/results/d63dd993f00781335bc246fb3088a3ef60e59d3b | ORPH
  powerpc    |  gobject-introspection-1.74.0  | NOK | http://autobuild.buildroot.net/results/c8c55eb5348e63f6935dd8d0072d16de5981225b | ORPH
powerpc64le  |  gobject-introspection-1.74.0  | NOK | http://autobuild.buildroot.net/results/f883e3d329835e5ea2cbe7c2740caa417e263e55 | ORPH
   nios2     |  gobject-introspection-1.74.0  | NOK | http://autobuild.buildroot.net/results/1f9cf508d92a63c74a41402ca5a1e4e66b91534b | ORPH
    mips     | google-breakpad-c85eb4a59b6... | NOK | http://autobuild.buildroot.net/results/b3a5bb8a28978903dc2e2cacba623f1c3782d7e8 |     
   mips64    |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/d321ff8c315ad6c1ba607997a3561594ed862bff |     
  powerpc    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/cc76f84181d5db9ff461b85531f9410aa40d0a3a |     
  aarch64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/58ab688907ada42f833dbb057d5d1a19337e3c49 |     
   arceb     | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/12478f13ac26b767bf8a5664e8300c6e5dc8e9df | ORPH
    mips     |        host-rust-1.68.2        | NOK | http://autobuild.buildroot.net/results/539416972687e8414849c9341a1af72b725555ad |     
    i586     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/064d135f6c5833cf3a4da3486ca44a21538012ef | ORPH
    arc      |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/1a248643b6a69072835f81d92047b600cb91fa62 |     
   sparc     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/3a47cf7c448d471462b4b1eb52eefad0829c9339 |     
  powerpc    |        libsigsegv-2.14         | NOK | http://autobuild.buildroot.net/results/502d05977dce0d7eaa76f4e4299adc3b802d0270 |     
    sh4      |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/7ba3b46726754b41294634d252b188f8b30a20ab | ORPH
 powerpc64   |          linux-6.3.6           | NOK | http://autobuild.buildroot.net/results/26138853fcff3bee3cafb8a668d7c495a7fc572d | ORPH
    i586     |          linux-6.3.6           | NOK | http://autobuild.buildroot.net/results/d79ec94e7aae4bcbe357c81c70aee68488891a28 | ORPH
   x86_64    |       netsniff-ng-0.6.8        | NOK | http://autobuild.buildroot.net/results/b3772b889a03eb3da68fd5ca7507bdd6f8de7158 |     
    i686     |        openblas-0.3.23         | NOK | http://autobuild.buildroot.net/results/62b728f5402893d5e8babc24b5be8709b08e6655 |     
  mips64el   |         opensc-0.22.0          | NOK | http://autobuild.buildroot.net/results/614d28462fffdada11ac23dd657d9153fff0bcee |     
    or1k     |          perl-5.36.1           | NOK | http://autobuild.buildroot.net/results/c166e6760c0c3b3b98ac1ac7b54fabfa636dd77f |     
    sh4      |           php-8.2.6            | NOK | http://autobuild.buildroot.net/results/0e454776446420ecd18842c2de192889090680eb |     
   armeb     |           php-8.2.6            | NOK | http://autobuild.buildroot.net/results/a7d07a2d2e8cb3152b97f1e0287c9e99f027689d |     
    arc      |           ruby-3.1.3           | NOK | http://autobuild.buildroot.net/results/a831a3b90d12c43a78c29a0ddc7db62c525aa1f4 |     
   sh4aeb    |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/a899cb1a019a40bb438d2a4e3b75cc0eea9fd28b | ORPH
   armeb     |          trinity-1.9           | NOK | http://autobuild.buildroot.net/results/cb96e5e7b2a267307cbe9ef42e375cc64d709ead | ORPH
  powerpc    |         uclibc-1.0.43          | NOK | http://autobuild.buildroot.net/results/4fcb3de4e94d9656b44594eb32eb6624b1f0de47 |     
   arceb     |            unknown             | NOK | http://autobuild.buildroot.net/results/0c107b918ca1f744b444275c572db243b5d75082 |     
 powerpc64   |            unknown             | NOK | http://autobuild.buildroot.net/results/233b85aa96b8a8e30a46123ba2e5b8428b55bfd1 |     
    mips     |            unknown             | NOK | http://autobuild.buildroot.net/results/3fae54233e4874381282da72c6314de23e57077f |     
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/2d19dfbe7405025336403a16bff28a5084c3eb02 | ORPH


Classification of failures by reason for 2023.02.x
--------------------------------------------------

               host-qemu-7.2.0 | 2 
                       unknown | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  sparc64    |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/8d9d25916eddc450c39bb845f1dfd8d5fc90bd77 |     
    mips     |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/4445b861b0dd4bf42830e1bba7fa35f37359bbc8 |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/9413442c442e9a3361f715114a59079a3690c2a3 |     


Gitlab CI results for 2023-06-09
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
                   beagleboardx15 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4437447866  |      
                       beaglebone | https://gitlab.com/buildroot.org/buildroot/-/jobs/4437447867  |      
                   beaglebone_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4437447869  |      
                          beaglev | https://gitlab.com/buildroot.org/buildroot/-/jobs/4437447872  |      
           freescale_imx6qsabresd | https://gitlab.com/buildroot.org/buildroot/-/jobs/4437447903  |      
                 grinn_chiliboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/4437447924  |      
                 hifive_unleashed | https://gitlab.com/buildroot.org/buildroot/-/jobs/4437447926  |      
                         mx53loco | https://gitlab.com/buildroot.org/buildroot/-/jobs/4437447980  |      
                      nitrogen6sx | https://gitlab.com/buildroot.org/buildroot/-/jobs/4437447990  |      
                       nitrogen6x | https://gitlab.com/buildroot.org/buildroot/-/jobs/4437447991  |      
                        nitrogen7 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4437447992  |      
                       nitrogen8m | https://gitlab.com/buildroot.org/buildroot/-/jobs/4437447994  |      
                      nitrogen8mm | https://gitlab.com/buildroot.org/buildroot/-/jobs/4437447995  |      
                      nitrogen8mn | https://gitlab.com/buildroot.org/buildroot/-/jobs/4437447997  |      
                      nitrogen8mp | https://gitlab.com/buildroot.org/buildroot/-/jobs/4437447998  |      
                orangepi_one_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/4437448027  |      
                   pc_x86_64_bios | https://gitlab.com/buildroot.org/buildroot/-/jobs/4437448042  |      
                    pc_x86_64_efi | https://gitlab.com/buildroot.org/buildroot/-/jobs/4437448044  |      
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/4437448139  | ORPH 
               snps_arc700_axs101 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4437448174  |      
                socrates_cyclone5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4437448185  |      
                    zynq_microzed | https://gitlab.com/buildroot.org/buildroot/-/jobs/4437448233  |      
                      zynq_qmtech | https://gitlab.com/buildroot.org/buildroot/-/jobs/4437448235  |      
                       zynq_zc706 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4437448237  |      
                         zynq_zed | https://gitlab.com/buildroot.org/buildroot/-/jobs/4437448239  |      
                zynqmp_kria_kv260 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4437448240  |      
                    zynqmp_zcu102 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4437448241  |      
                    zynqmp_zcu106 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4437448242  |      



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
