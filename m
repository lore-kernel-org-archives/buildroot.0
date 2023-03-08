Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB0DFC64EC4
	for <buildroot@archiver.kernel.org>; Wed,  8 Mar 2023 08:12:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0F14F400B9;
	Wed,  8 Mar 2023 08:12:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0F14F400B9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jordDa4y5Jw9; Wed,  8 Mar 2023 08:12:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 637AE4012F;
	Wed,  8 Mar 2023 08:12:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 637AE4012F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1AAD31BF844
 for <buildroot@lists.busybox.net>; Wed,  8 Mar 2023 08:12:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E7D1B61100
 for <buildroot@lists.busybox.net>; Wed,  8 Mar 2023 08:12:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E7D1B61100
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KJxLsaGq1qIt for <buildroot@lists.busybox.net>;
 Wed,  8 Mar 2023 08:12:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5A67860AEA
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5A67860AEA
 for <buildroot@buildroot.org>; Wed,  8 Mar 2023 08:12:20 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 871CF24000A
 for <buildroot@buildroot.org>; Wed,  8 Mar 2023 08:12:17 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Wed, 08 Mar 2023 08:12:17 -0000
Message-Id: <20230308081223.E7D1B61100@smtp3.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1678263137; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=43SNG/SEuUfYEw7LwlNAdYesfaZ5d6Rcw1IxwEIYTgU=;
 b=NCKhfkR/kH1iIlp17PNHbXngcArx5clEGV/If1e/m6PZ3QMB9wMjUjpYv8v9L4+KhdVHOE
 LgqDRa5fxIF2p+f4B2+1XzmWZ1dRnezG/8vWwpjijYMS2/x1FMoXUnL8wqDOEgK5bcTbTe
 iM7/TWm5B59qT7U3Ub30j4DHemPu6a4+aNomk9YZO3pFqQELNmkRL+UR5HK3UVS7MPA+oK
 i2X7TAG+fDI6St4yaW5kU7/LJlCzXPHHq58oQYv2+2dAb80l+3Uj106tTG6YVi7NwnxArB
 pXYW+GV4hfBvMsVmi/CEKxVZZQnHpxdc0/3A3Td5W2e0TLJmrBwutZApmcF67A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=NCKhfkR/
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-03-07
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

Autobuild statistics for 2023-03-07
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.11.x  | 12  |  8  |  0  | 20  |
    master   | 134 | 134 |  3  | 271 |
     next    | 11  | 22  |  0  | 33  |

Classification of failures by reason for master
-----------------------------------------------

host-go-bootstrap-1.4-boots... | 38
           host-libzlib-1.2.13 | 9 
              host-pahole-1.24 | 9 
  gobject-introspection-1.72.0 | 6 
              host-rust-1.67.0 | 5 
                elfutils-0.186 | 4 
                       unknown | 4 
glibc-2.36-81-g4f4d7a13edfd... | 3 
         gobject-introspection | 3 
               libglib2-2.72.3 | 3 
             fontconfig-2.13.1 | 2 
            host-binutils-2.38 | 2 
         host-gcc-final-11.3.0 | 2 
                    libev-4.33 | 2 
              libgcrypt-1.10.1 | 2 
             libgpg-error-1.46 | 2 
     linux-5.10.162-cip24-rt10 | 2 
                  linux-6.1.14 | 2 
            quickjs-2021-03-27 | 2 
                  acpid-2.0.34 | 1 
                alsa-lib-1.2.8 | 1 
  binutils-arc-2020.09-release | 1 
                busybox-1.36.0 | 1 
                 coreutils-9.1 | 1 
                dbus-cxx-2.3.1 | 1 
                  delve-1.20.0 | 1 
       freeradius-client-1.1.7 | 1 
fs/cramfs/cramfs.mk:46: /ho... | 1 
fs/cramfs/cramfs.mk:46: /ho... | 1 
fs/cramfs/cramfs.mk:46: /tm... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
            host-binutils-2.39 | 1 
                host-go-1.19.6 | 1 
                  kexec-2.0.25 | 1 
