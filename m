Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB479EB8FAF
	for <buildroot@archiver.kernel.org>; Wed,  6 Sep 2023 05:32:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 34CEB814BB;
	Wed,  6 Sep 2023 05:32:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 34CEB814BB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cHHwuKzcb_PW; Wed,  6 Sep 2023 05:32:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 27D698145C;
	Wed,  6 Sep 2023 05:32:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 27D698145C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 07DDA1BF389
 for <buildroot@lists.busybox.net>; Wed,  6 Sep 2023 05:32:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A5432408E5
 for <buildroot@lists.busybox.net>; Wed,  6 Sep 2023 05:32:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A5432408E5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RDz5KXXkgxW8 for <buildroot@lists.busybox.net>;
 Wed,  6 Sep 2023 05:31:59 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2F222408D8
 for <buildroot@buildroot.org>; Wed,  6 Sep 2023 05:31:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2F222408D8
Received: by mail.gandi.net (Postfix) with ESMTPSA id 09335FF80B
 for <buildroot@buildroot.org>; Wed,  6 Sep 2023 05:31:55 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Wed, 06 Sep 2023 05:31:55 -0000
X-GND-Sasl: bot@bootlin.com
Message-Id: <20230906053201.A5432408E5@smtp4.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1693978316; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=qvYpsIfLfwzqlsNkq2ohooMNN75ANDYaBaW0I0FViOs=;
 b=ahzZehYQtYQyvVJJEfN3V1xdcb0dYyAxUtbATcK4N1S9GvjoscEnNmvDkrM68fVPKexUkj
 68CvUAvuPUFICgR6FJQI4a2vFs8y9ZAXeREm8jrVlPMtR6a64Is5DuK9zueDh4vgaosTT4
 I9ADE2EBkMkzBVGvF3MB/7a236uK72OA9hcKWXpTv6nEFkC340B931kzyrwe4AXompn6Yx
 BtwfTHT5kumsjOEMun/RjU4X+cmglzTdJanc8Ubpa9tOdBGn3XvbOZgXEZHJH6WOovRsXY
 6ogTXve43SlAwOcUxKmR7ZGGKAXd1JJ5fYUnd3i31pmrL8m7D0Dh6shv0TERTA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ahzZehYQ
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-09-05
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

Autobuild statistics for 2023-09-05
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  |  6  |  2  |  0  |  8  |
  2023.05.x  |  8  |  7  |  0  | 15  |
    master   | 82  | 60  |  1  | 143 |

Classification of failures by reason for master
-----------------------------------------------

             util-linux-2.39.1 | 10
  gobject-introspection-1.76.1 | 6 
                       unknown | 4 
                host-go-1.20.7 | 3 
                  conmon-2.1.7 | 2 
         host-sentry-cli-2.8.0 | 2 
     linux-5.10.162-cip24-rt10 | 2 
                  linux-6.4.14 | 2 
               linux-pam-1.5.3 | 2 
wilc-driver-linux4microchip... | 2 
             batman-adv-2022.3 | 1 
                   bird-2.0.12 | 1 
                bpftool-v7.1.0 | 1 
                  cairo-1.16.0 | 1 
glibc-2.37-2-g9f8513dc64119... | 1 
         gobject-introspection | 1 
         host-gcc-final-13.2.0 | 1 
host-go-bootstrap-stage2-1.... | 1 
              host-rust-1.71.1 | 1 
              hyperfine-1.14.0 | 1 
                  libjxl-0.8.1 | 1 
                libmbim-1.28.2 | 1 
            libmemcached-1.1.4 | 1 
             libopenssl-3.0.10 | 1 
               libvorbis-1.3.7 | 1 
        ltp-testsuite-20230127 | 1 
          lttng-modules-2.13.7 | 1 
            micropython-1.19.1 | 1 
                    olsr-0.9.8 | 1 
                 pango-1.50.14 | 1 
               pipewire-0.3.74 | 1 
                   shadow-4.13 | 1 
               trace-cmd-2.9.7 | 1 
