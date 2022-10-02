Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4391C433FE
	for <buildroot@archiver.kernel.org>; Sun,  2 Oct 2022 06:32:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 51B9F60B12;
	Sun,  2 Oct 2022 06:32:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 51B9F60B12
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yTqRxkrGm1H7; Sun,  2 Oct 2022 06:32:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 93A5860AC0;
	Sun,  2 Oct 2022 06:32:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 93A5860AC0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 712AF1BF375
 for <buildroot@lists.busybox.net>; Sun,  2 Oct 2022 06:32:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 467C5400EA
 for <buildroot@lists.busybox.net>; Sun,  2 Oct 2022 06:32:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 467C5400EA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RcRB4icjJ62j for <buildroot@lists.busybox.net>;
 Sun,  2 Oct 2022 06:32:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DA1FF400C6
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DA1FF400C6
 for <buildroot@buildroot.org>; Sun,  2 Oct 2022 06:32:35 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 3E8CEC0008
 for <buildroot@buildroot.org>; Sun,  2 Oct 2022 06:32:33 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sun, 02 Oct 2022 06:32:33 -0000
Message-Id: <20221002063238.467C5400EA@smtp2.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1664692353; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=d/IFwPnwGLMwq0MfzQHHflbIukPmNjRe5pr/BLdM3MA=;
 b=ktR2SLBASkmaa89JLMD2wwwWKHG34guzH86RqV+407ACzqkyFKr11EpCGiZ2fXE2n4TJNP
 yuqp+/Adroi4GuC11zIfR4g0hjCUn5UgQRX0lG1GAa+lDcYs4OgiA41X5M2k89Tt6AhXV8
 BGARw5bv7lYwnFbu8ymvb1N/5q8FlQOXyRnKfOOQtjMSjPTti+0YB+ZjlpdFi/bYd1SZer
 H78rGeAupCq+yOrBtKHBsVZeojzBH25HcTMH36E57l2IN3P0h+0AUA8xul7n1Oh3X+9iQJ
 DEn6BDlvTwl+uzYKwTlM52DyTNcqEAcyM+VWjN0SJAmM96hMo8ztTtpn+/FCHw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ktR2SLBA
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-10-01
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

Autobuild statistics for 2022-10-01
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  |  2  |  2  |  0  |  4  |
  2022.05.x  | 22  | 12  |  0  | 34  |
  2022.08.x  |  3  |  0  |  0  |  3  |
    master   | 65  | 162 |  0  | 227 |

Classification of failures by reason for master
-----------------------------------------------

                 systemd-250.4 | 9 
                      crun-1.5 | 8 
glibc-2.36-44-g2628500f5dff... | 8 
                 sysvinit-2.99 | 7 
                       unknown | 7 
                  autofs-5.1.8 | 6 
            btrfs-progs-5.16.2 | 5 
host-pahole-73383b3a39afe86... | 5 
        host-sentry-cli-1.59.0 | 5 
            igd2-for-linux-2.1 | 5 
                gerbera-1.10.0 | 4 
            host-binutils-2.39 | 4 
google-breakpad-c85eb4a59b6... | 3 
host-spirv-llvm-translator-... | 3 
                 linux-5.17.15 | 3 
        ltp-testsuite-20220527 | 3 
                 coreutils-9.1 | 2 
dahdi-linux-5c840cf43838e06... | 2 
                 dash-0.5.11.5 | 2 
                elfutils-0.186 | 2 
                  gensio-2.5.2 | 2 
                   hdparm-9.63 | 2 
            host-binutils-2.38 | 2 
         host-gcc-final-11.3.0 | 2 
                host-go-1.19.1 | 2 
              libarchive-3.6.1 | 2 
               libglib2-2.72.3 | 2 
   libtorrent-rasterbar-1.2.15 | 2 
       linux-5.10.109-cip5-rt4 | 2 
                    musl-1.2.3 | 2 
              open62541-v1.3.3 | 2 
            quickjs-2021-03-27 | 2 
ulog-0389d243352255f6182326... | 2 
/home/buildroot/autobuild/i... | 1 
/home/buildroot/autobuild/i... | 1 
/home/buildroot/autobuild/i... | 1 
                  assimp-5.2.1 | 1 
                  boost-1.80.0 | 1 
                    brltty-6.4 | 1 
