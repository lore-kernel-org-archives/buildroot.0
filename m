Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05454C433FE
	for <buildroot@archiver.kernel.org>; Thu, 10 Nov 2022 07:49:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4982380B48;
	Thu, 10 Nov 2022 07:49:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4982380B48
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lM-kLldVMUnX; Thu, 10 Nov 2022 07:49:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E6920817A6;
	Thu, 10 Nov 2022 07:49:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E6920817A6
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A50551BF5A3
 for <buildroot@lists.busybox.net>; Thu, 10 Nov 2022 07:49:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7EC5560AE5
 for <buildroot@lists.busybox.net>; Thu, 10 Nov 2022 07:49:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7EC5560AE5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Hf5ltURCB1pX for <buildroot@lists.busybox.net>;
 Thu, 10 Nov 2022 07:49:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2ECF86066D
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2ECF86066D
 for <buildroot@buildroot.org>; Thu, 10 Nov 2022 07:49:27 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 832F3C0014
 for <buildroot@buildroot.org>; Thu, 10 Nov 2022 07:49:25 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Thu, 10 Nov 2022 07:49:25 -0000
Message-Id: <20221110074931.7EC5560AE5@smtp3.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1668066565; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=lvCSuwIrJglzDYvS+T4M9RMCEgsRya6reG4YjTh3+Ys=;
 b=IUjWjSuEXjq/6ngZdMnJwAEa2dWcLkhmWs/bcCMkspQBCDu3+b90+8L1yozC/sHFedTL52
 dvNoYp53UnmOBYicJJbqnFTy3S58037iOz5JB4yw+2EDRrCZrkarqQvyW7TMt9wZHOhJP0
 2fjC1qvoa8s+bo7Ryc/2sPfV3FvQEo5f1tCx4qqIyefy7DwPgif46qIVrqTqGLqPNbTso5
 stxYohzjdYcBcty/kuaie56LREZuXBRIYCCwXbccigSw/RCiogjUWqm0l7GyVJ0byblQ5o
 gIp9/aACSTCWB7YxjJpkj8ialqZYRLW/Bp6P4RpdJ8rtIN10XhDDmT49f2Yy3A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=IUjWjSuE
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-11-09
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

Autobuild statistics for 2022-11-09
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  |  4  |  3  |  0  |  7  |
  2022.08.x  | 10  | 21  |  0  | 31  |
    master   | 157 | 190 |  0  | 347 |
     next    | 43  | 97  |  0  | 140 |

Classification of failures by reason for master
-----------------------------------------------

                   libnss-3.84 | 16
          imagemagick-7.1.0-51 | 13
              host-pahole-1.24 | 10
glibc-2.36-66-ga1dc0be03c9d... | 8 
              host-rust-1.64.0 | 7 
            host-binutils-2.38 | 6 
                tealdeer-1.6.1 | 6 
                gerbera-1.10.0 | 5 
                       unknown | 5 
                 dash-0.5.11.5 | 4 
  gobject-introspection-1.72.0 | 4 
                   linux-6.0.1 | 4 
                linuxptp-3.1.1 | 4 
              alsa-utils-1.2.8 | 3 
        edk2-edk2-stable202102 | 3 
             lirc-tools-0.10.2 | 3 
                     lxc-5.0.1 | 3 
               apcupsd-3.14.14 | 2 
                    brltty-6.5 | 2 
                     efivar-38 | 2 
                elfutils-0.186 | 2 
                     frr-8.3.1 | 2 
            host-binutils-2.37 | 2 
         host-gcc-final-12.2.0 | 2 
                host-go-1.19.3 | 2 
             libgpg-error-1.45 | 2 
                libkcapi-1.4.0 | 2 
          linux-5.10.145-cip17 | 2 
                    opus-1.3.1 | 2 
                   perl-5.34.1 | 2 
                      xz-5.2.7 | 2 
/home/buildroot/autobuild/i... | 1 
/home/buildroot/autobuild/i... | 1 
/home/buildroot/autobuild/i... | 1 
/home/buildroot/autobuild/i... | 1 
/home/buildroot/autobuild/i... | 1 
/home/buildroot/autobuild/i... | 1 
android-tools-4.2.2+git2013... | 1 
                  assimp-5.2.5 | 1 
  binutils-arc-2020.09-release | 1 
                      crun-1.5 | 1 
             f2fs-tools-1.15.0 | 1 
                  ffmpeg-4.4.3 | 1 
                   flann-1.9.2 | 1 
             fontconfig-2.13.1 | 1 
fs/cramfs/cramfs.mk:46: /ho... | 1 
fs/romfs/romfs.mk:32: /home... | 1 
fs/ubi/ubi.mk:51: /home/aut... | 1 
fs/ubi/ubi.mk:51: /home/aut... | 1 
fs/ubi/ubi.mk:51: /home/aut... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
               gocryptfs-2.2.1 | 1 
            host-binutils-2.39 | 1 
                  kexec-2.0.25 | 1 
                       kmod-30 | 1 
               libcap-ng-0.8.3 | 1 
              libgcrypt-1.10.1 | 1 
               libglib2-2.72.3 | 1 
                libglvnd-1.4.0 | 1 
              libsodium-1.0.18 | 1 
                mongodb-4.2.18 | 1 
                   ncurses-6.1 | 1 
                  netsurf-3.10 | 1 
              open62541-v1.3.3 | 1 
                 openal-1.22.0 | 1 
               openpgm-5-3-128 | 1 
   openvmtools-11.3.5-18557794 | 1 
package/qt6/qt6base/qt6base... | 1 
                    php-8.1.12 | 1 
pistache-3ec9d7c4f8b828fdd3... | 1 
           proxychains-ng-4.16 | 1 
                     pv-1.6.20 | 1 
           python-numpy-1.23.4 | 1 
          python-orjson-3.7.11 | 1 
                    qemu-7.1.0 | 1 
      qt5webkit-5.212.0-alpha4 | 1 
                 qt6base-6.4.0 | 1 
              rsyslog-8.2204.1 | 1 
rtl8192eu-1e15b6d451731bc4d... | 1 
rtl8723bu-d79a676a8d3f0bb6a... | 1 
        s6-linux-utils-2.6.0.0 | 1 
                    sdl-1.2.15 | 1 
                 sudo-1.9.11p2 | 1 
              tinymembench-0.4 | 1 
              traceroute-2.1.0 | 1 
