Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 580C9C3DA64
	for <buildroot@archiver.kernel.org>; Sun,  4 Aug 2024 04:54:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1DB1C80B00;
	Sun,  4 Aug 2024 04:54:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3e5Y3jCq6LTk; Sun,  4 Aug 2024 04:54:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D150A80AFC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D150A80AFC;
	Sun,  4 Aug 2024 04:54:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 482AC1BF354
 for <buildroot@lists.busybox.net>; Sun,  4 Aug 2024 04:54:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 387B64038D
 for <buildroot@lists.busybox.net>; Sun,  4 Aug 2024 04:54:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RdhgLz1kfMeE for <buildroot@lists.busybox.net>;
 Sun,  4 Aug 2024 04:54:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 76DD540384
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 76DD540384
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 76DD540384
 for <buildroot@buildroot.org>; Sun,  4 Aug 2024 04:54:29 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 921921BF20E
 for <buildroot@buildroot.org>; Sun,  4 Aug 2024 04:54:26 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sun, 04 Aug 2024 04:54:26 -0000
X-GND-Sasl: bot@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1722747266; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=UHNsN64a6v7m//HztQdJ937JGAsKw1PSdCwWavMDuxc=;
 b=b69aay+eRs9DeGyiqZkmV1LNwSyP7JNeA/J/ZQy/OQLtrvc4uPz1Kb+m/xWGCitCaegQVq
 OyTLj1Bqmbu1EiapPY6yQNUpQgDr4wBV501kFkHeaJl0ZZl0uo6XFz3PSYCFuvk1UTqc5m
 kEoILoZZRO4ThvN1GscQaO2MP23rAgPt/faMutQsZvdUh6flttrDvJ10TwyIUrdChIHnFM
 iG5reM4mtQWhEZ8c+mlh3PN0ptBAw/ugG8qMqahRDy3FeOIX6NJ7BXJ80SOXMwygY2cEoM
 3A5T7oaVqoAlghQWyacEYuvlVDjfPP5FoET9vKn/kDaSD1l2TT7h+vOG2djWUg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=b69aay+e
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2024-08-03
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
Message-ID: <20240804045426.co4t-rgNVA6E48-6QlkD1wcIPPJlcX-3XKm23Aj91Rc@z>

Hello,

Autobuild statistics for 2024-08-03
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  2  |  9  |  0  | 11  |
  2024.05.x  |  5  |  6  |  0  | 11  |
    master   | 134 | 273 | 10  | 417 |

Classification of failures by reason for master
-----------------------------------------------

    host-gcc-bare-metal-14.1.0 | 23
  gobject-introspection-1.76.1 | 15
         gobject-introspection | 9 
                gnu-efi-3.0.18 | 8 
host-vboot-utils-bbdd62f9b0... | 8 
      python-autocommand-2.2.2 | 8 
                  ffmpeg-6.1.1 | 7 
glibc-2.39-74-g198632a05f6c... | 7 
               procps-ng-4.0.4 | 7 
                     avahi-0.8 | 6 
host-heimdal-f4faaeaba371ff... | 6 
                    norm-1.5.8 | 6 
                gerbera-1.12.1 | 5 
            host-libtool-2.4.6 | 5 
                host-m4-1.4.19 | 5 
                 openssh-9.8p1 | 5 
                s6-dns-2.3.7.2 | 5 
                       unknown | 5 
aer-inject-9bd5e2c7886fca72... | 4 
               ipmitool-1_8_19 | 4 
                  libffi-3.4.6 | 4 
               libglib2-2.76.1 | 4 
                libressl-3.8.4 | 4 
            gdk-pixbuf-2.42.10 | 3 
                  libsepol-3.6 | 3 
                  linux-6.10.2 | 3 
               mariadb-10.11.6 | 3 
    python-cryptography-39.0.2 | 3 
           python-daemon-3.0.1 | 3 
               tipidee-0.0.5.0 | 3 
                 apache-2.4.62 | 2 
                 coreutils-9.3 | 2 
                 dc3dd-7.2.641 | 2 
                elfutils-0.189 | 2 
                  fbterm-1.7.0 | 2 
              fftw-quad-3.3.10 | 2 
              fluent-bit-3.1.3 | 2 
                   foot-1.16.2 | 2 
                 gnuplot-6.0.1 | 2 
             gnuradio-3.10.7.0 | 2 
            host-binutils-2.42 | 2 
            host-skopeo-1.13.3 | 2 
               lighttpd-1.4.76 | 2 
                   linux-tools | 2 
                  mender-3.4.0 | 2 
                     php-8.3.9 | 2 
         python-remi-2022.7.27 | 2 
                   trinity-1.9 | 2 
                 agentpp-4.6.1 | 1 
android-tools-4.2.2+git2013... | 1 
           at-spi2-core-2.50.0 | 1 
aubio-152d6819b360c2e7b379e... | 1 
             babeltrace2-2.0.4 | 1 
                    bat-0.24.0 | 1 
             berkeleydb-5.3.28 | 1 
                  cairo-1.18.0 | 1 
cegui-00b4e1fe174da53b7ed72... | 1 
          cloudflared-2024.6.1 | 1 
             cni-plugins-1.3.0 | 1 
               collectd-5.12.0 | 1 
           crucible-2023.11.02 | 1 
                   cvs-1.12.13 | 1 
            ecryptfs-utils-111 | 1 
                   eza-0.18.22 | 1 
                  fbdump-0.4.2 | 1 
                      fd-9.0.0 | 1 
                flannel-0.25.5 | 1 
                flutter-engine | 1 
       freeradius-server-3.2.3 | 1 
                freerdp-2.11.7 | 1 
fs/axfs/axfs.mk:32: /home/a... | 1 
        gmrender-resurrect-0.1 | 1 
               graphene-1.10.8 | 1 
             host-delve-1.22.1 | 1 
         host-libxcrypt-4.4.36 | 1 
     host-moby-buildkit-0.11.6 | 1 
              host-runc-1.1.12 | 1 
                    htop-3.3.0 | 1 
               iproute2-6.10.0 | 1 
                jemalloc-5.3.0 | 1 
          libcamera-apps-1.5.0 | 1 
                libcuefile-475 | 1 
libdbi-drivers-0bfae6c43134... | 1 
libdill-32d0e8b733416208e04... | 1 
                libesmtp-1.1.0 | 1 
              libgcrypt-1.11.0 | 1 
                libnss-3.102.1 | 1 
     libphidget-2.1.9.20190409 | 1 
