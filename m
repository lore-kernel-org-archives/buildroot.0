Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 345ADC25B76
	for <buildroot@archiver.kernel.org>; Sat,  1 Jun 2024 04:05:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C4F57611CD;
	Sat,  1 Jun 2024 04:05:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iR37E_-q-Gqs; Sat,  1 Jun 2024 04:05:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DB12F611D5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DB12F611D5;
	Sat,  1 Jun 2024 04:05:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E00C91BF2A3
 for <buildroot@lists.busybox.net>; Sat,  1 Jun 2024 04:05:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CC9C8401F3
 for <buildroot@lists.busybox.net>; Sat,  1 Jun 2024 04:05:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H_eTmx3bPip2 for <buildroot@lists.busybox.net>;
 Sat,  1 Jun 2024 04:05:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B13CB404B0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B13CB404B0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B13CB404B0
 for <buildroot@buildroot.org>; Sat,  1 Jun 2024 04:05:39 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 76433FF805
 for <buildroot@buildroot.org>; Sat,  1 Jun 2024 04:05:37 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sat, 01 Jun 2024 04:05:37 -0000
X-GND-Sasl: bot@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1717214737; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=u6RxuPf2SRv0sWGRdtRhewHrp9Yh1E5WZjFi1wfpRj0=;
 b=RX9CBuKTSwjo33lIataI2rxqvzZqYQ7CH6VW/JglcH+RpZ5QX5PwwTAcLxqnwOkj+QOqGh
 P/nNMq50b8crqi2Yd/u1pBwIZf5rFd9UM6CIK47NcgGTcbwNxDb3xR/h6qXtv6Hj41eLLe
 7n9wYLHByfmufWVhO7dBQrAENxyIRAyzn+/BPG3FbB37QGBqDMRdTZEPi9x3jT3x3XYted
 6XUcwFEpYgaI7li2Ci1O4RrhYyft5h+rlywUAmYaq4lyX3M0xGVPPVp0d//MO57PmJ8glF
 9hWv5gIKdCPluXMW4zEnwvl+/wVaNnyv+UEV1UomD6sqxZnfjIdHLY90CjVtWQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=RX9CBuKT
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2024-05-31
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
Message-ID: <20240601040537.rte0zk3xxPskzadAQuhu4T-8pdYTWGdxfyNQOGrmVwQ@z>

Hello,

Autobuild statistics for 2024-05-31
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  9  |  9  |  0  | 18  |
    master   | 34  | 56  |  1  | 91  |

Classification of failures by reason for master
-----------------------------------------------

                       unknown | 4 
ibm-sw-tpm2-5452af422edeff7... | 3 
                elfutils-0.189 | 2 
                fail2ban-1.0.2 | 2 
                  ffmpeg-6.1.1 | 2 
glibc-2.39-5-ge0910f1d3278f... | 2 
                libressl-3.8.4 | 2 
               lighttpd-1.4.76 | 2 
           python-numpy-1.25.0 | 2 
                    zeek-4.1.1 | 2 
aer-inject-9bd5e2c7886fca72... | 1 
android-tools-4.2.2+git2013... | 1 
  binutils-arc-2023.09-release | 1 
                   bird-2.0.12 | 1 
check-11970a7e112dfe243a2e6... | 1 
                 coreutils-9.3 | 1 
           crucible-2023.11.02 | 1 
                 dc3dd-7.2.641 | 1 
             docker-cli-26.0.2 | 1 
              e2fsprogs-1.47.0 | 1 
                   flann-1.9.2 | 1 
                flutter-engine | 1 
           ghostscript-10.02.1 | 1 
                gnu-efi-3.0.18 | 1 
             gnuradio-3.10.7.0 | 1 
               gocryptfs-2.3.2 | 1 
google-breakpad-f49c2f1a202... | 1 
host-prelink-cross-a853a5d7... | 1 
        host-sentry-cli-2.20.3 | 1 
host-vboot-utils-bbdd62f9b0... | 1 
          libcamera-apps-1.2.1 | 1 
              libopenssl-3.3.0 | 1 
                 libp11-0.4.12 | 1 
                  libsepol-3.6 | 1 
     linux-5.10.162-cip24-rt10 | 1 
