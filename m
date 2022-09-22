Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DB29C6FA82
	for <buildroot@archiver.kernel.org>; Thu, 22 Sep 2022 05:49:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7D51B60E45;
	Thu, 22 Sep 2022 05:49:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7D51B60E45
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1la_9VxtLNCc; Thu, 22 Sep 2022 05:49:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5FFDF60E42;
	Thu, 22 Sep 2022 05:49:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5FFDF60E42
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6BB4A1BF95C
 for <buildroot@lists.busybox.net>; Thu, 22 Sep 2022 05:49:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 44F6740106
 for <buildroot@lists.busybox.net>; Thu, 22 Sep 2022 05:49:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 44F6740106
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zKSqUBhLFgWd for <buildroot@lists.busybox.net>;
 Thu, 22 Sep 2022 05:49:14 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5F7B5400C3
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5F7B5400C3
 for <buildroot@buildroot.org>; Thu, 22 Sep 2022 05:49:13 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id C757F4000E
 for <buildroot@buildroot.org>; Thu, 22 Sep 2022 05:49:09 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Thu, 22 Sep 2022 05:49:09 -0000
Message-Id: <20220922054917.44F6740106@smtp4.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1663825750; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=4/LOXKRieTv5SX7DP81HgOffu3npqbSX9nFKnNVqYhs=;
 b=eA9/dyvVcNI/c3LCnSdhpwzQ+rfQSAIPgSlclfCoUX6kL92SNurjwiswjp/g6YQGONjmrS
 eU3/Eeahi905igrPlPX9LKRl1URwzUFaIq0GbsCej31GdOsP4tRJaLcSs/wNpjsPZvy/pS
 wLCkrDk1iyXN6pl8ZDDbYMEbIkoKI/6yV18J1/zAbuIiC0SdU2IvPCHd4LgHEH5e6dJ/bF
 T81mFQy/sQ9tK6qZ0mEzY2XKC4k5hEduIsfq4+NyWIhdq+DB0NmgG/bT4r8FXbuZSBCJut
 HF6zJWdWBQ6rMCZ7WhtFNUm0dWmOot1FXL3/NCgZrZAr5C/se7R3vrZ0ySjk3w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=eA9/dyvV
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-09-21
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

Autobuild statistics for 2022-09-21
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  | 18  |  7  |  0  | 25  |
  2022.05.x  | 30  | 27  |  0  | 57  |
    master   | 177 | 205 |  2  | 384 |

Classification of failures by reason for master
-----------------------------------------------

              host-rust-1.62.0 | 12
                 linux-5.17.15 | 10
                       unknown | 10
glibc-2.35-134-gb6aade18a7e... | 7 
                host-go-1.19.1 | 7 
host-pahole-73383b3a39afe86... | 7 
            host-binutils-2.38 | 6 
                 dash-0.5.11.5 | 4 
google-breakpad-c85eb4a59b6... | 4 
             libgpg-error-1.45 | 4 
                tealdeer-1.5.0 | 4 
                    zeek-4.1.1 | 4 
                elfutils-0.186 | 3 
                  gensio-2.5.2 | 3 
gummiboot-2bcd919c681c952eb... | 3 
                libcurl-7.84.0 | 3 
              libgcrypt-1.10.1 | 3 
               libglib2-2.72.3 | 3 
           linux-5.10.115-cip7 | 3 
                  vlc-3.0.17.4 | 3 
                 coreutils-9.1 | 2 
                  exempi-2.6.1 | 2 
               fftw-quad-3.3.8 | 2 
                     frr-8.2.2 | 2 
fs/ubifs/ubifs.mk:49: /home... | 2 
fs/ubifs/ubifs.mk:49: /home... | 2 
                gerbera-1.10.0 | 2 
                gnu-efi-3.0.14 | 2 
  gobject-introspection-1.72.0 | 2 
          lttng-modules-2.13.1 | 2 
               mariadb-10.3.36 | 2 
                    musl-1.2.3 | 2 
                    sdl-1.2.15 | 2 
                    volk-2.5.1 | 2 
                wtfutil-0.41.0 | 2 
                xenomai-3.0.10 | 2 
               xfsprogs-5.14.2 | 2 
                 zlib-ng-2.0.6 | 2 
/home/buildroot/autobuild/i... | 1 
/home/buildroot/autobuild/i... | 1 
afboot-stm32-3566acd582e553... | 1 
              asterisk-16.25.2 | 1 
        at91dataflashboot-1.05 | 1 
                 augeas-1.12.0 | 1 
