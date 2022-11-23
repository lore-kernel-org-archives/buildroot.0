Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1520C4332F
	for <buildroot@archiver.kernel.org>; Wed, 23 Nov 2022 07:35:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 39C8560B05;
	Wed, 23 Nov 2022 07:35:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 39C8560B05
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CMRaKB6udUqO; Wed, 23 Nov 2022 07:35:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3DC5760B31;
	Wed, 23 Nov 2022 07:35:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3DC5760B31
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7FFB61BF3FD
 for <buildroot@lists.busybox.net>; Wed, 23 Nov 2022 07:35:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 446F14056A
 for <buildroot@lists.busybox.net>; Wed, 23 Nov 2022 07:35:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 446F14056A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JY3b7pC1xXR7 for <buildroot@lists.busybox.net>;
 Wed, 23 Nov 2022 07:35:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 404D1400DB
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 404D1400DB
 for <buildroot@buildroot.org>; Wed, 23 Nov 2022 07:35:46 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 758AB6000B
 for <buildroot@buildroot.org>; Wed, 23 Nov 2022 07:35:43 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Wed, 23 Nov 2022 07:35:43 -0000
Message-Id: <20221123073549.446F14056A@smtp2.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1669188943; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Ooq0NvA0Fz2Xv26o0ANriWWEM+xTESf/z86f5WQbUdY=;
 b=fmkqLC48couPY2KmCm3UBXXAbL1W6nmIAdT/glPn9N7OA5wS/3iK7IjNbIduHI6eKMLog/
 u6SRHZZRUmm/eILitfFloSkqlT01g9BlzX8MKmqUMDPIiDt4oWqCvBb2e8Y57zKHnCcg0L
 n97IiGg0lh7bv7Qpt1BsYisJ1SOKC1xI7xC5JgOVNa9jjCQ4XRLUNrXWH6dN/RaW0K/m2Z
 M8MSmnoD8UehV7GZmVe8uXslvMKpghBKZxTtzElwe5FMCcj6CYbDy5sWGbOs8akx0qpOuW
 fFlexwEc3cgtqhA68FIVfNaAE3gSuuY2/ibDpo1SPvHv2tqu+zFAepLmayKFOQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=fmkqLC48
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-11-22
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

Autobuild statistics for 2022-11-22
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  |  1  |  0  |  0  |  1  |
  2022.08.x  | 21  | 20  |  0  | 41  |
    master   | 193 | 199 |  0  | 392 |
     next    |  9  | 16  |  0  | 25  |

Classification of failures by reason for master
-----------------------------------------------

glibc-2.36-66-ga1dc0be03c9d... | 11
  gobject-introspection-1.72.0 | 9 
                host-go-1.19.3 | 8 
              host-pahole-1.24 | 8 
                   linux-6.0.1 | 8 
                      xz-5.2.7 | 8 
                 dash-0.5.11.5 | 7 
            host-binutils-2.38 | 7 
           python-numpy-1.23.4 | 7 
                gerbera-1.10.0 | 5 
                elfutils-0.186 | 4 
                tealdeer-1.6.1 | 4 
                    bat-0.19.0 | 3 
              libgcrypt-1.10.1 | 3 
               libglib2-2.72.3 | 3 
             lirc-tools-0.10.2 | 3 
rtl8192eu-1e15b6d451731bc4d... | 3 
              asterisk-16.28.0 | 2 
                  boost-1.80.0 | 2 
                    brltty-6.5 | 2 
       freeradius-client-1.1.7 | 2 
                     frr-8.3.1 | 2 
              host-rust-1.64.0 | 2 
                   libnss-3.84 | 2 
                linuxptp-3.1.1 | 2 
              liquid-dsp-1.4.0 | 2 
                    musl-1.2.3 | 2 
                tinifier-3.4.0 | 2 
ulog-0389d243352255f6182326... | 2 
                       unknown | 2 
               valgrind-3.19.0 | 2 
                 wolfssl-5.5.3 | 2 
                  zabbix-5.4.9 | 2 
/home/buildroot/autobuild/i... | 1 
                     ace-7.0.6 | 1 
                  assimp-5.2.5 | 1 
                  bind-9.16.33 | 1 
  binutils-arc-2020.09-release | 1 
                  cmocka-1.1.5 | 1 
              containerd-1.6.8 | 1 
                 coremark-1.01 | 1 
                 coreutils-9.1 | 1 
                      crun-1.5 | 1 
             dahdi-linux-3.2.0 | 1 
                 dmalloc-5.6.5 | 1 
docker-proxy-f6ccccb1c082a4... | 1 
                     exim-4.96 | 1 
                 fdk-aac-2.0.2 | 1 
                     file-5.43 | 1 
             fontconfig-2.13.1 | 1 
       freeradius-server-3.2.0 | 1 
fs/romfs/romfs.mk:32: /home... | 1 
fs/romfs/romfs.mk:32: /tmp/... | 1 
fs/ubi/ubi.mk:51: /tmp/inst... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /tmp/... | 1 
fs/ubifs/ubifs.mk:49: /tmp/... | 1 
fs/ubifs/ubifs.mk:49: /tmp/... | 1 
fs/ubifs/ubifs.mk:49: /tmp/... | 1 
                     gmp-6.2.1 | 1 
                gnu-efi-3.0.15 | 1 
