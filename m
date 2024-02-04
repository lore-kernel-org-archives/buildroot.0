Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B4BCC48286
	for <buildroot@archiver.kernel.org>; Sun,  4 Feb 2024 10:35:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BFD5784F26;
	Sun,  4 Feb 2024 10:35:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BFD5784F26
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cweYTM8szFzo; Sun,  4 Feb 2024 10:35:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 22BC584414;
	Sun,  4 Feb 2024 10:35:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 22BC584414
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A04A41BF57F
 for <buildroot@lists.busybox.net>; Sun,  4 Feb 2024 10:35:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6928D60FCA
 for <buildroot@lists.busybox.net>; Sun,  4 Feb 2024 10:35:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6928D60FCA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yt3blnXKbu_3 for <buildroot@lists.busybox.net>;
 Sun,  4 Feb 2024 10:35:13 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A181460FB2
 for <buildroot@buildroot.org>; Sun,  4 Feb 2024 10:35:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A181460FB2
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 88AD9868E1; Sun,  4 Feb 2024 10:35:13 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 4 Feb 2024 11:29:49 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a01deb6617ff38914f649f88c71e7c0c5ee71b01
X-Git-Newrev: 6460074bbfef7663d5ed0ec9f9fa96a6fcc6973c
X-Patchwork-Hint: ignore
Message-Id: <20240204103513.88AD9868E1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/nfs-utils: drop
 NFS_UTILS_AUTORECONF
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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

commit: https://git.buildroot.net/buildroot/commit/?id=6460074bbfef7663d5ed0ec9f9fa96a6fcc6973c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 63332c33aa0771532807fd2684d4eee4eb952435 wrongly set
NFS_UTILS_AUTORECONF

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/nfs-utils/nfs-utils.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/nfs-utils/nfs-utils.mk b/package/nfs-utils/nfs-utils.mk
index a11ba154ad..4f2b41c782 100644
--- a/package/nfs-utils/nfs-utils.mk
+++ b/package/nfs-utils/nfs-utils.mk
@@ -11,7 +11,6 @@ NFS_UTILS_LICENSE = GPL-2.0+
 NFS_UTILS_LICENSE_FILES = COPYING
 NFS_UTILS_DEPENDENCIES = host-nfs-utils host-pkgconf libevent libtirpc sqlite util-linux
 NFS_UTILS_CPE_ID_VENDOR = linux-nfs
-NFS_UTILS_AUTORECONF = YES
 
 NFS_UTILS_CONF_ENV = knfsd_cv_bsd_signals=no
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
