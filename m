Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33AECC433EF
	for <buildroot@archiver.kernel.org>; Sun, 10 Jul 2022 05:37:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 636DF405FC;
	Sun, 10 Jul 2022 05:37:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 636DF405FC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sEP75TkVXDFJ; Sun, 10 Jul 2022 05:37:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4E7F2405E3;
	Sun, 10 Jul 2022 05:37:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4E7F2405E3
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8C5851BF57F
 for <buildroot@lists.busybox.net>; Sun, 10 Jul 2022 05:37:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 63C1B60B1F
 for <buildroot@lists.busybox.net>; Sun, 10 Jul 2022 05:37:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 63C1B60B1F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6fZMNS4PXkfe for <buildroot@lists.busybox.net>;
 Sun, 10 Jul 2022 05:37:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E567E60A9B
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E567E60A9B
 for <buildroot@buildroot.org>; Sun, 10 Jul 2022 05:37:03 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id C9FB740009
 for <buildroot@buildroot.org>; Sun, 10 Jul 2022 05:37:00 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sun, 10 Jul 2022 05:37:00 -0000
Message-Id: <20220710053706.63C1B60B1F@smtp3.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1657431420; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=PV/K6D6qqht+NHz8ABlt7JrNuFF49eZmc9pTHNF992Y=;
 b=eYGCiy6LWZRiPkJeMKBe9qox/TpT77MzCVcAbukkiVbD2AJpxPjPzw1Oj9vlvmNkuMT0oX
 4/0BUYl+Vxs7zP33VasOaEwozdPgVTprTGgIEdqBI7YWZjmh0k4OedyGlLHyIp/htsSZxL
 tvaMVodOC1kZzHaLEBF5nB4K+CH/aK0LMLji5FwsfQwlOU7afcNMAjQPR3kNOKRi9tLSZL
 1cJdMniJAbGcms0ww3K37DLtRD4OdJBjFuIGmFRMg1Zmw5ATrrXHFINaIPiNMHY4s09HLO
 EkUx+VTA8pRLJnzV/jM+rHFH5J0kiPgdhbYEvhsFzcd1eT6vT8muLjGHjNtl+A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=eYGCiy6L
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-07-09
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

Autobuild statistics for 2022-07-09
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  | 14  |  1  |  0  | 15  |
  2022.05.x  | 15  | 35  |  0  | 50  |
    master   | 102 | 160 |  0  | 262 |

Classification of failures by reason for master
-----------------------------------------------

                       unknown | 14
              alsa-utils-1.2.7 | 12
host-pahole-73383b3a39afe86... | 10
                   speex-1.2.1 | 9 
                speexdsp-1.2.1 | 9 
                 uclibc-1.0.41 | 7 
                 zlib-ng-2.0.6 | 6 
                  exempi-2.6.1 | 4 
                libcurl-7.84.0 | 4 
                 libvpx-1.12.0 | 4 
                     php-8.1.7 | 4 
                     refpolicy | 4 
                busybox-1.35.0 | 3 
                 dash-0.5.11.5 | 3 
                host-go-1.18.3 | 3 
                iptables-1.8.8 | 3 
           libfreeimage-3.18.0 | 3 
             libopenssl-1.1.1q | 3 
               protobuf-3.20.1 | 3 
                   tor-0.4.7.8 | 3 
              alsa-lib-1.2.7.1 | 2 
                elfutils-0.186 | 2 
                    glog-0.6.0 | 2 
                libzlib-1.2.12 | 2 
                 linux-5.17.13 | 2 
   perl-crypt-openssl-rsa-0.31 | 2 
              swupdate-2022.05 | 2 
/home/buildroot/autobuild/i... | 1 
/home/buildroot/autobuild/i... | 1 
                  assimp-5.2.1 | 1 
                  cmocka-1.1.5 | 1 
dahdi-linux-5c840cf43838e06... | 1 
           docker-cli-20.10.14 | 1 
                     frr-8.2.2 | 1 
               gocryptfs-2.2.1 | 1 
google-breakpad-c85eb4a59b6... | 1 
          host-gcc-final-8.4.0 | 1 
             host-gtest-1.12.0 | 1 
           host-harfbuzz-4.4.0 | 1 
