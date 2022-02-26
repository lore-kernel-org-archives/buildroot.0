Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 214AFC433EF
	for <buildroot@archiver.kernel.org>; Sat, 26 Feb 2022 07:10:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 88EFE60B8C;
	Sat, 26 Feb 2022 07:10:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aycczUYOGTt8; Sat, 26 Feb 2022 07:10:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7AA6860B04;
	Sat, 26 Feb 2022 07:10:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B626C1BF574
 for <buildroot@lists.busybox.net>; Sat, 26 Feb 2022 07:10:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9D09E400D7
 for <buildroot@lists.busybox.net>; Sat, 26 Feb 2022 07:10:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ETazZ3KP1iGL for <buildroot@lists.busybox.net>;
 Sat, 26 Feb 2022 07:10:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 734D240018
 for <buildroot@buildroot.org>; Sat, 26 Feb 2022 07:10:12 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 9E0731C000A
 for <buildroot@buildroot.org>; Sat, 26 Feb 2022 07:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1645859409; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=4Siypal+KpV+PjnAUZnA/W2JpnNXh6rLLjQ43Z8OtpU=;
 b=OGZX1LUFBm4MuTehNxytd/N6VZnpUg+678TrbaR6Tbi7lieTbDBHdIxs0wn5CLIUQLGqMz
 bPxXW10hLixkucJZIjAO3zP3Huh6nHClAgmb0simTvYcYZyMkwRwjvjiAQGgBi/9CxO1MJ
 eCD51FC1883UpOaNcdg9RT/qZ7LH8r9WuqKkV6LeBWFoRN4y70kJOIU4D3nyh+HGpTzObw
 Q1uP3g6Md10WvHEgowle8qRUAbVVwUKpH8zMZn07WrbmvwvDfrByOkC5uO8zT8+JshX/b1
 xcD5ODc1Wkt5IW08gJCU+iKEN8TOe1CXi++Yiv4O6O159+3TkybHIp1UlBg4Kg==
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sat, 26 Feb 2022 07:10:09 -0000
Message-Id: <20220226071014.9D09E400D7@smtp2.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-02-25
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

Autobuild statistics for 2022-02-25
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 38  |  9  |  0  | 47  |
  2021.11.x  |  8  |  1  |  0  |  9  |
    master   | 46  | 20  |  0  | 66  |

Classification of failures by reason for master
-----------------------------------------------

           host-libselinux-3.3 | 8 
             bluez5_utils-5.63 | 2 
                       frr-8.1 | 2 
                bpftool-v6.7.0 | 1 
                host-go-1.17.7 | 1 
                mongodb-4.2.18 | 1 
         python-greenlet-1.1.2 | 1 
rpi-userland-14b90ff9d9f031... | 1 
                safeclib-3.7.1 | 1 
                       unknown | 1 
                  zabbix-5.4.9 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |       bluez5_utils-5.63        | NOK | http://autobuild.buildroot.net/results/15ba9902c04c4c84dbaee60dcc4414a696c7ece5 |     
  riscv64    |       bluez5_utils-5.63        | NOK | http://autobuild.buildroot.net/results/f8b503b6883c720d09090cb2008e16db0084b5e9 |     
  mips64el   |         bpftool-v6.7.0         | NOK | http://autobuild.buildroot.net/results/a7922ec37a9e05786ede3017510b44113654f927 |     
  powerpc    |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/b4bb0da9b401a705830b77826c6850725cb62d02 |     
