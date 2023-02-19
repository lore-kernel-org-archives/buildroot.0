Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BDD4C61DA4
	for <buildroot@archiver.kernel.org>; Sun, 19 Feb 2023 06:37:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F32F68199D;
	Sun, 19 Feb 2023 06:37:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F32F68199D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iGf4eq9vJiLZ; Sun, 19 Feb 2023 06:37:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 649F081DFA;
	Sun, 19 Feb 2023 06:37:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 649F081DFA
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 240961BF484
 for <buildroot@lists.busybox.net>; Sun, 19 Feb 2023 06:37:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E110C41800
 for <buildroot@lists.busybox.net>; Sun, 19 Feb 2023 06:37:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E110C41800
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BmGPl7I5vcCP for <buildroot@lists.busybox.net>;
 Sun, 19 Feb 2023 06:37:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C69CA417A1
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C69CA417A1
 for <buildroot@buildroot.org>; Sun, 19 Feb 2023 06:37:42 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 0494A1BF208
 for <buildroot@buildroot.org>; Sun, 19 Feb 2023 06:37:39 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sun, 19 Feb 2023 06:37:39 -0000
Message-Id: <20230219063745.E110C41800@smtp4.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1676788660; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=EZg59urU3Rt3zi+V8pq6GXb8hP9BjK1hNETdZTjhFU4=;
 b=jwgoyeFWd6Mhgz65PL7WNBLyCGNFVk+WYI8Wi59mm7PcGAMrYR/0hJGtZhCdJOs/PB8cx/
 eOh0oa79LM6TzntGy3ITSuGyHyjbQwCBJr0NoTiaN4xErg2RIVp5uEpZG5g/Doz4ersVMH
 3tgUkX7dtOxP+XdZcAF7UW85zMkwdzBQ8rUqkJ66w1IcY3pWpivg72kuCNd+RK78PLAQHf
 18xe7EGRjsKgD6GlSCWYaF+XU4mE5JqCSZ/pzB6DeNps0y6jjxFcvQbShKSQeZrEuyzKTd
 PwLauJs9A286I3eHAcOUsZi8Wkko1TIcRNlrG4bfeTIXdRQY0rp98elCINlEeQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=jwgoyeFW
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-02-18
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

Autobuild statistics for 2023-02-18
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.11.x  |  7  |  9  |  0  | 16  |
    master   | 151 | 166 |  1  | 318 |

Classification of failures by reason for master
-----------------------------------------------

                  gnupg2-2.4.0 | 22
              host-pahole-1.24 | 8 
                  linux-6.1.11 | 8 
  gobject-introspection-1.72.0 | 7 
                       unknown | 7 
            host-binutils-2.38 | 5 
                host-go-1.19.6 | 5 
              libgcrypt-1.10.1 | 5 
                speechd-0.11.4 | 5 
              host-rust-1.67.0 | 4 
glibc-2.36-81-g4f4d7a13edfd... | 3 
                 systemd-252.4 | 3 
                xenomai-3.0.10 | 3 
                busybox-1.36.0 | 2 
                  cairo-1.16.0 | 2 
                 dash-0.5.11.5 | 2 
                gerbera-1.10.0 | 2 
                     gmp-6.2.1 | 2 
             libgpg-error-1.46 | 2 
     linux-5.10.162-cip24-rt10 | 2 
                  netsurf-3.10 | 2 
                    olsr-0.9.8 | 2 
                     php-8.2.2 | 2 
        at91dataflashboot-1.05 | 1 
                   audit-3.0.7 | 1 
                  check-0.15.2 | 1 
             cni-plugins-1.2.0 | 1 
                   duma-2.5.15 | 1 
                     efivar-38 | 1 
                elfutils-0.186 | 1 
                  ffmpeg-4.4.3 | 1 
               fftw-quad-3.3.8 | 1 
                   flann-1.9.2 | 1 
fs/cramfs/cramfs.mk:46: /ho... | 1 
fs/cramfs/cramfs.mk:46: /ho... | 1 
fs/cramfs/cramfs.mk:46: /tm... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
              fstrcmp-0.7.D001 | 1 
                    fwup-1.9.1 | 1 
                 glibmm-2.68.2 | 1 
         gobject-introspection | 1 
            host-binutils-2.37 | 1 
            host-binutils-2.39 | 1 
         host-gcc-final-12.2.0 | 1 
