Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A18BC3DA6F
	for <buildroot@archiver.kernel.org>; Fri, 25 Aug 2023 05:34:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A7B5B41509;
	Fri, 25 Aug 2023 05:34:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A7B5B41509
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7-CfqzUwB_S2; Fri, 25 Aug 2023 05:34:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 66AA341480;
	Fri, 25 Aug 2023 05:34:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 66AA341480
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A08661BF287
 for <buildroot@lists.busybox.net>; Fri, 25 Aug 2023 05:34:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 47D9B4186A
 for <buildroot@lists.busybox.net>; Fri, 25 Aug 2023 05:34:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 47D9B4186A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uod924wQcTdF for <buildroot@lists.busybox.net>;
 Fri, 25 Aug 2023 05:34:16 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5900641779
 for <buildroot@buildroot.org>; Fri, 25 Aug 2023 05:34:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5900641779
Received: by mail.gandi.net (Postfix) with ESMTPSA id 62706C0006
 for <buildroot@buildroot.org>; Fri, 25 Aug 2023 05:34:13 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Fri, 25 Aug 2023 05:34:13 -0000
X-GND-Sasl: bot@bootlin.com
Message-Id: <20230825053420.47D9B4186A@smtp4.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1692941653; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=dXQuzI2F57dJoe5/65hSbFCLtYvOXPBD4Ed65xMu5SM=;
 b=iDFpUABj0VUSL2ZPE7iTpHoV34ZwNCe8ZQZPbDsuC7zfDXA1LhMLbnXd6fhM0tlxLIOR1k
 vN7892lNDM5ycY7XPzOyt9ExDykhira8MQ3PbaTNuxnUMB0NDHXTcfTIPiixOuquWi5Pgv
 AHzu/wXZO784io6L+C+r84TVN6u1TgF+nW6APUEYhBrCzwGrXfT6iBY++d2OOXCJEq2QvP
 3RoLmpZfT9RHsShbkRTx9tM79U/xkjSkxCe+6FR07HSN9AYkG3nGS4DCwOdEE3URwaPRaf
 8ogRm99vJo0EPvTQ9ck0uiKll93n33+/B1fpzKhLHXh+zNxYKQy9wfKZkgIpKg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=iDFpUABj
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-08-24
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

Autobuild statistics for 2023-08-24
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  |  5  |  5  |  0  | 10  |
  2023.05.x  |  2  |  4  |  0  |  6  |
    master   | 99  | 67  |  0  | 166 |

Classification of failures by reason for master
-----------------------------------------------

                host-go-1.20.7 | 4 
                  check-0.15.2 | 3 
  gobject-introspection-1.76.1 | 3 
              libxcrypt-4.4.33 | 3 
                  linux-6.4.11 | 3 
glibc-2.37-2-g9f8513dc64119... | 2 
       python-stack-data-0.6.2 | 2 
               syslog-ng-4.2.0 | 2 
ulog-0389d243352255f6182326... | 2 
                xenomai-3.0.10 | 2 
                  zeromq-4.3.4 | 2 
                 avro-c-1.11.1 | 1 
                  bind-9.16.42 | 1 
                  boost-1.82.0 | 1 
                  clang-15.0.3 | 1 
                 coreutils-9.3 | 1 
             dahdi-linux-3.2.0 | 1 
                 dc3dd-7.2.641 | 1 
        edk2-edk2-stable202305 | 1 
             f2fs-tools-1.16.0 | 1 
                    flac-1.4.3 | 1 
                gnu-efi-3.0.15 | 1 
             gstreamer1-1.22.2 | 1 
                   guile-3.0.9 | 1 
         host-gcc-final-12.3.0 | 1 
         host-gcc-final-13.2.0 | 1 
     host-python-maturin-1.1.0 | 1 
              host-rust-1.71.0 | 1 
         host-sentry-cli-2.8.0 | 1 
                   httping-2.5 | 1 
