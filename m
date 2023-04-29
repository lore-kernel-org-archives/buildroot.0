Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0F3EC7618E
	for <buildroot@archiver.kernel.org>; Sat, 29 Apr 2023 05:34:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0681460A7D;
	Sat, 29 Apr 2023 05:34:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0681460A7D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q52zQLOgRjv6; Sat, 29 Apr 2023 05:34:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C2DBC60AF4;
	Sat, 29 Apr 2023 05:34:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C2DBC60AF4
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 38CA71BF4E4
 for <buildroot@lists.busybox.net>; Sat, 29 Apr 2023 05:34:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0FDC34053F
 for <buildroot@lists.busybox.net>; Sat, 29 Apr 2023 05:34:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0FDC34053F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xKyxBk4Fj3uP for <buildroot@lists.busybox.net>;
 Sat, 29 Apr 2023 05:34:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D7A3D40510
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D7A3D40510
 for <buildroot@buildroot.org>; Sat, 29 Apr 2023 05:34:20 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id E8D21100009
 for <buildroot@buildroot.org>; Sat, 29 Apr 2023 05:34:17 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sat, 29 Apr 2023 05:34:17 -0000
Message-Id: <20230429053423.0FDC34053F@smtp2.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1682746458; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=zQpAjlUVIGyAUTL/eyEZ+YYsgyY7+GyhbYoLdvydfyQ=;
 b=RbYyTuhstuEgKukPvLp4BzaGAd1ZLnqJtjn0PaxZCmtzjvrQKFhb5SmB1u3ghOQ0b8ix7O
 6fEpz8lw0GiXO1wsVJzfmJVRchceFq15JA8uBL98XWJvJze3Ggjy/1pGUGN1FNqZw4QcGr
 3/VGAxobFWLZwBmluTSAZIdRug5fjZCHvT1WkKzfMu5SIgVR7T8G0SuADRw68jxFzirNaY
 rdGn/tX2IwVyM6j5Rap6XlENfs6w2ezgYidyO9Fbfmcd/a6sEpDYntbXP7vhL/lpZvWER+
 PCiVlQ9M4YiZg50zz4y3p1niMyA8AZ4ObjvxpJOLksya02D/WF01ENBTyAJyQw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=RbYyTuhs
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-04-28
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

Autobuild statistics for 2023-04-28
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  |  3  |  4  |  0  |  7  |
    master   | 46  | 44  |  0  | 90  |

Classification of failures by reason for master
-----------------------------------------------

               host-qemu-7.2.0 | 8 
host-gdb-arc-2020.09-releas... | 3 
               libglib2-2.76.1 | 3 
fs/ubifs/ubifs.mk:49: /home... | 2 
                   libnss-3.89 | 2 
                 uclibc-1.0.43 | 2 
                    4th-3.64.1 | 1 
                 agentpp-4.6.0 | 1 
         argp-standalone-1.4.1 | 1 
               fftw-quad-3.3.8 | 1 
fs/ubi/ubi.mk:51: /home/aut... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
glibc-2.37-2-g9f8513dc64119... | 1 
                    glog-0.6.0 | 1 
                     gmp-6.2.1 | 1 
            host-binutils-2.38 | 1 
         host-gcc-final-10.4.0 | 1 
host-sunxi-tools-1.4.2-168-... | 1 
                libglvnd-1.4.0 | 1 
                   libnl-3.7.0 | 1 
                libvips-8.10.6 | 1 
     linux-5.10.162-cip24-rt10 | 1 
                  linux-6.1.14 | 1 
                    olsr-0.9.8 | 1 
                   perl-5.36.0 | 1 
                     php-8.2.3 | 1 
              strongswan-5.9.8 | 1 
                       unknown | 1 
               valgrind-3.19.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |           4th-3.64.1           | NOK | http://autobuild.buildroot.net/results/466370a77a1cecaa599849a04b9965dd391e4e28 |     
   x86_64    |         agentpp-4.6.0          | NOK | http://autobuild.buildroot.net/results/8f1a5cef22ef0acf53a227dd5912954aca893392 |     
    arm      |     argp-standalone-1.4.1      | NOK | http://autobuild.buildroot.net/results/f1a3fe50965c7ece0c06191559e34309410d2677 | ORPH
