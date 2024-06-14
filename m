Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C7ABC27C77
	for <buildroot@archiver.kernel.org>; Fri, 14 Jun 2024 04:42:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5D64683B34;
	Fri, 14 Jun 2024 04:42:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7wFwJL7gZa0Y; Fri, 14 Jun 2024 04:42:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8A69983A5D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8A69983A5D;
	Fri, 14 Jun 2024 04:42:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7C91F1BF338
 for <buildroot@lists.busybox.net>; Fri, 14 Jun 2024 04:42:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6040B61084
 for <buildroot@lists.busybox.net>; Fri, 14 Jun 2024 04:42:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NoWY6zFWFA51 for <buildroot@lists.busybox.net>;
 Fri, 14 Jun 2024 04:42:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 15BFF61082
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 15BFF61082
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 15BFF61082
 for <buildroot@buildroot.org>; Fri, 14 Jun 2024 04:42:08 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id EAFB1240007
 for <buildroot@buildroot.org>; Fri, 14 Jun 2024 04:42:05 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Fri, 14 Jun 2024 04:42:05 -0000
X-GND-Sasl: bot@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1718340126; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=fih+92KsIZJwx55cT6NfVzGqtr79OGuLE5bEbFTJ0gI=;
 b=Wb4FTaTldSIXzDxgUI9/9LCZEr87BXwi8w/9xirfYUO/Vt9Ng7lZ9X2h9Kde9aRe1GJVFG
 t0tT0ixCo8bzbwUi0QI1TVOs49HP70erbfm59oXx9nXRhpv+1a36vibi3YDJKT+ohZ5ajq
 lhkL6+6r0YmGkm9uP2YmHQ0VjwuAYKjGoatr9BQ8CueMe4TufhhRJ73ackikrn+bzOEBnX
 fxOVHOndfk4e2xurhAVasPRyeOsuNtbzqlyDO7r1x1XTXiqDWGiVFiMBsteWiJIOictYtc
 RtmePK92v5GXJdIwX5WvmheU+G43dUbXJzLAQa9WsANHntuD7FTE7qljzJsp9g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Wb4FTaTl
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2024-06-13
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
Message-ID: <20240614044205.BHEdJEJ25GS8ynMRTyBV1CQ9O66i1p426b0o2JicUOw@z>

Hello,

Autobuild statistics for 2024-06-13
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  7  |  9  |  0  | 16  |
  2024.05.x  |  3  |  5  |  0  |  8  |
    master   | 114 | 362 |  1  | 477 |

Classification of failures by reason for master
-----------------------------------------------

host-prelink-cross-a853a5d7... | 66
            host-cdrkit-1.1.11 | 34
                libressl-3.8.4 | 23
      host-riscv-isa-sim-1.1.0 | 14
                    mpir-3.0.0 | 14
ibm-sw-tpm2-5452af422edeff7... | 11
glibc-2.39-5-ge0910f1d3278f... | 8 
                elfutils-0.189 | 7 
                fail2ban-1.0.2 | 7 
                  ffmpeg-6.1.1 | 7 
host-heimdal-f4faaeaba371ff... | 7 
host-vboot-utils-bbdd62f9b0... | 7 
                host-go-1.22.4 | 6 
                host-odb-2.4.0 | 6 
        host-sentry-cli-2.20.3 | 6 
                  linux-6.8.12 | 6 
                  bcusdk-0.0.5 | 5 
              execline-2.9.5.1 | 5 
                   foot-1.16.2 | 5 
host-android-tools-4.2.2+gi... | 5 
              libarchive-3.7.4 | 5 
                  libffi-3.4.6 | 4 
                       unknown | 4 
                 cdrkit-1.1.11 | 3 
               ipmitool-1_8_19 | 3 
          libcamera-apps-1.2.1 | 3 
         python-remi-2022.7.27 | 3 
android-tools-4.2.2+git2013... | 2 
                 apache-2.4.59 | 2 
                    attr-2.5.2 | 2 
                 avro-c-1.11.3 | 2 
     bandwidthd-2.0.1-auto-r11 | 2 
                    bat-0.24.0 | 2 
             berkeleydb-5.3.28 | 2 
check-11970a7e112dfe243a2e6... | 2 
                 coreutils-9.3 | 2 
             dahdi-linux-3.3.0 | 2 
                 gnuplot-6.0.0 | 2 
  gobject-introspection-1.76.1 | 2 
google-breakpad-f49c2f1a202... | 2 
               libglib2-2.76.1 | 2 
     linux-5.10.162-cip24-rt10 | 2 
                   linux-tools | 2 
ltrace-82c66409c7a93ca6ad2e... | 2 
                 pixman-0.42.2 | 2 
pppd-e1266c76d1ad39f98f1167... | 2 
                    proj-9.3.0 | 2 
                   trinity-1.9 | 2 
             util-linux-2.39.3 | 2 
          alsa-plugins-1.2.7.1 | 1 
                     apr-1.7.2 | 1 
                 augeas-1.12.0 | 1 
                beecrypt-4.2.1 | 1 
                  boost-1.83.0 | 1 
brcm-patchram-plus-95b7b691... | 1 
                 c-icap-0.5.10 | 1 
              cache-calibrator | 1 
                  cairo-1.17.4 | 1 
                  clang-15.0.3 | 1 
                     crun-1.12 | 1 
                   cvs-1.12.13 | 1 
                  dump1090-9.0 | 1 
                    eza-0.18.8 | 1 
                  fbdump-0.4.2 | 1 
                  gamin-0.1.10 | 1 
            gdk-pixbuf-2.42.10 | 1 
                gnu-efi-3.0.18 | 1 
         gobject-introspection | 1 
                 highway-1.1.0 | 1 
                   host-go-src | 1 
         host-libxcrypt-4.4.36 | 1 
 host-softether-4.30-9700-beta | 1 
                    htop-3.3.0 | 1 
                ipmiutil-3.1.9 | 1 
kvmtool-4d2c017f41533b0e51e... | 1 
              libopenssl-3.3.1 | 1 
                librsvg-2.50.9 | 1 
               libunwind-1.8.1 | 1 
         lttng-modules-2.13.10 | 1 
           mediastreamer-4.4.8 | 1 
                  nginx-1.24.0 | 1 
                opencv3-3.4.19 | 1 
                 openssh-9.7p1 | 1 
                python3-3.11.8 | 1 
                 shadow-4.14.5 | 1 
             sofia-sip-1.13.17 | 1 
             stress-ng-0.17.07 | 1 
                 tbtools-0.3.2 | 1 
                 uclibc-1.0.48 | 1 
uclibc-ng-test-0f303c63fab7... | 1 
                   uhd-4.3.0.0 | 1 
