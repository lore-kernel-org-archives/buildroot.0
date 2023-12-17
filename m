Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF9EDC3DA6E
	for <buildroot@archiver.kernel.org>; Sun, 17 Dec 2023 06:37:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1484960AA5;
	Sun, 17 Dec 2023 06:37:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1484960AA5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NIhckn0VysjY; Sun, 17 Dec 2023 06:37:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F0EB260AE6;
	Sun, 17 Dec 2023 06:37:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F0EB260AE6
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 78CA51BF32D
 for <buildroot@lists.busybox.net>; Sun, 17 Dec 2023 06:37:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EE06F81EC4
 for <buildroot@lists.busybox.net>; Sun, 17 Dec 2023 06:37:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EE06F81EC4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1aHVfDF8sjvo for <buildroot@lists.busybox.net>;
 Sun, 17 Dec 2023 06:37:24 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EC3BF81EBC
 for <buildroot@buildroot.org>; Sun, 17 Dec 2023 06:37:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EC3BF81EBC
Received: by mail.gandi.net (Postfix) with ESMTPSA id EE8D4240007
 for <buildroot@buildroot.org>; Sun, 17 Dec 2023 06:37:20 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sun, 17 Dec 2023 06:37:20 -0000
X-GND-Sasl: bot@bootlin.com
Message-Id: <20231217063725.EE06F81EC4@smtp1.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1702795041; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=4GYm0GHl0FM7J/xREZls7iF4kc5w+XZnmtgBKLmIb4U=;
 b=UsMv1S4S2qioQWUF+8LYBKdnHxXp0rZdQJp2SHHXUaFKTHQeSZ29QWnQAIBOQ9myKvmgPa
 Qzm+wpgP1kOwtN01KfYUCuMumpbFhAmyT9t+NXl6VMNdDEzolLLyp9sXYwv/l5eopq/wiE
 6lzW2Gpb9KHakhzhl8cw1UsVgtD2juI08d2JlEIwc0rVMDwHBT2roCUzNlrHVGMV9q9Xhd
 j18BxNiNkBOvDTjUzMGqaMqasAEYbVnUWG28P6MUB1sFR7v/w21UWNcBWKsIf32Vp1wyuR
 VY3Stp7FDYRJ4PCd3IZeW1fDGR3LNJ04+YwuNeUJ1DhsvMQvQ7YAwgTnD3Z2BQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=UsMv1S4S
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-12-16
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

Autobuild statistics for 2023-12-16
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  |  2  |  1  |  0  |  3  |
  2023.08.x  |  3  |  2  |  0  |  5  |
    master   | 55  | 34  |  1  | 90  |

Classification of failures by reason for master
-----------------------------------------------

                libressl-3.8.2 | 5 
                 libcurl-8.5.0 | 3 
                       unknown | 3 
             dahdi-linux-3.2.0 | 2 
glibc-2.38-27-g750a45a78390... | 2 
                   linux-6.6.3 | 2 
                    php-8.2.13 | 2 
             batman-adv-2023.1 | 1 
                    brltty-6.6 | 1 
           dmraid-1.0.0.rc16-3 | 1 
                    fwup-1.9.1 | 1 
                heirloom-mailx | 1 
                host-go-1.21.5 | 1 
        host-sentry-cli-2.20.3 | 1 
              leptonica-1.83.1 | 1 
                 libldns-1.8.3 | 1 
              libostree-2023.7 | 1 
              libuhttpd-3.14.1 | 1 
     linux-5.10.162-cip24-rt10 | 1 
                    ngrep-1.47 | 1 
                   perl-5.36.3 | 1 
        python-pysensors-0.0.4 | 1 
