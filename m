Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98A41C46CD2
	for <buildroot@archiver.kernel.org>; Wed, 24 Jan 2024 06:59:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E8CD0612B4;
	Wed, 24 Jan 2024 06:59:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E8CD0612B4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NkgCOSoZmKuw; Wed, 24 Jan 2024 06:59:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EF5186140C;
	Wed, 24 Jan 2024 06:59:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EF5186140C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8E06E1BF20B
 for <buildroot@lists.busybox.net>; Wed, 24 Jan 2024 06:59:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4A8E484D57
 for <buildroot@lists.busybox.net>; Wed, 24 Jan 2024 06:59:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4A8E484D57
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VLXnVqEcRLF1 for <buildroot@lists.busybox.net>;
 Wed, 24 Jan 2024 06:59:43 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3BF3C84D26
 for <buildroot@buildroot.org>; Wed, 24 Jan 2024 06:59:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3BF3C84D26
Received: by mail.gandi.net (Postfix) with ESMTPSA id 343001C000C
 for <buildroot@buildroot.org>; Wed, 24 Jan 2024 06:59:40 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Wed, 24 Jan 2024 06:59:40 -0000
X-GND-Sasl: bot@bootlin.com
Message-Id: <20240124065945.4A8E484D57@smtp1.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1706079580; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=nC/QT5vltUYwql4wIHq7yg4TITXJnqbtVm2odBRNjws=;
 b=ef7fQSLb3It/vXndeZ7+IoXx+ZZ8e0iOUFZeL6lLP0boCP1pZyabDqwPWB6yrKEBaFEaDy
 wJLhb/O+GKpRNJ8HTNdMLcbZNP7Fdi0u6sUB2/ulWh3hjM3yxm3pCvopRpHkf55bNgVBF3
 K8wvhlIS/ahbS5ReY0cAa8HriChflMT1plQ7bhzBoQi0CEq+cBVgfna6KLNawO3TXIJxTu
 uavjqgXXZeJTBhaveZH/WEJ4M7UT2tNUZmSyUlUoCJDW4aHWvnZWnm7b9Gy6b+u+o3Y4cY
 qLLfpNP/Q8irUg1eqVzu3Hihnc+5xxMG+dQlAPFE07BkknOflzx0bdBKKh1rnA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ef7fQSLb
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2024-01-23
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

Autobuild statistics for 2024-01-23
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  |  0  |  2  |  0  |  2  |
  2023.11.x  |  2  |  5  |  0  |  7  |
    master   | 50  | 57  |  0  | 107 |

Classification of failures by reason for master
-----------------------------------------------

                libressl-3.8.2 | 7 
                    attr-2.5.2 | 5 
  gobject-introspection-1.76.1 | 4 
glibc-2.38-27-g750a45a78390... | 3 
              libarchive-3.7.2 | 3 
                  linux-6.6.11 | 3 
check-11970a7e112dfe243a2e6... | 2 
       freeradius-server-3.2.3 | 2 
               ipmitool-1_8_19 | 2 
              libopenssl-3.2.0 | 2 
                 openssh-9.6p1 | 2 
                    proj-9.3.0 | 2 
                  rygel-0.40.2 | 2 
                  stunnel-5.71 | 2 
                 sudo-1.9.15p5 | 2 
           dmraid-1.0.0.rc16-3 | 1 
                  faad2-2.11.1 | 1 
              host-rust-1.74.1 | 1 
        host-sentry-cli-2.20.3 | 1 
                libselinux-3.5 | 1 
                   libzlib-1.3 | 1 
        ltp-testsuite-20230929 | 1 
                    ngrep-1.47 | 1 
                  ntp-4.2.8p17 | 1 
    python-cryptography-39.0.2 | 1 
                ripgrep-14.1.0 | 1 
rtl8822cs-2e4e99ae1502b173a... | 1 
                       unknown | 1 
                xenomai-3.0.10 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |           attr-2.5.2           | NOK | http://autobuild.buildroot.net/results/adc24a365e063984eb645871f2235b76b4148ef4 |     
microblazeel |           attr-2.5.2           | NOK | http://autobuild.buildroot.net/results/c6f7bf0cd77b365453787fdf5821d667a97f672e |     
microblazeel |           attr-2.5.2           | NOK | http://autobuild.buildroot.net/results/e45628765c7e67b5ed150d69fb16b69a51f141e7 |     
 microblaze  |           attr-2.5.2           | NOK | http://autobuild.buildroot.net/results/f96ce167588e173070211bb201c4abda83f80f17 |     
 microblaze  |           attr-2.5.2           | NOK | http://autobuild.buildroot.net/results/ceda670e09244e93e4c9369be890ee1045b1782e |     
   mipsel    | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/54247bbeb372264df97cef61d3743a4c45b07188 | ORPH
   armeb     | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/1dee1721bfa2243f49c9ed8b2d73b4f1410090db | ORPH
   armeb     |      dmraid-1.0.0.rc16-3       | NOK | http://autobuild.buildroot.net/results/aab61b2c351408bd5583fdca4de1da7f6f212b31 | ORPH
   armeb     |          faad2-2.11.1          | NOK | http://autobuild.buildroot.net/results/838808b4751244ee01cde6b8261212b49e511a32 |     
