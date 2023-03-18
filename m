Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59213C74A5B
	for <buildroot@archiver.kernel.org>; Sat, 18 Mar 2023 06:47:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7AAE440119;
	Sat, 18 Mar 2023 06:47:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7AAE440119
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2CM5LrWuelLk; Sat, 18 Mar 2023 06:47:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DFAB640147;
	Sat, 18 Mar 2023 06:47:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DFAB640147
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 731991BF57C
 for <buildroot@lists.busybox.net>; Sat, 18 Mar 2023 06:47:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2E5B5416E8
 for <buildroot@lists.busybox.net>; Sat, 18 Mar 2023 06:47:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2E5B5416E8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id afIEN7NgmkY7 for <buildroot@lists.busybox.net>;
 Sat, 18 Mar 2023 06:47:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6FD29416E4
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6FD29416E4
 for <buildroot@buildroot.org>; Sat, 18 Mar 2023 06:47:17 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 58242E000E
 for <buildroot@buildroot.org>; Sat, 18 Mar 2023 06:47:14 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sat, 18 Mar 2023 06:47:14 -0000
Message-Id: <20230318064721.2E5B5416E8@smtp4.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1679122034; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=VWUQ80GG9zNSVZvwbANAIjE9bs9JuMDhNd/1mYkQ0Co=;
 b=ZDpH4cYNsH3E5vBBVYvYwSywPPb2ujugn+sdCFApoZXnZu1G0lD2LlFZ22SFxVAqGGUInp
 KqB2JV9HYXSkdhWdBZkH6jNaHflHF7mPNqCrrXVJQYvParTdLRvg1SRyfcBvZ5+sZ1DCmP
 zT3BTORhsCU60lCJQihD06+wBOzqdryDgVXC+C7/PEdvjjYN43nK6qTsMnpCwqWgXtBcKg
 htpyr0T0usEuUl510LWX2ERk83ZHMzHZIoCh/F6TzglAPP9eHl4+8x/8fiujgS+ehSn1+C
 shMT0edJAO0k91t8/3Cd3wnq4iNhS4vqLwc8CgCB15al/fJ+uPMvCBgQw0UqVQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ZDpH4cYN
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-03-17
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

Autobuild statistics for 2023-03-17
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.11.x  | 15  | 11  |  0  | 26  |
    master   | 224 | 183 |  1  | 408 |

Classification of failures by reason for master
-----------------------------------------------

             bluez5_utils-5.66 | 32
                       unknown | 11
  gobject-introspection-1.72.0 | 9 
                   perl-5.36.0 | 9 
                host-go-1.19.7 | 8 
                  linux-6.1.14 | 8 
glibc-2.36-81-g4f4d7a13edfd... | 4 
                     gmp-6.2.1 | 4 
            host-binutils-2.38 | 4 
                    olsr-0.9.8 | 4 
            quickjs-2021-03-27 | 4 
                elfutils-0.186 | 3 
            host-binutils-2.37 | 3 
            host-binutils-2.39 | 3 
              host-rust-1.67.1 | 3 
                libglvnd-1.4.0 | 3 
            ocf-linux-20171122 | 3 
                busybox-1.36.0 | 2 
host-gdb-arc-2020.09-releas... | 2 
               libcap-ng-0.8.3 | 2 
              libgcrypt-1.10.1 | 2 
     linux-5.10.162-cip24-rt10 | 2 
                     php-8.2.3 | 2 
                    bat-0.19.0 | 1 
                  bind-9.16.38 | 1 
  binutils-arc-2020.09-release | 1 
                  boost-1.80.0 | 1 
                    brltty-6.5 | 1 
                  cairo-1.16.0 | 1 
                  cmocka-1.1.5 | 1 
                 coreutils-9.1 | 1 
             f2fs-tools-1.15.0 | 1 
             fontconfig-2.13.1 | 1 
fs/cramfs/cramfs.mk:46: /ho... | 1 
fs/ubi/ubi.mk:51: /home/aut... | 1 
fs/ubi/ubi.mk:51: /home/aut... | 1 
fs/ubi/ubi.mk:51: /home/tho... | 1 
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
fs/ubifs/ubifs.mk:49: /tmp/... | 1 
fs/ubifs/ubifs.mk:49: /tmp/... | 1 
fs/ubifs/ubifs.mk:49: /tmp/... | 1 
fs/ubifs/ubifs.mk:49: /tmp/... | 1 
              fstrcmp-0.7.D001 | 1 
glmark2-06e78b67702b5413335... | 1 
         gobject-introspection | 1 
             gst1-vaapi-1.22.0 | 1 
         host-gcc-final-11.3.0 | 1 
               host-runc-1.1.4 | 1 
jq-a17dd3248a666d01be75f6b1... | 1 
                       kmod-30 | 1 
               libglib2-2.72.3 | 1 
          lttng-modules-2.13.7 | 1 
               madplay-0.15.2b | 1 
                  matio-1.5.23 | 1 
                    musl-1.2.3 | 1 
                  nginx-1.22.1 | 1 
                  ntp-4.2.8p15 | 1 
   openvmtools-11.3.5-18557794 | 1 
    python-cryptography-39.0.1 | 1 
           python-pyicu-2.10.2 | 1 
             s390-tools-2.26.0 | 1 
                 snmppp-3.4.10 | 1 
toolchain-external-codescap... | 1 
              traceroute-2.1.0 | 1 
