Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C3F7C53210
	for <buildroot@archiver.kernel.org>; Sun,  8 Jan 2023 06:42:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 89359400E7;
	Sun,  8 Jan 2023 06:42:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 89359400E7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lEvYN9PMEdn8; Sun,  8 Jan 2023 06:42:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1FCF840123;
	Sun,  8 Jan 2023 06:42:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1FCF840123
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1A0F11BF59D
 for <buildroot@lists.busybox.net>; Sun,  8 Jan 2023 06:42:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E8C8060A9D
 for <buildroot@lists.busybox.net>; Sun,  8 Jan 2023 06:42:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E8C8060A9D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ltTqwMANUlVW for <buildroot@lists.busybox.net>;
 Sun,  8 Jan 2023 06:42:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 89BB760A93
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 89BB760A93
 for <buildroot@buildroot.org>; Sun,  8 Jan 2023 06:42:20 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id A4E27240006
 for <buildroot@buildroot.org>; Sun,  8 Jan 2023 06:42:17 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sun, 08 Jan 2023 06:42:17 -0000
Message-Id: <20230108064223.E8C8060A9D@smtp3.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1673160137; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=SDMRiQy7Td1vyQwJM9voqHz7jcKAorCPRdZag76W5k8=;
 b=iIBrSKBexrdfSOkvUH6IKE/wSs97PMQWOflhA909cfXY0dsiiXiK+WcqJRLPn7FyapAyBj
 qh9SKcVSaIqLknQvIuz6QIwFhFSgrwYhTi4ut6v89WjSXYq+/D8khUvWrWzgNk7dWQGAl5
 JwWdK1WSK3e3AFjoGpCge2YQhjGr6Fv1zOId4KAcWNIAzyvWzHiLu3Wz6YoosFtRTurBoS
 sZ8rpi7pRrL+Y7MHt+iGBP+PBWg4NDAzPqPf/wJxI2Y1hMwjFtnhamhdWeMVdAkr7v5QGT
 SFZBHD3vk4l6/6MSTDmNWZDRz65IjA64ZQLRUf0UmOEjK+S5WLddZ2FXcpO5iA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=iIBrSKBe
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-01-07
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

Autobuild statistics for 2023-01-07
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  |  2  |  0  |  0  |  2  |
  2022.11.x  | 15  | 12  |  0  | 27  |
    master   | 176 | 348 |  0  | 524 |

Classification of failures by reason for master
-----------------------------------------------

                   bash-5.2.15 | 29
                  bustle-0.8.0 | 21
                    fwup-1.9.1 | 19
               host-fwup-1.9.1 | 16
         host-sentry-cli-2.8.0 | 15
                     xz-5.2.10 | 12
                    bat-0.19.0 | 10
  gobject-introspection-1.72.0 | 9 
                  jack2-1.9.21 | 8 
                   linux-6.1.2 | 8 
                    dust-0.8.1 | 7 
            host-binutils-2.38 | 7 
                    pixz-1.0.7 | 7 
              host-rust-1.66.0 | 6 
                    opkg-0.4.5 | 6 
                       unknown | 6 
           janus-gateway-1.1.1 | 5 
                    crun-1.7.2 | 4 
             dahdi-linux-3.2.0 | 4 
                elfutils-0.186 | 4 
              host-pahole-1.24 | 4 
               libglib2-2.72.3 | 4 
                    norm-1.5.8 | 4 
           python-bcrypt-4.0.1 | 4 
    python-cryptography-38.0.4 | 4 
                gerbera-1.10.0 | 3 
glibc-2.36-66-ga1dc0be03c9d... | 3 
                   gvfs-1.48.1 | 3 
                host-go-1.19.4 | 3 
    host-python-greenlet-2.0.1 | 3 
             libgpg-error-1.46 | 3 
                  ntp-4.2.8p15 | 3 
            ocf-linux-20171122 | 3 
            python-bunch-1.0.1 | 3 
            quickjs-2021-03-27 | 3 
                 wolfssl-5.5.3 | 3 
  binutils-arc-2020.09-release | 2 
                  boost-1.80.0 | 2 
                     efivar-38 | 2 
               fftw-quad-3.3.8 | 2 
             fontconfig-2.13.1 | 2 
gummiboot-2bcd919c681c952eb... | 2 
            host-binutils-2.39 | 2 
              libgcrypt-1.10.1 | 2 
                  mender-3.4.0 | 2 
           optee-client-3.19.0 | 2 
                   perl-5.34.1 | 2 
                     ply-2.3.0 | 2 
           python-numpy-1.23.5 | 2 
ripgrep-af6b6c543b224d348a8... | 2 
                 sudo-1.9.12p1 | 2 
toolchain-external-codescap... | 2 
                 uclibc-1.0.42 | 2 
                  zabbix-5.4.9 | 2 
/home/buildroot/autobuild/i... | 1 
android-tools-4.2.2+git2013... | 1 
               apcupsd-3.14.14 | 1 
                  assimp-5.2.5 | 1 
                 avro-c-1.11.1 | 1 
                  bind-9.16.33 | 1 
             bluez5_utils-5.65 | 1 
                  cmocka-1.1.5 | 1 
             ctorrent-dnh3.3.2 | 1 
            dieharder-3.31.1.4 | 1 
                 dmalloc-5.6.5 | 1 
                   ethtool-6.1 | 1 
                   flann-1.9.2 | 1 
       freeradius-client-1.1.7 | 1 
fs/cramfs/cramfs.mk:46: /tm... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /tmp/... | 1 
google-breakpad-c85eb4a59b6... | 1 
             host-delve-1.20.0 | 1 
       host-gcc-initial-10.4.0 | 1 
       host-gcc-initial-12.2.0 | 1 
                 host-gdb-12.1 | 1 
host-spirv-llvm-translator-... | 1 
              hyperfine-1.14.0 | 1 
jq-a17dd3248a666d01be75f6b1... | 1 
                   json-c-0.16 | 1 
kvmtool-f77d646ba01d04be5aa... | 1 
libcamera-ba6435930f08e802c... | 1 
               libcap-ng-0.8.3 | 1 
                libressl-3.6.1 | 1 
              libuhttpd-3.14.1 | 1 
          linux-5.10.145-cip17 | 1 
      linux-5.10.145-cip17-rt7 | 1 
                   linux-tools | 1 
             lirc-tools-0.10.2 | 1 
        ltp-testsuite-20220930 | 1 
                     lxc-5.0.1 | 1 
                  ndisc6-1.0.6 | 1 
                 nerdctl-1.0.0 | 1 
                   pcre2-10.42 | 1 
                      pdbg-3.5 | 1 
               pipewire-0.3.62 | 1 
                 proftpd-1.3.8 | 1 
           proxychains-ng-4.16 | 1 
                python3-3.11.1 | 1 
