Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 410C1C46CD2
	for <buildroot@archiver.kernel.org>; Tue,  9 Jan 2024 06:46:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CB29B418B3;
	Tue,  9 Jan 2024 06:46:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CB29B418B3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R35_I0osU9Kr; Tue,  9 Jan 2024 06:46:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B8C444194E;
	Tue,  9 Jan 2024 06:46:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B8C444194E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 56CC71BF363
 for <buildroot@lists.busybox.net>; Tue,  9 Jan 2024 06:46:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ED0E460BD1
 for <buildroot@lists.busybox.net>; Tue,  9 Jan 2024 06:46:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ED0E460BD1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qLN-wsLv9t2a for <buildroot@lists.busybox.net>;
 Tue,  9 Jan 2024 06:46:04 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0B30660AD1
 for <buildroot@buildroot.org>; Tue,  9 Jan 2024 06:46:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0B30660AD1
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5EF1960009
 for <buildroot@buildroot.org>; Tue,  9 Jan 2024 06:46:01 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Tue, 09 Jan 2024 06:46:01 -0000
X-GND-Sasl: bot@bootlin.com
Message-Id: <20240109064608.ED0E460BD1@smtp3.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1704782761; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=KH/UXtyT+6Wn5gFdshD5BV6Za7VLYA7Sq7IbChT81cI=;
 b=UOqKaP8p/cQE6q7AWaYHmY3bDwbz6M5kyoWl2/iSBCAFcVlXYnHTxb4KpQqdXN7XFJsWYW
 dqQkCBbdyLQT6gs7JrioAq8NnJ7EHwIWezr/sR+p7pPJrJsQmORr1YXUGMSbsSTzPF8bkn
 IKQ7CiCxhrK84f8PMaM1iePshda+8SEqpUSbMAqZEcJZBZG9eNmzstma99WL/5P2JOyyFL
 5KuPLVrPlWfPnZfOVupD8OblR776psUzf7vELJDRfOFHGnYIs9x7eyzw7e0tymkSanTluW
 nTIxz6tg/OOs3Kjo/eTid8nM96MuRNBrvwjQt5Aba8ylZFb5+cOeYJ1+QHLcuw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=UOqKaP8p
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2024-01-08
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

Autobuild statistics for 2024-01-08
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  |  2  |  2  |  0  |  4  |
  2023.08.x  |  4  |  1  |  0  |  5  |
    master   | 51  | 52  |  2  | 105 |

Classification of failures by reason for master
-----------------------------------------------

                libressl-3.8.2 | 9 
                   exim-4.97.1 | 5 