wireguard-linux-compat-1.0.... | 1 
                 wolfssl-5.5.3 | 1 
                xenomai-3.0.10 | 1 
               xfsprogs-5.14.2 | 1 
                    zeek-4.1.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    mips     |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/164cd629fecaa4deb9b0038b67672c37a61b45b8 |     
   sh4eb     |          bind-9.16.38          | NOK | http://autobuild.buildroot.net/results/8db282ff19f970ae1643f0e12ca5ebbddec32338 | ORPH
   arceb     |  binutils-arc-2020.09-release  | NOK | http://autobuild.buildroot.net/results/29cc8efd74423215d0869668f715f68906086d44 |     
   s390x     |       bluez5_utils-5.66        | NOK | http://autobuild.buildroot.net/results/f329502ac699ca33697aba32e105e60c0f64c96e |     
  powerpc    |       bluez5_utils-5.66        | NOK | http://autobuild.buildroot.net/results/029272b68840a301590f8eea6071666a2d98c5bd |     
    mips     |       bluez5_utils-5.66        | NOK | http://autobuild.buildroot.net/results/4f840260c1e243f183fa49a2ea22ab08122730d4 |     
 powerpc64   |       bluez5_utils-5.66        | NOK | http://autobuild.buildroot.net/results/efa7f535b976578b9b8113bb2497949ee354b06d |     
 aarch64_be  |       bluez5_utils-5.66        | NOK | http://autobuild.buildroot.net/results/f95a181793218d34520e15fb055902a5927861de |     
  powerpc    |       bluez5_utils-5.66        | NOK | http://autobuild.buildroot.net/results/d5f1663f37443533d5e6150baa85e3266b013230 |     
   mips64    |       bluez5_utils-5.66        | NOK | http://autobuild.buildroot.net/results/e5f92dac6c2fa1e6669cacf99e093f320d074c86 |     
powerpc64le  |       bluez5_utils-5.66        | NOK | http://autobuild.buildroot.net/results/85a6d040bee2c44ec7630a5eefb0c5aa45c7d3ef |     
   s390x     |       bluez5_utils-5.66        | NOK | http://autobuild.buildroot.net/results/8c4edd2deb8eefeed2117c2b8c5a193fe7299c3f |     
  aarch64    |       bluez5_utils-5.66        | NOK | http://autobuild.buildroot.net/results/96bfe6c1148a382be831fb6b189f706f18dcf364 |     
   sh4eb     |       bluez5_utils-5.66        | NOK | http://autobuild.buildroot.net/results/a3cffde87ae45d7d3bd918ad0a55f066cc528070 |     
    mips     |       bluez5_utils-5.66        | NOK | http://autobuild.buildroot.net/results/0de77b869039a940ade2427df47d6dad200d7ec3 |     
   mipsel    |       bluez5_utils-5.66        | NOK | http://autobuild.buildroot.net/results/73df04a30ddf38eaa63a613f3d217884be80bb07 |     
  sparc64    |       bluez5_utils-5.66        | NOK | http://autobuild.buildroot.net/results/f29db89b59f24d4d782919d9bc5e678a32c228a5 |     
  aarch64    |       bluez5_utils-5.66        | NOK | http://autobuild.buildroot.net/results/7d7d681834c513d04830f7d3f067ecac281f27ed |     
  mips64el   |       bluez5_utils-5.66        | NOK | http://autobuild.buildroot.net/results/003de2481733498dfa77663c9668877f45b98209 |     
microblazeel |       bluez5_utils-5.66        | NOK | http://autobuild.buildroot.net/results/b994fcb70ebc5f17c763ae1392f5330ec0838501 |     
   armeb     |       bluez5_utils-5.66        | NOK | http://autobuild.buildroot.net/results/c5956df1bdc57a7bb568b83d1a2be9f4517e5de9 |     
   nios2     |       bluez5_utils-5.66        | NOK | http://autobuild.buildroot.net/results/010866fe99cddaa15994167184e0935ce46b0872 |     
   nios2     |       bluez5_utils-5.66        | NOK | http://autobuild.buildroot.net/results/9f9231732f73e85cc9d1a4aaff902af551afe676 |     
   mips64    |       bluez5_utils-5.66        | NOK | http://autobuild.buildroot.net/results/4536135e400b077ac4f854f83480ac6518fb1bbd |     
powerpc64le  |       bluez5_utils-5.66        | NOK | http://autobuild.buildroot.net/results/c161ecb2ee6dd1467c8954b0ed75f913c7d2439d |     
  sparc64    |       bluez5_utils-5.66        | NOK | http://autobuild.buildroot.net/results/5240762e5258763d3475755c9dad7a1cd20aad42 |     
   mipsel    |       bluez5_utils-5.66        | NOK | http://autobuild.buildroot.net/results/91400dbf5b0273fbf5dc9e14f9c798a39e407811 |     
  sparc64    |       bluez5_utils-5.66        | NOK | http://autobuild.buildroot.net/results/717b95a0019b8d2bfe413ee276b20bad95ab812e |     
    i686     |       bluez5_utils-5.66        | NOK | http://autobuild.buildroot.net/results/061aca0883d6607767fb259faafdb02046727481 |     
