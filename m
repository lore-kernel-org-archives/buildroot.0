Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58C81C77B62
	for <buildroot@archiver.kernel.org>; Fri, 31 Mar 2023 05:43:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D6F1460FCE;
	Fri, 31 Mar 2023 05:43:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D6F1460FCE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id X-IcymJLAS5s; Fri, 31 Mar 2023 05:43:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4297560A7E;
	Fri, 31 Mar 2023 05:43:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4297560A7E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 19CC11BF377
 for <buildroot@lists.busybox.net>; Fri, 31 Mar 2023 05:43:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E6CB960A88
 for <buildroot@lists.busybox.net>; Fri, 31 Mar 2023 05:43:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E6CB960A88
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bP_d9S2w47pJ for <buildroot@lists.busybox.net>;
 Fri, 31 Mar 2023 05:43:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9968B60A7E
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9968B60A7E
 for <buildroot@buildroot.org>; Fri, 31 Mar 2023 05:43:41 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id DB5D2FF80E
 for <buildroot@buildroot.org>; Fri, 31 Mar 2023 05:43:38 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Fri, 31 Mar 2023 05:43:38 -0000
Message-Id: <20230331054343.E6CB960A88@smtp3.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1680241419; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=6hyYHjNCVcCAIMLxzfkle5EKYZoXWykhGsZSm/m55eo=;
 b=XybCqO46ff1DAORmnYzdh2hHzjJPvH+i4MXSz5CKuqiPHSgaOTXJ+DlX3kNmOflyBIVQ7n
 mpwkR0T0RWel+wrt9eoUkCqzd/rLu48awNBhWC5nvtqaWplsK7mrYTCV9eOKHA9FioFiHf
 yMNdWwRxKEOmBp0smofc4J1a6lvUnxDV+2WN2aSe/ruMpUcfNcj2lDnxxTFTR+lcpYw6E6
 KMNtpn8BMDSdlggLssgAfA4LxPkJGsjlu612nv8KnSOr1mOhsECJgiuDDv5ZMsIO9pkf/l
 YsdvI+JjcSTwQHGjbd8y1SE7xTP0k3PmmGnruiSutptL7q+6XmbdMkxQ1JPo9g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=XybCqO46
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-03-30
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

Autobuild statistics for 2023-03-30
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  | 18  | 16  |  0  | 34  |
    master   | 186 | 140 |  1  | 327 |

Classification of failures by reason for master
-----------------------------------------------

            host-binutils-2.38 | 10
              host-rust-1.68.0 | 7 
                 agentpp-4.6.0 | 6 
                elfutils-0.186 | 6 
  gobject-introspection-1.72.0 | 6 
                       unknown | 6 
                host-go-1.19.7 | 5 
               libglib2-2.72.3 | 4 
                  linux-6.1.14 | 4 
             bluez5_utils-5.66 | 3 
               host-qemu-7.2.0 | 3 
              libgcrypt-1.10.1 | 3 
                   perl-5.36.0 | 3 
                 uclibc-1.0.42 | 3 
                    flac-1.4.2 | 2 
fs/ubifs/ubifs.mk:49: /home... | 2 
                 haproxy-2.6.9 | 2 
            host-binutils-2.37 | 2 
                   linux-tools | 2 
            quickjs-2021-03-27 | 2 
ulog-0389d243352255f6182326... | 2 
               valgrind-3.19.0 | 2 
                xenomai-3.0.10 | 2 
                alsa-lib-1.2.8 | 1 
android-tools-4.2.2+git2013... | 1 
               apcupsd-3.14.14 | 1 
                  boost-1.80.0 | 1 
                    brltty-6.5 | 1 
                busybox-1.36.0 | 1 
             cni-plugins-1.2.0 | 1 
                 coreutils-9.2 | 1 
                 dc3dd-7.2.641 | 1 
                    dust-0.8.1 | 1 
               fftw-quad-3.3.8 | 1 
