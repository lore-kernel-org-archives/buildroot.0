Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5E01C3DA7D
	for <buildroot@archiver.kernel.org>; Tue,  3 Jan 2023 06:41:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4049881409;
	Tue,  3 Jan 2023 06:41:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4049881409
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DSpH60mZj5pQ; Tue,  3 Jan 2023 06:41:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0340A8148E;
	Tue,  3 Jan 2023 06:41:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0340A8148E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 666E71BF2CD
 for <buildroot@lists.busybox.net>; Tue,  3 Jan 2023 06:41:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3E6F841681
 for <buildroot@lists.busybox.net>; Tue,  3 Jan 2023 06:41:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3E6F841681
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YB4DgixqocWG for <buildroot@lists.busybox.net>;
 Tue,  3 Jan 2023 06:41:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B882141678
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B882141678
 for <buildroot@buildroot.org>; Tue,  3 Jan 2023 06:41:42 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 1DFB81C0005
 for <buildroot@buildroot.org>; Tue,  3 Jan 2023 06:41:39 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Tue, 03 Jan 2023 06:41:39 -0000
Message-Id: <20230103064146.3E6F841681@smtp4.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1672728099; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=UG4Ljw0eetCGkHWmkXKyiIwI0ASPiOjQsqRv2K1R27M=;
 b=SiEg2lbHzmpZeLVRBJV8sa4CorUATOqhEia/cCuvFx8hLCYciL7oVf5YVlBLB9nDvrJqv6
 blGT+w7M7zKLDU49GDr48Y9nR5FW3opGZD24XCouerMMcbOlT67xLgIZFGql+eYJAJ88ev
 vDjiaNCyLPl/gI7r2Kd5GXWY+rY+zecyijxtQtRiQ+pOjBUEeByXGwtAJ2TcnVYymLQwo7
 U7bCn2oH7ucDuJE2N+tQjLK/d8ynFkR67vSKvR4Bi/i+Ogh+oYcFC7jZQ/VvZSanv7FTjf
 5v8T+SDtV7FrGcyUCrQYnxkYrIkqfT/DGMigCP+OyiDBr8Mf0WlzoFfd5hQBSQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=SiEg2lbH
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-01-02
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

Autobuild statistics for 2023-01-02
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  |  2  |  0  |  0  |  2  |
  2022.11.x  | 20  | 12  |  1  | 33  |
    master   | 175 | 294 |  0  | 469 |

Classification of failures by reason for master
-----------------------------------------------

               host-fwup-1.9.1 | 26
host-go-bootstrap-1.4-boots... | 22
                    fwup-1.9.1 | 20
                       unknown | 11
                    bat-0.19.0 | 10
           host-libzlib-1.2.13 | 10
                     xz-5.2.10 | 9 
         host-sentry-cli-2.8.0 | 8 
glibc-2.36-66-ga1dc0be03c9d... | 7 
       host-gdk-pixbuf-2.42.10 | 7 
                    dust-0.8.1 | 6 
                    pixz-1.0.7 | 6 
                elfutils-0.186 | 5 
                gerbera-1.10.0 | 5 
              libgcrypt-1.10.1 | 5 
                    norm-1.5.8 | 4 
                  ntp-4.2.8p15 | 4 
           python-bcrypt-4.0.1 | 4 
    python-cryptography-38.0.4 | 4 
                    crun-1.7.2 | 3 
  gobject-introspection-1.72.0 | 3 
              host-pahole-1.24 | 3 
             libgpg-error-1.45 | 3 
                   linux-6.1.1 | 3 
                   perl-5.34.1 | 3 
                  sscep-0.10.0 | 3 
                    webp-1.2.4 | 3 
android-tools-4.2.2+git2013... | 2 
              dropbear-2022.83 | 2 
             f2fs-tools-1.15.0 | 2 
             fontconfig-2.13.1 | 2 
fs/ubi/ubi.mk:51: /home/aut... | 2 
fs/ubifs/ubifs.mk:49: /home... | 2 
                   gvfs-1.48.1 | 2 
                 haproxy-2.6.5 | 2 
            host-binutils-2.39 | 2 
                host-go-1.19.4 | 2 
              host-rust-1.66.0 | 2 
host-spirv-llvm-translator-... | 2 
              hyperfine-1.14.0 | 2 
                  jack2-1.9.21 | 2 
               libglib2-2.72.3 | 2 
          modem-manager-1.20.2 | 2 
                 nerdctl-1.0.0 | 2 
                 openssh-9.1p1 | 2 
                    opkg-0.4.5 | 2 
         python-greenlet-2.0.1 | 2 
ripgrep-af6b6c543b224d348a8... | 2 
                    sdl-1.2.15 | 2 
                   trinity-1.9 | 2 
                   ulogd-2.0.8 | 2 
                xenomai-3.0.10 | 2 
/home/buildroot/autobuild/i... | 1 
/home/buildroot/autobuild/i... | 1 
                    4th-3.64.1 | 1 
                alsa-lib-1.2.8 | 1 
        at91dataflashboot-1.05 | 1 
                  boost-1.80.0 | 1 
                    brltty-6.5 | 1 
                 coreutils-9.1 | 1 
             dahdi-linux-3.2.0 | 1 
                 dmalloc-5.6.5 | 1 
              erlang-22.3.4.22 | 1 
                 fdk-aac-2.0.2 | 1 
                  ffmpeg-4.4.3 | 1 
                   flann-1.9.2 | 1 
                     frr-8.3.1 | 1 
fs/romfs/romfs.mk:32: /home... | 1 
fs/ubi/ubi.mk:51: /home/aut... | 1 
fs/ubi/ubi.mk:51: /tmp/inst... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
                      gdb-12.1 | 1 
            host-binutils-2.37 | 1 
            host-binutils-2.38 | 1 
         host-gcc-final-10.4.0 | 1 
                  host-kmod-30 | 1 
                host-m4-1.4.19 | 1 
    host-python-greenlet-2.0.1 | 1 
           janus-gateway-1.0.3 | 1 
               libcap-ng-0.8.3 | 1 
           libfreeimage-3.18.0 | 1 
               libgtk3-3.24.35 | 1 
              libostree-2022.7 | 1 
               libvorbis-1.3.7 | 1 
          linux-5.10.145-cip17 | 1 
        ltp-testsuite-20220930 | 1 
                  mender-3.4.0 | 1 
                  ntpsec-1_2_1 | 1 
            ocf-linux-20171122 | 1 
              open62541-v1.3.4 | 1 
                    php-8.1.13 | 1 