uqmi-0a19b5b77140465c29e2af... | 1 
           v4l2loopback-0.12.7 | 1 
                 wolfssl-5.5.3 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/8cd024bc82891d27c382ff65e793c1b289191a6a |     
 powerpc64   | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/b2ee93047eeefd000e30e9047fa2ef364bbc8641 |     
    arc      | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/166fcac29e9bd1c4b82c345d237c0da552f2477d |     
powerpc64le  | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/33679628e085a692712d9b200f1637e87721daef |     
    m68k     | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/95ed8da75ffd77ed2ec7bf9a2cca4ef102ea11a4 |     
   arceb     | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/058fd6724251e6f7d7c8ef7345da92d9ae01ebf0 |     
   mipsel    |        alsa-utils-1.2.8        | NOK | http://autobuild.buildroot.net/results/08a3856ad87d2b852084b5942a3cfb8e5ea6fea2 |     
microblazeel |        alsa-utils-1.2.8        | NOK | http://autobuild.buildroot.net/results/556c6dca714913d351ef3657a5a157c065359037 |     
 powerpc64   |        alsa-utils-1.2.8        | NOK | http://autobuild.buildroot.net/results/cfcbafd2911c7a18d7171950aed8dd25b2b17130 |     
 powerpc64   | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/d38de58c6a989e91b5fadeac2b109c5ce8320289 |     
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/9a47c2bbaf4f3e2a868bd81b315882aab13e83de |     
    arc      |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/403097cb3d9a5a71a45b9f98e14155752f1d41c5 |     
  mips64el   |          assimp-5.2.5          | NOK | http://autobuild.buildroot.net/results/2903c1ea9905f4f4d99dabfaf97a7a993286e67a | ORPH
   arceb     |  binutils-arc-2020.09-release  | NOK | http://autobuild.buildroot.net/results/8ee8f23819acddeb507fe11fa65890f81a117b46 |     
powerpc64le  |           brltty-6.5           | NOK | http://autobuild.buildroot.net/results/449a06678bf0a3b8eb5b630a3548ed8d3fd50760 |     
    mips     |           brltty-6.5           | NOK | http://autobuild.buildroot.net/results/2b19eb8060cba6e7433cbc50ca4f4677357145ec |     
powerpc64le  |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/ebea5d76c615d8509f87238d449e66da214fed73 |     
  sparc64    |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/6c505b2f2dfd76886d53258245322a28a51dfd06 | ORPH
   sh4eb     |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/9ca2b642eb704c504e2e9c2fea72c96dd73b977e | ORPH
  sparc64    |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/a9377685b6abe11d6a61da888efd623b79019b92 | ORPH
    arc      |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/692141b6fc767bdc3b47dbd27e8fe2eaeeef9c76 | ORPH
   x86_64    |     edk2-edk2-stable202102     | NOK | http://autobuild.buildroot.net/results/5b74ae5ab59de2af91918fef1b5debea47b66c96 |     
   x86_64    |     edk2-edk2-stable202102     | NOK | http://autobuild.buildroot.net/results/cd2d85a962e4c572aa0b76ad1b1819b302c2a0cf |     
  aarch64    |     edk2-edk2-stable202102     | NOK | http://autobuild.buildroot.net/results/3efeefa898a489d26a4070f53db0b9b7ad8ce6ca |     
  aarch64    |           efivar-38            | NOK | http://autobuild.buildroot.net/results/ecbabafcb4cefce93b9114667bff8f03ea9b2c1f |     
powerpc64le  |           efivar-38            | NOK | http://autobuild.buildroot.net/results/31a1c9e55edf39ea0100915f3d0e6d3159008c6d |     
   arceb     |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/2ddba81c9a561c0cd44d95e195fdbee658c52d8b | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/d4d89b10027bdbe1f810b395ab34d9597cf2c45b | ORPH
    or1k     |       f2fs-tools-1.15.0        | NOK | http://autobuild.buildroot.net/results/8f07c6a0abf126e4866342c16cea87bb3b718817 |     
    arm      |          ffmpeg-4.4.3          | NOK | http://autobuild.buildroot.net/results/58a5a3e2a37e84fc7fad1a2cf51f3ca3de5c8c44 |     
   mips64    |          flann-1.9.2           | NOK | http://autobuild.buildroot.net/results/069c3be972cb74b2bd59123693d6b9f39aa74dcc |     
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/b079c34c079eaf47e8beb89187efb6b2f01cb5e7 | ORPH
   xtensa    |           frr-8.3.1            | NOK | http://autobuild.buildroot.net/results/f5c312d14275aa8568ef88c4954c6cb872989d4a |     
  mips64el   |           frr-8.3.1            | NOK | http://autobuild.buildroot.net/results/c4550a619e06901e7977eec3c83a23b7b84b03b1 |     
  mips64el   | fs/cramfs/cramfs.mk:46: /ho... | NOK | http://autobuild.buildroot.net/results/8e70af1ed6ecc041f85b59d1f789b7f0060660d9 |     
   x86_64    | fs/romfs/romfs.mk:32: /home... | NOK | http://autobuild.buildroot.net/results/74ebe821e1dd73d3e01c7314b3c531a5044ece38 |     
   nios2     | fs/ubi/ubi.mk:51: /home/aut... | NOK | http://autobuild.buildroot.net/results/2f66f41e74408f686185c037fb818c2ad42ae2e8 |     
   xtensa    | fs/ubi/ubi.mk:51: /home/aut... | NOK | http://autobuild.buildroot.net/results/fe267035a8310e7bcf1f7f9f8658c3421d0b0be5 |     
    arc      | fs/ubi/ubi.mk:51: /home/aut... | NOK | http://autobuild.buildroot.net/results/c6dc9ab8c41256bebb54975f49e4967d64309c42 |     
    arm      | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/99c737388d1194788a5df14e4d257e035cfa9da7 |     
  sparc64    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/d459590f7dc869af7211e2b5ea47bff32ac47dcc |     
   s390x     |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/319c2d439abdc7c335beab7882fd48899fca1fe6 |     
   armeb     |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/9a7c4671a442ac2fb19438e6d77bc9f17eb28513 |     
   sparc     |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/9323483167ffdc8dca2db5c964ec4fa468c65df8 |     
    mips     |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/b54ff88fa701469796ffe7d25f834061373f1508 |     
  aarch64    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/8179fcfb2d636fa3a4b1e2558151fcea10814702 |     
 microblaze  | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/4e8dd2d7fc11f87dd34bb8ca668bd9b907ad9861 |     
  powerpc    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/0a2d1101c53e0c3ce1f8f67d0295b2438230f84e |     
  powerpc    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/d420a9bfb7d91ac29c51530877596d6dad94241f |     
  powerpc    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/0a7a8819ea95fe97578fc85ad9ff97c7fd80e843 |     
    mips     | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/51812c41758f1f3451e871beda99c2cb02939f4a |     
   nios2     | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/9635e3f1803dd289306401d147a27bb9e32b7657 |     
   mipsel    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/25e4e3b94c393a3fa33cd88c05c222301172722e |     
