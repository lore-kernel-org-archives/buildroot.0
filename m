Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C83FBC5CFDB
	for <buildroot@archiver.kernel.org>; Sat, 15 Aug 2026 16:08:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6F79C80F18;
	Sat, 15 Aug 2026 16:08:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lR1m_wCQdkRk; Sat, 15 Aug 2026 16:08:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 832AB80E1D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786810103;
	bh=9CIWBTlRAqOq5segSCeKdGW/w35tVY3aLjAqiEiCoMM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=pn7XKvTdz029qwkgB+XErZr1gZqEwn+5EgftXSPEI8/jzjePEFa2QdrpOWtpa+U7g
	 HsyqWRo9ZhE+pt4DL57GErhsKCZSJlDgePygZj+GD9I+StXS5KHIQY0U1SykuHX+lJ
	 5Mn6oWKqmZRe3eMk/BpuqZKAOhrKA9g1TaXZDv30LF+QeFZP0RU4JQQzzvde/yd1d+
	 CecLtvxoKPJrw3sOZz4Yy2SImgNudER+3w0A8N99zD2HaR9N7So12VUE9wukE1iGNp
	 +z7uKQhK2MhXEZvaudJaqe5JKRscqkFtMmZWAIo14FWD+FCe6YgBOXQopOp/QcbN5A
	 kUQcqHMRb/r4g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 832AB80E1D;
	Sat, 15 Aug 2026 16:08:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 34D86109
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 16:08:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1B5CB80E1D
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 16:08:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZkrjVtfYrxtt for <buildroot@buildroot.org>;
 Sat, 15 Aug 2026 16:08:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2A1D180E14
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2A1D180E14
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 16:08:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8A8358D752; Sat, 15 Aug 2026 16:07:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 15 Aug 2026 18:05:01 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4db5d10c0d8a7d54da487036592b76c2bcd600ff
X-Git-Newrev: ec31fb67f5174c195f3c29b1f340c27dbfb42d1a
X-Patchwork-Hint: ignore
Message-Id: <20260815160730.8A8358D752@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libaacs: bump version to 0.12.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ec31fb67f5174c195f3c29b1f340c27dbfb42d1a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Changelog:
https://code.videolan.org/videolan/libaacs/-/blob/0.12.0/ChangeLog

Switched URLs to https and source tarball to xz.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libaacs/Config.in    | 2 +-
 package/libaacs/libaacs.hash | 4 ++--
 package/libaacs/libaacs.mk   | 6 +++---
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/libaacs/Config.in b/package/libaacs/Config.in
index d59b6da64b..de36290534 100644
--- a/package/libaacs/Config.in
+++ b/package/libaacs/Config.in
@@ -9,7 +9,7 @@ config BR2_PACKAGE_LIBAACS
 	  NB: this project doesn't offer any key or certificate that
 	  could be used to decode encrypted copyrighted material.
 
-	  http://www.videolan.org/developers/libaacs.html
+	  https://www.videolan.org/developers/libaacs.html
 
 comment "libaacs needs a toolchain w/ dynamic library"
 	depends on BR2_STATIC_LIBS
diff --git a/package/libaacs/libaacs.hash b/package/libaacs/libaacs.hash
index d4977727b0..395bc3631c 100644
--- a/package/libaacs/libaacs.hash
+++ b/package/libaacs/libaacs.hash
@@ -1,5 +1,5 @@
-# From http://download.videolan.org/pub/videolan/libaacs/0.11.1/libaacs-0.11.1.tar.bz2.sha512
-sha512  42dcba5fd593c9a8ec7af11251006b083ad2c49ec198734d1d66f67c2ded4557d77617600edbf0c5250e9b0407ef9a2f906d59d154bda8ecfc8adfd234fb2c42  libaacs-0.11.1.tar.bz2
+# From https://download.videolan.org/pub/videolan/libaacs/0.12.0/libaacs-0.12.0.tar.xz.sha512
+sha512  5848e68a1d8e6125af1a02b878ccaa05128ae752722ff245d79918d5b3a0589b486e87fe3b3af9cfda18b04742003e197727aa211cf8c03a505c1336d3a689d2  libaacs-0.12.0.tar.xz
 
 # Hash for license file:
 sha256  592987e8510228d546540b84a22444bde98e48d03078d3b2eefcd889bec5ce8c  COPYING
diff --git a/package/libaacs/libaacs.mk b/package/libaacs/libaacs.mk
index d4e90be26c..c10972dc3d 100644
--- a/package/libaacs/libaacs.mk
+++ b/package/libaacs/libaacs.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-LIBAACS_VERSION = 0.11.1
-LIBAACS_SITE = http://download.videolan.org/pub/videolan/libaacs/$(LIBAACS_VERSION)
-LIBAACS_SOURCE = libaacs-$(LIBAACS_VERSION).tar.bz2
+LIBAACS_VERSION = 0.12.0
+LIBAACS_SITE = https://download.videolan.org/pub/videolan/libaacs/$(LIBAACS_VERSION)
+LIBAACS_SOURCE = libaacs-$(LIBAACS_VERSION).tar.xz
 LIBAACS_LICENSE = LGPL-2.1+
 LIBAACS_LICENSE_FILES = COPYING
 LIBAACS_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
