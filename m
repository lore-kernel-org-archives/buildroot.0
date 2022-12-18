Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8A33C4332F
	for <buildroot@archiver.kernel.org>; Sun, 18 Dec 2022 06:40:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1D7B781467;
	Sun, 18 Dec 2022 06:40:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1D7B781467
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L8LiXTM8vFbR; Sun, 18 Dec 2022 06:40:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E021D81468;
	Sun, 18 Dec 2022 06:40:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E021D81468
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 330EB1BF406
 for <buildroot@lists.busybox.net>; Sun, 18 Dec 2022 06:40:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 02E4D404F7
 for <buildroot@lists.busybox.net>; Sun, 18 Dec 2022 06:40:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 02E4D404F7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id abJJm0FsWQO3 for <buildroot@lists.busybox.net>;
 Sun, 18 Dec 2022 06:39:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 31A7F4043A
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 31A7F4043A
 for <buildroot@buildroot.org>; Sun, 18 Dec 2022 06:39:58 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 49F906000D
 for <buildroot@buildroot.org>; Sun, 18 Dec 2022 06:39:56 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sun, 18 Dec 2022 06:39:56 -0000
Message-Id: <20221218064003.02E4D404F7@smtp4.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1671345596; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=prutp2KMTu4plzth5C0GmSICGB2ik3TUh4SAuW3SCXQ=;
 b=BiYiey93x9jh+kfrQ9P5wY/cv6f6I5ja1+DKjv3bsAwoM99qUjHhLqV7xj2m1T0SpYFiF1
 onqgR5UoDC6zOps7Tw9pgUadBuKBJ9aDgfhZuQMuoDZsLwYr88Si6pW0v+NQvnD4hpRycG
 1K7GbQ4USkzEMG+IBpeXPZbdqYxuqWgzoRq+r/dW25lzWdT9w6y3WE2/1SEC8qTR4ANHWA
 GHt26abQJAe/wc5VEvqAiFWaR4E/K1xE++J+/HK2t7FvpXotxS7ATfy/Dmtu1Lewydq7Od
 v0ePzmKHT48M3SNUR2elMG7Woj6CmG6y+aSRzhWbgAA3g3xHsVx5T8SFdCg63w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=BiYiey93
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-12-17
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

Autobuild statistics for 2022-12-17
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  |  7  |  3  |  0  | 10  |
  2022.11.x  | 10  | 16  |  0  | 26  |
    master   | 187 | 387 |  0  | 574 |

Classification of failures by reason for master
-----------------------------------------------

                   aubio-0.4.9 | 35
               host-fwup-1.9.1 | 34
host-go-bootstrap-1.4-boots... | 34
                    fwup-1.9.1 | 16
                    pixz-1.0.7 | 13
            host-binutils-2.38 | 10
                     xz-5.2.10 | 9 
glibc-2.36-66-ga1dc0be03c9d... | 8 
           host-libzlib-1.2.13 | 8 
               libglib2-2.72.3 | 8 
                    opkg-0.4.5 | 8 
                   gvfs-1.48.1 | 7 
              host-pahole-1.24 | 6 
              host-rust-1.65.0 | 6 
                    norm-1.5.8 | 6 
                  davfs2-1.7.0 | 5 
                elfutils-0.186 | 5 
                  linux-6.0.12 | 5 
    python-cryptography-38.0.4 | 5 
                       unknown | 5 
                    bat-0.19.0 | 4 
                host-m4-1.4.19 | 4 
    host-python-greenlet-2.0.1 | 4 
                  jack2-1.9.21 | 4 
               libdeflate-1.15 | 4 
                lmbench-3.0-a9 | 4 
                    crun-1.7.2 | 3 
                     frr-8.3.1 | 3 
                gerbera-1.10.0 | 3 
gummiboot-2bcd919c681c952eb... | 3 
                host-go-1.19.4 | 3 
              libostree-2022.6 | 3 
        ltp-testsuite-20220930 | 3 
            ocf-linux-20171122 | 3 
                   perl-5.34.1 | 3 
                    proj-8.1.1 | 3 
                    brltty-6.5 | 2 
                 dmalloc-5.6.5 | 2 
                     efivar-38 | 2 
  gobject-introspection-1.72.0 | 2 
host-gobject-introspection-... | 2 
              libgcrypt-1.10.1 | 2 
             libgpg-error-1.45 | 2 
                libkcapi-1.4.0 | 2 
                   libnl-3.7.0 | 2 
      linux-5.10.145-cip17-rt7 | 2 
             lirc-tools-0.10.2 | 2 
                    musl-1.2.3 | 2 
                  sscep-0.10.0 | 2 
                 uclibc-1.0.42 | 2 
/home/buildroot/autobuild/i... | 1 
                     ace-7.0.6 | 1 
afboot-stm32-3566acd582e553... | 1 
android-tools-4.2.2+git2013... | 1 
bayer2rgb-neon-15feb1115b48... | 1 
                  bind-9.16.33 | 1 
                  boost-1.80.0 | 1 
                  check-0.15.2 | 1 
             containerd-1.6.12 | 1 
dawgdic-16ac537ba9883ff01b6... | 1 
              dieharder-3.31.1 | 1 
               ding-libs-0.6.2 | 1 
               domoticz-2022.1 | 1 
                     exim-4.96 | 1 
                  faad2-2.10.1 | 1 
       freeradius-client-1.1.7 | 1 
fs/cramfs/cramfs.mk:46: /ho... | 1 
fs/ubi/ubi.mk:51: /home/aut... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /tmp/... | 1 
                 fwts-22.09.00 | 1 
            gdk-pixbuf-2.42.10 | 1 
                     gmp-6.2.1 | 1 
                 hddtemp-0.4.3 | 1 
                host-acl-2.3.1 | 1 
            host-binutils-2.39 | 1 
          host-fakeroot-1.30.1 | 1 
         host-gcc-final-11.3.0 | 1 
                 host-lzo-2.10 | 1 
            host-pkgconf-1.6.3 | 1 
         host-sentry-cli-2.8.0 | 1 
              hyperfine-1.14.0 | 1 
                  kexec-2.0.25 | 1 
      libabseil-cpp-20220623.1 | 1 
               libbytesize-2.7 | 1 
                libdnet-1.16.1 | 1 
                libglvnd-1.4.0 | 1 
                libmad-0.15.1b | 1 
                   libnss-3.85 | 1 
                 libpqxx-6.4.5 | 1 
              libtommath-1.2.0 | 1 
              libuhttpd-3.14.1 | 1 
               libvorbis-1.3.7 | 1 
                libzlib-1.2.13 | 1 
          linux-5.10.145-cip17 | 1 
                  mender-3.4.0 | 1 
                 nerdctl-1.0.0 | 1 
                  netsurf-3.10 | 1 
                  nginx-1.20.1 | 1 
                     nmap-7.92 | 1 
              open62541-v1.3.3 | 1 
                   opensbi-0.9 | 1 
           optee-client-3.19.0 | 1 
package/vuejs-router/vuejs-... | 1 
               pcsc-lite-1.9.9 | 1 
pistache-3ec9d7c4f8b828fdd3... | 1 
                      poke-2.4 | 1 
            python-bunch-1.0.1 | 1 
           python-numpy-1.23.5 | 1 
            quickjs-2021-03-27 | 1 
        s6-linux-utils-2.6.0.0 | 1 
                    sdl-1.2.15 | 1 
                  tbb-2021.5.0 | 1 
toolchain-external-codescap... | 1 
toolchain-external-codescap... | 1 
           uboot-tools-2021.07 | 1 
             uccp420wlan-6.9.1 | 1 
                   uhd-4.3.0.0 | 1 
