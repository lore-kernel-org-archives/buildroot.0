Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6C8BE732FD
	for <buildroot@archiver.kernel.org>; Thu, 28 Sep 2023 17:25:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5F4114192F;
	Thu, 28 Sep 2023 17:25:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5F4114192F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id czGesnmgEaBZ; Thu, 28 Sep 2023 17:25:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 661F941C01;
	Thu, 28 Sep 2023 17:25:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 661F941C01
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B13951BF255
 for <buildroot@lists.busybox.net>; Thu, 28 Sep 2023 17:25:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8CA5B61387
 for <buildroot@lists.busybox.net>; Thu, 28 Sep 2023 17:25:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8CA5B61387
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eSCIF0HkJ_87 for <buildroot@lists.busybox.net>;
 Thu, 28 Sep 2023 17:25:07 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A7A5D615AF
 for <buildroot@buildroot.org>; Thu, 28 Sep 2023 17:25:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A7A5D615AF
Received: from fli4l.lan.fli4l (p4fd6c587.dip0.t-ipconnect.de [79.214.197.135])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 89DEFA4C0C4D
 for <buildroot@buildroot.org>; Thu, 28 Sep 2023 19:25:03 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:49838)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qlul4-0006QL-39
 for buildroot@buildroot.org; Thu, 28 Sep 2023 19:25:03 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 28 Sep 2023 19:25:02 +0200
Message-Id: <20230928172502.62831-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1695921903;
 bh=J+9l9ZNkStkafSkJed7SHBJdUjMOiOGLGxDZEnRvgnE=;
 h=From:To:Subject:Date:From;
 b=ApAhZx9broL3x73n8S+x3w+zs1swScPKC2CtCuDHcGKN6Obe5rCL8JxBn4+auJ/Lr
 0iN5kohF8fT3pMOe1rz7GPiDJftSTC+vnepkdC6n5PM2plh/2oDec7c17eXIDEvMOp
 WI3R1Aj5RhikBnwDhDqbn88cfru5qpgoYdAnxWw6PEV5n9oGW1LUehEiv11AmL9gYG
 bp4gaddwJqwpEQSEnzQGfZlzdUGIh0t+zVWExGlmQcSd5Ujv8BijPSMB85N+2004dg
 48a3DSMk3yfwJ1LXME0mEchIIvtE81Qc4mrqbBzIfIRh0TwSQHPgRY+xnK14ac2ICF
 uprDpmSGXvQ8g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=ApAhZx9b
Subject: [Buildroot] [PATCH] package/sqlite: bump version to 3.43.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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

Release notes: https://sqlite.org/releaselog/3_43_1.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/sqlite/sqlite.hash | 2 +-
 package/sqlite/sqlite.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/sqlite/sqlite.hash b/package/sqlite/sqlite.hash
index 1a7f47edcd..ffeb1ff89c 100644
--- a/package/sqlite/sqlite.hash
+++ b/package/sqlite/sqlite.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  49008dbf3afc04d4edc8ecfc34e4ead196973034293c997adad2f63f01762ae1  sqlite-autoconf-3430000.tar.gz
+sha256  39116c94e76630f22d54cd82c3cea308565f1715f716d1b2527f1c9c969ba4d9  sqlite-autoconf-3430100.tar.gz
 sha256  66e056b6e8687f32af30d5187611b98b12a8f46f07aaf62f43585f276e8f0ac9  tea/license.terms
diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index 5e676d5387..f69097f3b7 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-SQLITE_VERSION = 3.43.0
-SQLITE_TAR_VERSION = 3430000
+SQLITE_VERSION = 3.43.1
+SQLITE_TAR_VERSION = 3430100
 SQLITE_SOURCE = sqlite-autoconf-$(SQLITE_TAR_VERSION).tar.gz
 SQLITE_SITE = https://www.sqlite.org/2023
 SQLITE_LICENSE = Public domain
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