rtl8812au-aircrack-ng-e7a4a... | 1 
                 rtl_433-22.11 | 1 
                    sdl-1.2.15 | 1 
                       sed-4.9 | 1 
                  sscep-0.10.0 | 1 
                   trinity-1.9 | 1 
               valgrind-3.19.0 | 1 
          wireshark-legal-info | 1 
                    zstd-1.5.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/642d168a588c27d66503708af100aba717469954 |     
   mips64    | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/53af325806eb9bcc6e717f03a8e2269be6485014 |     
   arceb     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/12d53cc8cd966a271beb8764f00b5bfd3e1db31f |     
    mips     |          assimp-5.2.5          | NOK | http://autobuild.buildroot.net/results/fe6b0acb974a536a0d286210b3f60f2b37811bb1 | ORPH
  mips64el   |         avro-c-1.11.1          | NOK | http://autobuild.buildroot.net/results/ce4e9011d4ef9f550d483d79da6cbf6f9dda197a |     
   sparc     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/719e03e6c0e1d32a2739768933a7f7477f6c43d4 | ORPH
   arceb     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/bee0297601f9f657ae2171bd5c564b73eb3d3de2 | ORPH
   arceb     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/4d26f7f99413144e2f71c726547c6891cd4ff68d | ORPH
   sparc     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/5a30ac60720bd19fd7bf4ee3d6262e2b32dd9457 | ORPH
   mipsel    |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/ac1188b3daeac3a0be187f32587dbcee9044057d | ORPH
  mips64el   |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/1282068df78cfaa4fe288139941fc2abd177f1db | ORPH
   mips64    |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/d31b42d80ee1b94c218b11d0fb14cf1db9b85e7a | ORPH
    arc      |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/665b4cb978d4504661d92223ffc140fa47473855 | ORPH
  aarch64    |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/893922590b1fbd55a831b4211d2045f41dc61d60 | ORPH
  mips64el   |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/3ce3fbb415cda1c18851b10c910a4b636c0f6bd4 | ORPH
   mips64    |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/44b9bb0400bf77b0fd31244a805b78ee5ccc3791 | ORPH
    m68k     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/9ca35d21db6f3c209b6f166cb483b3173a83a367 | ORPH
    arc      |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/2446091658021b6e565f9de608c12bb56ed071fb | ORPH
  powerpc    |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/78a665ff897bd977ce3f1165dd612331a3baab6e | ORPH
   mipsel    |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/3d903d4dd7490b903a318be3cb74ecde94eb2b55 | ORPH
  powerpc    |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/601e8346cabcd91352f7fbfcc59d3d9a132d027b | ORPH
    arc      |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/07013c9c143f81d848e27741d482afa5efbe9daf | ORPH
    m68k     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/0569796080f1a8e5478f7d72007b889b8500fa51 | ORPH
   armeb     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/fb723fe78e79a5a1bd4acceca4304fa3ac5ddbb7 | ORPH
   xtensa    |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/0fb7ba52530f18ac91962f9dbf8d349d2c4d714e | ORPH
   xtensa    |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/9b06fa6c65bfcb9c89738c07d60f5375298f75ae | ORPH
   sparc     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/fe8b5070b2e580d4da18504867089a6ea356fde4 | ORPH
   arceb     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/da8aedff11a22929d178dd08855e7627c4317e4a | ORPH
    arc      |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/14dcad9c7b57c1952d17622020a330f08066ec60 | ORPH
   mips64    |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/30925704f014308234bb49ee13b677813448c038 | ORPH
 microblaze  |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/f63bf5c6c8f3e186effba6bfe987cdaff8475ac5 | ORPH
  aarch64    |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/8d1405d80fe58ebdfadae9e971b225d5b8fc65f1 | ORPH
   mipsel    |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/f0e404c4f4e7a83fa6bb21d109a4c56a08676b5c | ORPH
    arc      |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/a8dac82e4ca056ed875b461a98884739615b25e1 | ORPH
   x86_64    |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/4d292ce185e109f20392630c69a0d5b0c3ecb1aa |     
 powerpc64   |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/b350f152b51676143b999263f4680ed70bdea3e9 |     
    i686     |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/3112119a2ddbc9510dbcecb5634ff3eecf33ea08 |     
 powerpc64   |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/30f547ed5c88e5e944768feb7a80c70855532ef2 |     
  sparc64    |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/5ad5d967593843cf77bb24d67c1d12406920cc99 |     
 powerpc64   |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/420d8d3e617a8194fafa481603bd66a2ce610e5d |     
   mipsel    |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/091c953da7433387369f93734ea400531ad1d939 |     
    arm      |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/d3c6bd6fa13608a9ba59b9d7e584c6f749d2108c |     
  aarch64    |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/1cf04c154d3224fd74050e0e46ebb9ed0af5e61b |     
   x86_64    |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/b1032984f29bbcabf918014d8e599873bd8c4429 |     
    sh4a     |          bind-9.16.33          | NOK | http://autobuild.buildroot.net/results/c6ce0a58be4db4b2d84dd828b49e4bfd24151c13 | ORPH
    arc      |  binutils-arc-2020.09-release  | NOK | http://autobuild.buildroot.net/results/3fc4780d44f7dbcd9072830a949b26144d5ff5b5 |     
    arc      |  binutils-arc-2020.09-release  | NOK | http://autobuild.buildroot.net/results/87f10a1f18027b291608fb33479d96be53d0db2a |     
    sh4a     |       bluez5_utils-5.65        | NOK | http://autobuild.buildroot.net/results/739a1ebb6f4905d0254281658c56c0fed81488e3 |     
    arc      |          boost-1.80.0          | NOK | http://autobuild.buildroot.net/results/c351c186a8a9623bd6c93482c7391cf420daf30b |     
   arceb     |          boost-1.80.0          | NOK | http://autobuild.buildroot.net/results/fc9b61082cf3e9442c87a1aaeb8503b61a9ca042 |     
   nios2     |          bustle-0.8.0          | NOK | http://autobuild.buildroot.net/results/e5e017fa17f0977cf5f5cd36a05dc50e68ed254e | ORPH
   armeb     |          bustle-0.8.0          | NOK | http://autobuild.buildroot.net/results/dc1ab74bc462cbe36ef1655bfff836da4eb0fa6d | ORPH
    mips     |          bustle-0.8.0          | NOK | http://autobuild.buildroot.net/results/300ddad3ec01107068a3de530ea5f4e4999a9d83 | ORPH
   mips64    |          bustle-0.8.0          | NOK | http://autobuild.buildroot.net/results/2988246e2a567ea5e7383702172f18586568d7e9 | ORPH
   mips64    |          bustle-0.8.0          | NOK | http://autobuild.buildroot.net/results/41af120595836ae414f737aeab582e6e14365385 | ORPH
