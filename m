Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33069C4167B
	for <buildroot@archiver.kernel.org>; Wed, 29 Nov 2023 21:07:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4D92861591;
	Wed, 29 Nov 2023 21:07:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4D92861591
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CGFNnK8Cc-PB; Wed, 29 Nov 2023 21:07:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A39476159B;
	Wed, 29 Nov 2023 21:07:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A39476159B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8F0AC1BF377
 for <buildroot@lists.busybox.net>; Wed, 29 Nov 2023 21:07:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 67D8441D99
 for <buildroot@lists.busybox.net>; Wed, 29 Nov 2023 21:07:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 67D8441D99
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tn1bkP3ygIYl for <buildroot@lists.busybox.net>;
 Wed, 29 Nov 2023 21:07:30 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 048B941E00
 for <buildroot@buildroot.org>; Wed, 29 Nov 2023 21:07:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 048B941E00
Received: from fli4l.lan.fli4l (p4fd6c4a5.dip0.t-ipconnect.de [79.214.196.165])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id BE12BA4C0286
 for <buildroot@buildroot.org>; Wed, 29 Nov 2023 22:07:25 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:46006)
 by fli4l.lan.fli4l with esmtp (Exim 4.96.2)
 (envelope-from <bernd@kuhls.net>) id 1r8RmH-0008Bf-1C
 for buildroot@buildroot.org; Wed, 29 Nov 2023 22:07:25 +0100
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed, 29 Nov 2023 22:07:25 +0100
Message-Id: <20231129210725.3185260-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1701292045;
 bh=nSo7GgawA+hE2DY0IxCafrYfsNyo+ie0sM+menDcKl8=;
 h=From:To:Subject:Date:From;
 b=n7qQmNu9YQTy6HRn+yf1iB3N48XiQGeCZWu83OoAgoFKFKlNOUvelJn4P3EAz7+Gh
 8tCrLuAQt31wPuWoUOvxg+bxPWa9hBViPT45XNAj9y/qf2jd2b73oU56IYQgI+7Zzu
 Yk40bem7PNlHdUG2R+taK2TkHOtfNaKRMhJzntwVlOxW7jEPDW1U2f9TvcUr6PJN0K
 sjjs10Ww5eLzgj1PvewV4Mw4hPlCS1qL0+3R3tWOrkTQ5vIrdco4VsYTzcNsD3ZE4j
 /23WVFH9UsfzRjKsGRGt6bJlQLudcWKbmCKNJtL6ClHabA+WgegK331+rMum3+GA4u
 Z2YZUXDU/Anxg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=n7qQmNu9
Subject: [Buildroot] [PATCH 1/1] package/samba4: security bump version to
 4.19.3
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

Fixes CVE-2018-14628:
https://www.samba.org/samba/security/CVE-2018-14628.html

Release notes:
https://www.samba.org/samba/history/samba-4.19.3.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/samba4/samba4.hash | 4 ++--
 package/samba4/samba4.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/samba4/samba4.hash b/package/samba4/samba4.hash
index 06b9cecddc..81e8a6f2e9 100644
--- a/package/samba4/samba4.hash
+++ b/package/samba4/samba4.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://download.samba.org/pub/samba/stable/samba-4.19.2.tar.asc
-sha256  9e63f0505e1c631f1db0b7a9349a51e925c026ca03af3fd5d812228bb597d393  samba-4.19.2.tar.gz
+# https://download.samba.org/pub/samba/stable/samba-4.19.3.tar.asc
+sha256  280553b90f131b1940580df293653c9e9bd8906201f5def6e5e8c160f0bfac96  samba-4.19.3.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index b89f961d99..42bcd0a928 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAMBA4_VERSION = 4.19.2
+SAMBA4_VERSION = 4.19.3
 SAMBA4_SITE = https://download.samba.org/pub/samba/stable
 SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
 SAMBA4_INSTALL_STAGING = YES
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
