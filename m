Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4AB0C6FD1C
	for <buildroot@archiver.kernel.org>; Sun, 26 Mar 2023 05:36:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 11B9181EC4;
	Sun, 26 Mar 2023 05:36:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 11B9181EC4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7Fus3L6EqEAC; Sun, 26 Mar 2023 05:36:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7D36681EC5;
	Sun, 26 Mar 2023 05:36:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7D36681EC5
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1180D1BF417
 for <buildroot@lists.busybox.net>; Sun, 26 Mar 2023 05:36:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DE9CE40158
 for <buildroot@lists.busybox.net>; Sun, 26 Mar 2023 05:36:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DE9CE40158
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6TeZ5fiAjTzG for <buildroot@lists.busybox.net>;
 Sun, 26 Mar 2023 05:36:12 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6AD6B400F3
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6AD6B400F3
 for <buildroot@buildroot.org>; Sun, 26 Mar 2023 05:36:11 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 8D0ED1BF204
 for <buildroot@buildroot.org>; Sun, 26 Mar 2023 05:36:08 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sun, 26 Mar 2023 05:36:08 -0000
Message-Id: <20230326053613.DE9CE40158@smtp2.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1679808968; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=rhexcz7piVh14c/CfqV+D+HMc1cM7+BS+4iKzPMzotI=;
 b=k3jKutsh0Cb1E4/OCqO/OSGi73GZzdLP2Qb6f7z6QCKb9W0ufmeOO+mp7+OzXEnDahGZS4
 jwxIp6BLZ1CaKgVWDkNiD0BUphgwM0CgMPoA7PmpPA0Z0xZQd/GQqEuS/86h/Akn4HT5GE
 hhKJK48fUQ7Vbi7udLzLOcMBbzWTqybdsCx+GKJJ0NfcTGyCgD+dT8jWYJEk2Y/68XvOqG
 PEFbjdu72RDPH5ld9LRPxwjcPBtdhhg9rAy2qBDJPeBHqzGn5/CFpcRATFmxzY6LTpNp9L
 5vhsaYAHsa1OEab/Uzt7iyKPQHExjz9Z54GLjStu/wPbNEJqTGtueNckXQZWhQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=k3jKutsh
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-03-25
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

Autobuild statistics for 2023-03-25
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  |  8  |  8  |  0  | 16  |
    master   | 210 | 150 |  3  | 363 |

Classification of failures by reason for master
-----------------------------------------------

                       unknown | 11
                  snmppp-3.5.0 | 9 
                  linux-6.1.14 | 7 
               host-qemu-7.2.0 | 6 
  gobject-introspection-1.72.0 | 5 
                host-go-1.19.7 | 5 
             bluez5_utils-5.66 | 4 
                elfutils-0.186 | 4 
              libgcrypt-1.10.1 | 4 
               libglib2-2.72.3 | 4 
            host-binutils-2.38 | 3 
        ltp-testsuite-20220930 | 3 
android-tools-4.2.2+git2013... | 2 
                    brltty-6.5 | 2 
                busybox-1.36.0 | 2 
             fontconfig-2.13.1 | 2 
                     frr-8.4.2 | 2 
fs/cramfs/cramfs.mk:46: /ho... | 2 
                     gmp-6.2.1 | 2 
         gobject-introspection | 2 
            host-binutils-2.39 | 2 
       host-gcc-initial-12.2.0 | 2 
              host-rust-1.68.0 | 2 
     linux-5.10.162-cip24-rt10 | 2 
          lttng-modules-2.13.7 | 2 
                    olsr-0.9.8 | 2 
rtl8189fs-ed6741b52bc998875... | 2 
                  acpid-2.0.34 | 1 
                alsa-lib-1.2.8 | 1 
                  assimp-5.2.5 | 1 
                  bind-9.16.38 | 1 
             containerd-1.6.16 | 1 
                 coreutils-9.2 | 1 
           crucible-2022.05.25 | 1 
                   duma-2.5.15 | 1 
                  ffmpeg-4.4.3 | 1 
                     file-5.43 | 1 
                   flann-1.9.2 | 1 
              fluent-bit-2.0.9 | 1 
