Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7D05C25B4E
	for <buildroot@archiver.kernel.org>; Tue, 24 Jan 2023 06:53:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 72A1981EBD;
	Tue, 24 Jan 2023 06:53:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 72A1981EBD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xVMAzZk8EnB8; Tue, 24 Jan 2023 06:53:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B74F781FA2;
	Tue, 24 Jan 2023 06:53:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B74F781FA2
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F29CF1BF370
 for <buildroot@lists.busybox.net>; Tue, 24 Jan 2023 06:53:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D2D7B60BBF
 for <buildroot@lists.busybox.net>; Tue, 24 Jan 2023 06:53:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D2D7B60BBF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pSagIleT0lyZ for <buildroot@lists.busybox.net>;
 Tue, 24 Jan 2023 06:53:16 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3E98960B49
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3E98960B49
 for <buildroot@buildroot.org>; Tue, 24 Jan 2023 06:53:15 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id DF8FB24000A
 for <buildroot@buildroot.org>; Tue, 24 Jan 2023 06:53:12 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Tue, 24 Jan 2023 06:53:12 -0000
Message-Id: <20230124065318.D2D7B60BBF@smtp3.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1674543193; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=PFHJqpEoIf8zCnKu9uVsvhVdIMZICW0hW6ZZSVOQPDw=;
 b=SbXSYQaTyN+1evaKvgxJEqw5Pr4cqEiXyyuSwjTlizbTxXYzxZzcW+z5rLcT8JuEoUlo+n
 5xG2niO5l3LqyeCbGG/PFLeLqGhgUbfUbinieTKEqSUhfTKVAyW75GNIiZajlrS+UNBh/S
 CmIR4DCKzNcOCzntyUtBylH10+/FusFX8My9ioxqCLK5T7/kfa0bR5MgrqNV4AO45HSPwJ
 La+yzHbc1xQk2X+byiFLl60tTeC2gOPw3WxAftf3JLq5Hj1FINqUB3eIt2/l5wcnR/fm7k
 Uk6QXnmsQSkhP98l5tZRuUzUehOMCCZvOdMZQZzTk9Si9iMtCsRrpaveQ/tCeQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=SbXSYQaT
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-01-23
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

Autobuild statistics for 2023-01-23
===================================

      branch |  OK | NOK | TIM | TOT |
    master   | 102 | 211 |  0  | 313 |

Classification of failures by reason for master
-----------------------------------------------

                   bash-5.2.15 | 20
            host-binutils-2.38 | 11
               host-fwup-1.9.1 | 11
                   linux-6.1.5 | 9 
                    opkg-0.4.5 | 9 
                    bat-0.19.0 | 6 
            python-bunch-1.0.1 | 6 
                    fwup-1.9.1 | 5 
         host-sentry-cli-2.8.0 | 5 
                    norm-1.5.8 | 5 
                  xxhash-0.8.1 | 5 
                     xz-5.2.10 | 5 
                    brltty-6.5 | 4 
glibc-2.36-81-g4f4d7a13edfd... | 4 
                   gvfs-1.48.1 | 4 
                host-go-1.19.5 | 4 
                  jack2-1.9.21 | 4 
               libglib2-2.72.3 | 4 
             fontconfig-2.13.1 | 3 
                gerbera-1.10.0 | 3 
              libgcrypt-1.10.1 | 3 
         mxs-bootlets-10.12.01 | 3 
           python-numpy-1.23.5 | 3 
                  zabbix-5.4.9 | 3 
                    dust-0.8.1 | 2 
                elfutils-0.186 | 2 
            host-binutils-2.39 | 2 
             libgpg-error-1.46 | 2 
        ltp-testsuite-20220930 | 2 
                    pixz-1.0.7 | 2 
toolchain-external-codescap... | 2 
uclibc-ng-test-6790eafe897b... | 2 
               acpica-20220331 | 1 
                  assimp-5.2.5 | 1 
              asterisk-16.29.1 | 1 
                  bind-9.16.33 | 1 
             containerd-1.6.12 | 1 
                 coreutils-9.1 | 1 
                    crun-1.7.2 | 1 
             dahdi-linux-3.2.0 | 1 
                 dhcp-4.4.3-P1 | 1 
                 dmalloc-5.6.5 | 1 
                 fdk-aac-2.0.2 | 1 
                  ffmpeg-4.4.3 | 1 
                    flac-1.4.2 | 1 
                   flann-1.9.2 | 1 
