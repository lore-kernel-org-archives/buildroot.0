Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC7B7EB64D9
	for <buildroot@archiver.kernel.org>; Thu,  6 Jul 2023 04:45:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1E311400DC;
	Thu,  6 Jul 2023 04:45:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1E311400DC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Kgwz64UUVLn2; Thu,  6 Jul 2023 04:45:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A2A974012D;
	Thu,  6 Jul 2023 04:45:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A2A974012D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5834A1BF589
 for <buildroot@lists.busybox.net>; Thu,  6 Jul 2023 04:45:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3620660BE8
 for <buildroot@lists.busybox.net>; Thu,  6 Jul 2023 04:45:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3620660BE8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mPsXllTnuEsD for <buildroot@lists.busybox.net>;
 Thu,  6 Jul 2023 04:45:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 07E2D60AD5
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 07E2D60AD5
 for <buildroot@buildroot.org>; Thu,  6 Jul 2023 04:45:33 +0000 (UTC)
X-GND-Sasl: thomas.petazzoni@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 229B160005
 for <buildroot@buildroot.org>; Thu,  6 Jul 2023 04:45:31 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Thu, 06 Jul 2023 04:45:31 -0000
Message-Id: <20230706044536.3620660BE8@smtp3.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1688618731; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=7jRbND26kFbe3N8dxUTQD29Pwj6r8v6FR/p6oA7IZD0=;
 b=Zre7PMHk4kHmzNNovKhsP4Ls8qVB2HvjRhwjT2pOK+W0BAab25DC+8N3GQ7/5a1U0I5mxU
 dQEYXxB0s+Ud9ILEJS9l1OgJQPQ9jFTo9wjrIl3PNoTCkzfvy1h5EAw2+E4yaXYwnRrbeg
 hpA4+CHzxI/fGAwW7YZMulgz34DrhOVmlsC2CptH9okubkn2dEgNdjnQdBL6tezLAvXgig
 vhR5KGIxKTAqGxHTJvEg9KDBzKk0R11Uqmsgg8NMpo/1eFl+6W6SbsOn78N4vHoO+Tistk
 NAtQWrpLJ21kS2AP57b+kVL8Dweh2dz0lrYMMyrl3GB7K7KpQSBBSu0Sy+9mCQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Zre7PMHk
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-07-05
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

Autobuild statistics for 2023-07-05
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  |  5  |  2  |  0  |  7  |
    master   | 119 | 134 |  1  | 254 |

Classification of failures by reason for master
-----------------------------------------------

             bluez5_utils-5.68 | 30
                    strace-6.3 | 6 
                libssh2-1.11.0 | 4 
                   linux-6.3.9 | 4 
                 mpg123-1.31.3 | 4 
glibc-2.37-2-g9f8513dc64119... | 3 
  gobject-introspection-1.74.0 | 3 
             host-ccache-4.8.2 | 3 
              host-rust-1.70.0 | 3 
          libedit-20221030-3.1 | 3 
               libglib2-2.76.1 | 3 
              open62541-v1.3.4 | 3 
                alsa-lib-1.2.9 | 2 
             berkeleydb-5.3.28 | 2 
                    brltty-6.5 | 2 
fs/ubifs/ubifs.mk:49: /home... | 2 
                     gmp-6.2.1 | 2 
                   guile-3.0.9 | 2 
                haveged-1.9.18 | 2 
            host-binutils-2.39 | 2 
               host-go-1.19.10 | 2 
            ocf-linux-20171122 | 2 
                    olsr-0.9.8 | 2 
             batman-adv-2022.3 | 1 
                  cairo-1.16.0 | 1 
                  check-0.15.2 | 1 
             cni-plugins-1.3.0 | 1 
                 coreutils-9.3 | 1 
          cryptodev-linux-1.12 | 1 
                 dc3dd-7.2.641 | 1 
        edk2-edk2-stable202208 | 1 
                elfutils-0.186 | 1 
                  ffmpeg-4.4.4 | 1 
       freeradius-client-1.1.7 | 1 
