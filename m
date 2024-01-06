Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FD9EC46CD2
	for <buildroot@archiver.kernel.org>; Sat,  6 Jan 2024 07:07:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C5378400F1;
	Sat,  6 Jan 2024 07:07:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C5378400F1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hRpitx9K53X1; Sat,  6 Jan 2024 07:07:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5228640102;
	Sat,  6 Jan 2024 07:07:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5228640102
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6C8801BF35D
 for <buildroot@lists.busybox.net>; Sat,  6 Jan 2024 07:07:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4378740102
 for <buildroot@lists.busybox.net>; Sat,  6 Jan 2024 07:07:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4378740102
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9fuku_BKK2xV for <buildroot@lists.busybox.net>;
 Sat,  6 Jan 2024 07:07:46 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4D76D400F1
 for <buildroot@buildroot.org>; Sat,  6 Jan 2024 07:07:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4D76D400F1
Received: by mail.gandi.net (Postfix) with ESMTPSA id 84440E000B
 for <buildroot@buildroot.org>; Sat,  6 Jan 2024 07:07:42 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sat, 06 Jan 2024 07:07:42 -0000
X-GND-Sasl: bot@bootlin.com
Message-Id: <20240106070748.4378740102@smtp2.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1704524862; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=vV1KmO0M5XCBQfRPI7xLmaTld1ALCPVz/gUVmmriYKQ=;
 b=iTM9YTTqy9eGx5+lAYe8ede7bUyKqGCpoyY+11gGCM6UCARv17fBoWBN2Ff1Exaljn3EuW
 tF3oyAbvhwy1tfrCgClp9wbE0Yj2/LSknZ5PNsc2AO9B5tWqDoAHuVbIWI7tkA+v0EKQtA
 Qe2dgf3u/uz0acThHnpC7yYgjqaZ3Ozd73MddoavlpeiVZLdqsvxuduiNNzU9Hklt+lOyh
 u3+KBLBTTjhXxHTBfJ9/kthc3UZlt+OQfXRA4Pncdsl2U3w3w00XB2D8VPgsvkJC0NBtFB
 uwE6cROHZ44eory6Qphxgx4mxVDg1JTUyHsnKoBnvooTNyNS3BbRyiCFcnNg8w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=iTM9YTTq
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2024-01-05
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

Autobuild statistics for 2024-01-05
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  |  7  |  1  |  1  |  9  |
  2023.08.x  |  4  |  1  |  0  |  5  |
    master   | 50  | 56  |  0  | 106 |

Classification of failures by reason for master
-----------------------------------------------

  gobject-introspection-1.76.1 | 7 
ibm-sw-tpm2-5452af422edeff7... | 6 
               ipmitool-1_8_19 | 3 
                libressl-3.8.2 | 3 
                   linux-6.6.8 | 3 
                elfutils-0.189 | 2 
       freeradius-server-3.2.3 | 2 
        host-sentry-cli-2.20.3 | 2 
                memtest86-6.20 | 2 
          python-grpcio-1.60.0 | 2 
             sofia-sip-1.13.17 | 2 
              cannelloni-1.0.0 | 1 
cegui-00b4e1fe174da53b7ed72... | 1 
check-11970a7e112dfe243a2e6... | 1 
                    cups-2.4.7 | 1 
                 dc3dd-7.2.641 | 1 
                   exim-4.97.1 | 1 
glibc-2.38-27-g750a45a78390... | 1 
                   gvfs-1.48.1 | 1 
              host-rust-1.74.1 | 1 
              libarchive-3.7.2 | 1 
