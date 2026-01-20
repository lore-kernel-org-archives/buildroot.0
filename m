Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CC64D2629C
	for <buildroot@archiver.kernel.org>; Tue, 20 Jan 2026 20:24:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A9C2560A97;
	Tue, 20 Jan 2026 20:24:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7SCCcg2BWYyD; Tue, 20 Jan 2026 20:24:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ACFD860AA8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768940695;
	bh=2VpAcnvBybCqBjhtL1I8SQq8ASEmI/CblWnomPSJ/2w=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=rLQMflbq4hPc6xQj6gOawJ9gplNeVHhLeV/IXDO09JuIIoU3o+D0zqDuL6ZVFJkkE
	 gAIi7X/QL2e0KwBKMVdHI7Zt0EHcfxUbsSLOeNVEhObwt/PvyZxQsY9zgevck4J3EL
	 rUF3Ku5TiEIaYV2T9Lq52fgHqS+aMDEw0sQKN+nYCoFdfhP3xTmCbZVfrGbp+8f7ZZ
	 pv4PLZkjNPBai8DaCpt6qxcf8YFjs+CQluXj3Wu3uSwquiFRaw+9mLh0I/7OXbULrU
	 TJMTyCKwPCRlI7sjnoVN6lAUam+tVaaPG4Me8toUcGue+WKXizDMr8uytwu2zdgiTX
	 wewqdD1/yWeRA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id ACFD860AA8;
	Tue, 20 Jan 2026 20:24:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D2C83122
 for <buildroot@buildroot.org>; Tue, 20 Jan 2026 20:24:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B771840571
 for <buildroot@buildroot.org>; Tue, 20 Jan 2026 20:24:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MWYEenBy7jCa for <buildroot@buildroot.org>;
 Tue, 20 Jan 2026 20:24:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A642A405B7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A642A405B7
 for <buildroot@buildroot.org>; Tue, 20 Jan 2026 20:24:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 91DF087A80; Tue, 20 Jan 2026 20:24:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 20 Jan 2026 21:24:14 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a042ea816a44a72084fe90effc912787f1a2a673
X-Git-Newrev: dba34ea34dc527f1de9730abce10ffdaf84177f2
X-Patchwork-Hint: ignore
Message-Id: <20260120202449.91DF087A80@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mcelog: bump version to 210
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

commit: https://git.buildroot.net/buildroot/commit/?id=dba34ea34dc527f1de9730abce10ffdaf84177f2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://git.kernel.org/pub/scm/utils/cpu/mce/mcelog.git/log/

Removed patches which are included in this release.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...ver-Correct-prameter-type-for-connect-API.patch | 43 ----------------------
 .../0002-client.c-fix-build-w-musl-libc.patch      | 42 ---------------------
 package/mcelog/mcelog.hash                         |  2 +-
 package/mcelog/mcelog.mk                           |  2 +-
 4 files changed, 2 insertions(+), 87 deletions(-)

