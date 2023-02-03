Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E44CAC636CC
	for <buildroot@archiver.kernel.org>; Fri,  3 Feb 2023 06:46:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 62DBA41D80;
	Fri,  3 Feb 2023 06:46:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 62DBA41D80
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aj8xZXooBV8e; Fri,  3 Feb 2023 06:46:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C005741D7A;
	Fri,  3 Feb 2023 06:46:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C005741D7A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C1E581BF5DB
 for <buildroot@lists.busybox.net>; Fri,  3 Feb 2023 06:46:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 916B6611F1
 for <buildroot@lists.busybox.net>; Fri,  3 Feb 2023 06:46:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 916B6611F1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wwuaj6VwyUBg for <buildroot@lists.busybox.net>;
 Fri,  3 Feb 2023 06:45:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2C6CE611EB
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2C6CE611EB
 for <buildroot@buildroot.org>; Fri,  3 Feb 2023 06:45:56 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 30689E0003
 for <buildroot@buildroot.org>; Fri,  3 Feb 2023 06:45:54 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Fri, 03 Feb 2023 06:45:54 -0000
Message-Id: <20230203064600.916B6611F1@smtp3.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1675406754; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=A/O+KYatsVsujCW/TUTEjflFBSa4AzbKbFmdl8WytFY=;
 b=PqG4hMY7ZdHS3dBCdr2lQ5xcf1PRu/hykb4dqr/WOho1tZZkQjZs08owbUXXP8QCGt4Mc1
 L/DbfV5OguuPltNbmkAlzC/uM1QDsz+Gbfy3YohxSXHzU3cgqfucrmDp/k8gKJzPxN40PC
 95+aSFIHxrkwjzcoZzPfJuGagTPeKTO6h0wkLGeRH9d3yHY7iI6LfwUXF6KjZXqSxUQLgj
 GHCyRTmjGQQS3O3JZzL9XK0I97ctvt0zhI09ijWdlzQKhjHYfunO75SPiGfnXuXg0lepfC
 Ce+Shub5/WmFLXnbPGsxn7EN4xEyTNMxMhX3t82r6CtBbcslEfx8Sc6I3sxN+g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=PqG4hMY7
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-02-02
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

Autobuild statistics for 2023-02-02
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  |  7  |  2  |  0  |  9  |
  2022.11.x  | 13  | 20  |  0  | 33  |
    master   | 177 | 303 |  1  | 481 |

Classification of failures by reason for master
-----------------------------------------------

               host-fwup-1.9.1 | 22
                    fwup-1.9.1 | 20
                   bash-5.2.15 | 17
                host-go-1.19.5 | 15
              host-pahole-1.24 | 9 
            host-binutils-2.38 | 8 
                   linux-6.1.5 | 8 
                    opkg-0.4.5 | 8 
                  jack2-1.9.21 | 7 
               libglib2-2.72.3 | 7 
                     xz-5.2.10 | 7 
             dahdi-linux-3.2.0 | 6 
  gobject-introspection-1.72.0 | 6 
         host-sentry-cli-2.8.0 | 6 
                    pixz-1.0.7 | 6 
glibc-2.36-81-g4f4d7a13edfd... | 5 
             libgpg-error-1.46 | 4 
                    norm-1.5.8 | 4 
                   perl-5.36.0 | 4 
           python-bcrypt-4.0.1 | 4 
           python-numpy-1.23.5 | 4 
                 uclibc-1.0.42 | 4 
                  xxhash-0.8.1 | 4 
                  acpid-2.0.34 | 3 
                     efivar-38 | 3 
              fluent-bit-2.0.8 | 3 
              host-rust-1.66.1 | 3 
                   libnss-3.87 | 3 
        ltp-testsuite-20220930 | 3 
                       unknown | 3 
                    bat-0.19.0 | 2 
                    brltty-6.5 | 2 
                elfutils-0.186 | 2 
             fontconfig-2.13.1 | 2 
fs/ubifs/ubifs.mk:49: /home... | 2 
                gerbera-1.10.0 | 2 
                     gmp-6.2.1 | 2 
                   gvfs-1.48.1 | 2 
            host-binutils-2.37 | 2 
            host-binutils-2.39 | 2 
                   json-c-0.16 | 2 
               libfuse3-3.13.0 | 2 
              libgcrypt-1.10.1 | 2 
                    mpv-0.33.1 | 2 
                    mutt-2.2.9 | 2 
           optee-client-3.19.0 | 2 
    python-cryptography-39.0.0 | 2 
ulog-0389d243352255f6182326... | 2 
                 wolfssl-5.5.3 | 2 
android-tools-4.2.2+git2013... | 1 
                 avro-c-1.11.1 | 1 
                  boost-1.80.0 | 1 
                   bullet-3.21 | 1 
                  cairo-1.16.0 | 1 
             cni-plugins-1.1.1 | 1 
                 dash-0.5.11.5 | 1 
dawgdic-16ac537ba9883ff01b6... | 1 
              dropbear-2022.83 | 1 
              erlang-22.3.4.22 | 1 
                     frr-8.4.2 | 1 
fs/btrfs/btrfs.mk:55: /home... | 1 
fs/cramfs/cramfs.mk:46: /ho... | 1 
fs/cramfs/cramfs.mk:46: /tm... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /tmp/... | 1 
                 glibmm-2.68.2 | 1 
         gobject-introspection | 1 
gummiboot-2bcd919c681c952eb... | 1 
    host-python-maturin-0.14.9 | 1 
imx-alsa-plugins-rel_imx_4.... | 1 
                  kexec-2.0.25 | 1 
kvmtool-f77d646ba01d04be5aa... | 1 
              libblockdev-2.26 | 1 
          libcamera-apps-1.1.0 | 1 
               libcap-ng-0.8.3 | 1 
               libsigrok-0.5.2 | 1 
                libxml2-2.10.3 | 1 
          linux-5.10.145-cip17 | 1 
      linux-5.10.145-cip17-rt7 | 1 
              liquid-dsp-1.4.0 | 1 
             lirc-tools-0.10.2 | 1 
               mariadb-10.3.36 | 1 
                  matio-1.5.23 | 1 
                 mesa3d-22.3.4 | 1 
         mxs-bootlets-10.12.01 | 1 
                    ne10-1.2.1 | 1 
                  netsurf-3.10 | 1 
                  nginx-1.22.1 | 1 
                numactl-2.0.16 | 1 
                     nut-2.8.0 | 1 
                   pcre2-10.42 | 1 
               pcsc-lite-1.9.9 | 1 
            python-bunch-1.0.1 | 1 
            quickjs-2021-03-27 | 1 
                 rtl_433-22.11 | 1 
              skalibs-2.12.0.1 | 1 
            ssdp-responder-1.9 | 1 
              strongswan-5.9.8 | 1 
                tealdeer-1.6.1 | 1 
       ti-k3-r5-loader-2022.10 | 1 
                  tor-0.4.7.13 | 1 
              traceroute-2.1.0 | 1 
             uccp420wlan-6.9.1 | 1 
