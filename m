Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7857EC636CD
	for <buildroot@archiver.kernel.org>; Fri, 10 Feb 2023 06:37:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F3EEF60AB1;
	Fri, 10 Feb 2023 06:37:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F3EEF60AB1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nWgboKrW1wWV; Fri, 10 Feb 2023 06:37:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3408560B70;
	Fri, 10 Feb 2023 06:37:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3408560B70
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 972191BF47A
 for <buildroot@lists.busybox.net>; Fri, 10 Feb 2023 06:37:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5AA4482232
 for <buildroot@lists.busybox.net>; Fri, 10 Feb 2023 06:37:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5AA4482232
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Rjz_-IXYme87 for <buildroot@lists.busybox.net>;
 Fri, 10 Feb 2023 06:37:17 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 89ED282202
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 89ED282202
 for <buildroot@buildroot.org>; Fri, 10 Feb 2023 06:37:16 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 6EE17FF809
 for <buildroot@buildroot.org>; Fri, 10 Feb 2023 06:37:13 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Fri, 10 Feb 2023 06:37:13 -0000
Message-Id: <20230210063719.5AA4482232@smtp1.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1676011033; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=30ut2bmyB0xNwFH+2rXC92PYwXww9o+Gg2Z63S7LYcs=;
 b=H6xcdlXUFeYCwehTJ7TpqJrcNZoywHtHhkWsUHCFIzrRzcdJe4H0vlwN0/7C2TgXBVkEGu
 Jppi8PlHS+whLbRW0efdv5A48Prp4TRaHsjQs6MTI0/h8/4s0NlJnE+RFEnpqSX5ri0wXg
 AEKVypcyACVbTDi1NwnQa811H0nO3YU+bzKkZzkfJFbdTfcgt+88TawWzCYaR/mKCquwo5
 v/h8N5oYUNZ+3jZtnvCTRkh0jZFUuXZVkjiInSn0wW0rdcQtG2RJlkSsaHwjROfr4SXr8B
 eF80i8aeD1NkIyxARKVeLscDDv4tn3aZvy+VeYel2O3azgjXWqbN5BuUG+A+Fg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=H6xcdlXU
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-02-09
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

Hello,

Autobuild statistics for 2023-02-09
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  |  4  |  2  |  1  |  7  |
  2022.11.x  | 14  | 20  |  0  | 34  |
    master   | 171 | 165 |  2  | 338 |

Classification of failures by reason for master
-----------------------------------------------

                       unknown | 7 
                elfutils-0.186 | 6 
              host-pahole-1.24 | 6 
                  jack2-1.9.21 | 6 
                libsolv-0.7.22 | 6 
    python-cryptography-39.0.0 | 6 
            host-binutils-2.38 | 5 
                host-go-1.19.5 | 5 
                   linux-6.1.9 | 5 
                    norm-1.5.8 | 5 
glibc-2.36-81-g4f4d7a13edfd... | 4 
  gobject-introspection-1.72.0 | 4 
              host-rust-1.67.0 | 4 
                gerbera-1.10.0 | 3 
            host-binutils-2.37 | 3 
                  ffmpeg-4.4.3 | 2 
              fluent-bit-2.0.8 | 2 
         gobject-introspection | 2 
         host-libarchive-3.6.2 | 2 
               libglib2-2.72.3 | 2 
             libgpg-error-1.46 | 2 
          linux-5.10.162-cip24 | 2 
             lirc-tools-0.10.2 | 2 
          lttng-modules-2.13.7 | 2 
                  netsurf-3.10 | 2 
                     php-8.2.1 | 2 
           python-bcrypt-4.0.1 | 2 
           python-numpy-1.23.5 | 2 
                    sdl-1.2.15 | 2 
              sigrok-cli-0.7.2 | 2 
                 systemd-252.4 | 2 
                xenomai-3.0.10 | 2 
                  zabbix-5.4.9 | 2 
                     ace-7.0.6 | 1 
              asterisk-16.29.1 | 1 
             batman-adv-2022.3 | 1 
                  bind-9.16.33 | 1 
             bluez5_utils-5.65 | 1 
                    brltty-6.5 | 1 
                 coreutils-9.1 | 1 
           crucible-2022.05.25 | 1 
             dahdi-linux-3.2.0 | 1 
                 dfu-util-0.11 | 1 
                 dmalloc-5.6.5 | 1 
                    dust-0.8.1 | 1 
        edk2-edk2-stable202208 | 1 
                  faad2-2.10.1 | 1 
               fftw-quad-3.3.8 | 1 
                     file-5.43 | 1 
