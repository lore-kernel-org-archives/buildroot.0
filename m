Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D34FC47258
	for <buildroot@archiver.kernel.org>; Tue, 23 Jan 2024 06:44:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 968B381A92;
	Tue, 23 Jan 2024 06:44:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 968B381A92
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hPv81uFDRzbH; Tue, 23 Jan 2024 06:44:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A544781BA8;
	Tue, 23 Jan 2024 06:44:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A544781BA8
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CDC761BF31E
 for <buildroot@lists.busybox.net>; Tue, 23 Jan 2024 06:44:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A56BE40929
 for <buildroot@lists.busybox.net>; Tue, 23 Jan 2024 06:44:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A56BE40929
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1-k-6Mt791Tt for <buildroot@lists.busybox.net>;
 Tue, 23 Jan 2024 06:44:41 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8BD5B40926
 for <buildroot@buildroot.org>; Tue, 23 Jan 2024 06:44:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8BD5B40926
Received: by mail.gandi.net (Postfix) with ESMTPSA id 66E774000B
 for <buildroot@buildroot.org>; Tue, 23 Jan 2024 06:44:37 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Tue, 23 Jan 2024 06:44:37 -0000
X-GND-Sasl: bot@bootlin.com
Message-Id: <20240123064442.A56BE40929@smtp4.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1705992277; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=TkK2xB+hIAXqVXkE6XlYEPJT5+aYNxpusS2wsSfSn6E=;
 b=fV2Ew224pw+6SiJy06D7aKNo/HaohqQGOfSBxyorR3xdG3CoqXHbg7d2QlSWaXkKp6XUob
 CaS58tDydQSjYXfLvA1WFlgeNk9dgkhAP5yJtQ2Q3HkXmllYaRefMf5p6SNfm2SWE7MN5+
 wXqXpuYLGBOkyA6eHQToXljUGrHCYctC1TkRqMgkQbl1ZxW3Wwt5J7MC49Ol5IFpal6lgd
 oBaLEiLS3m0mYCPIQk9Yh9vUqzlBYVNbsHCM7Ynp1jBqKvmd50uzVQtu+1P8Hg8s3yqmyO
 NYjO8uZgT1Hc0s80+vnlft25fUguzHKxpwfOhW9jUL9Tg1nmKZbZXCjWnC1fJw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=fV2Ew224
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2024-01-22
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

Autobuild statistics for 2024-01-22
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  |  3  |  1  |  0  |  4  |
  2023.11.x  |  2  |  4  |  0  |  6  |
    master   | 50  | 38  |  0  | 88  |

Classification of failures by reason for master
-----------------------------------------------

                libressl-3.8.2 | 4 
                  linux-6.6.11 | 3 
                  stunnel-5.71 | 3 
                 sudo-1.9.15p5 | 3 
glibc-2.38-27-g750a45a78390... | 2 
              libtracefs-1.8.0 | 2 
                    pppd-2.5.0 | 2 
                 weston-12.0.1 | 2 
                    attr-2.5.2 | 1 
               collectd-5.12.0 | 1 
                 dc3dd-7.2.641 | 1 
                   foot-1.16.2 | 1 
  gobject-introspection-1.76.1 | 1 
                host-go-1.21.6 | 1 
        host-sentry-cli-2.20.3 | 1 
              leptonica-1.83.1 | 1 
 Makefile:727: target-finalize | 1 
                 openssh-9.6p1 | 1 
           python-numpy-1.25.0 | 1 
rtl8189fs-75a566a830037c7d1... | 1 
                  rygel-0.40.2 | 1 
               tcf-agent-1.8.0 | 1 
                       unknown | 1 
         vulkan-loader-1.3.262 | 1 
                     xterm-384 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 microblaze  |           attr-2.5.2           | NOK | http://autobuild.buildroot.net/results/7faaa0f5f53786b822736b0a20124b3a43a59c87 |     
  sparc64    |        collectd-5.12.0         | NOK | http://autobuild.buildroot.net/results/e2cf909ab3c356f1881fd18cfa039e87faa10d7d |     
    or1k     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/bf3a03a649c1afdc1aa87036048423feae663285 | ORPH
  mips64el   |          foot-1.16.2           | NOK | http://autobuild.buildroot.net/results/0936f48695500825fa1c4c7ccfdf0291d7ab49f7 |     