fs/cramfs/cramfs.mk:46: /ho... | 1 
fs/jffs2/jffs2.mk:71: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
                gnu-efi-3.0.15 | 1 
         gobject-introspection | 1 
            host-binutils-2.38 | 1 
            host-binutils-2.40 | 1 
             host-delve-1.20.2 | 1 
          host-elf2flt-2021.08 | 1 
host-gdb-arc-2020.09-releas... | 1 
       host-python-sip-4.19.25 | 1 
               libcap-ng-0.8.3 | 1 
libdill-32d0e8b733416208e04... | 1 
                  libsepol-3.5 | 1 
          linux-5.10.162-cip24 | 1 
        ltp-testsuite-20230127 | 1 
mali-driver-c90627f78d58567... | 1 
                     mtd-2.1.5 | 1 
                    mutt-2.2.9 | 1 
               nfs-utils-2.6.3 | 1 
                 opensc-0.23.0 | 1 
                   perl-5.36.1 | 1 
                   psmisc-23.5 | 1 
           python-orjson-3.8.4 | 1 
            quickjs-2021-03-27 | 1 
                   shadow-4.13 | 1 
             stress-ng-0.15.07 | 1 
                 uclibc-1.0.43 | 1 
ulog-0389d243352255f6182326... | 1 
                       unknown | 1 
           v4l2loopback-0.12.7 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 microblaze  |         alsa-lib-1.2.9         | NOK | http://autobuild.buildroot.net/results/781ba7bf34e8f2a7d9f4c9ff5e97528ca5dbc6ff |     
microblazeel |         alsa-lib-1.2.9         | NOK | http://autobuild.buildroot.net/results/239b8fa82d33b400ce7e783421a3eccc73f143f4 |     
 powerpc64   |       batman-adv-2022.3        | NOK | http://autobuild.buildroot.net/results/e99a27fb0a305c4daf7d9cabd0dbab6d58935ccc |     
   sh4aeb    |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/8fca9944e9de6fa92d39744db0e7c72708835b0a | ORPH
    sh4      |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/f6f18291cf7a76f5d9a0d8e9b0922fb9f04b0622 | ORPH
   sh4eb     |       bluez5_utils-5.68        | NOK | http://autobuild.buildroot.net/results/4e7e982e404b73262dcf59af7d2f7628e75c1f57 |     
  sparc64    |       bluez5_utils-5.68        | NOK | http://autobuild.buildroot.net/results/642fbae45c2466debcfee52ad585b46d4fabb8a1 |     