fs/cramfs/cramfs.mk:46: /ho... | 1 
fs/ubi/ubi.mk:51: /home/aut... | 1 
fs/ubi/ubi.mk:51: /home/tho... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /tmp/... | 1 
fs/ubifs/ubifs.mk:49: /tmp/... | 1 
                    fwup-1.9.1 | 1 
hawktracer-2ec19d7192334414... | 1 
igh-ethercat-2e2cef61318953... | 1 
                   json-c-0.16 | 1 
              libblockdev-2.26 | 1 
              libgcrypt-1.10.1 | 1 
                   libnss-3.87 | 1 
               libsigsegv-2.14 | 1 
                libzlib-1.2.13 | 1 
     linux-5.10.162-cip24-rt10 | 1 
            linux-fusion-9.0.3 | 1 
                   linux-tools | 1 
                lua-cffi-0.2.3 | 1 
          modem-manager-1.20.4 | 1 
            modsecurity2-2.9.7 | 1 
                    mosh-1.4.0 | 1 
                    mutt-2.2.9 | 1 
                  nginx-1.22.1 | 1 
            ocf-linux-20171122 | 1 
                opencv3-3.4.17 | 1 
   openvmtools-11.3.5-18557794 | 1 
                    opkg-0.4.5 | 1 
           optee-client-3.19.0 | 1 
                    opus-1.3.1 | 1 
                   perl-5.36.0 | 1 
                 pixman-0.42.2 | 1 
            quickjs-2021-03-27 | 1 
                  reaver-1.6.6 | 1 
                   rsync-3.2.7 | 1 
            ssdp-responder-1.9 | 1 
                 uclibc-1.0.42 | 1 
uclibc-ng-test-6790eafe897b... | 1 
                 wavemon-0.9.4 | 1 
             xlib_libX11-1.8.3 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    mips     |           ace-7.0.6            | NOK | http://autobuild.buildroot.net/results/9b8e7f486eada7c4b28d081886b862ae6fcfaac1 |     
    mips     |        asterisk-16.29.1        | NOK | http://autobuild.buildroot.net/results/c3952d85c634802e941777e040df977251b05047 |     
  mips64el   |       batman-adv-2022.3        | NOK | http://autobuild.buildroot.net/results/a751028b46bca05fc149621ec723d144f51724aa |     
   sh4eb     |          bind-9.16.33          | NOK | http://autobuild.buildroot.net/results/4119b0d9e84e3adf3ffcfc8e2058b1b130d7f959 | ORPH
    sh4a     |       bluez5_utils-5.65        | NOK | http://autobuild.buildroot.net/results/941ab94c5cdaaeaa0af3e02f10f683ae7eb48b5f |     
   mipsel    |           brltty-6.5           | NOK | http://autobuild.buildroot.net/results/f138c1d9bb2d32592631d53e594a136bb15242b1 |     
   sh4aeb    |         coreutils-9.1          | NOK | http://autobuild.buildroot.net/results/78ba29070a08165e5cd3b3f0db632583c79b7ce9 | ORPH
   x86_64    |      crucible-2022.05.25       | NOK | http://autobuild.buildroot.net/results/1bf180ff682b73028dc1cfb6f78e5f4ff09c2c68 |     
    i586     |       dahdi-linux-3.2.0        | NOK | http://autobuild.buildroot.net/results/afefc1310dcdc41779a4488ceda5fbaa47a20961 |     
    or1k     |         dfu-util-0.11          | NOK | http://autobuild.buildroot.net/results/d875a150ef19af56f9c7b87595a7c325db61a51d | ORPH
    i686     |         dmalloc-5.6.5          | NOK | http://autobuild.buildroot.net/results/43bb254e064ccfd813247c6aef7953437fd1d0dc | ORPH
