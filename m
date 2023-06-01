Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0C28C7EE2C
	for <buildroot@archiver.kernel.org>; Thu,  1 Jun 2023 05:34:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 41F6581E6E;
	Thu,  1 Jun 2023 05:34:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 41F6581E6E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FEH4JyGTsSZf; Thu,  1 Jun 2023 05:34:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F41A981E65;
	Thu,  1 Jun 2023 05:34:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F41A981E65
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BE55D1BF852
 for <buildroot@lists.busybox.net>; Thu,  1 Jun 2023 05:34:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7FAC9424D6
 for <buildroot@lists.busybox.net>; Thu,  1 Jun 2023 05:34:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7FAC9424D6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zahJM2fArwN6 for <buildroot@lists.busybox.net>;
 Thu,  1 Jun 2023 05:34:11 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C153D424E0
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C153D424E0
 for <buildroot@buildroot.org>; Thu,  1 Jun 2023 05:34:10 +0000 (UTC)
X-GND-Sasl: thomas.petazzoni@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 83C1B40007
 for <buildroot@buildroot.org>; Thu,  1 Jun 2023 05:34:07 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Thu, 01 Jun 2023 05:34:07 -0000
Message-Id: <20230601053413.7FAC9424D6@smtp4.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1685597647; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=EQqw9jDx7tii+eTGxOifT5CV6mvAKaz1H4DO12DMFTs=;
 b=cMQsSpHsGI9fZQ8zRqocuKOtSBJzVVgMwsB1cCjI8OFT0nuhQEIiUGZD2d6Ozbp3xAZ2oB
 gdsZ0T6fWKp5tzVZu6EVJeS2JrZVWqjBy6N5gPINCX51x2te1+3kjG8lYoUrcZYAFvYvKX
 rI0C9lDKOE1igxaEEc4m0HiMBL5JJFFm0nqZzy7DUexpswwgPXr1bW7adxG+ocsFNDmyWk
 FPe6+RcGYAWn/Wqfg+MRpwZ5AURsyivhj9sQCNtWfl3lYpWFGGJaOZJs707ijrslr195p1
 pIL+Hh8DbnoSrm7Sp3/DXoPs6ezhoOi3DuYU5FOf+MDRl2Z8qMYXGGi4KqSEEA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=cMQsSpHs
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-05-31
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

Autobuild statistics for 2023-05-31
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  |  2  |  0  |  0  |  2  |
  2023.02.x  | 10  |  7  |  0  | 17  |
    master   | 73  | 73  |  0  | 146 |

Classification of failures by reason for master
-----------------------------------------------

package/sdl2_net/sdl2_net.m... | 8 
                   linux-6.3.4 | 6 
  gobject-introspection-1.74.0 | 4 
                elfutils-0.186 | 3 
                       unknown | 3 
                 agentpp-4.6.0 | 2 
           at-spi2-core-2.48.2 | 2 
        edk2-edk2-stable202208 | 2 
fs/ubifs/ubifs.mk:49: /home... | 2 
            host-binutils-2.38 | 2 
              host-rust-1.68.2 | 2 
                    olsr-0.9.8 | 2 
                 uclibc-1.0.43 | 2 
android-tools-4.2.2+git2013... | 1 
                  assimp-5.2.5 | 1 
                     audit-3.1 | 1 
                 coreutils-9.3 | 1 
             f2fs-tools-1.15.0 | 1 
             fontconfig-2.14.2 | 1 
fs/cramfs/cramfs.mk:46: /ho... | 1 
fs/jffs2/jffs2.mk:71: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
glibc-2.37-2-g9f8513dc64119... | 1 
             gnuradio-3.10.4.0 | 1 
            host-binutils-2.37 | 1 
         host-gcc-final-11.3.0 | 1 
host-gdb-arc-2020.09-releas... | 1 
host-heimdal-f4faaeaba371ff... | 1 
libdill-32d0e8b733416208e04... | 1 
                libdrm-2.4.115 | 1 
               libglib2-2.76.1 | 1 
                    libndp-1.8 | 1 
        ltp-testsuite-20230127 | 1 
               nfs-utils-2.6.3 | 1 
                  ntp-4.2.8p15 | 1 
            ocf-linux-20171122 | 1 
                   perl-5.36.1 | 1 
                     php-8.2.6 | 1 