diff --git a/package/mcelog/0001-server-Correct-prameter-type-for-connect-API.patch b/package/mcelog/0001-server-Correct-prameter-type-for-connect-API.patch
deleted file mode 100644
index cc9d0e84c6..0000000000
--- a/package/mcelog/0001-server-Correct-prameter-type-for-connect-API.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From c17897deb52daab300c585a6a6c2456d062d80cf Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 11 May 2024 22:50:19 -0700
-Subject: [PATCH] server: Correct prameter type for connect() API
-
-connect() function expects the second argument to be point to sockaddr
-as per man sockaddr
-
-int connect (int, const struct sockaddr *, socklen_t);
-
-Fixes build failures with -Wincompatible-pointer-types when using GCC-14
-and musl
-
-Fixes
-| server.c: In function 'server_ping':
-| server.c:308:33: error: passing argument 2 of 'connect' from incompatible pointer type [-Wincompatible-pointer-types]
-|   308 |                 if (connect(fd, un, sizeof(struct sockaddr_un)) < 0)
-|       |                                 ^~
-|       |                                 |
-|       |                                 struct sockaddr_un *
-
-Signed-off-by: Andi Kleen <ak@linux.intel.com>
-
-Upstream: https://git.kernel.org/pub/scm/utils/cpu/mce/mcelog.git/commit/?id=c17897deb52daab300c585a6a6c2456d062d80cf
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- server.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/server.c b/server.c
-index 54c7d57..51b7d3a 100644
---- a/server.c
-+++ b/server.c
-@@ -305,7 +305,7 @@ static int server_ping(struct sockaddr_un *un)
- 	if (sigsetjmp(ping_timeout_ctx, 1) == 0) {
- 		ret = -1;
- 		alarm(initial_ping_timeout);
--		if (connect(fd, un, sizeof(struct sockaddr_un)) < 0)
-+		if (connect(fd, (const struct sockaddr *)un, sizeof(struct sockaddr_un)) < 0)
- 			goto cleanup;
- 		if (write(fd, PAIR("ping\n")) < 0)
- 			goto cleanup;
diff --git a/package/mcelog/0002-client.c-fix-build-w-musl-libc.patch b/package/mcelog/0002-client.c-fix-build-w-musl-libc.patch
deleted file mode 100644
index f7334c8c6f..0000000000
--- a/package/mcelog/0002-client.c-fix-build-w-musl-libc.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From a90e39f896a2f1b76ad3c304b69c451ec92a687a Mon Sep 17 00:00:00 2001
-From: Brahmajit Das <brahmajit.xyz@gmail.com>
-Date: Mon, 12 Jun 2023 10:55:28 +0000
-Subject: [PATCH] client.c: fix build w/ musl libc
-
-Without the patch, I'm getting the following error:
-
-client.c:47:2: error: call to undeclared library function 'strncpy' with type
-      'char *(char *, const char *, unsigned long)'; ISO C99 and later do not support implicit function declarations
-      [-Wimplicit-function-declaration]
-        strncpy(sun.sun_path, path, sizeof(sun.sun_path)-1);
-        ^
-client.c:47:2: note: include the header <string.h> or explicitly provide a declaration for 'strncpy'
-client.c:60:19: error: call to undeclared library function 'memcmp' with type 'int
-      (const void *, const void *, unsigned long)'; ISO C99 and later do not support implicit function declarations
-      [-Wimplicit-function-declaration]
-                        if (n >= 5 && !memcmp(buf + n - 5, "done\n", 5)) {
-                                       ^
-client.c:60:19: note: include the header <string.h> or explicitly provide a declaration for 'memcmp'
-2 errors generated.
-
-Signed-off-by: Brahmajit Das <brahmajit.xyz@gmail.com>
-
-Upstream: https://git.kernel.org/pub/scm/utils/cpu/mce/mcelog.git/commit/?id=a90e39f896a2f1b76ad3c304b69c451ec92a687a
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- client.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/client.c b/client.c
-index 883b1de..7119ed9 100644
---- a/client.c
-+++ b/client.c
-@@ -19,6 +19,7 @@
- #include <sys/socket.h>
- #include <sys/un.h>
- #include <unistd.h>
-+#include <string.h>
- #include "mcelog.h"
- #include "client.h"
- #include "paths.h"
diff --git a/package/mcelog/mcelog.hash b/package/mcelog/mcelog.hash
index a82d6f2ed2..309a0fa197 100644
--- a/package/mcelog/mcelog.hash
+++ b/package/mcelog/mcelog.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  52ad2771a8dc8e30b44a52864620cf1be1fce81f9ae83c4652a9e2d010b1a533  mcelog-194.tar.gz
+sha256  5760c1b433ca4caccf140d51490e2565d117a684942d9f6b4d79b6209465e11e  mcelog-210.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/mcelog/mcelog.mk b/package/mcelog/mcelog.mk
index 5cd00cc354..62bd492e0f 100644
--- a/package/mcelog/mcelog.mk
+++ b/package/mcelog/mcelog.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MCELOG_VERSION = 194
+MCELOG_VERSION = 210
 MCELOG_SITE = $(call github,andikleen,mcelog,v$(MCELOG_VERSION))
 MCELOG_LICENSE = GPL-2.0
 MCELOG_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
