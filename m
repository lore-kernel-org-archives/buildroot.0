Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5052CD11C2
	for <buildroot@archiver.kernel.org>; Wed, 10 Apr 2024 03:56:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0BDDA406A4;
	Wed, 10 Apr 2024 03:56:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YCrcMoTpbr06; Wed, 10 Apr 2024 03:56:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 80BA3406D1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 80BA3406D1;
	Wed, 10 Apr 2024 03:56:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BD86A1BF3A0
 for <buildroot@lists.busybox.net>; Wed, 10 Apr 2024 03:56:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A3FB181C11
 for <buildroot@lists.busybox.net>; Wed, 10 Apr 2024 03:56:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sPeLcJXoIdQc for <buildroot@lists.busybox.net>;
 Wed, 10 Apr 2024 03:56:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org AFAB381BCB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AFAB381BCB
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AFAB381BCB
 for <buildroot@buildroot.org>; Wed, 10 Apr 2024 03:56:48 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 61748E0005
 for <buildroot@buildroot.org>; Wed, 10 Apr 2024 03:56:45 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Wed, 10 Apr 2024 03:56:45 -0000
X-GND-Sasl: bot@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1712721405; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Ko4v13lXwegB6yFG5O/gK9Y17dRrVJnHM7y0i3LpSEg=;
 b=Jei203vmoQtmKc2i5Vad9ZSGPHbvXN2LecyWJVkl+U/o5SGgBRfc7+hZJtbPbLwAMXzSSr
 LmK2Via4tzFMlUBnXNMVDXS0HMJHvfkJGBhfCDTA1pZc5ylZ+lU9owWFSm3OFyYr1+w5uC
 xrOt9Pvp/z7hcikwk7+yAfCRMI+eA0rl0Ai6dvbnG3z/EVaLikshQ7Ejwndxd0aggoLbHR
 YNsRiFvn41RBnbskfraSu7idZiDTpj/v/5D9QGAouevwlK2Ly9MQbB/9FYVsZ4qqUPAWeC
 QAX7DBnBmywq/3KMFqvWObhJ1bMg+wyA2j5QeP79T3BNKkZ5VZjnJHw+qmkwow==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Jei203vm
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2024-04-09
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
Message-ID: <20240410035645.ecTz_--4AjnByEP-QNTNREAglATwKThnnsfImkJcI7E@z>

Hello,

Autobuild statistics for 2024-04-09
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  9  |  9  |  0  | 18  |
    master   | 64  | 94  |  0  | 158 |

Classification of failures by reason for master
-----------------------------------------------

                fail2ban-1.0.2 | 6 
                libressl-3.8.4 | 6 
                       unknown | 5 
                elfutils-0.189 | 4 
host-heimdal-f4faaeaba371ff... | 4 
          libcamera-apps-1.2.1 | 4 
           dmraid-1.0.0.rc16-3 | 3 
glibc-2.39-5-ge0910f1d3278f... | 3 
         host-libxcrypt-4.4.36 | 3 
              libarchive-3.7.2 | 3 
                   bird-2.0.12 | 2 
                    fcft-3.1.6 | 2 
   host-flutter-sdk-bin-3.19.4 | 2 
              host-rust-1.74.1 | 2 
        host-sentry-cli-2.20.3 | 2 
                  libffi-3.4.6 | 2 
              libopenssl-3.2.1 | 2 
                   linux-6.8.1 | 2 
                privoxy-3.0.34 | 2 
         python-remi-2022.7.27 | 2 
               apcupsd-3.14.14 | 1 
           at-spi2-core-2.50.0 | 1 
                    brltty-6.6 | 1 
                     crun-1.12 | 1 
                     file-5.45 | 1 
                flannel-0.24.2 | 1 
                   foot-1.16.2 | 1 
            gdk-pixbuf-2.42.10 | 1 
                  gensio-2.5.5 | 1 
                gnu-efi-3.0.18 | 1 
  gobject-introspection-1.76.1 | 1 
               host-wine-8.0.2 | 1 
                   libnss-3.99 | 1 
                librsvg-2.50.9 | 1 
                  libsepol-3.5 | 1 
                 libv4l-1.24.1 | 1 
          linux-5.10.162-cip24 | 1 
     linux-5.10.162-cip24-rt10 | 1 
            linux-fusion-9.0.3 | 1 
                memtest86-6.20 | 1 
                 mesa3d-24.0.4 | 1 
                 openssh-9.7p1 | 1 
   openvmtools-11.3.5-18557794 | 1 
                    proj-9.3.0 | 1 
    python-cryptography-39.0.2 | 1 
            python-scapy-2.5.0 | 1 
            quickjs-2024-01-13 | 1 
                    sslh-2.0.1 | 1 
             stress-ng-0.15.07 | 1 
