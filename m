Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90258C4345F
	for <buildroot@archiver.kernel.org>; Wed,  1 May 2024 20:48:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5E1E3417A6;
	Wed,  1 May 2024 20:48:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rcCDX1L1TTig; Wed,  1 May 2024 20:48:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0F267417C5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0F267417C5;
	Wed,  1 May 2024 20:48:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1C6411BF983
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 20:48:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 08E9F4179E
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 20:48:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i33_2j6yyxAY for <buildroot@lists.busybox.net>;
 Wed,  1 May 2024 20:48:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2A5F941779
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2A5F941779
 for <buildroot@buildroot.org>; Wed,  1 May 2024 20:48:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0C4A7864DF; Wed,  1 May 2024 20:48:01 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 1 May 2024 22:46:39 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b890206876588ed0d16187abf49d35a45177cc3d
X-Git-Newrev: 0d394c39b8f26ba6e65771cd4afdcc4fac0ed0e8
X-Patchwork-Hint: ignore
Message-Id: <20240501204801.0C4A7864DF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/linux-pam: bump to version 1.6.1
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7549326934501862604=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7549326934501862604==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=0d394c39b8f26ba6e65771cd4afdcc4fac0ed0e8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump to latest version, fixing couple of bugs. Remove patch already
included in this release.

https://github.com/linux-pam/linux-pam/releases/tag/v1.6.1

Signed-off-by: Jan Čermák <sairon@sairon.cz>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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

--===============7549326934501862604==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7549326934501862604==--
