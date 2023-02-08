Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C958BC636CC
	for <buildroot@archiver.kernel.org>; Wed,  8 Feb 2023 07:11:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 30AEC40B93;
	Wed,  8 Feb 2023 07:11:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 30AEC40B93
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XRSUK8Nhv8yP; Wed,  8 Feb 2023 07:11:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AF86440B88;
	Wed,  8 Feb 2023 07:10:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AF86440B88
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DD5531BF3BB
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 07:10:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ABFF681EBE
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 07:10:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ABFF681EBE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 16xTJbD2ifEh for <buildroot@lists.busybox.net>;
 Wed,  8 Feb 2023 07:10:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5972781E7D
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5972781E7D
 for <buildroot@buildroot.org>; Wed,  8 Feb 2023 07:10:55 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id B61B31BF20A
 for <buildroot@buildroot.org>; Wed,  8 Feb 2023 07:10:52 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Wed, 08 Feb 2023 07:10:52 -0000
Message-Id: <20230208071058.ABFF681EBE@smtp1.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1675840252; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=8GQReymFzipg1YJr13Ev17g3tp9aHMdX7kPxsHIjWeU=;
 b=IIwYZ1lN+toVCYyhAPKkdG6ZbvcoZEzbzNnaM2dMgEF9nUZuTdjwizG8KbuKdYFwgdtBIX
 4vfnpk6vr9QyFUKaCvDDlAdEUUVohGzliQBg2+44E5FEyFIfYodnasRymZwEbaU77yFY/m
 IxVevQM6uzVIw2ab7v0Fxa7X5Ie+ztXsQTrqlBChOrAD+JUOBam/1d0k83B3FcfSQkEl9y
 32L1l0kQ+UvQpUqmx4x7WTVkpasfSr+O3pLRAimbEQ+J/HFRI6kg2/Xd9C0E7Id5kTQ1nY
 W5+Asza3dZwp3zAadr/X/8MFHu73fZ7i3OMfzZzkR6OtsUsSnnoV2wD7a1Ey0w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=IIwYZ1lN
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-02-07
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

Autobuild statistics for 2023-02-07
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  |  4  |  2  |  0  |  6  |
  2022.11.x  | 22  | 23  |  0  | 45  |
    master   | 154 | 189 |  0  | 343 |

Classification of failures by reason for master
-----------------------------------------------

  gobject-introspection-1.72.0 | 10
                   linux-6.1.9 | 8 
                     xz-5.2.10 | 8 
                elfutils-0.186 | 7 
              host-pahole-1.24 | 7 
                  jack2-1.9.21 | 7 
             libgpg-error-1.46 | 7 
                       unknown | 7 
                    norm-1.5.8 | 6 
            host-binutils-2.38 | 4 
  host-libxml-parser-perl-2.46 | 4 
              host-rust-1.67.0 | 4 
         host-sentry-cli-2.8.0 | 4 
              libgcrypt-1.10.1 | 4 
               libglib2-2.72.3 | 4 
                  ntp-4.2.8p15 | 3 
            ocf-linux-20171122 | 3 
           python-bcrypt-4.0.1 | 3 
            python-bunch-1.0.1 | 3 
    python-cryptography-39.0.0 | 3 
                   bash-5.2.15 | 2 
                  cairo-1.16.0 | 2 
       freeradius-client-1.1.7 | 2 
            host-binutils-2.39 | 2 
       host-gcc-initial-10.4.0 | 2 
                host-go-1.19.5 | 2 
         host-libarchive-3.6.2 | 2 
               host-runc-1.1.4 | 2 
                   libnss-3.87 | 2 
                libsolv-0.7.22 | 2 
                   perl-5.36.0 | 2 
            quickjs-2021-03-27 | 2 
                 sudo-1.9.12p2 | 2 
                  zabbix-5.4.9 | 2 
                  assimp-5.2.5 | 1 
                    bat-0.19.0 | 1 
  binutils-arc-2020.09-release | 1 
                    brltty-6.5 | 1 
                busybox-1.36.0 | 1 
                 coreutils-9.1 | 1 
                 dmalloc-5.6.5 | 1 
                    dust-0.8.1 | 1 
                     efivar-38 | 1 
                  ffmpeg-4.4.3 | 1 
              fluent-bit-2.0.8 | 1 
             fontconfig-2.13.1 | 1 
                     frr-8.4.2 | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /tmp/... | 1 
                gerbera-1.10.0 | 1 
glibc-2.36-81-g4f4d7a13edfd... | 1 
google-breakpad-c85eb4a59b6... | 1 
                    gpm-1.20.7 | 1 
            host-binutils-2.37 | 1 
             host-delve-1.20.0 | 1 
         host-gcc-final-11.3.0 | 1 
host-gdb-arc-2020.09-releas... | 1 
     host-moby-buildkit-0.11.2 | 1 
              host-rust-1.66.1 | 1 
              hyperfine-1.14.0 | 1 
                jemalloc-5.3.0 | 1 
      libabseil-cpp-20220623.1 | 1 
               libdeflate-1.15 | 1 
              libxcrypt-4.4.29 | 1 
               lightning-2.2.0 | 1 
     linux-5.10.162-cip24-rt10 | 1 
             lirc-tools-0.10.2 | 1 
        ltp-testsuite-20220930 | 1 
                  mender-3.4.0 | 1 
                    mosh-1.4.0 | 1 
              mosquitto-2.0.15 | 1 
               openblas-0.3.21 | 1 
                opencv3-3.4.17 | 1 
                 openssh-9.1p1 | 1 
                    opkg-0.4.5 | 1 
           optee-client-3.19.0 | 1 
                     ply-2.3.0 | 1 
           python-numpy-1.23.5 | 1 
                   qpdf-10.5.0 | 1 
                 rtl_433-22.11 | 1 
                    ruby-3.1.3 | 1 
                    sdl-1.2.15 | 1 
               tcf-agent-1.7.0 | 1 
toolchain-external-codescap... | 1 
           uboot-tools-2021.07 | 1 
                 uclibc-1.0.42 | 1 
               valgrind-3.19.0 | 1 
                 wolfssl-5.5.3 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |          assimp-5.2.5          | NOK | http://autobuild.buildroot.net/results/369364fb03677d36f9f0895b64dbbdc9b4840905 | ORPH
   sparc     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/a5eec813d00c88b8418b7ed8f3ae0d32cc4f42d2 | ORPH
    sh4      |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/7387e42f025e1d40c062d519a5e82e7ec2100bbe | ORPH
   s390x     |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/87ff6f6f5b92254ba7a119b7220d8b452a75031c |     
   arceb     |  binutils-arc-2020.09-release  | NOK | http://autobuild.buildroot.net/results/2c24bc780bf45e6c2d2ebbabc216a0144ed5605f |     
