Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE0DFEB64DD
	for <buildroot@archiver.kernel.org>; Sat,  5 Aug 2023 05:39:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3111B4015E;
	Sat,  5 Aug 2023 05:39:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3111B4015E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t8fROFFD7FdB; Sat,  5 Aug 2023 05:39:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 85111400AC;
	Sat,  5 Aug 2023 05:39:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 85111400AC
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 515A61BF853
 for <buildroot@lists.busybox.net>; Sat,  5 Aug 2023 05:39:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4E72E4094C
 for <buildroot@lists.busybox.net>; Sat,  5 Aug 2023 05:38:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4E72E4094C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CdnRlSfdlQXN for <buildroot@lists.busybox.net>;
 Sat,  5 Aug 2023 05:38:19 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CCC3D4023D
 for <buildroot@buildroot.org>; Sat,  5 Aug 2023 05:38:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CCC3D4023D
Received: by mail.gandi.net (Postfix) with ESMTPSA id E4B6DC000F
 for <buildroot@buildroot.org>; Sat,  5 Aug 2023 05:38:15 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sat, 05 Aug 2023 05:38:15 -0000
X-GND-Sasl: bot@bootlin.com
Message-Id: <20230805053821.4E72E4094C@smtp2.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1691213896; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=kc1ou+WjZhTGdguKHnVr876WM4hueVT3EG0p5+7njJw=;
 b=aDrpBne/syfbppLOUqk6iPq5pZfWC5RDJWRlNRFcWMEauRlkEIXgmpqzqNIftozereJUwc
 M3TlmZPNeH6XUyqy6AXmdKNb/a3zRMvXvsJDVd9N9i+QIiVMKL3U09tPl0DrrJlUQhKrGs
 7X3k5wZU6gNf16J7E+j/83kUVKxGkpMnZgU5RUdTQ7PDGh00w7FRLxmAQtjYByPMav5WFp
 so0aNvw3kdCBfCii8l4Qt6P0Tzyi+hePfqPC2Oe52HPNJzr3VOPpJ0fqN6gIGzz45dmiVI
 BLTHEmrXjsNjyUsoWvwmGkidxHh9yjEPVHKuAjnjKB8ahNKnXMUOxJ3yf2I2IA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=aDrpBne/
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-08-04
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

Autobuild statistics for 2023-08-04
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  |  4  |  4  |  0  |  8  |
  2023.05.x  |  4  |  4  |  0  |  8  |
    master   | 53  | 55  |  1  | 109 |

Classification of failures by reason for master
-----------------------------------------------

          host-elf2flt-2021.08 | 4 
             host-ccache-4.8.2 | 3 
                host-go-1.20.7 | 3 
             util-linux-2.39.1 | 3 
             f2fs-tools-1.16.0 | 2 
  gobject-introspection-1.76.1 | 2 
           host-composer-2.5.8 | 2 
              host-rust-1.71.0 | 2 
               libglib2-2.76.1 | 2 
              open62541-v1.3.6 | 2 
       python-stack-data-0.6.2 | 2 
                 uclibc-1.0.43 | 2 
                     apr-1.7.2 | 1 
                    bat-0.23.0 | 1 
             batman-adv-2022.3 | 1 
                  boost-1.82.0 | 1 
                    brltty-6.5 | 1 
                  cairo-1.16.0 | 1 
              e2fsprogs-1.47.0 | 1 
                elfutils-0.189 | 1 
                 fdk-aac-2.0.2 | 1 
                      fio-3.34 | 1 
fs/erofs/erofs.mk:46: /home... | 1 
fs/ubi/ubi.mk:51: /home/bui... | 1 
glibc-2.37-2-g9f8513dc64119... | 1 
         gobject-introspection | 1 
                   guile-3.0.9 | 1 
         host-sentry-cli-2.8.0 | 1 
                   json-c-0.16 | 1 
     linux-5.10.162-cip24-rt10 | 1 
        ltp-testsuite-20230127 | 1 
                  ntp-4.2.8p17 | 1 
                    olsr-0.9.8 | 1 
                    qemu-8.0.3 | 1 
                   systemd-254 | 1 
               trace-cmd-2.9.7 | 1 
                       unknown | 1 
        util-linux-libs-2.39.1 | 1 
                  xvisor-0.3.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |           apr-1.7.2            | NOK | http://autobuild.buildroot.net/results/6303f2e835f2b4d3c5afdb090b52609ee1b809e6 |     
  aarch64    |           bat-0.23.0           | NOK | http://autobuild.buildroot.net/results/127fcc7f5e7333b84442c507aaecdd439cbc3ce6 |     
