Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D083C5B549
	for <buildroot@archiver.kernel.org>; Sun,  1 Jun 2025 15:33:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 12A31608F5;
	Sun,  1 Jun 2025 15:33:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AdUZNLc9mHx4; Sun,  1 Jun 2025 15:33:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2C6C8608D1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2C6C8608D1;
	Sun,  1 Jun 2025 15:33:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 120F5127
 for <buildroot@buildroot.org>; Sun,  1 Jun 2025 15:33:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EC27B41C8E
 for <buildroot@buildroot.org>; Sun,  1 Jun 2025 15:33:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oqArYi9xJgqr for <buildroot@buildroot.org>;
 Sun,  1 Jun 2025 15:33:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5CA6F40760
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5CA6F40760
 for <buildroot@buildroot.org>; Sun,  1 Jun 2025 15:33:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 573CA87817; Sun,  1 Jun 2025 15:33:27 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 1 Jun 2025 16:52:59 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 9357dc5694a6566d064175d946546b652cd23d60
X-Git-Newrev: 577c08ca25f6d892db6bc37fcc7f1e9d7a330046
X-Patchwork-Hint: ignore
Message-Id: <20250601153327.573CA87817@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/lvm2: bump to version
 2.03.31
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

commit: https://git.buildroot.net/buildroot/commit/?id=577c08ca25f6d892db6bc37fcc7f1e9d7a330046
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This includes, amongst other things, the restoration of support
for LVM_SUPPRESS_FD_WARNINGS.

For change log, see:
https://gitlab.com/lvmteam/lvm2/-/blob/v2_03_31/WHATS_NEW

Signed-off-by: Stephan Henningsen <stephan@asklandd.dk>
[Julien: add link to change log]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/lvm2/lvm2.hash | 3 ++-
 package/lvm2/lvm2.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/lvm2/lvm2.hash b/package/lvm2/lvm2.hash
index 1abaeb0497..8492c150cd 100644
--- a/package/lvm2/lvm2.hash
+++ b/package/lvm2/lvm2.hash
@@ -1,5 +1,6 @@
 # From https://sourceware.org/ftp/lvm2/sha512.sum
-sha512  02607797f067b2b26d615b9a182ad70017e61d436e3866acf820a04154e503fb59114e9a4540a273d9f570d0337332ca995fb3be83c11eadaca53c1b826eb810  LVM2.2.03.27.tgz
+sha512  254131e28b22d55531d211886afbfdc219e77a4df802e3ec9b66d889ff22bf6d0a6c2df9c5ff017592d92e1dce0f658a6628fb321c1e90152ff7257492218242  LVM2.2.03.31.tgz
+
 # Locally computed sha256 checksums
 sha256  e76fbcd2fb97cf202da330301327754d2db5c58b5b4bebd3a8a749393e7603d1  COPYING
 sha256  5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a  COPYING.LIB
diff --git a/package/lvm2/lvm2.mk b/package/lvm2/lvm2.mk
index 2fc24be60e..3a1dded55f 100644
--- a/package/lvm2/lvm2.mk
+++ b/package/lvm2/lvm2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LVM2_VERSION = 2.03.27
+LVM2_VERSION = 2.03.31
 LVM2_SOURCE = LVM2.$(LVM2_VERSION).tgz
 LVM2_SITE = https://sourceware.org/ftp/lvm2
 LVM2_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
