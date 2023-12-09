Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAC71C4167B
	for <buildroot@archiver.kernel.org>; Sat,  9 Dec 2023 06:37:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2FD49405B1;
	Sat,  9 Dec 2023 06:37:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2FD49405B1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oyJrP6mQiHt3; Sat,  9 Dec 2023 06:37:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C663840629;
	Sat,  9 Dec 2023 06:37:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C663840629
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4115C1BF681
 for <buildroot@lists.busybox.net>; Sat,  9 Dec 2023 06:37:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D23226FA7A
 for <buildroot@lists.busybox.net>; Sat,  9 Dec 2023 06:37:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D23226FA7A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EIIRiygvxJCH for <buildroot@lists.busybox.net>;
 Sat,  9 Dec 2023 06:37:50 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 960CE60F4D
 for <buildroot@buildroot.org>; Sat,  9 Dec 2023 06:37:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 960CE60F4D
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9F03EC0004
 for <buildroot@buildroot.org>; Sat,  9 Dec 2023 06:37:46 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sat, 09 Dec 2023 06:37:46 -0000
X-GND-Sasl: bot@bootlin.com
Message-Id: <20231209063751.D23226FA7A@smtp3.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1702103866; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Zx6BA72/eFPLokgA/B1/4Xe5TXm/LvcqpZJlPykvh/4=;
 b=aGoceq9iRG+4kAX22ocEUYKIWbkmU7G6avuAblCMtqlLpi9oc9WOIJcYPjD7FIyFktwCEn
 H1NUiFMnmOn7wQKZy1A0VsQHT4W85L1DnIzIGRjkGbjS3G9p2ML2iCsce8zZnQNLc9jjGs
 WgCSkiQUnvm9hAmE0khKuaTNPY1Bc2GMRbmO3UMvnbFiOSrY4zRQT09TfJZrjyEWa21wem
 E60uqjOVSNh6MBvji/xi1mUsfGAfi8UtautMdcQ0P099QqlqYX4D+ZttBHsCdLzRD+HojI
 YYAc6LXVIWhqCJKAaQelvdaJnY6W68x3oS6g4s6GIqKeK2+t+YnWOPfjVgP3XQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=aGoceq9i
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-12-08
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

Autobuild statistics for 2023-12-08
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  |  4  |  2  |  0  |  6  |
  2023.08.x  |  2  |  5  |  0  |  7  |
    master   | 50  | 28  |  0  | 78  |

Classification of failures by reason for master
-----------------------------------------------

  gobject-introspection-1.76.1 | 3 
                libressl-3.8.2 | 3 
          cryptodev-linux-1.13 | 2 
                host-go-1.21.5 | 2 
          libcamera-apps-1.3.0 | 2 
                    pppd-2.5.0 | 2 
check-11970a7e112dfe243a2e6... | 1 
                     criu-3.18 | 1 
                   expat-2.5.0 | 1 
                  ffmpeg-4.4.4 | 1 
                    flac-1.4.3 | 1 
glibc-2.38-27-g750a45a78390... | 1 
   host-flutter-sdk-bin-3.13.9 | 1 
              host-rust-1.71.1 | 1 
              libarchive-3.7.2 | 1 
             nodejs-src-20.9.0 | 1 
                     pv-1.6.20 | 1 
   python-pydantic-core-2.14.5 | 1 
                python3-3.11.6 | 1 
        redis-plus-plus-1.3.10 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   xtensa    | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/e6f840cb98883382da16f9335457a0cdc7bc5e49 | ORPH
 aarch64_be  |           criu-3.18            | NOK | http://autobuild.buildroot.net/results/1f97bab0a991e91113f3aa9968cc50c3823d60f8 |     
   arceb     |      cryptodev-linux-1.13      | NOK | http://autobuild.buildroot.net/results/5baf8b5d6d519c3e2c515c431fa088919d26103c | ORPH
   armeb     |      cryptodev-linux-1.13      | NOK | http://autobuild.buildroot.net/results/d9128085177a33bab172c609723782b5a56ac60a | ORPH
  mips64el   |          expat-2.5.0           | NOK | http://autobuild.buildroot.net/results/d4a7a9a9d3dbf6d5babdf765dcaaf637f17519e7 |     
   arceb     |          ffmpeg-4.4.4          | NOK | http://autobuild.buildroot.net/results/d0c350ecc26a847a64b0cc7d97327a87638fc3a6 |     
    sh4a     |           flac-1.4.3           | NOK | http://autobuild.buildroot.net/results/e598447fd48a2a67565e7b7a594b3544a5b2b7fa |     
 powerpc64   | glibc-2.38-27-g750a45a78390... | NOK | http://autobuild.buildroot.net/results/517247b762ba46564a504325ea3b3d013f3ae64e |     
   x86_64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/65fe9691a10c04f9ffcb618e8c50b42a43fabb6c | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/6dc4383ba89faff9c27b35052ace44c685def36b | ORPH
   nios2     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/9add43e7259d7bbed5230f72e0c8e6565889761c | ORPH
  aarch64    |  host-flutter-sdk-bin-3.13.9   | NOK | http://autobuild.buildroot.net/results/e1ad92e5bca443f30e0fb361b3ea03d3ae09a21b |     
  mips64el   |         host-go-1.21.5         | NOK | http://autobuild.buildroot.net/results/3f4e6db2c32bf95d10cddb4505c792f143a49fd5 |     
  mips64el   |         host-go-1.21.5         | NOK | http://autobuild.buildroot.net/results/65d196fa2e7b3b247eb0487faef5a57ec07b771c |     
    arm      |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/29830c04a6a5e871038969a666ea908b9aec1112 |     
    i686     |        libarchive-3.7.2        | NOK | http://autobuild.buildroot.net/results/0bee5534c2bacf628b4b41a601ad1901a2f67c2b |     
   sparc     |      libcamera-apps-1.3.0      | NOK | http://autobuild.buildroot.net/results/1ab37e3878f160f923d02db38eb235138d04ac3c |     
  powerpc    |      libcamera-apps-1.3.0      | NOK | http://autobuild.buildroot.net/results/561f726765b9144ea26f647ae23948d96e01821e |     
   mips64    |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/ab15ba028834b54626b4d39fbd806cb570e39602 | ORPH
    m68k     |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/b3338d078851d29bc9813497df753d1985187090 | ORPH
