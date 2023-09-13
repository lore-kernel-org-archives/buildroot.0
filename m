Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 546A3EEB596
	for <buildroot@archiver.kernel.org>; Wed, 13 Sep 2023 06:45:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C10084172F;
	Wed, 13 Sep 2023 06:45:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C10084172F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7bnM0FhLUPQB; Wed, 13 Sep 2023 06:44:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8EE1E41B67;
	Wed, 13 Sep 2023 06:44:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8EE1E41B67
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 267C41BF85D
 for <buildroot@lists.busybox.net>; Wed, 13 Sep 2023 06:44:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BCD0D60AA7
 for <buildroot@lists.busybox.net>; Wed, 13 Sep 2023 06:44:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BCD0D60AA7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zmnyFHPTOz9H for <buildroot@lists.busybox.net>;
 Wed, 13 Sep 2023 06:44:55 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D5B1060AA0
 for <buildroot@buildroot.org>; Wed, 13 Sep 2023 06:44:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D5B1060AA0
Received: by mail.gandi.net (Postfix) with ESMTPSA id 06531240005
 for <buildroot@buildroot.org>; Wed, 13 Sep 2023 06:44:51 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Wed, 13 Sep 2023 06:44:51 -0000
X-GND-Sasl: bot@bootlin.com
Message-Id: <20230913064456.BCD0D60AA7@smtp3.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1694587492; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=rgUN8Zy7miDiPWHk/5rivCgp120WcKw0cKmX9CfcIzk=;
 b=gEqvd2jHUAEFKM0AI7oPO+1Wv3lzDRBIyBn7LpJdSQGMamHyE5nbYuXA0Pvrf3UsxaEe9R
 Rz8trv1oNj8VFThXBK15xCaM36AAg6WHyo7jGUjzV41AqjfAomYZogQZlLn8srYPFYuul5
 3o2sW0GWa4SyJ/tGJW1tW72Nre54N6Odc4E56ac9Xryo6R02tCY7FB7V0xxaX1ga9cd6Ey
 3STEbXpNrluQ4eaUx36q3nOMSPYwyIwROX+VxGgfCafy0uNLiGCPyaMxTh6jVr/5cResyN
 tiw6nLci66KcY9dbq371XqnDaGM0vwyx+3qwvfof9xj9lXoDsSkcqw32ZtmYAA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=gEqvd2jH
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-09-12
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

Autobuild statistics for 2023-09-12
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  |  6  |  2  |  0  |  8  |
  2023.05.x  |  4  |  2  |  0  |  6  |
  2023.08.x  |  6  |  3  |  0  |  9  |
    master   | 31  | 32  |  3  | 66  |

Classification of failures by reason for master
-----------------------------------------------

                  linux-6.4.14 | 4 
              libarchive-3.7.1 | 3 
                   linux-tools | 2 
                    olsr-0.9.8 | 2 
package/libspdm/libspdm.mk:... | 2 
              swupdate-2023.05 | 2 
                       unknown | 2 
             batman-adv-2022.3 | 1 
cegui-00b4e1fe174da53b7ed72... | 1 
                        ffmpeg | 1 
glibc-2.37-2-g9f8513dc64119... | 1 
         gobject-introspection | 1 
  gobject-introspection-1.76.1 | 1 
        host-sentry-cli-2.20.3 | 1 
                       libldns | 1 
              libostree-2023.6 | 1 
                 libuwsc-3.3.5 | 1 
              libxcrypt-4.4.36 | 1 
          linux-5.10.162-cip24 | 1 
                     lxc-5.0.2 | 1 
on2-8170-modules-73b08061d3... | 1 
                 pango-1.50.14 | 1 
                    php-8.2.10 | 1 
               syslog-ng-4.2.0 | 1 
               zxing-cpp-2.1.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |       batman-adv-2022.3        | NOK | http://autobuild.buildroot.net/results/60421fe03c99033ca818ea81d086f4804fdea973 |     
    or1k     | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/cfc3b103bdee8f5fbeff10cc91bb71060b7d08fd |     
    i686     |             ffmpeg             | TIM | http://autobuild.buildroot.net/results/6c9f14aa98b31278949dd4e42cb34525d255326b |     
  powerpc    | glibc-2.37-2-g9f8513dc64119... | NOK | http://autobuild.buildroot.net/results/3c6e916f53fab7a45e54f7bed4526d3d41c55b2b |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/4bdfcabf8661a61b0ad44c02ba2f741c44a166f9 |     
   s390x     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/2a2274f85996ee804233df16afddb6cb56705bbb | ORPH
   armeb     |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/d14b4dca407119e9c8af70584436aed474bd9e34 |     
   nios2     |        libarchive-3.7.1        | NOK | http://autobuild.buildroot.net/results/e6e6d842ee7c3e3e8b2395592665208874fd896f |     
  powerpc    |        libarchive-3.7.1        | NOK | http://autobuild.buildroot.net/results/aaf7fdefa0b7bd7e5ac743487c197544c1a2ce6f |     
powerpc64le  |        libarchive-3.7.1        | NOK | http://autobuild.buildroot.net/results/9702803de76e0f6f37375d943056057fa85905a2 |     
  riscv64    |            libldns             | TIM | http://autobuild.buildroot.net/results/2961be84a8fd7b04b995d58ee6f299ed5e7fcc9b |     
  mips64el   |        libostree-2023.6        | NOK | http://autobuild.buildroot.net/results/b1b27bf3e4a8c5aa9cd402bf21fbddeaa782c4bc |     
   x86_64    |         libuwsc-3.3.5          | NOK | http://autobuild.buildroot.net/results/bbb9f88ef340a00b1a2f6cd035f668dea56bc738 |     