powerpc64le  |       bluez5_utils-5.68        | NOK | http://autobuild.buildroot.net/results/3f0d503b69a34e28c9bbe374830b3cb4060f2014 |     
  mips64el   |       bluez5_utils-5.68        | NOK | http://autobuild.buildroot.net/results/9eb3da50e4359682c05df09626e2d219df20d579 |     
  sparc64    |       bluez5_utils-5.68        | NOK | http://autobuild.buildroot.net/results/570ef19e22b719bdfeb73c0dd464b4a4d4bd7301 |     
 microblaze  |       bluez5_utils-5.68        | NOK | http://autobuild.buildroot.net/results/1763a18394308b2590ab36706fdfcd16d0045d88 |     
  mips64el   |       bluez5_utils-5.68        | NOK | http://autobuild.buildroot.net/results/089fff67c098fec7d584b7cb55be17349ae54d86 |     
    i686     |       bluez5_utils-5.68        | NOK | http://autobuild.buildroot.net/results/ea67a058fbfd9665bb7c115d8774d392396a8596 |     
   mipsel    |       bluez5_utils-5.68        | NOK | http://autobuild.buildroot.net/results/9476511dcd89d5a60a020df4c4aa5ffc879cdd3c |     
  sparc64    |       bluez5_utils-5.68        | NOK | http://autobuild.buildroot.net/results/af49f38f159501b67b888947106e08dc262ac67b |     
 powerpc64   |       bluez5_utils-5.68        | NOK | http://autobuild.buildroot.net/results/a961f8463485c8cbb7fcdd4374b93513bb35ae55 |     
  aarch64    |       bluez5_utils-5.68        | NOK | http://autobuild.buildroot.net/results/872cd9ff5a521329c831823a0a7056ca65203c11 |     
  sparc64    |       bluez5_utils-5.68        | NOK | http://autobuild.buildroot.net/results/7853d03272259a8617093571c3ff5043b1b188ce |     
    mips     |       bluez5_utils-5.68        | NOK | http://autobuild.buildroot.net/results/5ecdc7482938ab11d80f6775449a36ad25234f01 |     
   mips64    |       bluez5_utils-5.68        | NOK | http://autobuild.buildroot.net/results/77a26e18cf7b3c32e996f39a6ed4cf3dcbfe086b |     
 powerpc64   |       bluez5_utils-5.68        | NOK | http://autobuild.buildroot.net/results/7f665bd3c7dce67bd1085668fef9189d61d068ab |     
  mips64el   |       bluez5_utils-5.68        | NOK | http://autobuild.buildroot.net/results/610a8132da821dc7b586982d809a9c9f0e57706e |     
 microblaze  |       bluez5_utils-5.68        | NOK | http://autobuild.buildroot.net/results/e01bc743222c8e0a515800e15de815c7e064b0f4 |     
   mips64    |       bluez5_utils-5.68        | NOK | http://autobuild.buildroot.net/results/8577ff1ea291b2d36dee879d3d4e7ef148b6a999 |     
   sh4aeb    |       bluez5_utils-5.68        | NOK | http://autobuild.buildroot.net/results/9e5adb2529241f38fba3364ebbc27760ef799de5 |     
 powerpc64   |       bluez5_utils-5.68        | NOK | http://autobuild.buildroot.net/results/23a0bf2b3c334ff02f45add493105a883d8e901e |     
  mips64el   |       bluez5_utils-5.68        | NOK | http://autobuild.buildroot.net/results/17bfe1812fe3eee7386fd92a332b1596c24d5eac |     
   armeb     |       bluez5_utils-5.68        | NOK | http://autobuild.buildroot.net/results/448c8e6631d10aa599fb887639af4ec77bfc0fee |     
microblazeel |       bluez5_utils-5.68        | NOK | http://autobuild.buildroot.net/results/7a10605eb777c17f59acbb5d4ef4c3a8e886227c |     
   mips64    |       bluez5_utils-5.68        | NOK | http://autobuild.buildroot.net/results/5652c5a1c38d450d5aefdb900b828668fc7fbece |     
powerpc64le  |       bluez5_utils-5.68        | NOK | http://autobuild.buildroot.net/results/4056806cbea83d410f8265d20f32dc13c60e2d07 |     
  sparc64    |       bluez5_utils-5.68        | NOK | http://autobuild.buildroot.net/results/a5f6aba2448e007d871fa018b8192760834b4663 |     
  powerpc    |       bluez5_utils-5.68        | NOK | http://autobuild.buildroot.net/results/630aa9fab5633a0f1bd06d8b062f2e41ed42667d |     
 powerpc64   |       bluez5_utils-5.68        | NOK | http://autobuild.buildroot.net/results/e8ee8ebfa7ffbaa1bb6a00913c70c19a45945968 |     
    arm      |       bluez5_utils-5.68        | NOK | http://autobuild.buildroot.net/results/8feb2d4152f0108f622c6f21f71abd2a1867d8fa |     
  powerpc    |           brltty-6.5           | NOK | http://autobuild.buildroot.net/results/493964f94bbea65a9d03ab74699ae1047b322dc5 |     
powerpc64le  |           brltty-6.5           | NOK | http://autobuild.buildroot.net/results/5b790d2b1f7709ef64d4afa95b1b5e27be7d7853 |     
   xtensa    |          cairo-1.16.0          | NOK | http://autobuild.buildroot.net/results/ebec94eb4bf627fab7525329e88cd3b228a31274 |     
   xtensa    |          check-0.15.2          | NOK | http://autobuild.buildroot.net/results/6aaff1d21bf23daa60756898e030dff962cd6877 | ORPH