ibm-sw-tpm2-5452af422edeff7... | 1 
                  jack2-1.9.21 | 1 
              leptonica-1.82.0 | 1 
                libglvnd-1.4.0 | 1 
          linux-5.10.162-cip24 | 1 
               linux-pam-1.5.3 | 1 
        ltp-testsuite-20230127 | 1 
                     lxc-5.0.2 | 1 
               mariadb-10.11.4 | 1 
                    olsr-0.9.8 | 1 
              open62541-v1.3.6 | 1 
                oprofile-1.4.0 | 1 
                   perl-5.36.1 | 1 
                     php-8.2.9 | 1 
            quickjs-2021-03-27 | 1 
rockchip-rkbin-b4558da0860c... | 1 
              skalibs-2.12.0.1 | 1 
                       unknown | 1 
        util-linux-libs-2.39.1 | 1 
                 wolfssl-5.6.3 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |         avro-c-1.11.1          | NOK | http://autobuild.buildroot.net/results/7ecc797d0a4391f0c795af6106f857b7a745c9eb |     
  powerpc    |          bind-9.16.42          | NOK | http://autobuild.buildroot.net/results/18676850f70f2a1c41f8d348120a4352ab8023de | ORPH
    arc      |          boost-1.82.0          | NOK | http://autobuild.buildroot.net/results/01ec7fa0056dfa745ba9ee25dfd7ea6993c331ad |     
   arceb     |          check-0.15.2          | NOK | http://autobuild.buildroot.net/results/72ff7460f9ba29c549af81f4c687c196f92d08c8 | ORPH
  riscv64    |          check-0.15.2          | NOK | http://autobuild.buildroot.net/results/92fecb707e5b800a988e1616c3089e55cacddf5c | ORPH
  mips64el   |          check-0.15.2          | NOK | http://autobuild.buildroot.net/results/6cad121cfcaa3d03e1e109d45d132b32e6b91ef9 | ORPH
   armeb     |          clang-15.0.3          | NOK | http://autobuild.buildroot.net/results/4d2e955de29f70d048b0e3032619f5accce7cbdf |     
   sparc     |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/c47b458b82c59e88b849a67f79b135b6e247c242 | ORPH
   x86_64    |       dahdi-linux-3.2.0        | NOK | http://autobuild.buildroot.net/results/5fd7e3c8be40a3a88487542ec184caa39830dcbb |     
    or1k     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/2cdf5f88f11e10e14e7654fb158faf6c3fccc2f1 | ORPH
    i686     |     edk2-edk2-stable202305     | NOK | http://autobuild.buildroot.net/results/442d4cec8b17f198b84a7c00264eea10c5000757 |     
 aarch64_be  |       f2fs-tools-1.16.0        | NOK | http://autobuild.buildroot.net/results/1dd5c69853536f8eff90f70792b065e3af5766cc |     
    sh4a     |           flac-1.4.3           | NOK | http://autobuild.buildroot.net/results/fd840849382986bed042108fe058f090f5df02f3 |     
  powerpc    | glibc-2.37-2-g9f8513dc64119... | NOK | http://autobuild.buildroot.net/results/3e3207625503d1aa87fbc0274e1fbbf3219cbd2b |     
  powerpc    | glibc-2.37-2-g9f8513dc64119... | NOK | http://autobuild.buildroot.net/results/f94329b2629c339a15d01a21289f1c8bf5f9bdba |     
  mips64el   |         gnu-efi-3.0.15         | NOK | http://autobuild.buildroot.net/results/d749a1210da22abd6f3a62e15dc09a815b0e90b6 |     
   nios2     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/a70caf8225135fdd047e7e6d5a2c30d1c24d560b | ORPH
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/8c1f437fce046af267fed83e355a9ec87903e693 | ORPH
    arm      |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/3c1c2eb3e296b6313f8602965d66caa7a5f8edb2 | ORPH
    i686     |       gstreamer1-1.22.2        | NOK | http://autobuild.buildroot.net/results/9fdd93d11639690058c6cf2054e8329a5c8afb24 | ORPH
    mips     |          guile-3.0.9           | NOK | http://autobuild.buildroot.net/results/d3f05d1f0e9c3bd05b6a232970038a303ab45e9c |     