azure-iot-sdk-c-LTS_07_2022... | 1 
                  boost-1.80.0 | 1 
                    brltty-6.4 | 1 
                  cairo-1.16.0 | 1 
           crucible-2022.05.25 | 1 
                    dhcp-4.4.3 | 1 
           docker-cli-20.10.18 | 1 
                   flann-1.9.1 | 1 
             fontconfig-2.13.1 | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
                    gdal-3.5.1 | 1 
          gitlab-runner-14.5.1 | 1 
         gobject-introspection | 1 
           heirloom-mailx-12.5 | 1 
            host-binutils-2.37 | 1 
            host-binutils-2.39 | 1 
              host-delve-1.8.0 | 1 
            igh-ethercat-1.5.2 | 1 
                  lcms2-2.13.1 | 1 
      libabseil-cpp-20220623.0 | 1 
               libcap-ng-0.8.3 | 1 
               libdeflate-1.12 | 1 
                libglvnd-1.4.0 | 1 
              libmanette-0.2.6 | 1 
               libmdbx-0.11.11 | 1 
                   libnss-3.83 | 1 
                   libqb-2.0.6 | 1 
                   linux-tools | 1 
        ltp-testsuite-20220527 | 1 
            lttng-tools-2.13.2 | 1 
                          mawk | 1 
              memcached-1.6.16 | 1 
                    mpv-0.33.1 | 1 
         mxs-bootlets-10.12.01 | 1 
                nodejs-16.16.0 | 1 
                  ntp-4.2.8p15 | 1 
                  ntpsec-1_2_1 | 1 
            ocf-linux-20120127 | 1 
                 openal-1.22.0 | 1 
               openblas-0.3.21 | 1 
                 openssh-9.0p1 | 1 
               owl-linux-1.0.7 | 1 
                   perl-5.34.1 | 1 
          perl-net-ssleay-1.85 | 1 
                     php-8.1.9 | 1 
                      pigz-2.7 | 1 
pistache-3ec9d7c4f8b828fdd3... | 1 
            quickjs-2021-03-27 | 1 
     s6-portable-utils-2.2.3.2 | 1 
toolchain-external-arm-aarc... | 1 
toolchain-external-codescap... | 1 
           uboot-tools-2021.07 | 1 
                 uclibc-1.0.42 | 1 
uclibc-ng-test-0844445e7358... | 1 
                     vdr-2.6.1 | 1 
wilc-driver-linux4microchip... | 1 
                 wolfssl-5.5.0 | 1 
           xtables-addons-3.17 | 1 
                    zstd-1.5.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/63e7cff4ffd5a7492b8870c4ae5703f322c6f1c0 |     
   nios2     | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/380efe74968b6a15e81a2288c5b3b5eb3cba4546 |     
    arm      | afboot-stm32-3566acd582e553... | NOK | http://autobuild.buildroot.net/results/924e59a9c285640de73528ac02fc3ae5b02a1b41 |     
   arceb     |        asterisk-16.25.2        | NOK | http://autobuild.buildroot.net/results/d72dd4562a1468c1a295e74f74343cacf0ffb77e |     
    arm      |     at91dataflashboot-1.05     | NOK | http://autobuild.buildroot.net/results/7db7feb7c357e5fd74cc2be70d9b0f67d09b5115 | ORPH
  riscv64    |         augeas-1.12.0          | NOK | http://autobuild.buildroot.net/results/1fd8b058e5573af14e249974159960c7b8cad5c1 |     
    arm      | azure-iot-sdk-c-LTS_07_2022... | NOK | http://autobuild.buildroot.net/results/0b929ad778d8008c8cc66915b10a6766129fd55e |     
    arc      |          boost-1.80.0          | NOK | http://autobuild.buildroot.net/results/e786b40ba0931a71195799865762dd91a5525b05 |     
  powerpc    |           brltty-6.4           | NOK | http://autobuild.buildroot.net/results/f22032b4f500a507929f5aeb7c5b6c5618b8f9d3 |     
   xtensa    |          cairo-1.16.0          | NOK | http://autobuild.buildroot.net/results/8c547ec2e148ce3c4f230bb4b0d5c5b360d74dd5 |     
   sh4eb     |         coreutils-9.1          | NOK | http://autobuild.buildroot.net/results/3a6d5eda839b833d5fced8a900c1c114a84dacbc | ORPH
   sh4eb     |         coreutils-9.1          | NOK | http://autobuild.buildroot.net/results/52e202beb8a51fe72704a256f28bc61c29e270d0 | ORPH
  aarch64    |      crucible-2022.05.25       | NOK | http://autobuild.buildroot.net/results/1a62ca05b53f2b9059dc75ee8342ab121e684fa4 |     
microblazeel |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/1b86c833ab863620c0bbf9abc385ffab9c4a06e0 | ORPH
    sh4a     |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/9f7749c0288eab7b90c75974f5f04175c8f00c49 | ORPH
   armeb     |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/7a20b6f0c5f72a187b874998201366ad82c368e1 | ORPH
    arm      |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/0858c42adbd5e42c03ceac631f0d8a51a53888d1 | ORPH
   xtensa    |           dhcp-4.4.3           | NOK | http://autobuild.buildroot.net/results/506e4e46e5e67b5ee55693554936ab25642ef8a2 | ORPH
   x86_64    |      docker-cli-20.10.18       | NOK | http://autobuild.buildroot.net/results/abaaf76773d966a1c24506427742507522d13d62 |     
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/06019499ff3d61508ce2ad88897577f552d17360 | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/9a9eaf0d6a632869e0c7c7d75d679ec75989ea3e | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/ce6a3152f3fceb45e7c101b74e8c1724c33c2ec1 | ORPH
powerpc64le  |          exempi-2.6.1          | NOK | http://autobuild.buildroot.net/results/258e3b5158eb5daf7978b02b217cefcc8ec6772f |     
    arm      |          exempi-2.6.1          | NOK | http://autobuild.buildroot.net/results/4bad39152ed485ac2404e6c50561c33c50cc4556 |     