wilc-driver-linux4microchip... | 1 
                 wolfssl-5.7.0 | 1 
                    xen-4.14.6 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |      alsa-plugins-1.2.7.1      | NOK | http://autobuild.buildroot.net/results/8eb052bde6004c9750d53cbcfcafec7911e651c2 |     
   xtensa    | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/f995b8cdf3cdbd2c63f0263eb7e38d08de7b9b4b |     
   mips64    | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/f6b5946f12a93a2f4643247538ae434478985ba3 |     
powerpc64le  |         apache-2.4.59          | NOK | http://autobuild.buildroot.net/results/c540a00a47d0a5d0278abc99fdc724b6cb9bf3bc |     
    mips     |         apache-2.4.59          | NOK | http://autobuild.buildroot.net/results/23eefbaf786d8fe262a06e8cdb6b708e99d44730 |     
    i686     |           apr-1.7.2            | NOK | http://autobuild.buildroot.net/results/5b33c2bb4efcf953d548bc3973ec9f1b910863ca |     
   mipsel    |           attr-2.5.2           | NOK | http://autobuild.buildroot.net/results/1e135239bda7791a519c1472ed0166dc7b6acee8 |     
  mips64el   |           attr-2.5.2           | NOK | http://autobuild.buildroot.net/results/4b35edb6a33c67757498866978b442ee60a93890 |     
  riscv64    |         augeas-1.12.0          | NOK | http://autobuild.buildroot.net/results/2895d9b84b635e0a73726b2992a5c7a5bd92ab58 | ORPH
    arm      |         avro-c-1.11.3          | NOK | http://autobuild.buildroot.net/results/1caed9c3fd9c6238ebdbe49b4627c670aaee9d2f |     
   mipsel    |         avro-c-1.11.3          | NOK | http://autobuild.buildroot.net/results/f7ddf90533a3c25a62d6ca21152f7e3d3b44a3f9 |     
 powerpc64   |   bandwidthd-2.0.1-auto-r11    | NOK | http://autobuild.buildroot.net/results/0ed0cc0fe2d73ba2a0ffbba0927aee23a438b9a3 |     
  mips64el   |   bandwidthd-2.0.1-auto-r11    | NOK | http://autobuild.buildroot.net/results/67a42a0758110334779ba1bae517931efc534cde |     
   armeb     |           bat-0.24.0           | NOK | http://autobuild.buildroot.net/results/5e01fc751d34387baeea28a5714529bea7e6405e |     
    i686     |           bat-0.24.0           | NOK | http://autobuild.buildroot.net/results/643c0b9fa2366ba9e079b218c64d72a5c63cd2b0 |     
   sh4aeb    |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/97ede97a41a3a563b8db436f1bb92c98b39e9703 |     
    arc      |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/118fb5852c047e4b0272ab07370d2bb233f9c7e2 |     
  sparc64    |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/cc23a2c48077ef2f39d605342b4a3242b0dc1889 |     
  sparc64    |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/5a143a5f9259c28110752b7948f67882a26e0fd8 |     
    arm      |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/2df67e3d836ea5ec1173b4d321c28c58d64fa0fa |     
    arm      |         beecrypt-4.2.1         | NOK | http://autobuild.buildroot.net/results/abd66f223fa54a71de5a8ddf92738104bc18bd8f | ORPH
  riscv64    |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/e0d6bdbef01bee277b0da83605b2906af876058a | ORPH
    arm      |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/e94232b3a5f5de2fff520f5bd10c3eac00c725e9 | ORPH
    arc      |          boost-1.83.0          | NOK | http://autobuild.buildroot.net/results/adb87280fbdf14a173dbe0471c4fb5d29cbb7233 |     
    arc      | brcm-patchram-plus-95b7b691... | NOK | http://autobuild.buildroot.net/results/e33c599f84750d5c4d27d5a727daf8670d86d208 |     
    mips     |         c-icap-0.5.10          | NOK | http://autobuild.buildroot.net/results/b25aab25582e40675b32f47a61b714451688dcb1 | ORPH
   arceb     |        cache-calibrator        | NOK | http://autobuild.buildroot.net/results/f8ddcfbe9ba7cfbe376afcafcf09f8b4e4caafe9 |     
    arc      |          cairo-1.17.4          | NOK | http://autobuild.buildroot.net/results/4544ca49cdaf4f7b926054d6adeb677eb5ecae79 |     
   armeb     |         cdrkit-1.1.11          | NOK | http://autobuild.buildroot.net/results/b4dd39f6e6da6ced7b61bd8b4f71740edbf4a26f |     
  mips64el   |         cdrkit-1.1.11          | NOK | http://autobuild.buildroot.net/results/05d1e65c2d6914e44876f31117a0d3fbde96123c |     
   armeb     |         cdrkit-1.1.11          | NOK | http://autobuild.buildroot.net/results/58f8a87dfe4ae942ff2f2a5f54b88f4ea1756d06 |     
   sparc     | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/41d63a194f9dafd3cce9af816984878dc9ae3da8 | ORPH
    m68k     | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/1a5fe176d631b236c445dc849261654bc3c50d09 | ORPH
  riscv32    |          clang-15.0.3          | NOK | http://autobuild.buildroot.net/results/7e77e2ff87a5de67433bb3fe9018625421cfcefb |     
   s390x     |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/b92fe4ef12fd553194b0cff8b83d7646563c5e02 | ORPH
    m68k     |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/b20a5c7232339c2ca2b1beded0f3b364856a90f2 | ORPH
    m68k     |           crun-1.12            | NOK | http://autobuild.buildroot.net/results/b6d14f17cd5f78f3447b279461792cdfc05aae32 |     
 powerpc64   |          cvs-1.12.13           | NOK | http://autobuild.buildroot.net/results/8bd4731d9d057ef13ef9a4baa39b17066e01ceef | ORPH
   s390x     |       dahdi-linux-3.3.0        | NOK | http://autobuild.buildroot.net/results/49e533b7f18651d468da7568632f4b309ffc24dd |     
   s390x     |       dahdi-linux-3.3.0        | NOK | http://autobuild.buildroot.net/results/44ee7cd92ed19d5150fad3beb03e4065ad5d7d18 |     
   nios2     |          dump1090-9.0          | NOK | http://autobuild.buildroot.net/results/650ed2d2792f92289c99dbcd39c8472cb110f4a4 |     
   mipsel    |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/06e9658c2df8405109266dff1daaf6dcc309ca6a | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/a44cd8cd97b5d566d78c367bdcc424e601a0030b | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/fcb66eb97bb9372c576a74fbaacaefc930b413f9 | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/f5a6d3c53246dea2418a4554be9f5ebdce036469 | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/82a954d5e481610c4678be335c07cd181448358b | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/8bf9160dcfa1b9c5d1260eeb8ffc9a39cb7ff507 | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/e5c00fbc6bc1561600fdd02df129678f670dfd3c | ORPH
    sh4      |        execline-2.9.5.1        | NOK | http://autobuild.buildroot.net/results/739b5e126980db06172f2fc6161e2dbb7e6010e3 |     
   sparc     |        execline-2.9.5.1        | NOK | http://autobuild.buildroot.net/results/6f6ec12dc56a13566c2364bb4d663b17c8c1a408 |     
    arm      |        execline-2.9.5.1        | NOK | http://autobuild.buildroot.net/results/502eae8c61f16df00d23bf24cc71b25a92210b2a |     
    sh4      |        execline-2.9.5.1        | NOK | http://autobuild.buildroot.net/results/75e9ac6719a5ab6ad3e6dfed175b1db2d0b4432d |     
   sparc     |        execline-2.9.5.1        | NOK | http://autobuild.buildroot.net/results/798b6c4cb0d06d6be1d1f34a26884a7e9f78dfb5 |     
    i686     |           eza-0.18.8           | NOK | http://autobuild.buildroot.net/results/23ccc368c9f6ae1595b8469f21ee8d206ee0b0a9 |     
    m68k     |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/ab38677b532c1d0c34aa38fd227f4a255a2ed13e |     
  sparc64    |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/598c6775d12002b85b78206b403eecdd0bd3fb66 |     
 aarch64_be  |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/fb2d7cc9e27ca68f05cbf05b42ec22f98e057c6e |     
  riscv32    |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/8e4fd3a0aeb7875a9ce7b0a4addce586ad43a453 |     
 aarch64_be  |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/393e5b0aeca0d9de1d66ec5dccdd5683cd39a07e |     
