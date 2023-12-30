Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89223C46CD2
	for <buildroot@archiver.kernel.org>; Sat, 30 Dec 2023 06:40:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C2A18400BA;
	Sat, 30 Dec 2023 06:40:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C2A18400BA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bVMLcs7pqVhS; Sat, 30 Dec 2023 06:40:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4B26840103;
	Sat, 30 Dec 2023 06:40:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4B26840103
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 210281BF20F
 for <buildroot@lists.busybox.net>; Sat, 30 Dec 2023 06:40:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A0D4440103
 for <buildroot@lists.busybox.net>; Sat, 30 Dec 2023 06:40:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A0D4440103
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KEB8F0SMOObc for <buildroot@lists.busybox.net>;
 Sat, 30 Dec 2023 06:40:47 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 243C3400BA
 for <buildroot@buildroot.org>; Sat, 30 Dec 2023 06:40:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 243C3400BA
Received: by mail.gandi.net (Postfix) with ESMTPSA id 36E2A6000A
 for <buildroot@buildroot.org>; Sat, 30 Dec 2023 06:40:44 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sat, 30 Dec 2023 06:40:44 -0000
X-GND-Sasl: bot@bootlin.com
Message-Id: <20231230064049.A0D4440103@smtp2.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1703918444; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=HO3t0BdVhovTu+4ZHXI4CHGCfPCsT9vcbxfvbI5blKw=;
 b=PpCWwkc0HV452GGfM82OFq6tu4xJU9rDVa06qUv6WgMrZpdfIHXINV12GuthgdpNozHVRE
 212pxUQ3oAHQRrX28yrPmD0FF/+usk/OL2sf2vYRti81do2A59bOGpkXOYtlybgc8wqFNv
 uMXrn+rh4EzxlZGtfneivESL1iA7+aEw1WI5AjA9HYKhTTYbZh9aN9DazF9o0ahGOwsewb
 7HGkpu/LtpOSo8BWKb6GdgbMF2RfHhAFKhEHoZEP3Bb9gC2mNj18nzrLvSIPgiJlC2dDhx
 tUeyL778P6MG4HeHKSG5L1DI/W7lGu0J0b0eqRgoof4Fx9owGojwDPWHgkWC3w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=PpCWwkc0
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-12-29
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

Autobuild statistics for 2023-12-29
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  |  4  |  5  |  0  |  9  |
  2023.08.x  |  2  |  1  |  0  |  3  |
    master   | 11  | 21  |  0  | 32  |

Classification of failures by reason for master
-----------------------------------------------

              host-rust-1.71.1 | 4 
              libopenssl-3.2.0 | 2 
                libressl-3.8.2 | 2 
                   perl-5.38.2 | 2 
                elfutils-0.189 | 1 
         flutter-engine-3.13.9 | 1 
                    fmt-10.1.1 | 1 
  gobject-introspection-1.76.1 | 1 
                   gupnp-1.4.3 | 1 
        host-sentry-cli-2.20.3 | 1 
                   linux-6.6.8 | 1 
               nfs-utils-2.6.3 | 1 
    python-cryptography-39.0.2 | 1 
                       unknown | 1 
                  xvisor-0.3.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/d7a7ddd9849ac866cbf98df6d852fb0dbcbd4c5d | ORPH
  aarch64    |     flutter-engine-3.13.9      | NOK | http://autobuild.buildroot.net/results/cbc16b29cca3bc83da45824bfeeabc02e69ffc73 |     
  mips64el   |           fmt-10.1.1           | NOK | http://autobuild.buildroot.net/results/16f562a60ae5afe0f7fc4bce89b3ebfd9c7c899f |     
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/4c28eefe229bb85ab3f63a6318a1285523596d65 | ORPH
    mips     |          gupnp-1.4.3           | NOK | http://autobuild.buildroot.net/results/30c869d3438c8e4e6ab1ea64ba170aa11aacd58b |     
  aarch64    |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/a832082b4b481a0454c3dab868d2518eb96432b8 |     
    i686     |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/ea7decf7bb0e6f8f0b306508bf7911403c245f6a |     
  aarch64    |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/49121694146e2b13b928cf4373bc2fa73d429f6d |     
   x86_64    |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/ec2a7d3f8568766c6c34c099ad00d81d9e0c228f |     
    m68k     |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/2c93fffa758294e9268a9256454a1cb20e234560 |     
   s390x     |        libopenssl-3.2.0        | NOK | http://autobuild.buildroot.net/results/8be434d3b8f5f2e3f2177f04740cfe77ec74e25a | ORPH
   s390x     |        libopenssl-3.2.0        | NOK | http://autobuild.buildroot.net/results/9acfd9af85224576f027c3ed433866e6feee92a7 | ORPH
   armeb     |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/79fd79c448ab1eb5fff89ff26a0e7491dbb7b777 | ORPH
    mips     |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/aede7bdb790a52a1b3b9c7bca61bc6b70ad2418f | ORPH
   xtensa    |          linux-6.6.8           | NOK | http://autobuild.buildroot.net/results/08aa139d7216ffdb0951cbcc62e9de2f53effa5d | ORPH
   mipsel    |        nfs-utils-2.6.3         | NOK | http://autobuild.buildroot.net/results/a3c804151e0a3072f85c435fbf54f8a34e385315 |     
   x86_64    |          perl-5.38.2           | NOK | http://autobuild.buildroot.net/results/78d70e324f5c94b1779159f1ca12787195de6d23 |     
    arc      |          perl-5.38.2           | NOK | http://autobuild.buildroot.net/results/c61b60430d36c5c63bd3cf0257f2193a40fb0b60 |     
  aarch64    |   python-cryptography-39.0.2   | NOK | http://autobuild.buildroot.net/results/4975f0db23fb21975f65db6f38a978c8db29f3aa |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/7b1fcc7f464fb71b3ccb0943f482ebbab13a9c55 |     
  aarch64    |          xvisor-0.3.2          | NOK | http://autobuild.buildroot.net/results/55310fbc2d90babe296023da9ffcb90b9f5a6c8d |     


