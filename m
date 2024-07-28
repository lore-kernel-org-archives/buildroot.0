Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76F62C3DA64
	for <buildroot@archiver.kernel.org>; Sun, 28 Jul 2024 05:00:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7BF5C60778;
	Sun, 28 Jul 2024 05:00:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GjzHxkiMKrSr; Sun, 28 Jul 2024 05:00:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2146260785
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2146260785;
	Sun, 28 Jul 2024 05:00:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 540311BF352
 for <buildroot@lists.busybox.net>; Sun, 28 Jul 2024 05:00:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4AF974011D
 for <buildroot@lists.busybox.net>; Sun, 28 Jul 2024 05:00:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VWcuT3NfBICa for <buildroot@lists.busybox.net>;
 Sun, 28 Jul 2024 05:00:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::223;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 10713400C1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 10713400C1
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 10713400C1
 for <buildroot@buildroot.org>; Sun, 28 Jul 2024 05:00:07 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 88DA46000C
 for <buildroot@buildroot.org>; Sun, 28 Jul 2024 05:00:04 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sun, 28 Jul 2024 05:00:04 -0000
X-GND-Sasl: bot@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1722142804; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=iyfpLyJVL4jUN3cG64m2fTIY1FfI4kUxLfPtcpBAsl4=;
 b=K5iSCLE0bk1pCe9XoFrZipIB1QfgxYYpXJSHpLON0YpcLxEMlCNCOPV5Gfh4K8j+50cgSv
 RIFPiUhP9ohQQnPPaKxJ0rymaDWWrGuoXgY+f0UoWYX7zz95AKP/hNAyxFuUa0tBaXnI3O
 3QVRcGOpHi6yTZwwfBQIQAQFedEbFaVyCHeQ/FBqPZob47P5+jjlJlNrGJCC2lqusPGXfi
 IKfjZe4vN9t5/DFQL/ppsoXx8NBbKK4KM1+6XRBKnjfDqWHQycPEnIGUVVrcPjue48a5Ff
 1vQ4vpWXNfiMkN+R0nkCCnJxM4buBGOb0EcKv4qJ8d6tvMYW4RjxFNVrj8wQqw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=K5iSCLE0
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2024-07-27
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
Message-ID: <20240728050004.GZiW91718Uqm44TmutCuVCuiaKBGyk413HM3V0Ps3Hk@z>

Hello,

Autobuild statistics for 2024-07-27
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  3  |  7  |  0  | 10  |
  2024.05.x  |  4  |  9  |  0  | 13  |
    master   | 90  | 193 |  2  | 285 |

Classification of failures by reason for master
-----------------------------------------------

                  ffmpeg-6.1.1 | 8 
                systemd-254.13 | 8 
                    norm-1.5.8 | 6 
      python-autocommand-2.2.2 | 6 
  gobject-introspection-1.76.1 | 5 
host-heimdal-f4faaeaba371ff... | 5 
               procps-ng-4.0.4 | 5 
                gerbera-1.12.1 | 4 
host-vboot-utils-bbdd62f9b0... | 4 
                 openssh-9.8p1 | 4 
                       unknown | 4 
android-tools-4.2.2+git2013... | 3 
                     avahi-0.8 | 3 
                espflash-3.1.0 | 3 
              fluent-bit-3.1.3 | 3 
            gdk-pixbuf-2.42.10 | 3 
glibc-2.39-74-g198632a05f6c... | 3 
             gnuradio-3.10.7.0 | 3 
              host-rust-1.79.0 | 3 
           host-systemd-254.13 | 3 
                  libffi-3.4.6 | 3 
                libressl-3.8.4 | 3 
                  linux-6.10.1 | 3 
                  mender-3.4.0 | 3 
             parsec-tool-0.7.0 | 3 
aer-inject-9bd5e2c7886fca72... | 2 
                  bind-9.16.48 | 2 
                  bitcoin-26.2 | 2 
                 dc3dd-7.2.641 | 2 
                   foot-1.16.2 | 2 
                 gnuplot-6.0.1 | 2 
         gobject-introspection | 2 
 host-binutils-bare-metal-2.42 | 2 
         host-libxcrypt-4.4.36 | 2 
                host-odb-2.4.0 | 2 
               libglib2-2.76.1 | 2 
              libopenssl-3.3.1 | 2 
                  libva-2.22.0 | 2 
                libxml2-2.12.6 | 2 
               mariadb-10.11.6 | 2 
                     php-8.3.9 | 2 
         python-remi-2022.7.27 | 2 
                python3-3.12.4 | 2 
                   trinity-1.9 | 2 
                      xz-5.6.2 | 2 
                 apache-2.4.62 | 1 
                 avro-c-1.11.3 | 1 
                  bcusdk-0.0.5 | 1 
             berkeleydb-5.3.28 | 1 
                    brltty-6.6 | 1 
             cni-plugins-1.3.0 | 1 
                     crun-1.15 | 1 
