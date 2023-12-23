Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8201C3DA6E
	for <buildroot@archiver.kernel.org>; Sat, 23 Dec 2023 06:40:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0859B83C95;
	Sat, 23 Dec 2023 06:40:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0859B83C95
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JLFA3oZrUK07; Sat, 23 Dec 2023 06:40:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2251D83C9B;
	Sat, 23 Dec 2023 06:40:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2251D83C9B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A0F961BF31A
 for <buildroot@lists.busybox.net>; Sat, 23 Dec 2023 06:40:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 759D560AFF
 for <buildroot@lists.busybox.net>; Sat, 23 Dec 2023 06:40:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 759D560AFF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nBLZYWflKBI5 for <buildroot@lists.busybox.net>;
 Sat, 23 Dec 2023 06:40:52 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8766A60AFD
 for <buildroot@buildroot.org>; Sat, 23 Dec 2023 06:40:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8766A60AFD
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9073F2000B
 for <buildroot@buildroot.org>; Sat, 23 Dec 2023 06:40:48 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sat, 23 Dec 2023 06:40:48 -0000
X-GND-Sasl: bot@bootlin.com
Message-Id: <20231223064053.759D560AFF@smtp3.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1703313648; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=E4O9tGHdxaH434wNX0D2CwY1sG0xNLY6NWzDg0rrdfE=;
 b=fxwPVR3ahpuio3X9kCm6UsuKhTrT6kq2/Pmd54HeM4xMMKUJWfI45xGFSx6oPFVKRWEYox
 5y2gg4FE9GDZldgAam427jRggRhixU6FJOX/vdkupk5ni3WlGnRuUGEsml6HS/712pxurY
 7qkA3p2qr88Hz2lhtWlfItoyNt9che0Okql6eTIzKwTZJq5yKK8nH8xOJB7KsPl6odbqTi
 nFAJshqyFcFUSDitOiS9EQatKLlj9WNJh8di/kRAUU8qMhqHSjkIMTJhhpwIOulhALQeJR
 lcTExyoeCiwwzYgTFGN37BoUKYzJB91Q8sLulTUBQ/gpqkA3g7XAQVa/3QVY9g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=fxwPVR3a
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-12-22
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

Autobuild statistics for 2023-12-22
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  |  3  |  1  |  0  |  4  |
  2023.08.x  |  3  |  0  |  0  |  3  |
    master   | 10  | 25  |  2  | 37  |

Classification of failures by reason for master
-----------------------------------------------

                elfutils-0.189 | 3 
              host-rust-1.71.1 | 3 
                 openssh-9.6p1 | 3 
         gobject-introspection | 2 
                host-go-1.21.5 | 2 
              libopenssl-3.2.0 | 2 
                     exim-4.97 | 1 
                    fcft-3.1.6 | 1 
  gobject-introspection-1.76.1 | 1 
google-breakpad-c85eb4a59b6... | 1 
                 libcurl-8.5.0 | 1 
               libdeflate-1.19 | 1 
               libglib2-2.76.1 | 1 
ltrace-82c66409c7a93ca6ad2e... | 1 
            optee-client-4.0.0 | 1 
        python-contourpy-1.1.0 | 1 
                       unknown | 1 
        util-linux-libs-2.39.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/d5e01ef78e026fa70e3a8e950556360f015667da | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/6d0eb8648f7977641b2f0272e8b08e41f26f559a | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/ab5db898f219a2d55c19bbef7fc7866112fb3380 | ORPH
    m68k     |           exim-4.97            | NOK | http://autobuild.buildroot.net/results/8577ed7c091165f2a3b6c0e03b5fb1869e962034 |     
microblazeel |           fcft-3.1.6           | NOK | http://autobuild.buildroot.net/results/e44578822b29cf306ffd4da779cc1dd99031ca9d |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/2a210186d1b774a0e620386f40e56caa2ab1dd90 |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/cbbc8f1e63094161139504b0cffad45d76ccd0e9 |     
    m68k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/62fc4411b7b10d5ffc0161c0b160ca5f629601aa | ORPH
    i686     | google-breakpad-c85eb4a59b6... | NOK | http://autobuild.buildroot.net/results/5573ab7290d03e2fa924697c586ac3870994e50b |     
   mipsel    |         host-go-1.21.5         | NOK | http://autobuild.buildroot.net/results/aa29d5c77c6f8cd777aefcd91df352f6854e527c |     
    m68k     |         host-go-1.21.5         | NOK | http://autobuild.buildroot.net/results/d32c155bc5a90f3e15050b399adcfba5cfd409e4 |     
