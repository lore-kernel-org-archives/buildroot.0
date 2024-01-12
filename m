Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A00D8C4707C
	for <buildroot@archiver.kernel.org>; Fri, 12 Jan 2024 06:54:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 292E060E03;
	Fri, 12 Jan 2024 06:54:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 292E060E03
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UtGIEQb1nhDK; Fri, 12 Jan 2024 06:54:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5762D60D8E;
	Fri, 12 Jan 2024 06:54:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5762D60D8E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3A3821BF33D
 for <buildroot@lists.busybox.net>; Fri, 12 Jan 2024 06:54:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 00BCE42892
 for <buildroot@lists.busybox.net>; Fri, 12 Jan 2024 06:54:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 00BCE42892
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S6t0dqZ0NUyC for <buildroot@lists.busybox.net>;
 Fri, 12 Jan 2024 06:54:17 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4618742859
 for <buildroot@buildroot.org>; Fri, 12 Jan 2024 06:54:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4618742859
Received: by mail.gandi.net (Postfix) with ESMTPSA id 69E17FF809
 for <buildroot@buildroot.org>; Fri, 12 Jan 2024 06:54:14 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Fri, 12 Jan 2024 06:54:14 -0000
X-GND-Sasl: bot@bootlin.com
Message-Id: <20240112065419.00BCE42892@smtp4.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1705042454; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=M5t/cr4xu9G3WxPybIWr1DKvxiuK98EclRx1agYsPyA=;
 b=NbPRRSfvaRlSjHIZ7fK5JjJuk7sB0ZP44iioArSwc7zVGPpqRkqpN2TzdnUoHpKZo5gGI8
 WrU425wo/xniA15R9R8Jedisw/+DAfj3TSozjJC7coYN1cvRFon8jyoemeLza0j7D+tt36
 EqMIm5ZNX2kxkq3KfGtmwCZueVvGbIlsNwbijhTC/EQ0Zdt4HTKZtw3B6f5NjySBEgCxUe
 XDxE155JsCboPTkKomBYBizT8uGMx+DeLZRYJpgGJLyYrMaSynVxHw4L586cTV8KmOUGtT
 b3OUaWoYDnibuS24+eZC2T6upJK+EYnq7XwvEJp/p0gOtndXiqTwm0dSYQQg7A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=NbPRRSfv
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2024-01-11
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

Autobuild statistics for 2024-01-11
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  |  5  |  3  |  0  |  8  |
  2023.11.x  |  2  |  2  |  0  |  4  |
    master   | 10  | 15  |  1  | 26  |

Classification of failures by reason for master
-----------------------------------------------

                       unknown | 3 
        host-sentry-cli-2.20.3 | 2 
                   botan-3.2.0 | 1 
         gobject-introspection | 1 
  gobject-introspection-1.76.1 | 1 
                host-go-1.21.6 | 1 
              libarchive-3.7.2 | 1 
               libglib2-2.76.1 | 1 
              libopenssl-3.2.0 | 1 
                libressl-3.8.2 | 1 
          linux-5.10.162-cip24 | 1 
                  linux-6.6.10 | 1 
                 systemd-254.6 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |          botan-3.2.0           | NOK | http://autobuild.buildroot.net/results/d58c4730c770467b42af426545dd917ecc5fed17 | ORPH
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/ec8e484974b6ba3877cc56957fed0fc8e91a571b |     
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/5a65268b1e3976a7a4f2da4aaa8b2752fc1eeb5c | ORPH
    i686     |         host-go-1.21.6         | NOK | http://autobuild.buildroot.net/results/8c873f073908888b4e160e5c2c1ec8de527a8d64 |     
 aarch64_be  |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/c86a26436696c2780a519fa8a839ee669e852489 |     
 microblaze  |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/295d2d7c9b61ca7a835d447cfe908b3b7563b771 |     
  sparc64    |        libarchive-3.7.2        | NOK | http://autobuild.buildroot.net/results/b0a40c57ef2827797f7af400797166b5958faa60 |     
   arceb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/c4c8232ffe8641f005036a049857c1949156b0c6 |     
   s390x     |        libopenssl-3.2.0        | NOK | http://autobuild.buildroot.net/results/4af285136d991ea8279d84fc6137fc4fb4b6a925 | ORPH
    mips     |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/d07d467548ece753d213ec7f390c2b0f68aec385 | ORPH
  mips64el   |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/7a76a7e1a45897f2307a773f84f1332daafd2fef | ORPH
   x86_64    |          linux-6.6.10          | NOK | http://autobuild.buildroot.net/results/ea61da04de02ec2909ae1bfd0852a7fba5921918 | ORPH
powerpc64le  |         systemd-254.6          | NOK | http://autobuild.buildroot.net/results/23b1afd6605092694eb3b7a6f92996b3e4eb6137 |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/1947361db684fb72b5e404c6d23628758b930170 |     
    m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/5753e8fed8920d37a7b66475f4e146906eb46892 |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/45d0ee883151da4eb653fe7c23b1eb85cadcb2ba |     


Classification of failures by reason for 2023.02.x
--------------------------------------------------

       freeradius-server-3.2.3 | 1 
               host-runc-1.1.7 | 1 
                 openssh-9.6p1 | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 powerpc64   |    freeradius-server-3.2.3     | NOK | http://autobuild.buildroot.net/results/64f8c9e51edd729ac359d408aabf5642695f7d03 |     
    arc      |        host-runc-1.1.7         | NOK | http://autobuild.buildroot.net/results/a80dd182eecaa46a6d808d6426c8965b2f5f4455 |     
   mips64    |         openssh-9.6p1          | NOK | http://autobuild.buildroot.net/results/e3d623336905bc9c59439f31f84c85e85e6d7c6b | ORPH


Classification of failures by reason for 2023.11.x
--------------------------------------------------

                 dc3dd-7.2.641 | 1 
                libressl-3.8.2 | 1 


Detail of failures for 2023.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/6562d99508258210346b2154073a611be06bce29 | ORPH
   sparc     |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/6e9d6ad8f8a5ba63e627e70ef73a7fe43b7eddd1 | ORPH



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
