Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C6D1CE7AF8
	for <buildroot@archiver.kernel.org>; Thu, 28 Sep 2023 05:39:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CA2F642237;
	Thu, 28 Sep 2023 05:39:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CA2F642237
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c4GA9Rq3sWmE; Thu, 28 Sep 2023 05:39:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 37FCA42239;
	Thu, 28 Sep 2023 05:39:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 37FCA42239
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 909241BF275
 for <buildroot@lists.busybox.net>; Thu, 28 Sep 2023 05:39:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 30EBA61084
 for <buildroot@lists.busybox.net>; Thu, 28 Sep 2023 05:39:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 30EBA61084
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kBkoRJl7KW_8 for <buildroot@lists.busybox.net>;
 Thu, 28 Sep 2023 05:39:36 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8F08761051
 for <buildroot@buildroot.org>; Thu, 28 Sep 2023 05:39:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8F08761051
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9C798FF80A
 for <buildroot@buildroot.org>; Thu, 28 Sep 2023 05:39:32 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Thu, 28 Sep 2023 05:39:32 -0000
X-GND-Sasl: bot@bootlin.com
Message-Id: <20230928053937.30EBA61084@smtp3.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1695879572; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=BzpzS+9U+m7asrHkCXu7jPnFYDUF+z7N2DpodGoWqL8=;
 b=gL1QSPuioHLAeZUXxmJQFh/7NKY6dOk+smd8T2gNdyKVJ3mjcCO5VlD5o+1UQkvCEE+H/M
 3CBYfxU+hiivBlvj1RCajGBxNJZWPtY79uJBrKwA7bVLr8I4bfsCDNPt5Y1mKZ9w83lG0t
 vtr1Etif2BNvyvaL+dC8kmZqnjQrkjqzzP/4cjOhD0hWaLnsxMdOMt7NaECOh+6hRXG0hb
 iydPiVDMtwimGKXcM6zl/P7Gq9nHorKgo8Ga02+KalAo2ZiCJnp6fD7Us3gVFHv96bZGDV
 k7S+ZFdCREhlQAdPT7s5Hd+UP73rzHBLCLnsRm5EKb/QQXuEkLANBgswvBan9Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=gL1QSPui
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-09-27
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

Autobuild statistics for 2023-09-27
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  | 11  | 14  |  0  | 25  |
  2023.08.x  | 11  |  5  |  1  | 17  |
    master   | 79  | 62  |  2  | 143 |

Classification of failures by reason for master
-----------------------------------------------

                       unknown | 8 
check-11970a7e112dfe243a2e6... | 4 
  gobject-introspection-1.76.1 | 4 
             alsa-utils-1.2.10 | 3 
              host-rust-1.71.1 | 3 
                  linux-6.4.14 | 3 
                    proj-8.1.1 | 3 
               alsa-lib-1.2.10 | 2 
                   bird-2.0.12 | 2 
                elfutils-0.189 | 2 
               apcupsd-3.14.14 | 1 
                    brltty-6.5 | 1 
              containerd-1.7.6 | 1 
                 dc3dd-7.2.641 | 1 
                        ffmpeg | 1 
                  ffmpeg-4.4.4 | 1 
fs/jffs2/jffs2.mk:71: /home... | 1 
glibc-2.37-2-g9f8513dc64119... | 1 
         gobject-introspection | 1 
google-breakpad-c85eb4a59b6... | 1 
         host-gcc-final-12.3.0 | 1 
       host-gcc-initial-13.2.0 | 1 
        host-sentry-cli-2.20.3 | 1 
               host-wine-8.0.2 | 1 
               libglib2-2.76.1 | 1 
                   libnl-3.7.0 | 1 
     linux-5.10.162-cip24-rt10 | 1 
                   linux-tools | 1 
               madplay-0.15.2b | 1 
mmc-utils-613495ecaca97a19f... | 1 
               onevpl-2023.3.1 | 1 
                oprofile-1.4.0 | 1 
               pcsc-lite-1.9.9 | 1 
                   perl-5.36.1 | 1 
pistache-3ec9d7c4f8b828fdd3... | 1 
             stress-ng-0.15.07 | 1 
             strongswan-5.9.11 | 1 