pistache-3ec9d7c4f8b828fdd3... | 1 
           proxychains-ng-4.16 | 1 
           python-pyicu-2.10.2 | 1 
            quickjs-2021-03-27 | 1 
                 rtl_433-22.11 | 1 
        s6-linux-utils-2.6.0.0 | 1 
     s6-portable-utils-2.2.5.0 | 1 
                wtfutil-0.41.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   s390x     | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/720b45fb6a38f703afa970d0a304692f786fa253 |     
   s390x     | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/8d8220fd2d1e4f68c758b4fcbc200f72e65b8cf7 |     
   mips64    |           4th-3.64.1           | NOK | http://autobuild.buildroot.net/results/e57d1c3345c4a1eaf79dbe21dd7949113b2eb4f4 |     
    or1k     |         alsa-lib-1.2.8         | NOK | http://autobuild.buildroot.net/results/632cc2600c75e3944f4bd47cc5b3b0d0e6c710cd |     
   mips64    | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/9a4aa37899676a0b26c5fed483329fd639384e73 |     
powerpc64le  | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/444dba90062fc06a118594dd69555204922e6c21 |     
    arm      |     at91dataflashboot-1.05     | NOK | http://autobuild.buildroot.net/results/f313694a1712a56be3a9ab853f9a531981fe65bf | ORPH
    i686     |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/c79c766309b56c569946f9d31503ce70174efca4 |     
    i686     |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/36ebebb0dac1db1ec1e834705b97a83c34464de0 |     
    mips     |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/13bafbcd169d721adcb8a0ae17e42a4aaf22e96e |     
   s390x     |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/d1b3533cb2d81c73553b389b340f74f853b72827 |     
  aarch64    |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/0fb3bae45a45454611946e177458bca24ea673c4 |     
   mipsel    |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/d2c16e57040ed1c0ef813ac725d6e01183f24345 |     
  sparc64    |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/7e3da4c30bca57e0d2afb19c599592e80706c5a2 |     
   mipsel    |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/5beb661aa2e4b59437d08711237cb253b67861bc |     
   x86_64    |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/b8f19d66d318845037770d821f4ab049572e4963 |     
  powerpc    |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/cb0cf243c8a5fa2f76fe3b59dba5bde45f3bae00 |     
    arc      |          boost-1.80.0          | NOK | http://autobuild.buildroot.net/results/82e79e29a7c8e35d14c962358deeb733b4d389e5 |     
powerpc64le  |           brltty-6.5           | NOK | http://autobuild.buildroot.net/results/1680f813c6fde6f91386cf5685c71e9158d72904 |     
    sh4      |         coreutils-9.1          | NOK | http://autobuild.buildroot.net/results/6acce3afcb18bc27c5614dc4c1b5a6da098d5631 | ORPH
    m68k     |           crun-1.7.2           | NOK | http://autobuild.buildroot.net/results/3260a6f28567bf695941cf48809292ced0faaf8b |     
   xtensa    |           crun-1.7.2           | NOK | http://autobuild.buildroot.net/results/2be6fbccfec06aeb41c2a126544cef57539498d7 |     
    m68k     |           crun-1.7.2           | NOK | http://autobuild.buildroot.net/results/5cffbc01b737be983e45c6b7fd2c82b9626c2edc |     
  sparc64    |       dahdi-linux-3.2.0        | NOK | http://autobuild.buildroot.net/results/0f28f8c122de746850d33985a4d8c7c22ec47160 |     
  powerpc    |         dmalloc-5.6.5          | NOK | http://autobuild.buildroot.net/results/1eef9454142bc75605858ad8ca42faca7fb82885 | ORPH
  riscv64    |        dropbear-2022.83        | NOK | http://autobuild.buildroot.net/results/17a05c333ffd21787e1675365f642eb221edc054 |     
  riscv64    |        dropbear-2022.83        | NOK | http://autobuild.buildroot.net/results/904685d1a3f72abc3a549ca327c970022cf4ae7c |     
    arm      |           dust-0.8.1           | NOK | http://autobuild.buildroot.net/results/09e56d9790d0ec13ca4945a01b172e44d48a1a76 | ORPH
  sparc64    |           dust-0.8.1           | NOK | http://autobuild.buildroot.net/results/ac72ca9b3e913b5c597003db8996e06fd706c3c5 | ORPH
   mipsel    |           dust-0.8.1           | NOK | http://autobuild.buildroot.net/results/42c175f4efa19901a1428a5322ebfbfb7cf3636f | ORPH
   mipsel    |           dust-0.8.1           | NOK | http://autobuild.buildroot.net/results/a12c3db4988c0ac560747a6054d0591405bd554a | ORPH
   mipsel    |           dust-0.8.1           | NOK | http://autobuild.buildroot.net/results/db0e51936d977d7e9f29ac8b539b70276f2999ae | ORPH
  powerpc    |           dust-0.8.1           | NOK | http://autobuild.buildroot.net/results/d5f08e1ac583a5c5179cccc2bb890aeee71f85fc | ORPH
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/b65412a0441d494fcb2ce57519098c990a0f5996 | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/9e652c6cfb61740cfa29a7138ade9cca7ccc5285 | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/1f5e8e26f92bcd2fb054b6efc2fbb5154548b2b3 | ORPH
   arceb     |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/41be3b1fce5f65d65b4754db85a0dc28c320f899 | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/ee7ddb4131ef7da585b536c7174bca9b01efc5cb | ORPH
  sparc64    |        erlang-22.3.4.22        | NOK | http://autobuild.buildroot.net/results/42ba444ae4b86c7664e77fb6d1cb83cceedb1d63 |     
    or1k     |       f2fs-tools-1.15.0        | NOK | http://autobuild.buildroot.net/results/a275b11d868ae9e11f63d1042ababaef8d67d857 |     
    or1k     |       f2fs-tools-1.15.0        | NOK | http://autobuild.buildroot.net/results/51147fea428c3712d95e0a758a625dc99d67e863 |     
   sh4eb     |         fdk-aac-2.0.2          | NOK | http://autobuild.buildroot.net/results/01a1ef2f52c16e6789969b24e7bd165c80abfb3d |     
   arceb     |          ffmpeg-4.4.3          | NOK | http://autobuild.buildroot.net/results/4700ed7ef6c32ea434615bf119838424f1c0cb67 |     
    mips     |          flann-1.9.2           | NOK | http://autobuild.buildroot.net/results/0e2ad7c56957f8bd9ab5f962e052da319fad2ff6 |     
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/b4cfa0f989173ea614ae556f1154ec1e30fb55c6 | ORPH
  riscv64    |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/1409dc36feb8a119bf325e69b15da76b5c38a1ec | ORPH
   arceb     |           frr-8.3.1            | NOK | http://autobuild.buildroot.net/results/c2f7a59260e223420c2ec3889208c228474a1b24 |     
   arceb     | fs/romfs/romfs.mk:32: /home... | NOK | http://autobuild.buildroot.net/results/13f51489eb3f68a033d8393a0ed68ec7a27f448e |     
    mips     | fs/ubi/ubi.mk:51: /home/aut... | NOK | http://autobuild.buildroot.net/results/b8f8143b16b87ed629fb73a20272f2b440a430b6 |     
   sparc     | fs/ubi/ubi.mk:51: /home/aut... | NOK | http://autobuild.buildroot.net/results/1252c6ab5e98dffa48c8285ea7ced8dc035a5d5b |     
  sparc64    | fs/ubi/ubi.mk:51: /home/aut... | NOK | http://autobuild.buildroot.net/results/45fbe25691fc983e916337d3b6fc106a071806b1 |     
   mipsel    | fs/ubi/ubi.mk:51: /tmp/inst... | NOK | http://autobuild.buildroot.net/results/fc2db651e5145218e5dc522b8b35738bcf729a17 |     
  mips64el   | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/8f5537234a25ddab1c56cfc73c06eb86e77dd8f2 |     
    arm      | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/ed9c003accdc4a928ba0b3d30bb3daf07c114c58 |     
    arm      | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/854f55f3afc1de7be37620359cec68c2bd2a12de |     
   x86_64    |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/6cfb7ac0f3e43f4d86ca72747644d6cfce96919c |     