powerpc64le  |           dust-0.8.1           | NOK | http://autobuild.buildroot.net/results/07c34d52b08611496ae862aa670ed81776df9d28 | ORPH
   x86_64    |     edk2-edk2-stable202208     | NOK | http://autobuild.buildroot.net/results/ad9a144d92d624c151d890944ffc612a220ec130 |     
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/e32e53535e5c1c96f59efde5ed1d6a6289e109fb | ORPH
    arc      |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/5fd51cedbae5ddfd16e3bf9dbb48aaa9c1a71309 | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/bfb7c87e3c4ee3594e9e97e8ed772370ac1aebcc | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/2d27e7133a82889782bfe14514b9323afeb30644 | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/93e3e26f30dfbe3c7f0576e43d2446d95bb483c8 | ORPH
   arceb     |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/2a94467eddc71f877ac6e123e039a69567bec6e1 | ORPH
    sh4a     |          faad2-2.10.1          | NOK | http://autobuild.buildroot.net/results/e975b9c2eeac954547cd6d79912c7044a4c2888e |     
   arceb     |          ffmpeg-4.4.3          | NOK | http://autobuild.buildroot.net/results/88c78ea274e22e406bc0b82d000bd17914256f40 |     
  aarch64    |          ffmpeg-4.4.3          | NOK | http://autobuild.buildroot.net/results/dca3bc3e306da1f7ddfe3bda1a0747ec14a51bbc |     
powerpc64le  |        fftw-quad-3.3.8         | NOK | http://autobuild.buildroot.net/results/9bc9c00f9d65bc7bb838577544b6242019d135dc | ORPH
   xtensa    |           file-5.43            | NOK | http://autobuild.buildroot.net/results/541d5cb89a597b43f260552ad584fad084c73d00 | ORPH
   s390x     |        fluent-bit-2.0.8        | NOK | http://autobuild.buildroot.net/results/856fd250f75a696694c70e3208ffcef7470a7082 |     
   s390x     |        fluent-bit-2.0.8        | NOK | http://autobuild.buildroot.net/results/dceb413fb5d459338417d8dd5a42d95aa23e849b |     
   mips64    | fs/cramfs/cramfs.mk:46: /ho... | NOK | http://autobuild.buildroot.net/results/6211045f9699ec4bcc6acd8ff02f2f4729f2c41e |     
 powerpc64   | fs/ubi/ubi.mk:51: /home/aut... | NOK | http://autobuild.buildroot.net/results/12a24742dfbd5253b12104b962261da2489e003a |     
 aarch64_be  | fs/ubi/ubi.mk:51: /home/tho... | NOK | http://autobuild.buildroot.net/results/1171505712b18f850bc15fd7f5b93500dcea3508 |     
microblazeel | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/1f941d6fc4e1e291fca87ebd86d42bb20bb56785 |     
    mips     | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/1bdf804eec3211b652b7df781c49b3eb7478f0ad |     
 powerpc64   | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/1e23138b42ce8a7746429cec10659f96f2ea856c |     
  mips64el   |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/67de65c34f2948dc63008d604b243c180609cb23 |     
powerpc64le  |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/ea8ef0aefd1e0893a3ba38370d8b4a5ac4107d7f |     
    mips     |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/70a9c3e3fb1d7480bf31619bbd9c9f73d8ad177e |     
powerpc64le  |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/13d7d395f220b537fa77d1e6e72c9c3d6a1f6911 |     
  powerpc    | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/0614dccce55f6fe4b91d1493781c18ebe0b8ed0c |     
