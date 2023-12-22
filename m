Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43DCFC41535
	for <buildroot@archiver.kernel.org>; Fri, 22 Dec 2023 06:43:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1BD6960A5A;
	Fri, 22 Dec 2023 06:43:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1BD6960A5A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PBS3Sj14bJyU; Fri, 22 Dec 2023 06:43:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 41EF460BA0;
	Fri, 22 Dec 2023 06:43:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 41EF460BA0
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6D1B21BF836
 for <buildroot@lists.busybox.net>; Fri, 22 Dec 2023 06:43:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 118FE41868
 for <buildroot@lists.busybox.net>; Fri, 22 Dec 2023 06:43:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 118FE41868
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2mUIRLk8BiSh for <buildroot@lists.busybox.net>;
 Fri, 22 Dec 2023 06:42:56 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 940D340196
 for <buildroot@buildroot.org>; Fri, 22 Dec 2023 06:42:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 940D340196
Received: by mail.gandi.net (Postfix) with ESMTPSA id B2AB0FF805
 for <buildroot@buildroot.org>; Fri, 22 Dec 2023 06:42:52 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Fri, 22 Dec 2023 06:42:52 -0000
X-GND-Sasl: bot@bootlin.com
Message-Id: <20231222064300.118FE41868@smtp4.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1703227372; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=rVB5mbe5zMF3w1htG6ievc/aDzRayZ34/HzJJDDy7Ls=;
 b=K7jw32vVvkaJE9HEbXxSvXigKsaFulPk0Pc5e1+Na/TCjFwXYxdc/qdbkH8Blmaczr5+OP
 PJA77QwN3VgOTMNYlW5k3QMfX6APYH9A6A6R6QGtg6Tzo50FsW6A5D/k7yBDx4wdsZ5zv2
 fm/OG9foar6AaVRt/YfTLAPw6vIkWvdwdpZI1MAnqeKI4zjwBwrUTU37Yqq/LgMkLWtxj2
 k2GMxEXkgiXnheI6keqOFYqAsohGOvZb2iHJHNBWXipkwOKZXZ29HLuXoQasBEXhLM77x5
 QpyGvIcZ8jHD8oF/ru9GHbtCXUJ0afc3ednG5IcFGD1y1iByH6ucfnsywlbdZQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=K7jw32vV
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-12-21
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

Autobuild statistics for 2023-12-21
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  |  8  |  3  |  0  | 11  |
  2023.08.x  |  3  |  2  |  1  |  6  |
    master   | 11  | 19  |  1  | 31  |

Classification of failures by reason for master
-----------------------------------------------

ibm-sw-tpm2-5452af422edeff7... | 3 
                     exim-4.97 | 2 
                       unknown | 2 
android-tools-4.2.2+git2013... | 1 
                elfutils-0.189 | 1 
         gobject-introspection | 1 
      libabseil-cpp-20230802.1 | 1 
                 libcurl-8.5.0 | 1 
                libheif-1.17.5 | 1 
              libopenssl-3.2.0 | 1 
                libressl-3.8.2 | 1 
             libutempter-1.2.1 | 1 
          linux-5.10.162-cip24 | 1 
                memtest86-6.20 | 1 
        python-pysensors-0.0.4 | 1 
                python3-3.11.6 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/c8a6455263a86e212bb12a6047986827c803daa1 |     
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/f5ff16903935beaa28c46f33c23b7edc8f4de6f6 | ORPH
   armeb     |           exim-4.97            | NOK | http://autobuild.buildroot.net/results/e8cd7fd35b687f8a9f0489c36612a90f60c13f4e |     
 aarch64_be  |           exim-4.97            | NOK | http://autobuild.buildroot.net/results/d166874618f5631d40dfb1b0eb9369a82539a207 |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/348b65d4092a6c95f929a7d3ee628e79af26f16d |     
   mipsel    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/70ab93446788d0e1fa15ecb366b2a4679099f9ab |     
 aarch64_be  | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/ee67598419cc84bad31262fab9c1af7c3cf2d355 |     
microblazeel | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/26b26e0c20d1ccde1f1406fe1ce28e420753e822 |     
    or1k     |    libabseil-cpp-20230802.1    | NOK | http://autobuild.buildroot.net/results/f9ce12449aafd7c69d278c76633c9a8bec689a28 |     
 aarch64_be  |         libcurl-8.5.0          | NOK | http://autobuild.buildroot.net/results/fe205d7f15cec4c8583034a77b127e1b7d5f50df |     
   sparc     |         libheif-1.17.5         | NOK | http://autobuild.buildroot.net/results/8ca909564c8dabe28ad08c96ebbc04b25592e727 |     
  riscv32    |        libopenssl-3.2.0        | NOK | http://autobuild.buildroot.net/results/217d9de3b8af18779a0f74153bfb5b21d4747438 | ORPH
   sparc     |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/e6a1d88b4c8bd863401615ceb7b981fa78f87196 | ORPH
   xtensa    |       libutempter-1.2.1        | NOK | http://autobuild.buildroot.net/results/5d3ad7c5ed06dde9b39020d61e07f3ea50ac5ecd |     
   nios2     |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/2929f0fae777a95922e7272692392c5a0ca9cdaf | ORPH
    i686     |         memtest86-6.20         | NOK | http://autobuild.buildroot.net/results/b0e96f618f930c785ad7d7da776cb0738e56942b |     
  aarch64    |     python-pysensors-0.0.4     | NOK | http://autobuild.buildroot.net/results/b38df0f6348b2ae0eac017b7e6ee4fc0e4b5ad04 |     
   x86_64    |         python3-3.11.6         | NOK | http://autobuild.buildroot.net/results/4e6af2b368703a481697187dffdf063777002845 |     
powerpc64le  |            unknown             | NOK | http://autobuild.buildroot.net/results/a28de1ae19a3286217c5ff9b9e828ee4bd9d7580 |     
   sparc     |            unknown             | NOK | http://autobuild.buildroot.net/results/9f76b1858d6fefdb3843316689715498500c0714 |     


Classification of failures by reason for 2023.02.x
--------------------------------------------------

              host-rust-1.67.1 | 1 
               libglib2-2.72.3 | 1 
                       unknown | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    mips     |        host-rust-1.67.1        | NOK | http://autobuild.buildroot.net/results/fbb33f1e9459d74fc711359a501b12bb815c455f |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/5f33ffb59a6845247076e7ce1fd9a73271780e28 |     
powerpc64le  |            unknown             | NOK | http://autobuild.buildroot.net/results/47af6d6c6811ad15ea759f40adbb01cb1a884170 |     


Classification of failures by reason for 2023.08.x
--------------------------------------------------

                elfutils-0.189 | 1 
         gobject-introspection | 1 
     linux-5.10.162-cip24-rt10 | 1 


Detail of failures for 2023.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/bd66454a488e5711f95e29d17cc711051bb5605c | ORPH
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/1d4ba7d8ceab0ef1b6ddefabfe0e03be701880ca |     
 powerpc64   |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/de20c0f3481d06da635babc5c183ce59c4a9a385 | ORPH



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
