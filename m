Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D31BFF9D0EB
	for <buildroot@archiver.kernel.org>; Tue, 14 Apr 2026 17:52:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A5459806B0;
	Tue, 14 Apr 2026 17:52:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3aAkknH7b4XS; Tue, 14 Apr 2026 17:52:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C310684DB6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776189172;
	bh=rw6iIYQ96HnDLw1gZP/Z9MKEsD73+UHR4lcaQH+WL8Q=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=S3t39kt8sKoYGFs826mq77OBaMqlPCidJaYmpx0HTBAwpDfnQXtRSWGLVj+I1IyLI
	 P3MIGlY4DoHpikSWZnAqIIf2JoBG8SIMiO0cxsf3iPaljepbTsq3+tPuBCp7osH0md
	 cuJrgId0XNykEriQUTv8YHzQYxWiioBPcs7O2xxmxl53BmVRN4ynz+EcEgKaKrIDI6
	 5ec1sN3WJ9TCI69K5XLoUQD5Nyhpd3pfSL4x8WBgQYL8tJyxJptE9rbYCFbpXuhrTz
	 9ZZhjheiy2r5j0ioNPceHvIm3tI8C2+klvughPl3kR5KXhmAfWMDbAHXr4PGdGXDmI
	 cNsiWFldqwm7Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C310684DB6;
	Tue, 14 Apr 2026 17:52:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 55959375
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 17:52:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 46EA584DB6
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 17:52:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 93kZGDDDr0Dm for <buildroot@buildroot.org>;
 Tue, 14 Apr 2026 17:52:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 63C1084DB3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 63C1084DB3
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 17:52:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id ED2477FD48; Tue, 14 Apr 2026 17:52:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 14 Apr 2026 19:52:03 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4ea6da577326a337e9c643cda40c901ca514868d
X-Git-Newrev: 7cf7140b4832d1281fd352893d3f7cfc92e8eef3
X-Patchwork-Hint: ignore
Message-Id: <20260414175249.ED2477FD48@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sqlite: bump version to 3.53.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/7cf7140b4832d1281fd352893d3f7cfc92e8eef3
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://sqlite.org/releaselog/3_53_0.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/sqlite/sqlite.hash | 2 +-
 package/sqlite/sqlite.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/sqlite/sqlite.hash b/package/sqlite/sqlite.hash
index 7c5068c7aa..49d0012ded 100644
--- a/package/sqlite/sqlite.hash
+++ b/package/sqlite/sqlite.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  81f5be397049b0cae1b167f2225af7646fc0f82e4a9b3c48c9ea3a533e21d77a  sqlite-autoconf-3510300.tar.gz
+sha256  851e9b38192fe2ceaa65e0baa665e7fa06230c3d9bd1a6a9662d02380d73365a  sqlite-autoconf-3530000.tar.gz
 sha256  66e056b6e8687f32af30d5187611b98b12a8f46f07aaf62f43585f276e8f0ac9  tea/license.terms
diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index e9fb874399..721af0d840 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-SQLITE_VERSION = 3.51.3
-SQLITE_TAR_VERSION = 3510300
+SQLITE_VERSION = 3.53.0
+SQLITE_TAR_VERSION = 3530000
 SQLITE_SOURCE = sqlite-autoconf-$(SQLITE_TAR_VERSION).tar.gz
 SQLITE_SITE = https://www.sqlite.org/2026
 SQLITE_LICENSE = blessing
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
