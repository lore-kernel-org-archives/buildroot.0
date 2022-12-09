Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C676DC4332F
	for <buildroot@archiver.kernel.org>; Fri,  9 Dec 2022 07:25:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 174EE60670;
	Fri,  9 Dec 2022 07:25:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 174EE60670
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id joVrMaNUY7fs; Fri,  9 Dec 2022 07:25:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D812760AAE;
	Fri,  9 Dec 2022 07:25:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D812760AAE
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 784AA1BF3C4
 for <buildroot@lists.busybox.net>; Fri,  9 Dec 2022 07:25:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 527FF81ABA
 for <buildroot@lists.busybox.net>; Fri,  9 Dec 2022 07:25:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 527FF81ABA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Owx2kRVMQOyM for <buildroot@lists.busybox.net>;
 Fri,  9 Dec 2022 07:25:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1FD5981A92
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1FD5981A92
 for <buildroot@buildroot.org>; Fri,  9 Dec 2022 07:25:21 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 2DBF2240008
 for <buildroot@buildroot.org>; Fri,  9 Dec 2022 07:25:19 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Fri, 09 Dec 2022 07:25:19 -0000
Message-Id: <20221209072525.527FF81ABA@smtp1.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1670570719; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=YRsQWrrJ5mBjVXzWPtQzlzrqSjwB6HnbEFGhKPK8y8I=;
 b=GA2+SXkYlxJkzKGpVdjHnud9IY9EvhcUYjKZloQBshBRN1iUJ5I4ykNF4D595Ngo2Z3zmO
 8DnV9dh0fqFmRWoxVrXTs+H6InhoxLmBLAcBkGOAyeVLYwvJfljUyrmqeEUMrLkS8F0JQz
 hc95l9cL92X8AqyXN0Faq/qwGPWgsiu9ItOrNn+UwviQUYhrEyzTWMYJZykegl90CY4DVR
 Jx0SJ8Huq4t3fC533TAPu0IAd2qA8m82f+J2ToggXSszpBQ4USl185i3j38bgmb/pq7kDg
 rt+tFBbHu7H9BuKs8l8sKq4rZpbWQuvyBfC+uYUfWNggG8Khjd+DMmAbZmsFOw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=GA2+SXkY
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-12-08
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

Autobuild statistics for 2022-12-08
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  |  7  |  2  |  0  |  9  |
  2022.08.x  | 17  | 13  |  0  | 30  |
    master   | 215 | 280 |  2  | 497 |

Classification of failures by reason for master
-----------------------------------------------

                   aubio-0.4.9 | 22
glibc-2.36-66-ga1dc0be03c9d... | 14
                host-go-1.19.3 | 11
                  sscep-0.10.0 | 11
                      xz-5.2.7 | 11
                    norm-1.5.8 | 10
                  jack2-1.9.21 | 9 
            host-binutils-2.38 | 8 
                   linux-6.0.9 | 8 
              libgcrypt-1.10.1 | 7 
               libglib2-2.72.3 | 7 
  gobject-introspection-1.72.0 | 6 
    host-python-greenlet-2.0.0 | 6 
              host-pahole-1.24 | 5 
            python-bunch-1.0.1 | 5 
                       unknown | 5 
                elfutils-0.186 | 4 
             libgpg-error-1.45 | 4 
                     efivar-38 | 3 
                libkcapi-1.4.0 | 3 
      linux-5.10.145-cip17-rt7 | 3 
             lirc-tools-0.10.2 | 3 
        ltp-testsuite-20220930 | 3 
           python-numpy-1.23.4 | 3 
           python-pyicu-2.10.2 | 3 
/home/buildroot/autobuild/i... | 2 
                bpftool-v7.0.0 | 2 
                 dc3dd-7.2.641 | 2 
                gerbera-1.10.0 | 2 
              host-rust-1.65.0 | 2 
         host-sentry-cli-2.8.0 | 2 
kvmtool-f77d646ba01d04be5aa... | 2 
                  lcms2-2.13.1 | 2 
         mxs-bootlets-10.12.01 | 2 
                  ntp-4.2.8p15 | 2 
                   perl-5.34.1 | 2 
         python-greenlet-2.0.0 | 2 
rtl8192eu-1e15b6d451731bc4d... | 2 
                    sdl-1.2.15 | 2 
                 wavemon-0.9.4 | 2 
                  xvisor-0.3.1 | 2 
/home/buildroot/autobuild/i... | 1 
android-tools-4.2.2+git2013... | 1 
              asterisk-16.28.0 | 1 
bayer2rgb-neon-15feb1115b48... | 1 
                  boost-1.80.0 | 1 
             dahdi-linux-3.2.0 | 1 
                 dash-0.5.11.5 | 1 
                 ddrescue-1.26 | 1 
                 dmalloc-5.6.5 | 1 
                    dust-0.8.1 | 1 
        edk2-edk2-stable202208 | 1 
               fftw-quad-3.3.8 | 1 
                     file-5.43 | 1 
       freeradius-server-3.2.0 | 1 
                     frr-8.3.1 | 1 
fs/cramfs/cramfs.mk:46: /tm... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /tmp/... | 1 
                 fwts-22.09.00 | 1 
            ghostscript-9.56.1 | 1 
                         glibc | 1 
         gobject-introspection | 1 
gummiboot-2bcd919c681c952eb... | 1 
                 haproxy-2.6.5 | 1 
            host-binutils-2.37 | 1 
            host-binutils-2.39 | 1 
              host-delve-1.8.0 | 1 
       host-gcc-initial-11.3.0 | 1 
                 host-gdb-12.1 | 1 
     host-moby-buildkit-0.10.0 | 1 
    host-python-maturin-0.14.1 | 1 
host-spirv-llvm-translator-... | 1 
                   httping-2.5 | 1 
                   hwloc-2.8.0 | 1 
                jemalloc-5.3.0 | 1 
