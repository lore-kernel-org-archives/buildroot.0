Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF687C4707B
	for <buildroot@archiver.kernel.org>; Sat, 13 Jan 2024 06:39:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 450DB4EDB2;
	Sat, 13 Jan 2024 06:39:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 450DB4EDB2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N7ANx12AIbzY; Sat, 13 Jan 2024 06:39:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 557E94EDB3;
	Sat, 13 Jan 2024 06:39:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 557E94EDB3
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 487861BF279
 for <buildroot@lists.busybox.net>; Sat, 13 Jan 2024 06:39:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E282D8308A
 for <buildroot@lists.busybox.net>; Sat, 13 Jan 2024 06:39:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E282D8308A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Kqk7BpyHL4Bw for <buildroot@lists.busybox.net>;
 Sat, 13 Jan 2024 06:39:50 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C21D682F8B
 for <buildroot@buildroot.org>; Sat, 13 Jan 2024 06:39:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C21D682F8B
Received: by mail.gandi.net (Postfix) with ESMTPSA id 95BBDC0008
 for <buildroot@buildroot.org>; Sat, 13 Jan 2024 06:39:46 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sat, 13 Jan 2024 06:39:46 -0000
X-GND-Sasl: bot@bootlin.com
Message-Id: <20240113063951.E282D8308A@smtp1.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1705127986; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=YIOi2+kv7opB0u+j1jz0avVO4bP1xPbWoyLbYpeB65w=;
 b=oFiiRTH026GCGNV2h6+ffwQPHzccwDJkoWRtTwCB7pmDBAqJsMRaMBiH8EzZTNqIper4S2
 0QJ9LsgE701YiSxV579JXus/0Kwg6RGsUhHNsJNtkxRUeZWPjPebXkd5LUAbMInkk+iH6+
 jN5ObRQoHIfKD15vrn5TRIc3Yk3XNHdrhNG5eAVJzQy15rxJurLp56azyqgEuRQ1y+kgtJ
 jTKMr7qAlzTum24T86MUKOfGMbDS9yt/LJtKwTf01yTHe/0Ul+YzB7S/+3oOoRYMhZSCuE
 eY5Nae9deeRLFHrPXbRWn44JaMxT0EZrhmqa/KUA8gWFoHOBXRJxNuL4cnpF7w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=oFiiRTH0
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2024-01-12
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

Autobuild statistics for 2024-01-12
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  |  3  |  3  |  0  |  6  |
  2023.11.x  |  2  |  7  |  0  |  9  |
    master   |  8  | 17  |  0  | 25  |

Classification of failures by reason for master
-----------------------------------------------

                elfutils-0.189 | 2 
                libressl-3.8.2 | 2 
                       unknown | 2 
                  acpid-2.0.34 | 1 
  gobject-introspection-1.76.1 | 1 
                host-go-1.21.6 | 1 
                 libnss-3.96.1 | 1 
              libopenssl-3.2.0 | 1 
                  linux-6.6.10 | 1 
                   linux-tools | 1 
                    pppd-2.5.0 | 1 
           python-numpy-1.25.0 | 1 
                  stunnel-5.71 | 1 
                 sudo-1.9.15p5 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |          acpid-2.0.34          | NOK | http://autobuild.buildroot.net/results/445150c8532e500a2a3659f805bcc10e9511b1c0 | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/474c40c24a7fc9457f5371250a8edc255f492cf6 | ORPH
   nios2     |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/d8a0d4346fe182a9f3e0f1dd4b395bc94eaba927 | ORPH
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/97a1d2422ca3029508f5c3756cce98f0e0c31998 | ORPH
  mips64el   |         host-go-1.21.6         | NOK | http://autobuild.buildroot.net/results/947038b58c55ba48902d1e39a5e882d694c7e9a1 |     
    or1k     |         libnss-3.96.1          | NOK | http://autobuild.buildroot.net/results/9a51138bb8a65f7f76a01d0e73c451273e6eb49e |     
   s390x     |        libopenssl-3.2.0        | NOK | http://autobuild.buildroot.net/results/d8353b8e621a140b96e44a1d679b2ce8d46c4032 | ORPH
   mips64    |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/734247c6baebffbf3218d891be486483c2a1fe0a | ORPH
    arm      |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/b5ce60a9ebdc5e3ceaec34fe2164944a9da16f45 | ORPH
