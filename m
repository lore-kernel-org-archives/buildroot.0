Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4725FF8867
	for <buildroot@archiver.kernel.org>; Mon, 27 Apr 2026 20:31:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3B3A060766;
	Mon, 27 Apr 2026 20:31:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Szk70jHROg61; Mon, 27 Apr 2026 20:31:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 00B4C60745
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777321913;
	bh=FdqrY4odSZkHFdnRhzXgQiDJGm31BSyCajz+voQEEeM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=O4ApaasYKXt+ynGse+xmaQj0GtnKUNe2bI8eqaKWKwyZO1suzdfn6DbZk/1kekYhT
	 xCp9XDIZU1x2xNemva6fS2uQ/XydNbAMNIy1MdWhBVs7ScgkfezDFKoujZQ07rMDZw
	 fo9Lv9fBgZMwIFogPZaELHs85j0EW+HDL7ev28lUj/eArxWxLGd4FQsbE4nE3cY3wd
	 39ZDTpLRtfPIit+gbEfkH9E4pDhIXVa62VQHpX4ZwpWimsYjAkMDWLoxwCg4KwSRLA
	 ZvmLA3sVx+YVl+QarPkLKg3jC5FEH75RHsaXHDKa2riGLKX51c3NuSNTWNSCBs0Dzx
	 9EZAZ9tJxNUOA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 00B4C60745;
	Mon, 27 Apr 2026 20:31:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6E50D1B8
 for <buildroot@buildroot.org>; Mon, 27 Apr 2026 20:31:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 544D7812DA
 for <buildroot@buildroot.org>; Mon, 27 Apr 2026 20:31:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QYGirrRnvhB8 for <buildroot@buildroot.org>;
 Mon, 27 Apr 2026 20:31:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 758DF8133C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 758DF8133C
 for <buildroot@buildroot.org>; Mon, 27 Apr 2026 20:31:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2E0D4836FA; Mon, 27 Apr 2026 20:31:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 27 Apr 2026 22:27:38 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c409050184c743ebcf65640cc8eb5c56cc9f570e
X-Git-Newrev: a8e7f79241999245710963f42a4bcb4524ebeff7
X-Patchwork-Hint: ignore
Message-Id: <20260427203151.2E0D4836FA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/liburiparser: security bump to
 version 1.0.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a8e7f79241999245710963f42a4bcb4524ebeff7
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Fixes the following vulnerability:

CVE-2026-42371: integer overflow in text range comparison
https://github.com/uriparser/uriparser/pull/298

For details, see the announcement:
https://www.openwall.com/lists/oss-security/2026/04/27/2

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/liburiparser/liburiparser.hash | 4 ++--
 package/liburiparser/liburiparser.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/liburiparser/liburiparser.hash b/package/liburiparser/liburiparser.hash
index f8d7124b7f..c18df8eb98 100644
--- a/package/liburiparser/liburiparser.hash
+++ b/package/liburiparser/liburiparser.hash
@@ -1,4 +1,4 @@
-# From https://github.com/uriparser/uriparser/releases/tag/uriparser-1.0.0
-sha256  154a3f649d80a78d5095fc461ec032ffb45f5ed3619edec923ac68cff29a088d  uriparser-1.0.0.tar.xz
+# From https://github.com/uriparser/uriparser/releases/tag/uriparser-1.0.1
+sha256  acd18cfb14d1851705f863f7a625be693fb3971fb85d4996faa21147f0315fcb  uriparser-1.0.1.tar.xz
 # Locally calculated
 sha256  287f09e6546a9610f949f89e8fb937cacfeabd7bfaa8c8a0c18312193bf04ad3  COPYING.BSD-3-Clause
diff --git a/package/liburiparser/liburiparser.mk b/package/liburiparser/liburiparser.mk
index 731739e582..d8dcc22063 100644
--- a/package/liburiparser/liburiparser.mk
+++ b/package/liburiparser/liburiparser.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBURIPARSER_VERSION = 1.0.0
+LIBURIPARSER_VERSION = 1.0.1
 LIBURIPARSER_SOURCE = uriparser-$(LIBURIPARSER_VERSION).tar.xz
 LIBURIPARSER_SITE = https://github.com/uriparser/uriparser/releases/download/uriparser-$(LIBURIPARSER_VERSION)
 LIBURIPARSER_LICENSE = BSD-3-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