libdill-32d0e8b733416208e04... | 1 
        liblog4c-localtime-1.0 | 1 
                 libnss-3.88.1 | 1 
          linux-5.10.162-cip24 | 1 
             netsniff-ng-0.6.8 | 1 
       network-manager-1.40.10 | 1 
                  ntp-4.2.8p15 | 1 
                    olsr-0.9.8 | 1 
                   pcre2-10.42 | 1 
                     php-8.2.3 | 1 
           python-orjson-3.8.4 | 1 
                 rtl_433-22.11 | 1 
              skalibs-2.12.0.1 | 1 
wireguard-linux-compat-1.0.... | 1 
x264-baee400fa9ced6f5481a72... | 1 
                xenomai-3.0.10 | 1 
               xfsprogs-5.14.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |          acpid-2.0.34          | NOK | http://autobuild.buildroot.net/results/fda23c17f65c0ce802c593bf186490888898299e | ORPH
    or1k     |         alsa-lib-1.2.8         | NOK | http://autobuild.buildroot.net/results/838f3cf6f99da200e34a0f6169370a25a915cf33 |     
   arceb     |  binutils-arc-2020.09-release  | NOK | http://autobuild.buildroot.net/results/2cf4480a73419cd1836a07e2719bec5e71e9ccef |     
   mips64    |         busybox-1.36.0         | NOK | http://autobuild.buildroot.net/results/ccbbeb35558fb540172158b0f452212133e9c009 | ORPH
   sh4aeb    |         coreutils-9.1          | NOK | http://autobuild.buildroot.net/results/0718cd8a9a94f33ca6b86dda833835ebef41790d | ORPH
    or1k     |         dbus-cxx-2.3.1         | NOK | http://autobuild.buildroot.net/results/4cf3cc7c74837c168bf4f232f3a19054b82ba51e |     
   x86_64    |          delve-1.20.0          | NOK | http://autobuild.buildroot.net/results/d15c813288ce5b65eec3d2659176f8a54de598e7 |     
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/5a5d0540abd6f9323ed1f208bdd6cbb603b55239 | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/bc2e36549cfaf4d26e4ed2bc7e75b1bc33155fba | ORPH
   arceb     |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/5abde50e1a1265df18aa7a7d2a323f35db98ef97 | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/5314fd97b4fc615ec4699209b00f3880962a2ca6 | ORPH
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/20c75723941721ceaf3480f8ef969b15ccb5612a | ORPH
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/e64697b5eb55736ea348191b18fe28716fefd32f | ORPH
  riscv64    |    freeradius-client-1.1.7     | NOK | http://autobuild.buildroot.net/results/878b69a2eb9ad619ea9461c237c0e0941250a5f5 |     
    or1k     | fs/cramfs/cramfs.mk:46: /ho... | NOK | http://autobuild.buildroot.net/results/8781fe7d2211338a678198cee66cef1a7859c786 |     
  mips64el   | fs/cramfs/cramfs.mk:46: /ho... | NOK | http://autobuild.buildroot.net/results/88c7a7ce1d81667702b1c73ac402b6799aba1fe6 |     
 microblaze  | fs/cramfs/cramfs.mk:46: /tm... | NOK | http://autobuild.buildroot.net/results/98f990b84e5d8102b5c58aa215f816ce0b5bdcca |     
   armeb     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/25fd0b311968c1b336968e11962dca2905443aea |     
 powerpc64   | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/2afbb8372138416b0c6b9a7026acae20f3eb0532 |     
   armeb     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/8b2f567e59f9210f5a502db67c3b1655933c98fd |     
   xtensa    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/e30b0fea26215bd38f40c1fbcffd80eda23fcdd1 |     
    arc      | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/41f5d04cec67594712eb04817993e523ad71f21d |     
  powerpc    | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/52eb1c95032968a8e93242e73c1ab5a74bf84e7d |     
  powerpc    | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/c5da4440ba52a11438b92b863c525eb8fc450c30 |     
   armeb     |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/180014d4727c4c4f371eaedc600dcb9228109a85 |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/ae4ca8cb35a57d6c9a6404f27066f2adcf8af4ba |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/0b3e258368a89423dc215b41e7517de7d17e0b86 |     
