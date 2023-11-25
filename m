Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E472C61DF7
	for <buildroot@archiver.kernel.org>; Sat, 25 Nov 2023 06:37:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3EA3D60AFF;
	Sat, 25 Nov 2023 06:37:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3EA3D60AFF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dO9H8w-Qx4DB; Sat, 25 Nov 2023 06:37:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2C12760BD6;
	Sat, 25 Nov 2023 06:37:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2C12760BD6
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2D9731BF39E
 for <buildroot@lists.busybox.net>; Sat, 25 Nov 2023 06:37:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E066840193
 for <buildroot@lists.busybox.net>; Sat, 25 Nov 2023 06:36:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E066840193
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ddHWPvaWVouK for <buildroot@lists.busybox.net>;
 Sat, 25 Nov 2023 06:36:58 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E0C8040160
 for <buildroot@buildroot.org>; Sat, 25 Nov 2023 06:36:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E0C8040160
Received: by mail.gandi.net (Postfix) with ESMTPSA id EA3ECE0005
 for <buildroot@buildroot.org>; Sat, 25 Nov 2023 06:36:54 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sat, 25 Nov 2023 06:36:54 -0000
X-GND-Sasl: bot@bootlin.com
Message-Id: <20231125063659.E066840193@smtp2.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1700894215; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=GXhhBMCMp9MbWnIlX8nmhzSDLEMhEVKTQNhCeoA6Tes=;
 b=F9M/pWUKd//NEv6OGimUE+1m20ZudhYMISf738s9R9WOlsrgSExiYaJFdq5jQGiHICtEzw
 DLRpJ/iXPeIdBIMibCKi8igXRbIvvtOcQUjqsODgYySLf3kmBA85iv1QLXBD/n0FTRHO/5
 Hcm52odwjuL5c2ya/ly0bBgwkjeBdsOFLCseI0Jj3mhw7fWyL+Eg40WjgesrE0Q/3bRfyF
 mz5PafMknh9eKRG3i9MKkksinxs6xvUDEsGOMmg+sgjruSkMvrNHGwOAo7ssKaCnSHXxel
 wgJv36NxyHcWahHgmWY42bqdsemgyjNF09YBe7SROrk7MQOEeUAwC/KiNkdowA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=F9M/pWUK
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-11-24
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

Autobuild statistics for 2023-11-24
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  |  9  |  2  |  0  | 11  |
  2023.08.x  |  3  |  2  |  0  |  5  |
    master   | 41  | 49  |  0  | 90  |

Classification of failures by reason for master
-----------------------------------------------

                elfutils-0.189 | 3 
                   linux-6.6.1 | 3 
                   openrc-0.51 | 3 
          python-msgpack-1.0.7 | 3 
                       unknown | 3 
                host-go-1.21.4 | 2 
              libarchive-3.7.2 | 2 
                libressl-3.8.2 | 2 
                libselinux-3.5 | 2 
             strongswan-5.9.11 | 2 
                  acpid-2.0.34 | 1 
android-tools-4.2.2+git2013... | 1 
             bluez5_utils-5.68 | 1 
                    brltty-6.6 | 1 
fs/jffs2/jffs2.mk:71: /home... | 1 
           ghostscript-10.02.0 | 1 
glibc-2.38-27-g750a45a78390... | 1 
  gobject-introspection-1.76.1 | 1 
              host-rust-1.71.1 | 1 
