Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DF6FC4345F
	for <buildroot@archiver.kernel.org>; Fri, 19 Apr 2024 04:03:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CA298400E4;
	Fri, 19 Apr 2024 04:03:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3tnZiHd8EoMa; Fri, 19 Apr 2024 04:03:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AF05241781
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AF05241781;
	Fri, 19 Apr 2024 04:03:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DA1BA1BF2FE
 for <buildroot@lists.busybox.net>; Fri, 19 Apr 2024 04:03:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C6C6841781
 for <buildroot@lists.busybox.net>; Fri, 19 Apr 2024 04:03:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BpcShFQRc_YJ for <buildroot@lists.busybox.net>;
 Fri, 19 Apr 2024 04:03:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7714D400E4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7714D400E4
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7714D400E4
 for <buildroot@buildroot.org>; Fri, 19 Apr 2024 04:03:19 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 06445C000F
 for <buildroot@buildroot.org>; Fri, 19 Apr 2024 04:03:16 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Fri, 19 Apr 2024 04:03:16 -0000
X-GND-Sasl: bot@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1713499397; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ZVCBJbHItFvpYo9u8dc2zZqwVWha4RmiTJZ8DUUJZn4=;
 b=mjnEJu2GTWsATbezYdmut3TCuwJn1vwcV7Nja/oXSW5dZMQKvtXnRG6uHSwKNOy/xSW0Lq
 yflQLEV08AkJ8j/8t0jsQi2U33q7RGM/APRa9ORoGM86KHIr1vd7zADjcyV8vY0QpNHtTs
 18yFkUxrMtoPsjPu5Q1KuVdj3VmYcxvmXUWbHWaqOA3uSA38OxQGUtxv3FAO1MXvYLxWBu
 PS9819iiurJ0tpO/i9fzZHGozSi2eNIUhTC8GwmnVkhTFwcw3iVKCbUqBDajsbvnmdL3FG
 jQQ0x9U3vjFuf0VQJ00nX8fZwh30xxb2Tl523gdqfIUvA/N0nTv0D7t3i752cw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=mjnEJu2G
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2024-04-18
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
Message-ID: <20240419040316.yEPpbskkC07kZ6ylopLJ2zeEgkHE5nlZqgqnd-YdZSM@z>

Hello,

Autobuild statistics for 2024-04-18
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  9  |  9  |  0  | 18  |
    master   | 59  | 73  |  2  | 134 |

Classification of failures by reason for master
-----------------------------------------------

                fail2ban-1.0.2 | 6 
         host-libxcrypt-4.4.36 | 3 
          libcamera-apps-1.2.1 | 3 
               libglib2-2.76.1 | 3 
                libressl-3.8.4 | 3 
                       unknown | 3 
               apcupsd-3.14.14 | 2 
           dmraid-1.0.0.rc16-3 | 2 
                elfutils-0.189 | 2 
                    eza-0.18.8 | 2 
glibc-2.39-5-ge0910f1d3278f... | 2 
                gnu-efi-3.0.18 | 2 
  gobject-introspection-1.76.1 | 2 
host-heimdal-f4faaeaba371ff... | 2 
                   linux-6.8.1 | 2 
                     mdadm-4.3 | 2 
                mongodb-4.2.18 | 2 
                    pppd-2.5.0 | 2 
          python-grpcio-1.60.0 | 2 
               asterisk-20.5.2 | 1 
                  bitcoin-26.0 | 1 
                  boost-1.83.0 | 1 
                  clang-15.0.3 | 1 
             containerd-1.7.14 | 1 
                 coreutils-9.3 | 1 
                    fcft-3.1.6 | 1 
                        ffmpeg | 1 
                   foot-1.16.2 | 1 
                     frr-8.5.4 | 1 
            gdk-pixbuf-2.42.10 | 1 
         gobject-introspection | 1 
              host-rust-1.74.1 | 1 
                   hwloc-2.9.3 | 1 
               ipmitool-1_8_19 | 1 
              libarchive-3.7.2 | 1 
                  libsepol-3.5 | 1 
                memtest86-6.20 | 1 
                 openssh-9.7p1 | 1 
                     php-8.3.4 | 1 