powerpc64le  |       bluez5_utils-5.66        | NOK | http://autobuild.buildroot.net/results/1ba6ae6ec29449d1f27b15879a19504c912e039a |     
 aarch64_be  |       bluez5_utils-5.66        | NOK | http://autobuild.buildroot.net/results/caf2be8e2d87d12c345eaa8b89cad1bd9f49ecd1 |     
  mips64el   |       bluez5_utils-5.66        | NOK | http://autobuild.buildroot.net/results/3bb799d4a53233281037e3e6bab14d5e0c5df0e5 |     
    sh4a     |       bluez5_utils-5.66        | NOK | http://autobuild.buildroot.net/results/c2040da85a449a38737cfef22f73219acd2ea9ba |     
   mipsel    |       bluez5_utils-5.66        | NOK | http://autobuild.buildroot.net/results/4cc1dd7122af815482c34611aa6189cee724e51a |     
   armeb     |       bluez5_utils-5.66        | NOK | http://autobuild.buildroot.net/results/1585fb855f256c0f134264b0bd25ee8243e56700 |     
   arceb     |          boost-1.80.0          | NOK | http://autobuild.buildroot.net/results/0952d81f19e5e014bbe638acdf4301e5af18d1e7 |     
   mipsel    |           brltty-6.5           | NOK | http://autobuild.buildroot.net/results/174ea944ed522ef4ebc624c8aef5a46b16d1c718 |     
    mips     |         busybox-1.36.0         | NOK | http://autobuild.buildroot.net/results/2a68057b99bdefe457727686e19d3b0fc838fb9b | ORPH
   mips64    |         busybox-1.36.0         | NOK | http://autobuild.buildroot.net/results/3c07ab32b8365d0ad064b33bdd634b56794efcc1 | ORPH
  powerpc    |          cairo-1.16.0          | NOK | http://autobuild.buildroot.net/results/a987352137a4198ca9eae7d776a7bcbd11db7c6a |     
    arm      |          cmocka-1.1.5          | NOK | http://autobuild.buildroot.net/results/1d9e4f21e33bd7829713eef607aaf4c056674e7a |     
   sh4aeb    |         coreutils-9.1          | NOK | http://autobuild.buildroot.net/results/f2eb7fb6358666c8e2b480d2b231d91d47cf2980 | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/89401e879c2cf21ba05d590404742e05ab677d1f | ORPH
   arceb     |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/d99c8d0178d00c1885cf83c3bc436797beda36dd | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/5049b4e8a3ec867e0b47e331a390d7709b7b5dd7 | ORPH
    or1k     |       f2fs-tools-1.15.0        | NOK | http://autobuild.buildroot.net/results/95dbcd41b439fd60434913fa60e3488d6429ac59 |     
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/0bb7b7f22707753afdacf48e5f784b109acbdc6f | ORPH
  powerpc    | fs/cramfs/cramfs.mk:46: /ho... | NOK | http://autobuild.buildroot.net/results/8d492b2121eb7627d73ccb9b3f2aebb420649326 |     
 powerpc64   | fs/ubi/ubi.mk:51: /home/aut... | NOK | http://autobuild.buildroot.net/results/20382d640133e1c179c458b62bdd8fb662c8b736 |     
 powerpc64   | fs/ubi/ubi.mk:51: /home/aut... | NOK | http://autobuild.buildroot.net/results/8d6a18c5273edd18e314ddbde7b4a84331a33d2d |     
   s390x     | fs/ubi/ubi.mk:51: /home/tho... | NOK | http://autobuild.buildroot.net/results/f8fb4e2ba55b2623c85034178ff739e15744e41c |     
  riscv32    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/cc02bb3167e3c434f4f6e95ee0111bad82d78ddd |     
    sh4a     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/e60c0e489e59cc53a4009dca68b82888031d6bf2 |     
powerpc64le  | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/37fd11b27e8e6858a2fae552c3a3c47d80eb41f4 |     
 aarch64_be  | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/70522027741f486dad259be183351b168994199f |     
 microblaze  | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/ae8b1eccaff918b25721e396d9e76e4341ba61c0 |     
  sparc64    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/e1888c0c98334c7750420ac852a50945bd245141 |     
  aarch64    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/39414968746dec7d45d45073bea6dc06ad0fbf63 |     
 aarch64_be  | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/9d46a77e09b4f855945a543ebf3912a479303d16 |     
  powerpc    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/7f5773f9de55f6532b522905c60d5278b2a21ec9 |     
powerpc64le  | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/3c7a124d5080df2105f538455536b298e82bb46f |     
   sparc     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/af1b5e8fb7ceb78fdcd23fe9d98bd29a342fb95f |     
    or1k     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/08b780f3d5da06570cd97638de110ee59aba3ee1 |     
    mips     | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/6b9862284f8abb8285444ee0b02f3181594e2269 |     
 aarch64_be  | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/af431cb530ab644d23e55094ec56f76b5ad5a372 |     
  mips64el   | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/7a7e3c0010a0bece2558deed0a2dff5e0d466aed |     
   mips64    | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/6f1ffff269849acc849f1b2d37b084c9560966ce |     
    arm      |        fstrcmp-0.7.D001        | NOK | http://autobuild.buildroot.net/results/7a749210ad650370a307f6bf12782c2a620075c8 |     
    arc      | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/d0522b48bc378d98c26277850bf73d17872caa01 |     
  powerpc    | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/673cd4c8e8888bfb5190d9ef8e564d498eb030e2 |     
  powerpc    | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/d6df186ae23ec18b9a83c3c9653ed8aef3fe71d2 |     
  powerpc    | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/fe50ae5bcb1d9ef17d621dc619ba7809f58b8451 |     
  aarch64    | glmark2-06e78b67702b5413335... | NOK | http://autobuild.buildroot.net/results/b300b6b1cdfa76514c34e53fda5fda645e59a311 |     
  riscv64    |           gmp-6.2.1            | NOK | http://autobuild.buildroot.net/results/b661a9fcb02f21fb58a2ee4ecb3e666591661557 | ORPH
  riscv64    |           gmp-6.2.1            | NOK | http://autobuild.buildroot.net/results/d8a045539bf9a9e433ac722673c239eb13b46881 | ORPH
  riscv64    |           gmp-6.2.1            | NOK | http://autobuild.buildroot.net/results/5309d09deeca05a73f68934fdff1fdb3d8d729b7 | ORPH
  riscv64    |           gmp-6.2.1            | NOK | http://autobuild.buildroot.net/results/8beda89712cc187eb73950787f62d077e1a70dbf | ORPH
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/2a33f482d9193170b8357a67201182b5351a1fb5 |     
   x86_64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/ccdb67a0f3fec1252b180abca1919dca76278e46 | ORPH
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/dda1a0ac54bde8a65c6dcd42ba9d39cf609aaf67 | ORPH
 microblaze  |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/d40f92275d8ef6bcfab32d0f4731e1f77896c939 | ORPH
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/d8e73b728a45cb8122892eed32bb77f654b8a993 | ORPH
    or1k     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/0336c04cae3b7f3e45e434d86357b852901f65ce | ORPH
   s390x     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/9d3ee00cef74f3b8131793cff48bfb311a53c70d | ORPH
    or1k     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/5f82a29813227d608e9d57e70d27fac816830736 | ORPH
    or1k     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/2199819a4b1fcbfdd680fddb0ae1c963a689ee5f | ORPH
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/cc3f8ae9f93f0e9ef7ebe91ea462fb614fbf62a8 | ORPH
   s390x     |       gst1-vaapi-1.22.0        | NOK | http://autobuild.buildroot.net/results/ad624cd11d5a1b3346974000ae2b61f4261af02c | ORPH
   s390x     |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/76ada431aaec17bb1b700d3a5ab3efc2f3cb4447 |     
   sparc     |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/b97ab638a46643f00eb6a4d6fdf7d9109f60065b |     
  powerpc    |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/3c514c70b8ec7ab3b7346947eb4079c047c663d2 |     
   nios2     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/15e0b2e88e5b71622bbbabab2d6ad5d212430875 |     
  mips64el   |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/14e1fc6720e63677d6008aa9c013e828b7fda98c |     