ulog-0389d243352255f6182326... | 1 
uqmi-0a19b5b77140465c29e2af... | 1 
                  zabbix-5.4.9 | 1 
                 zlib-ng-2.0.6 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/b01e1ca42e449774008f7307ddade42ccf5b1548 |     
microblazeel |           ace-7.0.6            | NOK | http://autobuild.buildroot.net/results/ad61069b9af925f797533783319f83c841d150bd |     
    arm      | afboot-stm32-3566acd582e553... | NOK | http://autobuild.buildroot.net/results/5f9cb3cd51053049109834192e2c4daba3b7d3ac |     
powerpc64le  | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/760acaa4547a3f374156f8d18910af41387e02e1 |     
 aarch64_be  |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/f691e4cf9db6b0cb08432b9b15f6b6ce201b29cf |     
powerpc64le  |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/4ba6ff026204b74ff0f81e9e300d6b6db3855e7d |     
   xtensa    |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/3aee2532c30a244c1a370f088b6508249bc769e5 |     
   sparc     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/056d100e7301225d2475d7d36fb267f301c4f035 |     
    arc      |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/cb1c7eb2f155d1e8fbeafac839beab963d5e61fc |     
   xtensa    |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/ed655680eeb47037d857e7f7991f7a2822f90aa7 |     
   sh4eb     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/9277cc33f377a0b934a282cf5b3e580bcdcc1ebb |     
  mips64el   |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/a8f3ec435827131c114356072f98b346e7e67570 |     
microblazeel |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/33871f31c9ada1c497723c6fec943a5c0d534886 |     
    or1k     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/aaf093cda1ddc57c204de07416eec4ad626037e1 |     
    sh4a     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/af0f2baf9b7f677777cd5f5ff720a9ee90ab96b6 |     
  mips64el   |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/db911a718f6ac76dbd79d0c7652e33a76afb883f |     
   mips64    |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/0c0fb8b95348588b5fd97c0b966165af16973bf3 |     
    mips     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/faaad6c820b1e7eb6f8d61cd5cbae1d29f3db79d |     
    arm      |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/00536dc845d361c76290884ceace59966db95b9f |     
microblazeel |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/291ee406aa2c530fe497a22cc2796e6ba89cc93b |     
  aarch64    |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/71275a60ae3366091709228486af864225967bc6 |     
    arm      |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/9da78b80c8d36948a134429887130313fc2fbce0 |     
  sparc64    |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/2de8ae8538e2e4a9dfaa66ee548fffe1ca331f2b |     
    arm      |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/daea0082fb2416157d6da551a6b5777d3a73519c |     
    i686     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/0ab6c3877f16ba53c2e965563cf0abefc52c7ff5 |     
    arm      |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/4463e918772c4dc780f67c02385dbadd5b7e54a1 |     
    arc      |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/db58e4bbd030fb87c563cc30df2bfddb975bf51e |     
    arm      |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/86b4b30066e0e7abdcdf8f0749a5a41e3a108cea |     
 microblaze  |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/5def200be76b68e12c684e1fb7625b0073ca53b7 |     
    m68k     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/388a063ef962fe05f7f5c0d4df42930d1f315a40 |     
  mips64el   |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/bfc65e97677d2a2bf7a451a4c1742ca422141ba3 |     
   s390x     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/7705372622e6c7a424c6c6f84d3d7334240ae32c |     
   mipsel    |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/555a0688e741cb8ea82d3a6f8dfc3bdd94bcbe40 |     
 powerpc64   |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/f7af6428b64fe11dbf0f454ab61bd84ac151eaf3 |     
  aarch64    |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/f275973e1d61ca7a71764e6aaa79f41867b62386 |     
    arm      |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/930560a2e6835815e99b63e25455c6fd8165a1ca |     
   sparc     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/0244a46342c523dfd950bb540fa1b7f974ff12ed |     
 microblaze  |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/2061f0916a1f743a001d68b65917388d54c274cd |     
 powerpc64   |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/1b71f0de34ecffa1080802336ab9ce388b18f212 |     
    i686     |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/935185c81ada51a6ce92d55f7a80cbe86b6345c9 |     
    i686     |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/c41ebd8d910f65b512c3b52732ffd2d29ad74632 |     
powerpc64le  |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/3c9e6adb46201b804f2d8c1d467f7136b25f38ae |     
    i686     |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/48ecb9e6415db3cfc1f7415efd34afe16a9ff9c2 |     
  aarch64    | bayer2rgb-neon-15feb1115b48... | NOK | http://autobuild.buildroot.net/results/60434515e403bd1bf998a355bf149dd64f3820af |     
    sh4      |          bind-9.16.33          | NOK | http://autobuild.buildroot.net/results/035fc5fc0185d40b1c9cf41a96e15821096842ad | ORPH
    arc      |          boost-1.80.0          | NOK | http://autobuild.buildroot.net/results/c95ff52b15a7a153096c57d81f9116b17130d173 |     
 aarch64_be  |           brltty-6.5           | NOK | http://autobuild.buildroot.net/results/e1f5f2908090584b6a1d62cf93281704d8b6c5d1 |     
powerpc64le  |           brltty-6.5           | NOK | http://autobuild.buildroot.net/results/e3ee7b1fe5d4dd7eb398055a0e0a3c0506550b63 |     
  riscv32    |          check-0.15.2          | NOK | http://autobuild.buildroot.net/results/67ecc318a002f4890471e8e28a02eed0587c6522 | ORPH
powerpc64le  |       containerd-1.6.12        | NOK | http://autobuild.buildroot.net/results/a0c565c75e8fcbe2c2e2ba4c6a8865b900754468 |     
  riscv64    |           crun-1.7.2           | NOK | http://autobuild.buildroot.net/results/303d912c002ec876d9a929c17a703efe17ecb802 |     
    arc      |           crun-1.7.2           | NOK | http://autobuild.buildroot.net/results/bfc52f12d516a5ddc21a6c4a5787129e182db3d2 |     
microblazeel |           crun-1.7.2           | NOK | http://autobuild.buildroot.net/results/d603e18ec6a41c06b2f508a72e611e539da7c743 |     
    arm      |          davfs2-1.7.0          | NOK | http://autobuild.buildroot.net/results/1b6a87aab1b4da7f302b4e795b6ebb2123527ca1 | ORPH
   sparc     |          davfs2-1.7.0          | NOK | http://autobuild.buildroot.net/results/725ff86efd8c7a722830962623c1d721f2b30586 | ORPH
 aarch64_be  |          davfs2-1.7.0          | NOK | http://autobuild.buildroot.net/results/903282a98a4456bf0e970c6959d7d15691e811f3 | ORPH
    or1k     |          davfs2-1.7.0          | NOK | http://autobuild.buildroot.net/results/aa9951e68790ad82697d7ade45ce84f4ff315e5a | ORPH
   sparc     |          davfs2-1.7.0          | NOK | http://autobuild.buildroot.net/results/062940fc7d8751869aec44ccc1d3682e033aefc7 | ORPH
  riscv64    | dawgdic-16ac537ba9883ff01b6... | NOK | http://autobuild.buildroot.net/results/a47d8717a4aa67af321c73e8569fa5ea1395bb9f |     
