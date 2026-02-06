Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0780AEE20B9
	for <buildroot@archiver.kernel.org>; Fri,  6 Feb 2026 17:22:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A8250418EE;
	Fri,  6 Feb 2026 17:22:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6ABDN_ki4uRR; Fri,  6 Feb 2026 17:22:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8EFE5419C7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770398539;
	bh=0gUsp8eObuU17cptNnwx0WCVOUUxBymaDNEn5pUqKbQ=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=h69CA8aF3wLNBA6J9Mg629pZvpJYaFt02g0rVvsi0nC4ju2a4DlapI82+KO1UdXkR
	 NVcdniqjX0f0jG2BRDAQC6WoSk4i76wK6omqZa8eVu0HNKkxdny47TsLxiDfljrSI9
	 iI6mk58n4YOCuSKPKjbY5sCswq+4wnYxLVmkUy6J3JLGJSHjQBff5oIrvKzBj0nUgD
	 dD7/11lxQE/izCNhvMRmJmiROUV9tFtKwbyg+AoOqjrLuOdc5J2tTEObNc64W8dyPL
	 xHt9lheNmMMHCMOF0hSBY4Ls1a3fNQkBWjtGQv5VpO8GyJPyubhlIW8IyJFLihjnDd
	 H55OQAUJXG6zQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8EFE5419C7;
	Fri,  6 Feb 2026 17:22:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 496E9173
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 17:22:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2BC0661116
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 17:22:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jimme5klTyLq for <buildroot@buildroot.org>;
 Fri,  6 Feb 2026 17:22:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4FBCB6110F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4FBCB6110F
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 17:22:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3356086A83; Fri,  6 Feb 2026 17:22:17 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 6 Feb 2026 18:19:29 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 63f2d211381344127b03f39eff535de5b3042a7f
X-Git-Newrev: febdbea58be3b5c25b1673d8457fa933b9cb812a
X-Patchwork-Hint: ignore
Message-Id: <20260206172217.3356086A83@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libzip: bump version to 1.11.4
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/febdbea58be3b5c25b1673d8457fa933b9cb812a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://libzip.org/news/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libzip/libzip.hash | 2 +-
 package/libzip/libzip.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libzip/libzip.hash b/package/libzip/libzip.hash
index 93dcb49042..9deeb7237c 100644
--- a/package/libzip/libzip.hash
+++ b/package/libzip/libzip.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  dc3c8d5b4c8bbd09626864f6bcf93de701540f761d76b85d7c7d710f4bd90318  libzip-1.10.1.tar.xz
+sha256  8a247f57d1e3e6f6d11413b12a6f28a9d388de110adc0ec608d893180ed7097b  libzip-1.11.4.tar.xz
 sha256  01c022eca6d566e2e8792fd0f091a28653b2a608319922bcd4de91c49d1438e1  LICENSE
diff --git a/package/libzip/libzip.mk b/package/libzip/libzip.mk
index cf85bfa8ce..6753c45c14 100644
--- a/package/libzip/libzip.mk
+++ b/package/libzip/libzip.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBZIP_VERSION = 1.10.1
+LIBZIP_VERSION = 1.11.4
 LIBZIP_SITE = https://libzip.org/download
 LIBZIP_SOURCE = libzip-$(LIBZIP_VERSION).tar.xz
 LIBZIP_LICENSE = BSD-3-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