powerpc64le  |    freeradius-server-3.2.3     | NOK | http://autobuild.buildroot.net/results/d3b20ef0889e0ba8f7af2af33198f056877fb93c |     
   arceb     |    freeradius-server-3.2.3     | NOK | http://autobuild.buildroot.net/results/ff20984354465e9d6e16a0ad8170ed3755332100 |     
 powerpc64   | glibc-2.38-27-g750a45a78390... | NOK | http://autobuild.buildroot.net/results/ff697248b16a2410f5d22b8176c5f3cfaad1565e |     
powerpc64le  | glibc-2.38-27-g750a45a78390... | NOK | http://autobuild.buildroot.net/results/bb59a55a996d6dd80b8d50c211bb0e32831897d1 |     
powerpc64le  | glibc-2.38-27-g750a45a78390... | NOK | http://autobuild.buildroot.net/results/a3297b37c856b07188465e7691f7e07dca578ab4 |     
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/85bf5810d3842fff30eb06e9a6a2ced1e66e7e0d | ORPH
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/a16a0df82ae61d573529b654c3fdfec5b2dd9e73 | ORPH
    m68k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/92fc2304a0039c2821e41532d6c9f1c7482d586b | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/6126a8b723ddfd9b7e07c8da3253c7a2b71ab2dc | ORPH
    i686     |        host-rust-1.74.1        | NOK | http://autobuild.buildroot.net/results/6da7d7248d6e7e3cff483eaa5b18d512db075734 |     
   x86_64    |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/03520e5c9ae76dc7c8e06bd497b47e4a81dce841 |     
  aarch64    |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.net/results/4db092a2c92d9c20f75de09c4a10c6929775893d |     
 microblaze  |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.net/results/86437c603a714a5e600307ce7046fec23653d533 |     
 microblaze  |        libarchive-3.7.2        | NOK | http://autobuild.buildroot.net/results/ad95d8dede60d7d10933979fb4bd92b26d1305f2 |     
   x86_64    |        libarchive-3.7.2        | NOK | http://autobuild.buildroot.net/results/b440b872f158e0c1bb2f433a84e5880b6463eaf4 |     
   s390x     |        libarchive-3.7.2        | NOK | http://autobuild.buildroot.net/results/4b5c8ffc6dc03aacfa36a16f5b8b5c744748ebfb |     
    arm      |        libopenssl-3.2.0        | NOK | http://autobuild.buildroot.net/results/393163448fcc6f8ac9c59ff5906c4fe407111560 | ORPH
   s390x     |        libopenssl-3.2.0        | NOK | http://autobuild.buildroot.net/results/5ffa2d223062b21603097026732f87c4fd613cd0 | ORPH
  mips64el   |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/775fe32a4437f82ba291066119858792ad9d2b84 | ORPH
   mipsel    |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/f60ee4358adc52055eb683861711342150ba95cc | ORPH
  mips64el   |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/65d2578cf8106f0c68bffc126b7014bd2c7b16c2 | ORPH
   mips64    |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/03908d98cd7e4f6f991160cbd1cad61a417e0a24 | ORPH
    or1k     |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/67196b63e634ff498e7e86a871c9f8e9ebed2ae6 | ORPH
powerpc64le  |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/76a5ac535b49a154b42af3b5fad0ce797dda52bc | ORPH
   nios2     |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/31ec815cfc1f16547f176fa29ac116504219827b | ORPH
 microblaze  |         libselinux-3.5         | NOK | http://autobuild.buildroot.net/results/bf7de0e87b36a50968a705e5107b70c40ff12e20 |     
  mips64el   |          libzlib-1.3           | NOK | http://autobuild.buildroot.net/results/b218c8dc05cebdd1591f844e5c51a5a8e8948edb | ORPH