microblazeel | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/a8d032efd9a8aff79a48dd6139aee6897bf65323 |     
   mipsel    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/19d2cffe6a006df81e84ed46d493a6b207533d14 | ORPH
   nios2     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/e3f31e31b00cf78854905da26beb01e8f3d5c2b2 | ORPH
 powerpc64   |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/0152ead500afd6fff68a6aa7c28cf8b94dad4102 | ORPH
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/48a2fcca5c907b0b8d58decfc5f4f72336bfb7e5 | ORPH
   s390x     |        gocryptfs-2.2.1         | NOK | http://autobuild.buildroot.net/results/502620cc70b4a4dc80ee945b7f825394daf9526b |     
    m68k     |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/56ed6d62af6e9fab6d566d627d9cbf6d0e307497 |     
   nios2     |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/7b90ac0fd2de0689116b19ba2d821cfca29738c8 |     
  riscv32    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/da1479dc7845df5a5f448a6b6c5daca3f6703669 |     
  sparc64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/75483b7eb44fb1eceadf0c8bea7b619b38dc9504 |     
 powerpc64   |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/d673375ffdae7135cc6d2a36a2ff9c5996defcb9 |     
  sparc64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/f37e255a52e6c42e9b5d4315b5203c16b8f6b062 |     
microblazeel |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/dc6f3261ebdbdc3360aa1f081ad356334f1a4074 |     
   mipsel    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/11199acfea3203e2db86138c1bc9bdccc9fd6577 |     
powerpc64le  |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/82b11da21e90f997657fbeb6409539bccdfbb6ef |     
microblazeel |     host-gcc-final-12.2.0      | NOK | http://autobuild.buildroot.net/results/ad3180d55f563f2d391bce4e92ee2229706b0fed |     
microblazeel |     host-gcc-final-12.2.0      | NOK | http://autobuild.buildroot.net/results/0c3a8fbc332211374a8b6a6a5e4f9378d8f60350 |     
    i686     |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/5b63a7501e3e3b66f6e38ccfe079669bb8ae41c4 |     
  mips64el   |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/c5de5581ed1600413b3614d3b49771efd18804d5 |     
   nios2     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/73fe737a3bf7d9a54954fcbcafc644a49394e56e |     
  aarch64    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/082fc36f2073508866b12fd36c15a7c961091dbc |     
  powerpc    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/b4576acdd0a48afc6f9087397a325c1f699b6c1c |     
    sh4      |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/82423cee0f33f1f5cb8600511db272214559a7b9 |     
    arm      |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/43779190300fa6b3c39484c92dbd2ce55e96a1fe |     
   xtensa    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/d489b25c7096545e624e269549d0aab6f5e9d412 |     
 powerpc64   |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/8c28dde297652738300e21498733538354b69dac |     
  powerpc    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/692f90c2b6675ba85651cb41beaf59abcdd740ab |     
    arc      |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/c88a0ece32492d548085a2c67e095360faafd332 |     
   sparc     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/397f220b8413009ec42464f91162148e02872bed |     
   x86_64    |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/b3ba62a192d88e22004b4fd5bca3fc205f2ebb08 |     
   mipsel    |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/60ce6a47e0a86edd488769204f10ac7bebc9219a |     
    i686     |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/c891f4590a601fb02364baa365028869ce824933 |     
   x86_64    |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/5c6af8952693c385a98d53355a0e9fd7582552ed |     
   x86_64    |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/d118ee3f6bbff10ea4a133cb72d7751910e42cce |     
  sparc64    |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/32afa2a0e5beefe29b6b1dab9c764d8dbcca524a |     
    i686     |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/b1b6758931e48bc8790b6b2ae1bf5ef7fbbeccb6 |     
   arceb     |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/5bbbc27f766324525858d398305fc2fbc724db87 | ORPH
  sparc64    |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/ebb39ece88cbf321cd9c9d6b349324c849f2a9ea | ORPH
microblazeel |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/d67b9be4aacb7d06032a3564535c3679fc669f5b | ORPH
  sparc64    |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/0820390bb444a4f1fea160a113f00d33deaa447b | ORPH
    mips     |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/efb961e8fedabb7e62368f86b954f7783534182e | ORPH
   sparc     |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/80febf172390dd1a56eb72b534fe7a9b15a110ae | ORPH
   x86_64    |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/0dcfc3cb647c1c8a6a10aa6ac97e9b0a7ac89602 | ORPH
   s390x     |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/8e53c3f053006b0616550bcdcc2cccc9f17bc66d | ORPH
   mips64    |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/3b4e1e1d6f14f50a238a2a8c819d02a34eb3997f | ORPH
   mipsel    |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/66dc005c5166263c67becd440e3cdfeae7b233b1 | ORPH
    mips     |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/9ceb4970cc39b56fca35ef6fd87dd3ce87d4189f | ORPH
  aarch64    |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/366443c5846dc15952f536ddb349385f2fd6984a | ORPH
   s390x     |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/e3bd24bd092d3fb8d4ae5f1d863e302b5e57cb66 | ORPH
   armeb     |          kexec-2.0.25          | NOK | http://autobuild.buildroot.net/results/cbbacfeeb96b3fb6e804e3418c02e8a9a5b83548 | ORPH
   armeb     |            kmod-30             | NOK | http://autobuild.buildroot.net/results/719761f53fdbe207a8f123c205437cecafc7d490 |     
  riscv64    |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/d92e0721b8ab59f532404ab58dc42d9fecd25c64 |     
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/d91e0e0115cae0b23e7337510f9911b91d7fcf99 | ORPH
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/4a2dd2cce1f6c681bf092f8fd36575e45421d7f9 |     
   mips64    |         libglvnd-1.4.0         | NOK | http://autobuild.buildroot.net/results/b33961d2de6f62ee3bbeeb90e209e8f7324fbfe1 | ORPH
 aarch64_be  |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/41e2cafb9802e5f1ce5e068c02b6751e8a7f2c8c | ORPH
 aarch64_be  |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/a0c02577528758a9ce1d7f5d712cd0363cf970cc | ORPH
 microblaze  |         libkcapi-1.4.0         | NOK | http://autobuild.buildroot.net/results/0bdabb8b1cbe8c726373c157fd9230acc391ced6 |     
