Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 737F2C54E41
	for <buildroot@archiver.kernel.org>; Sat,  2 Mar 2024 06:46:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id ADE5E40181;
	Sat,  2 Mar 2024 06:46:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8QRiW0a42GQ6; Sat,  2 Mar 2024 06:46:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 44E4D403B9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 44E4D403B9;
	Sat,  2 Mar 2024 06:46:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E6F941BF47D
 for <buildroot@lists.busybox.net>; Sat,  2 Mar 2024 06:46:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D71AE6070D
 for <buildroot@lists.busybox.net>; Sat,  2 Mar 2024 06:46:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id K71Cv5y3iSxC for <buildroot@lists.busybox.net>;
 Sat,  2 Mar 2024 06:46:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DCB54606CC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DCB54606CC
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DCB54606CC
 for <buildroot@buildroot.org>; Sat,  2 Mar 2024 06:46:08 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D56FF4000C
 for <buildroot@buildroot.org>; Sat,  2 Mar 2024 06:46:05 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sat, 02 Mar 2024 06:46:05 -0000
X-GND-Sasl: bot@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1709361965; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=7fg1e+lnkL0RS2oL4/Fd2ZckcO9yGRU/HqK28g9cl94=;
 b=coNQqM/I2QlL26M789nES8AifPi+/ahHkVFg8FdDGvFSVGf7RS4ed2IMNpI594LSB5yIRH
 Sb72o98AEoH4NvzQ0YY5HO7JYNsGr4mq2acijabcUnpAufh1p98sYNsORcPSe3sCCsttLc
 eazTmIedOsZ7HBlhbvCXOt/KYLCeuUZJ4Eb8GWj6XH/NvNyrWRQFaAKl5eBjVCVkMZH0BJ
 S+fxJAreC5RFxy7noXZKdyev11UP1XdI3qTPrBrlkBkZ9ByGZ5ZJezVEHaV7CGmywKWpxs
 RkEHCYuDNhK+idcjZ1kngXQI3y+RO2lW75+HuqpKITKtwz/a/M73hLrtvnbsMQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=coNQqM/I
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2024-03-01
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
Message-ID: <20240302064605.d6OUkrGjB9EbpkrSwtVFjLroZ0eUNTFJcuIn5F3Eqzc@z>

Hello,

Autobuild statistics for 2024-03-01
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  |  3  |  5  |  0  |  8  |
  2023.11.x  |  0  |  4  |  0  |  4  |
    master   | 51  | 70  |  0  | 121 |

Classification of failures by reason for master
-----------------------------------------------

    host-gcc-bare-metal-13.2.0 | 6 
                       unknown | 6 
               libpthsem-2.0.8 | 5 
                  linux-6.6.18 | 5 
                memtest86-6.20 | 4 
                elfutils-0.189 | 3 
glibc-2.38-44-gd37c2b20a478... | 3 
  gobject-introspection-1.76.1 | 2 
        host-sentry-cli-2.20.3 | 2 
              libopenssl-3.2.1 | 2 
                libressl-3.8.2 | 2 
       newlib-bare-metal-4.4.0 | 2 
                 openssh-9.6p1 | 2 
               tcf-agent-1.8.0 | 2 
                  cairo-1.17.4 | 1 
check-11970a7e112dfe243a2e6... | 1 
        edk2-edk2-stable202308 | 1 
                gnu-efi-3.0.17 | 1 
         host-gcc-final-11.4.0 | 1 