host-gdb-arc-2020.09-releas... | 1 
         host-libarchive-3.6.2 | 1 
                  janet-1.26.0 | 1 
                       kmod-30 | 1 
               libglib2-2.72.3 | 1 
                libglvnd-1.4.0 | 1 
                 libhid-0.2.16 | 1 
                  libjxl-0.7.0 | 1 
                  libnfc-1.8.0 | 1 
                libressl-3.6.2 | 1 
               libsigsegv-2.14 | 1 
libuci-4b3db1179747b6a67790... | 1 
                libxml2-2.10.3 | 1 
                libzlib-1.2.13 | 1 
          linux-5.10.162-cip24 | 1 
            linux-fusion-9.0.3 | 1 
                   linux-tools | 1 
             lirc-tools-0.10.2 | 1 
        ltp-testsuite-20220930 | 1 
                     lxc-5.0.2 | 1 
                  matio-1.5.23 | 1 
         multipath-tools-0.9.4 | 1 
            ocf-linux-20171122 | 1 
                 openal-1.22.0 | 1 
               openblas-0.3.21 | 1 
                    opus-1.3.1 | 1 
                   pcre2-10.42 | 1 
              php-xdebug-3.0.4 | 1 
                 proftpd-1.3.8 | 1 
           python-numpy-1.23.5 | 1 
                python3-3.11.1 | 1 
                    qemu-7.2.0 | 1 
                    sdl-1.2.15 | 1 
              sigrok-cli-0.7.2 | 1 
                 snmppp-3.4.10 | 1 
             uccp420wlan-6.9.1 | 1 
               valgrind-3.19.0 | 1 
               xfsprogs-5.14.2 | 1 
                  zabbix-6.2.7 | 1 
               zxing-cpp-1.4.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |     at91dataflashboot-1.05     | NOK | http://autobuild.buildroot.net/results/78e81ddf6fe9aa36cc1777ef2764d0d8627c9d13 | ORPH
   armeb     |          audit-3.0.7           | NOK | http://autobuild.buildroot.net/results/9ced9cd83351214ee393a94cf8d296e59a2d7717 |     
  mips64el   |         busybox-1.36.0         | NOK | http://autobuild.buildroot.net/results/3e13b17cf04fd413a3ad97686b717996c432f90e | ORPH
  mips64el   |         busybox-1.36.0         | NOK | http://autobuild.buildroot.net/results/f6d03598201657332c5b70fd85ae6e30dc5870c0 | ORPH
  aarch64    |          cairo-1.16.0          | NOK | http://autobuild.buildroot.net/results/fa7645feb8b100486ef7317ae01a043cc7e0058b |     
  powerpc    |          cairo-1.16.0          | NOK | http://autobuild.buildroot.net/results/107916e6c212095db405d316f4ab57149d301a43 |     
   x86_64    |          check-0.15.2          | NOK | http://autobuild.buildroot.net/results/9d61b956022c0233502273a4c183c097a9400749 | ORPH
    i686     |       cni-plugins-1.2.0        | NOK | http://autobuild.buildroot.net/results/c6c9fb8911e0568e260b0a63c30a747d72250269 |     
    or1k     |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/1066076138f5a52fdba59260daf44d9d08ecfb02 | ORPH
   xtensa    |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/95bdac3486aceda02531c41f402831a339301317 | ORPH
   armeb     |          duma-2.5.15           | NOK | http://autobuild.buildroot.net/results/cf455c210424e720426680a525947c691c51eab9 | ORPH
  aarch64    |           efivar-38            | NOK | http://autobuild.buildroot.net/results/e6e6ceba41c0f7ec135a86bff83d787f070b34d0 |     
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/9d14343b1798f2bc4410b2e529ab84444bc375db | ORPH
    i686     |          ffmpeg-4.4.3          | NOK | http://autobuild.buildroot.net/results/f0c75b20eebb079e9733e705b0a59252699860cc |     