gummiboot-2bcd919c681c952eb... | 1 
            host-binutils-2.37 | 1 
            host-binutils-2.39 | 1 
host-spirv-llvm-translator-... | 1 
               ipmitool-1_8_19 | 1 
                  kexec-2.0.25 | 1 
                  libsepol-3.3 | 1 
                 libuwsc-3.3.5 | 1 
          linux-5.10.145-cip17 | 1 
      linux-5.10.145-cip17-rt7 | 1 
            linux-fusion-9.0.3 | 1 
            lttng-tools-2.13.2 | 1 
                     lxc-5.0.1 | 1 
                  matio-1.5.23 | 1 
              memcached-1.6.16 | 1 
                  mender-3.4.0 | 1 
         mxs-bootlets-10.12.01 | 1 
             netsniff-ng-0.6.8 | 1 
                nodejs-16.18.1 | 1 
                  ntp-4.2.8p15 | 1 
                    owfs-3.2p4 | 1 
package/qt6/qt6base/qt6base... | 1 
                   perl-5.34.1 | 1 
           proxychains-ng-4.16 | 1 
                     pv-1.6.20 | 1 
    python-cryptography-38.0.1 | 1 
                    rtty-7.4.0 | 1 
                 snmppp-3.4.10 | 1 
                 sudo-1.9.11p2 | 1 
toolchain-external-codescap... | 1 
uclibc-ng-test-6790eafe897b... | 1 
                     vdr-2.6.1 | 1 
                    volk-2.5.2 | 1 
               xapp_xdm-1.1.13 | 1 
                xenomai-3.0.10 | 1 
               xfsprogs-5.14.2 | 1 
                  xvisor-0.3.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 aarch64_be  | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/f42777f2b1b2b3ca851c624ae063d7e4e4f657b3 |     
powerpc64le  |           ace-7.0.6            | NOK | http://autobuild.buildroot.net/results/932b732a116e57f7d6bf7cb80034f498a7737534 |     
    arm      |          assimp-5.2.5          | NOK | http://autobuild.buildroot.net/results/1da354b04a54d54aa54b9b3d0ef8e2f963359066 | ORPH
    i586     |        asterisk-16.28.0        | NOK | http://autobuild.buildroot.net/results/322d0739729642b5e2e81c0502f03ee702428ca3 |     
   arceb     |        asterisk-16.28.0        | NOK | http://autobuild.buildroot.net/results/bd5b6394cfb84986b84f7b55fb2c6103edfd644b |     
   armeb     |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/25a2045a803bf2d3bd6905d0a264e733eabfa766 |     
    arm      |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/ba8a451782a019c86fd809693333b91e3ff457b0 |     
   armeb     |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/68b0ad52bcdc3c2c020810bd5bbc618bc7e77bc4 |     
    sh4      |          bind-9.16.33          | NOK | http://autobuild.buildroot.net/results/4738c001c20526372da3ca9d73af191bc276df36 | ORPH
    arc      |  binutils-arc-2020.09-release  | NOK | http://autobuild.buildroot.net/results/d8bb1a3211f028c49e0de303d28104e07dc1c690 |     
    arc      |          boost-1.80.0          | NOK | http://autobuild.buildroot.net/results/7af638dc81d40c5726e0c6a2eec9d9e4f0084229 |     
   arceb     |          boost-1.80.0          | NOK | http://autobuild.buildroot.net/results/6b043c6ca7628b373757e6d5dee0d230f54ae81e |     
