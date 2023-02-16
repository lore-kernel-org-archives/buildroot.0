Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88B44C636CC
	for <buildroot@archiver.kernel.org>; Thu, 16 Feb 2023 06:46:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B214E41836;
	Thu, 16 Feb 2023 06:46:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B214E41836
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zcAXpblCnujR; Thu, 16 Feb 2023 06:46:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AC08F4183B;
	Thu, 16 Feb 2023 06:46:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AC08F4183B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 28CF71BF834
 for <buildroot@lists.busybox.net>; Thu, 16 Feb 2023 06:46:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ED83E81F8A
 for <buildroot@lists.busybox.net>; Thu, 16 Feb 2023 06:46:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ED83E81F8A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fFQeMEk33gzP for <buildroot@lists.busybox.net>;
 Thu, 16 Feb 2023 06:46:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4583B814BA
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4583B814BA
 for <buildroot@buildroot.org>; Thu, 16 Feb 2023 06:46:12 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 683B1240004
 for <buildroot@buildroot.org>; Thu, 16 Feb 2023 06:46:09 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Thu, 16 Feb 2023 06:46:09 -0000
Message-Id: <20230216064614.ED83E81F8A@smtp1.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1676529969; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=+bKDtxhoDnsl21n/lTPOIxRi8alOo/ftaLnHWJIjWj0=;
 b=DzWPAVsaiu3AT1JXEGYZUNz0d3fToxzmDLMM9c4rcP4Wdu8xAFlXADyXTLcszjnzx63xKB
 2WrEAqspVPs3uLcn0CzxCtMIFxcuUD4YxEo1zhyIBLWckn1xghm1cS094YD8wxb+8rN0gO
 E80FU3vZz9RsFoJEP/wjr8URrtD/tuOrYBGNf7jJq7FIGDtb6emICHjwU2Sb5QLwEcYpfM
 gwcfW+2cYYhUztbgbENXJEsgh/kcdMbJjqR9+6yau6wzGN8ccxPaImaK07ZcfZ9DgLVcxK
 hbBR/dkneXpp61fHQ5w3mTlFvmZkMZ2Zfztr7+ikbGDTU4qA973hxOud5Qj0uQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=DzWPAVsa
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-02-15
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

Autobuild statistics for 2023-02-15
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  |  2  |  2  |  0  |  4  |
  2022.11.x  | 19  | 21  |  0  | 40  |
    master   | 176 | 172 |  2  | 350 |

Classification of failures by reason for master
-----------------------------------------------

                  gnupg2-2.4.0 | 14
                       unknown | 9 
  gobject-introspection-1.72.0 | 6 
            host-binutils-2.38 | 6 
              host-pahole-1.24 | 6 
           python-numpy-1.23.5 | 5 
                elfutils-0.186 | 4 
                gerbera-1.10.0 | 4 
            host-binutils-2.37 | 4 
              host-rust-1.67.0 | 4 
                  linux-6.1.11 | 4 
                    olsr-0.9.8 | 4 
glibc-2.36-81-g4f4d7a13edfd... | 3 
                host-go-1.19.6 | 3 
             libgpg-error-1.46 | 3 
pistache-3ec9d7c4f8b828fdd3... | 3 
                busybox-1.36.0 | 2 
             containerd-1.6.16 | 2 
                 dmalloc-5.6.5 | 2 
fs/ubifs/ubifs.mk:49: /home... | 2 
            host-binutils-2.39 | 2 
                host-go-1.19.5 | 2 
                  janet-1.26.0 | 2 
               libcap-ng-0.8.3 | 2 
               libglib2-2.72.3 | 2 
                   perl-5.36.0 | 2 
                     php-8.2.2 | 2 
            quickjs-2021-03-27 | 2 
                    sdl-1.2.15 | 2 
                 systemd-252.4 | 2 
             uccp420wlan-6.9.1 | 2 
                     ace-7.0.6 | 1 
              asterisk-16.29.1 | 1 
  binutils-arc-2020.09-release | 1 
             docker-cli-23.0.0 | 1 
                     efivar-38 | 1 
             f2fs-tools-1.15.0 | 1 
                  faad2-2.10.1 | 1 
                  ffmpeg-4.4.3 | 1 
              fluent-bit-2.0.9 | 1 
             fontconfig-2.13.1 | 1 
fs/romfs/romfs.mk:32: /tmp/... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /tmp/... | 1 
fs/ubifs/ubifs.mk:49: /tmp/... | 1 
fs/ubifs/ubifs.mk:49: /tmp/... | 1 
                 fwts-22.09.00 | 1 
                    gdal-3.5.2 | 1 
                     gmp-6.2.1 | 1 
         gobject-introspection | 1 
