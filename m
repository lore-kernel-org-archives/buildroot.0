Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF44DC25B75
	for <buildroot@archiver.kernel.org>; Wed, 29 May 2024 04:01:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A4BE3820CC;
	Wed, 29 May 2024 04:01:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DMr06nkIq1MK; Wed, 29 May 2024 04:01:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2AF69820C3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2AF69820C3;
	Wed, 29 May 2024 04:01:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3FAE91D3066
 for <buildroot@lists.busybox.net>; Wed, 29 May 2024 04:01:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 24BA940142
 for <buildroot@lists.busybox.net>; Wed, 29 May 2024 04:01:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TerDzxgTkNdv for <buildroot@lists.busybox.net>;
 Wed, 29 May 2024 04:01:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 758F140124
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 758F140124
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 758F140124
 for <buildroot@buildroot.org>; Wed, 29 May 2024 04:01:44 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D7EF320007
 for <buildroot@buildroot.org>; Wed, 29 May 2024 04:01:41 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Wed, 29 May 2024 04:01:41 -0000
X-GND-Sasl: bot@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1716955301; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Qvktw45kRG+EQwmbrWN2qGSvXzWywMzeeDwpkQiriHg=;
 b=kzKRQWtvEUErqsn5T/nK/xMqxdDjuQhd6bF677xCJLwKEIHjEQu1h7TZXN98D5qTCw2kLm
 ZgyCpJc6ObG+eO1e15/MCTU16eMSe7thFAx4KJWR7ZfaDckbH6VEi+uz6NbUvWEZiWX6hJ
 qXHWXRA0IMm9u5zrAov8Zp+1W/mzIqGMZWgH2icBfurpJvtZ9V3uBzINJfXHXCAUoDRuqs
 Nr/r3Z/mJjAZmtD/YIUQ2pTJAc5x9Xr3MTiMposEnB+4l9gQnoJ1/D8Hy0WAD3XnjkMIWc
 WNwk0Le78qoPFcgxaXwh2yj8K2QQoOuKN6ivkW+xMpU7H9nqghyvRv2sBLSUqA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=kzKRQWtv
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2024-05-28
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
Message-ID: <20240529040141.niDJZXeAIDfD5MyxwmEr9nUXDJyPrXCQdGTmtntfB94@z>

Hello,

Autobuild statistics for 2024-05-28
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  6  |  7  |  0  | 13  |
    master   | 28  | 55  |  0  | 83  |

Classification of failures by reason for master
-----------------------------------------------

                       unknown | 8 
                  ffmpeg-6.1.1 | 3 
ibm-sw-tpm2-5452af422edeff7... | 3 
                libressl-3.8.4 | 3 
                 shadow-4.14.5 | 3 
                elfutils-0.189 | 2 
              libopenssl-3.3.0 | 2 
         python-remi-2022.7.27 | 2 
                    bat-0.24.0 | 1 
                    bcc-0.29.1 | 1 
                   bird-2.0.12 | 1 
                  boost-1.83.0 | 1 
                 coreutils-9.3 | 1 
           crucible-2023.11.02 | 1 
                     frr-8.5.4 | 1 
                 gnuplot-6.0.0 | 1 
             gnuradio-3.10.7.0 | 1 
  gobject-introspection-1.76.1 | 1 
google-breakpad-f49c2f1a202... | 1 
             host-delve-1.22.1 | 1 