cwiid-fadf11e89b579bcc0336a... | 1 
             dahdi-linux-3.3.0 | 1 
                elfutils-0.189 | 1 
                   eza-0.18.22 | 1 
                  fbterm-1.7.0 | 1 
               freeipmi-1.6.14 | 1 
                    gdal-3.8.2 | 1 
                gnu-efi-3.0.18 | 1 
               graphene-1.10.8 | 1 
       gst1-plugins-bad-1.22.9 | 1 
             gtkiostream-1.8.0 | 1 
              host-audit-3.1.2 | 1 
     host-moby-buildkit-0.11.6 | 1 
 host-softether-4.30-9700-beta | 1 
        host-util-linux-2.39.3 | 1 
                    htop-3.3.0 | 1 
                   httping-2.5 | 1 
                       kmod-31 | 1 
                 lapack-3.10.1 | 1 
                libcuefile-475 | 1 
libest-f8a6e5b53a5f70e72fe4... | 1 
                libglvnd-1.4.0 | 1 
             libgpg-error-1.49 | 1 
                libmpeg2-0.5.1 | 1 
                libnss-3.102.1 | 1 
                librsvg-2.50.9 | 1 
   libtorrent-rasterbar-1.2.19 | 1 
                 libwpe-1.16.0 | 1 
          linux-5.10.162-cip24 | 1 
               linux-pam-1.6.1 | 1 
                   ltris-1.3.2 | 1 
                    mpv-0.35.1 | 1 
                  ntp-4.2.8p18 | 1 
                  octave-9.2.0 | 1 
                   pcre2-10.43 | 1 
                 pixman-0.42.2 | 1 
    python-cryptography-39.0.2 | 1 
           python-numpy-1.25.0 | 1 
  python-pypika-tortoise-0.1.6 | 1 
                    rtty-8.1.0 | 1 
                s6-dns-2.3.7.2 | 1 
                softhsm2-2.6.1 | 1 
             stress-ng-0.17.07 | 1 
             strongswan-5.9.13 | 1 
                tpm2-tss-3.2.2 | 1 
                 uclibc-1.0.49 | 1 
               zxing-cpp-2.2.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mips64    | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/0f66b2e8030ebf69724eddebc2dd5154b2c5fc0e | ORPH
    mips     | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/f5570067a70b77426935b263656450ab5ff29753 | ORPH
   mips64    | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/71d129100227289131e4bdb425291bdca01615dc |     
    arm      | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/86688901b58e6db1f0ad5264c0732f1d8af26765 |     
    sh4      | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/b42e64818c73b383b92684937e861a5170429e7a |     
    m68k     |         apache-2.4.62          | NOK | http://autobuild.buildroot.net/results/2e303bd22a702def9e7a1edce023e5de4f2eb9ae |     
    mips     |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/81d38b9eeba27cf82a83cd98ff7242226d4fec05 | ORPH
  aarch64    |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/9676402ae23bbf5812912e7c462ea413b8c8570b | ORPH
   x86_64    |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/be0943211f14212649c42ba8aa37b6669fc7b041 | ORPH
   mips64    |         avro-c-1.11.3          | NOK | http://autobuild.buildroot.net/results/894a401565d3e3a28baf13dbd838988e5c7d0985 |     
   xtensa    |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/1d390db9a492e979111e7621a0c5fca9ea79cc00 |     
    sh4      |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/6f31c2d49f9e331bc8d8700f9f2fb1bdfbbbfa24 | ORPH
   mipsel    |          bind-9.16.48          | NOK | http://autobuild.buildroot.net/results/2de07f7ca7c5d219302b42c6fad428d624f03b86 | ORPH
   x86_64    |          bind-9.16.48          | NOK | http://autobuild.buildroot.net/results/20c0fe04ae602210af8144dc4caa3c234b82f0d3 | ORPH
    m68k     |          bitcoin-26.2          | NOK | http://autobuild.buildroot.net/results/3a183d4e204c9e01f9a9c2525d6176e653e0c289 |     
    m68k     |          bitcoin-26.2          | NOK | http://autobuild.buildroot.net/results/056adf0c74a9bf90e4b3fced24886b762b5a7121 |     
   mipsel    |           brltty-6.6           | NOK | http://autobuild.buildroot.net/results/3690273c3855d9505bd58801efcc69479d084527 |     
  riscv64    |       cni-plugins-1.3.0        | NOK | http://autobuild.buildroot.net/results/a814a5d7507c7a4e359a88eaf3820a96a678073a |     
  mips64el   |           crun-1.15            | NOK | http://autobuild.buildroot.net/results/f1c18b3369b1f1c66e71bcad696a3061ebe557de |     
   sh4aeb    | cwiid-fadf11e89b579bcc0336a... | NOK | http://autobuild.buildroot.net/results/e0d081729189e1ae126dd88d26e5d764b8e7e7ff |     
   s390x     |       dahdi-linux-3.3.0        | NOK | http://autobuild.buildroot.net/results/cc34a2b2e8d07b9b2007f118befae6539c6d3540 |     
    or1k     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/a53326400127135e0b3ae2c5970d8d5cc031d1fa | ORPH
 microblaze  |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/0b3f92cf1461ae2f77b2d30d8fa4d9b41e321d4a | ORPH
   arceb     |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/79f94aefbab9ccc7cb2453acab8b99e621f0ed23 | ORPH
  sparc64    |         espflash-3.1.0         | NOK | http://autobuild.buildroot.net/results/e7a69f2fd4aea8264c1bb7853a90a87fdb090502 |     
   s390x     |         espflash-3.1.0         | NOK | http://autobuild.buildroot.net/results/e2ec81a82823131c3b95593bc1a164b359ad3f12 |     
  aarch64    |         espflash-3.1.0         | NOK | http://autobuild.buildroot.net/results/88df0cbeb6f6ec392cc216124fd2c4281eb9286b |     
   armeb     |          eza-0.18.22           | NOK | http://autobuild.buildroot.net/results/c45a57d23cc8f53a5efe0166168553d54993bd56 |     
  mips64el   |          fbterm-1.7.0          | NOK | http://autobuild.buildroot.net/results/90efd09a972c0a40895f089b69352bc43170e5f0 | ORPH
   s390x     |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/15fe09dc69036b83f4cb37d7f4ba0c382c0e9b3b |     
 microblaze  |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/682d07b507e0bab7dda6e18cd8914ea68ba88469 |     
 microblaze  |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/a3fa752cbd035b2aa198b4f602965b16a589316f |     
    arc      |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/3d100e97698ba6cfa0806c2f37c7c86728edbf08 |     
 microblaze  |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/45a9ff7decef134040e0a512cee3bb61a3a16ce7 |     
    arc      |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/ebdbafa387dc0dcd6f3c9163360ed34399023d45 |     