powerpc64le  |        fftw-quad-3.3.8         | NOK | http://autobuild.buildroot.net/results/abc60144cb5e61ad168ac8c47d6dc6d84bc76a4d | ORPH
    arm      |          flann-1.9.2           | NOK | http://autobuild.buildroot.net/results/22a5416d04913dac726284dc44f78cd3a9291cec |     
microblazeel | fs/cramfs/cramfs.mk:46: /ho... | NOK | http://autobuild.buildroot.net/results/160a51fac666663d9f8f45d7a82bf9a72bbc9da8 |     
    or1k     | fs/cramfs/cramfs.mk:46: /ho... | NOK | http://autobuild.buildroot.net/results/e723b0b36bb91ce91246ddc7a5e0890b04d3ea10 |     
 aarch64_be  | fs/cramfs/cramfs.mk:46: /tm... | NOK | http://autobuild.buildroot.net/results/2d44113e83497526f6c08bfa8070970b862e4796 |     
   sparc     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/403a1be571e63c0ce04acd843e09ba6c9ee9d40c |     
   mips64    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/029cef2f885f659d15cb73256620e4db18a58411 |     
   armeb     |        fstrcmp-0.7.D001        | NOK | http://autobuild.buildroot.net/results/d11c45c153e800a8cc3df1e123a7d8a783cdbaf0 |     
   arceb     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/05a5496495e51da2c9caf7570695cc95e1745e30 |     
  aarch64    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/2f00f6a1623a31915eccb252d802eb159c72c062 |     
 powerpc64   |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/a744139da6e35ebc4e43686dd27411c7da2dff72 |     
  powerpc    | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/c330fa1fffad9e3116a56553f24dcccca8e77b8a |     
  powerpc    | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/5bd6f4648cdd265e31aa9ec8885a1faa3737d9a8 |     
    arc      | glibc-2.36-81-g4f4d7a13edfd... | NOK | http://autobuild.buildroot.net/results/0a19ed9bb2720e7b6949112c977461dce8e1f415 |     
    or1k     |         glibmm-2.68.2          | NOK | http://autobuild.buildroot.net/results/4962e1ffc531ea51188bba681bd31c7f2e9654d8 |     
  riscv64    |           gmp-6.2.1            | NOK | http://autobuild.buildroot.net/results/cf6f748ce250998efed7de540d5082edc891452c | ORPH
  riscv64    |           gmp-6.2.1            | NOK | http://autobuild.buildroot.net/results/238f7f0d4fe848395c0c903c3f1f10e942ebcef2 | ORPH