google-breakpad-c85eb4a59b6... | 1 
         host-gcc-final-12.2.0 | 1 
       host-gcc-initial-11.3.0 | 1 
         host-libarchive-3.6.2 | 1 
               host-runc-1.1.4 | 1 
               libbytesize-2.7 | 1 
libeastl-45469730d641868ce0... | 1 
                     libgcrypt | 1 
              libgcrypt-1.10.1 | 1 
                libglvnd-1.4.0 | 1 
               libgpgme-1.17.1 | 1 
                 libnss-3.88.1 | 1 
              libtommath-1.2.0 | 1 
libuci-4b3db1179747b6a67790... | 1 
     linux-5.10.162-cip24-rt10 | 1 
        ltp-testsuite-20220930 | 1 
          lttng-modules-2.13.7 | 1 
                   luvi-2.13.0 | 1 
                    ne10-1.2.1 | 1 
             netsniff-ng-0.6.8 | 1 
                  ntp-4.2.8p15 | 1 
                numactl-2.0.16 | 1 
                     nut-2.8.0 | 1 
            ocf-linux-20171122 | 1 
              open-iscsi-2.1.8 | 1 
package/multipath-tools/mul... | 1 
                   pcre2-10.42 | 1 
              php-xdebug-3.0.4 | 1 
                     pv-1.6.20 | 1 
                ramspeed-2.6.0 | 1 
rtl8812au-aircrack-ng-e7a4a... | 1 
rtl8821cu-86cc5ceb7c28b9b99... | 1 
              skalibs-2.12.0.1 | 1 
                 sudo-1.9.12p2 | 1 
       ti-k3-r5-loader-2022.10 | 1 
