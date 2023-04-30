Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CB02C77B60
	for <buildroot@archiver.kernel.org>; Sun, 30 Apr 2023 05:32:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A78E28423E;
	Sun, 30 Apr 2023 05:32:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A78E28423E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aJn_86DOs623; Sun, 30 Apr 2023 05:31:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4D4398422F;
	Sun, 30 Apr 2023 05:31:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4D4398422F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6D5D41BF3C9
 for <buildroot@lists.busybox.net>; Sun, 30 Apr 2023 05:31:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 522BB4284C
 for <buildroot@lists.busybox.net>; Sun, 30 Apr 2023 05:31:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 522BB4284C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YI_a0FCnhqV8 for <buildroot@lists.busybox.net>;
 Sun, 30 Apr 2023 05:31:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7BE3D42849
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7BE3D42849
 for <buildroot@buildroot.org>; Sun, 30 Apr 2023 05:31:53 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id BC1B81BF20E
 for <buildroot@buildroot.org>; Sun, 30 Apr 2023 05:31:50 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sun, 30 Apr 2023 05:31:50 -0000
Message-Id: <20230430053156.522BB4284C@smtp4.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1682832710; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=VwasDDrlUlU/cRkEJdz9PRzF/AeI/ZY46MafQbTi1Rc=;
 b=AAbOBO+IodEpeKv43KgUXNj1z6pRzhazZTjRdugTaODYcdjtqxVeDTp7ZgPNsJnwDd4bGb
 Pixuw716ezceoSmd6tegu+qhGGZISXYOeZwn08Siv9IhZ2ArOnhyUyDHSHxAHeU3iXLDCh
 eDHchW/I+x9hCMr/Ug3TyCpW7CwaUcKoMBd00Ua7BamPFCIeoeaqgXMWAIoErLzqR5rOqz
 I+RTfDtNbowMazt2GHfmS0z3WcN4olziTcs+Sl+osDvuVpArc9ha/XWhUeMMFGUwHgPnNn
 03MNOqQRONn/Y+pJhPeNi+hoosNscd9TjdEdtc44VLK0+LLkh0tJ0xfbISWpAQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=AAbOBO+I
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-04-29
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

Autobuild statistics for 2023-04-29
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  |  4  |  4  |  0  |  8  |
    master   | 63  | 43  |  0  | 106 |

Classification of failures by reason for master
-----------------------------------------------

               host-qemu-7.2.0 | 3 
              host-rust-1.68.2 | 3 
                  linux-6.1.14 | 3 
                busybox-1.36.0 | 2 
   gdb-arc-2020.09-release-gdb | 2 
         host-gcc-final-10.4.0 | 2 
                 uclibc-1.0.43 | 2 
                 agentpp-4.6.0 | 1 
                    atk-2.38.0 | 1 
                elfutils-0.186 | 1 
fs/cramfs/cramfs.mk:46: /ho... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
glibc-2.37-2-g9f8513dc64119... | 1 
                     gmp-6.2.1 | 1 
  gobject-introspection-1.72.0 | 1 
                 haproxy-2.6.9 | 1 
            host-binutils-2.37 | 1 
            host-binutils-2.38 | 1 
         host-gcc-final-11.3.0 | 1 
