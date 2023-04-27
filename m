Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C3CEC77B73
	for <buildroot@archiver.kernel.org>; Thu, 27 Apr 2023 05:45:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9BED060BB2;
	Thu, 27 Apr 2023 05:45:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9BED060BB2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SwIdgk3HNjCM; Thu, 27 Apr 2023 05:45:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 90E7360BC8;
	Thu, 27 Apr 2023 05:45:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 90E7360BC8
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2A8011BF5A6
 for <buildroot@lists.busybox.net>; Thu, 27 Apr 2023 05:45:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E06D960BC8
 for <buildroot@lists.busybox.net>; Thu, 27 Apr 2023 05:45:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E06D960BC8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8mio5q07gaeX for <buildroot@lists.busybox.net>;
 Thu, 27 Apr 2023 05:45:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 313E360BB2
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 313E360BB2
 for <buildroot@buildroot.org>; Thu, 27 Apr 2023 05:45:44 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 470C82000B
 for <buildroot@buildroot.org>; Thu, 27 Apr 2023 05:45:42 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Thu, 27 Apr 2023 05:45:42 -0000
Message-Id: <20230427054546.E06D960BC8@smtp3.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1682574342; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=KqeDv2jMxfNj63tVvHraJmgD4rxhniA+/PYjJ8iJAmo=;
 b=EPwu9XgpGCHG2FEjkjhVR72XAC8ORLP9lg+mEjPmjmzg+2sI7CbbAclQ9h9hpD86GToRBp
 Jv0uHnQsASEFMMXVahzur0EBWRRes60pxWuXNfFyX29Bn6ZrkxNyAd8px3klaV8bYzy+Bw
 drOcZu7jDPubETgRVmPzcdHEKwbeFGmJS0Jl4O+PkNqG8Aaj91nO/hYohQu5vn2boi80yM
 rxFv6o/KHvtLHsp0hUuzk65FKy4DIvBYa52sjqOtAd757LfesoJAqfmNLWIpGfMMHLmCz6
 v/ffPjMIgwoY1/Kp8Rk2I0Gi8yRcsk7YnE4ty3VLM/mpkHqVEU+Bh+C41uquyQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=EPwu9Xgp
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-04-26
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

Autobuild statistics for 2023-04-26
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  |  5  |  4  |  0  |  9  |
    master   | 63  | 37  |  1  | 101 |

Classification of failures by reason for master
-----------------------------------------------

               host-qemu-7.2.0 | 4 
                       unknown | 3 
                 agentpp-4.6.0 | 2 
        ltp-testsuite-20230127 | 2 
                bpftool-v7.1.0 | 1 
                elfutils-0.186 | 1 
             fontconfig-2.13.1 | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
         gobject-introspection | 1 
  gobject-introspection-1.72.0 | 1 
                haveged-1.9.18 | 1 
            host-binutils-2.37 | 1 
            host-binutils-2.38 | 1 
            host-binutils-2.39 | 1 
         host-gcc-final-10.4.0 | 1 
                 host-gdb-12.1 | 1 
                host-go-1.19.8 | 1 
              host-rust-1.68.2 | 1 
host-sunxi-tools-1.4.2-168-... | 1 
              libgcrypt-1.10.1 | 1 
                libglvnd-1.4.0 | 1 
                  linux-6.1.14 | 1 
                   perl-5.36.0 | 1 
                    qemu-7.2.0 | 1 