ltrace-82c66409c7a93ca6ad2e... | 1 
                     lxc-5.0.3 | 1 
           mediastreamer-4.4.8 | 1 
                  ntpsec-1.2.3 | 1 
                 openssh-9.7p1 | 1 
                 rrdtool-1.8.0 | 1 
               syslog-ng-4.7.1 | 1 
             util-linux-2.39.3 | 1 
               xwayland-23.2.4 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 powerpc64   | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/e8e2135ebead18421cabd0d84e9dcb0b13afdfa7 | ORPH
   nios2     | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/b7f0295f2df06ff6cb1e9259e0bc01c7c21fe1f4 |     
    arc      |  binutils-arc-2023.09-release  | NOK | http://autobuild.buildroot.net/results/86d7bbc2444fe6a3626e6ab2fcf38e988a6fc81b |     
   sparc     |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/f514bf6a860bd80728cb0a145fc4b0c52e2b8ade |     
    arm      | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/a504bc439c5652af5bd64bf7a0c73a1a02ed6157 | ORPH
   xtensa    |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/c0d27f16dbbb6479399f1570998ea512b5ebdd92 | ORPH
  riscv64    |      crucible-2023.11.02       | NOK | http://autobuild.buildroot.net/results/92c2d2fcbbf4d7dfc544eda76f9024dccb19b397 |     
   armeb     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/edcee06b4ffe55e23ffd555108e8991dd1290fbf | ORPH
  riscv64    |       docker-cli-26.0.2        | NOK | http://autobuild.buildroot.net/results/609cb3bc8ec98fe895feb5ba0b85914b0b0aba16 |     
   sh4eb     |        e2fsprogs-1.47.0        | NOK | http://autobuild.buildroot.net/results/5f0f2e114c2615e9520110c01d835d415c90460c | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/9676f42ec36d4973c593724de89dcd360a52ecc3 | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/917a9090b782e1cd0f0f5a0e2d4b60f24967ffc9 | ORPH
   x86_64    |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/91168065d1d31f160c7009dc92381f7aa7e3708c |     
   x86_64    |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/6f4839f4c66c4253f1e857217cbf294286baa949 |     
    arc      |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/17d425792d7a39a8a9485ccc2cca7e0118fd1e47 |     
   arceb     |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/eba1ea6c7f4a22345ae59eeb4045a7aebd5da556 |     
  mips64el   |          flann-1.9.2           | NOK | http://autobuild.buildroot.net/results/d1c159ea282f80733064715080706360b30bc56d |     
  aarch64    |         flutter-engine         | TIM | http://autobuild.buildroot.net/results/14e70f9054a395ff9cf66303ac1cc1439b020000 |     
    arm      |      ghostscript-10.02.1       | NOK | http://autobuild.buildroot.net/results/20e6b4c1d07b9c37c56a35dff87ddc07fb482feb |     
 powerpc64   | glibc-2.39-5-ge0910f1d3278f... | NOK | http://autobuild.buildroot.net/results/5dcafddfb6b4288d899f532aef21a31b230a9ff6 |     
