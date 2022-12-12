Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05595C4332F
	for <buildroot@archiver.kernel.org>; Mon, 12 Dec 2022 09:02:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 940E660C1F;
	Mon, 12 Dec 2022 09:02:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 940E660C1F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id caNkHsKoDCB1; Mon, 12 Dec 2022 09:02:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F167460C30;
	Mon, 12 Dec 2022 09:01:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F167460C30
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 71E661BF2BD
 for <buildroot@lists.busybox.net>; Mon, 12 Dec 2022 06:43:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3E47760A93
 for <buildroot@lists.busybox.net>; Mon, 12 Dec 2022 06:43:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3E47760A93
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 60tCFzk1lL4h for <buildroot@lists.busybox.net>;
 Mon, 12 Dec 2022 06:42:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4DEC7606DC
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4DEC7606DC
 for <buildroot@buildroot.org>; Mon, 12 Dec 2022 06:42:57 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 522EA40006
 for <buildroot@buildroot.org>; Mon, 12 Dec 2022 06:42:54 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Mon, 12 Dec 2022 06:42:54 -0000
Message-Id: <20221212064301.3E47760A93@smtp3.osuosl.org>
X-Mailman-Approved-At: Mon, 12 Dec 2022 09:01:44 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1670827374; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=3J6Yl2dHQhw0lvbJLUkJtLZbYSZaN3KhA8AF9HWFyGk=;
 b=lkL4omr9VV2FO3lE94Mype0fgEFRsje86E1A4qR0y7fRtOBPx3wgVzRd2F8oWaSj9U6sXQ
 f/8kmi5c6/erAl1HIT3bQskveFPYUe6yz1xKCfbY/c37/v+5xnIa8BXEE3bzLDv1uKtkKd
 IlJjJAeJsja03QeSa46oKyHq7Y61JoxJ0mgvRLEWh5PHj2Mpt9jyyayja8gPba1eJ+bxhQ
 GXxZJQBZKPeiNq6q73mMKqqJl2kNehMnKOgrBeoqVjGVGA3X96m0qkqxfbwPhDRApthWF9
 5ZffLBypGXGL1LdPw3i89R917qnA+fGGA868Vm/sNDvhgKBrLFFO85Ys8mVgwg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=lkL4omr9
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-12-11
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

Autobuild statistics for 2022-12-11
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  | 15  |  2  |  0  | 17  |
  2022.08.x  | 19  | 13  |  0  | 32  |
    master   | 178 | 247 |  0  | 425 |

Classification of failures by reason for master
-----------------------------------------------

               host-swig-4.1.1 | 21
                   aubio-0.4.9 | 19
            host-binutils-2.38 | 12
                host-go-1.19.4 | 10
  gobject-introspection-1.72.0 | 8 
              host-rust-1.65.0 | 8 
                  sscep-0.10.0 | 7 
                      xz-5.2.7 | 7 
glibc-2.36-66-ga1dc0be03c9d... | 6 
    host-python-greenlet-2.0.1 | 6 
         host-python-m2r-0.3.1 | 6 
         host-sentry-cli-2.8.0 | 5 
             libgpg-error-1.45 | 5 
                       unknown | 5 
              host-pahole-1.24 | 4 
                    norm-1.5.8 | 4 
                  davfs2-1.7.0 | 3 
                 dmalloc-5.6.5 | 3 
                elfutils-0.186 | 3 
                gerbera-1.10.0 | 3 
gummiboot-2bcd919c681c952eb... | 3 
                  jack2-1.9.21 | 3 
                xenomai-3.0.10 | 3 
            host-binutils-2.39 | 2 
    host-python-greenlet-2.0.0 | 2 
              hyperfine-1.14.0 | 2 
               libglib2-2.72.3 | 2 
              libuhttpd-3.14.1 | 2 
           python-bcrypt-4.0.1 | 2 
            python-bunch-1.0.1 | 2 
           python-numpy-1.23.4 | 2 
rtl8192eu-1e15b6d451731bc4d... | 2 
                    sdl-1.2.15 | 2 
                tealdeer-1.6.1 | 2 
             uccp420wlan-6.9.1 | 2 
                  acpid-2.0.34 | 1 
                alsa-lib-1.2.8 | 1 
azure-iot-sdk-c-LTS_07_2022... | 1 
                    bat-0.19.0 | 1 
             berkeleydb-5.3.28 | 1 
                  boost-1.80.0 | 1 
                    brltty-6.5 | 1 
            btrfs-progs-5.16.2 | 1 
                  check-0.15.2 | 1 
                  cmocka-1.1.5 | 1 
              containerd-1.6.8 | 1 
                    crun-1.7.2 | 1 
                 dash-0.5.11.5 | 1 
                 dc3dd-7.2.641 | 1 
                 dhcp-4.4.3-P1 | 1 
           docker-cli-20.10.21 | 1 
                    dust-0.8.1 | 1 
                     efivar-38 | 1 
              erlang-22.3.4.22 | 1 
                  exempi-2.6.1 | 1 
             f2fs-tools-1.15.0 | 1 
               fftw-quad-3.3.8 | 1 
                     file-5.43 | 1 
                    flac-1.4.2 | 1 
                     frr-8.3.1 | 1 
fs/jffs2/jffs2.mk:71: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /tmp/... | 1 
fs/ubifs/ubifs.mk:49: /tmp/... | 1 
google-breakpad-c85eb4a59b6... | 1 
            host-binutils-2.37 | 1 
         host-gcc-final-10.4.0 | 1 
         host-gcc-final-11.3.0 | 1 
host-spirv-llvm-translator-... | 1 
                jemalloc-5.3.0 | 1 
               libdeflate-1.12 | 1 
                    libev-4.33 | 1 
                libkcapi-1.4.0 | 1 
               libsigsegv-2.14 | 1 
               libvorbis-1.3.7 | 1 
          linux-5.10.145-cip17 | 1 
                  linux-6.0.12 | 1 
                   linux-6.0.9 | 1 
             lirc-tools-0.10.2 | 1 
          lttng-modules-2.13.7 | 1 
            luaossl-20220711-0 | 1 
               mariadb-10.3.36 | 1 
                  matio-1.5.23 | 1 
            micropython-1.19.1 | 1 
              mosquitto-2.0.15 | 1 
                  netsurf-3.10 | 1 
                 openal-1.22.0 | 1 
                 openssh-9.1p1 | 1 
           optee-client-3.19.0 | 1 
                   perl-5.34.1 | 1 
                 proftpd-1.3.8 | 1 
         python-greenlet-2.0.0 | 1 
                      rauc-1.8 | 1 
                    rpm-4.18.0 | 1 
                suricata-6.0.6 | 1 
toolchain-external-codescap... | 1 
                   trinity-1.9 | 1 
ulog-0389d243352255f6182326... | 1 
                 wolfssl-5.5.3 | 1 
               xfsprogs-5.14.2 | 1 
                     znc-1.8.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mips64    |          acpid-2.0.34          | NOK | http://autobuild.buildroot.net/results/50f066ff101a584ea01f090e3a058b294cc2402e | ORPH
    or1k     |         alsa-lib-1.2.8         | NOK | http://autobuild.buildroot.net/results/896496cb98b6cc582af4a9bed1972a6fb82c2356 |     
   sparc     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/a5f0843089cd11feb01047f1c8c7ba60840a7282 |     
  sparc64    |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/9ddbb65d12e34aae0256c19ad53dbdfc901784a8 |     
powerpc64le  |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/9e82967112ae1029f8dc663669938f532bdd55ea |     
  powerpc    |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/23dc7897c68369ea2a52ecc0d5cf2f46e58ce616 |     
 powerpc64   |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/848fb192b4d72e277d3b6b0a9a86b912ba68e527 |     
   armeb     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/6e24557b4c1cb50c3143079d81117b413f92395a |     
    m68k     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/15b2d5c96adcfc9c895dcb83d0ac6522850770bc |     
  mips64el   |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/7a5b33dd91ac6f99b1b0f6fcc8ca778a2fd37d2c |     
microblazeel |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/4ff92f31b24ac6c3f42c95ee13f613dc332d14bf |     
    arc      |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/0d538f2476ca5cc387a4857226fa08e72e3e7acc |     
   sh4eb     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/974074ef57b6f5208f9cf2c7b11e14bb6232c14c |     
  mips64el   |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/2194d373d96cbd9aa3f963c5a272453bd301589f |     
    arm      |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/8d7346b7acbac2376cba323fb5c48fd8cb7d44b1 |     
    sh4a     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/fda18a12ba974c433ed3ea38bd0e5caf6dd39830 |     
    i686     |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/023fa6b0ec3fffbf5bfa173478362bba8d370a82 |     
   mips64    |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/2efcfde17bff991ad5e0be9bf77c6534abcbefe4 |     
  mips64el   |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/3071531cd7aec210cdf353d6fc0e1cb53f067848 |     
   mips64    |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/76f33e9b90aa86c78bb89f7c834e8954d9ed66ee |     
  sparc64    |          aubio-0.4.9           | NOK | http://autobuild.buildroot.net/results/c2a46f4d6849b740a1e04b5c52b2b6b0040bbc85 |     
    arm      | azure-iot-sdk-c-LTS_07_2022... | NOK | http://autobuild.buildroot.net/results/ee0e9e4499f5e7f8106bfc425817f4e845e06207 |     
  aarch64    |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/60c574f4b561892137ce83e9191bc78a83c06a42 |     
   sh4eb     |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/a1aba8b03c180d65c93edbc0d1a647f5a5d1ec16 | ORPH
   arceb     |          boost-1.80.0          | NOK | http://autobuild.buildroot.net/results/e60b2e4d18e1ced411888a1db54be3a5bc39073e |     
microblazeel |           brltty-6.5           | NOK | http://autobuild.buildroot.net/results/fa7ed8c2a0270eb04bd92aa90bb6802da68ae232 |     
    or1k     |       btrfs-progs-5.16.2       | NOK | http://autobuild.buildroot.net/results/3bb82e062faa3f3b04425c9cf490c9c00e458c98 | ORPH
   mipsel    |          check-0.15.2          | NOK | http://autobuild.buildroot.net/results/1b2201eee2112807cd7296c2d60c4293c25cc79f | ORPH
   armeb     |          cmocka-1.1.5          | NOK | http://autobuild.buildroot.net/results/4044b3a71d3130d934c7a7c0c5badfabb2a97030 |     
   x86_64    |        containerd-1.6.8        | NOK | http://autobuild.buildroot.net/results/603bf161f3dd13c637cbc1b8dd015b4044a93edb |     
   x86_64    |           crun-1.7.2           | NOK | http://autobuild.buildroot.net/results/c4a12634888dfd5ad8933062c686edefdbe33457 |     
   xtensa    |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/32070afcc60a915637869a94599f9ef8cf8ab399 | ORPH
    arm      |          davfs2-1.7.0          | NOK | http://autobuild.buildroot.net/results/966daf9920a8106a1701d78ea675661cef09c19b | ORPH
  mips64el   |          davfs2-1.7.0          | NOK | http://autobuild.buildroot.net/results/0de6edb372c7d2dbac71fb95a11069d1a2fbb225 | ORPH
    arc      |          davfs2-1.7.0          | NOK | http://autobuild.buildroot.net/results/2e5333e9ba7ea0df02b3c1c929d24ea6471d5fd3 | ORPH
    or1k     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/5b4b553df80749c5272b50c534c116fdfb745e4f | ORPH
   xtensa    |         dhcp-4.4.3-P1          | NOK | http://autobuild.buildroot.net/results/3f7695bcf66d4079dadb5e5c1c1031c617e2ce8f | ORPH
    i686     |         dmalloc-5.6.5          | NOK | http://autobuild.buildroot.net/results/5c90ba120cd26de516fca8ae95f1b1872b325ff2 | ORPH
    i586     |         dmalloc-5.6.5          | NOK | http://autobuild.buildroot.net/results/34748d7c8115eea36eae48073cd035f997288808 | ORPH
    i586     |         dmalloc-5.6.5          | NOK | http://autobuild.buildroot.net/results/dbc3a044e2b210012c868743615091afd0796608 | ORPH
   s390x     |      docker-cli-20.10.21       | NOK | http://autobuild.buildroot.net/results/af1791978136b2b183c9386131d2cf649047b720 |     
 powerpc64   |           dust-0.8.1           | NOK | http://autobuild.buildroot.net/results/cb100cf3a8664f637c9511edd62e6d1602f1c638 | ORPH
  aarch64    |           efivar-38            | NOK | http://autobuild.buildroot.net/results/1ce7729a4af15dd1e465cd8598bb87976de23358 |     
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/e35c806fd1ad38150cec36c121a09da81f1038a5 | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/f2aadf28f4d736ca4391806cae64b7afad17ef5b | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/469ad337b2ebbe13f5d7a2ccdc828d58fb61e41f | ORPH
  powerpc    |        erlang-22.3.4.22        | NOK | http://autobuild.buildroot.net/results/03427d6f010209e14e2c8cefebf7c6172ddc569d |     
    arm      |          exempi-2.6.1          | NOK | http://autobuild.buildroot.net/results/66a8736d2585ba62d6113e4af0eabc0cf34fb96f |     
    or1k     |       f2fs-tools-1.15.0        | NOK | http://autobuild.buildroot.net/results/10a76730060c488fbf881e028ead1631527c9b3a |     
powerpc64le  |        fftw-quad-3.3.8         | NOK | http://autobuild.buildroot.net/results/cd9041804242f3e754b780cf2a10860e50dc5d42 | ORPH
   mipsel    |           file-5.43            | NOK | http://autobuild.buildroot.net/results/f9fbed689d80cc199595d6814860fb56e660ce01 | ORPH
   sh4aeb    |           flac-1.4.2           | NOK | http://autobuild.buildroot.net/results/5eaefde7210ba189d3c53eddb1655fd00dfc9afc |     
  mips64el   |           frr-8.3.1            | NOK | http://autobuild.buildroot.net/results/a0b2d2d3c801f499730b9e202df5a7121284bd52 |     
   x86_64    | fs/jffs2/jffs2.mk:71: /home... | NOK | http://autobuild.buildroot.net/results/0d204088e4de521233dfa8c538d189be245a38bc |     
    mips     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/cb00bfb22285a6da7605d01b4fddcf150654a840 |     
   x86_64    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/51949794db79fedda095e4828ddb70a9c20ef3cb |     
   xtensa    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/9b0c2c90ba3fc5e792e43ffe519e2cab7e9184c2 |     
   arceb     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/da0058adfe98e5000180d17e42829c6b9b1576ee |     
   x86_64    | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/22b0972514af92e747ba129def1ed670861befae |     
  powerpc    | fs/ubifs/ubifs.mk:49: /tmp/... | NOK | http://autobuild.buildroot.net/results/6eb4af1c89a25f63c1a57cc1f26f34af861d5092 |     
   arceb     |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/c147ccded509f17b2170cec4b08d2be82ac286f4 |     
    arc      |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/597542f5fa10b078673d3febe50db94b0b9e5f05 |     
   sparc     |         gerbera-1.10.0         | NOK | http://autobuild.buildroot.net/results/571892d7490c04174ef680ed09b93fed14a154b6 |     
  powerpc    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/281922a7ec50017c902108d2eca4e9c91a120fea |     
   arceb     | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/f597e01455d71406e6aba3adcf97d31a188bc298 |     
  powerpc    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/5a10bb43f70922c242ec2dd1590d80a895310e1f |     
  powerpc    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/8f2ec7b520954fd25a16d9dfee30c221b4813f63 |     
  powerpc    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/7aab8f9f46f1f2b214850ad9fa6be385b90a6728 |     
  powerpc    | glibc-2.36-66-ga1dc0be03c9d... | NOK | http://autobuild.buildroot.net/results/44f4d2f1fbaf2aa0e66b626133072c63e0bf0179 |     
   x86_64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/498c3887b20e557c010bb823cf4b1d1a60d411c7 | ORPH
    mips     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/525aec3e5106d3e0f9629665f4720367075f3c06 | ORPH
   x86_64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/5c2a7ccb0fa54fd5e292636c9597d630cc8424b6 | ORPH
  sparc64    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/b92b436e75ecca170dbc0a69700d8dbecfed7529 | ORPH
   s390x     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/5b28b2de08e4203f6d9a5b777e85fb9872ff7e9e | ORPH
   armeb     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/d4b8e615730147e702b792e405a7c1ee983595b3 | ORPH
powerpc64le  |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/3058c87c0867626423d4873d2bfe31fed24ed0dc | ORPH
powerpc64le  |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/3fc11a23f352d1e7c7b66c5cd252a7eacf07d3a0 | ORPH
    arm      | google-breakpad-c85eb4a59b6... | NOK | http://autobuild.buildroot.net/results/7e8262649fbe79a7e52cf7a6b8ce39c37832a34b |     
   x86_64    | gummiboot-2bcd919c681c952eb... | NOK | http://autobuild.buildroot.net/results/efeca0218344eba92d265b64bfba9b4b823415eb |     
   x86_64    | gummiboot-2bcd919c681c952eb... | NOK | http://autobuild.buildroot.net/results/88b535fbbe74eb977da976cac8b8e98bc9b2a92a |     
   x86_64    | gummiboot-2bcd919c681c952eb... | NOK | http://autobuild.buildroot.net/results/a4f45909195a039a21df010e7d54dbee9996c0ec |     
    m68k     |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/9d9030ed0452c722176d7aec7d227c224ab6bc86 |     
powerpc64le  |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/a0ea9facc4d5fb85397b5daef756f2606fd8dc35 |     
  mips64el   |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/6542b9254a618a9edcf51e0798962e84630d6c8d |     
    or1k     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/0c186b37576c0909c987fe6bdc78f6155eb7c786 |     
 aarch64_be  |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/0f7dd2ab47a97b2c8406a2f742a0d18ab4445a92 |     
   mips64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/9dd83351ad607bfd84d9a2590fa60b659131c7f2 |     
    arc      |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/5e366f3bca7745bc384286221c3e712f18b05d06 |     
    sh4      |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/876942daccd74ef79cb14a370d45f7c11c31deee |     
   sh4aeb    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/e4b105bf192d40a4a781223d1e6927aadf192de3 |     
    or1k     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/79b3244d0f61fa689243cb0ed5aed337bc3148a6 |     
 microblaze  |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/ce42971e7244afe329b41a766693498b1dd098ea |     
 powerpc64   |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/d0368eb7d3b06a67dcee2b0c3ce473b51dfea36d |     
 powerpc64   |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/c39033a248a98339b379166ac5a4047d97b04334 |     
    mips     |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/aacb3646ab819dcffa042a5dd0b491de13bfaf67 |     
  riscv32    |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/c49f87fb38ae72d5f09d3e633fe828e07221bff3 |     
   arceb     |     host-gcc-final-10.4.0      | NOK | http://autobuild.buildroot.net/results/500baf4fbd0f8d9122e1fba5c93d9a903d28f72b |     
powerpc64le  |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/35004674d707f8adbd382c4d9f31126373dda115 |     
   mips64    |         host-go-1.19.4         | NOK | http://autobuild.buildroot.net/results/294514078df48ebdb459897d428119408aab062c |     
   mips64    |         host-go-1.19.4         | NOK | http://autobuild.buildroot.net/results/36d592df2454546d15d3c661cf6697ebededc325 |     
   mips64    |         host-go-1.19.4         | NOK | http://autobuild.buildroot.net/results/f8a7bc7ee1bfc53fd037f935558a3314946236b7 |     
  aarch64    |         host-go-1.19.4         | NOK | http://autobuild.buildroot.net/results/8633784852a4bf97ea3ec7f308b08b1f2f5ec640 |     
   mips64    |         host-go-1.19.4         | NOK | http://autobuild.buildroot.net/results/27ff116416431096ed9c167937ccb1da8509fabe |     
  aarch64    |         host-go-1.19.4         | NOK | http://autobuild.buildroot.net/results/d152fb629dbc69c702b1e591e7d21a6ac58fd175 |     
   mips64    |         host-go-1.19.4         | NOK | http://autobuild.buildroot.net/results/0ff0387b92f76a3382aa3add8840d50a6957ddab |     
   mips64    |         host-go-1.19.4         | NOK | http://autobuild.buildroot.net/results/0c4542fbce7f6a3f61202f9a67236e53ed038458 |     
    i686     |         host-go-1.19.4         | NOK | http://autobuild.buildroot.net/results/de104e734b6f669dd1325b93135c72ae4e894939 |     
  mips64el   |         host-go-1.19.4         | NOK | http://autobuild.buildroot.net/results/3617a177ee587b361d577dec5e18e7c3ff75106d |     
    arc      |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/cb7aa16b4d1d4bbdf6624d432569af28d0ded347 |     
powerpc64le  |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/7ba469f96b6acad989e21a62cad4db07e7755d37 |     
    arc      |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/c76a6e4ca42619bd2a982e00d42785c610592d98 |     
   mips64    |        host-pahole-1.24        | NOK | http://autobuild.buildroot.net/results/a9d65178f5743914bb4cc8e7be004575ef006c20 |     
   armeb     |   host-python-greenlet-2.0.0   | NOK | http://autobuild.buildroot.net/results/34cd712844d9c4080ed367a148ac3d1e9415bcf3 |     
  sparc64    |   host-python-greenlet-2.0.0   | NOK | http://autobuild.buildroot.net/results/45606dcd09243025dd6bf8e534f2276a33e404b2 |     
   arceb     |   host-python-greenlet-2.0.1   | NOK | http://autobuild.buildroot.net/results/733e14e337d1036488739021fd8202491da61b3d |     
   s390x     |   host-python-greenlet-2.0.1   | NOK | http://autobuild.buildroot.net/results/482c3187b5d7155dfebc6aad194676317c8e9f4e |     
  mips64el   |   host-python-greenlet-2.0.1   | NOK | http://autobuild.buildroot.net/results/2b589dbc9a9a816234bd9bc64439adb143fe4945 |     
    mips     |   host-python-greenlet-2.0.1   | NOK | http://autobuild.buildroot.net/results/04112a2364d052e377b38cae943e438c6b762788 |     
   mips64    |   host-python-greenlet-2.0.1   | NOK | http://autobuild.buildroot.net/results/bc6dedff80f2c26966823cecb59ad524e1dd7ed3 |     
microblazeel |   host-python-greenlet-2.0.1   | NOK | http://autobuild.buildroot.net/results/eb67fe65c6ff245204c5c163b6704b1e5aa29a6a |     
    arm      |     host-python-m2r-0.3.1      | NOK | http://autobuild.buildroot.net/results/22afdd02d227e39e48a0d76ad3a18f2fac7dbb25 |     
    arc      |     host-python-m2r-0.3.1      | NOK | http://autobuild.buildroot.net/results/5ab09cd9592178e1f7dc6783e2793f3a18b82814 |     
   s390x     |     host-python-m2r-0.3.1      | NOK | http://autobuild.buildroot.net/results/a7dc84e5a73d5306c8cad7bbf0fdcc2ec0c1a8f6 |     
  aarch64    |     host-python-m2r-0.3.1      | NOK | http://autobuild.buildroot.net/results/9041acc5be4d2b33dee9ff0ad66dcd41d4dbfba1 |     
powerpc64le  |     host-python-m2r-0.3.1      | NOK | http://autobuild.buildroot.net/results/d31ba9a681e2f4bca579550da2de4783d26ebc52 |     
   sparc     |     host-python-m2r-0.3.1      | NOK | http://autobuild.buildroot.net/results/6dd26f0f5cb39c587ec500480653024508dd1de9 |     
   mips64    |        host-rust-1.65.0        | NOK | http://autobuild.buildroot.net/results/f48b31673d19394fff86dd2e8e2c49ed8c17897c |     
   x86_64    |        host-rust-1.65.0        | NOK | http://autobuild.buildroot.net/results/cbbf23c394ed474a571624950d0248f3d867eea9 |     
  aarch64    |        host-rust-1.65.0        | NOK | http://autobuild.buildroot.net/results/44c2bcc3fb4ead7927faa269a9f50cd14f827af4 |     
    mips     |        host-rust-1.65.0        | NOK | http://autobuild.buildroot.net/results/fa1bcce3a62d72f7c04b7769fc68d39ac37f0bd7 |     
powerpc64le  |        host-rust-1.65.0        | NOK | http://autobuild.buildroot.net/results/a72dba375c6fc1ef867c9ea83de2b0f7da2fc7b1 |     
  aarch64    |        host-rust-1.65.0        | NOK | http://autobuild.buildroot.net/results/dfe7effe118f6a4540bc5b4f198bcefa28c36417 |     
   x86_64    |        host-rust-1.65.0        | NOK | http://autobuild.buildroot.net/results/b019de4020acb46a8d5818fa553919e830dffae1 |     
   x86_64    |        host-rust-1.65.0        | NOK | http://autobuild.buildroot.net/results/2228188401136ad3e4f62d8cb3bac4e839c4ce70 |     
    arm      |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/6b9bc03d5c8a21d10b141d464aa293a1c9949010 |     
    i686     |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/5d9032e08fa64766a807fa50b11fe9b8d5290f65 |     
   xtensa    |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/e56cc0a79807e378d057a9f1481b534a0e0e008f |     
   x86_64    |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/934821c8e565a1f0827eb09c2638f5fa70b62d0d |     
 aarch64_be  |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/d366872241b08b13f45c5382e9fff0b321291ec4 |     
   x86_64    | host-spirv-llvm-translator-... | NOK | http://autobuild.buildroot.net/results/95f0544e6547d74f5636fe222e976569c163bd35 | ORPH
  aarch64    |        host-swig-4.1.1         | NOK | http://autobuild.buildroot.net/results/2e1e405538719677b64774d410c9053f93099305 |     
   mips64    |        host-swig-4.1.1         | NOK | http://autobuild.buildroot.net/results/36e8820c8519860b694f30489e2ffe967933df3f |     
   s390x     |        host-swig-4.1.1         | NOK | http://autobuild.buildroot.net/results/0d756a6c36398463bba823e5c4411a1a216a600e |     
microblazeel |        host-swig-4.1.1         | NOK | http://autobuild.buildroot.net/results/9ef2dc524a72645dbbdce1f95a852d90b87b687b |     
   x86_64    |        host-swig-4.1.1         | NOK | http://autobuild.buildroot.net/results/989406feeb8b90c9a18a5eae8f3eee3813dd0d49 |     
  sparc64    |        host-swig-4.1.1         | NOK | http://autobuild.buildroot.net/results/260235369bc802ba0936646eb7a9df9339dc2114 |     
powerpc64le  |        host-swig-4.1.1         | NOK | http://autobuild.buildroot.net/results/7c391d0f14e059cb1734d2c4f88e63f23acdf2c2 |     
   x86_64    |        host-swig-4.1.1         | NOK | http://autobuild.buildroot.net/results/445ca22ad5afb541b9beef39be98a9585edc711b |     
  powerpc    |        host-swig-4.1.1         | NOK | http://autobuild.buildroot.net/results/b35fbbac35c600cd27954c6bc561fc104b6ed02e |     
   sparc     |        host-swig-4.1.1         | NOK | http://autobuild.buildroot.net/results/b19ee16456da52648d139ecca9025c98388d08b2 |     
  aarch64    |        host-swig-4.1.1         | NOK | http://autobuild.buildroot.net/results/881048ad3d6ac62225363599604f54992b3738f9 |     
  mips64el   |        host-swig-4.1.1         | NOK | http://autobuild.buildroot.net/results/f3216947beed244ff30e2e07852fc1d450ef6c79 |     
  powerpc    |        host-swig-4.1.1         | NOK | http://autobuild.buildroot.net/results/df8198d9a5a94346e052876c664b4281c85f4d29 |     
    arm      |        host-swig-4.1.1         | NOK | http://autobuild.buildroot.net/results/f824b57b2521152456103c61582b1c583e66a5f0 |     
   s390x     |        host-swig-4.1.1         | NOK | http://autobuild.buildroot.net/results/3a70042aad7376bcccf56d639ced93f504f47963 |     
powerpc64le  |        host-swig-4.1.1         | NOK | http://autobuild.buildroot.net/results/3691bf9731807f5cf7e332b22fe169db1482ecc9 |     
 aarch64_be  |        host-swig-4.1.1         | NOK | http://autobuild.buildroot.net/results/4267a9490c7119f98f3d3274be24bf7077b64aa5 |     
   x86_64    |        host-swig-4.1.1         | NOK | http://autobuild.buildroot.net/results/dcd73ed0abbd903c5062840fa0386e16a6ccdd73 |     
    arc      |        host-swig-4.1.1         | NOK | http://autobuild.buildroot.net/results/9f37b011c40a3de2fb1a6e7c5bd1b6818311dae1 |     
   nios2     |        host-swig-4.1.1         | NOK | http://autobuild.buildroot.net/results/acf6264b4c352d8a263445c6401acb3364717747 |     
   nios2     |        host-swig-4.1.1         | NOK | http://autobuild.buildroot.net/results/b4dc8d07a86a9eb7de37be3293196d4213931a3e |     
    mips     |        hyperfine-1.14.0        | NOK | http://autobuild.buildroot.net/results/59880d24d97adef80513e58152c3a889aa1eb367 | ORPH
   mipsel    |        hyperfine-1.14.0        | NOK | http://autobuild.buildroot.net/results/c73a3b97d09cd0f05288ada8bef233b071eeeefc | ORPH
   xtensa    |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/0351a8979a0ca1e2530ea7b9372ac9286e9ba36f |     
   nios2     |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/5bebac246c8dfa8a92d50d8bb6e2dae2027e5437 |     
   sh4aeb    |          jack2-1.9.21          | NOK | http://autobuild.buildroot.net/results/d13cc4ab7d27dbc8c3766694ecea3cec5cb5e4ca |     
   sh4aeb    |         jemalloc-5.3.0         | NOK | http://autobuild.buildroot.net/results/104216404860c38b4562163139b3332e406e3e9c |     
   armeb     |        libdeflate-1.12         | NOK | http://autobuild.buildroot.net/results/b7d76161cc9c6b4d7df622620671a22c65f78fd9 |     
    arm      |           libev-4.33           | NOK | http://autobuild.buildroot.net/results/620b0865913e5ba65c9145047746ea3cd046079d | ORPH
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/ac879b7ef116ea23314000ec29023e4d0466e47b |     
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/a9e9283290fc0c714873db7adbfa2537a360cbb9 |     
  aarch64    |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/b83b0389ff3939798ec5743c1a36c43ec3ce60dd | ORPH
  aarch64    |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/ccdce7f21f7fc902e284dfc7cb5a53ec5f9a091b | ORPH
 aarch64_be  |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/b1adde8bcdee56948a32d902ff3a1d87bf79fe65 | ORPH
 aarch64_be  |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/c93e0ebf11e02499641f0491c7d93332dbc95f90 | ORPH
 aarch64_be  |       libgpg-error-1.45        | NOK | http://autobuild.buildroot.net/results/1022c0d79f3629d6d104e7b54203b9cb3d03574d | ORPH
 microblaze  |         libkcapi-1.4.0         | NOK | http://autobuild.buildroot.net/results/9a4a32cc81f562e2f406c421207aff519d44fdb3 |     
  powerpc    |        libsigsegv-2.14         | NOK | http://autobuild.buildroot.net/results/5a329a78843297c0a610c98616a625e7c3c5f7f8 |     
   mips64    |        libuhttpd-3.14.1        | NOK | http://autobuild.buildroot.net/results/f2589fed14679f138e32f7704d40b274a07161bc |     
  mips64el   |        libuhttpd-3.14.1        | NOK | http://autobuild.buildroot.net/results/f7aa872207cd2470463ba2da23545559e684678d |     
  powerpc    |        libvorbis-1.3.7         | NOK | http://autobuild.buildroot.net/results/8543d6d2d8f24c29a7190d6dc02c2fe2c81913e9 |     
    mips     |      linux-5.10.145-cip17      | NOK | http://autobuild.buildroot.net/results/776237db8e8ae30b61df084534135448d50291c4 | ORPH
  powerpc    |          linux-6.0.12          | NOK | http://autobuild.buildroot.net/results/37578c56b4d379a71209a19281ffde0b16b87b5b | ORPH
   s390x     |          linux-6.0.9           | NOK | http://autobuild.buildroot.net/results/b2a89287479e69398e0433030acbcf8f9867d9ae | ORPH
   sparc     |       lirc-tools-0.10.2        | NOK | http://autobuild.buildroot.net/results/c1a644ce213f1228ec2e107e17c101bad063c9aa | ORPH
   arceb     |      lttng-modules-2.13.7      | NOK | http://autobuild.buildroot.net/results/9bd58d6dae1b99b918dd959baf86fbe160c36a14 |     
   nios2     |       luaossl-20220711-0       | NOK | http://autobuild.buildroot.net/results/334818cac063e0db3bc987c70fb3e2c952e7c736 |     
 aarch64_be  |        mariadb-10.3.36         | NOK | http://autobuild.buildroot.net/results/fb87dfe6305cc13cc3329fe7f74a36a19491d478 | ORPH
   nios2     |          matio-1.5.23          | NOK | http://autobuild.buildroot.net/results/f46b35de7106033b010125626ed666f53606a202 |     
 aarch64_be  |       micropython-1.19.1       | NOK | http://autobuild.buildroot.net/results/5619afa92e00d65bf16317fff23ce9458ffdb64f |     
    or1k     |        mosquitto-2.0.15        | NOK | http://autobuild.buildroot.net/results/d31de79024e2e7ec610eec15502056c64bdfd9dc |     
    or1k     |          netsurf-3.10          | NOK | http://autobuild.buildroot.net/results/6269e1dfedebb2163a307fbf3ae07a409af94098 |     
    i686     |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/ad1222e1637fd4b1fc43ab0db4243c8c85b5f464 | ORPH
   sparc     |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/8cd11e0acaf33c036dbcd8f5dc9644bc468b8132 | ORPH
    sh4      |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/a3d2aac8ae70dd9402768ba9fc34e0272a7743be | ORPH
   x86_64    |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/b11810228b180b5ee867239bebf4f2c7f6f37db7 | ORPH
  mips64el   |         openal-1.22.0          | NOK | http://autobuild.buildroot.net/results/eb27ce9e9fc62c62e7d4e9ef9d8e84229da1128c |     
    m68k     |         openssh-9.1p1          | NOK | http://autobuild.buildroot.net/results/f4ff2b408d4bb090ec8bed5364e5561e867ffe23 | ORPH
   arceb     |      optee-client-3.19.0       | NOK | http://autobuild.buildroot.net/results/7d5e021f58f952174e52f2f2f18f38ac2085f228 |     
    arc      |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/7a3783364133d3d997de387454ce590b0f4aed10 |     
microblazeel |         proftpd-1.3.8          | NOK | http://autobuild.buildroot.net/results/55f5bd771d2c1ae0b09ed11e2d7386b87f0a1a3d |     
    arm      |      python-bcrypt-4.0.1       | NOK | http://autobuild.buildroot.net/results/875f219135250715e2e26bc6b54bac111f590b52 |     
  sparc64    |      python-bcrypt-4.0.1       | NOK | http://autobuild.buildroot.net/results/9d7ecd127c931cc5fe0a5f01697f7ddfd1e37733 |     
  sparc64    |       python-bunch-1.0.1       | NOK | http://autobuild.buildroot.net/results/b4ac176e772ee198e4f8e11957dacea7a15e23d1 |     
   s390x     |       python-bunch-1.0.1       | NOK | http://autobuild.buildroot.net/results/c5357e646d51bfd020f6aaec092217518d799769 |     
    mips     |     python-greenlet-2.0.0      | NOK | http://autobuild.buildroot.net/results/d04ca326fa921a70e9264a8cf06e06039dce7651 |     
    arm      |      python-numpy-1.23.4       | NOK | http://autobuild.buildroot.net/results/b3de41653778af24e3b55033c3698badebad9633 |     
   mipsel    |      python-numpy-1.23.4       | NOK | http://autobuild.buildroot.net/results/e09ca8a8006c954f2801f91344389b74da3cac16 |     
   x86_64    |            rauc-1.8            | NOK | http://autobuild.buildroot.net/results/5657d099a6c0386d1d39091f57f3300bdcc84b9f |     
  mips64el   |           rpm-4.18.0           | NOK | http://autobuild.buildroot.net/results/e8ce5d8c520c5fa455f2b1db19b0fbfac1af2a67 |     
   armeb     | rtl8192eu-1e15b6d451731bc4d... | NOK | http://autobuild.buildroot.net/results/7d4ab2d94de196f9da476c26719a84c62430ef5e |     
   sparc     | rtl8192eu-1e15b6d451731bc4d... | NOK | http://autobuild.buildroot.net/results/052da18abb71d33f00778a07b5eb014b81ad9721 |     
   sh4eb     |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/4f230a7972ae098a386ca95f78d55c6aa32ed3d0 | ORPH
    sh4a     |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/43a578063b3864bf2c0b0da3e3e4bc5385a00ae3 | ORPH
   nios2     |          sscep-0.10.0          | NOK | http://autobuild.buildroot.net/results/d393e01cb1288e6c87f95c596cf25d0bdbbbfabb |     
   sparc     |          sscep-0.10.0          | NOK | http://autobuild.buildroot.net/results/b18a478334ba7d515e73ae0cee7bfe11014c3be1 |     
    arm      |          sscep-0.10.0          | NOK | http://autobuild.buildroot.net/results/04f7f0c8df7fd933c945a4da2fde366ae8ea62e4 |     
  aarch64    |          sscep-0.10.0          | NOK | http://autobuild.buildroot.net/results/efa41dbf843273cc6353a2aa1781b9c85b3a9cfe |     
    arc      |          sscep-0.10.0          | NOK | http://autobuild.buildroot.net/results/f41a1dbeca2b3228fbc1ec57e0013f17934442b0 |     
  mips64el   |          sscep-0.10.0          | NOK | http://autobuild.buildroot.net/results/71dc94cc2c692ed59c1e31586c6d8a738701ef74 |     
  riscv64    |          sscep-0.10.0          | NOK | http://autobuild.buildroot.net/results/f8eacae9f7a4ad1793089beba3c367d9d0af3d87 |     
    mips     |         suricata-6.0.6         | NOK | http://autobuild.buildroot.net/results/239a2d3294e070f891eb49cc2d0d8a613e497b42 |     
  aarch64    |         tealdeer-1.6.1         | NOK | http://autobuild.buildroot.net/results/8e4e698fa2c6cc4ace9c9767cb89fcccbfaecd59 |     
  sparc64    |         tealdeer-1.6.1         | NOK | http://autobuild.buildroot.net/results/6134ef048cc02faa6287211281be314dd4dfbd66 |     
  mips64el   | toolchain-external-codescap... | NOK | http://autobuild.buildroot.net/results/1f068e505df4f2e50887948b7a65a40f44bb3f75 | ORPH
   x86_64    |          trinity-1.9           | NOK | http://autobuild.buildroot.net/results/f33a3af020c72ac2eeaf1a514bf767f504c98bb7 | ORPH
 powerpc64   |       uccp420wlan-6.9.1        | NOK | http://autobuild.buildroot.net/results/fed95635313791e797ce822a4a8f1665a1a0a45b | ORPH
  riscv32    |       uccp420wlan-6.9.1        | NOK | http://autobuild.buildroot.net/results/fe4d0d7c157ca62fa3838cffca064ad030aa8295 | ORPH
    mips     | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/296afc99008d4e50790230d76b8462e57f9de847 |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/22c59f6cb0df93b45fd14be08a6dde21d69b5b34 |     
    mips     |            unknown             | NOK | http://autobuild.buildroot.net/results/587f59d73caeff91f8f2df52048add098b039090 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/fcf40444a514d0b14dda2346978bc1cef54610cd |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/f15ae4f4d176de74380450c247b1dab7c17584a1 |     
    m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/3625fc11193c057dfcfcb6231b77f5e0cfb0c9a1 |     
   mips64    |         wolfssl-5.5.3          | NOK | http://autobuild.buildroot.net/results/dd50e678ac3d8c5a5daba9534b0dbff94126e52a |     
    m68k     |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/7b74674c51713ef03d71a9b27676c598a12602fa |     
    i586     |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/4fe53c930ec7a233756c1424e999f9c404b35e76 |     
   mipsel    |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/1e4495ca5c16ba1438b0c5e3c848caeb3b63f3fa |     
   armeb     |        xfsprogs-5.14.2         | NOK | http://autobuild.buildroot.net/results/7a4e869228c2c99097e728671a9eed21aebdd084 | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/344eeae7efbb4d5b5653f1316d6ee3fef95e0f7f | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/f36bc271116259bfd37747fc60f59f9e82c91566 | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/091da1efaef8d590fd2a856fb063859964b39d9c | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/4feb3ec103eba621b37f002236ee41cd5ef61382 | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/bffaad77cae8125a360b1d5149fcd707c4fac27a | ORPH
 microblaze  |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/90acf7a76df06c7845c78ae107ec138ada7ff068 | ORPH
microblazeel |            xz-5.2.7            | NOK | http://autobuild.buildroot.net/results/44260e354c310cd3030fdee62f52e0592841b6c6 | ORPH
 aarch64_be  |           znc-1.8.2            | NOK | http://autobuild.buildroot.net/results/55f72ff3ddecbc94ed5ae2184dd2faa93d7d1ebc |     


Classification of failures by reason for 2022.02.x
--------------------------------------------------

           docker-cli-20.10.19 | 1 
            igd2-for-linux-2.1 | 1 


Detail of failures for 2022.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |      docker-cli-20.10.19       | NOK | http://autobuild.buildroot.net/results/a3cfd108ebd273ba5f8a2f580a61729676e5f79e |     
   x86_64    |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/a725b4dc9d47170cd2de6689749fcc8ac0689453 |     


Classification of failures by reason for 2022.08.x
--------------------------------------------------

host-pahole-73383b3a39afe86... | 3 
            igd2-for-linux-2.1 | 2 
              dropbear-2022.82 | 1 
                 linux-5.17.15 | 1 
                  netsurf-3.10 | 1 
                  ntpsec-1_2_1 | 1 
                   perl-5.34.1 | 1 
                 protobuf-21.5 | 1 
                    qemu-7.0.0 | 1 
                       unknown | 1 


Detail of failures for 2022.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |        dropbear-2022.82        | NOK | http://autobuild.buildroot.net/results/03580a9e287d005671d9bb339a1247920e08961c |     
  riscv32    | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/423518e09099fe189028b46785be1b5559ee94da |     
    m68k     | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/618d044bb9d68bf4416191ebd6483285a324cb22 |     
 aarch64_be  | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/07613627e74fb6221feb56fea8cc05e392c1c29b |     
  aarch64    |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/a936ec53a75d1039f936dcf18009ce8dc98c7d26 |     
   mips64    |       igd2-for-linux-2.1       | NOK | http://autobuild.buildroot.net/results/3e03481dc5d87b5aadf8e4f9d75e8b2fa0fc2530 |     
  mips64el   |         linux-5.17.15          | NOK | http://autobuild.buildroot.net/results/3db720b413fe1c5f272210e5417de116ebf0261f | ORPH
   armeb     |          netsurf-3.10          | NOK | http://autobuild.buildroot.net/results/f5e6167de3b063eef2395fa2ea3a4c0071e05336 |     
    m68k     |          ntpsec-1_2_1          | NOK | http://autobuild.buildroot.net/results/24e1a10c9fdeba368f44cf2822fde3f7ef01b98c | ORPH
   arceb     |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/3fa17176d21bc6b8e9799c6208123ecdadb77280 |     
    m68k     |         protobuf-21.5          | NOK | http://autobuild.buildroot.net/results/72235f552d3ba7bb95c5fae5ce3209604db8b6bb |     
   x86_64    |           qemu-7.0.0           | NOK | http://autobuild.buildroot.net/results/7f3b02943d9b2ccec7a9da874fbc18ec20919442 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/71e3e621b1ae8249def5272e62fc3a2a31b35e8c |     


Gitlab CI results for 2022-12-11
================================

Detail of defconfig failures for 2022.02.8
------------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
         qemu_arm_versatile_nommu | https://gitlab.com/buildroot.org/buildroot/-/jobs/3455093543  | ORPH 
                qemu_m68k_mcf5208 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3455093546  |      
           qemu_xtensa_lx60_nommu | https://gitlab.com/buildroot.org/buildroot/-/jobs/3455093582  |      


Detail of runtime-test failures for 2022.02.8
---------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
             TestSyslogNg | https://gitlab.com/buildroot.org/buildroot/-/jobs/3455093815  | ORPH 


Detail of runtime-test failures for 2022.08.3
---------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
...ernalToolchainCtngMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/3454445921  | ORPH 
        TestPerlClassLoad | https://gitlab.com/buildroot.org/buildroot/-/jobs/3454445814  | ORPH 
        TestPolkitSystemd | https://gitlab.com/buildroot.org/buildroot/-/jobs/3454445833  | ORPH 
        TestProsodyLuajit | https://gitlab.com/buildroot.org/buildroot/-/jobs/3454445835  | ORPH 
    TestPythonPy3Autobahn | https://gitlab.com/buildroot.org/buildroot/-/jobs/3454445843  | ORPH 


Packages having a newer version
===============================

             name              | found by |        link to release-monitoring.org        |   version    |   upstream   | orph?
-------------------------------+----------+----------------------------------------------+--------------+--------------+-------
                           ace |  DISTRO  | https://release-monitoring.org/project/242395 | 7.0.6        | 7.0.10       |     
                        acpica |  DISTRO  | https://release-monitoring.org/project/00018 | 20220331     | 20222010
    |     
            adwaita-icon-theme |  DISTRO  | https://release-monitoring.org/project/13117 | 3.37.2       | 43           |     
                       agentpp |  DISTRO  | https://release-monitoring.org/project/21316 | 4.5.4        | 4.6.0        |     
                        alfred |  DISTRO  | https://release-monitoring.org/project/241870 | 2022.1       | 2022.3       |     
                 android-tools |  GUESS   | https://release-monitoring.org/project/13989 | 4.2.2+git... | 13.0.0_r18   |     
                     angularjs |  DISTRO  | https://release-monitoring.org/project/21321 | 1.8.2        | 1.8.3        |     
                      apitrace |  DISTRO  | https://release-monitoring.org/project/06170 | 10.0         | 11.1         |     
                      apparmor |  DISTRO  | https://release-monitoring.org/project/94819 | 3.0.4        | 3.1.2        |     
                     armadillo |  DISTRO  | https://release-monitoring.org/project/07006 | 9.900.2      | 11.4.2       |     
                      asterisk |  DISTRO  | https://release-monitoring.org/project/09838 | 16.29.1      | 20.0.1       |     
                   at-spi2-atk |  DISTRO  | https://release-monitoring.org/project/07840 | 2.34.2       | 2.38.0       |     
                  at-spi2-core |  DISTRO  | https://release-monitoring.org/project/07841 | 2.36.0       | 2.46.0       |     
                         atkmm |  DISTRO  | https://release-monitoring.org/project/07962 | 2.36.1       | 2.36.2       |     
                         audit |  DISTRO  | https://release-monitoring.org/project/15225 | 3.0.7        | 3.0.9        |     
                       avocado |  DISTRO  | https://release-monitoring.org/project/13385 | 98.0         | 99.0         |     
                       avrdude |  DISTRO  | https://release-monitoring.org/project/10751 | 6.4          | 7.0          |     
               azure-iot-sdk-c |  DISTRO  | https://release-monitoring.org/project/21322 | LTS_07_20... | 3033-01-05   |     
                        babeld |  DISTRO  | https://release-monitoring.org/project/00154 | 1.9.2        | 1.12.1       | ORPH
                 balena-engine |  DISTRO  | https://release-monitoring.org/project/141616 | 20.10.21     | 20.10.23     |     
                          bash |  DISTRO  | https://release-monitoring.org/project/00166 | 5.1.16       | 5.2.9        | ORPH
                           bat |  DISTRO  | https://release-monitoring.org/project/241901 | 0.19.0       | 0.22.1       |     
                        batctl |  DISTRO  | https://release-monitoring.org/project/14740 | 2021.0       | 2022.3       |     
                     bctoolbox |  DISTRO  | https://release-monitoring.org/project/14746 | 4.4.8        | 5.2.0        | ORPH
                     belle-sip |  DISTRO  | https://release-monitoring.org/project/14378 | 4.4.8        | 5.2.0        |     
                          belr |  DISTRO  | https://release-monitoring.org/project/80042 | 4.4.8        | 5.2.0        |     
                    berkeleydb |  GUESS   | https://release-monitoring.org/project/138386 | 5.3.28       | 18.1.5       | ORPH
                          bind |  DISTRO  | https://release-monitoring.org/project/14923 | 9.16.33      | 9.18.9       | ORPH
                      binutils |  DISTRO  | https://release-monitoring.org/project/07981 | 2.38         | 2.39         |     
                          bird |  DISTRO  | https://release-monitoring.org/project/00192 | 2.0.10       | 2.0.11       |     
                       bitcoin |  DISTRO  | https://release-monitoring.org/project/13618 | 0.21.2       | 24.0         |     
                  bluez5_utils |  DISTRO  | https://release-monitoring.org/project/10029 | 5.65         | 5.66         |     
          bluez5_utils-headers |  DISTRO  | https://release-monitoring.org/project/10029 | 5.65         | 5.66         |     
                        bonnie |  DISTRO  | https://release-monitoring.org/project/00212 | 1.03e        | 2.00a        | ORPH
                     bootstrap |  DISTRO  | https://release-monitoring.org/project/21578 | 4.3.1        | 5.2.3        |     
                   btrfs-progs |  DISTRO  | https://release-monitoring.org/project/00227 | 5.16.2       | 6.0.2        | ORPH
                    bubblewrap |  DISTRO  | https://release-monitoring.org/project/10937 | 0.6.2        | 0.7.0        |     
                        bullet |  DISTRO  | https://release-monitoring.org/project/07669 | 3.21         | 3.24         |     
                        c-icap |  DISTRO  | https://release-monitoring.org/project/21325 | 0.5.7        | 0.5.9        | ORPH
                c-icap-modules |  DISTRO  | https://release-monitoring.org/project/21326 | 0.5.4        | 0.5.5        | ORPH
                         cairo |  DISTRO  | https://release-monitoring.org/project/00247 | 1.16.0       | 1.17.6       |     
                       cairomm |  DISTRO  | https://release-monitoring.org/project/07959 | 1.16.1       | 1.16.2       |     
                     cantarell |  DISTRO  | https://release-monitoring.org/project/10888 | 0.0.25       | 0.303.1      | ORPH
                     capnproto |  DISTRO  | https://release-monitoring.org/project/11515 | 0.9.2        | 0.10.3       |     
                        ccache |  DISTRO  | https://release-monitoring.org/project/00257 | 3.7.12       | 4.7.4        | ORPH
                          ccid |  DISTRO  | https://release-monitoring.org/project/02612 | 1.5.0        | 1.5.1        | ORPH
                       chartjs |  DISTRO  | https://release-monitoring.org/project/85785 | 3.9.1        | 4.0.1        |     
                   checkpolicy |  DISTRO  | https://release-monitoring.org/project/00276 | 3.3          | 20200710     |     
                    cifs-utils |  DISTRO  | https://release-monitoring.org/project/00287 | 6.15         | 7.0          |     
                        circus |  DISTRO  | https://release-monitoring.org/project/21726 | 0.16.1       | 0.18.0       |     
                        clamav |  DISTRO  | https://release-monitoring.org/project/00291 | 0.103.7      | 1.0.0        |     
                         clang |  DISTRO  | https://release-monitoring.org/project/11811 | 11.1.0       | 15.0.6       |     
                         cmake |  DISTRO  | https://release-monitoring.org/project/00306 | 3.22.3       | 3.25.1       |     
                   cni-plugins |  DISTRO  | https://release-monitoring.org/project/96794 | 1.1.1        | 1.1.2        |     
                           cog |  DISTRO  | https://release-monitoring.org/project/21333 | 0.14.1       | 0.16.1       |     
                      collectl |  DISTRO  | https://release-monitoring.org/project/00330 | 4.3.2        | 4.3.6        |     
                   compiler-rt |  GUESS   | https://release-monitoring.org/project/17705 | 11.1.0       | 900          |     
                      crucible |  DISTRO  | https://release-monitoring.org/project/267616 | 2022.05.25   | 2022.12.06   |     
                      cryptopp |  DISTRO  | https://release-monitoring.org/project/14487 | 8.6.0        | 8.7.0        |     
                      cutelyst |  DISTRO  | https://release-monitoring.org/project/21335 | 2.11.0       | 3.7.0        |     
                        dacapo |  DISTRO  | https://release-monitoring.org/project/20546 | 9.12-MR1-... | 9.12-vbump   |     
                          dado |  DISTRO  | https://release-monitoring.org/project/58442 | 1.8.3-1      | 2.1.0-1      |     
                          dash |  DISTRO  | https://release-monitoring.org/project/00394 | 0.5.11.5     | 0.5.12       | ORPH
                    datatables |  DISTRO  | https://release-monitoring.org/project/141588 | 1.10.20      | 1.13.1       |     
            datatables-buttons |  DISTRO  | https://release-monitoring.org/project/141589 | 1.6.1        | 2.3.3        |     
       datatables-fixedcolumns |  DISTRO  | https://release-monitoring.org/project/141590 | 3.3.0        | 4.2.1        |     
         datatables-responsive |  DISTRO  | https://release-monitoring.org/project/141591 | 2.2.3        | 2.4.0        |     
                          dbus |  DISTRO  | https://release-monitoring.org/project/05356 | 1.12.24      | 1.15.2       | ORPH
                   dbus-python |  DISTRO  | https://release-monitoring.org/project/00402 | 1.2.18       | 1.3.2        | ORPH
                         dc3dd |  DISTRO  | https://release-monitoring.org/project/15086 | 7.2.641      | 7.2.646      | ORPH
                   debianutils |  DISTRO  | https://release-monitoring.org/project/21341 | 4.11         | 5.7          | ORPH
                        dialog |  DISTRO  | https://release-monitoring.org/project/00431 | 1.3-20220117 | 1.3-20220728 | ORPH
                      domoticz |  DISTRO  | https://release-monitoring.org/project/21342 | 2022.1       | 2022.2       |     
                    drbd-utils |  DISTRO  | https://release-monitoring.org/project/00462 | 9.21.4       | 9.22.0       |     
                            dt |  DISTRO  | https://release-monitoring.org/project/21844 | 18.32        | 21.27        | ORPH
                      dump1090 |  DISTRO  | https://release-monitoring.org/project/231403 | 7.2          | 8.1          |     
                          dust |  DISTRO  | https://release-monitoring.org/project/141344 | 0.8.1        | 0.8.3        | ORPH
                          edk2 |  DISTRO  | https://release-monitoring.org/project/125953 | edk2-stab... | 202211       |     
                           efl |  DISTRO  | https://release-monitoring.org/project/06128 | 1.26.1       | 1.26.3       |     
                      ejabberd |  DISTRO  | https://release-monitoring.org/project/00667 | 21.12        | 22.10        |     
                      elfutils |  DISTRO  | https://release-monitoring.org/project/05679 | 0.186        | 0.188        | ORPH
                        elixir |  DISTRO  | https://release-monitoring.org/project/00673 | 1.9.4        | 1.14.2       |     
                           ell |  DISTRO  | https://release-monitoring.org/project/17781 | 0.53         | 0.54         | ORPH
                 enlightenment |  DISTRO  | https://release-monitoring.org/project/00698 | 0.25.1       | 0.25.4       |     
                        erlang |  DISTRO  | https://release-monitoring.org/project/00707 | 22.3.4.22    | 25.1.2       |     
                   erlang-eimp |  DISTRO  | https://release-monitoring.org/project/17060 | 1.0.21       | 1.0.22       |     
               erlang-goldrush |  DISTRO  | https://release-monitoring.org/project/09692 | 0.1.9        | 0.2.0        |     
                   erlang-jose |  DISTRO  | https://release-monitoring.org/project/16913 | 1.11.1       | 1.11.2       |     
                  erlang-lager |  DISTRO  | https://release-monitoring.org/project/00727 | 3.9.1        | 3.9.2        |     
                erlang-p1-acme |  DISTRO  | https://release-monitoring.org/project/45375 | 1.0.16       | 1.0.20       |     
           erlang-p1-cache-tab |  DISTRO  | https://release-monitoring.org/project/08757 | 1.0.29       | 1.0.30       |     
              erlang-p1-mqtree |  DISTRO  | https://release-monitoring.org/project/20220 | 1.0.14       | 1.0.15       |     
              erlang-p1-oauth2 |  DISTRO  | https://release-monitoring.org/project/09302 | 0.6.10       | 0.8.0        |     
                erlang-p1-pkix |  DISTRO  | https://release-monitoring.org/project/20539 | 1.0.8        | 1.0.9        |     
                 erlang-p1-sip |  DISTRO  | https://release-monitoring.org/project/10576 | 1.0.47       | 1.0.48       |     
          erlang-p1-stringprep |  DISTRO  | https://release-monitoring.org/project/09222 | 1.0.27       | 1.0.29       |     
                erlang-p1-stun |  DISTRO  | https://release-monitoring.org/project/09151 | 1.0.47       | 1.2.6        |     
                 erlang-p1-tls |  DISTRO  | https://release-monitoring.org/project/10455 | 1.1.13       | 1.1.16       |     
               erlang-p1-utils |  DISTRO  | https://release-monitoring.org/project/08643 | 1.0.23       | 1.0.25       |     
                erlang-p1-xmpp |  DISTRO  | https://release-monitoring.org/project/12752 | 1.5.6        | 1.6.0        |     
                erlang-p1-yaml |  DISTRO  | https://release-monitoring.org/project/10243 | 1.0.32       | 1.0.34       |     
               erlang-p1-yconf |  DISTRO  | https://release-monitoring.org/project/45378 | 1.0.12       | 1.0.14       |     
                erlang-p1-zlib |  DISTRO  | https://release-monitoring.org/project/09283 | 1.0.10       | 1.0.12       |     
                       ethtool |  DISTRO  | https://release-monitoring.org/project/00763 | 5.19         | 6.0          |     
                           feh |  DISTRO  | https://release-monitoring.org/project/00790 | 3.7.1        | 3.9.1        |     
                        ffmpeg |  DISTRO  | https://release-monitoring.org/project/05405 | 4.4.3        | 5.1.2        |     
                   fftw-double |  DISTRO  | https://release-monitoring.org/project/00803 | 3.3.8        | 3.3.10       | ORPH
              fftw-long-double |  DISTRO  | https://release-monitoring.org/project/00803 | 3.3.8        | 3.3.10       | ORPH
                     fftw-quad |  DISTRO  | https://release-monitoring.org/project/00803 | 3.3.8        | 3.3.10       | ORPH
                   fftw-single |  DISTRO  | https://release-monitoring.org/project/00803 | 3.3.8        | 3.3.10       | ORPH
                           fio |  DISTRO  | https://release-monitoring.org/project/00806 | 3.28         | 3.33         |     
                  flare-engine |  DISTRO  | https://release-monitoring.org/project/21433 | 1.12         | 1.14         |     
                    flare-game |  DISTRO  | https://release-monitoring.org/project/21434 | 1.12         | 1.14         |     
                   flatbuffers |  DISTRO  | https://release-monitoring.org/project/16642 | 2.0.8        | 22.12.06     |     
                          flot |  DISTRO  | https://release-monitoring.org/project/07184 | 0.8.3        | 4.2.3        | ORPH
                          fltk |  DISTRO  | https://release-monitoring.org/project/00823 | 1.3.7        | 1.3.8        | ORPH
                           fmc |  GUESS   | https://release-monitoring.org/project/145761 | fsl-sdk-v2.0 | 0.2.0        |     
                  font-awesome |  DISTRO  | https://release-monitoring.org/project/00826 | 4.7.0        | 6.2.1        | ORPH
                    fontconfig |  DISTRO  | https://release-monitoring.org/project/00827 | 2.13.1       | 2.14.1       | ORPH
             freeradius-server |  DISTRO  | https://release-monitoring.org/project/00853 | 3.2.0        | 3.2.1        |     
                           frr |  DISTRO  | https://release-monitoring.org/project/18555 | 8.3.1        | 8.4.1        |     
                          fwts |  DISTRO  | https://release-monitoring.org/project/17383 | 22.09.00     | 22.11.00     |     
                          gawk |  DISTRO  | https://release-monitoring.org/project/00868 | 5.2.0        | 5.2.1        | ORPH
                           gcr |  DISTRO  | https://release-monitoring.org/project/11801 | 3.40.0       | 4.0.0        | ORPH
                          gdal |  DISTRO  | https://release-monitoring.org/project/00881 | 3.5.1        | 3.6.0.1      |     
                        gensio |  DISTRO  | https://release-monitoring.org/project/67634 | 2.5.5        | 2.6.1        |     
                       gerbera |  DISTRO  | https://release-monitoring.org/project/18420 | 1.10.0       | 1.12.0       |     
                   gettext-gnu |  DISTRO  | https://release-monitoring.org/project/00898 | 0.20.1       | 0.21.1       | ORPH
                   ghostscript |  DISTRO  | https://release-monitoring.org/project/01157 | 9.56.1       | 10.0.0       |     
                           git |  DISTRO  | https://release-monitoring.org/project/05350 | 2.31.5       | 2.38.2       |     
                 gitlab-runner |  DISTRO  | https://release-monitoring.org/project/11337 | 15.5.0       | 15.6.1       |     
               glib-networking |  DISTRO  | https://release-monitoring.org/project/21353 | 2.70.1       | 2.74.0       | ORPH
                        glibmm |  DISTRO  | https://release-monitoring.org/project/07960 | 2.68.2       | 2.74.0       |     
                           glm |  DISTRO  | https://release-monitoring.org/project/01181 | 0.9.9.5      | 0.9.9.8      | ORPH
         gobject-introspection |  DISTRO  | https://release-monitoring.org/project/01223 | 1.72.0       | 1.74.0       | ORPH
                          gqrx |  DISTRO  | https://release-monitoring.org/project/09771 | 2.14.4       | 2.15.9       |     
                       granite |  DISTRO  | https://release-monitoring.org/project/05410 | 6.0.0        | 7.1.0        | ORPH
                      grantlee |  DISTRO  | https://release-monitoring.org/project/21448 | 5.2.0        | 5.3.1        |     
                          grpc |  DISTRO  | https://release-monitoring.org/project/19117 | 1.50.0       | 1.51.1       |     
     gsettings-desktop-schemas |  DISTRO  | https://release-monitoring.org/project/13139 | 3.36.1       | 43.0         | ORPH
                           gsl |  DISTRO  | https://release-monitoring.org/project/01267 | 2.6          | 2.7.1        | ORPH
                         gssdp |  DISTRO  | https://release-monitoring.org/project/01262 | 1.4.0.1      | 1.6.2        |     
                       gst-omx |  DISTRO  | https://release-monitoring.org/project/21845 | 1.20.4       | 1.21.3       | ORPH
                 gst1-devtools |  DISTRO  | https://release-monitoring.org/project/21856 | 1.20.4       | 1.21.3       | ORPH
                      gst1-imx |  DISTRO  | https://release-monitoring.org/project/21846 | 0.13.1       | 2.1.0        |     
                    gst1-libav |  DISTRO  | https://release-monitoring.org/project/21848 | 1.20.4       | 1.21.3       | ORPH
              gst1-plugins-bad |  DISTRO  | https://release-monitoring.org/project/21849 | 1.20.4       | 1.21.3       | ORPH
             gst1-plugins-base |  DISTRO  | https://release-monitoring.org/project/21850 | 1.20.4       | 1.21.3       | ORPH
             gst1-plugins-good |  DISTRO  | https://release-monitoring.org/project/21852 | 1.20.4       | 1.21.3       | ORPH
             gst1-plugins-ugly |  DISTRO  | https://release-monitoring.org/project/15187 | 1.20.4       | 1.21.3       | ORPH
                   gst1-python |  DISTRO  | https://release-monitoring.org/project/03881 | 1.20.4       | 1.21.3       | ORPH
              gst1-rtsp-server |  DISTRO  | https://release-monitoring.org/project/21853 | 1.20.4       | 1.21.3       | ORPH
                    gst1-shark |  DISTRO  | https://release-monitoring.org/project/21854 | v0.7.5       | 0.8.0        |     
                    gst1-vaapi |  DISTRO  | https://release-monitoring.org/project/21855 | 1.20.4       | 1.21.3       | ORPH
                          gstd |  DISTRO  | https://release-monitoring.org/project/235022 | 0.14.0       | 0.15.0       | ORPH
                    gstreamer1 |  DISTRO  | https://release-monitoring.org/project/01263 | 1.20.4       | 1.21.3       | ORPH
   gstreamer1-editing-services |  DISTRO  | https://release-monitoring.org/project/230920 | 1.20.4       | 1.21.3       | ORPH
                         gtest |  DISTRO  | https://release-monitoring.org/project/18290 | 1.12.0       | 1.12.1       |     
                        gtkmm3 |  DISTRO  | https://release-monitoring.org/project/07963 | 3.22.0       | 4.8.0        |     
                 gtksourceview |  DISTRO  | https://release-monitoring.org/project/07724 | 3.24.7       | 5.6.1        |     
                         gupnp |  DISTRO  | https://release-monitoring.org/project/01281 | 1.4.3        | 1.6.2        |     
                      gupnp-av |  DISTRO  | https://release-monitoring.org/project/01282 | 0.14.0       | 0.14.1       |     
                   gupnp-tools |  DISTRO  | https://release-monitoring.org/project/01284 | 0.10.3       | 0.12.0       |     
                    gutenprint |  DISTRO  | https://release-monitoring.org/project/01285 | 5.2.14       | 5.3.4        | ORPH
                          gvfs |  DISTRO  | https://release-monitoring.org/project/05496 | 1.48.1       | 1.50.2       | ORPH
                       haproxy |  DISTRO  | https://release-monitoring.org/project/01298 | 2.6.5        | 2.7.0        |     
                       haveged |  DISTRO  | https://release-monitoring.org/project/11695 | 1.9.15       | 1.9.18       |     
                       heimdal |  DISTRO  | https://release-monitoring.org/project/01307 | 7.7.1        | 7.8.0        | ORPH
                        hidapi |  DISTRO  | https://release-monitoring.org/project/05594 | 0.11.0       | 0.12.0       | ORPH
                       hiredis |  DISTRO  | https://release-monitoring.org/project/01318 | 1.0.2        | 1.1.0        |     
                         hplip |  DISTRO  | https://release-monitoring.org/project/01327 | 3.17.10      | 3.22.10      | ORPH
                        hwdata |  DISTRO  | https://release-monitoring.org/project/05387 | 0.358        | 0.365        | ORPH
                     hyperfine |  DISTRO  | https://release-monitoring.org/project/18526 | 1.14.0       | 1.15.0       | ORPH
                          i2pd |  DISTRO  | https://release-monitoring.org/project/21355 | 2.43.0       | 2.44.0       |     
                   ibm-sw-tpm2 |  DISTRO  | https://release-monitoring.org/project/18952 | 1661         | 1682         |     
                           icu |  DISTRO  | https://release-monitoring.org/project/16134 | 70-1         | 72-1         | ORPH
                     ifenslave |  DISTRO  | https://release-monitoring.org/project/21670 | 2.9          | 2.13         | ORPH
                      ifupdown |  DISTRO  | https://release-monitoring.org/project/21673 | 0.8.16       | 0.8.39       | ORPH
                   imagemagick |  DISTRO  | https://release-monitoring.org/project/01372 | 7.1.0-51     | 7.1.0-53     | ORPH
                        imlib2 |  DISTRO  | https://release-monitoring.org/project/21676 | 1.7.3        | 1.9.1        |     
                          inih |  DISTRO  | https://release-monitoring.org/project/11600 | 55           | 56           |     
                 inotify-tools |  DISTRO  | https://release-monitoring.org/project/08864 | 3.20.2.2     | 3.22.6.0     | ORPH
               intel-microcode |  DISTRO  | https://release-monitoring.org/project/20614 | 20210608     | 20221108     | ORPH
                        iozone |  DISTRO  | https://release-monitoring.org/project/21679 | 3.493        | 3.494        |     
                        ipcalc |  DISTRO  | https://release-monitoring.org/project/07555 | 1.0.1        | 1.0.2        | ORPH
                       iputils |  DISTRO  | https://release-monitoring.org/project/01395 | 20211215     | 20221126     |     
                    irqbalance |  DISTRO  | https://release-monitoring.org/project/01402 | 1.9.0        | 1.9.2        |     
                      irrlicht |  DISTRO  | https://release-monitoring.org/project/01403 | 1.8.4        | 1.8.5        |     
                         irssi |  DISTRO  | https://release-monitoring.org/project/01404 | 1.4.2        | 1.4.3        |     
                            iw |  DISTRO  | https://release-monitoring.org/project/01410 | 5.16         | 5.19         |     
                           iwd |  DISTRO  | https://release-monitoring.org/project/18380 | 1.30         | 2.0          | ORPH
                         janet |  DISTRO  | https://release-monitoring.org/project/155612 | 1.25.0       | 1.25.1       |     
                 janus-gateway |  DISTRO  | https://release-monitoring.org/project/15715 | 1.0.3        | 1.1.1        |     
                        jasper |  DISTRO  | https://release-monitoring.org/project/01421 | 2.0.33       | 4.0.0        |     
         jitterentropy-library |  DISTRO  | https://release-monitoring.org/project/29701 | 3.3.1        | 3.4.1        |     
                            jo |  DISTRO  | https://release-monitoring.org/project/18855 | 1.6          | 1.9          |     
         jquery-datetimepicker |  DISTRO  | https://release-monitoring.org/project/13910 | 2.4.5        | 2.5.20       |     
               jquery-keyboard |  DISTRO  | https://release-monitoring.org/project/21681 | 1.18.12      | 1.30.4       | ORPH
                 jquery-mobile |  DISTRO  | https://release-monitoring.org/project/59395 | 1.4.3        | 1.4.5        | ORPH
                     jquery-ui |  DISTRO  | https://release-monitoring.org/project/21815 | 1.13.1       | 1.13.2       |     
              jquery-ui-themes |  DISTRO  | https://release-monitoring.org/project/21816 | 1.10.4       | 1.13.2       |     
                         jszip |  DISTRO  | https://release-monitoring.org/project/141558 | 3.10.0       | 3.10.1       |     
       kf5-extra-cmake-modules |  DISTRO  | https://release-monitoring.org/project/08762 | 5.91.0       | 5.101.0      |     
               kf5-kcoreaddons |  DISTRO  | https://release-monitoring.org/project/08762 | 5.91.0       | 5.101.0      |     
           kf5-modemmanager-qt |  DISTRO  | https://release-monitoring.org/project/08762 | 5.91.0       | 5.101.0      |     
         kf5-networkmanager-qt |  DISTRO  | https://release-monitoring.org/project/08762 | 5.91.0       | 5.101.0      |     
     kodi-audiodecoder-modplug |  DISTRO  | https://release-monitoring.org/project/21818 | 19.0.2-Ma... | 20.2.0-Nexus |     
    kodi-audiodecoder-nosefart |  DISTRO  | https://release-monitoring.org/project/21819 | 19.0.2-Ma... | 20.2.0-Nexus |     
     kodi-audiodecoder-sidplay |  DISTRO  | https://release-monitoring.org/project/21820 | 19.0.1-Ma... | 20.2.0-Nexus |     
     kodi-audiodecoder-snesapu |  DISTRO  | https://release-monitoring.org/project/21802 | 19.0.2-Ma... | 20.2.0-Nexus |     
     kodi-audiodecoder-stsound |  DISTRO  | https://release-monitoring.org/project/21801 | 19.0.1-Ma... | 20.2.0-Nexus |     
    kodi-audiodecoder-timidity |  DISTRO  | https://release-monitoring.org/project/21800 | 19.0.2-Ma... | 20.2.0-Nexus |     
   kodi-audiodecoder-vgmstream |  DISTRO  | https://release-monitoring.org/project/21799 | 19.0.0-Ma... | 20.2.0-Nexus |     
        kodi-audioencoder-flac |  DISTRO  | https://release-monitoring.org/project/17755 | 19.0.1-Ma... | 20.2.0-Nexus |     
        kodi-audioencoder-lame |  DISTRO  | https://release-monitoring.org/project/21798 | 19.1.2-Ma... | 20.3.0-Nexus |     
      kodi-audioencoder-vorbis |  DISTRO  | https://release-monitoring.org/project/21797 | 19.0.1-Ma... | 20.2.0-Nexus |     
         kodi-audioencoder-wav |  DISTRO  | https://release-monitoring.org/project/21796 | 19.0.1-Ma... | 20.2.0-Nexus |     
     kodi-inputstream-adaptive |  DISTRO  | https://release-monitoring.org/project/21795 | 19.0.7-Ma... | 20.3.1-Nexus |     
 kodi-inputstream-ffmpegdirect |  DISTRO  | https://release-monitoring.org/project/177174 | 19.0.3-Ma... | 20.5.0-Nexus |     
         kodi-inputstream-rtmp |  DISTRO  | https://release-monitoring.org/project/21794 | 19.0.1-Ma... | 20.3.0-Nexus |     
      kodi-peripheral-joystick |  DISTRO  | https://release-monitoring.org/project/21793 | 19.0.3-Ma... | 20.1.2-Nexus |     
       kodi-peripheral-xarcade |  DISTRO  | https://release-monitoring.org/project/21791 | 19.0.4-Ma... | 20.1.2-Nexus |     
              kodi-pvr-argustv |  DISTRO  | https://release-monitoring.org/project/21788 | 19.2.1-Ma... | 20.5.0-Nexus |     
              kodi-pvr-dvblink |  DISTRO  | https://release-monitoring.org/project/21787 | 19.0.1-Ma... | 20.3.0-Nexus |     
            kodi-pvr-dvbviewer |  DISTRO  | https://release-monitoring.org/project/21786 | 19.1.0-Ma... | 20.4.0-Nexus |     
               kodi-pvr-filmon |  DISTRO  | https://release-monitoring.org/project/21785 | 19.0.1-Ma... | 20.3.0-Nexus |     
            kodi-pvr-hdhomerun |  DISTRO  | https://release-monitoring.org/project/21784 | 19.1.0-Ma... | 20.4.0-Nexus |     
                  kodi-pvr-hts |  DISTRO  | https://release-monitoring.org/project/21783 | 19.0.6-Ma... | 20.6.0-Nexus |     
           kodi-pvr-iptvsimple |  DISTRO  | https://release-monitoring.org/project/21782 | 19.2.2-Ma... | 20.6.0-Nexus |     
 kodi-pvr-mediaportal-tvserver |  DISTRO  | https://release-monitoring.org/project/21781 | 19.0.2-Ma... | 20.3.0-Nexus |     
               kodi-pvr-mythtv |  DISTRO  | https://release-monitoring.org/project/21780 | 19.0.11-M... | 20.3.0-Nexus |     
              kodi-pvr-nextpvr |  DISTRO  | https://release-monitoring.org/project/21779 | 19.0.5-Ma... | 20.3.1-Nexus |     
                 kodi-pvr-njoy |  DISTRO  | https://release-monitoring.org/project/21778 | 19.0.1-Ma... | 20.3.0-Nexus |     
              kodi-pvr-octonet |  DISTRO  | https://release-monitoring.org/project/100437 | 19.0.0-Ma... | 20.3.0-Nexus |     
                 kodi-pvr-pctv |  DISTRO  | https://release-monitoring.org/project/21777 | 19.0.1-Ma... | 20.4.0-Nexus |     
              kodi-pvr-plutotv |  DISTRO  | https://release-monitoring.org/project/241527 | 19.0.3-Ma... | 20.3.0-Nexus |     
              kodi-pvr-stalker |  DISTRO  | https://release-monitoring.org/project/21776 | 19.0.4-Ma... | 20.3.1-Nexus |     
                 kodi-pvr-vbox |  DISTRO  | https://release-monitoring.org/project/21775 | 19.0.0-Ma... | 20.3.0-Nexus |     
             kodi-pvr-vdr-vnsi |  DISTRO  | https://release-monitoring.org/project/21774 | 19.0.5-Ma... | 20.4.0-Nexus |     
               kodi-pvr-vuplus |  DISTRO  | https://release-monitoring.org/project/21773 | 19.0.0-Ma... | 20.4.0-Nexus |     
                kodi-pvr-waipu |  DISTRO  | https://release-monitoring.org/project/241529 | 19.3.1-Ma... | 20.6.0-Nexus |     
                  kodi-pvr-wmc |  DISTRO  | https://release-monitoring.org/project/21772 | 19.0.2-Ma... | 20.3.0-Nexus |     
               kodi-pvr-zattoo |  DISTRO  | https://release-monitoring.org/project/100438 | 19.7.16-M... | 20.3.0-Nexus |     
    kodi-screensaver-asteroids |  DISTRO  | https://release-monitoring.org/project/21771 | 19.0.1-Ma... | 20.1.0-Nexus |     
    kodi-screensaver-asterwave |  DISTRO  | https://release-monitoring.org/project/21770 | 19.0.1-Ma... | 20.1.0-Nexus |     
   kodi-screensaver-biogenesis |  DISTRO  | https://release-monitoring.org/project/21768 | 19.0.1-Ma... | 20.1.0-Nexus |     
      kodi-screensaver-cpblobs |  DISTRO  | https://release-monitoring.org/project/21767 | 19.0.1-Ma... | 20.1.0-Nexus |     
    kodi-screensaver-greynetic |  DISTRO  | https://release-monitoring.org/project/21765 | 19.0.1-Ma... | 20.1.0-Nexus |     
 kodi-screensaver-matrixtrails |  DISTRO  | https://release-monitoring.org/project/21764 | 19.0.1-Ma... | 20.1.0-Nexus |     
     kodi-screensaver-pingpong |  DISTRO  | https://release-monitoring.org/project/21763 | 19.0.1-Ma... | 20.1.0-Nexus |     
         kodi-screensaver-pyro |  DISTRO  | https://release-monitoring.org/project/21761 | 19.0.1-Ma... | 20.1.0-Nexus |     
         kodi-screensaver-rsxs |  DISTRO  | https://release-monitoring.org/project/21760 | 19.0.2-Ma... | 20.1.0-Nexus |     
        kodi-screensaver-stars |  DISTRO  | https://release-monitoring.org/project/21759 | 19.0.0-Ma... | 20.1.0-Nexus |     
           kodi-vfs-libarchive |  DISTRO  | https://release-monitoring.org/project/177173 | 19.2.0-Ma... | 20.2.0-Nexus |     
                  kodi-vfs-rar |  DISTRO  | https://release-monitoring.org/project/21900 | 19.0.1-Ma... | 20.1.0-Nexus |     
                 kodi-vfs-sftp |  DISTRO  | https://release-monitoring.org/project/21899 | 19.0.1-Ma... | 20.1.0-Nexus |     
    kodi-visualisation-fishbmc |  DISTRO  | https://release-monitoring.org/project/21758 | 19.0.1-Ma... | 20.1.0-Nexus |     
       kodi-visualisation-goom |  DISTRO  | https://release-monitoring.org/project/21757 | 19.0.2-Ma... | 20.1.1-Nexus |     
     kodi-visualisation-matrix |  DISTRO  | https://release-monitoring.org/project/177172 | 19.0.1-Ma... | 20.2.0-Nexus |     
  kodi-visualisation-shadertoy |  DISTRO  | https://release-monitoring.org/project/21756 | 19.1.2-Ma... | 20.3.0-Nexus |     
   kodi-visualisation-spectrum |  DISTRO  | https://release-monitoring.org/project/21755 | 19.0.2-Ma... | 20.2.0-Nexus |     
  kodi-visualisation-starburst |  DISTRO  | https://release-monitoring.org/project/85703 | 19.0.1-Ma... | 20.2.0-Nexus |     
   kodi-visualisation-waveform |  DISTRO  | https://release-monitoring.org/project/21753 | 19.0.3-Ma... | 20.2.1-Nexus |     
                        lapack |  DISTRO  | https://release-monitoring.org/project/01534 | 3.10.1       | 3.11.0       |     
                         lcms2 |  DISTRO  | https://release-monitoring.org/project/09815 | 2.13.1       | 2.14         |     
                       leafpad |  DISTRO  | https://release-monitoring.org/project/01544 | 0.8.18.1     | 0.8.19       | ORPH
                       lensfun |  DISTRO  | https://release-monitoring.org/project/01548 | 0.3.3        | 0.3.95       |     
                          less |  DISTRO  | https://release-monitoring.org/project/01550 | 590          | 608          | ORPH
                         libao |  DISTRO  | https://release-monitoring.org/project/07629 | 1.2.0        | 1.2.2        | ORPH
                   libapparmor |  DISTRO  | https://release-monitoring.org/project/94819 | 3.0.4        | 3.1.2        |     
                    libarchive |  DISTRO  | https://release-monitoring.org/project/01558 | 3.6.1        | 3.6.2        |     
                        libass |  DISTRO  | https://release-monitoring.org/project/01560 | 0.16.0       | 0.17.0       |     
                   libblockdev |  DISTRO  | https://release-monitoring.org/project/09397 | 2.26         | 2.28-1       | ORPH
                     libbluray |  DISTRO  | https://release-monitoring.org/project/01565 | 1.3.1        | 1.3.4        |     
                        libbsd |  DISTRO  | https://release-monitoring.org/project/01567 | 0.11.3       | 0.11.7       |     
                        libcap |  DISTRO  | https://release-monitoring.org/project/01569 | 2.65         | 2.66         |     
                     libcgroup |  DISTRO  | https://release-monitoring.org/project/01575 | 0.42.2       | 3.0.0        |     
                       libcoap |  DISTRO  | https://release-monitoring.org/project/21471 | 4.3.0        | 4.3.1        |     
                    libdeflate |  DISTRO  | https://release-monitoring.org/project/242778 | 1.12         | 1.15         |     
                       libebml |  DISTRO  | https://release-monitoring.org/project/07879 | 1.4.2        | 1.4.4        |     
                       libedit |  DISTRO  | https://release-monitoring.org/project/01599 | 20210910-3.1 | 20221030-3.1 |     
                      libevdev |  DISTRO  | https://release-monitoring.org/project/20540 | 1.12.1       | 1.13.0       |     
                   libfreeglut |  DISTRO  | https://release-monitoring.org/project/00846 | 3.2.2        | 3.4.0        |     
                       libfuse |  GUESS   | https://release-monitoring.org/project/00861 | 2.9.9        | 3.12.0       | ORPH
                      libfuse3 |  DISTRO  | https://release-monitoring.org/project/00861 | 3.11.0       | 3.12.0       |     
                    libgdiplus |  DISTRO  | https://release-monitoring.org/project/06440 | 6.0.5        | 6.1          |     
                       libgeos |  DISTRO  | https://release-monitoring.org/project/13493 | 3.11.0       | 3.11.1       |     
                      libglade |  DISTRO  | https://release-monitoring.org/project/01174 | 2.6.4        | 3.40.0       | ORPH
                       libglfw |  DISTRO  | https://release-monitoring.org/project/01180 | 3.3.6        | 3.3.8        |     
                      libglib2 |  DISTRO  | https://release-monitoring.org/project/10024 | 2.72.3       | 2.74.3       |     
                      libglvnd |  DISTRO  | https://release-monitoring.org/project/12098 | 1.4.0        | 1.6.0        | ORPH
                  libgpg-error |  DISTRO  | https://release-monitoring.org/project/01628 | 1.45         | 1.46         | ORPH
                      libgpgme |  DISTRO  | https://release-monitoring.org/project/01239 | 1.17.1       | 1.18.0       | ORPH
                    libgphoto2 |  DISTRO  | https://release-monitoring.org/project/12558 | 2.5.27       | 2.5.30       | ORPH
                      libgsasl |  DISTRO  | https://release-monitoring.org/project/01563 | 1.10.0       | 2.2.0        | ORPH
                        libgsm |  DISTRO  | https://release-monitoring.org/project/12587 | 1.0.19       | 1.0.22       |     
                       libgtk2 |  DISTRO  | https://release-monitoring.org/project/13942 | 2.24.33      | 4.9.1        |     
                        libhtp |  DISTRO  | https://release-monitoring.org/project/01632 | 0.5.40       | 0.5.42       |     
                     libiberty |  DISTRO  | https://release-monitoring.org/project/07981 | 2.32         | 2.39         |     
                       libical |  DISTRO  | https://release-monitoring.org/project/01637 | 1.0.1        | 3.0.16       |     
                      libiconv |  DISTRO  | https://release-monitoring.org/project/10656 | 1.15         | 1.17         | ORPH
                  libimxvpuapi |  DISTRO  | https://release-monitoring.org/project/21479 | 0.10.3       | 2.2.1        |     
                      libinput |  DISTRO  | https://release-monitoring.org/project/05781 | 1.20.1       | 1.22.0       |     
                   libmatroska |  DISTRO  | https://release-monitoring.org/project/01657 | 1.6.3        | 1.7.1        |     
                       libmdbx |  DISTRO  | https://release-monitoring.org/project/141559 | 0.11.13      | 0.12.1       |     
                     libmodbus |  DISTRO  | https://release-monitoring.org/project/09728 | 3.1.8        | 3.1.10       |     
                libmodsecurity |  DISTRO  | https://release-monitoring.org/project/68638 | 3.0.7        | 3.0.8        |     
                     libmspack |  DISTRO  | https://release-monitoring.org/project/16827 | 0.10.1alpha  | 1.9.1        |     
                   libnetconf2 |  DISTRO  | https://release-monitoring.org/project/31639 | 2.1.11       | 2.1.25       |     
                        libnfs |  DISTRO  | https://release-monitoring.org/project/07325 | 4.0.0        | 5.0.2        | ORPH
                      libnftnl |  DISTRO  | https://release-monitoring.org/project/01681 | 1.2.3        | 1.2.4        |     
                     libnpupnp |  DISTRO  | https://release-monitoring.org/project/75209 | 4.2.2        | 5.0.0        |     
                        libnss |  DISTRO  | https://release-monitoring.org/project/02503 | 3.85         | 3.86         |     
                        libolm |  DISTRO  | https://release-monitoring.org/project/29706 | 3.2.9        | 3.2.14       |     
                   libopenh264 |  DISTRO  | https://release-monitoring.org/project/21365 | 2.2.0        | 2.3.1        |     
                    libopenssl |  DISTRO  | https://release-monitoring.org/project/20333 | 1.1.1q       | 1.1.1s       |     
                     libostree |  DISTRO  | https://release-monitoring.org/project/10899 | 2022.6       | 2022.7       |     
                libpam-tacplus |  DISTRO  | https://release-monitoring.org/project/20537 | 1.6.1        | 1.7.0        | ORPH
                       libpeas |  DISTRO  | https://release-monitoring.org/project/06871 | 1.32.0       | 1.34.0       | ORPH
                      libpjsip |  DISTRO  | https://release-monitoring.org/project/15701 | 2.12.1       | 2.13         |     
                       libpqxx |  DISTRO  | https://release-monitoring.org/project/21367 | 6.4.5        | 7.7.4        |     
                  libpwquality |  DISTRO  | https://release-monitoring.org/project/15580 | 1.4.4        | 1.4.5        |     
                       librsvg |  DISTRO  | https://release-monitoring.org/project/05420 | 2.50.7       | 2.54.5       |     
                    libselinux |  DISTRO  | https://release-monitoring.org/project/01717 | 3.3          | 3.4          |     
                   libsemanage |  DISTRO  | https://release-monitoring.org/project/01718 | 3.3          | 20200710     |     
                      libsepol |  DISTRO  | https://release-monitoring.org/project/01719 | 3.3          | 20200710     |     
                       libsoup |  DISTRO  | https://release-monitoring.org/project/11483 | 2.74.2       | 3.2.2        |     
                  libtextstyle |  DISTRO  | https://release-monitoring.org/project/00898 | 0.20.1       | 0.21.1       | ORPH
                       libtool |  DISTRO  | https://release-monitoring.org/project/01741 | 2.4.6        | 2.4.7        | ORPH
          libtorrent-rasterbar |  DISTRO  | https://release-monitoring.org/project/04166 | 1.2.15       | 2.0.8        |     
                       libupnp |  DISTRO  | https://release-monitoring.org/project/21315 | 1.14.13      | 1.14.15      |     
                      libupnpp |  DISTRO  | https://release-monitoring.org/project/15849 | 0.21.0       | 0.22.4       | ORPH
                      liburing |  DISTRO  | https://release-monitoring.org/project/230185 | 2.2          | 2.3          |     
                       libvips |  DISTRO  | https://release-monitoring.org/project/05097 | 8.10.6       | 8.13.3       |     
                       libvirt |  DISTRO  | https://release-monitoring.org/project/224041 | 7.10.0       | 8.10.0       |     
                        libwpe |  DISTRO  | https://release-monitoring.org/project/17789 | 1.12.3       | 1.14.0       |     
                     libxcrypt |  DISTRO  | https://release-monitoring.org/project/16436 | 4.4.29       | 4.4.33       |     
                  libxkbcommon |  DISTRO  | https://release-monitoring.org/project/01780 | 1.4.0        | 1.4.1        |     
                     libxmlrpc |  DISTRO  | https://release-monitoring.org/project/09024 | r3119        | 1.54.06      |     
                       libyang |  DISTRO  | https://release-monitoring.org/project/18554 | 2.0.194      | 2.1.4        |     
                     lightning |  DISTRO  | https://release-monitoring.org/project/01816 | 2.1.3        | 2.2.0        |     
                          lilv |  DISTRO  | https://release-monitoring.org/project/01818 | 0.24.12      | 0.24.20      |     
                         links |  DISTRO  | https://release-monitoring.org/project/01822 | 2.26         | 2.28         | ORPH
                      linphone |  DISTRO  | https://release-monitoring.org/project/01823 | 4.4.8        | 5.1.63       | ORPH
                    liquid-dsp |  DISTRO  | https://release-monitoring.org/project/14535 | 1.4.0        | 1.5.0        |     
                       live555 |  DISTRO  | https://release-monitoring.org/project/12414 | 2021.05.03   | 2022.12.01   | ORPH
                           lld |  DISTRO  | https://release-monitoring.org/project/01830 | 11.1.0       | 15.0.6       |     
                         lldpd |  DISTRO  | https://release-monitoring.org/project/14019 | 1.0.15       | 1.0.16       | ORPH
                          llvm |  DISTRO  | https://release-monitoring.org/project/01830 | 11.1.0       | 15.0.6       |     
                          lpty |  DISTRO  | https://release-monitoring.org/project/11671 | 1.0.1-1      | 1.2.2        |     
                          lsof |  DISTRO  | https://release-monitoring.org/project/01844 | 4.96.3       | 4.96.4       | ORPH
                         ltris |  DISTRO  | https://release-monitoring.org/project/21503 | 1.2          | 1.2.6        |     
              lttng-babeltrace |  DISTRO  | https://release-monitoring.org/project/00155 | 1.5.7        | 1.5.11       |     
                  lttng-libust |  DISTRO  | https://release-monitoring.org/project/07135 | 2.13.1       | 2.13.5       |     
                           lua |  DISTRO  | https://release-monitoring.org/project/01847 | 5.1.5        | 5.4.4        |     
                lua-resty-http |  DISTRO  | https://release-monitoring.org/project/13887 | 0.15-0       | 0.16.1       |     
                      luarocks |  DISTRO  | https://release-monitoring.org/project/01856 | 3.9.1        | 3.9.2        |     
                           luv |  DISTRO  | https://release-monitoring.org/project/21510 | 1.43.0-0     | 1.44.2-1     | ORPH
                          luvi |  DISTRO  | https://release-monitoring.org/project/21512 | 2.13.0       | 2.14.0       | ORPH
                          lvm2 |  DISTRO  | https://release-monitoring.org/project/05354 | 2.03.14      | 2.03.17      | ORPH
                          lynx |  DISTRO  | https://release-monitoring.org/project/01863 | 2.8.9rel.1   | 2.9.0        |     
                    lzma-alone |  DISTRO  | https://release-monitoring.org/project/242840 | 9.22         | 2201         | ORPH
                          lzop |  DISTRO  | https://release-monitoring.org/project/07486 | 1.03         | 1.04         |     
                          make |  DISTRO  | https://release-monitoring.org/project/01877 | 4.2.1        | 4.4          | ORPH
                       mariadb |  DISTRO  | https://release-monitoring.org/project/01887 | 10.3.36      | 10.11.1      | ORPH
                       mbedtls |  DISTRO  | https://release-monitoring.org/project/13824 | 2.28.1       | 3.2.1        |     
                        mcelog |  DISTRO  | https://release-monitoring.org/project/08093 | 189          | 190          |     
                 mediastreamer |  DISTRO  | https://release-monitoring.org/project/21746 | 4.4.8        | 5.2.0        | ORPH
                     memcached |  DISTRO  | https://release-monitoring.org/project/01965 | 1.6.16       | 1.6.17       | ORPH
                     memtest86 |  DISTRO  | https://release-monitoring.org/project/01966 | 5.01         | 6.00         |     
                  mesa3d-demos |  DISTRO  | https://release-monitoring.org/project/16781 | 8.4.0        | 8.5.0        |     
                      metacity |  DISTRO  | https://release-monitoring.org/project/15392 | 2.25.1       | 3.46.0       | ORPH
                      mfgtools |  DISTRO  | https://release-monitoring.org/project/21519 | 0.02         | 2.8.0        |     
                         mimic |  DISTRO  | https://release-monitoring.org/project/21521 | 1.1.0        | 1.3.0.1      |     
                      minetest |  DISTRO  | https://release-monitoring.org/project/01978 | 5.5.1        | 5.6.1        |     
                 minetest-game |  DISTRO  | https://release-monitoring.org/project/21522 | 5.5.1        | 5.6.1        |     
                        moarvm |  DISTRO  | https://release-monitoring.org/project/21100 | 2022.07      | 2022.12      |     
mobile-broadband-provider-info |  DISTRO  | https://release-monitoring.org/project/10267 | 20190618     | 20221107     | ORPH
                       mongodb |  DISTRO  | https://release-monitoring.org/project/02008 | 4.2.18       | 6.1.0        |     
                         monit |  DISTRO  | https://release-monitoring.org/project/05483 | 5.26.0       | 5.32.0       |     
                          mono |  DISTRO  | https://release-monitoring.org/project/06360 | 6.12.0.122   | 6.12.0.190   |     
                           mpc |  DISTRO  | https://release-monitoring.org/project/01667 | 1.2.1        | 1.3.0        | ORPH
                          mpfr |  DISTRO  | https://release-monitoring.org/project/02019 | 4.1.0        | 4.1.1        | ORPH
                        mpg123 |  DISTRO  | https://release-monitoring.org/project/12413 | 1.25.15      | 1.31.1       | ORPH
                           mpv |  DISTRO  | https://release-monitoring.org/project/05348 | 0.33.1       | 0.35.0       |     
                       msgpack |  DISTRO  | https://release-monitoring.org/project/12278 | 3.3.0        | 4.1.3        |     
                         mstpd |  DISTRO  | https://release-monitoring.org/project/235098 | 0.1.0        | 0.05         |     
                        mtools |  DISTRO  | https://release-monitoring.org/project/02028 | 4.0.38       | 4.0.42       |     
                          mutt |  DISTRO  | https://release-monitoring.org/project/02035 | 2.2.7        | 2.2.9        |     
                          ncdu |  DISTRO  | https://release-monitoring.org/project/06045 | 1.18         | 2.2.1        |     
                       ncurses |  DISTRO  | https://release-monitoring.org/project/02057 | 6.1          | 6.3-20221210 | ORPH
                netcat-openbsd |  DISTRO  | https://release-monitoring.org/project/21534 | 1.218        | 1.219        | ORPH
                       netdata |  DISTRO  | https://release-monitoring.org/project/11046 | 1.33.1       | 1.37.1       |     
                     netopeer2 |  DISTRO  | https://release-monitoring.org/project/114978 | 2.1.23       | 2.1.42       |     
       network-manager-openvpn |  DISTRO  | https://release-monitoring.org/project/69977 | 1.8.14       | 1.10.2       |     
                          newt |  DISTRO  | https://release-monitoring.org/project/15129 | 0.52.21      | 0.52.23      | ORPH
                       nghttp2 |  DISTRO  | https://release-monitoring.org/project/08651 | 1.41.0       | 1.51.0       |     
                         nginx |  DISTRO  | https://release-monitoring.org/project/05413 | 1.20.1       | 1.23.2       |     
             nginx-modsecurity |  DISTRO  | https://release-monitoring.org/project/68639 | 1.0.2        | 1.0.3        |     
                         ninja |  DISTRO  | https://release-monitoring.org/project/02089 | 1.11.1.g9... | 1.11.1       |     
                          nmap |  DISTRO  | https://release-monitoring.org/project/02096 | 7.92         | 7.93         | ORPH
                        nodejs |  DISTRO  | https://release-monitoring.org/project/08251 | 16.18.1      | 19.2.0       |     
                          noip |  DISTRO  | https://release-monitoring.org/project/21539 | 2.1.9        | 3.0.0        | ORPH
                        nuttcp |  DISTRO  | https://release-monitoring.org/project/02511 | 6.1.2        | 8.2.2        |     
                 nvidia-driver |  DISTRO  | https://release-monitoring.org/project/21843 | 390.151      | 390.157      |     
               nvidia-modprobe |  DISTRO  | https://release-monitoring.org/project/141657 | 450.57       | 525.60.11    | ORPH
                          nvme |  DISTRO  | https://release-monitoring.org/project/09074 | 1.12         | 2.2.1        | ORPH
                         ofono |  DISTRO  | https://release-monitoring.org/project/16859 | 1.34         | 2.0          |     
                          ogre |  DISTRO  | https://release-monitoring.org/project/33334 | v1.12.12     | 13.5.3       |     
                     open62541 |  DISTRO  | https://release-monitoring.org/project/16896 | v1.3.3       | 1.3.4        | ORPH
                        openal |  DISTRO  | https://release-monitoring.org/project/08172 | 1.22.0       | 1.22.2       |     
                  opencl-clhpp |  DISTRO  | https://release-monitoring.org/project/271141 | 2.0.16       | 2022.09.30   |     
                  opencore-amr |  DISTRO  | https://release-monitoring.org/project/21548 | 0.1.5        | 0.1.6        | ORPH
                       opencv3 |  DISTRO  | https://release-monitoring.org/project/06615 | 3.4.17       | 4.6.0        |     
                openfpgaloader |  DISTRO  | https://release-monitoring.org/project/241709 | 0.6.1        | 0.9.1        |     
                      openipmi |  DISTRO  | https://release-monitoring.org/project/02549 | 2.0.32       | 2.0.33       | ORPH
                       openjdk |  GUESS   | https://release-monitoring.org/project/176098 | 11.0.14.1+1  | 21+1         |     
                       openmpi |  DISTRO  | https://release-monitoring.org/project/02554 | 4.0.0        | 4.1.4        | ORPH
                 openpowerlink |  DISTRO  | https://release-monitoring.org/project/21550 | 2.7.1        | 2.7.2        |     
                        openrc |  DISTRO  | https://release-monitoring.org/project/11687 | 0.43.3       | 0.45.2       |     
                        opensc |  DISTRO  | https://release-monitoring.org/project/02559 | 0.22.0       | 0.23.0       |     
                   openvmtools |  DISTRO  | https://release-monitoring.org/project/10998 | 11.3.5-18... | 12.1.5       |     
                       openvpn |  DISTRO  | https://release-monitoring.org/project/02567 | 2.5.7        | 2.5.8        | ORPH
                          opkg |  DISTRO  | https://release-monitoring.org/project/59397 | 0.4.5        | 0.6.1        | ORPH
                    opkg-utils |  DISTRO  | https://release-monitoring.org/project/59396 | 0.4.5        | 0.5.0        |     
                  oracle-mysql |  DISTRO  | https://release-monitoring.org/project/00334 | 5.1.73       | 8.0.31       | ORPH
                           orc |  DISTRO  | https://release-monitoring.org/project/02573 | 0.4.32       | 0.4.33       | ORPH
                          ortp |  DISTRO  | https://release-monitoring.org/project/21691 | 4.4.8        | 5.2.0        | ORPH
                       pangomm |  DISTRO  | https://release-monitoring.org/project/07958 | 2.48.2       | 2.50.1       |     
                    parprouted |  DISTRO  | https://release-monitoring.org/project/10309 | 0.7          | 0.65         | ORPH
                        parted |  DISTRO  | https://release-monitoring.org/project/02596 | 3.4          | 3.5          |     
                      patchelf |  DISTRO  | https://release-monitoring.org/project/02598 | 0.13         | 0.17.0       | ORPH
                     pax-utils |  DISTRO  | https://release-monitoring.org/project/02601 | 1.2.6        | 1.3.5        | ORPH
                      pciutils |  DISTRO  | https://release-monitoring.org/project/02605 | 3.8.0        | 3.9.0        | ORPH
                     pcm-tools |  DISTRO  | https://release-monitoring.org/project/21377 | 202110       | 202211       | ORPH
                         pcre2 |  DISTRO  | https://release-monitoring.org/project/05832 | 10.40        | 10.41        | ORPH
                          pdbg |  DISTRO  | https://release-monitoring.org/project/21378 | 3.5          | 3.6          |     
                          perl |  DISTRO  | https://release-monitoring.org/project/13599 | 5.34.1       | 5.36.0       |     
                perl-crypt-cbc |  DISTRO  | https://release-monitoring.org/project/11930 | 2.33         | 3.04         |     
               perl-date-manip |  DISTRO  | https://release-monitoring.org/project/02785 | 6.89         | 6.90         |     
                perl-dbd-mysql |  DISTRO  | https://release-monitoring.org/project/02807 | 4.046        | 4.050        |     
            perl-exporter-tiny |  DISTRO  | https://release-monitoring.org/project/11846 | 1.002002     | 1.006000     |     
             perl-file-listing |  DISTRO  | https://release-monitoring.org/project/02892 | 6.14         | 6.15         |     
    perl-file-sharedir-install |  DISTRO  | https://release-monitoring.org/project/11851 | 0.13         | 0.14         |     
              perl-html-parser |  DISTRO  | https://release-monitoring.org/project/02967 | 3.76         | 3.80         |     
              perl-http-daemon |  DISTRO  | https://release-monitoring.org/project/02975 | 6.12         | 6.14         |     
             perl-http-message |  DISTRO  | https://release-monitoring.org/project/02977 | 6.37         | 6.44         |     
            perl-io-socket-ssl |  DISTRO  | https://release-monitoring.org/project/06569 | 2.075        | 2.078        |     
             perl-json-maybexs |  DISTRO  | https://release-monitoring.org/project/11953 | 1.004003     | 1.004004     |     
                perl-mail-dkim |  DISTRO  | https://release-monitoring.org/project/11868 | 1.20200824   | 1.20220520   |     
               perl-mime-tools |  DISTRO  | https://release-monitoring.org/project/11809 | 5.509        | 5.510        |     
             perl-module-build |  DISTRO  | https://release-monitoring.org/project/03077 | 0.4231       | 0.4232       |     
              perl-mojolicious |  DISTRO  | https://release-monitoring.org/project/05966 | 9.26         | 9.30         |     
perl-mojolicious-plugin-aut... |  DISTRO  | https://release-monitoring.org/project/21729 | 1.37         | 1.39         |     
               perl-mozilla-ca |  DISTRO  | https://release-monitoring.org/project/03136 | 20211001     | 20221114     |     
                  perl-net-dns |  DISTRO  | https://release-monitoring.org/project/03147 | 1.34         | 1.35         |     
                 perl-net-ssh2 |  DISTRO  | https://release-monitoring.org/project/03163 | 0.72         | 0.73         |     
               perl-net-ssleay |  DISTRO  | https://release-monitoring.org/project/06575 | 1.93_01      | 1.92         |     
            perl-package-stash |  DISTRO  | https://release-monitoring.org/project/11885 | 0.39         | 0.40         |     
                perl-path-tiny |  DISTRO  | https://release-monitoring.org/project/11962 | 0.124        | 0.144        |     
                    perl-plack |  DISTRO  | https://release-monitoring.org/project/06578 | 1.0048       | 1.0050       |     
                  perl-sys-cpu |  DISTRO  | https://release-monitoring.org/project/14338 | 0.52         | 0.61         |     
                perl-type-tiny |  DISTRO  | https://release-monitoring.org/project/14406 | 1.012004     | 2.000001     |     
                      perl-uri |  DISTRO  | https://release-monitoring.org/project/03485 | 5.12         | 5.17         |     
               perl-xml-libxml |  DISTRO  | https://release-monitoring.org/project/03527 | 2.0134       | 2.0208       |     
                           php |  DISTRO  | https://release-monitoring.org/project/03627 | 8.1.12       | 8.2.0        |     
                      php-amqp |  DISTRO  | https://release-monitoring.org/project/15603 | 1.10.2       | 1.11.0       |     
                      php-apcu |  DISTRO  | https://release-monitoring.org/project/11010 | 5.1.20       | 5.1.22       |     
                     php-gnupg |  DISTRO  | https://release-monitoring.org/project/21743 | 1.5.0        | 1.5.1        | ORPH
                 php-memcached |  DISTRO  | https://release-monitoring.org/project/17400 | 3.1.5        | 3.2.0        | ORPH
                       php-pam |  DISTRO  | https://release-monitoring.org/project/241707 | 2.2.3        | 2.2.4        |     
                    php-xdebug |  DISTRO  | https://release-monitoring.org/project/13302 | 3.0.4        | 3.2.0        |     
                        pigpio |  DISTRO  | https://release-monitoring.org/project/21577 | 79           | 7301         |     
                       pkgconf |  DISTRO  | https://release-monitoring.org/project/12753 | 1.6.3        | 1.9.3        | ORPH
                           ply |  DISTRO  | https://release-monitoring.org/project/143128 | 2.2.0        | 2.3.0        |     
                          poco |  DISTRO  | https://release-monitoring.org/project/05418 | 1.12.2       | 1.12.4       |     
               policycoreutils |  DISTRO  | https://release-monitoring.org/project/03680 | 3.2          | 20200710     |     
                       poppler |  DISTRO  | https://release-monitoring.org/project/03686 | 22.10.0      | 22.12.0      |     
                      powertop |  DISTRO  | https://release-monitoring.org/project/03702 | 2.13         | 2.15         |     
                     procps-ng |  DISTRO  | https://release-monitoring.org/project/03708 | 3.3.17       | 4.0.2        | ORPH
                          proj |  DISTRO  | https://release-monitoring.org/project/21570 | 8.1.1        | 9.1.1        |     
                       prosody |  DISTRO  | https://release-monitoring.org/project/03709 | 0.11.13      | 0.12.1       |     
          pru-software-support |  DISTRO  | https://release-monitoring.org/project/21825 | 6.0.1        | 6.1.0        |     
                          ptpd |  GUESS   | https://release-monitoring.org/project/03726 | 1.1.0        | 2.3.1        | ORPH
                         putty |  DISTRO  | https://release-monitoring.org/project/05749 | 0.76         | 0.78         |     
                python-aiocoap |  DISTRO  | https://release-monitoring.org/project/21243 | 0.4.4        | 0.4.5        |     
        python-aiohttp-remotes |  DISTRO  | https://release-monitoring.org/project/21248 | 1.1.0        | 1.2.0        |     
                  python-bleak |  DISTRO  | https://release-monitoring.org/project/26271 | 0.19.1       | 0.19.5       |     
         python-configshell-fb |  DISTRO  | https://release-monitoring.org/project/19734 | 1.1.29       | 1.5          |     
               python-crossbar |  DISTRO  | https://release-monitoring.org/project/21696 | 21.3.1       | 22.6.1       |     
                 python-cython |  DISTRO  | https://release-monitoring.org/project/12679 | 0.29.32      | 3.0.0a11     |     
            python-flatbuffers |  DISTRO  | https://release-monitoring.org/project/85010 | 2.0.7        | 22.12.6      |     
                    python-git |  DISTRO  | https://release-monitoring.org/project/06459 | 3.1.24       | 3.1.29       |     
                 python-gitdb2 |  DISTRO  | https://release-monitoring.org/project/12730 | 4.0.7        | 4.0.10       |     
                  python-iwlib |  DISTRO  | https://release-monitoring.org/project/51611 | 1.5          | 1.7.0        |     
             python-matplotlib |  DISTRO  | https://release-monitoring.org/project/03919 | 3.4.3        | 3.6.2        |     
                python-maturin |  DISTRO  | https://release-monitoring.org/project/42653 | 0.14.4       | 0.14.5       |     
               python-networkx |  DISTRO  | https://release-monitoring.org/project/07791 | 2.8.8        | 3.0b1        |     
                    python-pip |  DISTRO  | https://release-monitoring.org/project/06529 | 22.3         | 22.3.1       |     
                 python-pygame |  DISTRO  | https://release-monitoring.org/project/17480 | d61ea8eabd56 | 2.1.2        |     
                  python-pyqt5 |  DISTRO  | https://release-monitoring.org/project/20104 | 5.15.6       | 5.15.7       |     
         python-pytest-asyncio |  DISTRO  | https://release-monitoring.org/project/07273 | 0.20.1       | 0.20.3       |     
                  python-pyzmq |  DISTRO  | https://release-monitoring.org/project/04104 | 24.0.1       | 25.0.0b1     |     
                  python-rtoml |  DISTRO  | https://release-monitoring.org/project/62048 | 0.8.0        | 0.9.0        |     
              python-rtslib-fb |  DISTRO  | https://release-monitoring.org/project/19641 | 2.1.74       | 2.2          |     
                  python-scipy |  DISTRO  | https://release-monitoring.org/project/04768 | 1.8.1        | 1.9.3        |     
                    python-sip |  DISTRO  | https://release-monitoring.org/project/13626 | 4.19.25      | 5.0.0        |     
             python-sqlalchemy |  DISTRO  | https://release-monitoring.org/project/04034 | 1.4.42       | 2.0.0b4      |     
                python-systemd |  DISTRO  | https://release-monitoring.org/project/07314 | 234          | 235          |     
                python-urllib3 |  DISTRO  | https://release-monitoring.org/project/04078 | 1.26.13      | 2.0.0a2      |     
          qcom-db410c-firmware |  DISTRO  | https://release-monitoring.org/project/235382 | 1034.2.1     | 1036.1       |     
                         qlibc |  DISTRO  | https://release-monitoring.org/project/21737 | 2.4.7        | 2.4.8        | ORPH
                          qpdf |  DISTRO  | https://release-monitoring.org/project/05542 | 10.5.0       | 11.2.0       |     
                   qpid-proton |  DISTRO  | https://release-monitoring.org/project/15198 | 0.35.0       | 0.38.0       |     
                       qt5coap |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.4.1        |     
                        qt5knx |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.4.1        |     
                       qt5mqtt |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.4.1        |     
                      qt5opcua |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.4.1        |     
                  qt5webengine |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.8       | 6.4.1        |     
                       qt6base |  DISTRO  | https://release-monitoring.org/project/07927 | 6.4.0        | 6.4.1        |     
                 qt6serialport |  DISTRO  | https://release-monitoring.org/project/07927 | 6.4.0        | 6.4.1        |     
                           qwt |  DISTRO  | https://release-monitoring.org/project/04147 | 6.1.6        | 6.2.0        | ORPH
                         ragel |  DISTRO  | https://release-monitoring.org/project/12105 | 6.10         | 7.0.4        | ORPH
                        ranger |  DISTRO  | https://release-monitoring.org/project/07426 | 1.7.2        | 1.9.3        |     
           raspberrypi-usbboot |  DISTRO  | https://release-monitoring.org/project/115700 | 2021.07.01   | 20221104-... | ORPH
                           re2 |  DISTRO  | https://release-monitoring.org/project/10500 | 2022-06-01   | 2022-12-01   |     
                      readline |  DISTRO  | https://release-monitoring.org/project/04173 | 8.1.2        | 8.2          | ORPH
                     refpolicy |  DISTRO  | https://release-monitoring.org/project/21663 | 2.20220106   | 2.20221101   |     
                   restorecond |  DISTRO  | https://release-monitoring.org/project/16520 | 3.3          | 20200710     | ORPH
              riemann-c-client |  DISTRO  | https://release-monitoring.org/project/21389 | 1.10.5       | 2.0.1        | ORPH
                       rocksdb |  DISTRO  | https://release-monitoring.org/project/15560 | 6.20.3       | 7.7.3        |     
                       rsyslog |  DISTRO  | https://release-monitoring.org/project/04218 | 8.2204.1     | 8.2212.0     |     
                       rtl_433 |  DISTRO  | https://release-monitoring.org/project/14997 | 21.12        | 22.11        |     
                          rtty |  DISTRO  | https://release-monitoring.org/project/87994 | 7.4.0        | 8.1.0        |     
                         rygel |  DISTRO  | https://release-monitoring.org/project/04751 | 0.40.2       | 0.42.0       |     
                    s390-tools |  DISTRO  | https://release-monitoring.org/project/10714 | 2.23.0       | 2.25.0       |     
                      safeclib |  DISTRO  | https://release-monitoring.org/project/21385 | 3.7.1        | 01022022     |     
                        samba4 |  DISTRO  | https://release-monitoring.org/project/04758 | 4.15.12      | 4.17.3       |     
                         scons |  DISTRO  | https://release-monitoring.org/project/04770 | 3.1.2        | 4.4.0        |     
                          sdl2 |  DISTRO  | https://release-monitoring.org/project/04779 | 2.24.2       | 2.26.1       |     
                    sdl2_mixer |  DISTRO  | https://release-monitoring.org/project/04782 | 2.0.4        | 2.6.2        | ORPH
                      sdl2_net |  DISTRO  | https://release-monitoring.org/project/04783 | 2.0.1        | 2.2.0        | ORPH
                       sdl_gfx |  DISTRO  | https://release-monitoring.org/project/04778 | 2.0.23       | 2.0.25       | ORPH
                     sdl_sound |  DISTRO  | https://release-monitoring.org/project/10262 | 1.0.3        | 2.0.1        | ORPH
                        sdparm |  DISTRO  | https://release-monitoring.org/project/04787 | 1.10         | 1.12         |     
                selinux-python |  DISTRO  | https://release-monitoring.org/project/01717 | 3.3          | 3.4          |     
                semodule-utils |  DISTRO  | https://release-monitoring.org/project/01717 | 3.3          | 3.4          | ORPH
                    sentry-cli |  DISTRO  | https://release-monitoring.org/project/135642 | 2.8.0        | 2.10.0       |     
                 sentry-native |  DISTRO  | https://release-monitoring.org/project/135639 | 0.4.1        | 0.5.3        |     
                       ser2net |  DISTRO  | https://release-monitoring.org/project/21655 | 4.3.8        | 4.3.10       |     
                          serd |  DISTRO  | https://release-monitoring.org/project/230531 | 0.30.14      | 0.30.16      |     
                shairport-sync |  DISTRO  | https://release-monitoring.org/project/21384 | 3.3.9        | 4.1.1        | ORPH
              shared-mime-info |  DISTRO  | https://release-monitoring.org/project/05524 | 1.12         | 2.2          | ORPH
                          shim |  DISTRO  | https://release-monitoring.org/project/10719 | 15.4         | 15.7         |     
                        snmppp |  DISTRO  | https://release-monitoring.org/project/21318 | 3.4.10       | 3.5.0        |     
                        snort3 |  DISTRO  | https://release-monitoring.org/project/13263 | 3.1.40.0     | 3.1.48.0     |     
                     softether |  DISTRO  | https://release-monitoring.org/project/21383 | 4.30-9700... | 4.38-9760... |     
                          sord |  DISTRO  | https://release-monitoring.org/project/230536 | 0.16.12      | 0.16.14      |     
       sound-theme-freedesktop |  DISTRO  | https://release-monitoring.org/project/10152 | 0.7          | 0.8          |     
                       spandsp |  DISTRO  | https://release-monitoring.org/project/12600 | 3.0.0-6ec... | 3.0.0        |     
                    sphinxbase |  DISTRO  | https://release-monitoring.org/project/20548 | 5prealpha    | 0.8          |     
                         spice |  DISTRO  | https://release-monitoring.org/project/04871 | 0.15.0       | 0.15.1       |     
                     sqlcipher |  DISTRO  | https://release-monitoring.org/project/11213 | 4.5.1        | 4.5.2        |     
                        sqlite |  DISTRO  | https://release-monitoring.org/project/04877 | 3.39.4       | 3.40.0       |     
             start-stop-daemon |  DISTRO  | https://release-monitoring.org/project/08127 | 1.20.7.1     | 1.21.12      | ORPH
                    stellarium |  DISTRO  | https://release-monitoring.org/project/04891 | 0.22.2       | 1.1          |     
                     stress-ng |  DISTRO  | https://release-monitoring.org/project/12538 | 0.13.05      | 0.15.00      |     
                       stunnel |  DISTRO  | https://release-monitoring.org/project/04901 | 5.65         | 5.67         |     
                          sudo |  DISTRO  | https://release-monitoring.org/project/04906 | 1.9.11p2     | 1.9.12p1     | ORPH
                  supertuxkart |  DISTRO  | https://release-monitoring.org/project/04912 | 1.3          | 1.4          |     
                    supervisor |  DISTRO  | https://release-monitoring.org/project/16289 | 4.2.2        | 4.2.4        | ORPH
                      suricata |  DISTRO  | https://release-monitoring.org/project/10925 | 6.0.6        | 6.0.9        |     
                       synergy |  DISTRO  | https://release-monitoring.org/project/05718 | 2.0.12-beta  | 2.3.2        |     
                        sysdig |  DISTRO  | https://release-monitoring.org/project/16898 | 0.29.3       | 0.30.2       |     
                       sysprof |  DISTRO  | https://release-monitoring.org/project/21649 | 1.2.0        | 3.46.0       |     
                       sysrepo |  DISTRO  | https://release-monitoring.org/project/34820 | 2.1.64       | 2.2.12       |     
                       sysstat |  DISTRO  | https://release-monitoring.org/project/04931 | 12.6.1       | 12.7.1       | ORPH
         system-config-printer |  DISTRO  | https://release-monitoring.org/project/08855 | 1.5.15       | 1.5.18       | ORPH
                       systemd |  DISTRO  | https://release-monitoring.org/project/05440 | 250.8        | 252          |     
             systemd-bootchart |  DISTRO  | https://release-monitoring.org/project/11774 | 233          | 234          |     
                      sysvinit |  DISTRO  | https://release-monitoring.org/project/21648 | 2.99         | 3.04         | ORPH
                           tbb |  DISTRO  | https://release-monitoring.org/project/08217 | 2021.5.0     | 2021.7.0     |     
                           tcl |  DISTRO  | https://release-monitoring.org/project/04941 | 8.6.12       | 8.6.13       | ORPH
                         tclap |  DISTRO  | https://release-monitoring.org/project/04942 | 1.2.4        | 1.2.5        |     
                        tcllib |  DISTRO  | https://release-monitoring.org/project/04943 | 1.20         | 1.21         |     
                   terminology |  DISTRO  | https://release-monitoring.org/project/04951 | 1.12.1       | 1.13.0       |     
                 tesseract-ocr |  DISTRO  | https://release-monitoring.org/project/04954 | 5.0.1        | 5.2.0        |     
                      thermald |  DISTRO  | https://release-monitoring.org/project/14500 | 2.5          | 2.5.1        |     
                        thrift |  DISTRO  | https://release-monitoring.org/project/05581 | 0.14.1       | 0.17.0       | ORPH
                      tinifier |  DISTRO  | https://release-monitoring.org/project/241900 | 3.4.0        | 4.0.1        |     
                       tinyxml |  DISTRO  | https://release-monitoring.org/project/10162 | 2.6.2_2      | 2.6.2        | ORPH
                           tio |  DISTRO  | https://release-monitoring.org/project/20587 | 1.47         | 2.4          |     
                            tk |  DISTRO  | https://release-monitoring.org/project/11426 | 8.6.12       | 8.6.13       |     
                          tmux |  DISTRO  | https://release-monitoring.org/project/04980 | 3.1c         | 3.3a         |     
                           tor |  DISTRO  | https://release-monitoring.org/project/04991 | 0.4.7.10     | 0.4.7.12     |     
                     tpm-tools |  DISTRO  | https://release-monitoring.org/project/21640 | 1.3.9.1      | 1.3.9.2      |     
                    tpm2-abrmd |  DISTRO  | https://release-monitoring.org/project/16819 | 2.3.3        | 3.0.0        | ORPH
                    tpm2-tools |  DISTRO  | https://release-monitoring.org/project/12841 | 5.2          | 5.4          | ORPH
                     tpm2-totp |  DISTRO  | https://release-monitoring.org/project/18790 | 0.2.1        | 0.3.0        |     
                      tpm2-tss |  DISTRO  | https://release-monitoring.org/project/12683 | 3.1.0        | 3.2.0        | ORPH
                     trace-cmd |  DISTRO  | https://release-monitoring.org/project/07873 | 2.9.7        | 3.1.4        |     
                          tree |  DISTRO  | https://release-monitoring.org/project/05006 | 2.0.2        | 2.0.4        |     
                        tzdata |  DISTRO  | https://release-monitoring.org/project/05021 | 2022f        | 2022g        |     
                   uboot-tools |  DISTRO  | https://release-monitoring.org/project/05022 | 2021.07      | 2022.10      |     
                       unionfs |  DISTRO  | https://release-monitoring.org/project/17617 | 2.1          | 3.2          |     
                         unrar |  DISTRO  | https://release-monitoring.org/project/13306 | 6.1.7        | 6.2.2        | ORPH
                      upmpdcli |  DISTRO  | https://release-monitoring.org/project/15848 | 1.5.12       | 1.6.2        | ORPH
                        upower |  DISTRO  | https://release-monitoring.org/project/05056 | 0.99.19      | 0.99.20      |     
                           upx |  DISTRO  | https://release-monitoring.org/project/13737 | 3.96         | 4.0.1        |     
                    util-linux |  DISTRO  | https://release-monitoring.org/project/08179 | 2.38         | 2.38.1       | ORPH
               util-linux-libs |  DISTRO  | https://release-monitoring.org/project/08179 | 2.38         | 2.38.1       | ORPH
                          vala |  DISTRO  | https://release-monitoring.org/project/05065 | 0.52.4       | 0.56.3       | ORPH
                      valgrind |  DISTRO  | https://release-monitoring.org/project/13639 | 3.19.0       | 3.20.0       | ORPH
                      valijson |  DISTRO  | https://release-monitoring.org/project/18452 | 0.7          | 1.0          |     
                           vim |  DISTRO  | https://release-monitoring.org/project/05092 | 9.0.0951     | 9.0.1047     | ORPH
                   vis-network |  DISTRO  | https://release-monitoring.org/project/270536 | 9.1.0        | 9.1.2        |     
                          vpnc |  DISTRO  | https://release-monitoring.org/project/15955 | 0.5.3r550... | 0.5.3        | ORPH
                           vte |  DISTRO  | https://release-monitoring.org/project/10895 | 0.66.2       | 0.70.2       | ORPH
                vulkan-headers |  DISTRO  | https://release-monitoring.org/project/88835 | 1.2.203      | 1.3.237      | ORPH
                       wavpack |  DISTRO  | https://release-monitoring.org/project/05121 | 5.5.0        | 5.6.0        | ORPH
             wayland-protocols |  DISTRO  | https://release-monitoring.org/project/13997 | 1.28         | 1.31         | ORPH
                     waylandpp |  DISTRO  | https://release-monitoring.org/project/16969 | 0.2.8        | 1.0.0        |     
                     webkitgtk |  DISTRO  | https://release-monitoring.org/project/05355 | 2.38.0       | 2.39.2       |     
       webrtc-audio-processing |  DISTRO  | https://release-monitoring.org/project/15929 | 0.3.1        | 1.0          | ORPH
                        weston |  DISTRO  | https://release-monitoring.org/project/13745 | 10.0.1       | 11.0.0       |     
                          wine |  DISTRO  | https://release-monitoring.org/project/05134 | 7.0          | 7.22         |     
                wireless-regdb |  DISTRO  | https://release-monitoring.org/project/15257 | 2022.02.18   | 2022.08.12   |     
                   wireplumber |  DISTRO  | https://release-monitoring.org/project/235056 | 0.4.8        | 0.4.12       | ORPH
                     wireshark |  DISTRO  | https://release-monitoring.org/project/05137 | 3.4.12       | 4.0.2        | ORPH
                       wlroots |  DISTRO  | https://release-monitoring.org/project/18357 | 0.15.1       | 0.16.0       |     
                wpebackend-fdo |  DISTRO  | https://release-monitoring.org/project/17547 | 1.12.1       | 1.14.0       |     
                     wpewebkit |  DISTRO  | https://release-monitoring.org/project/17557 | 2.36.8       | 2.38.2       |     
                       wtfutil |  DISTRO  | https://release-monitoring.org/project/243189 | 0.41.0       | 0.42.0       |     
                        xapian |  DISTRO  | https://release-monitoring.org/project/15919 | 1.4.19       | 1.4.21       |     
                     xapp_luit |  DISTRO  | https://release-monitoring.org/project/15047 | 1.1.1        | 20221028     |     
   xdriver_xf86-input-keyboard |  DISTRO  | https://release-monitoring.org/project/15902 | 1.9.0        | 2.0.0        |     
   xdriver_xf86-input-libinput |  DISTRO  | https://release-monitoring.org/project/05782 | 1.2.0        | 1.2.1        |     
                           xen |  DISTRO  | https://release-monitoring.org/project/05181 | 4.14.5       | 4.17.0       |     
                      xfsprogs |  DISTRO  | https://release-monitoring.org/project/05188 | 5.14.2       | 6.0.0        | ORPH
                        xinetd |  DISTRO  | https://release-monitoring.org/project/06382 | 2.3.15       | 2.3.15.4     |     
              xkeyboard-config |  DISTRO  | https://release-monitoring.org/project/05191 | 2.36         | 2.37         |     
                   xlib_libXft |  DISTRO  | https://release-monitoring.org/project/01777 | 2.3.6        | 2.3.7        |     
                  xscreensaver |  DISTRO  | https://release-monitoring.org/project/05269 | 6.03         | 6.06.1       |     
                xtables-addons |  DISTRO  | https://release-monitoring.org/project/07736 | 3.21         | 3.22         | ORPH
                         xterm |  DISTRO  | https://release-monitoring.org/project/05272 | 376          | 377          | ORPH
                            xz |  DISTRO  | https://release-monitoring.org/project/05277 | 5.2.7        | 5.2.9        | ORPH
                           yad |  DISTRO  | https://release-monitoring.org/project/05280 | 0.40.0       | 12.1         |     
                        zabbix |  DISTRO  | https://release-monitoring.org/project/05492 | 5.4.9        | 6.2.6        |     
                        zchunk |  DISTRO  | https://release-monitoring.org/project/178035 | 1.2.2        | 1.2.3        |     
                          zeek |  DISTRO  | https://release-monitoring.org/project/267106 | 4.1.1        | 5.1.1        |     
                           zic |  DISTRO  | https://release-monitoring.org/project/16905 | 2022f        | 2022g        |     

Packages having CVEs
====================

CVEs for the 'master' branch
----------------------------

             name              |       CVE        |                             link                            
-------------------------------+------------------+--------------------------------------------------------------
                        apache | CVE-1999-0236    | https://security-tracker.debian.org/tracker/CVE-1999-0236   
                        apache | CVE-1999-0289    | https://security-tracker.debian.org/tracker/CVE-1999-0289   
                        apache | CVE-1999-0678    | https://security-tracker.debian.org/tracker/CVE-1999-0678   
                        apache | CVE-1999-1237    | https://security-tracker.debian.org/tracker/CVE-1999-1237   
                        apache | CVE-1999-1412    | https://security-tracker.debian.org/tracker/CVE-1999-1412   
                        apache | CVE-2007-0086    | https://security-tracker.debian.org/tracker/CVE-2007-0086   
                        apache | CVE-2007-0450    | https://security-tracker.debian.org/tracker/CVE-2007-0450   
                        apache | CVE-2007-4465    | https://security-tracker.debian.org/tracker/CVE-2007-4465   
                        apache | CVE-2007-5000    | https://security-tracker.debian.org/tracker/CVE-2007-5000   
                        apache | CVE-2007-6388    | https://security-tracker.debian.org/tracker/CVE-2007-6388   
                        apache | CVE-2007-6420    | https://security-tracker.debian.org/tracker/CVE-2007-6420   
                        apache | CVE-2007-6421    | https://security-tracker.debian.org/tracker/CVE-2007-6421   
                        apache | CVE-2007-6422    | https://security-tracker.debian.org/tracker/CVE-2007-6422   
                        apache | CVE-2007-6423    | https://security-tracker.debian.org/tracker/CVE-2007-6423   
                        apache | CVE-2008-2168    | https://security-tracker.debian.org/tracker/CVE-2008-2168   
                        apache | CVE-2008-2939    | https://security-tracker.debian.org/tracker/CVE-2008-2939   
                        apache | CVE-2009-1195    | https://security-tracker.debian.org/tracker/CVE-2009-1195   
                        apache | CVE-2010-0408    | https://security-tracker.debian.org/tracker/CVE-2010-0408   
                        apache | CVE-2010-0425    | https://security-tracker.debian.org/tracker/CVE-2010-0425   
                        apache | CVE-2010-1452    | https://security-tracker.debian.org/tracker/CVE-2010-1452   
                        apache | CVE-2014-0231    | https://security-tracker.debian.org/tracker/CVE-2014-0231   
                      apparmor | CVE-2016-1585    | https://security-tracker.debian.org/tracker/CVE-2016-1585   
                         argus | CVE-2011-3332    | https://security-tracker.debian.org/tracker/CVE-2011-3332   
                         asn1c | CVE-2017-12966   | https://security-tracker.debian.org/tracker/CVE-2017-12966  
                        assimp | CVE-2022-38528   | https://security-tracker.debian.org/tracker/CVE-2022-38528  
                          atop | CVE-2011-3618    | https://security-tracker.debian.org/tracker/CVE-2011-3618   
                         avahi | CVE-2021-3468    | https://security-tracker.debian.org/tracker/CVE-2021-3468   
                     belle-sip | CVE-2021-33056   | https://security-tracker.debian.org/tracker/CVE-2021-33056  
                     belle-sip | CVE-2021-43610   | https://security-tracker.debian.org/tracker/CVE-2021-43610  
                     belle-sip | CVE-2021-43611   | https://security-tracker.debian.org/tracker/CVE-2021-43611  
                        bento4 | CVE-2020-23331   | https://security-tracker.debian.org/tracker/CVE-2020-23331  
                        bento4 | CVE-2020-23332   | https://security-tracker.debian.org/tracker/CVE-2020-23332  
                        bento4 | CVE-2022-27607   | https://security-tracker.debian.org/tracker/CVE-2022-27607  
                        bento4 | CVE-2022-35165   | https://security-tracker.debian.org/tracker/CVE-2022-35165  
                        bento4 | CVE-2022-3662    | https://security-tracker.debian.org/tracker/CVE-2022-3662   
                        bento4 | CVE-2022-3663    | https://security-tracker.debian.org/tracker/CVE-2022-3663   
                        bento4 | CVE-2022-3664    | https://security-tracker.debian.org/tracker/CVE-2022-3664   
                        bento4 | CVE-2022-3665    | https://security-tracker.debian.org/tracker/CVE-2022-3665   
                        bento4 | CVE-2022-3666    | https://security-tracker.debian.org/tracker/CVE-2022-3666   
                        bento4 | CVE-2022-3667    | https://security-tracker.debian.org/tracker/CVE-2022-3667   
                        bento4 | CVE-2022-3668    | https://security-tracker.debian.org/tracker/CVE-2022-3668   
                        bento4 | CVE-2022-3669    | https://security-tracker.debian.org/tracker/CVE-2022-3669   
                        bento4 | CVE-2022-3670    | https://security-tracker.debian.org/tracker/CVE-2022-3670   
                        bento4 | CVE-2022-3784    | https://security-tracker.debian.org/tracker/CVE-2022-3784   
                        bento4 | CVE-2022-3785    | https://security-tracker.debian.org/tracker/CVE-2022-3785   
                        bento4 | CVE-2022-3807    | https://security-tracker.debian.org/tracker/CVE-2022-3807   
                        bento4 | CVE-2022-3809    | https://security-tracker.debian.org/tracker/CVE-2022-3809   
                        bento4 | CVE-2022-3810    | https://security-tracker.debian.org/tracker/CVE-2022-3810   
                        bento4 | CVE-2022-3812    | https://security-tracker.debian.org/tracker/CVE-2022-3812   
                        bento4 | CVE-2022-3813    | https://security-tracker.debian.org/tracker/CVE-2022-3813   
                        bento4 | CVE-2022-3814    | https://security-tracker.debian.org/tracker/CVE-2022-3814   
                        bento4 | CVE-2022-3815    | https://security-tracker.debian.org/tracker/CVE-2022-3815   
                        bento4 | CVE-2022-3816    | https://security-tracker.debian.org/tracker/CVE-2022-3816   
                        bento4 | CVE-2022-3817    | https://security-tracker.debian.org/tracker/CVE-2022-3817   
                        bento4 | CVE-2022-40438   | https://security-tracker.debian.org/tracker/CVE-2022-40438  
                        bento4 | CVE-2022-40439   | https://security-tracker.debian.org/tracker/CVE-2022-40439  
                        bento4 | CVE-2022-40736   | https://security-tracker.debian.org/tracker/CVE-2022-40736  
                        bento4 | CVE-2022-40737   | https://security-tracker.debian.org/tracker/CVE-2022-40737  
                        bento4 | CVE-2022-40738   | https://security-tracker.debian.org/tracker/CVE-2022-40738  
                        bento4 | CVE-2022-40774   | https://security-tracker.debian.org/tracker/CVE-2022-40774  
                        bento4 | CVE-2022-40775   | https://security-tracker.debian.org/tracker/CVE-2022-40775  
                        bento4 | CVE-2022-40885   | https://security-tracker.debian.org/tracker/CVE-2022-40885  
                        bento4 | CVE-2022-41419   | https://security-tracker.debian.org/tracker/CVE-2022-41419  
                        bento4 | CVE-2022-41423   | https://security-tracker.debian.org/tracker/CVE-2022-41423  
                        bento4 | CVE-2022-41424   | https://security-tracker.debian.org/tracker/CVE-2022-41424  
                        bento4 | CVE-2022-41425   | https://security-tracker.debian.org/tracker/CVE-2022-41425  
                        bento4 | CVE-2022-41426   | https://security-tracker.debian.org/tracker/CVE-2022-41426  
                        bento4 | CVE-2022-41427   | https://security-tracker.debian.org/tracker/CVE-2022-41427  
                        bento4 | CVE-2022-41428   | https://security-tracker.debian.org/tracker/CVE-2022-41428  
                        bento4 | CVE-2022-41429   | https://security-tracker.debian.org/tracker/CVE-2022-41429  
                        bento4 | CVE-2022-41430   | https://security-tracker.debian.org/tracker/CVE-2022-41430  
                        bento4 | CVE-2022-41841   | https://security-tracker.debian.org/tracker/CVE-2022-41841  
                        bento4 | CVE-2022-41845   | https://security-tracker.debian.org/tracker/CVE-2022-41845  
                        bento4 | CVE-2022-41846   | https://security-tracker.debian.org/tracker/CVE-2022-41846  
                        bento4 | CVE-2022-41847   | https://security-tracker.debian.org/tracker/CVE-2022-41847  
                        bento4 | CVE-2022-43032   | https://security-tracker.debian.org/tracker/CVE-2022-43032  
                        bento4 | CVE-2022-43033   | https://security-tracker.debian.org/tracker/CVE-2022-43033  
                        bento4 | CVE-2022-43034   | https://security-tracker.debian.org/tracker/CVE-2022-43034  
                        bento4 | CVE-2022-43035   | https://security-tracker.debian.org/tracker/CVE-2022-43035  
                        bento4 | CVE-2022-43037   | https://security-tracker.debian.org/tracker/CVE-2022-43037  
                        bento4 | CVE-2022-43038   | https://security-tracker.debian.org/tracker/CVE-2022-43038  
                    berkeleydb | CVE-2017-3604    | https://security-tracker.debian.org/tracker/CVE-2017-3604   
                    berkeleydb | CVE-2017-3605    | https://security-tracker.debian.org/tracker/CVE-2017-3605   
                    berkeleydb | CVE-2017-3606    | https://security-tracker.debian.org/tracker/CVE-2017-3606   
                    berkeleydb | CVE-2017-3607    | https://security-tracker.debian.org/tracker/CVE-2017-3607   
                    berkeleydb | CVE-2017-3608    | https://security-tracker.debian.org/tracker/CVE-2017-3608   
                    berkeleydb | CVE-2017-3609    | https://security-tracker.debian.org/tracker/CVE-2017-3609   
                    berkeleydb | CVE-2017-3610    | https://security-tracker.debian.org/tracker/CVE-2017-3610   
                    berkeleydb | CVE-2017-3611    | https://security-tracker.debian.org/tracker/CVE-2017-3611   
                    berkeleydb | CVE-2017-3612    | https://security-tracker.debian.org/tracker/CVE-2017-3612   
                    berkeleydb | CVE-2017-3613    | https://security-tracker.debian.org/tracker/CVE-2017-3613   
                    berkeleydb | CVE-2017-3614    | https://security-tracker.debian.org/tracker/CVE-2017-3614   
                    berkeleydb | CVE-2017-3615    | https://security-tracker.debian.org/tracker/CVE-2017-3615   
                    berkeleydb | CVE-2017-3616    | https://security-tracker.debian.org/tracker/CVE-2017-3616   
                    berkeleydb | CVE-2017-3617    | https://security-tracker.debian.org/tracker/CVE-2017-3617   
                    berkeleydb | CVE-2019-2708    | https://security-tracker.debian.org/tracker/CVE-2019-2708   
                    berkeleydb | CVE-2020-2981    | https://security-tracker.debian.org/tracker/CVE-2020-2981   
                      binutils | CVE-2022-38533   | https://security-tracker.debian.org/tracker/CVE-2022-38533  
                       bitcoin | CVE-2012-1909    | https://security-tracker.debian.org/tracker/CVE-2012-1909   
                       bitcoin | CVE-2012-4682    | https://security-tracker.debian.org/tracker/CVE-2012-4682   
                       bitcoin | CVE-2012-4683    | https://security-tracker.debian.org/tracker/CVE-2012-4683   
                       bitcoin | CVE-2013-2272    | https://security-tracker.debian.org/tracker/CVE-2013-2272   
                       bitcoin | CVE-2013-2273    | https://security-tracker.debian.org/tracker/CVE-2013-2273   
                       bitcoin | CVE-2013-2292    | https://security-tracker.debian.org/tracker/CVE-2013-2292   
                       bitcoin | CVE-2013-2293    | https://security-tracker.debian.org/tracker/CVE-2013-2293   
                       bitcoin | CVE-2013-3220    | https://security-tracker.debian.org/tracker/CVE-2013-3220   
                  bluez5_utils | CVE-2020-24490   | https://security-tracker.debian.org/tracker/CVE-2020-24490  
          bluez5_utils-headers | CVE-2020-24490   | https://security-tracker.debian.org/tracker/CVE-2020-24490  
                        bsdiff | CVE-2020-14315   | https://security-tracker.debian.org/tracker/CVE-2020-14315  
                         cairo | CVE-2019-6461    | https://security-tracker.debian.org/tracker/CVE-2019-6461   
                         cairo | CVE-2019-6462    | https://security-tracker.debian.org/tracker/CVE-2019-6462   
                         cairo | CVE-2020-35492   | https://security-tracker.debian.org/tracker/CVE-2020-35492  
                     coreutils | CVE-2016-2781    | https://security-tracker.debian.org/tracker/CVE-2016-2781   
                          cpio | CVE-2010-4226    | https://security-tracker.debian.org/tracker/CVE-2010-4226   
                      cryptopp | CVE-2021-43398   | https://security-tracker.debian.org/tracker/CVE-2021-43398  
                           cvs | CVE-2017-12836   | https://security-tracker.debian.org/tracker/CVE-2017-12836  
                       dnsmasq | CVE-2022-0934    | https://security-tracker.debian.org/tracker/CVE-2022-0934   
                        docker | CVE-2014-0048    | https://security-tracker.debian.org/tracker/CVE-2014-0048   
                        docker | CVE-2014-8178    | https://security-tracker.debian.org/tracker/CVE-2014-8178   
                        docker | CVE-2014-8179    | https://security-tracker.debian.org/tracker/CVE-2014-8179   
                        docker | CVE-2015-1843    | https://security-tracker.debian.org/tracker/CVE-2015-1843   
                        docker | CVE-2015-3627    | https://security-tracker.debian.org/tracker/CVE-2015-3627   
                        docker | CVE-2015-3630    | https://security-tracker.debian.org/tracker/CVE-2015-3630   
                        docker | CVE-2015-3631    | https://security-tracker.debian.org/tracker/CVE-2015-3631   
                        docker | CVE-2016-3697    | https://security-tracker.debian.org/tracker/CVE-2016-3697   
                        docker | CVE-2017-14992   | https://security-tracker.debian.org/tracker/CVE-2017-14992  
                        docker | CVE-2019-13139   | https://security-tracker.debian.org/tracker/CVE-2019-13139  
                        docker | CVE-2019-13509   | https://security-tracker.debian.org/tracker/CVE-2019-13509  
                        docker | CVE-2019-15752   | https://security-tracker.debian.org/tracker/CVE-2019-15752  
                        docker | CVE-2019-16884   | https://security-tracker.debian.org/tracker/CVE-2019-16884  
                        docker | CVE-2019-5736    | https://security-tracker.debian.org/tracker/CVE-2019-5736   
                        docker | CVE-2020-27534   | https://security-tracker.debian.org/tracker/CVE-2020-27534  
                        docker | CVE-2021-21284   | https://security-tracker.debian.org/tracker/CVE-2021-21284  
                        docker | CVE-2021-21285   | https://security-tracker.debian.org/tracker/CVE-2021-21285  
                        docker | CVE-2021-3162    | https://security-tracker.debian.org/tracker/CVE-2021-3162   
                        docker | CVE-2021-33183   | https://security-tracker.debian.org/tracker/CVE-2021-33183  
                        docker | CVE-2022-25365   | https://security-tracker.debian.org/tracker/CVE-2022-25365  
                        dracut | CVE-2010-4176    | https://security-tracker.debian.org/tracker/CVE-2010-4176   
                          edk2 | CVE-2014-4859    | https://security-tracker.debian.org/tracker/CVE-2014-4859   
                          edk2 | CVE-2014-4860    | https://security-tracker.debian.org/tracker/CVE-2014-4860   
                          edk2 | CVE-2014-8271    | https://security-tracker.debian.org/tracker/CVE-2014-8271   
                          edk2 | CVE-2019-14553   | https://security-tracker.debian.org/tracker/CVE-2019-14553  
                          edk2 | CVE-2019-14559   | https://security-tracker.debian.org/tracker/CVE-2019-14559  
                          edk2 | CVE-2019-14562   | https://security-tracker.debian.org/tracker/CVE-2019-14562  
                          edk2 | CVE-2019-14563   | https://security-tracker.debian.org/tracker/CVE-2019-14563  
                          edk2 | CVE-2019-14575   | https://security-tracker.debian.org/tracker/CVE-2019-14575  
                          edk2 | CVE-2019-14586   | https://security-tracker.debian.org/tracker/CVE-2019-14586  
                          edk2 | CVE-2019-14587   | https://security-tracker.debian.org/tracker/CVE-2019-14587  
                         emlog | CVE-2021-44584   | https://security-tracker.debian.org/tracker/CVE-2021-44584  
                         emlog | CVE-2022-1526    | https://security-tracker.debian.org/tracker/CVE-2022-1526   
                         emlog | CVE-2022-3968    | https://security-tracker.debian.org/tracker/CVE-2022-3968   
                        erlang | CVE-2020-35733   | https://security-tracker.debian.org/tracker/CVE-2020-35733  
                        erlang | CVE-2022-37026   | https://security-tracker.debian.org/tracker/CVE-2022-37026  
                         exfat | CVE-2022-29973   | https://security-tracker.debian.org/tracker/CVE-2022-29973  
                         exiv2 | CVE-2007-6353    | https://security-tracker.debian.org/tracker/CVE-2007-6353   
                        ffmpeg | CVE-2021-38291   | https://security-tracker.debian.org/tracker/CVE-2021-38291  
                        ffmpeg | CVE-2022-3964    | https://security-tracker.debian.org/tracker/CVE-2022-3964   
                        ffmpeg | CVE-2022-3965    | https://security-tracker.debian.org/tracker/CVE-2022-3965   
             freeradius-server | CVE-2002-0318    | https://security-tracker.debian.org/tracker/CVE-2002-0318   
             freeradius-server | CVE-2011-4966    | https://security-tracker.debian.org/tracker/CVE-2011-4966   
                        giflib | CVE-2022-28506   | https://security-tracker.debian.org/tracker/CVE-2022-28506  
                           git | CVE-2022-24765   | https://security-tracker.debian.org/tracker/CVE-2022-24765  
                           git | CVE-2022-24975   | https://security-tracker.debian.org/tracker/CVE-2022-24975  
                         glibc | CVE-2010-4756    | https://security-tracker.debian.org/tracker/CVE-2010-4756   
                         glibc | CVE-2019-1010022 | https://security-tracker.debian.org/tracker/CVE-2019-1010022
                         glibc | CVE-2019-1010023 | https://security-tracker.debian.org/tracker/CVE-2019-1010023
                         glibc | CVE-2019-1010024 | https://security-tracker.debian.org/tracker/CVE-2019-1010024
                         glibc | CVE-2019-1010025 | https://security-tracker.debian.org/tracker/CVE-2019-1010025
                         gnupg | CVE-2006-3082    | https://security-tracker.debian.org/tracker/CVE-2006-3082   
                         gnupg | CVE-2011-2207    | https://security-tracker.debian.org/tracker/CVE-2011-2207   
                         gnupg | CVE-2015-1606    | https://security-tracker.debian.org/tracker/CVE-2015-1606   
                         gnupg | CVE-2018-12020   | https://security-tracker.debian.org/tracker/CVE-2018-12020  
                         gnupg | CVE-2019-13050   | https://security-tracker.debian.org/tracker/CVE-2019-13050  
                         gnupg | CVE-2019-14855   | https://security-tracker.debian.org/tracker/CVE-2019-14855  
                         gnupg | CVE-2022-34903   | https://security-tracker.debian.org/tracker/CVE-2022-34903  
                            go | CVE-2020-29509   | https://security-tracker.debian.org/tracker/CVE-2020-29509  
                            go | CVE-2020-29511   | https://security-tracker.debian.org/tracker/CVE-2020-29511  
                graphicsmagick | CVE-2007-0770    | https://security-tracker.debian.org/tracker/CVE-2007-0770   
                graphicsmagick | CVE-2008-6621    | https://security-tracker.debian.org/tracker/CVE-2008-6621   
                     graphite2 | CVE-2017-5436    | https://security-tracker.debian.org/tracker/CVE-2017-5436   
                       haproxy | CVE-2016-2102    | https://security-tracker.debian.org/tracker/CVE-2016-2102   
                heirloom-mailx | CVE-2004-2771    | https://security-tracker.debian.org/tracker/CVE-2004-2771   
                   imagemagick | CVE-2007-1667    | https://security-tracker.debian.org/tracker/CVE-2007-1667   
                   imagemagick | CVE-2014-9804    | https://security-tracker.debian.org/tracker/CVE-2014-9804   
                   imagemagick | CVE-2014-9805    | https://security-tracker.debian.org/tracker/CVE-2014-9805   
                   imagemagick | CVE-2014-9806    | https://security-tracker.debian.org/tracker/CVE-2014-9806   
                   imagemagick | CVE-2014-9807    | https://security-tracker.debian.org/tracker/CVE-2014-9807   
                   imagemagick | CVE-2014-9808    | https://security-tracker.debian.org/tracker/CVE-2014-9808   
                   imagemagick | CVE-2014-9809    | https://security-tracker.debian.org/tracker/CVE-2014-9809   
                   imagemagick | CVE-2014-9810    | https://security-tracker.debian.org/tracker/CVE-2014-9810   
                   imagemagick | CVE-2014-9811    | https://security-tracker.debian.org/tracker/CVE-2014-9811   
                   imagemagick | CVE-2014-9812    | https://security-tracker.debian.org/tracker/CVE-2014-9812   
                   imagemagick | CVE-2014-9813    | https://security-tracker.debian.org/tracker/CVE-2014-9813   
                   imagemagick | CVE-2014-9814    | https://security-tracker.debian.org/tracker/CVE-2014-9814   
                   imagemagick | CVE-2014-9815    | https://security-tracker.debian.org/tracker/CVE-2014-9815   
                   imagemagick | CVE-2014-9816    | https://security-tracker.debian.org/tracker/CVE-2014-9816   
                   imagemagick | CVE-2014-9817    | https://security-tracker.debian.org/tracker/CVE-2014-9817   
                   imagemagick | CVE-2014-9818    | https://security-tracker.debian.org/tracker/CVE-2014-9818   
                   imagemagick | CVE-2014-9819    | https://security-tracker.debian.org/tracker/CVE-2014-9819   
                   imagemagick | CVE-2014-9820    | https://security-tracker.debian.org/tracker/CVE-2014-9820   
                   imagemagick | CVE-2014-9821    | https://security-tracker.debian.org/tracker/CVE-2014-9821   
                   imagemagick | CVE-2014-9822    | https://security-tracker.debian.org/tracker/CVE-2014-9822   
                   imagemagick | CVE-2014-9823    | https://security-tracker.debian.org/tracker/CVE-2014-9823   
                   imagemagick | CVE-2014-9824    | https://security-tracker.debian.org/tracker/CVE-2014-9824   
                   imagemagick | CVE-2014-9825    | https://security-tracker.debian.org/tracker/CVE-2014-9825   
                   imagemagick | CVE-2014-9826    | https://security-tracker.debian.org/tracker/CVE-2014-9826   
                   imagemagick | CVE-2014-9827    | https://security-tracker.debian.org/tracker/CVE-2014-9827   
                   imagemagick | CVE-2014-9828    | https://security-tracker.debian.org/tracker/CVE-2014-9828   
                   imagemagick | CVE-2014-9829    | https://security-tracker.debian.org/tracker/CVE-2014-9829   
                   imagemagick | CVE-2014-9830    | https://security-tracker.debian.org/tracker/CVE-2014-9830   
                   imagemagick | CVE-2014-9831    | https://security-tracker.debian.org/tracker/CVE-2014-9831   
                   imagemagick | CVE-2014-9848    | https://security-tracker.debian.org/tracker/CVE-2014-9848   
                   imagemagick | CVE-2014-9852    | https://security-tracker.debian.org/tracker/CVE-2014-9852   
                   imagemagick | CVE-2014-9853    | https://security-tracker.debian.org/tracker/CVE-2014-9853   
                   imagemagick | CVE-2014-9854    | https://security-tracker.debian.org/tracker/CVE-2014-9854   
                   imagemagick | CVE-2014-9907    | https://security-tracker.debian.org/tracker/CVE-2014-9907   
                   imagemagick | CVE-2016-10062   | https://security-tracker.debian.org/tracker/CVE-2016-10062  
                   imagemagick | CVE-2016-10144   | https://security-tracker.debian.org/tracker/CVE-2016-10144  
                   imagemagick | CVE-2016-10145   | https://security-tracker.debian.org/tracker/CVE-2016-10145  
                   imagemagick | CVE-2016-10146   | https://security-tracker.debian.org/tracker/CVE-2016-10146  
                   imagemagick | CVE-2016-7513    | https://security-tracker.debian.org/tracker/CVE-2016-7513   
                   imagemagick | CVE-2016-7514    | https://security-tracker.debian.org/tracker/CVE-2016-7514   
                   imagemagick | CVE-2016-7515    | https://security-tracker.debian.org/tracker/CVE-2016-7515   
                   imagemagick | CVE-2016-7516    | https://security-tracker.debian.org/tracker/CVE-2016-7516   
                   imagemagick | CVE-2016-7517    | https://security-tracker.debian.org/tracker/CVE-2016-7517   
                   imagemagick | CVE-2016-7518    | https://security-tracker.debian.org/tracker/CVE-2016-7518   
                   imagemagick | CVE-2016-7519    | https://security-tracker.debian.org/tracker/CVE-2016-7519   
                   imagemagick | CVE-2016-7520    | https://security-tracker.debian.org/tracker/CVE-2016-7520   
                   imagemagick | CVE-2016-7521    | https://security-tracker.debian.org/tracker/CVE-2016-7521   
                   imagemagick | CVE-2016-7522    | https://security-tracker.debian.org/tracker/CVE-2016-7522   
                   imagemagick | CVE-2016-7523    | https://security-tracker.debian.org/tracker/CVE-2016-7523   
                   imagemagick | CVE-2016-7524    | https://security-tracker.debian.org/tracker/CVE-2016-7524   
                   imagemagick | CVE-2016-7525    | https://security-tracker.debian.org/tracker/CVE-2016-7525   
                   imagemagick | CVE-2016-7526    | https://security-tracker.debian.org/tracker/CVE-2016-7526   
                   imagemagick | CVE-2016-7527    | https://security-tracker.debian.org/tracker/CVE-2016-7527   
                   imagemagick | CVE-2016-7528    | https://security-tracker.debian.org/tracker/CVE-2016-7528   
                   imagemagick | CVE-2016-7529    | https://security-tracker.debian.org/tracker/CVE-2016-7529   
                   imagemagick | CVE-2016-7530    | https://security-tracker.debian.org/tracker/CVE-2016-7530   
                   imagemagick | CVE-2016-7531    | https://security-tracker.debian.org/tracker/CVE-2016-7531   
                   imagemagick | CVE-2016-7532    | https://security-tracker.debian.org/tracker/CVE-2016-7532   
                   imagemagick | CVE-2016-7533    | https://security-tracker.debian.org/tracker/CVE-2016-7533   
                   imagemagick | CVE-2016-7534    | https://security-tracker.debian.org/tracker/CVE-2016-7534   
                   imagemagick | CVE-2016-7535    | https://security-tracker.debian.org/tracker/CVE-2016-7535   
                   imagemagick | CVE-2016-7536    | https://security-tracker.debian.org/tracker/CVE-2016-7536   
                   imagemagick | CVE-2016-7537    | https://security-tracker.debian.org/tracker/CVE-2016-7537   
                   imagemagick | CVE-2016-7538    | https://security-tracker.debian.org/tracker/CVE-2016-7538   
                   imagemagick | CVE-2017-5506    | https://security-tracker.debian.org/tracker/CVE-2017-5506   
                   imagemagick | CVE-2017-5509    | https://security-tracker.debian.org/tracker/CVE-2017-5509   
                   imagemagick | CVE-2017-5510    | https://security-tracker.debian.org/tracker/CVE-2017-5510   
                   imagemagick | CVE-2017-5511    | https://security-tracker.debian.org/tracker/CVE-2017-5511   
                        jasper | CVE-2015-8751    | https://security-tracker.debian.org/tracker/CVE-2015-8751   
                         jhead | CVE-2022-41751   | https://security-tracker.debian.org/tracker/CVE-2022-41751  
                        jquery | CVE-2007-2379    | https://security-tracker.debian.org/tracker/CVE-2007-2379   
                         libao | CVE-2017-11548   | https://security-tracker.debian.org/tracker/CVE-2017-11548  
                  libfreeimage | CVE-2019-12211   | https://security-tracker.debian.org/tracker/CVE-2019-12211  
                  libfreeimage | CVE-2019-12212   | https://security-tracker.debian.org/tracker/CVE-2019-12212  
                  libfreeimage | CVE-2019-12213   | https://security-tracker.debian.org/tracker/CVE-2019-12213  
                  libfreeimage | CVE-2019-12214   | https://security-tracker.debian.org/tracker/CVE-2019-12214  
                     libiberty | CVE-2012-3509    | https://security-tracker.debian.org/tracker/CVE-2012-3509   
                     libiberty | CVE-2016-2226    | https://security-tracker.debian.org/tracker/CVE-2016-2226   
                     libiberty | CVE-2016-4487    | https://security-tracker.debian.org/tracker/CVE-2016-4487   
                     libiberty | CVE-2016-4488    | https://security-tracker.debian.org/tracker/CVE-2016-4488   
                     libiberty | CVE-2016-4489    | https://security-tracker.debian.org/tracker/CVE-2016-4489   
                     libiberty | CVE-2016-4490    | https://security-tracker.debian.org/tracker/CVE-2016-4490   
                     libiberty | CVE-2016-4491    | https://security-tracker.debian.org/tracker/CVE-2016-4491   
                     libiberty | CVE-2016-4492    | https://security-tracker.debian.org/tracker/CVE-2016-4492   
                     libiberty | CVE-2016-4493    | https://security-tracker.debian.org/tracker/CVE-2016-4493   
                     libiberty | CVE-2016-6131    | https://security-tracker.debian.org/tracker/CVE-2016-6131   
                       libkrb5 | CVE-1999-0143    | https://security-tracker.debian.org/tracker/CVE-1999-0143   
                       libkrb5 | CVE-1999-0713    | https://security-tracker.debian.org/tracker/CVE-1999-0713   
                       libkrb5 | CVE-2007-3149    | https://security-tracker.debian.org/tracker/CVE-2007-3149   
                       libkrb5 | CVE-2007-5894    | https://security-tracker.debian.org/tracker/CVE-2007-5894   
                       libkrb5 | CVE-2007-5902    | https://security-tracker.debian.org/tracker/CVE-2007-5902   
                       libkrb5 | CVE-2009-0844    | https://security-tracker.debian.org/tracker/CVE-2009-0844   
                       libkrb5 | CVE-2009-0846    | https://security-tracker.debian.org/tracker/CVE-2009-0846   
                        libmad | CVE-2018-7263    | https://security-tracker.debian.org/tracker/CVE-2018-7263   
                      libmpeg2 | CVE-2022-37416   | https://security-tracker.debian.org/tracker/CVE-2022-37416  
                      libplist | CVE-2017-5834    | https://security-tracker.debian.org/tracker/CVE-2017-5834   
                      libplist | CVE-2017-5835    | https://security-tracker.debian.org/tracker/CVE-2017-5835   
                      libplist | CVE-2017-5836    | https://security-tracker.debian.org/tracker/CVE-2017-5836   
                        libraw | CVE-2020-35530   | https://security-tracker.debian.org/tracker/CVE-2020-35530  
                        libraw | CVE-2020-35531   | https://security-tracker.debian.org/tracker/CVE-2020-35531  
                        libraw | CVE-2020-35532   | https://security-tracker.debian.org/tracker/CVE-2020-35532  
                        libraw | CVE-2020-35533   | https://security-tracker.debian.org/tracker/CVE-2020-35533  
                        libraw | CVE-2020-35534   | https://security-tracker.debian.org/tracker/CVE-2020-35534  
                        libraw | CVE-2020-35535   | https://security-tracker.debian.org/tracker/CVE-2020-35535  
                    libtorrent | CVE-2009-1760    | https://security-tracker.debian.org/tracker/CVE-2009-1760   
                    libtorrent | CVE-2016-5301    | https://security-tracker.debian.org/tracker/CVE-2016-5301   
                       libvirt | CVE-2014-8135    | https://security-tracker.debian.org/tracker/CVE-2014-8135   
                       libvirt | CVE-2014-8136    | https://security-tracker.debian.org/tracker/CVE-2014-8136   
                       libvirt | CVE-2015-5313    | https://security-tracker.debian.org/tracker/CVE-2015-5313   
                       libvirt | CVE-2018-5748    | https://security-tracker.debian.org/tracker/CVE-2018-5748   
                       libvirt | CVE-2018-6764    | https://security-tracker.debian.org/tracker/CVE-2018-6764   
                     linux-pam | CVE-2022-28321   | https://security-tracker.debian.org/tracker/CVE-2022-28321  
                         lrzip | CVE-2022-33067   | https://security-tracker.debian.org/tracker/CVE-2022-33067  
                         lrzsz | CVE-2018-10195   | https://security-tracker.debian.org/tracker/CVE-2018-10195  
                           lua | CVE-2014-5461    | https://security-tracker.debian.org/tracker/CVE-2014-5461   
                           lua | CVE-2020-15888   | https://security-tracker.debian.org/tracker/CVE-2020-15888  
                           lua | CVE-2020-15945   | https://security-tracker.debian.org/tracker/CVE-2020-15945  
                           lua | CVE-2021-43519   | https://security-tracker.debian.org/tracker/CVE-2021-43519  
                       mbedtls | CVE-2021-45450   | https://security-tracker.debian.org/tracker/CVE-2021-45450  
                       mbedtls | CVE-2021-45451   | https://security-tracker.debian.org/tracker/CVE-2021-45451  
                      minetest | CVE-2022-35978   | https://security-tracker.debian.org/tracker/CVE-2022-35978  
                       mongodb | CVE-2014-8180    | https://security-tracker.debian.org/tracker/CVE-2014-8180   
                       mongodb | CVE-2017-18381   | https://security-tracker.debian.org/tracker/CVE-2017-18381  
                       mongodb | CVE-2017-2665    | https://security-tracker.debian.org/tracker/CVE-2017-2665   
                          mutt | CVE-2011-1429    | https://security-tracker.debian.org/tracker/CVE-2011-1429   
                          nasm | CVE-2020-18974   | https://security-tracker.debian.org/tracker/CVE-2020-18974  
                       ncurses | CVE-2021-39537   | https://security-tracker.debian.org/tracker/CVE-2021-39537  
                       ncurses | CVE-2022-29458   | https://security-tracker.debian.org/tracker/CVE-2022-29458  
                      netatalk | CVE-2022-45188   | https://security-tracker.debian.org/tracker/CVE-2022-45188  
                       netsnmp | CVE-2022-44792   | https://security-tracker.debian.org/tracker/CVE-2022-44792  
                       netsnmp | CVE-2022-44793   | https://security-tracker.debian.org/tracker/CVE-2022-44793  
                         nginx | CVE-2021-3618    | https://security-tracker.debian.org/tracker/CVE-2021-3618   
                           ntp | CVE-2014-9750    | https://security-tracker.debian.org/tracker/CVE-2014-9750   
                           ntp | CVE-2014-9751    | https://security-tracker.debian.org/tracker/CVE-2014-9751   
                           ntp | CVE-2015-7691    | https://security-tracker.debian.org/tracker/CVE-2015-7691   
                           ntp | CVE-2015-7692    | https://security-tracker.debian.org/tracker/CVE-2015-7692   
                           ntp | CVE-2015-7701    | https://security-tracker.debian.org/tracker/CVE-2015-7701   
                           ntp | CVE-2015-7702    | https://security-tracker.debian.org/tracker/CVE-2015-7702   
                           ntp | CVE-2015-7703    | https://security-tracker.debian.org/tracker/CVE-2015-7703   
                           ntp | CVE-2015-7704    | https://security-tracker.debian.org/tracker/CVE-2015-7704   
                           ntp | CVE-2015-7705    | https://security-tracker.debian.org/tracker/CVE-2015-7705   
                           ntp | CVE-2015-7849    | https://security-tracker.debian.org/tracker/CVE-2015-7849   
                           ntp | CVE-2015-7850    | https://security-tracker.debian.org/tracker/CVE-2015-7850   
                           ntp | CVE-2015-7852    | https://security-tracker.debian.org/tracker/CVE-2015-7852   
                           ntp | CVE-2015-7853    | https://security-tracker.debian.org/tracker/CVE-2015-7853   
                           ntp | CVE-2015-7854    | https://security-tracker.debian.org/tracker/CVE-2015-7854   
                           ntp | CVE-2015-7855    | https://security-tracker.debian.org/tracker/CVE-2015-7855   
                           ntp | CVE-2015-7973    | https://security-tracker.debian.org/tracker/CVE-2015-7973   
                           ntp | CVE-2015-7974    | https://security-tracker.debian.org/tracker/CVE-2015-7974   
                           ntp | CVE-2015-7977    | https://security-tracker.debian.org/tracker/CVE-2015-7977   
                           ntp | CVE-2016-2518    | https://security-tracker.debian.org/tracker/CVE-2016-2518   
                           ntp | CVE-2016-4953    | https://security-tracker.debian.org/tracker/CVE-2016-4953   
                           ntp | CVE-2016-4954    | https://security-tracker.debian.org/tracker/CVE-2016-4954   
                           ntp | CVE-2016-4955    | https://security-tracker.debian.org/tracker/CVE-2016-4955   
                           ntp | CVE-2016-4956    | https://security-tracker.debian.org/tracker/CVE-2016-4956   
                           ntp | CVE-2016-7426    | https://security-tracker.debian.org/tracker/CVE-2016-7426   
                           ntp | CVE-2016-7434    | https://security-tracker.debian.org/tracker/CVE-2016-7434   
                           ntp | CVE-2017-6458    | https://security-tracker.debian.org/tracker/CVE-2017-6458   
                           ntp | CVE-2018-7170    | https://security-tracker.debian.org/tracker/CVE-2018-7170   
                           ntp | CVE-2018-7185    | https://security-tracker.debian.org/tracker/CVE-2018-7185   
                           ntp | CVE-2019-11331   | https://security-tracker.debian.org/tracker/CVE-2019-11331  
                           ntp | CVE-2019-8936    | https://security-tracker.debian.org/tracker/CVE-2019-8936   
                           ntp | CVE-2020-11868   | https://security-tracker.debian.org/tracker/CVE-2020-11868  
                           ntp | CVE-2020-13817   | https://security-tracker.debian.org/tracker/CVE-2020-13817  
                       opencv3 | CVE-2019-14493   | https://security-tracker.debian.org/tracker/CVE-2019-14493  
                       opencv3 | CVE-2019-15939   | https://security-tracker.debian.org/tracker/CVE-2019-15939  
                       opencv3 | CVE-2019-19624   | https://security-tracker.debian.org/tracker/CVE-2019-19624  
                       openjdk | CVE-2009-2475    | https://security-tracker.debian.org/tracker/CVE-2009-2475   
                       openjdk | CVE-2009-2476    | https://security-tracker.debian.org/tracker/CVE-2009-2476   
                       openjdk | CVE-2009-2689    | https://security-tracker.debian.org/tracker/CVE-2009-2689   
                       openjdk | CVE-2009-2690    | https://security-tracker.debian.org/tracker/CVE-2009-2690   
                       openjdk | CVE-2009-3728    | https://security-tracker.debian.org/tracker/CVE-2009-3728   
                       openjdk | CVE-2009-3879    | https://security-tracker.debian.org/tracker/CVE-2009-3879   
                       openjdk | CVE-2009-3880    | https://security-tracker.debian.org/tracker/CVE-2009-3880   
                       openjdk | CVE-2009-3881    | https://security-tracker.debian.org/tracker/CVE-2009-3881   
                       openjdk | CVE-2009-3882    | https://security-tracker.debian.org/tracker/CVE-2009-3882   
                       openjdk | CVE-2009-3883    | https://security-tracker.debian.org/tracker/CVE-2009-3883   
                       openjdk | CVE-2009-3884    | https://security-tracker.debian.org/tracker/CVE-2009-3884   
                       openjdk | CVE-2013-0169    | https://security-tracker.debian.org/tracker/CVE-2013-0169   
                       openjdk | CVE-2022-21540   | https://security-tracker.debian.org/tracker/CVE-2022-21540  
                       openjdk | CVE-2022-21541   | https://security-tracker.debian.org/tracker/CVE-2022-21541  
                       openjdk | CVE-2022-34169   | https://security-tracker.debian.org/tracker/CVE-2022-34169  
                      openjpeg | CVE-2015-1239    | https://security-tracker.debian.org/tracker/CVE-2015-1239   
                      openjpeg | CVE-2016-9675    | https://security-tracker.debian.org/tracker/CVE-2016-9675   
                      openldap | CVE-2015-3276    | https://security-tracker.debian.org/tracker/CVE-2015-3276   
                      openldap | CVE-2022-29155   | https://security-tracker.debian.org/tracker/CVE-2022-29155  
                       openssh | CVE-2007-2768    | https://security-tracker.debian.org/tracker/CVE-2007-2768   
                       openssh | CVE-2008-3844    | https://security-tracker.debian.org/tracker/CVE-2008-3844   
                       openssh | CVE-2014-9278    | https://security-tracker.debian.org/tracker/CVE-2014-9278   
                      openswan | CVE-2019-10155   | https://security-tracker.debian.org/tracker/CVE-2019-10155  
                   openvmtools | CVE-2014-4199    | https://security-tracker.debian.org/tracker/CVE-2014-4199   
                   openvmtools | CVE-2014-4200    | https://security-tracker.debian.org/tracker/CVE-2014-4200   
                   openvmtools | CVE-2021-31693   | https://security-tracker.debian.org/tracker/CVE-2021-31693  
                   openvmtools | CVE-2022-22943   | https://security-tracker.debian.org/tracker/CVE-2022-22943  
                          opus | CVE-2022-25345   | https://security-tracker.debian.org/tracker/CVE-2022-25345  
                  oracle-mysql | CVE-2012-0583    | https://security-tracker.debian.org/tracker/CVE-2012-0583   
                  oracle-mysql | CVE-2012-1696    | https://security-tracker.debian.org/tracker/CVE-2012-1696   
                  oracle-mysql | CVE-2012-3144    | https://security-tracker.debian.org/tracker/CVE-2012-3144   
                  oracle-mysql | CVE-2012-3147    | https://security-tracker.debian.org/tracker/CVE-2012-3147   
                  oracle-mysql | CVE-2012-3149    | https://security-tracker.debian.org/tracker/CVE-2012-3149   
                  oracle-mysql | CVE-2012-3156    | https://security-tracker.debian.org/tracker/CVE-2012-3156   
                  oracle-mysql | CVE-2012-4414    | https://security-tracker.debian.org/tracker/CVE-2012-4414   
                  oracle-mysql | CVE-2013-1566    | https://security-tracker.debian.org/tracker/CVE-2013-1566   
                  oracle-mysql | CVE-2013-1567    | https://security-tracker.debian.org/tracker/CVE-2013-1567   
                  oracle-mysql | CVE-2013-1570    | https://security-tracker.debian.org/tracker/CVE-2013-1570   
                  oracle-mysql | CVE-2013-2381    | https://security-tracker.debian.org/tracker/CVE-2013-2381   
                  oracle-mysql | CVE-2013-2395    | https://security-tracker.debian.org/tracker/CVE-2013-2395   
                  oracle-mysql | CVE-2013-3795    | https://security-tracker.debian.org/tracker/CVE-2013-3795   
                  oracle-mysql | CVE-2013-3796    | https://security-tracker.debian.org/tracker/CVE-2013-3796   
                  oracle-mysql | CVE-2013-3798    | https://security-tracker.debian.org/tracker/CVE-2013-3798   
                  oracle-mysql | CVE-2013-3806    | https://security-tracker.debian.org/tracker/CVE-2013-3806   
                  oracle-mysql | CVE-2013-3807    | https://security-tracker.debian.org/tracker/CVE-2013-3807   
                  oracle-mysql | CVE-2013-3810    | https://security-tracker.debian.org/tracker/CVE-2013-3810   
                  oracle-mysql | CVE-2013-3811    | https://security-tracker.debian.org/tracker/CVE-2013-3811   
                  oracle-mysql | CVE-2013-5767    | https://security-tracker.debian.org/tracker/CVE-2013-5767   
                  oracle-mysql | CVE-2013-5770    | https://security-tracker.debian.org/tracker/CVE-2013-5770   
                  oracle-mysql | CVE-2013-5786    | https://security-tracker.debian.org/tracker/CVE-2013-5786   
                  oracle-mysql | CVE-2013-5793    | https://security-tracker.debian.org/tracker/CVE-2013-5793   
                  oracle-mysql | CVE-2013-5860    | https://security-tracker.debian.org/tracker/CVE-2013-5860   
                  oracle-mysql | CVE-2013-5881    | https://security-tracker.debian.org/tracker/CVE-2013-5881   
                  oracle-mysql | CVE-2013-5882    | https://security-tracker.debian.org/tracker/CVE-2013-5882   
                  oracle-mysql | CVE-2013-5894    | https://security-tracker.debian.org/tracker/CVE-2013-5894   
                  oracle-mysql | CVE-2014-0427    | https://security-tracker.debian.org/tracker/CVE-2014-0427   
                  oracle-mysql | CVE-2014-0430    | https://security-tracker.debian.org/tracker/CVE-2014-0430   
                  oracle-mysql | CVE-2014-0431    | https://security-tracker.debian.org/tracker/CVE-2014-0431   
                  oracle-mysql | CVE-2014-0433    | https://security-tracker.debian.org/tracker/CVE-2014-0433   
                  oracle-mysql | CVE-2014-2434    | https://security-tracker.debian.org/tracker/CVE-2014-2434   
                  oracle-mysql | CVE-2014-2435    | https://security-tracker.debian.org/tracker/CVE-2014-2435   
                  oracle-mysql | CVE-2014-2442    | https://security-tracker.debian.org/tracker/CVE-2014-2442   
                  oracle-mysql | CVE-2014-2444    | https://security-tracker.debian.org/tracker/CVE-2014-2444   
                  oracle-mysql | CVE-2014-2450    | https://security-tracker.debian.org/tracker/CVE-2014-2450   
                  oracle-mysql | CVE-2014-2451    | https://security-tracker.debian.org/tracker/CVE-2014-2451   
                  oracle-mysql | CVE-2014-2484    | https://security-tracker.debian.org/tracker/CVE-2014-2484   
                  oracle-mysql | CVE-2014-4214    | https://security-tracker.debian.org/tracker/CVE-2014-4214   
                  oracle-mysql | CVE-2014-4233    | https://security-tracker.debian.org/tracker/CVE-2014-4233   
                  oracle-mysql | CVE-2014-4238    | https://security-tracker.debian.org/tracker/CVE-2014-4238   
                  oracle-mysql | CVE-2014-4240    | https://security-tracker.debian.org/tracker/CVE-2014-4240   
                  oracle-mysql | CVE-2015-0385    | https://security-tracker.debian.org/tracker/CVE-2015-0385   
                  oracle-mysql | CVE-2015-0405    | https://security-tracker.debian.org/tracker/CVE-2015-0405   
                  oracle-mysql | CVE-2015-0409    | https://security-tracker.debian.org/tracker/CVE-2015-0409   
                  oracle-mysql | CVE-2015-0423    | https://security-tracker.debian.org/tracker/CVE-2015-0423   
                  oracle-mysql | CVE-2015-0438    | https://security-tracker.debian.org/tracker/CVE-2015-0438   
                  oracle-mysql | CVE-2015-0439    | https://security-tracker.debian.org/tracker/CVE-2015-0439   
                  oracle-mysql | CVE-2015-0498    | https://security-tracker.debian.org/tracker/CVE-2015-0498   
                  oracle-mysql | CVE-2015-0500    | https://security-tracker.debian.org/tracker/CVE-2015-0500   
                  oracle-mysql | CVE-2015-0503    | https://security-tracker.debian.org/tracker/CVE-2015-0503   
                  oracle-mysql | CVE-2015-0506    | https://security-tracker.debian.org/tracker/CVE-2015-0506   
                  oracle-mysql | CVE-2015-0507    | https://security-tracker.debian.org/tracker/CVE-2015-0507   
                  oracle-mysql | CVE-2015-0508    | https://security-tracker.debian.org/tracker/CVE-2015-0508   
                  oracle-mysql | CVE-2015-0511    | https://security-tracker.debian.org/tracker/CVE-2015-0511   
                  oracle-mysql | CVE-2015-2566    | https://security-tracker.debian.org/tracker/CVE-2015-2566   
                  oracle-mysql | CVE-2015-2567    | https://security-tracker.debian.org/tracker/CVE-2015-2567   
                  oracle-mysql | CVE-2015-2611    | https://security-tracker.debian.org/tracker/CVE-2015-2611   
                  oracle-mysql | CVE-2015-2617    | https://security-tracker.debian.org/tracker/CVE-2015-2617   
                  oracle-mysql | CVE-2015-2639    | https://security-tracker.debian.org/tracker/CVE-2015-2639   
                  oracle-mysql | CVE-2015-2641    | https://security-tracker.debian.org/tracker/CVE-2015-2641   
                  oracle-mysql | CVE-2015-2661    | https://security-tracker.debian.org/tracker/CVE-2015-2661   
                  oracle-mysql | CVE-2015-3152    | https://security-tracker.debian.org/tracker/CVE-2015-3152   
                  oracle-mysql | CVE-2015-4730    | https://security-tracker.debian.org/tracker/CVE-2015-4730   
                  oracle-mysql | CVE-2015-4756    | https://security-tracker.debian.org/tracker/CVE-2015-4756   
                  oracle-mysql | CVE-2015-4761    | https://security-tracker.debian.org/tracker/CVE-2015-4761   
                  oracle-mysql | CVE-2015-4766    | https://security-tracker.debian.org/tracker/CVE-2015-4766   
                  oracle-mysql | CVE-2015-4767    | https://security-tracker.debian.org/tracker/CVE-2015-4767   
                  oracle-mysql | CVE-2015-4769    | https://security-tracker.debian.org/tracker/CVE-2015-4769   
                  oracle-mysql | CVE-2015-4771    | https://security-tracker.debian.org/tracker/CVE-2015-4771   
                  oracle-mysql | CVE-2015-4772    | https://security-tracker.debian.org/tracker/CVE-2015-4772   
                  oracle-mysql | CVE-2015-4791    | https://security-tracker.debian.org/tracker/CVE-2015-4791   
                  oracle-mysql | CVE-2015-4800    | https://security-tracker.debian.org/tracker/CVE-2015-4800   
                  oracle-mysql | CVE-2015-4833    | https://security-tracker.debian.org/tracker/CVE-2015-4833   
                  oracle-mysql | CVE-2015-4862    | https://security-tracker.debian.org/tracker/CVE-2015-4862   
                  oracle-mysql | CVE-2015-4890    | https://security-tracker.debian.org/tracker/CVE-2015-4890   
                  oracle-mysql | CVE-2015-4904    | https://security-tracker.debian.org/tracker/CVE-2015-4904   
                  oracle-mysql | CVE-2015-4905    | https://security-tracker.debian.org/tracker/CVE-2015-4905   
                  oracle-mysql | CVE-2015-4910    | https://security-tracker.debian.org/tracker/CVE-2015-4910   
                  oracle-mysql | CVE-2016-0503    | https://security-tracker.debian.org/tracker/CVE-2016-0503   
                  oracle-mysql | CVE-2016-0504    | https://security-tracker.debian.org/tracker/CVE-2016-0504   
                  oracle-mysql | CVE-2016-0594    | https://security-tracker.debian.org/tracker/CVE-2016-0594   
                  oracle-mysql | CVE-2016-0595    | https://security-tracker.debian.org/tracker/CVE-2016-0595   
                  oracle-mysql | CVE-2016-0607    | https://security-tracker.debian.org/tracker/CVE-2016-0607   
                  oracle-mysql | CVE-2016-0610    | https://security-tracker.debian.org/tracker/CVE-2016-0610   
                  oracle-mysql | CVE-2016-0611    | https://security-tracker.debian.org/tracker/CVE-2016-0611   
                  oracle-mysql | CVE-2016-0616    | https://security-tracker.debian.org/tracker/CVE-2016-0616   
                  oracle-mysql | CVE-2016-0652    | https://security-tracker.debian.org/tracker/CVE-2016-0652   
                  oracle-mysql | CVE-2016-0653    | https://security-tracker.debian.org/tracker/CVE-2016-0653   
                  oracle-mysql | CVE-2016-0654    | https://security-tracker.debian.org/tracker/CVE-2016-0654   
                  oracle-mysql | CVE-2016-0656    | https://security-tracker.debian.org/tracker/CVE-2016-0656   
                  oracle-mysql | CVE-2016-0657    | https://security-tracker.debian.org/tracker/CVE-2016-0657   
                  oracle-mysql | CVE-2016-0658    | https://security-tracker.debian.org/tracker/CVE-2016-0658   
                  oracle-mysql | CVE-2016-0659    | https://security-tracker.debian.org/tracker/CVE-2016-0659   
                  oracle-mysql | CVE-2016-0662    | https://security-tracker.debian.org/tracker/CVE-2016-0662   
                  oracle-mysql | CVE-2016-0663    | https://security-tracker.debian.org/tracker/CVE-2016-0663   
                  oracle-mysql | CVE-2016-0667    | https://security-tracker.debian.org/tracker/CVE-2016-0667   
                  oracle-mysql | CVE-2016-3424    | https://security-tracker.debian.org/tracker/CVE-2016-3424   
                  oracle-mysql | CVE-2016-3440    | https://security-tracker.debian.org/tracker/CVE-2016-3440   
                  oracle-mysql | CVE-2016-3518    | https://security-tracker.debian.org/tracker/CVE-2016-3518   
                  oracle-mysql | CVE-2016-3588    | https://security-tracker.debian.org/tracker/CVE-2016-3588   
                  oracle-mysql | CVE-2016-5436    | https://security-tracker.debian.org/tracker/CVE-2016-5436   
                  oracle-mysql | CVE-2016-5437    | https://security-tracker.debian.org/tracker/CVE-2016-5437   
                  oracle-mysql | CVE-2016-5441    | https://security-tracker.debian.org/tracker/CVE-2016-5441   
                  oracle-mysql | CVE-2016-5442    | https://security-tracker.debian.org/tracker/CVE-2016-5442   
                  oracle-mysql | CVE-2016-5443    | https://security-tracker.debian.org/tracker/CVE-2016-5443   
                  oracle-mysql | CVE-2016-5628    | https://security-tracker.debian.org/tracker/CVE-2016-5628   
                  oracle-mysql | CVE-2016-5631    | https://security-tracker.debian.org/tracker/CVE-2016-5631   
                  oracle-mysql | CVE-2016-5632    | https://security-tracker.debian.org/tracker/CVE-2016-5632   
                  oracle-mysql | CVE-2016-5633    | https://security-tracker.debian.org/tracker/CVE-2016-5633   
                  oracle-mysql | CVE-2016-5634    | https://security-tracker.debian.org/tracker/CVE-2016-5634   
                  oracle-mysql | CVE-2016-5635    | https://security-tracker.debian.org/tracker/CVE-2016-5635   
                  oracle-mysql | CVE-2016-8286    | https://security-tracker.debian.org/tracker/CVE-2016-8286   
                  oracle-mysql | CVE-2016-8287    | https://security-tracker.debian.org/tracker/CVE-2016-8287   
                  oracle-mysql | CVE-2016-8289    | https://security-tracker.debian.org/tracker/CVE-2016-8289   
                  oracle-mysql | CVE-2016-8290    | https://security-tracker.debian.org/tracker/CVE-2016-8290   
                  oracle-mysql | CVE-2017-10165   | https://security-tracker.debian.org/tracker/CVE-2017-10165  
                  oracle-mysql | CVE-2017-10167   | https://security-tracker.debian.org/tracker/CVE-2017-10167  
                  oracle-mysql | CVE-2017-10284   | https://security-tracker.debian.org/tracker/CVE-2017-10284  
                  oracle-mysql | CVE-2017-10296   | https://security-tracker.debian.org/tracker/CVE-2017-10296  
                  oracle-mysql | CVE-2017-10311   | https://security-tracker.debian.org/tracker/CVE-2017-10311  
                  oracle-mysql | CVE-2017-10313   | https://security-tracker.debian.org/tracker/CVE-2017-10313  
                  oracle-mysql | CVE-2017-3251    | https://security-tracker.debian.org/tracker/CVE-2017-3251   
                  oracle-mysql | CVE-2017-3256    | https://security-tracker.debian.org/tracker/CVE-2017-3256   
                  oracle-mysql | CVE-2017-3319    | https://security-tracker.debian.org/tracker/CVE-2017-3319   
                  oracle-mysql | CVE-2017-3320    | https://security-tracker.debian.org/tracker/CVE-2017-3320   
                  oracle-mysql | CVE-2017-3452    | https://security-tracker.debian.org/tracker/CVE-2017-3452   
                  oracle-mysql | CVE-2017-3454    | https://security-tracker.debian.org/tracker/CVE-2017-3454   
                  oracle-mysql | CVE-2017-3455    | https://security-tracker.debian.org/tracker/CVE-2017-3455   
                  oracle-mysql | CVE-2017-3457    | https://security-tracker.debian.org/tracker/CVE-2017-3457   
                  oracle-mysql | CVE-2017-3458    | https://security-tracker.debian.org/tracker/CVE-2017-3458   
                  oracle-mysql | CVE-2017-3459    | https://security-tracker.debian.org/tracker/CVE-2017-3459   
                  oracle-mysql | CVE-2017-3460    | https://security-tracker.debian.org/tracker/CVE-2017-3460   
                  oracle-mysql | CVE-2017-3465    | https://security-tracker.debian.org/tracker/CVE-2017-3465   
                  oracle-mysql | CVE-2017-3467    | https://security-tracker.debian.org/tracker/CVE-2017-3467   
                  oracle-mysql | CVE-2017-3468    | https://security-tracker.debian.org/tracker/CVE-2017-3468   
                  oracle-mysql | CVE-2017-3529    | https://security-tracker.debian.org/tracker/CVE-2017-3529   
                  oracle-mysql | CVE-2017-3637    | https://security-tracker.debian.org/tracker/CVE-2017-3637   
                  oracle-mysql | CVE-2017-3638    | https://security-tracker.debian.org/tracker/CVE-2017-3638   
                  oracle-mysql | CVE-2017-3639    | https://security-tracker.debian.org/tracker/CVE-2017-3639   
                  oracle-mysql | CVE-2017-3640    | https://security-tracker.debian.org/tracker/CVE-2017-3640   
                  oracle-mysql | CVE-2017-3642    | https://security-tracker.debian.org/tracker/CVE-2017-3642   
                  oracle-mysql | CVE-2017-3643    | https://security-tracker.debian.org/tracker/CVE-2017-3643   
                  oracle-mysql | CVE-2017-3644    | https://security-tracker.debian.org/tracker/CVE-2017-3644   
                  oracle-mysql | CVE-2017-3645    | https://security-tracker.debian.org/tracker/CVE-2017-3645   
                  oracle-mysql | CVE-2017-3646    | https://security-tracker.debian.org/tracker/CVE-2017-3646   
                  oracle-mysql | CVE-2017-3650    | https://security-tracker.debian.org/tracker/CVE-2017-3650   
                  oracle-mysql | CVE-2018-0735    | https://security-tracker.debian.org/tracker/CVE-2018-0735   
                  oracle-mysql | CVE-2018-3061    | https://security-tracker.debian.org/tracker/CVE-2018-3061   
                  oracle-mysql | CVE-2018-3067    | https://security-tracker.debian.org/tracker/CVE-2018-3067   
                  oracle-mysql | CVE-2018-3071    | https://security-tracker.debian.org/tracker/CVE-2018-3071   
                  oracle-mysql | CVE-2018-3073    | https://security-tracker.debian.org/tracker/CVE-2018-3073   
                  oracle-mysql | CVE-2018-3074    | https://security-tracker.debian.org/tracker/CVE-2018-3074   
                  oracle-mysql | CVE-2018-3075    | https://security-tracker.debian.org/tracker/CVE-2018-3075   
                  oracle-mysql | CVE-2018-3078    | https://security-tracker.debian.org/tracker/CVE-2018-3078   
                  oracle-mysql | CVE-2018-3079    | https://security-tracker.debian.org/tracker/CVE-2018-3079   
                  oracle-mysql | CVE-2018-3080    | https://security-tracker.debian.org/tracker/CVE-2018-3080   
                  oracle-mysql | CVE-2018-3082    | https://security-tracker.debian.org/tracker/CVE-2018-3082   
                  oracle-mysql | CVE-2018-3084    | https://security-tracker.debian.org/tracker/CVE-2018-3084   
                  oracle-mysql | CVE-2018-3137    | https://security-tracker.debian.org/tracker/CVE-2018-3137   
                  oracle-mysql | CVE-2018-3145    | https://security-tracker.debian.org/tracker/CVE-2018-3145   
                  oracle-mysql | CVE-2018-3170    | https://security-tracker.debian.org/tracker/CVE-2018-3170   
                  oracle-mysql | CVE-2018-3182    | https://security-tracker.debian.org/tracker/CVE-2018-3182   
                  oracle-mysql | CVE-2018-3186    | https://security-tracker.debian.org/tracker/CVE-2018-3186   
                  oracle-mysql | CVE-2018-3195    | https://security-tracker.debian.org/tracker/CVE-2018-3195   
                  oracle-mysql | CVE-2018-3203    | https://security-tracker.debian.org/tracker/CVE-2018-3203   
                  oracle-mysql | CVE-2018-3212    | https://security-tracker.debian.org/tracker/CVE-2018-3212   
                  oracle-mysql | CVE-2018-3279    | https://security-tracker.debian.org/tracker/CVE-2018-3279   
                  oracle-mysql | CVE-2018-3280    | https://security-tracker.debian.org/tracker/CVE-2018-3280   
                  oracle-mysql | CVE-2018-3285    | https://security-tracker.debian.org/tracker/CVE-2018-3285   
                  oracle-mysql | CVE-2018-3286    | https://security-tracker.debian.org/tracker/CVE-2018-3286   
                  oracle-mysql | CVE-2019-2436    | https://security-tracker.debian.org/tracker/CVE-2019-2436   
                  oracle-mysql | CVE-2019-2494    | https://security-tracker.debian.org/tracker/CVE-2019-2494   
                  oracle-mysql | CVE-2019-2495    | https://security-tracker.debian.org/tracker/CVE-2019-2495   
                  oracle-mysql | CVE-2019-2502    | https://security-tracker.debian.org/tracker/CVE-2019-2502   
                  oracle-mysql | CVE-2019-2513    | https://security-tracker.debian.org/tracker/CVE-2019-2513   
                  oracle-mysql | CVE-2019-2530    | https://security-tracker.debian.org/tracker/CVE-2019-2530   
                  oracle-mysql | CVE-2019-2533    | https://security-tracker.debian.org/tracker/CVE-2019-2533   
                  oracle-mysql | CVE-2019-2535    | https://security-tracker.debian.org/tracker/CVE-2019-2535   
                  oracle-mysql | CVE-2019-2536    | https://security-tracker.debian.org/tracker/CVE-2019-2536   
                  oracle-mysql | CVE-2019-2539    | https://security-tracker.debian.org/tracker/CVE-2019-2539   
                  oracle-mysql | CVE-2019-2731    | https://security-tracker.debian.org/tracker/CVE-2019-2731   
                  oracle-mysql | CVE-2019-2741    | https://security-tracker.debian.org/tracker/CVE-2019-2741   
                  oracle-mysql | CVE-2019-2743    | https://security-tracker.debian.org/tracker/CVE-2019-2743   
                  oracle-mysql | CVE-2019-2746    | https://security-tracker.debian.org/tracker/CVE-2019-2746   
                  oracle-mysql | CVE-2019-2747    | https://security-tracker.debian.org/tracker/CVE-2019-2747   
                  oracle-mysql | CVE-2019-2752    | https://security-tracker.debian.org/tracker/CVE-2019-2752   
                  oracle-mysql | CVE-2019-2755    | https://security-tracker.debian.org/tracker/CVE-2019-2755   
                  oracle-mysql | CVE-2019-2757    | https://security-tracker.debian.org/tracker/CVE-2019-2757   
                  oracle-mysql | CVE-2019-2780    | https://security-tracker.debian.org/tracker/CVE-2019-2780   
                  oracle-mysql | CVE-2019-2784    | https://security-tracker.debian.org/tracker/CVE-2019-2784   
                  oracle-mysql | CVE-2019-2785    | https://security-tracker.debian.org/tracker/CVE-2019-2785   
                  oracle-mysql | CVE-2019-2789    | https://security-tracker.debian.org/tracker/CVE-2019-2789   
                  oracle-mysql | CVE-2019-2795    | https://security-tracker.debian.org/tracker/CVE-2019-2795   
                  oracle-mysql | CVE-2019-2796    | https://security-tracker.debian.org/tracker/CVE-2019-2796   
                  oracle-mysql | CVE-2019-2798    | https://security-tracker.debian.org/tracker/CVE-2019-2798   
                  oracle-mysql | CVE-2019-2800    | https://security-tracker.debian.org/tracker/CVE-2019-2800   
                  oracle-mysql | CVE-2019-2801    | https://security-tracker.debian.org/tracker/CVE-2019-2801   
                  oracle-mysql | CVE-2019-2802    | https://security-tracker.debian.org/tracker/CVE-2019-2802   
                  oracle-mysql | CVE-2019-2803    | https://security-tracker.debian.org/tracker/CVE-2019-2803   
                  oracle-mysql | CVE-2019-2808    | https://security-tracker.debian.org/tracker/CVE-2019-2808   
                  oracle-mysql | CVE-2019-2810    | https://security-tracker.debian.org/tracker/CVE-2019-2810   
                  oracle-mysql | CVE-2019-2811    | https://security-tracker.debian.org/tracker/CVE-2019-2811   
                  oracle-mysql | CVE-2019-2812    | https://security-tracker.debian.org/tracker/CVE-2019-2812   
                  oracle-mysql | CVE-2019-2814    | https://security-tracker.debian.org/tracker/CVE-2019-2814   
                  oracle-mysql | CVE-2019-2815    | https://security-tracker.debian.org/tracker/CVE-2019-2815   
                  oracle-mysql | CVE-2019-2822    | https://security-tracker.debian.org/tracker/CVE-2019-2822   
                  oracle-mysql | CVE-2019-2826    | https://security-tracker.debian.org/tracker/CVE-2019-2826   
                  oracle-mysql | CVE-2019-2830    | https://security-tracker.debian.org/tracker/CVE-2019-2830   
                  oracle-mysql | CVE-2019-2834    | https://security-tracker.debian.org/tracker/CVE-2019-2834   
                  oracle-mysql | CVE-2019-2879    | https://security-tracker.debian.org/tracker/CVE-2019-2879   
                  oracle-mysql | CVE-2019-3004    | https://security-tracker.debian.org/tracker/CVE-2019-3004   
                  oracle-mysql | CVE-2019-7317    | https://security-tracker.debian.org/tracker/CVE-2019-7317   
                  oracle-mysql | CVE-2020-14575   | https://security-tracker.debian.org/tracker/CVE-2020-14575  
                  oracle-mysql | CVE-2020-14597   | https://security-tracker.debian.org/tracker/CVE-2020-14597  
                  oracle-mysql | CVE-2020-14614   | https://security-tracker.debian.org/tracker/CVE-2020-14614  
                  oracle-mysql | CVE-2020-14619   | https://security-tracker.debian.org/tracker/CVE-2020-14619  
                  oracle-mysql | CVE-2020-14620   | https://security-tracker.debian.org/tracker/CVE-2020-14620  
                  oracle-mysql | CVE-2020-14623   | https://security-tracker.debian.org/tracker/CVE-2020-14623  
                  oracle-mysql | CVE-2020-14624   | https://security-tracker.debian.org/tracker/CVE-2020-14624  
                  oracle-mysql | CVE-2020-14631   | https://security-tracker.debian.org/tracker/CVE-2020-14631  
                  oracle-mysql | CVE-2020-14643   | https://security-tracker.debian.org/tracker/CVE-2020-14643  
                  oracle-mysql | CVE-2020-14651   | https://security-tracker.debian.org/tracker/CVE-2020-14651  
                  oracle-mysql | CVE-2020-14654   | https://security-tracker.debian.org/tracker/CVE-2020-14654  
                  oracle-mysql | CVE-2020-14656   | https://security-tracker.debian.org/tracker/CVE-2020-14656  
                  oracle-mysql | CVE-2020-14663   | https://security-tracker.debian.org/tracker/CVE-2020-14663  
                  oracle-mysql | CVE-2020-14678   | https://security-tracker.debian.org/tracker/CVE-2020-14678  
                  oracle-mysql | CVE-2020-14680   | https://security-tracker.debian.org/tracker/CVE-2020-14680  
                  oracle-mysql | CVE-2020-14697   | https://security-tracker.debian.org/tracker/CVE-2020-14697  
                  oracle-mysql | CVE-2020-14702   | https://security-tracker.debian.org/tracker/CVE-2020-14702  
                  oracle-mysql | CVE-2020-14760   | https://security-tracker.debian.org/tracker/CVE-2020-14760  
                  oracle-mysql | CVE-2020-14814   | https://security-tracker.debian.org/tracker/CVE-2020-14814  
                  oracle-mysql | CVE-2020-14830   | https://security-tracker.debian.org/tracker/CVE-2020-14830  
                  oracle-mysql | CVE-2020-14837   | https://security-tracker.debian.org/tracker/CVE-2020-14837  
                  oracle-mysql | CVE-2020-14839   | https://security-tracker.debian.org/tracker/CVE-2020-14839  
                  oracle-mysql | CVE-2020-14845   | https://security-tracker.debian.org/tracker/CVE-2020-14845  
                  oracle-mysql | CVE-2020-14846   | https://security-tracker.debian.org/tracker/CVE-2020-14846  
                  oracle-mysql | CVE-2020-14852   | https://security-tracker.debian.org/tracker/CVE-2020-14852  
                  oracle-mysql | CVE-2020-15358   | https://security-tracker.debian.org/tracker/CVE-2020-15358  
                  oracle-mysql | CVE-2020-1967    | https://security-tracker.debian.org/tracker/CVE-2020-1967   
                  oracle-mysql | CVE-2020-1971    | https://security-tracker.debian.org/tracker/CVE-2020-1971   
                  oracle-mysql | CVE-2021-22570   | https://security-tracker.debian.org/tracker/CVE-2021-22570  
                  oracle-mysql | CVE-2021-2356    | https://security-tracker.debian.org/tracker/CVE-2021-2356   
                  oracle-mysql | CVE-2022-21417   | https://security-tracker.debian.org/tracker/CVE-2022-21417  
                  oracle-mysql | CVE-2022-21444   | https://security-tracker.debian.org/tracker/CVE-2022-21444  
                         p7zip | CVE-2017-17969   | https://security-tracker.debian.org/tracker/CVE-2017-17969  
                         p7zip | CVE-2018-5996    | https://security-tracker.debian.org/tracker/CVE-2018-5996   
                         patch | CVE-2018-6952    | https://security-tracker.debian.org/tracker/CVE-2018-6952   
                         patch | CVE-2019-20633   | https://security-tracker.debian.org/tracker/CVE-2019-20633  
                           php | CVE-2007-2728    | https://security-tracker.debian.org/tracker/CVE-2007-2728   
                           php | CVE-2007-3205    | https://security-tracker.debian.org/tracker/CVE-2007-3205   
                           php | CVE-2007-4596    | https://security-tracker.debian.org/tracker/CVE-2007-4596   
                        polkit | CVE-2021-4034    | https://security-tracker.debian.org/tracker/CVE-2021-4034   
                    postgresql | CVE-2017-8806    | https://security-tracker.debian.org/tracker/CVE-2017-8806   
                 powerpc-utils | CVE-2014-8165    | https://security-tracker.debian.org/tracker/CVE-2014-8165   
                          pppd | CVE-2018-11574   | https://security-tracker.debian.org/tracker/CVE-2018-11574  
               python-m2crypto | CVE-2020-25657   | https://security-tracker.debian.org/tracker/CVE-2020-25657  
                    python-pip | CVE-2018-20225   | https://security-tracker.debian.org/tracker/CVE-2018-20225  
                     python-py | CVE-2022-42969   | https://security-tracker.debian.org/tracker/CVE-2022-42969  
                          qemu | CVE-2018-18438   | https://security-tracker.debian.org/tracker/CVE-2018-18438  
                          qemu | CVE-2019-12067   | https://security-tracker.debian.org/tracker/CVE-2019-12067  
                          qemu | CVE-2021-20255   | https://security-tracker.debian.org/tracker/CVE-2021-20255  
                          qemu | CVE-2022-2962    | https://security-tracker.debian.org/tracker/CVE-2022-2962   
                          qemu | CVE-2022-3165    | https://security-tracker.debian.org/tracker/CVE-2022-3165   
                          qemu | CVE-2022-3872    | https://security-tracker.debian.org/tracker/CVE-2022-3872   
                          qemu | CVE-2022-4144    | https://security-tracker.debian.org/tracker/CVE-2022-4144   
                        quagga | CVE-2016-4049    | https://security-tracker.debian.org/tracker/CVE-2016-4049   
                        quagga | CVE-2017-3224    | https://security-tracker.debian.org/tracker/CVE-2017-3224   
                        quagga | CVE-2021-44038   | https://security-tracker.debian.org/tracker/CVE-2021-44038  
                   resiprocate | CVE-2017-9454    | https://security-tracker.debian.org/tracker/CVE-2017-9454   
                        samba4 | CVE-2011-2411    | https://security-tracker.debian.org/tracker/CVE-2011-2411   
                        samba4 | CVE-2021-3670    | https://security-tracker.debian.org/tracker/CVE-2021-3670   
                        samba4 | CVE-2022-1615    | https://security-tracker.debian.org/tracker/CVE-2022-1615   
                        samba4 | CVE-2022-32743   | https://security-tracker.debian.org/tracker/CVE-2022-32743  
                           sdl | CVE-2019-13616   | https://security-tracker.debian.org/tracker/CVE-2019-13616  
                           sdl | CVE-2019-14906   | https://security-tracker.debian.org/tracker/CVE-2019-14906  
                           sdl | CVE-2019-7572    | https://security-tracker.debian.org/tracker/CVE-2019-7572   
                           sdl | CVE-2019-7573    | https://security-tracker.debian.org/tracker/CVE-2019-7573   
                           sdl | CVE-2019-7574    | https://security-tracker.debian.org/tracker/CVE-2019-7574   
                           sdl | CVE-2019-7575    | https://security-tracker.debian.org/tracker/CVE-2019-7575   
                           sdl | CVE-2019-7576    | https://security-tracker.debian.org/tracker/CVE-2019-7576   
                           sdl | CVE-2019-7577    | https://security-tracker.debian.org/tracker/CVE-2019-7577   
                           sdl | CVE-2019-7578    | https://security-tracker.debian.org/tracker/CVE-2019-7578   
                           sdl | CVE-2019-7635    | https://security-tracker.debian.org/tracker/CVE-2019-7635   
                           sdl | CVE-2019-7636    | https://security-tracker.debian.org/tracker/CVE-2019-7636   
                           sdl | CVE-2019-7637    | https://security-tracker.debian.org/tracker/CVE-2019-7637   
                           sdl | CVE-2019-7638    | https://security-tracker.debian.org/tracker/CVE-2019-7638   
                           sdl | CVE-2020-14409   | https://security-tracker.debian.org/tracker/CVE-2020-14409  
                           sdl | CVE-2020-14410   | https://security-tracker.debian.org/tracker/CVE-2020-14410  
                         smack | CVE-2014-0363    | https://security-tracker.debian.org/tracker/CVE-2014-0363   
                         smack | CVE-2014-0364    | https://security-tracker.debian.org/tracker/CVE-2014-0364   
                         smack | CVE-2016-10027   | https://security-tracker.debian.org/tracker/CVE-2016-10027  
                         spice | CVE-2016-0749    | https://security-tracker.debian.org/tracker/CVE-2016-0749   
                         spice | CVE-2016-2150    | https://security-tracker.debian.org/tracker/CVE-2016-2150   
                         spice | CVE-2018-10893   | https://security-tracker.debian.org/tracker/CVE-2018-10893  
                       systemd | CVE-2022-3821    | https://security-tracker.debian.org/tracker/CVE-2022-3821   
                       systemd | CVE-2022-45873   | https://security-tracker.debian.org/tracker/CVE-2022-45873  
                        thttpd | CVE-2012-5640    | https://security-tracker.debian.org/tracker/CVE-2012-5640   
                          tiff | CVE-2015-7313    | https://security-tracker.debian.org/tracker/CVE-2015-7313   
                          tiff | CVE-2022-2056    | https://security-tracker.debian.org/tracker/CVE-2022-2056   
                          tiff | CVE-2022-2057    | https://security-tracker.debian.org/tracker/CVE-2022-2057   
                          tiff | CVE-2022-2058    | https://security-tracker.debian.org/tracker/CVE-2022-2058   
                          tiff | CVE-2022-2519    | https://security-tracker.debian.org/tracker/CVE-2022-2519   
                          tiff | CVE-2022-2520    | https://security-tracker.debian.org/tracker/CVE-2022-2520   
                          tiff | CVE-2022-2521    | https://security-tracker.debian.org/tracker/CVE-2022-2521   
                          tiff | CVE-2022-2953    | https://security-tracker.debian.org/tracker/CVE-2022-2953   
                          tiff | CVE-2022-34526   | https://security-tracker.debian.org/tracker/CVE-2022-34526  
                          tiff | CVE-2022-3570    | https://security-tracker.debian.org/tracker/CVE-2022-3570   
                          tiff | CVE-2022-3597    | https://security-tracker.debian.org/tracker/CVE-2022-3597   
                          tiff | CVE-2022-3598    | https://security-tracker.debian.org/tracker/CVE-2022-3598   
                          tiff | CVE-2022-3599    | https://security-tracker.debian.org/tracker/CVE-2022-3599   
                          tiff | CVE-2022-3626    | https://security-tracker.debian.org/tracker/CVE-2022-3626   
                          tiff | CVE-2022-3627    | https://security-tracker.debian.org/tracker/CVE-2022-3627   
                          tiff | CVE-2022-3970    | https://security-tracker.debian.org/tracker/CVE-2022-3970   
                          tinc | CVE-2013-1428    | https://security-tracker.debian.org/tracker/CVE-2013-1428   
                           tor | CVE-2016-9079    | https://security-tracker.debian.org/tracker/CVE-2016-9079   
                           tor | CVE-2017-16541   | https://security-tracker.debian.org/tracker/CVE-2017-16541  
                   uboot-tools | CVE-2022-2347    | https://security-tracker.debian.org/tracker/CVE-2022-2347   
                   uboot-tools | CVE-2022-30767   | https://security-tracker.debian.org/tracker/CVE-2022-30767  
                   uboot-tools | CVE-2022-33103   | https://security-tracker.debian.org/tracker/CVE-2022-33103  
                   uboot-tools | CVE-2022-34835   | https://security-tracker.debian.org/tracker/CVE-2022-34835  
                         unrar | CVE-2022-30333   | https://security-tracker.debian.org/tracker/CVE-2022-30333  
                         unzip | CVE-2021-4217    | https://security-tracker.debian.org/tracker/CVE-2021-4217   
                     wireshark | CVE-2022-3190    | https://security-tracker.debian.org/tracker/CVE-2022-3190   
                           xen | CVE-2011-1936    | https://security-tracker.debian.org/tracker/CVE-2011-1936   
                           xen | CVE-2011-3346    | https://security-tracker.debian.org/tracker/CVE-2011-3346   
                           xen | CVE-2014-2580    | https://security-tracker.debian.org/tracker/CVE-2014-2580   
                           xen | CVE-2014-3672    | https://security-tracker.debian.org/tracker/CVE-2014-3672   
                           xen | CVE-2015-7504    | https://security-tracker.debian.org/tracker/CVE-2015-7504   
                           xen | CVE-2015-8550    | https://security-tracker.debian.org/tracker/CVE-2015-8550   
                           xen | CVE-2015-8553    | https://security-tracker.debian.org/tracker/CVE-2015-8553   
                           xen | CVE-2016-3960    | https://security-tracker.debian.org/tracker/CVE-2016-3960   
                           xen | CVE-2016-7092    | https://security-tracker.debian.org/tracker/CVE-2016-7092   
                           xen | CVE-2016-9379    | https://security-tracker.debian.org/tracker/CVE-2016-9379   
                           xen | CVE-2016-9380    | https://security-tracker.debian.org/tracker/CVE-2016-9380   
                           xen | CVE-2016-9383    | https://security-tracker.debian.org/tracker/CVE-2016-9383   
                           xen | CVE-2016-9386    | https://security-tracker.debian.org/tracker/CVE-2016-9386   
                           xen | CVE-2017-12134   | https://security-tracker.debian.org/tracker/CVE-2017-12134  
                           xen | CVE-2017-12135   | https://security-tracker.debian.org/tracker/CVE-2017-12135  
                           xen | CVE-2017-12137   | https://security-tracker.debian.org/tracker/CVE-2017-12137  
                           xen | CVE-2017-7228    | https://security-tracker.debian.org/tracker/CVE-2017-7228   
                           xen | CVE-2018-5244    | https://security-tracker.debian.org/tracker/CVE-2018-5244   
                           xen | CVE-2018-8897    | https://security-tracker.debian.org/tracker/CVE-2018-8897   
                           xen | CVE-2021-26313   | https://security-tracker.debian.org/tracker/CVE-2021-26313  
                           xen | CVE-2021-26314   | https://security-tracker.debian.org/tracker/CVE-2021-26314  
                           xen | CVE-2021-28038   | https://security-tracker.debian.org/tracker/CVE-2021-28038  
                           xen | CVE-2021-28039   | https://security-tracker.debian.org/tracker/CVE-2021-28039  
                           xen | CVE-2021-28687   | https://security-tracker.debian.org/tracker/CVE-2021-28687  
                           xen | CVE-2021-28690   | https://security-tracker.debian.org/tracker/CVE-2021-28690  
                           xen | CVE-2021-28692   | https://security-tracker.debian.org/tracker/CVE-2021-28692  
                           xen | CVE-2021-28693   | https://security-tracker.debian.org/tracker/CVE-2021-28693  
                           xen | CVE-2021-28694   | https://security-tracker.debian.org/tracker/CVE-2021-28694  
                           xen | CVE-2021-28695   | https://security-tracker.debian.org/tracker/CVE-2021-28695  
                           xen | CVE-2021-28696   | https://security-tracker.debian.org/tracker/CVE-2021-28696  
                           xen | CVE-2021-28697   | https://security-tracker.debian.org/tracker/CVE-2021-28697  
                           xen | CVE-2021-28698   | https://security-tracker.debian.org/tracker/CVE-2021-28698  
                           xen | CVE-2021-28699   | https://security-tracker.debian.org/tracker/CVE-2021-28699  
                           xen | CVE-2021-28700   | https://security-tracker.debian.org/tracker/CVE-2021-28700  
                           xen | CVE-2021-28701   | https://security-tracker.debian.org/tracker/CVE-2021-28701  
                           xen | CVE-2021-28702   | https://security-tracker.debian.org/tracker/CVE-2021-28702  
                           xen | CVE-2021-28703   | https://security-tracker.debian.org/tracker/CVE-2021-28703  
                           xen | CVE-2021-28704   | https://security-tracker.debian.org/tracker/CVE-2021-28704  
                           xen | CVE-2021-28707   | https://security-tracker.debian.org/tracker/CVE-2021-28707  
                           xen | CVE-2021-28708   | https://security-tracker.debian.org/tracker/CVE-2021-28708  
                           xen | CVE-2021-28711   | https://security-tracker.debian.org/tracker/CVE-2021-28711  
                           xen | CVE-2021-28712   | https://security-tracker.debian.org/tracker/CVE-2021-28712  
                           xen | CVE-2021-28713   | https://security-tracker.debian.org/tracker/CVE-2021-28713  
                           xen | CVE-2022-21123   | https://security-tracker.debian.org/tracker/CVE-2022-21123  
                           xen | CVE-2022-21125   | https://security-tracker.debian.org/tracker/CVE-2022-21125  
                           xen | CVE-2022-21127   | https://security-tracker.debian.org/tracker/CVE-2022-21127  
                           xen | CVE-2022-21166   | https://security-tracker.debian.org/tracker/CVE-2022-21166  
                           xen | CVE-2022-23033   | https://security-tracker.debian.org/tracker/CVE-2022-23033  
                           xen | CVE-2022-23035   | https://security-tracker.debian.org/tracker/CVE-2022-23035  
                           xen | CVE-2022-23036   | https://security-tracker.debian.org/tracker/CVE-2022-23036  
                           xen | CVE-2022-23037   | https://security-tracker.debian.org/tracker/CVE-2022-23037  
                           xen | CVE-2022-23038   | https://security-tracker.debian.org/tracker/CVE-2022-23038  
                           xen | CVE-2022-23039   | https://security-tracker.debian.org/tracker/CVE-2022-23039  
                           xen | CVE-2022-23040   | https://security-tracker.debian.org/tracker/CVE-2022-23040  
                           xen | CVE-2022-23041   | https://security-tracker.debian.org/tracker/CVE-2022-23041  
                           xen | CVE-2022-23042   | https://security-tracker.debian.org/tracker/CVE-2022-23042  
                           xen | CVE-2022-23824   | https://security-tracker.debian.org/tracker/CVE-2022-23824  
                           xen | CVE-2022-23960   | https://security-tracker.debian.org/tracker/CVE-2022-23960  
                           xen | CVE-2022-26357   | https://security-tracker.debian.org/tracker/CVE-2022-26357  
                           xen | CVE-2022-26358   | https://security-tracker.debian.org/tracker/CVE-2022-26358  
                           xen | CVE-2022-26359   | https://security-tracker.debian.org/tracker/CVE-2022-26359  
                           xen | CVE-2022-26360   | https://security-tracker.debian.org/tracker/CVE-2022-26360  
                           xen | CVE-2022-26361   | https://security-tracker.debian.org/tracker/CVE-2022-26361  
                           xen | CVE-2022-26362   | https://security-tracker.debian.org/tracker/CVE-2022-26362  
                           xen | CVE-2022-26363   | https://security-tracker.debian.org/tracker/CVE-2022-26363  
                           xen | CVE-2022-26364   | https://security-tracker.debian.org/tracker/CVE-2022-26364  
                           xen | CVE-2022-26365   | https://security-tracker.debian.org/tracker/CVE-2022-26365  
                           xen | CVE-2022-29900   | https://security-tracker.debian.org/tracker/CVE-2022-29900  
                           xen | CVE-2022-29901   | https://security-tracker.debian.org/tracker/CVE-2022-29901  
                           xen | CVE-2022-33740   | https://security-tracker.debian.org/tracker/CVE-2022-33740  
                           xen | CVE-2022-33741   | https://security-tracker.debian.org/tracker/CVE-2022-33741  
                           xen | CVE-2022-33742   | https://security-tracker.debian.org/tracker/CVE-2022-33742  
                           xen | CVE-2022-33743   | https://security-tracker.debian.org/tracker/CVE-2022-33743  
                           xen | CVE-2022-33745   | https://security-tracker.debian.org/tracker/CVE-2022-33745  
                           xen | CVE-2022-33746   | https://security-tracker.debian.org/tracker/CVE-2022-33746  
                           xen | CVE-2022-33747   | https://security-tracker.debian.org/tracker/CVE-2022-33747  
                           xen | CVE-2022-33748   | https://security-tracker.debian.org/tracker/CVE-2022-33748  
                           xen | CVE-2022-42309   | https://security-tracker.debian.org/tracker/CVE-2022-42309  
                           xen | CVE-2022-42311   | https://security-tracker.debian.org/tracker/CVE-2022-42311  
                           xen | CVE-2022-42312   | https://security-tracker.debian.org/tracker/CVE-2022-42312  
                           xen | CVE-2022-42313   | https://security-tracker.debian.org/tracker/CVE-2022-42313  
                           xen | CVE-2022-42314   | https://security-tracker.debian.org/tracker/CVE-2022-42314  
                           xen | CVE-2022-42315   | https://security-tracker.debian.org/tracker/CVE-2022-42315  
                           xen | CVE-2022-42316   | https://security-tracker.debian.org/tracker/CVE-2022-42316  
                           xen | CVE-2022-42317   | https://security-tracker.debian.org/tracker/CVE-2022-42317  
                           xen | CVE-2022-42318   | https://security-tracker.debian.org/tracker/CVE-2022-42318  
                           xen | CVE-2022-42319   | https://security-tracker.debian.org/tracker/CVE-2022-42319  
                           xen | CVE-2022-42320   | https://security-tracker.debian.org/tracker/CVE-2022-42320  
                           xen | CVE-2022-42321   | https://security-tracker.debian.org/tracker/CVE-2022-42321  
                           xen | CVE-2022-42322   | https://security-tracker.debian.org/tracker/CVE-2022-42322  
                           xen | CVE-2022-42323   | https://security-tracker.debian.org/tracker/CVE-2022-42323  
                           xen | CVE-2022-42324   | https://security-tracker.debian.org/tracker/CVE-2022-42324  
                           xen | CVE-2022-42325   | https://security-tracker.debian.org/tracker/CVE-2022-42325  
                           xen | CVE-2022-42326   | https://security-tracker.debian.org/tracker/CVE-2022-42326  
                        xerces | CVE-2012-0880    | https://security-tracker.debian.org/tracker/CVE-2012-0880   
                          yasm | CVE-2021-33454   | https://security-tracker.debian.org/tracker/CVE-2021-33454  
                          yasm | CVE-2021-33455   | https://security-tracker.debian.org/tracker/CVE-2021-33455  
                          yasm | CVE-2021-33456   | https://security-tracker.debian.org/tracker/CVE-2021-33456  
                          yasm | CVE-2021-33457   | https://security-tracker.debian.org/tracker/CVE-2021-33457  
                          yasm | CVE-2021-33458   | https://security-tracker.debian.org/tracker/CVE-2021-33458  
                          yasm | CVE-2021-33459   | https://security-tracker.debian.org/tracker/CVE-2021-33459  
                          yasm | CVE-2021-33460   | https://security-tracker.debian.org/tracker/CVE-2021-33460  
                          yasm | CVE-2021-33461   | https://security-tracker.debian.org/tracker/CVE-2021-33461  
                          yasm | CVE-2021-33462   | https://security-tracker.debian.org/tracker/CVE-2021-33462  
                          yasm | CVE-2021-33463   | https://security-tracker.debian.org/tracker/CVE-2021-33463  
                          yasm | CVE-2021-33464   | https://security-tracker.debian.org/tracker/CVE-2021-33464  
                          yasm | CVE-2021-33465   | https://security-tracker.debian.org/tracker/CVE-2021-33465  
                          yasm | CVE-2021-33466   | https://security-tracker.debian.org/tracker/CVE-2021-33466  
                          yasm | CVE-2021-33467   | https://security-tracker.debian.org/tracker/CVE-2021-33467  
                          yasm | CVE-2021-33468   | https://security-tracker.debian.org/tracker/CVE-2021-33468  
                           zip | CVE-2018-13410   | https://security-tracker.debian.org/tracker/CVE-2018-13410  

CVEs for the '2022.02.x' branch
-------------------------------

             name              |       CVE        |                             link                            
-------------------------------+------------------+--------------------------------------------------------------
                        apache | CVE-1999-0236    | https://security-tracker.debian.org/tracker/CVE-1999-0236   
                        apache | CVE-1999-0289    | https://security-tracker.debian.org/tracker/CVE-1999-0289   
                        apache | CVE-1999-0678    | https://security-tracker.debian.org/tracker/CVE-1999-0678   
                        apache | CVE-1999-1237    | https://security-tracker.debian.org/tracker/CVE-1999-1237   
                        apache | CVE-1999-1412    | https://security-tracker.debian.org/tracker/CVE-1999-1412   
                        apache | CVE-2007-0086    | https://security-tracker.debian.org/tracker/CVE-2007-0086   
                        apache | CVE-2007-0450    | https://security-tracker.debian.org/tracker/CVE-2007-0450   
                        apache | CVE-2007-4465    | https://security-tracker.debian.org/tracker/CVE-2007-4465   
                        apache | CVE-2007-5000    | https://security-tracker.debian.org/tracker/CVE-2007-5000   
                        apache | CVE-2007-6388    | https://security-tracker.debian.org/tracker/CVE-2007-6388   
                        apache | CVE-2007-6420    | https://security-tracker.debian.org/tracker/CVE-2007-6420   
                        apache | CVE-2007-6421    | https://security-tracker.debian.org/tracker/CVE-2007-6421   
                        apache | CVE-2007-6422    | https://security-tracker.debian.org/tracker/CVE-2007-6422   
                        apache | CVE-2007-6423    | https://security-tracker.debian.org/tracker/CVE-2007-6423   
                        apache | CVE-2008-2168    | https://security-tracker.debian.org/tracker/CVE-2008-2168   
                        apache | CVE-2008-2939    | https://security-tracker.debian.org/tracker/CVE-2008-2939   
                        apache | CVE-2009-1195    | https://security-tracker.debian.org/tracker/CVE-2009-1195   
                        apache | CVE-2010-0408    | https://security-tracker.debian.org/tracker/CVE-2010-0408   
                        apache | CVE-2010-0425    | https://security-tracker.debian.org/tracker/CVE-2010-0425   
                        apache | CVE-2010-1452    | https://security-tracker.debian.org/tracker/CVE-2010-1452   
                        apache | CVE-2014-0231    | https://security-tracker.debian.org/tracker/CVE-2014-0231   
                      apparmor | CVE-2016-1585    | https://security-tracker.debian.org/tracker/CVE-2016-1585   
                         argus | CVE-2011-3332    | https://security-tracker.debian.org/tracker/CVE-2011-3332   
                         asn1c | CVE-2017-12966   | https://security-tracker.debian.org/tracker/CVE-2017-12966  
                          atop | CVE-2011-3618    | https://security-tracker.debian.org/tracker/CVE-2011-3618   
                         avahi | CVE-2021-3468    | https://security-tracker.debian.org/tracker/CVE-2021-3468   
                     belle-sip | CVE-2021-33056   | https://security-tracker.debian.org/tracker/CVE-2021-33056  
                     belle-sip | CVE-2021-43610   | https://security-tracker.debian.org/tracker/CVE-2021-43610  
                     belle-sip | CVE-2021-43611   | https://security-tracker.debian.org/tracker/CVE-2021-43611  
                        bento4 | CVE-2020-23331   | https://security-tracker.debian.org/tracker/CVE-2020-23331  
                        bento4 | CVE-2020-23332   | https://security-tracker.debian.org/tracker/CVE-2020-23332  
                        bento4 | CVE-2022-27607   | https://security-tracker.debian.org/tracker/CVE-2022-27607  
                        bento4 | CVE-2022-35165   | https://security-tracker.debian.org/tracker/CVE-2022-35165  
                        bento4 | CVE-2022-3662    | https://security-tracker.debian.org/tracker/CVE-2022-3662   
                        bento4 | CVE-2022-3663    | https://security-tracker.debian.org/tracker/CVE-2022-3663   
                        bento4 | CVE-2022-3664    | https://security-tracker.debian.org/tracker/CVE-2022-3664   
                        bento4 | CVE-2022-3665    | https://security-tracker.debian.org/tracker/CVE-2022-3665   
                        bento4 | CVE-2022-3666    | https://security-tracker.debian.org/tracker/CVE-2022-3666   
                        bento4 | CVE-2022-3667    | https://security-tracker.debian.org/tracker/CVE-2022-3667   
                        bento4 | CVE-2022-3668    | https://security-tracker.debian.org/tracker/CVE-2022-3668   
                        bento4 | CVE-2022-3669    | https://security-tracker.debian.org/tracker/CVE-2022-3669   
                        bento4 | CVE-2022-3670    | https://security-tracker.debian.org/tracker/CVE-2022-3670   
                        bento4 | CVE-2022-3784    | https://security-tracker.debian.org/tracker/CVE-2022-3784   
                        bento4 | CVE-2022-3785    | https://security-tracker.debian.org/tracker/CVE-2022-3785   
                        bento4 | CVE-2022-3807    | https://security-tracker.debian.org/tracker/CVE-2022-3807   
                        bento4 | CVE-2022-3809    | https://security-tracker.debian.org/tracker/CVE-2022-3809   
                        bento4 | CVE-2022-3810    | https://security-tracker.debian.org/tracker/CVE-2022-3810   
                        bento4 | CVE-2022-3812    | https://security-tracker.debian.org/tracker/CVE-2022-3812   
                        bento4 | CVE-2022-3813    | https://security-tracker.debian.org/tracker/CVE-2022-3813   
                        bento4 | CVE-2022-3814    | https://security-tracker.debian.org/tracker/CVE-2022-3814   
                        bento4 | CVE-2022-3815    | https://security-tracker.debian.org/tracker/CVE-2022-3815   
                        bento4 | CVE-2022-3816    | https://security-tracker.debian.org/tracker/CVE-2022-3816   
                        bento4 | CVE-2022-3817    | https://security-tracker.debian.org/tracker/CVE-2022-3817   
                        bento4 | CVE-2022-40438   | https://security-tracker.debian.org/tracker/CVE-2022-40438  
                        bento4 | CVE-2022-40439   | https://security-tracker.debian.org/tracker/CVE-2022-40439  
                        bento4 | CVE-2022-40736   | https://security-tracker.debian.org/tracker/CVE-2022-40736  
                        bento4 | CVE-2022-40737   | https://security-tracker.debian.org/tracker/CVE-2022-40737  
                        bento4 | CVE-2022-40738   | https://security-tracker.debian.org/tracker/CVE-2022-40738  
                        bento4 | CVE-2022-40774   | https://security-tracker.debian.org/tracker/CVE-2022-40774  
                        bento4 | CVE-2022-40775   | https://security-tracker.debian.org/tracker/CVE-2022-40775  
                        bento4 | CVE-2022-40885   | https://security-tracker.debian.org/tracker/CVE-2022-40885  
                        bento4 | CVE-2022-41419   | https://security-tracker.debian.org/tracker/CVE-2022-41419  
                        bento4 | CVE-2022-41423   | https://security-tracker.debian.org/tracker/CVE-2022-41423  
                        bento4 | CVE-2022-41424   | https://security-tracker.debian.org/tracker/CVE-2022-41424  
                        bento4 | CVE-2022-41425   | https://security-tracker.debian.org/tracker/CVE-2022-41425  
                        bento4 | CVE-2022-41426   | https://security-tracker.debian.org/tracker/CVE-2022-41426  
                        bento4 | CVE-2022-41427   | https://security-tracker.debian.org/tracker/CVE-2022-41427  
                        bento4 | CVE-2022-41428   | https://security-tracker.debian.org/tracker/CVE-2022-41428  
                        bento4 | CVE-2022-41429   | https://security-tracker.debian.org/tracker/CVE-2022-41429  
                        bento4 | CVE-2022-41430   | https://security-tracker.debian.org/tracker/CVE-2022-41430  
                        bento4 | CVE-2022-41841   | https://security-tracker.debian.org/tracker/CVE-2022-41841  
                        bento4 | CVE-2022-41845   | https://security-tracker.debian.org/tracker/CVE-2022-41845  
                        bento4 | CVE-2022-41846   | https://security-tracker.debian.org/tracker/CVE-2022-41846  
                        bento4 | CVE-2022-41847   | https://security-tracker.debian.org/tracker/CVE-2022-41847  
                        bento4 | CVE-2022-43032   | https://security-tracker.debian.org/tracker/CVE-2022-43032  
                        bento4 | CVE-2022-43033   | https://security-tracker.debian.org/tracker/CVE-2022-43033  
                        bento4 | CVE-2022-43034   | https://security-tracker.debian.org/tracker/CVE-2022-43034  
                        bento4 | CVE-2022-43035   | https://security-tracker.debian.org/tracker/CVE-2022-43035  
                        bento4 | CVE-2022-43037   | https://security-tracker.debian.org/tracker/CVE-2022-43037  
                        bento4 | CVE-2022-43038   | https://security-tracker.debian.org/tracker/CVE-2022-43038  
                    berkeleydb | CVE-2017-3604    | https://security-tracker.debian.org/tracker/CVE-2017-3604   
                    berkeleydb | CVE-2017-3605    | https://security-tracker.debian.org/tracker/CVE-2017-3605   
                    berkeleydb | CVE-2017-3606    | https://security-tracker.debian.org/tracker/CVE-2017-3606   
                    berkeleydb | CVE-2017-3607    | https://security-tracker.debian.org/tracker/CVE-2017-3607   
                    berkeleydb | CVE-2017-3608    | https://security-tracker.debian.org/tracker/CVE-2017-3608   
                    berkeleydb | CVE-2017-3609    | https://security-tracker.debian.org/tracker/CVE-2017-3609   
                    berkeleydb | CVE-2017-3610    | https://security-tracker.debian.org/tracker/CVE-2017-3610   
                    berkeleydb | CVE-2017-3611    | https://security-tracker.debian.org/tracker/CVE-2017-3611   
                    berkeleydb | CVE-2017-3612    | https://security-tracker.debian.org/tracker/CVE-2017-3612   
                    berkeleydb | CVE-2017-3613    | https://security-tracker.debian.org/tracker/CVE-2017-3613   
                    berkeleydb | CVE-2017-3614    | https://security-tracker.debian.org/tracker/CVE-2017-3614   
                    berkeleydb | CVE-2017-3615    | https://security-tracker.debian.org/tracker/CVE-2017-3615   
                    berkeleydb | CVE-2017-3616    | https://security-tracker.debian.org/tracker/CVE-2017-3616   
                    berkeleydb | CVE-2017-3617    | https://security-tracker.debian.org/tracker/CVE-2017-3617   
                    berkeleydb | CVE-2019-2708    | https://security-tracker.debian.org/tracker/CVE-2019-2708   
                    berkeleydb | CVE-2020-2981    | https://security-tracker.debian.org/tracker/CVE-2020-2981   
                      binutils | CVE-2021-45078   | https://security-tracker.debian.org/tracker/CVE-2021-45078  
                      binutils | CVE-2022-38533   | https://security-tracker.debian.org/tracker/CVE-2022-38533  
                       bitcoin | CVE-2012-1909    | https://security-tracker.debian.org/tracker/CVE-2012-1909   
                       bitcoin | CVE-2012-4682    | https://security-tracker.debian.org/tracker/CVE-2012-4682   
                       bitcoin | CVE-2012-4683    | https://security-tracker.debian.org/tracker/CVE-2012-4683   
                       bitcoin | CVE-2013-2272    | https://security-tracker.debian.org/tracker/CVE-2013-2272   
                       bitcoin | CVE-2013-2273    | https://security-tracker.debian.org/tracker/CVE-2013-2273   
                       bitcoin | CVE-2013-2292    | https://security-tracker.debian.org/tracker/CVE-2013-2292   
                       bitcoin | CVE-2013-2293    | https://security-tracker.debian.org/tracker/CVE-2013-2293   
                       bitcoin | CVE-2013-3220    | https://security-tracker.debian.org/tracker/CVE-2013-3220   
                  bluez5_utils | CVE-2020-24490   | https://security-tracker.debian.org/tracker/CVE-2020-24490  
          bluez5_utils-headers | CVE-2020-24490   | https://security-tracker.debian.org/tracker/CVE-2020-24490  
                         botan | CVE-2022-43705   | https://security-tracker.debian.org/tracker/CVE-2022-43705  
                        bsdiff | CVE-2020-14315   | https://security-tracker.debian.org/tracker/CVE-2020-14315  
                         cairo | CVE-2019-6461    | https://security-tracker.debian.org/tracker/CVE-2019-6461   
                         cairo | CVE-2019-6462    | https://security-tracker.debian.org/tracker/CVE-2019-6462   
                         cairo | CVE-2020-35492   | https://security-tracker.debian.org/tracker/CVE-2020-35492  
                     capnproto | CVE-2022-46149   | https://security-tracker.debian.org/tracker/CVE-2022-46149  
                       connman | CVE-2022-32292   | https://security-tracker.debian.org/tracker/CVE-2022-32292  
                       connman | CVE-2022-32293   | https://security-tracker.debian.org/tracker/CVE-2022-32293  
                     coreutils | CVE-2016-2781    | https://security-tracker.debian.org/tracker/CVE-2016-2781   
                          cpio | CVE-2010-4226    | https://security-tracker.debian.org/tracker/CVE-2010-4226   
                      cryptopp | CVE-2021-43398   | https://security-tracker.debian.org/tracker/CVE-2021-43398  
                           cvs | CVE-2017-12836   | https://security-tracker.debian.org/tracker/CVE-2017-12836  
                       dnsmasq | CVE-2022-0934    | https://security-tracker.debian.org/tracker/CVE-2022-0934   
                        docker | CVE-2014-0048    | https://security-tracker.debian.org/tracker/CVE-2014-0048   
                        docker | CVE-2014-8178    | https://security-tracker.debian.org/tracker/CVE-2014-8178   
                        docker | CVE-2014-8179    | https://security-tracker.debian.org/tracker/CVE-2014-8179   
                        docker | CVE-2015-1843    | https://security-tracker.debian.org/tracker/CVE-2015-1843   
                        docker | CVE-2015-3627    | https://security-tracker.debian.org/tracker/CVE-2015-3627   
                        docker | CVE-2015-3630    | https://security-tracker.debian.org/tracker/CVE-2015-3630   
                        docker | CVE-2015-3631    | https://security-tracker.debian.org/tracker/CVE-2015-3631   
                        docker | CVE-2016-3697    | https://security-tracker.debian.org/tracker/CVE-2016-3697   
                        docker | CVE-2017-14992   | https://security-tracker.debian.org/tracker/CVE-2017-14992  
                        docker | CVE-2019-13139   | https://security-tracker.debian.org/tracker/CVE-2019-13139  
                        docker | CVE-2019-13509   | https://security-tracker.debian.org/tracker/CVE-2019-13509  
                        docker | CVE-2019-15752   | https://security-tracker.debian.org/tracker/CVE-2019-15752  
                        docker | CVE-2019-16884   | https://security-tracker.debian.org/tracker/CVE-2019-16884  
                        docker | CVE-2019-5736    | https://security-tracker.debian.org/tracker/CVE-2019-5736   
                        docker | CVE-2020-27534   | https://security-tracker.debian.org/tracker/CVE-2020-27534  
                        docker | CVE-2021-21284   | https://security-tracker.debian.org/tracker/CVE-2021-21284  
                        docker | CVE-2021-21285   | https://security-tracker.debian.org/tracker/CVE-2021-21285  
                        docker | CVE-2021-3162    | https://security-tracker.debian.org/tracker/CVE-2021-3162   
                        docker | CVE-2021-33183   | https://security-tracker.debian.org/tracker/CVE-2021-33183  
                        docker | CVE-2022-25365   | https://security-tracker.debian.org/tracker/CVE-2022-25365  
                      dropbear | CVE-2021-36369   | https://security-tracker.debian.org/tracker/CVE-2021-36369  
                          edk2 | CVE-2014-4859    | https://security-tracker.debian.org/tracker/CVE-2014-4859   
                          edk2 | CVE-2014-4860    | https://security-tracker.debian.org/tracker/CVE-2014-4860   
                          edk2 | CVE-2014-8271    | https://security-tracker.debian.org/tracker/CVE-2014-8271   
                          edk2 | CVE-2019-14553   | https://security-tracker.debian.org/tracker/CVE-2019-14553  
                          edk2 | CVE-2019-14559   | https://security-tracker.debian.org/tracker/CVE-2019-14559  
                          edk2 | CVE-2019-14562   | https://security-tracker.debian.org/tracker/CVE-2019-14562  
                          edk2 | CVE-2019-14563   | https://security-tracker.debian.org/tracker/CVE-2019-14563  
                          edk2 | CVE-2019-14575   | https://security-tracker.debian.org/tracker/CVE-2019-14575  
                          edk2 | CVE-2019-14586   | https://security-tracker.debian.org/tracker/CVE-2019-14586  
                          edk2 | CVE-2019-14587   | https://security-tracker.debian.org/tracker/CVE-2019-14587  
                         emlog | CVE-2021-44584   | https://security-tracker.debian.org/tracker/CVE-2021-44584  
                         emlog | CVE-2022-1526    | https://security-tracker.debian.org/tracker/CVE-2022-1526   
                         emlog | CVE-2022-3968    | https://security-tracker.debian.org/tracker/CVE-2022-3968   
                        erlang | CVE-2020-35733   | https://security-tracker.debian.org/tracker/CVE-2020-35733  
                        erlang | CVE-2022-37026   | https://security-tracker.debian.org/tracker/CVE-2022-37026  
                         exfat | CVE-2022-29973   | https://security-tracker.debian.org/tracker/CVE-2022-29973  
                         exiv2 | CVE-2007-6353    | https://security-tracker.debian.org/tracker/CVE-2007-6353   
                        ffmpeg | CVE-2021-38291   | https://security-tracker.debian.org/tracker/CVE-2021-38291  
                        ffmpeg | CVE-2022-3964    | https://security-tracker.debian.org/tracker/CVE-2022-3964   
                        ffmpeg | CVE-2022-3965    | https://security-tracker.debian.org/tracker/CVE-2022-3965   
                        giflib | CVE-2022-28506   | https://security-tracker.debian.org/tracker/CVE-2022-28506  
                           git | CVE-2022-24765   | https://security-tracker.debian.org/tracker/CVE-2022-24765  
                           git | CVE-2022-24975   | https://security-tracker.debian.org/tracker/CVE-2022-24975  
                         glibc | CVE-2010-4756    | https://security-tracker.debian.org/tracker/CVE-2010-4756   
                         glibc | CVE-2019-1010022 | https://security-tracker.debian.org/tracker/CVE-2019-1010022
                         glibc | CVE-2019-1010023 | https://security-tracker.debian.org/tracker/CVE-2019-1010023
                         glibc | CVE-2019-1010024 | https://security-tracker.debian.org/tracker/CVE-2019-1010024
                         glibc | CVE-2019-1010025 | https://security-tracker.debian.org/tracker/CVE-2019-1010025
                         glibc | CVE-2021-3998    | https://security-tracker.debian.org/tracker/CVE-2021-3998   
                         gnupg | CVE-2006-3082    | https://security-tracker.debian.org/tracker/CVE-2006-3082   
                         gnupg | CVE-2011-2207    | https://security-tracker.debian.org/tracker/CVE-2011-2207   
                         gnupg | CVE-2015-1606    | https://security-tracker.debian.org/tracker/CVE-2015-1606   
                         gnupg | CVE-2018-12020   | https://security-tracker.debian.org/tracker/CVE-2018-12020  
                         gnupg | CVE-2019-13050   | https://security-tracker.debian.org/tracker/CVE-2019-13050  
                         gnupg | CVE-2019-14855   | https://security-tracker.debian.org/tracker/CVE-2019-14855  
                         gnupg | CVE-2022-34903   | https://security-tracker.debian.org/tracker/CVE-2022-34903  
                            go | CVE-2020-29509   | https://security-tracker.debian.org/tracker/CVE-2020-29509  
                            go | CVE-2020-29511   | https://security-tracker.debian.org/tracker/CVE-2020-29511  
                graphicsmagick | CVE-2007-0770    | https://security-tracker.debian.org/tracker/CVE-2007-0770   
                graphicsmagick | CVE-2008-6621    | https://security-tracker.debian.org/tracker/CVE-2008-6621   
                     graphite2 | CVE-2017-5436    | https://security-tracker.debian.org/tracker/CVE-2017-5436   
                         grub2 | CVE-2021-3981    | https://security-tracker.debian.org/tracker/CVE-2021-3981   
                       haproxy | CVE-2016-2102    | https://security-tracker.debian.org/tracker/CVE-2016-2102   
                       haproxy | CVE-2022-0711    | https://security-tracker.debian.org/tracker/CVE-2022-0711   
                heirloom-mailx | CVE-2004-2771    | https://security-tracker.debian.org/tracker/CVE-2004-2771   
                   imagemagick | CVE-2007-1667    | https://security-tracker.debian.org/tracker/CVE-2007-1667   
                   imagemagick | CVE-2014-9804    | https://security-tracker.debian.org/tracker/CVE-2014-9804   
                   imagemagick | CVE-2014-9805    | https://security-tracker.debian.org/tracker/CVE-2014-9805   
                   imagemagick | CVE-2014-9806    | https://security-tracker.debian.org/tracker/CVE-2014-9806   
                   imagemagick | CVE-2014-9807    | https://security-tracker.debian.org/tracker/CVE-2014-9807   
                   imagemagick | CVE-2014-9808    | https://security-tracker.debian.org/tracker/CVE-2014-9808   
                   imagemagick | CVE-2014-9809    | https://security-tracker.debian.org/tracker/CVE-2014-9809   
                   imagemagick | CVE-2014-9810    | https://security-tracker.debian.org/tracker/CVE-2014-9810   
                   imagemagick | CVE-2014-9811    | https://security-tracker.debian.org/tracker/CVE-2014-9811   
                   imagemagick | CVE-2014-9812    | https://security-tracker.debian.org/tracker/CVE-2014-9812   
                   imagemagick | CVE-2014-9813    | https://security-tracker.debian.org/tracker/CVE-2014-9813   
                   imagemagick | CVE-2014-9814    | https://security-tracker.debian.org/tracker/CVE-2014-9814   
                   imagemagick | CVE-2014-9815    | https://security-tracker.debian.org/tracker/CVE-2014-9815   
                   imagemagick | CVE-2014-9816    | https://security-tracker.debian.org/tracker/CVE-2014-9816   
                   imagemagick | CVE-2014-9817    | https://security-tracker.debian.org/tracker/CVE-2014-9817   
                   imagemagick | CVE-2014-9818    | https://security-tracker.debian.org/tracker/CVE-2014-9818   
                   imagemagick | CVE-2014-9819    | https://security-tracker.debian.org/tracker/CVE-2014-9819   
                   imagemagick | CVE-2014-9820    | https://security-tracker.debian.org/tracker/CVE-2014-9820   
                   imagemagick | CVE-2014-9821    | https://security-tracker.debian.org/tracker/CVE-2014-9821   
                   imagemagick | CVE-2014-9822    | https://security-tracker.debian.org/tracker/CVE-2014-9822   
                   imagemagick | CVE-2014-9823    | https://security-tracker.debian.org/tracker/CVE-2014-9823   
                   imagemagick | CVE-2014-9824    | https://security-tracker.debian.org/tracker/CVE-2014-9824   
                   imagemagick | CVE-2014-9825    | https://security-tracker.debian.org/tracker/CVE-2014-9825   
                   imagemagick | CVE-2014-9826    | https://security-tracker.debian.org/tracker/CVE-2014-9826   
                   imagemagick | CVE-2014-9827    | https://security-tracker.debian.org/tracker/CVE-2014-9827   
                   imagemagick | CVE-2014-9828    | https://security-tracker.debian.org/tracker/CVE-2014-9828   
                   imagemagick | CVE-2014-9829    | https://security-tracker.debian.org/tracker/CVE-2014-9829   
                   imagemagick | CVE-2014-9830    | https://security-tracker.debian.org/tracker/CVE-2014-9830   
                   imagemagick | CVE-2014-9831    | https://security-tracker.debian.org/tracker/CVE-2014-9831   
                   imagemagick | CVE-2014-9848    | https://security-tracker.debian.org/tracker/CVE-2014-9848   
                   imagemagick | CVE-2014-9852    | https://security-tracker.debian.org/tracker/CVE-2014-9852   
                   imagemagick | CVE-2014-9853    | https://security-tracker.debian.org/tracker/CVE-2014-9853   
                   imagemagick | CVE-2014-9854    | https://security-tracker.debian.org/tracker/CVE-2014-9854   
                   imagemagick | CVE-2014-9907    | https://security-tracker.debian.org/tracker/CVE-2014-9907   
                   imagemagick | CVE-2016-10062   | https://security-tracker.debian.org/tracker/CVE-2016-10062  
                   imagemagick | CVE-2016-10144   | https://security-tracker.debian.org/tracker/CVE-2016-10144  
                   imagemagick | CVE-2016-10145   | https://security-tracker.debian.org/tracker/CVE-2016-10145  
                   imagemagick | CVE-2016-10146   | https://security-tracker.debian.org/tracker/CVE-2016-10146  
                   imagemagick | CVE-2016-7513    | https://security-tracker.debian.org/tracker/CVE-2016-7513   
                   imagemagick | CVE-2016-7514    | https://security-tracker.debian.org/tracker/CVE-2016-7514   
                   imagemagick | CVE-2016-7515    | https://security-tracker.debian.org/tracker/CVE-2016-7515   
                   imagemagick | CVE-2016-7516    | https://security-tracker.debian.org/tracker/CVE-2016-7516   
                   imagemagick | CVE-2016-7517    | https://security-tracker.debian.org/tracker/CVE-2016-7517   
                   imagemagick | CVE-2016-7518    | https://security-tracker.debian.org/tracker/CVE-2016-7518   
                   imagemagick | CVE-2016-7519    | https://security-tracker.debian.org/tracker/CVE-2016-7519   
                   imagemagick | CVE-2016-7520    | https://security-tracker.debian.org/tracker/CVE-2016-7520   
                   imagemagick | CVE-2016-7521    | https://security-tracker.debian.org/tracker/CVE-2016-7521   
                   imagemagick | CVE-2016-7522    | https://security-tracker.debian.org/tracker/CVE-2016-7522   
                   imagemagick | CVE-2016-7523    | https://security-tracker.debian.org/tracker/CVE-2016-7523   
                   imagemagick | CVE-2016-7524    | https://security-tracker.debian.org/tracker/CVE-2016-7524   
                   imagemagick | CVE-2016-7525    | https://security-tracker.debian.org/tracker/CVE-2016-7525   
                   imagemagick | CVE-2016-7526    | https://security-tracker.debian.org/tracker/CVE-2016-7526   
                   imagemagick | CVE-2016-7527    | https://security-tracker.debian.org/tracker/CVE-2016-7527   
                   imagemagick | CVE-2016-7528    | https://security-tracker.debian.org/tracker/CVE-2016-7528   
                   imagemagick | CVE-2016-7529    | https://security-tracker.debian.org/tracker/CVE-2016-7529   
                   imagemagick | CVE-2016-7530    | https://security-tracker.debian.org/tracker/CVE-2016-7530   
                   imagemagick | CVE-2016-7531    | https://security-tracker.debian.org/tracker/CVE-2016-7531   
                   imagemagick | CVE-2016-7532    | https://security-tracker.debian.org/tracker/CVE-2016-7532   
                   imagemagick | CVE-2016-7533    | https://security-tracker.debian.org/tracker/CVE-2016-7533   
                   imagemagick | CVE-2016-7534    | https://security-tracker.debian.org/tracker/CVE-2016-7534   
                   imagemagick | CVE-2016-7535    | https://security-tracker.debian.org/tracker/CVE-2016-7535   
                   imagemagick | CVE-2016-7536    | https://security-tracker.debian.org/tracker/CVE-2016-7536   
                   imagemagick | CVE-2016-7537    | https://security-tracker.debian.org/tracker/CVE-2016-7537   
                   imagemagick | CVE-2016-7538    | https://security-tracker.debian.org/tracker/CVE-2016-7538   
                   imagemagick | CVE-2017-5506    | https://security-tracker.debian.org/tracker/CVE-2017-5506   
                   imagemagick | CVE-2017-5509    | https://security-tracker.debian.org/tracker/CVE-2017-5509   
                   imagemagick | CVE-2017-5510    | https://security-tracker.debian.org/tracker/CVE-2017-5510   
                   imagemagick | CVE-2017-5511    | https://security-tracker.debian.org/tracker/CVE-2017-5511   
                        jasper | CVE-2015-8751    | https://security-tracker.debian.org/tracker/CVE-2015-8751   
                         jhead | CVE-2022-41751   | https://security-tracker.debian.org/tracker/CVE-2022-41751  
                        jquery | CVE-2007-2379    | https://security-tracker.debian.org/tracker/CVE-2007-2379   
                         libao | CVE-2017-11548   | https://security-tracker.debian.org/tracker/CVE-2017-11548  
                        libbpf | CVE-2021-45940   | https://security-tracker.debian.org/tracker/CVE-2021-45940  
                        libbpf | CVE-2021-45941   | https://security-tracker.debian.org/tracker/CVE-2021-45941  
                  libfreeimage | CVE-2019-12211   | https://security-tracker.debian.org/tracker/CVE-2019-12211  
                  libfreeimage | CVE-2019-12212   | https://security-tracker.debian.org/tracker/CVE-2019-12212  
                  libfreeimage | CVE-2019-12213   | https://security-tracker.debian.org/tracker/CVE-2019-12213  
                  libfreeimage | CVE-2019-12214   | https://security-tracker.debian.org/tracker/CVE-2019-12214  
                     libiberty | CVE-2012-3509    | https://security-tracker.debian.org/tracker/CVE-2012-3509   
                     libiberty | CVE-2016-2226    | https://security-tracker.debian.org/tracker/CVE-2016-2226   
                     libiberty | CVE-2016-4487    | https://security-tracker.debian.org/tracker/CVE-2016-4487   
                     libiberty | CVE-2016-4488    | https://security-tracker.debian.org/tracker/CVE-2016-4488   
                     libiberty | CVE-2016-4489    | https://security-tracker.debian.org/tracker/CVE-2016-4489   
                     libiberty | CVE-2016-4490    | https://security-tracker.debian.org/tracker/CVE-2016-4490   
                     libiberty | CVE-2016-4491    | https://security-tracker.debian.org/tracker/CVE-2016-4491   
                     libiberty | CVE-2016-4492    | https://security-tracker.debian.org/tracker/CVE-2016-4492   
                     libiberty | CVE-2016-4493    | https://security-tracker.debian.org/tracker/CVE-2016-4493   
                     libiberty | CVE-2016-6131    | https://security-tracker.debian.org/tracker/CVE-2016-6131   
                       libkrb5 | CVE-1999-0143    | https://security-tracker.debian.org/tracker/CVE-1999-0143   
                       libkrb5 | CVE-1999-0713    | https://security-tracker.debian.org/tracker/CVE-1999-0713   
                       libkrb5 | CVE-2007-3149    | https://security-tracker.debian.org/tracker/CVE-2007-3149   
                       libkrb5 | CVE-2007-5894    | https://security-tracker.debian.org/tracker/CVE-2007-5894   
                       libkrb5 | CVE-2007-5902    | https://security-tracker.debian.org/tracker/CVE-2007-5902   
                       libkrb5 | CVE-2009-0844    | https://security-tracker.debian.org/tracker/CVE-2009-0844   
                       libkrb5 | CVE-2009-0846    | https://security-tracker.debian.org/tracker/CVE-2009-0846   
                        libmad | CVE-2018-7263    | https://security-tracker.debian.org/tracker/CVE-2018-7263   
                      libmpeg2 | CVE-2022-37416   | https://security-tracker.debian.org/tracker/CVE-2022-37416  
                      libplist | CVE-2017-5834    | https://security-tracker.debian.org/tracker/CVE-2017-5834   
                      libplist | CVE-2017-5835    | https://security-tracker.debian.org/tracker/CVE-2017-5835   
                      libplist | CVE-2017-5836    | https://security-tracker.debian.org/tracker/CVE-2017-5836   
                        libraw | CVE-2020-35530   | https://security-tracker.debian.org/tracker/CVE-2020-35530  
                        libraw | CVE-2020-35531   | https://security-tracker.debian.org/tracker/CVE-2020-35531  
                        libraw | CVE-2020-35532   | https://security-tracker.debian.org/tracker/CVE-2020-35532  
                        libraw | CVE-2020-35533   | https://security-tracker.debian.org/tracker/CVE-2020-35533  
                        libraw | CVE-2020-35534   | https://security-tracker.debian.org/tracker/CVE-2020-35534  
                        libraw | CVE-2020-35535   | https://security-tracker.debian.org/tracker/CVE-2020-35535  
                    libtorrent | CVE-2009-1760    | https://security-tracker.debian.org/tracker/CVE-2009-1760   
                    libtorrent | CVE-2016-5301    | https://security-tracker.debian.org/tracker/CVE-2016-5301   
                       libvirt | CVE-2014-8135    | https://security-tracker.debian.org/tracker/CVE-2014-8135   
                       libvirt | CVE-2014-8136    | https://security-tracker.debian.org/tracker/CVE-2014-8136   
                       libvirt | CVE-2015-5313    | https://security-tracker.debian.org/tracker/CVE-2015-5313   
                       libvirt | CVE-2018-5748    | https://security-tracker.debian.org/tracker/CVE-2018-5748   
                       libvirt | CVE-2018-6764    | https://security-tracker.debian.org/tracker/CVE-2018-6764   
                       libxslt | CVE-2022-29824   | https://security-tracker.debian.org/tracker/CVE-2022-29824  
                      lighttpd | CVE-2022-41556   | https://security-tracker.debian.org/tracker/CVE-2022-41556  
                     linux-pam | CVE-2022-28321   | https://security-tracker.debian.org/tracker/CVE-2022-28321  
                         lrzip | CVE-2022-33067   | https://security-tracker.debian.org/tracker/CVE-2022-33067  
                         lrzsz | CVE-2018-10195   | https://security-tracker.debian.org/tracker/CVE-2018-10195  
                           lua | CVE-2014-5461    | https://security-tracker.debian.org/tracker/CVE-2014-5461   
                           lua | CVE-2020-15888   | https://security-tracker.debian.org/tracker/CVE-2020-15888  
                           lua | CVE-2020-15945   | https://security-tracker.debian.org/tracker/CVE-2020-15945  
                           lua | CVE-2021-43519   | https://security-tracker.debian.org/tracker/CVE-2021-43519  
                       mbedtls | CVE-2021-45450   | https://security-tracker.debian.org/tracker/CVE-2021-45450  
                       mbedtls | CVE-2021-45451   | https://security-tracker.debian.org/tracker/CVE-2021-45451  
                        mender | CVE-2022-29555   | https://security-tracker.debian.org/tracker/CVE-2022-29555  
                      minetest | CVE-2022-35978   | https://security-tracker.debian.org/tracker/CVE-2022-35978  
                       mongodb | CVE-2014-8180    | https://security-tracker.debian.org/tracker/CVE-2014-8180   
                       mongodb | CVE-2017-18381   | https://security-tracker.debian.org/tracker/CVE-2017-18381  
                       mongodb | CVE-2017-2665    | https://security-tracker.debian.org/tracker/CVE-2017-2665   
                          mutt | CVE-2011-1429    | https://security-tracker.debian.org/tracker/CVE-2011-1429   
                          nasm | CVE-2020-18974   | https://security-tracker.debian.org/tracker/CVE-2020-18974  
                       ncurses | CVE-2021-39537   | https://security-tracker.debian.org/tracker/CVE-2021-39537  
                       ncurses | CVE-2022-29458   | https://security-tracker.debian.org/tracker/CVE-2022-29458  
                      netatalk | CVE-2022-45188   | https://security-tracker.debian.org/tracker/CVE-2022-45188  
                       netsnmp | CVE-2022-44792   | https://security-tracker.debian.org/tracker/CVE-2022-44792  
                       netsnmp | CVE-2022-44793   | https://security-tracker.debian.org/tracker/CVE-2022-44793  
                         nginx | CVE-2021-3618    | https://security-tracker.debian.org/tracker/CVE-2021-3618   
                        nodejs | CVE-2022-35256   | https://security-tracker.debian.org/tracker/CVE-2022-35256  
                        nodejs | CVE-2022-43548   | https://security-tracker.debian.org/tracker/CVE-2022-43548  
                           ntp | CVE-2014-9750    | https://security-tracker.debian.org/tracker/CVE-2014-9750   
                           ntp | CVE-2014-9751    | https://security-tracker.debian.org/tracker/CVE-2014-9751   
                           ntp | CVE-2015-7691    | https://security-tracker.debian.org/tracker/CVE-2015-7691   
                           ntp | CVE-2015-7692    | https://security-tracker.debian.org/tracker/CVE-2015-7692   
                           ntp | CVE-2015-7701    | https://security-tracker.debian.org/tracker/CVE-2015-7701   
                           ntp | CVE-2015-7702    | https://security-tracker.debian.org/tracker/CVE-2015-7702   
                           ntp | CVE-2015-7703    | https://security-tracker.debian.org/tracker/CVE-2015-7703   
                           ntp | CVE-2015-7704    | https://security-tracker.debian.org/tracker/CVE-2015-7704   
                           ntp | CVE-2015-7705    | https://security-tracker.debian.org/tracker/CVE-2015-7705   
                           ntp | CVE-2015-7849    | https://security-tracker.debian.org/tracker/CVE-2015-7849   
                           ntp | CVE-2015-7850    | https://security-tracker.debian.org/tracker/CVE-2015-7850   
                           ntp | CVE-2015-7852    | https://security-tracker.debian.org/tracker/CVE-2015-7852   
                           ntp | CVE-2015-7853    | https://security-tracker.debian.org/tracker/CVE-2015-7853   
                           ntp | CVE-2015-7854    | https://security-tracker.debian.org/tracker/CVE-2015-7854   
                           ntp | CVE-2015-7855    | https://security-tracker.debian.org/tracker/CVE-2015-7855   
                           ntp | CVE-2015-7973    | https://security-tracker.debian.org/tracker/CVE-2015-7973   
                           ntp | CVE-2015-7974    | https://security-tracker.debian.org/tracker/CVE-2015-7974   
                           ntp | CVE-2015-7977    | https://security-tracker.debian.org/tracker/CVE-2015-7977   
                           ntp | CVE-2016-2518    | https://security-tracker.debian.org/tracker/CVE-2016-2518   
                           ntp | CVE-2016-4953    | https://security-tracker.debian.org/tracker/CVE-2016-4953   
                           ntp | CVE-2016-4954    | https://security-tracker.debian.org/tracker/CVE-2016-4954   
                           ntp | CVE-2016-4955    | https://security-tracker.debian.org/tracker/CVE-2016-4955   
                           ntp | CVE-2016-4956    | https://security-tracker.debian.org/tracker/CVE-2016-4956   
                           ntp | CVE-2016-7426    | https://security-tracker.debian.org/tracker/CVE-2016-7426   
                           ntp | CVE-2016-7434    | https://security-tracker.debian.org/tracker/CVE-2016-7434   
                           ntp | CVE-2017-6458    | https://security-tracker.debian.org/tracker/CVE-2017-6458   
                           ntp | CVE-2018-7170    | https://security-tracker.debian.org/tracker/CVE-2018-7170   
                           ntp | CVE-2018-7185    | https://security-tracker.debian.org/tracker/CVE-2018-7185   
                           ntp | CVE-2019-11331   | https://security-tracker.debian.org/tracker/CVE-2019-11331  
                           ntp | CVE-2019-8936    | https://security-tracker.debian.org/tracker/CVE-2019-8936   
                           ntp | CVE-2020-11868   | https://security-tracker.debian.org/tracker/CVE-2020-11868  
                           ntp | CVE-2020-13817   | https://security-tracker.debian.org/tracker/CVE-2020-13817  
                       opencv3 | CVE-2019-14493   | https://security-tracker.debian.org/tracker/CVE-2019-14493  
                       opencv3 | CVE-2019-15939   | https://security-tracker.debian.org/tracker/CVE-2019-15939  
                       opencv3 | CVE-2019-19624   | https://security-tracker.debian.org/tracker/CVE-2019-19624  
                       openjdk | CVE-2009-2475    | https://security-tracker.debian.org/tracker/CVE-2009-2475   
                       openjdk | CVE-2009-2476    | https://security-tracker.debian.org/tracker/CVE-2009-2476   
                       openjdk | CVE-2009-2689    | https://security-tracker.debian.org/tracker/CVE-2009-2689   
                       openjdk | CVE-2009-2690    | https://security-tracker.debian.org/tracker/CVE-2009-2690   
                       openjdk | CVE-2009-3728    | https://security-tracker.debian.org/tracker/CVE-2009-3728   
                       openjdk | CVE-2009-3879    | https://security-tracker.debian.org/tracker/CVE-2009-3879   
                       openjdk | CVE-2009-3880    | https://security-tracker.debian.org/tracker/CVE-2009-3880   
                       openjdk | CVE-2009-3881    | https://security-tracker.debian.org/tracker/CVE-2009-3881   
                       openjdk | CVE-2009-3882    | https://security-tracker.debian.org/tracker/CVE-2009-3882   
                       openjdk | CVE-2009-3883    | https://security-tracker.debian.org/tracker/CVE-2009-3883   
                       openjdk | CVE-2009-3884    | https://security-tracker.debian.org/tracker/CVE-2009-3884   
                       openjdk | CVE-2013-0169    | https://security-tracker.debian.org/tracker/CVE-2013-0169   
                       openjdk | CVE-2022-21540   | https://security-tracker.debian.org/tracker/CVE-2022-21540  
                       openjdk | CVE-2022-21541   | https://security-tracker.debian.org/tracker/CVE-2022-21541  
                       openjdk | CVE-2022-34169   | https://security-tracker.debian.org/tracker/CVE-2022-34169  
                      openjpeg | CVE-2015-1239    | https://security-tracker.debian.org/tracker/CVE-2015-1239   
                      openjpeg | CVE-2016-9675    | https://security-tracker.debian.org/tracker/CVE-2016-9675   
                      openldap | CVE-2015-3276    | https://security-tracker.debian.org/tracker/CVE-2015-3276   
                      openldap | CVE-2022-29155   | https://security-tracker.debian.org/tracker/CVE-2022-29155  
                       openssh | CVE-2007-2768    | https://security-tracker.debian.org/tracker/CVE-2007-2768   
                       openssh | CVE-2008-3844    | https://security-tracker.debian.org/tracker/CVE-2008-3844   
                       openssh | CVE-2014-9278    | https://security-tracker.debian.org/tracker/CVE-2014-9278   
                      openswan | CVE-2019-10155   | https://security-tracker.debian.org/tracker/CVE-2019-10155  
                   openvmtools | CVE-2014-4199    | https://security-tracker.debian.org/tracker/CVE-2014-4199   
                   openvmtools | CVE-2014-4200    | https://security-tracker.debian.org/tracker/CVE-2014-4200   
                   openvmtools | CVE-2021-31693   | https://security-tracker.debian.org/tracker/CVE-2021-31693  
                   openvmtools | CVE-2022-22943   | https://security-tracker.debian.org/tracker/CVE-2022-22943  
                          opus | CVE-2022-25345   | https://security-tracker.debian.org/tracker/CVE-2022-25345  
                  oracle-mysql | CVE-2012-0583    | https://security-tracker.debian.org/tracker/CVE-2012-0583   
                  oracle-mysql | CVE-2012-1696    | https://security-tracker.debian.org/tracker/CVE-2012-1696   
                  oracle-mysql | CVE-2012-3144    | https://security-tracker.debian.org/tracker/CVE-2012-3144   
                  oracle-mysql | CVE-2012-3147    | https://security-tracker.debian.org/tracker/CVE-2012-3147   
                  oracle-mysql | CVE-2012-3149    | https://security-tracker.debian.org/tracker/CVE-2012-3149   
                  oracle-mysql | CVE-2012-3156    | https://security-tracker.debian.org/tracker/CVE-2012-3156   
                  oracle-mysql | CVE-2012-4414    | https://security-tracker.debian.org/tracker/CVE-2012-4414   
                  oracle-mysql | CVE-2013-1566    | https://security-tracker.debian.org/tracker/CVE-2013-1566   
                  oracle-mysql | CVE-2013-1567    | https://security-tracker.debian.org/tracker/CVE-2013-1567   
                  oracle-mysql | CVE-2013-1570    | https://security-tracker.debian.org/tracker/CVE-2013-1570   
                  oracle-mysql | CVE-2013-2381    | https://security-tracker.debian.org/tracker/CVE-2013-2381   
                  oracle-mysql | CVE-2013-2395    | https://security-tracker.debian.org/tracker/CVE-2013-2395   
                  oracle-mysql | CVE-2013-3795    | https://security-tracker.debian.org/tracker/CVE-2013-3795   
                  oracle-mysql | CVE-2013-3796    | https://security-tracker.debian.org/tracker/CVE-2013-3796   
                  oracle-mysql | CVE-2013-3798    | https://security-tracker.debian.org/tracker/CVE-2013-3798   
                  oracle-mysql | CVE-2013-3806    | https://security-tracker.debian.org/tracker/CVE-2013-3806   
                  oracle-mysql | CVE-2013-3807    | https://security-tracker.debian.org/tracker/CVE-2013-3807   
                  oracle-mysql | CVE-2013-3810    | https://security-tracker.debian.org/tracker/CVE-2013-3810   
                  oracle-mysql | CVE-2013-3811    | https://security-tracker.debian.org/tracker/CVE-2013-3811   
                  oracle-mysql | CVE-2013-5767    | https://security-tracker.debian.org/tracker/CVE-2013-5767   
                  oracle-mysql | CVE-2013-5770    | https://security-tracker.debian.org/tracker/CVE-2013-5770   
                  oracle-mysql | CVE-2013-5786    | https://security-tracker.debian.org/tracker/CVE-2013-5786   
                  oracle-mysql | CVE-2013-5793    | https://security-tracker.debian.org/tracker/CVE-2013-5793   
                  oracle-mysql | CVE-2013-5860    | https://security-tracker.debian.org/tracker/CVE-2013-5860   
                  oracle-mysql | CVE-2013-5881    | https://security-tracker.debian.org/tracker/CVE-2013-5881   
                  oracle-mysql | CVE-2013-5882    | https://security-tracker.debian.org/tracker/CVE-2013-5882   
                  oracle-mysql | CVE-2013-5894    | https://security-tracker.debian.org/tracker/CVE-2013-5894   
                  oracle-mysql | CVE-2014-0427    | https://security-tracker.debian.org/tracker/CVE-2014-0427   
                  oracle-mysql | CVE-2014-0430    | https://security-tracker.debian.org/tracker/CVE-2014-0430   
                  oracle-mysql | CVE-2014-0431    | https://security-tracker.debian.org/tracker/CVE-2014-0431   
                  oracle-mysql | CVE-2014-0433    | https://security-tracker.debian.org/tracker/CVE-2014-0433   
                  oracle-mysql | CVE-2014-2434    | https://security-tracker.debian.org/tracker/CVE-2014-2434   
                  oracle-mysql | CVE-2014-2435    | https://security-tracker.debian.org/tracker/CVE-2014-2435   
                  oracle-mysql | CVE-2014-2442    | https://security-tracker.debian.org/tracker/CVE-2014-2442   
                  oracle-mysql | CVE-2014-2444    | https://security-tracker.debian.org/tracker/CVE-2014-2444   
                  oracle-mysql | CVE-2014-2450    | https://security-tracker.debian.org/tracker/CVE-2014-2450   
                  oracle-mysql | CVE-2014-2451    | https://security-tracker.debian.org/tracker/CVE-2014-2451   
                  oracle-mysql | CVE-2014-2484    | https://security-tracker.debian.org/tracker/CVE-2014-2484   
                  oracle-mysql | CVE-2014-4214    | https://security-tracker.debian.org/tracker/CVE-2014-4214   
                  oracle-mysql | CVE-2014-4233    | https://security-tracker.debian.org/tracker/CVE-2014-4233   
                  oracle-mysql | CVE-2014-4238    | https://security-tracker.debian.org/tracker/CVE-2014-4238   
                  oracle-mysql | CVE-2014-4240    | https://security-tracker.debian.org/tracker/CVE-2014-4240   
                  oracle-mysql | CVE-2015-0385    | https://security-tracker.debian.org/tracker/CVE-2015-0385   
                  oracle-mysql | CVE-2015-0405    | https://security-tracker.debian.org/tracker/CVE-2015-0405   
                  oracle-mysql | CVE-2015-0409    | https://security-tracker.debian.org/tracker/CVE-2015-0409   
                  oracle-mysql | CVE-2015-0423    | https://security-tracker.debian.org/tracker/CVE-2015-0423   
                  oracle-mysql | CVE-2015-0438    | https://security-tracker.debian.org/tracker/CVE-2015-0438   
                  oracle-mysql | CVE-2015-0439    | https://security-tracker.debian.org/tracker/CVE-2015-0439   
                  oracle-mysql | CVE-2015-0498    | https://security-tracker.debian.org/tracker/CVE-2015-0498   
                  oracle-mysql | CVE-2015-0500    | https://security-tracker.debian.org/tracker/CVE-2015-0500   
                  oracle-mysql | CVE-2015-0503    | https://security-tracker.debian.org/tracker/CVE-2015-0503   
                  oracle-mysql | CVE-2015-0506    | https://security-tracker.debian.org/tracker/CVE-2015-0506   
                  oracle-mysql | CVE-2015-0507    | https://security-tracker.debian.org/tracker/CVE-2015-0507   
                  oracle-mysql | CVE-2015-0508    | https://security-tracker.debian.org/tracker/CVE-2015-0508   
                  oracle-mysql | CVE-2015-0511    | https://security-tracker.debian.org/tracker/CVE-2015-0511   
                  oracle-mysql | CVE-2015-2566    | https://security-tracker.debian.org/tracker/CVE-2015-2566   
                  oracle-mysql | CVE-2015-2567    | https://security-tracker.debian.org/tracker/CVE-2015-2567   
                  oracle-mysql | CVE-2015-2611    | https://security-tracker.debian.org/tracker/CVE-2015-2611   
                  oracle-mysql | CVE-2015-2617    | https://security-tracker.debian.org/tracker/CVE-2015-2617   
                  oracle-mysql | CVE-2015-2639    | https://security-tracker.debian.org/tracker/CVE-2015-2639   
                  oracle-mysql | CVE-2015-2641    | https://security-tracker.debian.org/tracker/CVE-2015-2641   
                  oracle-mysql | CVE-2015-2661    | https://security-tracker.debian.org/tracker/CVE-2015-2661   
                  oracle-mysql | CVE-2015-3152    | https://security-tracker.debian.org/tracker/CVE-2015-3152   
                  oracle-mysql | CVE-2015-4730    | https://security-tracker.debian.org/tracker/CVE-2015-4730   
                  oracle-mysql | CVE-2015-4756    | https://security-tracker.debian.org/tracker/CVE-2015-4756   
                  oracle-mysql | CVE-2015-4761    | https://security-tracker.debian.org/tracker/CVE-2015-4761   
                  oracle-mysql | CVE-2015-4766    | https://security-tracker.debian.org/tracker/CVE-2015-4766   
                  oracle-mysql | CVE-2015-4767    | https://security-tracker.debian.org/tracker/CVE-2015-4767   
                  oracle-mysql | CVE-2015-4769    | https://security-tracker.debian.org/tracker/CVE-2015-4769   
                  oracle-mysql | CVE-2015-4771    | https://security-tracker.debian.org/tracker/CVE-2015-4771   
                  oracle-mysql | CVE-2015-4772    | https://security-tracker.debian.org/tracker/CVE-2015-4772   
                  oracle-mysql | CVE-2015-4791    | https://security-tracker.debian.org/tracker/CVE-2015-4791   
                  oracle-mysql | CVE-2015-4800    | https://security-tracker.debian.org/tracker/CVE-2015-4800   
                  oracle-mysql | CVE-2015-4833    | https://security-tracker.debian.org/tracker/CVE-2015-4833   
                  oracle-mysql | CVE-2015-4862    | https://security-tracker.debian.org/tracker/CVE-2015-4862   
                  oracle-mysql | CVE-2015-4890    | https://security-tracker.debian.org/tracker/CVE-2015-4890   
                  oracle-mysql | CVE-2015-4904    | https://security-tracker.debian.org/tracker/CVE-2015-4904   
                  oracle-mysql | CVE-2015-4905    | https://security-tracker.debian.org/tracker/CVE-2015-4905   
                  oracle-mysql | CVE-2015-4910    | https://security-tracker.debian.org/tracker/CVE-2015-4910   
                  oracle-mysql | CVE-2016-0503    | https://security-tracker.debian.org/tracker/CVE-2016-0503   
                  oracle-mysql | CVE-2016-0504    | https://security-tracker.debian.org/tracker/CVE-2016-0504   
                  oracle-mysql | CVE-2016-0594    | https://security-tracker.debian.org/tracker/CVE-2016-0594   
                  oracle-mysql | CVE-2016-0595    | https://security-tracker.debian.org/tracker/CVE-2016-0595   
                  oracle-mysql | CVE-2016-0607    | https://security-tracker.debian.org/tracker/CVE-2016-0607   
                  oracle-mysql | CVE-2016-0610    | https://security-tracker.debian.org/tracker/CVE-2016-0610   
                  oracle-mysql | CVE-2016-0611    | https://security-tracker.debian.org/tracker/CVE-2016-0611   
                  oracle-mysql | CVE-2016-0616    | https://security-tracker.debian.org/tracker/CVE-2016-0616   
                  oracle-mysql | CVE-2016-0652    | https://security-tracker.debian.org/tracker/CVE-2016-0652   
                  oracle-mysql | CVE-2016-0653    | https://security-tracker.debian.org/tracker/CVE-2016-0653   
                  oracle-mysql | CVE-2016-0654    | https://security-tracker.debian.org/tracker/CVE-2016-0654   
                  oracle-mysql | CVE-2016-0656    | https://security-tracker.debian.org/tracker/CVE-2016-0656   
                  oracle-mysql | CVE-2016-0657    | https://security-tracker.debian.org/tracker/CVE-2016-0657   
                  oracle-mysql | CVE-2016-0658    | https://security-tracker.debian.org/tracker/CVE-2016-0658   
                  oracle-mysql | CVE-2016-0659    | https://security-tracker.debian.org/tracker/CVE-2016-0659   
                  oracle-mysql | CVE-2016-0662    | https://security-tracker.debian.org/tracker/CVE-2016-0662   
                  oracle-mysql | CVE-2016-0663    | https://security-tracker.debian.org/tracker/CVE-2016-0663   
                  oracle-mysql | CVE-2016-0667    | https://security-tracker.debian.org/tracker/CVE-2016-0667   
                  oracle-mysql | CVE-2016-3424    | https://security-tracker.debian.org/tracker/CVE-2016-3424   
                  oracle-mysql | CVE-2016-3440    | https://security-tracker.debian.org/tracker/CVE-2016-3440   
                  oracle-mysql | CVE-2016-3518    | https://security-tracker.debian.org/tracker/CVE-2016-3518   
                  oracle-mysql | CVE-2016-3588    | https://security-tracker.debian.org/tracker/CVE-2016-3588   
                  oracle-mysql | CVE-2016-5436    | https://security-tracker.debian.org/tracker/CVE-2016-5436   
                  oracle-mysql | CVE-2016-5437    | https://security-tracker.debian.org/tracker/CVE-2016-5437   
                  oracle-mysql | CVE-2016-5441    | https://security-tracker.debian.org/tracker/CVE-2016-5441   
                  oracle-mysql | CVE-2016-5442    | https://security-tracker.debian.org/tracker/CVE-2016-5442   
                  oracle-mysql | CVE-2016-5443    | https://security-tracker.debian.org/tracker/CVE-2016-5443   
                  oracle-mysql | CVE-2016-5628    | https://security-tracker.debian.org/tracker/CVE-2016-5628   
                  oracle-mysql | CVE-2016-5631    | https://security-tracker.debian.org/tracker/CVE-2016-5631   
                  oracle-mysql | CVE-2016-5632    | https://security-tracker.debian.org/tracker/CVE-2016-5632   
                  oracle-mysql | CVE-2016-5633    | https://security-tracker.debian.org/tracker/CVE-2016-5633   
                  oracle-mysql | CVE-2016-5634    | https://security-tracker.debian.org/tracker/CVE-2016-5634   
                  oracle-mysql | CVE-2016-5635    | https://security-tracker.debian.org/tracker/CVE-2016-5635   
                  oracle-mysql | CVE-2016-8286    | https://security-tracker.debian.org/tracker/CVE-2016-8286   
                  oracle-mysql | CVE-2016-8287    | https://security-tracker.debian.org/tracker/CVE-2016-8287   
                  oracle-mysql | CVE-2016-8289    | https://security-tracker.debian.org/tracker/CVE-2016-8289   
                  oracle-mysql | CVE-2016-8290    | https://security-tracker.debian.org/tracker/CVE-2016-8290   
                  oracle-mysql | CVE-2017-10165   | https://security-tracker.debian.org/tracker/CVE-2017-10165  
                  oracle-mysql | CVE-2017-10167   | https://security-tracker.debian.org/tracker/CVE-2017-10167  
                  oracle-mysql | CVE-2017-10284   | https://security-tracker.debian.org/tracker/CVE-2017-10284  
                  oracle-mysql | CVE-2017-10296   | https://security-tracker.debian.org/tracker/CVE-2017-10296  
                  oracle-mysql | CVE-2017-10311   | https://security-tracker.debian.org/tracker/CVE-2017-10311  
                  oracle-mysql | CVE-2017-10313   | https://security-tracker.debian.org/tracker/CVE-2017-10313  
                  oracle-mysql | CVE-2017-3251    | https://security-tracker.debian.org/tracker/CVE-2017-3251   
                  oracle-mysql | CVE-2017-3256    | https://security-tracker.debian.org/tracker/CVE-2017-3256   
                  oracle-mysql | CVE-2017-3319    | https://security-tracker.debian.org/tracker/CVE-2017-3319   
                  oracle-mysql | CVE-2017-3320    | https://security-tracker.debian.org/tracker/CVE-2017-3320   
                  oracle-mysql | CVE-2017-3452    | https://security-tracker.debian.org/tracker/CVE-2017-3452   
                  oracle-mysql | CVE-2017-3454    | https://security-tracker.debian.org/tracker/CVE-2017-3454   
                  oracle-mysql | CVE-2017-3455    | https://security-tracker.debian.org/tracker/CVE-2017-3455   
                  oracle-mysql | CVE-2017-3457    | https://security-tracker.debian.org/tracker/CVE-2017-3457   
                  oracle-mysql | CVE-2017-3458    | https://security-tracker.debian.org/tracker/CVE-2017-3458   
                  oracle-mysql | CVE-2017-3459    | https://security-tracker.debian.org/tracker/CVE-2017-3459   
                  oracle-mysql | CVE-2017-3460    | https://security-tracker.debian.org/tracker/CVE-2017-3460   
                  oracle-mysql | CVE-2017-3465    | https://security-tracker.debian.org/tracker/CVE-2017-3465   
                  oracle-mysql | CVE-2017-3467    | https://security-tracker.debian.org/tracker/CVE-2017-3467   
                  oracle-mysql | CVE-2017-3468    | https://security-tracker.debian.org/tracker/CVE-2017-3468   
                  oracle-mysql | CVE-2017-3529    | https://security-tracker.debian.org/tracker/CVE-2017-3529   
                  oracle-mysql | CVE-2017-3637    | https://security-tracker.debian.org/tracker/CVE-2017-3637   
                  oracle-mysql | CVE-2017-3638    | https://security-tracker.debian.org/tracker/CVE-2017-3638   
                  oracle-mysql | CVE-2017-3639    | https://security-tracker.debian.org/tracker/CVE-2017-3639   
                  oracle-mysql | CVE-2017-3640    | https://security-tracker.debian.org/tracker/CVE-2017-3640   
                  oracle-mysql | CVE-2017-3642    | https://security-tracker.debian.org/tracker/CVE-2017-3642   
                  oracle-mysql | CVE-2017-3643    | https://security-tracker.debian.org/tracker/CVE-2017-3643   
                  oracle-mysql | CVE-2017-3644    | https://security-tracker.debian.org/tracker/CVE-2017-3644   
                  oracle-mysql | CVE-2017-3645    | https://security-tracker.debian.org/tracker/CVE-2017-3645   
                  oracle-mysql | CVE-2017-3646    | https://security-tracker.debian.org/tracker/CVE-2017-3646   
                  oracle-mysql | CVE-2017-3650    | https://security-tracker.debian.org/tracker/CVE-2017-3650   
                  oracle-mysql | CVE-2018-0735    | https://security-tracker.debian.org/tracker/CVE-2018-0735   
                  oracle-mysql | CVE-2018-3061    | https://security-tracker.debian.org/tracker/CVE-2018-3061   
                  oracle-mysql | CVE-2018-3067    | https://security-tracker.debian.org/tracker/CVE-2018-3067   
                  oracle-mysql | CVE-2018-3071    | https://security-tracker.debian.org/tracker/CVE-2018-3071   
                  oracle-mysql | CVE-2018-3073    | https://security-tracker.debian.org/tracker/CVE-2018-3073   
                  oracle-mysql | CVE-2018-3074    | https://security-tracker.debian.org/tracker/CVE-2018-3074   
                  oracle-mysql | CVE-2018-3075    | https://security-tracker.debian.org/tracker/CVE-2018-3075   
                  oracle-mysql | CVE-2018-3078    | https://security-tracker.debian.org/tracker/CVE-2018-3078   
                  oracle-mysql | CVE-2018-3079    | https://security-tracker.debian.org/tracker/CVE-2018-3079   
                  oracle-mysql | CVE-2018-3080    | https://security-tracker.debian.org/tracker/CVE-2018-3080   
                  oracle-mysql | CVE-2018-3082    | https://security-tracker.debian.org/tracker/CVE-2018-3082   
                  oracle-mysql | CVE-2018-3084    | https://security-tracker.debian.org/tracker/CVE-2018-3084   
                  oracle-mysql | CVE-2018-3137    | https://security-tracker.debian.org/tracker/CVE-2018-3137   
                  oracle-mysql | CVE-2018-3145    | https://security-tracker.debian.org/tracker/CVE-2018-3145   
                  oracle-mysql | CVE-2018-3170    | https://security-tracker.debian.org/tracker/CVE-2018-3170   
                  oracle-mysql | CVE-2018-3182    | https://security-tracker.debian.org/tracker/CVE-2018-3182   
                  oracle-mysql | CVE-2018-3186    | https://security-tracker.debian.org/tracker/CVE-2018-3186   
                  oracle-mysql | CVE-2018-3195    | https://security-tracker.debian.org/tracker/CVE-2018-3195   
                  oracle-mysql | CVE-2018-3203    | https://security-tracker.debian.org/tracker/CVE-2018-3203   
                  oracle-mysql | CVE-2018-3212    | https://security-tracker.debian.org/tracker/CVE-2018-3212   
                  oracle-mysql | CVE-2018-3279    | https://security-tracker.debian.org/tracker/CVE-2018-3279   
                  oracle-mysql | CVE-2018-3280    | https://security-tracker.debian.org/tracker/CVE-2018-3280   
                  oracle-mysql | CVE-2018-3285    | https://security-tracker.debian.org/tracker/CVE-2018-3285   
                  oracle-mysql | CVE-2018-3286    | https://security-tracker.debian.org/tracker/CVE-2018-3286   
                  oracle-mysql | CVE-2019-2436    | https://security-tracker.debian.org/tracker/CVE-2019-2436   
                  oracle-mysql | CVE-2019-2494    | https://security-tracker.debian.org/tracker/CVE-2019-2494   
                  oracle-mysql | CVE-2019-2495    | https://security-tracker.debian.org/tracker/CVE-2019-2495   
                  oracle-mysql | CVE-2019-2502    | https://security-tracker.debian.org/tracker/CVE-2019-2502   
                  oracle-mysql | CVE-2019-2513    | https://security-tracker.debian.org/tracker/CVE-2019-2513   
                  oracle-mysql | CVE-2019-2530    | https://security-tracker.debian.org/tracker/CVE-2019-2530   
                  oracle-mysql | CVE-2019-2533    | https://security-tracker.debian.org/tracker/CVE-2019-2533   
                  oracle-mysql | CVE-2019-2535    | https://security-tracker.debian.org/tracker/CVE-2019-2535   
                  oracle-mysql | CVE-2019-2536    | https://security-tracker.debian.org/tracker/CVE-2019-2536   
                  oracle-mysql | CVE-2019-2539    | https://security-tracker.debian.org/tracker/CVE-2019-2539   
                  oracle-mysql | CVE-2019-2731    | https://security-tracker.debian.org/tracker/CVE-2019-2731   
                  oracle-mysql | CVE-2019-2741    | https://security-tracker.debian.org/tracker/CVE-2019-2741   
                  oracle-mysql | CVE-2019-2743    | https://security-tracker.debian.org/tracker/CVE-2019-2743   
                  oracle-mysql | CVE-2019-2746    | https://security-tracker.debian.org/tracker/CVE-2019-2746   
                  oracle-mysql | CVE-2019-2747    | https://security-tracker.debian.org/tracker/CVE-2019-2747   
                  oracle-mysql | CVE-2019-2752    | https://security-tracker.debian.org/tracker/CVE-2019-2752   
                  oracle-mysql | CVE-2019-2755    | https://security-tracker.debian.org/tracker/CVE-2019-2755   
                  oracle-mysql | CVE-2019-2757    | https://security-tracker.debian.org/tracker/CVE-2019-2757   
                  oracle-mysql | CVE-2019-2780    | https://security-tracker.debian.org/tracker/CVE-2019-2780   
                  oracle-mysql | CVE-2019-2784    | https://security-tracker.debian.org/tracker/CVE-2019-2784   
                  oracle-mysql | CVE-2019-2785    | https://security-tracker.debian.org/tracker/CVE-2019-2785   
                  oracle-mysql | CVE-2019-2789    | https://security-tracker.debian.org/tracker/CVE-2019-2789   
                  oracle-mysql | CVE-2019-2795    | https://security-tracker.debian.org/tracker/CVE-2019-2795   
                  oracle-mysql | CVE-2019-2796    | https://security-tracker.debian.org/tracker/CVE-2019-2796   
                  oracle-mysql | CVE-2019-2798    | https://security-tracker.debian.org/tracker/CVE-2019-2798   
                  oracle-mysql | CVE-2019-2800    | https://security-tracker.debian.org/tracker/CVE-2019-2800   
                  oracle-mysql | CVE-2019-2801    | https://security-tracker.debian.org/tracker/CVE-2019-2801   
                  oracle-mysql | CVE-2019-2802    | https://security-tracker.debian.org/tracker/CVE-2019-2802   
                  oracle-mysql | CVE-2019-2803    | https://security-tracker.debian.org/tracker/CVE-2019-2803   
                  oracle-mysql | CVE-2019-2808    | https://security-tracker.debian.org/tracker/CVE-2019-2808   
                  oracle-mysql | CVE-2019-2810    | https://security-tracker.debian.org/tracker/CVE-2019-2810   
                  oracle-mysql | CVE-2019-2811    | https://security-tracker.debian.org/tracker/CVE-2019-2811   
                  oracle-mysql | CVE-2019-2812    | https://security-tracker.debian.org/tracker/CVE-2019-2812   
                  oracle-mysql | CVE-2019-2814    | https://security-tracker.debian.org/tracker/CVE-2019-2814   
                  oracle-mysql | CVE-2019-2815    | https://security-tracker.debian.org/tracker/CVE-2019-2815   
                  oracle-mysql | CVE-2019-2822    | https://security-tracker.debian.org/tracker/CVE-2019-2822   
                  oracle-mysql | CVE-2019-2826    | https://security-tracker.debian.org/tracker/CVE-2019-2826   
                  oracle-mysql | CVE-2019-2830    | https://security-tracker.debian.org/tracker/CVE-2019-2830   
                  oracle-mysql | CVE-2019-2834    | https://security-tracker.debian.org/tracker/CVE-2019-2834   
                  oracle-mysql | CVE-2019-2879    | https://security-tracker.debian.org/tracker/CVE-2019-2879   
                  oracle-mysql | CVE-2019-3004    | https://security-tracker.debian.org/tracker/CVE-2019-3004   
                  oracle-mysql | CVE-2019-7317    | https://security-tracker.debian.org/tracker/CVE-2019-7317   
                  oracle-mysql | CVE-2020-14575   | https://security-tracker.debian.org/tracker/CVE-2020-14575  
                  oracle-mysql | CVE-2020-14597   | https://security-tracker.debian.org/tracker/CVE-2020-14597  
                  oracle-mysql | CVE-2020-14614   | https://security-tracker.debian.org/tracker/CVE-2020-14614  
                  oracle-mysql | CVE-2020-14619   | https://security-tracker.debian.org/tracker/CVE-2020-14619  
                  oracle-mysql | CVE-2020-14620   | https://security-tracker.debian.org/tracker/CVE-2020-14620  
                  oracle-mysql | CVE-2020-14623   | https://security-tracker.debian.org/tracker/CVE-2020-14623  
                  oracle-mysql | CVE-2020-14624   | https://security-tracker.debian.org/tracker/CVE-2020-14624  
                  oracle-mysql | CVE-2020-14631   | https://security-tracker.debian.org/tracker/CVE-2020-14631  
                  oracle-mysql | CVE-2020-14643   | https://security-tracker.debian.org/tracker/CVE-2020-14643  
                  oracle-mysql | CVE-2020-14651   | https://security-tracker.debian.org/tracker/CVE-2020-14651  
                  oracle-mysql | CVE-2020-14654   | https://security-tracker.debian.org/tracker/CVE-2020-14654  
                  oracle-mysql | CVE-2020-14656   | https://security-tracker.debian.org/tracker/CVE-2020-14656  
                  oracle-mysql | CVE-2020-14663   | https://security-tracker.debian.org/tracker/CVE-2020-14663  
                  oracle-mysql | CVE-2020-14678   | https://security-tracker.debian.org/tracker/CVE-2020-14678  
                  oracle-mysql | CVE-2020-14680   | https://security-tracker.debian.org/tracker/CVE-2020-14680  
                  oracle-mysql | CVE-2020-14697   | https://security-tracker.debian.org/tracker/CVE-2020-14697  
                  oracle-mysql | CVE-2020-14702   | https://security-tracker.debian.org/tracker/CVE-2020-14702  
                  oracle-mysql | CVE-2020-14760   | https://security-tracker.debian.org/tracker/CVE-2020-14760  
                  oracle-mysql | CVE-2020-14814   | https://security-tracker.debian.org/tracker/CVE-2020-14814  
                  oracle-mysql | CVE-2020-14830   | https://security-tracker.debian.org/tracker/CVE-2020-14830  
                  oracle-mysql | CVE-2020-14837   | https://security-tracker.debian.org/tracker/CVE-2020-14837  
                  oracle-mysql | CVE-2020-14839   | https://security-tracker.debian.org/tracker/CVE-2020-14839  
                  oracle-mysql | CVE-2020-14845   | https://security-tracker.debian.org/tracker/CVE-2020-14845  
                  oracle-mysql | CVE-2020-14846   | https://security-tracker.debian.org/tracker/CVE-2020-14846  
                  oracle-mysql | CVE-2020-14852   | https://security-tracker.debian.org/tracker/CVE-2020-14852  
                  oracle-mysql | CVE-2020-15358   | https://security-tracker.debian.org/tracker/CVE-2020-15358  
                  oracle-mysql | CVE-2020-1967    | https://security-tracker.debian.org/tracker/CVE-2020-1967   
                  oracle-mysql | CVE-2020-1971    | https://security-tracker.debian.org/tracker/CVE-2020-1971   
                  oracle-mysql | CVE-2021-22570   | https://security-tracker.debian.org/tracker/CVE-2021-22570  
                  oracle-mysql | CVE-2021-2356    | https://security-tracker.debian.org/tracker/CVE-2021-2356   
                  oracle-mysql | CVE-2022-21417   | https://security-tracker.debian.org/tracker/CVE-2022-21417  
                  oracle-mysql | CVE-2022-21444   | https://security-tracker.debian.org/tracker/CVE-2022-21444  
                         p7zip | CVE-2017-17969   | https://security-tracker.debian.org/tracker/CVE-2017-17969  
                         p7zip | CVE-2018-5996    | https://security-tracker.debian.org/tracker/CVE-2018-5996   
                         patch | CVE-2018-6952    | https://security-tracker.debian.org/tracker/CVE-2018-6952   
                         patch | CVE-2019-20633   | https://security-tracker.debian.org/tracker/CVE-2019-20633  
                           php | CVE-2007-2728    | https://security-tracker.debian.org/tracker/CVE-2007-2728   
                           php | CVE-2007-3205    | https://security-tracker.debian.org/tracker/CVE-2007-3205   
                           php | CVE-2007-4596    | https://security-tracker.debian.org/tracker/CVE-2007-4596   
                    postgresql | CVE-2017-8806    | https://security-tracker.debian.org/tracker/CVE-2017-8806   
                 powerpc-utils | CVE-2014-8165    | https://security-tracker.debian.org/tracker/CVE-2014-8165   
                          pppd | CVE-2018-11574   | https://security-tracker.debian.org/tracker/CVE-2018-11574  
                       proftpd | CVE-2021-46854   | https://security-tracker.debian.org/tracker/CVE-2021-46854  
                python-aiohttp | CVE-2022-33124   | https://security-tracker.debian.org/tracker/CVE-2022-33124  
               python-m2crypto | CVE-2020-25657   | https://security-tracker.debian.org/tracker/CVE-2020-25657  
                 python-pillow | CVE-2022-45198   | https://security-tracker.debian.org/tracker/CVE-2022-45198  
                 python-pillow | CVE-2022-45199   | https://security-tracker.debian.org/tracker/CVE-2022-45199  
                    python-pip | CVE-2018-20225   | https://security-tracker.debian.org/tracker/CVE-2018-20225  
                     python-py | CVE-2022-42969   | https://security-tracker.debian.org/tracker/CVE-2022-42969  
                  python-pyjwt | CVE-2022-29217   | https://security-tracker.debian.org/tracker/CVE-2022-29217  
                python-twisted | CVE-2022-24801   | https://security-tracker.debian.org/tracker/CVE-2022-24801  
                python-twisted | CVE-2022-39348   | https://security-tracker.debian.org/tracker/CVE-2022-39348  
                 python-web2py | CVE-2022-33146   | https://security-tracker.debian.org/tracker/CVE-2022-33146  
               python-werkzeug | CVE-2022-29361   | https://security-tracker.debian.org/tracker/CVE-2022-29361  
                          qemu | CVE-2018-18438   | https://security-tracker.debian.org/tracker/CVE-2018-18438  
                          qemu | CVE-2019-12067   | https://security-tracker.debian.org/tracker/CVE-2019-12067  
                          qemu | CVE-2021-20255   | https://security-tracker.debian.org/tracker/CVE-2021-20255  
                          qemu | CVE-2021-3611    | https://security-tracker.debian.org/tracker/CVE-2021-3611   
                          qemu | CVE-2021-3750    | https://security-tracker.debian.org/tracker/CVE-2021-3750   
                          qemu | CVE-2021-3929    | https://security-tracker.debian.org/tracker/CVE-2021-3929   
                          qemu | CVE-2021-3947    | https://security-tracker.debian.org/tracker/CVE-2021-3947   
                          qemu | CVE-2021-4158    | https://security-tracker.debian.org/tracker/CVE-2021-4158   
                          qemu | CVE-2021-4206    | https://security-tracker.debian.org/tracker/CVE-2021-4206   
                          qemu | CVE-2021-4207    | https://security-tracker.debian.org/tracker/CVE-2021-4207   
                          qemu | CVE-2022-0358    | https://security-tracker.debian.org/tracker/CVE-2022-0358   
                          qemu | CVE-2022-26353   | https://security-tracker.debian.org/tracker/CVE-2022-26353  
                          qemu | CVE-2022-26354   | https://security-tracker.debian.org/tracker/CVE-2022-26354  
                          qemu | CVE-2022-2962    | https://security-tracker.debian.org/tracker/CVE-2022-2962   
                          qemu | CVE-2022-3165    | https://security-tracker.debian.org/tracker/CVE-2022-3165   
                          qemu | CVE-2022-35414   | https://security-tracker.debian.org/tracker/CVE-2022-35414  
                          qemu | CVE-2022-3872    | https://security-tracker.debian.org/tracker/CVE-2022-3872   
                          qemu | CVE-2022-4144    | https://security-tracker.debian.org/tracker/CVE-2022-4144   
                        quagga | CVE-2016-4049    | https://security-tracker.debian.org/tracker/CVE-2016-4049   
                        quagga | CVE-2017-3224    | https://security-tracker.debian.org/tracker/CVE-2017-3224   
                        quagga | CVE-2021-44038   | https://security-tracker.debian.org/tracker/CVE-2021-44038  
               rabbitmq-server | CVE-2020-5419    | https://security-tracker.debian.org/tracker/CVE-2020-5419   
               rabbitmq-server | CVE-2021-22116   | https://security-tracker.debian.org/tracker/CVE-2021-22116  
               rabbitmq-server | CVE-2021-22117   | https://security-tracker.debian.org/tracker/CVE-2021-22117  
               rabbitmq-server | CVE-2021-32718   | https://security-tracker.debian.org/tracker/CVE-2021-32718  
               rabbitmq-server | CVE-2021-32719   | https://security-tracker.debian.org/tracker/CVE-2021-32719  
               rabbitmq-server | CVE-2022-31008   | https://security-tracker.debian.org/tracker/CVE-2022-31008  
                   resiprocate | CVE-2017-9454    | https://security-tracker.debian.org/tracker/CVE-2017-9454   
                           rpm | CVE-2021-3521    | https://security-tracker.debian.org/tracker/CVE-2021-3521   
                           rpm | CVE-2021-35937   | https://security-tracker.debian.org/tracker/CVE-2021-35937  
                           rpm | CVE-2021-35938   | https://security-tracker.debian.org/tracker/CVE-2021-35938  
                           rpm | CVE-2021-35939   | https://security-tracker.debian.org/tracker/CVE-2021-35939  
                        samba4 | CVE-2011-2411    | https://security-tracker.debian.org/tracker/CVE-2011-2411   
                        samba4 | CVE-2021-3670    | https://security-tracker.debian.org/tracker/CVE-2021-3670   
                        samba4 | CVE-2022-1615    | https://security-tracker.debian.org/tracker/CVE-2022-1615   
                        samba4 | CVE-2022-32743   | https://security-tracker.debian.org/tracker/CVE-2022-32743  
                           sdl | CVE-2019-13616   | https://security-tracker.debian.org/tracker/CVE-2019-13616  
                           sdl | CVE-2019-14906   | https://security-tracker.debian.org/tracker/CVE-2019-14906  
                           sdl | CVE-2019-7572    | https://security-tracker.debian.org/tracker/CVE-2019-7572   
                           sdl | CVE-2019-7573    | https://security-tracker.debian.org/tracker/CVE-2019-7573   
                           sdl | CVE-2019-7574    | https://security-tracker.debian.org/tracker/CVE-2019-7574   
                           sdl | CVE-2019-7575    | https://security-tracker.debian.org/tracker/CVE-2019-7575   
                           sdl | CVE-2019-7576    | https://security-tracker.debian.org/tracker/CVE-2019-7576   
                           sdl | CVE-2019-7577    | https://security-tracker.debian.org/tracker/CVE-2019-7577   
                           sdl | CVE-2019-7578    | https://security-tracker.debian.org/tracker/CVE-2019-7578   
                           sdl | CVE-2019-7635    | https://security-tracker.debian.org/tracker/CVE-2019-7635   
                           sdl | CVE-2019-7636    | https://security-tracker.debian.org/tracker/CVE-2019-7636   
                           sdl | CVE-2019-7637    | https://security-tracker.debian.org/tracker/CVE-2019-7637   
                           sdl | CVE-2019-7638    | https://security-tracker.debian.org/tracker/CVE-2019-7638   
                           sdl | CVE-2020-14409   | https://security-tracker.debian.org/tracker/CVE-2020-14409  
                           sdl | CVE-2020-14410   | https://security-tracker.debian.org/tracker/CVE-2020-14410  
                         smack | CVE-2014-0363    | https://security-tracker.debian.org/tracker/CVE-2014-0363   
                         smack | CVE-2014-0364    | https://security-tracker.debian.org/tracker/CVE-2014-0364   
                         smack | CVE-2016-10027   | https://security-tracker.debian.org/tracker/CVE-2016-10027  
                         spice | CVE-2016-0749    | https://security-tracker.debian.org/tracker/CVE-2016-0749   
                         spice | CVE-2016-2150    | https://security-tracker.debian.org/tracker/CVE-2016-2150   
                         spice | CVE-2018-10893   | https://security-tracker.debian.org/tracker/CVE-2018-10893  
                       systemd | CVE-2022-3821    | https://security-tracker.debian.org/tracker/CVE-2022-3821   
                       systemd | CVE-2022-45873   | https://security-tracker.debian.org/tracker/CVE-2022-45873  
                        thttpd | CVE-2012-5640    | https://security-tracker.debian.org/tracker/CVE-2012-5640   
                          tiff | CVE-2015-7313    | https://security-tracker.debian.org/tracker/CVE-2015-7313   
                          tiff | CVE-2022-2056    | https://security-tracker.debian.org/tracker/CVE-2022-2056   
                          tiff | CVE-2022-2057    | https://security-tracker.debian.org/tracker/CVE-2022-2057   
                          tiff | CVE-2022-2058    | https://security-tracker.debian.org/tracker/CVE-2022-2058   
                          tiff | CVE-2022-2519    | https://security-tracker.debian.org/tracker/CVE-2022-2519   
                          tiff | CVE-2022-2520    | https://security-tracker.debian.org/tracker/CVE-2022-2520   
                          tiff | CVE-2022-2521    | https://security-tracker.debian.org/tracker/CVE-2022-2521   
                          tiff | CVE-2022-2953    | https://security-tracker.debian.org/tracker/CVE-2022-2953   
                          tiff | CVE-2022-34526   | https://security-tracker.debian.org/tracker/CVE-2022-34526  
                          tiff | CVE-2022-3570    | https://security-tracker.debian.org/tracker/CVE-2022-3570   
                          tiff | CVE-2022-3597    | https://security-tracker.debian.org/tracker/CVE-2022-3597   
                          tiff | CVE-2022-3598    | https://security-tracker.debian.org/tracker/CVE-2022-3598   
                          tiff | CVE-2022-3599    | https://security-tracker.debian.org/tracker/CVE-2022-3599   
                          tiff | CVE-2022-3626    | https://security-tracker.debian.org/tracker/CVE-2022-3626   
                          tiff | CVE-2022-3627    | https://security-tracker.debian.org/tracker/CVE-2022-3627   
                          tiff | CVE-2022-3970    | https://security-tracker.debian.org/tracker/CVE-2022-3970   
                          tinc | CVE-2013-1428    | https://security-tracker.debian.org/tracker/CVE-2013-1428   
                           tor | CVE-2016-9079    | https://security-tracker.debian.org/tracker/CVE-2016-9079   
                           tor | CVE-2017-16541   | https://security-tracker.debian.org/tracker/CVE-2017-16541  
                   uboot-tools | CVE-2022-2347    | https://security-tracker.debian.org/tracker/CVE-2022-2347   
                   uboot-tools | CVE-2022-30767   | https://security-tracker.debian.org/tracker/CVE-2022-30767  
                   uboot-tools | CVE-2022-33103   | https://security-tracker.debian.org/tracker/CVE-2022-33103  
                   uboot-tools | CVE-2022-34835   | https://security-tracker.debian.org/tracker/CVE-2022-34835  
                       unbound | CVE-2022-30698   | https://security-tracker.debian.org/tracker/CVE-2022-30698  
                       unbound | CVE-2022-30699   | https://security-tracker.debian.org/tracker/CVE-2022-30699  
                       unbound | CVE-2022-3204    | https://security-tracker.debian.org/tracker/CVE-2022-3204   
                         unrar | CVE-2022-30333   | https://security-tracker.debian.org/tracker/CVE-2022-30333  
                         unzip | CVE-2021-4217    | https://security-tracker.debian.org/tracker/CVE-2021-4217   
                      usbguard | CVE-2019-25058   | https://security-tracker.debian.org/tracker/CVE-2019-25058  
                       wavpack | CVE-2022-2476    | https://security-tracker.debian.org/tracker/CVE-2022-2476   
                       wayland | CVE-2021-3782    | https://security-tracker.debian.org/tracker/CVE-2021-3782   
                     wireshark | CVE-2022-3190    | https://security-tracker.debian.org/tracker/CVE-2022-3190   
                           xen | CVE-2011-1936    | https://security-tracker.debian.org/tracker/CVE-2011-1936   
                           xen | CVE-2011-3346    | https://security-tracker.debian.org/tracker/CVE-2011-3346   
                           xen | CVE-2014-2580    | https://security-tracker.debian.org/tracker/CVE-2014-2580   
                           xen | CVE-2014-3672    | https://security-tracker.debian.org/tracker/CVE-2014-3672   
                           xen | CVE-2015-7504    | https://security-tracker.debian.org/tracker/CVE-2015-7504   
                           xen | CVE-2015-8550    | https://security-tracker.debian.org/tracker/CVE-2015-8550   
                           xen | CVE-2015-8553    | https://security-tracker.debian.org/tracker/CVE-2015-8553   
                           xen | CVE-2016-3960    | https://security-tracker.debian.org/tracker/CVE-2016-3960   
                           xen | CVE-2016-7092    | https://security-tracker.debian.org/tracker/CVE-2016-7092   
                           xen | CVE-2016-9379    | https://security-tracker.debian.org/tracker/CVE-2016-9379   
                           xen | CVE-2016-9380    | https://security-tracker.debian.org/tracker/CVE-2016-9380   
                           xen | CVE-2016-9383    | https://security-tracker.debian.org/tracker/CVE-2016-9383   
                           xen | CVE-2016-9386    | https://security-tracker.debian.org/tracker/CVE-2016-9386   
                           xen | CVE-2017-12134   | https://security-tracker.debian.org/tracker/CVE-2017-12134  
                           xen | CVE-2017-12135   | https://security-tracker.debian.org/tracker/CVE-2017-12135  
                           xen | CVE-2017-12137   | https://security-tracker.debian.org/tracker/CVE-2017-12137  
                           xen | CVE-2017-7228    | https://security-tracker.debian.org/tracker/CVE-2017-7228   
                           xen | CVE-2018-5244    | https://security-tracker.debian.org/tracker/CVE-2018-5244   
                           xen | CVE-2018-8897    | https://security-tracker.debian.org/tracker/CVE-2018-8897   
                           xen | CVE-2021-26313   | https://security-tracker.debian.org/tracker/CVE-2021-26313  
                           xen | CVE-2021-26314   | https://security-tracker.debian.org/tracker/CVE-2021-26314  
                           xen | CVE-2021-28038   | https://security-tracker.debian.org/tracker/CVE-2021-28038  
                           xen | CVE-2021-28039   | https://security-tracker.debian.org/tracker/CVE-2021-28039  
                           xen | CVE-2021-28687   | https://security-tracker.debian.org/tracker/CVE-2021-28687  
                           xen | CVE-2021-28690   | https://security-tracker.debian.org/tracker/CVE-2021-28690  
                           xen | CVE-2021-28692   | https://security-tracker.debian.org/tracker/CVE-2021-28692  
                           xen | CVE-2021-28693   | https://security-tracker.debian.org/tracker/CVE-2021-28693  
                           xen | CVE-2021-28694   | https://security-tracker.debian.org/tracker/CVE-2021-28694  
                           xen | CVE-2021-28695   | https://security-tracker.debian.org/tracker/CVE-2021-28695  
                           xen | CVE-2021-28696   | https://security-tracker.debian.org/tracker/CVE-2021-28696  
                           xen | CVE-2021-28697   | https://security-tracker.debian.org/tracker/CVE-2021-28697  
                           xen | CVE-2021-28698   | https://security-tracker.debian.org/tracker/CVE-2021-28698  
                           xen | CVE-2021-28699   | https://security-tracker.debian.org/tracker/CVE-2021-28699  
                           xen | CVE-2021-28700   | https://security-tracker.debian.org/tracker/CVE-2021-28700  
                           xen | CVE-2021-28701   | https://security-tracker.debian.org/tracker/CVE-2021-28701  
                           xen | CVE-2021-28702   | https://security-tracker.debian.org/tracker/CVE-2021-28702  
                           xen | CVE-2021-28703   | https://security-tracker.debian.org/tracker/CVE-2021-28703  
                           xen | CVE-2021-28704   | https://security-tracker.debian.org/tracker/CVE-2021-28704  
                           xen | CVE-2021-28707   | https://security-tracker.debian.org/tracker/CVE-2021-28707  
                           xen | CVE-2021-28708   | https://security-tracker.debian.org/tracker/CVE-2021-28708  
                           xen | CVE-2021-28711   | https://security-tracker.debian.org/tracker/CVE-2021-28711  
                           xen | CVE-2021-28712   | https://security-tracker.debian.org/tracker/CVE-2021-28712  
                           xen | CVE-2021-28713   | https://security-tracker.debian.org/tracker/CVE-2021-28713  
                           xen | CVE-2022-21123   | https://security-tracker.debian.org/tracker/CVE-2022-21123  
                           xen | CVE-2022-21125   | https://security-tracker.debian.org/tracker/CVE-2022-21125  
                           xen | CVE-2022-21127   | https://security-tracker.debian.org/tracker/CVE-2022-21127  
                           xen | CVE-2022-21166   | https://security-tracker.debian.org/tracker/CVE-2022-21166  
                           xen | CVE-2022-23033   | https://security-tracker.debian.org/tracker/CVE-2022-23033  
                           xen | CVE-2022-23035   | https://security-tracker.debian.org/tracker/CVE-2022-23035  
                           xen | CVE-2022-23036   | https://security-tracker.debian.org/tracker/CVE-2022-23036  
                           xen | CVE-2022-23037   | https://security-tracker.debian.org/tracker/CVE-2022-23037  
                           xen | CVE-2022-23038   | https://security-tracker.debian.org/tracker/CVE-2022-23038  
                           xen | CVE-2022-23039   | https://security-tracker.debian.org/tracker/CVE-2022-23039  
                           xen | CVE-2022-23040   | https://security-tracker.debian.org/tracker/CVE-2022-23040  
                           xen | CVE-2022-23041   | https://security-tracker.debian.org/tracker/CVE-2022-23041  
                           xen | CVE-2022-23042   | https://security-tracker.debian.org/tracker/CVE-2022-23042  
                           xen | CVE-2022-23824   | https://security-tracker.debian.org/tracker/CVE-2022-23824  
                           xen | CVE-2022-23960   | https://security-tracker.debian.org/tracker/CVE-2022-23960  
                           xen | CVE-2022-26357   | https://security-tracker.debian.org/tracker/CVE-2022-26357  
                           xen | CVE-2022-26358   | https://security-tracker.debian.org/tracker/CVE-2022-26358  
                           xen | CVE-2022-26359   | https://security-tracker.debian.org/tracker/CVE-2022-26359  
                           xen | CVE-2022-26360   | https://security-tracker.debian.org/tracker/CVE-2022-26360  
                           xen | CVE-2022-26361   | https://security-tracker.debian.org/tracker/CVE-2022-26361  
                           xen | CVE-2022-26362   | https://security-tracker.debian.org/tracker/CVE-2022-26362  
                           xen | CVE-2022-26363   | https://security-tracker.debian.org/tracker/CVE-2022-26363  
                           xen | CVE-2022-26364   | https://security-tracker.debian.org/tracker/CVE-2022-26364  
                           xen | CVE-2022-26365   | https://security-tracker.debian.org/tracker/CVE-2022-26365  
                           xen | CVE-2022-29900   | https://security-tracker.debian.org/tracker/CVE-2022-29900  
                           xen | CVE-2022-29901   | https://security-tracker.debian.org/tracker/CVE-2022-29901  
                           xen | CVE-2022-33740   | https://security-tracker.debian.org/tracker/CVE-2022-33740  
                           xen | CVE-2022-33741   | https://security-tracker.debian.org/tracker/CVE-2022-33741  
                           xen | CVE-2022-33742   | https://security-tracker.debian.org/tracker/CVE-2022-33742  
                           xen | CVE-2022-33743   | https://security-tracker.debian.org/tracker/CVE-2022-33743  
                           xen | CVE-2022-33745   | https://security-tracker.debian.org/tracker/CVE-2022-33745  
                           xen | CVE-2022-33746   | https://security-tracker.debian.org/tracker/CVE-2022-33746  
                           xen | CVE-2022-33747   | https://security-tracker.debian.org/tracker/CVE-2022-33747  
                           xen | CVE-2022-33748   | https://security-tracker.debian.org/tracker/CVE-2022-33748  
                           xen | CVE-2022-42309   | https://security-tracker.debian.org/tracker/CVE-2022-42309  
                           xen | CVE-2022-42311   | https://security-tracker.debian.org/tracker/CVE-2022-42311  
                           xen | CVE-2022-42312   | https://security-tracker.debian.org/tracker/CVE-2022-42312  
                           xen | CVE-2022-42313   | https://security-tracker.debian.org/tracker/CVE-2022-42313  
                           xen | CVE-2022-42314   | https://security-tracker.debian.org/tracker/CVE-2022-42314  
                           xen | CVE-2022-42315   | https://security-tracker.debian.org/tracker/CVE-2022-42315  
                           xen | CVE-2022-42316   | https://security-tracker.debian.org/tracker/CVE-2022-42316  
                           xen | CVE-2022-42317   | https://security-tracker.debian.org/tracker/CVE-2022-42317  
                           xen | CVE-2022-42318   | https://security-tracker.debian.org/tracker/CVE-2022-42318  
                           xen | CVE-2022-42319   | https://security-tracker.debian.org/tracker/CVE-2022-42319  
                           xen | CVE-2022-42320   | https://security-tracker.debian.org/tracker/CVE-2022-42320  
                           xen | CVE-2022-42321   | https://security-tracker.debian.org/tracker/CVE-2022-42321  
                           xen | CVE-2022-42322   | https://security-tracker.debian.org/tracker/CVE-2022-42322  
                           xen | CVE-2022-42323   | https://security-tracker.debian.org/tracker/CVE-2022-42323  
                           xen | CVE-2022-42324   | https://security-tracker.debian.org/tracker/CVE-2022-42324  
                           xen | CVE-2022-42325   | https://security-tracker.debian.org/tracker/CVE-2022-42325  
                           xen | CVE-2022-42326   | https://security-tracker.debian.org/tracker/CVE-2022-42326  
                        xerces | CVE-2012-0880    | https://security-tracker.debian.org/tracker/CVE-2012-0880   
                  xscreensaver | CVE-2021-34557   | https://security-tracker.debian.org/tracker/CVE-2021-34557  
                          yasm | CVE-2021-33454   | https://security-tracker.debian.org/tracker/CVE-2021-33454  
                          yasm | CVE-2021-33455   | https://security-tracker.debian.org/tracker/CVE-2021-33455  
                          yasm | CVE-2021-33456   | https://security-tracker.debian.org/tracker/CVE-2021-33456  
                          yasm | CVE-2021-33457   | https://security-tracker.debian.org/tracker/CVE-2021-33457  
                          yasm | CVE-2021-33458   | https://security-tracker.debian.org/tracker/CVE-2021-33458  
                          yasm | CVE-2021-33459   | https://security-tracker.debian.org/tracker/CVE-2021-33459  
                          yasm | CVE-2021-33460   | https://security-tracker.debian.org/tracker/CVE-2021-33460  
                          yasm | CVE-2021-33461   | https://security-tracker.debian.org/tracker/CVE-2021-33461  
                          yasm | CVE-2021-33462   | https://security-tracker.debian.org/tracker/CVE-2021-33462  
                          yasm | CVE-2021-33463   | https://security-tracker.debian.org/tracker/CVE-2021-33463  
                          yasm | CVE-2021-33464   | https://security-tracker.debian.org/tracker/CVE-2021-33464  
                          yasm | CVE-2021-33465   | https://security-tracker.debian.org/tracker/CVE-2021-33465  
                          yasm | CVE-2021-33466   | https://security-tracker.debian.org/tracker/CVE-2021-33466  
                          yasm | CVE-2021-33467   | https://security-tracker.debian.org/tracker/CVE-2021-33467  
                          yasm | CVE-2021-33468   | https://security-tracker.debian.org/tracker/CVE-2021-33468  
                           zip | CVE-2018-13410   | https://security-tracker.debian.org/tracker/CVE-2018-13410  

CVEs for the '2022.08.x' branch
-------------------------------

             name              |       CVE        |                             link                            
-------------------------------+------------------+--------------------------------------------------------------
                        apache | CVE-1999-0236    | https://security-tracker.debian.org/tracker/CVE-1999-0236   
                        apache | CVE-1999-0289    | https://security-tracker.debian.org/tracker/CVE-1999-0289   
                        apache | CVE-1999-0678    | https://security-tracker.debian.org/tracker/CVE-1999-0678   
                        apache | CVE-1999-1237    | https://security-tracker.debian.org/tracker/CVE-1999-1237   
                        apache | CVE-1999-1412    | https://security-tracker.debian.org/tracker/CVE-1999-1412   
                        apache | CVE-2007-0086    | https://security-tracker.debian.org/tracker/CVE-2007-0086   
                        apache | CVE-2007-0450    | https://security-tracker.debian.org/tracker/CVE-2007-0450   
                        apache | CVE-2007-4465    | https://security-tracker.debian.org/tracker/CVE-2007-4465   
                        apache | CVE-2007-5000    | https://security-tracker.debian.org/tracker/CVE-2007-5000   
                        apache | CVE-2007-6388    | https://security-tracker.debian.org/tracker/CVE-2007-6388   
                        apache | CVE-2007-6420    | https://security-tracker.debian.org/tracker/CVE-2007-6420   
                        apache | CVE-2007-6421    | https://security-tracker.debian.org/tracker/CVE-2007-6421   
                        apache | CVE-2007-6422    | https://security-tracker.debian.org/tracker/CVE-2007-6422   
                        apache | CVE-2007-6423    | https://security-tracker.debian.org/tracker/CVE-2007-6423   
                        apache | CVE-2008-2168    | https://security-tracker.debian.org/tracker/CVE-2008-2168   
                        apache | CVE-2008-2939    | https://security-tracker.debian.org/tracker/CVE-2008-2939   
                        apache | CVE-2009-1195    | https://security-tracker.debian.org/tracker/CVE-2009-1195   
                        apache | CVE-2010-0408    | https://security-tracker.debian.org/tracker/CVE-2010-0408   
                        apache | CVE-2010-0425    | https://security-tracker.debian.org/tracker/CVE-2010-0425   
                        apache | CVE-2010-1452    | https://security-tracker.debian.org/tracker/CVE-2010-1452   
                        apache | CVE-2014-0231    | https://security-tracker.debian.org/tracker/CVE-2014-0231   
                      apparmor | CVE-2016-1585    | https://security-tracker.debian.org/tracker/CVE-2016-1585   
                         argus | CVE-2011-3332    | https://security-tracker.debian.org/tracker/CVE-2011-3332   
                         asn1c | CVE-2017-12966   | https://security-tracker.debian.org/tracker/CVE-2017-12966  
                          atop | CVE-2011-3618    | https://security-tracker.debian.org/tracker/CVE-2011-3618   
                         avahi | CVE-2021-3468    | https://security-tracker.debian.org/tracker/CVE-2021-3468   
                     belle-sip | CVE-2021-33056   | https://security-tracker.debian.org/tracker/CVE-2021-33056  
                     belle-sip | CVE-2021-43610   | https://security-tracker.debian.org/tracker/CVE-2021-43610  
                     belle-sip | CVE-2021-43611   | https://security-tracker.debian.org/tracker/CVE-2021-43611  
                        bento4 | CVE-2020-23331   | https://security-tracker.debian.org/tracker/CVE-2020-23331  
                        bento4 | CVE-2020-23332   | https://security-tracker.debian.org/tracker/CVE-2020-23332  
                        bento4 | CVE-2022-27607   | https://security-tracker.debian.org/tracker/CVE-2022-27607  
                        bento4 | CVE-2022-35165   | https://security-tracker.debian.org/tracker/CVE-2022-35165  
                        bento4 | CVE-2022-3662    | https://security-tracker.debian.org/tracker/CVE-2022-3662   
                        bento4 | CVE-2022-3663    | https://security-tracker.debian.org/tracker/CVE-2022-3663   
                        bento4 | CVE-2022-3664    | https://security-tracker.debian.org/tracker/CVE-2022-3664   
                        bento4 | CVE-2022-3665    | https://security-tracker.debian.org/tracker/CVE-2022-3665   
                        bento4 | CVE-2022-3666    | https://security-tracker.debian.org/tracker/CVE-2022-3666   
                        bento4 | CVE-2022-3667    | https://security-tracker.debian.org/tracker/CVE-2022-3667   
                        bento4 | CVE-2022-3668    | https://security-tracker.debian.org/tracker/CVE-2022-3668   
                        bento4 | CVE-2022-3669    | https://security-tracker.debian.org/tracker/CVE-2022-3669   
                        bento4 | CVE-2022-3670    | https://security-tracker.debian.org/tracker/CVE-2022-3670   
                        bento4 | CVE-2022-3784    | https://security-tracker.debian.org/tracker/CVE-2022-3784   
                        bento4 | CVE-2022-3785    | https://security-tracker.debian.org/tracker/CVE-2022-3785   
                        bento4 | CVE-2022-3807    | https://security-tracker.debian.org/tracker/CVE-2022-3807   
                        bento4 | CVE-2022-3809    | https://security-tracker.debian.org/tracker/CVE-2022-3809   
                        bento4 | CVE-2022-3810    | https://security-tracker.debian.org/tracker/CVE-2022-3810   
                        bento4 | CVE-2022-3812    | https://security-tracker.debian.org/tracker/CVE-2022-3812   
                        bento4 | CVE-2022-3813    | https://security-tracker.debian.org/tracker/CVE-2022-3813   
                        bento4 | CVE-2022-3814    | https://security-tracker.debian.org/tracker/CVE-2022-3814   
                        bento4 | CVE-2022-3815    | https://security-tracker.debian.org/tracker/CVE-2022-3815   
                        bento4 | CVE-2022-3816    | https://security-tracker.debian.org/tracker/CVE-2022-3816   
                        bento4 | CVE-2022-3817    | https://security-tracker.debian.org/tracker/CVE-2022-3817   
                        bento4 | CVE-2022-40438   | https://security-tracker.debian.org/tracker/CVE-2022-40438  
                        bento4 | CVE-2022-40439   | https://security-tracker.debian.org/tracker/CVE-2022-40439  
                        bento4 | CVE-2022-40736   | https://security-tracker.debian.org/tracker/CVE-2022-40736  
                        bento4 | CVE-2022-40737   | https://security-tracker.debian.org/tracker/CVE-2022-40737  
                        bento4 | CVE-2022-40738   | https://security-tracker.debian.org/tracker/CVE-2022-40738  
                        bento4 | CVE-2022-40774   | https://security-tracker.debian.org/tracker/CVE-2022-40774  
                        bento4 | CVE-2022-40775   | https://security-tracker.debian.org/tracker/CVE-2022-40775  
                        bento4 | CVE-2022-40885   | https://security-tracker.debian.org/tracker/CVE-2022-40885  
                        bento4 | CVE-2022-41419   | https://security-tracker.debian.org/tracker/CVE-2022-41419  
                        bento4 | CVE-2022-41423   | https://security-tracker.debian.org/tracker/CVE-2022-41423  
                        bento4 | CVE-2022-41424   | https://security-tracker.debian.org/tracker/CVE-2022-41424  
                        bento4 | CVE-2022-41425   | https://security-tracker.debian.org/tracker/CVE-2022-41425  
                        bento4 | CVE-2022-41426   | https://security-tracker.debian.org/tracker/CVE-2022-41426  
                        bento4 | CVE-2022-41427   | https://security-tracker.debian.org/tracker/CVE-2022-41427  
                        bento4 | CVE-2022-41428   | https://security-tracker.debian.org/tracker/CVE-2022-41428  
                        bento4 | CVE-2022-41429   | https://security-tracker.debian.org/tracker/CVE-2022-41429  
                        bento4 | CVE-2022-41430   | https://security-tracker.debian.org/tracker/CVE-2022-41430  
                        bento4 | CVE-2022-41841   | https://security-tracker.debian.org/tracker/CVE-2022-41841  
                        bento4 | CVE-2022-41845   | https://security-tracker.debian.org/tracker/CVE-2022-41845  
                        bento4 | CVE-2022-41846   | https://security-tracker.debian.org/tracker/CVE-2022-41846  
                        bento4 | CVE-2022-41847   | https://security-tracker.debian.org/tracker/CVE-2022-41847  
                        bento4 | CVE-2022-43032   | https://security-tracker.debian.org/tracker/CVE-2022-43032  
                        bento4 | CVE-2022-43033   | https://security-tracker.debian.org/tracker/CVE-2022-43033  
                        bento4 | CVE-2022-43034   | https://security-tracker.debian.org/tracker/CVE-2022-43034  
                        bento4 | CVE-2022-43035   | https://security-tracker.debian.org/tracker/CVE-2022-43035  
                        bento4 | CVE-2022-43037   | https://security-tracker.debian.org/tracker/CVE-2022-43037  
                        bento4 | CVE-2022-43038   | https://security-tracker.debian.org/tracker/CVE-2022-43038  
                    berkeleydb | CVE-2017-3604    | https://security-tracker.debian.org/tracker/CVE-2017-3604   
                    berkeleydb | CVE-2017-3605    | https://security-tracker.debian.org/tracker/CVE-2017-3605   
                    berkeleydb | CVE-2017-3606    | https://security-tracker.debian.org/tracker/CVE-2017-3606   
                    berkeleydb | CVE-2017-3607    | https://security-tracker.debian.org/tracker/CVE-2017-3607   
                    berkeleydb | CVE-2017-3608    | https://security-tracker.debian.org/tracker/CVE-2017-3608   
                    berkeleydb | CVE-2017-3609    | https://security-tracker.debian.org/tracker/CVE-2017-3609   
                    berkeleydb | CVE-2017-3610    | https://security-tracker.debian.org/tracker/CVE-2017-3610   
                    berkeleydb | CVE-2017-3611    | https://security-tracker.debian.org/tracker/CVE-2017-3611   
                    berkeleydb | CVE-2017-3612    | https://security-tracker.debian.org/tracker/CVE-2017-3612   
                    berkeleydb | CVE-2017-3613    | https://security-tracker.debian.org/tracker/CVE-2017-3613   
                    berkeleydb | CVE-2017-3614    | https://security-tracker.debian.org/tracker/CVE-2017-3614   
                    berkeleydb | CVE-2017-3615    | https://security-tracker.debian.org/tracker/CVE-2017-3615   
                    berkeleydb | CVE-2017-3616    | https://security-tracker.debian.org/tracker/CVE-2017-3616   
                    berkeleydb | CVE-2017-3617    | https://security-tracker.debian.org/tracker/CVE-2017-3617   
                    berkeleydb | CVE-2019-2708    | https://security-tracker.debian.org/tracker/CVE-2019-2708   
                    berkeleydb | CVE-2020-2981    | https://security-tracker.debian.org/tracker/CVE-2020-2981   
                      binutils | CVE-2021-45078   | https://security-tracker.debian.org/tracker/CVE-2021-45078  
                      binutils | CVE-2022-38533   | https://security-tracker.debian.org/tracker/CVE-2022-38533  
                       bitcoin | CVE-2012-1909    | https://security-tracker.debian.org/tracker/CVE-2012-1909   
                       bitcoin | CVE-2012-4682    | https://security-tracker.debian.org/tracker/CVE-2012-4682   
                       bitcoin | CVE-2012-4683    | https://security-tracker.debian.org/tracker/CVE-2012-4683   
                       bitcoin | CVE-2013-2272    | https://security-tracker.debian.org/tracker/CVE-2013-2272   
                       bitcoin | CVE-2013-2273    | https://security-tracker.debian.org/tracker/CVE-2013-2273   
                       bitcoin | CVE-2013-2292    | https://security-tracker.debian.org/tracker/CVE-2013-2292   
                       bitcoin | CVE-2013-2293    | https://security-tracker.debian.org/tracker/CVE-2013-2293   
                       bitcoin | CVE-2013-3220    | https://security-tracker.debian.org/tracker/CVE-2013-3220   
                  bluez5_utils | CVE-2020-24490   | https://security-tracker.debian.org/tracker/CVE-2020-24490  
          bluez5_utils-headers | CVE-2020-24490   | https://security-tracker.debian.org/tracker/CVE-2020-24490  
                         botan | CVE-2022-43705   | https://security-tracker.debian.org/tracker/CVE-2022-43705  
                        bsdiff | CVE-2020-14315   | https://security-tracker.debian.org/tracker/CVE-2020-14315  
                         cairo | CVE-2019-6461    | https://security-tracker.debian.org/tracker/CVE-2019-6461   
                         cairo | CVE-2019-6462    | https://security-tracker.debian.org/tracker/CVE-2019-6462   
                         cairo | CVE-2020-35492   | https://security-tracker.debian.org/tracker/CVE-2020-35492  
                     capnproto | CVE-2022-46149   | https://security-tracker.debian.org/tracker/CVE-2022-46149  
                       connman | CVE-2022-32292   | https://security-tracker.debian.org/tracker/CVE-2022-32292  
                       connman | CVE-2022-32293   | https://security-tracker.debian.org/tracker/CVE-2022-32293  
                     coreutils | CVE-2016-2781    | https://security-tracker.debian.org/tracker/CVE-2016-2781   
                          cpio | CVE-2010-4226    | https://security-tracker.debian.org/tracker/CVE-2010-4226   
                      cryptopp | CVE-2021-43398   | https://security-tracker.debian.org/tracker/CVE-2021-43398  
                           cvs | CVE-2017-12836   | https://security-tracker.debian.org/tracker/CVE-2017-12836  
                   dbus-broker | CVE-2022-31212   | https://security-tracker.debian.org/tracker/CVE-2022-31212  
                   dbus-broker | CVE-2022-31213   | https://security-tracker.debian.org/tracker/CVE-2022-31213  
                       dnsmasq | CVE-2022-0934    | https://security-tracker.debian.org/tracker/CVE-2022-0934   
                        docker | CVE-2014-0048    | https://security-tracker.debian.org/tracker/CVE-2014-0048   
                        docker | CVE-2014-8178    | https://security-tracker.debian.org/tracker/CVE-2014-8178   
                        docker | CVE-2014-8179    | https://security-tracker.debian.org/tracker/CVE-2014-8179   
                        docker | CVE-2015-1843    | https://security-tracker.debian.org/tracker/CVE-2015-1843   
                        docker | CVE-2015-3627    | https://security-tracker.debian.org/tracker/CVE-2015-3627   
                        docker | CVE-2015-3630    | https://security-tracker.debian.org/tracker/CVE-2015-3630   
                        docker | CVE-2015-3631    | https://security-tracker.debian.org/tracker/CVE-2015-3631   
                        docker | CVE-2016-3697    | https://security-tracker.debian.org/tracker/CVE-2016-3697   
                        docker | CVE-2017-14992   | https://security-tracker.debian.org/tracker/CVE-2017-14992  
                        docker | CVE-2019-13139   | https://security-tracker.debian.org/tracker/CVE-2019-13139  
                        docker | CVE-2019-13509   | https://security-tracker.debian.org/tracker/CVE-2019-13509  
                        docker | CVE-2019-15752   | https://security-tracker.debian.org/tracker/CVE-2019-15752  
                        docker | CVE-2019-16884   | https://security-tracker.debian.org/tracker/CVE-2019-16884  
                        docker | CVE-2019-5736    | https://security-tracker.debian.org/tracker/CVE-2019-5736   
                        docker | CVE-2020-27534   | https://security-tracker.debian.org/tracker/CVE-2020-27534  
                        docker | CVE-2021-21284   | https://security-tracker.debian.org/tracker/CVE-2021-21284  
                        docker | CVE-2021-21285   | https://security-tracker.debian.org/tracker/CVE-2021-21285  
                        docker | CVE-2021-3162    | https://security-tracker.debian.org/tracker/CVE-2021-3162   
                        docker | CVE-2021-33183   | https://security-tracker.debian.org/tracker/CVE-2021-33183  
                        docker | CVE-2022-25365   | https://security-tracker.debian.org/tracker/CVE-2022-25365  
                          edk2 | CVE-2014-4859    | https://security-tracker.debian.org/tracker/CVE-2014-4859   
                          edk2 | CVE-2014-4860    | https://security-tracker.debian.org/tracker/CVE-2014-4860   
                          edk2 | CVE-2014-8271    | https://security-tracker.debian.org/tracker/CVE-2014-8271   
                          edk2 | CVE-2019-14553   | https://security-tracker.debian.org/tracker/CVE-2019-14553  
                          edk2 | CVE-2019-14559   | https://security-tracker.debian.org/tracker/CVE-2019-14559  
                          edk2 | CVE-2019-14562   | https://security-tracker.debian.org/tracker/CVE-2019-14562  
                          edk2 | CVE-2019-14563   | https://security-tracker.debian.org/tracker/CVE-2019-14563  
                          edk2 | CVE-2019-14575   | https://security-tracker.debian.org/tracker/CVE-2019-14575  
                          edk2 | CVE-2019-14586   | https://security-tracker.debian.org/tracker/CVE-2019-14586  
                          edk2 | CVE-2019-14587   | https://security-tracker.debian.org/tracker/CVE-2019-14587  
                         emlog | CVE-2021-44584   | https://security-tracker.debian.org/tracker/CVE-2021-44584  
                         emlog | CVE-2022-1526    | https://security-tracker.debian.org/tracker/CVE-2022-1526   
                         emlog | CVE-2022-3968    | https://security-tracker.debian.org/tracker/CVE-2022-3968   
                        erlang | CVE-2020-35733   | https://security-tracker.debian.org/tracker/CVE-2020-35733  
                        erlang | CVE-2022-37026   | https://security-tracker.debian.org/tracker/CVE-2022-37026  
                         exfat | CVE-2022-29973   | https://security-tracker.debian.org/tracker/CVE-2022-29973  
                         exiv2 | CVE-2007-6353    | https://security-tracker.debian.org/tracker/CVE-2007-6353   
                        ffmpeg | CVE-2021-38291   | https://security-tracker.debian.org/tracker/CVE-2021-38291  
                        ffmpeg | CVE-2022-3964    | https://security-tracker.debian.org/tracker/CVE-2022-3964   
                        ffmpeg | CVE-2022-3965    | https://security-tracker.debian.org/tracker/CVE-2022-3965   
             freeradius-server | CVE-2002-0318    | https://security-tracker.debian.org/tracker/CVE-2002-0318   
             freeradius-server | CVE-2011-4966    | https://security-tracker.debian.org/tracker/CVE-2011-4966   
                        giflib | CVE-2022-28506   | https://security-tracker.debian.org/tracker/CVE-2022-28506  
                           git | CVE-2022-24765   | https://security-tracker.debian.org/tracker/CVE-2022-24765  
                           git | CVE-2022-24975   | https://security-tracker.debian.org/tracker/CVE-2022-24975  
                         glibc | CVE-2010-4756    | https://security-tracker.debian.org/tracker/CVE-2010-4756   
                         glibc | CVE-2019-1010022 | https://security-tracker.debian.org/tracker/CVE-2019-1010022
                         glibc | CVE-2019-1010023 | https://security-tracker.debian.org/tracker/CVE-2019-1010023
                         glibc | CVE-2019-1010024 | https://security-tracker.debian.org/tracker/CVE-2019-1010024
                         glibc | CVE-2019-1010025 | https://security-tracker.debian.org/tracker/CVE-2019-1010025
                         gnupg | CVE-2006-3082    | https://security-tracker.debian.org/tracker/CVE-2006-3082   
                         gnupg | CVE-2011-2207    | https://security-tracker.debian.org/tracker/CVE-2011-2207   
                         gnupg | CVE-2015-1606    | https://security-tracker.debian.org/tracker/CVE-2015-1606   
                         gnupg | CVE-2018-12020   | https://security-tracker.debian.org/tracker/CVE-2018-12020  
                         gnupg | CVE-2019-13050   | https://security-tracker.debian.org/tracker/CVE-2019-13050  
                         gnupg | CVE-2019-14855   | https://security-tracker.debian.org/tracker/CVE-2019-14855  
                         gnupg | CVE-2022-34903   | https://security-tracker.debian.org/tracker/CVE-2022-34903  
                            go | CVE-2020-29509   | https://security-tracker.debian.org/tracker/CVE-2020-29509  
                            go | CVE-2020-29511   | https://security-tracker.debian.org/tracker/CVE-2020-29511  
                graphicsmagick | CVE-2007-0770    | https://security-tracker.debian.org/tracker/CVE-2007-0770   
                graphicsmagick | CVE-2008-6621    | https://security-tracker.debian.org/tracker/CVE-2008-6621   
                     graphite2 | CVE-2017-5436    | https://security-tracker.debian.org/tracker/CVE-2017-5436   
                       haproxy | CVE-2016-2102    | https://security-tracker.debian.org/tracker/CVE-2016-2102   
                heirloom-mailx | CVE-2004-2771    | https://security-tracker.debian.org/tracker/CVE-2004-2771   
                   imagemagick | CVE-2007-1667    | https://security-tracker.debian.org/tracker/CVE-2007-1667   
                   imagemagick | CVE-2014-9804    | https://security-tracker.debian.org/tracker/CVE-2014-9804   
                   imagemagick | CVE-2014-9805    | https://security-tracker.debian.org/tracker/CVE-2014-9805   
                   imagemagick | CVE-2014-9806    | https://security-tracker.debian.org/tracker/CVE-2014-9806   
                   imagemagick | CVE-2014-9807    | https://security-tracker.debian.org/tracker/CVE-2014-9807   
                   imagemagick | CVE-2014-9808    | https://security-tracker.debian.org/tracker/CVE-2014-9808   
                   imagemagick | CVE-2014-9809    | https://security-tracker.debian.org/tracker/CVE-2014-9809   
                   imagemagick | CVE-2014-9810    | https://security-tracker.debian.org/tracker/CVE-2014-9810   
                   imagemagick | CVE-2014-9811    | https://security-tracker.debian.org/tracker/CVE-2014-9811   
                   imagemagick | CVE-2014-9812    | https://security-tracker.debian.org/tracker/CVE-2014-9812   
                   imagemagick | CVE-2014-9813    | https://security-tracker.debian.org/tracker/CVE-2014-9813   
                   imagemagick | CVE-2014-9814    | https://security-tracker.debian.org/tracker/CVE-2014-9814   
                   imagemagick | CVE-2014-9815    | https://security-tracker.debian.org/tracker/CVE-2014-9815   
                   imagemagick | CVE-2014-9816    | https://security-tracker.debian.org/tracker/CVE-2014-9816   
                   imagemagick | CVE-2014-9817    | https://security-tracker.debian.org/tracker/CVE-2014-9817   
                   imagemagick | CVE-2014-9818    | https://security-tracker.debian.org/tracker/CVE-2014-9818   
                   imagemagick | CVE-2014-9819    | https://security-tracker.debian.org/tracker/CVE-2014-9819   
                   imagemagick | CVE-2014-9820    | https://security-tracker.debian.org/tracker/CVE-2014-9820   
                   imagemagick | CVE-2014-9821    | https://security-tracker.debian.org/tracker/CVE-2014-9821   
                   imagemagick | CVE-2014-9822    | https://security-tracker.debian.org/tracker/CVE-2014-9822   
                   imagemagick | CVE-2014-9823    | https://security-tracker.debian.org/tracker/CVE-2014-9823   
                   imagemagick | CVE-2014-9824    | https://security-tracker.debian.org/tracker/CVE-2014-9824   
                   imagemagick | CVE-2014-9825    | https://security-tracker.debian.org/tracker/CVE-2014-9825   
                   imagemagick | CVE-2014-9826    | https://security-tracker.debian.org/tracker/CVE-2014-9826   
                   imagemagick | CVE-2014-9827    | https://security-tracker.debian.org/tracker/CVE-2014-9827   
                   imagemagick | CVE-2014-9828    | https://security-tracker.debian.org/tracker/CVE-2014-9828   
                   imagemagick | CVE-2014-9829    | https://security-tracker.debian.org/tracker/CVE-2014-9829   
                   imagemagick | CVE-2014-9830    | https://security-tracker.debian.org/tracker/CVE-2014-9830   
                   imagemagick | CVE-2014-9831    | https://security-tracker.debian.org/tracker/CVE-2014-9831   
                   imagemagick | CVE-2014-9848    | https://security-tracker.debian.org/tracker/CVE-2014-9848   
                   imagemagick | CVE-2014-9852    | https://security-tracker.debian.org/tracker/CVE-2014-9852   
                   imagemagick | CVE-2014-9853    | https://security-tracker.debian.org/tracker/CVE-2014-9853   
                   imagemagick | CVE-2014-9854    | https://security-tracker.debian.org/tracker/CVE-2014-9854   
                   imagemagick | CVE-2014-9907    | https://security-tracker.debian.org/tracker/CVE-2014-9907   
                   imagemagick | CVE-2016-10062   | https://security-tracker.debian.org/tracker/CVE-2016-10062  
                   imagemagick | CVE-2016-10144   | https://security-tracker.debian.org/tracker/CVE-2016-10144  
                   imagemagick | CVE-2016-10145   | https://security-tracker.debian.org/tracker/CVE-2016-10145  
                   imagemagick | CVE-2016-10146   | https://security-tracker.debian.org/tracker/CVE-2016-10146  
                   imagemagick | CVE-2016-7513    | https://security-tracker.debian.org/tracker/CVE-2016-7513   
                   imagemagick | CVE-2016-7514    | https://security-tracker.debian.org/tracker/CVE-2016-7514   
                   imagemagick | CVE-2016-7515    | https://security-tracker.debian.org/tracker/CVE-2016-7515   
                   imagemagick | CVE-2016-7516    | https://security-tracker.debian.org/tracker/CVE-2016-7516   
                   imagemagick | CVE-2016-7517    | https://security-tracker.debian.org/tracker/CVE-2016-7517   
                   imagemagick | CVE-2016-7518    | https://security-tracker.debian.org/tracker/CVE-2016-7518   
                   imagemagick | CVE-2016-7519    | https://security-tracker.debian.org/tracker/CVE-2016-7519   
                   imagemagick | CVE-2016-7520    | https://security-tracker.debian.org/tracker/CVE-2016-7520   
                   imagemagick | CVE-2016-7521    | https://security-tracker.debian.org/tracker/CVE-2016-7521   
                   imagemagick | CVE-2016-7522    | https://security-tracker.debian.org/tracker/CVE-2016-7522   
                   imagemagick | CVE-2016-7523    | https://security-tracker.debian.org/tracker/CVE-2016-7523   
                   imagemagick | CVE-2016-7524    | https://security-tracker.debian.org/tracker/CVE-2016-7524   
                   imagemagick | CVE-2016-7525    | https://security-tracker.debian.org/tracker/CVE-2016-7525   
                   imagemagick | CVE-2016-7526    | https://security-tracker.debian.org/tracker/CVE-2016-7526   
                   imagemagick | CVE-2016-7527    | https://security-tracker.debian.org/tracker/CVE-2016-7527   
                   imagemagick | CVE-2016-7528    | https://security-tracker.debian.org/tracker/CVE-2016-7528   
                   imagemagick | CVE-2016-7529    | https://security-tracker.debian.org/tracker/CVE-2016-7529   
                   imagemagick | CVE-2016-7530    | https://security-tracker.debian.org/tracker/CVE-2016-7530   
                   imagemagick | CVE-2016-7531    | https://security-tracker.debian.org/tracker/CVE-2016-7531   
                   imagemagick | CVE-2016-7532    | https://security-tracker.debian.org/tracker/CVE-2016-7532   
                   imagemagick | CVE-2016-7533    | https://security-tracker.debian.org/tracker/CVE-2016-7533   
                   imagemagick | CVE-2016-7534    | https://security-tracker.debian.org/tracker/CVE-2016-7534   
                   imagemagick | CVE-2016-7535    | https://security-tracker.debian.org/tracker/CVE-2016-7535   
                   imagemagick | CVE-2016-7536    | https://security-tracker.debian.org/tracker/CVE-2016-7536   
                   imagemagick | CVE-2016-7537    | https://security-tracker.debian.org/tracker/CVE-2016-7537   
                   imagemagick | CVE-2016-7538    | https://security-tracker.debian.org/tracker/CVE-2016-7538   
                   imagemagick | CVE-2017-5506    | https://security-tracker.debian.org/tracker/CVE-2017-5506   
                   imagemagick | CVE-2017-5509    | https://security-tracker.debian.org/tracker/CVE-2017-5509   
                   imagemagick | CVE-2017-5510    | https://security-tracker.debian.org/tracker/CVE-2017-5510   
                   imagemagick | CVE-2017-5511    | https://security-tracker.debian.org/tracker/CVE-2017-5511   
                        jasper | CVE-2015-8751    | https://security-tracker.debian.org/tracker/CVE-2015-8751   
                         jhead | CVE-2022-41751   | https://security-tracker.debian.org/tracker/CVE-2022-41751  
                        jquery | CVE-2007-2379    | https://security-tracker.debian.org/tracker/CVE-2007-2379   
                         libao | CVE-2017-11548   | https://security-tracker.debian.org/tracker/CVE-2017-11548  
                  libfreeimage | CVE-2019-12211   | https://security-tracker.debian.org/tracker/CVE-2019-12211  
                  libfreeimage | CVE-2019-12212   | https://security-tracker.debian.org/tracker/CVE-2019-12212  
                  libfreeimage | CVE-2019-12213   | https://security-tracker.debian.org/tracker/CVE-2019-12213  
                  libfreeimage | CVE-2019-12214   | https://security-tracker.debian.org/tracker/CVE-2019-12214  
                     libiberty | CVE-2012-3509    | https://security-tracker.debian.org/tracker/CVE-2012-3509   
                     libiberty | CVE-2016-2226    | https://security-tracker.debian.org/tracker/CVE-2016-2226   
                     libiberty | CVE-2016-4487    | https://security-tracker.debian.org/tracker/CVE-2016-4487   
                     libiberty | CVE-2016-4488    | https://security-tracker.debian.org/tracker/CVE-2016-4488   
                     libiberty | CVE-2016-4489    | https://security-tracker.debian.org/tracker/CVE-2016-4489   
                     libiberty | CVE-2016-4490    | https://security-tracker.debian.org/tracker/CVE-2016-4490   
                     libiberty | CVE-2016-4491    | https://security-tracker.debian.org/tracker/CVE-2016-4491   
                     libiberty | CVE-2016-4492    | https://security-tracker.debian.org/tracker/CVE-2016-4492   
                     libiberty | CVE-2016-4493    | https://security-tracker.debian.org/tracker/CVE-2016-4493   
                     libiberty | CVE-2016-6131    | https://security-tracker.debian.org/tracker/CVE-2016-6131   
                       libkrb5 | CVE-1999-0143    | https://security-tracker.debian.org/tracker/CVE-1999-0143   
                       libkrb5 | CVE-1999-0713    | https://security-tracker.debian.org/tracker/CVE-1999-0713   
                       libkrb5 | CVE-2007-3149    | https://security-tracker.debian.org/tracker/CVE-2007-3149   
                       libkrb5 | CVE-2007-5894    | https://security-tracker.debian.org/tracker/CVE-2007-5894   
                       libkrb5 | CVE-2007-5902    | https://security-tracker.debian.org/tracker/CVE-2007-5902   
                       libkrb5 | CVE-2009-0844    | https://security-tracker.debian.org/tracker/CVE-2009-0844   
                       libkrb5 | CVE-2009-0846    | https://security-tracker.debian.org/tracker/CVE-2009-0846   
                        libmad | CVE-2018-7263    | https://security-tracker.debian.org/tracker/CVE-2018-7263   
                      libmpeg2 | CVE-2022-37416   | https://security-tracker.debian.org/tracker/CVE-2022-37416  
                      libplist | CVE-2017-5834    | https://security-tracker.debian.org/tracker/CVE-2017-5834   
                      libplist | CVE-2017-5835    | https://security-tracker.debian.org/tracker/CVE-2017-5835   
                      libplist | CVE-2017-5836    | https://security-tracker.debian.org/tracker/CVE-2017-5836   
                        libraw | CVE-2020-35530   | https://security-tracker.debian.org/tracker/CVE-2020-35530  
                        libraw | CVE-2020-35531   | https://security-tracker.debian.org/tracker/CVE-2020-35531  
                        libraw | CVE-2020-35532   | https://security-tracker.debian.org/tracker/CVE-2020-35532  
                        libraw | CVE-2020-35533   | https://security-tracker.debian.org/tracker/CVE-2020-35533  
                        libraw | CVE-2020-35534   | https://security-tracker.debian.org/tracker/CVE-2020-35534  
                        libraw | CVE-2020-35535   | https://security-tracker.debian.org/tracker/CVE-2020-35535  
                    libtorrent | CVE-2009-1760    | https://security-tracker.debian.org/tracker/CVE-2009-1760   
                    libtorrent | CVE-2016-5301    | https://security-tracker.debian.org/tracker/CVE-2016-5301   
                       libvirt | CVE-2014-8135    | https://security-tracker.debian.org/tracker/CVE-2014-8135   
                       libvirt | CVE-2014-8136    | https://security-tracker.debian.org/tracker/CVE-2014-8136   
                       libvirt | CVE-2015-5313    | https://security-tracker.debian.org/tracker/CVE-2015-5313   
                       libvirt | CVE-2018-5748    | https://security-tracker.debian.org/tracker/CVE-2018-5748   
                       libvirt | CVE-2018-6764    | https://security-tracker.debian.org/tracker/CVE-2018-6764   
                       libxslt | CVE-2022-29824   | https://security-tracker.debian.org/tracker/CVE-2022-29824  
                      lighttpd | CVE-2022-37797   | https://security-tracker.debian.org/tracker/CVE-2022-37797  
                      lighttpd | CVE-2022-41556   | https://security-tracker.debian.org/tracker/CVE-2022-41556  
                     linux-pam | CVE-2022-28321   | https://security-tracker.debian.org/tracker/CVE-2022-28321  
                         lrzip | CVE-2022-33067   | https://security-tracker.debian.org/tracker/CVE-2022-33067  
                         lrzsz | CVE-2018-10195   | https://security-tracker.debian.org/tracker/CVE-2018-10195  
                           lua | CVE-2014-5461    | https://security-tracker.debian.org/tracker/CVE-2014-5461   
                           lua | CVE-2020-15888   | https://security-tracker.debian.org/tracker/CVE-2020-15888  
                           lua | CVE-2020-15945   | https://security-tracker.debian.org/tracker/CVE-2020-15945  
                           lua | CVE-2021-43519   | https://security-tracker.debian.org/tracker/CVE-2021-43519  
                       mbedtls | CVE-2021-45450   | https://security-tracker.debian.org/tracker/CVE-2021-45450  
                       mbedtls | CVE-2021-45451   | https://security-tracker.debian.org/tracker/CVE-2021-45451  
                      minetest | CVE-2022-35978   | https://security-tracker.debian.org/tracker/CVE-2022-35978  
                       mongodb | CVE-2014-8180    | https://security-tracker.debian.org/tracker/CVE-2014-8180   
                       mongodb | CVE-2017-18381   | https://security-tracker.debian.org/tracker/CVE-2017-18381  
                       mongodb | CVE-2017-2665    | https://security-tracker.debian.org/tracker/CVE-2017-2665   
                          mutt | CVE-2011-1429    | https://security-tracker.debian.org/tracker/CVE-2011-1429   
                          nasm | CVE-2020-18974   | https://security-tracker.debian.org/tracker/CVE-2020-18974  
                       ncurses | CVE-2021-39537   | https://security-tracker.debian.org/tracker/CVE-2021-39537  
                       ncurses | CVE-2022-29458   | https://security-tracker.debian.org/tracker/CVE-2022-29458  
                      netatalk | CVE-2022-45188   | https://security-tracker.debian.org/tracker/CVE-2022-45188  
                       netsnmp | CVE-2022-44792   | https://security-tracker.debian.org/tracker/CVE-2022-44792  
                       netsnmp | CVE-2022-44793   | https://security-tracker.debian.org/tracker/CVE-2022-44793  
                         nginx | CVE-2021-3618    | https://security-tracker.debian.org/tracker/CVE-2021-3618   
                           ntp | CVE-2014-9750    | https://security-tracker.debian.org/tracker/CVE-2014-9750   
                           ntp | CVE-2014-9751    | https://security-tracker.debian.org/tracker/CVE-2014-9751   
                           ntp | CVE-2015-7691    | https://security-tracker.debian.org/tracker/CVE-2015-7691   
                           ntp | CVE-2015-7692    | https://security-tracker.debian.org/tracker/CVE-2015-7692   
                           ntp | CVE-2015-7701    | https://security-tracker.debian.org/tracker/CVE-2015-7701   
                           ntp | CVE-2015-7702    | https://security-tracker.debian.org/tracker/CVE-2015-7702   
                           ntp | CVE-2015-7703    | https://security-tracker.debian.org/tracker/CVE-2015-7703   
                           ntp | CVE-2015-7704    | https://security-tracker.debian.org/tracker/CVE-2015-7704   
                           ntp | CVE-2015-7705    | https://security-tracker.debian.org/tracker/CVE-2015-7705   
                           ntp | CVE-2015-7849    | https://security-tracker.debian.org/tracker/CVE-2015-7849   
                           ntp | CVE-2015-7850    | https://security-tracker.debian.org/tracker/CVE-2015-7850   
                           ntp | CVE-2015-7852    | https://security-tracker.debian.org/tracker/CVE-2015-7852   
                           ntp | CVE-2015-7853    | https://security-tracker.debian.org/tracker/CVE-2015-7853   
                           ntp | CVE-2015-7854    | https://security-tracker.debian.org/tracker/CVE-2015-7854   
                           ntp | CVE-2015-7855    | https://security-tracker.debian.org/tracker/CVE-2015-7855   
                           ntp | CVE-2015-7973    | https://security-tracker.debian.org/tracker/CVE-2015-7973   
                           ntp | CVE-2015-7974    | https://security-tracker.debian.org/tracker/CVE-2015-7974   
                           ntp | CVE-2015-7977    | https://security-tracker.debian.org/tracker/CVE-2015-7977   
                           ntp | CVE-2016-2518    | https://security-tracker.debian.org/tracker/CVE-2016-2518   
                           ntp | CVE-2016-4953    | https://security-tracker.debian.org/tracker/CVE-2016-4953   
                           ntp | CVE-2016-4954    | https://security-tracker.debian.org/tracker/CVE-2016-4954   
                           ntp | CVE-2016-4955    | https://security-tracker.debian.org/tracker/CVE-2016-4955   
                           ntp | CVE-2016-4956    | https://security-tracker.debian.org/tracker/CVE-2016-4956   
                           ntp | CVE-2016-7426    | https://security-tracker.debian.org/tracker/CVE-2016-7426   
                           ntp | CVE-2016-7434    | https://security-tracker.debian.org/tracker/CVE-2016-7434   
                           ntp | CVE-2017-6458    | https://security-tracker.debian.org/tracker/CVE-2017-6458   
                           ntp | CVE-2018-7170    | https://security-tracker.debian.org/tracker/CVE-2018-7170   
                           ntp | CVE-2018-7185    | https://security-tracker.debian.org/tracker/CVE-2018-7185   
                           ntp | CVE-2019-11331   | https://security-tracker.debian.org/tracker/CVE-2019-11331  
                           ntp | CVE-2019-8936    | https://security-tracker.debian.org/tracker/CVE-2019-8936   
                           ntp | CVE-2020-11868   | https://security-tracker.debian.org/tracker/CVE-2020-11868  
                           ntp | CVE-2020-13817   | https://security-tracker.debian.org/tracker/CVE-2020-13817  
                       opencv3 | CVE-2019-14493   | https://security-tracker.debian.org/tracker/CVE-2019-14493  
                       opencv3 | CVE-2019-15939   | https://security-tracker.debian.org/tracker/CVE-2019-15939  
                       opencv3 | CVE-2019-19624   | https://security-tracker.debian.org/tracker/CVE-2019-19624  
                       openjdk | CVE-2009-2475    | https://security-tracker.debian.org/tracker/CVE-2009-2475   
                       openjdk | CVE-2009-2476    | https://security-tracker.debian.org/tracker/CVE-2009-2476   
                       openjdk | CVE-2009-2689    | https://security-tracker.debian.org/tracker/CVE-2009-2689   
                       openjdk | CVE-2009-2690    | https://security-tracker.debian.org/tracker/CVE-2009-2690   
                       openjdk | CVE-2009-3728    | https://security-tracker.debian.org/tracker/CVE-2009-3728   
                       openjdk | CVE-2009-3879    | https://security-tracker.debian.org/tracker/CVE-2009-3879   
                       openjdk | CVE-2009-3880    | https://security-tracker.debian.org/tracker/CVE-2009-3880   
                       openjdk | CVE-2009-3881    | https://security-tracker.debian.org/tracker/CVE-2009-3881   
                       openjdk | CVE-2009-3882    | https://security-tracker.debian.org/tracker/CVE-2009-3882   
                       openjdk | CVE-2009-3883    | https://security-tracker.debian.org/tracker/CVE-2009-3883   
                       openjdk | CVE-2009-3884    | https://security-tracker.debian.org/tracker/CVE-2009-3884   
                       openjdk | CVE-2013-0169    | https://security-tracker.debian.org/tracker/CVE-2013-0169   
                       openjdk | CVE-2022-21540   | https://security-tracker.debian.org/tracker/CVE-2022-21540  
                       openjdk | CVE-2022-21541   | https://security-tracker.debian.org/tracker/CVE-2022-21541  
                       openjdk | CVE-2022-34169   | https://security-tracker.debian.org/tracker/CVE-2022-34169  
                      openjpeg | CVE-2015-1239    | https://security-tracker.debian.org/tracker/CVE-2015-1239   
                      openjpeg | CVE-2016-9675    | https://security-tracker.debian.org/tracker/CVE-2016-9675   
                      openldap | CVE-2015-3276    | https://security-tracker.debian.org/tracker/CVE-2015-3276   
                      openldap | CVE-2022-29155   | https://security-tracker.debian.org/tracker/CVE-2022-29155  
                       openssh | CVE-2007-2768    | https://security-tracker.debian.org/tracker/CVE-2007-2768   
                       openssh | CVE-2008-3844    | https://security-tracker.debian.org/tracker/CVE-2008-3844   
                       openssh | CVE-2014-9278    | https://security-tracker.debian.org/tracker/CVE-2014-9278   
                      openswan | CVE-2019-10155   | https://security-tracker.debian.org/tracker/CVE-2019-10155  
                   openvmtools | CVE-2014-4199    | https://security-tracker.debian.org/tracker/CVE-2014-4199   
                   openvmtools | CVE-2014-4200    | https://security-tracker.debian.org/tracker/CVE-2014-4200   
                   openvmtools | CVE-2021-31693   | https://security-tracker.debian.org/tracker/CVE-2021-31693  
                   openvmtools | CVE-2022-22943   | https://security-tracker.debian.org/tracker/CVE-2022-22943  
                          opus | CVE-2022-25345   | https://security-tracker.debian.org/tracker/CVE-2022-25345  
                  oracle-mysql | CVE-2012-0583    | https://security-tracker.debian.org/tracker/CVE-2012-0583   
                  oracle-mysql | CVE-2012-1696    | https://security-tracker.debian.org/tracker/CVE-2012-1696   
                  oracle-mysql | CVE-2012-3144    | https://security-tracker.debian.org/tracker/CVE-2012-3144   
                  oracle-mysql | CVE-2012-3147    | https://security-tracker.debian.org/tracker/CVE-2012-3147   
                  oracle-mysql | CVE-2012-3149    | https://security-tracker.debian.org/tracker/CVE-2012-3149   
                  oracle-mysql | CVE-2012-3156    | https://security-tracker.debian.org/tracker/CVE-2012-3156   
                  oracle-mysql | CVE-2012-4414    | https://security-tracker.debian.org/tracker/CVE-2012-4414   
                  oracle-mysql | CVE-2013-1566    | https://security-tracker.debian.org/tracker/CVE-2013-1566   
                  oracle-mysql | CVE-2013-1567    | https://security-tracker.debian.org/tracker/CVE-2013-1567   
                  oracle-mysql | CVE-2013-1570    | https://security-tracker.debian.org/tracker/CVE-2013-1570   
                  oracle-mysql | CVE-2013-2381    | https://security-tracker.debian.org/tracker/CVE-2013-2381   
                  oracle-mysql | CVE-2013-2395    | https://security-tracker.debian.org/tracker/CVE-2013-2395   
                  oracle-mysql | CVE-2013-3795    | https://security-tracker.debian.org/tracker/CVE-2013-3795   
                  oracle-mysql | CVE-2013-3796    | https://security-tracker.debian.org/tracker/CVE-2013-3796   
                  oracle-mysql | CVE-2013-3798    | https://security-tracker.debian.org/tracker/CVE-2013-3798   
                  oracle-mysql | CVE-2013-3806    | https://security-tracker.debian.org/tracker/CVE-2013-3806   
                  oracle-mysql | CVE-2013-3807    | https://security-tracker.debian.org/tracker/CVE-2013-3807   
                  oracle-mysql | CVE-2013-3810    | https://security-tracker.debian.org/tracker/CVE-2013-3810   
                  oracle-mysql | CVE-2013-3811    | https://security-tracker.debian.org/tracker/CVE-2013-3811   
                  oracle-mysql | CVE-2013-5767    | https://security-tracker.debian.org/tracker/CVE-2013-5767   
                  oracle-mysql | CVE-2013-5770    | https://security-tracker.debian.org/tracker/CVE-2013-5770   
                  oracle-mysql | CVE-2013-5786    | https://security-tracker.debian.org/tracker/CVE-2013-5786   
                  oracle-mysql | CVE-2013-5793    | https://security-tracker.debian.org/tracker/CVE-2013-5793   
                  oracle-mysql | CVE-2013-5860    | https://security-tracker.debian.org/tracker/CVE-2013-5860   
                  oracle-mysql | CVE-2013-5881    | https://security-tracker.debian.org/tracker/CVE-2013-5881   
                  oracle-mysql | CVE-2013-5882    | https://security-tracker.debian.org/tracker/CVE-2013-5882   
                  oracle-mysql | CVE-2013-5894    | https://security-tracker.debian.org/tracker/CVE-2013-5894   
                  oracle-mysql | CVE-2014-0427    | https://security-tracker.debian.org/tracker/CVE-2014-0427   
                  oracle-mysql | CVE-2014-0430    | https://security-tracker.debian.org/tracker/CVE-2014-0430   
                  oracle-mysql | CVE-2014-0431    | https://security-tracker.debian.org/tracker/CVE-2014-0431   
                  oracle-mysql | CVE-2014-0433    | https://security-tracker.debian.org/tracker/CVE-2014-0433   
                  oracle-mysql | CVE-2014-2434    | https://security-tracker.debian.org/tracker/CVE-2014-2434   
                  oracle-mysql | CVE-2014-2435    | https://security-tracker.debian.org/tracker/CVE-2014-2435   
                  oracle-mysql | CVE-2014-2442    | https://security-tracker.debian.org/tracker/CVE-2014-2442   
                  oracle-mysql | CVE-2014-2444    | https://security-tracker.debian.org/tracker/CVE-2014-2444   
                  oracle-mysql | CVE-2014-2450    | https://security-tracker.debian.org/tracker/CVE-2014-2450   
                  oracle-mysql | CVE-2014-2451    | https://security-tracker.debian.org/tracker/CVE-2014-2451   
                  oracle-mysql | CVE-2014-2484    | https://security-tracker.debian.org/tracker/CVE-2014-2484   
                  oracle-mysql | CVE-2014-4214    | https://security-tracker.debian.org/tracker/CVE-2014-4214   
                  oracle-mysql | CVE-2014-4233    | https://security-tracker.debian.org/tracker/CVE-2014-4233   
                  oracle-mysql | CVE-2014-4238    | https://security-tracker.debian.org/tracker/CVE-2014-4238   
                  oracle-mysql | CVE-2014-4240    | https://security-tracker.debian.org/tracker/CVE-2014-4240   
                  oracle-mysql | CVE-2015-0385    | https://security-tracker.debian.org/tracker/CVE-2015-0385   
                  oracle-mysql | CVE-2015-0405    | https://security-tracker.debian.org/tracker/CVE-2015-0405   
                  oracle-mysql | CVE-2015-0409    | https://security-tracker.debian.org/tracker/CVE-2015-0409   
                  oracle-mysql | CVE-2015-0423    | https://security-tracker.debian.org/tracker/CVE-2015-0423   
                  oracle-mysql | CVE-2015-0438    | https://security-tracker.debian.org/tracker/CVE-2015-0438   
                  oracle-mysql | CVE-2015-0439    | https://security-tracker.debian.org/tracker/CVE-2015-0439   
                  oracle-mysql | CVE-2015-0498    | https://security-tracker.debian.org/tracker/CVE-2015-0498   
                  oracle-mysql | CVE-2015-0500    | https://security-tracker.debian.org/tracker/CVE-2015-0500   
                  oracle-mysql | CVE-2015-0503    | https://security-tracker.debian.org/tracker/CVE-2015-0503   
                  oracle-mysql | CVE-2015-0506    | https://security-tracker.debian.org/tracker/CVE-2015-0506   
                  oracle-mysql | CVE-2015-0507    | https://security-tracker.debian.org/tracker/CVE-2015-0507   
                  oracle-mysql | CVE-2015-0508    | https://security-tracker.debian.org/tracker/CVE-2015-0508   
                  oracle-mysql | CVE-2015-0511    | https://security-tracker.debian.org/tracker/CVE-2015-0511   
                  oracle-mysql | CVE-2015-2566    | https://security-tracker.debian.org/tracker/CVE-2015-2566   
                  oracle-mysql | CVE-2015-2567    | https://security-tracker.debian.org/tracker/CVE-2015-2567   
                  oracle-mysql | CVE-2015-2611    | https://security-tracker.debian.org/tracker/CVE-2015-2611   
                  oracle-mysql | CVE-2015-2617    | https://security-tracker.debian.org/tracker/CVE-2015-2617   
                  oracle-mysql | CVE-2015-2639    | https://security-tracker.debian.org/tracker/CVE-2015-2639   
                  oracle-mysql | CVE-2015-2641    | https://security-tracker.debian.org/tracker/CVE-2015-2641   
                  oracle-mysql | CVE-2015-2661    | https://security-tracker.debian.org/tracker/CVE-2015-2661   
                  oracle-mysql | CVE-2015-3152    | https://security-tracker.debian.org/tracker/CVE-2015-3152   
                  oracle-mysql | CVE-2015-4730    | https://security-tracker.debian.org/tracker/CVE-2015-4730   
                  oracle-mysql | CVE-2015-4756    | https://security-tracker.debian.org/tracker/CVE-2015-4756   
                  oracle-mysql | CVE-2015-4761    | https://security-tracker.debian.org/tracker/CVE-2015-4761   
                  oracle-mysql | CVE-2015-4766    | https://security-tracker.debian.org/tracker/CVE-2015-4766   
                  oracle-mysql | CVE-2015-4767    | https://security-tracker.debian.org/tracker/CVE-2015-4767   
                  oracle-mysql | CVE-2015-4769    | https://security-tracker.debian.org/tracker/CVE-2015-4769   
                  oracle-mysql | CVE-2015-4771    | https://security-tracker.debian.org/tracker/CVE-2015-4771   
                  oracle-mysql | CVE-2015-4772    | https://security-tracker.debian.org/tracker/CVE-2015-4772   
                  oracle-mysql | CVE-2015-4791    | https://security-tracker.debian.org/tracker/CVE-2015-4791   
                  oracle-mysql | CVE-2015-4800    | https://security-tracker.debian.org/tracker/CVE-2015-4800   
                  oracle-mysql | CVE-2015-4833    | https://security-tracker.debian.org/tracker/CVE-2015-4833   
                  oracle-mysql | CVE-2015-4862    | https://security-tracker.debian.org/tracker/CVE-2015-4862   
                  oracle-mysql | CVE-2015-4890    | https://security-tracker.debian.org/tracker/CVE-2015-4890   
                  oracle-mysql | CVE-2015-4904    | https://security-tracker.debian.org/tracker/CVE-2015-4904   
                  oracle-mysql | CVE-2015-4905    | https://security-tracker.debian.org/tracker/CVE-2015-4905   
                  oracle-mysql | CVE-2015-4910    | https://security-tracker.debian.org/tracker/CVE-2015-4910   
                  oracle-mysql | CVE-2016-0503    | https://security-tracker.debian.org/tracker/CVE-2016-0503   
                  oracle-mysql | CVE-2016-0504    | https://security-tracker.debian.org/tracker/CVE-2016-0504   
                  oracle-mysql | CVE-2016-0594    | https://security-tracker.debian.org/tracker/CVE-2016-0594   
                  oracle-mysql | CVE-2016-0595    | https://security-tracker.debian.org/tracker/CVE-2016-0595   
                  oracle-mysql | CVE-2016-0607    | https://security-tracker.debian.org/tracker/CVE-2016-0607   
                  oracle-mysql | CVE-2016-0610    | https://security-tracker.debian.org/tracker/CVE-2016-0610   
                  oracle-mysql | CVE-2016-0611    | https://security-tracker.debian.org/tracker/CVE-2016-0611   
                  oracle-mysql | CVE-2016-0616    | https://security-tracker.debian.org/tracker/CVE-2016-0616   
                  oracle-mysql | CVE-2016-0652    | https://security-tracker.debian.org/tracker/CVE-2016-0652   
                  oracle-mysql | CVE-2016-0653    | https://security-tracker.debian.org/tracker/CVE-2016-0653   
                  oracle-mysql | CVE-2016-0654    | https://security-tracker.debian.org/tracker/CVE-2016-0654   
                  oracle-mysql | CVE-2016-0656    | https://security-tracker.debian.org/tracker/CVE-2016-0656   
                  oracle-mysql | CVE-2016-0657    | https://security-tracker.debian.org/tracker/CVE-2016-0657   
                  oracle-mysql | CVE-2016-0658    | https://security-tracker.debian.org/tracker/CVE-2016-0658   
                  oracle-mysql | CVE-2016-0659    | https://security-tracker.debian.org/tracker/CVE-2016-0659   
                  oracle-mysql | CVE-2016-0662    | https://security-tracker.debian.org/tracker/CVE-2016-0662   
                  oracle-mysql | CVE-2016-0663    | https://security-tracker.debian.org/tracker/CVE-2016-0663   
                  oracle-mysql | CVE-2016-0667    | https://security-tracker.debian.org/tracker/CVE-2016-0667   
                  oracle-mysql | CVE-2016-3424    | https://security-tracker.debian.org/tracker/CVE-2016-3424   
                  oracle-mysql | CVE-2016-3440    | https://security-tracker.debian.org/tracker/CVE-2016-3440   
                  oracle-mysql | CVE-2016-3518    | https://security-tracker.debian.org/tracker/CVE-2016-3518   
                  oracle-mysql | CVE-2016-3588    | https://security-tracker.debian.org/tracker/CVE-2016-3588   
                  oracle-mysql | CVE-2016-5436    | https://security-tracker.debian.org/tracker/CVE-2016-5436   
                  oracle-mysql | CVE-2016-5437    | https://security-tracker.debian.org/tracker/CVE-2016-5437   
                  oracle-mysql | CVE-2016-5441    | https://security-tracker.debian.org/tracker/CVE-2016-5441   
                  oracle-mysql | CVE-2016-5442    | https://security-tracker.debian.org/tracker/CVE-2016-5442   
                  oracle-mysql | CVE-2016-5443    | https://security-tracker.debian.org/tracker/CVE-2016-5443   
                  oracle-mysql | CVE-2016-5628    | https://security-tracker.debian.org/tracker/CVE-2016-5628   
                  oracle-mysql | CVE-2016-5631    | https://security-tracker.debian.org/tracker/CVE-2016-5631   
                  oracle-mysql | CVE-2016-5632    | https://security-tracker.debian.org/tracker/CVE-2016-5632   
                  oracle-mysql | CVE-2016-5633    | https://security-tracker.debian.org/tracker/CVE-2016-5633   
                  oracle-mysql | CVE-2016-5634    | https://security-tracker.debian.org/tracker/CVE-2016-5634   
                  oracle-mysql | CVE-2016-5635    | https://security-tracker.debian.org/tracker/CVE-2016-5635   
                  oracle-mysql | CVE-2016-8286    | https://security-tracker.debian.org/tracker/CVE-2016-8286   
                  oracle-mysql | CVE-2016-8287    | https://security-tracker.debian.org/tracker/CVE-2016-8287   
                  oracle-mysql | CVE-2016-8289    | https://security-tracker.debian.org/tracker/CVE-2016-8289   
                  oracle-mysql | CVE-2016-8290    | https://security-tracker.debian.org/tracker/CVE-2016-8290   
                  oracle-mysql | CVE-2017-10165   | https://security-tracker.debian.org/tracker/CVE-2017-10165  
                  oracle-mysql | CVE-2017-10167   | https://security-tracker.debian.org/tracker/CVE-2017-10167  
                  oracle-mysql | CVE-2017-10284   | https://security-tracker.debian.org/tracker/CVE-2017-10284  
                  oracle-mysql | CVE-2017-10296   | https://security-tracker.debian.org/tracker/CVE-2017-10296  
                  oracle-mysql | CVE-2017-10311   | https://security-tracker.debian.org/tracker/CVE-2017-10311  
                  oracle-mysql | CVE-2017-10313   | https://security-tracker.debian.org/tracker/CVE-2017-10313  
                  oracle-mysql | CVE-2017-3251    | https://security-tracker.debian.org/tracker/CVE-2017-3251   
                  oracle-mysql | CVE-2017-3256    | https://security-tracker.debian.org/tracker/CVE-2017-3256   
                  oracle-mysql | CVE-2017-3319    | https://security-tracker.debian.org/tracker/CVE-2017-3319   
                  oracle-mysql | CVE-2017-3320    | https://security-tracker.debian.org/tracker/CVE-2017-3320   
                  oracle-mysql | CVE-2017-3452    | https://security-tracker.debian.org/tracker/CVE-2017-3452   
                  oracle-mysql | CVE-2017-3454    | https://security-tracker.debian.org/tracker/CVE-2017-3454   
                  oracle-mysql | CVE-2017-3455    | https://security-tracker.debian.org/tracker/CVE-2017-3455   
                  oracle-mysql | CVE-2017-3457    | https://security-tracker.debian.org/tracker/CVE-2017-3457   
                  oracle-mysql | CVE-2017-3458    | https://security-tracker.debian.org/tracker/CVE-2017-3458   
                  oracle-mysql | CVE-2017-3459    | https://security-tracker.debian.org/tracker/CVE-2017-3459   
                  oracle-mysql | CVE-2017-3460    | https://security-tracker.debian.org/tracker/CVE-2017-3460   
                  oracle-mysql | CVE-2017-3465    | https://security-tracker.debian.org/tracker/CVE-2017-3465   
                  oracle-mysql | CVE-2017-3467    | https://security-tracker.debian.org/tracker/CVE-2017-3467   
                  oracle-mysql | CVE-2017-3468    | https://security-tracker.debian.org/tracker/CVE-2017-3468   
                  oracle-mysql | CVE-2017-3529    | https://security-tracker.debian.org/tracker/CVE-2017-3529   
                  oracle-mysql | CVE-2017-3637    | https://security-tracker.debian.org/tracker/CVE-2017-3637   
                  oracle-mysql | CVE-2017-3638    | https://security-tracker.debian.org/tracker/CVE-2017-3638   
                  oracle-mysql | CVE-2017-3639    | https://security-tracker.debian.org/tracker/CVE-2017-3639   
                  oracle-mysql | CVE-2017-3640    | https://security-tracker.debian.org/tracker/CVE-2017-3640   
                  oracle-mysql | CVE-2017-3642    | https://security-tracker.debian.org/tracker/CVE-2017-3642   
                  oracle-mysql | CVE-2017-3643    | https://security-tracker.debian.org/tracker/CVE-2017-3643   
                  oracle-mysql | CVE-2017-3644    | https://security-tracker.debian.org/tracker/CVE-2017-3644   
                  oracle-mysql | CVE-2017-3645    | https://security-tracker.debian.org/tracker/CVE-2017-3645   
                  oracle-mysql | CVE-2017-3646    | https://security-tracker.debian.org/tracker/CVE-2017-3646   
                  oracle-mysql | CVE-2017-3650    | https://security-tracker.debian.org/tracker/CVE-2017-3650   
                  oracle-mysql | CVE-2018-0735    | https://security-tracker.debian.org/tracker/CVE-2018-0735   
                  oracle-mysql | CVE-2018-3061    | https://security-tracker.debian.org/tracker/CVE-2018-3061   
                  oracle-mysql | CVE-2018-3067    | https://security-tracker.debian.org/tracker/CVE-2018-3067   
                  oracle-mysql | CVE-2018-3071    | https://security-tracker.debian.org/tracker/CVE-2018-3071   
                  oracle-mysql | CVE-2018-3073    | https://security-tracker.debian.org/tracker/CVE-2018-3073   
                  oracle-mysql | CVE-2018-3074    | https://security-tracker.debian.org/tracker/CVE-2018-3074   
                  oracle-mysql | CVE-2018-3075    | https://security-tracker.debian.org/tracker/CVE-2018-3075   
                  oracle-mysql | CVE-2018-3078    | https://security-tracker.debian.org/tracker/CVE-2018-3078   
                  oracle-mysql | CVE-2018-3079    | https://security-tracker.debian.org/tracker/CVE-2018-3079   
                  oracle-mysql | CVE-2018-3080    | https://security-tracker.debian.org/tracker/CVE-2018-3080   
                  oracle-mysql | CVE-2018-3082    | https://security-tracker.debian.org/tracker/CVE-2018-3082   
                  oracle-mysql | CVE-2018-3084    | https://security-tracker.debian.org/tracker/CVE-2018-3084   
                  oracle-mysql | CVE-2018-3137    | https://security-tracker.debian.org/tracker/CVE-2018-3137   
                  oracle-mysql | CVE-2018-3145    | https://security-tracker.debian.org/tracker/CVE-2018-3145   
                  oracle-mysql | CVE-2018-3170    | https://security-tracker.debian.org/tracker/CVE-2018-3170   
                  oracle-mysql | CVE-2018-3182    | https://security-tracker.debian.org/tracker/CVE-2018-3182   
                  oracle-mysql | CVE-2018-3186    | https://security-tracker.debian.org/tracker/CVE-2018-3186   
                  oracle-mysql | CVE-2018-3195    | https://security-tracker.debian.org/tracker/CVE-2018-3195   
                  oracle-mysql | CVE-2018-3203    | https://security-tracker.debian.org/tracker/CVE-2018-3203   
                  oracle-mysql | CVE-2018-3212    | https://security-tracker.debian.org/tracker/CVE-2018-3212   
                  oracle-mysql | CVE-2018-3279    | https://security-tracker.debian.org/tracker/CVE-2018-3279   
                  oracle-mysql | CVE-2018-3280    | https://security-tracker.debian.org/tracker/CVE-2018-3280   
                  oracle-mysql | CVE-2018-3285    | https://security-tracker.debian.org/tracker/CVE-2018-3285   
                  oracle-mysql | CVE-2018-3286    | https://security-tracker.debian.org/tracker/CVE-2018-3286   
                  oracle-mysql | CVE-2019-2436    | https://security-tracker.debian.org/tracker/CVE-2019-2436   
                  oracle-mysql | CVE-2019-2494    | https://security-tracker.debian.org/tracker/CVE-2019-2494   
                  oracle-mysql | CVE-2019-2495    | https://security-tracker.debian.org/tracker/CVE-2019-2495   
                  oracle-mysql | CVE-2019-2502    | https://security-tracker.debian.org/tracker/CVE-2019-2502   
                  oracle-mysql | CVE-2019-2513    | https://security-tracker.debian.org/tracker/CVE-2019-2513   
                  oracle-mysql | CVE-2019-2530    | https://security-tracker.debian.org/tracker/CVE-2019-2530   
                  oracle-mysql | CVE-2019-2533    | https://security-tracker.debian.org/tracker/CVE-2019-2533   
                  oracle-mysql | CVE-2019-2535    | https://security-tracker.debian.org/tracker/CVE-2019-2535   
                  oracle-mysql | CVE-2019-2536    | https://security-tracker.debian.org/tracker/CVE-2019-2536   
                  oracle-mysql | CVE-2019-2539    | https://security-tracker.debian.org/tracker/CVE-2019-2539   
                  oracle-mysql | CVE-2019-2731    | https://security-tracker.debian.org/tracker/CVE-2019-2731   
                  oracle-mysql | CVE-2019-2741    | https://security-tracker.debian.org/tracker/CVE-2019-2741   
                  oracle-mysql | CVE-2019-2743    | https://security-tracker.debian.org/tracker/CVE-2019-2743   
                  oracle-mysql | CVE-2019-2746    | https://security-tracker.debian.org/tracker/CVE-2019-2746   
                  oracle-mysql | CVE-2019-2747    | https://security-tracker.debian.org/tracker/CVE-2019-2747   
                  oracle-mysql | CVE-2019-2752    | https://security-tracker.debian.org/tracker/CVE-2019-2752   
                  oracle-mysql | CVE-2019-2755    | https://security-tracker.debian.org/tracker/CVE-2019-2755   
                  oracle-mysql | CVE-2019-2757    | https://security-tracker.debian.org/tracker/CVE-2019-2757   
                  oracle-mysql | CVE-2019-2780    | https://security-tracker.debian.org/tracker/CVE-2019-2780   
                  oracle-mysql | CVE-2019-2784    | https://security-tracker.debian.org/tracker/CVE-2019-2784   
                  oracle-mysql | CVE-2019-2785    | https://security-tracker.debian.org/tracker/CVE-2019-2785   
                  oracle-mysql | CVE-2019-2789    | https://security-tracker.debian.org/tracker/CVE-2019-2789   
                  oracle-mysql | CVE-2019-2795    | https://security-tracker.debian.org/tracker/CVE-2019-2795   
                  oracle-mysql | CVE-2019-2796    | https://security-tracker.debian.org/tracker/CVE-2019-2796   
                  oracle-mysql | CVE-2019-2798    | https://security-tracker.debian.org/tracker/CVE-2019-2798   
                  oracle-mysql | CVE-2019-2800    | https://security-tracker.debian.org/tracker/CVE-2019-2800   
                  oracle-mysql | CVE-2019-2801    | https://security-tracker.debian.org/tracker/CVE-2019-2801   
                  oracle-mysql | CVE-2019-2802    | https://security-tracker.debian.org/tracker/CVE-2019-2802   
                  oracle-mysql | CVE-2019-2803    | https://security-tracker.debian.org/tracker/CVE-2019-2803   
                  oracle-mysql | CVE-2019-2808    | https://security-tracker.debian.org/tracker/CVE-2019-2808   
                  oracle-mysql | CVE-2019-2810    | https://security-tracker.debian.org/tracker/CVE-2019-2810   
                  oracle-mysql | CVE-2019-2811    | https://security-tracker.debian.org/tracker/CVE-2019-2811   
                  oracle-mysql | CVE-2019-2812    | https://security-tracker.debian.org/tracker/CVE-2019-2812   
                  oracle-mysql | CVE-2019-2814    | https://security-tracker.debian.org/tracker/CVE-2019-2814   
                  oracle-mysql | CVE-2019-2815    | https://security-tracker.debian.org/tracker/CVE-2019-2815   
                  oracle-mysql | CVE-2019-2822    | https://security-tracker.debian.org/tracker/CVE-2019-2822   
                  oracle-mysql | CVE-2019-2826    | https://security-tracker.debian.org/tracker/CVE-2019-2826   
                  oracle-mysql | CVE-2019-2830    | https://security-tracker.debian.org/tracker/CVE-2019-2830   
                  oracle-mysql | CVE-2019-2834    | https://security-tracker.debian.org/tracker/CVE-2019-2834   
                  oracle-mysql | CVE-2019-2879    | https://security-tracker.debian.org/tracker/CVE-2019-2879   
                  oracle-mysql | CVE-2019-3004    | https://security-tracker.debian.org/tracker/CVE-2019-3004   
                  oracle-mysql | CVE-2019-7317    | https://security-tracker.debian.org/tracker/CVE-2019-7317   
                  oracle-mysql | CVE-2020-14575   | https://security-tracker.debian.org/tracker/CVE-2020-14575  
                  oracle-mysql | CVE-2020-14597   | https://security-tracker.debian.org/tracker/CVE-2020-14597  
                  oracle-mysql | CVE-2020-14614   | https://security-tracker.debian.org/tracker/CVE-2020-14614  
                  oracle-mysql | CVE-2020-14619   | https://security-tracker.debian.org/tracker/CVE-2020-14619  
                  oracle-mysql | CVE-2020-14620   | https://security-tracker.debian.org/tracker/CVE-2020-14620  
                  oracle-mysql | CVE-2020-14623   | https://security-tracker.debian.org/tracker/CVE-2020-14623  
                  oracle-mysql | CVE-2020-14624   | https://security-tracker.debian.org/tracker/CVE-2020-14624  
                  oracle-mysql | CVE-2020-14631   | https://security-tracker.debian.org/tracker/CVE-2020-14631  
                  oracle-mysql | CVE-2020-14643   | https://security-tracker.debian.org/tracker/CVE-2020-14643  
                  oracle-mysql | CVE-2020-14651   | https://security-tracker.debian.org/tracker/CVE-2020-14651  
                  oracle-mysql | CVE-2020-14654   | https://security-tracker.debian.org/tracker/CVE-2020-14654  
                  oracle-mysql | CVE-2020-14656   | https://security-tracker.debian.org/tracker/CVE-2020-14656  
                  oracle-mysql | CVE-2020-14663   | https://security-tracker.debian.org/tracker/CVE-2020-14663  
                  oracle-mysql | CVE-2020-14678   | https://security-tracker.debian.org/tracker/CVE-2020-14678  
                  oracle-mysql | CVE-2020-14680   | https://security-tracker.debian.org/tracker/CVE-2020-14680  
                  oracle-mysql | CVE-2020-14697   | https://security-tracker.debian.org/tracker/CVE-2020-14697  
                  oracle-mysql | CVE-2020-14702   | https://security-tracker.debian.org/tracker/CVE-2020-14702  
                  oracle-mysql | CVE-2020-14760   | https://security-tracker.debian.org/tracker/CVE-2020-14760  
                  oracle-mysql | CVE-2020-14814   | https://security-tracker.debian.org/tracker/CVE-2020-14814  
                  oracle-mysql | CVE-2020-14830   | https://security-tracker.debian.org/tracker/CVE-2020-14830  
                  oracle-mysql | CVE-2020-14837   | https://security-tracker.debian.org/tracker/CVE-2020-14837  
                  oracle-mysql | CVE-2020-14839   | https://security-tracker.debian.org/tracker/CVE-2020-14839  
                  oracle-mysql | CVE-2020-14845   | https://security-tracker.debian.org/tracker/CVE-2020-14845  
                  oracle-mysql | CVE-2020-14846   | https://security-tracker.debian.org/tracker/CVE-2020-14846  
                  oracle-mysql | CVE-2020-14852   | https://security-tracker.debian.org/tracker/CVE-2020-14852  
                  oracle-mysql | CVE-2020-15358   | https://security-tracker.debian.org/tracker/CVE-2020-15358  
                  oracle-mysql | CVE-2020-1967    | https://security-tracker.debian.org/tracker/CVE-2020-1967   
                  oracle-mysql | CVE-2020-1971    | https://security-tracker.debian.org/tracker/CVE-2020-1971   
                  oracle-mysql | CVE-2021-22570   | https://security-tracker.debian.org/tracker/CVE-2021-22570  
                  oracle-mysql | CVE-2021-2356    | https://security-tracker.debian.org/tracker/CVE-2021-2356   
                  oracle-mysql | CVE-2022-21417   | https://security-tracker.debian.org/tracker/CVE-2022-21417  
                  oracle-mysql | CVE-2022-21444   | https://security-tracker.debian.org/tracker/CVE-2022-21444  
                         p7zip | CVE-2017-17969   | https://security-tracker.debian.org/tracker/CVE-2017-17969  
                         p7zip | CVE-2018-5996    | https://security-tracker.debian.org/tracker/CVE-2018-5996   
                         patch | CVE-2018-6952    | https://security-tracker.debian.org/tracker/CVE-2018-6952   
                         patch | CVE-2019-20633   | https://security-tracker.debian.org/tracker/CVE-2019-20633  
                           php | CVE-2007-2728    | https://security-tracker.debian.org/tracker/CVE-2007-2728   
                           php | CVE-2007-3205    | https://security-tracker.debian.org/tracker/CVE-2007-3205   
                           php | CVE-2007-4596    | https://security-tracker.debian.org/tracker/CVE-2007-4596   
                    postgresql | CVE-2017-8806    | https://security-tracker.debian.org/tracker/CVE-2017-8806   
                 powerpc-utils | CVE-2014-8165    | https://security-tracker.debian.org/tracker/CVE-2014-8165   
                          pppd | CVE-2018-11574   | https://security-tracker.debian.org/tracker/CVE-2018-11574  
                       proftpd | CVE-2021-46854   | https://security-tracker.debian.org/tracker/CVE-2021-46854  
                python-aiohttp | CVE-2022-33124   | https://security-tracker.debian.org/tracker/CVE-2022-33124  
               python-m2crypto | CVE-2020-25657   | https://security-tracker.debian.org/tracker/CVE-2020-25657  
                 python-pillow | CVE-2022-45199   | https://security-tracker.debian.org/tracker/CVE-2022-45199  
                    python-pip | CVE-2018-20225   | https://security-tracker.debian.org/tracker/CVE-2018-20225  
                     python-py | CVE-2022-42969   | https://security-tracker.debian.org/tracker/CVE-2022-42969  
                python-twisted | CVE-2022-24801   | https://security-tracker.debian.org/tracker/CVE-2022-24801  
                python-twisted | CVE-2022-39348   | https://security-tracker.debian.org/tracker/CVE-2022-39348  
                          qemu | CVE-2018-18438   | https://security-tracker.debian.org/tracker/CVE-2018-18438  
                          qemu | CVE-2019-12067   | https://security-tracker.debian.org/tracker/CVE-2019-12067  
                          qemu | CVE-2021-20255   | https://security-tracker.debian.org/tracker/CVE-2021-20255  
                          qemu | CVE-2022-2962    | https://security-tracker.debian.org/tracker/CVE-2022-2962   
                          qemu | CVE-2022-3165    | https://security-tracker.debian.org/tracker/CVE-2022-3165   
                          qemu | CVE-2022-35414   | https://security-tracker.debian.org/tracker/CVE-2022-35414  
                          qemu | CVE-2022-3872    | https://security-tracker.debian.org/tracker/CVE-2022-3872   
                          qemu | CVE-2022-4144    | https://security-tracker.debian.org/tracker/CVE-2022-4144   
                          qemu | CVE-2022-4172    | https://security-tracker.debian.org/tracker/CVE-2022-4172   
                        quagga | CVE-2016-4049    | https://security-tracker.debian.org/tracker/CVE-2016-4049   
                        quagga | CVE-2017-3224    | https://security-tracker.debian.org/tracker/CVE-2017-3224   
                        quagga | CVE-2021-44038   | https://security-tracker.debian.org/tracker/CVE-2021-44038  
               rabbitmq-server | CVE-2020-5419    | https://security-tracker.debian.org/tracker/CVE-2020-5419   
               rabbitmq-server | CVE-2021-22116   | https://security-tracker.debian.org/tracker/CVE-2021-22116  
               rabbitmq-server | CVE-2021-22117   | https://security-tracker.debian.org/tracker/CVE-2021-22117  
               rabbitmq-server | CVE-2021-32718   | https://security-tracker.debian.org/tracker/CVE-2021-32718  
               rabbitmq-server | CVE-2021-32719   | https://security-tracker.debian.org/tracker/CVE-2021-32719  
               rabbitmq-server | CVE-2022-31008   | https://security-tracker.debian.org/tracker/CVE-2022-31008  
                   resiprocate | CVE-2017-9454    | https://security-tracker.debian.org/tracker/CVE-2017-9454   
                           rpm | CVE-2021-3521    | https://security-tracker.debian.org/tracker/CVE-2021-3521   
                           rpm | CVE-2021-35937   | https://security-tracker.debian.org/tracker/CVE-2021-35937  
                           rpm | CVE-2021-35938   | https://security-tracker.debian.org/tracker/CVE-2021-35938  
                           rpm | CVE-2021-35939   | https://security-tracker.debian.org/tracker/CVE-2021-35939  
                        samba4 | CVE-2011-2411    | https://security-tracker.debian.org/tracker/CVE-2011-2411   
                        samba4 | CVE-2021-3670    | https://security-tracker.debian.org/tracker/CVE-2021-3670   
                        samba4 | CVE-2022-1615    | https://security-tracker.debian.org/tracker/CVE-2022-1615   
                        samba4 | CVE-2022-32743   | https://security-tracker.debian.org/tracker/CVE-2022-32743  
                           sdl | CVE-2019-13616   | https://security-tracker.debian.org/tracker/CVE-2019-13616  
                           sdl | CVE-2019-14906   | https://security-tracker.debian.org/tracker/CVE-2019-14906  
                           sdl | CVE-2019-7572    | https://security-tracker.debian.org/tracker/CVE-2019-7572   
                           sdl | CVE-2019-7573    | https://security-tracker.debian.org/tracker/CVE-2019-7573   
                           sdl | CVE-2019-7574    | https://security-tracker.debian.org/tracker/CVE-2019-7574   
                           sdl | CVE-2019-7575    | https://security-tracker.debian.org/tracker/CVE-2019-7575   
                           sdl | CVE-2019-7576    | https://security-tracker.debian.org/tracker/CVE-2019-7576   
                           sdl | CVE-2019-7577    | https://security-tracker.debian.org/tracker/CVE-2019-7577   
                           sdl | CVE-2019-7578    | https://security-tracker.debian.org/tracker/CVE-2019-7578   
                           sdl | CVE-2019-7635    | https://security-tracker.debian.org/tracker/CVE-2019-7635   
                           sdl | CVE-2019-7636    | https://security-tracker.debian.org/tracker/CVE-2019-7636   
                           sdl | CVE-2019-7637    | https://security-tracker.debian.org/tracker/CVE-2019-7637   
                           sdl | CVE-2019-7638    | https://security-tracker.debian.org/tracker/CVE-2019-7638   
                           sdl | CVE-2020-14409   | https://security-tracker.debian.org/tracker/CVE-2020-14409  
                           sdl | CVE-2020-14410   | https://security-tracker.debian.org/tracker/CVE-2020-14410  
                         smack | CVE-2014-0363    | https://security-tracker.debian.org/tracker/CVE-2014-0363   
                         smack | CVE-2014-0364    | https://security-tracker.debian.org/tracker/CVE-2014-0364   
                         smack | CVE-2016-10027   | https://security-tracker.debian.org/tracker/CVE-2016-10027  
                         spice | CVE-2016-0749    | https://security-tracker.debian.org/tracker/CVE-2016-0749   
                         spice | CVE-2016-2150    | https://security-tracker.debian.org/tracker/CVE-2016-2150   
                         spice | CVE-2018-10893   | https://security-tracker.debian.org/tracker/CVE-2018-10893  
                       systemd | CVE-2022-3821    | https://security-tracker.debian.org/tracker/CVE-2022-3821   
                       systemd | CVE-2022-45873   | https://security-tracker.debian.org/tracker/CVE-2022-45873  
                        thttpd | CVE-2012-5640    | https://security-tracker.debian.org/tracker/CVE-2012-5640   
                          tiff | CVE-2015-7313    | https://security-tracker.debian.org/tracker/CVE-2015-7313   
                          tiff | CVE-2022-2056    | https://security-tracker.debian.org/tracker/CVE-2022-2056   
                          tiff | CVE-2022-2057    | https://security-tracker.debian.org/tracker/CVE-2022-2057   
                          tiff | CVE-2022-2058    | https://security-tracker.debian.org/tracker/CVE-2022-2058   
                          tiff | CVE-2022-2519    | https://security-tracker.debian.org/tracker/CVE-2022-2519   
                          tiff | CVE-2022-2520    | https://security-tracker.debian.org/tracker/CVE-2022-2520   
                          tiff | CVE-2022-2521    | https://security-tracker.debian.org/tracker/CVE-2022-2521   
                          tiff | CVE-2022-2953    | https://security-tracker.debian.org/tracker/CVE-2022-2953   
                          tiff | CVE-2022-34526   | https://security-tracker.debian.org/tracker/CVE-2022-34526  
                          tiff | CVE-2022-3570    | https://security-tracker.debian.org/tracker/CVE-2022-3570   
                          tiff | CVE-2022-3597    | https://security-tracker.debian.org/tracker/CVE-2022-3597   
                          tiff | CVE-2022-3598    | https://security-tracker.debian.org/tracker/CVE-2022-3598   
                          tiff | CVE-2022-3599    | https://security-tracker.debian.org/tracker/CVE-2022-3599   
                          tiff | CVE-2022-3626    | https://security-tracker.debian.org/tracker/CVE-2022-3626   
                          tiff | CVE-2022-3627    | https://security-tracker.debian.org/tracker/CVE-2022-3627   
                          tiff | CVE-2022-3970    | https://security-tracker.debian.org/tracker/CVE-2022-3970   
                          tinc | CVE-2013-1428    | https://security-tracker.debian.org/tracker/CVE-2013-1428   
                           tor | CVE-2016-9079    | https://security-tracker.debian.org/tracker/CVE-2016-9079   
                           tor | CVE-2017-16541   | https://security-tracker.debian.org/tracker/CVE-2017-16541  
                   uboot-tools | CVE-2022-2347    | https://security-tracker.debian.org/tracker/CVE-2022-2347   
                   uboot-tools | CVE-2022-30767   | https://security-tracker.debian.org/tracker/CVE-2022-30767  
                   uboot-tools | CVE-2022-33103   | https://security-tracker.debian.org/tracker/CVE-2022-33103  
                   uboot-tools | CVE-2022-34835   | https://security-tracker.debian.org/tracker/CVE-2022-34835  
                         unrar | CVE-2022-30333   | https://security-tracker.debian.org/tracker/CVE-2022-30333  
                         unzip | CVE-2021-4217    | https://security-tracker.debian.org/tracker/CVE-2021-4217   
                       wayland | CVE-2021-3782    | https://security-tracker.debian.org/tracker/CVE-2021-3782   
                     wireshark | CVE-2022-3190    | https://security-tracker.debian.org/tracker/CVE-2022-3190   
                           xen | CVE-2011-1936    | https://security-tracker.debian.org/tracker/CVE-2011-1936   
                           xen | CVE-2011-3346    | https://security-tracker.debian.org/tracker/CVE-2011-3346   
                           xen | CVE-2014-2580    | https://security-tracker.debian.org/tracker/CVE-2014-2580   
                           xen | CVE-2014-3672    | https://security-tracker.debian.org/tracker/CVE-2014-3672   
                           xen | CVE-2015-7504    | https://security-tracker.debian.org/tracker/CVE-2015-7504   
                           xen | CVE-2015-8550    | https://security-tracker.debian.org/tracker/CVE-2015-8550   
                           xen | CVE-2015-8553    | https://security-tracker.debian.org/tracker/CVE-2015-8553   
                           xen | CVE-2016-3960    | https://security-tracker.debian.org/tracker/CVE-2016-3960   
                           xen | CVE-2016-7092    | https://security-tracker.debian.org/tracker/CVE-2016-7092   
                           xen | CVE-2016-9379    | https://security-tracker.debian.org/tracker/CVE-2016-9379   
                           xen | CVE-2016-9380    | https://security-tracker.debian.org/tracker/CVE-2016-9380   
                           xen | CVE-2016-9383    | https://security-tracker.debian.org/tracker/CVE-2016-9383   
                           xen | CVE-2016-9386    | https://security-tracker.debian.org/tracker/CVE-2016-9386   
                           xen | CVE-2017-12134   | https://security-tracker.debian.org/tracker/CVE-2017-12134  
                           xen | CVE-2017-12135   | https://security-tracker.debian.org/tracker/CVE-2017-12135  
                           xen | CVE-2017-12137   | https://security-tracker.debian.org/tracker/CVE-2017-12137  
                           xen | CVE-2017-7228    | https://security-tracker.debian.org/tracker/CVE-2017-7228   
                           xen | CVE-2018-5244    | https://security-tracker.debian.org/tracker/CVE-2018-5244   
                           xen | CVE-2018-8897    | https://security-tracker.debian.org/tracker/CVE-2018-8897   
                           xen | CVE-2021-26313   | https://security-tracker.debian.org/tracker/CVE-2021-26313  
                           xen | CVE-2021-26314   | https://security-tracker.debian.org/tracker/CVE-2021-26314  
                           xen | CVE-2021-28038   | https://security-tracker.debian.org/tracker/CVE-2021-28038  
                           xen | CVE-2021-28039   | https://security-tracker.debian.org/tracker/CVE-2021-28039  
                           xen | CVE-2021-28687   | https://security-tracker.debian.org/tracker/CVE-2021-28687  
                           xen | CVE-2021-28690   | https://security-tracker.debian.org/tracker/CVE-2021-28690  
                           xen | CVE-2021-28692   | https://security-tracker.debian.org/tracker/CVE-2021-28692  
                           xen | CVE-2021-28693   | https://security-tracker.debian.org/tracker/CVE-2021-28693  
                           xen | CVE-2021-28694   | https://security-tracker.debian.org/tracker/CVE-2021-28694  
                           xen | CVE-2021-28695   | https://security-tracker.debian.org/tracker/CVE-2021-28695  
                           xen | CVE-2021-28696   | https://security-tracker.debian.org/tracker/CVE-2021-28696  
                           xen | CVE-2021-28697   | https://security-tracker.debian.org/tracker/CVE-2021-28697  
                           xen | CVE-2021-28698   | https://security-tracker.debian.org/tracker/CVE-2021-28698  
                           xen | CVE-2021-28699   | https://security-tracker.debian.org/tracker/CVE-2021-28699  
                           xen | CVE-2021-28700   | https://security-tracker.debian.org/tracker/CVE-2021-28700  
                           xen | CVE-2021-28701   | https://security-tracker.debian.org/tracker/CVE-2021-28701  
                           xen | CVE-2021-28702   | https://security-tracker.debian.org/tracker/CVE-2021-28702  
                           xen | CVE-2021-28703   | https://security-tracker.debian.org/tracker/CVE-2021-28703  
                           xen | CVE-2021-28704   | https://security-tracker.debian.org/tracker/CVE-2021-28704  
                           xen | CVE-2021-28707   | https://security-tracker.debian.org/tracker/CVE-2021-28707  
                           xen | CVE-2021-28708   | https://security-tracker.debian.org/tracker/CVE-2021-28708  
                           xen | CVE-2021-28711   | https://security-tracker.debian.org/tracker/CVE-2021-28711  
                           xen | CVE-2021-28712   | https://security-tracker.debian.org/tracker/CVE-2021-28712  
                           xen | CVE-2021-28713   | https://security-tracker.debian.org/tracker/CVE-2021-28713  
                           xen | CVE-2022-21123   | https://security-tracker.debian.org/tracker/CVE-2022-21123  
                           xen | CVE-2022-21125   | https://security-tracker.debian.org/tracker/CVE-2022-21125  
                           xen | CVE-2022-21127   | https://security-tracker.debian.org/tracker/CVE-2022-21127  
                           xen | CVE-2022-21166   | https://security-tracker.debian.org/tracker/CVE-2022-21166  
                           xen | CVE-2022-23033   | https://security-tracker.debian.org/tracker/CVE-2022-23033  
                           xen | CVE-2022-23035   | https://security-tracker.debian.org/tracker/CVE-2022-23035  
                           xen | CVE-2022-23036   | https://security-tracker.debian.org/tracker/CVE-2022-23036  
                           xen | CVE-2022-23037   | https://security-tracker.debian.org/tracker/CVE-2022-23037  
                           xen | CVE-2022-23038   | https://security-tracker.debian.org/tracker/CVE-2022-23038  
                           xen | CVE-2022-23039   | https://security-tracker.debian.org/tracker/CVE-2022-23039  
                           xen | CVE-2022-23040   | https://security-tracker.debian.org/tracker/CVE-2022-23040  
                           xen | CVE-2022-23041   | https://security-tracker.debian.org/tracker/CVE-2022-23041  
                           xen | CVE-2022-23042   | https://security-tracker.debian.org/tracker/CVE-2022-23042  
                           xen | CVE-2022-23824   | https://security-tracker.debian.org/tracker/CVE-2022-23824  
                           xen | CVE-2022-23960   | https://security-tracker.debian.org/tracker/CVE-2022-23960  
                           xen | CVE-2022-26357   | https://security-tracker.debian.org/tracker/CVE-2022-26357  
                           xen | CVE-2022-26358   | https://security-tracker.debian.org/tracker/CVE-2022-26358  
                           xen | CVE-2022-26359   | https://security-tracker.debian.org/tracker/CVE-2022-26359  
                           xen | CVE-2022-26360   | https://security-tracker.debian.org/tracker/CVE-2022-26360  
                           xen | CVE-2022-26361   | https://security-tracker.debian.org/tracker/CVE-2022-26361  
                           xen | CVE-2022-26362   | https://security-tracker.debian.org/tracker/CVE-2022-26362  
                           xen | CVE-2022-26363   | https://security-tracker.debian.org/tracker/CVE-2022-26363  
                           xen | CVE-2022-26364   | https://security-tracker.debian.org/tracker/CVE-2022-26364  
                           xen | CVE-2022-26365   | https://security-tracker.debian.org/tracker/CVE-2022-26365  
                           xen | CVE-2022-29900   | https://security-tracker.debian.org/tracker/CVE-2022-29900  
                           xen | CVE-2022-29901   | https://security-tracker.debian.org/tracker/CVE-2022-29901  
                           xen | CVE-2022-33740   | https://security-tracker.debian.org/tracker/CVE-2022-33740  
                           xen | CVE-2022-33741   | https://security-tracker.debian.org/tracker/CVE-2022-33741  
                           xen | CVE-2022-33742   | https://security-tracker.debian.org/tracker/CVE-2022-33742  
                           xen | CVE-2022-33743   | https://security-tracker.debian.org/tracker/CVE-2022-33743  
                           xen | CVE-2022-33745   | https://security-tracker.debian.org/tracker/CVE-2022-33745  
                           xen | CVE-2022-33746   | https://security-tracker.debian.org/tracker/CVE-2022-33746  
                           xen | CVE-2022-33747   | https://security-tracker.debian.org/tracker/CVE-2022-33747  
                           xen | CVE-2022-33748   | https://security-tracker.debian.org/tracker/CVE-2022-33748  
                           xen | CVE-2022-42309   | https://security-tracker.debian.org/tracker/CVE-2022-42309  
                           xen | CVE-2022-42311   | https://security-tracker.debian.org/tracker/CVE-2022-42311  
                           xen | CVE-2022-42312   | https://security-tracker.debian.org/tracker/CVE-2022-42312  
                           xen | CVE-2022-42313   | https://security-tracker.debian.org/tracker/CVE-2022-42313  
                           xen | CVE-2022-42314   | https://security-tracker.debian.org/tracker/CVE-2022-42314  
                           xen | CVE-2022-42315   | https://security-tracker.debian.org/tracker/CVE-2022-42315  
                           xen | CVE-2022-42316   | https://security-tracker.debian.org/tracker/CVE-2022-42316  
                           xen | CVE-2022-42317   | https://security-tracker.debian.org/tracker/CVE-2022-42317  
                           xen | CVE-2022-42318   | https://security-tracker.debian.org/tracker/CVE-2022-42318  
                           xen | CVE-2022-42319   | https://security-tracker.debian.org/tracker/CVE-2022-42319  
                           xen | CVE-2022-42320   | https://security-tracker.debian.org/tracker/CVE-2022-42320  
                           xen | CVE-2022-42321   | https://security-tracker.debian.org/tracker/CVE-2022-42321  
                           xen | CVE-2022-42322   | https://security-tracker.debian.org/tracker/CVE-2022-42322  
                           xen | CVE-2022-42323   | https://security-tracker.debian.org/tracker/CVE-2022-42323  
                           xen | CVE-2022-42324   | https://security-tracker.debian.org/tracker/CVE-2022-42324  
                           xen | CVE-2022-42325   | https://security-tracker.debian.org/tracker/CVE-2022-42325  
                           xen | CVE-2022-42326   | https://security-tracker.debian.org/tracker/CVE-2022-42326  
                        xerces | CVE-2012-0880    | https://security-tracker.debian.org/tracker/CVE-2012-0880   
                          yasm | CVE-2021-33454   | https://security-tracker.debian.org/tracker/CVE-2021-33454  
                          yasm | CVE-2021-33455   | https://security-tracker.debian.org/tracker/CVE-2021-33455  
                          yasm | CVE-2021-33456   | https://security-tracker.debian.org/tracker/CVE-2021-33456  
                          yasm | CVE-2021-33457   | https://security-tracker.debian.org/tracker/CVE-2021-33457  
                          yasm | CVE-2021-33458   | https://security-tracker.debian.org/tracker/CVE-2021-33458  
                          yasm | CVE-2021-33459   | https://security-tracker.debian.org/tracker/CVE-2021-33459  
                          yasm | CVE-2021-33460   | https://security-tracker.debian.org/tracker/CVE-2021-33460  
                          yasm | CVE-2021-33461   | https://security-tracker.debian.org/tracker/CVE-2021-33461  
                          yasm | CVE-2021-33462   | https://security-tracker.debian.org/tracker/CVE-2021-33462  
                          yasm | CVE-2021-33463   | https://security-tracker.debian.org/tracker/CVE-2021-33463  
                          yasm | CVE-2021-33464   | https://security-tracker.debian.org/tracker/CVE-2021-33464  
                          yasm | CVE-2021-33465   | https://security-tracker.debian.org/tracker/CVE-2021-33465  
                          yasm | CVE-2021-33466   | https://security-tracker.debian.org/tracker/CVE-2021-33466  
                          yasm | CVE-2021-33467   | https://security-tracker.debian.org/tracker/CVE-2021-33467  
                          yasm | CVE-2021-33468   | https://security-tracker.debian.org/tracker/CVE-2021-33468  
                           zip | CVE-2018-13410   | https://security-tracker.debian.org/tracker/CVE-2018-13410  


-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