powerpc64le  | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/32e36e46f31bab5382d9bb8e30f260a682698655 |     
powerpc64le  | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/2ecb54e2b6f0329b9b43527030ebcc82c561ab72 |     
  powerpc    | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/f7f2662137fa1a1789d929fda36730204dcd1cc0 |     
   armeb     |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/d126b44ac7de8121d53d47ae49b7d5b416e12a8b |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/8cdfa96470f57aa87c502f68091f6c7da610cce2 |     
   nios2     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/5d29e38ee3898db338a01f068df33e17a650a7ff | ORPH
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/2a8bcae935d17816a3c629fc63b0fe5db3e6849d | ORPH
    i686     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/313d8c3e4d3de8af5a8ccbc577e34876d2e1bc02 | ORPH
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/34683eafa5ff63c3f16d14331283afd672ce3a76 | ORPH
  riscv32    | hawktracer-2ec19d7192334414... | NOK | http://autobuild.buildroot.net/results/b4705910778ae1069476b61bb4ce6a5bd4a20889 |     
    or1k     |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/aab380e73b5be544fc14a4a0cf9332005233752d |     
    or1k     |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/79b01d7b38d887929ca1522c390cd098db916a0a |     
   arceb     |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/dec43e3c2ff1a1f9da02dba6554d95b4d2ab7bd3 |     
    m68k     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/213cdb606f08d99d6936fa0fb1917857cfddd310 |     
   x86_64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/0e3565f93db4d7d111b8d3561437d5d274851d2d |     
 aarch64_be  |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/20ecb3d5f62818cdf880f8483ccec08324b0e51a |     
 powerpc64   |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/98f7fa79d81d14c448b1b63a6b8d43625771fc46 |     
   mips64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/3f9a88ad7b13552a7ac7d859ee274beba22f2661 |     
    i686     |         host-go-1.19.5         | NOK | http://autobuild.buildroot.net/results/86559cc399271ef1268cc5e5f9e203b246ae3012 |     
   mips64    |         host-go-1.19.5         | NOK | http://autobuild.buildroot.net/results/1805868dfbdac9f192a96b970847e165847e571a |     
   mips64    |         host-go-1.19.5         | NOK | http://autobuild.buildroot.net/results/f1f7ae30fe97387130a5a048999da42a82ae57ec |     
   mips64    |         host-go-1.19.5         | NOK | http://autobuild.buildroot.net/results/20e2f1b14e3d4a1302794e54fa7d42ca4f9394b5 |     
  aarch64    |         host-go-1.19.5         | NOK | http://autobuild.buildroot.net/results/9b60ca3a000307a8df594c6632b7c28c8d9ff793 |     
  aarch64    |     host-libarchive-3.6.2      | NOK | http://autobuild.buildroot.net/results/34312c9886cd81a683543753039ae41a086c0a2f |     
   mips64    |     host-libarchive-3.6.2      | NOK | http://autobuild.buildroot.net/results/a23946dbc6925331787bce11ff843de0992b7e1c |     
    m68k     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/c50ddd652f8d30bb25e64be52099e37e2d6c8977 |     
   sparc     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/c0dc715f90f9f96b32ad4add69bb1741d969f38a |     
    arm      |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/bd577399d3a86cf91e0e392deb882bc34ddcbd6d |     
    mips     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/33d583f6c8df7bba4e883619489eaa8b03d34ce0 |     