powerpc64le  | glibc-2.39-5-ge0910f1d3278f... | NOK | http://autobuild.buildroot.net/results/adb4aa41efad2373d11d875e6306a8d10911e8c7 |     
    arm      |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/0a2a473d9742e9009cfa7b5774d48020717568f9 |     
  mips64el   |       gnuradio-3.10.7.0        | NOK | http://autobuild.buildroot.net/results/6594ec121a6fe1bd74a34425bec9500503f34f4e |     
  riscv64    |        gocryptfs-2.3.2         | NOK | http://autobuild.buildroot.net/results/43a45d2b3f24405e81de382d585af889ce0a4fb2 |     
   mipsel    | google-breakpad-f49c2f1a202... | NOK | http://autobuild.buildroot.net/results/ea3e6dcacef0f7947cabfac82f42210932492de3 |     
   s390x     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/71327ac9b16c038d129e317d0a4e6ba6a5514fae | ORPH
  riscv64    |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/9cb096c26013ae569575364bb179415941883f06 |     
    mips     | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/4daff2801e317dfee94d2b0485f72bfabbb80a61 |     
  mips64el   | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/a64e42233d51258982a0a81e209e83db22fb3f44 |     
  aarch64    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/f90625272ef09ece7135c9c5f373ce2bde66466b |     
    m68k     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/b98a8237c7e67ba03bcc907ced2728134caa2e72 |     
    i686     |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/6966308de6725518b981745199291758fb86d3b8 |     
  riscv32    |        libopenssl-3.3.0        | NOK | http://autobuild.buildroot.net/results/15c33690f36e97c12b62be338578a22cfffa864d | ORPH
   s390x     |         libp11-0.4.12          | NOK | http://autobuild.buildroot.net/results/ee980b842e8a0502a8e81f4dfaabeb3fa291940d | ORPH
    m68k     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/cca84e2adbfb0545cc95ba0d2c075cbf51f0d582 | ORPH
    arc      |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/9031675b44db01cf1789da45d7f7bc10ce1aa45d | ORPH
    m68k     |          libsepol-3.6          | NOK | http://autobuild.buildroot.net/results/5b6c291faa9a5777412f22912ed186c1d3fdb2ef |     
  sparc64    |        lighttpd-1.4.76         | NOK | http://autobuild.buildroot.net/results/ee7d0b2c4240e160b40a3558451954de69215f3a | ORPH
  sparc64    |        lighttpd-1.4.76         | NOK | http://autobuild.buildroot.net/results/b51646575d6a8ee12f4621de0050f4ee31c00ca2 | ORPH
   x86_64    |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/0570ab5ae91762b95d463bef813c5d18861fb17a | ORPH
    i686     | ltrace-82c66409c7a93ca6ad2e... | NOK | http://autobuild.buildroot.net/results/104267aee986a5c64ee93156ee06c36e6d65f68d | ORPH
  aarch64    |           lxc-5.0.3            | NOK | http://autobuild.buildroot.net/results/cac9545f86bd17e736e7ef059cf5a7dbc2a4d48d |     
  aarch64    |      mediastreamer-4.4.8       | NOK | http://autobuild.buildroot.net/results/43e61e51cd2156927f2c32d838415b23b2068f37 | ORPH
   xtensa    |          ntpsec-1.2.3          | NOK | http://autobuild.buildroot.net/results/daff7c6e9215a4e643319ae6aa660c30814f7971 | ORPH
   mipsel    |         openssh-9.7p1          | NOK | http://autobuild.buildroot.net/results/212c54117f8027f02929a4a38b7a15c9c7a231e2 | ORPH
    arm      |      python-numpy-1.25.0       | NOK | http://autobuild.buildroot.net/results/f46b7d8f5619a85a19f890def219bc55d1ab2465 |     
    arm      |      python-numpy-1.25.0       | NOK | http://autobuild.buildroot.net/results/56007932ae1813648289086c553a2ddafbfcd50d |     
   xtensa    |         rrdtool-1.8.0          | NOK | http://autobuild.buildroot.net/results/e3a4cc8b049e27838d2db30cd9bc96bb35391d39 |     
  powerpc    |        syslog-ng-4.7.1         | NOK | http://autobuild.buildroot.net/results/8284eff2162e41f16c9624bce682d0c6de7af9bf |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/b9dffad2c7f873e765fc59894e4580314a9b9f91 |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/17d9df836f15d9eb23395e103a5d47fc3632c7df |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/ca071a30cb023f489fb2c23a0be4ff064cf613e2 |     
  sparc64    |            unknown             | NOK | http://autobuild.buildroot.net/results/46402d8c3e2a552714a11d52dcb7cab86124f63a |     
    arm      |       util-linux-2.39.3        | NOK | http://autobuild.buildroot.net/results/551de60f4b22e7e8ddc22b327a1b9cf9f4631680 | ORPH
   xtensa    |        xwayland-23.2.4         | NOK | http://autobuild.buildroot.net/results/1b4f31e15ed26bf709841e656b1bf74c3e28f7cb |     
 aarch64_be  |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/306656d26a46df3986cfb69aac91cdb49f7cea50 |     
    arm      |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/4c2bcfb2be7bc2a0d167fc7d95927b2430be3fb9 |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

          libcamera-apps-1.2.1 | 2 
                 dc3dd-7.2.641 | 1 
  gobject-introspection-1.76.1 | 1 
               libglib2-2.76.1 | 1 
                libressl-3.8.4 | 1 
                  linux-6.6.27 | 1 
                 minisign-0.11 | 1 
                    ola-0.10.9 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/dbd2b52d8afae5e7b6c6f2b18d5cff840880b24d | ORPH
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/31eee6cf679dee6a8f60be992f8376d1929fe3c3 | ORPH
    or1k     |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/39e592c95df186d60fcbb8453bf4895bccde7f01 |     
