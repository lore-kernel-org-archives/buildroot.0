Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28F41C433EF
	for <buildroot@archiver.kernel.org>; Sun, 13 Feb 2022 07:32:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8C475819ED;
	Sun, 13 Feb 2022 07:32:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AjgGPcHunciO; Sun, 13 Feb 2022 07:32:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 519CB81BF4;
	Sun, 13 Feb 2022 07:32:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 61E8E1BF44C
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 07:32:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4C6B560AFA
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 07:32:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lekkiLQhJCsV for <buildroot@lists.busybox.net>;
 Sun, 13 Feb 2022 07:32:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 46B1C607D6
 for <buildroot@buildroot.org>; Sun, 13 Feb 2022 07:32:20 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 5E414200009
 for <buildroot@buildroot.org>; Sun, 13 Feb 2022 07:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1644737538; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=akK6UloK0bgWRF0DTuFNrIKY840RtoiDG8970iLwwAo=;
 b=LZKTp+AkFph1k09TkKP9xC0CbDS3Bv6wmN1GbT0k1bFfxQBtQS1f7Q0vVfTs5np3SymfXm
 i9RNm3MMxOZMs0mbZgFzn3WDJ+QX6Q6ekRLB2+wfj47dZdIZmcMqxy7DmJ2d0U5lma4cr5
 vFKGjzTaIR7EaVWsRd4TZXv1XdytloYFiNJQSm8m40+qBToeYpFvfnWzDPrgJ75O+AV3uD
 1QqDcUSQAacapvezVMHOGktfrpwRHQXiSfifPCxpCD7SER48UJJqfoNqFxwHE27iXaTkJr
 cBs7GTAgd0RgSC+CHrX0P09Pb/igvAHKu3wqXvzHybpGdjaL87q3ptz8IMJY5g==
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sun, 13 Feb 2022 07:32:18 -0000
Message-Id: <20220213073223.4C6B560AFA@smtp3.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-02-12
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

Autobuild statistics for 2022-02-12
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 58  |  7  |  0  | 65  |
  2021.11.x  | 18  |  3  |  0  | 21  |
    master   | 40  | 74  |  0  | 114 |

Classification of failures by reason for master
-----------------------------------------------

             bluez5_utils-5.63 | 12
           host-libselinux-3.3 | 10
   host-python-docutils-0.15.2 | 5 
        host-python-xlrd-2.0.1 | 5 
                       unknown | 5 
                       frr-8.1 | 4 
                 gerbera-1.9.2 | 4 
host-python-pycryptodomex-3... | 3 
           host-bmap-tools-3.6 | 2 
        host-python-lxml-4.6.5 | 2 
          host-python-ply-3.11 | 2 
                    bat-0.19.0 | 1 
                    bird-2.0.8 | 1 
                  boinc-7.18.1 | 1 
              cryptsetup-2.4.2 | 1 
           docker-cli-20.10.12 | 1 
              hackrf-2018.01.1 | 1 
              host-cxxtest-4.4 | 1 
                host-go-1.17.7 | 1 
              host-grpc-1.43.0 | 1 
    host-python-cython-0.29.27 | 1 
    host-python-greenlet-1.1.2 | 1 
                  hostapd-2.10 | 1 
                   mp4v2-5.0.1 | 1 
               pcsc-lite-1.9.5 | 1 
               poppler-21.12.0 | 1 
        python-docutils-0.15.2 | 1 