powerpc64le  |           brltty-6.5           | NOK | http://autobuild.buildroot.net/results/9e49d3b270526c863b118aa2cd297e4622ddccab |     
    mips     |           brltty-6.5           | NOK | http://autobuild.buildroot.net/results/1806de278d2ca69164a3339e9456cb8a9bb1692d |     
   armeb     |          cmocka-1.1.5          | NOK | http://autobuild.buildroot.net/results/726174b154abda24284df1d1dcd1d82ddbbaf09f |     
   x86_64    |        containerd-1.6.8        | NOK | http://autobuild.buildroot.net/results/020d93f1a65912d7fefd5db820677a598ff4c39b |     
   armeb     |         coremark-1.01          | NOK | http://autobuild.buildroot.net/results/0412cf09f3a1f0027cd0cde2c0c1337fa45971ed |     
   sh4aeb    |         coreutils-9.1          | NOK | http://autobuild.buildroot.net/results/ee91d5bd13b6c5938fc25dadcfde4c75189ade23 | ORPH
    i686     |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/e80c3743b8345440b8009beee8eed06443edfe58 |     
    i686     |       dahdi-linux-3.2.0        | NOK | http://autobuild.buildroot.net/results/546f77261fbd17ee56bba99c3655d607d1750d3d |     
   x86_64    |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/3cf82b18a9015d87cc32915af9b58e0e5c59049f | ORPH
   s390x     |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/9ccad5089f626dfc8cc0759fa1c8bdfc5c9d5fb9 | ORPH
  mips64el   |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/91cdadb385458440e8e26071bb039d0f5f0e7157 | ORPH
   armeb     |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/c61f087d23d89b8e255d2b2df4c94c50cf7c7685 | ORPH
   nios2     |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/257ff51a7912bb72731a0928a29df251b0ae5c30 | ORPH
    mips     |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/53fae4e01d75df17b7545138dab8b8c0448e6839 | ORPH
   sh4eb     |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/b20df1ef4b22d9719fd382cde53e9ffa13bda57a | ORPH
  powerpc    |         dmalloc-5.6.5          | NOK | http://autobuild.buildroot.net/results/33bd6f5c9e970bedb14dbbb7217181b1d1a2c2db | ORPH
   x86_64    | docker-proxy-f6ccccb1c082a4... | NOK | http://autobuild.buildroot.net/results/b3e24b824552b4c01217eb0780dff5935ad26637 |     
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/65440ebaf1237ade7dfd37fe85199d0dc9c379a2 | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/58cee3cf35b3557fd169c9fd2b6ec55ef81edfd3 | ORPH
    arc      |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/4e49dfc9640aa718314f7f0993893d0d92c54772 | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/311b1297f8dadc3af45dc067051008c29bba64ec | ORPH
    arm      |           exim-4.96            | NOK | http://autobuild.buildroot.net/results/b522fddb3c653afab3ab2a5d0a224c62ca2b6161 |     
    mips     |         fdk-aac-2.0.2          | NOK | http://autobuild.buildroot.net/results/cb94304845bd820b984acc791fc2aae542f205eb |     
    i686     |           file-5.43            | NOK | http://autobuild.buildroot.net/results/3b5fa70cb530461d1c182a2b5a658c1074a34907 | ORPH
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/60919a7e71326da591c2a695df3c0cdbadd4c446 | ORPH
  riscv64    |    freeradius-client-1.1.7     | NOK | http://autobuild.buildroot.net/results/e0862dae209dc683a964ff464ec363e73b8e7e06 |     
  riscv64    |    freeradius-client-1.1.7     | NOK | http://autobuild.buildroot.net/results/838146fbe9a3ebbe38e7067017e322f300383205 |     
 microblaze  |    freeradius-server-3.2.0     | NOK | http://autobuild.buildroot.net/results/568d4bc80d4c4563c17f8bfde309c83599d89f55 |     
   xtensa    |           frr-8.3.1            | NOK | http://autobuild.buildroot.net/results/d8bde67b45c079007d71e716d7289f159e9edd3e |     
   xtensa    |           frr-8.3.1            | NOK | http://autobuild.buildroot.net/results/1f20c4bde1126a771e6aed73d8ad1108eafaa960 |     
   mipsel    | fs/romfs/romfs.mk:32: /home... | NOK | http://autobuild.buildroot.net/results/9bb2f48ad42e8ea63af3ca80af2c55e94613ed08 |     
  sparc64    | fs/romfs/romfs.mk:32: /tmp/... | NOK | http://autobuild.buildroot.net/results/9e71690bb14105fb528771a70f38b5d68709eab7 |     
 powerpc64   | fs/ubi/ubi.mk:51: /tmp/inst... | NOK | http://autobuild.buildroot.net/results/e42216cb77c55cc1d66b09d8cbfad882dc9bf0bb |     
  aarch64    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/7361aa403466a203aa2ffff1e5537cb2b6a2ef1b |     
   x86_64    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/27d1d63403eba0137698c29389f00e2f90a867ca |     
   sparc     | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/36a3b060f987141b855295f3c098f003c793b13f |     
   sh4aeb    | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/836991d99218b0cc8453fa380e8ef22387d04c98 |     
  sparc64    | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/1ee1cdc0a4948008b27b138b93afb9addd5dd770 |     
   nios2     | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/30ecba930fd7b40e7afaea58ee09c176498e6755 |     
   sparc     |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/05a276eb86bcbe7928ce3256eba45d480c4ad447 |     
    i686     |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/db6cfc067211f46206e529bea187a0308f16191e |     
  riscv32    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/29a90b16d45c6229b04d01f80a0f4a5c6c1f726d |     
  sparc64    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/1de1a65ad0a0c54fd8b18fe59a6f2bb0a2cfecf7 |     
    mips     |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/97ca1cd1527591a75fd43dfc3f17184019abc88e |     
  powerpc    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/f0bd24f2852c654c82258d3d5345832fb5d544c8 |     
  powerpc    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/4b84e5cc34ff51b2e621bbb873983d9c76a633ab |     
   arceb     | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/a9104ec6286697a9abc55f7a0f1730f3f4d3ecc7 |     
  powerpc    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/723890014667b924e3957b3a7879d3ef9f6c1def |     