ti-sgx-km-cf7f48cb30abfd5df... | 1 
             util-linux-2.39.3 | 1 
               valgrind-3.22.0 | 1 
                    zeek-4.1.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   xtensa    |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/2398d2b4d41eac479d5cbeb06e3a1da6eabc894b |     
    or1k     |      at-spi2-core-2.50.0       | NOK | http://autobuild.buildroot.net/results/5cb09b3f6b844b0b203ee901f4f93b743796788e |     
 powerpc64   |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/06510bfda439032f70f29ea642872022873a3995 |     
    sh4      |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/64968da0f7ec6e49761583a40a25e94faa5fc55f |     
  powerpc    |           brltty-6.6           | NOK | http://autobuild.buildroot.net/results/8614a871e94426db03928603b680af029ceec3aa |     
  powerpc    |           crun-1.12            | NOK | http://autobuild.buildroot.net/results/20d5c6fe240b65f9d4647eb9fa09f10376cfe952 |     
 aarch64_be  |      dmraid-1.0.0.rc16-3       | NOK | http://autobuild.buildroot.net/results/8368a7f6b72100a3b2ca7ebca91748aff3c1368d | ORPH
 aarch64_be  |      dmraid-1.0.0.rc16-3       | NOK | http://autobuild.buildroot.net/results/1ec54ead380045cb6a98eb61036b619d0eb86499 | ORPH
    or1k     |      dmraid-1.0.0.rc16-3       | NOK | http://autobuild.buildroot.net/results/ad6c095ed62fae4f89d555dfc6e985c65572e6b1 | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/bd26cedd9569de7fe48f04b85634b44eb0b3ca50 | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/93dfc2675ab803b82c3059f378fc27f7e87b8a9c | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/b0e25ccca1973efabf684f535c8e9cff88bfbf87 | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/868a83f8aa5404c013f18fc0948db5eaa9ad7fc0 | ORPH
   nios2     |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/e4e28250dfa12f314096f9fae6a79d1196271554 |     
    sh4      |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/93dc5f6773e2fcdec363f9af0181831656abf451 |     
  mips64el   |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/a3fc58f8098aee8882de2bd40cb42ddc82315595 |     
   x86_64    |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/1cb2ef045943e2c0bec2ec7811bd724c0947ae30 |     
    arc      |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/dfeb05d0a1fba4cafd8dbf25b9bcdd3c83c2445b |     
   mips64    |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/4f4768a513b1d2967ebd48ddff259c430cd41283 |     
 aarch64_be  |           fcft-3.1.6           | NOK | http://autobuild.buildroot.net/results/3f00f7d0cb38034bf98d8ba0e289112139290f08 |     
  aarch64    |           fcft-3.1.6           | NOK | http://autobuild.buildroot.net/results/23e52c38b932f2de8caa1e6e562564183d5c7b4e |     
    arm      |           file-5.45            | NOK | http://autobuild.buildroot.net/results/be9e33915608d09136e6f7eea02be04f23b54a90 | ORPH
  riscv64    |         flannel-0.24.2         | NOK | http://autobuild.buildroot.net/results/0c8515d2ef453d53a50bd518905f958312a6e4d3 |     
   nios2     |          foot-1.16.2           | NOK | http://autobuild.buildroot.net/results/6d331cab9703112641acaa28d59cd56c492bbab9 |     
   mipsel    |       gdk-pixbuf-2.42.10       | NOK | http://autobuild.buildroot.net/results/581fb33ba374fdcb0aba50a2d9a10e82f3784206 | ORPH
    mips     |          gensio-2.5.5          | NOK | http://autobuild.buildroot.net/results/f661b660face81a9bdfaad1474062c2f0c6e22ca |     
   arceb     | glibc-2.39-5-ge0910f1d3278f... | NOK | http://autobuild.buildroot.net/results/8a771d058f6db920353eaeed11bd1c3c54574bbd |     
 powerpc64   | glibc-2.39-5-ge0910f1d3278f... | NOK | http://autobuild.buildroot.net/results/e6044d9c45f9e70e99d5ded9364b714ed771c76d |     
 powerpc64   | glibc-2.39-5-ge0910f1d3278f... | NOK | http://autobuild.buildroot.net/results/36546fa3cb9d27cb451baedfe1183d998fede87b |     
    arm      |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/a50dc684e95dfa4d3fa4bda010373ed749263f78 |     
   nios2     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/6ee997229b5e60518b9751a90362d744faaea68a | ORPH
  sparc64    |  host-flutter-sdk-bin-3.19.4   | NOK | http://autobuild.buildroot.net/results/65812dff4a3a96cc435a537c72a01d439372f003 |     
    arm      |  host-flutter-sdk-bin-3.19.4   | NOK | http://autobuild.buildroot.net/results/0ae3760c4113e6c210fefd7dd93c3b08d2a0dd67 |     
    or1k     | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/1449234d2511ecaec646a30aef872e323f9ce102 | ORPH
   s390x     | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/1d67f975b086dffd960305336c843eb7c7207fa2 | ORPH
  aarch64    | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/7b8eab10d2c99644df818db6248e6050c0594bf7 | ORPH
  sparc64    | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/ec818aa8e1ea4cc3738592520bd64f4e6b103497 | ORPH
   mipsel    |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.net/results/9c69413282ebc462c0b27a14aa56b0a1eecb105f |     
 aarch64_be  |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.net/results/7757912354b2e4bbfcc81bb1d03c40da68c2b6e7 |     
  mips64el   |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.net/results/daa403353d7d58b1bec9c370ea3062c081c15611 |     
   armeb     |        host-rust-1.74.1        | NOK | http://autobuild.buildroot.net/results/179379d564ab8e376b4a6b51c17efa1164e71c8e |     
   x86_64    |        host-rust-1.74.1        | NOK | http://autobuild.buildroot.net/results/fe2abe1af09a0221f7b152404ea367a7a121d0fa |     
   x86_64    |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/eec9ee0a4f5ec9f9946f30022357f3799b382a1f |     
    mips     |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/d22650bd459517fd468747aff4d0d14d2b9acc7d |     
    i686     |        host-wine-8.0.2         | NOK | http://autobuild.buildroot.net/results/d58a24d15b8f86e55ad2162a1092b39044b59652 |     
   x86_64    |        libarchive-3.7.2        | NOK | http://autobuild.buildroot.net/results/ccc49defa1d5fcedcda7d4ac2c13a134d82f8770 |     
    i686     |        libarchive-3.7.2        | NOK | http://autobuild.buildroot.net/results/6bee50f17554b163164da57ecd7729ef6ae1b2e1 |     
    i686     |        libarchive-3.7.2        | NOK | http://autobuild.buildroot.net/results/f520709a45e57f5559208077b6d13188103b3cd5 |     
   mipsel    |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/0db8cd33975af6078af6092556b83eb3c49f8730 |     
  aarch64    |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/25dc6400f8b702a6b8e5135244654352bab9de93 |     
   sparc     |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/54d8a1bb67cdbd136a8deb61a628b6798942ac06 |     
    arm      |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/a283ee7a1943bcaaf15cbe1c081536d5944b0cd3 |     
    arc      |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/a11f286cf57c4f2331db751b6d2cfb987ea2fbbf |     
    arc      |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/6fb1bef183fb1040cd7a446fcce84ccd7248b3dc |     
 microblaze  |          libnss-3.99           | NOK | http://autobuild.buildroot.net/results/f68f5379fbfd2e92f8157609fd71404839efee27 |     
    arm      |        libopenssl-3.2.1        | NOK | http://autobuild.buildroot.net/results/66e2673431536a8ae3e2755642411dc1aef46b99 | ORPH
    arm      |        libopenssl-3.2.1        | NOK | http://autobuild.buildroot.net/results/b3642fed8cd8d5c30d0d058788a9d47ff80b7468 | ORPH
   nios2     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/c2a4bb373ad1dab548d595aaa91b53c734804707 | ORPH
    arc      |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/a5d8634564c82a3321f7bb5487ff3488bb7b4922 | ORPH