powerpc64le  |          gnupg2-2.4.0          | NOK | http://autobuild.buildroot.net/results/d8e26edefea364fc809f45bd04cd80df1e81be57 |     
   s390x     |          gnupg2-2.4.0          | NOK | http://autobuild.buildroot.net/results/3b44d03d4e043d6ab067fa700382b6e4ae43910d |     
   armeb     |          gnupg2-2.4.0          | NOK | http://autobuild.buildroot.net/results/3c27029acf6b3ac6143c3a4f1abd555687f374f7 |     
   nios2     |          gnupg2-2.4.0          | NOK | http://autobuild.buildroot.net/results/84ad3f2c009dfc9a1283bf0e39ce38fb7476548c |     
    i686     |          gnupg2-2.4.0          | NOK | http://autobuild.buildroot.net/results/e869d10ac406980f88cf1623ffe52454517d8de7 |     
    or1k     |          gnupg2-2.4.0          | NOK | http://autobuild.buildroot.net/results/796f589ef1100597b0160c5d2413f5a7d67c31fe |     
  sparc64    |          gnupg2-2.4.0          | NOK | http://autobuild.buildroot.net/results/859bf641d81cd93274655babaa54d926a4cd6f6b |     
   mips64    |          gnupg2-2.4.0          | NOK | http://autobuild.buildroot.net/results/7b90d6946193b5b190feeafc0b446c59b1629090 |     
  sparc64    |          gnupg2-2.4.0          | NOK | http://autobuild.buildroot.net/results/65e0663c8f2f0ad4130c75f827fb7dabd0613dc7 |     
   armeb     |          gnupg2-2.4.0          | NOK | http://autobuild.buildroot.net/results/4cae2ca1016e7c3638fe027796aa8390b78bbcb3 |     
   sh4aeb    |          gnupg2-2.4.0          | NOK | http://autobuild.buildroot.net/results/4beb3d78b8ae1ba34345406968f958d1b2bd87ed |     
   mips64    |          gnupg2-2.4.0          | NOK | http://autobuild.buildroot.net/results/9cf43311db661ffc8f4dd772d24a78cbcdc74c8d |     
    arm      |          gnupg2-2.4.0          | NOK | http://autobuild.buildroot.net/results/c1228589072383ed28741ee76a57f9f4d8ea9f72 |     
  sparc64    |          gnupg2-2.4.0          | NOK | http://autobuild.buildroot.net/results/1ae538e5eb074945a99beb1ae289af8e2a1cb6de |     
  sparc64    |          gnupg2-2.4.0          | NOK | http://autobuild.buildroot.net/results/f17b1c257696f43b00ff196291a8c489add421ed |     
    i586     |          gnupg2-2.4.0          | NOK | http://autobuild.buildroot.net/results/6436465cec15394e834ec6c0aa7c9ea0e5c7f08e |     
   x86_64    |          gnupg2-2.4.0          | NOK | http://autobuild.buildroot.net/results/b970eebd9d0e5fab2387c952c1a959f26a9b6a31 |     
  aarch64    |          gnupg2-2.4.0          | NOK | http://autobuild.buildroot.net/results/6d48bef6174c55201b824ed46f31a16ed9e6d841 |     
powerpc64le  |          gnupg2-2.4.0          | NOK | http://autobuild.buildroot.net/results/cbe66ca39b678b9a05e700394b1272949ea38a4b |     
   mipsel    |          gnupg2-2.4.0          | NOK | http://autobuild.buildroot.net/results/fc4960d37ca0a2d2ba257ec846c2c965afb9ec8c |     
  aarch64    |          gnupg2-2.4.0          | NOK | http://autobuild.buildroot.net/results/423c3ce7317c181e9f2e4a49b76ee9d26167375c |     
    mips     |          gnupg2-2.4.0          | NOK | http://autobuild.buildroot.net/results/dfd2fe3f4b20d68b4de1ef028f7ddca34aee4293 |     
   armeb     |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/73a31f21c8434e9fbecd1bee671aaa119ecf76fc |     
   s390x     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/315c8f61097e5e95c74fa4ac343adedb032864a1 | ORPH
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/45c942f63be141258e3424661d044847dc62cacf | ORPH
    or1k     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/8e2830acdd33b062bad5b95f68f9fc31299741e6 | ORPH
    or1k     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/8797e00a5a77c4002f4655ff73f9d51f3f72dae9 | ORPH
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/0181ede6b23475f3d329964fad0cda9552b837e3 | ORPH
 microblaze  |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/687d3cca0dbe563b18492fb0b1320b316e1647af | ORPH
   x86_64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/d88e5873c1c2941e99da381e32ef3c4b9c94d1f7 | ORPH
 powerpc64   |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/2b965a8f0c745a0c75214270e0376ca70a698115 |     
 microblaze  |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/51f8b51fe1efdbaacae7ae7d6a0b7caa2ca6bc54 |     