powerpc64le  |        fftw-quad-3.3.8         | NOK | http://autobuild.buildroot.net/results/72a0201b5b8d02baaae104e1c3b28f6b3f4c55d6 | ORPH
    or1k     | fs/ubi/ubi.mk:51: /home/aut... | NOK | http://autobuild.buildroot.net/results/bb5642f9f480f47af794acf59e51c8a78ea4f978 |     
  powerpc    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/283fe1f0a76778172e11ad90409afffc11bb358e |     
   s390x     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/aa1c9fc86b361a92354dd18ea556a048aada05df |     
   nios2     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/a927a44ab08e12105bcd5a6876da92e303049f38 |     
   mips64    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/921f5dc17acc73276764f00c53c9ee0029e0af9d |     
  powerpc    | glibc-2.37-2-g9f8513dc64119... | NOK | http://autobuild.buildroot.net/results/ec82b0112ee888c23ff61444585f6746e778fb1b |     
    or1k     |           glog-0.6.0           | NOK | http://autobuild.buildroot.net/results/4d757bb1966b51a2d96aa87db361dac79bbd1ee3 |     
  riscv64    |           gmp-6.2.1            | NOK | http://autobuild.buildroot.net/results/e3738592dbaa07ff3df6c77f2c55fbdd7f4d99ff | ORPH
    m68k     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/887b9e47eb4968cd59d3d39d892ad126a641f12e |     
   sparc     |     host-gcc-final-10.4.0      | NOK | http://autobuild.buildroot.net/results/6a6c8b3b959cafea93ec4925abd36fc38fdb1018 |     
   arceb     | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/1296b9d023f4b53bd0ccfe7ba34d73a3ca686f18 | ORPH
   arceb     | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/c919f94e25f1e06a2aaf7766311d7ffd1c25d09e | ORPH
   arceb     | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/3e46556e0115a6dc99b4144909a167eef60d8f92 | ORPH
    or1k     |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/6f146b1cb308b0a2e019fa91029f59ca67ed4c69 |     
 microblaze  |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/a0c73bf675cfb0c3e54c084e452b4afa7235a91e |     
 powerpc64   |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/6a854856e22fde0ddaaac523a64403dd7bc2d544 |     
  riscv32    |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/7ef37aedfd7d3d56240c30c1fae115006ebd0a84 |     
   x86_64    |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/03ebd58bf889654995618d1ffd7bfd0e9e44695a |     
   nios2     |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/6c1cf18c08582999efd9f7c777257b702b49e04a |     
  riscv64    |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/76e45a5e57eadda3bc3ce5bd72ee231d97c4f2a7 |     
    or1k     |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/3118bf53e2ad98ebb1c66f12fc71309be4a2b28b |     
    arm      | host-sunxi-tools-1.4.2-168-... | NOK | http://autobuild.buildroot.net/results/ee895c49f2ceb40beb533f34d4a8b41e87a49698 |     
   arceb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/f8b0e6f818297ce6a0c68e6e9dccc1eb4666cb73 |     
   sparc     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/aa8560b919732ee597b18c3e9b3315fa325ed489 |     
    arc      |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/84e040375123be403f6866f04448e52e2d66c0f9 |     
   mips64    |         libglvnd-1.4.0         | NOK | http://autobuild.buildroot.net/results/a07551bd02be2405b9238f3a9796bb2a01b99d08 | ORPH
  aarch64    |          libnl-3.7.0           | NOK | http://autobuild.buildroot.net/results/dc98505a29e7edb940284364325d4a250623791d | ORPH
   x86_64    |          libnss-3.89           | NOK | http://autobuild.buildroot.net/results/3933077a6aaac0732228ce7fa17ae22348856331 |     
microblazeel |          libnss-3.89           | NOK | http://autobuild.buildroot.net/results/5fcf21e9586540d561af371a736455de26116fa7 |     
    arc      |         libvips-8.10.6         | NOK | http://autobuild.buildroot.net/results/ed47d9d9abb917c6dea26ce4cc3414ef49b9bfff |     
   armeb     |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/765211ad9232e1415ac6ed1e7daca7db98f94a00 | ORPH
    arc      |          linux-6.1.14          | NOK | http://autobuild.buildroot.net/results/77032e8163df518548454d458d1f72635c7eb772 | ORPH
  sparc64    |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/02bd5e5e785843abed9002509bd3bb8491b8b21f | ORPH
    mips     |          perl-5.36.0           | NOK | http://autobuild.buildroot.net/results/a3bbea2fdfce50584e3d9db971cb14db05162251 |     
   sh4aeb    |           php-8.2.3            | NOK | http://autobuild.buildroot.net/results/f91d11bc0f0839be47b63c055bcf80d0d3e99091 |     
   sh4eb     |        strongswan-5.9.8        | NOK | http://autobuild.buildroot.net/results/60a8ab805f2dc79a12e4622ef73faf054fe460b7 |     
   sparc     |         uclibc-1.0.43          | NOK | http://autobuild.buildroot.net/results/9cdf2271c47ff5f5419a914192c09dffabc6f926 |     
    m68k     |         uclibc-1.0.43          | NOK | http://autobuild.buildroot.net/results/0f2426decc99de4f1f9dd052003aba350b26ff2e |     
 powerpc64   |            unknown             | NOK | http://autobuild.buildroot.net/results/653ae34a0b0b2340a771645da6a625f178435a43 |     
  mips64el   |        valgrind-3.19.0         | NOK | http://autobuild.buildroot.net/results/9c5a149ef49f26153d36c166c588673a58cd8c09 | ORPH