microblazeel |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/11703d91cce98bdddd8e246f0bfaa041d98359b7 | ORPH
    or1k     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/191abe1e1fa1fe566ebff36123c3a37e6c30908d | ORPH
 powerpc64   |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/e183362db9a4b4914be4411bca2b3427e15f2a96 | ORPH
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/85d94705ef501a1eb7db902ae33bb42fdf445bf8 | ORPH
    or1k     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/113e39a8b0d7fb4d31b8fc798c0da4471cc3fe78 | ORPH
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/cceadf82ac9420cf579b8f94bf012b65d5fb29e7 | ORPH
    arc      |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/7f1453ec83a158c9c682b74b958047ea372360e6 |     
    arm      |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/1a1c13c43f69e8069f05f7d6d43754f97999859f |     
   x86_64    |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/b6a80880c8ad1b0f496f327934c89a59ebeec239 |     
    arm      |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/d6f86d0221c5b5e6f3d398fa58c72addc032faca |     
   armeb     |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/2aa602933ac8885f625751616a25a59406521441 |     
  mips64el   |         host-go-1.19.6         | NOK | http://autobuild.buildroot.net/results/4acef1a65baa9f1b8646ead81528d143fcaeefa9 |     
   x86_64    | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/6449940ec9ad2c7548e4c074e7759a81daaa6c92 | ORPH
   x86_64    | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/e076c4d473286c92a25fc90035b09da5c024fe08 | ORPH
   s390x     | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/2ba6adb8f51b363942ce22cc8ff4afe611192574 | ORPH
  riscv32    | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/9968f46f4f1bebd45e8954d1839b9f0f559d9502 | ORPH
    m68k     | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/dafe2311151752bf16b35263f89591d38fa866f4 | ORPH
   mipsel    | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/972249b65e8f3c93f3f96de33b6d76385e650ed9 | ORPH
 microblaze  | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/bc3fcb5f9dc8f5770723865203471c65b9d8d807 | ORPH
  aarch64    | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/f10272c8db30925b4537d16db85c6ea0b2d539d1 | ORPH
  aarch64    | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/d2dec2d412193659f41c29762c5be704d913fb58 | ORPH
   nios2     | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/26f4e4a857649ff92c046092d04fededaad4cb58 | ORPH
 microblaze  | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/68b4ca54d82e8c46f50c3ac38f667cf435af176b | ORPH
  mips64el   | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/0097695d7a03a48cf2cc8f7a0413d4781558e784 | ORPH
   nios2     | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/fa68d319342e08cdc27cbe2c778417cb59ce36f7 | ORPH
    mips     | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/70919aa910e18d222156a1c416b299b13d70d984 | ORPH
 aarch64_be  | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/f77f21ddf2b198585e4dbd04c7b32e7eb4fa9dd9 | ORPH
   arceb     | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/3dd8384b5194ae7619743fd6048a81b1c1108399 | ORPH
powerpc64le  | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/072e126ad843f47bab24f3ba547ad1da760ac4e7 | ORPH
    m68k     | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/3b959f5af558e710a679581bea0d6caef2e5e9c2 | ORPH
  mips64el   | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/faa39807daef608391890abe04145d99c969aadc | ORPH
   nios2     | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/65de4eb6eb717db3061853021a90b1bff0b5171a | ORPH
 microblaze  | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/48e728f9bec0b03ff7729bb31672416d8541eb45 | ORPH
  aarch64    | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/dc717eb20df77de116a7a116432fa0f724e7de98 | ORPH
