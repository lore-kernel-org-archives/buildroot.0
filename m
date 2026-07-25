Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A0F5C531C9
	for <buildroot@archiver.kernel.org>; Sat, 25 Jul 2026 11:08:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 90B186078D;
	Sat, 25 Jul 2026 11:08:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fh7714O182FP; Sat, 25 Jul 2026 11:08:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 42249606C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784977718;
	bh=Mcqx7GpKl3fUMMJ9WrMx1IYNs+GVL7f9SSiyaC2wUj4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=iNAc9WnRwlkQyQ8Z9sz7m4xgyng8YCDKBxcB+jFtPoKIzMtEh4/DV7FxemWzckid4
	 Jhf0bCKWeN8490wPVp7oQvMczRvdXpyrVNsmROKcaSNSaNYT6zG3PqSea4c0IsYiTK
	 kV7fnCXZnnTEsK8izBKnE0gBSrp3SiGYI4ES1AbQTvPA2AZ3ombpglQHqjmC7N9AR7
	 iSa50jpX+Y4VdDrNjoFTZmtWF9IKgFa5aVXqJA9Nh97oZKNdsB29T+td/MvCI1EWfY
	 +HkJiSeuWysSzHRxlUcQtUKZATnqbfBQii7hKCa+rUXAxO1Kp5atZC55YPvSEsVqzm
	 WEB6cSIdh8VVw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 42249606C1;
	Sat, 25 Jul 2026 11:08:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1E46B990
 for <buildroot@buildroot.org>; Sat, 25 Jul 2026 11:08:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0FE9B80FF8
 for <buildroot@buildroot.org>; Sat, 25 Jul 2026 11:08:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qlEPXLVFV8c9 for <buildroot@buildroot.org>;
 Sat, 25 Jul 2026 11:08:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DFFAA81000
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id DFFAA81000
 for <buildroot@buildroot.org>; Sat, 25 Jul 2026 11:08:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AB22F8A589; Sat, 25 Jul 2026 11:07:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 25 Jul 2026 11:46:58 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 655ade728de6355df4718419cbf288a3dfec54b8
X-Git-Newrev: 81a59f1203567f117b14a63c3b3119c29f215735
X-Patchwork-Hint: ignore
Message-Id: <20260725110749.AB22F8A589@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/openconnect: bump version to 9.21
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/81a59f1203567f117b14a63c3b3119c29f215735
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://lists.infradead.org/pipermail/openconnect-devel/2026-June/005539.html
https://lists.infradead.org/pipermail/openconnect-devel/2026-June/005540.html

Removed patch which is included in this release.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...x-implicit-declaration-of-function-malloc.patch | 40 ----------------------
 package/openconnect/openconnect.hash               |  2 +-
 package/openconnect/openconnect.mk                 |  2 +-
 3 files changed, 2 insertions(+), 42 deletions(-)

diff --git a/package/openconnect/0001-Fix-implicit-declaration-of-function-malloc.patch b/package/openconnect/0001-Fix-implicit-declaration-of-function-malloc.patch
deleted file mode 100644
index 4732c4fb5e..0000000000
--- a/package/openconnect/0001-Fix-implicit-declaration-of-function-malloc.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 5185f640045df2b4f8ee7f028fc59e6f02fdf367 Mon Sep 17 00:00:00 2001
-From: Brahmajit Das <brahmajit.xyz@gmail.com>
-Date: Mon, 29 Jan 2024 23:28:53 +0530
-Subject: [PATCH] Fix implicit declaration of function 'malloc'
-
-First observed on Gentoo Linux with GCC 14. This is due to GCC 14
-enabling -Werror=implicit-function-declaration by default.
-Thus resulting in errors such as:
-
-openconnect-internal.h: In function 'alloc_pkt':
-openconnect-internal.h:911:27: error: implicit declaration of function 'malloc' [-Werror=implicit-function-declaration]
-  911 |         struct pkt *pkt = malloc(alloc_len);
-      |                           ^~~~~~
-
-Plese refer gentoo bug: https://bugs.gentoo.org/923173
-Signed-off-by: Brahmajit Das <brahmajit.xyz@gmail.com>
-
-Upstream: https://gitlab.com/openconnect/openconnect/-/commit/5185f640045df2b4f8ee7f028fc59e6f02fdf367
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
-[rebased for 9.12]
----
- openconnect-internal.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/openconnect-internal.h b/openconnect-internal.h
-index 21460adf6..2830d693f 100644
---- a/openconnect-internal.h
-+++ b/openconnect-internal.h
-@@ -87,6 +87,7 @@
- 
- #include <libxml/tree.h>
- #include <zlib.h>
-+#include <stdlib.h>
- 
- #ifdef _WIN32
- #ifndef _Out_cap_c_
--- 
-GitLab
-
diff --git a/package/openconnect/openconnect.hash b/package/openconnect/openconnect.hash
index 86bdaa5d4e..e18485327f 100644
--- a/package/openconnect/openconnect.hash
+++ b/package/openconnect/openconnect.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  a2bedce3aa4dfe75e36e407e48e8e8bc91d46def5335ac9564fbf91bd4b2413e  openconnect-9.12.tar.gz
+sha256  5b32369467db6e5f317aa1ed12cfcbb81ed00bdbc765450b6bfcbdc300944a58  openconnect-9.21.tar.gz
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LGPL
diff --git a/package/openconnect/openconnect.mk b/package/openconnect/openconnect.mk
index 73716d708e..e9a3257edb 100644
--- a/package/openconnect/openconnect.mk
+++ b/package/openconnect/openconnect.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENCONNECT_VERSION = 9.12
+OPENCONNECT_VERSION = 9.21
 OPENCONNECT_SITE = https://www.infradead.org/openconnect/download
 OPENCONNECT_DEPENDENCIES = host-pkgconf libxml2 zlib
 OPENCONNECT_LICENSE = LGPL-2.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
