Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73BCDEE499C
	for <buildroot@archiver.kernel.org>; Sat, 19 Aug 2023 05:42:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 89B1C4204C;
	Sat, 19 Aug 2023 05:42:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 89B1C4204C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id se3Q265ZmCyV; Sat, 19 Aug 2023 05:42:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C195542050;
	Sat, 19 Aug 2023 05:42:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C195542050
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CF14E1BF2CA
 for <buildroot@lists.busybox.net>; Sat, 19 Aug 2023 05:42:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A983F401DF
 for <buildroot@lists.busybox.net>; Sat, 19 Aug 2023 05:42:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A983F401DF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ulgAfQZG3JhG for <buildroot@lists.busybox.net>;
 Sat, 19 Aug 2023 05:42:00 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 99AE740133
 for <buildroot@buildroot.org>; Sat, 19 Aug 2023 05:41:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 99AE740133
Received: by mail.gandi.net (Postfix) with ESMTPSA id CD5F3C0003
 for <buildroot@buildroot.org>; Sat, 19 Aug 2023 05:41:56 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sat, 19 Aug 2023 05:41:56 -0000
X-GND-Sasl: bot@bootlin.com
Message-Id: <20230819054201.A983F401DF@smtp2.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1692423716; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=+ThAYakUiIZDc/8vg5U21MXqbCV6bNfjyP/gw2W5IcU=;
 b=F5oRMnrrWoO7+E9eHFYlM32oz4/m8B4Y/BkLpBteYZt5T6R97hxg3i6KrF0nLBYjNoezAx
 xroRbd5P1bgO0wumu61yirapxlReaMBStrhdFILaygS3n6qiMHd1cE50iXofj5OljCOGA0
 WJBsGoQViIjawEEn+aSq0QAcFdfVL5913iMGqrcejh1zd0EbY+A1SJgfNJM5cgqkYPk3Pt
 XeW8d07CVHoZW2Ga4+cu6teDNk+IMg2/bcc+o/4VIaqa4BLb2uUkHvOChh6RDQhOixZb8y
 7uyQJ1wryFd4Lp4QKfkFXkOWvWJJpWieX3dqSrZ7q7H3igmVKjkGNYC+Mk2e5g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=F5oRMnrr
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-08-18
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

Autobuild statistics for 2023-08-18
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  |  1  |  2  |  0  |  3  |
  2023.05.x  |  1  |  5  |  0  |  6  |
    master   | 69  | 51  |  0  | 120 |

Classification of failures by reason for master
-----------------------------------------------

                host-go-1.20.7 | 5 
                elfutils-0.189 | 4 
               host-qemu-8.0.3 | 3 
  gobject-introspection-1.76.1 | 2 
                       unknown | 2 
             batman-adv-2022.3 | 1 
                bpftool-v7.1.0 | 1 
            btrfs-progs-5.16.2 | 1 
             containerd-1.6.22 | 1 
                 dc3dd-7.2.641 | 1 
                     exim-4.96 | 1 
                  faad2-2.10.1 | 1 
           flatbuffers-23.5.26 | 1 
fs/btrfs/btrfs.mk:55: /home... | 1 
glibc-2.37-2-g9f8513dc64119... | 1 
                 hddtemp-0.4.3 | 1 
     host-python-maturin-1.1.0 | 1 
              host-rust-1.71.0 | 1 
         host-sentry-cli-2.8.0 | 1 
               libglib2-2.76.1 | 1 
     linux-5.10.162-cip24-rt10 | 1 
                   linux-6.4.9 | 1 
               linux-pam-1.5.3 | 1 
              liquid-dsp-1.5.0 | 1 
        ltp-testsuite-20230127 | 1 
            mesa3d-demos-9.0.0 | 1 
          modem-manager-1.20.4 | 1 
                 mpg123-1.31.3 | 1 
                    ne10-1.2.1 | 1 
                    olsr-0.9.8 | 1 
                      poke-3.0 | 1 
                     pound-4.8 | 1 
                     pv-1.6.20 | 1 
           python-orjson-3.9.2 | 1 
                python3-3.11.4 | 1 