powerpc64le  |       cni-plugins-1.3.0        | NOK | http://autobuild.buildroot.net/results/aee4f7438b4cb9f27380f3cbb0cec5539993d2b6 |     
    arc      |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/6654f9527229155e498c39e63f5903566189abb8 | ORPH
   sparc     |      cryptodev-linux-1.12      | NOK | http://autobuild.buildroot.net/results/fb37fb162ddc79ea71af73c40f376c043b68eb4f | ORPH
    or1k     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/e8a555bdd2e39c484183f5bd313f09dde31668b4 | ORPH
   x86_64    |     edk2-edk2-stable202208     | NOK | http://autobuild.buildroot.net/results/763c44a532d5101c40b1c67c40d413da8c919a70 |     
    arc      |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/b3c28b91d5d70266e7abfd72361333d552df30ad | ORPH
    arm      |          ffmpeg-4.4.4          | NOK | http://autobuild.buildroot.net/results/3fc68f756cf1661673941c411c4a2477e901e361 |     
  riscv64    |    freeradius-client-1.1.7     | NOK | http://autobuild.buildroot.net/results/69c796aa9f40aeff3f170f75836a8a409ca8cd18 |     
    m68k     | fs/cramfs/cramfs.mk:46: /ho... | NOK | http://autobuild.buildroot.net/results/47ec5263687663a803388a756c3913c59b5ef15b |     
   sparc     | fs/jffs2/jffs2.mk:71: /home... | NOK | http://autobuild.buildroot.net/results/993c7de9c5d7863246a20c0032bc1fcd9464367a |     
   s390x     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/c4d87a667d29a1d0160de713cebff2e46aa189be |     
   s390x     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/a7a33f17421b80f61a78313a946377575aaeda97 |     
  aarch64    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/ecc6014b3a5b06b17623b374223d7824f9ec3179 |     
   s390x     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/4c5e33fe8761bd5b902f27057f2c5a9b204760d9 |     
   arceb     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/1eb8f3d9cf32398b26e366a4650b51a43a9c716c |     
    arc      | glibc-2.37-2-g9f8513dc64119... | NOK | http://autobuild.buildroot.net/results/8657ec60b7325fd3e565e22d89c064cfe0c87fe9 |     
  powerpc    | glibc-2.37-2-g9f8513dc64119... | NOK | http://autobuild.buildroot.net/results/71484e94b8adcbaea0bff8347ec9b4bcce244735 |     
  powerpc    | glibc-2.37-2-g9f8513dc64119... | NOK | http://autobuild.buildroot.net/results/1cb79c0a9f35406c07432662928e97ac48cc4db3 |     
  riscv64    |           gmp-6.2.1            | NOK | http://autobuild.buildroot.net/results/eac060880e6f66f3a4f93b45dfa4e95bafeec06f | ORPH
  riscv64    |           gmp-6.2.1            | NOK | http://autobuild.buildroot.net/results/7d4249c208c67705456a767ad3d0d7e1b668680f | ORPH
  mips64el   |         gnu-efi-3.0.15         | NOK | http://autobuild.buildroot.net/results/bac7d7e2eb35ba92e4b9484fb0f4e597072bb5a4 |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/72a7bfa8c9360a5744b9139fed9e3611e453afe9 |     
  sparc64    |  gobject-introspection-1.74.0  | NOK | http://autobuild.buildroot.net/results/0312a581c34521d217c3e3ff803697536da81880 | ORPH
   s390x     |  gobject-introspection-1.74.0  | NOK | http://autobuild.buildroot.net/results/6bdbedf1e876b71ea9faeebfe48ad95da0022e85 | ORPH
    i686     |  gobject-introspection-1.74.0  | NOK | http://autobuild.buildroot.net/results/3d8c18c441493e470960468fc90da981529b9efa | ORPH
  sparc64    |          guile-3.0.9           | NOK | http://autobuild.buildroot.net/results/a3e8a04fa4c1d53d97d785767f56cf52f8857d83 |     
  aarch64    |          guile-3.0.9           | NOK | http://autobuild.buildroot.net/results/2a65727e23d0213b717bb49b37923b1826774696 |     
   arceb     |         haveged-1.9.18         | NOK | http://autobuild.buildroot.net/results/ae0a9aea5f4cd8e4e61c08f2c0bf9b8aaa4d6717 |     
   sparc     |         haveged-1.9.18         | NOK | http://autobuild.buildroot.net/results/4d2991b405582f2185642f13f2fc039d9edfa6c4 |     
 aarch64_be  |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/556d628e509d18a9825896fe7d8555f70571f30d |     
   nios2     |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/f49abf0c2d63e8e9c00fc8b9f2b4642d2206dc0e |     
    arm      |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/c5eb26f65b35c9eda50a8a23270881fd5f2cb7fc |     
  mips64el   |       host-binutils-2.40       | NOK | http://autobuild.buildroot.net/results/2043796aba9b99bb519eed230c9d82c38d20a4b8 |     
    or1k     |       host-ccache-4.8.2        | NOK | http://autobuild.buildroot.net/results/4ad9cd4bb10162f37a92f42f3793758eb11a6bac | ORPH
   xtensa    |       host-ccache-4.8.2        | NOK | http://autobuild.buildroot.net/results/a77f1efafebae1a1465d6413db63daabd0040097 | ORPH
  powerpc    |       host-ccache-4.8.2        | NOK | http://autobuild.buildroot.net/results/cef64ff789a4f4ad3005194785f982a0537a09d3 | ORPH
  riscv64    |       host-delve-1.20.2        | NOK | http://autobuild.buildroot.net/results/524faeef7f34e8e0c0cf8cf8bb82f39cfa69c237 |     
  riscv64    |      host-elf2flt-2021.08      | NOK | http://autobuild.buildroot.net/results/b1267c89b176f0e8ab15ad189bee10b12e5ad566 | ORPH
    arc      | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/6cd42dec458466e760fe7e665bf86c6fd5474ab0 | ORPH
    i686     |        host-go-1.19.10         | NOK | http://autobuild.buildroot.net/results/f1dd6285983963a0fcee80be8070bb12039a5712 |     
   mips64    |        host-go-1.19.10         | NOK | http://autobuild.buildroot.net/results/b6d5565ab29868f07cfe1aac77ee1e88aaf23707 |     
