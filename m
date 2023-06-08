Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C626EC7EE2E
	for <buildroot@archiver.kernel.org>; Thu,  8 Jun 2023 04:40:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0270160A6A;
	Thu,  8 Jun 2023 04:40:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0270160A6A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xahE0wEgEzDh; Thu,  8 Jun 2023 04:40:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CBCD960B22;
	Thu,  8 Jun 2023 04:40:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CBCD960B22
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 25E6D1BF310
 for <buildroot@lists.busybox.net>; Thu,  8 Jun 2023 04:40:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EA00C82FA2
 for <buildroot@lists.busybox.net>; Thu,  8 Jun 2023 04:40:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EA00C82FA2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zTLZMdvXo7Un for <buildroot@lists.busybox.net>;
 Thu,  8 Jun 2023 04:40:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 05FFB825FE
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 05FFB825FE
 for <buildroot@buildroot.org>; Thu,  8 Jun 2023 04:40:23 +0000 (UTC)
X-GND-Sasl: thomas.petazzoni@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 00A5BFF806
 for <buildroot@buildroot.org>; Thu,  8 Jun 2023 04:40:18 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Thu, 08 Jun 2023 04:40:18 -0000
Message-Id: <20230608044025.EA00C82FA2@smtp1.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1686199219; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=4oqdU+lPjb0+KOBtaRACCWPGW+S1w894kzkvVRpzhrU=;
 b=O2MtC6CDx5KT6wWnJPe3zFsmtQixi8JAADLcd2d7sA6U5TdwOxGq/KBsJLspwXzoam2jrr
 GgW2RmJ4SXCjqjELu1qCN4h959AiiWoqO4s1wN/LY0QxN/x6iwXmt68HFnF315Ec2B4xr9
 RHlq/tLyrxxnHipFZE6J6ce7/vWNWn1FVkVT0Y2IbKQj1L4qqlGV8nbdj6wOwPSyWN624Q
 mmKoSgPh5CqtEZdssD5bu6iU+b84gbLV7a8cqZPCJRDCagBjpynqkI4Sf+svEj5V5/JIe2
 SXAcCmG6JkKZpiMmZdDeDPktzTSgUZCncTUC4U1GqTTDDPCKlTQgdGLoen+wAQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=O2MtC6CD
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-06-07
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

Autobuild statistics for 2023-06-07
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  |  5  |  9  |  0  | 14  |
    master   | 92  | 56  |  0  | 148 |

Classification of failures by reason for master
-----------------------------------------------

                elfutils-0.186 | 4 
                   linux-6.3.6 | 4 
host-heimdal-f4faaeaba371ff... | 3 
               syslog-ng-4.1.1 | 3 
             batman-adv-2022.3 | 2 
  gobject-introspection-1.74.0 | 2 
               host-go-1.19.10 | 2 
              host-rust-1.68.2 | 2 
              skalibs-2.12.0.1 | 2 
                   trinity-1.9 | 2 
                       unknown | 2 
                 agentpp-4.6.0 | 1 
           at-spi2-core-2.48.2 | 1 
                     audit-3.1 | 1 
edid-decode-2d44e1b01c7ed7d... | 1 
                 fdk-aac-2.0.2 | 1 
fs/ubi/ubi.mk:51: /home/aut... | 1 
                haveged-1.9.18 | 1 
            host-binutils-2.38 | 1 
            host-binutils-2.39 | 1 
         host-gcc-final-11.4.0 | 1 
         host-gcc-final-12.3.0 | 1 
host-gdb-arc-2020.09-releas... | 1 
igh-ethercat-2e2cef61318953... | 1 
                   json-c-0.16 | 1 
              libgcrypt-1.10.1 | 1 
               libglib2-2.76.1 | 1 
              libuhttpd-3.14.1 | 1 
          linux-5.10.162-cip24 | 1 
               linux-pam-1.5.2 | 1 
          lttng-modules-2.13.7 | 1 
                    musl-1.2.3 | 1 
             netsniff-ng-0.6.8 | 1 
                     pv-1.6.20 | 1 
           python-pyicu-2.10.2 | 1 
       python-stack-data-0.6.2 | 1 
rtl8192eu-865656c3a1d1aee8c... | 1 
             stress-ng-0.15.07 | 1 
