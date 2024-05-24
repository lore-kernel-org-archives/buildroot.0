Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20A9DC25B74
	for <buildroot@archiver.kernel.org>; Fri, 24 May 2024 04:09:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 17E3541849;
	Fri, 24 May 2024 04:09:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gLj8UEQma-Hl; Fri, 24 May 2024 04:09:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AF5A240B62
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AF5A240B62;
	Fri, 24 May 2024 04:09:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2BCDA1BF42C
 for <buildroot@lists.busybox.net>; Fri, 24 May 2024 04:09:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B3C7581312
 for <buildroot@lists.busybox.net>; Fri, 24 May 2024 04:09:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EHEAOWHPxCii for <buildroot@lists.busybox.net>;
 Fri, 24 May 2024 04:09:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EEEC081303
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EEEC081303
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EEEC081303
 for <buildroot@buildroot.org>; Fri, 24 May 2024 04:09:03 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 56B321BF205
 for <buildroot@buildroot.org>; Fri, 24 May 2024 04:08:59 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Fri, 24 May 2024 04:08:59 -0000
X-GND-Sasl: bot@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1716523739; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=p4pDq7a0qkZUKq5j6vLMpkX9ej6C/gwWXJ+A3Wj7Rys=;
 b=kQ2A6TDZWa3h4mYzH1CLXyZNyZGe88ShsQWpy1VYG5KpyY/HF4qQWMFHviEvK5Gg1WPrdb
 3oafyE/Ln0f++QaffU4iHkCS+aZkUUHegYpFkA6Jy8r+xfHghUNgiS5uYPPNFYQYvI/Z1u
 L3r/4sE3REP9bhEJ4hhEH5unZR0f2OIFB4AmCpEg6KtblOYsnQMZknz3Q1jsxZ4WEcrQ6u
 mh3EVwqEY6D7q0//CPVC3upGwNk5cCtt5V1Eno7iDXnerxs0ic1+b97CHaCZ1v+O5qNnML
 00khRYVzEjwWVsubo/qFCPVw8Cv7J0KhxiXbN5FGGrZhpHdGrb+dLiq+jGuL+Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=kQ2A6TDZ
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2024-05-23
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
Message-ID: <20240524040859.w052qOMytqF9ZMq3SzMa32fCvB_qA2Vr_Xh8RdEKKVM@z>

Hello,

Autobuild statistics for 2024-05-23
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  6  |  9  |  0  | 15  |
    master   | 29  | 66  |  0  | 95  |

Classification of failures by reason for master
-----------------------------------------------

ibm-sw-tpm2-5452af422edeff7... | 4 
              libopenssl-3.3.0 | 4 
                 coreutils-9.3 | 3 
                     crun-1.12 | 3 
host-heimdal-f4faaeaba371ff... | 3 
          libcamera-apps-1.2.1 | 3 
                libressl-3.8.4 | 2 
                  libsepol-3.6 | 2 
                   linux-6.8.9 | 2 
                   lmdb-0.9.31 | 2 
           mediastreamer-4.4.8 | 2 
                 shadow-4.14.5 | 2 
aer-inject-9bd5e2c7886fca72... | 1 
           at-spi2-core-2.50.0 | 1 
     bandwidthd-2.0.1-auto-r11 | 1 
                   bird-2.0.12 | 1 
                   botan-3.3.0 | 1 
check-11970a7e112dfe243a2e6... | 1 
          cryptodev-linux-1.13 | 1 
                 dhcpcd-10.0.5 | 1 
                   exim-4.97.1 | 1 
                    eza-0.18.8 | 1 
                fail2ban-1.0.2 | 1 
                  ffmpeg-6.1.1 | 1 
              fftw-quad-3.3.10 | 1 
            gdk-pixbuf-2.42.10 | 1 
