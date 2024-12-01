Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D97FBD49771
	for <buildroot@archiver.kernel.org>; Sun,  1 Dec 2024 15:07:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 556164EC28;
	Sun,  1 Dec 2024 15:07:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l4dPOPP_-83I; Sun,  1 Dec 2024 15:07:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F06654EC06
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F06654EC06;
	Sun,  1 Dec 2024 15:07:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7D063976
 for <buildroot@buildroot.org>; Sun,  1 Dec 2024 15:07:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 695E54EC06
 for <buildroot@buildroot.org>; Sun,  1 Dec 2024 15:07:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7IYCTPJ0jNyi for <buildroot@buildroot.org>;
 Sun,  1 Dec 2024 15:07:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E461C4EBE1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E461C4EBE1
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E461C4EBE1
 for <buildroot@buildroot.org>; Sun,  1 Dec 2024 15:07:23 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 7B839B00573;
 Sun,  1 Dec 2024 16:07:19 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>
Date: Sun,  1 Dec 2024 16:07:13 +0100
Message-ID: <20241201150713.13429-1-ju.o@free.fr>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1733065640;
 bh=sAdR4sh3J35mOSsk9iMX8HNscUn+3f1NSblyns5sL0Q=;
 h=From:To:Cc:Subject:Date:From;
 b=TjZudCYf5tTN4eGj2iUhPGW3orAJVbPpRokQA4ER2jJIYp/84SVVgFcSoyR0UDMp7
 z7kFHF8n+eOCZDlYc/ovHagYY1YcDmNKWhn2lQXAFNpyfCkLDH3dSp4y4hYHUhxnlZ
 CjqSEFoqp+WDnJ1VOFXt1U3XV8TNKE0dSWjIuO8T64a1zAjKemU0GtwZcXueusfXN7
 gMxXvVsyXoePDCN0jNSi89PM2cDOCzNbnSvSGTq2f8uQmqSOnmKa6nNTGHrbFIFU2V
 pjHE4/4MMb+gNEcFVjfiIhZpRnO33XiT3VTlZiqMTMVcxJOiW9p0B25vAJblV4HOz6
 tk3SqiwVgDpTw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=TjZudCYf
Subject: [Buildroot] [PATCH next 1/1] package/file: bump version to 5.46
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

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
---
Patch tested in:
https://gitlab.com/jolivain/buildroot/-/pipelines/1567957114
https://gitlab.com/jolivain/buildroot/-/jobs/8512987847
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
-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
