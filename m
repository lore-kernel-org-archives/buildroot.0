Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FC08C6FD1F
	for <buildroot@archiver.kernel.org>; Thu, 16 Mar 2023 06:52:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EAC7C60C27;
	Thu, 16 Mar 2023 06:52:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EAC7C60C27
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hO14Pe8X23wt; Thu, 16 Mar 2023 06:52:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0A6DE60E66;
	Thu, 16 Mar 2023 06:52:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0A6DE60E66
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0320F1BF841
 for <buildroot@lists.busybox.net>; Thu, 16 Mar 2023 06:52:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CC97440594
 for <buildroot@lists.busybox.net>; Thu, 16 Mar 2023 06:52:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CC97440594
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pDSYnWODi02A for <buildroot@lists.busybox.net>;
 Thu, 16 Mar 2023 06:52:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0FF9240329
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0FF9240329
 for <buildroot@buildroot.org>; Thu, 16 Mar 2023 06:52:00 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 9B79660004
 for <buildroot@buildroot.org>; Thu, 16 Mar 2023 06:51:57 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Thu, 16 Mar 2023 06:51:57 -0000
Message-Id: <20230316065203.CC97440594@smtp2.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1678949517; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=OqR8MgZZpCFjw2C6tTLztAangCsXRKUYhkZCpvDETO4=;
 b=SEgALJgMhNy7DGOCacnXgiQ1K2zLSRRp6qG1W7KjqEp75zB5EXiF2KJE3XN40GjV1kOa9C
 N/w+0HS4ZOh4DesG0mKyruRN97jaXWwxlCds8ddMEB0Ql4BCR5ovnrPEfOBJ3eYWhQTwOH
 tubOGxr6PrVRYaiWIHNAJ3MahJ96hIOOXEQpEAXtF9k9FrP8zzEeSlcHP7fLMsz94r98Jh
 hDzzCQty/5l5N+MFUdeDTl+64Zjr+AvpZQ1wgHx19bapqmEA0XzIR4lR5okrXC6eYOMLUv
 hUDFmmQBzF8Zsb09YrJ9gft8gbeywyYAIosijeYqtBpac/4ZAlP2hwQ7uUNChw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=SEgALJgM
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-03-15
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

Autobuild statistics for 2023-03-15
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.11.x  | 11  | 10  |  0  | 21  |
    master   | 213 | 187 |  5  | 405 |

Classification of failures by reason for master
-----------------------------------------------

             bluez5_utils-5.66 | 28
                       unknown | 12
  gobject-introspection-1.72.0 | 11
                host-go-1.19.7 | 7 
         gobject-introspection | 5 
                elfutils-0.186 | 4 
            host-binutils-2.38 | 4 
                  linux-6.1.14 | 4 
                  xvisor-0.3.1 | 4 
glibc-2.36-81-g4f4d7a13edfd... | 3 
                    olsr-0.9.8 | 3 
                     file-5.43 | 2 
fs/ubifs/ubifs.mk:49: /home... | 2 
            host-binutils-2.37 | 2 
               host-runc-1.1.4 | 2 
              host-rust-1.67.1 | 2 
               libcap-ng-0.8.3 | 2 
              libgcrypt-1.10.1 | 2 
               libglib2-2.72.3 | 2 
                libglvnd-1.4.0 | 2 
     linux-5.10.162-cip24-rt10 | 2 
        ltp-testsuite-20220930 | 2 
          lttng-modules-2.13.7 | 2 
                   perl-5.36.0 | 2 
           python-pyicu-2.10.2 | 2 
                    sdl-1.2.15 | 2 
              traceroute-2.1.0 | 2 
ulog-0389d243352255f6182326... | 2 
                 wolfssl-5.5.3 | 2 
                xenomai-3.0.10 | 2 
android-tools-4.2.2+git2013... | 1 
                    bat-0.19.0 | 1 
                  bind-9.16.38 | 1 
                  boost-1.80.0 | 1 
                  botan-2.19.3 | 1 
                    brltty-6.5 | 1 
                busybox-1.36.0 | 1 
                  cairo-1.16.0 | 1 
                 coreutils-9.1 | 1 
           crucible-2022.05.25 | 1 
                 dc3dd-7.2.641 | 1 
              dropbear-2022.83 | 1 
              e2fsprogs-1.46.5 | 1 
                  faad2-2.10.1 | 1 
                 fdk-aac-2.0.2 | 1 
               fftw-quad-3.3.8 | 1 
                    flac-1.4.2 | 1 
             fontconfig-2.13.1 | 1 
       freeradius-client-1.1.7 | 1 
