Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 461ECC83F05
	for <buildroot@archiver.kernel.org>; Sun,  6 Jul 2025 17:25:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 032F560DC4;
	Sun,  6 Jul 2025 17:25:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QvwyWicgGdNj; Sun,  6 Jul 2025 17:25:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3B4AA60A79
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3B4AA60A79;
	Sun,  6 Jul 2025 17:25:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 603B015F
 for <buildroot@buildroot.org>; Sun,  6 Jul 2025 17:25:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 46FFB60ACE
 for <buildroot@buildroot.org>; Sun,  6 Jul 2025 17:25:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UuVDA1afsazo for <buildroot@buildroot.org>;
 Sun,  6 Jul 2025 17:25:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9CC4460A79
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9CC4460A79
 for <buildroot@buildroot.org>; Sun,  6 Jul 2025 17:25:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9323F8605C; Sun,  6 Jul 2025 17:25:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 6 Jul 2025 19:21:40 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 500678593fee1cdf61220f7d32b1ecdf9607afef
X-Git-Newrev: 95985d3524d5d767dd30cdf2308278cfcbbc7cb1
X-Patchwork-Hint: ignore
Message-Id: <20250706172536.9323F8605C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/nilfs-utils: install to staging
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=95985d3524d5d767dd30cdf2308278cfcbbc7cb1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

nilfs-utils provides an "nilfs.h" header file and libnilfs.so that other
packages which depend upon it may require in order to build.

Signed-off-by: Matt Silva <dev@matt-silva.com>
[Romain: add libnilfs.so in commit log]
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 package/nilfs-utils/nilfs-utils.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/nilfs-utils/nilfs-utils.mk b/package/nilfs-utils/nilfs-utils.mk
index 1c8b7e245c..a6ad2953e0 100644
--- a/package/nilfs-utils/nilfs-utils.mk
+++ b/package/nilfs-utils/nilfs-utils.mk
@@ -9,6 +9,7 @@ NILFS_UTILS_SOURCE = nilfs-utils-$(NILFS_UTILS_VERSION).tar.bz2
 NILFS_UTILS_SITE = https://nilfs.sourceforge.io/download
 NILFS_UTILS_LICENSE = GPL-2.0+ (programs), LGPL-2.1+ (libraries)
 NILFS_UTILS_LICENSE_FILES = COPYING
+NILFS_UTILS_INSTALL_STAGING = YES
 
 # need libuuid, libblkid, libmount
 NILFS_UTILS_DEPENDENCIES = util-linux
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