microblazeel |       batman-adv-2022.3        | NOK | http://autobuild.buildroot.net/results/0e7935913d6b9e55fc738834cfbf35d3d9bdd14f |     
   arceb     |          boost-1.82.0          | NOK | http://autobuild.buildroot.net/results/bc7635105aa8e8e3b8d8488b01e03f76d02b5a7e |     
powerpc64le  |           brltty-6.5           | NOK | http://autobuild.buildroot.net/results/e24992e34b295fabf220e99c1c2c93b67fcfea47 |     
   xtensa    |          cairo-1.16.0          | NOK | http://autobuild.buildroot.net/results/2c4b983248b25ed6769c91d8b687c54434068eb7 |     
   sh4aeb    |        e2fsprogs-1.47.0        | NOK | http://autobuild.buildroot.net/results/659313b1783db491653bcc85b37da40c7b077225 | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/29a1c9729c99fc0bd0db3e46d8eebd5de3d82a35 | ORPH
   x86_64    |       f2fs-tools-1.16.0        | NOK | http://autobuild.buildroot.net/results/c33582c0863460af49850786bd70f65569437ca4 |     
 aarch64_be  |       f2fs-tools-1.16.0        | NOK | http://autobuild.buildroot.net/results/118ce06623493136b4f146f56e1d0a324ae7ac72 |     
   armeb     |         fdk-aac-2.0.2          | NOK | http://autobuild.buildroot.net/results/9cdc0a36808875127ed7eb64facfdd5f57f1b6b5 |     
  riscv64    |            fio-3.34            | NOK | http://autobuild.buildroot.net/results/f3c2f063be393d7787d302dde865e0b03ffc550d |     
    i686     | fs/erofs/erofs.mk:46: /home... | NOK | http://autobuild.buildroot.net/results/616094193d6748cc1ed12d375842a3f91c2a6e5b |     
    mips     | fs/ubi/ubi.mk:51: /home/bui... | NOK | http://autobuild.buildroot.net/results/1428a5730fc0da72b5cb67588fc021d5482a389d |     
powerpc64le  | glibc-2.37-2-g9f8513dc64119... | NOK | http://autobuild.buildroot.net/results/6e880345f9ced81cb2cdb3cf670eda4a11baec97 |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/b35258552b32def299db602d248e7a64b187ecec |     
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/c8231c4e051d98271d8e4143acf9c190eca48d65 | ORPH
    i686     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/a4c28f280074b77deddca550c6371865f2a329d0 | ORPH
   x86_64    |          guile-3.0.9           | NOK | http://autobuild.buildroot.net/results/87f8c8b3796758d34700f97ca95a13939795900b |     
   x86_64    |       host-ccache-4.8.2        | NOK | http://autobuild.buildroot.net/results/47b6f91aa9d2a13c9c0a0a5f61229abfff9116a4 | ORPH
  mips64el   |       host-ccache-4.8.2        | NOK | http://autobuild.buildroot.net/results/ebafee5fce5d12cfbe8169b16d6ab27c14e2fd7a | ORPH
  sparc64    |       host-ccache-4.8.2        | NOK | http://autobuild.buildroot.net/results/9866181b63e755e60637f87bb251d4d50005870a | ORPH
   mipsel    |      host-composer-2.5.8       | NOK | http://autobuild.buildroot.net/results/d43958bb21e01b99c9f8c59f30f7b18024d5633b |     
   nios2     |      host-composer-2.5.8       | NOK | http://autobuild.buildroot.net/results/c35daf11a133777689183165922f7dfe0263f2b1 |     
  riscv64    |      host-elf2flt-2021.08      | NOK | http://autobuild.buildroot.net/results/df35c1a1030138b96f670ce7c2e3ecef992b9ccf | ORPH
  riscv64    |      host-elf2flt-2021.08      | NOK | http://autobuild.buildroot.net/results/7f593399af40c58b09607e0f5b267973c6a179be | ORPH
  riscv64    |      host-elf2flt-2021.08      | NOK | http://autobuild.buildroot.net/results/060ba4d8897a4ac0a25894a214719f20bd8d9a57 | ORPH
    m68k     |      host-elf2flt-2021.08      | NOK | http://autobuild.buildroot.net/results/25c9079c8e783f07f948cd9b86fb644a222b5297 | ORPH