powerpc64le  | glibc-2.38-27-g750a45a78390... | NOK | http://autobuild.buildroot.net/results/fe11a074c316144f16c49758ee6fc21dbc630e03 |     
 powerpc64   | glibc-2.38-27-g750a45a78390... | NOK | http://autobuild.buildroot.net/results/884e9a1cad96fc230c417ba177925c08ecb8142b |     
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/67042aba2f10b10271b37443ca667ad0de486382 | ORPH
   mips64    |         host-go-1.21.6         | NOK | http://autobuild.buildroot.net/results/9782f3b8d4920f6a62546a095e17bf91b9c910d3 |     
   s390x     |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/a2c3aa7665b41eddb5fca9deb9e67a1a3d6792ac |     
    sh4      |        leptonica-1.83.1        | NOK | http://autobuild.buildroot.net/results/a44a84507b10062fb21d33c2b4c1183eabe40cee |     
   mips64    |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/f9697934a6fb54424d89af768ee6f132bf97499e | ORPH
powerpc64le  |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/e31c450fe753998d2b2f4e9d50c07af9560c044c | ORPH
    m68k     |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/8857654a89260d350f5bf1114eacda299ab358a5 | ORPH
   sh4aeb    |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/08a1712ae77796ace05b9cef2824f7bb7743e711 | ORPH
   armeb     |        libtracefs-1.8.0        | NOK | http://autobuild.buildroot.net/results/3a028b3ac0ccd42bd2775175646d1c8855a2e8f2 |     
 aarch64_be  |        libtracefs-1.8.0        | NOK | http://autobuild.buildroot.net/results/28e1b2f1a8e65617bec6e2e94d5a49765b8cee2d |     
  mips64el   |          linux-6.6.11          | NOK | http://autobuild.buildroot.net/results/a683200ae28e7c7c8ec48cbe90b6965b61460ecc | ORPH
microblazeel |          linux-6.6.11          | NOK | http://autobuild.buildroot.net/results/9e6e0b14fb69db5f148350c4537ca6de48536009 | ORPH
   arceb     |          linux-6.6.11          | NOK | http://autobuild.buildroot.net/results/47e07fb4bd2881c1d855f04c842849554b47ed55 | ORPH
   x86_64    | Makefile:727: target-finalize  | NOK | http://autobuild.buildroot.net/results/b0765a03e15bd68fc0c4418ce0023992104c38f2 |     
 powerpc64   |         openssh-9.6p1          | NOK | http://autobuild.buildroot.net/results/5b89c1998c5f5af676383813879ecc5bd225fb3e | ORPH
  sparc64    |           pppd-2.5.0           | NOK | http://autobuild.buildroot.net/results/a9a351ed550b1c68769080265cd8f6f6b4743263 |     
  sparc64    |           pppd-2.5.0           | NOK | http://autobuild.buildroot.net/results/3baaca47e87a599f57835d281455b88f29357071 |     
 powerpc64   |      python-numpy-1.25.0       | NOK | http://autobuild.buildroot.net/results/40a800107a18a350c1631f145242a9d6c854ce66 |     
powerpc64le  | rtl8189fs-75a566a830037c7d1... | NOK | http://autobuild.buildroot.net/results/5b2de5698dfa441fefbc68bb32d349720ea9e717 |     
 powerpc64   |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/f171cf26fc93e2953fb3a2e2c123ec8ea50bf814 |     
   sh4eb     |          stunnel-5.71          | NOK | http://autobuild.buildroot.net/results/b288bb3b89c7c5ed052b4cdf05d850aa830b3a1d |     
    arm      |          stunnel-5.71          | NOK | http://autobuild.buildroot.net/results/63dde68ebccd95eeb7d7a5d0801fd3c4d32db308 |     
  mips64el   |          stunnel-5.71          | NOK | http://autobuild.buildroot.net/results/4cc77da0ab7e894a9acd2a438a462cd8fe0af6ae |     
  powerpc    |         sudo-1.9.15p5          | NOK | http://autobuild.buildroot.net/results/7d1ce3e891b9cdb2e9f010d672e144195a134589 | ORPH
   sh4aeb    |         sudo-1.9.15p5          | NOK | http://autobuild.buildroot.net/results/8e875799a519565f3b726f9dbd264a7e168a2c0c | ORPH
   mips64    |         sudo-1.9.15p5          | NOK | http://autobuild.buildroot.net/results/ca50cdfc85f2600f4eefb385b3548618eb95cfd0 | ORPH
 powerpc64   |        tcf-agent-1.8.0         | NOK | http://autobuild.buildroot.net/results/3be2fe52ca324f0dda3d0ab1497172e308ecb6cf |     
    sh4a     |            unknown             | NOK | http://autobuild.buildroot.net/results/ccb94597fa47fc287240162dbe5b9af50f4aa6a8 |     
    mips     |     vulkan-loader-1.3.262      | NOK | http://autobuild.buildroot.net/results/29caeed38a6139eb328d3b1df307776e837bfad6 | ORPH
    m68k     |         weston-12.0.1          | NOK | http://autobuild.buildroot.net/results/7b52b444cd4a53e5e4eba1ce935a15caac40d12d |     
 powerpc64   |         weston-12.0.1          | NOK | http://autobuild.buildroot.net/results/ebbba1d73ceeaacee17fde0c6c853415cd316091 |     