microblazeel |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/3b10263e4ae48d7de1c5e36bf519c579c06c8d91 | ORPH
  aarch64    |       nodejs-src-20.9.0        | NOK | http://autobuild.buildroot.net/results/a46628e2439af88cd875f5ac56f3425beb1fb8e0 |     
  sparc64    |           pppd-2.5.0           | NOK | http://autobuild.buildroot.net/results/a75ba08631d6235599abc3aa3bf69a21ddec0ab2 |     
  sparc64    |           pppd-2.5.0           | NOK | http://autobuild.buildroot.net/results/d0eb700b806497cc47b657a9f85df1564837b5e5 |     
   armeb     |           pv-1.6.20            | NOK | http://autobuild.buildroot.net/results/0cf8a8c227d00e25311671389434f33eb7321a6e | ORPH
    mips     |  python-pydantic-core-2.14.5   | NOK | http://autobuild.buildroot.net/results/40b848d7d6decf7fe244b14825b8130c6a7a6ba2 |     
   x86_64    |         python3-3.11.6         | NOK | http://autobuild.buildroot.net/results/addf297f15fbf09fa475d63d6eba82081f70c935 |     
  riscv64    |     redis-plus-plus-1.3.10     | NOK | http://autobuild.buildroot.net/results/d1186383559e8173c6921ca71e70f1597c074fd6 |     


Classification of failures by reason for 2023.02.x
--------------------------------------------------

               gupnp-av-0.14.0 | 1 
                       unknown | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 aarch64_be  |        gupnp-av-0.14.0         | NOK | http://autobuild.buildroot.net/results/a11cf7c7135d5baf4934d1dafd04e647345f0978 |     
    i686     |            unknown             | NOK | http://autobuild.buildroot.net/results/9820a56971e9e4d678f825b214c206e4d96e2fcb |     


Classification of failures by reason for 2023.08.x
--------------------------------------------------

              host-rust-1.71.1 | 2 
glibc-2.37-45-gb4e23c75aea7... | 1 
                   luvi-2.14.0 | 1 
       python-stack-data-0.6.2 | 1 


Detail of failures for 2023.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   arceb     | glibc-2.37-45-gb4e23c75aea7... | NOK | http://autobuild.buildroot.net/results/3dd46facb21ea60691b763143eb80bcab3e8fb14 |     
  aarch64    |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/ad3a5456c2e8e50069700aeba85a97227653c0f2 |     
 powerpc64   |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/4b24703dfe4e0da4c0f896215cb92b69d9c0bbc4 |     
 aarch64_be  |          luvi-2.14.0           | NOK | http://autobuild.buildroot.net/results/69e93858b03a1407d3b6da6dcfc211f7928ca7c7 | ORPH
   s390x     |    python-stack-data-0.6.2     | NOK | http://autobuild.buildroot.net/results/86364bbc894d63a86b3111e9439a131123214e11 |     


Gitlab CI results for 2023-12-08
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
                          beaglev | https://gitlab.com/buildroot.org/buildroot/-/jobs/5699557808  |      
               broadcom_northstar | https://gitlab.com/buildroot.org/buildroot/-/jobs/5699557812  |      
              freescale_imx8mpevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/5699557839  |      
                       imx8mmpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/5699557867  |      
                        imx8mpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/5699557870  |      
                        imx8mqevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/5699557871  |      
               kontron_pitx_imx8m | https://gitlab.com/buildroot.org/buildroot/-/jobs/5699557875  |      
              octavo_osd32mp1_brk | https://gitlab.com/buildroot.org/buildroot/-/jobs/5699557919  |      
              octavo_osd32mp1_red | https://gitlab.com/buildroot.org/buildroot/-/jobs/5699557921  |      
                   orangepi_lite2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5699557938  |      
                orangepi_one_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/5699557941  |      
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/5699558013  | ORPH 
                raspberrypizero2w | https://gitlab.com/buildroot.org/buildroot/-/jobs/5699558027  |      
             sipeed_licheepi_nano | https://gitlab.com/buildroot.org/buildroot/-/jobs/5710063096  |      
               snps_arc700_axs101 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5710063391  |      
                 snps_arc700_nsim | https://gitlab.com/buildroot.org/buildroot/-/jobs/5710063397  | ORPH 
                socrates_cyclone5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5710063528  |      
              toradex_apalis_imx6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5710064123  |      



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