powerpc64le  |        fftw-quad-3.3.8         | NOK | http://autobuild.buildroot.net/results/06ae99ab564f694481d62bf3064206ea4a64fd1e | ORPH
powerpc64le  |        fftw-quad-3.3.8         | NOK | http://autobuild.buildroot.net/results/ae07222f8dd760d02a5075826b3841b385d2270a | ORPH
    sh4      |          flann-1.9.1           | NOK | http://autobuild.buildroot.net/results/ecb515c7bfc59f965a20e5884e8923fc6874e1c3 |     
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/7ca51f1029e374f38bd909dd9542b45f46c8bc2d | ORPH
   xtensa    |           frr-8.2.2            | NOK | http://autobuild.buildroot.net/results/d0433aebf25e8daa350ec54f41f1872dd683c355 |     
   xtensa    |           frr-8.2.2            | NOK | http://autobuild.buildroot.net/results/8854c52a09f7687bfbb6f6c9dd0e3e29d9efd8ec |     
   armeb     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/c757d472d401d02922f79e175f9c6935297ddcf9 |     
powerpc64le  | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/4c7fc3d0bc0d772c3cec61fcbfb837ce5f0131a8 |     
  powerpc    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/a2df0917a004cf5638e7386a68c7bc304d26071b |     
  powerpc    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/573a0c52ffc3aa9f94b0c4d2719eb2e453c24cf9 |     
    or1k     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/fef88f9c0c2d4b812c414541fdc1cd7ceb72be2d |     
   nios2     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/75f358f620b6bc85e4e1284cdfc75483adba458a |     
   mips64    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/9a2e5503fad37818f4cd55598896c2eefa897aab |     
   sh4aeb    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/f958ea92e60e7d405b8b65bed9770a4bc97b3bed |     
    or1k     |           gdal-3.5.1           | NOK | http://autobuild.buildroot.net/results/3b09792024e935dcf594b185031b818ba3980de6 |     
 microblaze  |          gensio-2.5.2          | NOK | http://autobuild.buildroot.net/results/b9eaa7626fdcea6198e4444c6a2dd8384215e993 |     
powerpc64le  |          gensio-2.5.2          | NOK | http://autobuild.buildroot.net/results/c8eac7ab8f58635e9f0f04e8ed2b44c0fb5b349b |     
   armeb     |          gensio-2.5.2          | NOK | http://autobuild.buildroot.net/results/ff7352a9f3c7e5fbf4fbf946fe843b6ddcb4a8ea |     
    or1k     |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/bfcbf5222f0f219d81258f3ff597d9081690ecea |     
   nios2     |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/6c0b423311b366adcb4851ca300eb19df3dfa30b |     
    i686     |      gitlab-runner-14.5.1      | NOK | http://autobuild.buildroot.net/results/de1ed02fb55df1ef1325240d35b3e9468233f548 |     
microblazeel | glibc-2.35-134-gb6aade18a7e... | NOK | http://autobuild.buildroot.net/results/399ea8b9a077b03093a694af2b7529cf4a1e5f50 |     
   arceb     | glibc-2.35-134-gb6aade18a7e... | NOK | http://autobuild.buildroot.net/results/201f1e2843d0468d7f8936719bc55189ae6c41e5 |     
   mipsel    | glibc-2.35-134-gb6aade18a7e... | NOK | http://autobuild.buildroot.net/results/cc9bd0096b7d15a02008240494c30b1e48048f7e |     
   mipsel    | glibc-2.35-134-gb6aade18a7e... | NOK | http://autobuild.buildroot.net/results/500ce3382f1f00428eb5a56143eee251a2782a4f |     
    or1k     | glibc-2.35-134-gb6aade18a7e... | NOK | http://autobuild.buildroot.net/results/1ad241a7d9f23fc540901bb02e0006922a059711 |     
