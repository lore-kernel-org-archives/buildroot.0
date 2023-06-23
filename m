Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D4F3EB64DD
	for <buildroot@archiver.kernel.org>; Fri, 23 Jun 2023 04:40:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0215440142;
	Fri, 23 Jun 2023 04:40:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0215440142
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id y8zJDus53Z-Z; Fri, 23 Jun 2023 04:40:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 12D3940106;
	Fri, 23 Jun 2023 04:40:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 12D3940106
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 94DB41BF362
 for <buildroot@lists.busybox.net>; Fri, 23 Jun 2023 04:40:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 622A740106
 for <buildroot@lists.busybox.net>; Fri, 23 Jun 2023 04:40:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 622A740106
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ab_SjZJ8xACq for <buildroot@lists.busybox.net>;
 Fri, 23 Jun 2023 04:40:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1C24640003
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1C24640003
 for <buildroot@buildroot.org>; Fri, 23 Jun 2023 04:40:30 +0000 (UTC)
X-GND-Sasl: thomas.petazzoni@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 16C7460006
 for <buildroot@buildroot.org>; Fri, 23 Jun 2023 04:40:27 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Fri, 23 Jun 2023 04:40:27 -0000
Message-Id: <20230623044035.622A740106@smtp2.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1687495228; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=x81AcQiTSUueqfvuIXqvdqSnrAiUl1QSxzY09A2Inx4=;
 b=jzcvUejv04zK7uTTVl794IwO0NVJw5kGTWGkhbZ82QkSMokYmJhBqUvAr4zAQf/eQb10D5
 6oM1mFpF52YgqdoBwv3SbTDuyTMfkf060H1+Ht3Vza+iEtq+WaQ1BDsDdvJQ0wsZrISBRi
 7o5AIK+nt/a48h607+0WtQK0lVWkQgkiHsDVFQbL+VF/IEFxD6vQIdHxTVQ80t6ZW1zhol
 Uwy/zymHbe99fxultcxHOYAMWGZ/4NJ7T7bf3TepIx8px9pUQpfNv+CJ37nwdQn1+njplm
 E7aUb8FsjFxGJsZIYaOPMIX00bGzbV8Hnem4EYyh4pp5lOcyEZ5qlRLcVJhptA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=jzcvUejv
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-06-22
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

Autobuild statistics for 2023-06-22
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  |  4  |  2  |  0  |  6  |
    master   | 22  | 29  |  0  | 51  |

Classification of failures by reason for master
-----------------------------------------------

             host-ccache-4.8.2 | 6 
                   gupnp-1.4.3 | 4 
                   linux-6.3.8 | 3 
                       unknown | 3 
                  check-0.15.2 | 1 
                  ffmpeg-4.4.4 | 1 
fs/ubi/ubi.mk:51: /home/bui... | 1 
glibc-2.37-2-g9f8513dc64119... | 1 
                     gmp-6.2.1 | 1 
  gobject-introspection-1.74.0 | 1 
            host-binutils-2.38 | 1 
host-gdb-arc-2020.09-releas... | 1 
               host-runc-1.1.7 | 1 
               libglib2-2.76.1 | 1 
          linux-5.10.162-cip24 | 1 
                 raptor-2.0.15 | 1 
               xfsprogs-5.14.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   arceb     |          check-0.15.2          | NOK | http://autobuild.buildroot.net/results/e929be53cb61c6ef5f3c7570ccb1246993124a4b | ORPH
    arc      |          ffmpeg-4.4.4          | NOK | http://autobuild.buildroot.net/results/265281c6226904b9c5c2cce761fe9fda62fb1930 |     
   arceb     | fs/ubi/ubi.mk:51: /home/bui... | NOK | http://autobuild.buildroot.net/results/9776b443f4c3850ffd58f18f99203c24d0d583c9 |     
  powerpc    | glibc-2.37-2-g9f8513dc64119... | NOK | http://autobuild.buildroot.net/results/c93459e5c73a62eaf0d84b0d09ace7ab6d9ad433 |     
  riscv64    |           gmp-6.2.1            | NOK | http://autobuild.buildroot.net/results/ba5cfe9c116c4d11b05dc91534cda279db10fbfc | ORPH