microblazeel |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/71b625784f517dfaf13f099432465f42f0706a20 |     
microblazeel |          ffmpeg-6.1.1          | NOK | http://autobuild.buildroot.net/results/df6243720d572a15144f3e662349a5c0c4938187 |     
  powerpc    |        fluent-bit-3.1.3        | NOK | http://autobuild.buildroot.net/results/376ab022dcbbc519438d22d5953b6913ef33ff90 |     
  powerpc    |        fluent-bit-3.1.3        | NOK | http://autobuild.buildroot.net/results/b8efc9fd50c791ff118ac9b432daaf2bbea981ed |     
   mipsel    |        fluent-bit-3.1.3        | NOK | http://autobuild.buildroot.net/results/4aea330996f55ee23561a33f907536a46644349a |     
   armeb     |          foot-1.16.2           | NOK | http://autobuild.buildroot.net/results/be4f6dfde94ab4878480425eca35d6f078efd389 |     
   nios2     |          foot-1.16.2           | NOK | http://autobuild.buildroot.net/results/a208203e9f0567a37b3224285dbdcf121d69913f |     
   nios2     |        freeipmi-1.6.14         | NOK | http://autobuild.buildroot.net/results/64393f7b34ae9614e42f1713526d73cffdccb5fa |     
    sh4      |           gdal-3.8.2           | NOK | http://autobuild.buildroot.net/results/607988f9c3f5e2dc95a8544c5d89d1ea7ac37d8c |     
    mips     |       gdk-pixbuf-2.42.10       | NOK | http://autobuild.buildroot.net/results/a1369c430e18973f1cb212a887ffb7c586e718f5 | ORPH
  mips64el   |       gdk-pixbuf-2.42.10       | NOK | http://autobuild.buildroot.net/results/5a6bc3db802fa25d3a972820262f1628a2d5e2f5 | ORPH
microblazeel |       gdk-pixbuf-2.42.10       | NOK | http://autobuild.buildroot.net/results/9487e4a45f07b591c668461695ea89cf2bf802de | ORPH
   x86_64    |         gerbera-1.12.1         | NOK | http://autobuild.buildroot.net/results/ada30ac9fdbfebbafab0b242361519fd2f3ad8f5 |     
   sparc     |         gerbera-1.12.1         | NOK | http://autobuild.buildroot.net/results/ec80976de4e34e89010800ef33613efabdcf28df |     
  sparc64    |         gerbera-1.12.1         | NOK | http://autobuild.buildroot.net/results/d8c4e65ab4ad7740cb4d745a7cbcfe99cdcc2564 |     
    or1k     |         gerbera-1.12.1         | NOK | http://autobuild.buildroot.net/results/672d3e86a881c80078626b09d1d6530d4c9a9587 |     
  powerpc    | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/c76396f52667680e43ab1408628fcdd20df9b537 |     
 powerpc64   | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/96da640e83b877b61a02d63298ad48addaa18b9d |     
 powerpc64   | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/2970d40fec6e19263b748055b2f601ab3f4263cd |     
    i586     |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/e3dec7e0323a3fcb07269b3f9e73becaafeedecd |     
 microblaze  |         gnuplot-6.0.1          | NOK | http://autobuild.buildroot.net/results/08618af467921564f58af558c2c2a7940736e7bd |     