microblazeel |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/5faecd36481a648abb568c4af0eff2d7440a8259 |     
    sh4      |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/d0c0253cc51652b005c4b87bcdfa860bb2dbc20e |     
   sparc     |          fbdump-0.4.2          | NOK | http://autobuild.buildroot.net/results/f365489a8642eaf66720f3f6ad0484d907e7c2d2 | ORPH
   arceb     |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/e4badf8bcf1cb4d490fb1b320d9380ca998724a0 |     
   arceb     |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/00994537873018cc41139767ae77aba7aa231adb |     
    arc      |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/e77e65d92a8391940caf15bc48fc30c2ca5d19b0 |     
 microblaze  |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/e4c1b072311c64dd61207d2ddbd5b55cb3b295ec |     
 microblaze  |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/b3b5a4d8e4e02c8ac0974550caa28a4f65b958d5 |     
 microblaze  |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/4e84c067eaab8cbb12f9f7a8b3650e899dc8c1f3 |     
    arc      |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/10ada08de9c8db896d7e0cc68c9547e51c33982b |     
   nios2     |          foot-1.16.2           | NOK | http://autobuild.buildroot.net/results/dc368e44381ae3e73f47ec78ffa0f5a65cd92fa6 |     
microblazeel |          foot-1.16.2           | NOK | http://autobuild.buildroot.net/results/7d2348e0a2d1f89b613e0557d22a890ea0878fa9 |     
   mipsel    |          foot-1.16.2           | NOK | http://autobuild.buildroot.net/results/effb67ee912123af51268bbef6b0da0861c48d27 |     
   nios2     |          foot-1.16.2           | NOK | http://autobuild.buildroot.net/results/aa23b3941130c9353d558e9bc2d88acccb6185c7 |     
   mipsel    |          foot-1.16.2           | NOK | http://autobuild.buildroot.net/results/a283caa43442886d6259edcf1451afc1eed6db08 |     
   sh4eb     |          gamin-0.1.10          | NOK | http://autobuild.buildroot.net/results/865c000e8e37b9d27e46808fc124026c6b785344 | ORPH
    i686     |       gdk-pixbuf-2.42.10       | NOK | http://autobuild.buildroot.net/results/0014c646c33ed7dddef172d9af698a0d30fcbe5b | ORPH
 powerpc64   | glibc-2.39-5-ge0910f1d3278f... | NOK | http://autobuild.buildroot.net/results/0bd0e915e774254480e322a9b10861b4ccb96e2b |     
powerpc64le  | glibc-2.39-5-ge0910f1d3278f... | NOK | http://autobuild.buildroot.net/results/610a0c7027ed5543a67f3b8e32b04dc9c1a5c290 |     
powerpc64le  | glibc-2.39-5-ge0910f1d3278f... | NOK | http://autobuild.buildroot.net/results/5d256e78b664ed266cd0965c20c900849bd8723e |     
   arceb     | glibc-2.39-5-ge0910f1d3278f... | NOK | http://autobuild.buildroot.net/results/89bb51c3ad1fc7937104ebfb615524a67e52b144 |     
 powerpc64   | glibc-2.39-5-ge0910f1d3278f... | NOK | http://autobuild.buildroot.net/results/f9a6f31ef6a27be123e8090351be102bdb27eed7 |     
   arceb     | glibc-2.39-5-ge0910f1d3278f... | NOK | http://autobuild.buildroot.net/results/32790c8d5985321b4f41e81a7bb4f537ddd96363 |     
powerpc64le  | glibc-2.39-5-ge0910f1d3278f... | NOK | http://autobuild.buildroot.net/results/ec366094d78e0254315aa3f0172740e5b902b222 |     
powerpc64le  | glibc-2.39-5-ge0910f1d3278f... | NOK | http://autobuild.buildroot.net/results/6fa895ce9117a2296ae3c911f634ba93c02a7b24 |     
  riscv64    |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/750811ba41e0aab744204132cc23db3311d670e4 |     