ulog-0389d243352255f6182326... | 1 
               valgrind-3.19.0 | 1 
                 wolfssl-5.5.3 | 1 
                xenomai-3.0.10 | 1 
                  zabbix-6.2.7 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  sparc64    |           ace-7.0.6            | NOK | http://autobuild.buildroot.net/results/9dee7c09fd7b41d276df0285a0f3dcae1a71f041 | ORPH
    arc      |        asterisk-16.29.1        | NOK | http://autobuild.buildroot.net/results/edd90eaf31d82be58f7ed500a85a3ac3f0bdcc26 |     
    arc      |  binutils-arc-2020.09-release  | NOK | http://autobuild.buildroot.net/results/d5095669fca3dab51b6edaa4a637e4ac61fc7f09 |     
   mipsel    |         busybox-1.36.0         | NOK | http://autobuild.buildroot.net/results/35c59ac08f0bc6fdc39df8b2a218a51628234641 | ORPH
    mips     |         busybox-1.36.0         | NOK | http://autobuild.buildroot.net/results/bbc39d279d983d13c17e0c4ea8a3a57190e0f358 | ORPH
   x86_64    |       containerd-1.6.16        | NOK | http://autobuild.buildroot.net/results/04fb1b05f94f581f5f4b57e360c4980c39bb01d4 |     
   x86_64    |       containerd-1.6.16        | NOK | http://autobuild.buildroot.net/results/ed6b51115da0bab32546a98a0fa0099904c02b57 |     
  powerpc    |         dmalloc-5.6.5          | NOK | http://autobuild.buildroot.net/results/ca04d74e204eeeef2032a31d384864130539690b | ORPH
    i686     |         dmalloc-5.6.5          | NOK | http://autobuild.buildroot.net/results/564b0c6b7d737cd460f1d807cae2e7715f350164 | ORPH
   x86_64    |       docker-cli-23.0.0        | NOK | http://autobuild.buildroot.net/results/fb892eb343f2912c6bf7e72552eb8c2302fd31c4 |     
  aarch64    |           efivar-38            | NOK | http://autobuild.buildroot.net/results/20d5fdce075fe996637a5fac884a62df42cfb7ab |     
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/28ac1df2acf9fd6d438c67d27e73de29583ba573 | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/4cfcaa3245ab76b0680def6cbd736bfea61e82a3 | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/5dcbfd961f72f6c0f794c1f6dd6c844526ce09dc | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/43c426b0350561273729c3ddfaedc1ae6fbf4d9b | ORPH
    or1k     |       f2fs-tools-1.15.0        | NOK | http://autobuild.buildroot.net/results/395c54dedc7edc97bd866bdff619a01bcd9e74ec |     
    sh4      |          faad2-2.10.1          | NOK | http://autobuild.buildroot.net/results/21e55f05bc0b5c0caaa02c86b83cbb52ace570e7 |     
  aarch64    |          ffmpeg-4.4.3          | NOK | http://autobuild.buildroot.net/results/5a8003d832d7797940618038bddee63cda6f4813 |     
    mips     |        fluent-bit-2.0.9        | NOK | http://autobuild.buildroot.net/results/63a6ba9104dfddbd7f6a7debadc0c6ef6e3a21f5 |     
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/f697ada67a6f7f45665f2f9ef938e992cbcb75cc | ORPH
  sparc64    | fs/romfs/romfs.mk:32: /tmp/... | NOK | http://autobuild.buildroot.net/results/a3f816874bde147c478e89171cc95fca5ea05b62 |     
   s390x     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/f4ddf4c900d92f88510818092caa1930d550b0b4 |     
   mipsel    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/01c7d1dbf2301a5eb270789c9cc4459ed47149e5 |     
   s390x     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/ab36eac01244c5c23bdaa8aed7e29985082a3caf |     
   sh4eb     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/09b849fadab3476b3cce7bcc0139dcff4f544ec7 |     
   arceb     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/2a74bbf23ddcae18d160f84c5bacbdfb7ed8e2e2 |     
   s390x     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/3afbc3deb52c73b110a4d01b048a93b0427612b4 |     
    mips     | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/fe79afaa525785565385b1ad553f9059dcfa2d2e |     
   sparc     | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/114dc758207d617072b67d7c8432b357ce6dedb4 |     
   x86_64    | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/6d3873761d80a8cf727231290426cdc165f96964 |     
  aarch64    |         fwts-22.09.00          | NOK | http://autobuild.buildroot.net/results/007ed25ac8689801dd95a15ea2a2fdac70f8ec46 |     
   sh4aeb    |           gdal-3.5.2           | NOK | http://autobuild.buildroot.net/results/2ddcfaf126f86d37b5c343b87173f5759fe68dcf |     
 aarch64_be  |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/b0c70e27eca65892a5220cfd9ada62c2e4beca1b |     
 microblaze  |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/6cbb6a7627d28da11a942076d7372e80e1122388 |     
  powerpc    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/d7933c062904ffac486d7b6fc99845757b193734 |     
  riscv64    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/db582b9c53485c665f9f76b9e8103a34afb4e59a |     
    arc      | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/7a8fb93a1598c356d5e034a3a504fa2fddbeae73 |     
  powerpc    | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/c6d6759e37987ff38659b306b7dada8f063d98da |     
  powerpc    | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/e355df7965a7e2ac0a785234c0ac88ecef1a46cc |     
  riscv64    |           gmp-6.2.1            | NOK | http://autobuild.buildroot.net/results/7a025d36a2d80a572ac149997ab2b0f86d95f71c | ORPH
  aarch64    |          gnupg2-2.4.0          | NOK | http://autobuild.buildroot.net/results/71e49ffc3f3bfb61778eb4513fc955bc94e7d003 |     
    mips     |          gnupg2-2.4.0          | NOK | http://autobuild.buildroot.net/results/558ec000cb42b0e01f4c3adb36b5b5a4392547e4 |     
   mips64    |          gnupg2-2.4.0          | NOK | http://autobuild.buildroot.net/results/d0d3f84f734878799323c2bc5b4f93f2265ba9d2 |     
