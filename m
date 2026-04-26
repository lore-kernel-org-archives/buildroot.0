Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C91EFFF885E
	for <buildroot@archiver.kernel.org>; Sun, 26 Apr 2026 16:59:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 803A642A2A;
	Sun, 26 Apr 2026 16:59:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u2ZYju6d1e4t; Sun, 26 Apr 2026 16:59:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B116942A27
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777222778;
	bh=lE5WfpS+7zthspdojofEi93ZlmcBHbAvXIAyXei4mjE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=DiLLjjgewyiV9FvVYRLcF1f/nKlvdTa7vhUETX5vVOU//gWfLEqFVbdTjQrE7oKP5
	 AT2RTskZ8w6Aip2w8i36vIj52kxDAWtNLvOZnhEIsChJod5WKI28QZTCU9/y+/seJj
	 occqbtisR+79poYrZaiUrH/soWArq88+fi+Lqfs99Hhb8UKf3KygucXAsZmnMT1jkS
	 mlsRdc+Trni9eFWuGRQCVudGdt0JhZpibfxnG7zWueL7NKZ0hsTVKref2LAeO2dMBL
	 X5ziJxmH+bmeDpykAEx5VPAsaDTH5fsphqFDw9yGorOfindx4LHFM6B/K67euDwhNP
	 /ntCI7jeORy0Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B116942A27;
	Sun, 26 Apr 2026 16:59:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4F89D1B8
 for <buildroot@buildroot.org>; Sun, 26 Apr 2026 16:59:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3519942A27
 for <buildroot@buildroot.org>; Sun, 26 Apr 2026 16:59:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id miDHrm1DjbwX for <buildroot@buildroot.org>;
 Sun, 26 Apr 2026 16:59:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6DC1942A26
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6DC1942A26
 for <buildroot@buildroot.org>; Sun, 26 Apr 2026 16:59:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1F6A3836C2; Sun, 26 Apr 2026 16:59:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 26 Apr 2026 18:48:11 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 316f0eed459e1d63b6c1fd4de5d1f43d8f00e651
X-Git-Newrev: c0af256522464f00b7653c334c9483085282d97b
X-Patchwork-Hint: ignore
Message-Id: <20260426165936.1F6A3836C2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ccache: bump version to 4.13.4
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c0af256522464f00b7653c334c9483085282d97b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://ccache.dev/releasenotes.html#_ccache_4_13_4

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/ccache/ccache.hash | 4 ++--
 package/ccache/ccache.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/ccache/ccache.hash b/package/ccache/ccache.hash
index e69897473d..f4c81bbe4c 100644
--- a/package/ccache/ccache.hash
+++ b/package/ccache/ccache.hash
@@ -1,5 +1,5 @@
-# From https://github.com/ccache/ccache/releases/tag/v4.13.3
-sha256  1aefc18ba43c237723d224eeecfe47fd0fc7d3c93ccdda31a619b8eb90c3e470  ccache-4.13.3.tar.xz
+# From https://github.com/ccache/ccache/releases/tag/v4.13.4
+sha256  4a7ef278b39d031b9ec524c0778d24bdb3e761940ed368060b54594f15559537  ccache-4.13.4.tar.xz
 # sha256 computed locally
 sha256  80b5112739a423dfac7bed1ca8a1df3cccda3d794425441997d4462b83db4dd5  GPL-3.0.txt
 sha256  072c40891d4ec8e1bcc93420031ebbbeb90b8f2c49fcd7c872d1bb05564c345c  LICENSE.adoc
diff --git a/package/ccache/ccache.mk b/package/ccache/ccache.mk
index e4156feb55..744d962abc 100644
--- a/package/ccache/ccache.mk
+++ b/package/ccache/ccache.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CCACHE_VERSION = 4.13.3
+CCACHE_VERSION = 4.13.4
 CCACHE_SITE = https://github.com/ccache/ccache/releases/download/v$(CCACHE_VERSION)
 CCACHE_SOURCE = ccache-$(CCACHE_VERSION).tar.xz
 CCACHE_LICENSE = GPL-3.0+, others
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
