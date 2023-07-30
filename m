Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A80FEC001DE
	for <buildroot@archiver.kernel.org>; Sun, 30 Jul 2023 10:14:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6307860E15;
	Sun, 30 Jul 2023 10:14:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6307860E15
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n418JXq3PAdW; Sun, 30 Jul 2023 10:14:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B358060AEF;
	Sun, 30 Jul 2023 10:14:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B358060AEF
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F04001BF41B
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 10:14:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C9A7E81799
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 10:14:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C9A7E81799
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FubZGlQPvbh1 for <buildroot@lists.busybox.net>;
 Sun, 30 Jul 2023 10:14:26 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 769D781778
 for <buildroot@buildroot.org>; Sun, 30 Jul 2023 10:14:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 769D781778
Received: from fli4l.lan.fli4l (p4fd6c649.dip0.t-ipconnect.de [79.214.198.73])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 1AD40A4C0824;
 Sun, 30 Jul 2023 12:14:23 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:51944)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qQ3RO-0002J5-2e;
 Sun, 30 Jul 2023 12:14:22 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 30 Jul 2023 12:14:22 +0200
Message-Id: <20230730101422.2276724-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1690712063;
 bh=ybocEdK6d065MGi3zQVSvlOXo45Rh9MBReFX+3c0S5U=;
 h=From:To:Cc:Subject:Date:From;
 b=y7ROK4oK7rPHqMvFIz86tO/DgVTGxAs393U8ZTq5OzkVE7dOcBdIPePF4iCBQcZ0Z
 1tjbJI+Jhp28NLcvh9/Jlt0gqc7inK3lrttH6+cexjM4cy1oBSEF7/mmKD+69OM1pC
 GoJZZyryPDyZe4Vv1ZqzzmXWFy3sNJYGgdK4T18bDSICszXEgmKDASmzSVI4mq+AHy
 peUtLhnVhUCUXEPDVx1we1HHrblIAChNBlgoktVgRZ1wzca0tXDvYmzF7GqDSujvQE
 Tjb2hCrAl3eCzb7aygRbuMci060USpOIU9HJ6yfbYiMsA24DIqheayBNwLxmV/cf0q
 SfvEQVSrxXWqw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=y7ROK4oK
Subject: [Buildroot] [PATCH 1/1] package/libuv: remove POST_PATCH_HOOK
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
Cc: Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Buildroot commit 1738b5582ba0cf715303f4ebfa1d2323a33d0ae4, which
switched  _SOURCE to an upstream-provided tarball, forgot to remove the
POST_PATCH_HOOK which adds a file already present in the tarball.

Fixes:
http://autobuild.buildroot.net/results/e4d0c06e3babed6b290b6223a1cf7e4cce38064c/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libuv/libuv.mk | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/package/libuv/libuv.mk b/package/libuv/libuv.mk
index 75590ad8f2..76316484e4 100644
--- a/package/libuv/libuv.mk
+++ b/package/libuv/libuv.mk
@@ -15,16 +15,4 @@ LIBUV_LICENSE = BSD-2-Clause, BSD-3-Clause, ISC, MIT
 LIBUV_LICENSE_FILES = LICENSE LICENSE-extra
 LIBUV_CPE_ID_VENDOR = libuv
 
-# Upstream needs tests to be run sequentially. This is the default in
-# automake 1.11 and before, but not starting in 1.12. To maintain
-# sequentiality in 1.12 and later, the automake option 'serial-tests'
-# must be used, Unfortunately, it is not recognised by 1.11 and
-# before. So upstream only adds it conditionally. We use automake
-# 1.14, so we need it.
-define LIBUV_FIXUP_AUTOGEN
-	echo "m4_define([UV_EXTRA_AUTOMAKE_FLAGS], [serial-tests])" \
-		>$(@D)/m4/libuv-extra-automake-flags.m4
-endef
-LIBUV_POST_PATCH_HOOKS += LIBUV_FIXUP_AUTOGEN
-
 $(eval $(autotools-package))
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