microblazeel | glibc-2.35-134-gb6aade18a7e... | NOK | http://autobuild.buildroot.net/results/d377665a849f3750c0ac6c3ac43efc43e95a9014 |     
   sh4aeb    | glibc-2.35-134-gb6aade18a7e... | NOK | http://autobuild.buildroot.net/results/14a09898a4310f1ba390dd943c8a756bf3b24bad |     
  mips64el   |         gnu-efi-3.0.14         | NOK | http://autobuild.buildroot.net/results/751897143e3f3d2a2618b16d53df8d85e3ff7e93 |     
  mips64el   |         gnu-efi-3.0.14         | NOK | http://autobuild.buildroot.net/results/6ca1811f3af5fbf59e4b7b6541f5a5f0d50b49bc |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/76fc9a05cb8794e3c8fd5380705e5688f5e1ceb7 |     
   s390x     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/7a9ecacc02990816007c158e1e6376f10675cb40 | ORPH
   x86_64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/8dec4f55bf76021c8f6215540ff121f618544a92 | ORPH
    arm      | google-breakpad-c85eb4a59b6... | NOK | http://autobuild.buildroot.net/results/212a86e35ecd2548015d902cc10792514a0ef339 |     
   mipsel    | google-breakpad-c85eb4a59b6... | NOK | http://autobuild.buildroot.net/results/e7e8ae5e52e22d5d4a01ec6dcda6ad5a0ac526f2 |     
   mipsel    | google-breakpad-c85eb4a59b6... | NOK | http://autobuild.buildroot.net/results/75c1c8ecc7c419cb591168f12a3757e05de8bd33 |     
   mipsel    | google-breakpad-c85eb4a59b6... | NOK | http://autobuild.buildroot.net/results/e241fc1ad7ae87aac03f06e5a0ed9c5c619a09b2 |     
    i586     | gummiboot-2bcd919c681c952eb... | NOK | http://autobuild.buildroot.net/results/2bb3fa66cc4bc545a0c8f2b454bf94d4c57073bc |     
   x86_64    | gummiboot-2bcd919c681c952eb... | NOK | http://autobuild.buildroot.net/results/642a7dcc828a65cc3452df83449625ecbe64664b |     
   x86_64    | gummiboot-2bcd919c681c952eb... | NOK | http://autobuild.buildroot.net/results/ead7609c416c1e8f8ac14b68fc8b539dd5b0701b |     
    sh4a     |      heirloom-mailx-12.5       | NOK | http://autobuild.buildroot.net/results/710f86908a169f7a78d59194a22cfa87114bd63c |     
   sparc     |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/d5845f492f04488ad6b53cf00a98e55eafc738b1 |     
   mips64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/e60586d44612e3ced64db07950a7249ea06da64f |     
    arm      |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/a203ba6eabc544d84b2c211e07a4a740f27497b9 |     
  powerpc    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/99148e298c02d60c2d82e20f4e8c6fc1819fec22 |     
    or1k     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/7dc60d3acc6803351ee1a07a1692fa81a6fa64ad |     
 microblaze  |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/9d033732d7583bc01f057caaba941a38ce7f0111 |     
  sparc64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/42321efc2a1f74cbf1b50ecaaba8097f81247363 |     
   mips64    |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/1267523cb88b9d4bb5de3cba67b6d27efd046346 |     
   mips64    |        host-delve-1.8.0        | NOK | http://autobuild.buildroot.net/results/2d39a29aea8f66cdf22139e14883abe42e5cda11 |     
  aarch64    |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/738b66ed86ae50c965b4b200e4fdaca76fdd2f25 |     
  mips64el   |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/429e2c6276a20d5591366fc33951e03de3705f24 |     
    i586     |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/6a93d56d5c450507d2d7c3974aa2f56cf39622b9 |     
   mips64    |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/0ce392b1fbdc083b57e7721c6c1a68b326d6f69e |     
    i686     |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/2a7b71386ab24d07af3ee246db889fa50b5e88e7 |     
    i686     |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/5fe738f00ef5cb877afaef4462208d2c9f473581 |     
    i586     |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/c3d203197c496a9a011fd0cc47253eaa06778bf2 |     
    arm      | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/8b5c2eaf16236a60ddf52e8fb257fe88bd984caa |     
