Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADCA1C7EE24
	for <buildroot@archiver.kernel.org>; Thu, 18 May 2023 05:33:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1B27540462;
	Thu, 18 May 2023 05:33:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1B27540462
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 04hMomZxfD6m; Thu, 18 May 2023 05:33:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CB70A401F3;
	Thu, 18 May 2023 05:33:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CB70A401F3
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C45781BF2B1
 for <buildroot@lists.busybox.net>; Thu, 18 May 2023 05:33:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A369E8434E
 for <buildroot@lists.busybox.net>; Thu, 18 May 2023 05:33:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A369E8434E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mimIQ3hlmDzW for <buildroot@lists.busybox.net>;
 Thu, 18 May 2023 05:33:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B7B1384345
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B7B1384345
 for <buildroot@buildroot.org>; Thu, 18 May 2023 05:33:15 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id E97841BF20C
 for <buildroot@buildroot.org>; Thu, 18 May 2023 05:33:12 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Thu, 18 May 2023 05:33:12 -0000
Message-Id: <20230518053317.A369E8434E@smtp1.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1684387993; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ZEHc9YvnC1KPZ0GYSjZGh7mp6vU3OHNjEu/dISx8Udc=;
 b=kUykuYvPAlLP313fKKTK6AZ95JN9G0BUeQ6TJ8+ZrxUf3lV5n+UCHVoOpz2wgfNXZtuo0H
 TphC02Aj0UCQnGSrcPjhAAgzJkfv/sO1Uo9WBPVaa1qqkcxxrCP9E0Q9leQ7uLVx5a9yU/
 eJRV/jEJ28W+ORsi2+/JVdwbSRHPa5xB18Duy+vcmOGISr9Ll1f7qcbcwZgwpBB09Dd9sN
 ZPbmXE+iZJjct22n212gfaoLETJ0/QV+XDPcemnh6CglMbXIW+uqCbUYwAwUcfa0UMGZIu
 G46qHuBG7K1Vvz6KR8kDfcx4l3devhAoD7xffWNyGxVjCTnrSsmiM8eWa0QGUg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=kUykuYvP
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-05-17
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

Autobuild statistics for 2023-05-17
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  |  5  |  0  |  0  |  5  |
  2023.02.x  |  7  |  7  |  0  | 14  |
    master   | 78  | 64  |  0  | 142 |

Classification of failures by reason for master
-----------------------------------------------

                   linux-6.3.2 | 5 
           at-spi2-core-2.48.2 | 4 
package/sdl2_net/sdl2_net.m... | 4 
                       unknown | 4 
            host-binutils-2.38 | 3 
                host-go-1.19.9 | 3 
               zxing-cpp-1.4.0 | 3 
                 agentpp-4.6.0 | 2 
  gobject-introspection-1.74.0 | 2 
host-heimdal-f4faaeaba371ff... | 2 
              host-rust-1.68.2 | 2 
               libglib2-2.76.1 | 2 
           python-pyicu-2.10.2 | 2 
               syslog-ng-4.1.1 | 2 
               valgrind-3.20.0 | 2 
                     audit-3.1 | 1 
                    brltty-6.5 | 1 
                 coreutils-9.3 | 1 
                elfutils-0.186 | 1 
                 fdk-aac-2.0.2 | 1 
            flatbuffers-23.3.3 | 1 
                     gmp-6.2.1 | 1 
            host-binutils-2.39 | 1 
host-gdb-arc-2020.09-releas... | 1 
                  libjxl-0.8.1 | 1 
                  libmnl-1.0.5 | 1 
                 libpqxx-7.7.5 | 1 
              libuhttpd-3.14.1 | 1 
           sdl2_net-legal-info | 1 
                   shadow-4.13 | 1 
             stress-ng-0.15.07 | 1 
                 uclibc-1.0.43 | 1 
