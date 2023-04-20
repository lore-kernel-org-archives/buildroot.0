Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB284C77B72
	for <buildroot@archiver.kernel.org>; Thu, 20 Apr 2023 05:36:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1E38F42026;
	Thu, 20 Apr 2023 05:36:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1E38F42026
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pSDG0mfUdEPU; Thu, 20 Apr 2023 05:36:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2DEBD42048;
	Thu, 20 Apr 2023 05:36:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2DEBD42048
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CE8DD1BF2CD
 for <buildroot@lists.busybox.net>; Thu, 20 Apr 2023 05:36:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A3BB842048
 for <buildroot@lists.busybox.net>; Thu, 20 Apr 2023 05:36:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A3BB842048
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BnUcEIcVydz5 for <buildroot@lists.busybox.net>;
 Thu, 20 Apr 2023 05:36:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1A6B142026
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1A6B142026
 for <buildroot@buildroot.org>; Thu, 20 Apr 2023 05:36:13 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 4C1811BF206
 for <buildroot@buildroot.org>; Thu, 20 Apr 2023 05:36:11 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Thu, 20 Apr 2023 05:36:11 -0000
Message-Id: <20230420053618.A3BB842048@smtp4.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1681968971; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=pMvKoJZ2641y7scBbE1Wq8tKUeQXhSP0E4WCxzHrlaM=;
 b=Q5dBYBWmwpW2gNyXe4sSXGipAodDsaranUDN67ZPQ2QF4DE77QtQcclxho9rTpCI+zxZIz
 2ql44etcNw0s7A+2zcxUrUGTXGg8J+bCpilkQjOo5D46DFxY+/f+me3uMx++hd+LR8zNFI
 PjCbQdnfV2fTh9kzhZqCaH8RrFud/SMOjqdhl8x3uPGC+ZmSSGXzL9w4ogtTgUUFuCH4lx
 TKtmvA4nl3zb27EoN/bWt2oDberEklWg3PSu0se1/nXDIV5MDdX3AN8j7GnQKiv+f3eFFB
 pRSwPVWzpP4vlm9B/+JI4yoCZdGlkfPkZboiBnLvXZHlqWj8NOyQc7lP5rZQuQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Q5dBYBWm
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-04-19
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

Autobuild statistics for 2023-04-19
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  | 14  | 21  |  0  | 35  |
    master   | 162 | 150 |  2  | 314 |

Classification of failures by reason for master
-----------------------------------------------

                elfutils-0.186 | 9 
  gobject-introspection-1.72.0 | 9 
                host-go-1.19.8 | 7 
               host-qemu-7.2.0 | 6 
         host-gcc-final-11.3.0 | 5 
glibc-2.37-2-g9f8513dc64119... | 4 
                 uclibc-1.0.43 | 4 
                xenomai-3.0.10 | 4 
                 agentpp-4.6.0 | 3 
            host-binutils-2.37 | 3 
host-sunxi-tools-1.4.2-168-... | 3 
              libgcrypt-1.10.1 | 3 
               libglib2-2.72.3 | 3 
                  linux-6.1.14 | 3 
        ltp-testsuite-20230127 | 3 
                 coreutils-9.2 | 2 
        edk2-edk2-stable202208 | 2 
fs/cramfs/cramfs.mk:46: /ho... | 2 
         gobject-introspection | 2 
            host-binutils-2.38 | 2 
         host-gcc-final-10.4.0 | 2 
              host-rust-1.68.2 | 2 
                  jack2-1.9.21 | 2 
                  kexec-2.0.26 | 2 
     linux-5.10.162-cip24-rt10 | 2 
                    olsr-0.9.8 | 2 
               openblas-0.3.21 | 2 
                   perl-5.36.0 | 2 
                       unknown | 2 
               valgrind-3.19.0 | 2 
               acpica-20220331 | 1 
               apcupsd-3.14.14 | 1 
                    bat-0.19.0 | 1 
  binutils-arc-2020.09-release | 1 
                    brltty-6.5 | 1 
                  cmocka-1.1.5 | 1 
               ding-libs-0.6.2 | 1 
              erlang-22.3.4.22 | 1 
                 fdk-aac-2.0.2 | 1 
             fontconfig-2.13.1 | 1 
