Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 392F6C001DE
	for <buildroot@archiver.kernel.org>; Sun,  6 Aug 2023 05:42:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5443640967;
	Sun,  6 Aug 2023 05:42:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5443640967
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YThs5dUcWHnZ; Sun,  6 Aug 2023 05:42:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BA18640343;
	Sun,  6 Aug 2023 05:42:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BA18640343
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 643971BF2EB
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 05:42:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7CC4940343
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 05:41:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7CC4940343
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Su1XeC0kexeN for <buildroot@lists.busybox.net>;
 Sun,  6 Aug 2023 05:41:37 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3FC684032A
 for <buildroot@buildroot.org>; Sun,  6 Aug 2023 05:41:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3FC684032A
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3B12CFF802
 for <buildroot@buildroot.org>; Sun,  6 Aug 2023 05:41:34 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sun, 06 Aug 2023 05:41:34 -0000
X-GND-Sasl: bot@bootlin.com
Message-Id: <20230806054139.7CC4940343@smtp4.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1691300494; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Oy6btPf2ODIEmb9IFhNMDhKw3e4lLiY6ecyvuB/yldw=;
 b=M81JSpfvEl8FubO16LG7foZF+Tg5gblhKH4Fo2k7U/Lt89h65V+jPAFIFbBykTIyEi4j38
 GpDrJVifPWU+s5SaoCPU2sIdNedv00muCA5S2s5hJVA4I6nHUccByM73+LVRwTMCP79PRY
 q2wYkDA62ybdt509IxFCb6eZ03wZneZ+JFciP3scM/pVLFklMi7riKScGFp5G80pKLz+9a
 SDMkzjpT1AlxkcgQY8yAn1Kktk6qnOYw9IN7kRMkaGe/yb7BX6bQgkboRi+LAxUYbSERT2
 nSJrs1TISSe3KRBWH+YDaFlrRNxBibB2luP8drnr/qiJuMycElxvliiI1vG1Rw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=M81JSpfv
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-08-05
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

Autobuild statistics for 2023-08-05
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  |  5  |  4  |  0  |  9  |
  2023.05.x  |  7  |  2  |  0  |  9  |
    master   | 41  | 43  |  2  | 86  |

Classification of failures by reason for master
-----------------------------------------------

         host-sentry-cli-2.8.0 | 4 
             host-ccache-4.8.2 | 3 
         gobject-introspection | 2 
  gobject-introspection-1.76.1 | 2 
                   guile-3.0.9 | 2 
          host-elf2flt-2021.08 | 2 
                   linux-6.4.7 | 2 
                 mpg123-1.31.3 | 2 
                       unknown | 2 
             util-linux-2.39.1 | 2 
  binutils-arc-2020.09-release | 1 
                bpftool-v7.1.0 | 1 
                  check-0.15.2 | 1 
             dahdi-linux-3.2.0 | 1 
                dovecot-2.3.20 | 1 
                elfutils-0.189 | 1 
                  ffmpeg-4.4.4 | 1 