fs/axfs/axfs.mk:32: /tmp/in... | 1 
fs/cramfs/cramfs.mk:46: /ho... | 1 
fs/cramfs/cramfs.mk:46: /ho... | 1 
fs/cramfs/cramfs.mk:46: /ho... | 1 
fs/cramfs/cramfs.mk:46: /ho... | 1 
fs/ubi/ubi.mk:51: /home/aut... | 1 
fs/ubi/ubi.mk:51: /home/tho... | 1 
fs/ubi/ubi.mk:51: /tmp/inst... | 1 
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
                    gdal-3.5.2 | 1 
glibc-2.36-81-g4f4d7a13edfd... | 1 
glmark2-06e78b67702b5413335... | 1 
       host-gcc-initial-12.2.0 | 1 
host-gdb-arc-2020.09-releas... | 1 
     host-moby-buildkit-0.11.2 | 1 
       host-python-sip-4.19.25 | 1 
                    lcms2-2.14 | 1 
      libabseil-cpp-20220623.1 | 1 
               libcap-ng-0.8.3 | 1 
                  libjxl-0.8.1 | 1 
                libkrb5-1.20.1 | 1 
          linux-5.10.162-cip24 | 1 
                nodejs-16.18.1 | 1 
                  ntp-4.2.8p15 | 1 
                 openssh-9.3p1 | 1 
package/rtl8821cu/rtl8821cu... | 1 
                     php-8.2.3 | 1 
                    putty-0.76 | 1 
           python-bcrypt-4.0.1 | 1 
sconeserver-8d1935919a20133... | 1 
                    sdl-1.2.15 | 1 
                   shadow-4.13 | 1 
               tcf-agent-1.7.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   nios2     |         agentpp-4.6.0          | NOK | http://autobuild.buildroot.net/results/52e59ccdd24e6c80e7ebc212062d15dbe6b7ec6b |     
  sparc64    |         agentpp-4.6.0          | NOK | http://autobuild.buildroot.net/results/eb12abee77e5b495b9f496cd80366f588d0c9bd4 |     
  aarch64    |         agentpp-4.6.0          | NOK | http://autobuild.buildroot.net/results/074e68a12b22d140f085d45b003aae5bbc57fe78 |     
  sparc64    |         agentpp-4.6.0          | NOK | http://autobuild.buildroot.net/results/c69aa6543f6a86f6d07a2deb744b540b0da0c7e7 |     
    i686     |         agentpp-4.6.0          | NOK | http://autobuild.buildroot.net/results/7cfb22c59369001186df34c90bf2d073a23e886c |     
   armeb     |         agentpp-4.6.0          | NOK | http://autobuild.buildroot.net/results/08f4726b51e88d298a080f97ff6b3c7201a2eb0a |     
    or1k     |         alsa-lib-1.2.8         | NOK | http://autobuild.buildroot.net/results/3bf76a531aaf5ae90c165ec79df25a7deba96dde |     
 powerpc64   | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/fe0e73ce4b9ac69020595b8881c735cddb5c5889 |     
   arceb     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/7e6e78180e5f602074bcaa7d3d40347f568ef594 |     
   sh4aeb    |       bluez5_utils-5.66        | NOK | http://autobuild.buildroot.net/results/db7b26696a034c82c7d71548182946c9924762fe |     
   armeb     |       bluez5_utils-5.66        | NOK | http://autobuild.buildroot.net/results/9c06ab260718afe31274555f2959e1ba8e546d83 |     
    or1k     |       bluez5_utils-5.66        | NOK | http://autobuild.buildroot.net/results/283e3cc7854ede764ac91777e6475f9834856d8e |     
   arceb     |          boost-1.80.0          | NOK | http://autobuild.buildroot.net/results/a216e8050698f5a71989e3571f89d42832cd751e |     
   s390x     |           brltty-6.5           | NOK | http://autobuild.buildroot.net/results/9e410ec7dc4023712f677830776d70f93f1d67d7 |     
   mipsel    |         busybox-1.36.0         | NOK | http://autobuild.buildroot.net/results/4d7e59a421e6e837807cc58c9b2dd2f589343812 | ORPH
   s390x     |       cni-plugins-1.2.0        | NOK | http://autobuild.buildroot.net/results/48e1f804da7d3490c3ccf26309b95dd93be61c0e |     
   sh4aeb    |         coreutils-9.2          | NOK | http://autobuild.buildroot.net/results/b763ee73e68844af08dcb0a19a70d73a72a41d5f | ORPH
    or1k     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/be0bb40ae533d81d334cd9f8da3e314ddcb98bd0 | ORPH
   mipsel    |           dust-0.8.1           | NOK | http://autobuild.buildroot.net/results/db5c0290a68ec515089215d24a718036b3089298 | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/85ddcd395a1b465cbdc6fb6ac9ece236160643f7 | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/6393f613eb71a86042aca4f557d74a5a75af66df | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/bc717250b832b0bcefa848c522a7894783c294c6 | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/94b6893b66c82d3142a84c35d3179b5697f64c49 | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/01c0406fb4eeb2aaf6bf852cdd5116da5f676338 | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/1457658fd44c01100283e79b5c7697a9a7daba56 | ORPH
