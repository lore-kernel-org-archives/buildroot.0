Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D087CD6E4C
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 08:28:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5ABAA83D3A;
	Fri, 29 May 2026 08:28:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pyLxhoyxakkr; Fri, 29 May 2026 08:28:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7401F83D3C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780043285;
	bh=tqk6znEWnc1O5NJrbYv4y1W7GxiAT85a7iVBvQQdWOQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=C4wKjjZTNc4WzFMBDmoNPFVuKpAbmyQfGejBMDYp4YbOsJSZs1wUZyBN9SJSIa/EJ
	 8tutUF8kRFnxLHN9pC2hGCk3llUsbkIv7HfMJ2dxzOvcyKr4gb5zZ7d2xZWcx0F9ay
	 C6yaqH52ebedb1ln/TZ4k9wtLJM3C3wquaH068mf3/tKwDgpAkVe4BEsmx/HuWgQSV
	 vHJDcgjs9NuATJhLW9N8RAswnRrPIz/nul/On6y795CC7SpJ2TMgvWPwhrIAUwYMP2
	 30EqoVZErpvEVvyeRGQRagYHHnCBAWWbT4VYhQez3eYQTqHVJ8FFPaqU7TzyVnAixY
	 lu14b80bwcEdw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7401F83D3C;
	Fri, 29 May 2026 08:28:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 59C13288
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:28:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D60C441F69
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:28:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bNhXbNnBl_2J for <buildroot@buildroot.org>;
 Fri, 29 May 2026 08:28:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1BABF41F9D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1BABF41F9D
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:28:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9F6FE873A7; Fri, 29 May 2026 08:27:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 29 May 2026 10:25:47 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: 509daa69c08cd13d2de3ca9d4c4eebf198f178ee
X-Git-Newrev: 9efcaa28af0221d30eefac02692784ac663d6f9b
X-Patchwork-Hint: ignore
Message-Id: <20260529082747.9F6FE873A7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/libgpg-error:
 bump version to 1.60
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/9efcaa28af0221d30eefac02692784ac663d6f9b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

https://dev.gnupg.org/T8112

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit c41092cc9851b689f803114e88ee5d0f1c39af58)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/libgpg-error/libgpg-error.hash | 4 ++--
 package/libgpg-error/libgpg-error.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libgpg-error/libgpg-error.hash b/package/libgpg-error/libgpg-error.hash
index ede1a2113e..1e52e78d22 100644
--- a/package/libgpg-error/libgpg-error.hash
+++ b/package/libgpg-error/libgpg-error.hash
@@ -1,6 +1,6 @@
 # From https://www.gnupg.org/download/integrity_check.html
-sha1  a9876a9e4cb54298960bd4202baf891642060428  libgpg-error-1.58.tar.bz2
-sha256  f943aea9a830a8bd938e5124b579efaece24a3225ff4c3d27611a80ce1260c27  libgpg-error-1.58.tar.bz2
+sha1  851a1619aee8f7723ed50f09cb6a186c483c280c  libgpg-error-1.60.tar.bz2
+sha256  11b2a738e212f3eab0fe8637bc341d3181ca964e97bb2654de91aab7dae4ce09  libgpg-error-1.60.tar.bz2
 
 # Locally calculated
 sha256  231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
diff --git a/package/libgpg-error/libgpg-error.mk b/package/libgpg-error/libgpg-error.mk
index 5207d926df..808339b935 100644
--- a/package/libgpg-error/libgpg-error.mk
+++ b/package/libgpg-error/libgpg-error.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGPG_ERROR_VERSION = 1.58
+LIBGPG_ERROR_VERSION = 1.60
 LIBGPG_ERROR_SITE = https://www.gnupg.org/ftp/gcrypt/libgpg-error
 LIBGPG_ERROR_SOURCE = libgpg-error-$(LIBGPG_ERROR_VERSION).tar.bz2
 LIBGPG_ERROR_LICENSE = GPL-2.0+, LGPL-2.1+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