powerpc64le  | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/162862b0174a0bc1a325a3ae143e17507921b694 | ORPH
   mipsel    | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/3ecb0143c54f3f8c14d0d6d7a441df70d6afa174 | ORPH
 aarch64_be  | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/786ed11dc76a0645d2e430a173d3ec8e5a203b30 | ORPH
   mips64    | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/a240bb6b0ea053d20dc0eea10b7e6ff447ba33bd | ORPH
 microblaze  | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/e3523cd5c90f6e16961a810eedf8f10bec321bb5 | ORPH
powerpc64le  | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/b65ced5ce17010d9961a5598f85e0803bf927d61 | ORPH
 aarch64_be  | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/b54af3d79bf7f75b6c49774691abdc5d15f64686 | ORPH
   mips64    | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/3964030038197f790bb51666c7040adf56a1a2df | ORPH
   x86_64    | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/552f2408e6bced486d3571775f25a7764258ad4c | ORPH
  powerpc    | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/1a5956428f56616b717ed7ab475fda7b0b579288 | ORPH
    mips     | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/7ea4b679a3d235538a790b5c94bea1c4d69bb7a9 | ORPH
    i686     | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/6b56796da53dcf524f2b684635e72333569d6c66 | ORPH
    i686     | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/743ebb7705450f998689424e68f63051e611b2a9 | ORPH
   s390x     | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/cfc2232df2f58058c67009565b867bfd4c01426a | ORPH
    or1k     | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/7cbeeaba2ff8c8ef602039e3fad9b565b3157626 | ORPH
  aarch64    | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/d386e764d091d0c4abcb7e43b0a8a5760184be17 | ORPH
   sh4eb     |      host-libzlib-1.2.13       | NOK | http://autobuild.buildroot.net/results/19f0de30899523a9e89e842de9bcc46027196089 | ORPH
   nios2     |      host-libzlib-1.2.13       | NOK | http://autobuild.buildroot.net/results/34295a5852ba795110c002e8679865149d138b6f | ORPH
powerpc64le  |      host-libzlib-1.2.13       | NOK | http://autobuild.buildroot.net/results/fe20de915eb833d10ddc45260bb5ce8ce6e1168f | ORPH
   mips64    |      host-libzlib-1.2.13       | NOK | http://autobuild.buildroot.net/results/9855ce3dce5bc3c7b452e8fd977a00432a440fdf | ORPH
microblazeel |      host-libzlib-1.2.13       | NOK | http://autobuild.buildroot.net/results/56d889a9e2b9b3202950830be342d7f7c1f85b5c | ORPH
  riscv32    |      host-libzlib-1.2.13       | NOK | http://autobuild.buildroot.net/results/bc562bc67d6e2d4bdaa14fdd074c2338047c0541 | ORPH
    or1k     |      host-libzlib-1.2.13       | NOK | http://autobuild.buildroot.net/results/430bc610ffaf4b20e169a67807f5fc236e0dae22 | ORPH
   s390x     |      host-libzlib-1.2.13       | NOK | http://autobuild.buildroot.net/results/1b8535925c1eba27a9670529a87ace151ab0a075 | ORPH
   x86_64    |      host-libzlib-1.2.13       | NOK | http://autobuild.buildroot.net/results/9b8c550a570621b977816630c95c2f355a6ed3ae | ORPH
    mips     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/ae62dedefa10e9e2ec13fd28015fa6be66f0e8e6 |     
    arm      |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/262780eb6f6b85f367cffc6176a41778030fd740 |     
    arm      |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/f6b852b908aac276497aced98aa120551f853d2c |     
 aarch64_be  |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/5b766c2b5d3a7cda4751e94e2e274cea2951ed2d |     
