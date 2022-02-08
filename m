Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA9D5C433EF
	for <buildroot@archiver.kernel.org>; Tue,  8 Feb 2022 07:26:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6958560C1E;
	Tue,  8 Feb 2022 07:26:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Obh9FZVAwd8m; Tue,  8 Feb 2022 07:26:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 53BEB60ABB;
	Tue,  8 Feb 2022 07:26:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 51B931BF318
 for <buildroot@lists.busybox.net>; Tue,  8 Feb 2022 07:26:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4DB1C60888
 for <buildroot@lists.busybox.net>; Tue,  8 Feb 2022 07:26:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ygy1ChA-xoW0 for <buildroot@lists.busybox.net>;
 Tue,  8 Feb 2022 07:26:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 816AD6072A
 for <buildroot@buildroot.org>; Tue,  8 Feb 2022 07:26:01 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id BDABC240002
 for <buildroot@buildroot.org>; Tue,  8 Feb 2022 07:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1644305158; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=1TOUQIz0aY/b6DuTlhuoCr5M+xeL4AcNvIcKAHck8GI=;
 b=BO2vffOnvilTN88Xjx3ROpJrbKsZFcLIBvSQFFoBF+8CMldH/OpyC54Zn5OlyiAsfLCe/j
 K4vq5OnJ3U5a3GBKfgZ76XYKA24HANPTn/djYtjf+5j65rRnxUTmSc7EaHgwnTG8pITdnl
 zdo/hyvhAh0QnJjjXjSLTxHoLkRjRJiNFjUJUbvuBPDoGDcr47m9G8j4q33j57jK5acLlc
 xg8fOZdfmeBF/FL+YrPMp91NGFduMr97ysccFIoBNFnlgFXThsuosqAYFoaeU/LHnIKbNW
 p9y/RsjZNtWZmTj5zDtq8FZKAya35AYQ9ZAGHCFn8fo9WaoBt7Jknq3WwKJnnw==
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Tue, 08 Feb 2022 07:25:58 -0000
Message-Id: <20220208072603.4DB1C60888@smtp3.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-02-07
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

Autobuild statistics for 2022-02-07
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 45  |  7  |  0  | 52  |
  2021.11.x  | 20  |  1  |  0  | 21  |
    master   | 35  | 49  |  2  | 86  |

Classification of failures by reason for master
-----------------------------------------------

           host-libselinux-3.3 | 13
             bluez5_utils-5.63 | 11
   host-python-docutils-0.15.2 | 5 
                 gerbera-1.9.2 | 4 
                     ace-7.0.1 | 2 
                    bird-2.0.8 | 2 
                       libuwsc | 2 
               belle-sip-4.4.8 | 1 
              host-grpc-1.43.0 | 1 
              libuhttpd-3.14.1 | 1 
                    mpd-0.23.5 | 1 
                openocd-0.11.0 | 1 
               pcsc-lite-1.9.5 | 1 
                   perl-5.34.0 | 1 
               poppler-21.12.0 | 1 
               postgresql-14.1 | 1 
qt5base-53a047c212af7fbded6... | 1 
                rtorrent-0.9.8 | 1 
                       unknown | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    mips     |           ace-7.0.1            | NOK | http://autobuild.buildroot.net/results/a10dae2e6e5f07590bcc1526216a4d41ae420fc7 |     
  mips64el   |           ace-7.0.1            | NOK | http://autobuild.buildroot.net/results/13376405e313da112f546076a10859e60631d5d5 |     
   xtensa    |        belle-sip-4.4.8         | NOK | http://autobuild.buildroot.net/results/67ffdea04cd847685c097551c6bb397ddac1b2d7 |     
  mips64el   |           bird-2.0.8           | NOK | http://autobuild.buildroot.net/results/c633ec702afb8c4f63ab1807250e469904ece9b3 |     
  nds32le    |           bird-2.0.8           | NOK | http://autobuild.buildroot.net/results/220501962e48cd7ddb5d5e849c41e5700e085177 |     
    arm      |       bluez5_utils-5.63        | NOK | http://autobuild.buildroot.net/results/fef25236f2fb1de7d2bab8c72cecfdbd760bf5e2 |     
  sparc64    |       bluez5_utils-5.63        | NOK | http://autobuild.buildroot.net/results/8d6ee2e834e5925bccce9e4cf302a8d7f161ba65 |     
    arm      |       bluez5_utils-5.63        | NOK | http://autobuild.buildroot.net/results/b2978749181775f71045e57746484e315834e2cc |     
    or1k     |       bluez5_utils-5.63        | NOK | http://autobuild.buildroot.net/results/ea576f4bab0f321a412645afbb70457a5d7595c1 |     
    arm      |       bluez5_utils-5.63        | NOK | http://autobuild.buildroot.net/results/8221e8684b6f4e7de254bc944df4e9194f53a138 |     
    arc      |       bluez5_utils-5.63        | NOK | http://autobuild.buildroot.net/results/4d2d72b006d42fb3ed5fd9dfce1631056cc11a3a |     
    m68k     |       bluez5_utils-5.63        | NOK | http://autobuild.buildroot.net/results/ccfeabf9509d070d7641f824bdeadd9bd1cfa995 |     
   nios2     |       bluez5_utils-5.63        | NOK | http://autobuild.buildroot.net/results/bf1ee71708644842b9b59b03f419b087358b8f22 |     
  powerpc    |       bluez5_utils-5.63        | NOK | http://autobuild.buildroot.net/results/98cf0818c6b5a8d2d347437a979ab08441803b4d |     
   xtensa    |       bluez5_utils-5.63        | NOK | http://autobuild.buildroot.net/results/d40e351c1f02bf6530aa9ffac170b6042e93f501 |     
 powerpc64   |       bluez5_utils-5.63        | NOK | http://autobuild.buildroot.net/results/ccb141f8ff040ebd2515cc3d3137ed6db9a35bc1 |     