ulog-0389d243352255f6182326... | 1 
                xenomai-3.0.10 | 1 
                    zeek-4.1.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |        alsa-lib-1.2.10         | NOK | http://autobuild.buildroot.net/results/a0899b6bc0d7774a9431a6ff9fbe5dfe1cd3cb87 |     
   mips64    |        alsa-lib-1.2.10         | NOK | http://autobuild.buildroot.net/results/e40d75f9db53c3c8dff2a1fdb3d12dbfd145fa2e |     
  riscv32    |       alsa-utils-1.2.10        | NOK | http://autobuild.buildroot.net/results/5d173837fb797caa906867bd33177546d326e43a |     
   nios2     |       alsa-utils-1.2.10        | NOK | http://autobuild.buildroot.net/results/3b8a55edbce12fe43f7301684b693ed1156da315 |     
   arceb     |       alsa-utils-1.2.10        | NOK | http://autobuild.buildroot.net/results/bfde1d5c3067e98d983ce1eebc1560bd13d00b8a |     
    i686     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/dc6ed9a195735d52f4f273bc258e92c8d652b202 |     
   mips64    |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/e053e00e5488d424da7017011fde771a3732dd41 |     
   x86_64    |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/4ed66b0ce9cb2f6d11ede6f232729e8d8952d056 |     
    sh4      |           brltty-6.5           | NOK | http://autobuild.buildroot.net/results/2402ab4e67a986afa68b4e00f9815cc6c131be38 |     
   arceb     | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/453e19887b0e9c2b967df88e63d98628067662d4 | ORPH
  riscv64    | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/4511ff9736c67f8cd21abca3f13f86acb1eea6ac | ORPH
  riscv64    | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/087c4fd88e1edcfb2c655f5fa7c3f3d183a5a66a | ORPH
   xtensa    | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/7e4da7bb5263dbcd706dbe8af53c842ec484af74 | ORPH
  riscv64    |        containerd-1.7.6        | NOK | http://autobuild.buildroot.net/results/81b55c65ce32843758253c6d38caa24cb0a3514b |     
    or1k     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/201919d6869cc2565824fc7a5c9b53d477233537 | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/1528d78cdc4480e39dd21b760e6003505c99dd2a | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/a47e6b4b7f3c8d3103a6f09769a4fd3b15a1f3d3 | ORPH
    i686     |             ffmpeg             | TIM | http://autobuild.buildroot.net/results/7cd6d9e76e81d1892ff8a017c36d94f14e14dfc2 |     
   arceb     |          ffmpeg-4.4.4          | NOK | http://autobuild.buildroot.net/results/07b3b314c42050431fe3e9ef712e47a7399245f2 |     
   nios2     | fs/jffs2/jffs2.mk:71: /home... | NOK | http://autobuild.buildroot.net/results/b578288a4480211391dab43305b6cba022fe1511 |     
 powerpc64   | glibc-2.37-2-g9f8513dc64119... | NOK | http://autobuild.buildroot.net/results/730c5f8933fe8acffe7855825aef0bb732eec92e |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/23fff0777e2ca14994e474377f00a7e64d20b41e |     
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/e882265b6b80a0b6bfacede8cbd2c9c00a3e0e11 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/0a405aa3b1bf59b8e2b65864b95ef9166ce724b8 | ORPH
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/72d3cdea7ab4923b29c3c900c843da6db773c677 | ORPH
   s390x     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/fe4f525c2a637f24ce419a28b0567cf393787351 | ORPH
    mips     | google-breakpad-c85eb4a59b6... | NOK | http://autobuild.buildroot.net/results/5d5cb81af48254cf4c12aa2dce65e9bf4a8945f0 |     
 microblaze  |     host-gcc-final-12.3.0      | NOK | http://autobuild.buildroot.net/results/d79b5a6477305a5cda73f37ee9673ebaa91e1136 |     
    sh4a     |    host-gcc-initial-13.2.0     | NOK | http://autobuild.buildroot.net/results/c4d7eeef3ae5a9b9eb5fcb49e6d4b4e85155365f |     
  sparc64    |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/7addfb9f4b91ef9ccea7fbda0c45d62efb838c40 |     
   x86_64    |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/f61f5a93886a0ccbc96a1183023a465eead3e154 |     
  aarch64    |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/94ff18a5a6ebc7c979862e2e79d6ec36f80ead7c |     