casync-4ad9bcb94bc83ff36cfc... | 1 
                  check-0.15.2 | 1 
           crucible-2022.05.25 | 1 
                 dmalloc-5.6.5 | 1 
              erlang-22.3.4.22 | 1 
                 fdk-aac-2.0.2 | 1 
             fontconfig-2.13.1 | 1 
                     frr-8.3.1 | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
                    gdal-3.5.1 | 1 
                  gensio-2.5.5 | 1 
                     gmp-6.2.1 | 1 
                      grep-3.7 | 1 
               host-flex-2.6.4 | 1 
         host-gcc-final-10.4.0 | 1 
host-gcc-initial-arc-2020.0... | 1 
     host-moby-buildkit-0.10.0 | 1 
              host-rust-1.64.0 | 1 
            igh-ethercat-1.5.2 | 1 
               libdcadec-0.2.0 | 1 
                   libqb-2.0.6 | 1 
libuci-4b3db1179747b6a67790... | 1 
                  libzip-1.9.2 | 1 
                libzlib-1.2.12 | 1 
make: *** Waiting for unfin... | 1 
                p11-kit-0.24.1 | 1 
                     pcre-8.45 | 1 
                   perl-5.34.1 | 1 
                     php-8.1.9 | 1 
                    proj-8.1.1 | 1 
            python-ujson-5.2.0 | 1 
                   rhash-1.4.3 | 1 
                tealdeer-1.5.0 | 1 
                 uclibc-1.0.42 | 1 
uqmi-0a19b5b77140465c29e2af... | 1 
                 wavemon-0.9.4 | 1 
                  zabbix-5.4.9 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/78433fa816d089daef58dde84bc38de55f8c6a36 |     
   nios2     | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/b7a0638e6bcaa10c4f4d111bebcc51d5dab43dd8 |     
   x86_64    | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/a00652077b4237081564d100e86d78a1c8d09b7c |     
   nios2     |          assimp-5.2.1          | NOK | http://autobuild.buildroot.net/results/f9db16f76c3e10e40ab5090a32032916b2ca555a | ORPH
   mipsel    |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/2e4af83beb02716c956012045e85ab2ebe5834c2 |     
   s390x     |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/76bd0d64081631364daad90f490d61c65b58a929 |     
   s390x     |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/64c2d8b8111f6dbb58862d9e1f5d5def0f10fc09 |     
    i686     |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/894e473185ec6c55d9f9f8696208ab4213e7c6a9 |     
 microblaze  |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/a24ded9ed7282e8b32e96f14c93ff9954a724530 |     
    arm      |          autofs-5.1.8          | NOK | http://autobuild.buildroot.net/results/c5a36a28465b7cf64d3c39104b86983e3563e8af |     
   arceb     |          boost-1.80.0          | NOK | http://autobuild.buildroot.net/results/b8fab151d77969e6350dbf3f345f33a90cdeeee9 |     
   mipsel    |           brltty-6.4           | NOK | http://autobuild.buildroot.net/results/49de49349f3670c2357c56fada181ab3fa546f88 |     
 microblaze  |       btrfs-progs-5.16.2       | NOK | http://autobuild.buildroot.net/results/dca54eaf9956e98d08c23fc5a6f1f46a42fc4b7a | ORPH
    or1k     |       btrfs-progs-5.16.2       | NOK | http://autobuild.buildroot.net/results/b5b15ea1fc61be23d073d342ead863afd04ce008 | ORPH
  mips64el   |       btrfs-progs-5.16.2       | NOK | http://autobuild.buildroot.net/results/e93e0b40baf52c169dad2c59dcfd3ff838767772 | ORPH
    i686     |       btrfs-progs-5.16.2       | NOK | http://autobuild.buildroot.net/results/2a16a7b086a38a7bb2c9f75a8715b6aa7cbe53f8 | ORPH
   mips64    |       btrfs-progs-5.16.2       | NOK | http://autobuild.buildroot.net/results/34785ce812b49e37abd94c20b684e3abdce5aafe | ORPH
   s390x     | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/4496fb3fb0a7b08636e3efd4fd536add46be371d |     
 powerpc64   |          check-0.15.2          | NOK | http://autobuild.buildroot.net/results/680ad1ed95f7a7522029c55f49a53c9859204cd2 | ORPH
    sh4      |         coreutils-9.1          | NOK | http://autobuild.buildroot.net/results/b7e56b951addb26845a8ef258a9b55aa99232b09 | ORPH
   sh4aeb    |         coreutils-9.1          | NOK | http://autobuild.buildroot.net/results/2630ad3ecd6c9fc9bca20de4cee6c6f5b3e2f9db | ORPH
    i686     |      crucible-2022.05.25       | NOK | http://autobuild.buildroot.net/results/c6cc040face2cf8917865ab36407c5f6e1f8ba60 |     
 microblaze  |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/cfe5fe4dbc3bfa97a5e560691ff40c135378bbe9 |     
  sparc64    |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/4920d7e113d0647a37f0cc8e3999cf54522cc78f |     
  aarch64    |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/2ea89ba9d0a3d6bcc011985618e763e6ea45f27c |     
    sh4a     |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/708417bc525c5267759951272c2a4f2b5ce327c4 |     
    arm      |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/5f775ac92242a2a863ac6d40f4f2edf7ebf7fab7 |     
  aarch64    |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/944c54e684d40778da72d909403245f4bbd0b291 |     
   sparc     |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/b126ce1d01827d960ed0d4c5d45b05321519187e |     
    i686     |            crun-1.5            | NOK | http://autobuild.buildroot.net/results/f0fe35e76ac95c10658c8d27c89cca63fd927f22 |     