powerpc64le  |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/010eb2f682e24a1419a4690c2235b447ca5d6107 |     
   x86_64    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/5c5e939f2ac2713240705a4e977b1ee0e1fa2086 |     
   x86_64    |        host-rust-1.67.0        | NOK | http://autobuild.buildroot.net/results/1a9c904e5238a628d9dd38e86d7af2da4d0f36b8 |     
   armeb     |        host-rust-1.67.0        | NOK | http://autobuild.buildroot.net/results/bd8614c7c8ff5ef1ae370b470ec3f1e46322169e |     
  aarch64    |        host-rust-1.67.0        | NOK | http://autobuild.buildroot.net/results/f0a0305d3a268cb228a5d8afee929bf225dc2fb7 |     
   armeb     |        host-rust-1.67.0        | NOK | http://autobuild.buildroot.net/results/26352a0ff6b3e77f7023735c05fc9e0f124f9450 |     
   x86_64    | igh-ethercat-2e2cef61318953... | NOK | http://autobuild.buildroot.net/results/c8720b48898585be5ec6cf2ff0c80a48ada331d5 |     
   s390x     |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/ca5385968711dffbd1b182eebcc647c97b74c874 |     
 powerpc64   |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/5f9f6e1d4aca0a268cf062d44186661f2305731c |     
    m68k     |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/2223ca0a19fb617b03defe1a5ea99e05ccb1c3c2 |     
  sparc64    |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/752faa2561cd67d590174ad801a540dbc0c57ce0 |     
  riscv64    |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/1c7482e12331cbe0f8cfcc89a72ed2fc3ef317c1 |     
 microblaze  |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/885cb119e88f2342e747d41d24fe32d0148a4659 |     
    or1k     |          json-c-0.16           | NOK | http://autobuild.buildroot.net/results/0ce61e355ac495129fa90a2f9288da6bfb3dafd4 |     
    or1k     |        libblockdev-2.26        | NOK | http://autobuild.buildroot.net/results/a2b824716e48b75e03dd012f8428a0a0d500896a | ORPH
    arm      |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/36046efdec33e21376d34d2dbb202982aff7243b | ORPH
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/a8af30ea6070450ba5ce4d3ed628f42bd7a8171b |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/1e270da549afb18348f131a3f21680946c51a6b2 |     
 aarch64_be  |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/ab7262e0850a00c91bbf153ec25154133b4dac04 | ORPH
 aarch64_be  |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/e3de2419d82e91a595b4812312d39f39e9c2d7a6 | ORPH
   sh4eb     |          libnss-3.87           | NOK | http://autobuild.buildroot.net/results/dfd980121fd3f1ff22fff7b5cd34e3d3680282a3 |     
   arceb     |        libsigsegv-2.14         | NOK | http://autobuild.buildroot.net/results/dd8ecf20660ba37b5bbcb59d9deabfb69da77677 |     
   arceb     |         libsolv-0.7.22         | NOK | http://autobuild.buildroot.net/results/bc3c2659de674c7cadeec9e45f992cfbf8fe68dc |     
    mips     |         libsolv-0.7.22         | NOK | http://autobuild.buildroot.net/results/dfb84c469a27bd285fa73baac927e4bc1014d037 |     
  aarch64    |         libsolv-0.7.22         | NOK | http://autobuild.buildroot.net/results/30cdbd6d4b2ebdc5901a86eb40cfe3821585d429 |     
    or1k     |         libsolv-0.7.22         | NOK | http://autobuild.buildroot.net/results/662242fd32e20c2e33308f517e58aa3b25c5075d |     
 powerpc64   |         libsolv-0.7.22         | NOK | http://autobuild.buildroot.net/results/3099b142a44116041fd369dc0a2a3fca2d42fbc5 |     
  mips64el   |         libsolv-0.7.22         | NOK | http://autobuild.buildroot.net/results/1deddeeb0ffdf4dfaaef139bed4e5f8986b31c8c |     
  mips64el   |         libzlib-1.2.13         | NOK | http://autobuild.buildroot.net/results/f2f9492dfd087b8bbc5c788d87193d185e2ee12c | ORPH
   mipsel    |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/010c7650d8156b890a86921200db35bd30fe18ab | ORPH
   nios2     |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/9744212f354abc5ac4832585f80e1dcdc636beed | ORPH
   arceb     |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/e3f7be013b6b2ab6f44800606780807b1fe5a115 | ORPH
  mips64el   |          linux-6.1.9           | NOK | http://autobuild.buildroot.net/results/d32294c96049410c764e8330f4c2ef8ce54b2d9c | ORPH
   mips64    |          linux-6.1.9           | NOK | http://autobuild.buildroot.net/results/6ea3c1ce875b608fd47840aede09238033664824 | ORPH
   mipsel    |          linux-6.1.9           | NOK | http://autobuild.buildroot.net/results/5a399b6280f5796035c67713a66b356bd2187de9 | ORPH
  riscv32    |          linux-6.1.9           | NOK | http://autobuild.buildroot.net/results/7cd3c5ea56ba1c0cab7e2d9f9698194beced6d92 | ORPH
   mipsel    |          linux-6.1.9           | NOK | http://autobuild.buildroot.net/results/c42a001c013cad006d89ec07373846073d0ec204 | ORPH
  sparc64    |       linux-fusion-9.0.3       | NOK | http://autobuild.buildroot.net/results/4a9b8de2e7500db213d8d578164fdcc3ebfebb5e | ORPH
   mips64    |          linux-tools           | NOK | http://autobuild.buildroot.net/results/9777eebc395ed3715e974b2f1475396986432fa3 | ORPH
 microblaze  |       lirc-tools-0.10.2        | NOK | http://autobuild.buildroot.net/results/8b9bd67edb7ae89a1fcfe33749bb0b8235e68163 | ORPH
    mips     |       lirc-tools-0.10.2        | NOK | http://autobuild.buildroot.net/results/0ba50382ea2c4e00d5d98be34c0bd8615268c563 | ORPH
 powerpc64   |      lttng-modules-2.13.7      | NOK | http://autobuild.buildroot.net/results/9e274cceb07e27e5566365320446fecadb20a729 |     
   sparc     |      lttng-modules-2.13.7      | NOK | http://autobuild.buildroot.net/results/37f2d1dd48a5ae25b646f4852f6fc807181d999c |     
    or1k     |         lua-cffi-0.2.3         | NOK | http://autobuild.buildroot.net/results/b441dcbea8723e57084d52339aa7f3592c3e4db3 |     
   armeb     |      modem-manager-1.20.4      | NOK | http://autobuild.buildroot.net/results/2bdf3b7822a64f625c3bb87f0ad6d334595a763d |     
    sh4a     |       modsecurity2-2.9.7       | NOK | http://autobuild.buildroot.net/results/fa370b0476c3eaaf48c615e7358c5fd2eae5badd |     
    mips     |           mosh-1.4.0           | NOK | http://autobuild.buildroot.net/results/9ee6f66248121adcf485266eea3e4f5510fbcab1 |     
  sparc64    |           mutt-2.2.9           | NOK | http://autobuild.buildroot.net/results/53ae7495c5d1cfec86a93be4c1b747ea4a311ee3 |     
