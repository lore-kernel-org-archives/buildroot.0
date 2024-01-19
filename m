Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5FBEC4725D
	for <buildroot@archiver.kernel.org>; Fri, 19 Jan 2024 07:00:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 181CB404A6;
	Fri, 19 Jan 2024 07:00:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 181CB404A6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CHIr1w8WDvu2; Fri, 19 Jan 2024 07:00:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A20D3405B3;
	Fri, 19 Jan 2024 07:00:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A20D3405B3
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 15D661BF282
 for <buildroot@lists.busybox.net>; Fri, 19 Jan 2024 07:00:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DFECE405B3
 for <buildroot@lists.busybox.net>; Fri, 19 Jan 2024 07:00:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DFECE405B3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8J0mVXncCJ9b for <buildroot@lists.busybox.net>;
 Fri, 19 Jan 2024 07:00:33 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 465C2404A6
 for <buildroot@buildroot.org>; Fri, 19 Jan 2024 07:00:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 465C2404A6
Received: by mail.gandi.net (Postfix) with ESMTPSA id 943022000D
 for <buildroot@buildroot.org>; Fri, 19 Jan 2024 07:00:29 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Fri, 19 Jan 2024 07:00:29 -0000
X-GND-Sasl: bot@bootlin.com
Message-Id: <20240119070034.DFECE405B3@smtp2.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1705647629; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=N93XHXf3byudR2e1a8QJ3Yx1XZIvrk0GV8H+4I94fAA=;
 b=LtxNu5DNcWHgjaxdoHnQfcsFMrWe0WkBzUyTLKDBt52Sc26yG/exbLKlt4P0/i3fW1sPWF
 Y+6d6Uq0Fp+x4kgJfnOQs0KmCwj8S/we9TcdgmY4sNveNWJLjBGs2gY5gbGnxgjwQDfZvZ
 Pncemqy7K/eOT2V+yk1TQvKO9cwmtjkHYlDkU8+8OHNuSXNH3iHyhuooJym8vV+d69d1gm
 sfQHpUyWGcQjWbl/CN+nq+XL7LLEg6lAOo+ne50mFDTzkrkVfqCj22IGtRZzIYlRpPSIza
 pibuQtNclcK2RapRbBP+kkMrC36zxLSOP37R8EfCUT4ry6UZPnI86iZvsPgsZg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=LtxNu5DN
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2024-01-18
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

Autobuild statistics for 2024-01-18
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  |  1  |  6  |  0  |  7  |
  2023.11.x  |  3  |  2  |  0  |  5  |
    master   | 45  | 48  |  0  | 93  |

Classification of failures by reason for master
-----------------------------------------------

  gobject-introspection-1.76.1 | 5 
                  stunnel-5.71 | 4 
                       unknown | 4 
                    attr-2.5.2 | 3 
                libressl-3.8.2 | 3 
                 openssh-9.6p1 | 3 
glibc-2.38-27-g750a45a78390... | 2 
        host-sentry-cli-2.20.3 | 2 
 Makefile:727: target-finalize | 2 
            micropython-1.22.0 | 2 
                 sudo-1.9.15p5 | 2 
                elfutils-0.189 | 1 
                 glibmm-2.76.0 | 1 
                 highway-1.0.7 | 1 
       host-gcc-initial-12.3.0 | 1 
              host-rust-1.74.1 | 1 
              libarchive-3.7.2 | 1 
libdill-32d0e8b733416208e04... | 1 
                 libnss-3.96.1 | 1 
          linux-5.10.162-cip24 | 1 
                memtest86-6.20 | 1 
               openblas-0.3.25 | 1 
                    pppd-2.5.0 | 1 
                    proj-9.3.0 | 1 
                    qemu-8.1.1 | 1 
            quickjs-2023-12-09 | 1 
                re2-2023-11-01 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |           attr-2.5.2           | NOK | http://autobuild.buildroot.net/results/687e8549a82cfc5818b0aea58419424cad9d89e1 |     
 microblaze  |           attr-2.5.2           | NOK | http://autobuild.buildroot.net/results/f4520615a9acda1dc01cdd99e614c1399334d2b7 |     