microblazeel |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/172d3eade8211dde8da846d133e972d67868f9a5 |     
    arm      |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/0b5b1e5b4b7b9cffddabed20ef1fbb86da602cbf |     
   nios2     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/d83c5957495013013b016f6bba42f094538abd5d |     
powerpc64le  |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/a05ffba9bc86a06ef1ac1ed1ea1855ab5f12226c |     
powerpc64le  |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/596f0acdf70b256937dd4463562ac19cc8808cdc |     
  powerpc    |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/2b8f1bcce5ec8c5c0ff13220c2916c63e37b4499 |     
    or1k     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/b28bd5b9cd86d644b4a0cb45342b9fe15a80afd9 |     
   nios2     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/dbbbbb8794055e11aad6d161883b5aaee80f0ca2 |     
  sparc64    |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/c977e59ec7d6ba9ed1724d7b337bd8db59f1ba53 |     
  mips64el   |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/a296fd9aef98fb84a41a1f4d8646a3cc2c978f1d |     
   s390x     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/cb7e4c8097099bcbac1025fe56459377a1a2a25c |     
 microblaze  |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/4504e37b6195cb344e403934300c23971a0d0584 |     
    mips     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/f8beaa4c997603fb87d8f0ce85b0338a3328ba09 |     
    arc      |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/b9ae8abeb9ea4deeee2a9f1de98533c2f59c97c0 |     
powerpc64le  |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/75d259c3f1d1357d6690937ca5adeb2b06d64681 |     
    i686     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/daa11fce71a8e351c9778db01f710c2bed371b71 |     
  powerpc    |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/a74685c57de1f742f63f255cc2382e1703b11f1d |     
   xtensa    |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/5893db2076bab398d3951e0477bdfe21f064cd4f |     
    mips     |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/ff1e841ff761c112d536265f7406b73e594cd651 |     
    or1k     |            gdb-12.1            | NOK | http://autobuild.buildroot.net/results/03158337f50c44e6c406d8750578817955f37df8 | ORPH
  riscv32    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/2ea7c2189dee3b780f12fa12564206eff24496bd |     
    m68k     |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/32bdda7a0fa5baf4cadc6f51a7b52ba47ba0e76d |     
   nios2     |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/491a2380c5345793a39d814959945b2aac3f1bd9 |     
   x86_64    |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/9f993c4ba5c59915e58ac92535d6f3ae9f3d648d |     
   sparc     |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/cde4183279ec46b0bce688cb6493d26ed21a9e18 |     
   arceb     | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/fd5c8ebae49d08e6d07ac6d75a45b9a0fffec0a1 |     
powerpc64le  | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/ed8cd862388f2c0b9825e4eafa5e02dfc00c8d01 |     
  powerpc    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/f4d0e7ac65076000ef6eef32fc62f44d1029313a |     
  powerpc    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/4bc2a11b7636840cfb0bd3e88aa1f518c0a18354 |     
  powerpc    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/689c6b1b9e627466bff7e70aa2f6e532b98caa9c |     
  powerpc    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/d9f9a3b494861867b10eb831eaba8efa1c9cb241 |     
  powerpc    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/1a2ed0cdac92deba3acc185f37dfe44070070be2 |     
 powerpc64   |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/507834576a7d08a6225320ace2d1aa2e21e5143b | ORPH
    or1k     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/0f8bc32d4c1f3777805f61f34e179175613f8f19 | ORPH
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/5375dd6188e708d83ef2b1311878c5ff7b98092f | ORPH
    mips     |          gvfs-1.48.1           | NOK | http://autobuild.buildroot.net/results/ea14bc53612ef4c26a0fe15cc0eefb45339497c6 | ORPH
    mips     |          gvfs-1.48.1           | NOK | http://autobuild.buildroot.net/results/068962803c2f743ea8b32e1c9fc24376ab1c2202 | ORPH
    sh4a     |         haproxy-2.6.5          | NOK | http://autobuild.buildroot.net/results/c6e126f89d34d51aebd837ad42790c056ac1ee7e |     
   sh4eb     |         haproxy-2.6.5          | NOK | http://autobuild.buildroot.net/results/93ae961e33332b4b94d3b7e2b31ba26bb32533b8 |     
   nios2     |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/3775e5eea045e33c8017827a94fda6ff11895796 |     
