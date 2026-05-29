Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F26B8CD6E49
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 08:28:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C983860DDB;
	Fri, 29 May 2026 08:28:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qvg5xdcjLLyl; Fri, 29 May 2026 08:28:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F032661475
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780043290;
	bh=RI6ES4GZfaKjCiZnoe2Mpk/HBwAM7+22DYrmuPFl72A=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=O+2pLban8IyNkAgQDYnddX1dYnnu5ulB2eAHb2/VJX2dGJFB8b+R8YI8hiGd+sds8
	 tn5JDZ2UHh1+xuagANs9xzx1fA1KSPiRB7Gs7EovG7BMkrnFoBpRcmNY9Pq2SrQAB/
	 qWzBfFYWZENOxvhUsLs5s1xm26Yaxxkid7Pehr4BX50d4BSAk0+ClFfL8vycPSS3rC
	 NrQNIo+VQ0Ccci61zTDQx04IPUIc+s00ZgZdFUE0SXJkjYbBMm+wcCeAm6vjY0kkg3
	 O/vZM8QPwf5yKkUamWqBczAgcIS9mpWQUc9mP+piXaAYqpFmHWKUecIOWxzxQiFYml
	 bzp6sKjY/xu5Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F032661475;
	Fri, 29 May 2026 08:28:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 136C4288
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:28:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C4EE9420A7
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:28:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tovy3NhPdh5G for <buildroot@buildroot.org>;
 Fri, 29 May 2026 08:28:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3929B420A2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3929B420A2
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:28:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CBA29873A7; Fri, 29 May 2026 08:27:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 29 May 2026 10:25:53 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: b09763e6d96de908c353ea2439bbcb3c9cd1a700
X-Git-Newrev: efee1ec45347e3e08869ff330b2045488ecaaf2d
X-Patchwork-Hint: ignore
Message-Id: <20260529082747.CBA29873A7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/dos2unix: update
 upstream URLs
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/efee1ec45347e3e08869ff330b2045488ecaaf2d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

The old upstream page [1] is being deprecated. It currently shows:
"""
This page will go offline on 1 July 2026. Go to the new page at
https://waterlander.net/dos2unix/
"""

This commit updates the homepage, download site and hash file URL
to the new upstream location [2].

[1] http://waterlan.home.xs4all.nl/dos2unix.html
[2] https://waterlander.net/dos2unix/

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
[Julien: add info in commit log]
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 44f60e9f708ff01ee9b4631b252923cab11c79d5)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/dos2unix/Config.in     | 2 +-
 package/dos2unix/dos2unix.hash | 2 +-
 package/dos2unix/dos2unix.mk   | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/dos2unix/Config.in b/package/dos2unix/Config.in
index cfb5ba4b79..928605ae37 100644
--- a/package/dos2unix/Config.in
+++ b/package/dos2unix/Config.in
@@ -4,4 +4,4 @@ config BR2_PACKAGE_DOS2UNIX
 	help
 	  dos2unix converts text file line endings between CRLF and LF
 
-	  http://waterlan.home.xs4all.nl/dos2unix.html
+	  https://waterlander.net/dos2unix/
diff --git a/package/dos2unix/dos2unix.hash b/package/dos2unix/dos2unix.hash
index 3e9bf7882e..7fae29fea7 100644
--- a/package/dos2unix/dos2unix.hash
+++ b/package/dos2unix/dos2unix.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://waterlan.home.xs4all.nl/dos2unix/dos2unix-7.5.3.tar.gz.asc
+# https://waterlander.net/dos2unix/files/dos2unix-7.5.3.tar.gz.asc
 sha256  28a4b0d9f9179da4e44c567b9c01f818b070a20827115fffd96f760dcfa0f3b2  dos2unix-7.5.3.tar.gz
 sha256  bff21c3509fe7348c8327745b2f80d8847b04868073c6d0861bf8c773db66515  COPYING.txt
diff --git a/package/dos2unix/dos2unix.mk b/package/dos2unix/dos2unix.mk
index 4c57a4de5f..a9829e4889 100644
--- a/package/dos2unix/dos2unix.mk
+++ b/package/dos2unix/dos2unix.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 DOS2UNIX_VERSION = 7.5.3
-DOS2UNIX_SITE = http://waterlan.home.xs4all.nl/dos2unix
+DOS2UNIX_SITE = https://waterlander.net/dos2unix/files
 DOS2UNIX_LICENSE = BSD-2-Clause
 DOS2UNIX_LICENSE_FILES = COPYING.txt
 DOS2UNIX_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
