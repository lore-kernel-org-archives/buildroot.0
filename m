Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13727C4345F
	for <buildroot@archiver.kernel.org>; Sat, 27 Apr 2024 04:08:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7339441D11;
	Sat, 27 Apr 2024 04:08:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DYGKQEd0oKp8; Sat, 27 Apr 2024 04:08:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B66FF403A4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B66FF403A4;
	Sat, 27 Apr 2024 04:08:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BEACD1BF846
 for <buildroot@lists.busybox.net>; Sat, 27 Apr 2024 04:08:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AB31A61292
 for <buildroot@lists.busybox.net>; Sat, 27 Apr 2024 04:08:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5nv9iXgZGpXe for <buildroot@lists.busybox.net>;
 Sat, 27 Apr 2024 04:08:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D39BB6126D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D39BB6126D
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D39BB6126D
 for <buildroot@buildroot.org>; Sat, 27 Apr 2024 04:08:10 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 52DC2E000C
 for <buildroot@buildroot.org>; Sat, 27 Apr 2024 04:08:08 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sat, 27 Apr 2024 04:08:08 -0000
X-GND-Sasl: bot@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1714190888; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=rYd6PbTYsNvtlqqJrHYNG6LGhsuel77czUT7wLUr8NY=;
 b=bazlVJwk/Y2yIsENMgw39YWohlM9e5nGh+dBPKwdybsq5l8qukR9vSk3ei2wFzpj8qn8VT
 vbnJM90Qrsu1VCc8rZGzN7OCtdmAoF5s46zX2I2QOXxQ+TqnWaue4OPPnWvtUUWySQxlp8
 T1NeuFotMtj6nPUZR++xdGJ9bJs1hGf4giIMv1pw19GJ/o3RwI4jDETPYRshfhgqOyIDU0
 ZKBwaNELJovltDKBVwBtKRMsQauhuBNCGIfpt7+SK7IW67ZhBPFNLg6aBnnnjar+YpgE3H
 LemrM9WvZiNzEbI7/xDyBZZNcDGaN04MQwk1cNzY7PWwUXOWyDCiJCE50328pw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=bazlVJwk
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2024-04-26
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
Message-ID: <20240427040808.i_piJZ2V-JTRQEjytODQApElHNzh31Fswp_vcE3v4PI@z>

Hello,

Autobuild statistics for 2024-04-26
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  9  |  4  |  0  | 13  |
    master   | 21  | 30  |  2  | 53  |

Classification of failures by reason for master
-----------------------------------------------

                  acpid-2.0.34 | 2 
               apcupsd-3.14.14 | 2 
                fail2ban-1.0.2 | 2 
         gobject-introspection | 2 
                   linux-6.8.1 | 2 
         python-remi-2022.7.27 | 2 
                       unknown | 2 
                  boost-1.83.0 | 1 
             cni-plugins-1.3.0 | 1 
           dmraid-1.0.0.rc16-3 | 1 
                elfutils-0.189 | 1 
                   foot-1.16.2 | 1 
glibc-2.39-5-ge0910f1d3278f... | 1 
                gnu-efi-3.0.18 | 1 
  gobject-introspection-1.76.1 | 1 
host-heimdal-f4faaeaba371ff... | 1 
        host-sentry-cli-2.20.3 | 1 
              libarchive-3.7.2 | 1 
              libgeotiff-1.7.1 | 1 
                lua-cffi-0.2.3 | 1 
                     mdadm-4.3 | 1 
                  nginx-1.24.0 | 1 
package/python-pillow/pytho... | 1 
               valgrind-3.22.0 | 1 
                    zeek-4.1.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |          acpid-2.0.34          | NOK | http://autobuild.buildroot.net/results/58f375afe0cc33cec9a758b21e5ad3fb4730f468 | ORPH
   mips64    |          acpid-2.0.34          | NOK | http://autobuild.buildroot.net/results/0e7b29b9ab81ae508e7206a2069637a6eebad925 | ORPH
