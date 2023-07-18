Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5816BEB64DC
	for <buildroot@archiver.kernel.org>; Tue, 18 Jul 2023 18:44:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 985FB416F8;
	Tue, 18 Jul 2023 18:44:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 985FB416F8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dK69_B4oMzYu; Tue, 18 Jul 2023 18:44:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6DFBC4177F;
	Tue, 18 Jul 2023 18:44:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6DFBC4177F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6EA4D1BF333
 for <buildroot@lists.busybox.net>; Tue, 18 Jul 2023 18:44:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 55A1C4032A
 for <buildroot@lists.busybox.net>; Tue, 18 Jul 2023 18:44:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 55A1C4032A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XLvJl8foD1sS for <buildroot@lists.busybox.net>;
 Tue, 18 Jul 2023 18:44:45 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AB89D40004
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AB89D40004
 for <buildroot@buildroot.org>; Tue, 18 Jul 2023 18:44:45 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b341.dip0.t-ipconnect.de [84.161.179.65])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id ECA0AA4C0FE9
 for <buildroot@buildroot.org>; Tue, 18 Jul 2023 20:44:31 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:54128)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qLpgV-0006Zb-2F
 for buildroot@buildroot.org; Tue, 18 Jul 2023 20:44:31 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue, 18 Jul 2023 20:44:29 +0200
Message-Id: <20230718184429.2444591-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230718184429.2444591-1-bernd@kuhls.net>
References: <20230718184429.2444591-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1689705871;
 bh=JHOxFnQmlLQaQQeX/NLjsbJ9b3KKYvq6yDTMWW289W8=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=GS8FKleJ4CWyqvtGhAz5fXBYPqSJGCCIHQIB0Bi4y172FnJ2vlAc8ow1JjNqno7fr
 kPA+QfjDjvh36ycGfQiWC16BIwTBtwjPA4fcP63VOrpaYc1l7qo2iCZYwasgF9n0rH
 AtsGO1t1zmnOJnzd5wn3aea+zJm2XqhDkkN5thZ5u7zfRLifI8wGYYzzk4961fq/cy
 I969ysPVtk57iJlErK0vevPFZxUJY7YCr8hdc9ADpn2rQmvh1mKFn29+SSsCZ4Ludi
 3aPPr95wpm8fp8MIWdMBn0yuSAMy1YzkvpT5UhYK9l/yPROmxGV2s2JF2sBBWr0tGb
 y9gYSenO/LC3w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=GS8FKleJ
Subject: [Buildroot] [PATCH 2/2] package/kodi-pvr-zattoo: bump version to
 20.3.12-Nexus
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/kodi-pvr-zattoo/kodi-pvr-zattoo.hash | 2 +-
 package/kodi-pvr-zattoo/kodi-pvr-zattoo.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-pvr-zattoo/kodi-pvr-zattoo.hash b/package/kodi-pvr-zattoo/kodi-pvr-zattoo.hash
index 9939c6f73b..c7a248622b 100644
--- a/package/kodi-pvr-zattoo/kodi-pvr-zattoo.hash
+++ b/package/kodi-pvr-zattoo/kodi-pvr-zattoo.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  68aa0a3af4f10396c866b0da225928033d0bbf980b8884c944dd1829e013435d  kodi-pvr-zattoo-20.3.10-Nexus.tar.gz
+sha256  db206571c4e8a9f85c349dfabe71c3c3a9da51dafdc84ebc995b79db3544f7ec  kodi-pvr-zattoo-20.3.12-Nexus.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-zattoo/kodi-pvr-zattoo.mk b/package/kodi-pvr-zattoo/kodi-pvr-zattoo.mk
index 53153f8f59..04b34da91b 100644
--- a/package/kodi-pvr-zattoo/kodi-pvr-zattoo.mk
+++ b/package/kodi-pvr-zattoo/kodi-pvr-zattoo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_ZATTOO_VERSION = 20.3.10-Nexus
+KODI_PVR_ZATTOO_VERSION = 20.3.12-Nexus
 KODI_PVR_ZATTOO_SITE = $(call github,rbuehlma,pvr.zattoo,$(KODI_PVR_ZATTOO_VERSION))
 KODI_PVR_ZATTOO_LICENSE = GPL-2.0+
 KODI_PVR_ZATTOO_LICENSE_FILES = LICENSE.md
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