uqmi-0a19b5b77140465c29e2af... | 1 
               valgrind-3.19.0 | 1 
                xenomai-3.0.10 | 1 
                    zeek-4.1.1 | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |          acpid-2.0.34          | NOK | http://autobuild.buildroot.net/results/53e0b30cadbad90ef8ba61c39b5dd054dadc5a32 | ORPH
   mips64    |          acpid-2.0.34          | NOK | http://autobuild.buildroot.net/results/6af089a8aa7c9282f3642ae92b1b298df4af09c0 | ORPH
   mips64    |          acpid-2.0.34          | NOK | http://autobuild.buildroot.net/results/47b173c02f26e63c14ef1b686c808076cb9466c4 | ORPH
   mips64    | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/281acf637b1b33000b507a773e9dd90f0978d0cf |     
   mips64    |         avro-c-1.11.1          | NOK | http://autobuild.buildroot.net/results/74bd5cecfface38bef3b6a175c978ec20aac68b0 |     
    or1k     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/a293eb0b947f041dd6214f6dda03b53d4b4cb22c | ORPH
 microblaze  |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/87fcd26cd983d4716f8efb6b7b5f53343c57fc17 | ORPH
  mips64el   |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/22575c04d9b1dd81f0fce43775dbe2c9cecb9c53 | ORPH
microblazeel |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/aa1257ee7fe1dd18be8bc10fb9de402ca1cdb911 | ORPH
   armeb     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/a12f274360e466ec3ba1768dc44d02fe8b430466 | ORPH
   armeb     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/e95dceeb340dd928c9dab302a687dda89f8d4af8 | ORPH
   sparc     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/d24d0a4b814d4d18a0e6872cf19d7ed30938fce4 | ORPH
   x86_64    |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/c94e58a995bbc6bf8f8b170b3d19713fa115dc34 | ORPH
   arceb     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/e2d1cdc259214a71ac404f14341997dcaa0ba6e6 | ORPH
   mipsel    |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/8ab3ed1e1269da43f5ea2d0c6fa69890e8027df1 | ORPH
   mipsel    |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/1cce17834935a8230106979b44da1bab21858e21 | ORPH
 microblaze  |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/0adf8ebe5079aed0b1e7d8eaca49e6c910ca7e43 | ORPH
   x86_64    |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/b0e5fcab9eeb799e31bca27fcb7280b728349bc6 | ORPH
   mips64    |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/12e9aa42938e9c881a93bc1c4c9024b8c642df18 | ORPH
   arceb     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/0ff34b89455edba5bdceee1a7cc322c7cfeb59f8 | ORPH
   x86_64    |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/f8cb91f7f9ac6a46bb2ecfc22c1e42cf699f28d3 | ORPH
   sparc     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/f1f806af2f46e97b05f932bc0799c265c5138faf | ORPH
   armeb     |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/a25f60dccfb2ad56114b0f6802e15403e75b229e |     
    arm      |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/9d940b5d5d9488c741c7bee8f426daffbeeea044 |     
    arc      |          boost-1.80.0          | NOK | http://autobuild.buildroot.net/results/64d963395cf0383003e68c3c5f4f4a587f0d6c46 |     
powerpc64le  |           brltty-6.5           | NOK | http://autobuild.buildroot.net/results/1a4d57fa7ecfc1111e2c24742cc346b073fb69d6 |     
microblazeel |           brltty-6.5           | NOK | http://autobuild.buildroot.net/results/837ca4f9ab76b582136cfb517b16924af14a80a3 |     
   nios2     |          bullet-3.21           | NOK | http://autobuild.buildroot.net/results/97b9aad5a2c1cb80d9efb0e5f39d3143a8a61651 |     
   armeb     |          cairo-1.16.0          | NOK | http://autobuild.buildroot.net/results/dfffc0d5d48beaabe2cfa23d23857abb576efb6b |     
    i586     |       cni-plugins-1.1.1        | NOK | http://autobuild.buildroot.net/results/59fe4e0cea93abe0553ac2d717ab6219bb8ed656 |     
    i686     |       dahdi-linux-3.2.0        | NOK | http://autobuild.buildroot.net/results/c0bd0bced08c698d91bf61cef4a99067a278bcc3 |     
   sparc     |       dahdi-linux-3.2.0        | NOK | http://autobuild.buildroot.net/results/90c6a4e6fd1c442e4bb04d3a65217e654397c048 |     
 microblaze  |       dahdi-linux-3.2.0        | NOK | http://autobuild.buildroot.net/results/3eaac933918bf3c2c57e502dc8d75e2f5f117a93 |     
