Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77506C4707B
	for <buildroot@archiver.kernel.org>; Sun, 14 Jan 2024 06:47:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C5809400E4;
	Sun, 14 Jan 2024 06:47:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C5809400E4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kPJnDo9WYdfe; Sun, 14 Jan 2024 06:47:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 666BD4036E;
	Sun, 14 Jan 2024 06:47:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 666BD4036E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B3E941BF5A2
 for <buildroot@lists.busybox.net>; Sun, 14 Jan 2024 06:47:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7CCD84036E
 for <buildroot@lists.busybox.net>; Sun, 14 Jan 2024 06:47:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7CCD84036E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3huxD5tPEkmf for <buildroot@lists.busybox.net>;
 Sun, 14 Jan 2024 06:47:01 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C7583400E4
 for <buildroot@buildroot.org>; Sun, 14 Jan 2024 06:47:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C7583400E4
Received: by mail.gandi.net (Postfix) with ESMTPSA id 21D7CFF807
 for <buildroot@buildroot.org>; Sun, 14 Jan 2024 06:46:58 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sun, 14 Jan 2024 06:46:58 -0000
X-GND-Sasl: bot@bootlin.com
Message-Id: <20240114064703.7CCD84036E@smtp2.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1705214818; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=K6EyO2U79WDnsKLneOEAW+Jnd+XOfFrJTjBtLyaWcMI=;
 b=UWeH72HKejU9nekHDlcHsHPbCovMmFjvj+HFvZc5ki/kbYLGoMzDTEEmRIGjFs4lMebjWb
 pMjFMiXb+pSnlX+GfT1OdmA7aGjq31M/3lI5sUls/Rh+Orws+RUB/Sye8yZE+WtAY0UvMm
 G0Tx21r4XxOB7EfaQvsro4OvE0jJ11P5c/Yb49VkfX9DvaLshb18S8TM6HJm19e2s+3og2
 TJ7aOOYAYMCtAvDkfs0zVx2BeUEMiCKi8AaH6iLOlZ3aM6dscOl6q/qumUonA3Lc+SGgqw
 MmeUc+u4ovRBQWKv4z0SsxlO7TIUF8NXLPjgQlm4C07TpYfzwPEr5itQAM5a6g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=UWeH72HK
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2024-01-13
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

Autobuild statistics for 2024-01-13
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  |  3  |  5  |  0  |  8  |
  2023.11.x  |  2  |  2  |  0  |  4  |
    master   |  9  | 16  |  0  | 25  |

Classification of failures by reason for master
-----------------------------------------------

                elfutils-0.189 | 2 
                libressl-3.8.2 | 2 
                 sudo-1.9.15p5 | 2 
               apcupsd-3.14.14 | 1 
check-11970a7e112dfe243a2e6... | 1 
  gobject-introspection-1.76.1 | 1 
              host-rust-1.74.1 | 1 
               libglib2-2.76.1 | 1 
                  linux-6.6.10 | 1 
                mongodb-4.2.18 | 1 
                  stunnel-5.71 | 1 
           uboot-tools-2021.07 | 1 
                       unknown | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/6096c3ddc5edf3204635c2c90246c2e8c8e074e7 |     
   arceb     | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/1258e1ac240b56415cb562916db73073232ef36c | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/62e9a629e0d93fc8664992e55fb5661daec9df14 | ORPH
   mipsel    |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/4f5c255145f5d5c1b3d56629b2e2044f494ba7ed | ORPH
    i686     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/b01e9e47e8fbcc2556226348d5abf20ff6f2eae2 | ORPH
    i686     |        host-rust-1.74.1        | NOK | http://autobuild.buildroot.net/results/c2df0655b0ca9b0db734ea19bbed64e480569f3e |     
    arc      |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/04d9a17e64503e0bece7bad33549ef3ad4b237c9 |     
   s390x     |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/69b68f3c5605c5d39d9b43e8330a47149b50313c | ORPH
   mips64    |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/6ef6fe7bcc94ea35bde32847d32c2249b88a17aa | ORPH
   mipsel    |          linux-6.6.10          | NOK | http://autobuild.buildroot.net/results/d3d763c686448a59d2e9c802d5c21ee51a16ce5d | ORPH
   x86_64    |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/ded207d22f70e3cb8e1e02647dff306e4555ae93 |     
microblazeel |          stunnel-5.71          | NOK | http://autobuild.buildroot.net/results/ae401f40bcf0c9a0ef7560653a271ff2fd033840 |     
   mips64    |         sudo-1.9.15p5          | NOK | http://autobuild.buildroot.net/results/a488b96a02f78f004678d131f3451169ef156e59 | ORPH
microblazeel |         sudo-1.9.15p5          | NOK | http://autobuild.buildroot.net/results/5115c116803cd55439ca4f0499aaf51cf7dbfec4 | ORPH
    mips     |      uboot-tools-2021.07       | NOK | http://autobuild.buildroot.net/results/6fe7d18887955f7a4c363bd2547475ff597dd869 | ORPH
 microblaze  |            unknown             | NOK | http://autobuild.buildroot.net/results/46139d20eda0a8037b845bfda3600a36074ef12b |     


Classification of failures by reason for 2023.02.x
--------------------------------------------------

                   perl-5.36.3 | 2 
                       unknown | 2 
              host-rust-1.67.1 | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |        host-rust-1.67.1        | NOK | http://autobuild.buildroot.net/results/72c497b0c72192b1dc406bf165bc3efc7a608bc1 |     
   sparc     |          perl-5.36.3           | NOK | http://autobuild.buildroot.net/results/d5e275d50339bdb01f3fc062333d117a85f98c4b |     
   sparc     |          perl-5.36.3           | NOK | http://autobuild.buildroot.net/results/07f0ac12bfc7cc63039abfdcb41e1b5c0aff55a9 |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.net/results/275bc7543a113bc2a48586fd6790cf75dd73bf0d |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/53140018b3988068c3ef2435d90df0c46484efa0 |     


Classification of failures by reason for 2023.11.x
--------------------------------------------------

                libressl-3.8.2 | 2 


Detail of failures for 2023.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/8337d3a40adfd88be0db5091ae09819e742e0942 | ORPH
    m68k     |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/7b40092459471ad7594fc81326a0edf7a7bef0fa | ORPH



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
