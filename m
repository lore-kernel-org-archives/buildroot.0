Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1513CD37B5
	for <buildroot@archiver.kernel.org>; Sat, 16 Sep 2023 06:46:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4967A400AF;
	Sat, 16 Sep 2023 06:46:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4967A400AF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eLvTY7zOgxmM; Sat, 16 Sep 2023 06:46:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 33AB2408D7;
	Sat, 16 Sep 2023 06:46:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 33AB2408D7
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 49DC91BF860
 for <buildroot@lists.busybox.net>; Sat, 16 Sep 2023 06:46:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 22BA3607AA
 for <buildroot@lists.busybox.net>; Sat, 16 Sep 2023 06:46:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 22BA3607AA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n5_-pUW_oO_M for <buildroot@lists.busybox.net>;
 Sat, 16 Sep 2023 06:46:36 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 452BE607A4
 for <buildroot@buildroot.org>; Sat, 16 Sep 2023 06:46:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 452BE607A4
Received: by mail.gandi.net (Postfix) with ESMTPSA id C886920013
 for <buildroot@buildroot.org>; Sat, 16 Sep 2023 06:46:32 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sat, 16 Sep 2023 06:46:32 -0000
X-GND-Sasl: bot@bootlin.com
Message-Id: <20230916064638.22BA3607AA@smtp3.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1694846792; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=4WOychqP7j0KKv2VkVDd2DE1BA4BZJjo1Qm1PcbgK0o=;
 b=FySeoLkeZHFzDHL9NzY5cKqYCEByEpgEvoZh9YejvYeeo4QhzaCLbBiqQxSqyK0y+O5r1E
 PnzG8tMMelr/dC/6s0fFgxfcp7+rda3hA7XwmxxJ/VKUHqjXoOJXAfl94487vvw+8kMiov
 81gVnKDP7MK3wZ32cdd078Lqjt7aUFEgtsqsusyPaUdZjTfa4DqDW62FxQaHU35SW77/92
 X6rKiVnAB60sYEF9llTWQxCIjBj9+xJKx6nAnSPDxhzSJkSJTv0jl3TPMjShdQhXhsoWP5
 ElKNUloV/1OyjFy1A6RanFvS9DSVcLvytI6FWzmy2zMCDXUc0YSJGjWo+e8CHw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=FySeoLke
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-09-15
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

Autobuild statistics for 2023-09-15
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  |  1  |  4  |  0  |  5  |
  2023.05.x  |  6  |  4  |  0  | 10  |
  2023.08.x  |  2  |  3  |  0  |  5  |
    master   | 42  | 25  |  0  | 67  |

Classification of failures by reason for master
-----------------------------------------------

