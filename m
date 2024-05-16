Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07682C25B74
	for <buildroot@archiver.kernel.org>; Thu, 16 May 2024 03:58:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1DC576074D;
	Thu, 16 May 2024 03:58:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hFBs4PsCSJRi; Thu, 16 May 2024 03:58:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D6D0F60C31
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D6D0F60C31;
	Thu, 16 May 2024 03:58:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D03831BF3D2
 for <buildroot@lists.busybox.net>; Thu, 16 May 2024 03:58:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BC31F4072A
 for <buildroot@lists.busybox.net>; Thu, 16 May 2024 03:58:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MWb1xUqKcJPI for <buildroot@lists.busybox.net>;
 Thu, 16 May 2024 03:58:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::223;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4FDD740723
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4FDD740723
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4FDD740723
 for <buildroot@buildroot.org>; Thu, 16 May 2024 03:58:00 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2FD3360006
 for <buildroot@buildroot.org>; Thu, 16 May 2024 03:57:58 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Thu, 16 May 2024 03:57:58 -0000
X-GND-Sasl: bot@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1715831878; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=mZEVzXGh/19iJeYbiGwjfUMdX9ViafSgLL6vQUNUwdo=;
 b=KRBacjCeOPZgKWeKtolJdAvkzwueqvNp5PpbLsUYf6puA+OdLfiKPrgS8vtfVtePZMxbgN
 o0PTErDK4OlmTCosFH7vWU5XA4ca4a43nOTkCEM9Q5vUNFg4nKkOD02btMuxG8DDzhqeI5
 BXkBlaSnttwaybXQxl4FsG8X/p+AZjFWe9nBygX6nixQtQ70gWkFu0ktC+4opyhm9BK2iT
 dNmpcoz67vp2mdGTCad4NOXuBYD72QGvUz3h3nFTVCERcpnkbfTN9an32o9EEPVKvvFISY
 fl5gLmnjziLCGo96lK4njkryk0rUjBJ/zkGu83pR4yDe62hJLSl6lf3pnrd9Cw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=KRBacjCe
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2024-05-15
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
Message-ID: <20240516035758.SbTKi59vJYrCUj8VC9Le8q3rS4xfHCYSrL47WYNauuQ@z>

Hello,

Autobuild statistics for 2024-05-15
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  | 12  |  6  |  1  | 19  |
    master   | 32  | 54  |  1  | 87  |

Classification of failures by reason for master
-----------------------------------------------

                fail2ban-1.0.2 | 5 
                   linux-6.8.9 | 4 
                elfutils-0.189 | 3 
               mariadb-10.11.6 | 3 
                       unknown | 3 
                 coreutils-9.3 | 2 
                    fcft-3.1.6 | 2 
ibm-sw-tpm2-5452af422edeff7... | 2 
                 uclibc-1.0.48 | 2 
                ustreamer-6.11 | 2 
check-11970a7e112dfe243a2e6... | 1 
             containerd-1.7.14 | 1 
                  ffmpeg-6.1.1 | 1 
              fftw-quad-3.3.10 | 1 
           flatbuffers-23.5.26 | 1 
                gnu-efi-3.0.18 | 1 
         gobject-introspection | 1 
kvmtool-4d2c017f41533b0e51e... | 1 
          libcamera-apps-1.2.1 | 1 
                  libffi-3.4.6 | 1 
            libmemcached-1.1.4 | 1 
                librsvg-2.50.9 | 1 
           libzenoh-c-0.11.0.2 | 1 
          linux-5.10.162-cip24 | 1 
                     lxc-5.0.3 | 1 
            micropython-1.22.0 | 1 
                p11-kit-0.25.3 | 1 
               pcsc-lite-2.1.0 | 1 
pppd-e1266c76d1ad39f98f1167... | 1 
          python-grpcio-1.60.0 | 1 
        python-ml-dtypes-0.3.2 | 1 
         python-remi-2022.7.27 | 1 
                    qemu-9.0.0 | 1 
                    rtty-8.1.0 | 1 
             sofia-sip-1.13.17 | 1 
