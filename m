Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E107C0015E
	for <buildroot@archiver.kernel.org>; Thu, 13 Jul 2023 07:39:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9E0BD61306;
	Thu, 13 Jul 2023 07:39:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9E0BD61306
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k1ZM_3pIZh12; Thu, 13 Jul 2023 07:39:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D05CB612F0;
	Thu, 13 Jul 2023 07:39:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D05CB612F0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5A7AD1BF397
 for <buildroot@lists.busybox.net>; Thu, 13 Jul 2023 07:39:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9FF4140A85
 for <buildroot@lists.busybox.net>; Thu, 13 Jul 2023 07:39:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9FF4140A85
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tc26MQSip0FD for <buildroot@lists.busybox.net>;
 Thu, 13 Jul 2023 07:39:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 458E340AFF
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 458E340AFF
 for <buildroot@buildroot.org>; Thu, 13 Jul 2023 07:39:01 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.fritz.box ([62.216.209.134]) by mail.gmx.net
 (mrgmx105 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1MAOJP-1q7z5f0KK3-00Br4R; Thu, 13 Jul 2023 09:38:56 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Thu, 13 Jul 2023 09:38:47 +0200
Message-ID: <20230713073854.19510-2-ps.report@gmx.net>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230713073854.19510-1-ps.report@gmx.net>
References: <20230713073854.19510-1-ps.report@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:R2/1zbiXvJDy0NFuC/5mEC3qaAZ6k6GMZchU74BREWvIOllvz6/
 eEX4jaE4jixKp4/umTfIVZ4QcdxhO3cimlHG7UncZLEI8Po4iV/dmgxL4OnhOwlYYs9yvZv
 a09azS1lbhBTRouGWU75nv9Z1WLb7QD8xTaSoOBw/yXwJ1LrBjmrpjaFmWoEfSw9f00rUhw
 eFaeaoca+m3r4gMO7P+/w==
UI-OutboundReport: notjunk:1;M01:P0:/idLx99xNjI=;93NSMJ5eseE7UCHV8XLD+dY+lIz
 Ezj7NVVOS4y6gcW571RbIVcCvFIMJTjUahJ0iUlYY/Vx8u/nWIG0MJyqVaJhgA4vhGlrAbNyN
 cbiIuFZE7PLR78qCaOrSXKDgHzUOvtaMEfg7FrTLu26ijUiIspVdq9t0KtLZeH/FdRLZ5NJ1N
 6g8v5fyglqjD/Uzxn1Zdte/+AlVeJ2YvKv5S1AhPDlUIAadsH1L3ew7oHfdXCiuauuSsO39D3
 rWhZVJC+k5hrR3C2MpYtoM2yg4BmwJn5recvtyXLvmnNZjn6nzyohYw+hLjQJR4cWRcXThglH
 vE7lukoIbgACTAv9DTD+CgjzTs5Ofa8gisUfdvax+m6Q6Jw/TwTMLf2eKviK7byCl5xdyXhdu
 qA9WIdl6Tsw3fymUXC+nAC3sIQNTQWBMn65w8Zs9ADnJNgGQDy7Pmkv3w6KQEsCWQ4uxegAFt
 4IOeO6dk75REb/RwI9k33Ba9Gjn9cL6OJUWVzJhg2HhCyoOm2qfkdQepgwpdqukyIY+vmi9Xr
 320gNbQcHqQOn4+6RfjOgNCelTezGNvuWQ0zFERmhRKVuqymcGMGWwZdbg45bEveoJW7CnoPq
 kgH9cc7OOFKbuldg1schaKWywm32ym08vY7xDJaqHGxpT1HlbxPUpOC1e7aYH93c6TCugJkui
 YS7/A4F7BvksyRQIanS3kF814AGfl1no8iRH8ME/279U6MfQ0hiX0WnoDwjka3G/dxQq3tVJ3
 czqCF5qVHWXh+NIm1e+BsV9gxC27i2ZzaJA+LOJ49cWZHTe54Me2Ywak/dKi4KO1qzispxRdP
 t/PG3dzKVdcZtG2j4kcKxRFi1rKxdmABZ7H26Ky4MpD41gI/UsYfddjnn2IEXSvUEepW1h4dP
 kEDBaZZ/XzbtJf4qGbgREM89P2LwZP6ePLTJC+p2DyEZi636rcj89HnOSuKEt+eTCSithDW2f
 aPnrEKqRrtJw8ssbBFLF/2x3y4I=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.net; 
 s=s31663417; t=1689233936; x=1689838736; i=ps.report@gmx.net;
 bh=5Gsr+a1iKozsC9qB8iruhrSDH0VZ8X+/x8qGU8eybnU=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=PGeKmtt5YXua56eoWQYMoOM4AXFCwrdsOTRFgt5UynyIIT1ES3K6nSdPogEoNCE2R1YWnBt
 nRIaoCqLkdH3t3JGzAlROo+33pit+FsxaTMrFSfE1pnl50Pujja3qWnPdmcJOCdMPw/BtXDJG
 y7sIL4pjZNLowN07/+EGoNk8ah5VT6dMJxhiNdBlC2S9eXFV2QbhFOJgO/jQmIIv5dJSeu5wd
 NA96Se2ecWUHqUgNZcVwyGJPf6jssrKSL1zvt6p8Y1Htx05otwc4liiDMPC/xyiCP/MfuZxkX
 KmG7vYxAooUIq4rm77OVprE0Mw3oLXJITAgQmaanrs5hnSEVEcFQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=ps.report@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=PGeKmtt5
Subject: [Buildroot] [PATCH v1 2/9] package/python-markupsafe: bump version
 to 2.1.3
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
Cc: Lionel Flandrin <lionel@svkt.org>, Mauro Condarelli <mc5686@mclink.it>,
 Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/python-markupsafe/python-markupsafe.hash | 4 ++--
 package/python-markupsafe/python-markupsafe.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-markupsafe/python-markupsafe.hash b/package/python-markupsafe/python-markupsafe.hash
index 2d1d81c62e..ec357a83ce 100644
--- a/package/python-markupsafe/python-markupsafe.hash
+++ b/package/python-markupsafe/python-markupsafe.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/markupsafe/json
-md5  9809f9fdd98bc835b0c21aa8f79cbf30  MarkupSafe-2.1.1.tar.gz
-sha256  7f91197cc9e48f989d12e4e6fbc46495c446636dfc81b9ccf50bb0ec74b91d4b  MarkupSafe-2.1.1.tar.gz
+md5  ca33f119bd0551ce15837f58bb180214  MarkupSafe-2.1.3.tar.gz
+sha256  af598ed32d6ae86f1b747b82783958b1a4ab8f617b06fe68795c7f026abbdcad  MarkupSafe-2.1.3.tar.gz
 # Locally computed sha256 checksums
 sha256  489a8e1108509ed98a37bb983e11e0f7e1d31f0bd8f99a79c8448e7ff37d07ea  LICENSE.rst
diff --git a/package/python-markupsafe/python-markupsafe.mk b/package/python-markupsafe/python-markupsafe.mk
index 49bfc0b840..0dca997f87 100644
--- a/package/python-markupsafe/python-markupsafe.mk
+++ b/package/python-markupsafe/python-markupsafe.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MARKUPSAFE_VERSION = 2.1.1
+PYTHON_MARKUPSAFE_VERSION = 2.1.3
 PYTHON_MARKUPSAFE_SOURCE = MarkupSafe-$(PYTHON_MARKUPSAFE_VERSION).tar.gz
-PYTHON_MARKUPSAFE_SITE = https://files.pythonhosted.org/packages/1d/97/2288fe498044284f39ab8950703e88abbac2abbdf65524d576157af70556
+PYTHON_MARKUPSAFE_SITE = https://files.pythonhosted.org/packages/6d/7c/59a3248f411813f8ccba92a55feaac4bf360d29e2ff05ee7d8e1ef2d7dbf
 PYTHON_MARKUPSAFE_SETUP_TYPE = setuptools
 PYTHON_MARKUPSAFE_LICENSE = BSD-3-Clause
 PYTHON_MARKUPSAFE_LICENSE_FILES = LICENSE.rst
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