google-breakpad-f49c2f1a202... | 1 
         host-libxcrypt-4.4.36 | 1 
                 libp11-0.4.12 | 1 
              libtracefs-1.8.0 | 1 
               libunwind-1.8.1 | 1 
           libzenoh-c-0.11.0.2 | 1 
               lighttpd-1.4.76 | 1 
                lua-cffi-0.2.3 | 1 
               mariadb-10.11.6 | 1 
                mongodb-4.2.18 | 1 
                 openssh-9.7p1 | 1 
   openvmtools-11.3.5-18557794 | 1 
         python-remi-2022.7.27 | 1 
             sofia-sip-1.13.17 | 1 
                 uclibc-1.0.48 | 1 
                       unknown | 1 
                ustreamer-6.11 | 1 
             util-linux-2.39.3 | 1 
                 x11vnc-0.9.16 | 1 
                    zeek-4.1.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/fc2dcec6244b27b0a46b056ab3238a7c7e9cf908 | ORPH
  riscv64    |      at-spi2-core-2.50.0       | NOK | http://autobuild.buildroot.net/results/f22caafae0c8b2d15afeb0a117ff1725a6d233c2 |     
    arm      |   bandwidthd-2.0.1-auto-r11    | NOK | http://autobuild.buildroot.net/results/91a8daf78959de3bd6d78ada0d60477971402c5b |     
    arc      |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/8eae6c8bc233b839979563c3d81a9b2b63c94912 |     
   sparc     |          botan-3.3.0           | NOK | http://autobuild.buildroot.net/results/9fe5ae5053a5bffd0b174b717db269cca10cb91e | ORPH
   arceb     | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/f6dd4007aac780cd7a12ea094726c230c25a3d4e | ORPH
  powerpc    |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/09c16ab0b2f3b7885fa2fca155ee0d5076a86ea2 | ORPH
   mipsel    |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/4381260e2dabaff39a5a4f4621041982b4cfc665 | ORPH
    i686     |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/6476e3f5f50ed0441d3842f4e9ce9af2c121046d | ORPH
   xtensa    |           crun-1.12            | NOK | http://autobuild.buildroot.net/results/c7278d43f464c86d488af76f1e4e1f64e7e02a6e |     
    or1k     |           crun-1.12            | NOK | http://autobuild.buildroot.net/results/9d78bb5841a4ae15548e9d0ecaccfff5cfec282a |     
  riscv64    |           crun-1.12            | NOK | http://autobuild.buildroot.net/results/828310407f7b7b2b8091026893b9fde99e0347d3 |     
   sh4eb     |      cryptodev-linux-1.13      | NOK | http://autobuild.buildroot.net/results/466360c7baec2edf42dc6f0ad9a8d757dd471c88 | ORPH
  mips64el   |         dhcpcd-10.0.5          | NOK | http://autobuild.buildroot.net/results/e64c96ba337ef07e67c828a00ab0e7ff5ea7a557 |     
   sparc     |          exim-4.97.1           | NOK | http://autobuild.buildroot.net/results/ffb3903b05a018a1aa144d4189428845263d48c8 |     
   x86_64    |           eza-0.18.8           | NOK | http://autobuild.buildroot.net/results/7edd641593239984f3ec47a57015e7ac405bf3a1 |     
   mipsel    |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/918d2cdde1447e7fd3b87d2e3983552f9a55b782 |     
microblazeel |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/892b5bee776355072f650ab8b0d1c0bc4c3d25b2 |     
powerpc64le  |        fftw-quad-3.3.10        | NOK | http://autobuild.buildroot.net/results/c6ebcb43e8a2b34dece192cf0bad21051d58fc9e | ORPH
microblazeel |       gdk-pixbuf-2.42.10       | NOK | http://autobuild.buildroot.net/results/0584866475a978f9c2bb666fd318ae19ffad8f68 | ORPH
   mipsel    | google-breakpad-f49c2f1a202... | NOK | http://autobuild.buildroot.net/results/835b82533a930c75702c136631598f9ce442fd9a |     
