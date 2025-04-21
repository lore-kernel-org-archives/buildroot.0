Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6D3BC369D6
	for <buildroot@archiver.kernel.org>; Mon, 21 Apr 2025 15:36:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 649C260AF6;
	Mon, 21 Apr 2025 15:36:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Sv1Ejr4UIgrn; Mon, 21 Apr 2025 15:36:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8172860B09
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8172860B09;
	Mon, 21 Apr 2025 15:36:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 492161C0
 for <buildroot@buildroot.org>; Mon, 21 Apr 2025 15:36:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 66BC2406C8
 for <buildroot@buildroot.org>; Mon, 21 Apr 2025 15:36:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V1VlLwH-Bq8A for <buildroot@buildroot.org>;
 Mon, 21 Apr 2025 15:36:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AF7064073C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id AF7064073C
 for <buildroot@buildroot.org>; Mon, 21 Apr 2025 15:36:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AC1C785FA5; Mon, 21 Apr 2025 15:36:10 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon, 21 Apr 2025 16:25:41 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1065fe66023c84b4f5427729a3e09e5c0675e6a2
X-Git-Newrev: 7f104812bf494bab7eb0287daaa1175a5fff1025
X-Patchwork-Hint: ignore
Message-Id: <20250421153610.AC1C785FA5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tig: bump version to 2.5.12
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

commit: https://git.buildroot.net/buildroot/commit/?id=7f104812bf494bab7eb0287daaa1175a5fff1025
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For change log since 2.5.10, see:
https://github.com/jonas/tig/releases/tag/tig-2.5.11
https://github.com/jonas/tig/releases/tag/tig-2.5.12

The autoconf configure script of this new version (generated with
autoconf 2.72) now requires pkg-config. Therefore, this commit also
adds host-pkgconf in _DEPENDENCIES.

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/tig/tig.hash | 4 ++--
 package/tig/tig.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/tig/tig.hash b/package/tig/tig.hash
index b5aebb9c5d..4329723f9e 100644
--- a/package/tig/tig.hash
+++ b/package/tig/tig.hash
@@ -1,6 +1,6 @@
 # From:
-# https://github.com/jonas/tig/releases/download/tig-2.5.10/tig-2.5.10.tar.gz.sha256
-sha256  f655cc1366fc10058a2bd505bb88ca78e653ff7526c1b81774c44b9d841210e3  tig-2.5.10.tar.gz
+# https://github.com/jonas/tig/releases/download/tig-2.5.12/tig-2.5.12.tar.gz.sha256
+sha256  5dda8a098810bb499096e17fc9f69c0a5915a23f46be27209fc8195d7a792108  tig-2.5.12.tar.gz
 
 # Locally calculated
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/tig/tig.mk b/package/tig/tig.mk
index d3aa6df62a..58084bc758 100644
--- a/package/tig/tig.mk
+++ b/package/tig/tig.mk
@@ -4,12 +4,12 @@
 #
 ################################################################################
 
-TIG_VERSION = 2.5.10
+TIG_VERSION = 2.5.12
 TIG_SITE = https://github.com/jonas/tig/releases/download/tig-$(TIG_VERSION)
 TIG_LICENSE = GPL-2.0+
 TIG_LICENSE_FILES = COPYING
 
-TIG_DEPENDENCIES = ncurses
+TIG_DEPENDENCIES = host-pkgconf ncurses
 
 ifeq ($(BR2_PACKAGE_LIBICONV),y)
 TIG_DEPENDENCIES += libiconv
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