ibm-sw-tpm2-5452af422edeff7... | 4 
                  linux-6.6.10 | 4 
           libtraceevent-1.8.1 | 3 
  gobject-introspection-1.76.1 | 2 
           libfreeimage-3.18.0 | 2 
              liquid-dsp-1.6.0 | 2 
          python-grpcio-1.60.0 | 2 
                  stunnel-5.71 | 2 
                       unknown | 2 
                     criu-3.19 | 1 
          cryptodev-linux-1.13 | 1 
              dropbear-2022.83 | 1 
                elfutils-0.189 | 1 
                        ffmpeg | 1 
       freeradius-server-3.2.3 | 1 
         host-gcc-final-11.4.0 | 1 
         host-gcc-final-12.3.0 | 1 
               libunwind-1.6.2 | 1 
                         mimic | 1 
                    ncmpc-0.49 | 1 
                    ngrep-1.47 | 1 
                 openssh-9.6p1 | 1 
           python-numpy-1.25.0 | 1 
         python-rpds-py-0.12.0 | 1 
                tinifier-3.4.0 | 1 
              tinymembench-0.4 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    mips     |           criu-3.19            | NOK | http://autobuild.buildroot.net/results/c98376485478824993860caaf553c7f8da0241dc |     
    mips     |      cryptodev-linux-1.13      | NOK | http://autobuild.buildroot.net/results/399e1d041ce21372a6d3731a243a2f766676ed67 | ORPH
    or1k     |        dropbear-2022.83        | NOK | http://autobuild.buildroot.net/results/ec6113d7f32c495216bbe7830f94929cd8ce4e67 |     
   armeb     |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/e68ca82f253eca090a333538c0ce148d649599ca | ORPH
  sparc64    |          exim-4.97.1           | NOK | http://autobuild.buildroot.net/results/8f61a3e5878b8c4c497d68642dcdd88b86d5e6f8 |     
  aarch64    |          exim-4.97.1           | NOK | http://autobuild.buildroot.net/results/9d443d4dcd3c3020a26dbefc1ce187f3b490fc80 |     
   nios2     |          exim-4.97.1           | NOK | http://autobuild.buildroot.net/results/020cc9672aee1de09b6236bcb1f5f3fa602ce16f |     
   xtensa    |          exim-4.97.1           | NOK | http://autobuild.buildroot.net/results/b6a4bac0a669213c424c8038c5a10072e7ddeccc |     
   nios2     |          exim-4.97.1           | NOK | http://autobuild.buildroot.net/results/c84917f93f25bb38ec4667cab8c10dc586b275f8 |     
  riscv64    |             ffmpeg             | TIM | http://autobuild.buildroot.net/results/d51a4f48fc9ce28a670883f672662f39ce95d360 |     
 powerpc64   |    freeradius-server-3.2.3     | NOK | http://autobuild.buildroot.net/results/904c43241b99a8d848c1891cb5af132a291311b4 |     
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/46aa2b3a05921bdccd30a547ce75c313b0617574 | ORPH
   s390x     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/5528bc3e2bbe4d260235320a8bb71e21a8ba6135 | ORPH
    arm      |     host-gcc-final-11.4.0      | NOK | http://autobuild.buildroot.net/results/2a5da12a10ea745e74b26b0aae44773f3f475adb |     
    i686     |     host-gcc-final-12.3.0      | NOK | http://autobuild.buildroot.net/results/7e5b817ba5915747b3850ebe2d00aa99cd42180d |     
   mips64    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/26e42cb211f6fe74b4b050df95cc728482b56674 |     
   arceb     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/ec51456afe076393c939582542a764ec27112e70 |     
    or1k     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/fa7b72e48126cd9944d5e4a9b156efbe75f610b5 |     
   mips64    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/5795405782571182a11ddaa4fc38c8adc37f3a08 |     
 powerpc64   |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/25fc081971b6a492e1b5ce7e1d26bec9f14cd3d2 |     
  riscv32    |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/1ff59240c99541c82493817a9dbfbf3e46364c67 |     
   s390x     |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/3ed556d7ae4ae618886027e85d8d6b194c58275b | ORPH
    or1k     |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/050c9d0681481dd8307d02c12cf076a6f1baf399 | ORPH
  mips64el   |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/215881822de82143edb42857810290f862d4c081 | ORPH
   nios2     |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/3b0fde9b9cacf194c184d1a0f2dbda9aad03011d | ORPH
    arc      |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/4e0aea6c54e6b70253463d0f6cf6a1f714867c81 | ORPH
    sh4a     |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/be18732a95b921306430f51df5c0c3e12183ba5f | ORPH
    or1k     |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/97c7168b67a20550f36f2fb103746981f978334a | ORPH
   nios2     |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/680471fc710c59434d6c999644598d315b55c66c | ORPH
    arc      |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/7d1d2a7c6767a7dbd68a42dbb65d72bf16c4e016 | ORPH
 aarch64_be  |      libtraceevent-1.8.1       | NOK | http://autobuild.buildroot.net/results/651ea97839a5e12b214b104b89f7ceafc4bd1f72 |     
  riscv64    |      libtraceevent-1.8.1       | NOK | http://autobuild.buildroot.net/results/7802d1ad00293147edda39683f6d3f614dd48263 |     
 microblaze  |      libtraceevent-1.8.1       | NOK | http://autobuild.buildroot.net/results/5678a86ee71b833e7816fd9781aed11d84a48a82 |     
  powerpc    |        libunwind-1.6.2         | NOK | http://autobuild.buildroot.net/results/025389037c5fafd9ec440fc22fc09d4835ecc38c | ORPH
    mips     |          linux-6.6.10          | NOK | http://autobuild.buildroot.net/results/fc325266ace94aaf691cd5efb4cb2a0df27fb74b | ORPH
   mips64    |          linux-6.6.10          | NOK | http://autobuild.buildroot.net/results/f74bc1e0cf1b20fa7a83026bb9f1c1034c80fe21 | ORPH
  mips64el   |          linux-6.6.10          | NOK | http://autobuild.buildroot.net/results/8cd06f5c408b078f0b3133a83cafe59fabc24954 | ORPH
    i686     |          linux-6.6.10          | NOK | http://autobuild.buildroot.net/results/77c6002d83cfb6ddf16ef7c5df1d78c5f42e10d7 | ORPH
   x86_64    |        liquid-dsp-1.6.0        | NOK | http://autobuild.buildroot.net/results/738ce9d3dc74ec165391f21256c955e5524f1632 |     
    i686     |        liquid-dsp-1.6.0        | NOK | http://autobuild.buildroot.net/results/ef4dd15a6c33c1e047ba6d6dc9ba8d06942abcb2 |     
  riscv64    |             mimic              | TIM | http://autobuild.buildroot.net/results/40d19aa4b8da55c53967ad87e0504857c592007d |     
 microblaze  |           ncmpc-0.49           | NOK | http://autobuild.buildroot.net/results/4afe774b051ed00b23e2982a7a5a8a0ce1a124a9 |     