microblazeel |         libkcapi-1.4.0         | NOK | http://autobuild.buildroot.net/results/6bcf9b06a4ef5d31ddee01e44c3691caa64be14c |     
    m68k     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/538decf933b2051f58033ebc00753a5003420ad9 |     
   mips64    |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/c57417cef50bffc8d2fa6aa243382f441e8e6e68 |     
    mips     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/a3fdd0f38daf338f6e70e28464f9ecc1a02b07fe |     
  aarch64    |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/8fef8034c8c7adb160299f07888b8a1c83853052 |     
  mips64el   |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/7658f84345ad1374457ebf49ab37c966f52a4deb |     
powerpc64le  |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/af5b46c0adc282ba32592349227e8e82c613c9f2 |     
   sh4eb     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/6b9fab5c880df625d74b2b7ebe4e9af4dec7030a |     
  sparc64    |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/5ea36cbe63e717301b3c5d84550d06abed3998a1 |     
  mips64el   |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/038c61a416ce75a0a847585b857686c8a4eb63f5 |     
powerpc64le  |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/a34ef4698ff21d90203bfdce9d8404c90161e7bb |     
  aarch64    |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/2d1ed89afc447807f406c2943ad9b28223e48f16 |     
   s390x     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/45869faab7bdcd7e76a2a4a9e431705cd1fca987 |     
   x86_64    |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/94c7e0f43faad3c15a3eeab53f170f8e1e2fabf9 |     
   sparc     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/b601e89dac66bcbe2c7d91f0b06840c5311d070d |     
 aarch64_be  |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/9df2af27fbe05d716a84d4dee0fb23e720f9fc10 |     
    or1k     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/e43282e927006a9154e396a70aa8eb83bd4b73db |     
    arm      |        libsodium-1.0.18        | NOK | http://autobuild.buildroot.net/results/323b8a93e6251459890c84e482fe002f9093bfa1 |     
    arm      |      linux-5.10.145-cip17      | NOK | http://autobuild.buildroot.net/results/c32f0e9307b3223133257cc7a01fd542203a311b | ORPH
   sparc     |      linux-5.10.145-cip17      | NOK | http://autobuild.buildroot.net/results/fbeb438bd24e8b2e4d28b77b7b1bbe5680a5953e | ORPH
   nios2     |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/d07419b4f929328149dcc86692b437239c6267be | ORPH
   s390x     |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/e98c8503ec7cd3e93a1abcd477cd08f3de34d98e | ORPH
    m68k     |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/3e04ce8e618689e97f53abd89735261f2cbb742e | ORPH
   nios2     |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/7584f31233ec223f886ccf1035a568aa09484569 | ORPH
   sparc     |         linuxptp-3.1.1         | NOK | http://autobuild.buildroot.net/results/e60607d4774e862167d28f83bd828acad7267992 |     
   sparc     |         linuxptp-3.1.1         | NOK | http://autobuild.buildroot.net/results/a0c68ec60272646a77ed59084bd0f5c463dacb64 |     
   mipsel    |         linuxptp-3.1.1         | NOK | http://autobuild.buildroot.net/results/9416c6725f0d2cbbc9e420eea88cab358c2da4a1 |     
    sh4      |         linuxptp-3.1.1         | NOK | http://autobuild.buildroot.net/results/d9e1f5cfbfd9122e7d6623d312046d1eec5c6329 |     
  riscv32    |       lirc-tools-0.10.2        | NOK | http://autobuild.buildroot.net/results/f30ac6a922bd65b26aacb01a633f4e5242515da8 | ORPH
   xtensa    |       lirc-tools-0.10.2        | NOK | http://autobuild.buildroot.net/results/d9d1e88ca67c4ddcf22e6039ebba7aef01a7796f | ORPH
    sh4      |       lirc-tools-0.10.2        | NOK | http://autobuild.buildroot.net/results/98376cb30d4ee9733076eb42c777316a345913a9 | ORPH
   s390x     |           lxc-5.0.1            | NOK | http://autobuild.buildroot.net/results/ca44125f273e021811e47f65195e0adc781120a2 |     
    arm      |           lxc-5.0.1            | NOK | http://autobuild.buildroot.net/results/9c8431e20d211210f687bedc1872f4aabef1a25b |     
   s390x     |           lxc-5.0.1            | NOK | http://autobuild.buildroot.net/results/99c418f3a00f537d69481d2bfe840954b37d6bf2 |     
  aarch64    |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/3eeb9285fedd19a84df1f866bf8418da6d0d8f2b |     
   mips64    |          ncurses-6.1           | NOK | http://autobuild.buildroot.net/results/a410e6269b3ed5a4c19c217228bb03bf50235129 | ORPH
  sparc64    |          netsurf-3.10          | NOK | http://autobuild.buildroot.net/results/8ef97aed5cdc5af349f19f7a95399e552b8b0c3a |     
   nios2     |        open62541-v1.3.3        | NOK | http://autobuild.buildroot.net/results/cb9e70d629bd5316c7f89eb6a810b3da38ab7f78 | ORPH
    mips     |         openal-1.22.0          | NOK | http://autobuild.buildroot.net/results/cf6f0dde6dd088ab3a9984d7c65331247f4c4095 |     
  sparc64    |        openpgm-5-3-128         | NOK | http://autobuild.buildroot.net/results/fd6031e7709ed9473a0d24f60b9427b60decfd67 |     
    i586     |  openvmtools-11.3.5-18557794   | NOK | http://autobuild.buildroot.net/results/dce0fb3eeb2610af858297a5e8c9809ca1000362 |     
   armeb     |           opus-1.3.1           | NOK | http://autobuild.buildroot.net/results/26b37e870623fb21639a57558e64fc09c8a8e891 | ORPH
    arm      |           opus-1.3.1           | NOK | http://autobuild.buildroot.net/results/c30280b7c6deec666e3f5a31219377369313f2cf | ORPH
  aarch64    | package/qt6/qt6base/qt6base... | NOK | http://autobuild.buildroot.net/results/7dd2666d2c2077e44e74604f2e76641f62449bb3 |     
   arceb     |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/cee55feefd69077f5c6ab4cf812136c2eaac7156 |     
    m68k     |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/59e8387bd6c0a96d63742725dbab43fa1c8bd4a7 |     
    or1k     |           php-8.1.12           | NOK | http://autobuild.buildroot.net/results/fe080a2beb173a1b51ab284460cf44f2d0e875e5 |     
   sparc     | pistache-3ec9d7c4f8b828fdd3... | NOK | http://autobuild.buildroot.net/results/b73b385023c0e296eb18b24bad203e15959ac42b | ORPH
  aarch64    |      proxychains-ng-4.16       | NOK | http://autobuild.buildroot.net/results/4ea4d21ae02f1e242f60ee8e3f7c6386a99ad685 | ORPH
   armeb     |           pv-1.6.20            | NOK | http://autobuild.buildroot.net/results/d271944099129291bb41bf722e982d7b7e1b29a6 | ORPH
  powerpc    |      python-numpy-1.23.4       | NOK | http://autobuild.buildroot.net/results/d905f57d9783e20a6b005f9cccc20dfc19c4661b |     
    mips     |      python-orjson-3.7.11      | NOK | http://autobuild.buildroot.net/results/39b42935bdcbac9df10cb1c1b662a2d96325fc5e |     
