Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90B71EB64DD
	for <buildroot@archiver.kernel.org>; Sun, 30 Jul 2023 05:43:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E01BD4048F;
	Sun, 30 Jul 2023 05:43:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E01BD4048F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xUmf62pWipXr; Sun, 30 Jul 2023 05:43:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 753354085F;
	Sun, 30 Jul 2023 05:43:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 753354085F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0C7FB1BF5F5
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 05:43:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D9D0E400FE
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 05:43:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D9D0E400FE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hVu1TmpcQPUA for <buildroot@lists.busybox.net>;
 Sun, 30 Jul 2023 05:43:15 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CE245400BB
 for <buildroot@buildroot.org>; Sun, 30 Jul 2023 05:43:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CE245400BB
Received: by mail.gandi.net (Postfix) with ESMTPSA id ED89DC0005
 for <buildroot@buildroot.org>; Sun, 30 Jul 2023 05:43:11 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sun, 30 Jul 2023 05:43:11 -0000
X-GND-Sasl: bot@bootlin.com
Message-Id: <20230730054316.D9D0E400FE@smtp2.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1690695792; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=g87qZBxTjRvW3nIHZjJ4MnqWaeUzJoax8Opmbnsii9Y=;
 b=KYsWGILs71Iva72KXVPmWDlP2r2dDpScV0KlTXQQSHSjWJSuZod0ljMdEpEKtAF5dFTDYh
 ZQaVmMyj1/HOdqdv0e4yKNCTbtA1iJ1+zVDQ1Etyz/2iujdo9SjZLOmAXWouIYYt65R5XV
 y0z7VHkFsgnJQ+gmoxRzesr2nG2YW0bNfxXenes+ccrjAvGSotu++q5ATBiBrVEpI9x1L6
 sDS51hx96w2Vw9qiJSVEwVJCnewBveaBc7OF2OAgMJ+dpDZGkeL+EOKn5G4pk7fpAYuMeE
 y/+mCf+y9ktlc/wWIVPHyUwSWJPUxWfaddUfOZqe1eaJZQW7AQESs1JYCjMJEg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=KYsWGILs
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-07-29
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

Autobuild statistics for 2023-07-29
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  |  4  |  3  |  0  |  7  |
  2023.05.x  |  6  |  2  |  0  |  8  |
    master   | 63  | 53  |  0  | 116 |

Classification of failures by reason for master
-----------------------------------------------

            host-binutils-2.39 | 5 
              host-rust-1.71.0 | 3 
         host-sentry-cli-2.8.0 | 3 
             util-linux-2.39.1 | 3 
             f2fs-tools-1.16.0 | 2 
  gobject-introspection-1.74.0 | 2 
             host-ccache-4.8.2 | 2 
                 libpng-1.6.40 | 2 
                    mbpoll-1.5 | 2 
                 mpg123-1.31.3 | 2 
                       unknown | 2 
android-tools-4.2.2+git2013... | 1 
                bpftool-v7.1.0 | 1 
                  cairo-1.16.0 | 1 
glibc-2.37-2-g9f8513dc64119... | 1 
            host-binutils-2.38 | 1 
             host-cmake-3.27.1 | 1 
       host-gcc-initial-12.3.0 | 1 