fs/cramfs/cramfs.mk:46: /tm... | 1 
fs/romfs/romfs.mk:32: /tmp/... | 1 
fs/ubi/ubi.mk:51: /home/aut... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /tmp/... | 1 
fs/ubifs/ubifs.mk:49: /tmp/... | 1 
fs/ubifs/ubifs.mk:49: /tmp/... | 1 
  gobject-introspection-1.72.0 | 1 
                   gqrx-2.14.4 | 1 
            host-binutils-2.37 | 1 
         host-gcc-final-11.3.0 | 1 
         host-gcc-final-12.2.0 | 1 
              host-rust-1.66.1 | 1 
              hyperfine-1.14.0 | 1 
                jailhouse-0.12 | 1 
      libabseil-cpp-20220623.1 | 1 
           libfreeimage-3.18.0 | 1 
                libglvnd-1.4.0 | 1 
                   libnss-3.87 | 1 
              libostree-2022.7 | 1 
                libselinux-3.3 | 1 
               lighttpd-1.4.67 | 1 
          linux-5.10.145-cip17 | 1 
                   linux-tools | 1 
            luaossl-20220711-0 | 1 
                  mender-3.4.0 | 1 
                 mesa3d-22.3.3 | 1 
                    musl-1.2.3 | 1 
                 nerdctl-1.0.0 | 1 
                   perl-5.36.0 | 1 
                    php-8.1.14 | 1 
           python-bcrypt-4.0.1 | 1 
    python-cryptography-39.0.0 | 1 
         python-greenlet-2.0.1 | 1 
           python-pyicu-2.10.2 | 1 
ripgrep-af6b6c543b224d348a8... | 1 
                 sudo-1.9.12p2 | 1 
                       unknown | 1 
               valgrind-3.19.0 | 1 
                     zfs-2.1.7 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mips64    |        acpica-20220331         | NOK | http://autobuild.buildroot.net/results/0f9ad39d82c74fa46859b957cb6eba1ef7e2e362 |     
    or1k     |          assimp-5.2.5          | NOK | http://autobuild.buildroot.net/results/2add669af9e17a2a203685094f6c39f0f72d3d28 | ORPH
   mipsel    |        asterisk-16.29.1        | NOK | http://autobuild.buildroot.net/results/979e9d1a8e19d3cb7ca85d238b262ebcb8d59981 |     
   xtensa    |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/526a6945fa08d281ed33111b5797d3e582441cdf | ORPH
powerpc64le  |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/9a66c0c71a0d34921a54ef1359454a94fac8f738 | ORPH
   xtensa    |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/c5eb8fa6d15a79617bdeab1b9bbc4be1e4d835c2 | ORPH
   xtensa    |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/ebb330a59dca6b9896f73cf124508137cc414add | ORPH
    m68k     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/568b6fb875dd6989196544cd88f8431e3fb1e582 | ORPH
    arc      |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/846672c10868dcfbad7b8716739a5d37fe37c5db | ORPH
   arceb     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/7eb7f072133682ad15e3dc5f6c9646a62fb002c2 | ORPH
    arc      |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/ec52ba5aabad05f6517ac99871ef6f8f1642a1da | ORPH
   xtensa    |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/0c0ef8db5558f436d238bc1ce249b24b678720f2 | ORPH
   mipsel    |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/e703f02f818a95ca814f03d68449e340ebe9fdf2 | ORPH
  powerpc    |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/f7e5f45b3dfb62fc06acbc0b1f9f20f9f7f5fd00 | ORPH
    arm      |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/028a39e8b6e1314d16e092cfd80679a497a59cc3 | ORPH
    or1k     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/847930153edb46b816ecce94dbf3fc825b140d84 | ORPH
   sparc     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/b6b81add0d43533c0437711f56a1c441ed2154bd | ORPH
   sparc     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/121d2cf9c5e7f0b2778481bb30334ad2b62d11ca | ORPH
   mipsel    |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/491032f693629624977c8d4acd34865c9833b128 | ORPH
   arceb     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/113db30234908137ee8b9f7e12e73433727c65a4 | ORPH
    or1k     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/582800f689b7c93aadd0e54530ed6310425a2ddf | ORPH
    or1k     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/361f7eeac840ad3bb0ddd8054c491953effbf832 | ORPH
   sh4eb     |          bash-5.2.15           | NOK | http://autobuild.buildroot.net/results/db4ffeeca0700758e4d47051bf4e3bb2f888cd63 | ORPH
