Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D003FC433F5
	for <buildroot@archiver.kernel.org>; Tue, 15 Feb 2022 07:23:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2D0484000B;
	Tue, 15 Feb 2022 07:23:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id waFciht5uYWe; Tue, 15 Feb 2022 07:23:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 867AC4011B;
	Tue, 15 Feb 2022 07:23:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1A6031BF276
 for <buildroot@lists.busybox.net>; Tue, 15 Feb 2022 07:23:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EF8444026C
 for <buildroot@lists.busybox.net>; Tue, 15 Feb 2022 07:23:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y8XW04wWqu8n for <buildroot@lists.busybox.net>;
 Tue, 15 Feb 2022 07:23:34 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::232])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 42E7940263
 for <buildroot@buildroot.org>; Tue, 15 Feb 2022 07:23:34 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 218E020000C
 for <buildroot@buildroot.org>; Tue, 15 Feb 2022 07:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1644909811; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=BkXDGIgfz1tZIICPdUzYxvT/vp4FPU7fJaVIJ1PiU/Q=;
 b=ZIYRrm9sC27BgrrIDc5v3Rt8DKNh9MWiNDyigCPySLKdHQcxfP7i7NZHIQlWTwWNeUOyxi
 9c9jKklNYYu0m5D7uqZj/wO18uMmjYO5Nqj5B7RoNch0KLIYU7EHN1GmJhrViguMGYJNnR
 E5DtJ1KZNkbpAr2C1XKwixedKydy83Zg+d/i5dXfPX3YnFLdEUCx6l9k3qN87c9nG+93y5
 pYRUKnXhs892yvWNOHHB7vJBH+2JR8COdM48XJcdRicMwlU8d53j6yAAgJdzkWU8ovMNWK
 iaPZFPcFjf3jSDp8uofUzhB2BTieWwDW8SGWGAH9JDAh5g5d199HTixb4zr9Yg==
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Tue, 15 Feb 2022 07:23:31 -0000
Message-Id: <20220215072336.EF8444026C@smtp4.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-02-14
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

Autobuild statistics for 2022-02-14
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 46  | 10  |  0  | 56  |
  2021.11.x  |  9  |  2  |  0  | 11  |
    master   | 45  | 36  |  0  | 81  |

Classification of failures by reason for master
-----------------------------------------------

             bluez5_utils-5.63 | 9 
           host-libselinux-3.3 | 5 
bpftool-a7f0e7f057283ae8af3... | 2 
         python-greenlet-1.1.2 | 2 
                rtorrent-0.9.8 | 2 
                       unknown | 2 
                    bat-0.19.0 | 1 
                  dnsmasq-2.86 | 1 
                       frr-8.1 | 1 
                      gdb-10.2 | 1 
            ghostscript-9.55.0 | 1 
             kismet-2021-08-R1 | 1 
                 libusb-1.0.25 | 1 
                 mesa3d-21.3.5 | 1 
                mongodb-4.2.18 | 1 
      qt5webkit-5.212.0-alpha4 | 1 
               target-finalize | 1 
tovid-87c676f4aadb7303d2cd9... | 1 
                 wavemon-0.9.4 | 1 
                 weston-10.0.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |           bat-0.19.0           | NOK | http://autobuild.buildroot.net/results/b489ded8e2df5ccaee68b8653a6f8c973d9f277f |     
    sh4      |       bluez5_utils-5.63        | NOK | http://autobuild.buildroot.net/results/46f7dbfe1d80c7622d670ba1ac957e9e6077eb9f |     
    arm      |       bluez5_utils-5.63        | NOK | http://autobuild.buildroot.net/results/1e7a0d5b5cdd899b31592c1b4eefa56fb63ea516 |     
   nios2     |       bluez5_utils-5.63        | NOK | http://autobuild.buildroot.net/results/103d8f9704b2b320b9e28f89f74009121691b1be |     
    arc      |       bluez5_utils-5.63        | NOK | http://autobuild.buildroot.net/results/207e13be0afe6b9ececee1ca93a07cd0d171ccfe |     
  mips64el   |       bluez5_utils-5.63        | NOK | http://autobuild.buildroot.net/results/04c2567b5613b9fd7cfae50f629ee104fdefe277 |     
    arc      |       bluez5_utils-5.63        | NOK | http://autobuild.buildroot.net/results/50022775b7f0534629c945d0383eec0408b27f69 |     
  mips64el   |       bluez5_utils-5.63        | NOK | http://autobuild.buildroot.net/results/7fb21ef2eb1a12fe7d28e3e0bc57a5ef381a018c |     
    i686     |       bluez5_utils-5.63        | NOK | http://autobuild.buildroot.net/results/6a8f998896f874d3a669151d1487ca572691db6d |     
    arc      |       bluez5_utils-5.63        | NOK | http://autobuild.buildroot.net/results/a9a4004f52c9d80047b1d86b82b60fb0696ed88e |     
