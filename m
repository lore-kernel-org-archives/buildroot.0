Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72223C7EE21
	for <buildroot@archiver.kernel.org>; Fri, 28 Apr 2023 05:46:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BD1C584056;
	Fri, 28 Apr 2023 05:46:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BD1C584056
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O6IXVMawg900; Fri, 28 Apr 2023 05:46:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BC14484050;
	Fri, 28 Apr 2023 05:46:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BC14484050
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D9E8C1BF592
 for <buildroot@lists.busybox.net>; Fri, 28 Apr 2023 05:46:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B678B4205E
 for <buildroot@lists.busybox.net>; Fri, 28 Apr 2023 05:46:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B678B4205E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jwn0ZYHT8gs1 for <buildroot@lists.busybox.net>;
 Fri, 28 Apr 2023 05:46:48 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7AE1B42059
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7AE1B42059
 for <buildroot@buildroot.org>; Fri, 28 Apr 2023 05:46:47 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 855451C0004
 for <buildroot@buildroot.org>; Fri, 28 Apr 2023 05:46:44 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Fri, 28 Apr 2023 05:46:44 -0000
Message-Id: <20230428054649.B678B4205E@smtp4.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1682660804; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=nrljfwU9/E99Upo/NaPSl83uGnvCpdHQVf++Dkh//uI=;
 b=eZ3Ikxiv5MprfOrQ5s6ZTz+VrkVCquFNQmXi7w0GT0DyhfOS3klQQBStOuXy68tKazmc2A
 JVyV0HqCPkrmNsc9PLfAlc6kcdPHEsXRU0E03S/Imq0/WuSqAb5TkZ2VD85aCVy+cZK/H/
 aXtoLWRCMUceOMBoxgoNdj6Qfi0jtAkjNwgo0YX6sSOJssHe/e3bruvrriVmVEz4NDGtXD
 urmmYanp3eHaZAgR+kjfCT7Zx3uI8fof1H415HC4uOLeY3JlrVQ6YSpVYJKbnloO1RkDCN
 p6u4+HU1JUxu/F1j6Ig6BnvWyksM1HOAPzpaOF2U3/Iu26DHJI0bSIfcBQq8sg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=eZ3Ikxiv
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-04-27
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

Autobuild statistics for 2023-04-27
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  |  7  |  5  |  0  | 12  |
    master   | 65  | 48  |  0  | 113 |

Classification of failures by reason for master
-----------------------------------------------

               host-qemu-7.2.0 | 5 
                 agentpp-4.6.0 | 2 
glibc-2.37-2-g9f8513dc64119... | 2 
  gobject-introspection-1.72.0 | 2 
            host-binutils-2.37 | 2 
            host-binutils-2.38 | 2 
         host-gcc-final-10.4.0 | 2 
               libglib2-2.76.1 | 2 
                 uclibc-1.0.43 | 2 
                       unknown | 2 
            altera-stapl-0.3.3 | 1 
             dahdi-linux-3.2.0 | 1 
                 dhcp-4.4.3-P1 | 1 
        edk2-edk2-stable202208 | 1 
                  faad2-2.10.1 | 1 
             fontconfig-2.13.1 | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
                     gmp-6.2.1 | 1 
                haveged-1.9.18 | 1 
         host-gcc-final-11.3.0 | 1 