powerpc64le  |          bustle-0.8.0          | NOK | http://autobuild.buildroot.net/results/9b161dbab6a6c51d586f4ee2fed8dd796d597e40 | ORPH
   s390x     |          bustle-0.8.0          | NOK | http://autobuild.buildroot.net/results/f772374e2d31d5d30bd7639b05735e87553f687a | ORPH
   nios2     |          bustle-0.8.0          | NOK | http://autobuild.buildroot.net/results/0f4291b4c60fee73f966c6d8cb743a592d2d436e | ORPH
  aarch64    |          bustle-0.8.0          | NOK | http://autobuild.buildroot.net/results/452ba9ecd1e87ef62a2c3636d4cc2d7de3d97a2a | ORPH
   nios2     |          bustle-0.8.0          | NOK | http://autobuild.buildroot.net/results/1b3f53afde542fa0579fba4549a98b4c9a6faa0e | ORPH
  aarch64    |          bustle-0.8.0          | NOK | http://autobuild.buildroot.net/results/c00e06f743b30771c3600ce1a39d9e7d16c3156a | ORPH
  sparc64    |          bustle-0.8.0          | NOK | http://autobuild.buildroot.net/results/c4720c38d341d91bee6cabbfb38988a8c30e4381 | ORPH
   x86_64    |          bustle-0.8.0          | NOK | http://autobuild.buildroot.net/results/d68b04ec97fe1e9ef85b8ef51651f6866511a80f | ORPH
   x86_64    |          bustle-0.8.0          | NOK | http://autobuild.buildroot.net/results/8f85e0bd345265f768184b9b1a36237ddcdf43c3 | ORPH
  sparc64    |          bustle-0.8.0          | NOK | http://autobuild.buildroot.net/results/78905a48b4feaf8bfd17364a8a9a1ef1d3278fcf | ORPH
   s390x     |          bustle-0.8.0          | NOK | http://autobuild.buildroot.net/results/26b705ef62d285ea649bbfe057b93e07d23a50a6 | ORPH
 powerpc64   |          bustle-0.8.0          | NOK | http://autobuild.buildroot.net/results/070a217f7b578b44d9654dbacf59d887250e84e2 | ORPH
    or1k     |          bustle-0.8.0          | NOK | http://autobuild.buildroot.net/results/886b2b8f5514b66c67504107bc1fd1fc4c368a5f | ORPH
  sparc64    |          bustle-0.8.0          | NOK | http://autobuild.buildroot.net/results/aa682e37ac58f38ed6c412805471063fc11aaf47 | ORPH
    or1k     |          bustle-0.8.0          | NOK | http://autobuild.buildroot.net/results/f0ffacd790a22aefba4f54a48e92b8f5105b5d8d | ORPH
 microblaze  |          bustle-0.8.0          | NOK | http://autobuild.buildroot.net/results/0d6c4a46e810c9a7ed0a4200a1c74271a99b48aa | ORPH
    arm      |          cmocka-1.1.5          | NOK | http://autobuild.buildroot.net/results/d5506c9b5158fa19dc85af3091507d0df83bec47 |     
    arm      |           crun-1.7.2           | NOK | http://autobuild.buildroot.net/results/89c5cde0a0aeb2da4c42d9a999386f85f421056b |     
    m68k     |           crun-1.7.2           | NOK | http://autobuild.buildroot.net/results/d856901105237e9f9333a2d9d317c85fc8f37311 |     
    arc      |           crun-1.7.2           | NOK | http://autobuild.buildroot.net/results/e8334e2a0b7eeb3033659f3c60ad446c7b04cba0 |     
  riscv64    |           crun-1.7.2           | NOK | http://autobuild.buildroot.net/results/19829e70de4f24db9384f84f066de2d520df810b |     
  riscv64    |       ctorrent-dnh3.3.2        | NOK | http://autobuild.buildroot.net/results/709da1e7ad61f89e148286aed9a369daad8d974e |     
powerpc64le  |       dahdi-linux-3.2.0        | NOK | http://autobuild.buildroot.net/results/c3f3b4702f81de7ee72e8f76e0cc06f04c1d0c53 |     
microblazeel |       dahdi-linux-3.2.0        | NOK | http://autobuild.buildroot.net/results/7052cfd674ce7223e012efa225336c763c742181 |     
  riscv32    |       dahdi-linux-3.2.0        | NOK | http://autobuild.buildroot.net/results/bd6b75272cb1ba0f91e400e4650676cf88d9a79b |     
   armeb     |       dahdi-linux-3.2.0        | NOK | http://autobuild.buildroot.net/results/7f25e6d172320563d40e3faa0a6cd0a50c78bc9d |     
microblazeel |       dieharder-3.31.1.4       | NOK | http://autobuild.buildroot.net/results/e532000eaff86803cd6c2e34aa20474c53a4fa53 |     
  powerpc    |         dmalloc-5.6.5          | NOK | http://autobuild.buildroot.net/results/8a7be3fd8a25fbb523bba91610f9872cffbc982e | ORPH
powerpc64le  |           dust-0.8.1           | NOK | http://autobuild.buildroot.net/results/29890fa63a695b7ab1b0cfe365419edc222b8aa4 | ORPH
  powerpc    |           dust-0.8.1           | NOK | http://autobuild.buildroot.net/results/f7b33e620e0495624cacdb5bf641e7423fc42afd | ORPH
powerpc64le  |           dust-0.8.1           | NOK | http://autobuild.buildroot.net/results/62f523f190884b48e1f5c1d5151f6149f74fdcd6 | ORPH
   s390x     |           dust-0.8.1           | NOK | http://autobuild.buildroot.net/results/610af4232acd1b67229d2dc6991ce09742edc493 | ORPH
  sparc64    |           dust-0.8.1           | NOK | http://autobuild.buildroot.net/results/33902543b80a09c8a1644f4a1a351c638d8ceffa | ORPH
    mips     |           dust-0.8.1           | NOK | http://autobuild.buildroot.net/results/30b69204131dc3057b02fdbaeda462ae7b78b0b5 | ORPH
   mipsel    |           dust-0.8.1           | NOK | http://autobuild.buildroot.net/results/e69b04902e2a79409ca37cad6961b057d7fb2b9d | ORPH
  aarch64    |           efivar-38            | NOK | http://autobuild.buildroot.net/results/9622d506dfdbe9a44f0acfae25bff69155f55b6e |     
    arm      |           efivar-38            | NOK | http://autobuild.buildroot.net/results/1b50677481f14de85875652a305a4334e303ed53 |     
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/f730c0bb8be5701eba34c796d4f6ce35d75d44c6 | ORPH
   arceb     |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/5427c661c850a48f61909db5c8a66195ac8bde87 | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/d3394e6e2b4083a4c2a9d5200d46239aa8116f4f | ORPH
   arceb     |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/871523f947a56c47cef673f977b3fd9a87eab08c | ORPH
   x86_64    |          ethtool-6.1           | NOK | http://autobuild.buildroot.net/results/1560c14dc6715cbd49d0efca0d1c8289b1e7dc6a |     