host-spirv-llvm-translator-... | 1 
            igh-ethercat-1.5.2 | 1 
                ipmiutil-3.1.8 | 1 
              jpeg-turbo-2.1.3 | 1 
               libglib2-2.70.4 | 1 
          libmicrohttpd-0.9.75 | 1 
       linux-5.10.109-cip5-rt4 | 1 
           linux-5.10.115-cip7 | 1 
                ljsyscall-0.12 | 1 
          lttng-modules-2.13.1 | 1 
make: *** wait: No child pr... | 1 
                  mender-3.1.0 | 1 
                nodejs-16.15.0 | 1 
                    opus-1.3.1 | 1 
                   perl-5.34.1 | 1 
               poppler-21.12.0 | 1 
                    pppd-2.4.9 | 1 
rtl8812au-aircrack-ng-37e27... | 1 
                    ruby-3.1.2 | 1 
                    sdl-1.2.15 | 1 
ulog-0389d243352255f6182326... | 1 
                 wavemon-0.9.4 | 1 
                    zstd-1.5.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   s390x     | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/a3f5691cd7c4575998fd9cf59de8668b655a496c |     
  sparc64    | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/1ed25ef6ae1f0259d12942d03fac05e9d3f030a8 |     
    m68k     |        alsa-lib-1.2.7.1        | NOK | http://autobuild.buildroot.net/results/948bd4e1f765e6ca6104c29799817404b348d55d |     
    m68k     |        alsa-lib-1.2.7.1        | NOK | http://autobuild.buildroot.net/results/9e983b8b92177f05921a628b4ecba99c06ba5503 |     
    or1k     |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/7f0c3c26a139e1b0091338b40262d54bbd1591fb |     
   sparc     |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/11e7d96ae44b73482f22f660a9fcf865c5712723 |     
    mips     |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/94919da64c9d572d61c15e4d7683d0a83837d5fb |     
   x86_64    |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/9fabf33d5fce1e8a9df7dce0a9f09982a4fa9132 |     
    i686     |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/46e666db92a45cc8858c5628b1aa4e3c0fbd27f1 |     
   x86_64    |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/073a1a1b0baf3a867a7ab01c26e2744d2b760c05 |     
    arm      |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/1eedf5e2bbc5ebe097ef6d37e1a2827c473a5ddd |     
   x86_64    |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/b2775fc80ea764553b2044145d1165825c4753f4 |     
    arm      |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/a415e94cd113be7bf563a47696cc2b236683d136 |     
   sparc     |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/7d80b7f40a5e2052264cff96f2e52a6d7088a4ae |     
   mips64    |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/e08f53b7f9d991ad1d3158e54a75efed834989f8 |     
    arm      |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/5df025fef0740972f3ae7ede0b6dda5e7ba4ed66 |     
   mipsel    |          assimp-5.2.1          | NOK | http://autobuild.buildroot.net/results/92d74176e63b3a21dcde6e85c2f79f6335ff891a |     
  riscv64    |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/b944795a1eda34f735b638de1f548b09d903842a | ORPH
  riscv64    |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/846d2214fd4c6b76183dcba3659461a7d6fe8270 | ORPH
  riscv64    |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/fe63861faa81f2ef450e3531f5225be4810e0656 | ORPH
   armeb     |          cmocka-1.1.5          | NOK | http://autobuild.buildroot.net/results/9d5dbad137a9814896929ed3e46291f9bf36b5ad |     
    arc      | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/3db0cd1052e4fa979f488bb36f4b1e48967fdcaa |     
  sparc64    |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/0d6c2c90482aaf6568b76c76715d2e657e339dde | ORPH
   sh4aeb    |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/77196cea2537c1f1420bb1a4c9876144c033fefc | ORPH
   mipsel    |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/c25072214ab24d9381093f82cfb117ad402f87dd | ORPH
   s390x     |      docker-cli-20.10.14       | NOK | http://autobuild.buildroot.net/results/30a9a1e7534a60bc49f2886d26f0bc0bd779a80d |     
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/05f31304dd47853078926174d0753e1b753c553a | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/507610a517885d55804f8973fbd0050d58dd41a4 | ORPH
    arm      |          exempi-2.6.1          | NOK | http://autobuild.buildroot.net/results/68d12314fc789f8db629d6208c8bf92f8f833fe8 |     
    arm      |          exempi-2.6.1          | NOK | http://autobuild.buildroot.net/results/482727c377795f6008449d839cc4967c97173cea |     
    arm      |          exempi-2.6.1          | NOK | http://autobuild.buildroot.net/results/2bc58f3940783e88be1cb132da8a11a1a58143f2 |     
    arm      |          exempi-2.6.1          | NOK | http://autobuild.buildroot.net/results/2af55f12a5adc94ff6fabdfbd55c20bc606a32fa |     
   xtensa    |           frr-8.2.2            | NOK | http://autobuild.buildroot.net/results/57ebc98a46a4eabf96b4dcabea1adf7f39e2ebd9 |     
 aarch64_be  |           glog-0.6.0           | NOK | http://autobuild.buildroot.net/results/4584347de5bfbd4b92fe3bda0beb10b8cb5d1728 |     
    arm      |           glog-0.6.0           | NOK | http://autobuild.buildroot.net/results/3d7dd0a132f559780c10bccd5481316c2ebf02e2 |     
  riscv64    |        gocryptfs-2.2.1         | NOK | http://autobuild.buildroot.net/results/05f9490bc942082c385aac3187735d3dd0925981 |     
   mipsel    | google-breakpad-c85eb4a59b6... | NOK | http://autobuild.buildroot.net/results/ed650b778d5fd05ce88f7d93b3f67f78b02cd019 |     
  powerpc    |      host-gcc-final-8.4.0      | NOK | http://autobuild.buildroot.net/results/ceb16859f7422d56b6c5aba27c7c1b7f27126dfe |     
   mips64    |         host-go-1.18.3         | NOK | http://autobuild.buildroot.net/results/384ebe448ef2a09a1a756683ad4baf1e74edf1c1 |     