microblazeel |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/decf0b5711c41c426ea29440e9fefd7a9270b366 |     
  powerpc    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/b760d90b82d1f060fb924863770af6e886f5c1d1 |     
   s390x     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/6df15cf51b855b8cd59fb9ff4798598a698a93c8 |     
 microblaze  |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/0d9fad4aa9a0008234720b0823c8b8276a54dcfe |     
   mips64    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/b35ddd93c13f66b8fc45258efac52493e44e84e2 |     
   mipsel    |        host-rust-1.67.0        | NOK | http://autobuild.buildroot.net/results/106d2e3228f64f3c0d12a3f4d68dafb689706ee4 |     
    mips     |        host-rust-1.67.0        | NOK | http://autobuild.buildroot.net/results/b83a98b13d3a9b8adaae3c2217f85af4b47c97d3 |     
   x86_64    |        host-rust-1.67.0        | NOK | http://autobuild.buildroot.net/results/3c8295e74c7645f8df557530d91f35da6641399c |     
powerpc64le  |        host-rust-1.67.0        | NOK | http://autobuild.buildroot.net/results/1e2a22963d9dfc4cf1a387a08950318ad14a4744 |     
   x86_64    |        host-rust-1.67.0        | NOK | http://autobuild.buildroot.net/results/d65267184cd79706f1e167dce6e0afb65238a997 |     
    arm      |          kexec-2.0.25          | NOK | http://autobuild.buildroot.net/results/6bfc12c5fa5eac2125827594a3d3dced7e531b74 | ORPH
   armeb     | libdill-32d0e8b733416208e04... | NOK | http://autobuild.buildroot.net/results/efc98c3ed474af59a2da279e33d0095201fddc7d |     
   armeb     |           libev-4.33           | NOK | http://autobuild.buildroot.net/results/a7574572a91d781dc77e0e997bc173664d5f3962 | ORPH
   armeb     |           libev-4.33           | NOK | http://autobuild.buildroot.net/results/222f08195bcdd6b11379319215cf696d343f88a2 | ORPH
    i586     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/5af09d2e81a757ea18880987c8e55156b66d2513 | ORPH
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/a0149a3b111b6263423e59355dc4de15fdb1ef34 | ORPH
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/9a49f7666fcfcdef23570a1f59ec426663ddb338 |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/214725d0c4d092fab1284bb8109eef08da391498 |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/5e5e6ac0e4ea0ebacb8827f21c39564058945c5b |     
 aarch64_be  |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/0806f16fb16c1637c6005a11cdb4889b2f359ad3 | ORPH
 aarch64_be  |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/36eb52a77c807d5b6192e0709ea7c5fe3ce5e721 | ORPH
  riscv64    |     liblog4c-localtime-1.0     | NOK | http://autobuild.buildroot.net/results/1a6db7f3de29a545eee53225e97849226b5fbad4 |     
   sh4aeb    |         libnss-3.88.1          | NOK | http://autobuild.buildroot.net/results/1f970cf6491d46c063720326e110894ad398c56d |     
  mips64el   |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/c7c21cb5254b4167dd2e2fe5b16f8f1623ad9444 | ORPH
    m68k     |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/f7521de60b0054e225403a983d52180ca079926d | ORPH
   mips64    |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/20cecb00a7617338724eefc4694c08d5208154b1 | ORPH
   xtensa    |          linux-6.1.14          | NOK | http://autobuild.buildroot.net/results/586846d6c64cb1bd284b50f2f7eccd04dfb804fc | ORPH
   sparc     |          linux-6.1.14          | NOK | http://autobuild.buildroot.net/results/fa1a7a394b6bddfd092d0e34de90cb4990f82890 | ORPH
  sparc64    |       netsniff-ng-0.6.8        | NOK | http://autobuild.buildroot.net/results/640b910ee75e8123f78b8bf50d9e02d32175e0b0 |     
   nios2     |    network-manager-1.40.10     | NOK | http://autobuild.buildroot.net/results/a0a314ea3ae1db9b353090054cd9f9899e483bf4 | ORPH
  riscv64    |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/7020c3ff47bd06fede453ee6f1a5924d184dbcaa | ORPH
    mips     |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/fb0a1e5e5b373bcaadcd6ee149ee47d812ac06a4 | ORPH