glibc-2.37-2-g9f8513dc64119... | 3 
check-11970a7e112dfe243a2e6... | 2 
                  conmon-2.1.8 | 2 
  gobject-introspection-1.76.1 | 2 
        ltp-testsuite-20230127 | 2 
                    crun-1.8.4 | 1 
                elfutils-0.189 | 1 
                host-go-1.21.1 | 1 
          imagemagick-7.1.0-51 | 1 
            libmemcached-1.1.4 | 1 
                   libnss-3.93 | 1 
                  libsepol-3.5 | 1 
                  linux-6.4.14 | 1 
               linux-pam-1.5.3 | 1 
          lttng-modules-2.13.7 | 1 
                    olsr-0.9.8 | 1 
                    proj-8.1.1 | 1 
                       unknown | 1 
                xenomai-3.0.10 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/e520979df69304ec780fb92f28116363e72b557e | ORPH
   mipsel    | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/0d6fcbedef29bf0d6a1d9ecb8e4d82b4ad06cfa8 | ORPH
    i686     |          conmon-2.1.8          | NOK | http://autobuild.buildroot.net/results/13d3b46990720bba8621c922b5dce54ab650e96d |     
  aarch64    |          conmon-2.1.8          | NOK | http://autobuild.buildroot.net/results/52995e5dccc6d2bd1c9859f04967474d97be6fe3 |     
  riscv64    |           crun-1.8.4           | NOK | http://autobuild.buildroot.net/results/7de2a36c75ae4383c500ecaaa0dba1d283f71be5 |     
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/7eb727b2366b7bb1e707814caf71e7d6b9372248 | ORPH
  powerpc    | glibc-2.37-2-g9f8513dc64119... | NOK | http://autobuild.buildroot.net/results/3f691a1333f2720e6af5e7b734be7918499b01b1 |     
 powerpc64   | glibc-2.37-2-g9f8513dc64119... | NOK | http://autobuild.buildroot.net/results/7123a20bb429034852c0f4ef5f3d6dd3d8e87835 |     
 powerpc64   | glibc-2.37-2-g9f8513dc64119... | NOK | http://autobuild.buildroot.net/results/298fd993f53ca21d8c1e4ec240298482afcfd64d |     
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/8fffadba49c6bbd1b77570e481d7a6ed6d3e7b6f | ORPH
   mipsel    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/ae5716e6ee15f0a93af68cd89e9c8e82b6d7da3b | ORPH
   mips64    |         host-go-1.21.1         | NOK | http://autobuild.buildroot.net/results/2f77956596279cade3ad5db6690776e10d460b33 |     
    sh4      |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/2454b67196d9f1d257549ef4e53715667a6c3ba0 | ORPH
   armeb     |       libmemcached-1.1.4       | NOK | http://autobuild.buildroot.net/results/464a3b7048dfb59ec21b8fb09e92472e9b83e18a | ORPH
microblazeel |          libnss-3.93           | NOK | http://autobuild.buildroot.net/results/36de219c5d18f2647d0ab5b48faf0b1b6ea03ffd |     
    arm      |          libsepol-3.5          | NOK | http://autobuild.buildroot.net/results/cd371f3708b79885fe86f8987e41fed7171e4da8 |     
 microblaze  |          linux-6.4.14          | NOK | http://autobuild.buildroot.net/results/6360af94fb8afd2a696e88f3a14e282ea2ed00d8 | ORPH
   sparc     |        linux-pam-1.5.3         | NOK | http://autobuild.buildroot.net/results/52c51b5ad5930ed783b88fb33932297379fd4429 | ORPH
  sparc64    |     ltp-testsuite-20230127     | NOK | http://autobuild.buildroot.net/results/6050dd601400ae3589898b3bc8684f9f3379602b |     
   x86_64    |     ltp-testsuite-20230127     | NOK | http://autobuild.buildroot.net/results/976c21f33a711c68ca4b47b7a4633369400d498f |     
   armeb     |      lttng-modules-2.13.7      | NOK | http://autobuild.buildroot.net/results/5d27be0f38e1a3178eb99413d38d3d768b7bd21f |     
    arm      |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/09edfcb58978a28925846e70e8ef26cb9616ac3d | ORPH
    or1k     |           proj-8.1.1           | NOK | http://autobuild.buildroot.net/results/c48d2ad8a9808c9d2b40c751fb24460f0dd2b42a |     
   sparc     |            unknown             | NOK | http://autobuild.buildroot.net/results/511a682abd233ba90543044fd9102dc08c762f78 |     
   mips64    |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/bddb29d409aff31a84c895f0005858e76aa60e79 |     


Classification of failures by reason for 2023.02.x
--------------------------------------------------

  gobject-introspection-1.72.0 | 2 
               host-go-1.19.13 | 1 
              host-rust-1.67.1 | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    mips     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/5dc572bd7fee1ad924d6e5326f5cffdabe95df08 | ORPH
    or1k     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/e433824c29bb03a5d57173abc1f58ae02fe6e108 | ORPH
  mips64el   |        host-go-1.19.13         | NOK | http://autobuild.buildroot.net/results/6cd1b5d6886ad0841eb73424fcda5ab0e8465182 |     
    i686     |        host-rust-1.67.1        | NOK | http://autobuild.buildroot.net/results/05d88c02f354cc3a5dd09078c49b6ebabeef8508 |     


