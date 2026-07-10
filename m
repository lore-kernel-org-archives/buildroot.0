Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C692CC43458
	for <buildroot@archiver.kernel.org>; Fri, 10 Jul 2026 17:10:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 794A060877;
	Fri, 10 Jul 2026 17:10:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bPn8VJ0irPWw; Fri, 10 Jul 2026 17:10:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 86985608A7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783703412;
	bh=JRCwW9pfMKbj3XJX/tM5UPrlSSBL+FCLefJQWafSTuc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Jec/qTL1dyihDaj5Yed9jo7Uf/yb4LGChwObs90+3M7PuMK2l1GGYruvGtqnBKJZJ
	 WnKaWv5dcDJ0PlIodx9O/ZUq58OuSXoqnoXFfPI5Gs3g98xs9E3SKUHaghrxnoPrls
	 ex7X8a8xQSJHxTyzA0mdG4nJCS9RtTddbuXdELHsZbJCtyio/zh1kHMKvMcnAB+5zB
	 b0jCc55YAoU0dhu7b5Hx/u7fyFZmGjbPoOX7m4vIYhQohNQOcr+zo48ocyaFJBrV9L
	 +6KRbE/0do93ILuXVuSh9rBPuu9roSAd+qUsaCILWjSF3t1Ctndxx9eF575BWJ3Xw/
	 3kYXco3ETiaEg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 86985608A7;
	Fri, 10 Jul 2026 17:10:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 11CD8320
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 17:10:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F329D8110A
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 17:10:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C-CGDUlL7Xsi for <buildroot@buildroot.org>;
 Fri, 10 Jul 2026 17:10:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D11A580F27
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D11A580F27
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 17:10:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E1608886A2; Fri, 10 Jul 2026 17:09:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 10 Jul 2026 19:07:08 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c361afc1c3baa1fba3cfec57736d8eb8742492a4
X-Git-Newrev: b396091dbf55234ce9a9d7364dcce0bcb43e1d41
X-Patchwork-Hint: ignore
Message-Id: <20260710170937.E1608886A2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/babeld: bump to version 1.14
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b396091dbf55234ce9a9d7364dcce0bcb43e1d41
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The removed patch has been merged [1].

Release notes:
https://github.com/jech/babeld/blob/master/CHANGES

[1] https://github.com/jech/babeld/commit/f8e5fbb33690b516b8516590def5136e6619de4c
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/babeld/0001-Fix-uclibc-build-issue.patch | 38 ------------------------
 package/babeld/babeld.hash                       |  2 +-
 package/babeld/babeld.mk                         |  2 +-
 3 files changed, 2 insertions(+), 40 deletions(-)

diff --git a/package/babeld/0001-Fix-uclibc-build-issue.patch b/package/babeld/0001-Fix-uclibc-build-issue.patch
deleted file mode 100644
index fb2f69e98b..0000000000
--- a/package/babeld/0001-Fix-uclibc-build-issue.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From f8e5fbb33690b516b8516590def5136e6619de4c Mon Sep 17 00:00:00 2001
-From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
-Date: Tue, 17 Sep 2024 21:48:01 +0200
-Subject: [PATCH] Fix uclibc build issue
-
-This patch fixes the following compilation error raised by the bump to
-version 1.13.1 in Buildroot [1] using uclibc as the C library for the
-cross-compilation toolchain:
-
-net.c: In function 'babel_send':
-net.c:199:27: error: 'IPV6_DONTFRAG' undeclared (first use in this function)
-  199 |         cmsg->cmsg_type = IPV6_DONTFRAG;;
-
-[1] https://patchwork.ozlabs.org/project/buildroot/patch/20240917201030.11583-1-dario.binacchi@amarulasolutions.com/
-Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
-Upstream: https://github.com/jech/babeld/pull/121
----
- net.c | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/net.c b/net.c
-index 7a7b57844e6c..30de3dafe1d9 100644
---- a/net.c
-+++ b/net.c
-@@ -37,6 +37,10 @@ THE SOFTWARE.
- #include <arpa/inet.h>
- #include <errno.h>
- 
-+#if defined(__UCLIBC__)
-+#include <linux/in6.h>
-+#endif
-+
- #include "babeld.h"
- #include "util.h"
- #include "net.h"
--- 
-2.43.0
-
diff --git a/package/babeld/babeld.hash b/package/babeld/babeld.hash
index ab2ffc6ef8..d24649dcd2 100644
--- a/package/babeld/babeld.hash
+++ b/package/babeld/babeld.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  15f24d26da0ccfc073abcdef0309f281e4684f2aa71126f826572c4c845e8dd9  babeld-1.13.1.tar.gz
+sha256  c4ed13c04880ccc3a85a99645dcb64134beac8ab0607fe32a4d07e1057ad73b7  babeld-1.14.tar.gz
 sha256  b415c41292cedef6c97b243609e50552887c29343566c639f23282d31efd2afd  LICENCE
diff --git a/package/babeld/babeld.mk b/package/babeld/babeld.mk
index e9d20111f9..e20cadf9c0 100644
--- a/package/babeld/babeld.mk
+++ b/package/babeld/babeld.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BABELD_VERSION = 1.13.1
+BABELD_VERSION = 1.14
 BABELD_SITE = https://www.irif.fr/~jch/software/files
 BABELD_LICENSE = MIT
 BABELD_LICENSE_FILES = LICENCE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