powerpc64le  | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/5eec218c62fbf6629ced4fc9537e4fa93f84678e |     
 microblaze  | dahdi-linux-5c840cf43838e06... | NOK | http://autobuild.buildroot.net/results/f9237df67add2cfab356714863e12b2b28997464 |     
  sparc64    |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/39edaa92f25fe5028110caed2fe8a37f00c5991f | ORPH
  mips64el   |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/4b05c8e326fc41ed2b67d08c4fb2054184482200 | ORPH
  powerpc    |         dmalloc-5.6.5          | NOK | http://autobuild.buildroot.net/results/cdda3f5cc86eb390c2afe1ea06977d63807d990f | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/4baedb0d0b9f289b8c99d94b8b2fae5e4b41748c | ORPH
   arceb     |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/de5f5fdbd4340abc7e7a6a3a6b9c6be36d04533b | ORPH
    i686     |        erlang-22.3.4.22        | NOK | http://autobuild.buildroot.net/results/908d56d239a6df1e369ed86f5092c8a25985658c |     
    mips     |         fdk-aac-2.0.2          | NOK | http://autobuild.buildroot.net/results/4a0b4eadfc19aae05f69ec78621b49e77e308c53 |     
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/054acff406bd2219695fe56912f7d8570c0af9d3 | ORPH
  mips64el   |           frr-8.3.1            | NOK | http://autobuild.buildroot.net/results/9e10618870229ee847877f14e7f6ce4b93ed217c |     
microblazeel | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/99f55319d7a4476ee7376fa3b26f5039da855d85 |     
    or1k     |           gdal-3.5.1           | NOK | http://autobuild.buildroot.net/results/0a1b502514ee2671d96e205a18287a582758176d |     
   armeb     |          gensio-2.5.2          | NOK | http://autobuild.buildroot.net/results/e4ac33043ee6d63918b75405e0355894ea93af49 |     
   x86_64    |          gensio-2.5.2          | NOK | http://autobuild.buildroot.net/results/df4074d47f3a12640ec332420a7b7f6820f61e29 |     
 powerpc64   |          gensio-2.5.5          | NOK | http://autobuild.buildroot.net/results/5903f917eec509db61a94e1976cee7e2c29fb371 |     
  aarch64    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/b004d36b743caf35ac19f0892e0f3876b6f96597 |     
  powerpc    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/947e9df787e2c7561a2e7899bff130d5cc6c5af7 |     
  riscv64    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/00de85570d9e03e537a089945db2f3ab99b8aeb5 |     
   xtensa    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/5cc2cd19d7fa4eaf5b5419d65e3f788355fb1dbe |     
    or1k     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/cbf51ce8a66f1740865b5f244d84c96a06158c12 |     
    mips     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/65da2981532a9471a87cb4d53fb6c700f1d56d6c |     
 microblaze  | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/1ca519ae2e0e9f60295dc9ca097ca90c535b3953 |     
   nios2     | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/deb86d5cb1a4baaaacee11f10da649922ce9b9aa |     
   x86_64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/ab2eaa35733ef38d94514728bbce54ddcffbccf9 |     
   x86_64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/2d5fdc68b4b7d110a0627162f61cb97cecfa697b |     
