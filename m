Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 426BDC4167B
	for <buildroot@archiver.kernel.org>; Tue,  5 Dec 2023 06:37:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D6F1F61004;
	Tue,  5 Dec 2023 06:37:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D6F1F61004
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Dn4kd4hkRNNM; Tue,  5 Dec 2023 06:37:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 17DBE6100E;
	Tue,  5 Dec 2023 06:37:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 17DBE6100E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 059011BF33C
 for <buildroot@lists.busybox.net>; Tue,  5 Dec 2023 06:37:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9B360415DD
 for <buildroot@lists.busybox.net>; Tue,  5 Dec 2023 06:37:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9B360415DD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id J8zLU-2XAB_L for <buildroot@lists.busybox.net>;
 Tue,  5 Dec 2023 06:37:48 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EE241415DC
 for <buildroot@buildroot.org>; Tue,  5 Dec 2023 06:37:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EE241415DC
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0C8AA40008
 for <buildroot@buildroot.org>; Tue,  5 Dec 2023 06:37:44 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Tue, 05 Dec 2023 06:37:44 -0000
X-GND-Sasl: bot@bootlin.com
Message-Id: <20231205063749.9B360415DD@smtp4.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1701758265; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ZmsCRwzrjw0eE8tPldD1FOt4fcMshMllSGQART7t920=;
 b=cudRVAGUlrx4iuszNIB2XnTsCE8ze3CQpXYmbPEZU7jJ9G4HwlEO2zpt9HvZQie9QG2TcL
 9gz9oqXz9UeoHSomy1Yc98P+mXT2hpjgJMf88VYa3D27vRe1ea8hzKVabnnblbBA28JYEg
 Tj0iw1cF/cEgHeM2CD3ogmuM6H7ARRr8FO77VFvK4gbg8d9j/sPnf4xEMde3R1PtQAcSlT
 ussh34lP7Uw+Pb4oVlU5vHsNIo+hPKNTbqVqkyLxhNfHWdFj40tEnXqmKodQJdNJKfcFSG
 G1ncN2Kb3q9IQLOllwsC6Pr6eHBJEv9hlgahPWgG4Evb2a9f5UjfVvnlxu50bg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=cudRVAGU
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-12-04
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

Autobuild statistics for 2023-12-04
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  |  1  |  4  |  0  |  5  |
  2023.08.x  |  2  |  2  |  0  |  4  |
    master   | 53  | 32  |  0  | 85  |

Classification of failures by reason for master
-----------------------------------------------

check-11970a7e112dfe243a2e6... | 3 
                libressl-3.8.2 | 3 
                 coreutils-9.3 | 2 
                elfutils-0.189 | 2 
              liquid-dsp-1.5.0 | 2 
                       unknown | 2 
                     criu-3.18 | 1 
          cryptodev-linux-1.13 | 1 
           dmraid-1.0.0.rc16-3 | 1 
           ghostscript-10.02.0 | 1 
glibc-2.38-27-g750a45a78390... | 1 
  gobject-introspection-1.76.1 | 1 
                host-go-1.21.4 | 1 
              host-rust-1.71.1 | 1 
        host-sentry-cli-2.20.3 | 1 
libdill-32d0e8b733416208e04... | 1 
                libselinux-3.5 | 1 
               libunwind-1.6.2 | 1 
                   linux-6.6.3 | 1 
              mosquitto-2.0.18 | 1 
                  nginx-1.24.0 | 1 
                    ngrep-1.47 | 1 
                python3-3.11.6 | 1 
               valgrind-3.22.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/c57bb30e6e11e2b2d243f7152a61bf0837b22163 | ORPH
  powerpc    | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/31b98a33fe467ccdd7b86a32eddb1b65de00480b | ORPH
   arceb     | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/1713b90f330053260850b55f00149b6347fbac76 | ORPH
   xtensa    |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/e6127879ec37229dced2ca2122bb854e68b66d36 | ORPH
microblazeel |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/2d4c75942e23da5bbf9ec463ea55603f6a48cd7f | ORPH
 aarch64_be  |           criu-3.18            | NOK | http://autobuild.buildroot.net/results/6027fbe7c6b002e29a1152b1533f75d506665d8f |     
    i686     |      cryptodev-linux-1.13      | NOK | http://autobuild.buildroot.net/results/3ed6ea1a736b7e4ea7860aa77e41c30545caa500 | ORPH