fs/cramfs/cramfs.mk:46: /ho... | 1 
fs/cramfs/cramfs.mk:46: /ho... | 1 
fs/cramfs/cramfs.mk:46: /ho... | 1 
fs/cramfs/cramfs.mk:46: /tm... | 1 
fs/ubi/ubi.mk:51: /home/aut... | 1 
fs/ubi/ubi.mk:51: /home/aut... | 1 
fs/ubi/ubi.mk:51: /home/aut... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /tmp/... | 1 
fs/ubifs/ubifs.mk:49: /tmp/... | 1 
fs/ubifs/ubifs.mk:49: /tmp/... | 1 
glibc-2.36-81-g4f4d7a13edfd... | 1 
google-breakpad-c85eb4a59b6... | 1 
       host-gcc-initial-11.3.0 | 1 
              hyperfine-1.14.0 | 1 
                   imagemagick | 1 
kvmtool-f77d646ba01d04be5aa... | 1 
                libglvnd-1.4.0 | 1 
                 libp11-0.4.12 | 1 
               libsigrok-0.5.2 | 1 
                libxml2-2.10.3 | 1 
                     lxc-5.0.2 | 1 
mali-driver-87c13e6994b20b5... | 1 
                  matio-1.5.23 | 1 
             netsniff-ng-0.6.8 | 1 
                    ola-0.10.9 | 1 
                   opensbi-0.9 | 1 
package/rtl8821cu/rtl8821cu... | 1 
               pcsc-lite-1.9.9 | 1 
                     pv-1.6.20 | 1 
            python-sip-4.19.25 | 1 
            quickjs-2021-03-27 | 1 
                  reaver-1.6.6 | 1 
                rocksdb-6.20.3 | 1 
rtl8821au-0cab870ff635ba038... | 1 
                    sdl-1.2.15 | 1 
uclibc-ng-test-6790eafe897b... | 1 
ulog-0389d243352255f6182326... | 1 
           v4l2loopback-0.12.7 | 1 
                     vdr-2.6.3 | 1 
wireguard-linux-compat-1.0.... | 1 
                xenomai-3.0.10 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mips64    |          acpid-2.0.34          | NOK | http://autobuild.buildroot.net/results/ea75ba176fa7888f7a1c0f073fad5700c69f25c3 | ORPH
powerpc64le  |         alsa-lib-1.2.8         | NOK | http://autobuild.buildroot.net/results/19e74bda38bbd0e26add6a76d02fc0e94199f8e4 |     
powerpc64le  | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/b49d37b041ebc6718d1441bdab80e88685609128 |     
powerpc64le  | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/d1ee7b2c0b956404e2b90764ddf4a4af20a44a7f |     
   mips64    |          assimp-5.2.5          | NOK | http://autobuild.buildroot.net/results/43f1b262765b73b9b1fd5d3588203f6cc0bd205e | ORPH
    sh4a     |          bind-9.16.38          | NOK | http://autobuild.buildroot.net/results/e7b9a4cbee8bb16431609182b96d1ac1ccec10e7 | ORPH
  aarch64    |       bluez5_utils-5.66        | NOK | http://autobuild.buildroot.net/results/3fd24a604a29eff70e20f82690e3f058f04903f9 |     
    mips     |       bluez5_utils-5.66        | NOK | http://autobuild.buildroot.net/results/bd57f1813be699cd5ce2ae94f5f511a71fe10428 |     
    arm      |       bluez5_utils-5.66        | NOK | http://autobuild.buildroot.net/results/90d528cc18a367af2f68e1c0673d962fe399e1ac |     
    or1k     |       bluez5_utils-5.66        | NOK | http://autobuild.buildroot.net/results/552b700ee129e1c7f651de13f6766eae5325dcbc |     