libcamera-ba6435930f08e802c... | 1 
libdill-32d0e8b733416208e04... | 1 
                libdnet-1.16.1 | 1 
                  libftdi1-1.5 | 1 
                libmad-0.15.1b | 1 
                 libpqxx-6.4.5 | 1 
                libressl-3.6.1 | 1 
               libsigsegv-2.14 | 1 
                 libuwsc-3.3.5 | 1 
          linux-5.10.145-cip17 | 1 
            lttng-tools-2.13.2 | 1 
                   luvi-2.13.0 | 1 
                     lxc-5.0.1 | 1 
                  matio-1.5.23 | 1 
                mongodb-4.2.18 | 1 
                    musl-1.2.3 | 1 
                  ntpsec-1_2_1 | 1 
            ocf-linux-20171122 | 1 
on2-8170-modules-73b08061d3... | 1 
                 openal-1.22.0 | 1 
pistache-3ec9d7c4f8b828fdd3... | 1 
                proftpd-1.3.6e | 1 
                     pv-1.6.20 | 1 
           python-bcrypt-4.0.1 | 1 
    python-cryptography-38.0.3 | 1 
                   qpdf-10.5.0 | 1 
            quickjs-2021-03-27 | 1 
                ramspeed-2.6.0 | 1 
              sigrok-cli-0.7.2 | 1 
              skalibs-2.12.0.1 | 1 
                 sudo-1.9.11p2 | 1 
                tealdeer-1.6.1 | 1 
toolchain-external-codescap... | 1 
              traceroute-2.1.0 | 1 
                   trinity-1.9 | 1 
uqmi-0a19b5b77140465c29e2af... | 1 
               valgrind-3.19.0 | 1 
                    volk-2.5.2 | 1 
                 wolfssl-5.5.3 | 1 
                      x265-3.5 | 1 
                xenomai-3.0.10 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/9b9ee25ca6ce5ae9316270b448718a4c7288fc89 |     
   mipsel    | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/3569d27c79529fdacee6208c236906b8df0d03dd |     
 aarch64_be  | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/05e14307ebc9b717f3ac33335a58bb6a3a4ec0b2 |     
 powerpc64   | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/4d1022195de6381709a3ebf9f61a5b583d0a478d |     
    arm      |        asterisk-16.28.0        | NOK | http://autobuild.buildroot.net/results/754b41d793b1beebf538287862ec5fd880cfc649 |     
 microblaze  |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/88b68c6f46ac589cc30919947d26f3970ac84e43 |     
microblazeel |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/2e612c1317a2b04449d83b8ba72ef7f7efc2737b |     
    arm      |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/252086553c6efc6776eaac6851e6c662fdd1f5a7 |     
  mips64el   |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/e09dfabb0fb1145dd523080c3a3c887643b559a0 |     
 powerpc64   |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/88112ffdbe20cfb23857358b78ad017f0e6f3387 |     
   armeb     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/2e45cbfcb044d0f742a093d455392fe055d9d16d |     
   sparc     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/56593931cf7b62d239fcb6fa6a3a3877587cef33 |     
microblazeel |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/48453bef6f4452b32ca14242d70f545d9147153d |     
   mips64    |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/a0b9cca1f703c6a2b620d550ce864846bbb4aaff |     
    mips     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/4d123831f7bbcef2e82c47b4ef5a8a9a02934513 |     
 aarch64_be  |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/884417431bdb6e3ca18793c18374d3c3f77d5bf7 |     
microblazeel |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/36e1e755f66f9c3731e076e39305d28f529199aa |     
 aarch64_be  |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/9e3c7166ffdea89e097e95451a5e9a6848d6e3b9 |     
    arc      |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/2fb5b7ef2db2c73112445001148f31e025953ad1 |     
   arceb     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/ae9128d312c472cc766d2901f746ab1982f80a5d |     
powerpc64le  |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/f1cf68e0c1edfeda193ddd5a1413c51831432cab |     
   x86_64    |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/afdf10ca5e0594a80e88e5beceabf2eeab67faa4 |     
  aarch64    |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/fc2be6b4f0af92fbc4a020e38625a3fd852e73b3 |     
   mips64    |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/5ae8bd3ca814b857055c40119d3a55ab37d78c18 |     
 powerpc64   |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/33eec25fe61bdbbd0cb5f9006c24c05c396470b3 |     
   x86_64    |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/f7a5d80cf92abcad7d22b9830fdf543cb81947f9 |     
   arceb     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/207a05077eea069f9416aa3c5c0a8d12e60e701e |     
  aarch64    | bayer2rgb-neon-15feb1115b48... | NOK | http://autobuild.buildroot.net/results/2cae6db64c935f0b20b12a7b61532b79f8d05468 |     
    arc      |          boost-1.80.0          | NOK | http://autobuild.buildroot.net/results/e446300c4046d15f87b5235414f2f43b5d6b5d0e |     
   s390x     |         bpftool-v7.0.0         | NOK | http://autobuild.buildroot.net/results/432f236b1a20b6154aab89b5962754e6966fa4ea |     
   s390x     |         bpftool-v7.0.0         | NOK | http://autobuild.buildroot.net/results/eaf7647c29bda34dbb5bc8fca389992eb7415c93 |     
    i686     |       dahdi-linux-3.2.0        | NOK | http://autobuild.buildroot.net/results/3d3995a91a485a50d43d193e2d0b5e09f3da6581 |     
   xtensa    |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/3812b775a0e464a8c8ab70a5cddadac450c7fb38 | ORPH
    or1k     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/0fc473d4c57c9e61aa2c63001db2697427afc3e5 | ORPH
    or1k     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/05b409989ca62ca9ec3c9012933cfcfe09c03dc5 | ORPH
  riscv64    |         ddrescue-1.26          | NOK | http://autobuild.buildroot.net/results/2d37436b87a65328c8cb5d9273d2fa66b7d4bf64 | ORPH
  powerpc    |         dmalloc-5.6.5          | NOK | http://autobuild.buildroot.net/results/38b98ce2ab40ab9ec246cbc3c6e6c90e220f62c3 | ORPH
 powerpc64   |           dust-0.8.1           | NOK | http://autobuild.buildroot.net/results/5f74f6bfa4d7ba9a2c8449521a203743441be771 | ORPH
   x86_64    |     edk2-edk2-stable202208     | NOK | http://autobuild.buildroot.net/results/8edd6dfdb6b972edf0354fb64dfdb5df8f1a14c3 |     
  mips64el   |           efivar-38            | NOK | http://autobuild.buildroot.net/results/8d2a8c60da9f53bf78fde7755a27781f3b404599 |     
    arm      |           efivar-38            | NOK | http://autobuild.buildroot.net/results/d3f0ecb76637ef198bcaba35ec39ec909ae79c9a |     
  mips64el   |           efivar-38            | NOK | http://autobuild.buildroot.net/results/e1cf6e5ba6ea90fe92b5cb95fc0516575d5d14d4 |     
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/b4b825ab50df7aa3dc40334b02d89dbaf298129d | ORPH
   arceb     |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/4fc203090d2ba7f0768506a7299cb396fd7a3473 | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/fa437adb4a987adbc072a22b8939b55383a678e1 | ORPH
    arc      |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/23e6b70fddc3c0b0e77dd76982d8346fcbab6174 | ORPH
