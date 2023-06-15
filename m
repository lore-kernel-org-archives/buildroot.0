Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB75BEB64D9
	for <buildroot@archiver.kernel.org>; Thu, 15 Jun 2023 04:42:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EC9EF60BD8;
	Thu, 15 Jun 2023 04:42:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EC9EF60BD8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LaG-W6WrvqTq; Thu, 15 Jun 2023 04:42:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C40BE60D59;
	Thu, 15 Jun 2023 04:42:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C40BE60D59
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1DB981BF28F
 for <buildroot@lists.busybox.net>; Thu, 15 Jun 2023 04:42:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E6E1583B12
 for <buildroot@lists.busybox.net>; Thu, 15 Jun 2023 04:42:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E6E1583B12
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id roiIjNC3ZLTn for <buildroot@lists.busybox.net>;
 Thu, 15 Jun 2023 04:42:36 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 09FB883ABC
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 09FB883ABC
 for <buildroot@buildroot.org>; Thu, 15 Jun 2023 04:42:35 +0000 (UTC)
X-GND-Sasl: thomas.petazzoni@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 17B0AC0003
 for <buildroot@buildroot.org>; Thu, 15 Jun 2023 04:42:33 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Thu, 15 Jun 2023 04:42:33 -0000
Message-Id: <20230615044237.E6E1583B12@smtp1.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1686804153; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=nhKYgCkMvRsWe7swyjFkvFZXv5euSlExdbKZSkNbEt4=;
 b=XKBB4/3hwdU4bEKfT1OvW8/wmnmCKo4CwH7IOMGrYo6VndWUTVZhhQit85uqKalPAflzOR
 d85ztUoePjMdbRoDZILmtyHvlYx20KcIYmeRmN6/cd2id9rJ/VyWIe/ziaFlg2uoaTsjC1
 e8NQ6KCpxFQwGFDMQ3G0wvqHRazr21KGnG3lCbLVEid6THcoOVWxp/3ZDPkUjzX+a8i1Q1
 DDh5ZIAJcrWkYMI0j5SSjMBMPamBzFWVuHC8/gcVgQ0CV6O7AZMSexKS6cflRV8P/PKwxc
 gFijKeOByj4oKtb9nCivy5yDeCKHduNwu2AsWiTmCuXPJj20sYMNJZfavCBhQw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=XKBB4/3h
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-06-14
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

Autobuild statistics for 2023-06-14
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  |  4  |  5  |  0  |  9  |
    master   | 65  | 58  |  1  | 124 |

Classification of failures by reason for master
-----------------------------------------------

              host-rust-1.68.2 | 5 
                       unknown | 5 
                   linux-6.3.6 | 4 
        ltp-testsuite-20230127 | 4 
            host-binutils-2.38 | 3 
                    strace-6.3 | 3 
                 agentpp-4.6.0 | 2 
  gobject-introspection-1.74.0 | 2 
               host-go-1.19.10 | 2 
               libglib2-2.76.1 | 2 
              liquid-dsp-1.4.0 | 2 
             batman-adv-2022.3 | 1 
                 coreutils-9.3 | 1 
             dahdi-linux-3.2.0 | 1 
        edk2-edk2-stable202208 | 1 
                elfutils-0.186 | 1 
       freeradius-client-1.1.7 | 1 
fs/cramfs/cramfs.mk:46: /ho... | 1 
fs/cramfs/cramfs.mk:46: /ho... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
glibc-2.37-2-g9f8513dc64119... | 1 
         gobject-introspection | 1 
                 haproxy-2.6.9 | 1 
            host-binutils-2.39 | 1 