powerpc64le  |           brltty-6.5           | NOK | http://autobuild.buildroot.net/results/ca41e91f372c0bd3975d069ed76ffb91a90c0f1a |     
    mips     |           brltty-6.5           | NOK | http://autobuild.buildroot.net/results/2746ccf86fc396049f80df5b2c822db38f15449f |     
   mipsel    |         busybox-1.36.0         | NOK | http://autobuild.buildroot.net/results/23b3b1f3beaacac2958123a9398781cc24ace6ff | ORPH
   mipsel    |         busybox-1.36.0         | NOK | http://autobuild.buildroot.net/results/3dd78a57dde1081bd18a5e1363b4357c850534a2 | ORPH
   x86_64    |       containerd-1.6.16        | NOK | http://autobuild.buildroot.net/results/177559fe4132dff8fff5b38a0904d5d5fcea6e02 |     
    sh4      |         coreutils-9.2          | NOK | http://autobuild.buildroot.net/results/6f81bc71c51992d4035e0ebce3bc6c9d9dbb1add | ORPH
   x86_64    |      crucible-2022.05.25       | NOK | http://autobuild.buildroot.net/results/dc8de8f7bf70bb6170b2b353892043d5650323b9 |     
   mips64    |          duma-2.5.15           | NOK | http://autobuild.buildroot.net/results/706d5e4c6a41ad0240d416ab6e610f92c546c8cf | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/394a2058fb9cf38eab9d9f2ac5fdc78e5ce6193e | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/4ba4521853ea0dc8cd4aca78321e3a14c4974b69 | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/72ab36801182ea460b665d7c69d49a26688b72b7 | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/9c7b79cfea0e8f219661d165848ee868e2efb533 | ORPH
  aarch64    |          ffmpeg-4.4.3          | NOK | http://autobuild.buildroot.net/results/ffb6852a6a7c84fb1fb70e152991f3cc459d37d2 |     
    arm      |           file-5.43            | NOK | http://autobuild.buildroot.net/results/2dc3e4c9e46e5227c027fb2b07a07a37063472a3 | ORPH
    arm      |          flann-1.9.2           | NOK | http://autobuild.buildroot.net/results/c92a3df1bc73e00e1e4493500bfb7277cf5064ee |     
    arm      |        fluent-bit-2.0.9        | NOK | http://autobuild.buildroot.net/results/d3bbabfef1eb6bb58443ac78da1c89a998e1faaf |     
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/aca3b785321d139eab2e9dd5284c90a193cc5f20 | ORPH
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/f4cfde6dd75d09dcb52208b91ef05e9deff2771c | ORPH
    arc      |           frr-8.4.2            | NOK | http://autobuild.buildroot.net/results/242535334f291f87802a60750924ca4a53d6d02f |     
   xtensa    |           frr-8.4.2            | NOK | http://autobuild.buildroot.net/results/d0166a303869e81cefa0e9d1efbec152069d8548 |     
powerpc64le  | fs/cramfs/cramfs.mk:46: /ho... | NOK | http://autobuild.buildroot.net/results/85423f0c2a7229562e658c086225b5b1cf1e5e22 |     
   armeb     | fs/cramfs/cramfs.mk:46: /ho... | NOK | http://autobuild.buildroot.net/results/cf6323bbc7eba221ad579e0a60e43258edfc84e9 |     
   mips64    | fs/cramfs/cramfs.mk:46: /ho... | NOK | http://autobuild.buildroot.net/results/feffc04f68123d05b1a7e5631a69631228031874 |     
 aarch64_be  | fs/cramfs/cramfs.mk:46: /ho... | NOK | http://autobuild.buildroot.net/results/c90748af7073c5e8142979b0f05f058130a7ff13 |     
  sparc64    | fs/cramfs/cramfs.mk:46: /ho... | NOK | http://autobuild.buildroot.net/results/c1c37959bf3de0b89d8cfa3b05cb93a391ee61df |     
    m68k     | fs/cramfs/cramfs.mk:46: /tm... | NOK | http://autobuild.buildroot.net/results/325d5f48ec4c349ee6435f4085557feedf8dc2d5 |     
   armeb     | fs/ubi/ubi.mk:51: /home/aut... | NOK | http://autobuild.buildroot.net/results/06150443cf9261c1292511e12b4fa5c88b996aa5 |     
   armeb     | fs/ubi/ubi.mk:51: /home/aut... | NOK | http://autobuild.buildroot.net/results/736b18f6a2460c00ce5455b47ef1d8a2b6e35b9d |     
   sparc     | fs/ubi/ubi.mk:51: /home/aut... | NOK | http://autobuild.buildroot.net/results/6f0a39edc48401b73eac2a155a2934fa756e197d |     
   sh4eb     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/1d4f715d42580bfde4ecf5112800e473af3150c4 |     
    i686     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/23972db0e67dac9a10e716b7ebac42e965a53a96 |     
 powerpc64   | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/dddf8b591ff23e7ee63525dfee682cbc4f999fef |     
   s390x     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/9c158f2deb97318299c9ecf9f9bdca4068bb767a |     
   nios2     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/3af2f0e5aee45781be88340f4869f73a1a22ce62 |     
  mips64el   | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/b2bf44223652e94fab8fc17ef1b93181dafa83a6 |     
    sh4a     | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/dc1c3e20935bafd45ee7c2285687e5c2daee22a3 |     
    arc      | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/8bdb0d03b99bc8aec210cd4c0dc174ed5db72883 |     
  powerpc    | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/8b99b521e5dddcdd75134357fc355d947288c289 |     
  riscv64    |           gmp-6.2.1            | NOK | http://autobuild.buildroot.net/results/90e2b0928df6c43eebeb1782a19a0d7dbc72f9e5 | ORPH
  riscv64    |           gmp-6.2.1            | NOK | http://autobuild.buildroot.net/results/74525e36665201428ebdc424c22ff24c30dee1a8 | ORPH
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/d3aa70a61e0ccafc4335617b3b76e9298ebe650b |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/f0afece353540b6b75ae931354244a0756df74d6 |     
 powerpc64   |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/695f5ed3b754135c926143002e94f3e2923aab5a | ORPH
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/e4e1934b0e3119f121d1c84e676459921d802efe | ORPH
   s390x     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/67eeceacdc5a201b0d2d05a0616e230e7ccd86a9 | ORPH
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/5288e5841aae89552163b1238d0d7b75bb45704b | ORPH
microblazeel |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/b2905d26251bbc5ad0e16f34cd837e13b1429b4e | ORPH
    i686     | google-breakpad-c85eb4a59b6... | NOK | http://autobuild.buildroot.net/results/f05ea95aadd7c453086d379d508b43883f292d6f |     
 powerpc64   |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/6b827f94589b35b030f5a72a35fe7346ba5990b1 |     