rtl8822cs-758d861bfa4d18d39... | 1 
              skalibs-2.12.0.1 | 1 
             util-linux-2.39.1 | 1 
               valgrind-3.21.0 | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |       batman-adv-2022.3        | NOK | http://autobuild.buildroot.net/results/75a9af3b57d706e34aa4b67e8c15c8345cd0cef1 |     
 aarch64_be  |         bpftool-v7.1.0         | NOK | http://autobuild.buildroot.net/results/e47edf120ba6544c33154d351bfabd44b41b3832 |     
    arc      |       btrfs-progs-5.16.2       | NOK | http://autobuild.buildroot.net/results/61f901797e207c0cfca0e172223a4781b17e273c | ORPH
   x86_64    |       containerd-1.6.22        | NOK | http://autobuild.buildroot.net/results/1c8e648c46bcab153fc13fc1d6090345b5924d42 |     
    or1k     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/dcc9d631199b68def18bf487d92377050f526ca7 | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/b39a4de749845844f2712729e2e430a1705a8298 | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/e9cced1c95af01258f86e09214f18f02795cd3c5 | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/890bd94e78ece11af9781378c8e750e445c7060f | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/15cd920771a6817e30ab1568371d345fdd435e7d | ORPH
   armeb     |           exim-4.96            | NOK | http://autobuild.buildroot.net/results/a2f2548936b71cd4a657cdb0f613dba1c3f98270 |     
    sh4a     |          faad2-2.10.1          | NOK | http://autobuild.buildroot.net/results/777cc445f17366aed3cd250c432d06d1a3b64313 |     
  riscv64    |      flatbuffers-23.5.26       | NOK | http://autobuild.buildroot.net/results/38bf9e283598240758cd18111277a482431a110a |     
   x86_64    | fs/btrfs/btrfs.mk:55: /home... | NOK | http://autobuild.buildroot.net/results/56ef1cf91b23d13be854b346e776c9866ad1977f |     
  powerpc    | glibc-2.37-2-g9f8513dc64119... | NOK | http://autobuild.buildroot.net/results/be2861e73e298e5324fdeb4154ac07b8f4c445d1 |     
   s390x     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/c4d80dc7470cb297aecab2ed9ba3952151eb51a4 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/aa53931d49c4bc4cbfcdbaca882b3447be2e5bfe | ORPH
   arceb     |         hddtemp-0.4.3          | NOK | http://autobuild.buildroot.net/results/363727daab327e4c4d4705746483012b811c15b0 |     
    i686     |         host-go-1.20.7         | NOK | http://autobuild.buildroot.net/results/1dfc4a9e558dd1a4fb79ee752e3f94a7ce6f4949 |     
   s390x     |         host-go-1.20.7         | NOK | http://autobuild.buildroot.net/results/c15722359bd9a387310bdab312cc924f9ad0e0d9 |     
  mips64el   |         host-go-1.20.7         | NOK | http://autobuild.buildroot.net/results/ad61e83756fa35c9cf763c3b00fb20d4df450eb3 |     
  mips64el   |         host-go-1.20.7         | NOK | http://autobuild.buildroot.net/results/196b12b3c385e48c48be4ec3bb740eccd9971dbe |     
   mips64    |         host-go-1.20.7         | NOK | http://autobuild.buildroot.net/results/efa702e1c3d203992a25169c3596906b1468d945 |     
   x86_64    |   host-python-maturin-1.1.0    | NOK | http://autobuild.buildroot.net/results/b627c9dd039136fcfad458c45916a50f5bdf5833 |     
   mips64    |        host-qemu-8.0.3         | NOK | http://autobuild.buildroot.net/results/4ea83fd591fac23f07190b5915eb142eb900ad47 |     
  mips64el   |        host-qemu-8.0.3         | NOK | http://autobuild.buildroot.net/results/cf97b6d2029c1d7f8e7b71779d1e069518b2794a |     
    mips     |        host-qemu-8.0.3         | NOK | http://autobuild.buildroot.net/results/032b8f71f9c45304e9fb50a6b26a2a45ab862760 |     
    mips     |        host-rust-1.71.0        | NOK | http://autobuild.buildroot.net/results/27264ec340b0202111f363bea18a4f0d95f25e26 |     
  mips64el   |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/825d2db74b3e3c90390ad017c5115b2b744a8f77 |     
   arceb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/a1ad8f3fa1f394b84556063403ac23a556cb427d |     
 powerpc64   |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/e7b019c2447b1d27d206c3d8d2eb3839abe10fe9 | ORPH
  mips64el   |          linux-6.4.9           | NOK | http://autobuild.buildroot.net/results/d5bd5b359d4a66fcac74ac9d0ea9535cc9488a89 | ORPH
   sparc     |        linux-pam-1.5.3         | NOK | http://autobuild.buildroot.net/results/985ac56298cc765a0bba23ee503eb1bd7a6ff101 | ORPH
   x86_64    |        liquid-dsp-1.5.0        | NOK | http://autobuild.buildroot.net/results/c98ce0f5f28b227e6fddab8a3e779bbc11bbbbad |     
  sparc64    |     ltp-testsuite-20230127     | NOK | http://autobuild.buildroot.net/results/535a16fe4cdfe4ffe6e6a692dbf8143d049d3b85 |     
  sparc64    |       mesa3d-demos-9.0.0       | NOK | http://autobuild.buildroot.net/results/1c01da4966b054de9c15f0eb3d738806c7d5d315 |     
    i686     |      modem-manager-1.20.4      | NOK | http://autobuild.buildroot.net/results/2886efd4df08ad951dfdd76a13ad28df3d018b27 |     
    arc      |         mpg123-1.31.3          | NOK | http://autobuild.buildroot.net/results/5590da13c12edda0b94567a56197c513d204b1f1 |     
  aarch64    |           ne10-1.2.1           | NOK | http://autobuild.buildroot.net/results/84d79a6fd872d90926cc1dc2c8d054ccdda2f056 |     
    or1k     |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/0b7fa37ae081d2705d15f6af6d163e7f171c281f | ORPH
  sparc64    |            poke-3.0            | NOK | http://autobuild.buildroot.net/results/32296eef51b1a0f8a2bba5634f35784491b5e465 | ORPH
    sh4a     |           pound-4.8            | NOK | http://autobuild.buildroot.net/results/c85847046dad95973f177d75a58cdaed655a7c9f | ORPH
   armeb     |           pv-1.6.20            | NOK | http://autobuild.buildroot.net/results/33e5cc8cbe7c76ada2514d433161443bff23c609 | ORPH
    mips     |      python-orjson-3.9.2       | NOK | http://autobuild.buildroot.net/results/84697139b48c2f753d32cdfc7afb09614f7e3c5a |     
    arc      |         python3-3.11.4         | NOK | http://autobuild.buildroot.net/results/2d47395d4e92ae33b861fc8d422a1f5976eccdf8 |     
 powerpc64   | rtl8822cs-758d861bfa4d18d39... | NOK | http://autobuild.buildroot.net/results/9caf1e188f51eb656730566c390ee4604aaebbad |     
    or1k     |        skalibs-2.12.0.1        | NOK | http://autobuild.buildroot.net/results/007665076c577c6778dce6c23ab49e6349c6ad6d |     
   mips64    |            unknown             | NOK | http://autobuild.buildroot.net/results/391d91f472477b6f7b8d8d6d66fa40067d7072f5 |     
  sparc64    |            unknown             | NOK | http://autobuild.buildroot.net/results/e817be33fec7967b66bd5a63ee277c005338780c |     
   arceb     |       util-linux-2.39.1        | NOK | http://autobuild.buildroot.net/results/68bcc7cd6e9c9382ef9619fb4c91b60e3a6ad45a | ORPH
   mipsel    |        valgrind-3.21.0         | NOK | http://autobuild.buildroot.net/results/651ffb916a287eadf7adaf9493186c9408e67dd6 | ORPH
   s390x     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/d309230e949d9b9ff2b92dd7ae1e818737e3352f |     