fs/btrfs/btrfs.mk:55: /home... | 1 
fs/cramfs/cramfs.mk:46: /ho... | 1 
fs/cramfs/cramfs.mk:46: /ho... | 1 
fs/cramfs/cramfs.mk:46: /ho... | 1 
fs/romfs/romfs.mk:32: /home... | 1 
fs/romfs/romfs.mk:32: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
                 fwts-22.09.00 | 1 
gcnano-binaries-0ac1a89d7a5... | 1 
            host-binutils-2.39 | 1 
             host-delve-1.20.0 | 1 
     host-moby-buildkit-0.11.2 | 1 
               host-runc-1.1.5 | 1 
               ipmitool-1_8_19 | 1 
               libcap-ng-0.8.3 | 1 
         libcpprestsdk-2.10.18 | 1 
              liquid-dsp-1.4.0 | 1 
          lttng-modules-2.13.7 | 1 
                   luvi-2.13.0 | 1 
                nodejs-16.18.1 | 1 
                  ntp-4.2.8p15 | 1 
package/rtl8821cu/rtl8821cu... | 1 
            quickjs-2021-03-27 | 1 
              rsyslog-8.2204.1 | 1 
                    sdl-1.2.15 | 1 
                  spice-0.15.0 | 1 
uclibc-ng-test-6790eafe897b... | 1 
                 wolfssl-5.5.3 | 1 
                     znc-1.8.2 | 1 
               zxing-cpp-1.4.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |        acpica-20220331         | NOK | http://autobuild.buildroot.net/results/6f15260de519dadda1ab579a2622d718860f2506 |     
  mips64el   |         agentpp-4.6.0          | NOK | http://autobuild.buildroot.net/results/a6e38c0ab873d4b12e2270132353b62481660544 |     
   mips64    |         agentpp-4.6.0          | NOK | http://autobuild.buildroot.net/results/ee231502aaefffde62694fd5d7058f7da4cb688e |     
   mipsel    |         agentpp-4.6.0          | NOK | http://autobuild.buildroot.net/results/cab41389b016fb561354d3d27b95aafd704018b6 |     
    arc      |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/8bba4c2023a00639f60cf7210b9f613d81e22aaa |     
    mips     |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/96cc9ee2d98f0e5cf235bc08e0464178bf07490e |     
   arceb     |  binutils-arc-2020.09-release  | NOK | http://autobuild.buildroot.net/results/fde54ba625b17da30579b68a353444d1bab4ff0e |     
  powerpc    |           brltty-6.5           | NOK | http://autobuild.buildroot.net/results/093a37a3f3bf125f8bc51aa082a17632d7155cfc |     
   armeb     |          cmocka-1.1.5          | NOK | http://autobuild.buildroot.net/results/87fc7ece383fe70a914d1bc1f2ff512ba117e984 |     
    sh4      |         coreutils-9.2          | NOK | http://autobuild.buildroot.net/results/d6f88cc21f740520c24570884d6ff80472a412d5 | ORPH
    sh4      |         coreutils-9.2          | NOK | http://autobuild.buildroot.net/results/afbc3ea7130613858ae2eec8ab3dd540f43ccb5b | ORPH
    arc      |        ding-libs-0.6.2         | NOK | http://autobuild.buildroot.net/results/ab239e93d165f48970eef6cf6d1eaac58e447048 |     
   x86_64    |     edk2-edk2-stable202208     | NOK | http://autobuild.buildroot.net/results/c43dc7c4d315f2ab835b56b1eb6dd214c0088f6c |     
  aarch64    |     edk2-edk2-stable202208     | NOK | http://autobuild.buildroot.net/results/af87b57ff9d99c991c56a7fb29addac03ee6ca3e |     
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/ee88aa4c954e27b89bd3ec43514f17ed83f4e330 | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/03f45184fae4da07aba7fb714a0552374a163b7a | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/9a35d900ae42d68474d64593b163b4744703e52f | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/a0287119cd173109bdc0ac657579207e9e73f0aa | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/8782e717656a593cf8c0ff35fce099d246faff0b | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/6c84a922d3efc5caa79bde4316ef91979f8cb1f4 | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/43ab9e9e07af6192499757152ba9d30735c0c16c | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/5fe9b8948ef470b6c7fea977c32376588dcaf1c4 | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/a886c9275513b3b3d4a8dee4ada279da79187d15 | ORPH
  aarch64    |        erlang-22.3.4.22        | NOK | http://autobuild.buildroot.net/results/a842244093a25cc3588ca9f78ab887b8524a4c9c |     
    mips     |         fdk-aac-2.0.2          | NOK | http://autobuild.buildroot.net/results/9de738b8ef773bddd7cf1cf525f5694cbcb32967 |     
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/6acdee3c81ce7ce7c11833d194594871acadb149 | ORPH
   x86_64    | fs/btrfs/btrfs.mk:55: /home... | NOK | http://autobuild.buildroot.net/results/05dccaf9ace0e09cf64a56994c1771b31a2539a4 |     
 aarch64_be  | fs/cramfs/cramfs.mk:46: /ho... | NOK | http://autobuild.buildroot.net/results/e023956478275b907c795c309e703ad906885c32 |     
  sparc64    | fs/cramfs/cramfs.mk:46: /ho... | NOK | http://autobuild.buildroot.net/results/bc54e4a1d7c1cdfad4e4c20199df08af6b8ed26b |     
    or1k     | fs/cramfs/cramfs.mk:46: /ho... | NOK | http://autobuild.buildroot.net/results/29393731aef1e6ad21e18afe027448bec22e4648 |     
   s390x     | fs/cramfs/cramfs.mk:46: /ho... | NOK | http://autobuild.buildroot.net/results/6ed6605108ec95f39a49872333c08b17919ca45b |     
    mips     | fs/cramfs/cramfs.mk:46: /ho... | NOK | http://autobuild.buildroot.net/results/6b41f5c30e3fd905762b33d8ca7ecce6a8ca2088 |     
 aarch64_be  | fs/romfs/romfs.mk:32: /home... | NOK | http://autobuild.buildroot.net/results/7e1b58c2fe7b44ecd5bfcccafe0f1b4f3d5447cd |     
  sparc64    | fs/romfs/romfs.mk:32: /home... | NOK | http://autobuild.buildroot.net/results/e20f8d9c983c34ef81a63980690cb6999b3204eb |     
  sparc64    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/0091dfab045dd3d915fca4099d13a91f19abc03d |     
   mipsel    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/991a1da25c8965f0fbbfb9b6462aa3c7ffdddd3e |     
   s390x     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/6a46bb690fc27bdfd4fcc9295951fa65ecbb9fc0 |     
   mipsel    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/f7974764648733dfbdc8eeb6a07f3be1fc9d1376 |     
 aarch64_be  | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/f4ad58cb0c17997adc074248507ff28b73abf8b1 |     
 powerpc64   | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/1ca398982481feee684a91fdfea040bf760138b3 |     
   arceb     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/f196dae966fefe4456f0dfb9909c3fb48dddf06d |     
  mips64el   | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/846d4d5e634188ebed0e87f531ae5f2a70316083 |     
   armeb     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/7c703a0e809c20624e4689ff768ef1c0dac69974 |     
    mips     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/d66540c26cc4d4e371c878b31f3c46f07b687b5c |     
 microblaze  | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/190fd9674af3e4f5b2bd24ccf030b8ae0a0d1a3d |     
   s390x     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/0ec87d10b417f8b5ae9295578eb4aaa2d425ca3c |     
   mipsel    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/71d6802d20785e669141ddd01ecfa67314eae9f0 |     
   s390x     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/3659ba1764e7086c7e2096debc6191b7aab20ed2 |     
    i686     |         fwts-22.09.00          | NOK | http://autobuild.buildroot.net/results/b341c233f3400e92ee8aa3bdb4f9a95524d47fb7 |     
    arm      | gcnano-binaries-0ac1a89d7a5... | NOK | http://autobuild.buildroot.net/results/f0861c49cb9b7f3f9ce60e2a20891a32f78db1f3 |     
  powerpc    | glibc-2.37-2-g9f8513dc64119... | NOK | http://autobuild.buildroot.net/results/68a497b407c9e5065c11ad9b6b4d415fe63f06c5 |     
  powerpc    | glibc-2.37-2-g9f8513dc64119... | NOK | http://autobuild.buildroot.net/results/348a1d7fda1420940ae8354baa574fe4c91afdea |     
 powerpc64   | glibc-2.37-2-g9f8513dc64119... | NOK | http://autobuild.buildroot.net/results/e58f8537ac560ff65bfa054723551556afc353fa |     
  powerpc    | glibc-2.37-2-g9f8513dc64119... | NOK | http://autobuild.buildroot.net/results/248190709ee508e5e4512ae7cfa0d1fe91c6af6c |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/ad87fd29fe799f7083586c6e04c4ed27720fff94 |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/62d17c6e88d667270f5e904b3a41c8ef2c20044a |     
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/fc93538d92369a2eb52db06a86e8197f90c44407 | ORPH
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/faabe69741b7e96d14d9b48a12a022ed4fc5cf71 | ORPH
   s390x     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/b54fc2a703b2f0b0692545801e2bab8c9273b417 | ORPH