powerpc64le  |         gerbera-1.9.2          | NOK | http://autobuild.buildroot.net/results/4a2fc2094ccb52cbaf4977140c78c3cc75b5d068 |     
   xtensa    |         gerbera-1.9.2          | NOK | http://autobuild.buildroot.net/results/d9fae4b220b87be1c778e1228d7ed4adbbc1c278 |     
   s390x     |         gerbera-1.9.2          | NOK | http://autobuild.buildroot.net/results/ac9eb751c853031a7c4eec525aa5f4a882320bd1 |     
  riscv64    |         gerbera-1.9.2          | NOK | http://autobuild.buildroot.net/results/2bfff4fd24fe07051cc07622eb6daa8312164f66 |     
  aarch64    |        host-grpc-1.43.0        | NOK | http://autobuild.buildroot.net/results/96de2e7560d8d985a4079e53f0a2c88545be745d |     
microblazeel |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/c53c52d3d233dda1766a04c0ff3a4081da947b09 |     
    sh4      |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/119efa9e934d1661b577e19d3dae3b28a494db3a |     
   x86_64    |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/1e82a8b02a1ce56169cd8d6f48d2c7e161950752 |     
 powerpc64   |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/73ff5f4b71caf6ee05d36a4e3b22ec3796393230 |     
  powerpc    |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/662524038ce5ae447821afd7e6ca41552036da86 |     
   xtensa    |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/6384c41865b35557f4559277bfb9b2b60654ab94 |     
   s390x     |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/7bb924e1c14989d57ab65cf9d4035ba89cd37cb0 |     
    arm      |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/a7bdf69b603af0778264b9fce909569ef6a0a1de |     
  riscv64    |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/c63b3a1aa07f000518239dcb86755f3482e2eaf6 |     
microblazeel |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/bae6af7f80c183ab282891e17c11ec6f834174b4 |     
  mips64el   |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/95d1afed62cddd4d911436bfa1dde52e3164edc3 |     
    i586     |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/5f7346d120ca9601c0cd521a8f7115898a218924 |     
   xtensa    |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/c94fcb109cce9ca0bed9d5e0cc077253f9bb39a5 |     
powerpc64le  |  host-python-docutils-0.15.2   | NOK | http://autobuild.buildroot.net/results/b82682d3f0be0cdd9802a373faab651876f28ac3 |     
    arm      |  host-python-docutils-0.15.2   | NOK | http://autobuild.buildroot.net/results/bfec58eb8215d08c6fb2a681398ab6c0c121cc75 |     
  powerpc    |  host-python-docutils-0.15.2   | NOK | http://autobuild.buildroot.net/results/9c65891a4041db1c57cf8966cc62e5fbfa5d81e5 |     
    mips     |  host-python-docutils-0.15.2   | NOK | http://autobuild.buildroot.net/results/40b1274b1019eae80e1a6cffae4b46b3c9a0f814 |     
    arm      |  host-python-docutils-0.15.2   | NOK | http://autobuild.buildroot.net/results/61b863777ca9a417e7b9b0d20065d69e81f368e7 |     
    arm      |        libuhttpd-3.14.1        | NOK | http://autobuild.buildroot.net/results/a3a970a6398dcb0e4e03f4277f1a50c6b5eff7bd |     
  aarch64    |            libuwsc             | TIM | http://autobuild.buildroot.net/results/14f2e3517d432ecfba7c0c30b0b2d039007a611e |     