microblazeel |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/b533bedc72b968b389d5e67c6329d3e0ba1e683a |     
   x86_64    |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/54cb0298486daa5d559d1ccd559b9b73ac0b3673 |     
   x86_64    |          boost-1.83.0          | NOK | http://autobuild.buildroot.net/results/aa800dffbecf0c66b173acdf0ad11b4cb2967090 |     
  riscv64    |       cni-plugins-1.3.0        | NOK | http://autobuild.buildroot.net/results/69f60038641a33290e08061deaf1ef56d79e209c |     
   x86_64    |      dmraid-1.0.0.rc16-3       | NOK | http://autobuild.buildroot.net/results/fdd8fe8f04544ac706f6d1b4d3a0a8842c8fb31c | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/42370a18c433da8f0f4ed3519801aabd90d9737c | ORPH
    i586     |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/8af2303b19813d7446bf7a333bb7334b1e651e46 |     
    arm      |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/d772cc5ab33b4821204c0927d9e3052286f1e48d |     
    mips     |          foot-1.16.2           | NOK | http://autobuild.buildroot.net/results/211c0c77245967970eafcf147d3c230a2da239ef |     
  powerpc    | glibc-2.39-5-ge0910f1d3278f... | NOK | http://autobuild.buildroot.net/results/0d05aee63a7a8b721e1aa667cd7fcafb97a81583 |     
  aarch64    |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/6149cfc4f0aadd6de6ace210319f4f41aff245a7 |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/c1b4f21539616e89d64811d23b0c84a9dd344d90 |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/e19a639a667cf30d6bb3de66a0324fcfd0fdb411 |     
    m68k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/f0a0cccc57d5e459657cd9acc7c185e1922ad96d | ORPH
 powerpc64   | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/dee605c71541129a345573138287ac89501a87c0 | ORPH
  powerpc    |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/f3c8205b78069b0b9d4ced716608eed3b1321ff0 |     
 microblaze  |        libarchive-3.7.2        | NOK | http://autobuild.buildroot.net/results/96288092b4cc16156602fc3ef3932063c88e147e |     
    arm      |        libgeotiff-1.7.1        | NOK | http://autobuild.buildroot.net/results/16ca987b39f773ec2fe278d00e141361062a9f67 |     
  powerpc    |          linux-6.8.1           | NOK | http://autobuild.buildroot.net/results/ac5142f8075f211a6ca25dde41537a2cec59919b | ORPH
    mips     |          linux-6.8.1           | NOK | http://autobuild.buildroot.net/results/16b2a4faf412d31890f4fb52f6c10a6a2133a0b3 | ORPH
    or1k     |         lua-cffi-0.2.3         | NOK | http://autobuild.buildroot.net/results/b730e5d03c598bc5f5e271812b040a1e2784a077 |     
   mipsel    |           mdadm-4.3            | NOK | http://autobuild.buildroot.net/results/3a5cabcccb9d89cdd3cd32e156d916ed6191f5ec | ORPH
  riscv32    |          nginx-1.24.0          | NOK | http://autobuild.buildroot.net/results/111888b20d6469fe88467fa99bad847f73c498cd |     
   nios2     | package/python-pillow/pytho... | NOK | http://autobuild.buildroot.net/results/dc694bcec7fbe9510826f902b0813d7157a7f5d3 |     
   mipsel    |     python-remi-2022.7.27      | NOK | http://autobuild.buildroot.net/results/a0118f740851f042d8bf28b0bb1ac31947ceb7df |     
    sh4      |     python-remi-2022.7.27      | NOK | http://autobuild.buildroot.net/results/70d281a1cd621fd0ce251fdb350a9f378ca59a5c |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/1ebd9653407010aca8746ac424976cf7ba39d0cf |     
  riscv32    |            unknown             | NOK | http://autobuild.buildroot.net/results/e7681f38c2736abb424ebc870fae0e77f46e7fbe |     
  mips64el   |        valgrind-3.22.0         | NOK | http://autobuild.buildroot.net/results/f9bba4b83d3631e8e92ed90b67eddcadbbc7d73b | ORPH
    arc      |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/d4a4ac3bf86f188a6a2a0891032c201e1ca32f94 |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

                 dc3dd-7.2.641 | 1 
                    fcft-3.1.6 | 1 
                libressl-3.8.2 | 1 
                 shadow-4.14.3 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   nios2     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/37602507bf666985697ac7334f028c46625b0fb0 | ORPH
  aarch64    |           fcft-3.1.6           | NOK | http://autobuild.buildroot.net/results/57a958bb5c1470fbf905ee822819dc0f8e237e4c |     
   s390x     |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/f39f7e683eb69185cd894441dd6aea62bb3ae731 | ORPH
  mips64el   |         shadow-4.14.3          | NOK | http://autobuild.buildroot.net/results/8b12e5c8e400f32f4256d261b088d4fa65901050 |     


