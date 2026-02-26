Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DEB2FD8FCE
	for <buildroot@archiver.kernel.org>; Thu, 26 Feb 2026 15:50:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5DB4760F80;
	Thu, 26 Feb 2026 15:50:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HJWwCqhFtIZl; Thu, 26 Feb 2026 15:50:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 79CAA60B5E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772121013;
	bh=Jy9yMnxZK6VvD4l8c/mHGbuq23dINnu4Dizl8w/RoIE=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=pP5gJqyQL5RFG/wwksMXko0oqTM2z22yfLUsEaU/QDYkY/K5yk0CkCVBDEhODf75x
	 M6Pa+YKO2SkhqHoFOiJ0mKivnSiENzLhG+HA1ohhwEtVYDbejtSGcO8y0P3NCXXGon
	 ULjBZYb7cVZndIDgXd0ZM+1NFXHOFWZcRPnxmUcK6sY+uC++cVCU8+4D9Qezpa/96k
	 HFQ9UWNWq3GJvp6TiIDs5yNdIn2KYLFvCGn7Dj9VE3HuCV9bznuEUknPltwTkBs9Xt
	 ZDOR3IxtS64Ea8YWEuHj5S8hsrDsXjiYh9SWgeWkognDVtqy5Yc10uPOjwCUjptwKR
	 7No8GK7xe+tOg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 79CAA60B5E;
	Thu, 26 Feb 2026 15:50:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id A33A2204
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 15:50:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 88DD440784
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 15:50:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S1oXbQ2Y8Nm4 for <buildroot@buildroot.org>;
 Thu, 26 Feb 2026 15:50:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D6A0C404CF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D6A0C404CF
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 15:50:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C8959873DC; Thu, 26 Feb 2026 15:50:11 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 26 Feb 2026 16:45:12 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b28f9363c5afbf0782fad6ca5faf71fdd89ee15c
X-Git-Newrev: 9123849e0e39e54fcaf68597dd038bc60f06eabe
X-Patchwork-Hint: ignore
Message-Id: <20260226155011.C8959873DC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] packages/libunistring: bump to version
 1.4.2
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/9123849e0e39e54fcaf68597dd038bc60f06eabe
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

This minor release contains a fix for building with host glibc 2.43,
which fails otherwise.

Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libunistring/libunistring.hash | 4 ++--
 package/libunistring/libunistring.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libunistring/libunistring.hash b/package/libunistring/libunistring.hash
index f86b6f94b0..ef2f3da341 100644
--- a/package/libunistring/libunistring.hash
+++ b/package/libunistring/libunistring.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking pgp signature
-# https://ftp.gnu.org/gnu/libunistring/libunistring-1.4.1.tar.xz.sig
-sha256  67d88430892527861903788868c77802a217b0959990f7449f2976126a307763  libunistring-1.4.1.tar.xz
+# https://ftp.gnu.org/gnu/libunistring/libunistring-1.4.2.tar.xz.sig
+sha256  5b46e74377ed7409c5b75e7a96f95377b095623b689d8522620927964a41499c  libunistring-1.4.2.tar.xz
 # Locally calculated
 sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING
 sha256  a853c2ffec17057872340eee242ae4d96cbf2b520ae27d903e1b2fef1a5f9d1c  COPYING.LIB
diff --git a/package/libunistring/libunistring.mk b/package/libunistring/libunistring.mk
index 1abbfde6da..57333a35bf 100644
--- a/package/libunistring/libunistring.mk
+++ b/package/libunistring/libunistring.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBUNISTRING_VERSION = 1.4.1
+LIBUNISTRING_VERSION = 1.4.2
 LIBUNISTRING_SITE = $(BR2_GNU_MIRROR)/libunistring
 LIBUNISTRING_SOURCE = libunistring-$(LIBUNISTRING_VERSION).tar.xz
 LIBUNISTRING_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
