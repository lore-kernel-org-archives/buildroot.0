Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39F09EB64DC
	for <buildroot@archiver.kernel.org>; Mon,  3 Jul 2023 16:06:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D3BE382051;
	Mon,  3 Jul 2023 16:06:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D3BE382051
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q654Bjn1x2Pr; Mon,  3 Jul 2023 16:06:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 17B868204E;
	Mon,  3 Jul 2023 16:06:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 17B868204E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A2D641BF4D8
 for <buildroot@lists.busybox.net>; Mon,  3 Jul 2023 16:06:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8994E401A3
 for <buildroot@lists.busybox.net>; Mon,  3 Jul 2023 16:06:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8994E401A3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9W9dLlubl2_f for <buildroot@lists.busybox.net>;
 Mon,  3 Jul 2023 16:06:26 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A5B20400FE
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A5B20400FE
 for <buildroot@buildroot.org>; Mon,  3 Jul 2023 16:06:26 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b71b.dip0.t-ipconnect.de [84.161.183.27])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 79BA2A4C00CE;
 Mon,  3 Jul 2023 18:06:24 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:37562)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qGM4G-0001Hc-0f;
 Mon, 03 Jul 2023 18:06:24 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon,  3 Jul 2023 18:06:22 +0200
Message-Id: <20230703160622.34931-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1688400384;
 bh=Pii6ij8CoYAmb7LtGr7igp2qy6+O81QZp3CAqdn901Q=;
 h=From:To:Cc:Subject:Date:From;
 b=UR8kSWeXGNVULY5Y88LyaeOR33g5/UV+eizGfQRgjlJ64GdZxSK0xw3MEx+v7V3fe
 7Rpae0kQ2b3BoZK4b0dULqbvu9xrPcI9GTKob2zTsFLic8ktjRAaodZnjWPdUYoBQj
 ypJJ1HAOvEezPBb0trCwn0mu2nidbMA2LyECDB1YpUnbHOZh+2fhclk4AMZxi8Fvtw
 HCieyIBOPAhnOvFWPB81XTzztMQifoen85LjGGVjh7yi/vUGSVrNlJlOJPN3lQhtIi
 yK6uy1U7mTvBLUEUfmFoNqbE/fj6DMi8mI20nTVlbcKeijDsgMU++2IS79I1Db7v5K
 pkqYxLeu47WJQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=UR8kSWeX
Subject: [Buildroot] [PATCH 1/1] package/libmicrohttpd: bump version to
 0.9.77
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>, Will Newton <will.newton@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Bernd Kuhls <bernd.kuhls@t-online.de>

Release notes:
https://lists.gnu.org/archive/html/libmicrohttpd/2023-05/msg00008.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libmicrohttpd/libmicrohttpd.hash | 2 +-
 package/libmicrohttpd/libmicrohttpd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libmicrohttpd/libmicrohttpd.hash b/package/libmicrohttpd/libmicrohttpd.hash
index ce30e2ba11..a4c8fbca5b 100644
--- a/package/libmicrohttpd/libmicrohttpd.hash
+++ b/package/libmicrohttpd/libmicrohttpd.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  f0b1547b5a42a6c0f724e8e1c1cb5ce9c4c35fb495e7d780b9930d35011ceb4c  libmicrohttpd-0.9.76.tar.gz
+sha256  9e7023a151120060d2806a6ea4c13ca9933ece4eacfc5c9464d20edddb76b0a0  libmicrohttpd-0.9.77.tar.gz
 sha256  7399547209438c93f9b90297954698773d4846cea44cde5ca982c84c45952a3b  COPYING
diff --git a/package/libmicrohttpd/libmicrohttpd.mk b/package/libmicrohttpd/libmicrohttpd.mk
index 4e7b72b65c..72b2bbafd8 100644
--- a/package/libmicrohttpd/libmicrohttpd.mk
+++ b/package/libmicrohttpd/libmicrohttpd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBMICROHTTPD_VERSION = 0.9.76
+LIBMICROHTTPD_VERSION = 0.9.77
 LIBMICROHTTPD_SITE = $(BR2_GNU_MIRROR)/libmicrohttpd
 LIBMICROHTTPD_LICENSE_FILES = COPYING
 LIBMICROHTTPD_CPE_ID_VENDOR = gnu
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