microblazeel | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/1a022ce3f36485ebdd35c373742893ada09a2a1b |     
   x86_64    | glibc-2.36-44-g2628500f5dff... | NOK | http://autobuild.buildroot.net/results/c1b358ed4bd6feaa7313b00f29e50dd417f1d083 |     
  riscv64    |           gmp-6.2.1            | NOK | http://autobuild.buildroot.net/results/191f95360270e3f9c372e0dcdd498f6e73116606 | ORPH
    arm      | google-breakpad-c85eb4a59b6... | NOK | http://autobuild.buildroot.net/results/8fad09c37f1983ee6513693489597f59e5ea35cd |     
    arm      | google-breakpad-c85eb4a59b6... | NOK | http://autobuild.buildroot.net/results/eaaaf658179a0b80c394e3950e2210e102aae4dc |     
    arm      | google-breakpad-c85eb4a59b6... | NOK | http://autobuild.buildroot.net/results/9922999cc790fe55a4c5ae30e652dbc5aa1c8c5c |     
  powerpc    |            grep-3.7            | NOK | http://autobuild.buildroot.net/results/98a1649fe41ef7d7b9604cb304624d43718acd43 |     
   s390x     |          hdparm-9.63           | NOK | http://autobuild.buildroot.net/results/4a15aba80238c6faf9266c8aaf1282762af09687 |     
    mips     |          hdparm-9.63           | NOK | http://autobuild.buildroot.net/results/8781115a93dd2b9bc416435210e2deae5627a258 |     
    sh4a     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/690893b6059841fba0873f1561e2aefec5c5dab7 |     
   mips64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/2efd3b5a6843e3392bf1f938a3a2678e481e40cf |     
   s390x     |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/488c1b4b0db3f80d47dd7adb659d52e79bb43f52 |     
   s390x     |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/777bef8d9b06ea2fb92c5b7634e05cbb6c187203 |     
   armeb     |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/f1e39e6abd2f2c13a4f7c885168b301caf642cfb |     
  aarch64    |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/19befb943c64d3b3efb12faa08499100960eda76 |     
 microblaze  |        host-flex-2.6.4         | NOK | http://autobuild.buildroot.net/results/55599ec38cc6c7331f984410f2276415a99fee97 | ORPH
    i686     |     host-gcc-final-10.4.0      | NOK | http://autobuild.buildroot.net/results/3fd437f269bf4ce25f6e2bcbc48d066c15fb7df2 |     
powerpc64le  |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/9d1bfd18a3bd35d892da49b28968df488dfee7c3 |     
   s390x     |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/a5fafa5cc7612bd07f1b69b33f2ddce51491df9c |     
   arceb     | host-gcc-initial-arc-2020.0... | NOK | http://autobuild.buildroot.net/results/0177a3ae3ffe74cb17b563dbe395a5b73048f85e |     
    i686     |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/f69f3463790fe1bdba0548b820b1f595d31d8a62 |     
  aarch64    |         host-go-1.19.1         | NOK | http://autobuild.buildroot.net/results/4351dae9b7dd832385ce2168465b2bc28521d44c |     
    arm      |   host-moby-buildkit-0.10.0    | NOK | http://autobuild.buildroot.net/results/28b9d8658623e68909d3886f198714a6006b9bde |     
    m68k     | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/6add4db41f23d31381a19f3492a0389c2857ec51 |     
   s390x     | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/8d2d15c0a67cf16a0dd3d5db6a67e438295a1a11 |     
  mips64el   | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/f70dea4694817ac83c4dd9364808fd0a3eb6f4a7 |     
   sparc     | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/74ee8c6d5f1f4d281ab3af262bf74956d9f9eced |     
 microblaze  | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/e5ac7d6c5d31876d3b129df1efe48576dc67572f |     
   x86_64    |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/30ed5984876885679be166af43c8f155f607975f |     
   armeb     |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/609a2bbc379a738ecfae3d4def39e3dbdac7895e |     
microblazeel |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/42526b17aa8f5da6f6045eddc88270e819eb2f91 |     
   armeb     |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/411fda12f71a6dc23e3072d990d4d966859efab6 |     
   s390x     |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/9b964629c7d3f2893a7cc4aa5b2cc4150ec48e72 |     