powerpc64le  |        fftw-quad-3.3.8         | NOK | http://autobuild.buildroot.net/results/8d383522e9f7c7d7a99b7582a67e70650f223a57 | ORPH
   sh4aeb    |           flac-1.4.2           | NOK | http://autobuild.buildroot.net/results/4325589c903a78ff199ca91d24d11721bb7c4a25 |     
    sh4a     |           flac-1.4.2           | NOK | http://autobuild.buildroot.net/results/be7e1eb1d1b22153f9dcc58803ada313931fa388 |     
  sparc64    | fs/axfs/axfs.mk:32: /tmp/in... | NOK | http://autobuild.buildroot.net/results/b988fe2361a1666675c4c2d4624bd57962a122cc |     
    arm      | fs/cramfs/cramfs.mk:46: /ho... | NOK | http://autobuild.buildroot.net/results/8686a63a9910f0e84802d7e77bd37225799f699a |     
    m68k     | fs/cramfs/cramfs.mk:46: /ho... | NOK | http://autobuild.buildroot.net/results/0be826009ecf3fd825860b962e1c52ef7054e52f |     
   s390x     | fs/cramfs/cramfs.mk:46: /ho... | NOK | http://autobuild.buildroot.net/results/0b2b6b6d7253890c321a715c3ce04c1d6f5df84c |     
 microblaze  | fs/cramfs/cramfs.mk:46: /ho... | NOK | http://autobuild.buildroot.net/results/1db9872515b671ee57b41bc9850b6113301f3ebc |     
microblazeel | fs/ubi/ubi.mk:51: /home/aut... | NOK | http://autobuild.buildroot.net/results/f6afac0b07e27957c49d72d1905aeb8bf7ace0b9 |     
   sparc     | fs/ubi/ubi.mk:51: /home/tho... | NOK | http://autobuild.buildroot.net/results/9cfee62f2c14243be8687520dd0de226ee0121d9 |     
    arc      | fs/ubi/ubi.mk:51: /tmp/inst... | NOK | http://autobuild.buildroot.net/results/54310b03f8366982ad5d5b8bdbc7f944ca5657a9 |     
   arceb     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/bd4f80f0ced2e22b46980c1dadbfd3cb954081c2 |     
  sparc64    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/d897f88e39e84fe63ff7d9f2689cd136efcbfe26 |     
 microblaze  | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/6d8657b0ece65af206110519bb41a87913cf4013 |     
  mips64el   | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/741d5b6fd35be04c09a4046811ef97bb42f33e94 |     
powerpc64le  | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/ec2a6e3dccc5d88ab7717569a975a89712459032 |     
   arceb     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/ac914929bc278597271bfe19b80190d7d1f9fcbd |     