Gitlab CI results for 2024-04-26
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
       acmesystems_aria_g25_128mb | https://gitlab.com/buildroot.org/buildroot/-/jobs/6712161942  |      
       acmesystems_aria_g25_256mb | https://gitlab.com/buildroot.org/buildroot/-/jobs/6712161946  |      
    acmesystems_arietta_g25_128mb | https://gitlab.com/buildroot.org/buildroot/-/jobs/6712161948  |      
    acmesystems_arietta_g25_256mb | https://gitlab.com/buildroot.org/buildroot/-/jobs/6712161951  |      
                   armadeus_apf27 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6712161976  |      
                   armadeus_apf28 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6712161978  |      
                   armadeus_apf51 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6712161981  |      
                  at91sam9260eknf | https://gitlab.com/buildroot.org/buildroot/-/jobs/6712161990  |      
                   at91sam9g20dfc | https://gitlab.com/buildroot.org/buildroot/-/jobs/6712161991  |      
                 at91sam9g45m10ek | https://gitlab.com/buildroot.org/buildroot/-/jobs/6712161993  |      
                     at91sam9rlek | https://gitlab.com/buildroot.org/buildroot/-/jobs/6712161994  |      
                     at91sam9x5ek | https://gitlab.com/buildroot.org/buildroot/-/jobs/6712161995  |      
                 at91sam9x5ek_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/6712161996  |      
                 at91sam9x5ek_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/6712161998  |      
             at91sam9x5ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/6712162003  |      
                 atmel_sama5d3xek | https://gitlab.com/buildroot.org/buildroot/-/jobs/6712162023  |      
                        avenger96 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6712162033  |      
                        bananapro | https://gitlab.com/buildroot.org/buildroot/-/jobs/6712162050  | ORPH 
                   beagleboardx15 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6712162075  |      
                   beaglebone_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6712162149  |      
                          beaglev | https://gitlab.com/buildroot.org/buildroot/-/jobs/6712162169  |      
                      beelink_gs1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6712162188  |      
                  chromebook_snow | https://gitlab.com/buildroot.org/buildroot/-/jobs/6712162236  |      
                             ci20 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6712162245  |      
                      cubieboard2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6712162319  |      
            engicam_imx6qdl_icore | https://gitlab.com/buildroot.org/buildroot/-/jobs/6712162332  |      
        engicam_imx6qdl_icore_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6712162336  |      
        engicam_imx6qdl_icore_rqs | https://gitlab.com/buildroot.org/buildroot/-/jobs/6712162340  |      
              engicam_imx6ul_geam | https://gitlab.com/buildroot.org/buildroot/-/jobs/6712162345  |      
             engicam_imx6ul_isiot | https://gitlab.com/buildroot.org/buildroot/-/jobs/6712162346  |      
           friendlyarm_nanopi_r2s | https://gitlab.com/buildroot.org/buildroot/-/jobs/6712162378  |      
                         imx23evk | https://gitlab.com/buildroot.org/buildroot/-/jobs/6712162387  |      
                        imx8mqevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/6712162409  |      
               kontron_pitx_imx8m | https://gitlab.com/buildroot.org/buildroot/-/jobs/6712162413  |      
                         lego_ev3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6712162417  |      
                          mx25pdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/6712162434  |      
                         mx6cubox | https://gitlab.com/buildroot.org/buildroot/-/jobs/6712162438  |      
              octavo_osd32mp1_brk | https://gitlab.com/buildroot.org/buildroot/-/jobs/6712162451  |      
              octavo_osd32mp1_red | https://gitlab.com/buildroot.org/buildroot/-/jobs/6712162452  |      
                        odroidxu4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6712162454  |      
          olimex_imx233_olinuxino | https://gitlab.com/buildroot.org/buildroot/-/jobs/6712162465  |      
                    openblocks_a6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6712162471  |      
                    orangepi_lite | https://gitlab.com/buildroot.org/buildroot/-/jobs/6712162474  |      
                   orangepi_lite2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6712162472  |      
                orangepi_one_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/6712162476  |      
                      orangepi_pc | https://gitlab.com/buildroot.org/buildroot/-/jobs/6712162479  |      
                      orangepi_r1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6712162483  |      
                           pine64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6712162497  |      
                    pine64_sopine | https://gitlab.com/buildroot.org/buildroot/-/jobs/6712162500  |      
               qemu_arm_versatile | https://gitlab.com/buildroot.org/buildroot/-/jobs/6712162510  |      
                qemu_arm_vexpress | https://gitlab.com/buildroot.org/buildroot/-/jobs/6712162512  |      
               qemu_ppc64_pseries | https://gitlab.com/buildroot.org/buildroot/-/jobs/6712162568  |      
            qemu_ppc64le_powernv8 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6712162570  |      
             qemu_ppc64le_pseries | https://gitlab.com/buildroot.org/buildroot/-/jobs/6712162573  |      
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/6712162617  | ORPH 
                raspberrypizero2w | https://gitlab.com/buildroot.org/buildroot/-/jobs/6712162631  |      
                        riotboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/6712162636  |      
                           rock5b | https://gitlab.com/buildroot.org/buildroot/-/jobs/6712162641  |      
                           rock64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6712162645  |      
                       rock_pi_n8 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6712162647  |      
                       sheevaplug | https://gitlab.com/buildroot.org/buildroot/-/jobs/6712162651  |      
             sipeed_licheepi_nano | https://gitlab.com/buildroot.org/buildroot/-/jobs/6712162655  |      
             sipeed_licheepi_zero | https://gitlab.com/buildroot.org/buildroot/-/jobs/6712162656  |      
               snps_arc700_axs101 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6712162671  |      
                 snps_arc700_nsim | https://gitlab.com/buildroot.org/buildroot/-/jobs/6712162672  | ORPH 
                snps_archs38_hsdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/6722687845  |      
                socrates_cyclone5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6722687872  |      
                solidrun_clearfog | https://gitlab.com/buildroot.org/buildroot/-/jobs/6722687946  |      
              toradex_apalis_imx6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6722690235  |      
                           ts4900 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6722690343  |      
                           ts7680 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6722691009  |      
                      visionfive2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/6722691758  |      
                        wandboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/6722692149  |      
                        warpboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/6722693258  |      



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