microblazeel |     host-gcc-final-12.3.0      | NOK | http://autobuild.buildroot.net/results/7927b7e439dac929865d8bf35513821d0a2082fa |     
   arceb     |     host-gcc-final-13.2.0      | NOK | http://autobuild.buildroot.net/results/2e2766e59cccf056a857d5f079eea3bdd3eed12d |     
   mips64    |         host-go-1.20.7         | NOK | http://autobuild.buildroot.net/results/de386b7d722491198f6824e026540d8b09686d56 |     
  mips64el   |         host-go-1.20.7         | NOK | http://autobuild.buildroot.net/results/5b21fdc61c52af80466a468d22d29efc04075f3c |     
powerpc64le  |         host-go-1.20.7         | NOK | http://autobuild.buildroot.net/results/0e539c39d65406fbdc1b8bda3847fbdee204c489 |     
    arc      |         host-go-1.20.7         | NOK | http://autobuild.buildroot.net/results/2a9238c3604a88f8968dd99f2713513dfacaafcd |     
    i686     |   host-python-maturin-1.1.0    | NOK | http://autobuild.buildroot.net/results/b12b0d0b8434448f1a41d11643ce5f277e9a614a |     
    i686     |        host-rust-1.71.0        | NOK | http://autobuild.buildroot.net/results/98af652a0b82ef71727cf4ba868929f631cf7c41 |     
   mips64    |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/6d2b946b85fbff61bd1636089d556b4dcd17fa1b |     
    arc      |          httping-2.5           | NOK | http://autobuild.buildroot.net/results/22b9ca2963edee214c5fc79b11953cf3df4b7cd0 |     
    mips     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/61bbf39642d75a0e9b8ccb1d182abbe41b295676 |     
    m68k     |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/6bf2d5c13ac204ab53d84622836100bfbb6c3bac |     
   sh4aeb    |        leptonica-1.82.0        | NOK | http://autobuild.buildroot.net/results/ea34c491f63b4fcb045624909152910cc4bdd145 |     
   mipsel    |         libglvnd-1.4.0         | NOK | http://autobuild.buildroot.net/results/9f81f29d30d33bc3887455104434cc30ad29ba75 | ORPH
   mipsel    |        libxcrypt-4.4.33        | NOK | http://autobuild.buildroot.net/results/90f46035414a7ae14b8e4b02772ebe8bddbe669a |     
  aarch64    |        libxcrypt-4.4.33        | NOK | http://autobuild.buildroot.net/results/01b26b4202563ac1bd3598d38a6e538d6dbe9353 |     
    arc      |        libxcrypt-4.4.33        | NOK | http://autobuild.buildroot.net/results/2f0e833b84c391a41666cecd57f72c261ab96d1b |     
    arm      |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/3e35e277dcc5630d97adb44ae6392848148d583d | ORPH
    mips     |          linux-6.4.11          | NOK | http://autobuild.buildroot.net/results/f8618f63e2c0b7a0a0432acef553bb128ffc7d10 | ORPH
    m68k     |          linux-6.4.11          | NOK | http://autobuild.buildroot.net/results/7bc46ec36f919de7377ea913f0bf6c21a16f862e | ORPH
    m68k     |          linux-6.4.11          | NOK | http://autobuild.buildroot.net/results/26a8759abe1c345b712e8d6ec34e0d0ddfd60e6c | ORPH
  mips64el   |        linux-pam-1.5.3         | NOK | http://autobuild.buildroot.net/results/5bbbb3f10a609f57f1b27550cef8d9223e420be6 | ORPH
   s390x     |     ltp-testsuite-20230127     | NOK | http://autobuild.buildroot.net/results/d5bf2538f8f888c63ea9d33730bad62ade9a0ed6 |     
powerpc64le  |           lxc-5.0.2            | NOK | http://autobuild.buildroot.net/results/6d43b26bcdeafec79a5f0afafd696232ff5749d7 |     
powerpc64le  |        mariadb-10.11.4         | NOK | http://autobuild.buildroot.net/results/cd980933718f3c447fbe705b5bf6858ea14f1808 | ORPH
  aarch64    |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/3429d04ab237166e51f23f17a254d6528c58bdd2 | ORPH
 powerpc64   |        open62541-v1.3.6        | NOK | http://autobuild.buildroot.net/results/54d2c88a2d2b8f5af10651e837007f9a793b2fa7 | ORPH
   sh4aeb    |         oprofile-1.4.0         | NOK | http://autobuild.buildroot.net/results/9751534e8b20739a048a24c3e9cc1152e40ade26 |     
   arceb     |          perl-5.36.1           | NOK | http://autobuild.buildroot.net/results/cdf689ec592112fd9b2a140de246a21575ba4834 |     
    or1k     |           php-8.2.9            | NOK | http://autobuild.buildroot.net/results/55a4bbc04e75ef1c29ddbe1fe0d908a3560b681f |     
   mipsel    |    python-stack-data-0.6.2     | NOK | http://autobuild.buildroot.net/results/b5fa8f1e27bdaa4573b49701c4d09d20cbbc2c94 |     