microblazeel |         gnuplot-6.0.0          | NOK | http://autobuild.buildroot.net/results/5880826abc62cfa2e8f73717910b2696a73fdbb6 |     
    mips     |         gnuplot-6.0.0          | NOK | http://autobuild.buildroot.net/results/e19f88a1dd93391ed0eeac586c279856198be047 |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/832545204854d9494cc2450a28b0d2a02245f6e7 |     
    mips     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/42461c26773aa9374c2145bd3b9a3aa6d8f5c5cc | ORPH
   x86_64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/9a3c12229b08926ac59d179edd42ee2f24cddb60 | ORPH
   mipsel    | google-breakpad-f49c2f1a202... | NOK | http://autobuild.buildroot.net/results/fdfa2331585a510aecc977bf2f283e861a2339ef |     
   mipsel    | google-breakpad-f49c2f1a202... | NOK | http://autobuild.buildroot.net/results/ecfb238fd91eb57da463de096445ea05852d7506 |     
 powerpc64   |         highway-1.1.0          | NOK | http://autobuild.buildroot.net/results/0b6ec4ae34d5b9540bb45b820ae463bdedf844df |     
   armeb     | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/6a5b58710bedd347f17f258479f7a6190c0f4c2a |     
    mips     | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/3e577752f1a67bb507a356cde79f7acf422ae46f |     
   armeb     | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/f8b2510c157156983a9b5cab4754e2d04f4ac371 |     
   armeb     | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/39fba5cf53809dd01f33334707803af07146bda1 |     
    m68k     | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/fd7366236bbd27abeb00b7489e0c89953be4bbcd |     
   mipsel    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/0808a400cd488a5b11c25ff67d0923b059ed8a26 |     
    arc      |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/5434c2c8545109f8734bd68e7003584970937017 |     
    mips     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/bd2855201c5a5ce244ea6c89de7c07472d6c377f |     
    or1k     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/ca0ab0b3105746c8032cb977d4bda975c4023426 |     
    i686     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/0b275395c90c8063caad452c8f7df1e4d2cbd602 |     
    arc      |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/50bd5f8cb5ab2dcbecbb562e0b9584db38a284ba |     
  mips64el   |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/1dc88b3f751136ee2f74d6c4420204724657c4e1 |     
   armeb     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/43565540ed1651b5209913c5b2cd8905c311ee9c |     
  powerpc    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/ef7b884e2a2af4e1d2d09172ea97e4ea4aa33052 |     
    i686     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/46d0d99ac0623cb8b3026443e39337be1b536fcd |     
   sparc     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/f186b4c7e1dc47d8019981d44ec811fa3fe2ac2c |     
   s390x     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/d1ec0b5a61ab9d544cbef5d30f836230700b41a2 |     
microblazeel |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/ab644453bb00c2a5da40146a5e2c4276a75cfaba |     
 microblaze  |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/dd21ea8263191c7b697fec3b90b10ad993449e55 |     
    mips     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/5c3f8bba593387b9ac3af7df943d3abd333952e3 |     
   mips64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/3e20ab8801eee51f7b4504df6870b6a3014b940b |     
   mipsel    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/78fb2b1d9bf072a5067d5d301e4c31e9e0f5c900 |     
powerpc64le  |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/e3ba785a6a099455a455e883eafeda51b4554dba |     
   sparc     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/a99270a624b78ef8f57c251b304966aec0f701f6 |     
powerpc64le  |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/8feaae8430f7ba49902a71e9d2983ede4e5126d8 |     
  powerpc    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/9b7b300fb846bb28063a41eed7eb9b055c1833df |     
    arm      |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/6159d39093c0639a3ed9bed6382830f17adff1d3 |     
   sparc     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/2478f370910d00d97b1aa54b9333028a429d6298 |     
    arm      |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/0421ed2082f681bc8f0f2b2ee781eab3065e1140 |     
   arceb     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/01053f33bf07ff29850ce2bfd4872c6e50b03ca5 |     
  sparc64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/b2b54bf98cee0343e87833936ea01c910602244e |     
    arm      |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/103e5f8d29001f7e15b3356cd1dfeee5e7133922 |     
  aarch64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/10912f73a9b1bb26714314e504efd1c49dd5d7a8 |     
    mips     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/a25c413636415f65fc0dc4eea914fad95f1b94fd |     
   s390x     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/51dcfd008775fcf8e6079c459224faaafac70500 |     
    or1k     |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/eee7e3d74e6b2995ce366df3e241c078343bac0b |     
microblazeel |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/af2092e282211834a6a01dae0036795c90ba97ee |     
   mips64    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/41caedfa8e9d19e6839e1e67e015d31cc495753e |     
  powerpc    |       host-cdrkit-1.1.11       | NOK | http://autobuild.buildroot.net/results/dc5711b7b24918fd832cf9e5aac49df0480c443e |     
  mips64el   |         host-go-1.22.4         | NOK | http://autobuild.buildroot.net/results/e2e4dbd6189880e365ab319ccb87ba56782f08d2 |     
   mips64    |         host-go-1.22.4         | NOK | http://autobuild.buildroot.net/results/568e870c56cbf7a65e049b7443d50ad5f2d04713 |     
   mips64    |         host-go-1.22.4         | NOK | http://autobuild.buildroot.net/results/ed77bb02cd7f052a5ba8bf3283b66d56b38c974c |     
   mips64    |         host-go-1.22.4         | NOK | http://autobuild.buildroot.net/results/653d04a60519daa2e25d46f51504ee82378cd13a |     
  riscv64    |         host-go-1.22.4         | NOK | http://autobuild.buildroot.net/results/6290c6cdeed0d41d6afcb5649f8fbd9fc93deea5 |     
  riscv64    |         host-go-1.22.4         | NOK | http://autobuild.buildroot.net/results/ef7de20c4e2176b54aa2d93f41494480680636b1 |     
    i686     |          host-go-src           | NOK | http://autobuild.buildroot.net/results/5ed567fc374e377b451a6638d232feda3412775c |     
  sparc64    | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/ba7c6f0974b88e75e9f19cd1ad3acf9387a4d203 | ORPH
   s390x     | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/0003ca23c69d07aa055ac248c0d0179f7db9391f | ORPH
    or1k     | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/a3e1a856a2988e57b3ba3a8af3b5a91afb0f8c04 | ORPH
  mips64el   | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/75cbba5d22843bb696f4215b454bcecb1621a10d | ORPH
  mips64el   | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/90b4ce21822ea91a23ba8cfd598c1503f15b6faa | ORPH
  mips64el   | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/059c232c27de0f862ce0ab73d504c0dc93380820 | ORPH
   s390x     | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/4e9a5e5da5202de9c9c56d3a1c5bb24bf34d7f9d | ORPH
   mips64    |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.net/results/e5b6221ed7f8b39829539515730c1a062f1b723c |     
   s390x     |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/502d9945e150de3a53e0bb7a7bd63b045d6c8922 | ORPH
    or1k     |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/317901148a38879c9e856195fd25dd9962491396 | ORPH
    arm      |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/f0787e92315977eefd3c8697f4e5d6479ec7af05 | ORPH
   s390x     |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/711be210164d2303f71c3d3f775ad23966bdf2c0 | ORPH
   mips64    |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/132e61d358a2053d5da24db55d96cdc4781546ee | ORPH
  aarch64    |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/893a06340f22d362ec623324ed32991f7ad7326b | ORPH
 aarch64_be  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/82a6c8c52113a740ab8f1984bd4b8cbda29cd5e1 | ORPH
    arm      | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/edf5f9808b413b7d932c8723ca8a77bf0976fcf7 | ORPH
    arm      | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/8ac7b070ba6ed39ab0c24023a1011c900eabfd7d | ORPH
   arceb     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/626c30cfd20a4b9524f09dcfd79afb40697d1530 | ORPH
    or1k     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/ef923894a852cf742b52754106f3bd6a36cdd170 | ORPH
    i686     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/171e085eab314e250b5a3e29f4b497eb63e1ab2e | ORPH
  sparc64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/f516303a626ecd5d2bd4f416f5735349f16174b2 | ORPH
  sparc64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/54f3cf62925a39f76ecc9880735394632a2934b0 | ORPH
  aarch64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/9e28a29258fe4ecf4ad8474eb99f55d777955fcb | ORPH
    arm      | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/a646d4edb2aadd771f786466de2ab137077f8dec | ORPH
   arceb     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/494e1834cda77ccd1c9e8e7b3f989fa2f32d4449 | ORPH
   mips64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/bf6cae85ca18472b902c363a98386e5996321339 | ORPH
   armeb     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/df68670b58b1dc0858188ea71a5e3d882d1cf802 | ORPH
 powerpc64   | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/a0c9dc51e320acefcfa32ecfe8a29ada591f5212 | ORPH
    arm      | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/908c522734266434052f197b2a903365a23a8ae3 | ORPH
    i486     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/db64a217ea234698827fb35a16e097d929b0cde5 | ORPH
   arceb     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/db32a09e722dbc99e3662c0133833d17ced7afab | ORPH
  sparc64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/0932b2d6124e75fc6dfe682412adde267123e76f | ORPH
   nios2     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/7ca0ecfbaa2b53c6fe3234583e15a8e9b7cb8cb6 | ORPH
   nios2     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/3db2275df8e8d83efe4aafcfb94d70756b487f09 | ORPH
   armeb     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/0f518894b10a66a40bf74767d7cad12fc5a09077 | ORPH
   nios2     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/225e6aa699dc9ca86cd28a2599f447f8eff0d729 | ORPH
   x86_64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/0e7634423d2832f8c10ea35a1f9af60a2c28cb2a | ORPH
   s390x     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/69442924883b518e5371eafecea3715602ca04be | ORPH
   arceb     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/11383dd70b54fb9214537dfde2cbe7c2aa225bc0 | ORPH
   x86_64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/ee13aab3fe81948c2bb9216dcef453950d177093 | ORPH
    or1k     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/dd1ceafcac3b6b9bd024926f3b23d7f1b1449b06 | ORPH
  sparc64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/202f20639a7f4b737591cde6fc8e0fcf87f15a82 | ORPH
    arc      | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/8ecb3cb15ec836e55bd21114d48a983be69e12f7 | ORPH
   s390x     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/2362d5b39c02e429dc73ffc24c1af3a01df57740 | ORPH
   x86_64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/e2991110da505e0ab00aaa8a84a6f8fd608f13e2 | ORPH
  sparc64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/be9ace067d8cdce863c058b33ed958618e7f72f0 | ORPH
   mipsel    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/ac46fc9957011053cd22c627da74b2496c5a3ba3 | ORPH
    i686     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/598d2757547c0d89b9a787d9e6fad46019197414 | ORPH
    mips     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/e6cf78180b3d4c33e2c4ccdfe6b1518e682522cd | ORPH