libdill-32d0e8b733416208e04... | 1 
              libopenssl-3.2.0 | 1 
              libostree-2023.8 | 1 
     linux-5.10.162-cip24-rt10 | 1 
                   lsof-4.99.3 | 1 
               lynx-2.8.9rel.1 | 1 
 Makefile:727: target-finalize | 1 
              open62541-v1.3.9 | 1 
           python-numpy-1.25.0 | 1 
        python-pysensors-0.0.4 | 1 
             strongswan-5.9.13 | 1 
                    zeek-4.1.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 aarch64_be  |        cannelloni-1.0.0        | NOK | http://autobuild.buildroot.net/results/46ea36e9e3f4d7ca38821b8bd4350d6fd8bdd426 |     
  sparc64    | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/87c9fe3d3d76927545e2d09a338b23e4031807d0 |     
  riscv64    | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/752f897c425e785b60237ae20b20f981fe7cb620 | ORPH
   mipsel    |           cups-2.4.7           | NOK | http://autobuild.buildroot.net/results/888e9e252821bda1e051400d4aa850cd082e8e76 |     
   nios2     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/3c852f66adfab946283fa7cabc3a5e2a796e87c4 | ORPH
    or1k     |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/7877e2e53f7a6d0c326163ef1a24e4eaeb3d7751 | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/9a6c91c2cb85b322003d0b332b638f637a9d4deb | ORPH
    m68k     |          exim-4.97.1           | NOK | http://autobuild.buildroot.net/results/3b208369dba7bf044aae77a9b64be3501058ef9c |     
   sh4eb     |    freeradius-server-3.2.3     | NOK | http://autobuild.buildroot.net/results/8fb4a919becc875b31fc199eb4db058ebd4f56df |     
   mips64    |    freeradius-server-3.2.3     | NOK | http://autobuild.buildroot.net/results/8f1a69f8fc0aa51a6dace0d9d9e6c09b00ad8b35 |     
 powerpc64   | glibc-2.38-27-g750a45a78390... | NOK | http://autobuild.buildroot.net/results/06d99aaf1edb2d3e253cd9a51416f0c12071c8dd |     
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/4a2fa4054c65f8b8f9857d0d73a8cddf36d97620 | ORPH
   s390x     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/8c7b56792329104a1f8d55ae05e576b94df98497 | ORPH
    m68k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/ba8341886afdefd8945e525abf8db3f68e19ef94 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/70e2e2f7a27dd17509c30eadd4c8e77efb1020e1 | ORPH
   nios2     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/1331b22f2c8e69eb130459ba3bb99164400a6320 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/809ae67136b471b0b383b5532b8dd8c293de8209 | ORPH
   mipsel    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/0caf0a3b0b44ffaebdeaa16f152cab344c6247d1 | ORPH
   arceb     |          gvfs-1.48.1           | NOK | http://autobuild.buildroot.net/results/20fc291ef7e37ee8bd553976cbe841e53345680b | ORPH
  sparc64    |        host-rust-1.74.1        | NOK | http://autobuild.buildroot.net/results/d8357c1044f1b78de91b775baa17124c87e6b9ff |     
   mipsel    |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/4faf39ae975e22a47eefba50d59fb353e2f06db9 |     
    arc      |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/0340a49eda469a74e0426486e450360977d8bde4 |     
  riscv32    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/df684932321f2462a148da506520ada6577152ad |     
    mips     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/add57ead851776fe0b42a67080b245df88cda560 |     
 powerpc64   | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/463ec36b2c0722658d6aa79e5e289a3a01632fd2 |     
 powerpc64   | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/f4f34c1ad0f0ec22e21b48d5a74b6caa5aa1cabe |     
   xtensa    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/c8519386d69f6782d0a97f5cdaabd67e93aec9b2 |     
  aarch64    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/3584f70cc847ef103c3f87d626ef0f3623b5268c |     
    m68k     |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.net/results/c883235f66b80498ae81429093dce494101d98b6 |     
   sh4aeb    |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.net/results/69d189644436bc167f222e00d94247e8f83f173c |     
  mips64el   |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.net/results/2d9eff706206e253d0b951b174ea0cf2fd85927e |     
microblazeel |        libarchive-3.7.2        | NOK | http://autobuild.buildroot.net/results/d46a8fce9c5f6c6d6041c1f4542e3215c8994610 |     
  riscv64    | libdill-32d0e8b733416208e04... | NOK | http://autobuild.buildroot.net/results/1137dc9737f42ef5e25d6ddf635d442206246ac3 |     
   s390x     |        libopenssl-3.2.0        | NOK | http://autobuild.buildroot.net/results/bc19a5a0bdce39530e558d01d8e13c863635a165 | ORPH
    arm      |        libostree-2023.8        | NOK | http://autobuild.buildroot.net/results/bf420fe9336ad8e25f123469aa83d243c9a5e999 |     
   mips64    |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/0821d27c5f99b794c7da83fe40f40571e25efe1d | ORPH
   arceb     |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/5f5a497469929d06d51502bbbe2f2bebbfaa9673 | ORPH
 microblaze  |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/1fef9916210203da3f8d08654b15942daea9733d | ORPH
   mips64    |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/7d7b88deca6cbf248e46b53c7a97f727b6099f69 | ORPH
  mips64el   |          linux-6.6.8           | NOK | http://autobuild.buildroot.net/results/a97f1a620ef9fb6f024236831bdf569408fd1abb | ORPH
  powerpc    |          linux-6.6.8           | NOK | http://autobuild.buildroot.net/results/f65096c21fdc91f1b8d845820137ba135a979ac0 | ORPH
  mips64el   |          linux-6.6.8           | NOK | http://autobuild.buildroot.net/results/9e6117a9d0d034e2ed1574eb08b8860e024027d8 | ORPH
   arceb     |          lsof-4.99.3           | NOK | http://autobuild.buildroot.net/results/aa98b10e8eff5cc4fd03b4a64224cdfb6a0324a5 | ORPH
   mips64    |        lynx-2.8.9rel.1         | NOK | http://autobuild.buildroot.net/results/eb67ac1ae687a9f8b047e31377ce14b49e69239d |     