microblazeel |           brltty-6.5           | NOK | http://autobuild.buildroot.net/results/ddff46b136f7a06a3cd17b7bd2035ea818279c77 |     
    mips     |         busybox-1.36.0         | NOK | http://autobuild.buildroot.net/results/39259b5d19570cf5320bff34deaae4bdcbd94218 | ORPH
    arm      |          cairo-1.16.0          | NOK | http://autobuild.buildroot.net/results/25500de8b56a736ef6882cd6024dc6e47fbfae24 |     
    arm      |          cairo-1.16.0          | NOK | http://autobuild.buildroot.net/results/ead46ad592b9464fb8528e226a08a72eb54f8b1f |     
   sh4aeb    |         coreutils-9.1          | NOK | http://autobuild.buildroot.net/results/17881a17e2a62f3f0756dabb4e645d4a8d029b72 | ORPH
  powerpc    |         dmalloc-5.6.5          | NOK | http://autobuild.buildroot.net/results/22fefed9ac5f097929a4e1c2c08e240a6ceb1d2f | ORPH
 powerpc64   |           dust-0.8.1           | NOK | http://autobuild.buildroot.net/results/c480f50fdb370f75d8114c04525f8038cf7209d1 | ORPH
    arm      |           efivar-38            | NOK | http://autobuild.buildroot.net/results/b6caf7157cc030575d1b88715dffa3fe9135045d |     
   arceb     |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/77f78162b7120d3d81c57233d67c66f2b7dae079 | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/9bf79715f52b96d09b10c151568652579e4b91b4 | ORPH
   arceb     |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/4dbfdf37f37c065a064e29d3a0266851165b0d76 | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/9c345a5d3762715866b38b7542d196110b029c63 | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/da326dbf644fcc47fb9b9f625e2ed284b4682786 | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/3cb1f817f94ae29b962cd0020f608cfe139d15e5 | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/6fe4cf52ff89da6df7edff12c4bb92efe2ecb783 | ORPH
    arm      |          ffmpeg-4.4.3          | NOK | http://autobuild.buildroot.net/results/6e577ef6458cf752ddf8c1e4e2e28145a36a365e |     
   s390x     |        fluent-bit-2.0.8        | NOK | http://autobuild.buildroot.net/results/8a1e017f57a3a1da0e692995ffe2974a6aae3154 |     
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/0ba6e1419700f7f2e14c91ed8c75f156d3c02972 | ORPH
  riscv64    |    freeradius-client-1.1.7     | NOK | http://autobuild.buildroot.net/results/a67b10eb688689b4ee7c42af0e1f53a36ea14b09 |     
  riscv64    |    freeradius-client-1.1.7     | NOK | http://autobuild.buildroot.net/results/443502c7c4134eb942e790c94ff2265af455b3da |     
   xtensa    |           frr-8.4.2            | NOK | http://autobuild.buildroot.net/results/63f8a5b01522c3674798103ced95e0a7b5aa62f3 |     
    m68k     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/6d1b4495b4a48337a3948f58b294a36472848b8b |     
powerpc64le  | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/c45b87281222bcdc4b802de4f457e3955eb466c9 |     
    arc      | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/e81c9a1567d9933672e478acfd23ef16405c73b9 |     
    arm      |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/a3c51db5e8d45b0aa668688747a147988019bad2 |     
  powerpc    | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/ea241163e72a5e35e265633598e48667eea670f8 |     
 powerpc64   |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/0e8a955d91c155598c6bb39b3cee37461800eceb | ORPH
   nios2     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/5822f300f70ff0c54ef6703204d3b8600dd25623 | ORPH
    i686     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/31ae7237bca0b133cb6fe0867917523eafe281d7 | ORPH
    or1k     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/aed8a025eebf8806379c342a6c5d88fb427af532 | ORPH
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/f134044e45fbf8fca658cd5e74596570e239494c | ORPH
 powerpc64   |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/1a8b36cce91302c6c10bbe81dd9cf86ad747eb21 | ORPH
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/5e8aa41a618a512a6ee3c9732b24c6336dffa6e7 | ORPH
 powerpc64   |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/7306353b97e5601d9c41369c0965038bd99b27ab | ORPH
  powerpc    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/5d334e95e9967e489b16ffd7d8ccb1d65326c1b5 | ORPH
    or1k     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/5dd22984664f63f3f3d85afb4be26ffc50ce6bb7 | ORPH
    arm      | google-breakpad-c85eb4a59b6... | NOK | http://autobuild.buildroot.net/results/c932b37dcc5009f6eff130145640bc8f97942fd1 |     
   mips64    |           gpm-1.20.7           | NOK | http://autobuild.buildroot.net/results/f184254ffaeb9ac220080182388df86c74811f91 |     
 aarch64_be  |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/4a19d203cbae166b127e427b6ff9dc5987be4a99 |     
   s390x     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/e63033b9fbc27fa2d86819cea1a854a1484f88ee |     
  aarch64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/5e7a9a0c401b300064a03404250e6c82c0dad47c |     
    or1k     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/739be78400db2f4053cc42163caf2f34f9102296 |     
  powerpc    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/e7db68f3921c7ecca96aad878836fe541d05a35b |     
   nios2     |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/68a9d2e5281d33870fd1a58e4afb7555ae5f2cc1 |     
   nios2     |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/63921029c9d2302eef577cd7ba97f7e2dae16fe3 |     
  riscv64    |       host-delve-1.20.0        | NOK | http://autobuild.buildroot.net/results/482d53008d13fcce7727e80dcb4cac558c247892 |     
   arceb     |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/28417f0d08aa2476dcc32b0ac5f400d852b7eac6 |     
   sparc     |    host-gcc-initial-10.4.0     | NOK | http://autobuild.buildroot.net/results/43d0d72c5512f5c47ae03064df9d928e2e7fa3aa |     
   mipsel    |    host-gcc-initial-10.4.0     | NOK | http://autobuild.buildroot.net/results/0d6d8071b576f39c023e08202f2cc5834a6e0124 |     
    arc      | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/cef1626e6a176abc1515ae6623e7c1e74799fcff | ORPH
powerpc64le  |         host-go-1.19.5         | NOK | http://autobuild.buildroot.net/results/34c4169c8bdcc76631a0802b8192c3f5101b9d40 |     
  mips64el   |         host-go-1.19.5         | NOK | http://autobuild.buildroot.net/results/402b7df63416e399bd82afd2acc85e1081e3cb18 |     
    m68k     |     host-libarchive-3.6.2      | NOK | http://autobuild.buildroot.net/results/5bbc80c994f6e374c99ec9893c4f2b5e99d8c9fd |     
   s390x     |     host-libarchive-3.6.2      | NOK | http://autobuild.buildroot.net/results/656789900210563458db18e85e2c4822c9cc568d |     
   sh4eb     |  host-libxml-parser-perl-2.46  | NOK | http://autobuild.buildroot.net/results/b159a497f159764e481abc7270b49991776bbc29 |     