libsvgtiny-ea9d99fc8b231c22... | 1 
                 libv4l-1.24.1 | 1 
                    ncmpc-0.49 | 1 
                  ntp-4.2.8p18 | 1 
             open62541-v1.3.11 | 1 
               openblas-0.3.27 | 1 
              openconnect-9.12 | 1 
             parsec-tool-0.7.0 | 1 
                 pixman-0.42.2 | 1 
python-unittest-xml-reporti... | 1 
                 siproxd-0.8.3 | 1 
             strongswan-5.9.13 | 1 
                 systemd-256.4 | 1 
               tcf-agent-1.8.0 | 1 
              tinydtls-0.9-rc1 | 1 
                tpm2-tss-3.2.2 | 1 
           uboot-tools-2021.07 | 1 
                 uclibc-1.0.49 | 1 
ulog-0389d243352255f6182326... | 1 
                ustreamer-6.11 | 1 
             util-linux-2.39.3 | 1 
           v4l2loopback-0.12.7 | 1 
               valgrind-3.22.0 | 1 
               valgrind-3.23.0 | 1 
                xenomai-3.0.10 | 1 
               zxing-cpp-2.2.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/9424dfa736dfb1fa18a15341f196a73cf5a3711e | ORPH
   nios2     | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/ec4522c7d2180e8373df93aa98f52718d311281d | ORPH
 aarch64_be  | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/8af1515fcf329767078c5d749fb312a636380dcd | ORPH
 powerpc64   | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/fef20017834e2d74ab9838e68dac7d9fd9f4a045 | ORPH
    sh4      |         agentpp-4.6.1          | NOK | http://autobuild.buildroot.net/results/0b44cdae12755fa70739ac6c22a8fc47b51e19b8 |     
  mips64el   | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/a412ab9614c7d1627fcf52c5eeb7f0901bfdfeb2 |     
   mipsel    |         apache-2.4.62          | NOK | http://autobuild.buildroot.net/results/6dd08ca9498bc87b3d012fc2b171b16d565ec77c |     
  powerpc    |         apache-2.4.62          | NOK | http://autobuild.buildroot.net/results/a84a56c8433ddcfc5252ccdd8a92e395362e1d69 |     
    arm      |      at-spi2-core-2.50.0       | NOK | http://autobuild.buildroot.net/results/ee0af639d8c494792f59eae7cbd4d5e44d20b70b |     
  sparc64    | aubio-152d6819b360c2e7b379e... | NOK | http://autobuild.buildroot.net/results/955631eb1a9323bd23c4d605fefa1d10ae5cfb9f |     
   x86_64    |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/29de8abc9e56ad562e6affadcb87ad8100b47b6e | ORPH
   s390x     |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/406115bd163eb8c00fe70116208637cd27b1add3 | ORPH
 powerpc64   |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/56e32a7a80d01dff6a39eee9793e0de9fa855928 | ORPH
   s390x     |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/3d09017df853e6d9f46ad0f36c25f4b512c6e716 | ORPH
 powerpc64   |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/c9311a9283fb7e8b79a5cd3ec407211c60ed5b64 | ORPH
    sh4      |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/b9184a03eac1e8f7cdb3a3762f228695fefcf8b8 | ORPH
 microblaze  |       babeltrace2-2.0.4        | NOK | http://autobuild.buildroot.net/results/b82f2f5844c022d1379f196f7aeaa4e80392a2f9 |     
    arm      |           bat-0.24.0           | NOK | http://autobuild.buildroot.net/results/299c2fe6745baca24779225a125e99569c2d65af |     
   xtensa    |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/83e04507c04ffe22492b166644499ada02233136 | ORPH
   xtensa    |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/b3f442e4bd1cfcf3912c3b71e99c309a6c69847e |     
   nios2     | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/7cc83e22f29a0a9732261d79f7366104e77e8e00 |     
  riscv64    |      cloudflared-2024.6.1      | NOK | http://autobuild.buildroot.net/results/89278b6f09816de68d30b6c801c0b0fd3bcb7944 |     
  riscv64    |       cni-plugins-1.3.0        | NOK | http://autobuild.buildroot.net/results/46c743ea593fe1c3bbb4d70bf98d0f1d73801a93 |     
    arc      |        collectd-5.12.0         | NOK | http://autobuild.buildroot.net/results/2e352c822cacbea7e862b4163b72cd536d4375c3 |     
  powerpc    |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/12001f4fbf817d6fe48d95621c1ed717fff0e506 | ORPH
    arc      |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/3cb49bf57c9ca241dd9ff4aba84f4d3332054fb1 | ORPH
   x86_64    |      crucible-2023.11.02       | NOK | http://autobuild.buildroot.net/results/7d2b39fb9d0904d23a5ecd51a429913736ad02b3 |     
 aarch64_be  |          cvs-1.12.13           | NOK | http://autobuild.buildroot.net/results/61420d027f4b8f272a153d9c4e6ca983d80be5a8 | ORPH
    or1k     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/474f1758bd56cae1acd7c0d174690b862062dc4c | ORPH
   sparc     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/2cc8736afe688bfadc17ebecc84b681d9fce7e06 | ORPH
   mipsel    |       ecryptfs-utils-111       | NOK | http://autobuild.buildroot.net/results/eb4c75ba7cdfa0b7a847fad62ab6c95c6a1926de |     
  aarch64    |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/9dde2f48d297f380d9097448feb0bafed799c84e | ORPH
   arceb     |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/4959b61311fae20f78e7804300abfce9b4e25b85 | ORPH
    arm      |          eza-0.18.22           | NOK | http://autobuild.buildroot.net/results/d48e3d25c4ecde04a71856012310d2286efb0e89 |     
    mips     |          fbdump-0.4.2          | NOK | http://autobuild.buildroot.net/results/daba562924f512beea7dd51bddeffa1b40142bcb | ORPH
    arm      |          fbterm-1.7.0          | NOK | http://autobuild.buildroot.net/results/92aa6c5c37fcf82f23dd5502866839596b689a21 | ORPH
  aarch64    |          fbterm-1.7.0          | NOK | http://autobuild.buildroot.net/results/f465358f7dd7e5924cdf5483a8b28dd435483ffc | ORPH
  aarch64    |            fd-9.0.0            | NOK | http://autobuild.buildroot.net/results/b40a9592a58b593d52bedfe1736564882e5a1f4e |     
 microblaze  |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/35ba5c6c7cb184617293129e48dd2c71935b7116 |     
 microblaze  |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/adf8d7bf8f0e3732d13fca384dd92ddfbc400d00 |     
    arc      |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/d499a7033fe817b8c897d8975ddeaba6d0eb4e02 |     
    arc      |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/0d06fd5ca2f0ab8b01881a8b1d7dbd285660edbf |     
 powerpc64   |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/4d968adce992a64daf227bd32c37c86313cdf682 |     
 microblaze  |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/d2b05aa667a418ecb0060f7830dffb9b68f1b2fe |     
 microblaze  |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/7d79675c57ad19810063e0a95f1f0f3b35b27203 |     
