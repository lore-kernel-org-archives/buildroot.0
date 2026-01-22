Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2014D6CFA3
	for <buildroot@archiver.kernel.org>; Thu, 22 Jan 2026 19:57:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 49A1960751;
	Thu, 22 Jan 2026 19:57:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eg4n5jzLIBIZ; Thu, 22 Jan 2026 19:57:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DA6556074C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769111835;
	bh=dDeNPZwxdFAsg8VKOOJdXf5RMROSsOk7h1X2SrMR/18=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=nb0AVSq8f+2wfqU9yzEufeQy3EI1afhslFMJsQy4mpSmbMilc6FD4LhATleAKQkwd
	 SGpZwXmpNBKL72y0E4dd4grCp99nN7pHcu2tYawgNtKcvQbKt6zknf6Llp//IpJGBU
	 Pqd/Q8c2Edv1kzAJv+nsusZmFlpWVkfM+hLh5Wul7CXBWoojkuxbpPgQIMUxJ5LJND
	 7TIKel9HWOcv8po28yCrXpTG8a6EcDqyQqV+IqwiEAQwdU8vZ6yQjGBMIw4BRYQICQ
	 ITVXeuiPPIj4b54OAQrceGUMKSDpHVbPrlbWe+hx1I9lWcLfVVhwWmX5RxrnQPn6Qz
	 rnVRCevEgBesw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DA6556074C;
	Thu, 22 Jan 2026 19:57:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1AACF122
 for <buildroot@buildroot.org>; Thu, 22 Jan 2026 19:57:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F1F47408CD
 for <buildroot@buildroot.org>; Thu, 22 Jan 2026 19:57:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rPffMokJmdqI for <buildroot@buildroot.org>;
 Thu, 22 Jan 2026 19:57:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 23F0B408CC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 23F0B408CC
 for <buildroot@buildroot.org>; Thu, 22 Jan 2026 19:57:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EBCAA87580; Thu, 22 Jan 2026 19:57:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 22 Jan 2026 20:43:30 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b24dc68d09ff3b59f1091415dcb52a78f389b2fe
X-Git-Newrev: 98f359473e10aa1df067d19b0de050b8ee1e1160
X-Patchwork-Hint: ignore
Message-Id: <20260122195713.EBCAA87580@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/alsa-lib: bump version to 1.2.15.3
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=98f359473e10aa1df067d19b0de050b8ee1e1160
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://www.alsa-project.org/wiki/Changes_v1.2.15.2_v1.2.15.3

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/alsa-lib/alsa-lib.hash | 2 +-
 package/alsa-lib/alsa-lib.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/alsa-lib/alsa-lib.hash b/package/alsa-lib/alsa-lib.hash
index 569b4887d4..1cefb08d5e 100644
--- a/package/alsa-lib/alsa-lib.hash
+++ b/package/alsa-lib/alsa-lib.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  637eefd4966ce738da44464494df2b2894e19778fac2f9e7c47277e2af9297f4  alsa-lib-1.2.15.2.tar.bz2
+sha256  7b079d614d582cade7ab8db2364e65271d0877a37df8757ac4ac0c8970be861e  alsa-lib-1.2.15.3.tar.bz2
 sha256  32434afcc8666ba060e111d715bfdb6c2d5dd8a35fa4d3ab8ad67d8f850d2f2b  COPYING
 sha256  bfe16cf823bcff261fc6a062c07ee96660e3c39678f42f39a788a68dbc234ced  aserver/COPYING
diff --git a/package/alsa-lib/alsa-lib.mk b/package/alsa-lib/alsa-lib.mk
index 08d96c3188..50e54712d0 100644
--- a/package/alsa-lib/alsa-lib.mk
+++ b/package/alsa-lib/alsa-lib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ALSA_LIB_VERSION = 1.2.15.2
+ALSA_LIB_VERSION = 1.2.15.3
 ALSA_LIB_SOURCE = alsa-lib-$(ALSA_LIB_VERSION).tar.bz2
 ALSA_LIB_SITE = https://www.alsa-project.org/files/pub/lib
 ALSA_LIB_LICENSE = LGPL-2.1+ (library), GPL-2.0+ (aserver)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
