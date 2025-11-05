Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8D24CEACEF
	for <buildroot@archiver.kernel.org>; Mon, 17 Nov 2025 20:08:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 96BDD41522;
	Mon, 17 Nov 2025 20:08:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WP_M8zPnNhcb; Mon, 17 Nov 2025 20:08:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9B053414EA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9B053414EA;
	Mon, 17 Nov 2025 20:08:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E42F158
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 20:08:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4A47E6143D
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 20:07:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b6RLt_SIF6cO for <buildroot@buildroot.org>;
 Mon, 17 Nov 2025 20:07:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3FB2861438
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3FB2861438
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 20:07:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3E2D581015; Mon, 17 Nov 2025 20:07:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 5 Nov 2025 17:02:40 +0100
X-Git-Refname: refs/heads/2025.08.x
X-Git-Oldrev: be8da88137e83ec4e96e7b7525f78927c7043276
X-Git-Newrev: ae9d0cb8b3f32904821a9f9f6da45e55ed10427c
X-Patchwork-Hint: ignore
Message-Id: <20251117200753.3E2D581015@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.08.x] package/libiconv: fix
 build with gcc 15.x
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=ae9d0cb8b3f32904821a9f9f6da45e55ed10427c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.08.x

Fixes:
https://autobuild.buildroot.net/results/387/3875466a80e57dfd96911a2166e496cf7d41bb69/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 8930ede00fd4e76a007af5b85c22e0b90a913fc8)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...-function-declaration-without-a-prototype.patch | 34 ++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/package/libiconv/0001-Fix-a-clang-warning-a-function-declaration-without-a-prototype.patch b/package/libiconv/0001-Fix-a-clang-warning-a-function-declaration-without-a-prototype.patch
new file mode 100644
index 0000000000..f859f7e014
--- /dev/null
+++ b/package/libiconv/0001-Fix-a-clang-warning-a-function-declaration-without-a-prototype.patch
@@ -0,0 +1,34 @@
+From: Bruno Haible <bruno@clisp.org>
+Date: Sun, 29 Jan 2023 19:07:21 +0000 (+0100)
+Subject: Fix a clang warning "a function declaration without a prototype...".
+X-Git-Tag: v1.18~57
+X-Git-Url: https://gitweb.git.savannah.gnu.org/gitweb/?p=libiconv.git;a=commitdiff_plain;h=e46dee2f581c1167137bcd045e114e96a9f00483
+
+Fix a clang warning "a function declaration without a prototype...".
+
+* lib/loop_wchar.h (mbrtowc): Don't declare. Drop portability to BeOS.
+
+Upstream: https://gitweb.git.savannah.gnu.org/gitweb/?p=libiconv.git;a=commitdiff;h=e46dee2f581c1167137bcd045e114e96a9f00483
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+
+diff --git a/lib/loop_wchar.h b/lib/loop_wchar.h
+index b3edc29..9eb508e 100644
+--- a/lib/loop_wchar.h
++++ b/lib/loop_wchar.h
+@@ -1,5 +1,5 @@
+ /*
+- * Copyright (C) 2000-2002, 2005-2006, 2008-2009, 2011 Free Software Foundation, Inc.
++ * Copyright (C) 2000-2002, 2005-2006, 2008-2009, 2011, 2023 Free Software Foundation, Inc.
+  * This file is part of the GNU LIBICONV Library.
+  *
+  * The GNU LIBICONV Library is free software; you can redistribute it
+@@ -36,7 +36,6 @@
+ # include <wchar.h>
+ # define BUF_SIZE 64  /* assume MB_LEN_MAX <= 64 */
+   /* Some systems, like BeOS, have multibyte encodings but lack mbstate_t.  */
+-  extern size_t mbrtowc ();
+ # ifdef mbstate_t
+ #  define mbrtowc(pwc, s, n, ps) (mbrtowc)(pwc, s, n, 0)
+ #  define mbsinit(ps) 1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
