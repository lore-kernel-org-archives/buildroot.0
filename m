Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AA72C00A5A
	for <buildroot@archiver.kernel.org>; Thu, 19 Jan 2023 06:43:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A84A0400EC;
	Thu, 19 Jan 2023 06:43:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A84A0400EC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SI8R8OceeZla; Thu, 19 Jan 2023 06:43:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id ABCCE4012D;
	Thu, 19 Jan 2023 06:42:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ABCCE4012D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4EC4E1BF25F
 for <buildroot@lists.busybox.net>; Thu, 19 Jan 2023 06:42:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EE7014012D
 for <buildroot@lists.busybox.net>; Thu, 19 Jan 2023 06:42:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EE7014012D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BfPxzxH0z5ZF for <buildroot@lists.busybox.net>;
 Thu, 19 Jan 2023 06:42:55 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AB003400EC
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AB003400EC
 for <buildroot@buildroot.org>; Thu, 19 Jan 2023 06:42:54 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 42DAD20008
 for <buildroot@buildroot.org>; Thu, 19 Jan 2023 06:42:51 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Thu, 19 Jan 2023 06:42:51 -0000
Message-Id: <20230119064257.EE7014012D@smtp2.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1674110571; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=wGCrGbcae1CK3afVCjsCFaGcuusXLoJfXuBW09e1ajM=;
 b=FRmPuV3tTA3whPORay9Tf58AB14p6gtFSDZ++h0K93O1gSFdWuVFkXmUZIYm+FF0gpYS8d
 F2U7TgfhEcb+dCTftMZydifq58nxFGg3HcTjCJwCMgDblxM4dAzYQlHZVJXu9nhV9jSl1c
 s2mkeRePdauqlRPetggc/rErQoik0AxTTa4nDMbvevqYq3NGuY+SbO86s+VZOPGUpBbewC
 hxgS3SUMzyp7zaGTVk8MS50ZCGMPRF3Imvrs3v5aLMcPEO4Pif3Qj3yDFTrj67e+0kN9uI
 iy1Q5sG1ufbFrSODCIEdqI6YVODEgUh9VYol3RUS9mwPKGdrc4Ljtkp7j4Vmjg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=FRmPuV3t
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-01-18
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

Autobuild statistics for 2023-01-18
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  |  0  |  1  |  0  |  1  |
  2022.11.x  |  1  |  3  |  0  |  4  |
    master   | 124 | 229 |  0  | 353 |

Classification of failures by reason for master
-----------------------------------------------

                   bash-5.2.15 | 22
               host-fwup-1.9.1 | 16
                    fwup-1.9.1 | 15
            host-binutils-2.38 | 12
                  jack2-1.9.21 | 8 
                    norm-1.5.8 | 8 
                    opkg-0.4.5 | 7 
                     xz-5.2.10 | 6 
                host-go-1.19.5 | 5 
                    bat-0.19.0 | 4 
                elfutils-0.186 | 4 
                   ethtool-6.1 | 4 
         host-sentry-cli-2.8.0 | 4 
               libglib2-2.72.3 | 4 
                   linux-6.1.5 | 4 
                     efivar-38 | 3 
            host-binutils-2.39 | 3 
         host-gcc-final-11.3.0 | 3 
          linux-5.10.145-cip17 | 3 
                    pixz-1.0.7 | 3 
                       unknown | 3 
                  zabbix-5.4.9 | 3 
android-tools-4.2.2+git2013... | 2 
             dahdi-linux-3.2.0 | 2 
                 dmalloc-5.6.5 | 2 
                    dust-0.8.1 | 2 
              erlang-22.3.4.22 | 2 
fs/ubifs/ubifs.mk:49: /home... | 2 
glibc-2.36-81-g4f4d7a13edfd... | 2 
  gobject-introspection-1.72.0 | 2 
                   gvfs-1.48.1 | 2 
            host-binutils-2.37 | 2 
              host-rust-1.66.1 | 2 
             libgpg-error-1.46 | 2 
                   libnss-3.87 | 2 
              libostree-2022.7 | 2 
         mxs-bootlets-10.12.01 | 2 
                   pcre2-10.42 | 2 
    python-cryptography-39.0.0 | 2 
afboot-stm32-3566acd582e553... | 1 
                alsa-lib-1.2.8 | 1 
               apcupsd-3.14.14 | 1 
                  assimp-5.2.5 | 1 
                  bind-9.16.33 | 1 
                bpftool-v7.1.0 | 1 
                 coreutils-9.1 | 1 
             ctorrent-dnh3.3.2 | 1 
                 dhcp-4.4.3-P1 | 1 