powerpc64le  |          netsurf-3.10          | NOK | http://autobuild.buildroot.net/results/7e0466dfe8088620e12df970461c9b5f00ceafc0 |     
   sparc     |          netsurf-3.10          | NOK | http://autobuild.buildroot.net/results/6f16aeabf9b728d331ea1e65d7518d569cef717f |     
  sparc64    |          nginx-1.22.1          | NOK | http://autobuild.buildroot.net/results/078adb11db6dde9914aacd8906b7c01b03ebebf7 |     
  sparc64    |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/fee1ba15e78d6ca236eb3bbeda565172578bfcfc | ORPH
 microblaze  |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/82662e270cdb40deaf8a9c5a558628996453de1c | ORPH
microblazeel |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/46f4e06bb00f3d0126e31d0a558497af5bae7cc0 | ORPH
 aarch64_be  |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/3617d3beb1d669097f8257ad23f2d06b32fe101c | ORPH
    m68k     |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/92ad4eb2e57e74c036e655ae269f44e162b92e21 | ORPH
    arm      |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/d6930dfcdae163553dc9ba55dfefc1585797c35a | ORPH
   x86_64    |         opencv3-3.4.17         | NOK | http://autobuild.buildroot.net/results/3a5cc40a4d0b15ccced46701baed3bfa811c05e7 |     
  aarch64    |  openvmtools-11.3.5-18557794   | NOK | http://autobuild.buildroot.net/results/ea0d5440dda349a77315bed2b69e117ab0ed5476 |     
    or1k     |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/2932dcd2ecab732369d8139aae046e3d908f8bc5 | ORPH
    i686     |      optee-client-3.19.0       | NOK | http://autobuild.buildroot.net/results/4de54f6ec94a65c751b79eab0e61ff804495c726 |     
    arm      |           opus-1.3.1           | NOK | http://autobuild.buildroot.net/results/0d56a6bf110e060a3e3aa97b70565a93946a8584 | ORPH
  aarch64    |          perl-5.36.0           | NOK | http://autobuild.buildroot.net/results/7923cbc90f6ce3e9583a975b0bbc13bd60a81918 |     
   armeb     |           php-8.2.1            | NOK | http://autobuild.buildroot.net/results/0309ab52eedecb686e2487533f351e3b0ef3ed84 |     
   armeb     |           php-8.2.1            | NOK | http://autobuild.buildroot.net/results/4d49a5f2b2ee33502502265e86aebeb190b20f7c |     
    arm      |         pixman-0.42.2          | NOK | http://autobuild.buildroot.net/results/79c493df47871e78308b987fa921870b9ae1b43f |     
 powerpc64   |      python-bcrypt-4.0.1       | NOK | http://autobuild.buildroot.net/results/dc4485436c58ec2b625038b9dbc02216c9e20362 |     
  aarch64    |      python-bcrypt-4.0.1       | NOK | http://autobuild.buildroot.net/results/69c09b40436b7a4080bd68abfb805907ebf2d949 |     
    arm      |   python-cryptography-39.0.0   | NOK | http://autobuild.buildroot.net/results/60300a50f6218acced5159e8893b337c6de6fb75 |     
  sparc64    |   python-cryptography-39.0.0   | NOK | http://autobuild.buildroot.net/results/ad57ba835b1342a7903b2bfe7dfc6c3d1868d238 |     
  sparc64    |   python-cryptography-39.0.0   | NOK | http://autobuild.buildroot.net/results/9c6d4505517ad97f1024c7305e4e0ffe2f5fa213 |     
 powerpc64   |   python-cryptography-39.0.0   | NOK | http://autobuild.buildroot.net/results/42bd3c91b1b3124f79c490144d930da18e47f94d |     
    mips     |   python-cryptography-39.0.0   | NOK | http://autobuild.buildroot.net/results/076fd5476bd74223b87044ed98cdbaf10dc7daa0 |     
    mips     |   python-cryptography-39.0.0   | NOK | http://autobuild.buildroot.net/results/169abf05619832c54fc9fbd716741c0455bce92b |     
   x86_64    |      python-numpy-1.23.5       | NOK | http://autobuild.buildroot.net/results/9c81d6a957db0733b4ce7137545ada762e619d64 |     
   mipsel    |      python-numpy-1.23.5       | NOK | http://autobuild.buildroot.net/results/0f251f2eeb7b63efa439cae252bfc244376c56be |     
    or1k     |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/5e8c1e69479c838094ef5fba19a21a84a86cc8ad |     
    arc      |          reaver-1.6.6          | NOK | http://autobuild.buildroot.net/results/fefda6008e2eec8850e532f9916ff567f93e086e |     
   sparc     |          rsync-3.2.7           | NOK | http://autobuild.buildroot.net/results/1f0c4b6b7fdfded982e311b3bf58640dd405d97d |     
   sh4aeb    |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/5aea3e90a9ba89e4b3af4fc63db335083b7a91fb | ORPH
   sh4eb     |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/3979f16d6f26357fad9334e7ac4f8d22f287ed21 | ORPH
 aarch64_be  |        sigrok-cli-0.7.2        | NOK | http://autobuild.buildroot.net/results/7f86445785952b24aaab8d12c37b7873371ab712 | ORPH
   nios2     |        sigrok-cli-0.7.2        | NOK | http://autobuild.buildroot.net/results/9eaca61628c14afe95dd2c32cc6b877cbc3af5d1 | ORPH
  aarch64    |       ssdp-responder-1.9       | NOK | http://autobuild.buildroot.net/results/f6912d6f79155c5d12811beeb6cb43860e37e7e7 |     
 aarch64_be  |         systemd-252.4          | NOK | http://autobuild.buildroot.net/results/1233de5599a264832162b156678cfda1bafd5a84 |     
   mipsel    |         systemd-252.4          | NOK | http://autobuild.buildroot.net/results/5c41408a1dfb8375466189eb8616a4dca1fda727 |     
  powerpc    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/4b5be17326bdea6e020957e8c74d1241f1efcca9 |     
   mipsel    | uclibc-ng-test-6790eafe897b... | NOK | http://autobuild.buildroot.net/results/d307b26fd6673ed724ace500b62a4b3298281750 |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/ff415d035818b8ba1c81a6ac810499a88daba86d |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/a1e317a66ea875e30544beef5076a4ae5c035de1 |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/c13231dc943fb027355fd2c46db677783bdf654b |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/08f95c6ccfc009842f8e424e685ab9fad93d2703 |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/17eeb1e9499abbfde2ed5d62230a1dc51aa8bb96 |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/c2fd411f5b7fe349fa912a20813a6eb0ebecf4e8 |     
  sparc64    |            unknown             | NOK | http://autobuild.buildroot.net/results/90c4e3ad87a17de20dd54151583c2b9abaf639b0 |     
  aarch64    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/f85ac475b83127a78885196642e84711a20d555f | ORPH
   s390x     |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/29f42c0faebcb1c2534609f5344c2ba68e21c03e |     
   s390x     |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/7fc478d5cbd2bd526b732a5aa0e824f0654d00bb |     
    arm      |       xlib_libX11-1.8.3        | NOK | http://autobuild.buildroot.net/results/c922be5e389a1e71b19c7293fea4ad3580e828c9 |     
  sparc64    |          zabbix-5.4.9          | NOK | http://autobuild.buildroot.net/results/f8221a6e257156903cc77a65d91c189c1656f74d |     
   mips64    |          zabbix-5.4.9          | NOK | http://autobuild.buildroot.net/results/02e6ca13cf64724e3d100f4f3b5472ca6810faac |     