powerpc64le  |          pcre2-10.42           | NOK | http://autobuild.buildroot.net/results/a7ebb2424e095c76b1330a1c690f668753ae3611 | ORPH
   sparc     |           php-8.2.3            | NOK | http://autobuild.buildroot.net/results/bb65d08d591a0a28c0f9868f6cbcee7e8cdb4418 |     
    mips     |      python-orjson-3.8.4       | NOK | http://autobuild.buildroot.net/results/dc45ef40f2d1f9e35ede5807f4d1930962c2b2af |     
microblazeel |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/63de7626d66b64a79fc9c903d48043b856031fdc |     
microblazeel |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/54ed61b250023f7708c0a0b52a9d3fea71904a9f |     
    arc      |         rtl_433-22.11          | NOK | http://autobuild.buildroot.net/results/9bc3309fb6f8645b572f7aab2eccd56b1ed7b4d5 |     
    or1k     |        skalibs-2.12.0.1        | NOK | http://autobuild.buildroot.net/results/3b554b3f6ae43d4d2185a197618bda989832b240 |     
    mips     |            unknown             | NOK | http://autobuild.buildroot.net/results/1dc33addfa8e7c0f790c95143579f685d83f33db |     
   arceb     |            unknown             | NOK | http://autobuild.buildroot.net/results/f0e8584159859b46b5daab23a997b893884aa8fb |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/0055a273c2c5b0485192498ce49093cc32364c64 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/dd44b4382131a2204c7cc4c36d19d0afc437bdd7 |     
  mips64el   | wireguard-linux-compat-1.0.... | NOK | http://autobuild.buildroot.net/results/bd74017bd581b88f2443ece8ef72ba3b72ca8ed3 |     
    i686     | x264-baee400fa9ced6f5481a72... | NOK | http://autobuild.buildroot.net/results/837b10a97169d08afffeb33ccca7c20287480ec8 |     
   mipsel    |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/7c226d6db44f734b45f76f46b837613421df4b5b |     
   nios2     |        xfsprogs-5.14.2         | NOK | http://autobuild.buildroot.net/results/8f951178bafa163f39cfd28ccf43a14fa05e19c7 | ORPH


Classification of failures by reason for next
---------------------------------------------

                host-go-1.19.6 | 3 