powerpc64le  |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/ab738a475197bc1fcff01417b3dbac27361f2eb7 |     
  riscv32    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/e37236b2a4cee0c7b516fea268dfa0399e3ce660 |     
   armeb     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/64faa949e7ff158b2933b5821ac69f5c03061f15 |     
    i686     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/baa326b439fd73b93b0ed230fb8ae241ab07fc2f |     
   xtensa    |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/ef80c5b74c50f8818593ba2c6c5a7079aaa6f6b1 |     
 microblaze  |     host-gcc-final-12.2.0      | NOK | http://autobuild.buildroot.net/results/7d3af92ecdd0d2b3368613f0589441e09bd1df0a |     
    arc      | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/4493456d770626e0c25d8c745b6ba4bb8436b505 | ORPH
    i686     |         host-go-1.19.6         | NOK | http://autobuild.buildroot.net/results/74c9f936abfdeb902c877bc26a0b6708c1c65252 |     
  riscv64    |         host-go-1.19.6         | NOK | http://autobuild.buildroot.net/results/4692170071917f15705f38626cee110c7080ef22 |     
  mips64el   |         host-go-1.19.6         | NOK | http://autobuild.buildroot.net/results/60dcd75ecc6e431866e0f0286a98dd3f73b091a0 |     
  riscv64    |         host-go-1.19.6         | NOK | http://autobuild.buildroot.net/results/bd13eea42c1f96fda351468c54c9979fd14bd24c |     
    i686     |         host-go-1.19.6         | NOK | http://autobuild.buildroot.net/results/ab6a0a608ca1031e6904a26fda045be82317b06e |     
   mips64    |     host-libarchive-3.6.2      | NOK | http://autobuild.buildroot.net/results/335fa5e50d33abf1a297b358b657330f988097c0 |     
  aarch64    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/f1332647f60c8a9601960a311b8b2946d43b8ab5 |     
   armeb     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/1a73b7f0c727d941a15b531b75a944034cb3136f |     
   armeb     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/afaf2bfe881edb4e6ad06b66b14499cdf2f91685 |     
   mipsel    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/53c0d407578ea83da7f4eab90a72a5c9185beb21 |     
   arceb     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/ea7b461d2dec6ea6c15763752c432072c256d5ca |     
    or1k     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/2541c2063f262ac6a6bf2528534569ef780f62d0 |     
   sparc     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/5f5951fa21b867465408afb93a4dc6f865eaa200 |     
   mips64    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/41172aa86d3eaee131386db020d008ddb9869190 |     