powerpc64le  |    host-python-sip-4.19.25     | NOK | http://autobuild.buildroot.net/results/c3d9379fe1fc704382bc5d74765e1c3e7d5e3310 |     
   x86_64    |        host-rust-1.70.0        | NOK | http://autobuild.buildroot.net/results/d4563b81f08b045e8c41bd1caeee923b1dbf0345 |     
    i686     |        host-rust-1.70.0        | NOK | http://autobuild.buildroot.net/results/e247b04c2475b32006e847417bd17dd541047fab |     
powerpc64le  |        host-rust-1.70.0        | NOK | http://autobuild.buildroot.net/results/4c3344ce2be87ae015b7e0c00281ffb286375e76 |     
  riscv64    |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/4f675b9fe5e015dd69e6066002d711db60d6a34e |     
 aarch64_be  | libdill-32d0e8b733416208e04... | NOK | http://autobuild.buildroot.net/results/f6b7bae45196055bf63bbda1d0fda7a61637eccc |     
   mips64    |      libedit-20221030-3.1      | NOK | http://autobuild.buildroot.net/results/ecc467270e2d3ac3897c50cac130c118c9a2987f |     
   arceb     |      libedit-20221030-3.1      | NOK | http://autobuild.buildroot.net/results/cc4794cbe9f30225d83bc6cea058aa1874a20b93 |     
    mips     |      libedit-20221030-3.1      | NOK | http://autobuild.buildroot.net/results/5ea8d7c7ca5f6dbf7c0d81df87ecbbf8bb2e6227 |     
   arceb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/1bcdc2549054e55958870ce1f67cf9943ccbe881 |     
   sparc     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/9d10d1d17ca63bb7e35569b0c06ceb6c17c231a7 |     
  mips64el   |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/7b6e5cffddf37a3ddf2c336cb405cd10b0804a2a |     
   armeb     |          libsepol-3.5          | NOK | http://autobuild.buildroot.net/results/18e34d9052e5dd9b0ea62ad15d891d60c40a8650 |     
 microblaze  |         libssh2-1.11.0         | NOK | http://autobuild.buildroot.net/results/8df5ad2c30a1c3b18b47d1296463d1716b56af46 | ORPH
    or1k     |         libssh2-1.11.0         | NOK | http://autobuild.buildroot.net/results/7c14bed567eff8e76de94501a4491c2d86bb1c1b | ORPH
    m68k     |         libssh2-1.11.0         | NOK | http://autobuild.buildroot.net/results/fd51dde6578fab687ec6dab6df52738a34ceade5 | ORPH
    mips     |         libssh2-1.11.0         | NOK | http://autobuild.buildroot.net/results/8cd64b73b22ccc59b3dc578aa12b205db159cd5f | ORPH
    arc      |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/6f920000c29a984606b9e065b1bc1a94acc8c71b | ORPH
   sparc     |          linux-6.3.9           | NOK | http://autobuild.buildroot.net/results/41c11c7ae8ee01607531c14911d723287a9a4288 | ORPH