qt5base-53a047c212af7fbded6... | 1 
      qt5webkit-5.212.0-alpha4 | 1 
                safeclib-3.7.1 | 1 
               target-finalize | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/8b0521c0a3fd1d74824fc86ad6972109957f45cc |     
  mips64el   |           bird-2.0.8           | NOK | http://autobuild.buildroot.net/results/f0b7300fa2bc6bbeb0ee8afdc74c6ffd62bee477 |     
    arm      |       bluez5_utils-5.63        | NOK | http://autobuild.buildroot.net/results/fbe96c327b9db8da471683f634c5367899181651 |     
    arc      |       bluez5_utils-5.63        | NOK | http://autobuild.buildroot.net/results/dea45334d4c0b08a1042dc1eaa8f9f0aab676636 |     
    arc      |       bluez5_utils-5.63        | NOK | http://autobuild.buildroot.net/results/1c84bdfa8a9cb8eef32c1c6df06cd02b54d711c3 |     
   x86_64    |       bluez5_utils-5.63        | NOK | http://autobuild.buildroot.net/results/91c2549717e5bb331bf485e176e95db67f68d86b |     
    i686     |       bluez5_utils-5.63        | NOK | http://autobuild.buildroot.net/results/8e0576b7d22a74006d8bb754a6e4fd74d489bcc7 |     
    arm      |       bluez5_utils-5.63        | NOK | http://autobuild.buildroot.net/results/2991525b4696db6be2ac224e4ec825415cfa7022 |     
  mips64el   |       bluez5_utils-5.63        | NOK | http://autobuild.buildroot.net/results/2c91999fa26fba708bc71805acac386c31987452 |     
   mipsel    |       bluez5_utils-5.63        | NOK | http://autobuild.buildroot.net/results/44c21d737c9056e0772c21e32459a61342fdc876 |     
   s390x     |       bluez5_utils-5.63        | NOK | http://autobuild.buildroot.net/results/26f64ee265fe325ce4e4b6fe1585ebe5006da04b |     
   xtensa    |       bluez5_utils-5.63        | NOK | http://autobuild.buildroot.net/results/faa7a669ae0618e75c7bb8912e51c7fe1da1fe06 |     
   nios2     |       bluez5_utils-5.63        | NOK | http://autobuild.buildroot.net/results/727cc106331d517b1069854f877200b0ae09d3f9 |     
    m68k     |       bluez5_utils-5.63        | NOK | http://autobuild.buildroot.net/results/347d55ef864f68b2f62a088220b18b441635e9df |     
  riscv64    |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/b25fa43418e1c3bff1093ed6a82848626b6fe850 |     
microblazeel |        cryptsetup-2.4.2        | NOK | http://autobuild.buildroot.net/results/35f7b82fb842f57de04a56139d7e939f8fb0e33a |     
   x86_64    |      docker-cli-20.10.12       | NOK | http://autobuild.buildroot.net/results/7dbe6fbe2c9afc3842805784065d64957bc424d3 |     
   xtensa    |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/d955325a2b63d890c6a1c8be2631ebe4f67bf49a |     
    arc      |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/7a210063c2e4a3b290409d2dd20ae3ed1654953e |     
microblazeel |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/3cdb50f5e5a1b3f37a6edcd4276fcbf015e28828 |     
   xtensa    |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/25ee913b551d04d79da6ad73d7fe901844cd62c4 |     
   nios2     |         gerbera-1.9.2          | NOK | http://autobuild.buildroot.net/results/b734a4e8ae8780f84d23045b40ec4415a891841e |     
   x86_64    |         gerbera-1.9.2          | NOK | http://autobuild.buildroot.net/results/0a1541ef3d87ccb704b8bcd2bb721f0ae206e214 |     
    arc      |         gerbera-1.9.2          | NOK | http://autobuild.buildroot.net/results/2b679caf0dbcbf7e58bf3335beb4757c33db1337 |     
  riscv64    |         gerbera-1.9.2          | NOK | http://autobuild.buildroot.net/results/475752729af9943d5b52b3b55d670e4c7ea8e0a9 |     
   sparc     |        hackrf-2018.01.1        | NOK | http://autobuild.buildroot.net/results/fd6eda3a52fc946cf9ccf71717e33825612ed08d | ORPH
  riscv64    |      host-bmap-tools-3.6       | NOK | http://autobuild.buildroot.net/results/5bb82e762a764e2614826897fcc6d7535bc93fd9 |     