powerpc64le  |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/f3cab5be1639eeee5dca9e9956c9a9d2a5e84d34 |     
   mipsel    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/453400dddba29e3bd1c65933fa1b7f8f5878d3a7 |     
   nios2     |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/4503ce09d45b879833a49471401f1736910b16d0 |     
   arceb     |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/049affe5ff5d99c6ebae232fc81ac69622accbd8 |     
microblazeel |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/9670f3914ae1fde1b20d4e43e7f20f12e0d57e07 |     
microblazeel |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/f2e19ae3f09010f716424de721afad9ff8f4fe39 |     
    arc      | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/74f83ce8ddf11d05883cbea0063f21849e4f6fbf | ORPH
   arceb     | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/c46cdbd922e7f5976c08b346c47aba87de8a8470 | ORPH
  mips64el   |         host-go-1.19.7         | NOK | http://autobuild.buildroot.net/results/94a6f8b546f61650bf775e9eb949e8997d2f8b55 |     
   mips64    |         host-go-1.19.7         | NOK | http://autobuild.buildroot.net/results/12d347fd43ec96cf148b953ddf9439d46c6325c9 |     
powerpc64le  |         host-go-1.19.7         | NOK | http://autobuild.buildroot.net/results/23cba623e66bd2a948a1c799f70b42a4c457f6e7 |     
  mips64el   |         host-go-1.19.7         | NOK | http://autobuild.buildroot.net/results/302dbbbe30a247bb69f9da25232c47ffe2938333 |     