powerpc64le  |        host-rust-1.67.0        | NOK | http://autobuild.buildroot.net/results/3cdd9861919a19616938b09cd8290627ce79c44a |     
   x86_64    |        host-rust-1.67.0        | NOK | http://autobuild.buildroot.net/results/d90faa5e58245a58e18265076884991de0b60428 |     
  aarch64    |        host-rust-1.67.0        | NOK | http://autobuild.buildroot.net/results/d7c16bc32dccf66ae634ff7ddeded47dad4dbc73 |     
   x86_64    |        host-rust-1.67.0        | NOK | http://autobuild.buildroot.net/results/db4c7f2fd90f944e977c7280057c0ac8382fb890 |     
 aarch64_be  |          janet-1.26.0          | NOK | http://autobuild.buildroot.net/results/90ac4467a9eacd28644a6f710d669567af1fa7b6 |     
   x86_64    |            kmod-30             | NOK | http://autobuild.buildroot.net/results/b31ae705e641135885c0678746db20185e1b60b3 |     
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/fd5a15ecaffa7664f9dee0258431a50561984565 | ORPH
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/1e9116d09dd96b95d974c8e5819ede33b5299cac | ORPH
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/8060b102c4e08e61c2739e880bfb588be8ce6813 | ORPH
    arm      |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/2985be716aaee664970def0d197d2a08fe496fcc | ORPH
    arm      |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/062fc71dace7710aa494acc91f0332dd5252f6a4 | ORPH
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/91142f574ae5f5dce2e4bc5739c1d7086f04a1a9 |     
   mipsel    |         libglvnd-1.4.0         | NOK | http://autobuild.buildroot.net/results/48f1a59384bf8bffb246667973af8d1bf52376fa | ORPH
 aarch64_be  |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/6d6061c382efc6e78056a890290330e5fe29bc72 | ORPH
  aarch64    |       libgpg-error-1.46        | NOK | http://autobuild.buildroot.net/results/fe41886cb54906406b06789579d0256888b684ae | ORPH
   arceb     |         libhid-0.2.16          | NOK | http://autobuild.buildroot.net/results/920d45d47decea8f6eb652fa49d0d5be3f01bddc | ORPH
    i686     |          libjxl-0.7.0          | NOK | http://autobuild.buildroot.net/results/f02e042d79342a6744913634368d57db76c9bcdd |     
    or1k     |          libnfc-1.8.0          | NOK | http://autobuild.buildroot.net/results/7f33b9ce81d6cf9a3747e8d05644120db8ad230d |     
   armeb     |         libressl-3.6.2         | NOK | http://autobuild.buildroot.net/results/fc2d4e894dde11d674244e1de65658f03072eeb5 | ORPH
  powerpc    |        libsigsegv-2.14         | NOK | http://autobuild.buildroot.net/results/13b0a59d8a36ddef725833743b15d7aa02a1f264 |     
   mips64    | libuci-4b3db1179747b6a67790... | NOK | http://autobuild.buildroot.net/results/789e03372b064b8221f614fb27364360fda12e3c |     
   x86_64    |         libxml2-2.10.3         | NOK | http://autobuild.buildroot.net/results/985527a0e59f6b4a10faf73c722150dfb0f00f6c |     
  mips64el   |         libzlib-1.2.13         | NOK | http://autobuild.buildroot.net/results/81941196257cdb218b1123768c33a341a4493861 | ORPH
   mipsel    |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/420a406571a2ce4fd66487c279e8cc4e87a3f0d8 | ORPH
   mips64    |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/fac1943e4046a2fe48d99997ca247bd1d15a9ad9 | ORPH
  mips64el   |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/ee8f3dccfeb35ff375a13c34bb94480529cb61ed | ORPH
   mips64    |          linux-6.1.11          | NOK | http://autobuild.buildroot.net/results/c338222a16e9234d376f5c5201e51e8c5faa484f | ORPH
   mips64    |          linux-6.1.11          | NOK | http://autobuild.buildroot.net/results/ceb8385819ceb0852734d449c01c7ca0b962a9b1 | ORPH
  mips64el   |          linux-6.1.11          | NOK | http://autobuild.buildroot.net/results/4d29e21605bf51392c224ae08c0c09853754bae3 | ORPH
  powerpc    |          linux-6.1.11          | NOK | http://autobuild.buildroot.net/results/5ec4068bce62e2fb574a74ea378a5e7b9cfee8cc | ORPH
    m68k     |          linux-6.1.11          | NOK | http://autobuild.buildroot.net/results/b96f0de25f0c80476b2b126da97a2392b3c30cca | ORPH
    m68k     |          linux-6.1.11          | NOK | http://autobuild.buildroot.net/results/37562596eed2062810b17d3acf7df0a7ee155b53 | ORPH
powerpc64le  |          linux-6.1.11          | NOK | http://autobuild.buildroot.net/results/67a8445a91e3690928175227e1d02a464912e813 | ORPH
   arceb     |          linux-6.1.11          | NOK | http://autobuild.buildroot.net/results/47c0dd8d1cad8b8c300a5defedd3cb93228fac84 | ORPH
   x86_64    |       linux-fusion-9.0.3       | NOK | http://autobuild.buildroot.net/results/7b5bbca45822f8cb23cd02861eadf3c37842e2eb | ORPH
  mips64el   |          linux-tools           | NOK | http://autobuild.buildroot.net/results/5b56a9ad46cd114975a0a2ea3811564dde453bf9 | ORPH
  sparc64    |       lirc-tools-0.10.2        | NOK | http://autobuild.buildroot.net/results/0ebe0926d6cb2ee73e01c714c8dceddccb425d8f | ORPH
   x86_64    |     ltp-testsuite-20220930     | NOK | http://autobuild.buildroot.net/results/86832d4a359711189a9e648cff3db9a997b68ebd |     
 aarch64_be  |           lxc-5.0.2            | NOK | http://autobuild.buildroot.net/results/f383cfa5aa32594e01a0b8694bc2532d038c258a |     
   nios2     |          matio-1.5.23          | NOK | http://autobuild.buildroot.net/results/7b98c54cc0cbc4e41648b1a9266f5f1d48b3a16a |     
  mips64el   |     multipath-tools-0.9.4      | NOK | http://autobuild.buildroot.net/results/fe006217b96f544f3bd495db1b842ba7ceb92c94 |     