pistache-3ec9d7c4f8b828fdd3... | 1 
                privoxy-3.0.34 | 1 
        python-ml-dtypes-0.3.2 | 1 
         python-remi-2022.7.27 | 1 
                rocksdb-6.20.3 | 1 
ulog-0389d243352255f6182326... | 1 
              webkitgtk-2.42.5 | 1 
                xenomai-3.0.10 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/232df1bf28eca0b90db6c835a7e96c4759d7af13 |     
  powerpc    |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/5da84fab51cec69b51362ca2871033bf3b57e6a5 |     
  riscv64    |        asterisk-20.5.2         | NOK | http://autobuild.buildroot.net/results/f808aea746dcae486b91b47838c1297c58b239a5 |     
  powerpc    |          bitcoin-26.0          | NOK | http://autobuild.buildroot.net/results/ae5c4ed4c6061dd2f3543deba947405627503683 |     
    sh4      |          boost-1.83.0          | NOK | http://autobuild.buildroot.net/results/86247408fa6ddbf3364c13985f5d388ddd30aae5 |     
  riscv32    |          clang-15.0.3          | NOK | http://autobuild.buildroot.net/results/bd7708888fa6798b8f2fd9420490fe6f27234dd6 |     
  riscv64    |       containerd-1.7.14        | NOK | http://autobuild.buildroot.net/results/e1b7b44a3861a239b8c3d302ffd75964e23fd5fe |     
    sh4      |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/282184a65cb29e21bc28a0a23cb8d574276c68b1 | ORPH
  riscv32    |      dmraid-1.0.0.rc16-3       | NOK | http://autobuild.buildroot.net/results/890201281b52617735be5b8656720f3e49d8b220 | ORPH
microblazeel |      dmraid-1.0.0.rc16-3       | NOK | http://autobuild.buildroot.net/results/a989e86443edfabbb3c3f5d9e619fd1aa5d207f5 | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/4182fdbddfca954f9f7064f61e9870a30d9173fe | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/4acedd709d099a63a0eacb739ba19d8c82deb191 | ORPH
    i586     |           eza-0.18.8           | NOK | http://autobuild.buildroot.net/results/0f4e9492a824bc1a8a2400ac457f87b2baf83e37 |     
   x86_64    |           eza-0.18.8           | NOK | http://autobuild.buildroot.net/results/b281262c13a46bfd2a068ea37297bb7895081f61 |     
 aarch64_be  |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/0951ab50a266906ee8eee12efe295a9a46538f83 |     
   xtensa    |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/ef81be3710b7cdce75acca3da2886b486978399f |     
    or1k     |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/ff3da6c15271c799b6ce64d782efff5f06256217 |     
   s390x     |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/3eba99dc6550df6376a94554db5921e30db1e456 |     
 powerpc64   |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/cf6b444d0ebab95be83fad677ab8698b57a08a5a |     
  mips64el   |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/f25737001420b64ed89a967ca07e09cfb7470806 |     
 aarch64_be  |           fcft-3.1.6           | NOK | http://autobuild.buildroot.net/results/d3f832eea62ee38e46f7372a7500b668fd93fbf2 |     
    i686     |             ffmpeg             | TIM | http://autobuild.buildroot.net/results/fc5b3fe12a9424c63aff34f4a52ad75ece4d7dcd |     
microblazeel |          foot-1.16.2           | NOK | http://autobuild.buildroot.net/results/490a4d970fd293ba583f9d0396e56b1eb6dacd6a |     
   xtensa    |           frr-8.5.4            | NOK | http://autobuild.buildroot.net/results/3d5897840b9b1d07858048b7c00119b8193ee713 |     
    i686     |       gdk-pixbuf-2.42.10       | NOK | http://autobuild.buildroot.net/results/f86b53f42526a859b1065459335604c7e799c2e4 | ORPH