microblazeel |        dieharder-3.31.1        | NOK | http://autobuild.buildroot.net/results/158450aa4bd175fdb7f39a4081876dfb53d7bec7 |     
   arceb     |        ding-libs-0.6.2         | NOK | http://autobuild.buildroot.net/results/ebed293ed4c684a37021888630724790ae7bae40 |     
  powerpc    |         dmalloc-5.6.5          | NOK | http://autobuild.buildroot.net/results/f0fe3884d5af1150b6453fb5f9b74bfe9c686300 | ORPH
  powerpc    |         dmalloc-5.6.5          | NOK | http://autobuild.buildroot.net/results/eaa8848100d669c9629e635b1e6e01260eedbd47 | ORPH
  sparc64    |        domoticz-2022.1         | NOK | http://autobuild.buildroot.net/results/fe67e0527009410847f7c36618f68bf96bb841b5 |     
    arm      |           efivar-38            | NOK | http://autobuild.buildroot.net/results/54ccecef85b868682166ddf68ed3d8b33805cd4f |     
  mips64el   |           efivar-38            | NOK | http://autobuild.buildroot.net/results/6be9a2f9cfcf68851439f3973da264f5a19b3394 |     
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/3e9febe6a807a3aeab26bfbdacd707eb8a5a7204 | ORPH
    or1k     |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/518ad9a7ab2aa07997852fbb7d2ca475c8aa7154 | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/f732594d81cdf5a84a4fce942c2075c3e9cfb22f | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/8b6a470f2963917b08a70760e6c4600d72e32185 | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/4fb4da4a3f83b4acbf9278ee24ed8fd0fe8a25c0 | ORPH
   armeb     |           exim-4.96            | NOK | http://autobuild.buildroot.net/results/0c70c37ced6421046c28df86652f98182f2f930b |     
    sh4a     |          faad2-2.10.1          | NOK | http://autobuild.buildroot.net/results/2dba61a5edc35f1bd1dfe3eadd27a49f13079ee9 |     
  riscv64    |    freeradius-client-1.1.7     | NOK | http://autobuild.buildroot.net/results/ef0efc6651d23a75ba8c1e614488879a6ed33b6a |     
  mips64el   |           frr-8.3.1            | NOK | http://autobuild.buildroot.net/results/b95c7870e3a53c4b7322342cab7d064c57e9d007 |     
  mips64el   |           frr-8.3.1            | NOK | http://autobuild.buildroot.net/results/96b4dabe39e23ef4751010612a8ba512cb4c95d3 |     
  mips64el   |           frr-8.3.1            | NOK | http://autobuild.buildroot.net/results/75b10c3f7da2929df3e3700eaaed5413b1ade047 |     
   sparc     | fs/cramfs/cramfs.mk:46: /ho... | NOK | http://autobuild.buildroot.net/results/a4ee9605be15a3054dda5f2ce1c44198b3ac683f |     
    mips     | fs/ubi/ubi.mk:51: /home/aut... | NOK | http://autobuild.buildroot.net/results/8282047814aadf176bb5b54cf76b4b891ca710d7 |     
  powerpc    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/8e2ef35b571f00902d63334089fe92fb1022d41d |     
   mipsel    | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/078edcdf929c23644a34005c119bd00440cf5d3f |     
    arm      |         fwts-22.09.00          | NOK | http://autobuild.buildroot.net/results/11be713d05a4e228a128fdeaea35042e8d0451f1 |     
    mips     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/c58f80b2685f2df45b15a38966af419da17b44e7 |     
  powerpc    |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/07d59df20093eee7e63649bf71e8592b2ddcad39 |     
    i486     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/54e84c407d31682035db45e91c39e30134df6425 |     
 powerpc64   |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/e0d774b968bb51bf67c370bb424fc98ac16ea23b |     
    or1k     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/02719ef9338133b7e61e1d8ad00a2f9be0e13217 |     
 powerpc64   |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/408e0ff08cea080884814e0b8e92b5c3564d3f3d |     
  mips64el   |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/2b44eaba6ebb88bb2e67ba27fc051589e273dc3a |     
powerpc64le  |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/bd28f1d936b5f9f433906228c648f71c81433377 |     
   mips64    |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/72948423c376df162f84c8f97e3c399064a610c2 |     
   mipsel    |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/dbf3b31161c953fcf055f90fefb00b296f02ff00 |     
  sparc64    |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/60b619c9337811e121a9e71d32233fa1b93d6e57 |     
   mipsel    |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/1d31270921de84a8ffe87e2b1617e3c0b5eab204 |     
  sparc64    |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/52669de787e67866ab6d71f903b7ea90bacb8316 |     
   sparc     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/a8af1f12b49e13a3ec3db7de790dd2130645e7a7 |     
   mipsel    |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/889047581d0c5b86cae76baf99a59bf4f66411ba |     
   s390x     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/e4a573830e38d8936392c0ae78c4adc88fd43dfd |     
  mips64el   |       gdk-pixbuf-2.42.10       | NOK | http://autobuild.buildroot.net/results/e1dc90678a0f03038b4fb769758847308c93692e | ORPH
  sparc64    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/359d194884a9424d80c862c910d8ad9e5856674e |     
  aarch64    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/fbee0947fe800dca28dce0e7153cddd7cf8fe7ba |     
   x86_64    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/0ec0e72bb18a4ece18bc1be5b7355fa29f6d5fa2 |     
  powerpc    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/9bbf4951162cf30cfe0afba6c23e5b56dfe22869 |     
  powerpc    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/ba1d17d740849c3e3564be944f6a7e586835e3a5 |     
  powerpc    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/96b7fab24fce4ce3213dcc908667d052c852bab3 |     
  powerpc    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/b48ab05117e817a39e373b0aa4c429fbb1f30208 |     
  powerpc    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/7079669d71bc2f5e14b63d4fd8591179f6153b93 |     
  powerpc    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/54954b4a1a64211004acb3f909f143ec5013385c |     
  powerpc    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/63bab26e31e65706151aff41ee672a73707f3ac3 |     
 powerpc64   | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/40587fd5868dd00f9406cc918c831d13a71f9522 |     
  riscv64    |           gmp-6.2.1            | NOK | http://autobuild.buildroot.net/results/87405288de3e3a8c186570437f6f9c0a3c53e4d6 | ORPH
   x86_64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/194fb43c4c0e0544ff357dd5976f25649d268236 | ORPH
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/7ce3bf191877a120ebb8aca7be1a7f491686ac21 | ORPH
   x86_64    | gummiboot-2bcd919c681c952eb... | NOK | http://autobuild.buildroot.net/results/f69d40e6fa1edcf145c1623dde0bdec8c6332294 |     
   x86_64    | gummiboot-2bcd919c681c952eb... | NOK | http://autobuild.buildroot.net/results/592f6092dfa85ef0426cc6ffb724cdc6c87e5d16 |     
   x86_64    | gummiboot-2bcd919c681c952eb... | NOK | http://autobuild.buildroot.net/results/619bd4ff84328b4c3c1788f0e91835c71542c00c |     
   x86_64    |          gvfs-1.48.1           | NOK | http://autobuild.buildroot.net/results/3d6794c24b900ddcebd0bf6bdb7626f9580f8f23 | ORPH
   sparc     |          gvfs-1.48.1           | NOK | http://autobuild.buildroot.net/results/2b0e395d4bb0b990b3c24f08db363e5adc8e25de | ORPH
   x86_64    |          gvfs-1.48.1           | NOK | http://autobuild.buildroot.net/results/e7faab943effd82fe6c1ea0ef8e0fae821d987ff | ORPH
    mips     |          gvfs-1.48.1           | NOK | http://autobuild.buildroot.net/results/b3af22acbc7929e6865edcc6f233a133f4d4a030 | ORPH
   armeb     |          gvfs-1.48.1           | NOK | http://autobuild.buildroot.net/results/6908a0a6b4f82de493d0d4570c1f0e8c2c9a3871 | ORPH
 microblaze  |          gvfs-1.48.1           | NOK | http://autobuild.buildroot.net/results/dab8dfeabdfd862cb1329cf8a488d75ce741521a | ORPH
    mips     |          gvfs-1.48.1           | NOK | http://autobuild.buildroot.net/results/64787d6b17bea1a66923f747a81a71ef02b98184 | ORPH
   x86_64    |         hddtemp-0.4.3          | NOK | http://autobuild.buildroot.net/results/bf64383bd349c2a467d012aa0c8ad178d6f5b026 |     
  mips64el   |         host-acl-2.3.1         | NOK | http://autobuild.buildroot.net/results/52eba7a7c672a815665b3bc558b5d42a5205da39 |     
    sh4a     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/e9cf168a0c2615af5c9467dfe3281cae8249fa5e |     
  riscv32    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/4c902bc2877b6531991796d0af172577d587bd79 |     
    or1k     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/67b129b8831efdaa4ed8c4985d0cd68a4aa3ff51 |     
   xtensa    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/4c7d355091a2d8453af39b7f8a85a4b9a32e16b4 |     
