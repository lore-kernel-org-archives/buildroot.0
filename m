Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E5C6C04FFE
	for <buildroot@archiver.kernel.org>; Wed,  8 May 2024 03:59:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9B77481DEE;
	Wed,  8 May 2024 03:59:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6vL88f1FPRsn; Wed,  8 May 2024 03:59:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D588181297
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D588181297;
	Wed,  8 May 2024 03:59:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 478B01BF288
 for <buildroot@lists.busybox.net>; Wed,  8 May 2024 03:59:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 41AA060BA0
 for <buildroot@lists.busybox.net>; Wed,  8 May 2024 03:59:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZUgKKusyXAnx for <buildroot@lists.busybox.net>;
 Wed,  8 May 2024 03:59:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::221;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6019860B94
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6019860B94
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6019860B94
 for <buildroot@buildroot.org>; Wed,  8 May 2024 03:59:37 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 48CF9240002
 for <buildroot@buildroot.org>; Wed,  8 May 2024 03:59:35 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Wed, 08 May 2024 03:59:35 -0000
X-GND-Sasl: bot@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1715140775; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Bb4NtfSE2YpAm9AwSSxy3KleOld+ogml5OPRlP4BpaU=;
 b=QeRom5COzz1DTFgPX7LhdGjA9aN6nIYstSN7iHIuOckeKnOoAFrfUN5pInungylvgnWt7B
 CiUCpmXThvlcmM0ddLm4X8tVylIXTMMOoQ/jiM1rBUpLfuInAoBvGwa8bczrZ0eUeGEA+j
 xVVRGQrWbuGVOdYFioaEj6sux5RrwH8fcbjvjgCMUiOamz2Ui+ioqIUJ4SfmLv6JMWpuYV
 DdXae4pQKqe1jUdFl7JNMKT+w/KKcu0+Ep9d8EFMI7EcMhKiXLm+lFqc+YM/vo0bNthq20
 Y9EfNG1nwxdw5S8CVWSMWt/enfAQKNHkeTxrwkrRep/f4PWIZSxqTkPErpmO2A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=QeRom5CO
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2024-05-07
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
Message-ID: <20240508035935.sf9m0XKbF-NqO9dnzcc0XqF2R6gX7HyJZ9MqHdXMXRM@z>

Hello,

Autobuild statistics for 2024-05-07
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  | 10  | 12  |  0  | 22  |
    master   | 72  | 74  |  1  | 147 |

Classification of failures by reason for master
-----------------------------------------------

                libressl-3.8.4 | 8 
ibm-sw-tpm2-5452af422edeff7... | 4 
              libarchive-3.7.3 | 4 
                       unknown | 4 
                fail2ban-1.0.2 | 3 
host-heimdal-f4faaeaba371ff... | 3 
          libcamera-apps-1.2.1 | 3 
                   linux-6.8.6 | 3 
         python-remi-2022.7.27 | 3 
check-11970a7e112dfe243a2e6... | 2 
                elfutils-0.189 | 2 
                 shadow-4.14.5 | 2 
                   trinity-1.9 | 2 
               belle-sip-4.4.8 | 1 
                 coreutils-9.3 | 1 
                    dust-0.9.0 | 1 
        edk2-edk2-stable202308 | 1 
                    fcft-3.1.6 | 1 
                   foot-1.16.2 | 1 
            gdk-pixbuf-2.42.10 | 1 
glibc-2.39-5-ge0910f1d3278f... | 1 
         gobject-introspection | 1 
  gobject-introspection-1.76.1 | 1 
                 highway-1.1.0 | 1 
 host-binutils-bare-metal-2.42 | 1 
              host-rust-1.74.1 | 1 
          host-sdbus-cpp-2.0.0 | 1 
        host-sentry-cli-2.20.3 | 1 
               ipmitool-1_8_19 | 1 
                  kexec-2.0.28 | 1 
kvmtool-f77d646ba01d04be5aa... | 1 
                  libffi-3.4.6 | 1 
              libopenssl-3.3.0 | 1 
               libunwind-1.6.2 | 1 
                   linux-tools | 1 
ltrace-82c66409c7a93ca6ad2e... | 1 
                mongodb-4.2.18 | 1 
            nodejs-src-20.11.1 | 1 
                 openal-1.22.0 | 1 
               openblas-0.3.27 | 1 
                    proj-9.3.0 | 1 
          python-grpcio-1.60.0 | 1 
