Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7EEEC4706C
	for <buildroot@archiver.kernel.org>; Fri, 12 Jan 2024 16:37:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 84F036FB1E;
	Fri, 12 Jan 2024 16:37:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 84F036FB1E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bJWq1JisqFd6; Fri, 12 Jan 2024 16:37:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CF0EB6FB21;
	Fri, 12 Jan 2024 16:37:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CF0EB6FB21
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 730C51BF2F3
 for <buildroot@lists.busybox.net>; Fri, 12 Jan 2024 16:36:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 55E84845C9
 for <buildroot@lists.busybox.net>; Fri, 12 Jan 2024 16:36:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 55E84845C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lRSy-OonbgZo for <buildroot@lists.busybox.net>;
 Fri, 12 Jan 2024 16:36:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id CD788845CC
 for <buildroot@buildroot.org>; Fri, 12 Jan 2024 16:36:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CD788845CC
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BC03985F03; Fri, 12 Jan 2024 16:36:36 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 12 Jan 2024 17:33:47 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: 12a5a21fee615eea17fe1e52c39a0566e242fd7c
X-Git-Newrev: 29bac1a29b65b1361988d0341931733c58252ac3
X-Patchwork-Hint: ignore
Message-Id: <20240112163636.BC03985F03@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x] package/gdb: Remove
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

commit: https://git.buildroot.net/buildroot/commit/?id=29bac1a29b65b1361988d0341931733c58252ac3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

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
index ea710f0c1f..9be6be77b8 100644
--- a/package/gdb/gdb.mk
+++ b/package/gdb/gdb.mk
@@ -174,13 +174,6 @@ else
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