powerpc64le  |  host-libxml-parser-perl-2.46  | NOK | http://autobuild.buildroot.net/results/509c057bc68c9f88eca61aa4329d2053bb07cc6f |     
 powerpc64   |  host-libxml-parser-perl-2.46  | NOK | http://autobuild.buildroot.net/results/8941db077afdd3e2ce5f19b367770d290f53463c |     
    i586     |  host-libxml-parser-perl-2.46  | NOK | http://autobuild.buildroot.net/results/1667b4ebd8e16e7d8b47bc3ca128a76daf27b4d9 |     
    arm      |   host-moby-buildkit-0.11.2    | NOK | http://autobuild.buildroot.net/results/1c99bee6ca50a616a9d051680f2a5e2b2a8bc5c6 |     
 microblaze  |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/072a93370150c48c7b9e217a88d679607e8aa8ba |     
   x86_64    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/acdc8a14ef350aab3f7bac1751447e6f16032392 |     
    arc      |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/9a680f7f0e6a6b816965ee87b9a05b56f5aeedf2 |     
   s390x     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/84325744ad149e89e03e7c5bfa0b226d35cb2df2 |     
   armeb     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/e5b52367fd30545bca59d9d7432117dd0f5d5427 |     
    mips     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/c131098c4e6565d1057d4496f0bd6c62601e0586 |     
  riscv32    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/db092d2d68bfd38045f585a282a0f87704a995d6 |     
 microblaze  |        host-runc-1.1.4         | NOK | http://autobuild.buildroot.net/results/a4b8651fd53839b44015c6e31d491dd24125f65b |     
  riscv64    |        host-runc-1.1.4         | NOK | http://autobuild.buildroot.net/results/3633cfbd6b9c61a78a085695a6ab481691241acd |     
   x86_64    |        host-rust-1.66.1        | NOK | http://autobuild.buildroot.net/results/35d10808c36ec5819b000e0714961d46e3661913 |     
  aarch64    |        host-rust-1.67.0        | NOK | http://autobuild.buildroot.net/results/214fcbb3458893784b7f85b60f7ee1edb428c77f |     
   s390x     |        host-rust-1.67.0        | NOK | http://autobuild.buildroot.net/results/94d9916d5aa662e6f600699cab3bc02ff718247b |     
   s390x     |        host-rust-1.67.0        | NOK | http://autobuild.buildroot.net/results/081c59f8586dc35cb5482848e304be473c4b1c35 |     
    i686     |        host-rust-1.67.0        | NOK | http://autobuild.buildroot.net/results/133a60a9ea8ea72298f259da47b54575d81f8ab3 |     
   mips64    |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/7e214009f2464e379ef8e466dac792d212d89723 |     
    arc      |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/4a344740169f7877e57c1f3d2571680033406de6 |     
 powerpc64   |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/c06d0065340d94f3fea14b7d19512c2e95277d4c |     
  aarch64    |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/914dc3fdfc32cb34265e4cd5cc63e48a4a3e2f9e |     
    i686     |        hyperfine-1.14.0        | NOK | http://autobuild.buildroot.net/results/fa32372398ddd3c5dcc7311a571ec3b2e3328a23 | ORPH
 aarch64_be  |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/ca97bf61bea150fbd9e5085382ff7eff16645d3c |     
    or1k     |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/c5a51ae1ffca857372825a044b9f7183483c8656 |     
    i586     |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/a9a99e0ef6754e3a9cbb6a87ddc072de5ad2c0b0 |     
   x86_64    |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/5f9f0591e99357d199b2e654c945416e631eba36 |     
   x86_64    |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/4bed6de09e27729a1f9190bc5d334f876b58e86a |     
 microblaze  |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/28f2b6f360179d46bcfd23b85d6ec216a3ab865d |     
microblazeel |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/aa049eb39eb52d8dceafd3694648045a6acd85ee |     
   sh4aeb    |         jemalloc-5.3.0         | NOK | http://autobuild.buildroot.net/results/294c639cafd67f12151932cc0ab3d0d44230f4c1 |     
  mips64el   |    libabseil-cpp-20220623.1    | NOK | http://autobuild.buildroot.net/results/783f33881f2d83f3b3578acf159b7914c4bca757 |     
    arm      |        libdeflate-1.15         | NOK | http://autobuild.buildroot.net/results/83e68fae08c2391f8fb4b41b76fcdcbc6efaea80 |     
    arm      |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/edcbecc775dc1ca57aa5768736d31101b123d86f | ORPH
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/a1b02acc4ea7f7c5c21e4553f51ce9c70202fc87 | ORPH
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/735b12bf38b1b03aef910bc93211f05200cc06a0 | ORPH
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/7a97dc5d8158fc5197865747c69bc8481916c048 | ORPH
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/b04bfc92e7423bf4df640424833f5b52775c491f |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/7dd51dab00ec4d2648b735b56bf38c08603ceaba |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/e9358d8b0cb2c2ee2c8998cadbc7cebe8c07fdf6 |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/7da758345002eb670853646bcdf0e5359efb047e |     
  aarch64    |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/b89852411d06e0bb79fd18e0c91a247421ddb48c | ORPH
 aarch64_be  |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/149d316b80613f97746ff0a1fdbdf4cf4ed2406c | ORPH
  aarch64    |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/ec803460a63594843a6d8d2b91c8edb58538f00a | ORPH
 aarch64_be  |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/a0c6b5a6e202e59c7f40c97d838b0ed4ffd02594 | ORPH
  aarch64    |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/6b8093a3cb26cbea5089765380efe2e39315b191 | ORPH
  aarch64    |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/faf7be9344a95baa6e73415ffd67016454ee2cbe | ORPH
 aarch64_be  |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/1a26f3d5e449ef5ddb546e0bb754f9918828455e | ORPH
 microblaze  |          libnss-3.87           | NOK | http://autobuild.buildroot.net/results/eb99f24f00a578c270a76f4142f1f692f3ee3f6a |     
    i486     |          libnss-3.87           | NOK | http://autobuild.buildroot.net/results/3c8d15a0498a1c2ef1aa9e4fd8dfd330f07c2808 |     
   nios2     |         libsolv-0.7.22         | NOK | http://autobuild.buildroot.net/results/f90ae4c6fd523e1df79ab89522b8dc74e2e3df8a |     
    arm      |         libsolv-0.7.22         | NOK | http://autobuild.buildroot.net/results/2adb760067bf333cf079494e8fa17688aa4b537e |     
   nios2     |        libxcrypt-4.4.29        | NOK | http://autobuild.buildroot.net/results/0d44b92ba0320da923e665cda9d5d6739a3f5409 |     
   sparc     |        lightning-2.2.0         | NOK | http://autobuild.buildroot.net/results/35025cb5ad509770a7198d9b6b1b25a375ddde05 |     
  riscv32    |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/ede8bd2897e5b387a560e33e5cbf765bdb687e3b | ORPH
  powerpc    |          linux-6.1.9           | NOK | http://autobuild.buildroot.net/results/9a4232a6e0d1960ddba9aed9e778a60d813d25ba | ORPH
   mips64    |          linux-6.1.9           | NOK | http://autobuild.buildroot.net/results/c74b1040e5a0d2f2619ee81ef9f2d925862d6f7b | ORPH
   mips64    |          linux-6.1.9           | NOK | http://autobuild.buildroot.net/results/766a85c985c894753d2fb39555b7861a9cc5ffd2 | ORPH
    sh4a     |          linux-6.1.9           | NOK | http://autobuild.buildroot.net/results/1f7afb73947794da50f336f272790dc7b426923b | ORPH
  sparc64    |          linux-6.1.9           | NOK | http://autobuild.buildroot.net/results/a90cf3cdd92c41eba1c5598abcbd6763af95b91d | ORPH
   mips64    |          linux-6.1.9           | NOK | http://autobuild.buildroot.net/results/8ef5a507978b1d9476609021dd7d873b0122e344 | ORPH
  mips64el   |          linux-6.1.9           | NOK | http://autobuild.buildroot.net/results/e05e46b38334c537c3ee9e78ae69008d8529305f | ORPH
 powerpc64   |          linux-6.1.9           | NOK | http://autobuild.buildroot.net/results/a85a388e79457e59b96d8c1e1cdc711b8d301801 | ORPH
  powerpc    |       lirc-tools-0.10.2        | NOK | http://autobuild.buildroot.net/results/1e8d4c44bbb041706c1b53b0fe3db341b14af529 | ORPH
    arm      |     ltp-testsuite-20220930     | NOK | http://autobuild.buildroot.net/results/54da73c9bc2303885dc76861c818c3dbda39a9b6 |     
   x86_64    |          mender-3.4.0          | NOK | http://autobuild.buildroot.net/results/2bd80939b54f3e562af649f7a19a9d4148c8b91a |     
   s390x     |           mosh-1.4.0           | NOK | http://autobuild.buildroot.net/results/820e98b1c126469b1f180f078d102ded43b9c40e |     
    or1k     |        mosquitto-2.0.15        | NOK | http://autobuild.buildroot.net/results/e41611fb58a74a148294b17825555e314031cbc4 |     
    mips     |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/c2855d4a9465c29dd4a3e59d4f512a6fe462358b | ORPH
    arm      |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/14d1c8a46c0dfba1dfa666f0659808028929f9d1 | ORPH
   mipsel    |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/83644d2e049c767b4b517e77e20f9b921e264fd9 | ORPH
 aarch64_be  |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/90bc9c9df8d2646d8e68329710f3e36ae1697c97 | ORPH
    sh4a     |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/7dd9bf42c85f962638d0db641602243458243059 | ORPH