fs/jffs2/jffs2.mk:71: /home... | 1 
fs/ubi/ubi.mk:51: /home/bui... | 1 
glibc-2.37-2-g9f8513dc64119... | 1 
                haveged-1.9.18 | 1 
           host-composer-2.5.8 | 1 
                jemalloc-5.3.0 | 1 
            libmemcached-1.1.4 | 1 
               lighttpd-1.4.69 | 1 
                   linux-tools | 1 
                netdata-1.33.1 | 1 
                 openssh-9.3p2 | 1 
                   p7zip-17.04 | 1 
    python-cryptography-39.0.2 | 1 
            quickjs-2021-03-27 | 1 
                xenomai-3.0.10 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |  binutils-arc-2020.09-release  | NOK | http://autobuild.buildroot.net/results/f06132c81f996a8d606a8d9737d7d33a589be534 |     
   x86_64    |         bpftool-v7.1.0         | NOK | http://autobuild.buildroot.net/results/64acd6d1b072725ef6a6a34a485cf99619c33fdc |     
  mips64el   |          check-0.15.2          | NOK | http://autobuild.buildroot.net/results/bcac9f3556030bc6a5d83d9de11db4c499f89216 | ORPH
   x86_64    |       dahdi-linux-3.2.0        | NOK | http://autobuild.buildroot.net/results/be36df971bfb0fe9878ea38c674a9cd6f743b458 |     
    sh4a     |         dovecot-2.3.20         | NOK | http://autobuild.buildroot.net/results/34fe2213623d5d2952041aad949ca9d67d9b2140 |     
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/2549981c3147f6cf0b5326b35e202b54dbfee6cd | ORPH
    arc      |          ffmpeg-4.4.4          | NOK | http://autobuild.buildroot.net/results/56dfdb35f49aaf6e5fb112f917090b5f731f340c |     
   nios2     | fs/jffs2/jffs2.mk:71: /home... | NOK | http://autobuild.buildroot.net/results/2051545fd1446149dbd4e12da8939c7647d6624a |     
    or1k     | fs/ubi/ubi.mk:51: /home/bui... | NOK | http://autobuild.buildroot.net/results/087ef38df16a9adb7f509c3c4a0bd16fc7e72673 |     
 powerpc64   | glibc-2.37-2-g9f8513dc64119... | NOK | http://autobuild.buildroot.net/results/8f007fbaa576ed55a51bf590d2102bd67326cf0e |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/67e2361eb631348373dfb681294526d8549ae214 |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/edcfc875ff43644c235c0e9347e1412ec34fddc8 |     
   s390x     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/73f07a177a7ff054b47e15af8061f16a6ba9bd7b | ORPH
   nios2     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/926277eb2b4e59a02221c5cb3c24bbaa50c3ab7a | ORPH
   x86_64    |          guile-3.0.9           | NOK | http://autobuild.buildroot.net/results/94c08791db68c40c69c3e6af0b6c9b16471c2f7e |     
    arm      |          guile-3.0.9           | NOK | http://autobuild.buildroot.net/results/28e4d2c69f10b5acdc406db58f7e3004809fb8e8 |     
   x86_64    |         haveged-1.9.18         | NOK | http://autobuild.buildroot.net/results/8b52ad8e293e3b02ad3f745da88460828d367d87 |     
  aarch64    |       host-ccache-4.8.2        | NOK | http://autobuild.buildroot.net/results/faf448e9df6e02547f99f87b099f0448a97b8cc9 | ORPH
   armeb     |       host-ccache-4.8.2        | NOK | http://autobuild.buildroot.net/results/62829080b0879a1374c27294f0b957fcfb1f0000 | ORPH
    arc      |       host-ccache-4.8.2        | NOK | http://autobuild.buildroot.net/results/37b48d80cc718ae97268c787483eba9fd34c0630 | ORPH
   armeb     |      host-composer-2.5.8       | NOK | http://autobuild.buildroot.net/results/e43becce5b0df1330b774f400693bf332e18727a |     
  riscv64    |      host-elf2flt-2021.08      | NOK | http://autobuild.buildroot.net/results/95309f4e274482cb0bdcafa65ce297c545ebb2af | ORPH
  riscv64    |      host-elf2flt-2021.08      | NOK | http://autobuild.buildroot.net/results/b61e35c48b23f7dcf81d451bdbbd9106f77d0587 | ORPH
    mips     |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/74233fdc91a055a22d54aebd8ad4d6e8509383a0 |     
   mipsel    |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/c87be3c2877fa82646b309a929bdc8b29206ea3b |     
   mips64    |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/183512352dfca2a5a47a0170f4f35b4faacb1350 |     
   x86_64    |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/98f9bc38f89918512537b3f40993bb0c97ec4115 |     
    sh4a     |         jemalloc-5.3.0         | NOK | http://autobuild.buildroot.net/results/26568175d44bc52f470cbf64d013794bebcec590 |     
   arceb     |       libmemcached-1.1.4       | NOK | http://autobuild.buildroot.net/results/48c818bb4e82f0997503713ed0df99558e80bae6 | ORPH
   arceb     |        lighttpd-1.4.69         | NOK | http://autobuild.buildroot.net/results/fb25ef6484a3d5d60f970fa5ded3b96a4ed5dd37 | ORPH
   mips64    |          linux-6.4.7           | NOK | http://autobuild.buildroot.net/results/9a95e8a6dda80f61f83f0393cf1e271ad7290cf5 | ORPH
    sh4a     |          linux-6.4.7           | NOK | http://autobuild.buildroot.net/results/565ef00ac1224eb97838a52024135fcdbc98ce4a | ORPH
 powerpc64   |          linux-tools           | NOK | http://autobuild.buildroot.net/results/d944592bb481935b452cc1dc35e92d9a67cc6f2e | ORPH
   mipsel    |         mpg123-1.31.3          | NOK | http://autobuild.buildroot.net/results/74e1522cc9328c98186ca730eeb7ce0cb5fbbcb5 |     
   arceb     |         mpg123-1.31.3          | NOK | http://autobuild.buildroot.net/results/aa2c268b3b78e00e854b8ec24139282776df7d76 |     
   s390x     |         netdata-1.33.1         | NOK | http://autobuild.buildroot.net/results/b3b25b942abb5c95cbc1a0b04105b336633d822e |     
    m68k     |         openssh-9.3p2          | NOK | http://autobuild.buildroot.net/results/d29c662e41d8969e6a8aa24870e728bcc7050563 | ORPH
 microblaze  |          p7zip-17.04           | NOK | http://autobuild.buildroot.net/results/a6e2bd171988f7105ce21b01de7d79b078bff447 |     
   armeb     |   python-cryptography-39.0.2   | NOK | http://autobuild.buildroot.net/results/fdd8bb7951aaee6ab67525b8bcc906345daa8066 |     
   s390x     |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/772b70da4d4b850b409d654d3851e97bcd8425d3 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/d963648dfb367268e3a16cf5625fe58618fee352 |     
 microblaze  |            unknown             | NOK | http://autobuild.buildroot.net/results/61bdfe82458c89f7c6c0019ef4a2862fd6b6ca0e |     
  aarch64    |       util-linux-2.39.1        | NOK | http://autobuild.buildroot.net/results/281d6156b5cfedef61b5ef31a4165fd901309b40 | ORPH
   sh4eb     |       util-linux-2.39.1        | NOK | http://autobuild.buildroot.net/results/716d38c8add7e6017cafc8f91002ef368dc8912e | ORPH
   s390x     |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/e168ae2e7adb03953f6dc1b86114597efb8fed37 |     


Classification of failures by reason for 2023.02.x
--------------------------------------------------

             fontconfig-2.13.1 | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
  gobject-introspection-1.72.0 | 1 
                       unknown | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/ef7101fd942216d350552233b27fb19929191b53 | ORPH
microblazeel | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/db431bf9bbecffc12b450eeed9c44873ee1fe946 |     
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/b304d31b77cef0b97871d6a853bcf576b7dde59c | ORPH
   s390x     |            unknown             | NOK | http://autobuild.buildroot.net/results/9384a6ed4b00faff92c05587cb18a0e621cf83c5 |     


Classification of failures by reason for 2023.05.x
--------------------------------------------------

            host-binutils-2.38 | 1 
               host-go-1.19.10 | 1 


Detail of failures for 2023.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/5886b8cf045d6690340fdc69b4ad245b5adc8aa9 |     
  mips64el   |        host-go-1.19.10         | NOK | http://autobuild.buildroot.net/results/85dbce4b48f073adb2b66cfe123c8b3330286b1c |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