ulog-0389d243352255f6182326... | 1 
             util-linux-2.39.3 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   xtensa    | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/d2c4a1cfd03e1bec74e1a7aaf43a89828d1faee6 | ORPH
  riscv64    |       containerd-1.7.14        | NOK | http://autobuild.buildroot.net/results/c3c6c96e837b5f38fce04db5a762a5be13b9e213 |     
   sparc     |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/d35ae64ece19b6458bf4699e806f7c017fbb6d75 | ORPH
    arm      |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/1aab17839876eb1ad32b619d0161b763e63285e9 | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/779e13b93de99f19f2cfd660025f9cb88618de51 | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/747368203b869b329195fc8319adcdff9f0e30e4 | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/0ac3e848d78f50a7f2323ef7bd534a37a5ffa7a7 | ORPH
   x86_64    |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/4385ce7b933cf789851a1a761d6410a829868acb |     
   s390x     |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/34bdb953b358a19329a8cb94fabea8977373280e |     
    arm      |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/71edad7e4cd59ff4fa85df029b37bed0accfea35 |     
   mipsel    |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/c463c808814cb439e7697b1d51807cd462ede0b8 |     
    sh4      |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/fe426fb1a22c25ad37735787ed437783a60a5a8b |     
    mips     |           fcft-3.1.6           | NOK | http://autobuild.buildroot.net/results/749cefdfe6fff5b649c6c71d222b5ae0f13ed219 |     
    mips     |           fcft-3.1.6           | NOK | http://autobuild.buildroot.net/results/b8faa8243f6267eaf3f01c2b1f205b9602047ffa |     
microblazeel |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/5ec36917e6bb40381df3888b971a5ff8235f2eb4 |     
 powerpc64   |        fftw-quad-3.3.10        | NOK | http://autobuild.buildroot.net/results/9d533cd9299d7915a050c5c983d43840b99f966c | ORPH
    m68k     |      flatbuffers-23.5.26       | NOK | http://autobuild.buildroot.net/results/6d837c5827d678d02cdbcbdf788234100ff42f00 |     
    arm      |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/7dbc7938a065d663fec96f78203e3411f5b4dd61 |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/8665453e2f4f9cfe49008764bdf8e43907c004a3 |     
  mips64el   | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/713ea2e42659f2b38796d13f54f8ac1195e497ba |     
    arm      | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/fe8ff9766bc1014b20fce29da49ac6adc2658f56 |     
    mips     | kvmtool-4d2c017f41533b0e51e... | NOK | http://autobuild.buildroot.net/results/bf0fb0087ca52f43433519fc91d8c7d95b2b66da | ORPH
  sparc64    |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/0cf3e4d0e9c799f6c36c2a71f8e4dc4492ddb5b4 |     
   arceb     |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/c22e6482f89863d3de4ab2cb2c1ab7638b57ad97 |     
   x86_64    |       libmemcached-1.1.4       | NOK | http://autobuild.buildroot.net/results/e55888dce2965e6bdb12b5fc96fb9c5607816373 | ORPH
    arm      |         librsvg-2.50.9         | NOK | http://autobuild.buildroot.net/results/971330325f60fc9178bd6c113c849ebaaa06c921 |     
  sparc64    |      libzenoh-c-0.11.0.2       | NOK | http://autobuild.buildroot.net/results/e07b1b902358bfb4357268e58fe496b2bb8a43ea |     
  riscv64    |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/afb3f4362c82b105af1f36e25dbdc7fa1cb7ac21 | ORPH
   nios2     |          linux-6.8.9           | NOK | http://autobuild.buildroot.net/results/2e4dfe88482a5aa657f276a9cdf1a762107400d1 | ORPH
   xtensa    |          linux-6.8.9           | NOK | http://autobuild.buildroot.net/results/c8f5bb9281d2511364cf0904f674c803da6f8d8f | ORPH
   nios2     |          linux-6.8.9           | NOK | http://autobuild.buildroot.net/results/3754c830b6a5c9fabef5c3f1b3522e0990646f3b | ORPH
 aarch64_be  |          linux-6.8.9           | NOK | http://autobuild.buildroot.net/results/e533d74bb784807e0eac0d6207f30e7544474af9 | ORPH
 aarch64_be  |           lxc-5.0.3            | NOK | http://autobuild.buildroot.net/results/19fa05b628b48d220bbda4a194ab799d55f5a9bc |     
   sparc     |        mariadb-10.11.6         | NOK | http://autobuild.buildroot.net/results/55dbb4ea1fe60338d88bff3108031acead8308ae | ORPH
    mips     |        mariadb-10.11.6         | NOK | http://autobuild.buildroot.net/results/2c9771fe9c49340ba51f3358473c90d7d337336b | ORPH
  aarch64    |        mariadb-10.11.6         | NOK | http://autobuild.buildroot.net/results/29022a29f6e60106260bd221bd097da714d1b3f6 | ORPH
 aarch64_be  |       micropython-1.22.0       | NOK | http://autobuild.buildroot.net/results/69942accc66c812155f55770b559b9dbe4f8f5e6 |     
   sh4aeb    |         p11-kit-0.25.3         | NOK | http://autobuild.buildroot.net/results/41508a057568ad715e9e00a67adfc3867445d6c1 | ORPH
