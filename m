Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13322C46CD2
	for <buildroot@archiver.kernel.org>; Tue, 30 Jan 2024 06:47:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7985F60B70;
	Tue, 30 Jan 2024 06:47:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7985F60B70
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BN5T4mhX58v1; Tue, 30 Jan 2024 06:47:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 791AA60BCE;
	Tue, 30 Jan 2024 06:47:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 791AA60BCE
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 03FBC1BF2C2
 for <buildroot@lists.busybox.net>; Tue, 30 Jan 2024 06:47:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9A544417EA
 for <buildroot@lists.busybox.net>; Tue, 30 Jan 2024 06:47:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9A544417EA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MWVrkijjOeah for <buildroot@lists.busybox.net>;
 Tue, 30 Jan 2024 06:47:39 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 78A0A417BA
 for <buildroot@buildroot.org>; Tue, 30 Jan 2024 06:47:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 78A0A417BA
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8A2C61BF20D
 for <buildroot@buildroot.org>; Tue, 30 Jan 2024 06:47:35 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Tue, 30 Jan 2024 06:47:35 -0000
X-GND-Sasl: bot@bootlin.com
Message-Id: <20240130064740.9A544417EA@smtp4.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1706597255; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=e8ZzCqTk4qzw9kl9BE7lDmQgCp/kPCoQDQRpMntaZc8=;
 b=eCs7sLsPKTiDbFZsa4HUb5OvzhATmvZ8gpy973l/+FvaWxYL4F5PJs8rOnjvv3khtuDSoe
 RoPZVJX9u2vqjDj5wrDEeqLtIBtX3785cZnnCnnVkxLhONdeq2alZfCpF3gQKPANPQv2Vg
 31qwvX2DanMwmJjwUm3IgrdUUo6Rxc6y2SFzFsEsuSztpE6YjpAYarVkPktill+2klOUsx
 uBAgdAobaimakNgGMJdLoSHzXDiQ5SeBXAuKhLfnynPU85IgAFnsjq2vUn35a6XZclXJR5
 tVOCttKIhATwU19QTGvTwCWeBi9AkYzl6xuIh1y8/YyWsXuzPdWMsiDn3AJ1UQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=eCs7sLsP
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2024-01-29
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

Autobuild statistics for 2024-01-29
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  |  3  |  0  |  0  |  3  |
  2023.11.x  |  2  |  4  |  0  |  6  |
    master   | 39  | 50  |  1  | 90  |

Classification of failures by reason for master
-----------------------------------------------

                libressl-3.8.2 | 5 
                  stunnel-5.71 | 5 
                 openssh-9.6p1 | 4 
                 sudo-1.9.15p5 | 4 
  gobject-introspection-1.76.1 | 3 
                  linux-6.6.13 | 3 
                    attr-2.5.2 | 2 
                    brltty-6.6 | 2 
              libopenssl-3.2.0 | 2 
                  acpid-2.0.34 | 1 
             bluez5_utils-5.68 | 1 
                   botan-3.2.0 | 1 
                elfutils-0.189 | 1 
         gobject-introspection | 1 
host-heimdal-f4faaeaba371ff... | 1 
              host-rust-1.74.1 | 1 
               ipmitool-1_8_19 | 1 
              libarchive-3.7.2 | 1 
               libglib2-2.76.1 | 1 
                   libnss-3.97 | 1 
                libselinux-3.5 | 1 
 Makefile:727: target-finalize | 1 
                 mesa3d-23.3.3 | 1 
                 powertop-2.15 | 1 
                    pppd-2.5.0 | 1 
           python-numpy-1.25.0 | 1 
                 samba4-4.19.3 | 1 
uclibc-ng-test-0f303c63fab7... | 1 
                       unknown | 1 
                 wolfssl-5.6.6 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |          acpid-2.0.34          | NOK | http://autobuild.buildroot.net/results/19a4e4fc770b0454e3df6ba6ee3d4aa283141f45 | ORPH
 microblaze  |           attr-2.5.2           | NOK | http://autobuild.buildroot.net/results/0fbd528b250590b1717bce5f07f7f318ca8eee87 |     
 microblaze  |           attr-2.5.2           | NOK | http://autobuild.buildroot.net/results/4729909d7ab42bf8f13c7607a85ad49bb87a8df8 |     
    sh4      |       bluez5_utils-5.68        | NOK | http://autobuild.buildroot.net/results/d87c418a2e68626645f68c68ca03bb0bc885d1bf |     
 powerpc64   |          botan-3.2.0           | NOK | http://autobuild.buildroot.net/results/43307dee29a2b70ec0b5115d6481a05eb7d3e55f | ORPH
  powerpc    |           brltty-6.6           | NOK | http://autobuild.buildroot.net/results/3d7bedfbdea77c513e565e5085a168b0a3ee6c80 |     
  mips64el   |           brltty-6.6           | NOK | http://autobuild.buildroot.net/results/f33392505ce73063d7bebaa011737e50f7581f87 |     
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/6d115013d8c29ff3fad715a67c3217f984fcb10b | ORPH
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/f28b444aff73502e7aaece0b2c6cac42efd89696 |     
    m68k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/c500af2efb9345ff9f15e1b01bc36788138ae3e9 | ORPH
   s390x     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/f3c7d17dea2d5dced464e7f2d7dc6d83ca7ed31e | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/80437f5ee62069cf9d037e435b49c4dce298d2b1 | ORPH
  mips64el   | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/64c1992d1c7d8b9f0e5266f7d6769e0b33f881cd | ORPH
  sparc64    |        host-rust-1.74.1        | NOK | http://autobuild.buildroot.net/results/d95e42cfb9740aa4aad0b192a985c5ab91587177 |     