powerpc64le  |        fftw-quad-3.3.8         | NOK | http://autobuild.buildroot.net/results/5d6587e1180fb795fc55437fb2471eac57b1e041 | ORPH
powerpc64le  |        fftw-quad-3.3.8         | NOK | http://autobuild.buildroot.net/results/96982382b558338fb5a219f3ba951f95006111e8 | ORPH
    mips     |          flann-1.9.2           | NOK | http://autobuild.buildroot.net/results/0c93e5ff99c57536bbe6001f1d258c738d76e36c |     
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/7adc5978b1f655c844aebf9eb733c721c0500b41 | ORPH
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/5ab12a1eeca15375b67fd828e60e62d9d08634f5 | ORPH
  riscv64    |    freeradius-client-1.1.7     | NOK | http://autobuild.buildroot.net/results/22e72d9d4e8ba3e65a05385561239976ee66e6c4 |     
 aarch64_be  | fs/cramfs/cramfs.mk:46: /tm... | NOK | http://autobuild.buildroot.net/results/2df7bfcf94a0ea6cdcf7e87757e6f4461115a7f6 |     
  mips64el   | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/0806f7373086ebbcbd680b94f594225e06b679e3 |     
    mips     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/c0082772c6d3875e434609abec850ce3510da32e |     
   sparc     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/61c233700d696d0ce9776c8e7e3dea513c39c5de |     
   s390x     | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/108c8686239aa88e42a6e2cc53bbb46db44cee07 |     
 aarch64_be  |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/754252fe31d86c18951d019c9e2c504affe3d232 |     
    mips     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/58a40e6df56ff5aa27ab944b01e20e24c448df4b |     
  mips64el   |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/2ca7a6dc110aaf9ed91fb5540f4cfca6d420e209 |     
   s390x     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/e4ce13b7d500bcfa29454e570fad0a3b5ebb07ed |     
    or1k     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/f5b0425b8e70ae494d7fe5c08f28c4defb3caac2 |     
 powerpc64   |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/b569e14015b06ceceb71b350bd4bcd2ff4841fdd |     
    m68k     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/1288297bb411d905264edfae93f0981cfb72d5be |     
    mips     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/d97639c44a18d7cb537fb5aa6e039e966b8aae89 |     
 aarch64_be  |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/c2a862fd7aa3bbbab15958d9627767685f7062d8 |     
  powerpc    |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/2fbc89cb39bf4c36e4b1199d6b747975686f3dfc |     
   sparc     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/7b7807cb8f93d414c6f1471b8699617f03ef8427 |     
 powerpc64   |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/1c90ef36a6a8e2166842a95647c1a6a58c740be4 |     
 powerpc64   |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/23678904d9a4b35ea2821747b26e9b56fdd7fcf6 |     
    arm      |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/05800ca7ac86ab52ca5904aedf10d4e3b4309061 |     
    mips     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/240eed608aca0fc3679b4743dcf37e2faa7c2907 |     
 microblaze  |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/24942a167c32cacf93f962438c2b04e13b67d507 |     
  mips64el   |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/aca1164826222255cd09cb72b6cc7958af1190a2 |     
   armeb     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/6bba275fcf0301bd7ce6b12fbc223a3eeb54df40 |     
  mips64el   |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/d5b8d9cc1917f6adb66589a40902d173d595550e |     
   mipsel    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/0abcda70a45ae731b9e9e2a52ad16a63d12c8c2f |     
powerpc64le  |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/fbfbd57645e66c4ae68b0a226542dfa5927308ee |     
   arceb     |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/7f43ee87e7bb05f1d376b3e2c081ac1b0de3ef3c |     
   arceb     | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/bc65f0ccd0ec27af01753c185138ee99d1cf15d1 |     
  powerpc    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/d50fd5557f15835946e59340f3078b02ec6d4eab |     
  powerpc    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/f7156c57004897dd86b5378523306811ceb2deb3 |     
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/accf137b5973d9056f306198e51e0427bbcc9569 | ORPH
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/e820baaa1f3c219f8ba4d756071d55e2af634cb1 | ORPH
   s390x     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/43aa7481e13a02b98631f3f7acfebb4f0fe4d704 | ORPH
    mips     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/25ab8d6cddbbd3eef8e3cedb7a9343c8019665f4 | ORPH
   nios2     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/4644e89287285d9b790fc4e613345b8aba20354c | ORPH
powerpc64le  |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/65ae3d5aae076619ed5651340ec3d3401bc15b2d | ORPH
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/dfd9a283425ce9b9a97c4a205682375331f1f5ab | ORPH
   nios2     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/b5ac53c8dce40a2412cd5c07f9ea4c2154c90f27 | ORPH
  powerpc    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/27b5d0b608f6c229ffe360612c587387e4872d65 | ORPH
    arm      | google-breakpad-c85eb4a59b6... | NOK | http://autobuild.buildroot.net/results/29184695d69798e488f9a0f469bd1a4d482a39c0 |     
    i686     | gummiboot-2bcd919c681c952eb... | NOK | http://autobuild.buildroot.net/results/2f0a80890e4a74d29cdc700c6b8e45aadb47c4c0 |     
    i686     | gummiboot-2bcd919c681c952eb... | NOK | http://autobuild.buildroot.net/results/9f94a95c44debb80a8b059a4f1547bc60869d70e |     
 aarch64_be  |          gvfs-1.48.1           | NOK | http://autobuild.buildroot.net/results/eb3bc7efafec12806d0dd9c54be2b9e86cc7a6fe | ORPH
   mipsel    |          gvfs-1.48.1           | NOK | http://autobuild.buildroot.net/results/5d18c47067542bd61c48bd16d9f2803b643a77c4 | ORPH
powerpc64le  |          gvfs-1.48.1           | NOK | http://autobuild.buildroot.net/results/b4c4d4390388a51fb02e2920a97c2ecf01148754 | ORPH
    sh4      |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/c49fbc5f372d9ebb9f925271c4f8e4e439261c95 |     
    arm      |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/ecda007589d7de8cc0405f6d2d92c0b7bcff5a72 |     
   sparc     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/3091410b93424e05d345076649cbbbbbbcbc2f94 |     
    mips     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/427109a5f92b987a77e73ae283f2f0ff1147d4a9 |     
    i686     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/65b15d7ca05cc34330529ca99937e9f64822e36b |     
   nios2     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/a2db62460534bc69a61dc70b5539316224538f25 |     
   armeb     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/94ff9c69de33909602c9e3e525d4796d18d394cd |     
 microblaze  |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/75be4c6345ce4420fdffc5d6fe7f9b143fcdd962 |     
   s390x     |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/2ddb3934dbb197fbd3d9c0a20043fdcca0045d4e |     
   mips64    |       host-delve-1.20.0        | NOK | http://autobuild.buildroot.net/results/d2afc0a506483b910dfe860d4748189234c4875c |     
    mips     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/cb47674073a08208d29b281c373709c3a870f693 |     
   armeb     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/540a700608db398fea42aedd3d2839d384f92007 |     
    arc      |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/fb17053fe45c1835f0a96a56042665c31a14bf5a |     
  mips64el   |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/b744f55c060e18964ae9d19b5d64c56542448ec4 |     
    or1k     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/7ff187ed8e83131437ee6ee4d5ba25f4b3c063b2 |     
   s390x     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/96fe1d7fec70fb237e52140ee57c344682bc2804 |     
   nios2     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/fcccf77c68d08b3d2ede30f51a35c95ab31fe567 |     
  mips64el   |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/fcaf039dd66961b311e7392508c517968f99e3ca |     
   arceb     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/d94285dc268f7acfe98f2c0b314f1074d22fabcf |     
   arceb     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/7c82448fb5624de1ee6a2fd88392af908ebbaef7 |     