docker-proxy-f6ccccb1c082a4... | 1 
                     exim-4.96 | 1 
                  ffmpeg-4.4.3 | 1 
                   flann-1.9.2 | 1 
             fontconfig-2.13.1 | 1 
fs/cramfs/cramfs.mk:46: /ho... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /tmp/... | 1 
fs/ubifs/ubifs.mk:49: /tmp/... | 1 
   gdb-arc-2020.09-release-gdb | 1 
                gerbera-1.10.0 | 1 
gummiboot-2bcd919c681c952eb... | 1 
              host-pahole-1.24 | 1 
              hyperfine-1.14.0 | 1 
      libabseil-cpp-20220623.1 | 1 
              libgcrypt-1.10.1 | 1 
      linux-5.10.145-cip17-rt7 | 1 
                   linux-tools | 1 
                  matio-1.5.23 | 1 
                 mesa3d-22.3.3 | 1 
            micropython-1.19.1 | 1 
                    musl-1.2.3 | 1 
                 nerdctl-1.0.0 | 1 
                  ntp-4.2.8p15 | 1 
   openvmtools-11.3.5-18557794 | 1 
           optee-client-3.19.0 | 1 
          powerpc-utils-1.3.10 | 1 
                     pv-1.6.20 | 1 
            python-bunch-1.0.1 | 1 
         python-greenlet-2.0.1 | 1 
            quickjs-2021-03-27 | 1 
rtl8192eu-94bce7798bbb18de6... | 1 
              sigrok-cli-0.7.2 | 1 
toolchain-external-codescap... | 1 
uclibc-ng-test-6790eafe897b... | 1 
ulog-0389d243352255f6182326... | 1 
uqmi-0a19b5b77140465c29e2af... | 1 
               valgrind-3.19.0 | 1 
                xenomai-3.0.10 | 1 
               xfsprogs-5.14.2 | 1 
                  xvisor-0.3.1 | 1 
                    zeek-4.1.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      | afboot-stm32-3566acd582e553... | NOK | http://autobuild.buildroot.net/results/648dd222d95316209c0759a4c2f190f547aa7204 |     
    or1k     |         alsa-lib-1.2.8         | NOK | http://autobuild.buildroot.net/results/91c6d7766273627c32c5d2678ef12d9f5ed9cc97 |     
 powerpc64   | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/1a2dfc8ecc1d7b8b9b4d2234a30b0474aed24fcd |     
 powerpc64   | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/98ab5a05077a58a9fa411df3bcd330ec208164d0 |     
  aarch64    |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/add53cc5ef4944a41a17f2dcaf35172cc3c95d17 |     
   mips64    |          assimp-5.2.5          | NOK | http://autobuild.buildroot.net/results/2d96c4fc44621b808bb2b35dd5ea411bdac6d8c4 | ORPH
    or1k     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/2f32f9bcc0b7c3f6a86dd4abebc39ccd7dc4823b | ORPH
powerpc64le  |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/76e6ceead17ddc3154dddab69c9db1b4de12829e | ORPH
    m68k     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/83c6b35b4a1eb6bd69d5dcc15577e0ed6ff62d9e | ORPH
    arc      |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/eb8d85ca3c81df021ed41b447814f77f626dfa97 | ORPH
   arceb     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/8e2864b6fab6e6a46417c0bdfb9f95a00be41659 | ORPH
    arc      |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/aff7f1a64a193d92f5f8ef3b7d9f8e20652c685d | ORPH
    arc      |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/df69f75f7fd47a70f7b08371f5f4b7c3085a42c6 | ORPH
    sh4      |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/60e15bfdc8dc963bed62fc7ddb40264a49829347 | ORPH
microblazeel |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/8f29254d211c5f1ddeef24fd5a871e6e92abe117 | ORPH
  aarch64    |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/62644ed400a0c1171c2b27dde6963a6f5234cd6a | ORPH
   sparc     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/951e7722ccad453dd429addb27a6d78bcd49b765 | ORPH
   sparc     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/f5fc792c6e481008190afaf840d764fe6e9fb058 | ORPH
   sparc     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/a52bb103fb33eec5435239b3a9d36bbf39d3b317 | ORPH
    or1k     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/0e51227f0d746b061301865d077ac47f1cb2a133 | ORPH
   x86_64    |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/457460dbce38b33af9e43f56613d103798ee2c35 | ORPH
    arc      |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/09bd688ea692940dde92a5ead4f2c2bab03c9471 | ORPH
    arc      |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/9ee84978c5632138ea6d153b221b768b7fed93da | ORPH
   mipsel    |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/fbf8984a3ecb616a5b556f98c37d55137fffdc47 | ORPH
    or1k     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/99dd6392424723efe6f8c3e73cd5c0d6d354bdf3 | ORPH
   armeb     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/4720d99607f6f0397cf31a29b17a67054ebf1be7 | ORPH
    arc      |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/3a0f75eeb50b26b0fab8cbb214ffbc6cdc8fa7b1 | ORPH
   xtensa    |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/1add7c6c6ea54b1fbc011347c4e15fd16c342961 | ORPH
  sparc64    |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/427fc2861552c03bfe6a72581dabcf8e77b2c5e6 |     
