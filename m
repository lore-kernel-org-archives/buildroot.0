Return-Path: <SRS0=D8Yb=P4=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 799F9C433F5
	for <buildroot@archiver.kernel.org>; Tue,  9 Nov 2021 10:02:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4408661130
	for <buildroot@archiver.kernel.org>; Tue,  9 Nov 2021 10:02:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4408661130
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0497A4033A;
	Tue,  9 Nov 2021 10:02:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4VrmbWA2LclY; Tue,  9 Nov 2021 10:02:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C460C4022B;
	Tue,  9 Nov 2021 10:02:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 709A61BF9AD
 for <buildroot@lists.busybox.net>; Tue,  9 Nov 2021 10:00:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5501D80BB8
 for <buildroot@lists.busybox.net>; Tue,  9 Nov 2021 10:00:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GrAQjDaVT4f9 for <buildroot@lists.busybox.net>;
 Tue,  9 Nov 2021 10:00:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 979FB80C1D
 for <buildroot@buildroot.org>; Tue,  9 Nov 2021 10:00:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 317278B77E; Tue,  9 Nov 2021 09:56:23 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 9 Nov 2021 10:55:13 +0100
X-Git-Refname: refs/heads/2021.08.x
X-Git-Oldrev: 2c78b90d8bdd9f3e048034f27d07b473d9d73dca
X-Git-Newrev: dc4a479ef9aefd90e8c2d7d49077e2646d4dad6e
X-Patchwork-Hint: ignore
Message-Id: <20211109095623.317278B77E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.08.x] package/lua: don't
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

commit: https://git.buildroot.net/buildroot/commit/?id=dc4a479ef9aefd90e8c2d7d49077e2646d4dad6e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.08.x

Don't override LUA_DEPENDENCIES in a conditional

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit bb0ca7f32eaa3c3535c04e2f84763be75606714c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lua/lua.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/lua/lua.mk b/package/lua/lua.mk
index b385b78b30..844e165df0 100644
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