powerpc64le  | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/af3ebad29ca62db31ad74c7b9f77b094c2c758ae | ORPH
microblazeel | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/610001428916b3dd9f2ea670f3861f2d44fa2424 | ORPH
   x86_64    | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/6bc8a15623c2473da6f74ec3901f11d7384297ea | ORPH
    arc      |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.net/results/d80a62a6cc8aa03c22420daae42de2a18df9ee06 |     
    arc      | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/19ec13ae2aae502a326d4f125e5e38ae90f95bd1 |     
   nios2     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/7cfef0e139a910cdf15b22920900778a6d4a71d1 |     
    mips     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/ea2734544c09c2b238e389ed8672b37a8ede412c |     
    m68k     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/1b13e37e1c2a8d5e8767a4ae77df5a4747c8e230 |     
    i686     |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/cedf0c14b0d6bed2f14f3628d418eb2bc76825aa |     
    arm      |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/d558378492f69de877a06a5ef8302cc7d34a00c7 |     
   s390x     |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/c8a7cc6cab8b8f404f462100acb69fe3519b60fa |     
  riscv32    |        libopenssl-3.3.0        | NOK | http://autobuild.buildroot.net/results/8ffcab71273142c09f73f2d6bf4dd5aaf32792fa | ORPH
  riscv32    |        libopenssl-3.3.0        | NOK | http://autobuild.buildroot.net/results/68db03dcc2889a70724be87b6bd17bb86736eba8 | ORPH
  riscv32    |        libopenssl-3.3.0        | NOK | http://autobuild.buildroot.net/results/72dc39261d6b8b36be522c8110cb2fe059ec12cc | ORPH
  riscv32    |        libopenssl-3.3.0        | NOK | http://autobuild.buildroot.net/results/78ab06e0c1efb89bae50be28ee57e906fa234350 | ORPH
   s390x     |         libp11-0.4.12          | NOK | http://autobuild.buildroot.net/results/743b6fa2fc9fde407701006766d0cd238ee0c8fd | ORPH
   mips64    |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/dae5c37ca85f887939f1bfceab29f2aeefaa122b | ORPH