microblazeel |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/c9f0542a8e62fc60ec7ceb9e1a0d8cca5356015c |     
    or1k     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/55bebc401a149452be59d3f8492983ead866eea5 |     
  mips64el   |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/be3c0b3ace56f64beee1167598511d155f2db92d |     
  mips64el   |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/08c5c0e977a24d70260a4a96f7998469bc144433 |     
   mipsel    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/c1d53e0cc99e18d9b56d819131194beaec694f6e |     
    mips     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/79cd6d028cc53da02558b5c637080783a062ab83 |     
 powerpc64   |    host-gcc-initial-10.4.0     | NOK | http://autobuild.buildroot.net/results/227b709833d0081535e0e90f80072bfe7ee56eb4 |     
    arc      |    host-gcc-initial-12.2.0     | NOK | http://autobuild.buildroot.net/results/4a874124c798330c5a4c5a8ee00f35c9cc038071 |     
   sparc     |         host-gdb-12.1          | NOK | http://autobuild.buildroot.net/results/f0362e7c5e419fc2df1e6de6fbb2897f9312467e | ORPH
    i686     |         host-go-1.19.4         | NOK | http://autobuild.buildroot.net/results/31ec448a79b0528770ee10fcc6e1792d1e6422ce |     
  mips64el   |         host-go-1.19.4         | NOK | http://autobuild.buildroot.net/results/91e72e3a5615c2d4ef2647c25f178c3d9f56afb0 |     
  riscv64    |         host-go-1.19.4         | NOK | http://autobuild.buildroot.net/results/742aa83a9e6ba6f6a5662def0addabe93b3cbcfc |     
powerpc64le  |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/b9d8ed1e48c5bfbced432eaeac923c4c5c078563 |     
    arc      |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/274a756a9d6e883c81f798b477b6ac18f8e99d8a |     
  sparc64    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/313dd43f6955a3370af471cda144259d5f60a6f3 |     
    or1k     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/20c95d99070e14a2dcaf3ba902d07235f6b08106 |     
   x86_64    |   host-python-greenlet-2.0.1   | NOK | http://autobuild.buildroot.net/results/44044cde0bfcee6af3903d10f81290175f726d6b |     
  riscv32    |   host-python-greenlet-2.0.1   | NOK | http://autobuild.buildroot.net/results/2aaf1ac294c50618804b814245435116a292a80c |     
  riscv32    |   host-python-greenlet-2.0.1   | NOK | http://autobuild.buildroot.net/results/87c9dd5d6657ddc11fc2dd779a88bb49506c5f37 |     
   x86_64    |        host-rust-1.66.0        | NOK | http://autobuild.buildroot.net/results/dadcb3a0092e9acef857972232571de156de78e5 |     
  sparc64    |        host-rust-1.66.0        | NOK | http://autobuild.buildroot.net/results/b6e7b5351679af6ed6d3603d7b4141f503b3aad1 |     
   x86_64    |        host-rust-1.66.0        | NOK | http://autobuild.buildroot.net/results/c35a4f384f5b4ae55801a4fbff7fa2150c0d1028 |     
powerpc64le  |        host-rust-1.66.0        | NOK | http://autobuild.buildroot.net/results/eb20f5bdbf01f5b5c59aa566a978e7549f3d4792 |     
    mips     |        host-rust-1.66.0        | NOK | http://autobuild.buildroot.net/results/f2c4b0c614a5771d70cfc429f40a3d2bdb0c84a9 |     
  aarch64    |        host-rust-1.66.0        | NOK | http://autobuild.buildroot.net/results/b9c033f6780503dfd0909cea98755b1b17dff56b |     
    or1k     |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/6b7abc69de1d5416570a031ac8cf459b69dba433 |     
    mips     |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/0b9e9a5aed0c4a1764cb4b6d31099042abc2f1f8 |     
   x86_64    |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/32db33df18f1cfae76a8153baad022748a6e614b |     
 powerpc64   |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/8fdb781b0fb1b6bfdc6fccd29997ae9bbe334077 |     
    arm      |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/0a643e73510893d3db15508cbdb85ac1d2b9936e |     
 microblaze  |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/a3113a04755922588867db76624ef9a47607abaf |     
   nios2     |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/fdf1653e0498f08caa48ae424fb0042379f6ad89 |     
 powerpc64   |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/2aa7e88122117e0153f8f5d7bfc96bf670f398dd |     
powerpc64le  |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/c295da42a084e6ba5818db652e79e5a5879e0432 |     
  riscv32    |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/3e456e258181841088d2190e20f208e38d769396 |     
   s390x     |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/e71a3a766a7c1a2c15cb5a02b92798dc51429c8f |     
   sparc     |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/4e72550b03b4f65ba2a2f8eb9c6edc5871575082 |     
   arceb     |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/dcfa82d4c0502fec7a12264f380de6f94f2e54a2 |     
    i686     |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/54301b20ae4feef17218ef7e80e2f637c38f8b97 |     
   arceb     |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/bac83aa050dd79393205767baf152e8819364f5e |     
  riscv64    | host-spirv-llvm-translator-... | NOK | http://autobuild.buildroot.net/results/59b61bc54388efb7ffcb65bb0afe80c55a0ceb2e | ORPH
 powerpc64   |        hyperfine-1.14.0        | NOK | http://autobuild.buildroot.net/results/bd82012d3fc4302022b6e731797d0278a4dd994f | ORPH
    arm      |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/f66f5239c1c259531d6386acfd4406a8caeecb6a |     
   x86_64    |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/57cc32f310c8c86870f62e279b02e2a16a7e2618 |     
microblazeel |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/a01334f5ac3cdc188546c99f4e6a162c669a2465 |     
   mipsel    |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/db2c02f73d64fe86bf7f7fe0667c1408b4c47a39 |     