powerpc64le  |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/a1e5cece80be90423a74ca903f782d3dbbde7358 |     
   mipsel    |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/44fef59ab30b38886953dc771cea6b6662a96a89 |     
  aarch64    |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/691dce146892c6dbe3c834adbf58bc5a529bf6a1 |     
  sparc64    |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/512df6e7406b0b7af6379267a219b02fc44eb9b8 |     
    mips     |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/3235fb63d39ac72863c56efc1f882ffb0645bdc7 |     
    i686     |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/8ed7826f574630d01d1f35e19fb6ee32ca4513d1 |     
   xtensa    |          bind-9.16.33          | NOK | http://autobuild.buildroot.net/results/b13edf67f1e9db36c376b87a227b885d81b4a9d4 | ORPH
 microblaze  |           brltty-6.5           | NOK | http://autobuild.buildroot.net/results/73993b5a70c7f6380ff92c5a582a076d0f436845 |     
powerpc64le  |           brltty-6.5           | NOK | http://autobuild.buildroot.net/results/a7a30741821c21f74cd635abef4121e0658a2199 |     
powerpc64le  |           brltty-6.5           | NOK | http://autobuild.buildroot.net/results/1fb72c5161d885590a4c297066b5a6412d76956b |     
  aarch64    |           brltty-6.5           | NOK | http://autobuild.buildroot.net/results/4f99928da853ea934aa717a99538eed564badb45 |     
powerpc64le  |       containerd-1.6.12        | NOK | http://autobuild.buildroot.net/results/27601cb13ed583cfa8de98954f03c6dbf7b2bb17 |     
    sh4      |         coreutils-9.1          | NOK | http://autobuild.buildroot.net/results/c08e1408087a3808f6cad5315ad03f4f5f2f9971 | ORPH
    or1k     |           crun-1.7.2           | NOK | http://autobuild.buildroot.net/results/9384d621080940d91dd9ee02908cbfd7861fac0d |     
 powerpc64   |       dahdi-linux-3.2.0        | NOK | http://autobuild.buildroot.net/results/8f234b2257f10cdd6e22819cf5846b7ed8ee11e1 |     
   sh4aeb    |         dhcp-4.4.3-P1          | NOK | http://autobuild.buildroot.net/results/a6c3621d6aa157976f0fb07c1ebed99b0f8dd986 | ORPH
  powerpc    |         dmalloc-5.6.5          | NOK | http://autobuild.buildroot.net/results/eecffc2b016b8ee6d5334942bc3955317fa2446b | ORPH
  sparc64    |           dust-0.8.1           | NOK | http://autobuild.buildroot.net/results/cf4ee7048bac06842be727388b6ffbabe52fa9f2 | ORPH
    mips     |           dust-0.8.1           | NOK | http://autobuild.buildroot.net/results/ab628a287decf13fbaf4b9bd08bd5d23f0762b7a | ORPH
   arceb     |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/7c37ab607aac98bf9c3559ae9334f4504f5447e1 | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/9204879de37c0225fdbfc41fe93ddb1c36115456 | ORPH
   x86_64    |         fdk-aac-2.0.2          | NOK | http://autobuild.buildroot.net/results/f3e74d6a52cc7fd1001abdf4cb657cb0e838e3b6 |     
  aarch64    |          ffmpeg-4.4.3          | NOK | http://autobuild.buildroot.net/results/08f4d3ec3079964a6585a2a2ee2b443e75318ff7 |     
    sh4a     |           flac-1.4.2           | NOK | http://autobuild.buildroot.net/results/1d9ca0e109892334c6db2a5e692a9a423a13fbc3 |     
    mips     |          flann-1.9.2           | NOK | http://autobuild.buildroot.net/results/ba075c611f75d1fee268491a82b01cd82694fb59 |     
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/475a9ac7b787f7fc51042b239a9d0278a071a19a | ORPH
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/3c52c94ea7117acd396db39792db385127206258 | ORPH
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/7c8dc4790ceed699da60a0766397fc0de8ac9e10 | ORPH
    arc      | fs/cramfs/cramfs.mk:46: /tm... | NOK | http://autobuild.buildroot.net/results/d7689ebb6e82a393f65d37ffdbf58ae9625e37d7 |     
    i686     | fs/romfs/romfs.mk:32: /tmp/... | NOK | http://autobuild.buildroot.net/results/c92309bdb4dd81fe9409ad8d257db4a50dd5c249 |     
