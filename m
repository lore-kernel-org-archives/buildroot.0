Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29257C3DA5D
	for <buildroot@archiver.kernel.org>; Thu, 25 Jul 2024 15:30:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 72B0F60ABF;
	Thu, 25 Jul 2024 15:30:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NONlMJQm1c9W; Thu, 25 Jul 2024 15:30:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 451A160AC4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 451A160AC4;
	Thu, 25 Jul 2024 15:30:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0DA151BF357
 for <buildroot@lists.busybox.net>; Thu, 25 Jul 2024 15:30:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F05B340994
 for <buildroot@lists.busybox.net>; Thu, 25 Jul 2024 15:30:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xERDlw1Xuu3l for <buildroot@lists.busybox.net>;
 Thu, 25 Jul 2024 15:30:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.158.146;
 helo=smtpweb146.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CE636406EB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CE636406EB
Received: from smtpweb146.aruba.it (smtpweb146.aruba.it [62.149.158.146])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CE636406EB
 for <buildroot@buildroot.org>; Thu, 25 Jul 2024 15:30:34 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id X0QJsTikQxmtuX0QKshxdC; Thu, 25 Jul 2024 17:30:32 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Thu, 25 Jul 2024 17:30:29 +0200
Message-Id: <20240725153029.613254-3-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240725153029.613254-1-giulio.benetti@benettiengineering.com>
References: <20240725153029.613254-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfEpr23CZfrKbxUOYnQ03WTr9m6uG1j4ipyCKoj5Y62dZbdKIifE0iW6R881r71xnDQ9S7YIvPiLmUgg22GPuRwDoAJmMfw+4Lq3Pk+cbko+12ZrcWUNw
 GdFRPaAdFXCXCHk1EjpZIx1/J9Fpj+fZWNwoMEFUS8rFkXZPEyeuPs0obPWn5RA5fEH8UqsEOUi+JBdXwY7XGTB5AW7ZuS+HIzQtibystpQNxk/PZMtd6Nyc
 WG65JiqSuDlk2QeGKrhiM2RkCXngpY3xLeLFM3DgwSo8uNXYSAy1eF84ib9iidVCKIjEtfkz5S9QcBXGpjHS90Vp5n1/zspBuVfGKPJnqRQsuSVFN0F2mVAF
 z8/TimFn
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1721921432; bh=rh0SGaTkHivSDllvO8o62G2SXZPBF4GJOSs9VSepScM=;
 h=From:To:Subject:Date:MIME-Version;
 b=C6toP7Vqki0c55GrV+u46ezAgl2uETmuxUy32mEd7YNJkEoxB80htQbATAIbMwMK7
 Cf/ojQTYXUd0FnUqXtjxM3SXazmZZZ5CbkFTGh5sPox6vSpcvFcpQCMal9ZP6/XE0P
 HDw/lRhmHgKhHin8ZYjsQQ/5ixn7npVUmT6Eo4v5NQP9sX9M6MAgYRkDmzd85A4CLE
 IsfYnr2Aj2QvXdVHVmIGqHpMbUQ6d/FDKDQHoy01AoS+n50K38nDjY1mh80+ZnOWPe
 mgRVmxoku9ooR/FhIkuhroM9ZNQeqtYHxvqUFlEZaEU/7u6wQbrUViPGDxfBhGHsLf
 h8owBfrw6nU5A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=C6toP7Vq
Subject: [Buildroot] [PATCH] package/libnss: bump version to 3.102.1
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/libnss/libnss.hash | 4 ++--
 package/libnss/libnss.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libnss/libnss.hash b/package/libnss/libnss.hash
index 8c21316b7b..ae82e7eaa8 100644
--- a/package/libnss/libnss.hash
+++ b/package/libnss/libnss.hash
@@ -1,4 +1,4 @@
-# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_102_RTM/src/SHA256SUMS
-sha256  c29b03f24856db18a34fbcde737fcca6407c27b5f3f60baba5111460e6cb307b  nss-3.102.tar.gz
+# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_102_1_RTM/src/SHA256SUMS
+sha256  54982d3587e41579c94f2036ba084438b073f8456bbd873b7a942c057e9737cc  nss-3.102.1.tar.gz
 # Locally calculated
 sha256  a20c1a32d1f8102432360b42e932869f7c11c7cdbacf9cac554c422132af47f4  nss/COPYING
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index 3916a78381..0ebc49db21 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSS_VERSION = 3.102
+LIBNSS_VERSION = 3.102.1
 LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
 LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
 LIBNSS_DISTDIR = dist
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