ulog-0389d243352255f6182326... | 1 
                xenomai-3.0.10 | 1 
               zxing-cpp-2.1.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |       batman-adv-2022.3        | NOK | http://autobuild.buildroot.net/results/cbf675f9ddb8d1ca547998c51739c839b427538f |     
  riscv32    |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/972e1a3cecadd5a1a068a9f33545b402ffaa8054 |     
   s390x     |         bpftool-v7.1.0         | NOK | http://autobuild.buildroot.net/results/88149be36678b0ed461cdddb412dd12bd9567044 |     
   xtensa    |          cairo-1.16.0          | NOK | http://autobuild.buildroot.net/results/55bddff014d32e7ddf9acef9d188774dd2db9a1c |     
   mipsel    |          conmon-2.1.7          | NOK | http://autobuild.buildroot.net/results/d09c6a662de152def6e2598507b610028be75f19 |     
    i586     |          conmon-2.1.7          | NOK | http://autobuild.buildroot.net/results/07581d99de393c33c5dac1962ecb6365ca8d01ed |     
  powerpc    | glibc-2.37-2-g9f8513dc64119... | NOK | http://autobuild.buildroot.net/results/9405a9e11eec5278a2fedc53d4fb8caa524607f2 |     
   armeb     |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/b5dfb4322c7aed7e339b858dea595ead9d9ca0bc |     
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/c008c203d08e3690a3bd52bdd0cc35b86d404702 | ORPH
   nios2     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/cd7c6890c67c384827d0593885598f98afeae97d | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/6390aaa9e9cc46c66c98e70d229036f9def00612 | ORPH
   nios2     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/233310db2cbabb9124bbd568ee6d64f5f80ee8b2 | ORPH
   s390x     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/685d8c89201f5166e925694b856bebd73cce6400 | ORPH
   mipsel    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/4b1ee05ce8e270963c35da4993a2bc6b166e24e2 | ORPH
 microblaze  |     host-gcc-final-13.2.0      | NOK | http://autobuild.buildroot.net/results/bf73a6231ed71b2a42be16f50ae1b41167d993db |     
  aarch64    |         host-go-1.20.7         | NOK | http://autobuild.buildroot.net/results/07374355257d0dbfcfe1e72fe5c8216fd31c7493 |     
  aarch64    |         host-go-1.20.7         | NOK | http://autobuild.buildroot.net/results/f0271ab2bbe4c79cfa70bed809aedf708213c66d |     
  powerpc    |         host-go-1.20.7         | NOK | http://autobuild.buildroot.net/results/5c3f7f5859d0cf82d2da80fef380336ff0103a22 |     
  mips64el   | host-go-bootstrap-stage2-1.... | NOK | http://autobuild.buildroot.net/results/21e618c8c6b723eb8fc5d53c0e0690a21164d56d |     
    mips     |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/4cc7dbbea9016b54fdd338f6d3504263d038972d |     
   s390x     |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/871ab642b2f1e83b4f54e376d139000c4b18bb9b |     
powerpc64le  |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/32d66fe4a4529c30459feeff982981209a2cdef1 |     
    mips     |        hyperfine-1.14.0        | NOK | http://autobuild.buildroot.net/results/1ff0134719e0bf5351d3647b1cd7b73e04758525 | ORPH
  riscv64    |          libjxl-0.8.1          | NOK | http://autobuild.buildroot.net/results/12107bc7aea7afae1d2fb935d31b44eee6ea1501 |     
   sparc     |         libmbim-1.28.2         | NOK | http://autobuild.buildroot.net/results/c2093cc7d536da9752860834efd20aaaaa88f734 |     
    arm      |       libmemcached-1.1.4       | NOK | http://autobuild.buildroot.net/results/e850a097754d4a5bea9818c8c4a9b496886e06b8 | ORPH
    arm      |       libopenssl-3.0.10        | NOK | http://autobuild.buildroot.net/results/d317e92d3a824091a94898d60a9b608024d91ee0 | ORPH
  powerpc    |        libvorbis-1.3.7         | NOK | http://autobuild.buildroot.net/results/36a51b7951b483cd8f0e7a3844e50198d9c4cf0d |     
   nios2     |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/f8695ca542eec65c6a85fb6a3dcc9bb553eaabb6 | ORPH
  mips64el   |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/77122d248a6fc14dc74bc0be2d831cbe97e4078e | ORPH
    arm      |          linux-6.4.14          | NOK | http://autobuild.buildroot.net/results/073e4eb7e75834b413e9c20478e1c29e7c96137d | ORPH
    mips     |          linux-6.4.14          | NOK | http://autobuild.buildroot.net/results/02581dad5395beab027beaa0c23f09cb3324b7e5 | ORPH
   sparc     |        linux-pam-1.5.3         | NOK | http://autobuild.buildroot.net/results/6cd0080b5247028938f866a7e933989fd09f4ca0 | ORPH
    arm      |        linux-pam-1.5.3         | NOK | http://autobuild.buildroot.net/results/effeaa4b4f4c9d70894c27bf6ec85203e9764e97 | ORPH
    arm      |     ltp-testsuite-20230127     | NOK | http://autobuild.buildroot.net/results/d060f938427cc727389cee103cafbe2d1b418819 |     
   sh4eb     |      lttng-modules-2.13.7      | NOK | http://autobuild.buildroot.net/results/21c73c0ebb99eb85021655d7fd64ad80856b3d18 |     
 aarch64_be  |       micropython-1.19.1       | NOK | http://autobuild.buildroot.net/results/6f112cae9d8166790c89733f01aaea772e169834 |     
powerpc64le  |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/67d42957539ba1172a7d71257b19c60134360514 | ORPH
   s390x     |         pango-1.50.14          | NOK | http://autobuild.buildroot.net/results/1f5ee5f1c4d259d05ecb3389052f481062697d44 | ORPH
  mips64el   |        pipewire-0.3.74         | NOK | http://autobuild.buildroot.net/results/346b402df8b194fe0574e8a6ebd7bb9ef4416a7e |     
    arm      |          shadow-4.13           | NOK | http://autobuild.buildroot.net/results/0a1a170d8e86c2a637c39792ffdfab2e09290751 |     
  aarch64    |        trace-cmd-2.9.7         | NOK | http://autobuild.buildroot.net/results/4a636e6e075ad2b36dc294b5aa46f4927844e4cc |     