powerpc64le  | bpftool-a7f0e7f057283ae8af3... | NOK | http://autobuild.buildroot.net/results/390b70b66ce21ed2cfc69658c5bf88610b091f6b |     
   mipsel    | bpftool-a7f0e7f057283ae8af3... | NOK | http://autobuild.buildroot.net/results/302d69b5cba13934ca8f7cc4890ede61c7a3a741 |     
  powerpc    |          dnsmasq-2.86          | NOK | http://autobuild.buildroot.net/results/9714d33f0679aa75d4add03087ac066f8b961b9e |     
    arc      |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/e055d47e807e106ed8613de5eebfbb383d4d23cb |     
   xtensa    |            gdb-10.2            | NOK | http://autobuild.buildroot.net/results/091f6ea9da11c095dff7d49c3916afa30b9e7ddb | ORPH
    arm      |       ghostscript-9.55.0       | NOK | http://autobuild.buildroot.net/results/fd35a47b2a77cf57c243ec1c88802b53ddca8f52 |     
   nios2     |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/f950b15ad0d87e50ff3935d9e4e4356804474fc3 |     
  mips64el   |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/4f822a0de9457aced04563952238524ff9720390 |     
    arm      |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/fe4297556655eb15d0e7f9fd9d972033c092e144 |     
microblazeel |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/d7cdcbf921af462591e4e80d02506d6919984e3a |     
  mips64el   |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/72b36a7125826bdbb0451da3361a0fe0f2fb7f11 |     
   sparc     |       kismet-2021-08-R1        | NOK | http://autobuild.buildroot.net/results/1b1da700a9b875ed8cb019c8974edd02f969d1c5 | ORPH
   sparc     |         libusb-1.0.25          | NOK | http://autobuild.buildroot.net/results/8b79c58e4d28281c020eb10515d1c16b72dadd42 |     
    sh4      |         mesa3d-21.3.5          | NOK | http://autobuild.buildroot.net/results/a53ca83cac36346d31d89edf481e10424e917379 |     
  aarch64    |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/1a1dabae447feeee32ec34cc96563f088c0b4cd6 |     
  riscv64    |     python-greenlet-1.1.2      | NOK | http://autobuild.buildroot.net/results/cdcf19168ea5aa82c57c36358ebec9c28201e2ea |     
  mips64el   |     python-greenlet-1.1.2      | NOK | http://autobuild.buildroot.net/results/6a91bec4336c147e1682880784af87a757b3d48a |     
    arm      |    qt5webkit-5.212.0-alpha4    | NOK | http://autobuild.buildroot.net/results/af5b8baf4dc3de3b266debe99d1392e965cbe5fe |     
   x86_64    |         rtorrent-0.9.8         | NOK | http://autobuild.buildroot.net/results/8d3a6ca73dfe1a4d878b299ee7e9761336e3caa0 | ORPH
    i686     |         rtorrent-0.9.8         | NOK | http://autobuild.buildroot.net/results/7082c83ec56177a9d83ddb607fd24e91cb201100 | ORPH
    m68k     |        target-finalize         | NOK | http://autobuild.buildroot.net/results/8d7b0c23472abffc9447e4a6de273bdd04486d39 |     
    arc      | tovid-87c676f4aadb7303d2cd9... | NOK | http://autobuild.buildroot.net/results/9717c424bbef39c7603556e01e6dcaf5bf513855 |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/c5e5e937c68a50eebee38b0f7a98c34575a966db |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/d0f5eee53f6e93998096f3927f5a378a7beef6c1 |     
   nios2     |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/930ef990ecf804f872fcb25ec4ec544e33567c04 |     
    arc      |         weston-10.0.0          | NOK | http://autobuild.buildroot.net/results/e669a6237c19783c627169c819d7372e20daaf54 |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

                  zeromq-4.3.4 | 3 
                rocksdb-6.13.3 | 2 
                       unknown | 2 
        host-sentry-cli-1.57.0 | 1 
                  ndisc6-1.0.4 | 1 
               openldap-2.4.59 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/993cabc3cb3a64dcf632f2d1ef1efd48030177d5 |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/b1451075d49a02a5fa9318b700dc227543868545 | ORPH
  riscv32    |        openldap-2.4.59         | NOK | http://autobuild.buildroot.net/results/0ca955cc1adf21c8275def251c1d7b59688a555c |     
    arm      |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/36681a8c949f74ec16918cabd5cf94a73f24dcc8 |     
    m68k     |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/fa7b80702bb204f12b04cd86d8e8c86a6483bf4e |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/39c2aaf5a12ff24bc17e67020e812c48a56cddf5 |     
    i686     |            unknown             | NOK | http://autobuild.buildroot.net/results/94dc981b95e84cd51816ce0f9152c2c23ae9f781 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/7e8c0ab0006d68f23661e08f5ed15a0f3b2c6428 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/e7fa50228728210b5d8d39f41a7218b33fdf05fe |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/734b8b506b310cfe29ed4494ae74c0e1c0dabed3 |     


