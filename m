Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56776C35274
	for <buildroot@archiver.kernel.org>; Thu, 21 Dec 2023 06:35:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C6AA081DEA;
	Thu, 21 Dec 2023 06:35:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C6AA081DEA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NGDDJcESq0kd; Thu, 21 Dec 2023 06:35:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E883881E76;
	Thu, 21 Dec 2023 06:35:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E883881E76
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5E7781BF310
 for <buildroot@lists.busybox.net>; Thu, 21 Dec 2023 06:35:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1E3E243708
 for <buildroot@lists.busybox.net>; Thu, 21 Dec 2023 06:35:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1E3E243708
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WGCxEv0F2WOw for <buildroot@lists.busybox.net>;
 Thu, 21 Dec 2023 06:35:40 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F0407436ED
 for <buildroot@buildroot.org>; Thu, 21 Dec 2023 06:35:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F0407436ED
Received: by mail.gandi.net (Postfix) with ESMTPSA id CE1F2C000A
 for <buildroot@buildroot.org>; Thu, 21 Dec 2023 06:35:36 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Thu, 21 Dec 2023 06:35:36 -0000
X-GND-Sasl: bot@bootlin.com
Message-Id: <20231221063542.1E3E243708@smtp2.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1703140536; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=oqaSPl9rnHYB4DBFF5dly7eS4VoJdJKodvjFyDYgiwA=;
 b=RlO8kghKNIZLlkzpDDmBO8zSKARyUYJ7j+0xkiHpviwUhdWWFNy+fPmyt6/7HgVY71d3R+
 IgqN7nmnVyPBkFNV9PSOVpcgK51KWD0lmLA+2BMWWnWkx8cB8CxCoaQ48Q64oOxsectBy2
 KKE1YzfW1qM7HxvchPvOcPIiKn9QrzbtOLASM25NNGRogyGc8shp0nlKvYg5mD6L4sZ9M5
 +Vz6y01sA67SyQr+/TbuhLDy+HD9O8MBmJ9ViMeZJGqzG1oA32jqJiJsoECxw34Dhd+0xJ
 skIW6HbLAKSR7RzpU3B57JX9JvAP3DNjFWbYaEuXYa8o6utruxJFbm79Q5WI4w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=RlO8kghK
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-12-20
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

Autobuild statistics for 2023-12-20
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  |  0  |  4  |  1  |  5  |
  2023.08.x  |  2  |  4  |  0  |  6  |
    master   | 12  | 18  |  0  | 30  |

Classification of failures by reason for master
-----------------------------------------------

              libopenssl-3.2.0 | 2 
                  boost-1.83.0 | 1 
check-11970a7e112dfe243a2e6... | 1 
                 coreutils-9.3 | 1 
                    fmt-10.1.1 | 1 
  gobject-introspection-1.76.1 | 1 
                host-go-1.21.5 | 1 
              host-rust-1.71.1 | 1 
ibm-sw-tpm2-5452af422edeff7... | 1 
              libarchive-3.7.2 | 1 
                 libcurl-8.5.0 | 1 
       libzenoh-pico-0.10.0-rc | 1 
                   linux-6.6.7 | 1 
                 openssh-9.6p1 | 1 
            optee-client-4.0.0 | 1 
                 samba4-4.19.3 | 1 
                       unknown | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   arceb     |          boost-1.83.0          | NOK | http://autobuild.buildroot.net/results/003ae2ab20b21ebc19632c410e21153a8baea1c6 |     
    mips     | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/df332b85562f91bf56314c55f7d41ece3b8b3b16 | ORPH
   xtensa    |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/a1936347275e15c5b0d961c5ddf6e3cd7d9f846a | ORPH
    mips     |           fmt-10.1.1           | NOK | http://autobuild.buildroot.net/results/bc14d76484328d2c5ade37b71c58a26489e1c488 |     
    sh4      |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/3c7e2db374ab05907d7689a4cc9c4fb5c12f2555 | ORPH