microblazeel |           ngrep-1.47           | NOK | http://autobuild.buildroot.net/results/b6f18ddf0e33f76cec4a141ac71f50fb1a050884 |     
   mips64    |         openssh-9.6p1          | NOK | http://autobuild.buildroot.net/results/aac0d6824a48c973cfe2aa31464513201cbcd5ea | ORPH
 aarch64_be  |      python-grpcio-1.60.0      | NOK | http://autobuild.buildroot.net/results/fd81f16c080d47c05895b8c2ad1d002a06093a6e |     
   s390x     |      python-grpcio-1.60.0      | NOK | http://autobuild.buildroot.net/results/985bc60b9bbb99de65afee9dbe5e90f561b455aa |     
   sh4eb     |      python-numpy-1.25.0       | NOK | http://autobuild.buildroot.net/results/2ece0924f1b7d6836c56da8fb9e6c2dbbd3e0e8f |     
  powerpc    |     python-rpds-py-0.12.0      | NOK | http://autobuild.buildroot.net/results/17f695f8331c2bd3ef7723d86e967df299917d85 |     
 aarch64_be  |          stunnel-5.71          | NOK | http://autobuild.buildroot.net/results/08dc0d05be11b71ab99760fd6e4a5bf4634bf2e6 |     
   armeb     |          stunnel-5.71          | NOK | http://autobuild.buildroot.net/results/93400a81ce3dfa1d8d87039c4afae23e8ea10889 |     
   x86_64    |         tinifier-3.4.0         | NOK | http://autobuild.buildroot.net/results/c6c6f306906686869eccada47e62627ef3aba258 |     
   armeb     |        tinymembench-0.4        | NOK | http://autobuild.buildroot.net/results/1e359c294a8d71fb1833e5d04a6bc7d4fd533510 |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/b4f0620d55c9b8628f3492accd0f0b8d5ce545bc |     
    mips     |            unknown             | NOK | http://autobuild.buildroot.net/results/2d13ca6cf066c011eb8b3c3609fd94ac1dfe1534 |     


Classification of failures by reason for 2023.02.x
--------------------------------------------------

                jemalloc-5.3.0 | 1 
                python3-3.11.6 | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    sh4      |         jemalloc-5.3.0         | NOK | http://autobuild.buildroot.net/results/cd6006feb378d8a7a2702f03284799e464a25b48 |     
   x86_64    |         python3-3.11.6         | NOK | http://autobuild.buildroot.net/results/27a7c051dfabd273a50e60c88167cf93198b5514 |     


Classification of failures by reason for 2023.08.x
--------------------------------------------------

              host-rust-1.71.1 | 1 


Detail of failures for 2023.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/3441998e21520a4e43376200b5ad4d86045b8a9c |     


Gitlab CI results for 2024-01-08
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
      TestCpioDracutGlibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/5880447824  | ORPH 
...ioDracutGlibcMergedUsr | https://gitlab.com/buildroot.org/buildroot/-/jobs/5880447827  | ORPH 
       TestCpioDracutMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/5880447832  | ORPH 
...pioDracutMuslMergedUsr | https://gitlab.com/buildroot.org/buildroot/-/jobs/5880447841  | ORPH 
     TestCpioDracutUclibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/5880447846  | ORPH 
...oDracutUclibcMergedUsr | https://gitlab.com/buildroot.org/buildroot/-/jobs/5880447849  | ORPH 
              TestFlutter | https://gitlab.com/buildroot.org/buildroot/-/jobs/5880448060  | ORPH 
              TestGlxinfo | https://gitlab.com/buildroot.org/buildroot/-/jobs/5880448099  | ORPH 
         TestGrubX8664EFI | https://gitlab.com/buildroot.org/buildroot/-/jobs/5880447674  | ORPH 
              TestKmsCube | https://gitlab.com/buildroot.org/buildroot/-/jobs/5880448129  | ORPH 
   TestPythonPy3Bitstring | https://gitlab.com/buildroot.org/buildroot/-/jobs/5880448432  | ORPH 
    TestPythonPy3Crossbar | https://gitlab.com/buildroot.org/buildroot/-/jobs/5880448468  | ORPH 
    TestPythonPy3Dtschema | https://gitlab.com/buildroot.org/buildroot/-/jobs/5880448493  | ORPH 
...honPy3FlaskExpectsJson | https://gitlab.com/buildroot.org/buildroot/-/jobs/5880448500  | ORPH 
...PythonPy3MagicWormhole | https://gitlab.com/buildroot.org/buildroot/-/jobs/5880448543  | ORPH 
       TestPythonPy3SciPy | https://gitlab.com/buildroot.org/buildroot/-/jobs/5880448601  | ORPH 
                 TestRust | https://gitlab.com/buildroot.org/buildroot/-/jobs/5880448635  | ORPH 
     TestSELinuxCustomGit | https://gitlab.com/buildroot.org/buildroot/-/jobs/5880447766  | ORPH 



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