host-gdb-arc-2020.09-releas... | 1 
kvmtool-f77d646ba01d04be5aa... | 1 
               libglib2-2.76.1 | 1 
                    liblo-0.31 | 1 
                  libuv-1.46.0 | 1 
                  libzip-1.9.2 | 1 
                   linux-6.4.7 | 1 
              liquid-dsp-1.4.0 | 1 
                     lxc-5.0.2 | 1 
   openvmtools-11.3.5-18557794 | 1 
                     php-8.2.8 | 1 
       python-stack-data-0.6.2 | 1 
            quickjs-2021-03-27 | 1 
                    sslh-1.22c | 1 
             stress-ng-0.15.07 | 1 
               valgrind-3.21.0 | 1 
                xenomai-3.0.10 | 1 
                 zlib-ng-2.1.3 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 powerpc64   | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/31cab37feb44e1ef067a30181a4ec5514c81ecd9 |     
  sparc64    |         bpftool-v7.1.0         | NOK | http://autobuild.buildroot.net/results/58e00dc81f66113096891adfada405dd4f60be28 |     
   xtensa    |          cairo-1.16.0          | NOK | http://autobuild.buildroot.net/results/408a900ac01dbce145aff302c75f9f4e147f5672 |     
   armeb     |       f2fs-tools-1.16.0        | NOK | http://autobuild.buildroot.net/results/f1e0f04f76f7ff1b99eebcbb9e9d0cd10f7e3a1c |     
  mips64el   |       f2fs-tools-1.16.0        | NOK | http://autobuild.buildroot.net/results/4c5072f244e1bb02cf0af71801e25f1a24409a27 |     
  powerpc    | glibc-2.37-2-g9f8513dc64119... | NOK | http://autobuild.buildroot.net/results/dab63b9047408c23cf2d03dfea8d641395479b4e |     
    i686     |  gobject-introspection-1.74.0  | NOK | http://autobuild.buildroot.net/results/b5b08c7aebf5347d1dbf5d757ef935a64f238023 | ORPH
  sparc64    |  gobject-introspection-1.74.0  | NOK | http://autobuild.buildroot.net/results/112b8ea32d306553bf8ac3d4ea312b4d921e3cfd | ORPH
   s390x     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/cdc6b26b6c8402e72c64ae3eceabb05816e64dd6 |     
microblazeel |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/22ab7d74839e2c005696f1976bc389d98b1934ff |     
    arm      |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/a4873f82668e1070a4eca1bc816d34b4abc5e5a8 |     
   armeb     |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/99513d3c31be3f0b49e5c43bbb1a7a98c60455fe |     
    m68k     |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/3cd01dfbfa92e031018a1925de42bd1f2b336ee7 |     
   armeb     |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/d377efffbe2112f7bdf73bbee55e655ce1e03d44 |     
   s390x     |       host-ccache-4.8.2        | NOK | http://autobuild.buildroot.net/results/a49c1eac4ba5ec6de71bd2dcbd201183cd28aa8d | ORPH
    or1k     |       host-ccache-4.8.2        | NOK | http://autobuild.buildroot.net/results/d84de4df9e4186ee2ac6c0903fd44a53e7916fb3 | ORPH
  mips64el   |       host-cmake-3.27.1        | NOK | http://autobuild.buildroot.net/results/cfcb4c21279db7716ad5740c13092caee9d6f264 |     
    arm      |    host-gcc-initial-12.3.0     | NOK | http://autobuild.buildroot.net/results/16f894061c026f55b2aa7d9f46159416a25554ee |     
    arc      | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/2fda8d9cbcfbd56d58eeaa0fa73a205c08cf5137 | ORPH
    i686     |        host-rust-1.71.0        | NOK | http://autobuild.buildroot.net/results/05d0202ad6335ba3d9f0bb7498830bd70974de16 |     
    i686     |        host-rust-1.71.0        | NOK | http://autobuild.buildroot.net/results/013f71ae841730463c9f1ca2c4bf6b390918737d |     
  aarch64    |        host-rust-1.71.0        | NOK | http://autobuild.buildroot.net/results/afe5ec7d4e506b03e9ecaff38e111f74a34049bb |     
 aarch64_be  |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/c052b533869b41da8e407dff6b8f765e0f3334b9 |     
  aarch64    |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/fb6759dd0887efaa994457d38d0ae8ee3dacca4c |     
   arceb     |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/a694f7b59197739694d660e8d62f13f80fd8549a |     
    i686     | kvmtool-f77d646ba01d04be5aa... | NOK | http://autobuild.buildroot.net/results/18ac3f1b8e032571542a6d9198f98ea4713af18e | ORPH
    or1k     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/304f2de30c2e97b52ddaf5159bf3f0f32c344bf9 |     
   nios2     |           liblo-0.31           | NOK | http://autobuild.buildroot.net/results/27a0d2e1b45c7173b4de23b979318dca5bfd2b16 | ORPH
  riscv64    |         libpng-1.6.40          | NOK | http://autobuild.buildroot.net/results/638c7afc470743a97140354c19c38b6281880a68 |     
  riscv64    |         libpng-1.6.40          | NOK | http://autobuild.buildroot.net/results/1bc59b26d1c7c9e5a68b57e96146c32dd197244b |     
    or1k     |          libuv-1.46.0          | NOK | http://autobuild.buildroot.net/results/e4d0c06e3babed6b290b6223a1cf7e4cce38064c |     
    arc      |          libzip-1.9.2          | NOK | http://autobuild.buildroot.net/results/d221aaa3dd9c22ceb9f18d891ba4338a3eeddd3b | ORPH
    mips     |          linux-6.4.7           | NOK | http://autobuild.buildroot.net/results/0e385bec0b651207dc8857fe446f8facceaf80ed | ORPH
    arm      |        liquid-dsp-1.4.0        | NOK | http://autobuild.buildroot.net/results/559a837a695be8186c4b84959d590cf4ebfb7165 |     
   mips64    |           lxc-5.0.2            | NOK | http://autobuild.buildroot.net/results/d131992a90b6fa70a6e76d1c5df3ef2f0ad4632d |     
   arceb     |           mbpoll-1.5           | NOK | http://autobuild.buildroot.net/results/29411204c76e732a52f34abc31d9c8e40f8ce26d |     
    or1k     |           mbpoll-1.5           | NOK | http://autobuild.buildroot.net/results/d5347c4e647bb41beb74d1f0f0a4af8108812a85 |     
    arc      |         mpg123-1.31.3          | NOK | http://autobuild.buildroot.net/results/e150cc0e550e2e549a4f6b33c3fa3844b554c02b |     
 powerpc64   |         mpg123-1.31.3          | NOK | http://autobuild.buildroot.net/results/5360c943093878c765a9bacd2c1bbc5439d583a5 |     
   x86_64    |  openvmtools-11.3.5-18557794   | NOK | http://autobuild.buildroot.net/results/2dc5a9e5984e1f7fc8209b6da6d9adf9819e6f23 |     