powerpc64le  |       dahdi-linux-3.2.0        | NOK | http://autobuild.buildroot.net/results/9b7ad88e8c8f013d438214838bfb6647266afe5c |     
    mips     |       dahdi-linux-3.2.0        | NOK | http://autobuild.buildroot.net/results/f6d8ebbc5f8294ce16b07fedc05853e97cd931d2 |     
 aarch64_be  |       dahdi-linux-3.2.0        | NOK | http://autobuild.buildroot.net/results/e6b7fd62f4fdec8fcf2c2e0e9990a4ac5c0e2782 |     
   xtensa    |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/5eb61c6b77f5ef71d5c99a353174f4dc133ea0d2 | ORPH
   arceb     | dawgdic-16ac537ba9883ff01b6... | NOK | http://autobuild.buildroot.net/results/2355ab9b9a8594463e195d9657df41f9a3c72c64 |     
  riscv64    |        dropbear-2022.83        | NOK | http://autobuild.buildroot.net/results/edbc6b915292abfba42fc7fcadc2eff1c8dd6e1e |     
  mips64el   |           efivar-38            | NOK | http://autobuild.buildroot.net/results/2270f2ad58838327b823fbbe73a35efe9b00c1b4 |     
    i586     |           efivar-38            | NOK | http://autobuild.buildroot.net/results/06697fd7e5b94c441f3110878899894583886f4e |     
    i586     |           efivar-38            | NOK | http://autobuild.buildroot.net/results/552d66a4eb07e429a53bf934a79ba46671401936 |     
    or1k     |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/6237714cd398b9b02e0dc2d4989fa1570ffe1727 | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/660dceb10059b3acdee0b4ac219fa9574f0cd40c | ORPH
    arm      |        erlang-22.3.4.22        | NOK | http://autobuild.buildroot.net/results/522ea05bbc4fe86d2aba0feeca31092ec3769018 |     
   s390x     |        fluent-bit-2.0.8        | NOK | http://autobuild.buildroot.net/results/11dd5ddf9ab3cfd1464a212f4e3d923832d53462 |     
   s390x     |        fluent-bit-2.0.8        | NOK | http://autobuild.buildroot.net/results/176b6784b0bcdb7601fc4b3cf1f11de6893c7774 |     
   s390x     |        fluent-bit-2.0.8        | NOK | http://autobuild.buildroot.net/results/94d5729c9903f7502f510fd8297a19dfbc69e83d |     
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/f9a5063e4f0ef728b256904187431ef697e04b35 | ORPH
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/3309bce201343d2fcde39ab567300d8c21a7fff9 | ORPH
   xtensa    |           frr-8.4.2            | NOK | http://autobuild.buildroot.net/results/b4aada606d4fa21810edb3f2dc98586c1c26dd44 |     
 aarch64_be  | fs/btrfs/btrfs.mk:55: /home... | NOK | http://autobuild.buildroot.net/results/4c07315debc15b962fbe8e3ff976f4bd910d971b |     
    arc      | fs/cramfs/cramfs.mk:46: /ho... | NOK | http://autobuild.buildroot.net/results/8711babc34893c7b84975af9b744195f49a48c59 |     
  sparc64    | fs/cramfs/cramfs.mk:46: /tm... | NOK | http://autobuild.buildroot.net/results/84f13b28ba1060193b00197523c2bc6d0ef24b84 |     
   s390x     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/843cfe86c2c5410459f4ce7f712966e9cfffc416 |     
   nios2     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/c8138825a83ae817b2dac35666e63dddbfb5c21b |     
powerpc64le  | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/6b96f0042c91e72796217145cf06439bf9e10200 |     
   nios2     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/be0ebf20cdf812a5b8b5f99c1bf6590899395588 |     
    i686     | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/7c48c6105e9027a56733d5e1905596b63429bf66 |     
   x86_64    |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/9af74db4d661817044618cadb621ba0485fd1ecc |     
powerpc64le  |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/62c226fde28e10cc5d6d31aa9493e9d5976d95ad |     
   s390x     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/a4ca1236e5a9821df869e27f0c40b0eced8685d3 |     
   sh4eb     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/b911daee3dea4ac6e995e6e88723358979dea6ae |     
    mips     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/cbd13691742c7e47dc9dcf7949291673c9adf4e7 |     
   x86_64    |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/1f085427d8aae5a27802ca36b0ec2733fbdff825 |     
  powerpc    |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/9a18a4b30a35e266215a7c2cd22f736305ab8378 |     
    mips     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/47e4d8e1adce3d1dee3bcf5aa72584bab4292262 |     
powerpc64le  |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/098b24dbf46ab84f16f4b20e4bedc264da71fb58 |     
   s390x     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/1887f0f1827df1e3f087f3ae7461225f39d7392b |     
    or1k     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/cce845a2cc819146813a2373c3cb00448d23c599 |     
    or1k     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/cee80983cff8ce48494921e8ba2c3805c31714eb |     
    or1k     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/4e777772b0182a7cba18df83d880fa97eb984b40 |     
    i686     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/919dc2b0655b2c2673b8adc3aabb426a195a02f5 |     
  sparc64    |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/01716279ea72338955735f10fd648e4b75f56853 |     
   nios2     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/7802a390003a774fc44c731d11097c241e0dfee8 |     
   mipsel    |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/49a8e09ac94be96f2fce16c8f3304e54a35de9d2 |     
 powerpc64   |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/d4154ff57a7c7a108eabc31211146a36a4f7b4a8 |     
    or1k     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/23ec98ef13be7d1135f4013173677fbd52ad0b95 |     
  powerpc    |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/4388cf0935dd6e7bb65a7c3124a65d5c8f6f8773 |     
    m68k     |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/783fdab1db8cdeef0d14b49a1c720886fd28e661 |     
  riscv32    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/f602dfc777ee5c4bf3f8e026494cb2ccf0a0cdc8 |     
  powerpc    | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/4d35bc19aab3c6f6255fbb2570e17ebcfa104706 |     
  powerpc    | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/4cdcc6e3c184a9237e9b735b80681a0cf79ba82a |     
  powerpc    | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/e0394a4cc156a9c7be939f2668e1efe31d76e3fb |     
  powerpc    | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/bad3ececba126be3d16683502ee56ccea5e0b502 |     
  powerpc    | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/15113526c20d696b5e3f0872f6a36a6052986edc |     
    or1k     |         glibmm-2.68.2          | NOK | http://autobuild.buildroot.net/results/4fc9392d9e0188810fe5171c6860fecd2479d448 |     
  riscv64    |           gmp-6.2.1            | NOK | http://autobuild.buildroot.net/results/ddf47166d8ec2d5631d2dd81f039342d1315279e | ORPH
  riscv64    |           gmp-6.2.1            | NOK | http://autobuild.buildroot.net/results/ab11c696d7dcccbd67166533e25702203f8cb56f | ORPH
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/84b8e3da76df77beb48851f5e9192db121a7e18c |     
   s390x     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/77e040aec694fd84b85411d63dbeacb91dfee583 | ORPH
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/bf6d606fb63cf35e24f3d160a01e37a8eb67e9e5 | ORPH
   mipsel    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/eddf60932c365d4681444ff5e905cec42dc52e72 | ORPH
   mipsel    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/555338315f339a02670efc26b656a79211a62c1f | ORPH
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/d65ba69aa60feb8f06e0b63db327faf6d7295327 | ORPH
microblazeel |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/4e955fc1bf97545d0afb05de1180fd9c778b7546 | ORPH
   x86_64    | gummiboot-2bcd919c681c952eb... | NOK | http://autobuild.buildroot.net/results/08e4d20b0b08a5f18f0c1bd9cb78ee73ba4f4b74 |     
