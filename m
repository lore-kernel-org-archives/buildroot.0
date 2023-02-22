Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADEC9C64EC4
	for <buildroot@archiver.kernel.org>; Wed, 22 Feb 2023 07:37:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 37B6D60B88;
	Wed, 22 Feb 2023 07:37:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 37B6D60B88
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EUF30r8vtJMJ; Wed, 22 Feb 2023 07:37:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C601360B6E;
	Wed, 22 Feb 2023 07:37:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C601360B6E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 521E01BF33C
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 07:37:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0E33941762
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 07:37:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0E33941762
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HZ_NV1QvNvX8 for <buildroot@lists.busybox.net>;
 Wed, 22 Feb 2023 07:37:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 36CA941763
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 36CA941763
 for <buildroot@buildroot.org>; Wed, 22 Feb 2023 07:37:04 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 257B8E000A
 for <buildroot@buildroot.org>; Wed, 22 Feb 2023 07:37:02 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Wed, 22 Feb 2023 07:37:02 -0000
Message-Id: <20230222073710.0E33941762@smtp4.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1677051422; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=7QGRmel1qpJYHscUyaqzG8RHQhtdvWU/9gicu2MAjrk=;
 b=ZyxAWkQEns8J6LtL6Qk3EEgbY0GhyUoMaMJGDcpfQWRIe8Nc42gOprixeHcVIxifZtk/Gk
 ckoE1LJjOxOu3IVJ69Nybta4iv/CA1Ds71so1ISnWWMe7iFdR1JrkuHuNUXB0NpaXlyCb0
 bzIs4ImcLsoYqZPGBKNpH9jVfjmrjw87t9N4lyOdQsqNKsxY0+sck01rVHXeja6BJtRr4J
 OqrtT323eF6Njae8WOkCZLdWrkXKnQZ6yzt/Yn0WZj/xjgCwfLYjEUDrVD1Fp8sVzEGpxe
 /yTnDFIg/lbK5mUby4M52oIgQBX78wuxY4aWFR9ShwNskBGTNws8ALutLsrwgw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ZyxAWkQE
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-02-21
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

Autobuild statistics for 2023-02-21
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.11.x  | 12  | 15  |  0  | 27  |
    master   | 137 | 152 |  3  | 292 |
     next    | 18  | 23  |  0  | 41  |

Classification of failures by reason for master
-----------------------------------------------

  gobject-introspection-1.72.0 | 8 
glibc-2.36-81-g4f4d7a13edfd... | 7 
            host-binutils-2.38 | 7 
                  linux-6.1.11 | 7 
                elfutils-0.186 | 6 
              fluent-bit-2.0.9 | 4 
                host-go-1.19.6 | 4 
          linux-5.10.162-cip24 | 4 
                   perl-5.36.0 | 4 
                       unknown | 4 
         gobject-introspection | 3 
              host-pahole-1.24 | 3 
               libglib2-2.72.3 | 3 
       network-manager-1.40.10 | 3 
                    olsr-0.9.8 | 3 
                 systemd-252.4 | 3 
uqmi-0a19b5b77140465c29e2af... | 3 
                  check-0.15.2 | 2 
                 coreutils-9.1 | 2 
                 dc3dd-7.2.641 | 2 
host-gdb-arc-2020.09-releas... | 2 
              host-rust-1.67.0 | 2 
              libgcrypt-1.10.1 | 2 
             libgpg-error-1.46 | 2 
     linux-5.10.162-cip24-rt10 | 2 
                    mutt-2.2.9 | 2 
                 sudo-1.9.12p2 | 2 
             uccp420wlan-6.9.1 | 2 
uclibc-ng-test-6790eafe897b... | 2 
ulog-0389d243352255f6182326... | 2 
                     ace-7.0.6 | 1 
              asterisk-16.29.1 | 1 
                    bat-0.19.0 | 1 
               collectd-5.12.0 | 1 
               ding-libs-0.6.2 | 1 
                     efivar-38 | 1 
                  ffmpeg-4.4.3 | 1 
               fftw-quad-3.3.8 | 1 
                     file-5.43 | 1 
                freerdp-2.10.0 | 1 
fs/axfs/axfs.mk:32: /home/t... | 1 
fs/cramfs/cramfs.mk:46: /tm... | 1 
fs/cramfs/cramfs.mk:46: /tm... | 1 
fs/ubi/ubi.mk:51: /home/aut... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /tmp/... | 1 
fs/ubifs/ubifs.mk:49: /tmp/... | 1 
                gerbera-1.10.0 | 1 
glmark2-06e78b67702b5413335... | 1 
             gnuradio-3.10.4.0 | 1 
         host-gcc-final-10.4.0 | 1 
                 host-wine-7.0 | 1 
                  janet-1.26.0 | 1 
                jemalloc-5.3.0 | 1 
      libabseil-cpp-20220623.1 | 1 
                    libev-4.33 | 1 
              libuhttpd-3.14.1 | 1 
               libunwind-1.6.2 | 1 
                libxml2-2.10.3 | 1 
               linux-pam-1.5.2 | 1 
             lirc-tools-0.10.2 | 1 
        ltp-testsuite-20220930 | 1 
                  matio-1.5.23 | 1 
                 mesa3d-22.3.4 | 1 
         mxs-bootlets-10.12.01 | 1 
                  netsurf-3.10 | 1 
               openblas-0.3.21 | 1 
                   pcre2-10.42 | 1 
                     php-8.2.3 | 1 
           proxychains-ng-4.16 | 1 
                     pv-1.6.20 | 1 
           python-numpy-1.23.5 | 1 
                rdma-core-44.0 | 1 
                 rtl_433-22.11 | 1 
              sigrok-cli-0.7.2 | 1 
                speechd-0.11.4 | 1 
toolchain-external-codescap... | 1 
                xenomai-3.0.10 | 1 
               xfsprogs-5.14.2 | 1 
                  xvisor-0.3.1 | 1 
                  zabbix-6.2.7 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    mips     |           ace-7.0.6            | NOK | http://autobuild.buildroot.net/results/7f40d6dde03134238151c248fbbd66e4713546cb | ORPH