powerpc64le  |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/34a1f4605c2f3f906159c90c0f9cf2d7915c4116 |     
microblazeel |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/ab0a50f10ed9f2d2c1a30f5e8e7489b65906a763 |     
 powerpc64   |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/ea4d7d4bc341c0d02dfd5d8f1c24045e1bad2bc0 |     
  mips64el   |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/ae1ee1fa18b01d0b52b3d10ab4ac78c05571973e |     
    m68k     |      janus-gateway-1.1.1       | NOK | http://autobuild.buildroot.net/results/451e66ce6ac14fa13d4bce01c49fe123fd1b14e3 |     
   nios2     |      janus-gateway-1.1.1       | NOK | http://autobuild.buildroot.net/results/ad863ca00b87dc42e6a4867614cf824f0a9ae9e4 |     
    i686     |      janus-gateway-1.1.1       | NOK | http://autobuild.buildroot.net/results/35f0dd002bcc2f7bb763151b3bdba74026f64e7b |     
  mips64el   |      janus-gateway-1.1.1       | NOK | http://autobuild.buildroot.net/results/27aba23d43e0944c05a97f08913f2754dda1184c |     
 aarch64_be  |      janus-gateway-1.1.1       | NOK | http://autobuild.buildroot.net/results/2df33e0113345e62ebf4d72bd75b27d583f0ea56 |     
    arc      | jq-a17dd3248a666d01be75f6b1... | NOK | http://autobuild.buildroot.net/results/08e80a6c95a373fc1638141165423b97d2abc12a |     
  riscv64    |          json-c-0.16           | NOK | http://autobuild.buildroot.net/results/5c0a0cf00b9089d1012fc98bafcaf5bb541b6925 |     
    i686     | kvmtool-f77d646ba01d04be5aa... | NOK | http://autobuild.buildroot.net/results/e2db193e9782d53cc805b2de7d541ded5bde69d3 |     
powerpc64le  | libcamera-ba6435930f08e802c... | NOK | http://autobuild.buildroot.net/results/bdb327b805b185c0eca9679a20b449b23c66a0ed |     
  riscv64    |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/f23b0f40cdfa250f2dbb16fb669bf195fc006315 |     
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/3643ca769850ed60e8ffc44726d1f1e2270d8905 | ORPH
    i586     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/44b960cddce5d3e797553c3ad7ae551b041a2ed2 | ORPH
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/e755354d5ed072c85791e395b3fc7f9df47a186d |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/52d62fa8b591ee7ddd37e1353adc31b8cba16913 |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/7c59a9dd0d8a4665613a3eb45382e98731318874 |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/eb05b769cdac512c3ad0411dc5a6c5fe5420f787 |     
 aarch64_be  |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/da8086f7ad85dea250bebebe5f837889de515694 | ORPH
 aarch64_be  |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/8ed35f623d4c9616039f77ee5f2ced9b8d1d6580 | ORPH
 aarch64_be  |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/351850414b9f55af65d4a3bbbdd836a703891a26 | ORPH
   armeb     |         libressl-3.6.1         | NOK | http://autobuild.buildroot.net/results/96b1429bb608cfd93a0ed6f50f1ae5ae6ca2cfc9 | ORPH
  mips64el   |        libuhttpd-3.14.1        | NOK | http://autobuild.buildroot.net/results/e53ac38130824bfa2c890746bc92ba975e718b88 |     
   mips64    |      linux-5.10.145-cip17      | NOK | http://autobuild.buildroot.net/results/8caf665e1696f46db5a8c6bac9e3c1f937b33ce0 | ORPH
  riscv64    |    linux-5.10.145-cip17-rt7    | NOK | http://autobuild.buildroot.net/results/467dae29835ee2e68a976a4772909863a99acee4 | ORPH
  mips64el   |          linux-6.1.2           | NOK | http://autobuild.buildroot.net/results/6864c0295a36ff3866af4fca6b24e85a71e284ad | ORPH
 microblaze  |          linux-6.1.2           | NOK | http://autobuild.buildroot.net/results/ba77d4ceec291111d315064662f4ccd2d5f1510e | ORPH
    i686     |          linux-6.1.2           | NOK | http://autobuild.buildroot.net/results/cf7e1b24bf1754386a9cfef794c0a9612d655224 | ORPH
   x86_64    |          linux-6.1.2           | NOK | http://autobuild.buildroot.net/results/710f9e228b4de33f49d3cd02c813903e1b2408d9 | ORPH
   mipsel    |          linux-6.1.2           | NOK | http://autobuild.buildroot.net/results/1fec268f18932a303b97d958329c18fe4b70874d | ORPH
    i686     |          linux-6.1.2           | NOK | http://autobuild.buildroot.net/results/daad21f3d79fdbf57e0902c00852e37697433133 | ORPH
  sparc64    |          linux-6.1.2           | NOK | http://autobuild.buildroot.net/results/e2fa56261031c1b95ed7cc74d10c85a06e7571e2 | ORPH
  mips64el   |          linux-6.1.2           | NOK | http://autobuild.buildroot.net/results/ceb925c12277f0f52c56d4323ce8bfdcc83f357c | ORPH
   x86_64    |          linux-tools           | NOK | http://autobuild.buildroot.net/results/767ee6bc45270ae0d63cbe815ed73658059494d4 | ORPH
   mipsel    |       lirc-tools-0.10.2        | NOK | http://autobuild.buildroot.net/results/c1f9b84e95ced77710673741ad59272e1c44cc40 | ORPH
powerpc64le  |     ltp-testsuite-20220930     | NOK | http://autobuild.buildroot.net/results/a1ef6950c5639fa11b7c146a8612ef2dd00eeba3 |     
    arm      |           lxc-5.0.1            | NOK | http://autobuild.buildroot.net/results/4a780591b4863f30d7ba64c193ad520bc96f9ee5 |     
   s390x     |          mender-3.4.0          | NOK | http://autobuild.buildroot.net/results/970241f44750f1c1b3ccf78099203c462cea3b45 |     
   x86_64    |          mender-3.4.0          | NOK | http://autobuild.buildroot.net/results/432b7f130229afd8c63306e1bd52213db12a0b90 |     
    arm      |          ndisc6-1.0.6          | NOK | http://autobuild.buildroot.net/results/a27ed3c186bfeb579512ac414d6dff8f9f185e5c | ORPH
   x86_64    |         nerdctl-1.0.0          | NOK | http://autobuild.buildroot.net/results/7955861bfa7f60b04074d331040237263001c499 |     
  aarch64    |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/7079418807ec696f1db6bbaf6bddb3f851d2d175 | ORPH
   x86_64    |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/fb2812a6dcb8911e659c1e7e72f45525345bccfc | ORPH
   sparc     |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/31107e54994e06bbd290803ea10b9b1ece9c672a | ORPH
 aarch64_be  |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/4f5607fbeb620f7ca5fc9244d29020bf6ff9ca37 | ORPH
  riscv64    |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/97e25c103f83ead3119f14582c8e84348547bc4d | ORPH
  riscv64    |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/e4411293012d7a56cf8e9dedd350bba6e7febb29 | ORPH
    sh4a     |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/247843d8f2df06f7be3380f9ec403ec8c69caeab | ORPH
  riscv64    |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/7b88d54313cfa1845fc20165985433f0dd252bf0 | ORPH
   sparc     |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/cb6fc30483c2cfe95e68472b108bcb8cde5d88f5 | ORPH
    arc      |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/fc25d347f12b8f2790396f600f3d808064c9d70d | ORPH
 powerpc64   |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/a4c8a7f7cae2b4f3551590c2965cb189b6015722 | ORPH
    sh4      |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/052c5adb900ca9240263c55ac9919ffec1dcd34d | ORPH
   mips64    |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/599a9257c83ad6944b99c9834c98667663041a9c | ORPH
    m68k     |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/fbaeba65af8b21cad84d9d47d381bff1a3a239b1 | ORPH
   x86_64    |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/d984b87093fa48b5be1e1b5e7707a2295af7d97f | ORPH
    or1k     |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/f6f842c0beaa44e3e2d0c7ea49a562361f28d31a | ORPH
    m68k     |      optee-client-3.19.0       | NOK | http://autobuild.buildroot.net/results/7e36207a83b570e89a93e324fde37baddf70ad64 |     
    arc      |      optee-client-3.19.0       | NOK | http://autobuild.buildroot.net/results/f7134d4db605b92cbf44f4e22473e005fb0a4f74 |     
   sparc     |          pcre2-10.42           | NOK | http://autobuild.buildroot.net/results/d786669433c3faae3c36899512e1dac3ea6db221 | ORPH
    arm      |            pdbg-3.5            | NOK | http://autobuild.buildroot.net/results/d3a86a69ba7f5421cc31a1ce86b4c9424458de16 |     
    i586     |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/3328f5e5969077f2ee9f1696d4efb680c766f15d |     
   arceb     |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/45c213f2fa1fc194b4ffb28fd4b81d24bc605127 |     
   arceb     |        pipewire-0.3.62         | NOK | http://autobuild.buildroot.net/results/1ec45a11e5c38c81cd538b28123886a7f5a93ce8 |     
 microblaze  |           pixz-1.0.7           | NOK | http://autobuild.buildroot.net/results/1a0f1f7f20b6eeacf1e3db882c42dfeb51e5d085 |     
  mips64el   |           pixz-1.0.7           | NOK | http://autobuild.buildroot.net/results/b40cdc8ca452bcd97bb6b96c7816bfd5efcb8f47 |     
    mips     |           pixz-1.0.7           | NOK | http://autobuild.buildroot.net/results/056add7ba3191260d99bbd62907a1034fbffaeda |     