powerpc64le  |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/c66d3357cd0c7f7d8548e15c719063d8a7389d7f |     
  aarch64    |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/7f36ad0abb01cbae113671f868ad755ef0bc39cd |     
 powerpc64   |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/bd993962cc3b97c501b2418638bb40a778a0766b |     
  powerpc    |          bind-9.16.33          | NOK | http://autobuild.buildroot.net/results/3519e7fa4e6a9e4f5d421a43a1b85e157c1275bd | ORPH
   x86_64    |         bpftool-v7.1.0         | NOK | http://autobuild.buildroot.net/results/25c7803c625cc7c1e1d8d193af136cf6759e0555 |     
    sh4      |         coreutils-9.1          | NOK | http://autobuild.buildroot.net/results/001da1086eaa528b796fce25009b878c965160a0 | ORPH
  riscv64    |       ctorrent-dnh3.3.2        | NOK | http://autobuild.buildroot.net/results/dfe659b52f0308cdfc86dd5d54563d30f3513da9 |     
   x86_64    |       dahdi-linux-3.2.0        | NOK | http://autobuild.buildroot.net/results/7ea38f1b258df3da3c688fe2b9a8565d77f8d71e |     
 aarch64_be  |       dahdi-linux-3.2.0        | NOK | http://autobuild.buildroot.net/results/86ccb94c08ec0a08ac989dfdf7645cd7c40ba49c |     
   xtensa    |         dhcp-4.4.3-P1          | NOK | http://autobuild.buildroot.net/results/674cc5a472da7721ba80b550332e231a1f330b23 | ORPH
    i686     |         dmalloc-5.6.5          | NOK | http://autobuild.buildroot.net/results/de62394659c4bf3a4559176fd6f2d3ca20e772da | ORPH
    i686     |         dmalloc-5.6.5          | NOK | http://autobuild.buildroot.net/results/7f92a7ede894cf34160b2eb27949f37759898798 | ORPH
   s390x     | docker-proxy-f6ccccb1c082a4... | NOK | http://autobuild.buildroot.net/results/013f32b710cf3ceafb303c0927f09c36b6518f61 |     
 powerpc64   |           dust-0.8.1           | NOK | http://autobuild.buildroot.net/results/72cbd7efd1432f39bfcea31e7410c4faa77c698d | ORPH
  sparc64    |           dust-0.8.1           | NOK | http://autobuild.buildroot.net/results/865d1a6928cd81607b58ea56b11da682a0f98402 | ORPH
    arm      |           efivar-38            | NOK | http://autobuild.buildroot.net/results/138e49d648025d8f058a4f0b5b3ff117c2e4086d |     
   mipsel    |           efivar-38            | NOK | http://autobuild.buildroot.net/results/070fa6a28d53f5206e08f548a00cd49a631137b8 |     
  mips64el   |           efivar-38            | NOK | http://autobuild.buildroot.net/results/c022a6832f0954c764f93c24eaa716456ffe5899 |     
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/916b46e3ed160270ebb6159792b73f442f708483 | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/1fd4e96403b97a579908d89780fa92f5fa925d98 | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/46666ca845afe5f26f0dbc50536d3b0f24caddfe | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/4d4a296eef6a5bf086836a9e821be0ff14a4296b | ORPH
   mipsel    |        erlang-22.3.4.22        | NOK | http://autobuild.buildroot.net/results/094894cc396bfdc7e1628e9b2ae7aa79e2e512bd |     
   mipsel    |        erlang-22.3.4.22        | NOK | http://autobuild.buildroot.net/results/e9ea08d35edd22ff517d625febba338f4ef76152 |     
    arc      |          ethtool-6.1           | NOK | http://autobuild.buildroot.net/results/76d54811712bb21e334d059b923760eb74709eed |     
   x86_64    |          ethtool-6.1           | NOK | http://autobuild.buildroot.net/results/44aca0e25329d821fac856848387056b8f04c81f |     
    arm      |          ethtool-6.1           | NOK | http://autobuild.buildroot.net/results/858caac002c053924da560a2009177ac92ec64f3 |     
   mipsel    |          ethtool-6.1           | NOK | http://autobuild.buildroot.net/results/9dcb109cb02cb8e227ae8854b9de7b0f58d3843e |     
    arm      |           exim-4.96            | NOK | http://autobuild.buildroot.net/results/cc6e0aacc6934e65f94cebde6ab8f9096da76397 |     
   arceb     |          ffmpeg-4.4.3          | NOK | http://autobuild.buildroot.net/results/43e3bbae8746b43b081d16d2a9f7a0bd9baef5e8 |     
    mips     |          flann-1.9.2           | NOK | http://autobuild.buildroot.net/results/74f12c5510b274756c169e516c532111e4637b1c |     
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/9790a3e12facefcd8b7a1b6797a455f28d582673 | ORPH
microblazeel | fs/cramfs/cramfs.mk:46: /ho... | NOK | http://autobuild.buildroot.net/results/20ec946119ceac45e9b8784a285aed08f88d363d |     
  aarch64    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/78b1298c5236b000060e1c7fa38f8383f9669ed2 |     
 powerpc64   | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/6f08110b3b67f20c54cdaf3b70e90d817735f38c |     
    mips     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/5d1869dda9f5e9c760c39736ba22f63a833c3b31 |     
   arceb     | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/766ae414e744bc163feb8011bccb26d716ae70dc |     
    arc      | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/020768151f170418d150a73f4878bea9f349e6ab |     
  sparc64    |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/81dc91d16d3020b1a96e3dcc428749ecd8aa3873 |     
  aarch64    |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/c302de90fdf19711da4a4ccb9c2e0972c6a0bc7a |     
    mips     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/eac0b1437a9f9fc206e0a517e590888c976f60da |     
   nios2     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/49977321d57b7e34d4a86a0a141519bda4157012 |     
    sh4a     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/d1d20d2d43db25cb585d9df08bfeff7e825b471a |     
  aarch64    |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/2fababbf5846184b1c635f5d3e1046adc902d7bd |     
  aarch64    |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/c6b225050942428b6f120be84d57844aa59bf8e7 |     
  aarch64    |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/aaf425f72fc26713e5149feefbb2589690b2a330 |     
  powerpc    |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/ce22124fda1e603e26cb704ac7dbde3defee0f22 |     
   armeb     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/7ae5080c10ce50ecf0216c215976f681ff59eeb8 |     
   mipsel    |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/fdf59f973c76cf80482b40291de14ea7e5a56d95 |     
  sparc64    |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/96c731d3d7c5ec5751c2c87c7451657f1ad91fff |     
   mipsel    |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/7d5c80790550320b3a21b4887182182e36d338ca |     
   x86_64    |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/9a32fe12189601c66169c65817642433a6f68caa |     
   nios2     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/9b4d49cfdc4796894955134609aa7a267040fb44 |     
   arceb     |  gdb-arc-2020.09-release-gdb   | NOK | http://autobuild.buildroot.net/results/f68a330987b7c4253e70b2f9c221ecb7e39d150b | ORPH
   mipsel    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/031ba8402446d9fadeb44f9ed97377d833d4b5c4 |     
   arceb     | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/1d3b716bc1176effcb99fcb8bd92377cd36dc720 |     
  powerpc    | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/539bb687d751d07c64dd9f9d1bc6fd3cff18467c |     
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/84d376cbaf4d85b968e8980ff96246b83b9c8b9c | ORPH
   nios2     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/501bc0c96654e5da3b64e1d9a9e75202a5f61789 | ORPH
   x86_64    | gummiboot-2bcd919c681c952eb... | NOK | http://autobuild.buildroot.net/results/d21f9bf43d586ece5fffedf1f53ab463e3968b45 |     
  powerpc    |          gvfs-1.48.1           | NOK | http://autobuild.buildroot.net/results/1ec2466d284a2a2193597d1166ebfd76fc631f45 | ORPH
   s390x     |          gvfs-1.48.1           | NOK | http://autobuild.buildroot.net/results/9cf672d051829a7ba8391e39829a60a766cc4551 | ORPH
   x86_64    |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/f0d719d0e0ab7a0661bee342e201c81808abf6c4 |     
 aarch64_be  |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/87fc8f92857f059c17717e3767728bcfd190fec4 |     
 aarch64_be  |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/b49f324836d507dd53cd1f74747616ac644faaf5 |     
   armeb     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/1be81ef99956a194f8deb97ccca06580f74a7baa |     
   mipsel    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/18a9776f3cf3ca458e383d24ac8bab0beaeeb09e |     
   mipsel    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/2e8e301a8142fceab80366f7783d2da1ddc11306 |     
    sh4a     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/336d003b42e9d5a2da2ffa7db9acad15e64b0a9a |     
 aarch64_be  |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/388207aeb1abafacc5a0cb38796dbc0c0387a563 |     
  sparc64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/d14fe7f681898056999ee547570642e822f66e6d |     
    i686     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/fb1595eca73e75f1e86bb71d17b7e1432b125183 |     
   mipsel    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/cc6d052e7ed657bf70e6f4af84ca2daf3160dbe9 |     
   xtensa    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/12b87b5563a2aaef5b07df2cca7b737186243823 |     
  mips64el   |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/ad839f6034ac3b9079257989855d9dd87bfc7ab4 |     
  riscv64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/8500e44ba70277d778c0c1cdea6943adbfce8e2d |     
   s390x     |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/980c2a908c02b2ae90ab19a06eccbbec9a58402c |     
   nios2     |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/f802714c46235cc29ddb333218085a0204219f82 |     