powerpc64le  | Makefile:727: target-finalize  | NOK | http://autobuild.buildroot.net/results/86530a97db31c4a018c01e150d5986531301c430 |     
    i686     |         memtest86-6.20         | NOK | http://autobuild.buildroot.net/results/b5a2f413f8c35ccea92c470bd77f4732a39a3b98 |     
   x86_64    |         memtest86-6.20         | NOK | http://autobuild.buildroot.net/results/8e530d10e51b26fc79b2be998c4da688f67e32f3 |     
  riscv32    |        open62541-v1.3.9        | NOK | http://autobuild.buildroot.net/results/ddbdeaff1bf060138cdb317d10f9a947f9923481 | ORPH
 microblaze  |      python-grpcio-1.60.0      | NOK | http://autobuild.buildroot.net/results/4e6642f266cbedd39be9e058fe33734b255cf707 |     
powerpc64le  |      python-grpcio-1.60.0      | NOK | http://autobuild.buildroot.net/results/d8abba2b9dfb539b6a4ea21e9641881336011fe8 |     
   armeb     |      python-numpy-1.25.0       | NOK | http://autobuild.buildroot.net/results/8a28caf844fa21af2881d930397a3706161e6fd7 |     
 microblaze  |     python-pysensors-0.0.4     | NOK | http://autobuild.buildroot.net/results/b7d5f8bfc797990cafa60d55f939ff83ad6729fc |     
  powerpc    |       sofia-sip-1.13.17        | NOK | http://autobuild.buildroot.net/results/ee862bdafd44c8c56f77e2702ee0a7462634fa0b |     
   mipsel    |       sofia-sip-1.13.17        | NOK | http://autobuild.buildroot.net/results/124973ecc8ff1414cd77f6a384c14e982a3a0ca3 |     
  sparc64    |       strongswan-5.9.13        | NOK | http://autobuild.buildroot.net/results/a573c9d9a505e01c370fb65d1e0a619e01e6254e |     
  riscv64    |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/99d23178e0ef6f3378f7141368558218974b3ca4 |     


Classification of failures by reason for 2023.02.x
--------------------------------------------------

         gobject-introspection | 1 
                 raptor-2.0.15 | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/b0a64a22b3587bfa322564a57611f9856df7054a |     
    arc      |         raptor-2.0.15          | NOK | http://autobuild.buildroot.net/results/dbe4f079d57d23e8b9c2d52f45229689229ee837 | ORPH


Classification of failures by reason for 2023.08.x
--------------------------------------------------

                python3-3.11.6 | 1 


Detail of failures for 2023.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |         python3-3.11.6         | NOK | http://autobuild.buildroot.net/results/46e0b3dfcd758fca08a6b19f69b06bbbf81049df |     


Gitlab CI results for 2024-01-05
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
                          beaglev | https://gitlab.com/buildroot.org/buildroot/-/jobs/5858179423  |      
              freescale_imx8mpevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/5858180070  |      
                       imx8mmpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/5858180248  |      
                        imx8mpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/5858180267  |      
                        imx8mqevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/5858180272  |      
               kontron_pitx_imx8m | https://gitlab.com/buildroot.org/buildroot/-/jobs/5858180287  |      
                       ls1028ardb | https://gitlab.com/buildroot.org/buildroot/-/jobs/5858180302  |      
                     ls1046a-frwy | https://gitlab.com/buildroot.org/buildroot/-/jobs/5858180305  |      
              octavo_osd32mp1_brk | https://gitlab.com/buildroot.org/buildroot/-/jobs/5858180355  |      
              octavo_osd32mp1_red | https://gitlab.com/buildroot.org/buildroot/-/jobs/5858180357  |      
                   orangepi_lite2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5858180456  |      
                orangepi_one_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/5858180469  |      
                qemu_aarch64_ebbr | https://gitlab.com/buildroot.org/buildroot/-/jobs/5858180507  |      
                qemu_aarch64_sbsa | https://gitlab.com/buildroot.org/buildroot/-/jobs/5858180508  |      
                    qemu_arm_ebbr | https://gitlab.com/buildroot.org/buildroot/-/jobs/5858180510  |      
             qemu_arm_vexpress_tz | https://gitlab.com/buildroot.org/buildroot/-/jobs/5858180514  |      
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/5858180605  | ORPH 
                raspberrypizero2w | https://gitlab.com/buildroot.org/buildroot/-/jobs/5858180619  |      
             sipeed_licheepi_nano | https://gitlab.com/buildroot.org/buildroot/-/jobs/5858180645  |      
               snps_arc700_axs101 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5858180664  |      
                 snps_arc700_nsim | https://gitlab.com/buildroot.org/buildroot/-/jobs/5858180667  | ORPH 
                socrates_cyclone5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5858180688  |      
          solidrun_clearfog_gt_8k | https://gitlab.com/buildroot.org/buildroot/-/jobs/5858180718  |      
            solidrun_macchiatobin | https://gitlab.com/buildroot.org/buildroot/-/jobs/5858180724  | ORPH 
                      ti_am62x_sk | https://gitlab.com/buildroot.org/buildroot/-/jobs/5858180764  |      
                      ti_am64x_sk | https://gitlab.com/buildroot.org/buildroot/-/jobs/5866517418  |      
              toradex_apalis_imx6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5866517566  |      



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