powerpc64le  | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/f5140068334c60b93d6eed6d110ee15090d070c0 |     
  mips64el   | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/02427b972f474ee2993c7f874501de1f630f7db4 |     
 powerpc64   | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/99e31e5db6c92e1422eda6006344832afe6f9283 |     
 microblaze  | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/5249ccb0cd94ede51cfd4010136ed84c0da9a0b2 |     
  sparc64    | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/90c478c608809f2381a016ad466d78305b3a458e |     
 microblaze  | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/c381d250f9f62e13ed85e38fc2c4bb1db99f33d3 |     
   s390x     |        host-rust-1.62.0        | NOK | http://autobuild.buildroot.net/results/0a355177b3597d5f6a01100d430a6c8f66993113 |     
  sparc64    |        host-rust-1.62.0        | NOK | http://autobuild.buildroot.net/results/a7f4fefd435aaea45fd2b493706203e18123c8a0 |     
  sparc64    |        host-rust-1.62.0        | NOK | http://autobuild.buildroot.net/results/1e94dc0a4842d1d3c035e14eeeb100eb2b8119b3 |     
  mips64el   |        host-rust-1.62.0        | NOK | http://autobuild.buildroot.net/results/21241be5558c9c22a193e90c15b97960d58b73c4 |     
   mipsel    |        host-rust-1.62.0        | NOK | http://autobuild.buildroot.net/results/d7b1c072b7811b9a88497cdaa9937d493d9ddecb |     
   mipsel    |        host-rust-1.62.0        | NOK | http://autobuild.buildroot.net/results/694da3af0ec904fced1821709427b3b3234c9dcd |     
  sparc64    |        host-rust-1.62.0        | NOK | http://autobuild.buildroot.net/results/dd1d48038a713d3ea8cab06c6f264a8bdc9a7de5 |     
  sparc64    |        host-rust-1.62.0        | NOK | http://autobuild.buildroot.net/results/92e215a7de703fd61089091a943e0ccf552b952c |     
  sparc64    |        host-rust-1.62.0        | NOK | http://autobuild.buildroot.net/results/5b5ffb45d11554224db0af272e5a8065f2cc53a7 |     
   mipsel    |        host-rust-1.62.0        | NOK | http://autobuild.buildroot.net/results/4bbb21af822f88987c70aaf91580d7eb55fd832c |     
   mipsel    |        host-rust-1.62.0        | NOK | http://autobuild.buildroot.net/results/512488580988f85872d3a68c88133295ab3f4608 |     
   x86_64    |        host-rust-1.62.0        | NOK | http://autobuild.buildroot.net/results/2a1f097ec691a34245645b0e63bf26a3fd463b7f |     
   sparc     |       igh-ethercat-1.5.2       | NOK | http://autobuild.buildroot.net/results/dc83a4cfcc72cfa918927158d28bf4adf968c2c1 |     
   xtensa    |          lcms2-2.13.1          | NOK | http://autobuild.buildroot.net/results/feb8929ac58adf0df02562ba39d5f1e182756c2c |     
  mips64el   |    libabseil-cpp-20220623.0    | NOK | http://autobuild.buildroot.net/results/ad197f2b8571e6d342d7b8cb028c913ecf2cd73b |     
  riscv64    |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/f66363a3c79a1da9fef934cbb5aebd9615871b1a |     
  riscv64    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/8f79bbad6521d48333456634f6322ab996070ea7 |     
  riscv64    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/39435fb735e3f0fe6a80ee83801b18fd747b1ad8 |     
  riscv64    |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/dc57475ef9bc9c9015ab9e57c461d524cf1dde4d |     
  aarch64    |        libdeflate-1.12         | NOK | http://autobuild.buildroot.net/results/6ab241b40cecca1e6d6e05d687c0b69f9d321a7a |     
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/758d4ba00d111dc3a712309cc1f9d70ae59d5f4a | ORPH
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/b5de0073caa07828083215b6b898043a7663711f | ORPH
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/57d36ea2160b9382ca473381c99bfcd6697a977a | ORPH
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/527da1cb6fa1b69b45852f97e2e6c171112345de |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/8fcd2f9aa915948152487e0ca7dbd2cc8449295f |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/145a5f47c37fe9fe043b75ef2e35b607aa85ec91 |     
    m68k     |         libglvnd-1.4.0         | NOK | http://autobuild.buildroot.net/results/b1080d828a7e434b269abe59a665739a38287818 | ORPH
 aarch64_be  |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/200ccbd22988cedc6837899d5dee00bc9b8f3a27 | ORPH
  aarch64    |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/bab5502a9f09fe84b291b4983e649ced9f532431 | ORPH
  aarch64    |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/ad00a36f1c7ff77f20b7d47e3ef23fa769b3c1ba | ORPH
  aarch64    |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/461669f5af1fcf902babe275b6b2ddcc590cc130 | ORPH
   arceb     |        libmanette-0.2.6        | NOK | http://autobuild.buildroot.net/results/9e6c807455b5a4e8986e8388426d98024119aa9c |     
 microblaze  |        libmdbx-0.11.11         | NOK | http://autobuild.buildroot.net/results/816d15bcab97272fbd179f6b74ce74d3fc23c088 |     
   mipsel    |          libnss-3.83           | NOK | http://autobuild.buildroot.net/results/968ec2b60b9d532c3ab7a79bbc9ca3e31fd832d5 |     
    or1k     |          libqb-2.0.6           | NOK | http://autobuild.buildroot.net/results/4ac3051a1b693a97c165fa607a69be6d32e0bef4 |     
   x86_64    |      linux-5.10.115-cip7       | NOK | http://autobuild.buildroot.net/results/cfd1d40da28c51495d0a1a1692ae3782cdb21a06 | ORPH
  mips64el   |      linux-5.10.115-cip7       | NOK | http://autobuild.buildroot.net/results/a3a2af477d3b47efc98d666cef4e9909390c260c | ORPH
    m68k     |      linux-5.10.115-cip7       | NOK | http://autobuild.buildroot.net/results/ae39c679948c0eaa2852c4dc58eb61e8244641ff | ORPH
    arm      |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/87fda8cb392e596bdfb30c7ad1b09992d728c672 | ORPH
  powerpc    |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/4a8e6bca30b71d9060799383dc2a72cddf924a3a | ORPH
   s390x     |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/5bba5e5a2de50121a66144a9ded4e0a152748f70 | ORPH
    sh4a     |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/88c3a74424fbba87ed93dda09e9c7f2e254dac98 | ORPH
    m68k     |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/fea5db6d00dfe7a6a9df25aa1c451704cf3d3fe7 | ORPH
    mips     |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/3004e355d7c741561a6df2e22575f3f099cbd011 | ORPH
   sh4aeb    |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/714519b5df791a9a38562ac62eaaa4c8a4ef173b | ORPH
    arm      |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/7c3e0aa01de00fa3339ce22c05220e78a4614dac | ORPH
   s390x     |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/a38e24b5339030aff3e416782009056b9285f8cd | ORPH
   s390x     |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/bccf7473c41ed70b75f001eeee4708d01f3ae35b | ORPH
   s390x     |          linux-tools           | NOK | http://autobuild.buildroot.net/results/9657acea4a042fee4de7292f2172d7e639e50ce6 | ORPH
   x86_64    |     ltp-testsuite-20220527     | NOK | http://autobuild.buildroot.net/results/abc59f2565ea35d279a79874fa476490a0356c56 |     
  riscv32    |      lttng-modules-2.13.1      | NOK | http://autobuild.buildroot.net/results/9d9066e0249b77b86617376331fdd32fad684e41 |     
    or1k     |      lttng-modules-2.13.1      | NOK | http://autobuild.buildroot.net/results/7d450f8484935d7f2f98f246ce28681f477140b6 |     
   mipsel    |       lttng-tools-2.13.2       | NOK | http://autobuild.buildroot.net/results/7a31a1b58099297c8b77dc155870b595750e387e |     
    m68k     |        mariadb-10.3.36         | NOK | http://autobuild.buildroot.net/results/a5c63592353848b83ab65560eb6a3a8dfcfa3fe1 | ORPH
   sparc     |        mariadb-10.3.36         | NOK | http://autobuild.buildroot.net/results/e7301a098e014fe779dd0e3cfca1d462ee416573 | ORPH
    m68k     |              mawk              | TIM | http://autobuild.buildroot.net/results/a45e5215e5e4c474ef6dfb54c79402020dd62af0 |     
  aarch64    |        memcached-1.6.16        | NOK | http://autobuild.buildroot.net/results/866f6ead3e87278f061ee6c2f7d7a148adf017a3 | ORPH
 microblaze  |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/a995a7987216f15cbe72298d6d4d72cf90dbb257 |     
  powerpc    |           musl-1.2.3           | NOK | http://autobuild.buildroot.net/results/9b9329e286dd792726ae7fd8fb6897dd292a8cad |     
  powerpc    |           musl-1.2.3           | NOK | http://autobuild.buildroot.net/results/ec4ecb4df36c264a9940ea90062341b91d8b1eb5 |     
    arm      |     mxs-bootlets-10.12.01      | NOK | http://autobuild.buildroot.net/results/1f71da35f14887ae9621d3e2fd46543320df75e5 | ORPH
  aarch64    |         nodejs-16.16.0         | NOK | http://autobuild.buildroot.net/results/f96c5f5dea0451b15179d653a3652a8398998699 |     
  riscv64    |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/435c36760449e444fea2bc0b0a31ca98db3919d3 | ORPH
    i686     |          ntpsec-1_2_1          | NOK | http://autobuild.buildroot.net/results/a96dac9c68253aea29ea293afdbcbcac3efea027 |     