rtl8189fs-75a566a830037c7d1... | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mips64    |       batman-adv-2023.1        | NOK | http://autobuild.buildroot.net/results/0192174147613bd4887008e56335b547c8220521 |     
powerpc64le  |           brltty-6.6           | NOK | http://autobuild.buildroot.net/results/5e1bfa7db8272d5df88a85a910a9eec51dcda023 |     
   x86_64    |       dahdi-linux-3.2.0        | NOK | http://autobuild.buildroot.net/results/90133ba5ccee1a7fc86a5497cddcbd1b9781b7fd |     
   s390x     |       dahdi-linux-3.2.0        | NOK | http://autobuild.buildroot.net/results/7c1108d623048dd1591211e7622a92993b8a60e3 |     
   mips64    |      dmraid-1.0.0.rc16-3       | NOK | http://autobuild.buildroot.net/results/d92e3893c2a23e2c50427d76c7bc660054044628 | ORPH
   x86_64    |           fwup-1.9.1           | NOK | http://autobuild.buildroot.net/results/0f5058634ecc2ffae3993f6f4513d8ce75e6c02f |     
powerpc64le  | glibc-2.38-27-g750a45a78390... | NOK | http://autobuild.buildroot.net/results/006e4a5b71a129113d566d84cc55372d7a79f850 |     
powerpc64le  | glibc-2.38-27-g750a45a78390... | NOK | http://autobuild.buildroot.net/results/35e2f842485abbd070cfe468e3d6a0f41c21f291 |     
    arm      |         heirloom-mailx         | TIM | http://autobuild.buildroot.net/results/47cac01550052422608864e7963d330ba8ec8d48 |     
    i586     |         host-go-1.21.5         | NOK | http://autobuild.buildroot.net/results/ff1531e15807bc64458c4bb8ef79a0ed77d32a18 |     
 aarch64_be  |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/dfeea1514259721e06f714acb1359be4a4b2e3f9 |     
   sh4eb     |        leptonica-1.83.1        | NOK | http://autobuild.buildroot.net/results/0f53210e0649d2a4504d3fc783f0c8f9bd7d4c52 |     
  powerpc    |         libcurl-8.5.0          | NOK | http://autobuild.buildroot.net/results/c91048607716b98f3b67c027c4f7cdd414587869 |     
    mips     |         libcurl-8.5.0          | NOK | http://autobuild.buildroot.net/results/cc8e6464ea446498e5f942720d7c1d5b02153a15 |     
   s390x     |         libcurl-8.5.0          | NOK | http://autobuild.buildroot.net/results/6ee64e4b1dad35671b6be0fd1c3396fd82fc0ca9 |     
  aarch64    |         libldns-1.8.3          | NOK | http://autobuild.buildroot.net/results/e1e9e04f0f45bba8a072b91ab6b912f989c300e3 |     
   nios2     |        libostree-2023.7        | NOK | http://autobuild.buildroot.net/results/88204723e8488644f6c795895a4ec76d1c6e3574 |     
 powerpc64   |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/cb249f8ff25fc88f4beb25ce2c9cda584c188cab | ORPH
   arceb     |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/712d9f443ff5c53ab9e0c854f5f383b38e13e64d | ORPH
  mips64el   |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/e1e991e10f116a626a7461c90231f984320d7346 | ORPH
   s390x     |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/d65972b30b9023a14b571374d08b57fb1114e729 | ORPH
    or1k     |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/d3f35b9f82c67299d35e7c11ec72987b8e8bc57c | ORPH
  mips64el   |        libuhttpd-3.14.1        | NOK | http://autobuild.buildroot.net/results/8edd6c3cebf21bd2259e1ba7a3ab65d623f681d2 |     
 powerpc64   |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/8ef6c769ed06ce96d5cc0ddeda5de322734e84a7 | ORPH
    mips     |          linux-6.6.3           | NOK | http://autobuild.buildroot.net/results/2e8ac43ea5d5255c5d3c350f1d85de5fbf752a5f | ORPH
  mips64el   |          linux-6.6.3           | NOK | http://autobuild.buildroot.net/results/43f209e13ea37078a030784d07ff5bc7f5031d19 | ORPH
    or1k     |           ngrep-1.47           | NOK | http://autobuild.buildroot.net/results/7bdb344e217e48fab4ef43cbce2cd8a5d416ad36 |     
   mipsel    |          perl-5.36.3           | NOK | http://autobuild.buildroot.net/results/1e9e286fb393cdd07e79391548466fea68d9cede |     
   armeb     |           php-8.2.13           | NOK | http://autobuild.buildroot.net/results/39c75dcdf73cba14edb4c36c7aaf7872ba03b095 |     
    sh4      |           php-8.2.13           | NOK | http://autobuild.buildroot.net/results/6a355cce9144b568dda619713a961187ae5fbfb6 |     
    i686     |     python-pysensors-0.0.4     | NOK | http://autobuild.buildroot.net/results/f24b9a4a09374e759a0e1300a4ca611618869a86 |     
   x86_64    | rtl8189fs-75a566a830037c7d1... | NOK | http://autobuild.buildroot.net/results/6db14fadb8aad51ebd56adc2b2488e79d525fd8d |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/bc816fc56e3b1e3adc6f86385b6bc2da04185a01 |     
 microblaze  |            unknown             | NOK | http://autobuild.buildroot.net/results/09cdeeedad34468c43f428569a47d7ef7ecfc3dc |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/1d0b0b932fb7dfdb0251889271d6eeeb448e3699 |     