kvmtool-f77d646ba01d04be5aa... | 1 
            libmemcached-1.1.4 | 1 
               libunwind-1.6.2 | 1 
          linux-5.10.162-cip24 | 1 
              liquid-dsp-1.5.0 | 1 
          lttng-modules-2.13.7 | 1 
 Makefile:727: target-finalize | 1 
               mariadb-10.11.4 | 1 
                    ngrep-1.47 | 1 
                nushell-0.85.0 | 1 
    python-cryptography-39.0.2 | 1 
         python-pymupdf-1.22.0 | 1 
                  reaver-1.6.6 | 1 
               valgrind-3.22.0 | 1 
                xenomai-3.0.10 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |          acpid-2.0.34          | NOK | http://autobuild.buildroot.net/results/e69495cbf71725fe90002fcb50176590e29aba80 | ORPH
   mips64    | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/fc01c5c6fab6702404fd36495dbc5f3748938216 |     
    sh4      |       bluez5_utils-5.68        | NOK | http://autobuild.buildroot.net/results/b365a05192e5446b3befb5900bafc72a4a1e8d57 |     
  powerpc    |           brltty-6.6           | NOK | http://autobuild.buildroot.net/results/705a661c351a505db059da56d1cc225d46ef9ec6 |     
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/2c776985c5574bc9d19c5d3c9f98039eca489ee7 | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/11fe959ed31f6131a92786b4b170fd776f265694 | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/e341529158845950db6427b2cc96276da48b588a | ORPH
  riscv32    | fs/jffs2/jffs2.mk:71: /home... | NOK | http://autobuild.buildroot.net/results/0f091d4ce08cfe48c81ce778eebe68dcfdec3746 |     
    sh4      |      ghostscript-10.02.0       | NOK | http://autobuild.buildroot.net/results/a1e9dc4f3c48f32488538b32cdc89cf5ee395c77 |     
 powerpc64   | glibc-2.38-27-g750a45a78390... | NOK | http://autobuild.buildroot.net/results/46b24205dfd23dc95ee16f559964cbb70727b3ab |     
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/ba1b9cbce45391ed1cc1620fba2029c4a3bbfbd1 | ORPH
  mips64el   |         host-go-1.21.4         | NOK | http://autobuild.buildroot.net/results/395c868681f8465084dd7a0749ac8e6bef486e81 |     
   s390x     |         host-go-1.21.4         | NOK | http://autobuild.buildroot.net/results/334513ee6a40d35f5718f460010cb1e07a542e0a |     
  sparc64    |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/b2893d23c74058c106e89b7ca150f1c089a582a9 |     
    i686     | kvmtool-f77d646ba01d04be5aa... | NOK | http://autobuild.buildroot.net/results/f1b77cfdb9ff9564d9cd6c96f8de860d39a0a394 | ORPH
 powerpc64   |        libarchive-3.7.2        | NOK | http://autobuild.buildroot.net/results/55273bbae944400852ed91e8805a3f8ab3476f43 |     
 microblaze  |        libarchive-3.7.2        | NOK | http://autobuild.buildroot.net/results/a57378dec7b627d213afe9521bf3fcfb828103d2 |     
    m68k     |       libmemcached-1.1.4       | NOK | http://autobuild.buildroot.net/results/1ad9f449b15f3218cff2737241eb2797c2942455 | ORPH
   sh4eb     |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/1e79070421bb8406b2869478a1b9805edd4ac966 | ORPH
   arceb     |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/206f4384c0c5540f32b98e9247912e513ab696ca | ORPH
   mipsel    |         libselinux-3.5         | NOK | http://autobuild.buildroot.net/results/52c8b390d2ba41fb39606b773e01296614b49866 |     
   nios2     |         libselinux-3.5         | NOK | http://autobuild.buildroot.net/results/aca8d3b3d6be0ba7b3c39f7ad779ef728ebb9380 |     
   mips64    |        libunwind-1.6.2         | NOK | http://autobuild.buildroot.net/results/551ac02c9fa7414c625d0b7f42d6d78d0f320ff5 | ORPH
  riscv64    |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/2a514403859662afc8b2202953cc9cb429db56fd | ORPH
   nios2     |          linux-6.6.1           | NOK | http://autobuild.buildroot.net/results/575f32c220dd334d10d1750c79a41f66afcbe3ad | ORPH
   nios2     |          linux-6.6.1           | NOK | http://autobuild.buildroot.net/results/6251e033a883aa4783cc002d7b263cdf0b46311c | ORPH
   mipsel    |          linux-6.6.1           | NOK | http://autobuild.buildroot.net/results/95e22b8380a1ed612bf31fde95bc74c59eaf5236 | ORPH
    arm      |        liquid-dsp-1.5.0        | NOK | http://autobuild.buildroot.net/results/e4ee84de180cfb1c8179b9ca615393406656cc20 |     
   arceb     |      lttng-modules-2.13.7      | NOK | http://autobuild.buildroot.net/results/257c385ca034e3b7dbff3c4dff5d5d1477309c33 |     
  powerpc    | Makefile:727: target-finalize  | NOK | http://autobuild.buildroot.net/results/09d21f25421641f674d4995997f9983f7f4ead37 |     
 microblaze  |        mariadb-10.11.4         | NOK | http://autobuild.buildroot.net/results/3af7288d3be096f7d2e79766b2f7cd118e2938b4 | ORPH
    i686     |           ngrep-1.47           | NOK | http://autobuild.buildroot.net/results/75f70425646de43a87212b16bd42c0e3dfc422b8 |     
  sparc64    |         nushell-0.85.0         | NOK | http://autobuild.buildroot.net/results/ec8cc92780756db32d71b390182f3df845e32a4c |     
   xtensa    |          openrc-0.51           | NOK | http://autobuild.buildroot.net/results/331dfa308d28c464fac2740d4457866cf2607706 |     
   arceb     |          openrc-0.51           | NOK | http://autobuild.buildroot.net/results/eecdcecd9641e37195c7c08be894f3d7209dfeb6 |     
   x86_64    |          openrc-0.51           | NOK | http://autobuild.buildroot.net/results/5e74ff5f3a01227cb36781ecd5c102fc0352be65 |     
   armeb     |   python-cryptography-39.0.2   | NOK | http://autobuild.buildroot.net/results/c351242fe81ce31522dfe192ced2f026595c7da7 |     
    i686     |      python-msgpack-1.0.7      | NOK | http://autobuild.buildroot.net/results/ac1d1fa4bb33702c06f9c37d9db893094cbc19e3 |     
   x86_64    |      python-msgpack-1.0.7      | NOK | http://autobuild.buildroot.net/results/f2638e6ee4b1fc46fdd980ff14a68a02beb40734 |     