microblazeel |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/3ba4ab1297fba70e8d7489181009d23b727f47a9 |     
  riscv64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/aa4ee670dad487b2118c5fa396c0b417005af072 |     
 aarch64_be  |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/82c0d5ef0ad0cb81ca30f9f95d4d98001dc97a62 |     
powerpc64le  |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/113c2a485404f726cbe8d018b8c6858829c3b69b |     
    i686     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/0951862b82809041eab127db5c8ac58715bee08c |     
    m68k     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/c492fd5f2c87f9f501df814414081c38b8577269 |     
  aarch64    |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/50c77915e96adb273ebd0678f0517b6bd83cd54d |     
   sparc     |      host-fakeroot-1.30.1      | NOK | http://autobuild.buildroot.net/results/83d44cf122fd851fda5ef01c267f83fd69ec9b0c | ORPH
    sh4      |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/a98a9f10e4db40c025ba191c887871ac5e573263 |     
   mips64    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/c167df0c4c901de0cae614a8db10548eb0a41838 |     
    i686     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/8d119ee0b5770c559268007d2329063925a6d35c |     
 microblaze  |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/5718aebe9b668e574e8987404a9c97f863c68b00 |     
    arc      |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/9b8e5261cec3f14be7079f8ea3008f2aa8b297c8 |     
   sparc     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/fceda76c2cfb4aee6cbe38d821caddde7afa314d |     
   x86_64    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/57b162320dd075b9709133d4c7dc44133b6892dc |     
    mips     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/0f7cbd129d8a68269e4651aa0c1a8a2ad6e005fe |     
    i586     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/fc44d5eb657be093043eff414940cb36abbef05d |     
   sh4aeb    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/a1ede647d352e37bd34167221dad5896e5168e3c |     
    arc      |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/ea0dfc2bcaaf976badd1912b7bf78cb6fe59a29c |     
 powerpc64   |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/36af2d96107e102e65b9b483e60d244207fb46b7 |     
   sparc     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/0e3500715ac6207641824f3725910c36d4f5e95a |     
   mipsel    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/5292fc98a5eaff78f0cbf81e7938bf244c7b6e7a |     
   mips64    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/c57f7895bbb7b686d52c7a28c0bbf14cc625a9ce |     
    m68k     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/54e1dcc90edb160ca706930c2a6b36be2dbc9c68 |     
    arm      |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/c9d4454c0ffe64695523bf0016a1c56ed70506bf |     
  riscv32    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/f7dbd30454294592db292260ff0f73e960898ca0 |     
  mips64el   |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/f773676e386b6654cc060bf1aa56b9ae00475519 |     
    sh4a     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/fa5202ca955e90e6fb1e528d4dd2368585a80575 |     
   sparc     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/7048090781a6bd4079358fe78083a472310e1c0a |     
powerpc64le  |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/3f94f729b712bafa0a943103a3145dad63862595 |     
   mips64    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/1e88fccbac76328ed7b8d1409f96483168c3c672 |     
 powerpc64   |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/4cf7decc99b6756d8860bc502b8113da88e222f9 |     
    mips     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/8339f69c75fd8d4f105372d732cca2a88a5d0a66 |     
powerpc64le  |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/634bef9f604aae52a63c22a3e36a593b9e54e391 |     
  powerpc    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/13dab0a6fc3ee1c1b06e9672a5f8c6a9dc0c3b57 |     
 aarch64_be  |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/bf876e620c791d6fcf6192f91cfa62a0683458aa |     
    m68k     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/92e92f4d9fd7e11c97224e30eb3af7f3e633d326 |     
    arm      |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/ddbdabf7e568e07f9c52a585c6076e26e8049d3b |     
    m68k     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/1cbc103ed4e0ed326f6a5e99016febf3232a95ca |     
    arm      |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/afcdc47b0a7db1035b1481183d68f3349c427b1f |     
  mips64el   |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/91e9bd2c68adb7587ebbe4110313ea48a8d2f74b |     
  sparc64    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/accbba55ec9ba043962f8264f8bf179819351ace |     
microblazeel |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/2531bada30ff2903fa67574c7f5af3b62ebc6e1e |     
  mips64el   |         host-go-1.19.4         | NOK | http://autobuild.buildroot.net/results/58aba89472e1298ae1ded59707786513294774f4 |     
    i686     |         host-go-1.19.4         | NOK | http://autobuild.buildroot.net/results/8a798b216b1092860c98b72ade59d6dbe212ab80 |     
   mips64    |         host-go-1.19.4         | NOK | http://autobuild.buildroot.net/results/3d77463ff6766fdbf5219308c11f7b2cc349fc76 |     
    or1k     | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/cd420cd3a78b06f825a2f250293e707423a43ef4 | ORPH
  aarch64    | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/3d5fbc3f1af14ffa48a8842b36cb988056c81552 | ORPH
    or1k     | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/c5ed0592f65b8608da2211e1af5a88d7715134f3 | ORPH
   mipsel    | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/18cef12f05f77e46e206c38c9b68b4028e833824 | ORPH
   s390x     | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/faed7b53978c9139c7e3cd47e47d0a616d242b76 | ORPH
   x86_64    | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/5280650489c35f708b0b1bad3b4e263793af16d5 | ORPH
    arc      | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/1f0a449b52a17aab52c68ed2640448a264b9f28d | ORPH
    i686     | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/482a78eb942c2b01bc2c99235c29d9e1de537926 | ORPH
   s390x     | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/8dceaf01ba9e2075b83f633723d4cf55c32444bd | ORPH
   sparc     | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/5e14b1ea392c49b7b76d2f9b8ce98b1974576762 | ORPH
   s390x     | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/1586f363a54cca76b3a44dcda9409000b0fe6b7f | ORPH
    i586     | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/e530cf99fef75cd2e431707cfd8d07dee30b3afd | ORPH
   armeb     | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/63bdc72922aac9f9a8d848bd20ec36aeffa2759b | ORPH
  aarch64    | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/630a3a7eb50f8e13be3f073175c407b3a08c7320 | ORPH
  sparc64    | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/6fbd9455edc99390f2864e169ad31b9fc3b65ff1 | ORPH
   mips64    | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/a9b4cd7c3354d2935bde4a1cc7c0b62d5991407c | ORPH
  aarch64    | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/fb2e7dc60db4360d7782249f96f94dc37f60118b | ORPH
 powerpc64   | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/a50aeada2b0c2c16c84e1d07afa3aff49ebece3c | ORPH
  aarch64    | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/88c151672295fa001e0eea0a3a682d123d531231 | ORPH
  riscv64    | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/c204817c5970b3b911af915354993469f1ced415 | ORPH
  riscv32    | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/3b17476831ee921c18db1166a37b8a383324b622 | ORPH
    i686     | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/918c0a64432bd4da85186ef25e00f26270b4be4f | ORPH
   s390x     | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/d057dd17196f9418260871eb5c2e009208c69a4a | ORPH
   armeb     | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/a77b4de4ec8ca36b257393a2a11cddc6286b7b1c | ORPH
   mipsel    | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/2cb8814e5ddc7f6f672b6832b3431dfe5661b770 | ORPH
 powerpc64   | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/565b8bde016322f872e128c6a345d20c33f34d6e | ORPH