ulog-0389d243352255f6182326... | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |         agentpp-4.6.0          | NOK | http://autobuild.buildroot.net/results/1eef9b67c124b3a5ee49e6a34625ab0a3d15b976 |     
  sparc64    |      at-spi2-core-2.48.2       | NOK | http://autobuild.buildroot.net/results/ec6f5354855cb5022cb3aadcc177f0d34bee5250 |     
  powerpc    |           audit-3.1            | NOK | http://autobuild.buildroot.net/results/2c2fdcd72c54153bfe679eef13d5f1eceb02c3c8 |     
  riscv32    |       batman-adv-2022.3        | NOK | http://autobuild.buildroot.net/results/f11c575c292f41a41c0a473789aec745c645853a |     
 powerpc64   |       batman-adv-2022.3        | NOK | http://autobuild.buildroot.net/results/eef3d8bb8eeb53c2893166c5a84aa994ead127b0 |     
  riscv64    | edid-decode-2d44e1b01c7ed7d... | NOK | http://autobuild.buildroot.net/results/c722c63891e551e9a05e4ad5dec289c0ffec7fce | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/24cd7c62976350dd4a5669fba7352a08a70f03cf | ORPH
    arc      |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/37222bff404626444867a1e0e114c8b196bcb55e | ORPH
   arceb     |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/a485916c0496a271215a6c2626ab07f31800284e | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/9036eed53242e6fc3515c1b28bf39a334d44b94f | ORPH
   mipsel    |         fdk-aac-2.0.2          | NOK | http://autobuild.buildroot.net/results/bf7226e4aa7c697505a8964470cda4b8e058d249 |     
    mips     | fs/ubi/ubi.mk:51: /home/aut... | NOK | http://autobuild.buildroot.net/results/95472197494fd8e3637ee89d05834189e8797a0b |     
   s390x     |  gobject-introspection-1.74.0  | NOK | http://autobuild.buildroot.net/results/957448a950a1f200a5a3abd63f85395c5bbc81c1 | ORPH
    or1k     |  gobject-introspection-1.74.0  | NOK | http://autobuild.buildroot.net/results/44f8dd160db9fd40c8533885c77ab42ce9be1fce | ORPH
   mips64    |         haveged-1.9.18         | NOK | http://autobuild.buildroot.net/results/48948ff8c146254897751f0523fca0bea337dfa9 |     
   armeb     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/7df87f83ca98a2816dfc913bc6e96fb4e3111c32 |     
 aarch64_be  |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/8e04b52b17ce73fa014f2a565911d704bbcbab1a |     
 microblaze  |     host-gcc-final-11.4.0      | NOK | http://autobuild.buildroot.net/results/c1c5744838c749c88b39d96a1eefcdbd89352d49 |     
microblazeel |     host-gcc-final-12.3.0      | NOK | http://autobuild.buildroot.net/results/818da6c06a48f90566c5f4c7940a92320b30fde0 |     
    arc      | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/14aa3376be8093d285bed8189fa865253cb3f8e4 | ORPH
    or1k     |        host-go-1.19.10         | NOK | http://autobuild.buildroot.net/results/02e9d116cd2d58156d25d8da809d7b3dba4640b6 |     
   s390x     |        host-go-1.19.10         | NOK | http://autobuild.buildroot.net/results/5d324ca0fae580a9fb45b9eb0f3f615027358425 |     
 aarch64_be  | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/e308e259e1c03581b68d7ae2f138f1eb02f8318a | ORPH
  mips64el   | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/b360466e5f9d55e6ad0711db6fec0c5f818141b1 | ORPH
  mips64el   | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/540d9c8aac7a6c892d3363738786f0638b191e42 | ORPH
 powerpc64   |        host-rust-1.68.2        | NOK | http://autobuild.buildroot.net/results/8ed81632c1b7a8f61f9bca5eb59f359ff13acd8d |     
  sparc64    |        host-rust-1.68.2        | NOK | http://autobuild.buildroot.net/results/7f026b02ad823ea7afc685521983d2c3dad65670 |     
    or1k     | igh-ethercat-2e2cef61318953... | NOK | http://autobuild.buildroot.net/results/634099845c3b6e4f54b88e1d2c127b86822fd770 |     
  riscv64    |          json-c-0.16           | NOK | http://autobuild.buildroot.net/results/d9b6af84690ab528374fb6cb90677b70113dd4c7 |     
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/37f9c068e1e0d02b0448412a6423d09e1e590c86 | ORPH
    i686     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/d3e0b5fb34596c6c9371346daaa04fdf471f841e |     
   mips64    |        libuhttpd-3.14.1        | NOK | http://autobuild.buildroot.net/results/de204cb21f471143030dfd681005d411acad838f |     
    mips     |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/137e7dcc2ee5b8fadf2e6edf13aada1669a08029 | ORPH
    mips     |          linux-6.3.6           | NOK | http://autobuild.buildroot.net/results/12a7b4f43c4ff7a6bf7fcdf098b7b87ee1fed22d | ORPH
  powerpc    |          linux-6.3.6           | NOK | http://autobuild.buildroot.net/results/1973da515e55540cf8fb640b203056bd49cbc504 | ORPH
    m68k     |          linux-6.3.6           | NOK | http://autobuild.buildroot.net/results/b070cbf8f13c80daed08dd6db830b2f802ef9b80 | ORPH
  mips64el   |          linux-6.3.6           | NOK | http://autobuild.buildroot.net/results/171dfc73bf3cfc655a2aead913418da555457846 | ORPH
   sparc     |        linux-pam-1.5.2         | NOK | http://autobuild.buildroot.net/results/50f5514e450add17c02484e7ac055ecd242175ce | ORPH
 powerpc64   |      lttng-modules-2.13.7      | NOK | http://autobuild.buildroot.net/results/9a20247a21bbc2e65bc72e37d619e12f0b59f4ef |     
  powerpc    |           musl-1.2.3           | NOK | http://autobuild.buildroot.net/results/161aa32aa60c90f8d34345c4cc58658bf97562b2 |     
   x86_64    |       netsniff-ng-0.6.8        | NOK | http://autobuild.buildroot.net/results/62e967b5f187f36ec5a67f26f6efd2e1a13b370a |     
   armeb     |           pv-1.6.20            | NOK | http://autobuild.buildroot.net/results/3d055d42bd493dfd416fa5eee1352f3743ffdee1 | ORPH
   xtensa    |      python-pyicu-2.10.2       | NOK | http://autobuild.buildroot.net/results/660a1efc883b8be298a85dc5043aefb073ea6f0c |     
   mipsel    |    python-stack-data-0.6.2     | NOK | http://autobuild.buildroot.net/results/34a8be17bd647421ccd538adb181ef27e0d106e0 |     
    i586     | rtl8192eu-865656c3a1d1aee8c... | NOK | http://autobuild.buildroot.net/results/0a085015e5c40db4b8911cfd45ab65908c748a8a |     
    or1k     |        skalibs-2.12.0.1        | NOK | http://autobuild.buildroot.net/results/148b63ef07881131225861a968bbf5e14ff8a09a |     
    or1k     |        skalibs-2.12.0.1        | NOK | http://autobuild.buildroot.net/results/e4852032504b6d648a2f506ce0983d07252b164f |     
   x86_64    |       stress-ng-0.15.07        | NOK | http://autobuild.buildroot.net/results/de2543b290e6f6851c5881967c7e46208861cb24 |     
  powerpc    |        syslog-ng-4.1.1         | NOK | http://autobuild.buildroot.net/results/e0fc18ee1c5df004faf8034a992a9ea1e58643e4 |     
   mipsel    |        syslog-ng-4.1.1         | NOK | http://autobuild.buildroot.net/results/94e273eab8394ac732de8b4f0d08b0d125418fd7 |     
   mips64    |        syslog-ng-4.1.1         | NOK | http://autobuild.buildroot.net/results/83d43620c4ace93ece74a136474638ce4b3f9fc6 |     