microblazeel |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/d815af29b6bf02d66ea057669dcea1e94a5ff9a3 |     
  mips64el   |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/2ba8fc4b4d93728b3228ab36edccbb83cbb5453b |     
microblazeel |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/e55804ac5645d1610e96657a55802f10cdf060e6 |     
 powerpc64   |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/1bbd1458a7f3dffae9e94c8d97146263a646a7c3 |     
powerpc64le  |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/22cfb335a2782d15da7826d97bcf16f348f7a60a |     
 microblaze  |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/c1d9483452df707c313410b89df149359665f2ee |     
    or1k     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/38557a34e206ed7b1b6b9cfc251f418070553589 |     
   sparc     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/db2f74c219b14fd828a556bee252bcc4b5dc04b1 |     
    arm      |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/aeae879377b637706ddc107187a6fc8e47a383f3 |     
    arc      |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/981e48b97858256243b6400b7d4fb4ff6f1e1be6 |     
  mips64el   |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/17c3538787195b1c9aecbb4f3bf56e3209b76566 |     
 powerpc64   |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/4616516f6359c051d4b110d13a068182a93b813d |     
powerpc64le  |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/370048d62ee640a69a9fb03a1b7ee97e9a5ca436 |     
    mips     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/f2d38e2582ade4dc5e9e6721c6967af44356d117 |     
   armeb     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/b55861f664f5e2843a6be6506c51a86025f1af9f |     
    mips     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/eb5211a163d9c0dd8a143bdc89ce1001a2b8a0a5 |     
  powerpc    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/6b6c5068e83f3ab7cc025327802b556e166434e4 |     
   arceb     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/66252478d81d45aeb2b72f380d1898a254067ee5 |     
  sparc64    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/c46aa1e64f8269a6e2a744904affa88ef618cf67 |     
    or1k     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/cddb0cf5db1bbe5a056b3eb0ce1264a90d029cac |     
   sh4aeb    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/6e761cf1752ced44a92187c0da6e7e0b733b432b |     
 powerpc64   |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/3f828678a18534b696fc806ee60ebae9502787da |     
   arceb     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/8e5157dce8815973f91cfedc736136520ab242b1 |     
microblazeel |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/872fa7df51cd3c7ffdc1fb2cb7254aee1f21bcc1 |     
   x86_64    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/8873ff42d613398d2695444a1000691161d9eb49 |     
   nios2     |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/e2b1cbf719dd4a5d7cd314a020785e52deb21448 |     
  sparc64    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/8d06acd29b746f047e6f79d34b9e28de87abb362 |     
microblazeel |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/b8b80de9016c49d72d606ffe56cf53d7ddc76376 |     
  powerpc    |        host-fwup-1.9.1         | NOK | http://autobuild.buildroot.net/results/5415c478a0765584cefe061d2d8d272b1e977791 |     
 microblaze  |     host-gcc-final-10.4.0      | NOK | http://autobuild.buildroot.net/results/42de9830fedfef2d554363267c01b2256ee7cf55 |     
   mips64    |    host-gdk-pixbuf-2.42.10     | NOK | http://autobuild.buildroot.net/results/bc3ef5cc2dae10a5dfa853ada66fd014c23639fb | ORPH
powerpc64le  |    host-gdk-pixbuf-2.42.10     | NOK | http://autobuild.buildroot.net/results/26634ba07021c9ba8f047a11154a6aa4fa53d516 | ORPH
    or1k     |    host-gdk-pixbuf-2.42.10     | NOK | http://autobuild.buildroot.net/results/ac1b2afd6a1052aa6112ee2bf5f9141c3cfa10ec | ORPH
 powerpc64   |    host-gdk-pixbuf-2.42.10     | NOK | http://autobuild.buildroot.net/results/c86f3e4054c2367e03b9a78f1ae122d8144b69b0 | ORPH
 powerpc64   |    host-gdk-pixbuf-2.42.10     | NOK | http://autobuild.buildroot.net/results/eb7d17bdaa450ab6996cf19b4bf7579d5976d15d | ORPH
    or1k     |    host-gdk-pixbuf-2.42.10     | NOK | http://autobuild.buildroot.net/results/d695a1b20df08b662a65a710adcf9316bbe546b2 | ORPH
   sparc     |    host-gdk-pixbuf-2.42.10     | NOK | http://autobuild.buildroot.net/results/c3824a351bfe5f6c6930a8965b835485c76c7b58 | ORPH
  mips64el   |         host-go-1.19.4         | NOK | http://autobuild.buildroot.net/results/06a76604c6a2a4cfcaf5bae58efc641ed082d15f |     
  mips64el   |         host-go-1.19.4         | NOK | http://autobuild.buildroot.net/results/f689496865e5dcd82889d9a91b90d4fa32d385fd |     
   s390x     | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/58373df6e79dd95c519c6ba83719d2122c241e97 | ORPH
microblazeel | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/1cce4553dcf61828c0a51238a4c11d92fa1e5311 | ORPH
   x86_64    | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/df53f42c75f36497a97c17e89ad606d2afcecadd | ORPH
  mips64el   | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/81d82ebb274c12b470b1c4c993a9c2fa2af255a6 | ORPH
  aarch64    | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/1f8842c426001df6159faaece000438637219f57 | ORPH
powerpc64le  | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/c051a2e5ffea291208d8f4d00f3cc86ff14c6eb5 | ORPH
   x86_64    | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/34a47c5bd7aac277c087912ddbcc58d669b3c618 | ORPH
    mips     | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/92b447f7e2fc1e79415580710cba54a987ceaf4b | ORPH
   mips64    | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/9d22a2598b1eee050e340d89591c469500c8bafc | ORPH
powerpc64le  | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/91c25884b1e53be14964de8e3b28694b9f11e190 | ORPH
   mips64    | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/de6b3a6b6c62b99a399a7fda6f1debd571d37d75 | ORPH
  aarch64    | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/904a69d227731653dfa9851c971e4f92f5572d6c | ORPH
  powerpc    | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/9e29118098908edc930ae266f8d148e6f90bd84b | ORPH
   xtensa    | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/322a48b9e92348218e664793dab2a72f22f163e1 | ORPH
  riscv32    | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/a50a4756daad3331b07407e49a14825c61fff1f0 | ORPH