microblazeel |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/5de6c3fb9ae5dc1cd45fd7842404e85b05ae33e5 | ORPH
    arc      |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/0fa2ab3f08a6990e8df4795bcc6e59bfc8d399cb | ORPH
  mips64el   |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/e79e5496c1e6d7b72ac16d5aba75db6d7b70238a | ORPH
   nios2     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/b0ef4fabae07437e4b4024bd5a3f4bf8f441311e | ORPH
   x86_64    |         librsvg-2.50.9         | NOK | http://autobuild.buildroot.net/results/3765d22c5cf02b2980a8a83574464857af063f42 |     
    arm      |          libsepol-3.5          | NOK | http://autobuild.buildroot.net/results/bb3ef0427b6b0d889dccb03dc560f049acc6de8f |     
   nios2     |         libv4l-1.24.1          | NOK | http://autobuild.buildroot.net/results/bb1b18d78ceaae6ca1955895ee7c4cbc2c468778 |     
   mips64    |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/c68d676e8cd4524c67e7f50f5f859ad2264dc17c | ORPH
   mipsel    |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/8a66a2b932d18a3404b45b98064e2a04014b8394 | ORPH
    arm      |          linux-6.8.1           | NOK | http://autobuild.buildroot.net/results/c74fab50780859706653f14a0c1488d94a996d89 | ORPH
  riscv64    |          linux-6.8.1           | NOK | http://autobuild.buildroot.net/results/2202adca97f96f4ef9f56badec2ce3da6acc0527 | ORPH
  riscv64    |       linux-fusion-9.0.3       | NOK | http://autobuild.buildroot.net/results/ac267791b8d5f13497cd7384ab6986027468efef | ORPH
    i686     |         memtest86-6.20         | NOK | http://autobuild.buildroot.net/results/9f54255af197343fdb6d115391dda885c2444a1b |     
  powerpc    |         mesa3d-24.0.4          | NOK | http://autobuild.buildroot.net/results/54ea2360ebfbbdc9ad1990a8bc28e43437550196 |     