powerpc64le  |          netsurf-3.10          | NOK | http://autobuild.buildroot.net/results/44d196af7f55d8b08f56bbc5d0c585a7dba1b8bb |     
   mipsel    |          netsurf-3.10          | NOK | http://autobuild.buildroot.net/results/d6f9379b928846d8d386249467c0ddd7ecdfd80d |     
    i686     |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/5acdafd55e06368d2cc9fe628084130516c85e69 | ORPH
 microblaze  |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/6c5a33c16b5a3505887dcebd02f3a93c6d619ada | ORPH
   x86_64    |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/6643c7f0130085aee38cf912f504a81161f390d9 | ORPH
   mipsel    |         openal-1.22.0          | NOK | http://autobuild.buildroot.net/results/5b18d2c4ec5df4b51827e29239d2bb192a5eefb5 | ORPH
  mips64el   |        openblas-0.3.21         | NOK | http://autobuild.buildroot.net/results/85a743146f1604329aa6326e57e41bcf32aec585 | ORPH
   armeb     |           opus-1.3.1           | NOK | http://autobuild.buildroot.net/results/df2741ea654aa5e3165e0617c162acacc76ed12a | ORPH
   sparc     |          pcre2-10.42           | NOK | http://autobuild.buildroot.net/results/d8246c9e3e54547cdb7d94dcdbf376d292dfd787 | ORPH
   armeb     |           php-8.2.2            | NOK | http://autobuild.buildroot.net/results/20b64a465602070531d114aec41b1a7c940c3a94 |     
 microblaze  |           php-8.2.2            | NOK | http://autobuild.buildroot.net/results/acdbed0d4a20049edc72d6250e7bedc011daa398 |     
   mipsel    |        php-xdebug-3.0.4        | NOK | http://autobuild.buildroot.net/results/d5800324f85d0227e28ebedbd83a24fecb65d580 |     
   arceb     |         proftpd-1.3.8          | NOK | http://autobuild.buildroot.net/results/2aba5297206e44dc086c3138ace70e85739196f3 | ORPH
    i686     |      python-numpy-1.23.5       | NOK | http://autobuild.buildroot.net/results/f3db763c41d9abcd7ed35c8aad11d7842c901182 |     
   x86_64    |         python3-3.11.1         | NOK | http://autobuild.buildroot.net/results/61d61b1523b1b498b6af5d3088fc348c51421f7a |     
  riscv32    |           qemu-7.2.0           | NOK | http://autobuild.buildroot.net/results/a742f4f67f82650623d3644e963e3df507762251 |     
    sh4a     |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/610498fac72a7abd2b48fc4fd6f9698d370b9492 | ORPH
   armeb     |        sigrok-cli-0.7.2        | NOK | http://autobuild.buildroot.net/results/e4fb9180c9f4ba2643a3e4a588f37a450b041913 | ORPH
powerpc64le  |         snmppp-3.4.10          | NOK | http://autobuild.buildroot.net/results/82ea09ff86c99a6e603a6d0ff778ee40e008eab7 |     
   arceb     |         speechd-0.11.4         | NOK | http://autobuild.buildroot.net/results/5f721b45674f59f00d0e411c679b31af7cc24eaf |     
   arceb     |         speechd-0.11.4         | NOK | http://autobuild.buildroot.net/results/b9807d227d15fa5cf25f283cd9244b6384aa97d6 |     
    mips     |         speechd-0.11.4         | NOK | http://autobuild.buildroot.net/results/0c2983cb9df393c372755c86a78b6c1c7089d56e |     
powerpc64le  |         speechd-0.11.4         | NOK | http://autobuild.buildroot.net/results/d4f193545eb31864a9bac5a9d05bba39d3c7ff3e |     
   s390x     |         speechd-0.11.4         | NOK | http://autobuild.buildroot.net/results/fcd2f54c9240862b9ad38382c9f1d19e0eb6486b |     
 powerpc64   |         systemd-252.4          | NOK | http://autobuild.buildroot.net/results/66b0855d63c430d09acd1227ee9446a5ae5f6211 |     
    arm      |         systemd-252.4          | NOK | http://autobuild.buildroot.net/results/56eb99f0ef56b3d684c0445ebd25ded901e469d0 |     
  sparc64    |         systemd-252.4          | NOK | http://autobuild.buildroot.net/results/043ca336d4abb6ae147a0d43a5bd82b847885b2f |     