microblazeel | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/850c10190faf0e8dde93ce1550a1076b25d0fb03 |     
  powerpc    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/4d4b1589695b12ca27e94c6064ddf6a5f8f30601 |     
  powerpc    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/1f8981d0983e65fd51d5c391ea40d2a560842a0f |     
  powerpc    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/eb7a653a94c1e5006ef85515fe90c98411f5fd1d |     
    mips     | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/890568d3d47586fff5483429dd0c832dd309147f |     
   nios2     | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/2dd01fdac4f4174a3e1f4a417fd1e33bbbd424b0 |     
  powerpc    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/a8fd94e97b67b046a1a4acaa354d14b4ee8c1a36 |     
  riscv64    |           gmp-6.2.1            | NOK | http://autobuild.buildroot.net/results/4abcfc0a348e1158b64d871e61fc6430698ad0d1 | ORPH
  mips64el   |         gnu-efi-3.0.15         | NOK | http://autobuild.buildroot.net/results/f258aeaf6d0befe1df9ea0fa9ce1cac298632e4c |     
    i686     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/911f5ef37ef360c0cbebdb683cf8b41afc8ab8d6 | ORPH
    i686     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/672b0d25c031d7752da5460638a8cb86b958528e | ORPH
    or1k     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/da5dd0f3c537219dc08b3ad9375041672d578bcf | ORPH
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/6342af4f60e65ac29e0bae89222ccc0c11c08722 | ORPH
 powerpc64   |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/87a884feb090155c5fa1abffbd879191cecd2306 | ORPH
microblazeel |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/9b30108c72faa1dd8816670ffd1e1ef84943a283 | ORPH
   x86_64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/408f119ac29d760f2dd0352d34ced88954028781 | ORPH
    or1k     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/c18524130bf99931de390ffa46cb37fa7229ffd8 | ORPH
   s390x     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/5e28617bf3c736a5bd307e34535d469fea1e1bdf | ORPH
    i686     | gummiboot-2bcd919c681c952eb... | NOK | http://autobuild.buildroot.net/results/bb1760f6a80bbe5ae47ad9237fff99cd5a4db78b |     
  sparc64    |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/436ad2ea79f1a04beb22548a1dde085500c08280 |     
   xtensa    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/483cb1900bf25a4ffa6e8bd3df6700bf0f3bd46c |     
 microblaze  |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/b545cf0da7412858e0dc95194cfeb7f32487fae5 |     
    mips     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/f2ebea5ed5e9633e451b931e4c228d6e5307cd6d |     
   s390x     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/79d447abd57ce6668af5914a5af0f3e99879d2bf |     
   armeb     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/eb162c2ba9808fbf53ca4bf2311aac70cb7a60c4 |     
    i686     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/c6daca324bd5e5d415ee33bcfde92eb5b8614592 |     
   nios2     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/aeb99d5dd91e2275f3ce6830a520c908d4a2ddfd |     
   s390x     |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/ad3de5451d57fe07cf109d54758001b0d13107bf |     
   mips64    |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/fc5661fe3ecf46ae6518c684e79c0786ec13354e |     
  mips64el   |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/05321b686ab44259839cb3150dab0a435bb2e85e |     
   mips64    |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/d2a1af5e6d62632b220b247ebf09b43a0b2e5921 |     
  riscv64    |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/682772908fb60d4f488da46ff083c0f5f877617c |     
  mips64el   |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/007e59ef2a22fb30874af793983457f13d74d92d |     
   mips64    |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/afafbffc91327ee6311cc7685763026fd938a670 |     
    i686     |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/82aeea1ab66475193e565b12f3fe8429fdd5d67e |     
   mips64    |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/3aa9c9d89533adcaf30a0d1b753e23e1da8a35be |     
   armeb     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/edfb6c8500f60c094be4e7c4c3fef418363edf84 |     
   mips64    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/d3e0efeadf688d860170d4886513d614c017b1ea |     
    arm      |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/9294e1ac55f4247e217aa04f1255acc68d7ff264 |     
  sparc64    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/92d744e3ff8eef6051babe99804bb7a880e20a20 |     
   mipsel    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/10929b08a81ea0d346e04e3cced5d34f77c1d5d8 |     
  powerpc    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/a95cd20a209a274eeebf70cafc00f0cf21e68942 |     
   arceb     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/e3400286b8349a02bba77fe239ae2eb152573a43 |     
  aarch64    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/e0e93a4da355f106aac0ca63057de8dcdc0ace3c |     