powerpc64le  |          gvfs-1.48.1           | NOK | http://autobuild.buildroot.net/results/4c8a8a94f7b2267668687f8bdbb37d9847ad50ae | ORPH
  sparc64    |          gvfs-1.48.1           | NOK | http://autobuild.buildroot.net/results/b0dd50a74961d05c26666012ebb135ebdade4209 | ORPH
   armeb     |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/a726deb23014b79b15b9ea88c84e042180c9ed79 |     
  sparc64    |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/033e72d9310aadbcc8928b520a986f36f23b48e0 |     
  powerpc    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/4c91c9ee2b55f49512f147701d9fcdbccf34982c |     
   s390x     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/9cb54fe163c1cac8e02be547e38e2095746b96d7 |     
  powerpc    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/08db32f899885389b8616aab603b693f69ed7cfc |     
    mips     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/a015ab14cdf0bda5c42ec08f9d5412f43ee4c24d |     
  mips64el   |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/da406ca810d6f26dfccfe6a75424139891e12cd3 |     
   xtensa    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/7869d45d5feac72bbac6d16c144a8fe1b5439b1a |     
 aarch64_be  |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/e0320dbc6c92e1ff9c9b87b8e6eee7bf4db56436 |     
   x86_64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/8e88624c74be9ad469622db0b70d612c825f32eb |     
    arm      |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/730e7c627342ee124f5b484a65140c2d27f65d00 |     
   sparc     |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/9e3fa76c6ff58f33e4a261321a6ba2b7382c537a |     
   sparc     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/d7b9520a38c7a0fae66f6542c1609200cc68a387 |     
 powerpc64   |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/fdd8db662d71caad02327eefd9639a9a860c149e |     
   s390x     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/06d46aa0eec7e16c2da589e58f1eff259d80d61e |     
 aarch64_be  |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/3b3e5f761353e552f45679fc23b356e9ac2938ba |     
  sparc64    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/ce510c4eb688aa494c0369b2c0b8fd986f8e7c90 |     
   sh4eb     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/c3cdce9556d6634bf8b82e5fcc68b0783ddc8f73 |     
 aarch64_be  |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/9380740a77790050c4e60aae63b8b64fdcda1c8d |     
 powerpc64   |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/d7d29be7fea7b2e8a0c5c0237946c0635100fea9 |     
   armeb     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/48d2b3d9ef0dc3b9c8c3c897c268dc08d2b0be81 |     
   mips64    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/beeb5c43be33b1e422d4b2327a799d52256bbfea |     
   sh4eb     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/ff80790070b92c4f31f9c19ba80a9e7ba0d4a7d1 |     
   s390x     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/a68071c232b02a2d79f2876785ae8880704e5827 |     
   s390x     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/acb1e9001f713774230b5906a0912c7351a850cf |     
 aarch64_be  |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/3620ece383636433c06c58434819a1f83187935e |     
   arceb     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/8426a0579d1ea17ac86785b68686a3cf46323415 |     
    m68k     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/cc91fe25469926b33db0c51dab438df9e545eb64 |     
    arm      |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/8f6a0e1fc284c88e5e2cda1a2f94aa721de359c6 |     
   s390x     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/0dd6abbd3db05ffade67e4191df78278f5f4b0ce |     
  aarch64    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/622ae6f478a1f43353d65ab6b86c6de390d128c4 |     
    arm      |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/da479d92663dfa6bc5857cce37da19f4b44e73b5 |     
powerpc64le  |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/7376c031953911f71cd974ecbc09bb6ee8ed9a90 |     
  mips64el   |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/e130aba82bed51a357cb7cc9ad833c0cc23d91fd |     
  mips64el   |         host-go-1.19.5         | NOK | http://autobuild.buildroot.net/results/95119aecf6ee7220aa2858cfd9d619714cf2bffd |     
powerpc64le  |         host-go-1.19.5         | NOK | http://autobuild.buildroot.net/results/5703061f1b6e722a07555df3d89d65772e820eb4 |     
  mips64el   |         host-go-1.19.5         | NOK | http://autobuild.buildroot.net/results/6ed8ffd00f5711875a5c9c770fa4f3f364a9fe47 |     
   mips64    |         host-go-1.19.5         | NOK | http://autobuild.buildroot.net/results/5a5c52b909cea51e2328548ad7f13f81bcdac589 |     
  mips64el   |         host-go-1.19.5         | NOK | http://autobuild.buildroot.net/results/2c01f058487a149cdab1a71e2fc586dec6a498e5 |     
   mips64    |         host-go-1.19.5         | NOK | http://autobuild.buildroot.net/results/6a4cd44bea1259ad2819d6cb9dc6e1236952da9f |     
   mips64    |         host-go-1.19.5         | NOK | http://autobuild.buildroot.net/results/f9e4fc8522a7719418307f46192147c48cb65eae |     
   mips64    |         host-go-1.19.5         | NOK | http://autobuild.buildroot.net/results/c72a0d61d9aa3f4c85d352173cdc1527ecdb479b |     
    i686     |         host-go-1.19.5         | NOK | http://autobuild.buildroot.net/results/c32c08909766e46ebee7fa13d980540a2ef4c5a0 |     
   mips64    |         host-go-1.19.5         | NOK | http://autobuild.buildroot.net/results/cae9be44b101a5fb6c34bf2d00f155194c7039da |     
  aarch64    |         host-go-1.19.5         | NOK | http://autobuild.buildroot.net/results/46499c8d4e787688cf882262413ff2e69c21998e |     
  mips64el   |         host-go-1.19.5         | NOK | http://autobuild.buildroot.net/results/516ab16d0bb3b81a2ddf1615a01038aca1e98fd1 |     
   mips64    |         host-go-1.19.5         | NOK | http://autobuild.buildroot.net/results/42c784ae9df9d0b3a1680da312a77a8a170df1bc |     
  mips64el   |         host-go-1.19.5         | NOK | http://autobuild.buildroot.net/results/c26e08ce27e87c888d01e3ac7c4d07adce3c97cd |     
    i686     |         host-go-1.19.5         | NOK | http://autobuild.buildroot.net/results/2713fd690a69b7f463fbbbca1f172c60d1e7d78d |     
  riscv32    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/efb274fdfa01509dfb0f26943a3f93053d754dc6 |     