powerpc64le  |        fftw-quad-3.3.8         | NOK | http://autobuild.buildroot.net/results/3d01386cd1b63f3bf8764c1eb0ab9295ce8ce635 | ORPH
   x86_64    |           file-5.43            | NOK | http://autobuild.buildroot.net/results/b08b50791689efca3b96e432d4200089c1269c62 | ORPH
powerpc64le  |    freeradius-server-3.2.0     | NOK | http://autobuild.buildroot.net/results/b457a3b6e607a87364ab57cfae5738fb6750a624 |     
   xtensa    |           frr-8.3.1            | NOK | http://autobuild.buildroot.net/results/53526521f5bc88c950d473d0b6a6a0cbc09f0cf0 |     
    or1k     | fs/cramfs/cramfs.mk:46: /tm... | NOK | http://autobuild.buildroot.net/results/778bf72886b12e93c3125c650186885adfdd1646 |     
  sparc64    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/88bef8775432c79ab8d09803aa71a3c4c30f5045 |     
   mips64    | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/d7e01b20f86bd7391f6175978a52c34619ceca72 |     
   x86_64    |         fwts-22.09.00          | NOK | http://autobuild.buildroot.net/results/622b7445efafc336168a653a690bbdfba96ba997 |     
 powerpc64   |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/afeec8b724c4053631833280a7f84f27c8ebf254 |     
   mipsel    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/3166e17c5ae9953846a09de642909c54f4a858db |     
    sh4      |       ghostscript-9.56.1       | NOK | http://autobuild.buildroot.net/results/5406183140ff8629b695c68b42f46096cdd5e87c |     
    i686     |             glibc              | TIM | http://autobuild.buildroot.net/results/0fa35880a5e765abb7bc8d83068b63d868b3d148 |     
   arceb     | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/9cf6e6ba4adb97e7e94dd1d766a332ea87159057 |     
  powerpc    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/3b1dff622cbd4c72a6054a75b251f5c19014ec73 |     
 powerpc64   | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/7e73244c215f69d2edfcc91cd004d50c5ec3a1a7 |     
  powerpc    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/1e1990606e75bbdf5a9928393f143f528696793d |     
  riscv64    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/33c97c2b6aa5c21fc61764c9a6b96efee955bdfd |     
  powerpc    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/48d3b81f4c962e3c1777b9675efafa12c70b20a0 |     
  powerpc    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/e3a76db5dd2f32bc604d8127fe6602c090786d83 |     
  powerpc    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/a11d696c2a59d19f1296c11dab7d0f513b38cdc4 |     
  riscv32    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/06eda7145471946a2360ca0c1a81124cb1a9d195 |     
  powerpc    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/97feb37cbb2aeb9a957d7abc1c2b4ee85f8a1853 |     
  powerpc    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/95500fa19f39906a7f23effa67214c88e6abd934 |     
    arc      | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/42f7abcbe50a338554e5f337a4e282c0b7923a7d |     
  powerpc    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/6cdf5b324da96c68e0a8df1ddf31692b36999327 |     
  powerpc    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/d9c0b3e57283e4fd0c2688d442f008acdef14883 |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/3db4943c7cd0c19130d598c3edb433f627a14186 |     
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/cbf68355c89b41c1865509bde12192fd1843956c | ORPH
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/ed6cf4d0583a4c06577114345d51ad4e3cb97527 | ORPH
   nios2     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/1bb5aaf782f0e3068164166e7b9bd623f441acb5 | ORPH
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/1fb2540033f6845a6f766479151331daa774b12e | ORPH
   mipsel    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/a9c17d628748ff4e858efe79a059c8f0e01e756f | ORPH
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/2ff31e1d32cbcd146dcdfc1d73a8134b320dba7d | ORPH
   x86_64    | gummiboot-2bcd919c681c952eb... | NOK | http://autobuild.buildroot.net/results/b501c6c2a638cfd09ffd596c94f24d3338ff44da |     
    i686     |         haproxy-2.6.5          | NOK | http://autobuild.buildroot.net/results/59323c8e606ddd3bf8da7ba251ddd9de66aa9719 |     
  riscv64    |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/86bd1ff505ee1fe9def657f6f0802477a0636f92 |     
   mipsel    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/619d4bbd99a346f904a052529b6d3959eb39769a |     
