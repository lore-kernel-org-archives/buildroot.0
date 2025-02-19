Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90096C282D0
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:21:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3865270DB6;
	Fri, 28 Feb 2025 17:21:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mdKBK3pprHui; Fri, 28 Feb 2025 17:21:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4A4A870DB8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4A4A870DB8;
	Fri, 28 Feb 2025 17:21:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 15E1B711
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:47:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4834246C49
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:32:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nNO9e9Iv_8OJ for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:32:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7AB9346FD7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7AB9346FD7
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 71D2187A74; Fri, 28 Feb 2025 16:30:44 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Thu, 20 Feb 2025 00:10:40 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 274c36578fa3242e7ba35ce364d6856e0d0b95f5
X-Git-Newrev: f0a272ef14c72e8b3b5b646e588e5683f04539ac
X-Patchwork-Hint: ignore
Message-Id: <20250228163044.71D2187A74@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] Revert "package/sqlite: fix
 configure options for readline/editline support"
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

commit: https://git.buildroot.net/buildroot/commit/?id=f0a272ef14c72e8b3b5b646e588e5683f04539ac
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This reverts commit 004db1f5f3adaab7264b84e0896f9761cd9a2657.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Scott Fan <fancp2007@gmail.com>
Cc: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/sqlite/sqlite.mk | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index 255ddc937b..5a8b033ce0 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -44,12 +44,9 @@ endif
 
 ifeq ($(BR2_PACKAGE_NCURSES)$(BR2_PACKAGE_READLINE),yy)
 SQLITE_DEPENDENCIES += ncurses readline
-SQLITE_CFLAGS  += -DHAVE_READLINE=1
-SQLITE_LDFLAGS += -lreadline -lncurses
-else ifeq ($(BR2_PACKAGE_NCURSES)$(BR2_PACKAGE_LIBEDIT),yy)
-SQLITE_DEPENDENCIES += ncurses libedit
-SQLITE_CFLAGS  += -DHAVE_EDITLINE=1
-SQLITE_LDFLAGS += -ledit -lncurses
+else ifeq ($(BR2_PACKAGE_LIBEDIT),y)
+SQLITE_DEPENDENCIES += libedit
+SQLITE_CONF_OPTS += --disable-readline --editline
 else
 SQLITE_CONF_OPTS += --disable-readline
 endif
@@ -62,7 +59,7 @@ ifeq ($(BR2_PACKAGE_SQLITE_ENABLE_JSON1),)
 SQLITE_CONF_OPTS += --disable-json
 endif
 
-SQLITE_CONF_ENV = CFLAGS="$(SQLITE_CFLAGS)" LDFLAGS="$(SQLITE_LDFLAGS)"
+SQLITE_CONF_ENV = CFLAGS="$(SQLITE_CFLAGS)"
 
 define SQLITE_CONFIGURE_CMDS
 	(cd $(@D); $(TARGET_CONFIGURE_OPTS) $(SQLITE_CONF_ENV) ./configure \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