microblazeel |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/b8497ce2b8a871e4ac91b7506908beec3125288e |     
   arceb     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/dc49a91fffbee276c4d2668b4cdb1fae48e670a3 |     
  sparc64    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/ad6f218301a23e9bff85c7fd1d74d3fe8260f892 |     
    sh4a     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/167c14e13ccb13e002efed461d46cf74c7e3ab52 |     
  aarch64    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/bb9ea1ebcb81a0b87215822ec3b9bf704b4ffb8d |     
    arm      |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/b2d06fcd51c7e2a8e7535c1ebf21befd2f923009 |     
   sh4eb     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/3f0d13f5a72d7edbaf9f59e14823276a4c51a937 |     
   s390x     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/9a94a8f5946f0f3b61ca00f07848ec5ba2395983 |     
  sparc64    |   host-python-maturin-0.14.9   | NOK | http://autobuild.buildroot.net/results/03ae6e2c838e149bfee196ee3a734059365f6c2b |     
   x86_64    |        host-rust-1.66.1        | NOK | http://autobuild.buildroot.net/results/01e8c0bd1634d303156f0558eeac0ae98d0022ae |     
   x86_64    |        host-rust-1.66.1        | NOK | http://autobuild.buildroot.net/results/a5a8b9c939aa6b4d247c88744202f13cc47bc8ca |     
   armeb     |        host-rust-1.66.1        | NOK | http://autobuild.buildroot.net/results/fc017d7e3e131b026c0fcf72f7f6d375d6d83d4e |     
    m68k     |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/4bd9603ad1478a41d4f00b5a467daf0321139c6d |     
   nios2     |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/91290f39fb1207879167c698cfa6eb99b502aa30 |     
   mips64    |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/b59963f9706a55a20acbbb89b107622512576958 |     
   arceb     |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/cf9752ce97b850c9f84092849941b330e941400a |     
   x86_64    |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/61ff0273c309fcb2d5535f002161558bdf802ea9 |     
   armeb     |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/efb7bf2bbdee51920effcde954de272db9ed3329 |     
    arm      | imx-alsa-plugins-rel_imx_4.... | NOK | http://autobuild.buildroot.net/results/f2b8b1b180b9dc4447df28903c98dcec77cef2a9 |     
   mipsel    |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/0077dd7f1d873b4f96db74298a76987fae25f159 |     
microblazeel |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/e73d087842ebf01caaf8970892aef915ac1a0749 |     
    arm      |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/6cb8eb1be2ad2f70ac883cc63cd8641229045daf |     
    mips     |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/3cb86b316fe01ad705c4ad8094cd7832b0d311d1 |     
   x86_64    |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/e07f11c3102d3af7c896bab58e5c860a9b09e565 |     
  sparc64    |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/3e26b3dfad9a518614035bcaa162dbda5221d408 |     
    mips     |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/7ec3e206a4d7ce8dbc3839900a2d3d91fab230e0 |     
    or1k     |          json-c-0.16           | NOK | http://autobuild.buildroot.net/results/ba96ba0c08cb4a8fa4fe3580a06b36719a0a9cf5 |     
  riscv64    |          json-c-0.16           | NOK | http://autobuild.buildroot.net/results/3fb052dad3c8a2c934a0c50eb5ed5ef33375d9bd |     
   armeb     |          kexec-2.0.25          | NOK | http://autobuild.buildroot.net/results/7ce4e8dc541ad977e31c357ee8d962ad99feea18 | ORPH
   x86_64    | kvmtool-f77d646ba01d04be5aa... | NOK | http://autobuild.buildroot.net/results/f0dba05a8384fff66838b6f851e7697e48fe5f1f |     
   x86_64    |        libblockdev-2.26        | NOK | http://autobuild.buildroot.net/results/6e1c532935157024f42e1180a25c39938b3998d1 | ORPH
 powerpc64   |      libcamera-apps-1.1.0      | NOK | http://autobuild.buildroot.net/results/519d002311dc345c1c2713302770bb6386e828d0 |     
  riscv64    |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/90744e59992d197dcd9e8d1e3f80ad5cd9e8b7f3 |     
    arm      |        libfuse3-3.13.0         | NOK | http://autobuild.buildroot.net/results/f9ce4e2c73101f1430615e9cad727fe38f70a65a |     
    or1k     |        libfuse3-3.13.0         | NOK | http://autobuild.buildroot.net/results/780c6b01b830d10fce248c5698c8ba60de7748f5 |     
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/767abddd528b0432499161405c6e8335e742d9ab | ORPH
   armeb     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/e23d4c60fb6bbf58f763167541800a8811f82393 | ORPH
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/b072ad3747cfa59c08fe7ee740225caa4744e87f |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/d7b7a78b72f2c374942fc3689c8e1bc5cd3ab171 |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/59b5676ac11b3ac5d21c6ee33f075dbd55fee1f9 |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/b34b0b3979544e2987da3f3f5d36ce54da957c17 |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/5ae8fe64fc331be06c922291b4de7203bb3622b7 |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/6de0507bbd9c1d366eccd6ffa579dcc614294b6c |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/2a83f7dbc8536c4da50fd327538cf0b908ce9ee2 |     
  aarch64    |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/c52052eebdb5a3e70f553dc5670957fade8c52ec | ORPH
  aarch64    |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/64f5ec7a1fefdb84c68d0dc3717e05bc5b96a8da | ORPH
 aarch64_be  |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/be4454bf0de2beb1365fe1019dac5c500b37c9b5 | ORPH
  aarch64    |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/05f6e682437a813db4fe2b4984f73216623f9ec7 | ORPH
    mips     |          libnss-3.87           | NOK | http://autobuild.buildroot.net/results/379d1d09740f713ef0e596046d4457594532b1e0 |     
  mips64el   |          libnss-3.87           | NOK | http://autobuild.buildroot.net/results/6c142e9881c3d4ed3be8437bd1b93f2fd1ad7dd3 |     
    or1k     |          libnss-3.87           | NOK | http://autobuild.buildroot.net/results/7dc4efe8ccc401afccc6489921d54af8836be2cd |     
   arceb     |        libsigrok-0.5.2         | NOK | http://autobuild.buildroot.net/results/1efd80d0c3fb99bbb6babb1936e493ca3ad60ce8 | ORPH
   xtensa    |         libxml2-2.10.3         | NOK | http://autobuild.buildroot.net/results/5d342f639a2b633f32a23e8c41456bdd34536b3c |     
   mips64    |      linux-5.10.145-cip17      | NOK | http://autobuild.buildroot.net/results/e118ec23b32e9ca1f2da2c5c49d276d50c49d31b | ORPH