host-gdb-arc-2020.09-releas... | 1 
                host-go-1.19.8 | 1 
              libgcrypt-1.10.1 | 1 
                  linux-6.1.14 | 1 
                   linux-tools | 1 
            mesa3d-demos-8.5.0 | 1 
                     mtd-2.1.5 | 1 
                python3-3.11.2 | 1 
                    qemu-7.2.0 | 1 
             stress-ng-0.15.04 | 1 
           uboot-tools-2021.07 | 1 
               util-linux-2.38 | 1 
           v4l2loopback-0.12.7 | 1 
               xfsprogs-5.14.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |         agentpp-4.6.0          | NOK | http://autobuild.buildroot.net/results/0f40b5148f32bfbf35c4e8868df926feeb6cad02 |     
 aarch64_be  |         agentpp-4.6.0          | NOK | http://autobuild.buildroot.net/results/becea5e4dfcbc11a2f7930ac06dd500f32a6ebb3 |     
  mips64el   |       altera-stapl-0.3.3       | NOK | http://autobuild.buildroot.net/results/dd989dd4a64791be8a46f8ec25f3cac976bda344 |     
   x86_64    |       dahdi-linux-3.2.0        | NOK | http://autobuild.buildroot.net/results/bb760e3cc591907aa91dcd7bd72ee49edf435dbf |     
   sh4eb     |         dhcp-4.4.3-P1          | NOK | http://autobuild.buildroot.net/results/835d51c4300b79dfbb1436fdb1ea2c0c9724e249 | ORPH
   x86_64    |     edk2-edk2-stable202208     | NOK | http://autobuild.buildroot.net/results/7115e799605b65da97941e11c3e137e921586028 |     
    sh4a     |          faad2-2.10.1          | NOK | http://autobuild.buildroot.net/results/a78f8d3d9f60ddd055e171519ac930f2db99b139 |     
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/722e3f24770cb51ecc357685340172a47747b462 | ORPH
    arm      | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/34b4cdb762bf0ec44334721e8b735d7c9d2c4575 |     
  aarch64    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/217ae264f4d71e5e9915c2c8cbc608b6b04b2a3d |     
  powerpc    | glibc-2.37-2-g9f8513dc64119... | NOK | http://autobuild.buildroot.net/results/384787a535ca39c1a3995821c8922925150e0baa |     
  powerpc    | glibc-2.37-2-g9f8513dc64119... | NOK | http://autobuild.buildroot.net/results/11dd7c322baf0e02ab11f91478f83b2d9f071348 |     
  riscv64    |           gmp-6.2.1            | NOK | http://autobuild.buildroot.net/results/093cceb87a3fb7f586e457710b9c2a6378429e28 | ORPH
   nios2     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/aa22d0d1bbf31cef7ac94ca79a65c1866b5eba29 | ORPH
   nios2     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/bc7376b89be37ba2a8efdfbd46d9d1188fccb7bc | ORPH
   arceb     |         haveged-1.9.18         | NOK | http://autobuild.buildroot.net/results/08b224a90a0e608af5f8680f3d6cd5c6c344dc53 |     
  aarch64    |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/11920b6c2e2ec5d93cdf44af8f30ab857e08d597 |     
 aarch64_be  |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/1a5cb7282218cb944622677dff9030616dbf3a9f |     
  aarch64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/0e7138919e0ffa61a05aa54326b138ee1360a722 |     
 powerpc64   |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/9f1f2f5f414114a74cca2ab2dd2240a678552e24 |     
microblazeel |     host-gcc-final-10.4.0      | NOK | http://autobuild.buildroot.net/results/2b0f9a6d393fe57b61a19c9273e393c1bb11aede |     
    arm      |     host-gcc-final-10.4.0      | NOK | http://autobuild.buildroot.net/results/be59d66968d844802cfa5331456418983c48ff99 |     
    m68k     |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/d1c9b8fd1c1c126192b227fb4d4d890cd9c16b8e |     
   arceb     | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/14e0eee2e2950a27a9286715148fa2a9b46238f5 | ORPH
  mips64el   |         host-go-1.19.8         | NOK | http://autobuild.buildroot.net/results/dc24d5b4146bf48380796870b4b15776dc699902 |     
   nios2     |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/5be9348cfef377ec1d66ff93472dfadba6bf88ff |     