sconeserver-8d1935919a20133... | 1 
                    sdl-1.2.15 | 1 
           sdl2_net-legal-info | 1 
           uboot-tools-2021.07 | 1 
               valgrind-3.20.0 | 1 
                xenomai-3.0.10 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |         agentpp-4.6.0          | NOK | http://autobuild.buildroot.net/results/f508a864d8fd32159fc5dca209bed544fdbd874f |     
    i586     |         agentpp-4.6.0          | NOK | http://autobuild.buildroot.net/results/d32202b1fcfce1ea12882719704d7eefdd9651ac |     
 powerpc64   | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/0904c4faacf750a67a5b21ff3d037c85cd472a15 |     
    arm      |          assimp-5.2.5          | NOK | http://autobuild.buildroot.net/results/667b7098cba21189cf413474cfdf95b188a8b094 | ORPH
   x86_64    |      at-spi2-core-2.48.2       | NOK | http://autobuild.buildroot.net/results/777cae4bbcf28cf523cfa54340f378907c8cd952 |     
    mips     |      at-spi2-core-2.48.2       | NOK | http://autobuild.buildroot.net/results/d2f62fac516e91d06687c3074c9cf6cc1f5eb89b |     
    arm      |           audit-3.1            | NOK | http://autobuild.buildroot.net/results/865c7de0feb3b612a08cfd1a9e5ef73e3528a42f |     
    m68k     |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/a571b51a11b58b0001f6d9c534d87a61216a0744 | ORPH
    i686     |     edk2-edk2-stable202208     | NOK | http://autobuild.buildroot.net/results/cddb03fa8e36ab14ef59066ec63cc215c6dfcafe |     
    i686     |     edk2-edk2-stable202208     | NOK | http://autobuild.buildroot.net/results/815f22aa7e1d8bacada4a014ba5958e0754a2dfc |     
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/4df2d56f2a388cf893dd19f4101fdd4376199520 | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/3ee99a8dea26fa1ccddfbb56fc067cff8e041bd8 | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/a2cef42a05da1024b7f5751b2c68ca55f114cba9 | ORPH
    or1k     |       f2fs-tools-1.15.0        | NOK | http://autobuild.buildroot.net/results/35ac114e9b344570a889cc1c16479057c93b271b |     
  riscv64    |       fontconfig-2.14.2        | NOK | http://autobuild.buildroot.net/results/df804a52f530459ad6dc163ed5f85894d6dd8aea | ORPH
   s390x     | fs/cramfs/cramfs.mk:46: /ho... | NOK | http://autobuild.buildroot.net/results/762191195038e1727b6926e16c48fcf42399c03b |     
    i686     | fs/jffs2/jffs2.mk:71: /home... | NOK | http://autobuild.buildroot.net/results/bf1a6f2c095dde52a780f570a658b7683dc46e0b |     
    i686     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/da787c6659ffa78bbf84461d0541494c959d9e37 |     
  sparc64    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/526a6aeebf48051445db8984cd8174319ef5a442 |     
powerpc64le  | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/3a7a5785bf4938c86437e7793d4efd9316e91b7c |     
  mips64el   | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/c6b820ff1431fdb5b144ef8e595bee08a7733d79 |     
  mips64el   | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/ef1603d52c0b52d4999e484ef473f297cf97b634 |     
  powerpc    | glibc-2.37-2-g9f8513dc64119... | NOK | http://autobuild.buildroot.net/results/a2203af6e9a62763610bdd03a3f5c3cfeab2cbff |     
    arm      |       gnuradio-3.10.4.0        | NOK | http://autobuild.buildroot.net/results/7423df5db5237d94bb49e32698828d4fe470e39b |     
    or1k     |  gobject-introspection-1.74.0  | NOK | http://autobuild.buildroot.net/results/6a25557c64dbcd140e199b08bf3b19a236dfa41d | ORPH
   s390x     |  gobject-introspection-1.74.0  | NOK | http://autobuild.buildroot.net/results/8ad2e475c3c4ac5ff0dbf763dcb7ec034e86a532 | ORPH
   nios2     |  gobject-introspection-1.74.0  | NOK | http://autobuild.buildroot.net/results/58b6fc6a25594247240c32d7c044488793b4385e | ORPH
  sparc64    |  gobject-introspection-1.74.0  | NOK | http://autobuild.buildroot.net/results/008802719c38c47b259e0a1b53c1d95b94a8d0ed | ORPH
