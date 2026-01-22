Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C91CD6CFA1
	for <buildroot@archiver.kernel.org>; Thu, 22 Jan 2026 19:35:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3E26681E41;
	Thu, 22 Jan 2026 19:35:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5fEWOLTabiyY; Thu, 22 Jan 2026 19:35:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 495C581E43
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769110515;
	bh=QYhkFxrD38Hal0e8S5BUKum4y4/Ff3AKWBTCn+EFb0s=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=YgLlN1h3IKaB0Y8pKEfxKf430vR+lhccS4Sp98WLnvnF4ISsAImwfqEp6m6DKLWaY
	 jZhfztdRK382U1sqhr/gWjUL+DAtE6FqIG2CJ0N0fXSd+XRZfhecv7PfTOctybvU6S
	 PGMHLLQc+cSoGBWJ13WJjcgVgbcMNG8Lu551AQY442uLP/4FNiPmVYOOV3cGjSCAPA
	 QN+gIiyH97GQR1mkZJR1d7lEftgY10e9LG1mlKUKFlAvB9bRjO3YmYy3iz/A7uyxC+
	 7CWhl9iY607Z9i10FkWsGpIAY+S0x73l3mXj8MeyrZ04SyCmv9S5zljS+ZYpp5n1KS
	 ms9nZy6dYACag==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 495C581E43;
	Thu, 22 Jan 2026 19:35:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id A8B46122
 for <buildroot@buildroot.org>; Thu, 22 Jan 2026 19:35:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BBC3C6071C
 for <buildroot@buildroot.org>; Thu, 22 Jan 2026 19:35:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3iPKTgRW62uB for <buildroot@buildroot.org>;
 Thu, 22 Jan 2026 19:35:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E96546072B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E96546072B
 for <buildroot@buildroot.org>; Thu, 22 Jan 2026 19:35:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D3D4C87568; Thu, 22 Jan 2026 19:35:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 22 Jan 2026 20:24:54 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 291bf7c48cc7b88287510f62ec635c950be762ab
X-Git-Newrev: 170a7c462baf89ab6c7f5f3dd8aa912b431e4288
X-Patchwork-Hint: ignore
Message-Id: <20260122193509.D3D4C87568@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libcdio-paranoia: fix build with
 gcc >= 15.x
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

commit: https://git.buildroot.net/buildroot/commit/?id=170a7c462baf89ab6c7f5f3dd8aa912b431e4288
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
https://autobuild.buildroot.net/results/dbd/dbdb4f386a417f7467b66036e661e77d04b82431/
https://autobuild.buildroot.net/results/042/042185a8d32765a52986cc0060d3d296a24c662b/
https://autobuild.buildroot.net/results/fc5/fc5be5e78852f6f66cd631f12a02ac10eb846e97/

The build error can be reproduced by this gcc 15-based defconfig:
BR2_x86_64=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_MUSL_BLEEDING_EDGE=y
BR2_PACKAGE_LIBCDIO_PARANOIA=y

while this gcc 14-based defconfig builds without errors:
BR2_x86_64=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_MUSL_STABLE=y
BR2_PACKAGE_LIBCDIO_PARANOIA=y

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../0001-Remove-a-GCC-15-error-on-getopt.c.patch   | 65 ++++++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/package/libcdio-paranoia/0001-Remove-a-GCC-15-error-on-getopt.c.patch b/package/libcdio-paranoia/0001-Remove-a-GCC-15-error-on-getopt.c.patch
new file mode 100644
index 0000000000..de927c51bb
--- /dev/null
+++ b/package/libcdio-paranoia/0001-Remove-a-GCC-15-error-on-getopt.c.patch
@@ -0,0 +1,65 @@
+From c12e48edc5660c70509142349f4020d3f9e36218 Mon Sep 17 00:00:00 2001
+From: "R. Bernstein" <rocky@gnu.org>
+Date: Wed, 1 Oct 2025 15:32:52 -0400
+Subject: [PATCH] Remove a GCC-15 error on getopt.c
+
+Fixes Issue #54
+
+Upstream: https://github.com/libcdio/libcdio-paranoia/commit/c12e48edc5660c70509142349f4020d3f9e36218
+
+[Bernd: backported to 10.2+2.0.1]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/getopt.c |  4 ++--
+ src/getopt.h | 11 +++++++++--
+ 2 files changed, 11 insertions(+), 4 deletions(-)
+
+diff --git a/src/getopt.c b/src/getopt.c
+index e51c35b..dce7144 100644
+--- a/src/getopt.c
++++ b/src/getopt.c
+@@ -2,7 +2,7 @@
+    NOTE: getopt is part of the C library, so if you don't know what
+    "Keep this file name-space clean" means, talk to drepper@gnu.org
+    before changing it!
+-   Copyright (C) 1987-2014 Free Software Foundation, Inc.
++   Copyright (C) 1987-2015 Free Software Foundation, Inc.
+    This file is part of the GNU C Library.
+ 
+    The GNU C Library is free software; you can redistribute it and/or
+@@ -145,7 +145,7 @@ static struct _getopt_data getopt_data;
+    whose names are inconsistent.  */
+ 
+ #ifndef getenv
+-extern char *getenv ();
++extern char *getenv (const char *);
+ #endif
+ 
+ #endif /* not __GNU_LIBRARY__ */
+diff --git a/src/getopt.h b/src/getopt.h
+index 7cc9167..0a6c1b3 100644
+--- a/src/getopt.h
++++ b/src/getopt.h
+@@ -1,5 +1,5 @@
+ /* Declarations for getopt.
+-   Copyright (C) 1989-2014 Free Software Foundation, Inc.
++   Copyright (C) 1989-2015 Free Software Foundation, Inc.
+    This file is part of the GNU C Library.
+ 
+    The GNU C Library is free software; you can redistribute it and/or
+@@ -141,7 +141,14 @@ struct option {
+    arguments to the option '\0'.  This behavior is specific to the GNU
+    `getopt'.  */
+ 
+-#ifdef __GNU_LIBRARY__
++/* Check for musl C library (<bits/alltypes.h> is musl specific).  */
++#if !defined __GLIBC__ && __has_include(<bits/alltypes.h>)
++# ifndef __MUSL__
++#   define __MUSL__ 1
++# endif
++#endif
++
++#if defined __GLIBC__ || defined __MUSL__
+ /* Many other libraries have conflicting prototypes for getopt, with
+    differences in the consts, in stdlib.h.  To avoid compilation
+    errors, only prototype getopt for the GNU C library.  */
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