powerpc64le  | fs/ubi/ubi.mk:51: /home/aut... | NOK | http://autobuild.buildroot.net/results/fa89a13e0fc2edefe67057bd86c489eb122710fd |     
    sh4a     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/22e1db171852b642a0a54b9cc3b070ffcb8efd10 |     
    m68k     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/1e2d3b788147956b8863abd4f1c02f69be048331 |     
   mips64    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/3e0863cd215878c9654e2c7bcb854dcc61e91cff |     
 aarch64_be  | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/0a7c31121f4498a6fe25ac3bb994fbe6afb022d0 |     
   x86_64    | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/f0b19679930077c6ce03fa840feadc824e86d5f2 |     
  sparc64    | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/82adf086a64c09615879c8bd286d15d7f807530c |     
    or1k     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/3615e190c13a65bc38d4410e0d0e126bb43fb2c2 |     
    arc      |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/a671f288306c8a889b58cc0470de44b6992d6426 |     
    sh4a     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/93d6eef97f87135b7019c3cff5899de69d7072ba |     
    arm      |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/f4b71d6b77f0a9cd95b33cdc50a6148cd69fce05 |     
 aarch64_be  |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/1949d8d34b99c37248a80a0598164bd26a3fa56c |     
  aarch64    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/a2c82cfbb84f7223fd915c648c815cace50f92de |     
powerpc64le  |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/2bb5eb7e9cc9ede10239bfc36008844425ff771d |     
    i686     |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/441b5353d138747fa00e26d48ab5a24d352c9002 |     
  powerpc    | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/60e55ea8576bf792c000b256d159e712d579ceff |     
  powerpc    | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/08df568c65c26958212f07d8c59ea1057b9dcd2e |     
powerpc64le  | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/b65b234ecb74526ef13dc782b9e8313bfa2bd474 |     
  powerpc    | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/e8f02e36d1d64876718f1277e79476de6e14d615 |     
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/acbeb46106d1b59896b23a2d910953c328ca17bd | ORPH
   s390x     |          gqrx-2.14.4           | NOK | http://autobuild.buildroot.net/results/9abb6586f5721f3f7a3b0db4da06c135e7c6096c |     
    i686     |          gvfs-1.48.1           | NOK | http://autobuild.buildroot.net/results/7a49f0ee2e71527971469986077893646635873d | ORPH
   s390x     |          gvfs-1.48.1           | NOK | http://autobuild.buildroot.net/results/944f2250edf2a5ad65d935af4779250981ff5472 | ORPH
   xtensa    |          gvfs-1.48.1           | NOK | http://autobuild.buildroot.net/results/96919e03a86ab783c42d28a4181c1945a45f6274 | ORPH
   mips64    |          gvfs-1.48.1           | NOK | http://autobuild.buildroot.net/results/fb2e643a83cb9455609fca5ae25040b467167ab4 | ORPH
   mipsel    |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/1ff6e50092327be16afa47a5f7723f71390b39c2 |     
  riscv32    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/3096f4fe0f2767426c9347eafaa638c51631637d |     
powerpc64le  |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/84286694edc99664996c7556f9458a515dafca41 |     
   mips64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/80e685540ed2f6ffde3c3b49ff12dbf7d1cf2929 |     
  riscv64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/92b336036e2d1902761be6151144c5cef4dea4bc |     
    i686     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/ee416a103872f1ece83f83ee805caf53694a375b |     
    m68k     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/afcc3e7fdc0fde1ea23a0bc48e83c1f992c3ae30 |     
  mips64el   |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/2bb8dd8276cf8bdf06f02e86f5c65bf0671faeb6 |     
   arceb     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/7b36183d69b4f20028c33bd9aafa3c229800a839 |     
    i686     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/6315ed8069b887876575991e952ee62acc28f1ed |     
 microblaze  |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/4ece7164cbea2720becd88ececc069161eec9115 |     