microblazeel |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/463c5669b482bd3508bace60342c606608c59307 |     
    arm      |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/51a5495828c8ef16f704730f514823cd3f34b42b |     
   sparc     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/798664045a89ddae6df07bf3f1ac14a7206ec157 |     
 microblaze  |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/e0c0347621945c842901931ec5141db7281a7ade |     
    arc      | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/6f6869f05fb81eed52e014e965d8b971d2e0e709 | ORPH
powerpc64le  | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/9e6c62ad252b447054e9f4634817063918a29cec | ORPH
  sparc64    |        host-rust-1.68.2        | NOK | http://autobuild.buildroot.net/results/e9503d59a895bcf7c39eed0059b232e8b6ebb54e |     
powerpc64le  |        host-rust-1.68.2        | NOK | http://autobuild.buildroot.net/results/c052c485a013895a8b21278e56884cbc71af5327 |     
    or1k     | libdill-32d0e8b733416208e04... | NOK | http://autobuild.buildroot.net/results/516fb1adffbe39b14462719e90365910aec151e3 |     
    arm      |         libdrm-2.4.115         | NOK | http://autobuild.buildroot.net/results/eed10fd5b5fc6cff08eca9b5abdbf307b56e6c7c |     
    m68k     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/9736407813493db69e52ee99ee4df28f01646053 |     
  riscv64    |           libndp-1.8           | NOK | http://autobuild.buildroot.net/results/1bb46ac8b66c6189e0aff9a3e5a7c44e2982d8ef |     
powerpc64le  |          linux-6.3.4           | NOK | http://autobuild.buildroot.net/results/53ceea8a9e26fc3d880f4c007eed4c03c436a562 | ORPH
   mips64    |          linux-6.3.4           | NOK | http://autobuild.buildroot.net/results/2eff020d05fac8e7b6535b692a001872a406436a | ORPH
    arc      |          linux-6.3.4           | NOK | http://autobuild.buildroot.net/results/f1404e212cd15fa751c5a588b0714dc5cb15d916 | ORPH
  mips64el   |          linux-6.3.4           | NOK | http://autobuild.buildroot.net/results/404a4d1851d14cfd1adc835aa40a14e971ec7831 | ORPH
    sh4a     |          linux-6.3.4           | NOK | http://autobuild.buildroot.net/results/45dd22c5d1c2f7fc0f4503f8aa3d2644644b32f0 | ORPH
    m68k     |          linux-6.3.4           | NOK | http://autobuild.buildroot.net/results/34b0497ebf8022b6007a1c0708579b040b386ef1 | ORPH
   x86_64    |     ltp-testsuite-20230127     | NOK | http://autobuild.buildroot.net/results/58a58d53de56085ce9c0054f141c69e28a46ed8f |     
   sparc     |        nfs-utils-2.6.3         | NOK | http://autobuild.buildroot.net/results/6a3c392e069f7cf72c6f4f00b73fd9a27be1f8d9 |     
  riscv64    |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/79379dedccb13cc94695f277afcb520baa9f6ac9 | ORPH
 powerpc64   |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/a4faa7148a22690faa8e8ea79ed38f095e0707eb | ORPH
   s390x     |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/1c51306ad05ae2782b4801858d10fc8dbec34bea | ORPH
   mips64    |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/4a306ab2c6d592a3119d07cabb20be0b029a8096 | ORPH
powerpc64le  | package/sdl2_net/sdl2_net.m... | NOK | http://autobuild.buildroot.net/results/9f198700147dd6eb02e2f76b465aef20859f0e05 |     
   sparc     | package/sdl2_net/sdl2_net.m... | NOK | http://autobuild.buildroot.net/results/750e7e1fb80a0801e8f54cf82a8c1a9e260ec9c4 |     
   mipsel    | package/sdl2_net/sdl2_net.m... | NOK | http://autobuild.buildroot.net/results/ae30e8bb18a9227cc01c80af1ca271d03133d094 |     