powerpc64le  |        fftw-quad-3.3.10        | NOK | http://autobuild.buildroot.net/results/526d57ba2ce65c144333276ffc40d22abfbe3943 | ORPH
powerpc64le  |        fftw-quad-3.3.10        | NOK | http://autobuild.buildroot.net/results/02c52b6383b0b29b85a690da10ed350263a474cb | ORPH
  aarch64    |         flannel-0.25.5         | NOK | http://autobuild.buildroot.net/results/3e158b59c62faa8c49b0a17363f1559bab45a917 |     
    or1k     |        fluent-bit-3.1.3        | NOK | http://autobuild.buildroot.net/results/b804bdb5d44598e221356102343ed19e79437940 |     
   mipsel    |        fluent-bit-3.1.3        | NOK | http://autobuild.buildroot.net/results/c9ed27a51a68429b2ed2d8eebb1afc919ecbead1 |     
  aarch64    |         flutter-engine         | TIM | http://autobuild.buildroot.net/results/2ebd4d44d56a507faebad4af5444f078f6ec1b1e |     
microblazeel |          foot-1.16.2           | NOK | http://autobuild.buildroot.net/results/ad8f095b34fe21d6fe1a889bb2ad9981166ee2ba |     
   nios2     |          foot-1.16.2           | NOK | http://autobuild.buildroot.net/results/60b4062c2fffe235d7769e3865c9f90529526000 |     
   sh4aeb    |    freeradius-server-3.2.3     | NOK | http://autobuild.buildroot.net/results/c86f6c64061be5bb5e4dff9dff39dfc25d5cc2b6 |     
    mips     |         freerdp-2.11.7         | NOK | http://autobuild.buildroot.net/results/5376f30785cce9b1098f7b823e3eff9d6d0139ad |     
   arceb     | fs/axfs/axfs.mk:32: /home/a... | NOK | http://autobuild.buildroot.net/results/a2a454a152621b3283e8e30e7c56e6f0a1fe1f90 |     
  mips64el   |       gdk-pixbuf-2.42.10       | NOK | http://autobuild.buildroot.net/results/7257ac5a149116d540fc41eab9fc2b7eccbb9048 | ORPH
 aarch64_be  |       gdk-pixbuf-2.42.10       | NOK | http://autobuild.buildroot.net/results/f36ea3f54a918a9711c21550e7e873a0cb8a27dc | ORPH
microblazeel |       gdk-pixbuf-2.42.10       | NOK | http://autobuild.buildroot.net/results/f2d6a1014e09479148fc0da9b4787c56a8defdcb | ORPH
   x86_64    |         gerbera-1.12.1         | NOK | http://autobuild.buildroot.net/results/8d0166bc93928a98775f05899bf9e89da80308cc |     
 aarch64_be  |         gerbera-1.12.1         | NOK | http://autobuild.buildroot.net/results/a6299cead1029bea35401ca25eb65d98e8f662e7 |     
   x86_64    |         gerbera-1.12.1         | NOK | http://autobuild.buildroot.net/results/f83d0aea885573019c7166077e2df30c12e95b70 |     
powerpc64le  |         gerbera-1.12.1         | NOK | http://autobuild.buildroot.net/results/4434f5f2dc17017d69a2ee642c54725aa0e01397 |     
   x86_64    |         gerbera-1.12.1         | NOK | http://autobuild.buildroot.net/results/1b68a930980c9763fd1562645994b472a7e649a8 |     
 powerpc64   | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/7ca5326288dc1313ba4ba4ea441a40222bccf4e1 |     
powerpc64le  | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/b197a2ad8aa52ab582b82789a7f30003f515998c |     
powerpc64le  | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/2ae96ee50a9b23074a2698329ac4f55f658b652a |     
    arc      | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/00e615361e361ce41c3004cecded95f121eb2ef2 |     
 powerpc64   | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/7c86b81c584d5bad8d63df5822e03884b3d12f1b |     