powerpc64le  |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/2d70624a8da1dcbab71f839384f61608e6c0cd70 |     
powerpc64le  |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/48d03e1b0b38bd643b588df3b4ef89178b358d7a |     
    arm      | host-spirv-llvm-translator-... | NOK | http://autobuild.buildroot.net/results/3f04b69e0d068f9a42844b1a0c7ad44c3fb60f40 | ORPH
    or1k     |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.net/results/ede9de898a80e99808df16fdd3940d535cfef724 |     
   armeb     |          kexec-2.0.25          | NOK | http://autobuild.buildroot.net/results/f8238bd78c2d1fbc3fa7ff34f9af1c4804e1dc4e | ORPH
   armeb     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/2092a570ce2522f1dfb32385fb367ced7c16e5ec | ORPH
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/68dba26a2d00e443ea976ceb98d6f56326a1bd92 | ORPH
    arm      |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/4d34af6d82ada5b71b093adf8d944f7b7cf7336f | ORPH
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/3678560d5f76765c22a0c9fb46d559d2c61d3da5 |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/6c2d42a000a846299f2e14df87d2ac1330070d13 |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/b90dcb52f8abcbaf361ab11c42883ffe0c6c393e |     
   s390x     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/65f219c5b17a7ded1dcb6b72fa869b3f6ef2f0d1 |     
    i686     |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/be0b05bbe37cb1950248072d2636f1bc1186fd7c |     
  mips64el   |          libsepol-3.3          | NOK | http://autobuild.buildroot.net/results/06d5a34cf5d91d4702b8f89a40d556d7897a823c |     
 aarch64_be  |         libuwsc-3.3.5          | NOK | http://autobuild.buildroot.net/results/4e8c3b0d02b46fb0161559f97102a0715d8ebcd6 |     
    m68k     |      linux-5.10.145-cip17      | NOK | http://autobuild.buildroot.net/results/f56257f33cb5b54e8ec6940e76d5c48c035b5dc0 | ORPH
  mips64el   |    linux-5.10.145-cip17-rt7    | NOK | http://autobuild.buildroot.net/results/a95367decad3e2f46bb8fad0ec0d0a663453dc59 | ORPH
    m68k     |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/b0d51dfd4c2f874c994affb5cbeeb2fdd3ac06ed | ORPH
    arm      |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/37b65e56c652aa56e5ea3a15c267896a6b449e68 | ORPH
   s390x     |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/ea151f0a194d8e7a53c6ead7316271c9f28ef6a5 | ORPH
   nios2     |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/ff0666262f687b2727a487c9bfc6c19d3a940b8f | ORPH
   mips64    |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/40ec3c9a7af4f952a0503cc86cfef9d94c2f8971 | ORPH
   armeb     |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/b9472bad1824377b96def0ad22f81324ee88b9d2 | ORPH
   s390x     |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/e8a0cf77f0b8a4122b24a63c69704446ff55f98c | ORPH
 aarch64_be  |          linux-6.0.1           | NOK | http://autobuild.buildroot.net/results/4ca6c743d05b504dbd63c500110da7974364e59d | ORPH
   armeb     |       linux-fusion-9.0.3       | NOK | http://autobuild.buildroot.net/results/ba17b483ead13182f10f33dfe2d4b1740fb524d0 | ORPH
 powerpc64   |         linuxptp-3.1.1         | NOK | http://autobuild.buildroot.net/results/f3fa124da243b91ef416a919cedd2ad5c05bdee4 |     
   sparc     |         linuxptp-3.1.1         | NOK | http://autobuild.buildroot.net/results/1c0e3887ad16bcc6d0fd4902fb7b0e869339f3c5 |     
    arm      |        liquid-dsp-1.4.0        | NOK | http://autobuild.buildroot.net/results/b9603e8404d25b8c63d5916ec89de6b124cee6e1 |     
    arm      |        liquid-dsp-1.4.0        | NOK | http://autobuild.buildroot.net/results/cce8a0fab79cc67a80cec0f8ccfe8280c46137f0 |     
   armeb     |       lirc-tools-0.10.2        | NOK | http://autobuild.buildroot.net/results/24bcab6b1cc6ddf57dd260e26f2dec201c389f95 | ORPH
   sparc     |       lirc-tools-0.10.2        | NOK | http://autobuild.buildroot.net/results/bd0614aaf5e218a7344439e7dfacc564719e86b3 | ORPH
  aarch64    |       lirc-tools-0.10.2        | NOK | http://autobuild.buildroot.net/results/867bb11a8868998c5f2c45c05508a716d37609cc | ORPH
    arm      |       lttng-tools-2.13.2       | NOK | http://autobuild.buildroot.net/results/42a9a31d2ff5f1e1e3c1164e50d4804301355626 |     
 aarch64_be  |           lxc-5.0.1            | NOK | http://autobuild.buildroot.net/results/c031f215406eaa9d5747ff4ddcaf04d05b962f21 |     
   nios2     |          matio-1.5.23          | NOK | http://autobuild.buildroot.net/results/001cca5624bc31b4e9ef59b220143c7ba633e055 |     
   arceb     |        memcached-1.6.16        | NOK | http://autobuild.buildroot.net/results/a5ea3357a0069011248d2bde42ed3f02e0203682 | ORPH
  aarch64    |          mender-3.4.0          | NOK | http://autobuild.buildroot.net/results/2f7864a24c8e8a153e33c86a1b1c4b5a89640292 |     
  powerpc    |           musl-1.2.3           | NOK | http://autobuild.buildroot.net/results/74929b9d59f0c23885d1f3a6638a6450da835a47 |     
  powerpc    |           musl-1.2.3           | NOK | http://autobuild.buildroot.net/results/ee21c1d29e3449080d25ff3988109f86c4a81843 |     
    arm      |     mxs-bootlets-10.12.01      | NOK | http://autobuild.buildroot.net/results/352ab308cfd8b9afce251067037c6c68788f63a0 | ORPH
  powerpc    |       netsniff-ng-0.6.8        | NOK | http://autobuild.buildroot.net/results/2a2ef17db439372fa57b12f5681f67fed15b8474 |     
    i686     |         nodejs-16.18.1         | NOK | http://autobuild.buildroot.net/results/921edc387c63ad521cf41436af28ec6e7bb5adfc |     
  riscv64    |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/a1b583f7492b6753fa06b114033bc8450b3563ef | ORPH
    or1k     |           owfs-3.2p4           | NOK | http://autobuild.buildroot.net/results/7c2653a52f66c4e9773587897e744c2417d990d7 |     
  aarch64    | package/qt6/qt6base/qt6base... | NOK | http://autobuild.buildroot.net/results/9601d07d23a19c3a0eb4c41bbf1e2e1fdbcbb882 |     
  aarch64    |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/08b0dfedd984559918faeededa8f335c8fdc9c42 |     
    or1k     |      proxychains-ng-4.16       | NOK | http://autobuild.buildroot.net/results/a1f2787ff3c7521f5c3ca1b6d5e9f18efefb9e09 | ORPH
   armeb     |           pv-1.6.20            | NOK | http://autobuild.buildroot.net/results/fd0a7571d4a68c1bd9f5b0093be693251332e07f | ORPH
    mips     |   python-cryptography-38.0.1   | NOK | http://autobuild.buildroot.net/results/cb9fb76f719151f11464ca6f1c83ed131726ca38 |     
    i686     |      python-numpy-1.23.4       | NOK | http://autobuild.buildroot.net/results/09d2e6b2da2ba8ba72a89fcbafb2acbaac7a6070 |     
    arm      |      python-numpy-1.23.4       | NOK | http://autobuild.buildroot.net/results/033db2e0a0a7bf4d8ad11f0c0b5e55c7959b71d6 |     
   x86_64    |      python-numpy-1.23.4       | NOK | http://autobuild.buildroot.net/results/caaf977062294111d602be691041e8ec02941f21 |     
   x86_64    |      python-numpy-1.23.4       | NOK | http://autobuild.buildroot.net/results/8093477cb7793d59d800ca416d9181a7d842a15c |     
   mipsel    |      python-numpy-1.23.4       | NOK | http://autobuild.buildroot.net/results/d6c6f29c0832af7d4b87dd677b70dab4e639641d |     
    arm      |      python-numpy-1.23.4       | NOK | http://autobuild.buildroot.net/results/b2999a3175086bab31eb608cebebbe0fa1f9413d |     
   armeb     |      python-numpy-1.23.4       | NOK | http://autobuild.buildroot.net/results/861356ae95083fce477913923227ddcd2b0c7de3 |     
  sparc64    | rtl8192eu-1e15b6d451731bc4d... | NOK | http://autobuild.buildroot.net/results/2f7b6842d9f92a4631ca31ed7e6091c880db4209 |     
   arceb     | rtl8192eu-1e15b6d451731bc4d... | NOK | http://autobuild.buildroot.net/results/ea630c4a38e3e41eb13ebc94db7f42ad3624b4cc |     
  mips64el   | rtl8192eu-1e15b6d451731bc4d... | NOK | http://autobuild.buildroot.net/results/2604c2450b8f196e9bc026e9b6394d8079accd03 |     
  powerpc    |           rtty-7.4.0           | NOK | http://autobuild.buildroot.net/results/e26dd22b9e9c33cf1298078c53e492dd96e0e068 |     