powerpc64le  |          gnupg2-2.4.0          | NOK | http://autobuild.buildroot.net/results/9c31284d7938120c85331209cd16d4b5b4fd9126 |     
  aarch64    |          gnupg2-2.4.0          | NOK | http://autobuild.buildroot.net/results/8f86c366c190164241afb633456e44d5fc0edc8d |     
   mips64    |          gnupg2-2.4.0          | NOK | http://autobuild.buildroot.net/results/650bb8155b416d7e4fe39d66111db3a3a69828c3 |     
   sh4aeb    |          gnupg2-2.4.0          | NOK | http://autobuild.buildroot.net/results/9ddfdfb65c93c0c294e7f6de92bae33298fad931 |     
    arm      |          gnupg2-2.4.0          | NOK | http://autobuild.buildroot.net/results/a5267685e4f59ac91026d855b3659d11dcb97ec5 |     
   mipsel    |          gnupg2-2.4.0          | NOK | http://autobuild.buildroot.net/results/9cc154310710ed0dc617205e25d614542b7bb776 |     
   sparc     |          gnupg2-2.4.0          | NOK | http://autobuild.buildroot.net/results/612d91c134e383ab1fa124fc56561cd5803350b5 |     
    m68k     |          gnupg2-2.4.0          | NOK | http://autobuild.buildroot.net/results/9a4b09625ec3bac6eb705294b610e06f70df83c2 |     
    i686     |          gnupg2-2.4.0          | NOK | http://autobuild.buildroot.net/results/ce63a0fc33c013e2a3fb9324e5d1a60ea1f2fdb0 |     
  mips64el   |          gnupg2-2.4.0          | NOK | http://autobuild.buildroot.net/results/370f2a6f70d934445053d7d6ad310ee89690ef1a |     
   x86_64    |          gnupg2-2.4.0          | NOK | http://autobuild.buildroot.net/results/a729120c817cc3c622c4ffebabc0bce81768c6af |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/3964a399be9c56beca82915e36f5bbcd6332ab2a |     
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/bb0e1f8db351a97e115705821f17db1ff18be563 | ORPH
    or1k     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/8676a8d36e73a8602543815d7b1bdc70fbe2f12e | ORPH
powerpc64le  |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/114c2c647c064edf6494c03f2aa159908dd854d1 | ORPH
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/db3ff08df89f905c17a568eae4318ef061684921 | ORPH
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/053f7b5920992c55692a993fc902cceb53d00d93 | ORPH
   x86_64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/348949355ea2921bf1cb20eaa0a6aa769aee275a | ORPH
    arm      | google-breakpad-c85eb4a59b6... | NOK | http://autobuild.buildroot.net/results/9ebc690eb3bed788dc5252639c99c91aad335802 |     
   armeb     |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/c2c742ccc125980d88116c0c777fc007aa346fb6 |     