glibc-2.36-81-g4f4d7a13edfd... | 2 
                alsa-lib-1.2.8 | 1 
                busybox-1.36.0 | 1 
                   bzip2-1.0.8 | 1 
                elfutils-0.186 | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
                 haproxy-2.6.5 | 1 
              host-pahole-1.24 | 1 
              host-rust-1.67.1 | 1 
                  libjxl-0.7.0 | 1 
          linux-5.10.162-cip24 | 1 
                  netsurf-3.10 | 1 
                    olsr-0.9.8 | 1 
                   perl-5.36.0 | 1 
                 systemd-252.4 | 1 
                     tmux-3.3a | 1 
                       unknown | 1 
                     zfs-2.1.7 | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |         alsa-lib-1.2.8         | NOK | http://autobuild.buildroot.net/results/b84a4123923169a022cc4a20e2ce7f54b01a63f5 |     
   mips64    |         busybox-1.36.0         | NOK | http://autobuild.buildroot.net/results/391b78b6cdcfc43a2d95e1d4ccb5f98c8af805f6 | ORPH
  mips64el   |          bzip2-1.0.8           | NOK | http://autobuild.buildroot.net/results/a22ebfca705cd144932865e5d71efbe65a16cfe2 | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/0b8b1dc1b472356fe60cd2cf50742be6c0768ca9 | ORPH
  powerpc    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/712f5dd0ccb4db44671c796a4cbe4c7afc54358e |     
   armeb     | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/cd8bbff7827fe749ee3cda58293d991a0706aa15 |     
 powerpc64   | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/d709c19f1570058fdd4b6da552ba7a3562ed763c |     
    sh4a     |         haproxy-2.6.5          | NOK | http://autobuild.buildroot.net/results/1d1830873d648f9aac8944ccfbcc3dfeedc40142 |     
    i686     |         host-go-1.19.6         | NOK | http://autobuild.buildroot.net/results/10507f3d99c428d8d22e22c032549acf08aab307 |     
  mips64el   |         host-go-1.19.6         | NOK | http://autobuild.buildroot.net/results/50a34e17313a1cacceb11aea6105cdb677ee664c |     
  mips64el   |         host-go-1.19.6         | NOK | http://autobuild.buildroot.net/results/fe13e9153b71aeb85028cb20c019d5356453bee7 |     
  sparc64    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/7bf778f53cebec31c72e5674c839b62d9af94f89 |     
    mips     |        host-rust-1.67.1        | NOK | http://autobuild.buildroot.net/results/c660c2c10e556c3b38b4cdffb1857002909fbb0e |     
   armeb     |          libjxl-0.7.0          | NOK | http://autobuild.buildroot.net/results/f41a02c6a9478625293952a350c3450490e8a364 |     
   mipsel    |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/4a1bbd3768d844dfc5d1f07531df9bedb6396c41 | ORPH
   arceb     |          netsurf-3.10          | NOK | http://autobuild.buildroot.net/results/0203826f273148aa0b1e4241d7a9662e4a3a08aa |     
 powerpc64   |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/18d4f7a2739df306781cefd45ad3cf13e07759da | ORPH
   sparc     |          perl-5.36.0           | NOK | http://autobuild.buildroot.net/results/49c278de928cdcc71be72e96db984eaf35e94b7e |     
    sh4a     |         systemd-252.4          | NOK | http://autobuild.buildroot.net/results/bdbf5ca47dd0c295e479e4d0a44d2b58455e2b98 |     
    sh4      |           tmux-3.3a            | NOK | http://autobuild.buildroot.net/results/f2e453d275561051250a1f610086feec18feb0cd |     
  sparc64    |            unknown             | NOK | http://autobuild.buildroot.net/results/dcba85ba05800d6be2b9fc21a0dda067da48ed56 |     
    arc      |           zfs-2.1.7            | NOK | http://autobuild.buildroot.net/results/c2da90337463607c2fadfeac7ad72e5c3899a61f |     


Classification of failures by reason for 2022.11.x
--------------------------------------------------

             dahdi-linux-3.2.0 | 1 
                gnu-efi-3.0.15 | 1 
                host-go-1.19.6 | 1 
              libgcrypt-1.10.1 | 1 
             lirc-tools-0.10.2 | 1 
                     tmux-3.1c | 1 
                       unknown | 1 
                  xvisor-0.3.1 | 1 


Detail of failures for 2022.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |       dahdi-linux-3.2.0        | NOK | http://autobuild.buildroot.net/results/227023c8aa3ac3f057c8c500208a84c6adb47933 |     
  mips64el   |         gnu-efi-3.0.15         | NOK | http://autobuild.buildroot.net/results/691aa6e80b1bde6af1899f7a319e119732fd1d34 |     
   mips64    |         host-go-1.19.6         | NOK | http://autobuild.buildroot.net/results/6245196ef3524171a7ff08c3883524122f8bd1ee |     
   armeb     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/75fac7bfb49a438d7ed920c436a8bd4afa192c14 | ORPH
   mipsel    |       lirc-tools-0.10.2        | NOK | http://autobuild.buildroot.net/results/70ccdf3438b9b0e381c7fd22087d9bab5d063451 | ORPH
powerpc64le  |           tmux-3.1c            | NOK | http://autobuild.buildroot.net/results/880474095df71145e83be269f0b5774434847ba4 |     
  sparc64    |            unknown             | NOK | http://autobuild.buildroot.net/results/18984deae061b5296db21ba04237eb8258f4964d |     
  riscv32    |          xvisor-0.3.1          | NOK | http://autobuild.buildroot.net/results/7691da12580db492515823c845002bb2e8bd07b5 |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