microblazeel |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/0b6ff1ede721ef3a7a6e42e1c5a93b68f486700d |     
    sh4      |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/bad641be96794995d2428c6d01a3df4476d17948 |     
  riscv32    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/48f226f79946789cf9738ed814f1a8e3070b1ea6 |     
   mips64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/9ac089962b1274717aa419999472e0a4c1b3497a |     
 aarch64_be  |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/0341d9834aaef3d200795c487a81a20d735f37ba |     
   xtensa    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/a2c59a8dc067e4ed6ccd4b2f529e3177bc9a6dae |     
    mips     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/fa1e90b44209f1853e3d71f963309a992da85ec0 |     
    m68k     |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/687cde59f5950e0b3678287c64182a4bc669ce49 |     
   mips64    |        host-delve-1.8.0        | NOK | http://autobuild.buildroot.net/results/3f1fa0fb3c2d17d42f805101069dbf96b036b2bf |     
    arm      |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/1e8bb91bffd8b8e7d2635d6de6c0288c2de1a57e |     
   sparc     |         host-gdb-12.1          | NOK | http://autobuild.buildroot.net/results/8976926e27fdbed3f762d7d03575c4c375d1aab2 | ORPH
  mips64el   |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/1aee08e38ac2bc00104636ab762f1729ceb3e148 |     
   mips64    |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/ec8e5e7810becbf122f9ecf74526c598c53f7747 |     
   mips64    |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/f6a590fe97ebb6b2868855f8ad20a9ede571c23f |     
   mips64    |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/f42eeb637f005126d39538ced9197be20e2eb031 |     
  mips64el   |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/68dae6aec97755d5ff06b0eb0578c6dbf46594ff |     
   mips64    |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/4148f537a2159eb50ce20489f9b53bde7f95bfcb |     
   mips64    |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/f917975069d3932bc974b0c1f7e471fc534ef0fc |     
   mips64    |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/dac3147e502bf4204e8790069747a079573932c3 |     
   mips64    |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/46dee87e6e6dbe4b0889cf1cb9cfeec54dc3dbf6 |     
  mips64el   |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/160212c301e4ac16781d0ab8247b34e331f5a5a4 |     
  mips64el   |         host-go-1.19.3         | NOK | http://autobuild.buildroot.net/results/54e83c11310f1447337545f75ad9c1b7a83597b3 |     
    arm      |   host-moby-buildkit-0.10.0    | NOK | http://autobuild.buildroot.net/results/c137187c84909524a90ebd8add1d37265ff8b415 |     
 aarch64_be  |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/4f41bda21deeb3646a29a7a481b08b447726450d |     
  sparc64    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/35cb87adfa0d99b2ae5602707e6e2336143a2dbf |     
   mips64    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/e9f73928f5045e023077483aa15b3099593b01d3 |     
 aarch64_be  |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/086dcc838b5995cde6e77bd122b25af9182cb510 |     
  aarch64    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/01cb96925548c342b4c83c95e11a5853c00d51d8 |     
    or1k     |   host-python-greenlet-2.0.0   | NOK | http://autobuild.buildroot.net/results/33b360114af3e4b17672e48227ab668cce93550e |     
   armeb     |   host-python-greenlet-2.0.0   | NOK | http://autobuild.buildroot.net/results/f9db79dacfd14ba5cd812e6203a9805ae452c811 |     
 aarch64_be  |   host-python-greenlet-2.0.0   | NOK | http://autobuild.buildroot.net/results/eda6714f38563608d53904fa316b80927b5501ae |     
  powerpc    |   host-python-greenlet-2.0.0   | NOK | http://autobuild.buildroot.net/results/c91e20034666353a2c852c49c80b46161aa8c553 |     
   xtensa    |   host-python-greenlet-2.0.0   | NOK | http://autobuild.buildroot.net/results/7f659c729e18a476dda152b3313addc9b80db1bf |     
   mips64    |   host-python-greenlet-2.0.0   | NOK | http://autobuild.buildroot.net/results/0926c0a7497a3a4398a3c433e953deddbe958801 |     
 powerpc64   |   host-python-maturin-0.14.1   | NOK | http://autobuild.buildroot.net/results/fd178d4f3b8a8267843f9afa3b0ed0f6b3158a99 |     
powerpc64le  |        host-rust-1.65.0        | NOK | http://autobuild.buildroot.net/results/009b1cba2dde51fa7f99fc5e8937fca54815a4dd |     
powerpc64le  |        host-rust-1.65.0        | NOK | http://autobuild.buildroot.net/results/efde65a605e895fe36b8994dfeb828121fabcb14 |     
  riscv32    |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/adb4e8a39458b8bc741d1565f7fb0c727aa6457e |     
   xtensa    |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/20d8054fa00bc69b2a4a1cba9379777858ad903d |     
    arm      | host-spirv-llvm-translator-... | NOK | http://autobuild.buildroot.net/results/130bacc85d595982e8f85682bb76ea4e7fb5ff42 | ORPH
    arc      |          httping-2.5           | NOK | http://autobuild.buildroot.net/results/85ad84fd915ec6e8653b530825f561c80ac1e6a1 |     
   x86_64    |          hwloc-2.8.0           | NOK | http://autobuild.buildroot.net/results/692dc7e6cd08e31eaae721da4665630ce384cb13 |     
   x86_64    |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/4932f58e5c830990835561c61805fabafb831d7b |     
   s390x     |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/10aa9baf69b0d5c36ff3c77498ffddfa3239a9a7 |     
 aarch64_be  |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/fa6ae4af46e2c4eebcba33ce166751a67e557df4 |     
powerpc64le  |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/77a69d0ec8b3d6ab57860cd52b89517b80d6a5b0 |     
 microblaze  |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/cdcbfd8fb49ff90bf4ea9b46d38ff7f1327a2f07 |     
powerpc64le  |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/0456ccc125eded49277e5bd189d5d9ca9b63c9ea |     
  aarch64    |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/3a7411b6c1676968fa9c4a94466c10f0fae0c4dc |     
  sparc64    |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/8350d40403956789f00200feb6596184bd233ef9 |     
 powerpc64   |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/20a3261489f579f4ee9d112fa4ea4ee1585b558a |     
    sh4a     |         jemalloc-5.3.0         | NOK | http://autobuild.buildroot.net/results/23797feca89368ae7e322ffd3a8229018147c9fc |     
    i686     | kvmtool-f77d646ba01d04be5aa... | NOK | http://autobuild.buildroot.net/results/a5370466713d9892e36d3fb8402fc1507ebe493e |     
   x86_64    | kvmtool-f77d646ba01d04be5aa... | NOK | http://autobuild.buildroot.net/results/2c516984e553b771ba9e4d994107c5f62a0043c0 |     
   xtensa    |          lcms2-2.13.1          | NOK | http://autobuild.buildroot.net/results/d6ab1f8d8342c5cf9bae64fa2e85010aeb612c5f |     
   xtensa    |          lcms2-2.13.1          | NOK | http://autobuild.buildroot.net/results/4f55e7653c6b44c1b05b5ca17eb824df8938c48c |     