microblazeel |         gnuplot-6.0.1          | NOK | http://autobuild.buildroot.net/results/9f0c9885f6edccfb7d1abd779fa7ff7abd63aee2 |     
    m68k     |       gnuradio-3.10.7.0        | NOK | http://autobuild.buildroot.net/results/7eae5012ce3af328e991bb2b1cabb5a077f0ffae |     
powerpc64le  |       gnuradio-3.10.7.0        | NOK | http://autobuild.buildroot.net/results/4f919ac16bd53b50cb47c6861cc899ac9f703e84 |     
   x86_64    |       gnuradio-3.10.7.0        | NOK | http://autobuild.buildroot.net/results/529cde15aa9d69dc72953eaa03ac2b5dde4dbaa7 |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/30d22a06ccc67075719ab3186692f945f8856eba |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/0feefa07fa13f26bef5088c9442e0372e728d9ee |     
   x86_64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/eafd6c4dcdcca7c6404bbb64be38822cdfa25d9d | ORPH
    m68k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/6b067971209888df7ed16f83091a1502ef6f4811 | ORPH
    m68k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/8e67e6c8ece98d12ffd7b65c8677cd6e20233ba2 | ORPH
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/0ec7086369db70949cdaf7cd3977802cf36f6225 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/b7d7e2b247377ad00649422e9bc17515682908d4 | ORPH
   arceb     |        graphene-1.10.8         | NOK | http://autobuild.buildroot.net/results/885d9bd765c8fa8c8100c0f8aefcbf60492dcb37 |     
powerpc64le  |    gst1-plugins-bad-1.22.9     | NOK | http://autobuild.buildroot.net/results/84717fd7fe2757d3bd64f6e0de6f16bb0fed0da3 | ORPH
   sparc     |       gtkiostream-1.8.0        | NOK | http://autobuild.buildroot.net/results/a2bcacad41179f5d70aa3c94b223b7c964dc4ccb |     
    or1k     |        host-audit-3.1.2        | NOK | http://autobuild.buildroot.net/results/aa8bfe66ce957265906442903436e249b7f8121d |     
 aarch64_be  | host-binutils-bare-metal-2.42  | NOK | http://autobuild.buildroot.net/results/8cbe18b604e9f34562823efd9f2ea4568aa48932 |     
  mips64el   | host-binutils-bare-metal-2.42  | NOK | http://autobuild.buildroot.net/results/0c40e9dcabe233e666ecb18bc3070df0fe6acc2f |     
   s390x     | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/ff7bb51712a1a8966bb54b3d69ecf41d949b3920 | ORPH
powerpc64le  | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/c712087fa746581a83973ed5849e65f5c8d08114 | ORPH
   s390x     | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/80504bc4bb197f8d90157e0dff5e99e4f17ce66b | ORPH
    arc      | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/c1929e71bb4549be8d16ea8a61f4f8c15980612a | ORPH
microblazeel | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/16d3aa0789e434892edb9ff9fb52ff0ee38672d7 | ORPH
 powerpc64   |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.net/results/b69f21b5fc13ab329a708f677799edbd83aca5cb |     
    arm      |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.net/results/217e563814b2f4a696fcbb941a0880850d302f87 |     
   mips64    |   host-moby-buildkit-0.11.6    | NOK | http://autobuild.buildroot.net/results/e09720875a82f85b502891d0eb5301171d438c32 |     
   armeb     |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/de3e7bfcb555da7c38a07afb6789e9bfbfbc4b5e | ORPH
   mips64    |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/50afa79c8a33d6cf7674530ed1c9a657d54df764 | ORPH
    arm      |        host-rust-1.79.0        | NOK | http://autobuild.buildroot.net/results/1b9329a45d1e130e88d0dda6b0450a692289087a |     
   armeb     |        host-rust-1.79.0        | NOK | http://autobuild.buildroot.net/results/c491420e7f0937573c13624477d500c1c7e9a987 |     
powerpc64le  |        host-rust-1.79.0        | NOK | http://autobuild.buildroot.net/results/7ea04b27fc748651cec41cda52048d0133b45b95 |     
   nios2     | host-softether-4.30-9700-beta  | NOK | http://autobuild.buildroot.net/results/700b2f1a93035d4d4b1ba1ee43c01f62f47ca847 | ORPH
   sparc     |      host-systemd-254.13       | NOK | http://autobuild.buildroot.net/results/d8c1c1e29bbedbac2ec0bcba848b1b036fa6a17c |     
   mipsel    |      host-systemd-254.13       | NOK | http://autobuild.buildroot.net/results/5b26e85f1e40186bbfd3d6445aff1599259a3447 |     
   x86_64    |      host-systemd-254.13       | NOK | http://autobuild.buildroot.net/results/c25dff868ad8d2b0355cfc7fd5321adac4d57aea |     