powerpc64le  |        asterisk-16.29.1        | NOK | http://autobuild.buildroot.net/results/97c6e74cffc06c0e7ab757d9e9470100edec9198 |     
    mips     |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/7632451fc322cc125e7b873167a5aeab7341ad3f |     
    mips     |          check-0.15.2          | NOK | http://autobuild.buildroot.net/results/97c6e6cdf8346c1b08fb6e4b44cc4fa6a29b6a4d | ORPH
    i686     |          check-0.15.2          | NOK | http://autobuild.buildroot.net/results/a2b265f02cd14a4687312259e0ae0adecd8aa585 | ORPH
   x86_64    |        collectd-5.12.0         | NOK | http://autobuild.buildroot.net/results/91b1886c9dcbeb11f0e52cbdad03ea12a233dca5 |     
    sh4a     |         coreutils-9.1          | NOK | http://autobuild.buildroot.net/results/95379249acac7d328f215c48700b9d6557bc2521 | ORPH
    sh4a     |         coreutils-9.1          | NOK | http://autobuild.buildroot.net/results/1df8a8d804b358c4ffcaba8581a20ee1404a4d3b | ORPH
    or1k     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/509103bddf96936928a7f1332e041bc2b95e8cae | ORPH
    or1k     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/ae64181ae51dafeb22be30ab98ded83a190c82da | ORPH
    arc      |        ding-libs-0.6.2         | NOK | http://autobuild.buildroot.net/results/7d38d90b72f3a4b8cffcba3c65e301b9ac462119 |     
  mips64el   |           efivar-38            | NOK | http://autobuild.buildroot.net/results/f2da14f91dc602a32dd5b2b7bdf3d3aa43afa7f4 |     
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/5aa9f0f466d09fbff69085059c66dae32aff515c | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/0b612c682c605db5bd3e8b2cb0ca0b2b7dc1f651 | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/84873ce870309ea33962c4fa4ca666040323e208 | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/60f8f264c9e27e3c7a792df74cbd208281321a62 | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/51e78ed823820f4e3a4032f86f6d6725dfba0667 | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/ceef84f4d86e7ac2d62c7cdc98a90a9b920d6216 | ORPH
    arm      |          ffmpeg-4.4.3          | NOK | http://autobuild.buildroot.net/results/4abfe6b56d94f79c8cfb56f9accf7121245080c9 |     
powerpc64le  |        fftw-quad-3.3.8         | NOK | http://autobuild.buildroot.net/results/aab750c13efd25ec414885d72cedc41b141c0ead | ORPH
   armeb     |           file-5.43            | NOK | http://autobuild.buildroot.net/results/1dff61124fadb65f96816d8521f69ca0ea3ec0b8 | ORPH
   x86_64    |        fluent-bit-2.0.9        | NOK | http://autobuild.buildroot.net/results/894cd923baa25643d9aea21678c4bca105e86b45 |     
   s390x     |        fluent-bit-2.0.9        | NOK | http://autobuild.buildroot.net/results/170afd36536aef86755b48b5f274bad35f9aef48 |     
 powerpc64   |        fluent-bit-2.0.9        | NOK | http://autobuild.buildroot.net/results/3d47f9ea8dd9ce7fe8413f06ff67ef9bc28cbfb7 |     
 microblaze  |        fluent-bit-2.0.9        | NOK | http://autobuild.buildroot.net/results/b1b0d02876d9760a193e3b0f60a3ea5ffab14830 |     
   mips64    |         freerdp-2.10.0         | NOK | http://autobuild.buildroot.net/results/e96848576ac292799636abe7485c37aa54196a2c |     
    i686     | fs/axfs/axfs.mk:32: /home/t... | NOK | http://autobuild.buildroot.net/results/e9b489fa8d6c2e4075a3e30c23e22f6f133c51a0 |     
   sh4aeb    | fs/cramfs/cramfs.mk:46: /tm... | NOK | http://autobuild.buildroot.net/results/bd5c4da18f4191c7d4c98ef0a5f3a68e47aa0f6d |     
   x86_64    | fs/cramfs/cramfs.mk:46: /tm... | NOK | http://autobuild.buildroot.net/results/bafc2c9127673569d67bfb74c70302283428da7b |     
  mips64el   | fs/ubi/ubi.mk:51: /home/aut... | NOK | http://autobuild.buildroot.net/results/bb78e1253bdfb6d24ab0611b25e98eb411dc6346 |     
    mips     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/8205140af8e774c6a9eaddf4c7091194ac05082b |     
   arceb     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/da346a8bbb94dd1698126d6b9942691315063920 |     
 microblaze  | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/bb2cd65d22ee996c994ca17a2e4510bb8e93b0cc |     
   mips64    | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/3a41e94e88cf5dc7ff2886b4907ebfda7b5b06cb |     
 aarch64_be  | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/fee875dfc8965d2b7b915a5e4697d9a74f2bd6d0 |     
powerpc64le  |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/d2a1088939052a538a14eccfab2c2a33c03da1d3 |     
  powerpc    | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/b97fabce6ffe19854837649ea37763475d4b8290 |     
  powerpc    | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/8bf7b39d5632305ac0277480e03fa6e50943ba3f |     
  powerpc    | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/ab09697b65bdd6d04f2089f9f48403ab9e52ef39 |     
  powerpc    | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/a07d4a8d11357a29e081e3e41da0d13161137a29 |     
  powerpc    | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/83d9608457a9858fbcf5ec08ba754959bda13238 |     
  powerpc    | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/62e13d92d28bc966e7a9cfe4118d3f6c4741d01a |     
  powerpc    | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/b807fa9bff3e32de6053c3c79501e5d85103b20c |     
  aarch64    | glmark2-06e78b67702b5413335... | NOK | http://autobuild.buildroot.net/results/b3245c4ee8e0b3592b09e0bc57bc0928018936c2 |     
    i686     |       gnuradio-3.10.4.0        | NOK | http://autobuild.buildroot.net/results/047866cdd799090db4e93620ed58638d52a96f65 |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/fd6b9990f359f12fa9a283752a3f02c087b8e793 |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/4db435e44a620396e32ae1dccf8ff0c4a34f62d5 |     
   armeb     |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/297da024b72322a1321ba18bec050b0e51bddb90 |     
powerpc64le  |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/0cc5693888bda210cc0a603a24d0ef7236601042 | ORPH
    or1k     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/96ff10b0d3f3e5b95a20c9c532494d6b7f6a33d3 | ORPH
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/7894e8d382774ff354ac6b1b1dfd4e4c1eafa7f5 | ORPH
    or1k     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/c82a01af19a244215ab7f46a1ea5c03e7b37928c | ORPH
 microblaze  |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/b3341b28d21885078368e829773e9dd4ca9e8769 | ORPH
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/ca19947023641b027f057b5c06eb5e6cb84f57ff | ORPH
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/3269e501df5c3d2b04b05f7f48d5271666253238 | ORPH
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/52169862bb9ae73edf6ee1d9605552770aa1de4e | ORPH
   xtensa    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/5c01104910fe7eb1b592efc054cfdc988bb1b461 |     
 microblaze  |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/77c677e86e4b671bb38314523f0e54ff174e1dd9 |     
  sparc64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/1b0333984b1c90a219b9801b6f2690f938194f61 |     
   nios2     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/2f6544193846822416e0d126e2e273f72d5afab4 |     
microblazeel |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/ff4a2fa691da6f4b87e68d6fe0b62c1051103e15 |     
  sparc64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/6f3a5b3e42d1ee0bf494fd6d862aa744d61bd006 |     
    or1k     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/e5fd96ff62e529bdcc1b92c52c0b09f4d4ccef44 |     