microblazeel | libcamera-ba6435930f08e802c... | NOK | http://autobuild.buildroot.net/results/1c6e409eb71ec1eb6e127e720b2fc111dd99b2ae |     
    m68k     | libdill-32d0e8b733416208e04... | NOK | http://autobuild.buildroot.net/results/c8f871b67ecbce9feb3ee42be498fc6c29cedf69 |     
    sh4a     |         libdnet-1.16.1         | NOK | http://autobuild.buildroot.net/results/43e2bb0bf594dd51d7256e49e1363f16aa0540e7 | ORPH
   sparc     |          libftdi1-1.5          | NOK | http://autobuild.buildroot.net/results/0615924ac995229aecfdf295d9779b48c97bae3f |     
    arm      |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/91c234d2c4a73683abd7112485b8481e94ddf3e0 | ORPH
   armeb     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/2c446fdb931bf253be78336f15454f0ef7235a8d | ORPH
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/3ac09dcf1b611b42293afcc124c03ffe33953171 | ORPH
    i586     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/3ed987ad74cd7e8498fa890969aa180bf53561e6 | ORPH
    i586     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/d7091508d7930b7701c4400bc88ce685916c4a32 | ORPH
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/851c7362075d1c3d3cc48d3bc61fe3113bbf0228 | ORPH
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/679ce38fe9942dc06ae6683d63c4f5bda7ac1326 | ORPH
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/c3bd65e46e1a1113343bb1cc448a854b65d7b533 |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/3430b3bef94dbf89b4f33153a48c0659d359af01 |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/d72736f01d48cf383570dd51b8e614f9fce892d4 |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/e8db043d1555e5eab5d8df5aa69df317617a143e |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/04cc26269ecaa0565a1906e2fd28669a17b36a37 |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/3112929325b3d06159b144407944edfd36846159 |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/8205c8eacf7278e47b677005dcc12a775fa3599a |     
 aarch64_be  |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/9a5bd35d518cb4b2734e474daba7dcc7ec8643e4 | ORPH
 aarch64_be  |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/1508caaf2cec37cc256cc00fd24d35c7a1789855 | ORPH
 aarch64_be  |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/1aff529b452c0c2f03378ffb5725e76625a90aa5 | ORPH
 aarch64_be  |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/5bbd4a18e669a1ef07f34dd2ceeced27af03d861 | ORPH
 microblaze  |         libkcapi-1.4.0         | NOK | http://autobuild.buildroot.net/results/5aaf63226ee4c911bc8902c23a7a867ce2e15a04 |     
microblazeel |         libkcapi-1.4.0         | NOK | http://autobuild.buildroot.net/results/d8714fac69fe60e9fed36873995ad14cd11b05bc |     
microblazeel |         libkcapi-1.4.0         | NOK | http://autobuild.buildroot.net/results/51bb6401e4dcf1549e9192b428d5cbe1c2b885be |     
    arm      |         libmad-0.15.1b         | NOK | http://autobuild.buildroot.net/results/d5f42c11d3c11ee2443f3524416607ea559a46be | ORPH
   x86_64    |         libpqxx-6.4.5          | NOK | http://autobuild.buildroot.net/results/56372ea3305cb4769c003fb6edf6e17a4fe6b469 |     
   armeb     |         libressl-3.6.1         | NOK | http://autobuild.buildroot.net/results/58ea049fd7ef3312f14c480585550706d60af6ed | ORPH
  powerpc    |        libsigsegv-2.14         | NOK | http://autobuild.buildroot.net/results/72eeb075e594e0942faf173d7f6942de411a243d |     
    m68k     |         libuwsc-3.3.5          | NOK | http://autobuild.buildroot.net/results/6c2a6ed6fca1f92aab299f6ed9cd900b20e8d512 |     
   mips64    |      linux-5.10.145-cip17      | NOK | http://autobuild.buildroot.net/results/7de72090d688af3b314b79360ffc615fe59fa5e3 | ORPH
  riscv64    |    linux-5.10.145-cip17-rt7    | NOK | http://autobuild.buildroot.net/results/12f2c980578cde023142d9c6bbd53ba264fd778f | ORPH