microblazeel |         openssh-9.7p1          | NOK | http://autobuild.buildroot.net/results/8cf23a58fd045071b4b88e0434a7e32b7e66c257 | ORPH
   x86_64    |  openvmtools-11.3.5-18557794   | NOK | http://autobuild.buildroot.net/results/6554d537023cc9b401a8ab943bc25f8a1ddcde52 |     
 aarch64_be  |         privoxy-3.0.34         | NOK | http://autobuild.buildroot.net/results/0ff855c6d1bc0a3f0d098b88b5a988d57007c5cc |     
  riscv32    |         privoxy-3.0.34         | NOK | http://autobuild.buildroot.net/results/81ac73c3c12434981baf8c1bfdcac66967fa0598 |     
    or1k     |           proj-9.3.0           | NOK | http://autobuild.buildroot.net/results/29b7f933fba303910c00b354965c2e78b83dd69b |     
  sparc64    |   python-cryptography-39.0.2   | NOK | http://autobuild.buildroot.net/results/06368a939b576c2d427c2ace605a3ad2b02cd470 |     
powerpc64le  |     python-remi-2022.7.27      | NOK | http://autobuild.buildroot.net/results/c2d00dd6827e5920efdd2148ae9a819f94475423 |     
powerpc64le  |     python-remi-2022.7.27      | NOK | http://autobuild.buildroot.net/results/4bbbd4f8f81aa1ed2647570445ff556308e973b4 |     
   xtensa    |       python-scapy-2.5.0       | NOK | http://autobuild.buildroot.net/results/6b0fa4e630a47e9c1dd201b1be5f241481443145 |     
    or1k     |       quickjs-2024-01-13       | NOK | http://autobuild.buildroot.net/results/58b96ccc4e8575d4053dd86acbc068d9cc5a0d33 |     
   sh4eb     |           sslh-2.0.1           | NOK | http://autobuild.buildroot.net/results/757dfdc05c5505ddd037c973546ecdc31eed850c | ORPH
   xtensa    |       stress-ng-0.15.07        | NOK | http://autobuild.buildroot.net/results/ee89f86030b07725e9d6c460b28c4fc7e9ee3b74 |     
    arm      | ti-sgx-km-cf7f48cb30abfd5df... | NOK | http://autobuild.buildroot.net/results/04fd659472f1928c2621354bb0ea3b60c5dfadec |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/1a511973c3c7879f25246217b7d602ed6072e046 |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/c2e9e17b64031f6393748cd79c0f2513b4a0ef4b |     
 powerpc64   |            unknown             | NOK | http://autobuild.buildroot.net/results/7a5825db2bc7284bc9fe15f73a6eee8f7a092274 |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/9515a321f6bd451cb9aedd3e29c0eda805a4dd93 |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/d53d97232bacc61ca7905eada408256c4e496100 |     
   arceb     |       util-linux-2.39.3        | NOK | http://autobuild.buildroot.net/results/5af655fde649d358bdb80db044b0ec4240d12704 | ORPH
    mips     |        valgrind-3.22.0         | NOK | http://autobuild.buildroot.net/results/63f89a3d90795ea261cf91bcaa10342eadfbe9ed | ORPH
    arm      |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/e3caf19947efafe4f9d75c96defbe75571a63c68 |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

               apcupsd-3.14.14 | 1 
                   bird-2.0.12 | 1 
                 coreutils-9.3 | 1 