microblazeel |         host-go-1.21.5         | NOK | http://autobuild.buildroot.net/results/96783b6ed4e64a55ec66ef5b8b3d3a96b99fa5f2 |     
  aarch64    |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/43da7e74133704f2ec1df3c83632de4aa2ff3979 |     
   arceb     | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/817e2c882ea1dedbe2552abde115787f6ab14c51 |     
powerpc64le  |        libarchive-3.7.2        | NOK | http://autobuild.buildroot.net/results/b0f572fcf1c77728869bd04e27efcaaa56cff265 |     
  sparc64    |         libcurl-8.5.0          | NOK | http://autobuild.buildroot.net/results/99b68f77d205db851360f20ee441d4fb0bb59726 |     
   s390x     |        libopenssl-3.2.0        | NOK | http://autobuild.buildroot.net/results/045a73423deaa46e1d4c83943fd94c32d2d7596a | ORPH
   s390x     |        libopenssl-3.2.0        | NOK | http://autobuild.buildroot.net/results/c77cec6d71e4bb0f96aa316a4e379f74f0825d45 | ORPH
    or1k     |    libzenoh-pico-0.10.0-rc     | NOK | http://autobuild.buildroot.net/results/0803b018454e89b09d43803e3bd0282c282fd97f |     
   armeb     |          linux-6.6.7           | NOK | http://autobuild.buildroot.net/results/586b1c07ee7b877bdedfdd6c15b7a56801500fe0 | ORPH
powerpc64le  |         openssh-9.6p1          | NOK | http://autobuild.buildroot.net/results/2dd92c292543d44255711f53acc37db18191b0c6 | ORPH
   x86_64    |       optee-client-4.0.0       | NOK | http://autobuild.buildroot.net/results/9cb537371edb17195151a109643a12962e3ff463 |     
microblazeel |         samba4-4.19.3          | NOK | http://autobuild.buildroot.net/results/745f7956eb87b5dc36f04743fec5e144f295016f |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/bf6a025b2fc1d63852c96a4b5c382181b5e288f4 |     


Classification of failures by reason for 2023.02.x
--------------------------------------------------

         gobject-introspection | 1 
               gupnp-av-0.14.0 | 1 
host-go-bootstrap-stage2-1.... | 1 
              host-rust-1.67.1 | 1 
uclibc-ng-test-6790eafe897b... | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/f2cf10a9a197d86ac07c024e85d1554f12f6e4db |     
   x86_64    |        gupnp-av-0.14.0         | NOK | http://autobuild.buildroot.net/results/3d603b46fefcdd044e47401765c349fb680ca9a6 |     
 aarch64_be  | host-go-bootstrap-stage2-1.... | NOK | http://autobuild.buildroot.net/results/c1379a85b291d6460038bec3f0075f67dba13a75 |     
    mips     |        host-rust-1.67.1        | NOK | http://autobuild.buildroot.net/results/15a9dd7bcb6a5fb49b3d55bd6e6bebfbe38fe07b |     
   armeb     | uclibc-ng-test-6790eafe897b... | NOK | http://autobuild.buildroot.net/results/9812473ff0f414f9e95bc37d358ca8986ae74333 |     


Classification of failures by reason for 2023.08.x
--------------------------------------------------

check-11970a7e112dfe243a2e6... | 1 
               host-go-1.20.11 | 1 
host-go-bootstrap-stage2-1.... | 1 
              host-rust-1.71.1 | 1 


Detail of failures for 2023.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/0e5a8251e53134c13a434ebfb76960a848dfc557 | ORPH
    mips     |        host-go-1.20.11         | NOK | http://autobuild.buildroot.net/results/2b86f5d1e74b723a2a1a99d61e2454af3e6d330e |     
   nios2     | host-go-bootstrap-stage2-1.... | NOK | http://autobuild.buildroot.net/results/70b9e592dc096986668ecf337b3deb7d72f76017 |     
    mips     |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/0ebbbe3a667acc388554a99890cb709a138a9171 |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