python-unittest-xml-reporti... | 1 
                    rtty-8.1.0 | 1 
                  sscep-0.10.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   xtensa    |        belle-sip-4.4.8         | NOK | http://autobuild.buildroot.net/results/643ac09ea0aaf5cf2bc5531c74428b64b5b57956 |     
   arceb     | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/3b037eb8b99da1eea11eacf4b6fb80e4463fff91 | ORPH
  riscv64    | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/57a3ee2667cb9ae288a9f71fc43009c816c16e76 | ORPH
   mipsel    |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/b666529bef2c1abc01352985bdc569fb483ce35c | ORPH
  powerpc    |           dust-0.9.0           | NOK | http://autobuild.buildroot.net/results/44416ab16fc0fd2807752adf5cf90ae9f1cabfa5 | ORPH
    i686     |     edk2-edk2-stable202308     | NOK | http://autobuild.buildroot.net/results/a6030f24db03a785d76a4f3db6c16920ed72f8c0 |     
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/beda4ac3d2f238921c7c17a051ce28a96ceaac52 | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/040d2b7e07fdbac52c6d1ca597ed86614c8f8b76 | ORPH
    i586     |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/ceb32f241c441b90d8321648dcd891ebb6b8ba99 |     
   x86_64    |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/46fe25625f63ba7ad957accfafa2cb0a5f7adf26 |     
   sparc     |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/efefc8d1ead616815f0e738d58bd9989cd042502 |     
    mips     |           fcft-3.1.6           | NOK | http://autobuild.buildroot.net/results/b408f990ef563df26498506875fd9e36d33b90e6 |     
 microblaze  |          foot-1.16.2           | NOK | http://autobuild.buildroot.net/results/2573fd83b35db653a4362686c5e33feb779f0043 |     
    arc      |       gdk-pixbuf-2.42.10       | NOK | http://autobuild.buildroot.net/results/1bcf7446803c11aa1ab788647c7364053714ae3b | ORPH
powerpc64le  | glibc-2.39-5-ge0910f1d3278f... | NOK | http://autobuild.buildroot.net/results/ed205060b5e95279a3c64a821ea713a4e14d3839 |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/d222a41fbcf4a132e4ed234cad3956df1e2d975f |     
  powerpc    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/d3d172e7fd5478ad0f655147a794a12d0125338d | ORPH
 powerpc64   |         highway-1.1.0          | NOK | http://autobuild.buildroot.net/results/e0580ed80a4d51ccb100a4e74dd6008204e80abd |     
    arm      | host-binutils-bare-metal-2.42  | NOK | http://autobuild.buildroot.net/results/a4f4768fce9cb7a94717f1bbfbcf66446763410d |     
   s390x     | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/49c04ed8164db951338ab58062bf09941ad97d9a | ORPH
   s390x     | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/c288328a2ae18c57aad0d2e9b9eeb7424d4b448b | ORPH
    sh4      | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/731b160e58055e992ccfe599af5eaa4e4e12f8c6 | ORPH
   x86_64    |        host-rust-1.74.1        | NOK | http://autobuild.buildroot.net/results/a3b0471e0748432731ac1b95b5b49ca1cb690faa |     
    i686     |      host-sdbus-cpp-2.0.0      | NOK | http://autobuild.buildroot.net/results/66668261d05203575658a243e02e78cf77018d8c |     
    arm      |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/ffb3edb924fa634cc6366a4fc63ef8f2c7b14756 |     
    m68k     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/60620406278dd341ceed72e2f5dc90168f5ef608 |     
   arceb     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/1cf60cd5ede1cf30e978c84ecc1b9edf30e8ce67 |     
 aarch64_be  | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/ae1d4a4e6e020df1ad4d618827105d0b47a17a75 |     
   s390x     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/af2c6f7b61a6a06ed0ce6b86055b1a0c109b7d15 |     
   armeb     |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.net/results/a6d2c77a3f4ac5b5a297c303ce37f6eef8491a24 |     
   armeb     |          kexec-2.0.28          | NOK | http://autobuild.buildroot.net/results/815a006fa24127988b5796fe809d17b38464bcd0 |     
    i686     | kvmtool-f77d646ba01d04be5aa... | NOK | http://autobuild.buildroot.net/results/42a44adfb91d5157d327396d9753418f25eebfef | ORPH
 microblaze  |        libarchive-3.7.3        | NOK | http://autobuild.buildroot.net/results/70c4e6851b59217b6dd50a47ebd9a48a3f61a05f |     
   sh4eb     |        libarchive-3.7.3        | NOK | http://autobuild.buildroot.net/results/e8d02caf188e70e42fc2f493585e02caa35c9ad9 |     
   s390x     |        libarchive-3.7.3        | NOK | http://autobuild.buildroot.net/results/9db0615d6d02b66befdc2ec3b67dc90e22dd5b6b |     