microblazeel |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/e3c4784a64acdec47c554f779b5e370284b65213 |     
   mips64    |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/66f3ef307cb08d595213c0e10643f0d1356ad9c1 |     
   mipsel    |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/30221c558845fd3eb7a8aa81e064e77bb9edc997 |     
 powerpc64   |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/ed943af65e7b7042baf101f055f122aa4fd993ab |     
    sh4a     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/6f40bfc68fc80b8dd1963ecb35499189a5e131da |     
    mips     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/b27edb2fb36cc90c074934bb71e67436c63426f0 |     
  powerpc    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/1fe1f648fe816cacd7bae26d1a137ceeb486aad9 |     
   s390x     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/48e8d30ce201499453a715aacfdcc6c58d71ebf6 |     
  mips64el   |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/13a81e35b4f6f20e543209685c5a0f19daa9d524 |     
  sparc64    |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/f6b2611f2a85a2b898776238dc65d8bae64f85e5 |     
    or1k     |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/6761c39ed46dbde67a5802d1f6ecc77e35c227fd |     
   armeb     |     host-gcc-final-12.2.0      | NOK | http://autobuild.buildroot.net/results/c2716aab33032c359066adbfcf4cb43bcfc188c5 |     
 aarch64_be  |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/bc2a4fc35f9046c129ddb466620297a5510b69d2 |     
 aarch64_be  |         host-go-1.19.5         | NOK | http://autobuild.buildroot.net/results/fdabf629cc9804a8adce13d224f02c25b929b94a |     
  mips64el   |         host-go-1.19.5         | NOK | http://autobuild.buildroot.net/results/1005227f1187703c6e41347aaf46f9e971fab5bf |     
   mips64    |         host-go-1.19.6         | NOK | http://autobuild.buildroot.net/results/831b282445ac3a6ea84c9175426afb548265fbed |     
  aarch64    |         host-go-1.19.6         | NOK | http://autobuild.buildroot.net/results/fde8e1bd837cb7006b6d4652bc45a14f25a2a834 |     
  riscv64    |         host-go-1.19.6         | NOK | http://autobuild.buildroot.net/results/ffa6f19195a9c4577f40379c457b390d4211ba68 |     
  riscv64    |     host-libarchive-3.6.2      | NOK | http://autobuild.buildroot.net/results/1348173539dd09d4e4ed4e45f539f3596be1708f |     
    m68k     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/0e6181ac6db1d0b9fc5c7c5f145208b8c5e9b1a5 |     
   xtensa    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/dcada09cb1f17294b07d9c5bc215a07613004843 |     
  mips64el   |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/1263b7d898db47d050ae5fc803b557f462e26749 |     
    arm      |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/6354c390fb8ffede7f4f0480bc943f323f1b0bf6 |     
   s390x     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/19d0010080d12aae4eef347ed58513aace5f8951 |     
   sparc     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/fa0b8293b4ac25a0edc7fe941fa4f181801362a0 |     
 microblaze  |        host-runc-1.1.4         | NOK | http://autobuild.buildroot.net/results/bfa50d8c1bf3adbf8092871f828f9bf77181314b |     
    mips     |        host-rust-1.67.0        | NOK | http://autobuild.buildroot.net/results/c8f86e360bcfdf801bb1d043b8761c41f65adc39 |     
   x86_64    |        host-rust-1.67.0        | NOK | http://autobuild.buildroot.net/results/1f38aaaed7b9b0fc72f551d250c1ff68f3a69fe9 |     
    mips     |        host-rust-1.67.0        | NOK | http://autobuild.buildroot.net/results/5fe1501db6e9cca674d1c02696cd405d10d5f2ce |     
    arm      |        host-rust-1.67.0        | NOK | http://autobuild.buildroot.net/results/6ab84de8c6aa656136896fee5b2ba9f8d4f56c36 |     
    arm      |          janet-1.26.0          | NOK | http://autobuild.buildroot.net/results/ae9d8d27c76f0e20972c7874ef0246eec0cf5aab |     
    arm      |          janet-1.26.0          | NOK | http://autobuild.buildroot.net/results/a2b40adb93b751221ba2cdf9a705f86c30499021 |     
   arceb     |        libbytesize-2.7         | NOK | http://autobuild.buildroot.net/results/f8f12e584b01c33e9b28f2ad04bbf980ccaff576 | ORPH
  riscv64    |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/ef5c3a28f3b207278b841e57ffc3cc97a1430acb |     
  riscv64    |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/adf960f787d5552cfaa12c577f291bf3169d7b57 |     
  powerpc    | libeastl-45469730d641868ce0... | NOK | http://autobuild.buildroot.net/results/10ac7290112bfbf7b5d8da900c297bd65043b6a6 | ORPH
    arm      |           libgcrypt            | TIM | http://autobuild.buildroot.net/results/7cca6a3d6aa8706d43ab32f1520891e1c0625558 |     
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/b76290dbff3591b66d691da3bed1d6bcc0abe4d8 | ORPH
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/e37b9205ff33b1582aab9ca5e31f9fda30df428d |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/17f95aec4105e85dbd6d1528f6e7aff955d20b12 |     
 microblaze  |         libglvnd-1.4.0         | NOK | http://autobuild.buildroot.net/results/dbf03d1da34bbadab6bc4185e33eeaaf2821697a | ORPH
 aarch64_be  |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/d9ed87d42ea45a93539990169903d83cb07e7307 | ORPH
  aarch64    |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/07c84368de3aca4af2cdc797d8ab24ed5c3d86cb | ORPH
 aarch64_be  |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/8548fbcb56cc7c94657998565299c89bccc897f9 | ORPH
   nios2     |        libgpgme-1.17.1         | NOK | http://autobuild.buildroot.net/results/23849de6eb48fc48f3ee183392a8769d953309ce | ORPH
  powerpc    |         libnss-3.88.1          | NOK | http://autobuild.buildroot.net/results/4e74dffc2c9e99c7afe4fce01f92fa218f787924 |     
   arceb     |        libtommath-1.2.0        | NOK | http://autobuild.buildroot.net/results/56d68bb58b2b73af8bc684e43d0bb9fb971b23c8 |     
   mipsel    | libuci-4b3db1179747b6a67790... | NOK | http://autobuild.buildroot.net/results/1afb8ea81fc2f465b4db48f39ab0cdb346c759fe |     
   nios2     |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/b7140d4a80341e61cc8ec02e162cd1664853e210 | ORPH
  powerpc    |          linux-6.1.11          | NOK | http://autobuild.buildroot.net/results/4b4edb08df2f3dc43eddd5c736be3a1d39262fbf | ORPH
    mips     |          linux-6.1.11          | NOK | http://autobuild.buildroot.net/results/71c4623660a7b2870d14a07c373e2da2293a19a9 | ORPH
    arm      |          linux-6.1.11          | NOK | http://autobuild.buildroot.net/results/8eb868da489b6d2466482ed6835413d660435b55 | ORPH
    sh4      |          linux-6.1.11          | NOK | http://autobuild.buildroot.net/results/96e2d05665618db9becc1a6e64ce57b12e11b362 | ORPH
   x86_64    |     ltp-testsuite-20220930     | NOK | http://autobuild.buildroot.net/results/279978413aaf705449021240d077f728be3b3a42 |     
  sparc64    |      lttng-modules-2.13.7      | NOK | http://autobuild.buildroot.net/results/2079df94060d516eb9f6d2e9c75cc5a82d7bb3fc |     
 aarch64_be  |          luvi-2.13.0           | NOK | http://autobuild.buildroot.net/results/826aa550f3d4708012a0b3988e2ba7079a6ae67d | ORPH
  aarch64    |           ne10-1.2.1           | NOK | http://autobuild.buildroot.net/results/fb4f8a89be41c63ebfaa3cbb3498be863528277d |     
   s390x     |       netsniff-ng-0.6.8        | NOK | http://autobuild.buildroot.net/results/5e90a5776ba1e4ab70e426710516024f0adb1be3 |     
  riscv64    |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/3655f09519fe0b0f568163924654e81c5ff12e82 | ORPH
    or1k     |         numactl-2.0.16         | NOK | http://autobuild.buildroot.net/results/f3bf23693ac4bf1e7502d43812fdce7af56e8a7d |     
   armeb     |           nut-2.8.0            | NOK | http://autobuild.buildroot.net/results/4b47b15f44c8c5c163b0ec5ad23be962126b4195 |     
   arceb     |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/45a37b89375253d0bc643107c75a580979f62f82 | ORPH
    mips     |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/0a2e9480512d73a6c7909f4eeda68a1fe5d8fd96 | ORPH
    arm      |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/3fe72e5033b226abebbdb379d4cd0955896ae7e1 | ORPH
 powerpc64   |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/8f6995ecd0f6d6fb45ced55a3c5bcd26356ef828 | ORPH
    sh4      |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/aeedbefdd815fdad7984890d2bb30254fc4a4412 | ORPH
 aarch64_be  |        open-iscsi-2.1.8        | NOK | http://autobuild.buildroot.net/results/2824c76a36b52eef4db0710e92635b31ddb0ebbc |     
   mipsel    | package/multipath-tools/mul... | NOK | http://autobuild.buildroot.net/results/ab93da32395b927bd842b719ad420e897c2cae03 |     
   sparc     |          pcre2-10.42           | NOK | http://autobuild.buildroot.net/results/e209b583b19f7dfc77e369526f17186ea9150881 | ORPH
   arceb     |          perl-5.36.0           | NOK | http://autobuild.buildroot.net/results/596bb2308a17d81907e25fd8184e38921a977347 |     
   x86_64    |          perl-5.36.0           | NOK | http://autobuild.buildroot.net/results/5ec54e6532511d2d7727a1682f057a837d5abb96 |     
    or1k     |           php-8.2.2            | NOK | http://autobuild.buildroot.net/results/970e569067040816150f532ef73a1716535a746d |     
 microblaze  |           php-8.2.2            | NOK | http://autobuild.buildroot.net/results/1eef48630c73124fe839630ea76d5834c94a3699 |     
    mips     |        php-xdebug-3.0.4        | NOK | http://autobuild.buildroot.net/results/74a70b905738f6c9fb749bc20d638cc56a38ae98 |     
   sparc     | pistache-3ec9d7c4f8b828fdd3... | NOK | http://autobuild.buildroot.net/results/2bcf650d5d807b754cb578d11064168475c3ba0e | ORPH