powerpc64le  |         snmppp-3.4.10          | NOK | http://autobuild.buildroot.net/results/e8e9f06286ff04629c3d996642b631e1193b38aa |     
    or1k     |         sudo-1.9.11p2          | NOK | http://autobuild.buildroot.net/results/b304c306b7bc0257342550d40fb5c0a7197e3b6a | ORPH
  sparc64    |         tealdeer-1.6.1         | NOK | http://autobuild.buildroot.net/results/e3754c5a7ab73ad7be78431b826fcb440b9450db |     
   s390x     |         tealdeer-1.6.1         | NOK | http://autobuild.buildroot.net/results/fe8e6ba4ffa46e92eb0bef3c872147e70057743f |     
   s390x     |         tealdeer-1.6.1         | NOK | http://autobuild.buildroot.net/results/07d6117ac2632b27910c5257a62428d27c126bba |     
  sparc64    |         tealdeer-1.6.1         | NOK | http://autobuild.buildroot.net/results/074e11dc4fb84e08a5997320eccb7cf599c24ad1 |     
  aarch64    |         tinifier-3.4.0         | NOK | http://autobuild.buildroot.net/results/25dea199374d858be3708f02fb4bf2975ffb5317 |     
    arm      |         tinifier-3.4.0         | NOK | http://autobuild.buildroot.net/results/24bb1399f84a9ae7b4c6737d3fac89e85edc8ca3 |     
   mipsel    | toolchain-external-codescap... | NOK | http://autobuild.buildroot.net/results/878c7ead97748356bbfdc77b811ed71de926f65f | ORPH
   mipsel    | uclibc-ng-test-6790eafe897b... | NOK | http://autobuild.buildroot.net/results/607ed0ba84c6eafc386189022ca9f2f2662753a9 |     
  sparc64    | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/811e70ed324d08953c1565b306eb126b49443046 |     
  sparc64    | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/eeb31558a4d25e332c32a91657bb41b5793a8e5a |     
    sh4      |            unknown             | NOK | http://autobuild.buildroot.net/results/9228cdf2fa5b8274dc10c8e8f4702f7594d5b416 |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/8704e4baac3ad38f3e5d4877f9a48b835f72937a |     
   mips64    |        valgrind-3.19.0         | NOK | http://autobuild.buildroot.net/results/bee8f07331ccc7da29c19f8c73261bca058cd765 | ORPH
   mips64    |        valgrind-3.19.0         | NOK | http://autobuild.buildroot.net/results/b841a7980a5d39265d8af5060e665999070c3333 | ORPH
   xtensa    |           vdr-2.6.1            | NOK | http://autobuild.buildroot.net/results/50343c4e039386e06ab0f1c3efa4746bf201e4a7 |     
  powerpc    |           volk-2.5.2           | NOK | http://autobuild.buildroot.net/results/fbc0ff49b1d767e4b02eec8995e2e3bb0423001b |     
   mips64    |         wolfssl-5.5.3          | NOK | http://autobuild.buildroot.net/results/ff7ee534c8f3d85e96d011939326b232c3fcfc71 |     
   armeb     |         wolfssl-5.5.3          | NOK | http://autobuild.buildroot.net/results/53220dd2e2c2adc1a37e8f8e1ca1ce08471ee2b2 |     
  sparc64    |        xapp_xdm-1.1.13         | NOK | http://autobuild.buildroot.net/results/c268c6385c616abeda0eabfd4eb7c39614192bd9 |     
  sparc64    |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/08e69a724a0fbeb0c368ef0bdd9a697b2cb290cb |     
   mipsel    |        xfsprogs-5.14.2         | NOK | http://autobuild.buildroot.net/results/fd1921a7018135d8e5be45b4c4d3c4d0c1dd4a83 | ORPH
  aarch64    |          xvisor-0.3.1          | NOK | http://autobuild.buildroot.net/results/2f230dc5f537bcdab4911581698023e2e7e765be |     
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/70fdb4c4d531da6f5c735c5b104677d67a1766be | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/90b9cc5106038e30f3d6de7e10a3ec96013abdde | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/fdf894e7ca1120b3ce9c1332615ef9ad72646053 | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/f7c031094b1a699fcbef513049836f6221b7d40e | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/7ea0a6f88df092fda4ceeaa33aed49d918b69718 | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/c0bc521f6ea218399c88a07acf1c78274ac0d5b2 | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/8c3f73cfaf3f8898f720b26cbb2e8f72a53791f6 | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/a7147bb7618c297612b238875be9165670ce5a7d | ORPH
    or1k     |          zabbix-5.4.9          | NOK | http://autobuild.buildroot.net/results/feddc361f556c0ef62e2f2d96a39cd4365d7c78c |     
   mips64    |          zabbix-5.4.9          | NOK | http://autobuild.buildroot.net/results/6e5231ef2c370f85add6cc867f332b6e00ee46c9 |     