powerpc64le  |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/0ed3e1d610b4826fb33d66e09e35e6e887bd3153 | ORPH
    or1k     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/8b78f2c353b3d857af8addda9eb8560ed0efe284 | ORPH
    or1k     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/ceaac2e4b01b366bac068e15a0f9dda1adb5b7ab | ORPH
   nios2     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/c402bbb4c9f2128e7644b979f78ae64b9bbc834d | ORPH
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/fbd38d86ac4373e3756aa98641973a6c336a06f8 | ORPH
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/20d271ce45afdd5ac89e2528a8ba1a15c94aeae4 | ORPH
    arm      |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/99bb29e159fb4e4cf8d1aed4136e96d9a9fbc80d |     
microblazeel |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/be99c7ab6784aaa3660ee3bc4eded560b12068a4 |     
   nios2     |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/0b7236b5956f460dc459a1a1a20b6c4eac9b4c4a |     
    arm      |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/c005be508edc4a46666cceac1d669ff6796910f2 |     
    arm      |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/085a090c57d5273008e928e65183ebcf04c7ba6b |     
    arc      |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/535558ba21372d41ed1f079ac6db55b27dc6e938 |     
  riscv64    |       host-delve-1.20.0        | NOK | http://autobuild.buildroot.net/results/e6a3130e174e45440136798f7d17a781e1b46400 |     
   sparc     |     host-gcc-final-10.4.0      | NOK | http://autobuild.buildroot.net/results/1c8f1aa901f74ab6350adfd0ed8e00b2c6c3bb3b |     
   sparc     |     host-gcc-final-10.4.0      | NOK | http://autobuild.buildroot.net/results/76ec2cb016c74ec727eb776102ab9565aa4fff96 |     
   armeb     |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/d3676f01b0401f2bf3eff7067e58d41d80405b67 |     
   sh4eb     |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/5a9f7e26ba02f272b9b4d146a7a7621563f5f48e |     