microblazeel |    linux-5.10.145-cip17-rt7    | NOK | http://autobuild.buildroot.net/results/fc3324e4e365b6765ed0e0d85c04f1d0d950ebf8 | ORPH
   mips64    |    linux-5.10.145-cip17-rt7    | NOK | http://autobuild.buildroot.net/results/556fb69722768a8ca340c4d151d41fc220b98bcf | ORPH
   mips64    |          linux-6.0.9           | NOK | http://autobuild.buildroot.net/results/fe5837f071a36e1c6891ce78404d337a2949a75c | ORPH
    mips     |          linux-6.0.9           | NOK | http://autobuild.buildroot.net/results/4736cc1ca2da2771ce4109fb13d41d1f5bb6e827 | ORPH
    arc      |          linux-6.0.9           | NOK | http://autobuild.buildroot.net/results/4188ccc5034b2c8328af327e6b273bc8fdda697c | ORPH
    arm      |          linux-6.0.9           | NOK | http://autobuild.buildroot.net/results/3b4e80138e45d28f4eb1d78470f12a84fed8508c | ORPH
 powerpc64   |          linux-6.0.9           | NOK | http://autobuild.buildroot.net/results/49fc95035e1f30861b1fda2e1fe8f74bc45915e9 | ORPH
   arceb     |          linux-6.0.9           | NOK | http://autobuild.buildroot.net/results/a345f4ed75e0ecfabcdd02a1148eb4b0c5b33af2 | ORPH
   s390x     |          linux-6.0.9           | NOK | http://autobuild.buildroot.net/results/019caa6563e2b8b01f9e7b6ebb04bc1c27062816 | ORPH
   x86_64    |          linux-6.0.9           | NOK | http://autobuild.buildroot.net/results/215ad8df9d11846eb5ef192a5028c7b4b0d16d98 | ORPH
 powerpc64   |       lirc-tools-0.10.2        | NOK | http://autobuild.buildroot.net/results/4410870d9cb420b77b410f32b9c8852699b87852 | ORPH
  mips64el   |       lirc-tools-0.10.2        | NOK | http://autobuild.buildroot.net/results/1525a6e514573bfb9bea160a50a2c94b92d90955 | ORPH
  aarch64    |       lirc-tools-0.10.2        | NOK | http://autobuild.buildroot.net/results/f90d93b8149c53d6cb9526c0341c4085ae35951a | ORPH
    i686     |     ltp-testsuite-20220930     | NOK | http://autobuild.buildroot.net/results/e24773af21390cb541c8d19e2fe1d864750cbfcf |     
  powerpc    |     ltp-testsuite-20220930     | NOK | http://autobuild.buildroot.net/results/5dd7ab001cbc4f8657aa1b296266de635bf16fd5 |     
   s390x     |     ltp-testsuite-20220930     | NOK | http://autobuild.buildroot.net/results/a74ace6f00cc9f4d1669eff7a2682b2987a4998f |     
    mips     |       lttng-tools-2.13.2       | NOK | http://autobuild.buildroot.net/results/bbc8d6621822bb5da7513331e69799ca25a03f66 |     
 aarch64_be  |          luvi-2.13.0           | NOK | http://autobuild.buildroot.net/results/23c0b484f75a3f91594ad0227e76efa8681d7e49 | ORPH
 aarch64_be  |           lxc-5.0.1            | NOK | http://autobuild.buildroot.net/results/ac0a7a9a2fdb9d8ce1d9c4a798b154c730cd1874 |     
   nios2     |          matio-1.5.23          | NOK | http://autobuild.buildroot.net/results/c7915a09468951ac5fe98fcf74edf4852e3fd656 |     
   x86_64    |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/2bfd6011f1ee6316175661b51dbaa18ea7fae438 |     
  powerpc    |           musl-1.2.3           | NOK | http://autobuild.buildroot.net/results/7ef0bf9bce45e1596fddf05d563bb2f6d7792c76 |     
    arm      |     mxs-bootlets-10.12.01      | NOK | http://autobuild.buildroot.net/results/6e342f5d9ea062267d5ad5be8b07805624412994 | ORPH
    arm      |     mxs-bootlets-10.12.01      | NOK | http://autobuild.buildroot.net/results/e8097bb0e23a294b0a72dc09dba32f5bcc9e1344 | ORPH
  riscv64    |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/364dd7ef9f2f904ab6b1a0795db687062804f7e8 | ORPH
    or1k     |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/b67880673a9d8924aad99d70b117061d073313f6 | ORPH
   x86_64    |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/bacacd85d742f89ade92bdb5d17adeab2e0ad339 | ORPH
    sh4      |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/22bc0355e9d7e392556eb90ee36db0602ec93845 | ORPH
   nios2     |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/750bd5672209c8aec393e88061f1dc4125cdc163 | ORPH
   xtensa    |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/84fbea2268bcdb705e3c90899bb03dd39782fde0 | ORPH
microblazeel |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/94a015b6304ee977aa90b622f9d34df56925330c | ORPH
  mips64el   |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/71b6d8dd8767eafc1eca03e9262a848f3dfe682d | ORPH
   mipsel    |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/2c8d4b0a32c6d419051dbe81d63d35beca7ed04d | ORPH
  mips64el   |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/86cc0ea7745899bfada34183a65f7f20d9f2c468 | ORPH
  riscv64    |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/bcb5f8d27d7672dc15b33dc95147687dd9d079db | ORPH
  riscv64    |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/bc0ebdb7b8e9d07472bc9b8bb9b9fce54bb3af28 | ORPH
    m68k     |          ntpsec-1_2_1          | NOK | http://autobuild.buildroot.net/results/520e65011c5058025e522a201ace483c16812866 | ORPH
   x86_64    |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/3d925f5535d7ed8a4c15a17777fd98edf8785255 | ORPH
   armeb     | on2-8170-modules-73b08061d3... | NOK | http://autobuild.buildroot.net/results/941e03ea98bba2faa01645587e4280e1df0cc80e | ORPH
  mips64el   |         openal-1.22.0          | NOK | http://autobuild.buildroot.net/results/b6ce685f3c8cc066b88338974fefdd0174ec857f |     
  aarch64    |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/fe12b42c49b94fbc53a7190b75c186b78c5661f3 |     
   arceb     |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/de710ba6ab01a64198f109380d68c792f21a0b26 |     
    m68k     | pistache-3ec9d7c4f8b828fdd3... | NOK | http://autobuild.buildroot.net/results/ab08cfc4609eee301374f9b19214920f0e8e4081 | ORPH
   nios2     |         proftpd-1.3.6e         | NOK | http://autobuild.buildroot.net/results/9ba015116aebfb1b59ea7a966306f0c132f0d27e |     
   armeb     |           pv-1.6.20            | NOK | http://autobuild.buildroot.net/results/ad512de6893bdcbb1464606363b208782c314124 | ORPH
   s390x     |      python-bcrypt-4.0.1       | NOK | http://autobuild.buildroot.net/results/5753c43de2a21a3edb502c58a2e66039cdd2fa2c |     
  aarch64    |       python-bunch-1.0.1       | NOK | http://autobuild.buildroot.net/results/84bc4df95c3a9b40d700cb4b7abd02c3de78d6f6 |     
powerpc64le  |       python-bunch-1.0.1       | NOK | http://autobuild.buildroot.net/results/d5702bbc044c8c64cababdc6816cde9714383d7a |     
    arm      |       python-bunch-1.0.1       | NOK | http://autobuild.buildroot.net/results/26be11c05dcba620c5e65d99a1e61e1f2507c9b6 |     
  aarch64    |       python-bunch-1.0.1       | NOK | http://autobuild.buildroot.net/results/8589cfd19da291730d2df9628250cd43f0789268 |     
 aarch64_be  |       python-bunch-1.0.1       | NOK | http://autobuild.buildroot.net/results/51a061befd426d230f440a514f3e3ea51c4bac17 |     
