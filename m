Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 654F2C433EF
	for <buildroot@archiver.kernel.org>; Fri, 25 Feb 2022 09:29:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E6F2E831EF;
	Fri, 25 Feb 2022 09:29:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oQh8zcU2k0ZL; Fri, 25 Feb 2022 09:29:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EEC96831A0;
	Fri, 25 Feb 2022 09:29:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 455FB1BF395
 for <buildroot@lists.busybox.net>; Fri, 25 Feb 2022 09:29:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 348C660B57
 for <buildroot@lists.busybox.net>; Fri, 25 Feb 2022 09:29:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id B7lEmemSCe36 for <buildroot@lists.busybox.net>;
 Fri, 25 Feb 2022 09:29:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 223CA60B4E
 for <buildroot@buildroot.org>; Fri, 25 Feb 2022 09:29:31 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 3183D40005
 for <buildroot@buildroot.org>; Fri, 25 Feb 2022 09:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1645781369; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ZvorKHoJ05Mr5nOZSHnUbjeRad2cv1QzkK958OpkyQc=;
 b=Brr1L3fgCym9dRkJ5yuNUHlMagrW2o5Ul1LvDJUQ6IrR8T9BBLzxaK5vx2ACF5NHLHlcI4
 h5ya0/PiEx/gEaJL/Y5NGKvoNGcVRg4+pd2nXO0RgEB3eo/mPD3g14Nf1stnhIKF+GoNrZ
 j2FE5jS3X3/Iol36rQWvUimqNLE82p3YRUGqd7c2TPdqrY6M9/tYBdDx1Ynb15tlSK9Z1h
 Y7zw4b6WHxzqPu41WejXEUeePuyXXrG8bm5/GS8p9fH2qhsZRpjqbMA1MMQwwpVZYxDfln
 452dtKgYJ9a9+VlqG/Yg7XDzW9OOPZnOJQpys26GbMZDzG7yZmWxtSz3oFnHRA==
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Fri, 25 Feb 2022 09:29:29 -0000
Message-Id: <20220225092934.348C660B57@smtp3.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-02-24
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

Autobuild statistics for 2022-02-24
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 44  |  2  |  1  | 47  |
  2021.11.x  | 11  |  1  |  0  | 12  |
    master   | 40  | 29  |  1  | 70  |

Classification of failures by reason for master
-----------------------------------------------

           host-libselinux-3.3 | 10
                       frr-8.1 | 4 
             bluez5_utils-5.63 | 2 
                bpftool-v6.7.0 | 2 
                       unknown | 2 
                    bat-0.19.0 | 1 
                           frr | 1 
               gocryptfs-2.2.1 | 1 
               pulseview-0.4.2 | 1 
         python-greenlet-1.1.2 | 1 
                safeclib-3.7.1 | 1 
sconeserver-6b932d7d8dbb700... | 1 
                sg3_utils-1.47 | 1 
tovid-87c676f4aadb7303d2cd9... | 1 
           wpa_supplicant-2.10 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/89a5355369b2dbcecca5542e3bea7f22d6844d35 |     
    i586     |       bluez5_utils-5.63        | NOK | http://autobuild.buildroot.net/results/8075d14919639b89337d04ee5a324b4c69d2e079 |     
    arm      |       bluez5_utils-5.63        | NOK | http://autobuild.buildroot.net/results/83eaeb3863040645409f5787fdbdde79385c5257 |     
    arm      |         bpftool-v6.7.0         | NOK | http://autobuild.buildroot.net/results/aae772f1cfb16516a57f310c4f022e80a2a8d65e |     
    arm      |         bpftool-v6.7.0         | NOK | http://autobuild.buildroot.net/results/4ce51ced26783c52766a002ac75b42262eace45e |     
    arc      |              frr               | TIM | http://autobuild.buildroot.net/results/6fb124cad6c753170b6e8a3d495158f1ce864e6e |     
   nios2     |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/6c0ff16d28db81384efdd6cde90346fe5511bdb9 |     
  riscv64    |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/42856dfc5119f00e04872eb8893a96431c300ced |     
 powerpc64   |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/8c5ef3b81e313dcfa82750ae9e9d6eae8e8755aa |     
  nds32le    |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/daf373b337b64e72c2b94d3f4a5059d07ac7a5ac |     
    i586     |        gocryptfs-2.2.1         | NOK | http://autobuild.buildroot.net/results/310216a1b034138796c488565ca754247f04465f |     
   mipsel    |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/0d18af8c87dd6f1b38cdaa4e9df934d72c257b15 |     
    arm      |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/6c06ffef722b526cc80fdda4b5e3ef360d4fe063 |     
    m68k     |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/79e12d8bacfcae8e371b966d33bd86549566f82c |     
   xtensa    |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/be35833e5be937803b52c3114c7ffa30651b99ba |     
    arc      |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/641837bfd850c703f560adb30db6dd29cb55667f |     
  riscv64    |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/5ce41a0aded979623b15ecdde86a5326464039a3 |     
microblazeel |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/dc6362d21593a01baca3d3a0cead41bb260bb28e |     
    arm      |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/0162060ee082f7a17c98db61b0cbc7d870151bf0 |     
  riscv32    |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/974a739b1cd40e867d9d2598d8037d43127f7fe1 |     
  powerpc    |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/8a196826b35913d1fb005dfc5191a83c38cac286 |     
   x86_64    |        pulseview-0.4.2         | NOK | http://autobuild.buildroot.net/results/a439a56a1e78cd6eef3f18ac277e4125ebd0ce05 |     
   x86_64    |     python-greenlet-1.1.2      | NOK | http://autobuild.buildroot.net/results/151e338b009b3b560a259449f962b00df075e003 |     
   sparc     |         safeclib-3.7.1         | NOK | http://autobuild.buildroot.net/results/6c2685460fdc311f5a65476d7e4e5e57a9044c0c |     
    arm      | sconeserver-6b932d7d8dbb700... | NOK | http://autobuild.buildroot.net/results/e4f0cfac09027dd59adf133d61d9952ebe266373 |     
    m68k     |         sg3_utils-1.47         | NOK | http://autobuild.buildroot.net/results/4d5a001e6eaf099c55e3926c62bc790c6af9c419 |     
  mips64el   | tovid-87c676f4aadb7303d2cd9... | NOK | http://autobuild.buildroot.net/results/c5e4a7e2e290ad0d3dd9153398c30f3298fcbcc5 |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/96d4d9c9047c36ada6b335848e931143c5939c6b |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/938519241d02227df4989a159fd467fb0e3794b6 |     
    arm      |      wpa_supplicant-2.10       | NOK | http://autobuild.buildroot.net/results/12b757e64fea5bfb0859fcbb35110a6225364c78 |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

  gobject-introspection-1.64.1 | 1 
        host-sentry-cli-1.57.0 | 1 
                   python-lxml | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/ee65c707ad9e0f5a4c77f364491ddab3ad81ce91 | ORPH
  aarch64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/ed2482fb399f37066781d97306650fee894ec5f6 |     
    m68k     |          python-lxml           | TIM | http://autobuild.buildroot.net/results/f3790e8b9d37bb913df5d3dbf1b1d268541096bd |     


Classification of failures by reason for 2021.11.x
--------------------------------------------------

                 wavemon-0.9.4 | 1 


Detail of failures for 2021.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 powerpc64   |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/b852b28a56209dd81a0385e83af1ac5500a8cd6d |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