Classification of failures by reason for 2023.02.x
--------------------------------------------------

                 raptor-2.0.15 | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |         raptor-2.0.15          | NOK | http://autobuild.buildroot.net/results/0911d9a812ca027d54c74caa6f178340c0ceac6b | ORPH


Classification of failures by reason for 2023.08.x
--------------------------------------------------

                  linux-6.4.16 | 1 
                   perl-5.36.3 | 1 


Detail of failures for 2023.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sh4eb     |          linux-6.4.16          | NOK | http://autobuild.buildroot.net/results/b14eaad01571682506a48a075a1f360347ab9440 | ORPH
   x86_64    |          perl-5.36.3           | NOK | http://autobuild.buildroot.net/results/848557c4e4a72efdd977032a8143d137b7995efb |     


Gitlab CI results for 2023-12-16
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
                          beaglev | https://gitlab.com/buildroot.org/buildroot/-/jobs/5762787239  |      
               broadcom_northstar | https://gitlab.com/buildroot.org/buildroot/-/jobs/5762787259  |      
              freescale_imx8mnevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/5762787414  |      
              freescale_imx8mpevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/5762787423  |      
                       imx8mmpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/5762787687  |      
                        imx8mpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/5762787698  |      
                        imx8mqevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/5762787702  |      
               kontron_pitx_imx8m | https://gitlab.com/buildroot.org/buildroot/-/jobs/5762787722  |      
                       ls1028ardb | https://gitlab.com/buildroot.org/buildroot/-/jobs/5762787747  |      
                     ls1046a-frwy | https://gitlab.com/buildroot.org/buildroot/-/jobs/5762787774  |      
              octavo_osd32mp1_brk | https://gitlab.com/buildroot.org/buildroot/-/jobs/5762788093  |      
              octavo_osd32mp1_red | https://gitlab.com/buildroot.org/buildroot/-/jobs/5762788109  |      
                   orangepi_lite2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5762788293  |      
                orangepi_one_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/5762788300  |      
                qemu_aarch64_ebbr | https://gitlab.com/buildroot.org/buildroot/-/jobs/5762788420  |      
                qemu_aarch64_sbsa | https://gitlab.com/buildroot.org/buildroot/-/jobs/5762788429  |      
                    qemu_arm_ebbr | https://gitlab.com/buildroot.org/buildroot/-/jobs/5762788456  |      
             qemu_arm_vexpress_tz | https://gitlab.com/buildroot.org/buildroot/-/jobs/5762788473  |      
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/5762788974  | ORPH 
                raspberrypizero2w | https://gitlab.com/buildroot.org/buildroot/-/jobs/5762789024  |      
             sipeed_licheepi_nano | https://gitlab.com/buildroot.org/buildroot/-/jobs/5762789146  |      
               snps_arc700_axs101 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5762789253  |      
                 snps_arc700_nsim | https://gitlab.com/buildroot.org/buildroot/-/jobs/5762789254  | ORPH 
                socrates_cyclone5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5762789274  |      
          solidrun_clearfog_gt_8k | https://gitlab.com/buildroot.org/buildroot/-/jobs/5762789299  |      
            solidrun_macchiatobin | https://gitlab.com/buildroot.org/buildroot/-/jobs/5762789315  | ORPH 
              toradex_apalis_imx6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5762789476  |      



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