powerpc64le  | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/d48a5ba16f39414f6ffb1c1e2eb88fb06631488a | ORPH
   x86_64    | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/0130270a0c259465f0e70f3b310808106d8f1786 | ORPH
    arm      | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/1d69a08bb7a7830d9ac49e32af0e0526db40d047 | ORPH
   x86_64    | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/cca986ca8a4e1ca6741138c21a46b9d8d68fc8aa | ORPH
  riscv64    | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/0c67ab3b93ff973d79b0b7fd91f9f6233446e95d | ORPH
   x86_64    | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/7463fe2287cfda68047cb97b85a347f2b9ebf807 | ORPH
powerpc64le  | host-go-bootstrap-1.4-boots... | NOK | http://autobuild.buildroot.net/results/89e5c2777149e1df40f880ede99acbb9d7da8c8d | ORPH
  aarch64    |          host-kmod-30          | NOK | http://autobuild.buildroot.net/results/b4a21d133b1ae98c4804adcce8baf07830821d70 |     
powerpc64le  |      host-libzlib-1.2.13       | NOK | http://autobuild.buildroot.net/results/ca34a27bbdaf411dda1f32e4155d775923714b4c | ORPH
   mips64    |      host-libzlib-1.2.13       | NOK | http://autobuild.buildroot.net/results/8189b72f3194980e4deb808ff06589b2e84f1a26 | ORPH
    or1k     |      host-libzlib-1.2.13       | NOK | http://autobuild.buildroot.net/results/402d95fd50d22dd9128ea49636af8f6511543ba7 | ORPH
    m68k     |      host-libzlib-1.2.13       | NOK | http://autobuild.buildroot.net/results/21462cb89000b055b5adacffb3cd23cba22f03f9 | ORPH
microblazeel |      host-libzlib-1.2.13       | NOK | http://autobuild.buildroot.net/results/35933d2989fe37e5c82381b46c419f9b0ceded0b | ORPH
   s390x     |      host-libzlib-1.2.13       | NOK | http://autobuild.buildroot.net/results/087734fdf4cb39018e49f38232016b97a235be19 | ORPH
    mips     |      host-libzlib-1.2.13       | NOK | http://autobuild.buildroot.net/results/601e3fd9fa3c631717a889aee7c0e2093731af0c | ORPH
   xtensa    |      host-libzlib-1.2.13       | NOK | http://autobuild.buildroot.net/results/3de778bbe231b36a0c706dfaec72724609a803a9 | ORPH
   arceb     |      host-libzlib-1.2.13       | NOK | http://autobuild.buildroot.net/results/cd6a401b58dfa9cf6bb5777de418f8762372808e | ORPH
   mips64    |      host-libzlib-1.2.13       | NOK | http://autobuild.buildroot.net/results/2116dc885c3c24c9aaa2991beb1ce6b058b05b0b | ORPH
  aarch64    |         host-m4-1.4.19         | NOK | http://autobuild.buildroot.net/results/f9ba4c1ae6e2e66a7f821359cfd02d61574a2631 | ORPH
 microblaze  |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/df3e6a6959e4c9e32f6482ac0a8e3574aaad035a |     
 aarch64_be  |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/ff2307c4442ae8852e733027f5fe49394a547d7f |     
    mips     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/e36ed02f199d3c11ec1d252ef94b588349d02ca9 |     
    sh4a     |   host-python-greenlet-2.0.1   | NOK | http://autobuild.buildroot.net/results/08532904688f8e760151a5ebcc25bbb5c4628dab |     
  aarch64    |        host-rust-1.66.0        | NOK | http://autobuild.buildroot.net/results/7bc59a5aaf9d08fe25de989fc30607af8919a1b3 |     
  sparc64    |        host-rust-1.66.0        | NOK | http://autobuild.buildroot.net/results/e598b36757a43694c290bd7a684c79dac769af58 |     
 powerpc64   |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/5739d7c97c4841ae07abed70eee5841a79601433 |     
 powerpc64   |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/3b22379794778582003a05b8cd340c034d457aff |     
    m68k     |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/aaf2666cf1efb8c5d8b2a8639f5fdadfcedf6481 |     
powerpc64le  |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/34d0fc33786a8f8cc69e93b86919ce491b2cfab4 |     
 microblaze  |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/d0d5a23a0303dc33e9d70e39f5135f4751d30de1 |     
    m68k     |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/619e13b6bc2d1fbb2416b058e021f23bfa3384a1 |     
   mips64    |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/d395b920b84820804003b4a7fc45154289f22600 |     
    arc      |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/33d0abddccf21c3a86254d39b291959183e7333c |     
    i686     | host-spirv-llvm-translator-... | NOK | http://autobuild.buildroot.net/results/4e1f192e6d42a3eacee975d3b3bab8358b8dfac5 | ORPH
    i686     | host-spirv-llvm-translator-... | NOK | http://autobuild.buildroot.net/results/8b68c136860d08a5bae2f705df14702b8b3a64cc | ORPH
  mips64el   |        hyperfine-1.14.0        | NOK | http://autobuild.buildroot.net/results/5ba074954955ccf326e42df3c049f4b16426a029 | ORPH
  sparc64    |        hyperfine-1.14.0        | NOK | http://autobuild.buildroot.net/results/5637164ffb04bc49c666e81f5287593c876a7299 | ORPH
   x86_64    |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/a5a2ce375162845398f7cf7096cbe20fc0ffb4ac |     
   nios2     |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/87bf54b45f195b2364b0c319ae36e300c7e456d5 |     
  aarch64    |      janus-gateway-1.0.3       | NOK | http://autobuild.buildroot.net/results/eb71cbc03dc515ca60fbfc160b732547f7555fb2 |     
    or1k     |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/6a03fa402fe8d9b09e9244f27388be8e308fef4f |     
