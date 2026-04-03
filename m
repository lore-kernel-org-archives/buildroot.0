Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA06CE7E363
	for <buildroot@archiver.kernel.org>; Fri,  3 Apr 2026 10:28:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 784626116F;
	Fri,  3 Apr 2026 10:28:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hHrRHVU_4kje; Fri,  3 Apr 2026 10:28:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F2C2C61147
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775212127;
	bh=G8RwWqMPk07wihqQKypuO/h0DvvkTbIoZjAET95DzOg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=WglKCtLwGZr3j/w9mEcjEn+RzYxNw8rBC3foS+k+6WuODCDXsvN/jvNHbd4cpp6GL
	 /gWnIhLGxh6RqUzG8Bcs1nTyH9pPAMUDSV8hvv00y0atmSIvhq6L/yh/sSD81EFeek
	 iFrsWBQBR+PJK7GqWZqaLslezrr0sIThvZ3YoX6y7J15DWPWO25Ba5tCfP89hF5Plc
	 VgJ1dI1qF9IVWUzgDzY90x35fnKcboJplyWZwOBpxafwm5v5OYZsCwiwvpW5pUiCgV
	 JkKDeDLl+4Dm2D/AJ1Pkez3kX5fdWg5o4bzj5QjmOA99bY4l9dxR8bLD7E7ymsIxGB
	 ruAw0Upd5HS0g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F2C2C61147;
	Fri,  3 Apr 2026 10:28:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1E9A6399
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 10:28:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AD97760898
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 10:28:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nsDv7Wxbfw4h for <buildroot@buildroot.org>;
 Fri,  3 Apr 2026 10:28:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0C98E608A1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0C98E608A1
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 10:28:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 89F0F7FFAA; Fri,  3 Apr 2026 10:28:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 3 Apr 2026 11:53:03 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: b185cceaffd8bc536b9621476636faf8a747584a
X-Git-Newrev: dccfa5b18f46f8e84e08cd1ab0ff8d4e65c4d462
X-Patchwork-Hint: ignore
Message-Id: <20260403102836.89F0F7FFAA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/bind: security
 bump to version 9.18.47
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/dccfa5b18f46f8e84e08cd1ab0ff8d4e65c4d462
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

Release notes:
https://ftp.isc.org/isc/bind9/9.18.47/doc/arm/html/notes.html

Changelog:
https://ftp.isc.org/isc/bind9/9.18.47/doc/arm/html/changelog.html

Fixes CVE-2026-1519.

Fixes bug:
GL #5708
https://gitlab.isc.org/isc-projects/bind9/-/issues/5708

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 0fa55218f44e30d62843e0b99921a4b26e6aa6c7)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/bind/bind.hash | 4 ++--
 package/bind/bind.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/bind/bind.hash b/package/bind/bind.hash
index 4671eab985..09d35a3698 100644
--- a/package/bind/bind.hash
+++ b/package/bind/bind.hash
@@ -1,4 +1,4 @@
-# Verified from https://ftp.isc.org/isc/bind9/9.18.46/bind-9.18.46.tar.xz.asc
+# Verified from https://ftp.isc.org/isc/bind9/9.18.47/bind-9.18.47.tar.xz.asc
 # with key D99CCEAF879747014F038D63182E23579462EFAA
-sha256  6b59f0de30c6901cce783007d06f7dd717ec3aa74b5bb5cc5159f93f0be4fc1d  bind-9.18.46.tar.xz
+sha256  9d544ba013decd1ee60e3c99d5548dd21aaaf5db96205dfc8623f39f061f14be  bind-9.18.47.tar.xz
 sha256  9734825d67a3ac967b2c2f7c9a83c9e5db1c2474dbe9599157c3a4188749ebd4  COPYRIGHT
diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index e58dcda34d..b889f922b6 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BIND_VERSION = 9.18.46
+BIND_VERSION = 9.18.47
 BIND_SOURCE= bind-$(BIND_VERSION).tar.xz
 BIND_SITE = https://ftp.isc.org/isc/bind9/$(BIND_VERSION)
 BIND_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