microblazeel |            libuwsc             | TIM | http://autobuild.buildroot.net/results/30cad6e8afb864fdf4e19f58ef83f22b5a77d15c |     
   xtensa    |           mpd-0.23.5           | NOK | http://autobuild.buildroot.net/results/032aaff121fb114f388c67dbca3ad2b02f670e38 |     
   sparc     |         openocd-0.11.0         | NOK | http://autobuild.buildroot.net/results/4a27a769bb3cdf78643c3049b87d792178d6512c | ORPH
   sparc     |        pcsc-lite-1.9.5         | NOK | http://autobuild.buildroot.net/results/b59b30cbe0e27399db5c7586f369104e68a1589a | ORPH
  powerpc    |          perl-5.34.0           | NOK | http://autobuild.buildroot.net/results/0e0291ed7c9db636c1e6b72e5e8f7d7f04bf1563 |     
   xtensa    |        poppler-21.12.0         | NOK | http://autobuild.buildroot.net/results/0f2a841b03462dd34ccf4be489b76a2a12550e54 |     
    arm      |        postgresql-14.1         | NOK | http://autobuild.buildroot.net/results/e4b59fecd2a5bcda8103ddf4eae3dbd78fe3b896 |     
  riscv32    | qt5base-53a047c212af7fbded6... | NOK | http://autobuild.buildroot.net/results/3b1b1b2f97d5645cacbd1e021b18006bb765362f |     
    sh4      |         rtorrent-0.9.8         | NOK | http://autobuild.buildroot.net/results/5d614713e047e57558ef785d6c3b497006deb5c5 | ORPH
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/b51b1c608b050cd2982abe58a3eff68c4756be0b |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

           python-pybind-2.6.1 | 2 
                  zeromq-4.3.4 | 2 
                   gvfs-1.44.1 | 1 
        host-sentry-cli-1.57.0 | 1 
                rocksdb-6.13.3 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |          gvfs-1.44.1           | NOK | http://autobuild.buildroot.net/results/b4dfbb94f8cbfe40b3a566b90d87cc132a309099 | ORPH
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/abec1ecbfa3a7c56c1dddf03c641b66463124840 |     
 aarch64_be  |      python-pybind-2.6.1       | NOK | http://autobuild.buildroot.net/results/0c77ee2af362301fc17eb641931436c4cb87f71c |     
  riscv64    |      python-pybind-2.6.1       | NOK | http://autobuild.buildroot.net/results/67ec201c11d4dfa2d491c0d8f23a5cab9d840956 |     
    m68k     |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/e74b26aea0be9f3bd6be31d3d923da30ac408f39 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/fd9d319726f6ac85892f04ffc480bbcce00b3f9a |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/8d51430b95f864e53e5223b72b9761331f9b3f95 |     


Classification of failures by reason for 2021.11.x
--------------------------------------------------

                  zeromq-4.3.4 | 1 


Detail of failures for 2021.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/47c0738e024ff2c2c4c65a0ea034c97454343b2f |     


Gitlab CI results for 2022-02-07
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
           TestIPythonPy3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2060952123  | ORPH 
   TestIso9660Grub2Hybrid | https://gitlab.com/buildroot.org/buildroot/-/jobs/2060952067  | ORPH 
              TestLuaHttp | https://gitlab.com/buildroot.org/buildroot/-/jobs/2060952145  | ORPH 
         TestLuaLuasyslog | https://gitlab.com/buildroot.org/buildroot/-/jobs/2060952178  | ORPH 
                  TestLxc | https://gitlab.com/buildroot.org/buildroot/-/jobs/2060952181  | ORPH 
                  TestOci | https://gitlab.com/buildroot.org/buildroot/-/jobs/2060952078  | ORPH 
       TestPerllibwwwperl | https://gitlab.com/buildroot.org/buildroot/-/jobs/2060952198  | ORPH 
      TestPythonPy2Pynacl | https://gitlab.com/buildroot.org/buildroot/-/jobs/2060952264  | ORPH 
      TestPythonPy2Pyyaml | https://gitlab.com/buildroot.org/buildroot/-/jobs/2060952270  | ORPH 
     TestPythonPy3Automat | https://gitlab.com/buildroot.org/buildroot/-/jobs/2060952222  | ORPH 
    TestPythonPy3Crossbar | https://gitlab.com/buildroot.org/buildroot/-/jobs/2060952238  | ORPH 
      TestPythonPy3Pyyaml | https://gitlab.com/buildroot.org/buildroot/-/jobs/2060952271  | ORPH 
        TestPythonPy3Treq | https://gitlab.com/buildroot.org/buildroot/-/jobs/2060952277  | ORPH 
     TestPythonPy3Twisted | https://gitlab.com/buildroot.org/buildroot/-/jobs/2060952278  | ORPH 
    TestPythonPy3Txtorcon | https://gitlab.com/buildroot.org/buildroot/-/jobs/2060952280  | ORPH 
                 TestRust | https://gitlab.com/buildroot.org/buildroot/-/jobs/2060952289  | ORPH 
              TestRustBin | https://gitlab.com/buildroot.org/buildroot/-/jobs/2060952290  | ORPH 



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
