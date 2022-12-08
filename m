Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B38EC4332F
	for <buildroot@archiver.kernel.org>; Thu,  8 Dec 2022 19:47:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C36354088D;
	Thu,  8 Dec 2022 19:47:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C36354088D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AfeyBtdNNXvR; Thu,  8 Dec 2022 19:47:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D46484161C;
	Thu,  8 Dec 2022 19:47:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D46484161C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 95E521BF2F0
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 19:47:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 71C6E40192
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 19:47:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 71C6E40192
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZEKAqEYK8wX0 for <buildroot@lists.busybox.net>;
 Thu,  8 Dec 2022 19:47:44 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5A823400FE
Received: from smtpcmd0757.aruba.it (smtpcmd0757.aruba.it [62.149.156.57])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5A823400FE
 for <buildroot@buildroot.org>; Thu,  8 Dec 2022 19:47:44 +0000 (UTC)
Received: from localhost.localdomain ([146.241.87.80])
 by Aruba Outgoing Smtp  with ESMTPSA
 id 3Mrvp52zwQipd3MrvpiTxX; Thu, 08 Dec 2022 20:47:43 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Thu,  8 Dec 2022 20:47:42 +0100
Message-Id: <20221208194742.763582-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfEvuJ9jL/PQDkv3dafaEzR60fOZmlIR3WjNQ32bGTUCr/xrJBimRQdTpYzWznzMop9llWnE85bU252LpNdE7amskZfbB2SEO5eu3iHRZW62GyCaSh5lJ
 kmAqUHgYwK1uIPV7QEBAH0ljh6T56tGfTe8jNjak8OJiIbtlNNa+9aJyLtomhsU8T5ch98av5Ys2c0sXxkozgHvjQUvVxZWqcIVUgvvXQs9sUYU4X6o4JNi7
 Iyrs57jS7kmIQvh43P3fG0TgTbtGnV4bfxOjBbr2Jks//9GuH7ZQmVySM9RrJVy6YHzzatn0e38XlQ/rTEWpbg==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1670528863; bh=WcbfjHpjY5ll5j9ReKFkG3dYZXSfS9K6T9yOeYu5T1U=;
 h=From:To:Subject:Date:MIME-Version;
 b=gv9nJKi1BETT+CmjZKdsfLlRyW/U9sKTZpmWS2G/ZDFTPyEvszcqS4zyVo1M0hOwv
 KdJMM3iZPxZyOV+XxHND7WILbuv/zw2UkY2YvMFPyrkmh/BvFXKFIvZmY+DEbX2es7
 NGFvUxsxinXOIoDiss4UQM/2t7NbZk2wtYwIiYreQf5AMEBKgSL6lCTExqpdqsS1pT
 2CRkGNa1AX0WVM4sjYeq98icUqUROvneCoHZZGLTIZQXuFonp+VcEaYR8423GIF/y1
 s6uHeJOuJhnFWb22LU/UsYetlhODPUE+vsIKvjDhLo4cyIwVoafu11Yvx9PiHKDqgF
 gpavMT7usFYFw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=gv9nJKi1
Subject: [Buildroot] [PATCH v2] package/xr819-xradio: fix build failure with
 Linux 6.0
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Sergey Matyukevich <geomatsi@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bump to latest version to fix build failure with Linux 6.0.

Fixes:
http://autobuild.buildroot.net/results/434c1d2a5104090366519278314bf750324d3710/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
V1->V2:
* add Fixes: to commit log as suggested by Sergey Matyukevich
---
 package/xr819-xradio/xr819-xradio.hash | 2 +-
 package/xr819-xradio/xr819-xradio.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/xr819-xradio/xr819-xradio.hash b/package/xr819-xradio/xr819-xradio.hash
index 89201a8eb7..08a3b6e8cc 100644
--- a/package/xr819-xradio/xr819-xradio.hash
+++ b/package/xr819-xradio/xr819-xradio.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  0d0449a85488b990d10ecdf67ac88bfbd39fa81c2df5dfcfed583975222afd33  xr819-xradio-4f0cfd5e869ca101e7c624d9ce05ba5d2b2a0bc2.tar.gz
+sha256  839fdae93eba29121d4116de335b00a026ef63874caf516747dbdf24c17f208b  xr819-xradio-58d597bcf081e44904335916e6033bc8ef28b043.tar.gz
 # Locally computed
 sha256  db296f2f7f35bca3a174efb0eb392b3b17bd94b341851429a3dff411b1c2fc73  LICENSE
diff --git a/package/xr819-xradio/xr819-xradio.mk b/package/xr819-xradio/xr819-xradio.mk
index 835e229347..8c1cb1587f 100644
--- a/package/xr819-xradio/xr819-xradio.mk
+++ b/package/xr819-xradio/xr819-xradio.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XR819_XRADIO_VERSION = 4f0cfd5e869ca101e7c624d9ce05ba5d2b2a0bc2
+XR819_XRADIO_VERSION = 58d597bcf081e44904335916e6033bc8ef28b043
 XR819_XRADIO_SITE = $(call github,fifteenhex,xradio,$(XR819_XRADIO_VERSION))
 XR819_XRADIO_LICENSE = GPL-2.0
 XR819_XRADIO_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