powerpc64le  |     host-util-linux-2.39.3     | NOK | http://autobuild.buildroot.net/results/7c1178341035dd635298bd32e3a1e05f9a624690 | ORPH
microblazeel | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/6b63399e092a2932250aea23428583873913462a |     
 powerpc64   | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/2b5427bae591b57fdd040bba19fbc4271b196530 |     
   arceb     | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/1240cfeb52e0670f579fc90ae8d3b4114b95a931 |     
microblazeel | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/f461a6b1946a1099ca654a791d39b9d95a9a900c |     
 powerpc64   |           htop-3.3.0           | NOK | http://autobuild.buildroot.net/results/7a358e33606ffabaf61af71f94eedfa03a079ad0 | ORPH
 aarch64_be  |          httping-2.5           | NOK | http://autobuild.buildroot.net/results/5e7addbae8755682c6e288dc227db35b2e76b86e |     
  mips64el   |            kmod-31             | NOK | http://autobuild.buildroot.net/results/580bb8de864d7045f2b53d8f177d8b9082ae7379 |     
    sh4      |         lapack-3.10.1          | NOK | http://autobuild.buildroot.net/results/7fe8e8e1290d532ae136a65d0e36834eea355da4 |     
  mips64el   |         libcuefile-475         | NOK | http://autobuild.buildroot.net/results/701db2eeef438a2197740530553593c6651e0d55 | ORPH
   sh4aeb    | libest-f8a6e5b53a5f70e72fe4... | NOK | http://autobuild.buildroot.net/results/60fbd9c4648af9d510635554547e64c8432bfea1 |     
    or1k     |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/5e93e54f1dbf2404acc5a08a71ad6f5d94a69c0f |     
    or1k     |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/7649954260f65e7c59a5526b3838137feb08f648 |     
   arceb     |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/f28b606d01daa2064466f0e12e7608fb7376a659 |     
    arc      |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/6746803ffd22ef579e7adad4bbd3a17fa37796e7 |     
   arceb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/8b67a1d9df0caa56c14c7ea9978144b698c91e55 |     
   xtensa    |         libglvnd-1.4.0         | NOK | http://autobuild.buildroot.net/results/5af5664da83e3974e88e5bca65dd56d903cbfe11 | ORPH
  riscv64    |       libgpg-error-1.49        | NOK | http://autobuild.buildroot.net/results/074a803de0f48cd86b9135cca50f136cccf1bcea | ORPH
    arm      |         libmpeg2-0.5.1         | NOK | http://autobuild.buildroot.net/results/bbba4722906a7aa7dcf3795f7819436811f96d29 | ORPH
 aarch64_be  |         libnss-3.102.1         | NOK | http://autobuild.buildroot.net/results/69f6f772efbf2c9ed5c691e38f5111214572bce5 |     
microblazeel |        libopenssl-3.3.1        | NOK | http://autobuild.buildroot.net/results/95c3402a5acc42e0d3a765c8a1ca871720e79ba5 | ORPH
 microblaze  |        libopenssl-3.3.1        | NOK | http://autobuild.buildroot.net/results/7abb1b41167ab17823be1ea50c971d1012fdcc4f | ORPH
  mips64el   |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/1b1257a25f0bd723eada845f8378d3bd252d78a6 | ORPH
   mips64    |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/c520e00b4ca1218c7dc45e69ba90bb1e4b03ef08 | ORPH
  powerpc    |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/219f5a42798a0c298ad2859d3f1fd1f61f0dbc14 | ORPH
  aarch64    |         librsvg-2.50.9         | NOK | http://autobuild.buildroot.net/results/e16dea6f59f1a3d002d993578f2598bd44c21c92 |     
    arm      |  libtorrent-rasterbar-1.2.19   | NOK | http://autobuild.buildroot.net/results/d2def22a7d6b5f3a2eea383629651b338c7c9b5f |     
   mipsel    |          libva-2.22.0          | NOK | http://autobuild.buildroot.net/results/c0efb69bc77e42956c8e865966c104482507480b |     
 aarch64_be  |          libva-2.22.0          | NOK | http://autobuild.buildroot.net/results/267d3a88295ee70753d8877e4eae9dc94d243b33 |     
  mips64el   |         libwpe-1.16.0          | NOK | http://autobuild.buildroot.net/results/93bdaf1f6e4da5a395fb6cf2148d114df0eb14bd |     
   mips64    |         libxml2-2.12.6         | NOK | http://autobuild.buildroot.net/results/5d46e8b4e204fbd5a7663c40fa8239598a8c5c31 |     
  mips64el   |         libxml2-2.12.6         | NOK | http://autobuild.buildroot.net/results/e19e90b2d67c22828ecf95ff93d051bf669cee77 |     
    i686     |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/9f2931c0b7a81d9d87773909ff3b7795eb4bf1d9 | ORPH
    mips     |          linux-6.10.1          | NOK | http://autobuild.buildroot.net/results/695808096a1561b5549452a4fe4a0b3c5161a800 | ORPH
  mips64el   |          linux-6.10.1          | NOK | http://autobuild.buildroot.net/results/c2ee2875a98c68cb1c335f380f4eeda68c6a2c2c | ORPH
   armeb     |          linux-6.10.1          | NOK | http://autobuild.buildroot.net/results/afda32b24c992ca5490e8d49764526b3d0c3db53 | ORPH
 microblaze  |        linux-pam-1.6.1         | NOK | http://autobuild.buildroot.net/results/ac57ab9bb11de0c2486bf266906b6fa0d85cad0f | ORPH
   xtensa    |          ltris-1.3.2           | NOK | http://autobuild.buildroot.net/results/04424f6adce72970581e9bc86703e14f79117724 |     
