Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B20E0C47258
	for <buildroot@archiver.kernel.org>; Sat, 20 Jan 2024 07:01:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DFDDA400A6;
	Sat, 20 Jan 2024 07:01:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DFDDA400A6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Pvs6tUMGUe-h; Sat, 20 Jan 2024 07:01:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 727EE403C9;
	Sat, 20 Jan 2024 07:01:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 727EE403C9
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1A4591BF3F9
 for <buildroot@lists.busybox.net>; Sat, 20 Jan 2024 07:01:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E9D35403C9
 for <buildroot@lists.busybox.net>; Sat, 20 Jan 2024 07:01:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E9D35403C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XwHB_qsDL7gI for <buildroot@lists.busybox.net>;
 Sat, 20 Jan 2024 07:01:48 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EC4FA400A6
 for <buildroot@buildroot.org>; Sat, 20 Jan 2024 07:01:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EC4FA400A6
Received: by mail.gandi.net (Postfix) with ESMTPSA id 401C420009
 for <buildroot@buildroot.org>; Sat, 20 Jan 2024 07:01:45 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sat, 20 Jan 2024 07:01:45 -0000
X-GND-Sasl: bot@bootlin.com
Message-Id: <20240120070150.E9D35403C9@smtp2.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1705734105; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=OpgJmozrMF9x+gO99rkc6aqLBSAJs11tg1PdC3m/WTM=;
 b=Opb/c2s8ruTo3AdL1SkXSbNeGfdPVAqp/n30dJpWT46B1GUds6JKArJhqTEUjnFhPcEBBA
 L/Y8bBOiowLh4m20C5WPIIHJghmT6dXzB1JmWY1VdE5kqaEp2kH7I60mvB7sntyLjU4p1c
 ExXmZNau0tQTWKmEtN6EwglEYRSAlch/CD1lNSrzQFQVjFk7PienLRortVqBp99HcongvY
 hu05nW7vxLmBPcZE8WGm2LddPvnbhNWLDUrjtVEqKcJxqlBbkFJ/RBnRI3kLySrnRw7Qs4
 mtvfgjm2MPDFYmqVMVV7IMYExB8QZLZPADE5ZOYuA+qrOeEjLa0Nkm+Ycqo9AQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Opb/c2s8
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2024-01-19
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

Autobuild statistics for 2024-01-19
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  |  3  |  4  |  0  |  7  |
  2023.11.x  |  3  |  3  |  0  |  6  |
    master   | 45  | 49  |  1  | 95  |

Classification of failures by reason for master
-----------------------------------------------

                libressl-3.8.2 | 5 
                       unknown | 4 
                elfutils-0.189 | 3 
  gobject-introspection-1.76.1 | 3 
              libopenssl-3.2.0 | 3 
                  stunnel-5.71 | 3 
                    attr-2.5.2 | 2 
check-11970a7e112dfe243a2e6... | 2 
glibc-2.38-27-g750a45a78390... | 2 
 Makefile:727: target-finalize | 2 
                 sudo-1.9.15p5 | 2 
android-tools-4.2.2+git2013... | 1 
cegui-00b4e1fe174da53b7ed72... | 1 
                     crun-1.12 | 1 
fs/jffs2/jffs2.mk:71: /home... | 1 
         gobject-introspection | 1 
                 highway-1.0.7 | 1 
              host-rust-1.74.1 | 1 
               ipmitool-1_8_19 | 1 
              libarchive-3.7.2 | 1 
                libselinux-3.5 | 1 
               libunwind-1.6.2 | 1 
     linux-5.10.162-cip24-rt10 | 1 
                  linux-6.6.11 | 1 
            micropython-1.22.0 | 1 
                    ngrep-1.47 | 1 
                petitboot-1.14 | 1 
                    pppd-2.5.0 | 1 
            quickjs-2023-12-09 | 1 
                rocksdb-6.20.3 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 powerpc64   | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/65d327a2408e29cc9e48ca895cd4ce2794ef0cf8 |     
 microblaze  |           attr-2.5.2           | NOK | http://autobuild.buildroot.net/results/80f82e4cd1916074ca1d51378d8ce08b49fc0d59 |     
microblazeel |           attr-2.5.2           | NOK | http://autobuild.buildroot.net/results/166ac9966de694e3f844849843431f38636eda7a |     
    mips     | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/5dcbc7d2254f7c776730558e2925368d96df138f |     
  riscv64    | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/b469ae7a7eb3654ddd3cb33a1dae42da8376f4a8 | ORPH