fs/cramfs/cramfs.mk:46: /ho... | 1 
fs/cramfs/cramfs.mk:46: /tm... | 1 
fs/romfs/romfs.mk:32: /tmp/... | 1 
fs/ubi/ubi.mk:51: /home/aut... | 1 
fs/ubi/ubi.mk:51: /home/aut... | 1 
fs/ubi/ubi.mk:51: /tmp/inst... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /tmp/... | 1 
fs/ubifs/ubifs.mk:49: /tmp/... | 1 
                     gmp-6.2.1 | 1 
                gnu-efi-3.0.15 | 1 
                 haproxy-2.6.9 | 1 
            host-binutils-2.39 | 1 
host-gdb-arc-2020.09-releas... | 1 
               host-zstd-1.5.4 | 1 
              leptonica-1.82.0 | 1 
               libdeflate-1.15 | 1 
                 libpqxx-6.4.5 | 1 
               libvorbis-1.3.7 | 1 
           libwebsockets-4.3.2 | 1 
               lighttpd-1.4.69 | 1 
          linux-5.10.162-cip24 | 1 
            luaossl-20220711-0 | 1 
                   luvi-2.13.0 | 1 
               madplay-0.15.2b | 1 
              memcached-1.6.17 | 1 
                    musl-1.2.3 | 1 
package/rtl8821cu/rtl8821cu... | 1 
                      poke-3.0 | 1 
                     pv-1.6.20 | 1 
    python-cryptography-39.0.1 | 1 
                 qt6base-6.4.2 | 1 
            quickjs-2021-03-27 | 1 
                  reaver-1.6.6 | 1 
                   sdl2-2.26.3 | 1 
                   trinity-1.9 | 1 
                 uclibc-1.0.42 | 1 
               valgrind-3.19.0 | 1 
                    volk-2.5.2 | 1 
                wtfutil-0.41.0 | 1 
x264-baee400fa9ced6f5481a72... | 1 
                  zabbix-6.2.7 | 1 
                    zeek-4.1.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/e17dce5bdb9a22573a548c071d3ab77b4658ab0c |     
    mips     |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/f4bdc06f3672c787702116fae093f6812a731891 |     
    sh4a     |          bind-9.16.38          | NOK | http://autobuild.buildroot.net/results/f8430b353c3c0e56655feaf086c60a4c3749351f | ORPH
  aarch64    |       bluez5_utils-5.66        | NOK | http://autobuild.buildroot.net/results/89f24306dd09dad9f2aa619c941c5d9284ad12f9 |     
   s390x     |       bluez5_utils-5.66        | NOK | http://autobuild.buildroot.net/results/31b976ae66f349f2492b04ea60f02aca5fea3cfd |     
 powerpc64   |       bluez5_utils-5.66        | NOK | http://autobuild.buildroot.net/results/3fa50c084ac671fbe2c2baac2da8a06de9421c6d |     
   nios2     |       bluez5_utils-5.66        | NOK | http://autobuild.buildroot.net/results/276b9d1182b911c6b41c8d6d5d6a74a0cb5283d1 |     
  aarch64    |       bluez5_utils-5.66        | NOK | http://autobuild.buildroot.net/results/240e4452ce5d36423175d548badb94019fbe7c7f |     
 powerpc64   |       bluez5_utils-5.66        | NOK | http://autobuild.buildroot.net/results/1a9ef323c0e2d817ac688d44d1904d62d1d337ff |     
   x86_64    |       bluez5_utils-5.66        | NOK | http://autobuild.buildroot.net/results/9003611a767beda4c050e4a94ef6c59e8bb23e71 |     
    mips     |       bluez5_utils-5.66        | NOK | http://autobuild.buildroot.net/results/1df8e843a7b0744948eacef77198e9bf656bfc45 |     
   nios2     |       bluez5_utils-5.66        | NOK | http://autobuild.buildroot.net/results/9bdf8fd2ac3492bef7d418ba9c541cee677984b8 |     
   s390x     |       bluez5_utils-5.66        | NOK | http://autobuild.buildroot.net/results/de7509a5e2fae495ed98f345f6ecbe845d406f8b |     
 aarch64_be  |       bluez5_utils-5.66        | NOK | http://autobuild.buildroot.net/results/dc1fa54ef29dcf93debfdc6b6628a9ec1dc6b474 |     