microblazeel |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/9b733edc37b3077ca9fc867e00c454bb009fa277 |     
powerpc64le  |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/5a006c8aa85ba5a79aa5bee53bda52013413ef2b |     
   x86_64    |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/1f0bb4388f6045f9a526a714e975e805f27aae43 |     
   s390x     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/2abaf9416f556adef69d52ef58f50a892ebd7305 |     
  riscv32    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/0a9a4be20b75555a25d676c95642bde5206ca707 |     
   armeb     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/3c87f98037abdf99e0386c4e4e1f9686a23a5074 |     
microblazeel |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/e1558ccfa1241b8416f231148c0fd7626c0ef340 |     
    mips     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/cc5b396dc757d8c19e9103ac3c0e0623e4145406 |     
  riscv64    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/0011917a8b280539e9023d108296b8e35cce26ff |     
  mips64el   |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/2450032718ea79c3c258dcc5b2b7f54097c06d7c |     
 aarch64_be  |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/021afd1c4489b9372cd6f13d2ad4b4572bef6310 |     
   mips64    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/a1001597f60b740236a4d4b9b4e5789f57f7f07d |     
    arc      |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/e9ef62ce87acdb2ed8878208be901f7372b4b35c |     
  sparc64    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/df2acc2be6e03eb1b7c431a193e0ff6638833f8d |     
microblazeel |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/83f9b93da2ebc60dc74c9a8381cf8f0833ac57f8 |     
    arm      |     host-gcc-final-12.2.0      | NOK | http://autobuild.buildroot.net/results/de8b5b7651dec87774980799541028cc489c4f27 |     
  aarch64    |         host-go-1.19.5         | NOK | http://autobuild.buildroot.net/results/7bbbad5257d8cd2e164a6f249f2d12be7a0e1fde |     
    i686     |         host-go-1.19.5         | NOK | http://autobuild.buildroot.net/results/f9825d67f132d7a19d3375ff5f6460af636f715f |     
  mips64el   |         host-go-1.19.5         | NOK | http://autobuild.buildroot.net/results/fc25c8505ef82b844d6637b7ac00dd05750e6dc4 |     
   mips64    |         host-go-1.19.5         | NOK | http://autobuild.buildroot.net/results/92e077a5549cca71df46f9f3aeddf0aa5f815ab1 |     
   x86_64    |        host-rust-1.66.1        | NOK | http://autobuild.buildroot.net/results/a097836160efb1499dae3c7ae2d4b3f58865688f |     
   mips64    |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/e36bebdb52b172235ba0a32898797e00bd17603f |     
    or1k     |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/2291e9b6b8de9c6ec5f9718895ed990d90b6332c |     
    arc      |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/a41ba80c26515be374f27c6eb2cc1cf7924a2a4b |     
  powerpc    |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/0417ea47332f9e07d2c6cf430889c5fb8a6da7fe |     
   armeb     |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/4bc62ab581d51652c43329e3bd8b67f41d010eca |     
  sparc64    |        hyperfine-1.14.0        | NOK | http://autobuild.buildroot.net/results/092f57365c433d387195a9e74925610c3c4e9a1d | ORPH
 aarch64_be  |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/1cc9a3cabc8bafe4c19a7487106f039628dede4d |     
powerpc64le  |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/27c769f9114336a98d32048638bc98b9539c8b9a |     
    m68k     |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/fa0e995c7e951392667dbf9044f9d7ce208d6ca9 |     
   s390x     |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/b90a15210a05a2e269ac700b8a718240d7172862 |     
  aarch64    |         jailhouse-0.12         | NOK | http://autobuild.buildroot.net/results/0512a253c65a8b365d0dd06af26389272136b1cf |     
  mips64el   |    libabseil-cpp-20220623.1    | NOK | http://autobuild.buildroot.net/results/8245b186375ff72a9ef9d9db7672e34bfd2279f4 |     