powerpc64le  | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/c2f14a1f37be6185bb9bf6749075e8494491ff99 |     
    mips     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/059dfbb1e6ac8d815c3f8ae5630daa4ed5c3d5aa |     
    mips     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/5d6491f69705c1c6c7195a46bc59b2db71a711ff |     
   s390x     | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/9b742a410c1dfdb2fa9739240a59b42b4ff093a0 |     
 aarch64_be  | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/01d3cd492d564e5ee0bb7aa841ce667bbb93f417 |     
 microblaze  | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/b05540211901c49cdddddd7b24b0c2a244ff974a |     
 aarch64_be  | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/b89299332be3d682c8dd82207a6222a2ea86ebff |     
    m68k     |           gdal-3.5.2           | NOK | http://autobuild.buildroot.net/results/e56f79ae0fb8f8ae3508b19e225e913f1d8b6755 |     
  powerpc    | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/5adc85981a53d2a209848572dca32e5a39aa4385 |     
    arm      | glmark2-06e78b67702b5413335... | NOK | http://autobuild.buildroot.net/results/120387a3a6f9bfd30f706f2606c949ce533ec204 |     
   s390x     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/285af2441681af25af5128be6e80f57594a083ce | ORPH
    or1k     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/990f31d30b5ee34d9bea93b874d7c72664fd920e | ORPH
   nios2     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/f8306a2b72e96caf433d8a7a778774b5ab9e4371 | ORPH
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/aa8718371362efe564d50867489612eff1647d30 | ORPH
    i686     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/13e15c9f038e4644f15558a2e75d36abff0fba54 | ORPH
   nios2     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/8d5c0ab42821e99ef86af8d3e73c15611dd44fdd | ORPH
    sh4a     |         haproxy-2.6.9          | NOK | http://autobuild.buildroot.net/results/4f15358d3ddb881c8fa5a071c497421902022ada |     
 aarch64_be  |         haproxy-2.6.9          | NOK | http://autobuild.buildroot.net/results/d274b5c89f107b49cf327aa961e823c9cb2f29f8 |     
  mips64el   |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/d971e130a8af1ed157cef53119832911a4dc0297 |     
   sh4eb     |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/6d6b3f9af86d4c28bc7d25582df870ef4fffc287 |     
   sparc     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/872a3325ee62b0b66fe569a812423677f5a6685b |     
   mipsel    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/5189d4ef3e48c23aabc6ee62d4a64d47e9ca7ae6 |     
   s390x     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/42ea98d957d09a5695db6a6f037ae20027a997cf |     
  riscv64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/3bd00dd601a3e4c8af302d8d4de6c08e41313b1a |     
    sh4a     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/a29204a6be1fbf9eae8459012193d61eedb54da4 |     
   s390x     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/e8aef350d91401d1a6c9d354d9471dfee668147d |     
   xtensa    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/1558dabccd1dc00d1d9de251fe3c155f7307c471 |     
   mips64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/ef30d0d3af1d22a10a9f22861f66431ec06331b4 |     
   sparc     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/e9a088e389c90f7c762e4b917f5e885d0a914c5a |     
  riscv64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/bb9466d6e75dc4ad94f8e0616d58470efb3e9c0c |     
    or1k     |    host-gcc-initial-12.2.0     | NOK | http://autobuild.buildroot.net/results/c838c83c0818353d5a56fbd37cdcd27e45ef0478 |     
    arc      | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/dee911366e58a41931f0478691a862b28afa2f64 | ORPH
   mips64    |         host-go-1.19.7         | NOK | http://autobuild.buildroot.net/results/e78468b43bda9501ccf720349fab1798db4d0bae |     
   mips64    |         host-go-1.19.7         | NOK | http://autobuild.buildroot.net/results/50087ee55027d3be13ef4457d594e4ceff82aefd |     
   mips64    |         host-go-1.19.7         | NOK | http://autobuild.buildroot.net/results/8eb4353d493d10be087bf87a0e3b69cadcafd35c |     
  aarch64    |         host-go-1.19.7         | NOK | http://autobuild.buildroot.net/results/f4f42f129d72b9bc6c2afd4edbff7783e4678c37 |     
  aarch64    |         host-go-1.19.7         | NOK | http://autobuild.buildroot.net/results/70826383603d487ba7892037113117a960f25145 |     
  riscv64    |   host-moby-buildkit-0.11.2    | NOK | http://autobuild.buildroot.net/results/6f5e6b941a7dde43460fec5000781fbf3d3a7260 |     
  sparc64    |    host-python-sip-4.19.25     | NOK | http://autobuild.buildroot.net/results/68c655b290bb8dd7f64ad51a01142008a3d7f197 |     
   armeb     |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/b9bd3de4eba966a56da9cd1f4e2f476c6f6d2f68 |     
  aarch64    |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/f98395c00af12838b255cd3eb6ab5e5942ebae26 |     
    i686     |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/c5039f3673ffff96c93c49053a1f949d32a20b95 |     
   armeb     |        host-rust-1.68.0        | NOK | http://autobuild.buildroot.net/results/4be65815aeee727ac4790d1c1faa33a78dfd557f |     
   x86_64    |        host-rust-1.68.0        | NOK | http://autobuild.buildroot.net/results/4a060300d83520054a26ec3a63bb27a53eb2b162 |     
  aarch64    |        host-rust-1.68.0        | NOK | http://autobuild.buildroot.net/results/691df79f1768bbf4cfdd0e0d5b851d7d4094061a |     
   s390x     |        host-rust-1.68.0        | NOK | http://autobuild.buildroot.net/results/000a6e2b5a255b28329e8098a8f2b98094d89752 |     
   x86_64    |        host-rust-1.68.0        | NOK | http://autobuild.buildroot.net/results/229015318926d95d15d8354bdbeb0c082255f303 |     
   armeb     |        host-rust-1.68.0        | NOK | http://autobuild.buildroot.net/results/3fb5291faba1eb5dda1d9abf6d823754a85942b2 |     
    mips     |        host-rust-1.68.0        | NOK | http://autobuild.buildroot.net/results/01019d51fe9d89753d0c2f6411516afa26c95c00 |     
   xtensa    |           lcms2-2.14           | NOK | http://autobuild.buildroot.net/results/c36c9c3161c5cec729e4762eb86ec244b1b94fc0 |     
  mips64el   |    libabseil-cpp-20220623.1    | NOK | http://autobuild.buildroot.net/results/5da48af8608997d81067393c40443fbee16641bd |     
  riscv64    |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/b7db010d017b3780d3bfb2e2a5ebc08f3b653162 |     
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/4257c3f0f5aa15f10c89399760a93c8a3ae53401 | ORPH
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/6cfb30e53424480fc2fafb19a1a55717f3a4688c | ORPH
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/1169f1bc301f931d11ead100d7253248e2be9317 | ORPH
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/83b5af9010c1070d03650dfc569255d34a66452e |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/e81ac81044887b0b54da8e846e9cea95dad001c2 |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/1de1ac84cc98f048f386edcfd4abf4f8cc9c0cef |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/676fc95d575b975753c89b7066a9f759d08fbdf4 |     
   s390x     |          libjxl-0.8.1          | NOK | http://autobuild.buildroot.net/results/8cc77c4a02ccc062a11ed1eda534a80d31ae003d |     
   armeb     |         libkrb5-1.20.1         | NOK | http://autobuild.buildroot.net/results/4956384d39b7b87c5bfd885aa58ef782cb5e837e |     
   mips64    |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/79d4b16d80e57b437a62c35839dad9b83bbad960 | ORPH
   mips64    |          linux-6.1.14          | NOK | http://autobuild.buildroot.net/results/b91cadad3f76242dba8157851f5b9022eae02120 | ORPH
    arm      |          linux-6.1.14          | NOK | http://autobuild.buildroot.net/results/be11c022f8a2289a847a8d0c20920d085a37af87 | ORPH
  powerpc    |          linux-6.1.14          | NOK | http://autobuild.buildroot.net/results/5d69bfc0fc1d3908db18434bd01277cee8aab366 | ORPH
   sh4aeb    |          linux-6.1.14          | NOK | http://autobuild.buildroot.net/results/30fbcedb19235ac48cec170f921ffc5ef9a13ed0 | ORPH
  mips64el   |          linux-tools           | NOK | http://autobuild.buildroot.net/results/60696d73c2e5d2af559b98ffaebeceaf91a8553c | ORPH
   mipsel    |          linux-tools           | NOK | http://autobuild.buildroot.net/results/ee0b260d34874ef021b6787b03d3695e44b2780a | ORPH
   x86_64    |         nodejs-16.18.1         | NOK | http://autobuild.buildroot.net/results/3f426976f5de0238b24559651ccc9593f6f9556c |     
  riscv64    |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/09e7d9a68c874e0d4138315deed5faa25a6168ba | ORPH
    m68k     |         openssh-9.3p1          | NOK | http://autobuild.buildroot.net/results/920552a11fd41d8bb8ad72c036704dda10e481f3 | ORPH