microblazeel |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/9262901dfaac9b6d4e443f32a8484bf35ecbb3b0 |     
  mips64el   |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/4a4c2c56b567b18733abf15957f8c3edb1a57d8d |     
   mips64    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/176960d77ab9f1dcbfa118f5af53e2292ebe2429 |     
 microblaze  |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/ebf20881b3699fe2a1c4b49f5e0e844d7401c417 |     
  sparc64    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/4b5d29f5f5603a0b6fe970a7e17fdc24703b8cdc |     
  aarch64    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/8496f970d984537f5e0a961bb6beb23742bd61cc |     
 powerpc64   |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/0545cbb3232ccf03ca388ae3b68d34b56ab1b9af |     
    sh4a     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/dd68b9ff8190314a59233984b42e9d9fedb73adc |     
 powerpc64   |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/75b24f8b8170488be97a92edc6766008cf4e0104 |     
   s390x     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/462a5d6d14159a5e30a7b59436e2f6c0f44eadc1 |     
    m68k     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/397fb05e9d74a3ee437ba1d649ef1f29ce16c491 |     
  sparc64    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/5ecb666f6ad4ea20f8f4603e6ecd2d98f4afe05d |     
powerpc64le  |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/1c62bea8a6fbdb7b0191f0bef11791de56505301 |     
    or1k     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/2be5a8289836e69361090aefd99f4974c0b31602 |     
    i686     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/b3cf3c5f7cc264e6188c36d4a64a10ae286b5b28 |     
  mips64el   |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/1a176583d556f59c1f782da2fac0b4a3a9d19fdd |     
 powerpc64   |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/18f4fba901555e68f6b8a9afdccd8b69d599d1f0 |     
    arm      |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/cca9a3e41abf06d767c93cef79df3f1b0d3ae1be |     