powerpc64le  |        mariadb-10.11.6         | NOK | http://autobuild.buildroot.net/results/73aa0b7f9ccc1594f329e6079d337046fd791ab9 | ORPH
microblazeel |        mariadb-10.11.6         | NOK | http://autobuild.buildroot.net/results/ed679b570f4db7dc5aede542f1ba9d64f597c337 | ORPH
  riscv64    |          mender-3.4.0          | NOK | http://autobuild.buildroot.net/results/fadce1b3fd0b6ef5719517b905684cf3d09b05ca |     
powerpc64le  |          mender-3.4.0          | NOK | http://autobuild.buildroot.net/results/4bcb5e2f22af2318bb86f806f5c90fed37625da1 |     
   x86_64    |          mender-3.4.0          | NOK | http://autobuild.buildroot.net/results/b0617e82434e60d4962497affb0450b064312554 |     
 powerpc64   |           mpv-0.35.1           | NOK | http://autobuild.buildroot.net/results/fdfe86598e1beef01c601b2fb6ae49a51c4e5a66 |     
    arm      |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/5b22aaf96280ce86037465762ad705d1df3400dd | ORPH
  aarch64    |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/8a061a2b114d2306f4406bb50dba5be430336008 | ORPH
    arm      |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/b8ccd5dc12c5488b6448c8746591ab504725422d | ORPH
 aarch64_be  |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/5593880df1514e4e416f35611a22a13c95311250 | ORPH
    m68k     |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/69389cf0a996694c997daa6ef2a30efb44c05886 | ORPH
    sh4      |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/7837092d2a77ff39932cd05fcd552c7e8a46b4f9 | ORPH
   sparc     |          ntp-4.2.8p18          | NOK | http://autobuild.buildroot.net/results/90269161df02860dc8520774fe87919ca3345677 |     
powerpc64le  |          octave-9.2.0          | NOK | http://autobuild.buildroot.net/results/2732d6f85f2b81a7691f51c5ce5fa105ca229ff8 |     
   mips64    |         openssh-9.8p1          | NOK | http://autobuild.buildroot.net/results/68d3cddaf21d696f4412a5483ae1e6f8db07237d | ORPH
powerpc64le  |         openssh-9.8p1          | NOK | http://autobuild.buildroot.net/results/6e117bdc157d8cd81b89cfcf0b38f0ef4fa47182 | ORPH
  mips64el   |         openssh-9.8p1          | NOK | http://autobuild.buildroot.net/results/0aaeff1f5a1a6b73c0127ad2c14546af26c77e64 | ORPH
   mips64    |         openssh-9.8p1          | NOK | http://autobuild.buildroot.net/results/cb868f79e9d4196df0a2eeb82fd04aeca32ee2ac | ORPH
 powerpc64   |       parsec-tool-0.7.0        | NOK | http://autobuild.buildroot.net/results/6131137d1e7ea1b45f4ac64b0688dfbc79a7fce0 |     
powerpc64le  |       parsec-tool-0.7.0        | NOK | http://autobuild.buildroot.net/results/e4ca3c6f5fa7418c78aed5de7a60eb71419560ff |     
  sparc64    |       parsec-tool-0.7.0        | NOK | http://autobuild.buildroot.net/results/89b3a3219114ebb820530102bb43918c010c292c |     
    mips     |          pcre2-10.43           | NOK | http://autobuild.buildroot.net/results/9ea04b78c3d637b8efdb77cf769cf55bd030cd22 | ORPH
   armeb     |           php-8.3.9            | NOK | http://autobuild.buildroot.net/results/e82cd250a693532c27e88f4f026525b5f4ec037d |     
   sh4eb     |           php-8.3.9            | NOK | http://autobuild.buildroot.net/results/f9a00709744de95920788c152b1459efba2a64a4 |     
   s390x     |         pixman-0.42.2          | NOK | http://autobuild.buildroot.net/results/1088e2fbf17c58405a205cb8a877440712f5ba78 | ORPH
    m68k     |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.net/results/8d943891cf84f7987719f6136d37c2001658d5f7 | ORPH
   nios2     |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.net/results/8a4fb9c69f244c97f3e7e0546a35439e1afdb662 | ORPH
 aarch64_be  |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.net/results/ec9e4262dc27256d7172d2a6742c4b30868b45ae | ORPH
   nios2     |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.net/results/a2a5cd960b62d441b1ff71803ef2ebf262cea568 | ORPH