Classification of failures by reason for 2023.02.x
--------------------------------------------------

fs/ubi/ubi.mk:51: /home/bui... | 1 
fs/ubi/ubi.mk:51: /home/bui... | 1 
                python3-3.11.2 | 1 
                       unknown | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     | fs/ubi/ubi.mk:51: /home/bui... | NOK | http://autobuild.buildroot.net/results/bb3220c0f5b3fede93b78278003cd82fd7e825b0 |     
   sparc     | fs/ubi/ubi.mk:51: /home/bui... | NOK | http://autobuild.buildroot.net/results/a1ad1a5f2c9e49345af7c96b4c07e250232967be |     
   x86_64    |         python3-3.11.2         | NOK | http://autobuild.buildroot.net/results/3121ef0bf3afac054a869dee40e3d291f6f8f423 |     
   sparc     |            unknown             | NOK | http://autobuild.buildroot.net/results/19418be22cdba4d0a71b6fc13930314240a72726 |     


Gitlab CI results for 2023-04-28
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
                       beaglebone | https://gitlab.com/buildroot.org/buildroot/-/jobs/4187706631  |      
                   beaglebone_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4187706636  |      
        engicam_imx6qdl_icore_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4187706673  |      
           freescale_imx6qsabresd | https://gitlab.com/buildroot.org/buildroot/-/jobs/4187706710  |      
                 grinn_chiliboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/4187706784  |      
                 imx6-sabresd_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4187706806  |      
                      nitrogen6sx | https://gitlab.com/buildroot.org/buildroot/-/jobs/4187706995  |      
                       nitrogen6x | https://gitlab.com/buildroot.org/buildroot/-/jobs/4187707001  |      
                        nitrogen7 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4187707006  |      
                       nitrogen8m | https://gitlab.com/buildroot.org/buildroot/-/jobs/4187707012  |      
                      nitrogen8mm | https://gitlab.com/buildroot.org/buildroot/-/jobs/4187707019  |      
                      nitrogen8mn | https://gitlab.com/buildroot.org/buildroot/-/jobs/4187707023  |      
                      nitrogen8mp | https://gitlab.com/buildroot.org/buildroot/-/jobs/4187707029  |      
                       olpc_xo175 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4187707093  |      
                     orangepi_one | https://gitlab.com/buildroot.org/buildroot/-/jobs/4187707115  |      
                orangepi_one_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/4187707118  |      
                   pc_x86_64_bios | https://gitlab.com/buildroot.org/buildroot/-/jobs/4187707153  |      
                    pc_x86_64_efi | https://gitlab.com/buildroot.org/buildroot/-/jobs/4187707163  |      
                       qemu_s390x | https://gitlab.com/buildroot.org/buildroot/-/jobs/4187707280  |      
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/4187707331  | ORPH 
               snps_arc700_axs101 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4187707457  |      
                socrates_cyclone5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4187707488  |      
          solidrun_clearfog_gt_8k | https://gitlab.com/buildroot.org/buildroot/-/jobs/4187707499  |      
                           ts5500 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4187707551  |      
                           ts7680 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4187707557  |      
                         uevm5432 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4187707561  |      
                    versal_vck190 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4187707569  |      
                       visionfive | https://gitlab.com/buildroot.org/buildroot/-/jobs/4187707579  |      
                      visionfive2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4187707573  |      
                        wandboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/4187707586  |      
                            warp7 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4187707590  |      
                        warpboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/4187707599  |      
                    zynq_microzed | https://gitlab.com/buildroot.org/buildroot/-/jobs/4187707608  |      
                      zynq_qmtech | https://gitlab.com/buildroot.org/buildroot/-/jobs/4187707617  |      
                       zynq_zc706 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4187707626  |      
                         zynq_zed | https://gitlab.com/buildroot.org/buildroot/-/jobs/4187707631  |      
                zynqmp_kria_kv260 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4187707634  |      
                    zynqmp_zcu102 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4187707640  |      
                    zynqmp_zcu106 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4187707645  |      



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
