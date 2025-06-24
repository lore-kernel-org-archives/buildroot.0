Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F22F4C7EE31
	for <buildroot@archiver.kernel.org>; Thu, 26 Jun 2025 19:13:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A3F274191C;
	Thu, 26 Jun 2025 19:13:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YojkhF9FJgkq; Thu, 26 Jun 2025 19:13:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E48DB4191D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E48DB4191D;
	Thu, 26 Jun 2025 19:13:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 605D5154
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 19:13:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5258260782
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 19:13:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 28UxdnTsxTTh for <buildroot@buildroot.org>;
 Thu, 26 Jun 2025 19:13:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7A1CD60767
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7A1CD60767
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 19:13:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 779878454B; Thu, 26 Jun 2025 19:13:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 24 Jun 2025 21:00:19 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 3045f77545ccf6ae788bc844143808700d4ae189
X-Git-Newrev: 54a1ed543f9d1bc546c1c6b9949cf76489590f27
X-Patchwork-Hint: ignore
Message-Id: <20250626191316.779878454B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libblockdev:
 security bump to version 3.3.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=54a1ed543f9d1bc546c1c6b9949cf76489590f27
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

This version fixes CVE-2025-6019, see:
https://github.com/storaged-project/libblockdev/blob/3.3.1/NEWS.rst

Fixes:
https://www.cve.org/CVERecord?id=CVE-2025-6019

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
[Julien: add link to CVE]
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 0233c854b1845e0070179439a74b3b5245a4b01b)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/libblockdev/libblockdev.hash | 2 +-
 package/libblockdev/libblockdev.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libblockdev/libblockdev.hash b/package/libblockdev/libblockdev.hash
index dd6f8b1a27..38450c656d 100644
--- a/package/libblockdev/libblockdev.hash
+++ b/package/libblockdev/libblockdev.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  c4738e1abedefffe886521f9f0e7a9306c6f50f7691d88e011438c88608bdfa7  libblockdev-3.3.0.tar.gz
+sha256  a2e2e448a19d420480b8cce5e0752197482a65cb62a9ed55d88b237da36600d1  libblockdev-3.3.1.tar.gz
 sha256  97bdc721d875501b6243a456333fdfdb1ab64d31c4da2554de845caf4674b946  LICENSE
diff --git a/package/libblockdev/libblockdev.mk b/package/libblockdev/libblockdev.mk
index 265cee2e28..ecee8dee24 100644
--- a/package/libblockdev/libblockdev.mk
+++ b/package/libblockdev/libblockdev.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBBLOCKDEV_VERSION = 3.3.0
+LIBBLOCKDEV_VERSION = 3.3.1
 LIBBLOCKDEV_SITE = https://github.com/storaged-project/libblockdev/releases/download/$(LIBBLOCKDEV_VERSION)
 LIBBLOCKDEV_LICENSE = LGPL-2.1
 LIBBLOCKDEV_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
