Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45095D30CC1
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 20:59:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0809783DC1;
	Tue, 13 Jan 2026 20:59:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WNqQjgVL-U-c; Tue, 13 Jan 2026 20:59:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B7E4D83D5D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768337986;
	bh=b+Rq6nbAB++FYcoGifXcuyn8BsBUisE22jSG84Scf6s=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Fwql651FBQ0DZJQVsmhk2jim26jO1rZcvbQXtvC5r2Eq246P7oj6fE6l9ZUjFMZN/
	 F5BUQi+kfDySBmjIy37qJf6bxlyufym9qrKYWps4Q2C9+qOPHwbwp7VJkbfjrv6P5R
	 0oa8q7n3zwqvbdGRqj6AXfnJcOPNjjwbBVBmihIhdMnMJ37itc0x2U4wdFrAB9rTyC
	 U6q08GzYtpc3Xq5ttXgMtGzCV1e2uHWuwosTNKvAtXtfx8fSHuShJzZEWAqroBxfdc
	 IQOtfNJ3egv81CE1BRnskow87vV74oJkSDguypHf6+7MBUhunR99fBZtx1iTIM99Z5
	 aq6tJ2eMsPjog==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B7E4D83D5D;
	Tue, 13 Jan 2026 20:59:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id BBA06231
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:59:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9676E407A0
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T5rOsSdBbRGl for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 20:58:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BDB504075F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id BDB504075F
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BCA5781382; Tue, 13 Jan 2026 20:58:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 13 Jan 2026 21:37:22 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 101838aa38a5a8b669b2867897888e82c684698e
X-Git-Newrev: a9de86eafe232167f569942921f7830cfab900d2
X-Patchwork-Hint: ignore
Message-Id: <20260113205847.BCA5781382@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xlib_libXcursor: bump
 version to 1.2.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=a9de86eafe232167f569942921f7830cfab900d2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://lists.x.org/archives/xorg-announce/2024-November/003549.html
https://lists.x.org/archives/xorg-announce/2024-March/003465.html

Switched _SITE to URL mentioned in latest release notes.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/x11r7/xlib_libXcursor/xlib_libXcursor.hash | 6 +++---
 package/x11r7/xlib_libXcursor/xlib_libXcursor.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xlib_libXcursor/xlib_libXcursor.hash b/package/x11r7/xlib_libXcursor/xlib_libXcursor.hash
index 11575edbf5..6a0a2eeaf7 100644
--- a/package/x11r7/xlib_libXcursor/xlib_libXcursor.hash
+++ b/package/x11r7/xlib_libXcursor/xlib_libXcursor.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-April/003136.html
-sha256  46c143731610bafd2070159a844571b287ac26192537d047a39df06155492104  libXcursor-1.2.1.tar.xz
-sha512  ebb42a39855aab86d0c11fe6ad33d011cf56a6dc5c309bef643460319c03df239b7e09fe88777bb25c0e9ff8aceac6bf66e51cc04a2d5ee463b3bc3bbf1674e3  libXcursor-1.2.1.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2024-November/003549.html
+sha256  fde9402dd4cfe79da71e2d96bb980afc5e6ff4f8a7d74c159e1966afb2b2c2c0  libXcursor-1.2.3.tar.xz
+sha512  069a1eb27a0ee1b29b251bb6c2d0688543a791d6862fad643279e86736e1c12ca6fc02b85b8611c225a9735dc00efab84672d42b547baa97304362f0c5ae0b5a  libXcursor-1.2.3.tar.xz
 # Locally computed
 sha256  ad2e9d279088c5d612fb0e506ea8bb7d9f01b411e7f4b97b64589c3cd48a68f1  COPYING
diff --git a/package/x11r7/xlib_libXcursor/xlib_libXcursor.mk b/package/x11r7/xlib_libXcursor/xlib_libXcursor.mk
index 4a1ffcce9e..44319cc804 100644
--- a/package/x11r7/xlib_libXcursor/xlib_libXcursor.mk
+++ b/package/x11r7/xlib_libXcursor/xlib_libXcursor.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XLIB_LIBXCURSOR_VERSION = 1.2.1
+XLIB_LIBXCURSOR_VERSION = 1.2.3
 XLIB_LIBXCURSOR_SOURCE = libXcursor-$(XLIB_LIBXCURSOR_VERSION).tar.xz
-XLIB_LIBXCURSOR_SITE = http://xorg.freedesktop.org/releases/individual/lib
+XLIB_LIBXCURSOR_SITE = https://xorg.freedesktop.org/archive/individual/lib
 XLIB_LIBXCURSOR_LICENSE = MIT
 XLIB_LIBXCURSOR_LICENSE_FILES = COPYING
 XLIB_LIBXCURSOR_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