powerpc64le  |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/073e9cc3c4a3a22b2b57947a99897f4376a79a85 |     
   armeb     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/8ba0c1ca47bfe0bf38fff01c5896fefe8bc55789 | ORPH
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/e091b8ba92d93abbd2bd0010d95a472dc90bd6d3 | ORPH
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/9b43d39c482daa8ce79c54d3872be6503fe5bc0e | ORPH
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/416c7850db8f72e0bb22aaee8e36e23e81f59f4a | ORPH
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/f8138fb980c82279f190b3319e71c0525da719f9 | ORPH
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/5a024bd44a0136ada6841ebead0783ea220833cb |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/06ba499e001d03b308afc789db3f9086b08d0bb9 |     
 aarch64_be  |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/e33cb37acf41f4d807ddb121cab48abf3240284e | ORPH
 aarch64_be  |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/a1558befecae7c854ffddb92ef1c25bcce650360 | ORPH
 aarch64_be  |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/6efc5bef8f8d47f9cf109b4b0257215941e3ce45 | ORPH
   mipsel    |        libgtk3-3.24.35         | NOK | http://autobuild.buildroot.net/results/d3a65322df598e3ca1837d8703f9db370e5acd5a |     
   sparc     |        libostree-2022.7        | NOK | http://autobuild.buildroot.net/results/1df299b8b0dfb4f50a4f25e74f40566abf8fb2c9 |     
  powerpc    |        libvorbis-1.3.7         | NOK | http://autobuild.buildroot.net/results/c93dd35a159d957678b348ca6cd1719c3ce17e64 |     
    m68k     |      linux-5.10.145-cip17      | NOK | http://autobuild.buildroot.net/results/e9e949797346d6ea5f9073e1baa792b9dbc02462 | ORPH
    arc      |          linux-6.1.1           | NOK | http://autobuild.buildroot.net/results/781258a9e05128bc73f7c88eb2b217b6000d776a | ORPH
   mipsel    |          linux-6.1.1           | NOK | http://autobuild.buildroot.net/results/d52ffe3f23d4409a4ff13f2a92d820541fdfb4f6 | ORPH
   x86_64    |          linux-6.1.1           | NOK | http://autobuild.buildroot.net/results/e515f9e4c262648ba7e925d0e509ca73af08b47b | ORPH
  mips64el   |     ltp-testsuite-20220930     | NOK | http://autobuild.buildroot.net/results/a54d44fa826c9e1e632edbbebbafcc002a962e2c |     
powerpc64le  |          mender-3.4.0          | NOK | http://autobuild.buildroot.net/results/080a47de44162db4a517d7d85f38ea368b401bec |     
   x86_64    |      modem-manager-1.20.2      | NOK | http://autobuild.buildroot.net/results/28545dcba9c86bce725639bdffbb702fef813cea |     
  mips64el   |      modem-manager-1.20.2      | NOK | http://autobuild.buildroot.net/results/18be587c292b8a242f5d525ce45c0533c01ab6af |     
powerpc64le  |         nerdctl-1.0.0          | NOK | http://autobuild.buildroot.net/results/4d2d6d0a481eb9fdc115dc5d9139a2dd952a7d2e |     
  aarch64    |         nerdctl-1.0.0          | NOK | http://autobuild.buildroot.net/results/85980a5a3f975010a271998067f1f51b21722a7c |     
   x86_64    |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/c230a811f53ec192acc16cee8706615b5fdc2d35 | ORPH
   s390x     |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/7888463d05897e8d68820cd4a16e30dcd441c965 | ORPH
    or1k     |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/9d716077a64cf630c3f2a7206f70591ca55dd284 | ORPH
    m68k     |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/0868cc77c262c509655df96c7416ff6fc70566cb | ORPH
   sh4aeb    |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/aad8e1b81aed23a595374a68238eafbb67269f83 | ORPH
  riscv64    |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/b1e0375d9eab571471e5d94e4d8e19310a129b97 | ORPH
    sh4a     |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/81fb8ea48879f34d257a09dbf5954e1e53c10cd0 | ORPH
  riscv64    |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/e8d702593aac4fef1032410065761c042428cb74 | ORPH
   xtensa    |          ntpsec-1_2_1          | NOK | http://autobuild.buildroot.net/results/3b17ff9d9a2bad8637199a734f6861f36f1b9c76 | ORPH
   s390x     |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/7785a666325385bf3ce52686bc6795ec0b07db74 | ORPH
  mips64el   |        open62541-v1.3.4        | NOK | http://autobuild.buildroot.net/results/20fbfa35055a8e70d8960c9bae032d7b48e0ef96 | ORPH
  sparc64    |         openssh-9.1p1          | NOK | http://autobuild.buildroot.net/results/cc947279b2a8a5648b9df0008b73fc0f2e639ecb | ORPH
    m68k     |         openssh-9.1p1          | NOK | http://autobuild.buildroot.net/results/f12c7884f6cae0ca0ca6071d6293e96b0f95b782 | ORPH
    mips     |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/abbdf3efff076446d92df2e1ac7fac76c7cd24b4 | ORPH
microblazeel |           opkg-0.4.5           | NOK | http://autobuild.buildroot.net/results/267543fc8a4692160f218d5732a5782a72b6b755 | ORPH
   xtensa    |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/6b51b7ec3317db0851fdf754521d22d50e69afa9 |     
 aarch64_be  |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/c60ebf16ee428896c7b9b71c44ecd4acc72646da |     
    arc      |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/420a90b11d734230d638904ec27222539d478c18 |     
    sh4      |           php-8.1.13           | NOK | http://autobuild.buildroot.net/results/f2f438b3c1a73f1d1f4818c08f73ad0f95b14aab |     
 aarch64_be  | pistache-3ec9d7c4f8b828fdd3... | NOK | http://autobuild.buildroot.net/results/00d2cc70506e8653b197c25d7e6a37f7b5943cc3 | ORPH
  powerpc    |           pixz-1.0.7           | NOK | http://autobuild.buildroot.net/results/61829da575ca352847738ff1ff58365f9311d230 |     
  mips64el   |           pixz-1.0.7           | NOK | http://autobuild.buildroot.net/results/731f1865d67b900ac058a9e0731713080cbc71e4 |     
    mips     |           pixz-1.0.7           | NOK | http://autobuild.buildroot.net/results/ff6bd20f0c16feaa7c41886f9d3ded587d937225 |     
   mipsel    |           pixz-1.0.7           | NOK | http://autobuild.buildroot.net/results/fa1a452cef74e6ed139bb992e7623c1eaf45f041 |     
 powerpc64   |           pixz-1.0.7           | NOK | http://autobuild.buildroot.net/results/a4831024b8f28cfeaed73956f2e11386ac4b0b0d |     
 aarch64_be  |           pixz-1.0.7           | NOK | http://autobuild.buildroot.net/results/13db7968c832a0e5860fc5b18225823d5888f39f |     
    or1k     |      proxychains-ng-4.16       | NOK | http://autobuild.buildroot.net/results/b526b886f9f75d2363545ffd6ef40b73859027bd | ORPH
   x86_64    |      python-bcrypt-4.0.1       | NOK | http://autobuild.buildroot.net/results/0baed6ff6daa11523b54379bfef5765e4a8be0ee |     
  sparc64    |      python-bcrypt-4.0.1       | NOK | http://autobuild.buildroot.net/results/e0a72f0d5d7421e995261686b28822af377b718c |     
   x86_64    |      python-bcrypt-4.0.1       | NOK | http://autobuild.buildroot.net/results/b6bfe74d27da3d5e08c36f59e56ff698d014ce9c |     
  sparc64    |      python-bcrypt-4.0.1       | NOK | http://autobuild.buildroot.net/results/fa214addbac9e9a99a701897e000676c0865bb32 |     