powerpc64le  |         host-go-1.18.3         | NOK | http://autobuild.buildroot.net/results/d69fcaa29ad90ff397cf6de0e9da9d40da4e2f24 |     
  mips64el   |         host-go-1.18.3         | NOK | http://autobuild.buildroot.net/results/6c1fcf8b79cc58245480c59aa51d30b7525203fa |     
  mips64el   |       host-gtest-1.12.0        | NOK | http://autobuild.buildroot.net/results/5561b7f03e3ef1129730442bec9c060d0b82489b |     
   s390x     |      host-harfbuzz-4.4.0       | NOK | http://autobuild.buildroot.net/results/8e785dcc81252fe46eafa0f8f9dcfbcaf081b04b |     
  aarch64    | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/40361e673388ea7247313217b9f5eb27dcb19804 |     
    arc      | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/ac807e15984c5b3b6b3bbaf379f57d2b97b5fd21 |     
    m68k     | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/27aad4e6a3584cc829d375162bfe38adea37ad56 |     
   sh4aeb    | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/5b5df7b91e0333c89722ef54d6933eb9416aaea6 |     
  sparc64    | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/f4327d05e3f5588f4d7e1bc7d7335aa70722e6e5 |     
   nios2     | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/bc6937f59833b69770a83b522f07f54a149c81c8 |     
   xtensa    | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/ce68cb357e5e67d4491d421b805cd89084a152a9 |     
   s390x     | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/bd3413acc93be79eeed200fd5dfea772e845cbca |     
powerpc64le  | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/0f49897548894c96852d28a4c524f8e230fd767a |     
  powerpc    | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/359260e12c1f144d8fdff2292f0b0e81e94e6d85 |     
   armeb     | host-spirv-llvm-translator-... | NOK | http://autobuild.buildroot.net/results/958217784d4e85ead71c8a290df91e76d72dea1d | ORPH
   armeb     |       igh-ethercat-1.5.2       | NOK | http://autobuild.buildroot.net/results/f0de3df4e3cce5585538f5db318e0386ab15215b |     
   x86_64    |         ipmiutil-3.1.8         | NOK | http://autobuild.buildroot.net/results/8c64fb75c4742a35052c39236b2ebb4f4a996d4f |     
    arm      |         iptables-1.8.8         | NOK | http://autobuild.buildroot.net/results/4a56050c8982dfaf5461b57e73264f8a024437f8 | ORPH
    arm      |         iptables-1.8.8         | NOK | http://autobuild.buildroot.net/results/4b467f42bcc5db2a2db9332ee1a876e429ee65a8 | ORPH
    arm      |         iptables-1.8.8         | NOK | http://autobuild.buildroot.net/results/706304e9c8d2f5271952b7203d32a5005eb02baa | ORPH