powerpc64le  |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/5960316e2be97b2aa047654f17364e8a4a120feb | ORPH
  riscv64    |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/459addd7bb5bd17ee2e11e24c3029c5ee3733460 | ORPH
  riscv64    |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/b61802195164e0ad34cbf97b21564b6177f26b0d | ORPH
  riscv64    |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/ea863135e793e5c72042a759f28be58fbf84ee01 | ORPH
microblazeel |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/13b89b2bd548576bd4f666fff7e8c9a4a06edfab | ORPH
 microblaze  |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/b80a3096303aac250f1be85a97a71bfdb0496230 | ORPH
  aarch64    |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/ef326909228e905ff482410785646eeadb27568c | ORPH
  mips64el   |        openblas-0.3.21         | NOK | http://autobuild.buildroot.net/results/8e1dfc1326aa047ecf070e8ff59566a77bde5fa2 | ORPH
   mips64    |         opencv3-3.4.17         | NOK | http://autobuild.buildroot.net/results/88b4081bb9a4d4b088cbf55ef444a2b374db5622 |     
    m68k     |         openssh-9.1p1          | NOK | http://autobuild.buildroot.net/results/21d61e81c940c75f8f474fd4270c389d791f0b36 | ORPH
    or1k     |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/4fedaa7352154064f4a7b7e301faf87976956c52 | ORPH
 powerpc64   |      optee-client-3.19.0       | NOK | http://autobuild.buildroot.net/results/d48aa36a8c1447f07053402eb39eaeb86be5a870 |     
    arm      |          perl-5.36.0           | NOK | http://autobuild.buildroot.net/results/32e304a37e8e4d0e962ad898d7ed9b3de4ab4eb1 |     
powerpc64le  |          perl-5.36.0           | NOK | http://autobuild.buildroot.net/results/a2cf6b20fc746a07738b00876f05c33a29422a19 |     
   x86_64    |           ply-2.3.0            | NOK | http://autobuild.buildroot.net/results/8210bd2b9c67d6d7616ada525019b2658195416a |     
  sparc64    |      python-bcrypt-4.0.1       | NOK | http://autobuild.buildroot.net/results/79236e3f9a58493561d50dec3187902262294346 |     
    i686     |      python-bcrypt-4.0.1       | NOK | http://autobuild.buildroot.net/results/e676d3e3db2deb33b984cd39f02766a7c410449d |     
  aarch64    |      python-bcrypt-4.0.1       | NOK | http://autobuild.buildroot.net/results/7c16e5c8548041682dc8fc4521e7e989133d9938 |     
   mips64    |       python-bunch-1.0.1       | NOK | http://autobuild.buildroot.net/results/c9d2e9830bd25d2f95c67fb7ea5cfda95a57414f |     
powerpc64le  |       python-bunch-1.0.1       | NOK | http://autobuild.buildroot.net/results/c51deff4d3e536819085dc2ad127cd311eb2e9de |     
    mips     |       python-bunch-1.0.1       | NOK | http://autobuild.buildroot.net/results/bce4082fc07ec53dbe54e8591254ece9b973131f |     
    arm      |   python-cryptography-39.0.0   | NOK | http://autobuild.buildroot.net/results/463ebd0c5c7f4518cec4afdaaef57052e7a63686 |     
    arm      |   python-cryptography-39.0.0   | NOK | http://autobuild.buildroot.net/results/0ca9825b909d59cebcd6c562ab20ec61c556605a |     
  sparc64    |   python-cryptography-39.0.0   | NOK | http://autobuild.buildroot.net/results/db4adf7e9665995cf900c44e3dd6920e10dc97d9 |     
 powerpc64   |      python-numpy-1.23.5       | NOK | http://autobuild.buildroot.net/results/dfe6b1a0096a5701b06274df2ae755ed8232d5da |     
   xtensa    |          qpdf-10.5.0           | NOK | http://autobuild.buildroot.net/results/d2b12640a2c545a31bf025e574f12fa215a90c07 |     
   mips64    |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/f83677ea7206a28fa8558d4e7edd6b19314f90ea |     