microblazeel |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/57211be80c0600e9dd362614a73c7879bde2660a |     
   armeb     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/b398b9cf69b8da830e04e0e33ae3245b01654395 | ORPH
   armeb     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/ddc01fd29879dac3739216f6187c3de3569df42a | ORPH
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/de14b9df914bc7b2f1647151a578600f44765620 | ORPH
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/6a3a36dc49e172204660e6222f4ea37e73d00128 |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/a7f1815b7d96fe5c9e5e741351cc49b117001f85 |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/91b30bfc37ebe52856179a4bfafc065115d0645b |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/87e186bb89530dfd3dbeef6ce0fb489c3dcd00ef |     
    m68k     |         libglvnd-1.4.0         | NOK | http://autobuild.buildroot.net/results/2884b4d7f76ecdb3a950ee9c4e7b5261c0f98462 | ORPH
  aarch64    |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/333aa02fc918c925cb573bf5c758e59981807bff | ORPH
  aarch64    |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/416c1aacb562bed3f2bb3c569a19792dc88c5ae5 | ORPH
  powerpc    |          libnss-3.87           | NOK | http://autobuild.buildroot.net/results/db42e8eb8b1428ab78dcbf0d491ac57b55580d5b |     
   s390x     |        libostree-2022.7        | NOK | http://autobuild.buildroot.net/results/e5042660a88bbbd35e1bc7ff962d7870118028d1 |     
    or1k     |         libselinux-3.3         | NOK | http://autobuild.buildroot.net/results/1f5badbea810770609e9f67e82a8cb7cd9b0da60 |     
   arceb     |        lighttpd-1.4.67         | NOK | http://autobuild.buildroot.net/results/ce7ac2521c02e74b4872192c56ddaf7b465bf1f7 |     
    arm      |      linux-5.10.145-cip17      | NOK | http://autobuild.buildroot.net/results/675a0a2e2d2ce4b34e19d9c9a060200622b2a6bb | ORPH
    i686     |          linux-6.1.5           | NOK | http://autobuild.buildroot.net/results/77a473ab6ac9e2abb538f5450b56b1aad734a310 | ORPH
    mips     |          linux-6.1.5           | NOK | http://autobuild.buildroot.net/results/cccb57b8c0c88061d8b0ce1735232018215991a0 | ORPH
  mips64el   |          linux-6.1.5           | NOK | http://autobuild.buildroot.net/results/db18edea072e88e5bba757b3056af69d4e04d550 | ORPH
   mips64    |          linux-6.1.5           | NOK | http://autobuild.buildroot.net/results/c59356eb5bfc39128a75f0dfcddf4b9201244894 | ORPH
  mips64el   |          linux-6.1.5           | NOK | http://autobuild.buildroot.net/results/397fc5d3b72f7f331c8396e828a57f23d4d34ba2 | ORPH
   sh4eb     |          linux-6.1.5           | NOK | http://autobuild.buildroot.net/results/5e9ab3cd074e39debc669d9ad578cb09f84e8222 | ORPH
   mipsel    |          linux-6.1.5           | NOK | http://autobuild.buildroot.net/results/f2e7219cbd71c2444ce5997a83523113911ca68a | ORPH
    m68k     |          linux-6.1.5           | NOK | http://autobuild.buildroot.net/results/513b355f8e4b2e751bb9de2946b5b85ea72c9675 | ORPH
  mips64el   |          linux-6.1.5           | NOK | http://autobuild.buildroot.net/results/fd5e67dd2cd168c9432c06c445bfd1e5216bd32c | ORPH
 powerpc64   |          linux-tools           | NOK | http://autobuild.buildroot.net/results/5523f3a18cd443bcf73fa716973cd2f343157998 | ORPH
    i486     |     ltp-testsuite-20220930     | NOK | http://autobuild.buildroot.net/results/5bb68a37c2e0b8ffe9e2d110913424605bb59ac1 |     
 powerpc64   |     ltp-testsuite-20220930     | NOK | http://autobuild.buildroot.net/results/823a7b459e3204389ebfc0fe9bccbc18d666e8b7 |     
   sh4aeb    |       luaossl-20220711-0       | NOK | http://autobuild.buildroot.net/results/d061840f1924b83ff78d2f67f05a7de44fdd5f87 |     
   x86_64    |          mender-3.4.0          | NOK | http://autobuild.buildroot.net/results/85283280018795a50f8570a515a0771095ba7879 |     
    i686     |         mesa3d-22.3.3          | NOK | http://autobuild.buildroot.net/results/e0291f38eedee92912545d42a195e47548528393 |     
  powerpc    |           musl-1.2.3           | NOK | http://autobuild.buildroot.net/results/3774c47eaee3b0fde77e471a82556ce966b41fb4 |     
    arm      |     mxs-bootlets-10.12.01      | NOK | http://autobuild.buildroot.net/results/3ec0089f6e474e6ebb864deddb5c69f9d553dea2 | ORPH
    arm      |     mxs-bootlets-10.12.01      | NOK | http://autobuild.buildroot.net/results/0027e5ab14273f298ac0257c6752d25d8e95e7ec | ORPH
    arm      |     mxs-bootlets-10.12.01      | NOK | http://autobuild.buildroot.net/results/3ff36b43cfaca9d9cbba5dccdaf2d8249ce31d52 | ORPH