microblazeel |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.net/results/75eec188fbd036abaeac2f3b86b992bccee1ae05 | ORPH
   nios2     |    python-autocommand-2.2.2    | NOK | http://autobuild.buildroot.net/results/0d08e35fa062672724aa8f21b5600b3287c2dbc0 |     
    arm      |    python-autocommand-2.2.2    | NOK | http://autobuild.buildroot.net/results/b0f85332839b283af171b1f45ac3bc21fc12cf9c |     
 aarch64_be  |    python-autocommand-2.2.2    | NOK | http://autobuild.buildroot.net/results/d1f05b9af6656af5ebc211cd95233982a29049d8 |     
    or1k     |    python-autocommand-2.2.2    | NOK | http://autobuild.buildroot.net/results/e9d30cda6a52187d02ef93f30316d602adc48a59 |     
    i686     |    python-autocommand-2.2.2    | NOK | http://autobuild.buildroot.net/results/8c814233d07661a6a5e9c8a58257df6462702577 |     
   s390x     |    python-autocommand-2.2.2    | NOK | http://autobuild.buildroot.net/results/28a9d377f51f6cbb2025026db0b94c199162f2ba |     
   x86_64    |   python-cryptography-39.0.2   | NOK | http://autobuild.buildroot.net/results/7c8e7be226cb5734e0d0bd39d63951dc029f32a1 |     
 powerpc64   |      python-numpy-1.25.0       | NOK | http://autobuild.buildroot.net/results/674c12285c9349478820f8b50be3fc9c7bc75c7a |     
 powerpc64   |  python-pypika-tortoise-0.1.6  | NOK | http://autobuild.buildroot.net/results/b0b051f463af56d806de1703da8521c1c1adb54a |     
powerpc64le  |     python-remi-2022.7.27      | NOK | http://autobuild.buildroot.net/results/10c2fbe7c589c8774f9eec4e2af39fa76388aafe |     
   armeb     |     python-remi-2022.7.27      | NOK | http://autobuild.buildroot.net/results/ab7f6eb5509fd93eb476983eb98055ad71d6e77e |     
  mips64el   |         python3-3.12.4         | NOK | http://autobuild.buildroot.net/results/9a5eefadea87833a3bd7b6c5a903bda7028c769c |     
   mips64    |         python3-3.12.4         | NOK | http://autobuild.buildroot.net/results/adb98629d2ca9052c2c100cbf60282678cfac9cb |     
 microblaze  |           rtty-8.1.0           | NOK | http://autobuild.buildroot.net/results/599d50424ec483d649ca64e83ac8eaaa96a7fe3f |     
   xtensa    |         s6-dns-2.3.7.2         | NOK | http://autobuild.buildroot.net/results/ce521f233040ac2c0b0a187db5c4cc22665a1b6c |     
    arm      |         softhsm2-2.6.1         | NOK | http://autobuild.buildroot.net/results/5b98996bf2145f352502e6b397603e09b21229e6 | ORPH
 aarch64_be  |       stress-ng-0.17.07        | NOK | http://autobuild.buildroot.net/results/a87c2b00fae0c117166ca890f203d155a75c7815 |     
