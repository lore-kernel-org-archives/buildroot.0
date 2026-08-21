Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3807C5DF89
	for <buildroot@archiver.kernel.org>; Fri, 21 Aug 2026 15:07:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 04010811C1;
	Fri, 21 Aug 2026 15:07:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vc7GjW2_wrJY; Fri, 21 Aug 2026 15:07:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787324847;
	bh=KGVtgLEn/C70T780YD3BiviA7aWuqQT27cGJnZGm7S4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=FvH4JcnkOscy+obI7HlV9nUg38whwCYPXEHb+q2azmIJgWIFtfqqPfLAoa8UCkogO
	 UOYtWaSGj4cl50ILZzrQtmv+RnlWfqKYXCm7V4pHX6w7jn7VmNsBDMCSw+MvVe2H0Y
	 f+7IpQLmWVJ7PwwvY37n5gAhV5qUQ9YUctsBCsRSPvx7uAyaaOj/crqq++XBe7Z59s
	 SphWBzczOrbCPqyYov3YBrUY7KkA5l4GpBbhniavrphzYdsKZ5j+hcqf4OTvsJfZzn
	 yEtnpF3bpYanhOxNn0kLZ88zfNzXInWuDfyPDdqiR/MNKjaaRzmorTNXFTs5HqRCsX
	 BMy91lYrAg8pg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C169D811D9;
	Fri, 21 Aug 2026 15:07:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 02D891F4B
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 15:07:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DD0EB8117C
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 15:07:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f5RMrggaWn3R for <buildroot@buildroot.org>;
 Fri, 21 Aug 2026 15:07:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A1B4E81184
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 15:07:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 15D858E127; Fri, 21 Aug 2026 15:06:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 21 Aug 2026 17:04:18 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 3a5af1b3c0ac801887deeef0d0247f4537df8eff
X-Git-Newrev: 339bd0948ca07941adb47837f2f3027446f308d3
X-Patchwork-Hint: ignore
Message-Id: <20260821150614.15D858E127@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libarchive:
 security bump version to 3.8.9
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/339bd0948ca07941adb47837f2f3027446f308d3
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

https://github.com/libarchive/libarchive/releases/tag/v3.8.9
"Libarchive 3.8.9 is a security, bugfix and minor feature release."

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 6ccc514cdc9c5e698be2493d6583226a5e19a819)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/libarchive/libarchive.hash | 6 +++---
 package/libarchive/libarchive.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libarchive/libarchive.hash b/package/libarchive/libarchive.hash
index dccb2cc4a7..acd4b9ef22 100644
--- a/package/libarchive/libarchive.hash
+++ b/package/libarchive/libarchive.hash
@@ -1,6 +1,6 @@
-# From https://github.com/libarchive/libarchive/releases/tag/v3.8.8
+# From https://github.com/libarchive/libarchive/releases/tag/v3.8.9
 # After verifying the pgp signature from:
-# https://www.libarchive.de/downloads/libarchive-3.8.8.tar.xz.asc
-sha256  3873a88801da067d0528a989af06877710529d50ee8fe6f3970cbb4302efb918  libarchive-3.8.8.tar.xz
+# https://www.libarchive.de/downloads/libarchive-3.8.9.tar.xz.asc
+sha256  888c934f9d95648ecb9163dc8e23ab80a476ecb81a8f1154704a227b5b676dde  libarchive-3.8.9.tar.xz
 # Locally computed:
 sha256  30e556b3959e3985d66efefec5eaac51d4995053caa1d3cffe6eb916f146f229  COPYING
diff --git a/package/libarchive/libarchive.mk b/package/libarchive/libarchive.mk
index 23cb82f7b5..5b6aea3407 100644
--- a/package/libarchive/libarchive.mk
+++ b/package/libarchive/libarchive.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBARCHIVE_VERSION = 3.8.8
+LIBARCHIVE_VERSION = 3.8.9
 LIBARCHIVE_SOURCE = libarchive-$(LIBARCHIVE_VERSION).tar.xz
 LIBARCHIVE_SITE = https://www.libarchive.de/downloads
 LIBARCHIVE_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
