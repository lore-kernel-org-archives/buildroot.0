Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E861C4706C
	for <buildroot@archiver.kernel.org>; Fri, 12 Jan 2024 16:40:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 390C26FB0B;
	Fri, 12 Jan 2024 16:40:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 390C26FB0B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B-RorqKzd2OC; Fri, 12 Jan 2024 16:40:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8C81F6FB02;
	Fri, 12 Jan 2024 16:40:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8C81F6FB02
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0A4011BF995
 for <buildroot@lists.busybox.net>; Fri, 12 Jan 2024 16:40:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E521F6FAFB
 for <buildroot@lists.busybox.net>; Fri, 12 Jan 2024 16:40:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E521F6FAFB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qvbdX_m1fUaz for <buildroot@lists.busybox.net>;
 Fri, 12 Jan 2024 16:40:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id EBC416FAFD
 for <buildroot@buildroot.org>; Fri, 12 Jan 2024 16:40:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EBC416FAFD
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DB66185F18; Fri, 12 Jan 2024 16:40:19 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 12 Jan 2024 17:33:41 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: dcc5fa2203a1fb0945578aa813daa55683b35582
X-Git-Newrev: 3a823d06a21039c6446018a0bcdaa0f2219d5ec4
X-Patchwork-Hint: ignore
Message-Id: <20240112164019.DB66185F18@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/gdb: Remove
 special handling of libstdc++ for ARC
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

commit: https://git.buildroot.net/buildroot/commit/?id=3a823d06a21039c6446018a0bcdaa0f2219d5ec4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Effectively that's a revert of a very old fix [1]
which is no longer needed.

[1] https://git.buildroot.net/buildroot/commit/?id=ca99d0ea925e5a8e42bd270402b0171a39d1d955

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 7077476c8c85f23897ce14a203cc91596a63b202)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gdb/gdb.mk | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
index 7de8a09048..03db21063b 100644
--- a/package/gdb/gdb.mk
+++ b/package/gdb/gdb.mk
@@ -171,13 +171,6 @@ else
 GDB_CONF_OPTS += --disable-gdbserver
 endif
 
-# When gdb is built as C++ application for ARC it segfaults at runtime
-# So we pass --disable-build-with-cxx config option to force gdb not to
-# be built as C++ app.
-ifeq ($(BR2_arc),y)
-GDB_CONF_OPTS += --disable-build-with-cxx
-endif
-
 # gdb 7.12+ by default builds with a C++ compiler, which doesn't work
 # when we don't have C++ support in the toolchain
 ifneq ($(BR2_INSTALL_LIBSTDCPP),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