powerpc64le  |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/179e8bed00f54dadacbf0e639d6d7efc0b0a8385 |     
   arceb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/7f6067f82c55abb143fc2b423c4795d0c194bc20 |     
   nios2     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/eb6970af173063a8af917ed35952baff02dd1388 | ORPH
   mips64    |          linux-6.6.27          | NOK | http://autobuild.buildroot.net/results/f8c6b7f8c29d8219e1a596c4dc96bd5637dfb113 | ORPH
    arm      |         minisign-0.11          | NOK | http://autobuild.buildroot.net/results/9b1fe8e073b193cf1f955fac23c5c6c7fe4cadae |     
  sparc64    |           ola-0.10.9           | NOK | http://autobuild.buildroot.net/results/cea9720c47589dfdeb8f93b8df1753c5790f71d5 |     


Gitlab CI results for 2024-05-31
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
       acmesystems_aria_g25_128mb | https://gitlab.com/buildroot.org/buildroot/-/jobs/6976341204  |      
       acmesystems_aria_g25_256mb | https://gitlab.com/buildroot.org/buildroot/-/jobs/6976341209  |      
    acmesystems_arietta_g25_128mb | https://gitlab.com/buildroot.org/buildroot/-/jobs/6976341217  |      
    acmesystems_arietta_g25_256mb | https://gitlab.com/buildroot.org/buildroot/-/jobs/6976341225  |      
                  at91sam9260eknf | https://gitlab.com/buildroot.org/buildroot/-/jobs/6976341375  |      
                   at91sam9g20dfc | https://gitlab.com/buildroot.org/buildroot/-/jobs/6976341379  |      
                 at91sam9g45m10ek | https://gitlab.com/buildroot.org/buildroot/-/jobs/6976341385  |      
                     at91sam9rlek | https://gitlab.com/buildroot.org/buildroot/-/jobs/6976341388  |      
                     at91sam9x5ek | https://gitlab.com/buildroot.org/buildroot/-/jobs/6976341394  |      
                 at91sam9x5ek_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/6976341408  |      
             at91sam9x5ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/6976341420  |      
                 atmel_sama5d3xek | https://gitlab.com/buildroot.org/buildroot/-/jobs/6976341476  |      
                        bananapro | https://gitlab.com/buildroot.org/buildroot/-/jobs/6976341508  | ORPH 
                   beagleboardx15 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6976341511  |      
                   beaglebone_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6976341516  |      
                          beaglev | https://gitlab.com/buildroot.org/buildroot/-/jobs/6976341529  |      
                      beelink_gs1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6976341532  |      
                  chromebook_snow | https://gitlab.com/buildroot.org/buildroot/-/jobs/6976341544  |      
                             ci20 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6976341546  |      
                      cubieboard2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6976341548  |      
            engicam_imx6qdl_icore | https://gitlab.com/buildroot.org/buildroot/-/jobs/6976341549  |      
        engicam_imx6qdl_icore_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6976341553  |      
        engicam_imx6qdl_icore_rqs | https://gitlab.com/buildroot.org/buildroot/-/jobs/6976341556  |      
              engicam_imx6ul_geam | https://gitlab.com/buildroot.org/buildroot/-/jobs/6976341558  |      
             engicam_imx6ul_isiot | https://gitlab.com/buildroot.org/buildroot/-/jobs/6976341561  |      
        freescale_imx6dlsabreauto | https://gitlab.com/buildroot.org/buildroot/-/jobs/6976341565  |      
          freescale_imx6dlsabresd | https://gitlab.com/buildroot.org/buildroot/-/jobs/6976341567  |      
         freescale_imx6qsabreauto | https://gitlab.com/buildroot.org/buildroot/-/jobs/6976341569  |      
           freescale_imx6qsabresd | https://gitlab.com/buildroot.org/buildroot/-/jobs/6976341572  |      
          freescale_imx6sxsabresd | https://gitlab.com/buildroot.org/buildroot/-/jobs/6976341573  |      
           freescale_imx7dsabresd | https://gitlab.com/buildroot.org/buildroot/-/jobs/6976341580  |      
             freescale_imx8dxlevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/6976341584  |      
              freescale_imx8mmevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/6976341590  |      
              freescale_imx8mnevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/6976341594  |      
              freescale_imx8mpevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/6976341596  |      
              freescale_imx8mqevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/6976341599  |      
              freescale_imx8qmmek | https://gitlab.com/buildroot.org/buildroot/-/jobs/6976341601  |      
             freescale_imx8qxpmek | https://gitlab.com/buildroot.org/buildroot/-/jobs/6976341604  |      
           friendlyarm_nanopi_r2s | https://gitlab.com/buildroot.org/buildroot/-/jobs/6976341616  |      
                   imx6-sabreauto | https://gitlab.com/buildroot.org/buildroot/-/jobs/6976341640  |      
                        imx6slevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/6976341648  |      
                       imx6sx-sdb | https://gitlab.com/buildroot.org/buildroot/-/jobs/6976341649  |      
                        imx6ulevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/6976341651  |      
                       imx6ulpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/6976341657  |      
                        imx7dpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/6976341663  |      
                        imx8mpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/6976341671  |      
                        imx8mqevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/6976341673  |      
               kontron_pitx_imx8m | https://gitlab.com/buildroot.org/buildroot/-/jobs/6976341681  |      
                         lego_ev3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6976341687  |      
                       ls1028ardb | https://gitlab.com/buildroot.org/buildroot/-/jobs/6976341691  |      
                     ls1046a-frwy | https://gitlab.com/buildroot.org/buildroot/-/jobs/6976341692  |      
                          mx25pdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/6976341712  |      
                   mx6sx_udoo_neo | https://gitlab.com/buildroot.org/buildroot/-/jobs/6976341718  |      
                          mx6udoo | https://gitlab.com/buildroot.org/buildroot/-/jobs/6976341720  |      
              octavo_osd32mp1_brk | https://gitlab.com/buildroot.org/buildroot/-/jobs/6976341735  |      
              octavo_osd32mp1_red | https://gitlab.com/buildroot.org/buildroot/-/jobs/6976341738  |      
                        odroidxu4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6976341742  |      
                    orangepi_lite | https://gitlab.com/buildroot.org/buildroot/-/jobs/6976341768  |      
                   orangepi_lite2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6976341766  |      
                orangepi_one_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/6976341770  |      
                       pandaboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/6976341787  |      
                           pine64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6976341791  |      
                    pine64_sopine | https://gitlab.com/buildroot.org/buildroot/-/jobs/6976341793  |      
                qemu_aarch64_sbsa | https://gitlab.com/buildroot.org/buildroot/-/jobs/6976341796  |      
               qemu_ppc64_pseries | https://gitlab.com/buildroot.org/buildroot/-/jobs/6976341833  |      
             qemu_ppc64le_pseries | https://gitlab.com/buildroot.org/buildroot/-/jobs/6976341838  |      
                     qemu_sh4_r2d | https://gitlab.com/buildroot.org/buildroot/-/jobs/6976341866  |      
                   qemu_sh4eb_r2d | https://gitlab.com/buildroot.org/buildroot/-/jobs/6976341867  |      
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/6986132837  | ORPH 
                        riotboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/6986134620  |      
                           rock5b | https://gitlab.com/buildroot.org/buildroot/-/jobs/6986135247  |      
                           rock64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6986135321  |      
                       rock_pi_n8 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6986135431  |      
             sipeed_licheepi_zero | https://gitlab.com/buildroot.org/buildroot/-/jobs/6986137874  |      
               snps_arc700_axs101 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6986139381  |      
                 snps_arc700_nsim | https://gitlab.com/buildroot.org/buildroot/-/jobs/6986139617  | ORPH 
                socrates_cyclone5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6986140519  |      
              toradex_apalis_imx6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6986145796  |      
                           ts4900 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6986146282  |      
                           ts7680 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6986146753  |      
                         uevm5432 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6986146853  |      



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