powerpc64le  |       bluez5_utils-5.66        | NOK | http://autobuild.buildroot.net/results/14b8eda52aa628f2f2cb3c3877ef587b994bf0c3 |     
 microblaze  |       bluez5_utils-5.66        | NOK | http://autobuild.buildroot.net/results/d651ac3beb830bfd3a24e58e1d3bb2ac794e6095 |     
   mips64    |       bluez5_utils-5.66        | NOK | http://autobuild.buildroot.net/results/1ec871417ec73678b904b039709c0a497f220204 |     
powerpc64le  |       bluez5_utils-5.66        | NOK | http://autobuild.buildroot.net/results/0869acc3c1e69cc79c01e3394a91be82048ba3b9 |     
   x86_64    |       bluez5_utils-5.66        | NOK | http://autobuild.buildroot.net/results/9e29f03c8259ffc7bd8453148cd7e1fed397a8f1 |     
    mips     |       bluez5_utils-5.66        | NOK | http://autobuild.buildroot.net/results/d0dd8ae5d36e4b18b62583f7cc00bdd0c83b75fe |     
   x86_64    |       bluez5_utils-5.66        | NOK | http://autobuild.buildroot.net/results/774f4eaf4001ed8eff94cb59126cfaa4857b1e58 |     
 microblaze  |       bluez5_utils-5.66        | NOK | http://autobuild.buildroot.net/results/3b196b0ed200fcaf460098facfdf3e4fff808ce1 |     
 powerpc64   |       bluez5_utils-5.66        | NOK | http://autobuild.buildroot.net/results/6213ebcbbaf787503737199ff85f9fd069fd86f1 |     
  sparc64    |       bluez5_utils-5.66        | NOK | http://autobuild.buildroot.net/results/a1591c1b1d585733f5298458f3a31000e022936a |     
powerpc64le  |       bluez5_utils-5.66        | NOK | http://autobuild.buildroot.net/results/6ee910ff2eb8ff84e405012169a122f29f5843c3 |     
powerpc64le  |       bluez5_utils-5.66        | NOK | http://autobuild.buildroot.net/results/b0b05de28bc36241019678878582c72c2ed2e2ca |     
  aarch64    |       bluez5_utils-5.66        | NOK | http://autobuild.buildroot.net/results/d6260a5acf766657f683d85fa1bdc27b7a43551e |     
    or1k     |       bluez5_utils-5.66        | NOK | http://autobuild.buildroot.net/results/099669daf9fe504ac7e9dcf17b7d3cd592a4ccc8 |     
  mips64el   |       bluez5_utils-5.66        | NOK | http://autobuild.buildroot.net/results/642019048568f642dad1d4a37c6eda2bbae8fb4f |     
 microblaze  |       bluez5_utils-5.66        | NOK | http://autobuild.buildroot.net/results/c78f81e0d5074cbe9a028ae693d3ec4826c06854 |     
  sparc64    |       bluez5_utils-5.66        | NOK | http://autobuild.buildroot.net/results/a571e783fb008d3cad2c1cd50e2b856bd9d57368 |     
    arc      |          boost-1.80.0          | NOK | http://autobuild.buildroot.net/results/f8e9e0150dd0542d2454f3586c362b67f506586d |     
    arm      |          botan-2.19.3          | NOK | http://autobuild.buildroot.net/results/78349b23a7a0068b88a6eb67c4a083a1d37d1205 | ORPH
  powerpc    |           brltty-6.5           | NOK | http://autobuild.buildroot.net/results/67b3fc4a71211bb53f08c3234b4d07fb46a38503 |     
    mips     |         busybox-1.36.0         | NOK | http://autobuild.buildroot.net/results/0c3aa62d68ab1e8532c8670cde2488f912e17b4d | ORPH
  powerpc    |          cairo-1.16.0          | NOK | http://autobuild.buildroot.net/results/9b5de6f27bc141c26ed9ce6d26ef393074750b34 |     
   sh4aeb    |         coreutils-9.1          | NOK | http://autobuild.buildroot.net/results/ab9e0fb2bc987960939862443821754e71c1103b | ORPH
  aarch64    |      crucible-2022.05.25       | NOK | http://autobuild.buildroot.net/results/7ac7b0b8b05ad9dc1b0e736149c40bd3fb231c6a |     
    or1k     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/30e79d3aa12c543b4d42d11dc6227d909b4f89cb | ORPH
  riscv64    |        dropbear-2022.83        | NOK | http://autobuild.buildroot.net/results/1758cf4f2ef9435d4dc2e2000babce38fbb20cf2 |     
    or1k     |        e2fsprogs-1.46.5        | NOK | http://autobuild.buildroot.net/results/6ad5c93f768595ed12898a93912325548547f12b | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/bda07956e6a019a9f310457b82ff5577be3fede8 | ORPH
    arc      |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/ac46eae5e5341ad1404f942d6f9e1969efdf641c | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/11826fc0a9ef1201ff9795cca23c47cf94ec0986 | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/f079ab38cfd84ff441f991eaa74f74778a13826a | ORPH
    sh4      |          faad2-2.10.1          | NOK | http://autobuild.buildroot.net/results/32c867ebd6be76b1ae59bde3910fb095c692db21 |     
    mips     |         fdk-aac-2.0.2          | NOK | http://autobuild.buildroot.net/results/b1311c807330a56cde541c794d47e3caec2eecac |     