microblazeel |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/81464f563adef8200f4a9bd5bcf9dc89066c468b |     
microblazeel |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/9e54815b308efd082a6e8b13d3c78a541ef238ef |     
    i686     |         host-go-1.19.5         | NOK | http://autobuild.buildroot.net/results/898c71bad3c92fa5d93428c6dffe5cba6540449a |     
  mips64el   |         host-go-1.19.5         | NOK | http://autobuild.buildroot.net/results/c3e7fe9aaf35b0a966a3a04940051a3867328e0a |     
  mips64el   |         host-go-1.19.5         | NOK | http://autobuild.buildroot.net/results/6678087c701390309ca673defb980b09ed15d0bb |     
   mips64    |         host-go-1.19.5         | NOK | http://autobuild.buildroot.net/results/21cef4d3755781792434b4d38fe3b476319e5262 |     
   mips64    |         host-go-1.19.5         | NOK | http://autobuild.buildroot.net/results/f133299ba703c3722edaa24d7c1d4cd21159b044 |     
   nios2     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/71cd7b167001ca3eeddab69cec752f5ba15a95e9 |     
   x86_64    |        host-rust-1.66.1        | NOK | http://autobuild.buildroot.net/results/4efba1dd2b29085ddada6c30b32e75495b230a85 |     
    mips     |        host-rust-1.66.1        | NOK | http://autobuild.buildroot.net/results/60f79475f777195f3e607937102fb3e795828331 |     
   x86_64    |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/97012163738e7b2e325760d798325cd1c20e94e3 |     