powerpc64le  | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/02e37d38055c15e7f45e756a552b1e4d9d72cd1f | ORPH
    arm      | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/1f7b8c0b8ba289994ba682fb2063849a9092b95d | ORPH
   x86_64    | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/bef077e2f48370cb37bc860c4bcd8d50643dfaee | ORPH
 microblaze  | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/e6ba1b30d3e49e27554c82f510ed158d3125fd89 | ORPH
   armeb     | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/ba907d5e266586fcf7641ef931288b81438c0d0e | ORPH
   s390x     | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/bcd27d422d2dd6727658dc4ddcfc05bd3d775ef0 | ORPH
   nios2     | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/45cf2f76c95b7f9bd2fb17b9bc61ec117d0a08bf | ORPH
    arm      | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/6cf38d6cf101483c183e9e082be2a8c4313ec734 | ORPH
  aarch64    | host-gobject-introspection-... | NOK | http://autobuild.buildroot.net/results/fffc291563106e17852a523334bffe9efc46b6a4 | ORPH
   mipsel    | host-gobject-introspection-... | NOK | http://autobuild.buildroot.net/results/d1bd8845e605e66734f0e691a0a31ae6f97633d7 | ORPH
    arc      |      host-libzlib-1.2.13       | NOK | http://autobuild.buildroot.net/results/730fbbd77f7b99f051db28bc732187249c5df0d9 | ORPH
   sh4eb     |      host-libzlib-1.2.13       | NOK | http://autobuild.buildroot.net/results/bf36148d307467573c1d3b4a0362745d965c5336 | ORPH
microblazeel |      host-libzlib-1.2.13       | NOK | http://autobuild.buildroot.net/results/76ce5d56cb41870b39d70ba969e6c4effb43473f | ORPH
   mips64    |      host-libzlib-1.2.13       | NOK | http://autobuild.buildroot.net/results/dce13e26dac18a4aafa74ba8ed836b952ef2cd38 | ORPH
   mips64    |      host-libzlib-1.2.13       | NOK | http://autobuild.buildroot.net/results/b0de66a0a42c8b203b71a6b700fd9e951e6ede73 | ORPH
   nios2     |      host-libzlib-1.2.13       | NOK | http://autobuild.buildroot.net/results/aa6f34501eba5a7ee16610685748484663c5f7c8 | ORPH
 microblaze  |      host-libzlib-1.2.13       | NOK | http://autobuild.buildroot.net/results/7145e8f555500bc4f8862478fba87dbecb190989 | ORPH
   x86_64    |      host-libzlib-1.2.13       | NOK | http://autobuild.buildroot.net/results/e8c11c741b7f3b03053e5cb031cf3117280b3dca | ORPH
    or1k     |         host-lzo-2.10          | NOK | http://autobuild.buildroot.net/results/62683708928e2fc27b1ae4430960023e1ce9524d | ORPH
 aarch64_be  |         host-m4-1.4.19         | NOK | http://autobuild.buildroot.net/results/7cc9de2df9b592c9f6037c2f36252d3305fed321 | ORPH
powerpc64le  |         host-m4-1.4.19         | NOK | http://autobuild.buildroot.net/results/e7c10b458aae6df0244c934503b814a630d11bf1 | ORPH
   sh4aeb    |         host-m4-1.4.19         | NOK | http://autobuild.buildroot.net/results/0380812ff5e492a04da7b1609c5a9dd13f2394af | ORPH
   mips64    |         host-m4-1.4.19         | NOK | http://autobuild.buildroot.net/results/f727363e8aa3fbfeb1da591e603980820f321388 | ORPH
   mipsel    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/5a896e041d5a206be0ef01f8b4f5c470f0023a56 |     
 powerpc64   |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/4121bcf4d2c023b172509bd2a76dcba9f3f5f4fb |     
  powerpc    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/6f87d0fa90948165ac0389fd0b6039fb7a726ad2 |     
    arm      |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/558016ec26be4dde69bb58a7dd91836c4546ea86 |     
    arm      |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/ff679a3ae152784707250a4e5b0e2353c2d1c44b |     
   xtensa    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/9b457a74322f84a28196bcbcb64b780b196367c5 |     
  sparc64    |       host-pkgconf-1.6.3       | NOK | http://autobuild.buildroot.net/results/11aaa3a6e6f42671d5be20149fc02156cdd88980 | ORPH
   sparc     |   host-python-greenlet-2.0.1   | NOK | http://autobuild.buildroot.net/results/bb01a44c69dc03a2f742b94aafdf0919a2b57cec |     
 aarch64_be  |   host-python-greenlet-2.0.1   | NOK | http://autobuild.buildroot.net/results/d5958f47687bead3f74cd321cf42d049e7d78d92 |     
   mips64    |   host-python-greenlet-2.0.1   | NOK | http://autobuild.buildroot.net/results/af07039c6a9314d5b22c8b7da4e83194c4f2c960 |     
    sh4a     |   host-python-greenlet-2.0.1   | NOK | http://autobuild.buildroot.net/results/d5f3388156b0b38c2e2519b4272acd39aad34520 |     
   x86_64    |        host-rust-1.65.0        | NOK | http://autobuild.buildroot.net/results/fd08b1e7964819c0e1e1b3ffb187d7b1d084b270 |     
   mipsel    |        host-rust-1.65.0        | NOK | http://autobuild.buildroot.net/results/d670a809201bde708a0457dab9b93bf08e2fb4de |     
powerpc64le  |        host-rust-1.65.0        | NOK | http://autobuild.buildroot.net/results/e05a4084f205878f62a39af889e1b2008ed10389 |     
    i686     |        host-rust-1.65.0        | NOK | http://autobuild.buildroot.net/results/7fc16f2d5d3f469185701c00097263cdbf5b4954 |     
   x86_64    |        host-rust-1.65.0        | NOK | http://autobuild.buildroot.net/results/4cdf9c7d47495b28eeadce7d371bcca58a6f5506 |     