Classification of failures by reason for 2023.02.x
--------------------------------------------------

                  assimp-5.2.5 | 1 
                  check-0.15.2 | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mipsel    |          assimp-5.2.5          | NOK | http://autobuild.buildroot.net/results/8f446c4f492cfd53149cc6117364d6bcabfa22f1 | ORPH
 aarch64_be  |          check-0.15.2          | NOK | http://autobuild.buildroot.net/results/bc7c742c7d352d5933870e5c58aaed48d29da158 | ORPH


Classification of failures by reason for 2023.05.x
--------------------------------------------------

                     gmp-6.2.1 | 1 
              host-rust-1.68.2 | 1 
       python-stack-data-0.6.2 | 1 
                   shadow-4.13 | 1 
               xfsprogs-5.14.2 | 1 


Detail of failures for 2023.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |           gmp-6.2.1            | NOK | http://autobuild.buildroot.net/results/4829fcb3d2752252f33f4081cade1447d9ec1b56 | ORPH
   s390x     |        host-rust-1.68.2        | NOK | http://autobuild.buildroot.net/results/b48449d35da8fcc61acea4b25472112c79495f7c |     
   mips64    |    python-stack-data-0.6.2     | NOK | http://autobuild.buildroot.net/results/e704685413a8293b3821d5b46ff4f231a6379459 |     
    arc      |          shadow-4.13           | NOK | http://autobuild.buildroot.net/results/2292a88215f98b15889613da83dc142d7e33a3fd |     
   nios2     |        xfsprogs-5.14.2         | NOK | http://autobuild.buildroot.net/results/824187b580fb77e0d7e806e718d98dfcc1403cef | ORPH