microblazeel |           php-8.2.8            | NOK | http://autobuild.buildroot.net/results/fb57f5af8fd21557774db5158f613eed5a422841 |     
   armeb     |    python-stack-data-0.6.2     | NOK | http://autobuild.buildroot.net/results/a139922e72d4fa52dc230f78a5f37a735969b842 |     
   armeb     |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/6678dc649e11cc7342b7b77cb58143fa80bc5903 |     
    sh4a     |           sslh-1.22c           | NOK | http://autobuild.buildroot.net/results/d932a1bb76b83616da145172cbc1e6f203db490b |     
 microblaze  |       stress-ng-0.15.07        | NOK | http://autobuild.buildroot.net/results/d5be180c5e40ec9a97f84c706804a79e74de1725 |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.net/results/3ca0c93404f281640dbf36c91273fc74a692df6a |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/a1def74db67a4482928e78b56b53eafb510e3ced |     
    i586     |       util-linux-2.39.1        | NOK | http://autobuild.buildroot.net/results/bdd9c424a6d9ab2a81775d7cda2f8dbd609f2736 | ORPH
  aarch64    |       util-linux-2.39.1        | NOK | http://autobuild.buildroot.net/results/6f0b501a6e30094a3242faa434886a599121bbcb | ORPH
microblazeel |       util-linux-2.39.1        | NOK | http://autobuild.buildroot.net/results/e0503840078ef0cc40323f2ed0f8edc00e84f81d | ORPH
  mips64el   |        valgrind-3.21.0         | NOK | http://autobuild.buildroot.net/results/8ec53b2f157fdede56db00bc7da1b1288bb84038 | ORPH
    i586     |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/fcebef860665566cf4056fb9c755035a73578af9 |     
  powerpc    |         zlib-ng-2.1.3          | NOK | http://autobuild.buildroot.net/results/d14b52920c6aa37d185a9036df32e166392ea055 | ORPH


Classification of failures by reason for 2023.02.x
--------------------------------------------------

              host-rust-1.67.1 | 1 
               libglib2-2.72.3 | 1 
                       unknown | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |        host-rust-1.67.1        | NOK | http://autobuild.buildroot.net/results/ed6a99cb9a817a849aa63b56104105a04987605c |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/40a1fdaea928c489556adef2bf9155836862894c |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.net/results/fa136fd098bcf9baaf8b0b6356132b02366a76ef |     


Classification of failures by reason for 2023.05.x
--------------------------------------------------

               host-go-1.19.10 | 1 
                xenomai-3.0.10 | 1 


Detail of failures for 2023.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 powerpc64   |        host-go-1.19.10         | NOK | http://autobuild.buildroot.net/results/d18102e971aa3e78c2f7a7217b15e8a939831b7a |     
   x86_64    |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/07b0268fef293664cc94b86f6823d741903c72e2 |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