powerpc64le  | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/aad5e0fd896e5256f0de02deacf5cf865a9158f7 |     
   arceb     | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/e1d89b9042d7a33b2e7d24a7e4ae9857d4f424dc |     
    i686     |     gmrender-resurrect-0.1     | NOK | http://autobuild.buildroot.net/results/60542d81af3e1b39674cdd15e532f946fe7230c8 |     
   armeb     |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/341a931a62c91298f03c4e55708c2e20d5088ad0 |     
   armeb     |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/57b8f77392bceab2d23f00e460ea6ee1fee8c660 |     
   armeb     |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/48120467810895a0d2995444c0a361e1fab075aa |     
  riscv64    |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/540d0abac16d0769a39c16b239da8c9cd6425d1c |     
   armeb     |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/9454b65c02edd0c8dac6966f44645aaff70689d3 |     
  riscv64    |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/7a5a60c8c88f26968080cedd86b515136ce18b32 |     
  riscv64    |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/91f1f47fcfd7fe7d50dbb726dcc1413b3f58cb3e |     
   armeb     |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/494d37f6a3d72a0576dbbd829b590093ce57b6bc |     
 microblaze  |         gnuplot-6.0.1          | NOK | http://autobuild.buildroot.net/results/65c809ad3dc2a96d66c3e39dd9453bc8743ab3e0 |     
 microblaze  |         gnuplot-6.0.1          | NOK | http://autobuild.buildroot.net/results/31905b939685a6cc1c3d0b7cbde256276a218e51 |     
    i686     |       gnuradio-3.10.7.0        | NOK | http://autobuild.buildroot.net/results/0661b25c98ccdf5796146784a1f439b9794b71f0 |     
   mipsel    |       gnuradio-3.10.7.0        | NOK | http://autobuild.buildroot.net/results/56c5c0edca2d6568fa3a34d25ec5095283974e56 |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/087405b268f9fa68ab821c79af6d46b0415645c9 |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/1d1b1ae17e019e296a851bc2631acb4893b6d686 |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/ee03b453c590694cbc4f01ade0aa59045266b8fb |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/409333c2732c886a674797ebc154730f720609ba |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/df6b7d595747a6dd66b3c30c8929aabff4ecf51f |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/ceb7a2f571e1a8546499848be3ff12c2469d11dc |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/cc3f53f0a62f2b43010e76aed9a2f6e8458c1de5 |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/da49ef6fbb691f2567ebd4d4f9a82f0b044c5742 |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/4a3666b81f7ddb9e2764593ce311b3f894209c72 |     
   x86_64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/8d18ea91307e38465a6065d27bf4fb9eee4b8af6 | ORPH
    m68k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/6032dd771ed6bc87449cd14313b44b69eb007687 | ORPH
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/bf44be45f5c691b008abc4ab4c37a9482e911461 | ORPH
    i686     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/a69ec5725ae532562ca5381af981e1904bf327f6 | ORPH
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/86af60f02c11de2781319e231e6cc911b99a8f0f | ORPH
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/5c364dc8eb377016009a6881aeffb99ab3a26c4f | ORPH
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/1f2ceb8d5b825405d74bec3a3318b4d7919fe530 | ORPH
    m68k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/bcf951e7aa5fab1c028f3694c903a852b55de6d6 | ORPH
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/ea3b193aec96d56fa9055651fe43ec2923d865b8 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/22de6cad46585e2ea923249a7f272f2cbc32d080 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/78d808886fcd5d7b20ad2a77eaff9608303883d8 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/144c786b80b031c92deb31ec77eb493488181e73 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/2863e4579f0308cc2c393bfff8c505143d05d6c5 | ORPH
  powerpc    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/d1effaf5f593be9b9375da11c2acf5c5b6f2b1b1 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/9e7296e86237dc49a41797c83d9e7c60c8e536e0 | ORPH
  aarch64    |        graphene-1.10.8         | NOK | http://autobuild.buildroot.net/results/9b357b1ef2eccd3110d0ecaaff1ae4883dff9280 |     
microblazeel |       host-binutils-2.42       | NOK | http://autobuild.buildroot.net/results/dac3d026b77f46f27660c0aed7658dd7947b0ef9 |     
  sparc64    |       host-binutils-2.42       | NOK | http://autobuild.buildroot.net/results/926e9f6b5e94eb7869999575b4652a04348f51e4 |     
   mips64    |       host-delve-1.22.1        | NOK | http://autobuild.buildroot.net/results/98c81f8bab1fd968c80d96b8e3aa16346288f48b |     
   armeb     |   host-gcc-bare-metal-14.1.0   | NOK | http://autobuild.buildroot.net/results/ac769cdacdcb887c8c0495369952664394566cc5 |     
    i686     |   host-gcc-bare-metal-14.1.0   | NOK | http://autobuild.buildroot.net/results/99bd9efdf35db07271cf6c4a2385c4b6647ce345 |     
  mips64el   |   host-gcc-bare-metal-14.1.0   | NOK | http://autobuild.buildroot.net/results/7f83fd2f1b8ce334661b659fae2dc8c55580a5a2 |     
powerpc64le  |   host-gcc-bare-metal-14.1.0   | NOK | http://autobuild.buildroot.net/results/06f4c7693930b9025caa6cdd8ad7464a9639eb6a |     
  powerpc    |   host-gcc-bare-metal-14.1.0   | NOK | http://autobuild.buildroot.net/results/988916a81068de5eea56713a900417720c793eaa |     
   sparc     |   host-gcc-bare-metal-14.1.0   | NOK | http://autobuild.buildroot.net/results/0567e74df6b821825bc50669faf5f65f27c7b683 |     
  aarch64    |   host-gcc-bare-metal-14.1.0   | NOK | http://autobuild.buildroot.net/results/2812e18c8415d268f84f4d744c4e58fd62def6c9 |     
 microblaze  |   host-gcc-bare-metal-14.1.0   | NOK | http://autobuild.buildroot.net/results/087965c16de961ba82a927c1763287200bcb0555 |     
  powerpc    |   host-gcc-bare-metal-14.1.0   | NOK | http://autobuild.buildroot.net/results/39dcdb0f1e32d85e26eb1ae95032ae8aed694045 |     
   xtensa    |   host-gcc-bare-metal-14.1.0   | NOK | http://autobuild.buildroot.net/results/6f67cf1601a5aaacd3288eff121a637f44581856 |     
    arc      |   host-gcc-bare-metal-14.1.0   | NOK | http://autobuild.buildroot.net/results/1264e336c09151f13da87f79e8df1cfb2e94778b |     
   nios2     |   host-gcc-bare-metal-14.1.0   | NOK | http://autobuild.buildroot.net/results/c9025cd6283ea67a6002c9f6eeb53eb5af241fd4 |     
 microblaze  |   host-gcc-bare-metal-14.1.0   | NOK | http://autobuild.buildroot.net/results/392678ef1c65187e70afe8e14c62b45565051c4b |     
   x86_64    |   host-gcc-bare-metal-14.1.0   | NOK | http://autobuild.buildroot.net/results/70b313c6cc32347f1917a566ae50d26a0849fe6a |     
powerpc64le  |   host-gcc-bare-metal-14.1.0   | NOK | http://autobuild.buildroot.net/results/b9d900c9986b898843726f60b48f65c2f95db2e8 |     
    sh4a     |   host-gcc-bare-metal-14.1.0   | NOK | http://autobuild.buildroot.net/results/371f122c3223e0f27a6d9114ebec07a54342d072 |     
   x86_64    |   host-gcc-bare-metal-14.1.0   | NOK | http://autobuild.buildroot.net/results/119f4025b201e6e894d9cc4aadc3167f002c0fa4 |     
   nios2     |   host-gcc-bare-metal-14.1.0   | NOK | http://autobuild.buildroot.net/results/adadf4e79543474638726dd04ea205d99e502846 |     
 microblaze  |   host-gcc-bare-metal-14.1.0   | NOK | http://autobuild.buildroot.net/results/3aca678c79b0de52e1309ab67db648303e206e37 |     
   mipsel    |   host-gcc-bare-metal-14.1.0   | NOK | http://autobuild.buildroot.net/results/5024b92fd0f3862348b7a191ebbf37e2cefef90f |     
 microblaze  |   host-gcc-bare-metal-14.1.0   | NOK | http://autobuild.buildroot.net/results/0144b041d3f201ea2ac05deb66bae94d45b4b54b |     
 powerpc64   |   host-gcc-bare-metal-14.1.0   | NOK | http://autobuild.buildroot.net/results/7e4d43d27740c57cdc6a393d123a95baa4047132 |     
   xtensa    |   host-gcc-bare-metal-14.1.0   | NOK | http://autobuild.buildroot.net/results/2489e4f30e54059d9b655bf66267f6edd7ba3bc7 |     
   s390x     | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/071360c6fa6ee84b9e091a023b1e14f0aa6e3f1b | ORPH
 powerpc64   | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/6a78f89128fbc52849f72e77b3434958f5857d17 | ORPH
  mips64el   | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/1894db8ea72c47b93a85ff586adf995bc66f004d | ORPH
   s390x     | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/40ee4f6bccbd0ae17278cb0ae7fbf2188a721287 | ORPH
  sparc64    | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/0f79b52976a9f23ea1bc24fd54c39c753ca105c1 | ORPH