powerpc64le  |         host-go-1.19.7         | NOK | http://autobuild.buildroot.net/results/07cc4f051729b5a339eba507c2ad946c789cd02b |     
   mips64    |         host-go-1.19.7         | NOK | http://autobuild.buildroot.net/results/1b51fc2ed11e931b95da67578bec6424107e439d |     
  mips64el   |         host-go-1.19.7         | NOK | http://autobuild.buildroot.net/results/df56e8314d592625f8a4057e5f95c8691dbde522 |     
    i686     |         host-go-1.19.7         | NOK | http://autobuild.buildroot.net/results/7cee96339a55657a02cb8a90236eda72d2306b6e |     
   x86_64    |        host-runc-1.1.4         | NOK | http://autobuild.buildroot.net/results/86fb3271dbc776a5e5ac68d38213670650242928 |     
   x86_64    |        host-rust-1.67.1        | NOK | http://autobuild.buildroot.net/results/80c88be2a11fb76d6c733b76f81f240f358a2175 |     
   x86_64    |        host-rust-1.67.1        | NOK | http://autobuild.buildroot.net/results/7215bfa95010e5e2f732dc8843d9475037769e17 |     
   x86_64    |        host-rust-1.67.1        | NOK | http://autobuild.buildroot.net/results/6501b0adcf2df97eb77bf7f5df3b6920a7352479 |     
    arc      | jq-a17dd3248a666d01be75f6b1... | NOK | http://autobuild.buildroot.net/results/da41e1037d4d8c1a60baca602099aa1dc4924826 |     
   x86_64    |            kmod-30             | NOK | http://autobuild.buildroot.net/results/d3961d8bb62228ae3494f3c2cbc6a184868df0c3 |     
  riscv64    |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/7e9d6d2ce6637b980d92d7b9dd439a5357185be0 |     
  riscv64    |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/cc1928b2b48d626f8aeb25a8052a852ce6344775 |     
    i586     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/400c2007054e04b878cac613f127204411c77789 | ORPH
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/4928e8b07d8ba069665a2ed97cb4cfc4fa083818 | ORPH
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/e8c65c6aa7bfb7225becbd81245ab299ae386c89 |     
  mips64el   |         libglvnd-1.4.0         | NOK | http://autobuild.buildroot.net/results/f8f182ce6d899b942729bfa9317c9c47d313f4ac | ORPH
    m68k     |         libglvnd-1.4.0         | NOK | http://autobuild.buildroot.net/results/a0b224dc26c25b2938eb58cf459a993dc54b97ef | ORPH
   xtensa    |         libglvnd-1.4.0         | NOK | http://autobuild.buildroot.net/results/7fd1b17d354da898471bcda12e7a4e7c3b7eb0a9 | ORPH
    arc      |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/aaef443679340e746773a238ee2a0cb5e1077950 | ORPH
    mips     |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/3ccd4bd6ceedc23f942f52fb6d3773faa403e42a | ORPH
  powerpc    |          linux-6.1.14          | NOK | http://autobuild.buildroot.net/results/d992aaca57e673cf21a670ad8e7e037b4b0bca51 | ORPH
    sh4a     |          linux-6.1.14          | NOK | http://autobuild.buildroot.net/results/63c2c6631b805cf293a6b826d66dd675beb2841c | ORPH
    mips     |          linux-6.1.14          | NOK | http://autobuild.buildroot.net/results/a1e621450f211985d0d2d2c45e9b0757b7879c1f | ORPH
   arceb     |          linux-6.1.14          | NOK | http://autobuild.buildroot.net/results/329d9b1b5e9cbc453a8aa453ecb4de44c387a02a | ORPH
    mips     |          linux-6.1.14          | NOK | http://autobuild.buildroot.net/results/c65f36c6cee382b83810fdb95cb990717c45eccd | ORPH
  mips64el   |          linux-6.1.14          | NOK | http://autobuild.buildroot.net/results/a738bcb3884ac455a88321734e1429cbf2e6247e | ORPH
   arceb     |          linux-6.1.14          | NOK | http://autobuild.buildroot.net/results/8e2b0fe3391c3f4a66cfbff65586268b466bcbbb | ORPH
    mips     |          linux-6.1.14          | NOK | http://autobuild.buildroot.net/results/6ec1a004913e480fb8fa1d5d8c991fde27adc8e4 | ORPH
 microblaze  |      lttng-modules-2.13.7      | NOK | http://autobuild.buildroot.net/results/797c83f978918fe1b35fc74e838cbc0e228aad35 |     
   armeb     |        madplay-0.15.2b         | NOK | http://autobuild.buildroot.net/results/f4085334371965cc7532273d7f62362c4d444334 | ORPH
   nios2     |          matio-1.5.23          | NOK | http://autobuild.buildroot.net/results/fc36cfbe24ba98c405de1953fd444f508e3a55ee |     
  powerpc    |           musl-1.2.3           | NOK | http://autobuild.buildroot.net/results/ae7eb88a7feeab47e96555af0d3a08095b178853 |     
   arceb     |          nginx-1.22.1          | NOK | http://autobuild.buildroot.net/results/edf5045d2d7293882c092383247f16e6a3db6c99 |     
  riscv64    |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/f9e614ac659c466e7573fa466185a2393b85962d | ORPH
microblazeel |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/f85a144f33686dab6d50dacd9aef49879aa3c96d | ORPH
   sparc     |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/99a5771eb8d8f0b312c8b30022d0048a57213a25 | ORPH
    i586     |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/fea91dae451e0d39544d33532184f368b44ceea3 | ORPH
  powerpc    |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/b0a3be2e5b2ff9ad16925f5fb284194a46772e12 | ORPH
   s390x     |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/e5f8d41b07bd5f0409efbceb63d9248779aacbad | ORPH
    or1k     |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/b76fcf561218bb8216b41408fcd79a3a2ec84c95 | ORPH
   sparc     |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/7ecf4021228c7d06b96a0404618772dab45d3152 | ORPH
    i686     |  openvmtools-11.3.5-18557794   | NOK | http://autobuild.buildroot.net/results/4a0c6fc9d578dc2f7b9bf462366cd364093db446 |     
   arceb     |          perl-5.36.0           | NOK | http://autobuild.buildroot.net/results/435dd76c15165b570f84fce64fb6d16b8890e2de |     
   arceb     |          perl-5.36.0           | NOK | http://autobuild.buildroot.net/results/483ee350c6f7ee2c6e7740525391c1f8744bb17e |     
   mipsel    |          perl-5.36.0           | NOK | http://autobuild.buildroot.net/results/6176fcd67a70228caf9e0836d02e322347be8afd |     
    m68k     |          perl-5.36.0           | NOK | http://autobuild.buildroot.net/results/c5cc647d62a71f99b35a38d66b5029eccbf366ac |     
   arceb     |          perl-5.36.0           | NOK | http://autobuild.buildroot.net/results/fecf73b711113be1817445ac6d3542c9241e368c |     
   xtensa    |          perl-5.36.0           | NOK | http://autobuild.buildroot.net/results/e4d9555816271262071a5df84af5d113861f16cc |     
   sparc     |          perl-5.36.0           | NOK | http://autobuild.buildroot.net/results/1f8fcb089d2eae2267c9f77ebeed99c074ab8a38 |     
   mipsel    |          perl-5.36.0           | NOK | http://autobuild.buildroot.net/results/3aa6d322a6297dd17513eb251cd738c8f427de04 |     
   sparc     |          perl-5.36.0           | NOK | http://autobuild.buildroot.net/results/1935303dce8e756d6991830238302b909e7faa7f |     
    arm      |           php-8.2.3            | NOK | http://autobuild.buildroot.net/results/fba6782fea0bfe20467fe7c80ef2194225ecb364 |     
   mipsel    |           php-8.2.3            | NOK | http://autobuild.buildroot.net/results/9f55056e5e0d95fab5c7b804e78894c78878836e |     
   mipsel    |   python-cryptography-39.0.1   | NOK | http://autobuild.buildroot.net/results/212f797535e2fcca3a259dde11aeea7590a1dd59 |     
 aarch64_be  |      python-pyicu-2.10.2       | NOK | http://autobuild.buildroot.net/results/20b601c8e6c5f62e957761858e1e0e7f828c96d6 |     