powerpc64le  |        host-rust-1.65.0        | NOK | http://autobuild.buildroot.net/results/a370046de5630893e7c92aa58fc419b71fcda156 |     
   s390x     |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/38cfa48b2a12c1ac108d8128211ee2f26fb34d3a |     
   mipsel    |        hyperfine-1.14.0        | NOK | http://autobuild.buildroot.net/results/59acf08c6e25b738acf6b314e4aadb46d1367b88 | ORPH
 microblaze  |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/427aede267301ed635ee325ebca2c62bd1a0f545 |     
   nios2     |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/4a53e8cc31bb8fc787c0cfc2fc4ef34f3f574809 |     
    m68k     |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/739b280efa98da6b3054f2b5beb309a99cb168e4 |     
  aarch64    |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/38eb403d391f6fc0fef76336d496a620adb71b3a |     
    sh4      |          kexec-2.0.25          | NOK | http://autobuild.buildroot.net/results/33de1b32b0ea66bba9b9044a95241d080c110c93 | ORPH
   mips64    |    libabseil-cpp-20220623.1    | NOK | http://autobuild.buildroot.net/results/6c3ed177bc61900cce17f24b1e45dae25e3d0221 |     
   arceb     |        libbytesize-2.7         | NOK | http://autobuild.buildroot.net/results/edb146fb1e6457a52c8184d7189dc7350535ac6b | ORPH
    or1k     |        libdeflate-1.15         | NOK | http://autobuild.buildroot.net/results/63def8ad6aa1a21c950655663428caee140f9cc3 |     
   sparc     |        libdeflate-1.15         | NOK | http://autobuild.buildroot.net/results/e0bfcbc5bba4ec8b14574b5ff6ff7a00eb7ee5a2 |     
   mipsel    |        libdeflate-1.15         | NOK | http://autobuild.buildroot.net/results/602bccdf32513f2b0eeea8f809e65151e1e23f13 |     
 microblaze  |        libdeflate-1.15         | NOK | http://autobuild.buildroot.net/results/0d446bcd0a8e4ab9ec7c592d2c2eada89d529c04 |     
  powerpc    |         libdnet-1.16.1         | NOK | http://autobuild.buildroot.net/results/ae4bef07b8c1ff2d435972e460a0a2f9eecfe47c | ORPH
    i586     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/bedb9ac318faf5d1aa0ee3bb8a1c9fd41fc0e196 | ORPH
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/96b845e946813aa6bdfe796337d00eafdc308cda | ORPH
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/4eccc56c321abd81e73f4654b995a6bbc4989a52 |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/6fda128db072ffee2b6a176951430ab5d298e22a |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/a0a57a50c60c23e40bb04ccbf0d97e735c464dc8 |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/6356a2d07c6bd54cffd78c8b0403fea781225c11 |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/b4fb834cd21a4305f4c283a7c8efc03a59239179 |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/324f3491633547c69c4cb6e83ba2f1e8f482dea0 |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/09b4c85559065daddb3d5205da835b2d3eaae88d |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/65864fcd665ff6a65ef1d55a1a8258a6ba970f6f |     
 microblaze  |         libglvnd-1.4.0         | NOK | http://autobuild.buildroot.net/results/b798144ede79838c88d5db33f099aeb09fcebd8a | ORPH
 aarch64_be  |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/7f27f662a3bc7e2ab1a070fa3f84c2f573ea57ff | ORPH
  aarch64    |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/8c0568ce3669b6f67eeeef78905092989974986a | ORPH
microblazeel |         libkcapi-1.4.0         | NOK | http://autobuild.buildroot.net/results/e0d976bcf0a79b34decb905c0ee9f2ab85da014f |     
 microblaze  |         libkcapi-1.4.0         | NOK | http://autobuild.buildroot.net/results/ea7945d9f2eef7d2fe53b2278ffba76f7eacb70e |     
   armeb     |         libmad-0.15.1b         | NOK | http://autobuild.buildroot.net/results/22d82b21233ed602e9deee6a747051112913d0b5 | ORPH
powerpc64le  |          libnl-3.7.0           | NOK | http://autobuild.buildroot.net/results/83e8ccdb430b26c1482d2c8180b44e7c61846b49 | ORPH
  mips64el   |          libnl-3.7.0           | NOK | http://autobuild.buildroot.net/results/498fb4e26ebdb6eef78d919ec0541ce2b0d95648 | ORPH
  powerpc    |          libnss-3.85           | NOK | http://autobuild.buildroot.net/results/8e4afd8d3e56efef8dc797c99acf8fcbede8e317 |     
 aarch64_be  |        libostree-2022.6        | NOK | http://autobuild.buildroot.net/results/18835936ac3b1ea3adabe174535350c517ec1f73 |     
   s390x     |        libostree-2022.6        | NOK | http://autobuild.buildroot.net/results/9f459ac122787eb1ec36d702d8380a92ab06465f |     
   x86_64    |        libostree-2022.6        | NOK | http://autobuild.buildroot.net/results/ca52171feaf3a78dd6d9696f1beae6182cc2cb63 |     
   mips64    |         libpqxx-6.4.5          | NOK | http://autobuild.buildroot.net/results/4034e9d773f003c55925f674ef2b4bbb453dbe2f |     
   arceb     |        libtommath-1.2.0        | NOK | http://autobuild.buildroot.net/results/a51303f758eea8ab9d19a53359e528fae6bef05e |     
  mips64el   |        libuhttpd-3.14.1        | NOK | http://autobuild.buildroot.net/results/d0fb7fb1aeef1d631099968e5d793f822aefbce5 |     
  powerpc    |        libvorbis-1.3.7         | NOK | http://autobuild.buildroot.net/results/1a297a46db2ce3843ff5e63ff79c5b8908a3d517 |     
   mips64    |         libzlib-1.2.13         | NOK | http://autobuild.buildroot.net/results/46882a834c7faac83858b49a761c85d856bc2132 | ORPH
   nios2     |      linux-5.10.145-cip17      | NOK | http://autobuild.buildroot.net/results/08eb0f109300864bc38334f2d603b7e75027d39b | ORPH
   sh4aeb    |    linux-5.10.145-cip17-rt7    | NOK | http://autobuild.buildroot.net/results/0faeb7476255326e78bb30c28cd2f3b29c3e01b7 | ORPH
   mipsel    |    linux-5.10.145-cip17-rt7    | NOK | http://autobuild.buildroot.net/results/bdc7b7896907512c0e4555b4e24041c7eca24fbb | ORPH
    mips     |          linux-6.0.12          | NOK | http://autobuild.buildroot.net/results/8184cb8ca8acb89b141048068dbd624d373ce157 | ORPH
   mips64    |          linux-6.0.12          | NOK | http://autobuild.buildroot.net/results/241b234e8dce97100973a083fbb9d9f67ef29e2a | ORPH
    mips     |          linux-6.0.12          | NOK | http://autobuild.buildroot.net/results/288e6e1adf1366e4e11ca95dbe216c5fa4a3d9e7 | ORPH
    mips     |          linux-6.0.12          | NOK | http://autobuild.buildroot.net/results/45b75c8280cd88b7ad2b3f186bb2084b9d2406b8 | ORPH
    sh4a     |          linux-6.0.12          | NOK | http://autobuild.buildroot.net/results/a2e83745171451b704bba8fc9614a233591f286f | ORPH
 aarch64_be  |       lirc-tools-0.10.2        | NOK | http://autobuild.buildroot.net/results/072ac3d51a944e46857fafe60314e1ca3c46decc | ORPH
    or1k     |       lirc-tools-0.10.2        | NOK | http://autobuild.buildroot.net/results/848b3dab1eb24707693a4239e439eafd3d3a7e15 | ORPH
   mipsel    |         lmbench-3.0-a9         | NOK | http://autobuild.buildroot.net/results/c12411eba0836cc992f629636df61f5a3aa2ebeb | ORPH
 aarch64_be  |         lmbench-3.0-a9         | NOK | http://autobuild.buildroot.net/results/d96290eed94c8ea7f1bd1b1415be4e5abf692a1f | ORPH
    sh4a     |         lmbench-3.0-a9         | NOK | http://autobuild.buildroot.net/results/277caf8bdfba35b020a6d22121051773dbe81dde | ORPH
    sh4a     |         lmbench-3.0-a9         | NOK | http://autobuild.buildroot.net/results/849d5bfe2560c95ebf3160bcbbf368b113be263a | ORPH
 powerpc64   |     ltp-testsuite-20220930     | NOK | http://autobuild.buildroot.net/results/c824fc121f0ee3a8fe0ed1e2ace41f22b307259d |     
    sh4a     |     ltp-testsuite-20220930     | NOK | http://autobuild.buildroot.net/results/352afc3eaefac6b8817f5abc16997845d7e9d6f7 |     