powerpc64le  | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/6e9bc4462c3da0a8927da6ac32f9935742db7e0d | ORPH
   nios2     |       host-libtool-2.4.6       | NOK | http://autobuild.buildroot.net/results/4419aa3340ed25dbaae39c7e651d4831b14cad11 | ORPH
   armeb     |       host-libtool-2.4.6       | NOK | http://autobuild.buildroot.net/results/0d9839de6d11ccebac3232a7bb85370cde79c318 | ORPH
   mipsel    |       host-libtool-2.4.6       | NOK | http://autobuild.buildroot.net/results/0ba9622e2f3e57031838bf7ba307c162ba734515 | ORPH
   s390x     |       host-libtool-2.4.6       | NOK | http://autobuild.buildroot.net/results/7e53ef75b2236e4e1dcc58515846087e827b55e5 | ORPH
   armeb     |       host-libtool-2.4.6       | NOK | http://autobuild.buildroot.net/results/643bd67d526432db82a9c94ed090282b88aa58b8 | ORPH
    mips     |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.net/results/04e3f5c79868d2a46adb0e9749d858f6a3335ef9 |     
   x86_64    |         host-m4-1.4.19         | NOK | http://autobuild.buildroot.net/results/c049ecd866e6e66cd88d98910a99543a9c6a1d10 | ORPH
  mips64el   |         host-m4-1.4.19         | NOK | http://autobuild.buildroot.net/results/426f8467cced6d660639618a47c13284b41f3750 | ORPH
microblazeel |         host-m4-1.4.19         | NOK | http://autobuild.buildroot.net/results/a984eaa0c7aafb513eb999269f6812d7c68ed7e2 | ORPH
   mipsel    |         host-m4-1.4.19         | NOK | http://autobuild.buildroot.net/results/36429cd27a1da31c55352ef3f3a6251850eef0a8 | ORPH
   mipsel    |         host-m4-1.4.19         | NOK | http://autobuild.buildroot.net/results/04bf03079afb466ed36eb384c024afe677dabbe1 | ORPH
  riscv64    |   host-moby-buildkit-0.11.6    | NOK | http://autobuild.buildroot.net/results/e9f07f7319c9129613ea353f2e36a990f18df7e4 |     
  mips64el   |        host-runc-1.1.12        | NOK | http://autobuild.buildroot.net/results/3d235b6c1a8bb64dfcbb573276e48f0ddeaf3b34 |     
   mips64    |       host-skopeo-1.13.3       | NOK | http://autobuild.buildroot.net/results/f8961ec9b8ea18fbe359388bd8dfa297d90dbf24 |     
  mips64el   |       host-skopeo-1.13.3       | NOK | http://autobuild.buildroot.net/results/452164d0d980be4d12c2a36f854d45261cb9109b |     
   mips64    | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/f7a8f85612341da3e7d2f7777eec5fbac75b9578 |     
   xtensa    | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/4bbb5292d8c9f97dfe165f6a1fbfa13101cc175d |     
  riscv32    | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/03187b7451aab90c6fbc6cd837953d12be670979 |     
 microblaze  | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/9ca47fe89cc602bd179e37bcca05c0c6e44253d6 |     
  mips64el   | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/13cb4e8ad124172118d61b51c3338537304c89bd |     
  mips64el   | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/b081c0bf2001c0960eadbe49dcf9a894241f1754 |     
    arc      | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/756d9b95d1e9b77740218784695e02d876d80277 |     
    or1k     | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/9300e2a7ed62945bba75a8dd29ddd298ce139367 |     
   x86_64    |           htop-3.3.0           | NOK | http://autobuild.buildroot.net/results/05177bcd5da7157523bb73be4a1dd13baca582dc | ORPH
  aarch64    |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.net/results/a5aacfb7708bc5ca258df9487280bb8f0eb29ab1 |     
  powerpc    |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.net/results/c7a7073ecde178cc5e2c1f8f5325388d359788d9 |     
