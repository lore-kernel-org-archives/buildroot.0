Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9B0FC369B4
	for <buildroot@archiver.kernel.org>; Mon, 14 Apr 2025 19:44:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8BEF260E0F;
	Mon, 14 Apr 2025 19:44:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v_Rg-TAWsuee; Mon, 14 Apr 2025 19:44:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A206460E37
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A206460E37;
	Mon, 14 Apr 2025 19:44:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id D144E205
 for <buildroot@buildroot.org>; Mon, 14 Apr 2025 19:44:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C28AD40403
 for <buildroot@buildroot.org>; Mon, 14 Apr 2025 19:44:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R4QHzSrs5AAl for <buildroot@buildroot.org>;
 Mon, 14 Apr 2025 19:44:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0189740D3D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0189740D3D
 for <buildroot@buildroot.org>; Mon, 14 Apr 2025 19:44:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EF1BE846F5; Mon, 14 Apr 2025 19:44:10 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 14 Apr 2025 21:43:19 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d39d9b53ec3a718b2b684739e1585352577b3f1f
X-Git-Newrev: efdf0cdbcb2cf11d54ef8eee123529f264fe8ce9
X-Patchwork-Hint: ignore
Message-Id: <20250414194410.EF1BE846F5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cifs-utils: bump to version 7.3
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
Content-Type: multipart/mixed; boundary="===============7426232778476121219=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7426232778476121219==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=efdf0cdbcb2cf11d54ef8eee123529f264fe8ce9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changes 7.1..7.2:

- Security enhancements including support for password rotation,
  better credential management, and namespaces
- Various improvements to man pages

Changes 7.2..7.3:

- Three fixes, including a fix for "guest" mount problem introduced
  with version 7.2

Our patch is upstream as of 7.2, so we can drop it.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...ap_ping.c-add-missing-sys-types.h-include.patch | 38 ----------------------
 package/cifs-utils/cifs-utils.hash                 |  2 +-
 package/cifs-utils/cifs-utils.mk                   |  2 +-
 3 files changed, 2 insertions(+), 40 deletions(-)

diff --git a/package/cifs-utils/0001-cldap_ping.c-add-missing-sys-types.h-include.patch b/package/cifs-utils/0001-cldap_ping.c-add-missing-sys-types.h-include.patch
deleted file mode 100644
index bf7864e01a..0000000000
--- a/package/cifs-utils/0001-cldap_ping.c-add-missing-sys-types.h-include.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 62297e906149f9d2ca7b187a60f7c5ab99ef5dd5 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Date: Thu, 26 Dec 2024 21:39:05 +0100
-Subject: [PATCH] cldap_ping.c: add missing <sys/types.h> include
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Fixes:
-
-cldap_ping.c: In function ‘read_dns_string’:
-cldap_ping.c:72:37: error: ‘u_char’ undeclared (first use in this function)
-
-when building with the musl C library, but even with glibc u_char is
-defined in <sys/types.h>, it happens to work with glibc <sys/types.h>
-gets included by another header.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Upstream: https://lore.kernel.org/linux-cifs/20241226204235.2311371-1-thomas.petazzoni@bootlin.com/
----
- cldap_ping.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/cldap_ping.c b/cldap_ping.c
-index 9183b27..a603be3 100644
---- a/cldap_ping.c
-+++ b/cldap_ping.c
-@@ -20,6 +20,7 @@
- #include <talloc.h>
- #include <string.h>
- #include <sys/socket.h>
-+#include <sys/types.h>
- #include <arpa/inet.h>
- #include <unistd.h>
- #include <resolv.h>
--- 
-2.47.0
-
diff --git a/package/cifs-utils/cifs-utils.hash b/package/cifs-utils/cifs-utils.hash
index 942f8aaa39..ea32d4dca7 100644
--- a/package/cifs-utils/cifs-utils.hash
+++ b/package/cifs-utils/cifs-utils.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256  a21123f76a4a6a36c9653189ba4918ebdf3cfcd3f9092730a47ff3450b5b5b2a  cifs-utils-7.1.tar.bz2
+sha256  c4e1eb5f4ad880d96e16d95a1cdbc7ec978ab51c5b6d8a20ae09dac638f36dd5  cifs-utils-7.3.tar.bz2
 
 # Hash for license file:
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/cifs-utils/cifs-utils.mk b/package/cifs-utils/cifs-utils.mk
index e8eefde275..9c029342eb 100644
--- a/package/cifs-utils/cifs-utils.mk
+++ b/package/cifs-utils/cifs-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CIFS_UTILS_VERSION = 7.1
+CIFS_UTILS_VERSION = 7.3
 CIFS_UTILS_SOURCE = cifs-utils-$(CIFS_UTILS_VERSION).tar.bz2
 CIFS_UTILS_SITE = http://ftp.samba.org/pub/linux-cifs/cifs-utils
 CIFS_UTILS_LICENSE = GPL-3.0+

--===============7426232778476121219==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7426232778476121219==--
