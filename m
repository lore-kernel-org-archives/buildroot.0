Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63357C433EF
	for <buildroot@archiver.kernel.org>; Fri, 11 Feb 2022 07:11:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CE1FB4162A;
	Fri, 11 Feb 2022 07:11:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WYCdW6u0tBdL; Fri, 11 Feb 2022 07:11:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C79BB415EF;
	Fri, 11 Feb 2022 07:11:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7C5961BF35A
 for <buildroot@lists.busybox.net>; Fri, 11 Feb 2022 07:11:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6921F40124
 for <buildroot@lists.busybox.net>; Fri, 11 Feb 2022 07:11:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LemhCefM0fay for <buildroot@lists.busybox.net>;
 Fri, 11 Feb 2022 07:11:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2C5204002B
 for <buildroot@buildroot.org>; Fri, 11 Feb 2022 07:11:15 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 6E035240004
 for <buildroot@buildroot.org>; Fri, 11 Feb 2022 07:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1644563473; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=CuMTBzHX1wBESnhKUTmrIAv60LOOieHW7aW5jKcXw4E=;
 b=PjSxTsir0IPROd7HLA449wcd+/9lzc56hoa5BfnfgQt5lg5m86BXsUcVdOisL0DROgVIGK
 fj52ltOVQJ7IHFvfsFxRpQO0V6g819tW3Wc1QBOIPFaDaKmTAfWybRrILx2tpzpNW8G8Jh
 vOACsC3Dghls7oQQxhF7wl56LLQQgoPwZyEQAUtU/5JPYoQbt8Chg+AkVk8i1ZdRefq16p
 RfhVg0DurYvVcQzZsovZVOhT3c1ljiPLx+Tt6ARfBz55iCE2YZCnDcW8oJKr0GIr1W9Mge
 TF1uloF0gCeC6ixwbK7i9QyzGF+lYIV6+z/eG0QrfpdnSpTTe0StpSYVUel1kw==
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Fri, 11 Feb 2022 07:11:13 -0000
Message-Id: <20220211071118.6921F40124@smtp2.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-02-10
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

Autobuild statistics for 2022-02-10
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 42  |  4  |  0  | 46  |
  2021.11.x  | 18  |  1  |  0  | 19  |
    master   | 30  | 61  |  0  | 91  |

Classification of failures by reason for master
-----------------------------------------------

             bluez5_utils-5.63 | 6 
            host-omniorb-4.3.0 | 6 
              host-cxxtest-4.4 | 5 
           host-bmap-tools-3.6 | 4 
           host-libselinux-3.3 | 4 
              host-grpc-1.43.0 | 3 
host-python-pycryptodomex-3... | 3 
                    bat-0.19.0 | 2 
                       frr-8.1 | 2 
                 gerbera-1.9.2 | 2 
    host-python-cython-0.29.27 | 2 
   host-python-docutils-0.15.2 | 2 
    host-python-greenlet-1.1.2 | 2 
        host-python-lxml-4.6.5 | 2 
                  rygel-0.40.2 | 2 
                       unknown | 2 
                     file-5.41 | 1 
                   guile-3.0.7 | 1 
          host-binutils-2.36.1 | 1 
              host-clang-9.0.1 | 1 
                 ibrdtnd-1.0.1 | 1 
             libopenssl-1.1.1m | 1 
                 libv4l-1.22.1 | 1 
                 libwpe-1.12.0 | 1 
                   mp4v2-5.0.1 | 1 
               pulseview-0.4.2 | 1 
        python-docutils-0.15.2 | 1 