microblazeel |           attr-2.5.2           | NOK | http://autobuild.buildroot.net/results/86b08fe1147a8ca28c6003df32a9455a33600819 |     
    arc      |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/89e6cc25c040d072f14db1ddc3b62aec060765d4 | ORPH
    arc      | glibc-2.38-27-g750a45a78390... | NOK | http://autobuild.buildroot.net/results/ab2ac9599f3b346230929f46f3938e7e5946b594 |     
 powerpc64   | glibc-2.38-27-g750a45a78390... | NOK | http://autobuild.buildroot.net/results/00334ffc1d53ca7320e454b1b1e47f06aabd9573 |     
   nios2     |         glibmm-2.76.0          | NOK | http://autobuild.buildroot.net/results/61760d01ac17be98a75562a49ba2beb6d392e6f0 |     
    i686     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/792de7d331c5e6a24f91f21470fcc4dfc9174362 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/ddfdfaa8757f132023fe3f329cf4cd9eeac60084 | ORPH
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/19149df0617a96711cb69654dcf33d18a630809e | ORPH
    mips     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/7d6dfdd7e1275522cdd5d8585166558c97a643d1 | ORPH
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/5ea5d51457e3e98c9748b457cd86d3ff4f439246 | ORPH
  riscv32    |         highway-1.0.7          | NOK | http://autobuild.buildroot.net/results/3f8def50c93f73c26339f72d6a13951d5fb41c30 |     
    arm      |    host-gcc-initial-12.3.0     | NOK | http://autobuild.buildroot.net/results/2ce96a0ce8773c75337627b7c2c12c541803d80e |     
    i686     |        host-rust-1.74.1        | NOK | http://autobuild.buildroot.net/results/471b1404c1d0d281100b4e2f9679a914a853ebb8 |     
    or1k     |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/353f687e0ee4966738c66d3453e0230a27a9f94f |     
  mips64el   |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/5d98dc1c357a53476a7a7c0036c7e7ada98888d8 |     
    arc      |        libarchive-3.7.2        | NOK | http://autobuild.buildroot.net/results/631a592bd653411a2b5b75a833efc0f1c5634c74 |     
   nios2     | libdill-32d0e8b733416208e04... | NOK | http://autobuild.buildroot.net/results/c984c3307c4b046d6c88af375b7f05233459b383 |     
    i686     |         libnss-3.96.1          | NOK | http://autobuild.buildroot.net/results/9ea4e543249325da0efa5e5bf79bde7959d60ea1 |     
   mipsel    |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/7bb1da9cad8ab64731e744959c6dd4b88b3e7309 | ORPH
    sh4a     |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/329b6419aff8c6df885eea32b9bb3aa3cbbeda87 | ORPH
    arc      |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/58b5107dddddcb055915279357e08590e245ce9d | ORPH
   x86_64    |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/67eae55e7168297fcecf701671550418a5fe8bd9 | ORPH
powerpc64le  | Makefile:727: target-finalize  | NOK | http://autobuild.buildroot.net/results/04a93877d5b3c63db81574271e3c8fb6ed12934e |     
   mips64    | Makefile:727: target-finalize  | NOK | http://autobuild.buildroot.net/results/70b2ecea404fc52815f80ee05a04ede292e2455e |     
    i586     |         memtest86-6.20         | NOK | http://autobuild.buildroot.net/results/665f7d5c9d10ee7e678ae6f7705af4057eb4aae0 |     
   mips64    |       micropython-1.22.0       | NOK | http://autobuild.buildroot.net/results/43851ebc3786bd058b407b9ac1fb52610d4f2888 |     
    m68k     |       micropython-1.22.0       | NOK | http://autobuild.buildroot.net/results/994e3b1dac41062f0247d7a5819469aae19260f2 |     
  mips64el   |        openblas-0.3.25         | NOK | http://autobuild.buildroot.net/results/fecc71181a582b6097ad2f8ec1223f14307293bf |     
powerpc64le  |         openssh-9.6p1          | NOK | http://autobuild.buildroot.net/results/b3470e1540f19043a242e5962e893824c1e79c50 | ORPH
 powerpc64   |         openssh-9.6p1          | NOK | http://autobuild.buildroot.net/results/b949cc0b2f1c84ec3c31cc0f5d493b932d98fd13 | ORPH
powerpc64le  |         openssh-9.6p1          | NOK | http://autobuild.buildroot.net/results/67163c97b77790408ad6073f273630a461db4382 | ORPH
  sparc64    |           pppd-2.5.0           | NOK | http://autobuild.buildroot.net/results/273b9ae8d118dcd5a3ad7797c7e9250d2af4fae0 |     
  sparc64    |           proj-9.3.0           | NOK | http://autobuild.buildroot.net/results/98bae3556a1678427961ae8c30b09d5d8fda3afb |     
