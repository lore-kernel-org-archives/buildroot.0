Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A17B2C433F5
	for <buildroot@archiver.kernel.org>; Sun, 20 Mar 2022 08:22:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1010B81765;
	Sun, 20 Mar 2022 08:22:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tlBqhoF2yxq4; Sun, 20 Mar 2022 08:22:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F0C0E819D2;
	Sun, 20 Mar 2022 08:22:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 777B61BF5DA
 for <buildroot@lists.busybox.net>; Sun, 20 Mar 2022 08:22:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6612060B1F
 for <buildroot@lists.busybox.net>; Sun, 20 Mar 2022 08:22:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XaNe8L6Acwdu for <buildroot@lists.busybox.net>;
 Sun, 20 Mar 2022 08:21:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 833F160687
 for <buildroot@buildroot.org>; Sun, 20 Mar 2022 08:21:59 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 9EAF1E0009
 for <buildroot@buildroot.org>; Sun, 20 Mar 2022 08:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1647764516; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=T28mN0v0vKF6zUoeZo+xoCze/NigIUlGd5+cG+3jvdg=;
 b=VrImXmg47XsJjFZ+A9EsxP8JCv/sIThj5mTOqGn8RymCRrcpz3YWk07Nqh9rhaPYrG8R4F
 7ktlL4YGmB48qQXLxwQD2vkM/lTpHHvv2H7JzwIT3W2kX8DYAv+GjxsrBHWv8MAoFI9biu
 z+EA+1zBScDOe1LP9ZQRsDcWQ+s3+MOV5+NbWWkR4sB6fLDQh8I69JiNoskZLjVKzIvVk4
 d2BgOBqmpSTvmljzgViqNthhwTfFOXqoqlAwCS39uQw3TcNR2dPKUht99TG+tmPOuNCN5j
 n/aaWxMiLMZFyNsYBwdF8nU7LAPhJCjlzlM08i4B2lDFA8Cz6LlCJXTUwwQWMw==
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sun, 20 Mar 2022 08:21:56 -0000
Message-Id: <20220320082201.6612060B1F@smtp3.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-03-19
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

Autobuild statistics for 2022-03-19
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 50  | 10  |  0  | 60  |
  2021.11.x  | 21  |  3  |  0  | 24  |
  2022.02.x  | 15  |  6  |  0  | 21  |
    master   | 49  | 37  |  2  | 88  |

Classification of failures by reason for master
-----------------------------------------------

                  bind-9.16.26 | 10
                  pango-1.50.5 | 6 
                    ola-0.10.8 | 4 
  libnetfilter_conntrack-1.0.9 | 2 
                libscrypt-1.22 | 2 
                       libuwsc | 2 
                    ruby-3.1.0 | 2 
                 wavemon-0.9.4 | 2 
                    bird-2.0.8 | 1 
                       frr-8.1 | 1 
             host-pango-1.50.5 | 1 
                   libiio-0.23 | 1 
librtlsdr-ed0317e6a58c09887... | 1 
                nodejs-14.18.3 | 1 
               protozero-1.7.1 | 1 
      qt5webkit-5.212.0-alpha4 | 1 
                       unknown | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |          bind-9.16.26          | NOK | http://autobuild.buildroot.net/results/f73421f8494b7336ab065d14a649027e5ec81b97 | ORPH
   x86_64    |          bind-9.16.26          | NOK | http://autobuild.buildroot.net/results/b03de9fc644fdd43e1a288fea4caf9e9e45c0f18 | ORPH
  sparc64    |          bind-9.16.26          | NOK | http://autobuild.buildroot.net/results/5049b91b1449bfcf15786da78f177a3025907a3e | ORPH
   x86_64    |          bind-9.16.26          | NOK | http://autobuild.buildroot.net/results/37aa63069cb8b40a195d784d62e69da72408abb2 | ORPH
  aarch64    |          bind-9.16.26          | NOK | http://autobuild.buildroot.net/results/4059a9b5150d076a5263bdbae2ded5a46e15bea0 | ORPH
   nios2     |          bind-9.16.26          | NOK | http://autobuild.buildroot.net/results/99ab62b09f07b0c6d20a6cacb67c515eb3460c5f | ORPH
