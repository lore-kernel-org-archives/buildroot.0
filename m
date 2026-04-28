Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8496CFF886D
	for <buildroot@archiver.kernel.org>; Tue, 28 Apr 2026 18:55:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5284240888;
	Tue, 28 Apr 2026 18:55:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gwdQ3GBfxwco; Tue, 28 Apr 2026 18:55:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8F4FD407B8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777402514;
	bh=Q7ZkI+tB4kWcWIsGEOa3R+vtRqaSaLCM3bI221xsZmY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=WMikYRn6fAd0pvLvr71qeZKSIyjBxQ3p0xp25+MBvoFYR9xb135weC8nLUvDTKy83
	 W+XsflEmxiJQpyIHVltZUmMc3RwKGE5VDBT3kmhUjndbUKgN0chReLH844ChezmcqN
	 CVOsDbz1xJJYKxjDihoPJsCX/wIBtu2RRe7I8REMFCq2j5/LM2NssBQJc8l+JcJCNT
	 YwQ4/U+4xW6H2zbqFd49elHXd83X9HzAw0u9RjBDtG7R52fycsjqAFIzfYWuufTAXD
	 yMAIql8xkgIDbWF6ucP8FbXOkttHzdgQKdh6TM6YS1Zewa6JuImxbeVANhgSccqNy+
	 8P2b9SSbyKGYQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8F4FD407B8;
	Tue, 28 Apr 2026 18:55:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7B28B1B8
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 18:55:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6CAC5407C5
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 18:55:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VudxkTC9MlXY for <buildroot@buildroot.org>;
 Tue, 28 Apr 2026 18:55:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8A01D402EF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8A01D402EF
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 18:55:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3F4748395B; Tue, 28 Apr 2026 18:55:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 28 Apr 2026 20:52:41 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 73ba4a7152b12bf07d4ae5f4191039afb73b6611
X-Git-Newrev: 8772eb193d83242a5f679fc74bff27b4586f6d3f
X-Patchwork-Hint: ignore
Message-Id: <20260428185512.3F4748395B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mpg123: bump version to 1.33.5
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/8772eb193d83242a5f679fc74bff27b4586f6d3f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://www.mpg123.org/cgi-bin/news.cgi

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/mpg123/mpg123.hash | 6 +++---
 package/mpg123/mpg123.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/mpg123/mpg123.hash b/package/mpg123/mpg123.hash
index eed62fa538..8ab8040396 100644
--- a/package/mpg123/mpg123.hash
+++ b/package/mpg123/mpg123.hash
@@ -1,6 +1,6 @@
-# From https://sourceforge.net/projects/mpg123/files/mpg123/1.33.4/
-sha1  30cf7f77bd1704448db89af6a6d75904572c4dcb  mpg123-1.33.4.tar.bz2
+# From https://sourceforge.net/projects/mpg123/files/mpg123/1.33.5/
+sha1  f3538d36c360bc34a83f2fcd69ddb67ee04d332f  mpg123-1.33.5.tar.bz2
 # Locally calculated
-sha256  3ae8c9ff80a97bfc0e22e89fbcd74687eca4fc1db315b12607f27f01cb5a47d9  mpg123-1.33.4.tar.bz2
+sha256  0d7ebc8da0aff3ca383c8c6b5a6adbe402ee5bb256685b8c5499f3a739f9d6dd  mpg123-1.33.5.tar.bz2
 # License file
 sha256  c22482728a634a8dfdb4ff72a96d4c1ed64cd8f3e79335c401751ac591609366  COPYING
diff --git a/package/mpg123/mpg123.mk b/package/mpg123/mpg123.mk
index 23e061614d..0b8f0e1a83 100644
--- a/package/mpg123/mpg123.mk
+++ b/package/mpg123/mpg123.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MPG123_VERSION = 1.33.4
+MPG123_VERSION = 1.33.5
 MPG123_SOURCE = mpg123-$(MPG123_VERSION).tar.bz2
 MPG123_SITE = https://downloads.sourceforge.net/project/mpg123/mpg123/$(MPG123_VERSION)
 MPG123_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