powerpc64le  |           qemu-8.1.1           | NOK | http://autobuild.buildroot.net/results/9977ab64f3770bf4f4edd6e6d78a5c0cd6c7cc83 |     
  mips64el   |       quickjs-2023-12-09       | NOK | http://autobuild.buildroot.net/results/62084794d216c8c4a4d1fc2f1d70df0dec022d96 |     
    mips     |         re2-2023-11-01         | NOK | http://autobuild.buildroot.net/results/09e3ea5857ff87f65015f36a96992815cf9dfe9f |     
    i686     |          stunnel-5.71          | NOK | http://autobuild.buildroot.net/results/65e65da9939a4c092d4d29d9aaf7e8f3833ee237 |     
    mips     |          stunnel-5.71          | NOK | http://autobuild.buildroot.net/results/1a33253262d1ffdfd3b042a6d170cbb58ce4276e |     
 aarch64_be  |          stunnel-5.71          | NOK | http://autobuild.buildroot.net/results/81ddb0d2742498b126a5ff65340c1a558a556c5c |     
  mips64el   |          stunnel-5.71          | NOK | http://autobuild.buildroot.net/results/f74addd2a81650248cd496099e6de8519ee56589 |     
    mips     |         sudo-1.9.15p5          | NOK | http://autobuild.buildroot.net/results/55c88d45da2d99bfc26277bdeba6f5e54d6c445d | ORPH
   mipsel    |         sudo-1.9.15p5          | NOK | http://autobuild.buildroot.net/results/69addcf7b6f43fe3b02b2e2b83b04c3a27dd7926 | ORPH
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/30c67bac23b37d1d8c5e392308bbb2fb73174138 |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/7d42bc2526b12dce9262da7434a89e9ad8170eab |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/19ebc0a53941f26e537f6bfed43dfdd23f78328e |     
 aarch64_be  |            unknown             | NOK | http://autobuild.buildroot.net/results/643b084a8bc74575e5551de5a5cb660c8a9843db |     


Classification of failures by reason for 2023.02.x
--------------------------------------------------

               gupnp-av-0.14.0 | 1 
              host-rust-1.67.1 | 1 
                libglvnd-1.4.0 | 1 
                  linux-6.1.72 | 1 
                python3-3.11.6 | 1 
                       unknown | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    mips     |        gupnp-av-0.14.0         | NOK | http://autobuild.buildroot.net/results/994e3c590f94380a1dd99f2e9557fc2606b142d2 |     
powerpc64le  |        host-rust-1.67.1        | NOK | http://autobuild.buildroot.net/results/14a83799456b90214e3677d93bef3a731327d11c |     
    arc      |         libglvnd-1.4.0         | NOK | http://autobuild.buildroot.net/results/32f958c8af6e6e5af10c0d20b75d620696210c88 | ORPH
    sh4      |          linux-6.1.72          | NOK | http://autobuild.buildroot.net/results/1d43b5b166fdf1cae1d39a5fe079771fb6ee12ee | ORPH
   x86_64    |         python3-3.11.6         | NOK | http://autobuild.buildroot.net/results/94d8d9eb6a404283ec4517443e66169e3ffeda70 |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/db2cc1012a36bbce0cfebc88b7db308dee702eb8 |     


Classification of failures by reason for 2023.11.x
--------------------------------------------------

              host-rust-1.71.1 | 1 
                    proj-9.3.0 | 1 


Detail of failures for 2023.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mips64    |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/c3d47080fe530db769925e56e3a2685d43e908c5 |     
   sparc     |           proj-9.3.0           | NOK | http://autobuild.buildroot.net/results/f9ff90167c0b581e86587d77d3afc991079c63fa |     


Gitlab CI results for 2024-01-18
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
      TestCpioDracutGlibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/5928434694  | ORPH 
...ioDracutGlibcMergedUsr | https://gitlab.com/buildroot.org/buildroot/-/jobs/5928434699  | ORPH 
       TestCpioDracutMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/5928434703  | ORPH 
...pioDracutMuslMergedUsr | https://gitlab.com/buildroot.org/buildroot/-/jobs/5928434706  | ORPH 
     TestCpioDracutUclibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/5928434711  | ORPH 
...oDracutUclibcMergedUsr | https://gitlab.com/buildroot.org/buildroot/-/jobs/5928434717  | ORPH 
              TestFlutter | https://gitlab.com/buildroot.org/buildroot/-/jobs/5928434912  | ORPH 
              TestGlxinfo | https://gitlab.com/buildroot.org/buildroot/-/jobs/5928434934  | ORPH 
         TestGrubX8664EFI | https://gitlab.com/buildroot.org/buildroot/-/jobs/5928434370  | ORPH 
   TestPythonPy3Bitstring | https://gitlab.com/buildroot.org/buildroot/-/jobs/5928435230  | ORPH 
    TestPythonPy3Crossbar | https://gitlab.com/buildroot.org/buildroot/-/jobs/5928435266  | ORPH 
    TestPythonPy3Dtschema | https://gitlab.com/buildroot.org/buildroot/-/jobs/5928435281  | ORPH 
...honPy3FlaskExpectsJson | https://gitlab.com/buildroot.org/buildroot/-/jobs/5928435292  | ORPH 
...PythonPy3MagicWormhole | https://gitlab.com/buildroot.org/buildroot/-/jobs/5928435319  | ORPH 
       TestPythonPy3SciPy | https://gitlab.com/buildroot.org/buildroot/-/jobs/5928435387  | ORPH 
                 TestRust | https://gitlab.com/buildroot.org/buildroot/-/jobs/5928435434  | ORPH 
     TestSELinuxCustomGit | https://gitlab.com/buildroot.org/buildroot/-/jobs/5928434606  | ORPH 



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