microblazeel |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/ce957f5da20504b2663839b3c1e50c1cbc8d8b56 |     
   sh4eb     |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/fdd5beaaef2f956e1a1f3583fe13ec0dc8ff390b |     
    sh4      |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/31e19a58295d6ada90b4d06358ad470058c3ee93 |     
    sh4      |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/6b121339d12536267d70cb4bd22564da454c7220 |     
   s390x     |       s390-tools-2.26.0        | NOK | http://autobuild.buildroot.net/results/32aa8f0bece5da2a16d761f175d46c7d3e0a8965 |     
powerpc64le  |         snmppp-3.4.10          | NOK | http://autobuild.buildroot.net/results/d981a2c6884b92cffdc077cffec317a10a788de5 |     
   mipsel    | toolchain-external-codescap... | NOK | http://autobuild.buildroot.net/results/babe050209d7a150b65849dd5631798ef5e22ea0 | ORPH
    or1k     |        traceroute-2.1.0        | NOK | http://autobuild.buildroot.net/results/65438661d73242eca3dec0c620ba4cee143d8913 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/80e7d4cf4f49f30d586023143b1dab3da5379687 |     
    i686     |            unknown             | NOK | http://autobuild.buildroot.net/results/3604919a79c7432e1c04f7d5c3b1813a9dddb402 |     
powerpc64le  |            unknown             | NOK | http://autobuild.buildroot.net/results/9613659950a4af3634cedb848c5b438edfdab8f1 |     
   mips64    |            unknown             | NOK | http://autobuild.buildroot.net/results/0e8a6acf6f552b31b4a855e667842af262eee6cc |     
   s390x     |            unknown             | NOK | http://autobuild.buildroot.net/results/e528e07874815d7f1cb951084ec985d76fe22d2e |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/e8e651920739e9a803c6c39b4e11695808fddb31 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/fe6e282da5121dcc2edd8d367d33bb40d32b9a32 |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/f0c5ec693c65dd6f6f8cb63ec02ead6d1147565e |     
   sh4aeb    |            unknown             | NOK | http://autobuild.buildroot.net/results/5eb18568db4f2e2a55b13981bf7927d5a107a7cf |     
powerpc64le  |            unknown             | NOK | http://autobuild.buildroot.net/results/543f16ce9e9072c4f0515b65c700a28107038e54 |     
 microblaze  |            unknown             | NOK | http://autobuild.buildroot.net/results/fb471bcd9a49d81f448512019345bd9844087703 |     
  sparc64    | wireguard-linux-compat-1.0.... | NOK | http://autobuild.buildroot.net/results/bdf8bf148aef44d758a25fb7dfcf734a1bbbb6ea |     
  mips64el   |         wolfssl-5.5.3          | NOK | http://autobuild.buildroot.net/results/9144e226d4cb50a824eb0f0583ac4929a6a809c2 |     
   s390x     |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/5e5ff04ee48f26b7c97d6dbdcdfd9192e6fed891 |     
  riscv32    |        xfsprogs-5.14.2         | NOK | http://autobuild.buildroot.net/results/0b85f4ce5910cf147e22a502af9dd5f5a4b29bd1 | ORPH
    i686     |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/43ca5fcc5b8618e6a7a65e77061f673a3c30bfc6 |     


Classification of failures by reason for 2022.11.x
--------------------------------------------------

              host-pahole-1.24 | 3 
            host-binutils-2.38 | 2 
                  bind-9.16.38 | 1 
              libgcrypt-1.10.1 | 1 
      linux-5.10.145-cip17-rt7 | 1 
                    mutt-2.2.9 | 1 
                     pv-1.6.20 | 1 
             uccp420wlan-6.9.1 | 1 


Detail of failures for 2022.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    sh4a     |          bind-9.16.38          | NOK | http://autobuild.buildroot.net/results/6a475e525e8049e444f78faaafafa399a9853c47 | ORPH
   armeb     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/aaae1f91e8b18c1184c2889c1751450f48fe08ec |     
 aarch64_be  |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/a4748fb6441ffea020169c3d1af36a18369c649b |     
    or1k     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/38ce4c839acf0d1c8e2156089f04947ea9f945fa |     
   mips64    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/19bcbd168bdb345dcdebd2c6a4af5427e3062753 |     
   mipsel    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/4a9474b76fdc489fd0b85a570d3b208d5afc73b5 |     
    i586     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/c6a63ff7ba4b989872090cd3d5bcdaf7a0791dea | ORPH
  mips64el   |    linux-5.10.145-cip17-rt7    | NOK | http://autobuild.buildroot.net/results/f7a01b50a77ddaf14256d0e0ed2b1f374bb3be9e | ORPH
   armeb     |           mutt-2.2.9           | NOK | http://autobuild.buildroot.net/results/9d6b21d29146ae73f7d4f5dcdf9cb867432c09ac |     
   armeb     |           pv-1.6.20            | NOK | http://autobuild.buildroot.net/results/1c5b63f312732959be9efa2c12c502c03c424f1c | ORPH
microblazeel |       uccp420wlan-6.9.1        | NOK | http://autobuild.buildroot.net/results/5c1652ccad13f5750229e76d9b008eabc1c23adb |     