host-heimdal-f4faaeaba371ff... | 1 
               host-runc-1.1.7 | 1 
                  libsepol-3.5 | 1 
               lightning-2.2.1 | 1 
     linux-5.10.162-cip24-rt10 | 1 
               nfs-utils-2.6.3 | 1 
                     php-8.2.6 | 1 
                     pv-1.6.20 | 1 
       python-stack-data-0.6.2 | 1 
                    sdl-1.2.15 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sh4eb     |         agentpp-4.6.0          | NOK | http://autobuild.buildroot.net/results/f3f433d31cf384bed22fb8482a55ba38c8a35602 |     
    i686     |         agentpp-4.6.0          | NOK | http://autobuild.buildroot.net/results/3a356713b7398f39f649451fd793e6af03cb6a7d |     
 microblaze  |       batman-adv-2022.3        | NOK | http://autobuild.buildroot.net/results/004d03967b3a628570e1fdb808d3731a4128a8ea |     
    sh4      |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/a676cd9701edb3573cbcafb7a78b507a6b4d4ee2 | ORPH
   sparc     |       dahdi-linux-3.2.0        | NOK | http://autobuild.buildroot.net/results/62ae4ea5b6590ac08c6fd629d13818a57a65e86f |     
  aarch64    |     edk2-edk2-stable202208     | NOK | http://autobuild.buildroot.net/results/83ae63d9ed1b3a52dc03dc0a7c1f7c8dc69a5df4 |     
   arceb     |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/8d0a7410361debfb5d2951d6113301fbcb1daec0 | ORPH
  riscv64    |    freeradius-client-1.1.7     | NOK | http://autobuild.buildroot.net/results/3f50902293cad3f2a9c91c7beaed89f04737172c |     
   mips64    | fs/cramfs/cramfs.mk:46: /ho... | NOK | http://autobuild.buildroot.net/results/2ea0dcec078712682cdfc4b391b2127bfb6ec816 |     
  mips64el   | fs/cramfs/cramfs.mk:46: /ho... | NOK | http://autobuild.buildroot.net/results/4f5b4ad232e280e109f981d82e2ed85c55a257cb |     
   s390x     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/854452d851a2b883d29df3d0314b6293593eedce |     
    or1k     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/57e6487d3ecc7760f50475a2dcc26fbb0c214c91 |     
   x86_64    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/ffbba367cd7801c7a1b3c9b7af17b70b9ed67877 |     
  powerpc    | glibc-2.37-2-g9f8513dc64119... | NOK | http://autobuild.buildroot.net/results/c9777328c5c2215a536b7c69b70b08fdcaf61925 |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/27f53fa0d923e452fa46579f226c2004da88f02c |     
    or1k     |  gobject-introspection-1.74.0  | NOK | http://autobuild.buildroot.net/results/c54d5c42f4506406f6e25bb5958df6f577d3c02f | ORPH
  sparc64    |  gobject-introspection-1.74.0  | NOK | http://autobuild.buildroot.net/results/de7d13622a5a38861a2008e54f4b28a0b5d547ab | ORPH
 aarch64_be  |         haproxy-2.6.9          | NOK | http://autobuild.buildroot.net/results/bd0565e8c12ac8d3642289d6e8923fd2b48f7228 |     
  aarch64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/8724e34838849ba181a189353407d51559c810a5 |     
   armeb     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/a313102bff1027bf33e71b0c0da2de49b0665406 |     
   armeb     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/8a5479b718b88b987df5c03880835add206bfb0c |     
 microblaze  |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/73ccb93579ae291f1aebde69d7a733b5408555f3 |     
    i586     |        host-go-1.19.10         | NOK | http://autobuild.buildroot.net/results/53f5eda3b983b4ffc6ce4fe819784bc6a0bdc3ba |     
powerpc64le  |        host-go-1.19.10         | NOK | http://autobuild.buildroot.net/results/9de8215cd7843e53327c23ffea4f93ca0e5aba1b |     
powerpc64le  | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/3f8dbf8cd1cf5420140c99fade98793af270f18b | ORPH
    or1k     |        host-runc-1.1.7         | NOK | http://autobuild.buildroot.net/results/a938e9aab297dd3e8b7806734753419fbd6b4e1b |     
  sparc64    |        host-rust-1.68.2        | NOK | http://autobuild.buildroot.net/results/3c97430e8308c088bd3599874fbe3faef1b3795d |     
   x86_64    |        host-rust-1.68.2        | NOK | http://autobuild.buildroot.net/results/c5792d4bb195c51e3b040ee6325a4bb3021bfd74 |     
  aarch64    |        host-rust-1.68.2        | NOK | http://autobuild.buildroot.net/results/be26e66da0ca1b204993732041000b6047d721aa |     
  powerpc    |        host-rust-1.68.2        | NOK | http://autobuild.buildroot.net/results/392c47450661f9d3b32eba2830aa94339c9ada89 |     
  powerpc    |        host-rust-1.68.2        | NOK | http://autobuild.buildroot.net/results/06921d9946eb3aadc85c9cad7477a3f4d624d803 |     
    mips     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/320af4f6afb10edbfe9843bf034333a9fb013d3d |     