microblazeel | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/b50a49f926efd65ed8cfe1c5a63a8a49efd0dda9 | ORPH
    arm      |           crun-1.12            | NOK | http://autobuild.buildroot.net/results/80c8fa823a086603724eb2f5fc63e0b07229055e |     
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/ad806751c7fdb9ba3efaa1ef93c0161074aa7513 | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/df07a1eb23e0a9632876a69a68030c8739dc50a4 | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/878f03f1673dcdbfce0c68648731d3333cd8dc65 | ORPH
   s390x     | fs/jffs2/jffs2.mk:71: /home... | NOK | http://autobuild.buildroot.net/results/bd8b4c1c4d02ea2d9db405ac8c051aa532b6c39f |     
    arc      | glibc-2.38-27-g750a45a78390... | NOK | http://autobuild.buildroot.net/results/2981ac6f95d713be65ef96bf32697f87cf226c39 |     
 powerpc64   | glibc-2.38-27-g750a45a78390... | NOK | http://autobuild.buildroot.net/results/45474dfa12cb0ed355441a7c3786edb6104a3af0 |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/642438ad75988f9e739301201cf571c2ec80e6a1 |     
    sh4a     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/4dd5c374bf14d0a30cb64b10e3e9db9b8f3316bf | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/05a163a0641bb624dcd224dc01740aa156acf4ce | ORPH
   x86_64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/cc41b1a7b4e18b5d04cdf6d6852bd68ce4b85e79 | ORPH
  riscv64    |         highway-1.0.7          | NOK | http://autobuild.buildroot.net/results/4631b7e9e49f130f17b79dac8f90b87f15f05a6e |     
   x86_64    |        host-rust-1.74.1        | NOK | http://autobuild.buildroot.net/results/b015401b16b34c9b9d4dc12575d5099509db6027 |     
 powerpc64   |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.net/results/9205b26b50f2343017c29643c1969c9ff982556f |     
   mipsel    |        libarchive-3.7.2        | NOK | http://autobuild.buildroot.net/results/daa831c86d116086a7c7c1bd5498a81d6970f886 |     
   s390x     |        libopenssl-3.2.0        | NOK | http://autobuild.buildroot.net/results/6c1bd7905a1cb0b92e759557e6c1d52d7fb4ea14 | ORPH
   s390x     |        libopenssl-3.2.0        | NOK | http://autobuild.buildroot.net/results/d87fec8bfc7eecddbdd9d01646df8d42f2e45b06 | ORPH
   s390x     |        libopenssl-3.2.0        | NOK | http://autobuild.buildroot.net/results/97020c15becfbfa1d0c5baaf7674f653f26c2967 | ORPH
   arceb     |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/b440ed19e414e2f00ed1a3a18bf73e9aa755c1db | ORPH
    sh4a     |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/381d93d0f1d31e013b824385783b683283c5b916 | ORPH
  powerpc    |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/ae4802d2c60c33ba74ffe4aaf1047aaa6324ddde | ORPH
   sh4eb     |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/35ab29be2933f13d1a21fd028a8317a5420d7f7b | ORPH
   sh4aeb    |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/511fce2ee59f13bde2db2e5780b5dbfb6a1373d6 | ORPH
  powerpc    |         libselinux-3.5         | NOK | http://autobuild.buildroot.net/results/4edf77e2d795487c076c92294058cd496590c639 |     
    or1k     |        libunwind-1.6.2         | NOK | http://autobuild.buildroot.net/results/6b4b6ea0fcc439568d970ac17a3521e945e4f9c3 | ORPH
    or1k     |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/f2faf7731f47d34a0ed5dd7f397796162dc821cf | ORPH
  riscv32    |          linux-6.6.11          | NOK | http://autobuild.buildroot.net/results/5da0d4aec837bdbbbb2b58b31da472bd308e2fc2 | ORPH
 aarch64_be  | Makefile:727: target-finalize  | NOK | http://autobuild.buildroot.net/results/b82e2d77bd3238536b04212f0a5ef20d509b8546 |     
   armeb     | Makefile:727: target-finalize  | NOK | http://autobuild.buildroot.net/results/0a9e3d978d1dcb63cb962e02bbfb6971c33ec9d8 |     
    arm      |       micropython-1.22.0       | NOK | http://autobuild.buildroot.net/results/f9a36c65f0069d70069773f0c9d8adff7670b8a3 |     
  powerpc    |           ngrep-1.47           | NOK | http://autobuild.buildroot.net/results/506a2c3ef7458a3ad81f0b5dba290397b078b09d |     
  mips64el   |         petitboot-1.14         | NOK | http://autobuild.buildroot.net/results/6d440d96e811674041b5a1fdae96d4c377824c2a |     
  sparc64    |           pppd-2.5.0           | NOK | http://autobuild.buildroot.net/results/81bb9be5bf42fe67a9acf31a4742cfbac6959221 |     
    mips     |       quickjs-2023-12-09       | NOK | http://autobuild.buildroot.net/results/6a8a6e6df9516fdc0a8e1cff3880b41fbd85d97d |     
 powerpc64   |         rocksdb-6.20.3         | NOK | http://autobuild.buildroot.net/results/dd6eb1857b567bf4cdfa81c10ce4e2bdf9d62f3c |     
   x86_64    |          stunnel-5.71          | NOK | http://autobuild.buildroot.net/results/be68dc3cc309d4754ae3b447e5775331eb7499d8 |     
   armeb     |          stunnel-5.71          | NOK | http://autobuild.buildroot.net/results/105edd8c6c17ab1f9b9c53bbc9caed72ef1ff18d |     
   arceb     |          stunnel-5.71          | NOK | http://autobuild.buildroot.net/results/08dbe2a1e5eaa8ac4d8e8b8247d68d4d0e172d60 |     
   armeb     |         sudo-1.9.15p5          | NOK | http://autobuild.buildroot.net/results/1fd3eb6d5cd3babbe919b2e949b3a94969e76a3c | ORPH
    m68k     |         sudo-1.9.15p5          | NOK | http://autobuild.buildroot.net/results/510a009107f1af34732351f91e7949ba8bccf7ac | ORPH
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/20cd4c7de515c71b238f789edd450279c2d7593e |     
   s390x     |            unknown             | NOK | http://autobuild.buildroot.net/results/2d1b3b871b72a25a45904a077e7b620a4b15ae5f |     
 microblaze  |            unknown             | NOK | http://autobuild.buildroot.net/results/c5761d554577f616681020e2f770146d925ef1c3 |     
    mips     |            unknown             | NOK | http://autobuild.buildroot.net/results/607109c2aeb79fd9ce9bedc0150bad98c3d02963 |     