microblazeel |    linux-5.10.145-cip17-rt7    | NOK | http://autobuild.buildroot.net/results/39acd8bcb5878d51b321c1ff06c592206ac90626 | ORPH
    sh4a     |          linux-6.1.5           | NOK | http://autobuild.buildroot.net/results/32148c0f682c2570d47d94c489f701d588d8ba27 | ORPH
   mips64    |          linux-6.1.5           | NOK | http://autobuild.buildroot.net/results/7966d155b6413412d8da8ef2331a26f597883591 | ORPH
  powerpc    |          linux-6.1.5           | NOK | http://autobuild.buildroot.net/results/750d9cd28e508daf1223f34141c2dc2cb05001b5 | ORPH
  mips64el   |          linux-6.1.5           | NOK | http://autobuild.buildroot.net/results/edb09f032211ca0443884978c7ae775b43d71ee5 | ORPH
    arc      |          linux-6.1.5           | NOK | http://autobuild.buildroot.net/results/17e6c3f5e0ff1b27a3b05636caf85586efa386d2 | ORPH
 aarch64_be  |          linux-6.1.5           | NOK | http://autobuild.buildroot.net/results/dafb02e0057a58dbfe3db83016b6b707026eea03 | ORPH
   sh4aeb    |          linux-6.1.5           | NOK | http://autobuild.buildroot.net/results/4b7e2c0ca0d0ae1fcb5aae7d1ba880282e4b7300 | ORPH
    mips     |          linux-6.1.5           | NOK | http://autobuild.buildroot.net/results/170bed47540bbd662a8c3b533988e8512301f317 | ORPH
    arm      |        liquid-dsp-1.4.0        | NOK | http://autobuild.buildroot.net/results/3e80c7395318b41cf3f9d42bf26d668ce5d6a5ad |     
  aarch64    |       lirc-tools-0.10.2        | NOK | http://autobuild.buildroot.net/results/baf7ab819ed03df4a680755942b6031db89368f0 | ORPH
    sh4a     |     ltp-testsuite-20220930     | NOK | http://autobuild.buildroot.net/results/48dea60ea7f9023e99758f60cd4b19d739906d1d |     
  sparc64    |     ltp-testsuite-20220930     | NOK | http://autobuild.buildroot.net/results/96b2e7790210f3f3423a08efe8fad713f850fcb7 |     
powerpc64le  |     ltp-testsuite-20220930     | NOK | http://autobuild.buildroot.net/results/712d3ca61744a015a24b590b4e1474a31a9998ba |     
   sparc     |        mariadb-10.3.36         | NOK | http://autobuild.buildroot.net/results/f5057a2250b7a1da6f0154e3666dd76fa75fa85b | ORPH
   nios2     |          matio-1.5.23          | NOK | http://autobuild.buildroot.net/results/e54b0ba74300beeb4c77a9a1603704dd30d3e031 |     
    arm      |         mesa3d-22.3.4          | NOK | http://autobuild.buildroot.net/results/346f19c3934f07e1ff7b41ddc6c4f85d75d77f36 |     
 aarch64_be  |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/5323370552b56e13f40e36b5225402b612143c7d |     
powerpc64le  |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/ad04e9a278e61bf09de392e365bee14952fe71e8 |     
 aarch64_be  |           mutt-2.2.9           | NOK | http://autobuild.buildroot.net/results/4d27d19625a36eeaa332cf0441afb693d86b335f |     
    sh4a     |           mutt-2.2.9           | NOK | http://autobuild.buildroot.net/results/0680dbc95601fcd8cdf07b926ea5e9be2079c7bf |     
    arm      |     mxs-bootlets-10.12.01      | NOK | http://autobuild.buildroot.net/results/777416852771e3d7a267cdd82d370f3b55ddf45b | ORPH
  aarch64    |           ne10-1.2.1           | NOK | http://autobuild.buildroot.net/results/086f350ebef0ec3821aa1c1133a867dd4e36526c |     
  powerpc    |          netsurf-3.10          | NOK | http://autobuild.buildroot.net/results/eb72214017fe27757d8bbf4503a5d6a22819a6f5 |     
    arm      |          nginx-1.22.1          | NOK | http://autobuild.buildroot.net/results/f3886cfb12826e97a485853109f0042a232b2982 |     
    arm      |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/68cc8463e86128688b62e5b42fe81e07381acd34 | ORPH
 aarch64_be  |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/103987c98ce190316740dc158992b980036aabac | ORPH
  powerpc    |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/a5c71d8cd429647769b1ed1411442661728270b2 | ORPH
powerpc64le  |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/fed396a3458f8a979ec6131235bb1afc50c22759 | ORPH
    or1k     |         numactl-2.0.16         | NOK | http://autobuild.buildroot.net/results/a9103623601cbb591d4b3fd66e5843a2cd16ad2b |     
  mips64el   |           nut-2.8.0            | NOK | http://autobuild.buildroot.net/results/2bc4bb6a56e5b27228f9a55611ba8c13e29a8b9c |     
powerpc64le  |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/308b275f9fea3f4f97f0f7cf7b390fd9647c3092 | ORPH
 powerpc64   |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/77187cf59f24a52c25883a858958a1973fe918a6 | ORPH
   mipsel    |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/8f0d0e33c495c828f53bc9e32ed3e48ace72824f | ORPH
   mips64    |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/425f9c25e27f46dd181467c888208b810102e862 | ORPH
