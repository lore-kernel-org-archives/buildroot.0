Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C0F0C27C4F
	for <buildroot@archiver.kernel.org>; Sat, 15 Jun 2024 19:04:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 430B840603;
	Sat, 15 Jun 2024 19:04:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BzVqL2shlm14; Sat, 15 Jun 2024 19:04:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D33964060E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D33964060E;
	Sat, 15 Jun 2024 19:04:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 910261BF86B
 for <buildroot@lists.busybox.net>; Sat, 15 Jun 2024 19:04:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7F4EE607BB
 for <buildroot@lists.busybox.net>; Sat, 15 Jun 2024 19:04:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q3FhyqD1QaNj for <buildroot@lists.busybox.net>;
 Sat, 15 Jun 2024 19:04:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 875BB6061B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 875BB6061B
 for <buildroot@buildroot.org>; Sat, 15 Jun 2024 19:04:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7E27287F0B; Sat, 15 Jun 2024 19:04:15 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 13 Jun 2024 16:49:12 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 02575ff4d678dc90cb808ca1585dea10412e5d29
X-Git-Newrev: ae837f1e64c5108e345c1462644083951769b8e3
X-Patchwork-Hint: ignore
Message-Id: <20240615190415.7E27287F0B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/liblockfile: drop
 empty patch tarball
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

commit: https://git.buildroot.net/buildroot/commit/?id=ae837f1e64c5108e345c1462644083951769b8e3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

The Debian control aarchive does not contain any patch for liblockfile
1.17; it has had no patch since Debian packaged version 1.16-1.1.

Drop the path tarball now.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
[Arnout: also drop from hash file]
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit f84c8d17168fe0f5dcf3d57d4c2a1e4f08b79f18)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/liblockfile/liblockfile.hash | 1 -
 package/liblockfile/liblockfile.mk   | 1 -
 2 files changed, 2 deletions(-)

diff --git a/package/liblockfile/liblockfile.hash b/package/liblockfile/liblockfile.hash
index c2cacd6fed..b78a3b3787 100644
--- a/package/liblockfile/liblockfile.hash
+++ b/package/liblockfile/liblockfile.hash
@@ -1,6 +1,5 @@
 # From https://snapshot.debian.org/archive/debian/20210128T210947Z/pool/main/libl/liblockfile/liblockfile_1.17-1.dsc
 sha256  6e937f3650afab4aac198f348b89b1ca42edceb17fb6bb0918f642143ccfd15e  liblockfile_1.17.orig.tar.gz
-sha256  e3657c0e3facfeccb58900c0b48d56cd68ad5f9f24d1b4c6eaa69c26490fb673  liblockfile_1.17-1.debian.tar.bz2
 # Locally computed
 sha256  3d080ab931103a823e6b9b788ccbc3e9d44797bd54546f3feebfd305f90de46a  COPYRIGHT
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  licenses/GPL-2
diff --git a/package/liblockfile/liblockfile.mk b/package/liblockfile/liblockfile.mk
index f472809ebc..6535634efa 100644
--- a/package/liblockfile/liblockfile.mk
+++ b/package/liblockfile/liblockfile.mk
@@ -7,7 +7,6 @@
 LIBLOCKFILE_VERSION = 1.17
 LIBLOCKFILE_SOURCE = liblockfile_$(LIBLOCKFILE_VERSION).orig.tar.gz
 LIBLOCKFILE_SITE = http://snapshot.debian.org/archive/debian/20210128T210947Z/pool/main/libl/liblockfile
-LIBLOCKFILE_PATCH = liblockfile_$(LIBLOCKFILE_VERSION)-1.debian.tar.bz2
 
 LIBLOCKFILE_LICENSE = LGPL-2.0+, GPL-2.0+ (dotlockfile)
 LIBLOCKFILE_LICENSE_FILES = COPYRIGHT licenses/GPL-2 licenses/LGPL-2
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