powerpc64le  |  gobject-introspection-1.74.0  | NOK | http://autobuild.buildroot.net/results/1be3e1771cb5b7b662d15cf4e08e23095ed99fa4 | ORPH
   mips64    |          gupnp-1.4.3           | NOK | http://autobuild.buildroot.net/results/a322ebb885aee24ac0ad5808b51aafe85b23d52c |     
   armeb     |          gupnp-1.4.3           | NOK | http://autobuild.buildroot.net/results/8715b22a75de27b31b8e8d18bf4f1356c8494692 |     
  mips64el   |          gupnp-1.4.3           | NOK | http://autobuild.buildroot.net/results/581ae77b0fdee4e19aeea9c98eed331f131e0d26 |     
microblazeel |          gupnp-1.4.3           | NOK | http://autobuild.buildroot.net/results/72be97751f95f94e22d954b5dc3a5772e2e058ac |     
   sh4eb     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/331247fbad8d9f015176c61559bf336e49ee43ee |     
    arm      |       host-ccache-4.8.2        | NOK | http://autobuild.buildroot.net/results/18e14ab8b10e047c9ff737d7871cd421a92d897b | ORPH
   s390x     |       host-ccache-4.8.2        | NOK | http://autobuild.buildroot.net/results/42429c6b79f7567497f98d1910d49d78b94a9672 | ORPH
   mipsel    |       host-ccache-4.8.2        | NOK | http://autobuild.buildroot.net/results/2c701f222088476782d06536b67a97bc40692549 | ORPH
    mips     |       host-ccache-4.8.2        | NOK | http://autobuild.buildroot.net/results/2f22a07e7e86cd2603040b0659ef62a13460eca2 | ORPH
   mips64    |       host-ccache-4.8.2        | NOK | http://autobuild.buildroot.net/results/58de7f3545cbbea45e4cf446ddfe14dbcea07edf | ORPH
  riscv64    |       host-ccache-4.8.2        | NOK | http://autobuild.buildroot.net/results/148dcff4334beff39a33465a6ab48704caef6dc7 | ORPH
    arc      | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/400b1163a9723a54b4b421aaa701790699d2e971 | ORPH
    or1k     |        host-runc-1.1.7         | NOK | http://autobuild.buildroot.net/results/dbc7990623c66c3cc50a18a3fc8016383abdac5e |     
 aarch64_be  |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/42dda21b6e8c1ab6f9cf96e831fb327e9ba1b551 |     
    mips     |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/ce548f84e5148787a08d3241d6d5923d13e445cb | ORPH
 aarch64_be  |          linux-6.3.8           | NOK | http://autobuild.buildroot.net/results/e6b8e48fcc243c7e1c2aa0de6ae41618545b7789 | ORPH
 aarch64_be  |          linux-6.3.8           | NOK | http://autobuild.buildroot.net/results/d3bc5582e1e00498f678a0b75893df4a53cea9de | ORPH
microblazeel |          linux-6.3.8           | NOK | http://autobuild.buildroot.net/results/7eef65e75ef92e71cfd708e6e0b0419def467a31 | ORPH
   x86_64    |         raptor-2.0.15          | NOK | http://autobuild.buildroot.net/results/8663c108d2cb23d5d19f4d02c6e2632e536c4808 | ORPH
    or1k     |            unknown             | NOK | http://autobuild.buildroot.net/results/87c59c562ff51b44b0d8561795547e9f6dfb2f0c |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/cee794c1aaf03135ad4395f2a178ce586560b0da |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/6cbf1397bb0f26d44d24dc40f828169462d95ac2 |     
    arm      |        xfsprogs-5.14.2         | NOK | http://autobuild.buildroot.net/results/f5b1bd6e4ae20210a0cc91df9ab16efb0aa5a4e1 | ORPH


Classification of failures by reason for 2023.02.x
--------------------------------------------------

fs/ubifs/ubifs.mk:49: /home... | 1 
            host-binutils-2.38 | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    mips     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/f7fff9db054e989d22a3528c56a840f10814242e |     
    arm      |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/1c0a9d465619ab6809e8b22a1442efb3540c8a9b |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
