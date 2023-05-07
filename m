Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C041EC77B75
	for <buildroot@archiver.kernel.org>; Sun,  7 May 2023 05:35:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 240A860C18;
	Sun,  7 May 2023 05:35:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 240A860C18
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JOs9McDoosQh; Sun,  7 May 2023 05:35:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3B29160BD3;
	Sun,  7 May 2023 05:35:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3B29160BD3
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 72DD01BF32B
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 05:35:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 443C94187C
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 05:35:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 443C94187C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vmxK7bzigNDi for <buildroot@lists.busybox.net>;
 Sun,  7 May 2023 05:35:26 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EA2E94187B
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EA2E94187B
 for <buildroot@buildroot.org>; Sun,  7 May 2023 05:35:25 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id D9A441BF206
 for <buildroot@buildroot.org>; Sun,  7 May 2023 05:35:22 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sun, 07 May 2023 05:35:22 -0000
Message-Id: <20230507053528.443C94187C@smtp4.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1683437722; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=vatHSqdsBN3xZW5FESZJlAzmJxtTLuMEImE3byqFuAg=;
 b=C+hhDeIeAeV8EeBjYwg++fQn5Dhxmc3umonPggV1yHpGVjbahiaF4NPbTb01xfAQzpuskw
 JH7AB/UL2lIRfO4eIkE3tHrSFNhv/ElmqjU+f6yethZ5DvVLtp5v6rwlnYWyJTS5vS8MGO
 LPIyBfYwW+6J0x3VrqX5r7HT47/N5xKb9riMSqcsgs7FHrxHimNu6ZDf/fJhXTBzADzK05
 a600xUJIKhQWxa10n3Kf5NBudS2RA5APRNGsDOxiAG2q3cSxKdgKkKYmFQUS6ZlIwgs7NC
 yigb8KfWRypPC6H/O9YXed/VmN8a56DKkk1ODQ6G8tLNUg21y/fY1hl1k2L5GA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=C+hhDeIe
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-05-06
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

Autobuild statistics for 2023-05-06
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  |  3  |  0  |  0  |  3  |
    master   | 16  | 30  |  0  | 46  |

Classification of failures by reason for master
-----------------------------------------------

              host-rust-1.68.2 | 5 
               host-qemu-7.2.0 | 4 
                   linux-6.3.1 | 3 
                host-go-1.19.9 | 2 
             batman-adv-2022.3 | 1 
             dahdi-linux-3.2.0 | 1 
                elfutils-0.186 | 1 
                  faad2-2.10.1 | 1 
               fftw-quad-3.3.8 | 1 
            host-binutils-2.38 | 1 
         host-gcc-final-11.3.0 | 1 
               host-runc-1.1.7 | 1 
              libgcrypt-1.10.1 | 1 
               libglib2-2.76.1 | 1 
                  ntp-4.2.8p15 | 1 
                 opensc-0.22.0 | 1 
                 openssh-9.3p1 | 1 
                   shadow-4.13 | 1 
                       unknown | 1 
                 wolfssl-5.5.3 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sh4eb     |       batman-adv-2022.3        | NOK | http://autobuild.buildroot.net/results/22913754065b4f652495301971145a1f62c02554 |     
 microblaze  |       dahdi-linux-3.2.0        | NOK | http://autobuild.buildroot.net/results/52841c706715c87576fb9f09af9a7b894cdad030 |     
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/cbe3e9a5fed9cf08b355b788553fe33edfd8a7dc | ORPH
    sh4a     |          faad2-2.10.1          | NOK | http://autobuild.buildroot.net/results/ddc00d214927ca1a29e09a1f5729cc0b653710ae |     
powerpc64le  |        fftw-quad-3.3.8         | NOK | http://autobuild.buildroot.net/results/4ab2c745cc144fe5492e76f9e6dcea87c9c6bf93 | ORPH
    m68k     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/6b9fd4ce3ba031b26144e81ae9ab7e3798b6c5c3 |     
  aarch64    |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/73c0383eda896b84833de435b4f49adae1d5d89d |     
    i686     |         host-go-1.19.9         | NOK | http://autobuild.buildroot.net/results/29ccd4d0b0e62238f9700d38c31191d48c34495a |     
  mips64el   |         host-go-1.19.9         | NOK | http://autobuild.buildroot.net/results/0a06744cc7b465baea8f2c8269f7719454b934f6 |     
microblazeel |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/0f2619f2b9348225e66e27490cd77d9b8603fd02 |     
   nios2     |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/a5e3561b58287ebcaeb59f6c5be77484ec7aa9fb |     
  aarch64    |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/88e09b53002ccdbbe3ce310d99225c65dd953747 |     
powerpc64le  |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/5f5f642701c814c2461f7c613a8d895fcb4daae9 |     
    arc      |        host-runc-1.1.7         | NOK | http://autobuild.buildroot.net/results/2c7a10d56c004d0335d8f81198beff05d1a6153c |     
  aarch64    |        host-rust-1.68.2        | NOK | http://autobuild.buildroot.net/results/f51e36cffb704aa2d30b89971672937aea7df7f4 |     
powerpc64le  |        host-rust-1.68.2        | NOK | http://autobuild.buildroot.net/results/92e8d978e1f41b2cfab036d1646358b411f1cc6d |     
  sparc64    |        host-rust-1.68.2        | NOK | http://autobuild.buildroot.net/results/ee9175dce53b421ef345b85d6f74da6f20453cbd |     
  aarch64    |        host-rust-1.68.2        | NOK | http://autobuild.buildroot.net/results/e2ed931941386edb592127d5299c7477811b70c8 |     
   mipsel    |        host-rust-1.68.2        | NOK | http://autobuild.buildroot.net/results/9f603dfd6d67cbd2f206c097f0dd3f63949d32c8 |     
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/10ed2eeee47d1df2f3dadfa38f21989fe23aded1 | ORPH
   arceb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/a6a9d922dcec68c3cda401520b193a5e54a6b940 |     
    m68k     |          linux-6.3.1           | NOK | http://autobuild.buildroot.net/results/aa9352f384ae14371d3f398b4616b97fa58304a4 | ORPH
  mips64el   |          linux-6.3.1           | NOK | http://autobuild.buildroot.net/results/00b3fc141e87912a11dc4bcb9b1dd42d49e65f67 | ORPH
   arceb     |          linux-6.3.1           | NOK | http://autobuild.buildroot.net/results/915de837711512a1f70f8569b83cd2538848afa0 | ORPH
  riscv64    |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/267c723ed9d3b1d8c8c7ffda91e8e76844e2b1e0 | ORPH
   x86_64    |         opensc-0.22.0          | NOK | http://autobuild.buildroot.net/results/508df193bbc6064dd3bdd95263375bcb299357f1 |     
    m68k     |         openssh-9.3p1          | NOK | http://autobuild.buildroot.net/results/e85587cecadf761d324a96aa145344cf33d47d70 | ORPH
    mips     |          shadow-4.13           | NOK | http://autobuild.buildroot.net/results/913582d3d6c6611efed6306ca8d4dbf5c043e4a4 |     
    m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/7aacf6f9aa897cdce99f56b822e4ac7c284e0700 |     
  mips64el   |         wolfssl-5.5.3          | NOK | http://autobuild.buildroot.net/results/e749bca25311d88aaf30032a5adfb022df592969 |     


Gitlab CI results for 2023-05-06
================================


-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