powerpc64le  |          linux-6.6.11          | NOK | http://autobuild.buildroot.net/results/c8da39f12f4682238d136ed42530c224184c5cdd | ORPH
 aarch64_be  |          linux-6.6.11          | NOK | http://autobuild.buildroot.net/results/d43f6d16d84801bf184ae069aaa659df9700c7eb | ORPH
   mipsel    |          linux-6.6.11          | NOK | http://autobuild.buildroot.net/results/7e4afefd57c853ff2bfb38169d93208ce1ba89fb | ORPH
   x86_64    |     ltp-testsuite-20230929     | NOK | http://autobuild.buildroot.net/results/7dd21ae8a3e231f732ea54364193cc0ac023e414 |     
  riscv32    |           ngrep-1.47           | NOK | http://autobuild.buildroot.net/results/08a50c03468cac597659691687ebd5d90a2864b3 |     
    sh4a     |          ntp-4.2.8p17          | NOK | http://autobuild.buildroot.net/results/94d89f7e8092af649423f4f763cb434eb1653d7d |     
powerpc64le  |         openssh-9.6p1          | NOK | http://autobuild.buildroot.net/results/d084a820ca57610c2dcec40b4a8b1620c69d27bf | ORPH
   mipsel    |         openssh-9.6p1          | NOK | http://autobuild.buildroot.net/results/80d1ff06676d38a382f4ee75af4bb620687f5ad2 | ORPH
   sparc     |           proj-9.3.0           | NOK | http://autobuild.buildroot.net/results/ab25ddc0f8b2745daad91698fec6c6021fff4336 |     
    mips     |           proj-9.3.0           | NOK | http://autobuild.buildroot.net/results/2de550a7d7ff7caa361eba290ebc2378ba323f36 |     
  sparc64    |   python-cryptography-39.0.2   | NOK | http://autobuild.buildroot.net/results/f3b7bad51a2ea063b7499b9c15bdfc54f340d7c5 |     
   armeb     |         ripgrep-14.1.0         | NOK | http://autobuild.buildroot.net/results/d15a4d8d972193379129e58c76f38303b505fcfd |     
   x86_64    | rtl8822cs-2e4e99ae1502b173a... | NOK | http://autobuild.buildroot.net/results/b4f34e622410a59943fa763148da1115cea0932d |     
   x86_64    |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/0f9b81be869c0eb136734220c55056adaf805834 |     
    arm      |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/e47449a98fa910fd7341ca9f00ca4990dfd654bf |     
 microblaze  |          stunnel-5.71          | NOK | http://autobuild.buildroot.net/results/6ba486f570dc83abbd922612530169e608f3b8c2 |     
   xtensa    |          stunnel-5.71          | NOK | http://autobuild.buildroot.net/results/46a8b1465283478e86945a6274a9aea2b3127a97 |     
   sh4eb     |         sudo-1.9.15p5          | NOK | http://autobuild.buildroot.net/results/34974281b8f59f2e41a4ee4ff464362c3964c2ac | ORPH
    mips     |         sudo-1.9.15p5          | NOK | http://autobuild.buildroot.net/results/f413d0eb3163f6b0f7412ea507c752aa5e22b696 | ORPH
   mips64    |            unknown             | NOK | http://autobuild.buildroot.net/results/fdf256fb50811d7b12f1bc5ede6e3df6e4b91194 |     
 powerpc64   |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/8096854cf934fe294d1c3e3c750ae6ae7a8c6b70 |     


Classification of failures by reason for 2023.02.x
--------------------------------------------------

                  check-0.15.2 | 1 
                       unknown | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 aarch64_be  |          check-0.15.2          | NOK | http://autobuild.buildroot.net/results/2394ab8c977ffdb63a3bc337f4772048e64c1c65 | ORPH
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/9ed016c1fea348c028832ec82397b2892663ec0c |     


Classification of failures by reason for 2023.11.x
--------------------------------------------------

                host-go-1.21.6 | 1 
              host-rust-1.71.1 | 1 
 Makefile:727: target-finalize | 1 
            micropython-1.22.0 | 1 
                 openssh-9.6p1 | 1 


Detail of failures for 2023.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |         host-go-1.21.6         | NOK | http://autobuild.buildroot.net/results/845036669713152565b7af3f9f3d8dde036d506f |     
   mipsel    |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/75ee28a184d3d14eb7e88c3c4811b69d09342c79 |     
 powerpc64   | Makefile:727: target-finalize  | NOK | http://autobuild.buildroot.net/results/82a4c6ebbb6b0aa36d3ff7c06a975351a2bd04c7 |     
    i586     |       micropython-1.22.0       | NOK | http://autobuild.buildroot.net/results/ad893ab5244b58b60949deb6e2d6365b15a053c1 |     
    mips     |         openssh-9.6p1          | NOK | http://autobuild.buildroot.net/results/c4f2ea7aebca8a26f6c4fd44abb1902605af9cef | ORPH



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