microblazeel |     host-gcc-final-10.4.0      | NOK | http://autobuild.buildroot.net/results/7249ccf43f466f346e6a0355081a7b2304bb1cc0 |     
   arceb     | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/ced6dec91623b0b572a02dd662ee02b2059c07a3 | ORPH
    arc      | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/0070763ac9d3f54e108bf8366073e4bb520f8e8e | ORPH
   mips64    |         host-go-1.19.6         | NOK | http://autobuild.buildroot.net/results/ed91bdabe4f1904ba1d94682a10a2d67685e7950 |     
  mips64el   |         host-go-1.19.6         | NOK | http://autobuild.buildroot.net/results/e86d106113f7072e765a6af633cc16009e8f02da |     
   mips64    |         host-go-1.19.6         | NOK | http://autobuild.buildroot.net/results/537626cd91f349974d119025492f236878d49305 |     
    i686     |         host-go-1.19.6         | NOK | http://autobuild.buildroot.net/results/bfbd0c6c80a0c2799ff6ed5485cf7e233664d07c |     
 microblaze  |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/ee95db1c3b740f0d0b4e1e25d7c7c2299a30093a |     
   sparc     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/dc026c4b0f6311b5516d1572f6634a59e60af352 |     
    mips     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/127ae88888cf9d3457c7daf5b4f98f6984ed2485 |     
   x86_64    |        host-rust-1.67.0        | NOK | http://autobuild.buildroot.net/results/46f734aece37922ad25cecfdf99df94aa09eec9a |     
   x86_64    |        host-rust-1.67.0        | NOK | http://autobuild.buildroot.net/results/8a5b6d8cd40d25f8e6279df9949a2480347f33ea |     
    i686     |         host-wine-7.0          | NOK | http://autobuild.buildroot.net/results/62228252348e33d7b0501596c329bd8eb4828d99 |     
  riscv64    |          janet-1.26.0          | NOK | http://autobuild.buildroot.net/results/20108e76990d8af7f47d474eadbbea8562ef6728 |     
    sh4a     |         jemalloc-5.3.0         | NOK | http://autobuild.buildroot.net/results/3de02468e8822d875670f03c5d30322df50fc225 |     
  mips64el   |    libabseil-cpp-20220623.1    | NOK | http://autobuild.buildroot.net/results/7d8ddb2726483fc5711cbed1a51a3dc7d726614e |     
    arm      |           libev-4.33           | NOK | http://autobuild.buildroot.net/results/1c597c9da724d6cac06b09b1ecd456a28440a3a3 | ORPH
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/2e63572493cbc7c676085dd4c08cb1b19b390282 | ORPH
   armeb     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/4b96f4e41724e5c9c806a6c7df397a58d1ae1b1e | ORPH
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/f2ec691eed8220620fc16bbf9a7832d1c06fad62 |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/403457e4dfe0c39112b6b9f900ce9a8718b1d4cf |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/bdfc093d0a8ed7c6084f414f59ace240d5619fd2 |     
 aarch64_be  |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/84bcb4726bafe55ee8587bf0b38121153d625811 | ORPH
  aarch64    |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/99abe06cfea2d143a722b4a515f9c5a13faf3674 | ORPH
   mips64    |        libuhttpd-3.14.1        | NOK | http://autobuild.buildroot.net/results/aaf9b7a3ddf2eb8ab322b167f09f184f0dfb75b3 |     
    arm      |        libunwind-1.6.2         | NOK | http://autobuild.buildroot.net/results/1175e15122506113ac85051c4ec435a69415f6ef | ORPH
   armeb     |         libxml2-2.10.3         | NOK | http://autobuild.buildroot.net/results/9cf1fa9e27b9a79a36c9732deaac5e3a2f19f499 |     
   mips64    |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/8ae153d06313c2bb9033ff06018549ffa9707c02 | ORPH
  mips64el   |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/e493ba5c49858f5cecdb164a95f55a380d6c19aa | ORPH
   mips64    |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/8d9eeaa33f8a82cac1acd324c2fab03180fe0f1d | ORPH
   arceb     |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/a57e329a9882a39209439b7061843ecb4fbafafd | ORPH
    m68k     |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/12f3281312eb920a27c5c668c40354b2d3b37d79 | ORPH
   mips64    |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/8f345b8e489af415059f71d5a591db74d4c9eee9 | ORPH
   sparc     |          linux-6.1.11          | NOK | http://autobuild.buildroot.net/results/ecbd8057145cf3f4ae49619883854b5885d25280 | ORPH
    mips     |          linux-6.1.11          | NOK | http://autobuild.buildroot.net/results/08ed0f5a51752c3e4bb98f4da01f2ce863bb0831 | ORPH
    or1k     |          linux-6.1.11          | NOK | http://autobuild.buildroot.net/results/4d1411950519ede2336637c43c468db2ca3ad90a | ORPH
   mips64    |          linux-6.1.11          | NOK | http://autobuild.buildroot.net/results/69d963ee153f5af43aac221dc98dc26956d99d94 | ORPH
   mipsel    |          linux-6.1.11          | NOK | http://autobuild.buildroot.net/results/a47b8ff3183489b9c5e3daf544281178d61bad2d | ORPH
 powerpc64   |          linux-6.1.11          | NOK | http://autobuild.buildroot.net/results/4370b26c25e4f4a938ab4b0aa63038b16e4961f5 | ORPH
   arceb     |          linux-6.1.11          | NOK | http://autobuild.buildroot.net/results/3cfe26ea27ebc447409fd9d0ee4db5bec97ab1e4 | ORPH
   xtensa    |        linux-pam-1.5.2         | NOK | http://autobuild.buildroot.net/results/011bf863339450d8b2b6665d42c2cd56bf147c93 | ORPH
 microblaze  |       lirc-tools-0.10.2        | NOK | http://autobuild.buildroot.net/results/df75af1cd7cc351332b32ec3d75c48718b6db8c8 | ORPH
   x86_64    |     ltp-testsuite-20220930     | NOK | http://autobuild.buildroot.net/results/5a2afd7b4c7eb9025f50df6b75aa9963335f7527 |     
   nios2     |          matio-1.5.23          | NOK | http://autobuild.buildroot.net/results/65e3fe45e1b049e53f31db884627982045a3f4ae |     
  powerpc    |         mesa3d-22.3.4          | NOK | http://autobuild.buildroot.net/results/8077f4b8c2dd6f3824d7aa498843c3afabdf3673 |     
  sparc64    |           mutt-2.2.9           | NOK | http://autobuild.buildroot.net/results/f0724f3a8fcf79620d7af9d756af37d762608712 |     
    i686     |           mutt-2.2.9           | NOK | http://autobuild.buildroot.net/results/98010be4ef70e58819ea2d17315bdac66a619b23 |     
    arm      |     mxs-bootlets-10.12.01      | NOK | http://autobuild.buildroot.net/results/d3a6a492638b4305cac33273fd8de2e74351d9e3 | ORPH
 powerpc64   |          netsurf-3.10          | NOK | http://autobuild.buildroot.net/results/19942f35c9a6cdb72c9a386711f18bcb43bd7ba1 |     
    or1k     |    network-manager-1.40.10     | NOK | http://autobuild.buildroot.net/results/9eef5574efbbb6d651e04079467724bc643c497a | ORPH