powerpc64le  |        fftw-quad-3.3.8         | NOK | http://autobuild.buildroot.net/results/9fd445ed7c720e9ed4792742289b99eac7a95aa4 | ORPH
  powerpc    |           file-5.43            | NOK | http://autobuild.buildroot.net/results/3e7d16d09ae2a5b28911215d35efc3975fb689f3 | ORPH
    mips     |           file-5.43            | NOK | http://autobuild.buildroot.net/results/d5f19044e9e41b1594444008308833cabe5206d1 | ORPH
    sh4a     |           flac-1.4.2           | NOK | http://autobuild.buildroot.net/results/db83c16a37415ec8398cc2eac887c05a3f3ce2ac |     
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/68894aee78047b9adc29227a2592070dd7284135 | ORPH
  riscv64    |    freeradius-client-1.1.7     | NOK | http://autobuild.buildroot.net/results/945585065fcf769093e95a85e755c0a4e88da4bc |     
  aarch64    | fs/cramfs/cramfs.mk:46: /ho... | NOK | http://autobuild.buildroot.net/results/e68fb6d9c2459b30530884e12d4b974cb44d3bdf |     
powerpc64le  | fs/cramfs/cramfs.mk:46: /tm... | NOK | http://autobuild.buildroot.net/results/cfc11d0ee5cec6f6480b52528cb71646fb9c6f99 |     
powerpc64le  | fs/romfs/romfs.mk:32: /tmp/... | NOK | http://autobuild.buildroot.net/results/d0431b47e5ad06b68b13f0449396a1ee0e819d75 |     
    or1k     | fs/ubi/ubi.mk:51: /home/aut... | NOK | http://autobuild.buildroot.net/results/dfa7370de94df9e9fc7860f9d5b64708372be0a4 |     
   x86_64    | fs/ubi/ubi.mk:51: /home/aut... | NOK | http://autobuild.buildroot.net/results/b7246301f8f0122389b8e6126c8661388152836e |     
   armeb     | fs/ubi/ubi.mk:51: /tmp/inst... | NOK | http://autobuild.buildroot.net/results/fd91cb2018906e5a01953525d2cdbbba3cd0a0f3 |     
   sparc     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/16bbb5ee30d7798d79820d621fdc05acde7d3f03 |     
   armeb     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/fa448e1eeefe43856b9069adadd90fe91166c426 |     
    sh4      | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/6a1a099f769820d26198659ed14425d13b60d7e7 |     
 microblaze  | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/105b562dc42ce9cbcdbb8e00dd1ffe1bfd8496e3 |     
    sh4      | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/f4f8ac0d0d91c4e481e0404b109f527346681158 |     
   mipsel    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/71a5413a88ba66ee2233132043a2fc65c357a010 |     
  powerpc    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/c46ccdac016b008173ae824a332aaed5a6b1bb21 |     
  powerpc    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/8286213199c69d72b00116ea1288ef887891140d |     
  sparc64    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/5d64e41cbdcbd7e39c101089f602b61ecd756c1a |     
   x86_64    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/85ff14bfce7c817571cbcda0dc680451fc721948 |     
    i686     | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/46a57390bb3ebdfb730639f9b0ba6002072a1046 |     
    mips     | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/2d796291e1caaae0897d98765d7d4c03b6cc3944 |     
  powerpc    | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/df13f52d0124c01053360151fa78fb46b14d5f21 |     
    arc      | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/4376261dea95fdbee5a0a120b333c56edf138ae5 |     
  powerpc    | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/da15b13a206f7a259b44bbd6eb73116127ce094c |     
  riscv64    |           gmp-6.2.1            | NOK | http://autobuild.buildroot.net/results/b2bfd9ef149b97997ec4d9a9fd4fe122c4d70c2d | ORPH
  mips64el   |         gnu-efi-3.0.15         | NOK | http://autobuild.buildroot.net/results/99f4fa31482cb5d0d4fdec92ec2254a745e7dd6f |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/8e9835d0fc533ddf2a2a2252be95aa66b8869ec6 |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/f79519cf6b92c2d0bbc53c5864b08eb720236e14 |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/88b673cacd87efa08bb0ee9cd238a4acb9b2a25e |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/a8271bf46e58e6c0639d63737faa2234589ae9c2 |     
   armeb     |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/9057ec1aaa5fe9bee6ec82df5db04e9a35353a1f |     
   s390x     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/a1a374dc9d7151daf9cbbc4f777cbe52cef1d0e4 | ORPH
   s390x     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/049bfdc15a12049f4c56fb25aee808947b6fd8d4 | ORPH
 microblaze  |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/4846573f595de18b2d97076a0ff5997ac6c2d828 | ORPH
    or1k     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/75649793f0d97a7d6edbd52e260120a42ff6a4da | ORPH
    or1k     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/d1233d3c39f911b4af082dfcce08b57e6a90b089 | ORPH
 microblaze  |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/f8aec29b25ec8c80cae02272bf7b44f65a029d1b | ORPH
   x86_64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/3171ee098dd8b1d00a6a7f9e8a364a2e4a5f76ed | ORPH
    i686     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/e9f090caf7de4eba65baab736eaced49c9f8078a | ORPH
   s390x     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/db651711f2e42752131455049f7d5470e50966d0 | ORPH
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/d7785172546f95bd99b13cf8cfa7134b4966d85d | ORPH
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/268eb4b2d63e13034d447b6ca0f99a256b70d56a | ORPH
 aarch64_be  |         haproxy-2.6.9          | NOK | http://autobuild.buildroot.net/results/5eb9f3bc61ef0b987dbb016293886531468379f8 |     
  aarch64    |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/ac3fe0cd468eabecfbeaf1e062d8d56c70ddd995 |     
   armeb     |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/5f3e42e65ce69bdbcdcfb5c10d81d6f41efad5f4 |     
    mips     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/772598952d26cd29beaa579cc804713f8cb61cba |     
    arc      |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/cf37f712c0b5dcc4f7e1388ac1300da1faa9481d |     
 microblaze  |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/d9a943fcaed025e182333aa0ee1a27fabe3dd4d2 |     
   sparc     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/c9c760ddf6209f5f1023f62dc1698bd1f2544387 |     
 powerpc64   |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/8b70ab0f0a6cc5cee7f22f052af0b577dcd3cda4 |     
    arc      | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/89c9a40e8e752611bdf0d6786f3378757c6ce97b | ORPH
    i586     |         host-go-1.19.7         | NOK | http://autobuild.buildroot.net/results/a2a27d12c1bb265d9954fbd4104ca4dd2dbec5d2 |     
  mips64el   |         host-go-1.19.7         | NOK | http://autobuild.buildroot.net/results/ac43157c80ac02ce6daeb35ff7dcec9ed58be5e7 |     
    i586     |         host-go-1.19.7         | NOK | http://autobuild.buildroot.net/results/f848605d7c500a21eeed5e3e1b1f31482ddcb205 |     
  mips64el   |         host-go-1.19.7         | NOK | http://autobuild.buildroot.net/results/9bf6980c2c54dca1fc4f93e026859ad51b0a743d |     
   mips64    |         host-go-1.19.7         | NOK | http://autobuild.buildroot.net/results/2963254eedd69e7c9340aa7023128dd2b0bca676 |     
  mips64el   |         host-go-1.19.7         | NOK | http://autobuild.buildroot.net/results/b3ad26ae25ea1f49e0b105c48d839d4fb32acec6 |     