powerpc64le  |        jpeg-turbo-2.1.3        | NOK | http://autobuild.buildroot.net/results/e21c02c3a9e703f83820c571595f95f72ac40cf2 |     
microblazeel |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/9905d96aa33c3428453258fe5b3769d8e920580c |     
    arc      |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/14a061b5215a502820e9cc82d129f5d166b27c95 |     
microblazeel |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/6b41edd9637d595661f6b7a0277b743610777306 |     
 microblaze  |         libcurl-7.84.0         | NOK | http://autobuild.buildroot.net/results/f0efaf1ff539e08107f45f5bc75d453f58ece0f3 |     
 powerpc64   |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/c67b2e9d9b12d78c81dbada343c3bbfae4d5362e |     
  powerpc    |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/2440c2dea3a844ed7b690a7dacddaa454bc5b46b |     
 powerpc64   |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/b6e1af3c00ad36a5d3d00a7ae4ca74895bbc9e68 |     
   arceb     |        libglib2-2.70.4         | NOK | http://autobuild.buildroot.net/results/55938e07b681ddd039e34be48214379c10b18614 |     
   xtensa    |      libmicrohttpd-0.9.75      | NOK | http://autobuild.buildroot.net/results/cc358567d27ece7d249d9ad4478d2ef662d83002 |     
   sparc     |       libopenssl-1.1.1q        | NOK | http://autobuild.buildroot.net/results/10923915d4242375c90f4b241d7043117b7cdc3a |     
    arc      |       libopenssl-1.1.1q        | NOK | http://autobuild.buildroot.net/results/e9a136063bdd20595cea2f3bd0f004edd14e2bae |     
   arceb     |       libopenssl-1.1.1q        | NOK | http://autobuild.buildroot.net/results/c10be39ddecded2c87fd443131ec4d8667721b22 |     
  aarch64    |         libvpx-1.12.0          | NOK | http://autobuild.buildroot.net/results/1cb5ca7cf0760a80e567a0fcf1eb5895301663e6 |     
  sparc64    |         libvpx-1.12.0          | NOK | http://autobuild.buildroot.net/results/0d3426a9fe4d23e22aa5d243a6f55a708580c786 |     
 powerpc64   |         libvpx-1.12.0          | NOK | http://autobuild.buildroot.net/results/5abe1806616253439959bd6bd54705cf610ad7a5 |     
   mipsel    |         libvpx-1.12.0          | NOK | http://autobuild.buildroot.net/results/cf909b4f022f240e1e50f2ad3232bbe8b7eddfb2 |     
  mips64el   |         libzlib-1.2.12         | NOK | http://autobuild.buildroot.net/results/9536c5746ab63219f7041a7e1b438d12141fcec4 | ORPH
    m68k     |         libzlib-1.2.12         | NOK | http://autobuild.buildroot.net/results/3b9fc8e9c96bc9a56a2dcfec33edd021309bc0ad | ORPH
   s390x     |    linux-5.10.109-cip5-rt4     | NOK | http://autobuild.buildroot.net/results/5f6187860138372101ec177b2af254f7a6cde601 | ORPH
 powerpc64   |      linux-5.10.115-cip7       | NOK | http://autobuild.buildroot.net/results/b2eec2255dc1495f35f98fc17b1b0a249b8ae044 | ORPH
 aarch64_be  |         linux-5.17.13          | NOK | http://autobuild.buildroot.net/results/4f295fb86c2c165527d8928ee3a4cc591c38c1a1 | ORPH
 powerpc64   |         linux-5.17.13          | NOK | http://autobuild.buildroot.net/results/19e4d3f429fe941d364d1f9881375109e54f5339 | ORPH
 aarch64_be  |         ljsyscall-0.12         | NOK | http://autobuild.buildroot.net/results/031af34e143be610943c244ef9cef79eca0698bf |     
    or1k     |      lttng-modules-2.13.1      | NOK | http://autobuild.buildroot.net/results/4c1d8f61f99351ef199882cdd76fe4480e3d0277 |     
    sh4      | make: *** wait: No child pr... | NOK | http://autobuild.buildroot.net/results/5e88119d95dcd7277fbbe3fa2e5c0bb6d7ef7ff2 |     
    i686     |          mender-3.1.0          | NOK | http://autobuild.buildroot.net/results/f238e8bce9b91bf7350100cda11f0b4a328510dc |     
    i586     |         nodejs-16.15.0         | NOK | http://autobuild.buildroot.net/results/b3f0bcd3f5fd024992e3e1c952166fa5362843f6 |     
   armeb     |           opus-1.3.1           | NOK | http://autobuild.buildroot.net/results/41896ffeb18ed61b65cd75fd65954b4e076902cc | ORPH
    or1k     |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/9c6fd632194eedbdcf03ab7a4af06b125684f081 |     
   nios2     |  perl-crypt-openssl-rsa-0.31   | NOK | http://autobuild.buildroot.net/results/6625daef1a9d44b9925aecd6e98e3a59bc2ce8f4 |     
   mips64    |  perl-crypt-openssl-rsa-0.31   | NOK | http://autobuild.buildroot.net/results/8875cd5096c056adbce67a88aa06b2e6518c9064 |     
    or1k     |           php-8.1.7            | NOK | http://autobuild.buildroot.net/results/0461546f299529319cbcc1f7a2dc530439a74767 |     
    sh4      |           php-8.1.7            | NOK | http://autobuild.buildroot.net/results/8e772e37bd3890cb2f1b0f4c8bc4401957e36d9b |     
    arc      |           php-8.1.7            | NOK | http://autobuild.buildroot.net/results/16da32caf87e7af5163218d2411ab89af2745d75 |     
    or1k     |           php-8.1.7            | NOK | http://autobuild.buildroot.net/results/b2215d9e43991a7f2b1b4883838bee3809e699d9 |     
   xtensa    |        poppler-21.12.0         | NOK | http://autobuild.buildroot.net/results/005d6f084cda2afbbe766e4e9db93592031f7f27 |     
   mips64    |           pppd-2.4.9           | NOK | http://autobuild.buildroot.net/results/d50cedcf51d0c1c558d2c95488aa6fffab91acf0 | ORPH
   nios2     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/57098553535084a8b843d4fb218934c907b16259 |     
    sh4      |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/438e9a9d40fe84ee1496590dfa7046867e2479c6 |     
    or1k     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/d9c0ba1104c3d7ec61d77f39dbfb28a47a2108db |     
   mipsel    |           refpolicy            | NOK | http://autobuild.buildroot.net/results/f53b0fcc4a53bcb024e31b336454c5f9c2d2218c |     
 aarch64_be  |           refpolicy            | NOK | http://autobuild.buildroot.net/results/b9c5cfaa575a1fb719a77059faf9f34568bb7a4f |     