powerpc64le  |    network-manager-1.40.10     | NOK | http://autobuild.buildroot.net/results/896879c8e8ce022556ee834216ced2f962ff279c | ORPH
 microblaze  |    network-manager-1.40.10     | NOK | http://autobuild.buildroot.net/results/cf61c42d5be29c132ae8e963151d7d30e0037a32 | ORPH
    m68k     |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/6f4744d1e49cd0a59f039ee22d2085dd28925343 | ORPH
   s390x     |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/53dd28d062f630b30aa122c1ce1203aba9ef9211 | ORPH
    sh4a     |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/a33b79e1fce7c7dafef55bb8e6794c488721544b | ORPH
    i686     |        openblas-0.3.21         | NOK | http://autobuild.buildroot.net/results/6c8b926e497af3c4a6b9bd965c71b8323913ae0c | ORPH
   sparc     |          pcre2-10.42           | NOK | http://autobuild.buildroot.net/results/00d3d815b00778d7c67d76461688e77689327949 | ORPH
  aarch64    |          perl-5.36.0           | NOK | http://autobuild.buildroot.net/results/de41975fa2590e13a558642dc67cd80c9d512c9c |     
  mips64el   |          perl-5.36.0           | NOK | http://autobuild.buildroot.net/results/157a4dda7ffe397f72f3dbb18fb34b480d482862 |     
    arc      |          perl-5.36.0           | NOK | http://autobuild.buildroot.net/results/a994142c97e5de0ba00275f135ef1f00e9a7e758 |     
powerpc64le  |          perl-5.36.0           | NOK | http://autobuild.buildroot.net/results/98de64b42e5b838a130d365e369c13007235117c |     
microblazeel |           php-8.2.3            | NOK | http://autobuild.buildroot.net/results/faa23037cd14cd5c9af9034a7300ad073bb7ee43 |     
    mips     |      proxychains-ng-4.16       | NOK | http://autobuild.buildroot.net/results/2ffb857cdc3cc1b3ad6a5a68806789d3e7ce2555 | ORPH
   armeb     |           pv-1.6.20            | NOK | http://autobuild.buildroot.net/results/14f9571dcd65696b1cac5d11bfd148b50a94374c | ORPH
   x86_64    |      python-numpy-1.23.5       | NOK | http://autobuild.buildroot.net/results/6ea08926398c3d534787b0b85076a5a4e137f462 |     
    sh4      |         rdma-core-44.0         | NOK | http://autobuild.buildroot.net/results/a943e03b79c4cc328b7712046ecff09706045f81 |     
   xtensa    |         rtl_433-22.11          | NOK | http://autobuild.buildroot.net/results/81e9bc4b0882a4d9bbbccd0d7e766de112d3d41a |     
powerpc64le  |        sigrok-cli-0.7.2        | NOK | http://autobuild.buildroot.net/results/8a4b0432870ae6753ffee01d998ae53648295a92 | ORPH
  powerpc    |         speechd-0.11.4         | NOK | http://autobuild.buildroot.net/results/502f1fa93757f96f6f60fe371a0824cc694fccff |     
   sparc     |         sudo-1.9.12p2          | NOK | http://autobuild.buildroot.net/results/f24a8c19c86a19303bf9158d2602a527ad05915c | ORPH
    arc      |         sudo-1.9.12p2          | NOK | http://autobuild.buildroot.net/results/d45a1184d0ef8c89b371c777510d239025b0e065 | ORPH
   mips64    |         systemd-252.4          | NOK | http://autobuild.buildroot.net/results/7840662fb987efd3a3be5073b5182439430a8664 |     
   armeb     |         systemd-252.4          | NOK | http://autobuild.buildroot.net/results/8f41c4984b645851724e554c3162b83bc312bee7 |     
    mips     |         systemd-252.4          | NOK | http://autobuild.buildroot.net/results/7d44204580448d09d31ca6e0752aca166daa87bf |     
  mips64el   | toolchain-external-codescap... | NOK | http://autobuild.buildroot.net/results/1c708d8399e9b5652a3f21d0b7d4074f67b059ee | ORPH
 powerpc64   |       uccp420wlan-6.9.1        | NOK | http://autobuild.buildroot.net/results/da20d07682760b1c840f60dab8b5fd22f384e992 | ORPH
    or1k     |       uccp420wlan-6.9.1        | NOK | http://autobuild.buildroot.net/results/6870303c9e2c4abba0f3b3d33730b63f5307609a | ORPH
   mips64    | uclibc-ng-test-6790eafe897b... | NOK | http://autobuild.buildroot.net/results/3adf5988f17a964cba9ee833fd0831e318fafa5f |     
    mips     | uclibc-ng-test-6790eafe897b... | NOK | http://autobuild.buildroot.net/results/fc9854089a9c6036f026420253dc5f4e0ac63549 |     
 aarch64_be  | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/7ab27d8aab13abebc3fb6a4a14499b67654d687a |     
    sh4      | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/46617161034c4fcdba5eb4102e4e1756c1030bc7 |     
   mips64    |            unknown             | NOK | http://autobuild.buildroot.net/results/9a909474a8d31ad4cd4bc274f4537a89679879ab |     
 powerpc64   |            unknown             | NOK | http://autobuild.buildroot.net/results/5e76dbabbfc8c3912421a133f68f07c28a38b8c3 |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/dd1109a71f926db810832fb378805a27be238d5c |     
 aarch64_be  |            unknown             | NOK | http://autobuild.buildroot.net/results/ae75f5cdd4a1fe97359b99b2bcade258097c86dd |     
  powerpc    | uqmi-0a19b5b77140465c29e2af... | NOK | http://autobuild.buildroot.net/results/3f31292046bdca618c1c7c901acc236cfe47fb1c | ORPH
   x86_64    | uqmi-0a19b5b77140465c29e2af... | NOK | http://autobuild.buildroot.net/results/7b7d7ae9b457fb6af8b9ff2131eace37ffb2cd39 | ORPH
    or1k     | uqmi-0a19b5b77140465c29e2af... | NOK | http://autobuild.buildroot.net/results/037650f61f4da50b273d7f8cda4ae62507d764dc | ORPH
   x86_64    |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/cd10c1890995256c7bbfe0116f7fa554b3e0e1c0 |     
   mipsel    |        xfsprogs-5.14.2         | NOK | http://autobuild.buildroot.net/results/73e586930253e843036f5c5f15687240d7cd345a | ORPH
   x86_64    |          xvisor-0.3.1          | NOK | http://autobuild.buildroot.net/results/a7e5183785c6da4c9ee96985ffeb950d81a30657 |     
 powerpc64   |          zabbix-6.2.7          | NOK | http://autobuild.buildroot.net/results/cfb046b80fa140e28aa14d969804edcf000ee64c |     


