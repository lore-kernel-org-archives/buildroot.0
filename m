Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D6EEC4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:24:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2B8F960EFF
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:24:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2B8F960EFF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 02B94404F8;
	Tue,  3 Aug 2021 22:24:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xmjJY3Sy1Mzi; Tue,  3 Aug 2021 22:24:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9E6F640515;
	Tue,  3 Aug 2021 22:24:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4CC031BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:11:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 307A460662
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id srjGTU_hPSm3 for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:12 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 54E446090C
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 9EECD85586; Tue,  3 Aug 2021 21:10:04 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Fri, 16 Jul 2021 23:26:37 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 32b53a23e88c7a08d289e81b24b8430efe3b2fd9
X-Git-Newrev: 7a2724683f32235fcfad130b70ee76a8513c25f3
X-Patchwork-Hint: ignore
Message-Id: <20210803211004.9EECD85586@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/webkitgtk: bump to
 version 2.32.2
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=7a2724683f32235fcfad130b70ee76a8513c25f3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Bugfix release, mainly solves a few issues with input events,
drag-and-drop, and a few crashes. Release notes:

  https://webkitgtk.org/2021/07/09/webkitgtk2.32.2-released.html

The patch for building against uClibc has been included in this release,
therefore "0001-Support-building-against-uClibc.patch" is removed.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-Support-building-against-uClibc.patch     | 82 ----------------------
 package/webkitgtk/webkitgtk.hash                   |  8 +--
 package/webkitgtk/webkitgtk.mk                     |  2 +-
 3 files changed, 5 insertions(+), 87 deletions(-)

diff --git a/package/webkitgtk/0001-Support-building-against-uClibc.patch b/package/webkitgtk/0001-Support-building-against-uClibc.patch
deleted file mode 100644
index 7c0918a195..0000000000
--- a/package/webkitgtk/0001-Support-building-against-uClibc.patch
+++ /dev/null
@@ -1,82 +0,0 @@
-From 624d3b6a99778443e35fb260bef50a3969df9215 Mon Sep 17 00:00:00 2001
-From: Adrian Perez de Castro <aperez@igalia.com>
-Date: Wed, 26 May 2021 01:24:59 +0300
-Subject: [PATCH] Support building against uClibc
- https://bugs.webkit.org/show_bug.cgi?id=226244
-
-Reviewed by Michael Catanzaro.
-
-Source/JavaScriptCore:
-
-* assembler/MacroAssemblerARM64.cpp:
-(getauxval): Provide a fallback implementation of getauxval() for
-systems which do not provide <sys/auxv.h>, like those using uClibc
-as their C library.
-
-Source/WTF:
-
-* wtf/PlatformRegisters.h: Use the <sys/ucontext.h> header instead of
-<ucontext.h>, which is enough to gain access to the type definitions
-for CPU registers and is available on every libc. On the other hand,
-uClibc does not have <ucontext.h>, so this fixes the build in that
-case.
-
-Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
-[Backport from upstream:
-  - https://bugs.webkit.org/show_bug.cgi?id=226244
-  - https://trac.webkit.org/changeset/278302 (current svn, soon legacy)
-  - https://commits.webkit.org/238339@main (future-proof for after the migration to git)
-]
-[yann.morin.1998@free.fr: add upstream commit refs]
-Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
----
- .../assembler/MacroAssemblerARM64.cpp          | 18 ++++++++++++++++++
- Source/WTF/wtf/PlatformRegisters.h             |  2 +-
- 2 files changed, 19 insertions(+), 1 deletion(-)
-
-diff --git a/Source/JavaScriptCore/assembler/MacroAssemblerARM64.cpp b/Source/JavaScriptCore/assembler/MacroAssemblerARM64.cpp
-index 9e5c5147ea0..d20e632d825 100644
---- a/Source/JavaScriptCore/assembler/MacroAssemblerARM64.cpp
-+++ b/Source/JavaScriptCore/assembler/MacroAssemblerARM64.cpp
-@@ -34,7 +34,25 @@
- 
- #if OS(LINUX)
- #include <asm/hwcap.h>
-+#if __has_include(<sys/auxv.h>)
- #include <sys/auxv.h>
-+#else
-+#include <linux/auxvec.h>
-+// Provide an implementation for C libraries which do not ship one.
-+static unsigned long getauxval(unsigned long type)
-+{
-+    char** env = environ;
-+    while (*env++) { /* no-op */ }
-+
-+    for (auto* auxv = reinterpret_cast<unsigned long*>(env); *auxv != AT_NULL; auxv += 2) {
-+        if (*auxv == type)
-+            return auxv[1];
-+    }
-+
-+    errno = ENOENT;
-+    return 0;
-+}
-+#endif
- #endif
- 
- namespace JSC {
-diff --git a/Source/WTF/wtf/PlatformRegisters.h b/Source/WTF/wtf/PlatformRegisters.h
-index d26ef985169..e7f15b7eb62 100644
---- a/Source/WTF/wtf/PlatformRegisters.h
-+++ b/Source/WTF/wtf/PlatformRegisters.h
-@@ -35,7 +35,7 @@
- #elif OS(WINDOWS)
- #include <windows.h>
- #else
--#include <ucontext.h>
-+#include <sys/ucontext.h>
- #endif
- 
- namespace WTF {
--- 
-2.31.1
-
diff --git a/package/webkitgtk/webkitgtk.hash b/package/webkitgtk/webkitgtk.hash
index d8bfa60fb8..dd950bbabe 100644
--- a/package/webkitgtk/webkitgtk.hash
+++ b/package/webkitgtk/webkitgtk.hash
@@ -1,7 +1,7 @@
-# From https://webkitgtk.org/releases/webkitgtk-2.32.1.tar.xz.sums
-md5  b12790ae1209e1d5848aeb4fb70994db  webkitgtk-2.32.1.tar.xz
-sha1  c8c507d3c98c891ea5bfcfb6407320959dc77a2b  webkitgtk-2.32.1.tar.xz
-sha256  136117317f70f66486f71b8edf5e46f8776403c5d8a296e914b11a36ef836917  webkitgtk-2.32.1.tar.xz
+# From https://webkitgtk.org/releases/webkitgtk-2.32.2.tar.xz.sums
+md5  6dbf813fefd79c551be47b1312f27cec  webkitgtk-2.32.2.tar.xz
+sha1  958777627972b18501e5520d0aba9e274a2b151f  webkitgtk-2.32.2.tar.xz
+sha256  1790f86975bdef957ba9a12fc09202de8f55c885ee38467afc50d2bdb7a6c5cd  webkitgtk-2.32.2.tar.xz
 
 # Hashes for license files:
 sha256  0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a76094edb4  Source/WebCore/LICENSE-APPLE
diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
index bee0d4f885..c3fbedf654 100644
--- a/package/webkitgtk/webkitgtk.mk
+++ b/package/webkitgtk/webkitgtk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WEBKITGTK_VERSION = 2.32.1
+WEBKITGTK_VERSION = 2.32.2
 WEBKITGTK_SITE = https://www.webkitgtk.org/releases
 WEBKITGTK_SOURCE = webkitgtk-$(WEBKITGTK_VERSION).tar.xz
 WEBKITGTK_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