microblazeel |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/f9f7280adb30b25496528797358e24695a46f617 |     
 powerpc64   |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/0bb1cc4da51afab8a54a7c843dd7035fb214b128 |     
    i686     |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/b14e4aebd7fb538003f27d28cc8ea0fbc2ff089d |     
   s390x     |        hyperfine-1.14.0        | NOK | http://autobuild.buildroot.net/results/703d9cd5bca0e635a47d7a25b411552111cd681c | ORPH
   xtensa    |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/5d2572ef50ebadaa154f1918fe62a275911ca3d2 |     
    sh4a     |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/cd638363c62041eef092b913ee0a51d1182d2112 |     
microblazeel |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/cdc7dd999e42da0484a3d376b75b1dc5f0c90994 |     
  aarch64    |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/211c3c1fca83240a039a228ddd8995d6d394cceb |     
  riscv64    |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/9daa3ac6d7105bde2afbbe358ae73202f5a3af63 |     
  sparc64    |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/1166bd97f5905d5ca22fcfa1bcd873039db0bbd8 |     
   mipsel    |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/0c0ea28b59d374d65e02e7eca23e3887d65bc6ba |     
  sparc64    |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/c503a817c30ee137a6196ee83537b82b8d650702 |     
  mips64el   |    libabseil-cpp-20220623.1    | NOK | http://autobuild.buildroot.net/results/e4bc72c714fe2f33143b638fb391b7608466e69a |     
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/423740839b61b0a490c82dc714a2e6b7f12ba91f | ORPH
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/389b4e5e8494ebfff02fd698957a0fbd87b8fb2f |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/194869302a917eef8001608ed22c767f1bacd0af |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/72840bc1190f7946c02e4fe8f8522c8abacf0066 |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/beddbeef1248121d7edeb4a9bb96eb0b3fbbc604 |     
 aarch64_be  |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/0003c54b15f27d9b0c29361e070db86ac61c6d1f | ORPH
 aarch64_be  |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/c08e0e5f6ae29623ae1dd3e7a2ac6b508345090b | ORPH
  aarch64    |          libnss-3.87           | NOK | http://autobuild.buildroot.net/results/3804b80e0f2acbda4885adc0c75b79f63701ffdd |     
   mips64    |          libnss-3.87           | NOK | http://autobuild.buildroot.net/results/7312bb3084fd9dfae21013de22bb89846b7269bc |     
   nios2     |        libostree-2022.7        | NOK | http://autobuild.buildroot.net/results/3822e6cc9a94ce1405f444be260cd1647b47fc52 |     
    i686     |        libostree-2022.7        | NOK | http://autobuild.buildroot.net/results/20fdafd9588c08e16a3abec56a6856fad994e78f |     
   mipsel    |      linux-5.10.145-cip17      | NOK | http://autobuild.buildroot.net/results/4f81f241d699d63262486013afe0cbc5b580554f | ORPH
   nios2     |      linux-5.10.145-cip17      | NOK | http://autobuild.buildroot.net/results/d1f568ce6f73a76ed07df87d6fbcf251d55f6275 | ORPH
   mipsel    |      linux-5.10.145-cip17      | NOK | http://autobuild.buildroot.net/results/49ee066af8d2f166544252fd777956d67714dcbe | ORPH
microblazeel |    linux-5.10.145-cip17-rt7    | NOK | http://autobuild.buildroot.net/results/34da2521bd14d7df5a1d65118dc560dd4cf24bc6 | ORPH
  mips64el   |          linux-6.1.5           | NOK | http://autobuild.buildroot.net/results/fcab31c26139d59b872d771f26cc914e56d11bc5 | ORPH
   mipsel    |          linux-6.1.5           | NOK | http://autobuild.buildroot.net/results/f6d968570e6d9f359626c94ed402a99d795713d9 | ORPH
   nios2     |          linux-6.1.5           | NOK | http://autobuild.buildroot.net/results/93bb28537c43d18cbba625709336ce428c51a312 | ORPH
   mipsel    |          linux-6.1.5           | NOK | http://autobuild.buildroot.net/results/98f370bfd70a053432e7b7ab9144c54a26d45f4d | ORPH
    i586     |          linux-tools           | NOK | http://autobuild.buildroot.net/results/eff1d701f07c4e1051b541d02cbf280e8da64936 | ORPH
   nios2     |          matio-1.5.23          | NOK | http://autobuild.buildroot.net/results/9ff4237d867d6fed0033f04a6a51cdb0ad024d78 |     
   x86_64    |         mesa3d-22.3.3          | NOK | http://autobuild.buildroot.net/results/452d419b398ad2ce2b1438b1f0dd383906691a79 |     
 aarch64_be  |       micropython-1.19.1       | NOK | http://autobuild.buildroot.net/results/39e05a1b253791dbb4686aff0ad7a29ea82ebce6 |     
  powerpc    |           musl-1.2.3           | NOK | http://autobuild.buildroot.net/results/f1672a17fb49fc475765cb4ee9311a642a93d47d |     
    arm      |     mxs-bootlets-10.12.01      | NOK | http://autobuild.buildroot.net/results/0c2386454f0d97fe74674bd9626990c32cdfa82e | ORPH
    arm      |     mxs-bootlets-10.12.01      | NOK | http://autobuild.buildroot.net/results/b6ba6b618adf2398f474c1ef006b393724c21ec1 | ORPH