Classification of failures by reason for next
---------------------------------------------

                    brltty-6.5 | 2 
            host-binutils-2.38 | 2 
           python-numpy-1.23.5 | 2 
              fluent-bit-2.0.9 | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
                gerbera-1.10.0 | 1 
                gnu-efi-3.0.15 | 1 
  gobject-introspection-1.72.0 | 1 
            host-binutils-2.37 | 1 
                host-go-1.19.6 | 1 
                jailhouse-0.12 | 1 
               libdeflate-1.15 | 1 
              libgcrypt-1.10.1 | 1 
                   pcre2-10.42 | 1 
           python-pyicu-2.10.2 | 1 
                 sudo-1.9.12p2 | 1 
                 systemd-252.4 | 1 
                       unknown | 1 
               xfsprogs-5.14.2 | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mipsel    |           brltty-6.5           | NOK | http://autobuild.buildroot.net/results/434c780a0758ecf0de3a42b15988035846913b60 |     
    mips     |           brltty-6.5           | NOK | http://autobuild.buildroot.net/results/84e5c6adb430f4d0a909492286ad589af4cb20f8 |     
    i686     |        fluent-bit-2.0.9        | NOK | http://autobuild.buildroot.net/results/9555fea983902219eaf7471758c1d40dbdb5991d |     
   nios2     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/1a4b73695077a6eb9c13e9210074e1586868ed85 |     
   s390x     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/8f9365dc3d2f797d580ac4e63d5532a982ebbf5d |     
    arc      |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/50b4ef0f9f8dd77c1bcbd01ffc8b395adb96f47a |     
  mips64el   |         gnu-efi-3.0.15         | NOK | http://autobuild.buildroot.net/results/bc2d56fa2d634c7bc9275216e2c2d7d592e23e9e |     
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/affbf93571e54dc15cace555e3aaa6a775b96adc | ORPH
    arm      |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/942f515190fb6a9779781c1ed806768d1b240cdf |     
  riscv32    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/a29b5bd2fc0feb81d9a547bd19492e0c7f5ffedc |     
   x86_64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/5d81ec35c7617aa7a262024ea2f869db561b49da |     
   mips64    |         host-go-1.19.6         | NOK | http://autobuild.buildroot.net/results/2d9b9d122ea66997282503d61b41a8ec92ab8813 |     
  aarch64    |         jailhouse-0.12         | NOK | http://autobuild.buildroot.net/results/8fb6f6382843e5e64810bb36af95e8049862f736 |     
   armeb     |        libdeflate-1.15         | NOK | http://autobuild.buildroot.net/results/9b2c347ad4390fc536a17e4b642dfaca5c0e6b0c |     
    i586     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/745e45e5aac54cfa0f7eb50f81826c1d6df0585b | ORPH
   sparc     |          pcre2-10.42           | NOK | http://autobuild.buildroot.net/results/93a0c7fbbe0847fab03e5e9351fbc76480b1fe92 | ORPH
   mipsel    |      python-numpy-1.23.5       | NOK | http://autobuild.buildroot.net/results/a3831200316ea0909ffabb655f66cd044be5ed49 |     
    arm      |      python-numpy-1.23.5       | NOK | http://autobuild.buildroot.net/results/fa2137348eedd72a63ab900665221fe74b2493e6 |     
    sh4      |      python-pyicu-2.10.2       | NOK | http://autobuild.buildroot.net/results/10f78bdd9d9665178469447bb3b2894d739df8be |     
   sparc     |         sudo-1.9.12p2          | NOK | http://autobuild.buildroot.net/results/8be59dd94e4916f9457cb435104e36e62a28373b | ORPH
   s390x     |         systemd-252.4          | NOK | http://autobuild.buildroot.net/results/1f3a18843ea07fc54ab1d59b624a26a7ae03ea50 |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/a1798321cdc624cdaa2e516f8f5b4de3a7fcc7b7 |     
    mips     |        xfsprogs-5.14.2         | NOK | http://autobuild.buildroot.net/results/2c9fef8fa21a775371c746511c65394a9bdfbb8f | ORPH


Classification of failures by reason for 2022.11.x
--------------------------------------------------

android-tools-4.2.2+git2013... | 1 
fs/ubi/ubi.mk:51: /home/bui... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
glibc-2.36-66-ga1dc0be03c9d... | 1 
  gobject-introspection-1.72.0 | 1 
                host-go-1.19.5 | 1 
                jemalloc-5.3.0 | 1 
              libgcrypt-1.10.1 | 1 
libuci-4b3db1179747b6a67790... | 1 
                libxml2-2.10.3 | 1 
      linux-5.10.145-cip17-rt7 | 1 
                    mutt-2.2.9 | 1 
           python-numpy-1.23.4 | 1 
                       unknown | 1 
                      xz-5.2.7 | 1 


Detail of failures for 2022.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 powerpc64   | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/f30b9b32d7ece8a6b97093379341a552ea4a6d3d |     
   xtensa    | fs/ubi/ubi.mk:51: /home/bui... | NOK | http://autobuild.buildroot.net/results/f678c17cc4df06fb2737467e769cd8f72a3ea420 |     
microblazeel | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/ce4399484dfc37497db75fd8e8190b353594743a |     
  powerpc    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/d1491bf8dd8c063cdf203ab935a96a0123b95d86 |     
   mipsel    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/0cb1f51e93b9503ceaf0ba56b92791c374bb9adf | ORPH
powerpc64le  |         host-go-1.19.5         | NOK | http://autobuild.buildroot.net/results/28f87e8ee0a22a82cbe3915bcc215a4513ec133d |     
    sh4      |         jemalloc-5.3.0         | NOK | http://autobuild.buildroot.net/results/ac1cecabf95bab9924d20cadce88f51dbe1b25f9 |     
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/3cb24dbed26c8ccbd3ef5b9b91d7813c54dba1dd | ORPH
   mips64    | libuci-4b3db1179747b6a67790... | NOK | http://autobuild.buildroot.net/results/e1240855ef29037a52dfca0851625fa7497f415f |     
  mips64el   |         libxml2-2.10.3         | NOK | http://autobuild.buildroot.net/results/1a72ff1cf82ef9c5cd331c35e74beab3f811196e |     
   sh4aeb    |    linux-5.10.145-cip17-rt7    | NOK | http://autobuild.buildroot.net/results/f0c97e48fc03379dc89594864803eab3d52c108d | ORPH
   sparc     |           mutt-2.2.9           | NOK | http://autobuild.buildroot.net/results/dfd674161046447a2ffb45ce6912277325d1daed |     
   mipsel    |      python-numpy-1.23.4       | NOK | http://autobuild.buildroot.net/results/2f3e4b083cb70dc2c02890388fc2163e61a2034d |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/55b7d50b7f9d6c9c61869c4f0bfa974c455d9fe7 |     
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/4e10965f7aa890d6d1c66689e9d32e5769d5cba1 | ORPH


Gitlab CI results for 2023-02-21
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
 TestAarch64Pages64kGlibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454778  | ORPH 
  TestAarch64Pages64kMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454782  | ORPH 
TestAarch64Pages64kuClibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454784  | ORPH 
         TestCheckPackage | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798455189  |      
      TestClangCompilerRT | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454401  | ORPH 
...ioDracutGlibcMergedUsr | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454282  | ORPH 
           TestCrudiniPy3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454404  | ORPH 
        TestDockerCompose | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454410  | ORPH 
