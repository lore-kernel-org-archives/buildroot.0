Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F2FCC25B74
	for <buildroot@archiver.kernel.org>; Thu, 16 May 2024 11:09:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5080D41CEA;
	Thu, 16 May 2024 11:09:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ARschGRm8p9Z; Thu, 16 May 2024 11:09:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DA65941D11
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DA65941D11;
	Thu, 16 May 2024 11:09:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 724591BF263
 for <buildroot@lists.busybox.net>; Thu, 16 May 2024 11:09:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4CFE681CA3
 for <buildroot@lists.busybox.net>; Thu, 16 May 2024 11:09:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CSE1MQjtSoFG for <buildroot@lists.busybox.net>;
 Thu, 16 May 2024 11:09:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6109281CA0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6109281CA0
 for <buildroot@buildroot.org>; Thu, 16 May 2024 11:09:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5BE258740B; Thu, 16 May 2024 11:09:28 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 16 May 2024 13:07:27 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 48275e431f5f3ba3ef1c1290d3b28d5c31821172
X-Git-Newrev: 4415daf635e56f55993eafdd196864ebab5b6d3c
X-Patchwork-Hint: ignore
Message-Id: <20240516110928.5BE258740B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/linux-pam: bump
 to version 1.6.1
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
Content-Type: multipart/mixed; boundary="===============2500953710245900703=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2500953710245900703==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=4415daf635e56f55993eafdd196864ebab5b6d3c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Bump to latest version, fixing couple of bugs. Remove patch already
included in this release.

https://github.com/linux-pam/linux-pam/releases/tag/v1.6.1

Signed-off-by: Jan Čermák <sairon@sairon.cz>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 0d394c39b8f26ba6e65771cd4afdcc4fac0ed0e8)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-pam_namespace-include-stdint-h.patch      | 42 ----------------------
 package/linux-pam/linux-pam.hash                   |  4 +--
 package/linux-pam/linux-pam.mk                     |  2 +-
 3 files changed, 3 insertions(+), 45 deletions(-)

diff --git a/package/linux-pam/0001-pam_namespace-include-stdint-h.patch b/package/linux-pam/0001-pam_namespace-include-stdint-h.patch
deleted file mode 100644
index 5eda619505..0000000000
--- a/package/linux-pam/0001-pam_namespace-include-stdint-h.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From cc9d40b7cdbd3e15ccaa324a0dda1680ef9dea13 Mon Sep 17 00:00:00 2001
-From: Jacob Heider <jacob@pkgx.dev>
-Date: Wed, 17 Jan 2024 11:49:26 -0500
-Subject: [PATCH] pam_namespace: include stdint.h
-
-pam_namespace.c makes use of SIZE_MAX but doesn't include stdint.h,
-resulting in the following build failures on 1.6.0:
-
-  pam_namespace.c: In function 'process_line':
-  pam_namespace.c:649:41: error: 'SIZE_MAX' undeclared (first use in this function)
-    649 |         if (count > UINT_MAX || count > SIZE_MAX / sizeof(uid_t)) {
-        |                                         ^~~~~~~~
-  pam_namespace.c:41:1: note: 'SIZE_MAX' is defined in header '<stdint.h>'; did you forget to '#include <stdint.h>'?
-     40 | #include "argv_parse.h"
-    +++ |+#include <stdint.h>
-     41 |
-  pam_namespace.c:649:41: note: each undeclared identifier is reported only once for each function it appears in
-    649 |         if (count > UINT_MAX || count > SIZE_MAX / sizeof(uid_t)) {
-        |                                         ^~~~~~~~
-
-Fixes: v1.6.0~100 ("pam_namespace: validate amount of uids in config")
-Resolves: https://github.com/linux-pam/linux-pam/issues/733
-
-Upstream: https://github.com/linux-pam/linux-pam/commit/cc9d40b7cdbd3e15ccaa324a0dda1680ef9dea13
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- modules/pam_namespace/pam_namespace.c | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/modules/pam_namespace/pam_namespace.c b/modules/pam_namespace/pam_namespace.c
-index f72d67189..b16731c22 100644
---- a/modules/pam_namespace/pam_namespace.c
-+++ b/modules/pam_namespace/pam_namespace.c
-@@ -34,6 +34,8 @@
- 
- #define _ATFILE_SOURCE
- 
-+#include "config.h"
-+#include <stdint.h>
- #include "pam_cc_compat.h"
- #include "pam_inline.h"
- #include "pam_namespace.h"
diff --git a/package/linux-pam/linux-pam.hash b/package/linux-pam/linux-pam.hash
index cd882715cb..353613e6e6 100644
--- a/package/linux-pam/linux-pam.hash
+++ b/package/linux-pam/linux-pam.hash
@@ -1,6 +1,6 @@
 # Locally computed hashes after checking signature at
-# https://github.com/linux-pam/linux-pam/releases/download/v1.6.0/Linux-PAM-1.6.0.tar.xz.asc
+# https://github.com/linux-pam/linux-pam/releases/download/v1.6.1/Linux-PAM-1.6.1.tar.xz.asc
 # signed with the key 8C6BFD92EE0F42EDF91A6A736D1A7F052E5924BB
-sha256  fff4a34e5bbee77e2e8f1992f27631e2329bcbf8a0563ddeb5c3389b4e3169ad  Linux-PAM-1.6.0.tar.xz
+sha256  f8923c740159052d719dbfc2a2f81942d68dd34fcaf61c706a02c9b80feeef8e  Linux-PAM-1.6.1.tar.xz
 # Locally computed
 sha256  133d98e7a2ab3ffd330b4debb0bfc10fea21e4b2b5a5b09de2e924293be5ff08  Copyright
diff --git a/package/linux-pam/linux-pam.mk b/package/linux-pam/linux-pam.mk
index 89a46e81df..a205d67c54 100644
--- a/package/linux-pam/linux-pam.mk
+++ b/package/linux-pam/linux-pam.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LINUX_PAM_VERSION = 1.6.0
+LINUX_PAM_VERSION = 1.6.1
 LINUX_PAM_SOURCE = Linux-PAM-$(LINUX_PAM_VERSION).tar.xz
 LINUX_PAM_SITE = https://github.com/linux-pam/linux-pam/releases/download/v$(LINUX_PAM_VERSION)
 LINUX_PAM_INSTALL_STAGING = YES

--===============2500953710245900703==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2500953710245900703==--