microblazeel |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.net/results/e0c779e3dfc51799f36d99bc4bfbf5673a82b742 |     
 microblaze  |        libarchive-3.7.2        | NOK | http://autobuild.buildroot.net/results/055b34ccd825e191bd96abac25d1eae23b51af2a |     
   arceb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/31f8b42efef22f92f0a94a22618a5524094a16c5 |     
    or1k     |          libnss-3.97           | NOK | http://autobuild.buildroot.net/results/cb6e0c3663299423c00146ff8a1317ea3ef4ee50 |     
    arm      |        libopenssl-3.2.0        | NOK | http://autobuild.buildroot.net/results/e6b25e46c77446656368b642431bb663b94b613f | ORPH
   s390x     |        libopenssl-3.2.0        | NOK | http://autobuild.buildroot.net/results/93e7794889e7b730dbefa41c2f6e5ab3960ad4df | ORPH
   mips64    |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/08d94bca4b3e2a3f98eb46806cdc7d56678f3d3b | ORPH
 powerpc64   |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/247bb0a2091f0c92c988ba0c2c03342962bb3549 | ORPH
   nios2     |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/2e77d50a76abbc924c2d89b4ddef777797c38690 | ORPH
 powerpc64   |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/e20c02c26b2de712f56e3c744c766bd7b38c31c3 | ORPH
   s390x     |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/73b417da4237028c8996b78bf5f6e452cf158ef0 | ORPH
   armeb     |         libselinux-3.5         | NOK | http://autobuild.buildroot.net/results/e8a78da2fb91c1e0f8a2e815cbdd2659776e3b1d |     
   nios2     |          linux-6.6.13          | NOK | http://autobuild.buildroot.net/results/c7babefd997a7a7894c13636e03c4f523eca00b2 | ORPH
powerpc64le  |          linux-6.6.13          | NOK | http://autobuild.buildroot.net/results/72cb2067fa228d22bc35d5dc32585527a113d285 | ORPH
 microblaze  |          linux-6.6.13          | NOK | http://autobuild.buildroot.net/results/bde71150243aaf681b5f06e36ffa7b36cfb29e5f | ORPH