microblazeel |    python-stack-data-0.6.2     | NOK | http://autobuild.buildroot.net/results/bd872f4b61ca0124647d9949e3972f3634483a54 |     
  powerpc    |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/7a0d2a1b4e6255d44da7fc1fe1252b92237ad53e |     
    arm      | rockchip-rkbin-b4558da0860c... | NOK | http://autobuild.buildroot.net/results/eb4231ebf8eeda3d17fb0571279a3ae09a527ef0 |     
    or1k     |        skalibs-2.12.0.1        | NOK | http://autobuild.buildroot.net/results/bb570d79941a2bff7f84ef99c6ca8ef08f26e375 |     
  mips64el   |        syslog-ng-4.2.0         | NOK | http://autobuild.buildroot.net/results/56ea03eab133d9c4dd325d313e00e88aa8dce3a1 |     
   x86_64    |        syslog-ng-4.2.0         | NOK | http://autobuild.buildroot.net/results/72d403df154af0107b90db0eaaf26d5cffa53344 |     
  aarch64    | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/07a566c633786e9da776772ad0df581d197d7d3e |     
   mipsel    | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/49a3b7e29659fbe69d5267283fb1856021a78dd4 |     
 microblaze  |            unknown             | NOK | http://autobuild.buildroot.net/results/d56fde8e9144d468e6de905101aae415dca00b73 |     
    or1k     |     util-linux-libs-2.39.1     | NOK | http://autobuild.buildroot.net/results/d46fc180e0e18f69d4804e28af40d9ccd1a00be6 | ORPH
   mipsel    |         wolfssl-5.6.3          | NOK | http://autobuild.buildroot.net/results/387cbe3b6bea61563fe407a119daf6a73b463897 |     
    mips     |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/d31d6560a0da4e43167970f879d3e6b961e061c4 |     
   mipsel    |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/0e6d44536a04c24790cd4163b98ccb9d7dbd25bc |     
  mips64el   |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/c5b89750e7db9cb1e28ddcb1ec55e710b3c91efe |     
    mips     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/f055ec47488b8198f110470a0b812e914644e16b |     


Classification of failures by reason for 2023.02.x
--------------------------------------------------

            host-binutils-2.38 | 1 
              host-rust-1.67.1 | 1 
               libcap-ng-0.8.3 | 1 
                    olsr-0.9.8 | 1 
               zxing-cpp-1.4.0 | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    mips     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/a80b77462f01854651901a0f5536229aa67c49b0 |     
   mips64    |        host-rust-1.67.1        | NOK | http://autobuild.buildroot.net/results/3f652868e9caa0d130065788339459f992ed5458 |     
  riscv64    |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/07200190cc28df94fcaee496fba8c92fbc2d3920 |     
   armeb     |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/f49fd8f94285fdaa6641cc8f2849d390d6404e26 | ORPH
    mips     |        zxing-cpp-1.4.0         | NOK | http://autobuild.buildroot.net/results/2ba2260924dfeba4e45a1fb47aecb702d1d9ae92 |     


Classification of failures by reason for 2023.05.x
--------------------------------------------------

                elfutils-0.186 | 1 
                 fdk-aac-2.0.2 | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
                       unknown | 1 


Detail of failures for 2023.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/4fdc4ca491286a5783c885e2079538238e6e719a | ORPH
   mipsel    |         fdk-aac-2.0.2          | NOK | http://autobuild.buildroot.net/results/f963ad0aceb68d7ecc1e85bd8143612a54b7c50c |     
    sh4a     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/8eeb33fd2bfbcb78237728d99fc4fd43beccf30a |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/1f53c95425a59f5b23dc772ceb21cd889b4ee3bf |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