...rch64GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454804  | ORPH 
...tlinAarch64GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454805  | ORPH 
...arch64MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454806  | ORPH 
...otlinAarch64MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454807  | ORPH 
...ch64UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454808  | ORPH 
...linAarch64UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454810  | ORPH 
...h64beGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454812  | ORPH 
...inAarch64beGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454813  | ORPH 
...64beUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454815  | ORPH 
...nAarch64beUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454817  | ORPH 
...750dUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454819  | ORPH 
...nArcle750dUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454821  | ORPH 
...ehs38GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454822  | ORPH 
...inArclehs38GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454826  | ORPH 
...hs38UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454827  | ORPH 
...nArclehs38UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454829  | ORPH 
...abihfGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454830  | ORPH 
...mebv7eabihfGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454832  | ORPH 
...eabihfMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454833  | ORPH 
...rmebv7eabihfMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454835  | ORPH 
...bihfUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454836  | ORPH 
...ebv7eabihfUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454839  | ORPH 
...5eabiGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454841  | ORPH 
...inArmv5eabiGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454842  | ORPH 
...v5eabiMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454844  | ORPH 
...linArmv5eabiMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454846  | ORPH 
...eabiUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454848  | ORPH 
...nArmv5eabiUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454851  | ORPH 
...abihfGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454852  | ORPH 
...Armv6eabihfGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454855  | ORPH 
...eabihfMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454857  | ORPH 
...nArmv6eabihfMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454860  | ORPH 
...bihfUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454861  | ORPH 
...rmv6eabihfUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454862  | ORPH 
...abihfGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454863  | ORPH 
...Armv7eabihfGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454864  | ORPH 
...eabihfMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454865  | ORPH 
...nArmv7eabihfMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454866  | ORPH 
...bihfUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454868  | ORPH 
...rmv7eabihfUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454871  | ORPH 
...mv7mUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454873  | ORPH 
...tlinArmv7mUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454876  | ORPH 
...8xxxUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454878  | ORPH 
...nM68k68xxxUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454879  | ORPH 
...fireUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454881  | ORPH 
...8kcoldfireUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454882  | ORPH 
...azebeGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454883  | ORPH 
...icroblazebeGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454885  | ORPH 
...lazebeMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454888  | ORPH 
...MicroblazebeMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454889  | ORPH 
...zebeUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454891  | ORPH 
...croblazebeUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454892  | ORPH 
...azeelGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454894  | ORPH 
...icroblazeelGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454895  | ORPH 
...lazeelMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454896  | ORPH 
...MicroblazeelMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454897  | ORPH 
...zeelUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454900  | ORPH 
...croblazeelUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454902  | ORPH 
...ips32GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454904  | ORPH 
...otlinMips32GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454905  | ORPH 
...Mips32MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454906  | ORPH 
...ootlinMips32MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454908  | ORPH 
...ps32UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454909  | ORPH 
...tlinMips32UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454910  | ORPH 
...s32elGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454912  | ORPH 
...linMips32elGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454913  | ORPH 
...ps32elMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454914  | ORPH 
...tlinMips32elMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454915  | ORPH 
...32elUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454917  | ORPH 
...inMips32elUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454918  | ORPH 
...2r5elGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454920  | ORPH 
...nMips32r5elGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454921  | ORPH 
...32r5elMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454922  | ORPH 
...inMips32r5elMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454925  | ORPH 
...r5elUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454928  | ORPH 
...Mips32r5elUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454932  | ORPH 
...2r6elGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454936  | ORPH 
...nMips32r6elGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454941  | ORPH 
...32r6elMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454944  | ORPH 
...inMips32r6elMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454948  | ORPH 
...r6elUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454952  | ORPH 
...Mips32r6elUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454953  | ORPH 
...eln32GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454954  | ORPH 
...Mips64eln32GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454955  | ORPH 
...4eln32MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454957  | ORPH 
...nMips64eln32MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454958  | ORPH 
...ln32UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454959  | ORPH 
...ips64eln32UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454960  | ORPH 
...64n32GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454962  | ORPH 
...inMips64n32GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454963  | ORPH 
...s64n32MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454964  | ORPH 
...linMips64n32MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454967  | ORPH 
...4n32UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454968  | ORPH 
...nMips64n32UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454969  | ORPH 
...eln32GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454970  | ORPH 
...ps64r6eln32GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454971  | ORPH 
...6eln32MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454972  | ORPH 
...ips64r6eln32MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454975  | ORPH 
...ln32UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454976  | ORPH 
...s64r6eln32UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454977  | ORPH 
...Nios2GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454979  | ORPH 
...ootlinNios2GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454981  | ORPH 
...nriscGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454983  | ORPH 
...linOpenriscGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454986  | ORPH 
...enriscMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454988  | ORPH 
...tlinOpenriscMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454990  | ORPH 
...riscUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454993  | ORPH 
...inOpenriscUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454994  | ORPH 
...440fpGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454996  | ORPH 
...owerpc440fpGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454997  | ORPH 
...c440fpMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454999  | ORPH 
...Powerpc440fpMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798455000  | ORPH 
...40fpUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798455003  | ORPH 
...werpc440fpUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798455004  | ORPH 
...e5500GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798455006  | ORPH 
...erpc64e5500GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798455008  | ORPH 
...e6500GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798455009  | ORPH 
...erpc64e6500GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798455010  | ORPH 
...4e6500MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798455011  | ORPH 
...werpc64e6500MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798455012  | ORPH 
...ower8GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798455014  | ORPH 
...c64lepower8GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798455016  | ORPH 
...power8MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798455017  | ORPH 
...pc64lepower8MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798455019  | ORPH 
...ower8GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798455020  | ORPH 
...rpc64power8GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798455022  | ORPH 
...power8MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798455023  | ORPH 
...erpc64power8MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798455033  | ORPH 
...300c3GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798455036  | ORPH 
...werpce300c3GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798455039  | ORPH 
...e300c3MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798455042  | ORPH 
...owerpce300c3MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798455047  | ORPH 
...00c3UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798455049  | ORPH 
...erpce300c3UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798455053  | ORPH 
...500mcGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798455055  | ORPH 
...werpce500mcGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798455057  | ORPH 
...e500mcMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798455059  | ORPH 
...owerpce500mcMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798455060  | ORPH 
...00mcUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798455061  | ORPH 
...erpce500mcUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798455066  | ORPH 
...lp32dGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798455069  | ORPH 
...lp64dGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798455072  | ORPH 
...iscv64lp64dGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798455077  | ORPH 
...4lp64dMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798455079  | ORPH 
...Riscv64lp64dMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798455080  | ORPH 
...p64dUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798455082  | ORPH 
...scv64lp64dUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798455084  | ORPH 
...0xz13GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798455086  | ORPH 
...linS390xz13GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798455088  | ORPH 
...Shsh4GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798455090  | ORPH 
...ootlinShsh4GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798455092  | ORPH 
...nShsh4MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798455093  | ORPH 
...BootlinShsh4MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798455096  | ORPH 
...hsh4UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798455098  | ORPH 
...otlinShsh4UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798455101  | ORPH 
...h4aebGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798455103  | ORPH 
...linShsh4aebGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798455104  | ORPH 
...sh4aebMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798455105  | ORPH 
...tlinShsh4aebMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798455108  | ORPH 
...arc64GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798455109  | ORPH 
...tlinSparc64GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798455111  | ORPH 
...rcv8UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798455115  | ORPH 
...linSparcv8UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798455117  | ORPH 
...X8664GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798455121  | ORPH 
...ootlinX8664GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798455123  | ORPH 
...nX8664MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798455124  | ORPH 
...BootlinX8664MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798455125  | ORPH 
...8664UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798455126  | ORPH 
...otlinX8664UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798455128  | ORPH 
...orei7GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798455130  | ORPH 
...X8664corei7GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798455132  | ORPH 
...corei7MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798455134  | ORPH 
...nX8664corei7MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798455138  | ORPH 
...rei7UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798455141  | ORPH 
...8664corei7UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798455144  | ORPH 
...664v2GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798455146  | ORPH 
...tlinX8664v2GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798455148  | ORPH 
...8664v2MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798455149  | ORPH 
...otlinX8664v2MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798455150  | ORPH 
...64v2UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798455152  | ORPH 
...linX8664v2UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798455153  | ORPH 
...664v3GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798455154  | ORPH 
...tlinX8664v3GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798455155  | ORPH 
...8664v3MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798455156  | ORPH 
...otlinX8664v3MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798455157  | ORPH 
...64v3UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798455158  | ORPH 
...linX8664v3UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798455159  | ORPH 
...664v4GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798455160  | ORPH 
...tlinX8664v4GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798455162  | ORPH 
...8664v4MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798455163  | ORPH 
...otlinX8664v4MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798455165  | ORPH 
...64v4UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798455166  | ORPH 
...linX8664v4UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798455167  | ORPH 
...core2GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798455169  | ORPH 
...linX86core2GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798455170  | ORPH 
...6core2MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798455171  | ORPH 
...tlinX86core2MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798455172  | ORPH 
...ore2UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798455174  | ORPH 
...inX86core2UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798455176  | ORPH 
...6i686GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798455179  | ORPH 
...tlinX86i686GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798455181  | ORPH 
...86i686MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798455183  | ORPH 
...otlinX86i686MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798455184  | ORPH 
...i686UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798455185  | ORPH 
...linX86i686UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798455186  | ORPH 
...lx60UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798455187  | ORPH 
...Xtensalx60UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798455188  | ORPH 
...ToolchainBuildrootMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454786  | ORPH 
...olchainBuildrootuClibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454788  | ORPH 
...xternalToolchainCCache | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454790  | ORPH 
...ernalToolchainCtngMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454792  | ORPH 
...rnalToolchainLinaroArm | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454793  | ORPH 
...ToolchainSourceryArmv4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454797  | ORPH 
...ToolchainSourceryArmv5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454800  | ORPH 
...ToolchainSourceryArmv7 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454802  | ORPH 
     TestFileCapabilities | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454235  | ORPH 
        TestGdbserverOnly | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454450  | ORPH 
        TestGetDevelopers | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798455191  | ORPH 
     TestGlibcAllTimezone | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454265  | ORPH 