ulog-0389d243352255f6182326... | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i586     |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/a73a9122fffa494bae8e47ad4e445516fb0cf2ee |     
    i586     |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/1891b6da5575ed8e4070c8ac054f75b04ae13d42 |     
    mips     |       bluez5_utils-5.63        | NOK | http://autobuild.buildroot.net/results/4b1d67f001fcad5727aad2bbd2c73adbdb78acb3 |     
    mips     |       bluez5_utils-5.63        | NOK | http://autobuild.buildroot.net/results/541cf1365b446b2c9dffdeb50e34b5bc7ec10627 |     
   x86_64    |       bluez5_utils-5.63        | NOK | http://autobuild.buildroot.net/results/d94c3c2dcbc2e226b3bafae507c444be4c4e99b0 |     
   x86_64    |       bluez5_utils-5.63        | NOK | http://autobuild.buildroot.net/results/c722e4b1e962bd02942cd0b119997d2ad9d6e758 |     
    arc      |       bluez5_utils-5.63        | NOK | http://autobuild.buildroot.net/results/5d04a4af76b9bc89450f727e145fa6eba48298ff |     
  powerpc    |       bluez5_utils-5.63        | NOK | http://autobuild.buildroot.net/results/e2f77f4f1be19f7b62a9982061c96aab129306c1 |     
    arm      |           file-5.41            | NOK | http://autobuild.buildroot.net/results/f082c2f95550d6a7457e55e34c1ed297a85f22a8 | ORPH
    arc      |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/83c8ec262cdf35ca403ec15eaad38de4394876b0 |     
    arc      |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/0c2891943111b721a3d615fe2875b8092e7652ad |     
   s390x     |         gerbera-1.9.2          | NOK | http://autobuild.buildroot.net/results/37bc85d8b41f36f885e6adfacef1fc972e811ec1 |     
    arc      |         gerbera-1.9.2          | NOK | http://autobuild.buildroot.net/results/4efc15d79682e14232945226ead18c45ac2a5c39 |     
    arm      |          guile-3.0.7           | NOK | http://autobuild.buildroot.net/results/098b2f3917aebf1e415df9592bed7d1a06004e22 |     
    arm      |      host-binutils-2.36.1      | NOK | http://autobuild.buildroot.net/results/ef5469e3e0158302f25f321bf58d516e9331eed3 |     
    arm      |      host-bmap-tools-3.6       | NOK | http://autobuild.buildroot.net/results/df591e0a88e767622780441ef404160d2787d50a |     
    arm      |      host-bmap-tools-3.6       | NOK | http://autobuild.buildroot.net/results/02a54bb47f780ee47fb633b7aa18437fc87d190b |     
microblazeel |      host-bmap-tools-3.6       | NOK | http://autobuild.buildroot.net/results/c2314927f595907c8ce1fa0bcb36c1f03fc26c56 |     
  powerpc    |      host-bmap-tools-3.6       | NOK | http://autobuild.buildroot.net/results/b431c240567bc80e390a81abdd0f6c71b1f633e7 |     
    arm      |        host-clang-9.0.1        | NOK | http://autobuild.buildroot.net/results/a118ee0b4ccbac2c0dd0e9bb85a2b318499a3262 |     
    arm      |        host-cxxtest-4.4        | NOK | http://autobuild.buildroot.net/results/f31b8f94d9512fb7f8d973a9a8595fc6bc306403 |     
   x86_64    |        host-cxxtest-4.4        | NOK | http://autobuild.buildroot.net/results/6d87e0a89554b742684bcda905958c34468095fb |     
   x86_64    |        host-cxxtest-4.4        | NOK | http://autobuild.buildroot.net/results/3b43cd6d1540f2b7aaf97e417e47908a0b9cb45d |     
    arm      |        host-cxxtest-4.4        | NOK | http://autobuild.buildroot.net/results/d3c30978368ce1657551aaa4c2202e8f0ce05fe1 |     
    arm      |        host-cxxtest-4.4        | NOK | http://autobuild.buildroot.net/results/f98a27d92f7d9e3763a980cc9fd75c49d082ecf4 |     
    arm      |        host-grpc-1.43.0        | NOK | http://autobuild.buildroot.net/results/acdc905fc688f2e02e2f600e6746be9f4c407942 |     
  aarch64    |        host-grpc-1.43.0        | NOK | http://autobuild.buildroot.net/results/f5d501274d3fa139e3d3147ad37a58ba7dec64da |     
    mips     |        host-grpc-1.43.0        | NOK | http://autobuild.buildroot.net/results/0c99b5a9b2334ab8ce283608dd6db8df4d226d01 |     
microblazeel |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/e91bdf6bffb019f168dd61d36b5de3c09f084386 |     
    m68k     |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/0e330ee5faf6ecefee4bf7b626d2c00036b923e3 |     
   mipsel    |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/ec6614f24d4b84c85a9b0c3bf6959a96e7d9653f |     
   xtensa    |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/e5059ff1e63a8717a29f1e9aa6a53e0b09ca72c8 |     