ivi-homescreen-5ab78a19e95c... | 1 
kvmtool-4d2c017f41533b0e51e... | 1 
                  libbpf-1.1.0 | 1 
          libcamera-apps-1.2.1 | 1 
                libgeos-3.12.1 | 1 
               lightning-2.2.3 | 1 
           mediastreamer-4.4.8 | 1 
                    ncmpc-0.49 | 1 
                 openal-1.22.0 | 1 
                 openssh-9.7p1 | 1 
   openvmtools-11.3.5-18557794 | 1 
                    proj-9.3.0 | 1 
          python-grpcio-1.60.0 | 1 
           python-numpy-1.25.0 | 1 
           python-zlmdb-22.6.1 | 1 
             util-linux-2.39.3 | 1 
                    zeek-4.1.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |           bat-0.24.0           | NOK | http://autobuild.buildroot.net/results/79835220e3d26b75f4b540f3ebf1034279368b07 |     
   x86_64    |           bcc-0.29.1           | NOK | http://autobuild.buildroot.net/results/0db173bf75d562dd401f5ac4343b07aef0225752 |     
   mipsel    |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/14632d23ad1df62ff77de5d73f70b637b77772fa |     
    arc      |          boost-1.83.0          | NOK | http://autobuild.buildroot.net/results/3de751601f594596e26c9c6e672a1fbecb381f30 |     
    m68k     |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/37cc2e7aa6486aa304a3390d525484d85e4e1bb3 | ORPH
  riscv64    |      crucible-2023.11.02       | NOK | http://autobuild.buildroot.net/results/c1d16eee838422ae556a4ed76ab1aa3559237da7 |     
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/9b5c5c26eca957bbf1df7dba1dc569fe12acb021 | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/a34944f668e9e4091b80f8f4a52afe03021fdf5c | ORPH
    arc      |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/51dc0c76e26b7772eee511e54244e6cd694e35c8 |     
    arc      |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/91766647207ba02b206f20352970004894241219 |     
    arc      |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/63254ccb7edae6ce4eadd8660c451f400080e520 |     
    arc      |           frr-8.5.4            | NOK | http://autobuild.buildroot.net/results/1795f30d8af987002589b9094d453c0986016019 |     
    or1k     |         gnuplot-6.0.0          | NOK | http://autobuild.buildroot.net/results/c4432c517b16bbebd091f3bc57d1a73c4aeebc64 |     
  aarch64    |       gnuradio-3.10.7.0        | NOK | http://autobuild.buildroot.net/results/c99f60e3c8a59f3362f45bfcf6198452ffb6ac0f |     
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/30f0c14c85cd7f0ebd02261f734f65e3c6bdfed8 | ORPH
   mipsel    | google-breakpad-f49c2f1a202... | NOK | http://autobuild.buildroot.net/results/9385dd7f8e7028b4a9df9cff7c865073802f076c |     
    arm      |       host-delve-1.22.1        | NOK | http://autobuild.buildroot.net/results/e9ac29af4e8bb020e7a185d71cd9ee3f7f52ee1f |     
    arm      | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/d34b66f4feeaf0c92a8231c409d84df174c53038 |     
    sh4      | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/392fb0f69d90ab08e9c5c6637a94997093d54a7e |     
   x86_64    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/df8f55fc9d8e2822a3b523bae2f4ad005cfdd25a |     
    arm      | ivi-homescreen-5ab78a19e95c... | NOK | http://autobuild.buildroot.net/results/b778142750cb83b8a9b9972ff79bd4a185d84fd5 |     
    arm      | kvmtool-4d2c017f41533b0e51e... | NOK | http://autobuild.buildroot.net/results/f54c42cf0923927eba1ff1336faa29e2f37aee05 | ORPH
  mips64el   |          libbpf-1.1.0          | NOK | http://autobuild.buildroot.net/results/95c97e1292481d6b607bc0dbe757ea3a67ea27bb |     
   s390x     |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/f10e4755c6f389120c83e204c8f7b0726794e3a5 |     
    or1k     |         libgeos-3.12.1         | NOK | http://autobuild.buildroot.net/results/16bfe6284c678305547e2c4816b4795c247c166c |     
  riscv32    |        libopenssl-3.3.0        | NOK | http://autobuild.buildroot.net/results/4400aab4d294b71a037e1055c567405411821489 | ORPH
  riscv32    |        libopenssl-3.3.0        | NOK | http://autobuild.buildroot.net/results/5a14dbec0e4640aac9d082a7b487874eaeb1505c | ORPH
   mips64    |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/28ebb91c8074142b93e2d440a87a1af6afe71c7e | ORPH
   sh4eb     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/eca886a218075323cd7bf9c864b3a3d825813f7e | ORPH
   nios2     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/9628663df3542c445d1b977c3094f0e63954a3eb | ORPH
  mips64el   |        lightning-2.2.3         | NOK | http://autobuild.buildroot.net/results/25cf564425c9249b10ab23b1f8032da8b5675435 |     
  sparc64    |      mediastreamer-4.4.8       | NOK | http://autobuild.buildroot.net/results/a0423495e8b9b7993b6b05dc9e1391b81a1a1d59 | ORPH
   x86_64    |           ncmpc-0.49           | NOK | http://autobuild.buildroot.net/results/83937876defbb90eef79ce61edadfa890d57b426 |     
  mips64el   |         openal-1.22.0          | NOK | http://autobuild.buildroot.net/results/c80f40c746dbe811f5625889b95929b3ac7b2fe7 | ORPH
    mips     |         openssh-9.7p1          | NOK | http://autobuild.buildroot.net/results/c52b0b130abe6b26e3ad4d9cdfae57d5eec50492 | ORPH
    i686     |  openvmtools-11.3.5-18557794   | NOK | http://autobuild.buildroot.net/results/b6c6c895578a380ffadd6c3ad39cdbb1df83aced |     
  sparc64    |           proj-9.3.0           | NOK | http://autobuild.buildroot.net/results/22bab9135d2582a819e2b6c4c61e2859763515d9 |     
  mips64el   |      python-grpcio-1.60.0      | NOK | http://autobuild.buildroot.net/results/47785f801f93f42397c1a15d09dfa556b8d168cd |     
  aarch64    |      python-numpy-1.25.0       | NOK | http://autobuild.buildroot.net/results/850aeb257fd231a539d4939adb5c6a3260a4a001 |     