microblazeel |          bind-9.16.26          | NOK | http://autobuild.buildroot.net/results/88783438b5033ce799d57ac8bd1c1be30d51fc72 | ORPH
  sparc64    |          bind-9.16.26          | NOK | http://autobuild.buildroot.net/results/9a6afa236590ef26487dec83428224851f46acaf | ORPH
    arm      |          bind-9.16.26          | NOK | http://autobuild.buildroot.net/results/a1187b65d05985052f20fdcfc02d651d63f7746b | ORPH
  aarch64    |          bind-9.16.26          | NOK | http://autobuild.buildroot.net/results/43acf642540997c3500d417398f1062cda62ada6 | ORPH
  mips64el   |           bird-2.0.8           | NOK | http://autobuild.buildroot.net/results/ee48850228f0a47b477edceee26c23fbdd318479 |     
  mips64el   |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/1180cfe0aca4f74fe9a8e925da7d2c8283f57967 |     
    arm      |       host-pango-1.50.5        | NOK | http://autobuild.buildroot.net/results/9ac311ca0df3a12fd44b112e9e2db50b7ae43780 | ORPH
    arm      |          libiio-0.23           | NOK | http://autobuild.buildroot.net/results/3efe03f86d27dcfa49f9f2e94c9872396196305a |     
microblazeel |  libnetfilter_conntrack-1.0.9  | NOK | http://autobuild.buildroot.net/results/f060093f15ee5fe21a31a632e9539ed46c95f8ef |     
  powerpc    |  libnetfilter_conntrack-1.0.9  | NOK | http://autobuild.buildroot.net/results/a807364c9fd6b6a3c71ec867be4594bb0bf984ab |     
    arm      | librtlsdr-ed0317e6a58c09887... | NOK | http://autobuild.buildroot.net/results/457fae9a8b60905e11e2a2d10b4961c7266a07e9 |     
   xtensa    |         libscrypt-1.22         | NOK | http://autobuild.buildroot.net/results/c5c18abc977300c83c267562b572007bc60f3a6c |     
microblazeel |         libscrypt-1.22         | NOK | http://autobuild.buildroot.net/results/3d9ccb572a9edc947edf1c9a593f460cd9501dba |     
  riscv64    |            libuwsc             | TIM | http://autobuild.buildroot.net/results/b3c846038c86c6680b6b640628a3a29169177326 |     
  riscv32    |            libuwsc             | TIM | http://autobuild.buildroot.net/results/d0fb3e1414561f6ab5ab991c17078bf127d46118 |     
   x86_64    |         nodejs-14.18.3         | NOK | http://autobuild.buildroot.net/results/ec2ca9be9303b2b2a8e4da1462e627875e36d9b2 |     
  riscv64    |           ola-0.10.8           | NOK | http://autobuild.buildroot.net/results/e83022b76666f62ea4da2e536c46b8d519a1becc |     
  aarch64    |           ola-0.10.8           | NOK | http://autobuild.buildroot.net/results/23db74786717b20363019bf3d8f13b5a5e7c8896 |     
   x86_64    |           ola-0.10.8           | NOK | http://autobuild.buildroot.net/results/bba3d0ccc115d5be96c0b58167ef28e0aec1a473 |     
   sparc     |           ola-0.10.8           | NOK | http://autobuild.buildroot.net/results/5f1c16bbecc6766867449f9ad3aeca1b20e33261 |     
  riscv64    |          pango-1.50.5          | NOK | http://autobuild.buildroot.net/results/1a671295d8a5e383eb086d5898f689263c17221b | ORPH
  powerpc    |          pango-1.50.5          | NOK | http://autobuild.buildroot.net/results/59d7e29cbc545c4c8f85ea332f5aace4b3c22580 | ORPH
  mips64el   |          pango-1.50.5          | NOK | http://autobuild.buildroot.net/results/8835d9372a43a51711432bfeb4e3d7dcb71fe5bd | ORPH
  aarch64    |          pango-1.50.5          | NOK | http://autobuild.buildroot.net/results/35b5f26bbefa89be0d2a4c3d8c21f372998016ee | ORPH
  sparc64    |          pango-1.50.5          | NOK | http://autobuild.buildroot.net/results/243156f3572981fab67cf41515482023c12da677 | ORPH
    arc      |          pango-1.50.5          | NOK | http://autobuild.buildroot.net/results/345aa406e6cbf394197b0ae539716206497d271c | ORPH
  mips64el   |        protozero-1.7.1         | NOK | http://autobuild.buildroot.net/results/f5d8f23072ac36fcc43045ad5a1956e93cb5da74 |     
    i686     |    qt5webkit-5.212.0-alpha4    | NOK | http://autobuild.buildroot.net/results/d5f025aa42499d2f59ba66a883a0a31eca9ffe4a |     
  riscv64    |           ruby-3.1.0           | NOK | http://autobuild.buildroot.net/results/9cd3ae68e0fd4457f6a525d21739e868407aad73 |     
  riscv64    |           ruby-3.1.0           | NOK | http://autobuild.buildroot.net/results/3ed37eaf9ee59a7c85d2aca76c2b62e129e8dfa5 |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/8fa2da87e4de76240f888c021ec007aa9250f7ea |     
  sparc64    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/2786645f766ea2f92479dfc31615ae84e2a21e14 |     
   mipsel    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/a9c974998ee80ab2f580e72c5ac3f64d541d6cbd |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

                       unknown | 3 
        host-sentry-cli-1.57.0 | 2 
               apcupsd-3.14.14 | 1 
              asterisk-16.21.1 | 1 
                proftpd-1.3.6e | 1 
         python-twisted-22.1.0 | 1 
         rabbitmq-server-3.8.2 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/59944118a546782032134636cfb8081b4164f471 |     
   x86_64    |        asterisk-16.21.1        | NOK | http://autobuild.buildroot.net/results/7ced5faa5f8c6edf7b4d080a0cda56e4b41b0ea6 |     
