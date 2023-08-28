Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3689FC83F11
	for <buildroot@archiver.kernel.org>; Mon, 28 Aug 2023 16:30:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A2F40409E2;
	Mon, 28 Aug 2023 16:30:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A2F40409E2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LhiFDH6m7ABy; Mon, 28 Aug 2023 16:30:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 744ED408B6;
	Mon, 28 Aug 2023 16:30:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 744ED408B6
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 400CD1BF276
 for <buildroot@lists.busybox.net>; Mon, 28 Aug 2023 16:30:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1849D818CD
 for <buildroot@lists.busybox.net>; Mon, 28 Aug 2023 16:30:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1849D818CD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id L9GaHrFq5nKR for <buildroot@lists.busybox.net>;
 Mon, 28 Aug 2023 16:30:06 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F2B31817A9
 for <buildroot@buildroot.org>; Mon, 28 Aug 2023 16:30:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F2B31817A9
Received: from fli4l.lan.fli4l (p54a1bab3.dip0.t-ipconnect.de [84.161.186.179])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id C83A2A4C0173
 for <buildroot@buildroot.org>; Mon, 28 Aug 2023 18:30:03 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:54576)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qaf7r-0000Zn-1o
 for buildroot@buildroot.org; Mon, 28 Aug 2023 18:30:03 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 28 Aug 2023 18:30:03 +0200
Message-Id: <20230828163003.818942-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1693240203;
 bh=IIZqjLPUDxwdvr5VB40eKTavWiNqoT/kJNfwdgh4hBc=;
 h=From:To:Subject:Date:From;
 b=TNXyNvSJMh/zyVCdFlyqJ7txYI7NBlY+FdU3FKqVMdNgL2R4dbPFiKu4Q9PVn4r+J
 7Li1NqcSqW8mX3FcUlRo4AAcb8msfdqsKuOCT+qIK42Or4kuPh7P7i5+G5ce8DIJLz
 OghVejTywedGiMEtFMLkAc/mi1sNaM7IRTX1ZcSzzDnK7633jmbZ07mW911R8y1xA+
 njiKwAWloFFOjvPJf3Bwl3ILWwq2IgL4uAmWz7FNQKkznKPfrA9d7ZQ/xfQjdjdaew
 rcUqcPNwZBh0I0daSip3amSjHNe26uWWa8HIYUxeIHCkk/qyPEMzfeke9gZHZWevMi
 Zs7xidyUphwbA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=TNXyNvSJ
Subject: [Buildroot] [PATCH/next 1/1] package/sqlite: bump version to 3.43.0
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

Release notes: https://sqlite.org/releaselog/3_43_0.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/sqlite/sqlite.hash | 2 +-
 package/sqlite/sqlite.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/sqlite/sqlite.hash b/package/sqlite/sqlite.hash
index 39758f2b43..1a7f47edcd 100644
--- a/package/sqlite/sqlite.hash
+++ b/package/sqlite/sqlite.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  7abcfd161c6e2742ca5c6c0895d1f853c940f203304a0b49da4e1eca5d088ca6  sqlite-autoconf-3420000.tar.gz
+sha256  49008dbf3afc04d4edc8ecfc34e4ead196973034293c997adad2f63f01762ae1  sqlite-autoconf-3430000.tar.gz
 sha256  66e056b6e8687f32af30d5187611b98b12a8f46f07aaf62f43585f276e8f0ac9  tea/license.terms
diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index 1576d6a3e1..5e676d5387 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-SQLITE_VERSION = 3.42.0
-SQLITE_TAR_VERSION = 3420000
+SQLITE_VERSION = 3.43.0
+SQLITE_TAR_VERSION = 3430000
 SQLITE_SOURCE = sqlite-autoconf-$(SQLITE_TAR_VERSION).tar.gz
 SQLITE_SITE = https://www.sqlite.org/2023
 SQLITE_LICENSE = Public domain
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