Classification of failures by reason for 2021.11.x
--------------------------------------------------

                 wavemon-0.9.4 | 2 


Detail of failures for 2021.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/ddcef7e036147e50acb39af3b7e7c98fbe98eebf |     
  mips64el   |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/3384ab0fcb9a8554dbeb22d4262d31fc42338a17 |     


Gitlab CI results for 2022-02-14
================================

Detail of defconfig failures for 2022.02-rc1
--------------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
             qemu_ppc64le_pseries | https://gitlab.com/buildroot.org/buildroot/-/jobs/2087852289  |      
                       qemu_s390x | https://gitlab.com/buildroot.org/buildroot/-/jobs/2087852300  |      


Detail of runtime-test failures for 2022.02-rc1
-----------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
           TestIPythonPy3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2087852418  | ORPH 
         TestLuaLuasyslog | https://gitlab.com/buildroot.org/buildroot/-/jobs/2087852492  | ORPH 
                  TestLxc | https://gitlab.com/buildroot.org/buildroot/-/jobs/2087852495  | ORPH 
 TestPerlLWPProtocolhttps | https://gitlab.com/buildroot.org/buildroot/-/jobs/2087852520  | ORPH 
TestPythonPy3Cryptography | https://gitlab.com/buildroot.org/buildroot/-/jobs/2087852572  | ORPH 
      TestPythonPy3Pyyaml | https://gitlab.com/buildroot.org/buildroot/-/jobs/2087852603  | ORPH 
                 TestRust | https://gitlab.com/buildroot.org/buildroot/-/jobs/2087852624  | ORPH 
              TestRustBin | https://gitlab.com/buildroot.org/buildroot/-/jobs/2087852627  | ORPH 


Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
           TestCrudiniPy3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2088683760  | ORPH 
           TestIPythonPy3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2088683795  | ORPH 
         TestLuaLuasyslog | https://gitlab.com/buildroot.org/buildroot/-/jobs/2088683903  | ORPH 
                  TestLxc | https://gitlab.com/buildroot.org/buildroot/-/jobs/2088683908  | ORPH 
      TestPythonPy3Pyyaml | https://gitlab.com/buildroot.org/buildroot/-/jobs/2088684091  | ORPH 
                 TestRust | https://gitlab.com/buildroot.org/buildroot/-/jobs/2088684137  | ORPH 
              TestRustBin | https://gitlab.com/buildroot.org/buildroot/-/jobs/2088684141  | ORPH 



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
