Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6312AC3ABC9
	for <buildroot@archiver.kernel.org>; Sun, 18 May 2025 13:31:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1BC9A4092D;
	Sun, 18 May 2025 13:31:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id to-ZH2NKR0EE; Sun, 18 May 2025 13:31:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 427464092A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 427464092A;
	Sun, 18 May 2025 13:31:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6F47D1BA
 for <buildroot@buildroot.org>; Sun, 18 May 2025 13:31:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6044E6064D
 for <buildroot@buildroot.org>; Sun, 18 May 2025 13:31:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0o3ngpqoqyK7 for <buildroot@buildroot.org>;
 Sun, 18 May 2025 13:31:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 999826064A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 999826064A
 for <buildroot@buildroot.org>; Sun, 18 May 2025 13:31:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 863B08700D; Sun, 18 May 2025 13:31:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 18 May 2025 15:31:25 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7acb67fc2ba42428f724445b412a46b75bc4ecf0
X-Git-Newrev: 61343ed57a4bd4035f77ec9562c198f8c8ead173
X-Patchwork-Hint: ignore
Message-Id: <20250518133140.863B08700D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/alsa-utils: remove autoreconf
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=61343ed57a4bd4035f77ec9562c198f8c8ead173
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Buildroot commit 96a7db5a4b7526ecf744d89d9c19986b91626325 removed
0011-configure.ac-fix-UMP-support-detection.patch but forgot to remove
ALSA_UTILS_AUTORECONF = YES as well.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/alsa-utils/alsa-utils.mk | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/alsa-utils/alsa-utils.mk b/package/alsa-utils/alsa-utils.mk
index 382d178c7f..cb5129ece3 100644
--- a/package/alsa-utils/alsa-utils.mk
+++ b/package/alsa-utils/alsa-utils.mk
@@ -9,8 +9,6 @@ ALSA_UTILS_SOURCE = alsa-utils-$(ALSA_UTILS_VERSION).tar.bz2
 ALSA_UTILS_SITE = https://www.alsa-project.org/files/pub/utils
 ALSA_UTILS_LICENSE = GPL-2.0
 ALSA_UTILS_LICENSE_FILES = COPYING
-# 0011-configure.ac-fix-UMP-support-detection.patch
-ALSA_UTILS_AUTORECONF = YES
 ALSA_UTILS_INSTALL_STAGING = YES
 ALSA_UTILS_DEPENDENCIES = host-pkgconf alsa-lib \
 	$(if $(BR2_PACKAGE_NCURSES),ncurses) \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