powerpc64le  |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/ceb15b9e92bcdcf4fa4cf32c6103587dbb9e6fbb |     
  aarch64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/fcd141797c9ecef19cc3362e1822131140923c57 |     
   nios2     |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/afc7d85cb28673d02ec7a36bdbd1ab1ccb9564c2 |     
   nios2     |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/ce3b4c016df4573a88db46820e1aa19446841e6f |     
  sparc64    |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/c1e3cb1f47b37f45477e85346eeba36b138337f5 |     
  mips64el   |    host-gcc-initial-12.2.0     | NOK | http://autobuild.buildroot.net/results/84002155bbb4fd1398d03845b65f4c2b7069ba2d |     
 microblaze  |    host-gcc-initial-12.2.0     | NOK | http://autobuild.buildroot.net/results/95f2d86bfe7240bdd18606475f834c0b9ca19d5b |     
   mips64    |         host-go-1.19.7         | NOK | http://autobuild.buildroot.net/results/2f04c8c29d2a7a272d642657da364a6e12b88048 |     
  aarch64    |         host-go-1.19.7         | NOK | http://autobuild.buildroot.net/results/849c1e9f763b4f83c8c1359755c62391f14fdb2e |     
   mips64    |         host-go-1.19.7         | NOK | http://autobuild.buildroot.net/results/c66387e411ee332ed915a62f65362e55b7bc11a1 |     
    i686     |         host-go-1.19.7         | NOK | http://autobuild.buildroot.net/results/ee1323ab00b12eae06d1635465d74f7cc9ea3192 |     
  aarch64    |         host-go-1.19.7         | NOK | http://autobuild.buildroot.net/results/158569a4c4d075aa2c0fe6619cfa78e2fc949e28 |     
    i686     |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/1c001645397d2bfb16c87e5df41ba2b563a04ba5 |     
    i686     |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/3b9e0e209a335382daf55d4a35d01260e79e8d49 |     
    sh4a     |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/39f5d6226023cff12225d8524206d5353a832e5c |     
    mips     |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/087e811d67418eff3632db406724017a9235edb6 |     
  sparc64    |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/a6ff1ce4df19d69fb329daf89307ec799bc6d08c |     
   sh4eb     |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/64820de7fb23a70d616f1ee2a59ad2b64160b43c |     
  sparc64    |        host-rust-1.68.0        | NOK | http://autobuild.buildroot.net/results/509d5e0ceade04567e33f85400f02f452ec4bbf4 |     
 powerpc64   |        host-rust-1.68.0        | NOK | http://autobuild.buildroot.net/results/f4fe6cea27ad280652eb218272255ed7aca61fc5 |     
   armeb     |        hyperfine-1.14.0        | NOK | http://autobuild.buildroot.net/results/b1272d3a70f093f389f3df0ecb222ec3ec10faf3 | ORPH
    arm      |          imagemagick           | TIM | http://autobuild.buildroot.net/results/05a5c50cc992da2bff9c2a9b8931bb032a13761f |     
   x86_64    | kvmtool-f77d646ba01d04be5aa... | NOK | http://autobuild.buildroot.net/results/6513a27a9af2c83baa546761aacc27e9792d9c6b | ORPH
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/a16c1ff748d33e283750c1c90582526772c2d81c | ORPH
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/3505cb98028523a4f168a4ad7e94566e55e3594e | ORPH
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/f87cd1487e1609549164078d7f7d76bff5639bc1 | ORPH
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/8cb6459a2b7285af5ea9874a04c990a454dd1cc6 | ORPH
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/98e8c6792c18381af5b4e3b8fd324a488946fd87 |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/7e799f7c92bfbe2634833343e754efc3f443cd47 |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/1f237c42c00ce5e9540225c5d636fe1d2dcd0c12 |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/3a915ec82d9e2a635a0907c916b2ef554aee04d6 |     
    i686     |         libglvnd-1.4.0         | NOK | http://autobuild.buildroot.net/results/51e5c4b646e929acb40010e2cee7522300088ad1 | ORPH
   sparc     |         libp11-0.4.12          | NOK | http://autobuild.buildroot.net/results/98aa3ec65955210d64d6b560a4231646be5fedcc | ORPH
   mipsel    |        libsigrok-0.5.2         | NOK | http://autobuild.buildroot.net/results/86aefb7394408a5ea37388fcfa89d16ef1e1f252 | ORPH
   armeb     |         libxml2-2.10.3         | NOK | http://autobuild.buildroot.net/results/e322ecd6b2b4e9efa5a90e5558367ef57d6ab424 |     
   sparc     |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/55f5441e79ada2ba23a02509185dc2f9771c3a1a | ORPH
    mips     |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/b662c8d12cc400b13b2f1da65a6c8a7ca02dd220 | ORPH
   mipsel    |          linux-6.1.14          | NOK | http://autobuild.buildroot.net/results/c9b4b7b696ff3641da43609078c6a8cacbae0cb3 | ORPH
   x86_64    |          linux-6.1.14          | NOK | http://autobuild.buildroot.net/results/a8084d56f33f4fd28bc3c1866d408d1dcae36c4f | ORPH
   nios2     |          linux-6.1.14          | NOK | http://autobuild.buildroot.net/results/5ff8d914a7e29971c1e891b358946d5d7819a0e4 | ORPH
  mips64el   |          linux-6.1.14          | NOK | http://autobuild.buildroot.net/results/6da94896458c374546092e911e541263a835be98 | ORPH
   mips64    |          linux-6.1.14          | NOK | http://autobuild.buildroot.net/results/661e8a2e26549c0b273551334844689b678d4e4b | ORPH
    mips     |          linux-6.1.14          | NOK | http://autobuild.buildroot.net/results/615df17c3cc3d25a214de8db44c7d353a312d874 | ORPH
   arceb     |          linux-6.1.14          | NOK | http://autobuild.buildroot.net/results/c8967e4762fcff686aa8a19a2dac896ed5351d20 | ORPH
  sparc64    |     ltp-testsuite-20220930     | NOK | http://autobuild.buildroot.net/results/70ca6437786e9c9214556360d49fc2e6d5d2fcff |     
    or1k     |     ltp-testsuite-20220930     | NOK | http://autobuild.buildroot.net/results/1bfbe235c6880855956f99ea3c8e25e0896014c0 |     
   x86_64    |     ltp-testsuite-20220930     | NOK | http://autobuild.buildroot.net/results/8a459602e0a6bb09f028e40e1d81399cef773b17 |     
   sparc     |      lttng-modules-2.13.7      | NOK | http://autobuild.buildroot.net/results/cb8575ee5bf5ea10315f158ccd7315b5d8ecae95 |     
  aarch64    |      lttng-modules-2.13.7      | NOK | http://autobuild.buildroot.net/results/849ce7289f44f6ebe80a766eade5e1a73d285cb4 |     
 aarch64_be  |           lxc-5.0.2            | NOK | http://autobuild.buildroot.net/results/16e2ce67ca4c7d1010bec651e54bcd7151bfa3af |     
  aarch64    | mali-driver-87c13e6994b20b5... | NOK | http://autobuild.buildroot.net/results/00cc5c019360164ec1a68ca459c3c324af3860ec |     
   nios2     |          matio-1.5.23          | NOK | http://autobuild.buildroot.net/results/df5e4733e194b020dfdd4510eae8ce33d0492289 |     
   mips64    |       netsniff-ng-0.6.8        | NOK | http://autobuild.buildroot.net/results/7462b82177a6c00d03004db3dea728b0e7674077 |     
  sparc64    |           ola-0.10.9           | NOK | http://autobuild.buildroot.net/results/d496dbe89362243e2dd83dbda44e84e7c3497d75 |     
    i686     |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/db0d0a3991f0bcbec7ee01937a0376df746c632d | ORPH
   s390x     |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/04829ef9b89f17000ec0b6a750a6b43da8684b37 | ORPH
  riscv64    |          opensbi-0.9           | NOK | http://autobuild.buildroot.net/results/c63c70292f65d239faf20ae56909e56f8ec3c6e8 |     
   arceb     | package/rtl8821cu/rtl8821cu... | NOK | http://autobuild.buildroot.net/results/ddb436419c7b9eb511d47501d9c0931680b18e68 |     
    or1k     |        pcsc-lite-1.9.9         | NOK | http://autobuild.buildroot.net/results/6f947cb85667e3586f6b62be0d9351d8bd77674a | ORPH
   armeb     |           pv-1.6.20            | NOK | http://autobuild.buildroot.net/results/a3cc588399dd9d7a229f0924483e2200e9ba20cf | ORPH
 aarch64_be  |       python-sip-4.19.25       | NOK | http://autobuild.buildroot.net/results/61d7673328a8cf4af639b8608e48b36624dde7e9 |     
 microblaze  |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/0ac1fec1be0e762367a39152e2e5251247a97d83 |     
   arceb     |          reaver-1.6.6          | NOK | http://autobuild.buildroot.net/results/40ad7a8a1e783574ef26cb0ee4af28150c9e6449 |     
 powerpc64   |         rocksdb-6.20.3         | NOK | http://autobuild.buildroot.net/results/8382372bbbab97337ec77a6049fa8e452429d918 |     
   x86_64    | rtl8189fs-ed6741b52bc998875... | NOK | http://autobuild.buildroot.net/results/a1c4c386e60a082d30cae686b9e1d27d01046266 |     
   sparc     | rtl8189fs-ed6741b52bc998875... | NOK | http://autobuild.buildroot.net/results/9ac05dc19a200395aed4882b96764c724c28d45a |     
    mips     | rtl8821au-0cab870ff635ba038... | NOK | http://autobuild.buildroot.net/results/cadd607132b1efd217bfffdf1a415df9218ebe9c |     
   sh4aeb    |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/66d40343a2540f404f7bfda0049c11bedc303e1c | ORPH
  mips64el   |          snmppp-3.5.0          | NOK | http://autobuild.buildroot.net/results/7bab5993e32647455dbfe8d0cb039810f53696dc |     
   sh4aeb    |          snmppp-3.5.0          | NOK | http://autobuild.buildroot.net/results/0a47028b6cf93d77d926b2954a344be7a6cfe03f |     
   x86_64    |          snmppp-3.5.0          | NOK | http://autobuild.buildroot.net/results/c8842199650a98075566800ea4725d3f243ef906 |     
  aarch64    |          snmppp-3.5.0          | NOK | http://autobuild.buildroot.net/results/461acb4745d4aaa407e3c4960baabf7b90648ba2 |     
  aarch64    |          snmppp-3.5.0          | NOK | http://autobuild.buildroot.net/results/d59c4b7f50207190dc65434cfde86c8696778a84 |     
   nios2     |          snmppp-3.5.0          | NOK | http://autobuild.buildroot.net/results/b4c4376c1d39157f2d153f720e7cc9bd2b31af61 |     
   sparc     |          snmppp-3.5.0          | NOK | http://autobuild.buildroot.net/results/3c6618f7faccaa3609c110ae7d6eea4ab2ea204a |     
    m68k     |          snmppp-3.5.0          | NOK | http://autobuild.buildroot.net/results/a8c3e76defaced4e932995ef9be002f7597b280a |     
   arceb     |          snmppp-3.5.0          | NOK | http://autobuild.buildroot.net/results/b83368f896628ba7aed3234f09cab624db8e0cbe |     
   armeb     | uclibc-ng-test-6790eafe897b... | NOK | http://autobuild.buildroot.net/results/ab7fb8a1aa7fdef7158ae2019f6453946694b52c |     
  mips64el   | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/a517e1bf9d11449f74c5c52a1952ffdb76c460ee |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.net/results/d17fab2e23495f33e938057ebc61ac2176745dab |     
 aarch64_be  |            unknown             | NOK | http://autobuild.buildroot.net/results/76f61c7f49e512c9b54dc3543878d3068af5cddd |     
 aarch64_be  |            unknown             | NOK | http://autobuild.buildroot.net/results/6f0dfdef030a1dbf946162028b7913bc28d690aa |     
   s390x     |            unknown             | NOK | http://autobuild.buildroot.net/results/4c5bdddf3f397c86554c7bd12220d1ebd01e6173 |     
  riscv32    |            unknown             | NOK | http://autobuild.buildroot.net/results/07665879ce486c1130565e361e6f1732606dec6f |     
   sparc     |            unknown             | NOK | http://autobuild.buildroot.net/results/34085087640b9a2a90778613d61b30c4c2712269 |     
 microblaze  |            unknown             | NOK | http://autobuild.buildroot.net/results/59ca54ec3e6a56a13fccebb3bc967731291a4c8a |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/2021d7af343e603b1051e255bc6c9b72f8e13ca1 |     
 powerpc64   |            unknown             | NOK | http://autobuild.buildroot.net/results/bfa9cf6b57643172fa61cc2d0ddfe87a38271ece |     
    mips     |            unknown             | NOK | http://autobuild.buildroot.net/results/e334c5634bf43a89f647fe2f2af32a8def8105aa |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/eadf94e3a2b74035fee95654ccdf7695db174091 |     
   sparc     |      v4l2loopback-0.12.7       | NOK | http://autobuild.buildroot.net/results/8bf4adcb0a3d1ec953ba4f12208c89a9b5b0bd13 |     
  mips64el   |           vdr-2.6.3            | NOK | http://autobuild.buildroot.net/results/e23534acc987c5fbd598d4c8638f242515c30834 |     
  sparc64    | wireguard-linux-compat-1.0.... | NOK | http://autobuild.buildroot.net/results/fae0b1c0ef6d282e9297beea3ae678c8f206e051 |     
  mips64el   |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/d1f47b572480d82f8f5f19873b5c9a78fecf3a6e |     