powerpc64le  |       uccp420wlan-6.9.1        | NOK | http://autobuild.buildroot.net/results/062cebb8270da8a5e16159feb842514552de1128 | ORPH
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/834d4b406f8bea568d66621133125180052bc609 |     
  sparc64    |            unknown             | NOK | http://autobuild.buildroot.net/results/12a0a903182973ab144780eb80297af03dd5dbc3 |     
    mips     |            unknown             | NOK | http://autobuild.buildroot.net/results/0af8d180dc52c00e6fc27d52c8e2c94d766a7d5d |     
  sparc64    |            unknown             | NOK | http://autobuild.buildroot.net/results/f96e5c09ed4b56b9fa712d7f292af43541c34757 |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/8b56820cba16eb235f5d7c16cc16200ceb71049d |     
powerpc64le  |            unknown             | NOK | http://autobuild.buildroot.net/results/d86be9c08ce7da8441c6e4c82d25da6910ad26a7 |     
   arceb     |            unknown             | NOK | http://autobuild.buildroot.net/results/9b450c6ba85bb6dfb6380eec96d09992c2759d6e |     
    mips     |        valgrind-3.19.0         | NOK | http://autobuild.buildroot.net/results/96895ad8942b5ac1932e753fd834feabd714af4d | ORPH
  powerpc    |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/9759584ad48b9681e3454dba90676ffda01801c6 |     
    sh4a     |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/dc35a189de39244dc49f5a6f98c1c277fd704b80 |     
   mipsel    |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/891319a108654aede38fa5126986d534b2b0fd6e |     
   mipsel    |        xfsprogs-5.14.2         | NOK | http://autobuild.buildroot.net/results/794f292edc659d48369412594e4596ef0e6866ac | ORPH
powerpc64le  |          zabbix-6.2.7          | NOK | http://autobuild.buildroot.net/results/e74056c2c6c2f26762b4475f9a42b7807a4143fd |     
  mips64el   |        zxing-cpp-1.4.0         | NOK | http://autobuild.buildroot.net/results/e62a38b7a477a66708fc2cd2cd9970ae9c20402b |     


Classification of failures by reason for 2022.11.x
--------------------------------------------------

              host-pahole-1.24 | 1 
              libgcrypt-1.10.1 | 1 
                   libnss-3.84 | 1 
                    mutt-2.2.9 | 1 
            ocf-linux-20171122 | 1 
                opencv3-3.4.17 | 1 
           python-numpy-1.23.4 | 1 
                       unknown | 1 
                  xxhash-0.8.1 | 1 


Detail of failures for 2022.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 aarch64_be  |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/4ddfb0c52b4efc2d49ca7e7c76bbe7e53cb0089e |     
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/c801955a73c2c35477dadc2747b072318104434d | ORPH
microblazeel |          libnss-3.84           | NOK | http://autobuild.buildroot.net/results/203ccf8d98b24b9718c574c58c64730b21b2d848 |     
powerpc64le  |           mutt-2.2.9           | NOK | http://autobuild.buildroot.net/results/a820eb613005019b35c99e39f3aca2a155e26897 |     
  aarch64    |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/2b4e3590d3817872b26efa3ec53cd2d3c1e479f9 | ORPH
    m68k     |         opencv3-3.4.17         | NOK | http://autobuild.buildroot.net/results/342d7be42ae065ec0c8207b1a13d981ad6eb753b |     
   mipsel    |      python-numpy-1.23.4       | NOK | http://autobuild.buildroot.net/results/dbfcdfb804ff149f2500c20ace66c134e554df36 |     
  riscv32    |            unknown             | NOK | http://autobuild.buildroot.net/results/3ce8a2d5073edddcc51ae5d81ec331be6d883d00 |     
microblazeel |          xxhash-0.8.1          | NOK | http://autobuild.buildroot.net/results/5226bbbd354ed3865a30df1b395705072c2b68d2 | ORPH



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
