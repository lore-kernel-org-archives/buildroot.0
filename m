Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 412B2C83F2D
	for <buildroot@archiver.kernel.org>; Sun,  3 Sep 2023 05:33:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 654AD61092;
	Sun,  3 Sep 2023 05:33:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 654AD61092
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id igr0Egnh8AII; Sun,  3 Sep 2023 05:33:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 779A06109B;
	Sun,  3 Sep 2023 05:33:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 779A06109B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B0B201BF2AF
 for <buildroot@lists.busybox.net>; Sun,  3 Sep 2023 05:33:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 82A0A81FBA
 for <buildroot@lists.busybox.net>; Sun,  3 Sep 2023 05:33:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 82A0A81FBA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ePmVyP0b_c7M for <buildroot@lists.busybox.net>;
 Sun,  3 Sep 2023 05:33:07 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9D2F381F97
 for <buildroot@buildroot.org>; Sun,  3 Sep 2023 05:33:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9D2F381F97
Received: by mail.gandi.net (Postfix) with ESMTPSA id D7B8C1C0007
 for <buildroot@buildroot.org>; Sun,  3 Sep 2023 05:33:03 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sun, 03 Sep 2023 05:33:03 -0000
X-GND-Sasl: bot@bootlin.com
Message-Id: <20230903053308.82A0A81FBA@smtp1.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1693719183; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=duR2rpODLqwK/dy2aeIs2ClQikEWLv3xZ8ABnoDg64k=;
 b=T2qW8nyOO2r7ebZlE12vOmqeBfJ44XPYxtr9CS+kqKYVB2AWh6Q7Kmhx5mJ8drP+ehCilS
 +WrPWoetg02YaHhHIVO+DIIpKITofy5jscwCAGl9j1duk2YAr5aP0+ODOoT+NOCZJCrboG
 TrE4d+xu9jpqx9E8PWQaK+goU/XsjQWSTtnlV7hvosUxSHn+B4wZKkk9U8MhTz5JMzW6Kp
 1LQKAYr1kKOcvsS+Ewsikk4/hjQ5HjZB6nQmkuWyWyHTX2jHOaZIl1qhz1DSn7nJDY5NbU
 GoyMKDrQRf57u0dYvwotmDueueclu4K4jX8TKS6vnSEXqU1yA4MycPoFy/6AAg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=T2qW8nyO
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-09-02
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

Autobuild statistics for 2023-09-02
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  |  2  |  2  |  0  |  4  |
  2023.05.x  |  1  |  2  |  1  |  4  |
    master   | 59  | 32  |  0  | 91  |

Classification of failures by reason for master
-----------------------------------------------

              libxcrypt-4.4.33 | 3 
                    bat-0.23.0 | 2 
  gobject-introspection-1.76.1 | 2 
         host-sentry-cli-2.8.0 | 2 
                     php-8.2.9 | 2 
             util-linux-2.39.1 | 2 
        util-linux-libs-2.39.1 | 2 
                  cairo-1.16.0 | 1 
        edk2-edk2-stable202305 | 1 
              fftw-quad-3.3.10 | 1 
glibc-2.37-2-g9f8513dc64119... | 1 
         host-gcc-final-13.2.0 | 1 
                host-go-1.20.7 | 1 
              host-rust-1.71.1 | 1 
               host-wine-8.0.2 | 1 
                  linux-6.4.13 | 1 
               linux-pam-1.5.3 | 1 
                netdata-1.33.1 | 1 
                    olsr-0.9.8 | 1 
              open62541-v1.3.6 | 1 
            quickjs-2021-03-27 | 1 
                       unknown | 1 
                     xterm-376 | 1 
                    zeek-4.1.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |           bat-0.23.0           | NOK | http://autobuild.buildroot.net/results/2eca3444ff33e4374154f275d454ff5a03d7b864 |     
   armeb     |           bat-0.23.0           | NOK | http://autobuild.buildroot.net/results/7589a8a939bf0d95a53168ed43e6d37aaab30a37 |     
   xtensa    |          cairo-1.16.0          | NOK | http://autobuild.buildroot.net/results/4488c81f7d4d91ed748b019a045cf1d77a7de630 |     
    i686     |     edk2-edk2-stable202305     | NOK | http://autobuild.buildroot.net/results/c5e8cd3e49ffa0b031feaa2e4ef069a1facc2151 |     
