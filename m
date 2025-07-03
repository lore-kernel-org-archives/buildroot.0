Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F9CEC83030
	for <buildroot@archiver.kernel.org>; Fri,  4 Jul 2025 06:21:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DC01860BBA;
	Fri,  4 Jul 2025 06:21:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jVVYwbZeubCS; Fri,  4 Jul 2025 06:21:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DA40160B71
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DA40160B71;
	Fri,  4 Jul 2025 06:21:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0C44C7AB
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 06:21:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0D0A340EF4
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 06:21:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r3t3aJSemAH9 for <buildroot@buildroot.org>;
 Fri,  4 Jul 2025 06:21:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3DB9640EE7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3DB9640EE7
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 06:21:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1AEE385CCB; Fri,  4 Jul 2025 06:21:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 3 Jul 2025 09:23:01 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 5c1230a90bca234259f0496fa1bb9c84d0c5edff
X-Git-Newrev: 5da15192c3f50bec0d47bb76e0e7c62784ca7d53
X-Patchwork-Hint: ignore
Message-Id: <20250704062126.1AEE385CCB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/cifs-utils: bump
 to version 7.3
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
Content-Type: multipart/mixed; boundary="===============4735602151345198481=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4735602151345198481==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=5da15192c3f50bec0d47bb76e0e7c62784ca7d53
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

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
(cherry picked from commit efdf0cdbcb2cf11d54ef8eee123529f264fe8ce9)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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

--===============4735602151345198481==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4735602151345198481==--