powerpc64le  |     host-sentry-cli-1.59.0     | NOK | http://autobuild.buildroot.net/results/bdcb0c6db801a655b9f0cdff718bf7c4a6c68351 |     
  riscv64    | host-spirv-llvm-translator-... | NOK | http://autobuild.buildroot.net/results/0373ad884aa9988d986b3e838ecf10ac02fffed4 | ORPH
  riscv32    | host-spirv-llvm-translator-... | NOK | http://autobuild.buildroot.net/results/003df37b095dcabfae0d7af6a7d7c085b1280175 | ORPH
  aarch64    | host-spirv-llvm-translator-... | NOK | http://autobuild.buildroot.net/results/c866d1f3fef7542b3f6b65b50db7a33dc31c85d8 | ORPH
   sh4aeb    |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/8ceca17239fdf05c737ebf694d65d0147a30191c |     
   sparc     |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/e77899390ede54570bd2b48c876de0a7110649e9 |     
  mips64el   |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/31737027adcef6b4e3f0dbb9884cdddca6e9af30 |     
   x86_64    |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/48fe1a7f37490fc97ad359b6deb7196c0107f03f |     
 microblaze  |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/23d89e0a739f7c066288c06b0c69f887e822dc8c |     
powerpc64le  |       igh-ethercat-1.5.2       | NOK | http://autobuild.buildroot.net/results/7f17dbdcb33cee2bef5036f2693c978ef32b63bb |     
 aarch64_be  |        libarchive-3.6.1        | NOK | http://autobuild.buildroot.net/results/4996b6e2ad5d54d335ef1f03c1d6a6ea6606e113 |     
microblazeel |        libarchive-3.6.1        | NOK | http://autobuild.buildroot.net/results/e39a47942f0e3814069922fd45db39f254d72f9f |     
   armeb     |        libdcadec-0.2.0         | NOK | http://autobuild.buildroot.net/results/975675a3a22fff9b1565ef61e3c5814b0e404fdf |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/21a337d395999d964d9899ad7bf5eca7414cf34f |     
   armeb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/51ad3269272304fe6cab6abe29268ed95eb52b96 |     
  riscv64    |          libqb-2.0.6           | NOK | http://autobuild.buildroot.net/results/a1c934679633073f9d9ea5b7d869dac33354ed97 |     
   sh4aeb    |  libtorrent-rasterbar-1.2.15   | NOK | http://autobuild.buildroot.net/results/7b2039b01960123350f7e646b937f0f77393cfdd |     
 microblaze  |  libtorrent-rasterbar-1.2.15   | NOK | http://autobuild.buildroot.net/results/dee4311bda84638b1630111256536f1f613611ff |     
   mipsel    | libuci-4b3db1179747b6a67790... | NOK | http://autobuild.buildroot.net/results/bbf723ad014429cc5670bb5ae98e726fc8809e50 |     
    arc      |          libzip-1.9.2          | NOK | http://autobuild.buildroot.net/results/429d1d28d70ea5286bb84a3f30309a7a01c9d1d3 |     
   mips64    |         libzlib-1.2.12         | NOK | http://autobuild.buildroot.net/results/2e6f94b4b3183fc6f7bd0c6d4a72a3b825904317 | ORPH
  riscv32    |    linux-5.10.109-cip5-rt4     | NOK | http://autobuild.buildroot.net/results/fec3aa809f26de8dd1dc62f2db3a7d77d02c567c | ORPH
  mips64el   |    linux-5.10.109-cip5-rt4     | NOK | http://autobuild.buildroot.net/results/42522afb83020a33f851b8ec5f49635587fe6fa7 | ORPH
   armeb     |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/5effbe7a1810f58d5d43291d048cdad1288b88c5 | ORPH
   s390x     |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/bef2c1bd4861acafa46c88f45098e5bdbb1ee215 | ORPH
    m68k     |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/f9e4360b874cf2fc70d18df0515dc4557bba791f | ORPH
    arm      |     ltp-testsuite-20220527     | NOK | http://autobuild.buildroot.net/results/4a3a08ccce5231eb60240570ac2e25b4c5d0ab42 |     
  sparc64    |     ltp-testsuite-20220527     | NOK | http://autobuild.buildroot.net/results/61ebd609c774a2c6c284e75f611405ff923dea35 |     
  sparc64    |     ltp-testsuite-20220527     | NOK | http://autobuild.buildroot.net/results/e3cc6e3e9d6799181d516bcc037f626240663465 |     
 microblaze  | make: *** Waiting for unfin... | NOK | http://autobuild.buildroot.net/results/42bb86cb112a82ad4ad69421ada234bc6117b95a |     
  powerpc    |           musl-1.2.3           | NOK | http://autobuild.buildroot.net/results/b13472d307b95e025ebef8b461d197cac812edca |     
  powerpc    |           musl-1.2.3           | NOK | http://autobuild.buildroot.net/results/82bf5f390b7288f3aafbf25867949e28e5585835 |     
   sparc     |        open62541-v1.3.3        | NOK | http://autobuild.buildroot.net/results/32e5515272da0dccc0d4595afe16743102de8889 | ORPH
  riscv32    |        open62541-v1.3.3        | NOK | http://autobuild.buildroot.net/results/79c4c8de677f5d4bb65a46eaa567614c6a4c77c6 | ORPH
    or1k     |         p11-kit-0.24.1         | NOK | http://autobuild.buildroot.net/results/9ed3c3bfef3ff1eae470d778f748481d4392fda2 | ORPH