powerpc64le  |   python-cryptography-38.0.4   | NOK | http://autobuild.buildroot.net/results/78ffe0122199b8b27d674edb857d1d077120f089 |     
   mipsel    |   python-cryptography-38.0.4   | NOK | http://autobuild.buildroot.net/results/0d57002804b0bae6c521a32e1c6d4bfef82e79cb |     
powerpc64le  |   python-cryptography-38.0.4   | NOK | http://autobuild.buildroot.net/results/337247f821ac40e2c527a98d79c415f38c071010 |     
  powerpc    |   python-cryptography-38.0.4   | NOK | http://autobuild.buildroot.net/results/72c4c06fdabff726e7122b4d629666560baf15cc |     
    mips     |     python-greenlet-2.0.1      | NOK | http://autobuild.buildroot.net/results/101f9d1d07c4eebc89b968407162185e678f7f99 |     
    mips     |     python-greenlet-2.0.1      | NOK | http://autobuild.buildroot.net/results/44ff1eba1a614d8cace4277ccfa4e9456a3b5a18 |     
   arceb     |      python-pyicu-2.10.2       | NOK | http://autobuild.buildroot.net/results/e06257f07647b8f1d4830c3bbf0c1f4e91cbaef5 |     
   armeb     |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/8d8eabddad798efce3e27a17402a0e2560e3ceb4 |     
  powerpc    | ripgrep-af6b6c543b224d348a8... | NOK | http://autobuild.buildroot.net/results/93a473cf5f80ca0dd0cd8f85e1cafd6493235649 |     
powerpc64le  | ripgrep-af6b6c543b224d348a8... | NOK | http://autobuild.buildroot.net/results/4748fd480a31f08c0dbb4aaa47cbb240fa9193d1 |     
    arc      |         rtl_433-22.11          | NOK | http://autobuild.buildroot.net/results/069cff7f90c75c94796e2e4f3e7ce64a33612518 |     
  mips64el   |     s6-linux-utils-2.6.0.0     | NOK | http://autobuild.buildroot.net/results/e3febcf3960f8435ac9b35a38b43d13c82342bca |     
microblazeel |   s6-portable-utils-2.2.5.0    | NOK | http://autobuild.buildroot.net/results/4dc10a647b3b33c803a5f4f4ee39e808007df5d0 |     
   sh4aeb    |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/fb8a32773e0654a41a234683e19c3aaf57dc41a0 | ORPH
    sh4a     |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/efbf625818d11137055886aa08d42096b7f6bd87 | ORPH
 powerpc64   |          sscep-0.10.0          | NOK | http://autobuild.buildroot.net/results/b53cb9143db7c6c9a44539c002035da4e9dc1841 |     
  riscv32    |          sscep-0.10.0          | NOK | http://autobuild.buildroot.net/results/5cd241fad1d6605116d81c18701e4ff8bab69adf |     
   arceb     |          sscep-0.10.0          | NOK | http://autobuild.buildroot.net/results/2fb3eb75eb8f6dc9a61c30c732f4effd59058290 |     
  aarch64    |          trinity-1.9           | NOK | http://autobuild.buildroot.net/results/36a7a2d8b5c51c967f31360b3b0b85e816736a06 | ORPH
  powerpc    |          trinity-1.9           | NOK | http://autobuild.buildroot.net/results/8a220c406595c3317bfc3924c7c22767bb3e2f05 | ORPH
    sh4      |          ulogd-2.0.8           | NOK | http://autobuild.buildroot.net/results/042783b446c4d339a6d7e23ebc8d0575af4eb232 | ORPH
   nios2     |          ulogd-2.0.8           | NOK | http://autobuild.buildroot.net/results/a059be353b7464d4e6a7830a685b43bdd7ecd5fa | ORPH
 microblaze  |            unknown             | NOK | http://autobuild.buildroot.net/results/fbe214f9534623d6e50e55cc36c112a598880662 |     
powerpc64le  |            unknown             | NOK | http://autobuild.buildroot.net/results/e6005b7793c49796a4178270d49e74b5f61f9ef0 |     
 aarch64_be  |            unknown             | NOK | http://autobuild.buildroot.net/results/29e16af78cff48cc0cb0fcc21ebe70ae23582345 |     
   sparc     |            unknown             | NOK | http://autobuild.buildroot.net/results/1ac65e0cb2d785966fac1a07a2ccd7be7e5028c2 |     
   sparc     |            unknown             | NOK | http://autobuild.buildroot.net/results/6278b4e1cf5f5e333e343e6e1e9891b57b133f30 |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.net/results/17a99b01b1b456f837fc62407626c5d2ddfa1202 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/6819f0e862598345d9d6d9a8bb2736431da8786d |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/ac7cefdcb6a8014f7a2d0f6037a71018164a2bc1 |     
 aarch64_be  |            unknown             | NOK | http://autobuild.buildroot.net/results/63be2de5f906b7f594271b2745be1f63236502eb |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/2a805cf7fba9ef2bc7e2cea078870db4fac4e936 |     
    i586     |            unknown             | NOK | http://autobuild.buildroot.net/results/4e9ba8c8c7da538692563fce2906ef7b45d11367 |     
 powerpc64   |           webp-1.2.4           | NOK | http://autobuild.buildroot.net/results/4f2686687d032b3dd50b895ceb5940413913de20 |     
  mips64el   |           webp-1.2.4           | NOK | http://autobuild.buildroot.net/results/fa4ebb2675f349c1a2b47798faec63da4c357af0 |     
   mips64    |           webp-1.2.4           | NOK | http://autobuild.buildroot.net/results/9564a41f4256f84cec2dbb77207dbe436461d81a |     
  mips64el   |         wtfutil-0.41.0         | NOK | http://autobuild.buildroot.net/results/7ddf6263eceacfd6864a396ea98baf1b1aec8248 |     
   nios2     |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/f217c41b8e9cd8573bc50d0219aaceaaa0afccae |     
    mips     |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/7629405c3d99ae7be0101f2de36bef5649985f66 |     