microblazeel |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/6e491927e2dad71fbf98414140404f8a569bde3e |     
   xtensa    |         rtl_433-22.11          | NOK | http://autobuild.buildroot.net/results/2be7e78d1832a32a0e731e988d2a10de2a93edd0 |     
   nios2     |           ruby-3.1.3           | NOK | http://autobuild.buildroot.net/results/a3801b2526046eb440815afd014ec1b603828b0c |     
    sh4      |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/ad135b1dc023a21d6d86b5e8ac746e3f7f08a0f0 | ORPH
   sparc     |         sudo-1.9.12p2          | NOK | http://autobuild.buildroot.net/results/5467e94e7043fd0ecaf61d99e48e0b4dc0ce191c | ORPH
   armeb     |         sudo-1.9.12p2          | NOK | http://autobuild.buildroot.net/results/f3c8d1e85dee16b557fada7bdb096574fa6c9181 | ORPH
 microblaze  |        tcf-agent-1.7.0         | NOK | http://autobuild.buildroot.net/results/4d4580e0b42a6fb877b91266ac89bc01d8d76fcc |     
    mips     | toolchain-external-codescap... | NOK | http://autobuild.buildroot.net/results/171f7286faf7cb1bbe72c77e8477cb524e50698c | ORPH
    arc      |      uboot-tools-2021.07       | NOK | http://autobuild.buildroot.net/results/cdbd6586286b3a3c148020eb71b855008c2be5ee |     
  riscv64    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/3bfbe9c4f6b10eb3ce4b79ee7cd3b44f2e3cd25d |     
    mips     |            unknown             | NOK | http://autobuild.buildroot.net/results/99a6b116cc342ca1dd2394f6c958d4886f0fd135 |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/c804cddacd0d0dc73e7211f6da3bd10cd74907ae |     
    mips     |            unknown             | NOK | http://autobuild.buildroot.net/results/773c90606ad4decb55088f6f1f47ca0ac69d41fb |     
    mips     |            unknown             | NOK | http://autobuild.buildroot.net/results/a6398300c17e99dd4bbd40c4d333867a729bec91 |     
   mips64    |            unknown             | NOK | http://autobuild.buildroot.net/results/95ceef539d2f058e2b6b4fdd7538d9e62f75f554 |     
powerpc64le  |            unknown             | NOK | http://autobuild.buildroot.net/results/054a5c9e6e1703ac8ccdfa15cb0d2af050f827ae |     
   mips64    |            unknown             | NOK | http://autobuild.buildroot.net/results/d0b516068c3618377bb264e647841227220eb339 |     
  powerpc    |        valgrind-3.19.0         | NOK | http://autobuild.buildroot.net/results/1ecbd6075bde3a1afb4ef4ef11213153a436e02f | ORPH
  mips64el   |         wolfssl-5.5.3          | NOK | http://autobuild.buildroot.net/results/43ee1a457cbeb986d958c9a70cac0676377661c0 |     
 microblaze  |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/73ae9a2505372a4405f5ce8092a5acbe9004e0d5 | ORPH
 microblaze  |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/86dbc2665f3f92a8372ce50ad93bb8879489de35 | ORPH
microblazeel |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/8ded9c328f42d6af686444ba3de5d4199ac86ae8 | ORPH
 microblaze  |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/96fb86d82ddbeedcdb693b9e761854a4098c3ccf | ORPH
 microblaze  |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/c0de72e5a34b379e0c516ad08984bb2c4b0abb5c | ORPH
microblazeel |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/93de09856d236d72f2c8970881f6bdc734aa38a1 | ORPH
 microblaze  |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/e8ed8cbd3b7c1ca75c48577f62434f2baa6dc548 | ORPH
 microblaze  |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/4dc0c88c1ed250dd5e1be492138bd6e1781128b4 | ORPH
    mips     |          zabbix-5.4.9          | NOK | http://autobuild.buildroot.net/results/1dbbefa655380f5ea562067fda897e792de649a3 |     
microblazeel |          zabbix-5.4.9          | NOK | http://autobuild.buildroot.net/results/1240c47fb2b6ecd84a27938683194821164cc351 |     


Classification of failures by reason for 2022.02.x
--------------------------------------------------

                   grpc-1.43.0 | 1 
          janus-gateway-0.11.6 | 1 


Detail of failures for 2022.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |          grpc-1.43.0           | NOK | http://autobuild.buildroot.net/results/9cf27ab26ef49aea17f91bf98024d60441436ce9 |     
   nios2     |      janus-gateway-0.11.6      | NOK | http://autobuild.buildroot.net/results/bb10b19e645ac889c9695b41bf69d24c36fd8021 |     


Classification of failures by reason for 2022.11.x
--------------------------------------------------

                host-go-1.19.5 | 2 
           janus-gateway-1.0.3 | 2 
           python-numpy-1.23.4 | 2 
                   bzip2-1.0.8 | 1 
                 dmalloc-5.6.5 | 1 
                     efivar-38 | 1 
                 fdk-aac-2.0.2 | 1 
                gerbera-1.10.0 | 1 
  gobject-introspection-1.72.0 | 1 
            host-binutils-2.37 | 1 
            host-binutils-2.39 | 1 
  host-libxml-parser-perl-2.46 | 1 
              host-pahole-1.24 | 1 
              libuhttpd-3.14.1 | 1 
              libxcrypt-4.4.29 | 1 
                     nvme-1.12 | 1 
                 uclibc-1.0.42 | 1 
                       unknown | 1 
                xenomai-3.0.10 | 1 
                      xz-5.2.7 | 1 


Detail of failures for 2022.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mips64    |          bzip2-1.0.8           | NOK | http://autobuild.buildroot.net/results/aea930ea6ec35aa7f8023f50cdbf7e2e3f4388c3 | ORPH
    i586     |         dmalloc-5.6.5          | NOK | http://autobuild.buildroot.net/results/f88af75188a69ddd956877e92e866e6a0a7169cf | ORPH
  mips64el   |           efivar-38            | NOK | http://autobuild.buildroot.net/results/170af89c5452290d927778538edea61bbdf0cbea |     
    arm      |         fdk-aac-2.0.2          | NOK | http://autobuild.buildroot.net/results/43c3d7029f17b501077f347d0f9ffbe0b53d5c98 |     
   mips64    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/830e55d1f147a7226959afe656932fe6354c020a |     
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/7d36c2e4f17d64c961b65825b5594cae7fc331d8 | ORPH
  powerpc    |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/d1ab68d939acda7d2d5163586f78b3f5e105bc45 |     
microblazeel |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/70fd251d76e2f4d473f5ad3a0fda0e652b79d8fc |     
  mips64el   |         host-go-1.19.5         | NOK | http://autobuild.buildroot.net/results/f5bb3d5e9af58d5bd326cb8d11ba6f50823163ba |     
  aarch64    |         host-go-1.19.5         | NOK | http://autobuild.buildroot.net/results/1714553b7b9e12a1ef65f230be1cdbfc57721ad1 |     
 powerpc64   |  host-libxml-parser-perl-2.46  | NOK | http://autobuild.buildroot.net/results/4a3b1f009e5e5a89f4a7a97576745a7b079d4092 |     
 powerpc64   |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/7c66c76666552cc4da121eedb0dbf273c6413062 |     
powerpc64le  |      janus-gateway-1.0.3       | NOK | http://autobuild.buildroot.net/results/e5d42082390bd044d4d2abb1260d559a1b4d214a |     
    mips     |      janus-gateway-1.0.3       | NOK | http://autobuild.buildroot.net/results/6e1e24b83c42726f85033c2e67522a954ade3312 |     
   mips64    |        libuhttpd-3.14.1        | NOK | http://autobuild.buildroot.net/results/7ff2ca83c35540f693de777f2198e821053b8c3a |     
 aarch64_be  |        libxcrypt-4.4.29        | NOK | http://autobuild.buildroot.net/results/16cba783be11cc5024f9c56bb0a7abb0acf13ef8 |     
    mips     |           nvme-1.12            | NOK | http://autobuild.buildroot.net/results/faef1e36adbfb5a6098e1565c7512030c14d8fc5 | ORPH
    mips     |      python-numpy-1.23.4       | NOK | http://autobuild.buildroot.net/results/e021295697946b8b3c9bb886df0c245d39686148 |     
   x86_64    |      python-numpy-1.23.4       | NOK | http://autobuild.buildroot.net/results/c636f6876bf24b64b41864e3a130d1a3d222ca49 |     
  powerpc    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/ed2c0a136242d6e195397c1392e9969db4f59d9c |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/2b8723054580995da0b514a0a9d2ba7423514b30 |     
    i686     |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/9ccbb93fa06ed78983b33e5965f8e9d301aaed4a |     
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/66c88d611e91d7df549c400259d2cac864eda3c1 | ORPH