powerpc64le  |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/d9981f2a09238601c46f388a3da02dfa5ad3b278 |     
    i686     |        host-wine-8.0.2         | NOK | http://autobuild.buildroot.net/results/6c0f104367e490e957fc4c49cb870c71b711d4a1 |     
    arc      |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/88a2b3e975dd467fd3e546f5409eaea71c138f12 |     
powerpc64le  |          libnl-3.7.0           | NOK | http://autobuild.buildroot.net/results/66e593fccc575a22f45c9999751c92998bb44f8c | ORPH
   armeb     |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/beb68d3a44b40f4f6e940923d4f70de58df3d032 | ORPH
   sh4aeb    |          linux-6.4.14          | NOK | http://autobuild.buildroot.net/results/5e61eb602e8873b8dada3b19a6986e11d7eb9c57 | ORPH
 powerpc64   |          linux-6.4.14          | NOK | http://autobuild.buildroot.net/results/7dcfb572c94513d04b1454c408b5bcb5e54a6e1e | ORPH
    mips     |          linux-6.4.14          | NOK | http://autobuild.buildroot.net/results/93d787d9f210094a52c89fde4c6e32e6ce86d1d2 | ORPH
 aarch64_be  |          linux-tools           | NOK | http://autobuild.buildroot.net/results/5d2735a5fc7c78588d7daa39416be15219e277f1 | ORPH
   armeb     |        madplay-0.15.2b         | NOK | http://autobuild.buildroot.net/results/edc7149f06355d9c48ff573e77f6dfba82a760a6 | ORPH
 aarch64_be  | mmc-utils-613495ecaca97a19f... | NOK | http://autobuild.buildroot.net/results/f329026c1172aa526934fdb5e71241695edca422 |     
 powerpc64   |        onevpl-2023.3.1         | NOK | http://autobuild.buildroot.net/results/059a8581fb809488ad6fa3183874395ebf3f0926 |     
   sparc     |         oprofile-1.4.0         | NOK | http://autobuild.buildroot.net/results/1ecb8b3cd291ecc5c897305293339f36e913b8aa |     
powerpc64le  |        pcsc-lite-1.9.9         | NOK | http://autobuild.buildroot.net/results/b9a3ab12ae9b929e6b2d2af5ca20538b034c45af | ORPH
   mipsel    |          perl-5.36.1           | NOK | http://autobuild.buildroot.net/results/30b8f0a43c994d6bf044e709f6297a2fc037e3ac |     
 microblaze  | pistache-3ec9d7c4f8b828fdd3... | NOK | http://autobuild.buildroot.net/results/be15a86a8974cc06f099a36d03c968a8aa9b8435 | ORPH
  sparc64    |           proj-8.1.1           | NOK | http://autobuild.buildroot.net/results/30c4a202d94138c9893ddc789298245821dbd8a7 |     
powerpc64le  |           proj-8.1.1           | NOK | http://autobuild.buildroot.net/results/13b02dff3d0ed7a0dd2ace2ef7b3e2f762baa2f4 |     
  sparc64    |           proj-8.1.1           | NOK | http://autobuild.buildroot.net/results/9c13540c4cdd28654859a12d0361bb6ade756bf3 |     
    or1k     |       stress-ng-0.15.07        | NOK | http://autobuild.buildroot.net/results/2a7c9d4c8d10d2ce44f68b01361a71e5fe8a3001 |     