microblazeel |       ocf-linux-20120127       | NOK | http://autobuild.buildroot.net/results/4166e4652b4c381f5148718f7f50945c021658e7 | ORPH
  mips64el   |         openal-1.22.0          | NOK | http://autobuild.buildroot.net/results/291424cb34d6fb2e33b10b94c80c022c7b06c111 |     
   mips64    |        openblas-0.3.21         | NOK | http://autobuild.buildroot.net/results/c8f3553a1345f94b8bd23aa8f78495b1af66d6dc | ORPH
  sparc64    |         openssh-9.0p1          | NOK | http://autobuild.buildroot.net/results/0ac33ae5f343aef7c07dab64bd9daf03261ffe55 | ORPH
    arm      |        owl-linux-1.0.7         | NOK | http://autobuild.buildroot.net/results/6b0da5273a677bbb7ddf09cc3ef6868875bb599b |     
   arceb     |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/a82daa9b5c3d19a5f2316dcb2cb717fbe5084f67 |     
    i686     |      perl-net-ssleay-1.85      | NOK | http://autobuild.buildroot.net/results/75295b65ff0299ae4d133ed1e76bb261fca73ca8 |     
    or1k     |           php-8.1.9            | NOK | http://autobuild.buildroot.net/results/0d515731f2ffd698ed43d69bd715c8682b486fc2 |     
microblazeel |            pigz-2.7            | NOK | http://autobuild.buildroot.net/results/eafe2a5c41fdae64bef8614833ae14a574605e6f |     
    m68k     | pistache-3ec9d7c4f8b828fdd3... | NOK | http://autobuild.buildroot.net/results/4c4dd36418fe3f72de6fabe3a1a167bc471b0a25 | ORPH
microblazeel |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/a05b5a5a52cffc2d9f11bc823fedce2e7f231905 |     
 microblaze  |   s6-portable-utils-2.2.3.2    | NOK | http://autobuild.buildroot.net/results/20118f5f33c24fe2661719c1c622917d94fb555b |     
    sh4a     |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/32661f7fe7de2d420f6d0864a19d7818c0545947 | ORPH
   sh4aeb    |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/02491514794e0a2593da276a48e2575a518a60a2 | ORPH
 powerpc64   |         tealdeer-1.5.0         | NOK | http://autobuild.buildroot.net/results/015de951eb6e7133a5fa5b334dbc3dd3ef41790f |     
  sparc64    |         tealdeer-1.5.0         | NOK | http://autobuild.buildroot.net/results/00044b5c0e25a720faa55ce041e568ad4c621ee4 |     
 powerpc64   |         tealdeer-1.5.0         | NOK | http://autobuild.buildroot.net/results/3c590731845a316629fcfa42383347f54181bac8 |     
    mips     |         tealdeer-1.5.0         | NOK | http://autobuild.buildroot.net/results/3dc5aa013365e23bf39db1c56d01f73173e086d7 |     
  aarch64    | toolchain-external-arm-aarc... | NOK | http://autobuild.buildroot.net/results/41b35731590373ab86c959df57df813c8297302a | ORPH
  mips64el   | toolchain-external-codescap... | NOK | http://autobuild.buildroot.net/results/c22b77ca484cf593e4439c364e1f555620a47329 | ORPH
   x86_64    |      uboot-tools-2021.07       | NOK | http://autobuild.buildroot.net/results/d22782b22e558beca9e10fd7b67fb967a016b33f |     
  powerpc    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/90a4392cf31eb7aeec7f29225fcba2c0d8389729 |     
   mipsel    | uclibc-ng-test-0844445e7358... | NOK | http://autobuild.buildroot.net/results/cb59db719cdad35aee4bd449793e986494a03d53 |     
  sparc64    |            unknown             | NOK | http://autobuild.buildroot.net/results/8f9b7f22ad113e12d0bbc14ff077e3c50b9fd9c4 |     
 powerpc64   |            unknown             | NOK | http://autobuild.buildroot.net/results/41d16526f99472cfe730d84c22d298b30663bf83 |     
  riscv32    |            unknown             | NOK | http://autobuild.buildroot.net/results/1d7c6593cdc8fc3c8c0aad595bb6881599c98d43 |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/1cadcb3a8790a0755c567057464063f66d4c487e |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/9b35aa982ab75107a2a8f98e0dd2857a5a9035a4 |     
   armeb     |            unknown             | NOK | http://autobuild.buildroot.net/results/513a428abe2ed12bfbb3c40b37f4aae52f2e2fef |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/cfd976d13a510ef84cced5dd960211cc064363da |     
