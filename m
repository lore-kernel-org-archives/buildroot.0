Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F7CCF8D776
	for <buildroot@archiver.kernel.org>; Thu, 16 Apr 2026 20:11:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2F2E360A6D;
	Thu, 16 Apr 2026 20:11:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ENj7RW6orm5B; Thu, 16 Apr 2026 20:11:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 47F8260A6F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776370294;
	bh=aABN09q4VBXzfvIef08I8m5y3BEWIGUkxqB/B79Nq0E=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=AYHD9iL+kvIqlGplemO3cTmbU3N1MTdOa+F2Ur1rHgKFa2vyoGpA6EBBsSLbbggcc
	 mn3cBFNHpovAxsq+UAnewWGZoozqTWLBfr0e4205bQNRly+nf6nYoagnuxjFXt2sLx
	 cGC772LejltMNfSmXPVsZmr8LCK1YQvmMJWbsHvY/ZgVVasGXlgW+/Z6gxP7LXxtJ4
	 pjjm++iBdSvGPz2adJmqLOV2Gx9wWXd11ToIus6c3A74yrhX0R+0AYAwacj25a8D5c
	 ARaAc8tIrgmWG7IeFRCgIEJj0EKj2MQfsanxjmRoQAa7zZOWAo6Q3Nfn8GJ9tHsHFz
	 OyLFvol8GBnQA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 47F8260A6F;
	Thu, 16 Apr 2026 20:11:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7AAD42F4
 for <buildroot@buildroot.org>; Thu, 16 Apr 2026 20:11:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 78381405C3
 for <buildroot@buildroot.org>; Thu, 16 Apr 2026 20:11:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dPMPOYEZIEu4 for <buildroot@buildroot.org>;
 Thu, 16 Apr 2026 20:11:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9DCB9405BA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9DCB9405BA
 for <buildroot@buildroot.org>; Thu, 16 Apr 2026 20:11:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 44845817D6; Thu, 16 Apr 2026 20:11:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 16 Apr 2026 22:09:19 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4f08987479f2ae796da6734d325e5ff6266d3374
X-Git-Newrev: 746d57946803a2f952cc08505159e19f135bd628
X-Patchwork-Hint: ignore
Message-Id: <20260416201132.44845817D6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/giflib: bump version to 6.1.3
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/746d57946803a2f952cc08505159e19f135bd628
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://sourceforge.net/p/giflib/code/ci/6.1.3/tree/NEWS

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/giflib/giflib.hash | 6 +++---
 package/giflib/giflib.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/giflib/giflib.hash b/package/giflib/giflib.hash
index 8c1b1d06f5..76d1a34063 100644
--- a/package/giflib/giflib.hash
+++ b/package/giflib/giflib.hash
@@ -1,6 +1,6 @@
 # From https://sourceforge.net/projects/giflib/files/giflib-6.x/
-md5  d4ad42777ef499a7c6f8aabf2ccf7716  giflib-6.1.2.tar.gz
-sha1  bf0440c7aee5a0a151d7abbbe3657d3c1998ce86  giflib-6.1.2.tar.gz
+md5  a70e90ff780e9ebee9cb84b82bbd46a7  giflib-6.1.3.tar.gz
+sha1  5bc9aa3e5188d1828b5df8aed81720273952b2d4  giflib-6.1.3.tar.gz
 # Locally computed
-sha256  2421abb54f5906b14965d28a278fb49e1ec9fe5ebbc56244dd012383a973d5c0  giflib-6.1.2.tar.gz
+sha256  b65b66b99f0424b93525f987386f22fc5efb9da2bfc92ad4a532249aaffbab0e  giflib-6.1.3.tar.gz
 sha256  ed5d90cb4a041bddad679470a071302ab05ae5d0ec2cf8f9c97ad7b2708751e6  COPYING
diff --git a/package/giflib/giflib.mk b/package/giflib/giflib.mk
index bb563ee689..83bac5d2fb 100644
--- a/package/giflib/giflib.mk
+++ b/package/giflib/giflib.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 GIFLIB_VERSION_MAJOR = 6
-GIFLIB_VERSION = $(GIFLIB_VERSION_MAJOR).1.2
+GIFLIB_VERSION = $(GIFLIB_VERSION_MAJOR).1.3
 GIFLIB_SITE = https://sourceforge.net/projects/giflib/files/giflib-$(GIFLIB_VERSION_MAJOR).x
 GIFLIB_INSTALL_STAGING = YES
 GIFLIB_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