powerpc64le  |         host-go-1.20.7         | NOK | http://autobuild.buildroot.net/results/c6496053775a2d8088fdd685649445af72701822 |     
   x86_64    |         host-go-1.20.7         | NOK | http://autobuild.buildroot.net/results/4aea1e5b538a4a468da4cf6d26e18e20b70a8305 |     
    arm      |         host-go-1.20.7         | NOK | http://autobuild.buildroot.net/results/2d49e44c296203112f07f02453963d63dd9a8057 |     
  mips64el   |        host-rust-1.71.0        | NOK | http://autobuild.buildroot.net/results/0da28d2a6be7ba0a44adbc6a9aa818937e57e64b |     
 powerpc64   |        host-rust-1.71.0        | NOK | http://autobuild.buildroot.net/results/6348dd21145f930cb45d828b9b77e6d695515378 |     
powerpc64le  |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/ba5f8e2d50ff0d4c281825ae572e0e07fc16f1a4 |     
  riscv64    |          json-c-0.16           | NOK | http://autobuild.buildroot.net/results/c161f191d85f9d064626ee6fcfebea61d916e434 |     
    or1k     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/3e9d8da5d1afbcbf83f1ed0e9b2ad13f2cf3a84d |     
   x86_64    |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/e2cdbeacb24901a6e4d18769346a60cee79fbec9 |     
   mipsel    |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/c9697843d106f314c84eafb3928753e4fbff8317 | ORPH
    i686     |     ltp-testsuite-20230127     | NOK | http://autobuild.buildroot.net/results/3259e2d08df83b0720adada5baf36a4c04990393 |     
   sh4aeb    |          ntp-4.2.8p17          | NOK | http://autobuild.buildroot.net/results/236336b19b9a3a8a116a0734e88dbb625cadf61d |     
    arm      |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/bf5955e920c56cdc444374e5933a6654cf17be2d | ORPH
    arm      |        open62541-v1.3.6        | NOK | http://autobuild.buildroot.net/results/17670cd2beb53bc41b6bd27bbb7d26d6bfd4f27f | ORPH
   s390x     |        open62541-v1.3.6        | NOK | http://autobuild.buildroot.net/results/cc5e37626fc58d48cf02fe2dff8419491bb9c295 | ORPH
 microblaze  |    python-stack-data-0.6.2     | NOK | http://autobuild.buildroot.net/results/e96a039af9e3f2d411457e76c00097709990daac |     
 microblaze  |    python-stack-data-0.6.2     | NOK | http://autobuild.buildroot.net/results/6bf17ed023b41a0a2844db72b99adb464210624b |     
    mips     |           qemu-8.0.3           | NOK | http://autobuild.buildroot.net/results/1b9ad5f1b78b6435971ca2d245f9e8013d6af8b3 |     
   s390x     |          systemd-254           | NOK | http://autobuild.buildroot.net/results/3b410ff6368551965d8c1af3e5b516b46d524c7a |     
    mips     |        trace-cmd-2.9.7         | NOK | http://autobuild.buildroot.net/results/de27ad0fdbe4ca67ae5d6096cb2ebecacf2c5caf |     
  powerpc    |         uclibc-1.0.43          | NOK | http://autobuild.buildroot.net/results/fe2c176b3fd4af7b57937b2510b950a05f93fadd |     
  powerpc    |         uclibc-1.0.43          | NOK | http://autobuild.buildroot.net/results/f545bb137dd45b5c9242afc4e7e346a0b41375ec |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/9fc3f4cf2908bfb54243896a5b656828cb27c3e2 |     
    arm      |       util-linux-2.39.1        | NOK | http://autobuild.buildroot.net/results/aab4eaaff890c4348f912358fe0a0de6b17e1e4a | ORPH
    sh4a     |       util-linux-2.39.1        | NOK | http://autobuild.buildroot.net/results/9ec41f4552d394a777e47013f9a9876d5e5a34fa | ORPH
    arm      |       util-linux-2.39.1        | NOK | http://autobuild.buildroot.net/results/a69239e570f20f5cf3507f89c2a62b1fd2ce649c | ORPH
   sh4eb     |     util-linux-libs-2.39.1     | NOK | http://autobuild.buildroot.net/results/90f019e3123964a3176508cd64b3d46ad2fc8e80 | ORPH
   x86_64    |          xvisor-0.3.2          | NOK | http://autobuild.buildroot.net/results/aab76cda184c466f13be326a73336681e0337b86 |     