microblazeel |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/f51c3e84d569ca6dfdfc2cefe5c4de9bdbc4f538 | ORPH
powerpc64le  |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/47a83c43d54b4176fd52a77176aab5d14faefbea | ORPH
    or1k     |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/95843e6b1e277b1917386abb3b0c427c09f93767 | ORPH
   mipsel    |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/b8fb1775d38410d8b4f3843ee3c729f6bfb3a638 | ORPH
  powerpc    |      optee-client-3.19.0       | NOK | http://autobuild.buildroot.net/results/11157897a8d2f8a1a74c55a637d5edac1bfed7a1 |     
    m68k     |      optee-client-3.19.0       | NOK | http://autobuild.buildroot.net/results/e0b710a814f36fcce8da04371dd71787192e1d6a |     
   sparc     |          pcre2-10.42           | NOK | http://autobuild.buildroot.net/results/64227df570d310ac5fbd2c2764ce632528181796 | ORPH
    or1k     |        pcsc-lite-1.9.9         | NOK | http://autobuild.buildroot.net/results/7519c9a90154eae0b4608c7877bb5784daf5ddc1 | ORPH
   arceb     |          perl-5.36.0           | NOK | http://autobuild.buildroot.net/results/be1f4a62ecfc7e65ea7b64e8ef15579d9814d284 |     
    or1k     |          perl-5.36.0           | NOK | http://autobuild.buildroot.net/results/08d87e0d0ef0223b2f8f2a59b13de24c97c42c7d |     
   sparc     |          perl-5.36.0           | NOK | http://autobuild.buildroot.net/results/56ca27b88420e160e5702dbe301dbbcea5370bbc |     
   arceb     |          perl-5.36.0           | NOK | http://autobuild.buildroot.net/results/99f01b4a582b5470a59e9d1bb20133e500d6f771 |     
  aarch64    |           pixz-1.0.7           | NOK | http://autobuild.buildroot.net/results/fa70a585833059e6d229a295226b33784c0f2027 |     
  aarch64    |           pixz-1.0.7           | NOK | http://autobuild.buildroot.net/results/8d54c99573431b43a73364074f33811c6998c89a |     
    i686     |           pixz-1.0.7           | NOK | http://autobuild.buildroot.net/results/7b9892d5a05b58c596ae7d5944ec8cb2388ed103 |     
    arm      |           pixz-1.0.7           | NOK | http://autobuild.buildroot.net/results/5facf207784fa0e4605723093db462a719f1c54b |     
    arm      |           pixz-1.0.7           | NOK | http://autobuild.buildroot.net/results/c53ee5b2e111167061ec299e2aa6f91d7d90e315 |     
    arm      |           pixz-1.0.7           | NOK | http://autobuild.buildroot.net/results/c9db861e206437a533c05ad98cfdda6b3602394d |     
 powerpc64   |      python-bcrypt-4.0.1       | NOK | http://autobuild.buildroot.net/results/c91d21e7bd1221a3bc1804c59200def5d3748e52 |     
    mips     |      python-bcrypt-4.0.1       | NOK | http://autobuild.buildroot.net/results/5835817d60eb9779ba7fb81892426e3e30762827 |     
 powerpc64   |      python-bcrypt-4.0.1       | NOK | http://autobuild.buildroot.net/results/e8ebef4bf8c387b1679f01cea721f5a3dec3ad1b |     
    i686     |      python-bcrypt-4.0.1       | NOK | http://autobuild.buildroot.net/results/5322a673fb003e6ec45cb61310664d7427c885e1 |     
 powerpc64   |       python-bunch-1.0.1       | NOK | http://autobuild.buildroot.net/results/10c2cf51430a4f88ce0b225f8480c591fdcbbb0d |     
    mips     |   python-cryptography-39.0.0   | NOK | http://autobuild.buildroot.net/results/f549699d2fbbbd402e06dd20383981ad33e59dff |     
    mips     |   python-cryptography-39.0.0   | NOK | http://autobuild.buildroot.net/results/0289903ba4cb519df4b0e7469b3a1a30cad6a8e9 |     
  aarch64    |      python-numpy-1.23.5       | NOK | http://autobuild.buildroot.net/results/7dddebdce5e5055601c9f4e807786f1a5e967bd1 |     
   x86_64    |      python-numpy-1.23.5       | NOK | http://autobuild.buildroot.net/results/8ac8803c7427800c7875c82eb62d8e85726612fe |     
    i686     |      python-numpy-1.23.5       | NOK | http://autobuild.buildroot.net/results/0c9aac1f48676256e43d1f3d9b1ccd4748d03b2b |     
   sh4aeb    |      python-numpy-1.23.5       | NOK | http://autobuild.buildroot.net/results/ddc542c393ac8c3ddeb809c62e47202271c4dc68 |     
 microblaze  |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/37ec7133862a1492af93e12661575068acf29c48 |     
 aarch64_be  |         rtl_433-22.11          | NOK | http://autobuild.buildroot.net/results/6bde94a026c1f4e2a147632a1f9939f66da9cafe |     
    or1k     |        skalibs-2.12.0.1        | NOK | http://autobuild.buildroot.net/results/725bce7ef61c02f082be0ae99638b1c29e656de3 |     
   nios2     |       ssdp-responder-1.9       | NOK | http://autobuild.buildroot.net/results/f7f2cf790f51e6224dca258c52bd31d21d621074 |     
  aarch64    |        strongswan-5.9.8        | NOK | http://autobuild.buildroot.net/results/3e7907d9d3863119e73723518caa4f0f46bf67a1 |     
   x86_64    |         tealdeer-1.6.1         | NOK | http://autobuild.buildroot.net/results/8fcbc18e67185e900a1f547e7e4386008d21a90c |     
  aarch64    |    ti-k3-r5-loader-2022.10     | NOK | http://autobuild.buildroot.net/results/855773ae975e8998dae1a693ca096f6fbd35c0dc |     
   xtensa    |          tor-0.4.7.13          | NOK | http://autobuild.buildroot.net/results/6f102f1f5891b10ade216dbf37e17651d2b00fae |     
    or1k     |        traceroute-2.1.0        | NOK | http://autobuild.buildroot.net/results/0c12d537d6ff03171c8deee72f22a4b75183951f |     
   nios2     |       uccp420wlan-6.9.1        | NOK | http://autobuild.buildroot.net/results/3e0717088d08379369acd8a29bfc792c9cf61e70 | ORPH
  powerpc    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/372bd8c54d35dd5239508c71093f1d4643aa7cdc |     
  powerpc    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/89a3b7cbfd68bcb8600da412673838f67f89dd83 |     
  riscv64    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/8731d747a4ad48e3be10358fd31b16bea74fce97 |     
  riscv64    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/d80b2827c1906c6147fd898067fb6202be37605e |     
  sparc64    | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/d9325c522f97fdc74c07f3364394b2c40867cf28 |     