microblazeel |       host-omniorb-4.3.0       | NOK | http://autobuild.buildroot.net/results/d415c2501b27cacf2356f0f6924ee7706d7a4070 |     
    arm      |       host-omniorb-4.3.0       | NOK | http://autobuild.buildroot.net/results/9d2e3c692cda8f75780b75dd15f82f5650590bc4 |     
    i686     |       host-omniorb-4.3.0       | NOK | http://autobuild.buildroot.net/results/060518df089d51bc4abd7c27757cdcee0d836305 |     
  powerpc    |       host-omniorb-4.3.0       | NOK | http://autobuild.buildroot.net/results/3e873090c0a4eacb98ba728ff4ba8bda667b1485 |     
  powerpc    |       host-omniorb-4.3.0       | NOK | http://autobuild.buildroot.net/results/1fadafbc2f085bf4341bace2a233729315bb2c5e |     
   xtensa    |       host-omniorb-4.3.0       | NOK | http://autobuild.buildroot.net/results/34ff6e6cff0cb973dc7b8a17e58c2fc43d227401 |     
    arc      |   host-python-cython-0.29.27   | NOK | http://autobuild.buildroot.net/results/bb71485bc1dc5c87578537d54ae3ea895b2f6aed |     
  nds32le    |   host-python-cython-0.29.27   | NOK | http://autobuild.buildroot.net/results/3f2f9995f57a5f47d521a539961f493a5f3a3418 |     
  aarch64    |  host-python-docutils-0.15.2   | NOK | http://autobuild.buildroot.net/results/0d4d52f3b935d7a17241a6e9f351b98be09bf707 |     
  sparc64    |  host-python-docutils-0.15.2   | NOK | http://autobuild.buildroot.net/results/d32c6dece11a6410db9596ca7217e28aecc023bb |     
    m68k     |   host-python-greenlet-1.1.2   | NOK | http://autobuild.buildroot.net/results/e408b45a3b633e23e96cb0e58d80a93734384d40 |     
  aarch64    |   host-python-greenlet-1.1.2   | NOK | http://autobuild.buildroot.net/results/501dadc1d4a07dc643047eef10336f6e82179dae |     
    arm      |     host-python-lxml-4.6.5     | NOK | http://autobuild.buildroot.net/results/8347c3d92b9b1df6da94941936a543e5fb52f8eb |     
  nds32le    |     host-python-lxml-4.6.5     | NOK | http://autobuild.buildroot.net/results/33a6b0d44db36690a5258ed401eb1a08a2f25aa2 |     
  aarch64    | host-python-pycryptodomex-3... | NOK | http://autobuild.buildroot.net/results/90cc2c3416c4b2b60e0992206804e344df7ecbf3 |     
  powerpc    | host-python-pycryptodomex-3... | NOK | http://autobuild.buildroot.net/results/2d56e80824e9b5dd6350598220932530ee61bc6e |     
   nios2     | host-python-pycryptodomex-3... | NOK | http://autobuild.buildroot.net/results/12b8a70310967aaa4d0c26cc587fc5e16657377c |     
  aarch64    |         ibrdtnd-1.0.1          | NOK | http://autobuild.buildroot.net/results/a7a254c92215a89bb18c71120d7c7980caaf830a | ORPH
   s390x     |       libopenssl-1.1.1m        | NOK | http://autobuild.buildroot.net/results/0f14b7d0f55801c6ee644cc89bbbbd5e60dc0223 |     
    arm      |         libv4l-1.22.1          | NOK | http://autobuild.buildroot.net/results/cacd73e08cfb359d608bca807189b7bd3c5c79bd |     
  powerpc    |         libwpe-1.12.0          | NOK | http://autobuild.buildroot.net/results/0500187cf51dc96ae1f8dbce03165df08e77019c |     
    arm      |          mp4v2-5.0.1           | NOK | http://autobuild.buildroot.net/results/126fe37b729cb66702a8650cfa119aa5f1745b9a | ORPH
   xtensa    |        pulseview-0.4.2         | NOK | http://autobuild.buildroot.net/results/f7a41f23bc3e46d5e2973a20abce197248c2d915 |     
  riscv32    |     python-docutils-0.15.2     | NOK | http://autobuild.buildroot.net/results/03575ee0f3d6390780652cfd97efd15cfea5d780 |     
    arm      |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/e7f38e2a2d81be907eedbe462e3c14f382edb4fe |     
    arm      |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/dbec470842e7fd3d0ee8aa6100625dfeb8d65a14 |     
    arm      | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/0a163fc75a5bdea4a28f83cce6539e13fca099a5 |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/85544591733b07ed1cc80c9f4cc56dea102f6259 |     
    i686     |            unknown             | NOK | http://autobuild.buildroot.net/results/4acb608ef98a11f3bd300f0700ff96dcddbb149d |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

        host-sentry-cli-1.57.0 | 2 
                       unknown | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/1694ba94102b3e92b9a9c3892ff73f3f955db915 |     
  mips64el   |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/3b5ac2b9774b542bfab23e8505923d0558ff60df |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/e08b44e3f9e518e8d743c3faa0908897f5e7b7bc |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/7447eeee52cf2417af30efb5b961f0b343167fad |     


Classification of failures by reason for 2021.11.x
--------------------------------------------------

                 wavemon-0.9.4 | 1 


Detail of failures for 2021.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/18fcd39612ab725e56b8956cf59376f00eac7664 |     


Gitlab CI results for 2022-02-10
================================


-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