powerpc64le  | pistache-3ec9d7c4f8b828fdd3... | NOK | http://autobuild.buildroot.net/results/07bc9c3a0534925dfdb69eccdc17e3e248d902c8 | ORPH
powerpc64le  | pistache-3ec9d7c4f8b828fdd3... | NOK | http://autobuild.buildroot.net/results/9252c91ba8a6a70aa84b8af5b3297e5a949bbd78 | ORPH
   armeb     |           pv-1.6.20            | NOK | http://autobuild.buildroot.net/results/88a8a4dccafd5423cc8c3240d90f9ae4b412e8f4 | ORPH
    mips     |      python-numpy-1.23.5       | NOK | http://autobuild.buildroot.net/results/bfcf764b4e7a2de3548358acef05f3ca06b426ee |     
   sh4aeb    |      python-numpy-1.23.5       | NOK | http://autobuild.buildroot.net/results/d29b531c6ae27c1fff8199d9cf478d555ffc461d |     
    arm      |      python-numpy-1.23.5       | NOK | http://autobuild.buildroot.net/results/096ce470b745ccebe739d7ddf3374bbf6cc6d432 |     
   armeb     |      python-numpy-1.23.5       | NOK | http://autobuild.buildroot.net/results/80f902b9cf65dd9d99e5db4647d6d0284a990e63 |     
    i686     |      python-numpy-1.23.5       | NOK | http://autobuild.buildroot.net/results/76203c0f16442b0e7174dc29b6bf863eecee10fa |     
 microblaze  |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/4f82a8fc3e2545198594bc8228c95649bb6cf0c6 |     