host-gdb-arc-2020.09-releas... | 1 
               host-runc-1.1.5 | 1 
            linux-fusion-9.0.3 | 1 
                   perl-5.36.0 | 1 
            quickjs-2021-03-27 | 1 
                    sdl-1.2.15 | 1 
                speechd-0.11.4 | 1 
             stress-ng-0.15.04 | 1 
           uboot-tools-2021.07 | 1 
                     vdr-2.6.3 | 1 
                xenomai-3.0.10 | 1 
                     z3-4.12.1 | 1 
               zxing-cpp-1.4.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   arceb     |         agentpp-4.6.0          | NOK | http://autobuild.buildroot.net/results/d2c65928842cdde1b9471025a544d09e4aac0799 |     
   sparc     |           atk-2.38.0           | NOK | http://autobuild.buildroot.net/results/ff08d4b01c7f8daf0afa66083ee5b388c06c4251 | ORPH
  mips64el   |         busybox-1.36.0         | NOK | http://autobuild.buildroot.net/results/8cb112a072b53eec0763da9fb9fc997007fb339c | ORPH
    m68k     |         busybox-1.36.0         | NOK | http://autobuild.buildroot.net/results/69ddb9f3ab3c5eac6c39b4107f581dbccff1ac9e | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/50dd33303135d5a270ebb384241bbd162c55b98e | ORPH
   s390x     | fs/cramfs/cramfs.mk:46: /ho... | NOK | http://autobuild.buildroot.net/results/a3af25398d3290d1ab05a23b49d8442417a03e8b |     
 microblaze  | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/3215c89435b72812d7b68510cedde8dd2895b062 |     
   arceb     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/de2ed69d21e9edaec4110b43093b097b76f34117 |     
    arc      |  gdb-arc-2020.09-release-gdb   | NOK | http://autobuild.buildroot.net/results/9ac7c28528274b12e8f110c2851f9fa76e67033d | ORPH
    arc      |  gdb-arc-2020.09-release-gdb   | NOK | http://autobuild.buildroot.net/results/e7d4332530e7777e57c53a574c873d0b4d38b603 | ORPH
  powerpc    | glibc-2.37-2-g9f8513dc64119... | NOK | http://autobuild.buildroot.net/results/3e4c8dd8649a7bd2ba05f988cd72c238ef9ae350 |     
  riscv64    |           gmp-6.2.1            | NOK | http://autobuild.buildroot.net/results/dba6392bc720da354740f2ca19066ea2f66ef02f | ORPH
   nios2     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/6471e7fd14288d50f47f53f5ea44ba6568ff0130 | ORPH
 aarch64_be  |         haproxy-2.6.9          | NOK | http://autobuild.buildroot.net/results/c1f99ea92c86e0173fffdaf3ab3f8fe345843c76 |     
   sparc     |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/91e3a1ba6a7e55167da8aa2b2606d161cdf73537 |     
    i686     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/cad30f6ba1e07da17071d83a633760589329dd77 |     
   sparc     |     host-gcc-final-10.4.0      | NOK | http://autobuild.buildroot.net/results/86bb399fc43c18691e8f8c4b5098d081060d893a |     
   sparc     |     host-gcc-final-10.4.0      | NOK | http://autobuild.buildroot.net/results/b452a82736ee80f4a04c8d2c9528c3282a5a5aaf |     
    m68k     |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/3d84815bac4462949db1aed39eb3d5fd76914ec1 |     
    arc      | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/914be42c205e4cda9fc5acc564b1483e1e1077f3 | ORPH
    i686     |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/ee37950476445036480d40a0ad3e55e660d391c9 |     
  powerpc    |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/5a0b530a9c12b0b2d1c956c08ab7a9f5b177f284 |     
    sh4      |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/00c488e25cc9bc5b900964f20532e43a4fa58cb1 |     
   x86_64    |        host-runc-1.1.5         | NOK | http://autobuild.buildroot.net/results/0f8f21f79f91958df18f2ef0a19f97688f36b04d |     
  aarch64    |        host-rust-1.68.2        | NOK | http://autobuild.buildroot.net/results/355c9dbe4999d65b65bcc7151f29b34ba4a33037 |     
    mips     |        host-rust-1.68.2        | NOK | http://autobuild.buildroot.net/results/231db42904e0a7758db7885974521e69f812a475 |     
  sparc64    |        host-rust-1.68.2        | NOK | http://autobuild.buildroot.net/results/b1098c2415a25d56821e0af8af2ae241282a914d |     
   nios2     |          linux-6.1.14          | NOK | http://autobuild.buildroot.net/results/ce5f1b330a07cf58ea1cd5f015916b45d43361e7 | ORPH
    mips     |          linux-6.1.14          | NOK | http://autobuild.buildroot.net/results/328865a88e0037a824a4b5cc71f00648aac6fb86 | ORPH
    mips     |          linux-6.1.14          | NOK | http://autobuild.buildroot.net/results/247e7ef36441752ec48e9e305bd045ce7f3f787b | ORPH
  sparc64    |       linux-fusion-9.0.3       | NOK | http://autobuild.buildroot.net/results/18827293f0ff2816d2854db5e860e281d3fc0a4c | ORPH
   arceb     |          perl-5.36.0           | NOK | http://autobuild.buildroot.net/results/9aa078ca0bf4f91b14382af7c336fcfd8741194c |     
 microblaze  |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/a2ea2314977ef8b8f4537e82f4f1be10fbafd483 |     
   sh4aeb    |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/7a95b1f384e6db36d84da03e9de9df1f0d8924f6 | ORPH
microblazeel |         speechd-0.11.4         | NOK | http://autobuild.buildroot.net/results/88df34d4f228080e00f9efa444469175e53f2062 |     
 microblaze  |       stress-ng-0.15.04        | NOK | http://autobuild.buildroot.net/results/5954db43af36d8e2218d5219097e2ca8a54f27bc |     
 powerpc64   |      uboot-tools-2021.07       | NOK | http://autobuild.buildroot.net/results/b3f9e7863f243288743d1e4135de1988df33575c | ORPH
   xtensa    |         uclibc-1.0.43          | NOK | http://autobuild.buildroot.net/results/403058f21771d377be40d20e541a089d316d0c31 |     
   xtensa    |         uclibc-1.0.43          | NOK | http://autobuild.buildroot.net/results/69804a6c8d3e351c5fcf94d9e0643ca9d649e90c |     
   sparc     |           vdr-2.6.3            | NOK | http://autobuild.buildroot.net/results/f78eaaed1e008252baaa4565914bf1d9a9486fad |     
  aarch64    |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/eef2b779b240bf3ba5cb7670d7ddd4f43d87ab86 |     
    or1k     |           z3-4.12.1            | NOK | http://autobuild.buildroot.net/results/827072940fa9fdc7b647ebced3d4506376da03cb |     
   mipsel    |        zxing-cpp-1.4.0         | NOK | http://autobuild.buildroot.net/results/e7e3fbb44eb0568d86e0a99f32effe68ece2ff44 |     


Classification of failures by reason for 2023.02.x
--------------------------------------------------

                  boost-1.80.0 | 1 
         host-gcc-final-10.4.0 | 1 
         host-gcc-final-11.3.0 | 1 
               host-qemu-7.2.0 | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |          boost-1.80.0          | NOK | http://autobuild.buildroot.net/results/eb1dd3aff1b6c70ca245838fadf1e6d9825e0c0d |     
    mips     |     host-gcc-final-10.4.0      | NOK | http://autobuild.buildroot.net/results/7c7dc0e5f00da843f35e130bf111c57a19d06e86 |     
    or1k     |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/1182078df133b27a4d723dc0522683645e8457e0 |     
powerpc64le  |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/5209927aeb8505d6879a7a8248539690eceeb791 |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