Classification of failures by reason for next
---------------------------------------------

          imagemagick-7.1.0-51 | 2 
              alsa-utils-1.2.8 | 1 
                    brltty-6.5 | 1 
                      crun-1.5 | 1 
              dropbear-2022.82 | 1 
                  gensio-2.5.5 | 1 
                host-go-1.19.3 | 1 
    host-python-greenlet-2.0.0 | 1 
host-spirv-llvm-translator-... | 1 
              libsodium-1.0.18 | 1 
                    norm-1.5.8 | 1 
                numactl-2.0.16 | 1 
              open62541-v1.3.3 | 1 
         s6-linux-init-1.0.6.3 | 1 
                    zeek-4.1.1 | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sh4aeb    |        alsa-utils-1.2.8        | NOK | http://autobuild.buildroot.net/results/b75cbfce3a9dfc636b19a2654468932b80b3d47b |     
microblazeel |           brltty-6.5           | NOK | http://autobuild.buildroot.net/results/1be70fa7b21a457edd078d10c1765050ec79ac63 |     
    arc      |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/70e0adf59ceeb0f377c39494b943596e7e4446f8 |     
  riscv64    |        dropbear-2022.82        | NOK | http://autobuild.buildroot.net/results/73c2fde4ffe7142edf4a00e122831b3720bfa9b6 |     
   sparc     |          gensio-2.5.5          | NOK | http://autobuild.buildroot.net/results/a84db67910f9f78f3c21acd0e19b747d95eb1435 |     
  mips64el   |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/9b611dc99762bfee346787b0bd1e1fef241c22de |     
   arceb     |   host-python-greenlet-2.0.0   | NOK | http://autobuild.buildroot.net/results/4833e2d4d9bbce675990a7f23588b9f1abbe58e4 |     
   armeb     | host-spirv-llvm-translator-... | NOK | http://autobuild.buildroot.net/results/649d1ee5bf5dcd18ad898f67ebf4f8745a2d15c4 | ORPH
    arc      |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/4be4439084d860d0666c365bb6cf7bf0c80bb7e6 | ORPH
 microblaze  |      imagemagick-7.1.0-51      | NOK | http://autobuild.buildroot.net/results/3b23f70850f5e2a01afb2af216941c05c11cd95b | ORPH
    arm      |        libsodium-1.0.18        | NOK | http://autobuild.buildroot.net/results/547369df81abf3bd10c6c3374acb11b1747d9761 |     