powerpc64le  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/e9f8c602a980b660ad794047426ec5c8230a42b9 | ORPH
   x86_64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/aebcf5ed1c2aef3ae045f9e51a2ce7cf7b977020 | ORPH
  sparc64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/9846aa70e36a56e1a888cdd8693c29eb698a596b | ORPH
  powerpc    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/587468c128b6a2b0e756e52f94a2978b2dc8f8ba | ORPH
powerpc64le  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/8513d9c3753524cbb231f0d653bb90cab68baed4 | ORPH
    i686     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/23386dd2862088d38cf6ea6010b91f69e6ecada3 | ORPH
   nios2     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/d1646da9a15424a71632919e9efbec3ee1c3c867 | ORPH
  riscv64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/151dc7a316c26a9b1a8816c22f78e8a10993df8b | ORPH
    or1k     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/dd4b4ff952109d1cf2dce876b013d36419d894cb | ORPH
 powerpc64   | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/3c9782cd7968cb10410f9d6b6ced63254125274d | ORPH
 powerpc64   | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/a21b689970ac37060e711417d1103bf714c0358c | ORPH
    or1k     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/ff8554eefc7d2da8c116cf8d33db74ad87e901d1 | ORPH
powerpc64le  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/44f7491896c9df97e208a14b574253a8f77ea7f6 | ORPH
  aarch64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/f9d1629422371492b08c7d84dc819161dce87b8b | ORPH
 microblaze  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/cc5abcd76098d0bcf3adc690ec47ced40384a089 | ORPH
   s390x     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/a6eae84bcc479118d775dc5aeb1af6adc2191d0d | ORPH
    or1k     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/d4091a6dab026c9c13768383b92d2b33209b09cc | ORPH
powerpc64le  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/d3a23dbe5be9f471a04a69ce05c17b1fa980dc3b | ORPH
    or1k     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/62b3870abab7b6de417a96739ad103d0d5952210 | ORPH
    sh4      | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/a6c14405f121b46aaa65f6690017548ad96f388d | ORPH
    i686     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/765d40699e084650627bf01159b8d10476a6badd | ORPH
   x86_64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/6de99a67a16ea8315abbc12ef5a7f4646bdf9a3a | ORPH
   armeb     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/8a31477fd9f0414a4de537a18d95c6058e47b5a6 | ORPH
powerpc64le  | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/9659d18454e94ee4eda044051a69eb8f1cc3fb60 | ORPH
   s390x     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/1aaf15de4f085367f2d06c3416aad5c1c7051c8e | ORPH
 powerpc64   | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/3f43ef9b46b0252780d44162ad87094e917e3a85 | ORPH
   mipsel    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/749c0f33f6730034f00ec0557185f5125351b988 | ORPH
 powerpc64   | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/68c614f9cbb01de70344a8958ba36365d6588a90 | ORPH
    m68k     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/4b6a677ba18ad63cddf1401354a8708661544260 | ORPH
    mips     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/cdedc55cd7fe9dcd61e03b884a8b8b08ff63aaaf | ORPH
   nios2     | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/bbb8b6cf334fefe1be75da489914577794c32239 | ORPH
   armeb     |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/bd776dd987ce8d246502c70d301c9a43af21f518 |     
   x86_64    |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/8d2d384a8633495eacc0fe3f83ed54e6f3672045 |     
  sparc64    |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/a06b61fcdb601b4b0380428724e2e7be2d01d35b |     
    or1k     |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/5353261b49596dc7ebaf572e110c00497264e61b |     
   armeb     |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/1dbcea2125e030dead3afe7449663136aa3a66d1 |     
   armeb     |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/cf057a306c51b2aa177f45adcf4e321bba83ff44 |     
  riscv32    |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/8f2d6efc084b8dad3d499fedc5d3f88ee3c35fd6 |     
   arceb     |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/646e8666ca7e08961855d1e01456dfcb975c751a |     
  powerpc    |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/eee5018c152216762ad576d74ca52dd55a051a65 |     
 microblaze  |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/a561a5e9055e0c5627333392e997f4ec083c6d9c |     
   mipsel    |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/86543e1e3dcae1a3b0592e7658544de19fa47455 |     
   x86_64    |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/5de05c0ee6c1dfead0a51ff74cced2eeaae08614 |     
   nios2     |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/3423b9088ac79a56465bd913ae8deb81f564be77 |     
  aarch64    |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/2e1d66f30e173c4c952fb50f46f83ca7dec38f63 |     
   arceb     |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/e816f8672bca78fa8e77297cdc376b4f3f8d303c |     
  powerpc    |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/1ff220c8b9bb7fd1873c37403416c26d980847d8 |     
