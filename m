Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80F8CC61DF4
	for <buildroot@archiver.kernel.org>; Fri, 24 Nov 2023 06:40:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E5B1781387;
	Fri, 24 Nov 2023 06:40:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E5B1781387
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4IwknAWH79J5; Fri, 24 Nov 2023 06:40:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EA1AA81389;
	Fri, 24 Nov 2023 06:40:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EA1AA81389
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0DEA31BF681
 for <buildroot@lists.busybox.net>; Fri, 24 Nov 2023 06:40:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E6A03401AE
 for <buildroot@lists.busybox.net>; Fri, 24 Nov 2023 06:40:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E6A03401AE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id V2ecVYYJP7vh for <buildroot@lists.busybox.net>;
 Fri, 24 Nov 2023 06:40:48 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0894940127
 for <buildroot@buildroot.org>; Fri, 24 Nov 2023 06:40:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0894940127
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3F14A60009
 for <buildroot@buildroot.org>; Fri, 24 Nov 2023 06:40:45 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Fri, 24 Nov 2023 06:40:45 -0000
X-GND-Sasl: bot@bootlin.com
Message-Id: <20231124064050.E6A03401AE@smtp2.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1700808045; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=1IHAtct17vMgPxSthheVVJCHtSHU1vw8rktMrlctekY=;
 b=Q6QSRkIjMkq5zqrlYJ5+Pq7LmlzvHGxbYu9whnMAE4cLtrd97sDHPxZyHPrOdIxS5EdJoG
 O42Y9BfiORT07yfQOVu4RPdtfJa0l6SSoDiSXMTrtpmq7r3KEmHpE6UDjrO36M+FTn2GN6
 Cp12eFyvjSCA3E4NaWdVMgv7Pcur8fFd+Dxw8XT6LSmABwb5Wf2QR2YsrgBjoBk/GyaQc/
 Kv5W30aaQc4obrz+2S1r/+jLUlPQi0ieXgB8ESr5sMbv0T0/WKbFaVaJi0eYrjlmM9uKXc
 CAEH2hkiHdsOMqjBhVP2nuwr7eRnpLJ3JTyBU1v+5w/TOWvAK6KENd/4Y0NvaQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Q6QSRkIj
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-11-23
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

Autobuild statistics for 2023-11-23
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  |  2  |  4  |  0  |  6  |
  2023.08.x  |  3  |  4  |  0  |  7  |
    master   | 67  | 49  |  0  | 116 |

Classification of failures by reason for master
-----------------------------------------------

  gobject-introspection-1.76.1 | 5 
          python-msgpack-1.0.7 | 4 
                elfutils-0.189 | 3 
              host-rust-1.71.1 | 3 
                libressl-3.8.2 | 3 
     linux-5.10.162-cip24-rt10 | 3 
                    brltty-6.6 | 2 
        host-sentry-cli-2.20.3 | 2 
                   linux-6.6.1 | 2 
                    bat-0.23.0 | 1 
                 coreutils-9.3 | 1 
firmware-utils-86739f2b3ae9... | 1 
       freeradius-server-3.2.3 | 1 
glibc-2.38-27-g750a45a78390... | 1 
                   gvfs-1.48.1 | 1 
            host-erlang-26.0.2 | 1 
               libcgroup-2.0.3 | 1 
libuci-4b3db1179747b6a67790... | 1 
               libunwind-1.6.2 | 1 
          linux-5.10.162-cip24 | 1 
          lttng-modules-2.13.7 | 1 
 Makefile:727: target-finalize | 1 
                  monit-5.33.0 | 1 
                   oatpp-1.3.0 | 1 
               openblas-0.3.24 | 1 
                   openrc-0.51 | 1 
                 opensc-0.23.0 | 1 
               pcsc-lite-2.0.0 | 1 
                    php-8.2.12 | 1 
                 uclibc-1.0.44 | 1 
                    zfs-2.1.12 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   armeb     |           bat-0.23.0           | NOK | http://autobuild.buildroot.net/results/39d92868ca6e4c05a89ef2dba6965e0b29b782ef |     