powerpc64le  |           qemu-7.1.0           | NOK | http://autobuild.buildroot.net/results/21b230e8c7fa212f94610cf3d38cc23a8c25a8b3 |     
   mipsel    |    qt5webkit-5.212.0-alpha4    | NOK | http://autobuild.buildroot.net/results/fbcc93731b780c21cf522f3e2e3c92f6f54b943c |     
  sparc64    |         qt6base-6.4.0          | NOK | http://autobuild.buildroot.net/results/6e54d9ed0e9e6fc8448e6ec89395ab4a8f6229ed |     
   arceb     |        rsyslog-8.2204.1        | NOK | http://autobuild.buildroot.net/results/f4039e7872be47980c5c6827f6ade20aa378cf30 |     
  sparc64    | rtl8192eu-1e15b6d451731bc4d... | NOK | http://autobuild.buildroot.net/results/eda9d97bfcae8d7cb188e34d8d6e5ebf4580f172 |     
   sparc     | rtl8723bu-d79a676a8d3f0bb6a... | NOK | http://autobuild.buildroot.net/results/f21b971d6fb9d718b6119c335ae21860a329470d |     
    mips     |     s6-linux-utils-2.6.0.0     | NOK | http://autobuild.buildroot.net/results/516303fb1a61e587b3f023b1f9ee91c7ad17cbf9 |     
   sh4aeb    |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/d631077b363ea7e54276e3b0595ed48a93b8a211 | ORPH
   arceb     |         sudo-1.9.11p2          | NOK | http://autobuild.buildroot.net/results/c496fe926030c0c01f496d107af6e1846119b1c2 | ORPH
   s390x     |         tealdeer-1.6.1         | NOK | http://autobuild.buildroot.net/results/7d36a71988ab13c5b79527c706f1fe7e18e040dd |     
    mips     |         tealdeer-1.6.1         | NOK | http://autobuild.buildroot.net/results/56b5300a223acc3bb8554dd3da22bd0c1bbd98f3 |     
powerpc64le  |         tealdeer-1.6.1         | NOK | http://autobuild.buildroot.net/results/bea7777a30eb7c62ed493168b7bd7425a322ce58 |     
  sparc64    |         tealdeer-1.6.1         | NOK | http://autobuild.buildroot.net/results/4fb14e1851db46bb6159d46b37f961bd6c984322 |     
   s390x     |         tealdeer-1.6.1         | NOK | http://autobuild.buildroot.net/results/e8e81c1b38f5f158258063a5b9f04ffddf9ad2a3 |     
powerpc64le  |         tealdeer-1.6.1         | NOK | http://autobuild.buildroot.net/results/432989556c1d15d39f160d9deb025559dcabf599 |     
   armeb     |        tinymembench-0.4        | NOK | http://autobuild.buildroot.net/results/37f8434489891f97b3177af8f3e919c6289ed113 |     
  mips64el   |        traceroute-2.1.0        | NOK | http://autobuild.buildroot.net/results/faf2a66804eff951dc4aae827933fc534024ac8c |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/b0f9926ba5eb796d966075828c89222f3a522aa0 |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/d27bd011ef702691a19a522aaa03b777cddfb262 |     
   sparc     |            unknown             | NOK | http://autobuild.buildroot.net/results/54ef6cde8bfdad3446f69c2691a8754ae29b641c |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/56890440b6ce4fb429b59726addb80b97974b7d5 |     
   armeb     |            unknown             | NOK | http://autobuild.buildroot.net/results/8416e94efc8f602f062b14b18d63e6b7fe84017b |     
   x86_64    | uqmi-0a19b5b77140465c29e2af... | NOK | http://autobuild.buildroot.net/results/034a5f2fb7d9ce39185d8eb9a6bf251190dca120 | ORPH
   x86_64    |      v4l2loopback-0.12.7       | NOK | http://autobuild.buildroot.net/results/44a78fc669b77819c12712a33d7553d369d942b6 |     
    arm      |         wolfssl-5.5.3          | NOK | http://autobuild.buildroot.net/results/e88000d730d12cc7aae663b62493a8c20ab7c03b |     
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/563119b298b56b57f4e8319249de80d4c1e0709f | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/2c621a6235a85921a10b2370e65d67151f64356f | ORPH