powerpc64le  |        libarchive-3.7.3        | NOK | http://autobuild.buildroot.net/results/5bac7bcbc05658157d52229c96dc4913497521fa |     
   x86_64    |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/c38f1deff3631e3c165a2d94674ec9107432c474 |     
 powerpc64   |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/f3645728630714d2eee250a49d89bd10610842d6 |     
   x86_64    |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/6d8507c90ba2848d9c8fbf515b675109cab5df42 |     
    arc      |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/f67fbb6275fb557271c175d0426d3f80a31d34fa |     
  riscv32    |        libopenssl-3.3.0        | NOK | http://autobuild.buildroot.net/results/4fe575a25b4cea11517d1ad3730e7a978331159d | ORPH
 microblaze  |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/7ec8cf1875e11b347069c0ae46dfbf8d9e4b7cd7 | ORPH
    arc      |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/4ea36468ff61d1ca32c1d247c08373139fb59ac9 | ORPH
   xtensa    |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/89d37ead74042e0229a686c77a4c92251d935bcd | ORPH
  powerpc    |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/2d69a8354398bb9ccc80354acf8c9e3c3bd1412b | ORPH
    arm      |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/07a57ecf10aa54a5e6b1f5bba08008ec4d81642a | ORPH
 microblaze  |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/7f3d9f6b1ff5d4485d1668b2c69960c666f39814 | ORPH
   s390x     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/8ccdd6c467ce3818a4a2cfbcf64a5c33e4038464 | ORPH
   sparc     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/99405146b2596ff367651eaebf3a803b6c9a14bd | ORPH
  powerpc    |        libunwind-1.6.2         | NOK | http://autobuild.buildroot.net/results/dc0eb9cd85231f0672ecc9e998579c9283e8c334 | ORPH
   mips64    |          linux-6.8.6           | NOK | http://autobuild.buildroot.net/results/707513be45f1de304077e3148b4db75213273dac | ORPH
   nios2     |          linux-6.8.6           | NOK | http://autobuild.buildroot.net/results/b0f2281dcce1a19ed59c037b23923293b97a2ee1 | ORPH
   sparc     |          linux-6.8.6           | NOK | http://autobuild.buildroot.net/results/3928cc6d45491a14a999745f74b48d887454c859 | ORPH
  aarch64    |          linux-tools           | NOK | http://autobuild.buildroot.net/results/b9fb3e206570cc48a2d6895bfbdd1e8fa48de843 | ORPH
    arm      | ltrace-82c66409c7a93ca6ad2e... | NOK | http://autobuild.buildroot.net/results/bf404d5034578c60e48968b05fdc2fb1d69a2aae | ORPH
  aarch64    |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/3423ac0c7bfd936e800187b8fa04accefe9396ff |     
  aarch64    |       nodejs-src-20.11.1       | NOK | http://autobuild.buildroot.net/results/4d23cd5e7da0fab6a13c695513a07147f23dcebf |     
    mips     |         openal-1.22.0          | NOK | http://autobuild.buildroot.net/results/a721f425238c75848d31b087af3fc009dfe2fe77 | ORPH
  mips64el   |        openblas-0.3.27         | NOK | http://autobuild.buildroot.net/results/979478909bc4398aa490b009db2b123e7a679322 |     
    sh4      |           proj-9.3.0           | NOK | http://autobuild.buildroot.net/results/d13fe15d8791bd5d2526a9fcb5b7e5aa82421daf |     
  mips64el   |      python-grpcio-1.60.0      | NOK | http://autobuild.buildroot.net/results/1e977f6105f46c3fb1628cac0f61b713d8eff2df |     
    or1k     |     python-remi-2022.7.27      | NOK | http://autobuild.buildroot.net/results/48ec8fee7be563924287d785cb4373a0cbca20a9 |     
  mips64el   |     python-remi-2022.7.27      | NOK | http://autobuild.buildroot.net/results/8f4604e37a95bd51b9a16c1259a4e9dc003eae35 |     
   mipsel    |     python-remi-2022.7.27      | NOK | http://autobuild.buildroot.net/results/e5b6c10bc3be4f18384e920bef2767506764a5ce |     
   nios2     | python-unittest-xml-reporti... | NOK | http://autobuild.buildroot.net/results/58f01abcd5437da1e4e1d103c61eccf63a9a70ab |     
    or1k     |           rtty-8.1.0           | NOK | http://autobuild.buildroot.net/results/922b513ae7d9017f08d8f9498ab58230ac729989 |     
    arc      |         shadow-4.14.5          | NOK | http://autobuild.buildroot.net/results/a35758feee143307b26549ea69f176a744d7f269 |     
  powerpc    |         shadow-4.14.5          | NOK | http://autobuild.buildroot.net/results/97235869aa8d8ed0cfd7c2fdcf3b8b89ca399870 |     
    i586     |          sscep-0.10.0          | NOK | http://autobuild.buildroot.net/results/d5b1b4e5e9d9c8eca5e75c345db4d1f3f0cd84ed |     