Classification of failures by reason for 2022.02.x
--------------------------------------------------

          janus-gateway-0.11.6 | 1 
                       libuwsc | 1 
                 wavemon-0.9.4 | 1 


Detail of failures for 2022.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mipsel    |      janus-gateway-0.11.6      | NOK | http://autobuild.buildroot.net/results/8f909088906b3bb9f6b3a0dc3f21d4c6521d9374 |     
   mipsel    |            libuwsc             | TIM | http://autobuild.buildroot.net/results/750ca64679192946dc137237cd4e09b66dece792 |     
    arm      |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/26e9efb7be515cc7e467a57cf58a79fa4ab4f317 | ORPH


Classification of failures by reason for 2022.11.x
--------------------------------------------------

           janus-gateway-1.0.3 | 5 
                gerbera-1.10.0 | 1 
google-breakpad-c85eb4a59b6... | 1 
            host-binutils-2.38 | 1 
              host-pahole-1.24 | 1 
                ipmiutil-3.1.8 | 1 
               libglib2-2.72.3 | 1 
               libvorbis-1.3.7 | 1 
               mariadb-10.3.36 | 1 
                    mutt-2.2.9 | 1 
                 openssh-9.1p1 | 1 
                 proftpd-1.3.8 | 1 
                     pv-1.6.20 | 1 
                       unknown | 1 
                xenomai-3.0.10 | 1 
                  xxhash-0.8.1 | 1 