...DefaultLimitedTimezone | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454268  | ORPH 
              TestGlxinfo | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454455  | ORPH 
               TestGnupg2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454461  | ORPH 
           TestGst1Python | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454465  | ORPH 
                TestHWLoc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454470  | ORPH 
              TestHighway | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454468  | ORPH 
           TestIPythonPy3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454476  | ORPH 
...InitSystemBusyboxRoNet | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454342  | ORPH 
  TestInitSystemBusyboxRw | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454344  | ORPH 
       TestInitSystemNone | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454349  | ORPH 
...IfupdownDbusbrokerDbus | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454362  | ORPH 
...ystemSystemdRoNetworkd | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454365  | ORPH 
      TestIso9660Grub2EFI | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454306  | ORPH 
 TestIso9660Grub2External | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454307  | ORPH 
...0Grub2ExternalCompress | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454309  | ORPH 
   TestIso9660Grub2Hybrid | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454313  | ORPH 
 TestIso9660Grub2Internal | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454316  | ORPH 
...so9660SyslinuxExternal | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454317  | ORPH 
...slinuxExternalCompress | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454320  | ORPH 
...so9660SyslinuxInternal | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454321  | ORPH 
                TestJffs2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454324  | ORPH 
               TestLibJXL | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454480  | ORPH 
            TestLibshdata | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454483  | ORPH 
                  TestLua | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454495  | ORPH 
              TestLuaHttp | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454524  | ORPH 
           TestLuaInotify | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454526  | ORPH 
              TestLuaLPeg | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454485  | ORPH 
          TestLuaLsqlite3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454491  | ORPH 
         TestLuaLuaArgon2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454498  | ORPH 
         TestLuaLuaAugeas | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454505  | ORPH 
           TestLuaLuaCffi | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454514  | ORPH 
        TestLuaLuaCqueues | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454518  | ORPH 
          TestLuaLuaExpat | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454543  | ORPH 
     TestLuaLuaFileSystem | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454546  | ORPH 
             TestLuaLuaGD | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454522  | ORPH 
           TestLuaLuaLdap | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454548  | ORPH 
          TestLuaLuaLyaml | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454532  | ORPH 
          TestLuaLuaPosix | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454553  | ORPH 
           TestLuaLuaSDL2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454537  | ORPH 
            TestLuaLuaSec | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454555  | ORPH 
         TestLuaLuaSocket | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454559  | ORPH 
           TestLuaLuacURL | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454520  | ORPH 
           TestLuaLuaossl | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454550  | ORPH 
         TestLuaLuasyslog | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454562  | ORPH 
           TestLuaLuazlib | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454541  | ORPH 
             TestLuaLunix | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454528  | ORPH 
             TestLuaLzlib | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454578  | ORPH 
             TestLuaRings | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454746  | ORPH 
              TestLuaUtf8 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454539  | ORPH 
               TestLuajit | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454496  | ORPH 
           TestLuajitHttp | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454525  | ORPH 
        TestLuajitInotify | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454527  | ORPH 
           TestLuajitLPeg | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454488  | ORPH 
       TestLuajitLsqlite3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454494  | ORPH 
      TestLuajitLuaArgon2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454500  | ORPH 
      TestLuajitLuaAugeas | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454513  | ORPH 
     TestLuajitLuaCqueues | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454519  | ORPH 
       TestLuajitLuaExpat | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454544  | ORPH 
  TestLuajitLuaFileSystem | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454547  | ORPH 
          TestLuajitLuaGD | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454523  | ORPH 
        TestLuajitLuaLdap | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454549  | ORPH 
       TestLuajitLuaLyaml | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454534  | ORPH 
       TestLuajitLuaPosix | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454554  | ORPH 
        TestLuajitLuaSDL2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454538  | ORPH 
         TestLuajitLuaSec | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454558  | ORPH 
      TestLuajitLuaSocket | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454561  | ORPH 
        TestLuajitLuacURL | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454521  | ORPH 
        TestLuajitLuaossl | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454551  | ORPH 
      TestLuajitLuasyslog | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454564  | ORPH 
        TestLuajitLuazlib | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454542  | ORPH 
          TestLuajitLunix | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454530  | ORPH 
          TestLuajitRings | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454747  | ORPH 
       TestLuajitTurbolua | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454764  | ORPH 
           TestLuajitUtf8 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454540  | ORPH 
                 TestLuvi | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454569  | ORPH 
                  TestLxc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454576  | ORPH 
               TestMender | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454579  | ORPH 
             TestMsrTools | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454582  | ORPH 
                 TestNcdu | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454583  | ORPH 
              TestNetdata | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454584  | ORPH 
          TestNodeJSBasic | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454587  | ORPH 
         TestNodeJSModule | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454588  | ORPH 
               TestOctave | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454591  | ORPH 
                  TestOla | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454592  | ORPH 
              TestOpenJdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454594  | ORPH 
         TestOpenSshGlibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454595  | ORPH 
        TestOpenSshuClibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454597  | ORPH 
                 TestOpkg | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454598  | ORPH 
             TestPerftest | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454600  | ORPH 
                 TestPerl | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454601  | ORPH 
        TestPerlClassLoad | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454602  | ORPH 
         TestPerlDBDmysql | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454604  | ORPH 
     TestPerlEncodeDetect | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454605  | ORPH 
          TestPerlGDGraph | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454606  | ORPH 
       TestPerlHTMLParser | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454609  | ORPH 