powerpc64le  |         nerdctl-1.0.0          | NOK | http://autobuild.buildroot.net/results/4db7f60c854b23a906a4115fd8e10a705cb988ec |     
 microblaze  |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/59a8aad41d22ecd387d6ec9cd1d1ce111e4cb3af | ORPH
  aarch64    |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/65bb13c6ecba57eb91c691f1f1a9e102c8ee77a0 | ORPH
    i686     |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/94755ea8304755e7499874446f70de5586343e3e | ORPH
    or1k     |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/e467ddaafdb2c80ef24e00d1ca7ed0f7b47f7e60 | ORPH
   mipsel    |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/afcb9428fa4dd4bd36dd5d53b3c9ecfa23285361 | ORPH
    or1k     |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/1ce14d3d347ab4b95b73b76393eba809a43d4e57 | ORPH
 microblaze  |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/eafd569a50f3bb42d3f680dc1568e56feb6f1fb0 | ORPH
    i686     |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/cc2aa34a6aa4324f7f881aae025588c842551c39 | ORPH
  riscv64    |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/c086b70a1566adb446e4d6a6934a6c5dfc6db403 | ORPH
  aarch64    |  openvmtools-11.3.5-18557794   | NOK | http://autobuild.buildroot.net/results/0e5dd0a7b25a074d8855cf8cceb0c186942ca159 |     
powerpc64le  |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/5415c31049e86169f3bc5b3d67d9c958e24da871 | ORPH
  sparc64    |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/c8e58cd068247aae3572fb738e89e3132884e403 | ORPH
   nios2     |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/e04da11a5480c6b1772d9a70fd17110bbb945fa0 | ORPH
 aarch64_be  |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/52dd6e3c4ca60c605bfc879e58b52ea21a483b8f | ORPH
    sh4      |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/5b84f80f1bb08524d4c6337cb14155083207abf2 | ORPH
 aarch64_be  |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/5ea0296980dceb6a8e7a470d39bde138880181b7 | ORPH
    sh4a     |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/d819e2d35093afd372d68bad8505d447674428d7 | ORPH
    mips     |      optee-client-3.19.0       | NOK | http://autobuild.buildroot.net/results/2f53c25237f3be26e60bac4005cd1e0335d8676c |     
   sparc     |          pcre2-10.42           | NOK | http://autobuild.buildroot.net/results/32aec874cb84a51fe564c9b72026cbef389d7900 | ORPH
   sparc     |          pcre2-10.42           | NOK | http://autobuild.buildroot.net/results/9d6bf202f748f9a463c6f80c03c12970f5f2beef | ORPH
  sparc64    |           pixz-1.0.7           | NOK | http://autobuild.buildroot.net/results/ad7eeb25ad76dbedaa3435277a930c2b7d1e3ae8 |     
   nios2     |           pixz-1.0.7           | NOK | http://autobuild.buildroot.net/results/83c15ad1277ac37ad1a745d87c2e38b5b41b7a95 |     
    m68k     |           pixz-1.0.7           | NOK | http://autobuild.buildroot.net/results/73a0df9a0ad51314cf044c7adf10c21939b15bef |     
  powerpc    |      powerpc-utils-1.3.10      | NOK | http://autobuild.buildroot.net/results/1ad632a7a446968b32fca00ca2f128b2dbc08821 | ORPH
   armeb     |           pv-1.6.20            | NOK | http://autobuild.buildroot.net/results/7266d1cc9d912013bba2bbea933fbb3b7377e3da | ORPH
    mips     |       python-bunch-1.0.1       | NOK | http://autobuild.buildroot.net/results/f2f3c6ae107b050d442a28339014d1464d8b353f |     
  sparc64    |   python-cryptography-39.0.0   | NOK | http://autobuild.buildroot.net/results/85c172a04006b3c3f926d53044c9a998174c5ad2 |     