powerpc64le  |           xterm-384            | NOK | http://autobuild.buildroot.net/results/51f98577b851bdbb0a0ab93c9ef94977776c1b1b | ORPH


Classification of failures by reason for 2023.02.x
--------------------------------------------------

                  linux-6.1.72 | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   nios2     |          linux-6.1.72          | NOK | http://autobuild.buildroot.net/results/6e771a7c70506ac9e2c7ef1c0f28575eb5f052cd | ORPH


Classification of failures by reason for 2023.11.x
--------------------------------------------------

check-11970a7e112dfe243a2e6... | 1 
glibc-2.38-27-g750a45a78390... | 1 
                  linux-6.6.11 | 1 
                    ola-0.10.9 | 1 


Detail of failures for 2023.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/3c88eec175dd297c88cc2031dd16453f8796cfe5 | ORPH
 powerpc64   | glibc-2.38-27-g750a45a78390... | NOK | http://autobuild.buildroot.net/results/83bfaaa0fedcf91f8ccd8208798243b7de980702 |     
   armeb     |          linux-6.6.11          | NOK | http://autobuild.buildroot.net/results/c87dccd73b7acd0eb0083b505d0db70977efa21e | ORPH
  sparc64    |           ola-0.10.9           | NOK | http://autobuild.buildroot.net/results/3753181a8dbeb2a8df557d0f86697083b5179543 |     


Gitlab CI results for 2024-01-22
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
      TestCpioDracutGlibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/5977755400  | ORPH 
...ioDracutGlibcMergedUsr | https://gitlab.com/buildroot.org/buildroot/-/jobs/5977755411  | ORPH 
       TestCpioDracutMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/5977755417  | ORPH 
...pioDracutMuslMergedUsr | https://gitlab.com/buildroot.org/buildroot/-/jobs/5977755420  | ORPH 
     TestCpioDracutUclibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/5977755423  | ORPH 
...oDracutUclibcMergedUsr | https://gitlab.com/buildroot.org/buildroot/-/jobs/5977755428  | ORPH 
        TestDockerCompose | https://gitlab.com/buildroot.org/buildroot/-/jobs/5977755783  | ORPH 
...rcv8UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/5977756705  | ORPH 
              TestGlxinfo | https://gitlab.com/buildroot.org/buildroot/-/jobs/5977755819  | ORPH 
         TestGrubX8664EFI | https://gitlab.com/buildroot.org/buildroot/-/jobs/5977755043  | ORPH 
               TestNetCat | https://gitlab.com/buildroot.org/buildroot/-/jobs/5977755956  | ORPH 
   TestPythonPy3Bitstring | https://gitlab.com/buildroot.org/buildroot/-/jobs/5977756038  | ORPH 
    TestPythonPy3Crossbar | https://gitlab.com/buildroot.org/buildroot/-/jobs/5977756057  | ORPH 
    TestPythonPy3Dtschema | https://gitlab.com/buildroot.org/buildroot/-/jobs/5977756071  | ORPH 
...honPy3FlaskExpectsJson | https://gitlab.com/buildroot.org/buildroot/-/jobs/5977756076  | ORPH 
       TestPythonPy3SciPy | https://gitlab.com/buildroot.org/buildroot/-/jobs/5977756148  | ORPH 
       TestPythonPy3Txaio | https://gitlab.com/buildroot.org/buildroot/-/jobs/5977756173  | ORPH 
                 TestRust | https://gitlab.com/buildroot.org/buildroot/-/jobs/5977756192  | ORPH 
     TestSELinuxCustomGit | https://gitlab.com/buildroot.org/buildroot/-/jobs/5977755212  | ORPH 



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