microblazeel |      host-bmap-tools-3.6       | NOK | http://autobuild.buildroot.net/results/ff1ede12d623db3108e7a302cef5bcf71a9107a6 |     
    sh4      |        host-cxxtest-4.4        | NOK | http://autobuild.buildroot.net/results/4b680ad0ac4e7639dfba1558900601bb4d2d8ec6 |     
  mips64el   |         host-go-1.17.7         | NOK | http://autobuild.buildroot.net/results/10186cd792cdd3ec4da8e97481e3a9f3a1ba6525 |     
 powerpc64   |        host-grpc-1.43.0        | NOK | http://autobuild.buildroot.net/results/38f9560a49522c23b278ca38e5c1b34020c238a3 |     
    arm      |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/6b14d33ac67b94ecd44cd58f34e4e90e09737cdb |     
  riscv64    |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/1c9eb8cad02c377f734b667e21cddf14c11d168a |     
  aarch64    |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/e0eaacad3427e9fe488cce5f37eec0a81969f45b |     
    or1k     |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/e922fd0b251468ef6814fc03f9bf993aff119f0d |     
    i686     |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/2cf41a8aa6e118f3d0cb9598aad66f167c36fedf |     
   mipsel    |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/f4b7ed2e54411b5342ae1705e846b2e1570a8e9f |     
powerpc64le  |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/e29cefe0d8b62656733cbc5cccd58581dbb6767b |     
    arm      |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/49eda3af5d1a48249d345560464ed6c9c227e534 |     
    arm      |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/a21c50dc9e68ef42c7252b3a99b42b8812d1dceb |     
    arc      |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/13b4181b5f5b332ee60c3310da1df904819873f9 |     
   sparc     |   host-python-cython-0.29.27   | NOK | http://autobuild.buildroot.net/results/2166e3fa2b132831d56cc8102c49307034b490b0 |     
  mips64el   |  host-python-docutils-0.15.2   | NOK | http://autobuild.buildroot.net/results/d4a3df11a627495a2d39028c9da1f80c2de89b2d |     
  aarch64    |  host-python-docutils-0.15.2   | NOK | http://autobuild.buildroot.net/results/f86fa61635afaef94bbadd904991ca8f03d8d1a5 |     
    arc      |  host-python-docutils-0.15.2   | NOK | http://autobuild.buildroot.net/results/3d5fbd6be33234b07c4c4d4728f213bd687a2c2b |     
   xtensa    |  host-python-docutils-0.15.2   | NOK | http://autobuild.buildroot.net/results/0082cfa8a18895172f4bed7368ead6172b68f566 |     
    or1k     |  host-python-docutils-0.15.2   | NOK | http://autobuild.buildroot.net/results/325a0dcf9a56c6448c3547a335fe57c64c5d00dd |     
    i686     |   host-python-greenlet-1.1.2   | NOK | http://autobuild.buildroot.net/results/cf81c380f4838c4d8d83843307dfae8060c7b8b5 |     
    m68k     |     host-python-lxml-4.6.5     | NOK | http://autobuild.buildroot.net/results/8a9af7bae77bc67555a3a2d72214da988ce63a6c |     
  powerpc    |     host-python-lxml-4.6.5     | NOK | http://autobuild.buildroot.net/results/3bc400c783cf8046f26512b2d84c73941b6c672d |     
    arm      |      host-python-ply-3.11      | NOK | http://autobuild.buildroot.net/results/28abf0e40d8ea0260d427dfd77488e40ffcc4167 |     
 powerpc64   |      host-python-ply-3.11      | NOK | http://autobuild.buildroot.net/results/f832b4ced36cc803f27ff27b06a7a5ef039dbb8b |     
  mips64el   | host-python-pycryptodomex-3... | NOK | http://autobuild.buildroot.net/results/9fcc9a7fe2387c9c4716ff798af0defda963a1eb |     
   nios2     | host-python-pycryptodomex-3... | NOK | http://autobuild.buildroot.net/results/6dc1023eb1560e80acf0bf4ad003a58a2a688b97 |     
    arm      | host-python-pycryptodomex-3... | NOK | http://autobuild.buildroot.net/results/dfe9cc566ea86b0325367087ea3b0637fd3bca4b |     
    arm      |     host-python-xlrd-2.0.1     | NOK | http://autobuild.buildroot.net/results/85d0ddd3b769b253854959f31f33852fd222f8d8 |     
    sh4      |     host-python-xlrd-2.0.1     | NOK | http://autobuild.buildroot.net/results/eea867ea6d46688a887307a5f78587db56d08fd2 |     
    m68k     |     host-python-xlrd-2.0.1     | NOK | http://autobuild.buildroot.net/results/18790a618a64650e6ed079c5b9dfe71588b72846 |     
   nios2     |     host-python-xlrd-2.0.1     | NOK | http://autobuild.buildroot.net/results/3b6e34cd213863e13873891ba899676e2eddf7e6 |     
    arm      |     host-python-xlrd-2.0.1     | NOK | http://autobuild.buildroot.net/results/0d47442028c3e95aec8392b109d5c5dfbed4728f |     
    arm      |          hostapd-2.10          | NOK | http://autobuild.buildroot.net/results/3f8058ee6f3913fda795578f206db895731ba1e6 |     
    arm      |          mp4v2-5.0.1           | NOK | http://autobuild.buildroot.net/results/9a3095852c93c30795cf6579cafbbc6ea8095308 | ORPH
   sparc     |        pcsc-lite-1.9.5         | NOK | http://autobuild.buildroot.net/results/6abb9f976f7ca61e266dc824befcc7dbfe77c68d | ORPH
   xtensa    |        poppler-21.12.0         | NOK | http://autobuild.buildroot.net/results/7a3452edbf7e610658bd6f829b7e7aab5f831cbe |     
   s390x     |     python-docutils-0.15.2     | NOK | http://autobuild.buildroot.net/results/679ce46b9712b6bd23f32cc4153c28369eb427d9 |     
  riscv32    | qt5base-53a047c212af7fbded6... | NOK | http://autobuild.buildroot.net/results/83778f1d9ed30d2a71b052e0a49db0fc35065da1 |     
    arm      |    qt5webkit-5.212.0-alpha4    | NOK | http://autobuild.buildroot.net/results/17065373b8dfc9545e6c7e6d1ad7c23562a27550 |     
    arm      |         safeclib-3.7.1         | NOK | http://autobuild.buildroot.net/results/5c3468585942879b47331e05058d25d324c8cc23 |     
   nios2     |        target-finalize         | NOK | http://autobuild.buildroot.net/results/ee5d43d31bbbd54bf462c9ddc2908af63d4b6893 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/2b41ea89a665c2cb6aee459a1259a2d126dbe0a8 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/8a7a5806ed4f54796f240aaeebb3dc8d19918010 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/0a5d9cf528ca86dcf04a614525a9ea1dd29e2ef5 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/ad847cbf0cdfe568707ec3354956d89d30eaef04 |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/9a4f1f3489b4b4788e74b6b5e565c135cc40bc3f |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

                  gensio-2.2.3 | 2 
        host-sentry-cli-1.57.0 | 2 
        glib-networking-2.66.0 | 1 
               openldap-2.4.59 | 1 