microblazeel |      python-msgpack-1.0.7      | NOK | http://autobuild.buildroot.net/results/1320448392861a8f17a0448f8d0286ad0a607513 |     
   mips64    |     python-pymupdf-1.22.0      | NOK | http://autobuild.buildroot.net/results/909500d11c9c93f312d03e74bda37a5ec2ac4094 |     
   arceb     |          reaver-1.6.6          | NOK | http://autobuild.buildroot.net/results/b8a51cf1dd20c307b01a38b0c54f366fe48c9477 |     
  aarch64    |       strongswan-5.9.11        | NOK | http://autobuild.buildroot.net/results/3d5cb3884ef44044151798090acf16f812ad0fbf |     
  sparc64    |       strongswan-5.9.11        | NOK | http://autobuild.buildroot.net/results/d25ab4a2358541342044b3840de31758f3e7d782 |     
  sparc64    |            unknown             | NOK | http://autobuild.buildroot.net/results/d8e3770881cacde50ecb90b6efaa999dcc796257 |     
 aarch64_be  |            unknown             | NOK | http://autobuild.buildroot.net/results/66d3ad7794c3f9dfa6724cc3317a8a1ce0746f8e |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/11f5bef83d6e7f5d4e61e6846464081167ebe4ee |     
    mips     |        valgrind-3.22.0         | NOK | http://autobuild.buildroot.net/results/0df69f4d74f5916b8067087293d89b1726bfdbdc | ORPH
    i586     |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/79dae7e693f399b80fc0446336561bbcdb25c919 |     


Classification of failures by reason for 2023.02.x
--------------------------------------------------

  gobject-introspection-1.72.0 | 1 
               libglib2-2.72.3 | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mipsel    |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/0deaf43d022b3a23e832567c5b051418cce6e14f | ORPH
   arceb     |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/117694ccc65b0207f8f345e81026242d970d0fd2 |     


Classification of failures by reason for 2023.08.x
--------------------------------------------------

                 coreutils-9.3 | 1 
                elfutils-0.189 | 1 


Detail of failures for 2023.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sh4eb     |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/9d870dbe2411372d1576f76260fcba1534472540 | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/34f75df4fc29db28e81971d8226d36e05b15dfe7 | ORPH


Gitlab CI results for 2023-11-24
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
                          beaglev | https://gitlab.com/buildroot.org/buildroot/-/jobs/5601042816  |      
               broadcom_northstar | https://gitlab.com/buildroot.org/buildroot/-/jobs/5601042820  |      
              freescale_imx8mpevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/5601042873  |      
                       imx8mmpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/5601042909  |      
                        imx8mpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/5601042912  |      
                        imx8mqevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/5601042913  |      
               kontron_pitx_imx8m | https://gitlab.com/buildroot.org/buildroot/-/jobs/5601042917  |      
              octavo_osd32mp1_brk | https://gitlab.com/buildroot.org/buildroot/-/jobs/5601042967  |      
              octavo_osd32mp1_red | https://gitlab.com/buildroot.org/buildroot/-/jobs/5601042969  |      
                   orangepi_lite2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5601043018  |      
                orangepi_one_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/5601043025  |      
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/5601043178  | ORPH 
             sipeed_licheepi_nano | https://gitlab.com/buildroot.org/buildroot/-/jobs/5601043214  |      
               snps_arc700_axs101 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5601043232  |      
                 snps_arc700_nsim | https://gitlab.com/buildroot.org/buildroot/-/jobs/5601043234  |      
                socrates_cyclone5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5601043242  |      
              toradex_apalis_imx6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5608851813  |      



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