Classification of failures by reason for next
---------------------------------------------

                   libnss-3.84 | 12
                   aubio-0.4.9 | 11
          imagemagick-7.1.0-51 | 10
         s6-linux-init-1.0.6.3 | 6 
                   linux-6.0.1 | 4 
                    lxc-4.0.12 | 4 
              host-pahole-1.24 | 3 
                    norm-1.5.8 | 3 
              alsa-utils-1.2.8 | 2 
                 dash-0.5.11.5 | 2 
fs/ubifs/ubifs.mk:49: /tmp/... | 2 
            host-binutils-2.38 | 2 
                host-go-1.19.3 | 2 
                  jack2-1.9.21 | 2 
          lttng-modules-2.13.1 | 2 
toolchain-external-codescap... | 2 
                  assimp-5.2.5 | 1 
              asterisk-16.25.2 | 1 
                    brltty-6.5 | 1 
                      crun-1.5 | 1 
             dahdi-linux-3.2.0 | 1 
              docopt-cpp-0.6.3 | 1 
                 dtbocfg-0.0.9 | 1 
                     efivar-38 | 1 
fs/ubi/ubi.mk:51: /tmp/inst... | 1 
glibc-2.36-66-ga1dc0be03c9d... | 1 
                     gmp-6.2.1 | 1 
  gobject-introspection-1.72.0 | 1 
host-ninja-1.11.1.g95dee.ki... | 1 
    host-python-greenlet-2.0.0 | 1 
              host-rust-1.65.0 | 1 
                  libftdi1-1.5 | 1 
              libtommath-1.2.0 | 1 
      linux-5.10.145-cip17-rt7 | 1 
                linuxptp-3.1.1 | 1 
               lpc32xxcdl-2.11 | 1 
               openpgm-5-3-128 | 1 
                   opensbi-0.9 | 1 
                 openssh-9.1p1 | 1 
                   perl-5.34.1 | 1 
            python-bunch-1.0.1 | 1 
    python-cryptography-38.0.3 | 1 
         python-greenlet-2.0.0 | 1 
                    tiff-4.4.0 | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |        alsa-utils-1.2.8        | NOK | http://autobuild.buildroot.net/results/5cfe4bd589bd2b59ec1c1c139710927db6e81995 |     
   sparc     |        alsa-utils-1.2.8        | NOK | http://autobuild.buildroot.net/results/17fc068f760624a53d4635fdb52ea8b4e3c8bdf2 |     
   mips64    |          assimp-5.2.5          | NOK | http://autobuild.buildroot.net/results/8a4543e58f7b8b34e999fd1510ebc0aefd50c20d | ORPH
powerpc64le  |        asterisk-16.25.2        | NOK | http://autobuild.buildroot.net/results/daced20604d6be7a0fc351d256e93c64ce9238c2 |     
   armeb     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/7b772af7a690b88d9a49ade1727a155d85f236eb |     
   mipsel    |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/e70841b9ffcc6f532c3ea7a8829a937a9252cb2f |     
   arceb     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/217f56c53a0e18827f7bc94c124becd1154b5fff |     
   nios2     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/045dd68254e10f0363f4156bf8b0e1e1d938f4e6 |     
 microblaze  |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/2f15b97e6fe70280848cf8d9270f49fac2b2676c |     
   s390x     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/88c4f221d2606f3cbaaf525d5f01e1418fcc6e77 |     
  sparc64    |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/928f622810124c46ed7c370156480e0806a718ca |     
  mips64el   |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/c4b380f6161ee37de37dc0c2d270a0519fc87816 |     
    i686     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/85b74fb7cc61cc3f206dc9b8338019a292edf431 |     
   armeb     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/6a9a2b92ac26fc53c50ad9236110b8aa3935c980 |     
  sparc64    |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/bd53e080ec08599fea87de2007037a10c6dc9583 |     
powerpc64le  |           brltty-6.5           | NOK | http://autobuild.buildroot.net/results/cebd9a50956a6fa8f25aaff66e0c74d0c60d1824 |     
   arceb     |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/7cd7dfb816d5e8df0c512f93bdaaf84639790b3a |     
   x86_64    |       dahdi-linux-3.2.0        | NOK | http://autobuild.buildroot.net/results/f707d69446fbd016f8a7e1c8e06bf0f367cc3773 |     
 powerpc64   |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/6a44b85fb6eac0fce1c1d964be3a699ffbfe994d | ORPH
    mips     |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/f53cba201a0829af46b9a83b96aa55bd3cdf16ee | ORPH
    or1k     |        docopt-cpp-0.6.3        | NOK | http://autobuild.buildroot.net/results/1632b943514e7bfa13414c4545bec8332e7633f1 |     
   mipsel    |         dtbocfg-0.0.9          | NOK | http://autobuild.buildroot.net/results/2dd25ecaa167fba3e124c5cb64013c3d659e068b |     
  mips64el   |           efivar-38            | NOK | http://autobuild.buildroot.net/results/7bda78b0b6c0c22a1397ac2d272c876a6cfa9c5a |     
    arc      | fs/ubi/ubi.mk:51: /tmp/inst... | NOK | http://autobuild.buildroot.net/results/6d5dfdee8b6a288053fcbe6e9ef7f9b02da1200b |     
    arc      | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/d197934f493cc05c9ce489b87234f34c90087cf8 |     
   mips64    | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/1169e5f1bf6f6418acf5a7a98291cc4dc2a21a86 |     