Gitlab CI results for 2023-03-17
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
                 at91sam9x5ek_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945127918  |      
             at91sam9x5ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945127923  |      
   atmel_sama5d27_som1_ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945127924  |      
   atmel_sama5d2_xplained_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945127927  |      
       atmel_sama5d3_xplained_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945127931  |      
   atmel_sama5d3_xplained_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945127936  |      
       atmel_sama5d4_xplained_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945127951  |      
       atmel_sama5d4_xplained_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945127955  |      
   atmel_sama5d4_xplained_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945127957  |      
                        avenger96 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945127960  |      
                bananapi_m2_ultra | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945127962  |      
                 bananapi_m2_zero | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945127963  |      
                        bananapro | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945127964  | ORPH 
                   beagleboardx15 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945127965  |      
                       beaglebone | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945127966  |      
                   beaglebone_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945127968  |      
                     beagleboneai | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945127970  |      
                          beaglev | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945127972  |      
                      beelink_gs1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945127973  |      
               broadcom_northstar | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945127974  |      
                     canaan_kd233 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945127976  |      
                   chromebook_elm | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945127978  |      
                  chromebook_snow | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945127982  |      
                             ci20 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945127986  |      
                      cubieboard2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945127991  |      
            engicam_imx6qdl_icore | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945127994  |      
        engicam_imx6qdl_icore_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945127997  |      
        engicam_imx6qdl_icore_rqs | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128001  |      
              engicam_imx6ul_geam | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128004  |      
             engicam_imx6ul_isiot | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128010  |      
               freescale_imx28evk | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128013  |      
        freescale_imx6dlsabreauto | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128016  |      
          freescale_imx6dlsabresd | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128017  |      
         freescale_imx6qsabreauto | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128021  |      
           freescale_imx6qsabresd | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128023  |      
          freescale_imx6sxsabresd | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128026  |      
             freescale_imx6ullevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128030  |      
           freescale_imx7dsabresd | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128032  |      
              freescale_imx8mmevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128034  |      
              freescale_imx8mnevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128036  |      
              freescale_imx8mpevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128037  |      
              freescale_imx8mqevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128038  |      
              freescale_imx8qmmek | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128039  |      
             freescale_imx8qxpmek | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128040  |      
               freescale_p1025twr | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128041  | ORPH 
             freescale_t1040d4rdb | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128042  | ORPH 
          freescale_t2080_qds_rdb | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128044  | ORPH 
           friendlyarm_nanopi_r2s | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128045  |      
                          galileo | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128046  |      
          globalscale_espressobin | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128047  |      
                 grinn_chiliboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128048  |      
                  grinn_liteboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128049  |      
                 hifive_unleashed | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128050  |      
                         imx23evk | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128051  |      
                   imx6-sabreauto | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128053  |      
                     imx6-sabresd | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128054  |      
                 imx6-sabresd_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128055  |      
                        imx6slevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128056  |      
                       imx6sx-sdb | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128057  |      
                        imx6ulevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128058  |      
                       imx6ullevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128060  |      
                       imx6ulpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128063  |      
                        imx7d-sdb | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128066  |      
                        imx7dpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128067  |      
                       imx8mmpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128070  |      
                imx8mn_bsh_smm_s2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128074  |      
            imx8mn_bsh_smm_s2_pro | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128078  |      
                        imx8mpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128082  |      
                        imx8mqevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128084  |      
                kontron_bl_imx8mm | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128087  |      
               kontron_pitx_imx8m | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128092  |      
              kontron_smarc_sal28 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128095  |      
                          lafrite | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128097  |      
                         lego_ev3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128101  |      
                    licheepi_zero | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128103  |      
               linksprite_pcduino | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128105  |      
                       ls1028ardb | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128107  |      
                mender_x86_64_efi | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128108  | ORPH 
          microchip_sam9x60ek_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128110  |      
      microchip_sam9x60ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128111  |      
 microchip_sama5d27_wlsom1_ek_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128112  |      