powerpc64le  |         host-go-1.19.7         | NOK | http://autobuild.buildroot.net/results/8947f801a79c0ba040026a93844496189e32a3b9 |     
    arc      |        host-runc-1.1.4         | NOK | http://autobuild.buildroot.net/results/89c4097f12fa55f5a9eb603a4f812d8294b26c1c |     
microblazeel |        host-runc-1.1.4         | NOK | http://autobuild.buildroot.net/results/3bb9b7ffe9f5ed6aef8362ab8d019e2940fa921f |     
   x86_64    |        host-rust-1.67.1        | NOK | http://autobuild.buildroot.net/results/d895a4a50d336ae2e16cb78aae9165ec3b41cb35 |     
   s390x     |        host-rust-1.67.1        | NOK | http://autobuild.buildroot.net/results/349eecdab0be1346a5eb96e33076af8cbff359c7 |     
  mips64el   |        host-zstd-1.5.4         | NOK | http://autobuild.buildroot.net/results/25ae8ed8d67614201368f4638ae602e19c22f3fa |     
   sh4aeb    |        leptonica-1.82.0        | NOK | http://autobuild.buildroot.net/results/264bd891dd0a8ea00700794b73221651bcccaec6 |     
  riscv64    |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/9054fc97505ca362673ff2eac4344f3f69b69b36 |     
  riscv64    |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/55ccb870e6169b892daacd4c8fe27960a505361a |     
    arm      |        libdeflate-1.15         | NOK | http://autobuild.buildroot.net/results/c9c2b4d3c085f261cd331920879f3fa3f2e8250e |     
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/015865f91e900fea794a249f8dd96683269fb2f0 | ORPH
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/981c124cc91f02dc78786806327412e80d9f3b2e | ORPH
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/31ed57ec8409d44a72d58dd95bc9802a9427a2c2 |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/9bfe486b5df8df10ce6a6f64b442a57fa022e5c3 |     
    i686     |         libglvnd-1.4.0         | NOK | http://autobuild.buildroot.net/results/469ff5cf0c5f9bbcff926e664478d9e962a5e3b3 | ORPH
 microblaze  |         libglvnd-1.4.0         | NOK | http://autobuild.buildroot.net/results/b591e5450349928fc14aa58e12de2cb298ed5a1d | ORPH
 microblaze  |         libpqxx-6.4.5          | NOK | http://autobuild.buildroot.net/results/caa1b97c198de762284be876f2d8e3ca76d93db1 |     
  powerpc    |        libvorbis-1.3.7         | NOK | http://autobuild.buildroot.net/results/93430e077a3bcc291ad37af9ed5862c995c8699d |     
   xtensa    |      libwebsockets-4.3.2       | NOK | http://autobuild.buildroot.net/results/e5e7799242ffd8693d6a31e6fe13c26f0f3bc00f |     
   arceb     |        lighttpd-1.4.69         | NOK | http://autobuild.buildroot.net/results/bb0b9ba31ab65dd50763f19d935d08a54a5efcc3 | ORPH
    mips     |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/1bafce9402a7ca7b5e75c23a19486c66a17e4e53 | ORPH
  powerpc    |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/1bbbbb143702d93d9c3f65a4bf837561d93ffbee | ORPH
   xtensa    |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/3b9ee574bbfca18152cc06baa5a468f78f4248fb | ORPH
    i586     |          linux-6.1.14          | NOK | http://autobuild.buildroot.net/results/384679ac55aaac4d3a767acc3562ccf8b8821024 | ORPH
 aarch64_be  |          linux-6.1.14          | NOK | http://autobuild.buildroot.net/results/ad358de3467234d03823c887d4bcc492d6b5aeba | ORPH
    sh4a     |          linux-6.1.14          | NOK | http://autobuild.buildroot.net/results/057f99951a8fd013d5a1fd2d2af8917034f4882c | ORPH
   nios2     |          linux-6.1.14          | NOK | http://autobuild.buildroot.net/results/ac863e2b4408b27f6f767bac523e5923ce778de2 | ORPH
    or1k     |     ltp-testsuite-20220930     | NOK | http://autobuild.buildroot.net/results/78961b1e76dd39bfff66a94aa956cb0d7933d22b |     
   x86_64    |     ltp-testsuite-20220930     | NOK | http://autobuild.buildroot.net/results/275ad842b49e1d633c9f6b95801f9374b0c1aed1 |     
   mipsel    |      lttng-modules-2.13.7      | NOK | http://autobuild.buildroot.net/results/3e51eeca09d15e5f5f372c3c96cb545ebe960f93 |     
  sparc64    |      lttng-modules-2.13.7      | NOK | http://autobuild.buildroot.net/results/29fea121b4e98ec0140648c9b5b4434a69116de6 |     
  sparc64    |       luaossl-20220711-0       | NOK | http://autobuild.buildroot.net/results/296ffcdd783da60e8481a88cc5751075e21046e3 |     
   x86_64    |          luvi-2.13.0           | NOK | http://autobuild.buildroot.net/results/f1797fc62c6c2f7151939b6e6b19852c1ac5664d | ORPH
   armeb     |        madplay-0.15.2b         | NOK | http://autobuild.buildroot.net/results/0c0955d4f6726b50cad721f4d3437dabde316e70 | ORPH
    mips     |        memcached-1.6.17        | NOK | http://autobuild.buildroot.net/results/6543f1de08d7a5f4991cd6b6e2aa7bb4e23ecab9 | ORPH
  powerpc    |           musl-1.2.3           | NOK | http://autobuild.buildroot.net/results/69b45246d56af5c17a26b1def44a76f7f49dc52c |     
    arc      |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/43f7c9207610a8b8b723a61ba840ab39e4b2e0c3 | ORPH
 powerpc64   |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/641e99c1465fb4ba4104b005f4a979992b660ff7 | ORPH
 aarch64_be  |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/9643af953b5fdcb10b3a5412c4d403179533f130 | ORPH
   sh4eb     | package/rtl8821cu/rtl8821cu... | NOK | http://autobuild.buildroot.net/results/132d3d9755d27fc9cb0b246dbc75acb8b6b3d981 |     
   arceb     |          perl-5.36.0           | NOK | http://autobuild.buildroot.net/results/e96b8e1547099965cfe67a303d19e6f66479343b |     
   arceb     |          perl-5.36.0           | NOK | http://autobuild.buildroot.net/results/7eae7c6f1a357dae06babe2d785b11df756fa1ee |     
  sparc64    |            poke-3.0            | NOK | http://autobuild.buildroot.net/results/89f2398e9db000b29b1ce7204075f0cead9a55d7 | ORPH
   armeb     |           pv-1.6.20            | NOK | http://autobuild.buildroot.net/results/7db1886e65f7b9db1fd8ac2bced10807ce3e7a5f | ORPH
   mipsel    |   python-cryptography-39.0.1   | NOK | http://autobuild.buildroot.net/results/90898ba72b1ee85831cd1a9856b911b90e91566f |     