microblazeel |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/1decdf88ebcde478661b47fd77483810b3998615 |     
   xtensa    |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/e7aec9d7292c2efe0375aacfcc6af3b004627617 |     
 microblaze  |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/e801b41e1f4ba53dd6adb474b0ebcdd90cc43a5e |     
  mips64el   |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/24e70106c09479e0b55c400e2785f9ba204dd4a1 |     
  mips64el   | host-softether-4.30-9700-beta  | NOK | http://autobuild.buildroot.net/results/0e7ab97c840a3b8cdfe5eb5da6c104f159973ab6 | ORPH
powerpc64le  | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/0332be1df6b415e2f7ec4f510f08fa90748b5fcd |     
 aarch64_be  | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/e6ba4f3feba1d23d1246c4326dbe9d296cfdfe22 |     
 microblaze  | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/c44750f4dc2c96d0955f4fbc9a6f89539c091029 |     
    arm      | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/3944e652a77f740158aa90d3a41be44bcf944655 |     
    sh4      | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/be4954f9160d1d8f770696b37df3eadb46681820 |     
 powerpc64   | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/9cf2ebad9169df0699990a3bc4d0ae5e4b4b8c90 |     
    m68k     | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/4a91ca350b797a474f3ade8413d8ade7f487db39 |     
   armeb     |           htop-3.3.0           | NOK | http://autobuild.buildroot.net/results/a7ac94dc47f831621b8e56caccb79c4bfd5f1ccb | ORPH
   mipsel    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/015c8595c7c84dae83a0285c55a3ce3f20c21570 |     
  powerpc    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/ec7efb2050008702dcd3ef2378c773d821dc1087 |     
 aarch64_be  | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/51541013af83761b5cf03150984af44b57d976fe |     
 powerpc64   | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/06aeafe25ca7306445b300a7270fbd8847d05f18 |     
   mipsel    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/ee89de5150125fb0fb2ea1bb2de4231c9c55ee40 |     
  mips64el   | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/6f42c653e9dfef0e905de0950acf418bedffca99 |     
    i686     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/ed8a4feb24eac6d8ad500488c927c0e4aa73b28f |     
    or1k     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/8b9c227b8c4f9c886c3109430b8d5da7c9bdcbda |     
   mipsel    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/36d8ae08465c2f52f7dd7fbb389ea00b328a521c |     
  mips64el   | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/0362070f0dc4eccedc3f75416ed17a690a238f55 |     
   arceb     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/0bc12c89ca192a511d3ffdd78fe4b261f9660e28 |     
    arm      |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.net/results/d250e138a3d57e0cbf3a6210cc3c6179be486470 |     
   s390x     |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.net/results/09b0d58d2a942315c21b6fed356af1960006e661 |     
   s390x     |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.net/results/a0ba99d9d4adf1628b1cdf16e4a99fbc958f2389 |     
   x86_64    |         ipmiutil-3.1.9         | NOK | http://autobuild.buildroot.net/results/41c462bc506c4f06d8aa5f212c2d4a4cab25cf13 | ORPH
    arm      | kvmtool-4d2c017f41533b0e51e... | NOK | http://autobuild.buildroot.net/results/7c224aeb143d53a136d768faf977c96715de5377 | ORPH
  sparc64    |        libarchive-3.7.4        | NOK | http://autobuild.buildroot.net/results/d230d2f5a09fe35f8e1371661fa1789db248b67d |     
    i686     |        libarchive-3.7.4        | NOK | http://autobuild.buildroot.net/results/d1601e786e73ec128320c16d0017b833eaba6b76 |     
   mipsel    |        libarchive-3.7.4        | NOK | http://autobuild.buildroot.net/results/34a0b233c3ac123104a35e131e2b3f90061d51bb |     
 powerpc64   |        libarchive-3.7.4        | NOK | http://autobuild.buildroot.net/results/f835cf08dfba8a0a7f9cd090d96df117da11bd81 |     
   mipsel    |        libarchive-3.7.4        | NOK | http://autobuild.buildroot.net/results/8457a314465ad085034e8d7e100fdc704ae9e893 |     
 microblaze  |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/47b65690ccafac042a47a0de2330f9e6e61f7612 |     
    i686     |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/8c1bd56401a0a8c8be57826615b7fec89939d6a0 |     
  sparc64    |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/3c6f66db7da003c79cc0998fe390a3083968c242 |     
    arc      |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/3f7ca249e555b002a491b1253c4705bcb813ae4e |     
   arceb     |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/b34c0814d9d4dd8d5876099c3dc33f74608cb027 |     
    arc      |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/3f954a510576d6f74d6d83104f0bd8db8590f65b |     
   arceb     |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/0e2b75ee411795c3e0fe63c30ae4ed5f2033e02f |     
    arc      |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/b8737a87a436f64590f7b51fdd486682cdc94758 |     
   arceb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/10bd6821638fd0cf09caa3a93121616ba5d117f9 |     
   arceb     |        libopenssl-3.3.1        | NOK | http://autobuild.buildroot.net/results/d0e78b1af3067bd43fae337ccced09c8619cb2be | ORPH
    sh4a     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/57fac6306be70db2dd46482cb0cd6ebb5d8a2b04 | ORPH
powerpc64le  |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/c60d638cb90d19d9e1d55559f9ba122b3943cced | ORPH
   arceb     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/eca7b7342214bf9911bce1d4904efd10349c3921 | ORPH
   arceb     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/b52e2ba7f69ff9229de0f850eca9a3d0736da1b7 | ORPH
 microblaze  |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/7d62d334b1af604f0f34d68d5f117579e5a14784 | ORPH
    arc      |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/8a7ab3d31d61e6bf62bc9fff06ac21743ccaa115 | ORPH
 microblaze  |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/fc6f923d6e038ae62b71fc5ef3e6f78426cf58b1 | ORPH
   arceb     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/8d5db4924af7b427e22a97fbe184c01b7da095cb | ORPH
   sh4aeb    |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/a49b54f4eb34d3ef5da4a211f323475638fc653a | ORPH