powerpc64le  |           pcre-8.45            | NOK | http://autobuild.buildroot.net/results/9583be612aa0e3e0f5fb1d61f062b5e8a216ba7f | ORPH
    m68k     |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/13721b9c65b62cbb0c9d5af940276a3a3bbbb59d |     
microblazeel |           php-8.1.9            | NOK | http://autobuild.buildroot.net/results/e4ce0ad75d6d4aed68c8f9e3cbd6e7b7d6baff1c |     
    or1k     |           proj-8.1.1           | NOK | http://autobuild.buildroot.net/results/56b38437995abffb6a6db3410018f7bb67666bb9 |     
    arc      |       python-ujson-5.2.0       | NOK | http://autobuild.buildroot.net/results/9f567ba0ffbea97c2458e6c61593c16c7669b3d0 |     
microblazeel |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/c997c76d94dde78f727e5da0d45349a48df49077 |     
microblazeel |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/56d7b6fbf5d654c16b4441d7c6549d589b3793d6 |     
  aarch64    |          rhash-1.4.3           | NOK | http://autobuild.buildroot.net/results/7ca7c25d112dfd0097ee84ac5029fb620f395e32 | ORPH
    sh4      |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/94813d7b2cf0df5a94ff828374366e0bf414e5be |     
 aarch64_be  |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/0cf4d783f938543cd380d69525a144e8b2ba612c |     
 aarch64_be  |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/a751cde3f593f5e28afef1c7a5410189e95a5160 |     
   mips64    |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/98e61176460e66bf3aa951bf32b0bb43ee3853d3 |     
   nios2     |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/ae89cafc1c0922e8949275cc07aa889a89ab9cc8 |     
 aarch64_be  |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/14b10ffeb5dcf162bb4f580310736c1e9d578c86 |     
   s390x     |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/cfb535912b1722fb4873cadb037b92d068a63a2e |     
   s390x     |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/25358774aa15658b3c0e564fe362b0b18177f083 |     
   mipsel    |         systemd-250.4          | NOK | http://autobuild.buildroot.net/results/bca710a8ded22dc552fb0355c9450672eff368c1 |     
   nios2     |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/681f327a4dd116d58a2c38d1ad721345e96e2f99 | ORPH
   mips64    |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/239e99fe5b97653d8a4a1f0b4e588cfb2ad0493e | ORPH
    i686     |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/7ce853bc69304513854209d400e2705b7f0a7cfc | ORPH
   s390x     |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/2dc61ed11b64000d0cb32ac1f848e17ab77cb92a | ORPH
  sparc64    |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/31561022a982509b1641efe86b8f32fdead43da4 | ORPH
    arm      |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/f69897ba7bc9dcc947ff8823c5018fa9c0473455 | ORPH
    i486     |         sysvinit-2.99          | NOK | http://autobuild.buildroot.net/results/50a953a232e621f8508275771ae1e00190532878 | ORPH
