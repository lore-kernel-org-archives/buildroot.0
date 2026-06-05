Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6264ACD6E7C
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 21:15:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 62C9E6111A;
	Fri,  5 Jun 2026 21:15:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IgRJL4RrwYiL; Fri,  5 Jun 2026 21:15:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B78AD61111
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780694137;
	bh=RJHNKDgEOQk+r3ZiL+UiMSxAKlE+aeKs7qlZpA9KFNg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=LnazJgC5deqKCgGIHvHonBX+/jzIo/Ls2Ryjkp1WuMbgeGbzSpMu7iRg5POVSA8VI
	 jHpczsuFVogoavzKB/4CqkLnw2fMPEFVoyOqcyt0R3Mifk9wBrgLbN7toW8I59pU78
	 jouR+wWiTCA6JR+pL/xY8IZ6J980X3Z7Igl9Jbn2YlK9h5CpCag0qwph39Gcdq0bW1
	 6gQKRzWrBAHWe4Bbc4+yALNf8fELJIrioQ28meiTUgEOHf4OnTx7meZ2d3GQan33Ec
	 84MAaV8P3NKuhs/JYkkhl5dTJyv1OtA4mgoqhs0xVscqAIm9PU3Zxzs7o/QbqZhhbO
	 XJRUoBOfKnLUg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B78AD61111;
	Fri,  5 Jun 2026 21:15:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 04ACADE
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 21:15:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DE50A41F16
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 21:15:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SbvGRmOZHSjT for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 21:15:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 365F041F14
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 365F041F14
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 21:15:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DD42E87BA7; Fri,  5 Jun 2026 21:15:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 5 Jun 2026 23:10:59 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 907ebab6d9d1f4233071d1db3bb1fcf3fc365344
X-Git-Newrev: e9aefc702588c7aafb8b3bf605c4aed2ab8475ef
X-Patchwork-Hint: ignore
Message-Id: <20260605211519.DD42E87BA7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libinput: bump version to 1.31.2
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e9aefc702588c7aafb8b3bf605c4aed2ab8475ef
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://lore.freedesktop.org/wayland-devel/agWtsIBqMXTVknR_@quokka/T/#u

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libinput/libinput.hash | 2 +-
 package/libinput/libinput.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libinput/libinput.hash b/package/libinput/libinput.hash
index ec6e52e1e2..c813993358 100644
--- a/package/libinput/libinput.hash
+++ b/package/libinput/libinput.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  e0bb6537de892ce7c63fc5be9ad373eae894b7655c92220ef00316cc33097356  libinput-1.31.1.tar.bz2
+sha256  1daebac6cb5b8946139c9669a7e5c0e4c8f17320de232a6b9bf470f37dc569e4  libinput-1.31.2.tar.bz2
 
 # License files
 sha256  80de50b2022a840db044c56db804ca3565600a692c0714babface587acc6d1b0  COPYING
diff --git a/package/libinput/libinput.mk b/package/libinput/libinput.mk
index 8b930805b2..33fd012076 100644
--- a/package/libinput/libinput.mk
+++ b/package/libinput/libinput.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBINPUT_VERSION = 1.31.1
+LIBINPUT_VERSION = 1.31.2
 LIBINPUT_SOURCE = libinput-$(LIBINPUT_VERSION).tar.bz2
 LIBINPUT_SITE = https://gitlab.freedesktop.org/libinput/libinput/-/archive/$(LIBINPUT_VERSION)
 LIBINPUT_DEPENDENCIES = host-pkgconf libevdev udev
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
