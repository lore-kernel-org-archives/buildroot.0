Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBBEBC7115B
	for <buildroot@archiver.kernel.org>; Thu, 19 Jun 2025 18:51:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7DFF060DA3;
	Thu, 19 Jun 2025 18:51:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EfKfEEN3kVly; Thu, 19 Jun 2025 18:51:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9B70160D8D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9B70160D8D;
	Thu, 19 Jun 2025 18:51:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8DB8FE2
 for <buildroot@buildroot.org>; Thu, 19 Jun 2025 18:51:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 784E44076F
 for <buildroot@buildroot.org>; Thu, 19 Jun 2025 18:51:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XfqoASyaf1MW for <buildroot@buildroot.org>;
 Thu, 19 Jun 2025 18:51:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B4CCE40767
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B4CCE40767
 for <buildroot@buildroot.org>; Thu, 19 Jun 2025 18:51:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A7D8C83BD2; Thu, 19 Jun 2025 18:51:47 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Thu, 19 Jun 2025 20:50:59 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6cf4f6cdb663d224bef0b96fedc183b27781a28b
X-Git-Newrev: e374ae03b5cc7f4c99af2b0079f0051e78dbb1ac
X-Patchwork-Hint: ignore
Message-Id: <20250619185147.A7D8C83BD2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/squashfs: update URL to source
 archive after Github changes
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

commit: https://git.buildroot.net/buildroot/commit/?id=e374ae03b5cc7f4c99af2b0079f0051e78dbb1ac
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The squashfs 4.6.1 archive hash has been changed suddenly two weeks
ago by Github without any intended changes from the squashfs maintainer
[1].

The orginal squashfs 4.6.1 archive has been manually uploaded again.

Update the URL to download the archive that match the expected hash.

Since we don't use the github download helper anymore, the squashfs
archive name is changed from squashfs-4.6.1.tar.gz to
squashfs-tools-4.6.1.tar.gz.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/10355448207
(and many more...)

See:
[1] https://github.com/plougher/squashfs-tools/issues/313

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/squashfs/squashfs.hash | 2 +-
 package/squashfs/squashfs.mk   | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/squashfs/squashfs.hash b/package/squashfs/squashfs.hash
index bc45b4ab5e..c921d638bb 100644
--- a/package/squashfs/squashfs.hash
+++ b/package/squashfs/squashfs.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  94201754b36121a9f022a190c75f718441df15402df32c2b520ca331a107511c  squashfs-4.6.1.tar.gz
+sha256  94201754b36121a9f022a190c75f718441df15402df32c2b520ca331a107511c  squashfs-tools-4.6.1.tar.gz
 
 # License files
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/squashfs/squashfs.mk b/package/squashfs/squashfs.mk
index b9fbf54b01..f2cb0ab25e 100644
--- a/package/squashfs/squashfs.mk
+++ b/package/squashfs/squashfs.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 SQUASHFS_VERSION = 4.6.1
-SQUASHFS_SITE = $(call github,plougher,squashfs-tools,$(SQUASHFS_VERSION))
+SQUASHFS_SOURCE = squashfs-tools-$(SQUASHFS_VERSION).tar.gz
+SQUASHFS_SITE = https://github.com/plougher/squashfs-tools/releases/download/$(SQUASHFS_VERSION)
 SQUASHFS_LICENSE = GPL-2.0+
 SQUASHFS_LICENSE_FILES = COPYING
 SQUASHFS_CPE_ID_VALID = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