Classification of failures by reason for 2023.02.x
--------------------------------------------------

                  linux-6.1.38 | 1 
                    musl-1.2.3 | 1 
                suricata-6.0.6 | 1 
ulog-0389d243352255f6182326... | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 microblaze  |          linux-6.1.38          | NOK | http://autobuild.buildroot.net/results/4b11ac761e5e51f2b6c708ab903a51775baf2522 | ORPH
  powerpc    |           musl-1.2.3           | NOK | http://autobuild.buildroot.net/results/cf866d5320b069eb1e8b4f05e8e58de0ad2ec7b5 |     
   mipsel    |         suricata-6.0.6         | NOK | http://autobuild.buildroot.net/results/fe4b019585520b1e19bba0ff098b7ef5b6e348f8 |     
   s390x     | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/f983d69d41d26c436612e4e684ff3b171c03e354 |     


Classification of failures by reason for 2023.05.x
--------------------------------------------------

            host-binutils-2.39 | 1 
              host-rust-1.68.2 | 1 
                libglvnd-1.4.0 | 1 
                    zeek-4.1.1 | 1 


Detail of failures for 2023.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i586     |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/52be5a35ddcc297ea79b80c67616546edb3947f6 |     
  aarch64    |        host-rust-1.68.2        | NOK | http://autobuild.buildroot.net/results/56e1613848667e75d6240edb55cd1a12e6316a7f |     
   xtensa    |         libglvnd-1.4.0         | NOK | http://autobuild.buildroot.net/results/a6864f2fd29447b0d9d5540c8b38941965bf8566 | ORPH
  sparc64    |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/4b468e9d1bae742ba987b1c1283f0714c075e163 |     