host-heimdal-f4faaeaba371ff... | 1 
host-python-setuptools-scm-... | 1 
          libcamera-apps-1.2.1 | 1 
               libglib2-2.76.1 | 1 
     linux-5.10.162-cip24-rt10 | 1 
                  nginx-1.24.0 | 1 
                    ola-0.10.9 | 1 
                 omniorb-4.3.1 | 1 
                    php-8.2.16 | 1 
                 powertop-2.15 | 1 
          python-grpcio-1.60.0 | 1 
            quickjs-2023-12-09 | 1 
                   redis-7.2.4 | 1 
                   rhash-1.4.4 | 1 
                 shadow-4.14.3 | 1 
                     squid-6.6 | 1 
             stress-ng-0.15.07 | 1 
           uboot-tools-2021.07 | 1 
               valgrind-3.22.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  powerpc    |          cairo-1.17.4          | NOK | http://autobuild.buildroot.net/results/9fb2ce91ce22fab944a02933e8cc88f03fa6c859 |     
   x86_64    | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/f4f13678d665afc53fc6b93e0a15854763ed4075 | ORPH
    i686     |     edk2-edk2-stable202308     | NOK | http://autobuild.buildroot.net/results/e844a4046bfd5c2e23c1125ed8e7be309e175acd |     
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/0bd02f0b71ee446ddfd170cff07342e11511a487 | ORPH
    arm      |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/95b4010119498b760ac026d442a5193df1cf33b1 | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/f9adf37049b7e5e3c8ec9c7dae1dbff307eecf8e | ORPH
   arceb     | glibc-2.38-44-gd37c2b20a478... | NOK | http://autobuild.buildroot.net/results/41852d6c151ef25edc87d1007a3aa2dcfd1a600a |     
   arceb     | glibc-2.38-44-gd37c2b20a478... | NOK | http://autobuild.buildroot.net/results/c4f55f72e8d660d50da5910c93b32c05f9f0a3ce |     
powerpc64le  | glibc-2.38-44-gd37c2b20a478... | NOK | http://autobuild.buildroot.net/results/b42e3a0437df63b98f4c926b0d5424af89acbabc |     
 aarch64_be  |         gnu-efi-3.0.17         | NOK | http://autobuild.buildroot.net/results/4cfa605be93bcc83267853fd56a71de1a67878a3 |     
   nios2     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/9721b3cbdf4a08b1caebeae5b5130871cb9f7b16 | ORPH
  powerpc    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/d9d2a99ad8f98b15356cbcf064359802f5803cfa | ORPH