powerpc64le  |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/6a0369809b267913851f9b475b64f33d05a437be | ORPH
   xtensa    |          libsepol-3.6          | NOK | http://autobuild.buildroot.net/results/309a81bc9daaa92cdfbaa79b2e9335772c8a90d6 |     
   xtensa    |          libsepol-3.6          | NOK | http://autobuild.buildroot.net/results/9fb915f52303f2b66ae9d485d25014d8e9eb205a |     
 microblaze  |        libtracefs-1.8.0        | NOK | http://autobuild.buildroot.net/results/c58a5368200c99dc1c13398e194c459b87f8f5d4 |     
  aarch64    |        libunwind-1.8.1         | NOK | http://autobuild.buildroot.net/results/9c2bc5a8a27c1a2dd6f372aa8072793b351a6ded | ORPH
   s390x     |      libzenoh-c-0.11.0.2       | NOK | http://autobuild.buildroot.net/results/88d0d4993b59ba2506aef466f8ccbe1d48f9c151 |     
  sparc64    |        lighttpd-1.4.76         | NOK | http://autobuild.buildroot.net/results/f33e09e9754f5501ebfd2d61dfeee996eb2feacc | ORPH
 microblaze  |          linux-6.8.9           | NOK | http://autobuild.buildroot.net/results/75e8e1d501d7c4dc144aa12f3e9cdc5e3505936a | ORPH
    mips     |          linux-6.8.9           | NOK | http://autobuild.buildroot.net/results/f913be4bde4a16d0211f5709e403a717a2e14ccd | ORPH
 aarch64_be  |          lmdb-0.9.31           | NOK | http://autobuild.buildroot.net/results/a37e56582e17f8acd80419d07cc051e75fb24ab6 |     
  mips64el   |          lmdb-0.9.31           | NOK | http://autobuild.buildroot.net/results/97e3fa8464a109e2556425c6aca00cd4087c1466 |     
    or1k     |         lua-cffi-0.2.3         | NOK | http://autobuild.buildroot.net/results/4e14753732c5b6fe8ba9ecc4050ffb35f471c428 |     
   sparc     |        mariadb-10.11.6         | NOK | http://autobuild.buildroot.net/results/5eeb98b42eda62851429210ecebbc64ec044bdf5 | ORPH
   s390x     |      mediastreamer-4.4.8       | NOK | http://autobuild.buildroot.net/results/cd0e5f28c8cc1491d94102b4544b888ae53d5c52 | ORPH
    mips     |      mediastreamer-4.4.8       | NOK | http://autobuild.buildroot.net/results/3e1b538351c5f1db8b3db1065fc61082d73f9f04 | ORPH
  aarch64    |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/975ec5ee44a5a1d9c13064b33bf1b67434aa3170 |     
    m68k     |         openssh-9.7p1          | NOK | http://autobuild.buildroot.net/results/8dbbc4811ddad6902b6633a747935c65e70b367a | ORPH
   x86_64    |  openvmtools-11.3.5-18557794   | NOK | http://autobuild.buildroot.net/results/72e5d62a5ae2e62e53f8cd72e56a220d51ea53d7 |     
   nios2     |     python-remi-2022.7.27      | NOK | http://autobuild.buildroot.net/results/d82161ea69fb99927d11674287cd5bd994a6a344 |     
    or1k     |         shadow-4.14.5          | NOK | http://autobuild.buildroot.net/results/29d87cdafffb7a0046d72a7ba4ae25848d89d6d7 |     
   mipsel    |         shadow-4.14.5          | NOK | http://autobuild.buildroot.net/results/76b921490810b438e3d86e8fc1e75a759b57e139 |     
   mipsel    |       sofia-sip-1.13.17        | NOK | http://autobuild.buildroot.net/results/7b65065afcfb1d15fca4ac1d6ec23ed9b0372316 |     
    sh4      |         uclibc-1.0.48          | NOK | http://autobuild.buildroot.net/results/c887342ad9c6548d8c5c26d4f28719e47c7745a8 |     
    sh4      |            unknown             | NOK | http://autobuild.buildroot.net/results/bf8f717c6312c387e12b1882a0bdabd2d3367f73 |     
    or1k     |         ustreamer-6.11         | NOK | http://autobuild.buildroot.net/results/2bbf4a4e5daa7c24178bcd59ce59c3b0b4a411e0 |     
    arm      |       util-linux-2.39.3        | NOK | http://autobuild.buildroot.net/results/6645dfd37f4221f2d1a838ed8e3e1345f9d0d5a8 | ORPH
   armeb     |         x11vnc-0.9.16          | NOK | http://autobuild.buildroot.net/results/755ffd677c2b8bcd7f25362888f49d346697d249 |     
    arc      |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/88cd68dc5bc47ed5d44cdd5e8143179a68210e06 |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

                  bitcoin-26.0 | 1 
                 coreutils-9.3 | 1 
                elfutils-0.189 | 1 
                    fcft-3.1.6 | 1 
glibc-2.38-44-gd37c2b20a478... | 1 
                libressl-3.8.4 | 1 
          linux-5.10.162-cip24 | 1 
                mongodb-4.2.18 | 1 
                 wolfssl-5.7.0 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |          bitcoin-26.0          | NOK | http://autobuild.buildroot.net/results/cf3b0e80d4fcadbbb5fc56bf9d36af30cafe0082 |     
    m68k     |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/43aed22060a6829239b8bbdaa1ad1e964d4fb726 | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/0b4ada9741a5bc79384ac9dc3930da0def5cad24 | ORPH
 aarch64_be  |           fcft-3.1.6           | NOK | http://autobuild.buildroot.net/results/352be2980527c44a24e7df5314372da8a58d98f0 |     
powerpc64le  | glibc-2.38-44-gd37c2b20a478... | NOK | http://autobuild.buildroot.net/results/3fc95a4b51f6bd2542f7d5b34ff96d74234d1693 |     
   s390x     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/fdd13e7fc5451de83216f3e9e724e4fbdc3d8aab | ORPH
    mips     |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/5c54fb3ce8a282c47b548dd7f4eead620ce67380 | ORPH
    arm      |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/c819a1eb48daf1891da3072de1d8c2850b03b5a5 |     
   mipsel    |         wolfssl-5.7.0          | NOK | http://autobuild.buildroot.net/results/c20d936004be906e82ccd463da357d14bf24315f |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