powerpc64le  |          trinity-1.9           | NOK | http://autobuild.buildroot.net/results/b65c1f492379466277070377f2cd437351fe2ac4 | ORPH
powerpc64le  |          trinity-1.9           | NOK | http://autobuild.buildroot.net/results/9c8e2bd7f15262aca8a10f1fb0c6fbe59dc66897 | ORPH
   s390x     | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/3de1eb9a3d927c6533c42e645d96d8acea68b7a8 |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/15568e75af549a6e55b437bd00955b9e4d85b6fd |     
   mips64    |            unknown             | NOK | http://autobuild.buildroot.net/results/fa1e5e161a2ebd7c97f18a54ef78c2c870d891e7 |     


Classification of failures by reason for 2023.02.x
--------------------------------------------------

                 agentpp-4.6.0 | 2 
               host-qemu-7.2.0 | 2 
         host-gcc-final-12.2.0 | 1 
              host-rust-1.67.1 | 1 
               libglib2-2.72.3 | 1 
            quickjs-2021-03-27 | 1 
                       unknown | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  sparc64    |         agentpp-4.6.0          | NOK | http://autobuild.buildroot.net/results/8656755bc3a3eb4b790aef644de753fa6a8913f2 |     
    arm      |         agentpp-4.6.0          | NOK | http://autobuild.buildroot.net/results/676605c2f4e93a9b45dd3564cdff537f60d0006b |     
    arm      |     host-gcc-final-12.2.0      | NOK | http://autobuild.buildroot.net/results/4cf9bf88f37286d3e1a6d3a5acca7fd82170ddf6 |     
  sparc64    |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/c39d0e135eb2fbfa160819499ab2d5938ab6295d |     
 microblaze  |        host-qemu-7.2.0         | NOK | http://autobuild.buildroot.net/results/70e7787619b3a26196ccafc32aa6b60c1ef66420 |     
 powerpc64   |        host-rust-1.67.1        | NOK | http://autobuild.buildroot.net/results/adb20a9fa55198a0a155b51ca39e67771bbb1d23 |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/ea55f2f5b4d8b15da52e40cfcf9f23acf3ccebea |     
    sh4a     |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/b1db05e79e5505c6606524e54e159224b633eac2 |     
  sparc64    |            unknown             | NOK | http://autobuild.buildroot.net/results/baa1a025a50bc8ab89faa00512840fa38d077e5b |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