microblazeel |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/54ee88244e8084539f4b4271908b191d623ac57b |     
    arm      |          libsepol-3.5          | NOK | http://autobuild.buildroot.net/results/e41d98ddf3471c81af02f05f2987bb80ff29d587 |     
   sparc     |        lightning-2.2.1         | NOK | http://autobuild.buildroot.net/results/ba073edb36a1d4e096a6ce6a6ef3ccef6c9756d0 |     
   arceb     |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/e9d75b23c0f2b94eccc7fdee33ee0106efef0f7a | ORPH
   nios2     |          linux-6.3.6           | NOK | http://autobuild.buildroot.net/results/d5523ecc93e157ac48e954101eedb292a73b3660 | ORPH
   mips64    |          linux-6.3.6           | NOK | http://autobuild.buildroot.net/results/5ce9a6a9eadabbd69c73b19d6793a4dc6d3b5d21 | ORPH
  mips64el   |          linux-6.3.6           | NOK | http://autobuild.buildroot.net/results/1cb564a689d144f5b029f5796871ab2b75fed5d1 | ORPH
    i686     |          linux-6.3.6           | NOK | http://autobuild.buildroot.net/results/cc403389eb6e846061851979842cf8fee3d46e0b | ORPH
    arm      |        liquid-dsp-1.4.0        | NOK | http://autobuild.buildroot.net/results/8c3e075c8858ee839eabf97682cb8569416ed61e |     
    arm      |        liquid-dsp-1.4.0        | NOK | http://autobuild.buildroot.net/results/3bb462ab80e7a6b19c10758b2e1081721ffffde4 |     
  mips64el   |     ltp-testsuite-20230127     | NOK | http://autobuild.buildroot.net/results/058a992dbc3c903f4fa8adb7ed16e55422ead122 |     
  sparc64    |     ltp-testsuite-20230127     | NOK | http://autobuild.buildroot.net/results/2692a5cef4c2b5bf1ba46d3d3792fb0aebd2bb4d |     
   x86_64    |     ltp-testsuite-20230127     | NOK | http://autobuild.buildroot.net/results/044a09390c6700b80046e51664b236752d930a4c |     
   x86_64    |     ltp-testsuite-20230127     | NOK | http://autobuild.buildroot.net/results/341e138fb4f1d6aff0d77193f29fddf6adc7142d |     
   sparc     |        nfs-utils-2.6.3         | NOK | http://autobuild.buildroot.net/results/99f3084b1a02f1588eb5a20f96e8637cbe3a0636 |     
    arm      |           php-8.2.6            | NOK | http://autobuild.buildroot.net/results/3c86be77415bb436b8b175b80c4e09dd1d26b854 |     
   armeb     |           pv-1.6.20            | NOK | http://autobuild.buildroot.net/results/a151b1a86885610d1de8c17b818fe02f2cc55a1f | ORPH
 powerpc64   |    python-stack-data-0.6.2     | NOK | http://autobuild.buildroot.net/results/dd92599be39a0511c516b56a9645329e67ed39fc |     
   sh4eb     |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/0582d7c28da23ed45d742692b128e26ee285a06c | ORPH
   sparc     |           strace-6.3           | NOK | http://autobuild.buildroot.net/results/e4e747a14aa665d802747060ece526a148bcaa2c |     
   nios2     |           strace-6.3           | NOK | http://autobuild.buildroot.net/results/9ca537ccaeb857bee9aa81e1ea1e29d6c2d202ea |     
 powerpc64   |           strace-6.3           | NOK | http://autobuild.buildroot.net/results/1c4032bca147a61dcad3f3bd6572edc80f36556a |     
    mips     |            unknown             | NOK | http://autobuild.buildroot.net/results/2873b4ddb8b314bb0f6630466c7d29b13df3a9ba |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/14c273a496595e4bbdf822facd05097e73d828bb |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/0045c1358f2891586f6a8669d9a9c5ad92d7d17b |     
  sparc64    |            unknown             | NOK | http://autobuild.buildroot.net/results/5cb46f65ba9488e18316da0e4561aaf60fca9563 |     
   mips64    |            unknown             | NOK | http://autobuild.buildroot.net/results/3bb0263c79a3082b10b29ceec029a220da496626 |     


Classification of failures by reason for 2023.02.x
--------------------------------------------------

  gobject-introspection-1.72.0 | 1 
            host-binutils-2.38 | 1 
                host-go-1.19.9 | 1 
               host-runc-1.1.7 | 1 
              libgcrypt-1.10.1 | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/50db70f3fda7f0e3832303849cdbac3cbcbba0f2 | ORPH
    mips     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/b4757623d3f295f54ce3ada4d83695fa033f8778 |     
   x86_64    |         host-go-1.19.9         | NOK | http://autobuild.buildroot.net/results/bc00d362f5246261e9e3b17ed65caecc781cae05 |     
   mips64    |        host-runc-1.1.7         | NOK | http://autobuild.buildroot.net/results/fd5493e0b857515c4b147ea617bdc76e3bca659a |     
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/0a1a5509835fa368cea25ec89e7725cd04fe792f | ORPH



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