powerpc64le  | package/rtl8821cu/rtl8821cu... | NOK | http://autobuild.buildroot.net/results/8878f1be2922e3b0a519483cb7833a83931df0f7 |     
   arceb     |          perl-5.36.0           | NOK | http://autobuild.buildroot.net/results/f60ea4aaf36e719f38bdbc63f2087404075aa4d2 |     
   armeb     |          perl-5.36.0           | NOK | http://autobuild.buildroot.net/results/0dc218e086acef62e674e60cbfa974d94533cecb |     
   sparc     |          perl-5.36.0           | NOK | http://autobuild.buildroot.net/results/7a21fd4fe15ec8cef00ea735285ed193251439b9 |     
   sh4aeb    |           php-8.2.3            | NOK | http://autobuild.buildroot.net/results/e5a5414ed66d3ad06b7071cf88da9e92396fb8b4 |     
  aarch64    |           putty-0.76           | NOK | http://autobuild.buildroot.net/results/e6ca1459c884411630d1ed478935411bbc7549b3 |     
   armeb     |      python-bcrypt-4.0.1       | NOK | http://autobuild.buildroot.net/results/60d9d54cd5ad7f871d4ed7945a3c3261e5b56e34 |     
   sh4aeb    |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/fd7fca0b79a4c094419d068d16b7fe0c46a04271 |     
    mips     |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/980abaf30be8a8cec10b4f3e6b50b6006b20031c |     
    m68k     | sconeserver-8d1935919a20133... | NOK | http://autobuild.buildroot.net/results/87b2429727a3407808154f057d0f2069a378d514 |     
   sh4aeb    |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/7fbbf0b1a0c3e83ee696399f015edfe54ac52126 | ORPH
    sh4      |          shadow-4.13           | NOK | http://autobuild.buildroot.net/results/7a73dfedfe13555491d2d3908ac089c5f28869db |     
 microblaze  |        tcf-agent-1.7.0         | NOK | http://autobuild.buildroot.net/results/a6497abd6c0c22531dece51c712d11f648187ae1 |     
  riscv64    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/5a41708420347da3d0a9a37e2a9c5358d93878eb |     
  powerpc    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/115cf431d1291295f1f6bb565acbe5fe1d1aa5ef |     
  powerpc    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/216b08778d3e2a09759f241b682153e45bf4aea0 |     