powerpc64le  |      dmraid-1.0.0.rc16-3       | NOK | http://autobuild.buildroot.net/results/674fb6ff0bd76b5653d68aae1c19ededf5953d7d | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/632e13a9120e5317c853924da0b96a8bec917e51 | ORPH
   nios2     |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/1828621133ec5ae11a5a2f957022b0d28dfa45fe | ORPH
    sh4      |      ghostscript-10.02.0       | NOK | http://autobuild.buildroot.net/results/26c1f7dbff21aac460e46a2c1100c2c4889edbf8 |     
  powerpc    | glibc-2.38-27-g750a45a78390... | NOK | http://autobuild.buildroot.net/results/3886c14d19e867c5192dc4c1607ddec846d9feef |     
   nios2     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/4d96456bee0b2191967e45553bfb5a6b1e14b43f | ORPH
  mips64el   |         host-go-1.21.4         | NOK | http://autobuild.buildroot.net/results/85454e12a2aeabff21f94b3cf6ac2801b547128e |     
    i686     |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/0c829d74513ca48ef01a91694f4179e87eef816f |     
    or1k     |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/dde6648b42d201cfecfde457729f510f072815b6 |     
 aarch64_be  | libdill-32d0e8b733416208e04... | NOK | http://autobuild.buildroot.net/results/3347877882775a10e996c21c218afe91e121ca93 |     
    sh4      |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/34b562160a7cc0c3fd61cfd3f636216c3e1064df | ORPH
   mipsel    |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/6eb94c1fa8d2e0eca260058611978f457c039658 | ORPH
   mipsel    |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/a078db1a4bdf54ef6199b284acf0aaf1505d1391 | ORPH
 microblaze  |         libselinux-3.5         | NOK | http://autobuild.buildroot.net/results/b2fff13f777be0c0db8d39716a367c62825283a4 |     
  powerpc    |        libunwind-1.6.2         | NOK | http://autobuild.buildroot.net/results/04cb70fa86241f40e1d5165a207f36ee16f51145 | ORPH
   nios2     |          linux-6.6.3           | NOK | http://autobuild.buildroot.net/results/8c67142c26ab413da5ddf8aa558fc261454b0233 | ORPH
   x86_64    |        liquid-dsp-1.5.0        | NOK | http://autobuild.buildroot.net/results/c0c4169ca4ce117726ee3a91121e6cd6d128b3b9 |     
    arm      |        liquid-dsp-1.5.0        | NOK | http://autobuild.buildroot.net/results/83a72fcf4a06b411f9adc7cbc048a428c7b58c4b |     
    or1k     |        mosquitto-2.0.18        | NOK | http://autobuild.buildroot.net/results/2575c9d220c7069067895b18f01cc59e0b4b6da8 |     
  riscv32    |          nginx-1.24.0          | NOK | http://autobuild.buildroot.net/results/3ffcdd369cc7cbc6b809b85777cd68326b0515b1 |     
  aarch64    |           ngrep-1.47           | NOK | http://autobuild.buildroot.net/results/c21a00391470538288618b3d02bc09149e35134a |     
   x86_64    |         python3-3.11.6         | NOK | http://autobuild.buildroot.net/results/76d6c1bd4cc926da8b886d2bf62f35d2bc4bf87b |     
 aarch64_be  |            unknown             | NOK | http://autobuild.buildroot.net/results/1faf656a8d156f8d0521ff93f2119741505c5a81 |     
  sparc64    |            unknown             | NOK | http://autobuild.buildroot.net/results/07693dbf05bcefa7beb6d125f53e87b8118824f0 |     
  mips64el   |        valgrind-3.22.0         | NOK | http://autobuild.buildroot.net/results/4bac677bafb2f2d6de1235cb81bac20be40038fe | ORPH


Classification of failures by reason for 2023.02.x
--------------------------------------------------

               gupnp-av-0.14.0 | 1 
                haproxy-2.6.15 | 1 
         nftables-python-1.0.7 | 1 
                 raptor-2.0.15 | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  sparc64    |        gupnp-av-0.14.0         | NOK | http://autobuild.buildroot.net/results/91f2fabe39b0aadf24ddc12daf2632920dfb072a |     
   sh4eb     |         haproxy-2.6.15         | NOK | http://autobuild.buildroot.net/results/5872400339c19971425be3004812370903bfe67f |     
 aarch64_be  |     nftables-python-1.0.7      | NOK | http://autobuild.buildroot.net/results/2c9d9e4b10d191679610dbe6b86fa04544c7336b |     
 powerpc64   |         raptor-2.0.15          | NOK | http://autobuild.buildroot.net/results/53166a380b2f8e93b0c2e09dfdd5f69c712cbf32 | ORPH


Classification of failures by reason for 2023.08.x
--------------------------------------------------

              host-rust-1.71.1 | 1 
                       unknown | 1 


Detail of failures for 2023.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   s390x     |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/5964833287f998db0a9ead80f93aa6e69d4e07da |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.net/results/35558457437a66f5d4824e1a0ec4ed690c6b451d |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