powerpc64le  |     ltp-testsuite-20220930     | NOK | http://autobuild.buildroot.net/results/d672471d4d1fa9876d1d4085355d47cfe59577dc |     
   s390x     |          mender-3.4.0          | NOK | http://autobuild.buildroot.net/results/582a01525c413f98f55ccf2634895dd9a3599c31 |     
  powerpc    |           musl-1.2.3           | NOK | http://autobuild.buildroot.net/results/422a42e90bcdecb42f9d3df216e0dcbeaf0a091b |     
  powerpc    |           musl-1.2.3           | NOK | http://autobuild.buildroot.net/results/64f8ce41f05616c1727920dd363db6f3fb9ade23 |     
  aarch64    |         nerdctl-1.0.0          | NOK | http://autobuild.buildroot.net/results/bc751cbeef93d7863a6bfc4785b1c7163a703189 |     
 aarch64_be  |          netsurf-3.10          | NOK | http://autobuild.buildroot.net/results/a364009bb27856ff484a6e286ac7ed4d65006dfd |     
  riscv32    |          nginx-1.20.1          | NOK | http://autobuild.buildroot.net/results/62a6af5fd4753eedfd3588eab8b100ce5194cfb9 |     
   x86_64    |           nmap-7.92            | NOK | http://autobuild.buildroot.net/results/21ae364489229c6a6cb08182aed9c08b6de00651 | ORPH
  sparc64    |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/8af295e723697f2b341aa34aee944d7c051df293 | ORPH
   xtensa    |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/d1de911d542b05d1063786d30bc778d36a4f887d | ORPH
  mips64el   |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/8059527928c7efe2d20d844809bed448e1f7f20e | ORPH
   sparc     |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/5436096bbdb6153dac0cf9ed759fa75230bdb954 | ORPH
  aarch64    |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/34e2bd35a6266abfcf13f888587f3f4ea0a35fe8 | ORPH
    mips     |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/e5e637c609a496c7e07d4af1edb6fd6841008602 | ORPH
  aarch64    |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/26e140fa115b474431f9e4e16128df2a366a1126 | ORPH
   sh4eb     |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/53eb3c7d3c216ba99b51c483858d30fbe8765fe6 | ORPH
  sparc64    |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/83cc36b67496eaba441b99f282f12d1cfcdfa7f3 | ORPH
   mips64    |        open62541-v1.3.3        | NOK | http://autobuild.buildroot.net/results/d6456778f7682605efd4a3abdeb69d0b227e2488 | ORPH
  riscv64    |          opensbi-0.9           | NOK | http://autobuild.buildroot.net/results/e66a849fe29d6858fe25377f33d09f03217df49f |     
  sparc64    |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/b156996ac92241fdee19bf8c3eb14b6c9410ae12 | ORPH
   nios2     |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/fe74aae1be44dbfa8ba583403b7c9bde348bddd1 | ORPH
  mips64el   |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/30b0fcf6a4c9ee7c9982811589ad78f5099b7042 | ORPH
    arm      |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/2e14eb9f77b79330a775efb714b47d123b7603b1 | ORPH
   mips64    |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/24ca455833446112015d3f80396798b1e8ef6966 | ORPH
  mips64el   |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/135618aaeddd63b51db583285176eb2e98aa8b5c | ORPH
    mips     |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/f2013e749afa812261692bf01ed6a6de4555bf53 | ORPH
    arm      |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/12b911157711f6f6be9b9564b2d66212ded7e148 | ORPH
    or1k     |      optee-client-3.19.0       | NOK | http://autobuild.buildroot.net/results/1a1295d6d735515c4b7d1968f03ccc05dc3c2344 |     
   armeb     | package/vuejs-router/vuejs-... | NOK | http://autobuild.buildroot.net/results/9fb0389ec93d6c6e3d5f8e3f70e25ac3bec9e80b |     
    or1k     |        pcsc-lite-1.9.9         | NOK | http://autobuild.buildroot.net/results/a88fa9c5de90740fbb905be827cc93614b632a06 | ORPH
powerpc64le  |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/ca27d553789c0e7ed8ee7ad5a869523ec42bb0a5 |     
   sparc     |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/47f63ec1976fb0c17c42f43cb47b46f0ad690e86 |     
  powerpc    |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/70c23a3070c607b9533f9e80847772262b82b3d5 |     
    or1k     | pistache-3ec9d7c4f8b828fdd3... | NOK | http://autobuild.buildroot.net/results/53f918bed52414efef0762ee0e61149d2eabfa98 | ORPH
  aarch64    |           pixz-1.0.7           | NOK | http://autobuild.buildroot.net/results/d304b2a0d2f2afbff1052a727c83222e1d8704e2 |     
powerpc64le  |           pixz-1.0.7           | NOK | http://autobuild.buildroot.net/results/9c48fc9f4f929a94eb4ddcc59a99462302b7aad7 |     
    arm      |           pixz-1.0.7           | NOK | http://autobuild.buildroot.net/results/01e434deb5f2840bab7777ccd7f86dac89c8368a |     
 aarch64_be  |           pixz-1.0.7           | NOK | http://autobuild.buildroot.net/results/dcac7d194d964a262957eae1dbba42728b5924f4 |     
  mips64el   |           pixz-1.0.7           | NOK | http://autobuild.buildroot.net/results/6eefe1bf46e30fa19c69fb4affbf502974954662 |     
 powerpc64   |           pixz-1.0.7           | NOK | http://autobuild.buildroot.net/results/e5588b782c53ecd6fe99867e76ccd26d69c6e5a7 |     
    arm      |           pixz-1.0.7           | NOK | http://autobuild.buildroot.net/results/5c1a395c22f542e1098eb198004b0305a8de3f6b |     
   s390x     |           pixz-1.0.7           | NOK | http://autobuild.buildroot.net/results/13e59fec9ad904d9163f148aa87ce57dd758f6d9 |     
   sh4aeb    |           pixz-1.0.7           | NOK | http://autobuild.buildroot.net/results/39480a56fc4034a04e89a50a8372ab7290f89311 |     
 aarch64_be  |           pixz-1.0.7           | NOK | http://autobuild.buildroot.net/results/3e6df726a6810e257077990d5862e26e21335f0f |     
microblazeel |           pixz-1.0.7           | NOK | http://autobuild.buildroot.net/results/5fa5afdeb1d324bfa23683fc16a39dc6fe1574d7 |     
  mips64el   |           pixz-1.0.7           | NOK | http://autobuild.buildroot.net/results/18ab24eb83fda0c9829e936d1c630a1206ee6a3b |     
 aarch64_be  |           pixz-1.0.7           | NOK | http://autobuild.buildroot.net/results/c7354777b0b26bf0d6b6d6c17a84d82c8818e76b |     
  sparc64    |            poke-2.4            | NOK | http://autobuild.buildroot.net/results/90fff437b41e7d55fcc12c5c08fdc4a7da217828 | ORPH
  mips64el   |           proj-8.1.1           | NOK | http://autobuild.buildroot.net/results/7e0af77109676cca7787e917bd31ec21ae5c983c |     
    or1k     |           proj-8.1.1           | NOK | http://autobuild.buildroot.net/results/aa0a81bb5d95647e29f56d2fdf9bd8d6d8c0ab90 |     
   sh4aeb    |           proj-8.1.1           | NOK | http://autobuild.buildroot.net/results/2dd336467573814ccd21e76736c25601fa3b682c |     