microblazeel |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/bcd3f45f4ef6efcead563366ea227db2e93a034e |     
   xtensa    |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/435dc2c072768ee522d82b8501cc255711cbb450 |     
    m68k     |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/1eebe5fd9d492e48d991ef009dc270a7e7f1012a |     
  mips64el   |         host-go-1.19.8         | NOK | http://autobuild.buildroot.net/results/de333e40f65d685c80f95c50a3ce7d88244d46ae |     
   s390x     |         host-go-1.19.8         | NOK | http://autobuild.buildroot.net/results/c7df791f328e277125c5139389b004a2120be821 |     
   mips64    |         host-go-1.19.8         | NOK | http://autobuild.buildroot.net/results/f827bbbf25e0e67a904022f256e26f321e4a1296 |     
   mips64    |         host-go-1.19.8         | NOK | http://autobuild.buildroot.net/results/e5c5b396c1dbae7662467da56f27ed345456d50b |     
   mips64    |         host-go-1.19.8         | NOK | http://autobuild.buildroot.net/results/71e98c1772fd23e360e5423cf7933287065608ed |     
   mips64    |         host-go-1.19.8         | NOK | http://autobuild.buildroot.net/results/b7aaeaccebc842e9620d39e280f929c99dd30be9 |     
   mips64    |         host-go-1.19.8         | NOK | http://autobuild.buildroot.net/results/adb1cb455cf6a10b52f5fb5741ffe7264a85ce08 |     
  riscv64    |   host-moby-buildkit-0.11.2    | NOK | http://autobuild.buildroot.net/results/7df1205b03fbd44f7c79413d44f0d55b2aac90c4 |     
    mips     |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/a78c9de3056e41c20cc946e791211dc22672554a |     
