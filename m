Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADE04C3600C
	for <buildroot@archiver.kernel.org>; Thu,  3 Apr 2025 19:19:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 18D34410B2;
	Thu,  3 Apr 2025 19:19:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rLTUgFYas35k; Thu,  3 Apr 2025 19:19:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 21D3040EC1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 21D3040EC1;
	Thu,  3 Apr 2025 19:19:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 73870117
 for <buildroot@buildroot.org>; Thu,  3 Apr 2025 19:19:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 64E9160B04
 for <buildroot@buildroot.org>; Thu,  3 Apr 2025 19:19:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GitwfWHrH4jT for <buildroot@buildroot.org>;
 Thu,  3 Apr 2025 19:19:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7C68260A99
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7C68260A99
 for <buildroot@buildroot.org>; Thu,  3 Apr 2025 19:19:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6488583B3A; Thu,  3 Apr 2025 19:19:29 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Thu, 3 Apr 2025 21:14:42 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1747ebf29b577f4b1ef03b0633bedd525ce9947d
X-Git-Newrev: 06803b1eb6f32a9ece4838853c5fe0effd7cb7b9
X-Patchwork-Hint: ignore
Message-Id: <20250403191929.6488583B3A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python3: backport upstream patch
 to fix pyatomic.h headers
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

commit: https://git.buildroot.net/buildroot/commit/?id=06803b1eb6f32a9ece4838853c5fe0effd7cb7b9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since the bump of Python to 3.13.2, cracklib fails to build when
Python support is enabled, due to an issue in the Python headers. This
issue has been fixed upstream in the 3.13.x branch, and this commit
simply backports the upstream fix.

Fixes:

  https://autobuild.buildroot.org/results/26f6fe75f75c65bb9d58bbdbec733ebfe9b8565c/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...296-Fix-pyatomic.h-include-paths-GH-12932.patch | 63 ++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/package/python3/0010-3.13-gh-129296-Fix-pyatomic.h-include-paths-GH-12932.patch b/package/python3/0010-3.13-gh-129296-Fix-pyatomic.h-include-paths-GH-12932.patch
new file mode 100644
index 0000000000..00451af9bf
--- /dev/null
+++ b/package/python3/0010-3.13-gh-129296-Fix-pyatomic.h-include-paths-GH-12932.patch
@@ -0,0 +1,63 @@
+From 0ee012224447b6ec7f6f20d316b24449fdcc0d4b Mon Sep 17 00:00:00 2001
+From: "Miss Islington (bot)"
+ <31488909+miss-islington@users.noreply.github.com>
+Date: Fri, 28 Feb 2025 09:22:15 +0100
+Subject: [PATCH] [3.13] gh-129296: Fix `pyatomic.h` include paths (GH-129320)
+ (#130667)
+
+gh-129296: Fix `pyatomic.h` include paths (GH-129320)
+
+Use relative includes in Include/cpython/pyatomic.h for
+pyatomic_gcc.h, pyatomic_std.h and pyatomic_msc.h.
+
+Do a similar change in Include/cpython/pythread.h for
+pthread_stubs.h include.
+(cherry picked from commit 3a974e39d54902699f360bc4db2fd351a6baf3ef)
+
+Co-authored-by: Zanie Blue <contact@zanie.dev>
+Upstream: 125ca028664ce72556e3983b57f521a118c4e677
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ Include/cpython/pyatomic.h | 6 +++---
+ Include/cpython/pythread.h | 2 +-
+ 2 files changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/Include/cpython/pyatomic.h b/Include/cpython/pyatomic.h
+index 4ecef4f56ed..28029859d3d 100644
+--- a/Include/cpython/pyatomic.h
++++ b/Include/cpython/pyatomic.h
+@@ -529,15 +529,15 @@ static inline void _Py_atomic_fence_release(void);
+ 
+ #if _Py_USE_GCC_BUILTIN_ATOMICS
+ #  define Py_ATOMIC_GCC_H
+-#  include "cpython/pyatomic_gcc.h"
++#  include "pyatomic_gcc.h"
+ #  undef Py_ATOMIC_GCC_H
+ #elif __STDC_VERSION__ >= 201112L && !defined(__STDC_NO_ATOMICS__)
+ #  define Py_ATOMIC_STD_H
+-#  include "cpython/pyatomic_std.h"
++#  include "pyatomic_std.h"
+ #  undef Py_ATOMIC_STD_H
+ #elif defined(_MSC_VER)
+ #  define Py_ATOMIC_MSC_H
+-#  include "cpython/pyatomic_msc.h"
++#  include "pyatomic_msc.h"
+ #  undef Py_ATOMIC_MSC_H
+ #else
+ #  error "no available pyatomic implementation for this platform/compiler"
+diff --git a/Include/cpython/pythread.h b/Include/cpython/pythread.h
+index 03f710a9f7e..e658b35bd90 100644
+--- a/Include/cpython/pythread.h
++++ b/Include/cpython/pythread.h
+@@ -22,7 +22,7 @@ PyAPI_DATA(const long long) PY_TIMEOUT_MAX;
+     */
+ #   define NATIVE_TSS_KEY_T     unsigned long
+ #elif defined(HAVE_PTHREAD_STUBS)
+-#   include "cpython/pthread_stubs.h"
++#   include "pthread_stubs.h"
+ #   define NATIVE_TSS_KEY_T     pthread_key_t
+ #else
+ #   error "Require native threads. See https://bugs.python.org/issue31370"
+-- 
+2.48.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