microblazeel |   host-gcc-bare-metal-13.2.0   | NOK | http://autobuild.buildroot.net/results/0366eee3814e93407d571375dc8a9bcb38336893 |     
    i686     |   host-gcc-bare-metal-13.2.0   | NOK | http://autobuild.buildroot.net/results/ef58e8ae6e143fa99c1a9928d52d7d60c2815521 |     
 powerpc64   |   host-gcc-bare-metal-13.2.0   | NOK | http://autobuild.buildroot.net/results/fcfa1b842f882d5f26219b6f96687f918ad99301 |     
  powerpc    |   host-gcc-bare-metal-13.2.0   | NOK | http://autobuild.buildroot.net/results/4d83542a40ed2c0a7424f162f35e92001e794de1 |     
   mips64    |   host-gcc-bare-metal-13.2.0   | NOK | http://autobuild.buildroot.net/results/0b1ecaf771bd9972fe49e81c2b377583f92da675 |     
 powerpc64   |   host-gcc-bare-metal-13.2.0   | NOK | http://autobuild.buildroot.net/results/73734731f6fe49228c3d14b8a9f11dbbc340396f |     
 microblaze  |     host-gcc-final-11.4.0      | NOK | http://autobuild.buildroot.net/results/ace1a1291ef689f7a461806416270df140b8a05d |     
    m68k     | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/4d90ce8e08d86cc41cad8e8adb74235fce156bbf | ORPH
 aarch64_be  | host-python-setuptools-scm-... | NOK | http://autobuild.buildroot.net/results/f5795298ff9321bf5033d5dbe02cbb1e46cd2f8b |     
   mipsel    |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/ea86e06d4de1c94c31c91c25c5df1ff5e576f66e |     
   arceb     |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/4f2f8e86cd706fc7da6109c2a217403aaceadfbc |     
   x86_64    |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/4ae7a8e31431c75747bd61f296be655733e8d90e |     
   arceb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/3e151f58a1a3d12106e1bc1e4e42a82d0655fb6d |     
   s390x     |        libopenssl-3.2.1        | NOK | http://autobuild.buildroot.net/results/14f9213baf927e12a9d8c38fbab6508a48f85e59 | ORPH
   s390x     |        libopenssl-3.2.1        | NOK | http://autobuild.buildroot.net/results/8605a3b5e1afd6ad17e433d4ce82fe2b837c9434 | ORPH
    mips     |        libpthsem-2.0.8         | NOK | http://autobuild.buildroot.net/results/40308bce5b83cd7cd300f309ed4e766122504535 |     
   sh4eb     |        libpthsem-2.0.8         | NOK | http://autobuild.buildroot.net/results/58bccee4ba300d44625fba6f74582a70aa16e0c7 |     
    m68k     |        libpthsem-2.0.8         | NOK | http://autobuild.buildroot.net/results/b86297828127a2419ce75546e7434ff13d4aaa45 |     
   mipsel    |        libpthsem-2.0.8         | NOK | http://autobuild.buildroot.net/results/1a79f7146808b91e66e57558440fe2f4bacf2aba |     
    i586     |        libpthsem-2.0.8         | NOK | http://autobuild.buildroot.net/results/f3f0d95ac5956ffad51751d68fa1b8122fe74488 |     
  mips64el   |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/b1c4b812ada72eea731ec636ea3f0cf858165ce9 | ORPH
   sh4eb     |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/831b5736b971c2aa7f508fec44857ae2b9324c22 | ORPH
  powerpc    |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/38b8bda9f7e935de4aec84ad329fee56aa70f5c1 | ORPH
 powerpc64   |          linux-6.6.18          | NOK | http://autobuild.buildroot.net/results/fcd6be12377b81e17733a71653d04a3ccdf02d2c | ORPH
  mips64el   |          linux-6.6.18          | NOK | http://autobuild.buildroot.net/results/700f35d9d77bd9e93d1c53f8d93225e043a66318 | ORPH
    mips     |          linux-6.6.18          | NOK | http://autobuild.buildroot.net/results/b90b2ca4998b6b0342fb53dfded237e8d7b097c7 | ORPH
   mipsel    |          linux-6.6.18          | NOK | http://autobuild.buildroot.net/results/fe66d1bf4cd45d2d44481b378bdf3b450644e98e | ORPH
 aarch64_be  |          linux-6.6.18          | NOK | http://autobuild.buildroot.net/results/4ccee624b3c81f42d7dfd169e4270e7a52ea1bdd | ORPH
   x86_64    |         memtest86-6.20         | NOK | http://autobuild.buildroot.net/results/655eff92db002c81d79e1ae5849bca83a58da193 |     
   x86_64    |         memtest86-6.20         | NOK | http://autobuild.buildroot.net/results/1823d1efae5ba9f05a342f72b0c1d6e818a75acd |     
   x86_64    |         memtest86-6.20         | NOK | http://autobuild.buildroot.net/results/bb95660f4a2de76b61090763c18335afda026bca |     
   x86_64    |         memtest86-6.20         | NOK | http://autobuild.buildroot.net/results/066fa38ef6f5b995bcc585802082bfd9a1cc4224 |     
   x86_64    |    newlib-bare-metal-4.4.0     | NOK | http://autobuild.buildroot.net/results/23e6641cbce62258310c300f8aed5d6a76973d72 |     
    or1k     |    newlib-bare-metal-4.4.0     | NOK | http://autobuild.buildroot.net/results/62d71c007a049ffe5712bb5e6d9f39677009c4b3 |     
   mipsel    |          nginx-1.24.0          | NOK | http://autobuild.buildroot.net/results/87bbcf946ccbd8e3bf1ca9f39464f4bb198c8d42 |     
   sparc     |           ola-0.10.9           | NOK | http://autobuild.buildroot.net/results/8f9e4edd14ece3f72c864ccfdac6ff0e913a57e5 |     
  sparc64    |         omniorb-4.3.1          | NOK | http://autobuild.buildroot.net/results/21d7209363faed8044ed00120cbdfe5435f40a27 | ORPH
    mips     |         openssh-9.6p1          | NOK | http://autobuild.buildroot.net/results/5c44211b1e994220a5acfabc9bf754792e557cd9 | ORPH
    mips     |         openssh-9.6p1          | NOK | http://autobuild.buildroot.net/results/c7e280d06b55071a72f7df1d48a8bc6bb3d0b509 | ORPH