microblazeel |      python-pyicu-2.10.2       | NOK | http://autobuild.buildroot.net/results/9e1a4de046045ec9aa46e431b45e5b255b728f04 |     
   sh4aeb    |      python-pyicu-2.10.2       | NOK | http://autobuild.buildroot.net/results/3d71deb0308e914f6ffa0620c6880c846c9c1af2 |     
   mipsel    |         qt6base-6.4.2          | NOK | http://autobuild.buildroot.net/results/fdf2b2eb252a24e81bddad1c81c4fdfb03dc0afe |     
 microblaze  |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/4d9a21cb4e0728a1ff461f2e19f96f7e676d2eba |     
    arc      |          reaver-1.6.6          | NOK | http://autobuild.buildroot.net/results/4f391ada2edd8bda6b154b3fbbb16deba6a6b8e8 |     
   sh4eb     |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/38b8e50e9458e96601d7b031a9d68c57be09d598 | ORPH
   sh4aeb    |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/e2e73a47779514321a732c378c5232068182e96f | ORPH
    arm      |          sdl2-2.26.3           | NOK | http://autobuild.buildroot.net/results/858ca737a586f99e9c65c3233cf283200c44d41f |     
 microblaze  |        traceroute-2.1.0        | NOK | http://autobuild.buildroot.net/results/994eaa8939a1ce6864960e5998789fe49e7f3e2e |     
  aarch64    |        traceroute-2.1.0        | NOK | http://autobuild.buildroot.net/results/225c2333b8f642b8fd965a93616401b954fc6678 |     
   x86_64    |          trinity-1.9           | NOK | http://autobuild.buildroot.net/results/02ae2cc925081faafd62db0c8ba09fb0b41477db | ORPH
  powerpc    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/04ae3e21fea9f16c1b87d79a70eec14abbfac5cf |     
  mips64el   | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/48c3c17f8580d5e7493ef3a30dc22c8c83ae1081 |     
