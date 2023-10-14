Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D768CDB465
	for <buildroot@archiver.kernel.org>; Sat, 14 Oct 2023 12:42:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5852D400D2;
	Sat, 14 Oct 2023 12:42:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5852D400D2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XrJCdcruJJq8; Sat, 14 Oct 2023 12:42:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 268354060C;
	Sat, 14 Oct 2023 12:42:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 268354060C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C99811BF2A4
 for <buildroot@lists.busybox.net>; Sat, 14 Oct 2023 12:42:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A2AF3417A4
 for <buildroot@lists.busybox.net>; Sat, 14 Oct 2023 12:42:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A2AF3417A4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sWPZ0k8jro81 for <buildroot@lists.busybox.net>;
 Sat, 14 Oct 2023 12:42:47 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 592FD4177B
 for <buildroot@buildroot.org>; Sat, 14 Oct 2023 12:42:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 592FD4177B
Received: from fli4l.lan.fli4l (p54a1bf4b.dip0.t-ipconnect.de [84.161.191.75])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id C288FA4C0328
 for <buildroot@buildroot.org>; Sat, 14 Oct 2023 14:42:43 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:59544)
 by fli4l.lan.fli4l with esmtp (Exim 4.96.1)
 (envelope-from <bernd@kuhls.net>) id 1qrdyd-0003hp-0g
 for buildroot@buildroot.org; Sat, 14 Oct 2023 14:42:43 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 14 Oct 2023 14:42:43 +0200
Message-Id: <20231014124243.80138-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1697287363;
 bh=+wl02v0FrFnCBXkwMTk1inlrdhc1/F+SjDLuQt32TnY=;
 h=From:To:Subject:Date:From;
 b=RU3mfsBQKdbYLAObHNfW6bVu8YXVqKC4EDkaZmHO+1jS3dTFfOm9ablcwrHmaTDNd
 BpAmO9I8Q+wcYbnPkEoHfnodcvoKT5GdNBzlf+VhRnwcG+xrenvO+zTyTdf8C3CrVI
 us+D26bGb1s5X5t7RHDaVBMUryqgzObqgPdrhJ/JrNAxZZRoOWfbKRWoCkMN4yvdUz
 BKU0IV1tnNW0sa0rUnfXQ/6jHg9G03iBwqdWZNz8W+SG+g1YoRUq2kek6dnro+AV4/
 i47wjkLqkJx/2dhrud4zMytF9wrx2l1DDp5l7T7Hep75VwssGQhTwJ3z2b+JtHUnZB
 O4v43E77F8CGw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=RU3mfsBQ
Subject: [Buildroot] [PATCH 1/1] package/samba4: security bump version to
 4.18.8
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

Release notes: https://www.samba.org/samba/history/samba-4.18.8.html

Fixes CVE-2023-3961, CVE-2023-4091, CVE-2023-4154,  CVE-2023-42669 &
CVE-2023-42670.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/samba4/samba4.hash | 4 ++--
 package/samba4/samba4.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/samba4/samba4.hash b/package/samba4/samba4.hash
index fea760c500..9843d419f0 100644
--- a/package/samba4/samba4.hash
+++ b/package/samba4/samba4.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://download.samba.org/pub/samba/stable/samba-4.18.7.tar.asc
-sha256  61559a694f6a13cdc635c2d0e302519756f5f7bee9a61ceab3dc3ceff52160f6  samba-4.18.7.tar.gz
+# https://download.samba.org/pub/samba/stable/samba-4.18.8.tar.asc
+sha256  4fb87bceaeb01d832a59046c197a044b7e8e8000581548b5d577a6cda03344d1  samba-4.18.8.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index cfa94fc141..9cf7a59d9b 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAMBA4_VERSION = 4.18.7
+SAMBA4_VERSION = 4.18.8
 SAMBA4_SITE = https://download.samba.org/pub/samba/stable
 SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
 SAMBA4_INSTALL_STAGING = YES
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