powerpc64le  |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/74a4605c537e87270a7bf22fdc6005ec9b3c9ea0 |     
  aarch64    |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/1ba3cb3a7972a6c0ce54b7d3cf62c10e49f46a98 |     
   armeb     |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/71cc4c5a59dd3b62728c9c079f579fb576daccaf |     
    mips     |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/279b3c164300acdac57d5adad426f56d0d6c349b |     
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/e63a71e57e262b68c02faf71d6905966d1d0751d | ORPH
   mips64    |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/886a0da34657d5e2c1764d1f0c80aaeb58ffdf8e |     
   arceb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/2ddec17b228bb4a02d30cf3557c9e6f36cb6ede2 |     
   mips64    |          linux-6.1.14          | NOK | http://autobuild.buildroot.net/results/49ec4d7df617b2d7d5e7e365350e43522cb7ff09 | ORPH
 aarch64_be  |          linux-tools           | NOK | http://autobuild.buildroot.net/results/7b118a7f2e7c30ce321e05110248d0efb357d3be | ORPH
    arm      |       mesa3d-demos-8.5.0       | NOK | http://autobuild.buildroot.net/results/196efdd01b592d0d7c9346d399018db1a268980a |     
    or1k     |           mtd-2.1.5            | NOK | http://autobuild.buildroot.net/results/4752dcc68e2020aba2aaf03fa5e7887140f2be60 | ORPH
   x86_64    |         python3-3.11.2         | NOK | http://autobuild.buildroot.net/results/5d9caef0ddcfe48fcc2726cf3df99bebc999f7dc |     
    i686     |           qemu-7.2.0           | NOK | http://autobuild.buildroot.net/results/c712fcb5ef666079f678c441793482d35bda0936 |     
 microblaze  |       stress-ng-0.15.04        | NOK | http://autobuild.buildroot.net/results/dfc092d3f60d1e761aca515e25a8ee1ab3120c8e |     
  riscv64    |      uboot-tools-2021.07       | NOK | http://autobuild.buildroot.net/results/459c1a6661e73e3cec5fa5e19a5b73ec38b8f33d | ORPH
  riscv64    |         uclibc-1.0.43          | NOK | http://autobuild.buildroot.net/results/24408dacdecaa157e5402e0aefadec02727cdc85 |     
  mips64el   |         uclibc-1.0.43          | NOK | http://autobuild.buildroot.net/results/f478f92bfda4f7077df11368d24a91b6227fd119 |     
    mips     |            unknown             | NOK | http://autobuild.buildroot.net/results/3e0c52895620ca09f3c3933c3f402be930561c50 |     
  sparc64    |            unknown             | NOK | http://autobuild.buildroot.net/results/38492271344140a8377ee50a81d7b7d914cb00cb |     
   mipsel    |        util-linux-2.38         | NOK | http://autobuild.buildroot.net/results/9d2d6cac83a6384a2f7f4326b9a5136327dc163f | ORPH
 powerpc64   |      v4l2loopback-0.12.7       | NOK | http://autobuild.buildroot.net/results/211135b9864792c16bd7c23dff1b4744051c2f3e |     
    arm      |        xfsprogs-5.14.2         | NOK | http://autobuild.buildroot.net/results/703236cd49e9d898900b5420571e7d52cf31a1fb | ORPH


Classification of failures by reason for 2023.02.x
--------------------------------------------------

               host-qemu-7.2.0 | 3 
             fontconfig-2.13.1 | 1 
              host-rust-1.67.1 | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/f6587d6536dcb94b654cd3fa336c7d754ad9553a | ORPH
   mipsel    |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/49d233cf0977ef8cfbd88a64cf8b1eb06c9f7e64 |     
   armeb     |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/191324ff1e143799e20e968321e1dabc606ad269 |     
   s390x     |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/efb2d713324534dad6486ca759d1e65a76be18ed |     
  aarch64    |        host-rust-1.67.1        | NOK | http://autobuild.buildroot.net/results/aea7882eab04320bb8b21e274dd38a77e287297a |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