Classification of failures by reason for 2023.02.x
--------------------------------------------------

                host-go-1.19.7 | 2 
                alsa-lib-1.2.8 | 1 
glibc-2.36-81-g4f4d7a13edfd... | 1 
            host-binutils-2.37 | 1 
            host-binutils-2.38 | 1 
                lesstif-0.95.2 | 1 
                   opensbi-0.9 | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |         alsa-lib-1.2.8         | NOK | http://autobuild.buildroot.net/results/10fdb853b18a99ae6c89759bf292067caa6fe240 |     
  powerpc    | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/76ef7ef74276af3b902e633e00c62c592f19caae |     
  riscv32    |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/c43a0802ae73cd9b2e535680cdb204013f2f2734 |     
    i686     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/6084917e037fcf32fe2e22cd482e6dac8bd91e20 |     
    i686     |         host-go-1.19.7         | NOK | http://autobuild.buildroot.net/results/65f64702a8a4488c75825f6bb1e11b4eb7f5a248 |     
    i686     |         host-go-1.19.7         | NOK | http://autobuild.buildroot.net/results/1e774bec7322bd1ed618996a7543bef98dc01d65 |     
    sh4      |         lesstif-0.95.2         | NOK | http://autobuild.buildroot.net/results/7eabcd8731cf498c51e2c8224365143c5b90c07c | ORPH
  riscv32    |          opensbi-0.9           | NOK | http://autobuild.buildroot.net/results/3ad1f6927deacb5758f5bf068fa1168b402ca35b |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