powerpc64le  | glibc-2.39-5-ge0910f1d3278f... | NOK | http://autobuild.buildroot.net/results/8ddfe1e9a34e7219fad9e67a10abbc11b32a3965 |     
powerpc64le  | glibc-2.39-5-ge0910f1d3278f... | NOK | http://autobuild.buildroot.net/results/e9f4d82bc8ad756641643a6c263638d485764577 |     
   armeb     |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/29bd9340d249a3bb76cd487883c63561eae6c032 |     
   armeb     |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/9ef3e78576b9eba84700530b76ea67f7369fe418 |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/2a3b3555cd14a19766bfd3fa979523db612be125 |     
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/eaa8b859abdb50bb0081931126ce369e6722baf8 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/db2f1869fbb65ede4be5722d8333f5adcda75876 | ORPH
 aarch64_be  | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/67c31d73a9560237de280b396a7d485dae95c119 | ORPH
  aarch64    | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/d81e032fab8ae8851cf0c79e6661c1139c9eb7dc | ORPH
   nios2     |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.net/results/9be463a84205682e966aeb8785078a05fd85c67d |     
   mipsel    |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.net/results/a1684d69cda932cd87bfee2c84e60ff8e391ffdf |     
  sparc64    |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.net/results/7b7e542a31c1d3b7eed1530b9f1a95ea78de39a4 |     
   armeb     |        host-rust-1.74.1        | NOK | http://autobuild.buildroot.net/results/0e68d49831df9933728c0eb30b8d4041a9077c9f |     
   x86_64    |          hwloc-2.9.3           | NOK | http://autobuild.buildroot.net/results/cca18242d968fd12e654195c5f93c2fea45f4d2e |     
    mips     |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.net/results/edc843c7500a64c9a53bb20c677c2c8bbd6fc919 |     
    m68k     |        libarchive-3.7.2        | NOK | http://autobuild.buildroot.net/results/7da8171adf06890a40e537da19826726df343085 |     
    arm      |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/e0f6bbf4f1792977fc228c4893c194010d29b1d1 |     
    arm      |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/a0f22272de62c94a18de23bcf3d535fcf04d84f7 |     
  mips64el   |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/72a56a31d1d1dc6cde27a2891f12be705bdc826c |     
   arceb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/ee65a8ade845fca5fdd3a7ad23f8f22d72a8aae9 |     
   arceb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/5ed3b28a75d01ee1c60e68ddcd1657f10f02ca18 |     
   arceb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/f7350bc87786b171b6d9b6505b9017dac9ebbb46 |     
   nios2     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/074a8dfa6110fd72f0f071e95138cb81c9aa092c | ORPH
    or1k     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/38e73a9c3dfd34f300c3aac502e3476e0e9a2f70 | ORPH
    sh4a     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/de434ae8de28ba00b7084edb436f3174e1f27ed1 | ORPH
   xtensa    |          libsepol-3.5          | NOK | http://autobuild.buildroot.net/results/3b125c8aa2962f5c18759d6d0ed1610bd0a8ba46 |     
  riscv64    |          linux-6.8.1           | NOK | http://autobuild.buildroot.net/results/448dd908ab7101342be49b634c9bf29730af239f | ORPH
   armeb     |          linux-6.8.1           | NOK | http://autobuild.buildroot.net/results/7c702a70d2305a4d6bc505247bd030e7573ec0d0 | ORPH
 aarch64_be  |           mdadm-4.3            | NOK | http://autobuild.buildroot.net/results/71982a26665c07ff625e7cd20d6c042d6a34359d | ORPH
   sparc     |           mdadm-4.3            | NOK | http://autobuild.buildroot.net/results/ea30d9d434ea3174d8e3b469350057bffd773dc2 | ORPH
    i686     |         memtest86-6.20         | NOK | http://autobuild.buildroot.net/results/cd2d283c81b22695f94858d3bd9a442539e86c65 |     
  aarch64    |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/be1c5ec56b533fb949db86b19545b3248e21846e |     
  aarch64    |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/320deb271d076bf6dcb9e42012d1a47f4bbaaf4e |     
    mips     |         openssh-9.7p1          | NOK | http://autobuild.buildroot.net/results/ce1e79086baf77507e1adec8bcfb1e3916597948 | ORPH
    m68k     |           php-8.3.4            | NOK | http://autobuild.buildroot.net/results/b707796fb3c88a4bfa987528ddbfa4c080b914d2 |     
    m68k     | pistache-3ec9d7c4f8b828fdd3... | NOK | http://autobuild.buildroot.net/results/66d369f71e5e6ff5fba2f18be3aad0cfdf604fbb | ORPH
  sparc64    |           pppd-2.5.0           | NOK | http://autobuild.buildroot.net/results/ba889825083b5a9e8bf8a7cacba751199847eb74 |     
   sparc     |           pppd-2.5.0           | NOK | http://autobuild.buildroot.net/results/8babd41a99b5ec3c9fcc723908eeb4de92a0c8f5 |     
    arm      |         privoxy-3.0.34         | NOK | http://autobuild.buildroot.net/results/225207cc104b32749b0959857f3c40b48a93aa73 |     
    i686     |      python-grpcio-1.60.0      | NOK | http://autobuild.buildroot.net/results/d2cefcf8506336a64914de41aee46b1eeca565f1 |     
  mips64el   |      python-grpcio-1.60.0      | NOK | http://autobuild.buildroot.net/results/4e474594bedfb441504856d40116d8d56299916b |     
  aarch64    |     python-ml-dtypes-0.3.2     | NOK | http://autobuild.buildroot.net/results/232fe6dd5ff6b857c57d09c43e81c4a1bc12ed45 |     
 powerpc64   |     python-remi-2022.7.27      | NOK | http://autobuild.buildroot.net/results/f0ee593c488f6865a55e2c50e7f3320ab093f781 |     
   x86_64    |         rocksdb-6.20.3         | NOK | http://autobuild.buildroot.net/results/3cfd384e48a8028c6ea48c0da9073d0dc212d5b8 |     
   mipsel    | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/fcadf82c57acce409c4ca415f1926a2a385a265c |     
   mips64    |            unknown             | NOK | http://autobuild.buildroot.net/results/900535f0f935b25bc64302dbc1287315060d725b |     
 aarch64_be  |            unknown             | NOK | http://autobuild.buildroot.net/results/34749836525ffb8e1ee3efc7d66901e56779d33b |     
 powerpc64   |            unknown             | NOK | http://autobuild.buildroot.net/results/67c782b4d3e6506e7e4ee366e503a1e80afad9fe |     
  aarch64    |        webkitgtk-2.42.5        | NOK | http://autobuild.buildroot.net/results/9cbda90befecc06717dfce77705e2fb143bbef21 |     
   s390x     |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/e15ccef2f2bd58482204b5061f77e76a8a540ebd |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

  binutils-arc-2023.09-release | 1 
   host-flutter-sdk-bin-3.16.8 | 1 
          libcamera-apps-1.2.1 | 1 
                libressl-3.8.2 | 1 
                  linux-6.6.22 | 1 
                    ncmpc-0.49 | 1 
          python-grpcio-1.60.0 | 1 
           tesseract-ocr-5.3.3 | 1 
                       unknown | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |  binutils-arc-2023.09-release  | NOK | http://autobuild.buildroot.net/results/f013b3564831f476d475b792abdfd5cacd472d34 |     
    m68k     |  host-flutter-sdk-bin-3.16.8   | NOK | http://autobuild.buildroot.net/results/87c82cee1dce8fa589107e8c4ce1640edd1d5ccb |     
   x86_64    |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/e03769933303bfb7567945db5e259b7b2b373397 |     
   mipsel    |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/bfd6d7eff24a23c7da4a2856d91f9a423ec01eaf | ORPH
    arm      |          linux-6.6.22          | NOK | http://autobuild.buildroot.net/results/e6dcb562edc36804b1b12a87dd5af64bb2b7a8ad | ORPH
  aarch64    |           ncmpc-0.49           | NOK | http://autobuild.buildroot.net/results/2c21996545f5b73f32c053290891c723ab0fff79 |     
  riscv32    |      python-grpcio-1.60.0      | NOK | http://autobuild.buildroot.net/results/6c1fab099b36f452bead6c01f5e8d153ede8a587 |     
   sparc     |      tesseract-ocr-5.3.3       | NOK | http://autobuild.buildroot.net/results/0ddf4a90acfb11e79e28fccf1986ed16ef1260f3 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/1cc45539c4c02591271f4981cdd36af0c7cd22a2 |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