microblazeel |        pcsc-lite-2.1.0         | NOK | http://autobuild.buildroot.net/results/99dd6dc579397885ecc98520bd266e96243d6c08 | ORPH
   sparc     | pppd-e1266c76d1ad39f98f1167... | NOK | http://autobuild.buildroot.net/results/474c0f974f0af222bee2e36f742d07c782e1001e |     
    mips     |      python-grpcio-1.60.0      | NOK | http://autobuild.buildroot.net/results/f7abf52918f34fe5be8583e9aca3e4597e58a3f7 |     
    arc      |     python-ml-dtypes-0.3.2     | NOK | http://autobuild.buildroot.net/results/996b112b1b6a000d87725a47241c5b3a46a05cac |     
    arc      |     python-remi-2022.7.27      | NOK | http://autobuild.buildroot.net/results/6c834de6e9d5ed2b9bc47aa971ff4412bdd954ec |     
powerpc64le  |           qemu-9.0.0           | NOK | http://autobuild.buildroot.net/results/714cb84ed46a6c0ac97638fe159fa614025ec584 |     
   x86_64    |           rtty-8.1.0           | NOK | http://autobuild.buildroot.net/results/ab8faf450a3f4dded07f1b0177ce63299878364c |     
   sparc     |       sofia-sip-1.13.17        | NOK | http://autobuild.buildroot.net/results/0d5f402c42d3ecc4445fd8e7ccfeb28186da9336 |     
    m68k     |         uclibc-1.0.48          | NOK | http://autobuild.buildroot.net/results/e4e9227f8f1b9b9db48eb5b4fa20f1f456b01d9d |     
   arceb     |         uclibc-1.0.48          | NOK | http://autobuild.buildroot.net/results/2edf086945e9725b75be75108f085b567cc069b4 |     
   nios2     | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/500121e7a73259e409b017a0382859f4ece23882 |     
  sparc64    |            unknown             | NOK | http://autobuild.buildroot.net/results/3846cb7f8b06062d98a983758535d39ca3df2360 |     
   s390x     |            unknown             | NOK | http://autobuild.buildroot.net/results/dd6529e5fb479fbf5d47ee0c1dab57cb0bc3eba1 |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.net/results/e8997e1750e5cb73941543e1a1766602f53ec203 |     
    m68k     |         ustreamer-6.11         | NOK | http://autobuild.buildroot.net/results/24498049d7beb4afaaf9f9a0c2fc0bcd26a3ee04 |     
    m68k     |         ustreamer-6.11         | NOK | http://autobuild.buildroot.net/results/a7c02225eee9d37ca0904a20080a1a6393ebff0f |     
    arm      |       util-linux-2.39.3        | NOK | http://autobuild.buildroot.net/results/fb1feb47f2660882fa53f66bacc63e191fd52175 | ORPH


Classification of failures by reason for 2024.02.x
--------------------------------------------------

                heirloom-mailx | 1 
host-heimdal-f4faaeaba371ff... | 1 
        host-sentry-cli-2.20.3 | 1 
                libressl-3.8.4 | 1 
                    ncmpc-0.49 | 1 
                    proj-9.3.0 | 1 
                 shadow-4.14.3 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |         heirloom-mailx         | TIM | http://autobuild.buildroot.net/results/25e162c69e25f1ceddf1786d2ce27abc03b3b89f |     
   mipsel    | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/65a0f6fc9ac14d3727b8b4c5006c6717636724a3 | ORPH
  mips64el   |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/9e147f97f4097d10adc8b46770ffaebcc1271e77 |     
  powerpc    |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/a651a679d0a57c8c388ac169c2ece3549de3b469 | ORPH
  aarch64    |           ncmpc-0.49           | NOK | http://autobuild.buildroot.net/results/24ad8e4cfec1a2c8193467f3641b094457c5f4c1 |     
 aarch64_be  |           proj-9.3.0           | NOK | http://autobuild.buildroot.net/results/b19c11a17b9be6b28320238c8d517900104fdb41 |     
    arm      |         shadow-4.14.3          | NOK | http://autobuild.buildroot.net/results/0ad9d22ac220a93704eb46133351c8462b325b50 |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