microblazeel |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/3c1a5695721fa86fccc9444d271d3e04df88c7a7 |     
    sh4      |         ramspeed-2.6.0         | NOK | http://autobuild.buildroot.net/results/63021e4c7a7e6149fdc8d900bce3e1c9f5fec8c7 | ORPH
  riscv32    | rtl8812au-aircrack-ng-e7a4a... | NOK | http://autobuild.buildroot.net/results/c68c83efbec390a2f39b7784e99ae300cf568963 |     
   s390x     | rtl8821cu-86cc5ceb7c28b9b99... | NOK | http://autobuild.buildroot.net/results/9703c3067acc6de5d5c90e26867c61ef31415b1a |     
    sh4      |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/76152e101e5fc47dbce0506dd40cc2d8313f4f82 | ORPH
   sh4eb     |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/201453b922cfe2526ce3d0cdcc81bd6041f7f744 | ORPH
    or1k     |        skalibs-2.12.0.1        | NOK | http://autobuild.buildroot.net/results/3c1cff653bb292c4b21c09d666dc133362f541ef |     
   sparc     |         sudo-1.9.12p2          | NOK | http://autobuild.buildroot.net/results/df6fb63ed00b8ecba58dd87e5c1f3eb6acd1512a | ORPH
   sh4aeb    |         systemd-252.4          | NOK | http://autobuild.buildroot.net/results/2e590d737a6d87af621cb2efbd340a51a084c62a |     
  aarch64    |         systemd-252.4          | NOK | http://autobuild.buildroot.net/results/5aa4e1c4b33c1f7bbc0fc3005a167683ee0b1cf1 |     
  aarch64    |    ti-k3-r5-loader-2022.10     | NOK | http://autobuild.buildroot.net/results/5a6fcf5240a480ae95fcc813cf8bbc86ce971bfc |     
powerpc64le  |       uccp420wlan-6.9.1        | NOK | http://autobuild.buildroot.net/results/4c3c2e73503e9853a0438152eedba8c2b4e1fb03 | ORPH
 aarch64_be  |       uccp420wlan-6.9.1        | NOK | http://autobuild.buildroot.net/results/f5f24537d2eb61c6b6153fb2a7449cc5cc21f397 | ORPH
    mips     | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/50e0a33f098ea65c98166e03ae7a2e54b755bea7 |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/752882340cb98262dcb30fe8de44d75d551ae5ab |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.net/results/9a0a20fb626388cccb0d8d74cc18bb460b020dd6 |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/3358fdbf5a3f085c61a5fac3530a1eb319521617 |     
 microblaze  |            unknown             | NOK | http://autobuild.buildroot.net/results/00064694f299645b93d9cf32d306902a2629f209 |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/da19efbcd7e59fbc2a17fed8eb6844f44f49149d |     
powerpc64le  |            unknown             | NOK | http://autobuild.buildroot.net/results/1e57940eb7befbc3e195331de641d8c97683f8b5 |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/ed28778ccfdddc3024295b556fd61c4b04cc44ac |     
    m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/64756b7c39d58970b92699592d00ed7c715c3db6 |     
   sparc     |            unknown             | NOK | http://autobuild.buildroot.net/results/4e717ecc9cf4ec499a38cae02a70fd83e5439747 |     
  powerpc    |        valgrind-3.19.0         | NOK | http://autobuild.buildroot.net/results/dd12aad7d0fbd1715e99a4947a6ad03943132b1c | ORPH
    mips     |         wolfssl-5.5.3          | NOK | http://autobuild.buildroot.net/results/2726191bf46eabd7d07f166c5cc3b10ba12958c9 |     
    i686     |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/64a1bacec2b269edd7c860bf95ea30ed7a446001 |     
    or1k     |          zabbix-6.2.7          | NOK | http://autobuild.buildroot.net/results/140700d627d2bd2e434043004245417a2a6ff24d |     


Classification of failures by reason for 2022.02.x
--------------------------------------------------

          janus-gateway-0.11.6 | 1 
                  xxhash-0.8.1 | 1 