microblazeel |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/9087b1707f84ca740373bdc10aa83fff1e687607 | ORPH
 microblaze  |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/76291b4826e737e007712fe3c3224a8c31b2c577 | ORPH
 microblaze  |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/3cf43546427361497a55aff5d08d176688018988 | ORPH
 microblaze  |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/338e7c51dd8217516f45d073b1df1d9b7f38c6c8 | ORPH
microblazeel |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/0cc7b232744d47136425007ff3b2c9a5c140b1de | ORPH
 microblaze  |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/2084f02f1c771a62de27fd0e22ee773f2f691d05 | ORPH
microblazeel |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/f428ed0f02ccca033a1e934c5417d67d02e0c6c5 | ORPH
microblazeel |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/c872be6e5541fe15e0108d3414210f36d84b717e | ORPH
 microblaze  |           xz-5.2.10            | NOK | http://autobuild.buildroot.net/results/0ff318c7edcd767572cf8dfd06f6bfa077ba43f1 | ORPH


Classification of failures by reason for 2022.11.x
--------------------------------------------------

/home/buildroot/autobuild/i... | 1 
                     efivar-38 | 1 
                elfutils-0.186 | 1 
       host-gcc-initial-11.3.0 | 1 
                host-go-1.19.4 | 1 
              host-pahole-1.24 | 1 
              host-rust-1.64.0 | 1 
           janus-gateway-1.0.3 | 1 
                     libgcrypt | 1 
              libgcrypt-1.10.1 | 1 
                 openssh-9.1p1 | 1 
                    sdl-1.2.15 | 1 
                       unknown | 1 


Detail of failures for 2022.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    sh4a     | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/3c386bfc5c1455a27e538f3e9d15fff26d858045 |     
   x86_64    |           efivar-38            | NOK | http://autobuild.buildroot.net/results/a18883c9c4d2ee1b67037d410cb5690fe85cc2d8 |     
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/76f58addcd129b9d8c9a14c078522a8275e7c497 | ORPH
    arm      |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/7a7ef515695bc65cc00a325d6e7a7528caca8231 |     
  mips64el   |         host-go-1.19.4         | NOK | http://autobuild.buildroot.net/results/b7d705036d3641915fc962b613cfd3fc64442471 |     
    mips     |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/b46c1b31d4fb7aa187aa212658ee15fba9dd6285 |     
powerpc64le  |        host-rust-1.64.0        | NOK | http://autobuild.buildroot.net/results/615464dac2352807487e7785dd23c2db6fe1a3f3 |     
 aarch64_be  |      janus-gateway-1.0.3       | NOK | http://autobuild.buildroot.net/results/e0c785d175f8277281734a461bef885bfe593ff0 |     
    arm      |           libgcrypt            | TIM | http://autobuild.buildroot.net/results/a7e6e1656f4f1292944cb4ae09453c82c6766313 |     
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/bad654e1a40ba0cb388dd23e96691584f784361a | ORPH
  mips64el   |         openssh-9.1p1          | NOK | http://autobuild.buildroot.net/results/ab4b43166dc84f0fa6599088bad62719bfae3cea | ORPH
   sh4eb     |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/c335832be4973e27cf97adeadc43d4ab15c02291 | ORPH
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/3297ca0db4177d58cb73a292608619760efb180f |     


Gitlab CI results for 2023-01-02
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
      TestClangCompilerRT | https://gitlab.com/buildroot.org/buildroot/-/jobs/3541872491  | ORPH 
           TestCrudiniPy3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3541872492  | ORPH 
           TestIPythonPy3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3541872505  | ORPH 
                 TestOpkg | https://gitlab.com/buildroot.org/buildroot/-/jobs/3541872578  | ORPH 
                 TestPixz | https://gitlab.com/buildroot.org/buildroot/-/jobs/3541872600  | ORPH 
    TestPythonPy3Autobahn | https://gitlab.com/buildroot.org/buildroot/-/jobs/3541872616  | ORPH 
         TestPythonPy3Can | https://gitlab.com/buildroot.org/buildroot/-/jobs/3541872625  | ORPH 
    TestPythonPy3Crossbar | https://gitlab.com/buildroot.org/buildroot/-/jobs/3541872631  | ORPH 
TestPythonPy3Cryptography | https://gitlab.com/buildroot.org/buildroot/-/jobs/3541872632  | ORPH 
      TestPythonPy3Django | https://gitlab.com/buildroot.org/buildroot/-/jobs/3541872636  | ORPH 
...thonPy3ServiceIdentity | https://gitlab.com/buildroot.org/buildroot/-/jobs/3541872668  | ORPH 
        TestPythonPy3Treq | https://gitlab.com/buildroot.org/buildroot/-/jobs/3541872673  | ORPH 
    TestPythonPy3Txtorcon | https://gitlab.com/buildroot.org/buildroot/-/jobs/3541872682  | ORPH 
       TestPythonPy3rtoml | https://gitlab.com/buildroot.org/buildroot/-/jobs/3541872664  | ORPH 
                 TestRust | https://gitlab.com/buildroot.org/buildroot/-/jobs/3541872688  | ORPH 
              TestRustBin | https://gitlab.com/buildroot.org/buildroot/-/jobs/3541872689  | ORPH 
                   TestS6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3541872690  | ORPH 
             TestZfsGlibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3541872701  | ORPH 
              TestZfsMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/3541872702  | ORPH 
            TestZfsUclibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/3541872703  | ORPH 



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