powerpc64le  | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/6425a85b0374292bc972b3d5158bbec8495486e0 |     
 aarch64_be  | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/44d541ade7628881c33dffb712f9b01a01cc0578 |     
 microblaze  |            unknown             | NOK | http://autobuild.buildroot.net/results/776f84e33aeb4e6fdf67cb8785b4db92c7e93a07 |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/576c8104b4c3e9b741a6b468b658efad515e1af2 |     
    i686     |            unknown             | NOK | http://autobuild.buildroot.net/results/a53da0a1024e4c80cfc3243820c5d573c3f88265 |     
 microblaze  |            unknown             | TIM | http://autobuild.buildroot.net/results/0932c3af94b9a9595358c28809c6b9014ab75014 |     
   mips64    |            unknown             | NOK | http://autobuild.buildroot.net/results/edd268aeebcacf2c6ec0f06153d6b095045ef966 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/20b2e6c63b51033fc352d13f7c52c48aa3ee7844 |     
    i686     |        valgrind-3.19.0         | NOK | http://autobuild.buildroot.net/results/8e7f0a4956b10eba7cf75ae72c45ef56e2864fb3 | ORPH
  mips64el   |        valgrind-3.19.0         | NOK | http://autobuild.buildroot.net/results/8a700a1a3e9c963eceb50bb4cb8f16009f8e5e98 | ORPH
    i686     |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/b96ab95e6b06784b4598ea94a056807372d026da |     
    i686     |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/e20426a06ed5809a588731d33cf8fa3160bc2cd9 |     


