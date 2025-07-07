Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B59E3C71130
	for <buildroot@archiver.kernel.org>; Mon,  7 Jul 2025 21:09:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 76E054196A;
	Mon,  7 Jul 2025 21:09:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7ynqdrEW-XZd; Mon,  7 Jul 2025 21:09:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9045341914
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9045341914;
	Mon,  7 Jul 2025 21:09:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8F26115F
 for <buildroot@buildroot.org>; Mon,  7 Jul 2025 21:09:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 761CA81C38
 for <buildroot@buildroot.org>; Mon,  7 Jul 2025 21:09:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5OqqXMp7ZLku for <buildroot@buildroot.org>;
 Mon,  7 Jul 2025 21:09:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CDDBD8136B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id CDDBD8136B
 for <buildroot@buildroot.org>; Mon,  7 Jul 2025 21:09:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BD21B8617F; Mon,  7 Jul 2025 21:09:02 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 7 Jul 2025 22:40:10 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fd6e64ad549414636909690d5a19d8f40e03bd43
X-Git-Newrev: cf8ccddaa29d789b3e74912bc67bb9485d0e54f0
X-Patchwork-Hint: ignore
Message-Id: <20250707210902.BD21B8617F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libconfuse: use current upstream
 URL
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

commit: https://git.buildroot.net/buildroot/commit/?id=cf8ccddaa29d789b3e74912bc67bb9485d0e54f0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/martinh/libconfuse/ now redirects to
/libconfuse/libconfuse/, so use that instead in .mk and help text.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libconfuse/Config.in     | 2 +-
 package/libconfuse/libconfuse.mk | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libconfuse/Config.in b/package/libconfuse/Config.in
index b96b8f2811..ee55409010 100644
--- a/package/libconfuse/Config.in
+++ b/package/libconfuse/Config.in
@@ -8,4 +8,4 @@ config BR2_PACKAGE_LIBCONFUSE
 	  environment variable expansion, functions and nested include
 	  statements.
 
-	  https://github.com/martinh/libconfuse/
+	  https://github.com/libconfuse/libconfuse
diff --git a/package/libconfuse/libconfuse.mk b/package/libconfuse/libconfuse.mk
index 76123a7e6b..fff684a55b 100644
--- a/package/libconfuse/libconfuse.mk
+++ b/package/libconfuse/libconfuse.mk
@@ -6,7 +6,7 @@
 
 LIBCONFUSE_VERSION = 3.3
 LIBCONFUSE_SOURCE = confuse-$(LIBCONFUSE_VERSION).tar.xz
-LIBCONFUSE_SITE = https://github.com/martinh/libconfuse/releases/download/v$(LIBCONFUSE_VERSION)
+LIBCONFUSE_SITE = https://github.com/libconfuse/libconfuse/releases/download/v$(LIBCONFUSE_VERSION)
 LIBCONFUSE_INSTALL_STAGING = YES
 LIBCONFUSE_CONF_OPTS = --disable-rpath
 LIBCONFUSE_LICENSE = ISC
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