powerpc64le  |            unknown             | NOK | http://autobuild.buildroot.net/results/e89e74618ccbfaeaea5d87d87e0701f6d5ba6654 |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/775f8e687a78eb1b2d902322f0e7b651c6db11fb |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/56ab3cad2db651134f74e5cdff175d376bddc712 |     
    arm      |           vdr-2.6.1            | NOK | http://autobuild.buildroot.net/results/018fc3a1a7e98040e800445ca72fe499cfa19f95 |     
   s390x     |          vlc-3.0.17.4          | NOK | http://autobuild.buildroot.net/results/df7298c7cefe91a60b461ae1fdec39081add726b |     
 powerpc64   |          vlc-3.0.17.4          | NOK | http://autobuild.buildroot.net/results/b59af99dd95ef249f8fd446569b9727f96123dab |     
 powerpc64   |          vlc-3.0.17.4          | NOK | http://autobuild.buildroot.net/results/74afc1b24f34213c6643c1b7f84b25e583283cf2 |     
    mips     |           volk-2.5.1           | NOK | http://autobuild.buildroot.net/results/8bffdd923276c292b6a40ddd6869b2632cc48080 |     
    mips     |           volk-2.5.1           | NOK | http://autobuild.buildroot.net/results/698c0328f737005be7710d066978341d4525084e |     
powerpc64le  | wilc-driver-linux4microchip... | NOK | http://autobuild.buildroot.net/results/1ff37f84d843c40104b3d97e3f1be57fd66d5ec3 |     
  riscv32    |         wolfssl-5.5.0          | NOK | http://autobuild.buildroot.net/results/3a1c960ca15fa181e2e52f10bf2e9c76d16eb15c |     
    i686     |         wtfutil-0.41.0         | NOK | http://autobuild.buildroot.net/results/7758b3638d28317a12811722541e552284d70005 |     
   s390x     |         wtfutil-0.41.0         | NOK | http://autobuild.buildroot.net/results/df2e30abad465dfb867388d0d4fe20ca339a6aac |     
  aarch64    |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/2247e21d9e26f43a5565853b2f972e786f590d98 |     
    arm      |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/a8eeed827323b668df862da9762fe8545330980e |     
   nios2     |        xfsprogs-5.14.2         | NOK | http://autobuild.buildroot.net/results/803207f936972f68d3e1d073b30aa459f9dccce1 | ORPH
   nios2     |        xfsprogs-5.14.2         | NOK | http://autobuild.buildroot.net/results/c0c1c161934fab7ca8a1496644d6ff977021826a | ORPH
   sh4eb     |      xtables-addons-3.17       | NOK | http://autobuild.buildroot.net/results/b8f5f65cec1bd5c859f4a1fae4508900df362add | ORPH
   sparc     |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/a4635a04b19ab4dffdf7c0cfa244a9a05ca97ba4 |     
 aarch64_be  |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/58dc3a46186054d7821a3b4e58b5b3ac305a0ad8 |     
  mips64el   |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/2ca18e680ca2e7671f7a0bef7a6638d1fea64950 |     
  aarch64    |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/39ccf1186c7d3b0fb888d9e66570f030e6e7a785 |     
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/fbcce31e3d5d2e8eb492716c41d0014ccbd759d9 | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/30673e7b72c09b2a6b457df05fb13a0adb616e7a | ORPH
 microblaze  |           zstd-1.5.2           | NOK | http://autobuild.buildroot.net/results/cd161a8fd7cd62969b1073194dff557c3d825439 |     


Classification of failures by reason for 2022.02.x
--------------------------------------------------

                       frr-8.1 | 2 
         graphicsmagick-1.3.37 | 2 
                  exempi-2.6.1 | 1 
                 mesa3d-21.3.5 | 1 
                 wavemon-0.9.4 | 1 


Detail of failures for 2022.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |          exempi-2.6.1          | NOK | http://autobuild.buildroot.net/results/7ccd2ea3eefce299fa6a381001dff078b82ffabd |     
  mips64el   |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/1d5bac90543037cbc91c04f1ea4703c620377b1d |     
    arc      |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/b9d1257efdbe217296474ee68c50aee5f64e6a6f |     
  sparc64    |     graphicsmagick-1.3.37      | NOK | http://autobuild.buildroot.net/results/323422d613bc6bb41c99caa82df08191ef7af1ec |     
   sparc     |     graphicsmagick-1.3.37      | NOK | http://autobuild.buildroot.net/results/1345ce9b8f4938ca0503ac53abefdc2501e296c5 |     
   x86_64    |         mesa3d-21.3.5          | NOK | http://autobuild.buildroot.net/results/02b8a5022c98433d8ea53cb5a12f03e202e2615e |     