Classification of failures by reason for 2023.05.x
--------------------------------------------------

                  check-0.15.2 | 1 
               host-go-1.19.13 | 1 
                  linux-6.3.13 | 1 
                    olsr-0.9.8 | 1 


Detail of failures for 2023.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |          check-0.15.2          | NOK | http://autobuild.buildroot.net/results/41d8430a5934196108fa08ea0f28b2c427c8eb49 | ORPH
  mips64el   |        host-go-1.19.13         | NOK | http://autobuild.buildroot.net/results/fbc075cb554207d6cfdded71c253feb7dd1bbeb3 |     
    or1k     |          linux-6.3.13          | NOK | http://autobuild.buildroot.net/results/1ed54b630874d381b6a24b773cef7cde045fca0c | ORPH
   mips64    |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/11d0decd399d06db805520faa269c943392b32a3 | ORPH


Classification of failures by reason for 2023.08.x
--------------------------------------------------

                bpftool-v7.1.0 | 1 
              host-rust-1.71.1 | 1 
             util-linux-2.39.1 | 1 


Detail of failures for 2023.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   s390x     |         bpftool-v7.1.0         | NOK | http://autobuild.buildroot.net/results/58b6fac12e70fdea03aef03d635fe59936720e91 |     
powerpc64le  |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/fc98e8ec60d972c510bd2a0bdfae3dbb60b5c16d |     
powerpc64le  |       util-linux-2.39.1        | NOK | http://autobuild.buildroot.net/results/3747cb407c09430e8b004fd21d129870e22a1fc4 | ORPH


Gitlab CI results for 2023-09-15
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
                          beaglev | https://gitlab.com/buildroot.org/buildroot/-/jobs/5083366396  |      
             freescale_imx8dxlevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/5083366507  |      
              freescale_imx8mmevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/5083366509  |      
              freescale_imx8mnevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/5083366512  |      
              freescale_imx8mpevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/5083366524  |      
              freescale_imx8mqevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/5083366527  |      
              freescale_imx8qmmek | https://gitlab.com/buildroot.org/buildroot/-/jobs/5083366530  |      
             freescale_imx8qxpmek | https://gitlab.com/buildroot.org/buildroot/-/jobs/5083366531  |      
               icnova-a20-adb4006 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5083366560  |      
                   imx6-sabreauto | https://gitlab.com/buildroot.org/buildroot/-/jobs/5083366564  |      
                     imx6-sabresd | https://gitlab.com/buildroot.org/buildroot/-/jobs/5083366567  |      
                       imx8mmpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/5083366606  |      
                        imx8mpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/5083366622  |      
                        imx8mqevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/5083366625  |      
               kontron_pitx_imx8m | https://gitlab.com/buildroot.org/buildroot/-/jobs/5083366636  |      
                       ls1028ardb | https://gitlab.com/buildroot.org/buildroot/-/jobs/5083366653  |      
            microchip_mpfs_icicle | https://gitlab.com/buildroot.org/buildroot/-/jobs/5083366663  |      
              octavo_osd32mp1_brk | https://gitlab.com/buildroot.org/buildroot/-/jobs/5083366821  |      
              octavo_osd32mp1_red | https://gitlab.com/buildroot.org/buildroot/-/jobs/5083366824  |      
                   orangepi_lite2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5083366865  |      
                orangepi_one_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/5083366875  |      
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/5083367107  | ORPH 
                    roc_pc_rk3399 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5083367140  |      
               snps_arc700_axs101 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5083367212  |      
                 snps_arc700_nsim | https://gitlab.com/buildroot.org/buildroot/-/jobs/5083367217  |      
                socrates_cyclone5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5083367244  |      
                  stm32mp157a_dk1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5083367288  |      
                  stm32mp157c_dk2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5083367292  |      
              toradex_apalis_imx6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5083367331  |      
                      visionfive2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5083367361  |      



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