Detail of failures for 2022.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/65e77993f5f9eda19f92c99a6da34f2652914275 |     
   mipsel    | google-breakpad-c85eb4a59b6... | NOK | http://autobuild.buildroot.net/results/5d2238f2b586a6580c66bfe7d3ccfae026a17c87 |     
 powerpc64   |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/a1e8e36afded3d63796ef60b235ed04a6d398cb4 |     
  sparc64    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/4b60dcd170a4f8cf6b3fb9bcb7c2ad1e2c7f0357 |     
   x86_64    |         ipmiutil-3.1.8         | NOK | http://autobuild.buildroot.net/results/6761a25db610e61308e5020a82320c6d4d39a02c |     
 aarch64_be  |      janus-gateway-1.0.3       | NOK | http://autobuild.buildroot.net/results/b3fc4e884b861ee742a83484d78f6a61dc8d64da |     
 aarch64_be  |      janus-gateway-1.0.3       | NOK | http://autobuild.buildroot.net/results/53a5498f49fa1fa7f939a23d238c6220f6e32fac |     
   x86_64    |      janus-gateway-1.0.3       | NOK | http://autobuild.buildroot.net/results/d054ed4178e089e85e4305605aa1c2e0be85a501 |     
  sparc64    |      janus-gateway-1.0.3       | NOK | http://autobuild.buildroot.net/results/868c1eea7b1ccf599388b8ef42c49b6044ecf8db |     
   mips64    |      janus-gateway-1.0.3       | NOK | http://autobuild.buildroot.net/results/17a00303aa900deb3eeb3d6c5b6e5bac45f63034 |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/ffeee758cc9ad36ed05915eda2016b1201826bb6 |     
  powerpc    |        libvorbis-1.3.7         | NOK | http://autobuild.buildroot.net/results/807c94da984b9334a605cf064ccb7aad14080108 |     
   sparc     |        mariadb-10.3.36         | NOK | http://autobuild.buildroot.net/results/ed08125cfaf43a22d17aa460269ac7123444c848 | ORPH
    or1k     |           mutt-2.2.9           | NOK | http://autobuild.buildroot.net/results/e45feb1781eb044652086f6a668c89eb3701bde2 |     
    or1k     |         openssh-9.1p1          | NOK | http://autobuild.buildroot.net/results/2638d2db23a96cf624a58b23320ff7429cf9252b | ORPH
   sparc     |         proftpd-1.3.8          | NOK | http://autobuild.buildroot.net/results/a3309ec92a143ac96f46d70c0bc9bfa0235c4e03 |     
   armeb     |           pv-1.6.20            | NOK | http://autobuild.buildroot.net/results/14d3075a4d658c646cddea05042d157b82d76edf | ORPH
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/15d34c999cc8bb16d76fc71a38511d6ed645960f |     
    i686     |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/9f44186ba196ea94847f7af3e494c753df2de6d1 |     
 aarch64_be  |          xxhash-0.8.1          | NOK | http://autobuild.buildroot.net/results/034a4f715b257fce05850802a0dc9edc5dfd5c1d | ORPH



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