powerpc64le  |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.net/results/1185c3ad200d0514ce932ee8fd41c25afd7a0fd6 |     
 aarch64_be  |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.net/results/55bf4b28386db7ecb72d571523f37f681182683f |     
   s390x     |        iproute2-6.10.0         | NOK | http://autobuild.buildroot.net/results/1beaa4ad78f86e19b26ae3153e47f41f9389e7be |     
  riscv64    |         jemalloc-5.3.0         | NOK | http://autobuild.buildroot.net/results/b6fe04ddb723745560ffa85198d076ca28230b31 |     
   x86_64    |      libcamera-apps-1.5.0      | NOK | http://autobuild.buildroot.net/results/5aa40efd1492b99911bfd80fa3dcd16bdda54ec7 |     
 aarch64_be  |         libcuefile-475         | NOK | http://autobuild.buildroot.net/results/e69e7541e99e945196505ea7f4db02d461f4dcb0 | ORPH
 aarch64_be  | libdbi-drivers-0bfae6c43134... | NOK | http://autobuild.buildroot.net/results/0321f47fddf49e8ed1beaf144f672db5a4d636ab |     
  riscv32    | libdill-32d0e8b733416208e04... | NOK | http://autobuild.buildroot.net/results/4cf766a2bec1e9e08dce53f8e8f703f9542825ed |     
   s390x     |         libesmtp-1.1.0         | NOK | http://autobuild.buildroot.net/results/e54503a5fdb6a095aa62e536a37f27bcba9883ee | ORPH
   arceb     |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/0c28985201227fbc3b7e727f6ebca077982bc7f8 |     
   arceb     |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/0f40e965850bb3fa9f166faf70d8dfc4eb1af394 |     
    or1k     |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/9306e41d7cc62bb5fb0f04290bde2eff9bb30c33 |     
    arc      |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/ed7777599b6910ecc63446769ff1e5a6af7b633f |     
  mips64el   |        libgcrypt-1.11.0        | NOK | http://autobuild.buildroot.net/results/46efff01f7d0a2ce3c8523cd073302e58e0f0ae5 | ORPH
    arc      |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/ea47027d83a4aec4ed3d0e6429911e5b6e86a3c6 |     
    arc      |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/5aba3d4102bc3fdbd23c7c88ca130c0ffbd5ff6d |     
   arceb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/564d19f2d7f47faf90abbb9ef04b6d08c8452dfe |     
   arceb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/c68a1b626d42cfe0dd6cd562caf9ea48a3d35e21 |     
    i686     |         libnss-3.102.1         | NOK | http://autobuild.buildroot.net/results/64e8b72d42ae00db77220669ed15dd68dcdaec06 |     
 powerpc64   |   libphidget-2.1.9.20190409    | NOK | http://autobuild.buildroot.net/results/5cd65ba9ec48890e2c68a004ce8a336215a3ccbc |     
   mips64    |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/aa3e9747b80608e48a1491af33fbd15a7f635558 | ORPH
   mips64    |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/b618419f4eb8b7880de05df1da8dae5a47eeee1b | ORPH
   mips64    |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/7a818409d888c6cbe42a2e35dcb1a03c461486b1 | ORPH
  powerpc    |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/dddd58def99b28c5afa9896622259b652a4287da | ORPH
   xtensa    |          libsepol-3.6          | NOK | http://autobuild.buildroot.net/results/019b0b42995dc938afd80de20a1f05881e390753 |     
   xtensa    |          libsepol-3.6          | NOK | http://autobuild.buildroot.net/results/44d485aaccd6c0b7be7a8eba4f2d80f706a277c8 |     
   xtensa    |          libsepol-3.6          | NOK | http://autobuild.buildroot.net/results/d8c7b57d76064c2bcb26969507640fc8286460f5 |     
   mips64    | libsvgtiny-ea9d99fc8b231c22... | NOK | http://autobuild.buildroot.net/results/edb32ccf580e6f429626af80b6a7cf7127217956 | ORPH
 microblaze  |         libv4l-1.24.1          | NOK | http://autobuild.buildroot.net/results/09ef31930cd939d87495e3a1bc22e2f6708added |     
   sparc     |        lighttpd-1.4.76         | NOK | http://autobuild.buildroot.net/results/83aac3f0594da8010e78a41a58af878d8228b5b1 | ORPH
   sparc     |        lighttpd-1.4.76         | NOK | http://autobuild.buildroot.net/results/fcc9ebe6a758dc7f7409494de7d79acf61991092 | ORPH
   nios2     |          linux-6.10.2          | NOK | http://autobuild.buildroot.net/results/0bc5d5ea56e588e6d73f22ff896d1470e7421bbd | ORPH
   nios2     |          linux-6.10.2          | NOK | http://autobuild.buildroot.net/results/2500da907eaee1afd878e946557c4cd756e36972 | ORPH
    sh4a     |          linux-6.10.2          | NOK | http://autobuild.buildroot.net/results/c37efe1c62749952dc0af703688d875379280bfc | ORPH
   mipsel    |          linux-tools           | NOK | http://autobuild.buildroot.net/results/0c6084b0324c8edd0396711d826dee7ca0402d6b | ORPH
   x86_64    |          linux-tools           | NOK | http://autobuild.buildroot.net/results/2fe8e441559e70748f8d6c89591ece395d4437e7 | ORPH
   mipsel    |        mariadb-10.11.6         | NOK | http://autobuild.buildroot.net/results/8b8034cc7c6be9be74bbd39ef2836f17a025ad3a | ORPH
    arc      |        mariadb-10.11.6         | NOK | http://autobuild.buildroot.net/results/8b0637115e8bfff8f4e9dfe67195bb01681ff318 | ORPH
   sparc     |        mariadb-10.11.6         | NOK | http://autobuild.buildroot.net/results/509304bd89cd64ac070dcf108a52cf53b01b8246 | ORPH
   s390x     |          mender-3.4.0          | NOK | http://autobuild.buildroot.net/results/f4b6e566b349e243bf318418936337582d317dda |     
   s390x     |          mender-3.4.0          | NOK | http://autobuild.buildroot.net/results/370494155ffb80ff69b4e22ad36c57cf85943b7f |     
microblazeel |           ncmpc-0.49           | NOK | http://autobuild.buildroot.net/results/08c3e0fa4cf49383cc7982ec5f46212878e8fb77 |     
powerpc64le  |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/484d119d312fac44b6ae85ee9da7c378146ad0e9 | ORPH
    arm      |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/970025dc60e79ca9bb50f0b540163e986f796440 | ORPH
    sh4a     |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/786a62e26a811645d01b76c077519e0b6ed9a420 | ORPH
    arc      |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/0e2f3c364ce5895466dcef603abac671e323d02d | ORPH
 aarch64_be  |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/039c682d60b21b68585fd5b12cf64036d87f1f86 | ORPH
microblazeel |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/5384600a8a65d5bd352fd1fd6d0fc84783e6c711 | ORPH
    arc      |          ntp-4.2.8p18          | NOK | http://autobuild.buildroot.net/results/e2f3c46df83467f0ae8962b434c11366cbcf29de |     
   nios2     |       open62541-v1.3.11        | NOK | http://autobuild.buildroot.net/results/6ceae16f1223c9de5ad20f49f7a1f30b35d49edb | ORPH
   mips64    |        openblas-0.3.27         | NOK | http://autobuild.buildroot.net/results/dd1b5bd32b73e1f552b987c8cc1216498f9827c6 |     
   armeb     |        openconnect-9.12        | NOK | http://autobuild.buildroot.net/results/762e2998bcd9562ab2b9fde32170abe20a233354 |     
  mips64el   |         openssh-9.8p1          | NOK | http://autobuild.buildroot.net/results/8da1f6b1f10e5e91e7734e77e0ef84ecb84a881b | ORPH
   mips64    |         openssh-9.8p1          | NOK | http://autobuild.buildroot.net/results/9525d03b333368cd3f56a80d4bb8df4a21e2b730 | ORPH
   mips64    |         openssh-9.8p1          | NOK | http://autobuild.buildroot.net/results/f2f725d10e96c387a8d9af5abcbd543de3fb4974 | ORPH
   mips64    |         openssh-9.8p1          | NOK | http://autobuild.buildroot.net/results/87cedde422ab4bef5524bd03dcd366b2eb63b9ff | ORPH