powerpc64le  |         nerdctl-1.0.0          | NOK | http://autobuild.buildroot.net/results/8334feae309d5401f3ebe0b50af8b65eb2e89e49 |     
   arceb     |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/c1094d1acb4535b1796f8d843cf3f233851937d3 | ORPH
   s390x     |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/3366265caaa6eb5afce3cb7dc5fa6a88953164cd | ORPH
powerpc64le  |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/0780b7b0b61c0cd3bbf3c77b315899c4b809df07 | ORPH
   mips64    |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/b3b03b82832cd1524be250c903c0a4f5b23ce8ee | ORPH
powerpc64le  |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/b6d4e0c45b6532874c46548c557f1c732dcf59ca | ORPH
    i686     |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/6dc3fcf1b06f47f876ff86a3e6ad5bd362ea5554 | ORPH
 microblaze  |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/de2043790a7524e9faf8177c69b8b961ee3444b2 | ORPH
    arm      |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/a1eabc5d4932661eb0c9cb58fa332538ceb76332 | ORPH
powerpc64le  |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/b18aaf4fc05ba15cd183aecb43b9ce326f610110 | ORPH
  aarch64    |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/fce31569da8858dbd860a0a9a0544244f41234f3 | ORPH
   nios2     |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/65d3f210a218a74b2ab3f4f26b8a1c87bdf916ad | ORPH
microblazeel |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/2e9c23086e433eef9234294d3ef58015c308b8e7 | ORPH
  powerpc    |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/fcfff14b847f9d0a98a8b5b07f41ec24854eded4 | ORPH
  mips64el   |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/7693de3c255ab756e977ace481ae2d1e33e0e9b7 | ORPH
  sparc64    |          perl-5.36.0           | NOK | http://autobuild.buildroot.net/results/40525f7719d2816a6f44f9b21d2fbda5addae49e |     
microblazeel |           php-8.1.14           | NOK | http://autobuild.buildroot.net/results/6d36ed233ad12d9ea928217bddeb3c1369a5bf6f |     
   x86_64    |           pixz-1.0.7           | NOK | http://autobuild.buildroot.net/results/a87cc93ff4a8d81accbb0403eb351083edd75aad |     
    arm      |           pixz-1.0.7           | NOK | http://autobuild.buildroot.net/results/d4da54722c456f3554ec9ffa826296cd3d356c22 |     
   s390x     |      python-bcrypt-4.0.1       | NOK | http://autobuild.buildroot.net/results/c843fe80347a586f44a53ff58e0d53c351506d36 |     
powerpc64le  |       python-bunch-1.0.1       | NOK | http://autobuild.buildroot.net/results/81812e01419270763f48387346d4cff41e7ccb2f |     
  mips64el   |       python-bunch-1.0.1       | NOK | http://autobuild.buildroot.net/results/391790fa2a2cee6c07678be6525fead062abc42b |     
 aarch64_be  |       python-bunch-1.0.1       | NOK | http://autobuild.buildroot.net/results/765a4dc9f7c000ecd05a391a4c3ef654c4c2ea17 |     
 microblaze  |       python-bunch-1.0.1       | NOK | http://autobuild.buildroot.net/results/f44e8ad01baff9585a199159355f22643118cff2 |     
   nios2     |       python-bunch-1.0.1       | NOK | http://autobuild.buildroot.net/results/82d633a60de987bbbbf057e383bdaebdea6a2844 |     
    i686     |       python-bunch-1.0.1       | NOK | http://autobuild.buildroot.net/results/488f1659af7f5293ef8e37dc9857cc9ad0bcbd04 |     
 powerpc64   |   python-cryptography-39.0.0   | NOK | http://autobuild.buildroot.net/results/0bf8e7495bd8f689e5c69ad7339f610ea165c5d6 |     
  sparc64    |     python-greenlet-2.0.1      | NOK | http://autobuild.buildroot.net/results/5291fe0fac1d5c7b6587e4a566991a764a2632fb |     
   x86_64    |      python-numpy-1.23.5       | NOK | http://autobuild.buildroot.net/results/377a3a698a0fdc3e852ad2d321ffa85f2d7b9d71 |     
 powerpc64   |      python-numpy-1.23.5       | NOK | http://autobuild.buildroot.net/results/93c2485ae523c5a5fc6ddf184640343ac1675b8b |     
   mipsel    |      python-numpy-1.23.5       | NOK | http://autobuild.buildroot.net/results/ee50b274dc79a3943e2a92d074bce979634ce3dc |     