piglit-2affee53f3ad7a96f5b3... | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv32    |          gensio-2.2.3          | NOK | http://autobuild.buildroot.net/results/947596cdffbaa12c30046410d4245b27f7b9e11f |     
  riscv32    |          gensio-2.2.3          | NOK | http://autobuild.buildroot.net/results/cb29c7c2bb9ef0a02679d93087b3712ba31397eb |     
  riscv32    |     glib-networking-2.66.0     | NOK | http://autobuild.buildroot.net/results/64deca9250fce6a5a85a1989179c845919722b88 | ORPH
    i686     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/cedfcb3f3dbe169606a7f421ba742c5f1a59fc58 |     
  mips64el   |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/6517803de9962ec04026a7e2f776390ff31891a8 |     
  riscv32    |        openldap-2.4.59         | NOK | http://autobuild.buildroot.net/results/bc35ab69838aba23bbd568c3d6375489aca1cd09 |     
  aarch64    | piglit-2affee53f3ad7a96f5b3... | NOK | http://autobuild.buildroot.net/results/28f3a4ded772577d5f01c942538ec13bc2036889 |     


Classification of failures by reason for 2021.11.x
--------------------------------------------------

                 wavemon-0.9.4 | 2 
                 libvirt-7.7.0 | 1 


Detail of failures for 2021.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |         libvirt-7.7.0          | NOK | http://autobuild.buildroot.net/results/c371bd49968e8156fba0bbc436d3306a1aca911c |     
  riscv64    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/8c18092143a88af7760cadedf5b44eda6c2241c5 |     
   x86_64    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/4d3f2817062782d1e64647d355909dbdd34465a1 |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