glibc-2.38-44-gd37c2b20a478... | 1 
                  jack2-1.9.22 | 1 
                 openssh-9.7p1 | 1 
                oprofile-1.4.0 | 1 
ulog-0389d243352255f6182326... | 1 
                 wavemon-0.9.5 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/59f0beccc71e262017addacd11c24661b7943d67 |     
  sparc64    |          bird-2.0.12           | NOK | http://autobuild.buildroot.net/results/426fadfa69df002e6e9c0184ed3beb1665895806 |     
    arc      |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/64b680dd103062f9d8cc27181090a77ad469dd75 | ORPH
   arceb     | glibc-2.38-44-gd37c2b20a478... | NOK | http://autobuild.buildroot.net/results/be6561fe4bf329cbe3feb381f477b3b5a12c3bbf |     
    m68k     |          jack2-1.9.22          | NOK | http://autobuild.buildroot.net/results/89f0c27d0ac508eb6851465e8feffc4f0acfbe84 |     
    mips     |         openssh-9.7p1          | NOK | http://autobuild.buildroot.net/results/f42a56a29270bdf9cda321cc17212c685b2c957e | ORPH
    arm      |         oprofile-1.4.0         | NOK | http://autobuild.buildroot.net/results/8ba6638b4338dedec121f03fbe5ec10ce2ace322 |     
   x86_64    | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/50f782db3d453b864833a0aa53d7b16118b09f57 |     
   s390x     |         wavemon-0.9.5          | NOK | http://autobuild.buildroot.net/results/74a1399c8881147f61400648769fda2c50838232 | ORPH



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
