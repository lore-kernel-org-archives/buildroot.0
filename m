Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD081F436B8
	for <buildroot@archiver.kernel.org>; Fri, 17 Apr 2026 15:20:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2C4F880E44;
	Fri, 17 Apr 2026 15:20:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Bdto5WsPWLsx; Fri, 17 Apr 2026 15:20:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D4E2280D8F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776439213;
	bh=6oaTc3MbN2bP8ta4I+F0rGOcxVVdz8lQdic0zWJKfpM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=i4c7SV8o6uvHWFAbXOiYXJrlQM8Twi0CaQloEDThQKO5Be4UoLbt2FvloDEE0DxFU
	 sjyxQpo544Q1sNlsYBqYf+3aTvM98N29AsXY9hna6g4t+dee8oZgFZj12srYFQvr7I
	 DzIeLEJtI+6ath+JXnNNg5Ax/ryOGHnVNPOHj5630rBqtUUw3tGQN+DWQQWjhTEegr
	 ilf37LaELRlzyqjLveTGt5DG3nIt2kLK+BFR4jXmvsIlIC5xE1sKcLFiYwlAUklOMP
	 i6xH04owxuaGo1vJxIou5l8tgxF/GG0RD/9wEPFGE0cbyfITT6bm0vKZ0oWFecLqYM
	 zJHZIvBHRoz9A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D4E2280D8F;
	Fri, 17 Apr 2026 15:20:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4B2D7259
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 15:20:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2F3E84060A
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 15:20:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DFYmCusI-Chs for <buildroot@buildroot.org>;
 Fri, 17 Apr 2026 15:20:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2986C405F7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2986C405F7
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 15:20:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C1E41819B4; Fri, 17 Apr 2026 15:20:07 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 13 Apr 2026 13:48:05 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: c74ab224e3287768d0e1c59155f6ae11f1270e40
X-Git-Newrev: 8206e9ea7955ae45523c6c8d1979a1ee18f10aae
X-Patchwork-Hint: ignore
Message-Id: <20260417152007.C1E41819B4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libopenssl: bump
 version to 3.5.2
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/8206e9ea7955ae45523c6c8d1979a1ee18f10aae
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Bugfix release:

- Miscellaneous minor bug fixes.

- The FIPS provider now performs a PCT on key import for RSA, EC and ECX.
  This is mandated by FIPS 140-3 IG 10.3.A additional comment 1.

https://github.com/openssl/openssl/releases/tag/openssl-3.5.2

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 7e5a3c98452c6db8422b0fa6455390d138ad07df)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/libopenssl/libopenssl.hash | 4 ++--
 package/libopenssl/libopenssl.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libopenssl/libopenssl.hash b/package/libopenssl/libopenssl.hash
index 1675d72fb2..7f3795e1ac 100644
--- a/package/libopenssl/libopenssl.hash
+++ b/package/libopenssl/libopenssl.hash
@@ -1,5 +1,5 @@
-# From https://github.com/openssl/openssl/releases/download/openssl-3.5.1/openssl-3.5.1.tar.gz.sha256
-sha256  529043b15cffa5f36077a4d0af83f3de399807181d607441d734196d889b641f  openssl-3.5.1.tar.gz
+# From https://github.com/openssl/openssl/releases/download/openssl-3.5.2/openssl-3.5.2.tar.gz.sha256
+sha256  c53a47e5e441c930c3928cf7bf6fb00e5d129b630e0aa873b08258656e7345ec  openssl-3.5.2.tar.gz
 
 # License files
 sha256  7d5450cb2d142651b8afa315b5f238efc805dad827d91ba367d8516bc9d49e7a  LICENSE.txt
diff --git a/package/libopenssl/libopenssl.mk b/package/libopenssl/libopenssl.mk
index f3521b3cf3..38d04ea924 100644
--- a/package/libopenssl/libopenssl.mk
+++ b/package/libopenssl/libopenssl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBOPENSSL_VERSION = 3.5.1
+LIBOPENSSL_VERSION = 3.5.2
 LIBOPENSSL_SITE = https://github.com/openssl/openssl/releases/download/openssl-$(LIBOPENSSL_VERSION)
 LIBOPENSSL_SOURCE = openssl-$(LIBOPENSSL_VERSION).tar.gz
 LIBOPENSSL_LICENSE = Apache-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