microblazeel |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/78a8d5d32b317541e4826ce9476e721754c9f958 |     


Classification of failures by reason for 2022.05.x
--------------------------------------------------

         graphicsmagick-1.3.37 | 7 
host-pahole-73383b3a39afe86... | 3 
                host-go-1.18.6 | 2 
              host-rust-1.60.0 | 2 
              memcached-1.6.12 | 2 
               protobuf-3.20.1 | 2 
                  exempi-2.6.1 | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
glibc-2.35-134-gb6aade18a7e... | 1 
                  libftdi1-1.5 | 1 
                libglvnd-1.3.2 | 1 
             libopenssl-1.1.1q | 1 
                proftpd-1.3.6e | 1 
ulog-0389d243352255f6182326... | 1 
                 wavemon-0.9.4 | 1 


Detail of failures for 2022.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |          exempi-2.6.1          | NOK | http://autobuild.buildroot.net/results/5f1e525dcc186cc9b6440d4c5ed65043d296f664 |     
microblazeel | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/461716f8f373c472ab2cccc0645a6b710ed066f8 |     
   mipsel    | glibc-2.35-134-gb6aade18a7e... | NOK | http://autobuild.buildroot.net/results/e0ab824b73bba963d5523a5cf1299a1e88779d57 |     
 powerpc64   |     graphicsmagick-1.3.37      | NOK | http://autobuild.buildroot.net/results/89c68cabeca5538fbdd4f2ecff2f35659aa70a21 |     
    i586     |     graphicsmagick-1.3.37      | NOK | http://autobuild.buildroot.net/results/76f7fdc7767be9daf29162820bad45c42569eb11 |     
   mips64    |     graphicsmagick-1.3.37      | NOK | http://autobuild.buildroot.net/results/0d0ed04847c203913ba8c67c3fefd99a517d883b |     
    arm      |     graphicsmagick-1.3.37      | NOK | http://autobuild.buildroot.net/results/e27b5cfb6c6e7fe105642ac512e0e3e1550e12ef |     
microblazeel |     graphicsmagick-1.3.37      | NOK | http://autobuild.buildroot.net/results/1fdd093f985ca74901c58a24fcb5dfb24f10e49a |     
   sparc     |     graphicsmagick-1.3.37      | NOK | http://autobuild.buildroot.net/results/b3db747fdf0fbc2854857d536ebab2f9e1077053 |     
    arm      |     graphicsmagick-1.3.37      | NOK | http://autobuild.buildroot.net/results/46a6484894c910dde9899f1ff4f71a5d3ce3bc96 |     
powerpc64le  |         host-go-1.18.6         | NOK | http://autobuild.buildroot.net/results/eb92c89312d3c2e4493f134687bd7e1594ce3ae9 |     
powerpc64le  |         host-go-1.18.6         | NOK | http://autobuild.buildroot.net/results/dc9840f0ec1064a3eb90226501fc745fad72d95b |     
 microblaze  | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/f41f98b3f8606def8ad9ad7637e9bc77906201f5 |     
   mipsel    | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/bc50ff1ebd38fdde004b77678edf1acbfbc65dc5 |     
   s390x     | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/195176b09a5e3bfbd49a785d1ca6e075a31f7733 |     
  sparc64    |        host-rust-1.60.0        | NOK | http://autobuild.buildroot.net/results/9b9ad24dd7b4b83335942946e13da52dc03c810e |     
    arm      |        host-rust-1.60.0        | NOK | http://autobuild.buildroot.net/results/5dd9133e30edbf84af6bb373a53332cf063aa61e |     
   x86_64    |          libftdi1-1.5          | NOK | http://autobuild.buildroot.net/results/581babb580a69e15a3e9439979c61e5728ec6941 |     
   mipsel    |         libglvnd-1.3.2         | NOK | http://autobuild.buildroot.net/results/56756a48fcf041f623121ed4ce2a598fe9c7eddd | ORPH
   sparc     |       libopenssl-1.1.1q        | NOK | http://autobuild.buildroot.net/results/4455357332e8aae79732e5aa4c1749e311ff0545 |     
   s390x     |        memcached-1.6.12        | NOK | http://autobuild.buildroot.net/results/693b1ad999e88f0d4921fa7cd20fd76c6aac8913 | ORPH
microblazeel |        memcached-1.6.12        | NOK | http://autobuild.buildroot.net/results/a995f768e9f9a1f92bbb1d66654df6d307238cab | ORPH
   sparc     |         proftpd-1.3.6e         | NOK | http://autobuild.buildroot.net/results/4cb61eae6ebe2bc8e080a961e2047fd4a4a57360 |     
    sh4      |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/92c3f3c5ed9b8208612e318fa450fd4cd32aefaf |     
microblazeel |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/a5c2ecf5845db4707d054c062e8943fc395e045d |     
   nios2     | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/998055411794855c6202ab20d40391998bb31413 |     
 powerpc64   |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/2881987f913bfea5c9c8b2fbe32e61c0aea8ffd9 |     


Gitlab CI results for 2022-09-21
================================


-- 
http://autobuild.buildroot.net

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