powerpc64le  |          linux-6.3.9           | NOK | http://autobuild.buildroot.net/results/a2bce9b9a6821e9507e8c1e41016fbcaf390f476 | ORPH
    sh4a     |          linux-6.3.9           | NOK | http://autobuild.buildroot.net/results/5c7b4bd432795c5fb592afcfda0da0be886d09ea | ORPH
   mipsel    |          linux-6.3.9           | NOK | http://autobuild.buildroot.net/results/065c65b941c792a566ce1f30a3c0b938162e3df3 | ORPH
  sparc64    |     ltp-testsuite-20230127     | NOK | http://autobuild.buildroot.net/results/f5d993d31faf0f84c67c4e007e3de9c45aab29ae |     
  aarch64    | mali-driver-c90627f78d58567... | NOK | http://autobuild.buildroot.net/results/0c043a6978fc5ea51b2c7a862de288223589926e |     
   armeb     |         mpg123-1.31.3          | NOK | http://autobuild.buildroot.net/results/0f0a18127472f1918abc4d853597d4a2a74d2acb | ORPH
   mips64    |         mpg123-1.31.3          | NOK | http://autobuild.buildroot.net/results/b740ce12df00c488924d5e3de4460c09a9af36e1 | ORPH
 powerpc64   |         mpg123-1.31.3          | NOK | http://autobuild.buildroot.net/results/33b80d3b56cc5df355fd4e117ff78b206eb4fea4 | ORPH
   mips64    |         mpg123-1.31.3          | NOK | http://autobuild.buildroot.net/results/f072a2f303f3061f9dd43a3908120a2a3b67253b | ORPH
    or1k     |           mtd-2.1.5            | NOK | http://autobuild.buildroot.net/results/cf8fb1fdf05610d77f46c638e3ad8cf69927e903 | ORPH
   x86_64    |           mutt-2.2.9           | NOK | http://autobuild.buildroot.net/results/1b32cf3c60224d8f883bc6cc73b7c367aa89e8e9 |     
    arc      |        nfs-utils-2.6.3         | NOK | http://autobuild.buildroot.net/results/8e6536641f2ac240646b34a902d5133845a1d4c9 |     
 powerpc64   |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/93bb341f8b00a17bb3d30115cc57e2388c2f39ed | ORPH
   arceb     |       ocf-linux-20171122       | NOK | http://autobuild.buildroot.net/results/55392845faeaca9744016d73b4be4b76739c8849 | ORPH
 powerpc64   |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/0929290414834c78888f0a00da7d3e0ce32f60ed | ORPH
    mips     |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/328495fd32b6407a5c1ce51143321334056052c5 | ORPH
  aarch64    |        open62541-v1.3.4        | NOK | http://autobuild.buildroot.net/results/5e48943917bdf7e81491102ed5bd6fd4c1b671b4 | ORPH
 aarch64_be  |        open62541-v1.3.4        | NOK | http://autobuild.buildroot.net/results/d0c3d864bb976063e627fe9099f9ea38e90bb4c0 | ORPH
    mips     |        open62541-v1.3.4        | NOK | http://autobuild.buildroot.net/results/7f4ae0249e260836e2d6bb3150f342840194cfdb | ORPH
   arceb     |         opensc-0.23.0          | NOK | http://autobuild.buildroot.net/results/87ab78cac98af55bd533cf5ec5566e69539eb628 | ORPH
   sparc     |          perl-5.36.1           | NOK | http://autobuild.buildroot.net/results/2421c9f646bc562c7e2591c24a3612db8219dd76 |     
  aarch64    |          psmisc-23.5           | NOK | http://autobuild.buildroot.net/results/c4e47735c4e4eac3109e11350a4e1db54aa9d8f8 | ORPH
    mips     |      python-orjson-3.8.4       | NOK | http://autobuild.buildroot.net/results/4a0edcc72850fcfb81b83a2f4357a1d129500809 |     