powerpc64le  |        libxcrypt-4.4.36        | NOK | http://autobuild.buildroot.net/results/1a956edc8d8a77fa7d831cc532ebcd539261d6fe |     
   mipsel    |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/c3dfd437cf953597c3f8640497fe02cf7a811f2b | ORPH
powerpc64le  |          linux-6.4.14          | NOK | http://autobuild.buildroot.net/results/de243f79305c34fd7d9933657c1dcf6f2dda8229 | ORPH
   mips64    |          linux-6.4.14          | NOK | http://autobuild.buildroot.net/results/66ad7aa21d563bc2548d09532d8cd34af4af58e3 | ORPH
  powerpc    |          linux-6.4.14          | NOK | http://autobuild.buildroot.net/results/042c47a6aa4e955d4ce4e3714e24833f6b25e544 | ORPH
   mipsel    |          linux-6.4.14          | NOK | http://autobuild.buildroot.net/results/da0ba3929ca8c108a2ca0e3bd5614bb987817775 | ORPH
   arceb     |          linux-tools           | NOK | http://autobuild.buildroot.net/results/46f0aa9631fbf84ccea10e85d2de52ad24f8fdff | ORPH
  sparc64    |          linux-tools           | NOK | http://autobuild.buildroot.net/results/ed6ec1a842e4829ab5ddffc36aafff13313c496d | ORPH
 aarch64_be  |           lxc-5.0.2            | NOK | http://autobuild.buildroot.net/results/a4e1838b96b67cb0eb55db474399b67bad7ba83a |     
   arceb     |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/a37be721130605a8409e8cd3347fb4550eaee10f | ORPH
powerpc64le  |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/f9765b609516e50b8c2b014c608f00bbc020cb51 | ORPH
   armeb     | on2-8170-modules-73b08061d3... | NOK | http://autobuild.buildroot.net/results/69bc90de48c513e041410f52f03059a868bf85d0 | ORPH
   x86_64    | package/libspdm/libspdm.mk:... | NOK | http://autobuild.buildroot.net/results/909f167e3f80edb1b25cb14c5e7e297dc2c72f10 |     
    i686     | package/libspdm/libspdm.mk:... | NOK | http://autobuild.buildroot.net/results/7030cb510619a773ad7af53edca224de590cb97b |     
   mips64    |         pango-1.50.14          | NOK | http://autobuild.buildroot.net/results/389357e7b50159fcc39f134ee7913a0bfe51242b | ORPH
 microblaze  |           php-8.2.10           | NOK | http://autobuild.buildroot.net/results/dd876666e91271a3be11336317fc64094bb6b016 |     
  mips64el   |        swupdate-2023.05        | NOK | http://autobuild.buildroot.net/results/e545f294c7f032fd7434fdb91aa18a38b2e19038 | ORPH
 aarch64_be  |        swupdate-2023.05        | NOK | http://autobuild.buildroot.net/results/98b64a0e9b6c5d5bf6a71744d5c5757fbe38f0db | ORPH
 powerpc64   |        syslog-ng-4.2.0         | NOK | http://autobuild.buildroot.net/results/8f1df8055413039d21ea96a7626c974674737015 |     
  sparc64    |            unknown             | NOK | http://autobuild.buildroot.net/results/099c4ca4e20efa34dac5c411f6b2ad989d989980 |     
   mips64    |            unknown             | NOK | http://autobuild.buildroot.net/results/3722eb12462bb6cac3c7c6586e0a21874196f918 |     
    sh4      |        zxing-cpp-2.1.0         | NOK | http://autobuild.buildroot.net/results/c5e7fe83d46c704e05800e3ae62bf476458c7b71 |     


Classification of failures by reason for 2023.02.x
--------------------------------------------------

          lttng-modules-2.13.7 | 1 
                       unknown | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |      lttng-modules-2.13.7      | NOK | http://autobuild.buildroot.net/results/f47073b2a7b933049d16057f44b7574481b07797 |     
   s390x     |            unknown             | NOK | http://autobuild.buildroot.net/results/33a5a9ef0f2c55c5c96dca853bbda1e71192680c |     


Classification of failures by reason for 2023.05.x
--------------------------------------------------

               host-go-1.19.12 | 1 
                       unknown | 1 


Detail of failures for 2023.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mips64    |        host-go-1.19.12         | NOK | http://autobuild.buildroot.net/results/0967454592502f601b21602cd8ae742761a948cc |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/f6696fc9517df1c0887f6eed3753a6a97971d099 |     


Classification of failures by reason for 2023.08.x
--------------------------------------------------

                 coreutils-9.3 | 1 
             gnuradio-3.10.7.0 | 1 
                       unknown | 1 


Detail of failures for 2023.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mipsel    |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/dbaea53bf71e5e2aea57939a895d5c2193c5280b | ORPH
powerpc64le  |       gnuradio-3.10.7.0        | NOK | http://autobuild.buildroot.net/results/47ba99b2a8bbc3fca9eb7e4eca6c0103fd408386 |     
   armeb     |            unknown             | NOK | http://autobuild.buildroot.net/results/835ed8a16328c235bef117470321c1520bd8d0fa |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
