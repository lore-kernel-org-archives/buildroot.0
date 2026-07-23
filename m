Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70341C531D0
	for <buildroot@archiver.kernel.org>; Thu, 23 Jul 2026 19:52:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 26DE940AB4;
	Thu, 23 Jul 2026 19:52:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OX9O2q0DZkKm; Thu, 23 Jul 2026 19:52:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 42F1640A9F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784836373;
	bh=X8qV/y2MiLlOqZ8YQvUAkwO+7fUuzi2AOIw3+9zJgWo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=pr9DlU/aWVVY5LeJJJF2tHZbuG5g3HmO0Ve9BI4T31gIjF/y/AcIsn1QpFCq8dNyc
	 LswUzQBugSQuj7NouepHvlkZOXBAk3zX6rDHZ6BSwK5CJqkuZ/A3pieSf+s8MQRoYS
	 LiPxtItj26FyKO5J5pg2ij1r2c+yp2Ato1RjdlfML7SHBvr4ZyQdJiWj/TS94Ixlwn
	 Dfw4OomeYqdRaqPlQcNYsxIKVbyYnDzdmxwAk0kpH+bA40f0QMjLPiAwott2uUhEaQ
	 vKuQd8u9ww+OKA4Q94IlFEUaYh9OQLRB5UmblTFhE+ivMzB9UXm+mEw9Tk4bP8mKn8
	 quHZe8+FyCd9w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 42F1640A9F;
	Thu, 23 Jul 2026 19:52:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 23C1442A
 for <buildroot@buildroot.org>; Thu, 23 Jul 2026 19:52:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 151358112C
 for <buildroot@buildroot.org>; Thu, 23 Jul 2026 19:52:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CHozS0dICLdq for <buildroot@buildroot.org>;
 Thu, 23 Jul 2026 19:52:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 00085810B0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 00085810B0
 for <buildroot@buildroot.org>; Thu, 23 Jul 2026 19:52:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A3C878A422; Thu, 23 Jul 2026 19:52:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 23 Jul 2026 21:48:04 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b0cfb765890882ce67eb6ef2a8b52eecbd8888d0
X-Git-Newrev: 8cda55b2237194cef51008b2a6d0f9637095be18
X-Patchwork-Hint: ignore
Message-Id: <20260723195211.A3C878A422@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dropbear: bump version to 2026.94
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
Content-Type: multipart/mixed; boundary="===============7441462908128224722=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7441462908128224722==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/8cda55b2237194cef51008b2a6d0f9637095be18
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://matt.ucc.asn.au/dropbear/CHANGES

Removed patch, the build error was fixed upstream by
https://github.com/mkj/dropbear/pull/475

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../0001-scp-fix-build-with-gcc-14.x.patch         | 40 ----------------------
 package/dropbear/dropbear.hash                     |  2 +-
 package/dropbear/dropbear.mk                       |  2 +-
 3 files changed, 2 insertions(+), 42 deletions(-)

diff --git a/package/dropbear/0001-scp-fix-build-with-gcc-14.x.patch b/package/dropbear/0001-scp-fix-build-with-gcc-14.x.patch
deleted file mode 100644
index 0c2b5cbdb5..0000000000
--- a/package/dropbear/0001-scp-fix-build-with-gcc-14.x.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 0c67372257575f6ec59364aba5ca579c126b7678 Mon Sep 17 00:00:00 2001
-From: Voxel <voxel@andreev.msk.ru>
-Date: Tue, 21 Jul 2026 19:28:00 +0200
-Subject: [PATCH] scp: fix build with gcc >= 14.x
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Fixes build errors seen with gcc 14.x:
-
-src/scp.c: In function ‘sink’:
-src/scp.c:1214:32: error: implicit declaration of function ‘ascii_isdigit’
- [-Wimplicit-function-declaration]
-
-src/scp.c: In function ‘okname’:
-src/scp.c:1501:22: error: implicit declaration of function ‘ascii_isalpha’
- [-Wimplicit-function-declaration]
-
-Upstream: https://github.com/mkj/dropbear/pull/474
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- src/scp.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/scp.c b/src/scp.c
-index d7266fdd..633b4dba 100644
---- a/src/scp.c
-+++ b/src/scp.c
-@@ -81,6 +81,7 @@
- #include "compat.h"
- #include "scpmisc.h"
- #include "progressmeter.h"
-+#include "dbutil.h"
- 
- void bwlimit(int);
- 
--- 
-2.47.3
-
diff --git a/package/dropbear/dropbear.hash b/package/dropbear/dropbear.hash
index 2538132463..3c48dfe958 100644
--- a/package/dropbear/dropbear.hash
+++ b/package/dropbear/dropbear.hash
@@ -1,5 +1,5 @@
 # From https://matt.ucc.asn.au/dropbear/releases/SHA256SUM.asc
-sha256  310a6087952897c182efbe16088fa0c4d07c467e850a22699472137278fabf09  dropbear-2026.93.tar.bz2
+sha256  e098034a843699200c8c977a991fff73159735bf795d5f72ef672c41a6b1ae81  dropbear-2026.94.tar.bz2
 
 # License file, locally computed
 sha256  a99ce657d790b761c132ee7e0de18edb437ae6361e536d991c6a12f36e770445  LICENSE
diff --git a/package/dropbear/dropbear.mk b/package/dropbear/dropbear.mk
index e595ebc10c..63d910b48d 100644
--- a/package/dropbear/dropbear.mk
+++ b/package/dropbear/dropbear.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DROPBEAR_VERSION = 2026.93
+DROPBEAR_VERSION = 2026.94
 DROPBEAR_SITE = https://matt.ucc.asn.au/dropbear/releases
 DROPBEAR_SOURCE = dropbear-$(DROPBEAR_VERSION).tar.bz2
 DROPBEAR_LICENSE = MIT, BSD-2-Clause, Public domain

--===============7441462908128224722==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7441462908128224722==--
