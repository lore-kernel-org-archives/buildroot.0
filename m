Return-Path: <SRS0=D8Yb=P4=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A366C433F5
	for <buildroot@archiver.kernel.org>; Tue,  9 Nov 2021 10:04:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 14997611C4
	for <buildroot@archiver.kernel.org>; Tue,  9 Nov 2021 10:04:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 14997611C4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E3D4140166;
	Tue,  9 Nov 2021 10:04:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N_l_BVMvhRzF; Tue,  9 Nov 2021 10:04:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 40ABA40125;
	Tue,  9 Nov 2021 10:04:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2F9911BF34A
 for <buildroot@lists.busybox.net>; Tue,  9 Nov 2021 10:03:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 714914032A
 for <buildroot@lists.busybox.net>; Tue,  9 Nov 2021 10:03:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Cd8r0P0RoCGu for <buildroot@lists.busybox.net>;
 Tue,  9 Nov 2021 10:03:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7C4984032F
 for <buildroot@buildroot.org>; Tue,  9 Nov 2021 10:03:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 21B9C8B7A4; Tue,  9 Nov 2021 09:59:34 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 9 Nov 2021 10:55:50 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: a36c47b56f14b362140dba3da8b8429fe4bfc67e
X-Git-Newrev: 4a2a410d24da11b0b85787c4a2ac44ca8ef97b5c
X-Patchwork-Hint: ignore
Message-Id: <20211109095934.21B9C8B7A4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/lua: don't
 override dependencies
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=4a2a410d24da11b0b85787c4a2ac44ca8ef97b5c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Don't override LUA_DEPENDENCIES in a conditional

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit bb0ca7f32eaa3c3535c04e2f84763be75606714c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lua/lua.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/lua/lua.mk b/package/lua/lua.mk
index e3a415a06a..bbfb3b5368 100644
--- a/package/lua/lua.mk
+++ b/package/lua/lua.mk
@@ -40,12 +40,12 @@ LUA_MYLIBS += -ldl
 endif
 
 ifeq ($(BR2_PACKAGE_LUA_READLINE),y)
-LUA_DEPENDENCIES = readline ncurses
+LUA_DEPENDENCIES += readline ncurses
 LUA_MYLIBS += -lreadline -lhistory -lncurses
 LUA_CFLAGS += -DLUA_USE_READLINE
 else
 ifeq ($(BR2_PACKAGE_LUA_LINENOISE),y)
-LUA_DEPENDENCIES = linenoise
+LUA_DEPENDENCIES += linenoise
 LUA_MYLIBS += -llinenoise
 LUA_CFLAGS += -DLUA_USE_LINENOISE
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