TestPerlIOSocketMulticast | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454613  | ORPH 
      TestPerlIOSocketSSL | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454617  | ORPH 
 TestPerlLWPProtocolhttps | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454620  | ORPH 
         TestPerlMailDKIM | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454621  | ORPH 
              TestPerlX10 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454623  | ORPH 
        TestPerlXMLLibXML | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454626  | ORPH 
       TestPerllibwwwperl | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454618  | ORPH 
              TestPhpApcu | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454627  | ORPH 
            TestPhpLuaLua | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454630  | ORPH 
         TestPhpLuaLuajit | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454633  | ORPH 
               TestPhpPam | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454635  | ORPH 
          TestPhpPeclDbus | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454638  | ORPH 
                 TestPixz | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454641  | ORPH 
          TestPolkitInitd | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454643  | ORPH 
        TestPolkitSystemd | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454645  | ORPH 
         TestProsodyLua51 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454648  | ORPH 
        TestProsodyLuajit | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454651  | ORPH 
              TestPyNdiff | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454722  | ORPH 
            TestPython3Py | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454653  | ORPH 
         TestPython3PyPyc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454655  | ORPH 
           TestPython3Pyc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454657  | ORPH 
         TestPythonAugeas | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454665  | ORPH 
           TestPythonAvro | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454668  | ORPH 
       TestPythonPahoMQTT | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454715  | ORPH 
     TestPythonPy3Aexpect | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454658  | ORPH 
        TestPythonPy3Argh | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454660  | ORPH 
       TestPythonPy3Attrs | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454661  | ORPH 
    TestPythonPy3Autobahn | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454666  | ORPH 
     TestPythonPy3Automat | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454667  | ORPH 
   TestPythonPy3Bitstring | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454670  | ORPH 
       TestPythonPy3Boto3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454673  | ORPH 
    TestPythonPy3Botocore | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454676  | ORPH 
         TestPythonPy3Can | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454679  | ORPH 
        TestPythonPy3Cbor | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454680  | ORPH 
       TestPythonPy3Click | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454682  | ORPH 
   TestPythonPy3Colorzero | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454683  | ORPH 
  TestPythonPy3Constantly | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454685  | ORPH 
   TestPythonPy3Construct | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454687  | ORPH 
    TestPythonPy3Crossbar | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454688  | ORPH 
TestPythonPy3Cryptography | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454689  | ORPH 
    TestPythonPy3DBusFast | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454690  | ORPH 
    TestPythonPy3DBusNext | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454692  | ORPH 
  TestPythonPy3Dicttoxml2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454693  | ORPH 
      TestPythonPy3Distro | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454694  | ORPH 
      TestPythonPy3Django | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454695  | ORPH 
    TestPythonPy3Dtschema | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454698  | ORPH 
       TestPythonPy3Flask | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454700  | ORPH 
...honPy3FlaskExpectsJson | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454701  | ORPH 
         TestPythonPy3Git | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454702  | ORPH 
      TestPythonPy3Gitdb2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454703  | ORPH 
       TestPythonPy3GnuPG | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454705  | ORPH 
     TestPythonPy3Gobject | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454706  | ORPH 
    TestPythonPy3Gpiozero | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454707  | ORPH 
        TestPythonPy3Hkdf | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454708  | ORPH 
 TestPythonPy3Incremental | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454710  | ORPH 
    TestPythonPy3Iptables | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454711  | ORPH 
    TestPythonPy3Jmespath | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454712  | ORPH 
    TestPythonPy3Libftdi1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454478  | ORPH 
...PythonPy3MagicWormhole | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454713  | ORPH 
       TestPythonPy3Munch | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454714  | ORPH 
     TestPythonPy3Passlib | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454716  | ORPH 
     TestPythonPy3Pexpect | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454717  | ORPH 
      TestPythonPy3PyAlsa | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454719  | ORPH 
      TestPythonPy3Pynacl | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454721  | ORPH 
      TestPythonPy3Pytest | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454723  | ORPH 
...PythonPy3PytestAsyncio | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454724  | ORPH 
      TestPythonPy3Pyyaml | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454725  | ORPH 
      TestPythonPy3Qrcode | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454726  | ORPH 
         TestPythonPy3RSA | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454728  | ORPH 
     TestPythonPy3RpiGpio | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454727  | ORPH 
  TestPythonPy3S3transfer | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454731  | ORPH 
       TestPythonPy3SciPy | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454732  | ORPH 
...thonPy3ServiceIdentity | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454733  | ORPH 
      TestPythonPy3Smmap2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454734  | ORPH 
      TestPythonPy3Spake2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454735  | ORPH 
        TestPythonPy3Treq | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454736  | ORPH 
     TestPythonPy3Twisted | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454737  | ORPH 
       TestPythonPy3Txaio | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454738  | ORPH 
    TestPythonPy3Txtorcon | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454740  | ORPH 
      TestPythonPy3Ubjson | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454741  | ORPH 
...y3UnitTestXmlReporting | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454742  | ORPH 
       TestPythonPy3rtoml | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454729  | ORPH 
         TestPythonPybind | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454720  | ORPH 
             TestRdmaCore | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454743  | ORPH 
                TestRedis | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454744  | ORPH 
                 TestRust | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454748  | ORPH 
              TestRustBin | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454750  | ORPH 
                   TestS6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454752  | ORPH 
         TestS6Networking | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454754  | ORPH 
      TestS6PortableUtils | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454756  | ORPH 
                 TestS6Rc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454758  | ORPH 
 TestSquashfsMaxBlocksize | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454331  | ORPH 
                 TestSudo | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454759  | ORPH 
             TestSyslogNg | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454761  | ORPH 
                 TestTmux | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454762  | ORPH 
TestUbootOpensslPkgConfig | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454766  | ORPH 
                   TestZ3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454768  | ORPH 
             TestZerofree | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454769  | ORPH 
             TestZfsGlibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454771  | ORPH 
              TestZfsMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454773  | ORPH 
            TestZfsUclibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3798454775  | ORPH 



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