uclibc-ng-test-6790eafe897b... | 1 
           v4l2loopback-0.12.7 | 1 
                 wavemon-0.9.4 | 1 
                xenomai-3.0.10 | 1 
                    zeek-4.1.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |         agentpp-4.6.0          | NOK | http://autobuild.buildroot.net/results/1b47b34fa36112fa8f04cdaa34c3f1527eaf8600 |     
   arceb     |         agentpp-4.6.0          | NOK | http://autobuild.buildroot.net/results/61b975d0c398027917f86e1adb19d153b9a6eaa6 |     
   sparc     |      at-spi2-core-2.48.2       | NOK | http://autobuild.buildroot.net/results/6d66fa4aa5ec08895df7abf727b48ac906dd1ae0 |     
 microblaze  |      at-spi2-core-2.48.2       | NOK | http://autobuild.buildroot.net/results/bea3cd42ccd48ba62737a6e68a3fcc88b378ed1e |     
 aarch64_be  |      at-spi2-core-2.48.2       | NOK | http://autobuild.buildroot.net/results/7dbf5678b74c18dc462cd9a13076013de4a98faf |     
  mips64el   |      at-spi2-core-2.48.2       | NOK | http://autobuild.buildroot.net/results/90e94680f58cb9eb5bbe386ee731e486a93cc491 |     
    arm      |           audit-3.1            | NOK | http://autobuild.buildroot.net/results/b409179049bc3aeb745c33fc97c906c651ae04fd |     
   mipsel    |           brltty-6.5           | NOK | http://autobuild.buildroot.net/results/dc6192d36c38285d34f37f981d7712455464a7bc |     
    mips     |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/cd548c0c1845ffa6d1b5bea0f282ef8e7d1e8dc0 | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/ad7eb62c6c058d6b0a810edffac030e0f40cb94e | ORPH
    mips     |         fdk-aac-2.0.2          | NOK | http://autobuild.buildroot.net/results/d455939e2d2bbd4597b7de4a5c2e37226b890a4e |     
    arm      |       flatbuffers-23.3.3       | NOK | http://autobuild.buildroot.net/results/b7c281cef6309db7f9ae1e84a5969a6df10ea77b |     
  riscv64    |           gmp-6.2.1            | NOK | http://autobuild.buildroot.net/results/cd496d0d0da60b3e58944163ea0b414af7fdb9ef | ORPH
   nios2     |  gobject-introspection-1.74.0  | NOK | http://autobuild.buildroot.net/results/b9443825d8c727f1f6fb007aa6d829be77c70469 | ORPH
    or1k     |  gobject-introspection-1.74.0  | NOK | http://autobuild.buildroot.net/results/f8b40da1fce19d03c23fdb091bee89ac64f2d049 | ORPH
 aarch64_be  |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/7ef266f9d1d994cc7f1a6be0a9c2e555ed040046 |     
   armeb     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/f59a43b053865782bf766072e0441d63033d640f |     
powerpc64le  |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/d03bd9ebd2604074b00834e81835fca4e6d9e4c3 |     
   arceb     |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/49c7d27d6387542ae3220131c87f2498a798ba3d |     
   arceb     | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/80014711d3c8630f34e28d2233c1094b51a033ff | ORPH
   mips64    |         host-go-1.19.9         | NOK | http://autobuild.buildroot.net/results/31c0b0d34f9d81a0b8ce904960c5545786c37262 |     
   nios2     |         host-go-1.19.9         | NOK | http://autobuild.buildroot.net/results/6b6a03ff91effffb1a6a595745547d818184cd56 |     
    i686     |         host-go-1.19.9         | NOK | http://autobuild.buildroot.net/results/fb2bc1a8b3a99eaa71d30e949560f9d2dc2cf46b |     
   mipsel    | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/d960eee819f7eb65f3ab133ec729331650448c4a | ORPH
    sh4      | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/8d960e14c8c8ce94ab4048d09969fdb041b80747 | ORPH
    i686     |        host-rust-1.68.2        | NOK | http://autobuild.buildroot.net/results/cb7ea7c61662cb50f71991ad80bde73c3cfb61c0 |     
  aarch64    |        host-rust-1.68.2        | NOK | http://autobuild.buildroot.net/results/faccf921d8b968e18ee060ad398648c1e64eab53 |     
  powerpc    |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/3cd9fff9ac55322d731990560649dadfa4c4c1c1 |     
    arc      |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/1a3cba662a039c55406ffdcb93c27699bdd1fa65 |     
  riscv64    |          libjxl-0.8.1          | NOK | http://autobuild.buildroot.net/results/80cbf94f16e606497cdbee07d14ee7ec61c59acd |     
    arm      |          libmnl-1.0.5          | NOK | http://autobuild.buildroot.net/results/1e1f4a79c062b785d4385511f6b13946eaa843f2 |     
  mips64el   |         libpqxx-7.7.5          | NOK | http://autobuild.buildroot.net/results/ae1a02b5238b650cdc79edb298c398b078882cfc |     
  mips64el   |        libuhttpd-3.14.1        | NOK | http://autobuild.buildroot.net/results/c211ce868831c293840310a242be41d32b7e1c4f |     
 aarch64_be  |          linux-6.3.2           | NOK | http://autobuild.buildroot.net/results/14dc9c8521f03ef73934745fe966dbe645d87e1e | ORPH
  powerpc    |          linux-6.3.2           | NOK | http://autobuild.buildroot.net/results/073a6e80db0e044cbd3a1f3b2848f757c6074bc2 | ORPH
   nios2     |          linux-6.3.2           | NOK | http://autobuild.buildroot.net/results/a859b8178037f13142692ebfd99bac9373f21347 | ORPH
   mipsel    |          linux-6.3.2           | NOK | http://autobuild.buildroot.net/results/92bb8eb738f4801e612d28ccd6c68ea5afa543a1 | ORPH
   mipsel    |          linux-6.3.2           | NOK | http://autobuild.buildroot.net/results/deb08df0247017e1754ac693a8cf62bd1e299311 | ORPH