microblazeel |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/75867a7996a2e0e6d8e5bd605f12b69c1987dc59 | ORPH
   mips64    |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/512805d340b3448cee012b95d81c6b793422b614 | ORPH
powerpc64le  |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/98bb5123e2be2f3220c9c7410c3f140dd91c871f | ORPH
  mips64el   |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/6849e89a1e610377e8f15f402b3736b263b5c137 | ORPH
   mips64    |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/720e50d4df769ab5c1c79c8fc3020f82dfd2c98f | ORPH
    arc      |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/d4948b9fd4c0c5375cfbdc0a49c3c0abaea7b4b8 | ORPH
    or1k     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/32e24997de97c084f1e75cd211eb4a873dd741de | ORPH
microblazeel |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/7198447e163e86d83d62bdd415f244fe420f3a60 | ORPH
   arceb     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/0dcbf83055622c0c3824aa56cf8651906f461ad9 | ORPH
   mips64    |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/00a96ea5766cfc600c6a0d608ce0350a96233fa9 | ORPH
    sh4a     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/1bcf4f6adbbece27ce696740f7cb7e184c206bdf | ORPH
   nios2     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/bc2327ec29b9f24624c9769f90e136d696260fdb | ORPH
   sparc     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/72b63fb39ee14218edbfd2171869092f3d56f994 | ORPH
   arceb     |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/5c6735ddc5cb36e42fc6b53579a6b22ca82b52b1 | ORPH
   x86_64    |         librsvg-2.50.9         | NOK | http://autobuild.buildroot.net/results/8493c9556cb85fc696cbf10840655540e43ae8e3 |     
    m68k     |        libunwind-1.8.1         | NOK | http://autobuild.buildroot.net/results/67e7fc3c2a3179be60463fc0b8912b40b6d3a463 | ORPH
   nios2     |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/d3bb07dc29fd8b2ef72bfaf0fefea84808a291d5 | ORPH
    mips     |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/e9cbc9e2cb33d81384c8db5be4b66bd7e3128517 | ORPH
    mips     |          linux-6.8.12          | NOK | http://autobuild.buildroot.net/results/2190815a56b2b0372d057327c4828a72ae6972ad | ORPH
    mips     |          linux-6.8.12          | NOK | http://autobuild.buildroot.net/results/d57cec674f649960f27c3c8c112c222d3c3cb34e | ORPH
    m68k     |          linux-6.8.12          | NOK | http://autobuild.buildroot.net/results/de6b50c049fe8cee4a6190809a00f3292b5ce169 | ORPH
   nios2     |          linux-6.8.12          | NOK | http://autobuild.buildroot.net/results/749b73d4a2a818545ec26576f88b44f0418aeefd | ORPH
    m68k     |          linux-6.8.12          | NOK | http://autobuild.buildroot.net/results/40c52b83764cc68c7198c2c378d5407476c03ace | ORPH
  aarch64    |          linux-6.8.12          | NOK | http://autobuild.buildroot.net/results/6b42a351e52451a173693a5de40ac729231db491 | ORPH
   xtensa    |          linux-tools           | NOK | http://autobuild.buildroot.net/results/de3241cc0abbd9e63ab758e065ce229a8ed3ce5f | ORPH
  sparc64    |          linux-tools           | NOK | http://autobuild.buildroot.net/results/5d1bc04ab24da9e1d21e66340cdf2429a5ba5f15 | ORPH
    i686     | ltrace-82c66409c7a93ca6ad2e... | NOK | http://autobuild.buildroot.net/results/dd47e11c0a1256fcd0e1e7ccaad3b7ddb3cb07f5 | ORPH
   x86_64    | ltrace-82c66409c7a93ca6ad2e... | NOK | http://autobuild.buildroot.net/results/198062999b8c566849da14b739c5c0a8507b4cd6 | ORPH
   s390x     |     lttng-modules-2.13.10      | NOK | http://autobuild.buildroot.net/results/72bc39fc00f60260e3b8652e216323e19e8eb628 |     
   xtensa    |      mediastreamer-4.4.8       | NOK | http://autobuild.buildroot.net/results/327d16b2bf7e9ddc1922bd4a4f941e3462a49a8d | ORPH
    or1k     |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/edf76d1687646f0aea97e3119fbb9eee785c788e |     
    sh4      |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/d79a0bd92e8cfc42186a5dd16438a2ca834b8f50 |     
  powerpc    |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/0d0560b5239ecbf962169a04691e8da2154c965a |     
   xtensa    |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/b9c3335a3ec0be7664e821767e60c1e01939847f |     
   mipsel    |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/841ccfbaabb172a7c7e07adc21a3888b77480f67 |     
   x86_64    |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/e93cfef64c6c73bf4782b7cc478f2ba80a0e5128 |     
   xtensa    |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/9bfccbcd1735c6aab706c884faa8834cde3b48ae |     
   s390x     |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/bf9d1546e1931663167eac5404a2aecbc911fd76 |     
  mips64el   |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/f01e4b4db1bcff3123f81bddf3067f895b829cf2 |     
  sparc64    |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/6680782d98030d6647b939283776dfb2490ac4f6 |     
    arm      |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/6c04b51a6fc372a78fd417ab4c24a7c91ba2c9a6 |     
  riscv64    |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/97ecb93fe09ecc3eb6447adeb367c7e48566b330 |     
 aarch64_be  |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/d1d58f6dd8f2489ac0f121e78b08fb61c408ddb0 |     
    arc      |           mpir-3.0.0           | NOK | http://autobuild.buildroot.net/results/3e2ae32cc1cfb14b36c5d420579547afc2ef1588 |     
   sparc     |          nginx-1.24.0          | NOK | http://autobuild.buildroot.net/results/f9c2d3f999bc565b3604c815c4d9fa449820824d |     