microblazeel | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/7370c6931409bf68d576745c04f7f2fd20cda03b |     
  riscv64    |           gmp-6.2.1            | NOK | http://autobuild.buildroot.net/results/6248796615c98f8d55093666aafda712a34dc94f | ORPH
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/7233675c2aa68e8c0c50549439635ef891b18bcc | ORPH
   armeb     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/00d56e4c6bf0bff060b7b1a64f609abb06b9f4b6 |     
 microblaze  |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/9e78f134f727a24dbd9d628ee0f69049f0b27d1a |     
    i686     |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/c3cc19efe1340a6edb4f2f7062690f2acd69ff6a |     
  mips64el   |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/b4bf8a6b0805e45b828d659fbf1f29c7654faebc |     
   nios2     | host-ninja-1.11.1.g95dee.ki... | NOK | http://autobuild.buildroot.net/results/8307fb66a983f01cd2f43e4315142de20f951185 |     
   mipsel    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/2445236897437d99d07fae6f377d1553e3b69670 |     
 powerpc64   |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/239fd4f5b4532382f3853d4f6e6f205ccb5c07ef |     
    i586     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/9007ddabbbbfce5025eaadd02cb27153340dfec7 |     
   x86_64    |   host-python-greenlet-2.0.0   | NOK | http://autobuild.buildroot.net/results/dbcaefff9f468aa0f7606fde54b4dce1074ed87c |     
   x86_64    |        host-rust-1.65.0        | NOK | http://autobuild.buildroot.net/results/2fde50c13c21c54d9527d16d36d1c6640731ce14 |     
  riscv64    |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/b810f0cc371acd92ac3b04aaee23dac75451f11f | ORPH
    m68k     |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/e7c646c1b45875117d8f94afa1ac7ddb5093df9b | ORPH
 aarch64_be  |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/c768219767183a78dc240cffce430762e9013afb | ORPH
   nios2     |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/5266c5acfd03f5a5a1ee006378646ae8a09396a6 | ORPH
   s390x     |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/b9cbe9262619197b614bc91d64b0478f8c7d211c | ORPH
   s390x     |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/ab3c25ba7798bbbaaa08483e48476670e61ba64f | ORPH
microblazeel |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/72d0c73e30b28e3586366f708756020e10104d74 | ORPH
   mipsel    |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/f75a559e6d3cac6eb08b15d3a209b27adb2a1e71 | ORPH
   s390x     |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/94dd89a4cc6bbd4aef7ad24dc569aca4bdc101cc | ORPH
powerpc64le  |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/72a2495d6f486c627b934f0f6e1703ec6d1ac395 | ORPH
   nios2     |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/ce510ef38fa0def5ad71310fcc53d3f7aa13ef65 |     
   sh4aeb    |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/ebeb0a53b39932a007d0f5fb3aa7222334e2dac4 |     
   arceb     |          libftdi1-1.5          | NOK | http://autobuild.buildroot.net/results/f2e8e535b4fe22bc6c0289430d61b820294eecd1 |     
 microblaze  |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/6042bace2e9848924e44f027e39c8f90d9a2bfc1 |     
   sh4eb     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/a63641874cbf83abfe4c3967f08a8c0e03f32ad1 |     
  powerpc    |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/079b3344fda5aed4b48f4ea44cb529daac9682bf |     
  aarch64    |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/4e3e1cb512b1c2d9bab29f1051b4a61ece499500 |     
    sh4      |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/1cf444c72a0181efcda926fe793e257730b2f607 |     
  aarch64    |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/9766f06d7510e0bcafe7fbc7ad02a0b55090a2c5 |     
 aarch64_be  |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/5efc7b365cc40f92e55b55c7c1cbb80275055479 |     
    i586     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/0bed983b5b5ede1b2084854d3a2b69db645415f1 |     
microblazeel |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/a473f4f94a9159e95c934bb7b7cb8a0f60f6a427 |     
    mips     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/460e8839558c78e62b35966bf2bd9530643614b7 |     
  powerpc    |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/6556cfa9e96337ed9607f185e8e66df8dd704fde |     
   nios2     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/f679e71da5dd13037b57cdec40024d376a4bcd7b |     
   arceb     |        libtommath-1.2.0        | NOK | http://autobuild.buildroot.net/results/3e44ea5914dea1576214a69efc66e4c79f977e5b |     
   mips64    |    linux-5.10.145-cip17-rt7    | NOK | http://autobuild.buildroot.net/results/3579d0f496afd431134831bc840d443536545eb9 | ORPH
   xtensa    |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/18987821e59618edac6f114c5724048e45023ecb | ORPH
   x86_64    |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/b597ad0202fb9f848a4412f9ff56e9aa69db9ddb | ORPH
  riscv64    |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/12949f244721be0cb3ea32dbcae3b1bfa9707b0a | ORPH
   s390x     |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/0a2ffac72c4b3c4438df7255afc86c0016533268 | ORPH
  powerpc    |         linuxptp-3.1.1         | NOK | http://autobuild.buildroot.net/results/94e5c65b7f2ee152ba8a73a1929fe9206e527cba |     
   armeb     |        lpc32xxcdl-2.11         | NOK | http://autobuild.buildroot.net/results/875358be0baf24db74eb922e00c62d09fde25e4d | ORPH
  aarch64    |      lttng-modules-2.13.1      | NOK | http://autobuild.buildroot.net/results/311fb78a542a70b2e20d941308196557e420c1f2 |     
 aarch64_be  |      lttng-modules-2.13.1      | NOK | http://autobuild.buildroot.net/results/4ed019c0d38a69263d44aa84c87a2ce11600071f |     
   nios2     |           lxc-4.0.12           | NOK | http://autobuild.buildroot.net/results/0d70317586ed6f0f10d8f2e86b432b745cc708e2 |     
   armeb     |           lxc-4.0.12           | NOK | http://autobuild.buildroot.net/results/be876cd5b6e31972468dd7bbb982573c566ab238 |     
   mips64    |           lxc-4.0.12           | NOK | http://autobuild.buildroot.net/results/05a65fa96aac94f68cff07df1418eb886f711e8e |     
  sparc64    |           lxc-4.0.12           | NOK | http://autobuild.buildroot.net/results/95e985f69097fd9ca008712939877accf3679816 |     
   mips64    |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/0f14af62d68be3ef5f9522d66a7a6117b851b066 | ORPH
   s390x     |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/b3cba0b06c9ec9a4276e9b89b25d763478309c57 | ORPH
    mips     |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/f36aaacf8e58e46fafccc84790b130753354216d | ORPH