Classification of failures by reason for 2023.02.x
--------------------------------------------------

              host-rust-1.67.1 | 1 
                       kmod-30 | 1 
               libglib2-2.72.3 | 1 
            micropython-1.22.0 | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |        host-rust-1.67.1        | NOK | http://autobuild.buildroot.net/results/ba64cafdbf9e312b244e9deda671cf885e29a282 |     
   xtensa    |            kmod-30             | NOK | http://autobuild.buildroot.net/results/04114124000162489f5a8a766816ce7fbaefebea |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/533e4f8b6cd8024d2755cbf80df0562edec48db2 |     
    sh4      |       micropython-1.22.0       | NOK | http://autobuild.buildroot.net/results/47368ac76303ab47ddb064895e4dbd0a39a209ba |     


Classification of failures by reason for 2023.11.x
--------------------------------------------------

               alsa-lib-1.2.10 | 1 
     host-moby-buildkit-0.11.6 | 1 
              host-rust-1.71.1 | 1 


Detail of failures for 2023.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |        alsa-lib-1.2.10         | NOK | http://autobuild.buildroot.net/results/7d402f02fcf893d4f8af1fc91728cd729c9e5843 |     
  riscv64    |   host-moby-buildkit-0.11.6    | NOK | http://autobuild.buildroot.net/results/bfe38193d5dd8d282c8a436d993b7df1f5b57ca1 |     
powerpc64le  |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/ffba6115ff7efef932c3b657ce05b91e9754fb74 |     


Gitlab CI results for 2024-01-19
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
                          beaglev | https://gitlab.com/buildroot.org/buildroot/-/jobs/5955498711  |      
              freescale_imx8mpevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/5955498839  |      
                       imx6sx-sdb | https://gitlab.com/buildroot.org/buildroot/-/jobs/5955498967  |      
                       imx8mmpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/5955499012  |      
                        imx8mqevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/5955499052  |      
                    imxrt1050-evk | https://gitlab.com/buildroot.org/buildroot/-/jobs/5955499056  |      
               kontron_pitx_imx8m | https://gitlab.com/buildroot.org/buildroot/-/jobs/5955499079  |      
              octavo_osd32mp1_brk | https://gitlab.com/buildroot.org/buildroot/-/jobs/5955499345  |      
              octavo_osd32mp1_red | https://gitlab.com/buildroot.org/buildroot/-/jobs/5955499353  |      
                   orangepi_lite2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5955499413  |      
                orangepi_one_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/5955499424  |      
                   orangepi_zero3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5955499446  |      
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/5955499825  | ORPH 
                raspberrypizero2w | https://gitlab.com/buildroot.org/buildroot/-/jobs/5955499880  |      
             sipeed_licheepi_nano | https://gitlab.com/buildroot.org/buildroot/-/jobs/5955499985  |      
               snps_arc700_axs101 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5955500041  |      
                 snps_arc700_nsim | https://gitlab.com/buildroot.org/buildroot/-/jobs/5955500044  | ORPH 
                snps_archs38_hsdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/5965278299  |      
                socrates_cyclone5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5965278342  |      
                      ti_am62x_sk | https://gitlab.com/buildroot.org/buildroot/-/jobs/5965281762  |      
                      ti_am64x_sk | https://gitlab.com/buildroot.org/buildroot/-/jobs/5965282146  |      
              toradex_apalis_imx6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5965282379  |      



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