Gitlab CI results for 2023-08-18
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
                        avenger96 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4889436283  |      
                          beaglev | https://gitlab.com/buildroot.org/buildroot/-/jobs/4889436545  |      
                             ci20 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4889436573  |      
        engicam_imx6qdl_icore_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4889436581  |      
           freescale_imx6qsabresd | https://gitlab.com/buildroot.org/buildroot/-/jobs/4889436612  |      
              freescale_imx8mmevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/4889436630  |      
              freescale_imx8mnevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/4889436638  |      
              freescale_imx8mpevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/4889436653  |      
              freescale_imx8mqevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/4889436658  |      
              freescale_imx8qmmek | https://gitlab.com/buildroot.org/buildroot/-/jobs/4889436661  |      
             freescale_imx8qxpmek | https://gitlab.com/buildroot.org/buildroot/-/jobs/4889436664  |      
          globalscale_espressobin | https://gitlab.com/buildroot.org/buildroot/-/jobs/4900148115  |      
                 hifive_unleashed | https://gitlab.com/buildroot.org/buildroot/-/jobs/4889436688  |      
                 imx6-sabresd_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4900149311  |      
                       imx8mmpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/4889436718  |      
                        imx8mpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/4896437372  |      
                        imx8mqevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/4889436732  |      
               kontron_pitx_imx8m | https://gitlab.com/buildroot.org/buildroot/-/jobs/4889436735  |      
                       ls1028ardb | https://gitlab.com/buildroot.org/buildroot/-/jobs/4889436756  |      
              octavo_osd32mp1_brk | https://gitlab.com/buildroot.org/buildroot/-/jobs/4889436812  |      
              octavo_osd32mp1_red | https://gitlab.com/buildroot.org/buildroot/-/jobs/4889436814  |      
                   orangepi_lite2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4896402500  |      
                orangepi_one_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/4889436855  |      
                   pc_x86_64_bios | https://gitlab.com/buildroot.org/buildroot/-/jobs/4889436869  |      
                    pc_x86_64_efi | https://gitlab.com/buildroot.org/buildroot/-/jobs/4889436872  |      
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/4889437146  | ORPH 
                           rock5b | https://gitlab.com/buildroot.org/buildroot/-/jobs/4889437169  |      
           sipeed_maix_bit_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/4889437191  |      
          sipeed_maix_dock_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/4889437206  |      
            sipeed_maix_go_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/4889437215  |      
          sipeed_maixduino_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/4889437223  |      
               snps_arc700_axs101 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4889437228  |      
                socrates_cyclone5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4889437245  |      
                  stm32mp157a_dk1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4889437266  |      
                  stm32mp157c_dk2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4889437268  |      
              toradex_apalis_imx6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4889437279  |      
                      visionfive2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4889437312  |      



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