powerpc64le  |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/fe8ddd99072a94f379858d6af6c1b484f9268d0a |     
   s390x     |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/11ae72410105b64750edf744dff2ac4b10ef66f2 |     
 powerpc64   |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/bc6e76c682dc74ab9523408d95da413dc32797b9 |     
  powerpc    |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/2210d4b0cf739875d1ab600df8770f240174d5bf |     
   nios2     |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/828d9cb811da751e5947dfd7da48ae478dec5849 |     
  riscv64    |        host-runc-1.1.5         | NOK | http://autobuild.buildroot.net/results/b135ade31e337421483a07cdf7957c249b4bb198 |     
  aarch64    |        host-rust-1.68.2        | NOK | http://autobuild.buildroot.net/results/234a2a9be148f01bd6bf65bc095dad738452c63d |     
    i686     |        host-rust-1.68.2        | NOK | http://autobuild.buildroot.net/results/997d42055f401f30eeed0483b9aa3c4fc633d0f6 |     
    arm      | host-sunxi-tools-1.4.2-168-... | NOK | http://autobuild.buildroot.net/results/054b716229f7467668d4c76eafac17af03a23364 |     
    arm      | host-sunxi-tools-1.4.2-168-... | NOK | http://autobuild.buildroot.net/results/c662e00ad34ce02fe4d0dd5a306f9f5ce85cf163 |     
    arm      | host-sunxi-tools-1.4.2-168-... | NOK | http://autobuild.buildroot.net/results/b4ab0260f42a2c0b6814397c69b379f6027484b0 |     
    or1k     |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.net/results/8c170c1cb40797ad73096c7bd215c5cc2f112603 |     
    m68k     |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/22a0477363e0a94e82362aeb82c22ba3a5f81f1a |     
    or1k     |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/478a3cedf3d71cf02b11f49d58b189506a7084c4 |     
   armeb     |          kexec-2.0.26          | NOK | http://autobuild.buildroot.net/results/e557ccb4a255a1a6460977b00c268366ba3e21dc |     
   armeb     |          kexec-2.0.26          | NOK | http://autobuild.buildroot.net/results/7adf026785b7f510b8ea61af0e7cdc2d398d6922 |     
  riscv64    |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/3050627738a5af136aac66f4bde1ff447c427d4c |     
    arc      |     libcpprestsdk-2.10.18      | NOK | http://autobuild.buildroot.net/results/2f757f331a881239c238fa5fc442cbe58f3173c9 | ORPH
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/ea5a1cc42ee7a0629396818807acfc9c7e2c8db6 | ORPH
    i586     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/00229d9b3dab7e46c720fdc724e5fef410564d81 | ORPH
    i586     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/d7006a61e64858d4084e647dd2361def9b75ed92 | ORPH
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/1da756e76b4bb231121b10648bc14adbd8c7f02e |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/b78f69094847bec5f997260736783021b1287c1d |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/cf02190691ee3ac7e63893ef5660f70b63869494 |     
powerpc64le  |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/e37d54ab75518b8833257eaa9ae88e9c7093c6e7 | ORPH
   x86_64    |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/cfe26a136b4ddff75fc9c1dbb5ebead78a013c09 | ORPH
   arceb     |          linux-6.1.14          | NOK | http://autobuild.buildroot.net/results/b07feaffcf7bf3edc0dc8c975273ed827d793ec3 | ORPH