Gitlab CI results for 2023-02-07
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
 TestAarch64Pages64kGlibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449186  | ORPH 
  TestAarch64Pages64kMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449187  | ORPH 
TestAarch64Pages64kuClibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449189  | ORPH 
         TestCheckPackage | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449530  |      
      TestClangCompilerRT | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718448892  | ORPH 
           TestCrudiniPy3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718448894  | ORPH 
        TestDockerCompose | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718448896  | ORPH 
             TestDropbear | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718448898  | ORPH 
              TestDtbocfg | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718448899  | ORPH 
             TestExecline | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718448900  | ORPH 
                 TestExt2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718448844  | ORPH 
...rch64GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449203  | ORPH 
...tlinAarch64GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449205  | ORPH 
...arch64MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449206  | ORPH 
...otlinAarch64MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449208  | ORPH 
...ch64UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449209  | ORPH 
...linAarch64UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449212  | ORPH 
...h64beGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449214  | ORPH 
...inAarch64beGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449215  | ORPH 
...64beUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449216  | ORPH 
...nAarch64beUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449219  | ORPH 
...750dUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449220  | ORPH 
...nArcle750dUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449221  | ORPH 
...ehs38GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449222  | ORPH 
...inArclehs38GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449224  | ORPH 
...hs38UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449225  | ORPH 
...nArclehs38UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449227  | ORPH 
...abihfGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449228  | ORPH 
...mebv7eabihfGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449229  | ORPH 
...eabihfMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449232  | ORPH 
...rmebv7eabihfMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449234  | ORPH 
...bihfUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449235  | ORPH 
...ebv7eabihfUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449238  | ORPH 
...5eabiGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449241  | ORPH 
...inArmv5eabiGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449242  | ORPH 
...v5eabiMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449247  | ORPH 
...linArmv5eabiMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449250  | ORPH 
...eabiUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449252  | ORPH 
...nArmv5eabiUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449254  | ORPH 
...abihfGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449256  | ORPH 
...Armv6eabihfGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449259  | ORPH 
...eabihfMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449260  | ORPH 
...nArmv6eabihfMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449261  | ORPH 
...bihfUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449262  | ORPH 
...rmv6eabihfUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449264  | ORPH 
...abihfGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449265  | ORPH 
...Armv7eabihfGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449267  | ORPH 
...eabihfMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449268  | ORPH 
...nArmv7eabihfMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449269  | ORPH 
...bihfUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449270  | ORPH 
...rmv7eabihfUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449271  | ORPH 
...mv7mUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449272  | ORPH 
...tlinArmv7mUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449273  | ORPH 
...8xxxUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449274  | ORPH 
...nM68k68xxxUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449278  | ORPH 
...fireUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449279  | ORPH 
...8kcoldfireUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449283  | ORPH 
...azebeGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449284  | ORPH 
...icroblazebeGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449285  | ORPH 
...lazebeMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449286  | ORPH 
...MicroblazebeMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449287  | ORPH 
...zebeUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449290  | ORPH 
...croblazebeUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449291  | ORPH 
...azeelGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449292  | ORPH 
...icroblazeelGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449294  | ORPH 
...lazeelMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449296  | ORPH 
...MicroblazeelMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449299  | ORPH 
...zeelUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449301  | ORPH 
...croblazeelUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449303  | ORPH 
...ips32GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449304  | ORPH 
...otlinMips32GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449305  | ORPH 
...Mips32MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449306  | ORPH 
...ootlinMips32MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449307  | ORPH 
...ps32UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449309  | ORPH 
...tlinMips32UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449312  | ORPH 
...s32elGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449313  | ORPH 
...linMips32elGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449314  | ORPH 
...ps32elMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449316  | ORPH 
...tlinMips32elMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449317  | ORPH 
...32elUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449318  | ORPH 
...inMips32elUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449320  | ORPH 
...2r5elGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449321  | ORPH 
...nMips32r5elGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449323  | ORPH 
...32r5elMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449326  | ORPH 
...inMips32r5elMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449327  | ORPH 
...r5elUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449329  | ORPH 
...Mips32r5elUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449331  | ORPH 
...2r6elGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449332  | ORPH 
...nMips32r6elGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449333  | ORPH 
...32r6elMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449335  | ORPH 
...inMips32r6elMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449337  | ORPH 
...r6elUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449338  | ORPH 
...Mips32r6elUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449339  | ORPH 
...eln32GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449341  | ORPH 
...Mips64eln32GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449342  | ORPH 
...4eln32MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449344  | ORPH 
...nMips64eln32MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449346  | ORPH 
...ln32UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449348  | ORPH 
...ips64eln32UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449350  | ORPH 
...64n32GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449351  | ORPH 
...inMips64n32GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449354  | ORPH 
...s64n32MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449356  | ORPH 
...linMips64n32MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449358  | ORPH 
...4n32UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449361  | ORPH 
...nMips64n32UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449363  | ORPH 
...eln32GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449364  | ORPH 
...ps64r6eln32GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449367  | ORPH 
...6eln32MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449370  | ORPH 
...ips64r6eln32MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449371  | ORPH 
...ln32UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449374  | ORPH 
...s64r6eln32UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449375  | ORPH 
...Nios2GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449376  | ORPH 
...ootlinNios2GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449379  | ORPH 
...enriscMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449380  | ORPH 
...tlinOpenriscMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449381  | ORPH 
...riscUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449382  | ORPH 
...inOpenriscUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449384  | ORPH 
...440fpGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449385  | ORPH 
...owerpc440fpGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449386  | ORPH 
...c440fpMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449388  | ORPH 
...Powerpc440fpMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449389  | ORPH 
...40fpUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449390  | ORPH 
...werpc440fpUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449391  | ORPH 
...e5500GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449392  | ORPH 
...erpc64e5500GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449394  | ORPH 
...e6500GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449396  | ORPH 
...erpc64e6500GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449398  | ORPH 
...4e6500MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449399  | ORPH 
...werpc64e6500MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449401  | ORPH 
...ower8GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449402  | ORPH 
...c64lepower8GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449404  | ORPH 
...power8MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449405  | ORPH 
...pc64lepower8MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449406  | ORPH 
...ower8GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449407  | ORPH 
...rpc64power8GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449408  | ORPH 
...power8MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449409  | ORPH 
...erpc64power8MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449410  | ORPH 
...300c3GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449411  | ORPH 
...werpce300c3GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449413  | ORPH 
...e300c3MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449414  | ORPH 
...owerpce300c3MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449416  | ORPH 
...00c3UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449419  | ORPH 
...erpce300c3UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449421  | ORPH 
...500mcGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449423  | ORPH 
...werpce500mcGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449425  | ORPH 
...e500mcMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449428  | ORPH 
...owerpce500mcMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449429  | ORPH 
...00mcUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449431  | ORPH 
...erpce500mcUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449434  | ORPH 
...lp32dGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449437  | ORPH 
...lp64dGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449441  | ORPH 
...iscv64lp64dGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449443  | ORPH 
...4lp64dMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449446  | ORPH 
...Riscv64lp64dMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449448  | ORPH 
...p64dUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449449  | ORPH 
...scv64lp64dUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449450  | ORPH 
...0xz13GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449452  | ORPH 
...linS390xz13GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449454  | ORPH 
...Shsh4GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449456  | ORPH 
...ootlinShsh4GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449458  | ORPH 
...nShsh4MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449460  | ORPH 
...BootlinShsh4MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449463  | ORPH 
...hsh4UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449465  | ORPH 
...otlinShsh4UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449469  | ORPH 
...h4aebGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449474  | ORPH 
...linShsh4aebGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449475  | ORPH 
...sh4aebMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449476  | ORPH 
...tlinShsh4aebMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449477  | ORPH 
...arc64GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449478  | ORPH 
...tlinSparc64GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449479  | ORPH 
...rcv8UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449481  | ORPH 
...linSparcv8UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449482  | ORPH 
...X8664GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449483  | ORPH 
...ootlinX8664GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449485  | ORPH 
...nX8664MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449486  | ORPH 
...BootlinX8664MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449487  | ORPH 
...8664UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449489  | ORPH 
...otlinX8664UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449490  | ORPH 
...orei7GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449492  | ORPH 
...X8664corei7GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449493  | ORPH 
...corei7MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449494  | ORPH 
...nX8664corei7MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449495  | ORPH 
...rei7UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449497  | ORPH 
...8664corei7UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449498  | ORPH 
...664v2GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449499  | ORPH 
...8664v2MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449500  | ORPH 
...64v2UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449501  | ORPH 
...664v3GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449502  | ORPH 
...8664v3MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449504  | ORPH 
...64v3UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449505  | ORPH 
...664v4GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449506  | ORPH 
...8664v4MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449507  | ORPH 
...64v4UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449509  | ORPH 
...core2GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449511  | ORPH 
...linX86core2GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449513  | ORPH 
...6core2MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449515  | ORPH 
...tlinX86core2MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449518  | ORPH 
...ore2UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449519  | ORPH 
...inX86core2UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449520  | ORPH 
...6i686GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449521  | ORPH 
...tlinX86i686GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449522  | ORPH 
...86i686MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449524  | ORPH 
...otlinX86i686MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449525  | ORPH 
...i686UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449526  | ORPH 
...linX86i686UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449527  | ORPH 
...lx60UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449528  | ORPH 
...Xtensalx60UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449529  | ORPH 
...ToolchainBuildrootMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449191  | ORPH 
...olchainBuildrootuClibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449192  | ORPH 
...xternalToolchainCCache | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449193  | ORPH 
...ernalToolchainCtngMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449195  | ORPH 
...rnalToolchainLinaroArm | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449197  | ORPH 
...ToolchainSourceryArmv4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449198  | ORPH 
...ToolchainSourceryArmv5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449201  | ORPH 
...ToolchainSourceryArmv7 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449202  | ORPH 
               TestGdbArc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718448901  | ORPH 
        TestGdbFullTarget | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718448903  | ORPH 
