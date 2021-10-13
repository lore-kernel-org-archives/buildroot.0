Return-Path: <SRS0=94yL=PB=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26933C433EF
	for <buildroot@archiver.kernel.org>; Wed, 13 Oct 2021 18:29:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DC539610A2
	for <buildroot@archiver.kernel.org>; Wed, 13 Oct 2021 18:29:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DC539610A2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A911660D5C;
	Wed, 13 Oct 2021 18:29:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r5SRRQFgbdkv; Wed, 13 Oct 2021 18:29:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A3D8B60ADF;
	Wed, 13 Oct 2021 18:29:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8168F1BF38C
 for <buildroot@lists.busybox.net>; Wed, 13 Oct 2021 18:27:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 58F3160C33
 for <buildroot@lists.busybox.net>; Wed, 13 Oct 2021 18:27:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6O6Mbj1lNlMK for <buildroot@lists.busybox.net>;
 Wed, 13 Oct 2021 18:27:37 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 90A5860D50
 for <buildroot@buildroot.org>; Wed, 13 Oct 2021 18:27:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 0DACD958EB; Wed, 13 Oct 2021 18:24:45 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 13 Oct 2021 20:14:55 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8a2ce9784e147eb2bc76bafe0738fcf5a0a14910
X-Git-Newrev: 1868145c55345b5bc923f027abc7c8bb985e2a14
X-Patchwork-Hint: ignore
Message-Id: <20211013182445.0DACD958EB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/apr: fix build with autoconf >=
 2.70
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

commit: https://git.buildroot.net/buildroot/commit/?id=1868145c55345b5bc923f027abc7c8bb985e2a14
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure raised since bump of autoconf to version
2.71 in commit ecd54b65c1f998a7ccd91f7c523e4ff38c4781da:

configure: error: could not determine the string function for int64_t

Fixes:
 - http://autobuild.buildroot.org/results/640bbe5b19d6e046cebd5208b37293e03714cd21

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/apr/0003-Merge-r1887279-from-trunk.patch | 69 ++++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/package/apr/0003-Merge-r1887279-from-trunk.patch b/package/apr/0003-Merge-r1887279-from-trunk.patch
new file mode 100644
index 0000000000..444b9d2b06
--- /dev/null
+++ b/package/apr/0003-Merge-r1887279-from-trunk.patch
@@ -0,0 +1,69 @@
+From a15958a37a06f71c42c690278f9c958b93b7ee20 Mon Sep 17 00:00:00 2001
+From: Yann Ylavic <ylavic@apache.org>
+Date: Thu, 11 Mar 2021 14:10:21 +0000
+Subject: [PATCH] Merge r1887279 from trunk:
+
+build/apr_common.m4: avoid explicit inclusion of "confdefs.h"
+
+The failure is observed on `autoconf-2.69d` (soon to be released
+as `autoconf-2.70`). There `int64_t` detection fails as:
+
+$ autoreconf && ./configure
+checking whether int64_t and int use fmt %d... no
+checking whether int64_t and long use fmt %ld... no
+checking whether int64_t and long long use fmt %lld... no
+configure: error: could not determine the string function for int64_t
+```
+
+This happens because `./configure` always stumbles on warning:
+
+configure:3350: gcc -c -g -O2 -Werror  conftest.c >&5
+In file included from conftest.c:31:
+confdefs.h:22: error: "__STDC_WANT_IEC_60559_ATTRIBS_EXT__" redefined [-Werror]
+   22 | #define __STDC_WANT_IEC_60559_ATTRIBS_EXT__ 1
+      |
+
+It's triggered by double inclusion of `"confdefs.h"` contents:
+explicitly in `APR_TRY_COMPILE_NO_WARNING` macro and implicitly
+via `AC_LANG_SOURCE` use.
+
+To fix it and avoid having to define `main()` declaration the change
+uses `AC_LANG_PROGRAM` instead.
+
+Tested on both `autoconf-2.69` and `autoconf-2.69d`.
+
+
+Github: closes #25
+Submitted by: Sergei Trofimovich <slyfox gentoo.org>
+Reviewed by: ylavic
+
+
+git-svn-id: https://svn.apache.org/repos/asf/apr/apr/branches/1.7.x@1887485 13f79535-47bb-0310-9956-ffa450edef68
+
+[Retrieved from:
+https://github.com/apache/apr/commit/0a763c5e500f4304b7c534fae0fad430d64982e8]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ build/apr_common.m4 | 8 ++------
+ 1 file changed, 2 insertions(+), 6 deletions(-)
+
+diff --git a/build/apr_common.m4 b/build/apr_common.m4
+index 297dd32cf75..b67a8608abe 100644
+--- a/build/apr_common.m4
++++ b/build/apr_common.m4
+@@ -467,13 +467,9 @@ AC_DEFUN([APR_TRY_COMPILE_NO_WARNING],
+    CFLAGS="$CFLAGS -Werror"
+  fi
+  AC_COMPILE_IFELSE(
+-  [AC_LANG_SOURCE(
+-   [#include "confdefs.h"
+-   ]
+-   [[$1]]
+-   [int main(int argc, const char *const *argv) {]
++  [AC_LANG_PROGRAM(
++   [[$1]],
+    [[$2]]
+-   [   return 0; }]
+   )], [CFLAGS=$apr_save_CFLAGS
+ $3],  [CFLAGS=$apr_save_CFLAGS
+ $4])
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