microblazeel |          linux-6.6.10          | NOK | http://autobuild.buildroot.net/results/cf61db629e073725f087ce657a8038a3a027a675 | ORPH
    arm      |          linux-tools           | NOK | http://autobuild.buildroot.net/results/52c885dd4edb4e5f39000596b88d7cbbd7735beb | ORPH
  sparc64    |           pppd-2.5.0           | NOK | http://autobuild.buildroot.net/results/35d90e2ea59d39032ac163f098371d27b3dc9aa2 |     
 powerpc64   |      python-numpy-1.25.0       | NOK | http://autobuild.buildroot.net/results/6f3532598355732b289730fc751e9aebdab4b0e4 |     
  mips64el   |          stunnel-5.71          | NOK | http://autobuild.buildroot.net/results/d17c5f4b2fec3c3cdb28cdb9cecb5caae74be3fa |     
   armeb     |         sudo-1.9.15p5          | NOK | http://autobuild.buildroot.net/results/a89913f502e8806c7c69fabed626fd71cd8cc276 | ORPH
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/5e3806edc27174de5ae19541d652291824976d87 |     
powerpc64le  |            unknown             | NOK | http://autobuild.buildroot.net/results/486548bb3197a716b7e952caa3a327c8e5e491f4 |     


Classification of failures by reason for 2023.02.x
--------------------------------------------------

  gobject-introspection-1.72.0 | 1 
         host-gcc-final-11.4.0 | 1 
                       unknown | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/e98ca0ebf12c7c9f9af26c4113333f8d907d3f80 | ORPH
 microblaze  |     host-gcc-final-11.4.0      | NOK | http://autobuild.buildroot.net/results/2b29d9436470e6339b5a97b434d04c56a9986ebf |     
   sparc     |            unknown             | NOK | http://autobuild.buildroot.net/results/151d375238e95627cc232179024b5c87cd5346dd |     


Classification of failures by reason for 2023.11.x
--------------------------------------------------

                host-go-1.21.5 | 2 
              host-rust-1.71.1 | 1 
               libglib2-2.76.1 | 1 
                libressl-3.8.2 | 1 
     linux-5.10.162-cip24-rt10 | 1 
                xenomai-3.0.10 | 1 


Detail of failures for 2023.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mips64    |         host-go-1.21.5         | NOK | http://autobuild.buildroot.net/results/ede2cec28b68bcb843779bc0cda1725d43caef6d |     
    or1k     |         host-go-1.21.5         | NOK | http://autobuild.buildroot.net/results/3929f7cc25a6eb0e35b9df1a7c7b017e0b3b3dca |     
powerpc64le  |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/9e418ddf5331c29e266ed6b76995b2721963f00a |     
   arceb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/343c8afc87a32533774933fb3e6b41fba3c5b022 |     
    mips     |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/0fef07aae64a8303ee51e465b73856a4a50a6bf6 | ORPH
  powerpc    |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/d129459bda4c63cee7d8b61e6a4eba5e7e64cc5a | ORPH
  sparc64    |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/2fccf959e0a5b63a38b4ed6966562efd04f2a080 |     


Gitlab CI results for 2024-01-12
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
                          beaglev | https://gitlab.com/buildroot.org/buildroot/-/jobs/5907090837  |      
              freescale_imx8mpevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/5907090891  |      
                       imx8mmpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/5907091033  |      
                        imx8mqevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/5907091045  |      
                    imxrt1050-evk | https://gitlab.com/buildroot.org/buildroot/-/jobs/5907091054  |      
               kontron_pitx_imx8m | https://gitlab.com/buildroot.org/buildroot/-/jobs/5907091063  |      
              octavo_osd32mp1_brk | https://gitlab.com/buildroot.org/buildroot/-/jobs/5907091157  |      
              octavo_osd32mp1_red | https://gitlab.com/buildroot.org/buildroot/-/jobs/5907091160  |      
                   orangepi_lite2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5907091224  |      
                orangepi_one_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/5907091234  |      
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/5907091476  | ORPH 
                raspberrypizero2w | https://gitlab.com/buildroot.org/buildroot/-/jobs/5907091500  |      
             sipeed_licheepi_nano | https://gitlab.com/buildroot.org/buildroot/-/jobs/5916616204  |      
               snps_arc700_axs101 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5916616642  |      
                 snps_arc700_nsim | https://gitlab.com/buildroot.org/buildroot/-/jobs/5916616799  | ORPH 
                snps_archs38_hsdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/5916616880  |      
                socrates_cyclone5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5916616918  |      
                      ti_am62x_sk | https://gitlab.com/buildroot.org/buildroot/-/jobs/5916617553  |      
                      ti_am64x_sk | https://gitlab.com/buildroot.org/buildroot/-/jobs/5916617570  |      
              toradex_apalis_imx6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5916617592  |      



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
