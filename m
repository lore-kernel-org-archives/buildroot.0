Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A5CEE668B4
	for <buildroot@archiver.kernel.org>; Sat, 20 Dec 2025 16:06:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1921D407A5;
	Sat, 20 Dec 2025 16:06:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wXN57HcZZfBZ; Sat, 20 Dec 2025 16:06:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4A31D407B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766246816;
	bh=WTdQel2MHEMa171OKQXBYv09qAaGQRAesxZB44QHBvo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=gA7kSDjeummOMkTz7nlRDz1FiQCfGg7mKPFwCRd6GS6IGF96hhRrNd0UfHk2SSY5k
	 sD7qEhxltdYt6egqZ592gin1r+U+26RI9ij7nYHbOEQlsk/h/HJhj/OFBZxPXloZPq
	 rVRzsmFqYLhqs+3nqKxxllKwdvEgqWPNmlzexU8hOW9AjjbFkWr/MtTujKqSZ2cDlO
	 kOfggG97fK9mwTrvkQQBc9gCFgSZ4M7OsaqWzSOSIIwujS2W9yc5uif9FX1GMEuuyS
	 hvfeOHfVmj67UT3XVyNI1ywtdWcGP5DlZbb1h0mC1dVXXebIAGzoCxPjNwqKKDcQtT
	 4muw/1vILEL/w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4A31D407B0;
	Sat, 20 Dec 2025 16:06:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8167D23D
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 16:06:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 73EDB407B0
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 16:06:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5caTzI2dGkYP for <buildroot@buildroot.org>;
 Sat, 20 Dec 2025 16:06:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BF8F1407A5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id BF8F1407A5
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 16:06:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A329987530; Sat, 20 Dec 2025 16:06:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 20 Dec 2025 16:58:54 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fb57257e385b2aef41c0bb72ad8df6a7b86012e2
X-Git-Newrev: ce823a0f5b4ca3c9276aad4146dcf5f806514d51
X-Patchwork-Hint: ignore
Message-Id: <20251220160654.A329987530@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libinput: bump version to 1.30.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=ce823a0f5b4ca3c9276aad4146dcf5f806514d51
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://lore.freedesktop.org/wayland-devel/20251125050917.GA854973@quokka/T/#u
https://lore.freedesktop.org/wayland-devel/20251208024732.GA3642318@quokka/T/#u

Added optional dependency to lua-5.4:
https://gitlab.freedesktop.org/libinput/libinput/-/commit/9461d1a9a17337c6ee5a4baee836fb9b9e12906c

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libinput/libinput.hash | 2 +-
 package/libinput/libinput.mk   | 9 ++++++++-
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/package/libinput/libinput.hash b/package/libinput/libinput.hash
index cd60e70c40..230b29b12b 100644
--- a/package/libinput/libinput.hash
+++ b/package/libinput/libinput.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  7160c16c409c9ea4f7da9d91923ae0a92df7f3453a292bf684bed071acd7b4ff  libinput-1.29.0.tar.bz2
+sha256  c5169568f337c4a3bda927c42afef3a9d4c891e48a405cba39d57cb4631b9fb0  libinput-1.30.1.tar.bz2
 
 # License files
 sha256  80de50b2022a840db044c56db804ca3565600a692c0714babface587acc6d1b0  COPYING
diff --git a/package/libinput/libinput.mk b/package/libinput/libinput.mk
index 93d8a51aca..ee7c2146ab 100644
--- a/package/libinput/libinput.mk
+++ b/package/libinput/libinput.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBINPUT_VERSION = 1.29.0
+LIBINPUT_VERSION = 1.30.1
 LIBINPUT_SOURCE = libinput-$(LIBINPUT_VERSION).tar.bz2
 LIBINPUT_SITE = https://gitlab.freedesktop.org/libinput/libinput/-/archive/$(LIBINPUT_VERSION)
 LIBINPUT_DEPENDENCIES = host-pkgconf libevdev udev
@@ -31,6 +31,13 @@ else
 LIBINPUT_CONF_OPTS += -Ddebug-gui=false
 endif
 
+ifeq ($(BR2_PACKAGE_LUA_5_4),y)
+LIBINPUT_CONF_OPTS += -Dlua-plugins=enabled
+LIBINPUT_DEPENDENCIES += lua
+else
+LIBINPUT_CONF_OPTS += -Dlua-plugins=disabled
+endif
+
 ifeq ($(BR2_PACKAGE_MTDEV),y)
 LIBINPUT_CONF_OPTS += -Dmtdev=true
 LIBINPUT_DEPENDENCIES += mtdev
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
