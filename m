Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF5F1EE3F37
	for <buildroot@archiver.kernel.org>; Tue, 12 Sep 2023 21:28:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5DA47821CC;
	Tue, 12 Sep 2023 21:28:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5DA47821CC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8KFeavUOAjFH; Tue, 12 Sep 2023 21:28:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AC154821A0;
	Tue, 12 Sep 2023 21:28:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AC154821A0
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1773A1BF421
 for <buildroot@lists.busybox.net>; Tue, 12 Sep 2023 21:28:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E4388402F3
 for <buildroot@lists.busybox.net>; Tue, 12 Sep 2023 21:28:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E4388402F3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Nhjgh8sSUpFj for <buildroot@lists.busybox.net>;
 Tue, 12 Sep 2023 21:28:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 076B7402CC
 for <buildroot@buildroot.org>; Tue, 12 Sep 2023 21:28:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 076B7402CC
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E9DB886C39; Tue, 12 Sep 2023 21:28:14 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 12 Sep 2023 23:27:04 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: a0360d523110b2bea6a6ea633e940c68a6783d65
X-Git-Newrev: e26d9f53d8a409f6959935e2d96d6820a4144cb8
X-Patchwork-Hint: ignore
Message-Id: <20230912212814.E9DB886C39@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/host-gdb: disable
 source-highlight
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

commit: https://git.buildroot.net/buildroot/commit/?id=e26d9f53d8a409f6959935e2d96d6820a4144cb8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

This is the follow-up commit to the 4de60e4 which disables
sourcehighlight dependency for the target GDB package.
Do the same for the host variant to be sure that this
won't be picked up from the host system.

Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 9ba399a3ddfc3129c5334c558b52665053a932cb)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gdb/gdb.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
index cee7b37bcd..2759521a3c 100644
--- a/package/gdb/gdb.mk
+++ b/package/gdb/gdb.mk
@@ -255,6 +255,7 @@ HOST_GDB_CONF_OPTS = \
 	--with-system-zlib \
 	--with-curses \
 	--without-mpfr \
+	--disable-source-highlight \
 	$(GDB_DISABLE_BINUTILS_CONF_OPTS)
 
 ifeq ($(BR2_PACKAGE_HOST_GDB_TUI),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