powerpc64le  |       strongswan-5.9.13        | NOK | http://autobuild.buildroot.net/results/6e8afcf9c704ac07853411d103d2c5f453cd4c77 |     
 powerpc64   |         systemd-254.13         | NOK | http://autobuild.buildroot.net/results/f41d484e406a344f4963d763c9a1b9cbc4136e1d |     
   nios2     |         systemd-254.13         | NOK | http://autobuild.buildroot.net/results/d80e39ffc5aefc4377050e4aa71c13cf3acc57bf |     
  sparc64    |         systemd-254.13         | NOK | http://autobuild.buildroot.net/results/1be602966f95bc2f12d8b0efd121e06051aca906 |     
    i686     |         systemd-254.13         | NOK | http://autobuild.buildroot.net/results/845736a2628edacfeacf74966f00f8e0b174cf75 |     
   mipsel    |         systemd-254.13         | NOK | http://autobuild.buildroot.net/results/3a78921e9d4d9c0095ac00c39e78ef81e2743883 |     
  aarch64    |         systemd-254.13         | NOK | http://autobuild.buildroot.net/results/81ffd70417d4bf83e4ef8dee9c9c4a743fa08754 |     
    m68k     |         systemd-254.13         | NOK | http://autobuild.buildroot.net/results/225fbb178f77be330e231c20064632d46b5fef03 |     
   armeb     |         systemd-254.13         | NOK | http://autobuild.buildroot.net/results/d9aae4513be22deed897b6dc498e63d1e1a1863e |     
   x86_64    |         tpm2-tss-3.2.2         | NOK | http://autobuild.buildroot.net/results/a2e12aef371f333d526cf639a2ae83c584d88ea3 | ORPH
    mips     |          trinity-1.9           | NOK | http://autobuild.buildroot.net/results/f28c0a9e90e07b59672091d9c2165fe3d712de8f | ORPH
  powerpc    |          trinity-1.9           | NOK | http://autobuild.buildroot.net/results/c471a6a23af95dbd4f416f6f35ee930ee7099269 | ORPH
    arc      |         uclibc-1.0.49          | NOK | http://autobuild.buildroot.net/results/c1327fb4ddbd0e8463fbfdc94cb816d673fc5ff1 |     
   arceb     |            unknown             | NOK | http://autobuild.buildroot.net/results/beabf53e2996ac13cb8ea00e56ef6e8f5ee897e0 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/3f0f40baa3a8c1443259d7b56a27f53a4df4e731 |     
    i686     |            unknown             | NOK | http://autobuild.buildroot.net/results/98c4ef7283a9b27acad50a1bbb2df2cdcd523394 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/f71da988732d31d6719248c1db1f198ee7254073 |     
   sparc     |            xz-5.6.2            | NOK | http://autobuild.buildroot.net/results/0e4f7c9235c08dee97f9a210159a6e861fb41e90 | ORPH
  powerpc    |            xz-5.6.2            | NOK | http://autobuild.buildroot.net/results/68c1c2837c11d5568e93792ab92b548de8fb1ca2 | ORPH
  sparc64    |        zxing-cpp-2.2.1         | NOK | http://autobuild.buildroot.net/results/02bd48b9e10d91cccb70c81634baa7a0a189a8a3 |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

                 host-tar-1.34 | 2 
                elfutils-0.189 | 1 
host-heimdal-f4faaeaba371ff... | 1 
                  ntpsec-1.2.3 | 1 
                systemd-254.13 | 1 
                       unknown | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/092e52fcfa16cb61a37b8c574564c03d5c6853db | ORPH
   s390x     | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/0b25198d4e6e9fcc3b3d1df72fd81a18176216d6 | ORPH
  sparc64    |         host-tar-1.34          | NOK | http://autobuild.buildroot.net/results/46744621e56a9f1c46ddc0c697ec2e5ebb082cb4 | ORPH
    m68k     |         host-tar-1.34          | NOK | http://autobuild.buildroot.net/results/ef1b668dcdd964175522e82e29b9095f0ff7a209 | ORPH
   xtensa    |          ntpsec-1.2.3          | NOK | http://autobuild.buildroot.net/results/9321a637f2c340ce8dcb24249676bb6c44d0dfc6 | ORPH
    i686     |         systemd-254.13         | NOK | http://autobuild.buildroot.net/results/f1d6818fd5a25947ba60f372ca7e369a3c9d2593 |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/e191674896562f548d76ec85fa9a3679325d23a4 |     


Classification of failures by reason for 2024.05.x
--------------------------------------------------

  gobject-introspection-1.76.1 | 2 
              cache-calibrator | 1 
                   foot-1.16.2 | 1 
 host-binutils-bare-metal-2.42 | 1 
ibm-sw-tpm2-5452af422edeff7... | 1 
     toolchain-external-custom | 1 
                       unknown | 1 
                    xen-4.14.6 | 1 


Detail of failures for 2024.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   nios2     |        cache-calibrator        | NOK | http://autobuild.buildroot.net/results/c75e6260e0f434a690a2b8b2b630f5967ec2427f |     
   nios2     |          foot-1.16.2           | NOK | http://autobuild.buildroot.net/results/2531109c1f0566fda17b4c65b3a9224ae6b6dfdf |     
   sh4eb     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/c3deca1be33c78fec6e6da2dbe5d346dc184e0a3 | ORPH
   sh4eb     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/f0ed88f646a58147bfc96be163e663b56c68b97e | ORPH
    or1k     | host-binutils-bare-metal-2.42  | NOK | http://autobuild.buildroot.net/results/09ac40d9b7620e54bd061f40c4a48b318e65c049 |     
  mips64el   | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/c0dd6d76daed6cd512df8ebe83ef0a44466fc52c |     
  powerpc    |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/f8e29c3d829bd80583cc1b8e6a55407840b161fe |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/38d6eaa106a6c4a38e5704698adc612f6287ff87 |     
    arm      |           xen-4.14.6           | NOK | http://autobuild.buildroot.net/results/bf909f9b5c9d23fb30f2b1ba334aaf36dcb24d10 |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