powerpc64le  | package/sdl2_net/sdl2_net.m... | NOK | http://autobuild.buildroot.net/results/dcc5bb5b1c9b4039ba1c98d59504433523036f50 |     
    i686     | package/sdl2_net/sdl2_net.m... | NOK | http://autobuild.buildroot.net/results/b7fd5fb3f4e954925bcc0676beb28c7afddeac47 |     
    i686     | package/sdl2_net/sdl2_net.m... | NOK | http://autobuild.buildroot.net/results/5dba9b35d039a3d25d4441a8dc63a9d609b44767 |     
   xtensa    | package/sdl2_net/sdl2_net.m... | NOK | http://autobuild.buildroot.net/results/7e9e3fc5ffa392ab3fb4a57d2cdfe7677077ad19 |     
   armeb     | package/sdl2_net/sdl2_net.m... | NOK | http://autobuild.buildroot.net/results/ae1dfb6341751f288fa4a515c6d21675c91c41c6 |     
    arm      |          perl-5.36.1           | NOK | http://autobuild.buildroot.net/results/d2f56e60403ffd1abc3192888c2a0827f0e28775 |     
   sh4eb     |           php-8.2.6            | NOK | http://autobuild.buildroot.net/results/eacc8ad3c4c90c1e169dbd6fbb3c79692711b8e6 |     
   sh4aeb    | sconeserver-8d1935919a20133... | NOK | http://autobuild.buildroot.net/results/63493ff6bca64f1b29ec06a5fcf65f91e1a0272b |     
   sh4eb     |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/d4138fea34363e2735b6344b3204204658d378e0 | ORPH
   s390x     |      sdl2_net-legal-info       | NOK | http://autobuild.buildroot.net/results/cdcebe72e66eb6898f7fc5ad9c14f4d17bb9950f | ORPH
    arm      |      uboot-tools-2021.07       | NOK | http://autobuild.buildroot.net/results/d6282d871e9b9aad64f8ecf78ff87a47d7e80898 | ORPH
  powerpc    |         uclibc-1.0.43          | NOK | http://autobuild.buildroot.net/results/43481cbeb61ac61296ef817b19e9d6329c70ff8b |     
  powerpc    |         uclibc-1.0.43          | NOK | http://autobuild.buildroot.net/results/8ac6b2611e4814786cfe56b6e0970a2241c13af8 |     
    mips     |            unknown             | NOK | http://autobuild.buildroot.net/results/d90e55b635a457adb74a1f2fe9dc4bff6e9dd9c4 |     
   s390x     |            unknown             | NOK | http://autobuild.buildroot.net/results/639dea49c47cb19d2e999a54be6193f085e66014 |     
   sh4eb     |            unknown             | NOK | http://autobuild.buildroot.net/results/56d9919b391463765879133e7d2a190867a6c9a0 |     
  mips64el   |        valgrind-3.20.0         | NOK | http://autobuild.buildroot.net/results/65274f3c039e863cd557cd62dd1509f247291f31 | ORPH
 powerpc64   |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/5b505369431c78e05517e8699f1b16db6e7068e5 |     


Classification of failures by reason for 2023.02.x
--------------------------------------------------

              host-rust-1.67.1 | 2 
                busybox-1.36.0 | 1 
host-gdb-arc-2020.09-releas... | 1 
               host-qemu-7.2.0 | 1 
               libglib2-2.72.3 | 1 
              libsodium-1.0.18 | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |         busybox-1.36.0         | NOK | http://autobuild.buildroot.net/results/9914e567c15010daa45a5b3c477218275000fe4c | ORPH
    arc      | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/9126f8998d8610cb25c77101dfe3b703310bde5e | ORPH
   s390x     |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/cfdc5b175dcc34778b8fa5c0dd22bcbc2a7a89cd |     
  sparc64    |        host-rust-1.67.1        | NOK | http://autobuild.buildroot.net/results/c9126619e09ec68d68085c46ca001b6b21141d90 |     
   x86_64    |        host-rust-1.67.1        | NOK | http://autobuild.buildroot.net/results/bc7cad755097636db9fb0074d6a35c34dc262b3a |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/7e180a1933830c92d6b937758b9c520704a79259 |     
   arceb     |        libsodium-1.0.18        | NOK | http://autobuild.buildroot.net/results/e5b520b9f52fcae9c2eb0a3336b4269a1cb8dcce |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