powerpc64le  |          trinity-1.9           | NOK | http://autobuild.buildroot.net/results/de3d37712d2e7eb821178c2a1a925fe636abb798 | ORPH
   x86_64    |          trinity-1.9           | NOK | http://autobuild.buildroot.net/results/eca6f442efac926b9857d12aa32c4a09e7967543 | ORPH
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/2fde15998268f77879051ae79324aa545a76febc |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/ded9a5cd05cb379c010fac35ca15e87f78f14fa1 |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/9c348a58f0b64caabb77f72dfdb1b5b50b823b5d |     
   s390x     |            unknown             | NOK | http://autobuild.buildroot.net/results/ac391a04a3e4754b7d5b39d9e14efb0304c42ea0 |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

host-heimdal-f4faaeaba371ff... | 2 
               ding-libs-0.6.2 | 1 
                elfutils-0.189 | 1 
        host-sentry-cli-2.20.3 | 1 
          libcamera-apps-1.2.1 | 1 
              libgeotiff-1.7.1 | 1 
                librsvg-2.50.9 | 1 
                mongodb-4.2.18 | 1 
                    proj-9.3.0 | 1 
                    ruby-3.3.0 | 1 
                 wolfssl-5.7.0 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |        ding-libs-0.6.2         | NOK | http://autobuild.buildroot.net/results/5cb8bed1276586dc987665a435cc1b52cff72a46 |     
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/baa777c9900149628765607eed545984d2ab7932 | ORPH
    sh4      | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/63ebee50c5c67928861679b6d4c4def3cba5f623 | ORPH
  mips64el   | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/557add58cadf5002d0b87201186b5bfaa7b0c43f | ORPH
   xtensa    |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/3eb5bd2effb68c28ee7221784f984f0a0d888ea8 |     
powerpc64le  |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/64423cf02c6a8ab7e904f7dee564246c872d8323 |     
    or1k     |        libgeotiff-1.7.1        | NOK | http://autobuild.buildroot.net/results/aac6379b3a066b93ca2681cbe008f20a44e71db8 |     
   x86_64    |         librsvg-2.50.9         | NOK | http://autobuild.buildroot.net/results/85179605c109e60eab1fc2db67687ab871b4681e |     
  aarch64    |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/71cddadcdc2aa2ab284ba7565ccc5c4a99caadf1 |     
microblazeel |           proj-9.3.0           | NOK | http://autobuild.buildroot.net/results/3c6b10f198623e2df3d7c78be7cf878e72c1cf60 |     
  riscv64    |           ruby-3.3.0           | NOK | http://autobuild.buildroot.net/results/4708d7c3bb98af1898c07acc403e7a859393f0fb |     
  mips64el   |         wolfssl-5.7.0          | NOK | http://autobuild.buildroot.net/results/4fe7cb63f2e0d446265d83d67950671be99db88d |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