powerpc64le  |           brltty-6.6           | NOK | http://autobuild.buildroot.net/results/a03fa3eb64c325ef360897db3a8953022d6a63ad |     
   mipsel    |           brltty-6.6           | NOK | http://autobuild.buildroot.net/results/1c0975731ddd6d57906ddd710d921521dcb7a380 |     
   arceb     |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/fc283de9cc423e0bfbad41b227aade66d6c0136b | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/7eedf619227eb306780c1e06ad58d689a58c8d2d | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/8808d704c75ce4ddffaedb064358c779cafed45d | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/02fe09dffec1d6ad3a3a556c0c334fd866189cb0 | ORPH
    or1k     | firmware-utils-86739f2b3ae9... | NOK | http://autobuild.buildroot.net/results/5578bb11d142e6307ce23ea7d6f9f7adb6d05ae7 |     
  sparc64    |    freeradius-server-3.2.3     | NOK | http://autobuild.buildroot.net/results/763ec289a2d373dd0f8eb740c161b134526b23c8 |     
 powerpc64   | glibc-2.38-27-g750a45a78390... | NOK | http://autobuild.buildroot.net/results/fda5f1d7d969c849226324d90dc700caa8ee6cee |     
   nios2     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/3033e3c9ef39ceec3ab845d02e66fe31a4577447 | ORPH
   nios2     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/3d98edc6f88cc81b5699ca3b128ce08b4c5e5304 | ORPH
   s390x     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/216fd8b8b64498c285ea1342e700a052e43d4dc0 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/2b0e7f27cd60435626c03e15bb240d292fc9baf7 | ORPH
   nios2     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/bcb693157c65dfad1b4ff1e4be28816b1d42835b | ORPH
    i686     |          gvfs-1.48.1           | NOK | http://autobuild.buildroot.net/results/4957463990288038ca0f057756236be70a9759c5 | ORPH
  sparc64    |       host-erlang-26.0.2       | NOK | http://autobuild.buildroot.net/results/0fcdb30ba8ea06895033458102be8932a393489f |     
powerpc64le  |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/3bb2133564520ba091a86f142470ecd8d45bd893 |     
   x86_64    |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/428611530d6dc84078740def63cb9065c9ad423b |     
  aarch64    |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/d6b3b7cebba428d59235a2b4e76ea748b1f604a7 |     
microblazeel |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/332750433b86cfd762a8a931b45ed21e08a17263 |     
 aarch64_be  |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/894c2926bb12083bc94696557481bcf3b76bc916 |     
    arm      |        libcgroup-2.0.3         | NOK | http://autobuild.buildroot.net/results/c335933a7ffd3757baa2c94d264e7fba6cb15452 |     
   nios2     |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/4ee4fc83432e4e1f563a85b70e94edf7a9c962d2 | ORPH
    mips     |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/dacd3f3e8bbf215b8639823c7883e6c4733920cc | ORPH
   arceb     |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/c61409399f93288d09dd0e9fc53e6d66084908af | ORPH
   mips64    | libuci-4b3db1179747b6a67790... | NOK | http://autobuild.buildroot.net/results/0d39fa44e6a34f3270778dd33c88d386241fe050 |     
    m68k     |        libunwind-1.6.2         | NOK | http://autobuild.buildroot.net/results/d8886d5568ceb976227c158573d8399bceb4b1e1 | ORPH
  powerpc    |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/28d48fa71330275132cbbc2357137639b93051bf | ORPH
   nios2     |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/d3c156f74a55e6a40dce05a83c32b69ffc611f5d | ORPH
    arm      |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/d26e0950fb5e347e310ecf98fb93c16259bfa6c7 | ORPH
  aarch64    |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/ceee75ffd2e7f7784154fcee314394736a145ae8 | ORPH
   armeb     |          linux-6.6.1           | NOK | http://autobuild.buildroot.net/results/8b7e81b14165f8251861bee86dbff069aa0b0a2a | ORPH
   mipsel    |          linux-6.6.1           | NOK | http://autobuild.buildroot.net/results/077a23d81a2e964bcf3e342477c65837ffe46c36 | ORPH
   arceb     |      lttng-modules-2.13.7      | NOK | http://autobuild.buildroot.net/results/dd669470cff8d44447e6934a3fbdea1e6b39af07 |     
   mips64    | Makefile:727: target-finalize  | NOK | http://autobuild.buildroot.net/results/9cef326744de2eda4e583d995a64c42d75e9c3a4 |     