powerpc64le  | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/ba33b60a3f6abc9bd0e249ff877421344340c301 |     
    mips     |            unknown             | NOK | http://autobuild.buildroot.net/results/277762fedc1b5a2df97ac30aa16a354cfe69de14 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/aefceb0abbb37157623f6206494b3a8e76e4fb72 |     
    i686     |            unknown             | NOK | http://autobuild.buildroot.net/results/e8273c4768e2ad4b50593c21f8538e1eb1d60922 |     
   sparc     |            unknown             | NOK | http://autobuild.buildroot.net/results/833ded23ce10e1dd90f83d672fef3dfb67ec9ada |     
 aarch64_be  |            unknown             | NOK | http://autobuild.buildroot.net/results/1735119737a9404e1762bcf5a9f0c57b31a8f66b |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/a1d58c2d40193304a1ffd43ede8bd487fa3c2b66 |     
powerpc64le  |            unknown             | NOK | http://autobuild.buildroot.net/results/acc9ebf5a1c26b958c18c493d4741cb2de56ddb2 |     
  riscv32    |            unknown             | NOK | http://autobuild.buildroot.net/results/6ccf16577a4c837867aecd70ff63918f853f31a2 |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.net/results/487827dde291500f9f1d7fccce02b5c97c5622e5 |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/b044daa9d871682b875b38d535397da7e24711ce |     
   mips64    |            unknown             | NOK | http://autobuild.buildroot.net/results/6453c92651e6ad6d89e833f73f56f2ec0a4a86c2 |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/8c5dab1965de83d1a3ffa6768cc5a7519645ee8b |     
   mipsel    |        valgrind-3.19.0         | NOK | http://autobuild.buildroot.net/results/d22bbd48b8ab136c8be3ba70e660178810633c91 | ORPH
  powerpc    |           volk-2.5.2           | NOK | http://autobuild.buildroot.net/results/4c8fac716c234f0d100cad2d41a9b31bf445884e |     
   mipsel    |         wolfssl-5.5.3          | NOK | http://autobuild.buildroot.net/results/d9f9e3010d7659b0f10d1e31c01b87e16f02a454 |     
   armeb     |         wolfssl-5.5.3          | NOK | http://autobuild.buildroot.net/results/d045d397b026c0f1a9171db951b264f74935585d |     
   x86_64    |         wtfutil-0.41.0         | NOK | http://autobuild.buildroot.net/results/dfef2ca94ac97bda8e3a6cb4939e96b81b88abaa |     
    i686     | x264-baee400fa9ced6f5481a72... | NOK | http://autobuild.buildroot.net/results/1fde65940f7fdc2508684fc3ed79ef2f329dd384 |     
  sparc64    |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/4016fe7244be224b10496bd407f038e91dd14b48 |     
  powerpc    |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/87e8508a2472526623c4f801ad691ace22e1beae |     
   x86_64    |          xvisor-0.3.1          | NOK | http://autobuild.buildroot.net/results/0cd425db8bc45bcfeceb744a420a916feaf43a84 |     
  aarch64    |          xvisor-0.3.1          | NOK | http://autobuild.buildroot.net/results/6709a6b2dd1d72a137ef82faad1763c41f89df63 |     
   x86_64    |          xvisor-0.3.1          | NOK | http://autobuild.buildroot.net/results/b3c6fe10e05d2507df14acb7fab901da5faace70 |     
  aarch64    |          xvisor-0.3.1          | NOK | http://autobuild.buildroot.net/results/17717ebea47b8adc3beb95f1de8b5e58c8122c54 |     
    mips     |          zabbix-6.2.7          | NOK | http://autobuild.buildroot.net/results/2d0130333fc52ae09f5d2f38710de53bc159e7c9 |     