powerpc64le  |        fftw-quad-3.3.10        | NOK | http://autobuild.buildroot.net/results/aa55cae3da87fb5e77af107b18d5f353ddb3fdb4 | ORPH
  powerpc    | glibc-2.37-2-g9f8513dc64119... | NOK | http://autobuild.buildroot.net/results/e1309f9cc79972f91baffdbffafb3b25ae41cc11 |     
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/36962d964ded4995155cf2e0e78c0ec2f6c2d68f | ORPH
   s390x     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/f7b22027283106074b4e428997d0eb8f5313f7fa | ORPH
 microblaze  |     host-gcc-final-13.2.0      | NOK | http://autobuild.buildroot.net/results/4579f32d5812666ab92ea4e69c26c2a9615380a6 |     
  aarch64    |         host-go-1.20.7         | NOK | http://autobuild.buildroot.net/results/d9d8f270f016a78ed3df0007ec51fd185ada59a3 |     
 powerpc64   |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/23ef20e5798917922097527191448c289e43d6d9 |     
   nios2     |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/0a01458eb2b4d3157a909084f8e20919640d3a1b |     
   x86_64    |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/f7dc1ce5170763527a0c60a687faf174a9266ba8 |     
    i686     |        host-wine-8.0.2         | NOK | http://autobuild.buildroot.net/results/74fcdda33ffe432ddba4d3667dc20954807fb0ac |     
 aarch64_be  |        libxcrypt-4.4.33        | NOK | http://autobuild.buildroot.net/results/ba1dd17cb0b24f31e3414462c777f90a1958dd74 |     
   arceb     |        libxcrypt-4.4.33        | NOK | http://autobuild.buildroot.net/results/5be97b6a8e21727081e55326f52052bce2fbd550 |     
    sh4      |        libxcrypt-4.4.33        | NOK | http://autobuild.buildroot.net/results/bf4273239b5d81cf6bcb19e826d5e4d1f0e4d960 |     
  mips64el   |          linux-6.4.13          | NOK | http://autobuild.buildroot.net/results/4430e92ae995746f40c34b42bbe95897ae75eec3 | ORPH
    arm      |        linux-pam-1.5.3         | NOK | http://autobuild.buildroot.net/results/473df173be0b296a3fb5ca00beb5f9fa444efe29 | ORPH
   mips64    |         netdata-1.33.1         | NOK | http://autobuild.buildroot.net/results/0f9b159ef3a281573fd4c0282a633abc725adc19 |     
   xtensa    |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/b2c56717ef4f1376dd53000ff79a495cf2dd5df1 | ORPH
   s390x     |        open62541-v1.3.6        | NOK | http://autobuild.buildroot.net/results/7863b2add2442e565cb398083b53098bd03d9f35 | ORPH
    or1k     |           php-8.2.9            | NOK | http://autobuild.buildroot.net/results/1ae6ceeacd4828b52f03f3a33e7ca08cc9431652 |     
   sh4aeb    |           php-8.2.9            | NOK | http://autobuild.buildroot.net/results/f3920cb607cf1aa02c114c6fb0c4acb6cc74fe14 |     
  mips64el   |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/f5d15da5a7f31aa6af0f3a0acf315360431efd46 |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/8665a07304d148bfbba6a6b59cf48624a13f5739 |     
    arm      |       util-linux-2.39.1        | NOK | http://autobuild.buildroot.net/results/b1933b2dabea1fb49e9fce8e19f0532857d3b4c7 | ORPH
    arm      |       util-linux-2.39.1        | NOK | http://autobuild.buildroot.net/results/81ace668a6afab316e86dcf81b16c4772ab1a795 | ORPH
 aarch64_be  |     util-linux-libs-2.39.1     | NOK | http://autobuild.buildroot.net/results/d5895dfa4342035a21aa7a946ce7b92ab097e74a | ORPH
 microblaze  |     util-linux-libs-2.39.1     | NOK | http://autobuild.buildroot.net/results/70b59b7c66fe1e40b28eed18f522317f27eaf0ba | ORPH
   sparc     |           xterm-376            | NOK | http://autobuild.buildroot.net/results/1c03a8016d480d9c3fc3112849b1a125df243cab | ORPH
    i686     |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/5500061a5f6ae073cd57965b7952d98e135ecde4 |     


Classification of failures by reason for 2023.02.x
--------------------------------------------------

            host-binutils-2.37 | 1 
                       unknown | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mips64    |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/1f7dbd6edd8b481258aa4a02ee2dd4e990b77eaf |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/db550acbf95dd114add5b2d45aa9ae1c265a2b9b |     


Classification of failures by reason for 2023.05.x
--------------------------------------------------

  gobject-introspection-1.74.0 | 1 
              host-rust-1.68.2 | 1 
                       unknown | 1 


Detail of failures for 2023.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |  gobject-introspection-1.74.0  | NOK | http://autobuild.buildroot.net/results/435aeb44d9e8eb8f831c11147688dfd08439a3ca | ORPH
powerpc64le  |        host-rust-1.68.2        | NOK | http://autobuild.buildroot.net/results/1dbd9503e0090b7d4fc994ddc982de443101b69f |     
 microblaze  |            unknown             | TIM | http://autobuild.buildroot.net/results/7aea91330852c770d789898ef6345e992b8ba372 |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
