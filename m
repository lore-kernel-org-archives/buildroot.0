Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D6C7FDEE49
	for <buildroot@archiver.kernel.org>; Thu, 23 Apr 2026 20:28:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E620B411D6;
	Thu, 23 Apr 2026 20:28:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AAsqm_HNEzAn; Thu, 23 Apr 2026 20:28:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 11E2D411D7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776976124;
	bh=5yEJml0tgw1fvOx1p2gTagvxSwviLKNp2hpJb+ac8KA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=UgyWzPgdYVGykN49EKr3cXM9idt5u7SPVuKfkcay6iwpQxZnF9+fSB5Mya8TtFEUv
	 T87d0rVGCl8xff50YF+YanpC3+mBj8/K4AUhvqrOik78+v4uhHkFOoT1z2LyhWKAxS
	 VIIoM9MyqeS6LlUIlg8ihSYNRGZSxZ4FGuHqgAVgMaTD6v9nelXyh4G3CRVY5pJfU9
	 vopFTRTBg3TDwJiGYg9bEwxsyQpi+ADop/+ZqotBSvhjilee2xPxNgkTfp3p9Hulfv
	 pIqpEho85Ha0iUFc7isvDV5KIfI+XLF0Ri3eybpFJ2OASAP6WttIkXmecNzryOrZ6t
	 CojeLF6v9oESg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 11E2D411D7;
	Thu, 23 Apr 2026 20:28:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id BED1E231
 for <buildroot@buildroot.org>; Thu, 23 Apr 2026 20:28:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A5358411D7
 for <buildroot@buildroot.org>; Thu, 23 Apr 2026 20:28:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 71mpObTaPaKx for <buildroot@buildroot.org>;
 Thu, 23 Apr 2026 20:28:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 07505411D6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 07505411D6
 for <buildroot@buildroot.org>; Thu, 23 Apr 2026 20:28:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 96669828BA; Thu, 23 Apr 2026 20:28:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 23 Apr 2026 22:23:09 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1c039b6ea38ed964b4ca586358d32f6252e93622
X-Git-Newrev: 83ea6a9441a80f994201cdd13e356d4c27a79b7b
X-Patchwork-Hint: ignore
Message-Id: <20260423202841.96669828BA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cpp-httplib: bump version to 0.43.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/83ea6a9441a80f994201cdd13e356d4c27a79b7b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/yhirose/cpp-httplib/compare/v0.41.0...v0.43.1

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/cpp-httplib/cpp-httplib.hash | 2 +-
 package/cpp-httplib/cpp-httplib.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cpp-httplib/cpp-httplib.hash b/package/cpp-httplib/cpp-httplib.hash
index be9967f1e2..f3e05951e9 100644
--- a/package/cpp-httplib/cpp-httplib.hash
+++ b/package/cpp-httplib/cpp-httplib.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  6d38a6b74ea33ac3133b8352f2b55b557c1d42f36e1ed0c01f852e3218329d39  cpp-httplib-0.41.0.tar.gz
+sha256  000832a5b50b67b82a77845c09d832f6e492011cd0ef1d4f72f808eb6a4fbeb3  cpp-httplib-0.43.1.tar.gz
 sha256  4b45cbe16d7b71b89ae6127e26e0d90a029198ca5e958ad8e3d0b8bbed364d8b  LICENSE
diff --git a/package/cpp-httplib/cpp-httplib.mk b/package/cpp-httplib/cpp-httplib.mk
index c4a77b869d..e8bc0a56fe 100644
--- a/package/cpp-httplib/cpp-httplib.mk
+++ b/package/cpp-httplib/cpp-httplib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CPP_HTTPLIB_VERSION = 0.41.0
+CPP_HTTPLIB_VERSION = 0.43.1
 CPP_HTTPLIB_SITE = $(call github,yhirose,cpp-httplib,v$(CPP_HTTPLIB_VERSION))
 CPP_HTTPLIB_LICENSE = MIT
 CPP_HTTPLIB_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