powerpc64le  |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/0cd6d569fc5ff2e8aeb974af35512c4901231f37 |     


Classification of failures by reason for 2022.11.x
--------------------------------------------------

fs/ubi/ubi.mk:51: /home/bui... | 2 
              host-rust-1.64.0 | 2 
                     efivar-38 | 1 
             fontconfig-2.13.1 | 1 
fs/axfs/axfs.mk:32: /home/b... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
              host-pahole-1.24 | 1 
                    qemu-7.1.0 | 1 


Detail of failures for 2022.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |           efivar-38            | NOK | http://autobuild.buildroot.net/results/be9c7b34d7ed3134d639c77d323e7552cacc6531 |     
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/102b26dec87a2768595cc22727650c1b8fcf4dfa | ORPH
  sparc64    | fs/axfs/axfs.mk:32: /home/b... | NOK | http://autobuild.buildroot.net/results/93f6c7c2f5de95bf415a1d61d39b9a40b5c2bf1d |     
 powerpc64   | fs/ubi/ubi.mk:51: /home/bui... | NOK | http://autobuild.buildroot.net/results/ed97d3091065f11074d46d17ee221429bd55cff9 |     
    arc      | fs/ubi/ubi.mk:51: /home/bui... | NOK | http://autobuild.buildroot.net/results/41937a9dff2c7811648315cade3490234b5654f1 |     
 powerpc64   | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/828d04e55fc3899bf733e02ee81cf07a18a0348c |     
   armeb     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/0410c778af77e9785833650d6ba6e777b2cb4884 |     
  sparc64    |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/27dade715ae30d10a42d2fd562942f919c3537df |     
   mipsel    |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/791d53eb297352a80f1ff00cbd2114031e585529 |     
   mipsel    |           qemu-7.1.0           | NOK | http://autobuild.buildroot.net/results/b819e32fb4f6b63a06eb06762b44d9e68131cdb6 |     


Gitlab CI results for 2023-03-15
================================


-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