powerpc64le  |           pixz-1.0.7           | NOK | http://autobuild.buildroot.net/results/3ca0a64c259c5ec7f3acc7db19fad8bc69785388 |     
   nios2     |           pixz-1.0.7           | NOK | http://autobuild.buildroot.net/results/ff7e4ca0270a16355961f8148c3a1428aa580270 |     
   x86_64    |           pixz-1.0.7           | NOK | http://autobuild.buildroot.net/results/2bcd2af7539dd8bc3736f0737f5d8339e961bf50 |     
   nios2     |           pixz-1.0.7           | NOK | http://autobuild.buildroot.net/results/088b8e5549a05993d357573b525a13e93572997b |     
   x86_64    |           ply-2.3.0            | NOK | http://autobuild.buildroot.net/results/434127e44121ee376c4535c16b2fa5cc269af4ef |     
   x86_64    |           ply-2.3.0            | NOK | http://autobuild.buildroot.net/results/4cea1392d988e527d58d27a0d9acd0ad4bc7777e |     
   sh4eb     |         proftpd-1.3.8          | NOK | http://autobuild.buildroot.net/results/00c8ab9ed7e85b64909ade15cce5f7d9332bc8f8 |     
    or1k     |      proxychains-ng-4.16       | NOK | http://autobuild.buildroot.net/results/0a1d20058132f4713be3d0993a1deb79a0e18305 | ORPH
   x86_64    |      python-bcrypt-4.0.1       | NOK | http://autobuild.buildroot.net/results/ffd8195f91e20be37bcd27f14f7cffd48177f3aa |     
    mips     |      python-bcrypt-4.0.1       | NOK | http://autobuild.buildroot.net/results/1ba35820bfde712f4e800cceea81cd8fbdcb7309 |     
powerpc64le  |      python-bcrypt-4.0.1       | NOK | http://autobuild.buildroot.net/results/db06c9c5bedb894d3d7d21ebd63428e83b918cab |     
   mipsel    |      python-bcrypt-4.0.1       | NOK | http://autobuild.buildroot.net/results/c554a2d1bc1902db8513458e12971379da8ff5d9 |     
  aarch64    |       python-bunch-1.0.1       | NOK | http://autobuild.buildroot.net/results/ff9ea51c0c6cff90cfbf137197e4769be1d5a966 |     
  mips64el   |       python-bunch-1.0.1       | NOK | http://autobuild.buildroot.net/results/4215210f73ded44d8c6564845436d4379a1f802b |     
   mipsel    |       python-bunch-1.0.1       | NOK | http://autobuild.buildroot.net/results/8e71a1beffce1401b1756f52183d7b9801c9a2d9 |     
   s390x     |   python-cryptography-38.0.4   | NOK | http://autobuild.buildroot.net/results/f5bbf5c7fc3f92aeb89e62596b508ba4d5f42f61 |     
    arm      |   python-cryptography-38.0.4   | NOK | http://autobuild.buildroot.net/results/8bb6e7b787eef0b6c5dff783576f4d3eccceb53a |     
   armeb     |   python-cryptography-38.0.4   | NOK | http://autobuild.buildroot.net/results/5aa7bbd235bf2e486ad480f761d11b511c212216 |     
    mips     |   python-cryptography-38.0.4   | NOK | http://autobuild.buildroot.net/results/c090912805e6251a54c8fb00e90c68a34990ebca |     
   sh4aeb    |      python-numpy-1.23.5       | NOK | http://autobuild.buildroot.net/results/9aaffb92a8b769fd7fa556285b5fe25a0ff0a935 |     
    mips     |      python-numpy-1.23.5       | NOK | http://autobuild.buildroot.net/results/382393023f383b3db6257ad08911b45d81949b97 |     
    arc      |         python3-3.11.1         | NOK | http://autobuild.buildroot.net/results/bd120cbab030488ae31f033b3f410a21c18560e9 |     
 microblaze  |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/f41e9063ff1f92dffc3447b3595928e811cdabd5 |     
    or1k     |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/f3d02559f1570211960dde60523745e20a7dc1b6 |     
