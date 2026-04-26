Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C40E7FF8860
	for <buildroot@archiver.kernel.org>; Sun, 26 Apr 2026 19:14:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5969284E1B;
	Sun, 26 Apr 2026 19:14:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aFcGcX5UUADb; Sun, 26 Apr 2026 19:13:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2123484E1C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777230839;
	bh=l2Hn2UXdc3h0E8S7tS2FbTWXkb2BQ2yJEo5wY+43JY4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=lDgdCGuvvgHbaK+ljjerW9gAPhDqXfu5hBipJgeylIF1TfTPIIHQ7GuDAJmNgUgoX
	 0o5MmKd85s/OAKHDfN7Dy0g+CMIQTuTVS1MvYxoGx7C3xxNrzZkCwPqDgf0rWgdDDg
	 YQFKSEmVMCCOfUFHvns+kTJvYq/aCqLAe93M0v8JixN3mlsgG2eMaoxVQ6gj8LE50v
	 w3ujiP9hk7u9osuoJQbcIRI547qPFuhJ+Bk+jmMf/l3N92yCJGT2MJb9ZEvO4bB9Se
	 UUVHPHuaFaSLmO4dcfGTKvX5/p4Ejt1F6t45mhcScQDXdpTm6uGIT9K8LGcxZ4u50A
	 MD6tWM2kygVHQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2123484E1C;
	Sun, 26 Apr 2026 19:13:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9D46B369
 for <buildroot@buildroot.org>; Sun, 26 Apr 2026 19:13:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 822BB61C92
 for <buildroot@buildroot.org>; Sun, 26 Apr 2026 19:13:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qI7wkV7QBkNJ for <buildroot@buildroot.org>;
 Sun, 26 Apr 2026 19:13:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8340060830
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8340060830
 for <buildroot@buildroot.org>; Sun, 26 Apr 2026 19:13:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 420DB836EA; Sun, 26 Apr 2026 19:13:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 26 Apr 2026 20:58:50 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d96eb2f7daf51d96602b1076ed8399e3781569e8
X-Git-Newrev: 77aeabb8b5af7ab9012a94c3aa0db1da7c58ee4c
X-Patchwork-Hint: ignore
Message-Id: <20260426191354.420DB836EA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gnupg2: bump version to 2.5.19
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/77aeabb8b5af7ab9012a94c3aa0db1da7c58ee4c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://lists.gnupg.org/pipermail/gnupg-announce/2026q2/000504.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/gnupg2/gnupg2.hash | 4 ++--
 package/gnupg2/gnupg2.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gnupg2/gnupg2.hash b/package/gnupg2/gnupg2.hash
index d607e9bb86..2aab6111b4 100644
--- a/package/gnupg2/gnupg2.hash
+++ b/package/gnupg2/gnupg2.hash
@@ -1,5 +1,5 @@
 # From https://www.gnupg.org/download/integrity_check.html
-sha1  91c523b172763621c69c0a213bc01b67b37d2298  gnupg-2.5.18.tar.bz2
-sha256  0dbd64e0322fe1a4813360d46539d5f8daf4a8fa235cf5fce464e8b0214a7e4f  gnupg-2.5.18.tar.bz2
+sha1  dbe9ce2aca9d553ed4367692575cee15204a95a6  gnupg-2.5.19.tar.bz2
+sha256  722aa8a426dd9b44e0d194b73bfee3a3e617d65674cd4d1d062e6df29f1788c6  gnupg-2.5.19.tar.bz2
 # Locally calculated
 sha256  bc2d6664f6276fa0a72d57633b3ae68dc7dcb677b71018bf08c8e93e509f1357  COPYING
diff --git a/package/gnupg2/gnupg2.mk b/package/gnupg2/gnupg2.mk
index 1f7ff43e07..499532c551 100644
--- a/package/gnupg2/gnupg2.mk
+++ b/package/gnupg2/gnupg2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GNUPG2_VERSION = 2.5.18
+GNUPG2_VERSION = 2.5.19
 GNUPG2_SOURCE = gnupg-$(GNUPG2_VERSION).tar.bz2
 GNUPG2_SITE = https://gnupg.org/ftp/gcrypt/gnupg
 GNUPG2_LICENSE = GPL-3.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