powerpc64le  | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/1733ead45aac547b567e43653ec99e7fb7a2a7c1 |     
  sparc64    |            unknown             | NOK | http://autobuild.buildroot.net/results/11a6de30174bba0b22b43b182b9247154f10f990 |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/df626f4b14e481b5e178af374f613d8fdeb6bca8 |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.net/results/b58130b694382d75d70053537b8db642abb6d015 |     
  sparc64    | uqmi-0a19b5b77140465c29e2af... | NOK | http://autobuild.buildroot.net/results/58faaf660abef33af9fd2913728404323953554b | ORPH
   mips64    |        valgrind-3.19.0         | NOK | http://autobuild.buildroot.net/results/5c333196b795e75c42dc42b749d56c61feca4331 | ORPH
  riscv32    |         wolfssl-5.5.3          | NOK | http://autobuild.buildroot.net/results/0b32b8fc1b0ce5b15b94dc2b79ffc4d90e078676 |     
    arm      |         wolfssl-5.5.3          | NOK | http://autobuild.buildroot.net/results/907a5967439c3157c426023b0be1e613092d7bfe |     
    i686     |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/d63e688833fa523a5dd9265bbf41089188d478c3 |     
microblazeel |          xxhash-0.8.1          | NOK | http://autobuild.buildroot.net/results/72fe77edf6194ca8d7f827310547a9c72da8c7dc | ORPH
    mips     |          xxhash-0.8.1          | NOK | http://autobuild.buildroot.net/results/7ccfb9514a36fc5f2ea3df5f77fb2872faf5cbca | ORPH
    mips     |          xxhash-0.8.1          | NOK | http://autobuild.buildroot.net/results/efa25b6d773fc6ea3c022b5910126896372edd60 | ORPH
   x86_64    |          xxhash-0.8.1          | NOK | http://autobuild.buildroot.net/results/ed0ec16494004d116d80b274203fe17526a2ee03 | ORPH
microblazeel |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/90fbc288564d74eae2adec6796e279a152d80282 | ORPH
microblazeel |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/b7f221f8057edad91bce8f049ecc2771234ce25a | ORPH
 microblaze  |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/7841d9eac4a22b6017eacda8ed7b257581cbb805 | ORPH
 microblaze  |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/a858628274d12478992407fd10a116572588828c | ORPH
microblazeel |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/ea3f545bdd059f98ae077a781fca26d16ae1bdc7 | ORPH
 microblaze  |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/76ecd71355c43b94fe127ae0c09de437fcda6fca | ORPH
 microblaze  |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/fc7cea1b65babdb6c07160d2adf69205dd5f442e | ORPH
    m68k     |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/9120ecc67f77c4316cf57114a2e0c0efc4d07863 |     
  aarch64    |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/33849e7481cb8050c876673e102cc85c09825d5e |     


Classification of failures by reason for 2022.02.x
--------------------------------------------------

              host-delve-1.8.0 | 1 
          janus-gateway-0.11.6 | 1 


Detail of failures for 2022.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |        host-delve-1.8.0        | NOK | http://autobuild.buildroot.net/results/3ea7d6491ed7e7f7f4ff8599ec5dd7130dc6fd60 |     
   sparc     |      janus-gateway-0.11.6      | NOK | http://autobuild.buildroot.net/results/1f49e42cd33a9dc9d75108e3c2c39b6d997f65be |     


Classification of failures by reason for 2022.11.x
--------------------------------------------------

              host-pahole-1.24 | 3 
glibc-2.36-66-ga1dc0be03c9d... | 2 
fs/ubifs/ubifs.mk:49: /home... | 1 
                gerbera-1.10.0 | 1 
            host-binutils-2.38 | 1 
                host-go-1.19.5 | 1 
               libglib2-2.72.3 | 1 
                   libnss-3.84 | 1 
             lirc-tools-0.10.2 | 1 
                    mpv-0.33.1 | 1 
                   perl-5.34.1 | 1 
    python-cryptography-38.0.1 | 1 
                    qemu-7.1.0 | 1 
            quickjs-2021-03-27 | 1 
           uboot-tools-2021.07 | 1 
                       unknown | 1 
                  zabbix-5.4.9 | 1 


Detail of failures for 2022.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   s390x     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/f29599f7ccbe6889b60d250086e1a6b3e6b51945 |     
    i686     |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/61b1856af8c1b6711409639796a123c8d5e910b1 |     
  powerpc    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/4807000643acaeb282277d3a128e32ce6404b853 |     
  powerpc    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/379db648e34b99f05a194f47ba42bf8d52439df8 |     
    i686     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/f5ae3184e376ee858415c479ff0e7b7721294d6e |     
    i686     |         host-go-1.19.5         | NOK | http://autobuild.buildroot.net/results/3717aa01d531610fa09aa6c7a33795dd36031ecc |     
 powerpc64   |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/54c6f8385b0ad0111c00dc693772583c99bac4d2 |     
microblazeel |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/1c7884d635c9a3e39b6c0e2ae4055f16d257548b |     
    arc      |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/caf24a1c7a0284e1533b7d08846cf3c81889f266 |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/19450e40df046eb154a2c6207ddd2d851f474c08 |     
   mipsel    |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/ae4356cfb58ace8a7687ae2d7382a26acfad47c0 |     
   mipsel    |       lirc-tools-0.10.2        | NOK | http://autobuild.buildroot.net/results/9ddffaf1d0bc2a99b255fec853b35294be977521 | ORPH
   x86_64    |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/79970b5e43daf76e63fa5c3ce56a0e78ccc6016f |     
   mips64    |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/56665e5cbfaab9de3dc1d5640a4adf8c3be9e6c7 |     
    mips     |   python-cryptography-38.0.1   | NOK | http://autobuild.buildroot.net/results/2abbb66a923e8a86b9fa01c740d16e7d84d91376 |     
  riscv32    |           qemu-7.1.0           | NOK | http://autobuild.buildroot.net/results/3008696b7272f61040bd0b2812586a2e215151b3 |     
    or1k     |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/1ce0158686a5e60fa5143493b91e771a8b39ebd3 |     
   sparc     |      uboot-tools-2021.07       | NOK | http://autobuild.buildroot.net/results/6fdd9fcd5741ec828a4c57c3292c09e3103f625e |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.net/results/81bafbe77abe2c38cf28f5733981de22472ba84d |     
   s390x     |          zabbix-5.4.9          | NOK | http://autobuild.buildroot.net/results/74b7ac08ecfc18e9ca9b9526a5267d6f32681d09 |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