powerpc64le  |         openssh-9.8p1          | NOK | http://autobuild.buildroot.net/results/834232a20d8e2f5cdf336b0ab6d65ebc01b1bfd0 | ORPH
  powerpc    |       parsec-tool-0.7.0        | NOK | http://autobuild.buildroot.net/results/dcda158e73d84a778101ea78473be00e10581617 |     
    sh4      |           php-8.3.9            | NOK | http://autobuild.buildroot.net/results/a7037757771491c9e54d376e04f47dbf533afd23 |     
   sh4aeb    |           php-8.3.9            | NOK | http://autobuild.buildroot.net/results/d56005457bb05d8bcf55e7b36740bc24def359f2 |     
 aarch64_be  |         pixman-0.42.2          | NOK | http://autobuild.buildroot.net/results/e856e5199c90338fdc91255c6dee253ecc644277 | ORPH
   sparc     |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.net/results/bef2685cd9201953fd0b775ad89afb485dced909 | ORPH
  mips64el   |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.net/results/75ea230bacf0699ea25dd29b33e6aa66d65bfb7f | ORPH
    sh4      |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.net/results/37a103582341e913896f164ced027cfed10350f8 | ORPH
  riscv64    |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.net/results/794c967d8a578b08343b0a41b6629e07e6738ea8 | ORPH
  mips64el   |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.net/results/8733c40000ad0f9955bcac73913c6b1b673838be | ORPH
 powerpc64   |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.net/results/43ad719c8b63c561ffd37c841a8dd45d26243b0d | ORPH
    arc      |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.net/results/2e2079fbb8e19e50ac635d8b95806b7bbe7272df | ORPH
   s390x     |    python-autocommand-2.2.2    | NOK | http://autobuild.buildroot.net/results/b83e577ecd6412cab40efd1525695d09ca5cfcac |     
    i686     |    python-autocommand-2.2.2    | NOK | http://autobuild.buildroot.net/results/3b280042f64e62cc693bed3ba3448818b7d63a4b |     
    i686     |    python-autocommand-2.2.2    | NOK | http://autobuild.buildroot.net/results/464c0a9c4c1932930195bfe3a3540bb7b70b49f9 |     
    mips     |    python-autocommand-2.2.2    | NOK | http://autobuild.buildroot.net/results/8e7d5d2cdbd3e0af46dc250de540acd56ac00657 |     
   s390x     |    python-autocommand-2.2.2    | NOK | http://autobuild.buildroot.net/results/ec42f2012ea40903ca853aaf893bfd8ba2d1a098 |     
   sh4eb     |    python-autocommand-2.2.2    | NOK | http://autobuild.buildroot.net/results/cfab18ee892e7eb92d19962abb5c03335e924885 |     
 powerpc64   |    python-autocommand-2.2.2    | NOK | http://autobuild.buildroot.net/results/18a8564c8ec5e5983635b9833f504355dd59380d |     
  aarch64    |    python-autocommand-2.2.2    | NOK | http://autobuild.buildroot.net/results/0e4e1139476bf660b23af96509cc3f3e1c1da6c5 |     
   mipsel    |   python-cryptography-39.0.2   | NOK | http://autobuild.buildroot.net/results/d886cc68c8d985a8cffde16b3e45041ebd753bd9 |     
   sparc     |   python-cryptography-39.0.2   | NOK | http://autobuild.buildroot.net/results/c762b1ed47a2e872607d9d213e1a3195fb26c2dc |     
  aarch64    |   python-cryptography-39.0.2   | NOK | http://autobuild.buildroot.net/results/8f15a135650fbfd172cc513de7df92cfb17aecba |     
  aarch64    |      python-daemon-3.0.1       | NOK | http://autobuild.buildroot.net/results/4ef130a14cd599f3ce5fd33e385a3a8c6f4283fb |     
   mips64    |      python-daemon-3.0.1       | NOK | http://autobuild.buildroot.net/results/fc4fd1f0f88890d6debb6dd6fa90a4d87d407c01 |     
powerpc64le  |      python-daemon-3.0.1       | NOK | http://autobuild.buildroot.net/results/9a235fd27ac4db2a3bdbcd30c65e47b34b57a305 |     
   mips64    |     python-remi-2022.7.27      | NOK | http://autobuild.buildroot.net/results/6066ccb10ca578cd7284f42538564b8f817a77d4 |     
  riscv64    |     python-remi-2022.7.27      | NOK | http://autobuild.buildroot.net/results/009b0ce6c8c9e78f180a4524d376ff0473ea223b |     
   mipsel    | python-unittest-xml-reporti... | NOK | http://autobuild.buildroot.net/results/6898b65cd25408e52410ee2cc89db7899fbc4d9d |     
   xtensa    |         s6-dns-2.3.7.2         | NOK | http://autobuild.buildroot.net/results/43773f26b5dc90a9b81e66c955b62ca1aa2c78e9 |     
   sparc     |         s6-dns-2.3.7.2         | NOK | http://autobuild.buildroot.net/results/a3ede7719b5f7268780b9aed391aab3b7ddb2869 |     
   xtensa    |         s6-dns-2.3.7.2         | NOK | http://autobuild.buildroot.net/results/46aad32442ce33afbe37edad0796be6f6e97e160 |     
   sparc     |         s6-dns-2.3.7.2         | NOK | http://autobuild.buildroot.net/results/4ad1d644e243a6aacb46f5d82e33a8645f690a8c |     
   xtensa    |         s6-dns-2.3.7.2         | NOK | http://autobuild.buildroot.net/results/a3483ace52c528a6f665a7bdd61324861e87bfc3 |     
    mips     |         siproxd-0.8.3          | NOK | http://autobuild.buildroot.net/results/52728cfff637257ddc149af131ad898a8ec1bc40 |     
  sparc64    |       strongswan-5.9.13        | NOK | http://autobuild.buildroot.net/results/4efdc8a6fd32e176ea74778103d40bd869883bb8 |     
    i686     |         systemd-256.4          | NOK | http://autobuild.buildroot.net/results/2ba07fc1bfe444a1d98cc237498ce329610a31d3 |     
