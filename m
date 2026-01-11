Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C704D2502D
	for <buildroot@archiver.kernel.org>; Sun, 11 Jan 2026 17:26:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C14DB812E9;
	Sun, 11 Jan 2026 17:26:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id alDmsyvnpiwF; Sun, 11 Jan 2026 17:26:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E469F81263
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768152413;
	bh=bxiSs/0WKWF5KSn17LlGK6RS35VQskligvWBQ66Boxw=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Ikh6Pk8X5JhzwyRTuknuTFhHIdYRjZoA4UAMrHANCrWACBeEqbxsCDr0w2Ixy2xMS
	 jtvbDy1wwizggA8BQAW8T51nSXKk/QJNM/XPEWNiqZBH4puFpEBmnLAhNpRXMSRP22
	 qRjZh0ssuWy01HxV2+giauGYgH5vCzcZDUpBjnHU7ichxB6VWbDF6KFVf2CnbNRh7+
	 WlT1heNDbRyYk9wjAqpA2nrtTsk5+fNvJjBOoK3u+GHzJsCHRSEoQl3X1F2ToZFjct
	 QyPnumqy94+1u1a5sKnbWPRCwT98zz9mkiFYy0XYeEBbHEWteKE0iYP/lIjcl30JAd
	 S7ii6f5AJ2Sdw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E469F81263;
	Sun, 11 Jan 2026 17:26:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id B9CF4231
 for <buildroot@buildroot.org>; Sun, 11 Jan 2026 17:26:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B74506085B
 for <buildroot@buildroot.org>; Sun, 11 Jan 2026 17:26:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5NATzO3FI8bl for <buildroot@buildroot.org>;
 Sun, 11 Jan 2026 17:26:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F154860781
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id F154860781
 for <buildroot@buildroot.org>; Sun, 11 Jan 2026 17:26:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E2D68884A5; Sun, 11 Jan 2026 17:26:49 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 11 Jan 2026 18:20:30 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8ddd1462c4fdc0dc3206dbc4bb93edec1703748d
X-Git-Newrev: 13c3e723cee2a2c892c51dee9a10c37dc38d873d
X-Patchwork-Hint: ignore
Message-Id: <20260111172649.E2D68884A5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libarchive: bump version to 3.8.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=13c3e723cee2a2c892c51dee9a10c37dc38d873d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes a bsdtar regression introduced in 3.8.4.

https://github.com/libarchive/libarchive/releases/tag/v3.8.5

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
[Peter: Mention regression fix]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libarchive/libarchive.hash | 6 +++---
 package/libarchive/libarchive.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libarchive/libarchive.hash b/package/libarchive/libarchive.hash
index 1a61d254f7..db7ed95bd9 100644
--- a/package/libarchive/libarchive.hash
+++ b/package/libarchive/libarchive.hash
@@ -1,6 +1,6 @@
-# From https://github.com/libarchive/libarchive/releases/tag/v3.8.4
+# From https://github.com/libarchive/libarchive/releases/tag/v3.8.5
 # After verifying the pgp signature from:
-# https://www.libarchive.de/downloads/libarchive-3.8.4.tar.xz.asc
-sha256  c7b847b57feacf5e182f4d14dd6cae545ac6843d55cb725f58e107cdf1c9ad73  libarchive-3.8.4.tar.xz
+# https://www.libarchive.de/downloads/libarchive-3.8.5.tar.xz.asc
+sha256  d68068e74beee3a0ec0dd04aee9037d5757fcc651591a6dcf1b6d542fb15a703  libarchive-3.8.5.tar.xz
 # Locally computed:
 sha256  30e556b3959e3985d66efefec5eaac51d4995053caa1d3cffe6eb916f146f229  COPYING
diff --git a/package/libarchive/libarchive.mk b/package/libarchive/libarchive.mk
index 083e913033..f3e90e5910 100644
--- a/package/libarchive/libarchive.mk
+++ b/package/libarchive/libarchive.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBARCHIVE_VERSION = 3.8.4
+LIBARCHIVE_VERSION = 3.8.5
 LIBARCHIVE_SOURCE = libarchive-$(LIBARCHIVE_VERSION).tar.xz
 LIBARCHIVE_SITE = https://www.libarchive.de/downloads
 LIBARCHIVE_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
