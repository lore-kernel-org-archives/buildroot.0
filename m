Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC505CCD1BB
	for <buildroot@archiver.kernel.org>; Wed, 22 Oct 2025 16:37:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8D9BB40F59;
	Wed, 22 Oct 2025 16:37:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oyQFhX-rYryD; Wed, 22 Oct 2025 16:37:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7E1E640DAE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7E1E640DAE;
	Wed, 22 Oct 2025 16:36:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 32FD843F
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 16:36:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2FF2F41199
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 16:36:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x7NRSl_yDB2r for <buildroot@buildroot.org>;
 Wed, 22 Oct 2025 16:36:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 581A74109D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 581A74109D
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 16:36:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4757887676; Wed, 22 Oct 2025 16:36:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 22 Oct 2025 18:35:27 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: c9ec6514e5abb3dfc5ac5084eb1f228eb180d00a
X-Git-Newrev: 11f8c9225bbb667b638c1d347ace1b1109f0dd5b
X-Patchwork-Hint: ignore
Message-Id: <20251022163634.4757887676@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libwpe: bump to
 version 1.16.3
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=11f8c9225bbb667b638c1d347ace1b1109f0dd5b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

The main fix is being able to compile with CMake 4.x.

Release notes:
https://wpewebkit.org/release/libwpe-1.16.3.html

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit a91c709867c3504c9f6919638bbfa49bf0be4671)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/libwpe/libwpe.hash | 8 ++++----
 package/libwpe/libwpe.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/libwpe/libwpe.hash b/package/libwpe/libwpe.hash
index 45bba04d35..1c88105e48 100644
--- a/package/libwpe/libwpe.hash
+++ b/package/libwpe/libwpe.hash
@@ -1,7 +1,7 @@
-# From https://wpewebkit.org/releases/libwpe-1.16.2.tar.xz.sums
-md5  689306c9baf6f8d6844146a5c84fc932  libwpe-1.16.2.tar.xz
-sha1  499b62ddd3c1becaffc3b344ff5131c37d527144  libwpe-1.16.2.tar.xz
-sha256  960bdd11c3f2cf5bd91569603ed6d2aa42fd4000ed7cac930a804eac367888d7  libwpe-1.16.2.tar.xz
+# From https://wpewebkit.org/releases/libwpe-1.16.3.tar.xz.sums
+md5  a26e3703d2a35ba3e57436cd6b76a656  libwpe-1.16.3.tar.xz
+sha1  969897ea9b908f92ef0b4f6feaaec74f23425c39  libwpe-1.16.3.tar.xz
+sha256  c880fa8d607b2aa6eadde7d6d6302b1396ebc38368fe2332fa20e193c7ee1420  libwpe-1.16.3.tar.xz
 
 # Hashes for license files:
 sha256  35bef295cedbbf179eaee14328002587a0e7dc08ebf3f15ea080a6f2815f0d7b  COPYING
diff --git a/package/libwpe/libwpe.mk b/package/libwpe/libwpe.mk
index 5721b83784..d8d2caa08a 100644
--- a/package/libwpe/libwpe.mk
+++ b/package/libwpe/libwpe.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # The middle number is even for stable releases, odd for development ones.
-LIBWPE_VERSION = 1.16.2
+LIBWPE_VERSION = 1.16.3
 LIBWPE_SITE = https://wpewebkit.org/releases
 LIBWPE_SOURCE = libwpe-$(LIBWPE_VERSION).tar.xz
 LIBWPE_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