microblazeel |           php-8.2.16           | NOK | http://autobuild.buildroot.net/results/28e14fe01263498ac8d576150eb0eb44d0131bf7 |     
    i686     |         powertop-2.15          | NOK | http://autobuild.buildroot.net/results/bb80a7842d18651e5069f3a91f06a9c23218d260 |     
    arc      |      python-grpcio-1.60.0      | NOK | http://autobuild.buildroot.net/results/36686aca1b45f0bf692a60e67a48424b561930a3 |     
    arm      |       quickjs-2023-12-09       | NOK | http://autobuild.buildroot.net/results/5a4bf5c21fb34510651d3a86fa3fbe8859e84af7 |     
powerpc64le  |          redis-7.2.4           | NOK | http://autobuild.buildroot.net/results/fdc9f940b348430cb4da8efecc5cc047b21df281 |     
   xtensa    |          rhash-1.4.4           | NOK | http://autobuild.buildroot.net/results/f8dd8ea6c0c9cd428355e3720e679a078b8e0f8f | ORPH
    mips     |         shadow-4.14.3          | NOK | http://autobuild.buildroot.net/results/f94d1cb188ef1b04597081d1c75aa0b372d296d2 |     
   s390x     |           squid-6.6            | NOK | http://autobuild.buildroot.net/results/7e5846b19f7183d3eb65e7e64e511542cc234bf7 | ORPH
   mips64    |       stress-ng-0.15.07        | NOK | http://autobuild.buildroot.net/results/592e3db62b5f648f3059d70c4493fbd7b33ab3d1 |     
   x86_64    |        tcf-agent-1.8.0         | NOK | http://autobuild.buildroot.net/results/8388acf59689ed7e621bdf158483e3df1cf9bef7 |     
 aarch64_be  |        tcf-agent-1.8.0         | NOK | http://autobuild.buildroot.net/results/8d307b9a02ad05a2f9523112d9191aac30980242 |     
  mips64el   |      uboot-tools-2021.07       | NOK | http://autobuild.buildroot.net/results/8c1b42ee346891db853d2e851d97d7bf1948d1c3 | ORPH
   armeb     |            unknown             | NOK | http://autobuild.buildroot.net/results/af2719bd073e683a8dd6fe6aa1eba64c8161fd4c |     
  sparc64    |            unknown             | NOK | http://autobuild.buildroot.net/results/2532d32a2ce7a199a3f23db4b28a9c10e5621fbd |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/09050f72f46b6f0f0ad264a7484fbe6a33650ad0 |     
    mips     |            unknown             | NOK | http://autobuild.buildroot.net/results/05e2566551e14415a75ceb56a94c340b50ae2c44 |     
    sh4a     |            unknown             | NOK | http://autobuild.buildroot.net/results/6680daf59a858f27f21461f115868b4c86a6d1a9 |     
 microblaze  |            unknown             | NOK | http://autobuild.buildroot.net/results/e059ac3e8f508a8bdf6f5c02b7903a0f24531e74 |     
   mips64    |        valgrind-3.22.0         | NOK | http://autobuild.buildroot.net/results/61669d22d0d5f0fc88c8b8f94562c9a8f62689ae | ORPH