powerpc64le  |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/846093be04e522f475e1fe311dee0261119f632e |     
powerpc64le  |          shadow-4.13           | NOK | http://autobuild.buildroot.net/results/09d5d636135508ca946c28c2aaec5ff9c68b9788 |     
  powerpc    |           strace-6.3           | NOK | http://autobuild.buildroot.net/results/b8a0fe575458131853024a3a53ad5a1de781d77d |     
 aarch64_be  |           strace-6.3           | NOK | http://autobuild.buildroot.net/results/33545217862d147cce6151991377561e05de3301 |     
   mipsel    |           strace-6.3           | NOK | http://autobuild.buildroot.net/results/6c8a2621d2041ab27d10b7205d3868d0e4d20c72 |     
    m68k     |           strace-6.3           | NOK | http://autobuild.buildroot.net/results/34c674c02cdd3751dfbb699d09951419a87f38d4 |     
   armeb     |           strace-6.3           | NOK | http://autobuild.buildroot.net/results/30e9478d733f10184933eb172f97a86d62da3446 |     
 powerpc64   |           strace-6.3           | NOK | http://autobuild.buildroot.net/results/b1338bb69c492f6c56960686bb7e9bc503803a73 |     
    arm      |       stress-ng-0.15.07        | NOK | http://autobuild.buildroot.net/results/a62621fcbea5d21a433002a14de5da4b73d9cb0f |     
  powerpc    |         uclibc-1.0.43          | NOK | http://autobuild.buildroot.net/results/bfd46583556e7baa5f8c7520a23edfec8a0bd79a |     
  aarch64    | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/37f80cc0944634d4a33f277c848d13ee626f2bbb |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/03bd09cdde09eddb75e403132c72c770f6b634c9 |     
 powerpc64   |      v4l2loopback-0.12.7       | NOK | http://autobuild.buildroot.net/results/f050280b9231591ed5192d29172d61938a381300 |     


Classification of failures by reason for 2023.02.x
--------------------------------------------------

               host-go-1.19.10 | 1 
      libabseil-cpp-20220623.1 | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mips64    |        host-go-1.19.10         | NOK | http://autobuild.buildroot.net/results/d6296a8886d74c45b2f7e277f2457fc8ccd757ca |     
  mips64el   |    libabseil-cpp-20220623.1    | NOK | http://autobuild.buildroot.net/results/2aff0449f72a9ce7f39e07f0a195b039297b4d3c |     


Gitlab CI results for 2023-07-05
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
      TestClangCompilerRT | https://gitlab.com/buildroot.org/buildroot/-/jobs/4581325635  | ORPH 
                 TestEdk2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4581325484  | ORPH 
                   TestZ3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4581326084  | ORPH 



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