powerpc64le  |         tealdeer-1.5.0         | NOK | http://autobuild.buildroot.net/results/aaa806b84de82f32b3b25af9b2d8ba2b98aa1b6e |     
  riscv64    |         uclibc-1.0.42          | NOK | http://autobuild.buildroot.net/results/af61755503000c0e81763cf7d76f81b4635b9c18 |     
  sparc64    | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/38eaa706ffea3d50c877e7987f5a6a1e0090c321 |     
    m68k     | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/6d0b126125ffc59b1bbef5fd03bd493308361f66 |     
 microblaze  |            unknown             | NOK | http://autobuild.buildroot.net/results/ff72c88b55033c79b064d3ad5bb4e0c9084a0e09 |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/eee055d3aad3da35b293deff10e1765ae2ebac6f |     
    m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/40188dc961698198cee9f1a86442aa84c6b9c1a1 |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/24a2b06343ccdfa10e8e3d504d1354b817a2aea7 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/3b650c7ca165c31f55e14e329ca07a127b8a2bc7 |     
   s390x     |            unknown             | NOK | http://autobuild.buildroot.net/results/d597ae77ebc63006be2d5de760752440fcc09aca |     
    i686     |            unknown             | NOK | http://autobuild.buildroot.net/results/c9400c0ce08237e6f1173c72e0de1f2da8e052f0 |     
microblazeel | uqmi-0a19b5b77140465c29e2af... | NOK | http://autobuild.buildroot.net/results/e5bd8f968fe75449ab512e6e5b0fbe994a2e6572 | ORPH
   sparc     |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/53f554eae6266df5046341e130c87d1601b6a985 | ORPH
  sparc64    |          zabbix-5.4.9          | NOK | http://autobuild.buildroot.net/results/fe85f0c829e399a31da46994815126a97fb6dfcf |     


Classification of failures by reason for 2022.02.x
--------------------------------------------------

      qt5webkit-5.212.0-alpha4 | 1 
                 weston-10.0.1 | 1 


Detail of failures for 2022.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |    qt5webkit-5.212.0-alpha4    | NOK | http://autobuild.buildroot.net/results/2ca7ca0a46b57a79fa553e72dec2643f5458a143 |     
    arm      |         weston-10.0.1          | NOK | http://autobuild.buildroot.net/results/9f0545fd09ca080249b8e15e5a23eb32f5c5fada |     


Classification of failures by reason for 2022.05.x
--------------------------------------------------

                     frr-8.2.2 | 2 
         graphicsmagick-1.3.37 | 2 
host-pahole-73383b3a39afe86... | 2 
            igd2-for-linux-2.1 | 2 
          host-elf2flt-2021.08 | 1 
               libglib2-2.70.4 | 1 
          moby-buildkit-0.10.0 | 1 
                 uclibc-1.0.41 | 1 


Detail of failures for 2022.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   arceb     |           frr-8.2.2            | NOK | http://autobuild.buildroot.net/results/6f229439103565dcf6e4722066bd94873b0c419f |     
   xtensa    |           frr-8.2.2            | NOK | http://autobuild.buildroot.net/results/947765ab11ae354061a0f02a9eaee406ca3a68d2 |     
   armeb     |     graphicsmagick-1.3.37      | NOK | http://autobuild.buildroot.net/results/f2eafe5832fc3700afccede085a45b5c2086ad18 |     
 powerpc64   |     graphicsmagick-1.3.37      | NOK | http://autobuild.buildroot.net/results/6044ac190ddfeea1cd3f3728382c357698782a61 |     
  riscv64    |      host-elf2flt-2021.08      | NOK | http://autobuild.buildroot.net/results/0e709b93fd4c2d4f3983e500271ee6470256dd2c | ORPH
   mipsel    | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/a2636ff71962f6b0a78bb9ee38c8993d27db4f44 |     
powerpc64le  | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/26b41fdda69379840b66619117edd04db84272c7 |     
   mipsel    |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/543471d13f2fb4e2f0f2d59252f3f4bf3cdf2359 |     
   x86_64    |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/9a9dbaec40e0617ea6e9645d8fcba811c8e264c4 |     
    arc      |        libglib2-2.70.4         | NOK | http://autobuild.buildroot.net/results/c9f20a8464de74af34ab9882162dd17d5a7ac72d |     
   s390x     |      moby-buildkit-0.10.0      | NOK | http://autobuild.buildroot.net/results/5922290c6dd405f5fa00b344029ce23c72b7b46b |     
  powerpc    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/9e24e2afd6dc6a7e9e333d09066174fc96bded22 |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
