Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB9AAC3DA66
	for <buildroot@archiver.kernel.org>; Fri, 25 Aug 2023 21:05:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9846183EB5;
	Fri, 25 Aug 2023 21:05:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9846183EB5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OVPT5g8mR7Cz; Fri, 25 Aug 2023 21:05:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F251083E33;
	Fri, 25 Aug 2023 21:05:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F251083E33
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 91D301BF284
 for <buildroot@lists.busybox.net>; Fri, 25 Aug 2023 21:05:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 78A8740135
 for <buildroot@lists.busybox.net>; Fri, 25 Aug 2023 21:05:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 78A8740135
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iWlq2HoRX5AV for <buildroot@lists.busybox.net>;
 Fri, 25 Aug 2023 21:05:41 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 968F3405E6
 for <buildroot@buildroot.org>; Fri, 25 Aug 2023 21:05:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 968F3405E6
Received: from fli4l.lan.fli4l (p5b3a06c4.dip0.t-ipconnect.de [91.58.6.196])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id CFA8AA4C09E7
 for <buildroot@buildroot.org>; Fri, 25 Aug 2023 23:05:38 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:42690)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qZdzu-0002Kp-20
 for buildroot@buildroot.org; Fri, 25 Aug 2023 23:05:38 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 25 Aug 2023 23:05:38 +0200
Message-Id: <20230825210538.10419-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1692997538;
 bh=DFl1ZzRdYIBnqDzs+MRGQGNH4Q4pJjIwKUW3SiZmMj8=;
 h=From:To:Subject:Date:From;
 b=IURKTMFBmuEIuOTec3mUEFI1vlCQUZaS+hjDuefN98aOGFSRz75PViM11LkoCrZtA
 vHwGyB4JuyjPZAeKY+PgspQUYf/QgmaDSotqeKaEd99XnnHxFxf3R0yu3pqanxELJ2
 kxWCWg5vnuK5hvNnj9syhiUTUkeIeT30O6QRcHoF4asqMmbPJh/nj7wLlXfcty7kuc
 wguIftmWjmxokT/qUO+3CwHOzIyTMaTBbby5d2qYov+zGaNHShil1HuYUXZL2pK3qg
 NyhM3U5/zj/6UYp3bbm22u4UO0KoLdmRnMLujtIToy7QWONbsQaaAEHkFjV9Aq49ve
 eVwQbC/mAH/UA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=IURKTMFB
Subject: [Buildroot] [PATCH/next 1/1] package/kodi-pvr-nextpvr: bump version
 to 20.4.3-Nexus
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
 package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.hash | 2 +-
 package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.hash b/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.hash
index 9ef0d4e758..dcbc504a23 100644
--- a/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.hash
+++ b/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  1ce85447426ddf6d443a5e3444145a2d3af65ce73d9fb583e42cd8afc9d599a5  kodi-pvr-nextpvr-20.4.2-Nexus.tar.gz
+sha256  752dff532a277797f3fefc1ced7fea6efb8d92982d9040c4080c1e6dbab203a0  kodi-pvr-nextpvr-20.4.3-Nexus.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.mk b/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.mk
index 2629cd9147..e89aed7d0a 100644
--- a/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.mk
+++ b/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_NEXTPVR_VERSION = 20.4.2-Nexus
+KODI_PVR_NEXTPVR_VERSION = 20.4.3-Nexus
 KODI_PVR_NEXTPVR_SITE = $(call github,kodi-pvr,pvr.nextpvr,$(KODI_PVR_NEXTPVR_VERSION))
 KODI_PVR_NEXTPVR_LICENSE = GPL-2.0+
 KODI_PVR_NEXTPVR_LICENSE_FILES = LICENSE.md
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