Classification of failures by reason for 2023.02.x
--------------------------------------------------

            host-binutils-2.38 | 1 
              host-rust-1.67.1 | 1 
libuci-4b3db1179747b6a67790... | 1 
          linux-5.10.162-cip24 | 1 
                 raptor-2.0.15 | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/e5f07823ea6dc907660930b8a3846da42e0a5ab3 |     
  sparc64    |        host-rust-1.67.1        | NOK | http://autobuild.buildroot.net/results/6679503ab18cb5c73a9a2fb1895f0c6c4562ebd7 |     
   mips64    | libuci-4b3db1179747b6a67790... | NOK | http://autobuild.buildroot.net/results/8e11ffde14b99484ec4f66af83e825fa75d0ffbc |     
    m68k     |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/eb51642b1ff1332a725d73daca72f80768b24352 | ORPH
   mips64    |         raptor-2.0.15          | NOK | http://autobuild.buildroot.net/results/cd8c98ab968b4920ae2ae0f9162517249488d77c | ORPH


Classification of failures by reason for 2023.08.x
--------------------------------------------------

  gobject-introspection-1.76.1 | 1 


Detail of failures for 2023.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/134e8a5c8229c546ab7a28084ac9d3abd78bf8db | ORPH


Gitlab CI results for 2023-12-29
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
                          beaglev | https://gitlab.com/buildroot.org/buildroot/-/jobs/5829325319  |      
               broadcom_northstar | https://gitlab.com/buildroot.org/buildroot/-/jobs/5829325323  |      
              freescale_imx8mpevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/5829325351  |      
                       imx8mmpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/5829325382  |      
                        imx8mpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/5829325387  |      
                        imx8mqevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/5829325388  |      
               kontron_pitx_imx8m | https://gitlab.com/buildroot.org/buildroot/-/jobs/5829325395  |      
                       ls1028ardb | https://gitlab.com/buildroot.org/buildroot/-/jobs/5829325404  |      
                     ls1046a-frwy | https://gitlab.com/buildroot.org/buildroot/-/jobs/5829325405  |      
              octavo_osd32mp1_brk | https://gitlab.com/buildroot.org/buildroot/-/jobs/5829325448  |      
              octavo_osd32mp1_red | https://gitlab.com/buildroot.org/buildroot/-/jobs/5829325450  |      
                   orangepi_lite2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5829325467  |      
                orangepi_one_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/5829325470  |      
                qemu_aarch64_ebbr | https://gitlab.com/buildroot.org/buildroot/-/jobs/5829325496  |      
                qemu_aarch64_sbsa | https://gitlab.com/buildroot.org/buildroot/-/jobs/5829325499  |      
                    qemu_arm_ebbr | https://gitlab.com/buildroot.org/buildroot/-/jobs/5829325507  |      
             qemu_arm_vexpress_tz | https://gitlab.com/buildroot.org/buildroot/-/jobs/5829325518  |      
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/5829325565  | ORPH 
                raspberrypizero2w | https://gitlab.com/buildroot.org/buildroot/-/jobs/5829325572  |      
             sipeed_licheepi_nano | https://gitlab.com/buildroot.org/buildroot/-/jobs/5829325595  |      
               snps_arc700_axs101 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5834757989  |      
                 snps_arc700_nsim | https://gitlab.com/buildroot.org/buildroot/-/jobs/5834758012  | ORPH 
                socrates_cyclone5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5834758226  |      
          solidrun_clearfog_gt_8k | https://gitlab.com/buildroot.org/buildroot/-/jobs/5834758379  |      
            solidrun_macchiatobin | https://gitlab.com/buildroot.org/buildroot/-/jobs/5834758777  | ORPH 
                      ti_am62x_sk | https://gitlab.com/buildroot.org/buildroot/-/jobs/5834759284  |      
                      ti_am64x_sk | https://gitlab.com/buildroot.org/buildroot/-/jobs/5834759411  |      
              toradex_apalis_imx6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5834760048  |      



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