Detail of failures for 2022.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   s390x     |      janus-gateway-0.11.6      | NOK | http://autobuild.buildroot.net/results/41c09230991e92b72d253fe367a6f3f7dafcc223 |     
   xtensa    |          xxhash-0.8.1          | NOK | http://autobuild.buildroot.net/results/88d82df24df5a97786a1660b17b821d94f7d77d5 | ORPH


Classification of failures by reason for 2022.11.x
--------------------------------------------------

                  zabbix-5.4.9 | 2 
                alsa-lib-1.2.8 | 1 
                  bind-9.16.33 | 1 
                  cmocka-1.1.5 | 1 
                gerbera-1.10.0 | 1 
google-breakpad-c85eb4a59b6... | 1 
           heirloom-mailx-12.5 | 1 
            host-binutils-2.38 | 1 
                host-go-1.19.5 | 1 
              host-pahole-1.24 | 1 
                jailhouse-0.12 | 1 
               libglib2-2.72.3 | 1 
             lirc-tools-0.10.2 | 1 
                    php-8.1.14 | 1 
                 protobuf-21.8 | 1 
                       unknown | 1 
                 wolfssl-5.5.3 | 1 
               xfsprogs-5.14.2 | 1 
                  xxhash-0.8.1 | 1 
                    zeek-4.1.1 | 1 


Detail of failures for 2022.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |         alsa-lib-1.2.8         | NOK | http://autobuild.buildroot.net/results/de5d3c180ab51fb0f19b4551b60c6884baaf9192 |     
    sh4a     |          bind-9.16.33          | NOK | http://autobuild.buildroot.net/results/2be53d1fc13680c7cc31196dbb735034987e8121 | ORPH
powerpc64le  |          cmocka-1.1.5          | NOK | http://autobuild.buildroot.net/results/8326373f22cce83ebcd7aea0a219a45e4645cf7a |     
   s390x     |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/faba16c36c273c11a74560919362e5666787d711 |     
    arm      | google-breakpad-c85eb4a59b6... | NOK | http://autobuild.buildroot.net/results/5e78ef3d8f127caf3fccf39e593dd1e69e893513 |     
   sh4eb     |      heirloom-mailx-12.5       | NOK | http://autobuild.buildroot.net/results/864bdaa0b383f9a08f8ae98a8ffe4bc818332302 |     
   s390x     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/93f87ab4a0fb73fe12a04de2ff929c816c963f93 |     
  aarch64    |         host-go-1.19.5         | NOK | http://autobuild.buildroot.net/results/bb678da4257cc242a11064ab833f70c41e7bc7f4 |     
 aarch64_be  |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/146c0f3b2f77433d9fae537b5a58796b46497d9e |     
   x86_64    |         jailhouse-0.12         | NOK | http://autobuild.buildroot.net/results/d1214a859b16f20245c1a9233789f6e0288f1327 |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/4222a8780f024080418030a42953829feb9f1e7f |     
  mips64el   |       lirc-tools-0.10.2        | NOK | http://autobuild.buildroot.net/results/b1c5adf9f0217e103022b8ffbd7eb17f273e43c3 | ORPH
 microblaze  |           php-8.1.14           | NOK | http://autobuild.buildroot.net/results/4ceb4260eb65dbd93030b660b95610b5176618a5 |     
    m68k     |         protobuf-21.8          | NOK | http://autobuild.buildroot.net/results/79def34b9ab4a8ed31fdeeaa7bec01d2463dbe8c |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/d20ef9c42d0947969ce5a26b31d74254fcc7b584 |     
  riscv32    |         wolfssl-5.5.3          | NOK | http://autobuild.buildroot.net/results/c39291824fd024720742331d215b658b6f85bdd4 |     
   mipsel    |        xfsprogs-5.14.2         | NOK | http://autobuild.buildroot.net/results/9cbcf60f60fe53708dc903f89281a8a510e77ca4 | ORPH
  mips64el   |          xxhash-0.8.1          | NOK | http://autobuild.buildroot.net/results/9270aea763bbddfc85fe9cd9c5e9066ace1ba1ab | ORPH
   nios2     |          zabbix-5.4.9          | NOK | http://autobuild.buildroot.net/results/2168e3a8a87f05b7795622b26ede3bb5200846d7 |     
  mips64el   |          zabbix-5.4.9          | NOK | http://autobuild.buildroot.net/results/1e1aa4d154fb54118a237886a524cb6a5cffa591 |     
   x86_64    |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/adfb64477ed6b5a08341f3bbfcbb9d7c16fcd855 |     


Gitlab CI results for 2023-02-15
================================


-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