powerpc64le  |   python-cryptography-38.0.3   | NOK | http://autobuild.buildroot.net/results/6758e9ed844c66ad29f45cddb209ba0d63cc8f1a |     
   mipsel    |     python-greenlet-2.0.0      | NOK | http://autobuild.buildroot.net/results/ce27e4a82c9a0314a040d115521f31a54621d6eb |     
powerpc64le  |     python-greenlet-2.0.0      | NOK | http://autobuild.buildroot.net/results/fb25742fcc2686df1ebba2f2cd65b0adda25f56f |     
 powerpc64   |      python-numpy-1.23.4       | NOK | http://autobuild.buildroot.net/results/5dcbf2bc18ec92b0d6750d98944823bfc7ffac6c |     
   sh4aeb    |      python-numpy-1.23.4       | NOK | http://autobuild.buildroot.net/results/19f57aeecc500e8093752851761b742730c15e9d |     
    mips     |      python-numpy-1.23.4       | NOK | http://autobuild.buildroot.net/results/6f7721cf30f09cc69705fa45de7c343b8f17d9b2 |     
   xtensa    |      python-pyicu-2.10.2       | NOK | http://autobuild.buildroot.net/results/3ad4ce325ea3ff1fb24fc9980aeb9f1ad65e9ed2 |     
    arm      |      python-pyicu-2.10.2       | NOK | http://autobuild.buildroot.net/results/8b194d256c49dddb60ec3203566428ea4c33d29d |     
    arc      |      python-pyicu-2.10.2       | NOK | http://autobuild.buildroot.net/results/9b8ee974c2d4de07dcb6736b4010c2b63d4888ab |     
   xtensa    |          qpdf-10.5.0           | NOK | http://autobuild.buildroot.net/results/d64329f5522471ee3af4a008f30939c1e513b421 |     
microblazeel |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/8937ef1f4d23785d7b61aeabd573c0a8c4619ae2 |     
    sh4a     |         ramspeed-2.6.0         | NOK | http://autobuild.buildroot.net/results/45a19567c94576b2401a348f1210eafee6a816d2 | ORPH
   s390x     | rtl8192eu-1e15b6d451731bc4d... | NOK | http://autobuild.buildroot.net/results/536b9195fbab1bf701e67ccc17a1099d1b647d81 |     
   armeb     | rtl8192eu-1e15b6d451731bc4d... | NOK | http://autobuild.buildroot.net/results/33aace3073c51421fb404789847ef7581428e393 |     
    sh4a     |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/c9350634f4ee981f8abbf0b41dc00a225756d2d9 | ORPH
    sh4a     |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/04ea0af4e50dc43cd6dfad68100460e803678c25 | ORPH
 aarch64_be  |        sigrok-cli-0.7.2        | NOK | http://autobuild.buildroot.net/results/4b0f06d2fb9e1e9666127bc5c8b1896d7f6b76e9 |     
    or1k     |        skalibs-2.12.0.1        | NOK | http://autobuild.buildroot.net/results/6b8378cd2f56f750a2679901437c8f6616a05db7 |     
    arc      |          sscep-0.10.0          | NOK | http://autobuild.buildroot.net/results/544da45d6c1f120f446c1cae5b4a14af09986e2f |     
    m68k     |          sscep-0.10.0          | NOK | http://autobuild.buildroot.net/results/03c64bfc0c7ffcc47f6c3b7fdf1ccc2c03f95e2b |     
    arm      |          sscep-0.10.0          | NOK | http://autobuild.buildroot.net/results/198b712fab282bac19ef52e6d136adb6a2c16b56 |     
   nios2     |          sscep-0.10.0          | NOK | http://autobuild.buildroot.net/results/76e4aab8035d4e4e0e1bd79eca286f3c73d65cd1 |     
 aarch64_be  |          sscep-0.10.0          | NOK | http://autobuild.buildroot.net/results/5d0b70f2981dd10c8ed5adad30ae10c3326ecc84 |     
   mipsel    |          sscep-0.10.0          | NOK | http://autobuild.buildroot.net/results/3c9763eb2e464b101732015822af8f4420b4e1d5 |     
  riscv64    |          sscep-0.10.0          | NOK | http://autobuild.buildroot.net/results/34f7c98bc7f406152169041c9dbebf7b59c004f8 |     
    arc      |          sscep-0.10.0          | NOK | http://autobuild.buildroot.net/results/05f007970a14ac0f08a7d1ee8160cd86ab7947bc |     
    arc      |          sscep-0.10.0          | NOK | http://autobuild.buildroot.net/results/9253f40b0cd6cd63d28527f209484884be59819e |     
    arc      |          sscep-0.10.0          | NOK | http://autobuild.buildroot.net/results/c787243a81c22f3366c706f2cc11582ffc1c79ca |     
   armeb     |          sscep-0.10.0          | NOK | http://autobuild.buildroot.net/results/d92b9eb34c26d235b86817f7058bfac1961d9813 |     
    m68k     |         sudo-1.9.11p2          | NOK | http://autobuild.buildroot.net/results/49558c30ef8210f2f55d6c04571dbdcbd360bbbc | ORPH
    i586     |         tealdeer-1.6.1         | NOK | http://autobuild.buildroot.net/results/18bc2c593c392f42c105dae439baf0d46e4c39f6 |     
    mips     | toolchain-external-codescap... | NOK | http://autobuild.buildroot.net/results/1c696663389b57f7fefd750a7b13c34439dbe56c | ORPH
   mipsel    |        traceroute-2.1.0        | NOK | http://autobuild.buildroot.net/results/b08d66e5c7aaaf08357a7b6320f9bb49bedfdab4 |     
   x86_64    |          trinity-1.9           | NOK | http://autobuild.buildroot.net/results/8e9fcd22a19cd50913fa94fe17e91844f1a61c43 | ORPH
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/1a6b656401e1cad3803667427df63cc102ab84d4 |     
powerpc64le  |            unknown             | NOK | http://autobuild.buildroot.net/results/20963cfb23d2231733004ad3634a62266081e739 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/15850bd66babe11762db29879fc0e0d2948a8e4f |     
   sparc     |            unknown             | NOK | http://autobuild.buildroot.net/results/1613f6ee77e58373478c6d0d96780b23758f6f31 |     
    i686     |            unknown             | NOK | http://autobuild.buildroot.net/results/3c1f9896e98c954d292493048ab3a86c55f3e42a |     
    arm      | uqmi-0a19b5b77140465c29e2af... | NOK | http://autobuild.buildroot.net/results/812eddd57d8a15e3428a48b7d163b60ab1cf5d1c | ORPH
  powerpc    |        valgrind-3.19.0         | NOK | http://autobuild.buildroot.net/results/6ea61287396987db9d135f56dd5f6d7d64664869 | ORPH
    mips     |           volk-2.5.2           | NOK | http://autobuild.buildroot.net/results/5c4728f61cc56c3a75f0b9971910cef448703b13 |     