rtl8189fs-ed6741b52bc998875... | 1 
             stress-ng-0.15.04 | 1 
              strongswan-5.9.8 | 1 
                 uclibc-1.0.43 | 1 
                    volk-2.5.2 | 1 
                xenomai-3.0.10 | 1 
                     znc-1.8.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    sh4      |         agentpp-4.6.0          | NOK | http://autobuild.buildroot.net/results/7373d3bb9928dff2a16f165a238854fb8561c53f |     
  aarch64    |         agentpp-4.6.0          | NOK | http://autobuild.buildroot.net/results/f6e97a6467588ebb8577ad34d3938abb1eacb036 |     
   s390x     |         bpftool-v7.1.0         | NOK | http://autobuild.buildroot.net/results/4477d4e0e2f84f769b2442534a9aafc2b82e90e0 |     
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/cd8675c044846ad2e83bfb2522ce5f797b1a09bb | ORPH
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/f43044c0cb06a99c531d27290fa6613555db2891 | ORPH
   mips64    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/eef956ffb1c17f2133326bb369f71d76cb7f037d |     
   armeb     |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/5dbefa8a613bab8ebd5cd49b2cd6bec82aaae9d6 |     
   mipsel    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/807cfb7995be2412dd5ec1ccb11337bea9d98c92 | ORPH
    arc      |         haveged-1.9.18         | NOK | http://autobuild.buildroot.net/results/5e3eb061f377ac2f46e8dba6ea6720a97bfb7f75 |     
   s390x     |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/9dc5627f97ad2dbe45be38ea658bb2c9c848c88b |     
   s390x     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/493a59d1f52b950dcc8523d8bfe5b1be3f0c180b |     
   mips64    |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/e2311a4d676a9d11b760fe0e548d0ddd89ba8a38 |     
   sparc     |     host-gcc-final-10.4.0      | NOK | http://autobuild.buildroot.net/results/57fcf1be7e46f2cf2c213b770c4568348ccb2575 |     
   sparc     |         host-gdb-12.1          | NOK | http://autobuild.buildroot.net/results/f3ec7d6c7929163c52304a7a6e29213506195f9d | ORPH
   nios2     |         host-go-1.19.8         | NOK | http://autobuild.buildroot.net/results/bfea3219934d2a18e7259959c7a1ced037ca1287 |     
  sparc64    |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/1ad91bda85eede7e2f1372606b56829cbcc6d956 |     
    sh4a     |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/a8951c3e22f9b858915b24c0d974b82435fd5cc2 |     
   xtensa    |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/6717123d1b793261b1c2bf39b4cfff5f30f82216 |     
   mipsel    |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/9e9f1ff130d58c4bf81e61959866cfb56b40a3ce |     
    mips     |        host-rust-1.68.2        | NOK | http://autobuild.buildroot.net/results/64580a3eb3c194fb5a489d09c4c0d8cc0a172238 |     
    arm      | host-sunxi-tools-1.4.2-168-... | NOK | http://autobuild.buildroot.net/results/2677c69ac34642a7a501230e1dd22b193db0899d |     
    i586     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/d8b370b2ead085818250e6c01fd43b0ef907cbf0 | ORPH
   arceb     |         libglvnd-1.4.0         | NOK | http://autobuild.buildroot.net/results/14644a80cd0157a86147935ef006a5345179334a | ORPH
   mips64    |          linux-6.1.14          | NOK | http://autobuild.buildroot.net/results/918d8a25e14f86a9d10271c71acd0de357e0b69d | ORPH
  aarch64    |     ltp-testsuite-20230127     | NOK | http://autobuild.buildroot.net/results/afd6372f2a65e22212cf0067a2b2f308d3d20727 |     
 aarch64_be  |     ltp-testsuite-20230127     | NOK | http://autobuild.buildroot.net/results/f642e8152b1cec956a2cc3d0d78e77e25e3dabaa |     
   armeb     |          perl-5.36.0           | NOK | http://autobuild.buildroot.net/results/b22fef47389a8f6350795c3d29d500e9022e7ff4 |     
  riscv32    |           qemu-7.2.0           | NOK | http://autobuild.buildroot.net/results/4e837809bbdcbaaf1913035eeadee9f0a7ec2f33 |     
  sparc64    | rtl8189fs-ed6741b52bc998875... | NOK | http://autobuild.buildroot.net/results/3c73ddd33f4be84629e11a7044eb51970d0db4b7 |     
microblazeel |       stress-ng-0.15.04        | NOK | http://autobuild.buildroot.net/results/6e50df78d869ef50abd6a04f28e6d39dd375a373 |     
   xtensa    |        strongswan-5.9.8        | NOK | http://autobuild.buildroot.net/results/13631f069200cd8d4d7d3ba8f7f73ffbe4482865 |     
    m68k     |         uclibc-1.0.43          | NOK | http://autobuild.buildroot.net/results/f4897829e727d28a441aa15efff1d1b76652bb61 |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.net/results/0f09ecad590ed1e70b971da00b01c0b52d349519 |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/1a963a3f27822b8864a850668c1be54df7cd6730 |     
powerpc64le  |            unknown             | NOK | http://autobuild.buildroot.net/results/ae0ffcd9d1989f40771eeac6d37d91781e3fb34d |     
  powerpc    |           volk-2.5.2           | NOK | http://autobuild.buildroot.net/results/f04c055ca404e8dd0fbcd88eea39a65931c6844e |     
powerpc64le  |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/220627a3d1eb14262d67489e3218f4e349fff052 |     
    i686     |           znc-1.8.2            | NOK | http://autobuild.buildroot.net/results/34917ac15a885e9afc89962b3908a040413429a3 |     


Classification of failures by reason for 2023.02.x
--------------------------------------------------

                host-go-1.19.8 | 1 
               host-qemu-7.2.0 | 1 
                  ntpsec-1.2.2 | 1 
                       unknown | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |         host-go-1.19.8         | NOK | http://autobuild.buildroot.net/results/ec5a017b18c44972bea7aae6a0d4efa532b3b713 |     
  riscv32    |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/5325db1e9b8b50729bd4929e6dcadc35805962e4 |     
    m68k     |          ntpsec-1.2.2          | NOK | http://autobuild.buildroot.net/results/b481aae6e52e5a2563a369d33074735ed6632af9 | ORPH
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/b373fe7e1309b8a614d9ea63b484a25b118a5f75 |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
