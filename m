Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DD24C00144
	for <buildroot@archiver.kernel.org>; Fri, 29 Jul 2022 18:46:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2BD608461B;
	Fri, 29 Jul 2022 18:46:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2BD608461B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sJF-Lh5xbe-g; Fri, 29 Jul 2022 18:46:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3B9C784654;
	Fri, 29 Jul 2022 18:46:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3B9C784654
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9BCAD1C2744
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 18:45:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 756AB41BD5
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 18:45:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 756AB41BD5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BxWFQ2-RTOvB for <buildroot@lists.busybox.net>;
 Fri, 29 Jul 2022 18:45:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 79A9841BA9
Received: from mxd2.seznam.cz (mxd2.seznam.cz [IPv6:2a02:598:2::210])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 79A9841BA9
 for <buildroot@buildroot.org>; Fri, 29 Jul 2022 18:45:51 +0000 (UTC)
Received: from email.seznam.cz
 by email-smtpc26b.ng.seznam.cz (email-smtpc26b.ng.seznam.cz [10.23.18.37])
 id 39a4eb838f8454d839a355f4; Fri, 29 Jul 2022 20:45:50 +0200 (CEST)
Received: from localhost.localdomain (mail.ms-free.net [185.147.46.46])
 by email-relay28.ng.seznam.cz (Seznam SMTPD 1.3.137) with ESMTP;
 Fri, 29 Jul 2022 20:45:47 +0200 (CEST)  
From: Petr Vorel <pevik@seznam.cz>
To: buildroot@buildroot.org
Date: Fri, 29 Jul 2022 20:45:41 +0200
Message-Id: <20220729184542.213544-3-pevik@seznam.cz>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220729184542.213544-1-pevik@seznam.cz>
References: <20220729184542.213544-1-pevik@seznam.cz>
MIME-Version: 1.0
X-szn-frgn: <5a44fa52-d5a2-4ed4-b306-c37f6c9ee94d>
X-szn-frgc: <0>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=seznam.cz; s=beta; 
 t=1659120350; bh=jJD56O9dSw2P9Er450byWzJuvlyHBWmPzVhNmO6vt+Y=;
 h=Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:X-szn-frgn:
 X-szn-frgc;
 b=AfqLFFE+Ru52AqONVomsPZunxUGes3uOvXLKx5vs/nhCc69wj8IsGZFMH07T9BlmD
 fI6p2wjh2NBAzM3Z5FksyFtP43CLEfQdPP3WcUzuxCt+aSZv4v+TY3wMBofwM5Bkm/
 JC5RKGAHNrl++0gJ0rzR+3tfSFb3PjAUAyF2tRBA=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=seznam.cz header.i=@seznam.cz
 header.a=rsa-sha256 header.s=beta header.b=AfqLFFE+
Subject: [Buildroot] [PATCH 2/3] package/libqmi: bump version to 1.30.8
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
Cc: Matt Weber <matthew.weber@collins.com>,
 Aleksander Morgado <aleksander@aleksander.es>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Petr Vorel <petr.vorel@gmail.com>

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
 package/libqmi/libqmi.hash | 2 +-
 package/libqmi/libqmi.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libqmi/libqmi.hash b/package/libqmi/libqmi.hash
index ef2da77a2a..dee2a94d93 100644
--- a/package/libqmi/libqmi.hash
+++ b/package/libqmi/libqmi.hash
@@ -1,4 +1,4 @@
 # Locally computed:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
-sha256  82ddd3f77c602b1e0c11d3e41d0563ede11f95036ebfcf929bc89157b13928e6  libqmi-1.30.4.tar.gz
+sha256  b2e0285690f94fe6d0cc3c422514117b187c8ddb90133c2900993e13343f5a5e  libqmi-1.30.8.tar.gz
diff --git a/package/libqmi/libqmi.mk b/package/libqmi/libqmi.mk
index b33e2fdc47..6b7f45729e 100644
--- a/package/libqmi/libqmi.mk
+++ b/package/libqmi/libqmi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBQMI_VERSION = 1.30.4
+LIBQMI_VERSION = 1.30.8
 LIBQMI_SITE = https://gitlab.freedesktop.org/mobile-broadband/libqmi/-/archive/$(LIBQMI_VERSION)
 LIBQMI_LICENSE = LGPL-2.0+ (library), GPL-2.0+ (programs)
 LIBQMI_LICENSE_FILES = COPYING COPYING.LIB
-- 
2.37.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