microblazeel |           refpolicy            | NOK | http://autobuild.buildroot.net/results/c799e839116653a78b6a78c08f6696f113451855 |     
    or1k     |           refpolicy            | NOK | http://autobuild.buildroot.net/results/768ed7795305616e9abc8156147bd0d1ac032865 |     
    sh4      | rtl8812au-aircrack-ng-37e27... | NOK | http://autobuild.buildroot.net/results/eec62e2ea6b4eb7a8f46ea3a210620c3b71e5a5a |     
    arc      |           ruby-3.1.2           | NOK | http://autobuild.buildroot.net/results/fd8877d0c5d1ccf595e825940fd9eadea35d2b40 |     
    sh4a     |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/e8d59635ec4a77b2d1fcaf5398307fff5ade4962 | ORPH
   x86_64    |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/cf1fc60b8fa4536c30aba3dc84dc8dd3da514285 | ORPH
 powerpc64   |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/cbc961313cbe029246aed04ee49553f16aae9ca7 | ORPH
  aarch64    |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/5b58168affe2e6454f31e70b23a2ba8fc718a2da | ORPH
   nios2     |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/957de0732893c21407cbb551d676d4778741b245 | ORPH
powerpc64le  |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/31532b3026c60fbdad59ca8461c67fd4d5fa2997 | ORPH
   nios2     |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/e6eb8500ffcbe19f8ed6fc3298d11a166cc42c7e | ORPH