powerpc64le  |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/068658c518f581262bee677b45a041746e3bbc60 | ORPH
   sparc     |         numactl-2.0.16         | NOK | http://autobuild.buildroot.net/results/03dbe02f632c226e806aea90d56fc0ceab1d510a |     
   nios2     |        open62541-v1.3.3        | NOK | http://autobuild.buildroot.net/results/96217d4931afeb1bbbaba2ceab37ca3f31fd5bfd | ORPH
  mips64el   |     s6-linux-init-1.0.6.3      | NOK | http://autobuild.buildroot.net/results/63fe77df99f530a9a4d61e286cd9b186b32b2850 |     
    sh4      |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/28433ccaef297f125b56c9089db083b43e7d3d66 |     


Classification of failures by reason for 2022.08.x
--------------------------------------------------

host-pahole-73383b3a39afe86... | 3 
                host-go-1.18.8 | 2 
/home/buildroot/autobuild/i... | 1 
                  assimp-5.2.1 | 1 
                 dash-0.5.11.5 | 1 
                gerbera-1.10.0 | 1 
glibc-2.35-134-gb6aade18a7e... | 1 
google-breakpad-c85eb4a59b6... | 1 
host-spirv-llvm-translator-... | 1 
               libglib2-2.72.3 | 1 
                libmad-0.15.1b | 1 
                 linux-5.17.15 | 1 
              open62541-v1.3.2 | 1 
               openpgm-5-3-128 | 1 
                 pixman-0.42.2 | 1 
                tinifier-3.4.0 | 1 
                    zeek-4.1.1 | 1 


Detail of failures for 2022.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   s390x     | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/84f084d68fae010cb86327aa86bdb3bc11dbaddd |     
    or1k     |          assimp-5.2.1          | NOK | http://autobuild.buildroot.net/results/a37b298b01b3bf5061e0c087ac42908afe58a22f | ORPH
   sh4aeb    |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/32dbf55b0a6759bf7b63fb06f8a81ebc6e99460f | ORPH
    sh4      |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/3454a87110146df539545ac8291b7086daa56e1a |     
   mipsel    | glibc-2.35-134-gb6aade18a7e... | NOK | http://autobuild.buildroot.net/results/9842758bf99574e3a517f2abba7b6bdce4f491d2 |     
   mipsel    | google-breakpad-c85eb4a59b6... | NOK | http://autobuild.buildroot.net/results/c2b7b1eeb6789b5c0ab868bc833c4cb10b38a572 |     
powerpc64le  |         host-go-1.18.8         | NOK | http://autobuild.buildroot.net/results/bc83dbf150c8b96c135a4658662c6de6c6dc420e |     
  mips64el   |         host-go-1.18.8         | NOK | http://autobuild.buildroot.net/results/c608c09ab95647cb57ab7d177b8cd9b9ab6ad381 |     
microblazeel | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/fcb31ca2bc4792d70aa6132cf188df3c37d68c03 |     
 powerpc64   | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/33a80158f6b4fbec3a76eb74f465f76d3eccea20 |     
   xtensa    | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/e4d5383990894edf4f622afd48bdca34203e8c8a |     
  aarch64    | host-spirv-llvm-translator-... | NOK | http://autobuild.buildroot.net/results/6d50080e008c63d4ed08556bafc3bd77c51e4622 | ORPH
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/ff3d6a55701f656b114043d898e5645a084d19e6 |     
    arm      |         libmad-0.15.1b         | NOK | http://autobuild.buildroot.net/results/4998619095f01b7cb1ecef220c32f845ff7e74cb | ORPH
 aarch64_be  |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/cbf624776b7ed7eaee480512a5d60a84a75a9bc7 | ORPH
 aarch64_be  |        open62541-v1.3.2        | NOK | http://autobuild.buildroot.net/results/f3a07245d07f4bd0e3ef23e13c7de9b1dcbbe032 | ORPH
  sparc64    |        openpgm-5-3-128         | NOK | http://autobuild.buildroot.net/results/69aecf2c04123ba9d73028858c1bc695803de3f8 |     
powerpc64le  |         pixman-0.42.2          | NOK | http://autobuild.buildroot.net/results/bbb64df44ac1f58c2e39d2a671c9a31d5aa8f46c |     
powerpc64le  |         tinifier-3.4.0         | NOK | http://autobuild.buildroot.net/results/ea9b9a1b6e852bd4e8ea2703b3cd026fb061591c |     
    sh4      |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/2f14365147f4efac42b47e7947636bdbf217b206 |     


Gitlab CI results for 2022-11-22
================================


-- 
http://autobuild.buildroot.net

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