microblazeel | package/sdl2_net/sdl2_net.m... | NOK | http://autobuild.buildroot.net/results/e49a8a52d9f24ba0be3f550dd1a40b831c496b7a |     
    m68k     | package/sdl2_net/sdl2_net.m... | NOK | http://autobuild.buildroot.net/results/4c1c9f744a375f15c033cbcb52e46f99d43e60f8 |     
 powerpc64   | package/sdl2_net/sdl2_net.m... | NOK | http://autobuild.buildroot.net/results/c3bb14b2c9e6774d1db1910dfd93948899bc2076 |     
   x86_64    | package/sdl2_net/sdl2_net.m... | NOK | http://autobuild.buildroot.net/results/5261627d79c7414e4d2f2aba9455ce1a4b649b28 |     
    arc      |      python-pyicu-2.10.2       | NOK | http://autobuild.buildroot.net/results/ded3344cd351d58a8d9fc9b579a087979c5894c7 |     
    arc      |      python-pyicu-2.10.2       | NOK | http://autobuild.buildroot.net/results/da5a5db6c4cd90454bfd51b17f4dd558e28669ce |     
 powerpc64   |      sdl2_net-legal-info       | NOK | http://autobuild.buildroot.net/results/868369ae1d4f94443c72931cfcda3447f89e0def | ORPH
    sh4a     |          shadow-4.13           | NOK | http://autobuild.buildroot.net/results/d0eeb661d88dc0d5bb3eb02908e0415924f81361 |     
   armeb     |       stress-ng-0.15.07        | NOK | http://autobuild.buildroot.net/results/a09539050cf79b9b408f74f29efa1d698c7b515f |     
  sparc64    |        syslog-ng-4.1.1         | NOK | http://autobuild.buildroot.net/results/d336d04652f918ae263cc655f49e3e0b1e9c82f7 |     
   mips64    |        syslog-ng-4.1.1         | NOK | http://autobuild.buildroot.net/results/2bf0547215ba66eba798fab459ccb84854fcb085 |     
  riscv64    |         uclibc-1.0.43          | NOK | http://autobuild.buildroot.net/results/ef7dcf4be2b2f612db428bee2feaf061ab327498 |     
    arm      | uclibc-ng-test-6790eafe897b... | NOK | http://autobuild.buildroot.net/results/e3215b20e15228960e4893af6e68415f63bbfe4a |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/a57ad2bde0b425282a5917f4a2629fdd9a470166 |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/f2175d24085b95f8ef072b059e4ae427da2f2d88 |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/188958bf48740891cae34acaf09d1a45e6bc15ef |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/f4cc8b6b6142f4e0500cfd7cbb6fcc9b143cbc60 |     
    i686     |      v4l2loopback-0.12.7       | NOK | http://autobuild.buildroot.net/results/41f1bae26ce0d25e154761754bf1a3e7e95bafa1 |     
   mipsel    |        valgrind-3.20.0         | NOK | http://autobuild.buildroot.net/results/04d8f16510ed7ee86ff5e90a3c83a233c064abcc | ORPH
   mips64    |        valgrind-3.20.0         | NOK | http://autobuild.buildroot.net/results/1d9a2475c960260039ff4f0804a71dd1140da5a3 | ORPH
   s390x     |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/1e477ecb88536cd159f84f5288b3c923b48315c6 | ORPH
 microblaze  |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/77c6404dc3c8921806d5bbef8afedf3b549db564 |     
   mipsel    |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/c1f13eadf0159ee70d1af7329cc3b4823c8541ca |     
   sparc     |        zxing-cpp-1.4.0         | NOK | http://autobuild.buildroot.net/results/25f8ab049c66d9f571be9120ed9430b876d36174 |     
  riscv64    |        zxing-cpp-1.4.0         | NOK | http://autobuild.buildroot.net/results/27a57aaff19ddb807662651b85010d45a889b665 |     
   nios2     |        zxing-cpp-1.4.0         | NOK | http://autobuild.buildroot.net/results/56647244693c33834ba7e7ceb2f57cd3c7420453 |     


Classification of failures by reason for 2023.02.x
--------------------------------------------------

               host-qemu-7.2.0 | 2 
                 agentpp-4.6.0 | 1 
               host-runc-1.1.5 | 1 
                lua-cffi-0.2.3 | 1 
                mongodb-4.2.18 | 1 
uclibc-ng-test-6790eafe897b... | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |         agentpp-4.6.0          | NOK | http://autobuild.buildroot.net/results/437bf87ad3876ba493f3a433a38c90e14555a723 |     
  aarch64    |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/04d0ab3058821c03843c82d152ed5df04082da8a |     
   nios2     |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/fe2e5d70096351538b8ece625b0ed07f681a2bdc |     
    arm      |        host-runc-1.1.5         | NOK | http://autobuild.buildroot.net/results/cc644edcd721be19c98c01769beb3c882b445429 |     
    or1k     |         lua-cffi-0.2.3         | NOK | http://autobuild.buildroot.net/results/760f2bd624dee80318269dc67c1882b2f1ab3278 |     
  aarch64    |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/0cb200d0a16cd5666e55bef8f9121c75587548f6 |     
    mips     | uclibc-ng-test-6790eafe897b... | NOK | http://autobuild.buildroot.net/results/4ffc93a4293024d340c4d0fbd6f3022c492409bd |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