Classification of failures by reason for 2023.02.x
--------------------------------------------------

                  check-0.15.2 | 1 
               gupnp-av-0.14.0 | 1 
            host-binutils-2.38 | 1 
            host-binutils-2.39 | 1 
                       unknown | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  powerpc    |          check-0.15.2          | NOK | http://autobuild.buildroot.net/results/c9c83f3be1c2c1e2f324b6c9080fb4b96b449e37 | ORPH
 microblaze  |        gupnp-av-0.14.0         | NOK | http://autobuild.buildroot.net/results/71b0446c95bc124d35668b7384bd9f48106382d3 |     
   mips64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/7c4444dcd567e2d3b2afaf8d8436adee46281b88 |     
   sparc     |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/e7295ce664646b0b2c1573cff6adf42f15c5c284 |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.net/results/3b2187321afb8be720b7189177023db17b00fe54 |     


Classification of failures by reason for 2023.11.x
--------------------------------------------------

               alsa-lib-1.2.10 | 1 
                   bird-2.0.12 | 1 
                   libnss-3.94 | 1 
             util-linux-2.39.2 | 1 


Detail of failures for 2023.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |        alsa-lib-1.2.10         | NOK | http://autobuild.buildroot.net/results/b30c11cb9cdc6210b32c4bc81f0c773b96d9fbfc |     
    arm      |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/51cc7e48140139cb8b23ac74ce64a29350b65744 |     
   sh4eb     |          libnss-3.94           | NOK | http://autobuild.buildroot.net/results/916ed0dc44a497249cc7e6489238146979364d2e |     
    arm      |       util-linux-2.39.2        | NOK | http://autobuild.buildroot.net/results/55598dc9a7b60147231aa10a340ab03face86748 | ORPH


Gitlab CI results for 2024-03-01
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
                 bananapi_m2_zero | https://gitlab.com/buildroot.org/buildroot/-/jobs/6284718356  |      
                          beaglev | https://gitlab.com/buildroot.org/buildroot/-/jobs/6284718366  |      
                      beelink_gs1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6284718367  |      
                      cubieboard2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6284718383  |      
           friendlyarm_nanopi_r2s | https://gitlab.com/buildroot.org/buildroot/-/jobs/6284718470  |      
                        imx7dpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/6284718506  |      
                        imx8mqevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/6284718515  |      
                    imxrt1050-evk | https://gitlab.com/buildroot.org/buildroot/-/jobs/6284718519  |      
               kontron_pitx_imx8m | https://gitlab.com/buildroot.org/buildroot/-/jobs/6284718528  |      
                         mx6cubox | https://gitlab.com/buildroot.org/buildroot/-/jobs/6284718580  |      
              octavo_osd32mp1_brk | https://gitlab.com/buildroot.org/buildroot/-/jobs/6284718606  |      
              octavo_osd32mp1_red | https://gitlab.com/buildroot.org/buildroot/-/jobs/6284718608  |      
                    orangepi_lite | https://gitlab.com/buildroot.org/buildroot/-/jobs/6284718656  |      
                   orangepi_lite2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6284718655  |      
                orangepi_one_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/6284718659  |      
                      orangepi_pc | https://gitlab.com/buildroot.org/buildroot/-/jobs/6284718662  |      
                      orangepi_r1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6284718664  |      
                   orangepi_zero3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6284718665  |      
                           pine64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6284718674  |      
                    pine64_sopine | https://gitlab.com/buildroot.org/buildroot/-/jobs/6284718676  |      
                      raspberrypi | https://gitlab.com/buildroot.org/buildroot/-/jobs/6284718740  | ORPH 
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/6284718735  | ORPH 
                raspberrypizero2w | https://gitlab.com/buildroot.org/buildroot/-/jobs/6284718745  |      
                           rock5b | https://gitlab.com/buildroot.org/buildroot/-/jobs/6284718753  |      
                           rock64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6284718754  |      
                       rock_pi_n8 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6284718757  |      
             sipeed_licheepi_nano | https://gitlab.com/buildroot.org/buildroot/-/jobs/6294854444  |      
               snps_arc700_axs101 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6294855198  |      
                 snps_arc700_nsim | https://gitlab.com/buildroot.org/buildroot/-/jobs/6294855307  | ORPH 
                socrates_cyclone5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6294855710  |      
              toradex_apalis_imx6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6294856145  |      
                        wandboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/6294857301  |      



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