microblazeel |          linux-6.1.14          | NOK | http://autobuild.buildroot.net/results/2aae07a3a76aa5a6bc24a7a2d94dc852b68d1707 | ORPH
    sh4a     |          linux-6.1.14          | NOK | http://autobuild.buildroot.net/results/56470889f829b6279b494d7640a71d3c64a53dcb | ORPH
    arm      |        liquid-dsp-1.4.0        | NOK | http://autobuild.buildroot.net/results/6cf8f221937c19f25a5e4ecf28a9de76db0b2d78 |     
  powerpc    |     ltp-testsuite-20230127     | NOK | http://autobuild.buildroot.net/results/e805c3f769418970b0bdc68345821d6738930257 |     
 aarch64_be  |     ltp-testsuite-20230127     | NOK | http://autobuild.buildroot.net/results/e6248253a6ae593d3ec5b6706d94f4e160e6791a |     
   x86_64    |     ltp-testsuite-20230127     | NOK | http://autobuild.buildroot.net/results/311d4b9616afa390f609dfd1f252ddbce9ef285c |     
   sparc     |      lttng-modules-2.13.7      | NOK | http://autobuild.buildroot.net/results/20e4fbac4e1ae84bec83c9511a5b5350eee9507e |     
 aarch64_be  |          luvi-2.13.0           | NOK | http://autobuild.buildroot.net/results/f37f42d6dab77b3ffcc3e0ff9c1840449c1ae65a | ORPH
   x86_64    |         nodejs-16.18.1         | NOK | http://autobuild.buildroot.net/results/b4e559fb2dc9641cf7fe592893d290858f4151ec |     
  riscv64    |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/94eedec5d2fe9e19f764952a8b08960baa6cede0 | ORPH
    mips     |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/b4fcc2575c4dfb3c63fd974d51e3a24dfddabc63 | ORPH
 aarch64_be  |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/b4e157a3ded36f1d6e8a89464638bf8d90276312 | ORPH
   mips64    |        openblas-0.3.21         | NOK | http://autobuild.buildroot.net/results/9693e1cf74dbd7bff9adfda02e94ac69a480b807 | ORPH
   mips64    |        openblas-0.3.21         | NOK | http://autobuild.buildroot.net/results/329fd9c9454e1f2ebd34585bdb67df6d54e5fba1 | ORPH
  sparc64    | package/rtl8821cu/rtl8821cu... | NOK | http://autobuild.buildroot.net/results/f2064e11265a9ba5171273765c2cf18d0bf57682 |     
    arc      |          perl-5.36.0           | NOK | http://autobuild.buildroot.net/results/a6fd0cb56ceca33ae4a76b08fa69144957057780 |     
   arceb     |          perl-5.36.0           | NOK | http://autobuild.buildroot.net/results/ac187b440f8bcc0aa6873b9241ba64a23bd792a9 |     
    sh4      |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/2aa4ddc8f37591e5b81a717c20a8b0709692c108 |     
   arceb     |        rsyslog-8.2204.1        | NOK | http://autobuild.buildroot.net/results/d23cf7389a66a74e44dca1b010b4778ada091bce | ORPH
   sh4eb     |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/1fb6ecd21b28508d00eceb39f124bc13b7567fec | ORPH
   x86_64    |          spice-0.15.0          | NOK | http://autobuild.buildroot.net/results/bd55f249b520b6e5b671c37303c52a7dd239a054 |     
   xtensa    |         uclibc-1.0.43          | NOK | http://autobuild.buildroot.net/results/804a23a84a8767baf23239ed380d4f0ec3ff0865 |     
   x86_64    |         uclibc-1.0.43          | NOK | http://autobuild.buildroot.net/results/dfeb66c387bcaad2d1802f75c4c06e163c0c77e2 |     
  powerpc    |         uclibc-1.0.43          | NOK | http://autobuild.buildroot.net/results/a2d4e2411a4402c90bcdf781b540779ec4cd002c |     
   xtensa    |         uclibc-1.0.43          | NOK | http://autobuild.buildroot.net/results/94b9820ce01e8445307aa923c393bac7e99bc6d0 |     
  mips64el   | uclibc-ng-test-6790eafe897b... | NOK | http://autobuild.buildroot.net/results/69c276613beef5ac07954a11048351b6e41bd875 |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/3b5a90459fa69ba6ec11c877d11cfe97dc95fa5e |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/18700ab4d103877c9e3cba10b39fcc92f44315a5 |     
    mips     |        valgrind-3.19.0         | NOK | http://autobuild.buildroot.net/results/6b926d27eab43aaf481ef72d7327ee3561a24914 | ORPH
   mips64    |        valgrind-3.19.0         | NOK | http://autobuild.buildroot.net/results/2b595d5d1515de7cc35a2bb11d82b3556d5051f9 | ORPH
   mipsel    |         wolfssl-5.5.3          | NOK | http://autobuild.buildroot.net/results/0c4e609ae5e62c3a9cfe99b04a026dc1cc1ef9a2 |     
   armeb     |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/970ff5ca207ce422f6791bddc686e50714a3a8db |     
    i686     |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/db5feb624da4d3afa55d8f7fdd27f97d57724afb |     
   nios2     |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/b90708ca30eb291eadb08de267239a26298f4e7d |     
   x86_64    |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/7d5850b426ca828c57d1b5e4e96a63c2a7e900d1 |     
   sparc     |           znc-1.8.2            | NOK | http://autobuild.buildroot.net/results/5c778ba1d554cf4dbefcd1fb45652e798363d618 |     
   nios2     |        zxing-cpp-1.4.0         | NOK | http://autobuild.buildroot.net/results/5051617a29062711e10ab3408e9f9ab47ddeb763 |     


