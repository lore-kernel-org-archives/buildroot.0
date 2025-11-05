Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 826B3CE8D6B
	for <buildroot@archiver.kernel.org>; Mon, 17 Nov 2025 19:51:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8E599405C9;
	Mon, 17 Nov 2025 19:51:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GqRpqW6EpNI8; Mon, 17 Nov 2025 19:51:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4B992406DB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4B992406DB;
	Mon, 17 Nov 2025 19:51:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3BDA5158
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 19:51:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2222740436
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 19:51:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k6LQK_j4hSt4 for <buildroot@buildroot.org>;
 Mon, 17 Nov 2025 19:51:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F29BF40567
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id F29BF40567
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 19:51:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EE3DC81EA4; Mon, 17 Nov 2025 19:51:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 5 Nov 2025 16:38:52 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: e887ad6985c68159115482a2cf1662917873245c
X-Git-Newrev: 4db9a46243eea0e7c4e3f852d57a6878ce01ce1a
X-Patchwork-Hint: ignore
Message-Id: <20251117195125.EE3DC81EA4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libxslt: security
 bump version to 1.1.43
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=4db9a46243eea0e7c4e3f852d57a6878ce01ce1a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Release notes:
https://download.gnome.org/sources/libxslt/1.1/libxslt-1.1.43.news

Fixes CVE-2025-24855 & CVE-2024-55549.

Switched _LICENSE_FILES to Copyright due to upstream commit
https://gitlab.gnome.org/GNOME/libxslt/-/commit/29938a64f6449aceb3e97a9e8da10abe2e27a314
in version 1.1.36 and the removal of COPYING in the 1.1.43 tarball,
although COPYING did still exist in the 1.1.42 tarball.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 50954cc5e00e8ba1ad0768c9f45aabd8a2897eff)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/libxslt/libxslt.hash | 6 +++---
 package/libxslt/libxslt.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/libxslt/libxslt.hash b/package/libxslt/libxslt.hash
index dd67940c8a..98c68eded1 100644
--- a/package/libxslt/libxslt.hash
+++ b/package/libxslt/libxslt.hash
@@ -1,5 +1,5 @@
-# From https://download.gnome.org/sources/libxslt/1.1/libxslt-1.1.42.sha256sum
-sha256  85ca62cac0d41fc77d3f6033da9df6fd73d20ea2fc18b0a3609ffb4110e1baeb  libxslt-1.1.42.tar.xz
+# From https://download.gnome.org/sources/libxslt/1.1/libxslt-1.1.43.sha256sum
+sha256  5a3d6b383ca5afc235b171118e90f5ff6aa27e9fea3303065231a6d403f0183a  libxslt-1.1.43.tar.xz
 
 # Hash for license file:
-sha256  7e48e290b6bfccc2ec1b297023a1d77f2fd87417f71fbb9f50aabef40a851819  COPYING
+sha256  7e48e290b6bfccc2ec1b297023a1d77f2fd87417f71fbb9f50aabef40a851819  Copyright
diff --git a/package/libxslt/libxslt.mk b/package/libxslt/libxslt.mk
index b5bb22f9ae..e92b383b89 100644
--- a/package/libxslt/libxslt.mk
+++ b/package/libxslt/libxslt.mk
@@ -4,12 +4,12 @@
 #
 ################################################################################
 
-LIBXSLT_VERSION = 1.1.42
+LIBXSLT_VERSION = 1.1.43
 LIBXSLT_SOURCE = libxslt-$(LIBXSLT_VERSION).tar.xz
 LIBXSLT_SITE = https://download.gnome.org/sources/libxslt/1.1
 LIBXSLT_INSTALL_STAGING = YES
 LIBXSLT_LICENSE = MIT
-LIBXSLT_LICENSE_FILES = COPYING
+LIBXSLT_LICENSE_FILES = Copyright
 LIBXSLT_CPE_ID_VENDOR = xmlsoft
 
 LIBXSLT_CONF_OPTS = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