powerpc64le  |       python-bunch-1.0.1       | NOK | http://autobuild.buildroot.net/results/9cba689ee3a13c270fb813c12c88f3f5c73956f1 |     
    mips     |   python-cryptography-38.0.4   | NOK | http://autobuild.buildroot.net/results/5a57c71aa7035b1da2cd97aeaf35b25c87b8ec0a |     
  powerpc    |   python-cryptography-38.0.4   | NOK | http://autobuild.buildroot.net/results/cad7c09752fb7e4f9ec9c7da9806bbc77f6de945 |     
   x86_64    |   python-cryptography-38.0.4   | NOK | http://autobuild.buildroot.net/results/92d30fe732f054d323a4bfa29ee1e5bc0b73a181 |     
    mips     |   python-cryptography-38.0.4   | NOK | http://autobuild.buildroot.net/results/fe307f034e191b27a70e9e6026c7f26cd1da0706 |     
  sparc64    |   python-cryptography-38.0.4   | NOK | http://autobuild.buildroot.net/results/e39aabd495a144446fc1fce1ac37c8a4551dda7a |     
   armeb     |      python-numpy-1.23.5       | NOK | http://autobuild.buildroot.net/results/ab2fd15d37c0413da4501fc4cb0a1b76ea63f534 |     
   sh4aeb    |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/6b9ba57063864245b62e0f8f26ffc8011280e51d |     
   mipsel    |     s6-linux-utils-2.6.0.0     | NOK | http://autobuild.buildroot.net/results/7ec63d926ae8451762b22b1946edf1419f5c902f |     
   sh4eb     |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/0e91e6539f7721ebc0331244f2424b9ef94f9760 | ORPH
    arc      |          sscep-0.10.0          | NOK | http://autobuild.buildroot.net/results/fda740a06d56c22283606afa93df0ce40782c9b2 |     
 powerpc64   |          sscep-0.10.0          | NOK | http://autobuild.buildroot.net/results/c533007492289552ff06b835b827ab94cbbf7496 |     
    i686     |          tbb-2021.5.0          | NOK | http://autobuild.buildroot.net/results/669e582e6de32ba58f2bd36222151631480e4927 |     
   mips64    | toolchain-external-codescap... | NOK | http://autobuild.buildroot.net/results/7c7c4e27261145bdd3c16e2d6b8a8fde829bf615 | ORPH
   mipsel    | toolchain-external-codescap... | NOK | http://autobuild.buildroot.net/results/07e9edc1ee0a71ec36da59e6db4eb9fe806ce679 | ORPH
   sh4eb     |      uboot-tools-2021.07       | NOK | http://autobuild.buildroot.net/results/daba630094dda9fbb3ba19fc56d7d04b4dff4d96 |     
powerpc64le  |       uccp420wlan-6.9.1        | NOK | http://autobuild.buildroot.net/results/9225cbd477f8e3827d9efcb530127f5adf21ce77 | ORPH
  powerpc    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/bd59233bd63cebc8e2e3b43400d38490ba956116 |     
  powerpc    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/95806bef42c06052390a76914e39ad649c26adda |     
    mips     |          uhd-4.3.0.0           | NOK | http://autobuild.buildroot.net/results/a2e251f14f208e01e461c01fd957c35822f0499c |     
powerpc64le  | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/27c02e03dc1cbe75f5b18b22a8fc0f2c9341120a |     
    i586     |            unknown             | NOK | http://autobuild.buildroot.net/results/37c18870c9ae5e443889daedee037392d3b509d6 |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/d9b2d12493054dbafe4d0bb88ea7e711f9021038 |     
  sparc64    |            unknown             | NOK | http://autobuild.buildroot.net/results/1140ff9ef68043722094917bb88f36d5dd3d8cf8 |     
 powerpc64   |            unknown             | NOK | http://autobuild.buildroot.net/results/13ebe9ad42ac309c01920da500930b0f9b4367e0 |     
   armeb     |            unknown             | NOK | http://autobuild.buildroot.net/results/797a618bc80efa9353a89f6979b25d77a21ba3ed |     
 aarch64_be  | uqmi-0a19b5b77140465c29e2af... | NOK | http://autobuild.buildroot.net/results/e154e43190d9545ada04eb831075bcddaa527229 | ORPH
 microblaze  |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/d1bb5dbf4e040e2daa7ad9c5f4419260123f5a33 | ORPH
microblazeel |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/fa83791b59b761f12983fa8498766e45dd466bfb | ORPH
microblazeel |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/58722caac5ec430b64a32abe515b0cdf13526cd9 | ORPH
 microblaze  |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/3c1273b53cfbd1ebc0c0ee6459ea98dac8641c05 | ORPH
microblazeel |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/6ba10f58537db4e9e46a3e3f440a14644fc41e2b | ORPH
microblazeel |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/70af6760c2e7c692ad3368c50d79adcd3c3c62ba | ORPH
microblazeel |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/1849d063e3145d804019f229c3f8d1f90d86c763 | ORPH
 microblaze  |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/b472b86214d1dd44faceec966a4ca06cab8aca62 | ORPH
 microblaze  |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/b4dcb8cadfdf90d8b89d9cbcea313a9c5c44d5eb | ORPH
   x86_64    |          zabbix-5.4.9          | NOK | http://autobuild.buildroot.net/results/9995cec76725c09ec9be8d74e1b735d152971ae4 |     
  aarch64    |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/1101157f1191793b1ac27b86d0291a0f2a5ef85d | ORPH


Classification of failures by reason for 2022.02.x
--------------------------------------------------

            igd2-for-linux-2.1 | 2 
                 mesa3d-21.3.5 | 1 


Detail of failures for 2022.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/874bd9a724257d1cd2f767bd1ace32ba8f409a5b |     
    arc      |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/8fd748ff27b0f73e1649b61a65adbdf3e1cd8816 |     
    mips     |         mesa3d-21.3.5          | NOK | http://autobuild.buildroot.net/results/b58875bcac66a2a471df23975b81532daa38cf84 |     


Classification of failures by reason for 2022.11.x
--------------------------------------------------

                gerbera-1.10.0 | 2 
                host-go-1.19.4 | 2 
              host-pahole-1.24 | 2 
/home/buildroot/autobuild/i... | 1 
                     efivar-38 | 1 
          gitlab-runner-14.5.1 | 1 
            host-binutils-2.38 | 1 
              host-rust-1.64.0 | 1 
               libcap-ng-0.8.3 | 1 
               libglib2-2.72.3 | 1 
                   linux-6.0.9 | 1 
     s6-portable-utils-2.2.5.0 | 1 
                       unknown | 1 


Detail of failures for 2022.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/3f418cd774799fe3c90b74311da0b475b5cb1f1f |     
  mips64el   |           efivar-38            | NOK | http://autobuild.buildroot.net/results/77d4ce0b19b847cb59a83b093f2f8866cba91e5c |     
  aarch64    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/feba7a004667c14c56d3e5d1ab0267f26a5f63df |     
    arc      |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/c35c7de25a06cd2d726f31a212194a778030d609 |     
  riscv64    |      gitlab-runner-14.5.1      | NOK | http://autobuild.buildroot.net/results/3c94d1c85687661c0f951e84b4f155541dfa7449 |     
   nios2     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/927fff4b0dd47d6976ebeb31bf9378d60db0ece9 |     
    i686     |         host-go-1.19.4         | NOK | http://autobuild.buildroot.net/results/f2fbaabb3f22374dac3f8fd1e4aaa6b1c9cb5d54 |     
    i686     |         host-go-1.19.4         | NOK | http://autobuild.buildroot.net/results/6e135d5fa8f2fb00945b18f52b7a5d29a99f8412 |     
    arm      |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/9d9fd58a624e1924cf42dbf36ea382da86b0a226 |     
  riscv32    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/cdbe9a985b5fcb1c36eddaabf53f827e115ed924 |     
    i686     |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/31e085f29585c1ba8c1c861bbe228dc00e7dc073 |     
  riscv64    |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/1c0f728de08b88f0547bf8c9abf6417ba3ef831a |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/b4c0d88904e8b2e910fa90f0217edb328b5000ff |     
    mips     |          linux-6.0.9           | NOK | http://autobuild.buildroot.net/results/19316da165adc8ff8600f205c509f66f7ad5127d | ORPH
microblazeel |   s6-portable-utils-2.2.5.0    | NOK | http://autobuild.buildroot.net/results/14c07fccfb4177b634667573083766b28bfec967 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/d3d302db97e4eb426a51fc0b14d08753b8dfd213 |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