powerpc64le  |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/2171d1b6995f8bd7b3642a7a35bc1e1652c12057 | ORPH
 aarch64_be  |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/c871a67ef6d7e825c87b3eb184b78c4422251bf5 | ORPH
  powerpc    |          speex-1.2.1           | NOK | http://autobuild.buildroot.net/results/7e813b4e1a385889a3cc6276af56ad8d1e1e35b8 | ORPH
 microblaze  |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/3c51651f8ec834db4b5a9842c4fe6ff898a20966 | ORPH
powerpc64le  |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/f028d8195216b0ea4b37ce41269c0422bde03505 | ORPH
    mips     |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/b04eed204db1ad6491323e0dd55308d6e401d9f7 | ORPH
  sparc64    |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/bb08b17bb4b08bfdaeaf800ebe6ce8a778df49f1 | ORPH
    m68k     |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/01a858d9a250aae7e283ec3fcaf590fb95cc7692 | ORPH
 aarch64_be  |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/dbf0b97335428ed89c76b007bbf2cb91fdc8d799 | ORPH
   mipsel    |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/f1793732e4c0a94625de630bd61ac49e87313a58 | ORPH
powerpc64le  |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/74202eab4fa0ad61db06db07da7f311f93793127 | ORPH
    arc      |         speexdsp-1.2.1         | NOK | http://autobuild.buildroot.net/results/1bb867143f5bf02634dbbb6e1a328ed1e272118b | ORPH
    arm      |        swupdate-2022.05        | NOK | http://autobuild.buildroot.net/results/ae89350ba530d647b14adad5570e641df53041b0 |     
    arm      |        swupdate-2022.05        | NOK | http://autobuild.buildroot.net/results/282009f0f4c086617f36f502447b7220b772b6c1 |     
   sparc     |          tor-0.4.7.8           | NOK | http://autobuild.buildroot.net/results/5a13d6a7211f40571798b5ca849b95d6a4ba37d9 |     
  riscv64    |          tor-0.4.7.8           | NOK | http://autobuild.buildroot.net/results/2867c9d01538d24b5995bd14ada4b6f3d54c45e9 |     
  mips64el   |          tor-0.4.7.8           | NOK | http://autobuild.buildroot.net/results/ac6540545f3878d554530ae41ab162d88c15c43b |     
  powerpc    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/f03179df08e239ec83c4fba91c3e319c32538066 |     
    arm      |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/a458e7f7fcba07797974c072b93e2f1ea92572b4 |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/2d50c089468734d1e28a9439a6179c0c8146a72c |     
  riscv64    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/fe40eaff4c6bd37d339fb6f0eef1d549bd993b7e |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/f9eba47df10d02467c7a315cfbd59e089b933526 |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/c992a213d0e466965bae9dd7588846b0e7238079 |     
    arm      |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/8775ea33e49667664a28b0d99722407a66da4fb0 |     
  riscv64    | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/dda56a6996e54225a0c7ccba8107ab30d9952a2b |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/64cb78d613994b4974da617c10dccbf746a2fb51 |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/2c527a26b194d54301c429d36cf8463520f116fa |     
 microblaze  |            unknown             | NOK | http://autobuild.buildroot.net/results/1d1237373cdf48afd2b0c0f1ecf53b9406520fba |     
  riscv32    |            unknown             | NOK | http://autobuild.buildroot.net/results/8a70b00e2e7a91b646881e41e85771c37caad607 |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/2d550993b53224778d0f3fba9061b45c64618172 |     
   mips64    |            unknown             | NOK | http://autobuild.buildroot.net/results/e6a8dfc57656dd44111e2d54bae393eed92fe020 |     
   arceb     |            unknown             | NOK | http://autobuild.buildroot.net/results/74acaddd86336016d46405325ad5434b80d12676 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/8ab9b62a18fe97c67068d23e215f25e0cc5e9ecc |     
    i586     |            unknown             | NOK | http://autobuild.buildroot.net/results/7e928f23ac94590c99c53e10a6ba0c523aa087c9 |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/017d5b4361e3d76d3883a7f81fb8eda08296f1bd |     
   armeb     |            unknown             | NOK | http://autobuild.buildroot.net/results/bc8ffab0c1a9927b813847dbcb994bcb8951dd5b |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/047ff93e035703c7ee698c00d5c174ed855bcde2 |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/b52901289b3a5c705d61b1ca3ae65c0614582325 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/8256453fdefc95cc06c97d162f6b7b5ecc619add |     
    arc      |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/8f48fc6fff375c83dc5930a55d37b8d9acd63bd1 |     
  aarch64    |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/31ea2016f9232f336452f9012d4891d0a3469e90 | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/ab7d8edc36de8061f36b2efda17825f996a20d93 | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/c98457e90cd7d30bcfb343070ee9cdccfc97a4ba | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/6c9b28e53dbfe92122aa784be3bb070b49935716 | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/fa11547d8371320dd485eba9b2bb8bda781edb4a | ORPH
  aarch64    |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/0b6c3c064abf1c623a747eba97e72d17d40aac82 | ORPH