...hip_sama5d27_wlsom1_ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128114  |      
        microchip_sama5d2_icp_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128115  |      
    microchip_sama5d2_icp_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128118  |      
          microchip_sama7g5ek_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128120  |      
      microchip_sama7g5ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128122  |      
                  minnowboard_max | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128124  |      
                          mx25pdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128126  |      
                          mx51evk | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128128  |      
                         mx53loco | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128130  |      
                         mx6cubox | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128132  |      
                   mx6sx_udoo_neo | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128134  |      
                          mx6udoo | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128135  |      
                      nexbox_a95x | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128136  |      
                            nezha | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128137  |      
                      nitrogen6sx | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128138  |      
                       nitrogen6x | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128139  |      
                        nitrogen7 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128141  |      
                       nitrogen8m | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128142  |      
                      nitrogen8mm | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128143  |      
                      nitrogen8mn | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128144  |      
                      nitrogen8mp | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128146  |      
              octavo_osd32mp1_brk | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128147  |      
              octavo_osd32mp1_red | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128149  |      
                         odroidc2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128151  |      
                        odroidxu4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128152  |      
        olimex_a10_olinuxino_lime | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128153  |      
             olimex_a13_olinuxino | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128155  |      
        olimex_a20_olinuxino_lime | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128157  |      
       olimex_a20_olinuxino_lime2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128156  |      
       olimex_a20_olinuxino_micro | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128159  |      
             olimex_a33_olinuxino | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128160  |      
             olimex_a64_olinuxino | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128161  |      
          olimex_imx233_olinuxino | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128162  |      
    olimex_stmp157_olinuxino_lime | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128163  |      
                         olpc_xo1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128168  |      
                       olpc_xo175 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128164  |      
                    openblocks_a6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128169  |      
                    orangepi_lite | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128176  |      
                   orangepi_lite2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128172  |      
                     orangepi_one | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128178  |      
                orangepi_one_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128180  |      
                      orangepi_pc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128182  |      
                 orangepi_pc_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128185  |      
                      orangepi_r1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128187  |      
                    orangepi_zero | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128193  |      
               orangepi_zero_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128203  |      
              orangepi_zero_plus2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128197  |      
                       pandaboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128207  |      
                   pc_x86_64_bios | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128209  |      
                    pc_x86_64_efi | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128210  |      
                   pcengines_apu2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128212  |      
                           pine64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128214  |      
                    pine64_sopine | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128217  |      
                qemu_aarch64_ebbr | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128220  |      
                qemu_aarch64_sbsa | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128223  |      
                qemu_aarch64_virt | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128225  |      
                    qemu_arm_ebbr | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128228  |      
               qemu_arm_versatile | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128232  |      
                qemu_arm_vexpress | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128237  |      
             qemu_arm_vexpress_tz | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128240  |      
                qemu_m68k_mcf5208 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128242  |      
                   qemu_m68k_q800 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128243  |      
            qemu_microblazebe_mmu | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128244  |      
            qemu_microblazeel_mmu | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128246  |      
              qemu_mips32r2_malta | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128248  |      
            qemu_mips32r2el_malta | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128249  |      
              qemu_mips32r6_malta | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128250  |      
            qemu_mips32r6el_malta | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128252  |      
                qemu_mips64_malta | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128253  |      
              qemu_mips64el_malta | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128254  |      
              qemu_mips64r6_malta | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128256  |      
            qemu_mips64r6el_malta | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128258  |      
                 qemu_nios2_10m50 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128259  |      
                        qemu_or1k | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128260  |      
                 qemu_ppc64_e5500 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128262  |      
               qemu_ppc64_pseries | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128263  |      
            qemu_ppc64le_powernv8 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128264  |      
             qemu_ppc64le_pseries | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128265  |      
                  qemu_ppc_bamboo | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128266  |      
                  qemu_ppc_e500mc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128267  |      
                 qemu_ppc_g3beige | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128268  |      
                   qemu_ppc_mac99 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128269  |      
               qemu_ppc_mpc8544ds | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128270  |      
                qemu_riscv32_virt | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128271  |      
          qemu_riscv64_nommu_virt | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128272  |      
                qemu_riscv64_virt | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128274  |      
                       qemu_s390x | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128275  |      
                     qemu_sh4_r2d | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128276  |      
                   qemu_sh4eb_r2d | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128278  |      
               qemu_sparc64_sun4u | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128279  |      
                  qemu_sparc_ss10 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128281  |      
                         qemu_x86 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128285  |      
                      qemu_x86_64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128283  |      
                 qemu_xtensa_lx60 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128286  |      
           qemu_xtensa_lx60_nommu | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128288  |      
                      raspberrypi | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128302  | ORPH 
                     raspberrypi0 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128291  | ORPH 
                    raspberrypi0w | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128293  | ORPH 
                     raspberrypi2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128294  | ORPH 
                     raspberrypi3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128298  |      
                  raspberrypi3_64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128296  | ORPH 
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128299  | ORPH 
                     raspberrypi4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128301  | ORPH 
                  raspberrypi4_64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128300  | ORPH 
                 raspberrypicm4io | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128305  | ORPH 
              raspberrypicm4io_64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128304  | ORPH 
                raspberrypizero2w | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128306  |      
                        riotboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128307  |      
                           rock64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128309  |      
                       rock_pi_n8 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128310  |      
                        rockpro64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128311  |      
                      roseapplepi | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128312  |      
                 s6lx9_microboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128313  |      
                       sheevaplug | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128314  |      
                 sipeed_lichee_rv | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128316  |      
            sipeed_lichee_rv_dock | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128317  |      
                  sipeed_maix_bit | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128319  |      
           sipeed_maix_bit_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128321  |      
                 sipeed_maix_dock | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128325  |      
          sipeed_maix_dock_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128327  |      
                   sipeed_maix_go | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128329  |      
            sipeed_maix_go_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128331  |      
                 sipeed_maixduino | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128333  |      
          sipeed_maixduino_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128335  |      
               snps_arc700_axs101 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128336  |      
              snps_archs38_axs103 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128337  |      
                snps_archs38_haps | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128338  |      
                snps_archs38_hsdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128339  |      
                socrates_cyclone5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128341  |      
                solidrun_clearfog | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128343  |      
          solidrun_clearfog_gt_8k | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128344  |      
            solidrun_macchiatobin | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128346  | ORPH 
                    spike_riscv64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128347  |      
              stm32f429_disco_xip | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128349  |      
               stm32f469_disco_sd | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128350  |      
              stm32f469_disco_xip | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128351  |      
                  stm32mp157a_dk1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128353  |      
                  stm32mp157c_dk2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128354  |      
              stm32mp157c_odyssey | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128356  |      
        terasic_de10nano_cyclone5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128357  |      
              toradex_apalis_imx6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128358  |      
                           ts4900 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128360  |      
                           ts5500 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128362  |      
                           ts7680 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128364  |      
                         uevm5432 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128367  |      
                    versal_vck190 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128369  |      
                       visionfive | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128376  |      
                      visionfive2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128374  |      
                        wandboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128379  |      
                            warp7 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128382  |      
                        warpboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128383  |      
                    zynq_microzed | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128384  |      
                      zynq_qmtech | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128387  |      
                       zynq_zc706 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128389  |      
                         zynq_zed | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128390  |      
                zynqmp_kria_kv260 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128392  |      
                    zynqmp_zcu102 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128394  |      
                    zynqmp_zcu106 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3945128396  |      



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
