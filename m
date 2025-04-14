Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CD40C2D0CD
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 10:50:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 38E186FC69;
	Mon, 19 May 2025 10:50:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mILcAaQd3iIz; Mon, 19 May 2025 10:50:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3620C6FC78
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3620C6FC78;
	Mon, 19 May 2025 10:50:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 13C3C193
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:42:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BFCCB40EC2
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:39:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p47MsVr__Nkp for <buildroot@buildroot.org>;
 Mon, 19 May 2025 10:39:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E7E2840DC5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E7E2840DC5
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:39:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E5E8D83B63; Mon, 19 May 2025 10:39:49 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon, 14 Apr 2025 20:15:46 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 1d2f135ef1fc722d61d0b3df193eb5986aea397f
X-Git-Newrev: 81b049f829181b0bfef08db6f5c17e2482b4e5be
X-Patchwork-Hint: ignore
Message-Id: <20250519103949.E5E8D83B63@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/sysklogd: bump to
 v2.7.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=81b049f829181b0bfef08db6f5c17e2482b4e5be
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

From https://github.com/troglobit/sysklogd/releases/tag/v2.7.2

 - logger: improved error handling for invalid arguments to -p and -o
 - Fix regression in v2.7.1,  allow '.' in tag names, eg. in.tftpd
 - Fix various typos in the documentation

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/sysklogd/sysklogd.hash | 4 ++--
 package/sysklogd/sysklogd.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/sysklogd/sysklogd.hash b/package/sysklogd/sysklogd.hash
index 645bc6a0ae..c74d7f9ba6 100644
--- a/package/sysklogd/sysklogd.hash
+++ b/package/sysklogd/sysklogd.hash
@@ -1,4 +1,4 @@
-# Upstream .sha256 from https://github.com/troglobit/sysklogd/releases/tag/v2.7.1
-sha256  69944b2227647bf47ee01c9f482d19a79dbf2b53b8ce8ded0486b08db8c68c40  sysklogd-2.7.1.tar.gz
+# Upstream .sha256 from https://github.com/troglobit/sysklogd/releases/tag/v2.7.2
+sha256  bc410ca64551a11fac6518b418fb6b8afbd888a70af2c5eb353334a706727bca  sysklogd-2.7.2.tar.gz
 # Locally calculated
 sha256  7a71d7603a7c4456df441463e54da35acf151c1be0879246de63544f1f34f477  LICENSE
diff --git a/package/sysklogd/sysklogd.mk b/package/sysklogd/sysklogd.mk
index a3e27fd17b..baafc38083 100644
--- a/package/sysklogd/sysklogd.mk
+++ b/package/sysklogd/sysklogd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SYSKLOGD_VERSION = 2.7.1
+SYSKLOGD_VERSION = 2.7.2
 SYSKLOGD_SITE = https://github.com/troglobit/sysklogd/releases/download/v$(SYSKLOGD_VERSION)
 SYSKLOGD_LICENSE = BSD-3-Clause
 SYSKLOGD_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