microblazeel |           zstd-1.5.2           | NOK | http://autobuild.buildroot.net/results/1447dbd11e6f871077dac4b975fbb3ca89cfa62c |     


Classification of failures by reason for 2022.02.x
--------------------------------------------------

           libfreeimage-3.18.0 | 1 


Detail of failures for 2022.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  powerpc    |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/a357cc71111bf9e7da3336e540f9971183959fef |     


Classification of failures by reason for 2022.05.x
--------------------------------------------------

host-pahole-73383b3a39afe86... | 4 
              swupdate-2022.05 | 4 
                 uclibc-1.0.41 | 2 
                       unknown | 2 
                       cfm-0.3 | 1 
                  exempi-2.6.1 | 1 
                     gmp-6.2.1 | 1 
                   gstd-0.14.0 | 1 
         host-gcc-final-10.3.0 | 1 
host-gcc-final-arc-2020.09-... | 1 
                  jack2-1.9.20 | 1 
           libfreeimage-3.18.0 | 1 
               libglib2-2.70.4 | 1 
          libmicrohttpd-0.9.75 | 1 
                libressl-3.5.2 | 1 
                libzlib-1.2.12 | 1 
                mongodb-4.2.18 | 1 
                    musl-1.2.3 | 1 
         mxs-bootlets-10.12.01 | 1 
                nodejs-16.15.0 | 1 
               protobuf-3.20.1 | 1 
                    qemu-7.0.0 | 1 
rpi-userland-14b90ff9d9f031... | 1 
rtl8723bu-19b4bdc05483a1e79... | 1 
                   tor-0.4.7.7 | 1 
                  zabbix-5.4.9 | 1 
                 zlib-ng-2.0.6 | 1 