powerpc64le  | Makefile:727: target-finalize  | NOK | http://autobuild.buildroot.net/results/69e48f4edd6cdf325a2aec3c9dc9414ff7a8e3c3 |     
 aarch64_be  |         mesa3d-23.3.3          | NOK | http://autobuild.buildroot.net/results/b62eba2155b080ed02fde774994f2fffc8a6ef51 |     
 powerpc64   |         openssh-9.6p1          | NOK | http://autobuild.buildroot.net/results/1f4b147f0c434063bb8e9db2cb488ccdcf7a1f9f | ORPH
  mips64el   |         openssh-9.6p1          | NOK | http://autobuild.buildroot.net/results/0d0d7d1081e0980701faee1bc801f986031f57f0 | ORPH
  mips64el   |         openssh-9.6p1          | NOK | http://autobuild.buildroot.net/results/081b584fb03562321cd1fa86032d535b2a886ed6 | ORPH
 powerpc64   |         openssh-9.6p1          | NOK | http://autobuild.buildroot.net/results/2eeda406acc0b6a6d966dc3616ab59124ae7cdbc | ORPH
   s390x     |         powertop-2.15          | NOK | http://autobuild.buildroot.net/results/f4240d07cde921b49522ce6fa7bde6bb376d3bb4 |     
  sparc64    |           pppd-2.5.0           | NOK | http://autobuild.buildroot.net/results/12e088f919475089a68e9665e581f292d6ebb467 |     
    mips     |      python-numpy-1.25.0       | NOK | http://autobuild.buildroot.net/results/87aed1add075233297c289a46c0c58e2a84d9128 |     
    m68k     |         samba4-4.19.3          | NOK | http://autobuild.buildroot.net/results/33ccf81c5cb9449ec3baeb944f7d74b9738a0232 |     
    m68k     |          stunnel-5.71          | NOK | http://autobuild.buildroot.net/results/20bb15da18d59d3a7cf31cdd368974b8bfec1470 |     
 powerpc64   |          stunnel-5.71          | NOK | http://autobuild.buildroot.net/results/5dc4b78f750aee6bbb119a917905124d55f8c4b6 |     
 microblaze  |          stunnel-5.71          | NOK | http://autobuild.buildroot.net/results/4008ba7a9926a65e05ef1581aaa8896b15be220d |     
  aarch64    |          stunnel-5.71          | NOK | http://autobuild.buildroot.net/results/402549445a3a2913d56d42955258095cfc863ad9 |     
   mipsel    |          stunnel-5.71          | NOK | http://autobuild.buildroot.net/results/61582142379a385f453ab6bc4fb0d0d610197adf |     
 aarch64_be  |         sudo-1.9.15p5          | NOK | http://autobuild.buildroot.net/results/006e0d9924962324db64e4394798900688f7924c | ORPH
   armeb     |         sudo-1.9.15p5          | NOK | http://autobuild.buildroot.net/results/ebb061016a5006d31a7b5c628abc2f653fe09468 | ORPH
   mips64    |         sudo-1.9.15p5          | NOK | http://autobuild.buildroot.net/results/48ab8a62ded94361791357f3dd01253bd1abdc56 | ORPH
  powerpc    |         sudo-1.9.15p5          | NOK | http://autobuild.buildroot.net/results/70c1eb3b8efda40e82b71af496e500eda8d90e89 | ORPH
    arm      | uclibc-ng-test-0f303c63fab7... | NOK | http://autobuild.buildroot.net/results/ee34bd0b5c1c4bafe220594b868481ff1baa6be2 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/5ac9e1e2363ff4b49fd0394cd83918e98b5b6a50 |     
    mips     |         wolfssl-5.6.6          | NOK | http://autobuild.buildroot.net/results/efb0cd353ec6078260b54150667ab2f7bd9e0111 |     


Classification of failures by reason for 2023.11.x
--------------------------------------------------

              host-rust-1.71.1 | 1 
           janus-gateway-1.1.2 | 1 
                libselinux-3.5 | 1 
            micropython-1.22.0 | 1 


Detail of failures for 2023.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  sparc64    |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/184d3b5e15cdcb9a56c8000e274679fcdab51c7c |     
   mips64    |      janus-gateway-1.1.2       | NOK | http://autobuild.buildroot.net/results/6749557ae846df425127ca31759145847d85dbb1 |     
   arceb     |         libselinux-3.5         | NOK | http://autobuild.buildroot.net/results/503cd8b298a289d51c555c6d2da709c7f2334df8 |     
  powerpc    |       micropython-1.22.0       | NOK | http://autobuild.buildroot.net/results/e7da6e8c7d7d4fd32e7dbaa407425cdbdc675bb3 |     


Gitlab CI results for 2024-01-29
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
      TestCpioDracutGlibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/6040162462  | ORPH 
...ioDracutGlibcMergedUsr | https://gitlab.com/buildroot.org/buildroot/-/jobs/6040162463  | ORPH 
       TestCpioDracutMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/6040162465  | ORPH 
...pioDracutMuslMergedUsr | https://gitlab.com/buildroot.org/buildroot/-/jobs/6040162468  | ORPH 
     TestCpioDracutUclibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/6040162470  | ORPH 
...oDracutUclibcMergedUsr | https://gitlab.com/buildroot.org/buildroot/-/jobs/6040162471  | ORPH 
              TestGlxinfo | https://gitlab.com/buildroot.org/buildroot/-/jobs/6040162761  | ORPH 
         TestGrubX8664EFI | https://gitlab.com/buildroot.org/buildroot/-/jobs/6040162292  | ORPH 
   TestPythonPy3Bitstring | https://gitlab.com/buildroot.org/buildroot/-/jobs/6040163014  | ORPH 
    TestPythonPy3Crossbar | https://gitlab.com/buildroot.org/buildroot/-/jobs/6040163031  | ORPH 
    TestPythonPy3Dtschema | https://gitlab.com/buildroot.org/buildroot/-/jobs/6040163045  | ORPH 
...honPy3FlaskExpectsJson | https://gitlab.com/buildroot.org/buildroot/-/jobs/6040163051  | ORPH 
...PythonPy3MagicWormhole | https://gitlab.com/buildroot.org/buildroot/-/jobs/6040163069  | ORPH 
       TestPythonPy3SciPy | https://gitlab.com/buildroot.org/buildroot/-/jobs/6040163109  | ORPH 
                 TestRust | https://gitlab.com/buildroot.org/buildroot/-/jobs/6040163138  | ORPH 



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