microblazeel |      python-pyicu-2.10.2       | NOK | http://autobuild.buildroot.net/results/0a7e767876de49a0e68a274363b8932c3e26d786 |     
  aarch64    | ripgrep-af6b6c543b224d348a8... | NOK | http://autobuild.buildroot.net/results/4b578d2fcdfbcb8bf1d95aa36e8b7b119097b141 |     
    or1k     |         sudo-1.9.12p2          | NOK | http://autobuild.buildroot.net/results/9c42ff9e40680ed6227dfd804794e4b6377aec97 | ORPH
  mips64el   | toolchain-external-codescap... | NOK | http://autobuild.buildroot.net/results/1d51b820472e235012ccf85d669897883fab7a6b | ORPH
   mipsel    | toolchain-external-codescap... | NOK | http://autobuild.buildroot.net/results/dfd55240e4e58a7cfee7a495181f448238ad6d68 | ORPH
   armeb     | uclibc-ng-test-6790eafe897b... | NOK | http://autobuild.buildroot.net/results/c78cdcb48a1a5e6c8c3444d9ea111746519bcab1 |     
   mips64    | uclibc-ng-test-6790eafe897b... | NOK | http://autobuild.buildroot.net/results/5b4892c60c3631d13c80b65f775845ec14dcd739 |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/1daff6b25417f9aea6511ad0bc93828dd9173ff5 |     
  mips64el   |        valgrind-3.19.0         | NOK | http://autobuild.buildroot.net/results/b049c9dc1e9f33bf878c6a55750358dba9380e16 | ORPH
    or1k     |          xxhash-0.8.1          | NOK | http://autobuild.buildroot.net/results/c8abd6e2cffd7a80e0fda31f67f5df7968764b47 | ORPH
 aarch64_be  |          xxhash-0.8.1          | NOK | http://autobuild.buildroot.net/results/32f55ea477cf13875413c08de981bcb9c4e139fc | ORPH
 aarch64_be  |          xxhash-0.8.1          | NOK | http://autobuild.buildroot.net/results/1effbb3c3f0bfe9f8378ca667c885ab95f5d7659 | ORPH
microblazeel |          xxhash-0.8.1          | NOK | http://autobuild.buildroot.net/results/b4119c8d61af44e93f2e63e32e555ddf5be2a970 | ORPH
   mips64    |          xxhash-0.8.1          | NOK | http://autobuild.buildroot.net/results/faf8b453addcb0c032c81342ba65ccd59083d2da | ORPH
microblazeel |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/0cade4cabf6e6b2364a14204a510a77ec3eaf1e6 | ORPH
microblazeel |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/cc8f9731f3b20501d1981fdc48d5ac9024984cf0 | ORPH
microblazeel |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/6b57acb40a64caaa41cb50f21ee18f5e986d59c2 | ORPH
 microblaze  |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/952c600d661404e831063bde2528657c2a8af807 | ORPH
 microblaze  |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/95a5e96cba7c4f8959c5da87965e637366796728 | ORPH
  aarch64    |          zabbix-5.4.9          | NOK | http://autobuild.buildroot.net/results/4d0914fe4885e3e92a1f6b0181b9ce9c58940685 |     
   nios2     |          zabbix-5.4.9          | NOK | http://autobuild.buildroot.net/results/cd24ae8f717fc59e6814c676803df703e9f6b2b6 |     
    or1k     |          zabbix-5.4.9          | NOK | http://autobuild.buildroot.net/results/d490cba7ca9b3cfd4eadc3662ce0ba11cda9dd81 |     
   armeb     |           zfs-2.1.7            | NOK | http://autobuild.buildroot.net/results/465a249f92d2f5db7ac4b61b4111e6cbaaa15688 |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