Detail of failures for 2022.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |            cfm-0.3             | NOK | http://autobuild.buildroot.net/results/cee5b777ea91c6b5288fd90527d11b1bf7bd4e23 |     
    arm      |          exempi-2.6.1          | NOK | http://autobuild.buildroot.net/results/fd842ae7360c1c959fb6ba6ed33e76aae7fc4cad |     
  riscv64    |           gmp-6.2.1            | NOK | http://autobuild.buildroot.net/results/6ea061bc62b6929086c054f1000feb93e6bf1d21 | ORPH
   sparc     |          gstd-0.14.0           | NOK | http://autobuild.buildroot.net/results/8ba9619f4ca7ae49b4548db48961240496fbd483 | ORPH
  powerpc    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/0a343eda0b3d8a852d87ccf507a82fd8c7c42b14 |     
   arceb     | host-gcc-final-arc-2020.09-... | NOK | http://autobuild.buildroot.net/results/5680bf2940941d53533c2ea7a6fb9d4195788c7c |     
    mips     | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/193586a2810fd78609aa6f1f1ae2faefa32d9814 |     
   sparc     | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/61df23f897f13a43dad570ef36b6ea7026cba13e |     
    arm      | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/aa39991df2fa391a79bb4015b847e689184242af |     
   s390x     | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/44be4df61b5f31d0088f26d473e0fe23c2406ed8 |     
    m68k     |          jack2-1.9.20          | NOK | http://autobuild.buildroot.net/results/7351b744c56b099245f806efefddeab41bf4a248 |     
  riscv64    |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/faa874d7bcaf0f5356fdb61e6717e1edfc22c0a8 |     
    arc      |        libglib2-2.70.4         | NOK | http://autobuild.buildroot.net/results/0368f5a8332ea9ab9a27b4fb3e07693283ffbda0 |     
   xtensa    |      libmicrohttpd-0.9.75      | NOK | http://autobuild.buildroot.net/results/c1d3ac17b48050d1cc3bbb7461d18436171618db |     
  mips64el   |         libressl-3.5.2         | NOK | http://autobuild.buildroot.net/results/c9e00d02d72eff6e8627e5efe49e764eece26ae5 | ORPH
    m68k     |         libzlib-1.2.12         | NOK | http://autobuild.buildroot.net/results/679e5bf6274e135c69b87844c9ca28df85530461 | ORPH
    arm      |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/f4b996d4806417ca078a2c7c88f33c8de9674d49 |     
  powerpc    |           musl-1.2.3           | NOK | http://autobuild.buildroot.net/results/c8cabcb02058e49058fb9b768529b12063a6b5ad |     
    arm      |     mxs-bootlets-10.12.01      | NOK | http://autobuild.buildroot.net/results/202c52341dfadb35f153585ee7f894f744268e76 | ORPH
   mipsel    |         nodejs-16.15.0         | NOK | http://autobuild.buildroot.net/results/cfc8e10041dc5947024d5603a0e8f12d89e11e9f |     
   nios2     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/2890ca6096d1737b9454f6558f5536a1ca8cdb2f |     
    i686     |           qemu-7.0.0           | NOK | http://autobuild.buildroot.net/results/5749045b8abeb8e0709278c92dced03ca8914ccf |     
    arm      | rpi-userland-14b90ff9d9f031... | NOK | http://autobuild.buildroot.net/results/4082b2d1e797ca66500718f323c8601b3592774a |     
  aarch64    | rtl8723bu-19b4bdc05483a1e79... | NOK | http://autobuild.buildroot.net/results/84b2a2027189c4fedcb4a6c2626912233fc4c612 | ORPH
  mips64el   |        swupdate-2022.05        | NOK | http://autobuild.buildroot.net/results/8044e68329a1fb9ff321d1acab131ee20f865b8e |     
    arm      |        swupdate-2022.05        | NOK | http://autobuild.buildroot.net/results/a04fac4d30574978f95a0556bfca05dde9d84766 |     
    arm      |        swupdate-2022.05        | NOK | http://autobuild.buildroot.net/results/768f1ecb1ef1bad4a111759fb2072ebaf4c210ba |     
    m68k     |        swupdate-2022.05        | NOK | http://autobuild.buildroot.net/results/df2940e9da10351c831aad5878db4971f9115336 |     
    m68k     |          tor-0.4.7.7           | NOK | http://autobuild.buildroot.net/results/8dc293af63886d675767f049bcfbc1ec60f86f36 |     
  powerpc    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/556e6afe75507407d5c4be9147778ee845731592 |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/cfc61524427d07dcab2be64f540ecedccc1af017 |     
 aarch64_be  |            unknown             | NOK | http://autobuild.buildroot.net/results/b8e037914bb314ef0004449965e144e33ebb1d23 |     
   sh4aeb    |            unknown             | NOK | http://autobuild.buildroot.net/results/96b86d2d4cd1d8aa50302ed24bb564c5f2309624 |     
 powerpc64   |          zabbix-5.4.9          | NOK | http://autobuild.buildroot.net/results/24c30dd9f3bcffde4c3b6a092c41baa108d0dce4 |     
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/2b0a232c2c7fd77cd0e6578659a674deee322b11 | ORPH



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