microblazeel |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/03ba6cdbdfbccf9fcee3e4dc3f43fc92949f9b7d |     
 powerpc64   | ripgrep-af6b6c543b224d348a8... | NOK | http://autobuild.buildroot.net/results/e2027fc27c95e9f6153b32ea71f2960e388cc842 |     
  sparc64    | ripgrep-af6b6c543b224d348a8... | NOK | http://autobuild.buildroot.net/results/a0cdb6cc9493f5248d98f98b13da854e12adc2be |     
  aarch64    | rtl8812au-aircrack-ng-e7a4a... | NOK | http://autobuild.buildroot.net/results/275bdf42157e53c275acb3a50e64c56056b206fa |     
   mips64    |         rtl_433-22.11          | NOK | http://autobuild.buildroot.net/results/4f44ff1cb330b405db1228de71e521ad9cabd801 |     
    sh4      |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/552406ef5847097a9d48d2ee41f4acd5a4eaddcb | ORPH
 aarch64_be  |            sed-4.9             | NOK | http://autobuild.buildroot.net/results/2e745d568116930a3f4cf0e2815646d8d99cc8b6 | ORPH
   sparc     |          sscep-0.10.0          | NOK | http://autobuild.buildroot.net/results/4d9cac2247d450cc2df8e5d3f8ed680586f485c3 |     
  aarch64    |         sudo-1.9.12p1          | NOK | http://autobuild.buildroot.net/results/75b94c7b590c5f793d126c518ec4a98127770f70 | ORPH
   sparc     |         sudo-1.9.12p1          | NOK | http://autobuild.buildroot.net/results/84edd04b006d1165f13ad54199d2df4c9148f898 | ORPH
    mips     | toolchain-external-codescap... | NOK | http://autobuild.buildroot.net/results/9663c29449658091ac6abfa92edf30e525dcf4fe | ORPH
    mips     | toolchain-external-codescap... | NOK | http://autobuild.buildroot.net/results/3770205066584356aabbaed19000d9274b57b698 | ORPH
 powerpc64   |          trinity-1.9           | NOK | http://autobuild.buildroot.net/results/d8c564bdc340b1159311ddfc0a1281913d49a899 | ORPH
  powerpc    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/81d1adab30ea9c3d5dbe44473a69ba5ac388ddf7 |     
  powerpc    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/67c981cf4d6d99ae17c9cdbafcf10d770739ac8c |     
  sparc64    |            unknown             | NOK | http://autobuild.buildroot.net/results/0ecae2af22da8cf882151af30aa84678f426134c |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/5fa240db9e6b1010ecadd12fc3175194b0b212f0 |     
    mips     |            unknown             | NOK | http://autobuild.buildroot.net/results/10f103f4a74ac4b2f08179a1c9422343771b72a9 |     
   s390x     |            unknown             | NOK | http://autobuild.buildroot.net/results/78ef0ebb17582c3434054b53290a20deabd74d05 |     
  sparc64    |            unknown             | NOK | http://autobuild.buildroot.net/results/c3e6dc5d0434b4e80e48b6c657c2b28ee9969cf2 |     
    i686     |            unknown             | NOK | http://autobuild.buildroot.net/results/5e6adf29c16a31a6596d52065b160bc1a2177f3a |     
   mipsel    |        valgrind-3.19.0         | NOK | http://autobuild.buildroot.net/results/8d159aa77c05bd8b8b92623dc02b50581c4adc3e | ORPH
  riscv32    |      wireshark-legal-info      | NOK | http://autobuild.buildroot.net/results/552286b6d61dec550147e0dd38ea0f86b30e977b | ORPH
  riscv32    |         wolfssl-5.5.3          | NOK | http://autobuild.buildroot.net/results/be0f958c4e7850f4174b3b1d5e18aab74ab079ee |     
  riscv32    |         wolfssl-5.5.3          | NOK | http://autobuild.buildroot.net/results/8441db010330c16aef9796cf9ff3184013e2db0f |     
    mips     |         wolfssl-5.5.3          | NOK | http://autobuild.buildroot.net/results/9335c5c8eb8cc9f560b3a47d647d32c457dc8d97 |     
 microblaze  |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/1eb7d03939540d71e6c2aa7323a14cc8b96f6c31 | ORPH
microblazeel |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/98e56220780017ad9a4fc82767a1bc1235018ea3 | ORPH
microblazeel |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/2543d22489c7c03e7dec2cf5b0239e46f8d31445 | ORPH
 microblaze  |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/9dd0abc26dbc124f2c3783a1e96f764aea0fa74f | ORPH
microblazeel |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/fd010fc65d9014dee65f55901a305d8927fd1e9c | ORPH
 microblaze  |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/8460726cbe8c23a6d3f5b8a023d6a7bd05f6a712 | ORPH
microblazeel |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/4f2c13a5801b99a5cd6c637b797b7a7568e19103 | ORPH
 microblaze  |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/623f31cfebddda159dd02d4432f583893bae04fd | ORPH
 microblaze  |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/e2c6174cd570bfe9dea59b548f84a68a4820a235 | ORPH
microblazeel |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/8808cea31af8108e41a62eba74592d3d92172f16 | ORPH
 microblaze  |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/1569ed0b5370f2fa7bd5594b29d5838dc37019a8 | ORPH
microblazeel |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/d1fdccd11945b4fd5f3fc982540b296cd51b3620 | ORPH
   s390x     |          zabbix-5.4.9          | NOK | http://autobuild.buildroot.net/results/27d8473de815abbc4fcebdef502b031a1c4843fe |     
  mips64el   |          zabbix-5.4.9          | NOK | http://autobuild.buildroot.net/results/90bc8b453b07ed524b02ae61803e69914b6c2811 |     
 microblaze  |           zstd-1.5.2           | NOK | http://autobuild.buildroot.net/results/ff4d24d55614ce78ea4234972438a9f29a7c8ed6 |     


Classification of failures by reason for 2022.11.x
--------------------------------------------------

/home/buildroot/autobuild/i... | 1 
               ding-libs-0.6.2 | 1 
                     frr-8.3.1 | 1 
                 fwts-22.09.00 | 1 
                    gdal-3.5.1 | 1 
glibc-2.36-66-ga1dc0be03c9d... | 1 
              host-rust-1.64.0 | 1 
                  linux-6.0.16 | 1 
          lttng-modules-2.13.1 | 1 
                       unknown | 1 
                      x265-3.5 | 1 
                      xz-5.2.7 | 1 


Detail of failures for 2022.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   arceb     | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/24eccfcb6e44f2b2b6c11dfb0b6d7121240e5afc |     
    arc      |        ding-libs-0.6.2         | NOK | http://autobuild.buildroot.net/results/572edb3211193bdc143d21d20f3f4c3c2eb07d3f |     
  mips64el   |           frr-8.3.1            | NOK | http://autobuild.buildroot.net/results/2c4768103d173d3130e16c2f960c98a88d929ffa |     
    arm      |         fwts-22.09.00          | NOK | http://autobuild.buildroot.net/results/0ccd383835ddcfedf5afca9c7045f37000510526 |     
    or1k     |           gdal-3.5.1           | NOK | http://autobuild.buildroot.net/results/8417a3b6ced58447ccec2f103ec5669d3132e202 |     
  powerpc    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/0db634d997c4cc41a895489f4046adf58f46c747 |     
powerpc64le  |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/3255116af522159528bc1a971bb0cc7f9936a7a3 |     
   armeb     |          linux-6.0.16          | NOK | http://autobuild.buildroot.net/results/7f5a6cf019c4d430d59a0a3d4e3e491464f476d8 | ORPH
 powerpc64   |      lttng-modules-2.13.1      | NOK | http://autobuild.buildroot.net/results/cb87015b5d2e827589ea1250458b90d079fd2868 |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/952dcf9c8de881efdd923d91e0167de4c26bf495 |     
  aarch64    |            x265-3.5            | NOK | http://autobuild.buildroot.net/results/45740d7360f350bdf8b4fb87aa7af10ab82360ff |     
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/393951648001abf354ce945fc6fffead10f5e9e4 | ORPH



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
