Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAC9CC00144
	for <buildroot@archiver.kernel.org>; Fri, 29 Jul 2022 18:46:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 35FF360B3F;
	Fri, 29 Jul 2022 18:46:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 35FF360B3F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J0GeyPvDPmIB; Fri, 29 Jul 2022 18:46:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4A9D160B4A;
	Fri, 29 Jul 2022 18:46:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4A9D160B4A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6EA911C11A5
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 18:45:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 52FAB404D5
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 18:45:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 52FAB404D5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CMQFEzNMP0uX for <buildroot@lists.busybox.net>;
 Fri, 29 Jul 2022 18:45:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7871240298
Received: from mxd2.seznam.cz (mxd2.seznam.cz [IPv6:2a02:598:2::210])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7871240298
 for <buildroot@buildroot.org>; Fri, 29 Jul 2022 18:45:51 +0000 (UTC)
Received: from email.seznam.cz
 by email-smtpc7a.ng.seznam.cz (email-smtpc7a.ng.seznam.cz [10.23.10.195])
 id 3138b7a5871808fe313f09d2; Fri, 29 Jul 2022 20:45:49 +0200 (CEST)
Received: from localhost.localdomain (mail.ms-free.net [185.147.46.46])
 by email-relay28.ng.seznam.cz (Seznam SMTPD 1.3.137) with ESMTP;
 Fri, 29 Jul 2022 20:45:47 +0200 (CEST)  
From: Petr Vorel <pevik@seznam.cz>
To: buildroot@buildroot.org
Date: Fri, 29 Jul 2022 20:45:40 +0200
Message-Id: <20220729184542.213544-2-pevik@seznam.cz>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220729184542.213544-1-pevik@seznam.cz>
References: <20220729184542.213544-1-pevik@seznam.cz>
MIME-Version: 1.0
X-szn-frgn: <ea0ef653-7ead-4da9-a137-6cf3766a3433>
X-szn-frgc: <0>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=seznam.cz; s=beta; 
 t=1659120349; bh=7LZ2WFXkyvC6gUyWO8uxRAIYF0dF9gqLmjfiS7k7CLw=;
 h=Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:X-szn-frgn:
 X-szn-frgc;
 b=emZT+/8VpiM+lTO/xsDaQSfoG1USw5jMo6lfuL7g9q/mHjLOXFaCO60cbY896rLgv
 jDh2ICa0PHkI9sOk0yxoqsZVIGgugPEtQm78mZ8D/0zh6FLF4AoNTL51WgKO77hrOv
 E5IO0tBpFeCV3bGREelWZFBkpeTPvVLuwh6tGcvw=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=seznam.cz header.i=@seznam.cz
 header.a=rsa-sha256 header.s=beta header.b=emZT+/8V
Subject: [Buildroot] [PATCH 1/3] package/libmbim: bump version to 1.26.4
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
 package/libmbim/libmbim.hash | 2 +-
 package/libmbim/libmbim.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libmbim/libmbim.hash b/package/libmbim/libmbim.hash
index 7ecc99d333..e98c53b1c9 100644
--- a/package/libmbim/libmbim.hash
+++ b/package/libmbim/libmbim.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  c12e61ea462fca40ddba2a8e1e401242d4f13827944369fad27ff70936b1e09d  libmbim-1.26.2.tar.gz
+sha256  58cd9ab1a2af9bbf40f9c02d3152a96baaa34a5f66a4289e928c7cf1c9584abb  libmbim-1.26.4.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
diff --git a/package/libmbim/libmbim.mk b/package/libmbim/libmbim.mk
index eba5f0a6e0..1e2b1771eb 100644
--- a/package/libmbim/libmbim.mk
+++ b/package/libmbim/libmbim.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBMBIM_VERSION = 1.26.2
+LIBMBIM_VERSION = 1.26.4
 LIBMBIM_SITE = https://gitlab.freedesktop.org/mobile-broadband/libmbim/-/archive/$(LIBMBIM_VERSION)
 LIBMBIM_LICENSE = LGPL-2.0+ (library), GPL-2.0+ (programs)
 LIBMBIM_LICENSE_FILES = COPYING COPYING.LIB
-- 
2.37.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
