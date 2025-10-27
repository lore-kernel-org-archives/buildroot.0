Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DC74CCF9EB
	for <buildroot@archiver.kernel.org>; Mon, 27 Oct 2025 20:47:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0FE51844A3;
	Mon, 27 Oct 2025 20:47:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o_jsiMWrU8CX; Mon, 27 Oct 2025 20:47:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9035F84499
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9035F84499;
	Mon, 27 Oct 2025 20:47:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 56A7770B
 for <buildroot@buildroot.org>; Mon, 27 Oct 2025 20:47:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 488B5613F1
 for <buildroot@buildroot.org>; Mon, 27 Oct 2025 20:47:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wA0322ol6a5C for <buildroot@buildroot.org>;
 Mon, 27 Oct 2025 20:47:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7744B613EE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7744B613EE
 for <buildroot@buildroot.org>; Mon, 27 Oct 2025 20:47:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 67CDD8790F; Mon, 27 Oct 2025 20:47:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 27 Oct 2025 21:44:37 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d81922c1ef8825f10b802984d9721412a1a1a377
X-Git-Newrev: 50954cc5e00e8ba1ad0768c9f45aabd8a2897eff
X-Patchwork-Hint: ignore
Message-Id: <20251027204719.67CDD8790F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libxslt: security bump version to
 1.1.43
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

commit: https://git.buildroot.net/buildroot/commit/?id=50954cc5e00e8ba1ad0768c9f45aabd8a2897eff
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://download.gnome.org/sources/libxslt/1.1/libxslt-1.1.43.news

Fixes CVE-2025-24855 & CVE-2024-55549.

Switched _LICENSE_FILES to Copyright due to upstream commit
https://gitlab.gnome.org/GNOME/libxslt/-/commit/29938a64f6449aceb3e97a9e8da10abe2e27a314
in version 1.1.36 and the removal of COPYING in the 1.1.43 tarball,
although COPYING did still exist in the 1.1.42 tarball.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
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