powerpc64le  |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/f0f845029558e0b9022bac51caefb84235b7ad51 |     
   x86_64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/447cf3c73d08a843c9e0b9b91d66a5d2afe88d1c |     
   sparc     |         proftpd-1.3.6e         | NOK | http://autobuild.buildroot.net/results/aeac1f9c897ed70486620c4610143d1d01d6a711 |     
    arm      |     python-twisted-22.1.0      | NOK | http://autobuild.buildroot.net/results/c4e1144344865be25ca54b8d0e24c4aa14373891 |     
  aarch64    |     rabbitmq-server-3.8.2      | NOK | http://autobuild.buildroot.net/results/395c9dd86f079b613e48633e44f741b319aa8d17 |     
 aarch64_be  |            unknown             | NOK | http://autobuild.buildroot.net/results/f6aa641f37482d6f036b29e5fb3aa12413a31423 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/b3bc33268530b8ddd5c8b7bc71bd712fec4710c8 |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/17995038f396104c0285c28d323fa544a3ba8351 |     


Classification of failures by reason for 2021.11.x
--------------------------------------------------

               apcupsd-3.14.14 | 1 
                suricata-6.0.4 | 1 
                 wavemon-0.9.4 | 1 


Detail of failures for 2021.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/8ede1a96e8dbb37771319c103d1ed786b0016eba |     
    arm      |         suricata-6.0.4         | NOK | http://autobuild.buildroot.net/results/0737d9f39dac2675ec977cf56d168e8e674b84d9 |     
    arm      |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/54f84971e6b5a7c5423d9e4b8ba0aa40ca44a4f0 |     


Classification of failures by reason for 2022.02.x
--------------------------------------------------

                    bird-2.0.8 | 1 
                mongodb-4.2.18 | 1 
                    mpd-0.23.5 | 1 
               poppler-21.12.0 | 1 
                       unknown | 1 
                 wavemon-0.9.4 | 1 


Detail of failures for 2022.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |           bird-2.0.8           | NOK | http://autobuild.buildroot.net/results/4b25ced9ecea36a296231c5cab1cf7a5c00cbd00 |     
   x86_64    |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/e96b9773b518efdad1d1ae9638dff3df1d8d646a |     
    sh4      |           mpd-0.23.5           | NOK | http://autobuild.buildroot.net/results/6c56b645a2b723920f07b98474452824fba5e2c1 |     
   xtensa    |        poppler-21.12.0         | NOK | http://autobuild.buildroot.net/results/ee689e79e7c0199bb3590fc6a4173e538493f8fc |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.net/results/8a917c11ab370274d564315db4e728ec45de8ed6 |     
    arm      |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/4d2d30553fea30c5020558b672aa1db5a4885cd0 |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