Gitlab CI results for 2023-08-04
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
       acmesystems_acqua_a5_256mb | https://gitlab.com/buildroot.org/buildroot/-/jobs/4795672852  |      
       acmesystems_aria_g25_128mb | https://gitlab.com/buildroot.org/buildroot/-/jobs/4749555887  |      
             amarula_vyasa_rk3288 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4795672895  |      
             amarula_vyasa_rk3288 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4749555892  |      
                   andes_ae350_45 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4795672901  |      
               asus_tinker_rk3288 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4795672973  |      
               asus_tinker_rk3288 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4749555930  |      
   atmel_sama5d2_xplained_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/4749555949  |      
   atmel_sama5d4_xplained_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/4795673176  |      
                        avenger96 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4795673179  |      
                bananapi_m2_ultra | https://gitlab.com/buildroot.org/buildroot/-/jobs/4795673186  |      
                bananapi_m2_ultra | https://gitlab.com/buildroot.org/buildroot/-/jobs/4749555991  |      
                        bananapro | https://gitlab.com/buildroot.org/buildroot/-/jobs/4795673199  | ORPH 
                        bananapro | https://gitlab.com/buildroot.org/buildroot/-/jobs/4749556001  | ORPH 
                     beagleboneai | https://gitlab.com/buildroot.org/buildroot/-/jobs/4795673312  |      
                          beaglev | https://gitlab.com/buildroot.org/buildroot/-/jobs/4795673320  |      
                     canaan_kd233 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4795673339  |      
                   chromebook_elm | https://gitlab.com/buildroot.org/buildroot/-/jobs/4795673345  |      
                  chromebook_snow | https://gitlab.com/buildroot.org/buildroot/-/jobs/4795673350  |      
                             ci20 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4795673356  |      
                      cubieboard2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4795673360  |      
            engicam_imx6qdl_icore | https://gitlab.com/buildroot.org/buildroot/-/jobs/4795673365  |      
        engicam_imx6qdl_icore_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4795673370  |      
        engicam_imx6qdl_icore_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4749556055  |      
           freescale_imx6qsabresd | https://gitlab.com/buildroot.org/buildroot/-/jobs/4795673424  |      
           freescale_imx6qsabresd | https://gitlab.com/buildroot.org/buildroot/-/jobs/4749556074  |      
              freescale_imx8mmevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/4795673430  |      
              freescale_imx8mmevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/4749556081  |      
              freescale_imx8mnevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/4795673432  |      
              freescale_imx8mnevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/4749556084  |      
              freescale_imx8mpevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/4795673433  |      
              freescale_imx8mpevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/4749556085  |      
              freescale_imx8mqevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/4795673434  |      
              freescale_imx8mqevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/4749556086  |      
              freescale_imx8qmmek | https://gitlab.com/buildroot.org/buildroot/-/jobs/4795673436  |      
              freescale_imx8qmmek | https://gitlab.com/buildroot.org/buildroot/-/jobs/4749556087  |      
             freescale_imx8qxpmek | https://gitlab.com/buildroot.org/buildroot/-/jobs/4795673439  |      
             freescale_imx8qxpmek | https://gitlab.com/buildroot.org/buildroot/-/jobs/4749556088  |      
                 hifive_unleashed | https://gitlab.com/buildroot.org/buildroot/-/jobs/4795673456  |      
                 hifive_unleashed | https://gitlab.com/buildroot.org/buildroot/-/jobs/4749556098  |      
                   imx6-sabreauto | https://gitlab.com/buildroot.org/buildroot/-/jobs/4795673458  |      
                 imx6-sabresd_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4795673461  |      
                 imx6-sabresd_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4749556102  |      
                       imx8mmpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/4795673481  |      
                       imx8mmpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/4749556114  |      
                imx8mn_bsh_smm_s2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4795673483  |      
                imx8mn_bsh_smm_s2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4749556116  |      
            imx8mn_bsh_smm_s2_pro | https://gitlab.com/buildroot.org/buildroot/-/jobs/4795673486  |      
            imx8mn_bsh_smm_s2_pro | https://gitlab.com/buildroot.org/buildroot/-/jobs/4749556119  |      
                        imx8mpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/4795673488  |      
                        imx8mpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/4749556122  |      
                        imx8mqevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/4795673492  |      
                        imx8mqevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/4749556123  |      
                kontron_bl_imx8mm | https://gitlab.com/buildroot.org/buildroot/-/jobs/4795673499  |      
                kontron_bl_imx8mm | https://gitlab.com/buildroot.org/buildroot/-/jobs/4749556125  |      
               kontron_pitx_imx8m | https://gitlab.com/buildroot.org/buildroot/-/jobs/4795673501  |      
               kontron_pitx_imx8m | https://gitlab.com/buildroot.org/buildroot/-/jobs/4749556126  |      
              kontron_smarc_sal28 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4795673502  |      
              kontron_smarc_sal28 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4749556128  |      
                    licheepi_zero | https://gitlab.com/buildroot.org/buildroot/-/jobs/4795673512  |      
                    licheepi_zero | https://gitlab.com/buildroot.org/buildroot/-/jobs/4749556136  |      
               linksprite_pcduino | https://gitlab.com/buildroot.org/buildroot/-/jobs/4795673514  |      
               linksprite_pcduino | https://gitlab.com/buildroot.org/buildroot/-/jobs/4749556137  |      
                       ls1028ardb | https://gitlab.com/buildroot.org/buildroot/-/jobs/4795673517  |      
                       ls1028ardb | https://gitlab.com/buildroot.org/buildroot/-/jobs/4749556139  |      
                            nezha | https://gitlab.com/buildroot.org/buildroot/-/jobs/4795673570  |      
                            nezha | https://gitlab.com/buildroot.org/buildroot/-/jobs/4749556169  |      
                      nitrogen6sx | https://gitlab.com/buildroot.org/buildroot/-/jobs/4795673573  |      
                       nitrogen6x | https://gitlab.com/buildroot.org/buildroot/-/jobs/4795673576  |      
                        nitrogen7 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4795673580  |      
                       nitrogen8m | https://gitlab.com/buildroot.org/buildroot/-/jobs/4795673582  |      
                       nitrogen8m | https://gitlab.com/buildroot.org/buildroot/-/jobs/4749556175  |      
                      nitrogen8mm | https://gitlab.com/buildroot.org/buildroot/-/jobs/4795673585  |      
                      nitrogen8mm | https://gitlab.com/buildroot.org/buildroot/-/jobs/4749556176  |      
                      nitrogen8mn | https://gitlab.com/buildroot.org/buildroot/-/jobs/4795673588  |      
                      nitrogen8mn | https://gitlab.com/buildroot.org/buildroot/-/jobs/4749556177  |      
                      nitrogen8mp | https://gitlab.com/buildroot.org/buildroot/-/jobs/4795673590  |      
                      nitrogen8mp | https://gitlab.com/buildroot.org/buildroot/-/jobs/4749556178  |      
              octavo_osd32mp1_brk | https://gitlab.com/buildroot.org/buildroot/-/jobs/4795673594  |      
              octavo_osd32mp1_brk | https://gitlab.com/buildroot.org/buildroot/-/jobs/4749556181  |      
              octavo_osd32mp1_red | https://gitlab.com/buildroot.org/buildroot/-/jobs/4795673596  |      
              octavo_osd32mp1_red | https://gitlab.com/buildroot.org/buildroot/-/jobs/4749556184  |      
        olimex_a10_olinuxino_lime | https://gitlab.com/buildroot.org/buildroot/-/jobs/4795673608  |      
        olimex_a10_olinuxino_lime | https://gitlab.com/buildroot.org/buildroot/-/jobs/4749556195  |      
             olimex_a13_olinuxino | https://gitlab.com/buildroot.org/buildroot/-/jobs/4795673611  |      
             olimex_a13_olinuxino | https://gitlab.com/buildroot.org/buildroot/-/jobs/4749556199  |      
        olimex_a20_olinuxino_lime | https://gitlab.com/buildroot.org/buildroot/-/jobs/4795673615  |      
        olimex_a20_olinuxino_lime | https://gitlab.com/buildroot.org/buildroot/-/jobs/4749556204  |      
       olimex_a20_olinuxino_lime2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4795673612  |      
       olimex_a20_olinuxino_lime2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4749556201  |      
       olimex_a20_olinuxino_micro | https://gitlab.com/buildroot.org/buildroot/-/jobs/4795673619  |      
       olimex_a20_olinuxino_micro | https://gitlab.com/buildroot.org/buildroot/-/jobs/4749556206  |      
             olimex_a33_olinuxino | https://gitlab.com/buildroot.org/buildroot/-/jobs/4795673622  |      
             olimex_a33_olinuxino | https://gitlab.com/buildroot.org/buildroot/-/jobs/4749556207  |      
             olimex_a64_olinuxino | https://gitlab.com/buildroot.org/buildroot/-/jobs/4795673623  |      
             olimex_a64_olinuxino | https://gitlab.com/buildroot.org/buildroot/-/jobs/4749556208  |      
                    openblocks_a6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4795673641  |      
                    orangepi_lite | https://gitlab.com/buildroot.org/buildroot/-/jobs/4795673648  |      
                   orangepi_lite2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4795673645  |      
                   orangepi_lite2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4749556221  |      
                     orangepi_one | https://gitlab.com/buildroot.org/buildroot/-/jobs/4795673649  |      
                     orangepi_one | https://gitlab.com/buildroot.org/buildroot/-/jobs/4749556224  |      
                orangepi_one_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/4795673653  |      
                orangepi_one_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/4749556225  |      
                 orangepi_pc_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/4795673656  |      
                 orangepi_pc_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/4749556227  |      
                    orangepi_zero | https://gitlab.com/buildroot.org/buildroot/-/jobs/4795673658  |      
                    orangepi_zero | https://gitlab.com/buildroot.org/buildroot/-/jobs/4749556229  |      
               orangepi_zero_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/4795673661  |      
               orangepi_zero_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/4749556231  |      
              orangepi_zero_plus2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4795673659  |      
              orangepi_zero_plus2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4749556230  |      
                   pc_x86_64_bios | https://gitlab.com/buildroot.org/buildroot/-/jobs/4795673664  |      
                   pc_x86_64_bios | https://gitlab.com/buildroot.org/buildroot/-/jobs/4749556234  |      
                    pc_x86_64_efi | https://gitlab.com/buildroot.org/buildroot/-/jobs/4795673665  |      
                    pc_x86_64_efi | https://gitlab.com/buildroot.org/buildroot/-/jobs/4749556235  |      
                           pine64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4795673669  |      
                qemu_aarch64_ebbr | https://gitlab.com/buildroot.org/buildroot/-/jobs/4795673672  |      
             qemu_arm_vexpress_tz | https://gitlab.com/buildroot.org/buildroot/-/jobs/4795673679  |      
             qemu_arm_vexpress_tz | https://gitlab.com/buildroot.org/buildroot/-/jobs/4802254659  |      
                qemu_m68k_mcf5208 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4795673680  |      
                 qemu_ppc64_e5500 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4795673700  |      
               qemu_ppc64_pseries | https://gitlab.com/buildroot.org/buildroot/-/jobs/4795673701  |      
            qemu_ppc64le_powernv8 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4795673702  |      
             qemu_ppc64le_pseries | https://gitlab.com/buildroot.org/buildroot/-/jobs/4795673703  |      
          qemu_riscv64_nommu_virt | https://gitlab.com/buildroot.org/buildroot/-/jobs/4795673713  |      
                 qemu_xtensa_lx60 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4795673728  |      
           qemu_xtensa_lx60_nommu | https://gitlab.com/buildroot.org/buildroot/-/jobs/4795673730  |      
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/4795673739  | ORPH 
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/4749556310  | ORPH 
                           rock5b | https://gitlab.com/buildroot.org/buildroot/-/jobs/4795673759  |      
                 sipeed_lichee_rv | https://gitlab.com/buildroot.org/buildroot/-/jobs/4795673768  |      
                 sipeed_lichee_rv | https://gitlab.com/buildroot.org/buildroot/-/jobs/4749556346  |      
            sipeed_lichee_rv_dock | https://gitlab.com/buildroot.org/buildroot/-/jobs/4795673769  |      
            sipeed_lichee_rv_dock | https://gitlab.com/buildroot.org/buildroot/-/jobs/4749556347  |      
                  sipeed_maix_bit | https://gitlab.com/buildroot.org/buildroot/-/jobs/4795673770  |      
           sipeed_maix_bit_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/4795673771  |      
                 sipeed_maix_dock | https://gitlab.com/buildroot.org/buildroot/-/jobs/4795673772  |      
          sipeed_maix_dock_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/4795673773  |      
                   sipeed_maix_go | https://gitlab.com/buildroot.org/buildroot/-/jobs/4795673774  |      
            sipeed_maix_go_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/4795673775  |      
                 sipeed_maixduino | https://gitlab.com/buildroot.org/buildroot/-/jobs/4795673776  |      
          sipeed_maixduino_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/4795673777  |      
               snps_arc700_axs101 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4795673779  |      
               snps_arc700_axs101 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4749556361  |      
                socrates_cyclone5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4795673783  |      
                socrates_cyclone5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4749556366  |      
          solidrun_clearfog_gt_8k | https://gitlab.com/buildroot.org/buildroot/-/jobs/4795673785  |      
            solidrun_macchiatobin | https://gitlab.com/buildroot.org/buildroot/-/jobs/4795673786  | ORPH 
              stm32f429_disco_xip | https://gitlab.com/buildroot.org/buildroot/-/jobs/4795673788  |      
               stm32f469_disco_sd | https://gitlab.com/buildroot.org/buildroot/-/jobs/4795673789  |      
              stm32f469_disco_xip | https://gitlab.com/buildroot.org/buildroot/-/jobs/4795673790  |      
               stm32f769_disco_sd | https://gitlab.com/buildroot.org/buildroot/-/jobs/4795673791  |      
                  stm32mp157a_dk1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4795673793  |      
                  stm32mp157c_dk2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4795673794  |      
        terasic_de10nano_cyclone5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4795673798  |      
              toradex_apalis_imx6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4795673799  |      
                    versal_vck190 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4749556395  |      
                      visionfive2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4795673806  |      
                zynqmp_kria_kv260 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4749556414  |      
                    zynqmp_zcu102 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4749556417  |      
                    zynqmp_zcu106 | https://gitlab.com/buildroot.org/buildroot/-/jobs/4749556420  |      



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