Classification of failures by reason for 2023.02.x
--------------------------------------------------

                host-go-1.19.8 | 2 
                  linux-6.1.14 | 2 
                       unknown | 2 
                 apache-2.4.56 | 1 
                busybox-1.36.0 | 1 
                elfutils-0.186 | 1 
              fluent-bit-2.0.9 | 1 
fs/cramfs/cramfs.mk:46: /ho... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
            host-binutils-2.37 | 1 
            host-binutils-2.38 | 1 
         host-gcc-final-10.4.0 | 1 
               host-qemu-7.2.0 | 1 
              host-rust-1.67.1 | 1 
          lttng-modules-2.13.7 | 1 
                 openssh-9.3p1 | 1 
package/rtl8821cu/rtl8821cu... | 1 
                 uclibc-1.0.43 | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mipsel    |         apache-2.4.56          | NOK | http://autobuild.buildroot.net/results/857f4124505056910c8674a754358c67f95ffab4 |     
   mipsel    |         busybox-1.36.0         | NOK | http://autobuild.buildroot.net/results/756ea98e2ff4cc3194d4cff3225e2e6595f0126e | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/62300d43bb87b7eca8f7d392a7d164a79321ab04 | ORPH
    mips     |        fluent-bit-2.0.9        | NOK | http://autobuild.buildroot.net/results/9a7d70c9cc7373f8fdcd565fce9f83bb5a6f9618 |     
   x86_64    | fs/cramfs/cramfs.mk:46: /ho... | NOK | http://autobuild.buildroot.net/results/20dbb61aa224f890fa72b1fded1209422aea3897 |     
   s390x     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/cfd37ffe1500fb83aeec6d389fc682ef8e9a292b |     
powerpc64le  |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/071435e010a8494b1d0ef249bb795a60b52b56cf |     
  sparc64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/b5c9b4e617eab4a1e8c08828f016e678c17d594d |     
   sparc     |     host-gcc-final-10.4.0      | NOK | http://autobuild.buildroot.net/results/320854b5d053158ebb57f52aca56ed9295756a0b |     
powerpc64le  |         host-go-1.19.8         | NOK | http://autobuild.buildroot.net/results/75e172d8376213232a83c9462312081b187c3ba5 |     
   mips64    |         host-go-1.19.8         | NOK | http://autobuild.buildroot.net/results/4d3fd44500bfd3d273f57f67df0157a9d8535764 |     
    arm      |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/aa6a70a25758ac52958f0f30af41ed8489880298 |     
  aarch64    |        host-rust-1.67.1        | NOK | http://autobuild.buildroot.net/results/1783d0b327b3aa234bfc9d23350b860371fe9908 |     
microblazeel |          linux-6.1.14          | NOK | http://autobuild.buildroot.net/results/57d4611c5f077ac69a524fdb7d17df318957bab9 | ORPH
    sh4a     |          linux-6.1.14          | NOK | http://autobuild.buildroot.net/results/19554da18bff887c635631d63263c8d91d7c1b9d | ORPH
    arc      |      lttng-modules-2.13.7      | NOK | http://autobuild.buildroot.net/results/39b2c21c1bd3ef6d8aef8b144632762ee057351c |     
    m68k     |         openssh-9.3p1          | NOK | http://autobuild.buildroot.net/results/63d6c8a56e7e3db32f7511548989ccfa9cff41c3 | ORPH
   sparc     | package/rtl8821cu/rtl8821cu... | NOK | http://autobuild.buildroot.net/results/de725e9660b92f3bf869dcfff8b9be79ca196b25 |     
    m68k     |         uclibc-1.0.43          | NOK | http://autobuild.buildroot.net/results/58ce9407380d886d3b6fd84cec7f0d19d2531b7e |     
    i686     |            unknown             | NOK | http://autobuild.buildroot.net/results/3053445988079b6b27c8dcdeb9fe272506358191 |     
 powerpc64   |            unknown             | NOK | http://autobuild.buildroot.net/results/19b8ac4b592d0b1b39e0f007bbf2b875cf2260dd |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
