Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDD0AD2502D
	for <buildroot@archiver.kernel.org>; Sun, 11 Jan 2026 17:26:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7757A81286;
	Sun, 11 Jan 2026 17:26:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 22TXM_tQc2ng; Sun, 11 Jan 2026 17:26:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 00C4F8115F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768152412;
	bh=B/875fh9DNUOZjt3NdA569kiI5TFlrx+vLizhr0eiro=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Hz4LgqsUKqKxWL5mkPM6SO0LkBLcJR9r6SktNVJbKCIE/C1PUOwmPhdBTcTkoWns5
	 bzoLNL1G+xvGMtAuj5J+L+zNJWpkg/kofqxhrYY8iqC8ueS9/DLC0oOD8onmJ6Ztev
	 sz5FOv62NU0jrA0OHKp2tUliv0VtQE8qD34wwDlD5Tp9vERCMy2WCjKurFOHB0HJt0
	 Ub0RK765XtjjbkQOlzcz1wOk0Qhor3Ru/D3osrLSS93rQR3Pxbt00yfFCE6UfGJSOY
	 OwVRbsDWBx57GGrIIuAjnEtwlZ4YAFruSaPEOJ5kb919JXQdwjljXjUnrC4+FbVKI2
	 Mh+zyzGSSxHeg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 00C4F8115F;
	Sun, 11 Jan 2026 17:26:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id A329118D
 for <buildroot@buildroot.org>; Sun, 11 Jan 2026 17:26:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 93D54403F4
 for <buildroot@buildroot.org>; Sun, 11 Jan 2026 17:26:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sMftAJPzpqLo for <buildroot@buildroot.org>;
 Sun, 11 Jan 2026 17:26:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DC64E4022A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id DC64E4022A
 for <buildroot@buildroot.org>; Sun, 11 Jan 2026 17:26:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CA5FC884A1; Sun, 11 Jan 2026 17:26:49 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 11 Jan 2026 18:15:15 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d3ebc63ce7a7f69a45bb9dc810ecdc27add02c15
X-Git-Newrev: b26ba37f1c47aa83039f18dbcad1164de9a805cd
X-Patchwork-Hint: ignore
Message-Id: <20260111172649.CA5FC884A1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sqlite: bump version to 3.51.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=b26ba37f1c47aa83039f18dbcad1164de9a805cd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://sqlite.org/releaselog/3_51_2.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sqlite/sqlite.hash | 2 +-
 package/sqlite/sqlite.mk   | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/sqlite/sqlite.hash b/package/sqlite/sqlite.hash
index 19d5584625..055e935a4e 100644
--- a/package/sqlite/sqlite.hash
+++ b/package/sqlite/sqlite.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  4f2445cd70479724d32ad015ec7fd37fbb6f6130013bd4bfbc80c32beb42b7e0  sqlite-autoconf-3510100.tar.gz
+sha256  fbd89f866b1403bb66a143065440089dd76100f2238314d92274a082d4f2b7bb  sqlite-autoconf-3510200.tar.gz
 sha256  66e056b6e8687f32af30d5187611b98b12a8f46f07aaf62f43585f276e8f0ac9  tea/license.terms
diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index ca8071c78e..795bc32dbf 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-SQLITE_VERSION = 3.51.1
-SQLITE_TAR_VERSION = 3510100
+SQLITE_VERSION = 3.51.2
+SQLITE_TAR_VERSION = 3510200
 SQLITE_SOURCE = sqlite-autoconf-$(SQLITE_TAR_VERSION).tar.gz
-SQLITE_SITE = https://www.sqlite.org/2025
+SQLITE_SITE = https://www.sqlite.org/2026
 SQLITE_LICENSE = blessing
 SQLITE_LICENSE_FILES = tea/license.terms
 SQLITE_CPE_ID_VENDOR = sqlite
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
