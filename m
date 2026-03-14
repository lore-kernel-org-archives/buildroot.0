Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5795F10854A6
	for <buildroot@archiver.kernel.org>; Sat, 14 Mar 2026 21:04:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 89DEF60FB2;
	Sat, 14 Mar 2026 21:04:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Cr6A71tGv_s3; Sat, 14 Mar 2026 21:03:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4DB8B60852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773522239;
	bh=/ebxEASpUcBPLpQwD77lQew2MfKbIShrm4oyMCWS3/U=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=VJMzMKa7CDGGIlLO3wlL05azvJ15TM4IhkMIf0BB2vIsJKGO+B+HTWIcGLqktWns0
	 WI9JKbVu5Vb0LuROOgb8vQdm9gPDaamhDS+P4m2MxTcRmrl0XIw4L/f4LjHMhDDyiN
	 9Va3aZwLz2LfgT1zkmvlBHlY2doI5k5bzsdrgedjU6Xi1zbqSlwSH/mCVv88qUuwB+
	 HghLQpdZIh/XCVt8eK5A67LJJQFjUeZHF+QRwGvUxVXqy+esxZoNZudZ95YBnkXcAj
	 FPE+5YRVN5MVblxWzKeNl1s7FHV0sy++VQzPRCBgJAxDT3WWxVuWfAwbx4rzyE9/gb
	 XQOFyy8OJGqeQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4DB8B60852;
	Sat, 14 Mar 2026 21:03:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 88EFB1B2
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 21:03:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6E9E860852
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 21:03:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1r3-Sk63Y-d6 for <buildroot@buildroot.org>;
 Sat, 14 Mar 2026 21:03:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B57B960752
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B57B960752
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 21:03:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DAA2D83BFF; Sat, 14 Mar 2026 21:03:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 14 Mar 2026 21:59:03 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 66b617af7bc53c9e4dfb3bc12a75902417847666
X-Git-Newrev: b38ef052d6124aecee2803ce1b46b354437b8619
X-Patchwork-Hint: ignore
Message-Id: <20260314210357.DAA2D83BFF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/file: bump version to 5.47
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b38ef052d6124aecee2803ce1b46b354437b8619
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/file/file/blob/FILE5_47/ChangeLog

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/file/file.hash | 4 ++--
 package/file/file.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/file/file.hash b/package/file/file.hash
index 53c4d5c4db..bb367893a9 100644
--- a/package/file/file.hash
+++ b/package/file/file.hash
@@ -1,6 +1,6 @@
 # Locally calculated after verifying signature
-# https://astron.com/pub/file/file-5.46.tar.gz.asc
+# https://astron.com/pub/file/file-5.47.tar.gz.asc
 # using key BE04995BA8F90ED0C0C176C471112AB16CB33B3A
-sha256  c9cc77c7c560c543135edc555af609d5619dbef011997e988ce40a3d75d86088  file-5.46.tar.gz
+sha256  45672fec165cb4cc1358a2d76b5d57d22876dcb97ab169427ac385cbe1d5597a  file-5.47.tar.gz
 sha256  0bfa856a9930bddadbef95d1be1cf4e163c0be618e76ea3275caaf255283e274  COPYING
 sha256  2e14b6fa9a74f952ebfde3c96527158df281c953cfaf35609eb854d4da30131c  src/vasprintf.c
diff --git a/package/file/file.mk b/package/file/file.mk
index a33b306c4c..b70b3c521c 100644
--- a/package/file/file.mk
+++ b/package/file/file.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FILE_VERSION = 5.46
+FILE_VERSION = 5.47
 FILE_SITE = https://astron.com/pub/file
 FILE_LICENSE = BSD-2-Clause, BSD-3-Clause (vasprintf.c)
 FILE_LICENSE_FILES = COPYING src/vasprintf.c
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