powerpc64le  |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/8d03e119392e8990b207af5e639c05c3d23013ba |     
  aarch64    |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/0a108ff76c6bb3384016a33534382ab2bc4e5a7b |     
  aarch64    |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/69bba892e1cd014e239a66a7969dd9614abb4318 |     
    i686     |         libcurl-8.5.0          | NOK | http://autobuild.buildroot.net/results/ef9e45aa88924a3862b47ca1decc1238a089629d |     
    arm      |        libdeflate-1.19         | NOK | http://autobuild.buildroot.net/results/a32a81c375c54976ead497dafc12a2ba05944a79 |     
   arceb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/79d9b383d06e1764537a04a329f3ac3e99848ca5 |     
  riscv32    |        libopenssl-3.2.0        | NOK | http://autobuild.buildroot.net/results/fae2655249b2f0c01e358810eb1d8c3cb52f14d2 | ORPH
   s390x     |        libopenssl-3.2.0        | NOK | http://autobuild.buildroot.net/results/2edccf1545d076831b54f92164964cf6cdbfbac8 | ORPH
    i686     | ltrace-82c66409c7a93ca6ad2e... | NOK | http://autobuild.buildroot.net/results/77f8e8e1eeb45644bd99ed154fc7338b46a5c068 | ORPH
powerpc64le  |         openssh-9.6p1          | NOK | http://autobuild.buildroot.net/results/0e699e4c38cb5246ed70f0e77eda0b69826c092d | ORPH
   mipsel    |         openssh-9.6p1          | NOK | http://autobuild.buildroot.net/results/ecd2bc6d43475bcbd12bd66079e9d6b161f9b9e7 | ORPH
    mips     |         openssh-9.6p1          | NOK | http://autobuild.buildroot.net/results/fa21725aea2d76d00738b1bdfb96ed3b3b847ee3 | ORPH
 microblaze  |       optee-client-4.0.0       | NOK | http://autobuild.buildroot.net/results/8691e6b62f93f64c2b30ebd61876d002c94b834c |     
    mips     |     python-contourpy-1.1.0     | NOK | http://autobuild.buildroot.net/results/6b50f9621b00aab384cc2dde77fae7daff46d08b |     
   sh4aeb    |            unknown             | NOK | http://autobuild.buildroot.net/results/8a470ec4fcea889d1f16af977ba3a39e9ae661a0 |     
   mips64    |     util-linux-libs-2.39.2     | NOK | http://autobuild.buildroot.net/results/d3d271564b75e62b49ce02da06dfa400fd89449a | ORPH


Classification of failures by reason for 2023.02.x
--------------------------------------------------

                    php-8.2.13 | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sh4aeb    |           php-8.2.13           | NOK | http://autobuild.buildroot.net/results/efe11d6e401469758c33bb64790768296109a51a |     


Gitlab CI results for 2023-12-22
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
                          beaglev | https://gitlab.com/buildroot.org/buildroot/-/jobs/5799987287  |      
               broadcom_northstar | https://gitlab.com/buildroot.org/buildroot/-/jobs/5799987344  |      
              freescale_imx8mpevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/5799987418  |      
                       imx8mmpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/5799987483  |      
                        imx8mpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/5799987492  |      
                        imx8mqevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/5799987495  |      
               kontron_pitx_imx8m | https://gitlab.com/buildroot.org/buildroot/-/jobs/5799987511  |      
                       ls1028ardb | https://gitlab.com/buildroot.org/buildroot/-/jobs/5799987542  |      
                     ls1046a-frwy | https://gitlab.com/buildroot.org/buildroot/-/jobs/5799987545  |      
              octavo_osd32mp1_brk | https://gitlab.com/buildroot.org/buildroot/-/jobs/5799987654  |      
              octavo_osd32mp1_red | https://gitlab.com/buildroot.org/buildroot/-/jobs/5799987659  |      
                   orangepi_lite2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5799987699  |      
                orangepi_one_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/5799987705  |      
                qemu_aarch64_ebbr | https://gitlab.com/buildroot.org/buildroot/-/jobs/5799987830  |      
                qemu_aarch64_sbsa | https://gitlab.com/buildroot.org/buildroot/-/jobs/5799987835  |      
                    qemu_arm_ebbr | https://gitlab.com/buildroot.org/buildroot/-/jobs/5799987844  |      
             qemu_arm_vexpress_tz | https://gitlab.com/buildroot.org/buildroot/-/jobs/5799987857  |      
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/5799988095  | ORPH 
                raspberrypizero2w | https://gitlab.com/buildroot.org/buildroot/-/jobs/5799988122  |      
             sipeed_licheepi_nano | https://gitlab.com/buildroot.org/buildroot/-/jobs/5799988208  |      
               snps_arc700_axs101 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5799988296  |      
                 snps_arc700_nsim | https://gitlab.com/buildroot.org/buildroot/-/jobs/5799988310  | ORPH 
                socrates_cyclone5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5799988347  |      
          solidrun_clearfog_gt_8k | https://gitlab.com/buildroot.org/buildroot/-/jobs/5799988354  |      
            solidrun_macchiatobin | https://gitlab.com/buildroot.org/buildroot/-/jobs/5799988359  | ORPH 
                      ti_am62x_sk | https://gitlab.com/buildroot.org/buildroot/-/jobs/5808182268  |      
                      ti_am64x_sk | https://gitlab.com/buildroot.org/buildroot/-/jobs/5808182300  |      
              toradex_apalis_imx6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5808182330  |      



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
