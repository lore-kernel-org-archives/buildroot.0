Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66BD0E7D0C5
	for <buildroot@archiver.kernel.org>; Tue, 26 Sep 2023 05:49:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1F81241795;
	Tue, 26 Sep 2023 05:49:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1F81241795
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wrjNVjZ04mbG; Tue, 26 Sep 2023 05:49:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 54C3A4178A;
	Tue, 26 Sep 2023 05:49:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 54C3A4178A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0874B1BF33A
 for <buildroot@lists.busybox.net>; Tue, 26 Sep 2023 05:49:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E40D081361
 for <buildroot@lists.busybox.net>; Tue, 26 Sep 2023 05:49:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E40D081361
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RqF3UKzNsXBY for <buildroot@lists.busybox.net>;
 Tue, 26 Sep 2023 05:49:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0D76C812AE
 for <buildroot@buildroot.org>; Tue, 26 Sep 2023 05:49:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0D76C812AE
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EFDA7877C3; Tue, 26 Sep 2023 05:49:46 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 26 Sep 2023 07:45:20 +0200
X-Git-Refname: refs/heads/2023.08.x
X-Git-Oldrev: bfcc79b2ae07715eee81fb60fba9eaf253a99fa4
X-Git-Newrev: 7b548ebabeb4465616302a417cdadf4e8d12b071
X-Patchwork-Hint: ignore
Message-Id: <20230926054946.EFDA7877C3@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.08.x] package/pound: include
 limits.h
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

commit: https://git.buildroot.net/buildroot/commit/?id=7b548ebabeb4465616302a417cdadf4e8d12b071
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.08.x

Fix the following build failure raised since bump to version 4.8 in
commit 525cb6a8fbe04a959ea6e3a21a3f6f8828d7e9dc and
https://github.com/graygnuorg/pound/commit/c951f2357d9f606a9e1f8727e74b55f1da91fa2f:

Fixes:
 - http://autobuild.buildroot.org/results/4edfffcd5d4383c57947d97139331e0bf2cb6155

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
(cherry picked from commit c6e40c2e3e450bc8018638acf937868757ab28a4)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pound/0001-include-limits.h.patch | 75 +++++++++++++++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/package/pound/0001-include-limits.h.patch b/package/pound/0001-include-limits.h.patch
new file mode 100644
index 0000000000..8f188af07c
--- /dev/null
+++ b/package/pound/0001-include-limits.h.patch
@@ -0,0 +1,75 @@
+From a0374d946e55129b36ba1e0024e1d94675a8f044 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 17 Sep 2023 22:01:21 +0200
+Subject: [PATCH] include limits.h
+
+Include limits.h to avoid the following build failure:
+
+poundctl.c: In function 'oi_getn':
+poundctl.c:232:29: error: 'INT_MAX' undeclared (first use in this function)
+  232 |   if (errno || n < 0 || n > INT_MAX)
+      |                             ^~~~~~~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/4edfffcd5d4383c57947d97139331e0bf2cb6155
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Upstream: https://github.com/graygnuorg/pound/pull/17
+---
+ src/config.c   | 1 +
+ src/poundctl.c | 1 +
+ src/svc.c      | 1 +
+ src/tmpl.c     | 1 +
+ 4 files changed, 4 insertions(+)
+
+diff --git a/src/config.c b/src/config.c
+index b7e3150..12f5cfa 100644
+--- a/src/config.c
++++ b/src/config.c
+@@ -21,6 +21,7 @@
+ #include "extern.h"
+ #include <openssl/x509v3.h>
+ #include <assert.h>
++#include <limits.h>
+ 
+ 
+ /*
+diff --git a/src/poundctl.c b/src/poundctl.c
+index bd1459f..7fa18c8 100644
+--- a/src/poundctl.c
++++ b/src/poundctl.c
+@@ -19,6 +19,7 @@
+ #include "pound.h"
+ #include "json.h"
+ #include <assert.h>
++#include <limits.h>
+ 
+ char *conf_name = POUND_CONF;
+ char *socket_name;
+diff --git a/src/svc.c b/src/svc.c
+index 6e810a6..457f1e0 100644
+--- a/src/svc.c
++++ b/src/svc.c
+@@ -20,6 +20,7 @@
+ #include "pound.h"
+ #include "extern.h"
+ #include "json.h"
++#include <limits.h>
+ 
+ /*
+  * basic hashing function, based on fmv
+diff --git a/src/tmpl.c b/src/tmpl.c
+index 2efa72f..0e5b65d 100644
+--- a/src/tmpl.c
++++ b/src/tmpl.c
+@@ -26,6 +26,7 @@
+ 
+ #include "pound.h"
+ #include <assert.h>
++#include <limits.h>
+ #include "json.h"
+ 
+ static void
+-- 
+2.40.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
