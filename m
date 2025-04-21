Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 250DFC369AB
	for <buildroot@archiver.kernel.org>; Mon, 21 Apr 2025 15:36:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 541A960AF3;
	Mon, 21 Apr 2025 15:36:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aexXgQXa9q0W; Mon, 21 Apr 2025 15:36:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 35EA860B05
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 35EA860B05;
	Mon, 21 Apr 2025 15:36:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6DA22238
 for <buildroot@buildroot.org>; Mon, 21 Apr 2025 15:36:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 52DD560AEE
 for <buildroot@buildroot.org>; Mon, 21 Apr 2025 15:36:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kM3X4AT-x6ts for <buildroot@buildroot.org>;
 Mon, 21 Apr 2025 15:36:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 559DA605DE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 559DA605DE
 for <buildroot@buildroot.org>; Mon, 21 Apr 2025 15:36:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 43A8F85FA6; Mon, 21 Apr 2025 15:36:10 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon, 21 Apr 2025 16:24:44 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: aaf93ba27f58496e957155ade6213158f3114a34
X-Git-Newrev: 104449d0cb8db537fa7d3dc0502e4dd7af7500b3
X-Patchwork-Hint: ignore
Message-Id: <20250421153610.43A8F85FA6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/file: bump version to 5.46
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=104449d0cb8db537fa7d3dc0502e4dd7af7500b3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

See release announce [1].

The src/mygetopt.h file license was updated from BSD-4-Clause to
BSD-2-Clause in upstream commit [2]. This change makes this file using
the same license as most other files. So this commit removes the
license entry for this file and update the _LICENSE accordingly.

This commit also replaces the mention "one file" on BSD-3-Clause, to
the actual file name using it, which is "vasprintf.c".

This commit also updates the Config.in package homepage URL,
to use https.

[1] https://mailman.astron.com/pipermail/file/2024-November/001435.html
[2] https://github.com/file/file/commit/d605bb40478c4ce94aef88316d3a928b3da746f5

Signed-off-by: Julien Olivain <ju.o@free.fr>
Reviewed-by: Vincent Jardin <vjardin@free.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/file/Config.in | 2 +-
 package/file/file.hash | 5 ++---
 package/file/file.mk   | 6 +++---
 3 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/package/file/Config.in b/package/file/Config.in
index edc4d874b2..6b5326f660 100644
--- a/package/file/Config.in
+++ b/package/file/Config.in
@@ -4,4 +4,4 @@ config BR2_PACKAGE_FILE
 	  Program to identify a file's format by scanning binary data
 	  for known patterns.
 
-	  http://www.darwinsys.com/file/
+	  https://www.darwinsys.com/file/
diff --git a/package/file/file.hash b/package/file/file.hash
index 7c15569c09..53c4d5c4db 100644
--- a/package/file/file.hash
+++ b/package/file/file.hash
@@ -1,7 +1,6 @@
 # Locally calculated after verifying signature
-# https://astron.com/pub/file/file-5.45.tar.gz.asc
+# https://astron.com/pub/file/file-5.46.tar.gz.asc
 # using key BE04995BA8F90ED0C0C176C471112AB16CB33B3A
-sha256  fc97f51029bb0e2c9f4e3bffefdaf678f0e039ee872b9de5c002a6d09c784d82  file-5.45.tar.gz
+sha256  c9cc77c7c560c543135edc555af609d5619dbef011997e988ce40a3d75d86088  file-5.46.tar.gz
 sha256  0bfa856a9930bddadbef95d1be1cf4e163c0be618e76ea3275caaf255283e274  COPYING
-sha256  4ccb60d623884ef637af4a5bc16b2cb350163e2135e967655837336019a64462  src/mygetopt.h
 sha256  2e14b6fa9a74f952ebfde3c96527158df281c953cfaf35609eb854d4da30131c  src/vasprintf.c
diff --git a/package/file/file.mk b/package/file/file.mk
index 27d9181d76..a33b306c4c 100644
--- a/package/file/file.mk
+++ b/package/file/file.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-FILE_VERSION = 5.45
+FILE_VERSION = 5.46
 FILE_SITE = https://astron.com/pub/file
-FILE_LICENSE = BSD-2-Clause, BSD-4-Clause (one file), BSD-3-Clause (one file)
-FILE_LICENSE_FILES = COPYING src/mygetopt.h src/vasprintf.c
+FILE_LICENSE = BSD-2-Clause, BSD-3-Clause (vasprintf.c)
+FILE_LICENSE_FILES = COPYING src/vasprintf.c
 FILE_CPE_ID_VALID = YES
 
 FILE_AUTORECONF = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