powerpc64le  |        openpgm-5-3-128         | NOK | http://autobuild.buildroot.net/results/500f2250c14dc255d2224e5697fe968c1b689e4b |     
  riscv32    |          opensbi-0.9           | NOK | http://autobuild.buildroot.net/results/4f80a350ae25067ee9204bf766c8284dc6d7077d |     
    or1k     |         openssh-9.1p1          | NOK | http://autobuild.buildroot.net/results/fa1615c0d149504dd7dc5cad8473c4f59ed5ffb0 | ORPH
   arceb     |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/6396f961e4c52db375b17369f75d0f300e273f65 |     
  aarch64    |       python-bunch-1.0.1       | NOK | http://autobuild.buildroot.net/results/241d802fdcd6c57879d3c5c50269cb78fb417a92 |     
 powerpc64   |   python-cryptography-38.0.3   | NOK | http://autobuild.buildroot.net/results/e7d11c68f85c7e7c41b8a38f6e7fc338beedf659 |     
  sparc64    |     python-greenlet-2.0.0      | NOK | http://autobuild.buildroot.net/results/0c845c89e40c24678f97d9ec5ef3a15be737dd43 |     
 powerpc64   |     s6-linux-init-1.0.6.3      | NOK | http://autobuild.buildroot.net/results/99b57b567e786dcc8191fec4c5f74d91f99545cc |     
    arc      |     s6-linux-init-1.0.6.3      | NOK | http://autobuild.buildroot.net/results/a61dc453aed484a9485b28ea80af37e2de59f35e |     
    arm      |     s6-linux-init-1.0.6.3      | NOK | http://autobuild.buildroot.net/results/39e04bdc679d2489dff8da5c4aad11c2ab641b3f |     
    mips     |     s6-linux-init-1.0.6.3      | NOK | http://autobuild.buildroot.net/results/425a25a06b855dba39647fccd0768ea1e757329a |     
   arceb     |     s6-linux-init-1.0.6.3      | NOK | http://autobuild.buildroot.net/results/8c8ae731069c3ff77a90d7be56226e5d7611cf05 |     
   s390x     |     s6-linux-init-1.0.6.3      | NOK | http://autobuild.buildroot.net/results/e78f79b106bcf47d7aea3e2d196619309826806b |     
    arm      |           tiff-4.4.0           | NOK | http://autobuild.buildroot.net/results/2d5decbffd345f0e6ccdc65d8f2d8dc2d1a863c9 | ORPH
   mips64    | toolchain-external-codescap... | NOK | http://autobuild.buildroot.net/results/9795323a38160a37f6d77ffd32bf51a1b4452c3a | ORPH
   mips64    | toolchain-external-codescap... | NOK | http://autobuild.buildroot.net/results/e4d98770543967d367e0222b995807acceace47a | ORPH


Classification of failures by reason for 2022.02.x
--------------------------------------------------

google-breakpad-7515ab13768... | 1 
                 wavemon-0.9.4 | 1 
                 wolfssl-5.5.2 | 1 


Detail of failures for 2022.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mipsel    | google-breakpad-7515ab13768... | NOK | http://autobuild.buildroot.net/results/7ee0c31e7328e61da84c2ab030bb1f477e5150b4 |     
  aarch64    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/907f51704aecc145d7754c1b0761936abe6661e2 | ORPH
   mipsel    |         wolfssl-5.5.2          | NOK | http://autobuild.buildroot.net/results/04454847e409a71ac1d2832d5831295053f95a4b |     


Classification of failures by reason for 2022.08.x
--------------------------------------------------

            igd2-for-linux-2.1 | 3 
          imagemagick-7.1.0-51 | 3 
                gerbera-1.10.0 | 2 
                 wavemon-0.9.4 | 2 
              dropbear-2022.82 | 1 
               gocryptfs-2.2.1 | 1 
           heirloom-mailx-12.5 | 1 
            igh-ethercat-1.5.2 | 1 
                 linux-5.17.15 | 1 
              micropython-1.19 | 1 
                 sudo-1.9.11p2 | 1 
                tinifier-3.4.0 | 1 
                 uclibc-1.0.42 | 1 
                    zeek-4.1.1 | 1 
                 zlib-ng-2.0.6 | 1 


Detail of failures for 2022.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |        dropbear-2022.82        | NOK | http://autobuild.buildroot.net/results/4d6dd7e7d797704f20edaf359f739393fd33c823 |     
microblazeel |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/e9ffeec8bfbb22ec9756f588ba440e4c1b8dc84c |     
    m68k     |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/9fd17a6567919a12e9bf29352be66d859b34b776 |     
   x86_64    |        gocryptfs-2.2.1         | NOK | http://autobuild.buildroot.net/results/5f1f6f687790cfd7fa0e58d2a4072b72ba90f459 |     
   sh4eb     |      heirloom-mailx-12.5       | NOK | http://autobuild.buildroot.net/results/cc37c08f19e41244b3c690575d82713b0b407778 |     
  sparc64    |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/b130655bb2645d7307334e0371510216139a82bb |     
  mips64el   |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/7f156515a9c59f5d0578b16d988cc8f8f93a7e94 |     
 microblaze  |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/e28efaac26d835b58db7b316a3d670295f024fe0 |     
    arm      |       igh-ethercat-1.5.2       | NOK | http://autobuild.buildroot.net/results/63d895641a2e3ca61d924caa0708cb0828b943af |     
   mipsel    |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/474e2503a0bf7d063d531dc3a4a4930a09ed2675 | ORPH
   x86_64    |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/91509adc321545f8b60d97ee7a30b7bb7a964bfe | ORPH
   sparc     |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/3b1abadb67ce8ebfc4527685da5aa8a40e6335be | ORPH
   x86_64    |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/0b7354470f04aeb9fed926e26c0b8dc8beb043b5 | ORPH
 aarch64_be  |        micropython-1.19        | NOK | http://autobuild.buildroot.net/results/a857656296de8e5f8089eb1dbc9889b50ebc8a27 |     
   xtensa    |         sudo-1.9.11p2          | NOK | http://autobuild.buildroot.net/results/422360182606d2f223a005fc6b85b6a573f1e6d0 | ORPH
   x86_64    |         tinifier-3.4.0         | NOK | http://autobuild.buildroot.net/results/7aa1874c0aced0968a9b96372a8e5daa1f133e7d |     
  powerpc    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/d55be807a8cf8e1bd7bbe9fdf6dbecee71c9c793 |     
   s390x     |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/29a5a0b8998203e8794d0b27fabab39e05938e18 | ORPH
    or1k     |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/46895c1a66b5517c57d539b0cb9b0af413158757 | ORPH
  powerpc    |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/28e444b4f9f267da8a6c40edadb2dce518324da2 |     
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/3afffaf4ff42e3a2fbeeae06dad7c9c126cd189f | ORPH



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