...GdbHostOnlyAllFeatures | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718448904  | ORPH 
   TestGdbHostOnlyDefault | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718448905  | ORPH 
        TestGdbserverOnly | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718448906  | ORPH 
        TestGetDevelopers | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449531  | ORPH 
     TestGlibcAllTimezone | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718448819  | ORPH 
              TestGlxinfo | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718448907  | ORPH 
           TestGst1Python | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718448908  | ORPH 
                TestHWLoc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718448909  | ORPH 
           TestIPythonPy3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718448910  | ORPH 
...ystemSystemdRoIfupdown | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718448873  | ORPH 
            TestLibshdata | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718448913  | ORPH 
                  TestLua | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718448919  | ORPH 
              TestLuaHttp | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718448935  | ORPH 
           TestLuaInotify | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718448937  | ORPH 
              TestLuaLPeg | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718448915  | ORPH 
          TestLuaLsqlite3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718448917  | ORPH 
         TestLuaLuaArgon2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718448921  | ORPH 
         TestLuaLuaAugeas | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718448923  | ORPH 
           TestLuaLuaCffi | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718448926  | ORPH 
        TestLuaLuaCqueues | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718448927  | ORPH 
          TestLuaLuaExpat | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718448953  | ORPH 
     TestLuaLuaFileSystem | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718448957  | ORPH 
             TestLuaLuaGD | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718448933  | ORPH 
           TestLuaLuaLdap | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718448960  | ORPH 
          TestLuaLuaLyaml | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718448943  | ORPH 
          TestLuaLuaPosix | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718448964  | ORPH 
           TestLuaLuaSDL2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718448946  | ORPH 
            TestLuaLuaSec | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718448968  | ORPH 
         TestLuaLuaSocket | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718448970  | ORPH 
           TestLuaLuacURL | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718448929  | ORPH 
           TestLuaLuaossl | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718448962  | ORPH 
         TestLuaLuasyslog | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718448972  | ORPH 
           TestLuaLuazlib | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718448951  | ORPH 
             TestLuaLunix | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718448939  | ORPH 
             TestLuaLzlib | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718448978  | ORPH 
             TestLuaRings | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449159  | ORPH 
              TestLuaUtf8 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718448949  | ORPH 
               TestLuajit | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718448920  | ORPH 
           TestLuajitHttp | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718448936  | ORPH 
        TestLuajitInotify | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718448938  | ORPH 
           TestLuajitLPeg | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718448916  | ORPH 
       TestLuajitLsqlite3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718448918  | ORPH 
      TestLuajitLuaArgon2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718448922  | ORPH 
      TestLuajitLuaAugeas | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718448924  | ORPH 
     TestLuajitLuaCqueues | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718448928  | ORPH 
       TestLuajitLuaExpat | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718448954  | ORPH 
  TestLuajitLuaFileSystem | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718448959  | ORPH 
          TestLuajitLuaGD | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718448934  | ORPH 
        TestLuajitLuaLdap | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718448961  | ORPH 
       TestLuajitLuaLyaml | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718448944  | ORPH 
       TestLuajitLuaPosix | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718448967  | ORPH 
        TestLuajitLuaSDL2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718448947  | ORPH 
         TestLuajitLuaSec | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718448969  | ORPH 
      TestLuajitLuaSocket | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718448971  | ORPH 
        TestLuajitLuacURL | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718448931  | ORPH 
        TestLuajitLuaossl | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718448963  | ORPH 
      TestLuajitLuasyslog | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718448974  | ORPH 
        TestLuajitLuazlib | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718448952  | ORPH 
          TestLuajitLunix | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718448940  | ORPH 
          TestLuajitRings | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449161  | ORPH 
       TestLuajitTurbolua | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449176  | ORPH 
           TestLuajitUtf8 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718448950  | ORPH 
                 TestLuvi | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718448975  | ORPH 
                  TestLxc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718448976  | ORPH 
               TestMender | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718448979  | ORPH 
             TestMsrTools | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718448980  | ORPH 
                 TestNcdu | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718448981  | ORPH 
              TestNetdata | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718448983  | ORPH 
               TestOctave | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718448984  | ORPH 
                  TestOla | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718448985  | ORPH 
              TestOpenJdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718448988  | ORPH 
         TestOpenSshGlibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718448990  | ORPH 
        TestOpenSshuClibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718448992  | ORPH 
                 TestOpkg | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718448994  | ORPH 
             TestPerftest | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718448997  | ORPH 
                 TestPerl | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449000  | ORPH 
        TestPerlClassLoad | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449002  | ORPH 
         TestPerlDBDmysql | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449004  | ORPH 
     TestPerlEncodeDetect | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449007  | ORPH 
          TestPerlGDGraph | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449009  | ORPH 
       TestPerlHTMLParser | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449011  | ORPH 