powerpc64le  |       strongswan-5.9.11        | NOK | http://autobuild.buildroot.net/results/96bcc606a3b90763ceeac73d335fc7f2430fed0c |     
 aarch64_be  | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/1fd3d70510a84028cbaa4bf2647a10fd1e24817c |     
    i686     |            unknown             | NOK | http://autobuild.buildroot.net/results/e8e3277bcc76901cb107c2a6a21b73c7c9ecd194 |     
 aarch64_be  |            unknown             | NOK | http://autobuild.buildroot.net/results/89eb16168319c1e0b6d6ff613db2a39f14f80375 |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/869bbaf18e1a32527673c6c14de64310c009bf17 |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/79f6d8db8c02afceab9daf46e8d86d95c4efe2f6 |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/86eb27eef9459b867797914d6db6e2e735179aab |     
   sh4eb     |            unknown             | NOK | http://autobuild.buildroot.net/results/5d00da0516d2c5c418a4407da77888eecfe2f8de |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/e2b0265239b0d229efb2a733be455b04a2c21854 |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/dab4f674dcf97429ca9817e6285f539e69e18cd0 |     
   mipsel    |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/49078f2ccfa5d8160451622cdf0779988a401daf |     
microblazeel |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/296c0fd6d3724388992bb96889c8843f13f6afbd |     


Classification of failures by reason for 2023.02.x
--------------------------------------------------

                       unknown | 4 
             strongswan-5.9.11 | 2 
                   bird-2.0.12 | 1 
                  check-0.15.2 | 1 
                elfutils-0.186 | 1 
  gobject-introspection-1.72.0 | 1 
               libglib2-2.72.3 | 1 
               openblas-0.3.21 | 1 
       python-stack-data-0.6.2 | 1 
                xenomai-3.0.10 | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mipsel    |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/bf13cc63051ec98c85060d914066c57066e036f1 |     
   arceb     |          check-0.15.2          | NOK | http://autobuild.buildroot.net/results/86ec44c43a51af1a93820e8f7b7d94ac990f1c59 | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/6713bca37667b194a7a78b83c5fa5bbce5853584 | ORPH
 microblaze  |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/8121607fe9bbb656e9ea47ae8ffcc327538856cd | ORPH
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/45ee642b4786a22e9c0e73dffb5cfc5e6a4463b5 |     
   mips64    |        openblas-0.3.21         | NOK | http://autobuild.buildroot.net/results/c07865d11f8a2b0f16bc110bf1ac4f2a917b93a6 |     
   s390x     |    python-stack-data-0.6.2     | NOK | http://autobuild.buildroot.net/results/746d3796b1a3261c9dcc431ff78d771702a375aa |     
    i686     |       strongswan-5.9.11        | NOK | http://autobuild.buildroot.net/results/885184779c8d4cc65d1315316e8bc481e619bec7 |     
   x86_64    |       strongswan-5.9.11        | NOK | http://autobuild.buildroot.net/results/e87cd99b97389aff6acd84638eec734978b05cf9 |     
    mips     |            unknown             | NOK | http://autobuild.buildroot.net/results/414ab8410bfcf8ab87a93bf94cb51ae31dba5246 |     
   mips64    |            unknown             | NOK | http://autobuild.buildroot.net/results/549a10e6e128b4802ecce2871f769d5d2820ad49 |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/986b3b166fb3567122e4633d9296c67bb62034c1 |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/248d60fa3e687dc0435de4ea69f2734cdb1b125b |     
microblazeel |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/57667f8e290b030fe72a14b515d7c0f5f0281130 |     


Classification of failures by reason for 2023.08.x
--------------------------------------------------

                 coreutils-9.3 | 1 
         gobject-introspection | 1 
             host-delve-1.20.2 | 1 
      libabseil-cpp-20220623.1 | 1 
                  linux-6.4.14 | 1 
                       unknown | 1 


Detail of failures for 2023.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    mips     |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/745b46c505c5a5a929aba37b6ae66187fbe2060b | ORPH
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/f46684ffed0c21d872526f10e420fd04d1c8708f |     
  aarch64    |       host-delve-1.20.2        | NOK | http://autobuild.buildroot.net/results/d6e61f53996e6dad55da6be2df7b72b6d3f58ba1 |     
  mips64el   |    libabseil-cpp-20220623.1    | NOK | http://autobuild.buildroot.net/results/3e38d9deb1984d0f635df7b6ce60d27bba6a49cc |     
  aarch64    |          linux-6.4.14          | NOK | http://autobuild.buildroot.net/results/420e929b22b5ac498d696a5bbd78a51b9ea88974 | ORPH
  riscv32    |            unknown             | NOK | http://autobuild.buildroot.net/results/c7a1c2ec5eadab5de69a93670783444af977ee4e |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