microblazeel |        tcf-agent-1.8.0         | NOK | http://autobuild.buildroot.net/results/eed40d43cc05c2d3faaa0f822426c7f4f611a80e |     
   mipsel    |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/718c7b73dc65871b27af6c2d8aa251216aabd413 |     
   sparc     |        tipidee-0.0.5.0         | NOK | http://autobuild.buildroot.net/results/743aad087bb6b7473dec1c0859f0abf063e56238 |     
   sparc     |        tipidee-0.0.5.0         | NOK | http://autobuild.buildroot.net/results/20efdbf6acb5cc3669c7398462feb218fa4beec5 |     
   sparc     |        tipidee-0.0.5.0         | NOK | http://autobuild.buildroot.net/results/c0e401dbf2476e665efc8600f985c39cf3d5cae8 |     
   mips64    |         tpm2-tss-3.2.2         | NOK | http://autobuild.buildroot.net/results/9abb9f46bfc492221686ceee2a6585b3dce1fbf5 | ORPH
   armeb     |          trinity-1.9           | NOK | http://autobuild.buildroot.net/results/056745a12d6399d08c02842d5b32904dd2efe6ef | ORPH
    mips     |          trinity-1.9           | NOK | http://autobuild.buildroot.net/results/647d537469200e661389cca4bbecc1197f2e3770 | ORPH
  aarch64    |      uboot-tools-2021.07       | NOK | http://autobuild.buildroot.net/results/b2c7a6953e3506f52c0dc516e32b96697b66908c | ORPH
   arceb     |         uclibc-1.0.49          | NOK | http://autobuild.buildroot.net/results/9d3a6e5bc319ae68a4afbf48455a14aa5178f6fd |     
powerpc64le  | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/3bac81cbea094279d5483e52c7e9b9eca7528ea7 |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/464d9175cf6b20444dfa3edccd04786ef4f3864a |     
    sh4      |            unknown             | NOK | http://autobuild.buildroot.net/results/2ca11d0bf2c098f8195358e09c8dfadfd8ed752b |     
   armeb     |            unknown             | NOK | http://autobuild.buildroot.net/results/fe79a7572b40cf0164d3e87b285eb2be416348ec |     
    mips     |            unknown             | NOK | http://autobuild.buildroot.net/results/8e8e5c378b99bd948847976e0bb8182ae725f171 |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/7dc246c04199c33d397be4340e912b99a1f4fc37 |     
  aarch64    |         ustreamer-6.11         | NOK | http://autobuild.buildroot.net/results/c924bcbb6cdc0541c8869cea8bb41931f38ca0ea |     
  riscv32    |       util-linux-2.39.3        | NOK | http://autobuild.buildroot.net/results/a063c8af28b282536fbfa8032923cc1eccd8dcea | ORPH
   x86_64    |      v4l2loopback-0.12.7       | NOK | http://autobuild.buildroot.net/results/9cb4b6de7cbb56b8e5e1273cbf406f9d9a90c9d4 |     
   mipsel    |        valgrind-3.22.0         | NOK | http://autobuild.buildroot.net/results/b21960d180d6ee6008f0451cd8a7cd6b689e17a5 | ORPH
  mips64el   |        valgrind-3.23.0         | NOK | http://autobuild.buildroot.net/results/582992aca72b7e51612c9a44fe80a8d969bc5127 | ORPH
   mipsel    |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/558127ec7d813c132257936cddf84e7627e57000 |     
   sparc     |        zxing-cpp-2.2.1         | NOK | http://autobuild.buildroot.net/results/599933cc8f631480996bbdc12e258613c1ec196a |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

                  bcusdk-0.0.5 | 1 
                     dtc-1.7.0 | 1 
                  fbterm-1.7.0 | 1 
           ghostscript-10.03.1 | 1 
        host-python-lxml-5.1.0 | 1 
          libcamera-apps-1.2.1 | 1 
                 mesa3d-24.0.9 | 1 
                    ola-0.10.9 | 1 
                 openssh-9.7p1 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/802c4b88f5de66cc361501706872a7775045902f |     
    arm      |           dtc-1.7.0            | NOK | http://autobuild.buildroot.net/results/3ac1a1498ebf3ce8613948626ad58f659fa7ccab |     
   x86_64    |          fbterm-1.7.0          | NOK | http://autobuild.buildroot.net/results/de73602d88cc0490b162463dbee4f4a6340468bb | ORPH
    arm      |      ghostscript-10.03.1       | NOK | http://autobuild.buildroot.net/results/b0299e0f0b1bdad0bea0ca2aed246cefc6839ae0 |     
  aarch64    |     host-python-lxml-5.1.0     | NOK | http://autobuild.buildroot.net/results/f90ee5e70d40b56de91d2b7a53bb3c11408c8cb3 |     
   s390x     |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/7cc41decab18f035b3b8aaef04c8f44ad4337172 |     
    sh4      |         mesa3d-24.0.9          | NOK | http://autobuild.buildroot.net/results/13b315177a6024e2c4c98b48efbad0d61ba54f0b |     
  sparc64    |           ola-0.10.9           | NOK | http://autobuild.buildroot.net/results/c939fdb0d15ba2418649ed42fcea1b096cc9f62f |     
   mipsel    |         openssh-9.7p1          | NOK | http://autobuild.buildroot.net/results/0deba2eaa98ff8eedd2d21b688b05d4e97c2a2f6 | ORPH


Classification of failures by reason for 2024.05.x
--------------------------------------------------

aer-inject-9bd5e2c7886fca72... | 1 
                  fbterm-1.7.0 | 1 
                 highway-1.1.0 | 1 
                host-go-1.22.4 | 1 
               ipmitool-1_8_19 | 1 
                  libffi-3.4.6 | 1 


Detail of failures for 2024.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/f5bf5b473501b9888510a4658139ba96b8344545 | ORPH
  aarch64    |          fbterm-1.7.0          | NOK | http://autobuild.buildroot.net/results/13b5af8b984a2edca945a7d65f8b321133fe7d1b | ORPH
 powerpc64   |         highway-1.1.0          | NOK | http://autobuild.buildroot.net/results/57648c51a6b63ce450f62056a073172fa7cdbdc2 |     
  mips64el   |         host-go-1.22.4         | NOK | http://autobuild.buildroot.net/results/7e7d71fc00def93eefa46555d09f5ca23c826de5 |     
   nios2     |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.net/results/b84e86040a346d679a4c4040e663300249eb7a98 |     
    or1k     |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/73859d5ca0b4d5c085cd33d54bc7d3e43d6441cf |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