TestPerlIOSocketMulticast | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449014  | ORPH 
      TestPerlIOSocketSSL | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449015  | ORPH 
 TestPerlLWPProtocolhttps | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449018  | ORPH 
         TestPerlMailDKIM | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449019  | ORPH 
              TestPerlX10 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449021  | ORPH 
        TestPerlXMLLibXML | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449023  | ORPH 
       TestPerllibwwwperl | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449016  | ORPH 
              TestPhpApcu | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449024  | ORPH 
            TestPhpLuaLua | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449025  | ORPH 
         TestPhpLuaLuajit | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449026  | ORPH 
               TestPhpPam | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449029  | ORPH 
          TestPhpPeclDbus | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449030  | ORPH 
                 TestPixz | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449031  | ORPH 
          TestPolkitInitd | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449033  | ORPH 
        TestPolkitSystemd | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449034  | ORPH 
         TestProsodyLua51 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449036  | ORPH 
        TestProsodyLuajit | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449037  | ORPH 
              TestPyNdiff | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449127  | ORPH 
            TestPython3Py | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449038  | ORPH 
         TestPython3PyPyc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449039  | ORPH 
           TestPython3Pyc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449040  | ORPH 
         TestPythonAugeas | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449047  | ORPH 
           TestPythonAvro | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449052  | ORPH 
       TestPythonPahoMQTT | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449112  | ORPH 
     TestPythonPy3Aexpect | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449042  | ORPH 
        TestPythonPy3Argh | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449045  | ORPH 
       TestPythonPy3Attrs | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449046  | ORPH 
    TestPythonPy3Autobahn | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449048  | ORPH 
     TestPythonPy3Automat | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449050  | ORPH 
   TestPythonPy3Bitstring | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449055  | ORPH 
       TestPythonPy3Boto3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449059  | ORPH 
    TestPythonPy3Botocore | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449060  | ORPH 
         TestPythonPy3Can | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449061  | ORPH 
        TestPythonPy3Cbor | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449062  | ORPH 
       TestPythonPy3Click | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449065  | ORPH 
   TestPythonPy3Colorzero | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449067  | ORPH 
  TestPythonPy3Constantly | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449069  | ORPH 
   TestPythonPy3Construct | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449070  | ORPH 
    TestPythonPy3Crossbar | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449072  | ORPH 
TestPythonPy3Cryptography | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449074  | ORPH 
    TestPythonPy3DBusFast | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449075  | ORPH 
    TestPythonPy3DBusNext | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449077  | ORPH 
  TestPythonPy3Dicttoxml2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449078  | ORPH 
      TestPythonPy3Distro | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449081  | ORPH 
      TestPythonPy3Django | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449083  | ORPH 
    TestPythonPy3Dtschema | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449086  | ORPH 
       TestPythonPy3Flask | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449089  | ORPH 
...honPy3FlaskExpectsJson | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449092  | ORPH 
         TestPythonPy3Git | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449094  | ORPH 
      TestPythonPy3Gitdb2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449096  | ORPH 
       TestPythonPy3GnuPG | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449099  | ORPH 
     TestPythonPy3Gobject | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449102  | ORPH 
    TestPythonPy3Gpiozero | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449105  | ORPH 
 TestPythonPy3Incremental | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449107  | ORPH 
    TestPythonPy3Iptables | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449108  | ORPH 
    TestPythonPy3Jmespath | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449110  | ORPH 
    TestPythonPy3Libftdi1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718448912  | ORPH 
       TestPythonPy3Munch | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449111  | ORPH 
     TestPythonPy3Passlib | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449114  | ORPH 
     TestPythonPy3Pexpect | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449116  | ORPH 
      TestPythonPy3PyAlsa | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449118  | ORPH 
      TestPythonPy3Pynacl | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449123  | ORPH 
      TestPythonPy3Pytest | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449128  | ORPH 
...PythonPy3PytestAsyncio | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449131  | ORPH 
      TestPythonPy3Pyyaml | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449132  | ORPH 
      TestPythonPy3Qrcode | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449136  | ORPH 
         TestPythonPy3RSA | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449140  | ORPH 
     TestPythonPy3RpiGpio | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449139  | ORPH 
  TestPythonPy3S3transfer | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449144  | ORPH 
       TestPythonPy3SciPy | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449146  | ORPH 
...thonPy3ServiceIdentity | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449147  | ORPH 
      TestPythonPy3Smmap2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449148  | ORPH 
        TestPythonPy3Treq | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449150  | ORPH 
     TestPythonPy3Twisted | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449151  | ORPH 
       TestPythonPy3Txaio | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449152  | ORPH 
    TestPythonPy3Txtorcon | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449153  | ORPH 
      TestPythonPy3Ubjson | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449154  | ORPH 
...y3UnitTestXmlReporting | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449155  | ORPH 
       TestPythonPy3rtoml | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449143  | ORPH 
         TestPythonPybind | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449120  | ORPH 
             TestRdmaCore | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449156  | ORPH 
                TestRedis | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449158  | ORPH 
                 TestRust | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449162  | ORPH 
              TestRustBin | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449163  | ORPH 
                   TestS6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449166  | ORPH 
         TestS6Networking | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449167  | ORPH 
      TestS6PortableUtils | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449168  | ORPH 
                 TestS6Rc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449171  | ORPH 
...ELinuxExtraModulesDirs | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718448816  | ORPH 
                 TestSudo | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449172  | ORPH 
             TestSyslogNg | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449173  | ORPH 
                 TestTmux | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449175  | ORPH 
TestUbootOpensslPkgConfig | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449177  | ORPH 
                   TestZ3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449178  | ORPH 
             TestZerofree | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449180  | ORPH 
             TestZfsGlibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449182  | ORPH 
              TestZfsMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449183  | ORPH 
            TestZfsUclibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3718449185  | ORPH 



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
