Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33595CD98F9
	for <buildroot@archiver.kernel.org>; Thu, 18 Jun 2026 20:50:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7C9C16163E;
	Thu, 18 Jun 2026 20:50:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v5RqWAzLF_g0; Thu, 18 Jun 2026 20:49:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DE7526163A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781815799;
	bh=K3zVXpslYUDTugWdYsaAP2B9ZfiLsOge2kqV4VjOS9s=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=kGg9j3lHCOg4rRxIkTN7EQeMrE3pg42JXX8CDg8/v+TO57fOQbcKhxd1AHCLcOmgm
	 sOqQhgawf8ZRj2LDmCv278m1DXZAyf6PfqoVfINwvnXsGeK9gn05+MQfU2je0Zuium
	 ZlEeDB/E4FU3O5TG9QVpTnlhhrA5wDwCWj8vYcrM2hRt9zXzE5Vn9n/Y8tr3lUkkYX
	 /6jXvCT5QhsioFElH0YVOPV4giFdEgnlWUt3OHIpeq5yQOz14ZkYyQVi0I6zP1ODMN
	 OE9Sj/TiSIg5HWkGD8dpMLqsyILZcplMNU+jdDOST1uqtYi1VfwsRy+LBEg1AHx6gw
	 /ndFkFBnc7srw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DE7526163A;
	Thu, 18 Jun 2026 20:49:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 22BAC367
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 20:49:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1543B83AA0
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 20:49:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Yqu4JJcw_oH4 for <buildroot@buildroot.org>;
 Thu, 18 Jun 2026 20:49:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2D14283AA1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2D14283AA1
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 20:49:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E6FC2814A8; Thu, 18 Jun 2026 20:49:33 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 18 Jun 2026 21:46:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 09a13526b8197767a08d56d8517aae1cd783177e
X-Git-Newrev: c9bbc8c0aca19fc1a699dd3313cd7ce9ef1512b9
X-Patchwork-Hint: ignore
Message-Id: <20260618204933.E6FC2814A8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/squid: security bump version to 7.6
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c9bbc8c0aca19fc1a699dd3313cd7ce9ef1512b9
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/squid-cache/squid/blob/SQUID_7_6/ChangeLog
https://seclists.org/oss-sec/2026/q2/896

Fixes CVE-2026-47729 and CVE-2026-50012.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/squid/squid.hash | 4 ++--
 package/squid/squid.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/squid/squid.hash b/package/squid/squid.hash
index 508b5517c5..fe362e9a2e 100644
--- a/package/squid/squid.hash
+++ b/package/squid/squid.hash
@@ -1,4 +1,4 @@
-# From https://github.com/squid-cache/squid/releases/tag/SQUID_7_5
-sha256  f6058907db0150d2f5d228482b5a9e5678920cf368ae0ccbcecceb2ff4c35106  squid-7.5.tar.xz
+# From https://github.com/squid-cache/squid/releases/tag/SQUID_7_6
+sha256  852178fdc37c5b0786a934fc990c7d2fffc82acf19b2284be209b96431d25992  squid-7.6.tar.xz
 # Locally calculated
 sha256  edaef632cbb643e4e7a221717a6c441a4c1a7c918e6e4d56debc3d8739b233f6  COPYING
diff --git a/package/squid/squid.mk b/package/squid/squid.mk
index 6d403c6c2e..627fef0b9e 100644
--- a/package/squid/squid.mk
+++ b/package/squid/squid.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SQUID_VERSION = 7.5
+SQUID_VERSION = 7.6
 SQUID_SOURCE = squid-$(SQUID_VERSION).tar.xz
 SQUID_SITE = https://github.com/squid-cache/squid/releases/download/SQUID_$(subst .,_,$(SQUID_VERSION))
 SQUID_LICENSE = GPL-2.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