microblazeel |     python-remi-2022.7.27      | NOK | http://autobuild.buildroot.net/results/1647b3bc9a54ee702adff0aacd4a8907e8934950 |     
    or1k     |     python-remi-2022.7.27      | NOK | http://autobuild.buildroot.net/results/ba3f7e18ff0d7f84ddc29203a2455c921b299850 |     
   mipsel    |      python-zlmdb-22.6.1       | NOK | http://autobuild.buildroot.net/results/e22a99e2ff53b9cf06c2f049caa18ad6982ab3e9 |     
    arm      |         shadow-4.14.5          | NOK | http://autobuild.buildroot.net/results/fff3d0039a6adc092c2642a412d75c99fb676f1b |     
  mips64el   |         shadow-4.14.5          | NOK | http://autobuild.buildroot.net/results/01487b5aebccbcb032af6374c38d8855057b4def |     
  mips64el   |         shadow-4.14.5          | NOK | http://autobuild.buildroot.net/results/41ea7d424e02aeb9df429db1bb1bfb84acd081e6 |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/a4918956325d1cc2d16e11ce851e67276916c277 |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/a835eb780baa2ee7439f3cf80e0f815df4bcc186 |     
    mips     |            unknown             | NOK | http://autobuild.buildroot.net/results/30c84c7075b17ecde63e90fd181a4141eaac6ed4 |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/2ddd28b1e42eaaba6e260545534ce6992d438583 |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/84239f768299e542ebd505ff8d42ebd307ac0848 |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/7fb73dc1eec4d08e8f397590f0541bbceff76f0f |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/8f3f56cd41cc7963c96ff92c83769bdb84d7ec61 |     
   armeb     |            unknown             | NOK | http://autobuild.buildroot.net/results/1dbd6fdd2b5a57e490a2fe93d6a266590ad404c9 |     
  powerpc    |       util-linux-2.39.3        | NOK | http://autobuild.buildroot.net/results/3261d99ba08d8856aa467caeb564160e0cd73067 | ORPH
   s390x     |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/4ac3ff9c9c5c6ea08ebbd7f46872fbd36279f0b0 |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

               asterisk-20.5.2 | 1 
                   bird-2.0.12 | 1 
                elfutils-0.189 | 1 
               libglib2-2.76.1 | 1 
              libopenssl-3.2.1 | 1 
                    pppd-2.5.0 | 1 
                       unknown | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |        asterisk-20.5.2         | NOK | http://autobuild.buildroot.net/results/d1b296cda54c658283412efce6a80da71022a862 |     
  aarch64    |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/38b5e5b8017ea95777df2846f8aea6f09c356a37 |     
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/ed75fea4e558acb27214fa9f75a7195b65689371 | ORPH
   arceb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/40f416d790e5aef340876724b724c4f5c0563687 |     
    m68k     |        libopenssl-3.2.1        | NOK | http://autobuild.buildroot.net/results/865fa1c47ec76d9f7f2919fd3ec86468333b2ab1 | ORPH
  sparc64    |           pppd-2.5.0           | NOK | http://autobuild.buildroot.net/results/1529e16d5b0a45e4df7413ddeba998505ef046b5 |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/fe0be19af66122e47a3e875638ad86a9218af319 |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