Classification of failures by reason for 2023.02.x
--------------------------------------------------

                host-go-1.19.7 | 2 
              host-rust-1.67.0 | 2 
             containerd-1.6.16 | 1 
fs/axfs/axfs.mk:32: /home/b... | 1 
fs/cramfs/cramfs.mk:46: /ho... | 1 
fs/cramfs/cramfs.mk:46: /ho... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
                 glibmm-2.68.2 | 1 
            host-binutils-2.38 | 1 
            host-binutils-2.39 | 1 
               host-qemu-7.2.0 | 1 
      libabseil-cpp-20220623.1 | 1 
                libgeos-3.11.1 | 1 
                libkrb5-1.20.1 | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |       containerd-1.6.16        | NOK | http://autobuild.buildroot.net/results/0a1a3419145ee4eca3c9b6101235fd9dd3a3f098 |     
 aarch64_be  | fs/axfs/axfs.mk:32: /home/b... | NOK | http://autobuild.buildroot.net/results/4341451ae646c37631cfcb3fbc166218db6fcd94 |     
   mips64    | fs/cramfs/cramfs.mk:46: /ho... | NOK | http://autobuild.buildroot.net/results/70a96749f30d6ad60251ff79d7b93dc0af03d415 |     
 aarch64_be  | fs/cramfs/cramfs.mk:46: /ho... | NOK | http://autobuild.buildroot.net/results/e1f9431bff81d771efc54484d8c718a3bffa7ae0 |     
 aarch64_be  | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/bfa9a6f0d903d568b5a382b2357334274af1678d |     
    or1k     |         glibmm-2.68.2          | NOK | http://autobuild.buildroot.net/results/0672bcf5d6b9d8a0f8e4c985777e3083f8d41719 |     
microblazeel |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/b1a8fd3bd2d95f7bcba368660722f8058f1ecfad |     
    or1k     |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/738ab1a73b03fb43f7212429c905844b0fc63798 |     
  mips64el   |         host-go-1.19.7         | NOK | http://autobuild.buildroot.net/results/cb6df2ce0241952ac3288b3ae76a571ebfec8e62 |     
  aarch64    |         host-go-1.19.7         | NOK | http://autobuild.buildroot.net/results/43b39058cc25171bacab4a29c4a454f439aca061 |     
powerpc64le  |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/9b3cd794e395aed9effb757921d830f39573c9ce |     
   x86_64    |        host-rust-1.67.0        | NOK | http://autobuild.buildroot.net/results/e92d47347e23a85cbb9db2ba0521c55ff28e7df0 |     
 powerpc64   |        host-rust-1.67.0        | NOK | http://autobuild.buildroot.net/results/9b89977d051d2f6ba94f72028f2ffb0f0e12ddaf |     
   mips64    |    libabseil-cpp-20220623.1    | NOK | http://autobuild.buildroot.net/results/a1ed82dc74bd31afd5bd576ed7a4811f100cedc5 |     
    or1k     |         libgeos-3.11.1         | NOK | http://autobuild.buildroot.net/results/d065f68e8d3dcb50bd0ff56b018872a0733a7db9 |     
   armeb     |         libkrb5-1.20.1         | NOK | http://autobuild.buildroot.net/results/218150fc9fee0891982c357299309945f4800a82 |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