powerpc64le  | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/6b87326b364fb1353726096a7fb99c3b9e9d6a72 |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/c7813cda843efd0d57517a3ef15b6754895f9b6f |     
    sh4      |            unknown             | NOK | http://autobuild.buildroot.net/results/1ca97ec7ecf2487e0296dc4ba1968607b028a109 |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.net/results/977d6d82d0b370bc9d8068b83001806ec9205374 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/64c95b18ff62660fa0f8a37724d5bb61b7e119c2 |     
  mips64el   |       util-linux-2.39.1        | NOK | http://autobuild.buildroot.net/results/3784a71fb94af5791639a7f815022f070485578d | ORPH
    arm      |       util-linux-2.39.1        | NOK | http://autobuild.buildroot.net/results/0ebf8a2a89c7d925ad64b2e077c8b5219471ee20 | ORPH
   sh4aeb    |       util-linux-2.39.1        | NOK | http://autobuild.buildroot.net/results/94521af60c32e886e284a692a9b88b6e4845b9b2 | ORPH
    arm      |       util-linux-2.39.1        | NOK | http://autobuild.buildroot.net/results/f894f1c0506649b148a9764d51ca8577d3808143 | ORPH
    arc      |       util-linux-2.39.1        | NOK | http://autobuild.buildroot.net/results/e6cff9ef2bc55f5c1ece236cfa5177ee410dac34 | ORPH
   sh4eb     |       util-linux-2.39.1        | NOK | http://autobuild.buildroot.net/results/2794a5abb69cc40ec64d610a89a52bd683b309d9 | ORPH
    arm      |       util-linux-2.39.1        | NOK | http://autobuild.buildroot.net/results/d54310411f6486a63125fd0a4f5f183d830f76e0 | ORPH
microblazeel |       util-linux-2.39.1        | NOK | http://autobuild.buildroot.net/results/c94ab1b029442e15bedd6902779bdeff00670b86 | ORPH
  powerpc    |       util-linux-2.39.1        | NOK | http://autobuild.buildroot.net/results/de4b4c55be0903da518f06f13a67adc1a72e14c4 | ORPH
  mips64el   |       util-linux-2.39.1        | NOK | http://autobuild.buildroot.net/results/7128fb5d8b7fe13e98f09c097416f4f5076ab6c8 | ORPH
  sparc64    | wilc-driver-linux4microchip... | NOK | http://autobuild.buildroot.net/results/9c4cb53799e1b6a746f7abbe9f3e8ba5dc3ea0fd |     
 microblaze  | wilc-driver-linux4microchip... | NOK | http://autobuild.buildroot.net/results/fc6ad8c0f157956e8516815c3ca3edeae52f4343 |     
    arm      |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/32705089ac1b02d30d05373e843e14b1798c27cd |     
    arm      |        zxing-cpp-2.1.0         | NOK | http://autobuild.buildroot.net/results/3512086e9f9668eaa9bfbfce5a1c74a002e7b120 |     


Classification of failures by reason for 2023.02.x
--------------------------------------------------

                  linux-6.1.42 | 2 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |          linux-6.1.42          | NOK | http://autobuild.buildroot.net/results/7ab82dcf2a357c4f0d72d33314529a274db57e93 | ORPH
   armeb     |          linux-6.1.42          | NOK | http://autobuild.buildroot.net/results/38c136e879d96c8962e509aee8b76c875018a85d | ORPH


Classification of failures by reason for 2023.05.x
--------------------------------------------------

                     efivar-38 | 2 
                elfutils-0.186 | 1 
            host-binutils-2.38 | 1 
               host-go-1.19.12 | 1 
                     php-8.2.8 | 1 
                  xvisor-0.3.1 | 1 


Detail of failures for 2023.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |           efivar-38            | NOK | http://autobuild.buildroot.net/results/9feb87c06db1e8bdd35a899462d837e418aaf222 |     
  mips64el   |           efivar-38            | NOK | http://autobuild.buildroot.net/results/736e245a9658f65144c4727e9ce9b3875a9c994d |     
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/ea68171e8cafbe25eeb0b255bbf1482b3c6a7ddf | ORPH
 aarch64_be  |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/8f242ef4dc944d8b489b3e1f2cd60d9115b6506a |     
  mips64el   |        host-go-1.19.12         | NOK | http://autobuild.buildroot.net/results/aa2017c360a5cf38d7951d01829231f4ad66906a |     
    or1k     |           php-8.2.8            | NOK | http://autobuild.buildroot.net/results/848eb60a1d01b697c41b3c8c19f0a386a18da56f |     
  riscv32    |          xvisor-0.3.1          | NOK | http://autobuild.buildroot.net/results/5ea36bc1aac9fbe05088da126b597d8d9c8a0bfc |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