powerpc64le  |         opencv3-3.4.19         | NOK | http://autobuild.buildroot.net/results/98132fa688098c65671d18b2affe4f5c7b5731bc |     
    mips     |         openssh-9.7p1          | NOK | http://autobuild.buildroot.net/results/ce97ec64fcc061af8efae094c97f9b26bd0b7c90 | ORPH
   sparc     |         pixman-0.42.2          | NOK | http://autobuild.buildroot.net/results/1e8f1df2dcf3673a1a81e1078641e148089ea8cc | ORPH
   sparc     |         pixman-0.42.2          | NOK | http://autobuild.buildroot.net/results/6ef8cc5b3aece98229ec68761e58956017f6b33c | ORPH
  sparc64    | pppd-e1266c76d1ad39f98f1167... | NOK | http://autobuild.buildroot.net/results/dfed8f5f6e6c71acf6f14fe3820ff64bb58a2521 |     
   sparc     | pppd-e1266c76d1ad39f98f1167... | NOK | http://autobuild.buildroot.net/results/0ef3fe75515f85c9617ae54a7fd71ae309edfcb6 |     
   mips64    |           proj-9.3.0           | NOK | http://autobuild.buildroot.net/results/234ec6317919bace3de76a0b00608387da72a2c3 |     
   nios2     |           proj-9.3.0           | NOK | http://autobuild.buildroot.net/results/e2a3d0696c1440240600f842bc9468cdf80f3379 |     
    arc      |     python-remi-2022.7.27      | NOK | http://autobuild.buildroot.net/results/6b98dec8a392d4f421364ffb0520b5832371d6fc |     
    arm      |     python-remi-2022.7.27      | NOK | http://autobuild.buildroot.net/results/9c60947ddb585906727156b7ba16ca7c7a85bf01 |     
  riscv64    |     python-remi-2022.7.27      | NOK | http://autobuild.buildroot.net/results/1b7fad9c1a2c7f17e1a983a1265c6c00d58f85be |     
    arc      |         python3-3.11.8         | NOK | http://autobuild.buildroot.net/results/f4af69cec828c587f425f3d9c14581add8a0416c |     
    or1k     |         shadow-4.14.5          | NOK | http://autobuild.buildroot.net/results/d5c4782b7f2d67535ea9e5275ea953bd3134e7ce |     
    arm      |       sofia-sip-1.13.17        | NOK | http://autobuild.buildroot.net/results/e87ac3d97e70de410f09ba4a3eb1da49cd6891b4 |     
   mips64    |       stress-ng-0.17.07        | NOK | http://autobuild.buildroot.net/results/58693c347aa469fab154d06199a72211a8436a78 |     
  sparc64    |         tbtools-0.3.2          | NOK | http://autobuild.buildroot.net/results/5f56312fefa46617628690a2973dff0c538f816e |     
 powerpc64   |          trinity-1.9           | NOK | http://autobuild.buildroot.net/results/234a2ab0cea58fcdd8b017c917ee3f4b4ca58421 | ORPH
   x86_64    |          trinity-1.9           | NOK | http://autobuild.buildroot.net/results/c706290bf22ce8158bc577d007beb03336978dab | ORPH
  riscv64    |         uclibc-1.0.48          | NOK | http://autobuild.buildroot.net/results/d8a361c2037f909b3ec63ffc8858136784cdc2e7 |     
    arm      | uclibc-ng-test-0f303c63fab7... | NOK | http://autobuild.buildroot.net/results/2527e14ce63897f927f8e04f5e081c903ada10f1 |     
    arc      |          uhd-4.3.0.0           | NOK | http://autobuild.buildroot.net/results/05a21228c54f7d4e6f822d19f3dc3fdfd2c87fac |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/0184a3e715c0bc7955a2609e2b96d736c44e685b |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/4bf445b7264c30cb00cb974e19fef1f8fc97364c |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/5d69a09b5edaf454fd44ab89acb9120b3ef09371 |     
    m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/c903b7c9ccff153871a2a856f0721e28d14ea389 |     
   arceb     |       util-linux-2.39.3        | NOK | http://autobuild.buildroot.net/results/ac2cdfd56194be65aa1ef548362b09926d536542 | ORPH
    arm      |       util-linux-2.39.3        | NOK | http://autobuild.buildroot.net/results/cc5eee5529e5438469fdc3864ac0e7c735a60e45 | ORPH
    or1k     | wilc-driver-linux4microchip... | NOK | http://autobuild.buildroot.net/results/a184b6124d34191c7bfe5eca7a571400d683d9c3 |     
    mips     |         wolfssl-5.7.0          | NOK | http://autobuild.buildroot.net/results/c6456b66309464bdf7ddb2e38bcec48df7c8c6e4 |     
    arm      |           xen-4.14.6           | NOK | http://autobuild.buildroot.net/results/f373cdde3cda963c89c7054da323b922727e8a11 |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

               belle-sip-4.4.8 | 1 
                gnu-efi-3.0.17 | 1 
  gobject-introspection-1.76.1 | 1 
host-heimdal-f4faaeaba371ff... | 1 
          libcamera-apps-1.2.1 | 1 
               lightning-2.2.3 | 1 
                    ncmpc-0.49 | 1 
                    ola-0.10.9 | 1 
                    qemu-8.1.1 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   xtensa    |        belle-sip-4.4.8         | NOK | http://autobuild.buildroot.net/results/b1761d83e0615fc34424993b87a2d4926fd4f607 |     
 aarch64_be  |         gnu-efi-3.0.17         | NOK | http://autobuild.buildroot.net/results/a6125a06efcc915ea5373e1c8a974f99e21261f4 |     
    m68k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/a0946728a05e9498bf4cf9a776fc2b8ba7f2ace8 | ORPH
   s390x     | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/d30b8c737f0d146adfa816b6bd93dea9c6b9aa4c | ORPH
   mipsel    |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/5e9fdf259a612fc207c98f68845b18883418b455 |     
  mips64el   |        lightning-2.2.3         | NOK | http://autobuild.buildroot.net/results/c2c453144b2d120d28668de35c6d999b4a9bbfe4 |     
    arc      |           ncmpc-0.49           | NOK | http://autobuild.buildroot.net/results/96f43793ef951ff39c3412cf12da866f7fd4ef3f |     
   sparc     |           ola-0.10.9           | NOK | http://autobuild.buildroot.net/results/584097e950f8860e46391d77444c0c790bccf86d |     
   x86_64    |           qemu-8.1.1           | NOK | http://autobuild.buildroot.net/results/b3eaed259482e092d2c01ab34a6b4890a04c5d9e |     


Classification of failures by reason for 2024.05.x
--------------------------------------------------

                       unknown | 2 
                   bullet-3.25 | 1 
               mariadb-10.11.6 | 1 
           python-numpy-1.25.0 | 1 


Detail of failures for 2024.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |          bullet-3.25           | NOK | http://autobuild.buildroot.net/results/40cc0ed4cb82275daadee8fe6a1619ae96705dd8 |     
    mips     |        mariadb-10.11.6         | NOK | http://autobuild.buildroot.net/results/d9d1546684d718ab6d8788a0e779f2458a9c01ec | ORPH
 powerpc64   |      python-numpy-1.25.0       | NOK | http://autobuild.buildroot.net/results/fce2784a1580c03e6cd31fea2fa939f3bf85789b |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/1c48dcaa42b56bff257ac9545cd8064049c70d95 |     
 aarch64_be  |            unknown             | NOK | http://autobuild.buildroot.net/results/6b1b01af038b46bc78b7ba7e0f6676d215ab2b89 |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