microblazeel |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/479ba2dcc6dfc314b4622ffbb4063289e22f42b1 |     
  mips64el   |         host-go-1.17.7         | NOK | http://autobuild.buildroot.net/results/49f804b3b35ba8df0ed5c23653c5e9e086fbde74 |     
  riscv32    |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/fe12e7e97d8815da1c9129b95f017037a92788da |     
    arm      |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/9833b73141508eef27db00409248115cadde9ce6 |     
  riscv64    |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/6923ad7079e021c92abbcc7ca5e22dc4b01d303d |     
    arc      |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/e5ce889b16b9471f7c7572fd87c55fc75e955745 |     
    arm      |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/0c941e5b1adecba3e5e7cef21d9dffe7d9179793 |     
  powerpc    |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/0b030f3c672b42ad4a7cdaaf4dd9c5cc106a0c94 |     
    arc      |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/0619e77bc8e9e19e0263243ec0e3468795987f88 |     
   sparc     |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/6060631050e50bf5d28605c1709d167d3b52c7d7 |     
   x86_64    |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/1030178eb64f57b89d891b6e6327e2b718a91083 |     
    arm      |     python-greenlet-1.1.2      | NOK | http://autobuild.buildroot.net/results/554aae1ba9019d81226c29d3d6f46ecfc4772fdb |     
    arm      | rpi-userland-14b90ff9d9f031... | NOK | http://autobuild.buildroot.net/results/93d3b8cc2ac5dfa9d4b44946c0b4d8171e8f52a1 |     
  aarch64    |         safeclib-3.7.1         | NOK | http://autobuild.buildroot.net/results/30d0085edf0bfa1c1047ba0f4b4edc6804c00ff4 |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/9d2a8c58eaad3250ab6ea1f277fe92518800f9fc |     
powerpc64le  |          zabbix-5.4.9          | NOK | http://autobuild.buildroot.net/results/0f541e45d1fa27b3302968683bf64949131ec1c9 |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

        host-sentry-cli-1.57.0 | 2 
          gstreamer1-mm-1.10.0 | 1 
                 mesa3d-20.3.5 | 1 
monkey-f54856ce250c4e257354... | 1 
               netatalk-3.1.12 | 1 
                rocksdb-6.13.3 | 1 
          sphinxbase-5prealpha | 1 
                       unknown | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/1f19aa2777151b6cb8c8022bc51d1d5ad682f5c7 | ORPH
    m68k     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/3ab387ede80634241997603574a399b1074d9089 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/e20145ef18ea9240916098f8329ece97e79d8f74 |     
    mips     |         mesa3d-20.3.5          | NOK | http://autobuild.buildroot.net/results/819a47bea8c86105dba6e1cc78a7730eb3939a87 |     
   x86_64    | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/aa83829885e5fb0b53d2d5c31c97f1a09ee00baf |     
  riscv32    |        netatalk-3.1.12         | NOK | http://autobuild.buildroot.net/results/e26284c60787d7693de5dd85e940769ca604d823 | ORPH
    m68k     |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/23872a71a7c6b8e5ef325ba08ac86d9745458964 |     
  nds32le    |      sphinxbase-5prealpha      | NOK | http://autobuild.buildroot.net/results/697d71740041abefe40064646c65f452f1ffd22f |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/9b691643113bd4c557c276509eb9d4f7895c111c |     


Classification of failures by reason for 2021.11.x
--------------------------------------------------

                       unknown | 1 


Detail of failures for 2021.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/8038a02d37fd769b47159e3341781b0195888a10 |     


Gitlab CI results for 2022-02-25
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
                amarula_a64_relic | https://gitlab.com/buildroot.org/buildroot/-/jobs/2131158364  |      
                      bananapi_m1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2131158422  |      
                 bananapi_m1_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/2131158424  |      
                 bananapi_m2_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/2131158425  |      
                        bananapro | https://gitlab.com/buildroot.org/buildroot/-/jobs/2131158430  |      
                     csky_gx6605s | https://gitlab.com/buildroot.org/buildroot/-/jobs/2131158442  |      
              freescale_imx8mqevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/2131158478  |      
            friendlyarm_nanopi_m1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2131158488  | ORPH 
       friendlyarm_nanopi_m1_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/2131158489  | ORPH 
           friendlyarm_nanopi_neo | https://gitlab.com/buildroot.org/buildroot/-/jobs/2131158493  |      
     friendlyarm_nanopi_neo_plus2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2131158494  |      
            friendlyarm_nanopi_r1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2131158495  |      
                          galileo | https://gitlab.com/buildroot.org/buildroot/-/jobs/2131158497  |      
                       imx8mmpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/2131158513  |      
                        imx8mpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/2131158514  |      
                    licheepi_zero | https://gitlab.com/buildroot.org/buildroot/-/jobs/2131158522  |      
      microchip_sam9x60ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/2131158528  |      
                orangepi_one_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/2131158573  |      
                    orangepi_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/2131158577  | ORPH 
                  orangepi_rk3399 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2131158581  |      
                     orangepi_win | https://gitlab.com/buildroot.org/buildroot/-/jobs/2131158584  |      
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/2131158669  |      



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