microblazeel |          monit-5.33.0          | NOK | http://autobuild.buildroot.net/results/31c19ff6f130556b5c21d1709712f9db99d897c4 |     
    arc      |          oatpp-1.3.0           | NOK | http://autobuild.buildroot.net/results/bcdf7548ff752f936defd111d13c63245ea70cbe |     
  mips64el   |        openblas-0.3.24         | NOK | http://autobuild.buildroot.net/results/d8e3e570737e2c03446c121e830a648207218482 |     
   arceb     |          openrc-0.51           | NOK | http://autobuild.buildroot.net/results/eb706db58e1e5747d3a4b1462a294781cd42b73c |     
    arm      |         opensc-0.23.0          | NOK | http://autobuild.buildroot.net/results/cecee659371f370bf4bd2b27a4752bf20ceff326 | ORPH
powerpc64le  |        pcsc-lite-2.0.0         | NOK | http://autobuild.buildroot.net/results/242147270b807ccfc7dd2ae0f85a21098a9cbfb0 | ORPH
   armeb     |           php-8.2.12           | NOK | http://autobuild.buildroot.net/results/0f93e513feecab6087f896337fd1d85653126f46 |     
  aarch64    |      python-msgpack-1.0.7      | NOK | http://autobuild.buildroot.net/results/9cd78cd0847656bae2cd1414bb8ec716c4c2fae1 |     
 powerpc64   |      python-msgpack-1.0.7      | NOK | http://autobuild.buildroot.net/results/535e3d837eeb129de97224e95462ff861c5f42cc |     
    or1k     |      python-msgpack-1.0.7      | NOK | http://autobuild.buildroot.net/results/6ad0eb4bc871459554ab55dc99df46585d8a98fa |     
   mips64    |      python-msgpack-1.0.7      | NOK | http://autobuild.buildroot.net/results/2ba421fa1ce74744f7a2d254f50fb6f11467c6c3 |     
  riscv64    |         uclibc-1.0.44          | NOK | http://autobuild.buildroot.net/results/3da8b38b1921f532303ee73955139efd86b45c44 |     
   sh4eb     |           zfs-2.1.12           | NOK | http://autobuild.buildroot.net/results/39fa46532699d69a7a42a7dae104fe50eff377ca |     


Classification of failures by reason for 2023.02.x
--------------------------------------------------

                elfutils-0.186 | 2 
            host-binutils-2.38 | 1 
                       unknown | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/cf8b4ca87fb3a705b748cf7a53d842175ee7a47f | ORPH
   arceb     |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/a8b11c3d0f9464fce4194cfabe71cf8b4c0db239 | ORPH
  mips64el   |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/2b040a86a0e5480c381e618f8c1f226bb787462d |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/84bb0b9ec3eac9e89422c161a9cf9b71cd385993 |     


Classification of failures by reason for 2023.08.x
--------------------------------------------------

glibc-2.37-45-gb4e23c75aea7... | 1 
  gobject-introspection-1.76.1 | 1 
               host-go-1.20.11 | 1 
              host-rust-1.71.1 | 1 


Detail of failures for 2023.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   arceb     | glibc-2.37-45-gb4e23c75aea7... | NOK | http://autobuild.buildroot.net/results/639a85bacd947afa74689e4cd8180b9d01183f8f |     
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/693977de5dc8e2a6c7d469eea41e4e25ff09ea95 | ORPH
   mips64    |        host-go-1.20.11         | NOK | http://autobuild.buildroot.net/results/e082ca005d1e96d57a747257c4b1d9bb51954246 |     
powerpc64le  |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/1ea8b2b455925933b87f1c2f8e706338efb362ae |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