powerpc64le  |   python-cryptography-39.0.0   | NOK | http://autobuild.buildroot.net/results/1303bb115083d09ddd80f875ebd086a39ff1849b |     
   mipsel    |     python-greenlet-2.0.1      | NOK | http://autobuild.buildroot.net/results/14ef524d7e6f8be52c56fc8eb7b32b4ab37f5ae2 |     
    sh4      |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/b74a876df5705ae8b88e4895f9ad03fb7eff86d6 |     
 powerpc64   | rtl8192eu-94bce7798bbb18de6... | NOK | http://autobuild.buildroot.net/results/97d2128813f188c15c23bf8d81cf678a6d7e1abe |     
  mips64el   |        sigrok-cli-0.7.2        | NOK | http://autobuild.buildroot.net/results/77102979527b7cd198e8489fcc364156785ec937 | ORPH
    mips     | toolchain-external-codescap... | NOK | http://autobuild.buildroot.net/results/64698941781707ca5c3db6968701dc425ee8388d | ORPH
   armeb     | uclibc-ng-test-6790eafe897b... | NOK | http://autobuild.buildroot.net/results/3b9ec64faa56323a9bc8878b85572c951311b1d2 |     
 aarch64_be  | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/9db6d171a560535ef432d6e9714002c433b2b78c |     
  sparc64    |            unknown             | NOK | http://autobuild.buildroot.net/results/ad222bc86e871c872c2056dd718cbb6e6641729f |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/58acfae5e6899cff5465971006561a0ba07ef5d6 |     
powerpc64le  |            unknown             | NOK | http://autobuild.buildroot.net/results/6289e89d45eeabf2126828084b933573642dc322 |     
   x86_64    | uqmi-0a19b5b77140465c29e2af... | NOK | http://autobuild.buildroot.net/results/fb5c543eb0684d23939c9d3cd2e62c0a71d63bfa | ORPH
    mips     |        valgrind-3.19.0         | NOK | http://autobuild.buildroot.net/results/c774b61b0c0f508391401f5f8730dde99e6324b9 | ORPH
   nios2     |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/94b5b7c4fcbd1d02a055c17e46311def7d5241d5 |     
   mipsel    |        xfsprogs-5.14.2         | NOK | http://autobuild.buildroot.net/results/b1d7cdd0a1b817b35ea98ac68f60104af2571ea2 | ORPH
   x86_64    |          xvisor-0.3.1          | NOK | http://autobuild.buildroot.net/results/4c3faf77dd5859eccf9ec35d303134e944b7cac5 |     
 microblaze  |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/13b199404fc7a6f3576980746e48dccbf8490cb5 | ORPH
microblazeel |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/ad566888bf63b22a527b1b3eb0a0ef7fd981a2da | ORPH
microblazeel |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/500573198e1242d9865d7520976fbd9bf3a6492a | ORPH
microblazeel |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/f3706f9415465e784c3621edb02fb7765f6a3a54 | ORPH
microblazeel |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/3141726bd6eccd12c210db62d2f954b751d11d52 | ORPH
 microblaze  |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/e54dc63fc36662241b1af8494e1014a96323913a | ORPH
 aarch64_be  |          zabbix-5.4.9          | NOK | http://autobuild.buildroot.net/results/2ad2bf1ee62ff04e26d274ad32a33703a349704e |     
  aarch64    |          zabbix-5.4.9          | NOK | http://autobuild.buildroot.net/results/0fbc8629975ab2cbc9ae7b7574dd2f5424a0310b |     
 aarch64_be  |          zabbix-5.4.9          | NOK | http://autobuild.buildroot.net/results/097eafe1ce4bac08aad09ed5877e0f6bf3c0ea62 |     
microblazeel |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/28999119294e6a4209f484fe40147525d7ea5572 |     


Classification of failures by reason for 2022.02.x
--------------------------------------------------

            igd2-for-linux-2.1 | 1 


Detail of failures for 2022.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/f0098c86ab0b09bde1d2c14c1dd7440995e0c916 |     


Classification of failures by reason for 2022.11.x
--------------------------------------------------

             lirc-tools-0.10.2 | 2 
             containerd-1.6.12 | 1 


Detail of failures for 2022.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i586     |       containerd-1.6.12        | NOK | http://autobuild.buildroot.net/results/bec011330d0b19b6dd3bfea60a9f1d7918fbb414 |     
    sh4      |       lirc-tools-0.10.2        | NOK | http://autobuild.buildroot.net/results/aaa50b17bd8e4fd3874c1e239cf58450c816f977 | ORPH
   nios2     |       lirc-tools-0.10.2        | NOK | http://autobuild.buildroot.net/results/d7b6777cf1b345a919f7db5f7d10b83bbd3fed77 | ORPH



-- 
http://autobuild.buildroot.net

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