powerpc64le  |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/45201b66f56115ffd32b9b464fdd63f17ccba434 | ORPH
   mipsel    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/03ce40921ad5efa688a07fd07bb5492080c709d4 | ORPH
  mips64el   |         wolfssl-5.5.3          | NOK | http://autobuild.buildroot.net/results/f5062df9b5bb2300604815659a65c4adc05e315e |     
  aarch64    |            x265-3.5            | NOK | http://autobuild.buildroot.net/results/020742fcf61741f52300ec27808304b4abcc2a4e |     
    mips     |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/2b3d3dc5b01c0535175bcf8e8113cea169c2de89 |     
  aarch64    |          xvisor-0.3.1          | NOK | http://autobuild.buildroot.net/results/e3d2eee0916ababe85218667414572485736b9d2 |     
   x86_64    |          xvisor-0.3.1          | NOK | http://autobuild.buildroot.net/results/46476708571bd1eaf81ac5b7fffc13876c4c0392 |     
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/b7b881f5383cf5109cb928f8fa4faecac0fc631a | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/de308629094ec9c89768f8385a44c888e0dfe2f4 | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/194b62e42972b021dafde89764ffbb71a64b75a8 | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/39c4147dc65ee35019d1d4a147335f5de2b3b687 | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/1a205a67e40b7c06a5088f36ef17017d22e55c7f | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/c1123a8e7766c3044296c2df6159b18c42fd30d6 | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/c8a83fe621f0b9cc306b99160922b47dab936415 | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/ffa9625ebfaaf305adee7bf3b341ac212d06c4ab | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/1970052c507a352e2f7f75735c91fb465797e242 | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/470bda113cc8932be53cce34fbc8fe131b367b9f | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/809509dcbccec82d9733d6005eb9c9496c6e8b2d | ORPH


Classification of failures by reason for 2022.02.x
--------------------------------------------------

               apcupsd-3.14.14 | 1 
            igd2-for-linux-2.1 | 1 


Detail of failures for 2022.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/e7edfe2edb47bfc7eaa5873af95a52a7b67e5d38 |     
   mipsel    |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/f47fa0f8906e71199e63eb756ff6f7ab36e93786 |     


Classification of failures by reason for 2022.08.x
--------------------------------------------------

glibc-2.35-134-gb6aade18a7e... | 1 
host-pahole-73383b3a39afe86... | 1 
              host-rust-1.62.0 | 1 
            igd2-for-linux-2.1 | 1 
       linux-5.10.109-cip5-rt4 | 1 
                 linux-5.17.15 | 1 
                mongodb-4.2.18 | 1 
                     mtd-2.1.3 | 1 
               pcsc-lite-1.9.8 | 1 
rtl8821au-4235b0ec7d7220a63... | 1 
                tealdeer-1.5.0 | 1 
ulog-0389d243352255f6182326... | 1 
                       unknown | 1 


Detail of failures for 2022.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    sh4a     | glibc-2.35-134-gb6aade18a7e... | NOK | http://autobuild.buildroot.net/results/6c46749365ed0d1d6937a1837d545aa58ee6e61c |     
  mips64el   | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/07dd54c8ab972bef1aba37caada3224ed0c5851a |     
 powerpc64   |        host-rust-1.62.0        | NOK | http://autobuild.buildroot.net/results/aaf64a2f60d11c72e58ffd4997db9a7808ab938c |     
    arm      |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/31035877b93f44d7da3eed224584930ef46cf4d7 |     
   nios2     |    linux-5.10.109-cip5-rt4     | NOK | http://autobuild.buildroot.net/results/1445327bb329090be33e1021630177acea755ed4 | ORPH
   x86_64    |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/78dbd24c96cd17238e80e24c8c9a0c4ea87e14a8 | ORPH
    arm      |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/fa9d6a2c6e5a127a6ec10d3a8dad83651c03d09a |     
  mips64el   |           mtd-2.1.3            | NOK | http://autobuild.buildroot.net/results/0f5c03d6d9680afdcce3eede0ab509cc0dab3e4a |     
    or1k     |        pcsc-lite-1.9.8         | NOK | http://autobuild.buildroot.net/results/f73b4637454c3e5ada1d7edad38ee3357bc53a09 | ORPH
   sparc     | rtl8821au-4235b0ec7d7220a63... | NOK | http://autobuild.buildroot.net/results/60df1b0963e88a6bb068e57aa5704a052a26080f |     
  sparc64    |         tealdeer-1.5.0         | NOK | http://autobuild.buildroot.net/results/2a3c37aef910e365d61cbf215cfad59c7b31799f |     
  aarch64    | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/3bd8d31e98886f781721c54a6d33fb461f5fb8ef |     
  sparc64    |            unknown             | NOK | http://autobuild.buildroot.net/results/0398f19fa25d5eef9ba3da02fb6c09d9633767dd |     



-- 
http://autobuild.buildroot.net

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

